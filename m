Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A079DFC0376
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:45:33 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.698.1776959131119628606
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 08:45:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=avb/C9AZ;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-50fbd79350dso26749381cf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 08:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776959130; x=1777563930; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KF0n7MZlQ6YTtg4pXSdRCRO/u7wPAwWV/g1Gw5B5iGI=;
        b=avb/C9AZEeTfHIRkGdpe4FMfjB0h0lidVPG4poaQau69BS/gJaAMmcJYvRrgfWgcIB
         4aCzGgvQI9UvrruL+s7w27GpLIsq/Dd7IumvkM1VYfv945mI5d8oW7P1a18PgsBcUMA4
         t8S735l0KU5M7+RXuh/CggUIUAl+KY2Y4I/2bZxVvXgoJPHMbrKE5yqvFDzk4w40J9lk
         3SVDqPqe7vD86WVqmafeOxsiSKHr9c8t3noj5lIdtqIhLBadl+RqTHxTTz56aMuK6c6k
         NNXfAi6GClm6X3VBg7uH2QXLq4RKPGmlMZAJmeLWflQT3ZKX1HjNB7YGIMjbCIspf3+q
         f/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776959130; x=1777563930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KF0n7MZlQ6YTtg4pXSdRCRO/u7wPAwWV/g1Gw5B5iGI=;
        b=fVvVJTUZly3O1Lb5bq3Sl9VAKxC+Tn2u8/fkhv+IPOg0sd0lyvF/7Buewl4lw6OkEC
         417nWBCdP+HaAWMK2jMf+DrEQe+khyNv4+qJ9IIxUlJMRyvs/VBGPOUTIGQRvlVEtEnn
         WkTXfcyAvWnbJiGOiRCobM/5fpMlNaCNLP1FbEgbTWmhwanxPxge0TJiwE3JWKwU96pM
         i2bi6wqNdKd4gGOKxUTBc4XktDj2ndHcssc1zWp0aZ1+LWyErbDh/9e37vGBpSp2znUP
         havl3bBmxjGE4Lzp5S5MUhWO1kAkboD+Vup1ijqZ0YQuJuHs+8sHW9vqUplSwWJ/0od8
         MFsA==
X-Gm-Message-State: AOJu0YytInCLJKK1nMy20J9SEnkE0JY5XT/l9b/SzVGHeRJw+7dYjoNV
	CB/zVdLl/9qpRI2w2JQVE46QlxX/byzdayq87fcvwswIAUpjUUOPZ8p7jEjxbkaA
X-Gm-Gg: AeBDiet45MCqBPXpizO091aSrNMxBj/6z0EEXrd0/B/COs9zgxNyn1qhYAXEenJry7U
	DbcWf5SZa6OHIN2y1ILK+3KD5aZFaaawpLPyEa0tUgsHIwWxlaO7mt6XD/0POdQWjm65bOAFd+J
	WFlLIAKS4vMuM3qHnI1bzzqi+f718+eR9WJ2ILLMPGq1mlFzPI/l08UqLAEbZ1CVbJ5fUVOsj4T
	8HLd6Al4OiW7WEBksThdhCcGzZgZI1wY4JBXOAVkiLsUqBhV8AzSTKfqAeSGaSXFT7aE70ZfMoa
	KyAJGg5ZvRY4GA006tdgqIZHFpFK9UFjuJvbT1Ax8nWAcLmG2N0QI3pJb9dkKRFR01d6vynBfgI
	e+9Or0gNhsWu305ccSYHvd1xed7wecCVaJqyoWihYdotBakBlH4+Db71SCGjzIUcH0b03uhzzyt
	gBLVdNpkd8B6ConQCrSsoLJ9TfuVCh7URh1x+s3ppndDZaKY4wQ5i2A1QcThzGHGkRh31xRuTif
	YEhgVQgaUo7bXfNzQ3i9msf/3v6/WbJFxkebWOwXOR89Xd8jI/KtvH1d73ERIU6hLvyVQ==
X-Received: by 2002:a05:622a:230e:b0:4ff:c08a:52c4 with SMTP id d75a77b69052e-50e36b42814mr403225021cf.18.1776959129819;
        Thu, 23 Apr 2026 08:45:29 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50fb416b3f5sm74400031cf.28.2026.04.23.08.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:45:28 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
