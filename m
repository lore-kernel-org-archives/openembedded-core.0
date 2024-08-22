Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A45C54734
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 09:35:41 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.9389.1724319333707516699
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 02:35:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hYB/5GVF;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a83856c6f51so56741166b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 02:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724319332; x=1724924132; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VllB8xsfG/o3RFTjTIwOL3wjTRoIrciLdsNxPoy5a7w=;
        b=hYB/5GVFNZefzENsxQcrbSo1ysYlKsIYTvig1BlTHczGjP+cPtMwGtXxLPBMt3ynQp
         Ijoj5bZTMVaL8mpXKfsTiDljx53UKyGeMbWQKA6konN/0012CUOWdKYp8NFRk8OS/BPy
         ZB7+O+y4tPk3o5BnVqEg+CYXdsOHt46OKwHE/m1I2JLe3MNWU1ykPECXutSMp/Z0pBwq
         JqQ/oj03r81/sEz0kxci3oyim80ohxw76aFBbRRUPi7oAMcCMF6uKD7mDXuwM7Ht5yVL
         E2MsIc9uFWsek2Re4/hepBgKmy0WjTKeCwPVAXqlozOge/dauBWAWReNMlRN9N0AajMp
         MWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724319332; x=1724924132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VllB8xsfG/o3RFTjTIwOL3wjTRoIrciLdsNxPoy5a7w=;
        b=tXgB/rCXGBN34ZX82ma7ojp9R3PMUuNHJGOGpE0E3bjUV65Qyfs2hLKf7S21F0JaRJ
         JJLQ9ijui3zRfKygVWGiYzTC2EyNA1lgbZSE7DyCr+dIddSKOB7MEnZoTquFuk9jms7h
         kRw2p8BZpBRu5yYLp37ir1Ecf9e6QTl6pAizTPyysde6y/6++zQ9lt2bgbTC+ZHX8dmR
         drqqvleCYiVLxGTldoNxxGs4Ke1zsijtCG0jbq3ZGQpUu5706Wg6y6Vgcc3pQ0RRgUEg
         zinReHrTBWuRL6ImJbRHPvaWtHIZiMfgL03e+MwuTuUibH2tZqSXoIbzY+tSkLZi7Efs
         spPQ==
X-Gm-Message-State: AOJu0Yz3A84cd6WkuIt5tRJGH9ynSVlv0dAovfRp1JOUmCnk+KMDrq/f
	Aw93MkH8ve/v7k+EWylwqY3cQZ26Y9i4MS8OKz+chaBkFWwdRnol80h7BQ==
X-Google-Smtp-Source: AGHT+IHzsjN0PK1SfU2e3pH7U9VVMI/LyNL4uvbO8dudeMhJ2oR3XswZQFa8AghQ00SSfZEGQvnDrg==
X-Received: by 2002:a05:6402:1ecb:b0:5be:f0dd:d501 with SMTP id 4fb4d7f45d1cf-5c07929520dmr1524488a12.27.1724319331487;
        Thu, 22 Aug 2024 02:35:31 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c044ddbce5sm698502a12.4.2024.08.22.02.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:35:31 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/32] gstreamer1.0: upgrade 1.24.5 -> 1.24.6
