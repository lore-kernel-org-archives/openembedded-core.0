Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15243C4321E
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 15:38:09 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.111.1667835462957911847
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 07:37:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=e+u6YRPQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id r18so10755638pgr.12
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 07:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CduqxVBWupBnIArD3nEJZHHc1OiGYwAzfayncCc1wIQ=;
        b=e+u6YRPQh/htHzRmQ3NqnV7nchXp6QHIDwIwFlZixbyWChGM3ywtPlIaAFpuWywSng
         6i1628SRgAMOCYzwF7xAsYHoslFe6+SHtTGwT3fCkbpIjdGk/R4fTzZkk94c+aA+puoM
         t4axOwGhsjguXiX/fYcw/bm2NtmfSqmEdzRT1Y8R+VVxbzRGldAeBiRyy1g7KrHBM+Wa
         zGMI8IQV/fL2z3HqE/3qcZykIlJ4BS91BY0sb2ttSeGnBPNFI6VR/o7iMfyhTSKpA9B3
         P10p/q5+wNgikPqK7gMYXC3NhqNiZrb7w95pIkGIcxEgX/PXZTXiaGVPEjhiNNejwObg
         xS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CduqxVBWupBnIArD3nEJZHHc1OiGYwAzfayncCc1wIQ=;
        b=OH32BbpkXwJUBgmBGpemTMQ1MPXlHGZJudGJ0bqq3zzxaaAmktpUBXhMpT8UrTBvBw
         VDT16S9ZZG8/mJkkSWR46Ke5acesprC7T4MESkctysb8jDnjic4qpcvNPc0XLLF1x6Ag
         Oy+S9b/Na4Qy64pEGy18912XuXk+Dc1fMzKCVshii8QbAlJobgAmHLYhTkrz7VQt+6Zj
         6RzqzD9ruWKm5UOow5qn5rfnlf7LrFZPoIy4P2WopD2erYN017vYGMzTluf4ip0tUZr1
         LeuGyYpSz/6+cvyTmefNiA+L+s/wfwOQXi6yZ4jBzKptXegLTJeVHj/OWwm1mP/J6dTA
         gFGA==
X-Gm-Message-State: ACrzQf0MhfeItNMj/c8uLdRXwM2U0svR+uXanGc+mqveAoD3emvyWD5H
	dOpVD3c38VIxlz9gHIun9bDi+AhOyzDkWA4d
X-Google-Smtp-Source: AMsMyM4UYKAw2bWPjh5sm/m+dZdcBkEL3jTO4udf7ndluBLtzR8c/BvMEER1Nd+J6k/ZJWH63Kum0Q==
X-Received: by 2002:a63:444f:0:b0:464:3985:3c92 with SMTP id t15-20020a63444f000000b0046439853c92mr44032629pgk.412.1667835461925;
        Mon, 07 Nov 2022 07:37:41 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id v2-20020aa799c2000000b00561dcfa700asm4628627pfi.107.2022.11.07.07.37.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 07:37:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 23/25] gstreamer1.0-libav: fix errors with ffmpeg 5.x
Date: Mon,  7 Nov 2022 05:36:42 -1000
Message-Id: <d142cc8e6faf42c0a495c28c177061ffb9b1f793.1667834972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667834972.git.steve@sakoman.com>
References: <cover.1667834972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 15:38:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172922

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


