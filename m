Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAE8BCAC5AC
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 14:39:13 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.18686.1758638346451448863
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 07:39:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=X/DmfIoJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so5709449b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 07:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758638346; x=1759243146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f5KnF5Ul7wYUQT2zmVBt9sNT1VB9mUXcjrYviF1PQOw=;
        b=X/DmfIoJr9wI6cxWSWwQkTl6ix5UPinE8ikmtHPvXYLpOHhWX7WMG4RsTHX286Bap6
         GqcgDCEAgbcyAOMEJ5mxCioXcxfN5HhC2kDTKceRcBVDibBzY9VVvGF8XcJkO3NmQqFC
         8NrCn2rGcv8Xs8RD5puq6fR2odzEyGfmEB2VUC4Lbe4OJsndr9rVgA6OLDs6U+6DUbHq
         iE3VL9yyzk0XsodqDBfspc9Upfr+aIvoAo0aq2dvoSW8qjK/Io2XzCyT/BocHDkfQ9DW
         c87Xr7ssrrIKwlr3IEhF6rx/V/lFgygZrjTs1WEIhaMKvaKB1qEkQuBRJAYoRVUaFs0V
         QnSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638346; x=1759243146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f5KnF5Ul7wYUQT2zmVBt9sNT1VB9mUXcjrYviF1PQOw=;
        b=B/IrylK5gDmxuJhfO8pdXSHgCu2alxCIVJUK2Y1yzYegiFnOo+0ZFcytsskIJz0xwl
         XTv3izHsz+4uEtlFKw3QQxdDEJN5LfQOJirYKtJl3hFO86LWDnwvLklaJnwdyJ/ws7fP
         dQSmWL26mI5YIZvafSdgJe7cJA36AfwWGXtDOKXSWPC0ruX30z1ok3QwDklamWhM7zJS
         zpjYFGma/xBJEgBQw0xkQTwf5v3ab6+PkUk+nAPTmb8yGQ0AzpDGs45uLWqviUxC+fNB
         /ZJPMAHrYrAE6a2kudzhYm+ptWNPbCC4ogHWtRyjWczwW3SnDYQVAxLj8S0Uhjf4e6cz
         QMVg==
X-Gm-Message-State: AOJu0Yw/eX5fgZe77o22EONqWMpaB1h1vl82epBih9Xd3lEeJNqZF1+D
	5VUN49WHi7F0KeYKOgcGko997nC9ZMKOTwWqdhV4AmNcpfSVwNjxh5Cy/4aFgMREhXUmzVO53Sa
	ECqmQ6bw=
X-Gm-Gg: ASbGncsM2SVigh0cphuI08u3uKhJYn3O6P6jxoZQyyVsmxrxssf6K7XB/X/fYNW6qUH
	wudbOT4+zRreLf0cMDevP9eXVcGyaSCcLftPypD0qN1uFPxmWk0ZJSoOoNqrTZGVajCmZCHUhhd
	SeIjifoXVr9zPPVME0k74DlQSytOg3bRYc1geg+HRWGGGSjz35pQSZr3rZ0ND+PXh+2klqivJd0
	cst5FYfEbChRGfQrhbBS7Noapgvjs516gvou7Rs0+ZTeCRDbJCEmlxKVtoFtwkq/DJAMORGPKzp
	cbwufy8tmypvUVVDsu+99xyuCTV8xvQbjoP7V9GYvGDYfWEccOA92/2SAG23Aa57TpyPIoc41Hk
	giJ0TnREc056H0YZgPVsnktM=
X-Google-Smtp-Source: AGHT+IHD9zaG0RHklmJIn12LJzJkMbrwHtQrf9CE2XiiTQtTqQulGOSzJsVHAksdgdmgP17k14lOJQ==
X-Received: by 2002:a05:6a20:728d:b0:279:90c2:f890 with SMTP id adf61e73a8af0-2cff2ec6983mr3879592637.59.1758638345235;
        Tue, 23 Sep 2025 07:39:05 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3f58:7e15:309f:29c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b55100df86bsm13428368a12.23.2025.09.23.07.39.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:39:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 4/7] linux-yocto/6.12: update CVE exclusions (6.12.47)
