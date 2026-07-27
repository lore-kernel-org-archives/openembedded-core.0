Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB3E5C531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:56:41 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43764.1785192999737837819
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ooGGz+Et;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso19000785e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785192998; x=1785797798; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g95VyMbvrxM2YikndhKI7lHHFFVIPQnUgY0EDI94Qo4=;
        b=ooGGz+EtepbCMVd+wG8foAc5rTOfFWfQGVjmg7moeCJ6Sp7H8ifYv4vf7lROVwlY5M
         oVThDbWw7epISStASrdcJBoqzgvlsmMXsbml7yGMg2O0T4EtKgPLDyilUxynECvZ7y9g
         JSDrn70pqsvJZY7DRC2iXAfPgc3caTly2VgiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785192998; x=1785797798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=g95VyMbvrxM2YikndhKI7lHHFFVIPQnUgY0EDI94Qo4=;
        b=m4E5cpQuYdN5RjFmnUdk2rAt6X8OQuhr5VZQo/Y1uJ3FJLDuiXWL2liNLqnlJxfkgw
         7pvKCJGdIKOog1xiXw846pZnNWcS7gHuOLqmFE13EgxDCS+H/8fA9uNHLOVxOiWF6d97
         LuYaBQM7j/WIbRVCJJXuVyzSYi642apMwjLtDn7Ks+Izep8uluP9wcTK8LxLoMzKd6NL
         iKyMuaYgPJy5Z62oW/fwVkjR9VV8q8jON8DmEbeAbz5QqJh+JrtWD2Om4cBW7Y+HBkbh
         nyAdXrxnYvDp0/+WBaWLShJwhbStqt0ETndBLHElbeodkvCLC2UHgFY45J0NGieaOSmR
         bLfg==
X-Gm-Message-State: AOJu0Yy74Zi6sMKNnuyU0azqJFrREfc9pBPB4OTU3BkdvE1oE1mQ2pZV
	BwYlO4L27bOIxo85JvfSzFBzoG9+7/Jsp4rEZer2o7p+DD88J8VOImWeAwt8SOgZJ+UueSquPYg
	n4n8tdfE=
X-Gm-Gg: AR+sD111LLB6V0bRkcvorJTKN4jgdcz6t8o+76fSRSp8ZOM/FO0CqXWOgEKTkWdKj6s
	SYoxbXCKjvkDM3xS/37ckbcC8e0xCXdzbtssV3ipQ7epK1KjA4d6Ipimd3tNAppbfT1tltRHzQx
	8P4+1LFuAkRW4KzPbErBgQVY6XoRoO3QMvoJYKwcfTU2Mq2/yzkg+9ucLXm6nCacI2y/7QWpDhZ
	p7AXPOrqvbowlaBhtZljw2JIgCx7gIHHJ197cnmqUXh6hbq/howoR05SlzDg+iMPtXyDYElF/fr
	7BhMMrzscPNj6p2pBqpzaZmNr7/NJD5EF/u+oZqAxf3XMTzOVVZHOVGeinZrz0QO11DZf0C7Wjm
	Immjg0kdr5JMPbKKGByBPxFu5mH4qwQtnwirm0YDvj+Ftt66rOOJZbL+aq3cuh7tqN3VjtE47Ox
	FZN+LfNP4iIB1bjWOuK0VLBfcuEZ4qtDKCvyp+MQ6U7dDc0QSQqWCn9AeYAb7eWvWVRgWIb5pd8
	JZAp3mANv/EN8FA
X-Received: by 2002:a05:600c:4685:b0:496:c361:fb96 with SMTP id 5b1f17b1804b1-496c4c2ffe3mr10110985e9.0.1785192997707;
        Mon, 27 Jul 2026 15:56:37 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45de1a3sm31513055e9.11.2026.07.27.15.56.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:56:36 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 26/36] linux-yocto/6.18: update to v6.18.36
