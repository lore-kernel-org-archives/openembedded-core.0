Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A4DC61CE5
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 21:22:36 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.464.1748640152013585972
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 14:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iVtHpBdK;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-af6a315b491so2074818a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 14:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748640151; x=1749244951; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p/QVBAdy+zEdPm1p6V67DeOjR8wRI+IX9H3yTu7iebQ=;
        b=iVtHpBdKNvBMm+doLUyTJOTPHKciqoC5WQGZTbq9ytTNL/vvvDxGSbCaq5/kDY1+6z
         pBbqfYpGMo3DN0mdGDbCS76yycRR1nVZCMvZULceKgipUdk6EaJ4WyEiZycT/zrqZpzq
         q2b5Tn/wA+H/y6Zhh+WEBo/mV3XpllzdvNS2pLuxinicsFpOhs/MeMBv0+FQ73/GV1A9
         pYRMW7e/VOw8eRxTul/+XlEQBW2PpvjyoPIzQfct4Y8hHfKtCd/X4M2lPJq1+ri7rSU2
         sWXn+RnyPUMfAYnNHgwRrePKc/+mdXGDDjAddWbnnJfvW3O1BvgNswPY3DJ5VH/1D3vu
         zf9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748640151; x=1749244951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/QVBAdy+zEdPm1p6V67DeOjR8wRI+IX9H3yTu7iebQ=;
        b=X7yy/GLHKWz2wJr8DojjvO8e6HcUmYkld1bbICxByttM4U/x7MT0cdlgCLTdpdqikv
         xRlWIMC71+gHk8tKDpplIbTmjNbAuF1rxh2jggmZeoNI3SSOzl3jvE/kIumQZe2lxDF8
         Mv4p/bNYbqDr0XyFKVY0SN7LTkgnQGTztTd3x85a7gAlBFGFT6gRcbqCKkx5rx5fgi7r
         aS2qRZFhw8QaS0vU1dJ5Zib36xoKcKg0vIqKcxSHQJlQG9MxAfgPIAkmmLU0oP5tyHAr
         HeGxR5nnXYpl4AoFkFLlV027i84YotKx1G0Z5v4/OuLWHYqbTk37IFUKXmnxRJk3JfIp
         e+mQ==
X-Gm-Message-State: AOJu0Yx5xsYDyT729FBeDNotE7fZWHL+Y5uF9LHFzQmENlb40y+hpH8z
	tH13AnRDKcJkSxpXE7OhoPNY9U3U3PVF+7A2FT87ee3/EGQgvauhchnXwR1evzeM8MP+bV2TxCe
	zo9Ph
X-Gm-Gg: ASbGnctaLEcXtvKIy1PDoPHab9pv9f/Xmwd8hJBuLYEMJxAVsBu/cvY8iqKD4mWxD68
	ZC6M9Oc81PN8zOxbC9lsQ07lgy1ad+ISJKsKgzAj5XjKA9ospXyP1jLLvaDMnKZoYLEew7Snti+
	ewzI4Vi0SbJJ31/8OxFKu3RnsSv6bT52zWsxTkFhgeCGnx98/vJR8WNSE/j4IHrp9tI/x2rEds7
	hF4dReDKITBuJqfpzwdkgcGFRlVNBtQKl/LJsuClL7gVXOyrplGH1dXfeuxE5MgaTUJwI2XX7hj
	8Uajvco3vA2Cg3JMxWcuZAwzAW0EHFpikw1Mir2p6mA=
X-Google-Smtp-Source: AGHT+IHT2qd8YL432FS2aBl9UAZUO5WTXQ8K1TJQ9tlt2c28UI7d+tPwRDkrvYl/JrEJzHYkmzWFQw==
X-Received: by 2002:a17:90b:4c0f:b0:311:e5b2:356b with SMTP id 98e67ed59e1d1-31250357dc4mr5745805a91.11.1748640150438;
        Fri, 30 May 2025 14:22:30 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c9d8:e2d0:bfbc:3a26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506be2622sm32621815ad.102.2025.05.30.14.22.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 14:22:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/14] linux-yocto/6.6: update to v6.6.91
