Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F901C83030
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 03:13:54 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.4644.1751598832190361543
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jul 2025 20:13:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E8uONzM1;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2363616a1a6so5280705ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 20:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751598831; x=1752203631; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w4ar+PRWj6yhs5nuFujnIPf5G+8IkpXTQLOWxTgBBY0=;
        b=E8uONzM1XG6nloqgim4d2+htweZbokUMOsUCFl+E4twQDi9XsD3lqmHX42IibZJQZ6
         ghD15WE8/nl9dXgKUhA+vfBzq3MLf9YOQCaLJQ9hDKIFLoLj87u1n94z460rtZHNUZjN
         8haCl94XdjqDQIkNhEUcbLtpjwa8ThPHbOFeBEtJZM0ThueYksPoWJNjf12jv4S+HShP
         ixwSgyi3ONzbyGok+XFC9T9HbeHQH+Ldto92c2+PkNsVlHzB+Sz/l8mH6W8ekcyQX8nJ
         79LQgHKgqxY48oLRmc/gQ5yx6VV5JDUXvffpxAjcNxoAw0y1HsG0+fKsSk96Tl+FdfKH
         seCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751598831; x=1752203631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w4ar+PRWj6yhs5nuFujnIPf5G+8IkpXTQLOWxTgBBY0=;
        b=R+P/MKR9nPx/r6nHqNM4OFrley6BETDRDwjbjUfdAkQwE3oFh9s5XYFKwIScF+pia0
         AP0V3rNgS/ZecT/rrmNW2P5GnXhCUn/cHq4bXIGRV3jDZBo0+nOizYf36C4cZiclyijJ
         6ttnsVf37khaBMJKisexS7UeORLpii0gAkSY+B1xCO/47OrW8wXWGdTEx63n5ThbAy99
         D/5yhEa/NuCFLtMS6/k+BBppBdSWEOs5rb1ywDL1DCMbF/oiLQMgJRpNvvH1JqwJUNzF
         8adC9LUWdTE5Gpa6styrFHyXCPqM/+vY4e+LNklsHYizevo5hdVPJ9eVFPf5EXZsR2AX
         O+qw==
X-Gm-Message-State: AOJu0YzWz8uFVkpo2RR0Ss2NkOQB5LtD6AVqacUoOUQmHrkdGYFcHLnf
	MAxkix0u0+cTmBOgeR4xh2li5+sce8NkxoOVtpZ1YgwrdJBbTmrNPsBfPmqlTDnB
X-Gm-Gg: ASbGncu4JiCczJVsP2qQlS1iRbBWfUiCJgB0QS+ZzNYuiguV2oq53MRs0hIES/Kds/m
	qxTx99vjnY5hFl+R2LZQ9HtB88bgJegX7afrHF7u5Y5EZGwauVdQSxfQLc+B+FFiiuCYMfdsoo3
	LR6QQvMAbad/ZMiyB/m7SJ8QeVDgiDSXytw6We4K5zI7Efuuhxp2T9v9RPsMo/nx/IU97f7/TL4
	elqR2a/4S4HHjFZu2Thgy7x8zT/M2d9tN9frrfQkRnyNgbLcAlusa35dDFu9jha4xVdHBQtfIek
	hNAwqR2M3hbSNd/6h8Cox9N32SZ0aGfNktmUwFRswewGUmvZUA5T7E5mrPrqwBEO
X-Google-Smtp-Source: AGHT+IEdR4dbNMP5vbOcjnUYATPzi0SICxYXC4uwGrI7shvk10DQ9oKrAn4SxruzqTbH3Eqby3G8/A==
X-Received: by 2002:a17:902:e80f:b0:234:d431:ec6e with SMTP id d9443c01a7336-23c8746618bmr9931675ad.3.1751598831210;
        Thu, 03 Jul 2025 20:13:51 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::aa8c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8455e739sm8774655ad.119.2025.07.03.20.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 20:13:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v6 1/2] compiler-rt,libcxx: Use clang for native-libcxx and gcc for compiler-rt-native
Date: Thu,  3 Jul 2025 20:13:48 -0700
Message-ID: <20250704031349.3388250-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 03:13:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219897

compiler-rt configure calls for c++ compiler which can cause C++ runtime to
not be detected on some Yocto autobuilder workers running ubuntu 24.04
therefore let it use gcc for native version

