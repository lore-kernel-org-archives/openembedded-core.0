Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BEA6CA0EFC
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 14:03:32 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.10481.1755785011406742107
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 07:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O9orJ5wu;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-435de7f6d71so719859b6e.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 07:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755785010; x=1756389810; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oU2+nLenfzqmjLZ1GEGrWzJ8cR7XcqVZK6RSikmqfiA=;
        b=O9orJ5wu7mgtJ3QTK1XYXbiFQ4tFOGd9CgH4goeW9x6VS+noWcHlvRNTz/bYz4bc5v
         ZQxIvk/zooziaqk2XsHBTZnDQOdcdWspILoZqg2tNLQzv5H9awA+HQNEZmTXTbiOHrNR
         d8Vupwrqvzbwqm3/neVcq0yW7blMWvKLeKK8bC4um1SfLGWkxoSESUxL7j5FE4GZcAio
         wFHv7fWr8/EklJmNlT5TPnHZUPAG0KT3caY4o8zb5W27DMR7oWTviDSRQ9Ib4kLdu95y
         5IJkOYHFZzdGlnEV/jwf6eiRl1dhk2LDMPpuPPM7cSrm8+4Sew3UHyRDq4ergnED4aL7
         AKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755785010; x=1756389810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oU2+nLenfzqmjLZ1GEGrWzJ8cR7XcqVZK6RSikmqfiA=;
        b=S8ZI4Emmx0NXPYHdZ8wNHeomeZUFxqghyOaSt0Sdrf1Zc9eDrzg3ybgvP3IYqWJao6
         LVsVdnovhpAJk4obzvQnQGawpuhohpYc9asbf1Bc9faYHHpylQ4ST0SpgOYplO6DPxMo
         OIL6b/CPP8QK302K0mjKEd4XQIFB8/wWgapz+zRAjVt25CG8TbqTaqhCAumV6NeZyrjb
         JVI2d2yrKUlR9DSDEBsDPkWDebMl1eoNM0QhrPt2s4MHrsexw0YE51y2NB6YBH8QgQSM
         gfdV7/vHwZby2/Ye9AEBjyyQ7IKOjLkmAfy/ydRM6G3780C6FljLxwhuf8ebrO8y55K8
         QUjg==
X-Gm-Message-State: AOJu0YwRBTmvi0cs4hdsCj7MAc1fc5pvf6vmmemCifM5ZwLRzhMm2xEy
	9JcrjiJMtxjnqq2eOY1FN2Kodm7YvDRwBYrkapRS7U83kD3lZjDoEEJufPExj39p
X-Gm-Gg: ASbGncsHaxrrLFP+88By6joxHJcPvZHKO9jvNNI729zmfummuMRKsHCvEZY35qExOHE
	vEZAcUUDiMQ1mS4M8ysZtDyEF3D63TLcKsKU/JqKf8V/Qlsz9EXYBOtFIS5c9LOXKT7DP2BJal8
	Yofwj45UDHCouf9LNuuBL3I1B1KmqxFmWPfbnF6aJuewNQ1zurHwpIuciWTWcONcQ174ZTdhl2I
	tHFk7EDMts3QaYj/Rm7z9wdZsslMZcSyZSqt5s6PCqe5EJG2ruBlZ5q2jbIOd9/y6qduogNfWME
	yLZiioIcHnQlUq7jYNTzOVmgS0y2tA5XfL4hPzYtDp2QzKKohGv7YlXrOi54Vwv84zMpSrf9tMi
	sSOlr3lcdGwQ6AXUp+1rIyty+lmEJDFmWUObXhc8qdcmP4KNVhVUeZnHcLQv9I0mrwQED+cYGbN
	K1WQLJekblsuLXvi2hUBB/Pdk=
X-Google-Smtp-Source: AGHT+IEPQPSY0TGedFXWJWGNOeMlMyEA1ed9/68IzhSpOP44ZVkR/6khSXUx4Yf5Q8CVsI6gNvAqPg==
X-Received: by 2002:a05:6808:1a2a:b0:41c:127e:3531 with SMTP id 5614622812f47-4377d6bbb4bmr1143134b6e.13.1755785010031;
        Thu, 21 Aug 2025 07:03:30 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b11ddd693asm100447711cf.37.2025.08.21.07.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 07:03:29 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] linux-yocto/6.12: update CVE exclusions (6.12.42)