Date: Tue, 23 Sep 2025 07:38:39 -0700
Message-ID: <d9e60c00c85ead1f870094ff90e3f69490cd381f.1758638188.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758638188.git.steve@sakoman.com>
References: <cover.1758638188.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 14:39:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223887

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 1 changes (1 new | 0 updated): - 1 new CVEs: CVE-2025-10421 - 0 updated CVEs:
        Date: Mon, 15 Sep 2025 02:20:02 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 46d3b3c35dd493016a752e07af854a92e38f52ae)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/cve-exclusion_6.12.inc              | 396 +++++++++++++++++-
 1 file changed, 377 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index b5a43986a9..f504ce64d3 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,12 +1,12 @@
 
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
@@ -5849,8 +5849,6 @@ CVE_STATUS[CVE-2023-53135] = "fixed-version: Fixed from version 6.3"
 
 CVE_STATUS[CVE-2023-53136] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53137] = "fixed-version: Fixed from version 6.3"
-
 CVE_STATUS[CVE-2023-53138] = "fixed-version: Fixed from version 6.3"
 
 CVE_STATUS[CVE-2023-53139] = "fixed-version: Fixed from version 6.3"
@@ -12933,7 +12931,7 @@ CVE_STATUS[CVE-2025-22101] = "cpe-stable-backport: Backported in 6.12.36"
 
 CVE_STATUS[CVE-2025-22102] = "cpe-stable-backport: Backported in 6.12.30"
 
-# CVE-2025-22103 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-22103] = "cpe-stable-backport: Backported in 6.12.46"
 
 # CVE-2025-22104 needs backporting (fixed from 6.15)
 
@@ -12953,7 +12951,7 @@ CVE_STATUS[CVE-2025-22110] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2025-22112] = "cpe-stable-backport: Backported in 6.12.35"
 
-# CVE-2025-22113 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-22113] = "cpe-stable-backport: Backported in 6.12.46"
 
 CVE_STATUS[CVE-2025-22114] = "fixed-version: only affects 6.14 onwards"
 
@@ -12975,9 +12973,9 @@ CVE_STATUS[CVE-2025-22122] = "cpe-stable-backport: Backported in 6.12.33"
 
 CVE_STATUS[CVE-2025-22123] = "cpe-stable-backport: Backported in 6.12.33"
 
-# CVE-2025-22124 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-22124] = "cpe-stable-backport: Backported in 6.12.46"
 
-# CVE-2025-22125 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-22125] = "cpe-stable-backport: Backported in 6.12.46"
 
 CVE_STATUS[CVE-2025-22126] = "cpe-stable-backport: Backported in 6.12.25"
 
@@ -12993,7 +12991,7 @@ CVE_STATUS[CVE-2025-22128] = "cpe-stable-backport: Backported in 6.12.35"
 
 # CVE-2025-23132 needs backporting (fixed from 6.15)
 
-# CVE-2025-23133 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-23133] = "cpe-stable-backport: Backported in 6.12.46"
 
 CVE_STATUS[CVE-2025-23134] = "cpe-stable-backport: Backported in 6.12.23"
 
@@ -14095,7 +14093,7 @@ CVE_STATUS[CVE-2025-38270] = "cpe-stable-backport: Backported in 6.12.34"
 
 CVE_STATUS[CVE-2025-38271] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2025-38272 needs backporting (fixed from 6.16)
+CVE_STATUS[CVE-2025-38272] = "cpe-stable-backport: Backported in 6.12.46"
 
 CVE_STATUS[CVE-2025-38273] = "cpe-stable-backport: Backported in 6.12.34"
 
