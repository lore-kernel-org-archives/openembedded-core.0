Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE8CDC36002
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 13:40:28 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.7680.1742478019314204204
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 06:40:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W/idIBu1;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6e90b8d4686so6446946d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 06:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742478018; x=1743082818; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5xUuBlIg+qxGkZKWPV/Y+iHImQjVFy/3L/9dUQFb9ao=;
        b=W/idIBu1gIuX+Bm8xZqj4Lh8pl4rBWhMwd/E28J/Ls+bHojqMrqHLlI6ZTF6LCvp8c
         hkpBBTqh+VANoFefMRcZfF0h06TWkzA4zSuprMaCJK+JXpd7sbr0cQxI9kmRPUks91sH
         RvTh1ptg63XjcTsrsoRlnov25xAFC3yX2gEU1YJ4w04ydmZ2t2TZzMjR7TtZQyOPe8kx
         tFzKhZapHAaHKW0djm2AMkRqiOBIfTQ+8Rziw2pvYxZ7woV+PefKJyhJy4BmZNmFhK8S
         Q41X3T22+yWjTQmPgNY/0kW9aEhfQkiBN2PiQoWlBSJ9e9DlpvL1ynfY55n7+cjiUH+0
         nAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742478018; x=1743082818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5xUuBlIg+qxGkZKWPV/Y+iHImQjVFy/3L/9dUQFb9ao=;
        b=osYjQ8svrV0XLQoSw1i8s/XhNfR5jBke1uyb7dsrrpUkPYKO27xwLFrUebt9B6zOhp
         1wMJP+/GFczkxoRB/DU9+lBp0eMzGHrVGlT8je5TCh7ACdbEbNFjUgfby6GVhbtM9BXN
         StwtkpYOZzbWmPJe6IjdboH7m11ReVz7w0H0KPrOhSkO8hN5bvH+uzveHo7moQSgXIRm
         yE+pRddmPGr7/fJJNltxanu5GUboCiOeaojB7oyShbjwXxBLGqsD7sPTm20qgQfQiOiV
         v4PYHsnpEAxhs5yLXpSd9amNH7saEFAdoGAyUSBebJ6WhjWMg/ErDOgYh0vojdlIBo+M
         Eqcw==
X-Gm-Message-State: AOJu0Yx4dBQIOp8wKby9ADE/7WGuNV7Lprdc3lkNffB1S+xmzPs7hZGZ
	7xLoijcppeMSR4UM2svXXehbVNo7EwVf/IVShwfIe1KdYDS4qIbLOE2faQjCGU4=
X-Gm-Gg: ASbGncttFhxVyHAniHsWPJJR+f6XI4pC/Ip4EN525HiWayNNsxSpZnq8JELpfOHUTFe
	wRvknrwhDL0EYgMeFStGttvv8iicUdEYKDB8g9VUjmN9yZeMQscPgCnQfWzMF743wGMn41iJvGw
	r7z+/JPKTHpMCXJ0FgziS0RLdcl5Px62L0Gcxa6N6PE3PGWO29j9V7T1Oy7/bZgf71FotHv4b7e
	/DvtAaEAm2eMTMZR27ZJG3+jj+v7nS1Ilxre3zrrpj82xi4QybQCT7YM10LWLVY3uVVA+txDS3z
	/YQw/th7wswg9tvI85QFQk+D4SB6hQUmY0ug5Hk34OT0Rr1C8sOgZ3d2D5zFVqmq7dKOg5KcN93
	dc7lK2P8tfbJ0nSi7UmEKIrTuY0bBoBIqdFmsEZ9ef/XdUg==
X-Google-Smtp-Source: AGHT+IEoo18nMqkEXyki6Fi8jyt5pJtQkvJv0KD7YeKqkEi7iH7U8pA7lPW6f2DmZFK0j7Qd+3P7Jg==
X-Received: by 2002:a05:6214:e6d:b0:6e8:fac2:2ea4 with SMTP id 6a1803df08f44-6eb2928a07cmr96045106d6.14.1742478018075;
        Thu, 20 Mar 2025 06:40:18 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eade231256sm93954166d6.32.2025.03.20.06.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 06:40:17 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] linux-yocto/6.12: update to v6.12.18
