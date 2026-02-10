Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56771E9463A
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 03:14:41 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12093.1770693277938356204
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 19:14:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FSZb2EA4;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8c5389c3cd2so43376585a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 19:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770693276; x=1771298076; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9RZqghGVe69Plt/yie6GVJinkSSBL72S+395vyo7RdU=;
        b=FSZb2EA4lZP5jtU5PzcNLdO2GGPiM2TvO8zwFH7Ow6pW2I7qrp5vzsPz8H0+bqWs2w
         nkDKRK8ulkBeAOfh+IpkvR8TiGA1o13IQFSMgB2xSWhqeGVhrohHUKSnl0qsJjnK2dNH
         sItxYqyALrpnD4TXMfYRV1IMIttQ3VVXdOVB0vaCgJf6J+PBlq8FxSz7lS+5TP2UiUYD
         Cm/9mYsLNbMYT/nA8Km0yp0NPE1ASfeV4z9BFlWvARRcJEKcCZeNA0mhe32Cl45flF5p
         vIEetRkZASpL+fpaffeOExHUoBHAxKWoRiP0IucjcKSWvevuFdXm9r6vsbdJ5p10uHWr
         874A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770693276; x=1771298076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9RZqghGVe69Plt/yie6GVJinkSSBL72S+395vyo7RdU=;
        b=tOsBdyC+MI+ELuWTSpFVtK2El/S0gAm9m9Lo4KT8zqsLHx8i3hZ9wqoNpDE9kpMB83
         guYckYjaNeCyAifd56EZ+dd5zyY+Lnk1kkj0DSBxqXfanplEn0IxNDPT/LpdSFTvxkKP
         zwwBuXV8G+Lv9/dn+hVwly0FoCr1AY/e5QryydZW2kcne95B0ZoXWRnUwIWMwm5Q7dFp
         kinJnZUhIcIbGqubYmb0NA4aV5TRLOSKfQsGhPfJ5fXLb0ONnlyyLbrlBV/gDFQNEH62
         qI687cNNtxdpmElEwQkiYW0PB6E1ClekGxbLGVAzzSMgEgUPPcrf+0faeS/7Mt+uMlLd
         aC6g==
X-Gm-Message-State: AOJu0YxydG6eWgj8+glRWahSxf8Hf/qRC5rfDc2PQ3Vjx+1POCb8HgLy
	ebzCu+o479y6iibxtcETE7TydIJEoGiZ77+7Xly0cDv6MNNDScoiCpqU5NrUx97y
X-Gm-Gg: AZuq6aLQrkYheIzf/J36HSzZF8PvW0QpBu2zOPdch0yg9SieZk0mZTaDk/6g0oqsCrL
	Yzlul2VR9y5oULV88LJHRMJW7R27ymXRgQCxPrEgVKnhC+mvWlvVVsJ9/OGaiicDxovtd1CWW5Z
	utz+csxbLHOPd0MOvdmiNLyNmvyhfh/aVDf2YPJs1bSuTcqo2nWNSf/5bWox2PO+ZGjh322nA4m
	geV8HWhlMPOK7pNr23uWTv4NzB4+P2O2mCEWBZfhEoYtsUSr4IACGZruYdkUcl/ifjSjvM6dkTX
	AfdrqoKG9FVl7vLwk0OAzl59H9UbHdXEbdSksfYD92wmMc/ySZ4Sy6FcHGZo0yPrTde1kDhDnMV
	Z/qaf2Cbx+tc/wSMFTBVEiKL46UfF/WYQj1XZozytKOFyw1Q5CfHVKLJwf2hEMh7UM3d7vGSdoK
	vuhVHTm8vd3FAqBlB3m6owHX8iX7RtID7FiA70UXMwHAo27T76+MOKh2XU8/AndE0sZyCAFb6fG
	qtIcFUWrp2nfmCzFoRB5T1LEfUO5CdWNwhrH30qBmG18XslUSlsGqZT7pw=
X-Received: by 2002:a05:620a:290d:b0:8ca:2cf9:8198 with SMTP id af79cd13be357-8caefeb6045mr1627240385a.40.1770693275523;
        Mon, 09 Feb 2026 19:14:35 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9a157f8sm955632785a.30.2026.02.09.19.14.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 19:14:33 -0800 (PST)
