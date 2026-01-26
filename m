Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0803CD13C39
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 15:24:08 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22594.1769441042498523310
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 07:24:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g2VlowHi;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5014e8b1615so50759631cf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 07:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769441041; x=1770045841; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVH9oGSpX5jUdwWU33mBT6LQXhPx1sCFss1jpjrYy1U=;
        b=g2VlowHi6sM9YxjCyNkdqCSq4SkU/++E+Mha7usMcUuYF4bvB7bmJTcecJKxTy18gj
         eDwqsIcvvkoNY6PLq+wkVlLFxmCrgaZ/S9W8hjbjFYkon/Qks0VfeiYnOt3o5eF/CIYA
         hV6Vwr43jccgdUWFvfaJ0yb93nXH54io/4bshg0Gvi+sRlgRh95Ihyibq85tG57BG2VO
         sQkaq1OvRkz4bnDf2j91yeWYvdSaf9qbi5VAqPLOyTX3FyoOzPrOeqOdPRkVFpM0HSe3
         Y2wlZUOfvjqISQ7F4Au4BXcQqdtMGXFWdmyz2NuMw4xOm+W+gmBn4f1oxjFpN8FWDhXS
         f/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769441041; x=1770045841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HVH9oGSpX5jUdwWU33mBT6LQXhPx1sCFss1jpjrYy1U=;
        b=dmgIokxd4goTzE6qlL36ZfmV29do3fZtEFYkfXDfOLZeOo3nVWcMi05nFObbuwDCmB
         M3zcc86o+PnOG8jyK+HfommLUNuwnLcI2C+YlR3m1mXiPWZs0PIrCTbVoUa0C1/gD5J4
         VkO9x/viHXaRJj9z4cTmYPDRchCDKQWT9IoKeb2uRNHQIXs+YQeVRUVkoWu33SdHdf6G
         7XVN7IDrH3tKf6nqG0NYSs/9LaJ9w6U1dePqwkWrnMD4eKVRon/VTBxgIIomPO0fcRF7
         g4C72aH/Nhg8ijGfGiR2e6Uz307rJ0tjXEzgpAi5yKBtK6nwIPr+QKQx6LhSNxQqPTi3
         WchQ==
X-Gm-Message-State: AOJu0YwMNM21dk6oHlQdnola8pV7PWltmCe/LQV46WYhqlBRj4XO8Hop
	F/l/tQo36lKzWF/XDlZWmoWbe3b2MdTEf85sZmUy3cteqBhCrSCAfCUR2/CpjhnwwIw=
X-Gm-Gg: AZuq6aJ6utyxLbVYka7R25Qf0Rf6c3d2GdzCsYSX7OLyl9Z4t8k0NCTcR1+jyIDKTze
	WKlcytvbKKHtNBTJExxoIPq7frTxP2AUFW9XMRB2aGRHasFabUTPgnOr4tWQBntu7M68495i5Ps
	Pr+FdhofNwYLJ4LPaV1ylx+EqN6FV8efTaLNZmsNfDvDdKMVRwr+Nu2kKkBovAVi2mzAzmGlm6+
	U4GJm/mSyeZibVbwwIGfcJP02XYTBYKeg+/ozBdfKQH7t3JD0pQh4BHO/YIif9qseotE5hKLoys
	ccYyzzxIDgizVeh3+IsrI7dI0N5xi8kzAeYk7Iu6ECrogSZ+IUdR3EpQH+edrJ4NbLBIMEoi6tB
	GdjV/7tSZBDvAh1cvnzTt7SUZymQZ4mEZkuahB4iQhL2nHHt/lcQQJFTUNfwNRJu5oZfOGp676s
	RbRildnM5XD3wciduNApc5pYCGTwmhgDoRZM93zCS0UGcHSgZ5Ip0FuuUP4QQR7OMfM2Pb+Qbxt
	2zqzr7siIa2D7U=
X-Received: by 2002:ac8:5981:0:b0:501:4e06:695c with SMTP id d75a77b69052e-50314c68d29mr63219561cf.59.1769441038497;
        Mon, 26 Jan 2026 07:23:58 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6e3870c48sm1044157185a.51.2026.01.26.07.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 07:23:57 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 02/07] linux-yocto/6.12: update CVE exclusions (6.12.65)
