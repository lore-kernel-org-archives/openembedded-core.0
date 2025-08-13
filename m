Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A0D5C87FCF
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 20:49:43 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.7054.1755118177178787913
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 13:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=azcgOSJw;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4b109be3726so4113701cf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 13:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755118176; x=1755722976; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CXdsttJ/twlqWCGwut8FLDNoYHTs7/YwJ2TAIQP/dCU=;
        b=azcgOSJwehPPLRRGLzP71/QmHVh1mFBf/2pkWCb5hYONhviCi0AaDKxOFZ6BeOMTt5
         vMdLWMC4I4QfgSbdx+r9AMUUkiM2+2HCN3sYzNnA5955incTJMbe6JLaspCzmGHBj4cT
         TQ/Vws7U0Co/OVYeQ9eFWGq/IEJQqlqm2zukTJGRkcf00I95+OxokXYFrAjiaVegVHoF
         jXEFvc7EqB2wQUVh06TmEt7MQyg2nt9og1QIIumGuOkqOf4KwgxgXabMSpRjeFeCfTkI
         9GYCBUZsodxyK6kJNOHPg2EOVX10hO5RLdHAHXTewQhgsK38uvt1V9EIi++8xXuzCklI
         OX1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755118176; x=1755722976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CXdsttJ/twlqWCGwut8FLDNoYHTs7/YwJ2TAIQP/dCU=;
        b=CtpIbUhfdPKCv+bXdNgW4YfWt4Z3o6Yh+8NAUoBSSWB/1gS2A5lQaMY4KygxPghlgk
         8p6U0q/Q0iE1gk5gqWpdVz17clYUbEddssSxlXWZ21Y4HkW6NcfAQMyF4p9AUDJObP2x
         quDDbViyjdSyk7DeWx3/oBUoBRL0SUER623uExITgDmXOAKhlAWUNPNq/qAe31fk89ot
         8noxS/AmD+GsZIGv8tpWrofUbIEt2Xl4gODd6U4dm3BIS700IzgvxWA49zhSQsq+S4NZ
         bMFIid2Aa2xjOSpcQg8d9o2wzkdT/9qYzqzIQmx6gu2u8UZ+31cn6+oKxvKxiHz3lkh6
         aJNg==
X-Gm-Message-State: AOJu0Yxin3ocyiCSAoTrkMiHkxVQLgLuYRccdCSxC6akn9arhg5WxsbI
	36B2X25Jp2bH6wQhQ3TBihbQSnQOEH4c/PARWAGpbaFge2FQR06meE0mjuHaNGLZ
X-Gm-Gg: ASbGncvPwrIEyVGGpz4/TMfc7VYrAQa8ffr4+Hx1Pemj2IzKtDwYnLIZz6u/1kg6sA0
	4jzwjoSgj+iPCqSu2K0g2vqLLuc3mCvnrT83cce3g5S35ZDxp0RdcOoVLLyy2p2gkXoGWUv2MpU
	IXzUuyHukD/brjN5kDZmB+CYD2fD/Fi+mRW9G+D9Q5SYSoJfqd7D1skkyFdjnMXl2M3RTW+A2iF
	fLX9l9wuYgJR6XNF0XGhv5S9p/rTdmC4C2yqfL+DcXLsnVvY++d9s18LRYXLY1wIUyLjv0qPPAM
	scgE5L8vVqTYL3kbiblw2UsDscq2szxgbSPlaZ1Fj/aOvFkSnrl7oxWqILLCR5VaymllAABH9dM
	fxZoCmYjU9aYVdmXdIMvcURAvyDIAMknTqfUZBGw8pR8M5azlZzA/tOvaanPydVfDRaD0djF1bF
	yxk85aed6NC43vuSSgB51A/p4=
X-Google-Smtp-Source: AGHT+IHN/ZApPt9ALj4xptKTYLDeADRwy71ReZ854anHNBzsYW0nc7iJJmnZJHaMU7KkR8zBxTJ0ew==
X-Received: by 2002:ac8:5ac8:0:b0:4ae:cc75:4703 with SMTP id d75a77b69052e-4b10ab31062mr8376711cf.58.1755118175698;
        Wed, 13 Aug 2025 13:49:35 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70af5b07658sm3326516d6.43.2025.08.13.13.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 13:49:35 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/8] linux-yocto/6.12: update CVE exclusions (6.12.41)