From: bruce.ashfield@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [meta][scarthgap][PATCH 06/07] linux-yocto/6.6: update to v6.6.120
Date: Mon,  9 Feb 2026 22:14:23 -0500
Message-ID: <20260210031424.1346685-6-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210031424.1346685-1-bruce.ashfield@gmail.com>
References: <20260210031424.1346685-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 03:14:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230840

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    c596736dadab Linux 6.6.120
    0eb7d3da258b ext4: fix error message when rejecting the default hash
    52c4538a92da ext4: filesystems without casefold feature cannot be mounted with siphash
    bb4511b55fd3 Revert "iommu/amd: Skip enabling command/event buffers for kdump"
    0e8ac70521e6 firmware: arm_scmi: Fix unused notifier-block in unregister
    21e82354cdd7 tty: fix tty_port_tty_*hangup() kernel-doc
    25466e5b4bb1 blk-mq: setup queue ->tag_set before initializing hctx
    d292db57e915 pwm: stm32: Always program polarity
    b92ec4a84872 net: stmmac: make sure that ptp_rate is not 0 before configuring EST
    f6dcbd2bbea5 virtio_console: fix order of fields cols and rows
    8d8a670c1c28 mm/damon/tests/core-kunit: handle alloc failures in damon_test_update_monitoring_result()
    8bf34bd12231 mm/damon/tests/core-kunit: handle alloc failure on damon_test_set_attrs()
    c45dcf86c75e mm/damon/tests/core-kunit: handle alloc failures in damon_test_ops_registration()
    d41809aa8e24 mm/damon/tests/core-kunit: handle alloc failures in damon_test_set_regions()
    e471ed55f3d6 mm/damon/tests/core-kunit: handle alloc failures on damos_test_filter_out()
    8b6d3b7c12bd mm/damon/tests/core-kunit: handle memory alloc failure from damon_test_aggregate()
    520e8b12f0a4 mm/damon/tests/core-kunit: handle alloc failures on damon_test_split_regions_of()
    945e0575dcfc mm/damon/tests/core-kunit: handle memory failure from damon_test_target()
    3fc04a106f87 mm/damon/tests/core-kunit: handle alloc failures on damon_test_merge_two()
    7110f671d86a mm/damon/tests/core-kunit: handle alloc failures on dasmon_test_merge_regions_of()
    8feb7885b769 mm/damon/tests/core-kunit: handle alloc failures on damon_test_split_at()
    c6e1f6e91e9c mm/damon/tests/core-kunit: handle allocation failures in damon_test_regions()
    5988035dd57a mm/damon/tests/core-kunit: handle alloc failres in damon_test_new_filter()
    1c5a0de26879 mm/damon/tests/vaddr-kunit: handle alloc failures on damon_test_split_evenly_succ()
    c62c5296fdb8 RDMA/rxe: Fix the failure of ibv_query_device() and ibv_query_device_ex() tests
    32ca3557d968 RDMA/rxe: Remove the direct link to net_device
    f3652768a89c net: Allow to use SMP threads for backlog NAPI.
    03765d5c1808 net: Remove conditional threaded-NAPI wakeup based on task state.
    51445190c10a sched/fair: Proportional newidle balance
    5b7949a95c39 sched/fair: Small cleanup to update_newidle_cost()
    38d080768c85 sched/fair: Small cleanup to sched_balance_newidle()
    17d3103325e8 RDMA/core: Fix "KASAN: slab-use-after-free Read in ib_register_device" problem
    339bcd3d051c mm/damon/tests/vaddr-kunit: handle alloc failures on damon_do_test_apply_three_regions()
    b75608e7547d mm/damon/tests/vaddr-kunit: handle alloc failures in damon_test_split_evenly_fail()
    65a02ffb5223 KVM: SVM: Fix redundant updates of LBR MSR intercepts
    35c53e4eae0f KVM: nSVM: Fix and simplify LBR virtualization handling with nested
    e6ff197547a9 KVM: nSVM: Always recalculate LBR MSR intercepts in svm_update_lbrv()
    991d961055d0 KVM: SVM: Introduce svm_recalc_lbr_msr_intercepts()
    2c1ea6214827 media: mediatek: vcodec: Use spinlock for context list protection lock
    cc12debd518b media: amphion: Remove vpu_vb_is_codecconfig
    e42ccf472feb media: amphion: Make some vpu_v4l2 functions static
    93f537ffaece media: amphion: Add a frame flush mode for decoder
    37304368a2a9 KVM: nVMX: Immediately refresh APICv controls as needed on nested VM-Exit
    2f3139eaae99 powerpc/pseries/cmm: adjust BALLOON_MIGRATE when migrating pages
    47dee8b41fd7 mm/balloon_compaction: convert balloon_page_delete() to balloon_page_finalize()
    3339e058b80d mm/balloon_compaction: we cannot have isolated pages in the balloon list
    98a5af4a8eae media: verisilicon: Fix CPU stalls on G2 bus error
    5acc3c7d3c4c media: verisilicon: g2: Use common helpers to compute chroma and mv offsets
    381a387ececd media: verisilicon: Store chroma and motion vectors offset
    f7b8851c541e f2fs: fix to detect recoverable inode during dryrun of find_fsync_dnodes()
    be4c3a3c6c23 f2fs: use global inline_xattr_slab instead of per-sb slab cache
    34c817843cb3 f2fs: fix to propagate error from f2fs_enable_checkpoint()
    bcd0086ee5a2 f2fs: fix to avoid updating compression context during writeback
    b54cdce20f86 f2fs: drop inode from the donation list when the last file is closed
    1a00afcdaefc f2fs: keep POSIX_FADV_NOREUSE ranges
    64ed96a21f0f f2fs: remove unused GC_FAILURE_PIN
    ec3656a8cb42 genirq/irq_sim: Initialize work context pointers properly
    72295ae05d13 mm: fix arithmetic for max_prop_frac when setting max_ratio
    bcf2450f46cd mm: fix arithmetic for bdi min_ratio
    4584486cfcca net: dsa: sja1105: fix kasan out-of-bounds warning in sja1105_table_delete_entry()
    4914c0a16654 page_pool: Fix use-after-free in page_pool_recycle_in_ring
    b86dc510308d xfrm: state: fix out-of-bounds read during lookup
    3c591353956f ext4: fix out-of-bound read in ext4_xattr_inode_dec_ref_all()
    36acfec981d8 ext4: introduce ITAIL helper
    48098bb42a9f powerpc/64s/radix/kfence: map __kfence_pool at page granularity
    668350eba983 LoongArch: Refactor register restoration in ftrace_common_return
    6940c1d0c84a drm/amd/display: Fix null pointer deref in dcn20_resource.c
    d767ce15045d net: Remove RTNL dance for SIOCBRADDIF and SIOCBRDELIF.
    dbf427663ce2 usb: xhci: Apply the link chain quirk on NEC isoc endpoints
    bbda96e97a00 usb: xhci: move link chain bit quirk checks into one helper function.
    bf4127db6cb7 xhci: dbgtty: fix device unregister: fixup
    dff9dd015331 tty: introduce and use tty_port_tty_vhangup() helper
    21e52dc77629 drm/tilcdc: Fix removal actions in case of failed probe
    5bc791132f62 drm/tilcdc: request and mapp iomem with devres
    205aa0c83cd4 drm/mediatek: Fix probe resource leaks
    fef6d1474ab3 drm/mediatek: Fix probe memory leak
    11dba925f5fe drm/amdgpu: Forward VMID reservation errors
    5c7c7135468f mptcp: ensure context reset on disconnect()
    a902343f1331 net: phy: mediatek: fix nvmem cell reference leak in mt798x_phy_calibration
    b2e7973d83a8 pmdomain: imx: Fix reference count leak in imx_gpc_probe()
    4544cfa16834 pmdomain: Use device_get_match_data()
    d7ba1b448f2a mm: consider non-anon swap cache folios in folio_expected_ref_count()
    7e0fcf9d71c2 mm: simplify folio_expected_ref_count()
    6e5bff40bb38 wifi: mac80211: Discard Beacon frames to non-broadcast address
    46b9fd1433d2 lockd: fix vfs_test_lock() calls
    c9bf31522828 mptcp: fallback earlier on simult connection
    38a053796019 PCI: brcmstb: Fix disabling L0s capability
    cf74785c00b8 fuse: fix readahead reclaim deadlock
    7ba826aae1d4 svcrdma: bound check rq_pages index in inline path
    8ca34c5cedec ARM: dts: microchip: sama7g5: fix uart fifo size to 32
    2ce95f8656b6 gpiolib: acpi: Add quirk for Dell Precision 7780
    2e14206551bc NFSD: Clear SECLABEL in the suppattr_exclcreat bitmap
    8bd6dff8b801 f2fs: fix to avoid potential deadlock
    c375c4b3997e f2fs: use f2fs_err_ratelimited() to avoid redundant logs
    5ceea587c4e2 mptcp: pm: ignore unknown endpoint flags
    d1d03d9184a6 scsi: ufs: core: Add ufshcd_update_evt_hist() for UFS suspend error
    b0d2a7ccd17c usb: ohci-nxp: fix device leak on probe failure
    2a16f46eef6d usb: ohci-nxp: Use helper function devm_clk_get_enabled()
    c08838ce6b50 mm/ksm: fix exec/fork inheritance support for prctl
    93e4a783d34c wifi: mt76: Fix DTS power-limits on little endian systems
    bb2805532f76 btrfs: don't rewrite ret from inode_permission
    0baa9f64bf79 gfs2: fix freeze error handling
    35521feb614d jbd2: fix the inconsistency between checksum and data in memory for journal sb
    902ca2356f1e ext4: fix string copying in parse_apply_sb_mount_options()
    7a35a505d76a ALSA: hda: cs35l41: Fix NULL pointer dereference in cs35l41_hda_read_acpi()
    931c86fc7989 ALSA: wavefront: Clear substream pointers on close
    4425583a691a ALSA: wavefront: Use guard() for spin locks
    02b63f3bc292 ALSA: wavefront: Fix integer overflow in sample size validation
    596b04a1638e ALSA: wavefront: Use standard print API
    eee39f83246a mptcp: Initialise rcv_mss before calling tcp_send_active_reset() in mptcp_do_fastclose().
    d88481653d74 tpm: Cap the number of PCR banks
    dbd0829d2458 blk-mq: add helper for checking if one CPU is mapped to specified hctx
    9202337a2d90 usb: gadget: lpc32xx_udc: fix clock imbalance in error path
    23525fc0ea62 drm/nouveau/dispnv50: Don't call drm_atomic_get_crtc_state() in prepare_fb
    0336188cc85d drm/i915/gem: Zero-initialize the eb.vma array in i915_gem_do_execbuffer
    678d1c86566d drm/msm/dpu: Add missing NULL pointer check for pingpong interface
    56f07bc0a0ff drm/mgag200: Fix big-endian support
    3d004f7341d4 drm/ttm: Avoid NULL pointer deref for evicted BOs
    3144af03d517 drm/mediatek: Fix device node reference leak in mtk_dp_dt_parse()
    ed51ddd5d449 drm/gma500: Remove unused helper psb_fbdev_fb_setcolreg()
    f6916363112c drm/msm/a6xx: Fix out of bound IO access in a6xx_get_gmu_registers
    e05d53454b55 drm/amdgpu: add missing lock to amdgpu_ttm_access_memory_sdma
    9a8837f9a3e3 net: macb: Relocate mog_init_rings() callback from macb_mac_link_up() to macb_open()
    6b93c8ab6f6c net: nfc: fix deadlock between nfc_unregister_device and rfkill_fop_write
    907e8a8f506d net: usb: sr9700: fix incorrect command used to write single register
    cff353b7d1c7 nfsd: Drop the client reference in client_states_open()
    fd43edf357a3 LoongArch: BPF: Sign extend kfunc call arguments
    446c851e338b LoongArch: BPF: Zero-extend bpf_tail_call() index
    ad6ea65f154b fjes: Add missing iounmap in fjes_hw_init()
    2c4c0c09f964 e1000: fix OOB in e1000_tbi_should_accept()
    c0acdee51323 RDMA/cm: Fix leaking the multicast GID table reference
    9d85524789c2 RDMA/core: Check for the presence of LS_NLA_TYPE_DGID correctly
    a94bd2d93f7e samples/ftrace: Adjust LoongArch register restore order in direct calls
    b8f12a3ecf03 tools/mm/page_owner_sort: fix timestamp comparison for stable sorting
    45b44c3a5e62 x86/microcode/AMD: Fix Entrysign revision check for Zen5/Strix Halo
    3e3c0dc025f0 idr: fix idr_alloc() returning an ID out of range
    c9acbaec693b kasan: refactor pcpu kasan vmalloc unpoison
    e53bfe453059 compiler_types.h: add "auto" as a macro for "__auto_type"
    b9b5f45cc1b7 LoongArch: Use unsigned long for _end and _text
    f0b9e0bdc8bc LoongArch: Use __pmd()/__pte() for swap entry conversions
    582c1dcc5bb5 LoongArch: Fix build errors for CONFIG_RANDSTRUCT
    155d6a8f5d5f LoongArch: Correct the calculation logic of thread_count
    4632c8b0966d LoongArch: Add new PCI ID for pci_fixup_vgadev()
    80617b75fd70 media: mediatek: vcodec: Fix a reference leak in mtk_vcodec_fw_vpu_init()
    53e256b5c360 media: i2c: adv7842: Remove redundant cancel_delayed_work in probe
    a8e6cf7fa2be media: i2c: ADV7604: Remove redundant cancel_delayed_work in probe
    4b139f88c2ab media: amphion: Cancel message work before releasing the VPU core
    52604951b90c media: vpif_display: fix section mismatch
    08c6c6f2a570 media: vpif_capture: fix section mismatch
    1ad7c8174109 media: videobuf2: Fix device reference leak in vb2_dc_alloc error path
    99293be855c3 media: verisilicon: Protect G2 HEVC decoder against invalid DPB index
    b93abb4385b8 media: TDA1997x: Remove redundant cancel_delayed_work in probe
    1b5602078557 media: samsung: exynos4-is: fix potential ABBA deadlock on init
    4d8da22db935 media: renesas: rcar_drif: fix device node reference leak in rcar_drif_bond_enabled
    3a294b90cd1a media: msp3400: Avoid possible out-of-bounds array accesses in msp3400c_thread()
    4972ad7eec91 media: cec: Fix debugfs leak on bus_register() failure
    6b5dd195993b fbdev: tcx.c fix mem_map to correct smem_start offset
    cce58e4cc535 fbdev: pxafb: Fix multiple clamped values in pxafb_adjust_timing
    243b674b2b52 fbdev: gbefb: fix to use physical address instead of dma address
    2b0b703a3483 dm-bufio: align write boundary on physical block size
    34f6abd6e4c4 dm-ebs: Mark full buffer dirty even on partial write
    4654800c51be firmware: stratix10-svc: Add mutex in stratix10 memory management
    a73881ae085d media: adv7842: Avoid possible out-of-bounds array accesses in adv7842_cp_log_status()
    318d470f64ba powerpc/pseries/cmm: call balloon_devinfo_init() also without CONFIG_BALLOON_COMPACTION
    40feb7bcde49 parisc: entry: set W bit for !compat tasks in syscall_restore_rfi()
    d3842cbf13b7 parisc: entry.S: fix space adjustment on interruption for 64-bit userspace
    13cf5cd4d535 media: rc: st_rc: Fix reset control resource leak
    52bae1ff6805 mfd: max77620: Fix potential IRQ chip conflict when probing two devices
    1b630d8f2c27 mfd: altera-sysmgr: Fix device leak on sysmgr regmap lookup
    fbf57f5e453d clk: samsung: exynos-clkout: Assign .num before accessing .hws
    ae80fb3d4e8c leds: leds-lp50xx: Enable chip before any communication
    cc468490d143 leds: leds-lp50xx: LP5009 supports 3 modules for a total of 9 LEDs
    a406e6c74bd9 leds: leds-lp50xx: Allow LED 0 to be added to module bank
    b13a3dbfa196 powerpc/64s/slb: Fix SLB multihit issue during SLB preload
    db9c8e8d3cd6 powerpc, mm: Fix mprotect on book3s 32-bit
    14b08c85cb88 arm64: dts: ti: k3-j721e-sk: Fix pinmux for pin Y1 used by power regulator
    a1d55aa866db PCI/PM: Reinstate clearing state_saved in legacy and !PM codepaths
    9024cb893f17 HID: logitech-dj: Remove duplicate error logging
    240cd7f2812c iommu: disable SVA when CONFIG_X86 is set
    3627e0e773f1 iommu/tegra: fix device leak on probe_device()
    0314de9c844d iommu/sun50i: fix device leak on of_xlate()
    7b1df346f6c5 iommu/qcom: fix device leak on of_xlate()
    21a0e8bdee72 iommu/omap: fix device leaks on probe_device()
    173ff5fc9a15 iommu/mediatek: fix device leak on of_xlate()
    83f3010de73c iommu/mediatek-v1: fix device leaks on probe()
    e7bcedf59b28 iommu/mediatek-v1: fix device leak on probe_device()
    83a8e18f30a6 iommu/ipmmu-vmsa: fix device leak on of_xlate()
    e83739232b9f iommu/exynos: fix device leak on of_xlate()
    aa749c2daf02 iommu/apple-dart: fix device leak on of_xlate()
    b3e9fa847b2d iommu/amd: Fix pci_segment memleak in alloc_pci_segment()
    17ec295d3981 ASoC: qcom: qdsp6: q6asm-dai: set 10 ms period and buffer alignment.
    c4a8098b2985 ASoC: qcom: q6adm: the the copp device only during last instance
    54b1b731d235 ASoC: qcom: q6asm-dai: perform correct state check before closing
    ed120b75aef2 ASoC: qcom: q6apm-dai: set flags to reflect correct operation of appl_ptr
    4054a3597d04 ASoC: stm32: sai: fix OF node leak on probe
    8a6826a43d8d ASoC: stm32: sai: fix clk prepare imbalance on probe failure
    637d027bb75c ASoC: stm32: sai: fix device leak on probe
    49c2ef075dbe ntfs: Do not overwrite uptodate pages
    6c32d5bb9f8f selftests/ftrace: traceonoff_triggers: strip off names
    21077a775094 blk-mq: skip CPU offline notify on unmapped hctx
    0fbd2d4a1e2c blk-mq: don't schedule block kworker on isolated CPUs
    1d0026c1e4bc RDMA/bnxt_re: fix dma_free_coherent() pointer
    0ca967c599fd RDMA/rtrs: Fix clt_path::max_pages_per_mr calculation
    5012b4c81223 ksmbd: Fix memory leak in get_file_all_info()
    77645e82b739 RDMA/bnxt_re: Fix to use correct page size for PDE table
    639e07bbfa17 RDMA/bnxt_re: Fix IB_SEND_IP_CSUM handling in post_send
    689eb90b703b RDMA/bnxt_re: Fix incorrect BAR check in bnxt_qplib_map_creq_db()
    78d9259378aa RDMA/core: Fix logic error in ib_get_gids_from_rdma_hdr()
    c67499757bcf RDMA/efa: Remove possible negative shift
    fc23d05f0b3f RDMA/irdma: avoid invalid read in irdma_net_event
    9f6185a32496 net: rose: fix invalid array index in rose_kill_by_device()
    5979338c8301 ipv4: Fix reference count leak when using error routes with nexthop objects
    c53aa6a5086f ipv6: BUG() in pskb_expand_head() as part of calipso_skbuff_setattr()
    4d0ceb7677e1 net: stmmac: fix the crash issue for zero copy XDP_TX action
    b23a2e155894 octeontx2-pf: fix "UBSAN: shift-out-of-bounds error"
    cf7ae870560b platform/x86: hp-bioscfg: Fix out-of-bounds array access in ACPI package parsing
    25be7178446c net: bridge: Describe @tunnel_hash member in net_bridge_vlan_group struct
    38722e69ee64 net: usb: asix: validate PHY address before use
    0e85ce7a3755 net: dsa: b53: skip multicast entries for fdb_dump()
    328dc0b12fb8 firewire: nosy: Fix dma_free_coherent() size
    535ce34a5bdb genalloc.h: fix htmldocs warning
    ef277ae121b3 smc91x: fix broken irq-context in PREEMPT_RT
    2ac08f3dcd0c selftests: net: fix "buffer overflow detected" for tap.c
    4bd4ea3eb326 net: usb: rtl8150: fix memory leak on usb_submit_urb() failure
    e5ee9d93229b amd-xgbe: reset retries and mode on RX adapt failures
    6bfb62b6010a team: fix check for port enabled in team_queue_override_port_prio_changed()
    859bf9688bfb platform/x86: ibm_rtl: fix EBDA signature search pointer arithmetic
    ec24f3b4a831 platform/x86: msi-laptop: add missing sysfs_remove_group()
    1717357007db ip6_gre: make ip6gre_header() robust
    0fc642f011cb net: openvswitch: Avoid needlessly taking the RTNL on vport destroy
    248dadfee95a net: mdio: aspeed: add dummy read to avoid read-after-write issue
    c0ecb3e4451f Bluetooth: btusb: revert use of devm_kzalloc in btusb
    0279978adec6 crypto: seqiv - Do not use req->iv after crypto_aead_encrypt
    18de0e41d69d iavf: fix off-by-one issues in iavf_config_rss_reg()
    f38cca04a23f i40e: fix scheduling in set_rx_mode
    e27036473d39 wifi: mac80211: do not use old MBSSID elements
    8e628bebb109 wifi: cfg80211: sme: store capped length in __cfg80211_connect_result()
    34e9dd0a1281 wifi: rtw88: limit indirect IO under powered off for RTL8822CS
    5c04217d06a1 iommu/mediatek: fix use-after-free on probe deferral
    e19578444587 ARM: dts: microchip: sama5d2: fix spi flexcom fifo size to 32
    84716eb9dc31 hwmon: (w83l786ng) Convert macros to functions to avoid TOCTOU
    f94800fbc26c hwmon: (w83791d) Convert macros to functions to avoid TOCTOU
    3769c56a1f0d hwmon: (max16065) Use local variable to avoid TOCTOU
    237a3095bcd6 i2c: amd-mp2: fix reference leak in MP2 PCI device
    ad296c4e19c7 platform/x86: intel: chtwc_int33fe: don't dereference swnode args
    c6210714347f rpmsg: glink: fix rpmsg device leak
    3ccb504e8045 soc: amlogic: canvas: fix device leak on lookup
    c8ddc5f321d1 soc: qcom: ocmem: fix device leak on lookup
    98bf1dece54c tracing: Fix fixed array of synthetic event
    b3b689729cbc amba: tegra-ahb: Fix device leak on SMMU enable
    206c012bcbd1 crypto: caam - Add check for kcalloc() in test_len()
    84238876e3b3 crypto: af_alg - zero initialize memory allocated via sock_kmalloc
    d3c094e07853 selftests: openvswitch: Fix escape chars in regexp.
    4cd6081860a5 drm/amd/display: Use GFP_ATOMIC in dc_create_plane_state()
    0126560370ed io_uring/poll: correctly handle io_poll_add() return value on update
    ec5aadc4fa49 gpio: regmap: Fix memleak in error path in gpio_regmap_register()
    8c4e5a643de3 s390/ipl: Clear SBP flag when bootprog is set
    7359e1d39c78 btrfs: don't log conflicting inode if it's a dir moved in the current transaction
    d790ef0c4819 powerpc/kexec: Enable SMT before waking offline CPUs
    7452d53f2933 SUNRPC: svcauth_gss: avoid NULL deref on zero length gss_token in gss_read_proxy_verf
    21a64218450e svcrdma: return 0 on success from svc_rdma_copy_inline_range
    354834eb7867 nfsd: Mark variable __maybe_unused to avoid W=1 build break
    cd8cf2be3717 net/handshake: restore destructor on submit failure
    e0643d46759d fsnotify: do not generate ACCESS/MODIFY events on child for special files
    19d4c57ae91b r8169: fix RTL8117 Wake-on-Lan in DASH mode
    a143c3677662 PM: runtime: Do not clear needs_force_resume with enabled runtime PM
    65b1971147ec tracing: Do not register unsupported perf events
    079f1c3f5619 xfs: fix a memory leak in xfs_buf_item_init()
    97bf1f137364 KVM: nSVM: Clear exit_code_hi in VMCB when synthesizing nested VM-Exits
    d6d257ce44af KVM: nSVM: Set exit_code_hi to -1 when synthesizing SVM_EXIT_ERR (failed VMRUN)
    d44197b5281d KVM: SVM: Mark VMCB_PERM_MAP as dirty on nested VMRUN
    2d1d833b4025 KVM: nSVM: Propagate SVM_EXIT_CR0_SEL_WRITE correctly for LMSW emulation
    99c709294ac8 KVM: SVM: Mark VMCB_NPT as dirty on nested VMRUN
    aab88dcc4fb4 KVM: nSVM: Avoid incorrect injection of SVM_EXIT_CR0_SEL_WRITE
    7b54ccef865e KVM: x86: Fix VM hard lockup after prolonged inactivity with periodic HV timer
    73f77550086f KVM: x86: Explicitly set new periodic hrtimer expiration in apic_timer_fn()
    8ff24d46a4b2 KVM: x86: WARN if hrtimer callback for periodic APIC timer fires with period=0
    e927ab132b87 libceph: make decode_pool() more resilient against corrupted osdmaps
    e09fd2eb6d4c parisc: Do not reprogram affinitiy on ASP chip
    062774439d44 scs: fix a wrong parameter in __scs_magic
    393b8f9bedc7 platform/chrome: cros_ec_ishtp: Fix UAF after unbinding driver
    e30a69bf891e KVM: x86: Don't clear async #PF queue when CR0.PG is disabled (e.g. on #SMI)
    96f1b074c98c ocfs2: fix kernel BUG in ocfs2_find_victim_chain
    fb9bd6d8d314 media: vidtv: initialize local pointers upon transfer of memory ownership
    1e90812c0220 tools/testing/nvdimm: Use per-DIMM device handle
    a4c67d96f92e f2fs: fix return value of f2fs_recover_fsync_data()
    4ce9eecb7466 f2fs: fix age extent cache insertion skip on counter overflow
    3d65e27e57aa f2fs: invalidate dentry cache on failed whiteout creation
    efe3371001f5 f2fs: fix to avoid updating zero-sized extent in extent cache
    c3031cf2b61f f2fs: ensure node page reads complete before f2fs_put_super() finishes
    0260ad551b08 scsi: target: Reset t_task_cdb pointer in error case
    71074ea29886 NFSD: use correct reservation type in nfsd4_scsi_fence_client
    e354793a7ab9 scsi: aic94xx: fix use-after-free in device removal path
    e9e601b7df58 scsi: Revert "scsi: qla2xxx: Perform lockless command completion in abort path"
    6741f90220dc cpufreq: nforce2: fix reference count leak in nforce2
    dffe25224f51 cpuidle: governors: teo: Drop misguided target residency check
    ed023a179150 intel_th: Fix error handling in intel_th_output_open
    d285517429a7 char: applicom: fix NULL pointer dereference in ac_ioctl
    96e001d20405 usb: renesas_usbhs: Fix a resource leak in usbhs_pipe_malloc()
    679e15fb53f9 usb: dwc3: keep susphy enabled during exit to avoid controller faults
    fa8747590b0e usb: dwc3: of-simple: fix clock resource leak in dwc3_of_simple_probe
    75c5d9bce072 usb: phy: isp1301: fix non-OF device reference imbalance
    319f7a85b3c4 usb: phy: fsl-usb: Fix use-after-free in delayed work during device removal
    848132371006 USB: lpc32xx_udc: Fix error handling in probe
    4824123c9f87 phy: broadcom: bcm63xx-usbh: fix section mismatches
    f4cacf8827ba media: pvrusb2: Fix incorrect variable used in trace message
    4a54d8fcb093 media: dvb-usb: dtv5100: fix out-of-bounds in dtv5100_i2c_msg()
    22847606976c usb: usb-storage: Maintain minimal modifications to the bcdDevice range.
    252892d5a6a2 mptcp: avoid deadlock on fallback while reinjecting
    17b470ee53dd mptcp: schedule rtx timer only after pushing data
    fa4a445f832b media: v4l2-mem2mem: Fix outdated documentation
    94a16a3a1001 jbd2: use a weaker annotation in journal handling
    815327958ec4 jbd2: use a per-journal lock_class_key for jbd2_trans_commit_key
    79a0e4d3fbef ext4: align max orphan file size with e2fsprogs limit
    dc06c9dc5e1d ext4: fix incorrect group number assertion in mb_check_buddy
    36bf0f765333 ext4: clear i_state_flags when alloc inode
    b5d942922182 ext4: xattr: fix null pointer deref in ext4_raw_inode()
    2c0acd1a1e94 ktest.pl: Fix uninitialized var in config-bisect.pl
    5fd1a6c631b2 fs/ntfs3: fix mount failure for sparse runs in run_unpack()
    7ad2c3ae0795 kallsyms: Fix wrong "big" kernel symbol type read from procfs
    037cf435316e floppy: fix for PAGE_SIZE != 4KB
    59e7ee37d5f8 block: rate-limit capacity change info log
    075e7d288ca3 s390/dasd: Fix gendisk parent after copy pair swap
    4f4515f02497 lib/crypto: x86/blake2s: Fix 32-bit arg treated as 64-bit
    fe2ce8f925b0 mmc: sdhci-msm: Avoid early clock doubling during HS400 transition
    18b99fa603d0 io_uring: fix filename leak in __io_openat_prep()
    19166de97372 KEYS: trusted: Fix a memory leak in tpm2_load_cmd
    bc390b273720 cifs: Fix memory and information leak in smb3_reconfigure()
    23a89dda39f4 vhost/vsock: improve RCU read sections around vhost_vsock_get()
    cebfc2ba2e6f block: rnbd-clt: Fix signedness bug in init_dev()
    8d8cd3d315db platform/x86/intel/hid: Add Dell Pro Rugged 10/12 tablet to VGBS DMI quirks
    e3ef3e4888de nvme-fc: don't hold rport lock when putting ctrl
    62641daa93cb i2c: designware: Disable SMBus interrupts to prevent storms from mis-configured firmware
    92544ae44c44 libperf cpumap: Fix perf_cpu_map__max for an empty/NULL map
    1abf4ddeda5c serial: sprd: Return -EPROBE_DEFER when uart clock is not ready
    72ab74fce63b usb: usb-storage: No additional quirks need to be added to the EL-R12 optical drive.
    4373a81f6b0a usb: xhci: limit run_graceperiod for only usb 3.0 devices
    1803fe66c9f2 iio: adc: ti_am335x_adc: Limit step_avg to valid range for gcc complains
    914605b0de81 usb: typec: ucsi: Handle incorrect num_connectors capability
    de6dd14643e5 usbip: Fix locking bug in RT-enabled kernels
    44c8dccb09a2 exfat: fix remount failure in different process environments
    b1cad002d69a reset: fix BIT macro reference
    d2c7c90aca7b via_wdt: fix critical boot hang due to unnamed resource allocation
    b39fa021839b fuse: Invalidate the page cache after FOPEN_DIRECT_IO write
    6c6a81d86a3c fuse: Always flush the page cache before FOPEN_DIRECT_IO write
    69f05f3e5390 scsi: qla2xxx: Use reinit_completion on mbx_intr_comp
    0ec5059916f5 scsi: qla2xxx: Fix initiator mode with qlini_mode=exclusive
    61c409780367 scsi: qla2xxx: Fix lost interrupts with qlini_mode=disabled
    b5020721e953 powerpc/addnote: Fix overflow on 32-bit builds
    71f543a56177 clk: mvebu: cp110 add CLK_IGNORE_UNUSED to pcie_x10, pcie_x11 & pcie_x4
    cad4dfddaf69 ti-sysc: allow OMAP2 and OMAP4 timers to be reserved on AM33xx
    a6f1ced333a6 firmware: imx: scu-irq: Init workqueue before request mbox channel
    aafed85dbff7 ipmi: Fix __scan_channels() failing to rescan channels
    42985fb28312 ipmi: Fix the race between __scan_channels() and deliver_response()
    2f21a7cbaaa9 ALSA: usb-mixer: us16x08: validate meter packet indices
    ba2d15635e59 ALSA: pcmcia: Fix resource leak in snd_pdacf_probe error path
    930acded6bbf ALSA: vxpocket: Fix resource leak in vxpocket_probe error path
    8f289fa12926 net/hsr: fix NULL pointer dereference in prp_get_untagged_frame()
    97575fb2b714 dt-bindings: mmc: sdhci-of-aspeed: Switch ref to sdhci-common.yaml
    d9bd2d0985b2 mmc: sdhci-esdhc-imx: add alternate ARCH_S32 dependency to Kconfig
    3dd6d0138482 spi: fsl-cpm: Check length parity before switching to 16 bit mode
    a287987af354 ACPI: CPPC: Fix missing PCC check for guaranteed_perf
    ef0f9059a647 ACPI: PCC: Fix race condition by removing static qualifier
    20dbeaed2459 can: gs_usb: gs_can_open(): fix error handling
    3f3c1c05c6ff Input: i8042 - add TUXEDO InfinityBook Max Gen10 AMD to i8042 quirk table
    bf95ec558058 Input: ti_am335x_tsc - fix off-by-one error in wire_order validation
    2bee957f6155 HID: input: map HID_GD_Z to ABS_DISTANCE for stylus/pen
    a28a375a5439 ksmbd: fix buffer validation by including null terminator size in EA length
    e54fb2a47725 ksmbd: Fix refcount leak when invalid session is found on session lookup
    da29cd197246 ksmbd: skip lock-range check on equal size to avoid size==0 underflow
    378a5d288598 block: rnbd-clt: Fix leaked ID in init_dev()
    d9479998c19a spi: cadence-quadspi: Fix clock disable on probe failure path
    a0fee4e618f1 x86/xen: Fix sparse warning in enlighten_pv.c
    79ee93cb007e x86/xen: Move Xen upcall handler
    86fcc629fdc0 drm/panel: sony-td4353-jdi: Enable prepare_prev_first
    fd8bb8fa7bc9 MIPS: Fix a reference leak bug in ip22_check_gio()
    11dddaed6978 hwmon: (tmp401) fix overflow caused by default conversion rate value
    fa37adcf1d56 hwmon: (ibmpex) fix use-after-free in high/low store
    b7b4f3bf118f net: hns3: add VLAN id validation before using
    3708637cb0d4 net: hns3: using the num_tqps to check whether tqp_index is out of range when vf get ring info from mbx
    1956d47a03eb net: hns3: using the num_tqps in the vf driver to apply for resources
    049538a3aa98 net: enetc: do not transmit redirected XDP frames when the link is down
    011ae80c49d9 net/handshake: duplicate handshake cancellations leak socket
    7646e5d8188b net/mlx5: Serialize firmware reset with devlink
    873cb8bb91ba net/mlx5: Skip HotPlug check on sync reset using hot reset
    de0560f2c33c net/mlx5: fw_tracer, Handle escaped percent properly
    8ac688c0e430 net/mlx5: fw_tracer, Validate format string parameters
    0b0e4639a827 net/mlx5: Drain firmware reset in shutdown callback
    24d3f86df879 net/mlx5: fw reset, clear reset requested on drain_fw_reset
    ca9983bc3a11 ethtool: Avoid overflowing userspace buffer on stats query
    4cc829d61f10 iommufd/selftest: Check for overflow in IOMMU_TEST_OP_ADD_RESERVED
    a9c87779df20 netfilter: nf_tables: remove redundant chain validation on register store
    1816619b2fe8 netfilter: nf_tables: allow loads only when register is initialized
    fb1347c5c016 netfilter: nf_tables: pass context structure to nft_parse_register_load
    8bc10b03e705 nfc: pn533: Fix error code in pn533_acr122_poweron_rdr()
    2f125ebe47d6 net/sched: ets: Remove drr class from the active list if it changes to strict
    f818cd472565 caif: fix integer underflow in cffrml_receive()
    4729ff0581fb ipvs: fix ipv4 null-ptr-deref in route error path
    325eb61bb307 netfilter: nf_conncount: fix leaked ct in error paths
    3e778855fbce broadcom: b44: prevent uninitialized value usage
    10ffc558246f net: openvswitch: fix middle attribute validation in push_nsh() action
    5f2831fc593c mlxsw: spectrum_mr: Fix use-after-free when updating multicast route stats
    4a3c569005f4 mlxsw: spectrum_router: Fix neighbour use-after-free
    5a182635fef3 mlxsw: spectrum_router: Fix possible neighbour reference count leak
    17aefe815462 ipvlan: Ignore PACKET_LOOPBACK in handle_mode_l2()
    9987cda315c0 net/sched: ets: Always remove class from active list before deleting in ets_qdisc_change
    156a0f6341dc netrom: Fix memory leak in nr_sendmsg()
    0e26e3ef8e5c net: fec: ERR007885 Workaround for XDP TX path
    ab794ec9f374 gfs2: Fix use of bio_chain
    96a60775dbb1 Bluetooth: btusb: Add new VID/PID 13d3/3533 for RTL8821CE
    6d9a87ecf31f Bluetooth: btusb: Add new VID/PID 2b89/6275 for RTL8761BUV
    5adad9727a81 ksmbd: vfs: fix race on m_flags in vfs_cache
    d64977495e44 ksmbd: fix use-after-free in ksmbd_tree_connect_put under concurrency
    c4d7795fa55e smb/server: fix return value of smb2_ioctl()
    11860cf9cc87 gfs2: fix remote evict for read-only filesystems
    58d3e00853e4 btrfs: scrub: always update btrfs_scrub_progress::last_physical
    935284aaf233 wifi: brcmfmac: Add DMI nvram filename quirk for Acer A1 840 tablet
    857e7a2d5a94 hfsplus: fix volume corruption issue for generic/073
    05ec9af3cc43 hfsplus: Verify inode mode when loading from disk
    b9d1c6bb5f19 hfsplus: fix missing hfs_bnode_get() in __hfs_bnode_create
    6348bea92f4f hfsplus: fix volume corruption issue for generic/070
    44a38eb4f787 ntfs: set dummy blocksize to read boot_block when mounting
    fb9e2f99ac10 kbuild: Use objtree for module signing key path
    f5c2a7cb2f00 fs/ntfs3: Support timestamps prior to epoch
    fefb29d64e7b livepatch: Match old_sympos 0 and 1 in klp_find_func()
    e71e8079adfe cpuidle: menu: Use residency threshold in polling state override decisions
    ae7ead58d949 cpufreq: s5pv210: fix refcount leak
    9ba782fbe66a cpufreq: dt-platdev: Add JH7110S SOC to the allowlist
    ce2bdfc4af3f ACPI: property: Use ACPI functions in acpi_graph_get_next_endpoint() only
    1bc34293dfbd ACPICA: Avoid walking the Namespace if start_node is NULL
    30917f8d4383 x86/ptrace: Always inline trivial accessors
    6c074ccf7705 sched/fair: Revert max_newidle_lb_cost bump
    91e448e69aca sched/deadline: only set free_cpus for online runqueues
    6e41d9ec8d7c perf/x86/amd: Check event before enable to avoid GPF
    011e356fe41e iomap: account for unaligned end offsets when truncating read range
    82b60ffbb532 iomap: adjust read range correctly for non-block-aligned positions
    c0c0951b9cd4 btrfs: fix memory leak of fs_devices in degraded seed device path
    f64105c91557 bpf, arm64: Do not audit capability check in do_jit()
    beeed972ab48 btrfs: fix a potential path leak in print_data_reloc_error()
    54ac15426326 btrfs: do not skip logging new dentries when logging a new name
    e5daff089b92 ipv6: add exception routes to GC list in rt6_insert_exception
    90f7d995b861 ipv6: avoid possible NULL deref in modify_prefix_route()
    dea3ed2c16f9 ALSA: dice: fix buffer overflow in detect_stream_formats()
    dbf2d472323d usb: phy: Initialize struct usb_phy list_head
    4ef659d1f2e1 usb: gadget: tegra-xudc: Always reinitialize data toggle when clear halt
    7c0b3edb6c77 net: lan743x: Allocate rings outside ZONE_DMA
    95eb965ce0a6 LoongArch: Add machine_kexec_mask_interrupts() implementation
    8d9d121e3799 ocfs2: fix memory leak in ocfs2_merge_rec_left()
    c21c606ad398 irqchip/mchp-eic: Fix error code in mchp_eic_domain_alloc()
    94a4c58d7195 efi/cper: align ARM CPER type with UEFI 2.9A/2.10 specs
    f5a28c4ee058 efi/cper: Adjust infopfx size to accept an extra space
    b930724424b7 efi/cper: Add a new helper function to print bitmasks
    99bc41d7d796 dm log-writes: Add missing set_freezable() for freezable kthread
    448092910421 dm-raid: fix possible NULL dereference with undefined raid type
    ca8764c0ea1f block: Use RCU in blk_mq_[un]quiesce_tagset() instead of set->tag_list_lock
    fd7e7353a5ba ARM: 9464/1: fix input-only operand modification in load_unaligned_zeropad()
    6d4f17782ce4 ALSA: firewire-motu: add bounds check in put_user loop for DSP events
    2e09c882a66e rtc: gamecube: Check the return value of ioremap()
    5ef0faed120a ALSA: uapi: Fix typo in asound.h comment
    74f2a6b2cff8 dma/pool: eliminate alloc_pages warning in atomic_pool_expand
    ddd32ec66bc4 ALSA: firewire-motu: fix buffer overflow in hwdep read for DSP events
    1e59c7587bb0 nvme-auth: use kvfree() for memory allocated with kvcalloc()
    27d20907debf block: fix comment for op_is_zone_mgmt() to include RESET_ALL
    94f146df56fb blk-mq: Abort suspend when wakeup events are pending
    5e3230f9f644 ASoC: ak5558: Disable regulator when error happens
    8465515b8689 ASoC: ak4458: Disable regulator when error happens
    5fd617128b57 ASoC: bcm: bcm63xx-pcm-whistler: Check return value of of_dma_configure()
    1edf1b4467d3 platform/x86: asus-wmi: use brightness_set_blocking() for kbd led
    4543d9ccd99e fs/nls: Fix inconsistency between utf8_to_utf32() and utf32_to_utf8()
    a98719b6af3e NFS: Fix inheritance of the block sizes when automounting
    52cfde819a96 Expand the type of nfs_fattr->valid
    dce10c59211e NFS: Automounted filesystems should inherit ro,noexec,nodev,sync flags
    e04647b63cfd Revert "nfs: ignore SB_RDONLY when mounting nfs"
    350e69eb93ef Revert "nfs: clear SB_RDONLY before getting superblock"
    b2ed74f8ccd2 Revert "nfs: ignore SB_RDONLY when remounting nfs"
    f718f9ea6094 NFSv4/pNFS: Clear NFS_INO_LAYOUTCOMMIT in pnfs_mark_layout_stateid_invalid
    b8045ad0d53a NFS: Initialise verifiers for visible dentries in nfs_atomic_open()
    991609c4a7b1 NFS: Initialise verifiers for visible dentries in readdir and lookup
    29e8d9b274c9 fs/nls: Fix utf16 to utf8 conversion
    796318ae388f NFS: Avoid changing nlink when file removes and attribute updates race
    f1fe47f592d3 9p: fix cache/debug options printing in v9fs_show_options
    a888905f2874 fbdev: ssd1307fb: fix potential page leak in ssd1307fb_probe()
    ae836bfac958 pinctrl: single: Fix incorrect type for error return variable
    de0711dbfb5c pinctrl: single: Fix PIN_CONFIG_BIAS_DISABLE handling
    7438b1d70bf2 perf tools: Fix split kallsyms DSO counting
    d01f0e072dad net/sched: sch_cake: Fix incorrect qlen reduction in cake_drop
    84a7efd23b78 clk: keystone: fix compile testing
    fe78b35d19ae md/raid5: fix IO hang when array is broken with IO inflight
    61f371ade3b6 remoteproc: qcom_q6v5_wcss: fix parsing of qcom,halt-regs
    d31af068650c mtd: lpddr_cmds: fix signed shifts in lpddr_cmds
    c44e376a533e selftests: bonding: add delay before each xvlan_over_bond connectivity check
    4035ea8f02fd selftests: bonding: add ipvlan over bond testing
    194788280708 selftests: bonding: Add more missing config options
    12364ab3a790 selftests: bonding: add missing build configs
    d29034c70f15 mtd: rawnand: renesas: Handle devm_pm_runtime_enable() errors
    660936cb5155 net: stmmac: fix rx limit check in stmmac_rx_zc()
    8286c02fe910 netfilter: nft_connlimit: update the count if add was skipped
    da9f247fb5ef netfilter: nf_conncount: rework API to use sk_buff directly
    11b01b8ef1b1 netfilter: flowtable: check for maximum number of encapsulations in bridge vlan
    c327ca1b2de5 Reinstate "resource: avoid unnecessary lookups in find_next_iomem_res()"
    14f860fb0873 resource: introduce is_type_match() helper and use it
    7c5527d18857 resource: replace open coded resource_intersection()
    9bf08dab7041 resource: Reuse for_each_resource() macro
    09811a83b214 regulator: core: Protect regulator_supply_alias_list with regulator_list_mutex
    6338e278de4a ARM: dts: samsung: exynos4412-midas: turn off SDIO WLAN chip during system suspend
    7236e72a91ee ARM: dts: samsung: exynos4210-trats: turn off SDIO WLAN chip during system suspend
    3ff05c6af301 ARM: dts: samsung: exynos4210-i9100: turn off SDIO WLAN chip during system suspend
    83a9770432f5 ARM: dts: samsung: universal_c210: turn off SDIO WLAN chip during system suspend
    886c8f5af8a9 ASoC: Intel: catpt: Fix error path in hw_params()
    84b3ea5ba85c vdpa/pds: use %pe for ERR_PTR() in event handler registration
    c1947cecdd5c virtio: fix virtqueue_set_affinity() docs
    1c7d1ef95abf virtio: fix whitespace in virtio_config_ops
    83dc689e138b virtio: fix typo in virtio_device_ready() comment
    22b11e8f0b8f virtio_vdpa: fix misleading return in void function
    55b273382c52 ext4: improve integrity checking in __mb_check_buddy by enhancing order-0 validation
    0adc8de19be0 ext4: remove unused return value of __mb_check_buddy
    db5deba07f53 ublk: prevent invalid access with DEBUG
    0a0a51092c1c ublk: complete command synchronously on error
    84ea891dc897 ublk: make sure io cmd handled in submitter task context
    c242024efd1b ACPI: processor_core: fix map_x2apic_id for amd-pstate on am4
    1968f2ab4188 hwmon: sy7636a: Fix regulator_enable resource leak on error path
    e84690a05e47 drm/amd/display: Fix logical vs bitwise bug in get_embedded_panel_info_v2_1()
    6dca0f3f61ab ASoC: fsl_xcvr: clear the channel status control memory
    aaf2a6097116 RDMA/irdma: Do not directly rely on IB_PD_UNSAFE_GLOBAL_RKEY
    715fdb3b3054 RDMA/irdma: Add support to re-register a memory region
    8c7b21f37494 RDMA/irdma: Fix data race in irdma_free_pble
    444de2316b09 RDMA/irdma: Fix data race in irdma_sc_ccq_arm
    599632e08859 iommu/arm-smmu-qcom: Enable use of all SMR groups when running bare-metal
    136ff909dfb9 backlight: lp855x: Fix lp855x.h kernel-doc warnings
    30cbe4b64274 backlight: led-bl: Add devlink to supplier LEDs
    26fa6991683f wifi: ieee80211: correct FILS status codes
    e3676761efb2 iomap: always run error completions in user context
    4ae9ff07bc2b iomap: factor out a iomap_dio_done helper
    7e50ce619ec6 drm/nouveau: restrict the flush page to a 32-bit address
    96c56c5ff4e4 PCI: dwc: Fix wrong PORT_LOGIC_LTSSM_STATE_MASK definition
    5928832a90c1 btrfs: fix leaf leak in an error path in btrfs_del_items()
    3cfa3d4b155a staging: fbtft: core: fix potential memory leak in fbtft_probe_common()
    d6ce96e10e4d firmware: stratix10-svc: fix make htmldocs warning for stratix10_svc
    1c3c234af940 mt76: mt7615: Fix memory leak in mt7615_mcu_wtbl_sta_add()
    ccc585db618c RDMA/bnxt_re: Fix the inline size for GenP7 devices
    e3e1c7416be8 RISC-V: KVM: Fix guest page fault within HLV* instructions
    76ae0cc39673 crypto: ccree - Correctly handle return of sg_nents_for_len
    6cd14414394b crypto: starfive - Correctly handle return of sg_nents_for_len
    6a17f898a8bf selftests/bpf: Improve reliability of test_perf_branches_no_hw()
    e5343f28814d selftests/bpf: skip test_perf_branches_hw() on unsupported platforms
    3915c76df201 usb: raw-gadget: cap raw_io transfer length to KMALLOC_MAX_SIZE
    b6943283343b usb: dwc2: fix hang during suspend if set as peripheral
    bac021bf0733 usb: dwc2: fix hang during shutdown if set as peripheral
    7e993b9d6d24 usb: dwc2: disable platform lowlevel hw resources during shutdown
    b90c743a0a32 usb: chaoskey: fix locking for O_NONBLOCK
    cca3e7df3c0f ima: Handle error code returned by ima_filter_rule_match()
    dc153401fb26 wifi: rtl818x: rtl8187: Fix potential buffer underflow in rtl8187_rx_cb()
    06a5e91764ed cpuset: Treat cpusets in attaching as populated
    49dc43b25d34 net: phy: adin1100: Fix software power-down ready condition
    8d946fccf5b4 phy: renesas: rcar-gen3-usb2: Fix an error handling path in rcar_gen3_phy_usb2_probe()
    c23e0dfb05f1 mfd: mt6358-irq: Fix missing irq_domain_remove() in error path
    eb09da83e409 mfd: mt6397-irq: Fix missing irq_domain_remove() in error path
    19eda47ce3f1 wifi: mac80211: fix CMAC functions not handling errors
    7fce2c2ce881 wifi: mac80211: remove RX_DROP_UNUSABLE
    4bccd506a1f1 scsi: qla2xxx: Fix improper freeing of purex item
    6b4cd95bd746 pwm: bcm2835: Make sure the channel is enabled after pwm_request()
    f153fc44c760 perf arm_spe: Fix memset subclass in operation
    64378caea949 perf arm-spe: Extend branch operations
    cb2b0caa8ca9 ipv6: clear RA flags when adding a static route
    bd12abe294c7 net/ipv6: Remove expired routes with a separated list of routes.
    d258ebe7059a drm/mediatek: Fix CCORR mtk_ctm_s31_32_to_s1_n function issue
    9068cfff4cab fs/ntfs3: Prevent memory leaks in add sub record
    ba125e8f8d11 fs/ntfs3: out1 also needs to put mi
    800153219f04 powerpc/64s/ptdump: Fix kernel_hash_pagetable dump for ISA v3.00 HPTE format
    e95d7d5821f6 powerpc/64s/hash: Restrict stress_hpt_struct memblock region to within RMA limit
    bf2c990b0121 bpf: Fix invalid prog->stats access when update_effective_progs fails
    c8201d1353c5 bpf: Improve program stats run-time calculation
    bf8513dfa31e wifi: rtl818x: Fix potential memory leaks in rtl8180_init_rx_ring()
    5ed033c54133 drm/msm/a2xx: stop over-complaining about the legacy firmware
    9f7ab3fbadf3 NFSD/blocklayout: Fix minlength check in proc_layoutget
    07a031029201 tracefs: fix a leak in eventfs_create_events_dir()
    74f25cec6e26 watchdog: starfive: Fix resource leak in probe error path
    0592410b31f1 watchdog: wdat_wdt: Fix ACPI table leak in probe function
    97b876fa8832 bpf: Check skb->transport_header is set in bpf_skb_check_mtu
    67d295d202e2 selftests/bpf: Fix failure paths in send_signal test
    edcb09848a32 bpf: Handle return value of ftrace_set_filter_ip in register_fentry
    bf8f8528b762 ps3disk: use memcpy_{from,to}_bvec index
    f5391a065c15 arm64: dts: rockchip: Add eeprom vcc-supply for Radxa ROCK 5A
    6b73166d3b4b arm64: dts: rockchip: Move the EEPROM to correct I2C bus on Radxa ROCK 5A
    3800c97efff2 PCI: keystone: Exit ks_pcie_probe() for invalid mode
    994d6303ed0b bpf: Free special fields when update [lru_,]percpu_hash maps
    df38a4843ab5 leds: netxbig: Fix GPIO descriptor leak in error paths
    796037ca2fab scsi: sim710: Fix resource leak by adding missing ioport_unmap() calls
    39c754efb3e1 ACPI: property: Fix fwnode refcount leak in acpi_fwnode_graph_parse_endpoint()
    bcb94288d95c ocfs2: relax BUG() to ocfs2_error() in __ocfs2_move_extent()
    7c8a7d87af9d lib/vsprintf: Check pointer before dereferencing in time_and_date()
    43e2c9203d0f clk: renesas: r9a06g032: Fix memory leak in error path
    bb5f23ae16be coresight: etm4x: Add context synchronization before enabling trace
    289d9a2a98ba coresight: etm4x: Extract the trace unit controlling
    60f664206be2 coresight: etm4x: Correct polling IDLE bit
    2e5e0665a594 nbd: defer config unlock in nbd_genl_connect
    cbfcd8ee53c2 wifi: cw1200: Fix potential memory leak in cw1200_bh_rx_helper()
    61abf8c3162d macintosh/mac_hid: fix race condition in mac_hid_toggle_emumouse
    d5720e4045af powerpc/32: Fix unpaired stwcx. on interrupt exit
    a68afb6d6540 cpufreq/amd-pstate: Call cppc_set_auto_sel() only for online CPUs
    ef2bbc11b82b scsi: ufs: core: fix incorrect buffer duplication in ufshcd_read_string_desc()
    907bf69c6b6c ntfs3: init run lock for extend inode
    86322d5110ae ARM: dts: stm32: stm32mp157c-phycore: Fix STMPE811 touchscreen node properties
    d76abca88045 RDMA/rtrs: server: Fix error handling in get_or_create_srv
    841ccb2df19b dt-bindings: PCI: amlogic: Fix the register name of the DBI region
    6cbba9229348 staging: most: remove broken i2c driver
    bb0f288a2c4b staging: most: i2c: Drop explicit initialization of struct i2c_device_id::driver_data to 0
    6d2390653d82 scsi: smartpqi: Fix device resources accessed after device removal
    1867723a98c8 scsi: stex: Fix reboot_notifier leak in probe error path
    1ba2ced2bbdf nbd: defer config put in recv_work
    e432944735ed regulator: core: disable supply if enabling main regulator fails
    313ab3b06f77 perf/x86/intel: Correct large PEBS flag check
    22b62f223c07 ext4: correct the checking of quota files before moving extents
    b5ed17a40909 mfd: da9055: Fix missing regmap_del_irq_chip() in error path
    e4d11160a77d efi/libstub: Fix page table access in 5-level to 4-level paging transition
    6f16ed9c8401 x86/boot: Fix page table access in 5-level to 4-level paging transition
    182b0cc9c6d5 ARM: dts: omap3: n900: Correct obsolete TWL4030 power compatible
    4c1dd8da5386 ARM: dts: omap3: beagle-xm: Correct obsolete TWL4030 power compatible
    2470624c4a21 ARM: dts: am335x-netcom-plus-2xx: add missing GPIO labels
    c934e40246da spi: tegra210-quad: Fix timeout handling
    577d1ef18499 fs/9p: Don't open remote file with APPEND mode when writeback cache is used
    3b8431f15cdd scsi: target: Do not write NUL characters into ASCII configfs output
    4eee4a5b9b2e power: supply: apm_power: only unset own apm_get_power_status
    ea3bdf099e6e power: supply: wm831x: Check wm831x_set_bits() return value
    0fcbaf9e99dc power: supply: rt9467: Prevent using uninitialized local variable in rt9467_set_value_from_ranges()
    5e9308f3539b power: supply: rt9467: Return error on failure in rt9467_set_value_from_ranges()
    1f309df63785 power: supply: cw2015: Check devm_delayed_work_autocancel() return code
    42c1d38de86e perf record: skip synthesize event when open evsel failed
    4dc555120afc perf lock contention: Load kernel map before lookup
    9dd3998165ea perf maps: Add maps__load_first()
    23411ba96edc interconnect: debugfs: Fix incorrect error handling for NULL path
    92087be48b6d arm64: dts: qcom: msm8996: add interconnect paths to USB2 controller
    7bfe9e5e31e3 interconnect: qcom: msm8996: add missing link to SLAVE_USB_HS
    bbd054492101 i3c: master: svc: Prevent incomplete IBI transaction
    82a09b9965ed i3c: fix refcount inconsistency in i3c_master_register
    4fc6af9d9e6d i3c: master: Inherit DMA masks and parameters from parent device
    5f133ebe6836 pinctrl: stm32: fix hwspinlock resource leak in probe function
    ea954e50d312 soc: qcom: smem: fix hwspinlock resource leak in probe error paths
    6135d225cca7 tools/nolibc/stdio: let perror work when NOLIBC_IGNORE_ERRNO is set
    2d3e5c1e76e9 x86/dumpstack: Prevent KASAN false positive warnings in __show_regs()
    b2a39b1a3cde task_work: Fix NMI race condition
    1d733fcbfe61 mtd: rawnand: lpc32xx_slc: fix GPIO descriptor leak on probe error and remove
    4e6526697dcb mtd: nand: relax ECC parameter validation check
    9ce7cbd355ae Revert "mtd: rawnand: marvell: fix layouts"
    4a493d02ff46 ARM: dts: renesas: r9a06g032-rzn1d400-db: Drop invalid #cells properties
    eb8ac04f1036 ARM: dts: renesas: gose: Remove superfluous port property
    58aca869babd RDMA/rxe: Fix null deref on srq->rq.queue after resize failure
    8f2602a83f66 sctp: Defer SCTP_DBG_OBJCNT_DEC() to sctp_destroy_sock().
    85ede044f43d phy: mscc: Fix PTP for VSC8574 and VSC8572
    32d9c68af133 arm64: dts: qcom: sdm845-oneplus: Correct gpio used for slider
    a649992b7eb3 firmware: imx: scu-irq: fix OF node leak in
    abdbffb6a087 arm64: dts: ti: k3-am62p: Fix memory ranges for GPU
    bb04d3610f08 s390/ap: Don't leak debug feature files if AP instructions are not available
    772ded5a84e0 s390/smp: Fix fallback CPU detection
    4304bd7a334e wifi: ath11k: fix peer HE MCS assignment
    9484379c88e1 crypto: hisilicon/qm - restore original qos values
    5b8ac617c8da crypto: asymmetric_keys - prevent overflow in asymmetric_key_generate_id
    4a1535593fff clk: qcom: camcc-sm6350: Fix PLL config of PLL2
    77197835a735 clk: qcom: camcc-sm6350: Specify Titan GDSC power domain as a parent to other
    285dadbb3cb0 uio: uio_fsl_elbc_gpcm:: Add null pointer check to uio_fsl_elbc_gpcm_probe
    433e72bf0f4e PCI: rcar-gen2: Drop ARM dependency from PCI_RCAR_GEN2
    631786221875 arm64: dts: imx8mp-venice-gw702x: remove off-board sdhc1
    5db023188615 arm64: dts: imx8mp-venice-gw702x: remove off-board uart
    e2060f8513b5 arm64: dts: imx8mm-venice-gw72xx: remove unused sdhc1 pinctrl
    d553d5e13edb arm64: dts: freescale: imx8mp-venice-gw7905-2x: remove duplicate usdhc1 props
    cf5cd55287a1 iio: imu: st_lsm6dsx: Fix measurement unit for odr struct member
    23b2b6af8dc6 inet: Avoid ehash lookup race in inet_ehash_insert()
    ad12d25edbbe rculist: Add hlist_nulls_replace_rcu() and hlist_nulls_replace_init_rcu()
    dcb5e3cd96b7 ntfs3: Fix uninit buffer allocated by __getname()
    8bf729b96303 ntfs3: fix uninit memory after failed mi_read in mi_format_new
    3f8878c15753 crypto: authenc - Correctly pass EINPROGRESS back up to the caller
    2629742ccd3a irqchip/qcom-irq-combiner: Fix section mismatch
    c696fb981d7d irqchip/imx-mu-msi: Fix section mismatch
    1fbdca7341d9 irqchip/irq-brcmstb-l2: Fix section mismatch
    7a57553d2123 irqchip/irq-bcm7120-l2: Fix section mismatch
    f00b32894c51 irqchip/irq-bcm7038-l1: Fix section mismatch
    b0515a899ad1 sched/fair: Forfeit vruntime on yield
    a8fdcac66666 objtool: Fix weak symbol detection
    fe6ff6e24ae8 objtool: Fix standalone --hacks=jump_label
    c5f56b7faa80 HID: logitech-hidpp: Do not assume FAP in hidpp_send_message_sync()
    c9a86c677b48 clk: renesas: cpg-mssr: Read back reset registers to assure values latched
    e8c730499293 clk: renesas: Pass sub struct of cpg_mssr_priv to cpg_clk_register
    224a0d7c8449 clk: renesas: Use str_on_off() helper
    d349d7dc3243 clk: renesas: rzg2l: Use %x format specifier to print CLK_ON_R()
    3cf222e052ca clk: renesas: rzg2l: Remove critical area
    73fcc27a9795 clk: renesas: rzg2l: Simplify the logic in rzg2l_mod_clock_endisable()
    2ba9e39f1aed clk: renesas: cpg-mssr: Add missing 1ms delay into reset toggle callback
    094b1827d2f7 USB: Fix descriptor count when handling invalid MBIM extended descriptor
    9dc3c78d21e1 drm/vgem-fence: Fix potential deadlock on release
    2f97ed8e88a3 drm/panel: visionox-rm69299: Don't clear all mode flags
    6245cce711e2 gpu: host1x: Fix race in syncpt alloc/free
    f8fd5491100f smack: fix bug: unprivileged task can create labels
    c173ce97d3f0 staging: rtl8723bs: fix out-of-bounds read in OnBeacon ESR IE parsing
    34620eb602aa staging: rtl8723bs: fix stack buffer overflow in OnAssocReq IE parsing
    30c558447e90 staging: rtl8723bs: fix out-of-bounds read in rtw_get_ie() parser
    b975f91de5f8 comedi: check device's attached status in compat ioctls
    049f14557450 comedi: multiq3: sanitize config options in multiq3_attach()
    72b3627b0d3b comedi: c6xdigio: Fix invalid PNP driver unregistration
    24cb00b9804c wifi: rtw88: Add USB ID 2001:3329 for D-Link AC13U rev. A1
    2f5e6805246c samples: work around glibc redefining some of our defines wrong
    a32eddf2bb52 LoongArch: Mask all interrupts during kexec/kdump
    e9b3a97e852a HID: elecom: Add support for ELECOM M-XT3URBK (018F)
    e7915f55ab15 platform/x86/amd/pmc: Add spurious_8042 to Xbox Ally
    919a9f1422e3 platform/x86/amd: pmc: Add Lenovo Legion Go 2 to pmc quirk list
    f42f958c4f42 platform/x86: huawei-wmi: add keys for HONOR models
    db78f96e150a HID: apple: Add SONiX AK870 PRO to non_apple_keyboards quirk list
    d046f04f223d platform/x86: acer-wmi: Ignore backlight event
    fc59674bb41f pinctrl: qcom: msm: Fix deadlock in pinmux configuration
    a505f0ba36ab nvme: fix admin request_queue lifetime
    37786f27ee0e HID: hid-input: Extend Elan ignore battery quirk to USB
    a9f626396bfe bfs: Reconstruct file type when loading from disk
    4943ed83f80e ALSA: usb-audio: Add native DSD quirks for PureAudio DAC series
    727197a77874 smb: fix invalid username check in smb3_fs_context_parse_param()
    2b37f5b27f13 Bluetooth: btrtl: Avoid loading the config file on security chips
    d6c24a5e6cdc drm/vmwgfx: Use kref in vmw_bo_dirty
    88edfeca040c spi: imx: keep dma request disabled before dma transfer setup
    5f061d0ed906 spi: xilinx: increase number of retries before declaring stall
    27b2a8f45ed1 ftrace: bpf: Fix IPMODIFY + DIRECT in modify_ftrace_direct()
    3915997ad777 USB: serial: kobil_sct: fix TIOCMBIS and TIOCMBIC
    cae7aa183ca4 USB: serial: belkin_sa: fix TIOCMBIS and TIOCMBIC
    5a8c2136dc5e serial: add support of CPCI cards
    53a633786718 USB: serial: ftdi_sio: match on interface number for jtag
    510db76553c9 USB: serial: option: move Telit 0x10c7 composition in the right place
    63d6bf5b19bf USB: serial: option: add Telit Cinterion FE910C04 new compositions
    85e8739c5ce7 USB: serial: option: add Foxconn T99W760
    152289a51107 KVM: SVM: Don't skip unrelated instruction if INT3/INTO is replaced
    88d99ca5adbd comedi: pcl818: fix null-ptr-deref in pcl818_ai_cancel()
    144c48da33a0 ext4: add i_data_sem protection in ext4_destroy_inline_data_nolock()
    39d2ef113416 locking/spinlock/debug: Fix data-race in do_raw_write_lock
    708a620b471a ksmbd: ipc: fix use-after-free in ipc_msg_send_request
    1687a055a555 ext4: refresh inline data size before write operations
    b4f8eabf6d99 jbd2: avoid bug_on in jbd2_journal_get_create_access() when file system corrupted
    46c73ff89d73 Documentation: process: Also mention Sasha Levin as stable tree maintainer
    732fe5cbd6ad leds: spi-byte: Use devm_led_classdev_register_ext()
    25f34fd52144 xfrm: flush all states in xfrm_state_fini
    763e5c351206 xfrm: also call xfrm_state_delete_tunnel at destroy time for states that were never added
    88ed2012b8c7 Revert "xfrm: destroy xfrm_state synchronously on net exit path"
    d0e0d1097118 xfrm: delete x->tunnel as we delete x

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 8ab76cb2f3..0018061822 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "d4ff700595af4b924c51677c033f4a7b555d84d9"
-SRCREV_meta ?= "f0da0340213d3d31ce967c0e74f61d560140abba"
+SRCREV_machine ?= "9f6b4d4c1c5963ea07d6fe904311cd53ad4c0258"
+SRCREV_meta ?= "49d5ba17b4b5951f28957ba6891a14dd7b27ceee"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.119"
+LINUX_VERSION ?= "6.6.120"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 9ee071546f..f4165c9ef4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.119"
+LINUX_VERSION ?= "6.6.120"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "b8e89962b199d788f48813ee31cf5d91f02ba625"
-SRCREV_meta ?= "f0da0340213d3d31ce967c0e74f61d560140abba"
+SRCREV_machine ?= "9216b294019c150359dc667f9d3dbbde2c0a8a8a"
+SRCREV_meta ?= "49d5ba17b4b5951f28957ba6891a14dd7b27ceee"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 20a6e11639..987c3218ec 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "8b1ffa583db6c7b547d6e02b553d158760bef848"
-SRCREV_machine:qemuarm64 ?= "0b48d78b3a581b68506007e3a67168369ac40ef3"
-SRCREV_machine:qemuloongarch64 ?= "509f595358e435ee6db263ff182397c78e74a09d"
-SRCREV_machine:qemumips ?= "fb588d19e0a30c8cbb4e1727ffa66c871cd93e51"
-SRCREV_machine:qemuppc ?= "deb0adb74e5b744b66105fdef7d56faaecd6e8d6"
-SRCREV_machine:qemuriscv64 ?= "509f595358e435ee6db263ff182397c78e74a09d"
-SRCREV_machine:qemuriscv32 ?= "509f595358e435ee6db263ff182397c78e74a09d"
-SRCREV_machine:qemux86 ?= "509f595358e435ee6db263ff182397c78e74a09d"
-SRCREV_machine:qemux86-64 ?= "509f595358e435ee6db263ff182397c78e74a09d"
-SRCREV_machine:qemumips64 ?= "d87f14c4af036fdb7418e1ced1aa7c168966f6d7"
-SRCREV_machine ?= "509f595358e435ee6db263ff182397c78e74a09d"
-SRCREV_meta ?= "f0da0340213d3d31ce967c0e74f61d560140abba"
+SRCREV_machine:qemuarm ?= "bcbb707216e841d53386a3f1ccf9b09c62961791"
+SRCREV_machine:qemuarm64 ?= "321d1a067132a921414fdfab332fb084d44096c2"
+SRCREV_machine:qemuloongarch64 ?= "993fd928045661cd12c065d82461c47220c67cbc"
+SRCREV_machine:qemumips ?= "669b6afdc64fdb78d06e1997fc077b31721460e0"
+SRCREV_machine:qemuppc ?= "8c9e6ee3f14b711a63744f4fe3b1b7aaaee46a99"
+SRCREV_machine:qemuriscv64 ?= "993fd928045661cd12c065d82461c47220c67cbc"
+SRCREV_machine:qemuriscv32 ?= "993fd928045661cd12c065d82461c47220c67cbc"
+SRCREV_machine:qemux86 ?= "993fd928045661cd12c065d82461c47220c67cbc"
+SRCREV_machine:qemux86-64 ?= "993fd928045661cd12c065d82461c47220c67cbc"
+SRCREV_machine:qemumips64 ?= "827304b327c277b699d94d8f861cde5f4b242b3f"
+SRCREV_machine ?= "993fd928045661cd12c065d82461c47220c67cbc"
+SRCREV_meta ?= "49d5ba17b4b5951f28957ba6891a14dd7b27ceee"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "5fa4793a2d2d70ad08b85387b41020f1fcc2d19e"
+SRCREV_machine:class-devupstream ?= "c596736dadab2ffef4737fa8acbc1244557126ac"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.119"
+LINUX_VERSION ?= "6.6.120"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


