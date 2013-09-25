Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4F2DC610D4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 15:40:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 25 Sep 2013 08:37:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,978,1371106800"; d="scan'208";a="409209646"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 25 Sep 2013 08:40:34 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Sep 2013 18:40:29 +0300
Message-Id: <d391a9ca4580c8238702468e3b764e907653bedf.1380123317.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1380123317.git.laurentiu.palcu@intel.com>
References: <cover.1380123317.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1380123317.git.laurentiu.palcu@intel.com>
References: <cover.1380123317.git.laurentiu.palcu@intel.com>
Subject: [PATCH 2/2] adt-installer: add warning if MACHINE is not set in adt-installer.conf
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
X-List-Received-Date: Wed, 25 Sep 2013 15:40:35 -0000

Since the MACHINE can now be specified in adt-installer.conf, in order to
install the proper toolchain and environment script for the given
machine, add a sanity checking at the beginning to make sure MACHINE is
set for the wanted architecture.

Also:
 * uncomment the x86 target variables, in adt-installer.conf, in order
   to have qemux86 MACHINE set, by default, and also the sysroot
   installed (since it doesn't make much sense to install the toolchain
   without a target sysroot);
 * remove 'sudo' when creating relocate_sdk_tmp.py because the file is
   created in adt-installer directory;

[YOCTO #5259]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../installer/adt-installer/adt_installer          |   14 +++++++++++++-
 .../installer/adt-installer/adt_installer.conf     |   10 +++++-----
 .../adt-installer/scripts/adt_installer_internal   |    4 ++--
 3 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/installer/adt-installer/adt_installer b/meta/recipes-devtools/installer/adt-installer/adt_installer
index 76afcf3..f3c0518 100755
--- a/meta/recipes-devtools/installer/adt-installer/adt_installer
+++ b/meta/recipes-devtools/installer/adt-installer/adt_installer
@@ -67,6 +67,10 @@ validate_config()
 
   for selected_arch_type in $YOCTOADT_TARGETS; do
     found=0
+    select_machine_var="\$YOCTOADT_TARGET_MACHINE_$selected_arch_type"
+    select_machine=`eval echo $select_machine_var`
+    show_error_banner=0
+
     for supported_arch_type in $YOCTOADT_SUPPORTED_TARGETS; do
       if [ "$selected_arch_type" == "$supported_arch_type" ]; then
         found=1
@@ -75,10 +79,18 @@ validate_config()
     done
     if [ $found == 0 ]; then
        echo_info "[ADT_INST] Error: YOCTADT_TARGETS in adt_installer.conf contains invalid entries: $YOCTOADT_TARGETS. Valid values are: $YOCTOADT_SUPPORTED_TARGETS"
+       show_error_banner=1
+    elif [ -z "$select_machine" ]; then
+       echo_info "[ADT_INST] Error: No MACHINE was defined for $selected_arch_type architecture! This is needed to install the toolchain and the correct environment settings."
+       echo_info "[ADT_INST] To do that, in adt-installer.conf, set the following variable: YOCTOADT_TARGET_MACHINE_$selected_arch_type"
+       show_error_banner=1
+    fi
+
+    if [ $show_error_banner == 1 ]; then
        echo -e "\n#############################################################################"
        echo -e "# Meet error(s) when installing Yocto ADT! Please check log file for details. "
        echo -e "#############################################################################\n"
-      exit -1
+       exit -1
     fi
   done
 
diff --git a/meta/recipes-devtools/installer/adt-installer/adt_installer.conf b/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
index cc54acd..9329a8d 100644
--- a/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
+++ b/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
@@ -51,11 +51,11 @@ YOCTOADT_TARGET_MACHINE_arm="qemuarm"
 YOCTOADT_TARGET_SYSROOT_LOC_arm="$HOME/test-yocto/$YOCTOADT_TARGET_MACHINE_arm"
 
 
-#Here's another example for setting up target arch of x86, by uncommenting it will trigger the installer to download and setup 2 sysroot environment for 2 target arches: arm and x86.  If you want to add more target arch support, you can append more entries by following these samples
-#YOCTOADT_ROOTFS_x86="sato-sdk"
-#YOCTOADT_TARGET_SYSROOT_IMAGE_x86="sato-sdk"
-#YOCTOADT_TARGET_MACHINE_x86="qemux86"
-#YOCTOADT_TARGET_SYSROOT_LOC_x86="$HOME/test-yocto/$YOCTOADT_TARGET_MACHINE_x86"
+#Here's a template for setting up target arch of x86 
+YOCTOADT_ROOTFS_x86="sato-sdk"
+YOCTOADT_TARGET_SYSROOT_IMAGE_x86="sato-sdk"
+YOCTOADT_TARGET_MACHINE_x86="qemux86"
+YOCTOADT_TARGET_SYSROOT_LOC_x86="$HOME/test-yocto/$YOCTOADT_TARGET_MACHINE_x86"
 
 #Here's some template of other arches, which you need to change the value in ""
 #YOCTOADT_ROOTFS_x86_64="sato-sdk"
diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
index ebfdf2a..2eb13a9 100755
--- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
@@ -195,8 +195,8 @@ escaped_sdkpath=$(echo $DEFAULT_INSTALL_FOLDER |sed -e "s:[\+\.]:\\\\\\\\\0:g")
 
 # We don't change the script in-place since we may want the user to re-run
 # adt-installer script
-$SUDO sh -c "sed -e '"s:##DEFAULT_INSTALL_DIR##:$escaped_sdkpath:"' scripts/relocate_sdk.py > scripts/relocate_sdk_tmp.py"
-$SUDO chmod +x scripts/relocate_sdk_tmp.py
+sed -e "s:##DEFAULT_INSTALL_DIR##:$escaped_sdkpath:" scripts/relocate_sdk.py > scripts/relocate_sdk_tmp.py
+chmod +x scripts/relocate_sdk_tmp.py
 
 dl_path=$(find $OECORE_NATIVE_SYSROOT/lib -name "ld-linux*")
 executable_files=$(find $OECORE_NATIVE_SYSROOT -type f -perm /111)
-- 
1.7.9.5


