Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3889A65E19
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Apr 2014 00:23:21 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s3R0NHW0015362 for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Apr 2014 01:23:17 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id y5UDJ_s_T6CR
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Apr 2014 01:23:17 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s3R0NDXJ015359
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Apr 2014 01:23:14 +0100
Message-ID: <1398558187.16672.283.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Apr 2014 01:23:07 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] binutils/gcc/gdb: Add TARGET_ARCH to PN for all cross recipes
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
X-List-Received-Date: Sun, 27 Apr 2014 00:23:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This allows them to co-exist together in the native sysroot, with one
set of cross tools per target architecture.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index f8c9b1e..0dc1e6b 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -158,7 +158,7 @@ python autotools_copy_aclocals () {
             manifest = d.expand("${SSTATE_MANIFESTS}/manifest-${BUILD_ARCH}-%s.populate_sysroot" % c)
         elif c.startswith("nativesdk-"):
             manifest = d.expand("${SSTATE_MANIFESTS}/manifest-${SDK_ARCH}-%s.populate_sysroot" % c)
-        elif c.endswith("-cross") or c.endswith("-cross-initial") or c.endswith("-crosssdk") or c.endswith("-crosssdk-initial"):
+        elif "-cross-" in c or "-crosssdk-" in c:
             continue
         else:
             manifest = d.expand("${SSTATE_MANIFESTS}/manifest-${MACHINE}-%s.populate_sysroot" % c)
diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index 70efee3..cea6afb 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -9,7 +9,7 @@
 # or indirectly via dependency.  No need to be in 'world'.
 EXCLUDE_FROM_WORLD = "1"
 CLASSOVERRIDE = "class-cross-canadian"
-STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${SDK_VENDOR}-${SDK_OS}:${STAGING_DIR_NATIVE}${bindir_native}/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
+STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${SDK_VENDOR}-${SDK_OS}:${STAGING_DIR_NATIVE}${bindir_native}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
 
 #
 # Update BASE_PACKAGE_ARCH and PACKAGE_ARCHS
diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index b7d33f5..a8f3b60 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -19,6 +19,8 @@ HOST_AS_ARCH = "${BUILD_AS_ARCH}"
 
 STAGING_DIR_HOST = "${STAGING_DIR}/${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}"
 
+PACKAGE_ARCH = "${BUILD_ARCH}"
+
 export PKG_CONFIG_DIR = "${STAGING_DIR}/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}${libdir}/pkgconfig"
 export PKG_CONFIG_SYSROOT_DIR = "${STAGING_DIR}/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
 
@@ -43,7 +45,7 @@ target_libdir = "${target_exec_prefix}/${baselib}"
 target_includedir := "${includedir}"
 
 # Overrides for paths
-CROSS_TARGET_SYS_DIR = "${MULTIMACH_TARGET_SYS}"
+CROSS_TARGET_SYS_DIR = "${TARGET_SYS}"
 prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
 base_prefix = "${STAGING_DIR_NATIVE}"
 exec_prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 7b16bc0..46cc267 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -22,10 +22,6 @@ SSTATE_PATHSPEC   = "${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}*/${SSTATE_PKGSPEC
 SSTATE_EXTRAPATH[vardepvalue] = ""
 
 SSTATE_DUPWHITELIST = "${DEPLOY_DIR_IMAGE}/ ${DEPLOY_DIR}/licenses/"
-# Also need to make cross recipes append to ${PN} and install once for any given PACAGE_ARCH so
-# can avoid multiple installs (e.g. routerstationpro+qemumips both using mips32)
-SSTATE_DUPWHITELIST += "${STAGING_LIBDIR_NATIVE}/${MULTIMACH_TARGET_SYS} ${STAGING_DIR_NATIVE}/usr/libexec/${MULTIMACH_TARGET_SYS} ${STAGING_BINDIR_NATIVE}/${MULTIMACH_TARGET_SYS} ${STAGING_DIR_NATIVE}${includedir_native}/gcc-build-internal-${MULTIMACH_TARGET_SYS}"
-SSTATE_DUPWHITELIST += "${STAGING_DIR_NATIVE}/sysroot-providers/virtual_${TARGET_PREFIX} ${STAGING_DIR_NATIVE}/sysroot-providers/binutils-cross ${STAGING_DIR_NATIVE}/sysroot-providers/gcc-cross"
 # Avoid docbook/sgml catalog warnings for now
 SSTATE_DUPWHITELIST += "${STAGING_ETCDIR_NATIVE}/sgml ${STAGING_DATADIR_NATIVE}/sgml"
 
@@ -51,8 +47,7 @@ python () {
     elif bb.data.inherits_class('crosssdk', d):
         d.setVar('SSTATE_PKGARCH', d.expand("${BUILD_ARCH}_${SDK_ARCH}"))
     elif bb.data.inherits_class('cross', d):
-        d.setVar('SSTATE_PKGARCH', d.expand("${BUILD_ARCH}_${TUNE_PKGARCH}"))
-        d.setVar('SSTATE_MANMACH', d.expand("${BUILD_ARCH}_${MACHINE}"))
+        d.setVar('SSTATE_PKGARCH', d.expand("${BUILD_ARCH}_${TARGET_ARCH}"))
     elif bb.data.inherits_class('nativesdk', d):
         d.setVar('SSTATE_PKGARCH', d.expand("${SDK_ARCH}"))
     elif bb.data.inherits_class('cross-canadian', d):
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index bcc387c..4db0fc8 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -352,7 +352,7 @@ STAGING_DIR = "${TMPDIR}/sysroots"
 STAGING_DIR_NATIVE = "${STAGING_DIR}/${BUILD_SYS}"
 STAGING_BINDIR_NATIVE = "${STAGING_DIR_NATIVE}${bindir_native}"
 STAGING_BINDIR_CROSS = "${STAGING_BINDIR}/crossscripts"
-STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
+STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
 STAGING_LIBDIR_NATIVE = "${STAGING_DIR_NATIVE}${libdir_native}"
 STAGING_LIBEXECDIR_NATIVE = "${STAGING_DIR_NATIVE}${libexecdir_native}"
 STAGING_BASE_LIBDIR_NATIVE = "${STAGING_DIR_NATIVE}${base_libdir_native}"
diff --git a/meta/recipes-core/eglibc/eglibc-initial.inc b/meta/recipes-core/eglibc/eglibc-initial.inc
index 4cc6ffe..92402f8 100644
--- a/meta/recipes-core/eglibc/eglibc-initial.inc
+++ b/meta/recipes-core/eglibc/eglibc-initial.inc
@@ -4,9 +4,9 @@ PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
 PACKAGES = ""
 PACKAGES_DYNAMIC = ""
 
-STAGINGCC = "gcc-cross-initial"
-STAGINGCC_class-nativesdk = "gcc-crosssdk-initial"
-TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TARGET}"
+STAGINGCC = "gcc-cross-initial-${TARGET_ARCH}"
+STAGINGCC_class-nativesdk = "gcc-crosssdk-initial-${TARGET_ARCH}"
+TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TCBOOTSTRAP}"
 
 do_configure () {
 	sed -ie 's,{ (exit 1); exit 1; }; },{ (exit 0); }; },g' ${S}/configure
diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
index 5008cf2..30654f6 100644
--- a/meta/recipes-core/eglibc/eglibc.inc
+++ b/meta/recipes-core/eglibc/eglibc.inc
@@ -2,8 +2,8 @@ require eglibc-common.inc
 require eglibc-ld.inc
 require eglibc-testing.inc
 
-STAGINGCC = "gcc-cross-initial"
-STAGINGCC_class-nativesdk = "gcc-crosssdk-initial"
+STAGINGCC = "gcc-cross-initial-${TARGET_ARCH}"
+STAGINGCC_class-nativesdk = "gcc-crosssdk-initial-${TARGET_ARCH}"
 PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
 
 TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TCBOOTSTRAP}"
