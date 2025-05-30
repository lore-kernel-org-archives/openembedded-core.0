Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED3DC5B556
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 15:40:27 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.9120.1748619618795034979
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 08:40:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HyAiRvSO;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2351227b098so14041335ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 08:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748619618; x=1749224418; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qcGiJnhzIWncE+b+MeDZznyj6mMLXiPBMUzYZP7S4RE=;
        b=HyAiRvSOIHuPEYiqgaFQqkSZv324v82Wm881HKRRebrTeJ10APBZbzHheEecJRaaTc
         uOTsF40Fm/yfugf5CCfKUe3WA/tGyNJOk7/LtBEV3BYIbCmy40/tyv8JoKPoDAx7X2oe
         Fgt+pJT9j0Nu6kwh0V1QJpqYmyvcQgHGjPzoMyS0YklC/qxjcEzXR6Tuw6aCdWQQahYC
         UbKd9+U10k83+Lso9Ejly+DXO43EV/jPjiInA+m0+ohUzleQZVMdnZMRfr9Oy6QywXQM
         75vwQX6OsFPO0Efk4FaOPhngoUUIclz4SeFaCIKRwMy/QxfdWNY3QzQkqioVKcueTCJ4
         RHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748619618; x=1749224418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qcGiJnhzIWncE+b+MeDZznyj6mMLXiPBMUzYZP7S4RE=;
        b=idJ6IbTW7UNZwwQnoK7Y4mCM/c04lkWuF5olp6A4MO7RMa1faFp46kdQDNQTcHQZ8i
         XH1rEdpvesnn4oiabbQUOkkryiKcK1kJF85/8ubLeZC2EWSIM1sJKgEPwAMVNAvd90wD
         vzgW0FD7NOYbm1fz2QGfJHzqyEcTdH3fNPAHzzbBHqwE7Ofwp9v/pH9WxZ/tyMd6uI7t
         2n5sZ6tht+H1fuOqnC23nJIyp0SVay3/yW7eRpoHOwLoYHhz4Ru13OYlZwzAcEEOVcuQ
         TcCJfGHJZkG1oFlwTEVq0tYveaeM2N643cbv2vNAQADgDDkwUie7YIxhAvRF2B8hX0sO
         Qq/A==
X-Gm-Message-State: AOJu0YxD8yJa8YAB6OOrgpCJ+2oCoPHfm6/hMd6WZkX9PrW/FixkPpRJ
	/hbsqFDH/H0DX4T9j3Sl97rShmDj9y4O51BHUQ6NKOVc8AuFM1DZE9P96FOdudEnvRs+j10eYkQ
	9MiJl
X-Gm-Gg: ASbGncuZV8sVOFZ9RlfkYGriyMVGiClKX6ST3DwrkI9c50NqiHZ5p+HXOAD4UGW8iVt
	k7jslEeAonTwwzD4NHJ5OTjkU4X0gU4dY/yb9oIQCHVD3vfMnH2V+8lJuueJ66u3fQUzDPKeeEM
	epIEaHMP5fKo1MXBUucV706brW1N0Tzj+adgvt+1Pdl3EpYtU/AFZTajQfz9ivGhFTpKL8kjqYd
	gPsIAsW8Jac8exd7sgSF7tPErW/9aJsFxauRtHhNFtegAX7vCCfg0XhX7XfvXF+Ok3gviHHzmlk
	N8ArAQPTzh9rMre607R2sUY7c8ZgzAkZVDNQCq03awQ=
X-Google-Smtp-Source: AGHT+IGoGZIHSz50P1MmnaRaHJP9QHXbE4ixSagu6EGBBmXKavjlZrhtzdrijKsD6P8ihKFIuAhGKg==
X-Received: by 2002:a17:902:dac5:b0:234:c5c1:9b70 with SMTP id d9443c01a7336-23528de4763mr54972375ad.17.1748619617748;
        Fri, 30 May 2025 08:40:17 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c9d8:e2d0:bfbc:3a26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf9116sm29903075ad.200.2025.05.30.08.40.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 08:40:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/10] linux-yocto/5.15: update to v5.15.184
