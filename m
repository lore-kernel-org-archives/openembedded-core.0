Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFBD5CCD1A3
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 03:08:54 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.4649.1760584134241246611
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 20:08:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iOgv2vXw;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-78defc1a2afso6729316d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 20:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760584133; x=1761188933; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWRn2PjrCUdDQ9KPc6zH5kurstdZxoIvvCkkgGJIYus=;
        b=iOgv2vXw/IL61c1wx9aJ2pV1njKS3sTRuAo+zKISvVU+mpE/hZg1pPaiMHCPNfUi9u
         VvhHnU163sMCuWBIIR1Ww2LAYdJyLKepVFi6NaLjOCmwVTaALl0PEv+zEn5CTBJvyhkG
         eQwZIUzbJi7p4Ptl3eqsY8sGfYdduwWv6WqLGkHujMtR08d97+aH7Z+3QS6BMU31j3DS
         i658O1fw6F7GjZRZyaz3TusNjkHKcbVW8QKPAXK0NT4HDJLVhKWtufdfJNKCZrqU/2Am
         mtAP5aMCTSiSvq/G+vShVw6OmuWHM4YYWNbsiiYxzQMKunQv50HMShcXZSkRKRxieaSn
         B5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760584133; x=1761188933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EWRn2PjrCUdDQ9KPc6zH5kurstdZxoIvvCkkgGJIYus=;
        b=Jj2mY+/EYwhji7wnViVSHZGPWWfU3jur26Mq6QuDvxfPErWIf4/6u8x8kfWueGzH5K
         iX/8qYpxlbN2/xDkBBF0JmGi0t7p0mbrdLNwDWoErrDSZMrql/44THSuMoYnXbE+/vK0
         mYU+Eh8wkkd30iA/mc039/7qUVymnBlLyWnAZFtpDeUfn/uf6MRfdKZP/XighbNh9QuZ
         51fNzclBCpGj19hBZ3DcSmY85+WG2qNJ3uoDJvMfowbG/T45usquR5g+UGfpGPEulDAl
         tUVS6jEXbKgQxR0/WldpPkTvyGhGrxabDmhyTw6SpMTeb1Wck0E1cSqWDxpOfOhPvSo4
         0B/Q==
X-Gm-Message-State: AOJu0YyJik/KrRNw/8L21Sclq4c0ZdAj91JeTLlINuyHTeOyXTaTIuuF
	w8/hEig695828s1aAxO/DeYDxgvvP18iT0/uj3eVoni+UqlsKH6k+ThRDAwcuTGsBRM=
X-Gm-Gg: ASbGncsFv90hhXi/0Ne+1UOD1qRRcaZa3/H2OWyF5+q5IC87b8m8g3B4RnKni15Fckl
	sliTUrK56GI0MCSj577FkYzJO1pX6j+NLFGi+pUJpyJteF9IP6k4RULvDAx85J55V0qjxgH8N4h
	nswjyeI0ve7TQEDf/DBCIAodAMW3D64ZGAtcQ6qAB6XxBqEs9Cy07gyBIE3eoG1kLTlCCcBB0ND
	gHeuJX2B2T95s3Kxxoz8BdtSBNY+q0LJe8fhsWWe/sBZUrXF72Jgc17MJw4un3OgXzuzfa8fXwP
	8QtnWMSGFiTqFZ2awqn8L7ljgqiLV/xFaAfBho7IgRaHc9HDN50jYx74NuJMW+E7818mcwqzrjX
	G7DuMzMu1knSPaoxsetFIky9C9aMJj37un73F2L24w6A+I86dyS1S11jdjWlTIdbPiik0nObHhP
	NQk2NDB2PnznE1xyn3ZQyEe+jijPvwf8K0SWHESbOngVso0pIARhCJ+tVXiiqtAXagFeDSJj9f0
	8zfuNpFLiWmH5o=
X-Google-Smtp-Source: AGHT+IGmQIwOKdvilrV3CbrEriD42RzF1nFYNEq52yoFspdGafb2sHJvBk5C/eJxiVyzitrUiwukHw==
X-Received: by 2002:ac8:7d56:0:b0:4e0:6592:2ecf with SMTP id d75a77b69052e-4e6eace9eeemr428456561cf.24.1760584133071;
        Wed, 15 Oct 2025 20:08:53 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c012a39d9sm30824986d6.44.2025.10.15.20.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 20:08:52 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/11] linux-yocto/6.12: update CVE exclusions (6.12.51)
