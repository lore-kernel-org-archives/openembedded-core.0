Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C587EC04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 06:53:58 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.16964.1658904822183192157
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 23:53:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=jSy909qB;
 spf=pass (domain: mvista.com, ip: 209.85.214.181,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f181.google.com with SMTP id y15so15356218plp.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 23:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QyKGklzLe67Q9afU2/7ahrKFg8rK9ecAofPadoVKcgY=;
        b=jSy909qBBlSSlqw+AxUJvjYgUpePDc/pBKORUTltSzKlblsZ8Z3biCk881Fr+CowZ+
         iEaPYamIc1QBGr8LdADVdhs9pup987Agm9m4jdgbTOFWUZEfxpwJk/r7vyPV7cgJcWyH
         3/8ZYy8r4X4rdBKtYq+ynxF07n2ANnoeXzdpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QyKGklzLe67Q9afU2/7ahrKFg8rK9ecAofPadoVKcgY=;
        b=JR6VBw2q86D3/CWh//jwP3sy18riAThEfnv/qy8XAr9gcywHITrrbI+gwZaSCKlS7b
         vU+uKy7xthEBzt6qZvqKS2GynNp3WBoW1hdnabHZA1MLLxnBB3J8uVlHjDWzFgCf8gmm
         lNt/Y3Vkm+wNtTXrHziMd+5bHuw4W48XyX79lRJPLX8tKnsFghlX0tvsid9NQ7CRrJ8X
         Narc6KbeZJd6MX/TrlUzNeNs149KnnwotPb5r1qhvIeDTq8hiIfuecaClx6ywGUNA3rh
         JeyAj3LCY8o9CCGg/Cx0xB8b2eQxz4LJblTbXQtQzwKQ88s7LYWdNDReJT1LvcxYC5FF
         GZKQ==
X-Gm-Message-State: AJIora/va8u9HITWIKE3YohNPBnkEycVGyGqiWMe5zvmwpk9dzDVW3Ev
	K6u0d9Nig4b5jhL+I9PEBO7MJd4GjI6PJQ==
X-Google-Smtp-Source: 
 AGRyM1vpTs6oV8d79PUF+0lpUJHX4Tk2TwyuSzzS8k5Em4fN2vGdpm+M6M414+wn06NGuL2Um1U63g==
X-Received: by 2002:a17:90b:4d11:b0:1f0:414b:586e with SMTP id
 mw17-20020a17090b4d1100b001f0414b586emr2964231pjb.111.1658904821003;
        Tue, 26 Jul 2022 23:53:41 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.158])
        by smtp.gmail.com with ESMTPSA id
 x11-20020a170902a38b00b0016bea2a0a8dsm12825202pla.91.2022.07.26.23.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 23:53:40 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Wed, 27 Jul 2022 12:23:26 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] qemu: CVE-2022-35414 can perform an uninitialized
 read on the translate_fail path, leading to an io_readx or io_writex crash
Date: Wed, 27 Jul 2022 12:23:25 +0530
Message-Id: <20220727065325.241476-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 06:53:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168543

Source: https://github.com/qemu/qemu
MR: 119830
Type: Security Fix
Disposition: Backport from https://github.com/qemu/qemu/commit/418ade7849ce7641c0f7333718caf5091a02fd4c
ChangeID: 41d6646e06319e629da574b9b2e8a3a197a73441
Description:
        CVE-2022-35414 qemu: can perform an uninitialized read on the translate_fail path, leading to an io_readx or io_writex crash.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2022-35414.patch            | 53 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-35414.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 8c5a649c76..2395625948 100644
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


