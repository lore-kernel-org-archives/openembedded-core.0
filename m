Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F23FC0375
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:45:53 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.776.1776959147246110163
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 08:45:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VgtH4k6T;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-50e5bea4045so39825721cf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 08:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776959146; x=1777563946; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2LxvkUaZGtggofX362DcE9Jv2M4/akaIkAA5ywVN73A=;
        b=VgtH4k6TECRaK5AYZWRYhU/jhT+H2MM9Kso/YUEjXhnj8K/wjisMzDzxpab0CWfJe3
         uxNM5fcsG8WLDXkh5qzdEagwPudPLOnWuhEiT0yyey+Ko9163XxuqPI2K1z8ZjUdpAWK
         2be1/i1l8piM8xMXAJ9ehTrN0IJ6q+Z8k5PywgGOxWVPvuG5Wypf2xIhPMpVFsQ4AY2q
         9/PoChInsFYSIIuicS5fOVVZO9iyj/V+DywP9P0uJGxzZpWQo3mMaFWnuW1IDgpiHZrR
         tGZQyNKYyPSTmSkESI9dnv9L2D20/iNs86YNdmj7vvndyI55d+nx5oQxo0Ja4h3PgRSH
         OKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776959146; x=1777563946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2LxvkUaZGtggofX362DcE9Jv2M4/akaIkAA5ywVN73A=;
        b=hPxo8weMtwud/z0VTrYCCY1CROYFo6WhrKe4B2nvMz12SPp3TX+K4bEG4IXM7Jx+ek
         bO3VtFj7sqNP7+ny99i2T3cORMKppD1l0CM8HO/tg2Zms6RUO9tdNNKSZB1cpU4qVe1q
         bbMvhOppVkUjR9BVOan4AZ5MrJodZ81j3u+gEZQF9kSJFrhjomQq18MTu24h0aruHV+2
         T0cI69SSfhIeOn9oMTR+Wxr/LW16GIXL+BNczMsPlgz20F8a4rrIns6hdraKTotNPJTC
         b5nEyR8CLW4JX0+MOxuA/iOQ8NMIyp9blM5qmWs2IZYpl1myto4/8nG6BetzQzwMKx5x
         4sRw==
X-Gm-Message-State: AOJu0YziSAE+D97mJMuMqB3IQ4iBKxKvpsL3VsGu2aG/bjXBu5muOGWp
	QP9j9X0RXaBSwfY+/BCnxyCO0qqkt5gZJ4r44yeMlJjEvFIpeFyycf0F5VHO1ybY
X-Gm-Gg: AeBDietuyLDRmgsbyX1jtWqdqVL5BeMuYlE9w3fLpjCpxwkdyetJalWJXak2bentQRh
	JJG7F4k1ywiCU3sCfSMQ3Ur+VEP8HiHGdkdIwnw6wfbBGuVV3HOsgLoSng8yhQoKlzcIAWBF6Kr
	Smb0T5B4sTPK39XKOs9BA8LwChBmT66zI2/pmK2YpWPx37WrtDkRPNkWu/lu+TDlsGmw14TWA4A
	oHwU3lc2/lpchZcH7VV4atf1cPRQBSn0GJY7iAT7DFPMfBbGJNfakPZ7hcXFop85h1mZXBx4Dlz
	W7OI5N15B1S794WzLwlkG7tc33tj2cnfwRrIDYvx2rZQdXSxIMIuXzzGPw8/psdThQjQ8Szl/m5
	ZM/vGOFOifazdCxwHKpXujcNTbXUG8UAOjwsLuGLpLodNN3CVOP85m1SUC/Ke8/H+CUIBonTurR
	xUXNsCVl4CP/wnQwfZZNlVnvzY2wKV9PGhYMz6KoaaJRPFXHjdR5HLgIZ7lhAGcyUzUia0Sr76R
	JS7SKtgGhqswl84Ygq135O5JJ4X7AU/yUVt9I6zsrAW1AglJwhOsFAJm+7yhGng+Rf/gg==
X-Received: by 2002:a05:622a:6794:b0:50e:42ec:ca7f with SMTP id d75a77b69052e-50e42eccf9cmr239989431cf.18.1776959132230;
        Thu, 23 Apr 2026 08:45:32 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50fb416b3f5sm74400031cf.28.2026.04.23.08.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:45:31 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
