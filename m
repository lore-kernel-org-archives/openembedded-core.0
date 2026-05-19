Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B2A9CD4F54
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 23:30:51 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1015.1779233442256394748
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 16:30:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zVy5igW0;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso34844365e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 16:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779233440; x=1779838240; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YjZZwB88iyXv+Wg8PJsNx6pFv6vITMjqY/t15R+7g6w=;
        b=zVy5igW0znHRt/9QkBaZE/thReMaBgabNPo2TUuULravklBPW+kYxLp9FcFoWspTXU
         KqJBj9u4eU04KakEkfpiUqJ8ACgcbvRJpXHUb+fnRt27HsaOEBlAlWjwp5Y/VEAOkdo6
         EXaKK7LojRwaLkh2fuNBtPXKYO0TPb8g2/oH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779233440; x=1779838240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YjZZwB88iyXv+Wg8PJsNx6pFv6vITMjqY/t15R+7g6w=;
        b=RzTdhylFCQfppVPoAuoOGXG9zfUGUofOyMX0F5q5WNLkZqQdldh/uvJWUZ//47yFNd
         zzgoKxp2zHx1S99v0grpW/iAxgRmFXr2aW84B7oJPUpl5QJTvTe//n1tb0lOdsoH4icF
         vEpZReIjDCsy7y6QsW/bJqa+bCQKkOVzegTTA55xPiKRkfW5Go7ULUzEjkqct4OGxB4+
         txPQOnZvQDCbxUOC+7VxZWH3nfpgMxbz+Zwmcwz/uOiGINKIPbKjZQGBl/2VjBg8UgUa
         2lYZyFP2Q/xgNf9XN41UE6/oq/wkaOORU20Km1NOjBGKb3qXHcO0ZtO2ScjjGIMJcMue
         DvfQ==
X-Gm-Message-State: AOJu0YydpO/dGKObx5UGEVwKyjqiltIBQa9o7orwGbJh1HGAh7/I2i/u
	1dgEvV8QFTh0lU8k7yrXOL/yWDEnD+1ZwqTggP7S2a9OAdNj3y4X+5ZX4A+0XmiK/Zay1R4jxFx
	6I4eI
X-Gm-Gg: Acq92OELnUB+iNbEJF8tSi/GEV8Caf1biERTUm2Ycgh0acdo4rD8dilOt1khW1cbokp
	tcoiCh/VRJzsEcbXdB/pj1rnwi4xJCS3g8R5mLOP0B/miFhtZKVurfDQfUVsj8egmQL8omkNv8P
	JyngrLSpJ+Lvdz5acHq/VXaXZ4dT/rqzLVWXLQ+2evOQvaB8Ay1Otj4iUxkG4t4TYRmvVI33JbK
	BjAMpEtkLkT9iZzC4djXRIRi/7ME7ap05ipglCk95rcZcaDlQTv6+zCXD2rt+wp/Ch5h+N9BuuA
	ZtGwMwo94UC/lWVJ2obgbOWbNflmZNkzDdbPuAsfPo+EAe1kjUYDGm3CafHhS+RG9dTZzdY3/Bz
	SwDUjLYF5as+VZwmf7EM9gvT6/c+3uuydGKKuyYOxfGaexvnefH/yWe82jfTEBUFLMVmQizRHVJ
	9+OAqEu5w6zOlMnicQOl/kiMKQiAHModi4XXjCxg/givy5G5xOsi9Yjg0HqgFIsic+OjkxB4biF
	1oRCvEwGNWLyv0AQ7nFYOcfQgAz4E3YNCn9k2Qeb/c4Gbkn
X-Received: by 2002:a05:600c:a406:b0:48f:e230:1d12 with SMTP id 5b1f17b1804b1-48fe6329913mr262629145e9.31.1779233440326;
        Tue, 19 May 2026 16:30:40 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe5bc94sm224705795e9.4.2026.05.19.16.30.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 16:30:39 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 23/28] qemu: fix iotlb_to_section() for different AddressSpace
