Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB98CC61DFB
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:22 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2984.1787945902188393967
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vS7BlAhX;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49557167508so12998275e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945900; x=1788550700; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8nBJ1Py6sDgs35EuS8nRC0VRMgrihaLIKH6yEWEm1JM=;
        b=vS7BlAhXopii8YyqqdF0MvJzC9wleSiVqAWM4dyG5us6hsCf2lk9VUBKAOR+E1/il7
         EK6e++EeiiNJd//cNZHDAF7PkKrYwjFISi6hqd3vjC1uHXH0TOU5ZfSOjGGOP7iDBV3H
         srqZMwXZ2bVcYQ80AtAPzFIZcHoWeEdg8jj0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945900; x=1788550700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8nBJ1Py6sDgs35EuS8nRC0VRMgrihaLIKH6yEWEm1JM=;
        b=fS2+88hOZHw+LQvQ8r1rbJtfNmm933RgptS4hzdWnKGrp5WgngAwaNTuNOXcD5W7ll
         JjcZE01BOq5kNSLok1slm1tgCcPNhkYG2wCgrFXW0LxAeuu6HDOMD3ShUXyvPKZDQ+78
         OpYG9X2Qsh3Yd1tdAF4uZI3wF51+d4C8ZkV0pV/NKadlp/2m5bLqH+Sz39txAbJPECjq
         wcUyv3glE6G2xjMve0OTvmJg0LHAxJ6rgsCmrYNTnMNxpl+Za3ZMK1Mw/g3A+hHJ+EsY
         1eg2aNI1K6lOf9fmprkjD4wpll0fptJrhSNVYgJClF4Zd2g511ljPrRHLPrLQgDpwLio
         WY/w==
X-Gm-Message-State: AFuF++k7DVbu4O1lksXPXrf7MqltTOxjB7keeE3ETLVRsGzK8FhAQpOQ
	xN2GPwQvQpd6C4loS+R/yU+tB2yzRun25n5T+4a9LV3rV/GJCIJBEk0GofOVzZfWhILYNSu/Fzp
	04lXeqXU=
X-Gm-Gg: AR+sD10xhpKflQHGpfMRWX2oKW8hi1lBDJIQbSGQrMJZk3dV8XrEH/v7NGZp9WLuY64
	C3fWXfs1T2+686q5PIkM2PbRPp21K1AG4/LuhQSKKkFGQZkCcgkEa4JRJfgV+0gWxsvBKPgLzLO
	NUKByVNiIvC5udy/m+/Ptq/Ai7fN0v40wQMKnZDg3uo4ZGI66MJBY81uDbeeB2jyAk+HastZLW7
	ikpIqD3J+iwWMlec30rf0PmvX/t2tszgNvQLydA/i1ArN7XHqRZLbHYWmro/iuNU8J0RIHDFlkO
	2dI9+Oz9gpfylwklWpJTcV8FSv7kMPD2ritAxs8cVK1Tr0D3GMtuwdBl31E5sho49nWovGbdrVy
	X5/RYV9J6rfLegXJd0FZSkYc1hdT3hZriraKvf8TQ5B3sFxy8BMpcwKsWUU1/3yeWpBKW1hkCM7
	YEi6flfF13Q9s2pnmIZWqeOEaM2gDkvg2TLX8DUn9wv/aPtd43NcZkVvlNp2qc9eGmxoV6IjfW5
	iJ8VX4Lutw7Pn6hxp7t5dWGvpS6LktWZDzHmpfeK50zizIoatixV3cSJXCzsmXo
X-Received: by 2002:a05:600c:3144:b0:49c:c9ac:a4f3 with SMTP id 5b1f17b1804b1-49cc9acc59amr42052065e9.1.1787945900365;
        Fri, 28 Aug 2026 12:38:20 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:20 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 28/56] gstreamer1.0: upgrade 1.28.2 -> 1.28.4 (the remaining pieces)
Date: Fri, 28 Aug 2026 21:35:38 +0200
Message-ID: <810339318721e08a69231c475153cef2e74fe131.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244589

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
((From OE-Core rev: 430c35bc1e4358173ab3b6d1e2e5e94f58357359)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
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
index e12ca0b613d..e7862b40e79 100644
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
index 304d71b6377..ad6374d3fb3 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.28.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.28.4.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gstreamer.git;protocol=https;b
            file://gst-player.desktop \
            "
 
-SRCREV = "43421c2a5b8ac5cceb52b11749df40301e1de5c0"
+SRCREV = "b46f881eaa8126eddfd21b5ae5512f8d4ff36255"
 
 S = "${UNPACKDIR}/${BP}/subprojects/gst-examples"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
index 307d6696451..f5eb011ffad 100644
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
index 7da8994e3d9..ed0a248381d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
@@ -1,4 +1,4 @@
-From 728238129a8a91cad857023d2e7131591321409d Mon Sep 17 00:00:00 2001
+From 86d9fc16f8d165e79d29ab1130e08663502dcd25 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Wed, 3 Feb 2016 18:05:41 -0800
 Subject: [PATCH] avoid including <sys/poll.h> directly
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
index 1edcf07c146..78981c03714 100644
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
index 2bb00e2b1d9..97b138a660c 100644
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
index 72f2cc73424..e224112d34c 100644
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
index 719c73d3e35..635c801cdc7 100644
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
index bf1e2a89e3b..4ce9f30d6a3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
@@ -1,4 +1,4 @@
-From f892f0be8ae88acc6482f4b9a9a4db5f03b7adf8 Mon Sep 17 00:00:00 2001
+From 748c467f40d3f0072d9c139f9fdbbfdd56655c1e Mon Sep 17 00:00:00 2001
 From: Mingke Wang <mingke.wang@freescale.com>
 Date: Thu, 19 Mar 2015 14:17:10 +0800
 Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
index 1a988b99de3..a824235731f 100644
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
index 79cc4f312d9..d9f85417cd8 100644
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
index 366eb8189cc..9194cae297e 100644
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
index 1f3df47303f..4c0811a0561 100644
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
index 755c0c7d56b..338cf85e5e9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.4.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "917c58b9ff14f91a6b5cd1c3af16c9fcfdf5d8d78d3d167c7e8fa5bdda35f947"
+SRC_URI[sha256sum] = "bfb6780542bf0d402736232aeae6c5a1b943c445775bf40305bcb86ca70705a0"
 
 S = "${UNPACKDIR}/${PNREAL}-${PV}"
 

