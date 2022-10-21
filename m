Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE1CC433FE
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 13:16:57 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.9668.1666358211264996205
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 06:16:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Qf4zdngg;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id a13so5806416edj.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 06:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gn8ff5DZ0YyjG7Xf7vCbr4iY6sLW2DKcOD96ZfkWDeA=;
        b=Qf4zdnggfZR/HwHybx2l/nkXli6InncBDkYOyidl34Wj1z3ZpfunNpiM62aWk4lUGD
         0IfriFTkoHsgqJwlp/DDdvaFWaC75QoC4LOAeRgAWCDdOi/uWccijBxZ2K6zoxxsrjUe
         OG/Aqrjd4tLocfAuBdjV+ek9bhleTlXE+kKKBRACU3OA6Rc3CHzdqoUaJvD6DAMRHP95
         R8xhkc55YmBcEayBPJchTRtHml4Oyn3dLsmRm5OqbCkSPEY7l8iY1fEPurJdDzPmn2ft
         BOC9UzoNvLmw4oMBBByYJanMSM1AgHZ8OxIqNnvBQbYpNXqrwpfCRYaXfSz7UubB1Ap2
         YLvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gn8ff5DZ0YyjG7Xf7vCbr4iY6sLW2DKcOD96ZfkWDeA=;
        b=BglLy/XQf4x5FfSF0Zem+VsXBFUpxCAtvxyXoTsbf1mH8TE9juY9GP6AcrXgh7E8wl
         TDKOKDwBia3TXdcX+ZxMxXWSZO4l5SeFNwzU3P46QwU7rwUjBqVueWgB3fduERftStbY
         XTtdEH5uCHHmT2JNC7l2Es0Z2T/QvwrGyZlpqwcDgSTLMdVqh2sGXwQy/jP6M0VYIBfi
         ImFSBMslosSA7o6wL0SCkyqlKyurDuGdoAmHTXiq8JdWptWNjwmCEH615CUEV//6f1OI
         8nOnJDQw4yH4opTXPRx552J/+G/obRTbaJEDjLREXzbCTazcGlhGq0K7lZ0vc/7CTrdN
         yRQg==
X-Gm-Message-State: ACrzQf2lY2yVq+h3VAzx9+Wj0juiEQEja04ZvjKmBQJtV2/4X/iFDKrx
	8a2QpEe0Wmjh8G8jE9YYuZFqseCM8hA=
X-Google-Smtp-Source: AMsMyM4z89Q1R4AgHMLXm18D+5OeBqJHfbeAnu8WIjWSl07YSq0Wh7uTJblYmIxYqISUc4S+J0x8pA==
X-Received: by 2002:a17:907:1b12:b0:72f:9b44:f9e with SMTP id mp18-20020a1709071b1200b0072f9b440f9emr15264863ejc.653.1666358209408;
        Fri, 21 Oct 2022 06:16:49 -0700 (PDT)
Received: from localhost.localdomain ([77.243.43.130])
        by smtp.gmail.com with ESMTPSA id h11-20020a170906854b00b00782fbb7f5f7sm2185176ejy.113.2022.10.21.06.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 06:16:49 -0700 (PDT)
From: Claus Stovgaard <claus.stovgaard@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Claus Stovgaard <claus.stovgaard@gmail.com>
Subject: [master][kirkstone][PATCH] gstreamer1.0-libav: fix errors with ffmpeg 5.x
Date: Fri, 21 Oct 2022 15:16:39 +0200
Message-Id: <20221021131639.94436-1-claus.stovgaard@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 13:16:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172015

Backport of patch already present upstream to fix issues with invalid
characters for GLIB when combining gstreamer1.0-libav with ffmpeg 5.x.

Remove when gstreamer1.0-libav is upgraded to 1.21.1 or above

Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
---
 ...r-APNG-encoder-property-registration.patch | 82 +++++++++++++++++++
 .../gstreamer/gstreamer1.0-libav_1.20.3.bb    |  4 +-
 2 files changed, 85 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-libav-Fix-for-APNG-encoder-property-registration.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-libav-Fix-for-APNG-encoder-property-registration.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-libav-Fix-for-APNG-encoder-property-registration.patch
