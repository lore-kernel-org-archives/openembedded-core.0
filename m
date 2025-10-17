Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39863CCD1A4
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 20:44:34 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.3342.1760733865994092437
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 13:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MxIdPYSC;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-781997d195aso1872996b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 13:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760733865; x=1761338665; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JFbWHQfD7Ru0TIpTQvziphVJDHkSEvnG8siMMfVVAgQ=;
        b=MxIdPYSCs00fp/m3B6Hx8kKskTERiWA6Sm3mIFo9kP/JEWTkBQd8hQqcY97K/y/RV2
         ujxd5j2GlgKMEdwf0bEg9HosDZjuC40MBdR1hxZcim5ic6KDBuF9M68tZIPvd3nra+TF
         pv8+gqLHrH8GMIIuPCFodmzAA42AV06pNPd4OTuNQpD+BPPFo6cfTiU85ZdsaXhXpJoF
         L0nBDWqfL43wBysio2xSBBANAWIOKy687HdajSKZ4+ILR8/fsy2sfKdVfhU/EOJJZ8mi
         N+Z+pv6sEPPv8UdK2Xvk3cXxmDnyn3nbZ0avaaEcqdYQlAeSpeA96UsVIpPjya9cFChe
         CMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733865; x=1761338665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JFbWHQfD7Ru0TIpTQvziphVJDHkSEvnG8siMMfVVAgQ=;
        b=o8osRyV74IUwl17k2pSKKgLaL7NAxLrO2R52lkDFsRTvtBnxH6YEgdynT7ruYUbSnD
         xhv3wuiMf6DhaOsetbWutPr1EeW9VZLZUvIlcIPBHAFwbvLfsBtJck3RpP3dW652J4M/
         DYeG7DOGazuLX+X6HQDUZwL9iWKkEKxFUWoWkmboOghCpRJhWMMDqQQrSwKcdE3IAEmK
         xg+MgSukG+FXwqgvCsSov12hDCqhzTjkxh+NoSDiULOlhJjPnBtUkiOtdpIHTTWcVV4L
         ugbVs16G+M71ghvET3fZ6sfIpq3inwegLAfJf1NCVGGDvrGHvS70LkjdXTP+YPsq/B6n
         le1Q==
X-Gm-Message-State: AOJu0YxNptrKEG0z6u7ZwYLqU6rWlPym8QdSar2U/y8sU04gH0vU0PvB
	tT37Eb3n6U+qY9tR8EXB1Yf19tNF9afI8GNR985gYfMl/ROGBE3glz3/qjFLg01TPL70WSmtKko
	CT9vvRcM=
X-Gm-Gg: ASbGnctYf46FZStNft5oifPtXI/QLa/qOm1h6Gi7Fsb0BaV2dljNFOuIK8aIOTF+yUD
	ukcbLyCTINq+GB4nO406H1c+zeSGWubY9wVBUgx7NHjycu5DaJVUJTS85SreCJuYH3PqlfRAjhP
	HNcY25IpopcIR1QIdx3Urd1i3tcUDCgEfOcQbgf6NIJJ2r9/fkSwtZSm42UhheWuVXU7cM7/Ivg
	9si5wZtYaQE7N8cVveBTzNNAfBtstEoRBWePnvpw7iSV+UcJzuukqzfOeu11CPQPI+ZjufCOonw
	zvzn1YL2gXl+wYaMkluwIUQeXqN7oWrskGRcy1xpXQtfK/yB9/YY7MdkuN5hUGYqFF/uB3dh944
	sd+nhvDR4FKXkc2ReJ5C3djZK4XRpN7SgrUFRardghxQLskc17v4EH9fYWsNAYpyaleSmXcQpv4
	pu
X-Google-Smtp-Source: AGHT+IGpY3kH5YsdPgywKvmbMTD6yhgIxiFW6qAisZd77gWWG6oeWWM+SUNCHofMaV470b6cb/uwQQ==
X-Received: by 2002:a05:6a20:918a:b0:32b:71e9:81ae with SMTP id adf61e73a8af0-334a850dcc4mr6915176637.8.1760733864292;
        Fri, 17 Oct 2025 13:44:24 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:aaee:e640:34cd:6f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a230121ebfsm477066b3a.70.2025.10.17.13.44.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:44:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/8] linux-yocto/5.15: update to v5.15.193
Date: Fri, 17 Oct 2025 13:44:05 -0700
Message-ID: <bd8a3bdbd78f806b4a3077de8ae7aa3bc00511fc.1760733724.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760733724.git.steve@sakoman.com>
References: <cover.1760733724.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 20:44:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225067

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

