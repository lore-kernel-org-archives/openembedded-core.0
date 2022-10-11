Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D241EC433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 16:27:41 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web09.9775.1665505651675658584
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:27:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Dh/CaMl0;
 spf=pass (domain: mvista.com, ip: 209.85.215.171,
 mailfrom: vkumbhar@mvista.com)
Received: by mail-pg1-f171.google.com with SMTP id h185so6178422pgc.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L2vkO1Yh0q+3awY2Aa5KHuOb/6Xgup5E3CLm+5m3ZUk=;
        b=Dh/CaMl0FALRqOCTsyvCWePMaGBktPYSHgrJnlS/FSs2eDTq1q3mwGxRUD4XhTOyku
         FM7sn/zDJQWNXZpizahoIGcb3oapFmIuG38AUeYvWPVuEHGX2W/ZSrYfJgOA1/cSyxcJ
         lrJ4UH7ritVntEBTZw9TPK7M66a0ZaFjkVX1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L2vkO1Yh0q+3awY2Aa5KHuOb/6Xgup5E3CLm+5m3ZUk=;
        b=hEi3KC66A2c4a/QUz/uMRaTZn6VaIXvyEzJzr8tY2ROesmpldSWCXLm9xPYE2tT144
         FHGJGYVdtPjYMedDs6hq9fTB4bxIUaU/sHM7S2gG3utTJk268U325GKi5nYq2Nmge+Ni
         nW3kkmylzT05hOFPCJpvHpSZgeBWOSFPd3Jstc56152PIZw1+5Rt0/acaPgC53ny4rpP
         epeIn1hBrDrxRVMIH2WwvKhZzt3Op7VzygrOTfMnhsou9+FKnQI6h8cDqHyaElLnOxCH
         SOa8csJXv4800bqQ61H2El0xKfCn8hBDK0tyexDVJ/E57HuymtpbH1ImA8uhI+LbDEVu
         qXtA==
X-Gm-Message-State: ACrzQf3xtGyUZBNUmFxLrjhAZM5Xj5rRRBz/EuB7By/HroSbBx1owZVe
	RhvQnO7SKy3lmzEBkr4zYNiZg4fRhM60pQ==
X-Google-Smtp-Source: 
 AMsMyM6bJ+ER4LpQ48ZKieIUmxIqdfDSKJGX1Hn9FPiKAmUaAbmEzCKmGDF6ytrKiYn59lMNIXazhw==
X-Received: by 2002:aa7:818f:0:b0:562:dc99:8a84 with SMTP id
 g15-20020aa7818f000000b00562dc998a84mr21048680pfi.30.1665505650528;
        Tue, 11 Oct 2022 09:27:30 -0700 (PDT)
Received: from localhost.localdomain
 ([2401:4900:c84:e9a4:b834:4dfd:7c2e:b695])
        by smtp.gmail.com with ESMTPSA id
 a23-20020aa794b7000000b00562ea6eeeb2sm7461290pfl.93.2022.10.11.09.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 09:27:30 -0700 (PDT)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][dunfell][PATCH] qemu: fix CVE-2021-3638
Date: Tue, 11 Oct 2022 21:57:20 +0530
Message-Id: <20221011162720.42877-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 16:27:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171633

