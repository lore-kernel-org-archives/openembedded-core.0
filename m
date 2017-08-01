Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f53.google.com (mail-pg0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2718077D30
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 13:55:49 +0000 (UTC)
Received: by mail-pg0-f53.google.com with SMTP id v77so2616267pgb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Aug 2017 06:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/6EW+drtb3ZPIHkR5TwyV8SUJkmGTZICxys8et04KBs=;
	b=lnHkuXnD3d6cNnM49esA9RgGOFiV9eH2xCDsvoav4qTZKfuaFIb8iZ2d2ZZClkmPiB
	L2xL/CyJLrv3wOqsG2w8M5ZYsfsks1vgcRsyMg1R64kh4U1E4zsw2RrWZ8hV2sVbD5tg
	K4kHAT0r2OwupoNtURXZsuiCmoE5DBZbYSE5yUfzl7Xq4xNWsDvUHmjLn1zlxCm+J8tY
	rQUAK5aClnPsTAWMWEw3JXb+ZLzSDR6WKUq7hj2iEVBTzmwTFeJSaoP6gWDphbs0Q2Wo
	996osNpCCJwJ2s1s6ykb4xVyZ4ic2914lIoUL3F4LIiqyNlN+log35qaXghAE+TVnrYq
	jIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/6EW+drtb3ZPIHkR5TwyV8SUJkmGTZICxys8et04KBs=;
	b=hwXtkOKGlMk04TejLKCMl5sddTc3QEWlrN7hmKzP6hCNlotq8UJ84U3T7gaCsZmGxU
	0ied01LyouZG5Dxltlc7lHI9HwSK2mHBZJ3YEcMc5KDw9++6VRj8Dfk1K/iL+mJkNJ66
	7d4SaO8crKikvmKHNrnbsRrx0VoamAvSIfVEvrD9NPq8gIUVD3GBpLw+3yhlfD+ltk1E
	oyXUObODYP/EVCvFXFqcO/K+GEI3qj09OtEWYivJ98lMipGMpDBB/A2oyMSQCn1xqMLJ
	IYagzlnFX2RxwyXmTSdHWX1XNCmf0i1uYsprLWsOFcxgTiPZ2c+wlBHlNM6ae1yv3FH8
	fz5Q==
X-Gm-Message-State: AIVw110Og4+pXNYScM6EiHwdvidQmR8AivgrPBRv5e8ZL0431Rbs2kDP
	zb5RI73Wh0lFMWMY
X-Received: by 10.98.196.81 with SMTP id y78mr18980522pff.327.1501595751074;
	Tue, 01 Aug 2017 06:55:51 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f6f])
	by smtp.gmail.com with ESMTPSA id
	o29sm57189986pfa.60.2017.08.01.06.55.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Aug 2017 06:55:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Aug 2017 06:55:30 -0700
Message-Id: <20170801135530.33531-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170801135530.33531-1-raj.khem@gmail.com>
References: <20170801135530.33531-1-raj.khem@gmail.com>
Subject: [PATCH V2 4/4] mesa, llvm: Use native version of llvm-config
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
X-List-Received-Date: Tue, 01 Aug 2017 13:55:50 -0000

We have a variable YOCTO_ALTERNATE_EXE_PATH to point to
target sysroot, utilize this in mesa to use native version
of llvm-config to report values from target sysroot.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 16 +++++++++-------
 meta/recipes-graphics/mesa/mesa.inc    |  4 ++--
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 5dcb508c23..722bc53aa1 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -67,12 +67,12 @@ EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
 
 EXTRA_OECMAKE_append_class-target = "\
                   -DCMAKE_CROSSCOMPILING:BOOL=ON \
-                  -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen \
+                  -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen${PV} \
                  "
 
 EXTRA_OECMAKE_append_class-nativesdk = "\
                   -DCMAKE_CROSSCOMPILING:BOOL=ON \
-                  -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen \
+                  -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen${PV} \
                  "
 
 do_configure_prepend() {
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
+	install -D -m 0755 ${B}/bin/llvm-tblgen ${D}${bindir}/llvm-tblgen${PV}
+	install -D -m 0755 ${B}/bin/llvm-config ${D}${bindir}/llvm-config${PV}
+	install -D -m 0755 ${B}/lib/libLLVM-${PV}.so ${D}${libdir}/libLLVM-${PV}.so
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
index e14372775b..a26858df85 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -25,8 +25,8 @@ REQUIRED_DISTRO_FEATURES = "opengl"
 PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)} \
                ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'drm', '', d)}"
 
-export LLVM_CONFIG = "${STAGING_LIBDIR}/llvm${MESA_LLVM_RELEASE}/llvm-config-host"
-
+export LLVM_CONFIG = "${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE}"
+export YOCTO_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR}/llvm${MESA_LLVM_RELEASE}/llvm-config"
 EXTRA_OECONF = "--enable-shared-glapi \
                 --disable-opencl \
                 --with-llvm-prefix=${STAGING_LIBDIR}/llvm${MESA_LLVM_RELEASE} \
-- 
2.13.3


