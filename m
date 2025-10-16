Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B630ECCD199
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 03:09:04 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.4651.1760584137361147430
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 20:08:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NZFfyh8h;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-863fa984ef5so56793085a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 20:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760584136; x=1761188936; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DnBYkbbc+c2LAO9/9Y9Imf2lgC/FiMr+TxSyXsAwGMU=;
        b=NZFfyh8h+ZQd4EOXM6hrAtpuDTX7cFDWuvgF/IwE8FzoED90IK5CymXaUnojHhWbSP
         Rvx8EAnCaGXhaQniKWHxCW3b/3cFl5U3JItKbVuNVyZjDEtx21l5fOeMp1puLYrudMOJ
         8QTWXlLlQuTuPkNvhCDSn3pCGq6jlW9bqYcDnQsSc/s3jNSRacqOYNFjRmE3AWOImT9h
         Cq1crfvohnFYdblnRoBvHCiqOMTVNEkfn0HcLq2rXB4YlPVyFR9bEGX3XO24mCCDpyYF
         XO+N7iet5bvqn4/P/tKMQe2PEvxhNfuXaoTGHblnH5NzqYJBVPJBU1nabDBNQuHPZS36
         bBOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760584136; x=1761188936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DnBYkbbc+c2LAO9/9Y9Imf2lgC/FiMr+TxSyXsAwGMU=;
        b=Wd9CP/0XHZYfKsrw+24Wi8a3Uko9568EG0N2XuVG0+DIFKy1CAKr73NbirvTToRlUp
         oVZuauVFnB0a4A9CSh4HawVM8/mTvTfebTGR0qrTy6S3fGEodi27YxkJlCxIIwk14LVN
         Y6ykvCuHeth4Pi7XTIjqc1sNHdCEEmLLiXhBjtatnSalpr0DZeoA0Qm8CeCZCx8QAoai
         6VxIqCzKJxskGhKgydFF7sM+IVJnEQsLctKhnG24P0+Ll7Sw7MwjeOSqdEKiZE8mmSk6
         uojMo8RwDQAJu1qMeoa1JLyZmR9Wz0GjoOqtBD+/YVZyHvIszfntoiTfYL6M4jB7GTSE
         zW3A==
X-Gm-Message-State: AOJu0YzMeqXpqx0p9JDNcVrgsqNb2KXIGpeFd8R3mTQYKzGEX5/LMN64
	fzLbZE9B+Rwy5sdx+xJp6mv6tPVka2QnAg3FxKBhEI5BMAQbtaGgBug6
X-Gm-Gg: ASbGncslfEYVC/zWFyEThHMA5XzZirjtxH4kcM9wHPm8y4p1nQEImF21VTUA/7fEDqx
	Evru8kqeK5kXT5FjElvfHECpprJQjMVSe+tiL6B9Xfp1/4xg5lOagTU2Np0V12bdVoFfaPet932
	cK9cMS9dgs+f/3S3Tr6uzIZ30OpSZyYVPnOI65TumFG4LfoG7je0tX/9/VDYat1UW8f4MykeECr
	COCSIunrNAsbRlMTOv7E+bSugTeNDYEyQculIguAZMaDI9dZYJzjMVSe/B2bxidVoVhwJF2tZar
	RyXjC9LM3BfQBE65+Zz008srfGP5wZTXWmGb+42JI8H9F0XjUVUUd8zH483Idh4FQ27NR9l9O9n
	cAWEWOvpMpOKSePu+LU+i7naYylsNmVxiLAFipwey+pa9n/t8/c2QjKu+Nb82ZgNhfBnUvZ4odi
	c7HQqrxFDfpCGkjwZjDqF9kGulIAKkRvKs6gCnbYSEFM+O2IdKqcMGeVmCQBYCVGYXYUmfcy6c7
	GY/BwjOyQ1pLq0Hn0gLkMZW9Q==
X-Google-Smtp-Source: AGHT+IHD05qjDK1gbKrzFXismEqOEgg0KlB5ZoUE2rETM+/BtFo9UMsFROEsinBqgH45b5gLU9ZF0Q==
X-Received: by 2002:a05:622a:1f0a:b0:4d3:3ecd:efd0 with SMTP id d75a77b69052e-4e6eaccf9e8mr444730731cf.6.1760584136212;
        Wed, 15 Oct 2025 20:08:56 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c012a39d9sm30824986d6.44.2025.10.15.20.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 20:08:54 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/11] linux-yocto/6.12: update CVE exclusions (6.12.52)
