Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A1CDC25B10
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 12:05:30 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.8624.1715256325015674640
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 May 2024 05:05:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BsYoqBKf;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6f4178aec15so744824b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 05:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1715256324; x=1715861124; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wLXNb4Swn98P8EnO9sUXWaNYkvTc3GRWwlOHyMlDu58=;
        b=BsYoqBKfLJOacogPzWmZmlYinPXoDS/Jm2Mx5zXb26vKf3KwQInWlOfMCPfixbWAKm
         dNmCVKBFSEWWX5hYuC4t3IZEf94AFdNvKVpbqFeoeBQfOpT8QN84+/rGdncH1MG4Ra3t
         irpswwHrMSWUaKsfjLR4C9pcnh00rrBaVTDg7xVKBe5eJPUtLdq0k0g5MejEoG44qFW1
         X206abJu46CJOtPIVgOgqXMTVmAmEomXZPTTtbyGS0YqkDdvnUpiWFuIBoQNMasULGpo
         6Xegew69uXVqPCTHdEjjbXtrjxPcMwOUAMu9rtgC359cp98tver4s5iT7Z4Q4sGhgYWs
         FO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715256324; x=1715861124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLXNb4Swn98P8EnO9sUXWaNYkvTc3GRWwlOHyMlDu58=;
        b=guwGCmXmY7ULp/H65pZ1sW9adZ4FSoconMhjyM7vyLMubZfh7glwkqsNIZBy/Su8wt
         MQIHhbs/slkSdT8TTudlVGh1ln5rn5ydmmHiXVCvZcTlZ/spwk1my9qTxzHAVyygEVHo
         BHQN52IsRRo0AV3A1xb4wUL7LWo4sOC6l3FUUNkT8OGcRB8s86soK50FBCoe/3ilqk54
         4DTUvjMrmt8Yx979evLZeNZzIcn0Jd8N6OSczjR832AwubQO5UoNf/DyBrTzQkPpyBpw
         Ss/x+tzqi3eomUjp+e8DNXzcOyy0Rk2SgLC4ZBg6lvUzk4JroHpQM4SmwkEKtJKIiOcx
         mpjA==
X-Gm-Message-State: AOJu0Ywc0hnH0g0ErlYXqVeYqqUCjRvCY4dJr3DSA4/qGSiMqa4cceGE
	vx9rNTl/WRClwxOh0qoMka7zL1vetuvKNKb4hDvQiaUTGTKqJXAsUCterN5eFofCHdjPxz/5weM
	w
X-Google-Smtp-Source: AGHT+IGXk96K7PRQrbKc65Dz7dd+QA6S9SZ87sQwvvqQKizORzA8HrGJzJ/Zs4fPod86lXYOi8LekQ==
X-Received: by 2002:a05:6a00:2d1a:b0:6ec:f282:f4ea with SMTP id d2e1a72fcca58-6f49c2b173fmr6568315b3a.34.1715256323905;
        Thu, 09 May 2024 05:05:23 -0700 (PDT)
