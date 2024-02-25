Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3631AC54E4F
	for <webhook@archiver.kernel.org>; Sun, 25 Feb 2024 21:53:24 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web10.7527.1708898002965214446
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 13:53:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=kHblES3I;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.54, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6e49833ccdfso309614a34.2
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 13:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708898002; x=1709502802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J+OH/XMTUmaLynTE7yef6kUBnqobY8YQL2+PX3WVBHE=;
        b=kHblES3INFTGSW1HFPDsh0OKBlvMUu931/vJWaSEESoaWLKK9g/+/HKaMvFlnofEpE
         ft/A0cjaIGGCln0MtsXuZwdrekZQlAU/mbP0hR9y5zMeg4vfmuEPrURBLBA5GWpAgAHg
         MyHj/UetINb9nnz24xZcMcvi9P9KllokEsvPr8UN0/dFKmsLfZeBWweCEjc3Vy9ECSn1
         YzZUN+VgaQuE8CWc3FQubg8kifG3ywmOSBrlxe+i1yqRPCsnqIdZR0FM0CR5ojO8wVgm
         5NKwZhAXYZekbD4/xsb6r8KgXB/tqdbF1ME3IrlDkJRB9JYWEh0g3b5wabw5+vTgBdFw
         PSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708898002; x=1709502802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+OH/XMTUmaLynTE7yef6kUBnqobY8YQL2+PX3WVBHE=;
        b=kP5/uNb+ligo8zfjpflNkGo95eKFNNeIlTXNZ4Y88DcVSJFCptsb9VOSarHGdBHBA5
         kVES6/EHyir+9HvZLZDqNpF7ds6ySLJcaswuwUUv4+xd9XcoRs+TstNd7GBrkpEpeU9Q
         plIu4R06xERq1oUSQnhsBfJ+i2OmVCFr5HDhk+dtosYV1JUGb5fKIZGPfJ4CwefQV4Gk
         lllC/YknWFt8Xg92JR3AAmc1GkX1pyQQ0IJMgNc7uHlIwbshlAciH3r4xn7iIuWoocle
         k8xUBwD1iYvXCHiJhvCwlWoM3m6ln5yDa0sIPUkNMRlEOvtqviJ5VuEij6i+tUc5XJQ6
         NSyQ==
X-Gm-Message-State: AOJu0YyYqzhevW2PoI9Z/RhYVTKNdnTm01bzc2Zkn2yQPupBI+5JYP7d
	J9Xaw+9eIe3fb9T9VBfOxf0TuMY1Ryq8zJX9PkGbhfUJrNzdzRpfygCSVirHc5FdG528f+jvsum
	YfJvrPw==
X-Google-Smtp-Source: AGHT+IEUxtUScrFiiVtgKh0d6fUX9qbSx/s4ThEnbWK8xJMUCKSLtIW5fHzgfc/JaA++LQTij7gCLA==
X-Received: by 2002:a05:6218:260b:b0:17b:8c8c:1729 with SMTP id oy11-20020a056218260b00b0017b8c8c1729mr6614361rwc.27.1708898001742;
        Sun, 25 Feb 2024 13:53:21 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a12-20020a17090acb8c00b0029a4089fbf0sm3082947pju.16.2024.02.25.13.53.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 13:53:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/22] linux-yocto/5.15: update CVE exclusions
