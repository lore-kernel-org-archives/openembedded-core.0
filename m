Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA07C4167B
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 14:18:31 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web09.16792.1667744305188339686
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 06:18:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=caWbPTSe;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id 130so8433678pfu.8
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 06:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CduqxVBWupBnIArD3nEJZHHc1OiGYwAzfayncCc1wIQ=;
        b=caWbPTSeSGK+bfV0XREB4VY46PtGRITRQ0Yuq1PBFjzTO91g/4U/h39x2e/1aJ1CVB
         rUobDB6BKEZIBJe5/FC7+osSjGzHpZJXxh9s+jOJmoUtsMAh+5LJ+cPVo9uP17p/JDT2
         nejPT3IDjoOsvOc8hxOlfsSHAFGgQxgTAlm9/CSPWT5aTHzycMdnpOd4WDFruAOLEdJc
         MzFvgw0PpoBD6yvRFZGNjLTmpIidYMsnia6Qw3c4OhADMba9GyHvMgASrtOhTRb3zQUx
         +Ej9FxNodj/xsMCm+k33BHNuR36d1zNqbH2wo2dh0QQrNLQYxoVw1DQX+vfYNm+cHy3J
         qIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CduqxVBWupBnIArD3nEJZHHc1OiGYwAzfayncCc1wIQ=;
        b=f4n5wkVRTiMde6EHHCScEUxzmEs/5ZUr4VgnVqlt0+hkjv2x3U5wDvlGkfX0jdPQfP
         DKmbEVDgJeGo3UoLDd+vIaEURDK7Vs/7e1qJ1uXUy9+Rm8U8j+SI0CrUHhHwzpW1yYRQ
         PGt6vlgKLD4Y671cCseVmhBBp3H/nIJHguS8gUISiX7ux8OG4J6WAeq/sBnQFb4/Qg5p
         PDrvQGyzol1jgs/5+BQRaT/aJfdd03zcfmXtj2JVAD9QjN66/tCFK35qElVPQFMmAR/4
         PNTtRpPGH6wo+o/45SEW63XJw2XbUI5MT9O+2Q3Vv0rpWaX18CvaXFNhSWg4fqLXF7s8
         sTkg==
X-Gm-Message-State: ACrzQf39uwwfvpWDdmhLL2+JU7xYL5BOwV1BdiX8frWRJZ2wDe0nIXRt
	02z2wGwpj9Znw/YGIjQ0r9vyeZfPok7lyt0W
X-Google-Smtp-Source: AMsMyM55pCiL2xT45HbeXlRLhPVtAMlXipF8F/lQlj4dSSv46RAuXXaAAZMDNkCiRYtr5LyD4sgYQg==
X-Received: by 2002:a05:6a00:13a6:b0:56d:426b:4e98 with SMTP id t38-20020a056a0013a600b0056d426b4e98mr40400031pfg.54.1667744304181;
        Sun, 06 Nov 2022 06:18:24 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b0017534ffd491sm3224907pll.163.2022.11.06.06.18.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 06:18:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 27/34] gstreamer1.0-libav: fix errors with ffmpeg 5.x
Date: Sun,  6 Nov 2022 04:17:10 -1000
Message-Id: <8a837dba82d6e665406c2ee0543ee0135fe2ae3a.1667744095.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667744095.git.steve@sakoman.com>
References: <cover.1667744095.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 14:18:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172795

From: Claus Stovgaard <claus.stovgaard@gmail.com>

Backport of patch already present upstream to fix issues with invalid
characters for GLIB when combining gstreamer1.0-libav with ffmpeg 5.x.

Remove when gstreamer1.0-libav is upgraded to 1.21.1 or above

Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 703ff945557ad307bbe4ba0b0b7f1a2e5b4b847e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


