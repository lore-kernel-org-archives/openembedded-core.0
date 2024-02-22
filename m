Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58913C54E41
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 14:31:08 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.13945.1708612263266623114
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Feb 2024 06:31:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VKW+h5yJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d731314e67so57752335ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 06:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708612262; x=1709217062; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5OENnao1rhVyRwyF8Jcs3ASibQMzSVQE/y8ojv6O9IE=;
        b=VKW+h5yJvYEpwMJVNvnVbMqcCLxuwrm2d/QjRGujNl/e3EmsifsphR3ZMCZm0s4unk
         M8kUz+QzUUr7t2GPilXzgVL700P/CWokD5Dq6M6ouWVdk/hzanfMw9PI0SadI2Z8RtJT
         Cui2A2Mi+XaSPzOeUQUQ7I3zs7wXyrQqkK0AMHRejz4UXnw/ooI75roMAcqSjPw9uuFV
         794w7FuSOH17HoAn/r111eauMDHWCj7gabhueI5cX3893g1Vh0GNtpTyOuGYWmktPXZA
         nH5xk5fQjbsrpGxGjN+oJGMSTnF9H3MAIyJgPKmWB5myhv3iwoydpXd+m4Hf4c8alehf
         Dz3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708612262; x=1709217062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5OENnao1rhVyRwyF8Jcs3ASibQMzSVQE/y8ojv6O9IE=;
        b=A5cf+e7pj/xaMK/yhbGEH5YKCSSFruVpSfblmr6jUnbud9k9zTU8VQJU7f4lseNd/m
         cVpoRnsaFZZEvuO/l/Doshq+p5tu+x1ckF7bhlxZHp3auzyPbxkT2zrkF9gbOzIc+YFG
         7nz2z34VaG+2IfZDOq4jUB6uq/lX/T2KHr5LewMrJFi2eeNkjEfDf3eayJWtSIHTshIP
         J0k/lF4PWPUBdEkZODsxa7VMKI8t6YwnoIXwauVPx/7dDD/kxRao6ISQaGFvmn56gbl1
         Zv91+v/012TzeqKU+8elENIPILSagHm4U22paaL3GvoYS1G4hdv2HsmGXQL0CEHmtwpp
         rSCQ==
X-Gm-Message-State: AOJu0YwtDl/BljcvOO2osXr5wBzUF0kCDaWSSkU5ZF3ORaajsgyGpPL9
	2Espcg06dpyR/fI7LSsfE7KOGti9TA6Q+bhSjqk9IY6AHgdXdtev2IZEsGEM22QU+vRHIV2NIMZ
	cNIk=
X-Google-Smtp-Source: AGHT+IHT1/QpGF87XDviRzZMu0AhOCyrm/huWxoWE7yfeYpJDXyi+ROdzE9WFlmgKR/5EUEnmqAVRA==
X-Received: by 2002:a17:902:6b82:b0:1d9:edf5:c858 with SMTP id p2-20020a1709026b8200b001d9edf5c858mr18142079plk.52.1708612262454;
        Thu, 22 Feb 2024 06:31:02 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id k13-20020a170902f28d00b001dbcf653024sm9364558plc.293.2024.02.22.06.31.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 06:31:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 8/9] cve-exclusion_5.4.inc: update for 5.4.268
Date: Thu, 22 Feb 2024 04:30:39 -1000
Message-Id: <7360603c50ca61ec9d6a49798ec6b67a80e93c69.1708612053.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708612053.git.steve@sakoman.com>
References: <cover.1708612053.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 14:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196027

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/cve-exclusion_5.4.inc               | 199 +++++++++++++++++-
 1 file changed, 188 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_5.4.inc b/meta/recipes-kernel/linux/cve-exclusion_5.4.inc