Date: Wed, 13 Aug 2025 16:49:22 -0400
Message-Id: <af844bfb5032a6b8d355ac5591cdda85edb0b7ed.1755118020.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1755118020.git.bruce.ashfield@gmail.com>
References: <cover.1755118020.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 20:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221828

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 3 changes (2 new | 1 updated): - 2 new CVEs: CVE-2025-8707, CVE-2025-8708 - 1 updated CVEs: CVE-2025-2586
        Date: Fri, 8 Aug 2025 02:36:59 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.12.inc              | 346 ++++++++++++++++--
 1 file changed, 317 insertions(+), 29 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index ee2f30b3db..a110f89af1 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-07-25 02:49:32.259439+00:00 for kernel version 6.12.40
-# From linux_kernel_cves cve_2025-07-25_0100Z-1-g854b2f05e2c
+# Generated at 2025-08-08 02:45:44.343204+00:00 for kernel version 6.12.41
+# From linux_kernel_cves cve_2025-08-08_0100Z-2-g05f2a09f419
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.12.40"
+    this_version = "6.12.41"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -13394,7 +13394,7 @@ CVE_STATUS[CVE-2025-37923] = "cpe-stable-backport: Backported in 6.12.28"
 
 CVE_STATUS[CVE-2025-37924] = "cpe-stable-backport: Backported in 6.12.28"
 
-# CVE-2025-37925 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-37925] = "cpe-stable-backport: Backported in 6.12.41"
 
 CVE_STATUS[CVE-2025-37926] = "cpe-stable-backport: Backported in 6.12.28"
 
@@ -13510,7 +13510,7 @@ CVE_STATUS[CVE-2025-37982] = "cpe-stable-backport: Backported in 6.12.25"
 
 CVE_STATUS[CVE-2025-37983] = "cpe-stable-backport: Backported in 6.12.26"
 
-# CVE-2025-37984 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-37984] = "cpe-stable-backport: Backported in 6.12.39"
 
 CVE_STATUS[CVE-2025-37985] = "cpe-stable-backport: Backported in 6.12.26"
 
@@ -13746,7 +13746,7 @@ CVE_STATUS[CVE-2025-38103] = "cpe-stable-backport: Backported in 6.12.34"
 
 CVE_STATUS[CVE-2025-38104] = "cpe-stable-backport: Backported in 6.12.39"
 
-# CVE-2025-38105 needs backporting (fixed from 6.16rc1)
+# CVE-2025-38105 needs backporting (fixed from 6.16)
 
 CVE_STATUS[CVE-2025-38106] = "cpe-stable-backport: Backported in 6.12.34"
 
@@ -13800,7 +13800,7 @@ CVE_STATUS[CVE-2025-38130] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2025-38131] = "cpe-stable-backport: Backported in 6.12.34"
 
-# CVE-2025-38132 needs backporting (fixed from 6.16rc1)
+# CVE-2025-38132 needs backporting (fixed from 6.16)
 
 CVE_STATUS[CVE-2025-38133] = "fixed-version: only affects 6.15 onwards"
 
@@ -13810,13 +13810,13 @@ CVE_STATUS[CVE-2025-38135] = "cpe-stable-backport: Backported in 6.12.34"
 
 CVE_STATUS[CVE-2025-38136] = "cpe-stable-backport: Backported in 6.12.34"
 
-# CVE-2025-38137 needs backporting (fixed from 6.16rc1)
+# CVE-2025-38137 needs backporting (fixed from 6.16)
 
 CVE_STATUS[CVE-2025-38138] = "cpe-stable-backport: Backported in 6.12.34"
 
 CVE_STATUS[CVE-2025-38139] = "cpe-stable-backport: Backported in 6.12.37"
 
-# CVE-2025-38140 needs backporting (fixed from 6.16rc1)
+# CVE-2025-38140 needs backporting (fixed from 6.16)
 
 CVE_STATUS[CVE-2025-38141] = "cpe-stable-backport: Backported in 6.12.34"
 
