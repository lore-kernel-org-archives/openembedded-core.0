Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD67BFC0377
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:45:43 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.769.1776959136007954157
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 08:45:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qB7dFsCl;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-50d6b9bca48so12765851cf.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 08:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776959135; x=1777563935; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dLTbf0kSVZPafNnMl49b49G1rixCTmBLGVQCIjccl+k=;
        b=qB7dFsClTT8b3oZLBGhBzls8ud1E5fh1wA83IC2KikdB0B5GCUwdC0cmSxJxtZlWbi
         jQMvP4nYCVyfs6+7ftRnY7mOpVTJPZdm89pWVj3BfMLSS3pToZ/qTnKDl+7/K6E8zmQa
         8G6Tj3X+SS7FDa3iv/A4qn3IQw4vuTROwIOjv/pvFtTw4/LOjeYGYND4SEbCY3O6o7Ux
         2GpEY0NDaW/+TWJNaZKI0YrjJFLgwyZd3tdl5gZTBo3bCIUgcjjuerSYwLYPZhJYKZSv
         IeMPHhoBsj3W3n+vJNMccLu7uveRGSOd8+CxyRfhfcXXA20XN3YB3zybCyKsObjAH/Xy
         3a6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776959135; x=1777563935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dLTbf0kSVZPafNnMl49b49G1rixCTmBLGVQCIjccl+k=;
        b=XGVs3gYpgqni4fCsobmSQdTBBgPY+r7n8qrQIdMhEuKqc6peFV7XdyPOLRAI1HpQUx
         YK0rl0/2hTTc+GwGDyEimtUxO/kBkXsS8/4aGy8L6zBpqhpaZN88OP3wpEF8CkFkf7eS
         Zd4f03duXe8gK736TivFA9FL3S2PD9IJwfmKIbb9ErYjfOSShG9BfACz5DSn9JRxI7z+
         UKDofI9vKJR0UYK6fEUH6K6A0J6mZrV9rXjW3WZtlSb4O8JzgizqqeT8NexIKCjw9QAr
         ZRtgon1nZtwmxT9Z07aQzYQLYf++KhpwXvBXCBYuWXVOF4A6oXAXNq1syAUg9//ozQRH
         hzUA==
X-Gm-Message-State: AOJu0YwKYKm9gKfb0kFN/KJmDX5zPXaiKcOYA0uWV7qA6e66FaQWBab0
	NWtvRkM4qzd5ObO3kdB7MynE0BUGDvLoCHHGvXsDQyPzOj1RjS07p0h1njDVTVTZ
X-Gm-Gg: AeBDieuCuTK24cMb2lygmomwyqmA4WWIAYK/61S6UG9EImCGQ6sivM/9Wss66Ezks9J
	dbIWobVx++g4maXceAoiHGGvIqkHlUzsSV2i59AWHhHYN6tRQK3ODbtP5vhrobHZkUlF4cSGNK8
	EQmp0U2x+otONLdcqqTLs95irGGvys4xCyU//Fqf2eYB9hdZDIREscFBmp+t180w2gQTPdZ11rK
	v3wo1a9TpC+nYaG11ZqK/vCar/8ZUKJXzlrlRTbIMiqZxPRVOufVodcplWVmspIjzyARC5KItAM
	sYtl0yI988aWFvaM4IbtCn4J5dNzqd7lZu6HrV13jTgJ31Q7WkgBt11hG3OEStlp2rsNmBqh6/p
	aUP9ZSNTOQIK+2E5x+jabbbK2JpoBvjr1CEmnLNcz4maE03ibcQBFSP9HNmYOIGJnhFC/oD37dS
	uKa8JUEVXOQhkWhiKPXikg09d6QTwSqRzPDsP6/zq21jWV+BzJP/wlLFy5lzfuvZsdGjf65XQKQ
	n+cvYcn/PUHxT24veBZEek4D35Ang5cOZ9QZbDbTiKg0rcfNrmQ6CtB7+oY8Z1V1c8ieA==
