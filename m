Return-Path: <danismostlikely@gmail.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id F423D65E38
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Sep 2014 03:06:55 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id q108so1698639qgd.40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 20:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=DhAOT5bIVgsNURbzxS1WReqQTQZrQB8mcVaQJclWHhE=;
	b=B+G3qc/j1cABqbgfXko2UayliOFnAMZ0LRhIG/uPfvvkToirMjOYxZ4PrxejtW85ub
	htc2so0zbGJjMnj3mt6jHn0B4Vi/3NhN6nhjnw3w1pcnDMCgj8bURhnOoeo3A0997uaZ
	2N3/676k3TFsHRzVFOPBuePEqDuJN7CI4jH5Xm5mehZNm5k5BPNSD5zaH6fti32ej+D5
	hBVZkYIoKArsGaYci/lIKKZPSrHqE2JNlCCZLIEqx/aJqJrcbzqx5vbvDlnzkh0Ny3JY
	eQZBotaafyVWSLKi7sD6SCSXu3oDMyDoh37rWD7z/tGzs/Ay6nsmkWVheowwb6YK0hmB
	8RKw==
MIME-Version: 1.0
X-Received: by 10.140.82.213 with SMTP id h79mr10945773qgd.51.1410577616644;
	Fri, 12 Sep 2014 20:06:56 -0700 (PDT)
Received: by 10.96.138.101 with HTTP; Fri, 12 Sep 2014 20:06:56 -0700 (PDT)
Date: Fri, 12 Sep 2014 21:06:56 -0600
Message-ID: <CACS+7ZTLWpoBXXezLOH5k=i9-x4869mrM35ZfhY5=Wsj2d=c7Q@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [Patch v2] libsanitizer: Enable GCC sanitizers
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
X-List-Received-Date: Sat, 13 Sep 2014 03:07:02 -0000
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
 meta/recipes-devtools/gcc/libsanitizer.inc    | 55 +++++++++++++++++++++++++++
 meta/recipes-devtools/gcc/libsanitizer_4.8.bb |  3 ++
 meta/recipes-devtools/gcc/libsanitizer_4.9.bb |  3 ++
 4 files changed, 62 insertions(+)
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
index 0000000..8ff2a0f
--- /dev/null
+++ b/meta/recipes-devtools/gcc/libsanitizer.inc
@@ -0,0 +1,55 @@
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
+
+python __anonymous () {
+    arch = d.getVar("TRANSLATED_TARGET_ARCH", True)
+    if arch not in { "i586", "i686", "x86_64", "arm" }:
+        raise bb.parse.SkipPackage("libsanitizer only works on Intel and ARM.")
+}
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

