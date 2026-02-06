Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D68EE6B56
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 20:27:51 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23.1770409665855667723
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 12:27:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KeKQezxg;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8946e0884afso22116856d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 12:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770409665; x=1771014465; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mbRyE2++Q/nBWDtzfxAHB5a/lZwD5yyGbbyxtTlLOrU=;
        b=KeKQezxgbs1vCaK9ZhKl3oNrf6FhlWAMvL9EkQOCa+ILkcdHi0wVX2a3Pz0U9qWgty
         5uLsVG3/qrVFR5NEgy2PF+wUk2pfT0R1l4AXShXNrdTUcGiQh/r2IRTY7fctKcbuFscz
         7k66Q7WLa/g/FVwM/9rwR2Drd7lbwqDP7NQt65C8t7D6q1Me99KkWUaqfoihzAXT6WPV
         A7V8tWZqSoCLdJlTioWKjdgC8d3f3LhpRVS3e8CqqWfzzk/TAfNAbkffUhaPZB2GfrLG
         LEFU5KwBExAIHyYa0r+q8tA//m6nHA3bG1tET1QdTNnV4Xv+pwu0+LCep6hSGw7lonRv
         ksoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770409665; x=1771014465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mbRyE2++Q/nBWDtzfxAHB5a/lZwD5yyGbbyxtTlLOrU=;
        b=DrXR2F4+NNjltP7kYQ0l2KImymMu7o+ravlWerXPPqXb8WSvyt74VXfT5Sf1lLecHD
         6es5oZLZQE4fdn26HGv6nmtEggz2yVlH1bJVYP+8+w9xeyFeL3TiNqW12YHtw1YuZ4Jo
         jy+lnKgFZwqm0Kkg60gXb2Ib0M++3BbAFHVZlnpk2LGUgon5vtQR0ILur8CdcgzOaG5y
         9IMsVWaZmxDywa/0G9LfXpMuyoWPuVVaS+KdS2qXzY/bTbZTHvRelcH74D1pdwxZ4FpJ
         9r+bBEXJ0VTVop14oxX8T+EkebzUyLJ3fXF59wJ22XDaGK0lNDKWX+HpAMVveXwvZmCw
         Bb1Q==
X-Gm-Message-State: AOJu0Yy0ghuYvUxaeUlGJrxgyrlp9oPR8sgkhtvWYerLe7xHWoIlo3CH
	awfSCtF1rg/LZQ51BJDsoVmia9CQKFndSc7eKCOsI8mCdLbGTjyAYYm6vAg62kkn
X-Gm-Gg: AZuq6aK6YKQh9u4Ansjy1srFnsPiaFbC4WaWuRUpwNT1n5QoVl/e5mfOOF37anqAaXQ
	vuPAhJGITE3U4yBZNDdbye6jXm7cGJOyKxsxYKxHjSAqzbJaIux+s+xJnQgvEqQH2eG3Ape9hjb
	IdU2m9S3caWS4W3dywmsSHRlyapNs981aqAmSajMMGFN5kEedX/RjFSiNGmSFCOLugoabEEHYUe
	wsjpi+fVI5vxcxfPfEpmOWBOE0gn4zhlot4o3lkPsLiaCzPrBvYjYcwxwDRPfMbiGqe+63P81dk
	6kWPv9u5MKU9kJJlDTktGyCDeL9yRpg1JGEeDTwLCT4Bj1LcanBp5G/seGFUDktoC+oJZOGb+8q
	NFvSlAOyrhWHV2bGBtiWFAWrOb84Y4wUgxV3D5alyGPXD7iFoRbg8t+FWjUh2K0JWiRz2g2acDd
	TZyHlh/R9jsjvNmykIoZRCL7qHuNNn7yZVzEqZ2bEuky0jit87in3GRrH3zU9UO3tj2fwoLDSBr
	AmcDh7HK7R33JvaPAfWrKSNB4QKdpe8fCn3FR5CC24+CKE=
X-Received: by 2002:a05:622a:1989:b0:4ed:1af6:230e with SMTP id d75a77b69052e-5063995579fmr54215541cf.56.1770409664852;
        Fri, 06 Feb 2026 12:27:44 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-506392bf955sm22651541cf.25.2026.02.06.12.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 12:27:44 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 06/09] linux-yocto/6.18: update CVE exclusions (6.18.7)
Date: Fri,  6 Feb 2026 15:27:24 -0500
Message-ID: <20260206202732.1080699-7-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206202732.1080699-1-bruce.ashfield@gmail.com>
References: <20260206202732.1080699-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 20:27:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230650

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 10 changes (10 new | 0 updated): - 10 new CVEs: CVE-2025-11065, CVE-2025-11687, CVE-2025-14459, CVE-2025-14525, CVE-2025-14969, CVE-2025-9520, CVE-2025-9521, CVE-2025-9522, CVE-2026-0810, CVE-2026-1190 - 0 updated CVEs:
        Date: Mon, 26 Jan 2026 19:39:25 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.18.inc              | 118 +++++++++++++++++-
 1 file changed, 114 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.18.inc b/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
index 38f260d231..a29732706e 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2026-01-22 14:32:14.186712+00:00 for kernel version 6.18.6
-# From linux_kernel_cves cve_2026-01-22_1400Z
+# Generated at 2026-01-26 19:48:18.296749+00:00 for kernel version 6.18.7
+# From linux_kernel_cves cve_2026-01-26_1900Z-2-g425a25ddf37
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.18.6"
+    this_version = "6.18.7"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -20158,7 +20158,7 @@ CVE_STATUS[CVE-2025-71072] = "cpe-stable-backport: Backported in 6.18.3"
 
 CVE_STATUS[CVE-2025-71073] = "cpe-stable-backport: Backported in 6.18.3"
 
-CVE_STATUS[CVE-2025-71074] = "cpe-stable-backport: Backported in 6.18.3"
+# CVE-2025-71074 needs backporting (fixed from 6.19rc1)
 
 CVE_STATUS[CVE-2025-71075] = "cpe-stable-backport: Backported in 6.18.3"
 
@@ -20300,7 +20300,117 @@ CVE_STATUS[CVE-2025-71143] = "cpe-stable-backport: Backported in 6.18.4"
 
 CVE_STATUS[CVE-2025-71144] = "cpe-stable-backport: Backported in 6.18.5"
 
+# CVE-2025-71145 has no known resolution
+
+CVE_STATUS[CVE-2025-71146] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71147] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71148] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71149] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71150] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71151] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71152] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71153] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71154] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71155] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71156] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71157] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71158] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2025-71159] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2025-71160] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2025-71161] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2025-71162] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2025-71163] = "cpe-stable-backport: Backported in 6.18.7"
+
 CVE_STATUS[CVE-2026-22976] = "cpe-stable-backport: Backported in 6.18.6"
 
 CVE_STATUS[CVE-2026-22977] = "cpe-stable-backport: Backported in 6.18.6"
 
+CVE_STATUS[CVE-2026-22978] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-22979] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-22980] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-22981] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-22982] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-22983] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-22984] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-22985] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-22986] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-22987] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-22988] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-22989] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-22990] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-22991] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-22992] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-22993] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-22994] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-22995] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-22996] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-22997] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-22998] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-22999] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-23000] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-23001] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-23002] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-23003] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-23004] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-23005] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-23006] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-23007] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-23008] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-23009] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-23010] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-23011] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-23012] = "cpe-stable-backport: Backported in 6.18.7"
+
+CVE_STATUS[CVE-2026-23013] = "cpe-stable-backport: Backported in 6.18.7"
+
-- 
2.43.0


