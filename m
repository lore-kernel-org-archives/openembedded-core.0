Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF7DD5AE71
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:01:59 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2906.1765620109751592633
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:01:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hdoW5WUt;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-29f2676bb21so16782795ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620109; x=1766224909; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZUZR7YbrQsz1L4fKpVvFesRvq1ezrLT1gUv7d3BHMpQ=;
        b=hdoW5WUtkYI+uvdjhpou5S8IAkJcIq/RllIahqyjlKfp71Ji8qTDFXjfVIXpLBf1ZA
         RjEPSPwBQlDe3Rq6LnfG/WaYnP0oTv4LuWER7REPIj+ZQfP/VnawBWp707vKDg3dbhEz
         y6UawfS1q84F/scXb47E9ZncTajsl+tapPTLdBZcRty+0/NVPHYGNWmixI5R/HlCP0Fq
         oRQvbzmh2DJuZqsc0qjNGqeeRFgvFNLTGC5NIW0692/l4Ch5ZqD2O+g8lRWj+eM62ebz
         AzTYfXIN1upDYg/6J/jqawXvslcOK8TAZyDGIpkyTW9Xc0wOQy6Gz5YPep6LAUFJbjWw
         383w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620109; x=1766224909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZUZR7YbrQsz1L4fKpVvFesRvq1ezrLT1gUv7d3BHMpQ=;
        b=NrQFyDyFUSqs56zELTqO15Pm02qegx7tnf8qYMW80NBsRFws+zCt4vmT1XF97Ux6uS
         2KC/aHOcPr7qTDDsRaVcQ5UK9ICwbriC1TrWEsHP/wi1CQEczBr+lSxiw4gAWtzJ7Ky7
         rhNBPAd3DbaF8DqTh9JAAvQAibpy1aCDSaLomFWyhl4YqLjvgjW1UHwMmmYdUSSTrcR1
         1kma1HBLlQiDJGTR+slzyWLODvI2kUYN5SpjVJGQUCY3let71Fn9MRzP3d/wgxCynTCu
         pVJ19xHrFCsSLJdK2K0XQy8hpaQW9gzjCCoJF8B+BCzHDHo+iOrbHwtTptmKGbcH7RS4
         BEyg==
X-Gm-Message-State: AOJu0YwAHyXDaQ/XikwHYh69HgimwF8b8SNryJlRlNplQ+VrFnpMdPCN
	dvIaCOUrmxgTYb+hLcuRhyE9ooKbTJ3IHl4syZejKFs1oDYbw2mX9U3LXEuDBYHs
X-Gm-Gg: AY/fxX7/dYQ03QpA5nIQmakWln6a8kiBeoTpcuZeXmzsnyWnjt1yPizkFaUaeey6FlC
	7y+TRptnEMNgPuY5Teu5rLzM8vEGLtJ8cNGsdHlnCcmBA0fJ4XQYHGwQPeGhMtml9W+3UUGY1rA
	RsTHuJipvNEQZxWId5Rr9D83FArmKNR8PB7NQXWlr5mCRRsN18d1wznJuV4JAj1rgUofoJF2eSD
	k3yUNzfr+7rImOB8iS+LamJn8HosZBbQoM1YRVXmUljePrWpn+5hEBngIYqiKSzAlmvI0XAKcn3
	dI/yES2x9tAisaV9lJ4LiZzqjNmVgw1ZkItq1qVXxL9X//LMAQJIirCixioWw7QJGidRVxDqq/A
	zuu3iw57jLUajNa4ihVu5gey78DiwrN3mFaRwEr5wm7osKjfD9DwNb0oDMPBZU7haIlp+vjyfiY
	g6d3zFaAdGDxOulVfgxeyejV9n
X-Google-Smtp-Source: AGHT+IEmhrQLvHhACMLs7OqfMm2OsizjdslNyHkjLwR96YF58NmBrirk63gTfom5GatzMJmsH0LLsA==
X-Received: by 2002:a17:903:2f82:b0:24e:3cf2:2453 with SMTP id d9443c01a7336-29f244d3b40mr43398935ad.61.1765620108889;
        Sat, 13 Dec 2025 02:01:48 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:01:48 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 47/67] compiler-rt-sanitizers: Adjust for compiler-rt changes
Date: Sat, 13 Dec 2025 15:29:11 +0530
Message-ID: <20251213095931.2571498-47-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:01:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227665

From: Khem Raj <raj.khem@gmail.com>

