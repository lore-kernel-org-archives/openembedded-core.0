Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FD80C433EF
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 22:08:21 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web12.63.1654034899195803834
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 15:08:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 24VM8CXf012183
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 15:08:17 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 31 May 2022 15:08:13 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 31 May 2022 15:08:13 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 31 May 2022 15:08:13 -0700
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/4] qemu: fix CVE-2021-3750
Date: Tue, 31 May 2022 18:08:05 -0400
Message-ID: <20220531220807.8032-2-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220531220807.8032-1-sakib.sajal@windriver.com>
References: <20220531220807.8032-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.wrs.com id
 24VM8CXf012183
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 May 2022 22:08:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166342

Backport appropriate patches to resolve CVE-2021-3750.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   3 +
 .../qemu/qemu/CVE-2021-3750_1.patch           |  60 +++++++
 .../qemu/qemu/CVE-2021-3750_2.patch           |  65 ++++++++
 .../qemu/qemu/CVE-2021-3750_3.patch           | 156 ++++++++++++++++++
 4 files changed, 284 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3750_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3750_2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3750_3.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index aa372810ce..5605ece5bb 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -77,6 +77,9 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
            file://CVE-2021-20196_2.patch \
            file://CVE-2021-4145_1.patch \
            file://CVE-2021-4145_2.patch \
