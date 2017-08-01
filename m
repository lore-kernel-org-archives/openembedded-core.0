Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 418CF7846A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 00:14:35 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id l64so178939pge.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 17:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9AyTrqArk/Sn+fG6whBKdhxH5+HTQR845Kls3NQaO9g=;
	b=Uwg0adsxPGow9KSICYBtEMajScUTPaFua0byeKQfGm/GnfLVU4HFZ8x4WQS5rw6KNb
	L/1wrqPF3pkN0GZbNE7ep0KsucLuA9ELwpSkDbl0AIDJGFDVxRoiYRNOC0vAHMMpk7ie
	SJzSdFIiuV9n/jt6GgMPG2Dr6FWbUvse5l4GfAzDXdTLbUCpb0gtW14IPN01MeGHfAdf
	//+B6SiH8kuAmw6HxZoRHjTtIG/XQTETJYkz+l4R2hqtPIbKyaJhsnyxUMhAYXNjUjCO
	///jGutmxduzRbSxoynYeiQXTeEMSYNMJ7KZTk8axAiVSWdWRfI+cetpufFCYDRytOQ1
	3N3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9AyTrqArk/Sn+fG6whBKdhxH5+HTQR845Kls3NQaO9g=;
	b=fJBr0jTjfQ2/45vyX2oZ3n8qMEwTAI12CliUPCRcHwXfxUZoorNA+KARdJ3tUjetrY
	6XUCQXEb5intNfheU0bdlPD0IS7cxpSOH4GsZ8XN1twKGvp+rLBD9JCTvvDu1brAVJjH
	S5hzVhAHQH4V6ZB6kjxvA/JAY0lVdtBdQf5BI5ngFk2IhOwb1nrIZhSmy8Ij6h2/ENuv
	UwyjRS40bnQNMvzLepPA/ZrRX0NRvNmk56SPeH2DT69KzQJeKsfoYfWPs2XjuPCr4z10
	blpfM1Hj/mmsac8ubxH+t7uaVkvsz3i1ZSPaseKv/tWPT5A7yTBfIe/By6H8uKDkPokj
	dF4Q==
X-Gm-Message-State: AIVw112OV9lxTabIslYuT9TwDWW8FCxE3o1D0FtxEzK52Mb8BP+zxfIN
	llZINV3V+yNx3qFp
X-Received: by 10.101.77.6 with SMTP id i6mr17076073pgt.181.1501546476348;
	Mon, 31 Jul 2017 17:14:36 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f6f])
	by smtp.gmail.com with ESMTPSA id
	m76sm16384747pfk.11.2017.07.31.17.14.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Jul 2017 17:14:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Jul 2017 17:14:25 -0700
Message-Id: <20170801001425.14860-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
Subject: [PATCH] mesa,llvm: Use native version of llvm-config
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
X-List-Received-Date: Tue, 01 Aug 2017 00:14:35 -0000

We have a variable YOCTO_ALTERNATE_EXE_PATH to point to
target sysroot, utilize this in mesa to use native version
of llvm-config to report values from target sysroot.

