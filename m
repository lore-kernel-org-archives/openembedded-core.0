Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E5E6A601F5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 15:42:31 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 06 Jan 2015 07:42:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,691,1406617200"; d="scan'208";a="508183815"
Received: from unknown (HELO localhost.intel.com) ([10.252.252.96])
	by orsmga003.jf.intel.com with ESMTP; 06 Jan 2015 07:36:51 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Jan 2015 07:42:13 -0800
Message-Id: <5dc5e23ec527578851d80055bad3411adce7f5f8.1420558836.git.sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1420558836.git.sgw@linux.intel.com>
References: <cover.1420558836.git.sgw@linux.intel.com>
In-Reply-To: <cover.1420558836.git.sgw@linux.intel.com>
References: <cover.1420558836.git.sgw@linux.intel.com>
Subject: [PATCH 03/12] syslinux: Update to 6.0.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Jan 2015 15:42:32 -0000

Removed patches that are now committed upstream, rebase parallel make
patch and add a new patch to remove a script that was calling git during
the clean process.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 ...dd-SMT_TERMINAL-a-last-resort-region-type.patch |  50 ---
 ...an-build-a-linked-list-of-memory-scanners.patch | 450 ---------------------
 .../0003-PXELINUX-Add-bios-memscan-function.patch  |  87 ----
 ...s_fbm-and-real_base_mem-to-calculate-free.patch |  65 ---
 .../isohybrid-fix-overflow-on-32-bit-system.patch  |  40 --
 .../syslinux-fix-parallel-building-issue.patch     |  17 +-
 .../syslinux-libupload-depend-lib.patch            |   0
 .../syslinux/syslinux-remove-clean-script.patch    |  17 +
 .../{syslinux_6.01.bb => syslinux_6.03.bb}         |  12 +-
 9 files changed, 28 insertions(+), 710 deletions(-)
 delete mode 100644 meta/recipes-devtools/syslinux/files/0001-movebits-Add-SMT_TERMINAL-a-last-resort-region-type.patch
 delete mode 100644 meta/recipes-devtools/syslinux/files/0002-memscan-build-a-linked-list-of-memory-scanners.patch
 delete mode 100644 meta/recipes-devtools/syslinux/files/0003-PXELINUX-Add-bios-memscan-function.patch
 delete mode 100644 meta/recipes-devtools/syslinux/files/0004-pxe-use-bios_fbm-and-real_base_mem-to-calculate-free.patch
 delete mode 100644 meta/recipes-devtools/syslinux/files/isohybrid-fix-overflow-on-32-bit-system.patch
 rename meta/recipes-devtools/syslinux/{files => syslinux}/syslinux-fix-parallel-building-issue.patch (75%)
 rename meta/recipes-devtools/syslinux/{files => syslinux}/syslinux-libupload-depend-lib.patch (100%)
 create mode 100644 meta/recipes-devtools/syslinux/syslinux/syslinux-remove-clean-script.patch
 rename meta/recipes-devtools/syslinux/{syslinux_6.01.bb => syslinux_6.03.bb} (84%)

