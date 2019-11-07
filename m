Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8D5157FA16
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 23:26:28 +0000 (UTC)
Received: from lons-builder.int.hatle.net ([192.40.192.88])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id xA7NQQp7003903
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Nov 2019 17:26:27 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Nov 2019 17:26:26 -0600
Message-Id: <20191107232626.21787-2-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191107232626.21787-1-mark.hatle@kernel.crashing.org>
References: <20191107232626.21787-1-mark.hatle@kernel.crashing.org>
Subject: [PATCH 1/1] populate_sdk_ext.bbclass: Make integrated buildtools optional
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
X-List-Received-Date: Thu, 07 Nov 2019 23:26:29 -0000

If the host system is expected to have enough capabilities that the
buildtools-tarball is not required, we don't need to bundle it.

This can save some significant space, especially when using with a minimal
eSDK.

minimal eSDK - core-image-minimal-qemux86-64

with buildtools-tarball     - 34 MB installer - 281 MB installed
without buildtoools-tarball - 11 MB installer -  48 MB installed

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/classes/populate_sdk_ext.bbclass | 41 ++++++++++++++++++---------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 9fda1c9e78..05cfc1cc15 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -21,6 +21,7 @@ SDK_EXT_TYPE ?= "full"
 SDK_INCLUDE_PKGDATA ?= "0"
 SDK_INCLUDE_TOOLCHAIN ?= "${@'1' if d.getVar('SDK_EXT_TYPE') == 'full' else '0'}"
 SDK_INCLUDE_NATIVESDK ?= "0"
+SDK_INCLUDE_BUILDTOOLS ?= '1'
 
 SDK_RECRDEP_TASKS ?= ""
 