Subject: [openembedded-core][whinlatter][PATCH 12/18] linux-yocto/6.12: update CVE exclusions (6.12.79)
Date: Thu, 23 Apr 2026 11:45:03 -0400
Message-ID: <20260423154509.1933646-13-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423154509.1933646-1-bruce.ashfield@gmail.com>
References: <20260423154509.1933646-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 15:45:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235811

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 55 changes (8 new | 47 updated): - 8 new CVEs: CVE-2026-33044, CVE-2026-33045, CVE-2026-33654, CVE-2026-33739, CVE-2026-33765, CVE-2026-33868, CVE-2026-34205, CVE-2026-34475 - 47 updated CVEs: CVE-2022-2713, CVE-2023-7340, CVE-2025-15612, CVE-2025-15615, CVE-2025-15616, CVE-2025-15617, CVE-2025-4393, CVE-2025-4394, CVE-2025-53521, CVE-2025-59028, CVE-2025-59031, CVE-2025-59032, CVE-2025-67030, CVE-2025-70887, CVE-2026-0394, CVE-2026-1556, CVE-2026-20670, CVE-2026-20692, CVE-2026-22738, CVE-2026-22742, CVE-2026-22743, CVE-2026-22744, CVE-2026-24031, CVE-2026-27855, CVE-2026-28831, CVE-2026-28867, CVE-2026-28870, CVE-2026-28871, CVE-2026-28892, CVE-2026-28893, CVE-2026-29055, CVE-2026-2436, CVE-2026-2485, CVE-2026-30304, CVE-2026-30587, CVE-2026-32859, CVE-2026-33366, CVE-2026-33529, CVE-2026-33531, CVE-2026-33537, CVE-2026-33559, CVE-2026-3098, CVE-2026-3622, CVE-2026-3650, CVE-2026-4346, CVE-2026-4926, CVE-2026-4982
        Date: Fri, 27 Mar 2026 19:52:09 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.12.inc              | 376 ++++++++++++++++--
 1 file changed, 350 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index 5fa3966719..bba789c9e5 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2026-03-17 19:07:54.629545+00:00 for kernel version 6.12.77
-# From linux_kernel_cves cve_2026-03-17_1800Z-2-g4ae4487ca91
+# Generated at 2026-03-27 19:55:47.691205+00:00 for kernel version 6.12.79
+# From linux_kernel_cves cve_2026-03-27_1900Z-2-gb6d5823e23a
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.12.77"
+    this_version = "6.12.79"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -2770,8 +2770,6 @@ CVE_STATUS[CVE-2022-49265] = "fixed-version: Fixed from version 5.18"
 
 CVE_STATUS[CVE-2022-49266] = "fixed-version: Fixed from version 5.18"
 
-CVE_STATUS[CVE-2022-49267] = "fixed-version: Fixed from version 5.18"
-
 CVE_STATUS[CVE-2022-49268] = "fixed-version: Fixed from version 5.18"
 
 CVE_STATUS[CVE-2022-49269] = "fixed-version: Fixed from version 5.18"
@@ -9916,8 +9914,6 @@ CVE_STATUS[CVE-2024-27040] = "fixed-version: Fixed from version 6.9"
 
 CVE_STATUS[CVE-2024-27041] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2024-27042] = "fixed-version: Fixed from version 6.9"
-
 CVE_STATUS[CVE-2024-27043] = "fixed-version: Fixed from version 6.9"
 
 CVE_STATUS[CVE-2024-27044] = "fixed-version: Fixed from version 6.9"
@@ -17552,7 +17548,7 @@ CVE_STATUS[CVE-2025-38424] = "cpe-stable-backport: Backported in 6.12.35"
 
 CVE_STATUS[CVE-2025-38425] = "cpe-stable-backport: Backported in 6.12.35"
 
-# CVE-2025-38426 needs backporting (fixed from 6.16)
+CVE_STATUS[CVE-2025-38426] = "cpe-stable-backport: Backported in 6.12.78"
 
 CVE_STATUS[CVE-2025-38427] = "cpe-stable-backport: Backported in 6.12.35"
 
