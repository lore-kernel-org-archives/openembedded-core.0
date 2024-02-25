Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38320C54E4F
	for <webhook@archiver.kernel.org>; Sun, 25 Feb 2024 21:53:14 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web10.7512.1708897986668588107
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 13:53:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cYGYxAQr;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.43, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5a03933eb55so1087909eaf.1
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 13:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708897986; x=1709502786; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hzGyl4tq+7tDIMnOri87rDmMlnzYyNk31Ng6hpCT2QE=;
        b=cYGYxAQrvtn5lBvqrPK2540JU/gWSo3zZ5eLowQpWvmB2wYbJSVhP1h6/W/qj2g2il
         j9yXIoo6nWUqbyVdSOSLNu/pi2RUgyvLJvfiU5U7ZsxknF9WwlKqxNWjH4KGYpLrwJd0
         JTXzRQ1U3/3z4AhJIajyS13AH+fj/dFigCsxvWvZ+5vE1ULq3GxBJmLGFOyNCPb3iSxM
         Oq4HHt5yO3IRWg0m/F56e596SFxh8uZU8tbdHvJ1flZIRPSUI1nNSn3uinIggojHU1eG
         VO9uzVnLrbjKIXSKuhacPCMbLRDsmRV2CqwXYIIuYh3elWfH/+u9L12VV7PUKA7NVffF
         X12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708897986; x=1709502786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hzGyl4tq+7tDIMnOri87rDmMlnzYyNk31Ng6hpCT2QE=;
        b=hXKEzSLSkQqDImHjpruS5704QuUZXiAic1LMytNosRxEP+xca43GKXT8aZVnvBXr2d
         mROB29rZy4A0YJxzspiwCXITiuh/Oas0UnIHXmcGNLNr3yDs7hOjYqBdZC5T1QCKR+nG
         K3dE2QkgLsWqwS0wgm9eUeEAxdBTZQYnOzhaLtCgNYG4hhG1WhKlH+kLta4JhmLwMqCM
         HKBGFpt92ggaGLEvU0yVgaGrr8o3zS27WETmpBvm3dE87+qroQjg2hxHOFJUQRy2Do0W
         zhAL4NV0ECe7F6GaQUnWh3S5+Lc35Ip2H8Fa3w5ExmgQJETW4wAcIR+WgzanF7OTRGTj
         q66w==
X-Gm-Message-State: AOJu0YzTBcgxC7XgGrwSw+mXrPED1f++wtNFfmJ6ZgL/2Tgy7acIN4Bo
	OefxPbCQwrkhR12Tzbce55NJegAwh4a1zCPE4I+ZoYmW2M1wKqT4j+hLBe9/b0OTtAVgpGIGLaI
	yYCZByw==
X-Google-Smtp-Source: AGHT+IEC/qWWsuzLjBCv50OLkppb4juQhJCwifrPQOIapPGhtS5t2uU6umU0dyGZuvlhvA1YGNVgeA==
X-Received: by 2002:a05:6358:7e54:b0:17b:6391:1135 with SMTP id p20-20020a0563587e5400b0017b63911135mr5991426rwm.25.1708897985568;
        Sun, 25 Feb 2024 13:53:05 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a12-20020a17090acb8c00b0029a4089fbf0sm3082947pju.16.2024.02.25.13.53.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 13:53:05 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/22] cve-exclusion_5.10.inc: update for 5.10.209
Date: Sun, 25 Feb 2024 11:52:27 -1000
Message-Id: <29fc80648be1b2ad70df8df9545aae4279f11df3.1708897822.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708897822.git.steve@sakoman.com>
References: <cover.1708897822.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 21:53:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196160

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/cve-exclusion_5.10.inc              | 199 +++++++++++++++++-
 1 file changed, 189 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_5.10.inc b/meta/recipes-kernel/linux/cve-exclusion_5.10.inc
