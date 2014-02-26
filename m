Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6DD076EFCB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 13:54:50 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 26 Feb 2014 05:54:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,548,1389772800"; d="scan'208";a="488416007"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by fmsmga002.fm.intel.com with ESMTP; 26 Feb 2014 05:54:48 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Feb 2014 15:54:45 +0200
Message-Id: <72cf90ecf51d88becfaf037b6233c78e8c6e4a9c.1393422829.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1393422829.git.laurentiu.palcu@intel.com>
References: <cover.1393422829.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1393422829.git.laurentiu.palcu@intel.com>
References: <cover.1393422829.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/1] adt_installer: fix issue with x86_64
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
X-List-Received-Date: Wed, 26 Feb 2014 13:54:50 -0000

When the default tune for x86_64 was changed to core2-64, the
environment setup script name did not contain x86 anymore. Hence, the
adt_installer failed for x86_64.

This commit contains a generic fix and is supposed to work with any kind
of machine/tune setting. It's actually extracting the environment script
name using 'opkg files meta-environment-MACHINE'. So, no need to do any
other sort of searches. We know exactly which is the environment setup
script for the specified machine.

[YOCTO #5806]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../adt-installer/scripts/adt_installer_internal   |   61 +++++++++++---------
 1 file changed, 35 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
index e3422f5..432ba41 100755
--- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
@@ -64,6 +64,23 @@ get_sudo_app()
   fi
 }
 
+# this function accepts arch_type (x86, x86_64, arm, ppc, mips) as the first
+# argument, returning the location of the target rootfs
+get_target_rootfs_location() {
+	[ -z "$1" ] && return
+
+	arch_type=$1
+	# rootfs extraction directory
+	target_sysroot_var="\$YOCTOADT_TARGET_SYSROOT_LOC_$arch_type"
+	target_sysroot=`eval echo $target_sysroot_var`
+
+	if [ "$target_sysroot" == "" ]; then
+		return
+	else
+		echo "`readlink -m $target_sysroot`"
+	fi
+}
+
 
 #let us install a qemu-native firstly
 #installation step 2
@@ -134,6 +151,22 @@ for target_type in $YOCTOADT_TARGETS; do
   echo_info "Installing cross canadian packages for $machine ..."
   $OPKG_INSTALL_NATIVE_CMD packagegroup-cross-canadian-$machine &>> $YOCTOADT_INSTALL_LOG_FILE
   check_result
+
+  target_sysroot=`get_target_rootfs_location $target_type`
+  [ -z "$target_sysroot" ] && continue
+
+  # get the environment setup script paths: original (the one before relocation)
+  # and relocated
+  env_script_original=`$OPKG_CMD -f $OPKG_CONFIG_FILE -o $NATIVE_INSTALL_DIR files meta-environment-$machine|\
+							grep environment-setup`
+  env_script_relocated=$INSTALL_FOLDER/${env_script_original##*/}
+
+  # opkg will not install packagegroup-cross-canadian package if it was already
+  # installed. So, the environment script is in one place or the other.
+  [ -e "$env_script_original" ] && env_script=$env_script_original
+  [ -e "$env_script_relocated" ] && env_script=$env_script_relocated
+
+  $SUDO sed -i -e "s%##SDKTARGETSYSROOT##%$target_sysroot%g" $env_script
 done
 
 if [ "$YOCTOADT_QEMU" == "Y" ] || [ "$YOCTOADT_QEMU" = "y" ]; then
@@ -232,15 +265,8 @@ echo_info "\nSuccessfully installed selected native ADT!"
 install_target()
 {
 
-# rootfs extraction directory
-target_sysroot_var="\$YOCTOADT_TARGET_SYSROOT_LOC_$1"
-target_sysroot=`eval echo $target_sysroot_var`
-
-if [ "$target_sysroot" == "" ]; then
-  return 0
-else
-  target_sysroot=`readlink -m $target_sysroot`
-fi
+target_sysroot=`get_target_rootfs_location $1`
+[ -z "$target_sysroot" ] && return 0
 
 target_sysroot_image_var="\$YOCTOADT_TARGET_SYSROOT_IMAGE_$1"
 target_sysroot_image=`eval echo $target_sysroot_image_var`
@@ -261,23 +287,6 @@ SUDO=$(get_sudo_app $target_sysroot)
 
 $SUDO scripts/extract_rootfs $sysroot_image_name $target_sysroot $OECORE_NATIVE_SYSROOT $user_inst_type
 check_result
-
-echo_info "Updating environment script with target sysroot location."
-if [ "$1" == "x86"  ]; then
-  env_filename=`ls $INSTALL_FOLDER/environment-setup-i586*`
-else
-  env_filename=`ls $INSTALL_FOLDER/environment-setup-$1*`
-fi
-
-if [ ! -z "$env_filename" ]; then
-  SUDO=$(get_sudo_app $INSTALL_FOLDER)
-  $SUDO sed -i -e "s%##SDKTARGETSYSROOT##%$target_sysroot%g" $env_filename
-else
-  echo_info "[ADT_INST] Error: Failed to find environment script for arch: $1"
-  return 1 
-fi
-
-
 }
 
 
-- 
1.7.9.5


