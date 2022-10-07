Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "virendra thakur" <thakur.virendra1810@gmail.com>
Subject: [OE-Core][kirkstone][PATCH 1/3] qemu: Fix CVE-2021-3750 for qemu
Date: Fri,  7 Oct 2022 20:19:39 +0530
Message-Id: <20221007144939.4658-1-thakur.virendra1810@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com, bhabu.bindu@kpit.com, virendrak@kpit.com, Virendra Thakur <virendra.thakur@kpit.com>

From: Virendra Thakur <virendra.thakur@kpit.com>

Add patch to fix CVE-2021-3750

Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
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
index 0000000000..db908874b6
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
+Signed-off-by: Philippe Mathieu-DaudÃ© <philmd@redhat.com>
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
index 0000000000..1ce32089a8
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
+Signed-off-by: Philippe Mathieu-DaudÃ© <philmd@redhat.com>
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
index 0000000000..703646365f
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
+Signed-off-by: Philippe Mathieu-DaudÃ© <philmd@redhat.com>
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
2.17.1

