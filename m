Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21733C4167B
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 15:03:34 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.52966.1699715005903663745
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Nov 2023 07:03:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=h5HF+xKI;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1cc3bb32b5dso26316945ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 07:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1699715004; x=1700319804; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hh5KHdPyOA7JZ7bycJ6zu8PT5TrYagKQSroxW98XfPI=;
        b=h5HF+xKIW8jGkmVwraBVpGNTmuxxB07oPLChF+H4V2I0i2IdGSJQ3z2hr+lNlKpGYq
         gNkaCidmQmmRX/3QDVrLGC5mSZasrFb0BIKMgHtwapp6jjyWpvDZ5gaEayLdLUOGNEMU
         8swBWeizMNds+SJQVpu9zlpIPUNuo3GIb0DDaAIQM1Lr6TvqyMYzf02hkVAWgd693oan
         bs4uqP42WJHb7yZQJEL7t9kq7iu1fuYfxmFkc1mJ8spkPIGSH/auoxUmGfU2fd6WEzpP
         8s+MVkVtVnmKZY6YX7Qf9BjqNFNp6J9u7K55Cw+SjwxsGkeRBeN55GtVR/uVerzoxH67
         iNcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699715004; x=1700319804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hh5KHdPyOA7JZ7bycJ6zu8PT5TrYagKQSroxW98XfPI=;
        b=mVdkFZnBtX6lH8ZyQuv90/gGLm7d6O10qZ9NtpaKoCdg0VQ6D2gljmVApob5P5py2m
         0RSdc/IvsfHSarMdSoP2Upo9IMdhezoRLmlvSjvgwYtn1lCIUTLd8kWB2C5On0b8nqQ8
         0LiJB7xxIJ3DffPB7ImsqBtrmqESvhv0I1HIUuhiXTKJSHAkrPvzos3XIvIk87gG71X3
         IeqMO3JGMCJLqYGtybM3NrTLjRX3H1rPP2MEm7UzPnhBF3rWRSCFX1E9W4d74cVS8LnO
         I9YO0dE2erKW5WXUl3F3RWhgW4geAsiS7uiBrSfgZNk7kL1gPGuJ4FLRiQGWqDdBgUq+
         UuoA==
X-Gm-Message-State: AOJu0YwK8YPWO2ySzeB3YW/1ZL+RIsPIA2B67yaGuXqH5xriJaioT3q5
	s8H6DaiftMdyhzavlE/S3JoPePmq+kqLu5Suj+kVtg==
X-Google-Smtp-Source: AGHT+IHEiVQereguXKe1ynYDfF2NaS+5SnM99dbWLgS1wzdQk5s96g8X9DP+MUHYrQGU3UZJfOyCBA==
X-Received: by 2002:a17:902:a9cb:b0:1cc:ef37:663e with SMTP id b11-20020a170902a9cb00b001ccef37663emr2349762plr.20.1699715004361;
        Sat, 11 Nov 2023 07:03:24 -0800 (PST)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y18-20020a1709027c9200b001b53c8659fesm1379200pll.30.2023.11.11.07.03.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 07:03:24 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/15] Revert "qemu: Backport fix for CVE-2023-0330"
Date: Sat, 11 Nov 2023 05:02:56 -1000
Message-Id: <abc0869c96e810f840a66bbd1ae1c4e3115773c8.1699714834.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699714834.git.steve@sakoman.com>
References: <cover.1699714834.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 15:03:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190422

This reverts commit 45ce9885351a2344737170e6e810dc67ab3e7ea9.

Unfortunately this backport results in qemuarmv5 failing to boot with
a qemu lsi hw error.