Date: Wed, 15 Oct 2025 23:08:41 -0400
Message-Id: <46c6aba70c43ff7f181ee686cf1da427400925d5.1760583881.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1760583881.git.bruce.ashfield@gmail.com>
References: <cover.1760583881.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 03:09:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224923

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 10 changes (9 new | 1 updated): - 9 new CVEs: CVE-2025-42901, CVE-2025-42902, CVE-2025-42903, CVE-2025-42906, CVE-2025-42908, CVE-2025-42909, CVE-2025-42910, CVE-2025-42937, CVE-2025-42939 - 1 updated CVEs: CVE-2025-42907
        Date: Tue, 14 Oct 2025 00:35:23 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.12.inc              | 58 ++++++++++++-------
 1 file changed, 36 insertions(+), 22 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index a5ccb609b6..f84d42cfe1 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-10-07 17:30:26.724165+00:00 for kernel version 6.12.51
-# From linux_kernel_cves cve_2025-10-07_1700Z
+# Generated at 2025-10-14 01:23:30.027767+00:00 for kernel version 6.12.52
+# From linux_kernel_cves 2025-10-14_baseline-1-gddc0a257837
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.12.51"
+    this_version = "6.12.52"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -4648,11 +4648,11 @@ CVE_STATUS[CVE-2022-50228] = "fixed-version: Fixed from version 6.0"
 
 CVE_STATUS[CVE-2022-50229] = "fixed-version: Fixed from version 6.0"
 
-# CVE-2022-50230 has no known resolution
+CVE_STATUS[CVE-2022-50230] = "fixed-version: Fixed from version 6.0"
 
 CVE_STATUS[CVE-2022-50231] = "fixed-version: Fixed from version 6.0"
 
-# CVE-2022-50232 has no known resolution
+CVE_STATUS[CVE-2022-50232] = "fixed-version: Fixed from version 6.0"
 
 CVE_STATUS[CVE-2022-50233] = "fixed-version: Fixed from version 6.0"
 
@@ -4664,7 +4664,7 @@ CVE_STATUS[CVE-2022-50236] = "fixed-version: Fixed from version 6.2"
 
 CVE_STATUS[CVE-2022-50239] = "fixed-version: Fixed from version 6.1"
 
-# CVE-2022-50240 has no known resolution
+CVE_STATUS[CVE-2022-50240] = "fixed-version: Fixed from version 6.0"
 
 CVE_STATUS[CVE-2022-50241] = "fixed-version: Fixed from version 6.1"
 
@@ -4858,8 +4858,6 @@ CVE_STATUS[CVE-2022-50336] = "fixed-version: Fixed from version 6.2"
 
 CVE_STATUS[CVE-2022-50337] = "fixed-version: Fixed from version 6.2"
 
-# CVE-2022-50338 has no known resolution
-
 CVE_STATUS[CVE-2022-50339] = "fixed-version: Fixed from version 6.1"
 
 CVE_STATUS[CVE-2022-50340] = "fixed-version: Fixed from version 6.2"
@@ -4938,7 +4936,7 @@ CVE_STATUS[CVE-2022-50378] = "fixed-version: Fixed from version 6.1"
 
 CVE_STATUS[CVE-2022-50379] = "fixed-version: Fixed from version 6.1"
 
-# CVE-2022-50380 has no known resolution
+CVE_STATUS[CVE-2022-50380] = "fixed-version: Fixed from version 6.1"
 
 CVE_STATUS[CVE-2022-50381] = "fixed-version: Fixed from version 6.2"
 
@@ -5074,8 +5072,6 @@ CVE_STATUS[CVE-2022-50448] = "fixed-version: Fixed from version 6.1"
 
 CVE_STATUS[CVE-2022-50449] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2022-50450] = "fixed-version: Fixed from version 6.2"
-
 CVE_STATUS[CVE-2022-50451] = "fixed-version: Fixed from version 6.2"
 
 CVE_STATUS[CVE-2022-50452] = "fixed-version: Fixed from version 6.1"
@@ -5084,8 +5080,6 @@ CVE_STATUS[CVE-2022-50453] = "fixed-version: Fixed from version 6.2"
 
 CVE_STATUS[CVE-2022-50454] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2022-50455] = "fixed-version: Fixed from version 6.2"
-
 CVE_STATUS[CVE-2022-50456] = "fixed-version: Fixed from version 6.2"
 
 CVE_STATUS[CVE-2022-50457] = "fixed-version: Fixed from version 6.2"
@@ -5148,8 +5142,6 @@ CVE_STATUS[CVE-2022-50485] = "fixed-version: Fixed from version 6.2"
 
 CVE_STATUS[CVE-2022-50486] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2022-50487] = "fixed-version: Fixed from version 6.1"