diff --git a/meta/recipes-devtools/binutils/binutils-cross.inc b/meta/recipes-devtools/binutils/binutils-cross.inc
index 300a1d3..fd3d801 100644
--- a/meta/recipes-devtools/binutils/binutils-cross.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross.inc
@@ -1,6 +1,9 @@
 inherit cross
 PROVIDES = "virtual/${TARGET_PREFIX}binutils"
 
+PN = "binutils-cross-${TARGET_ARCH}"
+BPN = "binutils"
+
 INHIBIT_DEFAULT_DEPS = "1"
 INHIBIT_AUTOTOOLS_DEPS = "1"
 
diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.24.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.24.bb
index 8af407f..b6d9a21 100644
--- a/meta/recipes-devtools/binutils/binutils-crosssdk_2.24.bb
+++ b/meta/recipes-devtools/binutils/binutils-crosssdk_2.24.bb
@@ -2,6 +2,8 @@ require binutils-cross_${PV}.bb
 
 inherit crosssdk
 
+PN = "binutils-crosssdk-${TARGET_ARCH}"
+
 PROVIDES = "virtual/${TARGET_PREFIX}binutils-crosssdk"
 
 SRC_URI += "file://relocatable_sdk.patch"
diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 1e00249..a96bcaa 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -7,6 +7,8 @@ NATIVEDEPS = ""
 
 inherit autotools gettext
 