Set TOOLCHAIN_NATIVE for using clang for libcxx

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v6: Use gcc for native compiler-rt

 .../recipes-devtools/clang/compiler-rt-sanitizers_git.bb | 1 +
 meta/recipes-devtools/clang/compiler-rt_git.bb           | 9 ++++-----
 meta/recipes-devtools/clang/libcxx_git.bb                | 2 ++
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
index 47438014b23..087a7663023 100644
--- a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
@@ -37,6 +37,7 @@ CFLAGS += "${COMPILER_RT}"
 CXXFLAGS += "${COMPILER_RT} ${LIBCPLUSPLUS}"
 
 TOOLCHAIN = "clang"
+TOOLCHAIN_NATIVE = "clang"
 
 DEPENDS += "ninja-native virtual/crypt compiler-rt"
 DEPENDS:append:class-native = " clang-native libxcrypt-native libcxx-native"
diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/recipes-devtools/clang/compiler-rt_git.bb
index ff6cc29bf32..342a7b0e95e 100644
--- a/meta/recipes-devtools/clang/compiler-rt_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
@@ -29,14 +29,15 @@ DEPENDS += "ninja-native libgcc"
 DEPENDS:append:class-target = " virtual/cross-c++ clang-cross-${TARGET_ARCH} virtual/${MLPREFIX}libc gcc-runtime"
 DEPENDS:append:class-nativesdk = " virtual/cross-c++ clang-native clang-crosssdk-${SDK_SYS} nativesdk-gcc-runtime"
 DEPENDS:append:class-native = " clang-native"
+DEPENDS:remove:class-native = "libcxx-native compiler-rt-native"
 
 # Trick clang.bbclass into not creating circular dependencies
 UNWINDLIB:class-nativesdk = "--unwindlib=libgcc"
 COMPILER_RT:class-nativesdk = "-rtlib=libgcc"
 LIBCPLUSPLUS:class-nativesdk = "-stdlib=libstdc++"
-UNWINDLIB:class-native = "--unwindlib=libgcc"
-COMPILER_RT:class-native = "-rtlib=libgcc"
-LIBCPLUSPLUS:class-native = "-stdlib=libstdc++"
+UNWINDLIB:class-native = ""
+COMPILER_RT:class-native = ""
+LIBCPLUSPLUS:class-native = ""
 UNWINDLIB:class-target = "--unwindlib=libgcc"
 COMPILER_RT:class-target = "-rtlib=libgcc"
 LIBCPLUSPLUS:class-target = "-stdlib=libstdc++"
@@ -52,8 +53,6 @@ HF:class-target = "${@ bb.utils.contains('TUNE_CCARGS_MFLOAT', 'hard', 'hf', '',
 
 CC = "${CCACHE}${HOST_PREFIX}clang ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 CXX = "${CCACHE}${HOST_PREFIX}clang++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
-BUILD_CC = "${CCACHE}clang ${BUILD_CC_ARCH}"
-BUILD_CXX = "${CCACHE}clang++ ${BUILD_CC_ARCH}"
 LDFLAGS += "${COMPILER_RT} ${UNWINDLIB}"
 CXXFLAGS += "${LIBCPLUSPLUS}"
 
diff --git a/meta/recipes-devtools/clang/libcxx_git.bb b/meta/recipes-devtools/clang/libcxx_git.bb
index f5bf17f30ae..d355fc3a0f8 100644
--- a/meta/recipes-devtools/clang/libcxx_git.bb
+++ b/meta/recipes-devtools/clang/libcxx_git.bb
@@ -25,6 +25,7 @@ DEPENDS += "ninja-native"
 DEPENDS:append:class-target = " virtual/cross-c++ clang-cross-${TARGET_ARCH} virtual/${MLPREFIX}libc virtual/${MLPREFIX}compilerlibs"
 DEPENDS:append:class-nativesdk = " virtual/cross-c++ clang-crosssdk-${SDK_SYS} nativesdk-compiler-rt"
 DEPENDS:append:class-native = " clang-native compiler-rt-native"
+DEPENDS:remove:class-native = "libcxx-native"
 
 COMPILER_RT ?= "${@bb.utils.contains("PACKAGECONFIG", "compiler-rt", "-rtlib=compiler-rt", "-rtlib=libgcc", d)}"
 UNWINDLIB ?= "${@bb.utils.contains("PACKAGECONFIG", "unwind", "-unwindlib=none", "-unwindlib=libgcc", d)}"
@@ -55,6 +56,7 @@ LDFLAGS += "${COMPILER_RT} ${UNWINDLIB} ${LIBCPLUSPLUS}"
 CXXFLAGS += "${LIBCPLUSPLUS}"
 
 TOOLCHAIN = "clang"
+TOOLCHAIN_NATIVE = "clang"
 
 OECMAKE_SOURCEPATH = "${S}/llvm"
 EXTRA_OECMAKE += "\

