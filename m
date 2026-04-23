Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4414AFC0350
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:32:41 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.396.1776958353297013616
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 08:32:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=B1dFAHtS;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8ac9ef74131so105182466d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 08:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776958352; x=1777563152; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HTex4mjMeQ+KOs0bFzb1jai3kHhMnPWGeO6hYimPsqo=;
        b=B1dFAHtSkywWnduLYtoUpdIICPYkaJfDupZgpUBMbhT+zYA4DkHFhiUyqdHaYxa+2B
         7SkAe4CZZMY6T8EQgoAnilS4Khi+NrA3gN9m8m3j4FT9QvgUUcFg/TUTBCgqzgXAbyH4
         FJIhcA9MojMEhpH1zG51D73GLI12ava96tz35ljyreEEwZHxlpo3N13j6W/VFpjS2fOt
         D9S2SczsuXYfdgRxzs40Xv47++m6UxasRWQnmzRZEjlUTQJPpo+3PYaZULIS8jrZHmah
         Hj7Il3K3FFwztG5VqjOe6GRwBNg+P+smEBVD7O8MpZOmw7PNkKgpoTIIiaJF3uXDcLTk
         jx3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776958352; x=1777563152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HTex4mjMeQ+KOs0bFzb1jai3kHhMnPWGeO6hYimPsqo=;
        b=MUJiGYrFXm73HTEnFBWL6A/eNUrEUaU3oht7W6ElBz2k69gWAVxZoyck6KdhKAiwgg
         kspBZahY3QekXmRtHX6sq24TwZbAAFPyVCfmJMwT8/jGf/ZaaAYQ6i4zbCKUux6Bg9GG
         UsINHmNVr002Pi+D/OgNlyl02mQ+6uWLP4hTygZVwg8s6ICa4SWYnLtOW9P8jbdxEgs+
         zBKtKS7xfJKcgbmXVhHZVVoTBd9ges0BF3ivKzIkU38QkAg7OUwb/eGxuUuXF/MeOFIu
         VzpnF3mmznwjN5Qk+RWg+IGR6mbI4v8ZPUdrjR5QRPt36Zc6B5cD41fg9GosxdotOgJn
         qZ4g==
X-Gm-Message-State: AOJu0Yy51LTSTX9s62gTNbn24AU5XCU/XseLXdfgsqyJUBtIje8JuIWG
	ILi1t7voh6v8kstCP2jWXFP9l6OkVtfeuONcrhjpjUWwiEOARfTUv+RzEYLsJS7a
X-Gm-Gg: AeBDieu1qmGmhie8fcxqsG/wVOqT5T4N8zinXe2kuo5dSyQv7vcZREpyVCOwKt5Vt6y
	F8OShGaq2rPNDk3i8Wg5LcRsgu8xd2vuAmG6YQgE/P/E8OG3TLsi3TVfDmyz6n0WDUGpN9KY4H9
	e3iGrYrHnCQOf+lLzZ6lr5+0jaQxa+5voVqY7/hzIqi/9HtKJ8I5TqD52sDzX6heUyPjId5I3D3
	+R9FASzmlyXqL3XjyNzB4mKSBZtzpQFH+hIhdMlY4K39zplVcSt2VZR/hhDv+rQOCeI5/fyT7eA
	VXb0xXNGBqs0OghSbS4tG3g51pShLmenrT1wii5gotEzkJmBa+F7jEXF3gSC/6rgUDWycrKodGr
	bxqXSQmh49G4QcfzkHAgkhniQncXzbjb7wnI27B5V9BVuNJEa8gwNYpRwP+T4qdMWmLmVCNSG/8
	gQqa4IZBJ6TC/8FCWabRPqT9Pu1dskQasLHy25UphmsaPCUcGqXXkt2IpUwWPC+cBtCJd1dxXFB
	S8DajJKCA/zGejKKzw3H968uOcZQ2fK3xVSb1jfJ+1EBCmZ8Mad4fiQUQQ1/KOXn9glML8I7aRn
	SsRY
X-Received: by 2002:a0c:e018:0:b0:89c:5743:d09a with SMTP id 6a1803df08f44-8b028040598mr420953916d6.2.1776958352030;
        Thu, 23 Apr 2026 08:32:32 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac429ffsm160765996d6.2.2026.04.23.08.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:32:31 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 06/15] linux-yocto/6.18: update CVE exclusions (6.18.22)
