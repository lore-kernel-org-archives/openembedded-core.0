Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC60FC4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 02:33:59 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.11167.1702002830347314945
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 18:33:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PeoNEO5f;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d0538d9bbcso14792695ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 18:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702002829; x=1702607629; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+xIV3VnzYiDFXAc4gQ/HUy6tTYxt2hwKv9dPU0ADCQ=;
        b=PeoNEO5fsbC1WN7nvHOcktRpymgmpAIPh9h+fzQ/c54vBheh4BUbgj3dgtqTWdpamb
         Lfqb6QPfPAvDJIOJCC1cHArtdSKrct8T7VCGb2SNMJFYu0KzxdV9NwfiSoFSnGqPTxcW
         fIavjdc5lnljWUi4k2f9OqghjQN/i+yMqoDWv1q1VarIfi14JkE5G80kuKJsEpsWwNb1
         yDg+0gZN6nA6YNGBplvAeKGpmHtDKcBS4gFgqYVVsPLMP7htv1oM9IxpqgJ5U5atg3UG
         cBoj51z1LwzYyMJthoGq28bO/EWY9Wd3wsMjxjqp38qHSLMgnCNl0nYnyU/ywKpXPFzg
         FK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702002829; x=1702607629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3+xIV3VnzYiDFXAc4gQ/HUy6tTYxt2hwKv9dPU0ADCQ=;
        b=D/KfvXY500OazYX7keLCWyBIo9tM9bZsYLDRSPCgro9TQoih8h+lN8YA7Ok4EIZQlf
         WIeV0+0gXQVy8jPQCqX+7yvHphUzPtr+7ReSHR1NHemXpGCkVyVLBvJA6R0/Se/uuH1X
         27Beda46baugSIoL4Z5vfk+9CGX/UESMGsQL6T6PxzjNKUTsbj0JuqkVsonmZ+ZhMwpr
         3VIrsZT1JrEViaQOnkcQlzauofr/ki+jclGcRHjnCtWiMzzsD0FlNaKlpy8b4ir3FqRb
         wktFHH2pLiW1kHQKAx0A3R1kzkJKyOicqr423neGXdeyDAo/mdkSiztO4V5bbhta22jX
         zYsQ==
X-Gm-Message-State: AOJu0YxzZWu8fkYFy7b+GsNtMPxka6okfKGfb9qGHbB+ljHGNjDqiOya
	5ADSfvp1hCKJ4OqLDRlBo8YFNBcGmljCKKVVpLE=
X-Google-Smtp-Source: AGHT+IFhnIrdRTZSvPFhXKN76bJXkOUZecIqH9w1RRdJvIUGPlemmG+mdaVaLtBAC7XdPPHJgOaESw==
X-Received: by 2002:a17:902:d48a:b0:1d0:d312:bbfe with SMTP id c10-20020a170902d48a00b001d0d312bbfemr4396680plg.15.1702002828994;
        Thu, 07 Dec 2023 18:33:48 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id i11-20020a170902c94b00b001c9bc811d4dsm499752pla.295.2023.12.07.18.33.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 18:33:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/15] cve-exclusion_5.10.inc: update for 5.10.202
Date: Thu,  7 Dec 2023 16:33:14 -1000
Message-Id: <d910f67c61c79379614837b29be787ceb4181391.1702002667.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702002667.git.steve@sakoman.com>
References: <cover.1702002667.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 02:33:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192000

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/cve-exclusion_5.10.inc              | 92 +++++++++++++++----
 1 file changed, 73 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_5.10.inc b/meta/recipes-kernel/linux/cve-exclusion_5.10.inc