Date: Tue, 28 Jul 2026 00:55:40 +0200
Message-ID: <ac4183f53df75de491357939c51cd0bb7900f47b.1785190123.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785190123.git.yoann.congal@smile.fr>
References: <cover.1785190123.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242143

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.18 to the latest korg -stable release that comprises
the following commits:

    275d294b2b24 Linux 6.18.36
    5d634afb8b83 netfilter: require Ethernet MAC header before using eth_hdr()
    bf7a9cacd95e cfi: Include uaccess.h for get_kernel_nofault()
    f455405e3207 vsock/virtio: fix skb overhead overflow on 32-bit builds
    36a0faaa4e3d block: fix handling of dead zone write plugs
    7b569b3a2f29 arm64: errata: Mitigate TLBI errata on Microsoft Azure Cobalt 100 CPU
    99abe00c605e arm64: errata: Mitigate TLBI errata on NVIDIA Olympus CPU
    d4fd42822040 arm64: errata: Mitigate TLBI errata on various Arm CPUs
    8097f93f9b77 arm64: cputype: Add C1-Premium definitions
    e9ea7cb17677 arm64: cputype: Add C1-Ultra definitions
    eca6743b148a vsock/virtio: fix skb overhead accounting to preserve full buf_alloc
    9bdc637fde66 vsock/virtio: fix potential unbounded skb queue
    cdce1e797add ipvs: skip ipv6 extension headers for csum checks
    afd35fec9297 RDMA/umem: Fix truncation for block sizes >= 4G
    cd26d54bfbc2 RDMA: Move DMA block iterator logic into dedicated files
    ebf22feff492 RDMA/umem: fix kernel-doc warnings
    84d8f58cf28a netfilter: nft_fib: fix stale stack leak via the OIFNAME register
    2904e985a291 RDMA: During rereg_mr ensure that REREG_ACCESS is compatible
    f58efaf9fcf7 RDMA/umem: Add helpers for umem dmabuf revoke lock
    5f3286ca5fbb RDMA/umem: Move umem dmabuf revoke logic into helper function
    ceddd32231dd RDMA/umem: Add ib_umem_dmabuf_get_pinned_and_lock helper
    0ffcad63b19a sched_ext: Don't warn on NULL cgrp_moving_from in scx_cgroup_move_task()
    37c059d4d92f wifi: mac80211: tests: mark HT check strict
    4dac39a4db14 wifi: mac80211: skip ieee80211_verify_sta_ht_mcs_support check in non-strict mode
    17faa39ba980 driver core: reject devices with unregistered buses
    20a93e397abe fs/fcntl: fix SOFTIRQ-unsafe lock order in fasync signaling
    e09689286385 drm/amd/display: Use krealloc_array() in dal_vector_reserve()
    454d3b3d499c drm/amd/display: Fix out-of-bounds read in dp_get_eq_aux_rd_interval()
    bb6f705b73b5 drm/amd/display: Fix NULL deref and buffer over-read in SDP debugfs
    c000da79df78 drm/amd/display: add missing CSC entries for BT.2020 for DCE IPs
    3f32d52ec604 drm/amd/display: Clamp VBIOS HDMI retimer register count to array size
    1906064d50d1 drm/amd/display: Clamp HDMI HDCP2 rx_id_list read to buffer size
    0e56f460bddb drm/amd/display: Bound VBIOS record-chain walk loops
    57607fe55e6d drm/amd/pm: smu_v14_0_0: use SoftMin for gfxclk in set_soft_freq_limited_range
    932642791cb1 drm/amd/pm: mark metrics.energy_accumulator is invalid for smu 14.0.2
    8979ded4d899 drm/amd/pm: fix smu13 power limit default/cap calculation
    39b5397bf8de drm/amdgpu: set noretry=1 as default for GFX 10.1.x (Navi10/12/14)
    fcd51a085e9a drm/amdgpu: restart the CS if some parts of the VM are still invalidated
    68455b117258 drm/amdgpu: fix waiting for all submissions for userptrs
    9655b56b6de9 drm/v3d: Skip CSD when it has zeroed workgroups
    90b629269088 drm/v3d: Fix vaddr leak when indirect CSD has zeroed workgroups
    3e1947573140 drm/v3d: Fix global performance monitor reference counting
    11e9bdf8824b drm/v3d: Wait for pending L2T flush before cleaning caches
    4c10fd55187a drm/xe: Clear pending_disable before signaling suspend fence
    0f68ddfaaebf drm/xe/display: fix oops in suspend/shutdown without display
    d3efcadfe3ee drm/amdkfd: Fix buffer overflow in SDMA queue checkpoint/restore on GFX11
    72e259a32084 drm/amdkfd: fix NULL dereference in get_queue_ids()
    c0639ede2f24 drm/gem: Try to fix change_handle ioctl, attempt 4
    9f0d45d509b4 slimbus: qcom-ngd-ctrl: Avoid ABBA on tx_lock/ctrl->lock
    8f4b371f4939 slimbus: qcom-ngd-ctrl: Balance pm_runtime enablement for NGD
    5204cd22c1c7 slimbus: qcom-ngd-ctrl: Correct PDR and SSR cleanup ownership
    dd8e1025a84e slimbus: qcom-ngd-ctrl: Initialize controller resources in controller
    24ec89123fc9 slimbus: qcom-ngd-ctrl: Register callbacks after creating the ngd
    3bb2ac834ed3 slimbus: qcom-ngd-ctrl: Fix probe error path ordering
    d6cb003e4661 slimbus: qcom-ngd-ctrl: Fix up platform_driver registration
    6890bd2451a9 slimbus: qcom-ngd-ctrl: fix OF node refcount
    b5daa920f44c thunderbolt: Limit XDomain response copy to actual frame size
    46da5c3ea011 thunderbolt: Validate XDomain request packet size before type cast
    fcbd0cdab928 thunderbolt: Clamp XDomain response data copy to allocation size
    60ba62174607 thunderbolt: Bound root directory content to block size
    2e0ddac549eb thunderbolt: Reject zero-length property entries in validator
    d5ea0b3e261f sctp: stream: fully roll back denied add-stream state
    78c4f964b2f9 sctp: diag: reject stale associations in dump_one path
    566c4c1244de rxrpc: Fix the ACK parser to extract the SACK table for parsing
    1bf84f4013fa rtase: Reset TX subqueue when clearing TX ring
    54f9cdcd7311 rtase: Avoid sleeping in get_stats64()
    ddcf84b25af0 pmdomain: ti_sci: add wakeup constraint to parent devices of wakeup source
    0d11992d1898 pmdomain: imx: fix OF node refcount
    0aecf3c7b8f8 mmc: sdhci: add signal voltage switch in sdhci_resume_host
    535ff092b686 mmc: renesas_sdhi: Add OF entry for RZ/G2H SoC
    2f72d36f8acc mmc: litex_mmc: Set mandatory idle clocks before CMD0
    7f8007be13e6 mmc: dw_mmc-rockchip: Add missing private data for very old controllers
    c677b13671dc mmc: core: Fix host controller programming for fixed driver type
    a8f91ddf67f6 mm/mincore: handle non-swap entries before !CONFIG_SWAP guard
    c19ff4351214 mm/list_lru: drain before clearing xarray entry on reparent
    c72469ac0f27 mm/hugetlb: restore reservation on error in hugetlb folio copy paths
    ecc24f0a8a30 mm/hugetlb: avoid false positive lockdep assertion
    66bc00ea37fa mm/damon/reclaim: handle ctx allocation failure
    6d48f1565939 mm/damon/lru_sort: handle ctx allocation failure
    d83390b21a02 mm/cma_debug: fix invalid accesses for inactive CMA areas
    52078596dce1 mm/cma: fix reserved page leak on activation failure
    d5d37b7b72a9 io_uring/wait: fix min_timeout behavior
    c888d5198ffc io_uring/kbuf: don't truncate end buffer for bundles
    3fdcca838f97 pinctrl: mcp23s08: Read spi-present-mask as u8 not u32
    e646b86b3b48 octeontx2-af: fix memory leak in rvu_setup_hw_resources()
    4a4d21f531cc nvmem: layouts: onie-tlv: fix hang on unknown types
    cb85ef5a227b nvmem: core: fix use-after-free bugs in error paths
    bef389a210e7 net: sfp: initialize i2c_block_size at adapter configure time
    1d4ec754ee38 net: rds: clear i_sends on setup unwind
    52b8f5ef82c8 net: phonet: free phonet_device after RCU grace period
    4a73cacb5586 net: mv643xx: fix OF node refcount
    bcb8fad90f27 net: bonding: fix NULL pointer dereference in bond_do_ioctl()
    01f7d4b50458 net: airoha: Add NULL check for of_reserved_mem_lookup() in airoha_qdma_init_hfwd_queues()
    e0df4d9c0909 net/mlx5: Reorder completion before putting command entry in cmd_work_handler
    0a46c7a5646d firmware: samsung: acpm: Fix mailbox channel leak on probe error
    d5de9cb5355d misc: fastrpc: Fix NULL pointer dereference in rpmsg callback
    53e06f8a3c2b misc: fastrpc: fix DMA address corruption due to find_vma misuse
    992f121796b7 misc: fastrpc: fix use-after-free race in fastrpc_map_create
    5278ccd357e0 misc: fastrpc: fix use-after-free of fastrpc_user in workqueue context
    89bd8215e25a memcg: use round-robin victim selection in refill_stock
    a388e3dfaf95 locking/rtmutex: Skip remove_waiter() when waiter is not enqueued
    db752ebfdaf2 ipc/shm: serialize orphan cleanup with shm_nattch updates
    ab61c990a87d iommu/dma: Do not try to iommu_map a 0 length region in swiotlb
    f35a368fee8a Input: atkbd - skip deactivate for HONOR BCC-N's internal keyboard
    a3dff1e1a554 Input: atkbd - add DMI quirk for Lenovo Yoga Air 14 (83QK)
    7f59e4f72a78 i2c: tegra: Fix NOIRQ suspend/resume
    6018d73137cd i2c: stm32f7: fix timing computation ignoring i2c-analog-filter
    a162a260c8c4 i2c: qcom-cci: Fix NULL pointer dereference in cci_remove()
    9fa82cf393ba i2c: imx: fix clock and pinctrl state inconsistency in runtime PM
    b39f30c0a72f i2c: imx-lpi2c: fix resource leaks switching to devm_dma_request_chan()
    16f8e17184b3 futex/requeue: Prevent NULL pointer dereference in remove_waiter() on self-deadlock
    56763afa0134 fuse: limit FUSE_NOTIFY_RETRIEVE to uptodate folios
    12df4cfa738a fuse: reject fuse_notify() pagecache ops on directories
    57a9c085be07 fs/qnx6: fix pointer arithmetic in directory iteration
    2990f143ec86 pidfd: refuse access to tasks that have started exiting harder
    89b909e97045 inet: frags: fix use-after-free caused by the fqdir_pre_exit() flush
    df422fd273c9 IB/isert: Reject login PDUs shorter than ISER_HEADERS_LEN
    32138633e51e fhandle: fix UAF due to unlocked ->mnt_ns read in may_decode_fh()
    3884976f8744 bnxt_en: Fix NULL pointer dereference
    6f72b902c34d ASoC: fsl_sai: Fix 32 slots TDM broken by integer shift UB in xMR write
    735dabdf2156 staging: rtl8723bs: fix buffer over-read in rtw_update_protection
    1d6c2062b77b timers/migration: Fix livelock in tmigr_handle_remote_up()
    ba9ad6015937 vsock/vmci: fix sk_ack_backlog leak on failed handshake
    265c07c09c83 wifi: nl80211: reject oversized EMA RNR lists
    ac2000be0cbe wifi: iwlwifi: pcie: simplify the resume flow if fast resume is not used
    fcfdff42e841 xfs: fix rtgroup cleanup in CoW fork repair
    d84ed2f9718e xfs: fix error returns in CoW fork repair
    9f21885c11ba mptcp: add-addr: always drop other suboptions
    6ea1134f1b5f selftests: mptcp: add test for extra_subflows underflow on userspace PM
    7bbc11437a20 mptcp: sockopt: set sockopt on all subflows
    f591cbc088c9 mptcp: sockopt: check timestamping ret value
    c0c152fc4ae6 mptcp: pm: fix extra_subflows underflow on userspace PM subflow creation
    653245266913 mptcp: allow subflow rcv wnd to shrink
    3b8cbba7c0ed mptcp: close TOCTOU race while computing rcv_wnd
    edaf0c955ace mptcp: fix retransmission loop when csum is enabled
    95f27fcda681 arm64: mm: call pagetable dtor when freeing hot-removed page tables
    517720913bd3 ARM: 9475/1: entry: use byte load for KASAN VMAP stack shadow
    da295adc9dab ARM: 9474/1: io: avoid KASAN instrumentation of raw halfword I/O
    6243a363ec90 ARM: socfpga: Fix OF node refcount leak in SMP setup
    6822eed69572 udp: clear skb->dev before running a sockmap verdict
    c96786d6ff1a zram: fix use-after-free in zram_bvec_write_partial()
    f92a285db7ff RDMA/srp: bound SRP_RSP sense copy by the received length
    bd5e818be796 RDMA/core: Validate cpu_id against nr_cpu_ids in DMAH alloc
    96b6e98ff12d RDMA/core: Validate the passed in fops for ib_get_ucaps()
    e99807bdcd20 mm/huge_memory: update file PUD counter before folio_put()
    cb5230b6d8a0 mm/damon/ops-common: call folio_test_lru() after folio_get()
    5f5b604e1e6b mm/huge_memory: update file PMD counter before folio_put()
    edabfe80e34e drm/amd/display: Reject gpio_bitshift >= 32 in bios_parser_get_gpio_pin_info()
    8348567a6afb drm/virtio: fix dma_fence refcount leak on error in virtio_gpu_dma_fence_wait()
    0bbc9481f970 io_uring/net: inherit IORING_CQE_F_BUF_MORE across bundle recv retries
    3d39da65b5c4 ALSA: timer: Fix UAF at snd_timer_user_params()
    f46093dd2296 ALSA: timer: Forcibly close timer instances at closing
    372f33ebed74 USB: serial: kl5kusb105: fix bulk-out buffer overflow
    85bd2b3afa0a USB: serial: option: add usb-id for Dell Wireless DW5826e-m
    294692d3296e USB: serial: io_ti: fix heap overflow in build_i2c_fw_hdr()
    f96cf7bf9fbf USB: serial: io_ti: fix heap overflow in get_manuf_info()
    a13ca53e47e5 xfrm: iptfs: fix ABBA deadlock in iptfs_destroy_state()
    dd66f7f6e360 xfrm: iptfs: preserve shared-frag marker in iptfs_consume_frags()
    f9b38a8fbfa0 xfrm: espintcp: do not reuse an in-progress partial send
    14d2eee0193a ksmbd: fix use-after-free of a deferred file_lock on double SMB2_CANCEL
    0b38870d81ab hv_netvsc: use kmap_local_page in netvsc_copy_to_send_buf
    32d4c5d328a3 drm/i915/gem: Fix phys BO pread/pwrite with offset
    0b79bcff7210 KVM: arm64: Restore POR_EL0 access to host EL0
    196f1ee137eb KVM: SEV: Decouple the need to sync the GHCB SA from the need to free the SA
    343e95c8ecc4 KVM: Don't WARN if memory is dirtied without a vCPU when the VM is dying
    0864bdde152e mshv: add a missing padding field
    8bcbedce9bfa mmc: litex_mmc: Use DIV_ROUND_UP for more accurate clock calculation
    a0a4600b396b rust: kasan/kbuild: fix rustc-option when cross-compiling
    d0f25a1755f2 rust: arm64: set uwtable llvm module flag for CONFIG_UNWIND_TABLES
    5037b2ee1a17 ARM: Do not select HAVE_RUST when KASAN is enabled
    00875811f372 rust: x86: support Rust >= 1.98.0 target spec
    592be0dc491d tracing/probes: Point the error offset correctly for eprobe argument error
    09df291fdf96 tracing: Fix CFI violation in probestub being called by tprobes
    45cb105b8642 accel/ivpu: Fix signed integer truncation in IPC receive
    fa598556ecef accel/ivpu: Add buffer overflow check in MS get_info_ioctl
    8ec70c0dbdf0 accel/ivpu: Add bounds checks for firmware log indices
    dd77a83915b0 mm/memory-failure: fix hugetlb_lock AA deadlock in get_huge_page_for_hwpoison
    cc160ce08540 soc: qcom: ice: Fix race between qcom_ice_probe() and of_qcom_ice_get()
    dedc92b96dc1 Bluetooth: L2CAP: reject BR/EDR signaling packets over MTUsig
    dafc9f57140e Bluetooth: hci_sync: reject oversized Broadcast Announcement prepend
    c10c9c48b290 tee: shm: fix shm leak in register_shm_helper()
    07acb9798477 netfilter: nft_meta_bridge: fix stale stack leak via IIFHWADDR register
    941d7394efda netfilter: nft_tunnel: fix use-after-free on object destroy
    e83fc4c28226 accel/amdxdna: Fix mm_struct reference leak in aie2_populate_range()
    361e97d81331 drm/xe: fix refcount leak in xe_range_fence_insert()
    02f5e4db57c0 drm/vc4: fix krealloc() memory leak
    19a6a00ff50c drm/virtio: Fix driver removal with disabled KMS
    dda720b2928d drm/i915/edp: Check supported link rates DPCD read
    489f6d759fa4 clk: qcom: dispcc-sc8280xp: Don't park mdp_clk_src at registration time
    3a4fc3617b7e clk: samsung: gs101: Fix missing USI7_USI DIV clock in peric0_clk_regs
    656939c67595 clk: qcom: x1e80100-dispcc: Stop disp_cc_mdss_mdp_clk_src from getting parked
    f34689e7a0b3 KVM: VMX: Update SVI during runtime APICv activation
    07d9a0870a17 ipv6: Fix a potential NPD in cleanup_prefix_route()
    2c98343c9b23 net: txgbe: initialize module info buffer
    19a4d2aace1d net: txgbe: rename the SFP related
    9157060fed92 net: txgbe: support CR modules for AML devices
    7649ba2b1291 net: txgbe: optimize the flow to setup PHY for AML devices
    af08fe9ba091 net: mvpp2: build skb from XDP-adjusted data on XDP_PASS
    8a2126c5afe8 net: mvpp2: refill RX buffers before XDP or skb use
    910617a4e67d net: mvpp2: limit XDP frame size to the RX buffer
    a13199fa224e net: mvpp2: sync RX data at the hardware packet offset
    78069a6d8bc8 netfilter: nft_exthdr: fix register tracking for F_PRESENT flag
    af1b7699466f netfilter: nf_log: validate MAC header was set before dumping it
    08a3e218064d netfilter: x_tables: avoid leaking percpu counter pointers
    9d017671dcfc netfilter: nf_conntrack: destroy stale expectfn expectations on unregister
    4beffcd726e2 netfilter: revalidate bridge ports
    865e94f6d8a5 spi: rzv2h-rspi: Fix SPDR read access width for 16-bit RX
    5ae8a38169fc rds: mark snapshot pages dirty in rds_info_getsockopt()
    2abfb19bbb81 ip6_vti: fix incorrect tunnel matching in vti6_tnl_lookup()
    5fd1fa5a4254 tun: zero the whole vnet header in tun_put_user()
    dcf458120add net/rds: fix NULL deref in rds_ib_send_cqe_handler() on masked atomic completion
    3dde4fb941fa net: guard timestamp cmsgs to real error queue skbs
    7560afb8cdda sctp: validate embedded INIT chunk and address list lengths in cookie
    ecf8904067dc ip6_vti: set netns_immutable on the fallback device.
    f76a8b323e28 sctp: fix uninit-value in __sctp_rcv_asconf_lookup()
    d23d53355300 ASoC: SOF: amd: fix for ipc flags check
    6c75ee4d1d40 net: mctp: usb: don't fail mctp_usb_rx_queue on a deferred submission
    9c46f3ee1837 net: mctp: usb: fix race between urb completion and rx_retry cancellation
    bace7b99bfa5 gpio: rockchip: fix generic IRQ chip leak on remove
    5d4bca5cbb69 gpio: zynq: fix runtime PM leak on remove
    c838ffc154cb r8152: handle the return value of usb_reset_device()
    ecc55aad3390 net: openvswitch: fix possible kfree_skb of ERR_PTR
    2fa49b2715e1 ipv6: sit: reload inner IPv6 header after GSO offloads
    289c06418ed9 net/mlx5: Use effective affinity mask for IRQ selection
    2789b74ae1f4 net/mlx5e: xsk: Fix DMA and xdp_frame leak on XDP_TX xmit failure
    0f807764bb12 net/mlx5: Fix slab-out-of-bounds in mlx5_query_nic_vport_mac_list
    ab269990ed58 net: qrtr: fix refcount saturation and potential UAF in qrtr_port_remove
    3a254779c169 net: phy: clean the sfp upstream if phy probing fails
    c299321bc623 netdev: fix double-free in netdev_nl_bind_rx_doit()
    c09c2e236eef net: ibm: emac: Fix use-after-free during device removal
    8b0541231091 net/mlx4: avoid GCC 10 __bad_copy_from() false positive
    0cde3a004119 net: add pskb_may_pull() to skb_gro_receive_list()
    ede69b8f6670 tcp: restrict SO_ATTACH_FILTER to priv users
    12e579b88962 ASoC: wm_adsp: Fix NULL dereference when removing firmware controls
    6136c1474db8 gpio: mvebu: fix NULL pointer dereference in suspend/resume
    0c4bb32ad7fd netlabel: validate unlabeled address and mask attribute lengths
    972c106f5d01 bnge: fix context mem iteration
    6b8baf42b1b7 net: ena: PHC: Add missing barrier
    640edc281d2f idpf: fix mailbox capability for set device clock time
    6bdbe6f43ecf ice: fix missing priority callbacks for U.FL DPLL pins
    b5316e2b8614 xfrm: policy: fix use-after-free on inexact bin in xfrm_policy_bysel_ctx()
    5513dcb378f9 dma-debug: fix physical address retrieval in debug_dma_sync_sg_for_device
    4ee4d628c4d9 dma-mapping: direct: fix missing mapping for THRU_HOST_BRIDGE segments
    8d9a79fbf517 xfrm: iptfs: fix use-after-free on first_skb in __input_process_payload
    e27c17346628 tap: free page on error paths in tap_get_user_xdp()
    0c03692e2372 verification/rvgen: Fix ltl2k writing True as a literal
    43ad0a0da486 verification/rvgen: Fix options shared among commands
    73590b4cfd05 tools/rv: Fix cleanup after failed trace setup
    fd1923910bbf tools/rv: Fix substring match when listing container monitors
    2122d68f0864 tools/rv: Fix substring match bug in monitor name search
    618193aba6fe tools/rv: Ensure monitor name and desc are NUL-terminated
    65046b0d853d cpufreq/amd-pstate: drop stale @epp_cached kdoc
    63a9f6012f45 spi: cadence-quadspi: fix unclocked access on unbind
    6671a46144f8 ALSA: seq: dummy: fix UMP event stack overread
    cd98837db15f ALSA: PCM: Fix wait queue list corruption in snd_pcm_drain() on linked streams
    6b71956c25f9 time: Fix off-by-one in settimeofday() usec validation
    ed0ad6574126 hyperv: Clean up and fix the guest ID comment in hvgdk.h
    8c046f36222c signal: clear JOBCTL_PENDING_MASK for caller in zap_other_threads()
    6dc6e5b5c32e selftests: harness: fix pidfd leak in __wait_for_test
    752e22ecf4df drm/hyperv: During panic do VMBus unload after frame buffer is flushed
    b0f77f76231b Drivers: hv: vmbus: Provide option to skip VMBus unload on panic
    1639df1a9844 Drivers: hv: VMBus protocol version 6.0
    a6207349e703 sctp: purge outqueue on stale COOKIE-ECHO handling
    42446ca0f357 net/802/mrp: fix vector attribute parsing in mrp_pdu_parse_vecattr
    285b0842f2e0 ieee802154: 6lowpan: only accept IPv6 packets in lowpan_xmit()
    3b7ee029b556 vxlan: vnifilter: fix spurious notification on VNI update
    8e4d1188bad7 vxlan: vnifilter: send notification on VNI add
    eb676fb14427 octeontx2-af: npc: Fix CPT channel mask in npc_install_flow
    cc272185c9a9 sctp: validate cached peer INIT chunk length in COOKIE_ECHO processing
    b198ed4e5258 net/sched: fix pedit partial COW leading to page cache corruption
    e634408d2b0c net: ethernet: mtk_eth_soc: Fix use-after-free in metadata dst teardown
    6f829e2c17a5 net: airoha: Fix use-after-free in metadata dst teardown
    9a263bbd1ec0 ptp: vclock: Switch from RCU to SRCU
    a4f3fd651692 ipv4: restrict IPOPT_SSRR and IPOPT_LSRR options
    91106d0348a5 af_unix: Fix inq_len update problem in partial read
    f010cf9aea01 octeontx2-af: Fix initialization of mcam's entry2target_pffunc field
    ddf930f28be6 octeontx2-pf: Fix NDC sync operation errors
    0dfe05b93843 xsk: cache csum_start/csum_offset to fix TOCTOU in xsk_skb_metadata()
    58d810354de1 Bluetooth: MGMT: Fix backward compatibility with userspace
    446a17b1b509 Bluetooth: SCO: Fix data-race on sco_pi fields in sco_connect
    ab84fd7779a2 Bluetooth: ISO: Fix data-race on iso_pi fields in hci_get_route calls
    33d677d2e371 Bluetooth: ISO: Fix not releasing hdev reference on iso_conn_big_sync
    ce4b4cac3c57 Bluetooth: fix memory leak in error path of hci_alloc_dev()
    c893e17d2809 Bluetooth: bnep: reject short frames before parsing
    7f5367f1ad9b Bluetooth: bnep: fix incorrect length parsing in bnep_rx_frame() extension handling
    3eabc6d47a0a Bluetooth: RFCOMM: validate skb length in MCC handlers
    1a3c8ffbb469 Bluetooth: MGMT: validate advertising TLV before type checks
    8802413ce631 Bluetooth: RFCOMM: hold listener socket in rfcomm_connect_ind()
    fb8db813eba2 wifi: fix leak if split 6 GHz scanning fails
    15be7e9fdbff ipv6: anycast: insert aca into global hash under idev->lock
    23bf7d5c250b net: fec: fix pinctrl default state restore order on resume
    76244b33640b net: lan743x: permit VLAN-tagged packets up to configured MTU
    04e22fefac1a net: garp: fix unsigned integer underflow in garp_pdu_parse_attr
    66a46e22396f hsr: Remove WARN_ONCE() in hsr_addr_is_self().
    07f13816be5a net: Annotate sk->sk_write_space() for UDP SOCKMAP.
    83810d51d699 pcnet32: stop holding device spin lock during napi_complete_done
    9b40c59bab08 wifi: mac80211: limit injected antenna index in ieee80211_parse_tx_radiotap
    e3f6ba5f8cf3 drm/imx: Fix three kernel-doc warnings in dcss-scaler.c
    927f96861f93 devlink: Release nested relation on devlink free
    e251d4cdfc72 l2tp: pppol2tp: hold reference to session in pppol2tp_ioctl()
    c32f30ef5e66 6lowpan: fix off-by-one in multicast context address compression
    b60e9391142e net/sched: act_api: use RCU with deferred freeing for action lifecycle
    42ff6774ecd9 dm cache policy smq: check allocation under invalidate lock
    b18675263db1 netfilter: bridge: make ebt_snat ARP rewrite writable
    f071b0bf0781 netfilter: nft_ct: bail out on template ct in get eval
    9e5da2379f96 netfilter: conntrack_irc: fix possible out-of-bounds read
    aaf80701dc2f netfilter: synproxy: add mutex to guard hook reference counting
    25918720ba97 ipvs: clear the svc scheduler ptr early on edit
    cdaf13260c99 netfilter: xt_NFQUEUE: prefer raw_smp_processor_id
    e735dbd489e3 ksmbd: fix NULL-deref of opinfo->conn in oplock/lease break notifiers
    9dca67624721 wifi: iwlwifi: mvm: don't support the reset handshake for old firmwares
    00bf6868df65 erofs: fix use-after-free on sbi->sync_decompress
    50fd261b1ec4 erofs: tidy up synchronous decompression
    8db2fabb5ecd tee: qcomtee: add missing va_end in early return qcomtee_object_user_init()
    ac7eca1ae4e5 tee: fix tee_ioctl_object_invoke_arg padding
    633db9a1991a soc: qcom: ice: Return -ENODEV if the ICE platform device is not found
    40fc6ed12f91 ARM: dts: microchip: sam9x7: fix GMAC clock configuration
    9cb93ec617fb arm64: dts: qcom: x1-dell-thena: remove i2c20 (battery SMBus) and reserve its pins
    a171bc68e9af soc: qcom: ice: Allow explicit votes on 'iface' clock for ICE
    d5b57bb314d7 tee: optee: prevent use-after-free when the client exits before the supplicant
    dcd90f42a33e net/smc: fix sleep-inside-lock in __smc_setsockopt() causing local DoS
    4203806f700b ipv6: mcast: Fix use-after-free when processing MLD queries
    ffbcf31f032e i2c: dev: prevent integer overflow in I2C_TIMEOUT ioctl
    97706097f9b8 KVM: arm64: Take the SRCU lock for page table walks in fault injection and AT emulation
    9e767af5f109 ARM: fix branch predictor hardening
    05e22564a4f9 ARM: fix hash_name() fault
    8bdb574b2176 ARM: allow __do_kernel_fault() to report execution of memory faults
    22e26df355af ARM: group is_permission_fault() with is_translation_fault()
    87dfb977bdb6 bpf: Free reuseport cBPF prog after RCU grace period.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 358c27b4e0011285b4e329c90d2c4c3b1f581537)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/linux-yocto-rt_6.18.bb              |  6 ++---
 .../linux/linux-yocto-tiny_6.18.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index 00c0b090df0..c4c68844ce9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -15,13 +15,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "35a623d1a755631bbc73e11fa02eee0e1092188b"
