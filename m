Return-Path: <ppjadhav456@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576F6C35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 06:47:43 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.39263.1702882061165866139
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Dec 2023 22:47:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mcSqLMEP;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ppjadhav456@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6d5c4cb8aa3so844672b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Dec 2023 22:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702882060; x=1703486860; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=COJYEvJc0rs0HtmZJ5pY8mL66XE0lzCn2zt18abV988=;
        b=mcSqLMEPO2+0Oh62bx3SZJI6ezsAhQv6hnBPW8TGEVuwPVQQd7s9+gW7LRMmzBvSNv
         9J76SZww4w1ARNIRWaqeDgRiBZWiKYNn+uV6TbBH4CRjLI923X7qIxwCDFqTm1pvVgt5
         v+SwG2J79d1ovF0jrQTKl2ZP53HEuYIIAmlPCLN5xMGPsL7VSVXDhCORfOk/+wYDc+ub
         r1zP6EgBjULJHIfUrJcGcLl61Gg4bX/zJLhxehHH3i/kweqR9FD8xS6ZGAhQw9g2bfiN
         FEZF/NfMr9g1pFX2Pf268jE/O/1r2mVxpOxePwoT0CHyjFKOi+sEMcA4L5g3NEhsuCmm
         S/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702882060; x=1703486860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=COJYEvJc0rs0HtmZJ5pY8mL66XE0lzCn2zt18abV988=;
        b=kpmPbl2SIdtdjZh7jd79E8xcPXjnQV7vKZ0+t+zWq34aqpohxYj0xtMcp61aH0EAUa
         2GryG1YOV5KsaOX6k2Su9w6SK0QE50E61WMJr6kxILOWi3dRfZw2PMiO5ScY5yGHkkdb
         xsh+iDxxVQB4zTINBSLY+NSMJXriqupMRUcKplesp+EIggJsc0BdAWMFQhoW29Tshoot
         ZoscteOJIgnlQSo7ouPrirzeTiWQdoTCq/A5wZDi2WrXNJ2udz9SfD2ElU9hXnIvP2Y/
         cYh+Y4+rLHAiNRBojSK5/9x4tV5Go5Gf+LztxmWyTJ0bRgPy4R0J7higFHJ+OYsOi3TK
         ddag==
X-Gm-Message-State: AOJu0YyfeBjQzHvkYAxdfPNEbyJk4/sHGFYtQpB+6g5A1Y5Nf5kUWk+P
	xtSy2YojiUWCt5XCqAkNFsMTH8CApvw=
X-Google-Smtp-Source: AGHT+IGrFIZ6AB07FdleA3mV9GBixT59xd0kTZfMl2TEfOF90r3HfVTvUkRnIxfxzWavbmheeAaiag==
X-Received: by 2002:a05:6a00:10cc:b0:6ce:751b:81d9 with SMTP id d12-20020a056a0010cc00b006ce751b81d9mr18347522pfu.9.1702882060344;
        Sun, 17 Dec 2023 22:47:40 -0800 (PST)
Received: from L-14805.kpit.com ([43.231.237.210])
        by smtp.gmail.com with ESMTPSA id g26-20020aa7875a000000b0068ff267f094sm17520012pfo.158.2023.12.17.22.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 22:47:40 -0800 (PST)
From: Poonam Jadhav <ppjadhav456@gmail.com>
To: openembedded-core@lists.openembedded.org,
	sourav.pramanik@kpit.com
Cc: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
Subject: [OE-core][kirkstone][PATCH] qemu: Fix CVE-2023-5088
Date: Mon, 18 Dec 2023 12:17:24 +0530
Message-Id: <20231218064724.25672-1-ppjadhav456@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 06:47:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192606

From: Sourav Pramanik <sourav.pramanik@kpit.com>

