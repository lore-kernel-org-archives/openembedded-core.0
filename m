Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A06C02183
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 20:47:49 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.28635.1736801258828580390
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 12:47:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Znydyum6;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21628b3fe7dso79936695ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 12:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736801258; x=1737406058; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=13X+pYE1h4PyX6fNKzhUDIRs1K3ldn13Xvet1zLga4w=;
        b=Znydyum6VVnMNOcviym+8CBe9sUMb9P1HFggbEDfIm/DhbMIRLBTVXYBgCCNpCfOWx
         qKUATEOjX4lnfOUDtrPw2rodz2STmuERdWaudUh7YwGMYcIlSuuxQZld0Kn1IkXufuwr
         iSHKO0LBWwi1U+WuYRGQHC5gt2vANJa3Ykb3Q/WsYHXp+GGiTDUZHQFANKj635bEvl1q
         mGiiyXBWyQwZeb5EM1EfnDS/1SChiJFxEJ8g50gtnaFNNcmGTxpQczGbCscz7iAZbKAx
         QtiITlO/ve34gcB3w2B9ePoBLPlyRiX4zwhVABsEr7mDtU6MvQGQGuthMnVvX6rLhEx9
         h2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736801258; x=1737406058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=13X+pYE1h4PyX6fNKzhUDIRs1K3ldn13Xvet1zLga4w=;
        b=f7tnI3QS1Z1Np8YyMWpeUy2TSHWdDs4vjqvMRTsEiYRlzyAwmH7AmLK+pL/pKBObiL
         SBIVSP+Sr81xPgbfy/5+DCV/sgLx6EdwWkujaE/w3PEoYRBViAxSAoPp3I5oJWPnsI19
         8kAhbOc7jacsg3bevQ5DmoUQveatr71ZpkuX+7wF7sC2kP4EHkXV/IzDOJOFkeUabotc
         8nbzh484aBsyfutHj//fdUXc9sIiyQCvIJ9BDW8GgcFCzCs6gknZFfUqzOaJC6PxftzG
         iBVddU1hXZbjwQGPwJug5VC4rwTl8PJFpfgEVwizHcLsFDCxdJnTpBEkRwy3RAiepLw5
         M8LA==
X-Gm-Message-State: AOJu0Ywpan8VnrpZ+TmsbTAUs/n8MatUs7UrSi5fsyU/qJK5F26rV7k4
	/wB+RQhTXxjTUCBECQ3OEhXYmIbLwU7xoJku8UWmENgrVJQ6+JtIhcFY/C8u3y4Oeu0uVdciC8L
	YANg=
X-Gm-Gg: ASbGncsBHIG8RNSqrC1Mnh10lSvu4MQLUbLwJWlPXCs8VEFilGirjXvXFw5TDqcogUw
	hKoZSg/Nb/hMSBgd13hQhuPMsS2OwYhsWo1ZSiIuLK3/Y+oXCvfKqbfyNPyLhKG4gvYxgL2m6Pp
	SiEigBSq5s4KgfdHac8Fo+dcCUApsyfIUUWZMQTB5QFRkuv0uMgTy6Nik1Ft8yfJDsksC/bun7d
	io6zE51+9SOS10EIg/r44YtI3XHcltsQz65HR6oAihB1g==
X-Google-Smtp-Source: AGHT+IHyIvwz6hILaihNv/qcSVLvED4QEzCIUoHALwxiKv3B7FP9LsafMlE0mw7aZ9u81JClnb5ftw==
X-Received: by 2002:a05:6a00:ac2:b0:725:e1de:c0bf with SMTP id d2e1a72fcca58-72d21f2dcbcmr28223506b3a.9.1736801257390;
        Mon, 13 Jan 2025 12:47:37 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40549413sm6449435b3a.12.2025.01.13.12.47.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 12:47:36 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/15] linux-yocto/6.6: update to v6.6.69
