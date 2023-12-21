Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D034C46CD2
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 02:09:26 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.42658.1703124563365572254
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Dec 2023 18:09:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1KjF2EQz;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d4006b251aso3203035ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 18:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703124562; x=1703729362; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LEsivaRXrQmJYX8L/IJon72o5Jufe1SaTNQJmUmL35Q=;
        b=1KjF2EQz8izxro7RdYfBqXkX7jOiPynQlx+OAyyuT9tnt5c5C8z6y9vPmNqjIiBCeD
         VslQxumNIZQkAHaNllJUhbdkrWu6aUAY/Tl/NB67WPlTMZPTgHEWuaLJ4PGvYNFbSJ5/
         RkK/jksYSDemk+dbmaTiA3dcyo+mZqQZWH1OR2NPVVgldc2UyorP1u+/gLsVx+V/jwlU
         fryq31z3JtIaY8vYCeQ47g26/O541GfEXKsH8hZ6MoFj7YKpyOffArs0bmvvCtUizhYR
         cx/+yFYhgmhaTtM5IFWrSy6cprOZ0kQByZfPnBLRNQSkBOMVTAV0UDXh9TD1zPyWo6HJ
         0evQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703124562; x=1703729362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LEsivaRXrQmJYX8L/IJon72o5Jufe1SaTNQJmUmL35Q=;
        b=Mk8BrBytY/vt8n3phl4b8yBn1nTXeBXHAj613TRB5Rfjxstlyzu1uXF0JC2r24p/dJ
         YoS7FZYzVz/kHLHl7zAmsBe1weXaOmXwXkPCq3M0NJh/gcOyhjHMg3IfweluEm5XQ8FX
         rX24ZfGzr+TTI3+WzCgfne507ivPTD2u38cl+si+SwkLF9itBCpGRxeBvwXFUegWY3Jo
         frhh+tl2HUVxiZIP62Ai9Td8ykI3oeUDHBV9JuNaSy7Edox/9tL8QCqm0LnZM78kSzsN
         ksMbG0UhI+J4pNARM04ovL3fMUzsGwWWZV/jqc9vI+EyImr4+TADBcgeQzDgm7lP2zvE
         UQqw==
X-Gm-Message-State: AOJu0YyexmyipBp8o/XYnkTMgnl/asVHCae0SfTzRxDwAccedZpDPEs3
	Bv2Dga+sbElefG0qMCuVZ1FqAo9x/aovWCUb+98e8g==
X-Google-Smtp-Source: AGHT+IHe2IYWL1VThdksLQKBIBr8m7tSuZ2AO/ppCjxciymlsiCxvWoeNA+hOqH2BdFCr+zLJi5N4Q==
X-Received: by 2002:a17:902:ed92:b0:1d3:bc88:59af with SMTP id e18-20020a170902ed9200b001d3bc8859afmr6491979plj.136.1703124561915;
        Wed, 20 Dec 2023 18:09:21 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id qb4-20020a17090b280400b0028aecd6b29fsm4447297pjb.3.2023.12.20.18.09.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 18:09:21 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/11] qemu: Fix CVE-2023-5088
Date: Wed, 20 Dec 2023 16:09:03 -1000
Message-Id: <aa84c668bfe2436d36f49a422c775119e2412c8b.1703124430.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703124430.git.steve@sakoman.com>
References: <cover.1703124430.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 02:09:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192815

From: Sourav Pramanik <sourav.pramanik@kpit.com>

A bug in QEMU could cause a guest I/O operation otherwise
addressed to an arbitrary disk offset to be targeted to
offset 0 instead (potentially overwriting the VM's boot code).

This change is to fix CVE-2023-5088.

Link: https://gitlab.com/qemu-project/qemu/-/commit/7d7512019fc40c577e2bdd61f114f31a9eb84a8e

Signed-off-by: Sourav Pramanik <sourav.pramanik@kpit.com>
Signed-off-by: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


