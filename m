Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QkKIs-00024f-3h for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 20:18:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6MI0ilE030441
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 19:00:44 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30123-02 for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 19:00:40 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6MI0aN3030430
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 19:00:36 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
In-Reply-To: <cover.1311345613.git.richard.purdie@linuxfoundation.org>
References: <cover.1311345613.git.richard.purdie@linuxfoundation.org>
Date: Fri, 22 Jul 2011 19:00:33 +0100
Message-ID: <1311357633.2344.154.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH 4/3] bitbake.conf/classes: Variable cleanup
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
X-List-Received-Date: Fri, 22 Jul 2011 18:18:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This patch removes the variables BASE_PACKAGE_ARCH, BASEPKG_HOST_SYS,
BASEPKG_TARGET_SYS and also removes the immediate assignments in
several core classes as these are no longer required.

This should make it clearer what some of the core variables do and
simplfy some overly complex and confusing class code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
index e3ac392..26fca70 100644
--- a/meta/classes/allarch.bbclass
+++ b/meta/classes/allarch.bbclass
@@ -2,7 +2,6 @@
 # This class is used for architecture independent recipes/data files (usally scripts)
 #
 
-BASE_PACKAGE_ARCH = "all"
 PACKAGE_ARCH = "all"
 
 # No need for virtual/libc or a cross compiler
diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index edd51da..c878d7f 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -9,15 +9,12 @@
 # or indirectly via dependency.  No need to be in 'world'.
 EXCLUDE_FROM_WORLD = "1"
 
-STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${SDK_VENDOR}-${SDK_OS}:${STAGING_DIR_NATIVE}${bindir_native}/${OLD_BASE_PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
+STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${SDK_VENDOR}-${SDK_OS}:${STAGING_DIR_NATIVE}${bindir_native}/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
 
 #
 # Update BASE_PACKAGE_ARCH and PACKAGE_ARCHS
 #
-OLD_PACKAGE_ARCH := "${PACKAGE_ARCH}"
-OLD_MULTIMACH_TARGET_SYS := "${MULTIMACH_TARGET_SYS}"
-OLD_BASE_PACKAGE_ARCH := ${BASE_PACKAGE_ARCH}
-BASE_PACKAGE_ARCH = "${SDK_ARCH}-nativesdk"
+PACKAGE_ARCH = "${SDK_ARCH}-nativesdk"
 python () {
     archs = bb.data.getVar('PACKAGE_ARCHS', d, True).split()
     sdkarchs = []
@@ -66,12 +63,12 @@ target_exec_prefix := "${exec_prefix}"
 base_prefix = "${SDKPATHNATIVE}"
 prefix = "${SDKPATHNATIVE}${prefix_nativesdk}"
 exec_prefix = "${SDKPATHNATIVE}${prefix_nativesdk}"
-bindir = "${exec_prefix}/bin/${OLD_PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
+bindir = "${exec_prefix}/bin/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
 sbindir = "${bindir}"
 base_bindir = "${bindir}"
 base_sbindir = "${bindir}"
-libdir = "${exec_prefix}/lib/${OLD_PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
-libexecdir = "${exec_prefix}/libexec/${OLD_PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
+libdir = "${exec_prefix}/lib/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
+libexecdir = "${exec_prefix}/libexec/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
 
 FILES_${PN} = "${prefix}"
 FILES_${PN}-dbg += "${prefix}/.debug \
diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index 81358ec..050d63e 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -4,14 +4,6 @@ inherit relocatable
 # no need for them to be a direct target of 'world'
 EXCLUDE_FROM_WORLD = "1"
 
-# Save PACKAGE_ARCH before changing HOST_ARCH
-OLD_PACKAGE_ARCH := "${PACKAGE_ARCH}"
-PACKAGE_ARCH = "${OLD_PACKAGE_ARCH}"
-# Also save BASE_PACKAGE_ARCH since HOST_ARCH can influence it
-OLD_BASE_PACKAGE_ARCH := "${BASE_PACKAGE_ARCH}"
-BASE_PACKAGE_ARCH = "${OLD_BASE_PACKAGE_ARCH}"
-BASEPKG_HOST_SYS = "${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}"
-
 PACKAGES = ""
 
 HOST_ARCH = "${BUILD_ARCH}"
@@ -20,10 +12,10 @@ HOST_OS = "${BUILD_OS}"
 HOST_PREFIX = "${BUILD_PREFIX}"
 HOST_CC_ARCH = "${BUILD_CC_ARCH}"
 
-STAGING_DIR_HOST = "${STAGING_DIR}/${BASEPKG_HOST_SYS}"
+STAGING_DIR_HOST = "${STAGING_DIR}/${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}"
 
-export PKG_CONFIG_DIR = "${STAGING_DIR}/${BASE_PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}${libdir}/pkgconfig"
-export PKG_CONFIG_SYSROOT_DIR = "${STAGING_DIR}/${BASE_PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
+export PKG_CONFIG_DIR = "${STAGING_DIR}/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}${libdir}/pkgconfig"
+export PKG_CONFIG_SYSROOT_DIR = "${STAGING_DIR}/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
 
 CPPFLAGS = "${BUILD_CPPFLAGS}"
 CFLAGS = "${BUILD_CFLAGS}"
diff --git a/meta/classes/crosssdk.bbclass b/meta/classes/crosssdk.bbclass
index 3952ebd..a2e5a22 100644
--- a/meta/classes/crosssdk.bbclass
+++ b/meta/classes/crosssdk.bbclass
@@ -1,8 +1,8 @@
 inherit cross
 
-BASE_PACKAGE_ARCH = "${SDK_ARCH}"
-PACKAGE_ARCH = "${BASE_PACKAGE_ARCH}"
+PACKAGE_ARCH = "${SDK_ARCH}"
 STAGING_DIR_TARGET = "${STAGING_DIR}/${SDK_ARCH}-nativesdk${SDK_VENDOR}-${SDK_OS}"
+STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
 
 TARGET_ARCH = "${SDK_ARCH}"
 TARGET_VENDOR = "${SDK_VENDOR}"
diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 1e8de95..00f7b9f 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -15,10 +15,6 @@ PACKAGE_ARCH = "${BUILD_ARCH}"
 OECMAKE_RPATH = "${libdir}"
 OECMAKE_RPATH_virtclass-native = "${libdir}"
 
-BASE_PACKAGE_ARCH = "${BUILD_ARCH}"
-BASEPKG_HOST_SYS = "${BUILD_ARCH}${BUILD_VENDOR}-${BUILD_OS}"
-BASEPKG_TARGET_SYS = "${BUILD_ARCH}${BUILD_VENDOR}-${BUILD_OS}"
-
 # When this class has packaging enabled, setting 
 # RPROVIDES becomes unnecessary.
 RPROVIDES = "${PN}"
diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index 3fe4bf9..de7a883 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -5,10 +5,9 @@ EXCLUDE_FROM_WORLD = "1"
 STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${SDK_VENDOR}-${SDK_OS}"
 
 #
-# Update BASE_PACKAGE_ARCH and PACKAGE_ARCHS
+# Update PACKAGE_ARCH and PACKAGE_ARCHS
 #
-OLD_PACKAGE_ARCH := ${BASE_PACKAGE_ARCH}
-BASE_PACKAGE_ARCH = "${SDK_ARCH}-nativesdk"
+PACKAGE_ARCH = "${SDK_ARCH}-nativesdk"
 python () {
     archs = bb.data.getVar('PACKAGE_ARCHS', d, True).split()
     sdkarchs = []
@@ -17,10 +16,8 @@ python () {
     bb.data.setVar('PACKAGE_ARCHS', " ".join(sdkarchs), d)
 }
 
-#STAGING_DIR_HOST = "${STAGING_DIR}/${HOST_SYS}-nativesdk"
-#STAGING_DIR_TARGET = "${STAGING_DIR}/${BASEPKG_TARGET_SYS}-nativesdk"
-STAGING_DIR_HOST = "${STAGING_DIR}/${BASEPKG_HOST_SYS}"
-STAGING_DIR_TARGET = "${STAGING_DIR}/${BASEPKG_TARGET_SYS}"
+STAGING_DIR_HOST = "${STAGING_DIR}/${MULTIMACH_HOST_SYS}"
+STAGING_DIR_TARGET = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}"
 
 HOST_ARCH = "${SDK_ARCH}"
 HOST_VENDOR = "${SDK_VENDOR}"
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 62c7c43..c057cc7 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -22,14 +22,14 @@ python () {
     if bb.data.inherits_class('native', d):
         bb.data.setVar('SSTATE_PKGARCH', bb.data.getVar('BUILD_ARCH', d), d)
     elif bb.data.inherits_class('cross', d):
-        bb.data.setVar('SSTATE_PKGARCH', bb.data.expand("${BUILD_ARCH}_${BASE_PACKAGE_ARCH}", d), d)
+        bb.data.setVar('SSTATE_PKGARCH', bb.data.expand("${BUILD_ARCH}_${TUNE_PKGARCH}", d), d)
         bb.data.setVar('SSTATE_MANMACH', bb.data.expand("${BUILD_ARCH}_${MACHINE}", d), d)
     elif bb.data.inherits_class('crosssdk', d):
-        bb.data.setVar('SSTATE_PKGARCH', bb.data.expand("${BUILD_ARCH}_${BASE_PACKAGE_ARCH}", d), d)
+        bb.data.setVar('SSTATE_PKGARCH', bb.data.expand("${BUILD_ARCH}_${PACKAGE_ARCH}", d), d)
     elif bb.data.inherits_class('nativesdk', d):
         bb.data.setVar('SSTATE_PKGARCH', bb.data.expand("${SDK_ARCH}", d), d)
     elif bb.data.inherits_class('cross-canadian', d):
-        bb.data.setVar('SSTATE_PKGARCH', bb.data.expand("${SDK_ARCH}_${BASE_PACKAGE_ARCH}", d), d)
+        bb.data.setVar('SSTATE_PKGARCH', bb.data.expand("${SDK_ARCH}_${PACKAGE_ARCH}", d), d)
     else:
         bb.data.setVar('SSTATE_MANMACH', bb.data.expand("${MACHINE}", d), d)
 
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 2954faa..9d1c769 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -98,8 +98,7 @@ SDK_SYS = "${SDK_ARCH}${SDK_VENDOR}${@['-' + bb.data.getVar('SDK_OS', d, 1), '']
 SDK_PREFIX = "${SDK_SYS}-"
 SDK_CC_ARCH = "${BUILD_CC_ARCH}"
 
-BASE_PACKAGE_ARCH = "${TUNE_PKGARCH}"
-PACKAGE_ARCH = "${BASE_PACKAGE_ARCH}"
+PACKAGE_ARCH = "${TUNE_PKGARCH}"
 MACHINE_ARCH = "${@[bb.data.getVar('TUNE_PKGARCH', d, 1), bb.data.getVar('MACHINE', d, 1)][bool(bb.data.getVar('MACHINE', d, 1))].replace('-', '_')}"
 PACKAGE_EXTRA_ARCHS ??= "${TARGET_ARCH}"
 PACKAGE_ARCHS = "all any noarch ${PACKAGE_EXTRA_ARCHS} ${MACHINE_ARCH}"
@@ -109,8 +108,6 @@ PACKAGE_ARCHS[vardepsexclude] = "MACHINE_ARCH"
 
 MULTIMACH_TARGET_SYS = "${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
 MULTIMACH_HOST_SYS = "${PACKAGE_ARCH}${HOST_VENDOR}-${HOST_OS}"
-BASEPKG_HOST_SYS = "${BASE_PACKAGE_ARCH}${HOST_VENDOR}-${HOST_OS}"
-BASEPKG_TARGET_SYS = "${BASE_PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
 
 # select proper CPU to get binary locales generated
 QEMU_OPTIONS = ""
@@ -317,7 +314,7 @@ STAGING_DIR = "${TMPDIR}/sysroots"
 STAGING_DIR_NATIVE = "${STAGING_DIR}/${BUILD_SYS}"
 STAGING_BINDIR_NATIVE = "${STAGING_DIR_NATIVE}${bindir_native}"
 STAGING_BINDIR_CROSS = "${STAGING_BINDIR}/crossscripts"
-STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${BASEPKG_TARGET_SYS}"
+STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
 STAGING_LIBDIR_NATIVE = "${STAGING_DIR_NATIVE}${libdir_native}"
 STAGING_INCDIR_NATIVE = "${STAGING_DIR_NATIVE}${includedir_native}"
 STAGING_ETCDIR_NATIVE = "${STAGING_DIR_NATIVE}${sysconfdir_native}"
diff --git a/meta/recipes-graphics/xorg-font/font-util_1.2.0.bb b/meta/recipes-graphics/xorg-font/font-util_1.2.0.bb
index a04bd6d..8834708 100644
--- a/meta/recipes-graphics/xorg-font/font-util_1.2.0.bb
+++ b/meta/recipes-graphics/xorg-font/font-util_1.2.0.bb
@@ -8,8 +8,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c0067273d90f6336008cb2504e14bd32 \
                     file://bdftruncate.c;endline=26;md5=4f82ffc101a1b165eae9c6998abff937 \
                     file://map-ISO8859-1;beginline=9;endline=23;md5=1cecb984063248f29ffe5c46f5c04f34"
 
-PACKAGE_ARCH = "${BASE_PACKAGE_ARCH}"
-
 DEPENDS = "encodings util-macros"
 DEPENDS_virtclass-native = "util-macros-native"
 RDEPENDS_${PN} = "mkfontdir mkfontscale encodings"




