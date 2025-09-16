Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF8EACAC598
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 15:51:36 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.2139.1758037886952036616
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 08:51:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UGDDSXXr;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-782ba4488b8so26172156d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 08:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758037886; x=1758642686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tE+Z2uOveLKwo8QgaaliDJfk3j4gHTiLLJI/9lkrzos=;
        b=UGDDSXXrzurDezvUcmtRkcnpgXkv3SD4c5xRL1Icx6jOWL8vhcnuJgdHiHI2w47+FW
         z612wv7wRCXMdPFXftr0AdC1Twz2gIAmdXANGxo83/BLlt/W8fOXmxcICHPZzi/YjrLG
         UboAaVkLuBZ6x9WLO80L2VxLahah2CIdKHaDVZ1kANWqCVygfeyD1JskhYiJN0DqWaGA
         vvzMAP3Xg1eDbd6Mqz3ZWk7xF1DRLsty2o18T9EqnWPioVVcBWXSbT0PFD4ZFcurwpn7
         WeD+VcHhndTT7Qqj6lVN5th0VG2wAIK5vGy7R0WyuUtfXTZoOxf+3FUXydR+tEvqBW+V
         JzMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758037886; x=1758642686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tE+Z2uOveLKwo8QgaaliDJfk3j4gHTiLLJI/9lkrzos=;
        b=JHMlCWlqjgcqn2z6SUzDTDFBLEtNt1/xAHAwR3FdeVDE96tRdhkQMc/B+vuxc889X4
         r98GAaNW1B4q9wBK+tSZSr/17kTXUarx7OaNOjZnrDa2TtEZ+3Eo2MG+qL9DjaRbTnTG
         ZNzGuXX2UrPb80MNueiWlm/ibci0fXPfGVPVm3P6+C48OWNqgeRbHBoQo+LAmx0zANQ9
         mOC292ivoPzvuNzF/+ptEB9gPBaRzdw9RDyRAlUIeUD2DvP4KxNkPEK0M7FKua89/78/
         zx30RzXohGAs3GmREEjp1UHjAaVDEr6AvJpuMzPkYzn6xOp2QgFwwu/H7wKEH0pg7vwc
         GvHg==
X-Gm-Message-State: AOJu0YxCjF8okcf1UzpexE4w/p55CQrDi7gD+P6WSTu7JT9wwAX9eX2M
	l8eP7iNmw6RmAF0ot32CwADu811dkyML9xmpcBk5q3D8cznagNEr/GUlMv3vtB7/
X-Gm-Gg: ASbGnctLMb3uHcfnWwrlnZiyALic96Sr4kHya3wzmpWxdT8i48rElOu5NE1DXbsVO5x
	5S0ZI2hZRscE7auMGvwOfzF3eBXSTbL6Xh2s1paDosc//Y0xJuptnPiOzc8O8QrzoULVT8xkDP3
	6q3CTkR9oHLPHmH8pSf6Y4of+7XP++CxnrKFINZW1sLfm2Sz5Dgu6wAtZb0tr+bnGEDIfZeVKWE
	d8F7/Z9ZA7+hx5N81z9aydwSdcBwQ1aiWoW2BqiD3A+vduPJIfeHs7whD2AO5I0f5W+SD2Kr1a/
	pthR0zE3NswLWTd0Ek5dlAASU6M9eRcq/HyvijXCZTDVq0VNIHamyZgkiPT8FE4fN2zKZuHQSCq
	eRgWmricvojzMOaPCKXKPGlHwB2M3UazM2uVA2BYLNA47j8+RH0yNIfA2WUZdhSlqWeEDDVkUzU
	PLtWUOWUHFjr8n3rHgzvyjU7rpSgJXgqGqHSNz7pKIZQE1SZwl73fwRjE=
X-Google-Smtp-Source: AGHT+IGwg+g8YLnPFqWRNa2LXPuWKs34nd3tuuPCB4xQhw7n2vhyToRPsPGzEDWTZvUjIkkucmtAVw==
X-Received: by 2002:a05:6214:5192:b0:728:854:6c5d with SMTP id 6a1803df08f44-767c1f720camr199316046d6.40.1758037885409;
        Tue, 16 Sep 2025 08:51:25 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-786c9c68cd2sm33724456d6.7.2025.09.16.08.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 08:51:24 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] linux-yocto/6.12: update CVE exclusions (6.12.47)
