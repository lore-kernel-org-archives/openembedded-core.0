Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D050C5B55A
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 15:40:17 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.9119.1748619614909112604
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 08:40:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=si0k2U1q;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-231e8553248so22162335ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 08:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748619614; x=1749224414; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QaLUPKqMZT0A4mi+G9yF054FfqFzt0hGo7jqOpJ7jyQ=;
        b=si0k2U1q9JlP1GuyhG3zCO8bUWZ8NRM1ALadDM/hIxYUkZWyIwVyoYzVNskAWnVO7h
         rf5LYTvHy9r/hNGCRS5ekhr4Nq9EgywDbXBduNMEQyKZ78kwG2dBGxHE+JnaW10o4+fb
         +jkqU2cfNBz58E/1A3TvXuvC3wUF5L2LnCOxIYHMvVxTTowNyjkychOQOTdvwfWZjVPu
         9HzZIu02xmdOsVXZaXnTn/g0g+9bY98Lr8Y17G38trNg6WjVMGgcClU5SxMBryOGLvCX
         1FTgEAFcpPYt1xG6tbR1QEl08KGXrBmUEv8444inhpCgBaCLq2ZDbW0AVn0Ba37yhFbz
         Oy2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748619614; x=1749224414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QaLUPKqMZT0A4mi+G9yF054FfqFzt0hGo7jqOpJ7jyQ=;
        b=anStaAchJiQ5Y0zomIh4GZuyNlMn/HJ7JtXurpNBAGatWLyRCNkNv0fBLQDAxgrpN3
         ZivxRg0gfvocGraXInkicYSqXdRwqNw/wNqkLZ4aysvsDkghigUxE5j5uqqlZNbf6jDX
         KF8PTvsAzuhC3uBxSGtXlkT1wRhON7ywzemJtqhvU/uV1DXwpPM4SPz+mY0L7J1fhvAb
         QRFg51z1kZxMqzOfvQHIDgUCN9gSxDCBUzypQ7K6DEipdzy5/4HG0gyMxgHLMrCydNZM
         262+UBUTNzYTKbzrS2YS491zZuajSYnMs+J4zM6jsZRrvVGlGPz4iR4O2LNDmFFdFa6k
         xC9g==
X-Gm-Message-State: AOJu0YzewqYkN0EU4Q6Sde0R0kt5iSfYhRvGeH0xxigKrNAgP/jviaRq
	UOvGBiM/PlkeMQ0ZpZ1crrIlmKmEvylIBLibFN2eUrMLHPt3T7sq2dY89tnn0xXAuVyoOvHNp3i
	pYODi
X-Gm-Gg: ASbGncun+KijPB4WdvKtXC5sYNSMnaGJmzIRkMdj2T0BXQ82X6082ruf1Aussnp2qPs
	HqIy++QbKxl04L8WzNa2eHp+z1XyqoW/d25TqvZ/0yOcS9tc/WlbrSiOoEl4pEroxByd89O7ExZ
	KzeE9x620WoWjsc4+5irPZHcb+eOovzVaAUXnNTSjZ6VPEZv6b7HjQCjXMHNcSVqtSMUicgukW0
	NQ8VnQZ6wlgi4GKbPoJRTztxegFSswcCQPdzbVKeT33Q7yEXvxkhmAOIoL0ZAKi5+zx41d1SPZL
	RYhVlP1eEPfwqhh4R3BfdpRS9WgH307m8UxBlwJnlmI=
X-Google-Smtp-Source: AGHT+IG9Q5yu2p47t88V8wEyneZxaZuK4Byy8jnK8osU1yRsO4gpxmVl2yB/xAgTcDjh0JTruKZaEQ==
X-Received: by 2002:a17:903:b07:b0:225:adf8:8634 with SMTP id d9443c01a7336-2353981e45cmr33432335ad.51.1748619613799;
        Fri, 30 May 2025 08:40:13 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c9d8:e2d0:bfbc:3a26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf9116sm29903075ad.200.2025.05.30.08.40.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 08:40:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/10] linux-yocto/5.15: update to v5.15.182
