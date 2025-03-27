Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7823AC3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 14:44:00 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.51667.1743086630653371427
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 07:43:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=W5Lu8XGS;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2243803b776so35058885ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 07:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1743086630; x=1743691430; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sija05+SE1M2O92FbFt+2njwSnWL1CbaNVXCBj50RDk=;
        b=W5Lu8XGSub5dYoHL20GtabEjttYQ+iNnDv3Um9NE4QnwW4wYI/BzX9Sq4kFzahLkqg
         T63vQyg4/rN4pvD55Hx6ZR2EwugSVYytveMn+YgtthhsM4UBY9P9ATG+5FVh9KwQQAzo
         RtVXBQKpknvBqNoVxu+DQ47UhaAQMiNFWViQbnZGwNSoGpnLk4gtr+abt/8Ce0W6BBri
         tHYyQCjey8f1MQmUZXms1mKw3FTldC3h6I/6griSHlaDCHejGKH3Ku+JPDoGR4MtVI04
         c2yYJCIjCu1xfKxofBzPvFSb38mmES2XmNFFWPQqxdHAMp0+aQCyTeggDspU8PrgqcdJ
         +auQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743086630; x=1743691430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sija05+SE1M2O92FbFt+2njwSnWL1CbaNVXCBj50RDk=;
        b=S0t3oKR54L+ZesqdHiVl9eDVRr7TF2HToXsFXCnPwPOR/Z9eW29RHHaroSPvVXslPo
         zcYbEzBRKhYfZx3RA9EVkX/1PAo8QCaG1SOHyeR86uKtVDVX7nd+T2mTv1YgpEZ90ano
         C5qqd/mvsPmoH+eyTEPSeXz/ymCJgTlpjyXQdBIDtVCA8xWbXwbb+5KZ2KmWqqJA8vXh
         65PlgWLJIrkvoeHaEDJGJcwTPTQVd2XLQ5mAhYo6h5cd3KZt7qPT2aZhtQn7zySTs6Xq
         hGTdMmS3zJkplX5BD/S8cfCEEvQWKRiGF6/sRWUiPwHr/5KrDTw/bCoDGkfx7n17WhSp
         PpiQ==
X-Gm-Message-State: AOJu0Yyhwf01v0t7Tq8TashiDKcUnTo06shTTygaTA92xmQ9gH/c/TnJ
	zUkKbERDi4WDkB2iMRT54KDIB+HX8pV5GX1tTbPDXrehbcD1u9Z5yFjYV03KGDyv1Sl54/s7bEX
	G
X-Gm-Gg: ASbGncvFYpFxJbAWJG8ohPNx9SNQZ7CrCysSW8Q7F5g84fAlNBLvKKZaAnlCrceKMjp
	ZigAWh9zd6acvsVmTyioCYzgYSILQkSAQLpJziUexyGYJyS1rKJ71TlJUfhXZYrV+2wTrIMxE5R
	SPVcy4W+zPDV50olwGFYrQMKPIozvUXc3MLyYubE94AufyWR+btRzM0HmNPeHDaOzFNoGrxPeX3
	4oe0xyMAXW8FGaJzdp9+6wrYAwjn12FxYACWpiej2Imy9/xnFgJaj5ArPj5XSu3JpdBKo3AxqGn
	a6irRCE9cDgrfjCq8X6ARROIwKaxJiFgZ7o=
X-Google-Smtp-Source: AGHT+IHGoXeGtUnPulrAFWucOCj12NmcwdRt4TCJbKyp0T0XlyyEHiurr2/cruHbLbPlxVPynp4rAg==
X-Received: by 2002:a17:902:f684:b0:224:584:6f04 with SMTP id d9443c01a7336-228048b1ecfmr38324095ad.18.1743086628306;
        Thu, 27 Mar 2025 07:43:48 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:811c:968e:2c1:6363])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390618e5absm14819074b3a.175.2025.03.27.07.43.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 07:43:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/4] linux-yocto/5.10: update to v5.10.234
