Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EA15CAC5B1
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 19:05:43 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.49.1758654337999502606
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 12:05:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W74YP9eY;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-84ac859df55so296573485a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 12:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758654337; x=1759259137; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MeVvL2mL6PCW7VRDQT8v/Lps6SZR7cdlFlBtn3132Bg=;
        b=W74YP9eYhEMwWq+Vr5TrtBWReTCqTtqT5S5K65fsleh/s/F9o9ZJb161BF6nmXRI1v
         psp1GjNc8zYUZS8NWyrFiQWVFMwzB+eztKEmvwypCMw49Km7IyVI8tAW3GXIvrWv5Nad
         wvXU6/AAzFW3DGNibhRf3YdUUxt2pTiC2chKRWyYSCmBb/yEHIXOxk7DIup5MUBJXAdi
         0v+VQHYprmiVY9nX3S12+Pejb2vbixYrtnLlrlgyGLEpgxkP5uzZgnD1H6aHItSEurVf
         MiBQu2hQoyL+deSFEEbtG5MQYJofyXAuUzp/q4AT7VieGGitDDk6+CyE15K8sWze97Ly
         MxfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758654337; x=1759259137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MeVvL2mL6PCW7VRDQT8v/Lps6SZR7cdlFlBtn3132Bg=;
        b=OrtBUsu+DbMx4sLnOaOn8Y+63DXEiXea+awTl6Bt1Gvimgby50kcUmiZhVtig97e1U
         UQTbvpD6w8zicL9Gb/1Uyo4jfxIVOtZke5Ba3ypdsIFX7nRmUfN78Y7CbpuWPdONKS/g
         BQvNvBdC0eH650T9RNSXpXWnmPgp9gQ5dK4gMe1ntKvmhMtoDV1FbfgBANPH2Lux44R7
         usdshc4PEjhZQzy9+HOO7ChruGG9FFjdEEsQ8OWqyFBEIdMUG/fa3SfsIWxP49UWxbjm
         gqkC4dxolzjuoB5sV/mhepwsUZg6ErKOIzW+Bt2twu8si0eC/bDi9k5FNdZFzyadIkoY
         PSww==
X-Gm-Message-State: AOJu0YxUqHbnKFeqTeRACc/h4btuhj6SqEY+nmLWTFC+JAwhT/HwW7Qs
	byuBkOQyiP5BKj3oZhMDnziQvsW/UKNPe16bOG6A8oPqtu3waBowAKXUBnpR0gJMof8=
X-Gm-Gg: ASbGncs3nfw0zdZ+9aeXJ2vCajV3h5e28Ow7IDwkGfCn3NAP5DZY6OMTOiyxNCz2vOC
	EQOMLY9CE/oqT4Z4H8sLGVChnKY3qAV3FyCb+QAiOR6dMdWTL6Jkki+z6WyY05ClHGpLFzYFWbh
	Qr30NHJ5tEzvU+8Iov6xBleUN7kgw5dDkwfKIm/uHO8HpIhoT9irFIS6f5a0jejzrsMQZgsScZa
	Zmip+ggM5IW3pIsiPaOa8V+A0Bw8/82FZnhegBpKdXpID2uloJiz+CKphidm/a+Rd4HWpJtk2nU
	h7OudSPDCZqOTT+XitAPNFUWr7GzpHmGMJjK5xIUszzPfbDGuF639ERRRgddF9zVjkpyfvns2tK
	l+ntybqkmXrmItjMoYrSLqeLEVWdmUAOncvpFB07rI575x7H0pLtEdwxq3sGiKsmkKgwZ6i+1zn
	PBa2NILruoVPzW5bNk06UcJcsnG10eCk7QwNWNOIL5iV6sNRFUctdmfoOjtthku7fx0Q==
X-Google-Smtp-Source: AGHT+IFEJY531jL2iyi7K1/FftOvpkpBBjQBLGqvci/UpB5+1ezTGsmmNhbyHQWsKzAEobZfbB9pQA==
X-Received: by 2002:a05:6214:250c:b0:77b:69ec:79aa with SMTP id 6a1803df08f44-7e6ff32e21dmr44463166d6.11.1758654336603;
        Tue, 23 Sep 2025 12:05:36 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7b0c0934e27sm55463576d6.64.2025.09.23.12.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 12:05:36 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] linux-yocto/6.16: update to v6.16.8
