Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B96A86612D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 13:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1HDdtAg018275 for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 13:39:55 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id sfSdLTPqmK5Q
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 13:39:55 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1HDdpbJ018272
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 13:39:52 GMT
Message-ID: <1455716391.28376.44.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Feb 2016 13:39:51 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] adt-installer: Drop since its replaced by the extensible SDK
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Feb 2016 13:39:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The extensible SDK replaces adt-installer so this can be removed now,
all future effort in this direction will be placed onto that.

This includes a layer version change so the autobuilder knows when to
stop building adt-installer.

[YOCTO #6404]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/conf/conf-notes.txt b/meta/conf/conf-notes.txt
index 66e6319..2f2932b 100644
--- a/meta/conf/conf-notes.txt
+++ b/meta/conf/conf-notes.txt
@@ -2,7 +2,6 @@ Common targets are:
     core-image-minimal
     core-image-sato
     meta-toolchain
-    adt-installer
     meta-ide-support
 
 You can also run generated qemu images with a command like 'runqemu qemux86'
diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index c2ad07e2..d37aefb 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -9,7 +9,6 @@
 #
 # Please keep this list in alphabetical order.
 #
-DISTRO_PN_ALIAS_pn-adt-installer = "Intel"
 DISTRO_PN_ALIAS_pn-alsa-state = "OE-Core"
 DISTRO_PN_ALIAS_pn-alsa-utils-alsaconf = "OE-Core"
 DISTRO_PN_ALIAS_pn-alsa-utils-scripts = "OE-Core"
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index a892fba..8ee61aa 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_PRIORITY_core = "5"
 
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
-LAYERVERSION_core = "7"
+LAYERVERSION_core = "8"
 
 BBLAYERS_LAYERINDEX_NAME_core = "openembedded-core"
 
diff --git a/meta/recipes-core/meta/meta-world-pkgdata.bb b/meta/recipes-core/meta/meta-world-pkgdata.bb
index 48a9027..3c5db50 100644
--- a/meta/recipes-core/meta/meta-world-pkgdata.bb
+++ b/meta/recipes-core/meta/meta-world-pkgdata.bb
@@ -33,7 +33,7 @@ do_install[noexec] = "1"
 
 do_configure[deptask] = ""
 
-WORLD_PKGDATA_EXCLUDE ?= "adt-installer"
+WORLD_PKGDATA_EXCLUDE ?= ""
 
 python calculate_extra_depends() {
     exclude = '${WORLD_PKGDATA_EXCLUDE}'.split()
diff --git a/meta/recipes-devtools/installer/adt-installer/adt_installer b/meta/recipes-devtools/installer/adt-installer/adt_installer
deleted file mode 100755
index b8cfb2e..0000000
--- a/meta/recipes-devtools/installer/adt-installer/adt_installer
+++ /dev/null
@@ -1,420 +0,0 @@
-#!/bin/bash
-# Yocto ADT Installer
-#
-# Copyright 2010-2011 by Intel Corp.
-#
-# Permission is hereby granted, free of charge, to any person obtaining a copy 
-# of this software and associated documentation files (the "Software"), to deal 
-# in the Software without restriction, including without limitation the rights 
-# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
-# copies of the Software, and to permit persons to whom the Software is 
-# furnished to do so, subject to the following conditions:
-
-# The above copyright notice and this permission notice shall be included in 
-# all copies or substantial portions of the Software.
-
-# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
-# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
-# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
-# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
-# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
-# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
-# THE SOFTWARE.
-
-
-usage ()
-{
-
-  INST_ARCH=`uname -m`
-  INST_OS=`uname -o| tr '[A-Z]' '[a-z]'`
-  INST_KR=`uname -r| tr '[A-Z]' '[a-z]'`
-
-  echo_info "#########################################################################"
-  echo_info "# Welcome to Yocto Application Developement Tools (ADT) Installer"
-  echo_info "# "
-  echo_info "# Host Machine:\t\t\t\t"$INST_ARCH
-  echo_info "# OS info:\t\t\t\t$INST_KR"  
-  echo_info "# Yocto ADT version to be installed:\t$YOCTOADT_VERSION"
-  echo_info "# supported target architectures:\t$YOCTOADT_SUPPORTED_TARGETS"
-  echo_info "# supported target root_fs images:\t$YOCTOADT_SUPPORTED_ROOTFS"
-  echo_info "#########################################################################\n"
-
-  echo_info "Systemwide installation. Installation will occur under $INSTALL_FOLDER\n"
-  echo_info "############################################################################"
-  echo_info "# Your system installation configurations from adt_installer.conf"
-  echo_info "############################################################################"
-
-  echo_info "# Cross toolchains:\t\t$YOCTOADT_TARGETS"
-  echo_info "# Install Qemu:\t\t\t$YOCTOADT_QEMU"
-  echo_info "# Install NFS utilities:\t$YOCTOADT_NFS_UTIL"
-  #echo_info "# Install bitbake + UI:\t\t$YOCTOADT_BITBAKE"
-  #echo_info "# Install metadata:\t$YOCTOADT_METADATA"
-  #echo_info "############################################################################\n"
-
-    echo_info "\n##############################################################################"
-    echo_info "# Your rootfs image(s) and target sysroot selections from adt_installer.conf"
-    echo_info "##############################################################################"
-prompt=1
-for arch_type in $YOCTOADT_TARGETS; do
-  download_images $arch_type $prompt
-done
-    echo_info "############################################################################\n"
-  select_install_type
-}
-
-validate_config()
-{
-
-  for selected_arch_type in $YOCTOADT_TARGETS; do
-    found=0
-    select_machine_var="\$YOCTOADT_TARGET_MACHINE_$selected_arch_type"
-    select_machine=`eval echo $select_machine_var`
-    show_error_banner=0
-
-    for supported_arch_type in $YOCTOADT_SUPPORTED_TARGETS; do
-      if [ "$selected_arch_type" == "$supported_arch_type" ]; then
-        found=1
-        break
-      fi
-    done
-    if [ $found == 0 ]; then
-       echo_info "[ADT_INST] Error: YOCTADT_TARGETS in adt_installer.conf contains invalid entries: $YOCTOADT_TARGETS. Valid values are: $YOCTOADT_SUPPORTED_TARGETS"
-       show_error_banner=1
-    elif [ -z "$select_machine" ]; then
-       echo_info "[ADT_INST] Error: No MACHINE was defined for $selected_arch_type architecture! This is needed to install the toolchain and the correct environment settings."
-       echo_info "[ADT_INST] To do that, in adt-installer.conf, set the following variable: YOCTOADT_TARGET_MACHINE_$selected_arch_type"
-       show_error_banner=1
-    fi
-
-    if [ $show_error_banner == 1 ]; then
-       echo -e "\n#############################################################################"
-       echo -e "# Meet error(s) when installing Yocto ADT! Please check log file for details. "
-       echo -e "#############################################################################\n"
-       exit -1
-    fi
-  done
-
-  for arch_type in $YOCTOADT_SUPPORTED_TARGETS; do
-    #select_target_var="\$YOCTOADT_TARGET_$arch_type"
-    #select_target=`eval echo $select_target_var`
-
-    #if [ "$select_target" != "Y" ] || [ "$selected_target" != "y" ]; then
-    #  continue;
-    #fi
-
-    target_sysroot_image_var="\$YOCTOADT_TARGET_SYSROOT_IMAGE_$arch_type"
-    target_sysroot_image=`eval echo $target_sysroot_image_var`
-
-
-    select_rootfs_var="\$YOCTOADT_ROOTFS_$arch_type"
-    select_rootfs=`eval echo $select_rootfs_var`
-
-    if [ "$select_rootfs" == "" ] && [ "$target_sysroot_image" == "" ]; then
-       continue;
-    fi
-
-    for image_type in $select_rootfs; do
-#validate rootfs type defined in YOCTOADT_ROOTFS_{ARCH} is valid and in YOCTOADT_SUPPORTED_ROOTFS
-      found=0
-      for supported_rootfs_type in $YOCTOADT_SUPPORTED_ROOTFS; do
-        if [ "$image_type" == "$supported_rootfs_type" ]; then
-          found=1
-          break
-        fi
-      done
-      if [ $found == 0 ]; then
-#the rootfs type listed for downloading is not valid
-        echo_info "[ADT_INST] Error: Selected YOCTOADT_ROOTFS_$arch_type value: $image_type, is not valid! Valid values are: $YOCTOADT_SUPPORTED_ROOTFS "
-       echo -e "\n#############################################################################"
-       echo -e "# Meet error(s) when installing Yocto ADT! Please check log file for details. "
-       echo -e "#############################################################################\n"
-        exit -1
-      fi
-    done
-
-    found=0
-    for image_type in $select_rootfs; do
-#validate that rootfs to be extracted must be in the item: YOCTOADT_ROOTFS_${ARCH}
-      if [ "$target_sysroot_image" == "$image_type" ]; then
-        found=1
-        break
-      fi
-    done
-# the rootfs image to be extracted is not selected
-    if [ $found == 0 ]; then
-      echo_info "[ADT_INST] Error: YOCTOADT_TARGET_SYSROOT_IMAGE_$arch_type selection: $target_sysroot_image is not included in YOCTOADT_ROOTFS_$arch_type selections: $select_rootfs"
-      echo -e "\n#############################################################################"
-      echo -e "# Meet error(s) when installing Yocto ADT! Please check log file for details. "
-      echo -e "#############################################################################\n"
-      exit -1
-    fi
-  done
-}
-
-
-#detect opkg installed or not, for installing sdk, we will use
-#this installed local opkg
-install_opkg()
-{
-if [ ! -x "$LOCAL_OPKG_LOC/bin/opkg" ]; then
-  echo_info "OPKG is not setup, setting up opkg in local, which is required for installing yocto ADT...\n"
-
-  if [ -d $LOCAL_OPKG_LOC ]; then
-    echo_info "Deleting old OPKG folder, which doesn't contain executables... "
-    rm -rf $LOCAL_OPKG_LOC
-  fi
-
-  parent_folder=`pwd`
-  cd $LOCAL_OPKG_FOLDER
-  check_result
-
-  opkg_source_dir=`ls -d opkg-*`
-
-  if [ $opkg_source_dir == "" ]; then
-    echo_info "[ADT_INST] Error: OPKG source directory is not found!"
-    echo -e "\n#############################################################################"
-    echo -e "# Meet error(s) when installing Yocto ADT! Please check log file for details. "
-    echo -e "#############################################################################\n"
-    exit -1
-  fi
-
-  cd $opkg_source_dir
-  check_result
-
-  echo_info "Configure opkg ...\n"
-  autoreconf -i
-  ./configure --prefix=$parent_folder/$LOCAL_OPKG_LOC --enable-shared=no --disable-curl --disable-ssl-curl --disable-gpg >> $parent_folder/$YOCTOADT_INSTALL_LOG_FILE
-  check_result
-
-  echo_info "Make opkg ...\n"
-  make &>> $parent_folder/$YOCTOADT_INSTALL_LOG_FILE
-  check_result
-
-  echo_info "Make Install opkg ...\n"
-  make install &>> $parent_folder/$YOCTOADT_INSTALL_LOG_FILE
-  #if meet error when installing opkg, cancel the installation
-  check_result
-
-  cd $parent_folder
-  echo_info "Successfully installed OPKG.\n"
-fi
-}
-
-confirm_download()
-{
-#avoid repeated reminding
-if [ "$override_oldfile" == 1 ]; then
-  return $pre_result
-else
-  override_oldfile=1
-fi
-
-while true; do
-  #echo_info "[ADT_INST] Files [$1] already exists. If you continue downloading, old files will be overrided."
-  #echo_info "[ADT_INST] Further prompts will not be given if there're more existing files to be downloaded."
-  #echo_info "[ADT_INST] Do you want to continue downloading? Please enter Y/N:"
-  echo_info "\nFile [$1] already exists, which means you've downloaded the qemu kernel and rootfs file(s) before.  If you choose continue downloading, old files will be overridden."
-  echo_info "[ADT_INST] Do you want to continue downloading? Please enter Y/N:"
-  read YOCTOADT_INSTALL
-  YOCTOADT_INSTALL=`tr '[a-z]' '[A-Z]'<<<"$YOCTOADT_INSTALL"`
-  if [ "$YOCTOADT_INSTALL" == "Y" ]; then
-    pre_result=0
-    return 0
-  elif [ "$YOCTOADT_INSTALL" == "N" ]; then
-    pre_result=1
-    return 1
-  fi
-done
-}
-
-download_file()
-{
-local filename=`echo ${1##*/}`
-if [ -f "$LOCAL_DOWNLOAD/$filename" ]; then
-  confirm_download $filename
-  result="$?"
-  if [ ! "$result" == "0" ]; then
-    return
-  else
-    echo "Removing old file [$1]"
-    rm -rf "$LOCAL_DOWNLOAD/$filename" 
-  fi
-fi
-echo_info "Downloading file: $filename..."
-wget "$YOCTOADT_REPO/rootfs/$1" -P $LOCAL_DOWNLOAD --progress=bar:force 2>&1 | tee -a "$YOCTOADT_INSTALL_LOG_FILE" 
-}
-
-
-
-#Need three input params:
-# $1 arch_type(arm powerpc x86 mips)
-# $2 machine(qemuarm beagleboard)
-# $3 rootfs_image_type (a list of sdk sato minimal lsb)
-get_image()
-{
-  local machine=$2
- 
-  if [ "$1" == "x86" ] || [ "$1" == "x86_64" ]; then
-    kernel="bzImage-$machine.bin"
-  elif [ "$1" == "ppc" ] || [ "$1" == "mips" ]; then
-    kernel="vmlinux-$machine.bin"
-  else
-    kernel="zImage-$machine.bin"
-  fi
-
-  #echo_info "[ADT_INST] Downloading qemu kernel binary: $qemu_kernel"
-  download_file $machine/$kernel
-  check_result
-  
-  for image_type in $select_rootfs; do
-    #echo_info "[ADT_INST] Downloading rootfs file: core-image-$image_type-$machine.tar.bz2"
-    filename="core-image-$image_type-$machine.tar.bz2"
-    download_file $machine/$filename
-    check_result
-  done
-}
-
-download_images()
-{
-  select_rootfs_var="\$YOCTOADT_ROOTFS_$1"
-  select_sysroot_image_var="\$YOCTOADT_TARGET_SYSROOT_IMAGE_$1"
-  select_sysroot_var="\$YOCTOADT_TARGET_SYSROOT_LOC_$1"
-  select_machine_var="\$YOCTOADT_TARGET_MACHINE_$1"
-  select_rootfs=`eval echo $select_rootfs_var`
-  select_sysroot_image=`eval echo $select_sysroot_image_var`
-  select_sysroot=`eval echo $select_sysroot_var`
-  select_machine=`eval echo $select_machine_var`
-
-  if [ -n "$select_sysroot" ]; then
-    select_sysroot=`readlink -m $select_sysroot`
-  fi
-
-  if [ "$select_rootfs" != "" ]; then
-    if [ $2 ]; then
-    #echo_info "\n############################################################################"
-    #echo_info "# To be downloaded rootfs image details defined in adt_installer.conf"
-    #echo_info "############################################################################"
-    echo_info "# Target architecture:\t\t$1"
-    echo_info "# Target machine:\t\t$select_machine"
-    echo_info "# Root_fs images:\t\t$select_rootfs"
-    echo_info "# Target sysroot image:\t\t$select_sysroot_image"
-    echo_info "# Target sysroot loc:\t\t$select_sysroot"
-    echo_info "\n"
-    #echo_info "############################################################################\n"
-    else
-    get_image $1 $select_machine $select_rootfs
-    fi
-  fi
-}
-
-
-
-
-#Main body of installer
-
-clear
-
-run_path=`dirname $0`
-cd $run_path
-
-if [ ! -f "scripts/util" ]; then
-  echo -e "[ADT_INST] Error: Script file: util, can't be found under: $run_path!"
-  echo -e "\n#############################################################################"
-  echo -e "# Meet error(s) when installing Yocto ADT! Please check log file for details. "
-  echo -e "#############################################################################\n"
-  exit -1
-fi
-
-if [ ! -f "scripts/adt_installer_internal" ]; then
-  echo -e "[ADT_INST] Error: Script file: adt_installer_internal, can't be found under: $run_path!"
-  echo -e "\n#############################################################################"
-  echo -e "# Meet error(s) when installing Yocto ADT! Please check log file for details. "
-  echo -e "#############################################################################\n"
-  exit -1
-fi
-
-config_file="adt_installer.conf"
-if [ ! -f "$config_file" ]; then
-  echo_info "[ADT_INST] Error: Installation configuration file: adt_installer.conf is not found!\n"
-  echo_info "\n##################################################################################"
-  echo_info "# Meet error(s) when installing Yocto ADT. Please check log file for details. "
-  echo_info "##################################################################################\n"
-  exit -1
-fi
-
-. scripts/data_define
-. scripts/util
-
-
-if [ -f "$YOCTOADT_INSTALL_LOG_FILE" ]; then
-  rm $YOCTOADT_INSTALL_LOG_FILE
-fi
-
-echo -n "Please enter the install location (default: $DEFAULT_INSTALL_FOLDER): "
-read INSTALL_FOLDER
-
-if [ "$INSTALL_FOLDER" = "" ]; then
-    INSTALL_FOLDER=$DEFAULT_INSTALL_FOLDER
-fi
-
-eval INSTALL_FOLDER=$(printf "%q" "$INSTALL_FOLDER")
-if [ -d "$INSTALL_FOLDER" ]; then
-	export INSTALL_FOLDER=$(cd "$INSTALL_FOLDER"; pwd)
-else
-	export INSTALL_FOLDER=$(readlink -m "$INSTALL_FOLDER")
-fi
-
-if [ -n "$(echo $INSTALL_FOLDER|grep ' ')" ]; then
-       echo "The target directory path ($INSTALL_FOLDER) contains spaces. Abort!"
-       exit 1
-fi
-
-clear
-
-usage
-
-user_inst_type="$?"
-
-validate_config
-check_result
-
-#check adt_repo exist
-wget --spider $YOCTOADT_REPO 2>&1 | tee -a "$YOCTOADT_INSTALL_LOG_FILE"
-if grep -q "404 Not Found" $YOCTOADT_INSTALL_LOG_FILE; then
-  echo -e "[ADT_INST] Error: YOCTOADT_REPO does not exist: $YOCTOADT_REPO"
-  echo -e "\n#############################################################################"
-  echo -e "# Meet error(s) when installing Yocto ADT! Please check log file for details. "
-  echo -e "#############################################################################\n"
-  exit -1
-fi
-
-#firstly we need to install opkg host
-install_opkg
-
-#Create folders for holding rootfs/qemu images
-if [ ! -d "$LOCAL_DOWNLOAD" ]; then
-  echo_info "Creating new images downloading folder: $LOCAL_DOWNLOAD ..."
-  mkdir -p $LOCAL_DOWNLOAD
-fi
-
-#downloading required qemu images/rootfs
-if [ "$user_inst_type" == "0" ]; then
-  override_oldfile=1
-else
-  override_oldfile=0
-fi
-
-for arch_type in $YOCTOADT_TARGETS; do
-  download_images $arch_type
-done
-
-scripts/adt_installer_internal $user_inst_type
-
-result="$?"
-#echo_info "\n############################################################"
-if [ "$result" == "0" ]; then
-  echo_info "\n############################################################"
-  echo_info "# Yocto ADT has been successfully installed."
-  echo_info "############################################################\n"
-fi
-
diff --git a/meta/recipes-devtools/installer/adt-installer/adt_installer.conf b/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
deleted file mode 100644
index 867fbd1..0000000
--- a/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
+++ /dev/null
@@ -1,75 +0,0 @@
-# Yocto ADT Installer Configuration File
-#
-# Copyright 2010-2011 by Intel Corp.
-#
-# Permission is hereby granted, free of charge, to any person obtaining a copy 
-# of this software and associated documentation files (the "Software"), to deal 
-# in the Software without restriction, including without limitation the rights 
-# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
-# copies of the Software, and to permit persons to whom the Software is 
-# furnished to do so, subject to the following conditions:
-
-# The above copyright notice and this permission notice shall be included in 
-# all copies or substantial portions of the Software.
-
-# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
-# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
-# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
-# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
-# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
-# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
-# THE SOFTWARE.
-
-
-# Your yocto distro repository, this should include IPKG based packages and root filesystem files where the installation is based on
-
-YOCTOADT_REPO="ADTREPO"
-
-# The following are for system wide setup
-# Target architectures that you want to setup host cross dev environment for
-# valid values are: arm, x86, x86_64, ppc, mips with space separation between entries
-YOCTOADT_TARGETS="arm x86"
-# Whether install qemu or not, valid entries are: Y/N
-YOCTOADT_QEMU="Y"
-# Whether install user-mode nfs or not, valid entries are: Y/N.  If you want to use Yocto Eclipse plug-in as your dev IDE, you need to select both qemu and NFS
-YOCTOADT_NFS_UTIL="Y"
-
-# These 2 values will be supported in the furture installer
-#YOCTOADT_BITBAKE="Y"
-#YOCTOADT_METADATA="Y"
-
-#The followings are for setting up specific target architecture
-#YOCTOADT_ROOTFS_$arch is for specifying what root filesystem image files you want to download from the repository. The valid values to replace $arch are: arm, x86, x86_64, powerpc, mips.  The valid image files are: minimal, minimal-dev, sato, sato-dev, sato-sdk,lsb, lsb-dev, lsb-sdk.  If you want to download multiple images, the entries are space separated
-YOCTOADT_ROOTFS_arm="minimal sato-sdk"
-#Specify which root filesystem file to use to extract as target sysroot.  Please ensure the entry is in the list of downloaded root filesystem files that specified above in YOCTOADT_ROOTFS_$arch
-YOCTOADT_TARGET_SYSROOT_IMAGE_arm="sato-sdk"
-#The machine for which you want to download the image. Each machine might have
-#different compilation options in order to select certain hardware models or
-#configurations
-YOCTOADT_TARGET_MACHINE_arm="qemuarm"
-#The location where the target sysroot will be setup
-YOCTOADT_TARGET_SYSROOT_LOC_arm="$HOME/test-yocto/$YOCTOADT_TARGET_MACHINE_arm"
-
-
-#Here's a template for setting up target arch of x86 
-YOCTOADT_ROOTFS_x86="sato-sdk"
-YOCTOADT_TARGET_SYSROOT_IMAGE_x86="sato-sdk"
-YOCTOADT_TARGET_MACHINE_x86="qemux86"
-YOCTOADT_TARGET_SYSROOT_LOC_x86="$HOME/test-yocto/$YOCTOADT_TARGET_MACHINE_x86"
-
-#Here's some template of other arches, which you need to change the value in ""
-YOCTOADT_ROOTFS_x86_64="sato-sdk"
-YOCTOADT_TARGET_SYSROOT_IMAGE_x86_64="sato-sdk"
-YOCTOADT_TARGET_MACHINE_x86_64="qemux86-64"
-YOCTOADT_TARGET_SYSROOT_LOC_x86_64="$HOME/test-yocto/$YOCTOADT_TARGET_MACHINE_x86_64"
-
-YOCTOADT_ROOTFS_ppc="sato-sdk"
-YOCTOADT_TARGET_SYSROOT_IMAGE_ppc="sato-sdk"
-YOCTOADT_TARGET_MACHINE_ppc="qemuppc"
-YOCTOADT_TARGET_SYSROOT_LOC_ppc="$HOME/test-yocto/$YOCTOADT_TARGET_MACHINE_ppc"
-
-YOCTOADT_ROOTFS_mips="sato-sdk"
-YOCTOADT_TARGET_SYSROOT_IMAGE_mips="sato-sdk"
-YOCTOADT_TARGET_MACHINE_mips="qemumips"
-YOCTOADT_TARGET_SYSROOT_LOC_mips="$HOME/test-yocto/$YOCTOADT_TARGET_MACHINE_mips"
-
diff --git a/meta/recipes-devtools/installer/adt-installer/opkg/conf/opkg-sdk-i686.conf b/meta/recipes-devtools/installer/adt-installer/opkg/conf/opkg-sdk-i686.conf
deleted file mode 100644
index ba627b3..0000000
--- a/meta/recipes-devtools/installer/adt-installer/opkg/conf/opkg-sdk-i686.conf
+++ /dev/null
@@ -1,6 +0,0 @@
-arch all 1
-arch any 6
-arch noarch 11
-arch i686-nativesdk 16
-src yp-i686-nativesdk ADTREPO_URL/adt-ipk/i686-nativesdk
-src yp-i686-all ADTREPO_URL/adt-ipk/all
diff --git a/meta/recipes-devtools/installer/adt-installer/opkg/conf/opkg-sdk-x86_64.conf b/meta/recipes-devtools/installer/adt-installer/opkg/conf/opkg-sdk-x86_64.conf
deleted file mode 100644
index 10504a9..0000000
--- a/meta/recipes-devtools/installer/adt-installer/opkg/conf/opkg-sdk-x86_64.conf
+++ /dev/null
@@ -1,6 +0,0 @@
-arch all 1
-arch any 6
-arch noarch 11
-arch x86_64-nativesdk 16
-src yp-x86_64-nativesdk ADTREPO_URL/adt-ipk/x86_64-nativesdk
-src yp-x86_64-all ADTREPO_URL/adt-ipk/all
diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
deleted file mode 100755
index 6f5fb49..0000000
--- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
+++ /dev/null
@@ -1,312 +0,0 @@
-#!/bin/bash
-
-# Yocto ADT Installer
-#
-# Copyright 2010-2011 by Intel Corp.
-#
-# Permission is hereby granted, free of charge, to any person obtaining a copy 
-# of this software and associated documentation files (the "Software"), to deal 
-# in the Software without restriction, including without limitation the rights 
-# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
-# copies of the Software, and to permit persons to whom the Software is 
-# furnished to do so, subject to the following conditions:
-
-# The above copyright notice and this permission notice shall be included in 
-# all copies or substantial portions of the Software.
-
-# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
-# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
-# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
-# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
-# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
-# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
-# THE SOFTWARE.
-
-parse_config()
-{
-  INST_ARCH=`uname -m`
-
-  case $INST_ARCH in 
-  i[3-6]86)
-    OPKG_CONFIG_FILE=$YOCTOADT_OPKG_CONF_FILE_32
-    OECORE_NATIVE_SYSROOT="$INSTALL_FOLDER/sysroots/$INST_ARCH$SDK_VENDOR-linux/"
-    ;;
-  x86_64)
-    OPKG_CONFIG_FILE=$YOCTOADT_OPKG_CONF_FILE_64
-    OECORE_NATIVE_SYSROOT="$INSTALL_FOLDER/sysroots/x86_64$SDK_VENDOR-linux/"
-    ;;
-  *)
-    echo_info "[ADT_INST] Error: Installation Machine is not supported!"
-    exit -1
-    ;;
-  esac
-}
-
-get_sudo_app()
-{
-  username=$(id -nu)
-
-  # find the owner of the parent
-  dir=$1
-  while [ 1 ]; do
-      if [ -d $dir ]; then
-          owner=$(stat -c %U $dir)
-          break
-     else
-          dir=$(dirname $dir)
-     fi
-  done
-
-  if [ "$owner" = "$username" ]; then
-      true
-  else
-      echo sudo
-  fi
-}
-
-# this function accepts arch_type (x86, x86_64, arm, ppc, mips) as the first
-# argument, returning the location of the target rootfs
-get_target_rootfs_location() {
-	[ -z "$1" ] && return
-
-	arch_type=$1
-	# rootfs extraction directory
-	target_sysroot_var="\$YOCTOADT_TARGET_SYSROOT_LOC_$arch_type"
-	target_sysroot=`eval echo $target_sysroot_var`
-
-	if [ "$target_sysroot" == "" ]; then
-		return
-	else
-		echo "`readlink -m $target_sysroot`"
-	fi
-}
-
-
-#let us install a qemu-native firstly
-#installation step 2
-install_native_sdk()
-{
-
-echo_info "\nStart installing selected native ADT for archs: $YOCTOADT_TARGETS..."
-
-# where the packages are installed.
-NATIVE_INSTALL_DIR=$INSTALL_FOLDER
-
-if [ -d "$INSTALL_FOLDER" ]; then
-  echo_info "\nNative ADT installation directory \"$INSTALL_FOLDER\" already exists! Continue installation will override its contents!"
-  confirm_install $1
-fi
-
-#Now begin to install native sdk and extract qemu rootfs which needs privilege rights
-#depending on the install location
-SUDO=$(get_sudo_app $NATIVE_INSTALL_DIR)
-if [ -n "$SUDO" ]; then
-  echo_info "#######################################################################"
-  echo_info "Please note from this point on installation requires sudo password ..."
-  echo_info "#######################################################################"
-fi
-
-#we need to make this directory firstly since opkg need to use it.
-OPKG_LOCK_DIR="$NATIVE_INSTALL_DIR/$OPKG_LIBDIR/opkg"
-if [ ! -d "$OPKG_LOCK_DIR" ]; then
-  $SUDO mkdir -p $OPKG_LOCK_DIR
-  echo_info "Successfully create directory $OPKG_LOCK_DIR. "
-#if user delete /opt/xxx, while dangling folders there, report error
-elif [ ! -d "$INSTALL_FOLDER" ]; then
-  echo_info "\nDangling opkg cache folder $OPKG_LOCK_DIR detected. Continue installation will remove the folder!"
-  confirm_install $1
-  $SUDO rm -rf $OPKG_LOCK_DIR
-  $SUDO mkdir -p $OPKG_LOCK_DIR
-#if user are updating installing, just let him/her go, give her/him prompt
-else
-  echo_info "ADT has already been installed. Will update its contents..."
-fi
-
-#first update repository
-if [ "x$SUDO" = "x" ]; then
-    OPKG_CMD="$LOCAL_OPKG_LOC/bin/opkg"
-else
-    OPKG_CMD="sudo -E $LOCAL_OPKG_LOC/bin/opkg"
-fi
-
-echo_info "Updating opkg..."
-$OPKG_CMD -f $OPKG_CONFIG_FILE -o $NATIVE_INSTALL_DIR update &>> $YOCTOADT_INSTALL_LOG_FILE
-check_result
-echo_info "opkg update process ended..."
-
-#install below must sdk-host packages
-OPKG_INSTALL_CMD="$OPKG_CMD "
-OPKG_INSTALL_NATIVE_CMD="$OPKG_INSTALL_CMD  --force-overwrite -f $OPKG_CONFIG_FILE -o $NATIVE_INSTALL_DIR install"
-
-BASE_HOSTSDK_PKGNAMES="pseudo opkg pkgconfig libtool autoconf automake"
-for pkg in $BASE_HOSTSDK_PKGNAMES; do
-  echo_info "Installing ${pkg} nativesdk ...\n"
-  $OPKG_INSTALL_NATIVE_CMD nativesdk-${pkg} &>> $YOCTOADT_INSTALL_LOG_FILE
-  check_result
-done
-
-for target_type in $YOCTOADT_TARGETS; do
-  machine_var="\$YOCTOADT_TARGET_MACHINE_$target_type"
-  machine=`eval echo $machine_var`
-  echo_info "Installing cross canadian packages for $machine ..."
-  $OPKG_INSTALL_NATIVE_CMD packagegroup-cross-canadian-$machine &>> $YOCTOADT_INSTALL_LOG_FILE
-  check_result
-
-  target_sysroot=`get_target_rootfs_location $target_type`
-  [ -z "$target_sysroot" ] && continue
-
-  # get the environment setup script paths: original (the one before relocation)
-  # and relocated
-  env_script_original=`$OPKG_CMD -f $OPKG_CONFIG_FILE -o $NATIVE_INSTALL_DIR files meta-environment-$machine|\
-							grep environment-setup`
-  env_script_relocated=$INSTALL_FOLDER/${env_script_original##*/}
-
-  # opkg will not install packagegroup-cross-canadian package if it was already
-  # installed. So, the environment script is in one place or the other.
-  [ -e "$INSTALL_FOLDER/$env_script_original" ] && env_script=$INSTALL_FOLDER/$env_script_original
-  [ -e "$env_script_original" ] && env_script=$env_script_original
-  [ -e "$env_script_relocated" ] && env_script=$env_script_relocated
-
-  $SUDO sed -i -e "s%SDKTARGETSYSROOT=.*%SDKTARGETSYSROOT=$target_sysroot%g" $env_script
-done
-
-if [ "$YOCTOADT_QEMU" == "Y" ] || [ "$YOCTOADT_QEMU" == "y" ]; then
-  echo_info "\nInstalling qemu native ..."
-  $OPKG_INSTALL_NATIVE_CMD nativesdk-qemu &>> $YOCTOADT_INSTALL_LOG_FILE
-  check_result
-  $OPKG_INSTALL_NATIVE_CMD nativesdk-qemu-helper &>> $YOCTOADT_INSTALL_LOG_FILE
-  check_result
-fi
-
-if [ "$YOCTOADT_NFS_UTIL" == "Y" ] || [ "$YOCTOADT_NFS_UTIL" == "y" ]; then
-  echo_info "\nInstalling unfs ..."
-  $OPKG_INSTALL_NATIVE_CMD nativesdk-unfs3 &>> $YOCTOADT_INSTALL_LOG_FILE
-  check_result
-fi
-
-# Lose the ./opt/${DISTRO}/${SDK_VERSION} part, we don't really need to keep
-# the entire directory structure. We could patch opkg to do that but it's far
-# simpler to do that here and achieve the same result.
-# This is done in two steps:
-if [ -d $NATIVE_INSTALL_DIR/$DEFAULT_INSTALL_FOLDER ]; then
-    # Step 1: copy ./opt/${DISTRO}/${SDK_VERSION} contents to $NATIVE_INSTALL_DIR.
-    # We cannot use move if $NATIVE_INSTALL_DIR is not empty (for example: contains
-    # another SDK)
-    $SUDO cp -r $NATIVE_INSTALL_DIR/$DEFAULT_INSTALL_FOLDER/* $NATIVE_INSTALL_DIR
-
-    # delete the source directory now
-    $SUDO rm -rf $NATIVE_INSTALL_DIR/$DEFAULT_INSTALL_FOLDER/*
-
-    # Step 2: Delete the ./opt/${DISTRO}/${SDK_VERSION} directories too, they should be empty
-    dir=$NATIVE_INSTALL_DIR/$DEFAULT_INSTALL_FOLDER
-    while [ "$dir" != "$NATIVE_INSTALL_DIR" ]; do
-        # if the user chose / as the install folder, then we should leave /opt in place
-        if [ "$dir" = "/opt" ]; then
-            break
-        fi
-
-        # try to delete the directory, only if it's empty
-        $SUDO rmdir $dir
-        if [ $? -ne 0 ]; then
-            break
-        fi
-
-        # go to the next directory
-        dir=$(dirname $dir)
-    done
-    # Step 3: Rewrite the *.list files to contain the correct paths
-    $SUDO find $NATIVE_INSTALL_DIR/var/lib/opkg -type f -exec sed -i -e '#^$DEFAULT_INSTALL_FOLDER#$NATIVE_INSTALL_DIR#' {} \;
-fi
-
-# Link the ld.so.cache file into the hosts filesystem
-if [ ! -f "$OECORE_NATIVE_SYSROOT/etc/ld.so.cache" ]; then
-echo_info "Link the ld.so.cache file into the host filesystem"
-$SUDO ln -s /etc/ld.so.cache $OECORE_NATIVE_SYSROOT/etc/ld.so.cache
-check_result
-fi
-
-# relocate binaries
-echo_info "\nRelocating binaries ..."
-escaped_sdkpath=$(echo $DEFAULT_INSTALL_FOLDER |sed -e "s:[\+\.]:\\\\\\\\\0:g")
-
-# We don't change the script in-place since we may want the user to re-run
-# adt-installer script
-sed -e "s:##DEFAULT_INSTALL_DIR##:$escaped_sdkpath:" scripts/relocate_sdk.py > scripts/relocate_sdk_tmp.py
-chmod +x scripts/relocate_sdk_tmp.py
-
-dl_path=$(find $OECORE_NATIVE_SYSROOT/lib -name "ld-linux*")
-executable_files=$(find $OECORE_NATIVE_SYSROOT -type f -perm /111)
-
-$SUDO scripts/relocate_sdk_tmp.py $INSTALL_FOLDER $dl_path $executable_files
-check_result
-
-# replace /opt/${DISTRO}/${SDK_VERSION} with the install folder in all configs
-env_setup_script=$(find $NATIVE_INSTALL_DIR/ -name "environment-setup-*")
-$SUDO sed -i -e "s:$DEFAULT_INSTALL_FOLDER:$NATIVE_INSTALL_DIR:g" $env_setup_script
-
-find $OECORE_NATIVE_SYSROOT -type f -exec file '{}' \; | grep ":.*\(ASCII\|script\|source\).*text" | \
-    cut -d':' -f1 | xargs $SUDO sed -i -e "s:$DEFAULT_INSTALL_FOLDER:$NATIVE_INSTALL_DIR:g"
-
-# change all symlinks pointing to /opt/${DISTRO}/${SDK_VERSION}
-for l in $(find $NATIVE_INSTALL_DIR -type l); do
-    $SUDO ln -sfn $(readlink $l|sed -e "s:$DEFAULT_INSTALL_FOLDER:$NATIVE_INSTALL_DIR:") $l
-done
-
-# find out all perl scripts in $OECORE_NATIVE_SYSROOT and modify them
-# replacing the host perl with SDK perl.
-for perl_script in $($SUDO grep -m 1 "^#!.*perl" -rl $OECORE_NATIVE_SYSROOT); do
-    $SUDO sed -i -e "s:^#! */usr/bin/perl.*:#! /usr/bin/env perl:g" -e \
-        "s: /usr/bin/perl: /usr/bin/env perl:g" $perl_script
-done
-
-echo_info "\nSuccessfully installed selected native ADT!"
-}
-
-#Need three input params, $1 -- arch_type(arm powerpc x86 mips) #2 -- user installation type
-#customer or scilent
-
-install_target()
-{
-
-target_sysroot=`get_target_rootfs_location $1`
-[ -z "$target_sysroot" ] && return 0
-
-target_sysroot_image_var="\$YOCTOADT_TARGET_SYSROOT_IMAGE_$1"
-target_sysroot_image=`eval echo $target_sysroot_image_var`
-if [ "$target_sysroot_image" == "" ]; then
-  echo_info "[ADT_INST] Error: YOCTOADT_TARGET_SYSROOT_IMAGE_$1 selection is empty, failed to create target sysroot!"
-  return 1
-fi
-
-echo_info "Installing target sysroot for arch: $1, rootfs type: $target_sysroot_image, location: $target_sysroot"
-
-target_machine_var="\$YOCTOADT_TARGET_MACHINE_$1"
-target_machine=`eval echo $target_machine_var`
-sysroot_image_name="core-image-$target_sysroot_image-$target_machine.tar.bz2"
-    #echo_info "Extracting rootfs: $sysroot_image_name, using pseudo..."
-
-# sudo password might be needed to install the target sysroot
-SUDO=$(get_sudo_app $target_sysroot)
-
-$SUDO scripts/extract_rootfs $sysroot_image_name $target_sysroot $OECORE_NATIVE_SYSROOT $user_inst_type
-check_result
-}
-
-
-#Main part
-. scripts/data_define
-. scripts/util
-
-parse_config
-
-#secondly we will start to install native tools
-user_inst_type=$1
-install_native_sdk $user_inst_type
-check_result
-
-for arch_type in $YOCTOADT_TARGETS; do
-  install_target $arch_type
-  check_result
-done
-
-
diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/data_define b/meta/recipes-devtools/installer/adt-installer/scripts/data_define
deleted file mode 100644
index cfd6716..0000000
--- a/meta/recipes-devtools/installer/adt-installer/scripts/data_define
+++ /dev/null
@@ -1,38 +0,0 @@
-#!/bin/bash
-
-# Yocto ADT Installer
-#
-# Copyright 2010-2011 by Intel Corp.
-#
-# Permission is hereby granted, free of charge, to any person obtaining a copy 
-# of this software and associated documentation files (the "Software"), to deal 
-# in the Software without restriction, including without limitation the rights 
-# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
-# copies of the Software, and to permit persons to whom the Software is 
-# furnished to do so, subject to the following conditions:
-
-# The above copyright notice and this permission notice shall be included in 
-# all copies or substantial portions of the Software.
-
-# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
-# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
-# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
-# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
-# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
-# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
-# THE SOFTWARE.
-
-config_file="adt_installer.conf"
-source `pwd`/$config_file
-
-LOCAL_OPKG_LOC="./opkg/build/opkg"
-LOCAL_OPKG_FOLDER="./opkg/build"
-
-# List all supported root fs types and target types,
-# it will be used in user configuration validity checking
-YOCTOADT_SUPPORTED_ROOTFS="minimal minimal-dev sato sato-dev sato-sdk lsb lsb-dev lsb-sdk"
-YOCTOADT_SUPPORTED_TARGETS="x86 x86_64 arm ppc mips"
-# Different host (32 bit or 64 bit) will have different opkg
-# configuration files
-YOCTOADT_OPKG_CONF_FILE_32="./opkg/conf/opkg-sdk-i686.conf"
-YOCTOADT_OPKG_CONF_FILE_64="./opkg/conf/opkg-sdk-x86_64.conf"
diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/extract_rootfs b/meta/recipes-devtools/installer/adt-installer/scripts/extract_rootfs
deleted file mode 100755
index d1a595b..0000000
--- a/meta/recipes-devtools/installer/adt-installer/scripts/extract_rootfs
+++ /dev/null
@@ -1,67 +0,0 @@
-#!/bin/bash
-
-# Yocto ADT Installer
-#
-# Copyright 2010-2011 by Intel Corp.
-#
-# Permission is hereby granted, free of charge, to any person obtaining a copy 
-# of this software and associated documentation files (the "Software"), to deal 
-# in the Software without restriction, including without limitation the rights 
-# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
-# copies of the Software, and to permit persons to whom the Software is 
-# furnished to do so, subject to the following conditions:
-
-# The above copyright notice and this permission notice shall be included in 
-# all copies or substantial portions of the Software.
-
-# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
-# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
-# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
-# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
-# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
-# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
-# THE SOFTWARE.
-
-extract_rootfs()
-{
-
-  native_sysroot=$3
-  target_sysroot=$2
-  PSEUDO_COMMAND="$native_sysroot/usr/bin/pseudo"
-  TAR_OPTS="-xjf"
-  PSEUDO_OPTS="-P $native_sysroot/usr"
-
-
-  rm -rf $PSEUDO_LOCALSTATEDIR
-
-  if [ -d "$target_sysroot" ]; then
-    echo_info "\nTarget sysroot location: $target_sysroot, already exists! If you continue installation, this folder will be re-created."
-    confirm_install $4
-    rm -rf "$target_sysroot"
-  fi
-
-  if [ ! -d "$target_sysroot" ]; then
-    echo_info "Creating directory $target_sysroot..."
-    mkdir -p "$target_sysroot"
-  fi
-
-  pseudo_state_dir="$target_sysroot/../$(basename "$target_sysroot").pseudo_state"
-  mkdir -p "$pseudo_state_dir"
-  touch "$pseudo_state_dir/pseudo.pid"
-  PSEUDO_LOCALSTATEDIR="$pseudo_state_dir"
-  export PSEUDO_LOCALSTATEDIR
-
-  echo_info "Extracting rootfs: $1, using pseudo..."
-  $PSEUDO_COMMAND $PSEUDO_OPTS tar -C $2 "$TAR_OPTS" $LOCAL_DOWNLOAD/$1 &>> $YOCTOADT_INSTALL_LOG_FILE
-  check_result
-}
-
-#Main part
-. scripts/util
-
-#Parameter detail is listed below:
-#Param 4: Silent install or customize install
-#Param 3: OECORE_NATIVE_SYSROOT
-#Param 2: user defined rootfs extraction directory
-#param 1: sysroot image name
-extract_rootfs $1 $2 $3 $4
diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/util b/meta/recipes-devtools/installer/adt-installer/scripts/util
deleted file mode 100644
index 9be7517..0000000
--- a/meta/recipes-devtools/installer/adt-installer/scripts/util
+++ /dev/null
@@ -1,104 +0,0 @@
-#!/bin/bash
-
-# Yocto ADT Installer
-#
-# Copyright 2010-2011 by Intel Corp.
-#
-# Permission is hereby granted, free of charge, to any person obtaining a copy 
-# of this software and associated documentation files (the "Software"), to deal 
-# in the Software without restriction, including without limitation the rights 
-# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
-# copies of the Software, and to permit persons to whom the Software is 
-# furnished to do so, subject to the following conditions:
-
-# The above copyright notice and this permission notice shall be included in 
-# all copies or substantial portions of the Software.
-
-# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
-# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
-# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
-# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
-# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
-# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
-# THE SOFTWARE.
-
-echo_info()
-{
-  echo -e $1 | tee -a $YOCTOADT_INSTALL_LOG_FILE
-}
-
-select_install_type()
-{
-# If choosing silent install, all older installation data will be
-# overriden without user's interaction
-while true; do
-  #echo_info "[ADT_INST] Silent install means overrides all existing older"
-  #echo_info "[ADT_INST] data and the installation needs least user interaction"
-  #echo_info "[ADT_INST] If you want to use silent installation, please enter S:"
-  #echo_info "[ADT_INST] If you want to customize installation, please enter C:"
-  #echo_info "[ADT_INST} If you want to exit current installation, please enter X:"
-  echo_info "There're two ways you can do installation: silent mode or interactive mode. To choose silent mode, which means you opt for the system to override the existing data under the specified installation directories without prompting for your confirmation.  Please be cautious with this selection which may trigger your losing data.  With the interactive mode, you have to closely monitor the installation process, since it will prompt you each step it needs to override some existing data.  To choose silent mode, please enter [S], for interactive mode, please enter [I] or [X] to exit the installation."
-  echo_info "[ADT_INST] Please enter your selections here:"
-  read YOCTOADT_SEL
-  YOCTOADT_SEL=`tr '[a-z]' '[A-Z]'<<<"$YOCTOADT_SEL"`
-  if [ "$YOCTOADT_SEL" == "S" ]; then
-    return "0"
-  elif [ "$YOCTOADT_SEL" == "I" ]; then
-    return "1"
-  elif [ "$YOCTOADT_SEL" == "X" ]; then
-    echo_info "\n############################################################"
-    echo_info "# User cancelled installation!"
-    echo_info "############################################################\n"
-    exit 1
-  fi
-done
-
-
-}
-
-confirm_install()
-{
-# below are prompt, make sure user still want to install even meet
-# some prompts
-
-#User likes to enjoy silent installation, we will not break his
-#installation process here
-if [ "$1" == "0" ]; then
-  return
-fi
-
-while true; do
-  echo_info "[ADT_INST] Do you want to continue installation? Please enter Y/N:"
-  read YOCTOADT_INSTALL
-  YOCTOADT_INSTALL=`tr '[a-z]' '[A-Z]'<<<"$YOCTOADT_INSTALL"`
-  if [ "$YOCTOADT_INSTALL" == "Y" ]; then
-    break
-  elif [ "$YOCTOADT_INSTALL" == "N" ]; then
-    echo_info "\n############################################################"
-    echo_info "# User cancelled installation!"
-    echo_info "############################################################\n"
-    exit 1
-  fi
-done
-}
-
-check_result()
-{
-  result=$?
-  if [ $result -eq 1 ]; then
-    exit -1
-  elif [  $result -ne 0 ]; then
-     echo_info "\n#############################################################################"
-     echo_info "# Meet error(s) when installing Yocto ADT! Please check log file for details. "
-     echo_info "#############################################################################\n"
-    exit -1
-  fi
-}
-
-# yocto adt installation log file
-YOCTOADT_INSTALL_LOG_FILE="adt_installer.log"
-# Temp folders holding qemu/rootfs downloaded images
-# It will be put into the installation folder
-LOCAL_DOWNLOAD="./download_image"
-
-
diff --git a/meta/recipes-devtools/installer/adt-installer_1.0.bb b/meta/recipes-devtools/installer/adt-installer_1.0.bb
deleted file mode 100644
index 4c2f097..0000000
--- a/meta/recipes-devtools/installer/adt-installer_1.0.bb
+++ /dev/null
@@ -1,94 +0,0 @@
-# Yocto ADT Installer bb file
-#
-# Copyright 2010-2012 by Intel Corp.
-#
-# Permission is hereby granted, free of charge, to any person obtaining a copy 
-# of this software and associated documentation files (the "Software"), to deal 
-# in the Software without restriction, including without limitation the rights 
-# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
-# copies of the Software, and to permit persons to whom the Software is 
-# furnished to do so, subject to the following conditions:
-
-# The above copyright notice and this permission notice shall be included in 
-# all copies or substantial portions of the Software.
-
-# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
-# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
-# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
-# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
-# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
-# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
-# THE SOFTWARE.
-
-
-SUMMARY = "Application Development Toolkit"
-DESCRIPTION = "Creates the Application Development Toolkit (ADT) installer tarball"
-HOMEPAGE = "http://www.yoctoproject.org/tools-resources/projects/application-development-toolkit-adt"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-LICENSE = "MIT"
-
-PACKAGES = ""
-INHIBIT_DEFAULT_DEPS = "1"
-
-PR = "r11"
-
-ADT_DEPLOY = "${DEPLOY_DIR}/sdk/"
-ADT_DIR = "${WORKDIR}/adt-installer/"
-S = "${WORKDIR}/opkg-${PV}"
-
-PV = "0.3.0"
-SRC_URI = "http://downloads.yoctoproject.org/releases/opkg/opkg-${PV}.tar.gz \
-           file://wget_cache.patch \
-           file://adt_installer \
-           file://scripts/adt_installer_internal \
-           file://scripts/util \
-           file://scripts/data_define \
-           file://scripts/extract_rootfs \
-           file://adt_installer.conf \
-           file://opkg/conf/opkg-sdk-x86_64.conf \
-           file://opkg/conf/opkg-sdk-i686.conf \
-	  "
-
-SRC_URI[md5sum] = "3412cdc71d78b98facc84b19331ec64e"
-SRC_URI[sha256sum] = "7f735d1cdb8ef3718fb0f9fba44ca0d9a5c90d3a7f014f37a6d2f9474f54988f"
-
-ADTREPO ?= "http://adtrepo.yoctoproject.org/${SDK_VERSION}"
-
-# This recipe makes no sense as a multilib
-MULTILIBS = ""
-
-do_populate_adt[umask] = "022"
-
-fakeroot do_populate_adt () {
-	cd ${WORKDIR}
-	mkdir -p ${ADT_DEPLOY}
-	rm -f ${ADT_DEPLOY}/adt_installer.tar.bz2
-	rm -rf ${ADT_DIR}
-	mkdir -p ${ADT_DIR}/opkg/build
-	cp -r opkg ${ADT_DIR}/
-	sed -i -e 's#ADTREPO_URL#${ADTREPO}#' ${ADT_DIR}/opkg/conf/*.conf
-	cp -r opkg-${PV} ${ADT_DIR}/opkg/build/
-	mv ${ADT_DIR}/opkg/build/opkg-${PV} ${ADT_DIR}/opkg/build/opkg-svn
-	rm -rf ${ADT_DIR}/opkg/build/opkg-svn/patches ${ADT_DIR}/opkg/build/opkg-svn/.pc
-	cp -r scripts ${ADT_DIR}/
-	cp adt_installer ${ADT_DIR}
-	cp adt_installer.conf ${ADT_DIR}
-	sed -i -e 's#ADTREPO#${ADTREPO}#' ${ADT_DIR}/adt_installer.conf
-	echo 'SDK_VENDOR=${SDK_VENDOR}' >> ${ADT_DIR}/scripts/data_define
-	echo 'DEFAULT_INSTALL_FOLDER=${SDKPATH}' >> ${ADT_DIR}/scripts/data_define
-	cp ${COREBASE}/scripts/relocate_sdk.py ${ADT_DIR}/scripts/
-	tar cfj adt_installer.tar.bz2 adt-installer
-	cp ${WORKDIR}/adt_installer.tar.bz2 ${ADT_DEPLOY}
-}
-
-do_configure[noexec] = "1"
-do_compile[noexec] = "1"
-do_package[noexec] = "1"
-do_packagedata[noexec] = "1"
-do_package_write_ipk[noexec] = "1"
-do_package_write_rpm[noexec] = "1"
-do_package_write_deb[noexec] = "1"
-do_poplulate_sysroot[noexec] = "1"
-
-addtask populate_adt before do_build after do_install
diff --git a/meta/recipes-devtools/installer/files/wget_cache.patch b/meta/recipes-devtools/installer/files/wget_cache.patch
deleted file mode 100644
index 9117510..0000000
--- a/meta/recipes-devtools/installer/files/wget_cache.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
----
- libopkg/opkg_download_wget.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libopkg/opkg_download_wget.c b/libopkg/opkg_download_wget.c
-index 9001493..18ef91e 100644
---- a/libopkg/opkg_download_wget.c
-+++ b/libopkg/opkg_download_wget.c
-@@ -50,6 +50,7 @@ int opkg_download_backend(const char *src, const char *dest,
- 
-     argv[i++] = "wget";
-     argv[i++] = "-q";
-+    argv[i++] = "--no-cache";
-     if (opkg_config->http_proxy || opkg_config->ftp_proxy) {
-         argv[i++] = "-Y";
-         argv[i++] = "on";
--- 
-1.9.1
-



