Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74FC5C4321E
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 23:08:56 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web08.695.1666048130714695003
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Oct 2022 16:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=qdubNJPk;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id l6so11764594pgu.7
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 16:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UyONofP2IeZ+Lu+6b8uH1qqq873IiqdstuX/UogVugI=;
        b=qdubNJPkdfs6A6jiL6JVzuXhFrf3c2rApAdjBa0A6JLq5JNN3Yw9fAbWak5O21hfIR
         cHcRECBCf3iu1tSAIN1tJBZd0HY6FBsPyYu0y4ATt3o66AzgXLJ6U94xRS5cPmXUg+PP
         leO7nUT4LGKMOCC6TPBjGR+yvOOSSaZ9qvL36jDhYXfJCMbmknMlmdQGxlT+iiULoo6g
         8irdMnqD53ZX6EetB6DIfYylm4SgKnLYCfjocdr3I6/tTm8OwPIzRRF0iXAs3UrnogXc
         odFP1tja8OCZFWBS9N/zALQBe2w4xI+ELfxmpocr+gc5tjvSPrGGfEavbxn/Mu2Vr4Ha
         Vxow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UyONofP2IeZ+Lu+6b8uH1qqq873IiqdstuX/UogVugI=;
        b=E9OeVtGLdSzP6XLrC8WEcG523tkeZskJmG4sybo9VE5l/x60MiFKhTgfwee2TFCTej
         b1CiGGtd6YBuX+YsL5PXcWtLdQ5ZDhnQnAIvAWbPO6ZyUWPnmFZEC5Ixl9yVdwDxLi51
         HDBKzybDtaLFuPlAeRi6JAtIoknOMnibUKAhaaYMCgwFcvP+x+uJDIljttdFYDvU5Ruo
         y7qTAO7ehUhOnBjMwB3srib9ncz1Pn6Wa9fUn32RqAPLzM9kqXRMyL+8xhoYyw+oWqt7
         dwaa4GfDq+8iSXv0MuZDx6p5O++qF+x5E18w4EssnDjTmDO7EM37HzjtzN/mebCbyD7o
         cbPQ==
X-Gm-Message-State: ACrzQf0ntVJ0wMtUOVD+K8j2SEQB9rLj7pA8EBXEGFy/8bDtimzJa0Sm
	SZQwuQlPF+t+o1IeliMPBoqln9CXnf1EYKj8
X-Google-Smtp-Source: AMsMyM4rG7cqAZY6NJrG9/uW3xi/cb/V42tU0cQYR56c35K3kqaMQ2ET7cL9xi86inx0+9s6aXnyPA==
X-Received: by 2002:a65:6042:0:b0:440:56aa:d5cf with SMTP id a2-20020a656042000000b0044056aad5cfmr112260pgp.81.1666048129443;
        Mon, 17 Oct 2022 16:08:49 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id j6-20020a17090a694600b0020aacde1964sm10119479pjm.32.2022.10.17.16.08.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 16:08:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/13] qemu: Fix CVE-2021-3750 for qemu
Date: Mon, 17 Oct 2022 13:08:19 -1000
Message-Id: <e9e945a1d22b06d10ac07345b7cebcf232a809bb.1666047986.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1666047986.git.steve@sakoman.com>
References: <cover.1666047986.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 23:08:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171921

From: Virendra Thakur <virendra.thakur@kpit.com>

Add patch to fix CVE-2021-3750

Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   3 +
 .../qemu/qemu/CVE-2021-3750-1.patch           |  59 +++++++
 .../qemu/qemu/CVE-2021-3750-2.patch           |  65 ++++++++
 .../qemu/qemu/CVE-2021-3750-3.patch           | 156 ++++++++++++++++++
 4 files changed, 283 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3750-1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3750-2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3750-3.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index a493ac8add..816f9a7eac 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -43,6 +43,9 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2022-0358.patch \
            file://CVE-2022-0216_1.patch \
            file://CVE-2022-0216_2.patch \