Date: Tue, 23 Sep 2025 15:05:29 -0400
Message-Id: <22d36a7645a26833aec1763ffe2c1f97d720fec3.1758654194.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1758654194.git.bruce.ashfield@gmail.com>
References: <cover.1758654194.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 19:05:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223916

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.16 to the latest korg -stable release that comprises
the following commits:

no ids found, dumping:
    62dae0198231 Linux 6.16.8
    51a321b480d1 netfilter: nft_set_pipapo: fix null deref for empty set
    9c495549ba30 phy: ti-pipe3: fix device leak at unbind
    f4b78402d51a phy: ti: omap-usb2: fix device leak at unbind
    07e00526807e phy: tegra: xusb: fix device and OF node leak at probe
    ac22507821ac phy: qcom: qmp-pcie: Fix PHY initialization when powered down by firmware
    6e446062d2f2 dmaengine: dw: dmamux: Fix device reference leak in rzn1_dmamux_route_allocate
    0ff9df758af7 dmaengine: qcom: bam_dma: Fix DT error handling for num-channels/ees
    0ab708a2f145 usb: gadget: midi2: Fix MIDI2 IN EP max packet size
    ab8c7c4d8f1e usb: gadget: midi2: Fix missing UMP group attributes initialization
    6958b4577438 usb: typec: tcpm: properly deliver cable vdms to altmode drivers
    b17e79b48f80 USB: gadget: dummy-hcd: Fix locking bug in RT-enabled kernels
    b78c7dcda9bd xhci: fix memory leak regression when freeing xhci vdev devices depth first
    7dc3bd0f7bd5 xhci: dbc: Fix full DbC transfer ring after several reconnects
    ad6a6e97c219 xhci: dbc: decouple endpoint allocation from initialization
    91c34cd6ca1b erofs: fix runtime warning on truncate_folio_batch_exceptionals()
    2dbafe64b081 regulator: sy7636a: fix lifecycle of power good gpio
    d5e82f3f2c91 dmaengine: ti: edma: Fix memory allocation size for queue_priority_map
    db5d7abd379a erofs: fix invalid algorithm for encoded extents
    c5fff1c37e18 erofs: unify meta buffers in z_erofs_fill_inode()
    1d5a938cdf97 erofs: remove need_kmap in erofs_read_metabuf()
    30fb1a3d2268 erofs: get rid of {get,put}_page() for ztailpacking data
    9f0e22563547 dmaengine: idxd: Fix double free in idxd_setup_wqs()
    b86c1c38bebc dmaengine: idxd: Fix refcount underflow on module unload
    da4fbc1488a4 dmaengine: idxd: Remove improper idxd_free
    a5f293d3931a phy: qualcomm: phy-qcom-eusb2-repeater: fix override properties
    68a6729afd3e hsr: hold rcu and dev lock for hsr_get_port_ndev
    43242aed9060 hsr: use hsr_for_each_port_rtnl in hsr_port_get_hsr
    4fb6bcc1e68f hsr: use rtnl lock when iterating over ports
    3f9f4764f847 netfilter: nf_tables: restart set lookup on base_seq change
    f6cb89b449bd netfilter: nf_tables: make nft_set_do_lookup available unconditionally
    d68ec0dfc30b netfilter: nf_tables: place base_seq in struct net
    3bc63fbb4151 netfilter: nf_tables: Reintroduce shortened deletion notifications
    39f40f1e4b75 netfilter: nft_set_rbtree: continue traversal if element is inactive
    7700fce94447 netfilter: nft_set_pipapo: don't check genbit from packetpath lookups
    9eab0ef1dc7e netfilter: nft_set_pipapo: don't return bogus extension pointer
    610c1e196fc8 netfilter: nft_set_pipapo: merge pipapo_get/lookup
    06f714dbe6f3 netfilter: nft_set: remove one argument from lookup and update functions
    52f951a0ed36 netfilter: nft_set_pipapo: remove unused arguments
    a3e1019e1757 netfilter: nft_set_bitmap: fix lockdep splat due to missing annotation
    668cc1e3bb21 can: xilinx_can: xcan_write_frame(): fix use-after-free of transmitted SKB
    c85c52f0ca8e can: j1939: j1939_local_ecu_get(): undo increment when j1939_local_ecu_get() fails
    d22a56bc38f6 can: j1939: j1939_sk_bind(): call j1939_priv_put() immediately when j1939_local_ecu_get() failed
    da9e8f429139 can: j1939: implement NETDEV_UNREGISTER notification handler
    20e8ba3ad883 selftests: can: enable CONFIG_CAN_VCAN as a module
    d7624629ccf4 macsec: sync features on RTM_NEWLINK
    2d92fa0cdc02 net: dev_ioctl: take ops lock in hwtstamp lower paths
    2df3698f0978 drm/amd/display: use udelay rather than fsleep
    cb5eb693f2bc drm/xe/configfs: Don't touch survivability_mode on fini
    c62580674ce5 i40e: fix IRQ freeing in i40e_vsi_request_irq_msix error path
    e85da543ecda igb: fix link test skipping when interface is admin down
    473be7d39efd igb: Fix NULL pointer dereference in ethtool loopback test
    f56cfc744a53 docs: networking: can: change bcm_msg_head frames member to support flexible array
    ebfd979282d0 tunnels: reset the GSO metadata before reusing the skb
    f75a327ca756 net: bridge: Bounce invalid boolopts
    4eec1e293def net: dsa: b53: fix ageing time for BCM53101
    8858c1e94059 genetlink: fix genl_bind() invoking bind() after -EPERM
    79c76e51a04c PCI: mvebu: Fix use of for_each_of_range() iterator
    214ecffefcc5 wifi: ath12k: fix WMI TLV header misalignment
    c273003e6ba3 wifi: ath12k: Add support to enqueue management frame at MLD level
    4a7ec2624b9f wifi: ath12k: add link support for multi-link in arsta
    35002c806c8c wifi: ath12k: Fix missing station power save configuration
    052ac41c379c net: phy: transfer phy_config_inband() locking responsibility to phylink
    56fe63b05ec8 net: phylink: add lock for serializing concurrent pl->phydev writes with resolver
    eb148d85e126 net: fec: Fix possible NPD in fec_enet_phy_reset_after_clk_enable()
    8d7ebe7d3216 drm/panthor: validate group queue count
    0cd36f52fece mtd: rawnand: nuvoton: Fix an error handling path in ma35_nand_chips_init()
    c62608a41b38 USB: serial: option: add Telit Cinterion LE910C4-WWX new compositions
    a1ae1d69f480 USB: serial: option: add Telit Cinterion FN990A w/audio compositions
    cd970dceda44 dt-bindings: serial: brcm,bcm7271-uart: Constrain clocks
    9999c6a4a4d2 serial: sc16is7xx: fix bug in flow control levels init
    89d76f908987 tty: hvc_console: Call hvc_kick in hvc_write unconditionally
    b236f23533e8 Revert "net: usb: asix: ax88772: drop phylink use in PM to avoid MDIO runtime PM wakeups"
    b845eff955a2 Input: xpad - add support for Flydigi Apex 5
    c68680238f29 Input: i8042 - add TUXEDO InfinityBook Pro Gen10 AMD to i8042 quirk table
    a31042588e85 Input: iqs7222 - avoid enabling unused interrupts
    d85d6b2b4dcb x86/cpu/topology: Always try cpu_parse_topology_ext() on AMD/Hygon
    3a0c45133c0d fs/resctrl: Eliminate false positive lockdep warning when reading SNC counters
    b4669950ba63 hrtimers: Unconditionally update target CPU base after offline timer migration
    81972cf13427 drm/amd/amdgpu: Declare isp firmware binary file
    a1afbe276180 drm/amd/display: Drop dm_prepare_suspend() and dm_complete()
    b70912396389 drm/amd/display: Destroy cached state in complete() callback
    40cb9b38b645 mm/damon/reclaim: avoid divide-by-zero in damon_reclaim_apply_parameters()
    4e87f461d619 mm/damon/sysfs: fix use-after-free in state_show()
    96a2bc2dcefe mtd: spinand: winbond: Fix oob_layout for W25N01JW
    4fb20a449bf4 mtd: spinand: winbond: Enable high-speed modes on w25n0xjw
    589560e63ebd mtd: spinand: Add a ->configure_chip() hook
    dd1616ecbea9 ceph: fix crash after fscrypt_encrypt_pagecache_blocks() error
    289b6615cf55 ceph: always call ceph_shift_unused_folios_left()
    1315d252a0e2 ceph: fix race condition where r_parent becomes stale before sending message
    2bfe45987eb3 ceph: fix race condition validating r_parent before applying state
    6bd8b56899be libceph: fix invalid accesses to ceph_connection_v1_info
    ac5cda4fae88 kernfs: Fix UAF in polling when open file is released
    8193ddffd50d btrfs: fix corruption reading compressed range when block size is smaller than page size
    d50721cbc9d6 btrfs: use readahead_expand() on compressed extents
    ac507e577072 drm/amd/display: Disable DPCD Probe Quirk
    016760c55593 drm/dp: Add an EDID quirk for the DPCD register access probe
    92d790f16c1c drm/edid: Add support for quirks visible to DRM core and drivers
    25def270d1d6 drm/edid: Define the quirks in an enum list
    c686124bcf06 drm/amd/display: remove oem i2c adapter on finish
    b74a1d7e4615 drm/amd/display: Correct sequences and delays for DCN35 PG & RCG
    b1dc92f55b22 drm/amdgpu/vcn4: Fix IB parsing with multiple engine info packages
    8bc263e037aa drm/amdgpu/vcn: Allow limiting ctx to instance 0 for AV1 at any time
    7333eb67987c drm/amdgpu: fix a memory leak in fence cleanup when unloading
    6535ab1c4348 drm/xe: Block exec and rebind worker while evicting for suspend / hibernate
    53a4568e8a7d drm/xe: Allow the pm notifier to continue on failure
    21ca89dd42da drm/xe: Attempt to bring bos back to VRAM after eviction
    4b49e9812a29 drm/i915/power: fix size for for_each_set_bit() in abox iteration
    c4901802ed1c drm/mediatek: fix potential OF node use-after-free
    326a4b3750c7 mm/damon/lru_sort: avoid divide-by-zero in damon_lru_sort_apply_parameters()
    17cb8b1751ff mm/damon/core: set quota->charged_from to jiffies at first charge window
    98cbd2fd3726 mm/memory-failure: fix redundant updates for already poisoned pages
    63a327a2375a mm/memory-failure: fix VM_BUG_ON_PAGE(PagePoisoned(page)) when unpoison memory
    33b95d90427c mm/vmalloc, mm/kasan: respect gfp mask in kasan_populate_vmalloc()
    36e84dac92bc mm/khugepaged: fix the address passed to notifier on testing young
    35437e7c665c mm/hugetlb: add missing hugetlb_lock in __unmap_hugepage_range()
    24e5758a5371 fuse: prevent overflow in copy_file_range return value
    b74616c44326 fuse: check if copy_file_range() returns larger than requested size
    036426d7a63d fuse: do not allow mapping a non-regular backing file
    d1d5d12b62ec mtd: rawnand: stm32_fmc2: fix ECC overwrite
    f6fd98d961fa mtd: rawnand: stm32_fmc2: avoid overlapping mappings on ECC buffer
    26773947c036 mtd: nand: raw: atmel: Respect tAR, tCLR in read setup timing
    5796b86e0af4 smb: client: fix data loss due to broken rename(2)
    81492813c6e5 smb: client: fix compound alignment with encryption
    28725db8800e s390: kexec: initialize kexec_buf struct
    75465ae51baa wifi: iwlwifi: fix 130/1030 configs
    e9985d9e766f PM: hibernate: Restrict GFP mask in hibernation_snapshot()
    1f6a55e9ce45 PM: EM: Add function for registering a PD without capacity update
    2878c584b192 net: usb: asix: ax88772: drop phylink use in PM to avoid MDIO runtime PM wakeups
    782369a022f9 net: libwx: fix to enable RSS
    3f9ba4a0d91f i2c: rtl9300: remove broken SMBus Quick operation support
    c91382328fc8 i2c: rtl9300: ensure data length is within supported range
    09cd964cb1e9 i2c: i801: Hide Intel Birch Stream SoC TCO WDT
    f1498abaf74f btrfs: fix subvolume deletion lockup caused by inodes xarray race
    203cee72cf98 btrfs: fix squota compressed stats leak
    9efcb7a8b973 ocfs2: fix recursive semaphore deadlock in fiemap call
    9911a97bff4c netlink: specs: mptcp: fix if-idx attribute type
    259bcc4213c9 doc: mptcp: net.mptcp.pm_type is deprecated
    4349cfe4a7cc mptcp: sockopt: make sync_socket_options propagate SOCK_KEEPOPEN
    340cc9a3bd30 arm64: kexec: initialize kexec_buf struct in load_other_segments()
    b217baf7a5be compiler-clang.h: define __SANITIZE_*__ macros only when undefined
    f3d6e1ca25d0 Revert "SUNRPC: Don't allow waiting for exiting tasks"
    3a5ae41ce2e6 i2c: rtl9300: fix channel number bound check
    827b6bdafbfa EDAC/altera: Delete an inappropriate dma_free_coherent() call
    d2b1ce9a5e29 proc: fix type confusion in pde_set_flags()
    de89e58368f8 tcp_bpf: Call sk_msg_free() when tcp_bpf_send_verdict() fails to allocate psock->cork.
    ac70cd446f83 bpf: Tell memcg to use allow_spinning=false path in bpf_timer_init()
    f0c4f309baa8 bpf: Allow fall back to interpreter for programs with stack size <= 512
    bd00e7f05aed rqspinlock: Choose trylock fallback for NMI waiters
    932cb57e675a xsk: Fix immature cq descriptor production
    c4be24ef0510 bpf: Fix out-of-bounds dynptr write in bpf_crypto_crypt
    9c48608e3243 cpufreq/amd-pstate: Fix a regression leading to EPP 0 after resume
    f77faf6ac076 s390/cpum_cf: Deny all sampling events by counter PMU
    daf116fceaad s390/pai: Deny all events not handled by this PMU
    a330f6a521ee cpufreq/amd-pstate: Fix setting of CPPC.min_perf in active mode for performance governor
    9cb1894a6e0e bpf, cpumap: Disable page_pool direct xdp_return need larger scope
    793338906ff5 tracing: Silence warning when chunk allocation fails in trace_pid_write
    81ce19265f7f NFSv4/flexfiles: Fix layout merge mirror check.
    fc3bc5d24902 NFS: nfs_invalidate_folio() must observe the offset and size arguments
    5ae2ee9e1cd6 NFSv4.2: Serialise O_DIRECT i/o and copy range
    55efebe6b38d NFSv4.2: Serialise O_DIRECT i/o and clone range
    76cf0de31d5a NFSv4.2: Serialise O_DIRECT i/o and fallocate()
    b84f67a50907 NFS: Serialise O_DIRECT i/o and truncate()
    e33228a2cc7f tracing/osnoise: Fix null-ptr-deref in bitmap_parselist()
    ad3327a576cd ftrace/samples: Fix function size computation
    c250be1d75bf nfs/localio: restore creds before releasing pageio data
    cc2e81c337da tracing: Fix tracing_marker may trigger page fault during preempt_disable
    9ff5594c3219 NFSv4: Clear the NFS_CAP_XATTR flag if not supported by the server
    e3e52726d933 NFSv4: Clear NFS_CAP_OPEN_XOR and NFS_CAP_DELEGTIME if not supported
    3b78e8610140 NFSv4: Clear the NFS_CAP_FS_LOCATIONS flag if it is not set
    b4ae273a42f3 trace/fgraph: Fix error handling
    223be11c53a3 md: keep recovery_cp in mdp_superblock_s
    357391fcea77 NFSv4: Don't clear capabilities that won't be reset
    6e38f4c7c73f SUNRPC: call xs_sock_process_cmsg for all cmsg
    8dd0b071c84c flexfiles/pNFS: fix NULL checks on result of ff_layout_choose_ds_for_read
    a3a4d494d167 Revert "drm/amdgpu: Add more checks to PSP mailbox"
    2878ce119203 Bluetooth: ISO: Fix getname not returning broadcast fields
    657e7734dc07 Bluetooth: hci_conn: Fix running bis_cleanup for hci_conn->type PA_LINK
    e594d07a06a4 iommu/vt-d: Make iotlb_sync_map a static property of dmar_domain
    d6aa8aac347c iommu/vt-d: Split paging_domain_compatible()
    6a285ee6413d iommu/vt-d: Create unique domain ops for each stage
    a108585cdaf8 iommu/vt-d: Split intel_iommu_domain_alloc_paging_flags()
    700c8d4bf81e Bluetooth: hci_conn: Fix not cleaning up Broadcaster/Broadcast Source
    bd06c32a07f3 irqchip/mvebu-gicp: Fix an IS_ERR() vs NULL check in probe()
    b2de0c9ce8e5 perf: Fix the POLL_HUP delivery breakage
    a60e426d22f1 dma-debug: don't enforce dma mapping check on noncoherent allocations
    a4407f377496 fhandle: use more consistent rules for decoding file handle from userns
    623719227b11 fuse: Block access to folio overlimit
    7d7c1fb85cba coredump: don't pointlessly check and spew warnings
    17ecefc9fdd8 block: don't silently ignore metadata for sync read/write
    a7e894512d1b fs: add a FMODE_ flag to indicate IOCB_HAS_METADATA availability

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.16.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.16.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.16.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
index e541805938..e3cc651f76 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3b7f5e9e65320c4b0d5daf517e60a5f683ee1031"
-SRCREV_meta ?= "5cfae705d58ce214867b7b25653efb03b613c6df"
+SRCREV_machine ?= "d9ac79e651b849ad8b16bc3f96af4cc54c30148e"
+SRCREV_meta ?= "abd3e56cdb1c200bac4e2496005649e3261cb9c3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.16;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.16.7"
+LINUX_VERSION ?= "6.16.8"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
index 643f6e7923..a63d7a198b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.16.inc
 
