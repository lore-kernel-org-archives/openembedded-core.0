Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE732E7718F
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 14:17:26 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.31537.1735913842557445135
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jan 2025 06:17:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l9YXjjBz;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7ba0fa25f07so389859685a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 06:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735913841; x=1736518641; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQ0mujTBB9B/gfe73TfmdHCnR9gfhBeACGDAddOTjfw=;
        b=l9YXjjBzcGKnPXrUdH1TE04Cai25/lmzsszhr9CCDKGmlZdjXSSuiCJi01pmm3cmz5
         QoQqHugaGutu1UNHEXZkUD5raictyp+aPC7ry9/x4aTDzOlVRRCn6KHA25hvI+hbGKLL
         Beegpd0Y7neFSyv0VdNkICZkEbbWdZSR+9qCsCmFR2BlaNf4W8/vCY4+Iyt+yVN35yJg
         TiBdO/fG5HDiLMLze/iODPwLgiL5dYx9CTUIoK8fr7hp+I8Ah+DIfEh/VtomznpZwmBO
         o8GReN2ov6tKgDkTAHpZXFxCSeIwnjbvlzl0r4BYP3+RpNmT0YsVRWJ0b1zyebPUT0NX
         NZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735913841; x=1736518641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JQ0mujTBB9B/gfe73TfmdHCnR9gfhBeACGDAddOTjfw=;
        b=pWoyGwJcJgMqO/At9k1xgl+SMYL2kod3OZQwoGzrEWE8AEIq46S7hZSv1/ZFQnnkCL
         O/2jcmzXHEfbU5W8BNypm8P0UtyLHWmqvJRCqvAnuxU09QpM0X6d6qVz0M8bzgy2Opd0
         nQyAhSXepjf2HLI4QHZcwe1zLnlAUAGgt3F1gJIxyb73nKqnRmvZ2ZMSmz7hCdUTQNHq
         a0PFzTBu4FDPd2cjIO3fkk2WJOs4nqyuQuOUSbT00cFtn1Q70+yNOCoFXl+ThMOO5SzM
         Qgtl/dv/aGDwH4wEkISAQwElFl1G3uXvOV+2KyEUMDcbBjWUdOfP4Pfua5re7zTXSTCL
         6a6w==
X-Gm-Message-State: AOJu0YwWE4N/YMIJFrCBSVVV5XZNu3q4i9HqH6h4qeLfLcb71DxyzEWW
	SK3TQ/rw9JlFngoZmuMJeMi1Mjsa3LpeKaCGrpeKIZJl8Rm4aMqtSzkkySS0Rok=
X-Gm-Gg: ASbGncstH2RqmYp4qPiTw+OmKti8SgoOOLg1zwMsw9hmJL5ONeI3eCo2l2SOTcqc94L
	2ojkz+vvfanj0NMN0540dFXhsgADZgX5dotN0mAKo0piiAdxnu4pdXPZNjbHAKPIcBtyzZg1PGc
	UFD51s1EK97z7vNEUkxQuo7Im9FzdZ2L70urlkhdAPljzwhVsPrB7bmJudcjMsJVlXuLsYB1Mfp
	PT0NMaArCGuLxXXMvdmaI3K7BUDbydY4S4RjHy4QHGYYYJqsnqJ1Ivbij7XyEPNHEDzqGK5Akzp
	NmHIv/MjZYXeCy+0zSTF0Her6hwtbOUClGqKXzGsVIDQbkl0Zyfr5sCaPw==
X-Google-Smtp-Source: AGHT+IEdXT1pchQyrIGvCBbVWbRGof11ZmgFkX9qhkdroynn50jwvyjh75srC0NO/3eQ2VxUNMFuXA==
X-Received: by 2002:a05:620a:24d4:b0:7b6:d611:5d35 with SMTP id af79cd13be357-7b9ba7b0bfdmr6765588485a.32.1735913841284;
        Fri, 03 Jan 2025 06:17:21 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac4ef0f6sm1275015485a.123.2025.01.03.06.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 06:17:20 -0800 (PST)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/10] linux-yocto/5.15: update to v5.15.171
