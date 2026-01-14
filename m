Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA95D38FF3
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 17:24:16 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15748.1768411454930995768
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 09:24:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fMcqFVan;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8c530866cf0so4786485a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 09:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768411454; x=1769016254; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYsVXB1lJQdatTTrue/4PNPSQwmU4LXAoOfKV6os3TY=;
        b=fMcqFVanr13FGMy8tbzgJDsFf5SuBmxJwez0H+e813b+pOqgkpEolF/vJx9gbESP8G
         +/zubrTsjoU3PK1JBGpF5OTG04k14a7ZBuAcy6cyyddkNzajFMwl4j9MfQFQ4HpzF04B
         GhARpuRfvL4fvGnB+W6s8wnJlCXn/0+NXgxcOzTKAN5G3ivDgBTgR/bWfHBJFsb8Lh3I
         QzVZhz8r1JsW1TvU/vGDm4HwKvqCihj7iROv7x7VrAlnK+p+IVAwjU0NOmUwERz9WYb5
         20zHrc/UibsgYgSpmohq22+6kIdqotCsXGYIkrtJgXQ3McmVYGKr+oWB2xJVA+v30n9k
         a2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768411454; x=1769016254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fYsVXB1lJQdatTTrue/4PNPSQwmU4LXAoOfKV6os3TY=;
        b=vqMmj5tWRMV70a63ryc7gQP+xMh5HXbO5SBc5V0yW/cJeOwls5sFOzyhJrp8n8tDmF
         qrbZAADXOBL5niFSwXo23gLj2zUDmdBBw5r8MCtzmkQRpxNFHlJS0HVJZO5AgwdL7j+u
         ogRZOdD+lz1AAM0hCIndEVRzoOjWzKhrdMT/t+bvuLtlAmpm63+ZB1S9dCmaGeaMVrqq
         GTioP+PvuiUV0OnT7xpG/rOiCYUXi88UfxVfK0j5kVImVxgBZU2m8+Y0lcTVVaqcytQo
         WiKAS0SzgYj6ahz4aGn6C2xe/VBRWFTTThyBEoYENnIqqnto3L6gQpPEf3dC/2ckNsgV
         TGwg==
X-Gm-Message-State: AOJu0YzSC/7vX7KiIpuMoPT+7eunTx+lkiVgMHpmYbVNgoI6DYWFEvCY
	NbB8Db+XSSNUGq4wcs2guVknA4zZWKxuWCCwvYGTdLRcISfi5R/w8Ts9Ksq7zVWn4cI=
X-Gm-Gg: AY/fxX7FRnxn74hQO2eZHZe7IOV7+xLbUdX8MnRI6uJhOqel1ey3lKiPK0HqNVI8bYz
	q1bP8FUx42fWrLhHSsOGem49vYEH+YvcPUL90fu5MI45RihGIkJGms5+tbNPnB0xCSxLA7aVZqC
	MAkoFAEpe9LhoVsnMD5vmt+4LSb7uwh8XXO27yT/8S5DKYgjQSkMWp3xzM+wAVYqxSl8VLozcSh
	sRVKqF6GOx/KRQSdI4C0pp///TuVBDxkIa+lDy77DsMNS60jsTk5xyCKq8P3aFzNt24V8cAqRte
	gKsJ7He1lKpKJ7MY4IxjaFum77RgD8JY6WpJ8UGlo0iw3Z4LVGDRQvLfbYwd+osKiSYW6Zpf+86
	uARGoXvWj8au3KNkdDJjP9/yxfszntCswxXvyHAYbXhxc9A1sQzbBzj9FTyuwB1KTjshAgyegSX
	eesJCoGpIp6Om99b/fRYVK7ObE/6fuUimErMDvh+pLWxfocb1FHWqSJbiV4CyfRY8jNlOxzTgQt
	E1pPVMlLaiAX6g=
X-Received: by 2002:a05:620a:192a:b0:8b2:598d:6e89 with SMTP id af79cd13be357-8c52fb918d0mr428937485a.45.1768411453845;
        Wed, 14 Jan 2026 09:24:13 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c530bc0d9fsm197711385a.45.2026.01.14.09.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 09:24:11 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 02/06] linux-yocto/6.18: update CVE exclusions (6.18.5)
Date: Wed, 14 Jan 2026 12:24:02 -0500
Message-ID: <20260114172406.2271015-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114172406.2271015-1-bruce.ashfield@gmail.com>
References: <20260114172406.2271015-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 17:24:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229358

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 6 changes (2 new | 4 updated): - 2 new CVEs: CVE-2025-46068, CVE-2025-46070 - 4 updated CVEs: CVE-2025-46066, CVE-2025-46067, CVE-2025-71063, CVE-2026-0851
        Date: Mon, 12 Jan 2026 16:41:36 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/cve-exclusion_6.18.inc | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.18.inc b/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
index 7fc5c65044..708c5a8506 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2026-01-05 17:52:47.379252+00:00 for kernel version 6.18.3
-# From linux_kernel_cves cve_2026-01-05_1700Z-3-gfc562e1b2e5
+# Generated at 2026-01-12 16:52:57.037978+00:00 for kernel version 6.18.5
+# From linux_kernel_cves cve_2026-01-12_1600Z-2-g6b70380b71e
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.18.3"
+    this_version = "6.18.5"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -19536,8 +19536,6 @@ CVE_STATUS[CVE-2025-40359] = "fixed-version: Fixed from version 6.18"
 
 CVE_STATUS[CVE-2025-40360] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40361] = "fixed-version: Fixed from version 6.18"
-
 CVE_STATUS[CVE-2025-40362] = "fixed-version: Fixed from version 6.18"
 
 CVE_STATUS[CVE-2025-40363] = "fixed-version: Fixed from version 6.18"
@@ -19892,7 +19890,7 @@ CVE_STATUS[CVE-2025-68355] = "cpe-stable-backport: Backported in 6.18.2"
 
 CVE_STATUS[CVE-2025-68356] = "cpe-stable-backport: Backported in 6.18.2"
 
-CVE_STATUS[CVE-2025-68357] = "cpe-stable-backport: Backported in 6.18.2"
+CVE_STATUS[CVE-2025-68357] = "fixed-version: Fixed from version 6.12.64"
 
 CVE_STATUS[CVE-2025-68358] = "cpe-stable-backport: Backported in 6.18.2"
 
-- 
2.43.0


