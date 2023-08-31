Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86429C83F10
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 07:30:24 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.11483.1693467020328657354
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Aug 2023 00:30:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bO8jQus2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1E54D1BF213;
	Thu, 31 Aug 2023 07:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1693467018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FpN+3NxWg1BBmV95vT2GlBbmjfw3NSQ7QvA6kmSpQXI=;
	b=bO8jQus2njnOMXyjzU/AByA3nH0F/QOfa4lSisKMdOHehQguE1PHdr+kfvH7e69GFMGHU2
	y54wD9czf2RYZI/R+PHE03L/k5nGgyCiO2Bid3Suh+sW9rMmNER0OJG/GCUx3Z+Zggi5C+
	f5D1DoxAKbr4OxlDkQFqBq/wG6bd5XZWv19CPpPUPOd2Id0a5+By7gOzrDa3a3U2y6IJL7
	O5b4w8fv2FpEpnD9mANLS8nN1R+WUe7JBITD3cT61pIXvhXaEiDMV6SXcJIhBGpx8AadO6
	hOYdLo5nbpBMIBO2Dc/1s77p//4NvZ8pJ41YGHUL6E35duGxZPiU/8U4z6bbug==
Date: Thu, 31 Aug 2023 09:30:17 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Subject: Re: [OE-core] [PATCH][master-next] qemu: fix segfault in MMU
 emulation
Message-ID: <202308310730179d8d0ac8@mail.local>
References: <20230830143956.1965354-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230830143956.1965354-1-ross.burton@arm.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 07:30:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186962

On 30/08/2023 15:39:56+0100, Ross Burton wrote:
> From: Ross Burton <ross.burton@arm.com>
> 
> Backport a patch that has been submitted to the qemu list that resolves
> a crash in the softmmu code.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc           |   1 +
>  meta/recipes-devtools/qemu/qemu/softmmu.patch | 216 ++++++++++++++++++
>  2 files changed, 217 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/softmmu.patch
> 
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 131162dd62f..ccde87d1901 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -30,6 +30,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
>             file://0010-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch \
>             file://0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch \
>             file://fixedmeson.patch \
> +           file://softmmu.patch \

This doesn't apply cleanly on master, can you rebase?

