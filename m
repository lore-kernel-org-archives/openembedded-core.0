Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id A737D785B1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 00:23:55 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id l64so198542pge.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 17:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=GUPJU6trY6Vv+lcdPPYS7KAETVnYUIvRAtqH6qM+GDQ=;
	b=NOqDDkmDRZHkoE8wlWXj2EQV+XMLZM/F89v+tKbaKbWCVMSI/+hGHceJTmUm2Q0aA1
	0APRnVlqg2OLUOU7Pgvk/h2stKL41G09UkO0BM+y1kRzPZUIzMdEag+VNBKtbe/sHu8C
	alm6Msn9eVM/819QRWAZpJdbRrW5MYAEy8o+7GQDgXNRSHU5xiBuGht7OFWyYhvC4a1+
	m2Y0B2zuoDoVRLD8B6af6he1A1lG6QLbSp4zSV53S+jZ522rSDBBjjDNsobEfFOKOKdm
	Iny7B41zarjYkPi10L7Q9YnQ+Ex4DglR7/VcOjH3W2hv5RW/LLKgGNj7iOQ2CcT+rKwJ
	tEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GUPJU6trY6Vv+lcdPPYS7KAETVnYUIvRAtqH6qM+GDQ=;
	b=gAmeAtYIXhc6GYAXI/GpRJp63BK9NP6VgPfTxq3l6Cg6shui9mZQG1L72JA0Q5vWj0
	WxLTwBeODbICGFUOKDBqEVn4TXdCEBI8BJGxHMliut+AyHpJX3h9TcWIqMgOdfOrFh2t
	mVkNy5m/ZYPtkGxbimOx9c4jDuFTEuQR1/SefOAEggGL+r0X/2v8CtTmVZi9RgZCJuqA
	Ua15OJIE0xzy+YcbNmA16etLGW4RJ/Ke1AyNL0VuncuzwbE/vNXGZ2emeIlpN2+gZF2c
	sbIE+QdIOJchynLgjc0bfFH/KO+quv3l28mJupv7zfG3+7CoIyzfs/8aRCxqZZALPqq8
	NatQ==
X-Gm-Message-State: AIVw111/Kawgt1EdYAVktAoIJZBUVCHGCJwft8sFNMqQJCR9x0i+QxUA
	zySJ8jEkFkiXszFY
X-Received: by 10.99.48.7 with SMTP id w7mr17832780pgw.244.1501547036781;
	Mon, 31 Jul 2017 17:23:56 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f6f])
	by smtp.gmail.com with ESMTPSA id 67sm8834034pgg.42.2017.07.31.17.23.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Jul 2017 17:23:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Jul 2017 17:23:47 -0700
Message-Id: <20170801002347.23800-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
Subject: [PATCH V2] mesa,llvm: Use native version of llvm-config
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
X-List-Received-Date: Tue, 01 Aug 2017 00:23:55 -0000

We have a variable YOCTO_ALTERNATE_EXE_PATH to point to
target sysroot, utilize this in mesa to use native version
of llvm-config to report values from target sysroot.

Its in a way similar to --sysroot option

strip out rpath since its absolute path and incorrect thusly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 12 +++++++-----
 meta/recipes-graphics/mesa/mesa.inc    | 13 +++++++------
 2 files changed, 14 insertions(+), 11 deletions(-)

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
index c9b67d4966..5c1957fdc6 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -14,8 +14,8 @@ LIC_FILES_CHKSUM = "file://docs/license.html;md5=725f991a1cc322aa7a0cd3a2016621c
 
 PE = "2"
 
-DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib"
-
+DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native"
+EXTRANATIVEPATH += "chrpath-native"
 PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl virtual/mesa"
 
 inherit autotools pkgconfig gettext distro_features_check
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
@@ -118,9 +118,10 @@ do_install_append () {
     rm -f ${D}${libdir}/egl/*.la
     rm -f ${D}${libdir}/gallium-pipe/*.la
     rm -f ${D}${libdir}/gbm/*.la
-    
+
     # it was packaged in libdricore9.1.3-1 and preventing upgrades when debian.bbclass was used 
     rm -f ${D}${sysconfdir}/drirc
+    chrpath --delete ${D}${libdir}/dri/*_dri.so
 }
 
 # For the packages that make up the OpenGL interfaces, inject variables so that
-- 
2.13.3