Date: Tue, 16 Sep 2025 11:51:19 -0400
Message-Id: <20250916155119.1583243-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250916155119.1583243-1-bruce.ashfield@gmail.com>
References: <20250916155119.1583243-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 15:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223567

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 1 changes (1 new | 0 updated): - 1 new CVEs: CVE-2025-10421 - 0 updated CVEs:
        Date: Mon, 15 Sep 2025 02:20:02 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.12.inc              | 396 +++++++++++++++++-
 1 file changed, 377 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index 57b735ed34..a33f7d5403 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-09-03 20:06:37.780942+00:00 for kernel version 6.12.44
-# From linux_kernel_cves cve_2025-09-03_1900Z-6-ga45e93ffde5
+# Generated at 2025-09-15 02:51:11.905579+00:00 for kernel version 6.12.47
+# From linux_kernel_cves cve_2025-09-15_0200Z
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.12.44"
+    this_version = "6.12.47"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -5848,8 +5848,6 @@ CVE_STATUS[CVE-2023-53135] = "fixed-version: Fixed from version 6.3"
 
 CVE_STATUS[CVE-2023-53136] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53137] = "fixed-version: Fixed from version 6.3"
-
 CVE_STATUS[CVE-2023-53138] = "fixed-version: Fixed from version 6.3"
 
 CVE_STATUS[CVE-2023-53139] = "fixed-version: Fixed from version 6.3"
@@ -12932,7 +12930,7 @@ CVE_STATUS[CVE-2025-22101] = "cpe-stable-backport: Backported in 6.12.36"
 
 CVE_STATUS[CVE-2025-22102] = "cpe-stable-backport: Backported in 6.12.30"
 
-# CVE-2025-22103 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-22103] = "cpe-stable-backport: Backported in 6.12.46"
 
 # CVE-2025-22104 needs backporting (fixed from 6.15)
 
@@ -12952,7 +12950,7 @@ CVE_STATUS[CVE-2025-22110] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2025-22112] = "cpe-stable-backport: Backported in 6.12.35"
 
-# CVE-2025-22113 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-22113] = "cpe-stable-backport: Backported in 6.12.46"
 
 CVE_STATUS[CVE-2025-22114] = "fixed-version: only affects 6.14 onwards"
 
@@ -12974,9 +12972,9 @@ CVE_STATUS[CVE-2025-22122] = "cpe-stable-backport: Backported in 6.12.33"
 
 CVE_STATUS[CVE-2025-22123] = "cpe-stable-backport: Backported in 6.12.33"
 
-# CVE-2025-22124 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-22124] = "cpe-stable-backport: Backported in 6.12.46"
 
-# CVE-2025-22125 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-22125] = "cpe-stable-backport: Backported in 6.12.46"
 
 CVE_STATUS[CVE-2025-22126] = "cpe-stable-backport: Backported in 6.12.25"
 
@@ -12992,7 +12990,7 @@ CVE_STATUS[CVE-2025-22128] = "cpe-stable-backport: Backported in 6.12.35"
 
 # CVE-2025-23132 needs backporting (fixed from 6.15)
 
-# CVE-2025-23133 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-23133] = "cpe-stable-backport: Backported in 6.12.46"
 
 CVE_STATUS[CVE-2025-23134] = "cpe-stable-backport: Backported in 6.12.23"
 
@@ -14094,7 +14092,7 @@ CVE_STATUS[CVE-2025-38270] = "cpe-stable-backport: Backported in 6.12.34"
 
 CVE_STATUS[CVE-2025-38271] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2025-38272 needs backporting (fixed from 6.16)
+CVE_STATUS[CVE-2025-38272] = "cpe-stable-backport: Backported in 6.12.46"
 
 CVE_STATUS[CVE-2025-38273] = "cpe-stable-backport: Backported in 6.12.34"
 
@@ -14162,7 +14160,7 @@ CVE_STATUS[CVE-2025-38304] = "cpe-stable-backport: Backported in 6.12.34"
 
 CVE_STATUS[CVE-2025-38305] = "cpe-stable-backport: Backported in 6.12.34"
 
