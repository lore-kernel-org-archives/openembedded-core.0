Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4912FC47089
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 13:56:03 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.91885.1669557358275385913
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 05:55:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=pbzMl7CP;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id b13-20020a17090a5a0d00b0021906102d05so6510952pjd.5
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=blaXB5uJ5TF2tTQge1Je5SKxFuWD2Y9LkSqabJV5tKg=;
        b=pbzMl7CPzkBew19YeWBx3LP+4YOgkxk2yV73DZEtFTna+avDvCsRPAQsKvjWsMUsAV
         wgccZOcyrgODyRZjw6C/DbjQ9pP7SSY4cin8/bBLYaHGgAKfP1cNIX8E5q39K2bDitTw
         kqAfv/OyVPiqJikepfNBGC5tVqUY1qBu9RHy01fncZkKRR5052ppeimTPp+Le4QebO6P
         vQJWdoFm+v3Oep7UfQJ4aFNPWNX+hCKXjLV1adYQImC0OidHYDnEat+9OvnxFNZ0E1DH
         L4hcZeBnYU4Ne3/SKfGSb+MP5TEYUk6QKwnf8AEqkodosF+W6MiJiOeK70Y8L+5fejy5
         jeQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=blaXB5uJ5TF2tTQge1Je5SKxFuWD2Y9LkSqabJV5tKg=;
        b=EAfDo9Yf2Rlaf1eIjg7i+3FMQBcHglGENbXakhaKmLmlHZe3g1dAIhjhdbpcGWFNjd
         KrJZrvUpB9p5FNNsuTVG5S5+lwwtnkoy06Zlz/lUrWQM+n1yjpnoggUDwzVgxWEMBBkB
         r2TeMcE5lRIlRdnWUSBmCZiQJ7EUKJtfgenkVPK7ph5WaBY9YmWEB4ONAaqhVQ1q+4Uu
         P8Jw2y3GlHitQuHu14PhGJgCAqtIMDemjEZQ8GY5+0bR21KBKm2brnGEo4nksoqY9iPM
         MBPqfDQK0xwDGzSHVLqiBR5YoYbTGi4spUYMPsGSEVCPW4AJ1LbIjAK+Nb5R9AtDqMxn
         TCxw==
X-Gm-Message-State: ANoB5pnTubJjIfFbqJR4srPT8dAtEtXPLIjeiPeRPnoKqD98LMJm3urb
	GmBQFafqSZyYLGHd3afQOyLp5d3ZCDk8lF881qo=
X-Google-Smtp-Source: AA0mqf7G1AybQ0iegDJxAAqrTVrJz8iKN9qZXqQ61rTg2eNXTZb/2Fbgh1Y2zc5GHE3jGRpiAJ2DdA==
X-Received: by 2002:a17:90a:460f:b0:218:c47f:ed9a with SMTP id w15-20020a17090a460f00b00218c47fed9amr30473667pjg.19.1669557357006;
        Sun, 27 Nov 2022 05:55:57 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902d48f00b001868bf6a7b8sm6910544plg.146.2022.11.27.05.55.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 05:55:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/31] gstreamer1.0: upgrade 1.20.3 -> 1.20.4
Date: Sun, 27 Nov 2022 03:55:00 -1000
Message-Id: <cb8842b09959f4eefdc7d638a435db4361fd2441.1669557026.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669557026.git.steve@sakoman.com>
References: <cover.1669557026.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 13:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173859

From: Alexander Kanavin <alex.kanavin@gmail.com>

The fourth 1.20 bug-fix release (1.20.4) was released on 12 October 2022.

This release only contains bugfixes and it should be safe to upgrade from 1.20.x.

Highlighted bugfixes in 1.20.4