Date: Sun, 25 Feb 2024 11:52:34 -1000
Message-Id: <c7c86d97f6a0e1d09eaca999ecec13656655f299.1708897822.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708897822.git.steve@sakoman.com>
References: <cover.1708897822.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 21:53:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196167

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/nluedtke/linux_kernel_cves

    1/1 [
        Author: Nicholas Luedtke
        Email: nicholas.luedtke@uwalumni.com
        Subject: Update 15Jan24
        Date: Mon, 15 Jan 2024 12:48:45 -0500

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/cve-exclusion_5.15.inc              | 44 ++++++++++++++++---
 1 file changed, 37 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
index 84d0becb8d..0d54b414d9 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-01-11 21:16:55.956074 for version 5.15.146
+# Generated at 2024-01-18 18:47:24.084935 for version 5.15.147
 
 python check_kernel_cve_status_version() {
-    this_version = "5.15.146"
+    this_version = "5.15.147"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -6626,6 +6626,9 @@ CVE_CHECK_IGNORE += "CVE-2022-48425"
 # cpe-stable-backport: Backported in 5.15.121
 CVE_CHECK_IGNORE += "CVE-2022-48502"
 
+# cpe-stable-backport: Backported in 5.15.42
+CVE_CHECK_IGNORE += "CVE-2022-48619"
+
 # fixed-version: Fixed after version 5.0rc1
 CVE_CHECK_IGNORE += "CVE-2023-0030"
 
@@ -6747,6 +6750,8 @@ CVE_CHECK_IGNORE += "CVE-2023-1382"
 # fixed-version: Fixed after version 5.11rc4
 CVE_CHECK_IGNORE += "CVE-2023-1390"
 
+# CVE-2023-1476 has no known resolution
+
 # cpe-stable-backport: Backported in 5.15.95
 CVE_CHECK_IGNORE += "CVE-2023-1513"
 
@@ -6921,7 +6926,8 @@ CVE_CHECK_IGNORE += "CVE-2023-23559"
 # fixed-version: Fixed after version 5.12rc1
 CVE_CHECK_IGNORE += "CVE-2023-23586"
 
-# CVE-2023-2430 needs backporting (fixed from 6.2rc5)
+# fixed-version: only affects 5.18rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-2430"
 
 # cpe-stable-backport: Backported in 5.15.105
 CVE_CHECK_IGNORE += "CVE-2023-2483"
@@ -7351,7 +7357,8 @@ CVE_CHECK_IGNORE += "CVE-2023-45871"
 # fixed-version: only affects 6.5rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-45898"
 
-# CVE-2023-4610 needs backporting (fixed from 6.4)
+# fixed-version: only affects 6.4rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-4610"
 
 # fixed-version: only affects 6.4rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-4611"
@@ -7386,7 +7393,8 @@ CVE_CHECK_IGNORE += "CVE-2023-5090"
 # cpe-stable-backport: Backported in 5.15.135
 CVE_CHECK_IGNORE += "CVE-2023-5158"
 
-# CVE-2023-51779 needs backporting (fixed from 6.7rc7)
+# cpe-stable-backport: Backported in 5.15.146
+CVE_CHECK_IGNORE += "CVE-2023-51779"
 
 # cpe-stable-backport: Backported in 5.15.137
 CVE_CHECK_IGNORE += "CVE-2023-5178"
@@ -7417,6 +7425,8 @@ CVE_CHECK_IGNORE += "CVE-2023-5972"
 
 # CVE-2023-6039 needs backporting (fixed from 6.5rc5)
 
+# CVE-2023-6040 needs backporting (fixed from 5.18rc1)
+
 # fixed-version: only affects 6.6rc3 onwards
 CVE_CHECK_IGNORE += "CVE-2023-6111"
 
@@ -7428,8 +7438,13 @@ CVE_CHECK_IGNORE += "CVE-2023-6176"
 
 # CVE-2023-6238 has no known resolution
 
+# CVE-2023-6270 has no known resolution
+
 # CVE-2023-6356 has no known resolution
 
+# fixed-version: only affects 6.1rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-6531"
+
 # CVE-2023-6535 has no known resolution
 
 # CVE-2023-6536 has no known resolution
@@ -7439,14 +7454,16 @@ CVE_CHECK_IGNORE += "CVE-2023-6546"
 
 # CVE-2023-6560 needs backporting (fixed from 6.7rc4)
 
-# CVE-2023-6606 needs backporting (fixed from 6.7rc7)
+# cpe-stable-backport: Backported in 5.15.146
+CVE_CHECK_IGNORE += "CVE-2023-6606"
 
 # CVE-2023-6610 needs backporting (fixed from 6.7rc7)
 
 # cpe-stable-backport: Backported in 5.15.143
 CVE_CHECK_IGNORE += "CVE-2023-6622"
 
-# CVE-2023-6679 needs backporting (fixed from 6.7rc6)
+# fixed-version: only affects 6.7rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-6679"
 
 # cpe-stable-backport: Backported in 5.15.143
 CVE_CHECK_IGNORE += "CVE-2023-6817"
@@ -7459,3 +7476,16 @@ CVE_CHECK_IGNORE += "CVE-2023-6932"
 
 # CVE-2023-7042 has no known resolution
 
+# cpe-stable-backport: Backported in 5.15.100
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
+# Skipping dd=CVE-2023-1476, no affected_versions
+
-- 
2.34.1