A bug in QEMU could cause a guest I/O operation otherwise
addressed to an arbitrary disk offset to be targeted to
offset 0 instead (potentially overwriting the VM's boot code).

This change is to fix CVE-2023-5088.

Link: https://gitlab.com/qemu-project/qemu/-/commit/7d7512019fc40c577e2bdd61f114f31a9eb84a8e

Signed-off-by: Sourav Pramanik <sourav.pramanik@kpit.com>
Signed-off-by: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2023-5088.patch             | 112 ++++++++++++++++++
 2 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-5088.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index c8e4e2e6f3..c5fb9b1eab 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -102,6 +102,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2023-3180.patch \
 	   file://CVE-2021-3638.patch \
 	   file://CVE-2023-1544.patch \
+	   file://CVE-2023-5088.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-5088.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-5088.patch
new file mode 100644
index 0000000000..c5ea9d739a
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-5088.patch
@@ -0,0 +1,112 @@
+From 7d7512019fc40c577e2bdd61f114f31a9eb84a8e Mon Sep 17 00:00:00 2001
+From: Fiona Ebner <f.ebner@proxmox.com>
+Date: Wed, 6 Sep 2023 15:09:21 +0200
+Subject: [PATCH] hw/ide: reset: cancel async DMA operation before resetting
+ state
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+If there is a pending DMA operation during ide_bus_reset(), the fact
+that the IDEState is already reset before the operation is canceled
+can be problematic. In particular, ide_dma_cb() might be called and
+then use the reset IDEState which contains the signature after the
+reset. When used to construct the IO operation this leads to
+ide_get_sector() returning 0 and nsector being 1. This is particularly
+bad, because a write command will thus destroy the first sector which
+often contains a partition table or similar.
+
+Traces showing the unsolicited write happening with IDEState
+0x5595af6949d0 being used after reset:
+
+> ahci_port_write ahci(0x5595af6923f0)[0]: port write [reg:PxSCTL] @ 0x2c: 0x00000300
+> ahci_reset_port ahci(0x5595af6923f0)[0]: reset port
+> ide_reset IDEstate 0x5595af6949d0
+> ide_reset IDEstate 0x5595af694da8
+> ide_bus_reset_aio aio_cancel
+> dma_aio_cancel dbs=0x7f64600089a0
+> dma_blk_cb dbs=0x7f64600089a0 ret=0
+> dma_complete dbs=0x7f64600089a0 ret=0 cb=0x5595acd40b30
+> ahci_populate_sglist ahci(0x5595af6923f0)[0]
+> ahci_dma_prepare_buf ahci(0x5595af6923f0)[0]: prepare buf limit=512 prepared=512
+> ide_dma_cb IDEState 0x5595af6949d0; sector_num=0 n=1 cmd=DMA WRITE
+> dma_blk_io dbs=0x7f6420802010 bs=0x5595ae2c6c30 offset=0 to_dev=1
+> dma_blk_cb dbs=0x7f6420802010 ret=0
+
+> (gdb) p *qiov
+> $11 = {iov = 0x7f647c76d840, niov = 1, {{nalloc = 1, local_iov = {iov_base = 0x0,
+>       iov_len = 512}}, {__pad = "\001\000\000\000\000\000\000\000\000\000\000",
+>       size = 512}}}
+> (gdb) bt
+> #0  blk_aio_pwritev (blk=0x5595ae2c6c30, offset=0, qiov=0x7f6420802070, flags=0,
+>     cb=0x5595ace6f0b0 <dma_blk_cb>, opaque=0x7f6420802010)
+>     at ../block/block-backend.c:1682
+> #1  0x00005595ace6f185 in dma_blk_cb (opaque=0x7f6420802010, ret=<optimized out>)
+>     at ../softmmu/dma-helpers.c:179
+> #2  0x00005595ace6f778 in dma_blk_io (ctx=0x5595ae0609f0,
+>     sg=sg@entry=0x5595af694d00, offset=offset@entry=0, align=align@entry=512,
+>     io_func=io_func@entry=0x5595ace6ee30 <dma_blk_write_io_func>,
+>     io_func_opaque=io_func_opaque@entry=0x5595ae2c6c30,
+>     cb=0x5595acd40b30 <ide_dma_cb>, opaque=0x5595af6949d0,
+>     dir=DMA_DIRECTION_TO_DEVICE) at ../softmmu/dma-helpers.c:244
+> #3  0x00005595ace6f90a in dma_blk_write (blk=0x5595ae2c6c30,
+>     sg=sg@entry=0x5595af694d00, offset=offset@entry=0, align=align@entry=512,
+>     cb=cb@entry=0x5595acd40b30 <ide_dma_cb>, opaque=opaque@entry=0x5595af6949d0)
+>     at ../softmmu/dma-helpers.c:280
+> #4  0x00005595acd40e18 in ide_dma_cb (opaque=0x5595af6949d0, ret=<optimized out>)
+>     at ../hw/ide/core.c:953
+> #5  0x00005595ace6f319 in dma_complete (ret=0, dbs=0x7f64600089a0)
+>     at ../softmmu/dma-helpers.c:107
+> #6  dma_blk_cb (opaque=0x7f64600089a0, ret=0) at ../softmmu/dma-helpers.c:127
+> #7  0x00005595ad12227d in blk_aio_complete (acb=0x7f6460005b10)
+>     at ../block/block-backend.c:1527
+> #8  blk_aio_complete (acb=0x7f6460005b10) at ../block/block-backend.c:1524
+> #9  blk_aio_write_entry (opaque=0x7f6460005b10) at ../block/block-backend.c:1594
+> #10 0x00005595ad258cfb in coroutine_trampoline (i0=<optimized out>,
+>     i1=<optimized out>) at ../util/coroutine-ucontext.c:177
+
+CVE: CVE-2023-5088
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/7d7512019fc40c577e2bdd61f114f31a9eb84a8e]
+
+Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
+Reviewed-by: Philippe Mathieu-DaudÃ© <philmd@linaro.org>
+Tested-by: simon.rowe@nutanix.com
+Message-ID: <20230906130922.142845-1-f.ebner@proxmox.com>
+Signed-off-by: Philippe Mathieu-DaudÃ© <philmd@linaro.org>
+Signed-off-by: Sourav Pramanik <sourav.pramanik@kpit.com>
+---
+ hw/ide/core.c | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/hw/ide/core.c b/hw/ide/core.c
+index b5e0dcd29b2..63ba665f3d2 100644
+--- a/hw/ide/core.c
++++ b/hw/ide/core.c
+@@ -2515,19 +2515,19 @@ static void ide_dummy_transfer_stop(IDEState *s)
+ 
+ void ide_bus_reset(IDEBus *bus)
+ {
+-    bus->unit = 0;
+-    bus->cmd = 0;
+-    ide_reset(&bus->ifs[0]);
+-    ide_reset(&bus->ifs[1]);
+-    ide_clear_hob(bus);
+-
+-    /* pending async DMA */
++    /* pending async DMA - needs the IDEState before it is reset */
+     if (bus->dma->aiocb) {
+         trace_ide_bus_reset_aio();
+         blk_aio_cancel(bus->dma->aiocb);
+         bus->dma->aiocb = NULL;
+     }
+ 
++    bus->unit = 0;
++    bus->cmd = 0;
++    ide_reset(&bus->ifs[0]);
++    ide_reset(&bus->ifs[1]);
++    ide_clear_hob(bus);
++
+     /* reset dma provider too */
+     if (bus->dma->ops->reset) {
+         bus->dma->ops->reset(bus->dma);
+-- 
-- 
2.25.1


