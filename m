Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A774678639
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 13:22:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vAADMpPY012129
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 05:22:51 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Fri, 10 Nov 2017 05:22:50 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Nov 2017 14:27:06 +0800
Message-ID: <768dade438650b4b76d5a0c70cb87b33ac0e209d.1510275834.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1510275834.git.liezhi.yang@windriver.com>
References: <cover.1510275834.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 06/23] populate_sdk_ext.bbclass: fix for multilib
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
X-List-Received-Date: Fri, 10 Nov 2017 13:22:49 -0000
Content-Type: text/plain

Fixed:
MACHINE = "qemux86-64"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

$ bitbake <image> -cpopulate_sdk_ext
$ bitbake <image> -ctestsdkext
[snip]
Standard Output: /bin/sh: 1: i686-wrsmllib32-linux-gcc: not found
[snip]

It was failed because no lib32 toolchain or lib installed.

This patch fixes:
* Set SDK_TARGETS correctly
* Return multilib depends in get_ext_sdk_depends()
* Write information to all environment-setup-* scripts.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/populate_sdk_ext.bbclass | 72 +++++++++++++++++++++++------------
 1 file changed, 47 insertions(+), 25 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 3826e08..07c7e82 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -38,7 +38,7 @@ SDK_LOCAL_CONF_BLACKLIST ?= "CONF_VERSION \
 SDK_INHERIT_BLACKLIST ?= "buildhistory icecc"
 SDK_UPDATE_URL ?= ""
 
-SDK_TARGETS ?= "${PN}"
+SDK_TARGETS ?= "${@multilib_pkg_extend(d, d.getVar('BPN', True))}"
 
 def get_sdk_install_targets(d, images_only=False):
     sdk_install_targets = ''
@@ -55,9 +55,11 @@ def get_sdk_install_targets(d, images_only=False):
 
     if not images_only:
         if d.getVar('SDK_INCLUDE_PKGDATA') == '1':
-            sdk_install_targets += ' meta-world-pkgdata:do_allpackagedata'
+            for pn in multilib_pkg_extend(d, 'meta-world-pkgdata').split():
+                sdk_install_targets += ' %s:do_allpackagedata' % pn
         if d.getVar('SDK_INCLUDE_TOOLCHAIN') == '1':
-            sdk_install_targets += ' meta-extsdk-toolchain:do_populate_sysroot'
+            for pn in multilib_pkg_extend(d, 'meta-extsdk-toolchain').split():
+                sdk_install_targets += ' %s:do_populate_sysroot' % pn
 
     return sdk_install_targets
 