index 7b4f68c428..583d81d0f2 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_5.10.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_5.10.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-10-24 06:17:08.900468 for version 5.10.197
+# Generated at 2023-12-05 05:25:07.507188 for version 5.10.202
 
 python check_kernel_cve_status_version() {
-    this_version = "5.10.197"
+    this_version = "5.10.202"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -5651,7 +5651,8 @@ CVE_CHECK_IGNORE += "CVE-2021-43976"
 # cpe-stable-backport: Backported in 5.10.89
 CVE_CHECK_IGNORE += "CVE-2021-44733"
 
-# CVE-2021-44879 needs backporting (fixed from 5.17rc1)
+# cpe-stable-backport: Backported in 5.10.200
+CVE_CHECK_IGNORE += "CVE-2021-44879"
 
 # cpe-stable-backport: Backported in 5.10.91
 CVE_CHECK_IGNORE += "CVE-2021-45095"
@@ -6515,7 +6516,7 @@ CVE_CHECK_IGNORE += "CVE-2022-43945"
 
 # CVE-2022-44033 needs backporting (fixed from 6.4rc1)
 
-# CVE-2022-44034 has no known resolution
+# CVE-2022-44034 needs backporting (fixed from 6.4rc1)
 
 # CVE-2022-4543 has no known resolution
 
@@ -6686,7 +6687,8 @@ CVE_CHECK_IGNORE += "CVE-2023-1118"
 # fixed-version: only affects 5.15rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-1192"
 
-# CVE-2023-1193 has no known resolution
+# fixed-version: only affects 5.15rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-1193"
 
 # fixed-version: only affects 5.15rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-1194"
@@ -6982,7 +6984,8 @@ CVE_CHECK_IGNORE += "CVE-2023-3106"
 
 # CVE-2023-31084 needs backporting (fixed from 6.4rc3)
 
-# CVE-2023-31085 needs backporting (fixed from 5.10.198)
+# cpe-stable-backport: Backported in 5.10.198
+CVE_CHECK_IGNORE += "CVE-2023-31085"
 
 # cpe-stable-backport: Backported in 5.10.184
 CVE_CHECK_IGNORE += "CVE-2023-3111"
@@ -7098,7 +7101,8 @@ CVE_CHECK_IGNORE += "CVE-2023-34256"
 # fixed-version: only affects 6.1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-34319"
 
-# CVE-2023-34324 needs backporting (fixed from 5.10.198)
+# cpe-stable-backport: Backported in 5.10.198
+CVE_CHECK_IGNORE += "CVE-2023-34324"
 
 # fixed-version: only affects 5.15rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-3439"
@@ -7123,7 +7127,8 @@ CVE_CHECK_IGNORE += "CVE-2023-35824"
 # fixed-version: only affects 5.18rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-35826"
 
-# CVE-2023-35827 has no known resolution
+# cpe-stable-backport: Backported in 5.10.199
+CVE_CHECK_IGNORE += "CVE-2023-35827"
 
 # cpe-stable-backport: Backported in 5.10.180
 CVE_CHECK_IGNORE += "CVE-2023-35828"
@@ -7201,7 +7206,8 @@ CVE_CHECK_IGNORE += "CVE-2023-3867"
 # cpe-stable-backport: Backported in 5.10.195
 CVE_CHECK_IGNORE += "CVE-2023-39189"
 
-# CVE-2023-39191 needs backporting (fixed from 6.3rc1)
+# fixed-version: only affects 5.19rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-39191"
 
 # cpe-stable-backport: Backported in 5.10.195
 CVE_CHECK_IGNORE += "CVE-2023-39192"
@@ -7212,6 +7218,11 @@ CVE_CHECK_IGNORE += "CVE-2023-39193"
 # cpe-stable-backport: Backported in 5.10.192
 CVE_CHECK_IGNORE += "CVE-2023-39194"
 
+# cpe-stable-backport: Backported in 5.10.188
+CVE_CHECK_IGNORE += "CVE-2023-39197"
+
+# CVE-2023-39198 needs backporting (fixed from 6.5rc7)
+
 # cpe-stable-backport: Backported in 5.10.188
 CVE_CHECK_IGNORE += "CVE-2023-4004"
 
@@ -7223,7 +7234,8 @@ CVE_CHECK_IGNORE += "CVE-2023-4015"
 # cpe-stable-backport: Backported in 5.10.190
 CVE_CHECK_IGNORE += "CVE-2023-40283"
 
-# CVE-2023-40791 needs backporting (fixed from 6.5rc6)
+# fixed-version: only affects 6.3rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-40791"
 
 # cpe-stable-backport: Backported in 5.10.190
 CVE_CHECK_IGNORE += "CVE-2023-4128"
@@ -7253,7 +7265,8 @@ CVE_CHECK_IGNORE += "CVE-2023-4207"
 # cpe-stable-backport: Backported in 5.10.190
 CVE_CHECK_IGNORE += "CVE-2023-4208"
 
-# CVE-2023-4244 needs backporting (fixed from 5.10.198)
+# cpe-stable-backport: Backported in 5.10.198
+CVE_CHECK_IGNORE += "CVE-2023-4244"
 
 # cpe-stable-backport: Backported in 5.10.190
 CVE_CHECK_IGNORE += "CVE-2023-4273"
@@ -7264,7 +7277,8 @@ CVE_CHECK_IGNORE += "CVE-2023-42752"
 # cpe-stable-backport: Backported in 5.10.195
 CVE_CHECK_IGNORE += "CVE-2023-42753"
 
-# CVE-2023-42754 needs backporting (fixed from 5.10.198)
+# cpe-stable-backport: Backported in 5.10.198
+CVE_CHECK_IGNORE += "CVE-2023-42754"
 
 # cpe-stable-backport: Backported in 5.10.197
 CVE_CHECK_IGNORE += "CVE-2023-42755"
@@ -7290,7 +7304,8 @@ CVE_CHECK_IGNORE += "CVE-2023-44466"
 # cpe-stable-backport: Backported in 5.10.118
 CVE_CHECK_IGNORE += "CVE-2023-4459"
 
-# CVE-2023-4563 needs backporting (fixed from 5.10.198)
+# cpe-stable-backport: Backported in 5.10.198
+CVE_CHECK_IGNORE += "CVE-2023-4563"
 
 # fixed-version: only affects 5.13rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-4569"
@@ -7298,14 +7313,16 @@ CVE_CHECK_IGNORE += "CVE-2023-4569"
 # cpe-stable-backport: Backported in 5.10.173
 CVE_CHECK_IGNORE += "CVE-2023-45862"
 
-# CVE-2023-45863 needs backporting (fixed from 6.3rc1)
+# cpe-stable-backport: Backported in 5.10.200
+CVE_CHECK_IGNORE += "CVE-2023-45863"
 
 # cpe-stable-backport: Backported in 5.10.195
 CVE_CHECK_IGNORE += "CVE-2023-45871"
 
-# CVE-2023-45898 needs backporting (fixed from 6.6rc1)
+# fixed-version: only affects 6.5rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-45898"
 
-# CVE-2023-4610 has no known resolution
+# CVE-2023-4610 needs backporting (fixed from 6.4)
 
 # fixed-version: only affects 6.4rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-4611"
@@ -7315,18 +7332,55 @@ CVE_CHECK_IGNORE += "CVE-2023-4611"
 # cpe-stable-backport: Backported in 5.10.195
 CVE_CHECK_IGNORE += "CVE-2023-4623"
 
+# cpe-stable-backport: Backported in 5.10.199
+CVE_CHECK_IGNORE += "CVE-2023-46813"
+
+# cpe-stable-backport: Backported in 5.10.202
+CVE_CHECK_IGNORE += "CVE-2023-46862"
+
+# CVE-2023-47233 has no known resolution
+
 # cpe-stable-backport: Backported in 5.10.53
 CVE_CHECK_IGNORE += "CVE-2023-4732"
 
-# CVE-2023-4881 needs backporting (fixed from 5.10.198)
+# cpe-stable-backport: Backported in 5.10.198
+CVE_CHECK_IGNORE += "CVE-2023-4881"
 
 # cpe-stable-backport: Backported in 5.10.195
 CVE_CHECK_IGNORE += "CVE-2023-4921"
 
-# CVE-2023-5158 has no known resolution
+# fixed-version: only affects 6.0rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-5090"
+
+# fixed-version: only affects 5.13rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-5158"
+
+# cpe-stable-backport: Backported in 5.10.199
+CVE_CHECK_IGNORE += "CVE-2023-5178"
 
-# CVE-2023-5197 needs backporting (fixed from 5.10.198)
+# cpe-stable-backport: Backported in 5.10.198
+CVE_CHECK_IGNORE += "CVE-2023-5197"
 
 # fixed-version: only affects 6.1rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-5345"
 
+# fixed-version: only affects 6.2 onwards
+CVE_CHECK_IGNORE += "CVE-2023-5633"
+
+# cpe-stable-backport: Backported in 5.10.199
+CVE_CHECK_IGNORE += "CVE-2023-5717"
+
+# CVE-2023-5972 needs backporting (fixed from 6.6rc7)
+
+# CVE-2023-6039 needs backporting (fixed from 6.5rc5)
+
+# fixed-version: only affects 6.6rc3 onwards
+CVE_CHECK_IGNORE += "CVE-2023-6111"
+
+# CVE-2023-6121 needs backporting (fixed from 6.7rc3)
+
+# cpe-stable-backport: Backported in 5.10.195
+CVE_CHECK_IGNORE += "CVE-2023-6176"
+
+# CVE-2023-6238 has no known resolution
+
-- 
2.34.1


