Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TgbXh-0000Kq-Lr
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 14:31:09 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 06 Dec 2012 05:15:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,230,1355126400"; d="scan'208";a="229810004"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 06 Dec 2012 05:16:34 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Dec 2012 15:16:32 +0200
Message-Id: <1354799792-31261-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] populate_sdk_base, adt_installer_internal: fix issue on older distributions
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
X-List-Received-Date: Thu, 06 Dec 2012 13:31:09 -0000

This patch addresses an SDK installer issue on older distributions if
the installation takes place in another directory than the default one. In
fact, is all about the 'file' utility version used for determining if a
file is a text file. For example, for a perl script, newer 'file' versions
return:
"...script, ASCII text executable"
while older versions return:
"...script text executable"
Hence the regex pattern didn't match the scripts.

Also the patch contains two unrelated minor fixes:
 * return an exit code of 1 instead of -1 when installation machine is
   not supported. That because on an older distribution we also get this
   error message: "exit: 9: Illegal number: -1";
 * remove unnecessary $SUDO_EXEC prefix to grep;

[YOCTO #3538]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/populate_sdk_base.bbclass             |    4 ++--
 .../adt-installer/scripts/adt_installer_internal   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index c15a4d4..88bcb27 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -123,7 +123,7 @@ SDK_ARCH=$(echo ${SDK_ARCH} | sed -e "s/i[5-6]86/ix86/")
 
 if [ "$INST_ARCH" != "$SDK_ARCH" ]; then
 	echo "Error: Installation machine not supported!"
-	exit -1
+	exit 1
 fi
 
 DEFAULT_INSTALL_DIR="${SDKPATH}"
@@ -233,7 +233,7 @@ if [ $? -ne 0 ]; then
 fi
 
 # replace ${SDKPATH} with the new prefix in all text files: configs/scripts/etc
-$SUDO_EXEC find $native_sysroot -type f -exec file '{}' \;|$SUDO_EXEC grep ":.*ASCII.*text"|cut -d':' -f1|$SUDO_EXEC xargs sed -i -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g"
+$SUDO_EXEC find $native_sysroot -type f -exec file '{}' \;|grep ":.*\(ASCII\|script\).*text"|cut -d':' -f1|$SUDO_EXEC xargs sed -i -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g"
 
 # change all symlinks pointing to ${SDKPATH}
 for l in $($SUDO_EXEC find $native_sysroot -type l); do
diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
index 9a13573..b80a7ed 100755
--- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
@@ -212,7 +212,7 @@ check_result
 env_setup_script=$(find $NATIVE_INSTALL_DIR/ -name "environment-setup-*")
 $SUDO sed -i -e "s:$DEFAULT_INSTALL_FOLDER:$NATIVE_INSTALL_DIR:g" $env_setup_script
 
-find $OECORE_NATIVE_SYSROOT -type f -exec file '{}' \;|grep ":.*ASCII.*text"|cut -d':' -f1|\
+find $OECORE_NATIVE_SYSROOT -type f -exec file '{}' \;|grep ":.*\(ASCII\|script\).*text"|cut -d':' -f1|\
     xargs $SUDO sed -i -e "s:$DEFAULT_INSTALL_FOLDER:$NATIVE_INSTALL_DIR:g"
 
 # change all symlinks pointing to /opt/${DISTRO}/${SDK_VERSION}
-- 
1.7.9.5