Date: Wed, 15 Oct 2025 23:08:39 -0400
Message-Id: <ff140edba4081639eb80c9f074ce904ab80be648.1760583881.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1760583881.git.bruce.ashfield@gmail.com>
References: <cover.1760583881.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 03:08:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224921

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 1 changes (1 new | 0 updated): - 1 new CVEs: CVE-2025-11401 - 0 updated CVEs:
        Date: Tue, 7 Oct 2025 17:07:09 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.12.inc              | 244 +++++++++++++++++-
 1 file changed, 239 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index 59035c47e8..a5ccb609b6 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-10-06 18:40:43.912028+00:00 for kernel version 6.12.50
-# From linux_kernel_cves cve_2025-10-06_1800Z-2-gd3f82236df6
+# Generated at 2025-10-07 17:30:26.724165+00:00 for kernel version 6.12.51
+# From linux_kernel_cves cve_2025-10-07_1700Z
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.12.50"
+    this_version = "6.12.51"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -5190,6 +5190,100 @@ CVE_STATUS[CVE-2022-50507] = "fixed-version: Fixed from version 6.2"
 
 CVE_STATUS[CVE-2022-50508] = "fixed-version: Fixed from version 6.3"
 
+CVE_STATUS[CVE-2022-50509] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50510] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50511] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50512] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50513] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50514] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50515] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50516] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50517] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50518] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50519] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50520] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50521] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50522] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50523] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50524] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50525] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50526] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50527] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50528] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50529] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50530] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50531] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50532] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50533] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50534] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50535] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2022-50536] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50537] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50538] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50539] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2022-50540] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50541] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50542] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50543] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50544] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50545] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50546] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50547] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50548] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50549] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50550] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50551] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50552] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50553] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50554] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50555] = "fixed-version: Fixed from version 6.1"
+
 CVE_STATUS[CVE-2023-32246] = "fixed-version: Fixed from version 6.4"
 
 CVE_STATUS[CVE-2023-32249] = "fixed-version: Fixed from version 6.4"
@@ -6088,8 +6182,6 @@ CVE_STATUS[CVE-2023-52977] = "fixed-version: Fixed from version 6.1.11"
 
 CVE_STATUS[CVE-2023-52978] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2023-52979] = "fixed-version: Fixed from version 6.2"
-
 CVE_STATUS[CVE-2023-52980] = "fixed-version: Fixed from version 6.2"
 
 CVE_STATUS[CVE-2023-52981] = "fixed-version: Fixed from version 6.2"
@@ -7316,6 +7408,148 @@ CVE_STATUS[CVE-2023-53615] = "fixed-version: Fixed from version 6.6"
 
 CVE_STATUS[CVE-2023-53616] = "fixed-version: Fixed from version 6.6"
 
+CVE_STATUS[CVE-2023-53617] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53618] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53619] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53620] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53621] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53622] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53623] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53624] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53625] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-53626] = "fixed-version: Fixed from version 6.2.8"
+
+CVE_STATUS[CVE-2023-53627] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53628] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53629] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53630] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53631] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53632] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53633] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53634] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53635] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53636] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53637] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53638] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53639] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53640] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53641] = "fixed-version: Fixed from version 6.4"
+
+# CVE-2023-53642 has no known resolution
+
+CVE_STATUS[CVE-2023-53643] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53644] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53645] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53646] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53647] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53648] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53649] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53650] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53651] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53652] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53653] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53654] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53655] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53656] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53657] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53658] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53659] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53660] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53661] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53662] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53663] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53664] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53665] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53666] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53667] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53668] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53669] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53670] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53671] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53672] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53673] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53674] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53675] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53676] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53677] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53678] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53679] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53680] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53681] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53682] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53683] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53684] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53685] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53686] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53687] = "fixed-version: Fixed from version 6.5"
+
 CVE_STATUS[CVE-2024-26581] = "fixed-version: Fixed from version 6.8"
 
 CVE_STATUS[CVE-2024-26582] = "fixed-version: Fixed from version 6.8"
-- 
2.39.2


