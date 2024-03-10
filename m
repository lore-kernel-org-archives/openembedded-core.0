Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69821C54E68
	for <webhook@archiver.kernel.org>; Sun, 10 Mar 2024 16:01:13 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.40543.1710086468552051641
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Mar 2024 09:01:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GMMB6Z/A;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5bdbe2de25fso3136607a12.3
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 09:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710086468; x=1710691268; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OwNsutQVIpZIGwetlA4jFviGJISsL1/dyFsk8lKjcKw=;
        b=GMMB6Z/AOL//KUdcdIO+nyz8MPj+eb0y36+UBXVqygNSnTlXFgBiiAhSXNEotfTo6Y
         kJ1xbB4/Xbinui2qXxLAqeR5w235T8aRRXIY3LCR63KR+KEoMxuTo1wXrCO5MUeqP0Ui
         BiHbimvSyP0D/2LUQ21DP51BQWTVDB9LDNqtM81sUilcZNBNuuEU/BvbtSk5uWFrIoWW
         IQrALTnr3KJVbC/jvL7C2iQlH5/Nsh8oC5yoy2Ta0Hpi8+xauhgjGS4/3iGNoSQvM/8K
         rowS8sI1S8mbpkxfdi6uAHRjrDM+lI2BahTOhpAKaJg7kxQgqhauAkvnASc+2b2FgjXp
         QQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710086468; x=1710691268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OwNsutQVIpZIGwetlA4jFviGJISsL1/dyFsk8lKjcKw=;
        b=sSr9FloR+PksEoTaTMTpro5/JQcA3E9Q9IDfK8ko7KdgSoEffCQaYnptS8uQo9OM4o
         v5p7knM9mXojNzJoYPxXEhXN/uBRMhy5R+aKtSeDhWdh/c7J51k/F+a4YcN5vEl5OM6U
         rUWrXcEQc3gVzyPvAnsjsH4cMfJmCEqaks5+76E5gxQ2A8Fm8fH84mhkW93ZbucbQlEg
         VQ5F988x9uI7Opjnb0mYArvhUVwxWPOMeXVD5ELddhLhikFkUasSamUT1YnqY9l+6xvB
         ielATebfegFCKgYinBaybyiKnlMlbOmAgK3FDfGJI4uXQdAegQjM7BiygYWPCZL120uJ
         YkhA==
X-Gm-Message-State: AOJu0YzGC3ebAs1U5pj0QeGr2bZ8KRMjxsfdt8ygPg/80ZlSIt6zquDm
	drRSNewKjLpOBafiPoiTzclXk30m2XP4pzQzy/HSOziUrlAMUMXCCdG8N51w5FIMWM+nrXdDV8l
	9jok8tQ==
X-Google-Smtp-Source: AGHT+IH+xqkZz7yqQ89WBlkPj0LXH1KdfC7BUlx6AzsoXifc5e43DzfYVQO++0x8s4fxxHfNUqM0aQ==
X-Received: by 2002:a17:902:da86:b0:1dd:93a4:3c7f with SMTP id j6-20020a170902da8600b001dd93a43c7fmr1565672plx.56.1710086466551;
        Sun, 10 Mar 2024 09:01:06 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id e9-20020a170902cf4900b001da105d6a83sm2836862plg.224.2024.03.10.09.01.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 09:01:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 3/5] linux-yocto/6.1: update to v6.1.78
