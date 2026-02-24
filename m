Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B082BE9B27B
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:25:10 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21276.1771943108695492276
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:25:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2EWxRzDj;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso42411595e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943107; x=1772547907; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r+8pdtSwYRzANczJJ7KAHwXZLgy75TMwWCQJgSHYwWk=;
        b=2EWxRzDjvHXlhxAxMbERrMwiY7OV5tTEnwtOb2Ya1wmUarz+K9NXY+uuD4UVWHH7S8
         ql4e29G4sPVYuM0iq7gpGF199WCf62sFDGOf4cBNLslYrUWwnqo5xDoFKZ+BgL8TZniz
         qjdCzvXmMjStA81LUuxp4g7nXrjFvwG1BmZHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943107; x=1772547907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r+8pdtSwYRzANczJJ7KAHwXZLgy75TMwWCQJgSHYwWk=;
        b=DuZa1E6ymbafOLERs6qBBXIskF0Za6e/jAxVnokv+I7PSjuPX1nObe1CPOTviZrFXK
         mUCtnycjqHwLIbjZbuDBcKC52KpW84vRKkiajryoIAFAjvaaC5q5tOBj5pln/mdiYCJM
         OI9rcQicyxBHbf/dMwVCP/lkPQLGcFJqaIQRpouZNyIjTytNt01P1/Uh5EXLliFRn9ra
         xUI6IOuzJwrZyg5voUlq7aZb759OXune23laF2hzIG2RsUF24bVdIH6jPQPE9sc8f7zl
         xXAvawGPHoKS+VyuKI3gi1OKP/I4eMFp475iJANjhTxjgvlFl68TIyP+UVlW77qjo3zi
         8cOg==
X-Gm-Message-State: AOJu0Yx4mymU45Uxcyxp3VtfwZV2LgIlR4OMe05U8ImQ6Unxrh6JoqVW
	SKyJEzgqZMvWPT/Ma7Xeldn3B0K6tBLxTe+LsSaj+Sc9bgcimH/co2/+qEvr1+f4PjHmvsOU66B
	4PRMm
X-Gm-Gg: AZuq6aL1jIqBWrYxpKjvYtDr2QApsg9J4l9VQN4Aw3zrJdNjMJWv2urH+gZzvnsB4hu
	NlAFqWnsG+ZLilZS4eivADYy2CetOllsDiuJjUO6SVMVeOttaJ+sGLi3N3A8NjhZIhGNKmnc+Hd
	mBA6Jaf2GFjrylPu7yDlCe8O5Y3Dj4p7hBe2CdkG8dY+yt8rYscZuGDv6B+Oj1VS+T99VjLzyUT
	kvODhTOZ8XD8Acf/Nk7u31fyNHSq5n2/vKcQPuEU0qNGCsu9MCNMRgPocjdFVyapk3rY/1ggHBz
	xET7oD6e+qK3BV3mj+FeGIbcvrS7HQuOT/dfQUgjVMKxIpsDyzHByDM/QW6N/MBmXinXfv0UAgN
	Wpi7Nl5d28tZztdRt48kF+fMRpuz8UtIJhJDm7Oym8CpotUrX07jCcqxGt3p5qcZ182YZoov4Wz
	bjlXYnIQyT/L7GEmFOMiAW92HcbTJE3Qgwnyo21nQo4WAFuNUG7pWo7m0Y1V933SZPLJfJXHm59
	ELBBjai9aWPG9MADi3ABE3FDSgaQFPWiarA4w8fcn08
X-Received: by 2002:a05:600c:6291:b0:47a:7fdd:2906 with SMTP id 5b1f17b1804b1-483a95b7157mr216101035e9.12.1771943106356;
        Tue, 24 Feb 2026 06:25:06 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm2047455e9.9.2026.02.24.06.25.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:25:06 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/38] linux-yocto/5.15: update to v5.15.199