Date: Wed, 20 May 2026 01:30:00 +0200
Message-ID: <7b71cd58a7e298543ada77564897f42c74ef0fb2.1779232800.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779232800.git.yoann.congal@smile.fr>
References: <cover.1779232800.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 23:30:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237370

From: Quan Sun <Quan.Sun@windriver.com>

Backport upstream commit 854cd16e318e ("accel/tcg: Fix iotlb_to_section()
for different AddressSpace") to qemu 10.2.0.

The bug causes incorrect memory load/store when CPU access goes through
an IOMMUMemoryRegion that returns a different target AddressSpace, and the
fix replaces the section_index lookup with a direct MemoryRegionSection
pointer stored in CPUTLBEntryFull.

Note that the fix primarily targets ARM/RISC-V, but since it eliminates
iotlb_to_section() and performs the lookup based on CPUTLBEntryFull,
it may also help address some currently observed QEMU boot issues
on x86, e.g. the https://bugzilla.yoctoproject.org/show_bug.cgi?id=16259.

AI-Generated: kiro-cli

Signed-off-by: Quan Sun <Quan.Sun@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1b09f50c4e607bb6f2b120fe3bf0141bac46a078)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 ...tlb_to_section-for-different-Address.patch | 274 ++++++++++++++++++
 2 files changed, 275 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-accel-tcg-Fix-iotlb_to_section-for-different-Address.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 8abe366284e..5f30416a483 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -33,6 +33,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0010-configure-lookup-meson-exutable-from-PATH.patch \
            file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch \
            file://0001-linux-user-elfload.c-Correction-to-HWCAP2-accessor.patch \
+           file://0001-accel-tcg-Fix-iotlb_to_section-for-different-Address.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
            "
