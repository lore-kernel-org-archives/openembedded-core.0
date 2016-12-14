Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4E59371D9F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 07:24:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uBE7OdPo025416
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 23:24:39 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 13 Dec 2016 23:24:38 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Dec 2016 23:24:30 -0800
Message-ID: <c4ff83dd8b4f3ffd57293e5ec5489cb6f623f331.1481700149.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1481700149.git.liezhi.yang@windriver.com>
References: <cover.1481700149.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 2/8] populate_sdk_ext.bbclass: install multilib SDKs
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
X-List-Received-Date: Wed, 14 Dec 2016 07:24:38 -0000
Content-Type: text/plain

Fixed:
MACHINE = "qemux86-64"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
IMAGE_CLASSES += "testimage"

$ bitbake core-image-minimal -cpopulate_sdk_ext
$ bitbake core-image-minimal -ctestsdkext
[snip]
Testing /buildarea/lyang1/test_po/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testsdkext//tc/environment-setup-x86-pokymllib32-linux
test_cvs (oeqa.sdk.buildcvs.BuildCvsTest) ... FAIL
[snip]

It was failed because no lib32 toolchains.

These fixes include:
* Set SDK_TARGETS correctly
* Return multilib depends in get_ext_sdk_depends()
* Write information to all environment-setup-* scripts.

[YOCTO #10647]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/populate_sdk_ext.bbclass | 49 ++++++++++++++++++++---------------
 1 file changed, 28 insertions(+), 21 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index adef96d..840e04d 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -39,7 +39,7 @@ SDK_LOCAL_CONF_BLACKLIST ?= "CONF_VERSION \
 SDK_INHERIT_BLACKLIST ?= "buildhistory icecc"
 SDK_UPDATE_URL ?= ""
 
-SDK_TARGETS ?= "${PN}"
+SDK_TARGETS ?= "${@multilib_pkg_extend(d, d.getVar('BPN', True))}"
 
 def get_sdk_install_targets(d, images_only=False):
     sdk_install_targets = ''
@@ -566,12 +566,14 @@ SDK_PRE_INSTALL_COMMAND_task-populate-sdk-ext = "${sdk_ext_preinst}"
 sdk_ext_postinst() {
 	printf "\nExtracting buildtools...\n"
 	cd $target_sdk_dir
-	env_setup_script="$target_sdk_dir/environment-setup-${REAL_MULTIMACH_TARGET_SYS}"
+	env_setup_scripts="`ls $target_sdk_dir/environment-setup-*`"
 	./${SDK_BUILDTOOLS_INSTALLER} -d buildtools -y > buildtools.log
 	if [ $? -ne 0 ]; then
 		printf 'ERROR: buildtools installation failed:\n'
 		cat buildtools.log
-		echo "printf 'ERROR: this SDK was not fully installed and needs reinstalling\n'" >> $env_setup_script
+		for e in $env_setup_scripts; do
+			echo "printf 'ERROR: this SDK was not fully installed and needs reinstalling\n'" >> $e
+		done
 		exit 1
 	fi
 
@@ -580,23 +582,25 @@ sdk_ext_postinst() {
 	# We don't need the log either since it succeeded
 	rm -f buildtools.log
 
-	# Make sure when the user sets up the environment, they also get
-	# the buildtools-tarball tools in their path.
-	echo ". $target_sdk_dir/buildtools/environment-setup*" >> $env_setup_script
+	for e in $env_setup_scripts; do
+		# Make sure when the user sets up the environment, they also get
+		# the buildtools-tarball tools in their path.
+		echo ". $target_sdk_dir/buildtools/environment-setup*" >> $e
+		# Allow bitbake environment setup to be ran as part of this sdk.
+		echo "export OE_SKIP_SDK_CHECK=1" >> $e
 
-	# Allow bitbake environment setup to be ran as part of this sdk.
-	echo "export OE_SKIP_SDK_CHECK=1" >> $env_setup_script
+		# A bit of another hack, but we need this in the path only for devtool
+		# so put it at the end of $PATH.
+		echo "export PATH=$target_sdk_dir/sysroots/${SDK_SYS}${bindir_nativesdk}:\$PATH" >> $e
 
-	# A bit of another hack, but we need this in the path only for devtool
-	# so put it at the end of $PATH.
-	echo "export PATH=$target_sdk_dir/sysroots/${SDK_SYS}${bindir_nativesdk}:\$PATH" >> $env_setup_script
+		echo "printf 'SDK environment now set up; additionally you may now run devtool to perform development tasks.\nRun devtool --help for further details.\n'" >> $e
 
-	echo "printf 'SDK environment now set up; additionally you may now run devtool to perform development tasks.\nRun devtool --help for further details.\n'" >> $env_setup_script
+		# Warn if trying to use external bitbake and the ext SDK together
+		echo "(which bitbake > /dev/null 2>&1 && \
+			echo 'WARNING: attempting to use the extensible SDK in an environment set up to run bitbake - this may lead to unexpected results. Please source this script in a new shell session instead.') || \
+			true" >> $e
+	done
 
-	# Warn if trying to use external bitbake and the ext SDK together
-	echo "(which bitbake > /dev/null 2>&1 && \
-		echo 'WARNING: attempting to use the extensible SDK in an environment set up to run bitbake - this may lead to unexpected results. Please source this script in a new shell session instead.') || \
-		true" >> $env_setup_script
 
 	if [ "$prepare_buildsystem" != "no" ]; then
 		printf "Preparing build system...\n"
@@ -610,7 +614,9 @@ sdk_ext_postinst() {
 			. $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> $LOGFILE && \
 			python $target_sdk_dir/ext-sdk-prepare.py $LOGFILE '${SDK_INSTALL_TARGETS}'"
 		if [ $? -ne ]; then
-			echo "printf 'ERROR: this SDK was not fully installed and needs reinstalling\n'" >> $env_setup_script
+			for e in $env_setup_scripts; do
+				echo "printf 'ERROR: this SDK was not fully installed and needs reinstalling\n'" >> $e
+			done
 			exit 1
 			rm $target_sdk_dir/ext-sdk-prepare.py
 		fi
@@ -641,10 +647,11 @@ fakeroot python do_populate_sdk_ext() {
 def get_ext_sdk_depends(d):
     # Note: the deps varflag is a list not a string, so we need to specify expand=False
     deps = d.getVarFlag('do_image_complete', 'deps', False)
-    pn = d.getVar('PN', True)
-    deplist = ['%s:%s' % (pn, dep) for dep in deps]
-    for task in ['do_image_complete', 'do_rootfs', 'do_build']:
-        deplist.extend((d.getVarFlag(task, 'depends', True) or '').split())
+    deplist = []
+    for pn in multilib_pkg_extend(d, d.getVar('BPN', True)).split():
+        deplist += ['%s:%s' % (pn, dep) for dep in deps]
+        for task in ['do_image_complete', 'do_rootfs', 'do_build']:
+            deplist.extend((d.getVarFlag(task, 'depends', True) or '').split())
     return ' '.join(deplist)
 
 python do_sdk_depends() {
-- 
2.10.2


