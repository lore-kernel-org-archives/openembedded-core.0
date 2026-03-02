Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF8B7D58E5A
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 04:56:01 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.153572.1772427351938775109
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 20:55:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QI+qReFe;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8c70b5594f4so425107885a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Mar 2026 20:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772427351; x=1773032151; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxHJxIYhWk6dqCH+uc+Afo+w+g6r2z6GcHIS7php56Y=;
        b=QI+qReFemhGR6XYt9t7uUvZcnx4o+26PH+A5M6RWPWlvAe9jR3zctKdg1uzDhOkeB8
         Z+Et03TKsEw3ti9II34Ijek8wdcuKB5O+lZVYcfBZqRd+kWQC4H6YHc23Uais9p17EuP
         UlEL9Xc8wsW3q5IlVKaj/7OVfBThTcz+8uvQeyNqpoNz3b39YkHqJa1DBPAHnctq54Wd
         JMkkojza8l11f0zrDCNQpN/BvdW93umLXUkD0OrbNqk/2+e8ollBWfTabyDHj5vCYVEh
         naLUX320fddoteISVol5hEcHwSjEkwdAlhxgiCZhH5PC0cWhOYZb2XX8s6t8OtF6ZF9k
         l8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772427351; x=1773032151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yxHJxIYhWk6dqCH+uc+Afo+w+g6r2z6GcHIS7php56Y=;
        b=rWc8Zy2oAF3YQI8i8cLy29Qgzdh5Nx8BjficRDDYiZFV4zRcKGUgedVyMQnbqXfSpL
         5jNtEVNZ6lP9oM/KVSJ5N1x9x6VvKJ3riSTIB1IBG8JO348MSyjNg6nGBRsT6cmgvvSB
         TABoCMcT8PneJ2S5j/oMPs8zOOqNhXjWZa9tY/I1gUptMZFJm0ryQglAlpBy+A8zY2gr
         0ybDt/Ellc3sM5rYoOOj8MYtHPTG63XJvhBNF4Jg+VNlbtvQ/SF26c9K+6Pu/sBdiVOI
         DGvvzirFJ6VFCDqH6PfPbVWsJIxTabPL2UKIrqpIkOGiWi709BT/Ewmth4FhOiWMywOh
         ikhQ==
X-Gm-Message-State: AOJu0Yz2k2grJQAqbvbHgG9uAl1ta/EKxSkCYu3OIubhwLACZvC55X9e
	fItO/h3gSDobbQGA/pxoVa1VtujM0oqbKnUZNw08D238JlznA75e79gHMLk0eBdPtxc=
X-Gm-Gg: ATEYQzyUuPLWjNmCcMlk8fVWBykjc0rKLcz69Q1IA/DDfNjZW4/5utJ2RtbFJqZQeCt
	v6X4Ak58KkTmLUoixlcd27DmnVdRTywzg0cuguxy/WbwKsv7sxquYs6qoIp2Sj2b2WulHBzDfMa
	Z5OmkM7KJJ2DLv5ENR/ZjJJubTjIoy1aX8Y1NeiJGBhSlFkID0tkrtspNuN87B5hCTd/j5iUSkR
	gfEk6jd0M5/Trk93V2seUYw1zP3ScdqqzfZM7mnBnvsjweYIdFtMfLEcIbtmTi96hKAy87mi62F
	/GSAvEVzLG/YbAqEquMZI0zqaG8KxE5hv+6HP0J2dBVddGLKfa1vIsFk4BqmRrkINpLgh+KP6kh
	ldJBqNnRhYMavodREI84CC9MUoWKy9W3ogkdd4u0nidjTO2mlWCPvhjC7gSVgoFEWBE1gNEK1bq
	sg+UzYa1/0ywymbVOOaM/n0d7FrvfwLyzkZPJ+s1pgcOkYXFXlTLGLvtMBwqgOQxc2WNSsyYGmN
	zq8Ty4RbvcsnILh7uBSKeUtQkWTIshmImH4SHElLyZ82QJNbVEqPyquQ8k=
X-Received: by 2002:a05:620a:2988:b0:891:7008:f2e0 with SMTP id af79cd13be357-8cbbf352669mr1832526385a.8.1772427350863;
        Sun, 01 Mar 2026 20:55:50 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a017add76sm2488406d6.36.2026.03.01.20.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 20:55:49 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 07/10] linux-yocto/6.18: update CVE exclusions (6.18.13)
Date: Sun,  1 Mar 2026 23:55:33 -0500
Message-ID: <20260302045537.2153587-8-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302045537.2153587-1-bruce.ashfield@gmail.com>
References: <20260302045537.2153587-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 04:56:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232167

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 2 changes (2 new | 0 updated): - 2 new CVEs: CVE-2026-2969, CVE-2026-2970 - 0 updated CVEs:
        Date: Mon, 23 Feb 2026 04:14:58 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.18.inc              | 72 ++++++++++++++++++-
 1 file changed, 69 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.18.inc b/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
