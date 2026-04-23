Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9ACBFC034B
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:32:30 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.412.1776958348026438963
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 08:32:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qTVQvuyf;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-899d6b7b073so70825916d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 08:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776958347; x=1777563147; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZD9mMVkGuCzCrrv7ouqLUIu3VZQ5wctcdVKG3N9vpeU=;
        b=qTVQvuyfcz6GjxpLqzPb1sntr8NXLMm7VjRAlFxZITjuv1i48Nc4+bR4Tye5Kw66gA
         YN8OqRGTqzeRAb/0MCvD81xyHVoxA0pV8TgXlzfief/l1GqboSqOJMCBVckZbSRnIAJB
         mh/8jzG/OCk7prUu500EFgA51EW9z7ycyPvoM4ytwlAP8eQoc2cS19MkTU+t0LdY/+yy
         9afLTl6+uMUHhCLTvatQIKHq/+HLUD6UY4XZpymrpfYzdfOKzXolIneQbzUbm9d1oqw9
         OfomgNXnsdTB7y4/j1AImIS6pi/bKcAGMIkYZCVRPjdVdFTiD39rqaVPfap1595uI5UB
         MiYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776958347; x=1777563147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZD9mMVkGuCzCrrv7ouqLUIu3VZQ5wctcdVKG3N9vpeU=;
        b=VJenwMyOqiLNk9PQoLrVtJVZTi8XwJ8sVHF0wG9LGFxLjg6Wciy1cbuNggasGgI08O
         5f/jj5i03rfIWwN5Q/XNb5kYieLnX/rL8lnkVMa8LYtM75nJVpgTGibgYwrqB+wt9uqL
         QiOKtiMfNMCJXXx82blRvOx4/aH0hJ2CaodwAJkjAWPvEdKgS2AN7ufl+Po5StLHyzRA
         ciZhM2mzzjvYef3J6arDsfVxuMpGhifyFcIgUi5u0ZJ0sKofLenDgnH89jL/85tF8sNu
         qV9nlUmy3Lj4WsoPcdJZB5ibMxW3eXUQKfFoeH66ggqlhakEj8yW0H0en+PBWQnEM+4j
         Qkgg==
X-Gm-Message-State: AOJu0Yy3D2qp53+jYAfP7l+E71XG5m2bDsB64IIrsNIZ6kGW43ldA5qy
	0g1KahEw5GN8JZGQjg1tzU6k4MS0/wD5KnTDjJySYxoIC54Mmh40/+wWap3I9Ul7
X-Gm-Gg: AeBDiet1ska9UMJJnFFzE2jq/J8zhyiZYgRfpsCyrrKCQU/0EOI5Uh4JJDvuXMednP8
	/r5ipfDisUse2+VQxkQ1w0H9agT5knjghAMxBVOHnrVFwJ4oXBe8xGWH3tN3arjP5mva840kd2r
	i2wC8x4gCdFr/uKnCPqJlGqYvOFe72ViNv6w/gM65kOUNn+3wXOl+U97NpEDMJj4/L75k/tK/nf
	jCFBQlTqHyGlx9fruvkwrfsoVRHVelpVuiUbLca9qmrrD6Z6TT7FA4Gwqa6S0rHaXr++v+kWvrL
	eYDbH+ulotaV8cKkyVPaKz972t7RmOFfioIqQzgJMh20XffMd4uxllehMAna9YuCBUat8NmMCQ0
	7mS3v7oTdH+She2d4N2Kaekg/pn7fH1irN/O5MrJGgGm200ydWPqd49FRCJrzGvuopb/k5aZO1U
	LiiB5nwVzHqSAW3iwMKSVvBi7MQcWUOD9JZtC+ElzRNkYXEUHT2QH23r28zsWw55a0n034LVE2o
	+yemfq0N6dUQpRmKKwJVD64bYj5p/DZJvgaMAoJbFZdDbzi83eV7jZXKF0U8Zi2xToHK5WA7Eoq
	eLLM
X-Received: by 2002:a05:6214:2f12:b0:89c:5b90:3d80 with SMTP id 6a1803df08f44-8b0280eaea2mr443106896d6.34.1776958346570;
        Thu, 23 Apr 2026 08:32:26 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac429ffsm160765996d6.2.2026.04.23.08.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:32:26 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 02/15] linux-yocto/6.18: update CVE exclusions (6.18.20)
Date: Thu, 23 Apr 2026 11:32:09 -0400
Message-ID: <20260423153222.1932256-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423153222.1932256-1-bruce.ashfield@gmail.com>
References: <20260423153222.1932256-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 15:32:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235777

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 13 changes (7 new | 6 updated): - 7 new CVEs: CVE-2026-31943, CVE-2026-31945, CVE-2026-31950, CVE-2026-31951, CVE-2026-32241, CVE-2026-34389, CVE-2026-34391 - 6 updated CVEs: CVE-2026-26060, CVE-2026-33284, CVE-2026-34374, CVE-2026-34387, CVE-2026-4966, CVE-2026-4972
        Date: Fri, 27 Mar 2026 19:35:44 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.18.inc              | 252 +++++++++++++++++-
 1 file changed, 245 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.18.inc b/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
