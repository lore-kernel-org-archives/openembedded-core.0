Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C89C43217
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 07:25:22 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web08.2973.1668151521346410430
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 23:25:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=YOg4ACtV;
 spf=pass (domain: mvista.com, ip: 209.85.214.180, mailfrom: vkumbhar@mvista.com)
Received: by mail-pl1-f180.google.com with SMTP id v17so3620683plo.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 23:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VHT3StGcRibAGhnRV9Xpinxp0iqIHRXiHeGbLhYdj14=;
        b=YOg4ACtV4rILyjVerCbIimB2KlwagYy/P9+8QgQEIAcW8RF9hkDMy3tuPaPTye902g
         IYoNV0oklAxjvRmL8iu4JZo9oPGelB5CLFtPGeJfBKni9/Myp4Z7ypa8mf/LRzff4Opf
         QjiY9JY/EqwBYW6DppMUdsthggDHcJI/LlHCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VHT3StGcRibAGhnRV9Xpinxp0iqIHRXiHeGbLhYdj14=;
        b=TnNjouNsF6C1EHfl7gywRoyxDrf0Ua3s0tz+B3BecftP6BegOFAalILBtsK4XEiP6H
         r+xrvBWsDymyY5HBaEG9QdtdaNkl5mWZG5gLX1jqZDnU5C3KUG+w+UoaNkMUXht1ZRzw
         yyiVSxcXl0cPQWkZ1SFdu2yNI3t6vP6uk4ldn70f2mDs6mLhzmZei2F/Tr8E6FZNuksR
         UV3Cisd6N+ngPRfa8gJPSrFUOuEluKO3OP9lukmQT/sc9nj2u4Ji8eIDReZYlOPtE7Uf
         pNw1P4NJ4ds069Dk6tnp3rgnooSQ4tktQkZYi7q8N7rcGU6/NstqvXOv5yqUv9JU4gN/
         h+Ow==
X-Gm-Message-State: ANoB5pnzqtlfQnr1ehX8WDdPizQvSEg7BJGvQ8ra+qv5FuIcb28V+xb2
	FVsyRlV/oIvyL8HLxB9pvSSL1FWVtukD3Q==
X-Google-Smtp-Source: AA0mqf5lC23r+ZB0g/TVilCGZY/3WITA1KpMpzz+JLj1emB4dEEiagb1dK0IMXwqajUGxPDdv0UcEA==
X-Received: by 2002:a17:90a:7acd:b0:215:d767:4863 with SMTP id b13-20020a17090a7acd00b00215d7674863mr515733pjl.233.1668151520466;
        Thu, 10 Nov 2022 23:25:20 -0800 (PST)
Received: from vivek-Latitude-3400.mvista.com ([116.74.153.153])
        by smtp.gmail.com with ESMTPSA id ij27-20020a170902ab5b00b001752216ca51sm947119plb.39.2022.11.10.23.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 23:25:20 -0800 (PST)
From: vkumbhar@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][dunfell][PATCH v2] qemu: fix CVE-2021-3638 ati-vga: inconsistent check in ati_2d_blt() may lead to out-of-bounds write
Date: Fri, 11 Nov 2022 12:55:04 +0530
Message-Id: <20221111072504.18966-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 07:25:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173116

From: Vivek Kumbhar <vkumbhar@mvista.com>

Upstream-Status: Backport from https://lists.nongnu.org/archive/html/qemu-devel/2021-09/msg01682.html

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
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