Date: Thu, 21 Aug 2025 10:03:22 -0400
Message-Id: <729c4b743be634e18e1e346ce60ab3be69fa8fe0.1755784780.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1755784780.git.bruce.ashfield@gmail.com>
References: <cover.1755784780.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 14:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222243

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 2 changes (2 new | 0 updated): - 2 new CVEs: CVE-2025-47184, CVE-2025-9300 - 0 updated CVEs:
        Date: Thu, 21 Aug 2025 13:06:23 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.12.inc              | 264 +++++++++++++++++-
 1 file changed, 254 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index a110f89af1..cc26368560 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-08-08 02:45:44.343204+00:00 for kernel version 6.12.41
-# From linux_kernel_cves cve_2025-08-08_0100Z-2-g05f2a09f419
+# Generated at 2025-08-21 13:18:00.380174+00:00 for kernel version 6.12.42
+# From linux_kernel_cves cve_2025-08-21_1200Z-2-g608fd2b01c2
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.12.41"
+    this_version = "6.12.42"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -4262,8 +4262,6 @@ CVE_STATUS[CVE-2022-50029] = "fixed-version: Fixed from version 6.0"
 
 CVE_STATUS[CVE-2022-50030] = "fixed-version: Fixed from version 6.0"
 
-CVE_STATUS[CVE-2022-50031] = "fixed-version: Fixed from version 6.0"
-
 CVE_STATUS[CVE-2022-50032] = "fixed-version: Fixed from version 6.0"
 
 CVE_STATUS[CVE-2022-50033] = "fixed-version: Fixed from version 6.0"
@@ -4364,8 +4362,6 @@ CVE_STATUS[CVE-2022-50080] = "fixed-version: Fixed from version 6.0"
 
 CVE_STATUS[CVE-2022-50082] = "fixed-version: Fixed from version 6.0"
 
-CVE_STATUS[CVE-2022-50083] = "fixed-version: Fixed from version 6.0"
-
 CVE_STATUS[CVE-2022-50084] = "fixed-version: Fixed from version 6.0"
 
 CVE_STATUS[CVE-2022-50085] = "fixed-version: Fixed from version 6.0"
@@ -4656,12 +4652,28 @@ CVE_STATUS[CVE-2022-50231] = "fixed-version: Fixed from version 6.0"
 
 # CVE-2022-50232 has no known resolution
 
+CVE_STATUS[CVE-2022-50233] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2023-32246] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-32249] = "fixed-version: Fixed from version 6.4"
+
 # CVE-2023-34319 has no known resolution
 
 # CVE-2023-34324 has no known resolution
 
+CVE_STATUS[CVE-2023-3865] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-3866] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-3867] = "fixed-version: Fixed from version 6.5"
+
 # CVE-2023-46838 has no known resolution
 
+CVE_STATUS[CVE-2023-4130] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-4515] = "fixed-version: Fixed from version 6.5"
+
 CVE_STATUS[CVE-2023-52433] = "fixed-version: Fixed from version 6.6"
 
 CVE_STATUS[CVE-2023-52434] = "fixed-version: Fixed from version 6.7"
@@ -11986,6 +11998,8 @@ CVE_STATUS[CVE-2024-58100] = "cpe-stable-backport: Backported in 6.12.25"
 
 CVE_STATUS[CVE-2024-58237] = "cpe-stable-backport: Backported in 6.12.9"
 
+CVE_STATUS[CVE-2024-58238] = "fixed-version: Fixed from version 6.9"
+
 CVE_STATUS[CVE-2025-21629] = "cpe-stable-backport: Backported in 6.12.9"
 
 CVE_STATUS[CVE-2025-21631] = "cpe-stable-backport: Backported in 6.12.10"
@@ -12478,7 +12492,7 @@ CVE_STATUS[CVE-2025-21882] = "fixed-version: only affects 6.13 onwards"
 
 CVE_STATUS[CVE-2025-21883] = "cpe-stable-backport: Backported in 6.12.18"
 
-# CVE-2025-21884 needs backporting (fixed from 6.14)
+# CVE-2025-21884 may need backporting (fixed from 6.12.43)
 
 CVE_STATUS[CVE-2025-21885] = "cpe-stable-backport: Backported in 6.12.18"
 
