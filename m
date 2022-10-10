Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94F60C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 14:01:25 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.6464.1665410480459780657
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 07:01:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=gmnNLQuG;
 spf=pass (domain: mvista.com, ip: 209.85.215.176,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f176.google.com with SMTP id s206so10381314pgs.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 07:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eWcg75l1771Du5o4y7ziupezm5gWkxvrFJfUTd+jXRk=;
        b=gmnNLQuGWrKWrwEZCbLdQ1WMkTP4CW3OMGb/kWJpGG64nQ1+ptve8cBLDdALMVQVcq
         cBhWevz9HC1/2ZBTN/JWmjclfYXqvRBGVl+9RH7ch6bC/Wh6FTD8yHgmOJI4QL24Xq4s
         M+GaO82HDsmPScQkdQ5hJuxHQ0ETJ90k7z/TI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eWcg75l1771Du5o4y7ziupezm5gWkxvrFJfUTd+jXRk=;
        b=acY4TxA793NXvnISl4GGJM2eEnAFkGY3WAdpBIzi3zdmf5cCOMvCfVzshipDk/6SwZ
         0YRqsLsOKwW1HCNtckCkfFcCZYXrXiKPabaSUZdg8Cf/BOefbLyHYY0O2eAql31hNqtP
         oaREYqdo85cIKfS+1nz/E+4/71qJxDmkrgV4XlgTDl/JjKeHj6TBV+UiR5CwpfJuCio9
         mMt82gh8wxqD1UJI2R+sKyQnvIE/YGqDC6+oqoXSNj9cZ18Oamu+GFCPInEw88H9VKJG
         L1Q6Zpb9fIhJsdRX8oMuRHzDFcccTnmAm7tKWHo+IMxptvcoXrhe8qLrdLEnx2zlYAt1
         CKcg==
X-Gm-Message-State: ACrzQf23xwzKzEWAXsJ+BEtuxgoj10XzZNYc2liHmhxuLf+naWvror/p
	Un4cB5WbPVtGKKEXvReOU2mRnfRcRIyaVA==
X-Google-Smtp-Source: 
 AMsMyM7w5jK2k/HWtz+bscWqlIMZ5fIyQ1Fw9BKZk3zaybEEDf3hLtPml5sghR4aupI76Bzy2T5J5w==
X-Received: by 2002:a05:6a00:99f:b0:543:198b:f995 with SMTP id
 u31-20020a056a00099f00b00543198bf995mr19866712pfg.45.1665410479543;
        Mon, 10 Oct 2022 07:01:19 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.170])
        by smtp.gmail.com with ESMTPSA id
 jm5-20020a17090304c500b0016be834d54asm6630582plb.306.2022.10.10.07.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 07:01:17 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Mon, 10 Oct 2022 19:30:55 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] qemu: CVE-2021-3750 hcd-ehci: DMA reentrancy issue
 leads to  use-after-free
Date: Mon, 10 Oct 2022 19:30:53 +0530
Message-Id: <20221010140053.249956-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Oct 2022 14:01:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171576

Source: https://git.qemu.org/?p=qemu.git
MR: 117886
Type: Security Fix
Disposition: Backport from https://git.qemu.org/?p=qemu.git;a=commit;h=b9d383ab797f54ae5fa8746117770709921dc529 && https://git.qemu.org/?p=qemu.git;a=commit;h=3ab6fdc91b72e156da22848f0003ff4225690ced && https://git.qemu.org/?p=qemu.git;a=commit;h=58e74682baf4e1ad26b064d8c02e5bc99c75c5d9
ChangeID: 3af901d20ad8ff389468eda2c53b4943e3a77bb8
Description:
	CVE-2021-3750 QEMU: hcd-ehci: DMA reentrancy issue leads to use-after-free.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2021-3750.patch             | 180 ++++++++++++++++++
 2 files changed, 181 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3750.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 368be9979a..3c0b34d851 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -111,6 +111,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-4207.patch \
            file://CVE-2022-0216-1.patch \
            file://CVE-2022-0216-2.patch \
