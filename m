Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC893C3ABCA
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 19:13:26 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.4377.1746731605637247254
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 12:13:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nGFzURZE;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so1454249b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 12:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746731605; x=1747336405; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frt4Xp6Ohnxfb61Zht/Dsdri0Qv0ftg+25WIR9iPW2s=;
        b=nGFzURZEZJXi0QUe2vLiFKTWW157FjnkaG1iLilyR7E/L9SOQwcqgnB/zuCUSwVN3M
         JFWyeuBetTjIU9edEg/skHNonQKvOGit2X1QOu8X6VGt43sr0ugsrU2BvGlDBa1ptLVN
         PFUWZv51lHd3s7ke3VfhB+P6o2ZvM6pzxAVlGvLCzgZq1Oc0Qw5jub5RqLzTFKBFqr+u
         gHoUuZFJG5IEL0bWYfctLJpga86xLwfnlV2OqyAH05QNtlw4svMzDSzAZ2USR3edTO0n
         yW1eLPZnys+K2Eigt7HPakg6V9KYzyCDE5l7lsp2I9Nf/dIsMJ19z8MMU80rznWn0gbS
         MQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746731605; x=1747336405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=frt4Xp6Ohnxfb61Zht/Dsdri0Qv0ftg+25WIR9iPW2s=;
        b=detiVhQ0m9aaCmBur37CAafBKmsuHRgopWDl6PCygCq9eyqSwNzGyqSX6Y4zVkRsq8
         g0NyRWUmnhxXrvil5Hoov8HujaD2S4PyYT2/5M5vkKJ0qdEY+6oUXCfLVDjtUlsC+qUf
         gUq6Z5i91jxrIq4d03F3y5oLNiBv/s+n2b6fVkE0cHVeGsvLOyxTBcgwN/EaW3oXm7z3
         5OSD8hzomWMglKh4LZVAWSLLYMWZiv5W+t0LPOXbxIhUzdVROmEWshloSMutadZfd79w
         FxuarTWY+bjl9FSOkOo80/pr+zL76pB1Ay7rZ6HG4W5XOS/HVFYWFi4A4aHslauFSRk8
         G0yg==
X-Gm-Message-State: AOJu0YxQ31N+PuKP5vDA20f54w0gBp1sJ8C4wnihjxWNRO2tMoyXyHkr
	+r//2++PGA5bYiv00IdKcL2pw7SE8Ej7Hv1SdUAVIpNuw+hDju3XyTXKNd8Y
X-Gm-Gg: ASbGncu+tl7bEwmvny23dGDOW8Do3mYeVGOKQqCfJsnnlNGPg+D5QP1feqt5IDPJQz1
	hjr8p9v4/aeeU315LioNITWkpPPldIDVghdek7ssdcOk2S2ZFOU4Vhq8WmsAjfUCqu5hKVwo372
	jAdVui1cOCybD69JKTwBoYQ2FW1HHjJ9AIZKashyuoy72Nn9ZHCUJE6/o0uhUoIGANqqg4/6aFh
	pfTZaWsrsRMRNmQRiILMBIp1s6CzmVzpY5CKTpRXtP8x4LswX5Z3EamqbCtN7p8a09iN+CNMAWp
	fxP6Pu0nlkSt5cFcg4bGX4ZmFTxjstr9
X-Google-Smtp-Source: AGHT+IEUlQjodUMrl7b7HwATRklSBswUfm0/X4KGCZgObbHJJc9sCxeMi1OVTjQmlt4J8kSuEx+k+Q==
X-Received: by 2002:a05:6a21:3292:b0:1f3:418c:6281 with SMTP id adf61e73a8af0-215abb4f8f6mr426014637.4.1746731604699;
        Thu, 08 May 2025 12:13:24 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a0f14csm376619b3a.107.2025.05.08.12.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 12:13:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/4] libcxx: Fix cflags and ldflags for using compiler runtime
Date: Thu,  8 May 2025 12:13:17 -0700
Message-ID: <20250508191319.3743189-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250508191319.3743189-1-raj.khem@gmail.com>
References: <20250508191319.3743189-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 19:13:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216155

-stdlib is needed in both cxxflags and ldflags since c++ compiler
will use these to chose the right c++ headers and libraries during link

-rtlib and -unwindlib are only needed during linking

Use LLVM_HOST_TRIPLE during cross compiling compiler-rt for target
this is used by cmake to compute target and compiler triples

Fix LLVM_RUNTIME_TARGETS to use HOST_ARCH, it does not need cross
compile triple which HOST_SYS is passing here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/clang/libcxx_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/clang/libcxx_git.bb b/meta/recipes-devtools/clang/libcxx_git.bb
index f5987199ecf..c99617c228a 100644
--- a/meta/recipes-devtools/clang/libcxx_git.bb
+++ b/meta/recipes-devtools/clang/libcxx_git.bb
@@ -51,8 +51,8 @@ CC = "${CCACHE}${HOST_PREFIX}clang ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 CXX = "${CCACHE}${HOST_PREFIX}clang++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 BUILD_CC = "${CCACHE}clang ${BUILD_CC_ARCH}"
 BUILD_CXX = "${CCACHE}clang++ ${BUILD_CC_ARCH}"
-CFLAGS += "${COMPILER_RT}"
-CXXFLAGS += "${COMPILER_RT} ${LIBCPLUSPLUS}"
+LDFLAGS += "${COMPILER_RT} ${UNWINDLIB} ${LIBCPLUSPLUS}"
+CXXFLAGS += "${LIBCPLUSPLUS}"
 
 OECMAKE_SOURCEPATH = "${S}/llvm"
 EXTRA_OECMAKE += "\
@@ -71,7 +71,7 @@ EXTRA_OECMAKE += "\
                   -DLIBCXX_CXX_ABI_LIBRARY_PATH=${B}/lib${LLVM_LIBDIR_SUFFIX} \
                   -S ${S}/runtimes \
                   -DLLVM_ENABLE_RUNTIMES='libcxx;libcxxabi;libunwind' \
-                  -DLLVM_RUNTIME_TARGETS=${HOST_SYS} \
+                  -DLLVM_RUNTIME_TARGETS=${HOST_ARCH} \
                   -DLLVM_LIBDIR_SUFFIX=${LLVM_LIBDIR_SUFFIX} \
                   -DLLVM_APPEND_VC_REV=OFF \
                   -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON \
@@ -81,7 +81,7 @@ EXTRA_OECMAKE:append:class-target = " \
                   -DCMAKE_AR=${STAGING_BINDIR_TOOLCHAIN}/${AR} \
                   -DCMAKE_NM=${STAGING_BINDIR_TOOLCHAIN}/${NM} \
                   -DCMAKE_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${RANLIB} \
-                  -DLLVM_DEFAULT_TARGET_TRIPLE=${HOST_SYS} \
+                  -DLLVM_HOST_TRIPLE=${TARGET_SYS} \
                   -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
 "
 