Date: Thu, 22 Aug 2024 11:34:59 +0200
Message-Id: <20240822093521.36790-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822093521.36790-1-alex.kanavin@gmail.com>
References: <20240822093521.36790-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 09:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203625

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-connect-has-a-different-signature-on-musl.patch      | 2 +-
 .../{gst-devtools_1.24.5.bb => gst-devtools_1.24.6.bb}        | 2 +-
 ...reamer1.0-libav_1.24.5.bb => gstreamer1.0-libav_1.24.6.bb} | 2 +-
 ...fix-maybe-uninitialized-warnings-when-compiling-with.patch | 2 +-
 .../0002-avoid-including-sys-poll.h-directly.patch            | 2 +-
 ...opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch | 2 +-
 ...ugins-bad_1.24.5.bb => gstreamer1.0-plugins-bad_1.24.6.bb} | 2 +-
 ...1-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch | 2 +-
 .../0002-ssaparse-enhance-SSA-text-lines-parsing.patch        | 2 +-
 .../0003-viv-fb-Make-sure-config.h-is-included.patch          | 2 +-
 ...ins-base_1.24.5.bb => gstreamer1.0-plugins-base_1.24.6.bb} | 2 +-
 ...ins-good_1.24.5.bb => gstreamer1.0-plugins-good_1.24.6.bb} | 2 +-
 ...ins-ugly_1.24.5.bb => gstreamer1.0-plugins-ugly_1.24.6.bb} | 2 +-
 ...amer1.0-python_1.24.5.bb => gstreamer1.0-python_1.24.6.bb} | 2 +-
 ...sp-server_1.24.5.bb => gstreamer1.0-rtsp-server_1.24.6.bb} | 2 +-
 ...reamer1.0-vaapi_1.24.5.bb => gstreamer1.0-vaapi_1.24.6.bb} | 2 +-
 .../0001-tests-respect-the-idententaion-used-in-meson.patch   | 4 ++--
 .../0002-tests-add-support-for-install-the-tests.patch        | 4 ++--
 .../0003-tests-use-a-dictionaries-for-environment.patch       | 4 ++--
 ...4-tests-add-helper-script-to-run-the-installed_tests.patch | 4 ++--
 .../{gstreamer1.0_1.24.5.bb => gstreamer1.0_1.24.6.bb}        | 2 +-
 21 files changed, 25 insertions(+), 25 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.24.5.bb => gst-devtools_1.24.6.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.24.5.bb => gstreamer1.0-libav_1.24.6.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.24.5.bb => gstreamer1.0-plugins-bad_1.24.6.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.24.5.bb => gstreamer1.0-plugins-base_1.24.6.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.24.5.bb => gstreamer1.0-plugins-good_1.24.6.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.24.5.bb => gstreamer1.0-plugins-ugly_1.24.6.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.24.5.bb => gstreamer1.0-python_1.24.6.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.24.5.bb => gstreamer1.0-rtsp-server_1.24.6.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.24.5.bb => gstreamer1.0-vaapi_1.24.6.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.24.5.bb => gstreamer1.0_1.24.6.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
index 8520567f177..f2bb664140f 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
@@ -1,4 +1,4 @@
-From c20894a5e6f52aa9fe3437e733a228b1a0eb6428 Mon Sep 17 00:00:00 2001
+From d0e3b04007d60755cf1c092c1cac29e832290b86 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 9 Sep 2018 17:38:10 -0700
 Subject: [PATCH] connect has a different signature on musl
diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.5.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.6.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.24.5.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.24.6.bb
index d4a81b69a17..1b448f7c558 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.6.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "a96675898129a480d05bbf91071ec4e40154dcad6d62f3944154a6cb326045a4"
+SRC_URI[sha256sum] = "8beb9e98ed136c29f4ec10396dd6c8708a5645cdacda90af1b7196057de17672"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.6.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.6.bb
index 24c6c792c5f..7a72f9120e8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.6.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "7fd16bdfa56ed51c40b474648fc35c4edde3e8ac934b12b82b49727b5d703521"
+SRC_URI[sha256sum] = "4bbd08481a390f907e342aa3f25ab885c80ec0a53f3b14244cf733cc8622f2bf"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
index 13a481485ae..da455c8b204 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
@@ -1,4 +1,4 @@
-From bb7f964d51de6b888b3b7a6d0c3d260fcad24008 Mon Sep 17 00:00:00 2001
+From 653f194c2ce141bbb7a7440f65ea279cf4fe3f78 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 26 Jan 2016 15:16:01 -0800
 Subject: [PATCH] fix maybe-uninitialized warnings when compiling with -Os
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
index 298337cb0a0..9b77bfeb487 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
@@ -1,4 +1,4 @@
-From 25efc5b2d22aed4527470ef93970664b210bf8c5 Mon Sep 17 00:00:00 2001
+From 441b90195aff1ececa9ea6dd228546fa3c16bf84 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Wed, 3 Feb 2016 18:05:41 -0800
 Subject: [PATCH] avoid including <sys/poll.h> directly
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
index 965053348fd..0214ce3eecf 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
@@ -1,4 +1,4 @@
-From 39fbcdfc5383bdae95293a3109c847f64d193b54 Mon Sep 17 00:00:00 2001
+From d3121e8febdb5cb00511624983c24e50441b64e8 Mon Sep 17 00:00:00 2001
 From: Andrey Zhizhikin <andrey.z@gmail.com>
 Date: Mon, 27 Jan 2020 10:22:35 +0000
 Subject: [PATCH] opencv: resolve missing opencv data dir in yocto build
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb
index 75efbad49cd..48e69550397 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "3029bfd7265314d609dc8eab503675a344ea46e8274fd73ab34566c8442dc847"
+SRC_URI[sha256sum] = "8f4d965513e7827c1f547c1e749e4ef2812b371974fe64857fe5029a19c5b64c"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
index 38d0fbf6bfb..0c2c34aa0db 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
@@ -1,4 +1,4 @@
-From 5a4d65e13a326103ac02f156c01b6fcbb0269902 Mon Sep 17 00:00:00 2001
+From ffe65c3e4998042b030b91c09a706a03768a1e40 Mon Sep 17 00:00:00 2001
 From: zhouming <b42586@freescale.com>
 Date: Wed, 14 May 2014 10:16:20 +0800
 Subject: [PATCH] ENGR00312515: get caps from src pad when query caps
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
index 4090b77c8d4..abca62a4914 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
@@ -1,4 +1,4 @@
-From 21b8339077f52ec9220e0d3d1f3872e23c7c2e88 Mon Sep 17 00:00:00 2001
+From 1cd4da7d4739dcfa2b66899ef8a49e5ed88d41b8 Mon Sep 17 00:00:00 2001
 From: Mingke Wang <mingke.wang@freescale.com>
 Date: Thu, 19 Mar 2015 14:17:10 +0800
 Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
