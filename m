Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D776C47077
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 03:14:12 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web11.6132.1704251650577498055
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 19:14:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XdQ9o70l;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.54, mailfrom: steve@sakoman.com)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7b7fb34265fso502264339f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 19:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1704251649; x=1704856449; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UJUa+CD+pJRt+ohJcx+yHqm8AMUfoi7k46iJLXim3os=;
        b=XdQ9o70lye7Cwc6+UAjnxYpQ6yaTLWcnV2WOjCWOWu0jPhYKEhWbU1LhTt1AlZqfIH
         cGH7KCKSqZfV7Sxsb4z2jBxytyZocvpRwNGvaMMGcDkPqnm4B3Bept7LcZ5OhYkE2pt7
         sHDofLMUO6ShegjBay+FX3NPtCr4DVD8b8KEsmy88R+tWQayUtXLYuroT3Eno3fpU0so
         8qpn4kSoliuTWFhiNAmEFpT4b0x4d0lxBi04Qhl9z5LrAsfa4BUQNWzAWjT34nDZNm7D
         Xue1GlR/I4Rb687MHvYUNnT8pVqKtSklcq3hfYym4wpoiwG9ZpAPFxPc6StSbdqdY/0U
         sn8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704251649; x=1704856449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UJUa+CD+pJRt+ohJcx+yHqm8AMUfoi7k46iJLXim3os=;
        b=XsNyk+3+bniB+KOVPiuTIiQKAtx2Jgg0JLRdbz0PgQ9Z8GWDl/xDE2thxpcm7u2M5e
         DPpTIGAVA0MMJzgEccgFvpX0BDzYs2MZKYI/rAovO1j7/SqW7k2UEu9CaybXVUC6YdtL
         ZjrZ+Nwdkhl5/NERMcEHJczCvc3L7gshxCWc/BeC0jgMO52ih+rnydInRPTJ/QmMxwzE
         AcHLpVWQEYIqE0kgASfXZmrrk5zDWVrj0h4XRAX71B88lAdl+Wo56/n8MRnikf9F2ANI
         Hn6qj2RcpJgPeSwwVvCMwwLOHNHk1/k4OnM8SB02D9IgYSGJfs2JaOh4OPyqoDkaw03J
         d05Q==
X-Gm-Message-State: AOJu0YzS+xqio6dCLPocOxjAiSQv7d44e95kAXyTFT+T8+gaYH5Ggvgf
	/qpjh/8S53tjj+q+wpGlmWoTcHdz3kRKIumqnjDKr2E9cWw9VQ==
X-Google-Smtp-Source: AGHT+IE15N8g04OvNlMnUMKycYwu1Gvcb2WUB00qq/CRBjKN4TIKGThYEshQhfvJphFU7YrZegpPFQ==
X-Received: by 2002:a05:6e02:310d:b0:35f:fdd9:5cb3 with SMTP id bg13-20020a056e02310d00b0035ffdd95cb3mr20918101ilb.43.1704251649161;
        Tue, 02 Jan 2024 19:14:09 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id ay5-20020a1709028b8500b001d4ac8ac969sm5868681plb.275.2024.01.02.19.14.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 19:14:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/3] qemu: Fix CVE-2023-5088
Date: Tue,  2 Jan 2024 17:13:56 -1000
Message-Id: <df9e2d40c52b752940de61388997e485da56de0c.1704251506.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1704251506.git.steve@sakoman.com>
References: <cover.1704251506.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 03:14:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193267

From: Vijay Anusuri <vanusuri@mvista.com>

A bug in QEMU could cause a guest I/O operation otherwise
addressed to an arbitrary disk offset to be targeted to
offset 0 instead (potentially overwriting the VM's boot code).

This change is to fix CVE-2023-5088.

Link: https://gitlab.com/qemu-project/qemu/-/commit/7d7512019fc40c577e2bdd61f114f31a9eb84a8e

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