-
 CVE_STATUS[CVE-2022-50488] = "fixed-version: Fixed from version 6.2"
 
 CVE_STATUS[CVE-2022-50489] = "fixed-version: Fixed from version 6.1"
@@ -5176,8 +5168,6 @@ CVE_STATUS[CVE-2022-50500] = "fixed-version: Fixed from version 6.1"
 
 CVE_STATUS[CVE-2022-50501] = "fixed-version: Fixed from version 6.2"
 
-# CVE-2022-50502 has no known resolution
-
 CVE_STATUS[CVE-2022-50503] = "fixed-version: Fixed from version 6.2"
 
 CVE_STATUS[CVE-2022-50504] = "fixed-version: Fixed from version 6.2"
@@ -7114,7 +7104,7 @@ CVE_STATUS[CVE-2023-53467] = "fixed-version: Fixed from version 6.3"
 
 CVE_STATUS[CVE-2023-53468] = "fixed-version: Fixed from version 6.3"
 
-# CVE-2023-53469 has no known resolution
+CVE_STATUS[CVE-2023-53469] = "fixed-version: Fixed from version 6.5"
 
 CVE_STATUS[CVE-2023-53470] = "fixed-version: Fixed from version 6.4"
 
@@ -7458,7 +7448,7 @@ CVE_STATUS[CVE-2023-53640] = "fixed-version: Fixed from version 6.4"
 
 CVE_STATUS[CVE-2023-53641] = "fixed-version: Fixed from version 6.4"
 
-# CVE-2023-53642 has no known resolution
+CVE_STATUS[CVE-2023-53642] = "fixed-version: Fixed from version 6.4"
 
 CVE_STATUS[CVE-2023-53643] = "fixed-version: Fixed from version 6.3"
 
@@ -14388,7 +14378,7 @@ CVE_STATUS[CVE-2025-21986] = "cpe-stable-backport: Backported in 6.12.20"
 
 CVE_STATUS[CVE-2025-21987] = "cpe-stable-backport: Backported in 6.12.18"
 
-# CVE-2025-21988 has no known resolution
+CVE_STATUS[CVE-2025-21988] = "cpe-stable-backport: Backported in 6.12.20"
 
 CVE_STATUS[CVE-2025-21989] = "cpe-stable-backport: Backported in 6.12.20"
 
@@ -15448,7 +15438,7 @@ CVE_STATUS[CVE-2025-38103] = "cpe-stable-backport: Backported in 6.12.34"
 
 CVE_STATUS[CVE-2025-38104] = "cpe-stable-backport: Backported in 6.12.39"
 
-# CVE-2025-38105 needs backporting (fixed from 6.16)
+CVE_STATUS[CVE-2025-38105] = "cpe-stable-backport: Backported in 6.12.52"
 
 CVE_STATUS[CVE-2025-38106] = "cpe-stable-backport: Backported in 6.12.34"
 
@@ -17260,6 +17250,30 @@ CVE_STATUS[CVE-2025-39952] = "cpe-stable-backport: Backported in 6.12.49"
 
 CVE_STATUS[CVE-2025-39953] = "cpe-stable-backport: Backported in 6.12.49"
 
+CVE_STATUS[CVE-2025-39954] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-39955] = "cpe-stable-backport: Backported in 6.12.49"
+
+CVE_STATUS[CVE-2025-39956] = "cpe-stable-backport: Backported in 6.12.49"
+
+CVE_STATUS[CVE-2025-39957] = "cpe-stable-backport: Backported in 6.12.49"
+
+# CVE-2025-39958 needs backporting (fixed from 6.17)
+
+CVE_STATUS[CVE-2025-39959] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-39960] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-39961] = "cpe-stable-backport: Backported in 6.12.49"
+
+CVE_STATUS[CVE-2025-39962] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-39963] = "cpe-stable-backport: Backported in 6.12.49"
+
+CVE_STATUS[CVE-2025-39964] = "cpe-stable-backport: Backported in 6.12.49"
+
+CVE_STATUS[CVE-2025-39965] = "cpe-stable-backport: Backported in 6.12.50"
+
 CVE_STATUS[CVE-2025-39989] = "cpe-stable-backport: Backported in 6.12.23"
 
 # CVE-2025-40014 needs backporting (fixed from 6.15)
@@ -17270,5 +17284,5 @@ CVE_STATUS[CVE-2025-40300] = "cpe-stable-backport: Backported in 6.12.47"
 
 # CVE-2025-40325 needs backporting (fixed from 6.15)
 
-# CVE-2025-40364 has no known resolution
+CVE_STATUS[CVE-2025-40364] = "cpe-stable-backport: Backported in 6.12.14"
 
-- 
2.39.2


