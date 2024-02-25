Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A21C5C54E55
	for <webhook@archiver.kernel.org>; Sun, 25 Feb 2024 21:53:34 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.7442.1708898006565335291
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 13:53:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gcoS6VOr;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-299566373d4so1540175a91.1
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 13:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708898006; x=1709502806; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f2dw45sLiUJjCKHTH2EBkw4puQMeeXBSvaQzMQkqueM=;
        b=gcoS6VOrR1hWozzNLaKzqgqXsjc2q+SA/iEjEPBWlOTsbMT+zCprCrsdn66CkVeXqf
         1CQhPXqcZLu9Hi+h0o6osjxoAqfuPCPtMziPOVc2mUwam9459Zpbm7R2OZSKh94huQRR
         G9QPoiuugsXzz2J9hoRRlLwHraGFqJtlfwOAXe29AtIW+BSiTZfrz2VT1rcpnmQv8S5M
         l7K/PPd2lNw3q6HX3ajuyK5ly86EHHOFGeTrIbo684lZ2D7UgKEbOoHPLUF7FqcBdG62
         Cxtxv+rcZGcQdgJl7JOH5rXFKdkto/vZQOlijWXox1Yu0iTY/LQjbb8SVLoov2h0SncB
         fA1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708898006; x=1709502806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f2dw45sLiUJjCKHTH2EBkw4puQMeeXBSvaQzMQkqueM=;
        b=VEDSv2DEBBIFruR2eM45Hc3p07g2m0jSPSyTmuBD2shmiKFZNPRc3fIdvJfyf5igy8
         k/60HvRoK4RqKuGo+AVnXltgMCMqoBAYFJdNT79u4HTsSyzEv0bZkSLNF1CagPrGmzFL
         iKSapcUhJF6dSRWaMlF45JDaHqZZGny/FgWwh8aojqL4aDgNZy1JTxk/UBPDN0Jf9F8p
         0l5YhJNUgbKi1vv8gqOllA6hL3a+xYeJLyP0m9M7lNute3R9dIQE90UGoYefxQB3zONV
         bUUxfxuYSS9k8qQjXwr9g3g16nC/cSqVzjRM26lbfOaAy0SHcH3C7StciqyMzV6gggAK
         6nfA==
X-Gm-Message-State: AOJu0YwInrzrjiiYVtqhPx5gX+kl6+qnFA3E7BznQP3J1Zy6X7jdMusJ
	M9/jzKp7Zw2+6HEq1Pnp+Nn9tUaEM6cZCge84uSxoCYj82n0gc3OsyBrXrLg66SOmITlToVNyzr
	wU/RQFw==
X-Google-Smtp-Source: AGHT+IHAtf/XxG4hcep/XaEKnA7rq9i2FUwKzHPrGL3ig2CgYfhS9IJEK4MkldlBG2ObHihtzQMvMQ==
X-Received: by 2002:a17:90b:46c3:b0:299:3258:4053 with SMTP id jx3-20020a17090b46c300b0029932584053mr3021939pjb.15.1708898005821;
        Sun, 25 Feb 2024 13:53:25 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a12-20020a17090acb8c00b0029a4089fbf0sm3082947pju.16.2024.02.25.13.53.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 13:53:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/22] linux-yocto/5.15: update CVE exclusions
