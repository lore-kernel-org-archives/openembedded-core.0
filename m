Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ADF9C55174
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 19:23:33 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28870.1785698609617793450
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 12:23:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=gt8excFk;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20260802192327f0ceb022ec0002070a-ihhkxg@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260802192327f0ceb022ec0002070a
        for <openembedded-core@lists.openembedded.org>;
        Sun, 02 Aug 2026 21:23:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=76TH7YrQ/mVV5pjG+O89XBQ6K/9mqMqvrjzI1n1mgFg=;
 b=gt8excFkdarObYqfWqPkgSWz5/PrZ/fyN/4Mi6K4PwB/v8N1RtPNcwmVKvlYy+s9NXve9c
 PCRkw4IdeqW/r5cl1NdnU0ZR26/yo+m4lWhquJ/ArY7MLncFEgTlDjcoO1L3Jr79IG1h44Uq
 IqZ4wzvecN6sJ+cGxSuHzLtYKMJl6NBBL5s9MdL7p86ZcNXqX2IEzde40Y8hYMYPfSu0OQJQ
 dwdfj4BjRJEsKviDEZKKNNfqazyD3uk2VY1tpXeYYDWrj+jmWtJ1S3Pkh23cd7gx02SW3diD
 ZMM5eI3cPb6ID7YTXwAz9yK+MSUOsD69Iw9yZDdx38j6Q3svvM6DDrZQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][PATCH 6/7] gstreamer1.0: upgrade 1.28.2 -> 1.28.4 (the remaining pieces)
