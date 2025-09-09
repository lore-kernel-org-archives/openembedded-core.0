Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B30C1CAC582
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 19:30:20 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.4461.1757446216077174785
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 12:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nKYjvjkp;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-24c786130feso52147055ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 12:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1757446215; x=1758051015; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gz903LSn9+U5ZY3x40DGgVE7zIqauHEMGyzrGYLQVhU=;
        b=nKYjvjkpvzge1gSg3wG2ODCpstKxfPilwextPrA8ULnQdDXzWt0pWnM95N/XLozLW+
         JcWx9o+N/RMjWQXpw3TSCUcrHPG64/yNxqe1eJd81VTWr3lZw310fl7ARQqJfilIAls2
         csu2qFGfGaobM1mDzJyFl+qYx3zPb+idQa/B/dV0MQqD8gXDpHqNKE8WzV8/j0gEAUIB
         TcBPgnn8h+URUqY083kb7cZrnZsOohMisCWG7PNdmwYKwppR78T8GcA1znoDOCd+qrWx
         VlJCRz9NmShSmjU7DtjFodJPN1lHuleq1mtc7FL630W3SaZ6FuskmYmbxFPck0vtqm6v
         BzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757446215; x=1758051015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gz903LSn9+U5ZY3x40DGgVE7zIqauHEMGyzrGYLQVhU=;
        b=Vuu1IaWEfIIUhdwSCKnOGxNilyg+xmfngoYrwfTVIgKtneJZKvgmydkT++W7yoTETd
         8/fu5QPle7UBU6JQrK/Sb4LwV1gYI6C67i1gP75JeL1eEbTVWdZRVGnYxGiD4FbJ7Q1o
         X0Lzs5PtHFbSK2egYxoLZkZUgjHD0/wj4xYGsSgugIsq7xbyUUfgumocjHhwOhMUS4wZ
         TZ1YLjx29GWz9bs0OZv8If4vgPWkCxSXTwFLlwqpQ8NystzZiIY/9wmaf/OGi9EaSZUw
         h0sahGBGeoik72AVV4vhcUp5HXiKPDVnQbrY2wvzM/QJVjlQymJqvrJAXQeRhLxYKtFD
         9EBg==
X-Gm-Message-State: AOJu0Yxz5bs569iO8cI8OFP0r3m+UwNFWeVjXb8MNPOPhsI0r+hISzxe
	sPLFUv0UjiM7tMRg+TKdW9OKeAUFxgLdO2PhRDJD+BuPP8niS8yyTAml4lQgBbYnGEQGrmVvHAL
	5P2C5
X-Gm-Gg: ASbGnctDY2D1Igqg4mv2xIHJHHeFFq8IiSbwaBzFR59RKw9lHSouWfiMAvXAySVPmaH
	IbAc3v9BMftYXUTteq8lLOFSXQXHeNWIlbKojNfIdVTUj4Vdr/rdueARh74noviB9V+GcPCk2KD
	qrWRIjix3f5QwYt5aVb6ey2bD73KE91uKTtA8GFQzWGcvgfdXC/E0V3LStIdD6KELn4w9u7Dwi7
	hdyh5ymQ7kwvR20P4g12sRcNL1vafNMhjSD+Dwzs786Awt4pCLQMKjlUKExwJEt93uO/+Pmryuf
	PwoNiDSzzB+HA6eF1HckHqFGNpttLR6mKYy3Mi4nU+R1OWfHXLxmtFCCulE6llXtV/R8hyUv0g7
	9UEakhm9d77WL2DaRNY1Y/wF9
X-Google-Smtp-Source: AGHT+IEHACBXvZ6nN5cOYjhkwRZsnZ73a2rxslMzi+0FWMzaaFZYujyaVU6cWpl46RLba6iJk8zPUQ==
X-Received: by 2002:a17:902:d490:b0:24e:13f6:23e with SMTP id d9443c01a7336-2516d52d43fmr141428995ad.8.1757446215261;
        Tue, 09 Sep 2025 12:30:15 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c560:31a3:4ee8:6083])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25a2b0e5965sm5093855ad.143.2025.09.09.12.30.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 12:30:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/5] llvm: fix typo in CVE-2024-0151.patch
Date: Tue,  9 Sep 2025 12:30:02 -0700
Message-ID: <77f29f8fea58de40459186952d25279877ce4994.1757446071.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1757446071.git.steve@sakoman.com>
References: <cover.1757446071.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 19:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223136

From: Gyorgy Sarvari <skandigraun@gmail.com>

During backporting the patch, accidentally a variable was removed.
In case the recipe is compiled for 32-bit Arm target, compilation
fails with the following error:

3.0.1-r0/git/llvm/lib/Target/ARM/ARMISelLowering.cpp:4481:13: error: 'RegVT' was not declared in this scope
|  4481 |         if (RegVT == MVT::f16 || RegVT == MVT::bf16)
|       |             ^~~~~

This patch corrects the patch, and adds back the removed RegVT variable.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
  
-- 
2.43.0


