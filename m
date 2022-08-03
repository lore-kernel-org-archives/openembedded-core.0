Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46EB0C19F28
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 04:50:41 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web08.5074.1659502237827326587
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 21:50:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=EF3aiwWv;
 spf=pass (domain: mvista.com, ip: 209.85.216.46,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f46.google.com with SMTP id
 w17-20020a17090a8a1100b001f326c73df6so824790pjn.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 21:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=75gWHPIrv22KkdHZOON0tJOR0EehW7SnLwC+wUc4Txo=;
        b=EF3aiwWvnV5PKfPDOq6Vl/qkFAm6QAEKvdzrQoo7v+TiZe+2nIYfvdPJyeP+PcLEwh
         iRA+8EYcFc5gYfvjrMRlBlNny9XA9pZngMvf7J2Rjn/HID++mcUMmL+/YvBVpbWd0lKf
         zYw/nwdCxOrY6Z/qi/O5Csw24eKyAZBYqarVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=75gWHPIrv22KkdHZOON0tJOR0EehW7SnLwC+wUc4Txo=;
        b=rt1fatQxwXVtGAkZ9cmvxjLju8ZA+Gpmeklr7qAgQCR8n4PmT4tT68xKr0tmEWPbiA
         pyUt1eAYBLq0CmUBGBAVhrukkAKUSsFNeHEeYNvn6Bzm7om0sgp1/z5aWWJJ25emnREX
         CBDxR6FDjCLIK8bvulZYwb6KrGlIDnNZimuAtWj7llkKOE0kgEVp+k0IlqxlEP1FDxn1
         d5tW7kFQ/F/yaNzqg6BBJQEXxbe12zGOM6zxvAwXxTkQrJQcqtj6RSl0dvLt0JVL9ao7
         0N3EIsPZTHxjWqCMfXU2XQNQPZzoMMwfvWNu6N507nZpHrhuxh2umE7EgmnSiRiP+FV+
         e+/A==
X-Gm-Message-State: ACgBeo2B/GR5nXYiMKa6f0jD7Xzstx/4JFVVOFt513EtBlu+OaQJOkd5
	tISmLcEQi3KRMqWpDVK0Sqr/OkgLSWBOTVgw
X-Google-Smtp-Source: 
 AA6agR66zRKpjE4ueYvxyX3Ueq9EMFjTk1/u3zVVOL40WHiQQFRYYFX4y4ThTur+wvPjjjqwEY18gA==
X-Received: by 2002:a17:90b:1b0c:b0:1f5:1041:a4f3 with SMTP id
 nu12-20020a17090b1b0c00b001f51041a4f3mr3089233pjb.234.1659502237079;
        Tue, 02 Aug 2022 21:50:37 -0700 (PDT)
Received: from MVIN00024 ([103.250.136.182])
        by smtp.gmail.com with ESMTPSA id
 q19-20020a170902f35300b0016bdc98730bsm628820ple.151.2022.08.02.21.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 21:50:36 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Wed, 03 Aug 2022 10:20:20 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [master][PATCH] qemu: CVE-2022-35414 can perform an uninitialized
 read on the  translate_fail path, leading to an io_readx or io_writex crash
Date: Wed,  3 Aug 2022 10:20:19 +0530
Message-Id: <20220803045019.52558-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Aug 2022 04:50:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168802

Upstream-Status: Backport [https://github.com/qemu/qemu/commit/418ade7849ce7641c0f7333718caf5091a02fd4c]
CVE: CVE-2022-35414
Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2022-35414.patch            | 53 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-35414.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index c9e48f4a5a..0db6701735 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -27,6 +27,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0008-tests-meson.build-use-relative-path-to-refer-to-file.patch \
            file://0009-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch \
            file://0010-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch \
+           file://CVE-2022-35414.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2022-35414.patch b/meta/recipes-devtools/qemu/qemu/CVE-2022-35414.patch
new file mode 100644
index 0000000000..fe79a749ae
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2022-35414.patch
@@ -0,0 +1,53 @@
+From a10c33942dc8cb31b3762b9dd4adde4c490eed9c Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Wed, 3 Aug 2022 10:11:11 +0530
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
+index 4e1b27a20..ad8a90dec 100644
+--- a/softmmu/physmem.c
++++ b/softmmu/physmem.c
+@@ -669,7 +669,7 @@ void tcg_iommu_init_notifier_list(CPUState *cpu)
+ 
+ /* Called from RCU critical section */
+ MemoryRegionSection *
+-address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
++address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr orig_addr,
+                                   hwaddr *xlat, hwaddr *plen,
+                                   MemTxAttrs attrs, int *prot)
+ {
+@@ -678,6 +678,7 @@ address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
+     IOMMUMemoryRegionClass *imrc;
+     IOMMUTLBEntry iotlb;
+     int iommu_idx;
++    hwaddr addr = orig_addr;
+     AddressSpaceDispatch *d =
+         qatomic_rcu_read(&cpu->cpu_ases[asidx].memory_dispatch);
+ 
+@@ -722,6 +723,16 @@ address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
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