@@ -17950,7 +17946,7 @@ CVE_STATUS[CVE-2025-38625] = "cpe-stable-backport: Backported in 6.12.42"
 
 CVE_STATUS[CVE-2025-38626] = "cpe-stable-backport: Backported in 6.12.42"
 
-# CVE-2025-38627 needs backporting (fixed from 6.17)
+CVE_STATUS[CVE-2025-38627] = "cpe-stable-backport: Backported in 6.12.78"
 
 CVE_STATUS[CVE-2025-38628] = "cpe-stable-backport: Backported in 6.12.42"
 
@@ -18352,7 +18348,7 @@ CVE_STATUS[CVE-2025-39761] = "cpe-stable-backport: Backported in 6.12.43"
 
 CVE_STATUS[CVE-2025-39763] = "cpe-stable-backport: Backported in 6.12.43"
 
-# CVE-2025-39764 needs backporting (fixed from 6.17)
+CVE_STATUS[CVE-2025-39764] = "cpe-stable-backport: Backported in 6.12.78"
 
 CVE_STATUS[CVE-2025-39765] = "cpe-stable-backport: Backported in 6.12.44"
 
@@ -18828,7 +18824,7 @@ CVE_STATUS[CVE-2025-40003] = "cpe-stable-backport: Backported in 6.12.54"
 
 CVE_STATUS[CVE-2025-40004] = "cpe-stable-backport: Backported in 6.12.53"
 
-# CVE-2025-40005 needs backporting (fixed from 6.17)
+CVE_STATUS[CVE-2025-40005] = "cpe-stable-backport: Backported in 6.12.78"
 
 CVE_STATUS[CVE-2025-40006] = "cpe-stable-backport: Backported in 6.12.50"
 
@@ -19086,7 +19082,7 @@ CVE_STATUS[CVE-2025-40133] = "cpe-stable-backport: Backported in 6.12.55"
 
 CVE_STATUS[CVE-2025-40134] = "cpe-stable-backport: Backported in 6.12.53"
 
-# CVE-2025-40135 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-40135] = "cpe-stable-backport: Backported in 6.12.78"
 
 # CVE-2025-40136 needs backporting (fixed from 6.18)
 
@@ -19108,13 +19104,13 @@ CVE_STATUS[CVE-2025-40145] = "fixed-version: only affects 6.15 onwards"
 
 # CVE-2025-40146 needs backporting (fixed from 6.18)
 
-# CVE-2025-40147 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-40147] = "cpe-stable-backport: Backported in 6.12.78"
 
 CVE_STATUS[CVE-2025-40148] = "fixed-version: only affects 6.16 onwards"
 
 CVE_STATUS[CVE-2025-40149] = "cpe-stable-backport: Backported in 6.12.66"
 
-# CVE-2025-40150 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-40150] = "cpe-stable-backport: Backported in 6.12.78"
 
 CVE_STATUS[CVE-2025-40151] = "fixed-version: only affects 6.17 onwards"
 
@@ -19682,7 +19678,7 @@ CVE_STATUS[CVE-2025-68237] = "cpe-stable-backport: Backported in 6.12.60"
 
 CVE_STATUS[CVE-2025-68238] = "cpe-stable-backport: Backported in 6.12.60"
 
-# CVE-2025-68239 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-68239] = "cpe-stable-backport: Backported in 6.12.78"
 
 CVE_STATUS[CVE-2025-68240] = "cpe-stable-backport: Backported in 6.12.59"
 
@@ -19844,7 +19840,7 @@ CVE_STATUS[CVE-2025-68332] = "cpe-stable-backport: Backported in 6.12.62"
 
 CVE_STATUS[CVE-2025-68333] = "cpe-stable-backport: Backported in 6.12.68"
 
-# CVE-2025-68334 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-68334] = "cpe-stable-backport: Backported in 6.12.78"
 
 CVE_STATUS[CVE-2025-68335] = "cpe-stable-backport: Backported in 6.12.62"
 
@@ -20312,7 +20308,7 @@ CVE_STATUS[CVE-2025-71150] = "cpe-stable-backport: Backported in 6.12.64"
 
 CVE_STATUS[CVE-2025-71151] = "cpe-stable-backport: Backported in 6.12.64"
 
