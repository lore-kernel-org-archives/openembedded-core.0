Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9B57B609BF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 13:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7EDWCi5014071 for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 14:32:12 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HnK5VFeh_KDp
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 14:32:12 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7EDW9qX014067
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 14:32:10 +0100
Message-ID: <1408023130.22187.100.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Aug 2014 14:32:10 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] rootfs_*: Refactor common depends/lockfile task flags
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
X-List-Received-Date: Thu, 14 Aug 2014 13:32:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index 5add7a8..d51b458 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -6,11 +6,13 @@ ROOTFS_PKGMANAGE = "dpkg apt"
 ROOTFS_PKGMANAGE_BOOTSTRAP  = "run-postinsts"
 
 do_rootfs[depends] += "dpkg-native:do_populate_sysroot apt-native:do_populate_sysroot"
+do_populate_sdk[depends] += "dpkg-native:do_populate_sysroot apt-native:do_populate_sysroot bzip2-native:do_populate_sysroot"
 do_rootfs[recrdeptask] += "do_package_write_deb"
 rootfs_deb_do_rootfs[vardepsexclude] += "BUILDNAME"
 do_rootfs[vardeps] += "PACKAGE_FEED_URIS"
 
 do_rootfs[lockfiles] += "${DEPLOY_DIR_DEB}/deb.lock"
+do_populate_sdk[lockfiles] += "${DEPLOY_DIR_DEB}/deb.lock"
 
 python rootfs_deb_bad_recommendations() {
     if d.getVar("BAD_RECOMMENDATIONS", True):
@@ -22,8 +24,6 @@ DEB_POSTPROCESS_COMMANDS = ""
 
 opkglibdir = "${localstatedir}/lib/opkg"
 
-do_populate_sdk[depends] += "dpkg-native:do_populate_sysroot apt-native:do_populate_sysroot bzip2-native:do_populate_sysroot"
-
 python () {
     # Map TARGET_ARCH to Debian's ideas about architectures
     darch = d.getVar('SDK_ARCH', True)
@@ -35,8 +35,5 @@ python () {
          d.setVar('DEB_SDK_ARCH', 'armel')
 }
 
-
-do_populate_sdk[lockfiles] += "${DEPLOY_DIR_DEB}/deb.lock"
-
 # This will of course only work after rootfs_deb_do_rootfs or populate_sdk_deb has been called
 DPKG_QUERY_COMMAND = "${STAGING_BINDIR_NATIVE}/dpkg-query --admindir=$INSTALL_ROOTFS_DEB/var/lib/dpkg"
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 288d9aa..6139cc7 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -10,11 +10,13 @@ ROOTFS_PKGMANAGE = "opkg opkg-collateral ${EXTRAOPKGCONFIG}"
 ROOTFS_PKGMANAGE_BOOTSTRAP  = "run-postinsts"
 
 do_rootfs[depends] += "opkg-native:do_populate_sysroot opkg-utils-native:do_populate_sysroot"
+do_populate_sdk[depends] += "opkg-native:do_populate_sysroot opkg-utils-native:do_populate_sysroot"
 do_rootfs[recrdeptask] += "do_package_write_ipk"
 do_rootfs[vardeps] += "PACKAGE_FEED_URIS"
 rootfs_ipk_do_rootfs[vardepsexclude] += "BUILDNAME"
 
 do_rootfs[lockfiles] += "${WORKDIR}/ipk.lock"
+do_populate_sdk[lockfiles] += "${WORKDIR}/ipk.lock"
 
 OPKG_PREPROCESS_COMMANDS = ""
 
@@ -35,7 +37,3 @@ python () {
         d.setVar('OPKG_PREPROCESS_COMMANDS', "")
         d.setVar('OPKG_POSTPROCESS_COMMANDS', '')
 }
-
-do_populate_sdk[depends] += "opkg-native:do_populate_sysroot opkg-utils-native:do_populate_sysroot"
-
-do_populate_sdk[lockfiles] += "${WORKDIR}/ipk.lock"
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index fb887e5..d85d001 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -11,15 +11,15 @@ IMAGE_ROOTFS_EXTRA_SPACE_append = "${@bb.utils.contains("PACKAGE_INSTALL", "smar
 # Smart is python based, so be sure python-native is available to us.
 EXTRANATIVEPATH += "python-native"
 
-do_rootfs[depends] += "rpm-native:do_populate_sysroot"
-do_rootfs[depends] += "rpmresolve-native:do_populate_sysroot"
-do_rootfs[depends] += "python-smartpm-native:do_populate_sysroot"
+# opkg is needed for update-alternatives
+RPMROOTFSDEPENDS = "rpm-native:do_populate_sysroot \
+    rpmresolve-native:do_populate_sysroot \
+    python-smartpm-native:do_populate_sysroot \
+    createrepo-native:do_populate_sysroot \
+    opkg-native:do_populate_sysroot"
 
-# Needed for update-alternatives
-do_rootfs[depends] += "opkg-native:do_populate_sysroot"
-
-# Creating the repo info in do_rootfs
-do_rootfs[depends] += "createrepo-native:do_populate_sysroot"
+do_rootfs[depends] += "${RPMROOTFSDEPENDS}"
+do_populate_sdk[depends] += "${RPMROOTFSDEPENDS}"
 
 do_rootfs[recrdeptask] += "do_package_write_rpm"
 rootfs_rpm_do_rootfs[vardepsexclude] += "BUILDNAME"
@@ -28,6 +28,7 @@ do_rootfs[vardeps] += "PACKAGE_FEED_URIS"
 # RPM doesn't work with multiple rootfs generation at once due to collisions in the use of files 
 # in ${DEPLOY_DIR_RPM}. This can be removed if package_update_index_rpm can be called concurrently
 do_rootfs[lockfiles] += "${DEPLOY_DIR_RPM}/rpm.lock"
+do_populate_sdk[lockfiles] += "${DEPLOY_DIR_RPM}/rpm.lock"
 
 python () {
     if d.getVar('BUILD_IMAGES_FROM_FEEDS', True):
@@ -43,16 +44,4 @@ python () {
 # Smart is python based, so be sure python-native is available to us.
 EXTRANATIVEPATH += "python-native"
 
-do_populate_sdk[depends] += "rpm-native:do_populate_sysroot"
-do_populate_sdk[depends] += "rpmresolve-native:do_populate_sysroot"
-do_populate_sdk[depends] += "python-smartpm-native:do_populate_sysroot"
-
-# Needed for update-alternatives
-do_populate_sdk[depends] += "opkg-native:do_populate_sysroot"
-
-# Creating the repo info in do_rootfs
-do_populate_sdk[depends] += "createrepo-native:do_populate_sysroot"
-
 rpmlibdir = "/var/lib/rpm"
-
-do_populate_sdk[lockfiles] += "${DEPLOY_DIR_RPM}/rpm.lock"



