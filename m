Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1546E71AA1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 06:19:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uAH6JdWr028526
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 22:19:39 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 16 Nov 2016 22:19:38 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Nov 2016 22:19:30 -0800
Message-ID: <efeb9ec88465377d3accb9c96324a3157b1c2738.1479363545.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1479363545.git.liezhi.yang@windriver.com>
References: <cover.1479363545.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/8] populate_sdk_ext.bbclass: install multilib targets as populate_sdk does
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
X-List-Received-Date: Thu, 17 Nov 2016 06:19:38 -0000
Content-Type: text/plain

Fixed:
MACHINE = "qemux86-64"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

$ bitbake core-image-minimal -cpopulate_sdk_ext
[snip]
Testing /buildarea/lyang1/test_po/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testsdkext//tc/environment-setup-x86-pokymllib32-linux
test_cvs (oeqa.sdk.buildcvs.BuildCvsTest) ... FAIL
[snip]

It was failed because no lib32 toolchains.

The fixes include:
* Set SDK_TARGETS correctly
* Return multilib depends in get_ext_sdk_depends()
* Write information to all environment-setup-* scripts.

[YOCTO #10647]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/populate_sdk_ext.bbclass | 61 ++++++++++++++++++++++-------------
 1 file changed, 38 insertions(+), 23 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 26b5ca6..ce9c40a 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -39,7 +39,7 @@ SDK_LOCAL_CONF_BLACKLIST ?= "CONF_VERSION \
 SDK_INHERIT_BLACKLIST ?= "buildhistory icecc"
 SDK_UPDATE_URL ?= ""
 
-SDK_TARGETS ?= "${PN}"
+SDK_TARGETS ?= "${@multilib_pkg_extend(d, d.getVar('BPN', True))}"
 
 def get_sdk_install_targets(d, images_only=False):
     sdk_install_targets = ''
@@ -562,38 +562,52 @@ SDK_PRE_INSTALL_COMMAND_task-populate-sdk-ext = "${sdk_ext_preinst}"
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
-
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
@@ -624,10 +638,11 @@ fakeroot python do_populate_sdk_ext() {
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