Date: Thu, 20 Mar 2025 09:40:09 -0400
Message-Id: <1ce39143582f1bbdb57a4f3ffbfcaadf995c6190.1742477836.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1742477836.git.bruce.ashfield@gmail.com>
References: <cover.1742477836.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 13:40:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213394

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    105a31925e2d Linux 6.12.18
    72cbaf8b41f0 thermal: gov_power_allocator: Add missing NULL pointer check
    3e8653e399e7 x86/microcode/AMD: Load only SHA256-checksummed patches
    0c110da9139d x86/microcode/AMD: Add get_patch_level()
    5c200030419e x86/microcode/AMD: Get rid of the _load_microcode_amd() forward declaration
    12ccf71a7dab x86/microcode/AMD: Merge early_apply_microcode() into its single callsite
    42d04c39c313 x86/microcode/AMD: Remove unused save_microcode_in_initrd_amd() declarations
    9ff4ece7b36c x86/microcode/AMD: Remove ugly linebreak in __verify_patch_section() signature
    eb50ccb8dae3 x86/microcode/AMD: Have __apply_microcode_amd() return bool
    41f1230e037e x86/microcode/AMD: Return bool from find_blobs_in_containers()
    b0f47c8caa5b amdgpu/pm/legacy: fix suspend/resume issues
    65f4aebb8127 efi: Don't map the entire mokvar table to determine its size
    a3c5eb88f0ba riscv: cpufeature: use bitmap_equal() instead of memcmp()
    45233962ea51 riscv: signal: fix signal_minsigstksz
    fa19f64d6329 riscv: cacheinfo: Use of_property_present() for non-boolean properties
    625a90b569b7 riscv: signal: fix signal frame size
    ac354e54dcab riscv/futex: sign extend compare value in atomic cmpxchg
    ec9acbab2ea7 rseq/selftests: Fix riscv rseq_offset_deref_addv inline asm
    59455f968c10 scsi: ufs: core: bsg: Fix crash when arpmb command fails
    c479e20dabfd ima: Reset IMA_NONACTION_RULE_FLAGS after post_setattr
    c8dc4e991042 dm vdo: add missing spin_lock_init
    22c6f577b3cb dm-integrity: Avoid divide by zero in table status in Inline mode
    90c618efaeff selftests/landlock: Test TCP accesses with protocol=IPPROTO_TCP
    5324c459f90d sched_ext: Fix pick_task_scx() picking non-queued tasks when it's called without balance()
    0362847c5207 sched/core: Prevent rescheduling when interrupts are disabled
    29b6d5ad3e43 rcuref: Plug slowpath race in rcuref_put()
    af103505d7d2 vmlinux.lds: Ensure that const vars with relocations are mapped R/O
    a913c2d10950 selftests/landlock: Test that MPTCP actions are not restricted
    ebb0c0fd6990 mptcp: reset when MPTCP opts are dropped after join
    4124b782ec2b mptcp: always handle address removal under msk socket lock
    48848d5bdd97 intel_idle: Handle older CPUs, which stop the TSC in deeper C states, correctly
    4117c7293849 iommu/vt-d: Fix suspicious RCU usage
    eec1009891ab iommu/vt-d: Remove device comparison in context_setup_pass_through_cb
    e59119d8169a phy: exynos5-usbdrd: gs101: ensure power is gated to SS phy in phy_exit()
    45dc8ea1da01 phy: exynos5-usbdrd: fix MPLL_MULTIPLIER and SSC_REFCLKSEL masks in refclk
    ee28b7084181 phy: tegra: xusb: reset VBUS & ID OVERRIDE
    57e56fc2bfc6 net: enetc: fix the off-by-one issue in enetc_map_tx_tso_buffs()
    56e26b5b3d14 net: enetc: correct the xdp_tx statistics
    2d86bd25f066 net: enetc: update UDP checksum when updating originTimestamp field
    3d9634211121 net: enetc: VFs do not support HWTSTAMP_TX_ONESTEP_SYNC
    0ee95d1e1b7d net: enetc: keep track of correct Tx BD count in enetc_map_tx_tso_buffs()
    0d1b060d9814 net: enetc: fix the off-by-one issue in enetc_map_tx_buffs()
    b32804cc17a4 net: phy: qcom: qca807x fix condition for DAC_DSP_BIAS_CURRENT
    050f2e62b13c net: stmmac: dwmac-loongson: Add fix_soc_reset() callback
    4e8b8d43373b usbnet: gl620a: fix endpoint checking in genelink_bind()
    63ddac4bd54d i2c: ls2x: Fix frequency division register access
    12d0e3991670 i2c: npcm: disable interrupt enable bit before devm_request_irq
    2f572c42bb4b block: Remove zone write plugs when handling native zone append writes
    8f6369c3cd63 arm64/mm: Fix Boot panic on Ampere Altra
    94e05f90322e drm/amd/display: Fix HPD after gpu reset
    2b166c574616 drm/amd/display: add a quirk to enable eDP0 on DP1
    98595755f6e0 drm/amd/display: Disable PSR-SU on eDP panels
    d2c9625b0ade drm/amdgpu: init return value in amdgpu_ttm_clear_buffer
    98ef70dd9814 drm/amdgpu: disable BAR resize on Dell G5 SE
    6ffe5bc65627 drm/amdkfd: Preserve cp_hqd_pq_control on update_mqd
    daad16d0a538 drm/xe/userptr: fix EFAULT handling
    f08415419992 drm/xe/userptr: restore invalidation list on error
    610c6e77a711 drm/xe/regs: remove a duplicate definition for RING_CTL_SIZE(size)
    322cb23e24c8 perf/core: Fix low freq setting via IOC_PERIOD
    bf6e873ad732 perf/x86: Fix low freqency setting issue
    a2475ccad612 perf/core: Add RCU read lock protection to perf_iterate_ctx()
    b9de147b2ccb KVM: arm64: Ensure a VMID is allocated before programming VTTBR_EL2
    e992cc7f386e ALSA: hda/realtek: Fix microphone regression on ASUS N705UD
    8e31d9fb2f22 ALSA: usb-audio: Re-add sample rate quirk for Pioneer DJM-900NXS2
    746cc474a954 ftrace: Avoid potential division by zero in function_stat_show()
    435d2964af81 tracing: Fix bad hist from corrupting named_triggers list
    9dbe14e03ff3 riscv: KVM: Fix SBI TIME error generation
    ab306f492c27 riscv: KVM: Fix SBI IPI error generation
    f5009ddfd70a riscv: KVM: Fix hart suspend_type use
    5ecf68c8834b riscv: KVM: Fix hart suspend status check
    faccabe9c1c9 phy: rockchip: naneng-combphy: compatible reset with old DT
    adec6338b043 phy: rockchip: fix Kconfig dependency more
    a455aa3403bf x86/CPU: Fix warm boot hang regression on AMD SC1100 SoC systems
    a00e900c9b6d objtool: Fix C jump table annotations for Clang
    2cfd0e5084e3 objtool: Remove annotate_{,un}reachable()
    8cc451444cfd unreachable: Unify
    546c19eb69fd io_uring/net: save msg_control for compat
    27a144c3be8c thermal: gov_power_allocator: Update total_weight on bind and cdev updates
    19cd2dc4d4c6 thermal: core: Move lists of thermal instances to trip descriptors
    e11df3bffde1 thermal/of: Fix cdev lookup in thermal_of_should_bind()
    07a82c78d822 thermal: of: Simplify thermal_of_should_bind with scoped for each OF child
    13cca2b73e2b uprobes: Reject the shared zeropage in uprobe_write_opcode()
    7d582eb6e4e1 perf/core: Order the PMU list to fix warning about unordered pmu_ctx_list
    806437d04747 thermal: gov_power_allocator: Fix incorrect calculation in divvy_up_power()
    99dcd630ac21 net: ti: icss-iep: Reject perout generation request
    4279bbebe00f idpf: fix checksums set in idpf_rx_rsc()
    cc746341aa7d selftests: drv-net: Check if combined-count exists
    51946f324281 net: ipv6: fix dst ref loop on input in rpl lwt
    bc9ca8a18510 net: ipv6: fix dst ref loop on input in seg6 lwt
    7bb1ba48f709 net/mlx5: IRQ, Fix null string in debug print
    e3e760e03e15 net: mvpp2: cls: Fixed Non IP flow, with vlan tag flow defination.
    902d57629624 net: Clear old fragment checksum value in napi_reuse_skb
    33d782e38d81 tcp: Defer ts_recent changes until req is owned
    ddf9b005dc87 ice: Avoid setting default Rx VSI twice in switchdev setup
    a4880583f88d ice: Fix deinitializing VF in error path
    dc44e67c6db3 ice: add E830 HW VF mailbox message limit support
    c417b1e4d8d0 tcp: devmem: don't write truncated dmabuf CMSGs to userspace
    62454a10ecf2 net: ethernet: ti: am65-cpsw: select PAGE_POOL
    18b90c1abf0e ALSA: hda/realtek: Fix wrong mic setup for ASUS VivoBook 15
    2dd3e9cff9cb ASoC: cs35l56: Prevent races when soft-resetting using SPI control
    b08978fd76eb firmware: cs_dsp: Remove async regmap writes
    baa88823dd84 drm/xe/oa: Allow oa_exponent value of 0
    da2e07e6505c drm/xe/oa: Allow only certain property changes from config
    f0ab9cd205d8 drm/xe/oa: Add syncs support to OA config ioctl
    fa41f3cd4eeb drm/xe/oa: Move functions up so they can be reused for config ioctl
    5fe916b2c9c6 drm/xe/oa: Signal output fences
    8ffd0390fc3f ipvs: Always clear ipvs_property flag in skb_scrub_packet()
    b7091d6b3cb7 ASoC: fsl: Rename stream name of SAI DAI driver
    a4b055fdb062 ASoC: es8328: fix route from DAC to output
    00556b898e40 net: dsa: rtl8366rb: Fix compilation problem
    ab52446831a7 net: cadence: macb: Synchronize stats calculations
    5353fd89663c ipvlan: ensure network headers are in skb linear part
    5138154bdbfc ipvlan: Prepare ipvlan_process_v4_outbound() to future .flowi4_tos conversion.
    97c455c3c243 ipv4: Convert ip_route_input() to dscp_t.
    db8b2a613d7a ipv4: Convert icmp_route_lookup() to dscp_t.
    915d64a78f3c net: set the minimum for net_hotdata.netdev_budget_usecs
    f22df335b298 net: loopback: Avoid sending IP packets without an Ethernet header
    0e8ed2d66da0 afs: Give an afs_server object a ref on the afs_cell object it points to
    a38b394f4650 afs: Fix the server_list to unuse a displaced server rather than putting it
    b5c7428d3488 rxrpc: rxperf: Fix missing decoding of terminal magic cookie
    5c9921f1da47 Bluetooth: L2CAP: Fix L2CAP_ECRED_CONN_RSP response
    ee5d6cb5cc0b ALSA: usb-audio: Avoid dropping MIDI events at closing multiple ports
    22a0ebfb1836 sunrpc: suppress warnings for unused procfs functions
    722c3db62bf6 RDMA/bnxt_re: Fix the page details for the srq created by kernel consumers
    6782ba62a654 RDMA/mlx5: Fix bind QP error cleanup flow
    465a8143238b scsi: ufs: core: Set default runtime/system PM levels before ufshcd_hba_init()
    b5038504da33 scsi: core: Clear driver private data when retrying request
    40432672eb6f RDMA/mlx5: Fix AH static rate parsing
    cb96ae783e72 RDMA/mlx5: Fix implicit ODP hang on parent deregistration
    e4cfa6aa05e5 SUNRPC: Handle -ETIMEDOUT return from tlshd
    4fe4ae6c2e01 NFSv4: Fix a deadlock when recovering state on a sillyrenamed file
    a3ae6a60baf7 SUNRPC: Prevent looping due to rpc_signal_task() races
    b6423ea93ab4 NFS: Adjust delegated timestamps for O_DIRECT reads and writes
    b7b3d772e48a NFS: O_DIRECT writes must check and adjust the file length
    3594aad97e7b ovl: fix UAF in ovl_dentry_update_reval by moving dput() in ovl_link_up
    659bfea5914a scsi: ufs: core: Fix ufshcd_is_ufs_dev_busy() and ufshcd_eh_timed_out()
    917aa50b7509 landlock: Fix non-TCP sockets restriction
    b1f1643effb9 RDMA/bnxt_re: Fix the statistics for Gen P7 VF
    c5c994f44260 RDMA/bnxt_re: Allocate dev_attr information dynamically
    aed1bc673907 RDMA/bnxt_re: Add sanity checks on rdev validity
    edaffce57207 RDMA/bnxt_re: Cache MSIx info to a local structure
    51612bb4d580 RDMA/bnxt_re: Refactor NQ allocation
    2fab96b538ca RDMA/bnxt_re: Fail probe early when not enough MSI-x vectors are reserved
    308d162c44a6 RDMA/hns: Fix mbox timing out by adding retry mechanism
    c3a6c1e7b80e RDMA/mana_ib: Allocate PAGE aligned doorbell index
    0bd34bdd468e RDMA/mlx5: Fix a WARN during dereg_mr for DM type
    a14b5e690aba RDMA/mlx5: Fix a race for DMABUF MR which can lead to CQE with error
    ed3a682157ae IB/mlx5: Set and get correct qp_num for a DCT QP
    3e3bf255992c RDMA/mlx5: Fix the recovery flow of the UMR QP
    807165b1ec1c tools/power/x86/intel-speed-select: Prefix header search path with sysroot
    e97df805b938 drm/tilcdc: Set preferred depth
    7160a4379dcc arch/arm64/configs: remove CONFIG_SM_DISPCC_8650
    6d8ac5ebe6e8 aufs6: core
    587abc1b64c4 aufs6: standalone
    1af41d30ef42 aufs6: mmap
    6ee2464d2e9d aufs6: base
    103b676505f7 aufs6: kbuild
    67281562943f qemux86: add configuration symbol to select values
    73f315ca0823 sched/isolation: really align nohz_full with rcu_nocbs
    1e4e7f8ab622 clear_warn_once: add a clear_warn_once= boot parameter
    918e7a825e8b clear_warn_once: bind a timer to written reset value
    f533f87c3758 clear_warn_once: expand debugfs to include read support
    f149ca27cba9 tools: Remove some options from CLANG_CROSS_FLAGS
    e633abe9c44e libbpf: Fix build warning on ref_ctr_off
    ec0916a4cfc1 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    03721ceb5626 perf: x86-32: explicitly include <errno.h>
    4c36c5295bb0 perf: mips64: Convert __u64 to unsigned long long
    b0200449610d perf: fix bench numa compilation
    aff0940b2212 perf: add SLANG_INC for slang.h
    ef912018d28c perf: add sgidefs.h to for mips builds
    d8860f858b87 perf: change --root to --prefix for python install
    dc38a0eee6e5 perf: add 'libperl not found' warning
    6ed51f8786da perf: force include of <stdbool.h>
    c538d4c4ac65 fat: Replace prandom_u32() with get_random_u32()
    63d94846f0c5 fat: don't use obsolete random32 call in namei_vfat
    7816667451ef FAT: Added FAT_NO_83NAME
    f81dbd60f0d5 FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    771cdefba44b FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    a24784fd8f88 yaffs2: update to v6.12 folio changes
    d0a48fd46db8 yaffs2: adapt to v6.10 i_time changes
    d097e4d4115a yaffs: fix mtime/itime field access
    4411e0d49fe3 yaffs2: update VFS ctime operations to 6.6+
    1b6619086e8b yaffs2: v6.5 fixups
    25b261ee3c54 yaffs2: Fix miscalculation of devname buffer length
    5c07936a5d1c yaffs2: convert user_namespace to mnt_idmap
    55986a1284b3 yaffs2: replace bdevname call with sprintf
    6f5508f8db8f yaffs2: convert read_page -> readfolio
    fd179a5df5d5 yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    c9a620dacdd1 yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    78588208ed17 yaffs2: v5.12+ build fixups (not runtime tested)
    8d2dddba272c yaffs: include blkdev.h
    8c1ca9ef9712 yaffs: Fix build failure by handling inode i_version with proper atomic API
    27005cbac2ed yaffs2: v5.6 build fixups
    668211c9f9b7 yaffs2: fix memory leak when /proc/yaffs is read
    285f911dcc1c yaffs: add strict check when call yaffs_internal_read_super
    ffc2ed489ccf yaffs: repair yaffs_get_mtd_device
    6dce4b70a5e3 yaffs: Fix build failure by handling inode i_version with proper atomic API
    19f283abc5d1 yaffs2: fix memory leak in mount/umount
    04e84672b571 yaffs: Avoid setting any ACL releated xattr
    4f221d6a32e2 Yaffs:check oob size before auto selecting Yaffs1
    81f36004e56b fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    26d7a3dd0054 yaffs2: adjust to proper location of MS_RDONLY
    a7016eac4540 yaffs2: import git revision b4ce1bb (jan, 2020)
    feb240bbb91e initramfs: allow an optional wrapper script around initramfs generation
    874746eaa341 drivers: gpu: drm: msm: registers: improve reproducibility
    1d42508faee8 tools: use basename to identify file in gen-mach-types
    4b055eca593d iwlwifi: select MAC80211_LEDS conditionally
    97e20e275ac0 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    6dec58319165 defconfigs: drop obselete options
    a416ccb5b6c9 linux-yocto: Handle /bin/awk issues
    7efe8a1e5158 uvesafb: provide option to specify timeout for task completion
    78d10ae07eca uvesafb: print error message when task timeout occurs
    80473b7eb8ca compiler.h: Undef before redefining __attribute_const__
    ddeff2f1a9a7 vmware: include jiffies.h
    3dcdda8912b4 Resolve jiffies wrapping about arp
    3b1507db6735 nfs: Allow default io size to be configured.
    c2fedad05f77 check console device file on fs when booting
    208d6fbada3f mount_root: clarify error messages for when no rootfs found
    dbe9454c8ea0 mconf: fix output of cflags and libraries
    7c7b224f5cce menuconfig,mconf-cfg: Allow specification of ncurses location
    b6c189c81397 modpost: mask trivial warnings
    a5cc21325ba9 kbuild: exclude meta directory from distclean processing
    361ec143c23f powerpc: serialize image targets
    605e6ccb304c arm: serialize build targets
    e94b04fcb7d2 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    44cc7f69a0a0 cpu/amd: inhibit SMP check for qemux86
    a08cb65331e6 x86_64_defconfig: Fix warnings
    8ad332ef777b mips: make current_cpu_data preempt safe
    754f05ddce3f mips: vdso: fix 'jalr $t9' crash in vdso code
    325ff78ff44d mips: Kconfig: add QEMUMIPS64 option
    99ae0eadcf11 4kc cache tlb hazard: tlbp cache coherency
    c6894c66a534 malta uhci quirks: make allowance for slow 4k(e)c
    8b52c01f3294 arm64: defconfig: remove CONFIG_IPQ_APSS_5018
    16c7629f035e drm/fb-helper: move zeroing code to drm_fb_helper_fill_var
    6b60c874cbb0 arm64: defconfig: cleanup config options
    8e44673ecd89 vexpress: Pass LOADADDR to Makefile
    f34e6805aad5 arm: ARM EABI socketcall
    94dec9b88de4 ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index bfd4212187..7e15365e52 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "df1d139b08b489ba1becbf2c5609f7e87a891bb2"
