Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Qo2jB-0005dT-Sb
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 02:20:58 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p720Gaaw020008
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 17:16:36 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 1 Aug 2011 17:16:36 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 1 Aug 2011 19:17:39 -0500
Message-ID: <33547da55e5c1d12306468fbb0a3574f1c3bc448.1312243899.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312243899.git.mark.hatle@windriver.com>
References: <cover.1312243899.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 2/5] bitbake.conf: Add SDK_PACKAGE_ARCHS
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
X-List-Received-Date: Tue, 02 Aug 2011 00:20:58 -0000
Content-Type: text/plain

Add SDK_PACKAGE_ARCHS to avoid the sed operations we were previously doing
inside of the variouns populate_sdk functions and related items.

Also add documentation to populate_sdk to explain when the various functions
are expected to be doing.

Finally fix a bug in populate_sdk_rpm where the wrong value was being set,
noticed while working on this change.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_deb.bbclass      |    6 +----
 meta/classes/package_ipk.bbclass      |   37 +++++++++++++++-----------------
 meta/classes/package_rpm.bbclass      |   10 +--------
 meta/classes/populate_sdk.bbclass     |    9 ++++++++
 meta/classes/populate_sdk_deb.bbclass |   13 +----------
 meta/classes/populate_sdk_rpm.bbclass |   23 ++++++++------------
 meta/conf/bitbake.conf                |    1 +
 7 files changed, 39 insertions(+), 60 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 8e363f8..48aa232 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -78,14 +78,10 @@ package_update_index_deb () {
 		return
 	fi
 
-	for arch in ${PACKAGE_ARCHS}; do
-		sdkarch=`echo $arch | sed -e 's/${HOST_ARCH}/${SDK_ARCH}/'`
+	for arch in ${PACKAGE_ARCHS} ${SDK_PACKAGE_ARCHS}; do
 		if [ -e ${DEPLOY_DIR_DEB}/$arch ]; then
 			debarchs="$debarchs $arch"
 		fi
-		if [ -e ${DEPLOY_DIR_DEB}/$sdkarch-nativesdk ]; then
-			debarchs="$debarchs $sdkarch-nativesdk"
-		fi
 	done
 
 	for arch in $debarchs; do
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 16574e9..3768889 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -161,7 +161,7 @@ ipk_log_check() {
 package_update_index_ipk () {
 	set -x
 
-	ipkgarchs="${PACKAGE_ARCHS}"
+	ipkgarchs="${PACKAGE_ARCHS} ${SDK_PACKAGE_ARCHS}"
 
 	if [ ! -z "${DEPLOY_KEEP_PACKAGES}" ]; then
 		return
@@ -169,8 +169,7 @@ package_update_index_ipk () {
 
 	packagedirs="${DEPLOY_DIR_IPK}"
 	for arch in $ipkgarchs; do
-		sdkarch=`echo $arch | sed -e 's/${HOST_ARCH}/${SDK_ARCH}/'`
-		packagedirs="$packagedirs ${DEPLOY_DIR_IPK}/$arch ${DEPLOY_DIR_IPK}/$sdkarch-nativesdk"
+		packagedirs="$packagedirs ${DEPLOY_DIR_IPK}/$arch"
 	done
 
 	multilib_archs="${MULTILIB_ARCHS}"
@@ -193,21 +192,20 @@ package_update_index_ipk () {
 #
 package_generate_ipkg_conf () {
 	package_generate_archlist
-	echo "src oe file:${DEPLOY_DIR_IPK}" >> ${IPKGCONF_TARGET}
 	echo "src oe file:${DEPLOY_DIR_IPK}" >> ${IPKGCONF_SDK}
+	ipkgarchs="${SDK_PACKAGE_ARCHS}"
+	for arch in $ipkgarchs; do
+		if [ -e ${DEPLOY_DIR_IPK}/$arch/Packages ] ; then
+		        echo "src oe-$arch file:${DEPLOY_DIR_IPK}/$arch" >> ${IPKGCONF_SDK}
+		fi
+	done
+
+	echo "src oe file:${DEPLOY_DIR_IPK}" >> ${IPKGCONF_TARGET}
 	ipkgarchs="${PACKAGE_ARCHS}"
 	for arch in $ipkgarchs; do
 		if [ -e ${DEPLOY_DIR_IPK}/$arch/Packages ] ; then
 		        echo "src oe-$arch file:${DEPLOY_DIR_IPK}/$arch" >> ${IPKGCONF_TARGET}
 		fi
-		sdkarch=`echo $arch | sed -e 's/${HOST_ARCH}/${SDK_ARCH}/'`
-		extension=-nativesdk
-		if [ "$sdkarch" = "all" -o "$sdkarch" = "any" -o "$sdkarch" = "noarch" ]; then
-		    extension=""
-		fi
-		if [ -e ${DEPLOY_DIR_IPK}/$sdkarch$extension/Packages ] ; then
-		        echo "src oe-$sdkarch$extension file:${DEPLOY_DIR_IPK}/$sdkarch$extension" >> ${IPKGCONF_SDK}
-		fi
 	done
 
 	multilib_archs="${MULTILIB_ARCHS}"
@@ -219,16 +217,17 @@ package_generate_ipkg_conf () {
 }
 
 package_generate_archlist () {
+	ipkgarchs="${SDK_PACKAGE_ARCHS}"
+	priority=1
+	for arch in $ipkgarchs; do
+		echo "arch $arch $priority" >> ${IPKGCONF_SDK}
+		priority=$(expr $priority + 5)
+	done
+
 	ipkgarchs="${PACKAGE_ARCHS}"
 	priority=1
 	for arch in $ipkgarchs; do
-		sdkarch=`echo $arch | sed -e 's/${HOST_ARCH}/${SDK_ARCH}/'`
 		echo "arch $arch $priority" >> ${IPKGCONF_TARGET}
-		extension=-nativesdk
-		if [ "$sdkarch" = "all" -o "$sdkarch" = "any" -o "$sdkarch" = "noarch" ]; then
-		    extension=""
-		fi
-		echo "arch $sdkarch$extension $priority" >> ${IPKGCONF_SDK}
 		priority=$(expr $priority + 5)
 	done
 
@@ -237,8 +236,6 @@ package_generate_archlist () {
 		echo "arch $arch $priority" >> ${IPKGCONF_TARGET}
 		priority=$(expr $priority + 5)
 	done
-
-
 }
 
 python do_package_ipk () {
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 0f16613..abedc68 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -31,15 +31,7 @@ package_update_index_rpm () {
 	package_update_index_rpm_common "${RPMCONF_TARGET_BASE}" base_archs ml_archs
 
 	# Update SDK packages
-	base_archs=""
-	for arch in ${PACKAGE_ARCHS}; do
-		sdkarch=`echo $arch | sed -e 's/${HOST_ARCH}/${SDK_ARCH}/'`
-		extension="-nativesdk"
-		if [ "$sdkarch" = "all" -o "$sdkarch" = "any" -o "$sdkarch" = "noarch" ]; then
-		    extension=""
-		fi
-		base_archs="$base_archs $sdkarch$extension"
-	done
+	base_archs="${SDK_PACKAGE_ARCHS}"
 	package_update_index_rpm_common "${RPMCONF_HOST_BASE}" base_archs
 }
 
diff --git a/meta/classes/populate_sdk.bbclass b/meta/classes/populate_sdk.bbclass
index 089ed9a..0f3591b 100644
--- a/meta/classes/populate_sdk.bbclass
+++ b/meta/classes/populate_sdk.bbclass
@@ -22,6 +22,15 @@ fakeroot do_populate_sdk() {
 	rm -rf ${SDK_OUTPUT}
 	mkdir -p ${SDK_OUTPUT}
 
+	# populate_sdk_<image> is required to construct two images:
+	#  SDK_ARCH-nativesdk - contains the cross compiler and associated tooling
+	#  target - contains a target rootfs configured for the SDK usage
+	#
+	# the output of populate_sdk_<image> should end up in ${SDK_OUTPUT} it is made
+	# up of:
+	#  ${SDK_OUTPUT}/<sdk_arch-nativesdk pkgs>
+	#  ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/<target pkgs>
+
 	populate_sdk_${IMAGE_PKGTYPE}
 
 	# Don't ship any libGL in the SDK
diff --git a/meta/classes/populate_sdk_deb.bbclass b/meta/classes/populate_sdk_deb.bbclass
index a5b6384..25d90c7 100644
--- a/meta/classes/populate_sdk_deb.bbclass
+++ b/meta/classes/populate_sdk_deb.bbclass
@@ -34,18 +34,7 @@ fakeroot populate_sdk_deb () {
 	export INSTALL_ROOTFS_DEB="${SDK_OUTPUT}"
 	export INSTALL_BASEARCH_DEB="${SDK_ARCH}"
 	export INSTALL_PACKAGES_NORMAL_DEB="${TOOLCHAIN_HOST_TASK}"
-	INSTALL_ARCHS_DEB=""
-	for arch in ${PACKAGE_ARCHS}; do
-		sdkarch=`echo $arch | sed -e 's/${HOST_ARCH}/${SDK_ARCH}/'`
-		extension="-nativesdk"
-		if [ "$sdkarch" = "all" -o "$sdkarch" = "any" -o "$sdkarch" = "noarch" ]; then
-		    extension=""
-		fi
-		if [ -e ${DEPLOY_DIR_DEB}/$sdkarch$extension ]; then
-			INSTALL_ARCHS_DEB="$INSTALL_ARCHS_DEB $sdkarch$extension"
-		fi
-	done
-	export INSTALL_ARCHS_DEB
+	export INSTALL_ARCHS_DEB="${SDK_PACKAGE_ARCHS}"
 
 	package_install_internal_deb
 	populate_sdk_post_deb ${SDK_OUTPUT}/${SDKPATHNATIVE}
diff --git a/meta/classes/populate_sdk_rpm.bbclass b/meta/classes/populate_sdk_rpm.bbclass
index da308c1..560e40c 100644
--- a/meta/classes/populate_sdk_rpm.bbclass
+++ b/meta/classes/populate_sdk_rpm.bbclass
@@ -34,16 +34,16 @@ fakeroot populate_sdk_rpm () {
 
 	#install target
 	export INSTALL_ROOTFS_RPM="${SDK_OUTPUT}/${SDKTARGETSYSROOT}"
-	export INSTALL_PLATFORM_RPM="${TARGET_ARCHS}"
+	export INSTALL_PLATFORM_RPM="${TARGET_ARCH}"
 	export INSTALL_CONFBASE_RPM="${RPMCONF_TARGET_BASE}"
 	export INSTALL_PACKAGES_NORMAL_RPM="${TOOLCHAIN_TARGET_TASK}"
 
 	# List must be prefered to least preferred order
-	INSTALL_PLATFORM_RPM=""
+	INSTALL_PLATFORM_EXTRA_RPM=""
 	for each_arch in ${PACKAGE_ARCHS} ; do
-		INSTALL_PLATFORM_RPM="$each_arch $INSTALL_PLATFORM_RPM"
+		INSTALL_PLATFORM_EXTRA_RPM="$each_arch $INSTALL_PLATFORM_EXTRA_RPM"
 	done
-	export INSTALL_PLATFORM_RPM
+	export INSTALL_PLATFORM_EXTRA_RPM
 
 	package_install_internal_rpm
 	populate_sdk_post_rpm ${INSTALL_ROOTFS_RPM}
@@ -53,16 +53,11 @@ fakeroot populate_sdk_rpm () {
 	export INSTALL_PLATFORM_RPM="${SDK_ARCH}"
 	export INSTALL_CONFBASE_RPM="${RPMCONF_HOST_BASE}"
 	export INSTALL_PACKAGES_NORMAL_RPM="${TOOLCHAIN_HOST_TASK}"
-	export INSTALL_PLATFORM_EXTRA_RPM=""
-	for arch in ${PACKAGE_ARCHS}; do
-		sdkarch=`echo $arch | sed -e 's/${HOST_ARCH}/${SDK_ARCH}/'`
-		extension="-nativesdk"
-		if [ "$sdkarch" = "all" -o "$sdkarch" = "any" -o "$sdkarch" = "noarch" ]; then
-		    extension=""
-		fi
-		if [ -e ${DEPLOY_DIR_RPM}/$sdkarch$extension ]; then
-			INSTALL_PLATFORM_EXTRA_RPM="$sdkarch $INSTALL_PLATFORM_EXTRA_RPM"
-		fi
+
+	# List must be prefered to least preferred order
+	INSTALL_PLATFORM_EXTRA_RPM=""
+	for each_arch in ${SDK_PACKAGE_ARCHS} ; do
+		INSTALL_PLATFORM_EXTRA_RPM="$each_arch $INSTALL_PLATFORM_EXTRA_RPM"
 	done
 	export INSTALL_PLATFORM_EXTRA_RPM
 
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9c80f11..ac5d1f3 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -100,6 +100,7 @@ SDK_VENDOR = "-oesdk"
 SDK_SYS = "${SDK_ARCH}${SDK_VENDOR}${@['-' + bb.data.getVar('SDK_OS', d, 1), ''][bb.data.getVar('SDK_OS', d, 1) == ('' or 'custom')]}"
 SDK_PREFIX = "${SDK_SYS}-"
 SDK_CC_ARCH = "${BUILD_CC_ARCH}"
+SDK_PACKAGE_ARCHS = "all any noarch ${SDK_ARCH}-nativesdk"
 
 PACKAGE_ARCH = "${TUNE_PKGARCH}"
 MACHINE_ARCH = "${@[bb.data.getVar('TUNE_PKGARCH', d, 1), bb.data.getVar('MACHINE', d, 1)][bool(bb.data.getVar('MACHINE', d, 1))].replace('-', '_')}"
-- 
1.7.3.4



