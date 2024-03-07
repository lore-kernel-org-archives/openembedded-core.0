Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D62CC54798
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 23:37:43 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.8459.1709854653743087015
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 15:37:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wIUApuv/;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1dc29f1956cso1840295ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 15:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709854653; x=1710459453; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BFEZsg0LMXuneNM9u+rkn+nHXW67XjE7RQkM+p4AKO0=;
        b=wIUApuv/GF1ayHiXAw5mfxsPRjZ5Gq9fz7+UNnSfxJsImz94r5yepEcQnmhnOhGRK6
         uDL4edHcJZMcmFYaysCzTSqTfOazxDMeKeo77SfFO5FebaKV3kOfqu6M9BdlChHez+6w
         wM7WGLQ7Y4Vhv8siWQW/g1ffMQ1vS0mhc6EpplrFLW3MjYGEFSSEIz1RkhuUJFrXphgU
         a0QnLO3ZJtfPKyR/cpu0+jgwB3bkA6snuqOCaGJaxL1YIGjwhA0NlmTTaCkiynAq0Lkl
         /IpJjpirqXMzPq+OfwkcOhMtdZCOBNLwG2yE6M50ehc5NSNNuFdD+/CfyIKOK6JL9hd5
         0CEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709854653; x=1710459453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BFEZsg0LMXuneNM9u+rkn+nHXW67XjE7RQkM+p4AKO0=;
        b=mGG9d+Y9Y4pa09nrw9ocG7cRLrQ/mo4wGKae9mm0+zFIb8+B85kKvIDuF60iYvgbOO
         vnLAmJmkdSjkMYLaUR8/6un+7BHkVc5LQVfEj9Nm/ZNqN10MSNqAJHfVkSbin8eMcyGL
         KEW1mtE7euQ/3vjh2WWp/2gVQR+R1DK9rDUwcjiVqRw25lryUVlrhHgvc250PUoxnOx5
         FKMBXtJorKApcl8CzldlMA2NKG5aCrL2nJznYAcyx4PeKUXAOXonDUMhKaILcJk3LBwf
         SMSrLLun5+fjtUKQmh1hpREqL8+Ca5xqm/jpwkNq9+Hm0SS50GqwWtcTnv/mWaKnIrj+
         MHLw==
X-Gm-Message-State: AOJu0Yxm/AhpBBuPC9Z/kU98hhW063PsmZJfkic9GsHEolwDeRih6Zog
	O1hHTEKbXu7QyUONr5pj7wCr6CUkVYBvQzTS+9jWXIvd9RnXWWd1Tw4Mz8Fz67cUDz4bUhuxY/Z
	r+GM=
X-Google-Smtp-Source: AGHT+IGbF+hY93ySO1YfLWVPEtFmHUcmKUbQZUR1VlAoQOODuPL2zcsw8nRE128CjccuUQuBjL/tjg==
X-Received: by 2002:a17:903:11ce:b0:1dc:7856:2213 with SMTP id q14-20020a17090311ce00b001dc78562213mr10142663plh.37.1709854652819;
        Thu, 07 Mar 2024 15:37:32 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id h18-20020a170902f7d200b001dd526ff7d2sm1933243plw.308.2024.03.07.15.37.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 15:37:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/9] Revert "linux-yocto/5.15: update CVE exclusions"
Date: Thu,  7 Mar 2024 13:37:13 -1000
Message-Id: <666f712018e486913ad469eb96cef6a9596c4830.1709853987.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709853987.git.steve@sakoman.com>
References: <cover.1709853987.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 23:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196828

This series is causing issues with adding and resizing partitions.

This reverts commit b71eeab71911ab49a8e8b8d78560fdbd66f883e7.
---
 .../linux/cve-exclusion_5.15.inc              | 91 ++-----------------
 1 file changed, 6 insertions(+), 85 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