Its in a way similar to --sysroot option

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 12 +++++++-----
 meta/recipes-graphics/mesa/mesa.inc    |  6 +++---
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 5dcb508c23..5e754e45dc 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -87,12 +87,12 @@ do_compile() {
 }
 
 do_compile_class-native() {
-	NINJA_STATUS="[%p] " ninja -v ${PARALLEL_MAKE} llvm-tblgen
+	NINJA_STATUS="[%p] " ninja -v ${PARALLEL_MAKE} llvm-config llvm-tblgen
 }
 
 do_install() {
 	NINJA_STATUS="[%p] " DESTDIR=${LLVM_INSTALL_DIR} ninja -v install
-	install -D -m 0755 ${B}/NATIVE/bin/llvm-config ${D}${libdir}/${LLVM_DIR}/llvm-config-host
+	install -D -m 0755 ${B}/bin/llvm-config ${D}${libdir}/${LLVM_DIR}/llvm-config
 
 	install -d ${D}${bindir}/${LLVM_DIR}
 	cp -r ${LLVM_INSTALL_DIR}${bindir}/* ${D}${bindir}/${LLVM_DIR}/
@@ -121,7 +121,9 @@ do_install() {
 	rm -rf ${D}${libdir}/${LLVM_DIR}/libLTO.so
 }
 do_install_class-native() {
-	install -D -m 0755 ${B}/bin/llvm-tblgen ${D}${bindir}/llvm-tblgen
+	install -D -m 0755 ${B}/bin/llvm-tblgen ${D}${bindir}/llvm-tblgen-5.0
+	install -D -m 0755 ${B}/bin/llvm-config ${D}${bindir}/llvm-config-5.0
+	install -D -m 0755 ${B}/lib/libLLVM-5.0.so ${D}${libdir}/libLLVM-5.0.so
 }
 
 PACKAGES += "${PN}-bugpointpasses ${PN}-llvmhello"
@@ -134,14 +136,14 @@ FILES_${PN}-dbg = " \
     ${libdir}/${LLVM_DIR}/.debug/BugpointPasses.so \
     ${libdir}/${LLVM_DIR}/.debug/LLVMHello.so \
     ${libdir}/${LLVM_DIR}/.debug/libLTO.so* \
-    ${libdir}/${LLVM_DIR}/.debug/llvm-config-host \
+    ${libdir}/${LLVM_DIR}/.debug/llvm-config \
     /usr/src/debug \
 "
 
 FILES_${PN}-dev = " \
     ${bindir}/${LLVM_DIR} \
     ${includedir}/${LLVM_DIR} \
-    ${libdir}/${LLVM_DIR}/llvm-config-host \
+    ${libdir}/${LLVM_DIR}/llvm-config \
 "
 
 RRECOMMENDS_${PN}-dev += "${PN}-bugpointpasses ${PN}-llvmhello"
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index c9b67d4966..b0f9410e36 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -25,8 +25,8 @@ REQUIRED_DISTRO_FEATURES = "opengl"
 PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)} \
                ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'drm', '', d)}"
 
-export LLVM_CONFIG = "${STAGING_LIBDIR}/llvm${MESA_LLVM_RELEASE}/llvm-config-host"
-
+export LLVM_CONFIG = "${STAGING_BINDIR_NATIVE}/llvm-config-${MESA_LLVM_RELEASE}"
+export YOCTO_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR}/llvm${MESA_LLVM_RELEASE}/llvm-config"
 EXTRA_OECONF = "--enable-shared-glapi \
                 --disable-opencl \
                 --with-llvm-prefix=${STAGING_LIBDIR}/llvm${MESA_LLVM_RELEASE} \
@@ -75,7 +75,7 @@ GALLIUMDRIVERS_append_x86-64 = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-l
 # keep --with-gallium-drivers separate, because when only one of gallium versions is enabled, other 2 were adding --without-gallium-drivers
 PACKAGECONFIG[gallium]      = "--enable-texture-float --with-gallium-drivers=${GALLIUMDRIVERS}, --without-gallium-drivers"
 MESA_LLVM_RELEASE ?= "5.0"
-PACKAGECONFIG[gallium-llvm] = "--enable-llvm --enable-llvm-shared-libs, --disable-llvm, llvm${MESA_LLVM_RELEASE} \
+PACKAGECONFIG[gallium-llvm] = "--enable-llvm --enable-llvm-shared-libs, --disable-llvm, llvm${MESA_LLVM_RELEASE} llvm-native \
                                ${@'elfutils' if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
 export WANT_LLVM_RELEASE = "${MESA_LLVM_RELEASE}"
 PACKAGECONFIG[xa]  = "--enable-xa, --disable-xa"
-- 
2.13.3


