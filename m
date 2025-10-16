Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B963FCCD1A1
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 03:08:54 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.4553.1760584132223663116
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 20:08:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XBN7PwPE;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-79a7d439efbso4292536d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 20:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760584131; x=1761188931; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DiO81lBf1Iv05cxHgLnEmMMqK6bZcH5w2BiO/6a6SLc=;
        b=XBN7PwPEU3Auc7w52KIOKhpM6MOvsa1WSSB9Mm4yR2Pq4p6AcVUheAHmGnMxkAEdWT
         n5cW+7jWtRKVr8I7XCsqheWyxjUXKK837z1Ad+gMivcYr88pqYZDggpChAPQCnufViqD
         130WUKSvXd4Z8MIphz9jlbDabKa8UwYDlEc6f6F+ET7W8+tfpzI/3+ISyITZHxSvPj0M
         Xgewz+w7OXuqKfxfkcAmG5c6bipZBBuuBGvBGLPgB2NFigqOzTyot86t40PCMEsjwOIn
         AkbYEaeMF9VKInXss+FbHdCXWXzfwkZXvH43b/IbPixugJ9jnaYBnEaksmQI9slcnFeK
         LEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760584131; x=1761188931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DiO81lBf1Iv05cxHgLnEmMMqK6bZcH5w2BiO/6a6SLc=;
        b=YnJhp16upa0+YRVq6fX8NCnh5ITpmnMqCejxm/bX4YsvAIT4782i5a0v4GqquwRpzU
         28+1I1cNky71nRcx7z944Rhwq5jSLnK9GZcKLDnRIuFIJ+m5jSpIlVRCWj69gPFNgtLP
         p9XcovOOjmwPf4tz4y6rWeiTWPzQ2aJzzjl3oTSazJQXRyDn95Etx2l416xeNYgjElBq
         6rofrXR7espt+ZkZT36QcGaavMnuAx+m+Yp3kXDukqdSw6k+pbePL9O4RVk2r7nc9Sz2
         P7roEClka37lQxsUoDpPDRNZZ9UcfRakabEV6uKXWsWssmq4v8UmllcIv22Y9TMSpPQ3
         YVRQ==
X-Gm-Message-State: AOJu0YzlcJfNJ5CuVazyX0urbOZtrVWjP8xnddsMSWd3XohrtoJ6GRnK
	NclOsgvKLxVir+KTS1uJSDAke1AKGfPDRkblRjZKqOtkZTl3A2slb3vkg70jSFF3kus=
X-Gm-Gg: ASbGnctfh+PNCXTnURgX6qIOhE40N9KfrtJdKEg+yxV1XipwMYExbROG32bodOMa8E3
	d33zV+ssa2QAN5x9W6t6j/p9weFbVhydtryt/MEQnb9GwEN5iGRR8Bxe5hhenA3OJRt27nAGTao
	ktZj849XpBAiYgGg3ndzLLhCgnczoV8fEJxspxgnL0clhcBFnOf9na2sGNTMNmQHsZHiFstuRiG
	vQPK8fku+LPHg66yF1DbyulPGbHyIiVZrM6Af+Vv/x0rlk7+BcUaoiPThymbz8I3Y0QMDP29L4F
	2iy9xIcnBXgDgInJJfl7wYhnQZeTW2mzKG6E1cYqMT6WLeTqcukKtTKNq1/WH2b6g6gyTve+gOH
	gz8VmX4k2gCMMWX29aTAwOmG7wFnj08H2dWXsyjdZSLtQ6jCSubBoNQrPejqG4L+DLgFdT6Bc5c
	7uPmHDU4D3NyWHN5MQOTQEzkuJk8waEv8MvrSkXdNwjCqv3bW/EY5NjGM7RFZg+yc3+ZjR+fA1f
	4a3+VxkjTraCUs=