-LINUX_VERSION ?= "6.16.7"
+LINUX_VERSION ?= "6.16.8"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "946b80132b9ce459ba84f90d4b2f63eeace6014d"
-SRCREV_meta ?= "5cfae705d58ce214867b7b25653efb03b613c6df"
+SRCREV_machine ?= "ff2318af3a2513c944b2598ab3df356dd7f15f34"
+SRCREV_meta ?= "abd3e56cdb1c200bac4e2496005649e3261cb9c3"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
index ff4b8afc5f..580df960ae 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.16/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.16/standard/base"
 KBRANCH:qemumips64 ?= "v6.16/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "71e0898274de9dc6edff0f2d9d6fa213dae11272"
-SRCREV_machine:qemuarm64 ?= "946b80132b9ce459ba84f90d4b2f63eeace6014d"
-SRCREV_machine:qemuloongarch64 ?= "946b80132b9ce459ba84f90d4b2f63eeace6014d"
-SRCREV_machine:qemumips ?= "c2ab3a7b951876e2fcbcae9bfa816f8484cc66cc"
-SRCREV_machine:qemuppc ?= "946b80132b9ce459ba84f90d4b2f63eeace6014d"
-SRCREV_machine:qemuriscv64 ?= "946b80132b9ce459ba84f90d4b2f63eeace6014d"
-SRCREV_machine:qemuriscv32 ?= "946b80132b9ce459ba84f90d4b2f63eeace6014d"
-SRCREV_machine:qemux86 ?= "946b80132b9ce459ba84f90d4b2f63eeace6014d"
-SRCREV_machine:qemux86-64 ?= "946b80132b9ce459ba84f90d4b2f63eeace6014d"
-SRCREV_machine:qemumips64 ?= "14ae3e2469aa1e43fcb65a030d9c184bbec3585f"
-SRCREV_machine ?= "946b80132b9ce459ba84f90d4b2f63eeace6014d"
-SRCREV_meta ?= "5cfae705d58ce214867b7b25653efb03b613c6df"
+SRCREV_machine:qemuarm ?= "5fa52c596c9c560c6969fbcf0927c2d546e5d9a9"
+SRCREV_machine:qemuarm64 ?= "ff2318af3a2513c944b2598ab3df356dd7f15f34"
+SRCREV_machine:qemuloongarch64 ?= "ff2318af3a2513c944b2598ab3df356dd7f15f34"
+SRCREV_machine:qemumips ?= "f421b1fee99c72d86eb152bb4828fdc078a268a8"
+SRCREV_machine:qemuppc ?= "ff2318af3a2513c944b2598ab3df356dd7f15f34"
+SRCREV_machine:qemuriscv64 ?= "ff2318af3a2513c944b2598ab3df356dd7f15f34"
+SRCREV_machine:qemuriscv32 ?= "ff2318af3a2513c944b2598ab3df356dd7f15f34"
+SRCREV_machine:qemux86 ?= "ff2318af3a2513c944b2598ab3df356dd7f15f34"
+SRCREV_machine:qemux86-64 ?= "ff2318af3a2513c944b2598ab3df356dd7f15f34"
+SRCREV_machine:qemumips64 ?= "e6f7e24a7b76c6d1b3eaa3716fa1c4185de94aa5"
+SRCREV_machine ?= "ff2318af3a2513c944b2598ab3df356dd7f15f34"
+SRCREV_meta ?= "abd3e56cdb1c200bac4e2496005649e3261cb9c3"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "131e2001572ba68b6728bcba91c58647168d237f"
+SRCREV_machine:class-devupstream ?= "62dae019823123ce3baa50e680219e2beb9a63a5"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.16/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.16;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.16.7"
+LINUX_VERSION ?= "6.16.8"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