[YOCTO #15274]

See discussion: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15274

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   3 +-
 ...-2023-0330_1.patch => CVE-2023-0330.patch} |   0
 .../qemu/qemu/CVE-2023-0330_2.patch           | 135 ------------------
 3 files changed, 1 insertion(+), 137 deletions(-)
 rename meta/recipes-devtools/qemu/qemu/{CVE-2023-0330_1.patch => CVE-2023-0330.patch} (100%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-0330_2.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index e6b26aba88..a24915c35c 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -137,8 +137,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3409-4.patch \
            file://CVE-2021-3409-5.patch \
            file://hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch \
-           file://CVE-2023-0330_1.patch \
-           file://CVE-2023-0330_2.patch \
+           file://CVE-2023-0330.patch \
            file://CVE-2023-3354.patch \
 	   file://CVE-2023-3180.patch \
            file://CVE-2020-24165.patch \
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-0330_1.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-0330.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu/CVE-2023-0330_1.patch
rename to meta/recipes-devtools/qemu/qemu/CVE-2023-0330.patch
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-0330_2.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-0330_2.patch
deleted file mode 100644
index 3b45bc0411..0000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2023-0330_2.patch
+++ /dev/null
@@ -1,135 +0,0 @@
-From a2e1753b8054344f32cf94f31c6399a58794a380 Mon Sep 17 00:00:00 2001
-From: Alexander Bulekov <alxndr@bu.edu>
-Date: Thu, 27 Apr 2023 17:10:06 -0400
-Subject: [PATCH] memory: prevent dma-reentracy issues
-
-Add a flag to the DeviceState, when a device is engaged in PIO/MMIO/DMA.
-This flag is set/checked prior to calling a device's MemoryRegion
-handlers, and set when device code initiates DMA.  The purpose of this
-flag is to prevent two types of DMA-based reentrancy issues:
-
-1.) mmio -> dma -> mmio case
-2.) bh -> dma write -> mmio case
-
-These issues have led to problems such as stack-exhaustion and
-use-after-frees.
-
-Summary of the problem from Peter Maydell:
-https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5KcknhPRD5fPBZA@mail.gmail.com
-
-Resolves: https://gitlab.com/qemu-project/qemu/-/issues/62
-Resolves: https://gitlab.com/qemu-project/qemu/-/issues/540
-Resolves: https://gitlab.com/qemu-project/qemu/-/issues/541
-Resolves: https://gitlab.com/qemu-project/qemu/-/issues/556
-Resolves: https://gitlab.com/qemu-project/qemu/-/issues/557
-Resolves: https://gitlab.com/qemu-project/qemu/-/issues/827
-Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1282
-Resolves: CVE-2023-0330
-
-Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
-Reviewed-by: Thomas Huth <thuth@redhat.com>
-Message-Id: <20230427211013.2994127-2-alxndr@bu.edu>
-[thuth: Replace warn_report() with warn_report_once()]
-Signed-off-by: Thomas Huth <thuth@redhat.com>
-
-Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/a2e1753b8054344f32cf94f31c6399a58794a380]
-CVE: CVE-2023-0330
-Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
----
- include/exec/memory.h  |  5 +++++
- include/hw/qdev-core.h |  7 +++++++
- memory.c               | 16 ++++++++++++++++
- 3 files changed, 28 insertions(+)
-
-diff --git a/include/exec/memory.h b/include/exec/memory.h
-index 2b8bccdd..0c8cdb8e 100644
---- a/include/exec/memory.h
-+++ b/include/exec/memory.h
-@@ -378,6 +378,8 @@ struct MemoryRegion {
-     bool is_iommu;
-     RAMBlock *ram_block;
-     Object *owner;
-+    /* owner as TYPE_DEVICE. Used for re-entrancy checks in MR access hotpath */
-+    DeviceState *dev;
- 
-     const MemoryRegionOps *ops;
-     void *opaque;
-@@ -400,6 +402,9 @@ struct MemoryRegion {
-     const char *name;
-     unsigned ioeventfd_nb;
-     MemoryRegionIoeventfd *ioeventfds;
-+
-+    /* For devices designed to perform re-entrant IO into their own IO MRs */
-+    bool disable_reentrancy_guard;
- };
- 
- struct IOMMUMemoryRegion {
-diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
-index 1518495b..206f0a70 100644
---- a/include/hw/qdev-core.h
-+++ b/include/hw/qdev-core.h
-@@ -138,6 +138,10 @@ struct NamedGPIOList {
-     QLIST_ENTRY(NamedGPIOList) node;
- };
- 
-+typedef struct {
-+    bool engaged_in_io;
-+} MemReentrancyGuard;
-+
- /**
-  * DeviceState:
-  * @realized: Indicates whether the device has been fully constructed.
-@@ -163,6 +167,9 @@ struct DeviceState {
-     int num_child_bus;
-     int instance_id_alias;
-     int alias_required_for_version;
-+
-+    /* Is the device currently in mmio/pio/dma? Used to prevent re-entrancy */
-+    MemReentrancyGuard mem_reentrancy_guard;
- };
- 
- struct DeviceListener {
-diff --git a/memory.c b/memory.c
-index 8cafb86a..94ebcaf9 100644
---- a/memory.c
-+++ b/memory.c
-@@ -531,6 +531,18 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
-         access_size_max = 4;
-     }
- 
-+    /* Do not allow more than one simultaneous access to a device's IO Regions */
-+    if (mr->dev && !mr->disable_reentrancy_guard &&
-+	!mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
-+	if (mr->dev->mem_reentrancy_guard.engaged_in_io) {
-+	    warn_report_once("Blocked re-entrant IO on MemoryRegion: "
-+			     "%s at addr: 0x%" HWADDR_PRIX,
-+			     memory_region_name(mr), addr);
-+	    return MEMTX_ACCESS_ERROR;
-+	}
-+	mr->dev->mem_reentrancy_guard.engaged_in_io = true;
-+    }
-+
-     /* FIXME: support unaligned access? */
-     access_size = MAX(MIN(size, access_size_max), access_size_min);
-     access_mask = MAKE_64BIT_MASK(0, access_size * 8);
-@@ -545,6 +557,9 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
-                         access_mask, attrs);
-         }
-     }
-+    if (mr->dev) {
-+	mr->dev->mem_reentrancy_guard.engaged_in_io = false;
-+    }
-     return r;
- }
- 
-@@ -1132,6 +1147,7 @@ static void memory_region_do_init(MemoryRegion *mr,
-     }
-     mr->name = g_strdup(name);
-     mr->owner = owner;
-+    mr->dev = (DeviceState *) object_dynamic_cast(mr->owner, TYPE_DEVICE);
-     mr->ram_block = NULL;
- 
-     if (name) {
--- 
-2.25.1
-
-- 
2.34.1