-# CVE-2025-38306 needs backporting (fixed from 6.16)
+CVE_STATUS[CVE-2025-38306] = "cpe-stable-backport: Backported in 6.12.46"
 
 CVE_STATUS[CVE-2025-38307] = "cpe-stable-backport: Backported in 6.12.34"
 
@@ -14456,7 +14454,7 @@ CVE_STATUS[CVE-2025-38451] = "cpe-stable-backport: Backported in 6.12.39"
 
 CVE_STATUS[CVE-2025-38452] = "cpe-stable-backport: Backported in 6.12.39"
 
-# CVE-2025-38453 needs backporting (fixed from 6.16)
+CVE_STATUS[CVE-2025-38453] = "cpe-stable-backport: Backported in 6.12.46"
 
 CVE_STATUS[CVE-2025-38454] = "cpe-stable-backport: Backported in 6.12.39"
 
@@ -14554,7 +14552,7 @@ CVE_STATUS[CVE-2025-38500] = "cpe-stable-backport: Backported in 6.12.41"
 
 CVE_STATUS[CVE-2025-38501] = "cpe-stable-backport: Backported in 6.12.42"
 
-# CVE-2025-38502 needs backporting (fixed from 6.17rc1)
+CVE_STATUS[CVE-2025-38502] = "cpe-stable-backport: Backported in 6.12.46"
 
 CVE_STATUS[CVE-2025-38503] = "cpe-stable-backport: Backported in 6.12.39"
 
@@ -14662,7 +14660,7 @@ CVE_STATUS[CVE-2025-38554] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2025-38555] = "cpe-stable-backport: Backported in 6.12.42"
 
-# CVE-2025-38556 needs backporting (fixed from 6.17rc1)
+CVE_STATUS[CVE-2025-38556] = "cpe-stable-backport: Backported in 6.12.46"
 
 CVE_STATUS[CVE-2025-38557] = "cpe-stable-backport: Backported in 6.12.42"
 
@@ -14756,8 +14754,6 @@ CVE_STATUS[CVE-2025-38601] = "cpe-stable-backport: Backported in 6.12.42"
 
 CVE_STATUS[CVE-2025-38602] = "cpe-stable-backport: Backported in 6.12.42"
 
-CVE_STATUS[CVE-2025-38603] = "fixed-version: only affects 6.16 onwards"
-
 CVE_STATUS[CVE-2025-38604] = "cpe-stable-backport: Backported in 6.12.42"
 
 # CVE-2025-38605 needs backporting (fixed from 6.17rc1)
@@ -14772,8 +14768,6 @@ CVE_STATUS[CVE-2025-38609] = "cpe-stable-backport: Backported in 6.12.42"
 
 CVE_STATUS[CVE-2025-38610] = "cpe-stable-backport: Backported in 6.12.42"
 
-CVE_STATUS[CVE-2025-38611] = "cpe-stable-backport: Backported in 6.12.42"
-
 CVE_STATUS[CVE-2025-38612] = "cpe-stable-backport: Backported in 6.12.42"
 
 CVE_STATUS[CVE-2025-38613] = "fixed-version: only affects 6.13 onwards"
@@ -14908,16 +14902,378 @@ CVE_STATUS[CVE-2025-38677] = "cpe-stable-backport: Backported in 6.12.44"
 
 # CVE-2025-38678 needs backporting (fixed from 6.17rc2)
 
+CVE_STATUS[CVE-2025-38679] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38680] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38681] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38682] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-38683] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38684] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38685] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38686] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38687] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38688] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38689] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-38690] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-38691] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38692] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38693] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38694] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38695] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38696] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38697] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38698] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38699] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38700] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38701] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38702] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38703] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38704] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38705] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38706] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38707] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38708] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38709] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38710] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38711] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38712] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38713] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38714] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38715] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38716] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38717] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38718] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38719] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-38720] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-38721] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38722] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38723] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38724] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38725] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38726] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38727] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38728] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38729] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38730] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-38731] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38732] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-38733] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-38734] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-38735] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-38736] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-38737] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39673] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39674] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-39675] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39676] = "cpe-stable-backport: Backported in 6.12.44"
+
+# CVE-2025-39677 needs backporting (fixed from 6.17rc3)
+
+# CVE-2025-39678 needs backporting (fixed from 6.17rc3)
+
+CVE_STATUS[CVE-2025-39679] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39680] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-39681] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39682] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39683] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39684] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39685] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39686] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39687] = "cpe-stable-backport: Backported in 6.12.44"
+
 CVE_STATUS[CVE-2025-39688] = "cpe-stable-backport: Backported in 6.12.23"
 
