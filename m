Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QvcUO-0006yF-Ma
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Aug 2011 23:57:01 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Aug 2011 14:52:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,265,1312182000"; d="scan'208";a="43970288"
Received: from unknown (HELO swold-MOBL.lan) ([10.255.13.234])
	by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2011 14:52:14 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Aug 2011 14:51:58 -0700
Message-Id: <35d4266137767ff0f3e60ea3604435719daf283a.1314043945.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1314043945.git.sgw@linux.intel.com>
References: <cover.1314043945.git.sgw@linux.intel.com>
In-Reply-To: <cover.1314043945.git.sgw@linux.intel.com>
References: <cover.1314043945.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 13/19] Use OECORE_DISTRO_VERSION instead of POKY_DISTRO_VERSION
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Aug 2011 21:57:01 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/toolchain-scripts.bbclass |   12 ++++++------
 scripts/oe-find-native-sysroot         |    2 +-
 scripts/runqemu-export-rootfs          |    2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index f7b52be..b7e4e04 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -29,8 +29,8 @@ toolchain_create_sdk_env_script () {
 	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
 	echo 'export OECORE_TARGET_SYSROOT="${SDKTARGETSYSROOT}"' >> $script
 	echo 'export OECORE_ACLOCAL_OPTS="-I ${SDKPATHNATIVE}/usr/share/aclocal"' >> $script
-	echo 'export POKY_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
-	echo 'export POKY_SDK_VERSION="${SDK_VERSION}"' >> $script
+	echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
+	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
 }
 
 # This function creates an environment-setup-script in the TMPDIR which enables
@@ -63,8 +63,8 @@ toolchain_create_tree_env_script () {
 	echo 'export OECORE_NATIVE_SYSROOT="${STAGING_DIR_NATIVE}"' >> $script
 	echo 'export OECORE_TARGET_SYSROOT="${STAGING_DIR_TARGET}"' >> $script
 	echo 'export OECORE_ACLOCAL_OPTS="-I ${STAGING_DIR_NATIVE}/usr/share/aclocal"' >> $script
-	echo 'export POKY_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
-	echo 'export POKY_SDK_VERSION="${SDK_VERSION}"' >> $script
+	echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
+	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
 }
 
 # This function creates an environment-setup-script for use by the ADT installer
@@ -97,8 +97,8 @@ toolchain_create_sdk_env_script_for_installer () {
 	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
 	echo 'export OECORE_TARGET_SYSROOT="##SDKTARGETSYSROOT##"' >> $script
         echo 'export OECORE_ACLOCAL_OPTS="-I ${SDKPATHNATIVE}/usr/share/acloal"' >> $script
-	echo 'export POKY_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
-	echo 'export POKY_SDK_VERSION="${SDK_VERSION}"' >> $script
+	echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
+	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
 }
 
 #This function create a site config file
diff --git a/scripts/oe-find-native-sysroot b/scripts/oe-find-native-sysroot
index 26fc730..b99014b 100755
--- a/scripts/oe-find-native-sysroot
+++ b/scripts/oe-find-native-sysroot
@@ -59,7 +59,7 @@ fi
 if [ ! -e "$OECORE_NATIVE_SYSROOT/usr/bin/pseudo" ]; then
     echo "Error: Unable to find pseudo binary in $OECORE_NATIVE_SYSROOT/usr/bin/"
 
-    if [ "x$POKY_DISTRO_VERSION" = "x" ]; then
+    if [ "x$OECORE_DISTRO_VERSION" = "x" ]; then
         echo "Have you run 'bitbake meta-ide-support'?"
     else
         echo "This shouldn't happen - something is wrong with your toolchain installation"
diff --git a/scripts/runqemu-export-rootfs b/scripts/runqemu-export-rootfs
index 6b4aee8..6f4604d 100755
--- a/scripts/runqemu-export-rootfs
+++ b/scripts/runqemu-export-rootfs
@@ -49,7 +49,7 @@ fi
 if [ ! -e "$OECORE_NATIVE_SYSROOT/usr/sbin/rpc.mountd" ]; then
 	echo "Error: Unable to find rpc.mountd binary in $OECORE_NATIVE_SYSROOT/usr/sbin/"
 
-	if [ "x$POKY_DISTRO_VERSION" = "x" ]; then
+	if [ "x$OECORE_DISTRO_VERSION" = "x" ]; then
 	    echo "Have you run 'bitbake meta-ide-support'?"
 	else
 	    echo "This shouldn't happen - something is missing from your toolchain installation"
-- 
1.7.6



