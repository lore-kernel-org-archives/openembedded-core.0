Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web08.2686.1605917673861309819
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 16:14:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=If5J8oeL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id t18so5743298plo.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 16:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=8Y/7CD9vKA19JN0fQupYogDWDdpvBrYK/AowRfkklLs=;
        b=If5J8oeL7oHDHUOFx+/kcyD3YMEy68D4WJkBHwSHUsJN9VkMTa1jNmuQ2KgTStVuh+
         3unKf20cw1+2D5RXVpoYQNQKy8r6ZxZL3uADYHKY9MJsCzqRW1C/HiIIW8L+0IX3L2+b
         CyX16ThrxrG5xUAoRkL/Vu9rQ6WZofFWFhLGQa3WQXN+vaYvppGjP8zbPy5OFG4EAIR5
         OGqADYs2CwkH9b8IZgVYLt3NTC9Ukl5bbI96JhuWlIWXRSs8CmC3xoJcl4RodzFVyAFK
         DPOdYf99eWY6NGkLwixP2M3rCaSQ51/XUYv3nUUjBe+skR0AWqFIDBsU7mCXHYDgl7Hu
         c7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=8Y/7CD9vKA19JN0fQupYogDWDdpvBrYK/AowRfkklLs=;
        b=Lv5AgydUIsjL4ZB3GOsIWV3yF+rfm+Bupq33ZQYX3z6dAyg7cjZK1t0qytNpYAwSqj
         aHp4xV2Ylj+R7c8emjClqPLU1VLmFHFMJ4u5VIta/0HtiTpzk0BOytKQVx3nikqhiOP6
         ffS9+poD9qKzPknT6w9psBz3TjoxvHWNkkjQJGTzHFX7VCZ6X/0o8hfuPaHAGaHE956h
         dJJUDeErysQOprC9bzg23BfavLCj5WWN8Y+dsqfGsoYLCsdGKFQUydFzYsWlZL5+VYTP
         Q8RyP4vFjs0SFdp+Fetf1nZ3RgyzlaKVBZQpRc7ebCxhHVxjEQtrr4x5F/Qx46yCG/gU
         VuUg==
X-Gm-Message-State: AOAM5327qRKsBY9PjX1hgsCKD6aE1KGDSsLVULoTCgd90ERpBYG19KBT
	1wDHDZp9+Qsd544m7znCFv1TpE1NbT1ETWgs
X-Google-Smtp-Source: ABdhPJziu7K+IOEqGhNx8jg2f04IP8ab3lijbikfUipW4dJyV9TQtjkQ+d3PGY7vDxJ7QO6kQ10Psg==
X-Received: by 2002:a17:902:bcc2:b029:d8:f4a9:5093 with SMTP id o2-20020a170902bcc2b02900d8f4a95093mr15767595pls.83.1605917672951;
        Fri, 20 Nov 2020 16:14:32 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id d10sm5302419pjj.38.2020.11.20.16.14.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 16:14:32 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/5] qemu: fix CVE-2020-24352
Date: Fri, 20 Nov 2020 14:14:04 -1000
Message-Id: <7610ffec71e20556bde32f00a08c4c5a40cd31ce.1605917505.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605917505.git.steve@sakoman.com>
References: <cover.1605917505.git.steve@sakoman.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-24352.patch            | 52 +++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-24352.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index b6941403ea..067179fdeb 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -50,6 +50,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2020-16092.patch \
 	   file://0001-target-mips-Increase-number-of-TLB-entries-on-the-34.patch \
 	   file://CVE-2019-20175.patch \
+	   file://CVE-2020-24352.patch \
 	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-24352.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-24352.patch
new file mode 100644
index 0000000000..861ff6c3b0
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-24352.patch
@@ -0,0 +1,52 @@
+From ca1f9cbfdce4d63b10d57de80fef89a89d92a540 Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Wed, 21 Oct 2020 16:08:18 +0530
+Subject: [PATCH 1/1] ati: check x y display parameter values
+
+The source and destination x,y display parameters in ati_2d_blt()
+may run off the vga limits if either of s->regs.[src|dst]_[xy] is
+zero. Check the parameter values to avoid potential crash.
+
+Reported-by: Gaoning Pan <pgn@zju.edu.cn>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Message-id: 20201021103818.1704030-1-ppandit@redhat.com
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+Upstream-Status: Backport [ https://git.qemu.org/?p=qemu.git;a=commitdiff;h=ca1f9cbfdce4d63b10d57de80fef89a89d92a540;hp=2ddafce7f797082ad216657c830afd4546f16e37 ]
+CVE: CVE-2020-24352
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ hw/display/ati_2d.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/hw/display/ati_2d.c b/hw/display/ati_2d.c
+index 23a8ae0..4dc10ea 100644
+--- a/hw/display/ati_2d.c
++++ b/hw/display/ati_2d.c
+@@ -75,8 +75,9 @@ void ati_2d_blt(ATIVGAState *s)
+         dst_stride *= bpp;
+     }
+     uint8_t *end = s->vga.vram_ptr + s->vga.vram_size;
+-    if (dst_bits >= end || dst_bits + dst_x + (dst_y + s->regs.dst_height) *
+-        dst_stride >= end) {
++    if (dst_x > 0x3fff || dst_y > 0x3fff || dst_bits >= end
++        || dst_bits + dst_x
++         + (dst_y + s->regs.dst_height) * dst_stride >= end) {
+         qemu_log_mask(LOG_UNIMP, "blt outside vram not implemented\n");
+         return;
+     }
+@@ -107,8 +108,9 @@ void ati_2d_blt(ATIVGAState *s)
+             src_bits += s->regs.crtc_offset & 0x07ffffff;
+             src_stride *= bpp;
+         }
+-        if (src_bits >= end || src_bits + src_x +
+-            (src_y + s->regs.dst_height) * src_stride >= end) {
++        if (src_x > 0x3fff || src_y > 0x3fff || src_bits >= end
++            || src_bits + src_x
++             + (src_y + s->regs.dst_height) * src_stride >= end) {
+             qemu_log_mask(LOG_UNIMP, "blt outside vram not implemented\n");
+             return;
+         }
+-- 
+1.8.3.1
+
-- 
2.17.1