Date: Fri, 30 May 2025 08:39:51 -0700
Message-ID: <471382b66a0f9f7001d80355c7a9128ff4b6b4b9.1748619488.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748619488.git.steve@sakoman.com>
References: <cover.1748619488.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 15:40:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217518

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    98f47d0e9b8c5 Linux 5.15.184
    4ad2d3c4d3cc4 x86/modules: Set VM_FLUSH_RESET_PERMS in module_alloc()
    618df75f2e30c ice: arfs: fix use-after-free when freeing @rx_cpu_rmap
    b8d8f53e18581 netfilter: nf_tables: do not defer rule destruction via call_rcu
    a394c160d57f4 netfilter: nf_tables: wait for rcu grace period on net_device removal
    ba674db81a154 netfilter: nf_tables: pass nft_chain to destroy function, not nft_ctx
    7170875083254 btrfs: do not clean up repair bio if submit fails
    d64807ded1b60 btrfs: don't BUG_ON() when 0 reference count at btrfs_lookup_extent_info()
    65ccb2793da74 sctp: add mutual exclusion in proc_sctp_do_udp_port()
    ef3a6d3795068 selftests/mm: compaction_test: support platform with huge mount of memory
    6dacd2514eb9f usb: typec: fix pm usage counter imbalance in ucsi_ccg_sync_control()
    e15fd96c0b701 usb: typec: fix potential array underflow in ucsi_ccg_sync_control()
    9794ffd9d0c39 usb: typec: altmodes/displayport: create sysfs nodes as driver's default device attribute group
    f4bd982563c2f usb: typec: ucsi: displayport: Fix deadlock
    cec4f45bf51e0 clocksource/i8253: Use raw_spinlock_irqsave() in clockevent_i8253_disable()
    4f8244e0a2f4c block: fix direct io NOWAIT flag not work
    d83e52750d9a1 dmaengine: idxd: fix memory leak in error handling path of idxd_setup_groups
    7aa46ac359d34 dmaengine: idxd: fix memory leak in error handling path of idxd_setup_engines
    e7320147cf618 dmaengine: ti: k3-udma: Use cap_mask directly from dma_device structure instead of a local copy
    0ea0433f822ed dmaengine: ti: k3-udma: Add missing locking
    ca5b213bf4b42 wifi: mt76: disable napi on driver removal
    6fe084205a537 phy: renesas: rcar-gen3-usb2: Set timing registers only once
    35968b3f9538f phy: Fix error handling in tegra_xusb_port_init
    72b4e7e9a1599 tracing: samples: Initialize trace_array_printk() with the correct function
    560877a88d047 ftrace: Fix preemption accounting for stacktrace filter command
    deea40f26b9de ftrace: Fix preemption accounting for stacktrace trigger command
    466ef37d5545d ALSA: usb-audio: Add sample rate quirk for Microdia JP001 USB Camera
    e9600f67e8b9f ALSA: usb-audio: Add sample rate quirk for Audioengine D1
    9a51bc5224421 ALSA: es1968: Add error handling for snd_pcm_hw_constraint_pow2()
    d993895c11c42 ACPI: PPTT: Fix processor subtable walk
    d4175c6f96294 btrfs: fix discard worker infinite loop after disabling discard
    530e67c4b0120 dmaengine: Revert "dmaengine: dmatest: Fix dmatest waiting less when interrupted"
    cfcb2a5affbe8 x86/its: FineIBT-paranoid vs ITS
    e7117657695bd x86/its: Fix build errors when CONFIG_MODULES=n
    1b231a497756e x86/its: Use dynamic thunks for indirect branches
    c9ec159fed9f5 x86/its: Align RETs in BHB clear sequence to avoid thunking
    4804d7974301f x86/its: Add "vmexit" option to skip mitigation on some CPUs
    e30bcefa93a64 x86/its: Enable Indirect Target Selection mitigation
    5d19a0574b755 x86/its: Add support for ITS-safe return thunk
    498afe80ce3ec x86/alternatives: Remove faulty optimization
    a70424c61d5e6 x86/alternative: Optimize returns patching
    858073be8899e x86/its: Add support for ITS-safe indirect thunk
    34be1a3100b08 x86/its: Enumerate Indirect Target Selection (ITS) bug
    da8db23e3c8dd Documentation: x86/bugs/its: Add ITS documentation
    86a34f5eb24c9 x86/speculation: Remove the extra #ifdef around CALL_NOSPEC
    2d69c40c820a4 x86/speculation: Add a conditional CS prefix to CALL_NOSPEC
    175b3cb84685e x86/speculation: Simplify and make CALL_NOSPEC consistent
    8595a7453a5f6 x86,nospec: Simplify {JMP,CALL}_NOSPEC
    65346f970490e NFSv4/pnfs: Reset the layout state after a layoutreturn
    1eccb3a2dfe2e qlcnic: fix memory leak in qlcnic_sriov_channel_cfg_cmd()
    6d7a81a69af50 ALSA: sh: SND_AICA should depend on SH_DMA_API
    c8fe73ea80b49 net: dsa: sja1105: discard incoming frames in BR_STATE_LISTENING
    64675a9c00443 net: cadence: macb: Fix a possible deadlock in macb_halt_tx.
    d3336f746f196 net_sched: Flush gso_skb list too during ->change()
    894b06a72bd61 spi: loopback-test: Do not split 1024-byte hexdumps
    72f552e00c50f nfs: handle failure of nfs_get_lock_context in unlock path
    f8f470e3a7574 RDMA/rxe: Fix slab-use-after-free Read in rxe_queue_cleanup bug
    d91ab703438c6 iio: chemical: sps30: use aligned_s64 for timestamp
    a7a49aaab5787 iio: adc: ad7768-1: Fix insufficient alignment of timestamp.
    67c9081445295 tracing: probes: Fix a possible race in trace_probe_log APIs
    cc64061b90937 platform/x86: asus-wmi: Fix wlan_ctrl_by_user detection
    e0bb89c44b56e efi: libstub: Use '-std=gnu11' to fix build with GCC 15
    b5d500042eb33 usb: hcd-pci: remove the action of faking interrupt request
    6f0605db50e2c clk: imx: Add check for kcalloc
    5b837b9e1543e bpf: Fix the indention issue in grow_stack_state()
    42b62697634d1 cifs: Fix the calling of smb_version_operations::calc_smb_size()
    b14acf729e9dc f2fs: Add inline to f2fs_build_fault_attr() stub
    7c317bec311f8 f2fs: check validation of fault attrs in f2fs_build_fault_attr()
    81c12119c23f8 bpf: Fix accesses to uninit stack slots [ Upstream commit 6b4a64bafd107e521c01eec3453ce94a3fb38529 ]
    c4fa05422d87c smb: client: fix potential OOB in smb2_dump_detail()
    299ef3b5b00bf of: module: add buffer overflow check in of_modalias()
    b8086c3c1548b reiserfs: Avoid touching renamed directory if parent does not change
    ea091017ef62c ipv6: Fix data races around sk->sk_prot.
    ff8710da80ee6 ipv6: annotate some data-races around sk->sk_prot
    e8c2eafaaa6ac tcp: Fix data races around icsk->icsk_af_ops.
    8d1bab7709564 locking/rwsem: Disable preemption while trying for rwsem lock
    7c82dac028864 block, loop: support partitions without scanning
    45f504f301d41 bpftool: Fix pretty print dump for maps without BTF loaded
    1f24338cb789e jbd2: Drop the merge conflicted hunk
    e1d0e3c51bde6 tpm: tis_i2c: Limit write bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    1abe841fe331a tpm: tis_i2c: Limit read bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    6224acfc1d56b tpm: Add flag to use default cancellation policy
    1cd19d48fb909 tpm: tis_i2c: Fix sanity check interrupt enable mask
    a883da132fa82 tpm: Add tpm_tis_i2c backend for tpm_tis_core
    a742ac8a1c511 tpm: Add tpm_tis_verify_crc to the tpm_tis_phy_ops protocol layer
    ef495c5f45f2e tpm: Remove read16/read32/write32 calls from tpm_tis_phy_ops
    1f3be2e23aa6d gcc-plugins: Reorganize gimple includes for GCC 13
    24615a3b932aa ata: ahci: fix enum constants for gcc-13
    5d6cb145541aa net: stmmac: Enable mac_managed_pm phylink config
    fd93aabb42872 tools/resolve_btfids: Use pkg-config to locate libelf
    130f9da784063 tools/resolve_btfids: Build with host flags
    00f2f1a782f9b tools/resolve_btfids: Support cross-building the kernel with clang
    17776a4ba9c20 tools/resolve_btfids: Install libbpf headers when building
    7c9808380d70c libbpf: Make libbpf_version.h non-auto-generated
    37ae1ba791ac7 libbpf: Add LIBBPF_DEPRECATED_SINCE macro for scheduling API deprecations
    a2667e6d7314d drm/radeon: free iio for atombios when driver shutdown
    f100c753aa1f9 powerpc: Fix reschedule bug in KUAP-unlocked user copy
    da5513f301871 libbpf: Fix build warning on ref_ctr_off
    4c5a089621a8f perf python: Account for multiple words in CC
    1c5699ee85d4f fs: move S_ISGID stripping into the vfs_*() helpers
    838f5d0701d89 fs: add mode_strip_sgid() helper
    d971726836412 squashfs: provide backing_dev_info in order to disable read-ahead
    ed037d7be40c3 irq_work: use kasan_record_aux_stack_noalloc() record callstack
    1363bd7dbde39 ixgbevf: add disable link state
    e5601ae2bd249 ixgbe: add improvement for MDD response functionality
    caa57cd80575d ixgbe: add the ability for the PF to disable VF link state
    16a77bfcc7df1 Check /dev/console using init_stat()
    04574fd5579a4 tracing/arm: Have max stack tracer handle the case of return address after data
    0e51e57170184 gpiolib: cdev: Set lineevent_state::irq after IRQ register successfully
    1e6b7da6ddba7 drivers/base: Fix unsigned comparison to -1 in CPUMAP_FILE_MAX_BYTES
    4931609013207 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    04224f725aa36 irqchip/gic-v3-its: Skip HP notifier when no ITS is registered
    6f6c2996a81c1 irqchip/gic-v3-its: Postpone LPI pending table freeing and memreserve
    1fa94473423ff irqchip/gic-v3-its: Give the percpu rdist struct its own flags field
    6013d1ae5feb1 cert host tools: Stop complaining about deprecated OpenSSL functions
    efe20512212b0 init/Kconfig: fix CC_HAS_ASM_GOTO_TIED_OUTPUT test with dash
    a40d2daf2795d pnmtologo: use relocatable file name
    3b40d5b41155f of: configfs: remove unused variable overlay_lock
    6c085baf18386 tools: use basename to identify file in gen-mach-types
    2fca0fd719812 lib/build_OID_registry: fix reproducibility issues
    0f586f4ee8ada vt/conmakehash: improve reproducibility
    a75774679f28c OF: DT-Overlay configfs interface (v8)
    d179c639b30ba x86/boot: Wrap literal addresses in absolute_pointer()
    856ec356cf91e ACPI: thermal: drop an always true check
    7614af249993e xfs: Fix -Werror=dangling-pointer work-around for older GCC
    41470215f97ee xfs: Work around GCC 12 -Werror=dangling-pointer for xfs_attr_remote.o
    44a445c1922dc virtio-pci: Remove wrong address verification in vp_del_vqs()
    77aa9e489eafd bpf: Disallow unprivileged bpf by default
    ebfb1822e9f97 fs/aufs: fixup 5.15.36 fixups
    4eba9348d3e2e Revert "Revert "fbdev: Hot-unplug firmware fb devices on forced removal""
    5df6d1b00f95b jbd2: fix use-after-free of transaction_t race
    2d83e8196487f jbd2: refactor wait logic for transaction updates into a common function
    07a63f760793c netfilter: conntrack: avoid useless indirection during conntrack destruction
    4e71226259962 Revert "fbdev: Hot-unplug firmware fb devices on forced removal"
    7ba4cb36fd4f3 rcu: Avoid alloc_pages() when recording stack
    f78574dee71e4 kasan: test: silence intentional read overflow warnings
    d313cb89b6b1f kasan: arm64: fix pcpu_page_first_chunk crash with KASAN_VMALLOC
    5e279d5647ccf arm64: support page mapping percpu first chunk allocator
    e5bf16752dcac vmalloc: choose a better start address in vm_area_register_early()
    660b3d21b46f3 kasan: test: bypass __alloc_size checks
    00aa7573e53a2 kasan: test: add memcpy test that avoids out-of-bounds write
    67becf0b1bd44 kasan: fix tag for large allocations when using CONFIG_SLAB
    bedf1e033213c workqueue, kasan: avoid alloc_pages() when recording stack
    7195b67ce69b3 kasan: generic: introduce kasan_record_aux_stack_noalloc()
    bdff763f0e295 kasan: common: provide can_alloc in kasan_save_stack()
    51423ebb36adb lib/stackdepot: introduce __stack_depot_save()
    85373e66d8474 lib/stackdepot: remove unused function argument
    5b6cc9b251f32 lib/stackdepot: include gfp.h
    c9f3902d8069e aufs: reduce overhead for "code present but disabled" use case.
    b98d189df02cc aufs: bugfix, umount passes NULL to ->parse_monolithic()
    13b883cbbbd9f aufs standalone: cosmetic, missing copyright sentence
    21f8b0d81898e aufs: 5.15.5-20220117 ---> 5.15.5-20220221
    6199fd8966450 aufs: tiny, headers after fs_context
    8ddb40e31c29b aufs: fs_context 7/7, finally remount
    69035f71c6fd1 aufs: fs_context 6/7, now mount
    bc841b9706977 aufs: fs_context 5/7, parse all other mount options
    435188053da29 aufs: fs_context 4/7, parse xino options
    9af1f1825cbd7 aufs: fs_context 3/7, parse the branch-management options
    1c05eb767f8c3 aufs: fs_context 2/7, parse "br" mount option
    a8488f603134a aufs: fs_context 1/7, skelton of the new shceme
    8e32e0015564e aufs: pre fs_context, convert a static flag to a macro
    f90cb4144aec4 aufs: pre fs_context, support the incomplete sb and sbinfo case
    948762ef859c2 aufs: pre fs_context, convert the type of alloc_sbinfo()
    77151a08776b1 aufs: 5.15.5-20211129 ---> 5.15.5-20220117
    2539adbbbe1e4 aufs: 5.14-20211018 ---> 5.15.5-20211129
    7d32b25193c4c aufs: for v5.15-rc1, sync_inode() is gone
    66ec0c509225d aufs: for v5.15-rc1, new param 'rcu' for ->get_acl()
    69709dc518cd8 aufs: for v5.15-rc1, no mand-lock anymore
    ada8fe9543e50 aufs: 5.14-20210906  ---> 5.14-20211018
    b77f7f3f394ad Revert "aufs: adjust to v5.15 fs changes"
    81bdce5b58765 tick/nohz: WARN_ON --> WARN_ON_ONCE to prevent console saturation
    97c9638892228 sched/isolation: really align nohz_full with rcu_nocbs
    871f23ad36271 Revert "ARM: defconfig: Enable ax88796c driver for Exynos boards"
    ffad0783dd5b2 ARM: config: multi v7: Regenerate defconifg
    5c1e1a1ff2d39 ARM: config: multi v7: Add renamed symbols
    badaf96564fe1 ARM: config: multi v7: Clean up enabled by default options
    34996040fc9bd ARM: config: multi v7: Drop unavailable options
    7f685244afb3a powerpc/mm: Switch obsolete dssall to .long
    20301aeb1a641 riscv: fix build with binutils 2.38
    9df58d0705069 powerpc/lib/sstep: fix 'ptesync' build error
    720b61fc400b5 x86_64_defconfig: Fix warnings
    02bf23d26bc4c arm64: defconfig: cleanup config options
    05914e2c87e51 arm: defconfig: drop unused POWER_AVS option
    ffb532fa19b90 aufs5: fix build against v5.15.3+
    a4b3abf4d96d7 qemux86: add configuration symbol to select values
    fee94ee091541 clear_warn_once: add a clear_warn_once= boot parameter
    3d8762d900d93 clear_warn_once: bind a timer to written reset value
    95faacac47e8d clear_warn_once: expand debugfs to include read support
    de20c4240018c perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    0e4aacead9c15 perf: x86-32: explicitly include <errno.h>
    9ad92c11468e2 perf: mips64: Convert __u64 to unsigned long long
    09e7efe3e68a0 perf: fix bench numa compilation
    e79becc44fa6b perf: add SLANG_INC for slang.h
    b1033b5886819 perf: add sgidefs.h to for mips builds
    cf9db484ac0b4 perf: change --root to --prefix for python install
    7fd052c2c5624 perf: add 'libperl not found' warning
    27a437cdd4691 perf: force include of <stdbool.h>
    3b99d21bec2f6 fat: don't use obsolete random32 call in namei_vfat
    a7e9293b506bb FAT: Added FAT_NO_83NAME
    6fd0e71d9e5c1 FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    c379b0d324aeb FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    538be0fdb124f aufs: adjust to v5.15 fs changes
    f45da75c8759b aufs5: core
    047f57e07e01b aufs5: standalone
    029fc15574c88 aufs5: mmap
    610d0192ee94d aufs5: base
    d4e428d0ec5f4 aufs5: kbuild
    eb067eca251ab yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    286af18d0875e yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    24d59a4e26a67 yaffs2: v5.12+ build fixups (not runtime tested)
    22c73536d5d7e yaffs: include blkdev.h
    506b7251bfb81 yaffs: fix misplaced variable declaration
    a0e26ff364dcc yaffs2: v5.6 build fixups
    b10b1b2d169ef yaffs2: fix memory leak when /proc/yaffs is read
    ad9adccbb2147 yaffs: add strict check when call yaffs_internal_read_super
    2e3c3aec8279b yaffs: repair yaffs_get_mtd_device
    d662538516a7c yaffs: Fix build failure by handling inode i_version with proper atomic API
    70a6113ee2c7c yaffs2: fix memory leak in mount/umount
    3378e4a9e4043 yaffs: Avoid setting any ACL releated xattr
    ec2284edddef1 Yaffs:check oob size before auto selecting Yaffs1
    c2a49874051cd fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    e9a5105a3e735 yaffs2: adjust to proper location of MS_RDONLY
    608807406f138 yaffs2: import git revision b4ce1bb (jan, 2020)
    89e660ece42c8 initramfs: allow an optional wrapper script around initramfs generation
    b179dbc9aa109 iwlwifi: select MAC80211_LEDS conditionally
    3fd5ca3673d03 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    d1f6edbf01883 arm64/perf: Fix wrong cast that may cause wrong truncation
    d202fb2caf337 defconfigs: drop obselete options
    9a27e3b5f4e73 arm64/perf: fix backtrace for AAPCS with FP enabled
    e20d8cf019b42 linux-yocto: Handle /bin/awk issues
    b6d2a3dbbd3a3 uvesafb: provide option to specify timeout for task completion
    adb40f1e6a1a5 uvesafb: print error message when task timeout occurs
    f280a1ed09626 compiler.h: Undef before redefining __attribute_const__
    4352732f268c1 vmware: include jiffies.h
    7954a677968dc Resolve jiffies wrapping about arp
    5f28a1035d950 nfs: Allow default io size to be configured.
    0d7260ad71066 check console device file on fs when booting
    900a12e37e0a2 mount_root: clarify error messages for when no rootfs found
    7b878cbea7261 menuconfig,mconf-cfg: Allow specification of ncurses location
    6604fc1763b3d modpost: mask trivial warnings
    0d294adb09cbc kbuild: exclude meta directory from distclean processing
    a097cdd95a9ef powerpc: serialize image targets
    5db6ec39a0a3e arm: serialize build targets
    cbabca27905e2 crtsavres: fixups for 5.4+
    7fc7656ed403e powerpc/ptrace: Disable array-bounds warning with gcc8
    a5faac5a19a2e powerpc: Disable attribute-alias warnings from gcc8
    186c54665b676 powerpc: add crtsavres.o to archprepare for kbuild
    d1ea862964cae powerpc: kexec fix for powerpc64
    2ac35b89a0f90 powerpc: Add unwind information for SPE registers of E500 core
    2e1c348a28bbc mips: vdso: fix 'jalr $t9' crash in vdso code
    ec57870b303a8 mips: Kconfig: add QEMUMIPS64 option
    6a81b3c081078 4kc cache tlb hazard: tlbp cache coherency
    74e3b2a21e542 malta uhci quirks: make allowance for slow 4k(e)c
    22e65b63d3b4c arm/Makefile: Fix systemtap
    b7f1ab59f19e5 vexpress: Pass LOADADDR to Makefile
    ce2800c73bf7e arm: ARM EABI socketcall
    019d142fd956a ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index d4164bf7de..2f6af169f4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "9920102576b0b7c8a2ba1fb4ba2ae0ddd8167568"