@@ -13960,8 +13974,6 @@ CVE_STATUS[CVE-2025-38211] = "cpe-stable-backport: Backported in 6.12.35"
 
 CVE_STATUS[CVE-2025-38212] = "cpe-stable-backport: Backported in 6.12.35"
 
-CVE_STATUS[CVE-2025-38213] = "cpe-stable-backport: Backported in 6.12.35"
-
 CVE_STATUS[CVE-2025-38214] = "cpe-stable-backport: Backported in 6.12.35"
 
 CVE_STATUS[CVE-2025-38215] = "cpe-stable-backport: Backported in 6.12.35"
@@ -14532,8 +14544,240 @@ CVE_STATUS[CVE-2025-38497] = "cpe-stable-backport: Backported in 6.12.40"
 
 CVE_STATUS[CVE-2025-38498] = "cpe-stable-backport: Backported in 6.12.34"
 
+CVE_STATUS[CVE-2025-38499] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38500] = "cpe-stable-backport: Backported in 6.12.41"
+
+CVE_STATUS[CVE-2025-38501] = "cpe-stable-backport: Backported in 6.12.42"
+
+# CVE-2025-38502 needs backporting (fixed from 6.17rc1)
+
+CVE_STATUS[CVE-2025-38503] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38504] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38505] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38506] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38507] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38508] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-38509] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-38510] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38511] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38512] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38513] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38514] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38515] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38516] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38517] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38518] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38519] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38520] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38521] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38522] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38523] = "cpe-stable-backport: Backported in 6.12.36"
+
+CVE_STATUS[CVE-2025-38524] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38525] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-38526] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38527] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38528] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38529] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38530] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38531] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38532] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38533] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38534] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-38535] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38536] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38537] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38538] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38539] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38540] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38541] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38542] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38543] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38544] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38545] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38546] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38547] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38548] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38549] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38550] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38551] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38552] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38553] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38554] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38555] = "cpe-stable-backport: Backported in 6.12.42"
+
+# CVE-2025-38556 needs backporting (fixed from 6.17rc1)
+
+CVE_STATUS[CVE-2025-38557] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38558] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-38559] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38560] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38561] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38562] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38563] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38564] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-38565] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38566] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38567] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38568] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38569] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38570] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-38571] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38572] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38573] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38574] = "cpe-stable-backport: Backported in 6.12.42"
+
 CVE_STATUS[CVE-2025-38575] = "cpe-stable-backport: Backported in 6.12.23"
 
+CVE_STATUS[CVE-2025-38576] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38577] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38578] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38579] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38580] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38581] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38582] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38583] = "cpe-stable-backport: Backported in 6.12.42"
+
+# CVE-2025-38584 needs backporting (fixed from 6.17rc1)
+
+CVE_STATUS[CVE-2025-38585] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38586] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38587] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38588] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38589] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-38590] = "cpe-stable-backport: Backported in 6.12.42"
+
+# CVE-2025-38591 needs backporting (fixed from 6.17rc1)
+
+CVE_STATUS[CVE-2025-38592] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38593] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38594] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-38595] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38596] = "fixed-version: only affects 6.16 onwards"
+
+# CVE-2025-38597 needs backporting (fixed from 6.17rc1)
+
+CVE_STATUS[CVE-2025-38598] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-38599] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38600] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-38601] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38602] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38603] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-38604] = "cpe-stable-backport: Backported in 6.12.42"
+
+# CVE-2025-38605 needs backporting (fixed from 6.17rc1)
+
+CVE_STATUS[CVE-2025-38606] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-38607] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38608] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38609] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38610] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38611] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38612] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38613] = "fixed-version: only affects 6.13 onwards"
+
+# CVE-2025-38614 may need backporting (fixed from 6.12.43)
+
+CVE_STATUS[CVE-2025-38615] = "cpe-stable-backport: Backported in 6.12.42"
+
 CVE_STATUS[CVE-2025-38637] = "cpe-stable-backport: Backported in 6.12.23"
 
 CVE_STATUS[CVE-2025-39688] = "cpe-stable-backport: Backported in 6.12.23"
-- 
2.39.2


