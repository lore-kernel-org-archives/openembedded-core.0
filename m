Return-Path: <danismostlikely@gmail.com>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3D1DD7146D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 04:00:29 +0000 (UTC)
Received: by mail-qc0-f169.google.com with SMTP id r5so3478398qcx.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Sep 2014 21:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=rZl3ptO/Neqqvoa3F2Pkrgxkayb895tZ4ln2A6xBD1M=;
	b=MAUKmcuYTYJtrjWILUEqe2e79cs8fXCC/5rd6gMkqg5V9o+20HYKPr23g1f1DmJm6R
	pW23+09wD2A40FoeRa3gP/mLoF8Cn915xtqMvady8Cs9/8DbsmrnNh0v4iAeqL7Y2xMo
	uF5U5xzxoHIKzb2izQ3Rzj6dF6h+lctMp+0xlt08hd3x3zueYM/yzQd1He7jwQ9AJ0+l
	m15AABBI5kIODaE1jcL1UNeKPlHIGTKcS81wqDUreJZzgu8DdwhODdUtjMD6PJRfWng5
	5kEqPvlU0fvgMINKRV9olWCZYor7JF4XD/dJvDCtXe1JIT3zzzdinecEXTrNLHWHgNXZ
	tG9g==
MIME-Version: 1.0
X-Received: by 10.224.128.9 with SMTP id i9mr33027142qas.50.1410753630156;
	Sun, 14 Sep 2014 21:00:30 -0700 (PDT)
Received: by 10.96.138.101 with HTTP; Sun, 14 Sep 2014 21:00:30 -0700 (PDT)
Date: Sun, 14 Sep 2014 22:00:30 -0600
Message-ID: <CACS+7ZTGK6duNi6GQ6tqhmrk3_bNnEbSj=LeEzr60vRP3Dw=OQ@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH v3] libsanitizer: Enable GCC sanitizers
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
X-List-Received-Date: Mon, 15 Sep 2014 04:00:31 -0000
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
 meta/conf/distro/include/tcmode-default.inc   |  1 +
 meta/recipes-devtools/gcc/libsanitizer.inc    | 49 +++++++++++++++++++++++++++
 meta/recipes-devtools/gcc/libsanitizer_4.8.bb |  3 ++
 meta/recipes-devtools/gcc/libsanitizer_4.9.bb |  3 ++
 4 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/libsanitizer.inc
 create mode 100644 meta/recipes-devtools/gcc/libsanitizer_4.8.bb
 create mode 100644 meta/recipes-devtools/gcc/libsanitizer_4.9.bb

diff --git a/meta/conf/distro/include/tcmode-default.inc
b/meta/conf/distro/include/tcmode-default.inc
index 6c0f102..3eed903 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -35,6 +35,7 @@ PREFERRED_VERSION_gcc-cross-initial-${TARGET_ARCH}
?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-crosssdk-${SDK_ARCH} ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_gcc-crosssdk-initial-${SDK_ARCH} ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=
"${GCCVERSION}"
+PREFERRED_VERSION_libsanitizer ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-runtime ?= "${GCCVERSION}"
 PREFERRED_VERSION_nativesdk-gcc-runtime ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_libgcc ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/gcc/libsanitizer.inc
b/meta/recipes-devtools/gcc/libsanitizer.inc
new file mode 100644
index 0000000..6d5f53e
--- /dev/null
+++ b/meta/recipes-devtools/gcc/libsanitizer.inc
@@ -0,0 +1,49 @@
+require gcc-configure-common.inc
+
+EXTRA_OECONF_PATHS = "\
+    --with-sysroot=${STAGING_DIR_TARGET} \
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
+DEPENDS = "gcc-runtime"
+
+FILES_${PN}-dev += "\
+    ${libdir}/*preinit.o \
+    ${libdir}/*.spec \
+"
diff --git a/meta/recipes-devtools/gcc/libsanitizer_4.8.bb
b/meta/recipes-devtools/gcc/libsanitizer_4.8.bb
new file mode 100644
index 0000000..f3ced76
--- /dev/null
+++ b/meta/recipes-devtools/gcc/libsanitizer_4.8.bb
@@ -0,0 +1,3 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require libsanitizer.inc
+
diff --git a/meta/recipes-devtools/gcc/libsanitizer_4.9.bb
b/meta/recipes-devtools/gcc/libsanitizer_4.9.bb
new file mode 100644
index 0000000..f3ced76
--- /dev/null
+++ b/meta/recipes-devtools/gcc/libsanitizer_4.9.bb
@@ -0,0 +1,3 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require libsanitizer.inc
+
-- 
2.1.0