Date: Mon, 13 Jan 2025 12:47:04 -0800
Message-ID: <73c7ebc06e9599406c9bccc7431dce74c7a117bc.1736801113.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736801113.git.steve@sakoman.com>
References: <cover.1736801113.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 20:47:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209756

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    a30cd70ab75a Linux 6.6.69
    ee18012c8015 block: avoid to reuse `hctx` not removed from cpuhp callback list
    937fcde0e971 ALSA: hda/realtek: Fix spelling mistake "Firelfy" -> "Firefly"
    ff4dff0bbe79 x86/cpu/intel: Drop stray FAM6 check with new Intel CPU model defines
    0098f6a62ac7 ALSA: sh: Fix wrong argument order for copy_from_iter()
    1ce362065899 btrfs: sysfs: fix direct super block member reads
    6e1a82259307 btrfs: avoid monopolizing a core when activating a swap file
    13eb3cae1d8e power: supply: gpio-charger: Fix set charge current limits
    c484dbafbae9 i2c: microchip-core: fix "ghost" detections
    e1cc0e256092 i2c: imx: add imx7d compatible string for applying erratum ERR007805
    b1f7476e07b9 PCI/MSI: Handle lack of irqdomain gracefully
    3f66c65f6525 i2c: microchip-core: actually use repeated sends
    80120bb4eef7 io_uring/sqpoll: fix sqpoll error handling races
    03041e474a6a tracing: Prevent bad count for tracing_cpumask_write
    dafa7332e7c0 tracing: Constify string literal data member in struct trace_event_call
    c1a26ea77f81 freezer, sched: Report frozen tasks as 'D' instead of 'R'
    60b57dc761d3 drm/amdkfd: pause autosuspend when creating pdd
    4312b60fa7ac drm/amdkfd: Use device based logging for errors
    9f7042ffc7f3 drm/amdkfd: drop struct kfd_cu_info
    798f21e8a655 drm/amdkfd: reduce stack size in kfd_topology_add_device()
    8406848671ce x86/cpu: Add Lunar Lake to list of CPUs with a broken MONITOR implementation
    fe48d03286b2 x86/cpu/intel: Switch to new Intel CPU model defines
    d7ac1856b6ec x86/cpu/vfm: Update arch/x86/include/asm/intel-family.h
    cb3491e875f6 x86/cpu/vfm: Add/initialize x86_vfm field to struct cpuinfo_x86
    f3a3192993da x86/cpu: Add model number for another Intel Arrow Lake mobile processor
    224d693c9203 x86/cpu: Add model number for Intel Clearwater Forest processor
    14172f8e9485 drm/amdgpu/hdp6.0: do a posting read when flushing HDP
    c9ad5cbf2495 drm/amdgpu/hdp5.0: do a posting read when flushing HDP
    f60770d660dc drm/amdgpu/hdp4.0: do a posting read when flushing HDP
    a9cb2cc5b8b5 drm/amd/amdgpu: allow use kiq to do hdp flush under sriov
    36a6e8aeae4a pmdomain: core: Add missing put_device()
    13ced1c4980e ALSA: hda/realtek: fix micmute LEDs don't work on HP Laptops
    31fc2ce99308 ALSA: hda/realtek: fix mute/micmute LEDs don't work for EliteBook X G1i
    2d2b19ed4169 sched/task_stack: fix object_is_on_stack() for KASAN tagged pointers
    1258986bbd17 MIPS: mipsregs: Set proper ISA level for virt extensions
    37ee3b66eb62 MIPS: Probe toolchain support of -msym32
    58bf93580fec blk-mq: move cpuhp callback registering out of q->sysfs_lock
    079fcc926b0b blk-mq: register cpuhp callback after hctx is added to xarray table
    12c0ddd6c551 virtio-blk: don't keep queue frozen during system suspend
    9735d40f5fde drm/dp_mst: Ensure mst_primary pointer is valid in drm_dp_mst_handle_up_req()
    5edf9f786a18 spi: omap2-mcspi: Fix the IS_ERR() bug for devm_clk_get_optional_enabled()
    3556af9a68af scsi: storvsc: Do not flag MAINTENANCE_IN return of SRB_STATUS_DATA_OVERRUN as an error
    cf4bea16bb6d scsi: mpt3sas: Diag-Reset when Doorbell-In-Use bit is set during driver load time
    cecca8b42063 spi: intel: Add Panther Lake SPI controller support
    eb9b647a6834 platform/x86: asus-nb-wmi: Ignore unknown event 0xCF
    4eb54230b0ba LoongArch: BPF: Adjust the parameter of emit_jirl()
    5fc47124442d LoongArch: Fix reserving screen info memory for above-4G firmware
    5e448ea8df48 regmap: Use correct format specifier for logging range errors
    3ad1feaa0bd0 smb: server: Fix building with GCC 15
    7dbf2af85cd3 ALSA: sh: Use standard helper for buffer accesses
    39c860c96c64 ALSA: hda/conexant: fix Z60MR100 startup pop issue
    3dea3c59c4bd udf: Skip parent dir link count update if corrupted
    f50783148ec9 scsi: megaraid_sas: Fix for a potential deadlock
    fbd7deb459b2 scsi: qla1280: Fix hw revision numbering for ISP1020/1040
    ab9ae7e789ab watchdog: mediatek: Add support for MT6735 TOPRGU/WDT
    e64809e8754a watchdog: it87_wdt: add PWRGD enable quirk for Qotom QCML04
    d4d67fa7158d tracing/kprobe: Make trace_kprobe's module callback called after jump_label update
    23681bc4b59f stddef: make __struct_group() UAPI C++-friendly
    b7f60ffdfd96 powerpc/pseries/vas: Add close() callback in vas_vm_ops struct
    dd45c8778273 mtd: rawnand: fix double free in atmel_pmecc_create_user()
    e658f1c133b8 dmaengine: at_xdmac: avoid null_prt_deref in at_xdmac_prep_dma_memset
    aa2381a1ea39 dmaengine: apple-admac: Avoid accessing registers in probe
    34d2c9c6de73 dmaengine: fsl-edma: implement the cleanup path of fsl_edma3_attach_pd()
    f2705359161f dmaengine: tegra: Return correct DMA status when paused
    8cf5aa06d074 dmaengine: dw: Select only supported masters for ACPI devices
    7f92f287b0fa dmaengine: mv_xor: fix child node refcount handling in early exit
    908806a2e789 phy: rockchip: naneng-combphy: fix phy reset
    96173874d6b8 phy: usb: Toggle the PHY power during init
    94dd7d0665ec phy: core: Fix that API devm_phy_destroy() fails to destroy the phy
    216b9f8335b5 phy: core: Fix that API devm_of_phy_provider_unregister() fails to unregister the phy provider
    58068f8b7a55 phy: core: Fix that API devm_phy_put() fails to release the phy
    80a6eeb3a73a phy: core: Fix an OF node refcount leakage in of_phy_provider_lookup()
    293b3748abab phy: core: Fix an OF node refcount leakage in _of_phy_get()
    826acec1a9f9 phy: qcom-qmp: Fix register name in RX Lane config of SC8280XP
    36094da8b402 mtd: rawnand: arasan: Fix missing de-registration of NAND
    649ba9c1712b mtd: rawnand: arasan: Fix double assertion of chip-select
    3970d6b335fb mtd: diskonchip: Cast an operand to prevent potential overflow
    15c184b4e7cf nfsd: restore callback functionality for NFSv4.0
    488304065d0d nfsd: Revert "nfsd: release svc_expkey/svc_export with rcu_work"
    0326fbf69311 bpf: Check negative offsets in __bpf_skb_min_len()
    343a932a05f4 tcp_bpf: Add sk_rmem_alloc related logic for tcp_bpf ingress redirection
    9dbc7e0e5ce5 tcp_bpf: Charge receive socket buffer in bpf_tcp_ingress()
    9ef08c3fe764 mm/vmstat: fix a W=1 clang compiler warning
    d41fa58fca6f ceph: allocate sparse_ext map only for sparse reads
    44e518abbb49 ceph: fix memory leak in ceph_direct_read_write()
    fb98248fc4a2 ceph: try to allocate a smaller extent map for sparse read
    1d6de21f0029 media: dvb-frontends: dib3000mb: fix uninit-value in dib3000_write_reg
    3ee19fb278a6 Linux 6.6.68
    fd4d53318e96 dt-bindings: net: fec: add pps channel property
    c226b0f0d8b0 drm/amdgpu: Handle NULL bo->tbo.resource (again) in amdgpu_vm_bo_update
    194532af82a1 net: fec: make PPS channel configurable
    897bab2abdac net: fec: refactor PPS channel configuration
    4cba44122663 io_uring/rw: avoid punting to io-wq directly
    41928840172e io_uring/rw: treat -EOPNOTSUPP for IOCB_NOWAIT like -EAGAIN
    6c27fc6a783c io_uring/rw: split io_read() into a helper
    d9831a655e13 epoll: Add synchronous wakeup support for ep_poll_callback
    b3ab12531d0d ceph: fix memory leaks in __ceph_sync_read()
    a07c0908e368 ceph: improve error handling and short/overflow-read logic in __ceph_sync_read()
    f006f6eaea7b ceph: validate snapdirname option length when mounting
    7094f3b6df92 of: Fix refcount leakage for OF node returned by __of_get_dma_parent()
    a7e5dc8d5da1 of: Fix error path in of_parse_phandle_with_args_map()
    50c960e79921 udmabuf: also check for F_SEAL_FUTURE_WRITE
    284760b320a0 nilfs2: prevent use of deleted inode
    cfb608b4cf22 nilfs2: fix buffer head leaks in calls to truncate_inode_pages()
    fdfa42cefba4 of/irq: Fix using uninitialized variable @addr_len in API of_irq_parse_one()
    dd3412f29899 of/irq: Fix interrupt-map cell length check in of_irq_parse_imap_parent()
    96c9ff350476 NFS/pnfs: Fix a live lock between recalled layouts and layoutget
    2ca94c8de360 io_uring: check if iowq is killed before queuing
    a73f0425f44b io_uring: Fix registered ring file refcount leak
    24047899f94e selftests/bpf: Use asm constraint "m" for LoongArch
    8b7dfdf3dbd7 selftests/memfd: run sysctl tests when PID namespace support is enabled
    2f6ad0b613cd tracing: Add "%s" check in test_event_printk()
    cc2c77b35186 tracing: Add missing helper functions in event pointer dereference check
    452e89f1588d tracing: Fix test_event_printk() to process entire print argument
    906807c734ed smb: client: fix TCP timers deadlock after rmmod
    3d2634ec0d1d KVM: x86: Play nice with protected guests in complete_hypercall_exit()
    89fcec5e466b Drivers: hv: util: Avoid accessing a ringbuffer not initialized yet
    a41ee016b5df btrfs: tree-checker: reject inline extent items with 0 ref count
    90ae5b7a1c52 vmalloc: fix accounting with i915
    0b5b0b65561b zram: fix uninitialized ZRAM not releasing backing device
    aca0f94c25de zram: refuse to use zero sized block device as backing device
    da61286b6512 hwmon: (tmp513) Fix interpretation of values of Temperature Result and Limit Registers
    7e3b14abe39a hwmon: (tmp513) Fix Current Register value interpretation
    c680302c5eeb hwmon: (tmp513) Fix interpretation of values of Shunt Voltage and Limit Registers
    81a3738bed1a hwmon: (tmp513) Use SI constants from units.h
    d0823a2fe057 hwmon: (tmp513) Simplify with dev_err_probe()
    9d207df1282a hwmon: (tmp513) Don't use "proxy" headers
    da6b2c626ae7 drm/amdgpu: don't access invalid sched
    b91184b59437 i915/guc: Accumulate active runtime on gt reset
    7871b0d81a3b i915/guc: Ensure busyness counter increases motonically
    b5e8103c46aa i915/guc: Reset engine utilization buffer before registration
    5f46feefa5ef drm/panel: novatek-nt35950: fix return value check in nt35950_probe()
    b39de5a71bac drm/modes: Avoid divide by zero harder in drm_mode_vrefresh()
    d1b96495fa2a thunderbolt: Improve redrive mode handling
    cd8fb13924b3 USB: serial: option: add Telit FE910C04 rmnet compositions
    ec1ccad0c3b4 USB: serial: option: add MediaTek T7XX compositions
    996c88c81fec USB: serial: option: add Netprisma LCUK54 modules for WWAN Ready
    eb748a5a8c59 USB: serial: option: add MeiG Smart SLM770A
    27921a57efaf USB: serial: option: add TCL IK512 MBIM & ECM
    637b6e17f11d hexagon: Disable constant extender optimization for LLVM prior to 19.1.0
    b72d1e64984e efivarfs: Fix error on non-existent file
    666c7b77d581 i2c: riic: Always round-up when calculating bus period
    0eba9c56d77c chelsio/chtls: prevent potential integer overflow on 32bit
    efe74dd58a72 net: tun: fix tun_napi_alloc_frags()
    65fac86c3d73 KVM: x86: Cache CPUID.0xD XSTATE offsets+sizes during module init
    3e84704feefe EDAC/amd64: Simplify ECC check on unified memory controllers
    2956429c7a4e mmc: mtk-sd: disable wakeup in .remove() and in the error path of .probe()
    4ca7a0c83100 mmc: sdhci-tegra: Remove SDHCI_QUIRK_BROKEN_ADMA_ZEROLEN_DESC quirk
    b15b92daf67c net: mdiobus: fix an OF node reference leak
    0e78c3eb72ec selftests: openvswitch: fix tcpdump execution
    576b58f39b0f netfilter: ipset: Fix for recursive locking warning
    592fc96af827 ipvs: Fix clamp() of ip_vs_conn_tab on small memory systems
    4dfa9a924008 net: ethernet: bgmac-platform: fix an OF node reference leak
    13fcc286811c net: hinic: Fix cleanup in create_rxqs/txqs()
    55a81dcf79bc ksmbd: fix broken transfers when exceeding max simultaneous operations
    8077d33fb8c8 ksmbd: count all requests in req_running counter
    ce2fade187dd net: renesas: rswitch: rework ts tags management
    6cd7cad950d9 ionic: use ee->offset when returning sprom data
    da5736f516a6 ionic: Fix netdev notifier unregister on failure
    470c5ecbac2f netdevsim: prevent bad user input in nsim_dev_health_break_write()
    2f3c62ffe881 net: mscc: ocelot: fix incorrect IFH SRC_PORT field in ocelot_ifh_set_basic()
    7a6927814b42 net/smc: check return value of sock_recvmsg when draining clc data
    935caf324b44 net/smc: check smcd_v2_ext_offset when receiving proposal msg
    295a92e3df32 net/smc: check v2_ext_offset/eid_cnt/ism_gid_cnt when receiving proposal msg
    91a7c27c1444 net/smc: check iparea_offset and ipv6_prefixes_cnt when receiving proposal msg
    2e0786b3006e net/smc: check sndbuf_space again after NOSPACE flag is set in smc_poll
    2627c3e86469 net/smc: protect link down work from execute after lgr freed
    06518a75de0a cxl/region: Fix region creation for greater than x2 switches
    fa299bfc1e0e cxl/pci: Fix potential bogus return value upon successful probing
    9557ed4dcd8f tools: hv: change permissions of NetworkManager configuration file
    e5d1ae2d4d0b xfs: reset rootdir extent size hint after growfsrt
    29fcb5fef608 xfs: take m_growlock when running growfsrt
    35bd108619c2 xfs: use XFS_BUF_DADDR_NULL for daddrs in getfsmap code
    9fadc53d793c xfs: Fix the owner setting issue for rmap query in xfs fsmap
    4a82db7a4b73 xfs: conditionally allow FS_XFLAG_REALTIME changes if S_DAX is set
    b2dcbd8a928c xfs: attr forks require attr, not attr2
    27336a327b40 xfs: remove unused parameter in macro XFS_DQUOT_LOGRES
    1bee32f33c0a xfs: fix file_path handling in tracepoints
    cb95cb2450e3 xfs: convert comma to semicolon
    ca96d83c9307 xfs: don't walk off the end of a directory data block
    fe962ab3c4f1 xfs: Fix xfs_prepare_shift() range for RT
    2e63ed9b0175 xfs: Fix xfs_flush_unmap_range() range for RT
    c070b8802159 xfs: create a new helper to return a file's allocation unit
    7531c9ab2e55 xfs: declare xfs_file.c symbols in xfs_file.h
    ff627196ddc1 xfs: use consistent uid/gid when grabbing dquots for inodes
    c08d03996cea xfs: verify buffer, inode, and dquot items every tx commit
    85d0947db262 xfs: fix the contact address for the sysfs ABI documentation
    e4ee7050712a i2c: pnx: Fix timeout in wait functions
    76b63579a904 p2sb: Do not scan and remove the P2SB device when it is unhidden
    3c469a528e39 p2sb: Move P2SB hide and unhide code to p2sb_scan_and_cache()
    8b64ae60f3f9 p2sb: Introduce the global flag p2sb_hidden_by_bios
    f8c9788636f5 p2sb: Factor out p2sb_read_from_cache()
    9194a9214b04 platform/x86: p2sb: Make p2sb_get_devfn() return void
    db3667c9bbfb net: stmmac: fix TSO DMA API usage causing oops
    43fb5b0974eb usb: cdns3: Add quirk flag to enable suspend residency
    c7cc4152c0f4 PCI/AER: Disable AER service on suspend
    3e221877dd92 PCI: Use preserve_config in place of pci_flags
    0d1d7e0c6439 ASoC: Intel: sof_sdw: add quirk for Dell SKU 0B8C
    9a6a33eb6be3 ASoC: Intel: sof_sdw: fix jack detection on ADL-N variant RVP
    dbdee8456aa8 MIPS: Loongson64: DTS: Fix msi node for ls7a
    d10b8db9907e usb: cdns3-ti: Add workaround for Errata i2409
    25f760c9ecfd PCI: Add ACS quirk for Broadcom BCM5760X NIC
    db7d50a5d7c4 PCI: vmd: Create domain symlink before pci_bus_add_devices()
    4f3cb0f96a2a usb: dwc2: gadget: Don't write invalid mapped sg entries into dma_desc with iommu enabled
    97e13434b5da net: sched: fix ordering of qlen adjustment
    ab6cc4ef42d6 Linux 6.6.67
    e68cbbef3d6f x86/static-call: fix 32-bit build
    44a7b0419d35 ALSA: usb-audio: Fix a DMA to stack memory bug
    bcf0e2fda80c x86/xen: remove hypercall page
    bcca7e067909 x86/xen: use new hypercall functions instead of hypercall page
    31f29270c15b x86/xen: add central hypercall functions
    82c211ead1ec x86/xen: don't do PV iret hypercall through hypercall page
    cd95149561d5 x86/static-call: provide a way to do very early static-call updates
    8fb54fe2e709 objtool/x86: allow syscall instruction
    aac984c87ef8 x86: make get_cpu_vendor() accessible from Xen code
    fe9a8f5250ae xen/netfront: fix crash when removing device
    4a41bb9f2b40 net: rswitch: Avoid use-after-free in rswitch_poll()
    9f7a9f95dfb7 selftests/bpf: remove use of __xlated()
    ce444a00414a selftests/bpf: Add netlink helper library
    3a7d88f9814a tracing/kprobes: Skip symbol counting logic for module symbols in create_local_trace_kprobe()
    bfe9446ea1d9 bpf: sync_linked_regs() must preserve subreg_def
    4e76efda1f0a KVM: arm64: Disable MPAM visibility by default and ignore VMM writes
    e2ccaf2d0eb5 kselftest/arm64: abi: fix SVCR detection
    4a542118457d blk-iocost: Avoid using clamp() on inuse in __propagate_weights()
    ee11eaa15132 net: dsa: microchip: KSZ9896 register regmap alignment to 32 bit boundaries
    f5fcb1ff9f46 net: renesas: rswitch: fix initial MPIC register setting
    ecdcaea0e405 Bluetooth: btmtk: avoid UAF in btmtk_process_coredump
    3bf09c685e1b Bluetooth: SCO: Add support for 16 bits transparent voice setting
    263b390a826f Bluetooth: iso: Fix recursive locking warning
    0108132d7d76 Bluetooth: hci_event: Fix using rcu_read_(un)lock while iterating
    11dc486ed5d4 Bluetooth: ISO: Reassociate a socket with an active BIS
    81c4b9529ed8 ACPICA: events/evxfregn: don't release the ContextMutex that was never acquired
    c6c217c6e28a team: Fix feature propagation of NETIF_F_GSO_ENCAP_ALL
    679b5884e61d bonding: Fix feature propagation of NETIF_F_GSO_ENCAP_ALL
    3824c5fad18e net/sched: netem: account for backlog updates from child qdisc
    72dc88eca723 net: dsa: felix: fix stuck CPU-injected packets with short taprio windows
    27f0574253f6 netfilter: nf_tables: do not defer rule destruction via call_rcu
    8c2c8445cda8 netfilter: IDLETIMER: Fix for possible ABBA deadlock
    01b2c761503b net: renesas: rswitch: handle stop vs interrupt race
    bf8c6755f020 net: renesas: rswitch: avoid use-after-put for a device tree node
    78aa0aabb093 net: renesas: rswitch: fix leaked pointer on error path
    0c316b6e0aef net: renesas: rswitch: fix race window between tx start and complete
    af327c0f41d6 net: rswitch: Add jumbo frames handling for TX
    87388cbe9330 net: rswitch: Add a setting ext descriptor function
    0aeec4bb6a9f net: rswitch: Add unmap_addrs instead of dma address in each desc
    99ee2eb6e0fe net: rswitch: Use build_skb() for RX
    ad4bd2c039fb net: rswitch: Use unsigned int for desc related array index
    2a584b1443bd net: rswitch: Drop unused argument/return value
    f789f9d1af40 Documentation: PM: Clarify pm_runtime_resume_and_get() return value
    5b8ea6b89f92 ASoC: amd: yc: Fix the wrong return value
    d5a1ca7b5980 ALSA: control: Avoid WARN() for symlink errors
    131798aea9ae qca_spi: Make driver probing reliable
    ebaf832f1e22 qca_spi: Fix clock speed for multiple QCA7000
    3942f0b0d652 cxgb4: use port number to set mac addr
    ae5fab215f9c ACPI: resource: Fix memory resource type union access
    0d9344165273 net: sparx5: fix the maximum frame length register
    ad74e16b351d net: sparx5: fix FDMA performance issue
    f1d6afbe1ecd spi: aspeed: Fix an error handling path in aspeed_spi_[read|write]_user()
    8e9b5e14e5b9 net: mscc: ocelot: perform error cleanup in ocelot_hwstamp_set()
    3b3277267d7b net: mscc: ocelot: be resilient to loss of PTP packets during transmission
    5f2c6930c689 net: mscc: ocelot: ocelot->ts_id_lock and ocelot_port->tx_skbs.lock are IRQ-safe
    7f42e62a6e9f net: mscc: ocelot: improve handling of TX timestamp for unknown skb
    d275b713496e net: mscc: ocelot: fix memory leak on ocelot_port_add_txtstamp_skb()
    b7a79e51297f net: defer final 'struct net' free in netns dismantle
    03e661b5e7aa net: lapb: increase LAPB_HEADER_LEN
    74f0a6912926 ptp: kvm: x86: Return EOPNOTSUPP instead of ENODEV from kvm_arch_ptp_init()
    03528ff8de66 selftests: mlxsw: sharedbuffer: Ensure no extra packets are counted
    c9776bd1422e selftests: mlxsw: sharedbuffer: Remove duplicate test cases
    2be4018f4ce1 selftests: mlxsw: sharedbuffer: Remove h1 ingress test case
    bd7ddc5f921d wifi: cfg80211: sme: init n_channels before channels[] access
    325cf73a1b44 net/mlx5: DR, prevent potential error pointer dereference
    89ecda492d0a tipc: fix NULL deref in cleanup_bearer()
    4a9a7f9f745d batman-adv: Do not let TT changes list grows indefinitely
    fd0638fa60e6 batman-adv: Remove uninitialized data in full table TT response
    b2b6ecc29204 batman-adv: Do not send uninitialized TT changes
    86106974d0a8 amdgpu/uvd: get ring reference from rq scheduler
    e08dc2dc3c3f acpi: nfit: vmalloc-out-of-bounds Read in acpi_nfit_ctl
    567df47c3e45 wifi: mac80211: fix station NSS capability initialization order
    c32db61989af wifi: mac80211: clean up 'ret' in sta_link_apply_parameters()
    c07923459935 wifi: mac80211: init cnt before accessing elem in ieee80211_copy_mbssid_beacon
    f3412522f788 wifi: nl80211: fix NL80211_ATTR_MLO_LINK_ID off-by-one
    a574145ef474 rtla/timerlat: Make timerlat_hist_cpu->*_count unsigned long long
    dbec5b420397 bpf, sockmap: Fix update element with same
    b015f19fedd2 bpf, sockmap: Fix race between element replace and close()
    c2b6b47662d5 bpf,perf: Fix invalid prog_array access in perf_event_detach_bpf_prog
    68d23ee1bdf1 bpf: Fix theoretical prog_array UAF in __uprobe_perf_func()
    c7e1962a3807 bpf: Check size for BTF-based ctx access of pointer members
    0f2dd866c6b1 xfs: only run precommits once per transaction object
    08b1325d67a1 xfs: fix scrub tracepoints when inode-rooted btrees are involved
    eef2e0da3185 xfs: return from xfs_symlink_verify early on V4 filesystems
    549f2fc321ea xfs: don't drop errno values when we fail to ficlone the entire range
    b4f3bf6fe918 xfs: update btree keys correctly when _insrec splits an inode root block
    e07f9c92bd12 drm/i915: Fix NULL pointer dereference in capture_engine
    1f7659950736 drm/i915: Fix memory leak by correcting cache object name in error handler
    c0484aa1adc3 usb: dwc3: xilinx: make sure pipe clock is deselected in usb2 only mode
    8ca07a3d18f3 usb: gadget: u_serial: Fix the issue that gs_start_io crashed due to accessing null pointer
    bd8ca5c5a04a usb: typec: anx7411: fix OF node reference leaks in anx7411_typec_switch_probe()
    1c766533deb3 usb: typec: anx7411: fix fwnode_handle reference leak
    e22e4df241f7 usb: ehci-hcd: fix call balance of clocks handling routines
    35acf6d7e889 usb: gadget: midi2: Fix interpretation of is_midi1 bits
    3184e07e1240 scsi: ufs: core: Update compl_time_stamp_local_clock after completing a cqe
    6c75336869c7 usb: dwc2: Fix HCD port connection race
    700f3afe5b76 usb: dwc2: hcd: Fix GetPortStatus & SetPortFeature
    09883478938d usb: dwc2: Fix HCD resume
    a3840455f275 ata: sata_highbank: fix OF node reference leak in highbank_initialize_phys()
    a867bf10364a usb: host: max3421-hcd: Correctly abort a USB request.
    6f796a6a396d riscv: Fix IPIs usage in kfence_protect_page()
    e6c338476c80 ALSA: usb-audio: Add implicit feedback quirk for Yamaha THR5
    5baa28569c92 blk-cgroup: Fix UAF in blkcg_unpin_online()
    aa9b1d0d6a5b riscv: Fix wrong usage of __pa() on a fixmap address
    7ac2535d8ee6 tcp: check space before adding MPTCP SYN options
    bc6d8cc2c563 splice: do not checksum AF_UNIX sockets
    450a844c045f ksmbd: fix racy issue from session lookup and expire
    0252305d2964 perf/x86/intel/ds: Unconditionally drain PEBS DS when changing PEBS_DATA_CFG
    f9f85df30118 bpf: Fix UAF via mismatching bpf_prog/attachment RCU flavors
    18abb2787b53 x86/syscall: Mark exit[_group] syscall handlers __noreturn
    2879d995e569 pnmtologo: sync with 6.6
    43ea1c5e6eb3 lib/build_OID_registry: take -stable reproducibility changes
    35046aea43c8 bpftool: Fix undefined bpf macro for unix socket
    9a558d4b8621 tools/resolve_btfids: Fix comparison of distinct pointer types warning in resolve_btfids
    42b2eec2e503 bpftool: Query only cgroup-related attach types
    f71bb11887ba cpu/amd: inhibit SMP check for qemux86
    c31365597a17 powerpc/uaccess: Fix build errors seen with GCC 13/14
    64ebf485c56b usb: dwc3: core: remove lock of otg mode during gadget suspend/resume to avoid deadlock
    7c76aad68f6d kselftest: Add a ksft_perror() helper
    06644f0d7193 drm/tilcdc: Set preferred depth
    ff7ae7b32324 crypto: jitter - add RCT/APT support for different OSRs
    50cd24ddb6f0 arm64: defconfig: remove CONFIG_IPQ_APSS_5018
    58e5c91d6701 x86/alternatives: Disable interrupts and sync when optimizing NOPs in place
    c878fd2d4c79 x86/alternatives: Sync core before enabling interrupts
    c2d64b9f52b6 qemux86: add configuration symbol to select values
    630c33229e6d sched/isolation: really align nohz_full with rcu_nocbs
    0e5e0f68e2e6 clear_warn_once: add a clear_warn_once= boot parameter
    46934791b902 clear_warn_once: bind a timer to written reset value
    cdee9e38ff32 clear_warn_once: expand debugfs to include read support
    82b562b81841 tools: Remove some options from CLANG_CROSS_FLAGS
    36dc380b776b libbpf: Fix build warning on ref_ctr_off
    9e3e1fe20982 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    e497a4a5da65 perf: x86-32: explicitly include <errno.h>
    7b57ddd89565 perf: mips64: Convert __u64 to unsigned long long
    1cfc19423dc7 perf: fix bench numa compilation
    98bc2815fade perf: add SLANG_INC for slang.h
    17209a70b9b3 perf: add sgidefs.h to for mips builds
    9cd4258d910a perf: change --root to --prefix for python install
    8110a4f26628 perf: add 'libperl not found' warning
    bc89d5e08f77 perf: force include of <stdbool.h>
    4f6c760cc876 fat: Replace prandom_u32() with get_random_u32()
    bc53117b12b2 fat: don't use obsolete random32 call in namei_vfat
    30b2236ab378 FAT: Added FAT_NO_83NAME
    cef98d22b4ed FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    0bbd7daba9e1 FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    5883fc340084 aufs6: adapt to v6.6 i_op->ctime changes
    c4342d979bf2 aufs6: fix magic.mk include path
    35266bc2dc81 aufs6: adapt to v6.6
    8edede4e98be aufs6: core
    712248233ebe aufs6: standalone
    3b71a8a848d8 aufs6: mmap
    3e2924871f37 aufs6: base
    7f4907a93101 aufs6: kbuild
    d2f7b03e4aa7 yaffs2: update VFS ctime operations to 6.6+
    bcd6cfcd1aa0 yaffs2: v6.5 fixups
    cc615704b5f5 yaffs2: Fix miscalculation of devname buffer length
    8ef2e22dcf91 yaffs2: convert user_namespace to mnt_idmap
    c9c749f9f7d3 yaffs2: replace bdevname call with sprintf
    395b01cdc39d yaffs2: convert read_page -> readfolio
    d98b07e43ba6 yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    613c6d50fdbe yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    622c4648936f yaffs2: v5.12+ build fixups (not runtime tested)
    7562133d4090 yaffs: include blkdev.h
    dbd44252cd59 yaffs: fix misplaced variable declaration
    c223a10b1ac0 yaffs2: v5.6 build fixups
    90f6007cfbf4 yaffs2: fix memory leak when /proc/yaffs is read
    37ee169c5ea1 yaffs: add strict check when call yaffs_internal_read_super
    b6e007b8abb6 yaffs: repair yaffs_get_mtd_device
    fb98f65a466a yaffs: Fix build failure by handling inode i_version with proper atomic API
    51e0aac75ea2 yaffs2: fix memory leak in mount/umount
    2b74a0cae7b0 yaffs: Avoid setting any ACL releated xattr
    ff4130a9c376 Yaffs:check oob size before auto selecting Yaffs1
    ba95b409c67c fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    8fa35eba9056 yaffs2: adjust to proper location of MS_RDONLY
    1eb5deaad8c4 yaffs2: import git revision b4ce1bb (jan, 2020)
    4dce67c1e8c8 initramfs: allow an optional wrapper script around initramfs generation
    2f603d83fcc4 pnmtologo: use relocatable file name
    664a6a0a484b tools: use basename to identify file in gen-mach-types
    9de64bc0c185 lib/build_OID_registry: fix reproducibility issues
    ae9b80797295 vt/conmakehash: improve reproducibility
    a972323151bd iwlwifi: select MAC80211_LEDS conditionally
    15d2adcc0198 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    5556a6c04b19 arm64/perf: Fix wrong cast that may cause wrong truncation
    5552dc768ffc defconfigs: drop obselete options
    00fe4152df31 arm64/perf: fix backtrace for AAPCS with FP enabled
    3888d0652edf linux-yocto: Handle /bin/awk issues
    3d55d299f23a uvesafb: provide option to specify timeout for task completion
    23c068c080be uvesafb: print error message when task timeout occurs
    edbfc939266e compiler.h: Undef before redefining __attribute_const__
    c99ae7e2a19a vmware: include jiffies.h
    572d84d928c8 Resolve jiffies wrapping about arp
    fdcd47cac843 nfs: Allow default io size to be configured.
    927d48801098 check console device file on fs when booting
    57cc27f821dd mount_root: clarify error messages for when no rootfs found
    1b53d82a8152 mconf: fix output of cflags and libraries
    1811da09f42c menuconfig,mconf-cfg: Allow specification of ncurses location
    83c2e0c6eb1f modpost: mask trivial warnings
    6de673039484 kbuild: exclude meta directory from distclean processing
    6decd32815f5 powerpc: serialize image targets
    f6b683b38318 arm: serialize build targets
    e798b09ebf57 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    dc8a1e5a88f8 x86_64_defconfig: Fix warnings
    68491e5f72b6 powerpc/ptrace: Disable array-bounds warning with gcc8
    d71ebfce3004 powerpc: Disable attribute-alias warnings from gcc8
    62f50884b8b1 powerpc: kexec fix for powerpc64
    da6871c62c37 powerpc: Add unwind information for SPE registers of E500 core
    f161c880c11d mips: make current_cpu_data preempt safe
    5e94a8247ce7 mips: vdso: fix 'jalr $t9' crash in vdso code
    19e36714b1c7 mips: Kconfig: add QEMUMIPS64 option
    e2e537db3cbd 4kc cache tlb hazard: tlbp cache coherency
    aee9870611e5 malta uhci quirks: make allowance for slow 4k(e)c
    881948cd1517 drm/fb-helper: move zeroing code to drm_fb_helper_fill_var
    98ec1963fcb7 arm64: defconfig: cleanup config options
    f1727c537ba8 vexpress: Pass LOADADDR to Makefile
    4474c32dc24a arm: ARM EABI socketcall
    75e31a2b70fd ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3765ad18b68446727f2bbce6ab2e43a594dacdd9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 4554170afc..67123136b0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "28d4ec344946d273a8ab6f4ae18163bd97096e9d"