Date: Thu, 23 Apr 2026 11:32:13 -0400
Message-ID: <20260423153222.1932256-7-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423153222.1932256-1-bruce.ashfield@gmail.com>
References: <20260423153222.1932256-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 15:32:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235781

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 4 changes (4 new | 0 updated): - 4 new CVEs: CVE-2026-33714, CVE-2026-33715, CVE-2026-34160, CVE-2026-34161 - 0 updated CVEs:
        Date: Tue, 14 Apr 2026 21:14:51 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.18.inc              | 68 +++++++++++++------
 1 file changed, 49 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.18.inc b/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
index 03f89ed9eb..2429851ff8 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2026-04-08 14:33:17.297345+00:00 for kernel version 6.18.21
-# From linux_kernel_cves cve_2026-04-08_1300Z-1-g105fda2ec51
+# Generated at 2026-04-14 21:26:55.774766+00:00 for kernel version 6.18.22
+# From linux_kernel_cves cve_2026-04-14_2000Z-2-gad6d9150d01
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.18.21"
+    this_version = "6.18.22"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -21052,7 +21052,7 @@ CVE_STATUS[CVE-2026-23286] = "cpe-stable-backport: Backported in 6.18.17"
 
 CVE_STATUS[CVE-2026-23287] = "cpe-stable-backport: Backported in 6.18.17"
 
-CVE_STATUS[CVE-2026-23288] = "fixed-version: only affects 6.19 onwards"
+CVE_STATUS[CVE-2026-23288] = "fixed-version: only affects 6.19.4 onwards"
 
 CVE_STATUS[CVE-2026-23289] = "cpe-stable-backport: Backported in 6.18.17"
 
@@ -21128,9 +21128,9 @@ CVE_STATUS[CVE-2026-23325] = "cpe-stable-backport: Backported in 6.18.17"
 
 CVE_STATUS[CVE-2026-23326] = "cpe-stable-backport: Backported in 6.18.17"
 
-# CVE-2026-23327 needs backporting (fixed from 7.0rc2)
+# CVE-2026-23327 needs backporting (fixed from 7.0)
 
-# CVE-2026-23328 needs backporting (fixed from 7.0rc3)
+# CVE-2026-23328 needs backporting (fixed from 7.0)
 
 CVE_STATUS[CVE-2026-23329] = "cpe-stable-backport: Backported in 6.18.17"
 
@@ -21140,8 +21140,6 @@ CVE_STATUS[CVE-2026-23331] = "cpe-stable-backport: Backported in 6.18.17"
 
 CVE_STATUS[CVE-2026-23332] = "cpe-stable-backport: Backported in 6.18.17"
 
-# CVE-2026-23333 needs backporting (fixed from 7.0rc1)
-
 CVE_STATUS[CVE-2026-23334] = "cpe-stable-backport: Backported in 6.18.17"
 
 CVE_STATUS[CVE-2026-23335] = "cpe-stable-backport: Backported in 6.18.17"
@@ -21156,7 +21154,7 @@ CVE_STATUS[CVE-2026-23339] = "cpe-stable-backport: Backported in 6.18.17"
 
 CVE_STATUS[CVE-2026-23340] = "cpe-stable-backport: Backported in 6.18.17"
 
-CVE_STATUS[CVE-2026-23341] = "fixed-version: only affects 6.19 onwards"
+CVE_STATUS[CVE-2026-23341] = "fixed-version: only affects 6.19.4 onwards"
 
 CVE_STATUS[CVE-2026-23342] = "cpe-stable-backport: Backported in 6.18.17"
 
@@ -21216,19 +21214,19 @@ CVE_STATUS[CVE-2026-23369] = "cpe-stable-backport: Backported in 6.18.17"
 
 CVE_STATUS[CVE-2026-23370] = "cpe-stable-backport: Backported in 6.18.17"
 
-# CVE-2026-23371 needs backporting (fixed from 7.0rc3)
+# CVE-2026-23371 needs backporting (fixed from 7.0)
 
 CVE_STATUS[CVE-2026-23372] = "cpe-stable-backport: Backported in 6.18.17"
 
 CVE_STATUS[CVE-2026-23373] = "cpe-stable-backport: Backported in 6.18.17"
 
-# CVE-2026-23374 needs backporting (fixed from 7.0rc3)
+# CVE-2026-23374 needs backporting (fixed from 7.0)
 
 CVE_STATUS[CVE-2026-23375] = "cpe-stable-backport: Backported in 6.18.17"
 
 CVE_STATUS[CVE-2026-23376] = "cpe-stable-backport: Backported in 6.18.17"
 