Date: Tue, 24 Feb 2026 15:24:08 +0100
Message-ID: <d1a2ac67acb3b9dacd1f501e7fecacbcadc3c8cf.1771942869.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771942869.git.yoann.congal@smile.fr>
References: <cover.1771942869.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:25:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231782

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    7b232985052fc Linux 5.15.199
    7e6040853f5b5 wifi: cfg80211: init wiphy_work before allocating rfkill fails
    c6d143fc945f7 wifi: cfg80211: fully move wiphy work to unbound workqueue
    8930a3e1568cf wifi: cfg80211: cancel wiphy_work before freeing wiphy
    d81ebee178731 wifi: cfg80211: fix wiphy delayed work queueing
    4737cc74b2fd8 wifi: cfg80211: use system_unbound_wq for wiphy work
    c8b15b0d2eec3 team: Move team device type change at the end of team_port_add
    9b32d72687cfb pinctrl: meson: mark the GPIO controller as sleeping
    2ccfb37ef544f mptcp: avoid dup SUB_CLOSED events after disconnect
    e69e435ec6e68 writeback: fix 100% CPU usage when dirtytime_expire_interval is 0
    52755c5680ce3 drm/imx/tve: fix probe device leak
    28f5cbcce5d9d pinctrl: lpass-lpi: implement .get_direction() for the GPIO driver
    46933b9bc76f4 net/sched: act_ife: convert comma to semicolon
    ffac9893ce8d0 btrfs: prevent use-after-free on page private data in btrfs_subpage_clear_uptodate()
    e11e8a29b304c drm/amdkfd: fix a memory leak in device_queue_manager_init()
    dc934d9667399 can: esd_usb: esd_usb_read_bulk_callback(): fix URB memory leak
    186df821de0f3 genirq/irq_sim: Initialize work context pointers properly
    00d52b2fa6083 HID: uclogic: Add NULL check in uclogic_input_configured()
    51f49e3927ad5 HID: uclogic: Correct devm device reference for hidinput input_dev name
    c3a2e803b24eb wifi: mac80211: move TDLS work to wiphy work
    9ac16e7b0b828 wifi: mac80211: use wiphy work for sdata->work
    ddb1bfbf4ab5c wifi: cfg80211: add a work abstraction with special semantics
    e1fa25a91091b Bluetooth: Fix hci_suspend_sync crash
    b15c9a21950e1 net: stmmac: make sure that ptp_rate is not 0 before configuring EST
    65d04291adf7c usbnet: Fix using smp_processor_id() in preemptible code warnings
    49b57b98fa601 NFSD: fix race between nfsd registration and exports_proc
    98fc9c2cc45cf ext4: fix memory leaks in ext4_fname_{setup_filename,prepare_lookup}
    05db2b850a2b8 espintcp: fix skb leaks
    0561aa6033dd1 blk-cgroup: Reinit blkg_iostat_set after clearing in blkcg_reset_stats()
    bdf38063fd15f fs/ntfs3: Initialize allocated memory before use
    446beed646b2e ksmbd: fix use-after-free in ksmbd_tree_connect_put under concurrency
    c4079a34c0ade drm/ttm: fix undefined behavior in bit shift for TTM_TT_FLAG_PRIV_POPULATED
    10644e8839544 ksm: use range-walk function to jump over holes in scan_get_next_rmap_item
    f87f4de092c7a mm/pagewalk: add walk_page_range_vma()
    f569f5b8bfd51 ksmbd: smbd: fix dma_unmap_sg() nents
    2c34622d9c724 mei: trace: treat reg parameter as string
    d5e80d1f97ae5 ALSA: scarlett2: Fix buffer overflow in config retrieval
    95ab26bc462d7 nvme: fix PCIe subsystem reset controller state transition
    886d98fa48580 nvme-pci: do not directly handle subsys reset fallout
    25c6804cbde4b nvme-fc: rename free_ctrl callback to match name pattern
    937309b52ca26 xfs: set max_agbno to allow sparse alloc of last full inode chunk
    6393da54dcb34 dmaengine: stm32: dmamux: fix device leak on route allocation
    7ff0a6402741e dmaengine: stm32: dmamux: fix OF node leak on route allocation failure
    060b08d72a38b w1: therm: Fix off-by-one buffer overflow in alarms_store
    fb6fcdc03fce4 w1: w1_therm: use swap() to make code cleaner
    7b94e4650020e arm64: dts: rockchip: remove redundant max-link-speed from nanopi-r4s
    427b0fb30ddec scsi: xen: scsiback: Fix potential memory leak in scsiback_remove()
    600894c7a2363 iio: adc: exynos_adc: fix OF populate on driver rebind
    f6b672daaca1c of: platform: Use default match table for /firmware
    16c806d04be13 comedi: Fix getting range information for subdevices 16 to 255
    2b1bef126bbb8 tls: Use __sk_dst_get() and dst_dev_rcu() in get_netdev_for_sock().
    10d1b3cf657d5 net: Add locking to protect skb->dev access in ip_output
    aade7df55e12e mptcp: only reset subflow errors when propagated
    461f1832a6d1c scsi: qla2xxx: edif: Fix dma_free_coherent() size
    f8cd47294b4bf scsi: be2iscsi: Fix a memory leak in beiscsi_boot_get_sinfo()
    df13548c0a94f ASoC: fsl: imx-card: Do not force slot width to sample width
    a4181b228db3b dma/pool: distinguish between missing and exhausted atomic pools
    1dd15630fc633 gpiolib: acpi: use BIT_ULL() for u64 mask in address space handler
    65ba13a5b3d05 scsi: firewire: sbp-target: Fix overflow in sbp_make_tpg()
    478873f7324f7 net: bridge: fix static key check
    eaa5da5130ded nfc: nci: Fix race between rfkill and nci_unregister_device().
    1d8ae83e1c61b net/mlx5e: Account for netdev stats in ndo_get_stats64
    138dbe22d8854 net/mlx5e: Report rx_discards_phy via rx_dropped
    ba253d322e536 net/mlx5e: Expose rx_oversize_pkts_buffer counter
    b3f0dab4f9682 net/mlx5: Add HW definitions of vport debug counters
    5b47b402f5833 ice: stop counting UDP csum mismatch as rx_errors
    65e976e1f474a nfc: llcp: Fix memleak in nfc_llcp_send_ui_frame().
    b11e6f926480a rocker: fix memory leak in rocker_world_port_post_fini()
    9fe793a779ce8 ipv6: use the right ifindex when replying to icmpv6 from localhost
    94ae00a809c07 net: mvpp2: cls: Fix memory leak in mvpp2_ethtool_cls_rule_ins()
    2b65e3ae33818 net/mlx5: Fix memory leak in esw_acl_ingress_lgcy_setup()
    ccc683f597ceb Bluetooth: hci_uart: fix null-ptr-deref in hci_uart_write_work
    feae34c992eb7 bpf: Reject narrower access to pointer ctx fields
    e0ffb64a2d72c bpf: Do not let BPF test infra emit invalid GSO types to stack
    ad97b9a55246e migrate: correct lock ordering for hugetlb file folios
    ef6e608e5ee71 can: usb_8dev: usb_8dev_read_bulk_callback(): fix URB memory leak
    b5a1ccdc63b71 can: mcba_usb: mcba_usb_read_bulk_callback(): fix URB memory leak
    40a3334ffda47 can: kvaser_usb: kvaser_usb_read_bulk_callback(): fix URB memory leak
    f48eabd15194b can: ems_usb: ems_usb_read_bulk_callback(): fix URB memory leak
    e2f9c751f73a2 irqchip/gic-v3-its: Avoid truncating memory addresses
    ede8ce83c2184 perf/x86/intel: Do not enable BTS for guests
    6e0110ea90313 netrom: fix double-free in nr_route_frame()
    8b57bf1d3b1db uacce: ensure safe queue release with state management
    ebfa85658a39b uacce: implement mremap in uacce_vm_ops to return -EPERM
    1bc3e51367c42 uacce: fix cdev handling in the cleanup path
    64015cbf06e8b intel_th: fix device leak on output open()
    948615429c9f2 slimbus: core: fix device reference leak on report present
    00cf6f7478c9f slimbus: core: fix runtime PM imbalance on report present
    6c77ce4da447a octeontx2: Fix otx2_dma_map_page() error return code
    361df59ad0130 arm64: Set __nocfi on swsusp_arch_resume()
    0d7c9e793e351 wifi: rsi: Fix memory corruption due to not set vif driver data size
    de34a80e0d6ec wifi: mwifiex: Fix a loop in mwifiex_update_ampdu_rxwinsize()
    fc8da65f9fe1b wifi: ath10k: fix dma_free_coherent() pointer
    c1c758ecd68bf mmc: rtsx_pci_sdmmc: implement sdmmc_card_busy function
    56fb6efd5d04c ALSA: usb-audio: Fix use-after-free in snd_usb_mixer_free()
    afca7ff5d5d4d ALSA: ctxfi: Fix potential OOB access in audio mixer handling
    029efb5adffb1 iio: dac: ad5686: add AD5695R to ad5686_chip_info_tbl
    fdc8c835c637a iio: adc: at91-sama5d2_adc: Fix potential use-after-free in sama5d2_adc driver
    92a2745aa0f66 iio: adc: ad9467: fix ad9434 vref mask
    fb396ee1bc53a of: fix reference count leak in of_alias_scan()
    d117fdcb21b05 leds: led-class: Only Add LED to leds_list when it is fully ready
    f775881f99fa7 x86: make page fault handling disable interrupts properly
    dd9442aedbeae net/sched: act_ife: avoid possible NULL deref
    669bd7a54e626 octeontx2-af: Fix error handling
    3be945abdd228 bonding: provide a net pointer to __skb_flow_dissect()
    92c6dc181a18e be2net: Fix NULL pointer dereference in be_cmd_get_mac_from_list
    9d02de4b2fd6d drm/amd/pm: Workaround SI powertune issue on Radeon 430 (v2)
    078c6eef1db5f drm/amd/pm: Don't clear SI SMC table when setting power limit
    b339601c238af usbnet: limit max_mtu based on device's hard_mtu
    4630897eb1a03 ipv6: annotate data-race in ndisc_router_discovery()
    13f3b3b870688 mISDN: annotate data-race around dev->work
    bd495244dec6e net: hns3: fix the HCLGE_FD_AD_NXT_KEY error setting issue
    7d203254f04ff net: hns3: fix wrong GENMASK() for HCLGE_FD_AD_COUNTER_NUM_M
    435c3bd709642 ALSA: usb: Increase volume range that triggers a warning
    766e243ae8c8b regmap: Fix race condition in hwspinlock irqsave routine
    e18ce45f5c809 iio: adc: ad7280a: handle spi_setup() errors in probe()
    bea5c8df16866 staging:iio:adc:ad7280a: Register define cleanup.
    7023a74cdb01d x86/kfence: avoid writing L1TF-vulnerable PTEs
    4daf82511496a scsi: storvsc: Process unsupported MODE_SENSE_10
    e85531cefe175 Input: i8042 - add quirk for ASUS Zenbook UX425QA_UM425QA
    d303e5d338672 Input: i8042 - add quirks for MECHREVO Wujie 15X Pro
    7b673faac4784 Revert "nfc/nci: Add the inconsistency check between the input data length and count"
    c49b1646cc50f w1: fix redundant counter decrement in w1_attach_slave_device()
    2081f7ba69c7b comedi: dmm32at: serialize use of paged registers
    fee86edf5803f crypto: authencesn - reject too-short AAD (assoclen<8) to match ESP/ESN spec
    b8c24cf5268fb net/sched: qfq: Use cl_is_active to determine whether class is active in qfq_rm_from_ag
    ae810e6a8ac4f net/sched: Enforce that teql can only be used as root qdisc
    70feb16e3fbfb ipvlan: Make the addrs_lock be per port
    36c40a80109f1 l2tp: avoid one data-race in l2tp_tunnel_del_work()
    611ef4bd9c73d fou: Don't allow 0 for FOU_ATTR_IPPROTO.
    8568171dec862 net: fou: use policy and operation tables generated from the spec
    9e470606c4448 net: fou: rename the source for linking
    cef28f55a515b netlink: add a proto specification for FOU
    380a82d36e37d gue: Fix skb memleak with inner IP protocol 0.
    8f4e8887d43d4 amd-xgbe: avoid misleading per-packet error log
    784428ab1889e sctp: move SCTP_CMD_ASSOC_SHKEY right after SCTP_CMD_PEER_INIT
    72925dbb0c8c7 bonding: limit BOND_MODE_8023AD to Ethernet devices
    e85cf62f75505 net: usb: dm9601: remove broken SR9700 support
    bef3a83a9a67c testptp: Add option to open PHC in readonly mode
    6b32d042aa825 selftest/ptp: update ptp selftest to exercise the gettimex options
    8510559c0fa1e ptp: add testptp mask test
    3d4f2eda35897 selftests/ptp: Add -X option for testing PTP_SYS_OFFSET_PRECISE
    3d58f0709a292 selftests/ptp: Add -x option for testing PTP_SYS_OFFSET_EXTENDED
    3cc43c9b568a5 testptp: Add support for testing ptp_clock_info .adjphase callback
    f33c4d3f4b3f3 testptp: add option to shift clock by nanoseconds
    7d9aa9032d0a9 ptp: Add PHC file mode checks. Allow RO adjtime() without FMODE_WRITE.
    9c46bf50b676f posix-clock: Store file pointer in struct posix_clock_context
    62a5adf57b56e Fix memory leak in posix_clock_open()
    a006fc4485159 posix-clock: introduce posix_clock_context concept
    dc84036c173cf btrfs: fix deadlock in wait_current_trans() due to ignored transaction type
    41aac90212612 dmaengine: ti: k3-udma: fix device leak on udma lookup
    c933aa74d9f8d dmaengine: ti: dma-crossbar: fix device leak on am335x route allocation
    1d8478b31a3da dmaengine: ti: dma-crossbar: fix device leak on dra7x route allocation
    68ed0d88d1a70 dmaengine: sh: rz-dmac: Fix rz_dmac_terminate_all()
    4532f18e4ab36 dmaengine: qcom: gpi: Fix memory leak in gpi_peripheral_config()
    499ddae78c4ba dmaengine: lpc18xx-dmamux: fix device leak on route allocation
    b7bd948f89271 dmaengine: idxd: fix device leaks on compat bind and unbind
    4730f12a192d7 dmaengine: bcm-sba-raid: fix device leak on probe
    4c67b4f45c854 dmaengine: at_hdmac: fix device leak on of_dma_xlate()
    e8758f114a922 drm/vmwgfx: Fix an error return check in vmw_compat_shader_add()
    bb309377eece5 drm/panel-simple: fix connector type for DataImage SCF0700C48GGU18 panel
    c775abb6cd82a drm/nouveau/disp/nv50-: Set lock_core in curs507a_prepare
    eda99622e6f39 mm/page_alloc: make percpu_pagelist_high_fraction reads lock-free
    c85c550eff812 x86/resctrl: Fix memory bandwidth counter width for Hygon
    fa226f722e2fe x86/resctrl: Add missing resctrl initialization for Hygon
    d35365d8f8888 EDAC/i3200: Fix a resource leak in i3200_probe1()
    123a6bbe87cc1 EDAC/x38: Fix a resource leak in x38_probe1()
    6cf35964a8150 hrtimer: Fix softirq base check in update_needs_ipi()
    6241cd1d0acc2 ext4: fix iloc.bh leak in ext4_xattr_inode_update_ref
    e306c64bd2c56 nvme-pci: disable secondary temp for Wodposit WPBSNM8
    2e8ea7257c5fd USB: serial: ftdi_sio: add support for PICAXE AXE027 cable
    7e4c68838c605 USB: serial: option: add Telit LE910 MBIM composition
    23defd20f98f3 USB: OHCI/UHCI: Add soft dependencies on ehci_platform
    14739a3543c8d usb: dwc3: Check for USB4 IP_NAME
    742ff37b51270 phy: tegra: xusb: Explicitly configure HS_DISCON_LEVEL to 0x7
    e7e87af627449 phy: rockchip: inno-usb2: fix communication disruption in gadget mode
    53b1ed2f400ee phy: rockchip: inno-usb2: fix disconnection in gadget mode
    b6923f0ffb981 x86/kaslr: Recognize all ZONE_DEVICE users as physaddr consumers
    adabf01c19561 net: can: j1939: j1939_xtp_rx_rts_session_active(): deactivate session upon receiving the second rts
    aab3a76c03b7c ALSA: pcm: Improve the fix for race of buffer access at PCM OSS layer
    7d76380e98bfa HID: usbhid: paper over wrong bNumDescriptor field
    2b29f38f4f966 dmaengine: omap-dma: fix dma_pool resource leak in error paths
    23a52bffe415f phy: broadcom: ns-usb3: Fix Wvoid-pointer-to-enum-cast warning (again)
    fb9d513cdf161 phy: stm32-usphyc: Fix off by one in probe()
    d8f1e61238799 dmaengine: xilinx_dma: Fix uninitialized addr_width when "xlnx,addrwidth" property is missing
    76992310f8077 dmaengine: tegra-adma: Fix use-after-free
    b36b4c0dd281b mm, kfence: describe @slab parameter in __kfence_obj_info()
    ea46adfe5cc03 textsearch: describe @list member in ts_ops search
    209f350326c8d ASoC: tlv320adcx140: fix word length
    cff6cd703f41d net/sched: sch_qfq: do not free existing class in qfq_change_class()
    0badf6ffd2c39 selftests: drv-net: fix RPS mask handling for high CPU numbers
    bf1dfd389b6ae net/mlx5e: Restore destroying state bit after profile cleanup
    014ba8f2953c0 vsock/test: add a final full barrier after run all tests
    8d5b6b2d79c1c ipv4: ip_gre: make ipgre_header() robust
    484919832e2db macvlan: fix possible UAF in macvlan_forward_source()
    45126b1249757 net: update netdev_lock_{type,name}
    64c71d60a21a9 ip6_tunnel: use skb_vlan_inet_prepare() in __ip6_tnl_rcv()
    76abc83a9d255 nvme-tcp: fix NULL pointer dereferences in nvmet_tcp_build_pdu_iovec
    4fcde4590de2d nvmet-tcp: remove boilerplate code
    97250eb05e4b6 can: etas_es58x: allow partial RX URB allocation to succeed
    27c90d8ed81e7 pnfs/flexfiles: Fix memory leak in nfs4_ff_alloc_deviceid_node()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/linux-yocto-rt_5.15.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.15.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 24 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index ebe610c64b1..e23c8bf88ab 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2afe5ce992e8048f0728eafea9efed380ec08d46"
