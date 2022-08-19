Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB49AC28B2B
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 02:43:15 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web12.50623.1660876989441373707
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=6AhScS51;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id jm11so3016175plb.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=qiM5FlFvRxeAkPOrBRpvJUQ8Fr5dIz6Flf5kTvrE1lw=;
        b=6AhScS51U1+6ayQBJJc0CmONXkoFW3BnbBX8zaFCrX8xtomKhAunnTEdZKIJmIt2Z3
         2is8Z3KXtXTt6tpp5F4OgChKVPDtsfvcwW1BuU6LRFaktBnoWsKJkfDeq42BXkMdZosb
         ZCSmyrbIgf+U6BvH23+aTtva9rySBC4PiXLSJOicGMPM4tPwJT24r5jcJXbx1EYyvOtd
         9d0uqpaUCx6WJN+d5CP2YkzTlvytUMEii+lLxyIbZT9NemmINPP++PXoLHkAo+E89OvR
         swH+oCI29PSIiYbAhWxWq/BUBeQvVtBx4RCuMXqwB4AeyqTVemOnfQ+BolEyUaYMcX2o
         SFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=qiM5FlFvRxeAkPOrBRpvJUQ8Fr5dIz6Flf5kTvrE1lw=;
        b=uajv5uv3cSRe7fvtjZCXv1qIo+YaOpym+Upyb6XwkQZLMYiuzgdSbcXe15QDyl52m9
         cNH8tNmnkSkcTsRCm0pY9QfgL5dswo2V3/9APFt/eagSffAJyT6YjoTUa4tD/HSKl93t
         EN7TJG4LoViMIjyIwi1n+qEMT1/u4JmiLSrLYo3wS94je3SPPnXDuqAlfOHxaGwc8NdI
         mqbSERU2wO1jqBfTjtDNv0Z1eMqOQxR7pKoRAvZ0bZWgWCtnaTnaRj/33vlxpJR9Zg/9
         qzj3PO9w4CnlNKXcN5uN8FnxQlOz6NdOLVxUjO2kD7OJrAswEPWB9bQS8ga7Y94RrSdf
         Qeyg==
X-Gm-Message-State: ACgBeo2VbAD40YjM/Yygj6Ntrq2LYjUoUygWEn/LJZ9NuX8cIS2jNETg
	qoU6pfuIAEkJ7fTAi46ExgMPofALa2RZy71v
X-Google-Smtp-Source: 
 AA6agR4C/vW08DYzl6o6Hf4wtwoIU1wERN5rSR9Bsh8rSzLqbxUShcY7FE2qWs5WaimOC9YHagInvA==
X-Received: by 2002:a17:90a:9a8a:b0:1fa:b4c1:c94 with SMTP id
 e10-20020a17090a9a8a00b001fab4c10c94mr10954856pjp.210.1660876988448;
        Thu, 18 Aug 2022 19:43:08 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 t12-20020a17090a4e4c00b001fa80cde150sm4150145pjl.20.2022.08.18.19.43.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 19:43:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/26] gdk-pixbuf: CVE-2021-46829 a heap-based
 buffer overflow
Date: Thu, 18 Aug 2022 16:42:23 -1000
Message-Id: 
 <978bc910ac326e34ec4f99c4645a80ed09c65407.1660876844.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660876844.git.steve@sakoman.com>
References: <cover.1660876844.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 02:43:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169544

From: Hitendra Prajapati <hprajapati@mvista.com>