@@ -600,40 +602,55 @@ SDK_PRE_INSTALL_COMMAND_task-populate-sdk-ext = "${sdk_ext_preinst}"
 sdk_ext_postinst() {
 	printf "\nExtracting buildtools...\n"
 	cd $target_sdk_dir
-	env_setup_script="$target_sdk_dir/environment-setup-${REAL_MULTIMACH_TARGET_SYS}"
-	printf "buildtools\ny" | ./${SDK_BUILDTOOLS_INSTALLER} > buildtools.log || { printf 'ERROR: buildtools installation failed:\n' ; cat buildtools.log ; echo "printf 'ERROR: this SDK was not fully installed and needs reinstalling\n'" >> $env_setup_script ; exit 1 ; }
+	env_setup_scripts="`ls $target_sdk_dir/environment-setup-*`"
+	./${SDK_BUILDTOOLS_INSTALLER} -d buildtools -y > buildtools.log
+	if [ $? -ne 0 ]; then
+		echo 'ERROR: buildtools installation failed:'
+		cat buildtools.log
+		for e in $env_setup_scripts; do
+			echo "echo 'ERROR: this SDK was not fully installed and needs reinstalling'" >> $e
+		done
+		exit 1
+	fi
 
 	# Delete the buildtools tar file since it won't be used again
 	rm -f ./${SDK_BUILDTOOLS_INSTALLER}
 	# We don't need the log either since it succeeded
 	rm -f buildtools.log
 
-	# Make sure when the user sets up the environment, they also get
-	# the buildtools-tarball tools in their path.
-	echo ". $target_sdk_dir/buildtools/environment-setup*" >> $env_setup_script
-
-	# Allow bitbake environment setup to be ran as part of this sdk.
-	echo "export OE_SKIP_SDK_CHECK=1" >> $env_setup_script
-	# Work around runqemu not knowing how to get this information within the eSDK
-	echo "export DEPLOY_DIR_IMAGE=$target_sdk_dir/tmp/${@os.path.relpath(d.getVar('DEPLOY_DIR_IMAGE'), d.getVar('TMPDIR'))}" >> $env_setup_script
+	for e in $env_setup_scripts; do
+		# Make sure when the user sets up the environment, they also get
+		# the buildtools-tarball tools in their path.
+		echo ". $target_sdk_dir/buildtools/environment-setup*" >> $e
 
-	# A bit of another hack, but we need this in the path only for devtool
-	# so put it at the end of $PATH.
-	echo "export PATH=$target_sdk_dir/sysroots/${SDK_SYS}${bindir_nativesdk}:\$PATH" >> $env_setup_script
+		# Allow bitbake environment setup to be ran as part of this sdk.
+		echo "export OE_SKIP_SDK_CHECK=1" >> $e
 
-	echo "printf 'SDK environment now set up; additionally you may now run devtool to perform development tasks.\nRun devtool --help for further details.\n'" >> $env_setup_script
+		# Work around runqemu not knowing how to get this information within the eSDK
+		echo "export DEPLOY_DIR_IMAGE=$target_sdk_dir/tmp/${@os.path.relpath(d.getVar('DEPLOY_DIR_IMAGE'), d.getVar('TMPDIR'))}" >> $e
 
-	# Warn if trying to use external bitbake and the ext SDK together
-	echo "(which bitbake > /dev/null 2>&1 && echo 'WARNING: attempting to use the extensible SDK in an environment set up to run bitbake - this may lead to unexpected results. Please source this script in a new shell session instead.') || true" >> $env_setup_script
+		# A bit of another hack, but we need this in the path only for devtool
+		# so put it at the end of $PATH.
+		echo "export PATH=$target_sdk_dir/sysroots/${SDK_SYS}${bindir_nativesdk}:\$PATH" >> $e
+		echo "printf 'SDK environment now set up; additionally you may now run devtool to perform development tasks.\nRun devtool --help for further details.\n'" >> $e
+		# Warn if trying to use external bitbake and the ext SDK together
+		echo "(which bitbake > /dev/null 2>&1 && echo 'WARNING: attempting to use the extensible SDK in an environment set up to run bitbake - this may lead to unexpected results. Please source this script in a new shell session instead.') || true" >> $e
+	done
 
 	if [ "$prepare_buildsystem" != "no" ]; then
-		printf "Preparing build system...\n"
+		echo "Preparing build system..."
 		# dash which is /bin/sh on Ubuntu will not preserve the
 		# current working directory when first ran, nor will it set $1 when
 		# sourcing a script. That is why this has to look so ugly.
 		LOGFILE="$target_sdk_dir/preparing_build_system.log"
-		sh -c ". buildtools/environment-setup* > $LOGFILE && cd $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> $LOGFILE && python $target_sdk_dir/ext-sdk-prepare.py $LOGFILE '${SDK_INSTALL_TARGETS}'" || { echo "printf 'ERROR: this SDK was not fully installed and needs reinstalling\n'" >> $env_setup_script ; exit 1 ; }
-		rm $target_sdk_dir/ext-sdk-prepare.py
+		sh -c ". buildtools/environment-setup* > $LOGFILE && cd $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> $LOGFILE && python $target_sdk_dir/ext-sdk-prepare.py $LOGFILE '${SDK_INSTALL_TARGETS}'"
+		if [ $? -ne 0 ]; then
+			for e in $env_setup_scripts; do
+				echo "echo 'ERROR: this SDK was not fully installed and needs reinstalling'" >> $e
+			done
+			exit 1
+		fi
+		rm -f $target_sdk_dir/ext-sdk-prepare.py
 	fi
 	echo done
 }
@@ -661,12 +678,17 @@ fakeroot python do_populate_sdk_ext() {
 def get_ext_sdk_depends(d):
     # Note: the deps varflag is a list not a string, so we need to specify expand=False
     deps = d.getVarFlag('do_image_complete', 'deps', False)
-    pn = d.getVar('PN')
-    deplist = ['%s:%s' % (pn, dep) for dep in deps]
+    deplist = []
+    for pn in multilib_pkg_extend(d, d.getVar('BPN')).split():
+        deplist += ['%s:%s' % (pn, dep) for dep in deps]
     tasklist = bb.build.tasksbetween('do_image_complete', 'do_build', d)
     tasklist.append('do_rootfs')
     for task in tasklist:
         deplist.extend((d.getVarFlag(task, 'depends') or '').split())
+
+    for pn in multilib_pkg_extend(d, 'meta-extsdk-toolchain').split():
+         deplist += ['%s:do_populate_sysroot' % pn]
+
     return ' '.join(deplist)
 
 python do_sdk_depends() {
@@ -680,7 +702,7 @@ python do_sdk_depends() {
 addtask sdk_depends
 
 do_sdk_depends[dirs] = "${WORKDIR}"
-do_sdk_depends[depends] = "${@get_ext_sdk_depends(d)} meta-extsdk-toolchain:do_populate_sysroot"
+do_sdk_depends[depends] = "${@get_ext_sdk_depends(d)}"
 do_sdk_depends[recrdeptask] = "${@d.getVarFlag('do_populate_sdk', 'recrdeptask', False)}"
 do_sdk_depends[recrdeptask] += "do_populate_lic do_package_qa do_populate_sysroot do_deploy ${SDK_RECRDEP_TASKS}"
 do_sdk_depends[rdepends] = "${@get_sdk_ext_rdepends(d)}"
-- 
2.7.4


