Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B877FEEB581
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 06:41:47 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.52870.1694414503415566932
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Sep 2023 23:41:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=IxfNHVOd;
 spf=pass (domain: mvista.com, ip: 209.85.215.172, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so3077390a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Sep 2023 23:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1694414502; x=1695019302; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RotC0wt+CVD1o2KnLw42/26Bcsx7xLrYU2I81Xz7Xdo=;
        b=IxfNHVOdyIE2NJ1L+4fuHBe+ooevDqreFtRIu5Uyn/9hMvEWbp3Yf5sjQsYKWll9rF
         QbwgpqDBY5naY6SiWSafsJvIDUt3jrCwFZX4l9W7pTyAUdbAqMrIi5NSHLaYSAmmtnmZ
         JEv8w1ZpUgD5Ti/E7k4o8/ZoNGraAbIHeCd/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694414502; x=1695019302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RotC0wt+CVD1o2KnLw42/26Bcsx7xLrYU2I81Xz7Xdo=;
        b=e1El1XBWQceeFCnYwR/cls++545xNE9Nyo1ozPVElAgcxC0kzm+9KDsEPH/0WvI6Fk
         PTSZfVA9RAFFcXH4X8wXos1Wh9ut6c/Sp9o1sqe7jSXTTspR2lxpY1GhNgkHOYYL+WiB
         7qBPv87ZuYocJDxU++WPdtXxUCacZJ/drX3XrDgEURRxbi9WNZY7UCNivVUzlGTd/fIw
         GXO4IIEHQCBvf9gF0gW5k8cy4VUsYcd1696InXXIvQGkDffmphBTYm8USBZsSPMlUvTv
         EBHziar0BL3A8hcwcB+BoNGwqrWH0ePlc8Ltm8gCI/vz/afse5zodEZpNrU8k7CCrzmC
         cUzA==
X-Gm-Message-State: AOJu0YwAU9Yr1EGztDxubVCF7G5A+ILPb4+6JVdB/V6qC+AsNhVM1Wpt
	0a+b412l0XoV6Rx48oGypEw2ImkTyMLM/6uWo1I=
X-Google-Smtp-Source: AGHT+IE6pHaPkkwYLYhK0T6UPeKgBC/OlfWvhQSbewINjQ/ibobNK7EF7hsp+qUYtgmBGWsANA+wOA==
X-Received: by 2002:a05:6a20:970e:b0:14b:b42c:34a6 with SMTP id hr14-20020a056a20970e00b0014bb42c34a6mr9838093pzc.24.1694414502045;
        Sun, 10 Sep 2023 23:41:42 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.37.146.231])
        by smtp.gmail.com with ESMTPSA id jf3-20020a170903268300b001bf095dfb79sm5576551plb.235.2023.09.10.23.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Sep 2023 23:41:41 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] qemu: Backport fix for CVE-2023-0330
Date: Mon, 11 Sep 2023 12:09:27 +0530
Message-Id: <20230911063927.331958-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Sep 2023 06:41:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187476

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
---
 meta/recipes-devtools/qemu/qemu.inc           |   3 +-
 ...-2023-0330.patch => CVE-2023-0330_1.patch} |   0
 .../qemu/qemu/CVE-2023-0330_2.patch           | 135 ++++++++++++++++++
 3 files changed, 137 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/qemu/qemu/{CVE-2023-0330.patch => CVE-2023-0330_1.patch} (100%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-0330_2.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 2871818cb1..eda05e8d8a 100644
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
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
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
2.25.1