Date: Fri, 30 May 2025 08:39:49 -0700
Message-ID: <514e700790ed3af0894ad114432aa44090ddb306.1748619488.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748619488.git.steve@sakoman.com>
References: <cover.1748619488.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 15:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217516

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    3b8db0e4f263 Linux 5.15.182
    4226622647e3 scsi: target: Fix WRITE_SAME No Data Buffer crash
    aaa763ab8cec dm: fix copying after src array boundaries
    655e607898f8 iommu/arm-smmu-v3: Fix iommu_device_probe bug due to duplicated stream ids
    6077d3a53d99 iommu/arm-smmu-v3: Use the new rb tree helpers
    f95659affee3 irqchip/gic-v2m: Prevent use after free of gicv2m_get_fwnode()
    073b77f8619f irqchip/gic-v2m: Mark a few functions __init
    5883bcce0ca5 irqchip/gic-v2m: Add const to of_device_id
    cdde591d23f4 Revert "drm/meson: vclk: fix calculation of 59.94 fractional rates"
    853e14cf36f6 net: phy: microchip: force IRQ polling mode for lan88xx
    d7084c39aed6 ARM: dts: opos6ul: add ksz8081 phy properties
    91ff1e9652fb firmware: arm_scmi: Balance device refcount when destroying devices
    d9f609cb50eb net: hns3: fix deadlock issue when externel_lb and reset are executed together
    c7f24b7d9454 of: module: add buffer overflow check in of_modalias()
    cc826a9e1e4e PCI: imx6: Skip controller_id generation logic for i.MX7D
    21491989477a net: hns3: defer calling ptp_clock_register()
    19a68aa1b993 net: hns3: fixed debugfs tm_qset size
    a059cef34d73 net: hns3: fix an interrupt residual problem
    85fc1d802edf net: hns3: add support for external loopback test
    796f64db86d1 net: hns3: store rx VLAN tag offload state for VF
    6bed80284c17 net: fec: ERR007885 Workaround for conventional TX
    df993daa4c96 net: lan743x: Fix memleak issue when GSO enabled
    f21fb533fc3e nvme-tcp: fix premature queue removal and I/O failover
    dd008c029fdb bnxt_en: Fix ethtool -d byte order for 32-bit values
    69b10dd23ab8 bnxt_en: Fix out-of-bound memcpy() during ethtool -w
    f4f30f64f7ae bnxt_en: Fix coredump logic to free allocated buffer
    15cb7eab09fe net: ipv6: fix UDPv6 GSO segmentation with NAT
    6b732322eb65 net: dlink: Correct endianness handling of led_mode
    a32dcc3b8293 ice: Check VF VSI Pointer Value in ice_vc_add_fdir_fltr()
    e06e4cdfb65e ice: Refactor promiscuous functions
    0bf32d6fb1fc net_sched: qfq: Fix double list add in class with netem as child qdisc
    554acc5a2ea9 net_sched: ets: Fix double list add in class with netem as child qdisc
    e3e949a39a91 net_sched: hfsc: Fix a UAF vulnerability in class with netem as child qdisc
    2968632880f1 net_sched: drr: Fix double list add in class with netem as child qdisc
    6884fc89d3fc net: ethernet: mtk-star-emac: rearm interrupts in rx_poll only when advised
    bedd287fdd31 net: ethernet: mtk-star-emac: fix spinlock recursion issues on rx/tx poll
    97da99868573 net: ethernet: mtk-star-emac: separate tx/rx handling with two NAPIs
    688fff006fd1 net/mlx5: E-switch, Fix error handling for enabling roce
    225ee358a4ed net/mlx5: E-Switch, Initialize MAC Address for Default GID
    9d3ef89b6a5e net/sched: act_mirred: don't override retval if we already lost the skb
    9efb2b99b96c KVM: x86: Load DR6 with guest value only before entering .vcpu_run() loop
    1a3f9482b50b tracing: Fix oob write in trace_seq_to_buffer()
    8ba0bfe23917 iommu/vt-d: Apply quirk_iommu_igfx for 8086:0044 (QM57/QS57)
    466d9da26707 iommu/amd: Fix potential buffer overflow in parse_ivrs_acpihid
    4df67fb22782 dm: always update the array size in realloc_argv on success
    526530ec0058 dm-integrity: fix a warning on invalid table line
    508be7c00143 wifi: brcm80211: fmac: Add error handling for brcmf_usb_dl_writeimage()
    113304ce7e8a mmc: renesas_sdhi: Fix error handling in renesas_sdhi_probe
    d5a69c78c9cc amd-xgbe: Fix to ensure dependent features are toggled with RX checksum offload
    ec4584495868 parisc: Fix double SIGFPE crash
    6266b3509b2c arm64: errata: Add missing sentinels to Spectre-BHB MIDR arrays
    f0d2cca416c6 i2c: imx-lpi2c: Fix clock count when probe defers
    b98f280fa8c1 EDAC/altera: Set DDR and SDMMC interrupt mask before registration
    72d3974ed3a8 EDAC/altera: Test the correct error reg offset
    2ec0f5f6d476 drm/nouveau: Fix WARN_ON in nouveau_fence_context_kill()
    169346d866dc ALSA: usb-audio: Add second USB ID for Jabra Evolve 65 headset
    e0bb89c44b56 efi: libstub: Use '-std=gnu11' to fix build with GCC 15
    b5d500042eb3 usb: hcd-pci: remove the action of faking interrupt request
    6f0605db50e2 clk: imx: Add check for kcalloc
    5b837b9e1543 bpf: Fix the indention issue in grow_stack_state()
    42b62697634d cifs: Fix the calling of smb_version_operations::calc_smb_size()
    b14acf729e9d f2fs: Add inline to f2fs_build_fault_attr() stub
    7c317bec311f f2fs: check validation of fault attrs in f2fs_build_fault_attr()
    81c12119c23f bpf: Fix accesses to uninit stack slots [ Upstream commit 6b4a64bafd107e521c01eec3453ce94a3fb38529 ]
    c4fa05422d87 smb: client: fix potential OOB in smb2_dump_detail()
    299ef3b5b00b of: module: add buffer overflow check in of_modalias()
    b8086c3c1548 reiserfs: Avoid touching renamed directory if parent does not change
    ea091017ef62 ipv6: Fix data races around sk->sk_prot.
    ff8710da80ee ipv6: annotate some data-races around sk->sk_prot
    e8c2eafaaa6a tcp: Fix data races around icsk->icsk_af_ops.
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
index 72fc373076..3540532778 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "197338cf0c529a8339a1581adbc41c2ec39933ee"
-SRCREV_meta ?= "8e07fa90bc6101cd74644750736b6f11757a86de"
+SRCREV_machine ?= "41c409eba78e4b53ae17bbd3602688c11eef1c34"
+SRCREV_meta ?= "e35f92afa76b032c12072d713ff896bdf76aa4e3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.181"
+LINUX_VERSION ?= "5.15.182"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 87cc829fb1..38b72b9ad5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.181"
+LINUX_VERSION ?= "5.15.182"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "9a5f94119c1261a8b3c4a2dc4b0e022aa31f19d6"
-SRCREV_meta ?= "8e07fa90bc6101cd74644750736b6f11757a86de"
+SRCREV_machine ?= "1f968437457e94812b1bf1e332c02c0a77ec33e7"
+SRCREV_meta ?= "e35f92afa76b032c12072d713ff896bdf76aa4e3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 3516cac0e8..fe589c55dc 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "bff9ba7e5b7913bb615db6628bd4d1d6069999b4"
-SRCREV_machine:qemuarm64 ?= "b5bd9477269e51548f417cb0e8a6d22b00e6786b"
-SRCREV_machine:qemumips ?= "cac20a82ab762a5136a17850e9b321cefdf8ec79"
-SRCREV_machine:qemuppc ?= "6fe3f5ceaff581ffde7e58ee6c1fb8ba0baa8aa4"
-SRCREV_machine:qemuriscv64 ?= "7145abd8c342695f3fd6b99bcd364e11e2304217"
-SRCREV_machine:qemuriscv32 ?= "7145abd8c342695f3fd6b99bcd364e11e2304217"
-SRCREV_machine:qemux86 ?= "7145abd8c342695f3fd6b99bcd364e11e2304217"
-SRCREV_machine:qemux86-64 ?= "7145abd8c342695f3fd6b99bcd364e11e2304217"
-SRCREV_machine:qemumips64 ?= "3091890c569f6b2cd55bb61a62c23a1dc91e2719"
-SRCREV_machine ?= "7145abd8c342695f3fd6b99bcd364e11e2304217"
-SRCREV_meta ?= "8e07fa90bc6101cd74644750736b6f11757a86de"
+SRCREV_machine:qemuarm ?= "077f4829c74ea0143a12299916f43c16b8284591"
+SRCREV_machine:qemuarm64 ?= "f29c388da58919d6b5af0384b699c09f98192a42"
+SRCREV_machine:qemumips ?= "c342ae577dcc4b2e9489a9c404217115c7600b42"
+SRCREV_machine:qemuppc ?= "9d26bf5ee4a6e1d619744ce8213da544c48a4bce"
+SRCREV_machine:qemuriscv64 ?= "07e13eee3e4714e558a608a39283c49f18b9354c"
+SRCREV_machine:qemuriscv32 ?= "07e13eee3e4714e558a608a39283c49f18b9354c"
+SRCREV_machine:qemux86 ?= "07e13eee3e4714e558a608a39283c49f18b9354c"
+SRCREV_machine:qemux86-64 ?= "07e13eee3e4714e558a608a39283c49f18b9354c"
+SRCREV_machine:qemumips64 ?= "7ef8e6f4d75e39d5bed82b6e207a36e256356406"
+SRCREV_machine ?= "07e13eee3e4714e558a608a39283c49f18b9354c"
+SRCREV_meta ?= "e35f92afa76b032c12072d713ff896bdf76aa4e3"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "16fdf2c7111bd6927f16c3e811f5086fecebbf00"
+SRCREV_machine:class-devupstream ?= "3b8db0e4f2631c030ab86f78d199ec0b198578f3"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.181"
+LINUX_VERSION ?= "5.15.182"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.43.0


