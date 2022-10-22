Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F7F1C433FE
	for <webhook@archiver.kernel.org>; Sat, 22 Oct 2022 12:59:45 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web09.5934.1666443583083821299
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Oct 2022 05:59:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N6sgQiL7;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id m16so15254141edc.4
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Oct 2022 05:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0uNXzpOttHF0pzJM6njk5qXmK+3ddAPJVbuwHf+mjn4=;
        b=N6sgQiL7cpYc8uGg2AARrQKhuhEGlpDEbHH/a1gLvQfyNRBWdErm2aFUd/OnfkqcYk
         Ik5zXg/+l/vJbP4oWmoQjW3wL8jm1a/kdDoU9yJqH2RJBkvK1NkDjhFHxpO2N3qimKDy
         i0c4SXMFfAuw1U34EoH8UW7ade3gi0kdeMf6XUipBQLOws58kQwM1tFpbVOK1HbuLK+E
         yfI61LfGSg+BgICv7pXIEwwYKdSSe6nUoZonwRLlJYixe7A0wCci4y7zFKs5BjTftoLV
         cgtn6PyFX6Xgy/Hn3bHekSgrGfSljx9ACSJ3s0d0lavBKeawmdbmNMeXhfFRB3BX8A3V
         JWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0uNXzpOttHF0pzJM6njk5qXmK+3ddAPJVbuwHf+mjn4=;
        b=VP4Bcn1Im7SI2Qzzw6E1jlLZ3zPfdMFuj2csibQOTosAkyofrPlv6YazPS93jxRWpI
         MAlkSmQyNRBvq/j4OCJZeT5pTFZ4EqMHONsp3UktdWQ1u7bOCOZBfTZT5eiQx10ZU1QD
         YcwWAIiybSNMMPNziQ3zf8/oUjstPmsuIqEh67DtGNLwOYarTJuXmRUi5y9jfsUoYyV9
         4aNxxL0l/tmxjjdU1fJeWk7NOrJBG+99TkhZuZmDVXQP0A18Hp8QVotjmOEgfcvPLEXs
         gQAfXXPp27cT1KeSWz2Et1fE8/k5/V8qFR+p4agzxlEIXNEfn5O8uKitoXC5fhh8rRAU
         u4Gg==
X-Gm-Message-State: ACrzQf2uvFoenMhrLPPTYPM86hzn0U3dKhuutzjFohakS4tXt03Sa6eF
	paQLPnKDIQukpdoh9b8iqXav8WgwtAY=
X-Google-Smtp-Source: AMsMyM4ZGDg0RMHQ2QGReQctaUoFYN5rMz3xwAJKVwyJwnkwnCBtDB6bVUsJ8illUCjALnqpBqInXw==
X-Received: by 2002:a17:907:6d92:b0:78d:d2e5:7cda with SMTP id sb18-20020a1709076d9200b0078dd2e57cdamr19681309ejc.625.1666443580916;
        Sat, 22 Oct 2022 05:59:40 -0700 (PDT)
Received: from nova.frosteyes.dk (customer-85-204-195-200.ip4.gigabit.dk. [85.204.195.200])
        by smtp.gmail.com with ESMTPSA id e11-20020a056402104b00b00459f4974128sm15115230edu.50.2022.10.22.05.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Oct 2022 05:59:40 -0700 (PDT)
From: Claus Stovgaard <claus.stovgaard@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Claus Stovgaard <claus.stovgaard@gmail.com>
Subject: [master][kirkstone][PATCH v2] gstreamer1.0-libav: fix errors with ffmpeg 5.x
Date: Sat, 22 Oct 2022 14:59:34 +0200
Message-Id: <20221022125934.106277-1-claus.stovgaard@gmail.com>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Oct 2022 12:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172061

Backport of patch already present upstream to fix issues with invalid
characters for GLIB when combining gstreamer1.0-libav with ffmpeg 5.x.

Remove when gstreamer1.0-libav is upgraded to 1.21.1 or above

Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
---
 ...r-APNG-encoder-property-registration.patch | 86 +++++++++++++++++++
 .../gstreamer/gstreamer1.0-libav_1.20.3.bb    |  4 +-
 2 files changed, 89 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-libav-Fix-for-APNG-encoder-property-registration.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-libav-Fix-for-APNG-encoder-property-registration.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-libav-Fix-for-APNG-encoder-property-registration.patch
new file mode 100644
index 0000000000..526bbb0037
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-libav-Fix-for-APNG-encoder-property-registration.patch
@@ -0,0 +1,86 @@
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
+
+Seungha Yangs patch was imported without modifications.
+
+Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
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
2.37.4