+CVE_STATUS[CVE-2025-39689] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39690] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-39691] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39692] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39693] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39694] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39695] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39696] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-39697] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39698] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39699] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-39700] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39701] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39702] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39703] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39704] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-39705] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39706] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39707] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39708] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-39709] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39710] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39711] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39712] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39713] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39714] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39715] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39716] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39717] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-39718] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39719] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39720] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39721] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39722] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39723] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39724] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39725] = "cpe-stable-backport: Backported in 6.12.41"
+
+CVE_STATUS[CVE-2025-39726] = "cpe-stable-backport: Backported in 6.12.41"
+
+CVE_STATUS[CVE-2025-39727] = "cpe-stable-backport: Backported in 6.12.42"
+
 CVE_STATUS[CVE-2025-39728] = "cpe-stable-backport: Backported in 6.12.23"
 
+CVE_STATUS[CVE-2025-39729] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-39730] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-39731] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-39732] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-39733] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-39734] = "cpe-stable-backport: Backported in 6.12.42"
+
 CVE_STATUS[CVE-2025-39735] = "cpe-stable-backport: Backported in 6.12.23"
 
+CVE_STATUS[CVE-2025-39736] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-39737] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-39738] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-39739] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-39740] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-39741] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-39742] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-39743] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-39744] = "cpe-stable-backport: Backported in 6.12.43"
+
+# CVE-2025-39745 needs backporting (fixed from 6.17rc1)
+
+CVE_STATUS[CVE-2025-39746] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-39747] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-39748] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-39749] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-39750] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-39751] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-39752] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-39753] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-39754] = "cpe-stable-backport: Backported in 6.12.43"
+
 CVE_STATUS[CVE-2025-39755] = "fixed-version: only affects 6.13 onwards"
 
+CVE_STATUS[CVE-2025-39756] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-39757] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-39758] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-39759] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39760] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-39761] = "cpe-stable-backport: Backported in 6.12.43"
+
+# CVE-2025-39762 needs backporting (fixed from 6.17rc1)
+
+CVE_STATUS[CVE-2025-39763] = "cpe-stable-backport: Backported in 6.12.43"
+
+# CVE-2025-39764 needs backporting (fixed from 6.17rc2)
+
+CVE_STATUS[CVE-2025-39765] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39766] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39767] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39768] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-39769] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-39770] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39771] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-39772] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39773] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39774] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-39775] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-39776] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39777] = "fixed-version: only affects 6.16 onwards"
+
 CVE_STATUS[CVE-2025-39778] = "cpe-stable-backport: Backported in 6.12.23"
 
+CVE_STATUS[CVE-2025-39779] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39780] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39781] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39782] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39783] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39784] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-39785] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-39786] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-39787] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39788] = "cpe-stable-backport: Backported in 6.12.44"
+
+# CVE-2025-39789 needs backporting (fixed from 6.17rc1)
+
+CVE_STATUS[CVE-2025-39790] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39791] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-39792] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-39793] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-39794] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-39795] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-39796] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-39797] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-39798] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-39799] = "fixed-version: only affects 6.17rc1 onwards"
+
 CVE_STATUS[CVE-2025-39930] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2025-39989] = "cpe-stable-backport: Backported in 6.12.23"
@@ -14926,6 +15282,8 @@ CVE_STATUS[CVE-2025-39989] = "cpe-stable-backport: Backported in 6.12.23"
 
 CVE_STATUS[CVE-2025-40114] = "cpe-stable-backport: Backported in 6.12.23"
 
+# CVE-2025-40300 has no known resolution
+
 # CVE-2025-40325 needs backporting (fixed from 6.15)
 
 # CVE-2025-40364 has no known resolution
-- 
2.39.2