index d33f2b3c7f..0d54b414d9 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-02-06 21:02:11.546853 for version 5.15.148
+# Generated at 2024-01-18 18:47:24.084935 for version 5.15.147
 
 python check_kernel_cve_status_version() {
-    this_version = "5.15.148"
+    this_version = "5.15.147"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -5299,12 +5299,6 @@ CVE_CHECK_IGNORE += "CVE-2021-3348"
 # fixed-version: Fixed after version 5.13rc7
 CVE_CHECK_IGNORE += "CVE-2021-33624"
 
-# fixed-version: Fixed after version 5.4rc1
-CVE_CHECK_IGNORE += "CVE-2021-33630"
-
-# cpe-stable-backport: Backported in 5.15.87
-CVE_CHECK_IGNORE += "CVE-2021-33631"
-
 # cpe-stable-backport: Backported in 5.15.54
 CVE_CHECK_IGNORE += "CVE-2021-33655"
 
@@ -6401,8 +6395,7 @@ CVE_CHECK_IGNORE += "CVE-2022-3635"
 # fixed-version: only affects 5.19 onwards
 CVE_CHECK_IGNORE += "CVE-2022-3640"
 
-# cpe-stable-backport: Backported in 5.15.129
-CVE_CHECK_IGNORE += "CVE-2022-36402"
+# CVE-2022-36402 has no known resolution
 
 # CVE-2022-3642 has no known resolution
 
@@ -7375,15 +7368,9 @@ CVE_CHECK_IGNORE += "CVE-2023-4611"
 # cpe-stable-backport: Backported in 5.15.132
 CVE_CHECK_IGNORE += "CVE-2023-4623"
 
-# cpe-stable-backport: Backported in 5.15.137
-CVE_CHECK_IGNORE += "CVE-2023-46343"
-
 # cpe-stable-backport: Backported in 5.15.137
 CVE_CHECK_IGNORE += "CVE-2023-46813"
 
-# cpe-stable-backport: Backported in 5.15.148
-CVE_CHECK_IGNORE += "CVE-2023-46838"
-
 # cpe-stable-backport: Backported in 5.15.140
 CVE_CHECK_IGNORE += "CVE-2023-46862"
 
@@ -7398,17 +7385,11 @@ CVE_CHECK_IGNORE += "CVE-2023-4881"
 # cpe-stable-backport: Backported in 5.15.132
 CVE_CHECK_IGNORE += "CVE-2023-4921"
 
-# CVE-2023-50431 needs backporting (fixed from 6.8rc1)
+# CVE-2023-50431 has no known resolution
 
 # fixed-version: only affects 6.0rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-5090"
 
-# cpe-stable-backport: Backported in 5.15.128
-CVE_CHECK_IGNORE += "CVE-2023-51042"
-
-# cpe-stable-backport: Backported in 5.15.121
-CVE_CHECK_IGNORE += "CVE-2023-51043"
-
 # cpe-stable-backport: Backported in 5.15.135
 CVE_CHECK_IGNORE += "CVE-2023-5158"
 
@@ -7430,9 +7411,6 @@ CVE_CHECK_IGNORE += "CVE-2023-51782"
 # cpe-stable-backport: Backported in 5.15.134
 CVE_CHECK_IGNORE += "CVE-2023-5197"
 
-# cpe-stable-backport: Backported in 5.15.147
-CVE_CHECK_IGNORE += "CVE-2023-52340"
-
 # fixed-version: only affects 6.1rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-5345"
 
@@ -7447,8 +7425,7 @@ CVE_CHECK_IGNORE += "CVE-2023-5972"
 
 # CVE-2023-6039 needs backporting (fixed from 6.5rc5)
 
-# cpe-stable-backport: Backported in 5.15.147
-CVE_CHECK_IGNORE += "CVE-2023-6040"
+# CVE-2023-6040 needs backporting (fixed from 5.18rc1)
 
 # fixed-version: only affects 6.6rc3 onwards
 CVE_CHECK_IGNORE += "CVE-2023-6111"
@@ -7459,9 +7436,6 @@ CVE_CHECK_IGNORE += "CVE-2023-6121"
 # cpe-stable-backport: Backported in 5.15.132
 CVE_CHECK_IGNORE += "CVE-2023-6176"
 
-# fixed-version: only affects 6.6rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-6200"
-
 # CVE-2023-6238 has no known resolution
 
 # CVE-2023-6270 has no known resolution
@@ -7494,9 +7468,6 @@ CVE_CHECK_IGNORE += "CVE-2023-6679"
 # cpe-stable-backport: Backported in 5.15.143
 CVE_CHECK_IGNORE += "CVE-2023-6817"
 
-# cpe-stable-backport: Backported in 5.15.148
-CVE_CHECK_IGNORE += "CVE-2023-6915"
-
 # cpe-stable-backport: Backported in 5.15.143
 CVE_CHECK_IGNORE += "CVE-2023-6931"
 
@@ -7516,55 +7487,5 @@ CVE_CHECK_IGNORE += "CVE-2024-0193"
 # fixed-version: only affects 6.2rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2024-0443"
 
-# cpe-stable-backport: Backported in 5.15.64
-CVE_CHECK_IGNORE += "CVE-2024-0562"
-
-# CVE-2024-0564 has no known resolution
-
-# CVE-2024-0565 needs backporting (fixed from 6.7rc6)
-
-# fixed-version: only affects 6.4rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2024-0582"
-
-# cpe-stable-backport: Backported in 5.15.142
-CVE_CHECK_IGNORE += "CVE-2024-0584"
-
-# cpe-stable-backport: Backported in 5.15.140
-CVE_CHECK_IGNORE += "CVE-2024-0607"
-
-# cpe-stable-backport: Backported in 5.15.121
-CVE_CHECK_IGNORE += "CVE-2024-0639"
-
-# cpe-stable-backport: Backported in 5.15.135
-CVE_CHECK_IGNORE += "CVE-2024-0641"
-
-# cpe-stable-backport: Backported in 5.15.147
-CVE_CHECK_IGNORE += "CVE-2024-0646"
-
-# cpe-stable-backport: Backported in 5.15.112
-CVE_CHECK_IGNORE += "CVE-2024-0775"
-
-# CVE-2024-0841 has no known resolution
-
-# cpe-stable-backport: Backported in 5.15.148
-CVE_CHECK_IGNORE += "CVE-2024-1085"
-
-# CVE-2024-1086 needs backporting (fixed from 6.8rc2)
-
-# CVE-2024-21803 has no known resolution
-
-# CVE-2024-22099 has no known resolution
-
-# cpe-stable-backport: Backported in 5.15.146
-CVE_CHECK_IGNORE += "CVE-2024-22705"
-
-# CVE-2024-23307 has no known resolution
-
-# CVE-2024-23848 has no known resolution
-
-# CVE-2024-23849 has no known resolution
-
-# CVE-2024-23850 has no known resolution
-
-# CVE-2024-23851 has no known resolution
+# Skipping dd=CVE-2023-1476, no affected_versions
 
-- 
2.34.1