-# CVE-2026-23377 needs backporting (fixed from 7.0rc3)
+# CVE-2026-23377 needs backporting (fixed from 7.0)
 
 CVE_STATUS[CVE-2026-23378] = "cpe-stable-backport: Backported in 6.18.17"
 
@@ -21252,7 +21250,7 @@ CVE_STATUS[CVE-2026-23387] = "cpe-stable-backport: Backported in 6.18.17"
 
 CVE_STATUS[CVE-2026-23388] = "cpe-stable-backport: Backported in 6.18.17"
 
-# CVE-2026-23389 needs backporting (fixed from 7.0rc3)
+CVE_STATUS[CVE-2026-23389] = "cpe-stable-backport: Backported in 6.18.22"
 
 CVE_STATUS[CVE-2026-23390] = "cpe-stable-backport: Backported in 6.18.13"
 
@@ -21262,7 +21260,7 @@ CVE_STATUS[CVE-2026-23392] = "cpe-stable-backport: Backported in 6.18.20"
 
 CVE_STATUS[CVE-2026-23393] = "cpe-stable-backport: Backported in 6.18.20"
 
-# CVE-2026-23394 needs backporting (fixed from 7.0rc5)
+# CVE-2026-23394 needs backporting (fixed from 7.0)
 
 CVE_STATUS[CVE-2026-23395] = "cpe-stable-backport: Backported in 6.18.20"
 
@@ -21358,7 +21356,7 @@ CVE_STATUS[CVE-2026-23440] = "cpe-stable-backport: Backported in 6.18.20"
 
 CVE_STATUS[CVE-2026-23441] = "cpe-stable-backport: Backported in 6.18.20"
 
-# CVE-2026-23442 needs backporting (fixed from 7.0rc5)
+# CVE-2026-23442 needs backporting (fixed from 7.0)
 
 CVE_STATUS[CVE-2026-23443] = "cpe-stable-backport: Backported in 6.18.20"
 
@@ -21392,7 +21390,7 @@ CVE_STATUS[CVE-2026-23457] = "cpe-stable-backport: Backported in 6.18.20"
 
 CVE_STATUS[CVE-2026-23458] = "cpe-stable-backport: Backported in 6.18.20"
 
-# CVE-2026-23459 needs backporting (fixed from 7.0rc5)
+# CVE-2026-23459 needs backporting (fixed from 7.0)
 
 CVE_STATUS[CVE-2026-23460] = "cpe-stable-backport: Backported in 6.18.20"
 
@@ -21416,8 +21414,6 @@ CVE_STATUS[CVE-2026-23469] = "cpe-stable-backport: Backported in 6.18.20"
 
 CVE_STATUS[CVE-2026-23470] = "cpe-stable-backport: Backported in 6.18.20"
 
-CVE_STATUS[CVE-2026-23471] = "cpe-stable-backport: Backported in 6.18.20"
-
 CVE_STATUS[CVE-2026-23472] = "cpe-stable-backport: Backported in 6.18.20"
 
 CVE_STATUS[CVE-2026-23473] = "cpe-stable-backport: Backported in 6.18.20"
@@ -21462,7 +21458,7 @@ CVE_STATUS[CVE-2026-31405] = "cpe-stable-backport: Backported in 6.18.19"
 
 CVE_STATUS[CVE-2026-31406] = "cpe-stable-backport: Backported in 6.18.21"
 
-# CVE-2026-31407 needs backporting (fixed from 7.0rc5)
+# CVE-2026-31407 needs backporting (fixed from 7.0)
 
 CVE_STATUS[CVE-2026-31408] = "cpe-stable-backport: Backported in 6.18.21"
 
@@ -21472,5 +21468,39 @@ CVE_STATUS[CVE-2026-31410] = "cpe-stable-backport: Backported in 6.18.20"
 
 CVE_STATUS[CVE-2026-31411] = "cpe-stable-backport: Backported in 6.18.14"
 
+CVE_STATUS[CVE-2026-31412] = "cpe-stable-backport: Backported in 6.18.19"
+
+CVE_STATUS[CVE-2026-31413] = "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31414] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31415] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31416] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31417] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31418] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31419] = "cpe-stable-backport: Backported in 6.18.22"
+
+# CVE-2026-31420 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-31421] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31422] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31423] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31424] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31425] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31426] = "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31427] = "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31428] = "cpe-stable-backport: Backported in 6.18.21"
+
 CVE_STATUS[CVE-2026-31788] = "cpe-stable-backport: Backported in 6.18.20"
 
-- 
2.43.0


