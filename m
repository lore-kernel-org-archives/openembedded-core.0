Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0506BEE6B52
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 20:27:51 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22.1770409670343854450
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 12:27:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B433ebFd;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5013d163e2fso11675101cf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 12:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770409669; x=1771014469; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P8MWAJe5XWbptDyysn94DYc2X1H3i8ecsYzKXuCxBAc=;
        b=B433ebFdlet6JbXsa8b/r2lXwVU39t74uL03vVeNtQWGcOFyeAu1mScKcCgyZVDqwc
         TKRJaFWbFVu9KKW2quo/YfozmDbLcJkDo84C1nfh2Vz/YZg8hSFxwEHkWTYnd3HUkFIP
         zNH5CiL3t2JmNM5UZpvSC0P9DIjjomrwWCsuS6Qa2wLxiZSST3Z9HVRTFrZjmDZ6kC5h
         HI7M/ncI+bLbdK2OR9X4QYwTJ11THB65OBNL+mdIQwbNesRG4cjhUsAGWwyhM7r86LMh
         pf6+eeo/uwE1bmR3Vf7BgtQcoSJ4hsfJkumGGteGE0bSVy1mGxL9dJf/rETBEj6itRwj
         GSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770409669; x=1771014469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P8MWAJe5XWbptDyysn94DYc2X1H3i8ecsYzKXuCxBAc=;
        b=VcbOhfTnQXLI3TPyaD2HumrLMSePa3dVOzLDV9U3mROcmrlHPiB5o4wCogkUyfYD4V
         ikbm1g102DI6ZDhUocS7dL0aLHcmdqoMe+V4iLOZJq000QUgnUkyKb1VEqyVPWCILve6
         pUkW3AaAGblVlW6RZJSJfeHrBbU1F37yP43lZxheLLBwm5flQmZ7hXuelVH6v60aawow
         ShjeZ0DpjfxmyRd7kNB9D/drCtM52g+wkoqGPM+aFw/eGw2JoOPrubIDB7YUO8lIG7Te
         hzcD5poD++wAFAnlioNXjWsRylPw/AiivBT3OOsBzvJmeAF+VPfNyiYSlyPpiSTc9HRd
         cRQA==
X-Gm-Message-State: AOJu0YwcmJrxTffjt2oUgkwCaD3P/l/78VgDIj9GbiS+xx7J/9L8C74p
	b4vgngsR+ZDgERnifYrCj/1ooRLAMggmopGbMhRyVJ7ZTt4uSzOOx2vPMLltWxR/
X-Gm-Gg: AZuq6aKCyhq4tzUSE358Khe2tIja3j5vkcTVctAJbslSr0nZEpxm25F9w0tukveCHyO
	6zOHkWdsXmsicfd7hF7fas9qDDJpfhpiDLnbXiqjGKHntzrgfphevhlbwjnqkwVV512MLpBlyem
	5V1DQqJfzEDH9ugqyoMhK8c4PgZVaat3M+M6MCukmluq47gTif78ssdafcN7mnmYfUe84JpzS3B
	u7tBQbVzhuK0WWoNoCfJ1jOPbEi1fDf5YwupSAIwjADjl3P3QoKEApv4Uut+TueoBjTvKBc36/2
	3r8nvGsgWGujKnQOYd17g2tLseCnfiUalzyA3zBXDo1zh05mUmjUZV0JFXqHSEbIb4RxMaFV4T0
	ggkEoS9x4LrwBS05KdkV8z8fM3k3QlgrecmkapqkNY4fko6cQ0U3Bbt/SuYSsecf+JDv8/1s9gV
	bAgF6g7zrSnrh924uQMWN0nmt4hh5AS9+maGEuf3wYeouOVyreExGFa6oe6clDQsMp8BJCBxBCU
	mqBNH3yQZd5S0vGbgtPB4MPIoJLViAP+YbQAJmxRGoLzsQ=
X-Received: by 2002:a05:622a:1486:b0:4ee:26bd:13fa with SMTP id d75a77b69052e-50639a3403dmr54820541cf.80.1770409668955;
        Fri, 06 Feb 2026 12:27:48 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-506392bf955sm22651541cf.25.2026.02.06.12.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 12:27:48 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 09/09] linux-yocto/6.18: update CVE exclusions (6.18.8)