Date: Sun,  2 Aug 2026 21:22:33 +0200
Message-ID: <20260802192234.1725830-6-peter.marko@siemens.com>
In-Reply-To: <20260802192234.1725830-1-peter.marko@siemens.com>
References: <20260802192234.1725830-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 19:23:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242569

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
((From OE-Core rev: 430c35bc1e4358173ab3b6d1e2e5e94f58357359)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...001-Make-player-examples-installable.patch | 21 +++++++++----------
 ...mples_1.28.2.bb => gst-examples_1.28.4.bb} |  2 +-
 ...ialized-warnings-when-compiling-with.patch |  4 ++--
 ...-avoid-including-sys-poll.h-directly.patch |  2 +-
 ...issing-opencv-data-dir-in-yocto-buil.patch |  4 ++--
 ...added-buffers-in-wl_shm-buffer-creat.patch |  5 +----
 ....bb => gstreamer1.0-plugins-bad_1.28.4.bb} |  2 +-
 ...et-caps-from-src-pad-when-query-caps.patch |  6 +++---
 ...parse-enhance-SSA-text-lines-parsing.patch |  2 +-
 ...iv-fb-Make-sure-config.h-is-included.patch |  2 +-
 ...bb => gstreamer1.0-plugins-base_1.28.4.bb} |  2 +-
 ...bb => gstreamer1.0-plugins-good_1.28.4.bb} |  2 +-
 ...bb => gstreamer1.0-plugins-ugly_1.28.4.bb} |  2 +-
 ....bb => gstreamer1.0-rtsp-server_1.28.4.bb} |  2 +-
 14 files changed, 27 insertions(+), 31 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.28.2.bb => gst-examples_1.28.4.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.28.2.bb => gstreamer1.0-plugins-bad_1.28.4.bb} (99%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.28.2.bb => gstreamer1.0-plugins-base_1.28.4.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.28.2.bb => gstreamer1.0-plugins-good_1.28.4.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.28.2.bb => gstreamer1.0-plugins-ugly_1.28.4.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.28.2.bb => gstreamer1.0-rtsp-server_1.28.4.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
index e12ca0b613..e7862b40e7 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
@@ -1,4 +1,4 @@
-From 7924016fce2d0b435891a335cdae52fc939c7e3b Mon Sep 17 00:00:00 2001
+From 75ff9436c9ff965327d6dad256c0a1539435b13a Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Thu, 17 Aug 2017 11:07:02 +0300
 Subject: [PATCH] Make player examples installable
@@ -7,16 +7,15 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Upstream-Status: Denied [Upstream considers these code examples, for now a least]
 
 https://bugzilla.gnome.org/show_bug.cgi?id=777827
-
 ---
  playback/player/gst-play/meson.build | 1 +
  playback/player/gtk/meson.build      | 1 +
  2 files changed, 2 insertions(+)
 
-Index: gst-examples/playback/player/gst-play/meson.build
-===================================================================
---- gst-examples.orig/playback/player/gst-play/meson.build
-+++ gst-examples/playback/player/gst-play/meson.build
+diff --git a/playback/player/gst-play/meson.build b/playback/player/gst-play/meson.build
+index 5e80ca8dd4..129e5bdcbe 100644
+--- a/playback/player/gst-play/meson.build
++++ b/playback/player/gst-play/meson.build
 @@ -2,5 +2,6 @@ executable('gst-play',
      ['gst-play.c',
       'gst-play-kb.c',
@@ -24,11 +23,11 @@ Index: gst-examples/playback/player/gst-play/meson.build
 +    install: true,
      dependencies : [gst_dep, dependency('gstreamer-play-1.0'), m_dep])
  
-Index: gst-examples/playback/player/gtk/meson.build
-===================================================================
---- gst-examples.orig/playback/player/gtk/meson.build
-+++ gst-examples/playback/player/gtk/meson.build
-@@ -20,5 +20,6 @@ if gtk_dep.found()
+diff --git a/playback/player/gtk/meson.build b/playback/player/gtk/meson.build
+index 6892f15254..20d7505877 100644
+--- a/playback/player/gtk/meson.build
++++ b/playback/player/gtk/meson.build
+@@ -21,5 +21,6 @@ if gtk_dep.found()
         'gtk-video-renderer.h',
         'gtk-video-renderer.c'],
        c_args :  extra_c_args,
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.28.4.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.28.2.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.28.4.bb
index 304d71b637..ad6374d3fb 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.28.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.28.4.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gstreamer.git;protocol=https;b
            file://gst-player.desktop \
            "
 
-SRCREV = "43421c2a5b8ac5cceb52b11749df40301e1de5c0"
+SRCREV = "b46f881eaa8126eddfd21b5ae5512f8d4ff36255"
 
 S = "${UNPACKDIR}/${BP}/subprojects/gst-examples"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
index 307d669645..f5eb011ffa 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
@@ -1,4 +1,4 @@
-From d24bb949e547a0ad69f3f47e4cf262a75bb9fe73 Mon Sep 17 00:00:00 2001
+From bcc4c0d84f573e5d53195a726b475d818759550d Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 26 Jan 2016 15:16:01 -0800
 Subject: [PATCH] fix maybe-uninitialized warnings when compiling with -Os
@@ -11,7 +11,7 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gst-libs/gst/codecparsers/gstvc1parser.c b/gst-libs/gst/codecparsers/gstvc1parser.c
-index ac8c378..3fc5298 100644
+index d91cc3f..c9058cd 100644
 --- a/gst-libs/gst/codecparsers/gstvc1parser.c
 +++ b/gst-libs/gst/codecparsers/gstvc1parser.c
 @@ -1732,7 +1732,7 @@ gst_vc1_parse_sequence_layer (const guint8 * data, gsize size,
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
index 7da8994e3d..ed0a248381 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
@@ -1,4 +1,4 @@
-From 728238129a8a91cad857023d2e7131591321409d Mon Sep 17 00:00:00 2001
+From 86d9fc16f8d165e79d29ab1130e08663502dcd25 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Wed, 3 Feb 2016 18:05:41 -0800
 Subject: [PATCH] avoid including <sys/poll.h> directly
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
index 1edcf07c14..78981c0371 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
@@ -1,4 +1,4 @@
-From 8f7a1c5591e27681f294ae5edf0f32689198abff Mon Sep 17 00:00:00 2001
+From 08cf48c1ad094a522b558f10d24d4aec670dcc88 Mon Sep 17 00:00:00 2001
 From: Andrey Zhizhikin <andrey.z@gmail.com>
 Date: Mon, 27 Jan 2020 10:22:35 +0000
 Subject: [PATCH] opencv: resolve missing opencv data dir in yocto build
@@ -17,7 +17,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/gst-libs/gst/opencv/meson.build b/gst-libs/gst/opencv/meson.build
-index 64e913e..42a0958 100644
+index 60cb12b..4046b70 100644
 --- a/gst-libs/gst/opencv/meson.build
 +++ b/gst-libs/gst/opencv/meson.build
 @@ -61,6 +61,9 @@ gstopencv_cargs += ['-DOPENCV_PREFIX="' + opencv_prefix + '"']
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch
index 2bb00e2b1d..97b138a660 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch
@@ -1,4 +1,4 @@
-From 2af4bc8562f970207e3b1f6fc0b377ecf116a69c Mon Sep 17 00:00:00 2001
+From 8ff54f765defbb343340da5de3cf5c89e400a8ff Mon Sep 17 00:00:00 2001
 From: Tushar Darote <tdarote@qti.qualcomm.com>
 Date: Mon, 8 Jun 2026 18:05:51 +0530
 Subject: [PATCH] wayland: handle padded buffers in wl_shm buffer creation
@@ -233,6 +233,3 @@ index 3c5c3cc..cd9c964 100644
  
      g_object_unref (alloc);
    }
--- 
-2.34.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.4.bb
similarity index 99%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.4.bb
index 72f2cc7342..e224112d34 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.4.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            file://0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch \
            "
-SRC_URI[sha256sum] = "6467e3964828f4d7d08bfe1fbb4d76287a1c8fa76674e59e101a149c020fefd7"
+SRC_URI[sha256sum] = "332b7320f30c60f2d5941446d03b9d05e3781f2c2561befbe88718bd777f0e47"
 
 S = "${UNPACKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
index 719c73d3e3..635c801cdc 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
@@ -1,4 +1,4 @@
-From a37f0063103e98f5109132ea302b919b92e26a38 Mon Sep 17 00:00:00 2001
+From ae52c483980409c64b8bdd0c7b794533bcc0fec8 Mon Sep 17 00:00:00 2001
 From: zhouming <b42586@freescale.com>
 Date: Wed, 14 May 2014 10:16:20 +0800
 Subject: [PATCH] ENGR00312515: get caps from src pad when query caps
@@ -16,10 +16,10 @@ Signed-off-by: zhouming <b42586@freescale.com>
 diff --git a/gst-libs/gst/tag/gsttagdemux.c b/gst-libs/gst/tag/gsttagdemux.c
 old mode 100644
 new mode 100755
-index 975fe83..df82840
+index 16bf001..e17a144
 --- a/gst-libs/gst/tag/gsttagdemux.c
 +++ b/gst-libs/gst/tag/gsttagdemux.c
-@@ -1796,6 +1796,19 @@ gst_tag_demux_pad_query (GstPad * pad, GstObject * parent, GstQuery * query)
+@@ -1797,6 +1797,19 @@ gst_tag_demux_pad_query (GstPad * pad, GstObject * parent, GstQuery * query)
        }
        break;
      }
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
index bf1e2a89e3..4ce9f30d6a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
@@ -1,4 +1,4 @@
-From f892f0be8ae88acc6482f4b9a9a4db5f03b7adf8 Mon Sep 17 00:00:00 2001
+From 748c467f40d3f0072d9c139f9fdbbfdd56655c1e Mon Sep 17 00:00:00 2001
 From: Mingke Wang <mingke.wang@freescale.com>
 Date: Thu, 19 Mar 2015 14:17:10 +0800
 Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