diff --git a/meta/recipes-devtools/syslinux/files/0001-movebits-Add-SMT_TERMINAL-a-last-resort-region-type.patch b/meta/recipes-devtools/syslinux/files/0001-movebits-Add-SMT_TERMINAL-a-last-resort-region-type.patch
deleted file mode 100644
index fb03bbf..0000000
--- a/meta/recipes-devtools/syslinux/files/0001-movebits-Add-SMT_TERMINAL-a-last-resort-region-type.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-Upstream-Status: Backport [ba638fd9bf72b0c786c88909014136cfa641a147]
-Signed-off-by: Jonathan Liu <net147@gmail.com>
-
-From b663fd7257481438256f8267831dc10b06363b22 Mon Sep 17 00:00:00 2001
-From: Matt Fleming <matt.fleming@intel.com>
-Date: Tue, 16 Jul 2013 22:16:11 +0100
-Subject: [PATCH 1/4] movebits: Add SMT_TERMINAL - a last resort region type
-
-Some memory regions are usable, but only as a last resort just before we
-hand over control to a kernel image. Add the necessary movebits
-infrastructure to use these regions when all other options have been
-exhausted.
-
-Signed-off-by: Matt Fleming <matt.fleming@intel.com>
-
-Conflicts:
-	com32/lib/syslinux/zonelist.c
----
- com32/include/syslinux/movebits.h | 1 +
- com32/lib/syslinux/movebits.c     | 2 +-
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/com32/include/syslinux/movebits.h b/com32/include/syslinux/movebits.h
-index 8bcdf3e..114a896 100644
---- a/com32/include/syslinux/movebits.h
-+++ b/com32/include/syslinux/movebits.h
-@@ -34,6 +34,7 @@ enum syslinux_memmap_types {
-     SMT_RESERVED,		/* Unusable memory */
-     SMT_ALLOC,			/* Memory allocated by user */
-     SMT_ZERO,			/* Memory that should be zeroed */
-+    SMT_TERMINAL,		/* Memory to be used as a last resort */
- };
- 
- struct syslinux_memmap {
-diff --git a/com32/lib/syslinux/movebits.c b/com32/lib/syslinux/movebits.c
-index 7a05f3c..8ffdc63 100644
---- a/com32/lib/syslinux/movebits.c
-+++ b/com32/lib/syslinux/movebits.c
-@@ -160,7 +160,7 @@ static const struct syslinux_memmap *is_free_zone(const struct syslinux_memmap
- 	if (list->start <= start) {
- 	    if (llast >= last) {
- 		/* Chunk has a single, well-defined type */
--		if (list->type == SMT_FREE) {
-+		if (list->type == SMT_FREE || list->type == SMT_TERMINAL) {
- 		    dprintf("F: 0x%08x bytes at 0x%08x\n",
- 			    list->next->start, list->start);
- 		    return list;	/* It's free */
--- 
-1.8.5.3
-
diff --git a/meta/recipes-devtools/syslinux/files/0002-memscan-build-a-linked-list-of-memory-scanners.patch b/meta/recipes-devtools/syslinux/files/0002-memscan-build-a-linked-list-of-memory-scanners.patch
deleted file mode 100644
index 48d3955..0000000
--- a/meta/recipes-devtools/syslinux/files/0002-memscan-build-a-linked-list-of-memory-scanners.patch
+++ /dev/null
@@ -1,450 +0,0 @@
-Upstream-Status: Backport [787d7e568fe08d7080d2cd03cd9ee27c327eca67]
-Signed-off-by: Jonathan Liu <net147@gmail.com>
-
-From 2e05f34c0c5bc0144bb203a169009dfb6837b4e3 Mon Sep 17 00:00:00 2001
-From: Matt Fleming <matt.fleming@intel.com>
-Date: Wed, 17 Jul 2013 12:15:16 +0100
-Subject: [PATCH 2/4] memscan: build a linked list of memory scanners
-
-By registering memory scanners at runtime we can support multiple memory
-scanner functions, which helps us to isolate them and keep things
-modular, only registering them for specific platform/derivative
-combinations. This is preparation for adding a memory scanner that is
-specific to PXELINUX on bios and understands when the memory region
-occupied by the PXE stack can be reused.
-
-Signed-off-by: Matt Fleming <matt.fleming@intel.com>
-
-Conflicts:
-	com32/include/syslinux/memscan.h
-	com32/lib/syslinux/memscan.c
----
- com32/include/syslinux/firmware.h |   4 +-
- com32/include/syslinux/memscan.h  |  14 +++-
- com32/lib/syslinux/memscan.c      | 143 +++++++-------------------------------
- core/bios.c                       | 125 ++++++++++++++++++++++++++++++++-
- efi/main.c                        |  14 ++--
- 5 files changed, 173 insertions(+), 127 deletions(-)
-
-diff --git a/com32/include/syslinux/firmware.h b/com32/include/syslinux/firmware.h
-index 4a43c86..6cc06a0 100644
---- a/com32/include/syslinux/firmware.h
-+++ b/com32/include/syslinux/firmware.h
-@@ -1,7 +1,8 @@
- #ifndef _SYSLINUX_FIRMWARE_H
- #define _SYSLINUX_FIRMWARE_H
- 
--#include <syslinux/memscan.h>
-+#include <inttypes.h>
-+#include <stdbool.h>
- 
- struct term_state;
- 
-@@ -42,7 +43,6 @@ struct mem_ops {
- 	void *(*malloc)(size_t, enum heap, size_t);
- 	void *(*realloc)(void *, size_t);
- 	void (*free)(void *);
--	int (*scan_memory)(scan_memory_callback_t, void *);
- };
- 
- struct initramfs;
-diff --git a/com32/include/syslinux/memscan.h b/com32/include/syslinux/memscan.h
-index c3ebf84..ab78e28 100644
---- a/com32/include/syslinux/memscan.h
-+++ b/com32/include/syslinux/memscan.h
-@@ -29,11 +29,19 @@
- #ifndef _SYSLINUX_MEMSCAN_H
- #define _SYSLINUX_MEMSCAN_H
- 
--#include <stdbool.h>
-+#include <linux/list.h>
- #include <syslinux/movebits.h>	/* addr_t */
- 
--typedef int (*scan_memory_callback_t) (void *, addr_t, addr_t, bool);
-+typedef int (*scan_memory_callback_t) (void *, addr_t, addr_t,
-+				       enum syslinux_memmap_types type);
-+
-+struct syslinux_memscan {
-+    int (*func)(scan_memory_callback_t callback, void *data);
-+    struct list_head next;
-+};
-+
-+void syslinux_memscan_add(struct syslinux_memscan *entry);
-+int syslinux_memscan_new(int (*func)(scan_memory_callback_t cb, void *data));
- int syslinux_scan_memory(scan_memory_callback_t callback, void *data);
--int bios_scan_memory(scan_memory_callback_t callback, void *data);
- 
- #endif /* _SYSLINUX_MEMSCAN_H */
-diff --git a/com32/lib/syslinux/memscan.c b/com32/lib/syslinux/memscan.c
-index 0ff25d7..fdb7274 100644
---- a/com32/lib/syslinux/memscan.c
-+++ b/com32/lib/syslinux/memscan.c
-@@ -32,133 +32,44 @@
-  * Query the system for free memory
-  */
- 
--#include <assert.h>
--#include <stdbool.h>
--#include <stdlib.h>
--#include <string.h>
--#include <inttypes.h>
--#include <com32.h>
--
- #include <syslinux/memscan.h>
--#include <syslinux/firmware.h>
- 
--struct e820_entry {
--    uint64_t start;
--    uint64_t len;
--    uint32_t type;
--};
-+static LIST_HEAD(syslinux_memscan_head);
- 
--int bios_scan_memory(scan_memory_callback_t callback, void *data)
-+/*
-+ * Add a memscan entry to the list.
-+ */
-+void syslinux_memscan_add(struct syslinux_memscan *entry)
- {
--    static com32sys_t ireg;
--    com32sys_t oreg;
--    struct e820_entry *e820buf;
--    uint64_t start, len, maxlen;
--    int memfound = 0;
--    int rv;
--    addr_t dosmem;
--    const addr_t bios_data = 0x510;	/* Amount to reserve for BIOS data */
-+    list_add(&entry->next, &syslinux_memscan_head);
-+}
- 
--    /* Use INT 12h to get DOS memory */
--    __intcall(0x12, &__com32_zero_regs, &oreg);
--    dosmem = oreg.eax.w[0] << 10;
--    if (dosmem < 32 * 1024 || dosmem > 640 * 1024) {
--	/* INT 12h reports nonsense... now what? */
--	uint16_t ebda_seg = *(uint16_t *) 0x40e;
--	if (ebda_seg >= 0x8000 && ebda_seg < 0xa000)
--	    dosmem = ebda_seg << 4;
--	else
--	    dosmem = 640 * 1024;	/* Hope for the best... */
--    }
--    rv = callback(data, bios_data, dosmem - bios_data, true);
--    if (rv)
--	return rv;
-+/*
-+ * Build a new memscan entry and add it to the list.
-+ */
-+int syslinux_memscan_new(int func(scan_memory_callback_t, void *data))
-+{
-+    struct syslinux_memscan *entry;
- 
--    /* First try INT 15h AX=E820h */
--    e820buf = lzalloc(sizeof *e820buf);
--    if (!e820buf)
-+    entry = malloc(sizeof *entry);
-+    if (!entry)
- 	return -1;
- 
--    ireg.eax.l = 0xe820;
--    ireg.edx.l = 0x534d4150;
--    ireg.ebx.l = 0;
--    ireg.ecx.l = sizeof(*e820buf);
--    ireg.es = SEG(e820buf);
--    ireg.edi.w[0] = OFFS(e820buf);
--
--    do {
--	__intcall(0x15, &ireg, &oreg);
--
--	if ((oreg.eflags.l & EFLAGS_CF) ||
--	    (oreg.eax.l != 0x534d4150) || (oreg.ecx.l < 20))
--	    break;
--
--	start = e820buf->start;
--	len = e820buf->len;
--
--	if (start < 0x100000000ULL) {
--	    /* Don't rely on E820 being valid for low memory.  Doing so
--	       could mean stuff like overwriting the PXE stack even when
--	       using "keeppxe", etc. */
--	    if (start < 0x100000ULL) {
--		if (len > 0x100000ULL - start)
--		    len -= 0x100000ULL - start;
--		else
--		    len = 0;
--		start = 0x100000ULL;
--	    }
--
--	    maxlen = 0x100000000ULL - start;
--	    if (len > maxlen)
--		len = maxlen;
--
--	    if (len) {
--		rv = callback(data, (addr_t) start, (addr_t) len,
--			      e820buf->type == 1);
--		if (rv)
--		    return rv;
--		memfound = 1;
--	    }
--	}
--
--	ireg.ebx.l = oreg.ebx.l;
--    } while (oreg.ebx.l);
--
--    lfree(e820buf);
--
--    if (memfound)
--	return 0;
--
--    /* Next try INT 15h AX=E801h */
--    ireg.eax.w[0] = 0xe801;
--    __intcall(0x15, &ireg, &oreg);
--
--    if (!(oreg.eflags.l & EFLAGS_CF) && oreg.ecx.w[0]) {
--	rv = callback(data, (addr_t) 1 << 20, oreg.ecx.w[0] << 10, true);
--	if (rv)
--	    return rv;
--
--	if (oreg.edx.w[0]) {
--	    rv = callback(data, (addr_t) 16 << 20, oreg.edx.w[0] << 16, true);
--	    if (rv)
--		return rv;
--	}
--
--	return 0;
--    }
--
--    /* Finally try INT 15h AH=88h */
--    ireg.eax.w[0] = 0x8800;
--    if (!(oreg.eflags.l & EFLAGS_CF) && oreg.eax.w[0]) {
--	rv = callback(data, (addr_t) 1 << 20, oreg.ecx.w[0] << 10, true);
--	if (rv)
--	    return rv;
--    }
--
-+    entry->func = func;
-+    syslinux_memscan_add(entry);
-     return 0;
- }
- 
- int syslinux_scan_memory(scan_memory_callback_t callback, void *data)
- {
--	return firmware->mem->scan_memory(callback, data);
-+    struct syslinux_memscan *entry;
-+    int rv = 0;
-+
-+    list_for_each_entry(entry, &syslinux_memscan_head, next) {
-+	rv = entry->func(callback, data);
-+	if (rv)
-+	    break;
-+    }
-+
-+    return rv;
- }
-diff --git a/core/bios.c b/core/bios.c
-index 53223e8..5344833 100644
---- a/core/bios.c
-+++ b/core/bios.c
-@@ -501,6 +501,129 @@ static inline void bios_timer_init(void)
- 
- extern uint16_t *bios_free_mem;
- 
-+struct e820_entry {
-+    uint64_t start;
-+    uint64_t len;
-+    uint32_t type;
-+};
-+
-+static int bios_scan_memory(scan_memory_callback_t callback, void *data)
-+{
-+    static com32sys_t ireg;
-+    com32sys_t oreg;
-+    struct e820_entry *e820buf;
-+    uint64_t start, len, maxlen;
-+    int memfound = 0;
-+    int rv;
-+    addr_t dosmem;
-+    const addr_t bios_data = 0x510;	/* Amount to reserve for BIOS data */
-+
-+    /* Use INT 12h to get DOS memory */
-+    __intcall(0x12, &__com32_zero_regs, &oreg);
-+    dosmem = oreg.eax.w[0] << 10;
-+    if (dosmem < 32 * 1024 || dosmem > 640 * 1024) {
-+	/* INT 12h reports nonsense... now what? */
-+	uint16_t ebda_seg = *(uint16_t *) 0x40e;
-+	if (ebda_seg >= 0x8000 && ebda_seg < 0xa000)
-+	    dosmem = ebda_seg << 4;
-+	else
-+	    dosmem = 640 * 1024;	/* Hope for the best... */
-+    }
-+    rv = callback(data, bios_data, dosmem - bios_data, SMT_FREE);
-+    if (rv)
-+	return rv;
-+
-+    /* First try INT 15h AX=E820h */
-+    e820buf = lzalloc(sizeof *e820buf);
-+    if (!e820buf)
-+	return -1;
-+
-+    ireg.eax.l = 0xe820;
-+    ireg.edx.l = 0x534d4150;
-+    ireg.ebx.l = 0;
-+    ireg.ecx.l = sizeof(*e820buf);
-+    ireg.es = SEG(e820buf);
-+    ireg.edi.w[0] = OFFS(e820buf);
-+
-+    do {
-+	__intcall(0x15, &ireg, &oreg);
-+
-+	if ((oreg.eflags.l & EFLAGS_CF) ||
-+	    (oreg.eax.l != 0x534d4150) || (oreg.ecx.l < 20))
-+	    break;
-+
-+	start = e820buf->start;
-+	len = e820buf->len;
-+
-+	if (start < 0x100000000ULL) {
-+	    /* Don't rely on E820 being valid for low memory.  Doing so
-+	       could mean stuff like overwriting the PXE stack even when
-+	       using "keeppxe", etc. */
-+	    if (start < 0x100000ULL) {
-+		if (len > 0x100000ULL - start)
-+		    len -= 0x100000ULL - start;
-+		else
-+		    len = 0;
-+		start = 0x100000ULL;
-+	    }
-+
-+	    maxlen = 0x100000000ULL - start;
-+	    if (len > maxlen)
-+		len = maxlen;
-+
-+	    if (len) {
-+		enum syslinux_memmap_types type;
-+
-+		type = e820buf->type == 1 ? SMT_FREE : SMT_RESERVED;
-+		rv = callback(data, (addr_t) start, (addr_t) len, type);
-+		if (rv)
-+		    return rv;
-+		memfound = 1;
-+	    }
-+	}
-+
-+	ireg.ebx.l = oreg.ebx.l;
-+    } while (oreg.ebx.l);
-+
-+    lfree(e820buf);
-+
-+    if (memfound)
-+	return 0;
-+
-+    /* Next try INT 15h AX=E801h */
-+    ireg.eax.w[0] = 0xe801;
-+    __intcall(0x15, &ireg, &oreg);
-+
-+    if (!(oreg.eflags.l & EFLAGS_CF) && oreg.ecx.w[0]) {
-+	rv = callback(data, (addr_t) 1 << 20, oreg.ecx.w[0] << 10, SMT_FREE);
-+	if (rv)
-+	    return rv;
-+
-+	if (oreg.edx.w[0]) {
-+	    rv = callback(data, (addr_t) 16 << 20,
-+			  oreg.edx.w[0] << 16, SMT_FREE);
-+	    if (rv)
-+		return rv;
-+	}
-+
-+	return 0;
-+    }
-+
-+    /* Finally try INT 15h AH=88h */
-+    ireg.eax.w[0] = 0x8800;
-+    if (!(oreg.eflags.l & EFLAGS_CF) && oreg.eax.w[0]) {
-+	rv = callback(data, (addr_t) 1 << 20, oreg.ecx.w[0] << 10, SMT_FREE);
-+	if (rv)
-+	    return rv;
-+    }
-+
-+    return 0;
-+}
-+
-+static struct syslinux_memscan bios_memscan = {
-+    .func = bios_scan_memory,
-+};
-+
- void bios_init(void)
- {
- 	int i;
-@@ -515,6 +638,7 @@ void bios_init(void)
- 
- 	/* Init the memory subsystem */
- 	bios_free_mem = (uint16_t *)0x413;
-+	syslinux_memscan_add(&bios_memscan);
- 	mem_init();
- 
- 	/* CPU-dependent initialization and related checks. */
-@@ -534,7 +658,6 @@ struct mem_ops bios_mem_ops = {
- 	.malloc = bios_malloc,
- 	.realloc = bios_realloc,
- 	.free = bios_free,
--	.scan_memory = bios_scan_memory,
- };
- 
- struct firmware bios_fw = {
-diff --git a/efi/main.c b/efi/main.c
-index 13b9403..fb8cf05 100644
---- a/efi/main.c
-+++ b/efi/main.c
-@@ -296,21 +296,21 @@ int efi_scan_memory(scan_memory_callback_t callback, void *data)
- 	for (i = 0; i < nr_entries; bufpos += desc_sz, i++) {
- 		EFI_MEMORY_DESCRIPTOR *m;
- 		UINT64 region_sz;
--		int valid;
-+		enum syslinux_memmap_types type;
- 
- 		m = (EFI_MEMORY_DESCRIPTOR *)bufpos;
- 		region_sz = m->NumberOfPages * EFI_PAGE_SIZE;
- 
- 		switch (m->Type) {
-                 case EfiConventionalMemory:
--			valid = 1;
-+			type = SMT_FREE;
-                         break;
- 		default:
--			valid = 0;
-+			type = SMT_RESERVED;
- 			break;
- 		}
- 
--		rv = callback(data, m->PhysicalStart, region_sz, valid);
-+		rv = callback(data, m->PhysicalStart, region_sz, type);
- 		if (rv)
- 			break;
- 	}
-@@ -319,11 +319,16 @@ int efi_scan_memory(scan_memory_callback_t callback, void *data)
- 	return rv;
- }
- 
-+static struct syslinux_memscan efi_memscan = {
-+    .func = efi_scan_memory,
-+};
-+
- extern uint16_t *bios_free_mem;
- void efi_init(void)
- {
- 	/* XXX timer */
- 	*bios_free_mem = 0;
-+	syslinux_memscan_add(&efi_memscan);
- 	mem_init();
- }
- 
-@@ -1103,7 +1108,6 @@ struct mem_ops efi_mem_ops = {
- 	.malloc = efi_malloc,
- 	.realloc = efi_realloc,
- 	.free = efi_free,
--	.scan_memory = efi_scan_memory,
- };
- 
- struct firmware efi_fw = {
--- 
-1.8.5.3
-
diff --git a/meta/recipes-devtools/syslinux/files/0003-PXELINUX-Add-bios-memscan-function.patch b/meta/recipes-devtools/syslinux/files/0003-PXELINUX-Add-bios-memscan-function.patch
deleted file mode 100644
index 70d65fd..0000000
--- a/meta/recipes-devtools/syslinux/files/0003-PXELINUX-Add-bios-memscan-function.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-Upstream-Status: Backport [d2f94e74fbd60bf491753895d2474105efb3dedf]
-Signed-off-by: Jonathan Liu <net147@gmail.com>
-
-From 5d57e8eb46f209481069d70eaa778481f6fa3edb Mon Sep 17 00:00:00 2001
-From: Matt Fleming <matt.fleming@intel.com>
-Date: Wed, 17 Jul 2013 13:04:30 +0100
-Subject: [PATCH 3/4] PXELINUX: Add bios memscan function
-
-We can mark the memory region occupied by the PXE stack as SMT_TERMINAL
-provided that KeepPXE isn't set. Historically some very old
-non-relocatable kernel images (memtest86+) have a load address that
-falls within the PXE stack region, so we need to attempt to load into
-that region if at all possible.
-
-Signed-off-by: Matt Fleming <matt.fleming@intel.com>
----
- core/fs/pxe/bios.c | 35 +++++++++++++++++++++++++++++++++++
- 1 file changed, 35 insertions(+)
-
-diff --git a/core/fs/pxe/bios.c b/core/fs/pxe/bios.c
-index 81aa715..5f61824 100644
---- a/core/fs/pxe/bios.c
-+++ b/core/fs/pxe/bios.c
-@@ -1,4 +1,5 @@
- #include <syslinux/firmware.h>
-+#include <syslinux/memscan.h>
- #include <core.h>
- #include "pxe.h"
- #include <net.h>
-@@ -10,6 +11,9 @@ static uint16_t real_base_mem;	   /* Amount of DOS memory after freeing */
- static bool has_gpxe;
- static uint32_t gpxe_funcs;
- 
-+static addr_t pxe_code_start, pxe_code_size;
-+static addr_t pxe_data_start, pxe_data_size;
-+
- /*
-  * Validity check on possible !PXE structure in buf
-  * return 1 for success, 0 for failure.
-@@ -88,6 +92,29 @@ static const struct pxenv_t *memory_scan_for_pxenv_struct(void)
-     return memory_scan(0x10000, is_pxenv);
- }
- 
-+static int pxelinux_scan_memory(scan_memory_callback_t callback, void *data)
-+{
-+    int rv = 0;
-+
-+    /*
-+     * If we are planning on calling unload_pxe() and unmapping the PXE
-+     * region before we transfer control away from PXELINUX we can mark
-+     * that region as SMT_TERMINAL to indicate that the region will
-+     * become free at some point in the future.
-+     */
-+    if (!KeepPXE) {
-+	dprintf("Marking PXE code region 0x%x - 0x%x as SMT_TERMINAL\n",
-+		pxe_code_start, pxe_code_start + pxe_code_size);
-+	rv = callback(data, pxe_code_start, pxe_code_size, SMT_TERMINAL);
-+
-+	dprintf("Marking PXE data region 0x%x - 0x%x as SMT_TERMINAL\n",
-+		pxe_data_start, pxe_data_start + pxe_data_size);
-+	rv = callback(data, pxe_data_start, pxe_data_size, SMT_TERMINAL);
-+    }
-+
-+    return rv;
-+}
-+
- /*
-  * Find the !PXE structure; we search for the following, in order:
-  *
-@@ -204,6 +231,14 @@ int pxe_init(bool quiet)
- 	printf("UNDI data segment at %04X len %04X\n", data_seg, data_len);
-     }
- 
-+    pxe_code_start = code_seg << 4;
-+    pxe_code_size = code_len;
-+
-+    pxe_data_start = data_seg << 4;
-+    pxe_data_size = data_len;
-+
-+    syslinux_memscan_new(pxelinux_scan_memory);
-+
-     code_seg = code_seg + ((code_len + 15) >> 4);
-     data_seg = data_seg + ((data_len + 15) >> 4);
- 
--- 
-1.8.5.3
-
diff --git a/meta/recipes-devtools/syslinux/files/0004-pxe-use-bios_fbm-and-real_base_mem-to-calculate-free.patch b/meta/recipes-devtools/syslinux/files/0004-pxe-use-bios_fbm-and-real_base_mem-to-calculate-free.patch
deleted file mode 100644
index ee0a772..0000000
--- a/meta/recipes-devtools/syslinux/files/0004-pxe-use-bios_fbm-and-real_base_mem-to-calculate-free.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-Upstream-Status: Backport [c0ea15936de8378d1da6843d3dbddd8dddba1011]
-Signed-off-by: Jonathan Liu <net147@gmail.com>
-
-From f3347f9b09135d71a4effae1614b22dcdf16a7e2 Mon Sep 17 00:00:00 2001
-From: Matt Fleming <matt.fleming@intel.com>
-Date: Wed, 24 Jul 2013 18:33:14 +0100
-Subject: [PATCH 4/4] pxe: use bios_fbm() and real_base_mem to calculate free
- space
-
-We don't need to individually add the PXE regions, we already have two
-symbols that denote the memory region that will be freed when calling
-unload_pxe().
-
-This essentially reverts commit 03dda0f1 ("pxe: mark all PXE regions as
-SMT_TERMINAL").
-
-Signed-off-by: Matt Fleming <matt.fleming@intel.com>
-
-Conflicts:
-	core/fs/pxe/bios.c
----
- core/fs/pxe/bios.c | 18 +++++++++---------
- 1 file changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/core/fs/pxe/bios.c b/core/fs/pxe/bios.c
-index 5f61824..ffdffaf 100644
---- a/core/fs/pxe/bios.c
-+++ b/core/fs/pxe/bios.c
-@@ -94,24 +94,24 @@ static const struct pxenv_t *memory_scan_for_pxenv_struct(void)
- 
- static int pxelinux_scan_memory(scan_memory_callback_t callback, void *data)
- {
-+    addr_t start, size;
-     int rv = 0;
- 
-+    if (KeepPXE)
-+	return 0;
-+
-     /*
-      * If we are planning on calling unload_pxe() and unmapping the PXE
-      * region before we transfer control away from PXELINUX we can mark
-      * that region as SMT_TERMINAL to indicate that the region will
-      * become free at some point in the future.
-      */
--    if (!KeepPXE) {
--	dprintf("Marking PXE code region 0x%x - 0x%x as SMT_TERMINAL\n",
--		pxe_code_start, pxe_code_start + pxe_code_size);
--	rv = callback(data, pxe_code_start, pxe_code_size, SMT_TERMINAL);
--
--	dprintf("Marking PXE data region 0x%x - 0x%x as SMT_TERMINAL\n",
--		pxe_data_start, pxe_data_start + pxe_data_size);
--	rv = callback(data, pxe_data_start, pxe_data_size, SMT_TERMINAL);
--    }
-+    start = bios_fbm() << 10;
-+    size = (real_base_mem - bios_fbm()) << 10;
-+    dprintf("Marking PXE region 0x%x - 0x%x as SMT_TERMINAL\n",
-+	start, start + size);
- 
-+    callback(data, start, size, SMT_TERMINAL);
-     return rv;
- }
- 
--- 
-1.8.5.3
-
diff --git a/meta/recipes-devtools/syslinux/files/isohybrid-fix-overflow-on-32-bit-system.patch b/meta/recipes-devtools/syslinux/files/isohybrid-fix-overflow-on-32-bit-system.patch
deleted file mode 100644
index 09a6945..0000000
--- a/meta/recipes-devtools/syslinux/files/isohybrid-fix-overflow-on-32-bit-system.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-Upstream-Status: Backport
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-From bc360f8dbdf27bff07bb5db8d0ea9a7b10d8e3d1 Mon Sep 17 00:00:00 2001
-From: Kai Kang <kai.kang@windriver.com>
-Date: Fri, 20 Jun 2014 11:32:11 +0800
-Subject: [PATCH 1/2] isohybrid: fix overflow on 32 bit system
-
-When call isohybrid with option '-u', it overflows on a 32 bits host. It
-seeks to 512 bytes before the end of the image to install gpt header. If
-the size of image is larger than LONG_MAX, it overflows fseek() and
-cause error:
-
-isohybrid: image-x86-64-20140505110100.iso: seek error - 8: Invalid argument
-
-Replace fseek with fseeko to fix this issue.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-Signed-off-by: H. Peter Anvin <hpa@zytor.com>
----
- utils/isohybrid.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/utils/isohybrid.c b/utils/isohybrid.c
-index 410bb60..23fc6c0 100644
---- a/utils/isohybrid.c
-+++ b/utils/isohybrid.c
-@@ -1126,7 +1126,7 @@ main(int argc, char *argv[])
- 	 * end of the image
- 	 */
- 
--	if (fseek(fp, (isostat.st_size + padding) - orig_gpt_size - 512,
-+	if (fseeko(fp, (isostat.st_size + padding) - orig_gpt_size - 512,
- 		  SEEK_SET))
- 	    err(1, "%s: seek error - 8", argv[0]);
- 
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/syslinux/files/syslinux-fix-parallel-building-issue.patch b/meta/recipes-devtools/syslinux/syslinux/syslinux-fix-parallel-building-issue.patch
similarity index 75%
rename from meta/recipes-devtools/syslinux/files/syslinux-fix-parallel-building-issue.patch
rename to meta/recipes-devtools/syslinux/syslinux/syslinux-fix-parallel-building-issue.patch
index 6b69579..312b1e8 100644
--- a/meta/recipes-devtools/syslinux/files/syslinux-fix-parallel-building-issue.patch
+++ b/meta/recipes-devtools/syslinux/syslinux/syslinux-fix-parallel-building-issue.patch
@@ -24,15 +24,12 @@ Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
  com32/Makefile |    1 +
  1 file changed, 1 insertion(+)
 
-diff --git a/com32/Makefile b/com32/Makefile
-index 7ea1b01..9a1721b 100644
---- a/com32/Makefile
-+++ b/com32/Makefile
-@@ -20,3 +20,4 @@ modules: lib libutil gpllib
- rosh: lib libutil
+Index: syslinux-6.03/com32/Makefile
+===================================================================
+--- syslinux-6.03.orig/com32/Makefile
++++ syslinux-6.03/com32/Makefile
+@@ -21,3 +21,4 @@ rosh: lib libutil
  samples: libutil elflink/ldlinux
- sysdump: libupload gpllib
+ sysdump: lib libutil libupload gpllib
+ lua/src: cmenu modules
 +gpllib: lib
--- 
-1.7.9.5
-
diff --git a/meta/recipes-devtools/syslinux/files/syslinux-libupload-depend-lib.patch b/meta/recipes-devtools/syslinux/syslinux/syslinux-libupload-depend-lib.patch
similarity index 100%
rename from meta/recipes-devtools/syslinux/files/syslinux-libupload-depend-lib.patch
rename to meta/recipes-devtools/syslinux/syslinux/syslinux-libupload-depend-lib.patch
diff --git a/meta/recipes-devtools/syslinux/syslinux/syslinux-remove-clean-script.patch b/meta/recipes-devtools/syslinux/syslinux/syslinux-remove-clean-script.patch
new file mode 100644
index 0000000..7c003e1
--- /dev/null
+++ b/meta/recipes-devtools/syslinux/syslinux/syslinux-remove-clean-script.patch
@@ -0,0 +1,17 @@
+This script try to call git submodule, since we are downloading
+the tarball it seems in-correct to do this.
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+Index: syslinux-6.03/efi/Makefile
+===================================================================
+--- syslinux-6.03.orig/efi/Makefile
++++ syslinux-6.03/efi/Makefile
+@@ -101,7 +101,6 @@ tidy dist:
+ 	rm -f *.so *.o wrapper
+ 	find . \( -name \*.o -o -name \*.a -o -name .\*.d -o -name \*.tmp \) -print0 | \
+ 		xargs -0r rm -f
+-	$(topdir)/efi/clean-gnu-efi.sh $(EFI_SUBARCH) $(objdir)
+ 
+ clean: tidy
+ 
diff --git a/meta/recipes-devtools/syslinux/syslinux_6.01.bb b/meta/recipes-devtools/syslinux/syslinux_6.03.bb
similarity index 84%
rename from meta/recipes-devtools/syslinux/syslinux_6.01.bb
rename to meta/recipes-devtools/syslinux/syslinux_6.03.bb
index 20afae9..7e3176e 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.01.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.03.bb
@@ -8,18 +8,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 # ldlinux.* stuff for now, so skip mtools-native
 DEPENDS = "nasm-native util-linux"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/boot/syslinux/6.xx/syslinux-${PV}.tar.bz2 \
-           file://0001-movebits-Add-SMT_TERMINAL-a-last-resort-region-type.patch \
-           file://0002-memscan-build-a-linked-list-of-memory-scanners.patch \
-           file://0003-PXELINUX-Add-bios-memscan-function.patch \
-           file://0004-pxe-use-bios_fbm-and-real_base_mem-to-calculate-free.patch \
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/boot/syslinux/6.xx/syslinux-${PV}.tar.xz \
            file://syslinux-fix-parallel-building-issue.patch \
-           file://isohybrid-fix-overflow-on-32-bit-system.patch \
            file://syslinux-libupload-depend-lib.patch \
+           file://syslinux-remove-clean-script.patch \
            "
 
-SRC_URI[md5sum] = "6945ee89e29119d459baed4937bbc534"
-SRC_URI[sha256sum] = "83a04cf81e6a46b80ee5a321926eea095af3498b04317e3674b46c125c7a5b43"
+SRC_URI[md5sum] = "92a253df9211e9c20172796ecf388f13"
+SRC_URI[sha256sum] = "26d3986d2bea109d5dc0e4f8c4822a459276cf021125e8c9f23c3cca5d8c850e"
 
 COMPATIBLE_HOST = '(x86_64|i.86).*-(linux|freebsd.*)'
 # Don't let the sanity checker trip on the 32 bit real mode BIOS binaries
-- 
2.1.0


