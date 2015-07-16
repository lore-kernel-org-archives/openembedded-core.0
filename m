Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7FC8D607A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 20:34:33 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 16 Jul 2015 13:34:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,490,1432623600"; d="scan'208";a="607653899"
Received: from bitbang.jf.intel.com ([10.7.201.51])
	by orsmga003.jf.intel.com with ESMTP; 16 Jul 2015 13:34:34 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jul 2015 13:34:21 -0700
Message-Id: <1437078861-7159-1-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.4.3
Subject: [PATCH] extensible sdk: Error when trying to install as root.
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
X-List-Received-Date: Thu, 16 Jul 2015 20:34:34 -0000

Since the extensible sdk uses bitbake, which can't run as root, the sdk
shouldn't be installed as root.

Previously it would error out late into setup when bitbake errored
saying not to run bitbake as root.

Now the script errors with a message saying the extensible sdk can't be
installed as root.

[Yocto #7545]

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/classes/populate_sdk_base.bbclass | 12 ++++++++++--
 meta/classes/populate_sdk_ext.bbclass  | 11 +++++++++++
 meta/files/toolchain-shar-extract.sh   |  7 +++++++
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 398e943..a9e9bd7 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -51,6 +51,7 @@ PID = "${@os.getpid()}"
 EXCLUDE_FROM_WORLD = "1"
 
 SDK_PACKAGING_FUNC ?= "create_shar"
+SDK_PRE_INSTALL_COMMAND ?= ""
 SDK_POST_INSTALL_COMMAND ?= ""
 SDK_RELOCATE_AFTER_INSTALL ?= "1"
 
@@ -134,15 +135,21 @@ fakeroot create_shar() {
 	# copy in the template shar extractor script
 	cp ${COREBASE}/meta/files/toolchain-shar-extract.sh ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
 
-	rm -f ${T}/post_install_command
+	rm -f ${T}/pre_install_command ${T}/post_install_command
 
 	if [ ${SDK_RELOCATE_AFTER_INSTALL} -eq 1 ] ; then
 		cp ${COREBASE}/meta/files/toolchain-shar-relocate.sh ${T}/post_install_command
 	fi
+	cat << "EOF" >> ${T}/pre_install_command
+${SDK_PRE_INSTALL_COMMAND}
+EOF
+
 	cat << "EOF" >> ${T}/post_install_command
 ${SDK_POST_INSTALL_COMMAND}
 EOF
-	sed -i -e '/@SDK_POST_INSTALL_COMMAND@/r ${T}/post_install_command' ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
+	sed -i -e '/@SDK_PRE_INSTALL_COMMAND@/r ${T}/pre_install_command' \
+		-e '/@SDK_POST_INSTALL_COMMAND@/r ${T}/post_install_command' \
+		${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
 
 	# substitute variables
 	sed -i -e 's#@SDK_ARCH@#${SDK_ARCH}#g' \
@@ -151,6 +158,7 @@ EOF
 		-e 's#@REAL_MULTIMACH_TARGET_SYS@#${REAL_MULTIMACH_TARGET_SYS}#g' \
 		-e 's#@SDK_TITLE@#${SDK_TITLE}#g' \
 		-e 's#@SDK_VERSION@#${SDK_VERSION}#g' \
+		-e '/@SDK_PRE_INSTALL_COMMAND@/d' \
 		-e '/@SDK_POST_INSTALL_COMMAND@/d' \
 		${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
 
diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 8a80a56..b28413b 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -173,6 +173,17 @@ install_tools() {
 	install ${SDK_DEPLOY}/${BUILD_ARCH}-nativesdk-libc.tar.bz2 ${SDK_OUTPUT}/${SDKPATH}
 }
 
+# Since bitbake won't run as root it doesn't make sense to try and install
+# the extensible sdk as root.
+sdk_ext_preinst() {
+	if [ "`id -u`" = "0" ]; then
+		echo "ERROR: The extensible sdk cannot be installed as root."
+		exit 1
+	fi
+	SDK_EXTENSIBLE="1"
+}
+SDK_PRE_INSTALL_COMMAND_task-populate-sdk-ext = "${sdk_ext_preinst}"
+
 # FIXME this preparation should be done as part of the SDK construction
 sdk_ext_postinst() {
 	printf "\nExtracting buildtools...\n"
diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 8cb8783..0a33ee8 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -71,6 +71,8 @@ if [ $verbose = 1 ] ; then
 	set -x
 fi
 
+@SDK_PRE_INSTALL_COMMAND@
+
 if [ "$target_sdk_dir" = "" ]; then
 	read -e -p "Enter target directory for SDK (default: $DEFAULT_INSTALL_DIR): " target_sdk_dir
 	[ "$target_sdk_dir" = "" ] && target_sdk_dir=$DEFAULT_INSTALL_DIR
@@ -116,6 +118,11 @@ mkdir -p $target_sdk_dir >/dev/null 2>&1
 
 # if don't have the right to access dir, gain by sudo 
 if [ ! -x $target_sdk_dir -o ! -w $target_sdk_dir -o ! -r $target_sdk_dir ]; then 
+	if [ "$SDK_EXTENSIBLE" = "1" ]; then
+		echo "Unable to access \"$target_sdk_dir\"."
+		exit 1
+	fi
+
 	SUDO_EXEC=$(which "sudo")
 	if [ -z $SUDO_EXEC ]; then
 		echo "No command 'sudo' found, please install sudo first. Abort!"
-- 
2.4.3


