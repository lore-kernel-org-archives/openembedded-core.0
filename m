Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ED33E77197
	for <webhook@archiver.kernel.org>; Sat,  4 Jan 2025 13:46:27 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.18211.1735998381948000467
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jan 2025 05:46:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZaNEXE1V;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2efb17478adso18359547a91.1
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 05:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1735998381; x=1736603181; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PWaTkCV0edf7+aDhU4gXfCBvD8MF7Wgz7U52QiAJlts=;
        b=ZaNEXE1VVUGqvYQ6hL8Nb+bcmtxX90s10CFFVQ7pgvL3E8Z+jn8CCP1FyGg5KBay31
         5lt/4Y5hGHAUpb3tZSRZryPgm2fLk/JvGSHMdCmBTSTJV+qrIY3g53ItAEay6uN2C/oi
         s9IAL+Hr5NC5zyaf3eZQKO6fDfJBQ2Z3cKgos8ZLwb/fD0YJfZv9a213CHlQcmfdxLNl
         qQZTfT1Ksf7VBNOJehW72BCYu4QkAM+9Xdlo3syXRjC0SIsBf1bncwHiGfgpnjqN7Qyu
         XeC1pSqES1vxYhoCbUlX3MHDXrCnu5w//2S4TcZRMbSdMnkKKsZmoZZjUrPf6NgL2Ivf
         7dHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735998381; x=1736603181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PWaTkCV0edf7+aDhU4gXfCBvD8MF7Wgz7U52QiAJlts=;
        b=nLUyoR5FA04+vphE2LtHcc6Sya4tVJ1SqEibEb/rFh0YrJymOvkQqFrI9qV5qqi1Bv
         VxhwPZNAaV+H5q4DPGiOVZBC0ExJ8mkUFpkhNLpWB9jzp/J4PXVOAZq1CCgZjO2Ujz1n
         /YwAJFVxMZcITQ8OuzNilRLX3V3uO2Eu2LDT7vnim7+tX1TUEwaHYOyOp2w0UZlxBjTv
         3VapWZRbx9Vsyg3ku+dckBH7SclPBsgGtqsmZUB+ZEGc5p82m3bxHtA30VSZbRuhXMGR
         N4h1soy/vI3jJjXi+mSIM5d/qFQ9VaSYRMRHNxRv1ASi/pUk7ddP76SK4Y7tpowdGb3+
         F7cA==
X-Gm-Message-State: AOJu0YzlgLSJfKbs/a6ylbvCbaurAYeRWoR0TuaA26/4JfNpR0dcvtP5
	aWzG+qnrN7YBy2rL/7DbZB4wxz6uOsNr7IEzU/Rq+RsjgDAu3n8pN4pufA9bXYpJyi7MixccpNu
	B
X-Gm-Gg: ASbGncv0FMlCCTs/2MJCVJN+BXZvDjcjz6XVsCURcQ7yQzgiMrN9lOaa5dDLAxmuvNM
	pNPdBYeqIW5NM7nMVFl+NLlTvzENhNVkiS7sWB6lilDilhszqbYvbWhFrrCxJkOe+j2QwK14HM5
	BA68caMGYNxmpFRnAwzqTI8p+wMRgt5Ap58rdvKCWMA+4EVJWuJfBzUjETwMNrCas9ltLRe0YqP
	yRDEBd1ozEd7IHn4FXq3Dnrw4+I/rZXDkG8+TwBamH+RQ==
X-Google-Smtp-Source: AGHT+IEyTThsZT9+iT7wnMf5kzcoEDcAWJwR1L5sty7BR0QG40iNTsRYSougznvq5J1KfTKpkQI2eg==
X-Received: by 2002:a17:90b:540f:b0:2ee:6db1:21d3 with SMTP id 98e67ed59e1d1-2f452ec922bmr72883303a91.25.1735998381009;
        Sat, 04 Jan 2025 05:46:21 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f447882b09sm33498230a91.41.2025.01.04.05.46.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 05:46:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 06/10] gstreamer1.0: upgrade 1.24.6 -> 1.24.9
Date: Sat,  4 Jan 2025 05:45:58 -0800
Message-ID: <7052eada55951aece87cf09ed803bb900046c5ec.1735998221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1735998221.git.steve@sakoman.com>
References: <cover.1735998221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 13:46:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209401

From: Alexander Kanavin <alex@linutronix.de>

