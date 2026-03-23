Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD753F4611B
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 13:51:05 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18032.1774273865157661058
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 06:51:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WFP4ryPS;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8cfc40e4158so19111385a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 06:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774273864; x=1774878664; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShUZI5a0OFBCnUkECSMPDF2AGn9cqJnykP3FP/XMi5Q=;
        b=WFP4ryPS+qkKP5BwLkMF8nD5v9YNzt4U16/UwjlSKY8iUb0v54pZXF8hzIT7EyieZB
         DOj9Ybz+72S/q3nXHu3VHanBd+WJmZJjRIb0NT95fRj/wh0aFkUcq6skSk5o8sX4YPaN
         B3NvGlEnmm6ttiEvmPF+1mcjqgK7VyFH2ZFTCYSflRxNxpzbc2bWnMnpd4rWOjOkm+qb
         yEipcIr04jkecWoaaASlDW76/Dahpi/TxqqJGDreaBsZdMjBET1IuI/pbKzo1u1BHdOC
         9MoZgkAvLPDiA0ym6jgVZwpXciyRi2qvJQxUQaWkWdlg2baJr1UR+XWTIcyxJQUez5bg
         rbHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774273864; x=1774878664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ShUZI5a0OFBCnUkECSMPDF2AGn9cqJnykP3FP/XMi5Q=;
        b=hE//sfqYBKVZg2jEn74ZeTBY+mxs+CxDFIyJcnVq5Fk5jUqb0uSnd040aaktQzAnd2
         Q2/7TG2SHvcKo2QtaKr5V9dEbmR9LLYH75PYW+VT7BEPK4RBqZeWpCxA7xCQdwpxTxfH
         n34wluH3k5WXp0GiGSsVKI6cYk8ezbFlZ/mGV5XqGvh+sAqVLvVRMmSRwO9DYLb8BMGq
         bz+M+0QvCFAOuW1CB4W35zJ1ayV0+qLXK3ksFgAHctoINOljEPGP0YK3cU+wLmFgMKjI
         Ww0zL7cuaDmYU0l7LVwvuESVz5VIy5FeGd80/guXH0x35/fz7PRW2R4IknRFq9GO9p4f
         RJAw==
X-Gm-Message-State: AOJu0YxpfOo1BcmHzPjFaPlLrMcIiFACThPvPilhRX/42lWevI6iIJQo
	ajIMyK0gnm6hQVIEdAdRVyZSp9ebZdvc4XlVzGVKLgKsXcNcOxtc7qPN
X-Gm-Gg: ATEYQzzbEkoMiE2pUmnOEMqnxEB2bVGA3LyqjABY/2j6Pt44mz1HPuPKggYlNFGP45k
	RaYWJGsXcf90lmV8i/Zu5GO6TgV1y49ROXcJh1lqQwZySGJf9nhK8T57i4Kg00i1SZO811uUyM7
	GulCram68sbFHPNnBPwu56uoRkRw04iqWM3ykc3Eazg1PRTsclemyCbo+wCAmmQVhcVDObCBqPp
	RPXYWHwq3HLSHCQM8m/O4flRaBUbBQ5jh9juc0x9St8PhndvtCAFT7FVs7mPzOGj6mBo0eeBlbu
	08CiyDL1PVAv+9RpTRH9BOoRUEOexm60AtG6weVHcDgJZDAsZNiz2SOAe0wiHM2kF7UT6NnXG9L
	nsS+9ubQD/9hN61PBK1JxtTOs6hODOA8rZPxvt1kjX1zgPqL2bw6lIUFAmmNVJYKpQa4QgO+DiH
	7CvAWKopNztxhCVFpHHUsYBBsx/wktGIHcp/grotKQxfq+Tulr09qze6AEMlJWFEqUiZKl+DKVM
	3m2xvH1XeFdizEaFjVdTDFV6EZ7V1iMRmfgTEPyDO9kqQIW3hRkqhMorZnuuRIqVBI4jg==
X-Received: by 2002:a05:622a:d5:b0:50b:4c03:7b88 with SMTP id d75a77b69052e-50b4c039511mr113176961cf.67.1774273863954;
        Mon, 23 Mar 2026 06:51:03 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b664cddc3sm17232041cf.5.2026.03.23.06.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:51:03 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 04/11] linux-yocto/6.18: update CVE exclusions (6.18.16)
