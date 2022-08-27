Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37EBBC0502F
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 18:26:14 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web08.51894.1661624773344796387
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=T4ncGv14;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id l5so494351pjy.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=SCKMjGPYbN3m1CI4Z9rrzaF2F2/ejivMY9kiqd4rmx8=;
        b=T4ncGv14Ba6/AUxKkL3wYAOXD5VmamTWAKOxbrgDblsPK6bsEpjL15WEE8eetvJJxW
         ajlbUAjelQUYXFT0eFFkVe+7yEfibbcvxWJQBoxCiwKqFDWrhWsFxhF4f+XVpZgPdY1j
         18SFtrn0FVwrFbbfOAJjqANYmePhye0wJVLA3TCq7OhlFRctT9ifXFuJ4EzjPVX8heFV
         w2BecE+SyTOv5ZbfMQHsqhWqMEUYHaJrvT+swGfmmBRQFukYfrT2HKcezGk01n+mekUx
         jg3PsrdihFw99LnP/Y3FQgap9P3UxD7r/AUFqk7IJB19qhAXRTCVpKHIW2ouXaWnIPcm
         zHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=SCKMjGPYbN3m1CI4Z9rrzaF2F2/ejivMY9kiqd4rmx8=;
        b=Rl3VlJwHZx2HFouQS3iyajuoZYHCyzvb7ufbEK24bMDD8B9A/C2Dm+k+5vJxUejqno
         hTTDjUIRGLrmn94P4N12qImyaunsJjhpdD6xHF+1asObbxgd9Hy3p7LTlp6xAiLxFCyo
         DbULwWzMPQy9kSR7PXD+db1wdATp6kuVldCzNjbTBSX3KXGLieLqn7ISyAg6x0VelKLE
         o3xvELjuSSiq+kEaOu/v0edGlXDqQuAH16fc0KWpPQlThfPwDCKm7UQNy8gTYsincpW/
         9vbYGHe3h8BQI/qANRN9+VEM3aX+Xi+Xct9WiBhw8DQDfqlUxt9m/BZPgRXUY0hS5Fuy
         3nqA==
X-Gm-Message-State: ACgBeo1p1jeyWo9vQbXAvWL6Po8bNxdJ85u3RvLftNW5K0RAGDjtg3lh
	mSI1LDGDjghIApyMk9i5hGJciuc47uOBHOEF
X-Google-Smtp-Source: 
 AA6agR4eK+E+KPF7SHPCIbJgslKIMu/KQjm1akDMsa1jqc79N1UOu6T28lCX7nZLrB+sud8eZbw8Qw==
X-Received: by 2002:a17:903:1c8:b0:173:c58:dc6d with SMTP id
 e8-20020a17090301c800b001730c58dc6dmr9170173plh.105.1661624772295;
        Sat, 27 Aug 2022 11:26:12 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 r21-20020a170902ea5500b001708c4ebbaesm3864716plg.309.2022.08.27.11.26.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 11:26:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/24] Revert "gdk-pixbuf: CVE-2021-46829 a
 heap-based buffer overflow"
Date: Sat, 27 Aug 2022 08:25:28 -1000
Message-Id: 
 <b4874a3384e15c90c97ee031535035a58d223a4e.1661624569.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661624569.git.steve@sakoman.com>
References: <cover.1661624569.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 18:26:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169945

From: Hitendra Prajapati <hprajapati@mvista.com>

CVE will be fixed in subsequent stable release update

