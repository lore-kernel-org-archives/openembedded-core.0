Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5428DFC0342
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:45:33 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.696.1776959124451441469
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 08:45:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sqx8H49H;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-50fb1932b62so28255421cf.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 08:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776959123; x=1777563923; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k236gXRs81CN9ie1/t9yvFXJqJdsZr1mLUPWAFS1JwM=;
        b=sqx8H49HQviEkfhVj4ei7vNyRyFy8t1cUQqwV3jo9zq1uRBU1v3kHCUdxXTN24RQ8v
         FUuh+FLW0eDWveJwUc4yccD5NyOkSUfIihwsdzJsLBbqHiqXvyGnDGKmU6KCQa5Sc7XC
         1Bwfg91oktG5gUduypXP5sBGS689JTW5EeUNBIndNv9aJP6NHIySJmbbQC1nqV1TcE+m
         C7SYJcza3sICBlYWHMSdfOKKp+TyuDkspJnvYgJpwDUTVLiRy9xoYUIHCwpHQQVCJ4y6
         GB9LPvlr9A6eYd59ZWanAEWo9wxO4sC0BpshPqByZsDQjrrf72QBxYpkN+lSbnfRdF/C
         zH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776959123; x=1777563923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k236gXRs81CN9ie1/t9yvFXJqJdsZr1mLUPWAFS1JwM=;
        b=AM5KyLKKTeSB6AB9V+0whvvGpmDFNcyOW25s2guMJr4krRKl2RgCtMtLrcS4HKmWjc
         ATZA1M6SXHBBHToK+RorOaWYLVMmpR7btuhGN0Ov8uUc3s546broSquOXfrozvXACmdv
         iv3AfLQvIuFg/Q51Gjy3ZBmfMCJJFRF+Kidxh0UKdPhfNHPD11c95R5PPfKyUOyMqhuV
         EA5jh3LtlvWYNTuLj4nlnTSShAqjLNjHPPC+FXMntkDr0ndH/4jbpe3Y57Y0n92M+AAc
         9IkH2BoGum9xwawLtllZ3jFmx28cnlKFYuy/dhxCtA/YKlUJCQhnR9o0Nw8OIL/b/jgo
         rGVw==
X-Gm-Message-State: AOJu0YydjQOvnOrpbCI0iPSNoKk7mS4QoJeT5ZbWXR/uM3P3YViZfteL
	G3OoC2Tz4/+cKFpttekAoeWW6KsIH+vSDij2puW4jYcVT0kpp5Ogbr4v
X-Gm-Gg: AeBDieu/p8ZgNCNRDGVeC0mtNXMILNvzRXwzAkWznkY7xq54zIofTzjvLpeCml/O9qd
	q3ugUV5SMlv+iuJHCsjvwbCnvUW1kfLHdiEYIHnNQDsMbt2CHREKa72NVNBE8o8eDMUvvLG7zoU
	vkHMYoJREOpFXzpjG4rCk+eambjAvvyMNRKE0fx1Y8pTp3+9AwR+C6D29UMcmfu22d5NcEdunoM
	JD+P2regDHxgiHZcfmmkSLha/8Nfd1uPb/EjWAKrPlGrJ07XU7BFJRbhlzlmJ62gyxG9YbHwyh0
	G+WFW+azlnAx6joIr4PS4DOz7Yu9nWRIH0tkpfyM/bV9fW9u4lK72gGNJKuFqwXtLTrA3IPIn2P
	g57b2FKc5eF+J81Ma0bZBQgQjNFUba/KAqD2HqY5kiyNC9Tb1MrSIbmN6NrkHycq644ldOlA+4d
	7X9kHy03H5SxGUONMQaEDPHHCH5OA7DkiMv4k4rvLFikm/kHjDIFOeF09qjyMvo6n/bs84kvhJM
	5LSvv+ZAu0bMLm4Jjsmv6W1eLcK1LgRLpmvqPePGPcBp7MokTkiuNeliGvN9GCASnF/+g==
X-Received: by 2002:ac8:5807:0:b0:50b:4b2f:1606 with SMTP id d75a77b69052e-50e36b3da09mr450013221cf.15.1776959121727;
        Thu, 23 Apr 2026 08:45:21 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50fb416b3f5sm74400031cf.28.2026.04.23.08.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:45:20 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