(From OE-Core rev: e01f9c79725388437d52096701416b61d9a0aa7d)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ct-has-a-different-signature-on-musl.patch |  2 +-
 ...tools_1.24.6.bb => gst-devtools_1.24.9.bb} |  2 +-
 ...1.24.6.bb => gstreamer1.0-libav_1.24.9.bb} |  2 +-
 ...ialized-warnings-when-compiling-with.patch |  2 +-
 ...-avoid-including-sys-poll.h-directly.patch |  2 +-
 ...issing-opencv-data-dir-in-yocto-buil.patch |  2 +-
 ....bb => gstreamer1.0-plugins-bad_1.24.9.bb} |  2 +-
 ...et-caps-from-src-pad-when-query-caps.patch |  2 +-
 ...parse-enhance-SSA-text-lines-parsing.patch |  2 +-
 ...iv-fb-Make-sure-config.h-is-included.patch |  2 +-
 ...bb => gstreamer1.0-plugins-base_1.24.9.bb} |  2 +-
 ...bb => gstreamer1.0-plugins-good_1.24.9.bb} |  2 +-
 ...bb => gstreamer1.0-plugins-ugly_1.24.9.bb} |  2 +-
 ....24.6.bb => gstreamer1.0-python_1.24.9.bb} |  2 +-
 ....bb => gstreamer1.0-rtsp-server_1.24.9.bb} |  2 +-
 ...-required-lines-accidentally-removed.patch | 33 +++++++++++++++++++
 ...1.24.6.bb => gstreamer1.0-vaapi_1.24.9.bb} |  6 ++--
 ...spect-the-idententaion-used-in-meson.patch |  2 +-
 ...ts-add-support-for-install-the-tests.patch |  4 +--
 ...s-use-a-dictionaries-for-environment.patch |  2 +-
 ...er-script-to-run-the-installed_tests.patch |  2 +-
 ...er1.0_1.24.6.bb => gstreamer1.0_1.24.9.bb} |  2 +-
 22 files changed, 58 insertions(+), 23 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.24.6.bb => gst-devtools_1.24.9.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.24.6.bb => gstreamer1.0-libav_1.24.9.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.24.6.bb => gstreamer1.0-plugins-bad_1.24.9.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.24.6.bb => gstreamer1.0-plugins-base_1.24.9.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.24.6.bb => gstreamer1.0-plugins-good_1.24.9.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.24.6.bb => gstreamer1.0-plugins-ugly_1.24.9.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.24.6.bb => gstreamer1.0-python_1.24.9.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.24.6.bb => gstreamer1.0-rtsp-server_1.24.9.bb} (90%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-meson-Re-added-required-lines-accidentally-removed.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.24.6.bb => gstreamer1.0-vaapi_1.24.9.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.24.6.bb => gstreamer1.0_1.24.9.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
index f2bb664140..7423cebc39 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
@@ -1,4 +1,4 @@
-From d0e3b04007d60755cf1c092c1cac29e832290b86 Mon Sep 17 00:00:00 2001
+From 9749abecad3ffcd497e216f813f935f0937e6453 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 9 Sep 2018 17:38:10 -0700
 Subject: [PATCH] connect has a different signature on musl
diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.6.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.9.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.24.6.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.24.9.bb
index 1b448f7c55..63779b5aff 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.9.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "8beb9e98ed136c29f4ec10396dd6c8708a5645cdacda90af1b7196057de17672"
+SRC_URI[sha256sum] = "cf1de1aafa6eb4fd0365932b251528e2340b88697541e021628c5f7259970fb8"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.9.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.9.bb
index 4036006551..a5cfc8632a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.9.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "4bbd08481a390f907e342aa3f25ab885c80ec0a53f3b14244cf733cc8622f2bf"
+SRC_URI[sha256sum] = "32682e9ae508ee01f4fb134b3a520081e2ac007220997577624b1d16171d456c"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
index da455c8b20..f721103229 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
@@ -1,4 +1,4 @@
-From 653f194c2ce141bbb7a7440f65ea279cf4fe3f78 Mon Sep 17 00:00:00 2001
+From fce75512714cc21bd02fa1df95da4cea34bc3118 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 26 Jan 2016 15:16:01 -0800
 Subject: [PATCH] fix maybe-uninitialized warnings when compiling with -Os
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
index 9b77bfeb48..28d834dbd4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
@@ -1,4 +1,4 @@
-From 441b90195aff1ececa9ea6dd228546fa3c16bf84 Mon Sep 17 00:00:00 2001
+From 48b7c48d484096f44ef5f6ac9df35c1e8c1aceff Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Wed, 3 Feb 2016 18:05:41 -0800
 Subject: [PATCH] avoid including <sys/poll.h> directly
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
index 0214ce3eec..5143009657 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
@@ -1,4 +1,4 @@
-From d3121e8febdb5cb00511624983c24e50441b64e8 Mon Sep 17 00:00:00 2001
+From 21bf2b1bb9f98d83c7257b0492a0dc70f5d0b9d9 Mon Sep 17 00:00:00 2001
 From: Andrey Zhizhikin <andrey.z@gmail.com>
 Date: Mon, 27 Jan 2020 10:22:35 +0000
 Subject: [PATCH] opencv: resolve missing opencv data dir in yocto build
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.9.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.9.bb
index 48e6955039..be2628d14a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.9.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "8f4d965513e7827c1f547c1e749e4ef2812b371974fe64857fe5029a19c5b64c"
+SRC_URI[sha256sum] = "36fcf7a9af0a753b43bb03b9835246f74d72f7124369e66a1e2dc7b04f5a5cab"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
index 0c2c34aa0d..cec68bd1f4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
@@ -1,4 +1,4 @@
-From ffe65c3e4998042b030b91c09a706a03768a1e40 Mon Sep 17 00:00:00 2001
+From 87865e7c96e40553bc39f7697fbc2ef68451725c Mon Sep 17 00:00:00 2001
 From: zhouming <b42586@freescale.com>
 Date: Wed, 14 May 2014 10:16:20 +0800
 Subject: [PATCH] ENGR00312515: get caps from src pad when query caps
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
index abca62a491..9e2e9a702c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
@@ -1,4 +1,4 @@
-From 1cd4da7d4739dcfa2b66899ef8a49e5ed88d41b8 Mon Sep 17 00:00:00 2001
+From 2dee5ae9ad92a06c73dd72f2ff2f731ce85a8baa Mon Sep 17 00:00:00 2001
 From: Mingke Wang <mingke.wang@freescale.com>
 Date: Thu, 19 Mar 2015 14:17:10 +0800
 Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
index 40c91c9df6..032be93692 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
@@ -1,4 +1,4 @@
-From 48652bcf057b74460eadf8cb943b6381fca4423f Mon Sep 17 00:00:00 2001
+From 170070d4e7c653c68cdc6401eebfa94fa7d58838 Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <crg7475@mailbox.org>
 Date: Tue, 21 May 2019 14:01:11 +0200
 Subject: [PATCH] viv-fb: Make sure config.h is included
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.9.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.9.bb
index 7c3390d52d..996a06500e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.9.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "cf52b535a0ce7ec974756891818f34f06317c2e136abb24149e18c23ecc229b5"
+SRC_URI[sha256sum] = "5bb3b946907d3ce04dd842b610c8111c2b0611351b25a1fa22af5efa897857cb"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.9.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.9.bb
index 9d93ca0967..95f03b1da2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.9.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "996b9c8d1d246ed43be304718b6086e5a17d4ae8114d1920aed9ea75b920ba2d"
+SRC_URI[sha256sum] = "897de50bff337e3ca2f86f1eaa28e0828d83024156162a50c4ea0af86e29799f"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.9.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.9.bb
index 7b7de75dac..45abe68659 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.9.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "5dfdbb2978ab282e637255cd875cf5b7b93fc83db62f8a0b1af02c85c84a75c4"
+SRC_URI[sha256sum] = "4b6b30110f38cd05eb67422297142b75a55fe00003105f48b13603e6761cc3b6"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.9.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.9.bb
index cf38c2b876..25c9179bfd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.9.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "692e88820e097b30e5f92d37d0955c709a0a17b27f874a1907405244825bd700"
+SRC_URI[sha256sum] = "80e61d587c34cbac79e46c927b71cf32c4bf9bb0868ce5aa4b7444bdad83f42e"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.9.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.9.bb
index cdb74afbfc..776e177b9f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.9.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "b0bdda26173f13f5521c829367963824a74fd0ce8f52bcab674d7e727f74e93c"
+SRC_URI[sha256sum] = "299c9aafac3c91bbebe4cd481ed4e4ade8cb2b0677097bc4a8dcf6d4364c9804"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-meson-Re-added-required-lines-accidentally-removed.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-meson-Re-added-required-lines-accidentally-removed.patch
new file mode 100644
index 0000000000..404ee5fb78
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-meson-Re-added-required-lines-accidentally-removed.patch
@@ -0,0 +1,33 @@
+From 75730490d2c0416ae8ad4d3e2a47ccb66d260d9f Mon Sep 17 00:00:00 2001
+From: Nirbheek Chauhan <nirbheek@centricular.com>
+Date: Fri, 13 Sep 2024 14:37:10 +0530
+Subject: [PATCH] meson: Re-added required: lines accidentally removed
+
+Broke in e3f086c648171c3c993f5dd73e2d025480c3729e
+
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3801
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/7512>
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/577df3a02f7f26283b2749c58ae7738bbdf4be4c]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ meson.build | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 1a8301f..6c61773 100644
+--- a/meson.build
++++ b/meson.build
+@@ -80,9 +80,9 @@ else
+ endif
+ 
+ libva_dep = dependency('libva', version: libva_req)
+-libva_drm_dep = dependency('libva-drm', version: libva_req)
+-libva_wayland_dep = dependency('libva-wayland', version: libva_req)
+-libva_x11_dep = dependency('libva-x11', version: libva_req)
++libva_drm_dep = dependency('libva-drm', required: get_option('drm'), version: libva_req)
++libva_wayland_dep = dependency('libva-wayland', required: get_option('wayland'), version: libva_req)
++libva_x11_dep = dependency('libva-x11', required: get_option('x11'), version: libva_req)
+ 
+ libdrm_dep = dependency('libdrm', version: libdrm_req, required: get_option('drm'))
+ libudev_dep = dependency('libudev', required: get_option('drm'))
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.9.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.9.bb
index 015eb86316..0cc62e345e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.9.bb
@@ -9,9 +9,11 @@ REALPN = "gstreamer-vaapi"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
+SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz \
+           file://0001-meson-Re-added-required-lines-accidentally-removed.patch \
+           "
 