-# CVE-2025-71152 needs backporting (fixed from 6.19)
+CVE_STATUS[CVE-2025-71152] = "cpe-stable-backport: Backported in 6.12.78"
 
 CVE_STATUS[CVE-2025-71153] = "cpe-stable-backport: Backported in 6.12.64"
 
@@ -20330,7 +20326,7 @@ CVE_STATUS[CVE-2025-71159] = "fixed-version: only affects 6.18 onwards"
 
 CVE_STATUS[CVE-2025-71160] = "cpe-stable-backport: Backported in 6.12.66"
 
-# CVE-2025-71161 needs backporting (fixed from 6.19)
+CVE_STATUS[CVE-2025-71161] = "cpe-stable-backport: Backported in 6.12.78"
 
 CVE_STATUS[CVE-2025-71162] = "cpe-stable-backport: Backported in 6.12.67"
 
@@ -20388,7 +20384,7 @@ CVE_STATUS[CVE-2025-71204] = "cpe-stable-backport: Backported in 6.12.70"
 
 CVE_STATUS[CVE-2025-71220] = "cpe-stable-backport: Backported in 6.12.70"
 
-# CVE-2025-71221 needs backporting (fixed from 6.19)
+CVE_STATUS[CVE-2025-71221] = "cpe-stable-backport: Backported in 6.12.78"
 
 CVE_STATUS[CVE-2025-71222] = "cpe-stable-backport: Backported in 6.12.70"
 
@@ -20422,6 +20418,18 @@ CVE_STATUS[CVE-2025-71238] = "cpe-stable-backport: Backported in 6.12.74"
 
 CVE_STATUS[CVE-2025-71239] = "cpe-stable-backport: Backported in 6.12.75"
 
+CVE_STATUS[CVE-2025-71265] = "cpe-stable-backport: Backported in 6.12.75"
+
+CVE_STATUS[CVE-2025-71266] = "cpe-stable-backport: Backported in 6.12.75"
+
+CVE_STATUS[CVE-2025-71267] = "cpe-stable-backport: Backported in 6.12.75"
+
+CVE_STATUS[CVE-2025-71268] = "cpe-stable-backport: Backported in 6.12.70"
+
+# CVE-2025-71269 needs backporting (fixed from 6.19)
+
+CVE_STATUS[CVE-2025-71270] = "cpe-stable-backport: Backported in 6.12.70"
+
 CVE_STATUS[CVE-2026-22976] = "cpe-stable-backport: Backported in 6.12.66"
 
 CVE_STATUS[CVE-2026-22977] = "cpe-stable-backport: Backported in 6.12.66"
@@ -20478,7 +20486,7 @@ CVE_STATUS[CVE-2026-23002] = "cpe-stable-backport: Backported in 6.12.67"
 
 CVE_STATUS[CVE-2026-23003] = "cpe-stable-backport: Backported in 6.12.67"
 
-# CVE-2026-23004 needs backporting (fixed from 6.19)
+CVE_STATUS[CVE-2026-23004] = "cpe-stable-backport: Backported in 6.12.78"
 
 CVE_STATUS[CVE-2026-23005] = "cpe-stable-backport: Backported in 6.12.67"
 
@@ -20602,7 +20610,7 @@ CVE_STATUS[CVE-2026-23064] = "cpe-stable-backport: Backported in 6.12.68"
 
 CVE_STATUS[CVE-2026-23065] = "cpe-stable-backport: Backported in 6.12.68"
 
-# CVE-2026-23066 needs backporting (fixed from 6.19)
+CVE_STATUS[CVE-2026-23066] = "cpe-stable-backport: Backported in 6.12.78"
 
 CVE_STATUS[CVE-2026-23067] = "fixed-version: only affects 6.16 onwards"
 
@@ -20610,7 +20618,7 @@ CVE_STATUS[CVE-2026-23068] = "cpe-stable-backport: Backported in 6.12.68"
 
 CVE_STATUS[CVE-2026-23069] = "cpe-stable-backport: Backported in 6.12.68"
 
-# CVE-2026-23070 needs backporting (fixed from 6.19)
+CVE_STATUS[CVE-2026-23070] = "cpe-stable-backport: Backported in 6.12.78"
 
 CVE_STATUS[CVE-2026-23071] = "cpe-stable-backport: Backported in 6.12.68"
 