- avaudiodec: fix playback issue with WMA files, would throw an error at EOS with FFmpeg 5.x
- Fix deadlock when loading gst-editing-services plugin
- Fix input buffering capacity in live mode for aggregator, video/audio aggregator subclasses, muxers
- glimagesink: fix crash on Android
- subtitle handling and subtitle overlay fixes
- matroska-mux: allow width + height changes for avc3|hev1|vp8|vp9
- rtspsrc: fix control url handling for spec compliant servers and add fallback for incompliant servers
- WebRTC fixes
- RTP retransmission fixes
- video: fixes for formats with 4x subsampling and horizontal co-sited chroma (Y41B, YUV9, YVU9 and IYU9)
- macOS build and packaging fixes, in particular fix finding of gio modules on macOS for https/TLS support
- Fix consuming of the macOS package as a framework in XCode
- Performance improvements
- Miscellaneous bug fixes, memory leak fixes, and other stability and reliability improvements

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 58e4825328dafd7f593d9eb42be5506408627a31)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...tools_1.20.3.bb => gst-devtools_1.20.4.bb} |  2 +-
 ...r-APNG-encoder-property-registration.patch | 86 -------------------
 ...1.20.3.bb => gstreamer1.0-libav_1.20.4.bb} |  6 +-
 ...x_1.20.3.bb => gstreamer1.0-omx_1.20.4.bb} |  2 +-
 ....bb => gstreamer1.0-plugins-bad_1.20.4.bb} |  2 +-
 ...bb => gstreamer1.0-plugins-base_1.20.4.bb} |  2 +-
 ...bb => gstreamer1.0-plugins-good_1.20.4.bb} |  2 +-
 ...bb => gstreamer1.0-plugins-ugly_1.20.4.bb} |  2 +-
 ....20.3.bb => gstreamer1.0-python_1.20.4.bb} |  2 +-
 ....bb => gstreamer1.0-rtsp-server_1.20.4.bb} |  2 +-
 ...1.20.3.bb => gstreamer1.0-vaapi_1.20.4.bb} |  2 +-
 ...er1.0_1.20.3.bb => gstreamer1.0_1.20.4.bb} |  2 +-
 12 files changed, 12 insertions(+), 100 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.20.3.bb => gst-devtools_1.20.4.bb} (95%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-libav-Fix-for-APNG-encoder-property-registration.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.20.3.bb => gstreamer1.0-libav_1.20.4.bb} (82%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.20.3.bb => gstreamer1.0-omx_1.20.4.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.20.3.bb => gstreamer1.0-plugins-bad_1.20.4.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.20.3.bb => gstreamer1.0-plugins-base_1.20.4.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.20.3.bb => gstreamer1.0-plugins-good_1.20.4.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.20.3.bb => gstreamer1.0-plugins-ugly_1.20.4.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.20.3.bb => gstreamer1.0-python_1.20.4.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.20.3.bb => gstreamer1.0-rtsp-server_1.20.4.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.20.3.bb => gstreamer1.0-vaapi_1.20.4.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.20.3.bb => gstreamer1.0_1.20.4.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.3.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.20.3.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb
index c515e173c8..09b6e5a497 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "bbbd45ead703367ea8f4be9b3c082d7b62bef47b240a39083f27844e28758c47"
+SRC_URI[sha256sum] = "82a293600273f4dd3eed567aae510ca0c7d629c3807788b00e6cdbd1d2459a84"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-libav-Fix-for-APNG-encoder-property-registration.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-libav-Fix-for-APNG-encoder-property-registration.patch
deleted file mode 100644
index 526bbb0037..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-libav-Fix-for-APNG-encoder-property-registration.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From 78a97c1ec35ada76d83fc67d0549ba56c74d8875 Mon Sep 17 00:00:00 2001
-From: Seungha Yang <seungha@centricular.com>
-Date: Thu, 7 Jul 2022 22:16:30 +0900
-Subject: [PATCH] libav: Fix for APNG encoder property registration
-
-The AVClass name of Animated PNG in FFmpeg 5.x is "(A)PNG"
-and it will be converted to "-a-png" through
-g_ascii_strdown() and g_strcanon(). But GLib disallow leading '-'
-character for a GType name. Strip leading '-' to workaround it.
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/2724]
-
-Seungha Yangs patch was imported without modifications.
-
-Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
----
- ext/libav/gstavcfg.c | 29 +++++++++++++++++++++++------
- 1 file changed, 23 insertions(+), 6 deletions(-)
-
-diff --git a/ext/libav/gstavcfg.c b/ext/libav/gstavcfg.c
-index c736920..a8635a7 100644
---- a/ext/libav/gstavcfg.c
-+++ b/ext/libav/gstavcfg.c
-@@ -91,10 +91,19 @@ register_enum (const AVClass ** obj, const AVOption * top_opt)
-   gchar *lower_obj_name = g_ascii_strdown ((*obj)->class_name, -1);
-   gchar *enum_name = g_strdup_printf ("%s-%s", lower_obj_name, top_opt->unit);
-   gboolean none_default = TRUE;
-+  const gchar *enum_name_strip;
- 
-   g_strcanon (enum_name, G_CSET_a_2_z G_CSET_DIGITS, '-');
- 
--  if ((res = g_type_from_name (enum_name)))
-+  /* strip leading '-'s */
-+  enum_name_strip = enum_name;
-+  while (enum_name_strip[0] == '-')
-+    enum_name_strip++;
-+
-+  if (enum_name_strip[0] == '\0')
-+    goto done;
-+
-+  if ((res = g_type_from_name (enum_name_strip)))
-     goto done;
- 
-   while ((opt = av_opt_next (obj, opt))) {
-@@ -150,9 +159,8 @@ register_enum (const AVClass ** obj, const AVOption * top_opt)
-       }
-     }
- 
--    res =
--        g_enum_register_static (enum_name, &g_array_index (values, GEnumValue,
--            0));
-+    res = g_enum_register_static (enum_name_strip,
-+        &g_array_index (values, GEnumValue, 0));
- 
-     gst_type_mark_as_plugin_api (res, 0);
-   }
-@@ -177,10 +185,19 @@ register_flags (const AVClass ** obj, const AVOption * top_opt)
-   GArray *values = g_array_new (TRUE, TRUE, sizeof (GEnumValue));
-   gchar *lower_obj_name = g_ascii_strdown ((*obj)->class_name, -1);
-   gchar *flags_name = g_strdup_printf ("%s-%s", lower_obj_name, top_opt->unit);
-+  const gchar *flags_name_strip;
- 
-   g_strcanon (flags_name, G_CSET_a_2_z G_CSET_DIGITS, '-');
- 
--  if ((res = g_type_from_name (flags_name)))
-+  /* strip leading '-'s */
-+  flags_name_strip = flags_name;
-+  while (flags_name_strip[0] == '-')
-+    flags_name_strip++;
-+
-+  if (flags_name_strip[0] == '\0')
-+    goto done;
-+
-+  if ((res = g_type_from_name (flags_name_strip)))
-     goto done;
- 
-   while ((opt = av_opt_next (obj, opt))) {
-@@ -211,7 +228,7 @@ register_flags (const AVClass ** obj, const AVOption * top_opt)
-     g_array_sort (values, (GCompareFunc) cmp_flags_value);
- 
-     res =
--        g_flags_register_static (flags_name, &g_array_index (values,
-+        g_flags_register_static (flags_name_strip, &g_array_index (values,
-             GFlagsValue, 0));
- 
-     gst_type_mark_as_plugin_api (res, 0);
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb
similarity index 82%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb
index 7a2c0d1365..e23cf2e337 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb
@@ -11,10 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     file://ext/libav/gstav.h;beginline=1;endline=18;md5=a752c35267d8276fd9ca3db6994fca9c \
                     "
 
-SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz \
-           file://0001-libav-Fix-for-APNG-encoder-property-registration.patch \
-           "
-SRC_URI[sha256sum] = "3fedd10560fcdfaa1b6462cbf79a38c4e7b57d7f390359393fc0cef6dbf27dfe"
+SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
+SRC_URI[sha256sum] = "04ccbdd58fb31dd94098da599209834a0e7661638c5703381dd0a862c56fc532"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb
index fb48562a2b..4d63db89a7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "8db48040bb41f09edf8d17ff6d16c54888d7777ba4501c2c69f0083350ea9a15"
+SRC_URI[sha256sum] = "70ddd485e2dcab79070164d61ad2ff3a63e15a1d7abf9075d86eb77762b0edfd"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.4.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.4.bb
index 05de217c34..c83beb6632 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.4.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "7a11c13b55dd1d2386dd902219e41cbfcdda8e1e0aa3e738186c95074b35da4f"
+SRC_URI[sha256sum] = "a1a3f53b3604d9a04fdd0bf9a1a616c3d2dab5320489e9ecee1178e81e33a16a"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.4.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.4.bb
index 7eebbba949..a0f238a59d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.4.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "7e30b3dd81a70380ff7554f998471d6996ff76bbe6fc5447096f851e24473c9f"
+SRC_URI[sha256sum] = "8d181b7abe4caf23ee9f9ec5b4d3e232640452464e39495bfffb6d776fc97225"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.4.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.4.bb
index 0235935a4a..4a4672992e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.4.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            "
 
-SRC_URI[sha256sum] = "f8f3c206bf5cdabc00953920b47b3575af0ef15e9f871c0b6966f6d0aa5868b7"
+SRC_URI[sha256sum] = "b16130fbe632fa8547c2147a0ef575b0140fb521065c5cb121c72ddbd23b64da"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.4.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.4.bb
index ad7b84b5ab..94b8c8e2cf 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.4.bb
@@ -14,7 +14,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "8caa20789a09c304b49cf563d33cca9421b1875b84fcc187e4a385fa01d6aefd"
+SRC_URI[sha256sum] = "5c9ec6bab96517e438b3f9bae0ceb84d3436f3da9bbe180cf4d28e32a7251b59"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.4.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.4.bb
index 57026ba73b..b514989864 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.4.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "db348120eae955b8cc4de3560a7ea06e36d6e1ddbaa99a7ad96b59846601cfdc"
+SRC_URI[sha256sum] = "5eb4136d03e2a495f4499c8b2e6d9d3e7b5e73c5a8b8acf9213d57bc6a7bd3c1"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.4.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.4.bb
index fd4f82fcc3..4137b4993b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.4.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "ee402718be9b127f0e5e66ca4c1b4f42e4926ec93ba307b7ccca5dc6cc9794ca"
+SRC_URI[sha256sum] = "88d9ef634e59aeb8cc183ad5ae444557c5a88dd49d833b9072bc6e1fae6a3d7d"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb
index 6e580f9f79..81ec23d26e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "6ee99eb316abdde9ad37002915bd8c3867918f6fdc74b7cf2ac4c1ae0d690b45"
+SRC_URI[sha256sum] = "ab12596144c05506e9782374c5d2cdfb3069fca89908d6de360d947bb77fd06a"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.4.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.4.bb
index 1f4576c3e1..d0ba2919ee 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.4.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
            file://0005-tests-remove-gstbin-test_watch_for_state_change-test.patch \
            "
-SRC_URI[sha256sum] = "607daf64bbbd5fb18af9d17e21c0d22c4d702fffe83b23cb22d1b1af2ca23a2a"
+SRC_URI[sha256sum] = "67c1edf8c3c339cda5dde85f4f7b953bb9607c2d13ae970e2491c5c4c055ef5f"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.25.1