Subject: [openembedded-core][whinlatter][PATCH 08/18] linux-yocto/6.12: update CVE exclusions (6.12.76)
Date: Thu, 23 Apr 2026 11:44:59 -0400
Message-ID: <20260423154509.1933646-9-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423154509.1933646-1-bruce.ashfield@gmail.com>
References: <20260423154509.1933646-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 15:45:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235808

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 3 changes (2 new | 1 updated): - 2 new CVEs: CVE-2025-70031, CVE-2026-0846 - 1 updated CVEs: CVE-2025-7195
        Date: Mon, 9 Mar 2026 19:31:35 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.12.inc              | 30 ++++++++++++++-----
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index c7726e1306..60d337b010 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2026-02-23 05:12:32.087151+00:00 for kernel version 6.12.74
-# From linux_kernel_cves cve_2026-02-23_0400Z-1-g3cbc7410733
+# Generated at 2026-03-09 19:34:33.465338+00:00 for kernel version 6.12.76
+# From linux_kernel_cves cve_2026-03-09_1900Z-1-gab0cca33c43
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.12.74"
+    this_version = "6.12.76"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -9032,6 +9032,8 @@ CVE_STATUS[CVE-2023-54326] = "fixed-version: Fixed from version 6.5"
 
 CVE_STATUS[CVE-2023-7324] = "fixed-version: Fixed from version 6.3"
 
+# CVE-2024-14027 needs backporting (fixed from 6.13)
+
 CVE_STATUS[CVE-2024-26581] = "fixed-version: Fixed from version 6.8"
 
 CVE_STATUS[CVE-2024-26582] = "fixed-version: Fixed from version 6.8"
@@ -20396,12 +20398,8 @@ CVE_STATUS[CVE-2025-71224] = "cpe-stable-backport: Backported in 6.12.70"
 
 CVE_STATUS[CVE-2025-71225] = "cpe-stable-backport: Backported in 6.12.70"
 
-# CVE-2025-71226 needs backporting (fixed from 6.19)
-
 # CVE-2025-71227 needs backporting (fixed from 6.19)
 
-CVE_STATUS[CVE-2025-71228] = "cpe-stable-backport: Backported in 6.12.70"
-
 CVE_STATUS[CVE-2025-71229] = "cpe-stable-backport: Backported in 6.12.72"
 
 CVE_STATUS[CVE-2025-71230] = "fixed-version: only affects 6.13 onwards"
@@ -20420,6 +20418,8 @@ CVE_STATUS[CVE-2025-71236] = "cpe-stable-backport: Backported in 6.12.72"
 
 CVE_STATUS[CVE-2025-71237] = "cpe-stable-backport: Backported in 6.12.72"
 
+CVE_STATUS[CVE-2025-71238] = "cpe-stable-backport: Backported in 6.12.74"
+
 CVE_STATUS[CVE-2026-22976] = "cpe-stable-backport: Backported in 6.12.66"
 
 CVE_STATUS[CVE-2026-22977] = "cpe-stable-backport: Backported in 6.12.66"
@@ -20930,3 +20930,19 @@ CVE_STATUS[CVE-2026-23229] = "cpe-stable-backport: Backported in 6.12.72"
 
 CVE_STATUS[CVE-2026-23230] = "cpe-stable-backport: Backported in 6.12.72"
 
+CVE_STATUS[CVE-2026-23231] = "cpe-stable-backport: Backported in 6.12.75"
+
+CVE_STATUS[CVE-2026-23232] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-23233] = "cpe-stable-backport: Backported in 6.12.74"
+
+CVE_STATUS[CVE-2026-23234] = "cpe-stable-backport: Backported in 6.12.74"
+
+CVE_STATUS[CVE-2026-23235] = "cpe-stable-backport: Backported in 6.12.74"
+
+CVE_STATUS[CVE-2026-23236] = "cpe-stable-backport: Backported in 6.12.74"
+
+CVE_STATUS[CVE-2026-23237] = "cpe-stable-backport: Backported in 6.12.74"
+
+CVE_STATUS[CVE-2026-23238] = "cpe-stable-backport: Backported in 6.12.74"
+
-- 
2.43.0