Date: Fri, 30 May 2025 14:22:00 -0700
Message-ID: <071585947ccb284220eab273d8cec15902e9a124.1748639952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748639952.git.steve@sakoman.com>
References: <cover.1748639952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 21:22:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217548

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    615b9e10e337 Linux 6.6.91
    772934d9062a x86/its: FineIBT-paranoid vs ITS
    9f69fe3888f6 x86/its: Fix build errors when CONFIG_MODULES=n
    3b2234cd50a9 x86/its: Use dynamic thunks for indirect branches
    6699bf27a471 x86/ibt: Keep IBT disabled during alternative patching
    9e7364c32c6c x86/its: Align RETs in BHB clear sequence to avoid thunking
    ba1d70362658 x86/its: Add support for RSB stuffing mitigation
    61bed1ddb212 x86/its: Add "vmexit" option to skip mitigation on some CPUs
    f7ef7f6ccf2b x86/its: Enable Indirect Target Selection mitigation
    4754e29f43c6 x86/its: Add support for ITS-safe return thunk
    c5a5d8075231 x86/its: Add support for ITS-safe indirect thunk
    195579752c23 x86/its: Enumerate Indirect Target Selection (ITS) bug
    c6c1319d19fc Documentation: x86/bugs/its: Add ITS documentation
    a42e9162314f x86/speculation: Remove the extra #ifdef around CALL_NOSPEC
    0a90b50ebf24 x86/speculation: Add a conditional CS prefix to CALL_NOSPEC
    2eecf5cf21cb x86/speculation: Simplify and make CALL_NOSPEC consistent
    a8a8826bf655 x86/bhi: Do not set BHI_DIS_S in 32-bit mode
    a0ff7f679b5d x86/bpf: Add IBHF call at end of classic BPF
    1afebfeaf1eb x86/bpf: Call branch history clearing sequence on exit
    ca8a5626ca0c arm64: proton-pack: Add new CPUs 'k' values for branch mitigation
    80251f62028f arm64: bpf: Only mitigate cBPF programs loaded by unprivileged users
    42a20cf51011 arm64: bpf: Add BHB mitigation to the epilogue for cBPF programs
    73591041a551 arm64: proton-pack: Expose whether the branchy loop k value
    854da0ed0671 arm64: proton-pack: Expose whether the platform is mitigated by firmware
    054fc98d691a arm64: insn: Add support for encoding DSB
    746e7d285dcb io_uring: ensure deferred completions are posted for multishot
    51f1389b5fe1 io_uring: always arm linked timeouts prior to issue
    00f0dd1a0166 do_umount(): add missing barrier before refcount checks in sync case
    eba09f42393a nvme: unblock ctrl state transition for firmware update
    f5a7d616a547 drm/panel: simple: Update timings for AUO G101EVN010
    1c0620213f37 MIPS: Fix MAX_REG_OFFSET
    66c4ec15e329 iio: adc: dln2: Use aligned_s64 for timestamp
    8b5273051b61 iio: accel: adxl355: Make timestamp 64-bit aligned using aligned_s64
    9519771908fc types: Complement the aligned types with signed 64-bit one
    85d430aef40a iio: temp: maxim-thermocouple: Fix potential lack of DMA safe buffer.
    2b58e7c1e4b2 iio: accel: adxl367: fix setting odr for activity time update
    37a55b692d42 usb: usbtmc: Fix erroneous generic_read ioctl return
    1991ed796d9a usb: usbtmc: Fix erroneous wait_srq ioctl return
    e96be8bd53ab usb: usbtmc: Fix erroneous get_stb ioctl error returns
    e2fef620e5e0 USB: usbtmc: use interruptible sleep in usbtmc_read
    14f298c52188 usb: typec: ucsi: displayport: Fix NULL pointer access
    c9d8b0932e2b usb: typec: tcpm: delay SNK_TRY_WAIT_DEBOUNCE to SRC_TRYWAIT transition
    2d44ee69e6f5 usb: host: tegra: Prevent host controller crash when OTG port is used
    9b09b99a9510 usb: gadget: Use get_status callback to set remote wakeup capability
    0b32d03e79c1 usb: gadget: tegra-xudc: ACK ST_RC after clearing CTRL_RUN
    dffa51cf2d3f usb: gadget: f_ecm: Add get_status callback
    1981926eb34a usb: cdnsp: fix L1 resume issue for RTL_REVISION_NEW_LPM version
    d84603122591 usb: cdnsp: Fix issue with resuming from L1
    8c133a08524a ocfs2: stop quota recovery before disabling quotas
    cc335d4f4e4f ocfs2: implement handshaking with ocfs2 recovery thread
    c7441aa8d078 ocfs2: switch osb->disable_recovery to enum
    cbd5108119d7 x86/microcode: Consolidate the loader enablement checking
    faa9059631d3 module: ensure that kobject_put() is safe for module type kobjects
    7e1c7748404b clocksource/i8253: Use raw_spinlock_irqsave() in clockevent_i8253_disable()
    cbfaf46b88a4 xenbus: Use kref to track req lifetime
    ffa14d4dc779 xen: swiotlb: Use swiotlb bouncing if kmalloc allocation demands it
    2ed98e89ebc2 smb: client: Avoid race in open_cached_dir with lease breaks
    671c05434d91 usb: uhci-platform: Make the clock really optional
    03f108a718a7 drm/amdgpu/hdp6: use memcfg register to post the write for HDP flush
    1824e914e291 drm/amdgpu/hdp5: use memcfg register to post the write for HDP flush
    7133ff3bedf3 drm/amdgpu/hdp5.2: use memcfg register to post the write for HDP flush
    05340a423c92 drm/amdgpu/hdp4: use memcfg register to post the write for HDP flush
    f647ce6d9b5d drm/amd/display: Copy AUX read reply data whenever length > 0
    79d982ae2f61 drm/amd/display: Fix wrong handling for AUX_DEFER case
    89850f11bb7c drm/amd/display: Remove incorrect checking in dmub aux handler
    cee6856fbf1c drm/amd/display: Fix the checking condition in dmub aux handling
    c8a91debb020 drm/amd/display: more liberal vmin/vmax update for freesync
    12125f7d9c15 drm/v3d: Add job to pending list if the reset was skipped
    9ce662851380 iio: imu: st_lsm6dsx: fix possible lockup in st_lsm6dsx_read_tagged_fifo
    da33c4167b9c iio: imu: st_lsm6dsx: fix possible lockup in st_lsm6dsx_read_fifo
    3413b87a9e17 iio: adis16201: Correct inclinometer channel resolution
    7748b1b27fbf iio: adc: rockchip: Fix clock initialization sequence
    badda05d6b99 iio: adc: ad7606: fix serial register access
    b229fa0d093c drm/amd/display: Shift DMUB AUX reply command if necessary
    d41072906abe x86/mm: Eliminate window where TLB flushes may be inadvertently skipped
    0f2b18c07604 staging: axis-fifo: Correct handling of tx_fifo_depth for size validation
    f4d6b9f413cb staging: axis-fifo: Remove hardware resets for user errors
    90db122533d2 staging: iio: adc: ad7816: Correct conditional logic for store mode
    f7adc4943853 Input: synaptics - enable InterTouch on TUXEDO InfinityBook Pro 14 v5
    85961bb7e494 Input: synaptics - enable SMBus for HP Elitebook 850 G1
    cbd085c424db Input: synaptics - enable InterTouch on Dell Precision M3800
    82b02402eee1 Input: synaptics - enable InterTouch on Dynabook Portege X30L-G
    c321045f088c Input: synaptics - enable InterTouch on Dynabook Portege X30-D
    2d9d6a4cd3be Input: xpad - fix two controller table values
    56b4e8b62124 Input: xpad - add support for 8BitDo Ultimate 2 Wireless Controller
    cbc82e7db16d Input: xpad - fix Share button on Xbox One controllers
    90fa6015ff83 Input: mtk-pmic-keys - fix possible null pointer dereference
    f72f0172079c Input: cyttsp5 - fix power control issue on wakeup
    dadbe33fee36 Input: cyttsp5 - ensure minimum reset pulse width
    ce4e826dbfe7 net: dsa: b53: fix learning on VLAN unaware bridges
    b1c9c58d09ed net: dsa: b53: always rejoin default untagged VLAN on bridge leave
    ca071649e291 net: dsa: b53: fix VLAN ID for untagged vlan on bridge leave
    a143c39add81 net: dsa: b53: fix flushing old pvid VLAN on pvid change
    aa00a30a28c7 net: dsa: b53: fix clearing PVID of a port
    0121c19ebd53 net: dsa: b53: allow leaky reserved multicast
    355b0526336c bpf: Scrub packet on bpf_redirect_peer
    a3dfec485401 netfilter: ipset: fix region locking in hash types
    adbc8cc11629 ipvs: fix uninit-value for saddr in do_output_route4
    42b7a7c962b2 can: gw: fix RCU/BH usage in cgw_create_job()
    3455e6394fef can: mcp251xfd: fix TDC setting for low data bit rates
    68f29bb97a0e net: ethernet: mtk_eth_soc: reset all TX queues on DMA free
    370635397b62 netdevice: add netdev_tx_reset_subqueue() shorthand
    fa1fe9f3ddb9 gre: Fix again IPv6 link-local address generation.
    31ff70ad3948 sch_htb: make htb_deactivate() idempotent
    af9e2d4732a5 ksmbd: fix memory leak in parse_lease_state()
    0236742bd959 openvswitch: Fix unsafe attribute parsing in output_userspace()
    fec1f9e9a650 ksmbd: Fix UAF in __close_file_table_ids
    04c8a38c6034 ksmbd: prevent out-of-bounds stream writes by validating *pos
    6ee551672c8c ksmbd: prevent rename with empty string
    3482037d0f66 can: mcp251xfd: mcp251xfd_remove(): fix order of unregistration calls
    73dde269a1a4 wifi: cfg80211: fix out-of-bounds access during multi-link element defragmentation
    d2520dc79c2a can: mcan: m_can_class_unregister(): fix order of unregistration calls
    0efe9965680b arm64: dts: imx8mm-verdin: Link reg_usdhc2_vqmmc to usdhc2
    38433aa31b43 dm: add missing unlock on in dm_keyslot_evict()
    9c2dd8954dad Linux 6.6.90
    ed3248a40374 dm: fix copying after src array boundaries
    fe465003bb63 xhci: fix possible null pointer dereference at secondary interrupter removal
    3efb29f6a78d usb: xhci: Check for xhci->interrupters being allocated in xhci_mem_clearup()
    bbc66abcd297 drm/amd/display: Fix slab-use-after-free in hdcp
    97a918755a4c drm/amd/display: Add scoped mutexes for amdgpu_dm_dhcp
    4306dbd7676e iommu/arm-smmu-v3: Fix iommu_device_probe bug due to duplicated stream ids
    3dc33f145a8a iommu/arm-smmu-v3: Use the new rb tree helpers
    8f2451ebaf5b drivers: base: handle module_kobject creation
    ace531f2fea1 kernel: globalize lookup_or_create_module_kobject()
    0ecbb45e30ab kernel: param: rename locate_module_kobject
    baa3ebbad80f xhci: Limit time spent with xHC interrupts disabled during bus resume
    ebb7195dac40 xhci: support setting interrupt moderation IMOD for secondary interrupters
    cc64775afb27 usb: xhci: check if 'requested segments' exceeds ERST capacity
    3733697cb7dd xhci: Add helper to set an interrupters interrupt moderation interval
    bcd191d7bab2 xhci: add support to allocate several interrupters
    ff0a51339a3b xhci: split free interrupter into separate remove and free parts
    3f6e8ad65b1e xhci: Clean up stale comment on ERST_SIZE macro
    f377434945f5 xhci: Use more than one Event Ring segment
    6299fb6190fe xhci: Set DESI bits in ERDP register correctly
    5e8c311318fa Revert "drm/meson: vclk: fix calculation of 59.94 fractional rates"
    f129d8aea8b1 arm64: dts: st: Use 128kB size for aliased GIC400 register access on stm32mp25 SoCs
    ce2fa5bc0158 arm64: dts: st: Adjust interrupt-controller for stm32mp25 SoCs
    fabe73032383 ARM: dts: opos6ul: add ksz8081 phy properties
    f68f93c9d043 firmware: arm_ffa: Skip Rx buffer ownership release if not acquired
    2fbf6c9695ad firmware: arm_scmi: Balance device refcount when destroying devices
    e762ec4c7b34 sch_ets: make est_qlen_notify() idempotent
    36269156033f sch_qfq: make qfq_qlen_notify() idempotent
    9030a91235ae sch_hfsc: make hfsc_qlen_notify() idempotent
    077e355dae44 sch_drr: make drr_qlen_notify() idempotent
    bbbf5e0f8707 sch_htb: make htb_qlen_notify() idempotent
    b9ded1fb298b riscv: Pass patch_text() the length in bytes
    85484bc61138 ASoC: soc-core: Stop using of_property_read_bool() for non-boolean properties
    54583776e416 ASoC: Use of_property_read_bool()
    29ea1abc7d4f net: vertexcom: mse102x: Fix RX error handling
    6ac8ec92f53f net: vertexcom: mse102x: Add range check for CMD_RTS
    04d9c3407986 net: vertexcom: mse102x: Fix LEN_MASK
    e1301580bf0b net: vertexcom: mse102x: Fix possible stuck of SPI interrupt
    cb5922f74b40 net: hns3: defer calling ptp_clock_register()
    accb5a8ef129 net: hns3: fixed debugfs tm_qset size
    c1b1d3b0d8e4 net: hns3: fix an interrupt residual problem
    67d587bfa349 net: hns3: store rx VLAN tag offload state for VF
    7e1ca1bed3f6 octeon_ep: Fix host hang issue during device reboot
    0e32cbcbc4cb net: fec: ERR007885 Workaround for conventional TX
    dae1ce27ceae net: lan743x: Fix memleak issue when GSO enabled
    ec00ea56450e nvme-tcp: fix premature queue removal and I/O failover
    252a5a67adc7 bnxt_en: Fix ethtool -d byte order for 32-bit values
    4d69864915a3 bnxt_en: Fix out-of-bound memcpy() during ethtool -w
    3facfd720055 bnxt_en: Fix coredump logic to free allocated buffer
    e0272844995a net: ipv6: fix UDPv6 GSO segmentation with NAT
    8acf08b1e4ec net: dsa: felix: fix broken taprio gate states after clock jump
    cb625f783f70 net: ethernet: mtk_eth_soc: fix SER panic with 4GB+ RAM
    683ad6d7f489 igc: fix lock order in igc_ptp_reset
    2399d1a75033 net: mdio: mux-meson-gxl: set reversed bit when using internal phy
    1bbbdfc247f4 net: dlink: Correct endianness handling of led_mode
    012a413b28e1 nvme-pci: fix queue unquiesce check on slot_reset
    ce4f77bef276 ALSA: ump: Fix buffer overflow at UMP SysEx message conversion
    eae60cfe25d0 ice: Check VF VSI Pointer Value in ice_vc_add_fdir_fltr()
    a43783119e01 net_sched: qfq: Fix double list add in class with netem as child qdisc
    72c3da7e6ceb net_sched: ets: Fix double list add in class with netem as child qdisc
    6082a87af4c5 net_sched: hfsc: Fix a UAF vulnerability in class with netem as child qdisc
    db205b92dfe0 net_sched: drr: Fix double list add in class with netem as child qdisc
    9b467c5bcdb4 pds_core: remove write-after-free of client_id
    0861fccd43b8 pds_core: specify auxiliary_device to be created
    da23d7edb215 pds_core: make pdsc_auxbus_dev_del() void
    452fa190dd2e pds_core: delete VF dev on reset
    5e51c0b51b25 pds_core: check health in devcmd wait
    5ba9380f79f2 net: ethernet: mtk-star-emac: rearm interrupts in rx_poll only when advised
    7cb10f17bddc net: ethernet: mtk-star-emac: fix spinlock recursion issues on rx/tx poll
    a74777bb1827 net: mscc: ocelot: delete PVID VLAN when readding it as non-PVID
    dc7ffe02adda net: mscc: ocelot: treat 802.1ad tagged traffic as 802.1Q-untagged
    8c7bfb6198a7 Bluetooth: L2CAP: copy RX timestamp to new fragments
    8dde02229b3c net: Rename mono_delivery_time to tstamp_type for scalabilty
    2e8d44ebaa7b Bluetooth: btusb: avoid NULL pointer dereference in skb_dequeue()
    dd20a33a0db0 net/mlx5: E-switch, Fix error handling for enabling roce
    bab395c89127 net/mlx5: E-Switch, Initialize MAC Address for Default GID
    3576e9a80b6c vxlan: vnifilter: Fix unlocked deletion of default FDB entry
    029f11349ec9 powerpc/boot: Fix dash warning
    36a9a2647810 wifi: plfxlc: Remove erroneous assert in plfxlc_mac_release
    c5a5de348c05 drm/i915/pxp: fix undefined reference to `intel_pxp_gsccs_is_ready_for_sessions'
    27a1efe21f9e powerpc/boot: Check for ld-option support
    9a8d4d7072d4 book3s64/radix : Align section vmemmap start address to PAGE_SIZE
    8890eeae5c82 ASoC: soc-pcm: Fix hw_params() and DAPM widget sequence
    a6dbcf69d4c4 iommu: Handle race with default domain setup
    a1723e9c53fe KVM: x86: Load DR6 with guest value only before entering .vcpu_run() loop
    46acbfbcc0e2 PCI: imx6: Skip controller_id generation logic for i.MX7D
    28cfd94980bb Revert "PCI: imx6: Skip controller_id generation logic for i.MX7D"
    47e24c86cb20 selftests/bpf: extend changes_pkt_data with cases w/o subprograms
    3a467d938da2 bpf: fix null dereference when computing changes_pkt_data of prog w/o subprogs
    b7c0d2d4ef13 selftests/bpf: validate that tail call invalidates packet pointers
    f1692ee23dca bpf: consider that tail calls invalidate packet pointers
    70234fbfa266 selftests/bpf: freplace tests for tracking of changes_packet_data
    7197fc4acdf2 bpf: check changes_pkt_data property for extension programs
    85a30a46396a selftests/bpf: test for changing packet data from global functions
    79751e9227a5 bpf: track changes_pkt_data property for global functions
    3d496a1eaaec bpf: refactor bpf_helper_changes_pkt_data to use helper number
    f0b56f1d2fcc bpf: add find_containing_subprog() utility function
    056ebbddb8fa tracing: Fix oob write in trace_seq_to_buffer()
    25687fd19633 cpufreq: Fix setting policy limits when frequency tables are used
    cbd54987db25 cpufreq: Avoid using inconsistent policy->min and policy->max
    e76948644ec7 smb: client: fix zero length for mkdir POSIX create context
    b44746356223 ksmbd: fix use-after-free in kerberos authentication
    a45445b6093d platform/x86/intel-uncore-freq: Fix missing uncore sysfs during CPU hotplug
    3a868a7f8da4 platform/x86/amd: pmc: Require at least 2.5 seconds between HW sleep cycles
    f39493cf7023 iommu/vt-d: Apply quirk_iommu_igfx for 8086:0044 (QM57/QS57)
    13d67528e1ae iommu/amd: Fix potential buffer overflow in parse_ivrs_acpihid
    64e95bb37916 dm: always update the array size in realloc_argv on success
    ecc7f159d17e dm-integrity: fix a warning on invalid table line
    c8c83052283b dm-bufio: don't schedule in atomic context
    08424a0922fb wifi: brcm80211: fmac: Add error handling for brcmf_usb_dl_writeimage()
    8daa71c694b3 tracing: Do not take trace_event_sem in print_event_fields()
    75fda0e59168 spi: tegra114: Don't fail set_cs_timing when delays are zero
    3aa4aff158ea mmc: renesas_sdhi: Fix error handling in renesas_sdhi_probe
    4d1a2d136356 mm/memblock: repeat setting reserved region nid if array is doubled
    c0fabecd6510 mm/memblock: pass size instead of end to memblock_set_node()
    dfbaecf7e38f irqchip/qcom-mpm: Prevent crash when trying to handle non-wake GPIOs
    e51dd7126693 amd-xgbe: Fix to ensure dependent features are toggled with RX checksum offload
    34b6fa11431a perf/x86/intel: KVM: Mask PEBS_ENABLE loaded for guest with vCPU's value.
    6a098c51d18e parisc: Fix double SIGFPE crash
    3821cae9bd5a arm64: errata: Add missing sentinels to Spectre-BHB MIDR arrays
    ddf4e7f0f509 i2c: imx-lpi2c: Fix clock count when probe defers
    78cf306f7214 EDAC/altera: Set DDR and SDMMC interrupt mask before registration
    726641633413 EDAC/altera: Test the correct error reg offset
    126f5c6e0cb8 drm/nouveau: Fix WARN_ON in nouveau_fence_context_kill()
    94808275aa6c drm/fdinfo: Protect against driver unbind
    b364ee98aca9 btrfs: fix COW handling in run_delalloc_nocow()
    3ac18e0a94c1 ALSA: usb-audio: Add second USB ID for Jabra Evolve 65 headset
    f73ecbfa78ce ALSA: usb-audio: Add retry on -EPROTO from usb_set_interface()
    fd1aeef3e9c7 Revert "rndis_host: Flag RNDIS modems as WWAN devices"
    6a5b2ed82152 ARM: dts: am335x-bone-common: Increase MDIO reset deassert time
    ceb5fadbf450 Revert "v6.6 -stable -rt merge fixup"
    1c2962a164ff v6.6 -stable -rt merge fixup
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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index a07f576065..1cc29e632a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f5eaa9ffda0168a6c779dd79da8c5085d7c0bafa"
-SRCREV_meta ?= "60d2dc333c5a027c81bf12f650deebcf4337a5b0"
+SRCREV_machine ?= "d1fbd2d6727d1036c200e4b1aa0190aaf735b3de"
+SRCREV_meta ?= "f39840f2f44ad614ddf59c402b464a0ce7e04532"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.89"
+LINUX_VERSION ?= "6.6.91"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 1cb5652024..7db20c0959 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.89"
+LINUX_VERSION ?= "6.6.91"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "bea51ee05667a082fdb2de48f2b779920de37aab"
-SRCREV_meta ?= "60d2dc333c5a027c81bf12f650deebcf4337a5b0"
+SRCREV_machine ?= "d00f12b1b1a9fb6dc55c27c78c8c131e4a1cbdae"
+SRCREV_meta ?= "f39840f2f44ad614ddf59c402b464a0ce7e04532"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index b346190879..75b41a5317 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "46314bb9440c533de81ad6fd1e4465a1a92dbaf1"
-SRCREV_machine:qemuarm64 ?= "c2536612ab8cdfef938781c99eb8ef57466740fc"
-SRCREV_machine:qemuloongarch64 ?= "26ad3d3b1796f301f5491a94487ec7af0e5c4a34"
-SRCREV_machine:qemumips ?= "48a91048f92b14d77663c5faae98a2154c0c406b"
-SRCREV_machine:qemuppc ?= "a92a2bd6411a5dcf62ca06c947eab278edd56151"
-SRCREV_machine:qemuriscv64 ?= "26ad3d3b1796f301f5491a94487ec7af0e5c4a34"
-SRCREV_machine:qemuriscv32 ?= "26ad3d3b1796f301f5491a94487ec7af0e5c4a34"
-SRCREV_machine:qemux86 ?= "26ad3d3b1796f301f5491a94487ec7af0e5c4a34"
-SRCREV_machine:qemux86-64 ?= "26ad3d3b1796f301f5491a94487ec7af0e5c4a34"
-SRCREV_machine:qemumips64 ?= "3ef0bab27a99c6e29e97ef4e71a7967b31b4f562"
-SRCREV_machine ?= "26ad3d3b1796f301f5491a94487ec7af0e5c4a34"
-SRCREV_meta ?= "60d2dc333c5a027c81bf12f650deebcf4337a5b0"
+SRCREV_machine:qemuarm ?= "9c31285259d92c008165481f4120aded6e10c93a"
+SRCREV_machine:qemuarm64 ?= "c57114d59935f0a976f2ff18b1c7dbd5c24710b6"
+SRCREV_machine:qemuloongarch64 ?= "23977e07766767fc6144b53967998afa04fe9b96"
+SRCREV_machine:qemumips ?= "e27992a5fd0ac7678b59cec9219351fd8f16e3e5"
+SRCREV_machine:qemuppc ?= "5fde391143db93ac37953d90962beba1a4af31d1"
+SRCREV_machine:qemuriscv64 ?= "23977e07766767fc6144b53967998afa04fe9b96"
+SRCREV_machine:qemuriscv32 ?= "23977e07766767fc6144b53967998afa04fe9b96"
+SRCREV_machine:qemux86 ?= "23977e07766767fc6144b53967998afa04fe9b96"
+SRCREV_machine:qemux86-64 ?= "23977e07766767fc6144b53967998afa04fe9b96"
+SRCREV_machine:qemumips64 ?= "dd954fc36eb77f8aab6395ad7ff1341c3712aada"
+SRCREV_machine ?= "23977e07766767fc6144b53967998afa04fe9b96"
+SRCREV_meta ?= "f39840f2f44ad614ddf59c402b464a0ce7e04532"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "71e4ec9b2abccce5adecb3b354d0d5003f6f88f2"
+SRCREV_machine:class-devupstream ?= "615b9e10e3377467ced8f50592a1b5ba8ce053d8"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.89"
+LINUX_VERSION ?= "6.6.91"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


