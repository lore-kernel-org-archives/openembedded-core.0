Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2070C02190
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 16:02:10 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.18813.1738252922965884663
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jan 2025 08:02:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EP2/Xz5j;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7b6f53c12adso84356985a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 08:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738252922; x=1738857722; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+0EFSdO3qI5Gg3UdKShZgvIOtMJIfU6IfBVwffqV9CY=;
        b=EP2/Xz5jGQpM8CgMCOmXb2UXtllSm3C7mk8nc2GpC8yLQclvrOMXTG5KgWR/kXPETS
         VcZxg1P5cGWSGXWeyDD/UHqeOHJXQ0PWc7XGMM/WEEE/UQ+Oxns0TXVHOELa2rZ1s0N7
         iPaLZkS1PSF058/Jl1iKpChPnJTBaoXZ7ojAxg4NkYAF8UQBU7KidDP4oKxVhSj0gKNu
         rP8zpTKmq0Q/1KU9j9Ul4N49qckkgoMN/rjP6rmn34J3ZiUTlzsIGeHDRndeYHbG/kdJ
         1R32mMIA536ZrT7pgSSZve29sHvna6FOP6exebYu0dhiroA4Znd/E6PLpmy9bRixyrPq
         OKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738252922; x=1738857722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+0EFSdO3qI5Gg3UdKShZgvIOtMJIfU6IfBVwffqV9CY=;
        b=QZW6id97ojHv6mJuW0uiRmoYL0MAZrUGHOXeag/siRwb0jAwZ29QuiWJ0QoMGyOA0x
         irwTsT3bZKloqRanft+V+TVCdi/L78e+QaKko7bXwVTCLYP2UJhagGWmDFrlhSqJRbXn
         MkRgqKlf5nhlCY5Z0S9KdRhTMSKpABzi8ZUA3Ya+qZ3jgYrab9QLPLQiYiq/hr1wnnSE
         iHy4UM4D4bRVd7s9B+Zb5rcgvQXo4O4xVGnqCci0YTWH/xsVJp3sgvWKwHwKKtQzz2So
         jmrTxng7Bo4W18NRwUY9EmL/IMqehLfgyvLGUW6BNU7ghGymJt4nijF6NqOs0i0FD7zh
         3GCw==
X-Gm-Message-State: AOJu0Ywf3X2/ejgUeClSiEnrDwTxpLf0NPIUp3WXbee4Re7lfduV1KCU
	d4iw9E2SmT0vYVq9XxeIPSjp7DKlFLfRYi03vuh9BzHgpFiipiO9rKz3LDgVLKQ=
X-Gm-Gg: ASbGncvcpAnSb+KyezE0ZY5zhvdrsVak2JQBLwrik3chvcSFasWtGLBR2uZQ9gfgHY1
	80uX6eXbrWWcbBKaOp03EGvOIP1mTa3Mb7U+zVUq/kjq5+b2L9UZ5ctCxthCtEP5hSftV0VA4/E
	Jt8LZtaQQ0b+6zS9xAGYmFFWo8n4K27sNawftGqkodUXLgPotalVv4bDj9vgR0XkvrSGGrt7Xw6
	W2rMVpKXGIg7ibDuI/njoQ2Rbw45aQ17sMOyacZFadxWl8cX0oUTU9lsfGjVTIt+WTD15/Ra+LN
	n7qrtSSGPk5iHEXyLyZigFFe6YYnleVS/Lv6cASpP8+p1ICFMEaRzDmqABbixOS9EzjiSpc0dv2
	8o1ivfvyiCGLzPnYM
X-Google-Smtp-Source: AGHT+IHk6R1KDa67Co0cwMbm/LK/Cfz+hw6gZNQ5wyCNjVwOeCEckonzX2N1A7lT+UaEtmIdUJx2Og==
X-Received: by 2002:a05:620a:45a8:b0:7b6:ea22:3069 with SMTP id af79cd13be357-7bffcd06f41mr1111437085a.26.1738252921376;
        Thu, 30 Jan 2025 08:02:01 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a90d3c4sm86086285a.111.2025.01.30.08.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 08:02:00 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] linux-yocto/6.12: update to v6.12.10