Subject: [openembedded-core][whinlatter][PATCH 14/18] linux-yocto/6.12: update CVE exclusions (6.12.80)
Date: Thu, 23 Apr 2026 11:45:05 -0400
Message-ID: <20260423154509.1933646-15-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423154509.1933646-1-bruce.ashfield@gmail.com>
References: <20260423154509.1933646-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 15:45:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235818

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 49 changes (12 new | 37 updated): - 12 new CVEs: CVE-2026-39389, CVE-2026-39390, CVE-2026-39391, CVE-2026-39392, CVE-2026-39393, CVE-2026-39394, CVE-2026-39406, CVE-2026-39407, CVE-2026-39408, CVE-2026-39409, CVE-2026-39410, CVE-2026-39865 - 37 updated CVEs: CVE-2021-4473, CVE-2025-57854, CVE-2025-58713, CVE-2026-1342, CVE-2026-28264, CVE-2026-31790, CVE-2026-32712, CVE-2026-34765, CVE-2026-35023, CVE-2026-35035, CVE-2026-35463, CVE-2026-35484, CVE-2026-35488, CVE-2026-35533, CVE-2026-39319, CVE-2026-39332, CVE-2026-39356, CVE-2026-39369, CVE-2026-39374, CVE-2026-39688, CVE-2026-39690, CVE-2026-39692, CVE-2026-39694, CVE-2026-39696, CVE-2026-3243, CVE-2026-3296, CVE-2026-3480, CVE-2026-3600, CVE-2026-4065, CVE-2026-4111, CVE-2026-4300, CVE-2026-4330, CVE-2026-4785, CVE-2026-4788, CVE-2026-4808, CVE-2026-4931, CVE-2026-5300
        Date: Wed, 8 Apr 2026 14:50:02 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.12.inc              | 236 ++++++++++++++++--
 1 file changed, 216 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index bba789c9e5..e4e81ee492 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2026-03-27 19:55:47.691205+00:00 for kernel version 6.12.79
-# From linux_kernel_cves cve_2026-03-27_1900Z-2-gb6d5823e23a
+# Generated at 2026-04-08 14:59:27.074934+00:00 for kernel version 6.12.80
+# From linux_kernel_cves cve_2026-04-08_1400Z
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.12.79"
+    this_version = "6.12.80"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -16110,9 +16110,9 @@ CVE_STATUS[CVE-2025-22114] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2025-22115] = "cpe-stable-backport: Backported in 6.12.40"
 
-# CVE-2025-22116 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-22116] = "cpe-stable-backport: Backported in 6.12.80"
 
-# CVE-2025-22117 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-22117] = "cpe-stable-backport: Backported in 6.12.80"
 
 CVE_STATUS[CVE-2025-22118] = "fixed-version: only affects 6.13 onwards"
 
@@ -19248,7 +19248,7 @@ CVE_STATUS[CVE-2025-40216] = "cpe-stable-backport: Backported in 6.12.36"
 
 CVE_STATUS[CVE-2025-40218] = "cpe-stable-backport: Backported in 6.12.54"
 
-CVE_STATUS[CVE-2025-40219] = "cpe-stable-backport: Backported in 6.12.54"
+CVE_STATUS[CVE-2025-40219] = "cpe-stable-backport: Backported in 6.12.75"
 
 CVE_STATUS[CVE-2025-40220] = "cpe-stable-backport: Backported in 6.12.54"
 
@@ -19554,7 +19554,7 @@ CVE_STATUS[CVE-2025-68173] = "cpe-stable-backport: Backported in 6.12.58"
 
 # CVE-2025-68174 needs backporting (fixed from 6.18)
 
-# CVE-2025-68175 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-68175] = "cpe-stable-backport: Backported in 6.12.80"
 
 CVE_STATUS[CVE-2025-68176] = "cpe-stable-backport: Backported in 6.12.58"
 
@@ -19958,7 +19958,7 @@ CVE_STATUS[CVE-2025-68734] = "cpe-stable-backport: Backported in 6.12.59"
 
 # CVE-2025-68735 needs backporting (fixed from 6.19)
 