+           file://CVE-2021-3750.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3750.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3750.patch
new file mode 100644
index 0000000000..43630e71fb
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3750.patch
@@ -0,0 +1,180 @@
+From 1938fbc7ec197e2612ab2ce36dd69bff19208aa5 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Mon, 10 Oct 2022 17:44:41 +0530
+Subject: [PATCH] CVE-2021-3750
+
+Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=b9d383ab797f54ae5fa8746117770709921dc529 && https://git.qemu.org/?p=qemu.git;a=commit;h=3ab6fdc91b72e156da22848f0003ff4225690ced && https://git.qemu.org/?p=qemu.git;a=commit;h=58e74682baf4e1ad26b064d8c02e5bc99c75c5d9]
+CVE: CVE-2021-3750
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ exec.c                     | 55 +++++++++++++++++++++++++++++++-------
+ hw/intc/arm_gicv3_redist.c |  4 +--
+ include/exec/memattrs.h    |  9 +++++++
+ 3 files changed, 56 insertions(+), 12 deletions(-)
+
+diff --git a/exec.c b/exec.c
+index 1360051a..10581d8d 100644
+--- a/exec.c
++++ b/exec.c
+@@ -39,6 +39,7 @@
+ #include "qemu/config-file.h"
+ #include "qemu/error-report.h"
+ #include "qemu/qemu-print.h"
++#include "qemu/log.h"
+ #if defined(CONFIG_USER_ONLY)
+ #include "qemu.h"
+ #else /* !CONFIG_USER_ONLY */
+@@ -3118,6 +3119,33 @@ static bool prepare_mmio_access(MemoryRegion *mr)
+     return release_lock;
+ }
+ 
++/**
+++ * flatview_access_allowed
+++ * @mr: #MemoryRegion to be accessed
+++ * @attrs: memory transaction attributes
+++ * @addr: address within that memory region
+++ * @len: the number of bytes to access
+++ *
+++ * Check if a memory transaction is allowed.
+++ *
+++ * Returns: true if transaction is allowed, false if denied.
+++ */
++static bool flatview_access_allowed(MemoryRegion *mr, MemTxAttrs attrs,
++                                    hwaddr addr, hwaddr len)
++{
++    if (likely(!attrs.memory)) {
++        return true;
++    }
++    if (memory_region_is_ram(mr)) {
++        return true;
++    }
++    qemu_log_mask(LOG_GUEST_ERROR,
++                  "Invalid access to non-RAM device at "
++                  "addr 0x%" HWADDR_PRIX ", size %" HWADDR_PRIu ", "
++                  "region '%s'\n", addr, len, memory_region_name(mr));
++    return false;
++}
++
+ /* Called within RCU critical section.  */
+ static MemTxResult flatview_write_continue(FlatView *fv, hwaddr addr,
+                                            MemTxAttrs attrs,
+@@ -3131,7 +3159,10 @@ static MemTxResult flatview_write_continue(FlatView *fv, hwaddr addr,
+     bool release_lock = false;
+ 
+     for (;;) {
+-        if (!memory_access_is_direct(mr, true)) {
++	if (!flatview_access_allowed(mr, attrs, addr1, l)) {
++            result |= MEMTX_ACCESS_ERROR;
++            /* Keep going. */
++        } else if (!memory_access_is_direct(mr, true)) {
+             release_lock |= prepare_mmio_access(mr);
+             l = memory_access_size(mr, l, addr1);
+             /* XXX: could force current_cpu to NULL to avoid
+@@ -3173,14 +3204,14 @@ static MemTxResult flatview_write(FlatView *fv, hwaddr addr, MemTxAttrs attrs,
+     hwaddr l;
+     hwaddr addr1;
+     MemoryRegion *mr;
+-    MemTxResult result = MEMTX_OK;
+ 
+     l = len;
+     mr = flatview_translate(fv, addr, &addr1, &l, true, attrs);
+-    result = flatview_write_continue(fv, addr, attrs, buf, len,
+-                                     addr1, l, mr);
+-
+-    return result;
++    if (!flatview_access_allowed(mr, attrs, addr, len)) {
++        return MEMTX_ACCESS_ERROR;
++    }
++    return flatview_write_continue(fv, addr, attrs, buf, len,
++                                   addr1, l, mr);
+ }
+ 
+ /* Called within RCU critical section.  */
+@@ -3195,7 +3226,10 @@ MemTxResult flatview_read_continue(FlatView *fv, hwaddr addr,
+     bool release_lock = false;
+ 
+     for (;;) {
+-        if (!memory_access_is_direct(mr, false)) {
++        if (!flatview_access_allowed(mr, attrs, addr1, l)) {
++            result |= MEMTX_ACCESS_ERROR;
++            /* Keep going. */
++        } else if (!memory_access_is_direct(mr, false)) {
+             /* I/O case */
+             release_lock |= prepare_mmio_access(mr);
+             l = memory_access_size(mr, l, addr1);
+@@ -3238,6 +3272,9 @@ static MemTxResult flatview_read(FlatView *fv, hwaddr addr,
+ 
+     l = len;
+     mr = flatview_translate(fv, addr, &addr1, &l, false, attrs);
++    if (!flatview_access_allowed(mr, attrs, addr, len)) {
++        return MEMTX_ACCESS_ERROR;
++    }
+     return flatview_read_continue(fv, addr, attrs, buf, len,
+                                   addr1, l, mr);
+ }
+@@ -3474,12 +3511,10 @@ bool address_space_access_valid(AddressSpace *as, hwaddr addr,
+                                 MemTxAttrs attrs)
+ {
+     FlatView *fv;
+-    bool result;
+ 
+     RCU_READ_LOCK_GUARD();
+     fv = address_space_to_flatview(as);
+-    result = flatview_access_valid(fv, addr, len, is_write, attrs);
+-    return result;
++    return flatview_access_valid(fv, addr, len, is_write, attrs);
+ }
+ 
+ static hwaddr
+diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
+index 8645220d..44368e28 100644
+--- a/hw/intc/arm_gicv3_redist.c
++++ b/hw/intc/arm_gicv3_redist.c
+@@ -450,7 +450,7 @@ MemTxResult gicv3_redist_read(void *opaque, hwaddr offset, uint64_t *data,
+         break;
+     }
+ 
+-    if (r == MEMTX_ERROR) {
++    if (r != MEMTX_OK) {
+         qemu_log_mask(LOG_GUEST_ERROR,
+                       "%s: invalid guest read at offset " TARGET_FMT_plx
+                       "size %u\n", __func__, offset, size);
+@@ -507,7 +507,7 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
+         break;
+     }
+ 
+-    if (r == MEMTX_ERROR) {
++    if (r != MEMTX_OK) {
+         qemu_log_mask(LOG_GUEST_ERROR,
+                       "%s: invalid guest write at offset " TARGET_FMT_plx
+                       "size %u\n", __func__, offset, size);
+diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
+index 95f2d20d..9fb98bc1 100644
+--- a/include/exec/memattrs.h
++++ b/include/exec/memattrs.h
+@@ -35,6 +35,14 @@ typedef struct MemTxAttrs {
+     unsigned int secure:1;
+     /* Memory access is usermode (unprivileged) */
+     unsigned int user:1;
++    /*
++     * Bus interconnect and peripherals can access anything (memories,
++     * devices) by default. By setting the 'memory' bit, bus transaction
++     * are restricted to "normal" memories (per the AMBA documentation)
++     * versus devices. Access to devices will be logged and rejected
++     * (see MEMTX_ACCESS_ERROR).
++     */
++    unsigned int memory:1;
+     /* Requester ID (for MSI for example) */
+     unsigned int requester_id:16;
+     /* Invert endianness for this page */
+@@ -66,6 +74,7 @@ typedef struct MemTxAttrs {
+ #define MEMTX_OK 0
+ #define MEMTX_ERROR             (1U << 0) /* device returned an error */
+ #define MEMTX_DECODE_ERROR      (1U << 1) /* nothing at that address */
++#define MEMTX_ACCESS_ERROR      (1U << 2) /* access denied */
+ typedef uint32_t MemTxResult;
+ 
+ #endif
+-- 
+2.25.1
+
-- 
2.25.1


