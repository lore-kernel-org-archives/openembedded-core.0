Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B5BC19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 04:10:15 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.8049.1660018208717443714
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 21:10:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=J0Aw6Dpi;
 spf=pass (domain: mvista.com, ip: 209.85.216.47,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f47.google.com with SMTP id
 p14-20020a17090a74ce00b001f4d04492faso11035574pjl.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 21:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=kII94U/ZaqILkvMBddhR82FFJnrd8kWhMpX7hI6AWa0=;
        b=J0Aw6Dpi9LPTAIXNq+DT71iUL9ka6yTS0Hye82d0S7XYRF+OPjjdOoFGOYEf5Wxghp
         ocRPwAmYKvyRhsoZ1YQ7qfyJfJDYMmEWEJDAaRKwNPG9Kh7152pVsGXVxcsvuBCXK5R1
         3jpPBTq+kmmOTpALJWW3BmFSTUL4H8KPZWRiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=kII94U/ZaqILkvMBddhR82FFJnrd8kWhMpX7hI6AWa0=;
        b=Vva/XnOdpT+NUnduLhE6X+1QFdkwST+r2ovzNmU54ZaehudYsRrr8+YrDBSXA2NUBF
         69xy+wQ6dgG/OLHcbja34Qli0ZlVjrnFNGgisAzDOmOI6W5xORiwBt1I3CkVkrVPkVN5
         uk+OVlNSZGjgmit5f8MoLUQWyrXvfWhbecQSfMR3s4bdAT+b2BRPiybN7lVM3/k2cNIl
         B4Xx1e3MPhDS9F5gL4aNEF9Z0KULjPXgKtSt/chxB4XHi+NNNN9m73XgcRdDGQ+r5qIo
         CJoICo5fOqDY6Hqkhn5VSJ8GDjOFcCHOs0iPr5yjPf4xj92uMsi6WiVPw6rBFzqprSTV
         5gkA==
X-Gm-Message-State: ACgBeo2jncZgOTYtrzd2rcuZqGYaTstcjfioNC1g5+FJsxNsQyzvc3Ts
	wF4RI0la8ASk/BXanRBypsPX1pRQNvQHFg==
X-Google-Smtp-Source: 
 AA6agR7l8gySGT/us5JZ3qiafWEPnXIFqFSRYHUgqmYUw4YgUHqOeWzk+pZ5mknlceQvM+hMj7ST1w==
X-Received: by 2002:a17:90b:4f44:b0:1f5:1310:9e7f with SMTP id
 pj4-20020a17090b4f4400b001f513109e7fmr32425881pjb.235.1660018207871;
        Mon, 08 Aug 2022 21:10:07 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.197])
        by smtp.gmail.com with ESMTPSA id
 e67-20020a621e46000000b0052de390357esm9439457pfe.130.2022.08.08.21.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 21:10:07 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Tue, 09 Aug 2022 09:40:01 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] gdk-pixbuf: CVE-2021-46829 a heap-based buffer
 overflow
Date: Tue,  9 Aug 2022 09:40:00 +0530
Message-Id: <20220809041000.5275-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 04:10:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169130

Source: https://gitlab.gnome.org/GNOME/gdk-pixbuf
MR: 120379
Type: Security Fix
Disposition: Backport from https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/5398f04d772f7f8baf5265715696ed88db0f0512
ChangeID: 37f962b51bdb0c522b2a991c549fd29e3d2e58d7
Description:
         CVE-2021-46829 gdk-pixbuf: a heap-based buffer overflow when compositing or clearing frames in GIF files.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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