Date: Thu, 30 Jan 2025 11:01:51 -0500
Message-Id: <2cf998988256d0614a41d9f9558a1777d28ac65b.1738252521.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1738252521.git.bruce.ashfield@gmail.com>
References: <cover.1738252521.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 16:02:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210457

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    a6ad5510dbb5 Linux 6.12.10
    b683ba0df11f netdev: prevent accessing NAPI instances from another namespace
    c08d7fcce7cc iio: imu: inv_icm42600: fix spi burst write not supported
    476e4c4a1a85 io_uring: don't touch sqd->thread off tw add
    ca80f62f0ab5 drm/mediatek: Only touch DISP_REG_OVL_PITCH_MSB if AFBC is supported
    810aad1d7fdd firewall: remove misplaced semicolon from stm32_firewall_get_firewall
    f838da8f3a96 arm64: dts: rockchip: add hevc power domain clock to rk3328
    bc2aeb35ff16 block, bfq: fix waker_bfqq UAF after bfq_split_bfqq()
    42268d885e44 hwmon: (drivetemp) Fix driver producing garbage data when SCSI errors occur
    0587f10fd294 arm64: dts: qcom: sa8775p: fix the secure device bootup issue
    0743189035a8 ARM: dts: imxrt1050: Fix clocks for mmc
    3a4b75c29cce arm64: dts: imx95: correct the address length of netcmix_blk_ctrl
    a7085c3ae43b io_uring/eventfd: ensure io_eventfd_signal() defers another RCU period
    cbb64f5d757f iio: adc: ad7124: Disable all channels at probe time
    24b89b747b1c iio: adc: ad7173: fix using shared static info struct
    b44c99621ddb iio: inkern: call iio_device_put() only on mapped devices
    d115b7f3ddc0 iio: adc: at91: call input_free_device() on allocated iio_dev
    726218231b84 iio: adc: ti-ads124s08: Use gpiod_set_value_cansleep()
    9ccfd0097e76 iio: imu: inv_icm42600: fix timestamps after suspend if sensor is on
    69b680bbac9b iio: adc: ti-ads1298: Add NULL check in ads1298_init
    07e07fbc7726 iio: gyro: fxas21002c: Fix missing data update in trigger handler
    04bbf1227da6 iio: adc: ti-ads1119: fix sample size in scan struct for triggered buffer
    2f1687cca911 iio: adc: ti-ads1119: fix information leak in triggered buffer
    485570ed82b7 iio: adc: ti-ads8688: fix information leak in triggered buffer
    8193941bc4fe iio: adc: rockchip_saradc: fix information leak in triggered buffer
    565814cbbaa6 iio: imu: kmx61: fix information leak in triggered buffer
    1cca2a666e09 iio: light: bh1745: fix information leak in triggered buffer
    f6fb1c59776b iio: light: vcnl4035: fix information leak in triggered buffer
    ea703cda36da iio: dummy: iio_simply_dummy_buffer: fix information leak in triggered buffer
    979a0db76ced iio: pressure: zpa2326: fix information leak in triggered buffer
    976544bdb40a usb: typec: fix pm usage counter imbalance in ucsi_ccg_sync_control()
    a25f1e6f60a2 usb: host: xhci-plat: set skip_phy_initialization if software node has XHCI_SKIP_PHY_INIT property
    62aa896683b0 usb: gadget: configfs: Ignore trailing LF for user strings to cdev
    a8b6a18b9b66 usb: gadget: f_fs: Remove WARN_ON in functionfs_bind
    7dd07d9cd28f usb: typec: tcpm/tcpci_maxim: fix error code in max_contaminant_read_resistance_kohm()
    4bb6450bfdd0 usb: gadget: f_uac2: Fix incorrect setting of bNumEndpoints
    8586d6ea623e usb: typec: tcpci: fix NULL pointer issue on shared irq case
    57797497a696 usb: chipidea: ci_hdrc_imx: decrement device's refcount in .remove() and in the error path of .probe()
    5b41c695a181 usb: gadget: midi2: Reverse-select at the right place
    4fb62dea06cd usb: fix reference leak in usb_new_device()
    e982fcb440bc USB: core: Disable LPM only for non-suspended ports
    61e0a97342e7 USB: usblp: return error when setting unsupported protocol
    eaeaaf04db0c usb: dwc3-am62: Disable autosuspend during remove
    6bfe1fc22f46 x86/fpu: Ensure shadow stack is active before "getting" registers
    8e122d780a0f usb: gadget: u_serial: Disable ep before setting port to null to fix the crash caused by port being null
    5a592b94b542 serial: stm32: use port lock wrappers for break control
    07f09383b192 tty: serial: 8250: Fix another runtime PM usage counter underflow
    5e8f68a4139e misc: microchip: pci1xxxx: Resolve return code mismatch during GPIO set config
    47d3749ec0cb misc: microchip: pci1xxxx: Resolve kernel panic during GPIO IRQ handling
    360596e7fe31 topology: Keep the cpumask unchanged when printing cpumap
    6d86c1b463f7 usb: dwc3: gadget: fix writing NYET threshold
    98f2bd6de318 USB: serial: cp210x: add Phoenix Contact UPS Device
    c67441c93b33 usb-storage: Add max sectors quirk for Nokia 208
    5492dbecbf0e staging: iio: ad9832: Correct phase range check
    26cc3a026d3e staging: iio: ad9834: Correct phase range check
    2eaf2500e2cd USB: serial: option: add Neoway N723-EA support
    2ff1e6b03691 USB: serial: option: add MeiG Smart SRM815
    aa7496d668c3 io_uring/sqpoll: zero sqd->thread on tctx errors
    2b30bffd9a77 io_uring/timeout: fix multishot updates
    5c331df9a5ef drm/amd/display: increase MAX_SURFACES to the value supported by hw
    37b8de96ae48 drm/amd/display: fix page fault due to max surface definition mismatch
    c2eaa73bd542 drm/amd/display: fix divide error in DM plane scale calcs
    c8243def2997 drm/amdkfd: wq_release signals dma_fence only when available
    3e279ecb4233 drm/amdkfd: fixed page fault when enable MES shader debugger
    cde7a70bbbf9 drm/amd/pm: fix BUG: scheduling while atomic
    758e3c3054b6 drm/amdgpu: Add a lock when accessing the buddy trim function
    df8d1c8e6720 ACPI: resource: Add Asus Vivobook X1504VAP to irq1_level_low_skip_override[]
    be1e47be9eb4 ACPI: resource: Add TongFang GM5HG0A to irq1_edge_low_force_override[]
    dbbc17735a67 gpio: loongson: Fix Loongson-2K2000 ACPI GPIO register offset
    7f5a0124dc54 riscv: kprobes: Fix incorrect address calculation
    76ab0afcdbe8 riscv: Fix sleeping in invalid context in die()
    1ca9de8867a9 fs: kill MNT_ONRB
    569e203d364a smb: client: sync the root session and superblock context passwords before automounting
    bc1a711c28c6 arm64: dts: qcom: sa8775p: Fix the size of 'addr_space' regions
    6c3ed8bc34b4 arm64: dts: qcom: x1e80100: Fix up BAR space size for PCIe6a
    cfe32daafd6c sched_ext: idle: Refresh idle masks during idle-to-idle transitions
    11cb1d643a74 cgroup/cpuset: remove kernfs active break
    e7960da6f2f4 sched_ext: switch class when preempted by higher priority scheduler
    d9e446dd63ce sched_ext: Replace rq_lock() to raw_spin_rq_lock() in scx_ops_bypass()
    5b80f2fe8a34 thermal: of: fix OF node leak in of_thermal_zone_find()
    dc63fd2e473d cgroup/cpuset: Prevent leakage of isolated CPUs into sched domains
    4f0dd09ed300 drm/amd/display: Add check for granularity in dml ceil/floor helpers
    23af4d2c49d8 drm/amd/display: Remove unnecessary amdgpu_irq_get/put
    42ef932bad9b Revert "drm/mediatek: dsi: Correct calculation formula of PHY Timing"
    25adbb08aead btrfs: zlib: fix avail_in bytes for s390 zlib HW compression path
    38c229455b8b ksmbd: Implement new SMB3 POSIX type
    de8d6de0ee27 rds: sysctl: rds_tcp_{rcv,snd}buf: avoid using current->nsproxy
    bcf8c60074e8 sctp: sysctl: plpmtud_probe_interval: avoid using current->nsproxy
    5b77d73f3be5 sctp: sysctl: udp_port: avoid using current->nsproxy
    c184bc621e3c sctp: sysctl: auth_enable: avoid using current->nsproxy
    c87f1f6ade56 sctp: sysctl: rto_min/max: avoid using current->nsproxy
    f0bb39354706 sctp: sysctl: cookie_hmac_alg: avoid using current->nsproxy
    4c74fbdc5ab9 mptcp: sysctl: blackhole timeout: avoid using current->nsproxy
    6035702381c3 mptcp: sysctl: sched: avoid using current->nsproxy
    8d242069660a mptcp: sysctl: avail sched: remove write access
    fc8943886629 dm-verity FEC: Fix RS FEC repair for roots unaligned to block size (take 2)
    7ecee316f63e dm-ebs: don't set the flag DM_TARGET_PASSES_INTEGRITY
    8790d511d4ac fs: fix is_mnt_ns_file()
    adcde2872f8f fs: relax assertions on failure to encode file handles
    f3e8a16c23b2 vfio/pci: Fallback huge faults for unaligned pfn
    b1a38fe4789c scsi: ufs: qcom: Power off the PHY if it was already powered on in ufs_qcom_power_up_sequence()
    cbd0d5ecfa39 dm thin: make get_first_thin use rcu-safe list first function
    7ce916f4e975 drivers/perf: riscv: Return error for default case
    6191b1a474e1 drivers/perf: riscv: Fix Platform firmware event data
    3f545392e971 netfs: Fix read-retry for fs with no ->prepare_read()
    9f3a26583684 netfs: Fix kernel async DIO
    09b94ddc58c6 drm/xe: Fix tlb invalidation when wedging
    53a56817755e riscv: use local label names instead of global ones in assembly
    607b8740c6d7 riscv: stacktrace: fix backtracing through exceptions
    d2bd51954ac8 riscv: mm: Fix the out of bound issue of vmemmap address
    0ea7a3e44255 cpuidle: riscv-sbi: fix device node release in early exit of for_each_possible_cpu
    3825569af306 riscv: module: remove relocation_head rel_entry member allocation
    51669f4af5f7 ksmbd: fix unexpectedly changed path in ksmbd_vfs_kern_path_locked
    a8d99ce66b76 platform/x86: intel/pmc: Fix ioremap() of bad address
    b25778c87a6b platform/x86/amd/pmc: Only disable IRQ1 wakeup where i8042 actually enabled it
    7922b1f058fe afs: Fix the maximum cell name length
    2976e91a3e56 ksmbd: fix a missing return value check bug
    818bc75973ca drm/mediatek: Add return value check when reading DPCD
    10cf9bf247c5 gpio: virtuser: fix handling of multiple conn_ids in lookup table
    d72d0126b1f6 gpio: virtuser: fix missing lookup table cleanups
    c63bb54ece43 drm/mediatek: mtk_dsi: Add registers to pdata to fix MT8186/MT8188
    4efc06dbd668 drm/mediatek: Fix mode valid issue for dp
    c06dda11c517 drm/mediatek: Fix YCbCr422 color format issue for DP
    cc4bd3288832 drm/mediatek: stop selecting foreign drivers
    7a0300d3ee74 drm/mediatek: Add support for 180-degree rotation in the display driver
    411ba3c2203c drm/mediatek: Move mtk_crtc_finish_page_flip() to ddp_cmdq_cb()
    078b2ff7da20 drm/mediatek: Set private->all_drm_private[i]->drm to NULL if mtk_drm_bind returns err
    36124081f6ff net/mlx5: Fix variable not being completed when function returns
    5c0be5e688a8 rtase: Fix a check for error in rtase_alloc_msix()
    b04d33cdbc95 net: stmmac: dwmac-tegra: Read iommu stream id from device tree
    91bb18950b88 sched: sch_cake: add bounds checks to host bulk flow fairness counts
    f559357d0358 netfilter: conntrack: clamp maximum hashtable size to INT_MAX
    2e87c203b72f netfilter: nf_tables: imbalance in flowtable binding
    7475a3e353bc mctp i3c: fix MCTP I3C driver multi-thread issue
    f19ab3ef96d9 net: hns3: fix kernel crash when 1588 is sent on HIP08 devices
    0575baa733fc net: hns3: fixed hclge_fetch_pf_reg accesses bar space out of bounds issue
    13c11ca317f5 net: hns3: initialize reset_timer before hclgevf_misc_irq_init()
    bcf430d3bb55 net: hns3: don't auto enable misc vector
    864c1df2e379 net: hns3: Resolved the issue that the debugfs query result is inconsistent.
    713b9b0a0fc8 net: hns3: fix missing features due to dev->features configuration too early
    8b30ec384623 net: hns3: fixed reset failure issues caused by the incorrect reset type
    8b800ea3f380 tcp: Annotate data-race around sk->sk_mark in tcp_v4_send_reset
    cd4522bd3632 Bluetooth: btmtk: Fix failed to send func ctrl for MediaTek devices.
    49cd0ccacc7d Bluetooth: btnxpuart: Fix driver sending truncated data
    1f88b5313566 Bluetooth: MGMT: Fix Add Device to responding before completing
    ccc1ef188455 Bluetooth: hci_sync: Fix not setting Random Address when required
    e7e21d9c9fc8 eth: gve: use appropriate helper to set xdp_features
    52a24538d569 ipvlan: Fix use-after-free in ipvlan_get_iflink().
    9ea32dd90711 tls: Fix tls_sw_sendmsg error handling
    4cff50a8222b igc: return early when failing to read EECD register
    19dbf59fe190 ice: fix incorrect PHY settings for 100 GB/s
    6bda291e21f7 ice: fix max values for dpll pin phase adjust
    61b437faf2a7 net: don't dump Tx and uninitialized NAPIs
    17516b69d79d cxgb4: Avoid removal of uninserted tid
    f697217f980f bnxt_en: Fix DIM shutdown
    47360e567cc3 bnxt_en: Fix possible memory leak when hwrm_req_replace fails
    ce1e0f1c331d pds_core: limit loop over fw name list
    aee5f69f3e6c btrfs: avoid NULL pointer dereference if no valid extent tree
    db3cd503093e net: libwx: fix firmware mailbox abnormal return
    6fde663f7321 net_sched: cls_flow: validate TCA_FLOW_RSHIFT attribute
    e4a92f0d51c6 tcp/dccp: allow a connection when sk_max_ack_backlog is zero
    a3a9630d4d29 net: 802: LLC+SNAP OID:PID lookup on start of skb data
    1689f48b0a3b ieee802154: ca8210: Add missing check for kfifo_alloc() in ca8210_probe()
    0eec6abe74db selftests/alsa: Fix circular dependency involving global-timer
    7db7597f7b05 ASoC: mediatek: disable buffer pre-allocation
    13f3053c3154 ASoC: rt722: add delay time to wait for the calibration procedure
    3c7c90274ae3 ovl: support encoding fid from inode with no alias
    668d8dea2cee ovl: pass realinode to ovl_encode_real_fh() instead of realdentry
    c0f613f2148c fuse: respect FOPEN_KEEP_CACHE on opendir
    0bebeb6672cf exfat: fix the infinite loop in __exfat_free_cluster()
    942c6f91ab8d exfat: fix the new buffer was not zeroed before writing
    d9ea94f5cd11 exfat: fix the infinite loop in exfat_readdir()
    6f153055ba05 netfs: Fix is-caching check in read-retry
    ba37bdfe59fb netfs: Fix the (non-)cancellation of copy when cache is temporarily disabled
    43b8d3249b0b netfs: Fix ceph copy to cache on write-begin
    2c3348864ab7 netfs: Fix missing barriers by using clear_and_wake_up_bit()
    13a07cc81e2d nfs: Fix oops in nfs_netfs_init_request() when copying to cache
    88ecdfea1b33 netfs: Fix enomem handling in buffered reads
    30341be4a6d1 dm array: fix cursor index when skipping across block boundaries
    22443df885bf dm array: fix unreleased btree blocks on closing a faulty array cursor
    017c4470bff5 dm array: fix releasing a faulty array block twice in dm_array_cursor_end
    82c59a86a247 iomap: fix zero padding data issue in concurrent append writes
    7adf7df4bbc0 iomap: pass byte granular end position to iomap_add_to_ioend
    f40881bde8f6 fs/writeback: convert wbc_account_cgroup_owner to take a folio
    a5bc86861020 jbd2: flush filesystem device before updating tail sequence
    56c4353ce4b5 jbd2: increase IO priority for writing revoke records
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
index 85874b74a9..3a3e228bd7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "259cb3adc1a277c386c512449cad948e0f5420f0"
-SRCREV_meta ?= "538531267a60a7b5b7fcbccd659276d20f480677"
+SRCREV_machine ?= "f2ef371cec8f31a45c108756bfad162c622aaa3a"
+SRCREV_meta ?= "5d9c6c5b0531161f9e8e9d108740ebcec9177398"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.9"
+LINUX_VERSION ?= "6.12.10"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 1fe8a93339..097e1fc20a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.9"
+LINUX_VERSION ?= "6.12.10"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "4878dc2a6770f4ee8d47051e44dd43102e98a0ff"
-SRCREV_meta ?= "538531267a60a7b5b7fcbccd659276d20f480677"
+SRCREV_machine ?= "e2f65ce84a5423915adf9ef2be1e323fbb713916"
+SRCREV_meta ?= "5d9c6c5b0531161f9e8e9d108740ebcec9177398"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 1c1e8aedfc..a793637f90 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "518414bf1eda983dad94cfba3a205321e6f2b206"
-SRCREV_machine:qemuarm64 ?= "4878dc2a6770f4ee8d47051e44dd43102e98a0ff"
-SRCREV_machine:qemuloongarch64 ?= "4878dc2a6770f4ee8d47051e44dd43102e98a0ff"
-SRCREV_machine:qemumips ?= "c34fc7bf2a211653a87617851ef69c13b8cc7316"
-SRCREV_machine:qemuppc ?= "4878dc2a6770f4ee8d47051e44dd43102e98a0ff"
-SRCREV_machine:qemuriscv64 ?= "4878dc2a6770f4ee8d47051e44dd43102e98a0ff"
-SRCREV_machine:qemuriscv32 ?= "4878dc2a6770f4ee8d47051e44dd43102e98a0ff"
-SRCREV_machine:qemux86 ?= "4878dc2a6770f4ee8d47051e44dd43102e98a0ff"
-SRCREV_machine:qemux86-64 ?= "4878dc2a6770f4ee8d47051e44dd43102e98a0ff"
-SRCREV_machine:qemumips64 ?= "ef7cfae37a97b3c61f9127abcfe1307fdd56ec50"
-SRCREV_machine ?= "4878dc2a6770f4ee8d47051e44dd43102e98a0ff"
-SRCREV_meta ?= "538531267a60a7b5b7fcbccd659276d20f480677"
+SRCREV_machine:qemuarm ?= "2f251fc1043b18812b301628ec5ae1a1a0341bb7"
+SRCREV_machine:qemuarm64 ?= "e2f65ce84a5423915adf9ef2be1e323fbb713916"
+SRCREV_machine:qemuloongarch64 ?= "e2f65ce84a5423915adf9ef2be1e323fbb713916"
+SRCREV_machine:qemumips ?= "7ef0609e8d65a6a501cf521905fe6d6c3c20d190"
+SRCREV_machine:qemuppc ?= "e2f65ce84a5423915adf9ef2be1e323fbb713916"
+SRCREV_machine:qemuriscv64 ?= "e2f65ce84a5423915adf9ef2be1e323fbb713916"
+SRCREV_machine:qemuriscv32 ?= "e2f65ce84a5423915adf9ef2be1e323fbb713916"
+SRCREV_machine:qemux86 ?= "e2f65ce84a5423915adf9ef2be1e323fbb713916"
+SRCREV_machine:qemux86-64 ?= "e2f65ce84a5423915adf9ef2be1e323fbb713916"
+SRCREV_machine:qemumips64 ?= "f3de26417bfb0cf51627f2a4f9b86aaaaf42b781"
+SRCREV_machine ?= "e2f65ce84a5423915adf9ef2be1e323fbb713916"
+SRCREV_meta ?= "5d9c6c5b0531161f9e8e9d108740ebcec9177398"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "5996393469d99560b7845d22c9eff00661de0724"
+SRCREV_machine:class-devupstream ?= "a6ad5510dbb5f55cd2d1b44b11a18120bf79a5a3"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.9"
+LINUX_VERSION ?= "6.12.10"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