Date: Fri,  6 Feb 2026 15:27:27 -0500
Message-ID: <20260206202732.1080699-10-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206202732.1080699-1-bruce.ashfield@gmail.com>
References: <20260206202732.1080699-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 20:27:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230653

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 1 changes (1 new | 0 updated): - 1 new CVEs: CVE-2026-1896 - 0 updated CVEs:
        Date: Wed, 4 Feb 2026 23:41:08 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.18.inc              | 242 +++++++++++++++++-
 1 file changed, 237 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.18.inc b/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
index a29732706e..383f35291e 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2026-01-26 19:48:18.296749+00:00 for kernel version 6.18.7
-# From linux_kernel_cves cve_2026-01-26_1900Z-2-g425a25ddf37
+# Generated at 2026-02-05 00:48:36.677660+00:00 for kernel version 6.18.8
+# From linux_kernel_cves 2026-02-05_baseline
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.18.7"
+    this_version = "6.18.8"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -11662,8 +11662,6 @@ CVE_STATUS[CVE-2024-42128] = "fixed-version: Fixed from version 6.10"
 
 CVE_STATUS[CVE-2024-42129] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2024-42130] = "fixed-version: Fixed from version 6.10"
-
 CVE_STATUS[CVE-2024-42131] = "fixed-version: Fixed from version 6.10"
 
 CVE_STATUS[CVE-2024-42132] = "fixed-version: Fixed from version 6.10"
@@ -20338,6 +20336,46 @@ CVE_STATUS[CVE-2025-71162] = "cpe-stable-backport: Backported in 6.18.7"
 
 CVE_STATUS[CVE-2025-71163] = "cpe-stable-backport: Backported in 6.18.7"
 
+CVE_STATUS[CVE-2025-71180] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2025-71181] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2025-71182] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2025-71183] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2025-71184] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2025-71185] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2025-71186] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2025-71187] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2025-71188] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2025-71189] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2025-71190] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2025-71191] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2025-71192] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2025-71193] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2025-71194] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2025-71195] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2025-71196] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2025-71197] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2025-71198] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2025-71199] = "cpe-stable-backport: Backported in 6.18.8"
+
 CVE_STATUS[CVE-2026-22976] = "cpe-stable-backport: Backported in 6.18.6"
 
 CVE_STATUS[CVE-2026-22977] = "cpe-stable-backport: Backported in 6.18.6"
@@ -20414,3 +20452,197 @@ CVE_STATUS[CVE-2026-23012] = "cpe-stable-backport: Backported in 6.18.7"
 
 CVE_STATUS[CVE-2026-23013] = "cpe-stable-backport: Backported in 6.18.7"
 
+CVE_STATUS[CVE-2026-23014] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-23015] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-23016] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-23017] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-23018] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-23019] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-23020] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-23021] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-23022] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-23023] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-23024] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-23025] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-23026] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-23027] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-23028] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-23029] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-23030] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-23031] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-23032] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-23033] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-23034] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-23035] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-23036] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-23037] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-23038] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-23039] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-23040] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-23041] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-23042] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-23043] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-23044] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-23045] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-23046] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-23047] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-23048] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-23049] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-23050] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-23051] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-23052] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-23053] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-23054] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-23055] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-23056] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23057] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23058] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23059] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23060] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23061] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23062] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23063] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23064] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23065] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23066] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23067] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23068] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23069] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23070] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23071] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23072] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23073] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23074] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23075] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23076] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23077] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23078] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23079] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23080] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23081] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23082] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23083] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23084] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23085] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23086] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23087] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23088] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23089] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23090] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23091] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23092] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23093] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23094] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23095] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23096] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23097] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23098] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23099] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23100] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23101] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23102] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23103] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23104] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23105] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23106] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23107] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23108] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23109] = "cpe-stable-backport: Backported in 6.18.8"
+
+CVE_STATUS[CVE-2026-23110] = "cpe-stable-backport: Backported in 6.18.8"
+
-- 
2.43.0


