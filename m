Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF1DCEDEC67
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 14:30:56 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.13605.1694615456206487849
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 07:30:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ecNfUPs6;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-68fac16ee5fso3566350b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 07:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694615455; x=1695220255; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fO8KmJS5rhVgECfjswOF+9wnxzhLPzZAPQySKnAHJv0=;
        b=ecNfUPs65IxeoBUFG630DA4HmMo2MNO1wu9S+NSjQzRhCLj/79skA8l9DRzUEe+e50
         qR8mkzzymBBuo9gyTy+Oa9l/cj6aTczI/xCUdMtzo2oc5j8TqPwp7O9jKHsX7s+AJJwL
         oHD/Ru/g7K9hqvnRfNnpKMceANCDU/IYra4dZdhk4paLzCZge+SKt0ypwpHQ97q2Vw01
         ciGQcbxBzKOqKkqNCitHjW6GtZOrB5dzePxYGtaNUgUaERRttKVECRMqFsn1guL02n0Y
         6ST+6ri9xT79kBKfDcpOKVIWABlB6lbVKcUi3SM8JtmbsE4D8lDgmu7CIWAqqnlnRHyQ
         MqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694615455; x=1695220255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fO8KmJS5rhVgECfjswOF+9wnxzhLPzZAPQySKnAHJv0=;
        b=sbCMDTv/6hIVQ9I5WHSzKJMDBb3mXNHvTPwJU8qem3US0Gav0y6h/KTcCq3zdTjQ9k
         wkTZ9w4kizvlByWVwOX3guRBBWNADqcgmgNnbFNqmV6L5IsF3UKOQhI9x/SSZ1kWWpOY
         yB56Gzld04KjvjAWZFxImGMTUK/hvNF9nMoWcN8oKDD5uptsHfgAVN3NIGRqyWR4qJ3K
         TB68zct2AUVnXXHQbHD45xdvep5a73HEMf4Jwtxw1DpjB03I27xv2+YRZ6mb5egI3reg
         b0rypsOxvEdv+PbalLfdV5S0Fn8iiUaZa04/z2wNznaxcxkSRvq1jS9AbZYIDFgSxb9r
         lYsg==
X-Gm-Message-State: AOJu0YzD4FRTGiwANRyxmmHGZbNNf6kMXbLF/g3Jdtvt9SScK+5lT54Q
	yrcgmknO9KoCRh5xWAdTK5gUVtnSymX3XPprPGA=
X-Google-Smtp-Source: AGHT+IEHiCoa58oa8tJn68FzBTsZPj9yl0yKEOd9kS4XCiKtUnDaALt5N3dEX5twvtSkHAHIftsbnA==
X-Received: by 2002:a05:6a20:8f12:b0:13d:1d14:6693 with SMTP id b18-20020a056a208f1200b0013d1d146693mr2869474pzk.45.1694615454972;
        Wed, 13 Sep 2023 07:30:54 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u2-20020aa78382000000b00686ec858fb0sm9185796pfm.190.2023.09.13.07.30.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 07:30:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/8] qemu: fix CVE-2021-3638
Date: Wed, 13 Sep 2023 04:30:35 -1000
Message-Id: <ebbdbb68a7804accd5430dd05f7899599ddbacd8.1694613269.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694613269.git.steve@sakoman.com>
References: <cover.1694613269.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 14:30:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187598

From: Yogita Urade <yogita.urade@windriver.com>

QEMU: ati-vga: inconsistent check in ati_2d_blt() may lead to
out-of-bounds write.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2021-3638
https://lists.nongnu.org/archive/html/qemu-devel/2021-09/msg01682.html

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-3638.patch             | 88 +++++++++++++++++++
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3638.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index d77c376bb6..5526eacb96 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -100,6 +100,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2020-14394.patch \
 	   file://CVE-2023-3354.patch \
 	   file://CVE-2023-3180.patch \
