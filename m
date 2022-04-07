Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA2CC47080
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:08 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web09.1082.1649350845525147162
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 10:00:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XLUlRgjO;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id l7so6757712ejn.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 10:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gclb2izCt+wLb4mTlBJfgu8GkO92hWfHBfbgXQ20lUE=;
        b=XLUlRgjOlOsVHsRaD3UFHqxRO647OkD4DQ/yhzAQ9z3u2U1BIABQ6oEMz0Og/f82+X
         2YpqMr6yVhPk1dLBXTSH/Aciex+8lc2/olnT4lL4LX89PGdhu0y6QULmOjzRjxBeWlTm
         iOLcPjQdmWXE4M3RzgIFFSoh5Byi3aZudidmHDMQ0yAkHIAifZXRx4d2VhcGB+UH8ftx
         7Bw2/NVCZIgdEfSiBQqQhQhPJSeGpG/3q/ubY9TqfprqfrTAAiPs3aQnPnib9l0W+ibs
         qCmTVqKtj48IzRsW4Au21JkKoVAOEMGXG2BEbbACSXT77ePAMYL88tWPZHrZhWNhi2R3
         0GhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gclb2izCt+wLb4mTlBJfgu8GkO92hWfHBfbgXQ20lUE=;
        b=aAdHmsGu2qc64HUZpvF3PJ1hhTsG1YGX+GTxqW0stgAxhEFVySPfzpy9b5jYtv2E94
         Kf4rCQPExTkAgfUkenNZbQYUuZgDZCEd8a46/vT2s4XkW9ACZQIY9vxGnXpldq+W22lW
         c9WgiG4Nx8AWQVRKa45QPgw1pODal2FFbZD9jRXA5NDm4YBd09bC/wed2502sazsYXhq
         QDknpNfcuN/dLIDUdfjqagDOlmQpnH+oPzX9jFVN+aPFs+/jzlMNUGhjJl8Bu+CKHLGu
         cbEU0OIzNGw43L67FHtrOyONyWzH0AaqJbMJyyY4H4bh5rx5wAEMEKOUhBY0H0lOnTMs
         4PVg==
X-Gm-Message-State: AOAM532aKWwXxASVE7F9f2JB8bskT+LkiR/il+kD7KHUylFhuFWGdr7+
	myipWQzMkMvu5AjHt06W/93nWKPp3ac=
X-Google-Smtp-Source: 
 ABdhPJw5+hn6ExUBSKoEssnVaZFSU1YUjILtpXfGhikMKqX2ibG0XFVBeXY+kBThNJZXxwwRNoRg6g==
X-Received: by 2002:a17:907:60cc:b0:6da:9616:ecec with SMTP id
 hv12-20020a17090760cc00b006da9616ececmr15047648ejc.298.1649350842355;
        Thu, 07 Apr 2022 10:00:42 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gt34-20020a1709072da200b006df6bb3db69sm7796879ejc.158.2022.04.07.10.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 10:00:41 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/17] llvm: use default install paths
Date: Thu,  7 Apr 2022 19:00:15 +0200
Message-Id: <20220407170029.3500874-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220407170029.3500874-1-alex@linutronix.de>
References: <20220407170029.3500874-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 20:36:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164119

There was a very brittle sed hack against cpp source code
that allowed installing multiple llvm versions into the same
target/sysroot. Patching with sed is prone to silent
regressions as it can change both too little and too much,
and it indeed it broke with llvm 14. It's also difficult to tell
what the 'right' change should look like.

If this feature is actually needed somewhere, please do it properly:
proper patch and upstream first.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 58 +++++++-------------------
 meta/recipes-graphics/mesa/mesa.inc    |  2 +-
 2 files changed, 17 insertions(+), 43 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 13f7fb763e..8f7540fd70 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -24,7 +24,6 @@ PV = "14.0.0"
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
 LLVM_RELEASE = "${PV}"
-LLVM_DIR = "llvm${LLVM_RELEASE}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
 SRCREV = "329fda39c507e8740978d10458451dcdb21563be"
@@ -91,13 +90,6 @@ EXTRA_OECMAKE:append:class-nativesdk = "\
                   -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
                  "
 
