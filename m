Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1BACC46CD4
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 04:00:03 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web10.139157.1703822399383752669
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Dec 2023 19:59:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=anlaKVsh;
 spf=pass (domain: mvista.com, ip: 209.85.167.177, mailfrom: vanusuri@mvista.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3ba14203a34so6517785b6e.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 19:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1703822398; x=1704427198; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rn3JYquZRJNJpj4N9kWHiLe/2fhUvp45dOU8xlpbjMk=;
        b=anlaKVsh4xZWWnm5UeZQc3/guxfQZtiBFUFGSqUoyqYJpjPSmJTesTTUL6Sm22sRlN
         DBlaz+04KqA5hfdPdX86289XZ1dnfK6oJ13boPHSplxbxTahHKWPH2CJvHqcOBI5gyi7
         ATVoSV0kMTXoju4RUnYzJf0zpWvS1+lXUcQuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703822398; x=1704427198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rn3JYquZRJNJpj4N9kWHiLe/2fhUvp45dOU8xlpbjMk=;
        b=JkyRxk1E94CoX/d7yJUQG/aQ2p8MUrw/+MgJezJjQ71qx6+2V+nMTunZF7rIz+seMu
         5tzf/7KPkRqglK6a1l6lKxYW76QuX6WnVaRF2dqYaU5jJL3nRmIgomLO4cczl/WvCDev
         2mqRXe+cOXGoIwtnrEG9InwuJIsxr2G4jSr7jsJTDGbgeu1TtaKYYELrrj8ULKp6WQar
         y0W+zLuFtTVM3WgM2vt3k31k5RI7Og4OYnfxZcJx8kJjzYYQXaq5Ns21TANkziK1aTY9
         93qUSWQGWgBX2Wk4ivvhGzcVcVDIl4uxCKU009s+Kl2fbugXHU3nbmKN/R3BQ06N6JWG
         C8GQ==
X-Gm-Message-State: AOJu0YzwQDjAHOZEdisiAxQigv9QczncypuYld6UtYWgIDhny05gSrjY
	yR+JwWSRtGE6Bwa3vkPT5Qdd+w6kSzPpM45fC0brkTku+7I=
X-Google-Smtp-Source: AGHT+IEum2B4hRRxOgQfclvzSUikDQmoHadDSdRrovcGl6gR9omik5qnKQ78RItGdBE3qxmax8HHQQ==
X-Received: by 2002:a05:6808:2f07:b0:3bb:c0d1:b4b with SMTP id gu7-20020a0568082f0700b003bbc0d10b4bmr5849363oib.43.1703822397820;
        Thu, 28 Dec 2023 19:59:57 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.43.219.235])
        by smtp.gmail.com with ESMTPSA id r3-20020a62e403000000b006d997b5d009sm10866565pfh.69.2023.12.28.19.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 19:59:57 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] qemu: Fix CVE-2023-5088
Date: Fri, 29 Dec 2023 09:27:41 +0530
Message-Id: <20231229035741.483151-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 04:00:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192997

From: Vijay Anusuri <vanusuri@mvista.com>

A bug in QEMU could cause a guest I/O operation otherwise
addressed to an arbitrary disk offset to be targeted to
offset 0 instead (potentially overwriting the VM's boot code).

This change is to fix CVE-2023-5088.

Link: https://gitlab.com/qemu-project/qemu/-/commit/7d7512019fc40c577e2bdd61f114f31a9eb84a8e

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2023-5088.patch             | 114 ++++++++++++++++++
 2 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-5088.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 9dd90e8789..4f856c749e 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -141,6 +141,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2023-3354.patch \
 	   file://CVE-2023-3180.patch \
            file://CVE-2020-24165.patch \
+           file://CVE-2023-5088.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-5088.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-5088.patch
new file mode 100644
index 0000000000..db02210fa4
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-5088.patch
@@ -0,0 +1,114 @@
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
+Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
+Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
+Tested-by: simon.rowe@nutanix.com
+Message-ID: <20230906130922.142845-1-f.ebner@proxmox.com>
+Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/7d7512019fc40c577e2bdd61f114f31a9eb84a8e]
+CVE: CVE-2023-5088
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
+GitLab
+
-- 
2.25.1


