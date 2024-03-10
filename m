Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF75C54E67
	for <webhook@archiver.kernel.org>; Sun, 10 Mar 2024 16:01:13 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.40406.1710086469588350896
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Mar 2024 09:01:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2QReY3It;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1dbd32cff0bso26742405ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 09:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710086469; x=1710691269; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lsIdm58ih3o4xuqKRtnK6kbel4W2avMA+bXLoah2DJ8=;
        b=2QReY3ItP/vhXJfm5mleqlw8DcxyqYa30sgJp9ZADLTVQ7rqOoGVxISjanEe9V3ExS
         l9rUNY+WJOJm3+eE9iqIhT4armXgtHJyq5u9Pk9fLOhoECQv/bfxLSwqpfroDz0gNFe5
         Dytn6zCX8VG4jcA62zX+5A+4/rGT+AattHYny0nh+TrQgsWciF+mHIcDL5LFrTXZpGwD
         WwWq6lttYcPIxBqJvc1tmcwgT3EEotQeIcv/D7Y8gmswez8anLB0Nm1OCFQfpkz5aMiy
         nj4b3gx9MTwIp4PMhapP7WmcrJkT0KZY8y5d/rjKFhZqZXjVRQlK6Zy6N846vbyVTgaT
         SAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710086469; x=1710691269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lsIdm58ih3o4xuqKRtnK6kbel4W2avMA+bXLoah2DJ8=;
        b=BKumC3YQL1LXZYW4CE1FyVmdYpV1mgRIjPFIWGPYY76b0khlqTYS7X2OpC+9/5SmsO
         qiyTdBW1tk0OnjjFpW9LvKwkAgAugJgYjBMEF8pIdDF5rI5pz/DT5eOWARY3Gyq8iyMz
         vjaXI8fX3rpN5HQxPVNNheD21DMgFfYn9c/ww1JAPUkqZ7u5PyNKaQDWij6NpAkD4dUk
         Tcp5bJgAD2gEcQo3xBX99bpW1qf80QYuOfzMS9V8GOTE3nnwsL1hQXMyBXUyydSPGTic
         xxVXv9bFrcovw7pMG1SebOVKa5ewXTblu+BR4gG42V2CG+ooBQJgQBUT66Kmvv+shedW
         V0Ow==
X-Gm-Message-State: AOJu0YyD+YNTH+p/CQphXjUZdrBjMRl05Fl4SNBBcV1M/ZQJZmMDjuug
	fD6AGIkrNVRygrYdOdUn3wnlZWA9PowQ3sDE16sYPro6wLBjhDieiF9EPh4t/myNS8KPXoAmuUH
	EeKgN6w==
X-Google-Smtp-Source: AGHT+IETsMFttSCrJJ6jAF15AD6bJIip+RIKpm3Fcy45lFmPnHGuLLNAYh1ax6rfnaVQJ5433w94YQ==
X-Received: by 2002:a17:902:6b87:b0:1dd:6f1a:ef10 with SMTP id p7-20020a1709026b8700b001dd6f1aef10mr3376461plk.16.1710086468646;
        Sun, 10 Mar 2024 09:01:08 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id e9-20020a170902cf4900b001da105d6a83sm2836862plg.224.2024.03.10.09.01.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 09:01:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 4/5] linux-yocto/6.1: update CVE exclusions
