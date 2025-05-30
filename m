Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A20FC5B55A
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 17:39:19 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.1259.1748626752338138060
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 10:39:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lj7FxEHy;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-742c035f2afso1488035b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 10:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748626751; x=1749231551; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3zSmbFcUTT2m/lyHAR3HhZcKv0tdqYaBXJ2X+tFR5AU=;
        b=lj7FxEHyswxdSDUfdLwlD4LDsh5w2FBzEnxTjo+kY31iZkAXRoZIQYUYTXJ3oAiPBK
         f9iCYfextu7p/j5bXxTRavlCLAbIDvUcjOvBP70uA2pVvHVwVntqSzc2BWo6vt7wAEN/
         U3QRh/zGGbSHt10P+GPHrMRnU5QxDgUILaPfqWxdUsL6j89bRORHdm8H7nEGF7Z9n7vM
         VTfJUpee60/+Z+Yd1z2Uz69JfidKSVBermQyeg5jSir9ejtvbqSka8vcHLtz9rM8iFqX
         pruexXxvcaCOgJUxjPvqNmeRxTnKgBKOYq0Gt1KgM7YUJyF5g8F6hlj+7ks0rXqOSNSI
         WIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748626751; x=1749231551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3zSmbFcUTT2m/lyHAR3HhZcKv0tdqYaBXJ2X+tFR5AU=;
        b=Kp9IywOw8ntcg9YShjwzzxjcSjj2UvXouJ6XYjVvEg7z04TGq7DitCRLcSuBcuJ8xV
         FRquj56qDLoViWiOTmaqsr2DWO1Y7DeSzGkFcQoLQue1UWQP1o5rjQF0xRt3JhczuA25
         30jP3alC+ihre5BbniX9CSskOGLJzhC52n3KjZxVkJpneQdunBX2qs/upks4jtQ7K2VF
         W3ZBTqs6e+x52yDflDpV+ZC3g73zyHp+gNdh3Bjol35tNNkB4+JqDJUQzDgOTUq9ujIm
         Bh9pgv+prDtyI4o4qQRrF5vqhAaGS9gk7IAgI+EGjp2QDwEXHg0FpG7iqGWwu2owLlTh
         qFfg==
X-Gm-Message-State: AOJu0YyoJGY/E6NzRIMq1rUwpFk1SAB/+zOd4M1UvWCRYLSuJr46DLpa
	QTGAx5PUm0oUFfqbt9UDTQ2a1mjrr0a+fk61wdpHVcH2jFTbYdvBRfnf7m8Lx65pJfj52r2NZKe
	7uUak
X-Gm-Gg: ASbGnctPhRgAUFwN5zuY4QPuyzG/UWkkJdf4ZxuitKBiWaqhYX95VIhNq+/d9LWSUf+
	kMwuTbbdxr/KBNziEv7+UOS9ZJKrJ9m6XpTUfwTqCqe4JtLg3rXK/UdIpPl6gPAMuXLPan8fnXt
	cy1Nn8eznnp04dUzensTYn0NwMOngMvUCE0hrvig132dBE88aQ7DU7GAinvdLtRlKLhvydl6nCG
	3LGWb0nORx77/l9b37ccRuGzaH17EmWKtTUabcIsTILNey46jKK1qa0YhGSjmYaJJgry+8dyayB
	DvasFMaKB2WScyAbFrtkMc9x7xGwIpB++j9oMgWkD2I=
X-Google-Smtp-Source: AGHT+IGk80mC8Vql2gmpnSav0XNxxGfbiIWPiBVLbvmym6KAhnE4/HXzm89lKdxYksDD8d1CBAZTmA==
X-Received: by 2002:a05:6a20:1583:b0:218:76dd:a66 with SMTP id adf61e73a8af0-21ad95636d1mr6340723637.13.1748626751214;
        Fri, 30 May 2025 10:39:11 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c9d8:e2d0:bfbc:3a26])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2ecebb5f40sm1554314a12.67.2025.05.30.10.39.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 10:39:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 03/12] linux-yocto/6.12: update to v6.12.25
