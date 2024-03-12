Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2884C54E60
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 13:53:48 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.10093.1710251619163892125
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Mar 2024 06:53:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xNccftjY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1dd6412da28so30783995ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 06:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710251618; x=1710856418; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HymOEUqO6kPKVwGCZHaPoWACXWs5o12h3tMEdXPcI9w=;
        b=xNccftjYQVY32jdU0LvFLAj8ax2wwkbUNQkABDIBbp1GEgD4pyIZE0J2f5j56bHs8j
         XA2qzP8utI2lNdWiXRGUTY4UyXzndlT5I6pTcs8aEZMdqniIAweQrwKm2c5aKpvtJ1sc
         daUPFwAqEoGLpiOGa3BYGh5e6JcgxmN1/XPUVipVsWdWzYqlx3Div0rEKS7ZwlV5XhTn
         WoXfCD1s5xqBsxCSyi3FqI9x+P4clEV/i34JQO/smdxZm53X6rPDYR60rYSZFrmIKq2C
         Ge377S/qRr0jfhn6TVv9DSR5YkvJaUS2VNJ4Enlt52zbcAz9gWzr3DiQfT/P6gtWkrt9
         eTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710251618; x=1710856418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HymOEUqO6kPKVwGCZHaPoWACXWs5o12h3tMEdXPcI9w=;
        b=Xf6UlnfSNpeh5S06HwASFDtxt0zkGddBX0MDurVnHI6hJcd02een/1yCbWYj9mWNcS
         lPtzdgPYjC/vhljkxYZXSsysjCqvizzr/1qVxP5SEduEq3AB6OG6n3KPGawL1HXzfIMj
         49VURW42qeR/Kip+SdYs7IaGS0g9L6tFzjFJJb8JfBn0AcOo+0eGE5ynDLUxL1CJ+uEz
         CFYxCZyBVl0QjQ6kgjJ2pMjwGq5X1GW2J3y79wzAvUjH0Q9P3mdeuRBx9Pq93AcNFvb7
         dFCYyddg7RgmNrctldWaBLrTpcJYB+JstJNqLmdhg8WSpgOb/j0HXh37tfvxosQC/Hvj
         t97w==
X-Gm-Message-State: AOJu0Yxv9yzR0OaeQCsPlTiZMSwh8h2F5WFl5SYrJQkTJKnJvF7ZZ6qN
	9CW/1UBNzhuPPe38euMLjNu/rECh7mC3Ry5lPdt43rziKM3Y2W4l8sWAGHVbm2Ad8KReVrQGUeh
	3iFA=
X-Google-Smtp-Source: AGHT+IF2+2zNGNbUFDG90mvCJoodkHI1FnabQAllhgBll9UyX7sh/yDNJ+hI/nrBC2CFepLeWw0/6A==
X-Received: by 2002:a17:903:2292:b0:1dd:9a43:2f5c with SMTP id b18-20020a170903229200b001dd9a432f5cmr4543671plh.47.1710251618379;
        Tue, 12 Mar 2024 06:53:38 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 12-20020a170902c10c00b001dc3916853csm6734776pli.73.2024.03.12.06.53.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 06:53:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/8] linux-yocto/5.15: update CVE exclusions