-SRCREV_meta ?= "4dafe0e420087b6381728e68eeeff6d9af0a32e7"
+SRCREV_machine ?= "f477695299adc9d29b883d1642a6672e4899a83f"
+SRCREV_meta ?= "0267ec897e3d765fd04d70212dc834570e72d438"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.18.35"
+LINUX_VERSION ?= "6.18.36"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index e2fd09a403e..d8eb5724c8f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.18.inc
 
-LINUX_VERSION ?= "6.18.35"
+LINUX_VERSION ?= "6.18.36"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "efc05d9af9f5b5a647e229c92542e413c3a9915d"
-SRCREV_meta ?= "4dafe0e420087b6381728e68eeeff6d9af0a32e7"
+SRCREV_machine ?= "f1d01f240ab00120824a557c26509996d02ac37c"
+SRCREV_meta ?= "0267ec897e3d765fd04d70212dc834570e72d438"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 2b1298dedf9..148b440fd4d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "84b49a9fef57bf4ff3a2919591fde336fe7944bf"
-SRCREV_machine:qemuarm64 ?= "efc05d9af9f5b5a647e229c92542e413c3a9915d"
-SRCREV_machine:qemuloongarch64 ?= "efc05d9af9f5b5a647e229c92542e413c3a9915d"
+SRCREV_machine:qemuarm ?= "15e3830e8c3a3c15924ce4e6f65430e6e9800512"
+SRCREV_machine:qemuarm64 ?= "f1d01f240ab00120824a557c26509996d02ac37c"
+SRCREV_machine:qemuloongarch64 ?= "f1d01f240ab00120824a557c26509996d02ac37c"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "efc05d9af9f5b5a647e229c92542e413c3a9915d"
-SRCREV_machine:qemuriscv64 ?= "efc05d9af9f5b5a647e229c92542e413c3a9915d"
-SRCREV_machine:qemuriscv32 ?= "efc05d9af9f5b5a647e229c92542e413c3a9915d"
-SRCREV_machine:qemux86 ?= "efc05d9af9f5b5a647e229c92542e413c3a9915d"
-SRCREV_machine:qemux86-64 ?= "efc05d9af9f5b5a647e229c92542e413c3a9915d"
+SRCREV_machine:qemuppc ?= "f1d01f240ab00120824a557c26509996d02ac37c"
+SRCREV_machine:qemuriscv64 ?= "f1d01f240ab00120824a557c26509996d02ac37c"
+SRCREV_machine:qemuriscv32 ?= "f1d01f240ab00120824a557c26509996d02ac37c"
+SRCREV_machine:qemux86 ?= "f1d01f240ab00120824a557c26509996d02ac37c"
+SRCREV_machine:qemux86-64 ?= "f1d01f240ab00120824a557c26509996d02ac37c"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "efc05d9af9f5b5a647e229c92542e413c3a9915d"
-SRCREV_meta ?= "4dafe0e420087b6381728e68eeeff6d9af0a32e7"
+SRCREV_machine ?= "f1d01f240ab00120824a557c26509996d02ac37c"
+SRCREV_meta ?= "0267ec897e3d765fd04d70212dc834570e72d438"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "acb7cf4c1184e27622be0faf89244d5001ed1e87"
+SRCREV_machine:class-devupstream ?= "275d294b2b24abcd65452198551cd8a5b8d4f775"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.18/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.18.35"
+LINUX_VERSION ?= "6.18.36"
 
 PV = "${LINUX_VERSION}+git"
 