X-Google-Smtp-Source: AGHT+IG8dF3FNAdpGcVZDrxU9ku462fcRcG3cY0xvjXxzOqBXJzV0ULGpcsu1TuTxHyZrEf1jt7oSQ==
X-Received: by 2002:a05:6214:2682:b0:720:e4bd:d3e6 with SMTP id 6a1803df08f44-87b21073b8cmr398225276d6.15.1760584130685;
        Wed, 15 Oct 2025 20:08:50 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c012a39d9sm30824986d6.44.2025.10.15.20.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 20:08:49 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/11] linux-yocto/6.12: update CVE exclusions (6.12.50)
Date: Wed, 15 Oct 2025 23:08:37 -0400
Message-Id: <f0fe3c251a7e72afc2a279ecaf698fbb3580909f.1760583881.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1760583881.git.bruce.ashfield@gmail.com>
References: <cover.1760583881.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 03:08:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224919

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 15 changes (1 new | 14 updated): - 1 new CVEs: CVE-2025-11344 - 14 updated CVEs: CVE-2025-11293, CVE-2025-11294, CVE-2025-11295, CVE-2025-11325, CVE-2025-11343, CVE-2025-54086, CVE-2025-55191, CVE-2025-58586, CVE-2025-59951, CVE-2025-60967, CVE-2025-61587, CVE-2025-61792, CVE-2025-61984, CVE-2025-61985
        Date: Mon, 6 Oct 2025 18:40:24 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.12.inc              | 696 +++++++++++++++++-
 1 file changed, 662 insertions(+), 34 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index 6c327e489a..59035c47e8 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-09-29 01:53:40.204255+00:00 for kernel version 6.12.49
-# From linux_kernel_cves cve_2025-09-29_0100Z
+# Generated at 2025-10-06 18:40:43.912028+00:00 for kernel version 6.12.50
+# From linux_kernel_cves cve_2025-10-06_1800Z-2-gd3f82236df6
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.12.49"
+    this_version = "6.12.50"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -1530,6 +1530,8 @@ CVE_STATUS[CVE-2021-4453] = "fixed-version: Fixed from version 5.16"
 
 CVE_STATUS[CVE-2021-4454] = "fixed-version: Fixed from version 6.2"
 
+CVE_STATUS[CVE-2021-4460] = "fixed-version: Fixed from version 5.13"
+
 CVE_STATUS[CVE-2022-21546] = "fixed-version: Fixed from version 5.19"
 
 # CVE-2022-26365 has no known resolution
@@ -4870,8 +4872,6 @@ CVE_STATUS[CVE-2022-50343] = "fixed-version: Fixed from version 6.2"
 
 CVE_STATUS[CVE-2022-50344] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2022-50345] = "fixed-version: Fixed from version 6.1"
-
 CVE_STATUS[CVE-2022-50346] = "fixed-version: Fixed from version 6.2"
 
 CVE_STATUS[CVE-2022-50347] = "fixed-version: Fixed from version 6.2"
@@ -4972,8 +4972,6 @@ CVE_STATUS[CVE-2022-50395] = "fixed-version: Fixed from version 6.2"
 
 CVE_STATUS[CVE-2022-50396] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2022-50397] = "fixed-version: Fixed from version 6.1"
-
 CVE_STATUS[CVE-2022-50398] = "fixed-version: Fixed from version 6.1"
 
 CVE_STATUS[CVE-2022-50399] = "fixed-version: Fixed from version 6.1"
@@ -5016,6 +5014,182 @@ CVE_STATUS[CVE-2022-50418] = "fixed-version: Fixed from version 6.1"
 
 CVE_STATUS[CVE-2022-50419] = "fixed-version: Fixed from version 6.1"
 
+CVE_STATUS[CVE-2022-50420] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50421] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50422] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50423] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50424] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2022-50425] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50426] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50427] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50428] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50429] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50430] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50431] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50432] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50433] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50434] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50435] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50436] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50437] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50438] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50439] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50440] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50441] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50442] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50443] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50444] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50445] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50446] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50447] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50448] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50449] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50450] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50451] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50452] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50453] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50454] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50455] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50456] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50457] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50458] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50459] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50460] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50461] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50462] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50463] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50464] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50465] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50466] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50467] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50468] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50469] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50470] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50471] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50472] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50473] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50474] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50475] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50476] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50477] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50478] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50479] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50480] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50481] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50482] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50483] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50484] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50485] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50486] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50487] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50488] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50489] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50490] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50491] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50492] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50493] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50494] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50496] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50497] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50498] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50499] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50500] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50501] = "fixed-version: Fixed from version 6.2"
+
+# CVE-2022-50502 has no known resolution
+
+CVE_STATUS[CVE-2022-50503] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50504] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50505] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50506] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50507] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50508] = "fixed-version: Fixed from version 6.3"
+
 CVE_STATUS[CVE-2023-32246] = "fixed-version: Fixed from version 6.4"
 
 CVE_STATUS[CVE-2023-32249] = "fixed-version: Fixed from version 6.4"