Date: Mon, 26 Jan 2026 10:23:48 -0500
Message-ID: <20260126152353.2328046-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126152353.2328046-1-bruce.ashfield@gmail.com>
References: <20260126152353.2328046-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 15:24:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230015

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 10 changes (7 new | 3 updated): - 7 new CVEs: CVE-2025-61937, CVE-2025-61943, CVE-2025-64691, CVE-2025-64729, CVE-2025-64769, CVE-2025-65117, CVE-2025-65118 - 3 updated CVEs: CVE-2025-7195, CVE-2025-9903, CVE-2025-9904
        Date: Fri, 16 Jan 2026 00:42:12 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.12.inc              | 284 +++++++++++++++++-
 1 file changed, 280 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index c08b091825..6ab3bd2bb3 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2026-01-12 18:49:23.230016+00:00 for kernel version 6.12.64
-# From linux_kernel_cves cve_2026-01-12_1800Z-2-g66e4b29f774
+# Generated at 2026-01-16 00:43:33.551663+00:00 for kernel version 6.12.65
+# From linux_kernel_cves 2026-01-16_baseline-1-gc984786b0cf
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.12.64"
+    this_version = "6.12.65"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -16104,7 +16104,7 @@ CVE_STATUS[CVE-2025-22107] = "cpe-stable-backport: Backported in 6.12.59"
 
 CVE_STATUS[CVE-2025-22110] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2025-22111 may need backporting (fixed from 6.12.65)
+CVE_STATUS[CVE-2025-22111] = "cpe-stable-backport: Backported in 6.12.65"
 
 CVE_STATUS[CVE-2025-22112] = "cpe-stable-backport: Backported in 6.12.35"
 
@@ -20024,3 +20024,279 @@ CVE_STATUS[CVE-2025-68765] = "cpe-stable-backport: Backported in 6.12.63"
 
 CVE_STATUS[CVE-2025-68766] = "cpe-stable-backport: Backported in 6.12.63"
 
+CVE_STATUS[CVE-2025-68767] = "cpe-stable-backport: Backported in 6.12.64"
+
+# CVE-2025-68768 needs backporting (fixed from 6.19rc2)
+
+CVE_STATUS[CVE-2025-68769] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68770] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68771] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68772] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68773] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68774] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68775] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68776] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68777] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68778] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68779] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2025-68780] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68781] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68782] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68783] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68784] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68785] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68786] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68787] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68788] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68789] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68790] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2025-68791] = "fixed-version: only affects 6.14 onwards"
+
+# CVE-2025-68792 needs backporting (fixed from 6.19rc1)
+
+CVE_STATUS[CVE-2025-68793] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2025-68794] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68795] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68796] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68797] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68798] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68799] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68800] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68801] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68802] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68803] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68804] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68805] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-68806] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68807] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-68808] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68809] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68810] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68811] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68812] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-68813] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68814] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68815] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68816] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68817] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68818] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68819] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68820] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68821] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68822] = "cpe-stable-backport: Backported in 6.12.64"
+
+# CVE-2025-68823 needs backporting (fixed from 6.19rc2)
+
+CVE_STATUS[CVE-2025-71064] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71065] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71066] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71067] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71068] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71069] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71070] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-71071] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71072] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71073] = "cpe-stable-backport: Backported in 6.12.64"
+
+# CVE-2025-71074 needs backporting (fixed from 6.19rc1)
+
+CVE_STATUS[CVE-2025-71075] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71076] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71077] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71078] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71079] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71080] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71081] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71082] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71083] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71084] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71085] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71086] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71087] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71088] = "cpe-stable-backport: Backported in 6.12.65"
+
+CVE_STATUS[CVE-2025-71089] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71090] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2025-71091] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71092] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2025-71093] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71094] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71095] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71096] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71097] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71098] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71099] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71100] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71101] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71102] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71103] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2025-71104] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71105] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71106] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2025-71107] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71108] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71109] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71110] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2025-71111] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71112] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71113] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71114] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71115] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-71116] = "cpe-stable-backport: Backported in 6.12.64"
+
+# CVE-2025-71117 needs backporting (fixed from 6.19rc1)
+
+CVE_STATUS[CVE-2025-71118] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71119] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71120] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71121] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71122] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71123] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71124] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-71125] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71126] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71127] = "cpe-stable-backport: Backported in 6.12.65"
+
+CVE_STATUS[CVE-2025-71128] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-71129] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71130] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71131] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71132] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71133] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71134] = "cpe-stable-backport: Backported in 6.12.65"
+
+CVE_STATUS[CVE-2025-71135] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71136] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71137] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71138] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71139] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2025-71140] = "cpe-stable-backport: Backported in 6.12.64"
+
+# CVE-2025-71141 needs backporting (fixed from 6.19rc1)
+
+CVE_STATUS[CVE-2025-71142] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-71143] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71144] = "cpe-stable-backport: Backported in 6.12.65"
+
-- 
2.43.0


