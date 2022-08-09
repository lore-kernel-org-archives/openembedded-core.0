Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9735C19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 04:54:35 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.8302.1660020872032932063
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 21:54:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=fb2IbI2f;
 spf=pass (domain: mvista.com, ip: 209.85.210.172,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f172.google.com with SMTP id k14so7815178pfh.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 21:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=tvk7JsBNEkXkn5R4iTMQnf6nyPtn87fEtHuaTIdCk8E=;
        b=fb2IbI2f+lcmhxzud0BUgvg1IT3mwhmY6gZLtu2b5g6QJ8/vXCaZCH8CLqAjxbIFD1
         Yke+uOZrsgGh1Q+su3fDV7OVHZ/g+AL7MyU1Gx+1BmxJGppao/gSbnymnsWkRk7b3Ziy
         i89afK4TCStEZLSxJSvpi/VKrOvjhJcJs6g+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=tvk7JsBNEkXkn5R4iTMQnf6nyPtn87fEtHuaTIdCk8E=;
        b=SctHmErHXyO+A9yE2E5t+lgko/ULKeOGcK6QC7hIPQeV1YIfPnqdS15yK1d5R2tqPR
         VNDg8Q+HIjYT1ML8lvDP1PNuf0eemjoUu7l5Bce2RCCdt3Ss79Rs+w9Yz7bZDqUq0hGF
         dQhZIcNm261hEQGOtQ5dOq+IMw+wgYgLASrTlpAx94emm/RsHpRHZa4zSwvNhz/J55N+
         +fT6t+2ZafsS55a4++b44k2kFt9omX2qAuiCwkThy6vOzLJLSTGcX5+tnm3noVt7/6ZD
         ROaBZjg6m5mKT4awizj+72PwLWKusapOD0HFfPaK0jVoBDsTUaf0vqnq7MP4zC0blcty
         etiw==
X-Gm-Message-State: ACgBeo2/+CqpDSNRz/k0VTps77P0IefSz0EP+a8Rh70NoiUiuK2qJ55z
	d7QVTJ2fRt4u+aPnPokg0rr5JOOyGx638g==
X-Google-Smtp-Source: 
 AA6agR6+NfseLMp/qlCwlHizZIPRgfMFIMpoy/iO1c5WC2tm8UkHqwV/XmDfGEZJilFfsg3AuEMCJQ==
X-Received: by 2002:a63:6e82:0:b0:41a:1817:15d9 with SMTP id
 j124-20020a636e82000000b0041a181715d9mr18104027pgc.577.1660020870915;
        Mon, 08 Aug 2022 21:54:30 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.197])
        by smtp.gmail.com with ESMTPSA id
 jc21-20020a17090325d500b0016dd0242e22sm9677525plb.156.2022.08.08.21.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 21:54:30 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Tue, 09 Aug 2022 10:24:16 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] gdk-pixbuf: CVE-2021-46829 a heap-based buffer
 overflow
Date: Tue,  9 Aug 2022 10:24:14 +0530
Message-Id: <20220809045414.30946-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 04:54:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169131

Source: https://gitlab.gnome.org/GNOME/gdk-pixbuf
MR: 120380
Type: Security Fix
Disposition: Backport from https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/5398f04d772f7f8baf5265715696ed88db0f0512
ChangeID: d8a843bcf97268ee4f0c6870f1339790a9a908e5
Description:
         CVE-2021-46829 gdk-pixbuf: a heap-based buffer overflow when compositing or clearing frames in GIF files.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../gdk-pixbuf/CVE-2021-46829.patch           | 61 +++++++++++++++++++
 .../gdk-pixbuf/gdk-pixbuf_2.40.0.bb           |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2021-46829.patch

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2021-46829.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2021-46829.patch
new file mode 100644
index 0000000000..b29ab209ce
--- /dev/null
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2021-46829.patch
@@ -0,0 +1,61 @@
+From bdf3a2630c02a63803309cf0ad4b274234c814ce Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Tue, 9 Aug 2022 09:45:42 +0530
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
+index d742963..9544391 100644
+--- a/gdk-pixbuf/io-gif-animation.c
++++ b/gdk-pixbuf/io-gif-animation.c
+@@ -364,7 +364,7 @@ composite_frame (GdkPixbufGifAnim *anim, GdkPixbufFrame *frame)
+         for (i = 0; i < n_indexes; i++) {
+                 guint8 index = index_buffer[i];
+                 guint x, y;
+-                int offset;
++                gsize offset;
+ 
+                 if (index == frame->transparent_index)
+                         continue;
+@@ -374,11 +374,13 @@ composite_frame (GdkPixbufGifAnim *anim, GdkPixbufFrame *frame)
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
+@@ -443,8 +445,11 @@ gdk_pixbuf_gif_anim_iter_get_pixbuf (GdkPixbufAnimationIter *anim_iter)
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
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
index 60a04c3581..1171e6cc11 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
@@ -26,6 +26,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://missing-test-data.patch \
            file://CVE-2020-29385.patch \
            file://CVE-2021-20240.patch \
+           file://CVE-2021-46829.patch \
            "
 
 SRC_URI_append_class-target = " \
-- 
2.25.1