@@ -6806,6 +6980,342 @@ CVE_STATUS[CVE-2023-53446] = "fixed-version: Fixed from version 6.5"
 
 CVE_STATUS[CVE-2023-53447] = "fixed-version: Fixed from version 6.5"
 
+CVE_STATUS[CVE-2023-53448] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53449] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53450] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53451] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53452] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53453] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53454] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53455] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53456] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53457] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53458] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53459] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53460] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53461] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53462] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53463] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53464] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53465] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53466] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53467] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53468] = "fixed-version: Fixed from version 6.3"
+
+# CVE-2023-53469 has no known resolution
+
+CVE_STATUS[CVE-2023-53470] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53471] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53472] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53473] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53474] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53475] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53476] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53477] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53478] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53479] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53480] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53481] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53482] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53483] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53484] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53485] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53486] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53487] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53488] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53489] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53490] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53491] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53492] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53493] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53494] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53495] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53496] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53497] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53498] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53499] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53500] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53501] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53503] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53504] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53505] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53506] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53507] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53508] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53509] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-53510] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53511] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53512] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53513] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53514] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53515] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53516] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53517] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53518] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53519] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53520] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53521] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53522] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53523] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53524] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53525] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53526] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53527] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53528] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53529] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53530] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53531] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53532] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53533] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53534] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53535] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53536] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53537] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53538] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53539] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53540] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53541] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53542] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53543] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53544] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53545] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53546] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53547] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53548] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53549] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-53550] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53551] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53552] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53553] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53554] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53555] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53556] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53557] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53558] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53559] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53560] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53561] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53562] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53563] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53564] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53565] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53566] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53567] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53568] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53569] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53570] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53571] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53572] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53573] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53574] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53575] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53576] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53577] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53578] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53579] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53580] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53581] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53582] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53583] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53584] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53585] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53586] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53587] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53588] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53589] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53590] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53591] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53592] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-53593] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53594] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53595] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53596] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53597] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53598] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53599] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53600] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53601] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53602] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53603] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53604] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53605] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53606] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53607] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53608] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53609] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53610] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53611] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53612] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53613] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53614] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53615] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53616] = "fixed-version: Fixed from version 6.6"
+
 CVE_STATUS[CVE-2024-26581] = "fixed-version: Fixed from version 6.8"
 
 CVE_STATUS[CVE-2024-26582] = "fixed-version: Fixed from version 6.8"
@@ -15656,7 +16166,7 @@ CVE_STATUS[CVE-2025-38582] = "cpe-stable-backport: Backported in 6.12.42"
 
 CVE_STATUS[CVE-2025-38583] = "cpe-stable-backport: Backported in 6.12.42"
 
-# CVE-2025-38584 needs backporting (fixed from 6.17rc1)
+# CVE-2025-38584 needs backporting (fixed from 6.17)
 
 CVE_STATUS[CVE-2025-38585] = "cpe-stable-backport: Backported in 6.12.42"
 
@@ -15670,7 +16180,7 @@ CVE_STATUS[CVE-2025-38589] = "fixed-version: only affects 6.13 onwards"
 
 CVE_STATUS[CVE-2025-38590] = "cpe-stable-backport: Backported in 6.12.42"
 
-# CVE-2025-38591 needs backporting (fixed from 6.17rc1)
+# CVE-2025-38591 needs backporting (fixed from 6.17)
 
 CVE_STATUS[CVE-2025-38592] = "fixed-version: only affects 6.15 onwards"
 
