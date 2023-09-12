Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6A0CA0EE2
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 13:53:48 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.25443.1694526824568004398
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 06:53:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jeOJb/pL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1c0c6d4d650so47598025ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 06:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694526824; x=1695131624; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4qYdYG00kvpf1kA8XnVzbXc3xP+uGwjQeITKUgVHMK0=;
        b=jeOJb/pLGf+eu/XVHtvnIU4akh6JGar1tJ33wncBgERYK8rNuhnVIDz4NA9qr07QVM
         E9Ad7N/fIqITr1j/SMfjXJpV5P3KPcLdbcYWAMFLCO11qdzZICsS4qBFDIVK0b3jjMNj
         CjlhdR8tNaRdoDYXUMaVZciQ14vRnArrRLenhZDtIrm7J94GfTsPJwfilOz0M1XTCw2U
         DK375i+XeiP4j2dz3DlxScOcx3zhImB+njkaxbMYG6cPx5J8GbOLJhx36CGD6CvoZuKV
         AiuZKu3dKpX72OiNuXw6o6+05Kd4rE3NJyG2eN04EOO145nYzomXBiTvyQYOvsWlGF9p
         yfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694526824; x=1695131624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4qYdYG00kvpf1kA8XnVzbXc3xP+uGwjQeITKUgVHMK0=;
        b=QRLHt26mFuLWP7IvF87rkygXzbW7vbNNQLMZBv9D68Y+tQJDx0h5vI68ulMqEdEMPI
         uzFjCdj70Ighm+DlZa5kyy2yBqFBXIw0Wp90hDMcnVu9GcvA+4+ODTR4AWv/mQpLeXFl
         S96bdbM9xFdDIWsq6yA66/1tZ+RFqlxoG19nMr3Fko8T4dQZelW8RNgOKMFAx1Grzp2g
         J/bzGJP9YYLcNw55TCC4raB8V9QPwIyQoBOZ6d/WHIDh0pezajc/bgETsH7WOfBviPV4
         mSdoP+nAQcNC+MQ/3I1wAqzNJV70VLyDks3FOMDwpb82vUjWcy+kJSM2COqwhJlK/3Lg
         Bt+Q==
X-Gm-Message-State: AOJu0Yxj7Va1i/V9Qtpx796x4uOi1BKBTJrw+bNJyA3fyvYf1m8Jj4hW
	wMujSCDxzUZa96mBWF0Ds+B12/V4JTfW5NG3crA=
X-Google-Smtp-Source: AGHT+IG2USLkM9eayBCXky/NnmCWcaOX/scFvWF48NSuUPMhMAWm+T9siVRFt01PhGpWZrKcsG0pgg==
X-Received: by 2002:a17:902:c40e:b0:1bc:98dd:e857 with SMTP id k14-20020a170902c40e00b001bc98dde857mr19530396plk.38.1694526823526;
        Tue, 12 Sep 2023 06:53:43 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j7-20020a170902da8700b001bdeedd8579sm7635246plx.252.2023.09.12.06.53.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 06:53:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/14] qemu: Backport fix for CVE-2023-0330
Date: Tue, 12 Sep 2023 03:53:13 -1000
Message-Id: <45ce9885351a2344737170e6e810dc67ab3e7ea9.1694526588.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694526588.git.steve@sakoman.com>
References: <cover.1694526588.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 13:53:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187519

From: Vijay Anusuri <vanusuri@mvista.com>

A DMA-MMIO reentrancy problem may lead to memory corruption bugs
like stack overflow or use-after-free.

Summary of the problem from Peter Maydell:
https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5KcknhPRD5fPBZA@mail.gmail.com

Reference:
https://gitlab.com/qemu-project/qemu/-/issues/556

qemu.git$ git log --no-merges --oneline   --grep CVE-2023-0330
b987718bbb hw/scsi/lsi53c895a: Fix reentrancy issues in the LSI controller (CVE-2023-0330)
a2e1753b80 memory: prevent dma-reentracy issues

