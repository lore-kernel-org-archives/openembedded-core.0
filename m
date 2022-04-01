Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB2B3C433F5
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 06:02:20 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.7264.1648792939448113218
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 23:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dzg7hoH1;
 spf=pass (domain: gmail.com, ip: 209.85.215.173,
 mailfrom: sundeep.kokkonda@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id bc27so1634978pgb.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 23:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pB01WpUMqgeVL+z1vUuIglpo04ANNLds8O9TN18D0vE=;
        b=dzg7hoH1pBC8ZnAvSnPF7euh+4Wot6t2NGzl0Dg9xNplAhG1x7iPR4HeYYUy/nAI+r
         ZOPSdHn8Cgn28EQE854kYdlwu3C6Jv4XB3621aoEWWDTrhVYLSGVs1s2gN+fautlI1BR
         HgaLDYu5Bzi4YeLL9W8h2jAMlvXwON5uWYiwuO/vltYWHVcLOrpXRh9gIYXT2cwlmadb
         nOWNQpP2IefuDO75NGCdqmsnJrToJPo+aqFIU2Ciu/2gNuHKXqp42zOUanzl7+EjzrMf
         qPsCUVdouArO8FGTzXb2zF7YWHbZy23CZ1G/Y71/ZIlpPPRRNdrjIeO32i6Pz/joXV41
         YRZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pB01WpUMqgeVL+z1vUuIglpo04ANNLds8O9TN18D0vE=;
        b=dw3mLIKyRUhzviPfs07DQbdJA3fxqw30wmArCndVP4jgRzXVcc83dXIVbijIFJikua
         uxRNuAFGKlJKlQWzdRdeK8R7169V1B2YUUrA8QYqA49chzLyWZ6LSs/7pyaLSHfA/9Ux
         jpgkNd7FX3XzO949N2mM+R3laHach7lOG2naBzfc3pskRKCL969fMuOZO/sLZ3P9Lnki
         v5sVdcY6XjJxobQHE8gCHfD4bjvivBOLwhgPF1KPxL5rYKwTu5aJH88wcMB77zhqzNxI
         mxwALk8Pde1G37kHJh18qijIIPlO99q1vJ9YJeQliJIaJ8sunzDd9oix/+K4iSd+c7Zv
         KpMw==
X-Gm-Message-State: AOAM5325/mfXvLS/W8RyUyGGLOKAnar66a/esFvc5DWQdVqEj1bB/DrO
	Emf+vHWuvCVfHretGRKC3r9buFEG2FzmgMOd
X-Google-Smtp-Source: 
 ABdhPJxKekTe13oTqnkmooHPBURmULE/eOLnJO6g93n5TxWwk8Tqh6Jj/8KbCxu8MepcA1nWpKveiQ==
X-Received: by 2002:a05:6a00:24cd:b0:4fd:9038:8aa4 with SMTP id
 d13-20020a056a0024cd00b004fd90388aa4mr16107794pfv.78.1648792938526;
        Thu, 31 Mar 2022 23:02:18 -0700 (PDT)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id
 mw10-20020a17090b4d0a00b001c7cc82daabsm13318703pjb.1.2022.03.31.23.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 23:02:17 -0700 (PDT)
From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Subject: meta: rust: Bug fix for target definitions returning 'NoneType'
Date: Fri,  1 Apr 2022 11:31:52 +0530
Message-Id: <20220401060152.8255-1-sundeep.kokkonda@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 06:02:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163881

The build shows below error while building for arm machines.
Exception: TypeError: int() argument must be a string, a bytes-like object or a number, not 'NoneType'

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