new file mode 100644
index 0000000000..bfb33a19d8
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-libav-Fix-for-APNG-encoder-property-registration.patch
@@ -0,0 +1,82 @@
+From 78a97c1ec35ada76d83fc67d0549ba56c74d8875 Mon Sep 17 00:00:00 2001
+From: Seungha Yang <seungha@centricular.com>
+Date: Thu, 7 Jul 2022 22:16:30 +0900
+Subject: [PATCH] libav: Fix for APNG encoder property registration
+
+The AVClass name of Animated PNG in FFmpeg 5.x is "(A)PNG"
+and it will be converted to "-a-png" through
+g_ascii_strdown() and g_strcanon(). But GLib disallow leading '-'
+character for a GType name. Strip leading '-' to workaround it.
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/2724]
+---
+ ext/libav/gstavcfg.c | 29 +++++++++++++++++++++++------
+ 1 file changed, 23 insertions(+), 6 deletions(-)
+
+diff --git a/ext/libav/gstavcfg.c b/ext/libav/gstavcfg.c
+index c736920..a8635a7 100644
+--- a/ext/libav/gstavcfg.c
++++ b/ext/libav/gstavcfg.c
+@@ -91,10 +91,19 @@ register_enum (const AVClass ** obj, const AVOption * top_opt)
+   gchar *lower_obj_name = g_ascii_strdown ((*obj)->class_name, -1);
+   gchar *enum_name = g_strdup_printf ("%s-%s", lower_obj_name, top_opt->unit);
+   gboolean none_default = TRUE;
++  const gchar *enum_name_strip;
+ 
+   g_strcanon (enum_name, G_CSET_a_2_z G_CSET_DIGITS, '-');
+ 
+-  if ((res = g_type_from_name (enum_name)))
++  /* strip leading '-'s */
++  enum_name_strip = enum_name;
++  while (enum_name_strip[0] == '-')
++    enum_name_strip++;
++
++  if (enum_name_strip[0] == '\0')
++    goto done;
++
++  if ((res = g_type_from_name (enum_name_strip)))
+     goto done;
+ 
+   while ((opt = av_opt_next (obj, opt))) {
+@@ -150,9 +159,8 @@ register_enum (const AVClass ** obj, const AVOption * top_opt)
+       }
+     }
+ 
+-    res =
+-        g_enum_register_static (enum_name, &g_array_index (values, GEnumValue,
+-            0));
++    res = g_enum_register_static (enum_name_strip,
++        &g_array_index (values, GEnumValue, 0));
+ 
+     gst_type_mark_as_plugin_api (res, 0);
+   }
+@@ -177,10 +185,19 @@ register_flags (const AVClass ** obj, const AVOption * top_opt)
+   GArray *values = g_array_new (TRUE, TRUE, sizeof (GEnumValue));
+   gchar *lower_obj_name = g_ascii_strdown ((*obj)->class_name, -1);
+   gchar *flags_name = g_strdup_printf ("%s-%s", lower_obj_name, top_opt->unit);
++  const gchar *flags_name_strip;
+ 
+   g_strcanon (flags_name, G_CSET_a_2_z G_CSET_DIGITS, '-');
+ 
+-  if ((res = g_type_from_name (flags_name)))
++  /* strip leading '-'s */
++  flags_name_strip = flags_name;
++  while (flags_name_strip[0] == '-')
++    flags_name_strip++;
++
++  if (flags_name_strip[0] == '\0')
++    goto done;
++
++  if ((res = g_type_from_name (flags_name_strip)))
+     goto done;
+ 
+   while ((opt = av_opt_next (obj, opt))) {
+@@ -211,7 +228,7 @@ register_flags (const AVClass ** obj, const AVOption * top_opt)
+     g_array_sort (values, (GCompareFunc) cmp_flags_value);
+ 
+     res =
+-        g_flags_register_static (flags_name, &g_array_index (values,
++        g_flags_register_static (flags_name_strip, &g_array_index (values,
+             GFlagsValue, 0));
+ 
+     gst_type_mark_as_plugin_api (res, 0);
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.3.bb
index e8da49af99..7a2c0d1365 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.3.bb
@@ -11,7 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     file://ext/libav/gstav.h;beginline=1;endline=18;md5=a752c35267d8276fd9ca3db6994fca9c \
                     "
 
-SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
+SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz \
+           file://0001-libav-Fix-for-APNG-encoder-property-registration.patch \
+           "
 SRC_URI[sha256sum] = "3fedd10560fcdfaa1b6462cbf79a38c4e7b57d7f390359393fc0cef6dbf27dfe"
 
 S = "${WORKDIR}/gst-libav-${PV}"
-- 
2.25.1