Included second commit as well as commit log of a2e1753b80 says it
resolves CVE-2023-0330

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   3 +-
 ...-2023-0330.patch => CVE-2023-0330_1.patch} |   0
 .../qemu/qemu/CVE-2023-0330_2.patch           | 135 ++++++++++++++++++
 3 files changed, 137 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/qemu/qemu/{CVE-2023-0330.patch => CVE-2023-0330_1.patch} (100%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-0330_2.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 3789d77046..2669ba4ec8 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -137,7 +137,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3409-4.patch \
            file://CVE-2021-3409-5.patch \
            file://hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch \
-           file://CVE-2023-0330.patch \
+           file://CVE-2023-0330_1.patch \
+           file://CVE-2023-0330_2.patch \
            file://CVE-2023-3354.patch \
 	   file://CVE-2023-3180.patch \
            "
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-0330.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-0330_1.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu/CVE-2023-0330.patch
rename to meta/recipes-devtools/qemu/qemu/CVE-2023-0330_1.patch
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-0330_2.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-0330_2.patch
new file mode 100644
index 0000000000..3b45bc0411
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-0330_2.patch
@@ -0,0 +1,135 @@
+From a2e1753b8054344f32cf94f31c6399a58794a380 Mon Sep 17 00:00:00 2001
+From: Alexander Bulekov <alxndr@bu.edu>
+Date: Thu, 27 Apr 2023 17:10:06 -0400
+Subject: [PATCH] memory: prevent dma-reentracy issues
+
+Add a flag to the DeviceState, when a device is engaged in PIO/MMIO/DMA.
+This flag is set/checked prior to calling a device's MemoryRegion
+handlers, and set when device code initiates DMA.  The purpose of this
+flag is to prevent two types of DMA-based reentrancy issues:
+
+1.) mmio -> dma -> mmio case
+2.) bh -> dma write -> mmio case
+
+These issues have led to problems such as stack-exhaustion and
+use-after-frees.
+
+Summary of the problem from Peter Maydell:
+https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5KcknhPRD5fPBZA@mail.gmail.com
+
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/62
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/540
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/541
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/556
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/557
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/827
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1282
+Resolves: CVE-2023-0330
+
+Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
+Reviewed-by: Thomas Huth <thuth@redhat.com>
+Message-Id: <20230427211013.2994127-2-alxndr@bu.edu>
+[thuth: Replace warn_report() with warn_report_once()]
+Signed-off-by: Thomas Huth <thuth@redhat.com>
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/a2e1753b8054344f32cf94f31c6399a58794a380]
+CVE: CVE-2023-0330
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ include/exec/memory.h  |  5 +++++
+ include/hw/qdev-core.h |  7 +++++++
+ memory.c               | 16 ++++++++++++++++
+ 3 files changed, 28 insertions(+)
+
+diff --git a/include/exec/memory.h b/include/exec/memory.h
+index 2b8bccdd..0c8cdb8e 100644
+--- a/include/exec/memory.h
++++ b/include/exec/memory.h
+@@ -378,6 +378,8 @@ struct MemoryRegion {
+     bool is_iommu;
+     RAMBlock *ram_block;
+     Object *owner;
++    /* owner as TYPE_DEVICE. Used for re-entrancy checks in MR access hotpath */
++    DeviceState *dev;
+ 
+     const MemoryRegionOps *ops;
+     void *opaque;
+@@ -400,6 +402,9 @@ struct MemoryRegion {
+     const char *name;
+     unsigned ioeventfd_nb;
+     MemoryRegionIoeventfd *ioeventfds;
++
++    /* For devices designed to perform re-entrant IO into their own IO MRs */
++    bool disable_reentrancy_guard;
+ };
+ 
+ struct IOMMUMemoryRegion {
+diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
+index 1518495b..206f0a70 100644
+--- a/include/hw/qdev-core.h
++++ b/include/hw/qdev-core.h
+@@ -138,6 +138,10 @@ struct NamedGPIOList {
+     QLIST_ENTRY(NamedGPIOList) node;
+ };
+ 
++typedef struct {
++    bool engaged_in_io;
++} MemReentrancyGuard;
++
+ /**
+  * DeviceState:
+  * @realized: Indicates whether the device has been fully constructed.
+@@ -163,6 +167,9 @@ struct DeviceState {
+     int num_child_bus;
+     int instance_id_alias;
+     int alias_required_for_version;
++
++    /* Is the device currently in mmio/pio/dma? Used to prevent re-entrancy */
++    MemReentrancyGuard mem_reentrancy_guard;
+ };
+ 
+ struct DeviceListener {
+diff --git a/memory.c b/memory.c
+index 8cafb86a..94ebcaf9 100644
+--- a/memory.c
++++ b/memory.c
+@@ -531,6 +531,18 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
+         access_size_max = 4;
+     }
+ 
++    /* Do not allow more than one simultaneous access to a device's IO Regions */
++    if (mr->dev && !mr->disable_reentrancy_guard &&
++	!mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
++	if (mr->dev->mem_reentrancy_guard.engaged_in_io) {
++	    warn_report_once("Blocked re-entrant IO on MemoryRegion: "
++			     "%s at addr: 0x%" HWADDR_PRIX,
++			     memory_region_name(mr), addr);
++	    return MEMTX_ACCESS_ERROR;
++	}
++	mr->dev->mem_reentrancy_guard.engaged_in_io = true;
++    }
++
+     /* FIXME: support unaligned access? */
+     access_size = MAX(MIN(size, access_size_max), access_size_min);
+     access_mask = MAKE_64BIT_MASK(0, access_size * 8);
+@@ -545,6 +557,9 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
+                         access_mask, attrs);
+         }
+     }
++    if (mr->dev) {
++	mr->dev->mem_reentrancy_guard.engaged_in_io = false;
++    }
+     return r;
+ }
+ 
+@@ -1132,6 +1147,7 @@ static void memory_region_do_init(MemoryRegion *mr,
+     }
+     mr->name = g_strdup(name);
+     mr->owner = owner;
++    mr->dev = (DeviceState *) object_dynamic_cast(mr->owner, TYPE_DEVICE);
+     mr->ram_block = NULL;
+ 
+     if (name) {
+-- 
+2.25.1
+
-- 
2.34.1


