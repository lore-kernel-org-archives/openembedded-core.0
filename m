Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 28D5F6204F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 15:16:22 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 17 Jan 2014 07:12:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,674,1384329600"; d="scan'208";a="460537462"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jan 2014 07:16:21 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2014 17:16:18 +0200
Message-Id: <f255e549d5054b571ea1cd66b66cbc74f38a4137.1389971728.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1389971728.git.laurentiu.palcu@intel.com>
References: <cover.1389971728.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1389971728.git.laurentiu.palcu@intel.com>
References: <cover.1389971728.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/1] adt_installer: do not install rootfs if target is not selected
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
X-List-Received-Date: Fri, 17 Jan 2014 15:16:22 -0000

Currently, if YOCTOADT_TARGETS does not contain an architecture but the
rootfs/machine settings are uncommented, then the rootfs is installed
and adt will throw an error because is not able to find the toolchain
environment script.

This patch will:
 * not allow to install a target rootfs if the toolchain for the
   target architecture is not selected;
 * uncomment the target rootfs/machine settings for the other
   architectures since it's easier for the user to just add a new
   architecture in YOCTOADT_TARGETS and have the target rootfs
   installed;

[YOCTO #5727]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../installer/adt-installer/adt_installer          |    4 ++--
 .../installer/adt-installer/adt_installer.conf     |   24 ++++++++++----------
 .../adt-installer/scripts/adt_installer_internal   |    2 +-
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-devtools/installer/adt-installer/adt_installer b/meta/recipes-devtools/installer/adt-installer/adt_installer
index a150de0..1f2d039 100755
--- a/meta/recipes-devtools/installer/adt-installer/adt_installer
+++ b/meta/recipes-devtools/installer/adt-installer/adt_installer
@@ -55,7 +55,7 @@ usage ()
     echo_info "# Your rootfs image(s) and target sysroot selections from adt_installer.conf"
     echo_info "##############################################################################"
 prompt=1
-for arch_type in $YOCTOADT_SUPPORTED_TARGETS; do
+for arch_type in $YOCTOADT_TARGETS; do
   download_images $arch_type $prompt
 done
     echo_info "############################################################################\n"
@@ -403,7 +403,7 @@ else
   override_oldfile=0
 fi
 
-for arch_type in $YOCTOADT_SUPPORTED_TARGETS; do
+for arch_type in $YOCTOADT_TARGETS; do
   download_images $arch_type
 done
 
diff --git a/meta/recipes-devtools/installer/adt-installer/adt_installer.conf b/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
index 9329a8d..867fbd1 100644
--- a/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
+++ b/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
@@ -58,18 +58,18 @@ YOCTOADT_TARGET_MACHINE_x86="qemux86"
 YOCTOADT_TARGET_SYSROOT_LOC_x86="$HOME/test-yocto/$YOCTOADT_TARGET_MACHINE_x86"
 
 #Here's some template of other arches, which you need to change the value in ""
-#YOCTOADT_ROOTFS_x86_64="sato-sdk"
-#YOCTOADT_TARGET_SYSROOT_IMAGE_x86_64="sato-sdk"
-#YOCTOADT_TARGET_MACHINE_x86_64="qemux86-64"
-#YOCTOADT_TARGET_SYSROOT_LOC_x86_64="$HOME/test-yocto/$YOCTOADT_TARGET_MACHINE_x86_64"
+YOCTOADT_ROOTFS_x86_64="sato-sdk"
+YOCTOADT_TARGET_SYSROOT_IMAGE_x86_64="sato-sdk"
+YOCTOADT_TARGET_MACHINE_x86_64="qemux86-64"
+YOCTOADT_TARGET_SYSROOT_LOC_x86_64="$HOME/test-yocto/$YOCTOADT_TARGET_MACHINE_x86_64"
 
-#YOCTOADT_ROOTFS_ppc="sato-sdk"
-#YOCTOADT_TARGET_SYSROOT_IMAGE_ppc="sato-sdk"
-#YOCTOADT_TARGET_MACHINE_ppc="qemuppc"
-#YOCTOADT_TARGET_SYSROOT_LOC_ppc="$HOME/test-yocto/$YOCTOADT_TARGET_MACHINE_ppc"
+YOCTOADT_ROOTFS_ppc="sato-sdk"
+YOCTOADT_TARGET_SYSROOT_IMAGE_ppc="sato-sdk"
+YOCTOADT_TARGET_MACHINE_ppc="qemuppc"
+YOCTOADT_TARGET_SYSROOT_LOC_ppc="$HOME/test-yocto/$YOCTOADT_TARGET_MACHINE_ppc"
 
-#YOCTOADT_ROOTFS_mips="sato-sdk"
-#YOCTOADT_TARGET_SYSROOT_IMAGE_mips="sato-sdk"
-#YOCTOADT_TARGET_MACHINE_mips="qemumips"
-#YOCTOADT_TARGET_SYSROOT_LOC_mips="$HOME/test-yocto/$YOCTOADT_TARGET_MACHINE_mips"
+YOCTOADT_ROOTFS_mips="sato-sdk"
+YOCTOADT_TARGET_SYSROOT_IMAGE_mips="sato-sdk"
+YOCTOADT_TARGET_MACHINE_mips="qemumips"
+YOCTOADT_TARGET_SYSROOT_LOC_mips="$HOME/test-yocto/$YOCTOADT_TARGET_MACHINE_mips"
 
diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
index 2eb13a9..2fef7b0 100755
--- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
@@ -292,7 +292,7 @@ user_inst_type=$1
 install_native_sdk $user_inst_type
 check_result
 
-for arch_type in $YOCTOADT_SUPPORTED_TARGETS; do
+for arch_type in $YOCTOADT_TARGETS; do
   install_target $arch_type
   check_result
 done
-- 
1.7.9.5


