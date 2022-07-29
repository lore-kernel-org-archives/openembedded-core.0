Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D0FAC00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 14:47:28 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.46.1659106046384414125
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:47:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=v7+r/XpO;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id e16so4806235pfm.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lmGGLUZM/ZoarsTVh77Ut3yQTta9abBAXSk/VvmLXKI=;
        b=v7+r/XpO0SIE00xWINL/LQWcna/hvD5XmnehkFN4+kroeKQdX1EhLoMkgyoI/MKuHg
         mUT2KZg3yy8jGQOZcT5oBKv8Z2J1DsyOoUAHeHIytXL5+/GN+1Cag+H95oFh9WqoV7vr
         Cb5Sr/lPgSOMBwVvvZ62xVncvIS14JZSnqZMqtei9ZxD9/saJ7//jENWWUM6z4goOCNc
         wGSWblP6hEut+l3UeqURrolKXFBfJFwfG9cNf31UfZiPxkZ1eBbGShX/nPK9x3WEuKJT
         5b0o04CfWDPvQDwpW7DFJ/1PT+Td7A3wV5rhfAeBYu4jCsksRBEKD9SU3l9h6N1tKoPY
         RFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lmGGLUZM/ZoarsTVh77Ut3yQTta9abBAXSk/VvmLXKI=;
        b=nXWv+67N0GnuyNsBzVdnfTIYqRolzor1L0A6kqQfYQt07O/HzRMvuuRhIEMiNs2Ed8
         qtKFEHaOnfaeDbOXJrFUf4Z7PfBdNQZIgI0DbAkC29wTu1ZoweJuOJSQfqhwzP7kumjf
         pBtdlFMjVK38xwKOsSrFea2r1qaIvhRqHoguGpOG6TZknFn6IHP/Lx/Vbyp0zohIwNMR
         cpAmGgqSBfLvI889+in/4Pvu7kvmDA5Ld3v7uhsr+bWVY55r08WKOKaA+7Z1o3AaVdvK
         gklxAcCue6V86hEMUv/HWCQcBMI6fcZHkHIr9bJ6OUXui12LD8O2TZlR1zM7P2odW7bU
         dibA==
X-Gm-Message-State: AJIora+5pf4YeWXYgR36su3FGBImvcDJoludce3CoUeiyZdz8KjY28ow
	K0YO2jQeZOpjRT9PsB36WpZF3CSZFYHYTVeL
X-Google-Smtp-Source: 
 AGRyM1t/3XzdlWUc7ZdotHgDMbTuaHPtrfLdi9mYp5iahbQIOECiIg2oc2eYFEDVtQFyS/X657NzFw==
X-Received: by 2002:a63:4546:0:b0:41b:99c8:4cec with SMTP id
 u6-20020a634546000000b0041b99c84cecmr1541576pgk.220.1659106045286;
        Fri, 29 Jul 2022 07:47:25 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x24-20020aa79418000000b00528c6c7bf37sm2958782pfo.129.2022.07.29.07.47.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 07:47:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/29] qemu: CVE-2022-35414 can perform an
 uninitialized read on the translate_fail path,
 leading to an io_readx or io_writex crash
Date: Fri, 29 Jul 2022 04:46:17 -1000
Message-Id: 
 <5f236e744b5b528bdf8d95c9580c273f63c04452.1659105705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659105705.git.steve@sakoman.com>
References: <cover.1659105705.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 14:47:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168636

From: Hitendra Prajapati <hprajapati@mvista.com>

Source: https://github.com/qemu/qemu
MR: 119830
Type: Security Fix
Disposition: Backport from https://github.com/qemu/qemu/commit/418ade7849ce7641c0f7333718caf5091a02fd4c
ChangeID: 41d6646e06319e629da574b9b2e8a3a197a73441
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
index 63f0569d06..54a68e1730 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -35,6 +35,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://pvrdma.patch \
            file://CVE-2021-4206.patch \
            file://CVE-2021-4207.patch \
+           file://CVE-2022-35414.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2022-35414.patch b/meta/recipes-devtools/qemu/qemu/CVE-2022-35414.patch
new file mode 100644
index 0000000000..3786497f01
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2022-35414.patch
@@ -0,0 +1,53 @@
+From ee76e64ee1cb232b77652b21cc94ec6b6c7e4b13 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Wed, 27 Jul 2022 10:49:47 +0530
+Subject: [PATCH] CVE-2022-35414
+
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/418ade7849ce7641c0f7333718caf5091a02fd4c]
+CVE: CVE-2022-35414
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ softmmu/physmem.c | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/softmmu/physmem.c b/softmmu/physmem.c
+index 3524c04c2..3c467527d 100644
+--- a/softmmu/physmem.c
++++ b/softmmu/physmem.c
+@@ -667,7 +667,7 @@ void tcg_iommu_init_notifier_list(CPUState *cpu)
+ 
+ /* Called from RCU critical section */
+ MemoryRegionSection *
+-address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
++address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr orig_addr,
+                                   hwaddr *xlat, hwaddr *plen,
+                                   MemTxAttrs attrs, int *prot)
+ {
+@@ -676,6 +676,7 @@ address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
+     IOMMUMemoryRegionClass *imrc;
+     IOMMUTLBEntry iotlb;
+     int iommu_idx;
++    hwaddr addr = orig_addr;
+     AddressSpaceDispatch *d =
+         qatomic_rcu_read(&cpu->cpu_ases[asidx].memory_dispatch);
+ 
+@@ -720,6 +721,16 @@ address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
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
+ 
+-- 
+2.25.1
+
-- 
2.25.1