-do_configure:prepend() {
-# Fix paths in llvm-config
-	sed -i "s|sys::path::parent_path(CurrentPath))\.str()|sys::path::parent_path(sys::path::parent_path(CurrentPath))).str()|g" ${S}/tools/llvm-config/llvm-config.cpp
-	sed -ri "s#/(bin|include|lib)(/?\")#/\1/${LLVM_DIR}\2#g" ${S}/tools/llvm-config/llvm-config.cpp
-	sed -ri "s#lib/${LLVM_DIR}#${baselib}/${LLVM_DIR}#g" ${S}/tools/llvm-config/llvm-config.cpp
-}
-
 # patch out build host paths for reproducibility
 do_compile:prepend:class-target() {
         sed -i -e "s,${WORKDIR},,g" ${B}/tools/llvm-config/BuildVariables.inc
@@ -112,34 +104,17 @@ do_compile:class-native() {
 }
 
 do_install() {
-	DESTDIR=${LLVM_INSTALL_DIR} ninja -v install
-	install -D -m 0755 ${B}/bin/llvm-config ${D}${libdir}/${LLVM_DIR}/llvm-config
-
-	install -d ${D}${bindir}/${LLVM_DIR}
-	cp -r ${LLVM_INSTALL_DIR}${bindir}/* ${D}${bindir}/${LLVM_DIR}/
-
-	install -d ${D}${includedir}/${LLVM_DIR}
-	cp -r ${LLVM_INSTALL_DIR}${includedir}/* ${D}${includedir}/${LLVM_DIR}/
-
-	install -d ${D}${libdir}/${LLVM_DIR}
-
-	# The LLVM sources have "/lib" embedded and so we cannot completely rely on the ${libdir} variable
-	if [ -d ${LLVM_INSTALL_DIR}${libdir}/ ]; then
-		cp -r ${LLVM_INSTALL_DIR}${libdir}/* ${D}${libdir}/${LLVM_DIR}/
-	elif [ -d ${LLVM_INSTALL_DIR}${prefix}/lib ]; then
-		cp -r ${LLVM_INSTALL_DIR}${prefix}/lib/* ${D}${libdir}/${LLVM_DIR}/
-	elif [ -d ${LLVM_INSTALL_DIR}${prefix}/lib64 ]; then
-		cp -r ${LLVM_INSTALL_DIR}${prefix}/lib64/* ${D}${libdir}/${LLVM_DIR}/
-	fi
+	DESTDIR=${D} ninja -v install
 
-	# Remove unnecessary cmake files
-	rm -rf ${D}${libdir}/${LLVM_DIR}/cmake
+        # llvm harcodes usr/lib as install path, so this corrects it to actual libdir
+        mv -T -n ${D}/${prefix}/lib ${D}/${libdir}
 
-	ln -s ${LLVM_DIR}/libLLVM-${MAJOR_VERSION}${SOLIBSDEV} ${D}${libdir}/libLLVM-${MAJOR_VERSION}${SOLIBSDEV}
+        # Remove opt-viewer: https://llvm.org/docs/Remarks.html
+        rm -rf ${D}${datadir}/opt-viewer
+        rmdir ${D}${datadir}
 
-	# We'll have to delete the libLLVM.so due to multiple reasons...
-	rm -rf ${D}${libdir}/${LLVM_DIR}/libLLVM.so
-	rm -rf ${D}${libdir}/${LLVM_DIR}/libLTO.so
+        # reproducibility
+        sed -i -e 's,${WORKDIR},,g' ${D}/${libdir}/cmake/llvm/LLVMConfig.cmake
 }
 
 do_install:class-native() {
@@ -152,34 +127,33 @@ PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm ${PN}-liboptrema
 RRECOMMENDS:${PN}-dev += "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-liboptremarks"
 
 FILES:${PN}-bugpointpasses = "\
-    ${libdir}/${LLVM_DIR}/BugpointPasses.so \
+    ${libdir}/BugpointPasses.so \
 "
 
 FILES:${PN}-libllvm = "\
-    ${libdir}/${LLVM_DIR}/libLLVM-${MAJOR_VERSION}.so \
     ${libdir}/libLLVM-${MAJOR_VERSION}.so \
 "
 
 FILES:${PN}-liblto += "\
-    ${libdir}/${LLVM_DIR}/libLTO.so.* \
+    ${libdir}/libLTO.so.* \
 "
 
 FILES:${PN}-liboptremarks += "\
-    ${libdir}/${LLVM_DIR}/libRemarks.so.* \
+    ${libdir}/libRemarks.so.* \
 "
 
 FILES:${PN}-llvmhello = "\
-    ${libdir}/${LLVM_DIR}/LLVMHello.so \
+    ${libdir}/LLVMHello.so \
 "
 
 FILES:${PN}-dev += " \
-    ${libdir}/${LLVM_DIR}/llvm-config \
-    ${libdir}/${LLVM_DIR}/libRemarks.so \
-    ${libdir}/${LLVM_DIR}/libLLVM-${PV}.so \
+    ${libdir}/llvm-config \
+    ${libdir}/libRemarks.so \
+    ${libdir}/libLLVM-${PV}.so \
 "
 
 FILES:${PN}-staticdev += "\
-    ${libdir}/${LLVM_DIR}/*.a \
+    ${libdir}/*.a \
 "
 
 INSANE_SKIP:${PN}-libllvm += "dev-so"
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index e8c07a4563..21fa1a6a9e 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -52,7 +52,7 @@ ANY_OF_DISTRO_FEATURES:class-target = "opengl vulkan"
 
 PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)}"
 
-export YOCTO_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR}/llvm${MESA_LLVM_RELEASE}/llvm-config"
+export YOCTO_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR}/llvm-config"
 export YOCTO_ALTERNATE_MULTILIB_NAME = "${base_libdir}"
 export LLVM_CONFIG = "${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE}"
 export WANT_LLVM_RELEASE = "${MESA_LLVM_RELEASE}"
-- 
2.30.2


