Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15227.1794778877892928772
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 13:41:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=pHWl3Hkk;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202611152141164c448f6521000207dd-fvrzf8@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202611152141164c448f6521000207dd
        for <openembedded-core@lists.openembedded.org>;
        Sun, 15 Nov 2026 22:41:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=z0KvuRugiiKJAYCjySIH8m2ktmBXXXzzT7dtI4YAMJI=;
 b=pHWl3HkkiXiLRXgUA/eNvxvo0uuiDhGiySqBdt6XfXxZCtayH6uEK1c9lOo7rEM1G7LrYE
 IV4RQVC9q6e9q/v0kDO5CkGoF1xj0eI2n3sOWE2/Mq+lW8CyX/rhit5l7EuhK1oPrUV0ybvw
 0jrcZyyyRdEu7bjm7DRRLorWCYVg3JVen5Fp9jEt0Tcdy97TyOKQTFLQRH9kW4PUA8lhwxb+
 NF3AO0Z4QE0QuN3ZBouerhI+T56hCytPVihngKnuUobkjicJ9tl5fFBpE/ZwpOmFIxWIoxOb
 BGqbv/v3dikpYUkVKkpctPXfJpl8xAm+/fePN+beon/+Ei5wolnLosDA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [blacksail][PATCH 2/7] gstreamer1.0*: upgrade 1.28.7 -> 1.28.9
Date: Sun, 15 Nov 2026 22:39:27 +0100
Message-ID: <20261115213932.1652076-2-peter.marko@siemens.com>
In-Reply-To: <20261115213932.1652076-1-peter.marko@siemens.com>
References: <20261115213932.1652076-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 21:41:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250284
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Copy current master state to blacksail.
Exception is reverting adc56614a23e211e5a08124d2096359bd39e6a6c.
Reason is that for some AUH updates each recipe alone instead of doing a
single commit for all parts. That would be 21 commits to pick.

Release notes:
* https://gstreamer.freedesktop.org/releases/1.28/#1.28.8
  * CVE-2026-86476, CVE-2026-112214, CVE-2026-111183, CVE-2026-116612