-SRCREV_meta ?= "f24c58a63b7e047d2c4441dd2adc30de21c8814d"
+SRCREV_machine ?= "7c2d49c69f3f7e59a598fa8f618b37836fd56404"
+SRCREV_meta ?= "cf35a8d4adea70d86608241d50e1372d50a1484f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.17"
+LINUX_VERSION ?= "6.12.18"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 77860639b5..543d3e6f97 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.17"
+LINUX_VERSION ?= "6.12.18"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "0542a5ac828c168b89b9e606d631adaa4eef7644"
-SRCREV_meta ?= "f24c58a63b7e047d2c4441dd2adc30de21c8814d"
+SRCREV_machine ?= "5fb23ddafcdc46eaf87f7e4f50e416ac9114cbf7"
+SRCREV_meta ?= "cf35a8d4adea70d86608241d50e1372d50a1484f"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index f97957d0fc..447b2d435e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "6bbf0f87ce16fb3287e38440f08832c3b0a73fd5"
-SRCREV_machine:qemuarm64 ?= "0542a5ac828c168b89b9e606d631adaa4eef7644"
-SRCREV_machine:qemuloongarch64 ?= "0542a5ac828c168b89b9e606d631adaa4eef7644"
-SRCREV_machine:qemumips ?= "b01c0e548f2cf0fe508e03c18fd5ca472f7aec05"
-SRCREV_machine:qemuppc ?= "0542a5ac828c168b89b9e606d631adaa4eef7644"
-SRCREV_machine:qemuriscv64 ?= "0542a5ac828c168b89b9e606d631adaa4eef7644"
-SRCREV_machine:qemuriscv32 ?= "0542a5ac828c168b89b9e606d631adaa4eef7644"
-SRCREV_machine:qemux86 ?= "0542a5ac828c168b89b9e606d631adaa4eef7644"
-SRCREV_machine:qemux86-64 ?= "0542a5ac828c168b89b9e606d631adaa4eef7644"
-SRCREV_machine:qemumips64 ?= "551ea60d261d79bdd132dde106705c2bbbfea75e"
-SRCREV_machine ?= "0542a5ac828c168b89b9e606d631adaa4eef7644"
-SRCREV_meta ?= "f24c58a63b7e047d2c4441dd2adc30de21c8814d"
+SRCREV_machine:qemuarm ?= "375482318a509208c26bfcc6ad6c0958f8338c08"
+SRCREV_machine:qemuarm64 ?= "5fb23ddafcdc46eaf87f7e4f50e416ac9114cbf7"
+SRCREV_machine:qemuloongarch64 ?= "5fb23ddafcdc46eaf87f7e4f50e416ac9114cbf7"
+SRCREV_machine:qemumips ?= "ca249c72bb9918f520c737e9cd966feb1fc677e6"
+SRCREV_machine:qemuppc ?= "5fb23ddafcdc46eaf87f7e4f50e416ac9114cbf7"
+SRCREV_machine:qemuriscv64 ?= "5fb23ddafcdc46eaf87f7e4f50e416ac9114cbf7"
+SRCREV_machine:qemuriscv32 ?= "5fb23ddafcdc46eaf87f7e4f50e416ac9114cbf7"
+SRCREV_machine:qemux86 ?= "5fb23ddafcdc46eaf87f7e4f50e416ac9114cbf7"
+SRCREV_machine:qemux86-64 ?= "5fb23ddafcdc46eaf87f7e4f50e416ac9114cbf7"
+SRCREV_machine:qemumips64 ?= "e24e86ef9cfd6a60f835d03e83c78970b7353f48"
+SRCREV_machine ?= "5fb23ddafcdc46eaf87f7e4f50e416ac9114cbf7"
+SRCREV_meta ?= "cf35a8d4adea70d86608241d50e1372d50a1484f"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "41b222412985dc8410b88fb7a0fda87e6640d4df"
+SRCREV_machine:class-devupstream ?= "105a31925e2d17b766cebcff5d173f469e7b9e52"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.17"
+LINUX_VERSION ?= "6.12.18"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


