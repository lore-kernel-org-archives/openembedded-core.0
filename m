Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98931FC0346
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:32:30 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.414.1776958350147647865
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 08:32:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=grAbwqYs;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-89f1e767f92so61510256d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 08:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776958349; x=1777563149; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBImrUMbbmaRs8DkpdLk9zj6TNo0vnqEpFNYLDHrWW4=;
        b=grAbwqYsiH38apUPY8pp1M1ZbXty4A5qOX31anukb/Ugsiy4RCXq8DJFasW0kKcCHJ
         1u78T/8K4VawNp9hAIMCjYcETho97jgEPEI4yzxENcfdHf6pesXeVQmKZtOAC8vdlpiQ
         J9S03iBs/pN49lqMPsEhrcx4CipSFKVs28WIgO7pZIgJR50/AbO3nvWfOU/ir/1L8pnP
         xydd0DCPqO8ZThpQ0exEh4ybVIagaTCiqRDRDGz0f8yIrst7Zy6Tudl5lDLExdm6iMH7
         awdH3mRcSwZfHK6W/JdindFgOhi00udbPkTZOaG0VQ0WemEcwEQl6xuSGMoqUPD+VXSE
         JCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776958349; x=1777563149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XBImrUMbbmaRs8DkpdLk9zj6TNo0vnqEpFNYLDHrWW4=;
        b=OXNV9fbWiR8rGveyF/amuyVjANDEXfqURKLEdetGM32GsXSHX55xL0hFfYFW/j1ko+
         CGam9c0eFLqkkQ8v7k/5nW2JCVBq51iUV02sidZwa/hbL6FUc6pkKsViN9qLvBlsXZ1O
         08PhARP6hqb+IGH1KIFwQur+fZPKlE5pEBTpdFHN/w4UvWh8b8ht7BQuV4DgQk3MxLQJ
         ohotvbfK5eYxZuMbj3XSgLCOEeNIxoaSCfo7uXJpvJOAoL3ZxLeojwAPu7LdM8FpFT80
         8d7Jd2PNjhljDzcitX9MhIlZm8AaVjnSqF5jZTFGcAmwkloQJxpPa9/y4lCBwbWc5VqR
         GHKA==
X-Gm-Message-State: AOJu0Yxw2XHnejBysy0RlP0FTzPB8W1foEqocyovwNqEPp1HyjWSsDSw
	1z1A2X7vrRVoSlWnl8Sk2LmIMTUe+oskUhLHHgBORJYNGe9dURhKcOx+oGB5sus3
X-Gm-Gg: AeBDiesOSjU53L0KuT3K+0zsGoX1Dx5EKZNmlOw/M3MOTMnGERenRbFO/KhJQh0Dj+Q
	++sVyZmDL/Ex+sMKpgOdNdsCsA50tjRWZCgkTxR39x0qJI85aABVhb6/l0UNewfZxp8HRii+KHj
	XVTQqtWOa8Urf87nur6ioN/2ZtEYlTnTlkehbVF9zNdqAMpg+7lUSOLIar+yEafCF5EG/+QFRfX
	QQaIgVqgbQW/ximxnzZ9ZTi0dU5cnOrDvHhRQyuGchwiWcw5AhhQwYaGOZDv37bykX/ZD+lN+ue
	NHQc3Wz0CuiQKlUeJ/CdFvqyNi2o8Dvnio0AX1Ivm4SdfWjqxSIhD9ciBj5yfDY3OI2GdcxPBdP
	OHRx3Xxk3cl5PT8ippZv04GUPd9khDUXNolxrMe4JNasyTLMBuD90hkGz3BTzz8OUtXm/gsR5Fg
	LnyBtiKGYKw+vuPy/gakYCZ8Y5zrr2gzgBtqyLoQQum7hZYMdEweWXqeGC/z9WrHh26lazk5LW7
	tphXrZC2OpwHXU4blX00FaGzDEhbT0KPtaoyEDhkoB3AUGj/AqLp6p+2kaqFdcY4TgfDg==