Date: Thu, 27 Mar 2025 07:43:30 -0700
Message-ID: <f95f69b878c9d4e50e1728b300dd00329850f5f8.1743086467.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743086467.git.steve@sakoman.com>
References: <cover.1743086467.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 14:44:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213757

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    0ef80b084295 Revert "x86/mm: Randomize per-cpu entry area"
    bcd2efd15975 mt76: mt7915: fix txrate reporting
    e1e411e59308 x86/mm: Randomize per-cpu entry area
    ba824e697315 mm: fix mmap kernel hang
    f0a53361993a Linux 5.10.234
    c762b76981fc Partial revert of xhci: use pm_ptr() instead #ifdef for CONFIG_PM conditionals
    664760c49d98 xhci: use pm_ptr() instead of #ifdef for CONFIG_PM conditionals
    1f66a3a1a516 drm/v3d: Assign job pointer to NULL before signaling the fence
    d2b550208155 Input: xpad - add support for wooting two he (arm)
    098b8808e2e6 Input: xpad - add unofficial Xbox 360 wireless receiver clone
    5e9fed31adc8 Input: atkbd - map F23 key to support default copilot shortcut
    99c866bea85e Revert "usb: gadget: u_serial: Disable ep before setting port to null to fix the crash caused by port being null"
    94770cf7c512 USB: serial: quatech2: fix null-ptr-deref in qt2_process_read_urb()
    354aef2ec80a wifi: iwlwifi: add a few rate index validity checks
    31bd7378c6fe ipv4: ip_tunnel: Fix suspicious RCU usage warning in ip_tunnel_find()
    d072ea247481 Bluetooth: RFCOMM: Fix not validating setsockopt user input
    d19a8650fd3d vfio/platform: check the bounds of read/write syscalls
    553df82a8c73 signal/m68k: Use force_sigsegv(SIGSEGV) in fpsp040_die
    f70103a4355c m68k: Update ->thread.esp0 before calling syscall_trace() in ret_from_signal
    03c56665dab1 net: sched: fix ets qdisc OOB Indexing
    8c41abc11aa8 gfs2: Truncate address space when flipping GFS2_DIF_JDATA flag
    09f698656628 ASoC: samsung: Add missing depends on I2C
    20019b1f0040 irqchip/sunxi-nmi: Add missing SKIP_WAKE flag
    3ff6ce057622 scsi: iscsi: Fix redundant response for ISCSI_UEVENT_GET_HOST_STATS request
    d5bd48f16d4a seccomp: Stub for !CONFIG_SECCOMP
    c269af144a79 ASoC: samsung: Add missing selects for MFD_WM8994
    771f8a8a6995 ASoC: wm8994: Add depends on MFD core
    fe2c0bd6d1e2 net: fix data-races around sk->sk_forward_alloc
    285ce1f89f8d scsi: sg: Fix slab-use-after-free read in sg_release()
    7ffaf1a16f65 x86/xen: fix SLS mitigation in xen_hypercall_iret()
    daeac89cdb03 vsock: prevent null-ptr-deref in vsock_*[has_data|has_space]
    18a7fc371d1d vsock/virtio: discard packets if the transport changes
    a925a200299a fou: remove warn in gue_gro_receive on unsupported protocol
    f9f76ff74dae nfsd: add list_head nf_gc to struct nfsd_file
    8a8b83016f06 ipv6: avoid possible NULL deref in rt6_uncached_list_flush_dev()
    83f5a87ee8ca blk-cgroup: Fix UAF in blkcg_unpin_online()
    605889754ee6 RDMA/hns: Fix deadlock on SRQ async events.
    461091c27f55 vmalloc: fix accounting with i915
    e8d3c53c6f1c drm/radeon: check bo_va->bo is non-NULL before using it
    85a9c98a5e0f iio: adc: rockchip_saradc: fix information leak in triggered buffer
    031538ff9c32 iio: imu: inv_icm42600: fix timestamps after suspend if sensor is on
    641b4041cb4e iio: imu: inv_icm42600: fix spi burst write not supported
    da55e7622580 Revert "PCI: Use preserve_config in place of pci_flags"
    14984139f1f2 hrtimers: Handle CPU state correctly on hotplug
    d1099ad23596 irqchip/gic-v3: Handle CPU_PM_ENTER_FAILED correctly
    2dfbb920a89b gpiolib: cdev: Fix use after free in lineinfo_changed_notify
    80da29deb88a fs/proc: fix softlockup in __read_vmcore (part 2)
    ae527bd2b537 vsock: reset socket state when de-assigning the transport
    3cde51df39c3 vsock/virtio: cancel close work in the destructor
    f9710a5cbd99 net: ethernet: xgbe: re-add aneg to supported features in PHY quirks
    17dcfc0f54b7 x86/asm: Make serialize() always_inline
    a722df501ba3 nvmet: propagate npwg topology
    3f8b360ce0e0 poll_wait: add mb() to fix theoretical race between waitqueue_active() and .poll()
    99db426762e1 kheaders: Ignore silly-rename files
    95597be4806d fs: fix missing declaration of init_files
    2cf7601e1295 hfs: Sanity check the root record
    98ea165a2ac2 mac802154: check local interfaces before deleting sdata list
    3eb329978997 i2c: rcar: fix NACK handling when being a target
    8d037f34385a i2c: mux: demux-pinctrl: check initial mux selection, too
    a34050f70e79 drm/v3d: Ensure job pointer is set to NULL after job completion
    72dc13457e67 net/mlx5: Fix RDMA TX steering prio
    47166d31e531 net/mlx5: Refactor mlx5_get_flow_namespace
    9f07d9fd6181 net/mlx5: Add priorities for counters in RDMA namespaces
    faf64fe8915d nfp: bpf: prevent integer overflow in nfp_bpf_event_output()
    5f1678346109 gtp: Destroy device along with udp socket's netns dismantle.
    66f1864cd0b1 gtp: Use for_each_netdev_rcu() in gtp_genl_dump_pdp().
    320a0dea3b28 gtp: use exit_batch_rtnl() method
    fae8bd0b07f9 net: add exit_batch_rtnl() method
    37fdbeb0e293 net: net_namespace: Optimize the code
    bb36838dac7b bpf: Fix bpf_sk_select_reuseport() memory leak
    9f7ad4eb839d net: ethernet: ti: cpsw_ale: Fix cpsw_ale_get_field()
    a13d640d8c8e phy: usb: Fix clock imbalance for suspend/resume
    3bc29a491192 phy: usb: Use slow clock for wake enabled suspend
    246428bfb9e7 sctp: sysctl: rto_min/max: avoid using current->nsproxy
    acec80d9f126 drm: adv7511: Fix use-after-free in adv7533_attach_dsi()
    49881fcef3d4 drm: bridge: adv7511: use dev_err_probe in probe function
    3747465c5da7 drm: bridge: adv7511: unregister cec i2c device after cec adapter
    09a817549036 drm/bridge: adv7533: Switch to devm MIPI-DSI helpers
    2c0106fdd35c drm/mipi-dsi: Create devm device attachment
    5ad24956a20e drm/mipi-dsi: Create devm device registration
    cb3a64b6b449 drm: bridge: adv7511: Remove redundant null check before clk_disable_unprepare
    8ff6f635a08c ocfs2: fix slab-use-after-free due to dangling pointer dqi_priv
    af45819b29bf ocfs2: correct return value of ocfs2_local_free_info()
    a8d08d9f5e12 phy: usb: Toggle the PHY power during init
    5917962b5196 phy: usb: Add "wake on" functionality for newer Synopsis XHCI controllers
    5330de58f70d block: remove the update_bdev parameter to set_capacity_revalidate_and_notify
    afa920d411e9 sd: update the bdev size in sd_revalidate_disk
    72224a75c5f6 nvme: let set_capacity_revalidate_and_notify update the bdev size
    dddf71505857 loop: let set_capacity_revalidate_and_notify update the bdev size
    5601c261bbc5 arm64: dts: rockchip: add hevc power domain clock to rk3328
    00360f3f3962 arm64: dts: rockchip: add #power-domain-cells to power domain nodes
    3528099673ba iio: inkern: call iio_device_put() only on mapped devices
    ac8d932e3214 iio: adc: at91: call input_free_device() on allocated iio_dev
    1b7b9084fad8 iio: adc: ti-ads124s08: Use gpiod_set_value_cansleep()
    2d72fc4a1ca6 iio: gyro: fxas21002c: Fix missing data update in trigger handler
    3bf8d1e87939 iio: adc: ti-ads8688: fix information leak in triggered buffer
    a386d9d2dc66 iio: imu: kmx61: fix information leak in triggered buffer
    b0e9c11c762e iio: light: vcnl4035: fix information leak in triggered buffer
    e1c1e8c05010 iio: dummy: iio_simply_dummy_buffer: fix information leak in triggered buffer
    d25f1fc27367 iio: pressure: zpa2326: fix information leak in triggered buffer
    3e4d32cc1459 usb: gadget: f_fs: Remove WARN_ON in functionfs_bind
    209b72d3c4e1 usb: fix reference leak in usb_new_device()
    d9f78c900648 USB: core: Disable LPM only for non-suspended ports
    ee63cb2262e3 USB: usblp: return error when setting unsupported protocol
    1062b648bff6 usb: gadget: u_serial: Disable ep before setting port to null to fix the crash caused by port being null
    4c51407cb8a4 usb: dwc3: gadget: fix writing NYET threshold
    258b3530cfdf USB: serial: cp210x: add Phoenix Contact UPS Device
    09d4072aabee usb-storage: Add max sectors quirk for Nokia 208
    717b7360ccc1 staging: iio: ad9832: Correct phase range check
    38da4bab433c staging: iio: ad9834: Correct phase range check
    e764b4e18789 USB: serial: option: add Neoway N723-EA support
    dad372177818 USB: serial: option: add MeiG Smart SRM815
    66de7a2541d8 md/raid5: fix atomicity violation in raid5_cache_count
    08765d4e44d4 scripts/sorttable: fix orc_sort_cmp() to maintain symmetry and transitivity
    88136f799f33 drm/amd/display: increase MAX_SURFACES to the value supported by hw
    2f8067b3425c ACPI: resource: Add Asus Vivobook X1504VAP to irq1_level_low_skip_override[]
    522ddfb1fb62 ACPI: resource: Add TongFang GM5HG0A to irq1_edge_low_force_override[]
    8c38baa03ac8 riscv: Fix sleeping in invalid context in die()
    497471baf53b drm/amd/display: Add check for granularity in dml ceil/floor helpers
    dc583e7e5f85 sctp: sysctl: auth_enable: avoid using current->nsproxy
    03ca51faba2b sctp: sysctl: cookie_hmac_alg: avoid using current->nsproxy
    2c1a42fbd98e dm-ebs: don't set the flag DM_TARGET_PASSES_INTEGRITY
    cd30a3960433 dm thin: make get_first_thin use rcu-safe list first function
    9340385468d0 afs: Fix the maximum cell name length
    a965f7f0ea3a netfilter: conntrack: clamp maximum hashtable size to INT_MAX
    208929266386 netfilter: nf_tables: imbalance in flowtable binding
    72e6ca38ca66 tls: Fix tls_sw_sendmsg error handling
    53b7a6762483 cxgb4: Avoid removal of uninserted tid
    43658e4a5f27 net_sched: cls_flow: validate TCA_FLOW_RSHIFT attribute
    22e3f5ee7317 tcp/dccp: allow a connection when sk_max_ack_backlog is zero
    9261b8252473 tcp/dccp: complete lockless accesses to sk->sk_max_ack_backlog
    c9c0471e29f0 net: 802: LLC+SNAP OID:PID lookup on start of skb data
    c2da454712f2 ieee802154: ca8210: Add missing check for kfifo_alloc() in ca8210_probe()
    4a6167ae75ad netfilter: nft_dynset: honor stateful expressions in set definition
    01c4e22c260d ASoC: mediatek: disable buffer pre-allocation
    d8cfbb8723bd exfat: fix the infinite loop in exfat_readdir()
    5c10baed458e dm array: fix cursor index when skipping across block boundaries
    cb223d9606a3 dm array: fix unreleased btree blocks on closing a faulty array cursor
    fc1ef07c3522 dm array: fix releasing a faulty array block twice in dm_array_cursor_end
    359abf6ca962 jbd2: flush filesystem device before updating tail sequence
    0f2b2d9e881c ceph: give up on paths longer than PATH_MAX
    70a41e4b4d83 smb: client: fix potential OOB in smb2_dump_detail()
    e1109eace22a scsi: lpfc: Fix use-after-free in lpfc_unreg_rpi() routine
    14c02f4e6920 Linux 5.10.233
    d675fefbaec3 mm: vmscan: account for free pages to prevent infinite Loop in throttle_direct_reclaim()
    17c3f7988f32 drm: adv7511: Drop dsi single lane support
    081bdb3a3167 net/sctp: Prevent autoclose integer overflow in sctp_association_init()
    5a1dd20a9d86 sky2: Add device ID 11ab:4373 for Marvell 88E8075
    c55d186376a8 pinctrl: mcp23s08: Fix sleeping in atomic context due to regmap locking
    42a6eb4ed7a9 RDMA/uverbs: Prevent integer overflow issue
    50804bd95f00 modpost: fix the missed iteration for the max bit in do_input()
    0cd78baf4dd2 modpost: fix input MODULE_DEVICE_TABLE() built for 64-bit on 32-bit host
    d5a30a6117ea btrfs: don't set lock_owner when locking extent buffer for reading
    51b03b7473a0 btrfs: locking: remove the recursion handling code
    20d96aa61607 ARC: build: Try to guess GCC variant of cross compiler
    58713417015b irqchip/gic: Correct declaration of *percpu_base pointer in union gic_base
    af37dc1f017b net: usb: qmi_wwan: add Telit FE910C04 compositions
    e529b4686038 bpf: fix potential error return
    6f3ce0ee5c3c sound: usb: format: don't warn that raw DSD is unsupported
    a2718ed1eb8c btrfs: flush delalloc workers queue before stopping cleaner kthread during unmount
    12a6e304325d wifi: mac80211: wake the queues in case of failure in resume
    2558d753df06 tracing: Prevent bad count for tracing_cpumask_write
    1bf53a2145fa kernel: Initialize cpumask before parsing
    ba5120a2fb5f btrfs: fix use-after-free when COWing tree bock and tracing is enabled
    bf267f2f81bc btrfs: rename and export __btrfs_cow_block()
    1817e3e849f6 btrfs: locking: remove all the blocking helpers
    4da6be8eb618 btrfs: switch extent buffer tree lock to rw_semaphore
    42d7147c9c21 dmaengine: dw: Select only supported masters for ACPI devices
    d3017895e393 ila: serialize calls to nf_register_net_hooks()
    0d3fa6c3c9ca af_packet: fix vlan_get_protocol_dgram() vs MSG_PEEK
    fa57f07ba062 af_packet: fix vlan_get_tci() vs MSG_PEEK
    7eaa71f56a6f RDMA/rtrs: Ensure 'ib_sge list' is accessible
    925f2be402f9 eth: bcmsysport: fix call balance of priv->clk handling routines
    9c76fb573889 ALSA: usb-audio: US16x08: Initialize array before use
    0f67a980f2ae net: llc: reset skb->transport_header
    6a14b46052ee netfilter: nft_set_hash: unaligned atomic read on struct nft_set_ext
    cf6befa7c569 netrom: check buffer length before accessing it
    60e64b6261d1 drm/bridge: adv7511_audio: Update Audio InfoFrame properly
    bbcbb83a7f1f RDMA/bnxt_re: Fix the locking while accessing the QP table
    070d214c0183 RDMA/bnxt_re: Fix max_qp_wrs reported
    cff07807f693 RDMA/bnxt_re: Fix reporting hw_ver in query_device
    5684c11d3aec RDMA/bnxt_re: Add check for path mtu in modify_qp
    aea89a85bc74 RDMA/mlx5: Enforce same type port association for multiport RoCE
    af3626302040 net/mlx5: Make API mlx5_core_is_ecpf accept const pointer
    6531f9c7e518 thunderbolt: Add support for Intel Panther Lake-M/P
    f8b8c8c83528 thunderbolt: Add support for Intel Lunar Lake
    e7cca35083b8 thunderbolt: Add Intel Barlow Ridge PCI ID
    a534e5d47e4f thunderbolt: Add support for Intel Meteor Lake
    aeb4a70248f5 thunderbolt: Add support for Intel Raptor Lake
    21347105ded3 thunderbolt: Add support for Intel Alder Lake
    712137b177b4 selinux: ignore unknown extended permissions
    36c569dfa724 x86/hyperv: Fix hv tsc page based sched_clock for hibernation
    c47e02201171 ipv6: prevent possible UAF in ip6_xmit()
    3cb8e49178e1 skb_expand_head() adjust skb->truesize incorrectly
    f67138dd338c nfsd: cancel nfsd_shrinker_work using sync mode in nfs4_state_shutdown_net
    a1c3a19446a4 btrfs: avoid monopolizing a core when activating a swap file
    b29c7783ac1f power: supply: gpio-charger: Fix set charge current limits
    5c4a141ff09e tracing: Constify string literal data member in struct trace_event_call
    e3b89e6a6422 arm64: Ensure bits ASID[15:8] are masked out when the kernel uses 8-bit ASIDs
    de29cb3bdfb2 arm64: mm: Rename asid2idx() to ctxid2asid()
    109f91d8b933 drm/dp_mst: Fix MST sideband message body length check
    221109ba2127 bpf: fix recursive lock when verdict program return SK_PASS
    79f87a6ec39f bpf: Check validity of link->type in bpf_link_show_fdinfo()
    1504108cb602 ipv6: fix possible UAF in ip6_finish_output2()
    ee6b1db17f82 ipv6: use skb_expand_head in ip6_xmit
    4132c4ad00dd ipv6: use skb_expand_head in ip6_finish_output2
    23f95bbe7250 skbuff: introduce skb_expand_head()
    3754c15b9348 MIPS: Probe toolchain support of -msym32
    9ca428c6397a virtio-blk: don't keep queue frozen during system suspend
    bbb55d1cb0b0 scsi: storvsc: Do not flag MAINTENANCE_IN return of SRB_STATUS_DATA_OVERRUN as an error
    f37f301d84ea scsi: mpt3sas: Diag-Reset when Doorbell-In-Use bit is set during driver load time
    3cc9e1a56692 platform/x86: asus-nb-wmi: Ignore unknown event 0xCF
    c06a5b7f12a4 regmap: Use correct format specifier for logging range errors
    1c58d374ca44 ALSA: hda/conexant: fix Z60MR100 startup pop issue
    f36d024bd15e scsi: megaraid_sas: Fix for a potential deadlock
    c1d93e7100e5 scsi: qla1280: Fix hw revision numbering for ISP1020/1040
    7911ca06b674 watchdog: it87_wdt: add PWRGD enable quirk for Qotom QCML04
    7fca949e30c3 tracing/kprobe: Make trace_kprobe's module callback called after jump_label update
    1562871ef613 mtd: rawnand: fix double free in atmel_pmecc_create_user()
    ed1a8aaa3445 dmaengine: at_xdmac: avoid null_prt_deref in at_xdmac_prep_dma_memset
    e87dbcfdf1c0 dmaengine: mv_xor: fix child node refcount handling in early exit
    619a5aeb0f0d phy: core: Fix that API devm_phy_destroy() fails to destroy the phy
    8826abb0ae2d phy: core: Fix that API devm_of_phy_provider_unregister() fails to unregister the phy provider
    574e5cfae2d8 phy: core: Fix that API devm_phy_put() fails to release the phy
    9e21f671b9a9 phy: core: Fix an OF node refcount leakage in of_phy_provider_lookup()
    722ece95fcce phy: core: Fix an OF node refcount leakage in _of_phy_get()
    36a6523d097d mtd: diskonchip: Cast an operand to prevent potential overflow
    9ad478986fd1 nfsd: restore callback functionality for NFSv4.0
    d814eeb7faa4 bpf: Check negative offsets in __bpf_skb_min_len()
    1b63193b150c tcp_bpf: Charge receive socket buffer in bpf_tcp_ingress()
    4e5aab3e4115 mm/vmstat: fix a W=1 clang compiler warning
    e11778189513 media: dvb-frontends: dib3000mb: fix uninit-value in dib3000_write_reg
    4e2e9adaea7d epoll: Add synchronous wakeup support for ep_poll_callback
    6e1e991c4017 ceph: validate snapdirname option length when mounting
    b7f89856c5fc of: Fix refcount leakage for OF node returned by __of_get_dma_parent()
    c86a40c26857 of: Fix error path in of_parse_phandle_with_args_map()
    9416f17809a1 udmabuf: also check for F_SEAL_FUTURE_WRITE
    5d4ed71327b0 nilfs2: prevent use of deleted inode
    8d42147c83ee of/irq: Fix using uninitialized variable @addr_len in API of_irq_parse_one()
    64ee07cfd50f NFS/pnfs: Fix a live lock between recalled layouts and layoutget
    d81f4e73aff9 Drivers: hv: util: Avoid accessing a ringbuffer not initialized yet
    8b53be082fc6 btrfs: tree-checker: reject inline extent items with 0 ref count
    98f31cf96f47 zram: refuse to use zero sized block device as backing device
    df56b6f9b430 sh: clk: Fix clk_enable() to return 0 on NULL clk
    6742afdf6171 hwmon: (tmp513) Fix interpretation of values of Temperature Result and Limit Registers
    525c3d0595b0 USB: serial: option: add Telit FE910C04 rmnet compositions
    b38b9456621d USB: serial: option: add MediaTek T7XX compositions
    25a5f80417b2 USB: serial: option: add Netprisma LCUK54 modules for WWAN Ready
    452c1654c3cd USB: serial: option: add MeiG Smart SLM770A
    daf09316ddc2 USB: serial: option: add TCL IK512 MBIM & ECM
    0e8098cc2538 efivarfs: Fix error on non-existent file
    de4359fa4f81 i2c: riic: Always round-up when calculating bus period
    8eb181aee760 chelsio/chtls: prevent potential integer overflow on 32bit
    ddfb709c2895 mmc: sdhci-tegra: Remove SDHCI_QUIRK_BROKEN_ADMA_ZEROLEN_DESC quirk
    ad26612c2af9 netfilter: ipset: Fix for recursive locking warning
    a24ce83a2de1 net: ethernet: bgmac-platform: fix an OF node reference leak
    1942218bf95f net: hinic: Fix cleanup in create_rxqs/txqs()
    64f3f7388b90 ionic: use ee->offset when returning sprom data
    81bdfcd6e6a9 netdevsim: prevent bad user input in nsim_dev_health_break_write()
    2fb425f27ee6 netdevsim: switch to memdup_user_nul()
    82c7ad9ca099 net/smc: check return value of sock_recvmsg when draining clc data
    846bada23bfc net/smc: check iparea_offset and ipv6_prefixes_cnt when receiving proposal msg
    e18830b7c498 net/smc: check sndbuf_space again after NOSPACE flag is set in smc_poll
    7678451d66b8 erofs: fix incorrect symlink detection in fast symlink
    0ab621fcdff1 erofs: fix order >= MAX_ORDER warning due to crafted negative i_size
    0f851f8c62d0 i2c: pnx: Fix timeout in wait functions
    e430962901c7 usb: dwc2: gadget: Don't write invalid mapped sg entries into dma_desc with iommu enabled
    4ba1ee910938 usb: cdns3: Add quirk flag to enable suspend residency
    9339c91863de PCI: Add ACS quirk for Broadcom BCM5760X NIC
    dab416edff9d ALSA: usb: Fix UBSAN warning in parse_audio_unit()
    f9869f6772e3 MIPS: Loongson64: DTS: Fix msi node for ls7a
    0dde3ae52a0d PCI: Use preserve_config in place of pci_flags
    6c7731ad179a PCI/AER: Disable AER service on suspend
    5e473f462a16 net: sched: fix ordering of qlen adjustment
    aaccf3924c7a scsi: dpt_i2o: Remove obsolete driver
    0c8ac16c1e2f usb: dwc3: dwc3-qcom: Add missing platform_device_put() in dwc3_qcom_acpi_register_core
    bfdadc630e33 firmware: arm_scmi: Fix slab-use-after-free in scmi_bus_notifier()
    abc9475430fd Linux 5.10.232
    20ad30bed789 x86/static-call: fix 32-bit build
    e7c1fcdda47b ALSA: usb-audio: Fix a DMA to stack memory bug
    b751972c26f6 x86/xen: remove hypercall page
    b09001da8227 x86/xen: use new hypercall functions instead of hypercall page
    76b42b1340ca x86/xen: add central hypercall functions
    05df6e6cd9a7 x86/xen: don't do PV iret hypercall through hypercall page
    bed5b6a6f207 x86/static-call: provide a way to do very early static-call updates
    4099bcd87390 objtool/x86: allow syscall instruction
    e74011db5179 x86: make get_cpu_vendor() accessible from Xen code
    1d5354a9182b xen/netfront: fix crash when removing device
    dac3f7ba392c Revert "clkdev: remove CONFIG_CLKDEV_LOOKUP"
    8b7e0d915689 Revert "clocksource/drivers:sp804: Make user selectable"
    7f4e1fee0a74 drm/i915: Fix memory leak by correcting cache object name in error handler
    47b341f714e6 tracing/kprobes: Skip symbol counting logic for module symbols in create_local_trace_kprobe()
    dadf82c1b260 bpf: sync_linked_regs() must preserve subreg_def
    6fd69b2f2991 blk-iocost: Avoid using clamp() on inuse in __propagate_weights()
    32a849c676ea ACPICA: events/evxfregn: don't release the ContextMutex that was never acquired
    45af429f76e7 team: Fix feature propagation of NETIF_F_GSO_ENCAP_ALL
    a1a97584334c bonding: Fix feature propagation of NETIF_F_GSO_ENCAP_ALL
    49cb8083c8df net: bonding, dummy, ifb, team: advertise NETIF_F_GSO_SOFTWARE
    216509dda290 net/sched: netem: account for backlog updates from child qdisc
    0fd8c3179b08 qca_spi: Make driver probing reliable
    ab891aeb28d1 qca_spi: Fix clock speed for multiple QCA7000
    68e6a5f0cdd8 cxgb4: use port number to set mac addr
    cf604286b70d ACPI: resource: Fix memory resource type union access
    76d856f03d02 net: lapb: increase LAPB_HEADER_LEN
    4d2b56e2fb1e selftests: mlxsw: sharedbuffer: Remove duplicate test cases
    938742593a57 selftests: mlxsw: sharedbuffer: Remove h1 ingress test case
    a771f349c95d tipc: fix NULL deref in cleanup_bearer()
    784fc6707949 batman-adv: Do not let TT changes list grows indefinitely
    48e63887c01f batman-adv: Remove uninitialized data in full table TT response
    4fb09749f266 batman-adv: Do not send uninitialized TT changes
    616aa5f3c86e acpi: nfit: vmalloc-out-of-bounds Read in acpi_nfit_ctl
    632fb232b6bb exfat: fix potential deadlock on __exfat_get_dentry_set
    e26fa236758e virtio/vsock: Fix accept_queue memory leak
    7b2e41b2d251 bpf, sockmap: Fix update element with same
    7ba7e748bd71 xfs: fix scrub tracepoints when inode-rooted btrees are involved
    4e33aedc3026 xfs: don't drop errno values when we fail to ficlone the entire range
    28b3c03a6790 usb: gadget: u_serial: Fix the issue that gs_start_io crashed due to accessing null pointer
    922142bcff97 usb: ehci-hcd: fix call balance of clocks handling routines
    0f6184603ba8 usb: dwc2: hcd: Fix GetPortStatus & SetPortFeature
    1e05b5b36aea ata: sata_highbank: fix OF node reference leak in highbank_initialize_phys()
    ff6f8a29e2a7 usb: host: max3421-hcd: Correctly abort a USB request.
    bd92492a960c tcp: check space before adding MPTCP SYN options
    df8d35efada4 Linux 5.10.231
    af442dd3e3fc octeontx2-pf: Fix otx2_get_fecparam()
    ddeef5079c6b octeontx2: Fix condition.
    bde4e7c15271 media: uvcvideo: Require entities to have a non-zero unique ID
    45a92cbc88e4 ALSA: usb-audio: Fix out of bounds reads when finding clock sources
    3fc53e46fdc8 scsi: core: Fix scsi_mode_select() buffer length handling
    a0777b45095f scsi: sd: Fix sd_do_mode_sense() buffer length handling
    38283b035c9d PCI: rockchip-ep: Fix address translation unit programming
    43c48ad24c03 Revert "drm/amdgpu: add missing size check in amdgpu_debugfs_gprwave_read()"
    f5e45e9464c7 modpost: Add .irqentry.text to OTHER_SECTIONS
    969ee61aa117 ocfs2: Revert "ocfs2: fix the la space leak when unmounting an ocfs2 volume"
    4fcd903a5d9e drm/amd/display: Check BIOS images before it is used
    7d5f99db8b15 xhci: dbc: Fix STALL transfer event handling
    99f0fe6d0191 jffs2: Fix rtime decompressor
    f6fc251baefc jffs2: Prevent rtime decompress memory corruption
    dbedf8ddde53 KVM: arm64: vgic-its: Clear ITE when DISCARD frees an ITE
    c329033f1b72 KVM: arm64: vgic-its: Clear DTE when MAPD unmaps a device
    f4dbf393bfb4 KVM: arm64: vgic-its: Add a data length check in vgic_its_save_*
    c3cded0ff622 Revert "unicode: Don't special case ignorable code points"
    7522e61c5350 btrfs: fix missing snapshot drew unlock when root is dead during swap activation
    354f24382480 sched/core: Prevent wakeup of ksoftirqd during idle load balance
    a676dbc8af8c sched/fair: Check idle_cpu() before need_resched() to detect ilb CPU turning busy
    4aaaf22aa193 sched/fair: Add NOHZ balancer flag for nohz.next_balance updates
    f8d61ae46cf4 sched/fair: Trigger the update of blocked load on newly idle cpu
    0669c671ab36 sched/fair: Merge for each idle cpu loop of ILB
    88136224a8f1 sched/fair: Remove unused parameter of update_nohz_stats
    1940ddbeb9af sched/fair: Remove update of blocked load from newidle_balance
    f3794dbff0ed sched/core: Remove the unnecessary need_resched() check in nohz_csd_func()
    44624fbc019f misc: eeprom: eeprom_93cx6: Add quirk for extra read clock cycle
    a79a7e3c03ae powerpc/prom_init: Fixup missing powermac #size-cells
    5a2eaa3ad2b8 MIPS: Loongson64: DTS: Really fix PCIe port nodes for ls7a
    19bc36c8d4ec usb: chipidea: udc: handle USB Error Interrupt if IOC not set
    5ac1dd51aaa0 i3c: Use i3cdev->desc->info instead of calling i3c_device_get_info() to avoid deadlock
    e5f0e94f95b8 PCI: Add ACS quirk for Wangxun FF5xxx NICs
    1af3a54dcea4 PCI: Add 'reset_subordinate' to reset hierarchy below bridge
    dff561e4060d f2fs: fix f2fs_bug_on when uninstalling filesystem call f2fs_evict_inode.
    22169b367563 nvdimm: rectify the illogical code within nd_dax_probe()
    38953b4419d1 pinctrl: qcom-pmic-gpio: add support for PM8937
    5d552000fe9f scsi: st: Add MTIOCGET and MTLOAD to ioctls allowed after device reset
    910f9d22095d scsi: st: Don't modify unknown block number in MTIOCGET
    ddcfc5708da9 leds: class: Protect brightness_show() with led_cdev->led_access mutex
    3dd2c5cb2c69 scsi: hisi_sas: Add cond_resched() for no forced preemption model
    dd72b3ac2fc0 tracing: Use atomic64_inc_return() in trace_clock_counter()
    170b0323b032 pinctrl: freescale: fix COMPILE_TEST error with PINCTRL_IMX_SCU
    18347e7e0404 netpoll: Use rcu_access_pointer() in __netpoll_setup
    78b13b562206 net/neighbor: clear error in case strict check is not set
    f795bdf9dbe2 rocker: fix link status detection in rocker_carrier_init()
    042da326b0a3 ASoC: hdmi-codec: reorder channel allocation list
    e07b54b67e9c Bluetooth: btusb: Add RTL8852BE device 0489:e123 to device tables
    7522d7d745d1 wifi: brcmfmac: Fix oops due to NULL pointer dereference in brcmf_sdiod_sglist_rw()
    856b24b5d92c wifi: ipw2x00: libipw_rx_any(): fix bad alignment
    13c3a54f48a6 drm/amdgpu: set the right AMDGPU sg segment limitation
    03c4c3e02cf9 drm/amdgpu: skip amdgpu_device_cache_pci_state under sriov
    368a53315222 jfs: add a check to prevent array-index-out-of-bounds in dbAdjTree
    97e693593162 jfs: fix array-index-out-of-bounds in jfs_readdir
    df7c76636952 jfs: fix shift-out-of-bounds in dbSplit
    8c97a4d5463a jfs: array-index-out-of-bounds fix in dtReadFirst
    3ccce34a5c3f dma-debug: fix a possible deadlock on radix_lock
    064149161c37 drm/amdgpu: refine error handling in amdgpu_ttm_tt_pin_userptr
    d28d22728b85 wifi: ath5k: add PCI ID for Arcadyan devices
    9400aeb5cd02 wifi: ath5k: add PCI ID for SX76X
    35360255ca30 net: inet6: do not leave a dangling sk pointer in inet6_create()
    2bc34d8c8898 net: inet: do not leave a dangling sk pointer in inet_create()
    14959fd7538b net: ieee802154: do not leave a dangling sk pointer in ieee802154_create()
    ce39b5576785 net: af_can: do not leave a dangling sk pointer in can_create()
    daa13175a6de Bluetooth: L2CAP: do not leave dangling sk pointer on error in l2cap_sock_create()
    1dc1e1db9270 af_packet: avoid erroring out after sock_init_data() in packet_create()
    50a90e5af499 net/sched: cbs: Fix integer overflow in cbs_set_port_rate()
    a75fe481c42c net: ethernet: fs_enet: Use %pa to format resource_size_t
    fbc8d9665322 net: fec_mpc52xx_phy: Use %pa to format resource_size_t
    00c9f6e82591 samples/bpf: Fix a resource leak
    86b66b8091c9 r8169: don't apply UDP padding quirk on RTL8126A
    823f4dff6cbd drm/radeon/r600_cs: Fix possible int overflow in r600_packet3_check()
    418cf1b2c399 drm/mcde: Enable module autoloading
    a3c885165d7c drm: panel-orientation-quirks: Add quirk for AYA NEO 2 model
    c04d1dc54b11 drm/vc4: hvs: Set AXI panic modes for the HVS
    c5623d7f9f90 media: cx231xx: Add support for Dexatek USB Video Grabber 1d19:6108
    7850ca9a6695 media: uvcvideo: Add a quirk for the Kaiweets KTI-W02 infrared camera
    f4f2ef66d288 kcsan: Turn report_filterlist_lock into a raw_spinlock
    34cd4ec08b89 kselftest/arm64: Don't leak pipe fds in pac.exec_sign_all()
    8f855689c164 btrfs: avoid unnecessary device path update for the same device
    99192c735ed4 s390/cpum_sf: Handle CPU hotplug remove during sampling
    c2527d07c7e9 iommu/arm-smmu: Defer probe of clients after smmu device bound
    24328b776fb2 ocfs2: update seq_file index in ocfs2_dlm_seq_next
    d3aeb50fcb12 mmc: core: Further prevent card detect during shutdown
    af940c0d623d mmc: sdhci-pci: Add DMI quirk for missing CD GPIO on Vexia Edu Atla 10 tablet
    287e4952d77b regmap: detach regmap from dev on regmap_exit
    7175728f6b2d dma-buf: fix dma_fence_array_signaled v4
    70f3de869865 bpf: fix OOB devmap writes when deleting elements
    336e30f32ae7 bcache: revert replacing IS_ERR_OR_NULL with IS_ERR again
    e3732102a9d6 nilfs2: fix potential out-of-bounds memory access in nilfs_find_entry()
    df43d8da6bac scsi: qla2xxx: Remove check req_sg_cnt should be equal to rsp_sg_cnt
    12f04fc8580e scsi: qla2xxx: Fix use after free on unload
    c87add0d819b scsi: qla2xxx: Supported speed displayed incorrectly for VPorts
    406e57325daa scsi: qla2xxx: Fix NVMe and NPIV connect issue
    d7fd14dd866f ALSA: hda/realtek: Add support for Samsung Galaxy Book3 360 (NP730QFG)
    a59d39e4770f ALSA: hda/realtek: Enable mute and micmute LED on HP ProBook 430 G8
    b3ebf8cbd886 ALSA: usb-audio: add mixer mapping for Corsair HS80
    1152dd13845e arm64: ptrace: fix partial SETREGSET for NT_ARM_TAGGED_ADDR_CTRL
    4a6f053af119 tracing: Fix cmp_entries_dup() to respect sort() comparison rules
    4cbc202f28a5 watchdog: rti: of: honor timeout-sec property
    5912a921289e HID: wacom: fix when get product name maybe null pointer
    43c6d763569f bpf: Fix exact match conditions in trie_get_next_key()
    adb4a970bfa9 bpf: Handle BPF_EXIST and BPF_NOEXIST for LPM trie
    9c19ea59965e ocfs2: free inode when ocfs2_get_init_inode() fails
    e0c6ce842409 spi: mpc52xx: Add cancel_work_sync before module remove
    dbedc7e142df tcp_bpf: Fix the sk_mem_uncharge logic in tcp_bpf_sendmsg
    8cd416aaac68 drm/sti: Add __iomem for mixer_dbg_mxn's parameter
    7fd09abc4bdd i3c: master: Fix dynamic address leak when 'assigned-address' is present
    b70ba15c66d5 i3c: master: Extend address status bit to 4 and add I3C_ADDR_SLOT_EXT_DESIRED
    1c47272e535d i3c: master: Replace hard code 2 with macro I3C_ADDR_SLOT_STATUS_BITS
    3aecd6fd55cf i3c: fix incorrect address slot lookup on 64-bit
    fbb3aa94fc8d dt-bindings: serial: rs485: Fix rs485-rts-delay property
    0da0be3b1d17 dt_bindings: rs485: Correct delay values
    4733f68e59bb gpio: grgpio: Add NULL check in grgpio_probe
    c8e3aa367e71 gpio: grgpio: use a helper variable to store the address of ofdev->dev
    d9fa09ca004b geneve: do not assume mac header is set in geneve_xmit_skb()
    d93efe18b49a ethtool: Fix wrong mod state in case of verbose and no_mask bitset
    e21855091f11 netfilter: nft_set_hash: skip duplicated elements pending gc run
    6099b5d3e371 netfilter: ipset: Hold module reference while requesting a module
    98ea587a4048 net: sched: fix erspan_opt settings in cls_flower
    e0155b1b1509 igb: Fix potential invalid memory access in igb_init_module()
    9da327f2e6b7 net/qed: allow old cards not supporting "num_images" to work
    650ee9a22d7a tipc: Fix use-after-free of kernel socket in cleanup_bearer().
    c99507fff94b dccp: Fix memory leak in dccp_feat_change_recv
    b90d061345bb net/ipv6: release expired exception dst cached in socket
    b3282c2bebee can: j1939: j1939_session_new(): fix skb reference counting
    aa632691c722 net: hsr: avoid potential out-of-bound access in fill_frame_info()
    f9653b00bef2 net/sched: tbf: correct backlog statistic for GSO packets
    7f5eda0e315b ptp: Add error handling for adjfine callback in ptp_clock_adjtime
    ad28612ebae1 netfilter: x_tables: fix LED ID check in led_tg_check()
    0b2cbed82b7c ipvs: fix UB due to uninitialized stack access in ip_vs_protocol_init()
    273cab979da1 can: sun4i_can: sun4i_can_err(): fix {rx,tx}_errors statistics
    265f8341470f can: sun4i_can: sun4i_can_err(): call can_change_state() even if cf is NULL
    601ec0003c17 watchdog: mediatek: Make sure system reset gets asserted in mtk_wdt_restart()
    05bed96e4cb0 iTCO_wdt: mask NMI_NOW bit for update_no_reboot_bit() call
    4715e23b3a7f drm/etnaviv: flush shader L1 cache after user commandstream
    c1406d8329f5 btrfs: don't BUG_ON on ENOMEM from btrfs_lookup_extent_info() in walk_down_proc()
    2d505a801e57 nfsd: fix nfs4_openowner leak when concurrent nfsd4_open occur
    7fd29d284b55 nfsd: make sure exp active before svc_export_show
    1f53e8400b13 dm thin: Add missing destroy_work_on_stack()
    c6ac663c92c8 PCI: keystone: Add link up check to ks_pcie_other_map_bus()
    093ecc6d82ff i3c: master: Fix miss free init_dyn_addr at i3c_master_put_i3c_addrs()
    aa10c746e79a scsi: ufs: exynos: Fix hibern8 notify callbacks
    a1f2aff064ef util_macros.h: fix/rework find_closest() macros
    afc1e3c00b3f ad7780: fix division by zero in ad7780_write_raw()
    6fd018aa168e btrfs: ref-verify: fix use-after-free after invalid ref action
    6f3821acd7c3 quota: flush quota_release_work upon quota writeback
    366e55e91fe9 octeontx2-pf: Fix out-of-bounds read in otx2_get_fecparam()
    442dadf32d1c ASoC: fsl_micfil: fix the naming style for mask definition
    971b48934577 sh: intc: Fix use-after-free bug in register_intc_controller()
    86a1f9fa2480 sunrpc: clear XPRT_SOCK_UPD_TIMEOUT when reset transport
    8c06a00a9be6 SUNRPC: Replace internal use of SOCKWQ_ASYNC_NOSPACE
    a4b153bdaad5 sunrpc: remove unnecessary test in rpc_task_set_client()
    3ccfa8269fae SUNRPC: Convert rpc_client refcount to use refcount_t
    e2730edfff6b SUNRPC: correct error code comment in xs_tcp_setup_socket()
    f69fb61c69a0 nfs: ignore SB_RDONLY when mounting nfs
    bd4624d73373 modpost: remove incorrect code in do_eisa_entry()
    b0660da68491 rtc: ab-eoz9: don't fail temperature reads on undervoltage notification
    7f5a2ed5c181 9p/xen: fix release of IRQ
    fa365f688014 9p/xen: fix init sequence
    57ee79e9c94c block: return unsigned int from bdev_io_min
    25ec6cd751c9 jffs2: fix use of uninitialized variable
    8d8b3f5f4cbf ubifs: authentication: Fix use-after-free in ubifs_tnc_end_commit
    04c0b0f37617 ubi: fastmap: Fix duplicate slab cache names while attaching
    36b25baf96b8 ubifs: Correct the total block count by deducting journal reservation
    0d68e8514d90 rtc: check if __rtc_read_time was successful in rtc_timer_do_work()
    cd154812858d rtc: abx80x: Fix WDT bit position of the status register
    c48db3147c14 rtc: st-lpc: Use IRQF_NO_AUTOEN flag in request_irq()
    5237a297ffd3 NFSv4.0: Fix a use-after-free problem in the asynchronous open()
    2365f57820c0 um: Always dump trace for specified task in show_stack
    634b3c3d0b5c um: Fix the return value of elf_core_copy_task_fpregs
    e6102b72edc4 um: Fix potential integer overflow during physmem setup
    52ee41452527 rpmsg: glink: Propagate TX failures in intentless mode as well
    02999e135b01 SUNRPC: make sure cache entry active before cache_show
    3c5f545c9a1f NFSD: Prevent a potential integer overflow
    a44a4260a28c lib: string_helpers: silence snprintf() output truncation warning
    8ceb21d76426 usb: dwc3: gadget: Fix looping of queued SG entries
    a98340265f28 usb: dwc3: gadget: Fix checking for number of TRBs left
    3591fe07aa53 ALSA: hda/realtek: Apply quirk for Medion E15433
    99af54eb0c96 ALSA: hda/realtek: Fix Internal Speaker and Mic boost of Infinix Y4 Max
    820bc3f297e8 ALSA: hda/realtek: Set PCBeep to default value for ALC274
    ee68e7bd8022 ALSA: hda/realtek: Update ALC225 depop procedure
    03a469024f67 media: v4l2-core: v4l2-dv-timings: check cvt/gtf result
    d7408a052aa1 media: wl128x: Fix atomicity violation in fmc_send_cmd()
    f74b360a012a HID: wacom: Interpret tilt data from Intuos Pro BT as signed values
    2d2192fd2e6b block: fix ordering between checking BLK_MQ_S_STOPPED request adding
    dad458e77540 arm64: tls: Fix context-switching of tpidrro_el0 when kpti is enabled
    77755dc95ff2 sh: cpuinfo: Fix a warning for CONFIG_CPUMASK_OFFSTACK
    35f8f72b4579 um: vector: Do not use drvdata in release
    3997d11fd996 serial: 8250: omap: Move pm_runtime_get_sync
    6be99d4c117b um: net: Do not use drvdata in release
    509ba8746f81 um: ubd: Do not use drvdata in release
    0f6737cad88b ubi: wl: Put source PEB into correct list if trying locking LEB failed
    fb6d3c6c1218 platform/chrome: cros_ec_typec: fix missing fwnode reference decrement
    11b414ff9ab4 spi: Fix acpi deferred irq probe
    2e151b8ca316 netfilter: ipset: add missing range check in bitmap_ip_uadt
    fa0e202e23ff Revert "serial: sh-sci: Clean sci_ports[0] after at earlycon exit"
    0ff91b3bf53e serial: sh-sci: Clean sci_ports[0] after at earlycon exit
    b12869cab514 Revert "usb: gadget: composite: fix OS descriptors w_value logic"
    5be4bc1c73ca driver core: bus: Fix double free in driver API bus_register()
    e844bccad7ee Bluetooth: Fix type of len in rfcomm_sock_getsockopt{,_old}()
    a26842e4683f exfat: fix uninit-value in __exfat_get_dentry_set
    7fc42f249daf locking/lockdep: Avoid creating new name string literals in lockdep_set_subclass()
    0b9622163926 tty: ldsic: fix tty_ldisc_autoload sysctl's proc_handler
    f856246ff6da apparmor: test: Fix memory leak for aa_unpack_strdup()
    b9322408d83a comedi: Flush partial mappings in error case
    a4236cc4f952 fsnotify: fix sending inotify event with unexpected filename
    da6e6ff1f6c5 PCI: Fix use-after-free of slot->bus on hot remove
    5442dbd3342a KVM: arm64: Ignore PMCNTENSET_EL0 while checking for overflow status
    1a89ef73b510 crypto: x86/aegis128 - access 32-bit arguments as 32-bit
    e8f728442dd5 perf/x86/intel/pt: Fix buffer full but size is 0 case
    626a8b956719 ASoC: codecs: Fix atomicity violation in snd_soc_component_get_drvdata()
    bbf3f1fd8a0a jfs: xattr: check invalid xattr size more strictly
    ea0527d5cc61 ext4: fix FS_IOC_GETFSMAP handling
    442c6f05d94e ext4: supress data-race warnings in ext4_free_inodes_{count,set}()
    62dc01c83fa7 ALSA: usb-audio: Fix potential out-of-bound accesses for Extigy and Mbox devices
    03d68e2d244c soc: qcom: socinfo: fix revision check in qcom_socinfo_probe()
    4c9fded47888 usb: ehci-spear: fix call balance of sehci clk handling routines
    0aa9e30b5b4a xen: Fix the issue of resource not being properly released in xenbus_dev_probe()
    e47f0e95441b apparmor: fix 'Do simple duplicate message elimination'
    f89f677adc78 ALSA: hda/realtek: Update ALC256 depop procedure
    6e99925d8548 ALSA: hda/realtek - Add type for ALC287
    9f26a607d846 staging: greybus: uart: clean up TIOCGSERIAL
    7bf3e45ea60b misc: apds990x: Fix missing pm_runtime_disable()
    8a960584638f USB: chaoskey: Fix possible deadlock chaoskey_list_lock
    bb37389d14f4 USB: chaoskey: fail open after removal
    2e72f53f740a usb: yurex: make waiting on yurex_write interruptible
    30b9a7786c48 usb: using mutex lock and supporting O_NONBLOCK flag in iowarrior_read()
    653903e36ca2 iio: light: al3010: Fix an error handling path in al3010_probe()
    75e6dc33f16a ipmr: fix tables suspicious RCU usage
    e5dffbd159ef ipmr: convert /proc handlers to rcu_read_lock()
    a9615376a999 bnxt_en: Reserve rings after PCIe AER recovery if NIC interface is down
    6b41c5627117 net: hsr: fix hsr_init_sk() vs network/transport headers.
    1564c7ed9d29 net: introduce a netdev feature for UDP GRO forwarding
    4654bcb686ac spi: atmel-quadspi: Fix register name in verbose logging function
    b58678e3f243 net: stmmac: dwmac-socfpga: Set RX watchdog interrupt as broken
    3dbdb3f85b74 marvell: pxa168_eth: fix call balance of pep->clk handling routines
    882ea20ce07c net: usb: lan78xx: Fix refcounting and autosuspend on invalid WoL configuration
    b18ab1198587 tg3: Set coherent DMA mask bits to 31 for BCM57766 chipsets
    6728375984cb net: usb: lan78xx: Fix memory leak on device unplug by freeing PHY device
    c399dd6e7042 power: supply: bq27xxx: Fix registers of bq27426
    c5351bfba7b9 power: supply: bq27xxx: Support CHARGE_NOW for bq27z561/bq28z610/bq34z100
    da4008a289e1 power: supply: core: Remove might_sleep() from power_supply_put()
    70f1bad32127 fs_parser: update mount_api doc to match function signature
    0918f5643fc6 vfio/pci: Properly hide first-in-list PCIe extended capability
    145482f4c894 vdpa/mlx5: Fix suboptimal range on iotlb iteration
    eb681998c889 NFSD: Fix nfsd4_shutdown_copy()
    9d4f174342a7 NFSD: Cap the number of bytes copied by nfs4_reset_recoverydir()
    752a75811f27 NFSD: Prevent NULL dereference in nfsd4_process_cb_update()
    9df83cc000ed remoteproc: qcom_q6v5_mss: Re-order writes to the IMEM region
    b5ba1b37142f rpmsg: glink: use only lower 16-bits of param2 for CMD_OPEN name length
    295cb2524309 rpmsg: glink: Fix GLINK command prefix
    9761e51e1d43 rpmsg: glink: Send READ_NOTIFY command in FIFO full case
    3dd661b963a3 rpmsg: glink: Add TX_DATA_CONT command while sending
    e72735fcce17 perf trace: Avoid garbage when not printing a syscall's arguments
    10eb66d4f295 perf trace: Do not lose last events in a race
    68ccc1830e9d m68k: coldfire/device.c: only build FEC when HW macros are defined
    2255a994d6f1 m68k: mcfgpio: Fix incorrect register offset for CONFIG_M5441x
    10f14161e830 perf trace: avoid garbage when not printing a trace event's arguments
    af87c2069952 f2fs: check curseg->inited before write_sum_page in change_curseg
    c6d54485cf81 f2fs: remove the unused flush argument to change_curseg
    5bb54d3b377e f2fs: open code allocate_segment_by_default
    c6ad7333e530 f2fs: remove struct segment_allocation default_salloc_ops
    a7e306f7c32d f2fs: avoid using native allocate_segment_by_default()
    6e5de38f605c f2fs: fix the wrong f2fs_bug_on condition in f2fs_do_replace_block
    43b2e068aef4 PCI: cpqphp: Fix PCIBIOS_* return value confusion
    1fe390f27875 PCI: cpqphp: Use PCI_POSSIBLE_ERROR() to check config reads
    edb4833a3838 perf probe: Correct demangled symbols in C++ program
    0b04b48e4cc2 perf probe: Fix libdw memory leak
    26db806fa23e perf cs-etm: Don't flush when packet_queue fills up
    c751d28b403f clk: clk-axi-clkgen: make sure to enable the AXI bus clock
    a68e4f76ee85 clk: axi-clkgen: use devm_platform_ioremap_resource() short-hand
    43afa76e6efe dt-bindings: clock: axi-clkgen: include AXI clk
    fc7ef5873472 dt-bindings: clock: adi,axi-clkgen: convert old binding to yaml format
    29216bb390e3 fbdev: sh7760fb: Fix a possible memory leak in sh7760fb_alloc_mem()
    d161e5ea0ca7 fbdev/sh7760fb: Alloc DMA memory from hardware device
    6f1fabc9e331 powerpc/kexec: Fix return of uninitialized variable
    fd57d992f371 powerpc/sstep: make emulate_vsx_load and emulate_vsx_store static
    66b7ddd1804e ocfs2: fix uninitialized value in ocfs2_file_read_iter()
    bd715e191d44 RDMA/hns: Fix NULL pointer derefernce in hns_roce_map_mr_sg()
    a4d2011cbe03 scsi: qedi: Fix a possible memory leak in qedi_alloc_and_init_sb()
    a56777a3ef5b scsi: qedf: Fix a possible memory leak in qedf_alloc_and_init_sb()
    e3b9ba55c18f scsi: fusion: Remove unused variable 'rc'
    ef2c2580189e scsi: bfa: Fix use-after-free in bfad_im_module_exit()
    cc30125eb6b6 mfd: rt5033: Fix missing regmap_del_irq_chip()
    896927b0157a RDMA/bnxt_re: Check cqe flags to know imm_data vs inv_irkey
    6956c0e7346c powerpc/pseries: Fix dtl_access_lock to be a rw_semaphore
    54cb5fa850f9 mtd: rawnand: atmel: Fix possible memory leak
    c912aae5363a cpufreq: loongson2: Unregister platform_driver on failure
    61d590d7076b mfd: intel_soc_pmic_bxtwc: Use IRQ domain for PMIC devices
    c472b55cc0bc mfd: intel_soc_pmic_bxtwc: Use IRQ domain for TMU device
    0b648968bfa4 mfd: intel_soc_pmic_bxtwc: Use IRQ domain for USB Type-C device
    48d3964f2bcd mfd: intel_soc_pmic_bxtwc: Use dev_err_probe()
    2630b18bed7d mfd: da9052-spi: Change read-mask to write-mask
    b86340df10b1 mfd: tps65010: Use IRQF_NO_AUTOEN flag in request_irq() to fix race
    a85e5215609d powerpc/vdso: Flag VDSO64 entry points as functions
    62a8d90e3221 trace/trace_event_perf: remove duplicate samples on the first tracepoint event
    49e8a0e07b02 wireguard: selftests: load nf_conntrack if not present
    63bc9a42a02e netpoll: Use rcu_access_pointer() in netpoll_poll_lock
    fb91ce37dc9a Bluetooth: fix use-after-free in device_for_each_child()
    49de4ac80427 driver core: Introduce device_find_any_child() helper
    f2d06d4e129e ALSA: 6fire: Release resources at card release
    4dd821dcbfce ALSA: caiaq: Use snd_card_free_when_closed() at disconnection
    bf0aa35a7cb8 ALSA: us122l: Use snd_card_free_when_closed() at disconnection
    24fe9f7ca83e ALSA: usx2y: Use snd_card_free_when_closed() at disconnection
    d5a733ee2624 ALSA: usx2y: Cleanup probe and disconnect callbacks
    cfb1f6bc2eed ALSA: usx2y: Coding style fixes
    9a70db03857a ALSA: usx2y: Fix spaces
    5674ae441c89 net: rfkill: gpio: Add check for clk_enable()
    b751f3423fbd drm/amdkfd: Fix wrong usage of INIT_WORK()
    6543a34f34a1 selftests: net: really check for bg process completion
    1df5d631ba9e bpf, sockmap: Fix sk_msg_reset_curr
    d26d977633d1 bpf, sockmap: Several fixes to bpf_msg_pop_data
    2b4530ecc018 bpf, sockmap: Several fixes to bpf_msg_push_data
    5a0ae8e4f79c selftests/bpf: Add push/pop checking for msg_verify_data in test_sockmap
    78eb4af79e8a selftests/bpf: Fix total_bytes in msg_loop_rx in test_sockmap
    74d2b00f488f selftests, bpf: Add one test for sockmap with strparser
    3e35560e80a9 selftests/bpf: Fix SENDPAGE data logic in test_sockmap
    a9fa0d2ce890 selftests/bpf: Add txmsg_pass to pull/push/pop in test_sockmap
    224b9bc4977c netlink: typographical error in nlmsg_type constants definition
    59362f51f4c2 drm/msm/dpu: cast crtc_clk calculation to u64 in _dpu_core_perf_calc_clk()
    3fd17a47ee72 wifi: wfx: Fix error handling in wfx_core_init()
    67d32d63c058 drm/etnaviv: hold GPU lock across perfmon sampling
    02aac657c48e drm/etnaviv: fix power register offset on GC300
    17551e3d94b7 drm/etnaviv: dump: fix sparse warnings
    04c0cd65a844 drm/etnaviv: Request pages from DMA32 zone on addressing_limited
    54163a35fe44 drm/etnaviv: rework linear window offset calculation
    e5e10c00610d drm/msm/adreno: Use IRQF_NO_AUTOEN flag in request_irq()
    e44d23fa0dc6 drm/panfrost: Remove unused id_mask from struct panfrost_model
    5ff9de1f2712 octeontx2-pf: handle otx2_mbox_get_rsp errors in otx2_ethtool.c
    2d1648603752 octeontx2-pf: ethtool fec mode support
    8cafe71ad0fb octeontx2-af: Add new CGX_CMD to get PHY FEC statistics
    9bb714350200 octeontx2-af: forward error correction configuration
    a5f3aebadcb7 octeontx2-pf: Calculate LBK link instead of hardcoding
    4dce1962411f octeontx2-af: Mbox changes for 98xx
    50c56b0f5fe3 drm: fsl-dcu: enable PIXCLK on LS1021A
    b773f406b6de drm/fsl-dcu: Convert to Linux IRQ interfaces
    5fa329c44e1e wifi: mwifiex: Fix memcpy() field-spanning write warning in mwifiex_config_scan()
    4496d25157c9 selftests/bpf: Fix txmsg_redir of test_txmsg_pull in test_sockmap
    addabcb1bd37 selftests/bpf: Fix msg_verify_data in test_sockmap
    d4f54c609d28 drm/bridge: tc358767: Fix link properties discovery
    e4decf4c8b56 netdevsim: copy addresses for both in and out paths
    7fd24ee949bd netdevsim: rely on XFRM state direction instead of flags
    76ff31c0113d xfrm: store and rely on direction to construct offload flags
    837f37f0cf39 xfrm: rename xfrm_state_offload struct to allow reuse
    bfdad9de02a3 bpf: Fix the xdp_adjust_tail sample prog issue
    7706afc21304 ASoC: dt-bindings: mt6359: Update generic node name and dmic-mode
    5e3385bca11a ASoC: fsl_micfil: fix regmap_write_bits usage
    b2a72a772ef0 ASoC: fsl_micfil: use GENMASK to define register bit fields
    226fc91c860b ASoC: fsl_micfil: do not define SHIFT/MASK for single bits
    fa55ed175c7b ASoC: fsl_micfil: Drop unnecessary register read
    78a71b056c2c dt-bindings: vendor-prefixes: Add NeoFidelity, Inc
    54550eeb8f86 wifi: ath10k: fix invalid VHT parameters in supported_vht_mcs_rate_nss2
    f3749bc13cb3 wifi: ath10k: fix invalid VHT parameters in supported_vht_mcs_rate_nss1
    145f3ac8c92e drm/v3d: Address race-condition in MMU flush
    c992e517c8a6 drm/imx/ipuv3: Use IRQF_NO_AUTOEN flag in request_irq()
    0bde5b6e230a drm/imx/dcss: Use IRQF_NO_AUTOEN flag in request_irq()
    d1ae370b82e9 wifi: mwifiex: Use IRQF_NO_AUTOEN flag in request_irq()
    29ee7d6fa18f wifi: p54: Use IRQF_NO_AUTOEN flag in request_irq()
    1d602e4b6dcb drm/omap: Fix locking in omap_gem_new_dmabuf()
    c941af142200 wifi: ath9k: add range check for conn_rsp_epid in htc_connect_service()
    ba35d3b212fb drm/mm: Mark drm_mm_interval_tree*() functions with __maybe_unused
    0c24b82bc4d1 media: atomisp: Add check for rgby_data memory allocation failure
    4478f599a283 media: atomisp: remove #ifdef HAS_NO_HMEM
    380c0e1d96f3 firmware: arm_scpi: Check the DVFS OPP count returned by the firmware
    02dff60d0c99 selftests/resctrl: Protect against array overrun during iMC config parsing
    5f0e91a5f4ed regmap: irq: Set lockdep class for hierarchical IRQ domains
    409b1e428cf9 pmdomain: ti-sci: Add missing of_node_put() for args.np
    dd1985f9752f ARM: dts: cubieboard4: Fix DCDC5 regulator constraints
    9db3ef898a6e pwm: imx27: Workaround of the pwm output bug when decrease the duty cycle
    e8174fb173cc cgroup/bpf: only cgroup v2 can be attached by bpf programs
    067d0c56630d Revert "cgroup: Fix memory leak caused by missing cgroup_bpf_offline"
    2295468c0c20 arm64: dts: mediatek: mt8173-elm-hana: Add vdd-supply to second source trackpad
    1b07333bbc3a arm64: dts: mt8183: krane: Fix the address of eeprom at i2c4
    839e76cea2ab tpm: fix signed/unsigned bug when checking event logs
    dad86eb91cf9 mmc: mmc_spi: drop buggy snprintf()
    748557ca7dc9 soc: qcom: geni-se: fix array underflow in geni_se_clk_tbl_get()
    c9c6a62c91e9 soc: ti: smartreflex: Use IRQF_NO_AUTOEN flag in request_irq()
    f9dc2ae5a2cd spi: spi-fsl-lpspi: Use IRQF_NO_AUTOEN flag in request_irq()
    85cf7a3c6f7d spi: spi-fsl-lpspi: downgrade log level for pio mode
    ef1db3d1d2bf clocksource/drivers:sp804: Make user selectable
    d08932bb6e38 clkdev: remove CONFIG_CLKDEV_LOOKUP
    e48e204f364a kcsan, seqlock: Fix incorrect assumption in read_seqbegin()
    dc684d966f48 time: Fix references to _msecs_to_jiffies() handling of values
    069601e4b657 crypto: cavium - Fix an error handling path in cpt_ucode_load_fw()
    28f8ffa945f7 crypto: bcm - add error check in the ahash_hmac_init function
    dead96e1c748 crypto: caam - add error check to caam_rsa_set_priv_key_form
    a56860294ccd crypto: cavium - Fix the if condition to exit loop after timeout
    a92ccd3618e4 crypto: pcrypt - Call crypto layer directly when padata_do_parallel() return -EBUSY
    99ec5eb5bbf3 EDAC/fsl_ddr: Fix bad bit shift operations
    e0269ea7a628 EDAC/bluefield: Fix potential integer overflow
    29551174590e firmware: google: Unregister driver_info on failure
    cc386170b331 crypto: caam - Fix the pointer passed to caam_qi_shutdown()
    e8a2b1c1c2ea hfsplus: don't query the device logical block size multiple times
    3cab4bbc6691 s390/syscalls: Avoid creation of arch/arch/ directory
    cf9efea8c092 acpi/arm64: Adjust error handling procedure in gtdt_parse_timer_block()
    6c772871c2e5 arm64: fix .data.rel.ro size assertion when CONFIG_LTO_CLANG
    ff01ac3e766c m68k: mvme147: Reinstate early console
    f65ca93b859d m68k: mvme16x: Add and use "mvme16x.h"
    21f46b07c20b m68k: mvme147: Fix SCSI controller IRQ numbers
    452f9ddd12be nvme-pci: fix freeing of the HMB descriptor table
    d3df9f26cff9 initramfs: avoid filename buffer overrun
    17f35a6c9391 mips: asm: fix warning when disabling MIPS_FP_SUPPORT
    72d6dd978f1d x86/xen/pvh: Annotate indirect branch as safe
    8ce88918e4d8 kselftest/arm64: mte: fix printf type warnings about longs
    8025d65d6242 x86/barrier: Do not serialize MSR accesses on AMD
    67be3cd92aa0 nvme: fix metadata handling in nvme-passthrough
    73b078e3314d cifs: Fix buffer overflow when parsing NFS reparse points
    36741bfcfbff rcu-tasks: Idle tasks on offline CPUs are in quiescent states
    e01ff1251c77 ipmr: Fix access to mfc_cache_list without lock held
    e8529cfd7086 ALSA: usb-audio: Fix Yamaha P-125 Quirk Entry
    e05e8f54d23f proc/softirqs: replace seq_printf with seq_put_decimal_ull_width
    444c9d41210c ASoC: stm: Prevent potential division by zero in stm32_sai_get_clk_div()
    ddd61392263d ASoC: stm: Prevent potential division by zero in stm32_sai_mclk_round_rate()
    a8ebe0a22527 can: j1939: fix error in J1939 documentation.
    f6b4294a0249 regulator: rk808: Add apply_bit for BUCK3 on RK809
    b070a9e0dbf3 soc: qcom: Add check devm_kasprintf() returned value
    6df3ee9073cd net: usb: qmi_wwan: add Quectel RG650V
    bc014d8d6561 x86/amd_nb: Fix compile-testing without CONFIG_AMD_NB
    f61da9401963 ALSA: hda/realtek: Add subwoofer quirk for Infinix ZERO BOOK 13
    501ac2d1aae6 selftests/watchdog-test: Fix system accidentally reset after watchdog-test
    6b5737b14af1 mac80211: fix user-power when emulating chanctx
    9347d7c552c8 ASoC: Intel: bytcr_rt5640: Add DMI quirk for Vexia Edu Atla 10 tablet
    43323a4e5b3f mm: resolve faulty mmap_region() error path behaviour
    a32712d54c61 mm: refactor arch_calc_vm_flag_bits() and arm64 MTE handling
    7a450540c82f mm: unconditionally close VMAs on error
    f68a0236337e mm: avoid unsafe VMA hook invocation when error arises on mmap hook
    57cc8d253099 mm: revert "mm: shmem: fix data-race in shmem_getattr()"
    ed98d26021db NFSD: Never decrement pending_async_copies on error
    059434d23c45 NFSD: Initialize struct nfsd4_copy earlier
    9e52ff544e0b NFSD: Limit the number of concurrent async COPY operations
    4fcb25459430 NFSD: Async COPY result needs to return a write verifier
    7f9b91ed15df NFSD: initialize copy->cp_clp early in nfsd4_copy for use by trace point
    2e7ce4e50d14 media: dvbdev: fix the logic when DVB_DYNAMIC_MINORS is not set
    c29a44d9a402 mmc: core: fix return value check in devm_mmc_alloc_host()
    b22ddca004d3 drm/bridge: tc358768: Fix DSI command tx
    938c13740f8b Revert "mmc: dw_mmc: Fix IDMAC operation with pages bigger than 4K"
    0a5014ad37c7 nilfs2: fix null-ptr-deref in block_dirty_buffer tracepoint
    344558d81c7c ocfs2: fix UBSAN warning in ocfs2_verify_volume()
    b017697a517f nilfs2: fix null-ptr-deref in block_touch_buffer tracepoint
    d4b42f926adc KVM: VMX: Bury Intel PT virtualization (guest/host mode) behind CONFIG_BROKEN
    c96f90911dd1 vdpa/mlx5: Fix PA offset with unaligned starting iotlb map
    28d4ed71ae0b ocfs2: uncache inode which has failed entering the group
    5fe8bcc82f1d x86/mm: Fix a kdump kernel failure on SME system when CONFIG_IMA_KEXEC=y
    ffad2ac8c859 net/mlx5e: kTLS, Fix incorrect page refcounting
    a508c74ceae2 net/mlx5: fs, lock FTE when checking if active
    6e3f2c512d2b netlink: terminate outstanding dump on socket close
    b5214ca796fb clk: qcom: gcc-qcs404: fix initial rate of GPLL3
    3e7f845614ee leds: lp55xx: Remove redundant test for invalid channel number
    5dabb7af57bc ftrace: Fix regression with module command in stack_trace_filter
    5f86e79c0b22 ovl: Filter invalid inodes with missing lookup function
    2cc30545dd3a media: uvcvideo: Stop stream during unregister
    74a65313578b media: platform: allegro-dvt: Fix possible memory leak in allocate_buffers_internal()
    da56bb858954 media: gspca: ov534-ov772x: Fix off-by-one error in set_frame_rate()
    580d1e5cf2cd media: venus: Fix pm_runtime_set_suspended() with runtime pm enabled
    5a53f97cd597 media: ts2020: fix null-ptr-deref in ts2020_probe()
    5c9ab34c87af media: i2c: tc358743: Fix crash in the probe error path when using polling
    b240a0472f8e arm64: dts: allwinner: pinephone: Add mount matrix to accelerometer
    711d99f845cd Linux 5.10.230
    918326996932 9p: fix slab cache name creation for real
    d02492863023 mm: krealloc: Fix MTE false alarm in __do_krealloc
    b17397a0a5c5 io_uring: fix possible deadlock in io_register_iowq_max_workers()
    dd7a728d5c0d md/raid10: improve code of mrdev in raid10_sync_request
    8ea0b8e32bed net: usb: qmi_wwan: add Fibocom FG132 0x0112 composition
    9db25c2b41c3 fs: Fix uninitialized value issue in from_kuid and from_kgid
    35b4795a7ebf vDPA/ifcvf: Fix pci_read_config_byte() return code handling
    7e222d2c7f9a powerpc/powernv: Free name on error in opal_event_init()
    b718f71747b7 sound: Make CONFIG_SND depend on INDIRECT_IOMEM instead of UML
    dc834af641d7 crypto: marvell/cesa - Disable hash algorithms
    4d8f6679b03a bpf: use kvzmalloc to allocate BPF verifier environment
    0bf6971b7d1e HID: multitouch: Add quirk for HONOR MagicBook Art 14 touchpad
    2bc339b00fbd 9p: Avoid creating multiple slab caches with the same name
    2f4bfcc4c5fa net: phy: ti: take into account all possible interrupt sources
    16a8ebc88fe2 ALSA: usb-audio: Add endianness annotations
    eb1bdcb7dfc3 vsock/virtio: Initialization of the dangling pointer occurring in vsk->trans
    414476c4fb11 hv_sock: Initializing vsk->trans to NULL to prevent a dangling pointer
    0d71863c19be ALSA: usb-audio: Add quirks for Dell WD19 dock
    4dc9c1e83aeb ALSA: usb-audio: Support jack detection on Dell dock
    6a7e6dcf90fe ocfs2: remove entry once instead of null-ptr-dereference in ocfs2_xa_remove()
    e068a87cf25e irqchip/gic-v3: Force propagation of the active state with a read-back
    bb17f42135f5 USB: serial: option: add Quectel RG650V
    6d5bd4bc14d7 USB: serial: option: add Fibocom FG132 0x0112 composition
    c5748d95608c USB: serial: qcserial: add support for Sierra Wireless EM86xx
    e567fc8f7a44 USB: serial: io_edgeport: fix use after free in debug printk
    d76923164705 usb: typec: fix potential out of bounds in ucsi_ccg_update_set_new_cam_cmd()
    6e2848d1c8c0 usb: musb: sunxi: Fix accessing an released usb phy
    5dd3f5a9244a fs/proc: fix compile warning about variable 'vmcore_mmap_ops'
    faff5bbb2762 media: uvcvideo: Skip parsing frames of type UVC_VS_UNDEFINED in uvc_parse_format
    547087307bc1 net: do not delay dst_entries_add() in dst_release()
    83aa0c996417 perf session: Add missing evlist__delete when deleting a session
    2297d80a13a6 Revert "perf hist: Add missing puts to hist__account_cycles"
    82090f94c723 net: bridge: xmit: make sure we have at least eth header len bytes
    11eab327a2a8 spi: fix use-after-free of the add_lock mutex
    c8dce228db6f spi: Fix deadlock when adding SPI controllers on SPI buses
    982a2757e725 splice: don't generate zero-len segement bvecs
    bf0b0c6d1597 btrfs: reinitialize delayed ref list after deleting it from the list
    8fc5ea9231af nfs: Fix KMSAN warning in decode_getfattr_attrs()
    485d9232112b io_uring/rw: fix missing NOWAIT check for O_DIRECT start write
    f336622838e5 io_uring: use kiocb_{start,end}_write() helpers
    f83a32351efd fs: create kiocb_{start,end}_write() helpers
    955089c2403c io_uring: rename kiocb_end_write() local helper
    6f383f653d03 dm-unstriped: cast an operand to sector_t to prevent potential uint32_t overflow
    483b7261b35a dm cache: fix potential out-of-bounds access on the first resume
    f136d8d3f26f dm cache: optimize dirty bit checking with find_next_bit when resizing
    ee1f74925717 dm cache: fix out-of-bounds access to the dirty bitset when resizing
    5b975f146d82 dm cache: correct the number of origin blocks to match the target length
    2ac7f253dead drm/amdgpu: prevent NULL pointer dereference if ATIF is not supported
    17f5f18085ac drm/amdgpu: add missing size check in amdgpu_debugfs_gprwave_read()
    1829c36f9329 pwm: imx-tpm: Use correct MODULO value for EPWM mode
    054931ca3cfc media: v4l2-tpg: prevent the risk of a division by zero
    5a9bd375bf88 media: pulse8-cec: fix data timestamp at pulse8_setup()
    828047c70f47 media: cx24116: prevent overflows on SNR calculus
    f54e8e1e39da media: s5p-jpeg: prevent buffer overflows
    3a977b554f66 ASoC: stm32: spdifrx: fix dma channel release in stm32_spdifrx_remove
    ac40b9dff274 ALSA: firewire-lib: fix return value on fail in amdtp_tscm_init()
    c1eba9f0e235 scsi: sd_zbc: Use kvzalloc() to allocate REPORT ZONES buffer
    8e823ce93cc8 media: adv7604: prevent underflow condition when reporting colorspace
    e351002b3a7a media: dvb_frontend: don't play tricks with underflow values
    a4a17210c03a media: dvbdev: prevent the risk of out of memory access
    ae6fd157eae4 media: stb0899_algo: initialize cfr before using it
    63b122f53793 Revert "ALSA: hda/conexant: Mute speakers at suspend / shutdown"
    30606ea3fae5 net: arc: fix the device for dma_map_single/dma_unmap_single
    71d08334c2cb net: phy: ti: add PHY_RST_AFTER_CLK_EN flag
    d3f517f904df net: phy: ti: implement generic .handle_interrupt() callback
    f398d0a5b783 net: phy: export phy_error and phy_trigger_machine
    590a4b2d4e0b net: hns3: fix kernel crash when uninstalling driver
    cf6bae33c5aa can: c_can: fix {rx,tx}_errors statistics
    40b283ba7666 sctp: properly validate chunk size in sctp_sf_ootb()
    22f4e2f86ad8 net: enetc: set MAC address to the VF net_device
    1e4332581cd4 security/keys: fix slab-out-of-bounds in key_task_permission
    d7dc68d82ab3 HID: core: zero-initialize the report buffer
    7830bfc3e7e7 ARM: dts: rockchip: Fix the realtek audio codec on rk3036-kylin
    92f5b6978293 ARM: dts: rockchip: Fix the spi controller on rk3036
    c34f7b904748 ARM: dts: rockchip: drop grf reference from rk3036 hdmi
    db87a9fb6a58 ARM: dts: rockchip: fix rk3036 acodec node
    7ddbc813ba64 arm64: dts: imx8mp: correct sdhc ipg clk
    e38f91b78388 arm64: dts: rockchip: Fix LED triggers on rk3308-roc-cc
    fbccf9647f0f arm64: dts: rockchip: Remove #cooling-cells from fan on Theobroma lion
    752c5bfb600f arm64: dts: rockchip: Fix bluetooth properties on Rock960 boards
    ebb427d5f270 arm64: dts: rockchip: Remove hdmi's 2nd interrupt on rk3328
    9d0d15f26b86 arm64: dts: rockchip: Fix rt5651 compatible value on rk3399-sapphire-excavator
    b874a7e65b4f Linux 5.10.229
    7948c22cc70b mac80211: always have ieee80211_sta_restart()
    1e5a17dc77d8 vt: prevent kernel-infoleak in con_font_get()
    a508a102edf8 drm/shmem-helper: Fix BUG_ON() on mmap(PROT_WRITE, MAP_PRIVATE)
    1d0d406bfc6b Revert "drm/mipi-dsi: Set the fwnode for mipi_dsi_device"
    bda1a99a0dd6 mm: shmem: fix data-race in shmem_getattr()
    aa0cee46c5d3 nilfs2: fix kernel bug due to missing clearing of checked flag
    bfd1d223d80c x86/bugs: Use code segment selector for VERW operand
    70767689ec6e ocfs2: pass u64 to ocfs2_truncate_inline maybe overflow
    d592b2e9212f riscv: Remove duplicated GET_RM
    170ad7e7a662 riscv: Remove unused GENERATING_ASM_OFFSETS
    7e6bb3443185 riscv: Use '%u' to format the output of 'cpu'
    1e617230b783 riscv: efi: Set NX compat flag in PE/COFF header
    c345728678df riscv: vdso: Prevent the compiler from inserting calls to memset()
    35770ca6180c mm: avoid leaving partial pfn mappings around in error case
    69d4e1ce9087 mm: add remap_pfn_range_notrack
    c72e0df0b56c nilfs2: fix potential deadlock with newly created symlinks
    edc84c1c1a85 iio: light: veml6030: fix microlux value calculation
    442f786c5bff staging: iio: frequency: ad9832: fix division by zero in ad9832_calc_freqreg()
    d0231f43df47 wifi: iwlegacy: Clear stale interrupts before resuming device
    4112450da7d6 wifi: ath10k: Fix memory leak in management tx
    c21efba8b5a8 wifi: mac80211: do not pass a stopped vif to the driver in .get_txpower
    1cfc32930461 Revert "driver core: Fix uevent_show() vs driver detach race"
    796df8d64caa xhci: Use pm_runtime_get to prevent RPM on unsupported systems
    065789892e37 xhci: Fix Link TRB DMA in command ring stopped completion event
    efefde4d1b7c usb: phy: Fix API devm_usb_put_phy() can not release the phy
    2d4650d2b297 usbip: tools: Fix detach_port() invalid port error path
    603342ab037d misc: sgi-gru: Don't disable preemption in GRU driver
    aae9c5b472d6 NFS: remove revoked delegation from server's delegation list
    8395b6096959 net: amd: mvme147: Fix probe banner message
    0cac4a2718b2 firmware: arm_sdei: Fix the input parameter of cpuhp_remove_state()
    422f1b66b149 kasan: Fix Software Tag-Based KASAN with GCC
    8e99d41858eb compiler-gcc: remove attribute support check for `__no_sanitize_address__`
    4336f120937d compiler-gcc: be consistent with underscores use for `no_sanitize`
    e3e608cbad37 netfilter: nft_payload: sanitize offset and length before calling skb_checksum()
    a27a5c40ee4c net: skip offload for NETIF_F_IPV6_CSUM if ipv6 header contains extension
    b88262c950c3 net: support ip generic csum processing in skb_csum_hwoffload_help
    590976f92172 bpf: Fix out-of-bounds write in trie_get_next_key()
    ce691c814bc7 net/sched: stop qdisc_tree_reduce_backlog on TC_H_ROOT
    9cab53f03263 gtp: allow -1 to be specified as file description from userspace
    e2742758c9c8 ipv4: ip_tunnel: Fix suspicious RCU usage warning in ip_tunnel_init_flow()
    465d3a8eca3f ASoC: cs42l51: Fix some error handling paths in cs42l51_probe()
    45a628911d3c wifi: iwlwifi: mvm: Fix response handling in iwl_mvm_send_recovery_cmd()
    66e35e42f51e wifi: iwlwifi: mvm: disconnect station vifs if recovery failed
    02b121beda58 mac80211: Add support to trigger sta disconnect on hardware restart
    89e25a2ec2a2 mac80211: do drv_reconfig_complete() before restarting all
    1ac988c6b8ff RDMA/bnxt_re: synchronize the qp-handle table array
    8256f6166d02 RDMA/mlx5: Round max_rd_atomic/max_dest_rd_atomic up instead of down
    f121dee2f907 RDMA/cxgb4: Dump vendor specific QP details
    935ca968019f wifi: brcm80211: BRCM_TRACING should depend on TRACING
    fd3b368769ae wifi: mac80211: skip non-uploaded keys in ieee80211_iter_keys
    e38ccb226de5 mac80211: MAC80211_MESSAGE_TRACING should depend on TRACING
    ffbb1f15bae7 cgroup: Fix potential overflow issue when checking max_depth
    5b1e461fefb0 selftests/mm: fix incorrect buffer->mirror size in hmm2 double_map test
    8df5cd51fd70 xfrm: validate new SA's prefixlen using SA family when sel.family is unset
    4abbba710583 arm64/uprobes: change the uprobe_opcode_t typedef to fix the sparse warning
    03c9c2c2d2d0 ASoC: qcom: Fix NULL Dereference in asoc_qcom_lpass_cpu_platform_probe()
    f4b6a6493eb5 net: phy: dp83822: Fix reset pin definitions
    2fe399bb8efd serial: protect uart_port_dtr_rts() in uart_shutdown() too
    066314b0b76f selinux: improve error checking in sel_write_load()
    3eb6aa870057 hv_netvsc: Fix VF namespace also in synthetic NIC NETDEV_REGISTER event
    631330f5a635 ALSA: hda/realtek: Add subwoofer quirk for Acer Predator G9-593
    76ce386feb14 KVM: nSVM: Ignore nCR3[4:0] when loading PDPTEs from memory
    0f0374d09c82 openat2: explicitly return -E2BIG for (usize > PAGE_SIZE)
    9f2ab98371c2 nilfs2: fix kernel bug due to missing clearing of buffer delay flag
    1f440403be1f ACPI: button: Add DMI quirk for Samsung Galaxy Book2 to fix initial lid detection issue
    59a1b38d3a5f ACPI: resource: Add LG 16T90SP to irq1_level_low_skip_override[]
    234682910971 drm/amd: Guard against bad data for ATIF ACPI method
    c9085e2401b8 ALSA: hda/realtek: Update default depop procedure
    5e431f85c87b ALSA: firewire-lib: Avoid division by zero in apply_constraint_to_size()
    c7fcfdba35ab posix-clock: posix-clock: Fix unbalanced locking in pc_clock_settime()
    0da93d67da90 r8169: avoid unsolicited interrupts
    8a283a19026a net: sched: fix use-after-free in taprio_change()
    95b3f3ed5ac6 net: usb: usbnet: fix name regression
    77bc881d370e be2net: fix potential memory leak in be_xmit()
    db755e553490 net/sun3_82586: fix potential memory leak in sun3_82586_send_packet()
    9f95de15904a xfrm: respect ip protocols rules criteria when performing dst lookups
    6ba07c4a9eac xfrm: extract dst lookup parameters into a struct
    02874ca52df2 tracing: Consider the NULL character when validating the event length
    df848523d6b4 jfs: Fix sanity check in dbMount
    8605ca4bd0f4 arm64: Force position-independent veneers
    0329056e0730 ASoC: fsl_sai: Enable 'FIFO continue on error' FCONT bit
    75f828e944da drm/vboxvideo: Replace fake VLA at end of vbva_mouse_pointer_shape with real VLA
    649d64650623 iomap: update ki_pos a little later in iomap_dio_complete
    c9b77438077d exec: don't WARN for racy path_noexec check
    20e27c773945 block, bfq: fix procress reference leakage for bfqq in merge chain
    bf83ba3c55d4 KVM: s390: gaccess: Check if guest address is in memslot
    6e1659b674b6 KVM: s390: gaccess: Cleanup access to guest pages
    472088ffb1cc KVM: s390: gaccess: Refactor access address range check
    511ca935092a KVM: s390: gaccess: Refactor gpa and length calculation
    cf9ddf9ed94c arm64: probes: Fix uprobes for big-endian kernels
    7f1ef59185d2 arm64:uprobe fix the uprobe SWBP_INSN in big-endian
    6c151aeb6dc4 Bluetooth: bnep: fix wild-memory-access in proto_unregister
    5c345c47e884 s390: Initialize psw mask in perf_arch_fetch_caller_regs()
    6af43ec3bf40 usb: typec: altmode should keep reference to parent
    ed31aba8ce93 smb: client: fix OOBs when building SMB2_IOCTL request
    8c1e6717f60d scsi: target: core: Fix null-ptr-deref in target_alloc_device()
    4af714e82379 genetlink: hold RCU in genlmsg_mcast()
    b6321146773d net: systemport: fix potential memory leak in bcm_sysport_xmit()
    f48eaf4e88c3 net/smc: Fix searching in list of known pnetids in smc_pnet_add_pnetid
    aacf6e28aeda net: ethernet: aeroflex: fix potential memory leak in greth_start_xmit_gbit()
    56dbb74b6a4b macsec: don't increment counters for an unrelated SA
    2c7dd3ca6be9 drm/msm/dsi: fix 32-bit signed integer extension in pclk_rate calculation
    df6fed0a2a1a RDMA/bnxt_re: Fix a bug while setting up Level-2 PBL pages
    78aaf54ad5d7 RDMA/bnxt_re: Return more meaningful error
    718609f51866 ipv4: give an IPv4 dev to blackhole_netdev
    59df170bdec9 RDMA/cxgb4: Fix RDMA_CM_EVENT_UNREACHABLE error for iWARP
    9076d449e77b ARM: dts: bcm2837-rpi-cm3-io3: Fix HDMI hpd-gpio pin
    dbe51dd516e6 RDMA/bnxt_re: Add a check for memory allocation
    c17e5cbbb180 RDMA/bnxt_re: Fix incorrect AVID type in WQE structure
    f141044cc6d3 net: bridge: mcast: wait for previous gc cycles when removing port
    7640df3a194c net: atlantic: eliminate double free in error handling logic
    3cbcd4752671 RDMA/hns: Fix UAF for cq async event
    5a8fa04b2a4d Linux 5.10.228
    2abe57d62a45 ALSA: hda/conexant - Use cached pin control for Node 0x1d on HP EliteOne 1000 G2
    25e86fb0aeec powerpc/mm: Always update max/min_low_pfn in mem_topology_setup()
    c1d0476885d7 nilfs2: propagate directory read errors from nilfs_find_entry()
    c38add9ac0e4 tcp: fix mptcp DSS corruption due to large pmtu xmit
    fde99e972b8f mptcp: handle consistently DSS corruption
    609937aa962a mptcp: track and update contiguous data status
    b7d7b7fc876f irqchip/gic-v4: Don't allow a VMOVP on a dying VPE
    6f44a5fc15b5 x86/entry_32: Clear CPU buffers after register restore in NMI return
    9ab38a1cdb66 x86/entry_32: Do not clobber user EFLAGS.ZF
    846280578855 x86/apic: Always explicitly disarm TSC-deadline timer
    e475220d64be x86/resctrl: Annotate get_mem_config() functions as __init
    1826b6d69bbb parport: Proper fix for array out-of-bounds access
    9f8ddf14fa79 USB: serial: option: add Telit FN920C04 MBIM compositions
    0fc55ec9fcac USB: serial: option: add support for Quectel EG916Q-GL
    608b626f710d xhci: Fix incorrect stream context type macro
    fc2cb5e3af53 Bluetooth: btusb: Fix regression with fake CSR controllers 0a12:0001
    63d6a3b07838 Bluetooth: Remove debugfs directory on module init failure
    516655749a01 iio: adc: ti-ads124s08: add missing select IIO_(TRIGGERED_)BUFFER in Kconfig
    f80375f275fb iio: proximity: mb1232: add missing select IIO_(TRIGGERED_)BUFFER in Kconfig
    dc99dfa2ba66 iio: light: opt3001: add missing full-scale range value
    bf3ab8e1c28f iio: light: veml6030: fix IIO device retrieval from embedded device
    2d06787b70d8 iio: light: veml6030: fix ALS sensor resolution
    ffc4174309a9 iio: hid-sensors: Fix an error handling path in _hid_sensor_set_report_latency()
    9504153a480f iio: adc: ti-ads8688: add missing select IIO_(TRIGGERED_)BUFFER in Kconfig
    c27133637aba iio: dac: stm32-dac-core: add missing select REGMAP_MMIO in Kconfig
    c4c2211b1202 iio: dac: ltc1660: add missing select REGMAP_SPI in Kconfig
    3abc1ebea3fb iio: dac: ad5770r: add missing select REGMAP_SPI in Kconfig
    0782809c019b drm/vmwgfx: Handle surface check failure correctly
    df75c78bfeff drm/radeon: Fix encoder->possible_clones
    6ddcaee244ff io_uring/sqpoll: close race on waiting for sqring entries
    3bc6d0f8b70a blk-rq-qos: fix crash on rq_qos_wait vs. rq_qos_wake_function race
    eca3edf87679 x86/bugs: Do not use UNTRAIN_RET with IBPB on entry
    e7c0f8ca3bdd x86/bugs: Skip RSB fill at VMEXIT
    0ab77a47e3ff x86/entry: Have entry_ibpb() invalidate return predictions
    c5e57863d790 x86/cpufeatures: Add a IBPB_NO_RET BUG flag
    77fa26062032 x86/cpufeatures: Define X86_FEATURE_AMD_IBPB_RET
    dfa4b5d4ba1c KVM: s390: Change virtual to physical address access in diag 0x258 handler
    d04709509594 s390/sclp_vt220: Convert newlines to CRLF instead of LFCR
    b12ef2d4dfee io_uring/sqpoll: do not put cpumask on stack
    66b98c4f18b0 io_uring/sqpoll: retain test for whether the CPU is valid
    54a987b41db3 io_uring/sqpoll: do not allow pinning outside of cpuset
    71fbc3af3dac KVM: Fix a data race on last_boosted_vcpu in kvm_vcpu_on_spin()
    e8e599a63506 wifi: mac80211: fix potential key use-after-free
    417d5838ca73 mm/swapfile: skip HugeTLB pages for unuse_vma
    043f05526163 fat: fix uninitialized variable
    bf1a0222229d irqchip/gic-v3-its: Fix VSYNC referencing an unmapped VPE on GIC v4.1
    cafa5942bd2d net: macb: Avoid 20s boot delay by skipping MDIO bus registration for fixed-link PHY
    ce43c48cdc4d arm64: probes: Fix simulate_ldr*_literal()
    3728b4eb2791 arm64: probes: Remove broken LDR (literal) uprobe support
    673a1c5a2998 posix-clock: Fix missing timespec64 check in pc_clock_settime()
    dbe055567af8 net: enetc: add missing static descriptor and inline keyword
    5f47cdeeefd9 ALSA: hda/conexant - Fix audio routing for HP EliteOne 1000 G2
    6c8784a6662b watchdog: cpu5wdt.c: Fix use-after-free bug caused by cpu5wdt_trigger
    3b24ef662ec6 gfs2: Fix potential glock use-after-free on unmount
    03a85a51f33a fix vfsub build error
    12594a0e7118 sock_map: avoid race between sock_map_close and sk_psock_put
    7a346798c1e1 sock_map: Fix a potential use-after-free in sock_map_close()
    843556a46e16 bpf, sockmap: Don't let sock_map_{close,destroy,unhash} call itself
    4af417c06d37 of: module: add buffer overflow check in of_modalias()
    b29e4b50c556 scripts/gdb: fix SB_* constants parsing
    02fd398f5e2b bpf: Reject variable offset alu on PTR_TO_FLOW_KEYS
    2bba1cb1487b loop: Select I/O scheduler 'none' from inside add_disk()
    027f4dd7c993 blk-mq: Introduce the BLK_MQ_F_NO_SCHED_BY_DEFAULT flag
    2214ded26c86 tpm: tis_i2c: Limit write bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    44494049e815 tpm: tis_i2c: Limit read bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    0d7c23009d82 tpm: Add flag to use default cancellation policy
    07914bef4e16 tpm: tis_i2c: Fix sanity check interrupt enable mask
    35f85f04bd69 tpm: Add tpm_tis_i2c backend for tpm_tis_core
    7b04c6c08107 tpm: Add tpm_tis_verify_crc to the tpm_tis_phy_ops protocol layer
    4790cb2d1283 tpm: Remove read16/read32/write32 calls from tpm_tis_phy_ops
    50f74deaf308 hwmon: Add driver for Texas Instruments TMP464 and TMP468
    a4e6e4b7bb08 dt-bindings: hwmon: add tmp464.yaml
    e0ed2149d7b5 drm/amdkfd: Check for null pointer after calling kmemdup
    c6ddded89322 ARM: renumber bits related to _TIF_WORK_MASK
    35b96a325c1e arm64: make _TIF_WORK_MASK bits contiguous
    f5a8f06aa595 arm64: uaccess: remove vestigal UAO support
    3a330b569301 arm64: uaccess: remove redundant PAN toggling
    9cbbb016d6e7 arm64: uaccess: remove addr_limit_user_check()
    fd83411f5e08 arm64: uaccess: remove set_fs()
    15a6dc2f4b53 arm64: uaccess cleanup macro naming
    912a6ab683a4 arm64: uaccess: split user/kernel routines
    d004ab02dae2 arm64: uaccess: refactor __{get,put}_user
    e1941a8b459e arm64: uaccess: simplify __copy_user_flushcache()
    dfae822b4c59 arm64: uaccess: rename privileged uaccess routines
    1efdb8f0a0c7 arm64: sdei: explicitly simulate PAN/UAO entry
    b35fec69554c arm64: sdei: move uaccess logic to arch/arm64/
    b5a28033fe7b arm64: head.S: always initialize PSTATE
    243eb8553513 arm64: head.S: cleanup SCTLR_ELx initialization
    74a00405d97f arm64: head.S: rename el2_setup -> init_kernel_el
    73c5f386d175 arm64: add C wrappers for SET_PSTATE_*()
    e17fb7543df1 arm64: ensure ERET from kthread is illegal
    eff6289cc53b ixgbevf: add disable link state
    262595681381 ixgbe: add improvement for MDD response functionality
    b9d78b06dea8 ixgbe: add the ability for the PF to disable VF link state
    d829911485da Documentation: arm64: Document PMU counters access from userspace
    fe5d29bfce20 arm64: perf: Enable PMU counter userspace access for perf event
    15ce6d04ed6a arm64: perf: Add userspace counter access disable switch
    4f288acbeed8 perf: Add a counter for number of user access events in context
    354ba4a8c4b8 x86: perf: Move RDPMC event flag to a common definition
    d29cec94c49b libperf xyarray: Add bounds checks to xyarray__entry()
    8264d2b91841 libperf: Add support for user space counter access
    7fd81b678b5f libperf tests: Add support for verbose printing
    6029ff53a48f libperf: Add evsel mmap support
    28b0c8956369 tools include: Add an initial math64.h
    492e532d20f1 perf record: Improve 'Workload failed' message printing events + what was exec'ed
    d0a1fc61733e perf evlist: Add a method to return the list of evsels as a string
    81a77b39be0a perf annotate: Fix sample events lost in stdio mode
    2883e69e202d pnmtologo: use relocatable file name
    80f5207b5abd tools: use basename to identify file in gen-mach-types
    4d201ec392f1 vt/conmakehash: improve reproducibility
    ae24d013888f lib/build_OID_registry: fix reproducibility issues
    5d72da88dbb4 x86/boot: Wrap literal addresses in absolute_pointer()
    dc0bd7aa2319 ACPI: thermal: drop an always true check
    0c4288cceef5 xfs: Fix -Werror=dangling-pointer work-around for older GCC
    5509050b3392 xfs: Work around GCC 12 -Werror=dangling-pointer for xfs_attr_remote.o
    669827c6e293 virtio-pci: Remove wrong address verification in vp_del_vqs()
    1c80d994d3db regulator: consumer: Add missing stubs to regulator/consumer.h
    3303d0e2aeff ipv6: Fix stats accounting in ip6_pkt_drop
    c56e60f665e7 memcg: enable accounting of ipc resources
    e6c8ebd210a2 tick/nohz: WARN_ON --> WARN_ON_ONCE to prevent console saturation
    1655ee30e684 sched/isolation: really align nohz_full with rcu_nocbs
    253c752ed120 pstore/ftrace: Add and use ftrace_test_recursion_trylock_safe
    356e8a12bd66 pstore/ftrace: Add recursion protection to the ftrace callback
    334706a1e873 ftrace: Add ftrace_test_recursion_trylock() helper function
    78c260d7f60b ftrace: Move the recursion testing into global headers
    c0b313d988a1 powerpc/mm: Switch obsolete dssall to .long
    1bd813fe8d0e riscv: fix build with binutils 2.38
    835a2d1b24c6 powerpc/lib/sstep: fix 'ptesync' build error
    fd84b99a8ccb drm/amd/display: Don't allow partial copy_from_user
    024f4ff63d55 drm/amdgpu: Fix even more out of bound writes from debugfs
    0c0ad634e899 e1000e: Serialize TGP e1000e PM ops
    add88b0536fa e1000e: Make mei_me active when e1000e is in use
    a8f317c1a17e yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    c8400a2cbe1f iommu/arm-smmu-v3: Ratelimit event dump
    b8ec7e43e95e regmap: teach regmap to use raw spinlocks if requested in the config
    4b7fa7684be7 OF: DT-Overlay configfs interface (v7)
    d515a5c0e9a9 net: xilinx_emaclite: Do not print real IOMEM pointer
    11329e49959b drivers: net: xilinx_emaclite: remove arch limitation
    29dc69bf2a07 drivers: net: xilinx_emaclite: Add COMPILE_TEST support
    ff106eff01f6 drivers: net: xilinx_emaclite: Fix -Wpointer-to-int-cast warnings with W=1
    c27462391070 serial: 8250: 8250_omap: Fix possible array out of bounds access
    16976d8e307f perf intel-pt: Use aux_watermark
    d421a2346946 perf: Cap allocation order at aux_watermark
    6da8d5f29481 timers: Fix get_next_timer_interrupt() with no timers pending
    af141841735a eventfd: Enlarge recursion limit to allow vhost to work
    a125a6102808 iwlwifi: select MAC80211_LEDS conditionally
    139fe7d68413 rcu: Fix stall-warning deadlock due to non-release of rcu_node ->lock
    8d0c79931235 console: Fix build when CONFIG_BLK_DEV_INITRD is disabled.
    ea777841e8ea yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    ab49d2db98bd cgroup1: fix leaked context root causing sporadic NULL deref in LTP
    bdda1b6cf99b aufs5: aufs-core
    2fa276071d07 aufs5: aufs-standalone
    06ed4d532456 aufs5: aufs-mmap
    372857834999 aufs5: aufs-kbuild
    fd68c9840693 aufs5: aufs-base
    a673c127156c Revert "aufs5: core"
    cf62bfcde384 Revert "aufs5: aufs5-base"
    a644419ec785 Revert "aufs5: aufs5-mmap"
    b893f9a999bb Revert "aufs5: aufs5-standalone"
    c60db0819480 Revert "aufs: initial port to v5.10"
    c66a5900f139 Revert "Revert "aufs: initial port to v5.10""
    1320cf58f5dd Revert "aufs: linux-v5.10-rc1, no more set_fs()"
    02349d7738ff Revert "for aufs: linux-v5.10-rc1, no more vfs_(read|write)f_t"
    f01dab74750c Revert "aufs: linux-v5.10-rc1, no more f_op->read() and ->write()"
    3d5de709b676 Revert "aufs5: aufs5-kbuild"
    a97f1329edf7 tracing/arm: Have max stack tracer handle the case of return address after data
    5c54112a05ab net: Treat __napi_schedule_irqoff() as __napi_schedule() on PREEMPT_RT
    ddac76981cb3 sched/isolation: reconcile rcu_nocbs= and nohz_full=
    56fd8c36614e net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    a8808e541750 aufs: linux-v5.10-rc1, no more f_op->read() and ->write()
    cb1c41dac775 for aufs: linux-v5.10-rc1, no more vfs_(read|write)f_t
    a5805df6583f aufs: linux-v5.10-rc1, no more set_fs()
    64e145dcca8c Revert "aufs: initial port to v5.10"
    d6e20b2257ec defconfig: add dependency for CONFIG_ACPI_APEI_PCIEAER
    b237d48208d0 arm64/mm: Drop THP conditionality from FORCE_MAX_ZONEORDER
    1209195ed0f7 driver: adc: ltc2497: return directly after reading the adc conversion value
    a60fe3fcf113 Revert "mfd: syscon: Don't free allocated name for regmap_config"
    13d68767aa4a rcutorture: Use "all" and "N" in "nohz_full" and "rcu_nocbs"
    54e69571a97d rcu: deprecate "all" option to rcu_nocbs=
    a605b9d20447 lib: test_bitmap: add tests for "N" alias
    8c22517f444e lib: bitmap: support "N" as an alias for size of bitmap
    88187167e63a lib: bitmap: move ERANGE check from set_region to check_region
    ca5429633613 lib: bitmap: fold nbits into region struct
    9381134cea8a lib: test_bitmap: add more start-end:offset/len tests
    c825800730ab lib: test_bitmap: add tests to trigger ERANGE case.
    8cc8264dca3f lib: test_bitmap: clearly separate ERANGE from EINVAL tests.
    470da7b7f2ff Revert "cpumask: Un-inline cpulist_parse for SMP; prepare for ascii helpers"
    28dc1d37602d Revert "cpumask: Make "all" alias global and not just RCU"
    dbfe0b183fca Revert "cpumask: Add a "none" alias to complement "all""
    a57711fcff30 Revert "cpumask: Add "last" alias for cpu list specifications"
    34523d7c8476 qemux86: add configuration symbol to select values
    cdca78778415 objtool: Fix seg fault with Clang non-section symbols
    d3287798bd88 x86/entry: Emit a symbol for register restoring thunk
    2ad99ddaac78 cpumask: Add "last" alias for cpu list specifications
    c10e9481810b cpumask: Add a "none" alias to complement "all"
    b00ceed9d388 cpumask: Make "all" alias global and not just RCU
    8b215206e797 cpumask: Un-inline cpulist_parse for SMP; prepare for ascii helpers
    1b5024caeda8 clear_warn_once: add a clear_warn_once= boot parameter
    fc0dd76cce0e clear_warn_once: bind a timer to written reset value
    d64fc2d2b14a clear_warn_once: expand debugfs to include read support
    77592e956cc9 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    6e022759f727 perf: x86-32: explicitly include <errno.h>
    22d6bbb947d4 perf: mips64: Convert __u64 to unsigned long long
    c35f9150001c perf: fix bench numa compilation
    c4caef513eb1 perf: add SLANG_INC for slang.h
    07dfbf9405dd perf: add sgidefs.h to for mips builds
    42c5431ad2cf perf: change --root to --prefix for python install
    af79bfe90143 perf: add 'libperl not found' warning
    ddfbd9e75f08 perf: force include of <stdbool.h>
    0f34e6305176 fat: don't use obsolete random32 call in namei_vfat
    b5b55eaad1df FAT: Added FAT_NO_83NAME
    756b13bfab6e FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    fabad71cb2b5 FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    06fd68d75bd1 aufs: initial port to v5.10
    c9126877d1f5 aufs5: core
    f5150173c643 aufs5: aufs5-standalone
    b57d26b072d9 aufs5: aufs5-mmap
    78f128c4b8e5 aufs5: aufs5-base
    47aa35171d08 aufs5: aufs5-kbuild
    35c480a23c66 yaffs: include blkdev.h
    2c64c43540a5 yaffs: fix misplaced variable declaration
    bde410ee9f59 yaffs2: v5.6 build fixups
    414c8e866931 yaffs2: fix memory leak when /proc/yaffs is read
    c99c1990cf7c yaffs: add strict check when call yaffs_internal_read_super
    498f5fafe50a yaffs: repair yaffs_get_mtd_device
    7ca3c08ebbf9 yaffs: Fix build failure by handling inode i_version with proper atomic API
    0ba47e881bb8 yaffs2: fix memory leak in mount/umount
    39a5406665dd yaffs: Avoid setting any ACL releated xattr
    ca5b43ddc6fd Yaffs:check oob size before auto selecting Yaffs1
    c2619c05a53e fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    5e08fb7b8ee0 yaffs2: adjust to proper location of MS_RDONLY
    5f1a1a9678a8 yaffs2: import git revision b4ce1bb (jan, 2020)
    fc21f09ae369 initramfs: allow an optional wrapper script around initramfs generation
    73887fca03be arm64/perf: Fix wrong cast that may cause wrong truncation
    a267cafaac44 defconfigs: drop obselete options
    eb5d1bc00c3f arm64/perf: fix backtrace for AAPCS with FP enabled
    062b2c98c087 linux-yocto: Handle /bin/awk issues
    d3beb253ae71 uvesafb: provide option to specify timeout for task completion
    75ccbf377a51 uvesafb: print error message when task timeout occurs
    18ffa2e88024 compiler.h: Undef before redefining __attribute_const__
    3ed931201746 vmware: include jiffies.h
    938942859596 Resolve jiffies wrapping about arp
    069a883d837c nfs: Allow default io size to be configured.
    3b568edcd3e9 check console device file on fs when booting
    77ec93228920 mount_root: clarify error messages for when no rootfs found
    17a15e0f7536 menuconfig,mconf-cfg: Allow specification of ncurses location
    8f13b1349a74 modpost: mask trivial warnings
    b6c9e0fa24e8 kbuild: exclude meta directory from distclean processing
    62dbbdbec60a powerpc: serialize image targets
    27b8dec5dbb3 arm: serialize build targets
    fc365512e4c4 Revert "platform/x86: wmi: Destroy on cleanup rather than unregister"
    9a6e91d2e691 crtsavres: fixups for 5.4+
    7dbc3cd0398f powerpc/ptrace: Disable array-bounds warning with gcc8
    ebe3bcb89cb0 powerpc: Disable attribute-alias warnings from gcc8
    65ba0e7de081 powerpc: add crtsavres.o to archprepare for kbuild
    6bd3efdce5a9 powerpc: kexec fix for powerpc64
    41671522c159 powerpc: Add unwind information for SPE registers of E500 core
    8851006b0109 mips: vdso: fix 'jalr $t9' crash in vdso code
    ed5db62477e8 mips: Kconfig: add QEMUMIPS64 option
    2a7ca094fc42 4kc cache tlb hazard: tlbp cache coherency
    b742d60d3f70 malta uhci quirks: make allowance for slow 4k(e)c
    8a160fc86eb6 arm/Makefile: Fix systemtap
    b9805882353c vexpress: Pass LOADADDR to Makefile
    332e618aa7ae arm: ARM EABI socketcall
    1ec682cb85f8 ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 629a59a9b7..772fc4e2ef 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2ae1270a98b8e62cfecf36a485731a99ff0ab6a8"