-# CVE-2025-68736 needs backporting (fixed from 6.19)
+CVE_STATUS[CVE-2025-68736] = "cpe-stable-backport: Backported in 6.12.80"
 
 CVE_STATUS[CVE-2025-68737] = "fixed-version: only affects 6.18 onwards"
 
@@ -20108,8 +20108,6 @@ CVE_STATUS[CVE-2025-68810] = "cpe-stable-backport: Backported in 6.12.64"
 
 CVE_STATUS[CVE-2025-68811] = "cpe-stable-backport: Backported in 6.12.64"
 
-CVE_STATUS[CVE-2025-68812] = "fixed-version: only affects 6.15 onwards"
-
 CVE_STATUS[CVE-2025-68813] = "cpe-stable-backport: Backported in 6.12.64"
 
 CVE_STATUS[CVE-2025-68814] = "cpe-stable-backport: Backported in 6.12.64"
@@ -20440,7 +20438,7 @@ CVE_STATUS[CVE-2026-22979] = "cpe-stable-backport: Backported in 6.12.66"
 
 CVE_STATUS[CVE-2026-22980] = "cpe-stable-backport: Backported in 6.12.66"
 
-# CVE-2026-22981 needs backporting (fixed from 6.19)
+CVE_STATUS[CVE-2026-22981] = "cpe-stable-backport: Backported in 6.12.80"
 
 CVE_STATUS[CVE-2026-22982] = "cpe-stable-backport: Backported in 6.12.66"
 
@@ -20448,7 +20446,7 @@ CVE_STATUS[CVE-2026-22983] = "fixed-version: only affects 6.18.4 onwards"
 
 CVE_STATUS[CVE-2026-22984] = "cpe-stable-backport: Backported in 6.12.66"
 
-# CVE-2026-22985 needs backporting (fixed from 6.19)
+CVE_STATUS[CVE-2026-22985] = "cpe-stable-backport: Backported in 6.12.80"
 
 # CVE-2026-22986 needs backporting (fixed from 6.19)
 
@@ -20464,7 +20462,7 @@ CVE_STATUS[CVE-2026-22991] = "cpe-stable-backport: Backported in 6.12.66"
 
 CVE_STATUS[CVE-2026-22992] = "cpe-stable-backport: Backported in 6.12.66"
 
-# CVE-2026-22993 needs backporting (fixed from 6.19)
+CVE_STATUS[CVE-2026-22993] = "cpe-stable-backport: Backported in 6.12.80"
 
 CVE_STATUS[CVE-2026-22994] = "cpe-stable-backport: Backported in 6.12.66"
 
@@ -20892,13 +20890,13 @@ CVE_STATUS[CVE-2026-23205] = "cpe-stable-backport: Backported in 6.12.70"
 
 CVE_STATUS[CVE-2026-23206] = "cpe-stable-backport: Backported in 6.12.70"
 
-CVE_STATUS[CVE-2026-23207] = "fixed-version: only affects 6.18.2 onwards"
+CVE_STATUS[CVE-2026-23207] = "cpe-stable-backport: Backported in 6.12.80"
 
 # CVE-2026-23208 needs backporting (fixed from 6.19)
 
 CVE_STATUS[CVE-2026-23209] = "cpe-stable-backport: Backported in 6.12.70"
 
-# CVE-2026-23210 needs backporting (fixed from 6.19)
+CVE_STATUS[CVE-2026-23210] = "cpe-stable-backport: Backported in 6.12.80"
 
 CVE_STATUS[CVE-2026-23211] = "fixed-version: only affects 6.18 onwards"
 
@@ -20988,7 +20986,7 @@ CVE_STATUS[CVE-2026-23253] = "cpe-stable-backport: Backported in 6.12.77"
 
 CVE_STATUS[CVE-2026-23254] = "cpe-stable-backport: Backported in 6.12.70"
 
-# CVE-2026-23255 needs backporting (fixed from 6.19)
+CVE_STATUS[CVE-2026-23255] = "cpe-stable-backport: Backported in 6.12.80"
 
 CVE_STATUS[CVE-2026-23256] = "cpe-stable-backport: Backported in 6.12.70"
 