X-Received: by 2002:a05:622a:a48f:b0:50e:5a9d:fb9a with SMTP id d75a77b69052e-50e5a9dfdc8mr277560131cf.15.1776959134704;
        Thu, 23 Apr 2026 08:45:34 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50fb416b3f5sm74400031cf.28.2026.04.23.08.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:45:32 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
Subject: [openembedded-core][whinlatter][PATCH 15/18] linux-yocto/6.12: update to v6.12.81
Date: Thu, 23 Apr 2026 11:45:06 -0400
Message-ID: <20260423154509.1933646-16-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423154509.1933646-1-bruce.ashfield@gmail.com>
References: <20260423154509.1933646-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 15:45:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235814

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    e7a3953084a70 Linux 6.12.81
    787781697f216 selftests/bpf: test refining u32/s32 bounds when ranges cross min/max boundary
    ded1ea20d0b77 bpf: Fix u32/s32 bounds when ranges cross min/max boundary
    58d4c4a257ad4 bpf: Add third round of bounds deduction
    d7a73ec8015bc selftests/bpf: Test invariants on JSLT crossing sign
    269d80981a5c7 selftests/bpf: Test cross-sign 64bits range refinement
    d7d7b4879d994 bpf: Improve bounds when s64 crosses sign boundary
    3708bea44e732 drm/amd/display: Correct logic check error for fastboot
    4ab0ca29df9af drm/amd: Disable ASPM on SI
    2b5a2083c9eb7 drm/amd/display: Disable scaling on DCE6 for now
    3ab5be94925f4 drm/amd/display: Adjust DCE 8-10 clock, don't overclock by 15%
    85229e17e8d7e drm/amd/display: Fix DCE 6.0 and 6.4 PLL programming.
    fd1b69d047a4a drm/amd/display: Keep PLL0 running on DCE 6.0 and 6.4
    207b18daaae25 drm/amd/display: Disable fastboot on DCE 6 too
    1f9b3e72fd7da drm/amd/amdgpu: disable ASPM in some situations
    8f187036a3e65 drm/amd/amdgpu: decouple ASPM with pcie dpm
    2145a80f47cd5 x86/CPU/AMD: Add additional fixed RDSEED microcode revisions
    f496eee88c605 MPTCP: fix lock class name family in pm_nl_create_listen_socket
    ac69fbda177f3 s390/cpum_sf: Cap sampling rate to prevent lsctl exception
    a1d24d8e59c8d s390/perf_cpum_sf: Convert to use try_cmpxchg128()
    e76bcb727e487 ext4: publish jinode after initialization
    38bac39274a3a drm/amd/pm: disable OD_FAN_CURVE if temp or pwm range invalid for smu v13
    2b307be747cf7 mm/memory: fix PMD/PUD checks in follow_pfnmap_start()
    9bcbf9ae7db8b mm: replace READ_ONCE() with standard page table accessors
    b8c49ad888892 mm/huge_memory: fix folio isn't locked in softleaf_to_folio()
    70cad63b3bc63 x86/fred: Fix early boot failures on SEV-ES/SNP guests
    7cbd69aaa507b scsi: target: tcm_loop: Drain commands in target_reset handler
    43f5b19fd190f net: mana: fix use-after-free in add_adev() error path
    33670f780e012 net: correctly handle tunneled traffic on IPV6_CSUM GSO fallback
    022e3d4112afa spi: cadence-qspi: Fix exec_mem_op error handling
    c5fa98842783e wifi: virt_wifi: remove SET_NETDEV_DEV to avoid use-after-free
    be2d32f0c3fe3 usb: gadget: f_uac1_legacy: validate control request size
    f7d00ee1c8082 usb: gadget: f_hid: move list and spinlock inits from bind to alloc
    1ef251aa63972 usb: gadget: f_rndis: Fix net_device lifecycle with device_move
    70707ce668494 usb: gadget: f_subset: Fix net_device lifecycle with device_move
    a6b8bce01a30a usb: gadget: f_eem: Fix net_device lifecycle with device_move
    5eaeac22240d9 usb: gadget: f_ecm: Fix net_device lifecycle with device_move
    7d8fa3b8783ab usb: gadget: f_rndis: Protect RNDIS options with mutex
    cc8ec610cd14c usb: gadget: f_subset: Fix unbalanced refcnt in geth_free
    8a1128d604c36 usb: gadget: uvc: fix NULL pointer dereference during unbind race
    0326429e8ba99 usb: gadget: u_ether: Fix NULL pointer deref in eth_get_drvinfo
    bbb09bb89ffa5 usb: gadget: u_ether: Fix race between gether_disconnect and eth_stop
    0a1fbbd780f04 btrfs: do not free data reservation in fallback from inline due to -ENOSPC
    b6310d040d715 btrfs: fix the qgroup data free range for inline data extents
    b23282218eca2 ice: Fix memory leak in ice_set_ringparam()
    f6dcbf2b024d5 usb: typec: ucsi: validate connector number in ucsi_notify_common()
    bc9e80feec629 usb: gadget: dummy_hcd: fix premature URB completion when ZLP follows partial transfer
    94d4fab1dd9e6 USB: dummy-hcd: Fix interrupt synchronization error
    805b1833d6ed6 USB: dummy-hcd: Fix locking/synchronization error
    d35df146eff91 thunderbolt: Fix property read in nhi_wake_supported()
    0bdee4118340c misc: fastrpc: possible double-free of cctx->remote_heap
    604da9c04c218 thermal: core: Fix thermal zone device registration error path
    bc49d5a3c049a gpio: mxc: map Both Edge pad wakeup to Rising Edge
    427d048e4f6ac cpufreq: governor: fix double free in cpufreq_dbs_governor_init() error path
    0b832aad33e6f net: ethernet: mtk_ppe: avoid NULL deref when gmac0 is disabled
    d45230081f19c net: ftgmac100: fix ring allocation unwind on open failure
    de20d2e3b9179 vxlan: validate ND option lengths in vxlan_na_create
    bdbf027a4504b crypto: tegra - Add missing CRYPTO_ALG_ASYNC
    633dfbf0eb276 counter: rz-mtu3-cnt: do not use struct rz_mtu3_channel's dev member
    ced8b48420edd counter: rz-mtu3-cnt: prevent counter from being toggled multiple times
    b7eef00f08b92 netfilter: ipset: drop logically empty buckets in mtype_del
    2f6e5b9964d0a nvmem: zynqmp_nvmem: Fix buffer size in DMA and memcpy
    9c01cfe54a7d2 nvmem: imx: assign nvmem_cell_info::raw_len
    5de15580ef147 dt-bindings: connector: add pd-disable dependency
    cad3327ab50d9 firmware: microchip: fail auto-update probe if no flash found
    99f31aa98ab6e comedi: me4000: Fix potential overrun of firmware buffer
    1bf8761eb59e9 comedi: me_daq: Fix potential overrun of firmware buffer
    3848ae00b1642 comedi: ni_atmio16d: Fix invalid clean-up after failed attach
    430291d8f3884 comedi: Reinit dev->spinlock between attachments to low-level drivers
    65c528fbeddd8 comedi: dt2815: add hardware detection to prevent crash
    f0e520784d5ac cdc-acm: new quirk for EPSON HMD
    c49b9256bbacb bridge: br_nd_send: validate ND option lengths
    0b7f1d1352e46 Revert "LoongArch/orc: Use RCU in all users of __module_address()."
    8eb219e34da19 Revert "LoongArch: Remove unnecessary checks for ORC unwinder"
    c471e3ae674f5 Revert "LoongArch: Handle percpu handler address for ORC unwinder"
    c7e475ae3a559 usb: cdns3: gadget: fix state inconsistency on gadget init failure
    d61446dfc9d38 usb: cdns3: gadget: fix NULL pointer dereference in ep_queue
    af0d688a8d55d usb: core: phy: avoid double use of 'usb3-phy'
    4ed9d2dd9f298 usb: dwc2: gadget: Fix spin_lock/unlock mismatch in dwc2_hsotg_udc_stop()
    874c95ebbe595 usb: ehci-brcm: fix sleep during atomic
    d13318dec0c1e usb: usbtmc: Flush anchored URBs in usbtmc_release
    8763f8317bb38 usb: ulpi: fix double free in ulpi_register_interface() error path
    f8f45359f9682 usb: quirks: add DELAY_INIT quirk for another Silicon Motion flash drive
    f5a6a5f412b3f iio: gyro: mpu3050: Fix out-of-sequence free_irq()
    92f18aa86302f iio: gyro: mpu3050: Move iio_device_register() to correct location
    b52fd1644ad2c iio: gyro: mpu3050: Fix irq resource leak
    8631e755fc07b iio: gyro: mpu3050: Fix incorrect free_irq() variable
    10ec3158d4719 iio: imu: st_lsm6dsx: Set FIFO ODR for accelerometer and gyroscope only
    42d4e0d4f12cd iio: imu: bmi160: Remove potential undefined behavior in bmi160_config_pin()
    b64050f926145 iio: light: vcnl4035: fix scan buffer on big-endian
    87a2fb7162d3f iio: dac: ad5770r: fix error return in ad5770r_read_raw()
    6c122c911e405 iio: accel: adxl380: fix FIFO watermark bit 8 always written as 0
    4f420f4b46e7d iio: accel: fix ADXL355 temperature signature value
    acdeaf1dea613 iio: adc: aspeed: clear reference voltage bits before configuring vref
    f3f9c94e504fa Input: xpad - add support for Razer Wolverine V3 Pro
    2348168b7d71d Input: xpad - add support for BETOP BTP-KP50B/C controller's wireless mode
    ff809b77f4cfb Input: bcm5974 - recover from failed mode switch
    c9e103994e33e Input: i8042 - add TUXEDO InfinityBook Max 16 Gen10 AMD to i8042 quirk table
    86f10a395325b Input: synaptics-rmi4 - fix a locking bug in an error path
    3ac9c06f80ada USB: core: add NO_LPM quirk for Razer Kiyo Pro webcam
    5a19500e3461b USB: serial: option: add support for Rolling Wireless RW135R-GL
    2a8f48cd3c6e2 USB: serial: io_edgeport: add support for Blackbox IC135A
    79129c94aa8a0 drm/amdgpu/pm: drop SMU driver if version not matched messages
    6b2614a0ff05a drm/amdgpu: Change AMDGPU_VA_RESERVED_TRAP_SIZE to 64KB
    890ee92cc4fd9 drm/i915/dp: Use crtc_state->enhanced_framing properly on ivb/hsw CPU eDP
    55efe8402f46a drm/i915/dsi: Don't do DSC horizontal timing adjustments in command mode
    9c40e6294756a drm/ast: dp501: Fix initialization of SCU2C
    7685e0e3e3448 iio: adc: ti-ads1119: Replace IRQF_ONESHOT with IRQF_NO_THREAD
    054836eecc469 iio: adc: ti-ads1119: Reinit completion before wait_for_completion_timeout()
    1da4cf3a06c37 iio: adc: ti-ads1119: Fix unbalanced pm reference count in ds1119_single_conversion()
    67b3a91bdc482 iio: adc: ti-adc161s626: use DMA-safe memory for spi_read()
    6165d8d71ce8a iio: adc: ti-adc161s626: fix buffer read on big-endian
    93ca9febac89b drm/amdgpu: fix the idr allocation flags
    6e965c91983a8 mips: mm: Allocate tlb_vpn array atomically
    bbbefc48f6617 hwmon: (occ) Fix division by zero in occ_show_power_1()
    a8d2212538051 MIPS: Fix the GCC version check for `__multi3' workaround
    ab9a172ca0822 MIPS: SiByte: Bring back cache initialisation
    d48c64fb80ad7 ksmbd: fix OOB write in QUERY_INFO for compound requests
    f5d446624345d Bluetooth: hci_sync: fix stack buffer overflow in hci_le_big_create_sync
    c8ff0ca650853 Bluetooth: SMP: force responder MITM requirements before building the pairing response
    0afc846bd8007 Bluetooth: SMP: derive legacy responder STK authentication from MITM state
    90ced24c500ad io_uring/net: fix slab-out-of-bounds read in io_bundle_nbufs()
    a0b45bdfffce9 ALSA: ctxfi: Fix missing SPDIFI1 index handling
    3178b62e2e31b ALSA: caiaq: fix stack out-of-bounds read in init_card
    84f3fab430d85 USB: serial: option: add MeiG Smart SRM825WN
    e67d8c626ace8 wifi: iwlwifi: mvm: fix potential out-of-bounds read in iwl_mvm_nd_match_info_handler()
    c97b2a0005960 wifi: wilc1000: fix u8 overflow in SSID scan buffer size calculation
    4a41c2b18fc05 drm/ioc32: stop speculation on the drm_compat_ioctl path
    c289154aef97f riscv: kgdb: fix several debug register assignment bugs
    c089147074ed9 sched/fair: Fix zero_vruntime tracking fix
    6277998e3abce sched/fair: Use protect_slice() instead of direct comparison
    e8fd60338545f mips: ralink: update CPU clock index
    2c9b408807bc5 hwmon: (occ) Fix missing newline in occ_show_extended()
    5fb6dd8beeefa hwmon: (tps53679) Fix device ID comparison and printing in tps53676_identify()
    f286132539060 dt-bindings: gpio: fix microchip #interrupt-cells
    7fd4a5682c788 hwmon: (ltc4286) Add missing MODULE_IMPORT_NS("PMBUS")
    96878fbb37bfe hwmon: (pxe1610) Check return value of page-select write in probe
    08021f2d4a557 accel/qaic: Handle DBC deactivation if the owner went away
    931d71104fd71 iio: imu: bno055: fix BNO055_SCAN_CH_COUNT off by one
    8624e819a2dcf Revert "drm: Fix use-after-free on framebuffers and property blobs when calling drm_dev_unplug"
    70abd9d118da2 bpf: reject direct access to nullable PTR_TO_BUF pointers
    63fda74885555 ipv6: avoid overflows in ip6_datagram_send_ctl()
    c1ed6d68fbe17 net: hsr: fix VLAN add unwind on slave errors
    9bf5fc36a43f7 net/sched: cls_flow: fix NULL pointer dereference on shared blocks
    5cf41031922c1 net/sched: cls_fw: fix NULL pointer dereference on shared blocks
    4e2d1bcef78d2 net/x25: Fix overflow when accumulating packets
    524371398d846 net/x25: Fix potential double free of skb
    0856789f6064a bnxt_en: Restore default stat ctxs for ULP when resource is available
    2ebb13f3e8be0 net/mlx5: Fix switchdev mode rollback in case of failure
    d22c8bb054dc0 net/mlx5: Avoid "No data available" when FW version queries fail
    cfa774e6c920c net/mlx5: lag: Check for LAG device before creating debugfs
    e35dbfdb1b771 net: macb: properly unregister fixed rate clocks
    f310a836da90d net: macb: fix clk handling on PCI glue driver removal
    13a66ca1e235d net/sched: sch_netem: fix out-of-bounds access in packet corruption
    68187f18a89be bpf: sockmap: Fix use-after-free of sk->sk_socket in sk_psock_verdict_data_ready().
    a5bfd14c9a299 rds: ib: reject FRMR registration before IB connection is established
    0b706fb2294af Bluetooth: MGMT: validate mesh send advertising payload length
    7cadb03be37e7 Bluetooth: hci_event: fix potential UAF in hci_le_remote_conn_param_req_evt
    66d432e9b45ba Bluetooth: hci_conn: fix potential UAF in set_cig_params_sync
    82f342b3b006c Bluetooth: MGMT: validate LTK enc_size on load
    7e296ffdab5bd Bluetooth: SCO: fix race conditions in sco_sock_connect()
    94445b8517a0b Bluetooth: hci_sync: call destroy in hci_cmd_sync_run if immediate
    f710691be163a netfilter: nf_tables: reject immediate NF_QUEUE verdict
    e7e1b6bcb389c netfilter: x_tables: restrict xt_check_match/xt_check_target extensions for NFPROTO_ARP
    0f6c33697ccfa netfilter: ctnetlink: ignore explicit helper on new expectations
    f8cebc41afd89 netfilter: nf_conntrack_expect: store netns and zone in expectation
    4bd1b3d839172 netfilter: nf_conntrack_expect: use expect->helper
    afd5afd32ba82 netfilter: nf_conntrack_expect: honor expectation helper field
    fd002ff2ea030 netfilter: ctnetlink: zero expect NAT fields when CTA_EXPECT_NAT absent
    2c16e4d64dd91 netfilter: nf_conntrack_helper: pass helper to expect cleanup
    69acb09ef957c netfilter: ipset: use nla_strcmp for IPSET_ATTR_NAME attr
    673bbd36cba21 netfilter: x_tables: ensure names are nul-terminated
    6b419700e459f netfilter: nfnetlink_log: account for netlink header size
    57c78bd2e2dd0 netfilter: flowtable: strictly check for maximum number of actions
    8027964931785 net: ipv6: flowlabel: defer exclusive option free until RCU teardown
    7241da033fdc5 bpf: Fix regsafe() for pointers to packet
    8b079642413d6 ASoC: Intel: boards: fix unmet dependency on PINCTRL
    6a2124da900a3 net: xilinx: axienet: Correct BD length masks to match AXIDMA IP spec
    f48ab6ee654ec NFC: pn533: bound the UART receive buffer
    d6db08484c6cb net: sched: cls_api: fix tc_chain_fill_node to initialize tcm_info to zero to prevent an info-leak
    f7a6cd508e9e8 net: use skb_header_pointer() for TCPv4 GSO frag_off check
    c3c09b7b771d4 net: introduce mangleid_features
    cce5027f9dc3a net: airoha: Add missing cleanup bits in airoha_qdma_cleanup_rx_queue()
    25357b670afb5 ipv6: prevent possible UaF in addrconf_permanent_addr()
    4045b72a0853f ASoC: ep93xx: Fix unchecked clk_prepare_enable() and add rollback on failure
    fdaa12c6682c0 net: enetc: check whether the RSS algorithm is Toeplitz
    76dfdcef11199 net: sfp: Fix Ubiquiti U-Fiber Instant SFP module on mvneta
    b9e6431cbea8b net/sched: sch_hfsc: fix divide-by-zero in rtsc_min()
    2ba4caba423ed bridge: br_nd_send: linearize skb before parsing ND options
    f513cdd55a480 eth: fbnic: Account for page fragments when updating BDQ tail
    1063515ce15ff ip6_tunnel: clear skb2->cb[] in ip4ip6_err()
    e41953e7d118e ipv6: icmp: clear skb2->cb[] in ip6_err_gen_icmpv6_unreach()
    d8ce8e2dfd32c tg3: Fix race for querying speed/duplex
    77695a69baca9 net/ipv6: ioam6: prevent schema length wraparound in trace fill
    4f810c686fde5 net: ipv6: ndisc: fix ndisc_ra_useropt to initialize nduseropt_padX fields to zero to prevent an info-leak
    69402908e277d net: qrtr: replace qrtr_tx_flow radix_tree with xarray to fix memory leak
    5eb37a39ae80d net: fec: fix the PTP periodic output sysfs interface
    44eafa39363e8 crypto: af-alg - fix NULL pointer dereference in scatterwalk
    c2fb4984fe09f crypto: caam - fix overflow on long hmac keys
    c0c133e0225d8 crypto: caam - fix DMA corruption on long hmac keys
    08020567bf5fa wifi: ath11k: Pass the correct value of each TID during a stop AMPDU session
    368bcaa8f3a03 dt-bindings: auxdisplay: ht16k33: Use unevaluatedProperties to fix common property warning
    35783cb13a25e spi: geni-qcom: Check DMA interrupts early in ISR
    53ceedd1eb628 btrfs: reject root items with drop_progress and zero drop_level
    2b3cc69a318eb i2c: tegra: Don't mark devices with pins as IRQ safe
    bb6eb33c908ed btrfs: reserve enough transaction items for qgroup ioctls
    6a4acd3e86fe5 HID: multitouch: Check to ensure report responses match the request
    772f99cc8d6e5 HID: logitech-hidpp: Prevent use-after-free on force feedback initialisation failure
    e3da29787887c objtool: Fix Clang jump table detection
    ab319b5a8bca4 tg3: replace placeholder MAC address with device property
    7eb0da6455986 btrfs: don't take device_list_mutex when querying zone info
    3989740fa4978 atm: lec: fix use-after-free in sock_def_readable()
    41026bcc0fdf8 HID: wacom: fix out-of-bounds read in wacom_intuos_bt_irq
    8148c2fda4ebb wifi: mac80211: check tdls flag in ieee80211_tdls_oper
    194c2e93e5ae2 HID: logitech-hidpp: Enable MX Master 4 over bluetooth
    c4bcd4a10edd3 arm64/scs: Fix handling of advance_loc4
    fd65688547c99 io_uring/kbuf: propagate BUF_MORE through early buffer commit path
    1593101304e64 io_uring/kbuf: fix missing BUF_MORE for incremental buffers at EOF
    4399febfb1166 io_uring/kbuf: use WRITE_ONCE() for userspace-shared buffer ring fields
    612c324f63965 io_uring/kbuf: use READ_ONCE() for userspace-mapped memory
    91f262ea2a76a io_uring/kbuf: always use READ_ONCE() to read ring provided buffer lengths
    c4dbca5be33c6 io_uring/kbuf: enable bundles for incrementally consumed buffers
    341d13c23f79f io_uring/rw: check for NULL io_br_sel when putting a buffer
    c16afaebfdc65 io_uring/net: correct type for min_not_zero() cast
    015f7e0507f40 io_uring: remove async/poll related provided buffer recycles
    1249eae601f98 io_uring/kbuf: switch to storing struct io_buffer_list locally
    7ba8b025035bb io_uring/net: use struct io_br_sel->val as the send finish value
    72f60a59ef4ce io_uring/net: use struct io_br_sel->val as the recv finish value
    0f045bf7287d3 io_uring/kbuf: use struct io_br_sel for multiple buffers picking
    06877b3a72455 io_uring/kbuf: introduce struct io_br_sel
    ac6c9a9e5082a io_uring/kbuf: pass in struct io_buffer_list to commit/recycle helpers
    e6f280230e401 io_uring/net: clarify io_recv_buf_select() return value
    f7a76e3adf03f io_uring/net: don't use io_net_kbuf_recyle() for non-provided cases
    c0cdc6a0e9851 io_uring/kbuf: drop 'issue_flags' from io_put_kbuf(s)() arguments
    c6d48713644bf io_uring/kbuf: uninline __io_put_kbufs
    e802d79d11ce7 io_uring/kbuf: introduce io_kbuf_drop_legacy()
    bfd4739463ec4 io_uring/kbuf: open code __io_put_kbuf()
    55de36310adce io_uring/kbuf: remove legacy kbuf caching
    3fb42ddddfb17 io_uring/kbuf: simplify __io_put_kbuf
    badb3134c9113 io_uring/kbuf: remove legacy kbuf kmem cache
    0e2e453f31359 io_uring/kbuf: remove legacy kbuf bulk allocation

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 4c754bcd21..5a7d17c21e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -15,13 +15,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "682f6c2088ea37c1dcc324905956034eda630d52"
-SRCREV_meta ?= "8bb0dbe2b50860402b07a506a5aa3a4ef7aba0a7"
+SRCREV_machine ?= "4277a7a5b623fcf652c3c73d77baa1fc15c1faf4"
+SRCREV_meta ?= "b507ba98ba3ecc385b14a231dddafaea3421f778"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.80"
+LINUX_VERSION ?= "6.12.81"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index d760030c21..533da7130b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.80"
+LINUX_VERSION ?= "6.12.81"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "18e0f76d6fff9522f4df78a484d68e814999b29a"
-SRCREV_meta ?= "8bb0dbe2b50860402b07a506a5aa3a4ef7aba0a7"
+SRCREV_machine ?= "bd0143fa06a31c277c6fba5d06f84e1165e734e5"
+SRCREV_meta ?= "b507ba98ba3ecc385b14a231dddafaea3421f778"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index c50dc6dfac..e48084fcd3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "dd1da548895086a19df2c3fc9586999789081636"
-SRCREV_machine:qemuarm64 ?= "18e0f76d6fff9522f4df78a484d68e814999b29a"
-SRCREV_machine:qemuloongarch64 ?= "18e0f76d6fff9522f4df78a484d68e814999b29a"
-SRCREV_machine:qemumips ?= "14123935e5dd112c3a4daa4c5a756b82298ecf4d"
-SRCREV_machine:qemuppc ?= "18e0f76d6fff9522f4df78a484d68e814999b29a"
-SRCREV_machine:qemuriscv64 ?= "18e0f76d6fff9522f4df78a484d68e814999b29a"
-SRCREV_machine:qemuriscv32 ?= "18e0f76d6fff9522f4df78a484d68e814999b29a"
-SRCREV_machine:qemux86 ?= "18e0f76d6fff9522f4df78a484d68e814999b29a"
-SRCREV_machine:qemux86-64 ?= "18e0f76d6fff9522f4df78a484d68e814999b29a"
-SRCREV_machine:qemumips64 ?= "d6af6b480ab453a08f04ce80ab25a131f54f8e34"
-SRCREV_machine ?= "18e0f76d6fff9522f4df78a484d68e814999b29a"
-SRCREV_meta ?= "8bb0dbe2b50860402b07a506a5aa3a4ef7aba0a7"
+SRCREV_machine:qemuarm ?= "54a370021957bfa24b4580a75518248174890205"
+SRCREV_machine:qemuarm64 ?= "bd0143fa06a31c277c6fba5d06f84e1165e734e5"
+SRCREV_machine:qemuloongarch64 ?= "bd0143fa06a31c277c6fba5d06f84e1165e734e5"
+SRCREV_machine:qemumips ?= "0b864eeca749237236d8ec10e7ed373958f497c4"
+SRCREV_machine:qemuppc ?= "bd0143fa06a31c277c6fba5d06f84e1165e734e5"
+SRCREV_machine:qemuriscv64 ?= "bd0143fa06a31c277c6fba5d06f84e1165e734e5"
+SRCREV_machine:qemuriscv32 ?= "bd0143fa06a31c277c6fba5d06f84e1165e734e5"
+SRCREV_machine:qemux86 ?= "bd0143fa06a31c277c6fba5d06f84e1165e734e5"
+SRCREV_machine:qemux86-64 ?= "bd0143fa06a31c277c6fba5d06f84e1165e734e5"
+SRCREV_machine:qemumips64 ?= "20f68d6b803a62b9bd958a453a669cd9ac75d22a"
+SRCREV_machine ?= "bd0143fa06a31c277c6fba5d06f84e1165e734e5"
+SRCREV_meta ?= "b507ba98ba3ecc385b14a231dddafaea3421f778"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "00d7934ffcc35e65b113ba4991c8a3338bd85fc1"
+SRCREV_machine:class-devupstream ?= "e7a3953084a7050ca349010deb22546834c2e196"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.80"
+LINUX_VERSION ?= "6.12.81"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


