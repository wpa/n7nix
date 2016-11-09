#!/bin/bash

myname="`basename $0`"

# make sure we're running as root
if [[ $EUID != 0 ]] ; then
   echo "$myname: Must be root"
   exit 1
fi

# configure ax25
source ../ax25/install.sh

# configure direwolf
source ../direwolf/install.sh

# configure systemd
pushd ../systemd
source ./install.sh
popd

# install rmsgw
pushd ../rmsgw
source ./install.sh
popd

# configure rmsgw
source ../rmsgw/config.sh

echo "app install script FINISHED"