-SRC_URI[sha256sum] = "b5caa057e7efc51cd70504a59e5d9c7a5406d8268723c8283dd61be27fd8cacc"
+SRC_URI[sha256sum] = "c2373e9b4d6655535d355207f60084b0fb3b28566fe9bb4ca1da714439da4ae1"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
index 80e6ca3f99..e696eaaaff 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
@@ -1,4 +1,4 @@
-From 9c932b1c17d62a3e54c2dc55b1f75dc48d73134c Mon Sep 17 00:00:00 2001
+From bcf818265ae8b2eb668fffbbedb19c1162032c2a Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: respect the idententaion used in meson
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
index 4d88706a4a..32e1e85b77 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
@@ -1,4 +1,4 @@
-From 32707203ac17cd7130224445aa760f36d4cec579 Mon Sep 17 00:00:00 2001
+From 0efdfdf9e5055944a463eea43e5539aa7ea7206a Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: add support for install the tests
@@ -19,7 +19,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 tests/check/template.test.in
 
 diff --git a/meson.build b/meson.build
-index 1d87075..6aaf23c 100644
+index 830a601..3f9fdce 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -645,6 +645,10 @@ if bashcomp_dep.found()
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
index 8d0c6dbf34..f40969042b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
@@ -1,4 +1,4 @@
-From fca19b2f5db1be4daef4ea00c60a64120fa08178 Mon Sep 17 00:00:00 2001
+From 21b89d16e2ca79db212587bfea4aa18470984c90 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 24 Apr 2021 10:34:47 +0100
 Subject: [PATCH] tests: use a dictionaries for environment
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
index cd795fe0ec..24f336c105 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
@@ -1,4 +1,4 @@
-From 5f80e65b73fee2d081ff4ffb442f71eb5b0ccfc4 Mon Sep 17 00:00:00 2001
+From 9bffd7eb9113f6535d8b82ca316e6f133241bd8d Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 2 May 2021 01:58:01 +0100
 Subject: [PATCH] tests: add helper script to run the installed_tests
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.9.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.9.bb
index 71ff327675..a756f9e3a2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.9.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "64342060d7c6f9e36a35e3be38a4f5ac3b41ed93b0853619be45141ef3cc1b9d"
+SRC_URI[sha256sum] = "ebf47b6beef508a00c8557d4c1f1713e5c7ef9ba70dac45deed80e182bcf260f"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.43.0