-SRCREV_meta ?= "f5f141c395405345203f11703ca4bf609fef3fc2"
+SRCREV_machine ?= "c8a23ffc90611d97d4e0d8b05e5aa30db4795e87"
+SRCREV_meta ?= "876ae2ac4c2844426ff953a696e455b44d953527"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.227"
+LINUX_VERSION ?= "5.10.234"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index eacd59014e..a78839e32e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.227"
+LINUX_VERSION ?= "5.10.234"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "5bb97dac8754ff70fb2ccdef76702bc9a96ce3f7"
-SRCREV_machine ?= "42d448fa7ff4633abcbf0a7a02ce0b2509df44a9"
-SRCREV_meta ?= "f5f141c395405345203f11703ca4bf609fef3fc2"
+SRCREV_machine:qemuarm ?= "0fbe19fce229dff1334f2081e5adbfb46a2c8f05"
+SRCREV_machine ?= "28106c79dd3b31d2e27dcd34f7f22a3b4f36b8df"
+SRCREV_meta ?= "876ae2ac4c2844426ff953a696e455b44d953527"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 29091261c4..db911b2952 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -14,23 +14,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "b08a4f767c2ecd86d0272a65f9e3cd98f1a06e66"
-SRCREV_machine:qemuarm64 ?= "77acdf2e0c5738d3e6c766ff55c0ba1ebe43bd56"
-SRCREV_machine:qemumips ?= "1e873174e49fe04bfa47306c92f2e761f23abe40"
-SRCREV_machine:qemuppc ?= "393a202ffe7f28b0158df1e97ce0b24edaf59ff9"
-SRCREV_machine:qemuriscv64 ?= "cfcd5579a447eb3768773c3be44e59a4addcf85a"
-SRCREV_machine:qemuriscv32 ?= "cfcd5579a447eb3768773c3be44e59a4addcf85a"
-SRCREV_machine:qemux86 ?= "cfcd5579a447eb3768773c3be44e59a4addcf85a"
-SRCREV_machine:qemux86-64 ?= "cfcd5579a447eb3768773c3be44e59a4addcf85a"
-SRCREV_machine:qemumips64 ?= "4f1163b1c00922dbf33f5ff55807584d3e287430"
-SRCREV_machine ?= "cfcd5579a447eb3768773c3be44e59a4addcf85a"
-SRCREV_meta ?= "f5f141c395405345203f11703ca4bf609fef3fc2"
+SRCREV_machine:qemuarm ?= "b4af137a7000a057b16cdf9ea98c13e3a28b9dfc"
+SRCREV_machine:qemuarm64 ?= "a579f2fb36a6c0dd9556c1297792f21b2d226126"
+SRCREV_machine:qemumips ?= "89051a4abbbdca6951cce16403a27f83e126ab5b"
+SRCREV_machine:qemuppc ?= "3266c5dcef1362dc6bfb69a47ae042ef372424dd"
+SRCREV_machine:qemuriscv64 ?= "0ef80b08429534f460a78de68ee5c6a05f722eb0"
+SRCREV_machine:qemuriscv32 ?= "0ef80b08429534f460a78de68ee5c6a05f722eb0"
+SRCREV_machine:qemux86 ?= "0ef80b08429534f460a78de68ee5c6a05f722eb0"
+SRCREV_machine:qemux86-64 ?= "0ef80b08429534f460a78de68ee5c6a05f722eb0"
+SRCREV_machine:qemumips64 ?= "4bae0f4714f4afc50c02ea884ec8ba6026d2ec16"
+SRCREV_machine ?= "0ef80b08429534f460a78de68ee5c6a05f722eb0"
+SRCREV_meta ?= "876ae2ac4c2844426ff953a696e455b44d953527"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.227"
+LINUX_VERSION ?= "5.10.234"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.43.0


