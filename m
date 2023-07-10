Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0F71C001E0
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 03:20:47 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.32112.1688959238572370371
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jul 2023 20:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=PCmCpHrm;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-635e5b06aaeso22227296d6.0
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Jul 2023 20:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688959237; x=1691551237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DtNxbbdrCGGSsqwbPmwrcPcb9x6bXmmvwYVztUt9kNo=;
        b=PCmCpHrmbyZBMFw5zq1PuCGKHB+dKfQ2TLo3Ma8i5lVwpuZqdyhOFivfJ62O5TOIw8
         Lla1U981ZGt5YYL41K0sS4ffTSNWpfPNBZ8O/p6xXz2eNoLvS2OynlbP8jeLlrmBn2jZ
         iLXi4tUII+rWLbUPH+TUzkH/3tYzZuDZQChBHsIR2PaXZ7SPTaIWC4gjGn0vsqE6/01w
         scJKS54AyVAjQ3ZItYrEEZJSf6uLJBGn6wrPXZhX23Z0Y6Mnl9DtFpdtboKrpd1V3Unm
         1gLVREGXFHpBo9t8NnWMYVOikgJwPp0ORXj3G2EniXH9kj9wuagh6niiV3TQmg1EWg7l
         GGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688959237; x=1691551237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DtNxbbdrCGGSsqwbPmwrcPcb9x6bXmmvwYVztUt9kNo=;
        b=TS/9EWE7SWuoKBVOCIgpzyyg42lElpLRz0Du9/4bzsPgHZWW1D70cEPndyqKbwpHEz
         8t+l1Qv9wDESmJIcVvrqKbeh/dI9GhO10YPM+R2MBRqEUK62QCRB51OtbSQToE5MYGAv
         GWj0agPXBuIqUjzmAn+R5tltl4yyRJwBiZxt1U0uFi4yHu0qi6ddc7dpJdW6Rx5B4cQ0
         WG+qZETNVw2Ltg1Gna9FT0c1QxCLhRtRF47eC0cb5e+Bfd8f/1DhYJ8R9LyQ2dMWCPWH
         xTX1hZz7Z1Xo7WqcMLVbydBuVyTjEJxnVFrYSYu/hpwYubYh9WrepTyWnuOnyLq7UeTj
         A/Mw==
X-Gm-Message-State: ABy/qLaBC1b2zg3/ryCoUtIvvJUNhGlJSd8ORqPD++nbRuWuyoiaYLSq
	YvsPzYfrXGbxQRMg0y8ZTOU5GHx9o+0=
X-Google-Smtp-Source: APBJJlHWH7avddAf/iO+3+txYokQNfpn6K/A9ICseLZb5Vl60J/GAkC/KdIfQn/pl13KgGctMPn8QA==
X-Received: by 2002:a0c:f484:0:b0:636:afa1:344e with SMTP id i4-20020a0cf484000000b00636afa1344emr10496550qvm.31.1688959237472;
        Sun, 09 Jul 2023 20:20:37 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id d15-20020a0cf0cf000000b00630228acc45sm5039863qvl.145.2023.07.09.20.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 20:20:36 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/15] linux-yocto-rt/6.4: integrate -rt6
