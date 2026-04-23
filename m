Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C504FC035D
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:40:02 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.575.1776958796012718780
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 08:39:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Y7aPqJBi;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-50faeb8317bso33097011cf.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 08:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776958795; x=1777563595; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jBooKGBv9URV1WcpOi3YNFN8vfPY1V/dLHIN4XnZIA4=;
        b=Y7aPqJBit9nuQT034uaY0Ae0KkvTSC2fegzcWl846d1kyVi1/izb7/Bbca6xGS0JK9
         M+D3uAzLJ4C0OMHaxeT0dGTF+hNImGe0S9oEj5upTiH+WJ+rzLY2p3nwbv0MsoDR2ycF
         AMhhplmztkHotF4KgMV/dpheec5u5M0PIVV3flB31Wgh7RVbebW2qU0vv/9Iu+PYI4xv
         XUUjNUn6FW5Yhit2CauXuOe5ztGfK0dPHf+tA2JD6X9HugNfibn6N55B/vjL9UMeRbhj
         y+YhI8mssfId1ed41fNmUQJSBvhqnjblC4t8kJclhogVNjJ2yr6stKuuFknKwIkQuRUw
         jKHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776958795; x=1777563595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBooKGBv9URV1WcpOi3YNFN8vfPY1V/dLHIN4XnZIA4=;
        b=P26QMy54oF42SsGkpuImu3SPPy7XSA251CorYMfxpim/lXuyd8SztPGRGDwb/PO8Ub
         oFS+2q6mf+cEk2M2YjeMogs1LAC9zk1xlLgxu6j9HxN5ErGRq2u/V92xdFLOgDxsRZu9
         dIjunIlBarZx0KkhZXt2X5Q73KYlOimShFuwm/Ocv8Mx8wjwPLTkJPS3ck8/LSKDPRPi
         8aTlGSC5VGYb9T6FbZxbZKrL95oXpuEgFV82mbSoGGUoawtMzGiq99MlhVDA0pf72YLg
         XrocwOoznImvydzx+DniVezwdfosnf2R8AArAoF+D+L0pFxLKa3/+/sPTaVtZ+NLb70n
         xD4Q==
X-Gm-Message-State: AOJu0YyYvizq5fY2llIRkSW/VnUhZx+Tk5z11NRGVyMJvQc1wDNm4S7j
	0e3QWTmRONZWSQq5XaJdLzbJUpMEqIl+rgSEY60S7HBmd1LABSiKHlIxq8uCCyDB
X-Gm-Gg: AeBDietOdOtp43NKploFMjNQ2dnUx8WLiPUQLXFetePCfTyfA6w0RPF5YGCQEHsaRf7
	S91MRa8SH2aEnjFY+iSU5vApEAfCW+rhHO77moz+UWl+36dEP/VEOZFRGA6ACk/Rqxb6Sz1TPZh
	cb5ft23bbare15rRyJYhz/5FJRHE5Ccppcdm5+wCImw5uqvxRH5eHsXtWJemQ3uZH9v+uBBjnwY
	oYs0HetxHVMaLy5wcsQOFys9dqRymwJZTfTtUoKDBwPyrMRRQWMwqtDr3kbgH9yQbkW6BXhXyNM
	am9vc7bIrVA91MlMW8VaK8lp/V6JHmFXh5qtCFBh9wKqkyq+bjhTNr8NLEcBGPUq6DZyWSa4JgD
	Li34a1mAamXGVnUHWfTPQO/rixolep3fAWLSBu6J4+e1+WKpi08Uq2OEriBNja6HkpuO2d+RFvw
	IXIPuJ/OVQ7cxSmGp7JyR0nNH87kje0dH0OAbEXWUqBe2mR319NEUiDAANvW4TO7qXGkezJKxVD
	BVPAcWhW09Zq/yjaeGDIFVkC+tGt0n8/fjT2FfnGtnix7x8l0ZEV6kU8aUQp7LYIF0TuA==
X-Received: by 2002:a05:622a:5a10:b0:50d:7f66:dca with SMTP id d75a77b69052e-50e36c124ffmr397533361cf.33.1776958794179;
        Thu, 23 Apr 2026 08:39:54 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50e6123c3d7sm101572071cf.12.2026.04.23.08.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:39:53 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][kirkstone][PATCH 01/01] linux-yocto/5.15: update to v5.15.203