+           file://CVE-2021-3750_1.patch \
+           file://CVE-2021-3750_2.patch \
+           file://CVE-2021-3750_3.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3750_1.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3750_1.patch
new file mode 100644
index 0000000000..8381661886
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3750_1.patch
@@ -0,0 +1,60 @@
+From d09eb9fc1459f5c8b623f3f2134c3c007b4e6344 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat=
.com>
+Date: Wed, 15 Dec 2021 19:24:19 +0100
+Subject: [PATCH 1/3] hw/intc/arm_gicv3: Check for !MEMTX_OK instead of
+ MEMTX_ERROR
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
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
+Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+
+CVE: CVE-2021-3750
+Upstream-Status: Backport [b9d383ab797f54ae5fa8746117770709921dc529]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/intc/arm_gicv3_redist.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
+index 8645220d6..44368e285 100644
+--- a/hw/intc/arm_gicv3_redist.c
++++ b/hw/intc/arm_gicv3_redist.c
+@@ -450,7 +450,7 @@ MemTxResult gicv3_redist_read(void *opaque, hwaddr o=
ffset, uint64_t *data,
+         break;
+     }
+=20
+-    if (r =3D=3D MEMTX_ERROR) {
++    if (r !=3D MEMTX_OK) {
+         qemu_log_mask(LOG_GUEST_ERROR,
+                       "%s: invalid guest read at offset " TARGET_FMT_pl=
x
+                       "size %u\n", __func__, offset, size);
+@@ -507,7 +507,7 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr =
offset, uint64_t data,
+         break;
+     }
+=20
+-    if (r =3D=3D MEMTX_ERROR) {
++    if (r !=3D MEMTX_OK) {
+         qemu_log_mask(LOG_GUEST_ERROR,
+                       "%s: invalid guest write at offset " TARGET_FMT_p=
lx
+                       "size %u\n", __func__, offset, size);
+--=20
+2.33.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3750_2.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3750_2.patch
new file mode 100644
index 0000000000..82d2675ab2
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3750_2.patch
@@ -0,0 +1,65 @@
+From 13e82fe73aca591cc4160688597515c7fb6f9788 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat=
.com>
+Date: Wed, 15 Dec 2021 19:24:20 +0100
+Subject: [PATCH 2/3] softmmu/physmem: Simplify flatview_write and
+ address_space_access_valid
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Remove unuseful local 'result' variables.
+
+Reviewed-by: Peter Xu <peterx@redhat.com>
+Reviewed-by: David Hildenbrand <david@redhat.com>
+Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
+Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
+Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
+Message-Id: <20211215182421.418374-3-philmd@redhat.com>
+Signed-off-by: Thomas Huth <thuth@redhat.com>
+
+CVE: CVE-2021-3750
+Upstream-Status: Backport [58e74682baf4e1ad26b064d8c02e5bc99c75c5d9]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ softmmu/physmem.c | 11 +++--------
+ 1 file changed, 3 insertions(+), 8 deletions(-)
+
+diff --git a/softmmu/physmem.c b/softmmu/physmem.c
+index 2cd1de4a2..68612afbd 100644
+--- a/softmmu/physmem.c
++++ b/softmmu/physmem.c
+@@ -2792,14 +2792,11 @@ static MemTxResult flatview_write(FlatView *fv, =
hwaddr addr, MemTxAttrs attrs,
+     hwaddr l;
+     hwaddr addr1;
+     MemoryRegion *mr;
+-    MemTxResult result =3D MEMTX_OK;
+=20
+     l =3D len;
+     mr =3D flatview_translate(fv, addr, &addr1, &l, true, attrs);
+-    result =3D flatview_write_continue(fv, addr, attrs, buf, len,
+-                                     addr1, l, mr);
+-
+-    return result;
++    return flatview_write_continue(fv, addr, attrs, buf, len,
++                                   addr1, l, mr);
+ }
+=20
+ /* Called within RCU critical section.  */
+@@ -3096,12 +3093,10 @@ bool address_space_access_valid(AddressSpace *as=
, hwaddr addr,
+                                 MemTxAttrs attrs)
+ {
+     FlatView *fv;
+-    bool result;
+=20
+     RCU_READ_LOCK_GUARD();
+     fv =3D address_space_to_flatview(as);
+-    result =3D flatview_access_valid(fv, addr, len, is_write, attrs);
+-    return result;
++    return flatview_access_valid(fv, addr, len, is_write, attrs);
+ }
+=20
+ static hwaddr
+--=20
+2.33.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3750_3.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3750_3.patch
new file mode 100644
index 0000000000..e5748b50ce
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3750_3.patch
@@ -0,0 +1,156 @@
+From 9df520db8c1bf24f1ff1c9739b7870056f2bc991 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat=
.com>
+Date: Wed, 15 Dec 2021 19:24:21 +0100
+Subject: [PATCH 3/3] softmmu/physmem: Introduce MemTxAttrs::memory field=
 and
+ MEMTX_ACCESS_ERROR
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
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
+Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
+Message-Id: <20211215182421.418374-4-philmd@redhat.com>
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
+[thuth: Replaced MEMTX_BUS_ERROR with MEMTX_ACCESS_ERROR, remove "inline=
"]
+Signed-off-by: Thomas Huth <thuth@redhat.com>
+
+CVE: CVE-2021-3750
+Upstream-Status: Backport [3ab6fdc91b72e156da22848f0003ff4225690ced]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ include/exec/memattrs.h |  9 +++++++++
+ softmmu/physmem.c       | 44 +++++++++++++++++++++++++++++++++++++++--
+ 2 files changed, 51 insertions(+), 2 deletions(-)
+
+diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
+index 95f2d20d5..9fb98bc1e 100644
+--- a/include/exec/memattrs.h
++++ b/include/exec/memattrs.h
+@@ -35,6 +35,14 @@ typedef struct MemTxAttrs {
+     unsigned int secure:1;
+     /* Memory access is usermode (unprivileged) */
+     unsigned int user:1;
++    /*
++     * Bus interconnect and peripherals can access anything (memories,
++     * devices) by default. By setting the 'memory' bit, bus transactio=
n
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
+ #define MEMTX_ERROR             (1U << 0) /* device returned an error *=
/
+ #define MEMTX_DECODE_ERROR      (1U << 1) /* nothing at that address */
++#define MEMTX_ACCESS_ERROR      (1U << 2) /* access denied */
+ typedef uint32_t MemTxResult;
+=20
+ #endif
+diff --git a/softmmu/physmem.c b/softmmu/physmem.c
+index 68612afbd..f15216da0 100644
+--- a/softmmu/physmem.c
++++ b/softmmu/physmem.c
+@@ -38,6 +38,7 @@
+ #include "qemu/config-file.h"
+ #include "qemu/error-report.h"
+ #include "qemu/qemu-print.h"
++#include "qemu/log.h"
+ #include "exec/memory.h"
+ #include "exec/ioport.h"
+ #include "sysemu/dma.h"
+@@ -2736,6 +2737,33 @@ static bool prepare_mmio_access(MemoryRegion *mr)
+     return release_lock;
+ }
+=20
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
+@@ -2750,7 +2778,10 @@ static MemTxResult flatview_write_continue(FlatVi=
ew *fv, hwaddr addr,
+     const uint8_t *buf =3D ptr;
+=20
+     for (;;) {
+-        if (!memory_access_is_direct(mr, true)) {
++        if (!flatview_access_allowed(mr, attrs, addr1, l)) {
++            result |=3D MEMTX_ACCESS_ERROR;
++            /* Keep going. */
++        } else if (!memory_access_is_direct(mr, true)) {
+             release_lock |=3D prepare_mmio_access(mr);
+             l =3D memory_access_size(mr, l, addr1);
+             /* XXX: could force current_cpu to NULL to avoid
+@@ -2795,6 +2826,9 @@ static MemTxResult flatview_write(FlatView *fv, hw=
addr addr, MemTxAttrs attrs,
+=20
+     l =3D len;
+     mr =3D flatview_translate(fv, addr, &addr1, &l, true, attrs);
++    if (!flatview_access_allowed(mr, attrs, addr, len)) {
++        return MEMTX_ACCESS_ERROR;
++    }
+     return flatview_write_continue(fv, addr, attrs, buf, len,
+                                    addr1, l, mr);
+ }
+@@ -2812,7 +2846,10 @@ MemTxResult flatview_read_continue(FlatView *fv, =
hwaddr addr,
+     uint8_t *buf =3D ptr;
+=20
+     for (;;) {
+-        if (!memory_access_is_direct(mr, false)) {
++        if (!flatview_access_allowed(mr, attrs, addr1, l)) {
++            result |=3D MEMTX_ACCESS_ERROR;
++            /* Keep going. */
++        } else if (!memory_access_is_direct(mr, false)) {
+             /* I/O case */
+             release_lock |=3D prepare_mmio_access(mr);
+             l =3D memory_access_size(mr, l, addr1);
+@@ -2856,6 +2893,9 @@ static MemTxResult flatview_read(FlatView *fv, hwa=
ddr addr,
+=20
+     l =3D len;
+     mr =3D flatview_translate(fv, addr, &addr1, &l, false, attrs);
++    if (!flatview_access_allowed(mr, attrs, addr, len)) {
++        return MEMTX_ACCESS_ERROR;
++    }
+     return flatview_read_continue(fv, addr, attrs, buf, len,
+                                   addr1, l, mr);
+ }
+--=20
+2.33.0
+
--=20
2.33.0