Date: Fri, 30 May 2025 10:38:50 -0700
Message-ID: <196207a15450987bdfd4c962cf2cd6698cbbae14.1748626640.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748626640.git.steve@sakoman.com>
References: <cover.1748626640.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 17:39:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217526

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    ef4999852d30 Linux 6.12.25
    f78507c1ef2c block: make struct rq_list available for !CONFIG_BLOCK
    473c5347355f selftests/bpf: extend changes_pkt_data with cases w/o subprograms
    f0946dcccb3d bpf: fix null dereference when computing changes_pkt_data of prog w/o subprogs
    1062b7612cbd selftests/bpf: validate that tail call invalidates packet pointers
    d0e94a5bb99d selftests/bpf: freplace tests for tracking of changes_packet_data
    3846e2bea565 bpf: check changes_pkt_data property for extension programs
    fa1fbb67e081 selftests/bpf: test for changing packet data from global functions
    1d572c60488b bpf: track changes_pkt_data property for global functions
    d30b9c5950e0 bpf: add find_containing_subprog() utility function
    ab7edf42ce80 wifi: ath12k: Fix invalid entry fetch in ath12k_dp_mon_srng_process
    cec26d6bf34a MIPS: ds1287: Match ds1287_set_base_clock() function types
    305dd911dea7 MIPS: cevt-ds1287: Add missing ds1287.h include
    21c6a0ed6ff0 MIPS: dec: Declare which_prom() as static
    45e19beb968e Revert "wifi: ath12k: Fix invalid entry fetch in ath12k_dp_mon_srng_process"
    b906c1ad25ad mm/vma: add give_up_on_oom option on modify/merge, use in uffd release
    7e2d22493939 block: don't reorder requests in blk_add_rq_to_plug
    2ad0f19a4e99 block: add a rq_list type
    5b34f40cdab6 block: remove rq_list_move
    3dd1af8ce34d nvmet-fc: Remove unused functions
    29b2d6f53c78 drm/amd/display: Temporarily disable hostvm on DCN31
    628e6c452139 LoongArch: Eliminate superfluous get_numa_distances_cnt()
    66d182770fbf efi/libstub: Bump up EFI_MMAP_NR_SLACK_SLOTS to 32
    59a30b981a5e misc: pci_endpoint_test: Fix 'irq_type' to convey the correct type
    0557e70e2aeb misc: pci_endpoint_test: Avoid issue of interrupts remaining after request_irq error
    deee01acc6a3 selftests/bpf: Fix raw_tp null handling test
    e2a9f73ee408 md: fix mddev uaf while iterating all_mddevs list
    6ea2e8743ed1 platform/x86: msi-wmi-platform: Workaround a ACPI firmware bug
    1c9e272f9867 platform/x86: msi-wmi-platform: Rename "data" variable
    3802df8552de kbuild: Add '-fno-builtin-wcslen'
    0f1ee79b0fea scripts: generate_rust_analyzer: Add ffi crate
    c1a485c46c67 cpufreq: Reference count policy in cpufreq_update_limits()
    686d8f7b592f arm64/boot: Enable EL2 requirements for FEAT_PMUv3p9
    14eacc808e67 arm64/sysreg: Add register fields for HFGWTR2_EL2
    2ef32d984d35 arm64/sysreg: Add register fields for HFGRTR2_EL2
    c41512745401 arm64/sysreg: Add register fields for HFGITR2_EL2
    051eccf71703 arm64/sysreg: Add register fields for HDFGWTR2_EL2
    740360261688 arm64/sysreg: Add register fields for HDFGRTR2_EL2
    e1a6acacf1ff arm64/sysreg: Update register fields for ID_AA64MMFR0_EL1
    effb4d79b3b1 drm/mgag200: Fix value in <VBLKSTR> register
    7f21bfd6fc16 drm/amdgpu: fix warning of drm_mm_clean
    a43e53e310a4 drm/xe: Set LRC addresses before guc load
    65dc4e3d5b01 drm/xe/userptr: fix notifier vs folio deadlock
    e4ed75e974a8 drm/xe/dma_buf: stop relying on placement in unmap
    e97bf44115e8 drm/amd/display: Add HP Probook 445 and 465 to the quirk list for eDP on DP1
    a5c9107a3e01 drm/amd/display: Protect FPU in dml2_init()/dml21_init()
    9cb744fbee38 drm/amd/display: Do not enable Replay and PSR while VRR is on in amdgpu_dm_commit_planes()
    a53d959fe660 drm/amdgpu: immediately use GTT for new allocations
    4b171d4cbfff drm/i915/gvt: fix unterminated-string-initialization warning
    28477f701b63 drm/xe: Fix an out-of-bounds shift when invalidating TLB
    b2c11fea2680 drm/sti: remove duplicate object names
    c90b95e12eb8 drm/imagination: take paired job reference
    490c30fd5545 drm/imagination: fix firmware memory leaks
    6e2c805996a4 drm/nouveau: prime: fix ttm_bo_delayed_delete oops
    91b646a0b2cb drm/amdgpu/dma_buf: fix page_link check
    228e98e2021c drm/amdgpu/mes11: optimize MES pipe FW version fetching
    596284026c5b drm/amd/display: Protect FPU in dml21_copy()
    74d6fba60f05 drm/amd/display: Protect FPU in dml2_validate()/dml21_validate()
    fe19e04cd96f drm/amd/display: Add HP Elitebook 645 to the quirk list for eDP on DP1
    2ac5f466f628 drm/xe: Use local fence in error path of xe_migrate_clear
    a37e01fe60a3 drm/i915/vrr: Add vrr.vsync_{start, end} in vrr_params_changed
    2b00b32e6137 drm/amdgpu/mes12: optimize MES pipe FW version fetching
    42f7b5d12c28 drm/amd/pm/powerplay/hwmgr/vega20_thermal: Prevent division by zero
    fb803d4bb9ea drm/amd/pm/swsmu/smu13/smu_v13_0: Prevent division by zero
    8e9c4f8d197d drm/amd/pm/powerplay/hwmgr/smu7_thermal: Prevent division by zero
    63a150400194 drm/amd/pm/smu11: Prevent division by zero
    bd4d90adbca1 drm/amd/pm/powerplay: Prevent division by zero
    6413fed01620 drm/amd/pm: Prevent division by zero
    2a2b7b6f90a2 drm/amd/display: Increase vblank offdelay for PSR panels
    776253d9818d drm/amd/display: Actually do immediate vblank disable
    b542559343c9 drm/amd: Handle being compiled without SI or CIK support better
    0363c03672cd drm/amd/display: prevent hang on link training fail
    531d46336417 drm/amdgpu: Prefer shadow rom when available
    68b591d64df4 drm/msm/a6xx: Fix stale rpmh votes from GPU
    359f6cffaecf drm/msm/dsi: Add check for devm_kstrdup()
    31efeca2ef85 drm/ast: Fix ast_dp connection status
    b33386fabb2b drm/repaper: fix integer overflows in repeat functions
    de67afd68808 perf/x86/intel/uncore: Fix the scale of IIO free running counters on SPR
    c5e157032267 perf/x86/intel/uncore: Fix the scale of IIO free running counters on ICX
    8d19c4a3b811 perf/x86/intel/uncore: Fix the scale of IIO free running counters on SNR
    56fdbc091239 perf/x86/intel: Allow to update user space GPRs from PEBS records
    c7b43f09ddc9 platform/x86: amd: pmf: Fix STT limits
    42ded70c1a4e RAS/AMD/FMPM: Get masked address
    b2748ae60943 RAS/AMD/ATL: Include row[13] bit in row retirement
    d23fd7a539ac RDMA/cma: Fix workqueue crash in cma_netevent_work_handler
    6dd9ede5c59b scsi: ufs: exynos: Ensure consistent phy reference counts
    80b2ad121576 scsi: megaraid_sas: Block zero-length ATA VPD inquiry
    6360e4f8509e x86/boot/sev: Avoid shared GHCB page for early memory acceptance
    519718a3384a x86/cpu/amd: Fix workaround for erratum 1054
    a66b6b07d0d3 x86/microcode/AMD: Extend the SHA check to Zen5, block loading of any unreleased standalone Zen5 microcode patches
    c3e31d613951 virtiofs: add filesystem context source name check
    5683eaf4eeed tracing: Fix filter string testing
    5f878db827c0 string: Add load_unaligned_zeropad() code path to sized_strscpy()
    9042efa7f129 smb3 client: fix open hardlink on deferred close file error
    8baa74719359 slab: ensure slab->obj_exts is clear in a newly allocated slab page
    824b7ad9cf49 selftests/mm: generate a temporary mountpoint for cgroup filesystem
    3f1c81ae13dc riscv: Avoid fortify warning in syscall_get_arguments()
    f761eeefd531 Revert "smb: client: fix TCP timers deadlock after rmmod"
    2aa10d26b6f0 Revert "smb: client: Fix netns refcount imbalance causing leaks and use-after-free"
    2a879da5c34a ksmbd: fix the warning from __kernel_write_iter
    396d6e448583 ksmbd: Prevent integer overflow in calculation of deadtime
    d54ab1520d43 ksmbd: fix use-after-free in smb_break_all_levII_oplock()
    6e30c0e10210 ksmbd: Fix dangling pointer in krb_authenticate
    b9e3579213ba ovl: don't allow datadir only
    029458063ebb mm: fix apply_to_existing_page_range()
    8338e0723fbf mm: fix filemap_get_folios_contig returning batches of identical folios
    b609a60e3115 mm/gup: fix wrongly calculated returned value in fault_in_safe_writeable()
    4f34d6f979bc mm/compaction: fix bug in hugetlb handling pathway
    c45ba8393519 loop: LOOP_SET_FD: send uevents for partitions
    694521cb3fad loop: properly send KOBJ_CHANGED uevent for disk device
    56dfffea9fd3 isofs: Prevent the use of too small fid
    1355b5ca4782 i2c: cros-ec-tunnel: defer probe if parent EC is not present
    84e8719c087e hfs/hfsplus: fix slab-out-of-bounds in hfs_bnode_read_key
    813268285600 crypto: caam/qi - Fix drv_ctx refcount bug
    f73731983f28 cpufreq/sched: Explicitly synchronize limits_changed flag handling
    d3995ff08c15 btrfs: correctly escape subvol in btrfs_show_options()
    b62b1406bb61 Bluetooth: vhci: Avoid needless snprintf() calls
    569bbe2fc76f Bluetooth: l2cap: Process valid commands in too long frame
    bde7abe8cfbb drm/msm/a6xx+: Don't let IB_SIZE overflow
    26d5e2377f57 ftrace: fix incorrect hash size in register_ftrace_direct()
    2665a3b1abf9 i2c: atr: Fix wrong include
    a7fce086f6ca nfsd: decrease sc_count directly if fail to queue dl_recall
    33c0f51f1a8d nfs: add missing selections of CONFIG_CRC32
    e22c8b99c8b8 dma-buf/sw_sync: Decrement refcount on error in sw_sync_ioctl_get_deadline()
    81a566a920a5 drm/v3d: Fix Indirect Dispatch configuration for V3D 7.1.6 and later
    c38a005e6efb block: integrity: Do not call set_page_dirty_lock()
    db42e6f28bdf asus-laptop: Fix an uninitialized variable
    c0ce01e0ff8a ASoC: qcom: Fix sc7280 lpass potential buffer overflow
    2612d5548256 ASoC: Intel: sof_sdw: Add quirk for Asus Zenbook S16
    2b72a9e327cc ASoC: codecs:lpass-wsa-macro: Fix logic of enabling vi channels
    43da9eae1b15 ASoC: codecs:lpass-wsa-macro: Fix vi feedback rate
    b2e56391f620 ASoC: fsl: fsl_qmc_audio: Reset audio data pointers on TRIGGER_START event
    f2e2926e9eb1 Revert "PCI: Avoid reset when disabled via sysfs"
    28da4dd84070 writeback: fix false warning in inode_to_wb()
    c1aa71716aa4 rust: kbuild: use `pound` to support GNU Make < 4.3
    baf02dd01e75 rust: disable `clippy::needless_continue`
    4c353fca6296 rust: kasan/kbuild: fix missing flags on first build
    e8980258c029 objtool/rust: add one more `noreturn` Rust function for Rust 1.86.0
    00a1bdb15791 cpufreq/sched: Fix the usage of CPUFREQ_NEED_UPDATE_LIMITS
    27e0143f4d62 riscv: KGDB: Remove ".option norvc/.option rvc" for kgdb_compiled_break
    999bd7bb21ae riscv: KGDB: Do not inline arch_kgdb_breakpoint()
    853345021141 kunit: qemu_configs: SH: Respect kunit cmdline
    3583394b8505 riscv: module: Allocate PLT entries for R_RISCV_PLT32
    a068ea00009d riscv: module: Fix out-of-bounds relocation access
    1d5a8e1fec8f riscv: Properly export reserved regions in /proc/iomem
    c8c3f8e7a7d6 riscv: Use kvmalloc_array on relocation_hashtable
    cfdcd213ddba net: ethernet: mtk_eth_soc: revise QDMA packet scheduler settings
    7ec0265710d2 net: ethernet: mtk_eth_soc: correct the max weight of the queue limit for 100Mbps
    b524a14ec1f6 net: ethernet: mtk_eth_soc: reapply mdc divider on reset
    da5035d7aead net: ti: icss-iep: Fix possible NULL pointer dereference for perout request
    d028c6a80534 net: ti: icss-iep: Add phase offset configuration for perout signal
    352e5a67099b net: ti: icss-iep: Add pwidth configuration for perout signal
    62b795c22d02 ptp: ocp: fix start time alignment in ptp_ocp_signal_set
    a3e4b6ad5f9a net: dsa: avoid refcount warnings when ds->ops->tag_8021q_vlan_del() fails
    5c8066fbdb96 net: dsa: free routing table on probe failure
    8fcc1e6f8089 net: dsa: clean up FDB, MDB, VLAN entries on unbind
    9ee6d3a368ed net: dsa: mv88e6xxx: fix -ENOENT when deleting VLANs and MST is unsupported
    3665695e3572 net: dsa: mv88e6xxx: avoid unregistering devlink regions which were never registered
    635863d93deb net: txgbe: fix memory leak in txgbe_probe() error path
    d9ecaee61739 net: bridge: switchdev: do not notify new brentries as changed
    ad13e95cbc03 net: b53: enable BPDU reception for management port
    1f6916c55402 netlink: specs: rt-link: adjust mctp attribute naming
    250a2fc77a28 netlink: specs: rt-link: add an attr layer around alt-ifname
    dafb6e433ab2 cxgb4: fix memory leak in cxgb4_init_ethtool_filters() error path
    cb74d5b83714 ata: libata-sata: Save all fields from sense data descriptor
    78253d44e9d3 loop: stop using vfs_iter_{read,write} for buffered I/O
    0175902f6e8c loop: aio inherit the ioprio of original request
    21e70f694bc0 eth: bnxt: fix missing ring index trim on error path
    cd64ae07c40e net: ethernet: ti: am65-cpsw: fix port_np reference counting
    8335a3feb9d0 net: ngbe: fix memory leak in ngbe_probe() error path
    0b7d94164dc9 can: rockchip_canfd: fix broken quirks checks
    be80768d4f3b net: openvswitch: fix nested key length validation in the set() action
    15baba109503 netlink: specs: ovs_vport: align with C codegen capabilities
    41e43134ddda block: fix resource leak in blk_register_queue() error path
    3f899bd6dd56 net: mctp: Set SOCK_RCU_FREE
    61765e1b417a ethtool: cmis_cdb: use correct rpl size in ethtool_cmis_module_poll()
    01ad16ddf9d6 pds_core: fix memory leak in pdsc_debugfs_add_qcq()
    45300268e5d3 test suite: use %zu to print size_t
    86d5243ea60a smc: Fix lockdep false-positive for IPPROTO_SMC.
    688f85d1baaa dt-bindings: soc: fsl: fsl,ls1028a-reset: Fix maintainer entry
    724d26215e9f igc: add lock preventing multiple simultaneous PTM transactions
    c15065acc1de igc: cleanup PTP module if probe fails
    698182f03f3c igc: handle the IGC_PTP_ENABLED flag correctly
    8058c895c7c6 igc: move ktime snapshot into PTM retry loop
    b74137e277b7 igc: increase wait time before retrying PTM
    f3516229cd12 igc: fix PTM cycle trigger logic
    5a3ff97d124d Revert "wifi: mac80211: Update skb's control block key in ieee80211_tx_dequeue()"
    fa0d99648cfc xen: fix multicall debug feature
    b02c2ac2f3f6 ipv6: add exception routes to GC list in rt6_insert_exception
    d49798ecd26e Bluetooth: l2cap: Check encryption key size on incoming connection
    aaf356f872a6 Bluetooth: btrtl: Prevent potential NULL dereference
    6ad0acb56b83 Bluetooth: hci_event: Fix sending MGMT_EV_DEVICE_FOUND for invalid address
    0d81bb58a203 RDMA/core: Silence oversized kvmalloc() warning
    0ba76fb62809 ASoC: cs42l43: Reset clamp override on jack removal
    36e0ea1f965e ALSA: hda/realtek - Fixed ASUS platform headset Mic issue
    c01f3741d12d ALSA: hda/realtek: Workaround for resume on Dell Venue 11 Pro 7130
    34875b7a5dc7 ALSA: hda: improve bass speaker support for ASUS Zenbook UM5606WA
    9b019be5890c ALSA: hda/cirrus_scodec_test: Don't select dependencies
    7060bf9100fa RDMA/hns: Fix wrong maximum DMA segment size
    48e5aa222549 RDMA/usnic: Fix passing zero to PTR_ERR in usnic_ib_pci_probe()
    6104cc65fe87 ovl: remove unused forward declaration
    bbad32b83663 crypto: tegra - Fix IV usage for AES ECB
    9ebc2053b89a crypto: tegra - Do not use fixed size buffers
    28ec10e58d8b crypto: tegra - remove redundant error check on ret
    23fde311ea1d ASoC: Intel: avs: Fix null-ptr-deref in avs_component_probe()
    dcba15ed0876 ASoC: dwc: always enable/disable i2s irqs
    eeeba7f43ae2 md/md-bitmap: fix stats collection for external bitmaps
    54e106047fea md/raid10: fix missing discard IO accounting
    7cc670e8ebaa scsi: smartpqi: Use is_kdump_kernel() to check for kdump
    5e8438fd7f11 scsi: replace blk_mq_pci_map_queues with blk_mq_map_hw_queues
    fe2bdefe8644 blk-mq: introduce blk_mq_map_hw_queues
    5ec903970245 driver core: bus: add irq_get_affinity callback to bus_type
    6884cb2f3b06 scsi: iscsi: Fix missing scsi_host_put() in error path
    52f224009ce1 wifi: wl1251: fix memory leak in wl1251_tx_work
    a8df245b5b29 wifi: mac80211: Purge vif txq in ieee80211_do_stop()
    159499c1341f wifi: mac80211: Update skb's control block key in ieee80211_tx_dequeue()
    a9682bfef2cf wifi: at76c50x: fix use after free access in at76_disconnect
    1773fbf7c05b scsi: hisi_sas: Enable force phy when SATA disk directly connected
    2ee7ebed771b mips: Add '-std=gnu11' to vdso CFLAGS
    b2c792d89ac5 yaffs2: switch from readlink_copy() to vfs_readlink()
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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2ddc917a6942d62cb0da3428d7ea52d45d227b32)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++---
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 368f1fdb63..27bd9f66d8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f92bb3e911b4a396d4efde18f5422a8e2cba32ea"
-SRCREV_meta ?= "47b69a68c57e1c58e83732fe46849190d2a00cbf"
+SRCREV_machine ?= "a20f2b5c8760fc32bd7137fbd952f7f3f810ae26"
+SRCREV_meta ?= "1f6ab68a1d86836bf1b82b791df03da3cfeacb3f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.24"
+LINUX_VERSION ?= "6.12.25"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 3af5769d42..50a217958d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.24"
+LINUX_VERSION ?= "6.12.25"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "df727a0a44b11f5e8715dc15c57eac92f1a75193"
-SRCREV_meta ?= "47b69a68c57e1c58e83732fe46849190d2a00cbf"
+SRCREV_machine ?= "8bdb46d18b39209344e65cd7ee24d1fa451397d5"
+SRCREV_meta ?= "1f6ab68a1d86836bf1b82b791df03da3cfeacb3f"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 5ff2e0e24d..96954f24a3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,18 +18,18 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "f31649d9e24280f86c7314f988ab817d62e3557f"
-SRCREV_machine:qemuarm64 ?= "df727a0a44b11f5e8715dc15c57eac92f1a75193"
-SRCREV_machine:qemuloongarch64 ?= "df727a0a44b11f5e8715dc15c57eac92f1a75193"
-SRCREV_machine:qemumips ?= "12b5d8353b4882e94de4571b43766f46871c03ec"
-SRCREV_machine:qemuppc ?= "df727a0a44b11f5e8715dc15c57eac92f1a75193"
-SRCREV_machine:qemuriscv64 ?= "df727a0a44b11f5e8715dc15c57eac92f1a75193"
-SRCREV_machine:qemuriscv32 ?= "df727a0a44b11f5e8715dc15c57eac92f1a75193"
-SRCREV_machine:qemux86 ?= "df727a0a44b11f5e8715dc15c57eac92f1a75193"
-SRCREV_machine:qemux86-64 ?= "df727a0a44b11f5e8715dc15c57eac92f1a75193"
-SRCREV_machine:qemumips64 ?= "eca58a19ed046caa5707d546a9f733ca1a96e722"
-SRCREV_machine ?= "df727a0a44b11f5e8715dc15c57eac92f1a75193"
-SRCREV_meta ?= "47b69a68c57e1c58e83732fe46849190d2a00cbf"
+SRCREV_machine:qemuarm ?= "ab61ca00dc8c8d6992d25112dadeed88b8c48bdc"
+SRCREV_machine:qemuarm64 ?= "8bdb46d18b39209344e65cd7ee24d1fa451397d5"
+SRCREV_machine:qemuloongarch64 ?= "8bdb46d18b39209344e65cd7ee24d1fa451397d5"
+SRCREV_machine:qemumips ?= "9d52a1ea29e175681780b615541b0af66f9d0d55"
+SRCREV_machine:qemuppc ?= "8bdb46d18b39209344e65cd7ee24d1fa451397d5"
+SRCREV_machine:qemuriscv64 ?= "8bdb46d18b39209344e65cd7ee24d1fa451397d5"
+SRCREV_machine:qemuriscv32 ?= "8bdb46d18b39209344e65cd7ee24d1fa451397d5"
+SRCREV_machine:qemux86 ?= "8bdb46d18b39209344e65cd7ee24d1fa451397d5"
+SRCREV_machine:qemux86-64 ?= "8bdb46d18b39209344e65cd7ee24d1fa451397d5"
+SRCREV_machine:qemumips64 ?= "54af295ab3ca402812576c8425d92dcabe9f0b0d"
+SRCREV_machine ?= "8bdb46d18b39209344e65cd7ee24d1fa451397d5"
+SRCREV_meta ?= "1f6ab68a1d86836bf1b82b791df03da3cfeacb3f"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.24"
+LINUX_VERSION ?= "6.12.25"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