Date: Thu, 23 Apr 2026 11:39:52 -0400
Message-ID: <20260423153952.1932696-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 15:40:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235791

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    b9d57c40a767d Linux 5.15.203
    349ef5d2e7bfb io_uring/poll: correctly handle io_poll_add() return value on update
    e6011ae848132 Revert "PCI: Enable ACS after configuring IOMMU for OF platforms"
    b61f04d5d73c5 ksmbd: Fix dangling pointer in krb_authenticate
    11fe566b442e3 ksmbd: Fix refcount leak when invalid session is found on session lookup
    46e5b71666fb7 Bluetooth: L2CAP: Fix accepting multiple L2CAP_ECRED_CONN_REQ
    e68c267787778 i2c: cp2615: fix serial string NULL-deref at probe
    ddfedf33c26a7 i2c: cp2615: replace deprecated strncpy with strscpy
    70b4c41488949 ksmbd: replace hardcoded hdr2_len with offsetof() in smb2_calc_max_out_buf_len()
    3a852f9d1c981 ksmbd: fix potencial OOB in get_file_all_info() for compound requests
    cf929c21eeed5 tracing: Fix potential deadlock in cpu hotplug with osnoise
    f8e19f81d1283 x86/cpu: Enable FSGSBASE early in cpu_init_exception_handling()
    f1acf5887c2bb mm/huge_memory: fix folio isn't locked in softleaf_to_folio()
    757c43c692294 scsi: target: tcm_loop: Drain commands in target_reset handler
    aba3ea98298c5 net: macb: Move devm_{free,request}_irq() out of spin lock area
    20656cd1f243d KVM: x86/mmu: Drop/zap existing present SPTE even when creating an MMIO SPTE
    4829df95dac4b dmaengine: sh: rz-dmac: Protect the driver specific lists
    9f4e66d630960 dmaengine: sh: rz-dmac: Move CHCTRL updates under spinlock
    19437e4f7bb90 xfs: save ailp before dropping the AIL lock in push callbacks
    c8fe17a1b308c ext4: fix use-after-free in update_super_work when racing with umount
    b60697531d1e7 ext4: fix the might_sleep() warnings in kvfree()
    e4325e84727e5 ext4: publish jinode after initialization
    d92d1532e05b1 usb: gadget: uvc: fix NULL pointer dereference during unbind race
    e1e7a66584bf0 usb: gadget: u_ether: Fix race between gether_disconnect and eth_stop
    de93e0862169b usb: gadget: f_hid: move list and spinlock inits from bind to alloc
    b1e0c8d3ab58a net: rfkill: prevent unlimited numbers of rfkill events from being created
    750569d6987a0 seg6: separate dst_cache for input and output paths in seg6 lwtunnel
    902988b0eee1c Revert "mptcp: add needs_id for netlink appending addr"
    5073eef039ed1 xen/privcmd: unregister xenstore notifier on module exit
    80b40f9cb87f3 netlink: add nla be16/32 types to minlen array
    043e111a4fbc5 rxrpc: Fix key/keyring checks in setsockopt(RXRPC_SECURITY_KEY/KEYRING)
    fc76d0bd00850 rxrpc: fix reference count leak in rxrpc_server_keyring()
    275bdf762e820 net: stmmac: fix integer underflow in chain mode
    8637056f9b3e3 net: qualcomm: qca_uart: report the consumed byte on RX skb allocation failure
    ba3b9429de949 mmc: vub300: fix NULL-deref on disconnect
    70d3e622b1009 drm/i915/gt: fix refcount underflow in intel_engine_park_heartbeat
    cb1d318702fdf net: altera-tse: fix skb leak on DMA mapping error in tse_start_xmit()
    414fc5e5a5aff net/tls: fix use-after-free in -EBUSY error path of tls_do_encryption
    2997f4bd1f982 batman-adv: reject oversized global TT response buffers
    8b71299d587d9 nfc: pn533: allocate rx skb before consuming bytes
    50807abac999a arm64: dts: hisilicon: hi3798cv200: Add missing dma-ranges
    15d99f39b7e57 arm64: dts: hisilicon: poplar: Correct PCIe reset GPIO polarity
    3c204a0fd079f wifi: brcmsmac: Fix dma_free_coherent() size
    36ec4fdd6250d tipc: fix bc_ackers underflow on duplicate GRP_ACK_MSG
    c581e5c8f2b59 netfilter: nft_ct: fix use-after-free in timeout object destroy
    667df93769c02 apparmor: fix race between freeing data and fs accessing it
    d9d8560b9b793 apparmor: fix race on rawdata dereference
    1439150cd3c41 apparmor: fix differential encoding verification
    4cafce4d6d0a6 apparmor: fix unprivileged local user can do privileged policy management
    c053ae381ce22 apparmor: Fix double free of ns_name in aa_replace_profiles()
    a75e12ca90c9e apparmor: fix missing bounds check on DEFAULT table in verify_dfa()
    f16f2e5936c0f apparmor: fix side-effect bug in match_char() macro usage
    87d0cecc900e5 apparmor: fix: limit the number of levels of policy namespaces
    4fdc847b10732 apparmor: replace recursive profile removal with iterative approach
    6b79abcb3c985 apparmor: fix memory leak in verify_header
    5487871b2b56c apparmor: validate DFA start states are in bounds in unpack_pdb
    6e4d236d9c4b3 iio: adc: ad7923: Fix buffer overflow for tx_buf and ring_xfer
    c87cc32bc48b1 gpiolib: cdev: fix uninitialised kfifo
    3fe88de886f07 media: uvcvideo: Use heuristic to find stream entity
    983a1d327e264 media: uvcvideo: Mark invalid entities with id UVC_INVALID_ENTITY_ID
    ac1c009c0b81b Input: uinput - take event lock when submitting FF request "event"
    271ee71a1917b Input: uinput - fix circular locking dependency with ff-core
    f6e1f25fa5e73 mptcp: fix slab-use-after-free in __inet_lookup_established
    716c546e88cfe xfrm_user: fix info leak in build_report()
    65518a6965d52 wifi: rt2x00usb: fix devres lifetime
    b416a4245f04a lib/crypto: chacha: Zeroize permuted_state before it leaves scope
    e90f3e74e1ebc wifi: virt_wifi: remove SET_NETDEV_DEV to avoid use-after-free
    3a84fa7847109 io_uring/tctx: work around xa_store() allocation error issue
    21b11e8581285 usb: gadget: f_uac1_legacy: validate control request size
    c1b3d5b0acb19 usb: gadget: f_rndis: Protect RNDIS options with mutex
    d7d702407b61e usb: gadget: f_subset: Fix unbalanced refcnt in geth_free
    9829c6e1b2e41 staging: rtl8723bs: fix out-of-bounds read in rtw_get_ie() parser
    d3c8ea197055c smb: client: Fix refcount leak for cifs_sb_tlink
    8ef7b3f0db69e net: mctp: Don't access ifa_index when missing
    39c2c1a2773aa fbcon: Set fb_display[i]->mode to NULL when the mode is released
    7a431df418ee6 can: gs_usb: gs_usb_receive_bulk_callback(): fix error message
    da01de754e455 can: gs_usb: gs_usb_receive_bulk_callback(): unanchor URL on usb_submit_urb() error
    9c151898cc259 can: gs_usb: gs_usb_receive_bulk_callback(): fix URB memory leak
    6fedf93d3ac3e usb: gadget: dummy_hcd: fix premature URB completion when ZLP follows partial transfer
    d847f375b1bce USB: dummy-hcd: Fix interrupt synchronization error
    cc97fb5969177 USB: dummy-hcd: Fix locking/synchronization error
    07be8c1b3fff3 thunderbolt: Fix property read in nhi_wake_supported()
    78da43320d9d6 net: ftgmac100: fix ring allocation unwind on open failure
    e476745917a1e vxlan: validate ND option lengths in vxlan_na_create
    58f3a14826d4e netfilter: ipset: drop logically empty buckets in mtype_del
    64b24b713e1a3 comedi: me4000: Fix potential overrun of firmware buffer
    9f39fa07259eb comedi: me_daq: Fix potential overrun of firmware buffer
    933a2d6a95f9b comedi: ni_atmio16d: Fix invalid clean-up after failed attach
    2b1f49e4fdff3 comedi: Reinit dev->spinlock between attachments to low-level drivers
    d2a786efdb997 comedi: dt2815: add hardware detection to prevent crash
    d71f45c6cd328 cdc-acm: new quirk for EPSON HMD
    259466f76f5a2 bridge: br_nd_send: validate ND option lengths
    a92895447ebd2 phy: renesas: rcar-gen3-usb2: Assert PLL reset on PHY power off
    786b8f9f82aa9 phy: renesas: rcar-gen3-usb2: Lock around hardware registers and driver data
    57cf5ae2c32c0 phy: renesas: rcar-gen3-usb2: Move IRQ request in probe
    78445e242d076 phy: renesas: rcar-gen3-usb2: Fix role detection on unbind/bind
    cf07ae3d83f51 nvmet-tcp: fix use-before-check of sg in bounds validation
    fb7110a052467 usb: cdns3: gadget: fix state inconsistency on gadget init failure
    3d1433fe34b22 usb: cdns3: gadget: fix NULL pointer dereference in ep_queue
    e9fcca3e87463 usb: dwc2: gadget: Fix spin_lock/unlock mismatch in dwc2_hsotg_udc_stop()
    a9286931dc605 usb: ehci-brcm: fix sleep during atomic
    e189d443767f7 usb: usbtmc: Flush anchored URBs in usbtmc_release
    ee248e6e941e4 usb: ulpi: fix double free in ulpi_register_interface() error path
    51c299d8b859a usb: quirks: add DELAY_INIT quirk for another Silicon Motion flash drive
    0e3ca67e22181 iio: gyro: mpu3050: Fix out-of-sequence free_irq()
    caec338f91469 iio: gyro: mpu3050: Move iio_device_register() to correct location
    658d9deb45d50 iio: gyro: mpu3050: Fix irq resource leak
    fdbe4b5268cd4 iio: gyro: mpu3050: Fix incorrect free_irq() variable
    dc3ce50db8be9 iio: imu: st_lsm6dsx: Set FIFO ODR for accelerometer and gyroscope only
    8599dadeca71a iio: light: vcnl4035: fix scan buffer on big-endian
    3bc12a9bb037c iio: dac: ad5770r: fix error return in ad5770r_read_raw()
    d7144a3885b62 Input: xpad - add support for Razer Wolverine V3 Pro
    920f35fd2666d Input: i8042 - add TUXEDO InfinityBook Max 16 Gen10 AMD to i8042 quirk table
    d7afd7d3e3025 Input: synaptics-rmi4 - fix a locking bug in an error path
    33ee5aabab65a USB: core: add NO_LPM quirk for Razer Kiyo Pro webcam
    83d40e5546844 USB: serial: option: add support for Rolling Wireless RW135R-GL
    6db5125748250 USB: serial: io_edgeport: add support for Blackbox IC135A
    490750655666d drm/ast: dp501: Fix initialization of SCU2C
    53e6175756b8c hwmon: (occ) Fix division by zero in occ_show_power_1()
    01f525cca220a MIPS: Fix the GCC version check for `__multi3' workaround
    7ab69426e7ecb Bluetooth: SMP: force responder MITM requirements before building the pairing response
    667f44f1392df Bluetooth: SMP: derive legacy responder STK authentication from MITM state
    28222e13666b5 ALSA: ctxfi: Fix missing SPDIFI1 index handling
    3f7f8bae0d52c ALSA: caiaq: fix stack out-of-bounds read in init_card
    9a10792cd0b6a USB: serial: option: add MeiG Smart SRM825WN
    549f02d8ec94d wifi: wilc1000: fix u8 overflow in SSID scan buffer size calculation
    5bb398991f378 drm/ioc32: stop speculation on the drm_compat_ioctl path
    2e8656176cc39 riscv: kgdb: fix several debug register assignment bugs
    1338edd51d17b hwmon: (occ) Fix missing newline in occ_show_extended()
    bc9c94d33127e hwmon: (tps53679) Fix device ID comparison and printing in tps53676_identify()
    3a1f63df3915f hwmon: (pxe1610) Check return value of page-select write in probe
    10bc4a4dcded5 bpf: reject direct access to nullable PTR_TO_BUF pointers
    4082f9984a694 ipv6: avoid overflows in ip6_datagram_send_ctl()
    178d48df119f1 net: hsr: fix VLAN add unwind on slave errors
    942813276edeb net/sched: cls_flow: fix NULL pointer dereference on shared blocks
    febf64ca79a2d net/sched: cls_fw: fix NULL pointer dereference on shared blocks
    798d613afb64b net/x25: Fix overflow when accumulating packets
    3f5e300598464 net/x25: Fix potential double free of skb
    534cc17dadd81 net/mlx5: Avoid "No data available" when FW version queries fail
    015aa24d3721a net: macb: properly unregister fixed rate clocks
    67f70841a175f net: macb: fix clk handling on PCI glue driver removal
    82e4a3b56b23b rds: ib: reject FRMR registration before IB connection is established
    257cdb960d8ff Bluetooth: MGMT: validate LTK enc_size on load
    f140593901724 netfilter: nf_tables: reject immediate NF_QUEUE verdict
    d9a0af9e43416 netfilter: x_tables: restrict xt_check_match/xt_check_target extensions for NFPROTO_ARP
    1c2ebdeff8d08 netfilter: ctnetlink: zero expect NAT fields when CTA_EXPECT_NAT absent
    504ba4168466c netfilter: nf_conntrack_helper: pass helper to expect cleanup
    b48f844536090 netfilter: ipset: use nla_strcmp for IPSET_ATTR_NAME attr
    ea01c1b219f5a netfilter: x_tables: ensure names are nul-terminated
    09883bf257f42 netfilter: nfnetlink_log: account for netlink header size
    ead66c77303f7 netfilter: flowtable: strictly check for maximum number of actions
    3c54b66c83fb8 net: ipv6: flowlabel: defer exclusive option free until RCU teardown
    37db6b9726d0b bpf: Fix regsafe() for pointers to packet
    bb5a8db7ae971 net: xilinx: axienet: Correct BD length masks to match AXIDMA IP spec
    23e925183db26 NFC: pn533: bound the UART receive buffer
    71a3eda7e850a net: sched: cls_api: fix tc_chain_fill_node to initialize tcm_info to zero to prevent an info-leak
    bacc7f31085c9 ipv6: prevent possible UaF in addrconf_permanent_addr()
    ab1ff5890c735 net/sched: sch_hfsc: fix divide-by-zero in rtsc_min()
    4f397b950c916 bridge: br_nd_send: linearize skb before parsing ND options
    d6621f60192fe ip6_tunnel: clear skb2->cb[] in ip4ip6_err()
    0452b6526b2f5 ipv6: icmp: clear skb2->cb[] in ip6_err_gen_icmpv6_unreach()
    38b778cd89633 tg3: Fix race for querying speed/duplex
    2fe4d0ba690a6 net: ipv6: ndisc: fix ndisc_ra_useropt to initialize nduseropt_padX fields to zero to prevent an info-leak
    4b75ff0aedd6a net: qrtr: replace qrtr_tx_flow radix_tree with xarray to fix memory leak
    f9acceae7b004 crypto: af-alg - fix NULL pointer dereference in scatterwalk
    0da5c5644396d dt-bindings: auxdisplay: ht16k33: Use unevaluatedProperties to fix common property warning
    bedaf7d0b9d79 btrfs: reject root items with drop_progress and zero drop_level
    a61163daf8a90 HID: multitouch: Check to ensure report responses match the request
    327f789de7ff3 objtool: Fix Clang jump table detection
    8917b72adff3c btrfs: don't take device_list_mutex when querying zone info
    750a33f417f3d atm: lec: fix use-after-free in sock_def_readable()
    5b5b973011180 HID: wacom: fix out-of-bounds read in wacom_intuos_bt_irq
    e7824ec168d2a futex: Clear stale exiting pointer in futex_lock_pi() retry path
    50dd86820e5c8 dmaengine: xilinx_dma: Fix reset related timeout with two-channel AXIDMA
    b456c14fa6649 dmaengine: xilinx_dma: Program interrupt delay timeout
    e18b31ac353fe dmaengine: idxd: Fix freeing the allocated ida too late
    a83e28aa4335f dmaengine: idxd: Remove usage of the deprecated ida_simple_xx() API
    b70bd0378cac5 btrfs: fix lost error when running device stats on multiple devices fs
    fb21c8958e5a8 btrfs: fix super block offset in error message in btrfs_validate_super()
    2ca42c885f5a8 dmaengine: xilinx: xilinx_dma: Fix unmasked residue subtraction
    7290414a27c05 dmaengine: xilinx: xilinx_dma: Fix residue calculation for cyclic DMA
    8d3b20dc43d72 dmaengine: xilinx: xilinx_dma: Fix dma_device directions
    e8f6a8d7b441f phy: ti: j721e-wiz: Fix device node reference leak in wiz_get_lane_phy_types()
    e96c2354b170a ext4: always drain queued discard work in ext4_mb_release()
    5a63033696e60 ext4: fix iloc.bh leak in ext4_fc_replay_inode() error paths
    3a926957cc958 ext4: reject mount if bigalloc with s_first_data_block != 0
    0b84571c88671 ext4: avoid allocate block from corrupted group in ext4_mb_find_by_goal()
    ade1496247feb ext4: make recently_deleted() properly work with lazy itable initialization
    f53a5d9f32924 ext4: convert inline data to extents when truncate exceeds inline size
    239d734c00644 xfs: stop reclaim before pushing AIL during unmount
    46f82430fb480 jbd2: gracefully abort on checkpointing state corruptions
    fe83f0dd51cb9 scsi: ses: Handle positive SCSI error from ses_recv_diag()
    a007246cb6c9e scsi: ibmvfc: Fix OOB access in ibmvfc_discover_targets_done()
    1763757b96d04 alarmtimer: Fix argument order in alarm_timer_forward()
    d6565ea662e17 erofs: add GFP_NOIO in the bio completion if needed
    c1ec36cb37685 virtio_net: Fix UAF on dst_ops when IFF_XMIT_DST_RELEASE is cleared and napi_tx is false
    2c685e99efb3b media: mc, v4l2: serialize REINIT and REQBUFS with req_queue_mutex
    3d4facdf09bcd cpufreq: conservative: Reset requested_freq on limits change
    999ca48d55a8a can: gw: fix OOB heap access in cgw_csum_crc8_rel()
    ea78bed4c8ed8 s390/barrier: Make array_index_mask_nospec() __always_inline
    3c3b970647648 s390/syscalls: Add spectre boundary for syscall dispatch table
    ca4483f36ac1b spi: spi-fsl-lpspi: fix teardown order issue (UAF)
    da52add2b820c ASoC: adau1372: Fix clock leak on PLL lock failure
    05bdb9cc3fb10 ASoC: adau1372: Fix unchecked clk_prepare_enable() return value
    3c1c88a0b5722 sysctl: fix uninitialized variable in proc_do_large_bitmap
    e741720bfb492 hwmon: (adm1177) fix sysfs ABI violation and current unit conversion
    80d62860eac51 ACPI: EC: Fix ECDT probe ordering issues
    08f5d5cbff5ef ACPI: EC: Fix EC address space handler unregistration
    870f9c647de54 ACPICA: Allow address_space_handler Install and _REG execution as 2 separate steps
    01237527e4044 ACPICA: include/acpi/acpixf.h: Fix indentation
    a3b01542b9934 ASoC: Intel: catpt: Fix the device initialization
    9a952c10f61c0 drm/i915/gmbus: fix spurious timeout on 512-byte burst reads
    3e147ba905cad x86/efi: efi_unmap_boot_services: fix calculation of ranges_to_free size
    c391214b9b6ea scsi: scsi_transport_sas: Fix the maximum channel scanning issue
    bc89e520dc943 RDMA/irdma: Return EINVAL for invalid arp index error
    009831768faec RDMA/irdma: Fix deadlock during netdev reset with active connections
    8d40e85a2b9b3 RDMA/irdma: Remove reset check from irdma_modify_qp_to_err()
    c66f722da3ba0 RDMA/irdma: Clean up unnecessary dereference of event->cm_node
    e9e288c1049ed RDMA/irdma: Remove a NOP wait_event() in irdma_modify_qp_roce()
    df727169b90aa RDMA/irdma: Update ibqp state to error if QP is already in error state
    f2b3d3a6c7041 RDMA/rw: Fall back to direct SGE on MR pool exhaustion
    bdff4cf71259e regmap: Synchronize cache for the page selector
    240c5302eed83 net: macb: use the current queue number for stats
    2ef71307c86a9 netfilter: ctnetlink: use netlink policy range checks
    72f3c34de5fdc netlink: allow be16 and be32 types in all uint policy checks
    cbfac0add2afe netlink: introduce bigendian integer types
    72eab86197c07 netlink: hide validation union fields from kdoc
    3617e13baa4ab netfilter: nft_payload: reject out-of-range attributes via policy
    dd9df463d732a netlink: introduce NLA_POLICY_MAX_BE
    82baeb871e8f0 netfilter: nf_conntrack_sip: fix use of uninitialized rtp_addr in process_sdp
    af9b7e2b76596 netfilter: ip6t_rt: reject oversized addrnr in rt_mt6_check()
    21d8efda02994 netfilter: nfnetlink_log: fix uninitialized padding leak in NFULA_PAYLOAD
    9dd13a8641de7 Bluetooth: btusb: clamp SCO altsetting table indices
    de37e2655b7ab Bluetooth: L2CAP: Fix ERTM re-init and zero pdu_len infinite loop
    fa207e6c81c35 dma-mapping: add missing `inline` for `dma_free_attrs`
    af9cfcbc2827b net: enetc: fix the output issue of 'ethtool --show-ring'
    42cfd7898eeed net: fix fanout UAF in packet_release() via NETDEV_UP race
    20f1d3c82d74d platform/olpc: olpc-xo175-ec: Fix overflow error message to print inlen
    3dcf8bb7de8e9 rtnetlink: count IFLA_INFO_SLAVE_KIND in if_nlmsg_size
    ae5575e660410 net/smc: fix double-free of smc_spd_priv when tee() duplicates splice pipe buffer
    4cae986225f8b openvswitch: validate MPLS set/set_masked payload length
    33609454be4f5 net: openvswitch: Avoid releasing netdev before teardown completes
    5eef9ebec7f57 nfc: nci: fix circular locking dependency in nci_close_device
    80d52f7945318 ionic: fix persistent MAC address override on PF
    ce2a60ab575bc pinctrl: mediatek: common: Fix probe failure for devices without EINT
    03d4eafb0f378 Bluetooth: L2CAP: Fix null-ptr-deref on l2cap_sock_ready_cb
    e6d95488c8c96 Bluetooth: hci_ll: Fix firmware leak on error path
    d57384e27d1eb Bluetooth: SCO: Fix use-after-free in sco_recv_frame() due to missing sock_hold
    3340be2bafdcc Bluetooth: L2CAP: Validate PDU length before reading SDU length in l2cap_ecred_data_rcv()
    d8b58c4effd61 can: statistics: add missing atomic access in hot path
    e06b596fc4eb0 af_key: validate families in pfkey_send_migrate()
    41aafca57de4a esp: fix skb leak with espintcp and async crypto
    7ff8dce35151e xfrm: Fix the usage of skb->sk
    9192d1d7e20d5 xfrm: call xdo_dev_state_delete during state update
    5e20f0c17ac5c ALSA: hda/realtek: Add headset jack quirk for Thinkpad X390
    b1ee8a1b2fc20 dma-buf: Include ioctl.h in UAPI header
    1524fe26bd801 ASoC: fsl_easrc: Fix event generation in fsl_easrc_iec958_put_bits()
    8adc188125d9d ASoC: fsl_easrc: Fix event generation in fsl_easrc_iec958_set_reg()
    5d16f519b6eb1 module: Fix kernel panic when a symbol st_shndx is out of bounds
    8917271de58f5 HID: mcp2221: cancel last I2C command on read error
    c4b53c06ee2f4 net: usb: r8152: add TRENDnet TUC-ET2G
    579c4c9857acd HID: magicmouse: avoid memory leak in magicmouse_report_fixup()
    55bd6d82d16d9 HID: magicmouse: fix battery reporting for Apple Magic Trackpad 2
    ba167d5982e2e nvme-pci: ensure we're polling a polled queue
    f15c6a7e843ac platform/x86: touchscreen_dmi: Add quirk for y-inverted Goodix touchscreen on SUPI S10
    da7f8dc3d4d89 platform/x86: intel-hid: Enable 5-button array on ThinkPad X1 Fold 16 Gen 1
    b1918cf667cd7 nvme-pci: cap queue creation to used queues
    6f4259bd82e49 platform/x86: intel-hid: Add Dell 14 Plus 2-in-1 to dmi_vgbs_allow_list
    ede95cfcab806 HID: asus: avoid memory leak in asus_report_fixup()
    a717c721e4a03 bpf: Release module BTF IDR before module unload
    d9b4463da0fe1 sh: platform_early: remove pdev->driver_override check
    a5ea87cc1a2ec xen/privcmd: add boot control for restricted usage in domU
    3ee5b9e3de4b8 xen/privcmd: restrict usage in unprivileged domU
    c0f1f85097ac2 netfilter: nft_set_pipapo: split gc into unlink and reclaim phase
    d725560f80ad4 netfilter: nf_tables: de-constify set commit ops function argument
    e76e88ddc943d tools/bootconfig: fix fd leak in load_xbc_file() on fstat failure
    ad611f645d2ee lib/bootconfig: check xbc_init_node() return in override path
    db8b1bebe81ff drm/i915/gt: Check set_default_submission() before deferencing
    d084179811558 ksmbd: fix use-after-free of share_conf in compound request
    fe24a32b0eb50 mtd: rawnand: brcmnand: skip DMA during panic write
    fe4a73c3dd483 mtd: rawnand: serialize lock/unlock against other NAND operations
    c828ea9fdf8aa i2c: fsi: Fix a potential leak in fsi_i2c_probe()
    1cfa2b8ec09c9 hwmon: (pmbus/isl68137) Fix unchecked return value and use sysfs_emit()
    d783fa413c702 icmp: fix NULL pointer dereference in icmp_tag_validation()
    10cc2d3aa940a net: dsa: bcm_sf2: fix missing clk_disable_unprepare() in error paths
    0cfcd31f98fc6 net: mvpp2: guard flow control update with global_tx_fc in buffer switching
    3c11b5c2436a3 nfnetlink_osf: validate individual option lengths in fingerprints
    edacf1613f7b2 net: bonding: fix NULL deref in bond_debug_rlb_hash_show
    66117dbb3dbae udp_tunnel: fix NULL deref caused by udp_sock_create6 when CONFIG_IPV6=n
    0c191f35224a8 net: macb: fix uninitialized rx_fs_lock
    68408e8f9e366 ACPI: processor: Fix previous acpi_processor_errata_piix4() fix
    12f9eef39e497 wifi: wlcore: Return -ENOMEM instead of -EAGAIN if there is not enough headroom
    74de6fa472b03 wifi: mac80211: fix NULL deref in mesh_matches_local()
    bebbedc5ea0fc igc: fix missing update of skb->tail in igc_xmit_frame()
    b87f361d41f9a net: usb: aqc111: Do not perform PM inside suspend callback
    f315277856cae net/smc: fix NULL dereference and UAF in smc_tcp_syn_recv_sock()
    5be7d03982735 net/smc: Fix slab-out-of-bounds issue in fallback
    643fed48d2aad net/smc: Only save the original clcsock callback functions
    b6dd1a562ca8b PM: runtime: Fix a race condition related to device removal
    c350d5cf6ecee sched: idle: Consolidate the handling of two special cases
    b88edf12fc377 net: mana: fix use-after-free in mana_hwc_destroy_channel() by reordering teardown
    faf06d0019cd8 net: mana: Improve the HWC error handling
    2452fada649fb net: bcmgenet: increase WoL poll timeout
    65fa92f796778 netfilter: nf_conntrack_h323: check for zero length in DecodeQ931()
    7f855ae9d21c0 netfilter: xt_time: use unsigned int for monthday bit shift
    cc57506dd6655 netfilter: xt_CT: drop pending enqueued packets on template removal
    3da0b946835f3 netfilter: nft_ct: drop pending enqueued packets on removal
    b19492c25eff0 netfilter: nft_ct: add seqadj extension for natted connections
    c95dc674ebf01 netfilter: nf_conntrack_h323: fix OOB read in decode_int() CONS case
    cd1b7403ec835 netfilter: nf_conntrack_sip: fix Content-Length u32 truncation in sip_help_tcp()
    9821b47f669eb netfilter: ctnetlink: fix use-after-free in ctnetlink_dump_exp_ct()
    bada48ad5b059 netfilter: ctnetlink: remove refcounting in expectation dumpers
    a753844d2a813 net/rose: fix NULL pointer dereference in rose_transmit_link on reconnect
    7c16b730b76fc Bluetooth: qca: fix ROM version reading on WCN3998 chips
    18b1263ece643 Bluetooth: HIDP: Fix possible UAF
    034ab992d0941 Bluetooth: SMP: make SM/PER/KDU/BI-04-C happy
    a506e9d9e4078 Bluetooth: LE L2CAP: Disconnect if sum of payload sizes exceed SDU
    30b424b2e5a82 Bluetooth: LE L2CAP: Disconnect if received packet's SDU exceeds IMTU
    b9154a1e1956b firmware: arm_scpi: Fix device_node reference leak in probe path
    7bce17b3c79a4 of: Add cleanup.h based auto release via __free(device_node) markings
    787152497ac76 wifi: mac80211: Fix static_branch_dec() underflow for aql_disable.
    d288fbe652ef4 soc: fsl: qbman: fix race condition in qman_destroy_fq
    fde0e471f84fe btrfs: tree-checker: fix misleading root drop_level error message
    0b10a8b355c3f batman-adv: avoid OGM aggregation when skb tailroom is insufficient
    c5e734f6a0740 pmdomain: bcm: bcm2835-power: Increase ASB control timeout
    2bf1726ba9b57 mptcp: pm: avoid sending RM_ADDR over same subflow
    e3147cbfb63b1 drm/amd/display: Use GFP_ATOMIC in dc_create_stream_for_sink
    305afdd02ff3e net: phy: register phy led_triggers during probe to avoid AB-BA deadlock
    54c570de9a358 smb: client: Don't log plaintext credentials in cifs_set_cifscreds
    1f70df004fdd9 RDMA/irdma: Fix kernel stack leak in irdma_create_user_ah()
    b2e9626a9d16b wifi: cfg80211: cancel rfkill_block work in wiphy_unregister()
    30dfeadf42cf0 wifi: cfg80211: move scan done work to wiphy work
    09f3c30ab3b13 wifi: libertas: fix use-after-free in lbs_free_adapter()
    16fce6b6c0b24 ext4: always allocate blocks only from groups inode can use
    922f85e6e88fd ksmbd: fix null pointer dereference error in generate_encryptionkey
    ca408af08544d ext4: fix dirtyclusters double decrement on fs shutdown
    337506dc65238 ext4: drop extent cache when splitting extent fails
    37555690f39f7 ext4: don't set EXT4_GET_BLOCKS_CONVERT when splitting before submitting I/O
    8e3a3192ef78d ksmbd: call ksmbd_vfs_kern_path_end_removing() on some error paths
    9e1ef9396a189 drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free
    c2914c0ca7557 drm/exynos: vidi: fix to avoid directly dereferencing user pointer
    65d1213baffa3 drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
    db34c9ba741df net: Handle napi_schedule() calls from non-interrupt
    f673a3fca4de9 net: stmmac: dwmac-loongson: Set clk_csr_i to 100-150MHz
    ce4cf24761467 mm/hugetlb: fix excessive IPI broadcasts when unsharing PMD tables using mmu_gather
    72bc38a4637ad mm/rmap: fix two comments related to huge_pmd_unshare()
    d75a7f35b8120 mm/hugetlb: fix two comments related to huge_pmd_unshare()
    bf3c2affe245c mm/hugetlb: fix hugetlb_pmd_shared()
    59cd6535e7ed8 mm/hugetlb: fix copy_hugetlb_page_range() to use ->pt_share_count
    c731f6999159b mm/hugetlb: make detecting shared pte more reliable
    4099b192a762e drm/radeon: apply state adjust rules to some additional HAINAN vairants
    40de151be98ea serial: uartlite: fix PM runtime usage count underflow on probe
    6b8f0ff16ea69 serial: 8250: Add late synchronize_irq() to shutdown to handle DW UART BUSY
    79a19bd936bb3 serial: 8250: Fix TX deadlock when using DMA
    2c2889288173f serial: 8250_pci: add support for the AX99100
    d08ccf33b25aa iommu/vt-d: Fix intel iommu iotlb sync hardlockup and retry
    e0065e106f798 mtd: Avoid boot crash in RedBoot partition table parser
    70d175d45146a mtd: rawnand: cadence: Fix error check for dma_alloc_coherent() in cadence_nand_init()
    a1f139912de08 mtd: rawnand: pl353: make sure optimal timings are applied
    cb301583f4598 mmc: sdhci: fix timing selection for 1-bit bus width
    a45eedccce276 mmc: sdhci-pci-gli: fix GL9750 DMA write corruption
    5229e7d15771e Bluetooth: L2CAP: Validate L2CAP_INFO_RSP payload length before access
    3b94e62caa1dc Bluetooth: L2CAP: Fix type confusion in l2cap_ecred_reconf_rsp()
    6b757f345eeea net: macb: fix use-after-free access to PTP clock
    2a175bc3c338c NFC: nxp-nci: allow GPIOs to sleep
    a36cf138500e5 nvdimm/bus: Fix potential use after free in asynchronous initialization
    f18c1f2a88ca9 sunrpc: fix cache_request leak in cache_release
    2b961d5786b4b driver: iio: add missing checks on iio_info's callback access
    27e47500fac23 io_uring/io-wq: check IO_WQ_BIT_EXIT inside work run loop
    4f88c63e40fec l2tp: do not use sock_hold() in pppol2tp_session_get_sock()
    c29dd8336236a bpf: Forget ranges when refining tnum after JSET
    467f67e70c5b4 i3c: mipi-i3c-hci: Add missing TID field to no-op command descriptor
    e6854f05d2c98 i3c: mipi-i3c-hci: Restart DMA ring correctly after dequeue abort
    8045905027596 i3c: mipi-i3c-hci: Use ETIMEDOUT instead of ETIME for timeout errors
    3ab94a9c8b2bc iio: imu: inv_icm42600: fix odr switch to the same value
    2daa6460d0ae6 iio: gyro: mpu3050-i2c: fix pm_runtime error handling
    8544c488e5020 iio: gyro: mpu3050-core: fix pm_runtime error handling
    fe1ecc367df22 iio: chemical: bme680: Fix measurement wait duration calculation
    4024074a6ec3a iio: potentiometer: mcp4131: fix double application of wiper shift
    9aff2e9c2927e iio: chemical: sps30_i2c: fix buffer size in sps30_i2c_read_meas()
    7607bacef39be iio: chemical: sps30_serial: fix buffer size in sps30_serial_read_meas()
    62ed15c86f840 iio: dac: ds4424: reject -128 RAW value
    65ecbe6b424e7 btrfs: abort transaction on failure to update root in the received subvol ioctl
    f6f380b7461db lib/bootconfig: check bounds before writing in __xbc_open_brace()
    6ab599749fca4 lib/bootconfig: fix snprintf truncation check in xbc_node_compose_key_after()
    3dd0812a7c764 x86/apic: Disable x2apic on resume if the kernel expects so
    8314ac8eee4a1 lib/bootconfig: fix off-by-one in xbc_verify_tree() unclosed brace error
    5afae524f83d6 xfs: fix undersized l_iclog_roundoff values
    afd3def0cd487 tracing: Fix trace_buf_size= cmdline parameter with sizes >= 2G
    46d309996bd92 drm/amdgpu: Fix use-after-free race in VM acquire
    5f29dd540fe5e net: ethernet: arc: emac: quiesce interrupts before requesting IRQ
    fef5aa6e3bcf3 net: ncsi: fix skb leak in error paths
    5d5d037d7b9bd parisc: Fix initial page table creation for boot
    a0fc1b9c738fb hwmon: (pmbus/q54sj108a2) fix stack overflow in debugfs read
    4df518aa19608 nouveau/dpcd: return EBUSY for aux xfer if the device is asleep
    9db309a27d810 parisc: Increase initial mapping to 64 MB with KALLSYMS
    192f40ad8a7da batman-adv: Avoid double-rtnl_lock ELP metric worker
    3e2e0d95a4876 ice: fix retry for AQ command 0x06EE
    e21e027adf9e5 net: mana: Ring doorbell at 4 CQ wraparounds
    b2bd2ee73b697 media: dvb-net: fix OOB access in ULE extension header tables
    35969c3a208a0 staging: rtl8723bs: properly validate the data in rtw_get_ie_ex()
    12cc6e8f8d424 staging: rtl8723bs: fix potential out-of-bounds read in rtw_restruct_wmm_ie
    0f9563b0e5ce9 irqchip/gic-v3-its: Limit number of per-device MSIs to the range the ITS supports
    5b51b2ba5207e device property: Allow secondary lookup in fwnode_get_next_child_node()
    b7f2215f09782 time/jiffies: Mark jiffies_64_to_clock_t() notrace
    198b74495a592 time: add kernel-doc in time.c
    6d5fd8bb574be ceph: fix i_nlink underrun during async unlink
    94544cecbaca9 libceph: admit message frames only in CEPH_CON_S_OPEN state
    ee5588e2bc41a libceph: Use u32 for non-negative values in ceph_monmap_decode()
    76ccf21a12c5f libceph: prevent potential out-of-bounds reads in process_message_header()
    b7a4f5bb50c48 libceph: reject preamble if control segment is empty
    edc678e5cd117 libceph: Fix potential out-of-bounds access in ceph_handle_auth_reply()
    3bc9998041076 tipc: fix divide-by-zero in tipc_sk_filter_connect()
    41dce4dae583a mmc: core: Avoid bitfield RMW for claim/retune flags
    7ecc9429fd14e mmc: mmci: Fix device_node reference leak in of_get_dml_pipe_index()
    5ca9a617fca69 mm/tracing: rss_stat: ensure curr is false from kthread context
    15536f6c15f48 usb: image: mdc800: kill download URB on timeout
    ae8eecd0dc1f8 usb: mdc800: handle signal and read racing
    51afaf919bbaa usb: renesas_usbhs: fix use-after-free in ISR during device removal
    170e8daca24da usb: class: cdc-wdm: fix reordering issue in read code path
    06d2bbc4c66c6 USB: core: Limit the length of unkillable synchronous timeouts
    7fa72c369c23c USB: usbtmc: Use usb_bulk_msg_killable() with user-specified timeouts
    a17fe990d3784 USB: usbcore: Introduce usb_bulk_msg_killable()
    ac95a6e521096 usb: cdc-acm: Restore CAP_BRK functionnality to CH343
    f89764142f488 usb: core: don't power off roothub PHYs if phy_set_mode() fails
    7e971902b8883 usb: misc: uss720: properly clean up reference in uss720_probe()
    a8b3b3d730ace usb: yurex: fix race in probe
    6288baf0c8c4d usb: xhci: Fix memory leak in xhci_disable_slot()
    ff608fc19c95d usb/core/quirks: Add Huawei ME906S-device to wakeup quirk
    ad07028902d02 net: usb: lan78xx: skip LTM configuration for LAN7850
    c1cfde2fecd0a net: usb: lan78xx: fix silent drop of packets with checksum errors
    3b95abab73692 cgroup: fix race between task migration and iteration
    4e312de6198b3 Revert "arm64: dts: qcom: sdm845-oneplus: Mark l14a regulator as boot-on"
    514e26686c635 octeontx2-af: devlink: fix NIX RAS reporter recovery condition
    aa1a474efe845 ASoC: detect empty DMI strings
    4d802f23fcbfe ASoC: amd: acp3x-rt5682-max9836: Add missing error check for clock acquisition
    4ee70a46a4196 ACPI: OSL: fix __iomem type on return from acpi_os_map_generic_address()
    0606c24a745ba e1000/e1000e: Fix leak in DMA error cleanup
    7778c72dafa9f i40e: fix src IP mask checks and memcpy argument names in cloud filter
    86183d550559e nvme-pci: Fix slab-out-of-bounds in nvme_dbbuf_set
    d96ce97a021ff sched: idle: Make skipping governor callbacks more consistent
    3c8f756d9fe4c regulator: pca9450: Correct interrupt type
    ac42ddc2a19c8 regulator: pca9450: Make IRQ optional
    144f88054ba01 netfilter: xt_IDLETIMER: reject rev0 reuse of ALARM timer labels
    92441f6d9405a netfilter: nfnetlink_cthelper: fix OOB read in nfnl_cthelper_dump_table()
    0b18d1b834ab5 netfilter: nfnetlink_queue: fix entry leak in bridge verdict error path
    ae1e126765063 netfilter: x_tables: guard option walkers against 1-byte tail reads
    57fb87ca095d5 netfilter: nft_set_pipapo: fix stack out-of-bounds read in pipapo_drop()
    f08e7343d2203 can: hi311x: hi3110_open(): add check for hi3110_power_enable() return value
    52135420e9f75 serial: caif: hold tty->link reference in ldisc_open and ser_release
    3887e514978d2 ASoC: soc-core: flush delayed work before removing DAIs and widgets
    4785d6c90b2b4 ASoC: core: Do not call link_exit() on uninitialized rtd objects
    4f5cf0b7cea9d ASoC: core: Exit all links before removing their components
    3f58bdf8824c8 ASoC: soc-core: accept zero format at snd_soc_runtime_set_dai_fmt()
    901431fe29387 ASoC: soc-core: drop delayed_work_pending() check before flush
    6b1f563d67016 net/sched: teql: fix NULL pointer dereference in iptunnel_xmit on TEQL slave xmit
    6eb68ecc5acc3 net/mlx5e: Fix DMA FIFO desync on error CQE SQ recovery
    57ce1b5e77482 bonding: handle BOND_LINK_FAIL, BOND_LINK_BACK as valid link states
    7ea69259a60a3 xprtrdma: Decrement re_receiving on the early exit paths
    25a41fae28378 powerpc: 83xx: km83xx: Fix keymile vendor prefix
    e72f87bd6d14a remoteproc: mediatek: Unprepare SCP clock during system suspend
    0eb8a15b4d57a remoteproc: sysmon: Correct subsys_name_len type in QMI request
    2d7f2871f8943 powerpc/uaccess: Fix inline assembly for clang build on PPC32
    0a3844c5bf32a ALSA: usb-audio: Check max frame size for implicit feedback mode, too
    0548529af20e6 x86/CPU: Fix FPDSS on Zen1
    17e5006f92ad5 ALSA: usb-audio: Avoid implicit feedback mode on DIYINHK USB Audio 2.0
    8bf6e86ab1aa8 scsi: ses: Fix devices attaching to different hosts
    be40b0297634e ACPI: OSI: Add DMI quirk for Acer Aspire One D255
    d3ffc8f13034a unshare: fix unshare_fs() handling
    f8e833572a3e1 scsi: mpi3mr: Add NULL checks when resetting request and reply queues
    9cc7d9aa5dfd6 ACPI: PM: Save NVS memory on Lenovo G70-35
    b82462af23e45 scsi: storvsc: Fix scheduling while atomic on PREEMPT_RT
    bc4e5bb529823 net/sched: Only allow act_ct to bind to clsact/ingress qdiscs and shared blocks
    c11d7c56c2076 net: ipv6: fix panic when IPv4 route references loopback IPv6 nexthop
    dc3e62cf3bbf6 net: vxlan: fix nd_tbl NULL dereference when IPv6 is disabled
    a5c56e65b6853 net: bridge: fix nd_tbl NULL dereference when IPv6 is disabled
    42da53a2e57b0 net: stmmac: Fix error handling in VLAN add and delete paths
    cdeed45ce8c92 nfc: rawsock: cancel tx_work before socket teardown
    5220b323563c1 nfc: nci: clear NCI_DATA_EXCHANGE before calling completion callback
    6d898f9437664 nfc: nci: free skb on nci_transceive early error paths
    b32e3fb942fd3 net: nfc: nci: Fix zero-length proprietary notifications
    5bb27ad54d12d net: sched: avoid qdisc_reset_all_tx_gt() vs dequeue race for lockless qdiscs
    370d182a1be7c amd-xgbe: fix sleep while atomic on suspend/resume
    a73fe9f4ae84a ipv6: fix NULL pointer deref in ip6_rt_get_dev_rcu()
    a1087e5d3fc55 xen/acpi-processor: fix _CST detection using undersized evaluation buffer
    0ea9a5ad16bd2 indirect_call_wrapper: do not reevaluate function pointer
    fc404390a3864 wifi: wlcore: Fix a locking bug
    416c18ecddafa can: mcp251x: fix deadlock in error path of mcp251x_open
    c85b96eaf766d can: bcm: fix locking for bcm_op runtime updates
    30c9744a989fe atm: lec: fix null-ptr-deref in lec_arp_clear_vccs
    7def51cb9fb8b dpaa2-switch: Fix interrupt storm after receiving bad if_id in IRQ handler
    9ad206519ae1b dpaa2-switch: do not clear any interrupts automatically
    8df08145b5d5c net: dpaa2-switch: serialize changes to priv->mac with a mutex
    62e636598e6fb net: dpaa2-switch replace direct MAC access with dpaa2_switch_port_has_mac()
    a9b045e3e2582 net: dpaa2-switch: assign port_priv->mac after dpaa2_mac_connect() call
    6656b027bf795 net: dpaa2: replace dpaa2_mac_is_type_fixed() with dpaa2_mac_is_type_phy()
    e8042598aed2e net: ethernet: ti: am65-cpsw-nuss/cpsw-ale: Fix multicast entry handling in ALE table
    f7224958b9be5 platform/x86: thinkpad_acpi: Fix errors reading battery thresholds
    e468e5e6ab839 selftests: mptcp: more stable simult_flows tests
    0e27467471442 scsi: core: Fix refcount leak for tagset_refcnt
    cf01aa6288e11 drbd: fix "LOGIC BUG" in drbd_al_begin_io_nonblock()
    3f68a9457a619 Squashfs: check metadata block offset is within range
    a11ec75a029b3 net/sched: ets: fix divide by zero in the offload path
    72fcfd4df46f2 IB/mthca: Add missed mthca_unmap_user_db() for mthca_create_srq()
    f061336f072ab wifi: mac80211: fix NULL pointer dereference in mesh_rx_csa_frame()
    d1d1d3c500959 wifi: radiotap: reject radiotap with unknown bits
    8307d93e63d5f ALSA: usb-audio: Use correct version for UAC3 header validation
    f71d10ab71e36 platform/x86: dell-wmi: Add audio/mic mute key codes
    9bbb420f20283 platform/x86: dell-wmi-sysman: Don't hex dump plaintext password data
    6d8ba221e7aaf x86/efi: defer freeing of boot services memory
    de316c1edf15b HID: Add HID_CLAIMED_INPUT guards in raw_event callbacks missing them
    7a0171b4921ad can: usb: etas_es58x: correctly anchor the urb in the read bulk callback
    e7bb6e0606b5f can: ucan: Fix infinite loop from zero-length messages
    f10177e6c4575 can: ems_usb: ems_usb_read_bulk_callback(): check the proper length of a message
    af7369ae572f5 net: usb: pegasus: validate USB endpoints
    185050b47df3d net: usb: kalmia: validate USB endpoints
    6c986abd2a503 net: usb: kaweth: validate USB endpoints
    5be8aa2bcfb53 nfc: pn533: properly drop the usb interface reference on disconnect
    fb378cf89be43 media: dvb-core: fix wrong reinitialization of ringbuffer on reopen
    eb04aa2a193f9 eventpoll: Fix integer overflow in ep_loop_check_proc()
    1de5e9bea776e net: arcnet: com20020-pci: fix support for 2.5Mbit cards
    02d69a10ac79f ALSA: hda/conexant: Fix headphone jack handling on Acer Swift SF314
    d3e535533767c fbcon: check return value of con2fb_acquire_newinfo()
    e46976857bb9e fbcon: move more common code into fb_open()
    8af9992686cb5 fbcon: Extract fbcon_open/release helpers
    3a848caea0ba8 fbcon: Use delayed work for cursor
    544adb0a6658e ksmbd: fix infinite loop caused by next_smb2_rcv_hdr_off reset in error paths
    8b0b62cb2a883 hwmon: (max16065) Use READ/WRITE_ONCE to avoid compiler optimization induced race
    10db4c21bd69e ALSA: hda/conexant: Add quirk for HP ZBook Studio G4
    ff02bd303d2d7 usb: cdns3: fix role switching during resume
    6eac131cf3b80 usb: cdns3: call cdns_power_is_lost() only once in cdns_resume()
    1769059ce8cc5 usb: cdns3: remove redundant if branch
    865e8344ad3a9 clk: tegra: tegra124-emc: fix device leak on set_rate()
    48a036201f09d mfd: omap-usb-host: Fix OF populate on driver rebind
    65bb9cc3935b3 mfd: omap-usb-host: Convert to platform remove callback returning void
    478c62d048133 mfd: qcom-pm8xxx: Fix OF populate on driver rebind
    adcc7a81b3516 mfd: qcom-pm8xxx: Convert to platform remove callback returning void
    f06a87e2bd0e0 mfd: qcom-pm8xxx: switch away from using chained IRQ handlers
    6c66212b41286 drm/tegra: dsi: fix device leak on probe
    b8b8046b06832 ata: libata-scsi: refactor ata_scsi_translate()
    523fc95b47c60 ata: libata: remove pointless VPRINTK() calls
    bc0a9e11e3aaa ata: libata-scsi: drop DPRINTK calls for cdb translation
    e0d6484cbcc34 scsi: ata: Call scsi_done() directly
    09dc03f5e551c ARM: omap2: Fix reference count leaks in omap_control_init()
    77c8de3b1d55b ARM: OMAP2+: add missing of_node_put before break and return
    04057b86fdac3 memory: mtk-smi: fix device leak on larb probe
    df89a4ea2c01a memory: mtk-smi: Convert to platform remove callback returning void
    88df604f0d16a bpf: Fix stack-out-of-bounds write in devmap
    73571f703da26 btrfs: fix incorrect key offset in error message in check_dev_extent_item()
    5c5200439a790 ALSA: usb-audio: Use inclusive terms
    f4a1c2a4fd726 ALSA: usb-audio: Cap the packet size pre-calculations
    b2226de386edc scsi: ufs: core: Move link recovery for hibern8 exit failure to wl_resume
    cf37d8b3efeaa scsi: ufs: core: Always initialize the UIC done completion
    887f2e54534ef scsi: lpfc: Properly set WC for DPP mapping
    9039cfa5b3604 ip6_tunnel: Fix usage of skb_vlan_inet_prepare()
    8925110928e67 ARM: clean up the memset64() C wrapper
    91d48252ad4b1 Linux 5.15.202
    50d01dcbde56c NTB: ntb_transport: Fix too small buffer for debugfs_name
    a24a8a582da44 net: nfc: nci: Fix parameter validation for packet data
    89ca4181c0607 drm/amdgpu: keep vga memory on MacBooks with switchable graphics
    accd0599bc8e7 net: ethernet: ec_bhf: Fix dma_free_coherent() dma handle
    c4315cb6d7dbe fbdev: ffb: fix corrupted video output on Sun FFB1
    b5bdcc5afbff8 fbdev: of: display_timing: fix refcount leak in of_get_display_timings()
    9c3873cccb3fa fbdev: vt8500lcdfb: fix missing dma_free_coherent()
    f4d9d4b8fd839 ipv6: ioam: fix heap buffer overflow in __ioam6_fill_trace_data()
    73fbc5d1a9ccb atm: fore200e: fix use-after-free in tasklets during device removal
    5357346630df3 net: intel: fix PCI device ID conflict between i40e and ipw2200
    b9ef26240060a tracing: Fix to set write permission to per-cpu buffer_size_kb
    ba8d8429e5d6c net: wan/fsl_ucc_hdlc: Fix dma_free_coherent() in uhdlc_memclean()
    4ad9240884335 net: ethernet: marvell: skge: remove incorrect conflicting PCI ID
    5788b742007f5 ceph: supply snapshot context in ceph_zero_partial_object()
    fef00151ef08d MIPS: rb532: Fix MMIO UART resource registration
    1aa9c59f4b96a staging: rtl8723bs: fix null dereference in find_network
    00dd07a21cf37 parisc: kernel: replace kfree() with put_device() in create_tree_node()
    fbe06a3058114 PCI: Fix pci_slot_trylock() error handling
    e886a77a3d539 net: cpsw_new: Fix unnecessary netdev unregistration in cpsw_probe() error path
    de8d7a25cd2eb drm/amdkfd: Fix out-of-bounds write in kfd_event_page_set()
    c78a5b94451d1 tipc: fix RCU dereference race in tipc_aead_users_dec()
    10e1636eed136 mtd: rawnand: pl353: Fix software ECC support
    3d7a8f36cdb97 usb: dwc2: fix resume failure if dr_mode is host
    d5c3a1a13f973 scsi: ufs: core: Flush exception handling work when RPM level is zero
    91baf24d972ea remoteproc: imx_rproc: Fix invalid loaded resource table detection
    0d9e0baaceda5 btrfs: continue trimming remaining devices on failure
    daf3213e746a8 arm64: Fix non-atomic __READ_ONCE() with CONFIG_LTO=y
    d7673ac466eca PCI/IOV: Fix race between SR-IOV enable/disable and hotplug
    0de341b2365ba Revert "PCI/IOV: Add PCI rescan-remove locking when enabling/disabling SR-IOV"
    1737d37ae1d28 kexec: derive purgatory entry from symbol
    02acc9f72365e ocfs2: fix reflink preserve cleanup issue
    34a4f233df5ee rapidio: replace rio_free_net() with kfree() in rio_scan_alloc_net()
    f84d132b5b9c6 iio: gyro: itg3200: Fix unchecked return value in read_raw
    1de31dba19c3c powerpc/smp: Add check for kcalloc() failure in parse_thread_groups()
    34e30648927e8 dm mpath: make pg_init_delay_msecs settable
    c4b91021fa597 bus: fsl-mc: fix an error handling in fsl_mc_device_add()
    29749e01ae264 usb: gadget: tegra-xudc: Add handling for BLCG_COREPLL_PWRDN
    adb5d06cac66f nfsd: fix return error code for nfsd_map_name_to_[ug]id
    ebcacc7ca22d5 md/bitmap: fix GPF in write_page caused by resize race
    58686bf62cb38 PCI: endpoint: Fix swapped parameters in pci_{primary/secondary}_epc_epf_unlink() functions
    9f936b037458c xfs: fix remote xattr valuelblk check
    6a8737afbccc3 xfs: fix freemap adjustments when adding xattrs to leaf blocks
    aa9083d97e215 xfs: delete attr leaf freemap entries when empty
    e2c78c69f8faf iommu/vt-d: Flush dev-IOTLB only when PCIe device is accessible in scalable mode
    4184b7a84b1a5 xfs: mark data structures corrupt on EIO and ENODATA
    122b02e61e0c7 selftests/mm/charge_reserved_hugetlb: drop mount size for hugetlbfs
    0eac511c7657f mm, page_alloc, thp: prevent reclaim for __GFP_THISNODE THP allocations
    d39a713c7a64f drm: of: drm_of_panel_bridge_remove(): fix device_node leak
    d800e9f068e23 media: venus: vdec: fix error state assignment for zero bytesused
    712c6d27de4b9 arm64: dts: rockchip: Do not enable hdmi_sound node on Pinebook Pro
    f2f5af49335f6 dm-unstripe: fix mapping bug when there are multiple targets in a table
    d693d896a637d s390/pci: Handle futile config accesses of disabled devices directly
    6a6e623592148 clk: tegra: tegra124-emc: Fix potential memory leak in tegra124_clk_register_emc()
    10063e1251c14 KVM: nSVM: Always use vmcb01 in VMLOAD/VMSAVE emulation
    24c40076e3bc3 soc: ti: pruss: Fix double free in pruss_clk_mux_setup()
    b1006b5892ec8 soc: ti: k3-socinfo: Fix regmap leak on probe failure
    9a95b98202113 dm: clear cloned request bio pointer when last clone bio completes
    61d52b9cf122c dm-integrity: fix a typo in the code for write/discard race
    6b2f2f32e1134 media: i2c: ov5647: use our own mutex for the ctrl lock
    8e25a3055a6d4 media: i2c: ov5647: Fix PIXEL_RATE value for VGA mode
    4a9106d30862e media: i2c: ov5647: Sensor should report RAW color space
    201e84ec1bae6 media: i2c: ov5647: Correct minimum VBLANK value
    6e3962efea216 media: i2c: ov5647: Correct pixel array offset
    f2a1998bc0053 media: i2c: ov5647: Initialize subdev before controls
    b6e0529c300e4 media: ccs: Avoid possible division by zero
    9548a8bbf511a media: i2c/tw9906: Fix potential memory leak in tw9906_probe()
    32f0493506313 media: i2c/tw9903: Fix potential memory leak in tw9903_probe()
    cf6d912e2db95 media: cx25821: Add missing unmap in snd_cx25821_hw_params()
    0b7f56084cc3d media: cx23885: Add missing unmap in snd_cx23885_hw_params()
    dc911fccc6e08 media: cx88: Add missing unmap in snd_cx88_hw_params()
    242b0aabb1866 media: radio-keene: fix memory leak in error path
    2dc023dbc11b8 HID: logitech-hidpp: Check maxfield in hidpp_get_report_length()
    ee572578f09f0 HID: prodikeys: Check presence of pm->input_ep82
    165912d4321c6 HID: magicmouse: Do not crash on missing msc->input
    8a84149337eb5 HID: hid-pl: handle probe errors
    c0ca917991ba7 arm64: Disable branch profiling for all arm64 code
    155ec243ef726 KVM: nSVM: Remove a user-triggerable WARN on nested_svm_load_cr3() succeeding
    dd530e29bd514 media: mtk-mdp: Fix a reference leak bug in mtk_mdp_remove()
    0bc43eaf02134 media: mtk-mdp: Fix error handling in probe function
    d3e1f1adc8a02 dm-verity: correctly handle dm_bufio_client_create() failure
    c77e6bea8f2ed fpga: dfl: use subsys_initcall to allow built-in drivers to be added
    d66b8074c555e rpmsg: core: fix race in driver_override_show() and use core helper
    2a3aac4205e7d netfilter: nf_conntrack_h323: fix OOB read in decode_choice()
    a26dda3bae469 dpaa2-switch: validate num_ifs to prevent out-of-bounds write
    0c9de092ef8c5 net: consume xmit errors of GSO frames
    229dc9b9db475 net: usb: pegasus: enable basic endpoint checking
    12cf7783b02ff RDMA/efa: Fix typo in efa_alloc_mr()
    086131807d119 net: wan: farsync: Fix use-after-free bugs caused by unfinished tasklets
    5ed8b9b986bed RDMA/core: Fix stale RoCE GIDs during netdev events at registration
    4a42fe32ef93b tipc: fix duplicate publication key in tipc_service_insert_publ()
    fa6ad76fa8623 Bluetooth: L2CAP: Fix missing key size check for L2CAP_LE_CONN_REQ
    651b7e3ffb49d Bluetooth: L2CAP: Fix response to L2CAP_ECRED_CONN_REQ
    2fecf006d8d0e Bluetooth: hci_qca: Cleanup on all setup failures
    a5fbbfa7cf214 Bluetooth: L2CAP: Fix invalid response to L2CAP_ECRED_RECONF_REQ
    8d6d6e9c6291d wifi: cfg80211: wext: fix IGTK key ID off-by-one
    144dde3146985 net: ethernet: xscale: Check for PTP support properly
    612c622ab8efe net: ixp4xx_eth: convert to ndo_hwtstamp_get() and ndo_hwtstamp_set()
    d5496cc29c75b net: usb: lan78xx: scan all MDIO addresses on LAN7801
    dcafa5a845273 lan78xx: Fix memory allocation bug
    586318c273043 net: usb: kaweth: remove TX queue manipulation in kaweth_set_rx_mode
    6535867673bf3 xfrm6: fix uninitialized saddr in xfrm6_get_saddr()
    5590cd04d6845 ntb: ntb_hw_switchtec: Fix shift-out-of-bounds for 0 mw lut
    ee02c4f980c91 ntb: ntb_hw_switchtec: Fix array-index-out-of-bounds access
    411f150598646 btrfs: replace BUG() with error handling in __btrfs_balance()
    fa01973bb79d7 ALSA: usb-audio: Add sanity check for OOB writes at silencing
    5d82acdcc4ca5 drm/radeon: Add HAINAN clock adjustment
    355d2dcb09f3b drm/amdgpu: Add HAINAN clock adjustment
    df75696e70c88 ALSA: usb-audio: Update the number of packets properly at receiving
    c8cfe21502c2c drm/amdgpu: Adjust usleep_range in fence wait
    eeccecacf1c2e drm/amd/display: Avoid updating surface with the same surface under MPO
    d1512fa46da93 ARM: 9467/1: mm: Don't use %pK through printk
    64839adc926aa include: uapi: netfilter_bridge.h: Cover for musl libc
    6405e8c680974 libceph: define and enforce CEPH_MAX_KEY_LEN
    0ebe3f318b38e fs/ntfs3: avoid calling run_get_entry() when run == NULL in ntfs_read_run_nb_ra()
    9267d99fade76 fs: ntfs3: fix infinite loop triggered by zero-sized ATTR_LIST
    6f07a590616ff fs: ntfs3: fix infinite loop in attr_load_runs_range on inconsistent metadata
    14c3188afbedf fs: ntfs3: check return value of indx_find to avoid infinite loop
    913ff123f5a88 MIPS: Loongson: Make cpumask_of_node() robust against NUMA_NO_NODE
    b9615db10a908 iio: magnetometer: Remove IRQF_ONESHOT
    e3bf1aaefb895 iio: Use IRQF_NO_THREAD
    815a658c6e68f Revert "mfd: da9052-spi: Change read-mask to write-mask"
    8b8bd7b106006 phy: fsl-imx8mq-usb: disable bind/unbind platform driver feature
    0ca97f644065e phy: mvebu-cp110-utmi: fix dr_mode property read from dts
    a259e4eba823c binder: don't use %pK through printk
    da1bf012278d8 fix it87_wdt early reboot by reporting running timer
    5ebe8b14f6c8b serial: 8250: 8250_omap.c: Clear DMA RX running status only after DMA termination is done
    9874e33ce52ba staging: rtl8723bs: fix memory leak on failure path
    0d97c9627874d misc: eeprom: Fix EWEN/EWDS/ERAL commands for 93xx56 and 93xx66
    9491c8cd27968 serial: 8250_dw: handle clock enable errors in runtime_resume
    c66eaf4f5d41b staging: rtl8723bs: fix missing status update on sdio_alloc_irq() failure
    89127ac9323c5 m68k: nommu: fix memmove() with differently aligned src and dest for 68000
    8b7cde23930cb clk: microchip: core: correct return value on *_get_parent()
    4ada2e68bea07 mailbox: sprd: clear delivery flag before handling TX done
    deef8c80a8a40 remoteproc: mediatek: Break lock dependency to `prepare_lock`
    50b16914084d7 mailbox: sprd: mask interrupts that are not handled
    e8bf3e43490a6 tracing: Fix false sharing in hwlat get_sample()
    c6226bf2a6c5e scsi: buslogic: Reduce stack usage
    d2fa0904db413 RDMA/rtrs-clt: For conn rejection use actual err number
    11b2b31acfe8b nfc: nxp-nci: remove interrupt trigger type
    d52081a3770a8 myri10ge: avoid uninitialized variable use
    973703d49c08c PCI: Mark Nvidia GB10 to avoid bus reset
    07595f1856a53 PCI: Add ACS quirk for Qualcomm Hamoa & Glymur
    b20b659c2c6a0 PCI: Enable ACS after configuring IOMMU for OF platforms
    3a53ae59563b9 PCI: Fix pci_slot_lock () device locking
    d968801ffe983 PCI/AER: Clear stale errors on reporting agents upon probe
    fd0b2566558f3 PCI: Mark ASM1164 SATA controller to avoid bus reset
    60b347333ec25 net/rds: Clear reconnect pending bit
    67f5c6541c11e vmw_vsock: bypass false-positive Wnonnull warning with gcc-16
    632b07ff841d9 net: usb: sr9700: remove code to drive nonexistent multicast filter
    11e13b1c12f4a wifi: ath10k: fix lock protection in ath10k_wmi_event_peer_sta_ps_state_chg()
    d0b3c8a803360 octeontx2-af: Workaround SQM/PSE stalls by disabling sticky
    96a3c1d0a8d74 Bluetooth: btusb: Add device ID for Realtek RTL8761BU
    18935dc3d200f Bluetooth: hci_conn: use mod_delayed_work for active mode timeout
    0d8556922d768 ipv4: fib: Annotate access to struct fib_alias.fa_state.
    b1791afa5f313 wifi: iwlegacy: add missing mutex protection in il3945_store_measurement()
    0cdd30bf921f7 wifi: iwlegacy: add missing mutex protection in il4965_store_tx_power()
    078e427a1eda0 net: hns3: extend HCLGE_FD_AD_QID to 11 bits
    a179ac7be8f5a net/rds: No shortcut out of RDS_CONN_ERROR
    c786d295ad9b3 net: usb: r8152: fix transmit queue timeout
    ecab081e7caa2 openrisc: define arch-specific version of nop()
    cd5beda7e0e32 netfilter: xt_tcpmss: check remaining length before reading optlen
    1c1a3de9bd04c netfilter: nf_conntrack: Add allow_clash to generic protocol handler
    be3db37231a13 ext4: mark group extend fast-commit ineligible
    cee81dad0349e ext4: mark group add fast-commit ineligible
    bcaf8880bfe69 ipv6: exthdrs: annotate data-race over multiple sysctl
    bb9a9cd41edd4 ipv6: annotate data-races in ip6_multipath_hash_{policy,fields}()
    2902a9b4415a6 wifi: libertas: fix WARNING in usb_tx_block
    88813b736cdca iommu/arm-smmu-v3: Improve CMDQ lock fairness and efficiency
    8200fca818c1e dm: remove fake timeout to avoid leak request
    b4330a0d0947f jfs: nlink overflow in jfs_rename
    fd8f88f0f366f jfs: Add missing set_freezable() for freezable kthread
    0efed790b74a3 ALSA: usb-audio: Add iface reset and delay quirk for AB13X USB Audio
    4acee08d29154 modpost: Amend ppc64 save/restfpr symnames for -Os build
    a6a129bcb6706 ASoC: es8328: Add error unwind in resume
    2b0babc48eda6 spi: spi-mem: Protect dirmap_create() with spi_mem_access_start/end
    8637b3d25f315 gpio: aspeed-sgpio: Change the macro to support deferred probe
    d2c93fa8971d4 HID: elecom: Add support for ELECOM HUGE Plus M-HT1MRBK
    0e266b265fd71 HID: multitouch: add eGalaxTouch EXC3188 support
    6404898af86d9 drm/atmel-hlcdc: fix use-after-free of drm_crtc_commit after release
    fe3f92e0b8df3 drm/atmel-hlcdc: don't reject the commit if the src rect has fractional parts
    5718d98976ad6 drm/atmel-hlcdc: fix memory leak from the atomic_destroy_state callback
    c47233bb43d78 virt: vbox: uapi: Mark inner unions in packed structs as packed
    f999fbac0cc39 hyper-v: Mark inner union in hv_kvp_exchg_msg_value as packed
    815fa29cab3c6 drm: Account property blob allocations to memcg
    f533cb04aed9e drm/amdkfd: Fix GART PTE for non-4K pagesize in svm_migrate_gart_map()
    071bfc6e723aa media: cx25821: Fix a resource leak in cx25821_dev_setup()
    0b3dadada2417 media: solo6x10: Check for out of bounds chip_id
    cf459d6ffa5e1 media: pvrusb2: fix URB leak in pvr2_send_request_ex
    4ccafb4042015 media: adv7180: fix frame interval in progressive mode
    60bf014363e85 ASoC: wm8962: Don't report a microphone if it's shorted to ground on plug
    90b4c3446c1cf ASoC: wm8962: Add WM8962_ADC_MONOMIX to "3D Coefficients" mask
    00147f7f6ddc5 media: omap3isp: set initial format
    0e9b3062bf6e3 media: omap3isp: isppreview: always clamp in preview_try_format()
    ff22d904f3477 media: omap3isp: isp_video_mbus_to_pix/pix_to_mbus fixes
    14d0d6c8b4504 drm/v3d: Set DMA segment size to avoid debug warnings
    c44bf3267743e spi: stm32: fix Overrun issue at < 8bpw
    f4427850c17b8 media: dvb-core: dmxdevfilter must always flush bufs
    962931f8cae88 parisc: Prevent interrupts during reboot
    8309ea8693f29 arm64: tegra: smaug: Add usb-role-switch support
    49918dd526150 pstore: ram_core: fix incorrect success return when vmap() fails
    816da986068ed char: tpm: cr50: Remove IRQF_ONESHOT
    66ea5edfd6816 mailbox: bcm-ferxrm-mailbox: Use default primary handler
    9ef26501cad0a clocksource/drivers/timer-integrator-ap: Add missing Kconfig dependency on OF
    f0b31247e7d67 clocksource/drivers/sh_tmu: Always leave device running after probe
    958c876b179a6 bpf: verifier improvement in 32bit shift sign extension pattern
    4c47d3e8e5843 sparc: don't reference obsolete termio struct for TC* constants
    4e0aedace0157 sparc: Synchronize user stack on fork and clone
    872e474f78a11 blk-mq-debugfs: add missing debugfs_mutex in blk_mq_debugfs_register_hctxs()
    ef89108f6d44e xenbus: Use .freeze/.thaw to handle xenbus devices
    14e7e899aeaf4 s390/perf: Disable register readout on sampling events
    21a08dab14137 ACPICA: Abort AML bytecode execution when executing AML_FATAL_OP
    06724a60cfa97 ACPI: processor: Fix NULL-pointer dereference in acpi_processor_errata_piix4()
    ca2aad8771aa9 EFI/CPER: don't go past the ARM processor CPER record buffer
    616c120dcdf1c APEI/GHES: ensure that won't go past CPER allocated record
    0e09b522f2622 EFI/CPER: don't dump the entire memory region
    38d0ad4ac7c1c x86/xen/pvh: Enable PAE mode for 32-bit guest only when CONFIG_X86_PAE is set
    e2cacec7d4291 rnbd-srv: Zero the rsp buffer before using it
    a8d0ad5d990b0 arm64: Add support for TSV110 Spectre-BHB mitigation
    bd32e1f1e6706 s390/purgatory: Add -Wno-default-const-init-unsafe to KBUILD_CFLAGS
    b4bb16202d32f tools/power cpupower: Reset errno before strtoull()
    5d5d9ec957bfa gfs2: fiemap page fault fix
    d791c544efd6b minix: Add required sanity checking to minix_check_superblock()
    cde3d9035e8af i3c: master: svc: Initialize 'dev' to NULL in svc_i3c_master_ibi_isr()
    799c492a619a1 hfsplus: pretend special inodes as regular files
    ada4bba3afefe audit: add missing syscalls to read class
    dbe8ca149fb17 hfsplus: fix volume corruption issue for generic/498
    3ee75b13ea5f0 audit: add fchmodat2() to change attributes class
    e9c072f2f63a0 rtc: interface: Alarm race handling should not discard preceding error
    0d23763532b02 libperf build: Always place libperf includes first
    bd044ae163c02 libperf: Don't remove -g when EXTRA_CFLAGS are used
    175151da5d745 perf callchain: Fix srcline printing with inlines
    b559be2ec6cdb SUNRPC: fix gss_auth kref leak in gss_alloc_msg error path
    caf7eff432e91 SUNRPC: auth_gss: fix memory leaks in XDR decoding error paths
    d486ba75fa171 ata: pata_ftide010: Fix some DMA timings
    a5a992b1b82eb ext4: use optimized mballoc scanning regardless of inode format
    afc5e61e1a07b ext4: fix memory leak in ext4_ext_shift_extents()
    692103feca376 ext4: don't cache extent during splitting extent
    1fe3b402b1e97 MIPS: Work around LLVM bug when gp is used as global register variable
    fd4913a53e3b5 btrfs: fix invalid leaf access in btrfs_quota_enable() if ref key not found
    0f8f2991a0195 drm/i915/acpi: free _DSM package when no connectors
    ae5a70e3e87c2 ASoC: fsl_xcvr: Revert fix missing lock in fsl_xcvr_mode_put()
    6d8c180c825cb apparmor: fix invalid deref of rawdata when export_binary is unset
    2232d7cd24383 apparmor: fix rlimit for posix cpu timers
    5121b7283f1c4 apparmor: fix NULL sock in aa_sock_file_perm
    de7c097800f07 bonding: alb: fix UAF in rlb_arp_recv during bond up/down
    59113a42f8737 octeontx2-af: Fix default entries mcam entry action
    3d94323c80d7f macvlan: observe an RCU grace period in macvlan_common_newlink() error path
    a49d6df1484d3 bpftool: Fix truncated netlink dumps
    79a813acfeb15 ipv6: fix a race in ip6_sock_set_v6only()
    548244c2f542a net: remove WARN_ON_ONCE when accessing forward path array
    0678c554dfa34 netfilter: nf_conntrack_h323: don't pass uninitialised l3num value
    f53bef1d9f056 selftests: forwarding: vxlan_bridge_1d: fix test failure with br_netfilter enabled
    da4bda3b6d71d net/rds: rds_sendmsg should not discard payload_len
    787bfa423228c xen-netback: reject zero-queue configuration from guest
    4eb11467a32fb selftests: mlxsw: tc_restrictions: Fix test failure with new iproute2
    5d103a38e2ae9 cpuidle: Skip governor when only one idle state is available
    583ef69fcb3ee ACPI: CPPC: Fix remaining for_each_possible_cpu() to use online CPUs
    36c03f7f177b3 fs/ntfs3: Fix slab-out-of-bounds read in DeleteIndexEntryRoot
    50c822fcb3676 fs/ntfs3: prevent infinite loops caused by the next valid being the same
    c8a10a3dbb7e4 backlight: qcom-wled: Support ovp values for PMI8994
    3e3b28bb0b6dd pinctrl: single: fix refcount leak in pcs_add_gpio_func()
    1658bb88b4431 pinctrl: qcom: sm8250-lpass-lpi: Fix i2s2_data_groups definition
    5241a682422f1 pinctrl: qcom: Extract chip specific LPASS LPI code
    c921ab17b63b2 pinctrl: qcom: Update lpi pin group custiom functions with framework generic functions
    fe9ed4e8b7584 pinctrl: qcom: Update macro name to LPI specific
    40c860ece2254 iio: sca3000: Fix a resource leak in sca3000_probe()
    17cdaf3280933 ovl: Fix uninit-value in ovl_fill_real
    91f06b2fc5f9f pinctrl: equilibrium: Fix device node reference leak in pinbank_init()
    fcfb0564ec2e9 usb: bdc: fix sleep during atomic
    4afcfb9d160b7 drivers: iio: mpu3050: use dev_err_probe for regulator request
    933c546387358 mfd: arizona: Fix regulator resource leak on wm5102_clear_write_sequencer() failure
    60d3faa424626 Revert "mmc: rtsx_pci_sdmmc: increase power-on settling delay to 5ms"
    0486dc6421b18 coresight: etm3x: Fix cpulocked warning on cpuhp
    75e166be21f2f mmc: rtsx_pci_sdmmc: increase power-on settling delay to 5ms
    ef471e75c0d16 serial: SH_SCI: improve "DMA support" prompt
    14b15aebfef65 serial: imx: change SERIAL_IMX_CONSOLE to bool
    3cbe694d235d9 staging: greybus: lights: avoid NULL deref
    bef0c99d476f7 dma: dma-axi-dmac: fix SW cyclic transfers
    6c3e9a6d22510 dmaengine: mediatek: uart-apdma: Fix above 4G addressing TX/RX
    dd0a0aa7597df clk: qcom: dispcc-sdm845: Enable parents for pixel clocks
    a366ef298a2f2 clk: Move clk_{save,restore}_context() to COMMON_CLK section
    b22dc9578c16c clk: qcom: gcc-msm8953: Remove ALWAYS_ON flag from cpp_gdsc
    4d5d6d016dd62 clk: meson: gxbb: Limit the HDMI PLL OD to /4 on GXL/GXM SoCs
    90216ee709a49 clk: qcom: rcg2: compute 2d using duty fraction directly
    071d8fb757a83 fbdev: au1200fb: Fix a memory leak in au1200fb_drv_probe()
    6179b9eedf5fc tracing: Remove duplicate ENABLE_EVENT_STR and DISABLE_EVENT_STR macros
    1cf885c987735 nvdimm: virtio_pmem: serialize flush requests
    44ef9f81392de scsi: csiostor: Fix dereference of null pointer rn
    7822168503ad7 pNFS: fix a missing wake up while waiting on NFS_LAYOUT_DRAIN
    2001e6eabf12e RDMA/uverbs: Add __GFP_NOWARN to ib_uverbs_unmarshall_recv() kmalloc
    42d0cf51d0029 mtd: parsers: ofpart: fix OF node refcount leak in parse_fixed_partitions()
    60045b2aeb293 RDMA/core: add rdma_rw_max_sge() helper for SQ sizing
    85f795b98f471 svcrdma: Reduce the number of rdma_rw contexts per-QP
    d06b86a75bad9 svcrdma: Increase the per-transport rw_ctx count
    f7d66bd1b4fd6 svcrdma: Clean up comment in svc_rdma_accept()
    2ba91041e8ab9 svcrdma: Remove queue-shortening warnings
    95540efb50dec RDMA/core: Fix a couple of obvious typos in comments
    9b5ac1c15334d RDMA/uverbs: Validate wqe_size before using it in ib_uverbs_post_send
    e0f0d708cd904 crypto: ccp - Add an S4 restore flow
    c9354400f0471 mtd: rawnand: cadence: Fix return type of CDMA send-and-wait helper
    af59562430189 RDMA/rxe: Fix double free in rxe_srq_from_init
    d4040ce115e3f RDMA/rtrs-srv: fix SG mapping
    b32b573ec2b29 RDMA/rtrs-srv: Correct the checking of ib_map_mr_sg
    88cd680b79ca1 RDMA/rtrs-srv: Refactor the handling of failure case in map_cont_bufs
    438f9a303ea8b power: supply: wm97xx: Fix NULL pointer dereference in power_supply_changed()
    eee4ac431c24c power: supply: bq27xxx: fix wrong errno when bus ops are unsupported
    25a1578735f5f power: reset: nvmem-reboot-mode: respect cell size for nvmem_cell_write
    f1f472b14ad56 power: supply: sbs-battery: Fix use-after-free in power_supply_changed()
    62d753b916bd5 power: supply: rt9455: Fix use-after-free in power_supply_changed()
    bad8b61eb5059 power: supply: goldfish: Fix use-after-free in power_supply_changed()
    3ff75cba1c983 power: supply: cpcap-battery: Fix use-after-free in power_supply_changed()
    16875e3b7bc9e power: supply: bq25980: Fix use-after-free in power_supply_changed()
    81d3688c9a215 power: supply: bq256xx: Fix use-after-free in power_supply_changed()
    0768e8525a46d power: supply: act8945a: Fix use-after-free in power_supply_changed()
    43cbb78ee047b power: supply: ab8500: Fix use-after-free in power_supply_changed()
    cc6bffd06b62e power: supply: ab8500: Use core battery parser
    2f630fa732799 power: supply: ab8500_bmdata: Use standard phandle
    7075e59b2be74 RDMA/hns: Notify ULP of remaining soft-WCs during reset
    150997f317153 IB/cache: update gid cache on client reregister event
    2decfb035e6cd RDMA/rtrs: server: remove dead code
    ffa36214a9a8e octeontx2-pf: Unregister devlink on probe failure
    80b3f9b8b10ca ionic: Rate limit unknown xcvr type messages
    d3c75db4e0460 serial: caif: fix use-after-free in caif_serial ldisc_close()
    1c8bda3df028d net: atm: fix crash due to unvalidated vcc pointer in sigd_send()
    c93a33f28f915 procfs: fix missing RCU protection when reading real_parent in do_task_stat()
    fb6a4c376d454 net: hns3: fix double free issue for tx spare buffer
    9df1a64779815 net: hns3: add max order judgement for tx spare buffer
    0bc36ea284172 net: hns3: fix ethtool tx copybreak buf size indicating not aligned issue
    0563c62ae30af net: hns3: remove the way to set tx spare buf via module parameter
    4e9fe23a75908 net: hns3: add support to set/get tx copybreak buf size via ethtool for hns3 driver
    54d70ece4958e ethtool: add support to set/get tx copybreak buf size via ethtool
    029e5f6a95e90 netfilter: nft_set_rbtree: check for partial overlaps in anonymous sets
    b668af67323f0 netfilter: nft_set_hash: fix get operation on big endian
    c60f41022eaad nfc: hci: shdlc: Stop timers and work before freeing context
    c87c07c6b91ce timers: Replace in_irq() with in_hardirq()
    8e6a099245966 bonding: only set speed/duplex to unknown, if getting speed failed
    9769a09afda20 octeontx2-af: Fix PF driver crash with kexec kernel booting
    e430a0e3dccb5 ucount: check for CAP_SYS_RESOURCE using ns_capable_noaudit()
    ccdd1b3536f24 PCI: Initialize RCB from pci_configure_device()
    df6d7d4a6ff3b wifi: ath10k: sdio: add missing lock protection in ath10k_sdio_fw_crashed_dump()
    9a04fd9f629ca tcp: tcp_tx_timestamp() must look at the rtx queue
    9894c79fd9466 fat: avoid parent link count underflow in rmdir
    3a72c7dedc99b nfsd: never defer requests during idmap lookup
    0616137b70e6d iommu/vt-d: Flush cache for PASID table before using it
    43a3e9beb95e5 PCI: Mark 3ware-9650SA Root Port Extended Tags as broken
    fea21fca0b350 netfilter: nf_conncount: fix tracking of connections from localhost
    13eede458fdf2 netfilter: nf_conncount: increase the connection clean up limit to 64
    df4af6ccf288d netfilter: nf_conncount: make nf_conncount_gc_list() to disable BH
    31344ffecd7a3 wifi: cfg80211: stop NAN and P2P in cfg80211_leave
    8ec2bcbb5e6ec PCI/portdrv: Fix potential resource leak
    fd1fb14cd3227 PCI: Do not attempt to set ExtTag for VFs
    a790f17a20b9a PCI: mediatek: Fix IRQ domain leak when MSI allocation fails
    fe9a1f23b8030 spi: tools: Add include folder to .gitignore
    07ed04e5d5f75 platform/chrome: cros_ec_lightbar: Fix response size initialization
    995069aeb2e0e media: uvcvideo: Fix allocation for small frame sizes
    6b56ea9b64512 media: ccs: Accommodate C-PHY into the calculation
    496a345cc047a HID: playstation: Add missing check for input_ff_create_memless
    d074d158efbfa regulator: core: move supply check earlier in set_machine_constraints()
    cf89170d92438 drm/amdgpu: Use explicit VCN instance 0 in SR-IOV init
    6ec091c5c7eea smack: /smack/doi: accept previously used values
    8fc7f2295f017 smack: /smack/doi must be > 0
    50e6b6a30f55a arm64: dts: qcom: sdm845-db845c: specify power for WiFi CH1
    74929004464d4 arm64: dts: amlogic: g12: assign the MMC A signal clock
    c9f861c743461 arm64: dts: amlogic: g12: assign the MMC B and C signal clocks
    62486d10559cd arm64: dts: amlogic: gx: assign the MMC signal clocks
    5ef0544654103 arm64: dts: amlogic: axg: assign the MMC signal clocks
    8fba97ee026b0 arm: dts: lpc32xx: add clocks property to Motor Control PWM device tree node
    46c7fb8a0c4d9 ARM: dts: lpc32xx: Set motor PWM #pwm-cells property value to 3 cells
    788dd28fd4961 powerpc/eeh: fix recursive pci_lock_rescan_remove locking in EEH event handling
    a5b4b9a8df2a4 soc: qcom: cmd-db: Use devm_memremap() to fix memory leak in cmd_db_dev_probe
    0c5eae9811561 powerpc/uaccess: Move barrier_nospec() out of allow_read_{from/write}_user()
    ad40f789fc2ad ARM: dts: allwinner: sun5i-a13-utoo-p66: delete "power-gpios" property
    018e8512fed90 arm64: dts: qcom: sdm845-oneplus: Mark l14a regulator as boot-on
    b81f20a276150 arm64: dts: qcom: sdm845-oneplus: Don't mark ts supply boot-on
    cff64dca56cbe arm64: dts: qcom: sdm630: fix gpu_speed_bin size
    8f299cc87ce41 arm64: dts: qcom: sdm630: correct QFPROM byte offsets
    3f9b3dba91d54 clk: qcom: Return correct error code in qcom_cc_probe_by_index()
    9c016b22f8c67 EDAC/i5400: Fix snprintf() limit calculation in calculate_dimm_size()
    937dd8cc6e355 EDAC/i5000: Fix snprintf() size calculation in calculate_dimm_size()
    06d2c8bd108ce pstore/ram: fix buffer overflow in persistent_ram_save_old()
    3b3c672a66db3 sched/rt: Skip currently executing CPU in rto_next_cpu()
    bf1a717b84bc0 mfd: wm8350-core: Use IRQF_ONESHOT
    92879e7ad294b EDAC/altera: Remove IRQF_ONESHOT
    80af21d859e68 scsi: efct: Use IRQF_ONESHOT and default primary handler
    f2c2c17088fd7 crypto: hisilicon/trng - support tfms sharing the device
    06c93dd991087 crypto: hisilicon/trng - modifying the order of header files
    21c9cd3e4fa12 hrtimer: Fix trace oddity
    80a4c92ec2799 crypto: octeontx - fix dma_free_coherent() size
    47e1a2c8b73e9 crypto: cavium - fix dma_free_coherent() size
    eefabf6c9c970 ARM: VDSO: Patch out __vdso_clock_getres() if unavailable
    7a8761f28fdb3 libbpf: Fix OOB read in btf_dump_get_bitfield_value
    13c310c18c28b libbpf: Fix dumping big-endian bitfields
    b1d4e6fb24167 s390/cio: Fix device lifecycle handling in css_alloc_subchannel()
    e84e1451a0e6a PM: sleep: wakeirq: harden dev_pm_clear_wake_irq() against races
    d183c62c4aa39 PM: wakeup: Handle empty list in wakeup_sources_walk_start()
    bdb96adf6f5ed iomap: fix submission side handling of completion side errors
    c640eea74e9b1 md/raid10: fix any_working flag handling in raid10_sync_request
    c8fa9ab604282 btrfs: qgroup: return correct error when deleting qgroup relation item
    7687133509cf6 tpm: st33zp24: Fix missing cleanup on get_burstcount() error
    c24c9c4cab118 tpm: tpm_i2c_infineon: Fix locality leak on get_burstcount() failure
    1cae1bafdf9ca gfs2: Fix use-after-free in iomap inline data write path
    602fb357b195d gfs2: Add metapath_dibh helper
    ef900c2b09004 fs: add <linux/init_task.h> for 'init_fs'
    6cae2af141da6 i3c: Move device name assignment after i3c_bus_init
    acbd89719cb19 i3c: remove i2c board info from i2c_dev_desc
    507a1de58c21c hfsplus: return error when node already exists in hfs_bnode_create
    7ee8e09670279 auxdisplay: arm-charlcd: fix release_mem_region() size
    362e45fd9069f RDMA/umad: Reject negative data_len in ib_umad_write
    8564dcc12fbb3 RDMA/siw: Fix potential NULL pointer dereference in header processing

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 7c8369cc87..d983c10a60 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "46e4e1200a4fa889438a2cc62151bb7f1057421a"
-SRCREV_meta ?= "b75d71b7f2455467f2260d514040ccb44d4bdda5"
+SRCREV_machine ?= "14a6819d66b6c6d40301328e21ab898de63a6732"
+SRCREV_meta ?= "5e3ac50d9735b128bb7163cc951c8f62a3030d85"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;protocol=https;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;protocol=https;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.201"
+LINUX_VERSION ?= "5.15.203"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 358e3bbed3..634622f423 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.201"
+LINUX_VERSION ?= "5.15.203"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "5ae014d6b48449ae38584cc174ef362f6582a8fc"
-SRCREV_meta ?= "b75d71b7f2455467f2260d514040ccb44d4bdda5"
+SRCREV_machine ?= "6bba464ccbe6f5486d4d8d800e373aa0c35e517e"
+SRCREV_meta ?= "5e3ac50d9735b128bb7163cc951c8f62a3030d85"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 0a770c81b7..c0bf123ea4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "9750e854c9e92d55a2cb042c5ce72e712b24217d"
-SRCREV_machine:qemuarm64 ?= "8634ca1dd87be9b55bd383dc8636b73b82a28051"
-SRCREV_machine:qemumips ?= "54eca1788efd507120c9dc08681a6a31038513a1"
-SRCREV_machine:qemuppc ?= "3a3a4ecdcebb4d3deaa8b5c4ec3e167d5f31305c"
-SRCREV_machine:qemuriscv64 ?= "b5ccd2e275c9b68e5dc564b6febeaae8dda42bc5"
-SRCREV_machine:qemuriscv32 ?= "b5ccd2e275c9b68e5dc564b6febeaae8dda42bc5"
-SRCREV_machine:qemux86 ?= "b5ccd2e275c9b68e5dc564b6febeaae8dda42bc5"
-SRCREV_machine:qemux86-64 ?= "b5ccd2e275c9b68e5dc564b6febeaae8dda42bc5"
-SRCREV_machine:qemumips64 ?= "e643e82fef4b4352b8f6ddf802181526edc806ca"
-SRCREV_machine ?= "b5ccd2e275c9b68e5dc564b6febeaae8dda42bc5"
-SRCREV_meta ?= "b75d71b7f2455467f2260d514040ccb44d4bdda5"
+SRCREV_machine:qemuarm ?= "afa892eb1f8b242e3340ee7dd585e5d1950f4ef1"
+SRCREV_machine:qemuarm64 ?= "39d187cca7a3f358737bc63af24d7e51bfc0408b"
+SRCREV_machine:qemumips ?= "0b1d5c51dc748141e74a0e5db3a8862da4336371"
+SRCREV_machine:qemuppc ?= "a58dbe7cb2bfad56ff25c958331ac77542a83452"
+SRCREV_machine:qemuriscv64 ?= "65333c3a0bcd6bc04cdc60d4e237913a38cf2eec"
+SRCREV_machine:qemuriscv32 ?= "65333c3a0bcd6bc04cdc60d4e237913a38cf2eec"
+SRCREV_machine:qemux86 ?= "65333c3a0bcd6bc04cdc60d4e237913a38cf2eec"
+SRCREV_machine:qemux86-64 ?= "65333c3a0bcd6bc04cdc60d4e237913a38cf2eec"
+SRCREV_machine:qemumips64 ?= "08b8a235309d1ebd016c49492af5959ec5d4041c"
+SRCREV_machine ?= "65333c3a0bcd6bc04cdc60d4e237913a38cf2eec"
+SRCREV_meta ?= "5e3ac50d9735b128bb7163cc951c8f62a3030d85"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "3330a8d33e086f76608bb4e80a3dc569d04a8814"
+SRCREV_machine:class-devupstream ?= "b9d57c40a767db4d2ef905abb91f73cbe0a791e1"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;protocol=https;name=machin
            git://git.yoctoproject.org/yocto-kernel-cache;protocol=https;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.201"
+LINUX_VERSION ?= "5.15.203"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.43.0


