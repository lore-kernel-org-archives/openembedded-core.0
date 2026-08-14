Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8166C5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 10:47:25 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10358.1786704438972739061
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 03:47:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dENspTxc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4994c49f588so6887755e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 03:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786704437; x=1787309237; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1pmb5Ccaz1uCrpgxscuF8bHxkBRWItf02TcTe81UQk0=;
        b=dENspTxcnqz0DGUWe5FWEU1/zAV3c4AvkSlP2pB4Hb/JCcu4V2WI35n/C+kePxv6MS
         WPcRdoRY6tIMMCMzwmUOAWjNctlXLstpGWhriu3JNCZhCmSgZg73NNY9QCr+0SiI27Tk
         n+Y5Dg1yzo+uFDK6kkh+92pRWCw18PrWhcru4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786704437; x=1787309237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1pmb5Ccaz1uCrpgxscuF8bHxkBRWItf02TcTe81UQk0=;
        b=bdsKYbyln/lJnR8o/ypU2WJkzRfAqDlqII0wnhu799UILcJ7M9yMjozWma/CqjqE/V
         mEmWxBYW/Mu1t3ODuT++ITT9qes1P1HjQfYXDnaUKcPrxLw5vrc4GEN5Q+VJFYbw/ACL
         U/QfTbFiatZGI67WLO/okatNvMkUnsInElTLxY7tpFRGxzT6X878VNx02Jyfqow3ngHG
         WgqfTmQDVpT8KSNl9NERQeMcvqqw4MfYygas/FRrXagmgrqPcLdEhGwyn5/CXFIAt4er
         M7v7MC9GOu6yEOBikagGyyw1Qs8mp/Sk5zopNTQuDjkKYNlQtjnEnnLv5vYE9KSRa5lh
         AWUw==
X-Gm-Message-State: AOJu0YxU/zI4AIGGLzI5w1xkoQY73IQl1VZRkCcoUmDWYEmRteIxkWDB
	rG3AyKn7GfUyKudLqi0RyJGB3j24EL90JvxAwY0UWKZWFNRtptsmkSFnf11KlJ8ObEtaXrZ7QPd
	8UmWDW9s=
X-Gm-Gg: AR+sD10cz4k4VzUkcKH+s1jb5EScn712Y82bjIn+fFt+ZP/V0VfaX/6BogKCgt78VIS
	cCxwqqUZb4hrnnY7ZZzbYi8Qc9R8rYLOL4TUGrbljszvAOjymVj1zzC+/R09m0LaKizM9w2bJaw
	8k5MdeOEAWoUWicBPV2A4xtxLAYC4wjPlRnzE+Da0o47cHh0gTyhkybgSRufWEiqL2zt0X4cJ/3
	G6ij4YR6BslsJMAVaSj3S9V1pQuCcrByLIonLgm/NXj/wz0PGOtHqt2gI2LR0y7E7K+ghi9MUGy
	P37cH5BgdhFuOVu7z0VOXCiU+Up/tPf1pUj1D7pw/+mpIvMSbsrfz0JARjmpZXSSXwpn7PVswYm
	Ni5/v7oiqxlB9GTlQD8L9X4NUdHvdmdiSZCT8eMivXYS96f6APVRXbZ8VTwlZF3wFby/1MjJlQQ
	b+sD2XeOZLl+f4BGuMC62k2h32FevTh0Hrzno9B8cU6TFTtOiJ1NNSp1HYl6Tw/vfPYyUQnIFRV
	a48nq/E+MU+qJvF4Q==
X-Received: by 2002:a05:600c:5643:b0:499:77ba:4b6 with SMTP id 5b1f17b1804b1-49987ad988emr42165525e9.9.1786704436599;
        Fri, 14 Aug 2026 03:47:16 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9095:412f:3012:ddca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499877a6e0asm26046965e9.2.2026.08.14.03.47.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 03:47:15 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] appstream: upgrade 1.1.5 -> 1.1.6
Date: Fri, 14 Aug 2026 11:47:10 +0100
Message-ID: <20260814104712.2536471-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 10:47:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243435

Version 1.1.6
~~~~~~~~~~~~~
Released: 2026-08-12

Features:
 * validator: Ensure description markup has no invalid attributes set
 * validator: Validate bundle/pkgname values for allowed characters

