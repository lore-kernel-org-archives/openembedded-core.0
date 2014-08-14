Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7E6F1609BF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 13:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7EDVgZs014029 for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 14:31:42 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id aDi5cwpgEp3I
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 14:31:42 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7EDVent014024
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 14:31:41 +0100
Message-ID: <1408023100.22187.99.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Aug 2014 14:31:40 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] classes: Combine rootfs_<pkgtype> and populate_sdk_<pkgtype>
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
X-List-Received-Date: Thu, 14 Aug 2014 13:31:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There is no real reason to have these separate files any longer. It does
mean in meta-toolchain type recipes some extra variables are defined but
it also means the common code can be grouped and maintained together
which I believe is more beneficial. We therefore merge the classes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 06112dc..8736942 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -20,7 +20,7 @@ def complementary_globs(featurevar, d):
 SDKIMAGE_FEATURES ??= "dev-pkgs dbg-pkgs"
 SDKIMAGE_INSTALL_COMPLEMENTARY = '${@complementary_globs("SDKIMAGE_FEATURES", d)}'
 
-inherit populate_sdk_${IMAGE_PKGTYPE}
+inherit rootfs_${IMAGE_PKGTYPE}
 
 SDK_DIR = "${WORKDIR}/sdk"
 SDK_OUTPUT = "${SDK_DIR}/image"
diff --git a/meta/classes/populate_sdk_deb.bbclass b/meta/classes/populate_sdk_deb.bbclass
deleted file mode 100644
index 6690e2e..0000000
--- a/meta/classes/populate_sdk_deb.bbclass
+++ /dev/null
@@ -1,18 +0,0 @@
-do_populate_sdk[depends] += "dpkg-native:do_populate_sysroot apt-native:do_populate_sysroot bzip2-native:do_populate_sysroot"
-
-python () {
-    # Map TARGET_ARCH to Debian's ideas about architectures
-    darch = d.getVar('SDK_ARCH', True)
-    if darch in ["x86", "i486", "i586", "i686", "pentium"]:
-         d.setVar('DEB_SDK_ARCH', 'i386')
-    elif darch == "x86_64":
-         d.setVar('DEB_SDK_ARCH', 'amd64')
-    elif darch == "arm":
-         d.setVar('DEB_SDK_ARCH', 'armel')
-}
-
-
-do_populate_sdk[lockfiles] += "${DEPLOY_DIR_DEB}/deb.lock"
-
-# This will of course only work after rootfs_deb_do_rootfs or populate_sdk_deb has been called
-DPKG_QUERY_COMMAND = "${STAGING_BINDIR_NATIVE}/dpkg-query --admindir=$INSTALL_ROOTFS_DEB/var/lib/dpkg"
diff --git a/meta/classes/populate_sdk_ipk.bbclass b/meta/classes/populate_sdk_ipk.bbclass
deleted file mode 100644
index 8b2cb6d..0000000
--- a/meta/classes/populate_sdk_ipk.bbclass
+++ /dev/null
@@ -1,3 +0,0 @@
-do_populate_sdk[depends] += "opkg-native:do_populate_sysroot opkg-utils-native:do_populate_sysroot"
-
-do_populate_sdk[lockfiles] += "${WORKDIR}/ipk.lock"
diff --git a/meta/classes/populate_sdk_rpm.bbclass b/meta/classes/populate_sdk_rpm.bbclass
deleted file mode 100644
index 4954d00..0000000
--- a/meta/classes/populate_sdk_rpm.bbclass
+++ /dev/null
@@ -1,16 +0,0 @@
-# Smart is python based, so be sure python-native is available to us.
-EXTRANATIVEPATH += "python-native"
-
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
-rpmlibdir = "/var/lib/rpm"
-
-do_populate_sdk[lockfiles] += "${DEPLOY_DIR_RPM}/rpm.lock"
diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index a42a472..5add7a8 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -22,3 +22,21 @@ DEB_POSTPROCESS_COMMANDS = ""
 
 opkglibdir = "${localstatedir}/lib/opkg"
 
+do_populate_sdk[depends] += "dpkg-native:do_populate_sysroot apt-native:do_populate_sysroot bzip2-native:do_populate_sysroot"
+
+python () {
+    # Map TARGET_ARCH to Debian's ideas about architectures
+    darch = d.getVar('SDK_ARCH', True)
+    if darch in ["x86", "i486", "i586", "i686", "pentium"]:
+         d.setVar('DEB_SDK_ARCH', 'i386')
+    elif darch == "x86_64":
+         d.setVar('DEB_SDK_ARCH', 'amd64')
+    elif darch == "arm":
+         d.setVar('DEB_SDK_ARCH', 'armel')
+}
+
+
+do_populate_sdk[lockfiles] += "${DEPLOY_DIR_DEB}/deb.lock"
+
+# This will of course only work after rootfs_deb_do_rootfs or populate_sdk_deb has been called
+DPKG_QUERY_COMMAND = "${STAGING_BINDIR_NATIVE}/dpkg-query --admindir=$INSTALL_ROOTFS_DEB/var/lib/dpkg"
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index f5fef00..288d9aa 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -36,3 +36,6 @@ python () {
         d.setVar('OPKG_POSTPROCESS_COMMANDS', '')
 }
 
+do_populate_sdk[depends] += "opkg-native:do_populate_sysroot opkg-utils-native:do_populate_sysroot"
+
+do_populate_sdk[lockfiles] += "${WORKDIR}/ipk.lock"
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 9e97d34..fb887e5 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -40,3 +40,19 @@ python () {
         d.setVar('RPM_POSTPROCESS_COMMANDS', '')
 
 }
+# Smart is python based, so be sure python-native is available to us.
+EXTRANATIVEPATH += "python-native"
+
+do_populate_sdk[depends] += "rpm-native:do_populate_sysroot"
+do_populate_sdk[depends] += "rpmresolve-native:do_populate_sysroot"
+do_populate_sdk[depends] += "python-smartpm-native:do_populate_sysroot"
+
+# Needed for update-alternatives
+do_populate_sdk[depends] += "opkg-native:do_populate_sysroot"
+
+# Creating the repo info in do_rootfs
+do_populate_sdk[depends] += "createrepo-native:do_populate_sysroot"
+
+rpmlibdir = "/var/lib/rpm"
+
+do_populate_sdk[lockfiles] += "${DEPLOY_DIR_RPM}/rpm.lock"



