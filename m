Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 82A7D76B16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 07:46:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7O7kT8k000888
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 00:46:29 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Mon, 24 Aug 2015 00:46:28 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Aug 2015 15:46:56 +0800
Message-ID: <76bc847f69894ced713cda8acf7af0fb72d78a59.1440402125.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1440402124.git.Qi.Chen@windriver.com>
References: <cover.1440402124.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 8/8] populate_sdk_ext: get rid of buildtools
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
X-List-Received-Date: Mon, 24 Aug 2015 07:46:28 -0000
Content-Type: text/plain

If we do `bitbake buildtools-tarball' and then after one day do `bitbake
core-image-minimal -c populate_sdk_ext', we would meet errors like below.

| install: cannot stat '/buildarea2/chenqi/poky/build-systemd/tmp/deploy/sdk/
poky-glibc-x86_64-buildtools-tarball-core2-64-buildtools-nativesdk-standalone
-1.8+snapshot-20150429.sh': No such file or directory

The problem is that the output name for buildtools-tarball has ${DATE} in it.
So if populate_sdk_ext task is executed but buildtools-tarball is not rebuilt,
the above error appears.

In fact, ext SDK does not have to depend on buildtools. This patch removes the
buildtools from the ext SDK. After this patch, the ext SDK still works and we
can no longer see the buildtools error.

[YOCTO #7674]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/populate_sdk_ext.bbclass | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 151ae1d..1dcd982 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -7,8 +7,25 @@ inherit populate_sdk_base
 
 TOOLCHAIN_HOST_TASK_task-populate-sdk-ext = " \
     meta-environment-extsdk-${MACHINE} \
+    nativesdk-python-core \
+    nativesdk-python-modules \
+    nativesdk-python-misc \
+    nativesdk-python-git \
+    nativesdk-python-pexpect \
+    nativesdk-ncurses-terminfo-base \
+    nativesdk-chrpath \
+    nativesdk-tar \
+    nativesdk-buildtools-perl-dummy \
+    nativesdk-git \
+    nativesdk-git-perltools \
+    nativesdk-pigz \
+    nativesdk-make \
+    nativesdk-wget \
+    nativesdk-ca-certificates \
     "
 
+SDK_PACKAGE_ARCHS =+ "buildtools-dummy-${SDKPKGSUFFIX}"
+
 TOOLCHAIN_TARGET_TASK_task-populate-sdk-ext = ""
 
 SDK_RDEPENDS_append_task-populate-sdk-ext = " ${SDK_TARGETS}"
@@ -183,8 +200,6 @@ install_tools() {
 	lnr ${SDK_OUTPUT}/${SDKPATH}/${scriptrelpath}/recipetool ${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/recipetool
 	touch ${SDK_OUTPUT}/${SDKPATH}/.devtoolbase
 
-	install ${SDK_DEPLOY}/${DISTRO}-${TCLIBC}-${SDK_ARCH}-buildtools-tarball-${TUNE_PKGARCH}-buildtools-nativesdk-standalone-${DISTRO_VERSION}.sh ${SDK_OUTPUT}/${SDKPATH}
-
 	install ${SDK_DEPLOY}/${BUILD_ARCH}-nativesdk-libc.tar.bz2 ${SDK_OUTPUT}/${SDKPATH}
 }
 
@@ -201,13 +216,7 @@ SDK_PRE_INSTALL_COMMAND_task-populate-sdk-ext = "${sdk_ext_preinst}"
 
 # FIXME this preparation should be done as part of the SDK construction
 sdk_ext_postinst() {
-	printf "\nExtracting buildtools...\n"
 	cd $target_sdk_dir
-	printf "buildtools\ny" | ./*buildtools-tarball* > /dev/null
-
-	# Make sure when the user sets up the environment, they also get
-	# the buildtools-tarball tools in their path.
-	echo ". $target_sdk_dir/buildtools/environment-setup*" >> $target_sdk_dir/environment-setup*
 
 	# Allow bitbake environment setup to be ran as part of this sdk.
 	echo "export OE_SKIP_SDK_CHECK=1" >> $target_sdk_dir/environment-setup*
@@ -224,7 +233,7 @@ sdk_ext_postinst() {
 	    # dash which is /bin/sh on Ubuntu will not preserve the
 	    # current working directory when first ran, nor will it set $1 when
 	    # sourcing a script. That is why this has to look so ugly.
-	    sh -c ". buildtools/environment-setup* > preparing_build_system.log && cd $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> preparing_build_system.log && bitbake ${SDK_TARGETS} >> preparing_build_system.log" || { echo "SDK preparation failed: see `pwd`/preparing_build_system.log" ; exit 1 ; }
+	    sh -c "cd $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> preparing_build_system.log && bitbake ${SDK_TARGETS} >> preparing_build_system.log" || { echo "SDK preparation failed: see `pwd`/preparing_build_system.log" ; exit 1 ; }
 	fi
 	echo done
 }
@@ -249,7 +258,7 @@ do_populate_sdk_ext[rdepends] = "${@get_sdk_ext_rdepends(d)}"
 do_populate_sdk_ext[recrdeptask] += "${@d.getVarFlag('do_populate_sdk', 'recrdeptask', False)}"
 
 
-do_populate_sdk_ext[depends] += "buildtools-tarball:do_populate_sdk uninative-tarball:do_populate_sdk"
+do_populate_sdk_ext[depends] += "uninative-tarball:do_populate_sdk"
 
 do_populate_sdk_ext[rdepends] += "${@' '.join([x + ':do_build' for x in d.getVar('SDK_TARGETS', True).split()])}"
 do_populate_sdk_ext[recrdeptask] += "do_populate_lic do_package_qa do_populate_sysroot do_deploy"
-- 
1.9.1


