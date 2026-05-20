Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09749CD5BAB
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:21:23 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7386.1779265279622986865
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0GOcdd26;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-448528f4e69so3065027f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 01:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779265278; x=1779870078; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YjZZwB88iyXv+Wg8PJsNx6pFv6vITMjqY/t15R+7g6w=;
        b=0GOcdd26bLJETYFM2PQM6mPshvRU5Rn+rlViG8MNYEednoaH5Uey76/7lHt6egLKMP
         RxaOuPuAcOgIwUbwCx6IWsRfsyhkW8C+mOnIvUB/cuYCqe48FSO+HVZxphASQnb6XWk/
         jU55w9piIcVjMMc3gVa+1qolLdxsiSR/ZW+NU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265278; x=1779870078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YjZZwB88iyXv+Wg8PJsNx6pFv6vITMjqY/t15R+7g6w=;
        b=FopjN3YwA2Xu49anTe7x/EnOkkMZ9VAHeVQwp5pJhqiQlr7nmbQKkZ6TxwX/izRLdq
         Arl90IJbK5mTD17dP/NDBL/uHZ897EDKCO5xT/IRDS8OUUdApW9Z05/LpMaNOYjFwOun
         cvYjqkep70bEr9DVkCgrQMOUnRjJVeFIZGfkGD3lj5HA8dW2OGVZeXBCzKc5vaVdtBjd
         Dzz5rKINBZLCgI4YcUWtdqRyRJL/OkXb9hpwjklPHchiy/u9x9N22Nn9j0miFjzGEnuT
         qVV106KrDL1tWMQKCkeFZ86oAhD5RQeG7D0mDeq5eRG0VoQ41vc57YPGQY8HFXwiUy23
         /NCw==
X-Gm-Message-State: AOJu0YwyTiv7IkA5FO7liRbx1vBwR9w72+icd9CTMvaRn2NOshP0LcPW
	Xz37Mqq7jY7r9DFxzIXbgKpCtvpp0Ql4rRDUYJ999KHdJXX068/CaXVB/Xu+qXCIh0xwNef4HFx
	X6ypN
X-Gm-Gg: Acq92OGdTC0CWBbiuUXFCaVkc22yjCtucwcVXzu/LwHQ8GvMx9kdh0zNPzJSRoEGLpi
	Fk1/7BLrkEIMLd0IlscXdsj/tAJv4iaoiNVbxF7GFIKrpZ1XW/QNIC+MTF6maX4O4va211LcTwE
	4Qmu3MGyQS/KA+ZW6SpphYz+nWE+s0uDiemeuULWHN1i6In58DG9PLv38w2/OgRIbyT/IY/haf3
	xFy9RzQpC14aIKotIFoTBSlce1o0YFcg5guRCGSt3TeV22Rznm4Xnf81H0LVn0dtbuymUSz2eUs
	ltlNrojcatN5syfGzNLlIN+O2025UWEWW1RRWHdr42sehR1W8NYTuYrKPDaLGUCmWN6XAEWNaEH
	W/UVJGtunqkIBrAjxALmpDUehUHvjW2G1nGK7awocuGQhyEhEUULaDS1Y5IeCxzsc6rIEzu58Kr
	i4bLHHTUy8/zy7GOolXposXjdxjrad5Gv1MqgXR28n/KWvX8KhlVhGs+bCWzo4A0Vsj3aSEGFGp
	wLH7WsmCUUjFl4lmdj2DI/Lpx9fS4+tqmr1FhQ=
X-Received: by 2002:a5d:5d13:0:b0:448:659b:abec with SMTP id ffacd0b85a97d-45e5c57d6b1mr36683661f8f.8.1779265277704;
        Wed, 20 May 2026 01:21:17 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-250c-63aa-0256-2b9f-d16e-d784.rev.sfr.net. [2a02:8440:250c:63aa:256:2b9f:d16e:d784])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm56350642f8f.10.2026.05.20.01.21.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:21:17 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose v2 23/28] qemu: fix iotlb_to_section() for different AddressSpace
Date: Wed, 20 May 2026 10:20:24 +0200
Message-ID: <7f88fba567a19791e51a8d89dde542c72b11acff.1779264709.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779264709.git.yoann.congal@smile.fr>
References: <cover.1779264709.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:21:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237422

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