+           file://CVE-2021-3750-1.patch \
+           file://CVE-2021-3750-2.patch \
+           file://CVE-2021-3750-3.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3750-1.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3750-1.patch
new file mode 100644
index 0000000000..e898c20767
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3750-1.patch
@@ -0,0 +1,59 @@
+From b9d383ab797f54ae5fa8746117770709921dc529 Mon Sep 17 00:00:00 2001
+From: =?utf8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
+Date: Wed, 15 Dec 2021 19:24:19 +0100
+Subject: [PATCH] hw/intc/arm_gicv3: Check for !MEMTX_OK instead of MEMTX_ERROR
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf8
+Content-Transfer-Encoding: 8bit
+
+Quoting Peter Maydell:
+
+ "These MEMTX_* aren't from the memory transaction
+  API functions; they're just being used by gicd_readl() and
+  friends as a way to indicate a success/failure so that the
+  actual MemoryRegionOps read/write fns like gicv3_dist_read()
+  can log a guest error."
+
+We are going to introduce more MemTxResult bits, so it is
+safer to check for !MEMTX_OK rather than MEMTX_ERROR.
+
+Reviewed-by: Peter Xu <peterx@redhat.com>
+Reviewed-by: David Hildenbrand <david@redhat.com>
+Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
+Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
+Signed-off-by: Philippe Mathieu-DaudÃfÂ© <philmd@redhat.com>
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+
+CVE: CVE-2021-3750
+
+Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=b9d383ab797f54ae5fa8746117770709921dc529]
+---
+ hw/intc/arm_gicv3_redist.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
+index c8ff3ec..99b11ca 100644
+--- a/hw/intc/arm_gicv3_redist.c
++++ b/hw/intc/arm_gicv3_redist.c
+@@ -462,7 +462,7 @@ MemTxResult gicv3_redist_read(void *opaque, hwaddr offset, uint64_t *data,
+         break;
+     }
+
+-    if (r == MEMTX_ERROR) {
++    if (r != MEMTX_OK) {
+         qemu_log_mask(LOG_GUEST_ERROR,
+                       "%s: invalid guest read at offset " TARGET_FMT_plx
+                       " size %u\n", __func__, offset, size);
+@@ -521,7 +521,7 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
+         break;
+     }
+
+-    if (r == MEMTX_ERROR) {
++    if (r != MEMTX_OK) {
+         qemu_log_mask(LOG_GUEST_ERROR,
+                       "%s: invalid guest write at offset " TARGET_FMT_plx
+                       " size %u\n", __func__, offset, size);
+--
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3750-2.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3750-2.patch
new file mode 100644
index 0000000000..f163b4fab3
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3750-2.patch
@@ -0,0 +1,65 @@
+From 58e74682baf4e1ad26b064d8c02e5bc99c75c5d9 Mon Sep 17 00:00:00 2001
+From: =?utf8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
+Date: Wed, 15 Dec 2021 19:24:20 +0100
+Subject: [PATCH] softmmu/physmem: Simplify flatview_write and
+ address_space_access_valid
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf8
+Content-Transfer-Encoding: 8bit
+
+Remove unuseful local 'result' variables.
+
+Reviewed-by: Peter Xu <peterx@redhat.com>
+Reviewed-by: David Hildenbrand <david@redhat.com>
+Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
+Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
+Signed-off-by: Philippe Mathieu-DaudÃfÂ© <philmd@redhat.com>
+Message-Id: <20211215182421.418374-3-philmd@redhat.com>
+Signed-off-by: Thomas Huth <thuth@redhat.com>
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+
+CVE: CVE-2021-3750
+
+Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=58e74682baf4e1ad26b064d8c02e5bc99c75c5d9]
+---
+ softmmu/physmem.c | 11 +++--------
+ 1 file changed, 3 insertions(+), 8 deletions(-)
+
+diff --git a/softmmu/physmem.c b/softmmu/physmem.c
+index 43ae70f..3d968ca 100644
+--- a/softmmu/physmem.c
++++ b/softmmu/physmem.c
+@@ -2826,14 +2826,11 @@ static MemTxResult flatview_write(FlatVi
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
++    return flatview_write_continue(fv, addr, attrs, buf, len,
++                                   addr1, l, mr);
+ }
+
+ /* Called within RCU critical section.  */
+@@ -3130,12 +3127,10 @@ bool address_space_access_valid(AddressS
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
+--
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3750-3.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3750-3.patch
new file mode 100644
index 0000000000..24668ad1a5
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3750-3.patch
@@ -0,0 +1,156 @@
+From 3ab6fdc91b72e156da22848f0003ff4225690ced Mon Sep 17 00:00:00 2001
+From: =?utf8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
+Date: Wed, 15 Dec 2021 19:24:21 +0100
+Subject: [PATCH] softmmu/physmem: Introduce MemTxAttrs::memory field and
+ MEMTX_ACCESS_ERROR
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf8
+Content-Transfer-Encoding: 8bit
+
+Add the 'memory' bit to the memory attributes to restrict bus
+controller accesses to memories.
+
+Introduce flatview_access_allowed() to check bus permission
+before running any bus transaction.
+
+Have read/write accessors return MEMTX_ACCESS_ERROR if an access is
+restricted.
+
+There is no change for the default case where 'memory' is not set.
+
+Signed-off-by: Philippe Mathieu-DaudÃfÂ© <philmd@redhat.com>
+Message-Id: <20211215182421.418374-4-philmd@redhat.com>
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
+[thuth: Replaced MEMTX_BUS_ERROR with MEMTX_ACCESS_ERROR, remove "inline"]
+Signed-off-by: Thomas Huth <thuth@redhat.com>
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+
+CVE: CVE-2021-3750
+
+Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=3ab6fdc91b72e156da22848f0003ff4225690ced]
+---
+ include/exec/memattrs.h |  9 +++++++++
+ softmmu/physmem.c       | 44 ++++++++++++++++++++++++++++++++++++++++++--
+ 2 files changed, 51 insertions(+), 2 deletions(-)
+
+diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
+index 95f2d20..9fb98bc 100644
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
+diff --git a/softmmu/physmem.c b/softmmu/physmem.c
+index 3d968ca..4e1b27a 100644
+--- a/softmmu/physmem.c
++++ b/softmmu/physmem.c
+@@ -41,6 +41,7 @@
+ #include "qemu/config-file.h"
+ #include "qemu/error-report.h"
+ #include "qemu/qemu-print.h"
++#include "qemu/log.h"
+ #include "exec/memory.h"
+ #include "exec/ioport.h"
+ #include "sysemu/dma.h"
+@@ -2759,6 +2760,33 @@ static bool prepare_mmio_access(MemoryRe
+     return release_lock;
+ }
+
++/**
++ * flatview_access_allowed
++ * @mr: #MemoryRegion to be accessed
++ * @attrs: memory transaction attributes
++ * @addr: address within that memory region
++ * @len: the number of bytes to access
++ *
++ * Check if a memory transaction is allowed.
++ *
++ * Returns: true if transaction is allowed, false if denied.
++ */
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
+@@ -2773,7 +2801,10 @@ static MemTxResult flatview_write_contin
+     const uint8_t *buf = ptr;
+
+     for (;;) {
+-        if (!memory_access_is_direct(mr, true)) {
++        if (!flatview_access_allowed(mr, attrs, addr1, l)) {
++            result |= MEMTX_ACCESS_ERROR;
++            /* Keep going. */
++        } else if (!memory_access_is_direct(mr, true)) {
+             release_lock |= prepare_mmio_access(mr);
+             l = memory_access_size(mr, l, addr1);
+             /* XXX: could force current_cpu to NULL to avoid
+@@ -2818,6 +2849,9 @@ static MemTxResult flatview_write(FlatVi
+
+     l = len;
+     mr = flatview_translate(fv, addr, &addr1, &l, true, attrs);
++    if (!flatview_access_allowed(mr, attrs, addr, len)) {
++        return MEMTX_ACCESS_ERROR;
++    }
+     return flatview_write_continue(fv, addr, attrs, buf, len,
+                                    addr1, l, mr);
+ }
+@@ -2836,7 +2870,10 @@ MemTxResult flatview_read_continue(FlatV
+
+     fuzz_dma_read_cb(addr, len, mr);
+     for (;;) {
+-        if (!memory_access_is_direct(mr, false)) {
++        if (!flatview_access_allowed(mr, attrs, addr1, l)) {
++            result |= MEMTX_ACCESS_ERROR;
++            /* Keep going. */
++        } else if (!memory_access_is_direct(mr, false)) {
+             /* I/O case */
+             release_lock |= prepare_mmio_access(mr);
+             l = memory_access_size(mr, l, addr1);
+@@ -2879,6 +2916,9 @@ static MemTxResult flatview_read(FlatVie
+
+     l = len;
+     mr = flatview_translate(fv, addr, &addr1, &l, false, attrs);
++    if (!flatview_access_allowed(mr, attrs, addr, len)) {
++        return MEMTX_ACCESS_ERROR;
++    }
+     return flatview_read_continue(fv, addr, attrs, buf, len,
+                                   addr1, l, mr);
+ }
+--
+1.8.3.1
+
-- 
2.25.1