+SRCREV_machine ?= "27c8048897d9d7ff1ed6d2643cbc024eb13ae342"
 SRCREV_meta ?= "78eca082b68ad521c3bb9a1f9f0325e044045f18"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.198"
+LINUX_VERSION ?= "5.15.199"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 1a3a110c670..21233285b57 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.198"
+LINUX_VERSION ?= "5.15.199"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,7 +14,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "30a5abb43773a288fe85ed754f1d4518ca8f28bb"
+SRCREV_machine ?= "7b20eb2129d25bb2a1cb963d30c2f3adb1e144b3"
 SRCREV_meta ?= "78eca082b68ad521c3bb9a1f9f0325e044045f18"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index f33ef22d83f..861af0041af 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,16 +14,16 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "3cce45b328f3485e7de2bedee542ef6898e050be"
-SRCREV_machine:qemuarm64 ?= "2b2737663d7c08b6df6ae791d46caae904710ce0"
-SRCREV_machine:qemumips ?= "7ae75ed1e71b6038140416ed1c0791373b0ed5e9"
-SRCREV_machine:qemuppc ?= "490def1150cbd931cf4ae1214c6400c47bf7bde6"
-SRCREV_machine:qemuriscv64 ?= "9121f41155a13f494c537589064abf738cb00c76"
-SRCREV_machine:qemuriscv32 ?= "9121f41155a13f494c537589064abf738cb00c76"
-SRCREV_machine:qemux86 ?= "9121f41155a13f494c537589064abf738cb00c76"
-SRCREV_machine:qemux86-64 ?= "9121f41155a13f494c537589064abf738cb00c76"
-SRCREV_machine:qemumips64 ?= "7e46020155a56cdcedf78dcaa4c90fc97393c09c"
-SRCREV_machine ?= "9121f41155a13f494c537589064abf738cb00c76"
+SRCREV_machine:qemuarm ?= "0ea8d4a7d24642475c1d1e0d8be44976600eb630"
+SRCREV_machine:qemuarm64 ?= "33aae9ebda82736fc0246e4d2bd7967bb7ef492a"
+SRCREV_machine:qemumips ?= "0d159686c17443503bc7b59f25b5129c8543193d"
+SRCREV_machine:qemuppc ?= "c8e213f83bae4792c1042bdcedd46fa60963c69b"
+SRCREV_machine:qemuriscv64 ?= "e7bbf58a0f6828ffb92109eb423eb3d1327f091a"
+SRCREV_machine:qemuriscv32 ?= "e7bbf58a0f6828ffb92109eb423eb3d1327f091a"
+SRCREV_machine:qemux86 ?= "e7bbf58a0f6828ffb92109eb423eb3d1327f091a"
+SRCREV_machine:qemux86-64 ?= "e7bbf58a0f6828ffb92109eb423eb3d1327f091a"
+SRCREV_machine:qemumips64 ?= "58c96e47bbd784e078e265426b9276bad2bb7e22"
+SRCREV_machine ?= "e7bbf58a0f6828ffb92109eb423eb3d1327f091a"
 SRCREV_meta ?= "78eca082b68ad521c3bb9a1f9f0325e044045f18"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
@@ -31,7 +31,7 @@ SRCREV_meta ?= "78eca082b68ad521c3bb9a1f9f0325e044045f18"
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "9eec9a14ee10820a0c00dd3e02ac1e0ab27ad142"
+SRCREV_machine:class-devupstream ?= "7b232985052fcf6a78bf0f965aa4241c0678c2ba"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.198"
+LINUX_VERSION ?= "5.15.199"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"

