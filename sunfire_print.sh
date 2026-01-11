#!/usr/bin/env bash

set -e

# Configuration
USER="leeyilin"
HOST="stu.comp.nus.edu.sg"
HOME_DIR="/home/l/${USER}"
PRINTER="pstsb" 
# options for printers are "pstsc"

# Copying and Printing sequence
if [ $# -lt 1 ]; then
    echo "Usage: $0 <pdf_file>"
    exit 1
fi

PDF_FILE="$1"

echo "Connecting via ssh..."
ssh "${USER}@${HOST}" exit

if [ -n "$PDF_FILE" ]; then
    echo "Copying ${PDF_FILE}..."
    scp "$PDF_FILE" "${USER}@${HOST}:${HOME_DIR}/"
fi

echo "Sending job to printer ${PRINTER}..."
lpr -P"$PRINTER" "$PDF_FILE"

echo "Done."