-SRCREV_meta ?= "722a637ebdb5df1a0f18c51d005589ac94501a24"
+SRCREV_machine ?= "90d8b830089647dcc97fd836c4f1fde65f24f6d6"
+SRCREV_meta ?= "9c4fc176eca557a5763bda2831fa5ea2985fadeb"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.183"
+LINUX_VERSION ?= "5.15.184"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index b4be24e79c..0abc849545 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.183"
+LINUX_VERSION ?= "5.15.184"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "a2979659c67766908c2407e3f3957a6642f104ef"
-SRCREV_meta ?= "722a637ebdb5df1a0f18c51d005589ac94501a24"
+SRCREV_machine ?= "660c504885ff7bd0edf06980c19539373e6bba05"
+SRCREV_meta ?= "9c4fc176eca557a5763bda2831fa5ea2985fadeb"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 82a5672156..5bc6082e4d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "a2803632eb80208137f707421b4fd72557937cd5"
-SRCREV_machine:qemuarm64 ?= "b6c3b07a660e8fa719fd2fc9b4cc9d38dc1acab2"
-SRCREV_machine:qemumips ?= "5180be371f4c40e7b8d37ad57b0cb56c55428ca6"
-SRCREV_machine:qemuppc ?= "d074e01829e0578ccae12de05cdd7549d27ed60f"
-SRCREV_machine:qemuriscv64 ?= "59ef6982d24baa3666cbc1c159416a6c33644140"
-SRCREV_machine:qemuriscv32 ?= "59ef6982d24baa3666cbc1c159416a6c33644140"
-SRCREV_machine:qemux86 ?= "59ef6982d24baa3666cbc1c159416a6c33644140"
-SRCREV_machine:qemux86-64 ?= "59ef6982d24baa3666cbc1c159416a6c33644140"
-SRCREV_machine:qemumips64 ?= "cacd5b05c26a56b779c0e2733a8e5c71ed8d3bb7"
-SRCREV_machine ?= "59ef6982d24baa3666cbc1c159416a6c33644140"
-SRCREV_meta ?= "722a637ebdb5df1a0f18c51d005589ac94501a24"
+SRCREV_machine:qemuarm ?= "27eaa24a0448c2ec0a7402e76fd208b6e2998eda"
+SRCREV_machine:qemuarm64 ?= "f97f77899cbaf0bd844d15f9eeceac0ead4c8a76"
+SRCREV_machine:qemumips ?= "a76e6f5b3fe8e298e66874f5e7e03acc3a0097ca"
+SRCREV_machine:qemuppc ?= "1fc08762bbe900514d2a810a1b48d70e8c3f045e"
+SRCREV_machine:qemuriscv64 ?= "9a9d15d3fcaa246682b1283a37af48a9c71b6b13"
+SRCREV_machine:qemuriscv32 ?= "9a9d15d3fcaa246682b1283a37af48a9c71b6b13"
+SRCREV_machine:qemux86 ?= "9a9d15d3fcaa246682b1283a37af48a9c71b6b13"
+SRCREV_machine:qemux86-64 ?= "9a9d15d3fcaa246682b1283a37af48a9c71b6b13"
+SRCREV_machine:qemumips64 ?= "19e099ff3a9f78fe5f88c4dc44ab4f28b2981c25"
+SRCREV_machine ?= "9a9d15d3fcaa246682b1283a37af48a9c71b6b13"
+SRCREV_meta ?= "9c4fc176eca557a5763bda2831fa5ea2985fadeb"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "a68c151521315aaa84244b916e6ea01017d5370f"
+SRCREV_machine:class-devupstream ?= "98f47d0e9b8c557d3063d3ea661cbea1489af330"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.183"
+LINUX_VERSION ?= "5.15.184"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.43.0