@@ -13892,8 +13892,6 @@ CVE_STATUS[CVE-2025-38176] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2025-38177] = "cpe-stable-backport: Backported in 6.12.28"
 
-CVE_STATUS[CVE-2025-38178] = "fixed-version: only affects 6.16rc1 onwards"
-
 CVE_STATUS[CVE-2025-38179] = "cpe-stable-backport: Backported in 6.12.35"
 
 CVE_STATUS[CVE-2025-38180] = "cpe-stable-backport: Backported in 6.12.35"
@@ -13910,7 +13908,7 @@ CVE_STATUS[CVE-2025-38185] = "cpe-stable-backport: Backported in 6.12.35"
 
 CVE_STATUS[CVE-2025-38186] = "cpe-stable-backport: Backported in 6.12.35"
 
-# CVE-2025-38187 needs backporting (fixed from 6.16rc3)
+# CVE-2025-38187 needs backporting (fixed from 6.16)
 
 CVE_STATUS[CVE-2025-38188] = "cpe-stable-backport: Backported in 6.12.35"
 
@@ -13934,7 +13932,7 @@ CVE_STATUS[CVE-2025-38197] = "cpe-stable-backport: Backported in 6.12.35"
 
 CVE_STATUS[CVE-2025-38198] = "cpe-stable-backport: Backported in 6.12.35"
 
-# CVE-2025-38199 needs backporting (fixed from 6.16rc1)
+# CVE-2025-38199 needs backporting (fixed from 6.16)
 
 CVE_STATUS[CVE-2025-38200] = "cpe-stable-backport: Backported in 6.12.35"
 
@@ -13942,15 +13940,15 @@ CVE_STATUS[CVE-2025-38201] = "cpe-stable-backport: Backported in 6.12.35"
 
 CVE_STATUS[CVE-2025-38202] = "cpe-stable-backport: Backported in 6.12.35"
 
-# CVE-2025-38203 needs backporting (fixed from 6.16rc1)
+# CVE-2025-38203 needs backporting (fixed from 6.16)
 
-# CVE-2025-38204 needs backporting (fixed from 6.16rc1)
+# CVE-2025-38204 needs backporting (fixed from 6.16)
 
-# CVE-2025-38205 needs backporting (fixed from 6.16rc1)
+# CVE-2025-38205 needs backporting (fixed from 6.16)
 
-# CVE-2025-38206 needs backporting (fixed from 6.16rc1)
+# CVE-2025-38206 needs backporting (fixed from 6.16)
 
-# CVE-2025-38207 needs backporting (fixed from 6.16rc1)
+# CVE-2025-38207 needs backporting (fixed from 6.16)
 
 CVE_STATUS[CVE-2025-38208] = "cpe-stable-backport: Backported in 6.12.35"
 
@@ -14004,13 +14002,13 @@ CVE_STATUS[CVE-2025-38232] = "cpe-stable-backport: Backported in 6.12.35"
 
 CVE_STATUS[CVE-2025-38233] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2025-38234 needs backporting (fixed from 6.16rc1)
+# CVE-2025-38234 needs backporting (fixed from 6.16)
 
 CVE_STATUS[CVE-2025-38235] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2025-38236] = "cpe-stable-backport: Backported in 6.12.36"
 
-# CVE-2025-38237 needs backporting (fixed from 6.16rc1)
+# CVE-2025-38237 needs backporting (fixed from 6.16)
 
 CVE_STATUS[CVE-2025-38238] = "fixed-version: only affects 6.14 onwards"
 
@@ -14032,7 +14030,7 @@ CVE_STATUS[CVE-2025-38246] = "cpe-stable-backport: Backported in 6.12.36"
 
 CVE_STATUS[CVE-2025-38247] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2025-38248 needs backporting (fixed from 6.16rc4)
+# CVE-2025-38248 needs backporting (fixed from 6.16)
 
 CVE_STATUS[CVE-2025-38249] = "cpe-stable-backport: Backported in 6.12.36"
 