Date: Sun,  9 Jul 2023 23:20:21 -0400
Message-Id: <c346a92ec40fb82b162e34222738caf2f5228396.1688958789.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688958788.git.bruce.ashfield@gmail.com>
References: <cover.1688958788.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 03:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184052

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto-rt/6.4:

    369f3a1d2f39 Add localversion for -RT release
    c26c6f8a7def sysfs: Add /sys/kernel/realtime entry
    1026252efc14 POWERPC: Allow to enable RT
    2be128571d55 powerpc/stackprotector: work around stack-guard init from atomic
    55bea7bc53a3 powerpc/kvm: Disable in-kernel MPIC emulation for PREEMPT_RT
    6d7729893293 powerpc/pseries: Select the generic memory allocator.
    4f94b99ce5fa powerpc/imc-pmu: Use the correct spinlock initializer.
    4842eac5df59 powerpc/pseries/iommu: Use a locallock instead local_irq_save()
    20217d6be82e powerpc: traps: Use PREEMPT_RT
    caa81a9e214f ARM64: Allow to enable RT
    e6d8eecd9250 ARM: Allow to enable RT
    ed8eef71c579 tty/serial/pl011: Make the locking work on RT
    579a01d01422 tty/serial/omap: Make the locking RT aware
    82c5c842e1a3 ARM: enable irq in translation/section permission fault handlers
    40b10f168ff6 arm: Disable jump-label on PREEMPT_RT.
    a7a1bfa3b88b arch/arm64: Add lazy preempt support
    be59db8f177b powerpc: Add support for lazy preemption
    0143f7261d2e arm: Add support for lazy preemption
    27dd55360d61 entry: Fix the preempt lazy fallout
    59012496af29 x86: Support for lazy preemption
    d25ecd17ccbe x86/entry: Use should_resched() in idtentry_exit_cond_resched()
    beb2483d6b9f sched: Add support for lazy preemption
    c78e3d4fd185 Revert "drm/i915: Depend on !PREEMPT_RT."
    bdac43aa952c drm/i915: Drop the irqs_disabled() check
    954bab1b75e9 drm/i915/gt: Use spin_lock_irq() instead of local_irq_disable() + spin_lock()
    afcb80571a37 drm/i915/gt: Queue and wait for the irq_work item.
    5f8008dab040 drm/i915: skip DRM_I915_LOW_LEVEL_TRACEPOINTS with NOTRACE
    da5622b92296 drm/i915: Disable tracing points on PREEMPT_RT
    51532f62a857 drm/i915: Don't check for atomic context on PREEMPT_RT
    4b1c4c7b4e6c drm/i915: Don't disable interrupts on PREEMPT_RT during atomic updates
    459be7df2c2a drm/i915: Use preempt_disable/enable_rt() where recommended
    628d1b08d421 printk: Check only for migration in printk_deferred_*().
    dfd2770048a6 serial: 8250: implement non-BKL console
    9fc96a5c3a19 printk: replace local_irq_save with local_lock for safe mode
    061a418efaef printk: Add threaded printing support for BKL consoles.
    36ac8599626a printk: only disable if actually unregistered
    71669eb2c2da printk: Perform atomic flush in console_flush_on_panic()
    b0634d6c06d9 rcu: Add atomic write enforcement for rcu stalls
    95fdf7b134ab kernel/panic: Add atomic write enforcement to warn/panic
    c39e30092722 proc: consoles: Add support for non-BKL consoles
    70be25f26762 tty: tty_io: Show non-BKL consoles as active
    c980fcfd9dcb printk: nobkl: Stop threads on shutdown/reboot
    e372fdfa42c3 printk: nobkl: Provide functions for atomic write enforcement
    7c779a16b20c printk: nobkl: Add write context storage for atomic writes
    042485b8fa7a printk: nobkl: Add printer thread wakeups
    a0d1569185ed printk: nobkl: Introduce printer threads
    68aa6402e396 printk: nobkl: Add emit function and callback functions for atomic printing
    ccf51a3743a4 printk: nobkl: Add print state functions
    e33dfd268d79 printk: nobkl: Add sequence handling
    2f0f99a7a004 printk: nobkl: Add buffer management
    f6cd5cdad5cf printk: nobkl: Add acquire/release logic
    6754f4c0d6ee printk: Add non-BKL console basic infrastructure
    b4568c7fbbfc printk: Add per-console suspended state
    1e952ed4d35b printk: Consolidate console deferred printing
    b12fabcfa9be printk: Add NMI check to console_flush_on_panic() and console_unblank()
    9c1bfc2a6f3c kdb: do not assume write() callback available
    244f2785c026 preempt: Put preempt_enable() within an instrumentation*() section.
    1b61e0ba79ae zram: Replace bit spinlocks with spinlock_t for PREEMPT_RT.
    62bf62e9fd6c softirq: Wake ktimers thread also in softirq.
    a546af0d74af tick: Fix timer storm since introduction of timersd
    bfd12d9a9dfc rcutorture: Also force sched priority to timersd on boosting test.
    8898939cf3b1 softirq: Use a dedicated thread for timer wakeups.
    2c8cccade3f1 x86: Enable RT also on 32bit
    75a40b356238 x86: Allow to enable RT
    126193d32d0c net: Avoid the IPI to free the
    931d538b5c85 mm/page_alloc: Use write_seqlock_irqsave() instead write_seqlock() + local_irq_save().
    dd90b50f7be9 seqlock: Do the lockdep annotation before locking in do_write_seqcount_begin_nested()
    0874a8832dc7 ARM: vfp: Use vfp_lock() in vfp_entry().
    3c69696bd766 ARM: vfp: Use vfp_lock() in vfp_sync_hwstate().
    0fcd7c2cc385 ARM: vfp: Provide vfp_lock() for VFP locking.
    67cdd3607ac5 posix-timers: Ensure timer ID search-loop limit is valid
    d18adb7ffef3 posix-timers: Prevent RT livelock in itimer_delete()
    53c35a763a78 signal: Don't disable preemption in ptrace_stop() on PREEMPT_RT.
    0acdc7e2e082 signal: Add proper comment about the preempt-disable in ptrace_stop().
    ec0ce135acf0 locking/rtmutex: Add a lockdep assert to catch potential nested blocking
    5898c4215b40 locking/rtmutex: Avoid pointless blk_flush_plug() invocations
    8fbc724cb1c6 locking/rtmutex: Submit/resume work explicitly before/after blocking
    3e1028d6c3cc sched/core: Provide sched_rtmutex() and expose sched work helpers
    2c4691baa875 bpf: Remove in_atomic() from bpf_link_put().
    eb0a0f759f25 revert: "softirq: Let ksoftirqd do its job"
    3c160415c46a tracing/timer: Add missing hrtimer modes to decode_hrtimer_mode().
    c4d99ee1238f sched: Consider task_struct::saved_state in wait_task_inactive()
    587e9609ccd5 sched: Unconditionally use full-fat wait_task_inactive()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb   | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.4.bb      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