index ab46ecee5df..40c91c9df69 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
@@ -1,4 +1,4 @@
-From 246e6f5ed75696b2e9d9a9ee8cd59252724e1334 Mon Sep 17 00:00:00 2001
+From 48652bcf057b74460eadf8cb943b6381fca4423f Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <crg7475@mailbox.org>
 Date: Tue, 21 May 2019 14:01:11 +0200
 Subject: [PATCH] viv-fb: Make sure config.h is included
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb
index 9d19ea233da..7c3390d52df 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "0e33ec9b59eef5ef3a6a53bbd55c44340e681d0000910caca12541a73db38a7d"
+SRC_URI[sha256sum] = "cf52b535a0ce7ec974756891818f34f06317c2e136abb24149e18c23ecc229b5"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb
index 1c33ffde00e..9d93ca09677 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "badcfc5292b035bde99a77327d468b2f0b116b40420bc9f25fb8e3970824ba75"
+SRC_URI[sha256sum] = "996b9c8d1d246ed43be304718b6086e5a17d4ae8114d1920aed9ea75b920ba2d"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb
index 6cae61ed35e..7b7de75dacb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "333267b6e00770440a4a00402910dd59ed8fd619eaebf402815fbe111da7776d"
+SRC_URI[sha256sum] = "5dfdbb2978ab282e637255cd875cf5b7b93fc83db62f8a0b1af02c85c84a75c4"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.6.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.6.bb
index a4574f12623..cf38c2b8764 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.6.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "c23570c144e6276efd9e82de2ac0cea46b168a57fb2e436bed96cb285d641bf6"
+SRC_URI[sha256sum] = "692e88820e097b30e5f92d37d0955c709a0a17b27f874a1907405244825bd700"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb
index 9971eee48ec..cdb74afbfc4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "a3062665e41814d3dba3e02b7b06b77326d54d2b6f178ffcb196af9b91a1bfb9"
+SRC_URI[sha256sum] = "b0bdda26173f13f5521c829367963824a74fd0ce8f52bcab674d7e727f74e93c"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.6.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.6.bb
index c23794f4b60..015eb86316e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.6.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "fdb2da26b23895c56b20c6bad9edcf0faec3a3887765bc62c88f0955ed5b7c72"
+SRC_URI[sha256sum] = "b5caa057e7efc51cd70504a59e5d9c7a5406d8268723c8283dd61be27fd8cacc"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
index a190370c161..80e6ca3f99c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
@@ -1,4 +1,4 @@
-From 381f50a27766c425af36a7203061716497e6603f Mon Sep 17 00:00:00 2001
+From 9c932b1c17d62a3e54c2dc55b1f75dc48d73134c Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: respect the idententaion used in meson
@@ -11,7 +11,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/tests/check/meson.build b/tests/check/meson.build
-index 6540279..e9501fe 100644
+index 7d68212..bf0021f 100644
 --- a/tests/check/meson.build
 +++ b/tests/check/meson.build
 @@ -146,11 +146,11 @@ foreach t : core_tests
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
index 8a0d5bd51bc..4d88706a4aa 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
@@ -1,4 +1,4 @@
-From 19b1768acde5b30def36f0d1ac2725b265151d13 Mon Sep 17 00:00:00 2001
+From 32707203ac17cd7130224445aa760f36d4cec579 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: add support for install the tests
@@ -19,7 +19,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 tests/check/template.test.in
 
 diff --git a/meson.build b/meson.build
-index 0809b4c..ffb61c4 100644
+index 1d87075..6aaf23c 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -645,6 +645,10 @@ if bashcomp_dep.found()
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
index 27623bf96bd..8d0c6dbf34c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
@@ -1,4 +1,4 @@
-From 453865e8938c5f50f14409b67246bbbd801fa44d Mon Sep 17 00:00:00 2001
+From fca19b2f5db1be4daef4ea00c60a64120fa08178 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 24 Apr 2021 10:34:47 +0100
 Subject: [PATCH] tests: use a dictionaries for environment
@@ -14,7 +14,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  1 file changed, 13 insertions(+), 8 deletions(-)
 
 diff --git a/tests/check/meson.build b/tests/check/meson.build
-index 08f8fd8..330abaa 100644
+index 9a8c42c..6bb346a 100644
 --- a/tests/check/meson.build
 +++ b/tests/check/meson.build
 @@ -161,14 +161,19 @@ foreach t : core_tests
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
index 97b056072d6..629b0563f6b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
@@ -1,4 +1,4 @@
-From 506ff13a044439a170f770b6663a64c942ae0a05 Mon Sep 17 00:00:00 2001
+From 5f80e65b73fee2d081ff4ffb442f71eb5b0ccfc4 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 2 May 2021 01:58:01 +0100
 Subject: [PATCH] tests: add helper script to run the installed_tests
@@ -18,7 +18,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100755 tests/check/template.sh.in
 
 diff --git a/tests/check/meson.build b/tests/check/meson.build
-index 330abaa..5d383b1 100644
+index 6bb346a..fe57935 100644
 --- a/tests/check/meson.build
 +++ b/tests/check/meson.build
 @@ -185,6 +185,23 @@ foreach t : core_tests
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb
index c2da99f7e48..71ff327675b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "2bdef209252bf146351843134b797db6b6e7adb4c00d82e83bd5abe608253a7b"
+SRC_URI[sha256sum] = "64342060d7c6f9e36a35e3be38a4f5ac3b41ed93b0853619be45141ef3cc1b9d"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.39.2