index 583d81d0f2..4d959c90b1 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_5.10.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_5.10.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-12-05 05:25:07.507188 for version 5.10.202
+# Generated at 2024-02-21 03:55:27.305577 for version 5.10.209
 
 python check_kernel_cve_status_version() {
-    this_version = "5.10.202"
+    this_version = "5.10.209"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -5293,6 +5293,12 @@ CVE_CHECK_IGNORE += "CVE-2021-3348"
 # cpe-stable-backport: Backported in 5.10.46
 CVE_CHECK_IGNORE += "CVE-2021-33624"
 
+# fixed-version: Fixed after version 5.4rc1
+CVE_CHECK_IGNORE += "CVE-2021-33630"
+
+# cpe-stable-backport: Backported in 5.10.177
+CVE_CHECK_IGNORE += "CVE-2021-33631"
+
 # cpe-stable-backport: Backported in 5.10.130
 CVE_CHECK_IGNORE += "CVE-2021-33655"
 
@@ -5822,7 +5828,8 @@ CVE_CHECK_IGNORE += "CVE-2022-1419"
 # cpe-stable-backport: Backported in 5.10.134
 CVE_CHECK_IGNORE += "CVE-2022-1462"
 
-# CVE-2022-1508 needs backporting (fixed from 5.15rc1)
+# fixed-version: only affects 5.11rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2022-1508"
 
 # cpe-stable-backport: Backported in 5.10.110
 CVE_CHECK_IGNORE += "CVE-2022-1516"
@@ -6370,7 +6377,8 @@ CVE_CHECK_IGNORE += "CVE-2022-3635"
 # fixed-version: only affects 5.19 onwards
 CVE_CHECK_IGNORE += "CVE-2022-3640"
 
-# CVE-2022-36402 has no known resolution
+# cpe-stable-backport: Backported in 5.10.193
+CVE_CHECK_IGNORE += "CVE-2022-36402"
 
 # CVE-2022-3642 has no known resolution
 
@@ -6600,6 +6608,9 @@ CVE_CHECK_IGNORE += "CVE-2022-48425"
 # fixed-version: only affects 5.15rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2022-48502"
 
+# cpe-stable-backport: Backported in 5.10.118
+CVE_CHECK_IGNORE += "CVE-2022-48619"
+
 # fixed-version: Fixed after version 5.0rc1
 CVE_CHECK_IGNORE += "CVE-2023-0030"
 
@@ -6719,6 +6730,8 @@ CVE_CHECK_IGNORE += "CVE-2023-1382"
 # cpe-stable-backport: Backported in 5.10.10
 CVE_CHECK_IGNORE += "CVE-2023-1390"
 
+# CVE-2023-1476 has no known resolution
+
 # cpe-stable-backport: Backported in 5.10.169
 CVE_CHECK_IGNORE += "CVE-2023-1513"
 
@@ -6891,7 +6904,8 @@ CVE_CHECK_IGNORE += "CVE-2023-23559"
 
 # CVE-2023-23586 needs backporting (fixed from 5.12rc1)
 
-# CVE-2023-2430 needs backporting (fixed from 6.2rc5)
+# fixed-version: only affects 5.18rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-2430"
 
 # cpe-stable-backport: Backported in 5.10.177
 CVE_CHECK_IGNORE += "CVE-2023-2483"
@@ -7221,7 +7235,8 @@ CVE_CHECK_IGNORE += "CVE-2023-39194"
 # cpe-stable-backport: Backported in 5.10.188
 CVE_CHECK_IGNORE += "CVE-2023-39197"
 
-# CVE-2023-39198 needs backporting (fixed from 6.5rc7)
+# cpe-stable-backport: Backported in 5.10.208
+CVE_CHECK_IGNORE += "CVE-2023-39198"
 
 # cpe-stable-backport: Backported in 5.10.188
 CVE_CHECK_IGNORE += "CVE-2023-4004"
@@ -7322,7 +7337,8 @@ CVE_CHECK_IGNORE += "CVE-2023-45871"
 # fixed-version: only affects 6.5rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-45898"
 
-# CVE-2023-4610 needs backporting (fixed from 6.4)
+# fixed-version: only affects 6.4rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-4610"
 
 # fixed-version: only affects 6.4rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-4611"
@@ -7332,9 +7348,15 @@ CVE_CHECK_IGNORE += "CVE-2023-4611"
 # cpe-stable-backport: Backported in 5.10.195
 CVE_CHECK_IGNORE += "CVE-2023-4623"
 
+# cpe-stable-backport: Backported in 5.10.199
+CVE_CHECK_IGNORE += "CVE-2023-46343"
+
 # cpe-stable-backport: Backported in 5.10.199
 CVE_CHECK_IGNORE += "CVE-2023-46813"
 
+# cpe-stable-backport: Backported in 5.10.209
+CVE_CHECK_IGNORE += "CVE-2023-46838"
+
 # cpe-stable-backport: Backported in 5.10.202
 CVE_CHECK_IGNORE += "CVE-2023-46862"
 
@@ -7349,18 +7371,41 @@ CVE_CHECK_IGNORE += "CVE-2023-4881"
 # cpe-stable-backport: Backported in 5.10.195
 CVE_CHECK_IGNORE += "CVE-2023-4921"
 
+# CVE-2023-50431 needs backporting (fixed from 6.8rc1)
+
 # fixed-version: only affects 6.0rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-5090"
 
+# cpe-stable-backport: Backported in 5.10.192
+CVE_CHECK_IGNORE += "CVE-2023-51042"
+
+# cpe-stable-backport: Backported in 5.10.188
+CVE_CHECK_IGNORE += "CVE-2023-51043"
+
 # fixed-version: only affects 5.13rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-5158"
 
+# cpe-stable-backport: Backported in 5.10.206
+CVE_CHECK_IGNORE += "CVE-2023-51779"
+
 # cpe-stable-backport: Backported in 5.10.199
 CVE_CHECK_IGNORE += "CVE-2023-5178"
 
+# cpe-stable-backport: Backported in 5.10.205
+CVE_CHECK_IGNORE += "CVE-2023-51780"
+
+# cpe-stable-backport: Backported in 5.10.205
+CVE_CHECK_IGNORE += "CVE-2023-51781"
+
+# cpe-stable-backport: Backported in 5.10.205
+CVE_CHECK_IGNORE += "CVE-2023-51782"
+
 # cpe-stable-backport: Backported in 5.10.198
 CVE_CHECK_IGNORE += "CVE-2023-5197"
 
+# cpe-stable-backport: Backported in 5.10.208
+CVE_CHECK_IGNORE += "CVE-2023-52340"
+
 # fixed-version: only affects 6.1rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-5345"
 
@@ -7370,17 +7415,151 @@ CVE_CHECK_IGNORE += "CVE-2023-5633"
 # cpe-stable-backport: Backported in 5.10.199
 CVE_CHECK_IGNORE += "CVE-2023-5717"
 
-# CVE-2023-5972 needs backporting (fixed from 6.6rc7)
+# fixed-version: only affects 6.2rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-5972"
+
+# fixed-version: only affects 5.15rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-6039"
 
-# CVE-2023-6039 needs backporting (fixed from 6.5rc5)
+# cpe-stable-backport: Backported in 5.10.208
+CVE_CHECK_IGNORE += "CVE-2023-6040"
 
 # fixed-version: only affects 6.6rc3 onwards
 CVE_CHECK_IGNORE += "CVE-2023-6111"
 
-# CVE-2023-6121 needs backporting (fixed from 6.7rc3)
+# cpe-stable-backport: Backported in 5.10.203
+CVE_CHECK_IGNORE += "CVE-2023-6121"
 
 # cpe-stable-backport: Backported in 5.10.195
 CVE_CHECK_IGNORE += "CVE-2023-6176"
 
+# fixed-version: only affects 6.6rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-6200"
+
 # CVE-2023-6238 has no known resolution
 
+# CVE-2023-6240 has no known resolution
+
+# CVE-2023-6270 has no known resolution
+
+# CVE-2023-6356 has no known resolution
+
+# fixed-version: only affects 6.1rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-6531"
+
+# CVE-2023-6535 has no known resolution
+
+# CVE-2023-6536 has no known resolution
+
+# cpe-stable-backport: Backported in 5.10.192
+CVE_CHECK_IGNORE += "CVE-2023-6546"
+
+# CVE-2023-6560 needs backporting (fixed from 6.7rc4)
+
+# cpe-stable-backport: Backported in 5.10.206
+CVE_CHECK_IGNORE += "CVE-2023-6606"
+
+# CVE-2023-6610 needs backporting (fixed from 6.7rc7)
+
+# fixed-version: only affects 5.11rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-6622"
+
+# fixed-version: only affects 6.7rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-6679"
+
+# cpe-stable-backport: Backported in 5.10.204
+CVE_CHECK_IGNORE += "CVE-2023-6817"
+
+# cpe-stable-backport: Backported in 5.10.209
+CVE_CHECK_IGNORE += "CVE-2023-6915"
+
+# cpe-stable-backport: Backported in 5.10.204
+CVE_CHECK_IGNORE += "CVE-2023-6931"
+
+# cpe-stable-backport: Backported in 5.10.203
+CVE_CHECK_IGNORE += "CVE-2023-6932"
+
+# CVE-2023-7042 has no known resolution
+
+# cpe-stable-backport: Backported in 5.10.173
+CVE_CHECK_IGNORE += "CVE-2023-7192"
+
+# fixed-version: only affects 6.5rc6 onwards
+CVE_CHECK_IGNORE += "CVE-2024-0193"
+
+# CVE-2024-0340 needs backporting (fixed from 6.4rc6)
+
+# fixed-version: only affects 6.2rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-0443"
+
+# fixed-version: only affects 5.15rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-0562"
+
+# CVE-2024-0564 has no known resolution
+
+# CVE-2024-0565 needs backporting (fixed from 6.7rc6)
+
+# fixed-version: only affects 6.4rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-0582"
+
+# cpe-stable-backport: Backported in 5.10.203
+CVE_CHECK_IGNORE += "CVE-2024-0584"
+
+# CVE-2024-0607 needs backporting (fixed from 6.7rc2)
+
+# fixed-version: only affects 5.13rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-0639"
+
+# cpe-stable-backport: Backported in 5.10.198
+CVE_CHECK_IGNORE += "CVE-2024-0641"
+
+# cpe-stable-backport: Backported in 5.10.208
+CVE_CHECK_IGNORE += "CVE-2024-0646"
+
+# cpe-stable-backport: Backported in 5.10.180
+CVE_CHECK_IGNORE += "CVE-2024-0775"
+
+# CVE-2024-0841 has no known resolution
+
+# fixed-version: only affects 5.13rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-1085"
+
+# CVE-2024-1086 needs backporting (fixed from 6.8rc2)
+
+# CVE-2024-1312 needs backporting (fixed from 6.5rc4)
+
+# CVE-2024-21803 has no known resolution
+
+# CVE-2024-22099 has no known resolution
+
+# CVE-2024-22386 has no known resolution
+
+# fixed-version: only affects 5.15rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-22705"
+
+# CVE-2024-23196 has no known resolution
+
+# CVE-2024-23307 has no known resolution
+
+# CVE-2024-23848 has no known resolution
+
+# CVE-2024-23849 needs backporting (fixed from 6.8rc2)
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
+
-- 
2.34.1