-SRCREV_meta ?= "82e71c6dcc562dbf7725e5ef994ef2ecd74e704c"
+SRCREV_machine ?= "3a66d8b7000a5efea50ccd9c2c8d0955dcf40c72"
+SRCREV_meta ?= "dff911ce87fe7b9944c6058907f079ddb0f3e840"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.66"
+LINUX_VERSION ?= "6.6.69"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index e6f6aadaa5..e48dae1160 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.66"
+LINUX_VERSION ?= "6.6.69"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "77698884d242eb893d8c6de2d49318561ef0b39f"
-SRCREV_meta ?= "82e71c6dcc562dbf7725e5ef994ef2ecd74e704c"
+SRCREV_machine ?= "c556adf7d54204d713252722b27f5bfe25cd8620"
+SRCREV_meta ?= "dff911ce87fe7b9944c6058907f079ddb0f3e840"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index d6fd411b7e..05bf773c1f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "ac47e2d574643c2f15824f571f00287536385207"
-SRCREV_machine:qemuarm64 ?= "77698884d242eb893d8c6de2d49318561ef0b39f"
-SRCREV_machine:qemuloongarch64 ?= "77698884d242eb893d8c6de2d49318561ef0b39f"
-SRCREV_machine:qemumips ?= "88054d5c80cf5d95abb808479640564c45e416d1"
-SRCREV_machine:qemuppc ?= "77698884d242eb893d8c6de2d49318561ef0b39f"
-SRCREV_machine:qemuriscv64 ?= "77698884d242eb893d8c6de2d49318561ef0b39f"
-SRCREV_machine:qemuriscv32 ?= "77698884d242eb893d8c6de2d49318561ef0b39f"
-SRCREV_machine:qemux86 ?= "77698884d242eb893d8c6de2d49318561ef0b39f"
-SRCREV_machine:qemux86-64 ?= "77698884d242eb893d8c6de2d49318561ef0b39f"
-SRCREV_machine:qemumips64 ?= "c3d3e3fa5f4c9de29e7c0cf3a85d2a959ad4f155"
-SRCREV_machine ?= "77698884d242eb893d8c6de2d49318561ef0b39f"
-SRCREV_meta ?= "82e71c6dcc562dbf7725e5ef994ef2ecd74e704c"
+SRCREV_machine:qemuarm ?= "b9db0f967e89de853fa737c164907c4ee111a489"
+SRCREV_machine:qemuarm64 ?= "c556adf7d54204d713252722b27f5bfe25cd8620"
+SRCREV_machine:qemuloongarch64 ?= "c556adf7d54204d713252722b27f5bfe25cd8620"
+SRCREV_machine:qemumips ?= "6cdf7de2dc6c90e973201f52871a3301ec822226"
+SRCREV_machine:qemuppc ?= "c556adf7d54204d713252722b27f5bfe25cd8620"
+SRCREV_machine:qemuriscv64 ?= "c556adf7d54204d713252722b27f5bfe25cd8620"
+SRCREV_machine:qemuriscv32 ?= "c556adf7d54204d713252722b27f5bfe25cd8620"
+SRCREV_machine:qemux86 ?= "c556adf7d54204d713252722b27f5bfe25cd8620"
+SRCREV_machine:qemux86-64 ?= "c556adf7d54204d713252722b27f5bfe25cd8620"
+SRCREV_machine:qemumips64 ?= "c8da027284e8c7ece7e04dcdd1cf49850fea911d"
+SRCREV_machine ?= "c556adf7d54204d713252722b27f5bfe25cd8620"
+SRCREV_meta ?= "dff911ce87fe7b9944c6058907f079ddb0f3e840"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "a66cdcdc9e44b4c508190ea3cde5750954d1c4eb"
+SRCREV_machine:class-devupstream ?= "a30cd70ab75aa6b7ee880b6ec2ecc492faf205b2"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.66"
+LINUX_VERSION ?= "6.6.69"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