index 3e1331e52a..d1316e23a1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
@@ -14,8 +14,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "40dfcb393658098382d48669718a1cb16674c833"
-SRCREV_meta ?= "ebe5a59e59f8a82b7f7a641fece317a0a3ea05d2"
+SRCREV_machine ?= "369f3a1d2f3947bb0587f4ae8b15dd8803125de9"
+SRCREV_meta ?= "0b4a5500b775a9429c933ebb6d54d018ca921106"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
index db729a2e4d..6ad96d215c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "40dfcb393658098382d48669718a1cb16674c833"
-SRCREV_meta ?= "ebe5a59e59f8a82b7f7a641fece317a0a3ea05d2"
+SRCREV_meta ?= "0b4a5500b775a9429c933ebb6d54d018ca921106"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.4.bb b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
index 029aaaa004..85fcb33b3e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
@@ -28,7 +28,7 @@ SRCREV_machine:qemux86 ?= "40dfcb393658098382d48669718a1cb16674c833"
 SRCREV_machine:qemux86-64 ?= "40dfcb393658098382d48669718a1cb16674c833"
 SRCREV_machine:qemumips64 ?= "b14484af5492f03c8afc25f3684c8ae86a78295f"
 SRCREV_machine ?= "40dfcb393658098382d48669718a1cb16674c833"
-SRCREV_meta ?= "ebe5a59e59f8a82b7f7a641fece317a0a3ea05d2"
+SRCREV_meta ?= "0b4a5500b775a9429c933ebb6d54d018ca921106"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