index 1a988b99de..a824235731 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
@@ -1,4 +1,4 @@
-From 6f06f4b2f13f028250189225a46a39f402428930 Mon Sep 17 00:00:00 2001
+From 207df05a877717b1dd93a3a5903f0c58dd74c925 Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <crg7475@mailbox.org>
 Date: Tue, 21 May 2019 14:01:11 +0200
 Subject: [PATCH] viv-fb: Make sure config.h is included
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.4.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.4.bb
index 79cc4f312d..d9f85417cd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.4.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "4db76b3619280037a4047de7d9dbb38613a4272dcc40efb333257124635a888d"
+SRC_URI[sha256sum] = "a898afd5766172b0049e6781558e0689098bf87b9d82b846c652e571c01d60d8"
 
 S = "${UNPACKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.4.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.4.bb
index 366eb8189c..9194cae297 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.4.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "1ace2d8ec74f632d82eab5006753a27fe0c2402db4ca94d63271e494b62f50bf"
+SRC_URI[sha256sum] = "c825ea737c59cea0e4a0c41da2388045ff5dd32d162220ac93a7a82ee4a04e61"
 
 S = "${UNPACKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.4.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.4.bb
index 1f3df47303..4c0811a056 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.4.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "fe39a5ee7115e37de9eb65d899ec84c93e6e26ed3ffe25c6d5176cececbab572"
+SRC_URI[sha256sum] = "5486cd145c5af43259fd37caca59d048e2a67ddb07082ea8f50ef0f02a85f8a5"
 
 S = "${UNPACKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.4.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.4.bb
index 755c0c7d56..338cf85e5e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.4.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "917c58b9ff14f91a6b5cd1c3af16c9fcfdf5d8d78d3d167c7e8fa5bdda35f947"
+SRC_URI[sha256sum] = "bfb6780542bf0d402736232aeae6c5a1b943c445775bf40305bcb86ca70705a0"
 
 S = "${UNPACKDIR}/${PNREAL}-${PV}"
 

