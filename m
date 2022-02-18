Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B01EC433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:06:53 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.9185.1645178812331360089
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=apbWiFL4;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id d27so13657516wrb.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zwhSAgB0DxrdDzQeHX58T3ifT+ua3Nb5Ts7b4PxUseo=;
        b=apbWiFL4g7/ErHT9dlexX2UJnjTlzdcQ3dT+QFufVTvubEf93l/i3eaeM6WkPRlDKL
         LAz3xQeg1WdlN38SXB7vmomxpTsfzYkWdGoEBTKfW6x93FqmeQdKA9H/hGu8GfxpNess
         OUOmmlOXnjVTzIcdKxH2WMOdN4xYhTyt56BF1mZ7Dst0b5CDYCXU+mYheErwkV0XPQ2U
         mRZChGUBlMD7wCTBSEP9sfUT9HXsYxZYcAzOMGu2biWh6mKGdPcx+rWlvuoohbrr0N5L
         g8TNMgzc84i92ORg8foNisd4Pyzy2gTSkJr81gqDgIqB0BDexPv5bA4fsTZmqtUYUhhN
         alkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zwhSAgB0DxrdDzQeHX58T3ifT+ua3Nb5Ts7b4PxUseo=;
        b=353Pu08Rr4h0JK1KeVqeYxv4p4FOVWrtV2Rk428P/eDoYoGkXwyY2t2wY1B/Sgp8HL
         nKhFAiNHUzHb1AaKFKXZ5Zuv8twmGFBj/RR4NE8nQYFjeI9ok2CoI4pfMmwMplfXAFlX
         3EZogpQouU4fp8YcS9kYPcS6mxQL6gTBOyuUfuOA90JEA8PjSIzqCxF6kkgyBq88wSra
         /aPW3+ToAXPl/YbLYdYwd3BsLTmx8mf6votz66vt2AxO2qKxgxZwWYs9qmQFCNe7Zbh/
         8H/BhnQMEflcvTZtXhoPCKDy96wsDyuh0m9L4CamEu6mWELEaatLP02iJ+rYgOvf+htT
         UXTA==
X-Gm-Message-State: AOAM5334N35k32aKUPOAeAWUJ8FGZ9nM1msih5ibswe1FrG/4wTncMGN
	0Ui96ZvwJXhzjH1gqi2H4Lw=
X-Google-Smtp-Source: 
 ABdhPJwJAJBQmVN9clmKKTt7mt4hM7duxkj9y175Xjl1JZzdz8cNfATjvs7DghKqOBjI46eijoKWYQ==
X-Received: by 2002:a5d:548f:0:b0:1e3:3a93:1324 with SMTP id
 h15-20020a5d548f000000b001e33a931324mr5502690wrv.252.1645178810765;
        Fri, 18 Feb 2022 02:06:50 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:50 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 32/46][dunfell] grub: fix an integer overflow
Date: Fri, 18 Feb 2022 11:05:40 +0100
Message-Id: <20220218100554.1315511-33-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:06:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161920

This patch adds a fix for a potential integer overflow in grub's
video/fb/fbfill. It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 ...bfill-Fix-potential-integer-overflow.patch | 78 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0032-video-fb-fbfill-Fix-potential-integer-overflow.patch