@@ -94,6 +95,7 @@ python write_target_sdk_ext_manifest () {
     real_target_multimach = d.getVar('REAL_MULTIMACH_TARGET_SYS')
 
     pkgs = {}
+    os.makedirs(os.path.dirname(d.getVar('SDK_EXT_TARGET_MANIFEST')), exist_ok=True)
     with open(d.getVar('SDK_EXT_TARGET_MANIFEST'), 'w') as f:
         for fn in extra_info['filesizes']:
             info = fn.split(':')
@@ -535,8 +537,12 @@ def get_sdk_required_utilities(buildtools_fn, d):
     sanity_required_utilities = (d.getVar('SANITY_REQUIRED_UTILITIES') or '').split()
     sanity_required_utilities.append(d.expand('${BUILD_PREFIX}gcc'))
     sanity_required_utilities.append(d.expand('${BUILD_PREFIX}g++'))
-    buildtools_installer = os.path.join(d.getVar('SDK_DEPLOY'), buildtools_fn)
-    filelist, _ = bb.process.run('%s -l' % buildtools_installer)
+    if buildtools_fn:
+        buildtools_installer = os.path.join(d.getVar('SDK_DEPLOY'), buildtools_fn)
+        filelist, _ = bb.process.run('%s -l' % buildtools_installer)
+    else:
+        buildtools_installer = None
+        filelist = ""
     localdata = bb.data.createCopy(d)
     localdata.setVar('SDKPATH', '.')
     sdkpathnative = localdata.getVar('SDKPATHNATIVE')
@@ -579,7 +585,9 @@ install_tools() {
 	touch ${SDK_OUTPUT}/${SDKPATH}/.devtoolbase
 
 	# find latest buildtools-tarball and install it
-	install ${SDK_DEPLOY}/${SDK_BUILDTOOLS_INSTALLER} ${SDK_OUTPUT}/${SDKPATH}
+	if [ -n "${SDK_BUILDTOOLS_INSTALLER}" ]; then
+		install ${SDK_DEPLOY}/${SDK_BUILDTOOLS_INSTALLER} ${SDK_OUTPUT}/${SDKPATH}
+	fi
 
 	install -m 0644 ${COREBASE}/meta/files/ext-sdk-prepare.py ${SDK_OUTPUT}/${SDKPATH}
 }
@@ -629,16 +637,18 @@ sdk_ext_postinst() {
 	printf "\nExtracting buildtools...\n"
 	cd $target_sdk_dir
 	env_setup_script="$target_sdk_dir/environment-setup-${REAL_MULTIMACH_TARGET_SYS}"
-	printf "buildtools\ny" | ./${SDK_BUILDTOOLS_INSTALLER} > buildtools.log || { printf 'ERROR: buildtools installation failed:\n' ; cat buildtools.log ; echo "printf 'ERROR: this SDK was not fully installed and needs reinstalling\n'" >> $env_setup_script ; exit 1 ; }
+        if [ -n "${SDK_BUILDTOOLS_INSTALLER}" ]; then
+		printf "buildtools\ny" | ./${SDK_BUILDTOOLS_INSTALLER} > buildtools.log || { printf 'ERROR: buildtools installation failed:\n' ; cat buildtools.log ; echo "printf 'ERROR: this SDK was not fully installed and needs reinstalling\n'" >> $env_setup_script ; exit 1 ; }
 
-	# Delete the buildtools tar file since it won't be used again
-	rm -f ./${SDK_BUILDTOOLS_INSTALLER}
-	# We don't need the log either since it succeeded
-	rm -f buildtools.log
+		# Delete the buildtools tar file since it won't be used again
+		rm -f ./${SDK_BUILDTOOLS_INSTALLER}
+		# We don't need the log either since it succeeded
+		rm -f buildtools.log
 
-	# Make sure when the user sets up the environment, they also get
-	# the buildtools-tarball tools in their path.
-	echo ". $target_sdk_dir/buildtools/environment-setup*" >> $env_setup_script
+		# Make sure when the user sets up the environment, they also get
+		# the buildtools-tarball tools in their path.
+		echo ". $target_sdk_dir/buildtools/environment-setup*" >> $env_setup_script
+	fi
 
 	# Allow bitbake environment setup to be ran as part of this sdk.
 	echo "export OE_SKIP_SDK_CHECK=1" >> $env_setup_script
@@ -654,7 +664,7 @@ sdk_ext_postinst() {
 	# Warn if trying to use external bitbake and the ext SDK together
 	echo "(which bitbake > /dev/null 2>&1 && echo 'WARNING: attempting to use the extensible SDK in an environment set up to run bitbake - this may lead to unexpected results. Please source this script in a new shell session instead.') || true" >> $env_setup_script
 
-	if [ "$prepare_buildsystem" != "no" ]; then
+	if [ "$prepare_buildsystem" != "no" -a -n "${SDK_BUILDTOOLS_INSTALLER}" ]; then
 		printf "Preparing build system...\n"
 		# dash which is /bin/sh on Ubuntu will not preserve the
 		# current working directory when first ran, nor will it set $1 when
@@ -680,7 +690,10 @@ fakeroot python do_populate_sdk_ext() {
         bb.fatal('The extensible SDK can currently only be built for the same architecture as the machine being built on - SDK_ARCH is set to %s (likely via setting SDKMACHINE) which is different from the architecture of the build machine (%s). Unable to continue.' % (d.getVar('SDK_ARCH'), d.getVar('BUILD_ARCH')))
 
     d.setVar('SDK_INSTALL_TARGETS', get_sdk_install_targets(d))
-    buildtools_fn = get_current_buildtools(d)
+    if d.getVar('SDK_INCLUDE_BUILDTOOLS') == '1':
+        buildtools_fn = get_current_buildtools(d)
+    else:
+        buildtools_fn = None
     d.setVar('SDK_REQUIRED_UTILITIES', get_sdk_required_utilities(buildtools_fn, d))
     d.setVar('SDK_BUILDTOOLS_INSTALLER', buildtools_fn)
     d.setVar('SDKDEPLOYDIR', '${SDKEXTDEPLOYDIR}')
@@ -731,7 +744,7 @@ def get_sdk_ext_rdepends(d):
 do_populate_sdk_ext[dirs] = "${@d.getVarFlag('do_populate_sdk', 'dirs', False)}"
 
 do_populate_sdk_ext[depends] = "${@d.getVarFlag('do_populate_sdk', 'depends', False)} \
-                                buildtools-tarball:do_populate_sdk \
+                                ${@'buildtools-tarball:do_populate_sdk' if d.getVar('SDK_INCLUDE_BUILDTOOLS') == '1' else ''} \
                                 ${@'meta-world-pkgdata:do_collect_packagedata' if d.getVar('SDK_INCLUDE_PKGDATA') == '1' else ''} \
                                 ${@'meta-extsdk-toolchain:do_locked_sigs' if d.getVar('SDK_INCLUDE_TOOLCHAIN') == '1' else ''}"
 
-- 
2.17.1


