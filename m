Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DFEAE6B1E8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 15:10:56 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 10 Sep 2013 08:07:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,878,1371106800"; d="scan'208";a="401243782"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 10 Sep 2013 08:10:57 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Sep 2013 18:10:50 +0300
Message-Id: <810ebc8e4530ba81d5bd09ab05b24a224488496c.1378824959.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1378824959.git.laurentiu.palcu@intel.com>
References: <cover.1378824959.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1378824959.git.laurentiu.palcu@intel.com>
References: <cover.1378824959.git.laurentiu.palcu@intel.com>
Subject: [PATCH 5/5] adt-installer: allow installation of other machines
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
X-List-Received-Date: Tue, 10 Sep 2013 15:10:57 -0000

Currently, adt-installer allows only the installation of qemu target
sysroots.

The changes in this patch do the following:
 * add a new setting in adt-installer.conf (YOCTOADT_TARGET_MACHINE) for
   each target architecture. For example, for arm we can choose to use a
   qemuarm sysroot or a beagleboard sysroot. By default, only the qemu
   target sysroots are selected (current behavior);
 * change adt_installer scripts to allow installing the correct
   meta-environment package for the selected machine;
 * remove some left-over commented lines;
 * use packagegroup-cross-canadian-${MACHINE} when installing the cross
   canadian packages instead of doing it separately for each package;
 * change the opkg config files in order to be able to find the
   packagegroup package, which is allarch;