>             file://qemu-guest-agent.init \
>             file://qemu-guest-agent.udev \
>             "
> diff --git a/meta/recipes-devtools/qemu/qemu/softmmu.patch b/meta/recipes-devtools/qemu/qemu/softmmu.patch
> new file mode 100644
> index 00000000000..bd28335b142
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/softmmu.patch
> @@ -0,0 +1,216 @@
> +From 1960291925029e92dd340c64186f4bdb709805b8 Mon Sep 17 00:00:00 2001
> +From: Richard Henderson <richard.henderson@linaro.org>
> +Date: Sat, 26 Aug 2023 16:24:13 -0700
> +Subject: [PATCH 1/3] softmmu: Assert data in bounds in iotlb_to_section
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Suggested-by: Alex Benn�e <alex.bennee@linaro.org>
> +Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> +Acked-by: Alex Benn�e <alex.bennee@linaro.org>
> +
> +Upstream-Status: Submitted [https://patchew.org/QEMU/20230826232415.80233-1-richard.henderson@linaro.org/]
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +---
> + softmmu/physmem.c | 10 ++++++++--
> + 1 file changed, 8 insertions(+), 2 deletions(-)
> +
> +diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> +index 3df73542e1..7597dc1c39 100644
> +--- a/softmmu/physmem.c
> ++++ b/softmmu/physmem.c
> +@@ -2413,9 +2413,15 @@ MemoryRegionSection *iotlb_to_section(CPUState *cpu,
> +     int asidx = cpu_asidx_from_attrs(cpu, attrs);
> +     CPUAddressSpace *cpuas = &cpu->cpu_ases[asidx];
> +     AddressSpaceDispatch *d = qatomic_rcu_read(&cpuas->memory_dispatch);
> +-    MemoryRegionSection *sections = d->map.sections;
> ++    int section_index = index & ~TARGET_PAGE_MASK;
> ++    MemoryRegionSection *ret;
> ++
> ++    assert(section_index < d->map.sections_nb);
> ++    ret = d->map.sections + section_index;
> ++    assert(ret->mr);
> ++    assert(ret->mr->ops);
> + 
> +-    return &sections[index & ~TARGET_PAGE_MASK];
> ++    return ret;
> + }
> + 
> + static void io_mem_init(void)
> +-- 
> +2.34.1
> +
> +
> +From 94d2d2c85c04aab738daf56ec73915218fa05d82 Mon Sep 17 00:00:00 2001
> +From: Richard Henderson <richard.henderson@linaro.org>
> +Date: Sat, 26 Aug 2023 16:24:14 -0700
> +Subject: [PATCH 2/3] softmmu: Use async_run_on_cpu in tcg_commit
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +After system startup, run the update to memory_dispatch
> +and the tlb_flush on the cpu.  This eliminates a race,
> +wherein a running cpu sees the memory_dispatch change
> +but has not yet seen the tlb_flush.
> +
> +Since the update now happens on the cpu, we need not use
> +qatomic_rcu_read to protect the read of memory_dispatch.
> +
> +Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1826
> +Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1834
> +Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1846
> +Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> +Reviewed-by: Alex Benn�e <alex.bennee@linaro.org>
> +Tested-by: Alex Benn�e <alex.bennee@linaro.org>
> +Tested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> +---
> + softmmu/physmem.c | 40 +++++++++++++++++++++++++++++-----------
> + 1 file changed, 29 insertions(+), 11 deletions(-)
> +
> +diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> +index 7597dc1c39..18277ddd67 100644
> +--- a/softmmu/physmem.c
> ++++ b/softmmu/physmem.c
> +@@ -680,8 +680,7 @@ address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr orig_addr,
> +     IOMMUTLBEntry iotlb;
> +     int iommu_idx;
> +     hwaddr addr = orig_addr;
> +-    AddressSpaceDispatch *d =
> +-        qatomic_rcu_read(&cpu->cpu_ases[asidx].memory_dispatch);
> ++    AddressSpaceDispatch *d = cpu->cpu_ases[asidx].memory_dispatch;
> + 
> +     for (;;) {
> +         section = address_space_translate_internal(d, addr, &addr, plen, false);
> +@@ -2412,7 +2411,7 @@ MemoryRegionSection *iotlb_to_section(CPUState *cpu,
> + {
> +     int asidx = cpu_asidx_from_attrs(cpu, attrs);
> +     CPUAddressSpace *cpuas = &cpu->cpu_ases[asidx];
> +-    AddressSpaceDispatch *d = qatomic_rcu_read(&cpuas->memory_dispatch);
> ++    AddressSpaceDispatch *d = cpuas->memory_dispatch;
> +     int section_index = index & ~TARGET_PAGE_MASK;
> +     MemoryRegionSection *ret;
> + 
> +@@ -2487,23 +2486,42 @@ static void tcg_log_global_after_sync(MemoryListener *listener)
> +     }
> + }
> + 
> ++static void tcg_commit_cpu(CPUState *cpu, run_on_cpu_data data)
> ++{
> ++    CPUAddressSpace *cpuas = data.host_ptr;
> ++
> ++    cpuas->memory_dispatch = address_space_to_dispatch(cpuas->as);
> ++    tlb_flush(cpu);
> ++}
> ++
> + static void tcg_commit(MemoryListener *listener)
> + {
> +     CPUAddressSpace *cpuas;
> +-    AddressSpaceDispatch *d;
> ++    CPUState *cpu;
> + 
> +     assert(tcg_enabled());
> +     /* since each CPU stores ram addresses in its TLB cache, we must
> +        reset the modified entries */
> +     cpuas = container_of(listener, CPUAddressSpace, tcg_as_listener);
> +-    cpu_reloading_memory_map();
> +-    /* The CPU and TLB are protected by the iothread lock.
> +-     * We reload the dispatch pointer now because cpu_reloading_memory_map()
> +-     * may have split the RCU critical section.
> ++    cpu = cpuas->cpu;
> ++
> ++    /*
> ++     * Defer changes to as->memory_dispatch until the cpu is quiescent.
> ++     * Otherwise we race between (1) other cpu threads and (2) ongoing
> ++     * i/o for the current cpu thread, with data cached by mmu_lookup().
> ++     *
> ++     * In addition, queueing the work function will kick the cpu back to
> ++     * the main loop, which will end the RCU critical section and reclaim
> ++     * the memory data structures.
> ++     *
> ++     * That said, the listener is also called during realize, before
> ++     * all of the tcg machinery for run-on is initialized: thus halt_cond.
> +      */
> +-    d = address_space_to_dispatch(cpuas->as);
> +-    qatomic_rcu_set(&cpuas->memory_dispatch, d);
> +-    tlb_flush(cpuas->cpu);
> ++    if (cpu->halt_cond) {
> ++        async_run_on_cpu(cpu, tcg_commit_cpu, RUN_ON_CPU_HOST_PTR(cpuas));
> ++    } else {
> ++        tcg_commit_cpu(cpu, RUN_ON_CPU_HOST_PTR(cpuas));
> ++    }
> + }
> + 
> + static void memory_map_init(void)
> +-- 
> +2.34.1
> +
> +
> +From 7f7cccdf465cb84acbe69f2f3d7cc8e6c3ebcfaa Mon Sep 17 00:00:00 2001
> +From: Richard Henderson <richard.henderson@linaro.org>
> +Date: Sat, 26 Aug 2023 16:24:15 -0700
> +Subject: [PATCH 3/3] softmmu: Remove cpu_reloading_memory_map as unused
> +
> +Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> +---
> + accel/tcg/cpu-exec-common.c | 30 ------------------------------
> + include/exec/cpu-common.h   |  1 -
> + 2 files changed, 31 deletions(-)
> +
> +diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
> +index 9a5fabf625..7e35d7f4b5 100644
> +--- a/accel/tcg/cpu-exec-common.c
> ++++ b/accel/tcg/cpu-exec-common.c
> +@@ -33,36 +33,6 @@ void cpu_loop_exit_noexc(CPUState *cpu)
> +     cpu_loop_exit(cpu);
> + }
> + 
> +-#if defined(CONFIG_SOFTMMU)
> +-void cpu_reloading_memory_map(void)
> +-{
> +-    if (qemu_in_vcpu_thread() && current_cpu->running) {
> +-        /* The guest can in theory prolong the RCU critical section as long
> +-         * as it feels like. The major problem with this is that because it
> +-         * can do multiple reconfigurations of the memory map within the
> +-         * critical section, we could potentially accumulate an unbounded
> +-         * collection of memory data structures awaiting reclamation.
> +-         *
> +-         * Because the only thing we're currently protecting with RCU is the
> +-         * memory data structures, it's sufficient to break the critical section
> +-         * in this callback, which we know will get called every time the
> +-         * memory map is rearranged.
> +-         *
> +-         * (If we add anything else in the system that uses RCU to protect
> +-         * its data structures, we will need to implement some other mechanism
> +-         * to force TCG CPUs to exit the critical section, at which point this
> +-         * part of this callback might become unnecessary.)
> +-         *
> +-         * This pair matches cpu_exec's rcu_read_lock()/rcu_read_unlock(), which
> +-         * only protects cpu->as->dispatch. Since we know our caller is about
> +-         * to reload it, it's safe to split the critical section.
> +-         */
> +-        rcu_read_unlock();
> +-        rcu_read_lock();
> +-    }
> +-}
> +-#endif
> +-
> + void cpu_loop_exit(CPUState *cpu)
> + {
> +     /* Undo the setting in cpu_tb_exec.  */
> +diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> +index 87dc9a752c..41788c0bdd 100644
> +--- a/include/exec/cpu-common.h
> ++++ b/include/exec/cpu-common.h
> +@@ -133,7 +133,6 @@ static inline void cpu_physical_memory_write(hwaddr addr,
> + {
> +     cpu_physical_memory_rw(addr, (void *)buf, len, true);
> + }
> +-void cpu_reloading_memory_map(void);
> + void *cpu_physical_memory_map(hwaddr addr,
> +                               hwaddr *plen,
> +                               bool is_write);
> +-- 
> +2.34.1
> +
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186894): https://lists.openembedded.org/g/openembedded-core/message/186894
> Mute This Topic: https://lists.openembedded.org/mt/101053465/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

