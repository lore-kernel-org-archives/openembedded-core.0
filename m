Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B146CAC582
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 20:18:49 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.4770.1757362727463898973
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Sep 2025 13:18:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iUMArcsE;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-afeec747e60so913729166b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 13:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757362726; x=1757967526; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RY3zjW1gzTCdMfKh+DO4Wn90mziQ2wq3p3+CBTccssA=;
        b=iUMArcsEUJbl5Vzfd5+JUIH0oeAPsqKMTfyyIQYjyBR+N+xhRS3gyfWKtqHTFDlYGP
         uNuxLImuLvKNau5XApNfK5bLyL5Gg7ivdIlGUKsHQdhvD1kMM/vSH0AT2p9UimNg7EG6
         zx9hd2IlxzNjqYdYV8RDw6jNQgmGneLqEcYiDa+kOJ+msFGShrtgXQGNyR+NHut/dNKi
         r6CGZH76t/rUa30zKFxp7pP4HVlmDY8eZhH9oCAMzESXVKCbcFe4vgjDFlxt4gB44++t
         47cn6fqCzb5Mg5tf3057wqQpAyPS3PcS5ZKGfgoP+Z4fAYmIS/w2L8hrco8gTIryLN4T
         IIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757362726; x=1757967526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RY3zjW1gzTCdMfKh+DO4Wn90mziQ2wq3p3+CBTccssA=;
        b=n+JVe8w1Gl+oX1HSJSnxJJ7Q7EP9+zmaCrQ4lVABBHHrx0b3/71dPDlsXiivfijmsW
         KTjtmctbIeZp7hNuuqnjrMEhwwRAp7+orAxCTShuucExMHD5feADl+gYEdsCOT0eIu0N
         gAH6KyZOiIzR5sKNy7tCMr458jgLE4c6Wt4sHL5BuwuclCIQoxshFRbBDckZDXKhYK4m
         25Yjw4AYk45C7AdhiaJ3OABQqEGWZCGXQvCrFA87TD4DSOyKaNeffk4RyWPI7YFGrGSS
         JFXiLnUIORIJgKVWzjUaMQI+2B5rBRnmNcVTiiqqWlcio8uMV+f6hn9jR2yUeM66PYeF
         n8pQ==
X-Gm-Message-State: AOJu0YwN4Ufb8YWfMB7PL7p2teIPw/jBG+QZgC3HkJS2JDeMCgBTVDP2
	tVLGi996En+y9kWVOB25R0EAa8YnYG3XWCOOfWGN4Hr2s2mmjUMH2lehi2hR6Q==
X-Gm-Gg: ASbGncvELqEyqcD+H2QVatEn8HmebIsHs1riBsSBq8PhUTV1u6ifP5aski1/vqbDWzc
	GKwk7DdenG7Btd1kvDH4TMdG2MXzkS+/kllAWq4csbnxaF+mmQHbL/BWw+oOVj/zyc7I4vWPgCH
	XANDh6SYJQKIgfrg6hzmaocwXX27m9CtLb/N0kXS17ZBBqG5PPaWCa7bcQrfAjTGbRUr52yiCl5
	4flVwqXRq9rKvytFe1QQmjlim1hc1rHCJ7FAuICZhCwqp0ifs/evKYEa+KsNcdjXmIHbaFQB9wy
	F+PFas2NXU12g4EwWuEhrlMIsWqtXpiePV1zwgkhTaftShJGHaohBuHvOneN31y8Rpah8EOrp87
	cDnwZOMPgWeoKiKFeFvXDLqtqeaSZtXY=
X-Google-Smtp-Source: AGHT+IESKXa9edgp5gLE7nlGXeIen2XJ1NVl682R4B08Wgg4Male5t5NLyCPR85Bn3YYvAPIgPa5+A==
X-Received: by 2002:a17:907:3ea8:b0:b04:25e6:2dbe with SMTP id a640c23a62f3a-b04b16d8182mr916576166b.63.1757362725406;
        Mon, 08 Sep 2025 13:18:45 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0413ee67a3sm2140797366b.24.2025.09.08.13.18.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 13:18:44 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH] llvm: fix typo in CVE-2024-0151.patch
Date: Mon,  8 Sep 2025 22:18:44 +0200
Message-ID: <20250908201844.2246745-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 20:18:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223079

During backporting the patch, accidentally a variable was removed.
In case the recipe is compiled for 32-bit Arm target, compilation
fails with the following error:

3.0.1-r0/git/llvm/lib/Target/ARM/ARMISelLowering.cpp:4481:13: error: 'RegVT' was not declared in this scope
|  4481 |         if (RegVT == MVT::f16 || RegVT == MVT::bf16)
|       |             ^~~~~

This patch corrects the patch, and adds back the removed RegVT variable.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/recipes-devtools/llvm/llvm/CVE-2024-0151.patch | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm/CVE-2024-0151.patch b/meta/recipes-devtools/llvm/llvm/CVE-2024-0151.patch
index cbe6f5bf3f..f5ef7e8d4f 100644
--- a/meta/recipes-devtools/llvm/llvm/CVE-2024-0151.patch
+++ b/meta/recipes-devtools/llvm/llvm/CVE-2024-0151.patch
@@ -32,6 +32,10 @@ Date:   Thu Jun 20 10:22:01 2024 +0100
 Upstream-Status: Backport [https://github.com/llvm/llvm-project/commit/78ff617d3f573fb3a9b2fef180fa0fd43d5584ea]
 CVE: CVE-2024-0151
 Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+Added back RegVT variable, which was accidentally removed during backporting.
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
 ---
 diff --git a/llvm/lib/Target/ARM/ARMISelLowering.cpp b/llvm/lib/Target/ARM/ARMISelLowering.cpp
 index 900113244e41..e12f8c183db2 100644
@@ -98,16 +102,15 @@ index 900113244e41..e12f8c183db2 100644
    Function::const_arg_iterator CurOrigArg = MF.getFunction().arg_begin();
    unsigned CurArgIdx = 0;
  
-@@ -4432,7 +4450,7 @@ SDValue ARMTargetLowering::LowerFormalArguments(
-     }
+@@ -4433,6 +4451,7 @@ SDValue ARMTargetLowering::LowerFormalArguments(
      // Arguments stored in registers.
      if (VA.isRegLoc()) {
--      EVT RegVT = VA.getLocVT();
+       EVT RegVT = VA.getLocVT();
 +      SDValue ArgValue;
  
        if (VA.needsCustom() && VA.getLocVT() == MVT::v2f64) {
          // f64 and vector types are split up into multiple registers or
-@@ -4496,16 +4514,6 @@ SDValue ARMTargetLowering::LowerFormalArguments(
+@@ -4496,16 +4515,6 @@ SDValue ARMTargetLowering::LowerFormalArguments(
        case CCValAssign::BCvt:
          ArgValue = DAG.getNode(ISD::BITCAST, dl, VA.getValVT(), ArgValue);
          break;
@@ -124,7 +127,7 @@ index 900113244e41..e12f8c183db2 100644
        }
  
        // f16 arguments have their size extended to 4 bytes and passed as if they
-@@ -4515,6 +4523,15 @@ SDValue ARMTargetLowering::LowerFormalArguments(
+@@ -4515,6 +4524,15 @@ SDValue ARMTargetLowering::LowerFormalArguments(
            (VA.getValVT() == MVT::f16 || VA.getValVT() == MVT::bf16))
          ArgValue = MoveToHPR(dl, DAG, VA.getLocVT(), VA.getValVT(), ArgValue);
  

