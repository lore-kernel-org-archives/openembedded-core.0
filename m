Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB55CE743CD
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 23:01:17 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.6275.1695942070852491214
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Sep 2023 16:01:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MJZth196;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1c5ff5f858dso76058675ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 16:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695942070; x=1696546870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UePeEHbFqFsH2Vxi1u7xxnfGkTGg+59voX3OtCoG2JE=;
        b=MJZth1965mUUg7hBMNv1QKv/EFuKOEIWOOoGS/f/ddHxtmbiXbuDQIAhF44hUqZGIP
         3Qlq7czkTR+W/j0rXXQDF+qqT1q23tQUEAeYttL9kMSj6KkhCG/Ey4qIQzLZ/ISdJz9u
         kiNrOydnaxsWzILt60lK9TuFEcU86fHYk0Amm7hybq1TwLIrQGLLqR5AXxbogaqGB0EI
         sFZC30OFGygms/sSLm9SpWy3qUWFUzIdw4H8e8cjouVaQnL8gq+B2sfzE/gHDbZeiys1
         GhyyskrctTCBpSy97j0/H/WFQxqzsnftJvtYGsFLELcVJcs6A2sOGfeki8AZPeNg2POI
         C2aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695942070; x=1696546870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UePeEHbFqFsH2Vxi1u7xxnfGkTGg+59voX3OtCoG2JE=;
        b=X4pKBF3GZmkOoHsiQIRvMkjjZ2jhv+YDnnjt7qq1II8Nq13Ve4sVHya7m9CudfGu2D
         WFwrpMwbx4MHyQ/ztu81Tm4dFueaaDxPEYa61eXLYZ0BIOeUdTgkwwfbKG7AM2uB4OEv
         XnacpXMl1TEeMCJj7LGwSxBt96+JprnM/GNiqG32b9MKSC7kdqkd4b1dB6r/t+GFxMCB
         MJ2kAo4vdPCiqub9HiRoRSu0rz/Hd/MDYpPpHbmchdVUHNYpOlgE4UzkRkDb9KLspMoO
         OVC+V+ByqPWG/15dhn6yu+6E2dqDe/KC6r2+RKRRjy+woxZ3T32jjdpFDfLgfSwc3SGA
         i39Q==
X-Gm-Message-State: AOJu0YzvONZA8TyRGCHxddzgLNSYNsWduB7sIRuQgOaXmCK5T2gxM4OG
	1KwuWKc2rYW34WdF9xCI1lchUBKgSSV0DA==
X-Google-Smtp-Source: AGHT+IG+aLo5SqG28zKFpaqzEe0i5B6UC1uixLvlZH2XzcaTs1940gZvMgoVSHGsBF5VbO75kT/nsw==
X-Received: by 2002:a17:902:d48f:b0:1c5:b1a6:8111 with SMTP id c15-20020a170902d48f00b001c5b1a68111mr2949435plg.31.1695942069925;
        Thu, 28 Sep 2023 16:01:09 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::7f07])
        by smtp.gmail.com with ESMTPSA id iz19-20020a170902ef9300b001bda30ecaa6sm15581276plb.51.2023.09.28.16.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 16:01:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] mesa: Simplify llvm-17 patch
Date: Thu, 28 Sep 2023 16:01:06 -0700
Message-ID: <20230928230106.1058552-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230928230106.1058552-1-raj.khem@gmail.com>
References: <20230928230106.1058552-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 23:01:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188387

llvm-17 support patch had redundant checks for llvm-17, Simplify them as
submitted in v3 upstream

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mesa/files/0001-gallium-Fix-build-with-llvm-17.patch   | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch b/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch
index 0ca7a22b45b..165708145a7 100644
--- a/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch
+++ b/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch
@@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 --- a/src/gallium/auxiliary/gallivm/lp_bld_init.c
 +++ b/src/gallium/auxiliary/gallivm/lp_bld_init.c
-@@ -42,19 +42,23 @@
+@@ -42,8 +42,10 @@
  
  #include <llvm/Config/llvm-config.h>
  #include <llvm-c/Analysis.h>
@@ -27,10 +27,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include <llvm-c/Transforms/Utils.h>
  #endif
  #include <llvm-c/BitWriter.h>
- #if GALLIVM_USE_NEW_PASS == 1
- #include <llvm-c/Transforms/PassBuilder.h>
--#elif GALLIVM_HAVE_CORO == 1
-+#elif GALLIVM_HAVE_CORO == 1 && LLVM_VERSION_MAJOR < 17
+@@ -53,8 +55,10 @@
  #if LLVM_VERSION_MAJOR <= 8 && (DETECT_ARCH_AARCH64 || DETECT_ARCH_ARM || DETECT_ARCH_S390 || DETECT_ARCH_MIPS64)
  #include <llvm-c/Transforms/IPO.h>
  #endif
-- 
2.42.0