+BPN = "gcc"
+
 def get_gcc_fpu_setting(bb, d):
     if d.getVar('ARMPKGSFX_EABI', True) == "hf" and d.getVar('TRANSLATED_TARGET_ARCH', True) == "arm":
         return "--with-float=hard"
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 8d979b1..307f73c 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -2,7 +2,6 @@ inherit cross-canadian
 
 SUMMARY = "GNU cc and gcc C compilers (cross-canadian for ${TARGET_ARCH} target)"
 PN = "gcc-cross-canadian-${TRANSLATED_TARGET_ARCH}"
-BPN = "gcc"
 
 DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${HOST_PREFIX}binutils-crosssdk virtual/nativesdk-${HOST_PREFIX}libc-for-gcc nativesdk-gettext"
 
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
index 897e055..5a6da8b 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
@@ -5,6 +5,8 @@ PACKAGES = ""
 INHIBIT_AUTOTOOLS_DEPS = "1"
 INHIBIT_DEFAULT_DEPS = "1"
 
+PN = "gcc-cross-initial-${TARGET_ARCH}"
+
 CROSS_TARGET_SYS_DIR_append = ".${PN}"
 
 # This is intended to be a -very- basic config
@@ -68,8 +70,8 @@ do_install () {
 
 	# gcc-runtime installs libgcc into a special location in staging since it breaks doing a standalone build
 	case ${PN} in
-		*gcc-cross-initial|*gcc-crosssdk-initial)
-			dest=${D}/${includedir}/gcc-build-internal-initial-${MULTIMACH_TARGET_SYS}
+		*gcc-cross-initial-${TARGET_ARCH}|*gcc-crosssdk-initial-${TARGET_ARCH})
+			dest=${D}/${includedir}/gcc-build-internal-initial-${TARGET_SYS}
 			hardlinkdir . $dest
 		;;
 	esac
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index 27ebcf6..ef88d3f 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -9,6 +9,8 @@ python () {
         d.setVar("EXTRADEPENDS", "linux-libc-headers")
 }
 
+PN = "gcc-cross-${TARGET_ARCH}"
+
 require gcc-configure-common.inc
 
 EXTRA_OECONF += " --enable-poison-system-directories"
@@ -138,7 +140,7 @@ STOP
 INHIBIT_PACKAGE_STRIP = "1"
 
 # Compute how to get from libexecdir to bindir in python (easier than shell)
-BINRELPATH = "${@os.path.relpath(d.expand("${STAGING_DIR_NATIVE}${prefix_native}/bin/${MULTIMACH_TARGET_SYS}"), d.expand("${libexecdir}/gcc/${TARGET_SYS}/${BINV}"))}"
+BINRELPATH = "${@os.path.relpath(d.expand("${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_SYS}"), d.expand("${libexecdir}/gcc/${TARGET_SYS}/${BINV}"))}"
 
 do_install () {
 	( cd ${B}/${TARGET_SYS}/libgcc; oe_runmake 'DESTDIR=${D}' install-unwind_h )
@@ -177,8 +179,8 @@ do_install () {
 
 	# gcc-runtime installs libgcc into a special location in staging since it breaks doing a standalone build
 	case ${PN} in
-		*gcc-cross|*gcc-crosssdk)
-			dest=${D}/${includedir}/gcc-build-internal-${MULTIMACH_TARGET_SYS}
+		*gcc-cross-${TARGET_ARCH}|*gcc-crosssdk-${TARGET_ARCH})
+			dest=${D}/${includedir}/gcc-build-internal-${TARGET_SYS}
 			hardlinkdir . $dest
 		;;
 	esac
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-initial.inc b/meta/recipes-devtools/gcc/gcc-crosssdk-initial.inc
index c6f74a6..7d2599c 100644
--- a/meta/recipes-devtools/gcc/gcc-crosssdk-initial.inc
+++ b/meta/recipes-devtools/gcc/gcc-crosssdk-initial.inc
@@ -1,5 +1,7 @@
 inherit crosssdk
 
