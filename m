Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B885EC48285
	for <webhook@archiver.kernel.org>; Sat, 27 Jan 2024 02:38:09 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.8373.1706323082138735382
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 18:38:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BU509Wqa;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d75c97ea6aso7166885ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 18:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706323081; x=1706927881; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hAYJz9wVwhz6J+jl7dc2ZcTubO9cJYwFwITEcWvIoI0=;
        b=BU509Wqaglr4kiQwQOPoSOK0gBwyPMIKxBHs0xNu+zuSTKh9ZyBSAX5DuO0aSGd3Je
         ZHA8sT8wq7HALfD4me48jlu5R4RBs0Nit/Nc4/puvVXo6A/I5hdG/bv/6TO5ondI4k01
         OqtD35JTgE6EI/tuPXrch/Xm2w6UKRgJB6UFRZf2dFSPxmOTaKaIMNXNShd33H9Eak0W
         LAdwZf2unPKmJ8OGCx0yRViICkxhq3J+CtRXTGvHrpeGkehRyEEMNdhqTGyfXxUn9Ecp
         kh4k4ybXxvr+8nHK+kHba61OIvyjT7LeP6iAVlmt0t3tf9J2MLL9AQ7gVYIE2gMJB/Ox
         W5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706323081; x=1706927881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hAYJz9wVwhz6J+jl7dc2ZcTubO9cJYwFwITEcWvIoI0=;
        b=otJV5m9KEUjJeRMGRMnrPmeAm3IZtJd3N0SgPc50r/JzKDOPNiYNg402ua03i01Z5p
         fKqhzX0jfRwXc6nNXDrD79Dxct0eoQoGlzYaGJgIx5EVO8XP9lBQUUnqXREF1+Shii9N
         msCPA2WbEpceAj+mKGhW6Ptp0CtJZPdNT6KJtCL8n+MC7Y8A3HPchJqOg/Z5GfKWVDgb
         UYGaoujauY7z0x7+by0iWLtKF5ulwTwWmxMNBdaW3iEfncvXMT0Le49L5WBsn/8l3Bek
         kbQKK8mCFRCxFjrW+cmy+lyrILEF8C0AIWYNXr+w7IAxEVZjIj2h/eaZNJPsKX9qBfm6
         N/MQ==
X-Gm-Message-State: AOJu0Yz4JNvms2mvho0uVxEZN2chk4e7Dmv8fxcCp/PSVgXbkxhiksbZ
	Py/QhEgBzpOI0BLORpkY2NwBywULIuP3IMZuV0BnnjptTmsqTcv9Nj7rhOFUrZ2oP4xgXwkIW2D
	De2v//Q==
X-Google-Smtp-Source: AGHT+IFAHol0Gadoli8k2m6fbzlfu8T6bCGp5Wd4FG9sz++honK6ErwtH/9pAgE+y5F5WVxIlDDzsA==
X-Received: by 2002:a17:902:a50c:b0:1d7:19ec:2eaf with SMTP id s12-20020a170902a50c00b001d719ec2eafmr798478plq.6.1706323080771;
        Fri, 26 Jan 2024 18:38:00 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id r8-20020a170902be0800b001d7405022ecsm1547045pls.159.2024.01.26.18.37.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 18:38:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 12/23] linux-yocto/6.1: update CVE exclusions