no ids found, dumping:
    43bb85222e53 Linux 5.15.193
    70de678302a8 x86/vmscape: Add old Intel CPUs to affected list
    79ec330d124e x86/vmscape: Warn when STIBP is disabled with SMT
    1cd71b057f05 x86/bugs: Move cpu_bugs_smt_update() down
    2f4f2f8f860c x86/vmscape: Enable the mitigation
    d5490dfa3542 x86/vmscape: Add conditional IBPB mitigation
    f2ed886bb650 x86/vmscape: Enumerate VMSCAPE bug
    a4fff4e5c054 Documentation/hw-vuln: Add VMSCAPE documentation
    de9476bb4f1b Linux 5.15.192
    3e7c1c70abf2 dmaengine: mediatek: Fix a flag reuse error in mtk_cqdma_tx_status()
    b521afbe4525 spi: tegra114: Use value to check for invalid delays
    ffe9232693e3 clk: qcom: gdsc: Set retain_ff before moving to HW CTRL
    b01a706f9e73 perf bpf-event: Fix use-after-free in synthesis
    43167766ea1b drm/bridge: ti-sn65dsi86: fix REFCLK setting
    f2e6b997632d spi: spi-fsl-lpspi: Reset FIFO and disable module on transfer abort
    18fac6162dda spi: spi-fsl-lpspi: Set correct chip-select polarity bit
    5255b997529b spi: spi-fsl-lpspi: Fix transmissions when using CONT
    85be7ef8c8e7 pcmcia: Add error handling for add_interval() in do_validate_mem()
    271ed980d57d ALSA: hda/hdmi: Add pin fix for another HP EliteDesk 800 G4 model
    7e287256904e mm/slub: avoid accessing metadata when pointer is invalid in object_err()
    8b9a5269b442 randstruct: gcc-plugin: Fix attribute addition
    db44404d1b9b randstruct: gcc-plugin: Remove bogus void member
    4da1cc986b75 arm64: dts: marvell: uDPU: define pinctrl state for alarm LEDs
    85530b4ec374 vmxnet3: update MTU after device quiesce
    a82c31b8e9b6 net: dsa: microchip: linearize skb for tail-tagging switches
    01ea671f1f2b net: dsa: microchip: update tag_ksz masks for KSZ9477 family
    6db1f39f003c dmaengine: mediatek: Fix a possible deadlock error in mtk_cqdma_tx_status()
    d0b7f11dd68b dma-buf: insert memory barrier before updating num_fences
    b336106f04a2 gpio: pca953x: fix IRQ storm on system wake up
    1d7def97e7eb iio: light: opt3001: fix deadlock due to concurrent flag access
    28e4e1b59a34 iio: chemical: pms7003: use aligned_s64 for timestamp
    66dc11e9c28f spi: tegra114: Don't fail set_cs_timing when delays are zero
    45eef6be830e spi: tegra114: Remove unnecessary NULL-pointer checks
    b9f28182e29e KVM: x86: Take irqfds.lock when adding/deleting IRQ bypass producer
    c824d766e472 cpufreq/sched: Explicitly synchronize limits_changed flag handling
    abdf3c339181 mm/khugepaged: fix ->anon_vma race
    99a8772611e2 e1000e: fix heap overflow in e1000_set_eeprom
    5d334bce9fad batman-adv: fix OOB read/write in network-coding decode
    95b63d15fce5 scsi: lpfc: Fix buffer free/clear order in deferred receive path
    da98fc73f7d1 drm/amdgpu: drop hw access in non-DC audio fini
    acdf26a91219 wifi: mwifiex: Initialize the chan_stats array to zero
    732e62212f49 mm: move page table sync declarations to linux/pgtable.h
    744ff519c72d x86/mm/64: define ARCH_PAGE_TABLE_SYNC_MASK and arch_sync_kernel_mappings()
    4bd570f49412 pcmcia: Fix a NULL pointer dereference in __iodyn_find_io_region()
    2be7109ef258 ALSA: usb-audio: Add mute TLV for playback volumes on some devices
    0bb7069ee343 phy: mscc: Stop taking ts_lock for tx_queue and use its own lock
    24b24295464f net: phy: mscc: Fix memory leak when using one step timestamping
    b4c2fb32f4fe ptp: Add generic PTP is_sync() function
    0b21e9cd4559 ppp: fix memory leak in pad_compress_skb
    955f400e4f51 net: atm: fix memory leak in atm_register_sysfs when device_register fail
    2bd0f6721290 ax25: properly unshare skbs in ax25_kiss_rcv()
    a7eae33227ee ipv4: Fix NULL vs error pointer check in inet_blackhole_dev_init()
    894c7d0c3fba net: thunder_bgx: decrement cleanup index before use
    299c6d47528e net: thunder_bgx: add a missing of_node_put
    e5f334ac7747 wifi: libertas: cap SSID len in lbs_associate()
    24ec8826381f wifi: cw1200: cap SSID length in cw1200_do_join()
    eaa10a027ab6 net: ethernet: mtk_eth_soc: fix tx vlan tag for llc packets
    1eadabcf5623 i40e: Fix potential invalid access when MAC list is empty
    348a01c8574b icmp: fix icmp_ndo_send address translation for reply direction
    e96d08ddbc99 mISDN: Fix memory leak in dsp_hwec_enable()
    1079c1029384 xirc2ps_cs: fix register access when enabling FullDuplex
    47f6090bcf75 Bluetooth: Fix use-after-free in l2cap_sock_cleanup_listen()
    c79730e337a1 netfilter: conntrack: helper: Replace -EEXIST by -EBUSY
    d00c8b0daf56 netfilter: br_netfilter: do not check confirmed bit in br_nf_local_in() after confirm
    ff040562c10a wifi: cfg80211: fix use-after-free in cmp_bss()
    0f70fab5598d arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3399-pinebook-pro
    4377eac565c2 tee: fix NULL pointer dereference in tee_shm_put
    b187c9761119 fs: writeback: fix use-after-free in __mark_inode_dirty()
    71224142994b drm/amd/display: Don't warn when missing DCE encoder caps
    c1c74584b9b4 bpf: Fix oob access in cgroup local storage
    c04992612ed4 bpf: Move bpf map owner out of common struct
    bfb8da7a5dd1 bpf: Move cgroup iterator helpers to bpf.h
    23099792bb6f bpf: Add cookie object to bpf maps
    7a6c2d093c45 Linux 5.15.191
    90bae69c2959 xfs: do not propagate ENODATA disk errors into xattr code
    c570d773884c Revert "drm/dp: Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS"
    3db34718c755 HID: mcp2221: Handle reads greater than 60 bytes
    6ac648746149 HID: mcp2221: Don't set bus speed on every transfer
    2a0ed07b6967 drm/nouveau/disp: Always accept linear modifier
    40a0165278b7 net: usb: qmi_wwan: add Telit Cinterion LE910C4-WWX new compositions
    9a0b5fdce128 dma/pool: Ensure DMA_DIRECT_REMAP allocations are decrypted
    67334c94b853 Revert "drm/amdgpu: fix incorrect vm flags to map bo"
    4338b0f6544c HID: hid-ntrig: fix unable to handle page fault in ntrig_report_version()
    bfde0392d74f HID: wacom: Add a new Art Pen 2
    4263e5851779 HID: multitouch: fix slab out-of-bounds access in mt_report_fixup()
    eaae728e7335 HID: asus: fix UAF via HID_CLAIMED_INPUT validation
    d51e381beed5 KVM: x86: use array_index_nospec with indices that come from guest
    568e7761279b efivarfs: Fix slab-out-of-bounds in efivarfs_d_compare
    17d6c7747045 sctp: initialize more fields in sctp_v6_from_sk()
    700a71e78755 net: stmmac: xgmac: Do not enable RX FIFO Overflow interrupts
    47fbd9c3364c net/mlx5e: Set local Xoff after FW update
    9352f6ea981d net/mlx5e: Update and set Xon/Xoff upon port speed set
    7011f0f400d4 net/mlx5e: Update and set Xon/Xoff upon MTU set
    f64abfa0649a phy: mscc: Fix when PTP clock is register and unregister
    5680a4dd1009 net: dlink: fix multicast stats being counted incorrectly
    62f368472b0a atm: atmtcp: Prevent arbitrary write in atmtcp_recv_control().
    bf813928bb53 Bluetooth: hci_event: Detect if HCI_EV_NUM_COMP_PKTS is unbalanced
    e726dc92f45d powerpc/kvm: Fix ifdef to remove build warning
    5a2d5ab38365 net: ipv4: fix regression in local-broadcast routes
    6606a6d37496 udf: Fix directory iteration for longer tail extents
    d717c12fbb23 vhost/net: Protect ubufs with rcu read lock in vhost_net_ubuf_put()
    f230d40147cc NFS: Fix a race when updating an existing write
    fd947b71cc1b nfs: fold nfs_page_group_lock_subrequests into nfs_lock_and_join_requests
    2e0d974cdbd1 ASoC: codecs: tx-macro: correct tx_macro_component_drv name
    8f397cdef773 scsi: core: sysfs: Correct sysfs attributes access rights
    a6f0f8873cc3 ftrace: Fix potential warning in trace_printk_seq during ftrace_dump
    2573ee4e6c03 pinctrl: STMFX: add missing HAS_IOMEM dependency
    01879f56bdde Linux 5.15.190
    77cf363f7667 alloc_fdtable(): change calling conventions.
    e442a966e2b7 wifi: mac80211: check basic rates validity in sta_link_apply_parameters
    82ef97abf227 netfilter: nf_reject: don't leak dst refcount for loopback packets
    53320a99948d s390/hypfs: Enable limited access during lockdown
    0ffb1bf99e49 s390/hypfs: Avoid unnecessary ioctl registration in debugfs
    bbdfdc63afdf ALSA: usb-audio: Use correct sub-type for UAC3 feature unit validation
    9d48c8091947 bonding: update LACP activity flag after setting lacp_active
    5748c51afe91 net/sched: Remove unnecessary WARNING condition for empty child qdisc in htb_activate
    0dacfc5372e3 net/sched: Make cake_enqueue return NET_XMIT_CN when past buffer_limit
    f422b5e49b72 igc: fix disabling L1.2 PCI-E link substate on I226 on init
    aa65c2bdb19f ixgbe: xsk: resolve the negative overflow of budget in ixgbe_xmit_zc
    fcb4ce9f729c net: usb: asix_devices: Fix PHY address mask in MDIO bus initialization
    5d1fed4b1c3c phy: mscc: Fix timestamping for vsc8584
    94beabf466da net: phy: Use netif_rx().
    9a1969fbffc1 ppp: fix race conditions in ppp_fill_forward_path
    9f113d2828f0 ipv6: sr: validate HMAC algorithm ID in seg6_hmac_info_add
    2af45aadb7b5 drm/amd/display: Add null pointer check in mod_hdcp_hdcp1_create_session()
    38c13968b80e ALSA: usb-audio: Fix size validation in convert_chmap_v3()
    ddf1691f2534 drm/hisilicon/hibmc: fix the hibmc loaded failed bug
    10ae957833eb mlxsw: spectrum: Forward packets with an IPv4 link-local source IP
    0ad8509b468f iommu/amd: Avoid stack buffer overflow from kernel cmdline
    325bf7d57c4e scsi: qla4xxx: Prevent a potential error pointer dereference
    34171b9e53bd net: bridge: fix soft lockup in br_multicast_query_expired()
    0ba6efb2c174 RDMA/bnxt_re: Fix to initialize the PBL array
    e7ea080f85b7 cgroup/cpuset: Use static_branch_enable_cpuslocked() on cpusets_insane_config_key
    c635a42d9b74 mm/page_alloc: detect allocation forbidden by cpuset and bail out early
    873f32201df8 x86/cpu/hygon: Add missing resctrl_cpu_detect() in bsp_init helper
    4ad0d45ffc39 mm/memory-failure: fix infinite UCE for VM_PFNMAP pfn
    d8c5d87a4315 iio: light: as73211: Ensure buffer holes are zeroed
    41b838420457 tracing: Limit access to parser->buffer when trace_get_user failed
    9fb26b72bb8b tracing: Remove unneeded goto out logic
    14b0d8e7423a iio: imu: inv_icm42600: change invalid data error to -EBUSY
    c78c8e5048b7 usb: xhci: Fix slot_id resource race conflict
    5e2414ebe6f9 compiler: remove __ADDRESSABLE_ASM{_STR,}() again
    c8124155c223 selftests: mptcp: pm: check flush doesn't reset limits
    9aff206cfc27 pwm: mediatek: Fix duty and period setting
    7735341026e5 pwm: mediatek: Handle hardware enable and clock enable separately
    de1dda2e5312 pwm: mediatek: Implement .apply() callback
    1c72f369221c scsi: mpi3mr: Serialize admin queue BAR writes on 32-bit systems
    fef82b52a48c scsi: mpi3mr: Drop unnecessary volatile from __iomem pointers
    098b2c8ee208 scsi: ufs: exynos: Fix programming of HCI_UTRL_NEXUS_TYPE
    423fd248c7aa iio: adc: ad_sigma_delta: change to buffer predisable
    0d59ce2bfc3b soc: qcom: mdt_loader: Ensure we don't read past the ELF header
    e94264b07c41 wifi: ath11k: fix dest ring-buffer corruption when ring is full
    80bc1e5d9e15 asm-generic: Add memory barrier dma_mb()
    06b70cccc106 locking/barriers, kcsan: Support generic instrumentation
    9db6a78bc5e4 media: venus: protect against spurious interrupts during probe
    c52e2ecb77e8 media: venus: Add support for SSR trigger using fault injection
    39d70ce5a252 media: qcom: camss: cleanup media device allocated resource on error path
    4ef9526792ae media: camss: Convert to platform remove callback returning void
    6b7784ea07e6 f2fs: fix to avoid out-of-boundary access in dnode page
    a19b31f854a8 drm/dp: Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS
    a7037057fd16 mptcp: disable add_addr retransmission when timeout is 0
    7c5f3b639bb1 drm/amd/display: Don't overclock DCE 6 by 15%
    dfe40159eec6 usb: dwc3: Remove WARN_ON for device endpoint command timeouts
    bccd26d713ec usb: dwc3: Ignore late xferNotReady event to prevent halt timeout
    7ec4f6da3a4b USB: storage: Ignore driver CD mode for Realtek multi-mode Wi-Fi dongles
    564b015af068 usb: storage: realtek_cr: Use correct byte order for bcs->Residue
    b5a59ea98836 USB: storage: Add unusual-devs entry for Novatek NTK96550-based camera
    f596da86b8c7 usb: renesas-xhci: Fix External ROM access timeouts
    f9f402f8b93c usb: core: hcd: fix accessing unmapped memory in SINGLE_STEP_SET_FEATURE test
    868a1b68dcd9 comedi: Fix use of uninitialized memory in do_insn_ioctl() and do_insnlist_ioctl()
    bab220b0bb5a comedi: pcl726: Prevent invalid irq number
    ab77e85bd3bc comedi: Make insn_rw_emulate_bits() do insn->n samples
    78232f3d0eac usb: quirks: Add DELAY_INIT quick for another SanDisk 3.2Gen1 Flash Drive
    4cb568aacc43 most: core: Drop device reference after usage in get_channel()
    65817f61e181 iio: proximity: isl29501: fix buffered read on big-endian systems
    35b8c9082dd5 iio: pressure: bmp280: Use IS_ERR() in bmp280_common_probe()
    e0b6b223167e ftrace: Also allocate and copy hash for reading of filter files
    403820959475 fpga: zynq_fpga: Fix the wrong usage of dma_map_sgtable()
    905986f6b670 use uniform permission checks for all mount propagation changes
    03b40bf5d038 fs/buffer: fix use-after-free when call bh_read() helper
    0496b11f223f drm/amd/display: Fill display clock and vblank time in dce110_fill_display_configs
    9031c990fd69 drm/amd/display: Find first CRTC and its line time in dce110_fill_display_configs
    2e278aee6afe drm/amd/display: Fix DP audio DTO1 clock source on DCE 6.
    fe8670344ab3 drm/amd/display: Fix fractional fb divider in set_pixel_clock_v3
    9c92d12b5cb9 drm/amd/display: Avoid a NULL pointer dereference
    f89530d76d28 ALSA: hda/realtek: Add support for HP EliteBook x360 830 G6 and EliteBook 830 G6
    7bf57a0709cd mm/debug_vm_pgtable: clear page table entries at destroy_args()
    b14850b047e8 squashfs: fix memory leak in squashfs_fill_super
    7a556ae35d7c mmc: sdhci-pci-gli: GL9763e: Rename the gli_set_gl9763e() for consistency
    c3e0a66fd999 memstick: Fix deadlock by moving removing flag earlier
    23249dade24e KVM: arm64: Fix kernel BUG() due to bad backport of FPSIMD/SVE/SME fix
    d08713bac991 scsi: ufs: ufs-pci: Fix default runtime and system PM levels
    b2be32915f07 scsi: ufs: ufs-pci: Fix hibernate state transition for Intel MTL-like host controllers
    fb9c73ef2ac2 mptcp: do not queue data on closed subflows
    a08f285d2020 mptcp: drop unused sk in mptcp_push_release
    13e85f7d6979 selftests: mptcp: Initialize variables to quiet gcc 12 warnings
    c9f8a3b0600b mptcp: introduce MAPPING_BAD_CSUM
    1da47584e2d7 mptcp: fix error mibs accounting
    f4480eaad489 selftests: mptcp: add missing join check
    2b92ae68ba70 selftests: mptcp: connect: also cover checksum
    2668261dd04d selftests: mptcp: connect: also cover alt modes
    2c5b3b71fe6b selftests: mptcp: make sendfile selftest work
    696480028b59 kbuild: userprogs: use correct linker when mixing clang and GNU ld
    ad1190744da9 ACPI: processor: idle: Check acpi_fetch_acpi_dev() return value
    cbb445d5cd98 PCI: vmd: Assign VMD IRQ domain before enumeration
    c2d25fddd867 sch_htb: make htb_deactivate() idempotent
    eda741fe155d codel: remove sch->q.qlen check before qdisc_tree_reduce_backlog()
    db568d2151cd sch_drr: make drr_qlen_notify() idempotent
    dd83b2be69a1 btrfs: populate otime when logging an inode item
    a803d916ae9a KVM: VMX: Flush shadow VMCS on emergency reboot
    be9692dafdfb net/sched: ets: use old 'nbands' while purging unused classes
    1980d8d38cef net_sched: sch_ets: implement lockless ets_dump()
    de127abe923a net/sched: sch_ets: properly init all active DRR list handles
    8af89a96144e platform/chrome: cros_ec: Unregister notifier in cros_ec_unregister()
    9936cb9ef2d2 platform/chrome: cros_ec: remove unneeded label and if-condition
    2ad140545b2a platform/chrome: cros_ec: Use per-device lockdep key
    d9e812b90b38 platform/chrome: cros_ec: Make cros_ec_unregister() return void
    79c745be310e usb: dwc3: imx8mp: fix device leak at unbind
    7b3f0e3b60c2 bus: mhi: host: Detect events pointing to unexpected TREs
    cfbd61d63263 ata: Fix SATA_MOBILE_LPM_POLICY description in Kconfig
    90a53102729e usb: musb: omap2430: fix device leak at unbind
    1be6c638f72d usb: musb: omap2430: Convert to platform remove callback returning void
    69bea84b06b5 mm/ptdump: take the memory hotplug lock inside ptdump_walk_pgd()
    3924dab90816 NFS: Fix the setting of capabilities when automounting a new filesystem
    dbadab480714 NFS: Create an nfs4_server_set_init_caps() function
    e60dc74f62f0 net: enetc: fix device and OF node leak at probe
    a39791e479ba block: Make REQ_OP_ZONE_FINISH a write operation
    1aaa8e9e4f50 PCI/ACPI: Fix runtime PM ref imbalance on Hot-Plug Capable ports
    5cbf5709aa05 usb: typec: fusb302: cache PD RX state
    3467c4ebb334 hv_netvsc: Fix panic during namespace deletion with VF
    26eb63f732b0 smb: server: Fix extension string in ksmbd_extract_shortname()
    14fafb398360 ALSA: scarlett2: Add retry on -EPROTO from scarlett2_usb_tx()
    1b2b7e9da01e x86/fpu: Delay instruction pointer fixup until after warning
    6550b2bef095 smb: client: fix use-after-free in crypt_message when using async crypto
    ae8428d68252 usb: hub: Don't try to recover devices lost during warm reset.
    98df81d18e5d usb: hub: avoid warm port reset during USB3 disconnect
    8a0b022147b1 x86/mce/amd: Add default names for MCA banks and blocks
    4e2ee5d14333 iio: hid-sensor-prox: Fix incorrect OFFSET calculation
    4597cf3ac9ba iio: hid-sensor-prox: Restore lost scale assignments
    c4029044cc40 f2fs: fix to do sanity check on ino and xnid
    3a12e18a0310 ARM: 9448/1: Use an absolute path to unified.h in KBUILD_AFLAGS
    407047893a64 arm64/entry: Mask DAIF in cpu_switch_to(), call_on_irq_stack()
    6188d61ba73d drm/sched: Remove optimization that causes hang when killing dependent jobs
    7c5a13c76dd3 ice: Fix a null pointer dereference in ice_copy_and_init_pkg()
    46a7cdcf06c4 selftests/memfd: add test for mapping write-sealed memfd read-only
    1c296cba6568 mm: reinstate ability to map write-sealed memfd mappings read-only
    d919658a3871 mm: update memfd seal write check to include F_SEAL_WRITE
    27df40ad7445 mm: drop the assumption that VM_SHARED always implies writable
    44e2f93f9820 sch_qfq: make qfq_qlen_notify() idempotent
    a5efc95a33bd sch_hfsc: make hfsc_qlen_notify() idempotent
    967955c9e57f sch_htb: make htb_qlen_notify() idempotent
    587558d812ac mptcp: pm: kernel: flush: do not reset ADD_ADDR limit
    6ddf51fc0b07 mptcp: drop skb if MPTCP skb extension allocation fails
    3b348c9c8d2c ipv6: sr: Fix MAC comparison to be constant-time
    3ae272ab523d net, hsr: reject HSR frame if skb can't hold tag
    da240d7f7e10 drm/amd/display: Don't overwrite dce60_clk_mgr
    92c4a1fde641 drm/amd: Restore cached power limit during resume
    5005e4e6f964 media: venus: venc: Clamp param smaller than 1fps and bigger than 240
    48045c17fddf media: venus: vdec: Clamp param smaller than 1fps and bigger than 240.
    e6e5e5e5b40a media: venus: hfi: explicitly release IRQ during teardown
    ef09b96665f1 media: venus: Add a check for packet size after reading from shared memory
    f16dc2c87ce4 media: ov2659: Fix memory leaks in ov2659_probe()
    fbc81e78d75b media: rainshadow-cec: fix TOCTOU race condition in rain_interrupt()
    5427dda195d6 media: usbtv: Lock resolution while streaming
    436774334587 media: v4l2-ctrls: Don't reset handler's error in v4l2_ctrl_handler_free()
    025617f4851a media: imx: fix a potential memory leak in imx_media_csc_scaler_device_init()
    5197247df6a0 media: hi556: correct the test pattern configuration
    6512784dbf5d media: gspca: Add bounds checking to firmware parser
    90cc9e7d82e1 soc/tegra: pmc: Ensure power-domains are in a known state
    84ff98c1ea19 jbd2: prevent softlockup in jbd2_log_do_checkpoint()
    fb454ba99189 PCI: endpoint: Fix configfs group removal on driver teardown
    dc4ffbd57171 PCI: endpoint: Fix configfs group list head handling
    7d5c223edf89 mtd: rawnand: fsmc: Add missing check after DMA map
    93f1be8de86a mtd: spinand: propagate spinand_wait() errors from spinand_write_page()
    e26bd46c2968 hwmon: (gsc-hwmon) fix fan pwm setpoint show functions
    dbe8b4366878 pwm: imx-tpm: Reset counter if CMOD is 0
    6b6fa2a7a1b3 wifi: ath11k: fix source ring-buffer corruption
    5679342831db wifi: brcmsmac: Remove const from tbl_ptr parameter in wlc_lcnphy_common_read_table()
    1bb6bb6cd975 zynq_fpga: use sgtable-based scatterlist wrappers
    0176a6117fc7 ata: libata-scsi: Fix ata_to_sense_error() status handling
    48a1795cbf67 scsi: mpi3mr: Fix race between config read submit and interrupt completion
    e1f8a51a8602 ext4: fix hole length calculation overflow in non-extent inodes
    66245c16d72e ext4: use kmalloc_array() for array space allocation
    5396de17bcea ext4: don't try to clear the orphan_present feature block device is r/o
    2c9c15656569 ext4: fix reserved gdt blocks handling in fsmap
    e0fad182ba8a ext4: fix fsmap end of range reporting with bigalloc
    cdfc7b6d3473 ext4: check fast symlink for ea_inode correctly
    8a5e6282c6a7 Revert "vgacon: Add check for vc_origin address range in vgacon_scroll()"
    649383fa7f67 lib/crypto: mips/chacha: Fix clang build and remove unneeded byteswap
    969668b6e7d2 vt: defkeymap: Map keycodes above 127 to K_HOLE
    6b03d59b1e0e vt: keyboard: Don't process Unicode characters in K_OFF mode
    228c686e20ff bus: mhi: host: Fix endianness of BHI vector table
    9d916500ecf9 usb: dwc3: meson-g12a: fix device leaks at unbind
    332d4a4b8615 usb: gadget: udc: renesas_usb3: fix device leak at unbind
    f6d79955b2a3 usb: atm: cxacru: Merge cxacru_upload_firmware() into cxacru_heavy_init()
    5e5ccfdbe4ac m68k: Fix lost column on framebuffer debug console
    177d3651dbd3 cpufreq: armada-8k: Fix off by one in armada_8k_cpufreq_free_table()
    68c4613e89f0 serial: 8250: fix panic due to PSLVERR
    08e12045014b HID: magicmouse: avoid setting up battery timer when not needed
    123cf618a0ae media: uvcvideo: Do not mark valid metadata as invalid
    8343f3fe0b75 media: uvcvideo: Fix 1-byte out-of-bounds read in uvc_parse_format()
    f249d32bb548 mm/kmemleak: avoid deadlock by moving pr_warn() outside kmemleak_lock
    a04de4c40aab mm/kmemleak: avoid soft lockup in __kmemleak_do_cleanup()
    d06e119a16ce parisc: Makefile: fix a typo in palo.conf
    078e62bffca4 fbdev: Fix vmalloc out-of-bounds write in fast_imageblit
    fa086b1398cf btrfs: do not allow relocation of partially dropped subvolumes
    8563ac0b5b8f btrfs: fix log tree replay failure due to file with 0 links and extents
    fa6e0cc6a720 cdc-acm: fix race between initial clearing halt and open
    6eb63a710da3 thunderbolt: Fix copy+paste error in match_service_id()
    d85fac8729c9 comedi: fix race between polling and detaching
    56b9177f17ab usb: typec: ucsi: Update power_supply on power role change
    030b156ec7e0 misc: rtsx: usb: Ensure mmc child device is active when card is present
    058ad2b72281 usb: core: config: Prevent OOB read in SS endpoint companion parsing
    91789de2ed20 ext4: fix largest free orders lists corruption on mb_optimize_scan switch
    3b6de89a9dda drm/amdgpu: fix incorrect vm flags to map bo
    30b14a9374d9 ASoC: fsl_sai: replace regmap_write with regmap_update_bits
    780ce4759f94 ASoC: soc-dai.h: merge DAI call back functions into ops
    4f60001afa06 ASoC: soc-dai.c: add missing flag check at snd_soc_pcm_dai_probe()
    87c474a68724 scsi: lpfc: Remove redundant assignment to avoid memory leak
    481701300b7b rtc: ds1307: remove clear of oscillator stop flag (OSF) in probe
    4f783333cbfa pNFS: Fix uninited ptr deref in block/scsi layout
    f47b0662bdbd pNFS: Handle RPC size limit for layoutcommits
    1ba621a63625 pNFS: Fix disk addr range check in block/scsi layout
    c8dea4397432 pNFS: Fix stripe mapping in block/scsi layout
    8b3ce085b52e block: avoid possible overflow for chunk_sectors check in blk_stack_limits()
    53acbc94344e net: phy: smsc: add proper reset flags for LAN8710A
    dc826121cd44 ipmi: Fix strcpy source and destination the same
    a12feec53c1a kconfig: lxdialog: fix 'space' to (de)select options
    f7d9f0717be8 kconfig: gconf: fix potential memory leak in renderer_edited()
    28498cf306f9 kconfig: gconf: avoid hardcoding model2 in on_treeview2_cursor_changed()
    19b946182978 ipmi: Use dev_warn_ratelimited() for incorrect message warnings
    2b4aa66f7532 scsi: aacraid: Stop using PCI_IRQ_AFFINITY
    2e24d269359b scsi: target: core: Generate correct identifiers for PR OUT transport IDs
    237edd281d52 scsi: Fix sas_user_scan() to handle wildcard and multi-channel scans
    e008120a621e kconfig: nconf: Ensure null termination where strncpy is used
    a73ee10c2781 kconfig: lxdialog: replace strcpy() with strncpy() in inputbox.c
    344ef2a6c6e8 i2c: Force DLL0945 touchpad i2c freq to 100khz
    3963ecbdddaf dm-mpath: don't print the "loaded" message if registering fails
    6f83cf2e362a i3c: don't fail if GETHDRCAP is unsupported
    ce3195182fe0 rtc: ds1307: handle oscillator stop flag (OSF) for ds1341
    758b8e343610 i3c: add missing include to internal header
    b506af24d662 md: dm-zoned-target: Initialize return variable r to avoid uninitialized use
    e6f44cd74134 crypto: octeontx2 - add timeout for load_fvc completion poll
    eb6059474e70 media: uvcvideo: Fix bandwidth issue for Alcor camera
    17b30e5ded06 media: dvb-frontends: w7090p: fix null-ptr-deref in w7090p_tuner_write_serpar and w7090p_tuner_read_serpar
    529fd5593b72 media: dvb-frontends: dib7090p: fix null-ptr-deref in dib7090p_rw_on_apb()
    e06e706500b8 media: usb: hdpvr: disable zero-length read messages
    aef1b717d4a2 media: tc358743: Increase FIFO trigger level to 374
    21ba26a8e347 media: tc358743: Return an appropriate colorspace from tc358743_set_fmt
    a6ccbe037734 media: tc358743: Check I2C succeeded during probe
    2e82f9a5a37b pinctrl: stm32: Manage irq affinity settings
    0de080a0ecab scsi: mpt3sas: Correctly handle ATA device errors
    5e25ee1ecec9 scsi: lpfc: Check for hdwq null ptr when cleaning up lpfc_vport structure
    c16984bc84bf RDMA/core: reduce stack using in nldev_stat_get_doit()
    9d3211cb61a0 RDMA: hfi1: fix possible divide-by-zero in find_hw_thread_mask()
    a8c0dc453e9f leds: leds-lp50xx: Handle reg to get correct multi_index
    b6a9cc9918db media: v4l2-common: Reduce warnings about missing V4L2_CID_LINK_FREQ control
    bd90dbd19683 MIPS: Don't crash in stack_top() for tasks without ABI or vDSO
    1467a75819e4 jfs: upper bound check of tree index in dbAllocAG
    9ad054cd2c4c jfs: Regular file corruption check
    8ed7275910fb jfs: truncate good inode pages when hard link is 0
    ba024d925645 scsi: bfa: Double-free fix
    f5de907f0479 watchdog: iTCO_wdt: Report error if timeout configuration fails
    90c1295da0a7 MIPS: vpe-mt: add missing prototypes for vpe_{alloc,start,stop,free}
    e9849ca6dd01 watchdog: dw_wdt: Fix default timeout
    dacfd8cf9c23 fs/orangefs: use snprintf() instead of sprintf()
    fd5aad080edb scsi: libiscsi: Initialize iscsi_conn->dd_data only if memory is allocated
    7f322c12df7a ext4: do not BUG when INLINE_DATA_FL lacks system.data xattr
    79ec8dabf001 crypto: hisilicon/hpre - fix dma unmap sequence
    b06a3c552c00 cifs: Fix calling CIFSFindFirst() for root path without msearch
    8e6932ee0cc9 watchdog: sbsa: Adjust keepalive timeout to avoid MediaTek WS0 race condition
    1117260a5402 vhost: fail early when __vhost_add_used() fails
    6ef6e42de0d4 net: dsa: b53: fix IP_MULTICAST_CTRL on BCM5325
    77e56dbc7b7a drm/ttm: Respect the shrinker core free target
    65a7b7717600 uapi: in6: restore visibility of most IPv6 socket options
    49586908dea6 drm/ttm: Should to return the evict error
    6716de171b2a net: ncsi: Fix buffer overflow in fetching version id
    56c4837283eb wifi: rtlwifi: fix possible skb memory leak in _rtl_pci_init_one_rxdesc()
    f531abcdfec2 net: dsa: b53: prevent SWITCH_CTRL access on BCM5325
    bae08d48d044 net: dsa: b53: prevent DIS_LEARNING access on BCM5325
    9874ad64285f net: dsa: b53: prevent GMII_PORT_OVERRIDE_CTRL access on BCM5325
    36bec4066dff net: dsa: b53: fix b53_imp_vlan_setup for BCM5325
    392aa29dbcc5 gve: Return error for unknown admin queue command
    452de5797933 net: vlan: Replace BUG() with WARN_ON_ONCE() in vlan_dev_* stubs
    d49af61978b6 drm/amd: Allow printing VanGogh OD SCLK levels without setting dpm to manual
    851c50b31611 dpaa_eth: don't use fixed_phy_change_carrier
    6de7a77911b2 wifi: iwlegacy: Check rate_idx range after addition
    7cc4b7c2e24f netmem: fix skb_frag_address_safe with unreadable skbs
    7451726049e8 wifi: rtlwifi: fix possible skb memory leak in `_rtl_pci_rx_interrupt()`.
    e80b670bc30d drm/amd/display: Fix 'failed to blank crtc!'
    6fed73112e43 wifi: iwlwifi: fw: Fix possible memory leak in iwl_fw_dbg_collect
    ffbf9699d639 wifi: iwlwifi: dvm: fix potential overflow in rs_fill_link_cmd()
    851726384eb6 drm/amd/display: Separate set_gsl from set_gsl_source_select
    e03f9c0b9324 net: fec: allow disable coalescing
    03dd58451897 net: atlantic: add set_power to fw_ops for atl2 to fix wol
    833e0e6744cd net: thunderbolt: Fix the parameter passing of tb_xdomain_enable_paths()/tb_xdomain_disable_paths()
    39117551069d drm/msm: use trylock for debugfs
    834c1e80164e ipv6: mcast: Check inet6_dev->dead under idev->mc_lock in __ipv6_dev_mc_inc().
    e22b1ee8cec9 (powerpc/512) Fix possible `dma_unmap_single()` on uninitialized pointer
    599dcdfff36f wifi: mac80211: don't complete management TX on SAE commit
    bb9a6585c2f9 s390/stp: Remove udelay from stp_sync_clock()
    13ff80efde1c wifi: iwlwifi: mvm: fix scan request validation
    ac31ba743054 sched/deadline: Fix accounting after global limits change
    037d856072bc net: thunderx: Fix format-truncation warning in bgx_acpi_match_id()
    c965a0f7477a net: ipv4: fix incorrect MTU in broadcast routes
    7fcb3d1a622b wifi: cfg80211: Fix interface type validation
    15b05f078e6c net: mctp: Prevent duplicate binds
    0ad84d622174 rcu: Protect ->defer_qs_iw_pending from data race
    a8b4ecb16327 arm64: Mark kernel as tainted on SAE and SError panic
    0f2d1bcdd01c net/mlx5e: Properly access RCU protected qdisc_sleeping variable
    8769e2cd97dc net: ag71xx: Add missing check after DMA map
    44746e44ef61 et131x: Add missing check after DMA map
    9152c8dce4fa be2net: Use correct byte order and format string for TCP seq and ack_seq
    5e18232d72a1 s390/time: Use monotonic clock in get_cycles()
    39968a6d1b7f wifi: cfg80211: reject HTC bit for management frames
    72632af764d0 ktest.pl: Prevent recursion of default variable options
    2fc78b1f4544 xen/netfront: Fix TX response spurious interrupts
    a0c4744b3e7a ASoC: codecs: rt5640: Retry DEVICE_ID verification
    2191a2f89827 iio: adc: ad7768-1: Ensure SYNC_IN pulse minimum timing requirement
    97e1d2a18a7d ALSA: usb-audio: Avoid precedence issues in mixer_quirks macros
    77477121f87a ALSA: pcm: Rewrite recalculate_boundary() to avoid costly loop
    c2dacfe495b7 ALSA: hda/ca0132: Fix buffer overflow in add_tuning_control
    a73ccab0ebd2 platform/chrome: cros_ec_typec: Defer probe on missing EC parent
    93d700f59bf9 platform/x86: thinkpad_acpi: Handle KCOV __init vs inline mismatches
    ddb96ab185e8 pm: cpupower: Fix the snapshot-order of tsc,mperf, clock in mperf_stop()
    ffa551a30da6 usb: core: usb_submit_urb: downgrade type check
    5c7fda829b16 usb: typec: intel_pmc_mux: Defer probe if SCU IPC isn't present
    82ba7b8cf9f6 ASoC: core: Check for rtd == NULL in snd_soc_remove_pcm_runtime()
    afd0dd1baf0a ALSA: intel8x0: Fix incorrect codec index usage in mixer for ICH4
    866fcfc056c3 ASoC: hdac_hdmi: Rate limit logging on connection and disconnection
    b3f0f92abaac x86/bugs: Avoid warning when overriding return thunk
    921592ffe886 mmc: rtsx_usb_sdmmc: Fix error-path in sd_set_power_mode()
    345df19a971a reset: brcmstb: Enable reset drivers for ARCH_BCM2835
    932d27bc3650 pps: clients: gpio: fix interrupt handling order in remove path
    e8d164041ebd ACPI: APEI: GHES: add TAINT_MACHINE_CHECK on GHES panic path
    18aed89a19d9 mmc: sdhci-msm: Ensure SD card power isn't ON when card removed
    0c48c9fe3fac ACPI: processor: fix acpi_object initialization
    b287704f0b51 PM: sleep: console: Fix the black screen issue
    7121241b7267 thermal: sysfs: Return ENODATA instead of EAGAIN for reads
    c2b884662890 PM: runtime: Clear power.needs_force_resume in pm_runtime_reinit()
    2bcc6a6c3fbd ACPI: PRM: Reduce unnecessary printing to avoid user confusion
    e453c89e247d selftests: tracing: Use mutex_unlock for testing glob filter
    2499b0ac908e ARM: tegra: Use I/O memcpy to write to IRAM
    aeb7edd5cb7e gpio: tps65912: check the return value of regmap_update_bits()
    4dd40dfba23a tools/nolibc: define time_t in terms of __kernel_old_time_t
    5b49e57e1e73 thermal/drivers/qcom-spmi-temp-alarm: Enable stage 2 shutdown when required
    8cac2bd3cc83 ASoC: soc-dapm: set bias_level if snd_soc_dapm_set_bias_level() was successed
    472af4d4fa68 EDAC/synopsys: Clear the ECC counters on init
    2a65a7477b82 PM / devfreq: governor: Replace sscanf() with kstrtoul() in set_freq_store()
    c0726d1e466e ARM: rockchip: fix kernel hang during smp initialization
    4d0b2d5a7419 cpufreq: Exit governor when failed to start old governor
    6c3ae3c40cbb gpio: wcd934x: check the return value of regmap_update_bits()
    bade491eb9e0 usb: xhci: Avoid showing errors during surprise removal
    c4ba0c252d92 usb: xhci: Set avg_trb_len = 8 for EP0 during Address Device Command
    04e615daf3b9 usb: xhci: Avoid showing warnings for dying controller
    5a164a725b9c usb: typec: ucsi: psy: Set current max to 100mA for BC 1.2 and Default
    cc1613a46a1f selftests/futex: Define SYS_futex on 32-bit architectures with 64-bit time_t
    be45f1b5f28d cpufreq: CPPC: Mark driver with NEED_UPDATE_LIMITS flag
    f3ab168d3c85 usb: xhci: print xhci->xhc_state when queue_command failed
    c8704dca5792 securityfs: don't pin dentries twice, once is enough...
    d167a43b29cc ext2: Handle fiemap on empty files to prevent EINVAL
    5a77f371b4a1 fs/ntfs3: correctly create symlink for relative path
    bde58c1539f3 fs/ntfs3: Add sanity check for file name
    11388106fab5 ata: libata-sata: Disallow changing LPM state if not supported
    11b567346c65 better lockdep annotations for simple_recursive_removal()
    ad5f53b993b2 hfs: fix not erasing deleted b-tree node issue
    84ef8dd32383 drbd: add missing kref_get in handle_write_conflicts
    dc83df485f44 udf: Verify partition map count
    9d5012ffe141 smb/server: avoid deadlock when linking with ReplaceIfExists
    f8d55c912e45 arm64: Handle KCOV __init vs inline mismatches
    03cd1db1494c hfsplus: don't use BUG_ON() in hfsplus_create_attributes_file()
    ccf0ad56a779 hfsplus: fix slab-out-of-bounds read in hfsplus_uni2asc()
    5ab59229bef6 hfsplus: fix slab-out-of-bounds in hfsplus_bnode_read()
    a1a60e795022 hfs: fix slab-out-of-bounds in hfs_bnode_read()
    240325993e78 ptp: prevent possible ABBA deadlock in ptp_clock_freerun()
    55b12736625d cpuidle: governors: menu: Avoid using invalid recent intervals data
    8680e712240e intel_idle: Allow loading ACPI tables for any family
    cd0e92bb2b75 sctp: linearize cloned gso packets in sctp_rcv
    19b909a4b145 netfilter: ctnetlink: fix refcount leak on table dump
    a47767e20cf7 udp: also consider secpath when evaluating ipsec use for checksumming
    edc065c19257 ACPI: processor: perflib: Move problematic pr->performance check
    40f8fea730ce ACPI: processor: perflib: Fix initial _PPC limit application
    289d1d1fc1dc Documentation: ACPI: Fix parent device references
    71379495ab70 eventpoll: Fix semi-unbounded recursion
    749528086620 fs: Prevent file descriptor table allocations exceeding INT_MAX
    9620376f73fa sunvdc: Balance device refcount in vdc_port_mpgroup_check
    6fd42124b445 NFSD: detect mismatch of file handle and delegation stateid in OPEN op
    f3aac6cf390d nfsd: handle get_client_locked() failure in nfsd4_setclientid_confirm()
    75947d3200de net: usb: asix_devices: add phy_mask for ax88772 mdio bus
    1b35f7ee5012 net: dpaa: fix device leak when querying time stamp info
    f95f0deb566d net: gianfar: fix device leak when querying time stamp info
    f324959ad47e netlink: avoid infinite retry looping in netlink_unicast()
    286b5be7f2ae gpio: virtio: Fix config space reading.
    275e37532e8e ALSA: usb-audio: Validate UAC3 cluster segment descriptors
    f03418bb9d54 ALSA: usb-audio: Validate UAC3 power domain descriptors, too
    b0878a23aee6 io_uring: don't use int for ABI
    8afb22aa063f usb: gadget : fix use-after-free in composite_dev_cleanup()
    66b1f50158e6 mm/hmm: move pmd_to_hmm_pfn_flags() to the respective #ifdeffery
    42ade82926c3 MIPS: mm: tlb-r4k: Uniquify TLB entries on init
    e05310943e7b ALSA: intel_hdmi: Fix off-by-one error in __hdmi_lpe_audio_probe()
    1946a6a9bdeb net: usbnet: Fix the wrong netif_carrier_on() call
    e2a4325ce21a net: usbnet: Avoid potential RCU stall on LINK_CHANGE event
    b4b40bab6c34 USB: serial: option: add Foxconn T99W709
    cf86704798c1 vsock: Do not allow binding to VMADDR_PORT_ANY
    ba2257034755 net/packet: fix a race in packet_set_ring() and packet_notifier()
    2675f405a60b selftests/perf_events: Add a mmap() correctness test
    3bd518cc7ea6 perf/core: Prevent VMA split of buffer mappings
    de85e72598d8 perf/core: Exit early on perf_mmap() fail
    899d253add77 perf/core: Don't leak AUX buffer refcount on allocation failure
    ce0481ac88a7 pptp: fix pptp_xmit() error path
    229429073578 smb: client: let recv_done() cleanup before notifying the callers.
    1f6525e79074 smb: server: let recv_done() avoid touching data_transfer after cleanup/move
    87fc5ce6ff98 smb: server: let recv_done() consistently call put_recvmsg/smb_direct_disconnect_rdma_connection
    fb3854e76cd3 smb: server: make sure we call ib_dma_unmap_single() only if we called ib_dma_map_single already
    484dea96e8c6 smb: server: remove separate empty_recvmsg_queue
    61a58a043906 ALSA: hda/ca0132: Fix missing error handling in ca0132_alt_select_out()
    f80b34ebc579 benet: fix BUG when creating VFs
    4c1022220b1b net: drop UFO packets in udp_rcv_segment()
    09ff062b89d8 ipv6: reject malicious packets in ipv6_gso_segment()
    d0e1d47eca66 net/mlx5: Correctly set gso_segs when LRO is used
    5de7513f38f3 pptp: ensure minimal skb length in pptp_xmit()
    10c803dee386 phy: mscc: Fix parsing of unicast frames
    0a0108796b84 netpoll: prevent hanging NAPI when netcons gets enabled
    19b83e315441 NFS: Fixup allocation flags for nfsiod's __GFP_NORETRY
    461125e8f46c XArray: Add calls to might_alloc()
    b23afb4a5fd2 NFSv4.2: another fix for listxattr
    3570ef5c3131 NFS: Fix filehandle bounds checking in nfs_fh_to_dentry()
    70bf32087b4d pNFS/flexfiles: don't attempt pnfs on fatal DS errors
    2ec8ec57bb8e PCI: pnv_php: Fix surprise plug detection and recovery
    f56e004b7817 powerpc/eeh: Make EEH driver device hotplug safe
    efabe0bd99f4 powerpc/eeh: Rely on dev->link_active_reporting
    cb1ea063039c powerpc/eeh: Export eeh_unfreeze_pe()
    12656cda9194 PCI: pnv_php: Work around switches with broken presence detection
    912e200240b6 PCI: pnv_php: Clean up allocated IRQs on unplug
    06e25dfea328 kconfig: qconf: fix ConfigList::updateListAllforAll()
    a30c34e6be0f scsi: ufs: core: Use link recovery when h8 exit fails during runtime resume
    0967189e6a09 scsi: mpt3sas: Fix a fw_event memory leak
    666b7cf6ac9a f2fs: fix to avoid out-of-boundary access in devs.path
    5cd99d5aa3d3 f2fs: fix to avoid panic in f2fs_evict_inode
    1edf68272b8c f2fs: fix to avoid UAF in f2fs_sync_inode_meta()
    fba3a1c1c330 f2fs: doc: fix wrong quota mount option description
    08e8ab00a6d2 f2fs: fix KMSAN uninit-value in extent_info usage
    37f3a111913b rtc: rv3028: fix incorrect maximum clock rate handling
    2ed0bae18a77 rtc: pcf8563: fix incorrect maximum clock rate handling
    facb6e7c0f4e rtc: pcf85063: fix incorrect maximum clock rate handling
    452aed10517b rtc: hym8563: fix incorrect maximum clock rate handling
    d62a797801fd rtc: ds1307: fix incorrect maximum clock rate handling
    e9293fd04c1b ucount: fix atomic_long_inc_below() argument type
    0b973c5eeef5 module: Restore the moduleparam prefix length check
    69e83e552750 apparmor: ensure WB_HISTORY_SIZE value is a power of 2
    74a87aca0942 bpf: Check flow_dissector ctx accesses are aligned
    27354cbd69b8 vhost-scsi: Fix log flooding with target does not exist errors
    aed9a4e43946 mtd: rawnand: atmel: set pmecc data setup time
    62f7cc11b04e mtd: rawnand: rockchip: Add missing check after DMA map
    15d0e92dfd45 mtd: rawnand: atmel: Fix dma_mapping_error() address
    47bf04a5a4b7 jfs: fix metapage reference count leak in dbAllocCtl
    cca8f5a39919 fbdev: imxfb: Check fb_add_videomode to prevent null-ptr-deref
    52e1dc93d52d crypto: qat - fix seq_file position update in adf_ring_next()
    6ff44d06e953 sh: Do not use hyphen in exported variable name
    2bba4bdf050d dmaengine: nbpfaxi: Add missing check after DMA map
    c94f4c6e662a dmaengine: mv_xor: Fix missing check after DMA map and missing unmap
    bbe6cd4da912 fs/orangefs: Allow 2 more characters in do_c_string()
    d2016efbc42a PCI: endpoint: pci-epf-vntb: Fix the incorrect usage of __iomem attribute
    d54f6bc4b2b0 soundwire: stream: restore params when prepare ports fail
    cbdd905a6b3e crypto: img-hash - Fix dma_unmap_sg() nents value
    5867d62dfe92 crypto: keembay - Fix dma_unmap_sg() nents value
    0b777a598b76 hwrng: mtk - handle devm_pm_runtime_enable errors
    7a9ee7b9034a watchdog: ziirave_wdt: check record length in ziirave_firm_verify()
    d084ff4b7c6b scsi: isci: Fix dma_unmap_sg() nents value
    999bb730ca69 scsi: mvsas: Fix dma_unmap_sg() nents value
    1c0717978d2a scsi: ibmvscsi_tgt: Fix dma_unmap_sg() nents value
    896c8ac77794 clk: sunxi-ng: v3s: Fix de clock definition
    2ab3f20f4baa perf tests bp_account: Fix leaked file descriptor
    b1b1bfb81a4a kernel: trace: preemptirq_delay_test: use offstack cpu mask
    b6fbac6ae904 RDMA/hns: Fix -Wframe-larger-than issue
    20c0ed8dd658 crypto: ccp - Fix crash when rebind ccp device for ccp.ko
    f25a1c8834c3 crypto: inside-secure - Fix `dma_unmap_sg()` nents value
    9f13f09c8dc4 perf sched: Fix memory leaks for evsel->priv in timehist
    84cd7256f068 clk: clk-axi-clkgen: fix fpfd_max frequency for zynq
    7b5365d17b58 pinctrl: sunxi: Fix memory leak on krealloc failure
    0369e2055789 PCI: endpoint: pci-epf-vntb: Return -ENOENT if pci_epc_get_next_free_bar() fails
    9ed082a72c20 power: supply: max14577: Handle NULL pdata when CONFIG_OF is not set
    4ebbb9106aaa power: supply: cpcap-charger: Fix null check for power_supply_get_by_name
    7e903da71f8b clk: xilinx: vcu: unregister pll_post only if registered correctly
    c62c0b6d797e media: v4l2-ctrls: Fix H264 SEPARATE_COLOUR_PLANE check
    2adc945b70c4 clk: davinci: Add NULL check in davinci_lpsc_clk_register()
    e86cc0b9812c mtd: fix possible integer overflow in erase_xfer()
    9745eecf5b69 crypto: marvell/cesa - Fix engine load inaccuracy
    dcd17f4f579b PCI: rockchip-host: Fix "Unexpected Completion" log message
    2e34470f44eb vrf: Drop existing dst reference in vrf_ip6_input_dst
    5e0275f888eb selftests: rtnetlink.sh: remove esp4_offload after test
    b10cfa2de13d netfilter: xt_nfacct: don't assume acct name is null-terminated
    bfc8a82751f6 can: kvaser_usb: Assign netdev.dev_port based on device channel index
    0721467bb069 can: kvaser_pciefd: Store device channel index
    19859cc12acc wifi: brcmfmac: fix P2P discovery failure in P2P peer due to missing P2P IE
    696994a1d655 Reapply "wifi: mac80211: Update skb's control block key in ieee80211_tx_dequeue()"
    9b096abd5454 wifi: mac80211: Check 802.11 encaps offloading in ieee80211_tx_h_select_key()
    fe1ee935285a wifi: mac80211: Don't call fq_flow_idx() for management frames
    d56890533b08 mwl8k: Add missing check after DMA map
    da1be393a75d wifi: rtl8xxxu: Fix RX skb size for aggregation disabled
    7c537709a18c xen/gntdev: remove struct gntdev_copy_batch from stack
    9cd1537036ac net_sched: act_ctinfo: use atomic64_t for three counters
    cab280994498 net/sched: Restrict conditions for adding duplicating netems to qdisc tree
    863b1c70e7f8 um: rtc: Avoid shadowing err in uml_rtc_start()
    8d83f7143ff7 arch: powerpc: defconfig: Drop obsolete CONFIG_NET_CLS_TCINDEX
    5351b8a41623 netfilter: nf_tables: adjust lockdep assertions handling
    7a43cb575217 drm/amd/pm/powerplay/hwmgr/smu_helper: fix order of mask and value
    8f35daf34357 m68k: Don't unregister boot console needlessly
    9053a69abfb5 net/mlx5: Check device memory pointer before usage
    f5a27666c8cf tcp: fix tcp_ofo_queue() to avoid including too much DUP SACK range
    eff3bb53c18c wifi: ath11k: clear initialized flag for deinit-ed srng lists
    2e9f85ee3b46 iwlwifi: Add missing check for alloc_ordered_workqueue
    d76ca8359371 wifi: iwlwifi: Fix memory leak in iwl_mvm_init()
    c73c773b09e3 wifi: rtl818x: Kill URBs before clearing tx status queue
    9a0624ff42df caif: reduce stack size, again
    a7caec2a1b59 bpftool: Fix memory leak in dump_xx_nlmsg on realloc failure
    73fc5d04009d bpf, ktls: Fix data corruption when using bpf_msg_pop_data() in ktls
    c0efe4eae2cc bpf, sockmap: Fix psock incorrectly pointing to sk
    d699e4e6d33b drm/rockchip: cleanup fb when drm_gem_fb_afbc_init failed
    4bf712152125 selftests/tracing: Fix false failure of subsystem event test
    3afd514c77f4 staging: nvec: Fix incorrect null termination of battery manufacturer
    f7c2de49fee3 samples: mei: Fix building on musl libc
    90918264362d cpufreq: Init policy->rwsem before it may be possibly used
    d9c7fc2c8ae2 cpufreq: Initialize cpufreq-based frequency-invariance later
    997c36d137e3 cpufreq: intel_pstate: Always use HWP_DESIRED_PERF in passive mode
    f0479e878d4b PM / devfreq: Check governor before using governor->name
    35a490ea5a80 arm64: dts: imx8mn-beacon: Fix HS400 USDHC clock speed
    10c0fbd5ad66 arm64: dts: imx8mm-beacon: Fix HS400 USDHC clock speed
    0008ec694e2b ARM: dts: imx6ul-kontron-bl-common: Fix RTS polarity for RS485 interface
    a789256941ab arm: dts: ti: omap: Fixup pinheader typo
    ae08cd98fef4 usb: early: xhci-dbc: Fix early_ioremap leak
    c6fdcd40390e Revert "vmci: Prevent the dispatching of uninitialized payloads"
    a891b456ba2b pps: fix poll support
    a85dc8385749 vmci: Prevent the dispatching of uninitialized payloads
    3290f62f23fa staging: fbtft: fix potential memory leak in fbtft_framebuffer_alloc()
    76f1842cdc91 usb: misc: apple-mfi-fastcharge: Make power supply names unique
    4986c1e82e93 ARM: dts: vfxxx: Correctly use two tuples for timer address
    b6b551196f5b selftests: Fix errno checking in syscall_user_dispatch test
    cfb5e5582f69 ASoC: ops: dynamically allocate struct snd_ctl_elem_value
    fe18d9f14f4c ASoC: soc-dai: tidyup return value of snd_soc_xlate_tdm_slot_mask()
    bec8109f957a Revert "fs/ntfs3: Replace inode_trylock with inode_lock"
    14922f0cc92e hfsplus: remove mutex_lock check in hfsplus_free_extents
    92c50b2d5a57 fs_context: fix parameter name in infofc() macro
    7becf31ed946 ASoC: Intel: fix SND_SOC_SOF dependencies
    c845b2e787d8 ethernet: intel: fix building with large NR_CPUS
    6dd7e3fc9246 usb: phy: mxs: disconnect line when USB charger is attached
    c53baa6a134c usb: chipidea: add USB PHY event
    6005cea17d04 ALSA: hda: Add missing NVIDIA HDA codec IDs
    988be12b610d comedi: comedi_test: Fix possible deletion of uninitialized timers
    fa6ce4a9cc9f jfs: reject on-disk inodes of an unsupported type
    6b80d98a9710 x86/bugs: Fix use of possibly uninit value in amd_check_tsa_microcode()
    6d40dd35a932 usb: typec: tcpm: apply vbus before data bringup in tcpm_src_attach
    92370ce7071c usb: typec: tcpm: allow switching to mode accessory to mux properly
    2f7fbb19d983 usb: typec: tcpm: allow to use sink in accessory mode
    4991f824128b mm/zsmalloc: do not pass __GFP_MOVABLE if CONFIG_COMPACTION=n
    98872a934ea6 nilfs2: reject invalid file types when reading inodes
    1d6f02700d75 gve: Fix stuck TX queue for DQ queue format
    ae07af3d1f8e e1000e: ignore uninitialized checksum word on tgp
    30e2871bd4b3 e1000e: disregard NVM checksum on tgp when valid checksum bit is not set
    8aa46b2428b8 dpaa2-switch: Fix device reference count leak in MAC endpoint handling
    30f7d3d90f41 dpaa2-eth: Fix device reference count leak in MAC endpoint handling
    094a94e3b237 ALSA: hda/realtek - Add mute LED support for HP Pavilion 15-eg0xxx
    83f64bb37197 bus: fsl-mc: Fix potential double device reference in fsl_mc_get_endpoint()
    c742b06302a0 i2c: virtio: Avoid hang by using interruptible completion wait
    d05ec13aa3eb i2c: qup: jump out of the loop in case of timeout
    ec1aa39ea7f9 platform/x86: ideapad-laptop: Fix kbd backlight not remembered among boots
    a8e8b3733ebd net: hns3: fixed vf get max channels bug
    d739b876c161 net: hns3: disable interrupt when ptp init failed
    f1d943048fd2 net: hns3: fix concurrent setting vlan filter issue
    ab905a2e982e net/sched: sch_qfq: Avoid triggering might_sleep in atomic context in qfq_delete_class
    186942d19c02 net: appletalk: Fix use-after-free in AARP proxy probe
    4640c4dc604d i40e: report VF tx_dropped with tx_errors instead of tx_discards
    8d9184cce2bf i40e: Add rx_missed_errors for buffer exhaustion
    c8aefc5994eb regmap: fix potential memory leak of regmap_bus
    cda04854614f interconnect: qcom: sc7280: Add missing num_links to xm_pcie3_1 node
    532fbdc74a4e RDMA/core: Rate limit GID cache warning messages
    ca9bef9ba1a6 regulator: core: fix NULL dereference on unbind due to stale coupling data
    664e5a6f541f Input: gpio-keys - fix a sleep while atomic with PREEMPT_RT
    b62c8ee41b81 x86: Pin task-stack in __get_wchan()
    e43191f9efa3 x86: Fix __get_wchan() for !STACKTRACE
    5ce1264b586d sched: Add wrapper for get_wchan() to keep task blocked
    b52e53a44a43 x86: Fix get_wchan() to support the ORC unwinder
    4dba44333a11 bpf, sockmap: Fix panic when calling skb_linearize
    7722142d7265 platform/x86: think-lmi: Fix kobject cleanup
    f110c609b0c5 powercap: intel_rapl: Do not change CLAMPING bit if ENABLE bit cannot be changed
    7d2c4a0fee61 mm/vmalloc: leave lazy MMU mode on PTE mapping error
    ee093910b9f8 ASoC: fsl_sai: Force a software reset when starting in consumer mode
    d2ab0bb400cc usb: dwc3: qcom: Don't leave BCR asserted
    5e2851d5e3cf usb: musb: fix gadget state on disconnect
    8594a4e87977 usb: musb: Add and use inline functions musb_{get,set}_state
    7a7178837bed usb: hub: Fix flushing of delayed work used for post resume purposes
    1a6fee8d8295 usb: hub: Fix flushing and scheduling of delayed work that tunes runtime pm
    e38ca702130b usb: hub: fix detection of high tier USB3 devices behind suspended hubs
    36fecd740de2 clone_private_mnt(): make sure that caller has CAP_SYS_ADMIN in the right userns
    9ef510db1362 sched: Change nr_uninterruptible type to unsigned long
    850226aef8d2 net/sched: Return NULL when htb_lookup_leaf encounters an empty rbtree
    2a4b9df3cb50 net: bridge: Do not offload IGMP/MLD messages
    047b61a24d7c net: vlan: fix VLAN 0 refcount imbalance of toggling filtering during runtime
    9aa9261bf1fe Bluetooth: L2CAP: Fix attempting to adjust outgoing MTU
    6e4eec86fe5f ipv6: mcast: Delay put pmc->idev in mld_del_delrec()
    984a2fb6f2ed net/mlx5: Correctly set gso_size when LRO is used
    88576404084d net/mlx5e: Add support to klm_umr_wqe
    9737501f26b6 lib: bitmap: Introduce node-aware alloc API
    ce2f1b5d0f13 Bluetooth: SMP: Fix using HCI_ERROR_REMOTE_USER_TERM on timeout
    edf3a1828373 Bluetooth: SMP: If an unallowed command is received consider it a failure
    3a4eca2a1859 Bluetooth: Fix null-ptr-deref in l2cap_sock_resume_cb()
    a6a238c4126e usb: net: sierra: check for no status endpoint
    4eb5cc48399f hwmon: (corsair-cpro) Validate the size of the received input buffer
    22bff8038efb selftests: net: increase inter-packet timeout in udpgro.sh
    db262843d1ce selftests: udpgro: report error when receive failed
    46c321f45c87 nvme: fix misaccounting of nvme-mpath inflight I/O
    4256a483fe58 smb: client: fix use-after-free in cifs_oplock_break
    4b5022b649ab pinctrl: mediatek: moore: check if pin_desc is valid before use
    8ba6c2362b85 rpl: Fix use-after-free in rpl_do_srh_inline().
    c6df79400014 net/sched: sch_qfq: Fix race condition on qfq_aggregate
    ca9850df52cc net: emaclite: Fix missing pointer increment in aligned_read()
    97303e541e12 bpf: Reject %p% format string in bprintf-like helpers
    020eed5681d0 comedi: Fix initialization of data for instructions that write to subdevice
    c53570e62b5b comedi: Fix use of uninitialized data in insn_rw_emulate_bits()
    757127050b43 comedi: Fix some signed shift left operations
    69dc06b95145 comedi: Fail COMEDI_INSNLIST ioctl if n_insns is too large
    73f34d609397 comedi: das6402: Fix bit shift out of bounds
    b3c95fa508e5 comedi: das16m1: Fix bit shift out of bounds
    c593215385f0 comedi: aio_iiro_16: Fix bit shift out of bounds
    29ef03e5b844 comedi: pcl812: Fix bit shift out of bounds
    eda041948635 iio: adc: stm32-adc: Fix race in installing chained IRQ handler
    2f10149ae596 iio: adc: max1363: Reorder mode_list[] entries
    8ff32ec36adb iio: adc: max1363: Fix MAX1363_4X_CHANS/MAX1363_8X_CHANS[]
    166afe964e84 soc: aspeed: lpc-snoop: Don't disable channels that aren't enabled
    fe632e8fc184 soc: aspeed: lpc-snoop: Cleanup resources in stack-order
    5fd9150de773 pmdomain: governor: Consider CPU latency tolerance from pm_domain_cpu_gov
    ecb1a74e41b5 mmc: sdhci_am654: Workaround for Errata i2312
    4d6c8f3e13af mmc: sdhci-pci: Quirk for broken command queuing on Intel GLK-based Positivo models
    0886c420da61 mmc: bcm2835: Fix dma_unmap_sg() nents value
    0a8432ef8cd9 memstick: core: Zero initialize id_reg in h_memstick_read_dev_id()
    6ef428a6e972 isofs: Verify inode mode when loading from disk
    24861ef8b517 dmaengine: nbpfaxi: Fix memory corruption in probe()
    052af0c58b5b af_packet: fix soft lockup issue caused by tpacket_snd()
    9e3219d33907 af_packet: fix the SO_SNDTIMEO constraint not effective on tpacked_snd()
    e98c1dfae40e phonet/pep: Move call to pn_skb_get_dst_sockaddr() earlier in pep_sock_accept()
    ca60064ea03f tracing: Add down_write(trace_event_sem) when adding trace event
    f10923b8d32a HID: core: do not bypass hid_hw_raw_request
    aefa6e92d9b4 HID: core: ensure __hid_request reserves the report ID as the first byte
    7fa83d004337 HID: core: ensure the allocated report buffer can contain the reserved report ID
    6c6ae150dbd8 pch_uart: Fix dma_sync_sg_for_device() nents value
    d83feb2854d8 Input: xpad - set correct controller type for Acer NGR200
    8039721de433 thunderbolt: Fix bit masking in tb_dp_port_set_hops()
    0bcdbf953523 i2c: stm32: fix the device used for the DMA map
    15a872068799 usb: gadget: configfs: Fix OOB read on empty string write
    76157b526d17 USB: serial: ftdi_sio: add support for NDI EMGUIDE GEMINI
    660b9dc0fd3d USB: serial: option: add Foxconn T99W640
    d374b477ae95 USB: serial: option: add Telit Cinterion FE910C04 (ECM) composition
    cdcb0ffd6448 phy: tegra: xusb: Fix unbalanced regulator disable in UTMI PHY mode

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 1df0d30c81..6db8ab45e1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "57a47106b330353648ec7c1c2f5d28437937bb69"
-SRCREV_meta ?= "d8c8889e18158a14223aa6cdb121c26a4d58fb56"
+SRCREV_machine ?= "bf6a706b67fab1f1b87d036a27eae3e29b416780"
+SRCREV_meta ?= "7b92175ae0ed45be2aae0a1f61f9e2e2562b32d4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.189"
+LINUX_VERSION ?= "5.15.193"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 48a7466509..f300e36917 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.189"
+LINUX_VERSION ?= "5.15.193"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c9df5e8ec3f116c77fbc29d8d88cf00da6ecb4f3"
-SRCREV_meta ?= "d8c8889e18158a14223aa6cdb121c26a4d58fb56"
+SRCREV_machine ?= "425235969cb20fd27d9d43e0c659fa9d24bafe75"
+SRCREV_meta ?= "7b92175ae0ed45be2aae0a1f61f9e2e2562b32d4"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 99ce420369..5455d391c7 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "da6836630834b34b24e1f0457afec67ba2bbab78"
-SRCREV_machine:qemuarm64 ?= "67ec90bce4425aa5b79586360c80fa08a34ca9d0"
-SRCREV_machine:qemumips ?= "2b2d7942cb977389f270d85a58adaf4659a3abbb"
-SRCREV_machine:qemuppc ?= "fcf1b5e6d46c8a7835dbd70331d380fff0319b7f"
-SRCREV_machine:qemuriscv64 ?= "3e27e9870b35af885840862de91caec215486a18"
-SRCREV_machine:qemuriscv32 ?= "3e27e9870b35af885840862de91caec215486a18"
-SRCREV_machine:qemux86 ?= "3e27e9870b35af885840862de91caec215486a18"
-SRCREV_machine:qemux86-64 ?= "3e27e9870b35af885840862de91caec215486a18"
-SRCREV_machine:qemumips64 ?= "366189c9e588082ad8c22b61143aa1fd10f3e273"
-SRCREV_machine ?= "3e27e9870b35af885840862de91caec215486a18"
-SRCREV_meta ?= "d8c8889e18158a14223aa6cdb121c26a4d58fb56"
+SRCREV_machine:qemuarm ?= "cfd5f47f2a7dc7f381124fa6b3648786e5a906ac"
+SRCREV_machine:qemuarm64 ?= "d1a6a76c533ad75ed1da9e1b4616be85f1f26d90"
+SRCREV_machine:qemumips ?= "6520b1720ebcc7b9f6f537e26a56eb3dbb667a7d"
+SRCREV_machine:qemuppc ?= "0a049d670d02ffb90a9130ae60b2add036d4af2f"
+SRCREV_machine:qemuriscv64 ?= "c7153ab5fdd753945b04ed678cce72c6ad05fb41"
+SRCREV_machine:qemuriscv32 ?= "c7153ab5fdd753945b04ed678cce72c6ad05fb41"
+SRCREV_machine:qemux86 ?= "c7153ab5fdd753945b04ed678cce72c6ad05fb41"
+SRCREV_machine:qemux86-64 ?= "c7153ab5fdd753945b04ed678cce72c6ad05fb41"
+SRCREV_machine:qemumips64 ?= "a76cb44b6fd95096dc2a16da2b237f1059c23d7f"
+SRCREV_machine ?= "c7153ab5fdd753945b04ed678cce72c6ad05fb41"
+SRCREV_meta ?= "7b92175ae0ed45be2aae0a1f61f9e2e2562b32d4"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "c79648372d02944bf4a54d87e3901db05d0ac82e"
+SRCREV_machine:class-devupstream ?= "43bb85222e53926decace01ce6584ca88e09a0a9"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.189"
+LINUX_VERSION ?= "5.15.193"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.43.0