Date: Sun, 10 Mar 2024 06:00:53 -1000
Message-Id: <7b490b890f2bc54c76ae551e92a11fefec4ffec1.1710086264.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710086264.git.steve@sakoman.com>
References: <cover.1710086264.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 16:01:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196897

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/nluedtke/linux_kernel_cves

    1/1 [
        Author: Nicholas Luedtke
        Email: nicholas.luedtke@uwalumni.com
        Subject: Update 9Feb24
        Date: Fri, 9 Feb 2024 18:02:45 -0500

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/cve-exclusion_6.1.inc               | 104 ++++++++++++++++--
 1 file changed, 93 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
index 45fcc7b260..cb48e4d88d 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-01-18 21:10:06.148505+00:00 for version 6.1.73
+# Generated at 2024-02-21 02:22:41.710563+00:00 for version 6.1.78
 
 python check_kernel_cve_status_version() {
-    this_version = "6.1.73"
+    this_version = "6.1.78"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -3668,6 +3668,10 @@ CVE_STATUS[CVE-2021-3348] = "fixed-version: Fixed from version 5.11rc6"
 
 CVE_STATUS[CVE-2021-33624] = "fixed-version: Fixed from version 5.13rc7"
 
+CVE_STATUS[CVE-2021-33630] = "fixed-version: Fixed from version 5.4rc1"
+
+CVE_STATUS[CVE-2021-33631] = "cpe-stable-backport: Backported in 6.1.4"
+
 CVE_STATUS[CVE-2021-33655] = "fixed-version: Fixed from version 5.19rc6"
 
 CVE_STATUS[CVE-2021-33656] = "fixed-version: Fixed from version 5.12rc1"
@@ -4420,7 +4424,7 @@ CVE_STATUS[CVE-2022-3636] = "fixed-version: Fixed from version 5.19rc1"
 
 CVE_STATUS[CVE-2022-3640] = "fixed-version: Fixed from version 6.1rc4"
 
-# CVE-2022-36402 has no known resolution
+CVE_STATUS[CVE-2022-36402] = "cpe-stable-backport: Backported in 6.1.50"
 
 # CVE-2022-3642 has no known resolution
 
@@ -4958,7 +4962,7 @@ CVE_STATUS[CVE-2023-35824] = "cpe-stable-backport: Backported in 6.1.28"
 
 CVE_STATUS[CVE-2023-35826] = "cpe-stable-backport: Backported in 6.1.28"
 
-# CVE-2023-35827 needs backporting (fixed from 6.1.59)
+CVE_STATUS[CVE-2023-35827] = "cpe-stable-backport: Backported in 6.1.59"
 
 CVE_STATUS[CVE-2023-35828] = "cpe-stable-backport: Backported in 6.1.28"
 
@@ -5032,7 +5036,7 @@ CVE_STATUS[CVE-2023-4015] = "cpe-stable-backport: Backported in 6.1.43"
 
 CVE_STATUS[CVE-2023-40283] = "cpe-stable-backport: Backported in 6.1.45"
 
-# CVE-2023-40791 needs backporting (fixed from 6.5rc6)
+CVE_STATUS[CVE-2023-40791] = "fixed-version: only affects 6.3rc1 onwards"
 
 CVE_STATUS[CVE-2023-4128] = "cpe-stable-backport: Backported in 6.1.45"
 
@@ -5100,9 +5104,15 @@ CVE_STATUS[CVE-2023-4611] = "fixed-version: only affects 6.4rc1 onwards"
 
 CVE_STATUS[CVE-2023-4623] = "cpe-stable-backport: Backported in 6.1.53"
 
-# CVE-2023-46813 needs backporting (fixed from 6.1.60)
+CVE_STATUS[CVE-2023-46343] = "cpe-stable-backport: Backported in 6.1.60"
+
+CVE_STATUS[CVE-2023-46813] = "cpe-stable-backport: Backported in 6.1.60"
 
-# CVE-2023-46862 needs backporting (fixed from 6.6)
+CVE_STATUS[CVE-2023-46838] = "cpe-stable-backport: Backported in 6.1.75"
+
+CVE_STATUS[CVE-2023-46862] = "cpe-stable-backport: Backported in 6.1.61"
+
+# CVE-2023-47233 has no known resolution
 
 CVE_STATUS[CVE-2023-4732] = "fixed-version: Fixed from version 5.14rc1"
 
@@ -5110,10 +5120,14 @@ CVE_STATUS[CVE-2023-4881] = "cpe-stable-backport: Backported in 6.1.54"
 
 CVE_STATUS[CVE-2023-4921] = "cpe-stable-backport: Backported in 6.1.54"
 
-# CVE-2023-50431 has no known resolution
+CVE_STATUS[CVE-2023-50431] = "cpe-stable-backport: Backported in 6.1.75"
 
 CVE_STATUS[CVE-2023-5090] = "cpe-stable-backport: Backported in 6.1.62"
 
+CVE_STATUS[CVE-2023-51042] = "cpe-stable-backport: Backported in 6.1.47"
+
+CVE_STATUS[CVE-2023-51043] = "cpe-stable-backport: Backported in 6.1.40"
+
 CVE_STATUS[CVE-2023-5158] = "cpe-stable-backport: Backported in 6.1.57"
 
 CVE_STATUS[CVE-2023-51779] = "cpe-stable-backport: Backported in 6.1.70"
@@ -5128,11 +5142,13 @@ CVE_STATUS[CVE-2023-51782] = "cpe-stable-backport: Backported in 6.1.69"
 
 CVE_STATUS[CVE-2023-5197] = "cpe-stable-backport: Backported in 6.1.56"
 
+CVE_STATUS[CVE-2023-52340] = "cpe-stable-backport: Backported in 6.1.73"
+
 CVE_STATUS[CVE-2023-5345] = "cpe-stable-backport: Backported in 6.1.56"
 
 CVE_STATUS[CVE-2023-5633] = "fixed-version: only affects 6.2 onwards"
 
-# CVE-2023-5717 needs backporting (fixed from 6.1.60)
+CVE_STATUS[CVE-2023-5717] = "cpe-stable-backport: Backported in 6.1.60"
 
 CVE_STATUS[CVE-2023-5972] = "fixed-version: only affects 6.2rc1 onwards"
 
@@ -5146,8 +5162,12 @@ CVE_STATUS[CVE-2023-6121] = "cpe-stable-backport: Backported in 6.1.65"
 
 CVE_STATUS[CVE-2023-6176] = "cpe-stable-backport: Backported in 6.1.54"
 
+CVE_STATUS[CVE-2023-6200] = "fixed-version: only affects 6.6rc1 onwards"
+
 # CVE-2023-6238 has no known resolution
 
+# CVE-2023-6240 has no known resolution
+
 # CVE-2023-6270 has no known resolution
 
 # CVE-2023-6356 has no known resolution
@@ -5164,7 +5184,7 @@ CVE_STATUS[CVE-2023-6546] = "cpe-stable-backport: Backported in 6.1.47"
 
 CVE_STATUS[CVE-2023-6606] = "cpe-stable-backport: Backported in 6.1.70"
 
-# CVE-2023-6610 needs backporting (fixed from 6.7rc7)
+CVE_STATUS[CVE-2023-6610] = "cpe-stable-backport: Backported in 6.1.74"
 
 CVE_STATUS[CVE-2023-6622] = "cpe-stable-backport: Backported in 6.1.68"
 
@@ -5172,6 +5192,8 @@ CVE_STATUS[CVE-2023-6679] = "fixed-version: only affects 6.7rc1 onwards"
 
 CVE_STATUS[CVE-2023-6817] = "cpe-stable-backport: Backported in 6.1.68"
 
+CVE_STATUS[CVE-2023-6915] = "cpe-stable-backport: Backported in 6.1.74"
+
 CVE_STATUS[CVE-2023-6931] = "cpe-stable-backport: Backported in 6.1.68"
 
 CVE_STATUS[CVE-2023-6932] = "cpe-stable-backport: Backported in 6.1.66"
@@ -5186,5 +5208,65 @@ CVE_STATUS[CVE-2024-0193] = "fixed-version: only affects 6.5rc6 onwards"
 
 CVE_STATUS[CVE-2024-0443] = "fixed-version: only affects 6.2rc1 onwards"
 
-# Skipping dd=CVE-2023-1476, no affected_versions
+CVE_STATUS[CVE-2024-0562] = "fixed-version: Fixed from version 6.0rc3"
+
+# CVE-2024-0564 has no known resolution
+
+CVE_STATUS[CVE-2024-0565] = "cpe-stable-backport: Backported in 6.1.69"
+
+CVE_STATUS[CVE-2024-0582] = "fixed-version: only affects 6.4rc1 onwards"
+
+CVE_STATUS[CVE-2024-0584] = "cpe-stable-backport: Backported in 6.1.66"
+
+CVE_STATUS[CVE-2024-0607] = "cpe-stable-backport: Backported in 6.1.64"
+
+CVE_STATUS[CVE-2024-0639] = "cpe-stable-backport: Backported in 6.1.39"
+
+CVE_STATUS[CVE-2024-0641] = "cpe-stable-backport: Backported in 6.1.57"
+
+CVE_STATUS[CVE-2024-0646] = "cpe-stable-backport: Backported in 6.1.69"
+
+CVE_STATUS[CVE-2024-0775] = "cpe-stable-backport: Backported in 6.1.29"
+
+# CVE-2024-0841 has no known resolution
+
+CVE_STATUS[CVE-2024-1085] = "cpe-stable-backport: Backported in 6.1.75"
+
+CVE_STATUS[CVE-2024-1086] = "cpe-stable-backport: Backported in 6.1.76"
+
+# CVE-2024-1312 needs backporting (fixed from 6.5rc4)
+
+# CVE-2024-21803 has no known resolution
+
+# CVE-2024-22099 has no known resolution
+
+# CVE-2024-22386 has no known resolution
+
+CVE_STATUS[CVE-2024-22705] = "cpe-stable-backport: Backported in 6.1.71"
+
+# CVE-2024-23196 has no known resolution
+
+# CVE-2024-23307 has no known resolution
+
+# CVE-2024-23848 has no known resolution
+
+CVE_STATUS[CVE-2024-23849] = "cpe-stable-backport: Backported in 6.1.76"
+
+# CVE-2024-23850 has no known resolution
+
+# CVE-2024-23851 has no known resolution
+
+# CVE-2024-24855 has no known resolution
+
+# CVE-2024-24857 has no known resolution
+
+# CVE-2024-24858 has no known resolution
+
+# CVE-2024-24859 has no known resolution
+
+# CVE-2024-24860 has no known resolution
+
+# CVE-2024-24861 has no known resolution
+
+# CVE-2024-24864 has no known resolution
 
-- 
2.34.1


