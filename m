Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0609C433FE
	for <webhook@archiver.kernel.org>; Sat, 12 Nov 2022 14:10:19 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web09.2953.1668262213238848055
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Nov 2022 06:10:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=mubkYVUN;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id e129so6545952pgc.9
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Nov 2022 06:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yacir9Yg22WFpBSDCUkSSTRgtEUU7ApTjGvv8pkD1y0=;
        b=mubkYVUNO/M5ZNI/CKQ1WAKgJFkTrv0eALbVzEoaJlYCyzIjhtYDYfEx0uC5LiKumk
         E16sgL8qn9JJS8KE+obVvCFOPtPMrFgy95RggDqktx5eFivWko/tEgmo/VsfvFKRrSwi
         zaXFKYrZ1krWCUsQMDzjJ5qJvGCAvBXXdKQpe+4mNPKkiKUsZmWyTu+Zldb1zDUaCzEX
         1EVltM69zl6rJ54Ger7P7EN70NeM8ndPZWjlrKHdIxBrrWRGZf82zVDW0xaYfNnvi0Px
         MjE0MYe/utYLdaNaubFKCjh2M3xg+6B0eqRkwx0bH7OXTZ23JW70StxnowRX6MJ9ENNu
         zZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yacir9Yg22WFpBSDCUkSSTRgtEUU7ApTjGvv8pkD1y0=;
        b=qgNiOstm1/zIzk+xDQJWE7vPnT5mV42ZSoJ0s4iAXtV4b55E4DzjrjCVNDdZlaI9gU
         PKEioWZ0fvJsbwgyMK5B854+bTy9BoyXy1yseHqlCuyZxMPK/etj5UTcUlzIOMarrPRE
         xt2l0r6QXMyUqRSIgRUMON7dbnfkL3G0hjoIUSO3mflqdRNVKD7ww8qN9tth7384FvSM
         njFT+6vgESlruXggmfEUwKovGigq6KAcP0kN9tZD6bMb51DtpgBFgB0Fx/fILS0PNL4G
         Aww2eTo/ZD7ZRlMKxd3cr5eretSkrUwWl//N+xC5YJFSRJNrWXdov/i+khoMBM3j2yR1
         Lu4Q==
X-Gm-Message-State: ANoB5pnkVbSJciaIFCDK71tjNPDNsMX9naS5214knorIg9kSOPea284E
	UHPLr2S/ryIl4ThneE3wwGeBBvldYDaTUNKU
X-Google-Smtp-Source: AA0mqf7WHMtQgOBlPxuaCRV1T+QJeeQEr17vTv3s01cFRh0R+QY0GYiJmYVY7DlyXPSfRDfi++VU4A==
X-Received: by 2002:aa7:8a41:0:b0:561:70b3:6a6 with SMTP id n1-20020aa78a41000000b0056170b306a6mr7091877pfa.25.1668262214110;
        Sat, 12 Nov 2022 06:10:14 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id g10-20020a1709026b4a00b0018853dd8832sm3733883plt.4.2022.11.12.06.10.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 06:10:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/11] qemu: fix CVE-2021-3638 ati-vga: inconsistent check in ati_2d_blt() may lead to out-of-bounds write
Date: Sat, 12 Nov 2022 04:09:52 -1000
Message-Id: <8b5d38abdbfd3bdeb175c793b4d33f9054e89f77.1668262073.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668262073.git.steve@sakoman.com>
References: <cover.1668262073.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Nov 2022 14:10:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173153

From: Vivek Kumbhar <vkumbhar@mvista.com>

Upstream-Status: Backport from https://lists.nongnu.org/archive/html/qemu-devel/2021-09/msg01682.html

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-3638.patch             | 80 +++++++++++++++++++
 2 files changed, 81 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3638.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 28caefef07..764f948a28 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -112,6 +112,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2022-0216-1.patch \
            file://CVE-2022-0216-2.patch \
            file://CVE-2021-3750.patch \
+	   file://CVE-2021-3638.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3638.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3638.patch
new file mode 100644
index 0000000000..6e7af8540a
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3638.patch
@@ -0,0 +1,80 @@
+From b68d13531d8882ba66994b9f767b6a8f822464f3 Mon Sep 17 00:00:00 2001
+From: Vivek Kumbhar <vkumbhar@mvista.com>
+Date: Fri, 11 Nov 2022 12:43:26 +0530
+Subject: [PATCH] CVE-2021-3638
+
+Upstream-Status: Backport [https://lists.nongnu.org/archive/html/qemu-devel/2021-09/msg01682.html]
+CVE: CVE-2021-3638
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
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
+  ati_2d_blt: vram:0x7fff5fa00000 addr:0 ds:0x7fff61273800 stride:2560 bpp:32
+rop:0xff
+  ati_2d_blt: 0 0 0, 0 127 0, (0,0) -> (16383,16383) 16383x16383 > ^
+  ati_2d_blt: pixman_fill(dst:0x7fff5fa00000, stride:254, bpp:8, x:16383,
+y:16383, w:16383, h:16383, xor:0xff000000)
+  Thread 3 "qemu-system-i38" received signal SIGSEGV, Segmentation fault.
+  (gdb) bt
+  #0  0x00007ffff7f62ce0 in sse2_fill.lto_priv () at /lib64/libpixman-1.so.0
+  #1  0x00007ffff7f09278 in pixman_fill () at /lib64/libpixman-1.so.0
+  #2  0x0000555557b5a9af in ati_2d_blt (s=0x631000028800) at
+hw/display/ati_2d.c:196
+  #3  0x0000555557b4b5a2 in ati_mm_write (opaque=0x631000028800, addr=5512,
+data=1073692671, size=4) at hw/display/ati.c:843
+  #4  0x0000555558b90ec4 in memory_region_write_accessor (mr=0x631000039cc0,
+addr=5512, ..., size=4, ...) at softmmu/memory.c:492
+
+Commit 584acf34cb0 ("ati-vga: Fix reverse bit blts") introduced
+the local dst_x and dst_y which adjust the (x, y) coordinates
+depending on the direction in the SRCCOPY ROP3 operation, but
+forgot to address the same issue for the PATCOPY, BLACKNESS and
+WHITENESS operations, which also call pixman_fill().
+
+Fix that now by using the adjusted coordinates in the pixman_fill
+call, and update the related debug printf().
+---
+ hw/display/ati_2d.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/hw/display/ati_2d.c b/hw/display/ati_2d.c
+index 4dc10ea7..692bec91 100644
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
+2.25.1
+
-- 
2.25.1