X-Received: by 2002:ad4:5ae5:0:b0:8b1:f5da:f80e with SMTP id 6a1803df08f44-8b1f5dafbc5mr187747386d6.40.1776958348860;
        Thu, 23 Apr 2026 08:32:28 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac429ffsm160765996d6.2.2026.04.23.08.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:32:28 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 04/15] linux-yocto/6.18: update CVE exclusions (6.18.21)
Date: Thu, 23 Apr 2026 11:32:11 -0400
Message-ID: <20260423153222.1932256-5-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423153222.1932256-1-bruce.ashfield@gmail.com>
References: <20260423153222.1932256-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 15:32:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235779

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 35 changes (5 new | 30 updated): - 5 new CVEs: CVE-2025-57847, CVE-2025-57851, CVE-2025-57853, CVE-2025-57854, CVE-2025-58713 - 30 updated CVEs: CVE-2023-52356, CVE-2024-8299, CVE-2024-9852, CVE-2025-14104, CVE-2025-14821, CVE-2025-14831, CVE-2026-1757, CVE-2026-26157, CVE-2026-26158, CVE-2026-27787, CVE-2026-28261, CVE-2026-2625, CVE-2026-35393, CVE-2026-35398, CVE-2026-35409, CVE-2026-35413, CVE-2026-35444, CVE-2026-35452, CVE-2026-35473, CVE-2026-39698, CVE-2026-39700, CVE-2026-39702, CVE-2026-39935, CVE-2026-3142, CVE-2026-3781, CVE-2026-4483, CVE-2026-5302, CVE-2026-5506, CVE-2026-5688, CVE-2026-5705
        Date: Wed, 8 Apr 2026 14:13:08 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.18.inc              | 216 +++++++++++++++++-
 1 file changed, 206 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.18.inc b/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
index 8f458e9d10..03f89ed9eb 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2026-03-27 19:44:12.925073+00:00 for kernel version 6.18.20
-# From linux_kernel_cves cve_2026-03-27_1900Z-1-g663ca5d2278
+# Generated at 2026-04-08 14:33:17.297345+00:00 for kernel version 6.18.21
+# From linux_kernel_cves cve_2026-04-08_1300Z-1-g105fda2ec51
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.18.20"
+    this_version = "6.18.21"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -19248,7 +19248,7 @@ CVE_STATUS[CVE-2025-40217] = "fixed-version: Fixed from version 6.18"
 
 CVE_STATUS[CVE-2025-40218] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40219] = "fixed-version: Fixed from version 6.18"
+CVE_STATUS[CVE-2025-40219] = "cpe-stable-backport: Backported in 6.18.16"
 
 CVE_STATUS[CVE-2025-40220] = "fixed-version: Fixed from version 6.18"
 
@@ -20108,8 +20108,6 @@ CVE_STATUS[CVE-2025-68810] = "cpe-stable-backport: Backported in 6.18.3"
 
 CVE_STATUS[CVE-2025-68811] = "cpe-stable-backport: Backported in 6.18.3"
 
-CVE_STATUS[CVE-2025-68812] = "cpe-stable-backport: Backported in 6.18.3"
-
 CVE_STATUS[CVE-2025-68813] = "cpe-stable-backport: Backported in 6.18.3"
 
 CVE_STATUS[CVE-2025-68814] = "cpe-stable-backport: Backported in 6.18.3"
@@ -21118,8 +21116,6 @@ CVE_STATUS[CVE-2026-23318] = "cpe-stable-backport: Backported in 6.18.17"
 
 CVE_STATUS[CVE-2026-23319] = "cpe-stable-backport: Backported in 6.18.17"
 
-CVE_STATUS[CVE-2026-23320] = "cpe-stable-backport: Backported in 6.18.17"
-
 CVE_STATUS[CVE-2026-23321] = "cpe-stable-backport: Backported in 6.18.17"
 
 CVE_STATUS[CVE-2026-23322] = "cpe-stable-backport: Backported in 6.18.17"
