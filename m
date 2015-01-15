Return-Path: <danismostlikely@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2172B71144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 03:50:49 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id q108so10141772qgd.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 19:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=YgRTKl8xDtM7FsOUBKW7NTvqRqLWQSCLjrDpjsgqnCw=;
	b=FFMAzvzuPDqUaEROKZHldZuoPmbNwpvXQsrfe6YVvEHxEog2Oi3p6ia8atdbOqsMJd
	3mcreCxA/6qV90lmfzbw3tfZrkU0SE0sHz14LWPkqTDwpkOdlFwfh24vw5QnNq1zr8r/
	knm0WfLjEd/O4YkB5y4JT2l5Gwq2CwYmCYk/kJZ+9a1t8nFrbHS0kpnyAABwsLa6PpDQ
	a9tPEY2xuY3pz54Jccwdajh/5lsbUrUIILzVSL1BXhXtNsScbMs0JkgVyiijkMeEeN8K
	+7PSuaffTe293J9hCkqhPab2Z2C8uMoVflnA4ekmYYt+U07jtldd5S1aLcPtYEHBSW+m
	bKDg==
MIME-Version: 1.0
X-Received: by 10.224.79.12 with SMTP id n12mr13199075qak.2.1421293850086;
	Wed, 14 Jan 2015 19:50:50 -0800 (PST)
Received: by 10.96.35.34 with HTTP; Wed, 14 Jan 2015 19:50:50 -0800 (PST)
Date: Wed, 14 Jan 2015 21:50:50 -0600
Message-ID: <CACS+7ZSEuquv+h=wTo85TW2M+gqX9_NqAYiFu=6zpgLPi8uqDg@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/3] gcc-sanitizers: Enable GCC sanitizers
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
X-List-Received-Date: Thu, 15 Jan 2015 03:50:59 -0000
Content-Type: text/plain; charset=UTF-8

From: Dan McGregor <dan.mcgregor@usask.ca>

AddressSanitizer is a fast memory error detector.
ThreadSanitizer detects data races.
UBSanitizer detectes undefined behaviour.

All consist of compiler instrumentation and a run-time library.
The compiler instrumentation was already enabled, this builds
the run-time library component.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/conf/distro/include/security_flags.inc     |   1 +
 meta/conf/distro/include/tcmode-default.inc     |   2 +
 meta/recipes-devtools/gcc/gcc-sanitizers.inc    | 111 ++++++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-sanitizers_4.8.bb |   2 +
 meta/recipes-devtools/gcc/gcc-sanitizers_4.9.bb |   2 +
 5 files changed, 118 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-sanitizers.inc
 create mode 100644 meta/recipes-devtools/gcc/gcc-sanitizers_4.8.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-sanitizers_4.9.bb

diff --git a/meta/conf/distro/include/security_flags.inc
b/meta/conf/distro/include/security_flags.inc
index 840f68a..38af5fd 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -28,6 +28,7 @@ SECURITY_CFLAGS_pn-glibc-initial = ""
 SECURITY_CFLAGS_pn-enchant = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-flac = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gcc-runtime = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-gcc-sanitizers = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gdb = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gmp = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gnutls = "${SECURITY_NO_PIE_CFLAGS}"
diff --git a/meta/conf/distro/include/tcmode-default.inc
b/meta/conf/distro/include/tcmode-default.inc
index 2b41090..b4c3c70 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -36,8 +36,10 @@ PREFERRED_VERSION_gcc-crosssdk-${SDK_ARCH} ?=
"${SDKGCCVERSION}"
 PREFERRED_VERSION_gcc-crosssdk-initial-${SDK_ARCH} ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=
"${GCCVERSION}"
 PREFERRED_VERSION_gcc-runtime ?= "${GCCVERSION}"
+PREFERRED_VERSION_gcc-sanitizers ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-source ?= "${GCCVERSION}"
 PREFERRED_VERSION_nativesdk-gcc-runtime ?= "${SDKGCCVERSION}"