Bugfixes:
 * xml: Sanitize description markup when reading and writing it
 * yaml/json: Ensure description markup is sanitized when loading/saving it
 * meson: Work around wrong library linkage when linking Qt tests
 * Allow sealing of component-IDs to safely use them in hash tables and indices
 * Ensure we never emit or read an invalid data origin
 * Prevent crash when comparing bad version strings that have an epoch after rev
 * Fix potential out-of-bounds read in OARS mapping table
 * apt: yaml: Harden against potential corrupted YAML / YAML-headers
 * compose: Guess a filename even from invalid URLs instead of crashing
 * compose: Confine directory unit data reads to the unit's root directory
 * compose: Refactor directory unit to use openat2, if possible
 * news-convert: Don't crash in case we receive bad freeform YAML news input
 * ascli: Guard against bad bundle values when calling "install"

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../appstream/appstream/0001-remove-hardcoded-path.patch    | 6 +++---
 .../appstream/appstream/0002-Do-not-build-qt-tests.patch    | 6 +++---
 ...x-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch | 2 +-
 .../appstream/{appstream_1.1.5.bb => appstream_1.1.6.bb}    | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-support/appstream/{appstream_1.1.5.bb => appstream_1.1.6.bb} (95%)

diff --git a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
index 56a5479099f..9d1ff639c0f 100644
--- a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
+++ b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
@@ -1,4 +1,4 @@
-From bf79c20cfee4a074ca752a1466dc96d0b9eb6175 Mon Sep 17 00:00:00 2001
+From 75c550f2f88d990fdb18b6118ca052af732a11b2 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Mon, 12 Dec 2022 15:42:42 +0100
 Subject: [PATCH] remove hardcoded path
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate [oe-specific]
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 9af5f58..ad1483d 100644
+index 24d1069..14fffff 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -194,10 +194,10 @@ endif
+@@ -230,10 +230,10 @@ endif
  stemmer_inc_dirs = include_directories()
  if get_option('stemming')
      stemmer_lib = cc.find_library('stemmer', required: true)
diff --git a/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
index 3e666181eb9..c9d544f3fcc 100644
--- a/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
+++ b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
@@ -1,4 +1,4 @@
-From 1a1619dce3c3fa54fa5f47f7ed89447e0805de43 Mon Sep 17 00:00:00 2001
+From 6b50c15e350f80e805816f1c2ae2abe97cef6312 Mon Sep 17 00:00:00 2001
 From: Marc Ferland <marc.ferland@sonatest.com>
 Date: Fri, 26 Jul 2024 15:41:00 -0400
 Subject: [PATCH] Do not build qt/tests
@@ -23,10 +23,10 @@ Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/qt/meson.build b/qt/meson.build
-index 407a57a..840c838 100644
+index 488fe60..83c2715 100644
 --- a/qt/meson.build
 +++ b/qt/meson.build
-@@ -130,5 +130,3 @@ install_data (
+@@ -144,5 +144,3 @@ install_data (
      join_paths(meson.current_build_dir(), 'AppStreamQtConfigVersion.cmake'),
      install_dir: join_paths(get_option('libdir'), 'cmake', 'AppStreamQt')
  )
diff --git a/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch b/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
index 8ba4de95c9c..185dd507b31 100644
--- a/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
+++ b/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
@@ -1,4 +1,4 @@
-From 4fdd29346b51eea577ee46c7166348dad19bbcb0 Mon Sep 17 00:00:00 2001
+From f7a125e90f99a997652fceb07263517df0f1ecc6 Mon Sep 17 00:00:00 2001
 From: Marc Ferland <marc.ferland@sonatest.com>
 Date: Mon, 29 Jul 2024 09:35:51 -0400
 Subject: [PATCH] Fix PACKAGE_PREFIX_DIR in qt/cmake/AppStreamQtConfig.cmake.in
diff --git a/meta/recipes-support/appstream/appstream_1.1.5.bb b/meta/recipes-support/appstream/appstream_1.1.6.bb
similarity index 95%
rename from meta/recipes-support/appstream/appstream_1.1.5.bb
rename to meta/recipes-support/appstream/appstream_1.1.6.bb
index e33359e5a13..723c7400065 100644
--- a/meta/recipes-support/appstream/appstream_1.1.5.bb
+++ b/meta/recipes-support/appstream/appstream_1.1.6.bb
@@ -24,7 +24,7 @@ SRC_URI = " \
 	file://0002-Do-not-build-qt-tests.patch \
 	file://0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch \
 "
-SRC_URI[sha256sum] = "fc57337e250b0d27e75ac4216cc69a76d03c54011a5da5c7a2c57711a3d0cdf9"
+SRC_URI[sha256sum] = "e298929f39729e84a70f6be6941f3e7f3fc2ee3c83cb3ea1b1b5b280a8fe3a24"
 
 S = "${UNPACKDIR}/AppStream-${PV}"
 