Source: https://lists.nongnu.org/archive/html/qemu-devel/2021-09/msg01682.html
MR: 116345
Type: Security Fix
Disposition: Backport from https://lists.nongnu.org/archive/html/qemu-devel/2021-09/msg01682.html
ChangeID: 16be2d24b89b9ff8f492b034f77eb24800771910
Description:
    When building QEMU with DEBUG_ATI defined then running with
    '-device ati-vga,romfile="" -d unimp,guest_errors -trace ati\*'
    we get:

      ati_mm_write 4 0x16c0 DP_CNTL <- 0x1
      ati_mm_write 4 0x146c DP_GUI_MASTER_CNTL <- 0x2
      ati_mm_write 4 0x16c8 DP_MIX <- 0xff0000
      ati_mm_write 4 0x16c4 DP_DATATYPE <- 0x2
      ati_mm_write 4 0x224 CRTC_OFFSET <- 0x0
      ati_mm_write 4 0x142c DST_PITCH_OFFSET <- 0xfe00000
      ati_mm_write 4 0x1420 DST_Y <- 0x3fff
      ati_mm_write 4 0x1410 DST_HEIGHT <- 0x3fff
      ati_mm_write 4 0x1588 DST_WIDTH_X <- 0x3fff3fff
      ati_2d_blt: vram:0x7fff5fa00000 addr:0 ds:0x7fff61273800 stride:2560 bpp:32
    rop:0xff
      ati_2d_blt: 0 0 0, 0 127 0, (0,0) -> (16383,16383) 16383x16383 > ^
      ati_2d_blt: pixman_fill(dst:0x7fff5fa00000, stride:254, bpp:8, x:16383,
    y:16383, w:16383, h:16383, xor:0xff000000)
      Thread 3 "qemu-system-i38" received signal SIGSEGV, Segmentation fault.
      (gdb) bt
      #0  0x00007ffff7f62ce0 in sse2_fill.lto_priv () at /lib64/libpixman-1.so.0
      #1  0x00007ffff7f09278 in pixman_fill () at /lib64/libpixman-1.so.0
      #2  0x0000555557b5a9af in ati_2d_blt (s=0x631000028800) at
    hw/display/ati_2d.c:196
      #3  0x0000555557b4b5a2 in ati_mm_write (opaque=0x631000028800, addr=5512,
    data=1073692671, size=4) at hw/display/ati.c:843
      #4  0x0000555558b90ec4 in memory_region_write_accessor (mr=0x631000039cc0,
    addr=5512, ..., size=4, ...) at softmmu/memory.c:492

    Commit 584acf34cb0 ("ati-vga: Fix reverse bit blts") introduced
    the local dst_x and dst_y which adjust the (x, y) coordinates
    depending on the direction in the SRCCOPY ROP3 operation, but
    forgot to address the same issue for the PATCOPY, BLACKNESS and
    WHITENESS operations, which also call pixman_fill().

    Fix that now by using the adjusted coordinates in the pixman_fill
    call, and update the related debug printf().

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/0001-CVE-2021-3638.patch        | 42 +++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-CVE-2021-3638.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 7a963ad57c..b9ac4c663c 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -52,6 +52,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2019-20175.patch \
 	   file://CVE-2020-24352.patch \
 	   file://CVE-2020-25723.patch \
+	   file://0001-CVE-2021-3638.patch \
 	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-CVE-2021-3638.patch b/meta/recipes-devtools/qemu/qemu/0001-CVE-2021-3638.patch
new file mode 100644
index 0000000000..965ac3f181
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-CVE-2021-3638.patch
@@ -0,0 +1,42 @@
+From 1faf9c708c95b92678b7babb56f7ed861e3eda11 Mon Sep 17 00:00:00 2001
+From: Vivek Kumbhar <vkumbhar@mvista.com>
+Date: Thu, 1 Sep 2022 10:22:44 +0530
+Subject: [PATCH] CVE-2021-3638
+
+Upstream-Status: https://lists.nongnu.org/archive/html/qemu-devel/2021-09/msg01682.html
+CVE: CVE-2021-3638
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ hw/display/ati_2d.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/hw/display/ati_2d.c b/hw/display/ati_2d.c
+index 23a8ae0c..395b523b 100644
+--- a/hw/display/ati_2d.c
++++ b/hw/display/ati_2d.c
+@@ -83,7 +83,7 @@ void ati_2d_blt(ATIVGAState *s)
+     DPRINTF("%d %d %d, %d %d %d, (%d,%d) -> (%d,%d) %dx%d %c %c\n",
+             s->regs.src_offset, s->regs.dst_offset, s->regs.default_offset,
+             s->regs.src_pitch, s->regs.dst_pitch, s->regs.default_pitch,
+-            s->regs.src_x, s->regs.src_y, s->regs.dst_x, s->regs.dst_y,
++            s->regs.src_x, s->regs.src_y, dst_x, dst_y,
+             s->regs.dst_width, s->regs.dst_height,
+             (s->regs.dp_cntl & DST_X_LEFT_TO_RIGHT ? '>' : '<'),
+             (s->regs.dp_cntl & DST_Y_TOP_TO_BOTTOM ? 'v' : '^'));
+@@ -178,11 +178,11 @@ void ati_2d_blt(ATIVGAState *s)
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