+PREFERRED_VERSION_nativesdk-gcc-sanitizers ?= "${GCCVERSION}"
 PREFERRED_VERSION_libgcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_libgcc-initial ?= "${GCCVERSION}"
 PREFERRED_VERSION_nativesdk-libgcc ?= "${SDKGCCVERSION}"
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
new file mode 100644
index 0000000..892dfe0
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -0,0 +1,111 @@
+require gcc-configure-common.inc
+
+EXTRA_OECONF_PATHS = "\
+    --with-sysroot=/not/exist \
+    --with-build-sysroot=${STAGING_DIR_TARGET} \
+"
+
+do_configure () {
+    mtarget=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
+    target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
+    hardlinkdir ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$mtarget ${B}
+
+    echo "Configuring libsanitizer"
+    rm -rf ${B}/$target/libsanitizer/
+    mkdir -p ${B}/$target/libsanitizer/
+    # This is kind of gross, but it's an easy way to make configure happy
+    # without hacking it up to use the system stdc++ instead of the one it
+    # expects to be newly built.
+    rm -rf ${B}/$target/libstdc++-v3/
+    mkdir -p ${B}/$target/libstdc++-v3/src/
+    ln -s ${STAGING_LIBDIR}/libstdc++.la ${B}/$target/libstdc++-v3/src/
+    ln -s ${STAGING_LIBDIR}/libstdc++.so ${B}/$target/libstdc++-v3/src/
+    cd ${B}/$target/libsanitizer/
+    chmod a+x ${S}/libsanitizer/configure
+    ${S}/libsanitizer/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
+    # Easiest way to stop bad RPATHs getting into the library since we have a
+    # broken libtool here
+    sed -i -e 's/hardcode_into_libs=yes/hardcode_into_libs=no/'
${B}/$target/libsanitizer/libtool
+}
+
+do_compile () {
+    target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
+    cd ${B}/$target/libsanitizer/
+    oe_runmake MULTIBUILDTOP=${B}/$target/libsanitizer/
+}
+
+do_install () {
+    target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
+    cd ${B}/$target/libsanitizer/
+    oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/$target/libsanitizer/ install
+    if [ -d ${D}${infodir} ]; then
+        rmdir --ignore-fail-on-non-empty -p ${D}${infodir}
+    fi
+    chown -R root:root ${D}
+}
+
+INHIBIT_DEFAULT_DEPS = "1"
+ALLOW_EMPTY_${PN} = "1"
+DEPENDS = "gcc-runtime"
+
+BBCLASSEXTEND = "nativesdk"
+
+PACKAGES = "${PN}"
+PACKAGES += "libasan libubsan liblsan libtsan"
+PACKAGES += "libasan-dev libubsan-dev liblsan-dev libtsan-dev"
+PACKAGES += "libasan-dbg libubsan-dbg liblsan-dbg libtsan-dbg"
+PACKAGES += "libasan-staticdev libubsan-staticdev liblsan-staticdev
libtsan-staticdev"
+
+RDEPENDS_libasan += "libstdc++"
+RDEPENDS_libubsan += "libstdc++"
+RDEPENDS_liblsan += "libstdc++"
+RDEPENDS_libtsan += "libstdc++"
+RDEPENDS_libasan-dev += "${PN}"
+RDEPENDS_libubsan-dev += "${PN}"
+RDEPENDS_liblsan-dev += "${PN}"
+RDEPENDS_libtsan-dev += "${PN}"
+RRECOMMENDS_${PN} += "libasan libubsan"
+RRECOMMENDS_${PN}_append_x86-64 = " liblsan libtsan"
+RRECOMMENDS_${PN}_append_x86 = " liblsan"
+
+do_package_write_ipk[depends] +=
"virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata"
+do_package_write_deb[depends] +=
"virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata"
+do_package_write_rpm[depends] +=
"virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata"
+
+# MIPS, aarch64, and SPARC are broken.
+COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm).*-linux'
+
+FILES_libasan += "${libdir}/libasan.so.*"
+FILES_libasan-dbg += "${libdir}/.debug/libasan.so.*"
+FILES_libasan-dev += "\
+    ${libdir}/libasan_preinit.o \
+    ${libdir}/libasan.so \
+    ${libdir}/libasan.la \
+"
+FILES_libasan-staticdev += "${libdir}/libasan.a"
+
+FILES_libubsan += "${libdir}/libubsan.so.*"
+FILES_libubsan-dbg += "${libdir}/.debug/libubsan.so.*"
+FILES_libubsan-dev += "\
+    ${libdir}/libubsan.so \
+    ${libdir}/libubsan.la \
+"
+FILES_libubsan-staticdev += "${libdir}/libubsan.a"
+
+FILES_liblsan += "${libdir}/liblsan.so.*"
+FILES_liblsan-dbg += "${libdir}/.debug/liblsan.so.*"
+FILES_liblsan-dev += "\
+    ${libdir}/liblsan.so \
+    ${libdir}/liblsan.la \
+"
+FILES_liblsan-staticdev += "${libdir}/liblsan.a"
+
+FILES_libtsan += "${libdir}/libtsan.so.*"
+FILES_libtsan-dbg += "${libdir}/.debug/libtsan.so.*"
+FILES_libtsan-dev += "\
+    ${libdir}/libtsan.so \
+    ${libdir}/libtsan.la \
+"
+FILES_libtsan-staticdev += "${libdir}/libtsan.a"
+
+FILES_${PN} = "${libdir}/*.spec
${libdir}/gcc/${TARGET_SYS}/${BINV}/include/sanitizer/*.h"
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_4.8.bb
b/meta/recipes-devtools/gcc/gcc-sanitizers_4.8.bb
new file mode 100644
index 0000000..601f666
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers_4.8.bb
@@ -0,0 +1,2 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require gcc-sanitizers.inc
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_4.9.bb
b/meta/recipes-devtools/gcc/gcc-sanitizers_4.9.bb
new file mode 100644
index 0000000..601f666
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers_4.9.bb
@@ -0,0 +1,2 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require gcc-sanitizers.inc
-- 
2.1.0