@@ -14058,7 +14056,7 @@ CVE_STATUS[CVE-2025-38259] = "cpe-stable-backport: Backported in 6.12.36"
 
 CVE_STATUS[CVE-2025-38260] = "cpe-stable-backport: Backported in 6.12.36"
 
-# CVE-2025-38261 needs backporting (fixed from 6.16rc1)
+# CVE-2025-38261 needs backporting (fixed from 6.16)
 
 CVE_STATUS[CVE-2025-38262] = "cpe-stable-backport: Backported in 6.12.36"
 
@@ -14080,7 +14078,7 @@ CVE_STATUS[CVE-2025-38270] = "cpe-stable-backport: Backported in 6.12.34"
 
 CVE_STATUS[CVE-2025-38271] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2025-38272 needs backporting (fixed from 6.16rc1)
+# CVE-2025-38272 needs backporting (fixed from 6.16)
 
 CVE_STATUS[CVE-2025-38273] = "cpe-stable-backport: Backported in 6.12.34"
 
@@ -14104,7 +14102,7 @@ CVE_STATUS[CVE-2025-38282] = "cpe-stable-backport: Backported in 6.12.34"
 
 CVE_STATUS[CVE-2025-38283] = "cpe-stable-backport: Backported in 6.12.34"
 
-# CVE-2025-38284 needs backporting (fixed from 6.16rc1)
+# CVE-2025-38284 needs backporting (fixed from 6.16)
 
 CVE_STATUS[CVE-2025-38285] = "cpe-stable-backport: Backported in 6.12.34"
 
@@ -14148,7 +14146,7 @@ CVE_STATUS[CVE-2025-38304] = "cpe-stable-backport: Backported in 6.12.34"
 
 CVE_STATUS[CVE-2025-38305] = "cpe-stable-backport: Backported in 6.12.34"
 
-# CVE-2025-38306 needs backporting (fixed from 6.16rc1)
+# CVE-2025-38306 needs backporting (fixed from 6.16)
 
 CVE_STATUS[CVE-2025-38307] = "cpe-stable-backport: Backported in 6.12.34"
 
@@ -14158,7 +14156,7 @@ CVE_STATUS[CVE-2025-38309] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2025-38310] = "cpe-stable-backport: Backported in 6.12.34"
 
-# CVE-2025-38311 needs backporting (fixed from 6.16rc1)
+# CVE-2025-38311 needs backporting (fixed from 6.16)
 
 CVE_STATUS[CVE-2025-38312] = "cpe-stable-backport: Backported in 6.12.34"
 
@@ -14180,7 +14178,7 @@ CVE_STATUS[CVE-2025-38320] = "cpe-stable-backport: Backported in 6.12.35"
 
 CVE_STATUS[CVE-2025-38321] = "cpe-stable-backport: Backported in 6.12.35"
 
-CVE_STATUS[CVE-2025-38322] = "fixed-version: only affects 6.15 onwards"
+# CVE-2025-38322 needs backporting (fixed from 6.16)
 
 CVE_STATUS[CVE-2025-38323] = "cpe-stable-backport: Backported in 6.12.35"
 
@@ -14206,7 +14204,7 @@ CVE_STATUS[CVE-2025-38333] = "cpe-stable-backport: Backported in 6.12.35"
 
 CVE_STATUS[CVE-2025-38334] = "cpe-stable-backport: Backported in 6.12.35"
 
-# CVE-2025-38335 needs backporting (fixed from 6.16rc1)
+CVE_STATUS[CVE-2025-38335] = "cpe-stable-backport: Backported in 6.12.41"
 
 CVE_STATUS[CVE-2025-38336] = "cpe-stable-backport: Backported in 6.12.35"
 
@@ -14238,12 +14236,302 @@ CVE_STATUS[CVE-2025-38349] = "cpe-stable-backport: Backported in 6.12.39"
 
 CVE_STATUS[CVE-2025-38350] = "cpe-stable-backport: Backported in 6.12.37"
 
-# CVE-2025-38351 needs backporting (fixed from 6.16rc6)
+CVE_STATUS[CVE-2025-38351] = "cpe-stable-backport: Backported in 6.12.41"
 
 CVE_STATUS[CVE-2025-38352] = "cpe-stable-backport: Backported in 6.12.34"
 