@@ -15682,7 +16192,7 @@ CVE_STATUS[CVE-2025-38595] = "cpe-stable-backport: Backported in 6.12.42"
 
 CVE_STATUS[CVE-2025-38596] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2025-38597 needs backporting (fixed from 6.17rc1)
+# CVE-2025-38597 needs backporting (fixed from 6.17)
 
 CVE_STATUS[CVE-2025-38598] = "fixed-version: only affects 6.16 onwards"
 
@@ -15696,7 +16206,7 @@ CVE_STATUS[CVE-2025-38602] = "cpe-stable-backport: Backported in 6.12.42"
 
 CVE_STATUS[CVE-2025-38604] = "cpe-stable-backport: Backported in 6.12.42"
 
-# CVE-2025-38605 needs backporting (fixed from 6.17rc1)
+# CVE-2025-38605 needs backporting (fixed from 6.17)
 
 CVE_STATUS[CVE-2025-38606] = "fixed-version: only affects 6.14 onwards"
 
@@ -15726,7 +16236,7 @@ CVE_STATUS[CVE-2025-38619] = "cpe-stable-backport: Backported in 6.12.42"
 
 CVE_STATUS[CVE-2025-38620] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2025-38621 needs backporting (fixed from 6.17rc1)
+# CVE-2025-38621 needs backporting (fixed from 6.17)
 
 CVE_STATUS[CVE-2025-38622] = "cpe-stable-backport: Backported in 6.12.42"
 
@@ -15738,7 +16248,7 @@ CVE_STATUS[CVE-2025-38625] = "cpe-stable-backport: Backported in 6.12.42"
 
 CVE_STATUS[CVE-2025-38626] = "cpe-stable-backport: Backported in 6.12.42"
 
-# CVE-2025-38627 needs backporting (fixed from 6.17rc1)
+# CVE-2025-38627 needs backporting (fixed from 6.17)
 
 CVE_STATUS[CVE-2025-38628] = "cpe-stable-backport: Backported in 6.12.42"
 
@@ -15756,7 +16266,7 @@ CVE_STATUS[CVE-2025-38634] = "cpe-stable-backport: Backported in 6.12.42"
 
 CVE_STATUS[CVE-2025-38635] = "cpe-stable-backport: Backported in 6.12.42"
 
-# CVE-2025-38636 needs backporting (fixed from 6.17rc1)
+# CVE-2025-38636 needs backporting (fixed from 6.17)
 
 CVE_STATUS[CVE-2025-38637] = "cpe-stable-backport: Backported in 6.12.23"
 
@@ -15770,7 +16280,7 @@ CVE_STATUS[CVE-2025-38641] = "fixed-version: only affects 6.16 onwards"
 
 CVE_STATUS[CVE-2025-38642] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2025-38643 needs backporting (fixed from 6.17rc1)
+# CVE-2025-38643 needs backporting (fixed from 6.17)
 
 CVE_STATUS[CVE-2025-38644] = "cpe-stable-backport: Backported in 6.12.42"
 
@@ -15840,7 +16350,7 @@ CVE_STATUS[CVE-2025-38676] = "cpe-stable-backport: Backported in 6.12.44"
 
 CVE_STATUS[CVE-2025-38677] = "cpe-stable-backport: Backported in 6.12.44"
 
-# CVE-2025-38678 needs backporting (fixed from 6.17rc2)
+# CVE-2025-38678 needs backporting (fixed from 6.17)
 
 CVE_STATUS[CVE-2025-38679] = "cpe-stable-backport: Backported in 6.12.43"
 
@@ -15968,9 +16478,9 @@ CVE_STATUS[CVE-2025-39675] = "cpe-stable-backport: Backported in 6.12.44"
 
 CVE_STATUS[CVE-2025-39676] = "cpe-stable-backport: Backported in 6.12.44"
 
-# CVE-2025-39677 needs backporting (fixed from 6.17rc3)
+# CVE-2025-39677 needs backporting (fixed from 6.17)
 
-# CVE-2025-39678 needs backporting (fixed from 6.17rc3)
+# CVE-2025-39678 needs backporting (fixed from 6.17)
 
 CVE_STATUS[CVE-2025-39679] = "cpe-stable-backport: Backported in 6.12.44"
 