Date: Tue, 12 Mar 2024 03:53:18 -1000
Message-Id: <66c369b3cc5b975e7c774d5fa99181df8cdb827c.1710251458.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710251458.git.steve@sakoman.com>
References: <cover.1710251458.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 13:53:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196985

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/nluedtke/linux_kernel_cves

    1/1 [
        Author: Nicholas Luedtke
        Email: nicholas.luedtke@uwalumni.com
        Subject: Update 25Feb24
        Date: Sun, 25 Feb 2024 07:03:08 -0500

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/cve-exclusion_5.15.inc              | 197 +++++++++++++++++-
 1 file changed, 190 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
index d33f2b3c7f..2e30efe6be 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-02-06 21:02:11.546853 for version 5.15.148
+# Generated at 2024-02-26 23:36:34.200936 for version 5.15.149
 
 python check_kernel_cve_status_version() {
-    this_version = "5.15.148"
+    this_version = "5.15.149"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -7433,6 +7433,99 @@ CVE_CHECK_IGNORE += "CVE-2023-5197"
 # cpe-stable-backport: Backported in 5.15.147
 CVE_CHECK_IGNORE += "CVE-2023-52340"
 
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52429"
+
+# fixed-version: only affects 6.5rc6 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52433"
+
+# CVE-2023-52434 needs backporting (fixed from 6.7rc6)
+
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52435"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52436"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52438"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52439"
+
+# fixed-version: only affects 5.17rc4 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52440"
+
+# cpe-stable-backport: Backported in 5.15.145
+CVE_CHECK_IGNORE += "CVE-2023-52441"
+
+# cpe-stable-backport: Backported in 5.15.145
+CVE_CHECK_IGNORE += "CVE-2023-52442"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52443"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52444"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52445"
+
+# fixed-version: only affects 6.2rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52446"
+
+# CVE-2023-52447 needs backporting (fixed from 6.8rc1)
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52448"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52449"
+
+# fixed-version: only affects 6.2rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52450"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52451"
+
+# CVE-2023-52452 needs backporting (fixed from 6.8rc1)
+
+# fixed-version: only affects 6.2rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52453"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52454"
+
+# fixed-version: only affects 6.3rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52455"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52456"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52457"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52458"
+
+# fixed-version: only affects 6.6rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52459"
+
+# fixed-version: only affects 6.7rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52460"
+
+# fixed-version: only affects 6.7rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52461"
+
+# fixed-version: only affects 5.16rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52462"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52463"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52464"
+
 # fixed-version: only affects 6.1rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-5345"
 
@@ -7464,6 +7557,8 @@ CVE_CHECK_IGNORE += "CVE-2023-6200"
 
 # CVE-2023-6238 has no known resolution
 
+# CVE-2023-6240 has no known resolution
+
 # CVE-2023-6270 has no known resolution
 
 # CVE-2023-6356 has no known resolution
@@ -7511,7 +7606,8 @@ CVE_CHECK_IGNORE += "CVE-2023-7192"
 # fixed-version: only affects 6.5rc6 onwards
 CVE_CHECK_IGNORE += "CVE-2024-0193"
 
-# CVE-2024-0340 needs backporting (fixed from 6.4rc6)
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-0340"
 
 # fixed-version: only affects 6.2rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2024-0443"
@@ -7549,22 +7645,109 @@ CVE_CHECK_IGNORE += "CVE-2024-0775"
 # cpe-stable-backport: Backported in 5.15.148
 CVE_CHECK_IGNORE += "CVE-2024-1085"
 
-# CVE-2024-1086 needs backporting (fixed from 6.8rc2)
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-1086"
+
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-1151"
+
+# CVE-2024-1312 needs backporting (fixed from 6.5rc4)
 
 # CVE-2024-21803 has no known resolution
 
 # CVE-2024-22099 has no known resolution
 
+# CVE-2024-22386 has no known resolution
+
 # cpe-stable-backport: Backported in 5.15.146
 CVE_CHECK_IGNORE += "CVE-2024-22705"
 
+# CVE-2024-23196 has no known resolution
+
 # CVE-2024-23307 has no known resolution
 
 # CVE-2024-23848 has no known resolution
 
-# CVE-2024-23849 has no known resolution
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-23849"
+
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-23850"
+
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-23851"
+
+# CVE-2024-24855 needs backporting (fixed from 6.5rc2)
+
+# CVE-2024-24857 has no known resolution
+
+# CVE-2024-24858 has no known resolution
+
+# CVE-2024-24859 has no known resolution
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2024-24860"
+
+# CVE-2024-24861 has no known resolution
+
+# CVE-2024-24864 has no known resolution
+
+# CVE-2024-25739 has no known resolution
+
+# CVE-2024-25740 has no known resolution
+
+# CVE-2024-25741 has no known resolution
+
+# CVE-2024-25744 needs backporting (fixed from 6.7rc5)
 
-# CVE-2024-23850 has no known resolution
+# fixed-version: only affects 6.5rc4 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26581"
 
-# CVE-2024-23851 has no known resolution
+# fixed-version: only affects 6.0rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26582"
+
+# CVE-2024-26583 needs backporting (fixed from 6.8rc5)
+
+# CVE-2024-26584 needs backporting (fixed from 6.8rc5)
+
+# CVE-2024-26585 needs backporting (fixed from 6.8rc5)
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2024-26586"
+
+# CVE-2024-26587 needs backporting (fixed from 6.8rc1)
+
+# CVE-2024-26588 needs backporting (fixed from 6.8rc1)
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2024-26589"
+
+# fixed-version: only affects 5.16rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26590"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2024-26591"
+
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26592"
+
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26593"
+
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26594"
+
+# CVE-2024-26595 needs backporting (fixed from 6.8rc1)
+
+# fixed-version: only affects 6.1rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26596"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2024-26597"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2024-26598"
+
+# fixed-version: only affects 5.17rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26599"
 
-- 
2.34.1


