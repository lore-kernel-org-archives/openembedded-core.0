Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PtcyU-0007DK-H9
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:31:34 +0100
Received: by mail-ww0-f43.google.com with SMTP id 15so3168700wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:30:13 -0800 (PST)
Received: by 10.216.185.142 with SMTP id u14mr1136074wem.31.1298799013213;
	Sun, 27 Feb 2011 01:30:13 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id n1sm1286829weq.7.2011.02.27.01.30.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:30:12 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:29:47 +0100
Message-Id: <a91010c3b2a75379581c631209b29257594d0ba8.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 36/50] rootfs_rpm: Fix rootfs generation using RPM packages
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
X-List-Received-Date: Sun, 27 Feb 2011 09:36:54 -0000

From: Mark Hatle <mark.hatle@windriver.com>

[BUG #756]

Fix bug #756.  The rootfs contains a control file /etc/rpm/platform
that specifies the default system platform, as well as patterns for
compatible architectures.  This file was not being setup properly due
to a misunderstanding of the format in a previous patch.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass      |   15 +++++++++------
 meta/classes/populate_sdk_rpm.bbclass |   13 +++++++++++--
 meta/classes/rootfs_rpm.bbclass       |    5 +++--
 3 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 7cbdae6..60127d2 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -155,7 +155,8 @@ resolve_package_rpm () {
 # install a bunch of packages using rpm
 # the following shell variables needs to be set before calling this func:
 # INSTALL_ROOTFS_RPM - install root dir
-# INSTALL_PLATFORM_RPM - extra platform
+# INSTALL_PLATFORM_RPM - main platform
+# INSTALL_PLATFORM_EXTRA_RPM - extra platform
 # INSTALL_CONFBASE_RPM - configuration file base name
 # INSTALL_PACKAGES_NORMAL_RPM - packages to be installed
 # INSTALL_PACKAGES_ATTEMPTONLY_RPM - packages attemped to be installed only
@@ -166,7 +167,8 @@ resolve_package_rpm () {
 package_install_internal_rpm () {
 
 	local target_rootfs="${INSTALL_ROOTFS_RPM}"
-	local platforms="${INSTALL_PLATFORM_RPM}"
+	local platform="${INSTALL_PLATFORM_RPM}"
+	local platform_extra="${INSTALL_PLATFORM_EXTRA_RPM}"
 	local confbase="${INSTALL_CONFBASE_RPM}"
 	local package_to_install="${INSTALL_PACKAGES_NORMAL_RPM}"
 	local package_attemptonly="${INSTALL_PACKAGES_ATTEMPTONLY_RPM}"
@@ -176,9 +178,10 @@ package_install_internal_rpm () {
 
 	# Setup base system configuration
 	mkdir -p ${target_rootfs}/etc/rpm/
-	if [ ! -z "$platforms" ]; then
-		for pt in $platforms ; do
-			echo "$pt-unknown-linux" >> ${target_rootfs}/etc/rpm/platform
+	echo "${platform}-poky-linux-gnu" > ${target_rootfs}/etc/rpm/platform
+	if [ ! -z "$platform_extra" ]; then
+		for pt in $platform_extra ; do
+			echo "$pt-.*-linux.*" >> ${target_rootfs}/etc/rpm/platform
 		done
 	fi
 
@@ -764,7 +767,7 @@ python do_package_rpm () {
 	os.chmod(pkgwritedir, 0755)
 
 	cmd = rpmbuild
-	cmd = cmd + " --nodeps --short-circuit --target " + pkgarch + " --buildroot " + pkgd
+	cmd = cmd + " --nodeps --short-circuit --target " + pkgarch + "-poky-linux-gnu --buildroot " + pkgd
 	cmd = cmd + " --define '_topdir " + workdir + "' --define '_rpmdir " + pkgwritedir + "'"
 	cmd = cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm'"
 	cmd = cmd + " --define '_use_internal_dependency_generator 0'"
diff --git a/meta/classes/populate_sdk_rpm.bbclass b/meta/classes/populate_sdk_rpm.bbclass
index d179780..0afe042 100644
--- a/meta/classes/populate_sdk_rpm.bbclass
+++ b/meta/classes/populate_sdk_rpm.bbclass
@@ -33,10 +33,17 @@ fakeroot populate_sdk_rpm () {
 
 	#install target
 	export INSTALL_ROOTFS_RPM="${SDK_OUTPUT}/${SDKTARGETSYSROOT}"
-	export INSTALL_PLATFORM_RPM="${PACKAGE_ARCHS}"
+	export INSTALL_PLATFORM_RPM="${TARGET_ARCHS}"
 	export INSTALL_CONFBASE_RPM="${RPMCONF_TARGET_BASE}"
 	export INSTALL_PACKAGES_NORMAL_RPM="${TOOLCHAIN_TARGET_TASK}"
 
+	# List must be prefered to least preferred order
+	INSTALL_PLATFORM_RPM=""
+	for each_arch in ${PACKAGE_ARCHS} ; do
+		INSTALL_PLATFORM_RPM="$each_arch $INSTALL_PLATFORM_RPM"
+	done
+	export INSTALL_PLATFORM_RPM
+
 	package_install_internal_rpm
 	populate_sdk_post_rpm ${INSTALL_ROOTFS_RPM}
 
@@ -45,6 +52,7 @@ fakeroot populate_sdk_rpm () {
 	export INSTALL_PLATFORM_RPM="${SDK_ARCH}"
 	export INSTALL_CONFBASE_RPM="${RPMCONF_HOST_BASE}"
 	export INSTALL_PACKAGES_NORMAL_RPM="${TOOLCHAIN_HOST_TASK}"
+	export INSTALL_PLATFORM_EXTRA_RPM=""
 	for arch in ${PACKAGE_ARCHS}; do
 		sdkarch=`echo $arch | sed -e 's/${HOST_ARCH}/${SDK_ARCH}/'`
 		extension="-nativesdk"
@@ -52,9 +60,10 @@ fakeroot populate_sdk_rpm () {
 		    extension=""
 		fi
 		if [ -e ${DEPLOY_DIR_RPM}/$sdkarch$extension ]; then
-			INSTALL_PLATFORM_RPM="$INSTALL_PLATFORM_RPM $sdkarch"
+			INSTALL_PLATFORM_EXTRA_RPM="$sdkarch $INSTALL_PLATFORM_EXTRA_RPM"
 		fi
 	done
+	export INSTALL_PLATFORM_EXTRA_RPM
 
 	package_install_internal_rpm
 	populate_sdk_post_rpm ${INSTALL_ROOTFS_RPM}
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index a722e68..caafbdc 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -48,6 +48,7 @@ fakeroot rootfs_rpm_do_rootfs () {
 
 	#install pacakges
 	export INSTALL_ROOTFS_RPM="${IMAGE_ROOTFS}"
+	export INSTALL_PLATFORM_RPM="${TARGET_ARCH}"
 	export INSTALL_CONFBASE_RPM="${RPMCONF_TARGET_BASE}"
 	export INSTALL_PACKAGES_NORMAL_RPM="${PACKAGE_INSTALL}"
 	export INSTALL_PACKAGES_ATTEMPTONLY_RPM="${PACKAGE_INSTALL_ATTEMPTONLY}"
@@ -56,9 +57,9 @@ fakeroot rootfs_rpm_do_rootfs () {
 	export INSTALL_TASK_RPM="populate_sdk"
 
 	# List must be prefered to least preferred order
-	INSTALL_PLATFORM_RPM=""
+	INSTALL_PLATFORM_EXTRA_RPM=""
 	for each_arch in ${PACKAGE_ARCHS} ; do
-		INSTALL_PLATFORM_RPM="$each_arch $INSTALL_PLATFORM_RPM"
+		INSTALL_PLATFORM_EXTRA_RPM="$each_arch $INSTALL_PLATFORM_EXTRA_RPM"
 	done
 	export INSTALL_PLATFORM_RPM
 
-- 
1.6.6.1



