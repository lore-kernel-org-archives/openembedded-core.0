Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98EC2C4828A
	for <webhook@archiver.kernel.org>; Sat, 27 Jan 2024 02:37:59 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.8364.1706323072784068908
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 18:37:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aBP6aQXT;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5ca29c131ebso1245751a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 18:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706323071; x=1706927871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQRQNH3gtpzhI5Ulf3jVJlJufIL7u3O2oWYbwapz5XI=;
        b=aBP6aQXT335DMySTAG2Kicei7NoXfjQedqomBb+Cqe9oJyjkggKFdU4e5HLKzLEQZW
         LZcGsBCfmH+MpHpxnkhVSeL5ddH7ZvG/uBzorsFnHLed8kz+kmYC3HuAxKh9g+gSYB6O
         mqmlcBrdOQDnPNZE5Z37MrPG9Hwwn0y139ejq1cA+WttcDhSEC11WEljGcz4YIIvXm/m
         h8yMhAJi3m5ChuQpArNhpx8wuWnEL4c5OhOJ3iaA3jJTuULCt2biohuRMONXYBmKjMzp
         N4XhwzbQCSXQS8Kz6YxxrbzawtaDcuVz9EjPTEOpPkwOSh/VIz540UQbJAsgveZCg/ve
         l23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706323071; x=1706927871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQRQNH3gtpzhI5Ulf3jVJlJufIL7u3O2oWYbwapz5XI=;
        b=M16lB2d8F0yjKVEjOy1S9720ms32sxKFhZHJehpoeHTCucGhDHtKU7zW9I2trrCS8s
         411A59ArkLef+z1ecKV2S6h6Pyx2FphFYY1mN+Kl0OplXr8ZNW5Q9anhqTgODUwdrdCU
         fdJZKkzC2ir1ipApze0+xFdQhSCJrXCjY6RNkQxts4nwAOqkJXXa+pcqpNPq7gA9SOi0
         9Gdvu51zhAPFtGxi3+ZOQYDWSzTyF2fU1paWe9KDj7NjaljUkK79BKrbJiv4vH7qm+rM
         6LObEP+k3SyT2aKRt0XIeo8t4NCof+xO6qOJF+s7IQ2x5BOiWG4KiU+wIqu1mdxyZ3N9
         hmuw==
X-Gm-Message-State: AOJu0YzzD5u+ZIsEpw4eu4iPfjc6Ok20bJwBe3FbD3uRtt+I5IKtcqDY
	jKE9+IRRboE+VLgP/YVQxVGZgWPic7iyebBM8H+7my5x/CKMu5GPKFImL/APQ5ZxI540qSL7feP
	4tMzzpg==
X-Google-Smtp-Source: AGHT+IHOzeiwTJ35dbo/JpN9Pdi+mc6TpT/aR3srVbclUohkgay+5KzE2e2CHAUAvavyTtG7XsnNJA==
X-Received: by 2002:a17:902:f804:b0:1d7:6b51:de5e with SMTP id ix4-20020a170902f80400b001d76b51de5emr762410plb.133.1706323071418;
        Fri, 26 Jan 2024 18:37:51 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id r8-20020a170902be0800b001d7405022ecsm1547045pls.159.2024.01.26.18.37.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 18:37:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 07/23] linux-yocto/6.1: update CVE exclusions
Date: Fri, 26 Jan 2024 16:37:15 -1000
Message-Id: <31dc2d2952a15df902cef3755f9db4d5f2bd9944.1706322780.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706322780.git.steve@sakoman.com>
References: <cover.1706322780.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jan 2024 02:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194416

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/nluedtke/linux_kernel_cves

    1/1 [
        Author: Nicholas Luedtke
        Email: nicholas.luedtke@uwalumni.com
        Subject: Update 27Dec23
        Date: Wed, 27 Dec 2023 19:47:13 -0500

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
(cherry picked from commit b303a7dd260ad3f6a9e6f1b8099b86efcc8373a9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/cve-exclusion_6.1.inc               | 44 +++++++++++++++++--
 1 file changed, 40 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
index 1b51737c7d..0bf7edbce8 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-12-23 08:44:42.304531+00:00 for version 6.1.68
+# Generated at 2024-01-03 21:24:21.156991+00:00 for version 6.1.70
 
 python check_kernel_cve_status_version() {
-    this_version = "6.1.68"
+    this_version = "6.1.70"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -5106,11 +5106,21 @@ CVE_STATUS[CVE-2023-4881] = "cpe-stable-backport: Backported in 6.1.54"
 
 CVE_STATUS[CVE-2023-4921] = "cpe-stable-backport: Backported in 6.1.54"
 
+# CVE-2023-50431 has no known resolution
+
 CVE_STATUS[CVE-2023-5090] = "cpe-stable-backport: Backported in 6.1.62"
 
 CVE_STATUS[CVE-2023-5158] = "cpe-stable-backport: Backported in 6.1.57"
 
-# CVE-2023-5178 needs backporting (fixed from 6.1.60)
+# CVE-2023-51779 needs backporting (fixed from 6.7rc7)
+
+CVE_STATUS[CVE-2023-5178] = "cpe-stable-backport: Backported in 6.1.60"
+
+CVE_STATUS[CVE-2023-51780] = "cpe-stable-backport: Backported in 6.1.69"
+
+CVE_STATUS[CVE-2023-51781] = "cpe-stable-backport: Backported in 6.1.69"
+
+CVE_STATUS[CVE-2023-51782] = "cpe-stable-backport: Backported in 6.1.69"
 
 CVE_STATUS[CVE-2023-5197] = "cpe-stable-backport: Backported in 6.1.56"
 
@@ -5120,7 +5130,7 @@ CVE_STATUS[CVE-2023-5633] = "fixed-version: only affects 6.2 onwards"
 
 # CVE-2023-5717 needs backporting (fixed from 6.1.60)
 
-# CVE-2023-5972 needs backporting (fixed from 6.6rc7)
+CVE_STATUS[CVE-2023-5972] = "fixed-version: only affects 6.2rc1 onwards"
 
 # CVE-2023-6039 needs backporting (fixed from 6.5rc5)
 
@@ -5132,3 +5142,29 @@ CVE_STATUS[CVE-2023-6176] = "cpe-stable-backport: Backported in 6.1.54"
 
 # CVE-2023-6238 has no known resolution
 
+# CVE-2023-6356 has no known resolution
+
+# CVE-2023-6535 has no known resolution
+
+# CVE-2023-6536 has no known resolution
+
+CVE_STATUS[CVE-2023-6546] = "cpe-stable-backport: Backported in 6.1.47"
+
+# CVE-2023-6560 needs backporting (fixed from 6.7rc4)
+
+# CVE-2023-6606 needs backporting (fixed from 6.7rc7)
+
+# CVE-2023-6610 needs backporting (fixed from 6.7rc7)
+
+CVE_STATUS[CVE-2023-6622] = "cpe-stable-backport: Backported in 6.1.68"
+
+# CVE-2023-6679 needs backporting (fixed from 6.7rc6)
+
+CVE_STATUS[CVE-2023-6817] = "cpe-stable-backport: Backported in 6.1.68"
+
+CVE_STATUS[CVE-2023-6931] = "cpe-stable-backport: Backported in 6.1.68"
+
+CVE_STATUS[CVE-2023-6932] = "cpe-stable-backport: Backported in 6.1.66"
+
+# CVE-2023-7042 has no known resolution
+
-- 
2.34.1