@@ -16104,7 +16614,7 @@ CVE_STATUS[CVE-2025-39743] = "cpe-stable-backport: Backported in 6.12.43"
 
 CVE_STATUS[CVE-2025-39744] = "cpe-stable-backport: Backported in 6.12.43"
 
-# CVE-2025-39745 needs backporting (fixed from 6.17rc1)
+# CVE-2025-39745 needs backporting (fixed from 6.17)
 
 CVE_STATUS[CVE-2025-39746] = "cpe-stable-backport: Backported in 6.12.43"
 
@@ -16116,8 +16626,6 @@ CVE_STATUS[CVE-2025-39749] = "cpe-stable-backport: Backported in 6.12.43"
 
 CVE_STATUS[CVE-2025-39750] = "cpe-stable-backport: Backported in 6.12.43"
 
-CVE_STATUS[CVE-2025-39751] = "cpe-stable-backport: Backported in 6.12.43"
-
 CVE_STATUS[CVE-2025-39752] = "cpe-stable-backport: Backported in 6.12.43"
 
 CVE_STATUS[CVE-2025-39753] = "cpe-stable-backport: Backported in 6.12.43"
@@ -16138,11 +16646,11 @@ CVE_STATUS[CVE-2025-39760] = "cpe-stable-backport: Backported in 6.12.43"
 
 CVE_STATUS[CVE-2025-39761] = "cpe-stable-backport: Backported in 6.12.43"
 
-# CVE-2025-39762 needs backporting (fixed from 6.17rc1)
+# CVE-2025-39762 needs backporting (fixed from 6.17)
 
 CVE_STATUS[CVE-2025-39763] = "cpe-stable-backport: Backported in 6.12.43"
 
-# CVE-2025-39764 needs backporting (fixed from 6.17rc2)
+# CVE-2025-39764 needs backporting (fixed from 6.17)
 
 CVE_STATUS[CVE-2025-39765] = "cpe-stable-backport: Backported in 6.12.44"
 
@@ -16192,7 +16700,7 @@ CVE_STATUS[CVE-2025-39787] = "cpe-stable-backport: Backported in 6.12.44"
 
 CVE_STATUS[CVE-2025-39788] = "cpe-stable-backport: Backported in 6.12.44"
 
-# CVE-2025-39789 needs backporting (fixed from 6.17rc1)
+# CVE-2025-39789 needs backporting (fixed from 6.17)
 
 CVE_STATUS[CVE-2025-39790] = "cpe-stable-backport: Backported in 6.12.44"
 
@@ -16212,8 +16720,6 @@ CVE_STATUS[CVE-2025-39797] = "cpe-stable-backport: Backported in 6.12.43"
 
 CVE_STATUS[CVE-2025-39798] = "cpe-stable-backport: Backported in 6.12.43"
 
-CVE_STATUS[CVE-2025-39799] = "fixed-version: only affects 6.17rc1 onwards"
-
 CVE_STATUS[CVE-2025-39800] = "cpe-stable-backport: Backported in 6.12.44"
 
 CVE_STATUS[CVE-2025-39801] = "cpe-stable-backport: Backported in 6.12.44"
@@ -16258,7 +16764,7 @@ CVE_STATUS[CVE-2025-39820] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2025-39821] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2025-39822 needs backporting (fixed from 6.17rc4)
+# CVE-2025-39822 needs backporting (fixed from 6.17)
 
 CVE_STATUS[CVE-2025-39823] = "cpe-stable-backport: Backported in 6.12.45"
 
@@ -16274,15 +16780,15 @@ CVE_STATUS[CVE-2025-39828] = "cpe-stable-backport: Backported in 6.12.45"
 
 CVE_STATUS[CVE-2025-39829] = "cpe-stable-backport: Backported in 6.12.45"
 
-# CVE-2025-39830 needs backporting (fixed from 6.17rc4)
+# CVE-2025-39830 needs backporting (fixed from 6.17)
 
 CVE_STATUS[CVE-2025-39831] = "cpe-stable-backport: Backported in 6.12.45"
 
 CVE_STATUS[CVE-2025-39832] = "cpe-stable-backport: Backported in 6.12.45"
 