+CVE_STATUS[CVE-2025-38353] = "cpe-stable-backport: Backported in 6.12.36"
+
+CVE_STATUS[CVE-2025-38354] = "cpe-stable-backport: Backported in 6.12.36"
+
+CVE_STATUS[CVE-2025-38355] = "cpe-stable-backport: Backported in 6.12.36"
+
+CVE_STATUS[CVE-2025-38356] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38357] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38358] = "fixed-version: only affects 6.15 onwards"
+
+# CVE-2025-38359 needs backporting (fixed from 6.16)
+
+CVE_STATUS[CVE-2025-38360] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38361] = "cpe-stable-backport: Backported in 6.12.36"
+
+CVE_STATUS[CVE-2025-38362] = "cpe-stable-backport: Backported in 6.12.36"
+
+CVE_STATUS[CVE-2025-38363] = "cpe-stable-backport: Backported in 6.12.36"
+
+CVE_STATUS[CVE-2025-38364] = "cpe-stable-backport: Backported in 6.12.36"
+
+CVE_STATUS[CVE-2025-38365] = "cpe-stable-backport: Backported in 6.12.36"
+
+CVE_STATUS[CVE-2025-38366] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-38367] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-38368] = "cpe-stable-backport: Backported in 6.12.36"
+
+CVE_STATUS[CVE-2025-38369] = "cpe-stable-backport: Backported in 6.12.36"
+
+CVE_STATUS[CVE-2025-38370] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-38371] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38372] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38373] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38374] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38375] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38376] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38377] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38378] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38379] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38380] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38381] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38382] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38383] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38384] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38385] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38386] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38387] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38388] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38389] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38390] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38391] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38392] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38393] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38394] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38395] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38396] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38397] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38398] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38399] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38400] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38401] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38402] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38403] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38404] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38405] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38406] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38407] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38408] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38409] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38410] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38411] = "fixed-version: only affects 6.15.3 onwards"
+
+CVE_STATUS[CVE-2025-38412] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38413] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38414] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38415] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38416] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38417] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38418] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38419] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38420] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38421] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-38422] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38423] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38424] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38425] = "cpe-stable-backport: Backported in 6.12.35"
+
+# CVE-2025-38426 needs backporting (fixed from 6.16)
+
+CVE_STATUS[CVE-2025-38427] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38428] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38429] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38430] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38431] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-38432] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38433] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38434] = "cpe-stable-backport: Backported in 6.12.36"
+
+CVE_STATUS[CVE-2025-38435] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-38436] = "cpe-stable-backport: Backported in 6.12.36"
+
+CVE_STATUS[CVE-2025-38437] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38438] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38439] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38440] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38441] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38442] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38443] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38444] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38445] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38446] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38447] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38448] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38449] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38450] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38451] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38452] = "cpe-stable-backport: Backported in 6.12.39"
+
+# CVE-2025-38453 needs backporting (fixed from 6.16)
+
+CVE_STATUS[CVE-2025-38454] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38455] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38456] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38457] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38458] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38459] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38460] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38461] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38462] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38463] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38464] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38465] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38466] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38467] = "cpe-stable-backport: Backported in 6.12.39"
+
+CVE_STATUS[CVE-2025-38468] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38469] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38470] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38471] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38472] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38473] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38474] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38475] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38476] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38477] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38478] = "cpe-stable-backport: Backported in 6.12.40"
+
 CVE_STATUS[CVE-2025-38479] = "cpe-stable-backport: Backported in 6.12.23"
 
+CVE_STATUS[CVE-2025-38480] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38481] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38482] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38483] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38484] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38485] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38486] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38487] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38488] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38489] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38490] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38491] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38492] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-38493] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38494] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38495] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38496] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38497] = "cpe-stable-backport: Backported in 6.12.40"
+
+CVE_STATUS[CVE-2025-38498] = "cpe-stable-backport: Backported in 6.12.34"
+
 CVE_STATUS[CVE-2025-38575] = "cpe-stable-backport: Backported in 6.12.23"
 
 CVE_STATUS[CVE-2025-38637] = "cpe-stable-backport: Backported in 6.12.23"
-- 
2.39.2