Date: Sun, 10 Mar 2024 06:00:52 -1000
Message-Id: <7aea35bdc1fb3a81b602402d697af8b8e0bf625e.1710086264.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710086264.git.steve@sakoman.com>
References: <cover.1710086264.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 16:01:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196896

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.1 to the latest korg -stable release that comprises
the following commits:

    8b4118fabd6e Linux 6.1.78
    1296c110c5a0 netfilter: nft_set_rbtree: skip end interval element from gc
    d89a80e4827d net: stmmac: xgmac: fix a typo of register name in DPP safety handling
    7b430fb92440 ALSA: usb-audio: Sort quirk table entries
    06040fadbfef net: stmmac: xgmac: use #define for string constants
    499e6e9f0737 clocksource: Skip watchdog check for large watchdog intervals
    492e0aba0884 block: treat poll queue enter similarly to timeouts
    cf3d57ad6ff8 f2fs: add helper to check compression level
    9f74b3d7183a RDMA/irdma: Fix support for 64k pages
    4675661672e3 vhost: use kzalloc() instead of kmalloc() followed by memset()
    d8712c6c6a38 Revert "ASoC: amd: Add new dmi entries for acp5x platform"
    fbd77ce1d174 io_uring/net: fix sr->len for IORING_OP_RECV with MSG_WAITALL and buffers
    08249dc3d9c1 Input: atkbd - skip ATKBD_CMD_SETLEDS when skipping ATKBD_CMD_GETID
    315075ac739c Input: i8042 - fix strange behavior of touchpad on Clevo NS70PU
    a94d303bea6b hrtimer: Report offline hrtimer enqueue
    8b380ad970d0 usb: host: xhci-plat: Add support for XHCI_SG_TRB_CACHE_SIZE_QUIRK
    f2cf6db28545 usb: dwc3: host: Set XHCI_SG_TRB_CACHE_SIZE_QUIRK
    041cb58f54f5 USB: serial: cp210x: add ID for IMST iM871A-USB
    36ef5b7b4f0a USB: serial: option: add Fibocom FM101-GL variant
    234099ab7f8a USB: serial: qcserial: add new usb-id for Dell Wireless DW5826e
    39fbca505fe6 ALSA: usb-audio: add quirk for RODE NT-USB+
    2552f6b1bd64 ALSA: usb-audio: Add a quirk for Yamaha YIT-W12TX transmitter
    b8259a502320 ALSA: usb-audio: Add delay quirk for MOTU M Series 2nd revision
    82761993d429 mtd: parsers: ofpart: add workaround for #size-cells 0
    b478e414cf85 fs: dlm: don't put dlm_local_addrs on heap
    e5dc63f01e02 blk-iocost: Fix an UBSAN shift-out-of-bounds warning
    1ebd75cefaac scsi: core: Move scsi_host_busy() out of host lock if it is for per-command
    ec1bedd79758 fs/ntfs3: Fix an NULL dereference bug
    a442ff5405d7 netfilter: nft_set_pipapo: remove scratch_aligned pointer
    fac3478d5b87 netfilter: nft_set_pipapo: add helper to release pcpu scratch area
    3eaab7d565be netfilter: nft_set_pipapo: store index in scratch maps
    181dade25130 netfilter: nft_ct: reject direction for ct id
    efdd665ce1a1 drm/amd/display: Implement bounds check for stream encoder creation in DCN301
    a060da32357a netfilter: nft_compat: restrict match/target protocol to u16
    8762bcc92719 netfilter: nft_compat: reject unused compat flag
    e79ef7966ee9 netfilter: nft_compat: narrow down revision to unsigned 8-bits
    69d66d493b1f selftests: cmsg_ipv6: repeat the exact packet
    4e2c4846b250 ppp_async: limit MRU to 64K
    e0e09186d882 af_unix: Call kfree_skb() for dead unix_(sk)->oob_skb in GC.
    3d3a5b31b435 tipc: Check the bearer type before calling tipc_udp_nl_bearer_add()
    cf6b97e1830e rxrpc: Fix response to PING RESPONSE ACKs to a dead call
    05a4d0e16615 drm/i915/gvt: Fix uninitialized variable in handle_mmio()
    54538752216b inet: read sk->sk_family once in inet_recv_error()
    3fa78ee0e381 hwmon: (coretemp) Fix bogus core_id to attr name mapping
    9bce69419271 hwmon: (coretemp) Fix out-of-bounds memory access
    a3156be201cf hwmon: (aspeed-pwm-tacho) mutex for tach reading
    406574668634 octeontx2-pf: Fix a memleak otx2_sq_init
    cbf2e1660259 atm: idt77252: fix a memleak in open_card_ubr0
    e37cde7a5716 tunnels: fix out of bounds access when building IPv6 PMTU error
    90fe47743a2b selftests: net: avoid just another constant wait
    7f484179c53a selftests: net: cut more slack for gro fwd tests.
    466ceebe48cb net: atlantic: Fix DMA mapping for PTP hwts ring
    0193e0660cc6 netdevsim: avoid potential loop in nsim_dev_trap_report_work()
    bcabbf8ab5c6 wifi: mac80211: fix waiting for beacons logic
    e42ff0844fe4 net: stmmac: xgmac: fix handling of DPP safety error for DMA channels
    fb8bfc6ea3cd drm/msm/dpu: check for valid hw_pp in dpu_encoder_helper_phys_cleanup
    42939a1ea6d4 drm/msm/dp: return correct Colorimetry for DP_TEST_DYNAMIC_RANGE_CEA case
    d2b7e247f368 drm/msms/dp: fixed link clock divider bits be over written in BPC unknown case
    cbc53148cc09 cifs: failure to add channel on iface should bump up weight
    0430bfcd4665 phy: ti: phy-omap-usb2: Fix NULL pointer dereference for SRP
    296fb308f4f8 dmaengine: fix is_slave_direction() return false when DMA_DEV_TO_DEV
    ed3bb52a05d3 phy: renesas: rcar-gen3-usb2: Fix returning wrong error code
    25ab4d72eb7c dmaengine: fsl-qdma: Fix a memory leak related to the queue command DMA
    13535ae76655 dmaengine: fsl-qdma: Fix a memory leak related to the status queue DMA
    908939b8e81a dmaengine: ti: k3-udma: Report short packet errors
    a1d7ca71ba1a dmaengine: fsl-dpaa2-qdma: Fix the size of dma pools
    78327acd4cdc ext4: regenerate buddy after block freeing failed if under fc replay
    f1bb70486c9c Linux 6.1.77
    d78690bb5d17 drm/amdgpu: Fix missing error code in 'gmc_v6/7/8/9_0_hw_init()'
    f086c50a9834 ASoC: codecs: wsa883x: fix PA volume control
    ac86261fa87b ASoC: codecs: lpass-wsa-macro: fix compander volume hack
    2386ee6cba10 bonding: remove print in bond_verify_device_path
    e1edd8e6c061 gve: Fix use-after-free vulnerability
    9e584ea1010b LoongArch/smp: Call rcutree_report_cpu_starting() at tlb_init()
    98c392a91a6e drm/msm/dsi: Enable runtime PM
    befdb0a8a195 Revert "drm/amd/display: Disable PSR-SU on Parade 0803 TCON again"
    dc904345e377 mm, kmsan: fix infinite recursion due to RCU critical section
    c5a12dfbfa76 arm64: irq: set the correct node for shadow call stack
    ddd367ebc446 selftests: bonding: Check initial state
    7ebe20e63290 selftests: team: Add missing config options
    aaa8f7684588 net: sysfs: Fix /sys/class/net/<iface> path
    bea0fbf8573c selftests: net: fix available tunnels detection
    a2104f438764 af_unix: fix lockdep positive in sk_diag_dump_icons()
    fde3d47efe4d net: ipv4: fix a memleak in ip_setup_cork
    0f501dae16b7 netfilter: nft_ct: sanitize layer 3 and 4 protocol number in custom expectations
    9ff981cd65cd netfilter: nf_log: replace BUG_ON by WARN_ON_ONCE when putting logger
    67f0ca0a4c85 netfilter: nf_tables: restrict tunnel object to NFPROTO_NETDEV
    8a51dbf7b72c netfilter: conntrack: correct window scaling with retransmitted SYN
    cd091ca44c42 selftests: net: add missing config for GENEVE
    04a553d8ac15 bridge: mcast: fix disabled snooping after long uptime
    9c333d9891f3 llc: call sock_orphan() at release time
    c59ed6592fb1 ipv6: Ensure natural alignment of const ipv6 loopback and router addresses
    2f3d9829f74d net: dsa: qca8k: fix illegal usage of GPIO
    1e4c227805f2 ixgbe: Fix an error handling path in ixgbe_read_iosf_sb_reg_x550()
    3b84b7000c61 ixgbe: Refactor overtemp event handling
    9c8eafc5e9e8 ixgbe: Refactor returning internal error codes
    b383d4ea272f tcp: add sanity checks to rx zerocopy
    046260ce7ca5 net: lan966x: Fix port configuration when using SGMII interface
    d2f1b7fe74af ipmr: fix kernel panic when forwarding mcast packets
    03dc5b73af2e ipv4: raw: add drop reasons
    d54e4da98bbf ip6_tunnel: make sure to pull inner header in __ip6_tnl_rcv()
    262caadfa970 selftests: net: give more time for GRO aggregation
    53e94ec530e3 HID: hidraw: fix a problem of memory leak in hidraw_release()
    db6338f45971 scsi: core: Move scsi_host_busy() out of host lock for waking up EH handler
    81e92f0c97ea regulator: ti-abb: don't use devm_platform_ioremap_resource_byname for shared interrupt register
    7eb86ddaf1eb scsi: isci: Fix an error code problem in isci_io_request_build()
    206dcd2624b9 drm: using mul_u32_u32() requires linux/math64.h
    a2f30104fe5f wifi: cfg80211: fix RCU dereference in __cfg80211_bss_update
    071d98d5ee15 perf: Fix the nr_addr_filters fix
    8eea7e1d69e2 drm/amdkfd: Fix 'node' NULL check in 'svm_range_get_range_boundaries()'
    7513f0906c22 drm/amdgpu: Release 'adev->pm.fw' before return in 'amdgpu_device_need_post()'
    af8e2926152b drm/amdgpu: Fix with right return code '-EIO' in 'amdgpu_gmc_vram_checking()'
    d282ea070313 drm/amd/powerplay: Fix kzalloc parameter 'ATOM_Tonga_PPM_Table' in 'get_platform_power_management_table()'
    3fbfeb8536bc ceph: fix invalid pointer access if get_quota_realm return ERR_PTR
    7f2649c94264 ceph: fix deadlock or deadcode of misusing dget()
    692ead237df9 ceph: reinitialize mds feature bit even when session in open
    1d9c777d3e70 blk-mq: fix IO hang from sbitmap wakeup race
    1f7a0188579e virtio_net: Fix "‘%d’ directive writing between 1 and 11 bytes into a region of size 10" warnings
    b602f098f716 drm/amdkfd: Fix lock dependency warning with srcu
    8b25d397162b drm/amdkfd: Fix lock dependency warning
    49a7b708da92 libsubcmd: Fix memory leak in uniq()
    2c1164ad927e misc: lis3lv02d_i2c: Add missing setting of the reg_ctrl callback
    91f197748738 9p: Fix initialisation of netfs_inode for 9p
    fc557b76dcf0 PCI/AER: Decode Requester ID when no error info found
    83c895561adc PCI: Fix 64GT/s effective data rate calculation
    521f28eedd6b spmi: mediatek: Fix UAF on device remove
    089ebfab244b fs/kernfs/dir: obey S_ISGID
    c13bcbdb8415 tty: allow TIOCSLCKTRMIOS with CAP_CHECKPOINT_RESTORE
    d8d7ffefc075 selftests/sgx: Fix linker script asserts
    fa3f6cd20def usb: hub: Add quirk to decrease IN-ep poll interval for Microchip USB491x hub
    9cdf5ddb06ee usb: hub: Replace hardcoded quirk value with BIT() macro
    4c8ca96124d5 perf cs-etm: Bump minimum OpenCSD version to ensure a bugfix is present
    1d83c8592264 PCI: switchtec: Fix stdev_release() crash after surprise hot remove
    5e0160dab118 PCI: Only override AMD USB controller if required
    26b8a35fef98 mailbox: arm_mhuv2: Fix a bug for mhuv2_sender_interrupt
    6e8c0eda6cca mfd: ti_am335x_tscadc: Fix TI SoC dependencies
    52e7f0554952 xen/gntdev: Fix the abuse of underlying struct page in DMA-buf import
    e827364bc147 i3c: master: cdns: Update maximum prescaler value for i2c clock
    4f7dad73df4c um: time-travel: fix time corruption
    d8512cc8ac05 um: net: Fix return type of uml_net_start_xmit()
    d8264ce2f875 um: Don't use vfprintf() for os_info()
    a95e52af36a0 um: Fix naming clash between UML and scheduler
    7d1c4e580943 leds: trigger: panic: Don't register panic notifier if creating the trigger failed
    2cb659ef0ac7 ALSA: hda/conexant: Fix headset auto detect fail in cx8070 and SN6140
    05a0900bd7a5 drm/amdkfd: Fix iterator used outside loop in 'kfd_add_peer_prop()'
    34bb1b97c370 drm/amdgpu: Drop 'fence' check in 'to_amdgpu_amdkfd_fence()'
    66d38977e226 drm/amdgpu: Fix '*fw' from request_firmware() not released in 'amdgpu_ucode_request()'
    da08dbb64729 drm/amdgpu: Let KFD sync with VM fences
    adae24c5b342 drm/amdgpu: Fix ecc irq enable/disable unpaired
    aade0a07609b clk: imx: clk-imx8qxp: fix LVDS bypass, pixel and phy clocks
    7294b1bbaa57 drm/amd/display: make flip_timestamp_in_us a 64-bit variable
    c95d2144be77 watchdog: it87_wdt: Keep WDTCTRL bit 3 unmodified for IT8784/IT8786
    ec74a45e8028 clk: mmp: pxa168: Fix memory leak in pxa168_clk_init()
    14992bc77ff4 clk: hi3620: Fix memory leak in hi3620_mmc_clk_init()
    d443fb67ca5a drm/amdgpu: fix ftrace event amdgpu_bo_move always move on same heap
    fe7e8ec07259 drm/msm/dpu: fix writeback programming for YUV cases
    7593e62702a1 drm/msm/dpu: Ratelimit framedone timeout msgs
    fb017c3e6acc drm/amd/display: For prefetch mode > 0, extend prefetch if possible
    4ef53b7e301d media: i2c: imx335: Fix hblank min/max values
    5008bde32c02 media: ddbridge: fix an error code problem in ddb_probe
    6408851d05a4 media: amphion: remove mutext lock in condition of wait_event
    5108a2dc2db5 IB/ipoib: Fix mcast list locking
    fe80290b2ad1 drm/exynos: Call drm_atomic_helper_shutdown() at shutdown/unbind time
    7c972c894575 f2fs: fix to tag gcing flag on page during block migration
    fb55c3cee6db hwmon: (nct6775) Fix fan speed set failure in automatic mode
    bf808f58681c media: rkisp1: Fix IRQ disable race issue
    f0d0fe37873c media: rkisp1: Store IRQ lines
    fb71b54856c4 media: rkisp1: Fix IRQ handler return values
    1c51b6b0c62d media: rkisp1: Drop IRQF_SHARED
    c3f77c5d63be ALSA: hda: Intel: add HDA_ARL PCI ID support
    3b28da57d0c9 PCI: add INTEL_HDA_ARL to pci_ids.h
    16786b70903c media: rockchip: rga: fix swizzling for RGB formats
    1ef8beb4bf5d media: stk1160: Fixed high volume of stk1160_dbg messages
    25eaa9f999cd drm/mipi-dsi: Fix detach call without attach
    f3e41cc26067 drm/framebuffer: Fix use of uninitialized variable
    406f8d5bade8 drm/drm_file: fix use of uninitialized variable
    48ad42cd95ac ASoC: amd: Add new dmi entries for acp5x platform
    b6ca70f06e21 f2fs: fix write pointers on zoned device after roll forward
    9773a96eac93 drm/amd/display: Fix tiled display misalignment
    126543736f25 drm/bridge: anx7625: Fix Set HPD irq detect window to 2ms
    3c2bd20dc9e3 drm/panel-edp: Add override_edid_mode quirk for generic edp
    055c84972447 RDMA/IPoIB: Fix error code return in ipoib_mcast_join
    c4cb42824e6e fast_dput(): handle underflows gracefully
    0ee8e0a183b0 ASoC: doc: Fix undefined SND_SOC_DAPM_NOPM argument
    52e25a323c3d ALSA: hda: Refer to correct stream index at loops
    b1020a546779 f2fs: fix to check return value of f2fs_reserve_new_block()
    332a7c108eca net: dsa: qca8k: put MDIO bus OF node on qca8k_mdio_register() failure
    0438a985deba octeontx2-af: Fix max NPC MCAM entry check while validating ref_entry
    95173204b1ff i40e: Fix VF disable behavior to block all traffic
    9f9ac39adbe2 bridge: cfm: fix enum typo in br_cc_ccm_tx_parse
    a243e0818e97 net/smc: disable SEID on non-s390 archs where virtual ISM may be used
    388736c62bf9 Bluetooth: L2CAP: Fix possible multiple reject send
    6d95ade9e647 Bluetooth: hci_sync: fix BR/EDR wakeup bug
    a836b1c3333d Bluetooth: qca: Set both WIDEBAND_SPEECH and LE_STATES quirks for QCA2066
    da1a6e9f01e7 wifi: cfg80211: free beacon_ies when overridden from hidden BSS
    3bb09b9af151 wifi: rtlwifi: rtl8723{be,ae}: using calculate_bit_shift()
    12473265f50c libbpf: Fix NULL pointer dereference in bpf_object__collect_prog_relos
    68ef19417a9a wifi: rtl8xxxu: Add additional USB IDs for RTL8192EU devices
    e15fa0c67eef arm64: dts: amlogic: fix format for s4 uart node
    9e8338b72b35 ice: fix pre-shifted bit usage
    9c5541f3f0fd arm64: dts: qcom: msm8998: Fix 'out-ports' is a required property
    2fdbf9d9a0e3 arm64: dts: qcom: msm8996: Fix 'in-ports' is a required property
    fd9a2c700323 md: Whenassemble the array, consult the superblock of the freshest device
    8ae420190058 block: prevent an integer overflow in bvec_try_merge_hw_page
    44f6b75c095e net: dsa: mv88e6xxx: Fix mv88e6352_serdes_get_stats error path
    0edb3ae8bfa3 net: atlantic: eliminate double free in error handling logic
    ea12794ea617 ice: fix ICE_AQ_VSI_Q_OPT_RSS_* register values
    d4560c11c322 scsi: hisi_sas: Set .phy_attached before notifing phyup event HISI_PHYE_PHY_UP_PM
    dc15b313f3ca ARM: dts: imx23/28: Fix the DMA controller node name
    9388665a1249 ARM: dts: imx23-sansa: Use preferred i2c-gpios properties
    fb8e41af9525 ARM: dts: imx27-apf27dev: Fix LED name
    6ebe86575b0e ARM: dts: imx25/27: Pass timing0
    68b2e26225b2 ARM: dts: imx25: Fix the iim compatible string
    af7bbdac8973 block/rnbd-srv: Check for unlikely string overflow
    238ec612a26c ionic: bypass firmware cmds when stuck in reset
    434fcaf3721f ionic: pass opcode to devcmd_wait
    7dc0fefd37dd net: phy: at803x: fix passing the wrong reference for config_intr
    e7398f3e45d4 ARM: dts: imx1: Fix sram node
    7721a55c0234 ARM: dts: imx27: Fix sram node
    8a0285ed7e87 ARM: dts: imx: Use flash@0,0 pattern
    8953b37bb106 ARM: dts: imx25/27-eukrea: Fix RTC node name
    1acdaf9f290f ARM: dts: rockchip: fix rk3036 hdmi ports node
    574dcd3126aa wifi: wfx: fix possible NULL pointer dereference in wfx_set_mfp_ap()
    5a44a664ab85 bpf: Set uattr->batch.count as zero before batched update or deletion
    7719e56b203a scsi: libfc: Fix up timeout error in fc_fcp_rec_error()
    73fe92ddf90e scsi: libfc: Don't schedule abort twice
    d6d6fe4bb105 bpf: Check rcu_read_lock_trace_held() before calling bpf map helpers
    c07965d1a771 wifi: ath11k: fix race due to setting ATH11K_FLAG_EXT_IRQ_ENABLED too early
    25c6f49ef59b wifi: ath9k: Fix potential array-index-out-of-bounds read in ath9k_htc_txstatus()
    db30f469ae8b ARM: dts: imx7s: Fix nand-controller #size-cells
    6fa750d62f2a ARM: dts: imx7s: Fix lcdif compatible
    c9c2a3582093 ARM: dts: imx7d: Fix coresight funnel ports
    89fdf0a2c74f scsi: arcmsr: Support new PCI device IDs 1883 and 1886
    61c859bd6679 scsi: mpi3mr: Add PCI checks where SAS5116 diverges from SAS4116
    5c4cbec5106d net: usb: ax88179_178a: avoid two consecutive device resets
    cd4cdad9bd3a bonding: return -ENOMEM instead of BUG in alb_upper_dev_walk
    c0d5a69322eb PCI: Add no PM reset quirk for NVIDIA Spectrum devices
    04dcef4a780a scsi: lpfc: Fix possible file string name overflow when updating firmware
    c0a96adce287 soc: xilinx: fix unhandled SGI warning message
    01946c3c83b2 soc: xilinx: Fix for call trace due to the usage of smp_processor_id()
    fd937767d586 selftests/bpf: Fix issues in setup_classid_environment()
    f58cfb63e4d7 wifi: rt2x00: correct wrong BBP register in RxDCOC calibration
    ad0e7bbc0ba2 selftests/bpf: Fix pyperf180 compilation failure with clang18
    76ab331d6d65 selftests/bpf: satisfy compiler by having explicit return in btf test
    739b3ccd9486 wifi: rt2x00: restart beacon queue when hardware reset
    6d2cbf517dca ext4: avoid online resizing failures due to oversized flex bg
    dd10f82ece2e ext4: remove unnecessary check from alloc_flex_gd()
    60292a12a08e ext4: unify the type of flexbg_size to unsigned int
    069ede047554 ext4: fix inconsistent between segment fstrim and full fstrim
    80cab9dad5e9 ecryptfs: Reject casefold directory inodes
    e8ca3e73301e SUNRPC: Fix a suspicious RCU usage warning
    0671f42a9c10 KVM: s390: fix setting of fpc register
    7a4d6481fbdd s390/ptrace: handle setting of fpc register correctly
    08f65c9067bb s390/vfio-ap: fix sysfs status attribute for AP queue devices
    d6c8d8ab761f arch: consolidate arch_irq_work_raise prototypes
    3537f92cd22c jfs: fix array-index-out-of-bounds in diNewExt
    b03d76cc6671 rxrpc_find_service_conn_rcu: fix the usage of read_seqbegin_or_lock()
    ea4eb77c533c afs: fix the usage of read_seqbegin_or_lock() in afs_find_server*()
    eef7c4cd9844 afs: fix the usage of read_seqbegin_or_lock() in afs_lookup_volume_rcu()
    91256fcd578a crypto: stm32/crc32 - fix parsing list of devices
    e0e78522b47f erofs: fix ztailpacking for subpage compressed blocks
    6c7bdb97d470 crypto: octeontx2 - Fix cptvf driver cleanup
    75b0f71b26b3 pstore/ram: Fix crash when setting number of cpus to an odd number
    32e8f2d95528 jfs: fix uaf in jfs_evict_inode
    70780914cb57 jfs: fix array-index-out-of-bounds in dbAdjTree
    cab0c265ba18 jfs: fix slab-out-of-bounds Read in dtSearch
    e4cbc857d75d UBSAN: array-index-out-of-bounds in dtSplitRoot
    42f433785f10 FS:JFS:UBSAN:array-index-out-of-bounds in dbAdjTree
    185d97e5be7f ACPI: APEI: set memory failure flags as MF_ACTION_REQUIRED on synchronous events
    31569995fc65 PM / devfreq: Synchronize devfreq_monitor_[start/stop]
    7633b7a036c2 ACPI: NUMA: Fix the logic of getting the fake_pxm value
    33650372e3ea ACPI: extlog: fix NULL pointer dereference check
    431c1a492107 PNP: ACPI: fix fortify warning
    81eb8b56e70c ACPI: video: Add quirk for the Colorful X15 AT 23 Laptop
    4d4e06eaa251 audit: Send netlink ACK before setting connection in auditd_set
    3430936a0146 regulator: core: Only increment use_count when enable_count changes
    b3ae38966d1c debugobjects: Stop accessing objects after releasing hash bucket lock
    74ec093dba93 perf/core: Fix narrow startup race when creating the perf nr_addr_filters sysfs file
    d67e43be0e30 x86/mce: Mark fatal MCE's page as poison to avoid panic in the kdump kernel
    abd26515d4b7 powerpc/lib: Validate size for vector operations
    0be5614f26c1 powerpc: pmd_move_must_withdraw() is only needed for CONFIG_TRANSPARENT_HUGEPAGE
    d4908b3431bf x86/boot: Ignore NMIs during very early boot
    a6fd14db752a powerpc/64s: Fix CONFIG_NUMA=n build due to create_section_mapping()
    cf3256c43106 powerpc/mm: Fix build failures due to arch_reserved_kernel_pages()
    7ad4b2a6b279 powerpc: Fix build error due to is_valid_bugaddr()
    d87d9a23a1f5 drivers/perf: pmuv3: don't expose SW_INCR event in sysfs
    4431284f4a94 arm64: irq: set the correct node for VMAP stack
    d482d61025e3 powerpc/mm: Fix null-pointer dereference in pgtable_cache_add
    9e5c37e0fa0e asm-generic: make sparse happy with odd-sized put_unaligned_*()
    e5c3b988b827 Linux 6.1.76
    d7dc6a860491 net/mlx5e: Handle hardware IPsec limits events
    e90c7d26cab1 serial: core: fix kernel-doc for uart_port_unlock_irqrestore()
    c02d3872c8dd x86/entry/ia32: Ensure s32 is sign extended to s64
    cf0b4ba4b0f1 tick/sched: Preserve number of idle sleeps across CPU hotplug events
    e333bbb557dc mips: Call lose_fpu(0) before initializing fcr31 in mips_set_personality_nan
    ec745eeff4d2 cxl/region：Fix overflow issue in alloc_hpa()
    1111abee590d MIPS: lantiq: register smp_ops on non-smp platforms
    b086f6d97977 spi: fix finalize message on error return
    598af91f622b spi: bcm-qspi: fix SFDP BFPT read by usig mspi read
    a2fa86e2bb67 drm/bridge: anx7625: Ensure bridge is suspended in disable()
    9564767b67f4 block: Move checking GENHD_FL_NO_PART to bdev_add_partition()
    4b84411165f8 gpio: eic-sprd: Clear interrupt after set the interrupt type
    23cf4cf4294f drm/exynos: gsc: minor fix for loop iteration in gsc_runtime_resume
    ba930885bfd2 drm/exynos: fix accidental on-stack copy of exynos_drm_plane
    c1cd4f9da526 drm/bridge: parade-ps8640: Make sure we drop the AUX mutex in the error case
    6ba690e7f7a4 drm/bridge: parade-ps8640: Ensure bridge is suspended in .post_disable()
    279f1cc56261 drm/bridge: sii902x: Fix audio codec unregistration
    e0f83c234ea7 drm/bridge: sii902x: Fix probing race issue
    c46f9c7f93f6 drm/bridge: sii902x: Use devm_regulator_bulk_get_enable()
    ed555f5b5cc9 drm: panel-simple: add missing bus flags for Tianma tm070jvhg[30/33]
    6b7fb2903aec drm/bridge: parade-ps8640: Wait for HPD when doing an AUX transfer
    f9a4c401bf4c Revert "powerpc/64s: Increase default stack size to 32KB"
    ec5e692cbad4 drm/panel-edp: drm/panel-edp: Fix AUO B116XAK01 name and timing
    f91c77d2c363 btrfs: zoned: optimize hint byte for zoned allocator
    4c45143447e6 btrfs: zoned: factor out prepare_allocation_zoned()
    b168029d67e9 serial: sc16is7xx: fix unconditional activation of THRI interrupt
    49d733c4bbee serial: sc16is7xx: Use port lock wrappers
    4fd9a0212142 serial: core: Provide port lock wrappers
    e11dea8f5033 dlm: use kernel_connect() and kernel_bind()
    fd7c2ffa0ea4 ARM: dts: qcom: sdx55: fix USB SS wakeup
    ecf87621b497 ARM: dts: qcom: sdx55: fix USB DP/DM HS PHY interrupts
    34d2c909c746 ARM: dts: qcom: sdx55: fix pdc '#interrupt-cells'
    bba1320ef21b ARM: dts: samsung: exynos4210-i9100: Unconditionally enable LDO12
    46cd7ef69fe6 ARM: dts: qcom: sdx55: fix USB wakeup interrupt types
    b87a1229d866 pipe: wakeup wr_wait after setting max_usage
    6f5c4aaddd63 fs/pipe: move check to pipe_has_watch_queue()
    28f010dc50df thermal: intel: hfi: Add syscore callbacks for system-wide PM
    b2517d141244 thermal: intel: hfi: Disable an HFI instance when all its CPUs go offline
    a8056e821ccf thermal: intel: hfi: Refactor enabling code into helper functions
    e1c9d32c9830 PM: sleep: Fix possible deadlocks in core system-wide PM code
    a9dbf8ca3101 PM: core: Remove unnecessary (void *) conversions
    ea3357c6cfab bus: mhi: ep: Do not allocate event ring element on stack
    512fc4d735c2 media: ov13b10: Enable runtime PM before registering async sub-device
    a14c2431e53a media: ov13b10: Support device probe in non-zero ACPI D state
    33bf23c9940d erofs: fix lz4 inplace decompression
    2197389e1a8a erofs: get rid of the remaining kmap_atomic()
    471ab2e8b7e1 drm/amdgpu/pm: Fix the power source flag error
    b4cbd018322b drm/amd/display: Port DENTIST hang and TDR fixes to OTG disable W/A
    7960f14fcad0 drm/bridge: nxp-ptn3460: simplify some error checking
    6341140b0445 platform/x86: intel-uncore-freq: Fix types in sysfs callbacks
    85d16c03ddd3 drm/amd/display: Disable PSR-SU on Parade 0803 TCON again
    b5fcb340b7b2 drm/tidss: Fix atomic_flush check
    2a81e844d1ff drm/bridge: nxp-ptn3460: fix i2c_master_send() error checking
    62f2e79cf9f4 drm: Don't unref the same fb many times by mistake due to deadlock handling
    635e996e6e3b cpufreq: intel_pstate: Refine computation of P-state for given frequency
    242996f50065 gpiolib: acpi: Ignore touchpad wakeup on GPD G1619-04
    6c495c84e24e xfs: read only mounts with fsopen mount API are busted
    7f95f6997f4f firmware: arm_scmi: Check mailbox/SMT channel for consistency
    2c939c74ef0b ksmbd: fix global oob in ksmbd_nl_policy
    2841631a0365 platform/x86: p2sb: Allow p2sb_bar() calls during PCI device probe
    8e34430e33b8 netfilter: nf_tables: reject QUEUE/DROP verdict parameters
    af149a46890e netfilter: nft_chain_filter: handle NETDEV_UNREGISTER for inet/ingress basechain
    5e7d8ddf2a38 hv_netvsc: Calculate correct ring size when PAGE_SIZE is not 4 Kbytes
    aa2cc9363926 wifi: iwlwifi: fix a memory corruption
    dcc54a54de54 exec: Fix error handling in begin_new_exec()
    4646445756ac rbd: don't move requests to the running list on errors
    6e6bca99e8d8 btrfs: don't abort filesystem when attempting to snapshot deleted subvolume
    52e02f26d01a btrfs: defrag: reject unknown flags of btrfs_ioctl_defrag_range_args
    86aff7c5f7c6 btrfs: don't warn if discard range is not aligned to sector
    b60f748a2fb6 btrfs: tree-checker: fix inline ref size in error messages
    c91c247be4de btrfs: ref-verify: free ref cache before clearing mount opt
    9ebd514fbdeb btrfs: avoid copying BTRFS_ROOT_SUBVOL_DEAD flag to snapshot of subvolume being deleted
    d9c54763e5cd nbd: always initialize struct msghdr completely
    0a5a083c2b6a net: fec: fix the unhandled context fault from smmu
    5b1086d22639 fjes: fix memleaks in fjes_hw_setup
    4b4dcb3f42dd selftests: netdevsim: fix the udp_tunnel_nic test
    cec65f09c47d net: mvpp2: clear BM pool before initialization
    acb6eaf2eac9 net: stmmac: Wait a bit for the reset to take effect
    67ee37360d41 netfilter: nf_tables: validate NFPROTO_* family
    ed5b62bbd451 netfilter: nf_tables: restrict anonymous set and map names to 16 bytes
    c25d7922ef0f btrfs: fix race between reading a directory and adding entries to it
    fd968e683bd9 btrfs: refresh dir last index during a rewinddir(3) call
    a045b6b19740 btrfs: set last dir index to the current last index when opening dir
    2aa515b5b501 btrfs: fix infinite directory reads
    bc6e242bb74e netfilter: nft_limit: reject configurations that cause integer overflow
    c817f5c01626 rcu: Defer RCU kthreads wakeup when CPU is dying
    b2fa86b2aceb net/mlx5e: fix a potential double-free in fs_any_create_groups
    42876db001bb net/mlx5e: fix a double-free in arfs_create_groups
    890881d10f35 net/mlx5e: Allow software parsing when IPsec crypto is enabled
    62ce16005ee4 net/mlx5: Use mlx5 device constant for selecting CQ period mode for ASO
    75d9ed4930b5 net/mlx5: DR, Can't go to uplink vport on RX rule
    e54aedd4d0e5 net/mlx5: DR, Use the right GVMI number for drop action
    f11792c3899c ipv6: init the accept_queue's spinlocks in inet6_create
    de061604f834 netlink: fix potential sleeping issue in mqueue_flush_file
    90fba981cacb tcp: Add memory barrier to tcp_push()
    ab49164c6080 afs: Hide silly-rename files from userspace
    f4f7e696db02 tracing: Ensure visibility when inserting an element into tracing_map
    82a9bc343ba0 netfs, fscache: Prevent Oops in fscache_put_cache()
    71024928b3f7 net/rds: Fix UBSAN: array-index-out-of-bounds in rds_cmsg_recv
    fcb0b4b6bc72 net: micrel: Fix PTP frame parsing for lan8814
    7a581f597a78 tun: add missing rx stats accounting in tun_xdp_act
    41e7decdad04 tun: fix missing dropped counter in tun_xdp_act
    a2232f29bf52 net: fix removing a namespace with conflicting altnames
    6646145be908 udp: fix busy polling
    660c3053d992 llc: Drop support for ETH_P_TR_802_2.
    6d53b813ff8b llc: make llc_ui_sendmsg() more robust against bonding changes
    c5e7fa4f9da4 vlan: skip nested type that is not IFLA_VLAN_QOS_MAPPING
    4ee0613868d4 bnxt_en: Wait for FLR to complete during probe
    b1e0a68a0cd2 tcp: make sure init the accept_queue's spinlocks once
    6994dba06321 net/smc: fix illegal rmb_desc access in SMC-D connection dump
    49aaeb8c539b wifi: mac80211: fix potential sta-link leak
    b59e08c872e0 drm/amd/display: pbn_div need be updated for hotplug event
    a5046e5eb855 Revert "drm/amd: Enable PCIe PME from D3"
    b1c06ee2d171 ksmbd: Add missing set_freezable() for freezable kthread
    844dfef31659 ksmbd: send lease break notification on FILE_RENAME_INFORMATION
    de603a52af84 ksmbd: don't increment epoch if current state and request state are same
    e61fc656ceea ksmbd: fix potential circular locking issue in smb2_set_ea()
    8fa25e67fdcf ksmbd: set v2 lease version on lease upgrade
    3101b9fd749f mm: page_alloc: unreserve highatomic page blocks before oom
    1d15da560175 LoongArch/smp: Call rcutree_report_cpu_starting() earlier
    0e0653d53af8 serial: sc16is7xx: improve do/while loop in sc16is7xx_irq()
    80beb4424d48 serial: sc16is7xx: remove obsolete loop in sc16is7xx_port_irq()
    de8e41f78f76 serial: sc16is7xx: fix invalid sc16is7xx_lines bitfield in case of probe error
    416b10d2817c serial: sc16is7xx: convert from _raw_ to _noinc_ regmap functions for FIFO
    4b068e55bf5e serial: sc16is7xx: change EFR lock to operate on each channels
    f6c58552a8d9 serial: sc16is7xx: remove unused line structure member
    6dca71e6e14a serial: sc16is7xx: remove global regmap from struct sc16is7xx_port
    9bcb019aee47 serial: sc16is7xx: remove wasteful static buffer in sc16is7xx_regmap_name()
    45ec1b7accd5 serial: sc16is7xx: improve regmap debugfs by using one regmap per port
    362be9ec328a rename(): fix the locking of subdirectories
    68ed9e333240 mm/sparsemem: fix race in accessing memory_section->usage
    367a47ef4ccc mm/rmap: fix misplaced parenthesis of a likely()
    5d01dcda812f ubifs: ubifs_symlink: Fix memleak of inode->i_link in error path
    13a6ceeb5bf1 nouveau/vmm: don't set addr on the fail path to avoid warning
    40c23b5e0756 rtc: Extend timeout for waiting for UIP to clear to 1s
    7971389316e5 rtc: Add support for configuring the UIP timeout for RTC reads
    fd1f5396be24 rtc: mc146818-lib: Adjust failure return code for mc146818_get_time()
    911e7206c850 rtc: Adjust failure return code for cmos_set_alarm()
    aca1ea92f518 rtc: cmos: Use ACPI alarm for non-Intel x86 systems too
    2b1dc0666e7f arm64: Rename ARM64_WORKAROUND_2966298
    9fec4db7fff5 media: mtk-jpeg: Fix use after free bug due to error path handling in mtk_jpeg_dec_device_run
    a33fbb8b6d45 mmc: mmc_spi: remove custom DMA mapped buffers
    c4edcd134bb7 mmc: core: Use mrq.sbc in close-ended ffu
    d78fac87c66d media: videobuf2-dma-sg: fix vmap callback
    c160f2ac85e0 scripts/get_abi: fix source path leak
    efe3ec706618 docs: kernel_abi.py: fix command injection
    c014490c0b22 lsm: new security_file_ioctl_compat() hook
    2647770eac09 arm64: dts: qcom: sm8150: fix USB DP/DM HS PHY interrupts
    016853056885 arm64: dts: qcom: sdm845: fix USB DP/DM HS PHY interrupts
    69ee126bbae0 arm64: dts: qcom: sc7280: fix usb_1 wakeup interrupt types
    eec1f92949a6 arm64: dts: qcom: sm8150: fix USB wakeup interrupt types
    595d35c6ae7e arm64: dts: qcom: sdm845: fix USB wakeup interrupt types
    8191aa4146d9 arm64: dts: qcom: sc7180: fix USB wakeup interrupt types
    9f29c5d2bf22 scsi: ufs: core: Remove the ufshcd_hba_exit() call from ufshcd_async_scan()
    2ab32986a0b9 dmaengine: fix NULL pointer in channel unregistration function
    0c8ada71d980 iio: adc: ad7091r: Enable internal vref if external vref is not supplied
    fcf8e3715250 async: Introduce async_schedule_dev_nocall()
    6e8aab4de7a9 async: Split async_schedule_node_domain()
    b37c1b0db14d parisc/power: Fix power soft-off button emulation on qemu
    71602d95ae64 parisc/firmware: Fix F-extend for PDC addresses
    0b093176fd09 bus: mhi: host: Add spinlock to protect WP access when queueing TREs
    3c5ec66b4b3f bus: mhi: host: Drop chan lock before queuing buffers
    2df39ac8f813 bus: mhi: host: Add alignment check for event ring read pointer
    574f69b46b23 mips: Fix max_mapnr being uninitialized on early stages
    6690a0acbbd9 s390/vfio-ap: let on_scan_complete() callback filter matrix and update guest's APCB
    baf3fcb268fd s390/vfio-ap: loop over the shadow APCB when filtering guest's AP configuration
    d6b8d034b576 s390/vfio-ap: always filter entire AP matrix
    51a7c02bc742 media: ov9734: Enable runtime PM before registering async sub-device
    f4bb1d5daf77 rpmsg: virtio: Free driver_override when rpmsg_remove()
    e8757cd139ec media: imx355: Enable runtime PM before registering async sub-device
    8a7729cda2dd PM / devfreq: Fix buffer overflow in trans_stat_show
    f4518de40a21 s390/vfio-ap: unpin pages on gisc registration failure
    dbc9a791a70e crypto: s390/aes - Fix buffer overread in CTR mode
    aa8aa16ed9ad hwrng: core - Fix page fault dead lock on mmap-ed hwrng
    3a081586c753 PM: hibernate: Enforce ordering during image compression/decompression
    680eb0a99336 crypto: api - Disallow identical driver names
    562850a008db btrfs: sysfs: validate scrub_speed_max value
    29e2da3eabd8 OPP: Pass rounded rate to _set_opp()
    4b5f8a187f10 arm64: properly install vmlinuz.efi
    852b6b2a2f7b ext4: allow for the last group to be marked as trimmed
    137568aa540a iio: adc: ad7091r: Allow users to configure device events
    6f57121e9cbe iio: adc: ad7091r: Set alert bit in config register
    fafda9f08a7c Revert "nSVM: Check for reserved encodings of TLB_CONTROL in nested VMCB"
    c519a9054bf7 usb: dwc3: gadget: Handle EP0 request dequeuing properly
    c8fe8ce07f1e usb: dwc3: gadget: Queue PM runtime idle on disconnect event
    ce2704688380 usb: dwc3: gadget: Refactor EP0 forced stall/restart into a separate API
    883d1a956208 Linux 6.1.75
    cfa468382858 Revert "Revert "md/raid5: Wait for MD_SB_CHANGE_PENDING in raid5d""
    f854bff46abe arm64: dts: armada-3720-turris-mox: set irq type for RTC
    17062a768c2e Revert "KEYS: encrypted: Add check for strsep"
    b1cc57f976fe riscv: Fix wrong usage of lm_alias() when splitting a huge linear mapping
    9025ee107929 block: Remove special-casing of compound pages
    2c46871ac49f i2c: s3c24xx: fix transferring more than one message in polling mode
    63892860b019 i2c: s3c24xx: fix read transfers in polling mode
    380540bb06bb ipv6: mcast: fix data-race in ipv6_mc_down / mld_ifc_work
    8f7f03e8cd33 selftests: mlxsw: qos_pfc: Adjust the test to support 8 lanes
    13e6065fed5e mlxsw: spectrum_acl_erp: Fix error flow of pool allocation failure
    31944f4264cd loop: fix the the direct I/O support check when used on top of block devices
    f2cc7d90a8c2 ethtool: netlink: Add missing ethnl_ops_begin/complete
    7809296dc172 kdb: Fix a potential buffer overflow in kdb_local()
    50ee63b800c6 ipvs: avoid stat macros calls from preemptible context
    4a45e7e7d2a6 netfilter: nf_tables: reject NFT_SET_CONCAT with not field length description
    b56bce52f9f6 netfilter: nf_tables: skip dead set elements in netlink dump
    9cb084df01e1 netfilter: nf_tables: do not allow mismatch field size and set key length
    7ae19ee81ca5 netfilter: bridge: replace physindev with physinif in nf_bridge_info
    754ca18ed3f2 netfilter: propagate net to nf_bridge_get_physindev
    3f1f50527707 netfilter: nf_queue: remove excess nf_bridge variable
    52d01a40b738 netfilter: nfnetlink_log: use proper helper for fetching physinif
    dfa01315c315 netfilter: nft_limit: do not ignore unsupported flags
    f00f11aae1c2 netfilter: nf_tables: reject invalid set policy
    2f32d518a1b8 mptcp: relax check on MPC passive fallback
    4631c2dd69d9 LoongArch: BPF: Prevent out-of-bounds memory access
    ca65da8da1e9 net: dsa: vsc73xx: Add null pointer check to vsc73xx_gpio_probe
    4108b86e324d bpf: Reject variable offset alu on PTR_TO_FLOW_KEYS
    f1ec1b6c5c46 net: stmmac: ethtool: Fixed calltrace caused by unbalanced disable_irq_wake calls
    359fadf5f770 drm/amdkfd: fixes for HMM mem allocation
    81b86a10b8b6 drm/amdkfd: Use resource_size() helper function
    1c3aa875db9a dt-bindings: gpio: xilinx: Fix node address in gpio
    24e00f0fa9fc net: ravb: Fix dma_addr_t truncation in error case
    615501d41bbd udp: annotate data-races around up->pending
    33cf52b6e53a block: ensure we hold a queue reference when using queue limits
    fdf3df297f4d mptcp: refine opt_mp_capable determination
    c0749c8770a9 mptcp: use OPTION_MPTCP_MPJ_SYN in subflow_check_req()
    51e4cb032d49 mptcp: use OPTION_MPTCP_MPJ_SYNACK in subflow_finish_connect()
    081273082df8 mptcp: strict validation before using mp_opt->hmac
    67feafe7a3dd mptcp: mptcp_parse_option() fix for MPTCPOPT_MP_JOIN
    cb183a586e34 net: phy: micrel: populate .soft_reset for KSZ9131
    ecf0ebf0e618 amt: do not use overwrapped cb area
    c96da963de02 net: ethernet: ti: am65-cpsw: Fix max mtu to fit ethernet frames
    ee1dc3bf86f2 net: qualcomm: rmnet: fix global oob in rmnet_policy
    93eb80c5c946 s390/pci: fix max size calculation in zpci_memcpy_toio()
    cad471227a37 ASoC: mediatek: sof-common: Add NULL check for normal_link string
    69f0bebe9166 PCI: mediatek-gen3: Fix translation window size calculation
    94667790e5e3 PCI: keystone: Fix race condition when initializing PHYs
    11923a8df8ed nvmet-tcp: Fix the H2C expected PDU len calculation
    fb711858e669 nvme: trace: avoid memcpy overflow warning
    cac037db2473 nvmet: re-fix tracing strncpy() warning
    e92fe6f51b1d serial: imx: Correct clock error message in function probe()
    938b88a2d9ca usb: xhci-mtk: fix a short packet issue of gen1 isoc-in transfer
    9d4fa5fe2b1d apparmor: avoid crash when parsed profile name is empty
    3a461018710f cxl/region: fix x9 interleave typo
    16cbe4bad847 perf env: Avoid recursively taking env->bpf_progs.lock
    83ccd15717ee nvmet-tcp: fix a crash in nvmet_req_complete()
    2871aa407007 nvmet-tcp: Fix a kernel panic when host sends an invalid H2C PDU length
    8ed3eb92a56e vdpa: Fix an error handling path in eni_vdpa_probe()
    b2cb99d26e15 spmi: mtk-pmif: Serialize PMIF status check and command submission
    28a45e15c8fb usb: cdc-acm: return correct error code on unsupported break
    8fd48981a79f tty: use 'if' in send_break() instead of 'goto'
    50608b54ad36 tty: don't check for signal_pending() in send_break()
    6f0cd560ff56 tty: early return from send_break() on TTY_DRIVER_HARDWARE_BREAK
    8e426f249993 tty: change tty_write_lock()'s ndelay parameter to bool
    ed863a4d48fb perf genelf: Set ELF program header addresses properly
    4cb521321389 perf hisi-ptt: Fix one memory leakage in hisi_ptt_process_auxtrace_event()
    8f02951cee26 perf header: Fix one memory leakage in perf_event__fprintf_event_update()
    eeeb3861c282 iio: adc: ad9467: fix scale setting
    e2b405b9853b iio: adc: ad9467: don't ignore error codes
    89398709ae50 iio: adc: ad9467: fix reset gpio handling
    f33bdf21e1ae selftests/sgx: Skip non X86_64 platform
    bf92b8210198 selftests/sgx: Include memory clobber for inline asm in test enclave
    2cfae256a130 selftests/sgx: Fix uninitialized pointer dereferences in encl_get_entry
    eb41e7e8b4b3 selftests/sgx: Fix uninitialized pointer dereference in error path
    63ee7be01a3f serial: imx: fix tx statemachine deadlock
    3f9ec4227e44 software node: Let args be NULL in software_node_get_reference_args
    893c3ca250b0 acpi: property: Let args be NULL in __acpi_node_get_property_reference
    76be69716cad base/node.c: initialize the accessor list before registering
    d5ef7480d643 libapi: Add missing linux/types.h header to get the __u64 type on io.h
    d74173bda29a serial: 8250: omap: Don't skip resource freeing if pm_runtime_resume_and_get() failed
    e6fce099c9b4 power: supply: bq256xx: fix some problem in bq256xx_hw_init
    ddd3fe99b4fa power: supply: cw2015: correct time_to_empty units in sysfs
    559e25126c15 MIPS: Alchemy: Fix an out-of-bound access in db1550_dev_setup()
    2504864be6fd MIPS: Alchemy: Fix an out-of-bound access in db1200_dev_setup()
    69e9a6944df7 riscv: Fixed wrong register in XIP_FIXUP_FLASH_OFFSET macro
    add57b5298bd riscv: Fix set_direct_map_default_noflush() to reset _PAGE_EXEC
    b4f4d427653f riscv: Fix set_memory_XX() and set_direct_map_XX() by splitting huge linear mappings
    d2ebb8143b6b riscv: Fix module_alloc() that did not reset the linear mapping permissions
    890cfe5337e0 riscv: Check if the code to patch lies in the exit section
    9ad0ab0bbc21 mips: Fix incorrect max_low_pfn adjustment
    1961a29b89e8 mips: dmi: Fix early remap on MIPS32
    e3411940637c mfd: intel-lpss: Fix the fractional clock divider flags
    7fdc6c187ea0 leds: aw2013: Select missing dependency REGMAP_I2C
    527e8c5f3d00 mfd: syscon: Fix null pointer dereference in of_syscon_register()
    ac3b65cbc68d ARM: 9330/1: davinci: also select PINCTRL
    d2ba8eea74af serial: sc16is7xx: set safe default SPI clock frequency
    4f61154a683d serial: sc16is7xx: add check for unsupported SPI modes during probe
    f09b277f736c HID: wacom: Correct behavior when processing some confidence == false touches
    710bd468604b iio: adc: ad7091r: Pass iio_dev to event handler
    dba788e25f05 KVM: arm64: vgic-its: Avoid potential UAF in LPI translation cache
    8a4f6a176a43 KVM: arm64: vgic-v4: Restore pending state on host userspace write
    455ebc191068 x86/kvm: Do not try to disable kvmclock if it was not enabled
    88f4dd8b9f58 PCI: mediatek: Clear interrupt status before dispatching handler
    0c883bc9fa29 PCI: dwc: endpoint: Fix dw_pcie_ep_raise_msix_irq() alignment support
    d3c08d1015fa PCI/P2PDMA: Remove reference to pci_p2pdma_map_sg()
    970c0899a4ac cxl/port: Fix decoder initialization when nr_targets > interleave_ways
    23f974910862 Revert "net: rtnetlink: Enslave device before bringing it up"
    f2ddfc7d3a9c wifi: mwifiex: configure BSSID consistently when starting AP
    54e1864b13f1 wifi: rtlwifi: Convert LNKCTL change to PCIe cap RMW accessors
    0075a5d69df6 wifi: rtlwifi: Remove bogus and dangerous ASPM disable/enable code
    debfa60412af wifi: mt76: fix broken precal loading from MTD for mt7915
    1edce43f4799 iommu/dma: Trace bounce buffer usage when mapping buffers
    cc7e8482c61a iommu/arm-smmu-qcom: Add missing GMU entry to match table
    516ecb243625 LoongArch: Fix and simplify fcsr initialization on execve()
    6cc9c0af0aa0 bpf: Fix re-attachment branch in bpf_tracing_prog_attach
    96860d9ad462 Bluetooth: Fix atomicity violation in {min,max}_key_size_set
    7c02ca554287 rootfs: Fix support for rootfstype= when root= is given
    f5c29a3a7e68 md/raid1: Use blk_opf_t for read and write operations
    7b85554c7c2a pwm: Fix out-of-bounds access in of_pwm_single_xlate()
    00e29df1b44d pwm: jz4740: Don't use dev_err_probe() in .request()
    a372f1d01bc1 netfilter: nf_tables: check if catch-all set element is active in next generation
    c6350b5cb78e block: Fix iterating over an empty bio with bio_for_each_folio_all
    ef31cc877947 block: add check that partition length needs to be aligned with block size
    0c8d252d0a20 drm/amd: Enable PCIe PME from D3
    f49a30a24f9b scsi: mpi3mr: Block PEL Enable Command on Controller Reset and Unrecoverable State
    546e981eead2 scsi: mpi3mr: Refresh sdev queue depth after controller reset
    3378333263b7 scsi: target: core: add missing file_{start,end}_write()
    01644b861681 scsi: ufs: core: Simplify power management during async scan
    81f444f22816 fbdev: flush deferred IO before closing
    ccbee2843edd fbdev: flush deferred work in fb_deferred_io_fsync()
    d6cc8dd231b8 io_uring/rw: ensure io->bytes_done is always initialized
    c866866c7952 ksmbd: only v2 leases handle the directory
    380965e48e9c ksmbd: fix UAF issue in ksmbd_tcp_new_connection()
    6eb8015492bc ksmbd: validate mech token in session setup
    0914dc8041d4 ALSA: hda/realtek: Enable headset mic on Lenovo M70 Gen5
    5648a0087f55 ALSA: hda/realtek: Enable mute/micmute LEDs and limit mic boost on HP ZBook
    3253abcd9b2d ALSA: hda/relatek: Enable Mute LED on HP Laptop 15s-fq2xxx
    29f6eccbcf7b ALSA: oxygen: Fix right channel of capture volume mixer
    104f95698cad drm/vmwgfx: Keep a gem reference to user bos in surfaces
    5a4087a90776 drm/vmwgfx: Fix possible invalid drm gem put calls
    a71776bbd87e serial: omap: do not override settings for RS485 support
    b5a2232ba821 serial: 8250_exar: Set missing rs485_supported flag
    36b0710502a5 serial: imx: Ensure that imx_uart_rs485_config() is called with enabled clock
    d5f13c1d01e4 serial: core, imx: do not set RS485 enabled if it is not supported
    dac0dd3d803c serial: 8250_bcm2835aux: Restore clock error handling
    15000d6f2936 serial: core: make sure RS485 cannot be enabled when it is not supported
    f790bd27a74b serial: core: fix sanitizing check for RTS settings
    974a0a694416 usb: mon: Fix atomicity violation in mon_bin_vma_fault
    206e2ddeb7df usb: typec: class: fix typec_altmode_put_partner to put plugs
    d0320b9ac6b4 Revert "usb: typec: class: fix typec_altmode_put_partner to put plugs"
    097cdc78c659 usb: cdns3: Fix uvc fail when DMA cross 4k boundery since sg enabled
    45c766231e6b usb: cdns3: fix iso transfer error when mult is not zero
    3f2bf7cac03d usb: cdns3: fix uvc failure work since sg support enabled
    e894b1b038ab usb: chipidea: wait controller resume finished for wakeup irq
    3450197e9a75 Revert "usb: dwc3: don't reset device side if dwc3 was configured as host-only"
    598f9d5a3b35 Revert "usb: dwc3: Soft reset phy on probe for host"
    d5c4a04205df usb: dwc: ep0: Update request status in dwc3_ep0_stall_restart
    789eade47fd9 usb: phy: mxs: remove CONFIG_USB_OTG condition for mxs_phy_is_otg_host()
    c952654e1a27 tick-sched: Fix idle and iowait sleeptime accounting vs CPU hotplug
    9ccf64e763ac powerpc/64s: Increase default stack size to 32KB
    7ac029af0060 clocksource/drivers/timer-ti-dm: Fix make W=n kerneldoc warnings
    6696f76c32ff binder: fix race between mmput() and do_exit()
    437360133cbd xen-netback: don't produce zero-size SKB frags
    3ed5f55599c1 Input: atkbd - use ab83 as id when skipping the getid command
    45e565b55b2f mips/smp: Call rcutree_report_cpu_starting() earlier
    16e1d4fa1369 binder: fix unused alloc->free_async_space
    c5255d122938 binder: fix async space check for 0-sized buffers
    66b35787976d keys, dns: Fix size check of V1 server-list header
    60a9a5fca6bf selftests/bpf: Add assert for user stacks in test_task_stack
    3590da14e163 of: unittest: Fix of_count_phandle_with_args() expected value message
    581ade6be57b fbdev: imxfb: fix left margin setting
    b9d760dae5b1 of: Fix double free in of_parse_phandle_with_args_map
    676af10d0cdf ksmbd: validate the zero field of packet header
    222618b73748 kselftest/alsa - mixer-test: Fix the print format specifier warning
    b77ae4f8c142 kselftest/alsa - mixer-test: fix the number of parameters to ksft_exit_fail_msg()
    74416a207fcf drm/amd/pm/smu7: fix a memleak in smu7_hwmgr_backend_init
    4525525cb716 drm/amdkfd: Confirm list is non-empty before utilizing list_first_entry in kfd_topology.c
    a9f68a23ca42 IB/iser: Prevent invalidating wrong MR
    96dc4d204a12 mmc: sdhci_omap: Fix TI SoC dependencies
    5aa65e5f20c6 mmc: sdhci_am654: Fix TI SoC dependencies
    d8d8897d6506 ALSA: scarlett2: Add clamp() in scarlett2_mixer_ctl_put()
    cda7762bea85 ALSA: scarlett2: Add missing error checks to *_ctl_get()
    be0b1be4ace2 ALSA: scarlett2: Allow passing any output to line_out_remap()
    be96acd3eaa7 ALSA: scarlett2: Add missing error check to scarlett2_usb_set_config()
    6232b7505c2c ALSA: scarlett2: Add missing error check to scarlett2_config_save()
    74341edb7d18 ASoC: rt5645: Drop double EF20 entry from dmi_platform_data[]
    40fe0903fa0f pwm: stm32: Fix enable count for clk in .probe()
    0d554b420cab pwm: stm32: Use hweight32 in stm32_pwm_detect_channels
    ade959ed6725 pwm: stm32: Use regmap_clear_bits and regmap_set_bits where applicable
    c4b1f10f1456 clk: fixed-rate: fix clk_hw_register_fixed_rate_with_accuracy_parent_hw
    6d98d249175e accel/habanalabs: fix information leak in sec_attest_info()
    7ac0adc7df2f drm/mediatek: dp: Add phy_mtk_dp module as pre-dependency
    f930dbdc9543 clk: si5341: fix an error code problem in si5341_output_clk_set_rate
    24961a5dc759 watchdog: rti_wdt: Drop runtime pm reference count when watchdog is unused
    6317445623a2 watchdog: bcm2835_wdt: Fix WDIOC_SETTIMEOUT handling
    3bde94e858ba watchdog/hpwdt: Only claim UNKNOWN NMI if from iLO
    06b854238ee5 watchdog: set cdev owner before adding
    c249ef9d0978 drivers: clk: zynqmp: update divider round rate logic
    b61ca9c34c84 drivers: clk: zynqmp: calculate closest mux rate
    74aeef7e4354 clk: qcom: videocc-sm8150: Add missing PLL config property
    52d741c95d4a clk: qcom: videocc-sm8150: Update the videocc resets
    52e2ebc06435 dt-bindings: clock: Update the videocc resets for sm8150
    4f31f357e525 f2fs: fix to check return value of f2fs_recover_xattr_data
    2c6537c58bce drm/amd/pm: fix a double-free in amdgpu_parse_extended_power_table
    4e26e2d485fb gpu/drm/radeon: fix two memleaks in radeon_vm_init
    35fa2394d26e drivers/amd/pm: fix a use-after-free in kv_parse_power_table
    f957a1be647f drm/amd/pm: fix a double-free in si_dpm_init
    591e77fedc76 drm/amdgpu/debugfs: fix error code when smc register accessors are NULL
    3ec6ce0651e2 drm/mediatek: Fix underrun in VDO1 when switches off the layer
    518efe60bbdd drm/mediatek: Return error if MDP RDMA failed to enable the clock
    aa3e61cf89b4 drm/msm/dpu: Drop enable and frame_count parameters from dpu_hw_setup_misr()
    08d7e291af1d drm/msm/dpu: Set input_sel bit for INTF
    9570ae0e1d3c clk: renesas: rzg2l: Check reset monitor registers
    3e1dd6a1b4fa clk: renesas: rzg2l-cpg: Reuse code in rzg2l_cpg_reset()
    2db77604221c media: dvb-frontends: m88ds3103: Fix a memory leak in an error handling path of m88ds3103_probe()
    74e3f165d39e media: dvbdev: drop refcount on error path in dvb_device_open()
    4d6e15a5eabe f2fs: fix to update iostat correctly in f2fs_filemap_fault()
    8835766027c6 f2fs: fix to check compress file in f2fs_move_file_range()
    9bfd5ea71521 f2fs: fix to wait on block writeback for post_read case
    e67911d2caeb drm/panel: st7701: Fix AVCL calculation
    bb17cc851e3a media: rkisp1: Fix media device memory leak
    690b7c356f1e media: dt-bindings: media: rkisp1: Fix the port description for the parallel interface
    438193dcc27b media: imx-mipi-csis: Fix clock handling in remove()
    df2adafa6213 clk: qcom: gpucc-sm8150: Update the gpu_cc_pll1 config
    40a156cf08c9 RDMA/hns: Fix memory leak in free_mr_init()
    dada3fdb4ec9 media: cx231xx: fix a memleak in cx231xx_init_isoc
    b075ed8dcc2c drm/bridge: tc358767: Fix return value on error case
    9a3b2263705d drm/bridge: cdns-mhdp8546: Fix use of uninitialized variable
    60c23f9aeb26 drm/radeon/trinity_dpm: fix a memleak in trinity_parse_power_table
    0f19543097c2 drm/radeon/dpm: fix a memleak in sumo_parse_power_table
    c4ff55408187 drm/radeon: check the alloc_workqueue return value in radeon_crtc_init()
    048cbfd6050a drm/panfrost: Ignore core_mask for poweroff and disable PWRTRANS irq
    c32ee7286f5b ASoC: Intel: glk_rt5682_max98357a: fix board id mismatch
    7682ef5c144a drm/drv: propagate errors from drm_modeset_register_all()
    19b01c6c19a0 drm/msm/dsi: Use pm_runtime_resume_and_get to prevent refcnt leaks
    b234ecad200b drm/msm/mdp4: flush vblank event on disable
    982eb772e185 ASoC: cs35l34: Fix GPIO name and drop legacy include
    940484c05564 ASoC: cs35l33: Fix GPIO name and drop legacy include
    2da8e2034600 drm/tidss: Fix dss reset
    553574c023b3 drm/tidss: Check for K2G in in dispc_softreset()
    f099c742caa1 drm/tidss: Return error value from from softreset
    10a437c60440 drm/tidss: Move reset to the end of dispc_init()
    da72ff8def7c drm/radeon: check return value of radeon_ring_lock()
    e6667551ed5e drm/radeon/r100: Fix integer overflow issues in r100_cs_track_check()
    9ac2845a2eee drm/radeon/r600_cs: Fix possible int overflows in r600_cs_check_reg()
    f0145860c20b f2fs: fix to avoid dirent corruption
    4bab3ad44d61 drm/bridge: Fix typo in post_disable() description
    dab1227007a5 media: rkvdec: Hook the (TRY_)DECODER_CMD stateless ioctls
    563f34c24c0c media: verisilicon: Hook the (TRY_)DECODER_CMD stateless ioctls
    32b4b2dde3d4 media: mtk-jpeg: Remove cancel worker in mtk_jpeg_remove to avoid the crash of multi-core JPEG devices
    f211621debcd media: mtk-jpegdec: export jpeg decoder functions
    30773ea47d41 media: pvrusb2: fix use after free on context disconnection
    4019c809688d drm/tilcdc: Fix irq free on unload
    81f1bd85960b drm/bridge: tpd12s015: Drop buggy __exit annotation for remove function
    37b400c8030c drm/nouveau/fence:: fix warning directly dereferencing a rcu pointer
    dbea48e9169d drm/panel-elida-kd35t133: hold panel in reset for unprepare
    019bba28d1e8 RDMA/hns: Fix inappropriate err code for unsupported operations
    a867b891f9ef RDMA/usnic: Silence uninitialized symbol smatch warnings
    d260b65b2b0d drm/panfrost: Really power off GPU cores in panfrost_gpu_power_off()
    8578a795baae Revert "drm/omapdrm: Annotate dma-fence critical section in commit path"
    3e6bf96561f5 Revert "drm/tidss: Annotate dma-fence critical section in commit path"
    544d223d71f9 ARM: davinci: always select CONFIG_CPU_ARM926T
    62a1fedeb14c ip6_tunnel: fix NEXTHDR_FRAGMENT handling in ip6_tnl_parse_tlv_enc_lim()
    1b481cb53601 mlxbf_gige: Enable the GigE port in mlxbf_gige_open
    7ad5e7a35c3f mlxbf_gige: Fix intermittent no ip issue
    0b5b831122fc net/sched: act_ct: fix skb leak and crash on ooo frags
    b91d31de9a43 sctp: fix busy polling
    9233a88f4b71 sctp: support MSG_ERRQUEUE flag in recvmsg()
    3c0bd2b06656 bpf: sockmap, fix proto update hook to avoid dup calls
    6e9429f9c66c null_blk: don't cap max_hw_sectors to BLK_DEF_MAX_SECTORS
    a623d31805ea block: make BLK_DEF_MAX_SECTORS unsigned
    33f93ce22ee1 Bluetooth: btmtkuart: fix recv_buf() return value
    81f3b6ea314c Bluetooth: Fix bogus check for re-auth no supported with non-ssp
    55c88a7efb02 netfilter: nf_tables: mark newset as dead on transaction abort
    68aebba59e9e wifi: iwlwifi: mvm: send TX path flush in rfkill
    6cc82456e391 wifi: iwlwifi: mvm: set siso/mimo chains to 1 in FW SMPS request
    8915946cde3e wifi: rtlwifi: rtl8192se: using calculate_bit_shift()
    62badccc7c99 wifi: rtlwifi: rtl8192ee: using calculate_bit_shift()
    a277e8e9feaf wifi: rtlwifi: rtl8192de: using calculate_bit_shift()
    b716c8483c22 wifi: rtlwifi: rtl8192ce: using calculate_bit_shift()
    d938e470b2d6 wifi: rtlwifi: rtl8192cu: using calculate_bit_shift()
    35fb6b757408 wifi: rtlwifi: rtl8192c: using calculate_bit_shift()
    937f65a1251c wifi: rtlwifi: rtl8188ee: phy: using calculate_bit_shift()
    dd9e3d9513e6 wifi: rtlwifi: add calculate_bit_shift()
    ce9b43e58c36 arm64: dts: qcom: ipq6018: Fix up indentation
    20fb17328b36 arm64: dts: qcom: ipq6018: Pad addresses to 8 hex digits
    ba71baee6e08 arm64: dts: qcom: ipq6018: Use lowercase hex
    cb65c2caa1f6 arm64: dts: qcom: ipq6018: improve pcie phy pcs reg table
    45d8d80cdaa2 arm64: dts: qcom: ipq6018: fix clock rates for GCC_USB0_MOCK_UTMI_CLK
    ab23e4ef8926 arm64: dts: qcom: sc7280: Mark SDHCI hosts as cache-coherent
    e765363ecfa8 block: add check of 'minors' and 'first_minor' in device_add_disk()
    a4529948df7a arm64: dts: qcom: sm8150-hdk: fix SS USB regulators
    bf5e9d28a8e7 soc: qcom: llcc: Fix dis_cap_alloc and retain_on_pc configuration
    aaf0fc13bed9 dma-mapping: clear dev->dma_mem to NULL after freeing it
    542da27eac4f virtio/vsock: fix logic which reduces credit update messages
    f69365e3a7ca ipmr: support IP_PKTINFO on cache report IGMP msg
    0c867561cee2 selftests/net: fix grep checking for fib_nexthop_multiprefix
    c458be39093d ARM: dts: stm32: don't mix SCMI and non-SCMI board compatibles
    fdbe94c524f2 scsi: hisi_sas: Correct the number of global debugfs registers
    6491d9ea9326 scsi: hisi_sas: Rollback some operations if FLR failed
    3d5a4fa56d0c scsi: hisi_sas: Replace with standard error code return value
    35657d1ba826 arm64: dts: imx8mm: Reduce GPU to nominal speed
    a4210a686a75 arm64: dts: renesas: white-hawk-cpu: Fix missing serial console pin control
    9f5b79cf125b block: Set memalloc_noio to false on device_add_disk() error path
    4196b45370bd selftests/bpf: Relax time_tai test for equal timestamps in tai_forward
    0c9318d49e50 wifi: mt76: mt7921: fix country count limitation for CLC
    fe002eeda420 arm64: dts: mediatek: mt8183: correct MDP3 DMA-related nodes
    9c91f5849885 dt-bindings: media: mediatek: mdp3: correct RDMA and WROT node with generic names
    ba5e58dacf8c arm64: dts: hisilicon: hikey970-pmic: fix regulator cells properties
    b1d4d54d32ce bpf: Fix verification of indirect var-off stack access
    4054b2b1e6de wifi: mt76: mt7921s: fix workqueue problem causes STA association fail
    4486b2e5dbe5 arm64: dts: qcom: sc7280: fix usb_2 wakeup interrupt types
    361b4175ddca arm64: dts: qcom: sc7280: Mark Adreno SMMU as DMA coherent
    a16a476b5c0d arm64: dts: qcom: sc7280: Fix up GPU SIDs
    9e1dafa5c365 arm64: dts: qcom: sm8350: Fix DMA0 address
    1623432c6a74 arm64: dts: qcom: sdm845-db845c: correct LED panic indicator
    773c09af312f arm64: dts: qcom: qrb5165-rb5: correct LED panic indicator
    9435bbc8d9ea scsi: fnic: Return error if vmalloc() failed
    fc3e3c50a0a4 bpf: fix check for attempt to corrupt spilled pointer
    50e9fbddcbc2 selftests/net: specify the interface when do arping
    62fca83303d6 bpf: Defer the free of inner map when necessary
    e05b322c82d2 bpf: Add map and need_defer parameters to .map_fd_put_ptr()
    a6fb03a9c9c8 bpf: add percpu stats for bpf_map elements insertions/deletions
    10108826191a rcu-tasks: Provide rcu_trace_implies_rcu_gp()
    db44bac18a13 arm64: dts: qcom: sm6350: Make watchdog bark interrupt edge triggered
    8e335e7759c0 arm64: dts: qcom: sc8280xp: Make watchdog bark interrupt edge triggered
    66cdbc4e80ff arm64: dts: qcom: sm8250: Make watchdog bark interrupt edge triggered
    385f30d448c3 arm64: dts: qcom: sm8150: Make watchdog bark interrupt edge triggered
    5e8267cbc0fa arm64: dts: qcom: sdm845: Make watchdog bark interrupt edge triggered
    bc9a45a06a75 arm64: dts: qcom: sc7280: Make watchdog bark interrupt edge triggered
    30d0c5fe2c26 arm64: dts: qcom: sc7280: Mark some nodes as 'reserved'
    0200f1b6bab8 arm64: dts: qcom: sc7180: Make watchdog bark interrupt edge triggered
    22529f0ac274 ARM: dts: qcom: sdx65: correct SPMI node name
    be1f34b93f5a bpf: enforce precision of R0 on callback return
    f9f2d957a8ea md: synchronize flush io with array reconfiguration
    b21a16909b49 selftests/bpf: Fix erroneous bitmask operation
    ff9935181e5a arm64: dts: ti: k3-am65-main: Fix DSS irq trigger type
    e9e59f3ee5c5 arm64: dts: ti: k3-am62a-main: Fix GPIO pin count in DT nodes
    436785a207ed wifi: rtlwifi: rtl8821ae: phy: fix an undefined bitwise shift behavior
    6824ed5d5ab6 firmware: meson_sm: populate platform devices from sm device tree data
    00ac00ce8d90 firmware: ti_sci: Fix an off-by-one in ti_sci_debugfs_create()
    ac7c503bd5ef net/ncsi: Fix netlink major/minor version numbers
    12db013dc91d ARM: dts: qcom: apq8064: correct XOADC register address
    638f381ab2d8 wifi: libertas: stop selecting wext
    7dd918d877fa wifi: ath11k: Defer on rproc_get failure
    799a914e483a bpf: Add crosstask check to __bpf_get_stack
    1959a560ac4e bpf, lpm: Fix check prefixlen before walking trie
    cd1896b9224e wifi: rtw88: fix RX filter in FIF_ALLMULTI flag
    fdd93641633f wifi: plfxlc: check for allocation failure in plfxlc_usb_wreq_async()
    a058f0c432e0 pNFS: Fix the pnfs block driver's calculation of layoutget size
    b10370b1ea0b SUNRPC: fix _xprt_switch_find_current_entry logic
    19f28fa8be4e NFSv4.1/pnfs: Ensure we handle the error NFS4ERR_RETURNCONFLICT
    83f2d54ca33c blocklayoutdriver: Fix reference leak of pnfs_device_node
    23ba22557aac csky: fix arch_jump_label_transform_static override
    4df0c942d04a crypto: scomp - fix req->dst buffer overflow
    490adf8be7d0 crypto: sahara - do not resize req->src when doing hash operations
    eae15c43beb6 crypto: sahara - fix processing hash requests with req->nbytes < sg->length
    6fc95767954a crypto: sahara - improve error handling in sahara_sha_process()
    5834cafc1d20 crypto: sahara - fix wait_for_completion_timeout() error handling
    8b355e047810 crypto: sahara - fix ahash reqsize
    a75ba66b6904 crypto: sahara - handle zero-length aes requests
    0545801b3076 crypto: sahara - avoid skcipher fallback code duplication
    635308e6042f crypto: virtio - Wait for tasklet to complete on device remove
    d69d7804cf9e gfs2: Fix kernel NULL pointer dereference in gfs2_rgrp_dump
    caae86077dd3 fs: indicate request originates from old mount API
    9c285df949b5 erofs: fix memory leak on short-lived bounced pages
    48dcfc42ce70 pstore: ram_core: fix possible overflow in persistent_ram_init_ecc()
    d7e4268a510b crypto: hisilicon/zip - save capability registers in probe process
    a384d7dc4e09 crypto: hisilicon/sec2 - save capability registers in probe process
    fc6b944de141 crypto: hisilicon/hpre - save capability registers in probe process
    4705731fc5fa crypto: hisilicon/qm - add a function to set qm algs
    11d7a3390566 crypto: hisilicon/zip - add zip comp high perf mode configuration
    6412f039ac87 crypto: hisilicon/qm - save capability registers in qm init process
    d1f82d72104a crypto: sahara - fix error handling in sahara_hw_descriptor_create()
    435303ad8a07 crypto: sahara - fix processing requests with cryptlen < sg->length
    e7e8fbfe6dd7 crypto: sahara - fix ahash selftest failure
    1f9128036238 crypto: sahara - fix cbc selftest failure
    eecf2e1e0c5f crypto: sahara - remove FLAGS_NEW_KEY logic
    4c0ac81a172a crypto: safexcel - Add error handling for dma_map_sg() calls
    d5d4dfc73bed crypto: af_alg - Disallow multiple in-flight AIO requests
    f3a11fdd02b3 crypto: ccp - fix memleak in ccp_init_dm_workarea
    baa79033e17b crypto: sa2ul - Return crypto_aead_setkey to transfer the error
    ae4747dab2ea crypto: virtio - Handle dataq logic with tasklet
    e973b045c162 selinux: Fix error priority for bind with AF_UNSPEC on PF_INET6 socket
    5389407bba1e mtd: Fix gluebi NULL pointer dereference caused by ftl notifier
    030a1147eda8 kunit: debugfs: Fix unchecked dereference in debugfs_print_results()
    b841208b7e85 ACPI: extlog: Clear Extended Error Log status when RAS_CEC handled the error
    b412c486a358 ACPI: LPSS: Fix the fractional clock divider flags
    5980041cba21 spi: sh-msiof: Enforce fixed DTDL for R-Car H3
    ea6b597fcaca efivarfs: Free s_fs_info on unmount
    d4a9aa7db574 efivarfs: force RO when remounting if SetVariable is not supported
    321b3a5592c8 calipso: fix memory leak in netlbl_calipso_add_pass()
    71f47a52baef cpufreq: scmi: process the result of devm_of_clk_add_hw_provider()
    04fc66dd2be4 cpufreq: Use of_property_present() for testing DT property presence
    79de65ac39d7 of: Add of_property_present() helper
    426710a2bc2f platform/x86/intel/vsec: Fix xa_alloc memory leak
    0ff5cd92bbd5 platform/x86/intel/vsec: Use mutex for ida_alloc() and ida_free()
    1fa4a1e1258d platform/x86/intel/vsec: Support private data
    3c48b2a7ce49 platform/x86/intel/vsec: Enhance and Export intel_vsec_add_aux()
    c25f1555e03a KEYS: encrypted: Add check for strsep
    72222dfd76a7 ACPI: LPIT: Avoid u32 multiplication overflow
    2124c5bc2294 ACPI: video: check for error while searching for backlight device parent
    08f7142e224f mtd: rawnand: Increment IFC_TIMEOUT_MSECS for nand controller response
    a35ab02c85c1 spi: spi-zynqmp-gqspi: fix driver kconfig dependencies
    a2da3f9b1a10 powerpc/imc-pmu: Add a null pointer check in update_events_in_group()
    f152a6bfd187 powerpc/powernv: Add a null pointer check in opal_powercap_init()
    9a523e1da6d8 powerpc/powernv: Add a null pointer check in opal_event_init()
    ed8d023cfa97 powerpc/powernv: Add a null pointer check to scom_debug_init_one()
    327d4f2d6676 selftests/powerpc: Fix error handling in FPU/VMX preemption tests
    026fd977dc50 powerpc/pseries/memhp: Fix access beyond end of drmem array
    63df75d38342 powerpc/44x: select I2C for CURRITUCK
    2fc51c4b7dd2 powerpc: add crtsavres.o to always-y instead of extra-y
    16b88e68b85d powerpc: remove checks for binutils older than 2.25
    9dbac9fdae6e EDAC/thunderx: Fix possible out-of-bounds string access
    c9275305d61a x86/mce/inject: Clear test status value
    0be645792c11 x86/lib: Fix overflow when counting digits
    8fd7f4462453 Linux 6.1.74
    a31690d3dd41 scripts/decode_stacktrace.sh: optionally use LLVM utilities
    5e67191818fe coresight: etm4x: Fix width of CCITMIN field
    d08e756e253b PCI: Add ACS quirk for more Zhaoxin Root Ports
    41e3e3d813c9 leds: ledtrig-tty: Free allocated ttyname buffer on deactivate
    419602d08b79 parport: parport_serial: Add Brainboxes device IDs and geometry
    3936b54a8d65 parport: parport_serial: Add Brainboxes BAR details
    17a8519cb359 uio: Fix use-after-free in uio_open
    08af2ceb83d5 binder: fix comment on binder_alloc_new_buf() return value
    35a3e8ceaf60 binder: fix trivial typo of binder_free_buf_locked()
    9fa04c93f241 binder: fix use-after-free in shinker's callback
    ee14fd2c8b0a binder: use EPOLLERR from eventpoll.h
    bed0acf330b2 Revert "md/raid5: Wait for MD_SB_CHANGE_PENDING in raid5d"
    e377a3346f7e ksmbd: free ppace array on error in parse_dacl
    09d84f37f841 ksmbd: don't allow O_TRUNC open on read-only share
    c24fc060ab7f bpf: Add --skip_encoding_btf_inconsistent_proto, --btf_gen_optimized to pahole flags for v1.25
    0d242f739cec btf, scripts: Exclude Rust CUs with pahole
    b9765932199e ASoC: SOF: Intel: hda-codec: Delay the codec device registration
    dcf95b26bef9 ACPI: resource: Add another DMI match for the TongFang GMxXGxx
    5816a82caf12 ALSA: hda/realtek: Fix mute and mic-mute LEDs for HP Envy X360 13-ay0xxx
    9d588f3b6f33 drm/crtc: fix uninitialized variable use
    809ebacd2274 ARM: sun9i: smp: fix return code check of of_property_match_string
    0ce688d88af0 net: qrtr: ns: Return 0 if server port is not present
    1e1b2f34e9a7 virtio_blk: fix snprintf truncation compiler warning
    9efdc0081cca ida: Fix crash in ida_free when the bitmap is empty
    24f3fec911a0 pinctrl: cy8c95x0: Fix get_pincfg
    a54e7741cc6d pinctrl: cy8c95x0: Fix typo
    75e94701c016 drm/amd/display: get dprefclk ss info from integration info table
    426ab60bd2fd i2c: rk3x: fix potential spinlock recursion on poll
    5411e3292792 smb: client: fix potential OOB in smb2_dump_detail()
    da7ba20a7107 HID: nintendo: Prevent divide-by-zero on code
    87e2739656f4 dm audit: fix Kconfig so DM_AUDIT depends on BLK_DEV_DM
    d0085e100f40 ALSA: hda/realtek: Add quirks for ASUS Zenbook 2022 Models
    2b055dc11e05 ASoC: Intel: bytcr_rt5640: Add new swapped-speakers quirk
    8840d3491a03 ASoC: Intel: bytcr_rt5640: Add quirk for the Medion Lifetab S10346
    a63ab09a07b2 platform/x86: thinkpad_acpi: fix for incorrect fan reporting on some ThinkPad systems
    44521a5dc40b HID: nintendo: fix initializer element is not constant error
    3910d7a441f2 kselftest: alsa: fixed a print formatting warning
    2a36b4e5e608 Input: xpad - add Razer Wolverine V2 support
    31fbbc809c9e wifi: iwlwifi: pcie: avoid a NULL pointer dereference
    05d268e2e4ad ARC: fix spare error
    372a93921e29 s390/scm: fix virtual vs physical address confusion
    626b0c0ab3a0 Input: i8042 - add nomux quirk for Acer P459-G2-M
    30fe4c4135cb Input: atkbd - skip ATKBD_CMD_GETID in translated mode
    b6ef44cb6a67 reset: hisilicon: hi6220: fix Wvoid-pointer-to-enum-cast warning
    c5d9fd8c5aa4 Input: psmouse - enable Synaptics InterTouch for ThinkPad L14 G1
    b0407f68d917 ring-buffer: Do not record in NMI if the arch does not support cmpxchg in NMI
    07787918c6cf tracing: Fix uaf issue when open the hist or hist_debug file
    851865caacc5 MIPS: dts: loongson: drop incorrect dwmac fallback compatible
    708579592c68 stmmac: dwmac-loongson: drop useless check for compatible fallback
    e75c3db90445 tracing: Add size check when printing trace_marker output
    7d885c171765 tracing: Have large events show up as '[LINE TOO BIG]' instead of nothing
    3ac74ed58f4a jbd2: fix soft lockup in journal_finish_inode_data_buffers()
    bb0e510b742b platform/x86: intel-vbtn: Fix missing tablet-mode-switch events
    f379394a78a0 neighbour: Don't let neigh_forced_gc() disable preemption for long
    9b5044e17e1e drm/crtc: Fix uninit-value bug in drm_mode_setcrtc
    28c9fced8ddf jbd2: increase the journal IO's priority
    6b15330693ac jbd2: correct the printing of write_flags in jbd2_write_superblock()
    c84f9a5ecb82 clk: rockchip: rk3128: Fix HCLK_OTG gate register
    3fe5fbc3a557 clk: rockchip: rk3568: Add PLL rate for 292.5MHz
    c3597996a3ae LoongArch: Preserve syscall nr across execve()
    c73cc2310a5a hwmon: (corsair-psu) Fix probe when built-in
    53442204b1dd drm/exynos: fix a wrong error checking
    1502a9a595e5 drm/exynos: fix a potential error pointer dereference
    92decec3caa7 drm/amdgpu: Add NULL checks for function pointers
    5337fb3ebaa4 arm64: dts: rockchip: Fix PCI node addresses on rk3399-gru
    ce9768612491 nvme: prevent potential spectre v1 gadget
    df2bd52354d8 nvme: introduce helper function to get ctrl state
    a50562146d6c ASoC: ops: add correct range check for limiting volume
    01a7727ab7f1 ASoC: da7219: Support low DC impedance headset
    a7d15ac0853c net/tg3: fix race condition in tg3_reset_task()
    c342afc14623 ASoC: hdac_hda: Conditionally register dais for HDMI and Analog
    0f37e198c338 ASoC: amd: yc: Add DMI entry to support System76 Pangolin 13
    2fff601a1d98 nouveau/tu102: flush all pdbs on vmm flush
    94d2a9da31ab ASoC: Intel: skl_hda_dsp_generic: Drop HDMI routes when HDMI is not available
    1613195bf31e ASoC: rt5650: add mutex to avoid the jack detection failure
    b45e21b529d8 ASoC: cs43130: Fix incorrect frame delay configuration
    0c7833f75857 ASoC: cs43130: Fix the position of const qualifier
    b0c9af3d31bf ASoC: Intel: Skylake: mem leak in skl register function
    7c09cf80954b ASoC: nau8822: Fix incorrect type in assignment and cast to restricted __be16
    522f69ba6b4c ASoC: Intel: Skylake: Fix mem leak in few functions
    9f1429c5aa79 arm64: dts: rockchip: fix rk356x pcie msg interrupt name
    3996699d1f02 ASoC: wm8974: Correct boost mixer inputs
    63360763bff9 hwtracing: hisi_ptt: Don't try to attach a task
    2e3fc2a45a7a hwtracing: hisi_ptt: Handle the interrupt in hardirq context
    319c5186d66c nvme-core: check for too small lba shift
    f84b0c64452e blk-mq: don't count completed flush data request as inflight in case of quiesce
    366d2101fc59 smb: client, common: fix fortify warnings
    53a37135f763 drm/amdgpu: Fix cat debugfs amdgpu_regs_didt causes kernel null pointer
    d551c77727b7 drm/amd/display: update dcn315 lpddr pstate latency
    3c781fbb4f42 nvme-core: fix a memory leak in nvme_ns_info_from_identify()
    a37096b079b7 ALSA: hda: intel-nhlt: Ignore vbps when looking for DMIC 32 bps format
    08f6de7b3f78 debugfs: fix automount d_fsdata usage
    d1d138c043ab wifi: mac80211: handle 320 MHz in ieee80211_ht_cap_ie_to_sta_ht_cap
    0c880e1e38ea wifi: avoid offset calculation on NULL pointer
    dd9465b10880 wifi: cfg80211: lock wiphy mutex for rfkill poll
    91edb0cd1b42 mptcp: fix uninit-value in mptcp_incoming_options
    90389621303b ALSA: hda - Fix speaker and headset mic pin config for CHUWI CoreBook XPro
    9436ae696a19 pinctrl: lochnagar: Don't build on MIPS
    5de9e9dd1828 f2fs: explicitly null-terminate the xattr list

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 06c07b70c8..cbf8a18d30 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6fd0860ac9846438f226257ab515bcd612fdc379"
-SRCREV_meta ?= "40dede8a165ea5894f172fede6baa0dd94d23fec"
+SRCREV_machine ?= "8c4c2f0278e1c64eb5e95bfb23d6322e81090b3d"
+SRCREV_meta ?= "ea5365f818fb6031ec97b8ae7a88bb83001b901e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.73"
+LINUX_VERSION ?= "6.1.78"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index e391074f8b..3f100b579f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.73"
+LINUX_VERSION ?= "6.1.78"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "6c78fd37122b29c40bd8bb6f43aaa1ba7d6fb53a"
-SRCREV_meta ?= "40dede8a165ea5894f172fede6baa0dd94d23fec"
+SRCREV_machine ?= "d025fe8c17718aa4c837bfafee0f3aa0f830bc75"
+SRCREV_meta ?= "ea5365f818fb6031ec97b8ae7a88bb83001b901e"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index f520954646..982996b9a8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "45e6b64447b888e94af6fa8529cf976bf8116624"
-SRCREV_machine:qemuarm64 ?= "6c78fd37122b29c40bd8bb6f43aaa1ba7d6fb53a"
-SRCREV_machine:qemuloongarch64 ?= "6c78fd37122b29c40bd8bb6f43aaa1ba7d6fb53a"
-SRCREV_machine:qemumips ?= "90ea25826ce7ef511d0d93ae33c3888f3b583bf3"
-SRCREV_machine:qemuppc ?= "6c78fd37122b29c40bd8bb6f43aaa1ba7d6fb53a"
-SRCREV_machine:qemuriscv64 ?= "6c78fd37122b29c40bd8bb6f43aaa1ba7d6fb53a"
-SRCREV_machine:qemuriscv32 ?= "6c78fd37122b29c40bd8bb6f43aaa1ba7d6fb53a"
-SRCREV_machine:qemux86 ?= "6c78fd37122b29c40bd8bb6f43aaa1ba7d6fb53a"
-SRCREV_machine:qemux86-64 ?= "6c78fd37122b29c40bd8bb6f43aaa1ba7d6fb53a"
-SRCREV_machine:qemumips64 ?= "59248cf67c17a987f898d9d0c81292cb5fcda858"
-SRCREV_machine ?= "6c78fd37122b29c40bd8bb6f43aaa1ba7d6fb53a"
-SRCREV_meta ?= "40dede8a165ea5894f172fede6baa0dd94d23fec"
+SRCREV_machine:qemuarm ?= "2f7e672f9677d3cc448ec7e004763f76f95c7fe0"
+SRCREV_machine:qemuarm64 ?= "d025fe8c17718aa4c837bfafee0f3aa0f830bc75"
+SRCREV_machine:qemuloongarch64 ?= "d025fe8c17718aa4c837bfafee0f3aa0f830bc75"
+SRCREV_machine:qemumips ?= "f6c42d90dab94077c1c8b6b7eb77d6ca85eab07e"
+SRCREV_machine:qemuppc ?= "ff10270b2748ad74c93ef0abf8e76a464665c23d"
+SRCREV_machine:qemuriscv64 ?= "d025fe8c17718aa4c837bfafee0f3aa0f830bc75"
+SRCREV_machine:qemuriscv32 ?= "d025fe8c17718aa4c837bfafee0f3aa0f830bc75"
+SRCREV_machine:qemux86 ?= "d025fe8c17718aa4c837bfafee0f3aa0f830bc75"
+SRCREV_machine:qemux86-64 ?= "d025fe8c17718aa4c837bfafee0f3aa0f830bc75"
+SRCREV_machine:qemumips64 ?= "01b545e3fd1f9ea66d812e281de06b07c861dd69"
+SRCREV_machine ?= "d025fe8c17718aa4c837bfafee0f3aa0f830bc75"
+SRCREV_meta ?= "ea5365f818fb6031ec97b8ae7a88bb83001b901e"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "fec3b1451d5febbc9e04250f879c10f8952e6bed"
+SRCREV_machine:class-devupstream ?= "8b4118fabd6eb75fed19483b04dab3a036886489"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -45,7 +45,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.73"
+LINUX_VERSION ?= "6.1.78"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