Date: Mon, 23 Mar 2026 09:50:50 -0400
Message-ID: <20260323135057.1605923-5-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323135057.1605923-1-bruce.ashfield@gmail.com>
References: <20260323135057.1605923-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 13:51:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233722

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 12 changes (4 new | 8 updated): - 4 new CVEs: CVE-2024-14027, CVE-2025-70040, CVE-2025-70060, CVE-2026-3588 - 8 updated CVEs: CVE-2025-69219, CVE-2026-22457, CVE-2026-22460, CVE-2026-27332, CVE-2026-27379, CVE-2026-27382, CVE-2026-27384, CVE-2026-27386
        Date: Mon, 9 Mar 2026 16:04:20 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.18.inc              | 30 ++++++++++++++-----
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.18.inc b/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
index 4afd58e924..e8173c4c9f 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2026-02-23 04:32:17.926406+00:00 for kernel version 6.18.13
-# From linux_kernel_cves cve_2026-02-23_0300Z-2-gda53cb14ddd
+# Generated at 2026-03-09 16:24:50.284184+00:00 for kernel version 6.18.16
+# From linux_kernel_cves cve_2026-03-09_1500Z-2-g02517aa779f
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.18.13"
+    this_version = "6.18.16"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -9032,6 +9032,8 @@ CVE_STATUS[CVE-2023-54326] = "fixed-version: Fixed from version 6.5"
 
 CVE_STATUS[CVE-2023-7324] = "fixed-version: Fixed from version 6.3"
 
+CVE_STATUS[CVE-2024-14027] = "fixed-version: Fixed from version 6.13"
+
 CVE_STATUS[CVE-2024-26581] = "fixed-version: Fixed from version 6.8"
 
 CVE_STATUS[CVE-2024-26582] = "fixed-version: Fixed from version 6.8"
@@ -20396,12 +20398,8 @@ CVE_STATUS[CVE-2025-71224] = "cpe-stable-backport: Backported in 6.18.10"
 
 CVE_STATUS[CVE-2025-71225] = "cpe-stable-backport: Backported in 6.18.10"
 
-CVE_STATUS[CVE-2025-71226] = "cpe-stable-backport: Backported in 6.18.10"
-
 CVE_STATUS[CVE-2025-71227] = "cpe-stable-backport: Backported in 6.18.10"
 
-CVE_STATUS[CVE-2025-71228] = "cpe-stable-backport: Backported in 6.18.10"
-
 CVE_STATUS[CVE-2025-71229] = "cpe-stable-backport: Backported in 6.18.11"
 
 CVE_STATUS[CVE-2025-71230] = "cpe-stable-backport: Backported in 6.18.11"
@@ -20420,6 +20418,8 @@ CVE_STATUS[CVE-2025-71236] = "cpe-stable-backport: Backported in 6.18.11"
 
 CVE_STATUS[CVE-2025-71237] = "cpe-stable-backport: Backported in 6.18.11"
 
+CVE_STATUS[CVE-2025-71238] = "cpe-stable-backport: Backported in 6.18.13"
+
 CVE_STATUS[CVE-2026-22976] = "cpe-stable-backport: Backported in 6.18.6"
 
 CVE_STATUS[CVE-2026-22977] = "cpe-stable-backport: Backported in 6.18.6"
@@ -20930,3 +20930,19 @@ CVE_STATUS[CVE-2026-23229] = "cpe-stable-backport: Backported in 6.18.11"
 
 CVE_STATUS[CVE-2026-23230] = "cpe-stable-backport: Backported in 6.18.11"
 
+CVE_STATUS[CVE-2026-23231] = "cpe-stable-backport: Backported in 6.18.14"
+
+CVE_STATUS[CVE-2026-23232] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-23233] = "cpe-stable-backport: Backported in 6.18.13"
+
+CVE_STATUS[CVE-2026-23234] = "cpe-stable-backport: Backported in 6.18.13"
+
+CVE_STATUS[CVE-2026-23235] = "cpe-stable-backport: Backported in 6.18.13"
+
+CVE_STATUS[CVE-2026-23236] = "cpe-stable-backport: Backported in 6.18.13"
+
+CVE_STATUS[CVE-2026-23237] = "cpe-stable-backport: Backported in 6.18.13"
+
+CVE_STATUS[CVE-2026-23238] = "cpe-stable-backport: Backported in 6.18.13"
+
-- 
2.43.0


