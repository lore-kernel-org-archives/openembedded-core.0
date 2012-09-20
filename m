Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TEhJW-0004Ko-S5
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Sep 2012 16:01:11 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Sep 2012 06:48:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,453,1344236400"; d="scan'208";a="208702966"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by orsmga002.jf.intel.com with ESMTP; 20 Sep 2012 06:48:12 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Sep 2012 16:48:00 +0300
Message-Id: <0a665364580500dd6e8e665c8d1255a144271603.1348148406.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1348148406.git.laurentiu.palcu@intel.com>
References: <cover.1348148406.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1348148406.git.laurentiu.palcu@intel.com>
References: <cover.1348148406.git.laurentiu.palcu@intel.com>
Subject: [PATCH v2 3/6] adt-installer: ensure directory exists before copying/removing
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Sep 2012 14:01:11 -0000

If the installation is done in a directory which already contains a
valid installation, opkg will not install anything and the moving the
contents of /install/dir/opt/poky/1.2 (for example) to /install/dir will
throw some errors. However, the install directory will not be affected.
This patch will ensure that the /install/dir/opt/poky/1.2 exists.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../adt-installer/scripts/adt_installer_internal   |   52 ++++++++++----------
 1 file changed, 27 insertions(+), 25 deletions(-)

diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
index 76acaa7..fbcd2ce 100755
--- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
@@ -158,31 +158,33 @@ fi
 # the entire directory structure. We could patch opkg to do that but it's far
 # simpler to do that here and achieve the same result.
 # This is done in two steps:
-# Step 1: copy ./opt/${DISTRO}/${SDK_VERSION} contents to $NATIVE_INSTALL_DIR.
-# We cannot use move if $NATIVE_INSTALL_DIR is not empty (for example: contains
-# another SDK)
-$SUDO cp -r $NATIVE_INSTALL_DIR/$DEFAULT_INSTALL_FOLDER/* $NATIVE_INSTALL_DIR
-
-# delete the source directory now
-$SUDO rm -rf $NATIVE_INSTALL_DIR/$DEFAULT_INSTALL_FOLDER/*
-
-# Step 2: Delete the ./opt/${DISTRO}/${SDK_VERSION} directories too, they should be empty
-dir=$NATIVE_INSTALL_DIR/$DEFAULT_INSTALL_FOLDER
-while [ "$dir" != "$NATIVE_INSTALL_DIR" ]; do
-    # if the user chose / as the install folder, then we should leave /opt in place
-    if [ "$dir" = "/opt" ]; then
-        break
-    fi
-
-    # try to delete the directory, only if it's empty
-    $SUDO rmdir $dir
-    if [ $? -ne 0 ]; then
-        break
-    fi
-
-    # go to the next directory
-    dir=$(dirname $dir)
-done
+if [ -d $NATIVE_INSTALL_DIR/$DEFAULT_INSTALL_FOLDER ]; then
+    # Step 1: copy ./opt/${DISTRO}/${SDK_VERSION} contents to $NATIVE_INSTALL_DIR.
+    # We cannot use move if $NATIVE_INSTALL_DIR is not empty (for example: contains
+    # another SDK)
+    $SUDO cp -r $NATIVE_INSTALL_DIR/$DEFAULT_INSTALL_FOLDER/* $NATIVE_INSTALL_DIR
+
+    # delete the source directory now
+    $SUDO rm -rf $NATIVE_INSTALL_DIR/$DEFAULT_INSTALL_FOLDER/*
+
+    # Step 2: Delete the ./opt/${DISTRO}/${SDK_VERSION} directories too, they should be empty
+    dir=$NATIVE_INSTALL_DIR/$DEFAULT_INSTALL_FOLDER
+    while [ "$dir" != "$NATIVE_INSTALL_DIR" ]; do
+        # if the user chose / as the install folder, then we should leave /opt in place
+        if [ "$dir" = "/opt" ]; then
+            break
+        fi
+
+        # try to delete the directory, only if it's empty
+        $SUDO rmdir $dir
+        if [ $? -ne 0 ]; then
+            break
+        fi
+
+        # go to the next directory
+        dir=$(dirname $dir)
+    done
+fi
 
 # Link the ld.so.cache file into the hosts filesystem
 if [ ! -f "$OECORE_NATIVE_SYSROOT/etc/ld.so.cache" ]; then
-- 
1.7.9.5