* https://gstreamer.freedesktop.org/releases/1.28/#1.28.9
  * CVE-2026-121601, CVE-2026-121611, CVE-2026-119610, CVE-2026-116611,
    CVE-2026-121629, CVE-2026-100231 and 3 pending CVE requests

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...1-connect-has-a-different-signature-on-musl.patch |  2 +-
 ...gst-devtools_1.28.7.bb => gst-devtools_1.28.9.bb} |  2 +-
 .../0001-Make-player-examples-installable.patch      |  6 +++---
 ...es-gtk-show-player-warnings-in-a-dialog-box.patch |  4 ++--
 ...gst-examples_1.28.7.bb => gst-examples_1.28.9.bb} |  2 +-
 ...-libav_1.28.7.bb => gstreamer1.0-libav_1.28.9.bb} |  2 +-
 ...-uninitialized-warnings-when-compiling-with.patch |  6 +++---
 .../0002-avoid-including-sys-poll.h-directly.patch   |  4 ++--
 ...solve-missing-opencv-data-dir-in-yocto-buil.patch |  4 ++--
 ...andle-padded-buffers-in-wl_shm-buffer-creat.patch | 12 ++++++------
 ..._1.28.7.bb => gstreamer1.0-plugins-bad_1.28.9.bb} |  2 +-
 ...12515-get-caps-from-src-pad-when-query-caps.patch |  4 ++--
 ...002-ssaparse-enhance-SSA-text-lines-parsing.patch |  4 ++--
 .../0003-viv-fb-Make-sure-config.h-is-included.patch |  4 ++--
 ...1.28.7.bb => gstreamer1.0-plugins-base_1.28.9.bb} |  2 +-
 ...1.28.7.bb => gstreamer1.0-plugins-good_1.28.9.bb} |  2 +-
 ...1.28.7.bb => gstreamer1.0-plugins-ugly_1.28.9.bb} |  2 +-
 ...ython_1.28.7.bb => gstreamer1.0-python_1.28.9.bb} |  2 +-
 ..._1.28.7.bb => gstreamer1.0-rtsp-server_1.28.9.bb} |  2 +-
 ...ests-respect-the-idententaion-used-in-meson.patch |  2 +-
 ...002-tests-add-support-for-install-the-tests.patch |  4 ++--
 ...03-tests-use-a-dictionaries-for-environment.patch |  2 +-
 ...dd-helper-script-to-run-the-installed_tests.patch |  2 +-
 ...gstreamer1.0_1.28.7.bb => gstreamer1.0_1.28.9.bb} |  2 +-
 24 files changed, 40 insertions(+), 40 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.28.7.bb => gst-devtools_1.28.9.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.28.7.bb => gst-examples_1.28.9.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.28.7.bb => gstreamer1.0-libav_1.28.9.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.28.7.bb => gstreamer1.0-plugins-bad_1.28.9.bb} (99%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.28.7.bb => gstreamer1.0-plugins-base_1.28.9.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.28.7.bb => gstreamer1.0-plugins-good_1.28.9.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.28.7.bb => gstreamer1.0-plugins-ugly_1.28.9.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.28.7.bb => gstreamer1.0-python_1.28.9.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.28.7.bb => gstreamer1.0-rtsp-server_1.28.9.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.28.7.bb => gstreamer1.0_1.28.9.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
index 3f07a429e0b..2b23d0f0ec2 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
@@ -1,4 +1,4 @@
-From 80ad3bf3c51cf013480777db355504c4308d9030 Mon Sep 17 00:00:00 2001
+From b40b6d73c2ec97a8e6a7ebaa54446be204927b64 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 9 Sep 2018 17:38:10 -0700
 Subject: [PATCH] connect has a different signature on musl
diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.7.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.9.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.28.7.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.28.9.bb
index ec07499f671..515afed6bed 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.9.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "9f3a389d6a7efa5a18d7564724a7f3b1c3faecffcb8fd1351ed0e811d1873ad5"
+SRC_URI[sha256sum] = "cfe8ae964fb394e03fd66b831daba08e0b5d1fb7d8bf047ade351afcb5855eaf"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
index 72fe5a26aae..0d29fca0fd8 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
@@ -1,4 +1,4 @@
-From c93f7aba35171abfc913684a26f85a03714e2a4c Mon Sep 17 00:00:00 2001
+From 7457c8c6e68673db5f059c8a3f2aad2b48d05f26 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Thu, 17 Aug 2017 11:07:02 +0300
 Subject: [PATCH] Make player examples installable
@@ -13,7 +13,7 @@ https://bugzilla.gnome.org/show_bug.cgi?id=777827
  2 files changed, 2 insertions(+)
 
 diff --git a/subprojects/gst-examples/playback/player/gst-play/meson.build b/subprojects/gst-examples/playback/player/gst-play/meson.build
-index 5e80ca8dd4a8..129e5bdcbe3d 100644
+index 5e80ca8dd4..129e5bdcbe 100644
 --- a/subprojects/gst-examples/playback/player/gst-play/meson.build
 +++ b/subprojects/gst-examples/playback/player/gst-play/meson.build
 @@ -2,5 +2,6 @@ executable('gst-play',
@@ -24,7 +24,7 @@ index 5e80ca8dd4a8..129e5bdcbe3d 100644
      dependencies : [gst_dep, dependency('gstreamer-play-1.0'), m_dep])
  
 diff --git a/subprojects/gst-examples/playback/player/gtk/meson.build b/subprojects/gst-examples/playback/player/gtk/meson.build
-index 6892f152544f..20d7505877c2 100644
+index 6892f15254..20d7505877 100644
 --- a/subprojects/gst-examples/playback/player/gtk/meson.build
 +++ b/subprojects/gst-examples/playback/player/gtk/meson.build
 @@ -21,5 +21,6 @@ if gtk_dep.found()
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples/0002-examples-gtk-show-player-warnings-in-a-dialog-box.patch b/meta/recipes-multimedia/gstreamer/gst-examples/0002-examples-gtk-show-player-warnings-in-a-dialog-box.patch
index 6c02d8d71fe..27755817d5d 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples/0002-examples-gtk-show-player-warnings-in-a-dialog-box.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-examples/0002-examples-gtk-show-player-warnings-in-a-dialog-box.patch
@@ -1,4 +1,4 @@
-From 1609881b8d1246e85d9eb68275d54d28e2170301 Mon Sep 17 00:00:00 2001
+From 98ac96c420e22a226ca5ba4486ae89fcb35ddf87 Mon Sep 17 00:00:00 2001
 From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
 Date: Tue, 25 Aug 2026 11:03:34 +0200
 Subject: [PATCH] examples: gtk: show player warnings in a dialog box
@@ -13,7 +13,7 @@ Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
  1 file changed, 20 insertions(+)
 
 diff --git a/subprojects/gst-examples/playback/player/gtk/gtk-play.c b/subprojects/gst-examples/playback/player/gtk/gtk-play.c
-index fb83f6be29c5..2310c716f2e9 100644
+index fb83f6be29..2310c716f2 100644
 --- a/subprojects/gst-examples/playback/player/gtk/gtk-play.c
 +++ b/subprojects/gst-examples/playback/player/gtk/gtk-play.c
 @@ -88,6 +88,7 @@ typedef struct
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.28.7.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.28.9.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.28.7.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.28.9.bb
index 9a4c73f092f..dadca1d0d1b 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.28.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.28.9.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gstreamer.git;protocol=https;b
            file://gst-player.desktop \
            "
 
-SRCREV = "070125524a8422e29d3b69a372ed4f62fd343ffa"
+SRCREV = "3ced45da096032bdac8e0922faa492a079c3180e"
 
 S = "${UNPACKDIR}/${BP}/subprojects/gst-examples"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.9.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.9.bb
index 0eb98da0215..bc4394acd46 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.9.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "58da51dd39ecf1cf6faade34cc6412001be2e2e145bca8ae0f45336f60a36ab2"
+SRC_URI[sha256sum] = "4b3df21fa70972a80891d2298cf32c14a62c3db4483d545c7ac018230399186b"
 
 S = "${UNPACKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
index 39219f3f24d..8d794995e97 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
@@ -1,4 +1,4 @@
-From 82e81317ef3dc7c12d6a75a9bc3cbdfedafcbdb4 Mon Sep 17 00:00:00 2001
+From 47361b23b7e1add34cd53993654c686b332768a4 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 26 Jan 2016 15:16:01 -0800
 Subject: [PATCH] fix maybe-uninitialized warnings when compiling with -Os
@@ -11,10 +11,10 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gst-libs/gst/codecparsers/gstvc1parser.c b/gst-libs/gst/codecparsers/gstvc1parser.c
-index d91cc3feb481..c9058cdcbd44 100644
+index 30f5818..764dca3 100644
 --- a/gst-libs/gst/codecparsers/gstvc1parser.c
 +++ b/gst-libs/gst/codecparsers/gstvc1parser.c
-@@ -1732,7 +1732,7 @@ gst_vc1_parse_sequence_layer (const guint8 * data, gsize size,
+@@ -1746,7 +1746,7 @@ gst_vc1_parse_sequence_layer (const guint8 * data, gsize size,
      GstVC1SeqLayer * seqlayer)
  {
    guint32 tmp;
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
index b9a8315ba2f..674ac87f034 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
@@ -1,4 +1,4 @@
-From c35690641af3eac21dcb7a010620e7fbd8ad975c Mon Sep 17 00:00:00 2001
+From b3bc02f6f6d6dfc4623f9065acdaae729363f9d2 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Wed, 3 Feb 2016 18:05:41 -0800
 Subject: [PATCH] avoid including <sys/poll.h> directly
@@ -13,7 +13,7 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/sys/dvb/gstdvbsrc.c b/sys/dvb/gstdvbsrc.c
-index ef565f7dcb60..625442066533 100644
+index ef565f7..6254420 100644
 --- a/sys/dvb/gstdvbsrc.c
 +++ b/sys/dvb/gstdvbsrc.c
 @@ -98,7 +98,7 @@
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
index 640a5dcd870..00673f82d5e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
@@ -1,4 +1,4 @@
-From 566c97e20bf023278db486ab07f13a4217358a6e Mon Sep 17 00:00:00 2001
+From dca05b750039f9b80083d4bfc0dd2f379bfaa51e Mon Sep 17 00:00:00 2001
 From: Andrey Zhizhikin <andrey.z@gmail.com>
 Date: Mon, 27 Jan 2020 10:22:35 +0000
 Subject: [PATCH] opencv: resolve missing opencv data dir in yocto build
@@ -17,7 +17,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/gst-libs/gst/opencv/meson.build b/gst-libs/gst/opencv/meson.build
-index 4ddf71f9f823..1fd341c9ad79 100644
+index 4ddf71f..1fd341c 100644
 --- a/gst-libs/gst/opencv/meson.build
 +++ b/gst-libs/gst/opencv/meson.build
 @@ -64,6 +64,9 @@ gstopencv_cargs += ['-DOPENCV_PREFIX="' + opencv_prefix + '"']
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch
index 01e9987e5fc..f90cf549232 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch
@@ -1,4 +1,4 @@
-From c1680a0a91fd383cfb918f3baf39434be75add36 Mon Sep 17 00:00:00 2001
+From c83922f6cd39bee9bba2c1a54e478e36f05d8dd0 Mon Sep 17 00:00:00 2001
 From: Tushar Darote <tdarote@qti.qualcomm.com>
 Date: Mon, 8 Jun 2026 18:05:51 +0530
 Subject: [PATCH] wayland: handle padded buffers in wl_shm buffer creation
@@ -30,7 +30,7 @@ Signed-off-by: Tushar Darote <tdarote@qti.qualcomm.com>
  5 files changed, 52 insertions(+), 35 deletions(-)
 
 diff --git a/ext/gtk/gstgtkwaylandsink.c b/ext/gtk/gstgtkwaylandsink.c
-index 7844645818b9..13d846e083cc 100644
+index 7844645..13d846e 100644
 --- a/ext/gtk/gstgtkwaylandsink.c
 +++ b/ext/gtk/gstgtkwaylandsink.c
 @@ -1179,7 +1179,6 @@ gst_gtk_wayland_sink_show_frame (GstVideoSink * vsink, GstBuffer * buffer)
@@ -73,7 +73,7 @@ index 7844645818b9..13d846e083cc 100644
  
          if (G_UNLIKELY (!wbuf))
 diff --git a/ext/wayland/gstwaylandsink.c b/ext/wayland/gstwaylandsink.c
-index 3aa454076609..0baafd7e453c 100644
+index 3aa4540..0baafd7 100644
 --- a/ext/wayland/gstwaylandsink.c
 +++ b/ext/wayland/gstwaylandsink.c
 @@ -1011,7 +1011,6 @@ gst_wayland_sink_show_frame (GstVideoSink * vsink, GstBuffer * buffer)
@@ -116,7 +116,7 @@ index 3aa454076609..0baafd7e453c 100644
  
          if (G_UNLIKELY (!wbuf))
 diff --git a/gst-libs/gst/wayland/gstwlshmallocator.c b/gst-libs/gst/wayland/gstwlshmallocator.c
-index 671f2b7295d4..11fb22c797b2 100644
+index 671f2b7..11fb22c 100644
 --- a/gst-libs/gst/wayland/gstwlshmallocator.c
 +++ b/gst-libs/gst/wayland/gstwlshmallocator.c
 @@ -76,32 +76,60 @@ gst_wl_shm_validate_video_info (const GstVideoInfo * vinfo)
@@ -206,7 +206,7 @@ index 671f2b7295d4..11fb22c797b2 100644
  
    return wbuffer;
 diff --git a/gst-libs/gst/wayland/gstwlshmallocator.h b/gst-libs/gst/wayland/gstwlshmallocator.h
-index 4309bd7f4950..38f3ba53eba3 100644
+index 4309bd7..38f3ba5 100644
 --- a/gst-libs/gst/wayland/gstwlshmallocator.h
 +++ b/gst-libs/gst/wayland/gstwlshmallocator.h
 @@ -33,7 +33,7 @@ GST_WL_API
@@ -219,7 +219,7 @@ index 4309bd7f4950..38f3ba53eba3 100644
  
  G_END_DECLS
 diff --git a/gst-libs/gst/wayland/gstwlwindow.c b/gst-libs/gst/wayland/gstwlwindow.c
-index 3c5c3cc017dd..cd9c964f7cfa 100644
+index 3c5c3cc..cd9c964 100644
 --- a/gst-libs/gst/wayland/gstwlwindow.c
 +++ b/gst-libs/gst/wayland/gstwlwindow.c
 @@ -985,9 +985,7 @@ gst_wl_window_update_borders (GstWlWindow * self)
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.9.bb
similarity index 99%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.9.bb
index de143b26a04..493acacb269 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.9.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            file://0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch \
            "
-SRC_URI[sha256sum] = "dc525383c18b2c265bbe6a43d498656cd918aaa130aa4e3abeabcdaa741c3ffe"
+SRC_URI[sha256sum] = "4a4e0b7bf84f868378c48f143a7ac3a98923b488a5b74f1a35ba46bc3c43f6b1"
 
 S = "${UNPACKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
index 342be9e38ec..5e41992d58b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
@@ -1,4 +1,4 @@
-From d130f609b6cd7281afa8704130251119d676b972 Mon Sep 17 00:00:00 2001
+From 09ed10895efd65740601a3f4d6f22484b722262c Mon Sep 17 00:00:00 2001
 From: zhouming <b42586@freescale.com>
 Date: Wed, 14 May 2014 10:16:20 +0800
 Subject: [PATCH] ENGR00312515: get caps from src pad when query caps
@@ -16,7 +16,7 @@ Signed-off-by: zhouming <b42586@freescale.com>
 diff --git a/gst-libs/gst/tag/gsttagdemux.c b/gst-libs/gst/tag/gsttagdemux.c
 old mode 100644
 new mode 100755
-index 16bf0015b64a..e17a14497a8e
+index 16bf001..e17a144
 --- a/gst-libs/gst/tag/gsttagdemux.c
 +++ b/gst-libs/gst/tag/gsttagdemux.c
 @@ -1797,6 +1797,19 @@ gst_tag_demux_pad_query (GstPad * pad, GstObject * parent, GstQuery * query)
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
index d91526c054c..548f7c310e1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
@@ -1,4 +1,4 @@
-From 253fe1cd715e9c25978e9157edcb16b0f09b3580 Mon Sep 17 00:00:00 2001
+From 415e22761bb952ff8bc01a91621461f68407b07d Mon Sep 17 00:00:00 2001
 From: Mingke Wang <mingke.wang@freescale.com>
 Date: Thu, 19 Mar 2015 14:17:10 +0800
 Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
@@ -17,7 +17,7 @@ Signed-off-by: Mingke Wang <mingke.wang@freescale.com>
 diff --git a/gst/subparse/gstssaparse.c b/gst/subparse/gstssaparse.c
 old mode 100644
 new mode 100755
-index c162a542f581..bd8afd93b5ea
+index c162a54..bd8afd9
 --- a/gst/subparse/gstssaparse.c
 +++ b/gst/subparse/gstssaparse.c
 @@ -304,6 +304,7 @@ gst_ssa_parse_remove_override_codes (GstSsaParse * parse, gchar * txt)
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
index e2a8ea9c7a6..9348c20e3bc 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
@@ -1,4 +1,4 @@
-From 603aea3d1907fff299d7ba3bfbd85d341b311947 Mon Sep 17 00:00:00 2001
+From 2d6669e7163322cccafd1ea0a6fae2eb7939b2f0 Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <crg7475@mailbox.org>
 Date: Tue, 21 May 2019 14:01:11 +0200
 Subject: [PATCH] viv-fb: Make sure config.h is included
@@ -13,7 +13,7 @@ Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
  1 file changed, 4 insertions(+)
 
 diff --git a/gst-libs/gst/gl/gl-prelude.h b/gst-libs/gst/gl/gl-prelude.h
-index 85fca5a0f4fd..946c7291351b 100644
+index 85fca5a..946c729 100644
 --- a/gst-libs/gst/gl/gl-prelude.h
 +++ b/gst-libs/gst/gl/gl-prelude.h
 @@ -22,6 +22,10 @@
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.9.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.9.bb
index cff54545e2e..0f7044b7adc 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.9.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "ed6e5410f496d171818763af2265e7977154bc7f9b827e98acf8c5bed21dd5a7"
+SRC_URI[sha256sum] = "c1fda668b520e6aef763c0eb962c032c9fe52bce322e8b00c69b4e9e847bddc1"
 
 S = "${UNPACKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.9.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.9.bb
index 027e7b34c94..70d88b7c0d0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.9.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "87256969c82cf3bc8574301f3e7044a90de0ac500a5a27d8ba38c4dde894dd8b"
+SRC_URI[sha256sum] = "e518cd97483706a252e95e60312a22d23dec6f5e7673af6f5bde719c3a9ca7f4"
 
 S = "${UNPACKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.9.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.9.bb
index 15962c14e8c..7ea8036a56e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.9.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "2b681170ddc22b6b283cafeed48f427c30a17056974a6a9ed137c354e0f7730c"
+SRC_URI[sha256sum] = "550a52536962186f5488e06b5c08f31ae0f18400aee32a3385156d31cb4b1189"
 
 S = "${UNPACKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.9.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.9.bb
index 1b17accd415..62b0c58b83a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.9.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "9c23c5dddfd2c9b94bb1b4e4f5b90ebc6400d84277c77cf91b1dbdb4a8b451f9"
+SRC_URI[sha256sum] = "e6ad2658fad5b96d99af72ceec7e48995ff792fbda438d34486d189ce047718a"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject gstreamer1.0-plugins-bad"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.9.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.9.bb
index 9c5ce9e59c0..b9db97451dd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.9.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "de43a59a0c89a14eb1c14ae8e81e5b45c4e9d7b1f930b0ebaad360f9b5e0b5c4"
+SRC_URI[sha256sum] = "b87ed564d857a226a3135bd2c42eae7b40eb64031cb9cbce124722af92cc8b9d"
 
 S = "${UNPACKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
index 61844d793aa..211dcdc5057 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
@@ -1,4 +1,4 @@
-From 27bae0561a09f06375c6c6d1d3fec2a142a1ca20 Mon Sep 17 00:00:00 2001
+From 3866886ce146491529ca290477c3edb9eab0add2 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: respect the idententaion used in meson
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
index 9752ebe921e..af5adbd7337 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
@@ -1,4 +1,4 @@
-From 00dad437c119cd23883cbef35d2a620ccdf3816b Mon Sep 17 00:00:00 2001
+From 633e0fdf280427c03df201df92d845e4046f4f9e Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: add support for install the tests
@@ -19,7 +19,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 tests/check/template.test.in
 
 diff --git a/meson.build b/meson.build
-index bffea3b..a51b1af 100644
+index ab64da1..1edc3da 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -665,6 +665,10 @@ if bashcomp_dep.found()
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
index 5637eff7a59..600eeac108e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
@@ -1,4 +1,4 @@
-From a686b15bf7ec5ca99467f138c57ebb17aa25c24f Mon Sep 17 00:00:00 2001
+From 6dc17915211d1d30ec118de118582df4a1f72d90 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 24 Apr 2021 10:34:47 +0100
 Subject: [PATCH] tests: use a dictionaries for environment
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
index eb14d519fe7..0b2f6b2ca36 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
@@ -1,4 +1,4 @@
-From e0290fc20f52ad7dfc21e8a572587ad826e5b32e Mon Sep 17 00:00:00 2001
+From b2427856fe10265ac71699020730306c1075ef0e Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 2 May 2021 01:58:01 +0100
 Subject: [PATCH] tests: add helper script to run the installed_tests
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb
index 0d1a931ceda..3a97ee009ec 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "787329b2c5758e228a71d926a6dcf960bceaacca3cadd63874ba665dfcda013e"
+SRC_URI[sha256sum] = "6dbf744f583131a34845cc641e803843766a9ba80ce00378a9043fd6d8d5fb38"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