@@ -20678,7 +20686,7 @@ CVE_STATUS[CVE-2026-23101] = "cpe-stable-backport: Backported in 6.12.68"
 
 CVE_STATUS[CVE-2026-23103] = "cpe-stable-backport: Backported in 6.12.68"
 
-# CVE-2026-23104 needs backporting (fixed from 6.19)
+CVE_STATUS[CVE-2026-23104] = "cpe-stable-backport: Backported in 6.12.78"
 
 CVE_STATUS[CVE-2026-23105] = "cpe-stable-backport: Backported in 6.12.68"
 
@@ -20746,7 +20754,7 @@ CVE_STATUS[CVE-2026-23136] = "cpe-stable-backport: Backported in 6.12.66"
 
 # CVE-2026-23137 needs backporting (fixed from 6.19)
 
-# CVE-2026-23138 needs backporting (fixed from 6.19)
+CVE_STATUS[CVE-2026-23138] = "cpe-stable-backport: Backported in 6.12.78"
 
 CVE_STATUS[CVE-2026-23139] = "cpe-stable-backport: Backported in 6.12.66"
 
@@ -20784,7 +20792,7 @@ CVE_STATUS[CVE-2026-23155] = "cpe-stable-backport: Backported in 6.12.69"
 
 CVE_STATUS[CVE-2026-23156] = "cpe-stable-backport: Backported in 6.12.69"
 
-# CVE-2026-23157 needs backporting (fixed from 6.19)
+CVE_STATUS[CVE-2026-23157] = "cpe-stable-backport: Backported in 6.12.78"
 
 CVE_STATUS[CVE-2026-23158] = "cpe-stable-backport: Backported in 6.12.69"
 
@@ -20952,5 +20960,321 @@ CVE_STATUS[CVE-2026-23239] = "cpe-stable-backport: Backported in 6.12.75"
 
 CVE_STATUS[CVE-2026-23240] = "cpe-stable-backport: Backported in 6.12.75"
 