index 896f0011ff..4afd58e924 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2026-02-16 15:57:58.221029+00:00 for kernel version 6.18.11
-# From linux_kernel_cves cve_2026-02-16_1500Z-2-g82f82c2dc3b
+# Generated at 2026-02-23 04:32:17.926406+00:00 for kernel version 6.18.13
+# From linux_kernel_cves cve_2026-02-23_0300Z-2-gda53cb14ddd
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.18.11"
+    this_version = "6.18.13"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -20394,6 +20394,32 @@ CVE_STATUS[CVE-2025-71223] = "cpe-stable-backport: Backported in 6.18.10"
 
 CVE_STATUS[CVE-2025-71224] = "cpe-stable-backport: Backported in 6.18.10"
 
+CVE_STATUS[CVE-2025-71225] = "cpe-stable-backport: Backported in 6.18.10"
+
+CVE_STATUS[CVE-2025-71226] = "cpe-stable-backport: Backported in 6.18.10"
+
+CVE_STATUS[CVE-2025-71227] = "cpe-stable-backport: Backported in 6.18.10"
+
+CVE_STATUS[CVE-2025-71228] = "cpe-stable-backport: Backported in 6.18.10"
+
+CVE_STATUS[CVE-2025-71229] = "cpe-stable-backport: Backported in 6.18.11"
+
+CVE_STATUS[CVE-2025-71230] = "cpe-stable-backport: Backported in 6.18.11"
+
+CVE_STATUS[CVE-2025-71231] = "cpe-stable-backport: Backported in 6.18.11"
+
+CVE_STATUS[CVE-2025-71232] = "cpe-stable-backport: Backported in 6.18.11"
+
+CVE_STATUS[CVE-2025-71233] = "cpe-stable-backport: Backported in 6.18.11"
+
+CVE_STATUS[CVE-2025-71234] = "cpe-stable-backport: Backported in 6.18.11"
+
+CVE_STATUS[CVE-2025-71235] = "cpe-stable-backport: Backported in 6.18.11"
+
+CVE_STATUS[CVE-2025-71236] = "cpe-stable-backport: Backported in 6.18.11"
+
+CVE_STATUS[CVE-2025-71237] = "cpe-stable-backport: Backported in 6.18.11"
+
 CVE_STATUS[CVE-2026-22976] = "cpe-stable-backport: Backported in 6.18.6"
 
 CVE_STATUS[CVE-2026-22977] = "cpe-stable-backport: Backported in 6.18.6"
@@ -20864,3 +20890,43 @@ CVE_STATUS[CVE-2026-23209] = "cpe-stable-backport: Backported in 6.18.10"
 
 CVE_STATUS[CVE-2026-23210] = "cpe-stable-backport: Backported in 6.18.10"
 
+CVE_STATUS[CVE-2026-23211] = "cpe-stable-backport: Backported in 6.18.9"
+
+CVE_STATUS[CVE-2026-23212] = "cpe-stable-backport: Backported in 6.18.9"
+
+CVE_STATUS[CVE-2026-23213] = "cpe-stable-backport: Backported in 6.18.10"
+
+CVE_STATUS[CVE-2026-23214] = "cpe-stable-backport: Backported in 6.18.10"
+
+CVE_STATUS[CVE-2026-23215] = "cpe-stable-backport: Backported in 6.18.10"
+
+CVE_STATUS[CVE-2026-23216] = "cpe-stable-backport: Backported in 6.18.10"
+
+CVE_STATUS[CVE-2026-23217] = "cpe-stable-backport: Backported in 6.18.10"
+
+CVE_STATUS[CVE-2026-23218] = "cpe-stable-backport: Backported in 6.18.10"
+
+CVE_STATUS[CVE-2026-23219] = "cpe-stable-backport: Backported in 6.18.10"
+
+CVE_STATUS[CVE-2026-23220] = "cpe-stable-backport: Backported in 6.18.11"
+
+CVE_STATUS[CVE-2026-23221] = "cpe-stable-backport: Backported in 6.18.11"
+
+CVE_STATUS[CVE-2026-23222] = "cpe-stable-backport: Backported in 6.18.11"
+
+CVE_STATUS[CVE-2026-23223] = "cpe-stable-backport: Backported in 6.18.11"
+
+CVE_STATUS[CVE-2026-23224] = "cpe-stable-backport: Backported in 6.18.11"
+
+CVE_STATUS[CVE-2026-23225] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-23226] = "cpe-stable-backport: Backported in 6.18.11"
+
+CVE_STATUS[CVE-2026-23227] = "cpe-stable-backport: Backported in 6.18.11"
+
+CVE_STATUS[CVE-2026-23228] = "cpe-stable-backport: Backported in 6.18.11"
+
+CVE_STATUS[CVE-2026-23229] = "cpe-stable-backport: Backported in 6.18.11"
+
+CVE_STATUS[CVE-2026-23230] = "cpe-stable-backport: Backported in 6.18.11"
+
-- 
2.43.0