-# CVE-2025-39833 needs backporting (fixed from 6.17rc4)
+# CVE-2025-39833 needs backporting (fixed from 6.17)
 
-# CVE-2025-39834 needs backporting (fixed from 6.17rc4)
+# CVE-2025-39834 needs backporting (fixed from 6.17)
 
 CVE_STATUS[CVE-2025-39835] = "cpe-stable-backport: Backported in 6.12.45"
 
@@ -16332,13 +16838,13 @@ CVE_STATUS[CVE-2025-39857] = "cpe-stable-backport: Backported in 6.12.46"
 
 CVE_STATUS[CVE-2025-39858] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2025-39859 needs backporting (fixed from 6.17rc5)
+# CVE-2025-39859 needs backporting (fixed from 6.17)
 
 CVE_STATUS[CVE-2025-39860] = "cpe-stable-backport: Backported in 6.12.46"
 
 CVE_STATUS[CVE-2025-39861] = "cpe-stable-backport: Backported in 6.12.46"
 
-# CVE-2025-39862 needs backporting (fixed from 6.17rc5)
+# CVE-2025-39862 needs backporting (fixed from 6.17)
 
 CVE_STATUS[CVE-2025-39863] = "cpe-stable-backport: Backported in 6.12.46"
 
@@ -16348,8 +16854,6 @@ CVE_STATUS[CVE-2025-39865] = "cpe-stable-backport: Backported in 6.12.46"
 
 CVE_STATUS[CVE-2025-39866] = "cpe-stable-backport: Backported in 6.12.46"
 
-CVE_STATUS[CVE-2025-39867] = "fixed-version: only affects 6.17rc1 onwards"
-
 CVE_STATUS[CVE-2025-39868] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2025-39869] = "cpe-stable-backport: Backported in 6.12.48"
@@ -16396,8 +16900,132 @@ CVE_STATUS[CVE-2025-39889] = "cpe-stable-backport: Backported in 6.12.25"
 
 CVE_STATUS[CVE-2025-39890] = "cpe-stable-backport: Backported in 6.12.34"
 
+CVE_STATUS[CVE-2025-39891] = "cpe-stable-backport: Backported in 6.12.46"
+
+CVE_STATUS[CVE-2025-39892] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-39893] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-39894] = "cpe-stable-backport: Backported in 6.12.46"
+
+CVE_STATUS[CVE-2025-39895] = "cpe-stable-backport: Backported in 6.12.46"
+
+CVE_STATUS[CVE-2025-39896] = "cpe-stable-backport: Backported in 6.12.46"
+
+CVE_STATUS[CVE-2025-39897] = "cpe-stable-backport: Backported in 6.12.46"
+
+CVE_STATUS[CVE-2025-39898] = "cpe-stable-backport: Backported in 6.12.46"
+
+CVE_STATUS[CVE-2025-39899] = "cpe-stable-backport: Backported in 6.12.46"
+
+CVE_STATUS[CVE-2025-39900] = "cpe-stable-backport: Backported in 6.12.46"
+
+CVE_STATUS[CVE-2025-39901] = "cpe-stable-backport: Backported in 6.12.46"
+
+CVE_STATUS[CVE-2025-39902] = "cpe-stable-backport: Backported in 6.12.46"
+
+CVE_STATUS[CVE-2025-39903] = "cpe-stable-backport: Backported in 6.12.46"
+
+CVE_STATUS[CVE-2025-39904] = "fixed-version: only affects 6.16 onwards"
+
+# CVE-2025-39905 needs backporting (fixed from 6.17)
+
+CVE_STATUS[CVE-2025-39906] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-39907] = "cpe-stable-backport: Backported in 6.12.48"
+
+CVE_STATUS[CVE-2025-39908] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-39909] = "cpe-stable-backport: Backported in 6.12.48"
+
+# CVE-2025-39910 needs backporting (fixed from 6.17)
+
+CVE_STATUS[CVE-2025-39911] = "cpe-stable-backport: Backported in 6.12.48"
+
+CVE_STATUS[CVE-2025-39912] = "cpe-stable-backport: Backported in 6.12.48"
+
+CVE_STATUS[CVE-2025-39913] = "cpe-stable-backport: Backported in 6.12.48"
+
+CVE_STATUS[CVE-2025-39914] = "cpe-stable-backport: Backported in 6.12.48"
+
+CVE_STATUS[CVE-2025-39915] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-39916] = "cpe-stable-backport: Backported in 6.12.48"
+
+CVE_STATUS[CVE-2025-39917] = "cpe-stable-backport: Backported in 6.12.48"
+
+CVE_STATUS[CVE-2025-39918] = "cpe-stable-backport: Backported in 6.12.46"
+
+CVE_STATUS[CVE-2025-39919] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-39920] = "cpe-stable-backport: Backported in 6.12.46"
+
+CVE_STATUS[CVE-2025-39921] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-39922] = "cpe-stable-backport: Backported in 6.12.46"
+
+CVE_STATUS[CVE-2025-39923] = "cpe-stable-backport: Backported in 6.12.48"
+
+CVE_STATUS[CVE-2025-39924] = "fixed-version: only affects 6.15 onwards"
+
+# CVE-2025-39925 needs backporting (fixed from 6.17)
+
+CVE_STATUS[CVE-2025-39926] = "cpe-stable-backport: Backported in 6.12.48"
+
+CVE_STATUS[CVE-2025-39927] = "cpe-stable-backport: Backported in 6.12.48"
+
+CVE_STATUS[CVE-2025-39928] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-39929] = "cpe-stable-backport: Backported in 6.12.49"
+
 CVE_STATUS[CVE-2025-39930] = "fixed-version: only affects 6.14 onwards"
 
