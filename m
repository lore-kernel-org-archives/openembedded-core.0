Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEB27C46CC5
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 20:58:00 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.5138.1701377874014480048
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 12:57:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0CcfO9IV;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6cbe5b6ec62so1384412b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 12:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701377873; x=1701982673; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dsK5WARfnErpRQfJ28g1492peRb8yuvLE+vQenZZ7Fw=;
        b=0CcfO9IVyUYCdSQXYG73aNuIdkD/Mal0xObBqxKXvOgtDyV3mOfPkGQ7DjFaQhx3h8
         m4Q4jDY55pxlUUaySRhX+HEOCDhWigtAzBIlEti72OTVH2sstsZLe/FghEE6oLzZyLbR
         mkDoQZOr/zDdQStCFoxbEKhFP24ly1plJyqC4+Tb1R7vuiKJsneAzqpcs/ag81vsF3av
         7eA80BDHDdoYShSzLhCOBHeFx/P+M+x9JqYzSofRJ4Zbz5CPjVeWUF3XIEN+uM3wwPdx
         c8Iej8b8Eshrgk1wtsmnrb8kSQ+BXHF6RqlPfp881rGWRN2H9umOc7gKg8zb/RqYpvf8
         53NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701377873; x=1701982673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dsK5WARfnErpRQfJ28g1492peRb8yuvLE+vQenZZ7Fw=;
        b=ki5UOpeN7Pe/8NAknZvt9jjg9QJ1OH0C1y+9biqtQtRxXwBEBgtf9Jka25M7o9jDtz
         sMK5ZHqRqNxzDVg5dZHDySF6VQPAXlxxsdG55UNdzHZRoMQGyJ25HL8sZrfXmBL9Xkma
         S593C3Z3H5KxGfvM5y2IElxgG9xy92VtScUr/DGIYE5tva8Yh8skOQuiqECHDWks2rEy
         CR1pUrk8HWoeUcT56kAEjZOsT/M+O2H5siH/UydrDST39HchlbVhsd0GxA5sYHwy4dC3
         EIlb1I6sDTigyzOzKulQJygLxFUEMZ/EVMyD2n1ttgz5M/ZYXr+SYuFDJQTwzMUXROh8
         GZZQ==
X-Gm-Message-State: AOJu0Yw0JojPyGLVIswekTPKGY9SJxeZJ+pVTzxn9zQtR6UNPDwAVY4L
	uZmeVWdH3ysu1WrxbQbTzuSLUfm3cWsZERcQznMdPA==
X-Google-Smtp-Source: AGHT+IHhZ634bUEd4WMc85BvSpkaaew2XWn9yso6bz80xrIrYkgMwGe98oUXgQ3UyjO8KHg1GcjHWg==
X-Received: by 2002:a05:6a00:1ca6:b0:6cd:fd5c:3c01 with SMTP id y38-20020a056a001ca600b006cdfd5c3c01mr95559pfw.15.1701377872636;
        Thu, 30 Nov 2023 12:57:52 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id f18-20020aa79d92000000b006cbbc07a1c0sm1635418pfq.156.2023.11.30.12.57.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:57:52 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 07/25] qemu: Upgrade 8.1.0 -> 8.1.2
Date: Thu, 30 Nov 2023 10:57:15 -1000
Message-Id: <3ab0c546f656a86dfbf716bb8f4d1d8b27f16692.1701377676.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701377676.git.steve@sakoman.com>
References: <cover.1701377676.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 20:58:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191525

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Drop three backport patches as they're applied upstream.

