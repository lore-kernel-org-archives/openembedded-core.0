Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1302CC04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 07:56:19 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.17312.1658908571496953970
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 00:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=kC/Wt4nN;
 spf=pass (domain: mvista.com, ip: 209.85.216.52,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f52.google.com with SMTP id e1so5071057pjl.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 00:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6MtVMTnTAGlgYcdCrnJolyaSsRgyec3lOOH5TfBkHd8=;
        b=kC/Wt4nNDihXnCs2rG1W6RYvxPIMmBoMk2pRWU7iO6v8zQFpHyDKKX+C5ALGCqsv2L
         CCbZgCX+rx0DxrO/k+fgHF2lyKGRwa8YRUp6P6Aeg9u89k0LQe0vYrxRA7fleYTKYTy1
         Sk5VVdFbGewpmXAEgTyxrdGJJbO1++USIoKsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6MtVMTnTAGlgYcdCrnJolyaSsRgyec3lOOH5TfBkHd8=;
        b=WRoaoMungx3hecWRC/5FCM5PLe0LJV9uyat1n3pI/l7tXxNyA3fHjo6+THtaOLGJux
         iKN8AmtJRS+BUqiL8zWb2JTAQCrJDw7FMa1qYuQFzpsQp7T+KQO2Z4UwQNeguyul/r4t
         bxA0fduu2h4gr3z/IcNc5mqFtgpD5fleAtN8drs8HHeE5QGm2yErufxyaoKJGJMdR462
         qupwrpLEd3kpngxkkV3rAUKo/hwvEBYeZJr/jwfdZapKWurUJ3Ll5gwMH99UDJH5mHnW
         py21ibpLfKOVC88PoYoAg5vSGSjagSX5lL9HIGFy/LocUlN5+hMwtMxUJQ40WDRZ0KWC
         pq7w==
X-Gm-Message-State: AJIora82OZF6bRSMhoI6QcXiRgwVHzSPCHgeYUUcBHy5UBnMieYXDTy0
	MI3f1zKHxe+nfqldkXpYJgzZk9V2GBVx5Q==
X-Google-Smtp-Source: 
 AGRyM1tpJHIYZf6Vs+8Q81VRd0zCdRJu/dFcvTHDRQOlEPvdHipzza0XlEXbZ8B+TXZjDFiqR7mfQw==
X-Received: by 2002:a17:90b:3841:b0:1f2:534d:a292 with SMTP id
 nl1-20020a17090b384100b001f2534da292mr3099647pjb.174.1658908570592;
        Wed, 27 Jul 2022 00:56:10 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.158])
        by smtp.gmail.com with ESMTPSA id
 b15-20020a170902d88f00b0016dacaa16e7sm1506137plz.13.2022.07.27.00.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 00:56:10 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Wed, 27 Jul 2022 13:25:46 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] qemu: CVE-2022-35414 can perform an uninitialized
 read on the translate_fail path, leading to an io_readx or io_writex crash
Date: Wed, 27 Jul 2022 13:25:44 +0530
Message-Id: <20220727075544.252253-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 07:56:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168547

Source: https://github.com/qemu/qemu
MR: 119832
Type: Security Fix
Disposition: Backport from https://github.com/qemu/qemu/commit/418ade7849ce7641c0f7333718caf5091a02fd4c
ChangeID: 1246afd7bb950d2d5fe2e198961797c0fa14ac00
Description:
        CVE-2022-35414 qemu: can perform an uninitialized read on the translate_fail path, leading to an io_readx or io_writex crash.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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