Date: Sun, 25 Feb 2024 11:52:36 -1000
Message-Id: <b71eeab71911ab49a8e8b8d78560fdbd66f883e7.1708897822.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708897822.git.steve@sakoman.com>
References: <cover.1708897822.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 21:53:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196169

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/nluedtke/linux_kernel_cves

    1/1 [
        Author: Nicholas Luedtke
        Email: nicholas.luedtke@uwalumni.com
        Subject: Update 3Feb24
        Date: Sat, 3 Feb 2024 00:42:14 -0500

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/cve-exclusion_5.15.inc              | 91 +++++++++++++++++--
 1 file changed, 85 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
index 0d54b414d9..d33f2b3c7f 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-01-18 18:47:24.084935 for version 5.15.147
+# Generated at 2024-02-06 21:02:11.546853 for version 5.15.148
 
 python check_kernel_cve_status_version() {
-    this_version = "5.15.147"
+    this_version = "5.15.148"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -5299,6 +5299,12 @@ CVE_CHECK_IGNORE += "CVE-2021-3348"
 # fixed-version: Fixed after version 5.13rc7
 CVE_CHECK_IGNORE += "CVE-2021-33624"
 
+# fixed-version: Fixed after version 5.4rc1
+CVE_CHECK_IGNORE += "CVE-2021-33630"
+
+# cpe-stable-backport: Backported in 5.15.87
+CVE_CHECK_IGNORE += "CVE-2021-33631"
+
 # cpe-stable-backport: Backported in 5.15.54
 CVE_CHECK_IGNORE += "CVE-2021-33655"
 
@@ -6395,7 +6401,8 @@ CVE_CHECK_IGNORE += "CVE-2022-3635"
 # fixed-version: only affects 5.19 onwards
 CVE_CHECK_IGNORE += "CVE-2022-3640"
 
-# CVE-2022-36402 has no known resolution
+# cpe-stable-backport: Backported in 5.15.129
+CVE_CHECK_IGNORE += "CVE-2022-36402"
 
 # CVE-2022-3642 has no known resolution
 
@@ -7368,9 +7375,15 @@ CVE_CHECK_IGNORE += "CVE-2023-4611"
 # cpe-stable-backport: Backported in 5.15.132
 CVE_CHECK_IGNORE += "CVE-2023-4623"
 
+# cpe-stable-backport: Backported in 5.15.137
+CVE_CHECK_IGNORE += "CVE-2023-46343"
+
 # cpe-stable-backport: Backported in 5.15.137
 CVE_CHECK_IGNORE += "CVE-2023-46813"
 
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-46838"
+
 # cpe-stable-backport: Backported in 5.15.140
 CVE_CHECK_IGNORE += "CVE-2023-46862"
 
@@ -7385,11 +7398,17 @@ CVE_CHECK_IGNORE += "CVE-2023-4881"
 # cpe-stable-backport: Backported in 5.15.132
 CVE_CHECK_IGNORE += "CVE-2023-4921"
 
-# CVE-2023-50431 has no known resolution
+# CVE-2023-50431 needs backporting (fixed from 6.8rc1)
 
 # fixed-version: only affects 6.0rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-5090"
 
+# cpe-stable-backport: Backported in 5.15.128
+CVE_CHECK_IGNORE += "CVE-2023-51042"
+
+# cpe-stable-backport: Backported in 5.15.121
+CVE_CHECK_IGNORE += "CVE-2023-51043"
+
 # cpe-stable-backport: Backported in 5.15.135
 CVE_CHECK_IGNORE += "CVE-2023-5158"
 
@@ -7411,6 +7430,9 @@ CVE_CHECK_IGNORE += "CVE-2023-51782"
 # cpe-stable-backport: Backported in 5.15.134
 CVE_CHECK_IGNORE += "CVE-2023-5197"
 
+# cpe-stable-backport: Backported in 5.15.147
+CVE_CHECK_IGNORE += "CVE-2023-52340"
+
 # fixed-version: only affects 6.1rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-5345"
 
@@ -7425,7 +7447,8 @@ CVE_CHECK_IGNORE += "CVE-2023-5972"
 
 # CVE-2023-6039 needs backporting (fixed from 6.5rc5)
 
-# CVE-2023-6040 needs backporting (fixed from 5.18rc1)
+# cpe-stable-backport: Backported in 5.15.147
+CVE_CHECK_IGNORE += "CVE-2023-6040"
 
 # fixed-version: only affects 6.6rc3 onwards
 CVE_CHECK_IGNORE += "CVE-2023-6111"
@@ -7436,6 +7459,9 @@ CVE_CHECK_IGNORE += "CVE-2023-6121"
 # cpe-stable-backport: Backported in 5.15.132
 CVE_CHECK_IGNORE += "CVE-2023-6176"
 
+# fixed-version: only affects 6.6rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-6200"
+
 # CVE-2023-6238 has no known resolution
 
 # CVE-2023-6270 has no known resolution
@@ -7468,6 +7494,9 @@ CVE_CHECK_IGNORE += "CVE-2023-6679"
 # cpe-stable-backport: Backported in 5.15.143
 CVE_CHECK_IGNORE += "CVE-2023-6817"
 
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-6915"
+
 # cpe-stable-backport: Backported in 5.15.143
 CVE_CHECK_IGNORE += "CVE-2023-6931"
 
@@ -7487,5 +7516,55 @@ CVE_CHECK_IGNORE += "CVE-2024-0193"
 # fixed-version: only affects 6.2rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2024-0443"
 
-# Skipping dd=CVE-2023-1476, no affected_versions
+# cpe-stable-backport: Backported in 5.15.64
+CVE_CHECK_IGNORE += "CVE-2024-0562"
+
+# CVE-2024-0564 has no known resolution
+
+# CVE-2024-0565 needs backporting (fixed from 6.7rc6)
+
+# fixed-version: only affects 6.4rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-0582"
+
+# cpe-stable-backport: Backported in 5.15.142
+CVE_CHECK_IGNORE += "CVE-2024-0584"
+
+# cpe-stable-backport: Backported in 5.15.140
+CVE_CHECK_IGNORE += "CVE-2024-0607"
+
+# cpe-stable-backport: Backported in 5.15.121
+CVE_CHECK_IGNORE += "CVE-2024-0639"
+
+# cpe-stable-backport: Backported in 5.15.135
+CVE_CHECK_IGNORE += "CVE-2024-0641"
+
+# cpe-stable-backport: Backported in 5.15.147
+CVE_CHECK_IGNORE += "CVE-2024-0646"
+
+# cpe-stable-backport: Backported in 5.15.112
+CVE_CHECK_IGNORE += "CVE-2024-0775"
+
+# CVE-2024-0841 has no known resolution
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2024-1085"
+
+# CVE-2024-1086 needs backporting (fixed from 6.8rc2)
+
+# CVE-2024-21803 has no known resolution
+
+# CVE-2024-22099 has no known resolution
+
+# cpe-stable-backport: Backported in 5.15.146
+CVE_CHECK_IGNORE += "CVE-2024-22705"
+
+# CVE-2024-23307 has no known resolution
+
+# CVE-2024-23848 has no known resolution
+
+# CVE-2024-23849 has no known resolution
+
+# CVE-2024-23850 has no known resolution
+
+# CVE-2024-23851 has no known resolution
 
-- 
2.34.1


