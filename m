Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB44CC3ABC6
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 19:13:26 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.4379.1746731606398873027
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 12:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cfqa8eXl;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-736ad42dfd6so1171513b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 12:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746731606; x=1747336406; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajLlI7IwbCEQKmckcjJI6W8VfdMA0/soEXlj9Rwp9X0=;
        b=cfqa8eXljLgX621B80vdBZdI7nAyfiqGrEBhRIZDGdqVI+NsWH9jvpaMSHHBJwoM4O
         kD8Zc/Xva4mENrjobvxW25/oT+2xpduimTQK8ytRTEZk0jP28HJKscFM4aY2vaU5TXQA
         WPW/PSzhWUx8wb8yZFzT/jkRMK0tjV+2oeV/v4eZxUduEEG1nmMktrNwrHCTnmbFB/a9
         i6drXvvM4HOe3K2qlcXn2HwB+Wg4iyxgcYHUo4ESRlo9eHaeqJATKasw1k4WOK3s2tKN
         8lekW4mVZBbtfMlivXntcs9pwgprW5RNYTA8kf3zVIB1q1P0OrpXSkxKt9r2FxUldRYN
         xvnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746731606; x=1747336406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ajLlI7IwbCEQKmckcjJI6W8VfdMA0/soEXlj9Rwp9X0=;
        b=j5CazCr5AA8wwQ6HSBd0VJWd+ANDHtbh+BGyhZygtgJJ0UvvvgECYLe3qi6HeTvxx9
         8reHqfhJ0K4NsmAFF01l/lDQLVP2pPvXli5OAOA410FSVf3IDpWsnABlMVz/vbuIiK+6
         w52BD98843EAjfH4wgsAE/GIyfwuV3HQDYqTZiN93+EvemodsP4lNFGBJ1D3bt7w9MvW
         whInHLWYFL05QdBSxUBLowPFJEV9tMi32CUf22shKnaQ9ElSzcwT+jkFSQCgdWB3stJH
         0N6jGiIAcGsxUhp3TFNnqlnwuWDQ96AU4TOAFAZBMyhT3Aafn/06tl2i9N8hm4wG6YUk
         A8tw==
X-Gm-Message-State: AOJu0YyIRbsYk541h6MXXqvx5Nof6IN4OzxkQSDz0kVSq/adUUmaTXov
	1DIFmZHjI18e+1DhRkSNE+AxnncNSsrHmY0ZgEyuaa520eIGQhCeMFqqLBJh
X-Gm-Gg: ASbGncvOVnkJ7arYPxksVcTFGdkMXvVnM2m3mhHNRRPbXICOx0RYugD4NFOxxImv/ym
	M2V/Q3cAfLZIqfbcAXxP8fd2kSNPw86lC2srmADBNUYUzb9UpbvDFdf45tV8ZE8SUul6aPl3jF4
	yqI0IW1GRX8yXlHUoN9Tod8u9z1yIx2AN0P7l+pIT666aF28xjYzrWpMxD4jlgVkoWziA5PYrUm
	kBZ8wMRJSVfec8gitZC4I/1avkCDpkiIUqp7NSGmi6TjOiMGc1jB60EVusLmhlxhLU1SFS6RFKR
	3gDjwnQolLP3Ig3iiUuMkgEjZcLAqsh0
X-Google-Smtp-Source: AGHT+IGemM/1I/bt/ngxBlZlVhCx+AuNrN9qQlpXLi6n8CDE7abqlA3Q/s6/Sh1scqcnD8mKw1uGvA==
X-Received: by 2002:a05:6a20:e30b:b0:1f3:345e:4054 with SMTP id adf61e73a8af0-215abb8ee72mr486202637.14.1746731605629;
        Thu, 08 May 2025 12:13:25 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a0f14csm376619b3a.107.2025.05.08.12.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 12:13:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/4] compiler-rt: Rename the rt libraries if compiled with arm hardfloat ABI
Date: Thu,  8 May 2025 12:13:18 -0700
Message-ID: <20250508191319.3743189-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250508191319.3743189-1-raj.khem@gmail.com>
References: <20250508191319.3743189-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 19:13:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216156

OE does not rely on tuple to deduce hardfloat ABI, but clang/llvm does
arm-yoe-linux-gnueabi is used for both soft and softfp and hardfp float
ABIs in OE, LLVM expects arm-yoe-linux-gnueabihf for it to be treated as
hardfloat ABI, and look for correct name for rt libraries.

We know when we compile them with Hard-float ABI so rename them in such
case so clang can find it when using -rtlib=compiler-rt it needs to
has 'armhf' suffix

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/clang/compiler-rt_git.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/recipes-devtools/clang/compiler-rt_git.bb
index 22dec883298..0a0ef6be807 100644
--- a/meta/recipes-devtools/clang/compiler-rt_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
@@ -50,7 +50,6 @@ PACKAGECONFIG[ctx-profile] = "-DCOMPILER_RT_BUILD_CTX_PROFILE=ON,-DCOMPILER_RT_B
 
 HF = ""
 HF:class-target = "${@ bb.utils.contains('TUNE_CCARGS_MFLOAT', 'hard', 'hf', '', d)}"
-HF[vardepvalue] = "${HF}"
 
 CC = "${CCACHE}${HOST_PREFIX}clang ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 CXX = "${CCACHE}${HOST_PREFIX}clang++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
@@ -97,6 +96,12 @@ EXTRA_OECMAKE:append:class-nativesdk = "\
 do_install:append () {
     mkdir -p ${D}${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib
     mv ${D}${nonarch_libdir}/linux ${D}${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib
+    if [ "${HF}" = "hf" ]; then
+        mv -f ${D}${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib/linux/libclang_rt.builtins-arm.a \
+              ${D}${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib/linux/libclang_rt.builtins-armhf.a
+        mv -f ${D}${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib/linux/liborc_rt-arm.a \
+              ${D}${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib/linux/liborc_rt-armhf.a
+    fi
 }
 
 FILES_SOLIBSDEV = ""