( cherry-pick from commit 7480ff9064a74858e83e0ae275dbdb78dd6fc2a4 )

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...u-native_8.1.0.bb => qemu-native_8.1.2.bb} |   0
 ...e_8.1.0.bb => qemu-system-native_8.1.2.bb} |   0
 meta/recipes-devtools/qemu/qemu.inc           |   5 +-
 ...t-data-in-bounds-in-iotlb_to_section.patch |  42 -----
 ...u-Use-async_run_on_cpu-in-tcg_commit.patch | 157 ------------------
 .../qemu/qemu/CVE-2023-42467.patch            |  49 ------
 .../qemu/{qemu_8.1.0.bb => qemu_8.1.2.bb}     |   0
 7 files changed, 1 insertion(+), 252 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_8.1.0.bb => qemu-native_8.1.2.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_8.1.0.bb => qemu-system-native_8.1.2.bb} (100%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-softmmu-Assert-data-in-bounds-in-iotlb_to_section.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-softmmu-Use-async_run_on_cpu-in-tcg_commit.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-42467.patch
 rename meta/recipes-devtools/qemu/{qemu_8.1.0.bb => qemu_8.1.2.bb} (100%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_8.1.0.bb b/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_8.1.0.bb
rename to meta/recipes-devtools/qemu/qemu-native_8.1.2.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_8.1.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_8.1.2.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_8.1.0.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_8.1.2.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 78c495516f..5ab2cb83b4 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -29,18 +29,15 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0009-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch \
            file://0010-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch \
            file://0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch \
-           file://0001-softmmu-Assert-data-in-bounds-in-iotlb_to_section.patch \
-           file://0001-softmmu-Use-async_run_on_cpu-in-tcg_commit.patch \
            file://fixedmeson.patch \
            file://fixmips.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
-	   file://CVE-2023-42467.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
 
-SRC_URI[sha256sum] = "710c101198e334d4762eef65f649bc43fa8a5dd75303554b8acfec3eb25f0e55"
+SRC_URI[sha256sum] = "541526a764576eb494d2ff5ec46aeb253e62ea29035d1c23c0a8af4e6cd4f087"
 
 SRC_URI:append:class-target = " file://cross.patch"
 SRC_URI:append:class-nativesdk = " file://cross.patch"
diff --git a/meta/recipes-devtools/qemu/qemu/0001-softmmu-Assert-data-in-bounds-in-iotlb_to_section.patch b/meta/recipes-devtools/qemu/qemu/0001-softmmu-Assert-data-in-bounds-in-iotlb_to_section.patch
deleted file mode 100644
index 7380e16ab3..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-softmmu-Assert-data-in-bounds-in-iotlb_to_section.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 86e4f93d827d3c1efd00cd8a906e38a2c0f2b5bc Mon Sep 17 00:00:00 2001
-From: Richard Henderson <richard.henderson@linaro.org>
-Date: Fri, 25 Aug 2023 14:06:58 -0700
-Subject: [PATCH] softmmu: Assert data in bounds in iotlb_to_section
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Acked-by: Alex Bennée <alex.bennee@linaro.org>
-Suggested-by: Alex Bennée <alex.bennee@linaro.org>
-Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
-
-Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/86e4f93d827d3c1efd00cd8a906e38a2c0f2b5bc]
----
- softmmu/physmem.c | 10 ++++++++--
- 1 file changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/softmmu/physmem.c b/softmmu/physmem.c
-index 3df73542e1..7597dc1c39 100644
---- a/softmmu/physmem.c
-+++ b/softmmu/physmem.c
-@@ -2413,9 +2413,15 @@ MemoryRegionSection *iotlb_to_section(CPUState *cpu,
-     int asidx = cpu_asidx_from_attrs(cpu, attrs);
-     CPUAddressSpace *cpuas = &cpu->cpu_ases[asidx];
-     AddressSpaceDispatch *d = qatomic_rcu_read(&cpuas->memory_dispatch);
--    MemoryRegionSection *sections = d->map.sections;
-+    int section_index = index & ~TARGET_PAGE_MASK;
-+    MemoryRegionSection *ret;
-+
-+    assert(section_index < d->map.sections_nb);
-+    ret = d->map.sections + section_index;
-+    assert(ret->mr);
-+    assert(ret->mr->ops);
- 
--    return &sections[index & ~TARGET_PAGE_MASK];
-+    return ret;
- }
- 
- static void io_mem_init(void)
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/0001-softmmu-Use-async_run_on_cpu-in-tcg_commit.patch b/meta/recipes-devtools/qemu/qemu/0001-softmmu-Use-async_run_on_cpu-in-tcg_commit.patch
deleted file mode 100644
index 8289b45991..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-softmmu-Use-async_run_on_cpu-in-tcg_commit.patch
+++ /dev/null
@@ -1,157 +0,0 @@
-From 0d58c660689f6da1e3feff8a997014003d928b3b Mon Sep 17 00:00:00 2001
-From: Richard Henderson <richard.henderson@linaro.org>
-Date: Fri, 25 Aug 2023 16:13:17 -0700
-Subject: [PATCH] softmmu: Use async_run_on_cpu in tcg_commit
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-After system startup, run the update to memory_dispatch
-and the tlb_flush on the cpu.  This eliminates a race,
-wherein a running cpu sees the memory_dispatch change
-but has not yet seen the tlb_flush.
-
-Since the update now happens on the cpu, we need not use
-qatomic_rcu_read to protect the read of memory_dispatch.
-
-Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1826
-Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1834
-Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1846
-Tested-by: Alex Bennée <alex.bennee@linaro.org>
-Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
-Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
-
-Upstream-Status: Backport [0d58c660689f6da1e3feff8a997014003d928b3b]
----
- accel/tcg/cpu-exec-common.c | 30 ----------------------------
- include/exec/cpu-common.h   |  1 -
- softmmu/physmem.c           | 40 +++++++++++++++++++++++++++----------
- 3 files changed, 29 insertions(+), 42 deletions(-)
-
-Index: qemu-8.1.0/accel/tcg/cpu-exec-common.c
-===================================================================
---- qemu-8.1.0.orig/accel/tcg/cpu-exec-common.c
-+++ qemu-8.1.0/accel/tcg/cpu-exec-common.c
-@@ -33,36 +33,6 @@ void cpu_loop_exit_noexc(CPUState *cpu)
-     cpu_loop_exit(cpu);
- }
- 
--#if defined(CONFIG_SOFTMMU)
--void cpu_reloading_memory_map(void)
--{
--    if (qemu_in_vcpu_thread() && current_cpu->running) {
--        /* The guest can in theory prolong the RCU critical section as long
--         * as it feels like. The major problem with this is that because it
--         * can do multiple reconfigurations of the memory map within the
--         * critical section, we could potentially accumulate an unbounded
--         * collection of memory data structures awaiting reclamation.
--         *
--         * Because the only thing we're currently protecting with RCU is the
--         * memory data structures, it's sufficient to break the critical section
--         * in this callback, which we know will get called every time the
--         * memory map is rearranged.
--         *
--         * (If we add anything else in the system that uses RCU to protect
--         * its data structures, we will need to implement some other mechanism
--         * to force TCG CPUs to exit the critical section, at which point this
--         * part of this callback might become unnecessary.)
--         *
--         * This pair matches cpu_exec's rcu_read_lock()/rcu_read_unlock(), which
--         * only protects cpu->as->dispatch. Since we know our caller is about
--         * to reload it, it's safe to split the critical section.
--         */
--        rcu_read_unlock();
--        rcu_read_lock();
--    }
--}
--#endif
--
- void cpu_loop_exit(CPUState *cpu)
- {
-     /* Undo the setting in cpu_tb_exec.  */
-Index: qemu-8.1.0/include/exec/cpu-common.h
-===================================================================
---- qemu-8.1.0.orig/include/exec/cpu-common.h
-+++ qemu-8.1.0/include/exec/cpu-common.h
-@@ -133,7 +133,6 @@ static inline void cpu_physical_memory_w
- {
-     cpu_physical_memory_rw(addr, (void *)buf, len, true);
- }
--void cpu_reloading_memory_map(void);
- void *cpu_physical_memory_map(hwaddr addr,
-                               hwaddr *plen,
-                               bool is_write);
-Index: qemu-8.1.0/softmmu/physmem.c
-===================================================================
---- qemu-8.1.0.orig/softmmu/physmem.c
-+++ qemu-8.1.0/softmmu/physmem.c
-@@ -680,8 +680,7 @@ address_space_translate_for_iotlb(CPUSta
-     IOMMUTLBEntry iotlb;
-     int iommu_idx;
-     hwaddr addr = orig_addr;
--    AddressSpaceDispatch *d =
--        qatomic_rcu_read(&cpu->cpu_ases[asidx].memory_dispatch);
-+    AddressSpaceDispatch *d = cpu->cpu_ases[asidx].memory_dispatch;
- 
-     for (;;) {
-         section = address_space_translate_internal(d, addr, &addr, plen, false);
-@@ -2412,7 +2411,7 @@ MemoryRegionSection *iotlb_to_section(CP
- {
-     int asidx = cpu_asidx_from_attrs(cpu, attrs);
-     CPUAddressSpace *cpuas = &cpu->cpu_ases[asidx];
--    AddressSpaceDispatch *d = qatomic_rcu_read(&cpuas->memory_dispatch);
-+    AddressSpaceDispatch *d = cpuas->memory_dispatch;
-     int section_index = index & ~TARGET_PAGE_MASK;
-     MemoryRegionSection *ret;
- 
-@@ -2487,23 +2486,42 @@ static void tcg_log_global_after_sync(Me
-     }
- }
- 
-+static void tcg_commit_cpu(CPUState *cpu, run_on_cpu_data data)
-+{
-+    CPUAddressSpace *cpuas = data.host_ptr;
-+
-+    cpuas->memory_dispatch = address_space_to_dispatch(cpuas->as);
-+    tlb_flush(cpu);
-+}
-+
- static void tcg_commit(MemoryListener *listener)
- {
-     CPUAddressSpace *cpuas;
--    AddressSpaceDispatch *d;
-+    CPUState *cpu;
- 
-     assert(tcg_enabled());
-     /* since each CPU stores ram addresses in its TLB cache, we must
-        reset the modified entries */
-     cpuas = container_of(listener, CPUAddressSpace, tcg_as_listener);
--    cpu_reloading_memory_map();
--    /* The CPU and TLB are protected by the iothread lock.
--     * We reload the dispatch pointer now because cpu_reloading_memory_map()
--     * may have split the RCU critical section.
-+    cpu = cpuas->cpu;
-+
-+    /*
-+     * Defer changes to as->memory_dispatch until the cpu is quiescent.
-+     * Otherwise we race between (1) other cpu threads and (2) ongoing
-+     * i/o for the current cpu thread, with data cached by mmu_lookup().
-+     *
-+     * In addition, queueing the work function will kick the cpu back to
-+     * the main loop, which will end the RCU critical section and reclaim
-+     * the memory data structures.
-+     *
-+     * That said, the listener is also called during realize, before
-+     * all of the tcg machinery for run-on is initialized: thus halt_cond.
-      */
--    d = address_space_to_dispatch(cpuas->as);
--    qatomic_rcu_set(&cpuas->memory_dispatch, d);
--    tlb_flush(cpuas->cpu);
-+    if (cpu->halt_cond) {
-+        async_run_on_cpu(cpu, tcg_commit_cpu, RUN_ON_CPU_HOST_PTR(cpuas));
-+    } else {
-+        tcg_commit_cpu(cpu, RUN_ON_CPU_HOST_PTR(cpuas));
-+    }
- }
- 
- static void memory_map_init(void)
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-42467.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-42467.patch
deleted file mode 100644
index 86ab7cf81a..0000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2023-42467.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 7cfcc79b0ab800959716738aff9419f53fc68c9c Mon Sep 17 00:00:00 2001
-From: Thomas Huth <thuth@redhat.com>
-Date: Thu, 5 Oct 2023 06:01:10 +0000
-Subject: [PATCH] hw/scsi/scsi-disk: Disallow block sizes smaller than 512
- [CVE-2023-42467]
-
-We are doing things like
-
-    nb_sectors /= (s->qdev.blocksize / BDRV_SECTOR_SIZE);
-
-in the code here (e.g. in scsi_disk_emulate_mode_sense()), so if
-the blocksize is smaller than BDRV_SECTOR_SIZE (=512), this crashes
-with a division by 0 exception. Thus disallow block sizes of 256
-bytes to avoid this situation.
-
-Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1813
-CVE: 2023-42467
-Signed-off-by: Thomas Huth <thuth@redhat.com>
-Message-ID: <20230925091854.49198-1-thuth@redhat.com>
-Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
-
-CVE: CVE-2023-42467
-
-Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/7cfcc79b0ab800959716738aff9419f53fc68c9c]
-
-Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
----
- hw/scsi/scsi-disk.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
-index e0d79c796..477ee2bcd 100644
---- a/hw/scsi/scsi-disk.c
-+++ b/hw/scsi/scsi-disk.c
-@@ -1628,9 +1628,10 @@ static void scsi_disk_emulate_mode_select(SCSIDiskReq *r, uint8_t *inbuf)
-          * Since the existing code only checks/updates bits 8-15 of the block
-          * size, restrict ourselves to the same requirement for now to ensure
-          * that a block size set by a block descriptor and then read back by
--         * a subsequent SCSI command will be the same
-+         * a subsequent SCSI command will be the same. Also disallow a block
-+         * size of 256 since we cannot handle anything below BDRV_SECTOR_SIZE.
-          */
--        if (bs && !(bs & ~0xff00) && bs != s->qdev.blocksize) {
-+        if (bs && !(bs & ~0xfe00) && bs != s->qdev.blocksize) {
-             s->qdev.blocksize = bs;
-             trace_scsi_disk_mode_select_set_blocksize(s->qdev.blocksize);
-         }
---
-2.40.0
diff --git a/meta/recipes-devtools/qemu/qemu_8.1.0.bb b/meta/recipes-devtools/qemu/qemu_8.1.2.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_8.1.0.bb
rename to meta/recipes-devtools/qemu/qemu_8.1.2.bb
-- 
2.34.1