@@ -21144,7 +21140,7 @@ CVE_STATUS[CVE-2026-23331] = "cpe-stable-backport: Backported in 6.18.17"
 
 CVE_STATUS[CVE-2026-23332] = "cpe-stable-backport: Backported in 6.18.17"
 
-# CVE-2026-23333 has no known resolution
+# CVE-2026-23333 needs backporting (fixed from 7.0rc1)
 
 CVE_STATUS[CVE-2026-23334] = "cpe-stable-backport: Backported in 6.18.17"
 
@@ -21276,5 +21272,205 @@ CVE_STATUS[CVE-2026-23397] = "cpe-stable-backport: Backported in 6.18.20"
 
 CVE_STATUS[CVE-2026-23398] = "cpe-stable-backport: Backported in 6.18.20"
 
-# CVE-2026-31788 has no known resolution
+CVE_STATUS[CVE-2026-23399] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23400] = "cpe-stable-backport: Backported in 6.18.19"
+
+CVE_STATUS[CVE-2026-23401] = "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-23402] = "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-23403] = "cpe-stable-backport: Backported in 6.18.18"
+
+CVE_STATUS[CVE-2026-23404] = "cpe-stable-backport: Backported in 6.18.18"
+
+CVE_STATUS[CVE-2026-23405] = "cpe-stable-backport: Backported in 6.18.18"
+
+CVE_STATUS[CVE-2026-23406] = "cpe-stable-backport: Backported in 6.18.18"
+
+CVE_STATUS[CVE-2026-23407] = "cpe-stable-backport: Backported in 6.18.18"
+
+CVE_STATUS[CVE-2026-23408] = "cpe-stable-backport: Backported in 6.18.18"
+
+CVE_STATUS[CVE-2026-23409] = "cpe-stable-backport: Backported in 6.18.18"
+
+CVE_STATUS[CVE-2026-23410] = "cpe-stable-backport: Backported in 6.18.18"
+
+CVE_STATUS[CVE-2026-23411] = "cpe-stable-backport: Backported in 6.18.18"
+
+CVE_STATUS[CVE-2026-23412] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23413] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23414] = "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-23415] = "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-23416] = "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-23417] = "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-23418] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23419] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23420] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23421] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23422] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23423] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23424] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23425] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23426] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23427] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23428] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23429] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23430] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23431] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23432] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-23433] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-23434] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23435] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23436] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23437] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23438] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23439] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23440] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23441] = "cpe-stable-backport: Backported in 6.18.20"
+
+# CVE-2026-23442 needs backporting (fixed from 7.0rc5)
+
+CVE_STATUS[CVE-2026-23443] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23444] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23445] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23446] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23447] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23448] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23449] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23450] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23451] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23452] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23453] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-23454] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23455] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23456] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23457] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23458] = "cpe-stable-backport: Backported in 6.18.20"
+
+# CVE-2026-23459 needs backporting (fixed from 7.0rc5)
+
+CVE_STATUS[CVE-2026-23460] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23461] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23462] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23463] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23464] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23465] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23466] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23467] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23468] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23469] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23470] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23471] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23472] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23473] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23474] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-23475] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-31389] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-31390] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-31391] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-31392] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-31393] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-31394] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-31395] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-31396] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-31397] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-31398] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-31399] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-31400] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-31401] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-31402] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-31403] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-31404] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-31405] = "cpe-stable-backport: Backported in 6.18.19"
+
+CVE_STATUS[CVE-2026-31406] = "cpe-stable-backport: Backported in 6.18.21"
+
+# CVE-2026-31407 needs backporting (fixed from 7.0rc5)
+
+CVE_STATUS[CVE-2026-31408] = "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31409] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-31410] = "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-31411] = "cpe-stable-backport: Backported in 6.18.14"
+
+CVE_STATUS[CVE-2026-31788] = "cpe-stable-backport: Backported in 6.18.20"
 
-- 
2.43.0