+CVE_STATUS[CVE-2025-39931] = "cpe-stable-backport: Backported in 6.12.49"
+
+CVE_STATUS[CVE-2025-39932] = "cpe-stable-backport: Backported in 6.12.49"
+
+# CVE-2025-39933 needs backporting (fixed from 6.17)
+
+CVE_STATUS[CVE-2025-39934] = "cpe-stable-backport: Backported in 6.12.49"
+
+CVE_STATUS[CVE-2025-39935] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-39936] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-39937] = "cpe-stable-backport: Backported in 6.12.49"
+
+CVE_STATUS[CVE-2025-39938] = "cpe-stable-backport: Backported in 6.12.49"
+
+CVE_STATUS[CVE-2025-39939] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-39940] = "cpe-stable-backport: Backported in 6.12.49"
+
+CVE_STATUS[CVE-2025-39941] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-39942] = "cpe-stable-backport: Backported in 6.12.49"
+
+CVE_STATUS[CVE-2025-39943] = "cpe-stable-backport: Backported in 6.12.49"
+
+CVE_STATUS[CVE-2025-39944] = "cpe-stable-backport: Backported in 6.12.49"
+
+CVE_STATUS[CVE-2025-39945] = "cpe-stable-backport: Backported in 6.12.49"
+
+CVE_STATUS[CVE-2025-39946] = "cpe-stable-backport: Backported in 6.12.49"
+
+CVE_STATUS[CVE-2025-39947] = "cpe-stable-backport: Backported in 6.12.49"
+
+CVE_STATUS[CVE-2025-39948] = "cpe-stable-backport: Backported in 6.12.49"
+
+CVE_STATUS[CVE-2025-39949] = "cpe-stable-backport: Backported in 6.12.49"
+
+CVE_STATUS[CVE-2025-39950] = "cpe-stable-backport: Backported in 6.12.49"
+
+CVE_STATUS[CVE-2025-39951] = "cpe-stable-backport: Backported in 6.12.49"
+
+CVE_STATUS[CVE-2025-39952] = "cpe-stable-backport: Backported in 6.12.49"
+
+CVE_STATUS[CVE-2025-39953] = "cpe-stable-backport: Backported in 6.12.49"
+
 CVE_STATUS[CVE-2025-39989] = "cpe-stable-backport: Backported in 6.12.23"
 
 # CVE-2025-40014 needs backporting (fixed from 6.15)
-- 
2.39.2


