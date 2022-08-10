Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 896B1C00140
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 22:32:31 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.986.1660170747384561648
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 15:32:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=IdUIWiHS;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id f11so15571322pgj.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 15:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=msVL8zW1DhFeJWsHOV1aEFgRT47fQw8q+63AFRmrshk=;
        b=IdUIWiHSH5MUef35wJWf4z5Bi1aJmHO9bfpV7/CrEkv06kCHqUjd+O2HuRtDRb7wRG
         Vc0oBTa25QA02f6TKl3dBXHQoTFSBv95CyTQ9ghgbicaoBEKxnc6yIWlY5+b3GibXAq5
         2/HuGjUfC4EVK7rzZkV41cjhnj4W4iIIbhHyvHWWkRVCuCuzTK5yUvR1cOVxv7k6FDs3
         YJee3AdUTAP6Stu8tTTVyxS0L1gXMOXPESXrSdIsj65DC+ZTae5BBKUYx3E3qepgMqYX
         krPmbS2gJc0gonJMkpANFilIRxf/TLyKe7FwBJUEBi3jsyFXiwuhkKuvzMJymLB0lF5i
         g1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=msVL8zW1DhFeJWsHOV1aEFgRT47fQw8q+63AFRmrshk=;
        b=Fek/R6Wcpc0FpcmaiVVod86/r+rbNla3kKVslHVbDjP4oHcdV2zyGf46P6Me+DOi+P
         3PApNcenRc3CAv0I0S0SvXtjU8iHqyZ5BmyyqPx/R9BIwAjAoMiHW7XxdosgKxPTzLjN
         Q/PjYSJkYgruMWQZHldFoe3kJKF7lXN7TkTMtuYEPe5RlJGU/4GG3pyhASBcS13bDj7C
         USxuNH8pTPlsEitSs3wewgE9QtwmBu7B3n5n5kbiLbGWsQr/Z4jbpn/lQE0dvwRCFay1
         sVCS2iU6Xz7GQm5kN00euqrz5IUlmCWkbo6CzA4cKmBdJ+ypD8IR2XIDnY2s/NpfhFHs
         epew==
X-Gm-Message-State: ACgBeo32cqEznACXhHo2FplbTR0UMi4nGNEjL007fCUndDY3K6VNlzp0
	oDS0fy/8Y10uL33e8Tb74chxguSR7MQYAK5V
X-Google-Smtp-Source: 
 AA6agR71OFYMfUZNkPeQGTberDkZZ/DZ4HPyEyAn5kIV1iotALai5dS8phfZMJzQh5sHlStojx785w==
X-Received: by 2002:a63:f207:0:b0:41b:6137:2b6d with SMTP id
 v7-20020a63f207000000b0041b61372b6dmr24661886pgh.397.1660170746189;
        Wed, 10 Aug 2022 15:32:26 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x14-20020aa79ace000000b0052d7606d144sm2532513pfp.74.2022.08.10.15.32.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 15:32:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/11] gdk-pixbuf: CVE-2021-46829 a heap-based
 buffer overflow
Date: Wed, 10 Aug 2022 12:32:00 -1000
Message-Id: 
 <ef3f5fba3c3b5e8b16d6b8b7721468e61c65f72f.1660170592.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660170592.git.steve@sakoman.com>
References: <cover.1660170592.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 22:32:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169215

From: Hitendra Prajapati <hprajapati@mvista.com>

Source: https://gitlab.gnome.org/GNOME/gdk-pixbuf
MR: 120380
Type: Security Fix
Disposition: Backport from https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/5398f04d772f7f8baf5265715696ed88db0f0512
ChangeID: d8a843bcf97268ee4f0c6870f1339790a9a908e5
Description:
         CVE-2021-46829 gdk-pixbuf: a heap-based buffer overflow when compositing or clearing frames in GIF files.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


