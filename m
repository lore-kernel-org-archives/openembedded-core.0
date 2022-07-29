Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7204C19F2B
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 15:24:58 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.506.1659108291463422767
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 08:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=RebGCuuc;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id c139so4919878pfc.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 08:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kdKGz5cgbaX9++89bb8NDKKmnYmEq/ujYsQX0G4MuAw=;
        b=RebGCuucU7Ykk4gxkYAJK/zfafw0Fp8sOjdtNMoZT5FaU7e35a3oU/51n+x9cVz6Uk
         k9GFaNxJzr0yvr0HdZD60ncZGyihjazT/oqqrT6jde8si1H5Iy+WEIakMevZdXtA5ae/
         uv5PlrmiIBfxXMFRWHjZGP0yrEcWEOP9W8GzRpYywluWyO0kucGN5xRBFCQwwf3mZwDl
         lFxQOsUtP1VEEs3ds6L2Za+9Clsfv6EeJiHXPdvaSYL6HGgLj5hMEWMc3S9PRh4qxgE0
         zMlXZfvU2KB/4mmgvMhSTURApsLmTEpi4BbsN2pbd2zlO4U+j8QOy8s00g5U2S6pvb7/
         MXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kdKGz5cgbaX9++89bb8NDKKmnYmEq/ujYsQX0G4MuAw=;
        b=JWhO4IpyJdySlPSKw1rZng/8l64e84s9WjBFfzLcV7ycYfDPxfwcsoSA31wofHzZM7
         ulHxQqzu5yeMPYcZ6F62mUrrWhpIW++Q51T485uyLVapgbkaQYPwZ215scbdb6sPZ7Ij
         7Cz6BP+gs5PAYYrsxde764SPyhV4CFEPc/EuCldoYMlzOiYXtmAngYwsOIFi61hPiaxd
         u+2jtq+gb8fDkGEvA8PLR1ol203njaUvPLPityiiFym04Ups23mTGVPoOfYUaynmL0XZ
         ocC6EyuUoXFhPA+uZxLNi9/gYKSTMq+ze6vxecZdUN2lNbqQ8iwf4hcqklV91wxKIsrj
         5/qA==
X-Gm-Message-State: AJIora99BOuW8XYmastBsby6qDFClSAjVCmdAwSb7kqe4UekUszthIzD
	gvCoPhwJr7A66We4IXowcqscfPZxEqMycdJj
X-Google-Smtp-Source: 
 AGRyM1utfzMh+rtznKTDCx/wWQYhCcXBsO+jQRjKqrhUut64S9wVaMAFb+Od6c8Aiu8XGkLEYvhUTw==
X-Received: by 2002:a05:6a00:248f:b0:52b:ee89:ec22 with SMTP id
 c15-20020a056a00248f00b0052bee89ec22mr3979617pfv.43.1659108290394;
        Fri, 29 Jul 2022 08:24:50 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 q16-20020a17090311d000b0016be6a554b5sm3889808plh.233.2022.07.29.08.24.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 08:24:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/7] qemu: CVE-2022-35414 can perform an
 uninitialized read on the translate_fail path,
 leading to an io_readx or io_writex crash
Date: Fri, 29 Jul 2022 05:24:09 -1000
Message-Id: 
 <7c3043df56b3090138fe56f8c06df5ca08cafd26.1659108121.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659108121.git.steve@sakoman.com>
References: <cover.1659108121.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 15:24:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168670

From: Hitendra Prajapati <hprajapati@mvista.com>

Source: https://github.com/qemu/qemu
MR: 119832
Type: Security Fix
Disposition: Backport from https://github.com/qemu/qemu/commit/418ade7849ce7641c0f7333718caf5091a02fd4c
ChangeID: 1246afd7bb950d2d5fe2e198961797c0fa14ac00
Description:
        CVE-2022-35414 qemu: can perform an uninitialized read on the translate_fail path, leading to an io_readx or io_writex crash.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2022-35414.patch            | 53 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-35414.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 4135619fc6..10b4280b23 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -98,6 +98,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2020-13253_4.patch \
            file://CVE-2020-13253_5.patch \
            file://CVE-2020-13791.patch \
+           file://CVE-2022-35414.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2022-35414.patch b/meta/recipes-devtools/qemu/qemu/CVE-2022-35414.patch
new file mode 100644
index 0000000000..4196ebcf98
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2022-35414.patch
@@ -0,0 +1,53 @@
+From 09a07b5b39c87423df9e8f6574c19a14d36beac5 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Wed, 27 Jul 2022 10:34:12 +0530
+Subject: [PATCH] CVE-2022-35414
+
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/418ade7849ce7641c0f7333718caf5091a02fd4c]
+CVE: CVE-2022-35414
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ exec.c | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/exec.c b/exec.c
+index 43c70ffb..2d6add46 100644
+--- a/exec.c
++++ b/exec.c
+@@ -685,7 +685,7 @@ static void tcg_iommu_free_notifier_list(CPUState *cpu)
+ 
+ /* Called from RCU critical section */
+ MemoryRegionSection *
+-address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
++address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr orig_addr,
+                                   hwaddr *xlat, hwaddr *plen,
+                                   MemTxAttrs attrs, int *prot)
+ {
+@@ -694,6 +694,7 @@ address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
+     IOMMUMemoryRegionClass *imrc;
+     IOMMUTLBEntry iotlb;
+     int iommu_idx;
++    hwaddr addr = orig_addr;
+     AddressSpaceDispatch *d = atomic_rcu_read(&cpu->cpu_ases[asidx].memory_dispatch);
+ 
+     for (;;) {
+@@ -737,6 +738,16 @@ address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
+     return section;
+ 
+ translate_fail:
++    /*
++     * We should be given a page-aligned address -- certainly
++     * tlb_set_page_with_attrs() does so.  The page offset of xlat
++     * is used to index sections[], and PHYS_SECTION_UNASSIGNED = 0.
++     * The page portion of xlat will be logged by memory_region_access_valid()
++     * when this memory access is rejected, so use the original untranslated
++     * physical address.
++     */
++    assert((orig_addr & ~TARGET_PAGE_MASK) == 0);
++    *xlat = orig_addr;
+     return &d->map.sections[PHYS_SECTION_UNASSIGNED];
+ }
+ #endif
+-- 
+2.25.1
+
-- 
2.25.1


