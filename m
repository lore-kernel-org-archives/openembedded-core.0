Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id EAAE56B41B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 11:30:36 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg9xw001260; Thu, 22 Aug 2013 12:42:14 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id tfze2Yv-TcxU; Thu, 22 Aug 2013 12:42:14 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg7TI001228
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 22 Aug 2013 12:42:09 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1VCT5b-0001iZ-A1; Thu, 22 Aug 2013 12:30:07 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 12:29:47 +0100
Message-Id: <1377171000-6469-15-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 15/28] bitbake.conf/classes/gcc: Don't hardcode -nativesdk
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
X-List-Received-Date: Thu, 22 Aug 2013 11:30:37 -0000

Hardcoding -nativesdk as the sdk package architecture is inflexible. We may have
multiple different target OS and we need a way to be able to separate them. Turning
this into a configurable value allows the flexibility we need to build different
SDKMACHINEs with different OS targets.

The commit should have no behaviour change, just makes things more configurable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cross-canadian.bbclass                 | 16 ++++++++--------
 meta/classes/crosssdk.bbclass                       |  2 +-
 meta/classes/nativesdk.bbclass                      |  2 +-
 meta/conf/bitbake.conf                              |  3 ++-
 meta/recipes-devtools/gcc/gcc-configure-runtime.inc |  8 ++++----
 meta/recipes-devtools/gcc/libgcc_4.7.bb             |  6 +++---
 meta/recipes-devtools/gcc/libgcc_4.8.bb             |  6 +++---
 7 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index fa2ab70..87dd994 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -14,25 +14,25 @@ STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${S
 #
 # Update BASE_PACKAGE_ARCH and PACKAGE_ARCHS
 #
-PACKAGE_ARCH = "${SDK_ARCH}-nativesdk"
+PACKAGE_ARCH = "${SDK_ARCH}-${SDKPKGSUFFIX}"
 python () {
     archs = d.getVar('PACKAGE_ARCHS', True).split()
     sdkarchs = []
     for arch in archs:
-        sdkarchs.append(arch + '-nativesdk')
+        sdkarchs.append(arch + '-${SDKPKGSUFFIX}')
     d.setVar('PACKAGE_ARCHS', " ".join(sdkarchs))
 }
 MULTIMACH_TARGET_SYS = "${PACKAGE_ARCH}${HOST_VENDOR}-${HOST_OS}"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-STAGING_DIR_HOST = "${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}"
+STAGING_DIR_HOST = "${STAGING_DIR}/${HOST_ARCH}-${SDKPKGSUFFIX}${HOST_VENDOR}-${HOST_OS}"
 
-TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}"
+TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR}/${HOST_ARCH}-${SDKPKGSUFFIX}${HOST_VENDOR}-${HOST_OS}"
 
 PATH_append = ":${TMPDIR}/sysroots/${HOST_ARCH}/${bindir_cross}"
-PKGDATA_DIR = "${TMPDIR}/pkgdata/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}"
-PKGHIST_DIR = "${TMPDIR}/pkghistory/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}/"
+PKGDATA_DIR = "${TMPDIR}/pkgdata/${HOST_ARCH}-${SDKPKGSUFFIX}${HOST_VENDOR}-${HOST_OS}"
+PKGHIST_DIR = "${TMPDIR}/pkghistory/${HOST_ARCH}-${SDKPKGSUFFIX}${HOST_VENDOR}-${HOST_OS}/"
 
 HOST_ARCH = "${SDK_ARCH}"
 HOST_VENDOR = "${SDK_VENDOR}"
@@ -90,8 +90,8 @@ export PKG_CONFIG_DIR = "${STAGING_DIR_HOST}${layout_libdir}/pkgconfig"
 export PKG_CONFIG_SYSROOT_DIR = "${STAGING_DIR_HOST}"
 
 # Cross-canadian packages need to pull in nativesdk dynamic libs
-SHLIBSDIRS = "${TMPDIR}/pkgdata/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}/shlibs/ ${TMPDIR}/pkgdata/all-${HOST_VENDOR}-${HOST_OS}/shlibs/"
-SHLIBSDIR = "${TMPDIR}/pkgdata/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}/shlibs/"
+SHLIBSDIRS = "${TMPDIR}/pkgdata/${HOST_ARCH}-${SDKPKGSUFFIX}${HOST_VENDOR}-${HOST_OS}/shlibs/ ${TMPDIR}/pkgdata/all-${HOST_VENDOR}-${HOST_OS}/shlibs/"
+SHLIBSDIR = "${TMPDIR}/pkgdata/${HOST_ARCH}-${SDKPKGSUFFIX}${HOST_VENDOR}-${HOST_OS}/shlibs/"
 
 do_populate_sysroot[stamp-extra-info] = ""
 
diff --git a/meta/classes/crosssdk.bbclass b/meta/classes/crosssdk.bbclass
index 635c0c4..bcc285b 100644
--- a/meta/classes/crosssdk.bbclass
+++ b/meta/classes/crosssdk.bbclass
@@ -7,7 +7,7 @@ python () {
 	d.setVar('TUNE_PKGARCH', d.getVar('SDK_ARCH', True))
 }
 
-STAGING_DIR_TARGET = "${STAGING_DIR}/${SDK_ARCH}-nativesdk${SDK_VENDOR}-${SDK_OS}"
+STAGING_DIR_TARGET = "${STAGING_DIR}/${SDK_ARCH}-${SDKPKGSUFFIX}${SDK_VENDOR}-${SDK_OS}"
 STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
 
 TARGET_ARCH = "${SDK_ARCH}"
diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index 0d5cba4..26d1e4a 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -11,7 +11,7 @@ CLASSOVERRIDE = "class-nativesdk"
 #
 # Update PACKAGE_ARCH and PACKAGE_ARCHS
 #
-PACKAGE_ARCH = "${SDK_ARCH}-nativesdk"
+PACKAGE_ARCH = "${SDK_ARCH}-${SDKPKGSUFFIX}"
 PACKAGE_ARCHS = "${SDK_PACKAGE_ARCHS}"
 
 #
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8ae3ad2..4535f68 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -127,7 +127,8 @@ SDK_VENDOR = "-oesdk"
 SDK_SYS = "${SDK_ARCH}${SDK_VENDOR}${@['-' + d.getVar('SDK_OS', True), ''][d.getVar('SDK_OS', True) == ('' or 'custom')]}"
 SDK_PREFIX = "${SDK_SYS}-"
 SDK_CC_ARCH = "${BUILD_CC_ARCH}"
-SDK_PACKAGE_ARCHS = "all any noarch ${SDK_ARCH}-nativesdk"
+SDKPKGSUFFIX = "nativesdk"
+SDK_PACKAGE_ARCHS = "all any noarch ${SDK_ARCH}-${SDKPKGSUFFIX}"
 SDK_LD_ARCH = "${BUILD_LD_ARCH}"
 SDK_AS_ARCH = "${BUILD_AS_ARCH}"
 
diff --git a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
index 977a98a..f89ca6b 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
@@ -15,8 +15,8 @@ RUNTIMETARGET = "libssp libstdc++-v3 libgomp"
 
 do_configure () {
 	export CXX="${CXX} -nostdinc++ -nostdlib++"
-	mtarget=`echo ${MULTIMACH_TARGET_SYS} | sed -e s#-nativesdk##`
-	target=`echo ${TARGET_SYS} | sed -e s#-nativesdk##`
+	mtarget=`echo ${MULTIMACH_TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
+	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
 	cp -fpPR ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$mtarget/* ${B}
 	for d in libgcc ${RUNTIMETARGET}; do
 		echo "Configuring $d"
@@ -29,7 +29,7 @@ do_configure () {
 }
 
 do_compile () {
-	target=`echo ${TARGET_SYS} | sed -e s#-nativesdk##`
+	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
 	for d in libgcc ${RUNTIMETARGET}; do
 		cd ${B}/$target/$d/
 		oe_runmake MULTIBUILDTOP=${B}/$target/$d/
@@ -37,7 +37,7 @@ do_compile () {
 }
 
 do_install () {
-	target=`echo ${TARGET_SYS} | sed -e s#-nativesdk##`
+	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
 	for d in ${RUNTIMETARGET}; do
 		cd ${B}/$target/$d/
 		oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/$target/$d/ install
diff --git a/meta/recipes-devtools/gcc/libgcc_4.7.bb b/meta/recipes-devtools/gcc/libgcc_4.7.bb
index 47669a2..3b5bb43 100644
--- a/meta/recipes-devtools/gcc/libgcc_4.7.bb
+++ b/meta/recipes-devtools/gcc/libgcc_4.7.bb
@@ -26,7 +26,7 @@ FILES_libgcov-dev = " \
 FILES_${PN}-dbg += "${base_libdir}/.debug/"
 
 do_configure () {
-	target=`echo ${MULTIMACH_TARGET_SYS} | sed -e s#-nativesdk##`
+	target=`echo ${MULTIMACH_TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
 	install -d ${D}${base_libdir} ${D}${libdir}
 	cp -fpPR ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$target/* ${B}
 	mkdir -p ${B}/${BPN}
@@ -36,13 +36,13 @@ do_configure () {
 }
 
 do_compile () {
-	target=`echo ${TARGET_SYS} | sed -e s#-nativesdk##`
+	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
 	cd ${B}/${BPN}
 	oe_runmake MULTIBUILDTOP=${B}/$target/${BPN}/
 }
 
 do_install () {
-	target=`echo ${TARGET_SYS} | sed -e s#-nativesdk##`
+	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
 	cd ${B}/${BPN}
 	oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/$target/${BPN}/ install
 
diff --git a/meta/recipes-devtools/gcc/libgcc_4.8.bb b/meta/recipes-devtools/gcc/libgcc_4.8.bb
index 47669a2..3b5bb43 100644
--- a/meta/recipes-devtools/gcc/libgcc_4.8.bb
+++ b/meta/recipes-devtools/gcc/libgcc_4.8.bb
@@ -26,7 +26,7 @@ FILES_libgcov-dev = " \
 FILES_${PN}-dbg += "${base_libdir}/.debug/"
 
 do_configure () {
-	target=`echo ${MULTIMACH_TARGET_SYS} | sed -e s#-nativesdk##`
+	target=`echo ${MULTIMACH_TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
 	install -d ${D}${base_libdir} ${D}${libdir}
 	cp -fpPR ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$target/* ${B}
 	mkdir -p ${B}/${BPN}
@@ -36,13 +36,13 @@ do_configure () {
 }
 
 do_compile () {
-	target=`echo ${TARGET_SYS} | sed -e s#-nativesdk##`
+	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
 	cd ${B}/${BPN}
 	oe_runmake MULTIBUILDTOP=${B}/$target/${BPN}/
 }
 
 do_install () {
-	target=`echo ${TARGET_SYS} | sed -e s#-nativesdk##`
+	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
 	cd ${B}/${BPN}
 	oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/$target/${BPN}/ install
 
-- 
1.8.1.2


