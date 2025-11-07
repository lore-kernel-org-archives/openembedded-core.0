Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0540FCCFA1E
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 23:06:34 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1147.1762556785754628227
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 15:06:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kxQBeEa4;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3418ac74bffso956783a91.1
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 15:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762556785; x=1763161585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7Yr2Ny2IsJOdkieFEcwVBP8i78piakz/2a9dXQ41Ek=;
        b=kxQBeEa4PVqvsEruK+MalOuxyH00lDupdJrOfzxnpiWoqm3+OtddjuXU3sHyQQXIma
         JGeMyvnh94LcrYity+JHyrz+cA1tEIreUzRK3s22y1yg7rQGzyHcAiY9z2gprZdtkMo7
         J1VWKhiG8rsbs2AGacvjKiMd9l/p2uDjKqrN7nz7ZzYziUfuhqra5h26z+JsaHNRRX+G
         Fjn7DfjnbyPpgw0JzJfUh4RUbmI99QFxKvHp0/r3MFuaWwwKYH0g3a4jVwE2ksueDE1u
         v/ycfXe7NvuIdFCgAaJMYWQRY6BNarrBVBcHC9e3ERT6LQx3Wr0iemADKZKBH0VzvF3P
         NJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762556785; x=1763161585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B7Yr2Ny2IsJOdkieFEcwVBP8i78piakz/2a9dXQ41Ek=;
        b=URonwBfTOtViD8YHwtmR92CKpbklZ04hipBKnwkbUllyImmpaVnm5wkRIumfh3kpBP
         kZyNebSrcRBuPSdAxXPpXMW5AHQ8HEKdt1wVFhiPMfXyGilmXYfEGUbmEsoPYkH8AAO8
         LwdwwNP6Moqbl2pCPM90PEu5zOfhKQOolD5xiWSUQWvjqv7RJJBf2cVHU4YHSg4ooRDq
         f/x2emZxhcX+EI7PGjulvalx/Z8vHyeYy7yA48lFNMo0ZIzwZukLca+xTfQD1rIcBAfH
         jF6w+VeKbM797WRoeWoRbUKfxyDW4hL6GW/vU+C/LGF1y6VwWxAXuYoW1m/huUe7BE34
         S5tg==
X-Gm-Message-State: AOJu0YzGvNbyWKXn4klPqKBY29ZKoAB2wyYxMYEoOBuhocvsPa3uBvHq
	R/2iK1JUdSiB/CxCErZM+IiN5naW32IsCrSoqk8mXOkXNb571Jq4AgmWXvbD8RmoaKI=
X-Gm-Gg: ASbGncvctCWsRhxTnkiHuhCAr3nJ7PpG1quy+cZXgs0sfaQ1PdEXHQYSClMmZlr8zLD
	+0YxS1x/ahY03tRBZgjeZna1lkHMNiAHSUoeka9opBNhHU2q+ldFpaWcF1zVRqSYXfabhQL3/qb
	hbt53rrd5T6+wHBJKrS8+++SpS1OpyfS0tZAFxjVEoieppi4/K3YehuSQzAwUv/WO8E8LTCqnoK
	ovFbxaQwYnMbAp0SFwivq4bXJNJRxHTJPNM5G7G8W3K/KwI2tkmmb5vUkcIUwOooXvWPc/g7ykG
	13x77dcHZf1TJV73/6YhsEdtvC8o3A9kVpYVDsBBS+djBVym0R3UaSbcpnDMG/oOfzVfR/Vy+FQ
	EHKCxfD9DzBi7P5pTSPD2F2nizqdfWDx7SRu9WWo5R5bsyXQTGVZ/vGUKtDi+vmZD+zaFlX6HrE
	a2xYvhgY6FayJn2wqWb+1WF9oqaImS+sxa9ngcXcxKqzPiVMb3RBo1Oe13nnYKww==
X-Google-Smtp-Source: AGHT+IFc2hAL6d9dNlJJOH49a9ML62LKZ/j9DyyzCzndFUEnO6u2e0PZLUAMZTuX2Kk+78eIHf4otQ==
X-Received: by 2002:a17:90b:3c0e:b0:33f:ebdd:9961 with SMTP id 98e67ed59e1d1-3436ccfe1e9mr663171a91.28.1762556784816;
        Fri, 07 Nov 2025 15:06:24 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a69b626csm10526282a91.19.2025.11.07.15.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 15:06:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 5/6] compiler-rt-sanitizers: Adjust for compiler-rt changes
Date: Fri,  7 Nov 2025 15:06:16 -0800
Message-ID: <20251107230617.364804-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251107230617.364804-1-raj.khem@gmail.com>
References: <20251107230617.364804-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 23:06:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226072

* ORC is not built with compiler-rt anymore, hence package it here
* Avoid duplication in specifying cmake sourcedir, use OECMAKE_SOURCEPATH
* Since RUNTIMES are bounded there is no need to specify build targets explicitly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../clang/compiler-rt-sanitizers_git.bb       | 23 ++++---------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
index 588320a1407..53d0d63169c 100644
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