[YOCTO #4783]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../installer/adt-installer/adt_installer          |   33 ++++++++++----------
 .../installer/adt-installer/adt_installer.conf     |   20 +++++++++---
 .../adt-installer/opkg/conf/opkg-sdk-i686.conf     |    1 +
 .../adt-installer/opkg/conf/opkg-sdk-x86_64.conf   |    1 +
 .../adt-installer/scripts/adt_installer_internal   |   27 +++++-----------
 5 files changed, 42 insertions(+), 40 deletions(-)

diff --git a/meta/recipes-devtools/installer/adt-installer/adt_installer b/meta/recipes-devtools/installer/adt-installer/adt_installer
index a6042b9..76afcf3 100755
--- a/meta/recipes-devtools/installer/adt-installer/adt_installer
+++ b/meta/recipes-devtools/installer/adt-installer/adt_installer
@@ -233,44 +233,44 @@ wget "$YOCTOADT_REPO/rootfs/$1" -P $LOCAL_DOWNLOAD --progress=bar:force 2>&1 | t
 
 
 
-#Need two input params, $1 -- arch_type(arm powerpc x86 mips) $2 rootfs_image_type (a list of sdk sato minimal lsb)
-get_qemu_image()
+#Need three input params:
+# $1 arch_type(arm powerpc x86 mips)
+# $2 machine(qemuarm beagleboard)
+# $3 rootfs_image_type (a list of sdk sato minimal lsb)
+get_image()
 {
+  local machine=$2
  
-  local target=`echo "$1" | sed -e 's/x86_64/x86-64/'`
-
   if [ "$1" == "x86" ] || [ "$1" == "x86_64" ]; then
-    qemu_kernel="bzImage-qemu$target.bin"
+    kernel="bzImage-$machine.bin"
   elif [ "$1" == "ppc" ] || [ "$1" == "mips" ]; then
-    qemu_kernel="vmlinux-qemu$target.bin"
+    kernel="vmlinux-$machine.bin"
   else
-    qemu_kernel="zImage-qemu$target.bin"
+    kernel="zImage-$machine.bin"
   fi
 
   #echo_info "[ADT_INST] Downloading qemu kernel binary: $qemu_kernel"
-  download_file qemu$1/$qemu_kernel
+  download_file $machine/$kernel
   check_result
   
   for image_type in $select_rootfs; do
-    #echo_info "[ADT_INST] Downloading rootfs file: core-image-$image_type-qemu$1.tar.bz2"
-    filename="core-image-$image_type-qemu$target.tar.bz2"
-    download_file qemu$1/$filename
+    #echo_info "[ADT_INST] Downloading rootfs file: core-image-$image_type-$machine.tar.bz2"
+    filename="core-image-$image_type-$machine.tar.bz2"
+    download_file $machine/$filename
     check_result
   done
 }
 
 download_images()
 {
-  #select_target_var="\$YOCTOADT_TARGET_$1"
-  #select_target=`eval echo $select_target_var`
-
-  #if [ "$select_target" == "Y" ]; then
   select_rootfs_var="\$YOCTOADT_ROOTFS_$1"
   select_sysroot_image_var="\$YOCTOADT_TARGET_SYSROOT_IMAGE_$1"
   select_sysroot_var="\$YOCTOADT_TARGET_SYSROOT_LOC_$1"
+  select_machine_var="\$YOCTOADT_TARGET_MACHINE_$1"
   select_rootfs=`eval echo $select_rootfs_var`
   select_sysroot_image=`eval echo $select_sysroot_image_var`
   select_sysroot=`eval echo $select_sysroot_var`
+  select_machine=`eval echo $select_machine_var`
 
   if [ -n "$select_sysroot" ]; then
     select_sysroot=`readlink -m $select_sysroot`
@@ -282,13 +282,14 @@ download_images()
     #echo_info "# To be downloaded rootfs image details defined in adt_installer.conf"
     #echo_info "############################################################################"
     echo_info "# Target architecture:\t\t$1"
+    echo_info "# Target machine:\t\t$select_machine"
     echo_info "# Root_fs images:\t\t$select_rootfs"
     echo_info "# Target sysroot image:\t\t$select_sysroot_image"
     echo_info "# Target sysroot loc:\t\t$select_sysroot"
     echo_info "\n"
     #echo_info "############################################################################\n"
     else
-    get_qemu_image $1 $select_rootfs
+    get_image $1 $select_machine $select_rootfs
     fi
   fi
 }
diff --git a/meta/recipes-devtools/installer/adt-installer/adt_installer.conf b/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
index 171d2ac..cc54acd 100644
--- a/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
+++ b/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
@@ -43,23 +43,33 @@ YOCTOADT_NFS_UTIL="Y"
 YOCTOADT_ROOTFS_arm="minimal sato-sdk"
 #Specify which root filesystem file to use to extract as target sysroot.  Please ensure the entry is in the list of downloaded root filesystem files that specified above in YOCTOADT_ROOTFS_$arch
 YOCTOADT_TARGET_SYSROOT_IMAGE_arm="sato-sdk"
+#The machine for which you want to download the image. Each machine might have
+#different compilation options in order to select certain hardware models or
+#configurations
+YOCTOADT_TARGET_MACHINE_arm="qemuarm"
 #The location where the target sysroot will be setup
-YOCTOADT_TARGET_SYSROOT_LOC_arm="$HOME/test-yocto/arm"
+YOCTOADT_TARGET_SYSROOT_LOC_arm="$HOME/test-yocto/$YOCTOADT_TARGET_MACHINE_arm"
+
 
 #Here's another example for setting up target arch of x86, by uncommenting it will trigger the installer to download and setup 2 sysroot environment for 2 target arches: arm and x86.  If you want to add more target arch support, you can append more entries by following these samples
 #YOCTOADT_ROOTFS_x86="sato-sdk"
 #YOCTOADT_TARGET_SYSROOT_IMAGE_x86="sato-sdk"
-#YOCTOADT_TARGET_SYSROOT_LOC_x86="$HOME/test-yocto/x86"
+#YOCTOADT_TARGET_MACHINE_x86="qemux86"
+#YOCTOADT_TARGET_SYSROOT_LOC_x86="$HOME/test-yocto/$YOCTOADT_TARGET_MACHINE_x86"
 
 #Here's some template of other arches, which you need to change the value in ""
 #YOCTOADT_ROOTFS_x86_64="sato-sdk"
 #YOCTOADT_TARGET_SYSROOT_IMAGE_x86_64="sato-sdk"
-#YOCTOADT_TARGET_SYSROOT_LOC_x86_64="$HOME/test-yocto/x86_64"
+#YOCTOADT_TARGET_MACHINE_x86_64="qemux86-64"
+#YOCTOADT_TARGET_SYSROOT_LOC_x86_64="$HOME/test-yocto/$YOCTOADT_TARGET_MACHINE_x86_64"
 
 #YOCTOADT_ROOTFS_ppc="sato-sdk"
 #YOCTOADT_TARGET_SYSROOT_IMAGE_ppc="sato-sdk"
-#YOCTOADT_TARGET_SYSROOT_LOC_ppc="$HOME/test-yocto/ppc"
+#YOCTOADT_TARGET_MACHINE_ppc="qemuppc"
+#YOCTOADT_TARGET_SYSROOT_LOC_ppc="$HOME/test-yocto/$YOCTOADT_TARGET_MACHINE_ppc"
 
 #YOCTOADT_ROOTFS_mips="sato-sdk"
 #YOCTOADT_TARGET_SYSROOT_IMAGE_mips="sato-sdk"
-#YOCTOADT_TARGET_SYSROOT_LOC_mips="$HOME/test-yocto/mips"
+#YOCTOADT_TARGET_MACHINE_mips="qemumips"
+#YOCTOADT_TARGET_SYSROOT_LOC_mips="$HOME/test-yocto/$YOCTOADT_TARGET_MACHINE_mips"
+
diff --git a/meta/recipes-devtools/installer/adt-installer/opkg/conf/opkg-sdk-i686.conf b/meta/recipes-devtools/installer/adt-installer/opkg/conf/opkg-sdk-i686.conf
index 71c62e8..ee169f6 100644
--- a/meta/recipes-devtools/installer/adt-installer/opkg/conf/opkg-sdk-i686.conf
+++ b/meta/recipes-devtools/installer/adt-installer/opkg/conf/opkg-sdk-i686.conf
@@ -3,3 +3,4 @@ arch any 6
 arch noarch 11
 arch i686-nativesdk 16
 src yp-i686-nativesdk ADTREPO_URL/adt-ipk/i686-nativesdk
+src yp-i686-nativesdk ADTREPO_URL/adt-ipk/all
diff --git a/meta/recipes-devtools/installer/adt-installer/opkg/conf/opkg-sdk-x86_64.conf b/meta/recipes-devtools/installer/adt-installer/opkg/conf/opkg-sdk-x86_64.conf
index f0d0634..199ea50 100644
--- a/meta/recipes-devtools/installer/adt-installer/opkg/conf/opkg-sdk-x86_64.conf
+++ b/meta/recipes-devtools/installer/adt-installer/opkg/conf/opkg-sdk-x86_64.conf
@@ -3,3 +3,4 @@ arch any 6
 arch noarch 11
 arch x86_64-nativesdk 16
 src yp-x86_64-nativesdk ADTREPO_URL/adt-ipk/x86_64-nativesdk
+src yp-x86_64-nativesdk ADTREPO_URL/adt-ipk/all
diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
index 462199c..abed90d 100755
--- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
@@ -121,23 +121,12 @@ for pkg in $BASE_HOSTSDK_PKGNAMES; do
   check_result
 done
 
-for native_target_type in $YOCTOADT_TARGETS; do
-  native_target_type=`echo "$native_target_type" | sed -e 's/x86_64/x86-64/' -e 's/ppc/powerpc/'  -e 's/x86$/i586/'`
-  echo_info "Installing cross toolchain for $native_target_type ..."
-  echo_info "Installing binutils for $native_target_type ..."
-  $OPKG_INSTALL_NATIVE_CMD binutils-cross-canadian-$native_target_type &>> $YOCTOADT_INSTALL_LOG_FILE
+for target_type in $YOCTOADT_TARGETS; do
+  machine_var="\$YOCTOADT_TARGET_MACHINE_$target_type"
+  machine=`eval echo $machine_var`
+  echo_info "Installing cross canadian packages for $machine ..."
+  $OPKG_INSTALL_NATIVE_CMD packagegroup-cross-canadian-$machine &>> $YOCTOADT_INSTALL_LOG_FILE
   check_result
-  echo_info "Installing gcc for $native_target_type ..."
-  $OPKG_INSTALL_NATIVE_CMD gcc-cross-canadian-$native_target_type &>> $YOCTOADT_INSTALL_LOG_FILE
-  check_result
-  echo_info "Installing gdb for $native_target_type ..."
-  $OPKG_INSTALL_NATIVE_CMD gdb-cross-canadian-$native_target_type &>> $YOCTOADT_INSTALL_LOG_FILE
-  check_result
-
-  echo_info "Installing environment file for $native_target_type ..."
-  $OPKG_INSTALL_NATIVE_CMD meta-environment-$native_target_type &>> $YOCTOADT_INSTALL_LOG_FILE
-  check_result
-
 done
 
 if [ "$YOCTOADT_QEMU" == "Y" ] || [ "$YOCTOADT_QEMU" = "y" ]; then
@@ -255,9 +244,9 @@ fi
 
 echo_info "Installing target sysroot for arch: $1, rootfs type: $target_sysroot_image, location: $target_sysroot"
 
-
-qemu_type=`echo "$1" | sed -e 's/x86_64/x86-64/'`
-sysroot_image_name="core-image-$target_sysroot_image-qemu$qemu_type.tar.bz2"
+target_machine_var="\$YOCTOADT_TARGET_MACHINE_$1"
+target_machine=`eval echo $target_machine_var`
+sysroot_image_name="core-image-$target_sysroot_image-$target_machine.tar.bz2"
     #echo_info "Extracting rootfs: $sysroot_image_name, using pseudo..."
 
 $SUDO scripts/extract_rootfs $sysroot_image_name $target_sysroot $OECORE_NATIVE_SYSROOT $user_inst_type
-- 
1.7.9.5