Source: https://gitlab.gnome.org/GNOME/gdk-pixbuf
MR: 120379
Type: Security Fix
Disposition: Backport from https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/5398f04d772f7f8baf5265715696ed88db0f0512
ChangeID: 37f962b51bdb0c522b2a991c549fd29e3d2e58d7
Description:
         CVE-2021-46829 gdk-pixbuf: a heap-based buffer overflow when compositing or clearing frames in GIF files.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gdk-pixbuf/CVE-2021-46829.patch           | 61 +++++++++++++++++++
 .../gdk-pixbuf/gdk-pixbuf_2.42.6.bb           |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2021-46829.patch

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2021-46829.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2021-46829.patch
new file mode 100644
index 0000000000..82ceae6348
--- /dev/null
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2021-46829.patch
@@ -0,0 +1,61 @@
+From dc296a24862c2bcfbfbd642abbb4826ec282f0a1 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Mon, 8 Aug 2022 17:28:21 +0530
+Subject: [PATCH] CVE-2021-46829
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/5398f04d772f7f8baf5265715696ed88db0f0512]
+CVE: CVE-2021-46829
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ gdk-pixbuf/io-gif-animation.c | 21 +++++++++++++--------
+ 1 file changed, 13 insertions(+), 8 deletions(-)
+
+diff --git a/gdk-pixbuf/io-gif-animation.c b/gdk-pixbuf/io-gif-animation.c
+index 8335cdd..71d9265 100644
+--- a/gdk-pixbuf/io-gif-animation.c
++++ b/gdk-pixbuf/io-gif-animation.c
+@@ -369,7 +369,7 @@ composite_frame (GdkPixbufGifAnim *anim, GdkPixbufFrame *frame)
+         for (i = 0; i < n_indexes; i++) {
+                 guint8 index = index_buffer[i];
+                 guint x, y;
+-                int offset;
++                gsize offset;
+ 
+                 if (index == frame->transparent_index)
+                         continue;
+@@ -379,11 +379,13 @@ composite_frame (GdkPixbufGifAnim *anim, GdkPixbufFrame *frame)
+                 if (x >= anim->width || y >= anim->height)
+                         continue;
+ 
+-                offset = y * gdk_pixbuf_get_rowstride (anim->last_frame_data) + x * 4;
+-                pixels[offset + 0] = frame->color_map[index * 3 + 0];
+-                pixels[offset + 1] = frame->color_map[index * 3 + 1];
+-                pixels[offset + 2] = frame->color_map[index * 3 + 2];
+-                pixels[offset + 3] = 255;
++                if (g_size_checked_mul (&offset, gdk_pixbuf_get_rowstride (anim->last_frame_data), y) &&
++                    g_size_checked_add (&offset, offset, x * 4)) {
++                        pixels[offset + 0] = frame->color_map[index * 3 + 0];
++                        pixels[offset + 1] = frame->color_map[index * 3 + 1];
++                        pixels[offset + 2] = frame->color_map[index * 3 + 2];
++                        pixels[offset + 3] = 255;
++                }
+         }
+ 
+ out:
+@@ -448,8 +450,11 @@ gdk_pixbuf_gif_anim_iter_get_pixbuf (GdkPixbufAnimationIter *anim_iter)
+                         x_end = MIN (anim->last_frame->x_offset + anim->last_frame->width, anim->width);
+                         y_end = MIN (anim->last_frame->y_offset + anim->last_frame->height, anim->height);
+                         for (y = anim->last_frame->y_offset; y < y_end; y++) {
+-                                guchar *line = pixels + y * gdk_pixbuf_get_rowstride (anim->last_frame_data) + anim->last_frame->x_offset * 4;
+-                                memset (line, 0, (x_end - anim->last_frame->x_offset) * 4);
++                                gsize offset;
++                                if (g_size_checked_mul (&offset, gdk_pixbuf_get_rowstride (anim->last_frame_data), y) &&
++                                    g_size_checked_add (&offset, offset, anim->last_frame->x_offset * 4)) {
++                                         memset (pixels + offset, 0, (x_end - anim->last_frame->x_offset) * 4);
++                                }
+                         }
+                         break;
+                 case GDK_PIXBUF_FRAME_REVERT:
+-- 
+2.25.1
+
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb
index 55c16e4d66..b5ff29b5e3 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://run-ptest \
            file://fatal-loader.patch \
            file://0001-Add-use_prebuilt_tools-option.patch \
+           file://CVE-2021-46829.patch \
            "
 
 SRC_URI[sha256sum] = "c4a6b75b7ed8f58ca48da830b9fa00ed96d668d3ab4b1f723dcf902f78bde77f"
-- 
2.25.1


