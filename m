Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D579C636F7
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:46 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web08.38132.1649089743901178861
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Apr 2022 09:29:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=q67rRe8h;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: sundeep.kokkonda@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id o20so2850571pla.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Apr 2022 09:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nv78h5msdjvkMLNnutfkxyfa8qwWO+q14EQgTvtiONQ=;
        b=q67rRe8hhJN6ekMn6hxH3ur+f9YBh27kP8B7SUMcnSoQ42Aau25cdj0JGjHQRsGXrk
         a5A+MrTpI6Rc4c6p5tv1Ej/I6674crxHi3i+m4QFFnyxJSVapSkLmbROCViMxmo3nHEF
         FZIStw0L8YEbJi7yyNkkZYvW6N+vSRVqOUZJ40RBjylXoOvi3fOdfOyv65k2TT23NdDg
         BHTIB6ZhkRMamdjdNCAy94oSFU9CE1m9+oLd2ya8Pghc3VC1h/fPwuvd0M3kNEeXs1kV
         XwKwqk02xbYDN3nyLiA5ptF89/iQwT+uZHdWh2XiA+G/1iV+q3ugRsnqLMp5Pg76Jt0I
         2TjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nv78h5msdjvkMLNnutfkxyfa8qwWO+q14EQgTvtiONQ=;
        b=Hi9mghrSEQal3Kcwh9bRzw7hpN4YB7Erm4Mi/HwoJzoFSaZ8PT6ssln4UBNHUnZNZl
         oUp6C0yhCMfPcJxlnCw8TeM2jmSwN8JqhQw3kvLtt5gg/SM+zTq9TaqfPtcvOQ/9g21M
         ajlZ7YOk6BFaOoQdCuJI5z7zHc7d6xdl9hmPNNO08D6GPr9+Y5BXkmAuQ1WZiAAAXGK8
         E942QIvB4HUR+VLH/Igdo2ED08b3WCTfvc50MD4MWEOPvSzWUd+F2roV1A/2Gf0s6C6b
         EQsWDTRZiIgMZ/dEUG/2qFs7sa90Hwqq4iw2D62VV1RIT0cWmPiakt6I+OOrUzR0gGQP
         HFwg==
X-Gm-Message-State: AOAM531b4rAM2X3olMNbzhcMrlgNhRSaEG3/6OlCfaFa96KWwx++tLDO
	gqUNxKjDWroaeRcI1cAypJawZriCfd6/5Q==
X-Google-Smtp-Source: 
 ABdhPJyj4MZAeobAckSg1ys4Z+LxntImH1YNjsKcQCjn4lS75wmU1gvdi/YbFjg/nMNN2T494A+J3g==
X-Received: by 2002:a17:90b:4c12:b0:1c6:f450:729d with SMTP id
 na18-20020a17090b4c1200b001c6f450729dmr27466547pjb.190.1649089742967;
        Mon, 04 Apr 2022 09:29:02 -0700 (PDT)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id
 f14-20020a63380e000000b0038253c4d5casm10672628pga.36.2022.04.04.09.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 09:29:02 -0700 (PDT)
From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Subject: [meta] meta: rust: Bug fix for target definitions returning
 'NoneType'
Date: Mon,  4 Apr 2022 21:58:42 +0530
Message-Id: <20220404162842.252087-1-sundeep.kokkonda@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164006

The build shows below error while building for arm machines.
Exception: TypeError: int() argument must be a string, a bytes-like object or a number, not 'NoneType'
Detailed error info : https://lists.openembedded.org/g/openembedded-core/message/164004

All the target definitions within tspec dictionary are generted as
NoneType. The changes will fix this issue.

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
---
 meta/recipes-devtools/rust/rust-common.inc | 28 +++++++++++-----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-devtools/rust/rust-common.inc
index ceeee97863..6236c43d5c 100644
--- a/meta/recipes-devtools/rust/rust-common.inc
+++ b/meta/recipes-devtools/rust/rust-common.inc
@@ -119,22 +119,22 @@ def llvm_features(d):
 
 
 ## arm-unknown-linux-gnueabihf
-DATA_LAYOUT[arm-eabi] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
-LLVM_TARGET[arm-eabi] = "${RUST_TARGET_SYS}"
-TARGET_ENDIAN[arm-eabi] = "little"
-TARGET_POINTER_WIDTH[arm-eabi] = "32"
-TARGET_C_INT_WIDTH[arm-eabi] = "32"
-MAX_ATOMIC_WIDTH[arm-eabi] = "64"
-FEATURES[arm-eabi] = "+v6,+vfp2"
+DATA_LAYOUT[arm] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
+LLVM_TARGET[arm] = "${RUST_TARGET_SYS}"
+TARGET_ENDIAN[arm] = "little"
+TARGET_POINTER_WIDTH[arm] = "32"
+TARGET_C_INT_WIDTH[arm] = "32"
+MAX_ATOMIC_WIDTH[arm] = "64"
+FEATURES[arm] = "+v6,+vfp2"
 
 ## armv7-unknown-linux-gnueabihf
-DATA_LAYOUT[armv7-eabi] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
-LLVM_TARGET[armv7-eabi] = "${RUST_TARGET_SYS}"
-TARGET_ENDIAN[armv7-eabi] = "little"
-TARGET_POINTER_WIDTH[armv7-eabi] = "32"
-TARGET_C_INT_WIDTH[armv7-eabi] = "32"
-MAX_ATOMIC_WIDTH[armv7-eabi] = "64"
-FEATURES[armv7-eabi] = "+v7,+vfp2,+thumb2"
+DATA_LAYOUT[armv7] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
+LLVM_TARGET[armv7] = "${RUST_TARGET_SYS}"
+TARGET_ENDIAN[armv7] = "little"
+TARGET_POINTER_WIDTH[armv7] = "32"
+TARGET_C_INT_WIDTH[armv7] = "32"
+MAX_ATOMIC_WIDTH[armv7] = "64"
+FEATURES[armv7] = "+v7,+vfp2,+thumb2"
 
 ## aarch64-unknown-linux-{gnu, musl}
 DATA_LAYOUT[aarch64] = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
-- 
2.25.1