diff --git a/meta/recipes-bsp/grub/files/0032-video-fb-fbfill-Fix-potential-integer-overflow.patch b/meta/recipes-bsp/grub/files/0032-video-fb-fbfill-Fix-potential-integer-overflow.patch
new file mode 100644
index 0000000000..8165ea3f71
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0032-video-fb-fbfill-Fix-potential-integer-overflow.patch
@@ -0,0 +1,78 @@
+From 99ecf5a44b99d529a6405fe276bedcefa3657a0a Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Wed, 4 Nov 2020 15:10:51 +0000
+Subject: [PATCH] video/fb/fbfill: Fix potential integer overflow
+
+The multiplication of 2 unsigned 32-bit integers may overflow before
+promotion to unsigned 64-bit. We should ensure that the multiplication
+is done with overflow detection. Additionally, use grub_sub() for
+subtraction.
+
+Fixes: CID 73640, CID 73697, CID 73702, CID 73823
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Signed-off-by: Marco A Benatto <mbenatto@redhat.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=7ce3259f67ac2cd93acb0ec0080c24b3b69e66c6]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/video/fb/fbfill.c | 17 +++++++++++++----
+ 1 file changed, 13 insertions(+), 4 deletions(-)
+
+diff --git a/grub-core/video/fb/fbfill.c b/grub-core/video/fb/fbfill.c
+index 11816d0..a37acd1 100644
+--- a/grub-core/video/fb/fbfill.c
++++ b/grub-core/video/fb/fbfill.c
+@@ -31,6 +31,7 @@
+ #include <grub/fbfill.h>
+ #include <grub/fbutil.h>
+ #include <grub/types.h>
++#include <grub/safemath.h>
+ #include <grub/video.h>
+ 
+ /* Generic filler that works for every supported mode.  */
+@@ -61,7 +62,9 @@ grub_video_fbfill_direct32 (struct grub_video_fbblit_info *dst,
+ 
+   /* Calculate the number of bytes to advance from the end of one line
+      to the beginning of the next line.  */
+-  rowskip = dst->mode_info->pitch - dst->mode_info->bytes_per_pixel * width;
++  if (grub_mul (dst->mode_info->bytes_per_pixel, width, &rowskip) ||
++      grub_sub (dst->mode_info->pitch, rowskip, &rowskip))
++    return;
+ 
+   /* Get the start address.  */
+   dstptr = grub_video_fb_get_video_ptr (dst, x, y);
+@@ -98,7 +101,9 @@ grub_video_fbfill_direct24 (struct grub_video_fbblit_info *dst,
+ #endif
+   /* Calculate the number of bytes to advance from the end of one line
+      to the beginning of the next line.  */
+-  rowskip = dst->mode_info->pitch - dst->mode_info->bytes_per_pixel * width;
++  if (grub_mul (dst->mode_info->bytes_per_pixel, width, &rowskip) ||
++      grub_sub (dst->mode_info->pitch, rowskip, &rowskip))
++    return;
+ 
+   /* Get the start address.  */
+   dstptr = grub_video_fb_get_video_ptr (dst, x, y);
+@@ -131,7 +136,9 @@ grub_video_fbfill_direct16 (struct grub_video_fbblit_info *dst,
+ 
+   /* Calculate the number of bytes to advance from the end of one line
+      to the beginning of the next line.  */
+-  rowskip = (dst->mode_info->pitch - dst->mode_info->bytes_per_pixel * width);
++  if (grub_mul (dst->mode_info->bytes_per_pixel, width, &rowskip) ||
++      grub_sub (dst->mode_info->pitch, rowskip, &rowskip))
++    return;
+ 
+   /* Get the start address.  */
+   dstptr = grub_video_fb_get_video_ptr (dst, x, y);
+@@ -161,7 +168,9 @@ grub_video_fbfill_direct8 (struct grub_video_fbblit_info *dst,
+ 
+   /* Calculate the number of bytes to advance from the end of one line
+      to the beginning of the next line.  */
+-  rowskip = dst->mode_info->pitch - dst->mode_info->bytes_per_pixel * width;
++  if (grub_mul (dst->mode_info->bytes_per_pixel, width, &rowskip) ||
++      grub_sub (dst->mode_info->pitch, rowskip, &rowskip))
++    return;
+ 
+   /* Get the start address.  */
+   dstptr = grub_video_fb_get_video_ptr (dst, x, y);
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 24a269d90d..710ab5e361 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -78,6 +78,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0029-normal-completion-Fix-leaking-of-memory-when-process.patch \
            file://0030-commands-hashsum-Fix-a-memory-leak.patch \
            file://0031-video-efi_gop-Remove-unnecessary-return-value-of-gru.patch \
+           file://0032-video-fb-fbfill-Fix-potential-integer-overflow.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.33.0