index 983424d427..79caff7c6c 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_5.4.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_5.4.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-12-05 04:45:42.561193 for version 5.4.262
+# Generated at 2024-02-21 03:40:25.997343 for version 5.4.268
 
 python check_kernel_cve_status_version() {
-    this_version = "5.4.262"
+    this_version = "5.4.268"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -5281,6 +5281,12 @@ CVE_CHECK_WHITELIST += "CVE-2021-3348"
 # cpe-stable-backport: Backported in 5.4.139
 CVE_CHECK_WHITELIST += "CVE-2021-33624"
 
+# fixed-version: Fixed after version 5.4rc1
+CVE_CHECK_WHITELIST += "CVE-2021-33630"
+
+# cpe-stable-backport: Backported in 5.4.240
+CVE_CHECK_WHITELIST += "CVE-2021-33631"
+
 # cpe-stable-backport: Backported in 5.4.205
 CVE_CHECK_WHITELIST += "CVE-2021-33655"
 
@@ -5810,7 +5816,8 @@ CVE_CHECK_WHITELIST += "CVE-2022-1419"
 # cpe-stable-backport: Backported in 5.4.208
 CVE_CHECK_WHITELIST += "CVE-2022-1462"
 
-# CVE-2022-1508 needs backporting (fixed from 5.15rc1)
+# fixed-version: only affects 5.11rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2022-1508"
 
 # fixed-version: only affects 5.7rc5 onwards
 CVE_CHECK_WHITELIST += "CVE-2022-1516"
@@ -6356,7 +6363,7 @@ CVE_CHECK_WHITELIST += "CVE-2022-3635"
 # fixed-version: only affects 5.19 onwards
 CVE_CHECK_WHITELIST += "CVE-2022-3640"
 
-# CVE-2022-36402 has no known resolution
+# CVE-2022-36402 needs backporting (fixed from 6.5)
 
 # CVE-2022-3642 has no known resolution
 
@@ -6585,6 +6592,9 @@ CVE_CHECK_WHITELIST += "CVE-2022-48425"
 # fixed-version: only affects 5.15rc1 onwards
 CVE_CHECK_WHITELIST += "CVE-2022-48502"
 
+# cpe-stable-backport: Backported in 5.4.196
+CVE_CHECK_WHITELIST += "CVE-2022-48619"
+
 # fixed-version: Fixed after version 5.0rc1
 CVE_CHECK_WHITELIST += "CVE-2023-0030"
 
@@ -6702,6 +6712,8 @@ CVE_CHECK_WHITELIST += "CVE-2023-1382"
 # cpe-stable-backport: Backported in 5.4.92
 CVE_CHECK_WHITELIST += "CVE-2023-1390"
 
+# CVE-2023-1476 has no known resolution
+
 # cpe-stable-backport: Backported in 5.4.232
 CVE_CHECK_WHITELIST += "CVE-2023-1513"
 
@@ -6873,7 +6885,8 @@ CVE_CHECK_WHITELIST += "CVE-2023-23559"
 # fixed-version: only affects 5.10rc1 onwards
 CVE_CHECK_WHITELIST += "CVE-2023-23586"
 
-# CVE-2023-2430 needs backporting (fixed from 6.2rc5)
+# fixed-version: only affects 5.18rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-2430"
 
 # cpe-stable-backport: Backported in 5.4.240
 CVE_CHECK_WHITELIST += "CVE-2023-2483"
@@ -7303,7 +7316,8 @@ CVE_CHECK_WHITELIST += "CVE-2023-45871"
 # fixed-version: only affects 6.5rc1 onwards
 CVE_CHECK_WHITELIST += "CVE-2023-45898"
 
-# CVE-2023-4610 needs backporting (fixed from 6.4)
+# fixed-version: only affects 6.4rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-4610"
 
 # fixed-version: only affects 6.4rc1 onwards
 CVE_CHECK_WHITELIST += "CVE-2023-4611"
@@ -7313,32 +7327,62 @@ CVE_CHECK_WHITELIST += "CVE-2023-4611"
 # cpe-stable-backport: Backported in 5.4.257
 CVE_CHECK_WHITELIST += "CVE-2023-4623"
 
+# cpe-stable-backport: Backported in 5.4.259
+CVE_CHECK_WHITELIST += "CVE-2023-46343"
+
 # fixed-version: only affects 5.10rc1 onwards
 CVE_CHECK_WHITELIST += "CVE-2023-46813"
 
-# CVE-2023-46862 needs backporting (fixed from 6.6)
+# cpe-stable-backport: Backported in 5.4.268
+CVE_CHECK_WHITELIST += "CVE-2023-46838"
+
+# fixed-version: only affects 5.10rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-46862"
 
 # CVE-2023-47233 has no known resolution
 
-# CVE-2023-4732 needs backporting (fixed from 5.14rc1)
+# fixed-version: only affects 5.7rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-4732"
 
 # CVE-2023-4881 needs backporting (fixed from 6.6rc1)
 
 # cpe-stable-backport: Backported in 5.4.257
 CVE_CHECK_WHITELIST += "CVE-2023-4921"
 
+# CVE-2023-50431 needs backporting (fixed from 6.8rc1)
+
 # fixed-version: only affects 6.0rc1 onwards
 CVE_CHECK_WHITELIST += "CVE-2023-5090"
 
+# cpe-stable-backport: Backported in 5.4.255
+CVE_CHECK_WHITELIST += "CVE-2023-51042"
+
+# cpe-stable-backport: Backported in 5.4.251
+CVE_CHECK_WHITELIST += "CVE-2023-51043"
+
 # fixed-version: only affects 5.13rc1 onwards
 CVE_CHECK_WHITELIST += "CVE-2023-5158"
 
+# CVE-2023-51779 needs backporting (fixed from 6.7rc7)
+
 # cpe-stable-backport: Backported in 5.4.260
 CVE_CHECK_WHITELIST += "CVE-2023-5178"
 
+# cpe-stable-backport: Backported in 5.4.265
+CVE_CHECK_WHITELIST += "CVE-2023-51780"
+
+# cpe-stable-backport: Backported in 5.4.265
+CVE_CHECK_WHITELIST += "CVE-2023-51781"
+
+# cpe-stable-backport: Backported in 5.4.265
+CVE_CHECK_WHITELIST += "CVE-2023-51782"
+
 # fixed-version: only affects 5.9rc1 onwards
 CVE_CHECK_WHITELIST += "CVE-2023-5197"
 
+# cpe-stable-backport: Backported in 5.4.267
+CVE_CHECK_WHITELIST += "CVE-2023-52340"
+
 # fixed-version: only affects 6.1rc1 onwards
 CVE_CHECK_WHITELIST += "CVE-2023-5345"
 
@@ -7348,17 +7392,150 @@ CVE_CHECK_WHITELIST += "CVE-2023-5633"
 # cpe-stable-backport: Backported in 5.4.259
 CVE_CHECK_WHITELIST += "CVE-2023-5717"
 
-# CVE-2023-5972 needs backporting (fixed from 6.6rc7)
+# fixed-version: only affects 6.2rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-5972"
+
+# fixed-version: only affects 5.15rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-6039"
 
-# CVE-2023-6039 needs backporting (fixed from 6.5rc5)
+# cpe-stable-backport: Backported in 5.4.267
+CVE_CHECK_WHITELIST += "CVE-2023-6040"
 
 # fixed-version: only affects 6.6rc3 onwards
 CVE_CHECK_WHITELIST += "CVE-2023-6111"
 
-# CVE-2023-6121 needs backporting (fixed from 6.7rc3)
+# cpe-stable-backport: Backported in 5.4.263
+CVE_CHECK_WHITELIST += "CVE-2023-6121"
 
 # fixed-version: only affects 5.7rc7 onwards
 CVE_CHECK_WHITELIST += "CVE-2023-6176"
 
+# fixed-version: only affects 6.6rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-6200"
+
 # CVE-2023-6238 has no known resolution
 
+# CVE-2023-6240 has no known resolution
+
+# CVE-2023-6270 has no known resolution
+
+# CVE-2023-6356 has no known resolution
+
+# fixed-version: only affects 6.1rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-6531"
+
+# CVE-2023-6535 has no known resolution
+
+# CVE-2023-6536 has no known resolution
+
+# CVE-2023-6546 needs backporting (fixed from 6.5rc7)
+
+# CVE-2023-6560 needs backporting (fixed from 6.7rc4)
+
+# cpe-stable-backport: Backported in 5.4.266
+CVE_CHECK_WHITELIST += "CVE-2023-6606"
+
+# CVE-2023-6610 needs backporting (fixed from 6.7rc7)
+
+# fixed-version: only affects 5.11rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-6622"
+
+# fixed-version: only affects 6.7rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-6679"
+
+# fixed-version: only affects 5.6rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-6817"
+
+# cpe-stable-backport: Backported in 5.4.268
+CVE_CHECK_WHITELIST += "CVE-2023-6915"
+
+# cpe-stable-backport: Backported in 5.4.264
+CVE_CHECK_WHITELIST += "CVE-2023-6931"
+
+# cpe-stable-backport: Backported in 5.4.263
+CVE_CHECK_WHITELIST += "CVE-2023-6932"
+
+# CVE-2023-7042 has no known resolution
+
+# cpe-stable-backport: Backported in 5.4.235
+CVE_CHECK_WHITELIST += "CVE-2023-7192"
+
+# fixed-version: only affects 6.5rc6 onwards
+CVE_CHECK_WHITELIST += "CVE-2024-0193"
+
+# CVE-2024-0340 needs backporting (fixed from 6.4rc6)
+
+# fixed-version: only affects 6.2rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2024-0443"
+
+# fixed-version: only affects 5.15rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2024-0562"
+
+# CVE-2024-0564 has no known resolution
+
+# CVE-2024-0565 needs backporting (fixed from 6.7rc6)
+
+# fixed-version: only affects 6.4rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2024-0582"
+
+# cpe-stable-backport: Backported in 5.4.263
+CVE_CHECK_WHITELIST += "CVE-2024-0584"
+
+# CVE-2024-0607 needs backporting (fixed from 6.7rc2)
+
+# fixed-version: only affects 5.13rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2024-0639"
+
+# fixed-version: only affects 5.5rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2024-0641"
+
+# cpe-stable-backport: Backported in 5.4.267
+CVE_CHECK_WHITELIST += "CVE-2024-0646"
+
+# cpe-stable-backport: Backported in 5.4.243
+CVE_CHECK_WHITELIST += "CVE-2024-0775"
+
+# CVE-2024-0841 has no known resolution
+
+# fixed-version: only affects 5.13rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2024-1085"
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
+CVE_CHECK_WHITELIST += "CVE-2024-22705"
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