index 73b93ff135..8f458e9d10 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2026-03-23 02:14:01.393507+00:00 for kernel version 6.18.19
-# From linux_kernel_cves cve_2026-03-23_0100Z
+# Generated at 2026-03-27 19:44:12.925073+00:00 for kernel version 6.18.20
+# From linux_kernel_cves cve_2026-03-27_1900Z-1-g663ca5d2278
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.18.19"
+    this_version = "6.18.20"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -2770,8 +2770,6 @@ CVE_STATUS[CVE-2022-49265] = "fixed-version: Fixed from version 5.18"
 
 CVE_STATUS[CVE-2022-49266] = "fixed-version: Fixed from version 5.18"
 
-CVE_STATUS[CVE-2022-49267] = "fixed-version: Fixed from version 5.18"
-
 CVE_STATUS[CVE-2022-49268] = "fixed-version: Fixed from version 5.18"
 
 CVE_STATUS[CVE-2022-49269] = "fixed-version: Fixed from version 5.18"
@@ -9916,8 +9914,6 @@ CVE_STATUS[CVE-2024-27040] = "fixed-version: Fixed from version 6.9"
 
 CVE_STATUS[CVE-2024-27041] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2024-27042] = "fixed-version: Fixed from version 6.9"
-
 CVE_STATUS[CVE-2024-27043] = "fixed-version: Fixed from version 6.9"
 
 CVE_STATUS[CVE-2024-27044] = "fixed-version: Fixed from version 6.9"
@@ -21040,3 +21036,245 @@ CVE_STATUS[CVE-2026-23277] = "cpe-stable-backport: Backported in 6.18.19"
 
 CVE_STATUS[CVE-2026-23278] = "cpe-stable-backport: Backported in 6.18.19"
 
+CVE_STATUS[CVE-2026-23279] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23280] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23281] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23282] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23283] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-23284] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23285] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23286] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23287] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23288] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-23289] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23290] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23291] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23292] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23293] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23294] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23295] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-23296] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23297] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23298] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23299] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23300] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23301] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-23302] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23303] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23304] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23305] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23306] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23307] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23308] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23309] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23310] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23311] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23312] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23313] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23314] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23315] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23316] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23317] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23318] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23319] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23320] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23321] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23322] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23323] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-23324] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23325] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23326] = "cpe-stable-backport: Backported in 6.18.17"
+
+# CVE-2026-23327 needs backporting (fixed from 7.0rc2)
+
+# CVE-2026-23328 needs backporting (fixed from 7.0rc3)
+
+CVE_STATUS[CVE-2026-23329] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23330] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23331] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23332] = "cpe-stable-backport: Backported in 6.18.17"
+
+# CVE-2026-23333 has no known resolution
+
+CVE_STATUS[CVE-2026-23334] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23335] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23336] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23337] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-23338] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23339] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23340] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23341] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-23342] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23343] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23344] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-23345] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23346] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23347] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23348] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23349] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23350] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-23351] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23352] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23353] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-23354] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23355] = "cpe-stable-backport: Backported in 6.18.18"
+
+CVE_STATUS[CVE-2026-23356] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23357] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23358] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23359] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23360] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23361] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23362] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23363] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23364] = "cpe-stable-backport: Backported in 6.18.19"
+
+CVE_STATUS[CVE-2026-23365] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23366] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23367] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23368] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23369] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23370] = "cpe-stable-backport: Backported in 6.18.17"
+
+# CVE-2026-23371 needs backporting (fixed from 7.0rc3)
+
+CVE_STATUS[CVE-2026-23372] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23373] = "cpe-stable-backport: Backported in 6.18.17"
+
+# CVE-2026-23374 needs backporting (fixed from 7.0rc3)
+
+CVE_STATUS[CVE-2026-23375] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23376] = "cpe-stable-backport: Backported in 6.18.17"
+
+# CVE-2026-23377 needs backporting (fixed from 7.0rc3)
+
+CVE_STATUS[CVE-2026-23378] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23379] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23380] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23381] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23382] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23383] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23384] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23385] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23386] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23387] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23388] = "cpe-stable-backport: Backported in 6.18.17"
+
+# CVE-2026-23389 needs backporting (fixed from 7.0rc3)
+
+CVE_STATUS[CVE-2026-23390] = "cpe-stable-backport: Backported in 6.18.13"
+
+CVE_STATUS[CVE-2026-23391] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23392] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23393] = "cpe-stable-backport: Backported in 6.18.20"
+
+# CVE-2026-23394 needs backporting (fixed from 7.0rc5)
+
+CVE_STATUS[CVE-2026-23395] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23396] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23397] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23398] = "cpe-stable-backport: Backported in 6.18.20"
+
+# CVE-2026-31788 has no known resolution
+
-- 
2.43.0