Date: Fri,  3 Jan 2025 09:17:06 -0500
Message-Id: <20250103141709.2848730-8-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250103141709.2848730-1-bruce.ashfield@gmail.com>
References: <20250103141709.2848730-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 14:17:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209361

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    3c17fc4839052 Linux 5.15.171
    3d88f7c32432f mac80211: always have ieee80211_sta_restart()
    b3959d5eca136 vt: prevent kernel-infoleak in con_font_get()
    ae27888719311 drm/i915: Fix potential context UAFs
    5a31d94fc0161 Revert "drm/mipi-dsi: Set the fwnode for mipi_dsi_device"
    3d9528484480e mm: shmem: fix data-race in shmem_getattr()
    2ac15e5a8f42f wifi: iwlwifi: mvm: fix 6 GHz scan construction
    f05dbebb8ee34 nilfs2: fix kernel bug due to missing clearing of checked flag
    ada431c6c31a2 x86/bugs: Use code segment selector for VERW operand
    ecd62f684386f ocfs2: pass u64 to ocfs2_truncate_inline maybe overflow
    4c4e238d3adad mm/page_alloc: let GFP_ATOMIC order-0 allocs access highatomic reserves
    85f58ee33c6c9 mm/page_alloc: explicitly define how __GFP_HIGH non-blocking allocations accesses reserves
    c1b8856c5a7dc mm/page_alloc: explicitly define what alloc flags deplete min reserves
    17dedfd6de69a mm/page_alloc: explicitly record high-order atomic allocations in alloc_flags
    9da195a2d35b7 mm/page_alloc: treat RT tasks similar to __GFP_HIGH
    92e52ff398b55 mm/page_alloc: rename ALLOC_HIGH to ALLOC_MIN_RESERVE
    ca8527f257369 mm/page_alloc: split out buddy removal code from rmqueue into separate helper
    28e7a507196fe mm/page_alloc: fix tracepoint mm_page_alloc_zone_locked()
    6036719c23a90 mm/page_alloc: call check_new_pages() while zone spinlock is not held
    0d0d55b3ee030 riscv: Remove duplicated GET_RM
    6ad44aa8e11cd riscv: Remove unused GENERATING_ASM_OFFSETS
    f6070925f4695 riscv: Use '%u' to format the output of 'cpu'
    ddb04c81d129a riscv: efi: Set NX compat flag in PE/COFF header
    1c54b0b0d72c7 riscv: vdso: Prevent the compiler from inserting calls to memset()
    69548bb663fcb nilfs2: fix potential deadlock with newly created symlinks
    7a59817f68e79 iio: light: veml6030: fix microlux value calculation
    4f588fffc307a iio: adc: ad7124: fix division by zero in ad7124_set_channel_odr()
    2f39548f45693 staging: iio: frequency: ad9832: fix division by zero in ad9832_calc_freqreg()
    8ac22fe1e2b10 wifi: iwlegacy: Clear stale interrupts before resuming device
    705be2dc45c7f wifi: ath10k: Fix memory leak in management tx
    b2bcbe5450b20 wifi: mac80211: do not pass a stopped vif to the driver in .get_txpower
    4749d336170db Revert "driver core: Fix uevent_show() vs driver detach race"
    c4f90f09713fe xhci: Use pm_runtime_get to prevent RPM on unsupported systems
    78a6caa022de4 xhci: Fix Link TRB DMA in command ring stopped completion event
    391884630fba2 usb: typec: fix unreleased fwnode_handle in typec_port_register_altmodes()
    14d1e39269a82 usb: phy: Fix API devm_usb_put_phy() can not release the phy
    f9889e5f7c7fb usbip: tools: Fix detach_port() invalid port error path
    057b5b9716664 misc: sgi-gru: Don't disable preemption in GRU driver
    9ce8e1d7ef459 NFS: remove revoked delegation from server's delegation list
    cb1711e65bff0 net: amd: mvme147: Fix probe banner message
    e1d57c29e4733 scsi: scsi_transport_fc: Allow setting rport state to current state
    60fb94ef46c23 fs/ntfs3: Additional check in ni_clear()
    47e8a17491e37 fs/ntfs3: Fix possible deadlock in mi_read
    759016b1f0335 fs/ntfs3: Fix warning possible deadlock in ntfs_set_state
    e5ae785900868 fs/ntfs3: Check if more than chunk-size bytes are written
    c46d6b0258800 ACPI: CPPC: Make rmw_lock a raw_spin_lock
    564caf173b867 firmware: arm_sdei: Fix the input parameter of cpuhp_remove_state()
    b1d2de8a669fa netfilter: nft_payload: sanitize offset and length before calling skb_checksum()
    9f605135a5c0f net: skip offload for NETIF_F_IPV6_CSUM if ipv6 header contains extension
    ba22ea0134838 netfilter: Fix use-after-free in get_info()
    86c8ebe02d880 bpf: Fix out-of-bounds write in trie_get_next_key()
    c2150f666c6fc netdevsim: Add trailing zero to terminate the string in nsim_nexthop_bucket_activity_write()
    05df1b1dff8f1 net/sched: stop qdisc_tree_reduce_backlog on TC_H_ROOT
    86833e4e6131d gtp: allow -1 to be specified as file description from userspace
    5edcb3fdb12c3 ipv4: ip_tunnel: Fix suspicious RCU usage warning in ip_tunnel_init_flow()
    ece593fc9c007 net: stmmac: TSO: Fix unbalanced DMA map/unmap for non-paged SKB data
    720be854fb6ef ASoC: cs42l51: Fix some error handling paths in cs42l51_probe()
    3f45d590ccbae wifi: iwlwifi: mvm: Fix response handling in iwl_mvm_send_recovery_cmd()
    daa426f19aad7 wifi: iwlwifi: mvm: disconnect station vifs if recovery failed
    120d8ce610734 mac80211: Add support to trigger sta disconnect on hardware restart
    41c8acb337927 mac80211: do drv_reconfig_complete() before restarting all
    730dc0818fb88 RDMA/bnxt_re: synchronize the qp-handle table array
    adf37466c3837 RDMA/mlx5: Round max_rd_atomic/max_dest_rd_atomic up instead of down
    15d3b1735ea42 RDMA/cxgb4: Dump vendor specific QP details
    1c3beef555271 wifi: brcm80211: BRCM_TRACING should depend on TRACING
    e97b59cda228f wifi: mac80211: skip non-uploaded keys in ieee80211_iter_keys
    52f47de448205 mac80211: MAC80211_MESSAGE_TRACING should depend on TRACING
    a69d18e8029d7 cgroup: Fix potential overflow issue when checking max_depth
    8df5292953083 ACPI: PRM: Find EFI_MEMORY_RUNTIME block for PRM handler and context
    6ef99e50be2fe ACPI: PRM: Change handler_addr type to void pointer
    0a1b0b04aecd6 ACPI: PRM: Remove unnecessary blank lines
    0f62358ce85b2 ksmbd: fix user-after-free from session log off
    7bed977305af8 selftests/mm: fix incorrect buffer->mirror size in hmm2 double_map test
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
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 77d4da1177..2638f15279 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "09550c3a9a6b51fe9dd73e9b90e9d85959f1fb91"
-SRCREV_meta ?= "39edeb3fefcf8e3b5c20240e92bfd5167c9da7aa"
+SRCREV_machine ?= "98041125dd21bf5eca755b97ecd285d6ade81570"
+SRCREV_meta ?= "165341e88c9b35945d8b392825aa317ba33bfb57"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.170"
+LINUX_VERSION ?= "5.15.171"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 9f51a99034..d7e3c46073 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.170"
+LINUX_VERSION ?= "5.15.171"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "5d9057298bcdc677c2d2a46a88663fb335322944"
-SRCREV_meta ?= "39edeb3fefcf8e3b5c20240e92bfd5167c9da7aa"
+SRCREV_machine ?= "0d8a5525fe6e85f1158929bb79b7ce071056206c"
+SRCREV_meta ?= "165341e88c9b35945d8b392825aa317ba33bfb57"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 9657690710..82a83ca2c2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "6d182fb48883e5f487a1b1a9d918cfe329c72bd6"
-SRCREV_machine:qemuarm64 ?= "ecf807800df1e4838974f3d63b16ef31b32e839f"
-SRCREV_machine:qemumips ?= "058d1c05bb16832886391922e078657d433a87e7"
-SRCREV_machine:qemuppc ?= "4cbe8a9197f047838e67af6b6b6b8f339b5883c2"
-SRCREV_machine:qemuriscv64 ?= "66794a3919629bf7e842cf506aca8a6be34b31e2"
-SRCREV_machine:qemuriscv32 ?= "66794a3919629bf7e842cf506aca8a6be34b31e2"
-SRCREV_machine:qemux86 ?= "66794a3919629bf7e842cf506aca8a6be34b31e2"
-SRCREV_machine:qemux86-64 ?= "66794a3919629bf7e842cf506aca8a6be34b31e2"
-SRCREV_machine:qemumips64 ?= "e17660fecfd0ada315d045f4478ba455f8f3f627"
-SRCREV_machine ?= "66794a3919629bf7e842cf506aca8a6be34b31e2"
-SRCREV_meta ?= "39edeb3fefcf8e3b5c20240e92bfd5167c9da7aa"
+SRCREV_machine:qemuarm ?= "d19efb158e281347f46478971d8d43a821326205"
+SRCREV_machine:qemuarm64 ?= "4feb3e5fa76487c2eed871931fd27cd63348dd45"
+SRCREV_machine:qemumips ?= "61edb2ce1098c9efd69607801e783569952f86e9"
+SRCREV_machine:qemuppc ?= "7adca69e582fde94bec62ddfe6711fac80488892"
+SRCREV_machine:qemuriscv64 ?= "6190c0086a4a6def5c3cbc6958348cbdd9370b7d"
+SRCREV_machine:qemuriscv32 ?= "6190c0086a4a6def5c3cbc6958348cbdd9370b7d"
+SRCREV_machine:qemux86 ?= "6190c0086a4a6def5c3cbc6958348cbdd9370b7d"
+SRCREV_machine:qemux86-64 ?= "6190c0086a4a6def5c3cbc6958348cbdd9370b7d"
+SRCREV_machine:qemumips64 ?= "5370d58e55c5229e60ff358d88139bf9e67507fb"
+SRCREV_machine ?= "6190c0086a4a6def5c3cbc6958348cbdd9370b7d"
+SRCREV_meta ?= "165341e88c9b35945d8b392825aa317ba33bfb57"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "72244eab0dad81e1553d4f5e105ffadc412885cb"
+SRCREV_machine:class-devupstream ?= "3c17fc4839052076b9f27f22551d0d0bd8557822"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.170"
+LINUX_VERSION ?= "5.15.171"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.39.2


