Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 45A8461005
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 15:40:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 25 Sep 2013 08:37:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,978,1371106800"; d="scan'208";a="409209634"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 25 Sep 2013 08:40:33 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Sep 2013 18:40:28 +0300
Message-Id: <e411ce5674b14719d0f6e2e30d109451e330a35c.1380123317.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1380123317.git.laurentiu.palcu@intel.com>
References: <cover.1380123317.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1380123317.git.laurentiu.palcu@intel.com>
References: <cover.1380123317.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/2] adt-installer: check if sudo is needed when installing target sysroot
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

Currently, if SDK is installed in a directory that needs sudo
preivileges, the target sysroot is also installed with sudo, even though
the location is in users's home directory.

This patch reuses the ownership checking code and uses it to check if
sudo is needed for target sysroot too.

[YOCTO #5259]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../adt-installer/scripts/adt_installer_internal   |   51 ++++++++++++--------
 1 file changed, 31 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
index abed90d..ebfdf2a 100755
--- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
@@ -42,6 +42,28 @@ parse_config()
   esac
 }
 
+get_sudo_app()
+{
+  username=$(id -nu)
+
+  # find the owner of the parent
+  dir=$1
+  while [ 1 ]; do
+      if [ -d $dir ]; then
+          owner=$(stat -c %U $dir)
+          break
+     else
+          dir=$(dirname $dir)
+     fi
+  done
+
+  if [ "$owner" = "$username" ]; then
+      true
+  else
+      echo sudo
+  fi
+}
+
 
 #let us install a qemu-native firstly
 #installation step 2
@@ -60,26 +82,11 @@ fi
 
 #Now begin to install native sdk and extract qemu rootfs which needs privilege rights
 #depending on the install location
-username=$(id -nu)
-
-# find the owner of the parent
-dir=$NATIVE_INSTALL_DIR
-while [ 1 ]; do
-    if [ -d $dir ]; then
-        owner=$(stat -c %U $dir)
-        break
-   else
-        dir=$(dirname $dir)
-   fi
-done
-
-if [ "$owner" = "$username" ]; then
-    SUDO=""
-else
-    echo_info "#######################################################################"
-    echo_info "Please note from this point on installation requires sudo password ..."
-    echo_info "#######################################################################"
-    SUDO=sudo
+SUDO=$(get_sudo_app $NATIVE_INSTALL_DIR)
+if [ -n "$SUDO" ]; then
+  echo_info "#######################################################################"
+  echo_info "Please note from this point on installation requires sudo password ..."
+  echo_info "#######################################################################"
 fi
 
 #we need to make this directory firstly since opkg need to use it.
@@ -249,6 +256,9 @@ target_machine=`eval echo $target_machine_var`
 sysroot_image_name="core-image-$target_sysroot_image-$target_machine.tar.bz2"
     #echo_info "Extracting rootfs: $sysroot_image_name, using pseudo..."
 
+# sudo password might be needed to install the target sysroot
+SUDO=$(get_sudo_app $target_sysroot)
+
 $SUDO scripts/extract_rootfs $sysroot_image_name $target_sysroot $OECORE_NATIVE_SYSROOT $user_inst_type
 check_result
 
@@ -260,6 +270,7 @@ else
 fi
 
 if [ ! -z "$env_filename" ]; then
+  SUDO=$(get_sudo_app $INSTALL_FOLDER)
   $SUDO sed -i -e "s%##SDKTARGETSYSROOT##%$target_sysroot%g" $env_filename
 else
   echo_info "[ADT_INST] Error: Failed to find environment script for arch: $1"
-- 
1.7.9.5