Date: Fri, 26 Jan 2024 16:37:20 -1000
Message-Id: <dfd3c5c6fbe2cd3b0723879bd2b6574eb59a5860.1706322780.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706322780.git.steve@sakoman.com>
References: <cover.1706322780.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jan 2024 02:38:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194421

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/nluedtke/linux_kernel_cves

    1/1 [
        Author: Nicholas Luedtke
        Email: nicholas.luedtke@uwalumni.com
        Subject: Update 15Jan24
        Date: Mon, 15 Jan 2024 12:48:45 -0500

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 74bf102eb4ae7377527a146e3db1d9ee1da1f2da)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/cve-exclusion_6.1.inc               | 34 +++++++++++++++----
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
index 4183ceab04..45fcc7b260 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-01-11 18:31:26.124059+00:00 for version 6.1.72
+# Generated at 2024-01-18 21:10:06.148505+00:00 for version 6.1.73
 
 python check_kernel_cve_status_version() {
-    this_version = "6.1.72"
+    this_version = "6.1.73"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -4584,6 +4584,8 @@ CVE_STATUS[CVE-2022-48425] = "cpe-stable-backport: Backported in 6.1.33"
 
 CVE_STATUS[CVE-2022-48502] = "cpe-stable-backport: Backported in 6.1.40"
 
+CVE_STATUS[CVE-2022-48619] = "fixed-version: Fixed from version 5.18rc1"
+
 CVE_STATUS[CVE-2023-0030] = "fixed-version: Fixed from version 5.0rc1"
 
 CVE_STATUS[CVE-2023-0045] = "cpe-stable-backport: Backported in 6.1.5"
@@ -4644,7 +4646,7 @@ CVE_STATUS[CVE-2023-1118] = "cpe-stable-backport: Backported in 6.1.16"
 
 CVE_STATUS[CVE-2023-1192] = "cpe-stable-backport: Backported in 6.1.33"
 
-# CVE-2023-1193 needs backporting (fixed from 6.3rc6)
+CVE_STATUS[CVE-2023-1193] = "cpe-stable-backport: Backported in 6.1.71"
 
 CVE_STATUS[CVE-2023-1194] = "cpe-stable-backport: Backported in 6.1.34"
 
@@ -4666,6 +4668,8 @@ CVE_STATUS[CVE-2023-1382] = "fixed-version: Fixed from version 6.1rc7"
 
 CVE_STATUS[CVE-2023-1390] = "fixed-version: Fixed from version 5.11rc4"
 
+# CVE-2023-1476 has no known resolution
+
 CVE_STATUS[CVE-2023-1513] = "cpe-stable-backport: Backported in 6.1.13"
 
 CVE_STATUS[CVE-2023-1582] = "fixed-version: Fixed from version 5.17rc4"
@@ -5088,7 +5092,7 @@ CVE_STATUS[CVE-2023-45871] = "cpe-stable-backport: Backported in 6.1.53"
 
 CVE_STATUS[CVE-2023-45898] = "fixed-version: only affects 6.5rc1 onwards"
 
-# CVE-2023-4610 needs backporting (fixed from 6.4)
+CVE_STATUS[CVE-2023-4610] = "fixed-version: only affects 6.4rc1 onwards"
 
 CVE_STATUS[CVE-2023-4611] = "fixed-version: only affects 6.4rc1 onwards"
 
@@ -5112,7 +5116,7 @@ CVE_STATUS[CVE-2023-5090] = "cpe-stable-backport: Backported in 6.1.62"
 
 CVE_STATUS[CVE-2023-5158] = "cpe-stable-backport: Backported in 6.1.57"
 
-# CVE-2023-51779 needs backporting (fixed from 6.7rc7)
+CVE_STATUS[CVE-2023-51779] = "cpe-stable-backport: Backported in 6.1.70"
 
 CVE_STATUS[CVE-2023-5178] = "cpe-stable-backport: Backported in 6.1.60"
 
@@ -5134,6 +5138,8 @@ CVE_STATUS[CVE-2023-5972] = "fixed-version: only affects 6.2rc1 onwards"
 
 # CVE-2023-6039 needs backporting (fixed from 6.5rc5)
 
+CVE_STATUS[CVE-2023-6040] = "fixed-version: Fixed from version 5.18rc1"
+
 CVE_STATUS[CVE-2023-6111] = "fixed-version: only affects 6.6rc3 onwards"
 
 CVE_STATUS[CVE-2023-6121] = "cpe-stable-backport: Backported in 6.1.65"
@@ -5142,8 +5148,12 @@ CVE_STATUS[CVE-2023-6176] = "cpe-stable-backport: Backported in 6.1.54"
 
 # CVE-2023-6238 has no known resolution
 
+# CVE-2023-6270 has no known resolution
+
 # CVE-2023-6356 has no known resolution
 
+CVE_STATUS[CVE-2023-6531] = "cpe-stable-backport: Backported in 6.1.68"
+
 # CVE-2023-6535 has no known resolution
 
 # CVE-2023-6536 has no known resolution
@@ -5152,13 +5162,13 @@ CVE_STATUS[CVE-2023-6546] = "cpe-stable-backport: Backported in 6.1.47"
 
 # CVE-2023-6560 needs backporting (fixed from 6.7rc4)
 
-# CVE-2023-6606 needs backporting (fixed from 6.7rc7)
+CVE_STATUS[CVE-2023-6606] = "cpe-stable-backport: Backported in 6.1.70"
 
 # CVE-2023-6610 needs backporting (fixed from 6.7rc7)
 
 CVE_STATUS[CVE-2023-6622] = "cpe-stable-backport: Backported in 6.1.68"
 
-# CVE-2023-6679 needs backporting (fixed from 6.7rc6)
+CVE_STATUS[CVE-2023-6679] = "fixed-version: only affects 6.7rc1 onwards"
 
 CVE_STATUS[CVE-2023-6817] = "cpe-stable-backport: Backported in 6.1.68"
 
@@ -5168,3 +5178,13 @@ CVE_STATUS[CVE-2023-6932] = "cpe-stable-backport: Backported in 6.1.66"
 
 # CVE-2023-7042 has no known resolution
 
+CVE_STATUS[CVE-2023-7192] = "cpe-stable-backport: Backported in 6.1.18"
+
+CVE_STATUS[CVE-2024-0193] = "fixed-version: only affects 6.5rc6 onwards"
+
+# CVE-2024-0340 needs backporting (fixed from 6.4rc6)
+
+CVE_STATUS[CVE-2024-0443] = "fixed-version: only affects 6.2rc1 onwards"
+
+# Skipping dd=CVE-2023-1476, no affected_versions
+
-- 
2.34.1