+PN = "gcc-crosssdk-initial-${TARGET_ARCH}"
+
 SYSTEMHEADERS = "${SDKPATHNATIVE}${prefix_nativesdk}/include"
 SYSTEMLIBS = "${SDKPATHNATIVE}${base_libdir_nativesdk}/"
 SYSTEMLIBS1 = "${SDKPATHNATIVE}${libdir_nativesdk}/"
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk.inc b/meta/recipes-devtools/gcc/gcc-crosssdk.inc
index 5fe0b94..53f880f 100644
--- a/meta/recipes-devtools/gcc/gcc-crosssdk.inc
+++ b/meta/recipes-devtools/gcc/gcc-crosssdk.inc
@@ -1,5 +1,7 @@
 inherit crosssdk
 
+PN = "gcc-crosssdk-${TARGET_ARCH}"
+
 SYSTEMHEADERS = "${SDKPATHNATIVE}${prefix_nativesdk}/include"
 SYSTEMLIBS = "${SDKPATHNATIVE}${base_libdir_nativesdk}/"
 SYSTEMLIBS1 = "${SDKPATHNATIVE}${libdir_nativesdk}/"
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index c59c35a..70f9e0e 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -18,7 +18,7 @@ RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic"
 
 do_configure () {
 	export CXX="${CXX} -nostdinc++ -nostdlib++"
-	mtarget=`echo ${MULTIMACH_TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
+	mtarget=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
 	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
 	hardlinkdir ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$mtarget ${B}
 	for d in libgcc ${RUNTIMETARGET}; do
diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
index b30bcfe..c81a80c 100644
--- a/meta/recipes-devtools/gcc/libgcc-common.inc
+++ b/meta/recipes-devtools/gcc/libgcc-common.inc
@@ -3,7 +3,7 @@ BPN = "libgcc"
 INHIBIT_DEFAULT_DEPS = "1"
 
 do_configure () {
-	target=`echo ${MULTIMACH_TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
+	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
 	install -d ${D}${base_libdir} ${D}${libdir}
 	hardlinkdir ${STAGING_INCDIR_NATIVE}/${LIBGCCBUILDTREENAME}$target/ ${B}
 	mkdir -p ${B}/${BPN}
diff --git a/meta/recipes-devtools/gcc/libgcc-initial.inc b/meta/recipes-devtools/gcc/libgcc-initial.inc
index 2ba27a8..27e2e45 100644
--- a/meta/recipes-devtools/gcc/libgcc-initial.inc
+++ b/meta/recipes-devtools/gcc/libgcc-initial.inc
@@ -2,8 +2,8 @@ require libgcc-common.inc
 
 DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial"
 
-STAGINGCC = "gcc-cross-initial"
-STAGINGCC_class-nativesdk = "gcc-crosssdk-initial"
+STAGINGCC = "gcc-cross-initial-${TARGET_ARCH}"
+STAGINGCC_class-nativesdk = "gcc-crosssdk-initial-${TARGET_ARCH}"
 PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
 
 PACKAGES = ""
diff --git a/meta/recipes-devtools/gcc/libgfortran.inc b/meta/recipes-devtools/gcc/libgfortran.inc
index 30e5ffe..7bf4121 100644
--- a/meta/recipes-devtools/gcc/libgfortran.inc
+++ b/meta/recipes-devtools/gcc/libgfortran.inc
@@ -5,7 +5,7 @@ EXTRA_OECONF_PATHS = " \
     --with-build-sysroot=${STAGING_DIR_TARGET}"
 
 do_configure () {
-	mtarget=`echo ${MULTIMACH_TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
+	mtarget=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
 	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
 	hardlinkdir ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$mtarget ${B}
 
diff --git a/meta/recipes-devtools/gdb/gdb-cross.inc b/meta/recipes-devtools/gdb/gdb-cross.inc
index 6fc98ff..cb99b06 100644
--- a/meta/recipes-devtools/gdb/gdb-cross.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross.inc
@@ -8,6 +8,9 @@ EXTRA_OECONF += "--without-python"
 
 GDBPROPREFIX = ""
 
+PN = "gdb-cross-${TARGET_ARCH}"
+BPN = "gdb"
+
 inherit cross
 inherit gettext
 