* ORC is not built with compiler-rt anymore, hence package it here
* Avoid duplication in specifying cmake sourcedir, use OECMAKE_SOURCEPATH
* Since RUNTIMES are bounded there is no need to specify build targets explicitly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 5be09b4e9d30b165325ed6e7432c5ec914a4408b)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../clang/compiler-rt-sanitizers_git.bb       | 23 ++++---------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
index 588320a140..53d0d63169 100644
--- a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
@@ -25,24 +25,20 @@ def get_compiler_rt_arch(bb, d):
 
 LIC_FILES_CHKSUM = "file://compiler-rt/LICENSE.TXT;md5=d846d1d65baf322d4c485d6ee54e877a"
 
-TUNE_CCARGS:remove = "-no-integrated-as"
-COMPILER_RT ??= "-rtlib=libgcc -unwindlib=libgcc"
-LIBCPLUSPLUS ??= "-stdlib=libstdc++"
-
 CC = "${CCACHE}${HOST_PREFIX}clang ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 CXX = "${CCACHE}${HOST_PREFIX}clang++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 BUILD_CC = "${CCACHE}${HOST_PREFIX}clang ${BUILD_CC_ARCH}"
 BUILD_CXX = "${CCACHE}${HOST_PREFIX}clang++ ${BUILD_CC_ARCH}$"
-CFLAGS += "${COMPILER_RT}"
-CXXFLAGS += "${COMPILER_RT} ${LIBCPLUSPLUS}"
 
 TOOLCHAIN = "clang"
 TOOLCHAIN_NATIVE = "clang"
 
 DEPENDS += "virtual/crypt compiler-rt"
 DEPENDS:append:class-native = " clang-native libxcrypt-native libcxx-native"
-DEPENDS:append:class-nativesdk = " virtual/cross-c++ clang-native clang-crosssdk-${SDK_SYS} nativesdk-libxcrypt nativesdk-gcc-runtime"
-DEPENDS:append:class-target = " virtual/cross-c++ ${MLPREFIX}clang-cross-${TARGET_ARCH} virtual/${MLPREFIX}libc gcc-runtime"
+DEPENDS:append:class-nativesdk = " virtual/cross-c++ clang-native clang-crosssdk-${SDK_SYS} nativesdk-libxcrypt"
+DEPENDS:append:class-nativesdk = " ${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "nativesdk-libcxx", "nativesdk-gcc-runtime", d)}"
+DEPENDS:append:class-target = " virtual/cross-c++ ${MLPREFIX}clang-cross-${TARGET_ARCH} virtual/${MLPREFIX}libc"
+DEPENDS:append:class-target = " ${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "libcxx", "gcc-runtime", d)}"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[crt] = "-DCOMPILER_RT_BUILD_CRT:BOOL=ON,-DCOMPILER_RT_BUILD_CRT:BOOL=OFF"
@@ -52,9 +48,7 @@ PACKAGECONFIG[ctx-profile] = "-DCOMPILER_RT_BUILD_CTX_PROFILE=ON,-DCOMPILER_RT_B
 
 CXXFLAGS:append:libc-musl = " -D_LARGEFILE64_SOURCE"
 
-OECMAKE_TARGET_COMPILE = "compiler-rt"
-OECMAKE_TARGET_INSTALL = "install-compiler-rt install-compiler-rt-headers"
-OECMAKE_SOURCEPATH = "${S}/llvm"
+OECMAKE_SOURCEPATH = "${S}/runtimes"
 
 INSTALL_VER ?= "${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}${VER_SUFFIX}"
 INSTALL_VER:class-native = "${@oe.utils.trim_version("${PV}", 1)}"
@@ -75,7 +69,6 @@ EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=RelWithDebInfo \
                   -DLLVM_LIBDIR_SUFFIX=${LLVM_LIBDIR_SUFFIX} \
                   -DLLVM_APPEND_VC_REV=OFF \
                   -DCOMPILER_RT_INSTALL_PATH=${nonarch_libdir}/clang/${INSTALL_VER} \
-                  -S ${S}/runtimes \
 "
 
 EXTRA_OECMAKE:append:class-native = "\
@@ -106,12 +99,6 @@ EXTRA_OECMAKE:append:class-nativesdk = "\
 
 EXTRA_OECMAKE:append:libc-musl = " -DLIBCXX_HAS_MUSL_LIBC=ON "
 
-do_install:append () {
-    # Already shipped with compile-rt Orc support
-    rm -rf ${D}${nonarch_libdir}/clang/${MAJOR_VER}/lib/linux/liborc_rt-*.a
-    rm -rf ${D}${nonarch_libdir}/clang/${MAJOR_VER}/include/orc/
-}
-
 FILES_SOLIBSDEV = ""
 FILES:${PN} += "${nonarch_libdir}/clang/${INSTALL_VER} \
 				${nonarch_libdir}/clang/${MAJOR_VER}/lib/linux/lib*${SOLIBSDEV} \