This reverts commit 978bc910ac326e34ec4f99c4645a80ed09c65407.
---
 .../gdk-pixbuf/CVE-2021-46829.patch           | 61 -------------------
 .../gdk-pixbuf/gdk-pixbuf_2.42.6.bb           |  1 -
 2 files changed, 62 deletions(-)
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2021-46829.patch

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2021-46829.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2021-46829.patch
deleted file mode 100644
index 82ceae6348..0000000000
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2021-46829.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From dc296a24862c2bcfbfbd642abbb4826ec282f0a1 Mon Sep 17 00:00:00 2001
-From: Hitendra Prajapati <hprajapati@mvista.com>
-Date: Mon, 8 Aug 2022 17:28:21 +0530
-Subject: [PATCH] CVE-2021-46829
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/5398f04d772f7f8baf5265715696ed88db0f0512]
-CVE: CVE-2021-46829
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- gdk-pixbuf/io-gif-animation.c | 21 +++++++++++++--------
- 1 file changed, 13 insertions(+), 8 deletions(-)
-
-diff --git a/gdk-pixbuf/io-gif-animation.c b/gdk-pixbuf/io-gif-animation.c
-index 8335cdd..71d9265 100644
---- a/gdk-pixbuf/io-gif-animation.c
-+++ b/gdk-pixbuf/io-gif-animation.c
-@@ -369,7 +369,7 @@ composite_frame (GdkPixbufGifAnim *anim, GdkPixbufFrame *frame)
-         for (i = 0; i < n_indexes; i++) {
-                 guint8 index = index_buffer[i];
-                 guint x, y;
--                int offset;
-+                gsize offset;
- 
-                 if (index == frame->transparent_index)
-                         continue;
-@@ -379,11 +379,13 @@ composite_frame (GdkPixbufGifAnim *anim, GdkPixbufFrame *frame)
-                 if (x >= anim->width || y >= anim->height)
-                         continue;
- 
--                offset = y * gdk_pixbuf_get_rowstride (anim->last_frame_data) + x * 4;
--                pixels[offset + 0] = frame->color_map[index * 3 + 0];
--                pixels[offset + 1] = frame->color_map[index * 3 + 1];
--                pixels[offset + 2] = frame->color_map[index * 3 + 2];
--                pixels[offset + 3] = 255;
-+                if (g_size_checked_mul (&offset, gdk_pixbuf_get_rowstride (anim->last_frame_data), y) &&
-+                    g_size_checked_add (&offset, offset, x * 4)) {
-+                        pixels[offset + 0] = frame->color_map[index * 3 + 0];
-+                        pixels[offset + 1] = frame->color_map[index * 3 + 1];
-+                        pixels[offset + 2] = frame->color_map[index * 3 + 2];
-+                        pixels[offset + 3] = 255;
-+                }
-         }
- 
- out:
-@@ -448,8 +450,11 @@ gdk_pixbuf_gif_anim_iter_get_pixbuf (GdkPixbufAnimationIter *anim_iter)
-                         x_end = MIN (anim->last_frame->x_offset + anim->last_frame->width, anim->width);
-                         y_end = MIN (anim->last_frame->y_offset + anim->last_frame->height, anim->height);
-                         for (y = anim->last_frame->y_offset; y < y_end; y++) {
--                                guchar *line = pixels + y * gdk_pixbuf_get_rowstride (anim->last_frame_data) + anim->last_frame->x_offset * 4;
--                                memset (line, 0, (x_end - anim->last_frame->x_offset) * 4);
-+                                gsize offset;
-+                                if (g_size_checked_mul (&offset, gdk_pixbuf_get_rowstride (anim->last_frame_data), y) &&
-+                                    g_size_checked_add (&offset, offset, anim->last_frame->x_offset * 4)) {
-+                                         memset (pixels + offset, 0, (x_end - anim->last_frame->x_offset) * 4);
-+                                }
-                         }
-                         break;
-                 case GDK_PIXBUF_FRAME_REVERT:
--- 
-2.25.1
-
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb
index b5ff29b5e3..55c16e4d66 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb
@@ -21,7 +21,6 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://run-ptest \
            file://fatal-loader.patch \
            file://0001-Add-use_prebuilt_tools-option.patch \
-           file://CVE-2021-46829.patch \
            "
 
 SRC_URI[sha256sum] = "c4a6b75b7ed8f58ca48da830b9fa00ed96d668d3ab4b1f723dcf902f78bde77f"
-- 
2.25.1