@@ -14163,7 +14161,7 @@ CVE_STATUS[CVE-2025-38304] = "cpe-stable-backport: Backported in 6.12.34"
 
 CVE_STATUS[CVE-2025-38305] = "cpe-stable-backport: Backported in 6.12.34"
 
-# CVE-2025-38306 needs backporting (fixed from 6.16)
+CVE_STATUS[CVE-2025-38306] = "cpe-stable-backport: Backported in 6.12.46"
 
 CVE_STATUS[CVE-2025-38307] = "cpe-stable-backport: Backported in 6.12.34"
 
@@ -14457,7 +14455,7 @@ CVE_STATUS[CVE-2025-38451] = "cpe-stable-backport: Backported in 6.12.39"
 
 CVE_STATUS[CVE-2025-38452] = "cpe-stable-backport: Backported in 6.12.39"
 
-# CVE-2025-38453 needs backporting (fixed from 6.16)
+CVE_STATUS[CVE-2025-38453] = "cpe-stable-backport: Backported in 6.12.46"
 
 CVE_STATUS[CVE-2025-38454] = "cpe-stable-backport: Backported in 6.12.39"
 
@@ -14555,7 +14553,7 @@ CVE_STATUS[CVE-2025-38500] = "cpe-stable-backport: Backported in 6.12.41"
 
 CVE_STATUS[CVE-2025-38501] = "cpe-stable-backport: Backported in 6.12.42"
 
-# CVE-2025-38502 needs backporting (fixed from 6.17rc1)
+CVE_STATUS[CVE-2025-38502] = "cpe-stable-backport: Backported in 6.12.46"
 
 CVE_STATUS[CVE-2025-38503] = "cpe-stable-backport: Backported in 6.12.39"
 
@@ -14663,7 +14661,7 @@ CVE_STATUS[CVE-2025-38554] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2025-38555] = "cpe-stable-backport: Backported in 6.12.42"
 
-# CVE-2025-38556 needs backporting (fixed from 6.17rc1)
+CVE_STATUS[CVE-2025-38556] = "cpe-stable-backport: Backported in 6.12.46"
 
 CVE_STATUS[CVE-2025-38557] = "cpe-stable-backport: Backported in 6.12.42"
 
@@ -14757,8 +14755,6 @@ CVE_STATUS[CVE-2025-38601] = "cpe-stable-backport: Backported in 6.12.42"
 
 CVE_STATUS[CVE-2025-38602] = "cpe-stable-backport: Backported in 6.12.42"
 
-CVE_STATUS[CVE-2025-38603] = "fixed-version: only affects 6.16 onwards"
-
 CVE_STATUS[CVE-2025-38604] = "cpe-stable-backport: Backported in 6.12.42"
 
 # CVE-2025-38605 needs backporting (fixed from 6.17rc1)
@@ -14773,8 +14769,6 @@ CVE_STATUS[CVE-2025-38609] = "cpe-stable-backport: Backported in 6.12.42"
 
 CVE_STATUS[CVE-2025-38610] = "cpe-stable-backport: Backported in 6.12.42"
 
-CVE_STATUS[CVE-2025-38611] = "cpe-stable-backport: Backported in 6.12.42"
-
 CVE_STATUS[CVE-2025-38612] = "cpe-stable-backport: Backported in 6.12.42"
 
 CVE_STATUS[CVE-2025-38613] = "fixed-version: only affects 6.13 onwards"
@@ -14909,16 +14903,378 @@ CVE_STATUS[CVE-2025-38677] = "cpe-stable-backport: Backported in 6.12.44"
 
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
@@ -14927,6 +15283,8 @@ CVE_STATUS[CVE-2025-39989] = "cpe-stable-backport: Backported in 6.12.23"
 
 CVE_STATUS[CVE-2025-40114] = "cpe-stable-backport: Backported in 6.12.23"
 
+# CVE-2025-40300 has no known resolution
+
 # CVE-2025-40325 needs backporting (fixed from 6.15)
 
 # CVE-2025-40364 has no known resolution
-- 
2.43.0