@@ -21118,8 +21116,6 @@ CVE_STATUS[CVE-2026-23318] = "cpe-stable-backport: Backported in 6.12.77"
 
 CVE_STATUS[CVE-2026-23319] = "cpe-stable-backport: Backported in 6.12.77"
 
-# CVE-2026-23320 needs backporting (fixed from 7.0rc1)
-
 CVE_STATUS[CVE-2026-23321] = "cpe-stable-backport: Backported in 6.12.78"
 
 CVE_STATUS[CVE-2026-23322] = "fixed-version: only affects 6.18 onwards"
@@ -21144,7 +21140,7 @@ CVE_STATUS[CVE-2026-23331] = "fixed-version: only affects 6.13 onwards"
 
 CVE_STATUS[CVE-2026-23332] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-23333 has no known resolution
+# CVE-2026-23333 needs backporting (fixed from 7.0rc1)
 
 CVE_STATUS[CVE-2026-23334] = "cpe-stable-backport: Backported in 6.12.77"
 
@@ -21276,5 +21272,205 @@ CVE_STATUS[CVE-2026-23397] = "cpe-stable-backport: Backported in 6.12.78"
 
 CVE_STATUS[CVE-2026-23398] = "cpe-stable-backport: Backported in 6.12.78"
 
-# CVE-2026-31788 has no known resolution
+CVE_STATUS[CVE-2026-23399] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23400] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-23401] = "cpe-stable-backport: Backported in 6.12.80"
+
+CVE_STATUS[CVE-2026-23402] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-23403] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23404] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23405] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23406] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23407] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23408] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23409] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23410] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23411] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23412] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23413] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23414] = "cpe-stable-backport: Backported in 6.12.80"
+
+CVE_STATUS[CVE-2026-23415] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-23416] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-23417] = "cpe-stable-backport: Backported in 6.12.80"
+
+CVE_STATUS[CVE-2026-23418] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-23419] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23420] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23421] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-23422] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23423] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-23424] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-23425] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-23426] = "cpe-stable-backport: Backported in 6.12.77"
+
+CVE_STATUS[CVE-2026-23427] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23428] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23429] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-23430] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-23431] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-23432] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-23433] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-23434] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23435] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-23436] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-23437] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-23438] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23439] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23440] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23441] = "cpe-stable-backport: Backported in 6.12.78"
+
+# CVE-2026-23442 needs backporting (fixed from 7.0rc5)
+
+CVE_STATUS[CVE-2026-23443] = "cpe-stable-backport: Backported in 6.12.78"
+
+# CVE-2026-23444 needs backporting (fixed from 7.0rc5)
+
+CVE_STATUS[CVE-2026-23445] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23446] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23447] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23448] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23449] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23450] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23451] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-23452] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23453] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-23454] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23455] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23456] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23457] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23458] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23459] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-23460] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23461] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23462] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23463] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23464] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23465] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23466] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23467] = "fixed-version: only affects 6.16 onwards"
+
+# CVE-2026-23468 needs backporting (fixed from 7.0rc5)
+
+# CVE-2026-23469 needs backporting (fixed from 7.0rc5)
+
+CVE_STATUS[CVE-2026-23470] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23471] = "cpe-stable-backport: Backported in 6.12.78"
+
+# CVE-2026-23472 needs backporting (fixed from 7.0rc5)
+
+# CVE-2026-23473 needs backporting (fixed from 7.0rc5)
+
+CVE_STATUS[CVE-2026-23474] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-23475] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-31389] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-31390] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-31391] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-31392] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-31393] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-31394] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-31395] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-31396] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-31397] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-31398] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-31399] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-31400] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-31401] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-31402] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-31403] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-31404] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-31405] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-31406] = "cpe-stable-backport: Backported in 6.12.80"
+
+# CVE-2026-31407 needs backporting (fixed from 7.0rc5)
+
+CVE_STATUS[CVE-2026-31408] = "cpe-stable-backport: Backported in 6.12.80"
+
+CVE_STATUS[CVE-2026-31409] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-31410] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-31411] = "cpe-stable-backport: Backported in 6.12.75"
+
+CVE_STATUS[CVE-2026-31788] = "cpe-stable-backport: Backported in 6.12.78"
 
-- 
2.43.0