Received: from xps13.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2af2c41sm1185613b3a.172.2024.05.09.05.05.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 05:05:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/23] linux-yocto/5.15: update to v5.15.152
Date: Thu,  9 May 2024 05:04:48 -0700
Message-Id: <4545591ac316d4304a73b578ecfce57a10af886f.1715256149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715256149.git.steve@sakoman.com>
References: <cover.1715256149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 12:05:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199157

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    b95c01af2113 Linux 5.15.152
    a1211bbf7814 serial: max310x: fix IO data corruption in batched operations
    0ba485f90d97 serial: max310x: make accessing revision id interface-agnostic
    31642219f27a regmap: Add bulk read/write callbacks into regmap_config
    fbddd48f1456 regmap: allow to define reg_update_bits for no bus configuration
    cad6da86ca98 ALSA: usb-audio: Sort quirk table entries
    36dba3f4cd36 ALSA: usb-audio: Add FIXED_RATE quirk for JBL Quantum610 Wireless
    bfd36b1d1869 ALSA: usb-audio: Always initialize fixed_rate in snd_usb_find_implicit_fb_sync_format()
    a6f53df52b66 ALSA: usb-audio: Fix wrong kfree issue in snd_usb_endpoint_free_all
    fd63fb84ed6d fs/proc: do_task_stat: move thread_group_cputime_adjusted() outside of lock_task_sighand()
    9b3834276bb6 proc: Use task_is_running() for wchan in /proc/$pid/stat
    3c1b2776ef19 getrusage: use sig->stats_lock rather than lock_task_sighand()
    ef2734e57cb9 getrusage: use __for_each_thread()
    18c7394e46d8 getrusage: move thread_group_cputime_adjusted() outside of lock_task_sighand()
    c5579e7280e6 getrusage: add the "signal_struct *sig" local variable
    63e09c1f46d6 drm/amd/display: Increase frame-larger-than for all display_mode_vba files
    f4442513e426 drm/amd/display: remove DML Makefile duplicate lines
    b4bab46400a0 drm/amd/display: move calcs folder into DML
    b00e4d44ac77 drm/amd/display: Re-arrange FPU code structure for dcn2x
    b6d46f306b39 hv_netvsc: Register VF in netvsc_probe if NET_DEVICE_REGISTER missed
    c4cfa93e5018 hv_netvsc: use netif_is_bond_master() instead of open code
    760d0df3add5 selftests: mptcp: decrease BW in simult flows
    9a9d00c23d17 drm/amdgpu: Reset IH OVERFLOW_CLEAR bit
    f57431896095 drm/amd/pm: do not expose the API used internally only in kv_dpm.c
    0afbf40c0135 serial: max310x: prevent infinite while() loop in port startup
    2fbf2c767b50 serial: max310x: use a separate regmap for each port
    2161c5411d91 serial: max310x: use regmap methods for SPI batch operations
    2aa7bcfdbb46 xhci: handle isoc Babble and Buffer Overrun events properly
    56e9aeb2052c xhci: process isoc TD properly when there was a transaction error mid TD.
    0d29b474fb90 selftests: mm: fix map_hugetlb failure on 64K page size systems
    0b08eb637276 selftests/mm: switch to bash from sh
    fdfc5fabe85a nfp: flower: add hardware offload check for post ct entry
    245332d4e767 nfp: flower: add goto_chain_index for ct entry
    666334fdf4c6 drm/amd/display: Fix uninitialized variable usage in core_link_ 'read_dpcd() & write_dpcd()' functions
    f354086d1bf7 ALSA: usb-audio: add quirk for RODE NT-USB+
    80326ce1eb74 ALSA: usb-audio: Fix microphone sound on Nexigo webcam.
    f1a68c6a41c6 ALSA: usb-audio: Add new quirk FIXED_RATE for JBL Quantum810 Wireless
    d16ae91186f3 ALSA: usb-audio: Add quirk for Tascam Model 12
    7ce0a888d646 ALSA: usb-audio: Avoid superfluous endpoint setup
    3191a00dbe04 ALSA: usb-audio: Correct the return code from snd_usb_endpoint_set_params()
    06b6de69cf16 ALSA: usb-audio: Apply mutex around snd_usb_endpoint_set_params()
    539493f147ff ALSA: usb-audio: Properly refcounting clock rate
    56e28371faf4 ALSA: usb-audio: Split endpoint setups for hw_params and prepare (take#2)
    8ca3315bd876 ALSA: usb-audio: Clear fixed clock rate at closing EP
    9830e7383f18 ALSA: usb-audio: Refcount multiple accesses on the single clock
    0866afaff19d netrom: Fix data-races around sysctl_net_busy_read
    c558e54f7712 netrom: Fix a data-race around sysctl_netrom_link_fails_count
    f9c4d4246417 netrom: Fix a data-race around sysctl_netrom_routing_control
    4eacb242e22e netrom: Fix a data-race around sysctl_netrom_transport_no_activity_timeout
    489e05c614db netrom: Fix a data-race around sysctl_netrom_transport_requested_window_size
    85f34d352f4b netrom: Fix a data-race around sysctl_netrom_transport_busy_delay
    33081e0f3489 netrom: Fix a data-race around sysctl_netrom_transport_acknowledge_delay
    f84f7709486d netrom: Fix a data-race around sysctl_netrom_transport_maximum_tries
    b8006cb0a34a netrom: Fix a data-race around sysctl_netrom_transport_timeout
    775ed3549819 netrom: Fix data-races around sysctl_netrom_network_ttl_initialiser
    b3f0bc3a315c netrom: Fix a data-race around sysctl_netrom_obsolescence_count_initialiser
    bbc21f134b89 netrom: Fix a data-race around sysctl_netrom_default_path_quality
    101277e37d54 erofs: apply proper VMA alignment for memory mapped files on THP
    b3c0f5538205 netfilter: nf_conntrack_h323: Add protection for bmp length out of range
    bd9c90927a3c netfilter: nft_ct: fix l3num expectations with inet pseudo family
    b562ebe21ed9 net/rds: fix WARNING in rds_conn_connect_if_down
    f0363af9619c cpumap: Zero-initialise xdp_rxq_info struct before running XDP program
    cae330325795 net/ipv6: avoid possible UAF in ip6_route_mpath_notify()
    8d95465d9a42 net: ice: Fix potential NULL pointer dereference in ice_bridge_setlink()
    e46274df1100 net: sparx5: Fix use after free inside sparx5_del_mact_entry
    e77e0b0f2a11 geneve: make sure to pull inner header in geneve_rx()
    be3be07d237c tracing/net_sched: Fix tracepoints that save qdisc_dev() as a string
    e72b4e5e16f6 i40e: disable NAPI right after disabling irqs when handling xsk_pool
    533953fa90d1 ixgbe: {dis, en}able irqs in ixgbe_txrx_ring_{dis, en}able
    ea4e938d2ce4 net: lan78xx: fix runtime PM count underflow on link stop
    5ae5060e17a3 mmc: mmci: stm32: fix DMA API overlapping mappings warning
    287093040fc5 mmc: mmci: stm32: use a buffer for unaligned DMA requests
    8d1bab770956 locking/rwsem: Disable preemption while trying for rwsem lock
    7c82dac02886 block, loop: support partitions without scanning
    45f504f301d4 bpftool: Fix pretty print dump for maps without BTF loaded
    1f24338cb789 jbd2: Drop the merge conflicted hunk
    e1d0e3c51bde tpm: tis_i2c: Limit write bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    1abe841fe331 tpm: tis_i2c: Limit read bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    6224acfc1d56 tpm: Add flag to use default cancellation policy
    1cd19d48fb90 tpm: tis_i2c: Fix sanity check interrupt enable mask
    a883da132fa8 tpm: Add tpm_tis_i2c backend for tpm_tis_core
    a742ac8a1c51 tpm: Add tpm_tis_verify_crc to the tpm_tis_phy_ops protocol layer
    ef495c5f45f2 tpm: Remove read16/read32/write32 calls from tpm_tis_phy_ops
    1f3be2e23aa6 gcc-plugins: Reorganize gimple includes for GCC 13
    24615a3b932a ata: ahci: fix enum constants for gcc-13
    5d6cb145541a net: stmmac: Enable mac_managed_pm phylink config
    fd93aabb4287 tools/resolve_btfids: Use pkg-config to locate libelf
    130f9da78406 tools/resolve_btfids: Build with host flags
    00f2f1a782f9 tools/resolve_btfids: Support cross-building the kernel with clang
    17776a4ba9c2 tools/resolve_btfids: Install libbpf headers when building
    7c9808380d70 libbpf: Make libbpf_version.h non-auto-generated
    37ae1ba791ac libbpf: Add LIBBPF_DEPRECATED_SINCE macro for scheduling API deprecations
    a2667e6d7314 drm/radeon: free iio for atombios when driver shutdown
    f100c753aa1f powerpc: Fix reschedule bug in KUAP-unlocked user copy
    da5513f30187 libbpf: Fix build warning on ref_ctr_off
    4c5a089621a8 perf python: Account for multiple words in CC
    1c5699ee85d4 fs: move S_ISGID stripping into the vfs_*() helpers
    838f5d0701d8 fs: add mode_strip_sgid() helper
    d97172683641 squashfs: provide backing_dev_info in order to disable read-ahead
    ed037d7be40c irq_work: use kasan_record_aux_stack_noalloc() record callstack
    1363bd7dbde3 ixgbevf: add disable link state
    e5601ae2bd24 ixgbe: add improvement for MDD response functionality
    caa57cd80575 ixgbe: add the ability for the PF to disable VF link state
    16a77bfcc7df Check /dev/console using init_stat()
    04574fd5579a tracing/arm: Have max stack tracer handle the case of return address after data
    0e51e5717018 gpiolib: cdev: Set lineevent_state::irq after IRQ register successfully
    1e6b7da6ddba drivers/base: Fix unsigned comparison to -1 in CPUMAP_FILE_MAX_BYTES
    493160901320 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    04224f725aa3 irqchip/gic-v3-its: Skip HP notifier when no ITS is registered
    6f6c2996a81c irqchip/gic-v3-its: Postpone LPI pending table freeing and memreserve
    1fa94473423f irqchip/gic-v3-its: Give the percpu rdist struct its own flags field
    6013d1ae5feb cert host tools: Stop complaining about deprecated OpenSSL functions
    efe20512212b init/Kconfig: fix CC_HAS_ASM_GOTO_TIED_OUTPUT test with dash
    a40d2daf2795 pnmtologo: use relocatable file name
    3b40d5b41155 of: configfs: remove unused variable overlay_lock
    6c085baf1838 tools: use basename to identify file in gen-mach-types
    2fca0fd71981 lib/build_OID_registry: fix reproducibility issues
    0f586f4ee8ad vt/conmakehash: improve reproducibility
    a75774679f28 OF: DT-Overlay configfs interface (v8)
    d179c639b30b x86/boot: Wrap literal addresses in absolute_pointer()
    856ec356cf91 ACPI: thermal: drop an always true check
    7614af249993 xfs: Fix -Werror=dangling-pointer work-around for older GCC
    41470215f97e xfs: Work around GCC 12 -Werror=dangling-pointer for xfs_attr_remote.o
    44a445c1922d virtio-pci: Remove wrong address verification in vp_del_vqs()
    77aa9e489eaf bpf: Disallow unprivileged bpf by default
    ebfb1822e9f9 fs/aufs: fixup 5.15.36 fixups
    4eba9348d3e2 Revert "Revert "fbdev: Hot-unplug firmware fb devices on forced removal""
    5df6d1b00f95 jbd2: fix use-after-free of transaction_t race
    2d83e8196487 jbd2: refactor wait logic for transaction updates into a common function
    07a63f760793 netfilter: conntrack: avoid useless indirection during conntrack destruction
    4e7122625996 Revert "fbdev: Hot-unplug firmware fb devices on forced removal"
    7ba4cb36fd4f rcu: Avoid alloc_pages() when recording stack
    f78574dee71e kasan: test: silence intentional read overflow warnings
    d313cb89b6b1 kasan: arm64: fix pcpu_page_first_chunk crash with KASAN_VMALLOC
    5e279d5647cc arm64: support page mapping percpu first chunk allocator
    e5bf16752dca vmalloc: choose a better start address in vm_area_register_early()
    660b3d21b46f kasan: test: bypass __alloc_size checks
    00aa7573e53a kasan: test: add memcpy test that avoids out-of-bounds write
    67becf0b1bd4 kasan: fix tag for large allocations when using CONFIG_SLAB
    bedf1e033213 workqueue, kasan: avoid alloc_pages() when recording stack
    7195b67ce69b kasan: generic: introduce kasan_record_aux_stack_noalloc()
    bdff763f0e29 kasan: common: provide can_alloc in kasan_save_stack()
    51423ebb36ad lib/stackdepot: introduce __stack_depot_save()
    85373e66d847 lib/stackdepot: remove unused function argument
    5b6cc9b251f3 lib/stackdepot: include gfp.h
    c9f3902d8069 aufs: reduce overhead for "code present but disabled" use case.
    b98d189df02c aufs: bugfix, umount passes NULL to ->parse_monolithic()
    13b883cbbbd9 aufs standalone: cosmetic, missing copyright sentence
    21f8b0d81898 aufs: 5.15.5-20220117 ---> 5.15.5-20220221
    6199fd896645 aufs: tiny, headers after fs_context
    8ddb40e31c29 aufs: fs_context 7/7, finally remount
    69035f71c6fd aufs: fs_context 6/7, now mount
    bc841b970697 aufs: fs_context 5/7, parse all other mount options
    435188053da2 aufs: fs_context 4/7, parse xino options
    9af1f1825cbd aufs: fs_context 3/7, parse the branch-management options
    1c05eb767f8c aufs: fs_context 2/7, parse "br" mount option
    a8488f603134 aufs: fs_context 1/7, skelton of the new shceme
    8e32e0015564 aufs: pre fs_context, convert a static flag to a macro
    f90cb4144aec aufs: pre fs_context, support the incomplete sb and sbinfo case
    948762ef859c aufs: pre fs_context, convert the type of alloc_sbinfo()
    77151a08776b aufs: 5.15.5-20211129 ---> 5.15.5-20220117
    2539adbbbe1e aufs: 5.14-20211018 ---> 5.15.5-20211129
    7d32b25193c4 aufs: for v5.15-rc1, sync_inode() is gone
    66ec0c509225 aufs: for v5.15-rc1, new param 'rcu' for ->get_acl()
    69709dc518cd aufs: for v5.15-rc1, no mand-lock anymore
    ada8fe9543e5 aufs: 5.14-20210906  ---> 5.14-20211018
    b77f7f3f394a Revert "aufs: adjust to v5.15 fs changes"
    81bdce5b5876 tick/nohz: WARN_ON --> WARN_ON_ONCE to prevent console saturation
    97c963889222 sched/isolation: really align nohz_full with rcu_nocbs
    871f23ad3627 Revert "ARM: defconfig: Enable ax88796c driver for Exynos boards"
    ffad0783dd5b ARM: config: multi v7: Regenerate defconifg
    5c1e1a1ff2d3 ARM: config: multi v7: Add renamed symbols
    badaf96564fe ARM: config: multi v7: Clean up enabled by default options
    34996040fc9b ARM: config: multi v7: Drop unavailable options
    7f685244afb3 powerpc/mm: Switch obsolete dssall to .long
    20301aeb1a64 riscv: fix build with binutils 2.38
    9df58d070506 powerpc/lib/sstep: fix 'ptesync' build error
    720b61fc400b x86_64_defconfig: Fix warnings
    02bf23d26bc4 arm64: defconfig: cleanup config options
    05914e2c87e5 arm: defconfig: drop unused POWER_AVS option
    ffb532fa19b9 aufs5: fix build against v5.15.3+
    a4b3abf4d96d qemux86: add configuration symbol to select values
    fee94ee09154 clear_warn_once: add a clear_warn_once= boot parameter
    3d8762d900d9 clear_warn_once: bind a timer to written reset value
    95faacac47e8 clear_warn_once: expand debugfs to include read support
    de20c4240018 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    0e4aacead9c1 perf: x86-32: explicitly include <errno.h>
    9ad92c11468e perf: mips64: Convert __u64 to unsigned long long
    09e7efe3e68a perf: fix bench numa compilation
    e79becc44fa6 perf: add SLANG_INC for slang.h
    b1033b588681 perf: add sgidefs.h to for mips builds
    cf9db484ac0b perf: change --root to --prefix for python install
    7fd052c2c562 perf: add 'libperl not found' warning
    27a437cdd469 perf: force include of <stdbool.h>
    3b99d21bec2f fat: don't use obsolete random32 call in namei_vfat
    a7e9293b506b FAT: Added FAT_NO_83NAME
    6fd0e71d9e5c FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    c379b0d324ae FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    538be0fdb124 aufs: adjust to v5.15 fs changes
    f45da75c8759 aufs5: core
    047f57e07e01 aufs5: standalone
    029fc15574c8 aufs5: mmap
    610d0192ee94 aufs5: base
    d4e428d0ec5f aufs5: kbuild
    eb067eca251a yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    286af18d0875 yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    24d59a4e26a6 yaffs2: v5.12+ build fixups (not runtime tested)
    22c73536d5d7 yaffs: include blkdev.h
    506b7251bfb8 yaffs: fix misplaced variable declaration
    a0e26ff364dc yaffs2: v5.6 build fixups
    b10b1b2d169e yaffs2: fix memory leak when /proc/yaffs is read
    ad9adccbb214 yaffs: add strict check when call yaffs_internal_read_super
    2e3c3aec8279 yaffs: repair yaffs_get_mtd_device
    d662538516a7 yaffs: Fix build failure by handling inode i_version with proper atomic API
    70a6113ee2c7 yaffs2: fix memory leak in mount/umount
    3378e4a9e404 yaffs: Avoid setting any ACL releated xattr
    ec2284edddef Yaffs:check oob size before auto selecting Yaffs1
    c2a49874051c fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    e9a5105a3e73 yaffs2: adjust to proper location of MS_RDONLY
    608807406f13 yaffs2: import git revision b4ce1bb (jan, 2020)
    89e660ece42c initramfs: allow an optional wrapper script around initramfs generation
    b179dbc9aa10 iwlwifi: select MAC80211_LEDS conditionally
    3fd5ca3673d0 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    d1f6edbf0188 arm64/perf: Fix wrong cast that may cause wrong truncation
    d202fb2caf33 defconfigs: drop obselete options
    9a27e3b5f4e7 arm64/perf: fix backtrace for AAPCS with FP enabled
    e20d8cf019b4 linux-yocto: Handle /bin/awk issues
    b6d2a3dbbd3a uvesafb: provide option to specify timeout for task completion
    adb40f1e6a1a uvesafb: print error message when task timeout occurs
    f280a1ed0962 compiler.h: Undef before redefining __attribute_const__
    4352732f268c vmware: include jiffies.h
    7954a677968d Resolve jiffies wrapping about arp
    5f28a1035d95 nfs: Allow default io size to be configured.
    0d7260ad7106 check console device file on fs when booting
    900a12e37e0a mount_root: clarify error messages for when no rootfs found
    7b878cbea726 menuconfig,mconf-cfg: Allow specification of ncurses location
    6604fc1763b3 modpost: mask trivial warnings
    0d294adb09cb kbuild: exclude meta directory from distclean processing
    a097cdd95a9e powerpc: serialize image targets
    5db6ec39a0a3 arm: serialize build targets
    cbabca27905e crtsavres: fixups for 5.4+
    7fc7656ed403 powerpc/ptrace: Disable array-bounds warning with gcc8
    a5faac5a19a2 powerpc: Disable attribute-alias warnings from gcc8
    186c54665b67 powerpc: add crtsavres.o to archprepare for kbuild
    d1ea862964ca powerpc: kexec fix for powerpc64
    2ac35b89a0f9 powerpc: Add unwind information for SPE registers of E500 core
    2e1c348a28bb mips: vdso: fix 'jalr $t9' crash in vdso code
    ec57870b303a mips: Kconfig: add QEMUMIPS64 option
    6a81b3c08107 4kc cache tlb hazard: tlbp cache coherency
    74e3b2a21e54 malta uhci quirks: make allowance for slow 4k(e)c
    22e65b63d3b4 arm/Makefile: Fix systemtap
    b7f1ab59f19e vexpress: Pass LOADADDR to Makefile
    ce2800c73bf7 arm: ARM EABI socketcall
    019d142fd956 ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index ba093b7450..b04b2cc0c4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b4217af54500ea854ec4c6112747546fd17ffbd1"
-SRCREV_meta ?= "bef59dc5a78b4d101d1be23d4b36a73fd849241a"
+SRCREV_machine ?= "79e97202861289d2981a843bbc582a779195a735"
+SRCREV_meta ?= "b2311094781ba22a890f766ca1a267f58ec7e51b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.151"
+LINUX_VERSION ?= "5.15.152"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 3a19e17d80..f7b79b7395 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.151"
+LINUX_VERSION ?= "5.15.152"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "3046b9945907c6b02e6d9aff62d287872dc6e775"
-SRCREV_meta ?= "bef59dc5a78b4d101d1be23d4b36a73fd849241a"
+SRCREV_machine ?= "fdf03d698861bfa0f1403c1edda25343f675f3ee"
+SRCREV_meta ?= "b2311094781ba22a890f766ca1a267f58ec7e51b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index f7db6becd1..1f89065b3b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "4c3c9263f2df0559228f1edf79f1cfdbc17eb78e"
-SRCREV_machine:qemuarm64 ?= "4f4714e7a37c1803e55d3dfba63b0b3c79f3f13e"
-SRCREV_machine:qemumips ?= "8e9c4c18b99dc2a9607ab7aff55fbeb24e80a4fc"
-SRCREV_machine:qemuppc ?= "c21a9cc085e59393e0969fa8f4b29b7eb4d2f8d5"
-SRCREV_machine:qemuriscv64 ?= "c38d1c100bbd13b4d4e72d8ac4b08a2d51ca6433"
-SRCREV_machine:qemuriscv32 ?= "c38d1c100bbd13b4d4e72d8ac4b08a2d51ca6433"
-SRCREV_machine:qemux86 ?= "c38d1c100bbd13b4d4e72d8ac4b08a2d51ca6433"
-SRCREV_machine:qemux86-64 ?= "c38d1c100bbd13b4d4e72d8ac4b08a2d51ca6433"
-SRCREV_machine:qemumips64 ?= "fd55ed7972e2000134a014374c4c1d7ab4d9c6ff"
-SRCREV_machine ?= "c38d1c100bbd13b4d4e72d8ac4b08a2d51ca6433"
-SRCREV_meta ?= "bef59dc5a78b4d101d1be23d4b36a73fd849241a"
+SRCREV_machine:qemuarm ?= "af0142e57319b881b5edb6a855b23b453859a66f"
+SRCREV_machine:qemuarm64 ?= "617055b77747babfeb22acd52962ec2c498e0589"
+SRCREV_machine:qemumips ?= "2a603975d4255ef5f59936905b3d42334a80f86f"
+SRCREV_machine:qemuppc ?= "b49c46381f7ff40b25fe9cdc4713007aff565cdb"
+SRCREV_machine:qemuriscv64 ?= "1d307abeff1ecca864d5d978023a403b87e241cb"
+SRCREV_machine:qemuriscv32 ?= "1d307abeff1ecca864d5d978023a403b87e241cb"
+SRCREV_machine:qemux86 ?= "1d307abeff1ecca864d5d978023a403b87e241cb"
+SRCREV_machine:qemux86-64 ?= "1d307abeff1ecca864d5d978023a403b87e241cb"
+SRCREV_machine:qemumips64 ?= "87b43be50f7fd159ca2451d8eb81caee2fc22e11"
+SRCREV_machine ?= "1d307abeff1ecca864d5d978023a403b87e241cb"
+SRCREV_meta ?= "b2311094781ba22a890f766ca1a267f58ec7e51b"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "57436264850706f50887bbb2148ee2cc797c9485"
+SRCREV_machine:class-devupstream ?= "b95c01af211304429c11b8c8bdf791ab11f7f395"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.151"
+LINUX_VERSION ?= "5.15.152"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


