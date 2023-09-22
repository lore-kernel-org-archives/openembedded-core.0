Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3583ECD4846
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 16:37:30 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.2249.1695400645110535812
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 09:37:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HDxEBsse;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-68c576d35feso2131029b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 09:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695400644; x=1696005444; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+aC++vmI46zTo0ozcN82bbeEfO2xr6ea8PCFzygX/X4=;
        b=HDxEBsseoS4pifQKXSqKFBZnerz8YdI1oY5L3n8sbUw72SojjDinnrWtQSmPXEHHwk
         S/szpvn9i6XCQ1wkC1lad6KjmQVmge62geNTL8UVfDnAs4Nmo8Q8UrSLraYRWg0mJKYs
         DACy+bkLHKRdq81cRT3nGazvDsqQegThfXSmU2wg/21cpsYPuNTa3gi/SYCsn259OmNr
         yxK6kC3pNrdEukSfOkeFExtWlg4UX79p2XCCG86HQ6T1gedLwotCwPrRQVOFcn7zwta9
         h//kp5/AJUVfU2gKFeWmIowgeyr2bHJhX4BKMBJu635CFfrSkeO8eRVIssCdGpbe1nTZ
         MhDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695400644; x=1696005444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+aC++vmI46zTo0ozcN82bbeEfO2xr6ea8PCFzygX/X4=;
        b=gleSSCiaVYy48idv9DPaSqdShJg7rQLgZhmAc8kwpZJRWVDrd+ZPG/zEGLPrD5wSlc
         33RBATrU6Kv5HtN/jv1kSNjpbMXtUVux306INTla72su+zO7ZX/jLyUR8WZ+YrH9dOjR
         tsEdmB+TbLdIbK6lykJxoIZCHyALDlxk79KfAUO5ezHm1G00gN+UJg6Hs5ZJcbBKRxJN
         Ry6vC2nxkkjeRUtJlWxTpird4LVg7FO1Nl3CDKDAk3H6jwmkUDrXv+xCBOvUSJhvE6jP
         Vrz638APDSlR5ICPw3/BZbYmvTlE5eNEoNQbjHcZX7XkYMmz/aKJTNivk3qii3KqrgCI
         SILA==
X-Gm-Message-State: AOJu0Yzxr/lv7Bk1fPQ7cU5LeDHa75VI604ccpD07KccLfGW5CubmvIX
	3KtqCq3jrZCrg3TV9wgij/HBAbj+C2++ug==
X-Google-Smtp-Source: AGHT+IHGRi4BJhZRHHtV4q/nKMWGYFZIIxKt0qIh/XjCUag/VLEvmAjniwlJsgCUNafgkzMSRPWFiw==
X-Received: by 2002:a05:6a20:9154:b0:159:c2d0:9fc6 with SMTP id x20-20020a056a20915400b00159c2d09fc6mr160524pzc.8.1695400644204;
        Fri, 22 Sep 2023 09:37:24 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::d373])
        by smtp.gmail.com with ESMTPSA id y3-20020aa78543000000b00690ba24e7dcsm3397604pfn.64.2023.09.22.09.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 09:37:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] mesa: Update clang-17 patch to upstream v2
Date: Fri, 22 Sep 2023 09:37:21 -0700
Message-ID: <20230922163721.477463-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 16:37:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188129

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-gallium-Fix-build-with-llvm-17.patch | 27 ++++++++++++-------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch b/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch
index 3631a918b0c..0ca7a22b45b 100644
--- a/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch
+++ b/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch
@@ -1,4 +1,4 @@
-From 865762e0a767a121206d818bdd58301afbf30104 Mon Sep 17 00:00:00 2001
+From c8e9776abc3dfd3f2411797a90a03e7fa16263ef Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 23 Jun 2023 01:20:38 -0700
 Subject: [PATCH] gallium: Fix build with llvm 17
@@ -10,14 +10,12 @@ so add conditions to exclude them for llvm >= 17
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23827]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- src/gallium/auxiliary/gallivm/lp_bld_init.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
+ src/gallium/auxiliary/gallivm/lp_bld_init.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
 
-diff --git a/src/gallium/auxiliary/gallivm/lp_bld_init.c b/src/gallium/auxiliary/gallivm/lp_bld_init.c
-index 24d0823..3d4573e 100644
 --- a/src/gallium/auxiliary/gallivm/lp_bld_init.c
 +++ b/src/gallium/auxiliary/gallivm/lp_bld_init.c
-@@ -42,8 +42,10 @@
+@@ -42,19 +42,23 @@
  
  #include <llvm/Config/llvm-config.h>
  #include <llvm-c/Analysis.h>
@@ -29,6 +27,17 @@ index 24d0823..3d4573e 100644
  #include <llvm-c/Transforms/Utils.h>
  #endif
  #include <llvm-c/BitWriter.h>
--- 
-2.41.0
-
+ #if GALLIVM_USE_NEW_PASS == 1
+ #include <llvm-c/Transforms/PassBuilder.h>
+-#elif GALLIVM_HAVE_CORO == 1
++#elif GALLIVM_HAVE_CORO == 1 && LLVM_VERSION_MAJOR < 17
+ #if LLVM_VERSION_MAJOR <= 8 && (DETECT_ARCH_AARCH64 || DETECT_ARCH_ARM || DETECT_ARCH_S390 || DETECT_ARCH_MIPS64)
+ #include <llvm-c/Transforms/IPO.h>
+ #endif
++#if LLVM_VERSION_MAJOR < 17
+ #include <llvm-c/Transforms/Coroutines.h>
+ #endif
++#endif
+ 
+ unsigned gallivm_perf = 0;
+ 
-- 
2.42.0