-CVE_STATUS[CVE-2026-23241] = "cpe-stable-backport: Backported in 6.12.75"
+CVE_STATUS[CVE-2026-23241] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-23242] = "cpe-stable-backport: Backported in 6.12.75"
+
+CVE_STATUS[CVE-2026-23243] = "cpe-stable-backport: Backported in 6.12.75"
+
+CVE_STATUS[CVE-2026-23244] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23245] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23246] = "cpe-stable-backport: Backported in 6.12.77"
+
+# CVE-2026-23247 needs backporting (fixed from 7.0rc3)
+
+CVE_STATUS[CVE-2026-23248] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-23249] = "cpe-stable-backport: Backported in 6.12.75"
+
+CVE_STATUS[CVE-2026-23250] = "cpe-stable-backport: Backported in 6.12.75"
+
+CVE_STATUS[CVE-2026-23251] = "cpe-stable-backport: Backported in 6.12.75"
+
+CVE_STATUS[CVE-2026-23252] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23253] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23254] = "cpe-stable-backport: Backported in 6.12.70"
+
+# CVE-2026-23255 needs backporting (fixed from 6.19)
+
+CVE_STATUS[CVE-2026-23256] = "cpe-stable-backport: Backported in 6.12.70"
+
+CVE_STATUS[CVE-2026-23257] = "cpe-stable-backport: Backported in 6.12.70"
+
+CVE_STATUS[CVE-2026-23258] = "cpe-stable-backport: Backported in 6.12.70"
+
+# CVE-2026-23259 needs backporting (fixed from 6.19)
+
+CVE_STATUS[CVE-2026-23260] = "cpe-stable-backport: Backported in 6.12.70"
+
+CVE_STATUS[CVE-2026-23261] = "cpe-stable-backport: Backported in 6.12.70"
+
+CVE_STATUS[CVE-2026-23262] = "cpe-stable-backport: Backported in 6.12.70"
+
+CVE_STATUS[CVE-2026-23263] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-23264] = "cpe-stable-backport: Backported in 6.12.70"
+
+# CVE-2026-23265 needs backporting (fixed from 7.0rc1)
+
+CVE_STATUS[CVE-2026-23266] = "cpe-stable-backport: Backported in 6.12.74"
+
+CVE_STATUS[CVE-2026-23267] = "cpe-stable-backport: Backported in 6.12.74"
+
+CVE_STATUS[CVE-2026-23268] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23269] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23270] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23271] = "cpe-stable-backport: Backported in 6.12.77"
+
+# CVE-2026-23272 needs backporting (fixed from 7.0rc3)
+
+CVE_STATUS[CVE-2026-23273] = "cpe-stable-backport: Backported in 6.12.75"
+
+CVE_STATUS[CVE-2026-23274] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23275] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-23276] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23277] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23278] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23279] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23280] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-23281] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23282] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-23283] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-23284] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23285] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23286] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23287] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23288] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-23289] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23290] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23291] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23292] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23293] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23294] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-23295] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-23296] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23297] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23298] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23299] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-23300] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23301] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-23302 needs backporting (fixed from 7.0rc3)
+
+CVE_STATUS[CVE-2026-23303] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23304] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23305] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-23306] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23307] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23308] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23309] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23310] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23311] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-23312] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23313] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23314] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-23315] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23316] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23317] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23318] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23319] = "cpe-stable-backport: Backported in 6.12.77"
+
+# CVE-2026-23320 needs backporting (fixed from 7.0rc1)
+
+CVE_STATUS[CVE-2026-23321] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23322] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-23323] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-23324] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23325] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23326] = "fixed-version: only affects 6.13 onwards"
+
+# CVE-2026-23327 needs backporting (fixed from 7.0rc2)
+
+CVE_STATUS[CVE-2026-23328] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-23329] = "fixed-version: only affects 6.18 onwards"
+
+# CVE-2026-23330 needs backporting (fixed from 7.0rc3)
+
+CVE_STATUS[CVE-2026-23331] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-23332] = "fixed-version: only affects 6.16 onwards"
+
+# CVE-2026-23333 has no known resolution
+
+CVE_STATUS[CVE-2026-23334] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23335] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23336] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23337] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-23338] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-23339] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23340] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23341] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-23342] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-23343] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23344] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-23345] = "fixed-version: only affects 6.13 onwards"
+
+# CVE-2026-23346 needs backporting (fixed from 7.0rc2)
+
+CVE_STATUS[CVE-2026-23347] = "cpe-stable-backport: Backported in 6.12.77"
+
+# CVE-2026-23348 needs backporting (fixed from 7.0rc2)
+
+CVE_STATUS[CVE-2026-23349] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-23350] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-23351] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23352] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23353] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-23354] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23355] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-23356] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23357] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23358] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-23359] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23360] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23361] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23362] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23363] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23364] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23365] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23366] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-23367] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23368] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23369] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23370] = "cpe-stable-backport: Backported in 6.12.77"
+
+# CVE-2026-23371 needs backporting (fixed from 7.0rc3)
+
+CVE_STATUS[CVE-2026-23372] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23373] = "cpe-stable-backport: Backported in 6.12.77"
+
+# CVE-2026-23374 needs backporting (fixed from 7.0rc3)
+
+CVE_STATUS[CVE-2026-23375] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23376] = "fixed-version: only affects 6.18 onwards"
+
+# CVE-2026-23377 needs backporting (fixed from 7.0rc3)
+
+CVE_STATUS[CVE-2026-23378] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23379] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23380] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23381] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23382] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23383] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23384] = "fixed-version: only affects 6.18 onwards"
+
+# CVE-2026-23385 needs backporting (fixed from 7.0rc3)
+
+CVE_STATUS[CVE-2026-23386] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23387] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23388] = "cpe-stable-backport: Backported in 6.12.77"
+
+# CVE-2026-23389 needs backporting (fixed from 7.0rc3)
+
+CVE_STATUS[CVE-2026-23390] = "cpe-stable-backport: Backported in 6.12.74"
+
+CVE_STATUS[CVE-2026-23391] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23392] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23393] = "cpe-stable-backport: Backported in 6.12.78"
+
+# CVE-2026-23394 needs backporting (fixed from 7.0rc5)
+
+CVE_STATUS[CVE-2026-23395] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23396] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23397] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23398] = "cpe-stable-backport: Backported in 6.12.78"
+
+# CVE-2026-31788 has no known resolution
 
-- 
2.43.0