+	   file://CVE-2021-3638.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3638.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3638.patch
new file mode 100644
index 0000000000..3cbb34c54c
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3638.patch
@@ -0,0 +1,88 @@
+From 205ccfd7a5ec86bd9a5678b8bd157562fc9a1643 Mon Sep 17 00:00:00 2001
+From: Philippe Mathieu-Daudé <philmd@redhat.com>
+Date: Thu, 10 Aug 2023 07:30:54 +0000
+Subject: [PATCH] hw/display/ati_2d: Fix buffer overflow in ati_2d_blt
+ (CVE-2021-3638) MIME-Version: 1.0 Content-Type: text/plain; charset=UTF-8
+ Content-Transfer-Encoding: 8bit
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When building QEMU with DEBUG_ATI defined then running with
+'-device ati-vga,romfile="" -d unimp,guest_errors -trace ati\*'
+we get:
+
+  ati_mm_write 4 0x16c0 DP_CNTL <- 0x1
+  ati_mm_write 4 0x146c DP_GUI_MASTER_CNTL <- 0x2
+  ati_mm_write 4 0x16c8 DP_MIX <- 0xff0000
+  ati_mm_write 4 0x16c4 DP_DATATYPE <- 0x2
+  ati_mm_write 4 0x224 CRTC_OFFSET <- 0x0
+  ati_mm_write 4 0x142c DST_PITCH_OFFSET <- 0xfe00000
+  ati_mm_write 4 0x1420 DST_Y <- 0x3fff
+  ati_mm_write 4 0x1410 DST_HEIGHT <- 0x3fff
+  ati_mm_write 4 0x1588 DST_WIDTH_X <- 0x3fff3fff
+  ati_2d_blt: vram:0x7fff5fa00000 addr:0 ds:0x7fff61273800 stride:2560 bpp:32 rop:0xff
+  ati_2d_blt: 0 0 0, 0 127 0, (0,0) -> (16383,16383) 16383x16383 > ^
+  ati_2d_blt: pixman_fill(dst:0x7fff5fa00000, stride:254, bpp:8, x:16383, y:16383, w:16383, h:16383, xor:0xff000000)
+  Thread 3 "qemu-system-i38" received signal SIGSEGV, Segmentation fault.
+  (gdb) bt
+  #0  0x00007ffff7f62ce0 in sse2_fill.lto_priv () at /lib64/libpixman-1.so.0
+  #1  0x00007ffff7f09278 in pixman_fill () at /lib64/libpixman-1.so.0
+  #2  0x0000555557b5a9af in ati_2d_blt (s=0x631000028800) at hw/display/ati_2d.c:196
+  #3  0x0000555557b4b5a2 in ati_mm_write (opaque=0x631000028800, addr=5512, data=1073692671, size=4) at hw/display/ati.c:843
+  #4  0x0000555558b90ec4 in memory_region_write_accessor (mr=0x631000039cc0, addr=5512, ..., size=4, ...) at softmmu/memory.c:492
+
+Commit 584acf34cb0 ("ati-vga: Fix reverse bit blts") introduced
+the local dst_x and dst_y which adjust the (x, y) coordinates
+depending on the direction in the SRCCOPY ROP3 operation, but
+forgot to address the same issue for the PATCOPY, BLACKNESS and
+WHITENESS operations, which also call pixman_fill().
+
+Fix that now by using the adjusted coordinates in the pixman_fill
+call, and update the related debug printf().
+
+Reported-by: Qiang Liu <qiangliu@zju.edu.cn>
+Fixes: 584acf34cb0 ("ati-vga: Fix reverse bit blts")
+Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
+Tested-by: Mauro Matteo Cascella <mcascell@redhat.com>
+Message-Id: <20210906153103.1661195-1-philmd@redhat.com>
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+CVE: CVE-2021-3638
+
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/205ccfd7a5ec86bd9a5678b8bd157562fc9a1643]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ hw/display/ati_2d.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/hw/display/ati_2d.c b/hw/display/ati_2d.c
+index 4dc10ea79..692bec91d 100644
+--- a/hw/display/ati_2d.c
++++ b/hw/display/ati_2d.c
+@@ -84,7 +84,7 @@ void ati_2d_blt(ATIVGAState *s)
+     DPRINTF("%d %d %d, %d %d %d, (%d,%d) -> (%d,%d) %dx%d %c %c\n",
+             s->regs.src_offset, s->regs.dst_offset, s->regs.default_offset,
+             s->regs.src_pitch, s->regs.dst_pitch, s->regs.default_pitch,
+-            s->regs.src_x, s->regs.src_y, s->regs.dst_x, s->regs.dst_y,
++            s->regs.src_x, s->regs.src_y, dst_x, dst_y,
+             s->regs.dst_width, s->regs.dst_height,
+             (s->regs.dp_cntl & DST_X_LEFT_TO_RIGHT ? '>' : '<'),
+             (s->regs.dp_cntl & DST_Y_TOP_TO_BOTTOM ? 'v' : '^'));
+@@ -180,11 +180,11 @@ void ati_2d_blt(ATIVGAState *s)
+         dst_stride /= sizeof(uint32_t);
+         DPRINTF("pixman_fill(%p, %d, %d, %d, %d, %d, %d, %x)\n",
+                 dst_bits, dst_stride, bpp,
+-                s->regs.dst_x, s->regs.dst_y,
++                dst_x, dst_y,
+                 s->regs.dst_width, s->regs.dst_height,
+                 filler);
+         pixman_fill((uint32_t *)dst_bits, dst_stride, bpp,
+-                    s->regs.dst_x, s->regs.dst_y,
++                    dst_x, dst_y,
+                     s->regs.dst_width, s->regs.dst_height,
+                     filler);
+         if (dst_bits >= s->vga.vram_ptr + s->vga.vbe_start_addr &&
+--
+2.40.0
-- 
2.34.1