diff --git a/meta/recipes-devtools/qemu/qemu/0001-accel-tcg-Fix-iotlb_to_section-for-different-Address.patch b/meta/recipes-devtools/qemu/qemu/0001-accel-tcg-Fix-iotlb_to_section-for-different-Address.patch
new file mode 100644
index 00000000000..d19f872fc3d
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-accel-tcg-Fix-iotlb_to_section-for-different-Address.patch
@@ -0,0 +1,274 @@
+From 858e6bb252e075e09cca6e78299151d3af0bf5fb Mon Sep 17 00:00:00 2001
+From: Quan Sun <Quan.Sun@windriver.com>
+Date: Tue, 28 Apr 2026 14:56:36 -0400
+Subject: [PATCH] accel/tcg: Fix iotlb_to_section() for different AddressSpace
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+'CPUTLBEntryFull.xlat_section' stores section_index in last 12 bits to
+find the correct section when CPU access the IO region over the IOTLB.
+However, section_index is only unique inside single AddressSpace. If
+address space translation is over IOMMUMemoryRegion, it could return
+section from other AddressSpace. 'iotlb_to_section()' API only finds the
+sections from CPU's AddressSpace so that it couldn't find section in
+other AddressSpace. Thus, using 'iotlb_to_section()' API will find the
+wrong section and QEMU will have wrong load/store access.
+
+To fix this bug of iotlb_to_section(), store complete MemoryRegionSection
+pointer in CPUTLBEntryFull to replace the section_index in xlat_section.
+Rename 'xlat_section' to 'xlat_offset' as we remove last 12 bits
+section_index inside. Also, since we directly use section pointer in the
+CPUTLBEntryFull (full->section), we can remove the unused functions:
+iotlb_to_section(), memory_region_section_get_iotlb().
+
+This bug occurs only when
+(1) IOMMUMemoryRegion is in the path of CPU access.
+(2) IOMMUMemoryRegion returns different target_as and the section is in
+the IO region.
+
+This patch incorporates prerequisite changes from upstream commit
+94c6e9cf0440 ("accel/tcg: Send the CPUTLBEntryFull struct into
+io_prepare()") needed for the fix to apply cleanly.
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/854cd16e318eed12de2995014b28d9f374c64bf7]
+
+Signed-off-by: Jim Shu <jim.shu@sifive.com>
+Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
+Tested-by: Mark Burton <mburton@qti.qualcomm.com>
+Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
+Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
+Signed-off-by: Quan Sun <Quan.Sun@windriver.com>
+---
+ accel/tcg/cputlb.c        | 32 +++++++++++++++-----------------
+ include/accel/tcg/iommu.h | 15 ---------------
+ include/exec/cputlb.h     |  4 ++--
+ include/hw/core/cpu.h     | 17 +++++++++--------
+ system/physmem.c          | 25 -------------------------
+ 5 files changed, 26 insertions(+), 67 deletions(-)
+
+diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
+index fd1606c85..fa0f4d8b3 100644
+--- a/accel/tcg/cputlb.c
++++ b/accel/tcg/cputlb.c
+@@ -1089,7 +1089,7 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
+         }
+     } else {
+         /* I/O or ROMD */
+-        iotlb = memory_region_section_get_iotlb(cpu, section) + xlat;
++        iotlb = xlat;
+         /*
+          * Writes to romd devices must go through MMIO to enable write.
+          * Reads to romd devices go through the ram_ptr found above,
+@@ -1140,10 +1140,9 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
+     /*
+      * When memory region is ram, iotlb contains a TARGET_PAGE_BITS
+      * aligned ram_addr_t of the page base of the target RAM.
+-     * Otherwise, iotlb contains
+-     *  - a physical section number in the lower TARGET_PAGE_BITS
+-     *  - the offset within section->mr of the page base (I/O, ROMD) with the
+-     *    TARGET_PAGE_BITS masked off.
++     * Otherwise, iotlb contains a TARGET_PAGE_BITS aligned
++     * offset within section->mr of the page base (I/O, ROMD)
++     *
+      * We subtract addr_page (which is page aligned and thus won't
+      * disturb the low bits) to give an offset which can be added to the
+      * (non-page-aligned) vaddr of the eventual memory access to get
+@@ -1153,7 +1152,8 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
+      */
+     desc->fulltlb[index] = *full;
+     full = &desc->fulltlb[index];
+-    full->xlat_section = iotlb - addr_page;
++    full->xlat_offset = iotlb - addr_page;
++    full->section = section;
+     full->phys_addr = paddr_page;
+
+     /* Now calculate the new entry */
+@@ -1269,14 +1269,14 @@ static inline void cpu_unaligned_access(CPUState *cpu, vaddr addr,
+ }
+
+ static MemoryRegionSection *
+-io_prepare(hwaddr *out_offset, CPUState *cpu, hwaddr xlat,
++io_prepare(hwaddr *out_offset, CPUState *cpu, CPUTLBEntryFull *full,
+            MemTxAttrs attrs, vaddr addr, uintptr_t retaddr)
+ {
+     MemoryRegionSection *section;
+     hwaddr mr_offset;
+
+-    section = iotlb_to_section(cpu, xlat, attrs);
+-    mr_offset = (xlat & TARGET_PAGE_MASK) + addr;
++    section = full->section;
++    mr_offset = full->xlat_offset + addr;
+     cpu->mem_io_pc = retaddr;
+     if (!cpu->neg.can_do_io) {
+         cpu_io_recompile(cpu, retaddr);
+@@ -1335,7 +1335,7 @@ static bool victim_tlb_hit(CPUState *cpu, size_t mmu_idx, size_t index,
+ static void notdirty_write(CPUState *cpu, vaddr mem_vaddr, unsigned size,
+                            CPUTLBEntryFull *full, uintptr_t retaddr)
+ {
+-    ram_addr_t ram_addr = mem_vaddr + full->xlat_section;
++    ram_addr_t ram_addr = mem_vaddr + full->xlat_offset;
+
+     trace_memory_notdirty_write_access(mem_vaddr, ram_addr, size);
+
+@@ -1592,9 +1592,7 @@ bool tlb_plugin_lookup(CPUState *cpu, vaddr addr, int mmu_idx,
+
+     /* We must have an iotlb entry for MMIO */
+     if (tlb_addr & TLB_MMIO) {
+-        MemoryRegionSection *section =
+-            iotlb_to_section(cpu, full->xlat_section & ~TARGET_PAGE_MASK,
+-                             full->attrs);
++        MemoryRegionSection *section = full->section;
+         data->is_io = true;
+         data->mr = section->mr;
+     } else {
+@@ -1980,7 +1978,7 @@ static uint64_t do_ld_mmio_beN(CPUState *cpu, CPUTLBEntryFull *full,
+     tcg_debug_assert(size > 0 && size <= 8);
+
+     attrs = full->attrs;
+-    section = io_prepare(&mr_offset, cpu, full->xlat_section, attrs, addr, ra);
++    section = io_prepare(&mr_offset, cpu, full, attrs, addr, ra);
+     mr = section->mr;
+
+     BQL_LOCK_GUARD();
+@@ -2001,7 +1999,7 @@ static Int128 do_ld16_mmio_beN(CPUState *cpu, CPUTLBEntryFull *full,
+     tcg_debug_assert(size > 8 && size <= 16);
+
+     attrs = full->attrs;
+-    section = io_prepare(&mr_offset, cpu, full->xlat_section, attrs, addr, ra);
++    section = io_prepare(&mr_offset, cpu, full, attrs, addr, ra);
+     mr = section->mr;
+
+     BQL_LOCK_GUARD();
+@@ -2521,7 +2519,7 @@ static uint64_t do_st_mmio_leN(CPUState *cpu, CPUTLBEntryFull *full,
+     tcg_debug_assert(size > 0 && size <= 8);
+
+     attrs = full->attrs;
+-    section = io_prepare(&mr_offset, cpu, full->xlat_section, attrs, addr, ra);
++    section = io_prepare(&mr_offset, cpu, full, attrs, addr, ra);
+     mr = section->mr;
+
+     BQL_LOCK_GUARD();
+@@ -2541,7 +2539,7 @@ static uint64_t do_st16_mmio_leN(CPUState *cpu, CPUTLBEntryFull *full,
+     tcg_debug_assert(size > 8 && size <= 16);
+
+     attrs = full->attrs;
+-    section = io_prepare(&mr_offset, cpu, full->xlat_section, attrs, addr, ra);
++    section = io_prepare(&mr_offset, cpu, full, attrs, addr, ra);
+     mr = section->mr;
+
+     BQL_LOCK_GUARD();
+diff --git a/include/accel/tcg/iommu.h b/include/accel/tcg/iommu.h
+index 90cfd6c0e..547f8ea0e 100644
+--- a/include/accel/tcg/iommu.h
++++ b/include/accel/tcg/iommu.h
+@@ -14,18 +14,6 @@
+ #include "exec/hwaddr.h"
+ #include "exec/memattrs.h"
+
+-/**
+- * iotlb_to_section:
+- * @cpu: CPU performing the access
+- * @index: TCG CPU IOTLB entry
+- *
+- * Given a TCG CPU IOTLB entry, return the MemoryRegionSection that
+- * it refers to. @index will have been initially created and returned
+- * by memory_region_section_get_iotlb().
+- */
+-MemoryRegionSection *iotlb_to_section(CPUState *cpu,
+-                                      hwaddr index, MemTxAttrs attrs);
+-
+ MemoryRegionSection *address_space_translate_for_iotlb(CPUState *cpu,
+                                                        int asidx,
+                                                        hwaddr addr,
+@@ -34,8 +22,5 @@ MemoryRegionSection *address_space_translate_for_iotlb(CPUState *cpu,
+                                                        MemTxAttrs attrs,
+                                                        int *prot);
+
+-hwaddr memory_region_section_get_iotlb(CPUState *cpu,
+-                                       MemoryRegionSection *section);
+-
+ #endif
+
+diff --git a/include/exec/cputlb.h b/include/exec/cputlb.h
+index 9bec0e789..16f866990 100644
+--- a/include/exec/cputlb.h
++++ b/include/exec/cputlb.h
+@@ -43,8 +43,8 @@ void tlb_reset_dirty_range_all(ram_addr_t start, ram_addr_t length);
+  * @full: the details of the tlb entry
+  *
+  * Add an entry to @cpu tlb index @mmu_idx.  All of the fields of
+- * @full must be filled, except for xlat_section, and constitute
+- * the complete description of the translated page.
++ * @full must be filled, except for xlat_offset & section, and
++ * constitute the complete description of the translated page.
+  *
+  * This is generally called by the target tlb_fill function after
+  * having performed a successful page table walk to find the physical
+diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
+index 961505177..a3db3f66f 100644
+--- a/include/hw/core/cpu.h
++++ b/include/hw/core/cpu.h
+@@ -214,15 +214,16 @@ typedef uint32_t MMUIdxMap;
+  */
+ struct CPUTLBEntryFull {
+     /*
+-     * @xlat_section contains:
+-     *  - in the lower TARGET_PAGE_BITS, a physical section number
+-     *  - with the lower TARGET_PAGE_BITS masked off, an offset which
+-     *    must be added to the virtual address to obtain:
+-     *     + the ram_addr_t of the target RAM (if the physical section
+-     *       number is PHYS_SECTION_NOTDIRTY or PHYS_SECTION_ROM)
+-     *     + the offset within the target MemoryRegion (otherwise)
++     * @xlat_offset: TARGET_PAGE_BITS aligned offset which must be added to
++     * the virtual address to obtain:
++     *   + the ram_addr_t of the target RAM (if the physical section
++     *     number is PHYS_SECTION_NOTDIRTY or PHYS_SECTION_ROM)
++     *   + the offset within the target MemoryRegion (otherwise)
+      */
+-    hwaddr xlat_section;
++    hwaddr xlat_offset;
++
++    /* @section contains physical section. */
++    MemoryRegionSection *section;
+
+     /*
+      * @phys_addr contains the physical address in the address space
+diff --git a/system/physmem.c b/system/physmem.c
+index c9869e404..a21e7ca64 100644
+--- a/system/physmem.c
++++ b/system/physmem.c
+@@ -748,31 +748,6 @@ translate_fail:
+     return &d->map.sections[PHYS_SECTION_UNASSIGNED];
+ }
+
+-MemoryRegionSection *iotlb_to_section(CPUState *cpu,
+-                                      hwaddr index, MemTxAttrs attrs)
+-{
+-    int asidx = cpu_asidx_from_attrs(cpu, attrs);
+-    CPUAddressSpace *cpuas = &cpu->cpu_ases[asidx];
+-    AddressSpaceDispatch *d = address_space_to_dispatch(cpuas->as);
+-    int section_index = index & ~TARGET_PAGE_MASK;
+-    MemoryRegionSection *ret;
+-
+-    assert(section_index < d->map.sections_nb);
+-    ret = d->map.sections + section_index;
+-    assert(ret->mr);
+-    assert(ret->mr->ops);
+-
+-    return ret;
+-}
+-
+-/* Called from RCU critical section */
+-hwaddr memory_region_section_get_iotlb(CPUState *cpu,
+-                                       MemoryRegionSection *section)
+-{
+-    AddressSpaceDispatch *d = flatview_to_dispatch(section->fv);
+-    return section - d->map.sections;
+-}
+-
+ #endif /* CONFIG_TCG */
+
+ void cpu_address_space_init(CPUState *cpu, int asidx,
+--
+2.43.0

