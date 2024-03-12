Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0381FC54E69
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 13:53:49 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.10096.1710251621264666540
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Mar 2024 06:53:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=C1xb455s;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1dd10a37d68so48041675ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 06:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710251620; x=1710856420; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mV0+4N1H14DL5PiHv++04oUwBodSynheggDhJalru/A=;
        b=C1xb455sui2I61C6pqlN55Jq1cxvs4k3gHEVATGrAkcyuJuhR66mCDFijkzriBpAfR
         dP2wPcSF9nrbC5mvV1zDLS/JM0KQk0Z7PT3LJej8AI7Z1U5CFEvqfuPN2mh8S4UlCmA1
         vceSM6qenaE4U6dWtLoDsLeJABj47lTsogQt/h7wIgUG2qFoyk3c41pSj8s8Y95843QO
         ArmaX+8xqYw4wggPeO+ssVHwtdWrYEDRqB8Hsdh5rw4nYtcKWopE8r4IsajoKZcpsAnn
         kUzC+1Y0SmzNxvUhIDzbM1c4C/yXSpC8bXZJFMmpAA2hY3NrD8Iz6kHI+WwN8xdErqh1
         69Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710251620; x=1710856420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mV0+4N1H14DL5PiHv++04oUwBodSynheggDhJalru/A=;
        b=pc6a+rLM2mHzyK4bo7RzYFvY4cTfDOEhV8AmFJ6C318FpttuMqibvPy25cDqHMylgD
         qgVNlJQfGQqpXKyLxJFaibGDBjoFURJ8hcH5Dudn1BKkWZ4BJ9DQiqecfKfRL7OI6qzh
         mTr3BSpKFcLSLPbnhv3Kkr7nSOj1RB2F9r74XvIeUzIodjkgad2HSLNGsnJSusEuMtMr
         1L64/UexXteJ12/PN2lyRK+ir9BdmNsiNPo3Nu6ry4I/0w5wzJCsDU9f3kUcQa68T/SO
         bvhAXWcdpiW776Cftgwtr34QEJR9xfnzlPbjgfqzh8Tmy5sYhqIa69Dzd+O6gpMgJSDt
         zokg==
X-Gm-Message-State: AOJu0YxyciiPVhn1OzF6zgw4bS12b4nFS9mkx3Meny0zVYFn8gcqel91
	Pbj0nqSqzBjQFow0tnrJf/bJqM0mZ2HogAsOH50FTVzS0DXaST0PivYwr4xGn6PW1v1/JqMtZmG
	Ik6o=
X-Google-Smtp-Source: AGHT+IH+Uq1EkzWDvkX6EzgMDqW/WSJC6t8D35UgXQ3WG9C2HV3ywC3DRoLifsJm+t1VRmsSbwg0tQ==
X-Received: by 2002:a17:902:bb82:b0:1dd:d0c:15d3 with SMTP id m2-20020a170902bb8200b001dd0d0c15d3mr394680pls.53.1710251620123;
        Tue, 12 Mar 2024 06:53:40 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 12-20020a170902c10c00b001dc3916853csm6734776pli.73.2024.03.12.06.53.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 06:53:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/8] linux-yocto/5.10: update to v5.10.210
Date: Tue, 12 Mar 2024 03:53:19 -1000
Message-Id: <11abb97e51ac242a6f867d35b6b9d0ac1746bfe7.1710251458.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710251458.git.steve@sakoman.com>
References: <cover.1710251458.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 13:53:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196986

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    aa6ca808a467 Linux 5.10.210
    cf5a69e35591 PCI: dwc: Fix a 64bit bug in dw_pcie_ep_raise_msix_irq()
    9f53d24852ff net: bcmgenet: Fix EEE implementation
    9a865a11d689 netfilter: nf_tables: fix pointer math issue in nft_byteorder_eval()
    67f386f75637 drm/msm/dsi: Enable runtime PM
    21b38d85f6de PM: runtime: Have devm_pm_runtime_enable() handle pm_runtime_dont_use_autosuspend()
    ede393e11819 PM: runtime: add devm_pm_runtime_enable helper
    a891a0621e72 dm: limit the number of targets and parameter size area
    c90746c03b3c nilfs2: replace WARN_ONs for invalid DAT metadata block requests
    f3e4963566f5 nilfs2: fix potential bug in end_buffer_async_write
    db896bbe4a9c sched/membarrier: reduce the ability to hammer on sys_membarrier
    8f8f18564374 net: prevent mss overflow in skb_segment()
    f7e0231eeaa3 Revert "arm64: Stash shadow stack pointer in the task struct on interrupt"
    70ca0dbae4e9 hrtimer: Ignore slack time for RT tasks in schedule_hrtimeout_range()
    c80ddc10927f netfilter: ipset: Missing gc cancellations fixed
    a24d5f2ac8ef netfilter: ipset: fix performance regression in swap operation
    583a6c76b949 scripts/decode_stacktrace.sh: optionally use LLVM utilities
    0f906882eba5 scripts: decode_stacktrace: demangle Rust symbols
    a3d71b6ae935 scripts/decode_stacktrace.sh: support old bash version
    ae992f14b117 scripts/decode_stacktrace.sh: silence stderr messages from addr2line/nm
    00f09825e14c serial: 8250_exar: Set missing rs485_supported flag
    84bf7b87594d serial: 8250_exar: Fill in rs485_supported
    dfd8b9d26b8b serial: Add rs485_supported to uart_port
    0c3687822259 crypto: lib/mpi - Fix unexpected pointer access in mpi_ec_init
    e0d2eeec88ae mips: Fix max_mapnr being uninitialized on early stages
    41a4bd51d87c PCI: dwc: endpoint: Fix dw_pcie_ep_raise_msix_irq() alignment support
    ff67f77fb0fc bus: moxtet: Add spi device table
    88ec9bbcd33c Revert "md/raid5: Wait for MD_SB_CHANGE_PENDING in raid5d"
    6a42eb0d2170 tracing: Inform kmemleak of saved_cmdlines allocation
    3a6e27dbe2fe pmdomain: core: Move the unused cleanup to a _sync initcall
    978e50ef8c38 can: j1939: Fix UAF in j1939_sk_match_filter during setsockopt(SO_J1939_FILTER)
    e4a6d3acaddb of: property: fix typo in io-channels
    8180d0c27b93 ceph: prevent use-after-free in encode_cap_msg()
    2e9506c9e0b9 s390/qeth: Fix potential loss of L3-IP@ in case of network issues
    888679afbfc2 irqchip/gic-v3-its: Fix GICv4.1 VPE affinity update
    2809645d8ae2 irqchip/irq-brcmstb-l2: Add write memory barrier before exit
    45a3657c3fae wifi: mac80211: reload info pointer in ieee80211_tx_dequeue()
    c7fa9590a9b2 nfp: flower: prevent re-adding mac index for bonded port
    962091c40813 nfp: use correct macro for LengthSelect in BAR config
    58054faf3bd2 crypto: ccp - Fix null pointer dereference in __sev_platform_shutdown_locked
    98a4026b22ff nilfs2: fix hang in nilfs_lookup_dirty_data_buffers()
    364a66be2abd nilfs2: fix data corruption in dsync block recovery for small block sizes
    a643d8d17947 ALSA: hda/conexant: Add quirk for SWS JS201D
    ca0533fe6650 mmc: slot-gpio: Allow non-sleeping GPIO ro
    bdc29f9ca3b1 x86/mm/ident_map: Use gbpages only where full GB page should be mapped.
    09f21bee5b02 x86/Kconfig: Transmeta Crusoe is CPU family 5, not 6
    1a8a72ee17e4 serial: max310x: improve crystal stable clock detection
    6f248ee7aade serial: max310x: set default value when reading clock ready bit
    92a0a5d61376 ring-buffer: Clean ring_buffer_poll_wait() error return
    9ec807e7b6f5 hv_netvsc: Fix race condition between netvsc_probe and netvsc_remove
    93d8109bf182 media: rc: bpf attach/detach requires write permission
    a98ccbcddbb5 iio: accel: bma400: Fix a compilation problem
    36a49290d7e6 iio: magnetometer: rm3100: add boundary check for the value read from RM3100_REG_TMRC
    fa5884dd5bc2 staging: iio: ad5933: fix type mismatch regression
    8a744f925de0 tracing: Fix wasted memory in saved_cmdlines logic
    d033a555d9a1 ext4: fix double-free of blocks due to wrong extents moved_len
    f86e12415b4e misc: fastrpc: Mark all sessions as invalid in cb_remove
    a423042052ec binder: signal epoll threads of self-work
    6d11240dd11b ALSA: hda/realtek: Enable headset mic on Vaio VJFE-ADL
    cdaddb457d9e xen-netback: properly sync TX responses
    0d8011a878fd net: hsr: remove WARN_ONCE() in send_hsr_supervision_frame()
    2f6d16f0520d nfc: nci: free rx_data_reassembly skb on NCI device cleanup
    5abf3e8af2e3 kbuild: Fix changing ELF file type for output of gen_btf for big endian
    6717c593c7cf firewire: core: correct documentation of fw_csr_string() kernel API
    2dc1d93b2c77 lsm: fix the logic in security_inode_getsecctx()
    7d4e19f7ff64 scsi: Revert "scsi: fcoe: Fix potential deadlock on &fip->ctlr_lock"
    ca188f2512d6 modpost: trim leading spaces when processing source files list
    7a14b8a477b8 i2c: i801: Fix block process call transactions
    5e8a6140d42f i2c: i801: Remove i801_set_block_buffer_mode
    230e89b5ad0a powerpc/kasan: Fix addr error caused by page alignment
    486a4176bc78 media: ir_toy: fix a memleak in irtoy_tx
    b8da59ad91e8 usb: f_mass_storage: forbid async queue when shutdown happen
    9a8ccbc6ecbf USB: hub: check for alternate port before enabling A_ALT_HNP_SUPPORT
    9d07bdbfa490 usb: ucsi_acpi: Fix command completion handling
    f304eb483393 HID: wacom: Do not register input devices until after hid_hw_start
    4f7927310e2d HID: wacom: generic: Avoid reporting a serial of '0' to userspace
    d51fc41e159f ALSA: hda/realtek: Enable Mute LED on HP Laptop 14-fq0xxx
    8da18c51ce4a ALSA: hda/realtek: Fix the external mic not being recognised for Acer Swift 1 SF114-32
    81e7d2530d45 mm/writeback: fix possible divide-by-zero in wb_dirty_limits(), again
    56cfbe607107 tracing/trigger: Fix to return error if failed to alloc snapshot
    6d05659b60ac i40e: Fix waiting for queues of all VSIs to be disabled
    f026f23849fb MIPS: Add 'memory' clobber to csum_ipv6_magic() inline assembler
    ed8c87ac8afc net: sysfs: Fix /sys/class/net/<iface> path for statistics
    4a98bc739d07 ASoC: rt5645: Fix deadlock in rt5645_jack_detect_work()
    f8cd86c67d4c spi: ppc4xx: Drop write-only variable
    55cfccb658fc net: openvswitch: limit the number of recursions from action sets
    3f9b9585b7e4 of: unittest: Fix compile in the non-dynamic case
    dc8bce9c71ef btrfs: send: return EOPNOTSUPP on unknown flags
    22965e4fee0f btrfs: forbid deleting live subvol qgroup
    3f5d47eb163b btrfs: do not ASSERT() if the newly created subvolume already got read
    d7247ce32ab2 btrfs: forbid creating subvol qgroups
    4cee42fcf54f netfilter: nft_set_rbtree: skip end interval element from gc
    feace3c24044 net: stmmac: xgmac: fix a typo of register name in DPP safety handling
    78115a3473b1 net: stmmac: xgmac: use #define for string constants
    8868106251cd clocksource: Skip watchdog check for large watchdog intervals
    cda4ca038caf vhost: use kzalloc() instead of kmalloc() followed by memset()
    63d97c3abafd Input: atkbd - skip ATKBD_CMD_SETLEDS when skipping ATKBD_CMD_GETID
    9a564a9a0731 Input: i8042 - fix strange behavior of touchpad on Clevo NS70PU
    b1f576be92d0 hrtimer: Report offline hrtimer enqueue
    b87060b3e835 usb: host: xhci-plat: Add support for XHCI_SG_TRB_CACHE_SIZE_QUIRK
    34fd6f444b8a USB: serial: cp210x: add ID for IMST iM871A-USB
    53479fcfd04c USB: serial: option: add Fibocom FM101-GL variant
    c537b88b39d3 USB: serial: qcserial: add new usb-id for Dell Wireless DW5826e
    e800ef36d1fa net/af_iucv: clean up a try_then_request_module()
    9f56f3833117 blk-iocost: Fix an UBSAN shift-out-of-bounds warning
    9878c660d1f0 scsi: core: Move scsi_host_busy() out of host lock if it is for per-command
    1dd947c21d3f netfilter: nft_set_pipapo: remove scratch_aligned pointer
    d6fcad0da2bd netfilter: nft_set_pipapo: add helper to release pcpu scratch area
    1771e8347ff1 netfilter: nft_set_pipapo: store index in scratch maps
    d1ec65c49e74 netfilter: nft_ct: reject direction for ct id
    730fce47e593 netfilter: nft_compat: restrict match/target protocol to u16
    78909916a22b netfilter: nft_compat: reject unused compat flag
    b06e067e93fa ppp_async: limit MRU to 64K
    19d7314f2fb9 tipc: Check the bearer type before calling tipc_udp_nl_bearer_add()
    09e91f3e7e5c rxrpc: Fix response to PING RESPONSE ACKs to a dead call
    88081ba41522 inet: read sk->sk_family once in inet_recv_error()
    7e42379d29de hwmon: (coretemp) Fix bogus core_id to attr name mapping
    f0da068c75c2 hwmon: (coretemp) Fix out-of-bounds memory access
    9551de5caa2b hwmon: (aspeed-pwm-tacho) mutex for tach reading
    edfd328fe7bd atm: idt77252: fix a memleak in open_card_ubr0
    e77bf828f1ca tunnels: fix out of bounds access when building IPv6 PMTU error
    fd473100bfed selftests: net: avoid just another constant wait
    2fc45a4631ac net: stmmac: xgmac: fix handling of DPP safety error for DMA channels
    66c8243e6130 drm/msm/dp: return correct Colorimetry for DP_TEST_DYNAMIC_RANGE_CEA case
    be3b82e4871b phy: ti: phy-omap-usb2: Fix NULL pointer dereference for SRP
    784d31548236 dmaengine: fix is_slave_direction() return false when DMA_DEV_TO_DEV
    68459d2b0c21 phy: renesas: rcar-gen3-usb2: Fix returning wrong error code
    ae6769ba5141 dmaengine: fsl-qdma: Fix a memory leak related to the queue command DMA
    fbe1c5c6a8a2 dmaengine: fsl-qdma: Fix a memory leak related to the status queue DMA
    3496a1da711e dmaengine: ti: k3-udma: Report short packet errors
    b7dbf4115bd8 dmaengine: fsl-dpaa2-qdma: Fix the size of dma pools
    6db18971f73a PM: sleep: Fix error handling in dpm_prepare()
    6388d0e3200d uapi: stddef.h: Fix __DECLARE_FLEX_ARRAY for C++
    2563e7c6877d bonding: remove print in bond_verify_device_path
    d1a9900e6442 HID: apple: Add 2021 magic keyboard FN key mapping
    b1e3ea7c48a5 HID: apple: Add support for the 2021 Magic Keyboard
    e5eca7954aac net: sysfs: Fix /sys/class/net/<iface> path
    f199018dc762 af_unix: fix lockdep positive in sk_diag_dump_icons()
    9c9cab01c7a3 net: ipv4: fix a memleak in ip_setup_cork
    65ee90efc928 netfilter: nft_ct: sanitize layer 3 and 4 protocol number in custom expectations
    32fa7abb18b0 netfilter: nf_log: replace BUG_ON by WARN_ON_ONCE when putting logger
    d0b5b1f12429 llc: call sock_orphan() at release time
    e34c91e7e8a3 ipv6: Ensure natural alignment of const ipv6 loopback and router addresses
    b45fae96bd1e ixgbe: Fix an error handling path in ixgbe_read_iosf_sb_reg_x550()
    f8bccfa175a5 ixgbe: Refactor overtemp event handling
    e16c254f60d3 ixgbe: Refactor returning internal error codes
    2499c0661b18 ixgbe: Remove non-inclusive language
    f48bf9a83b16 tcp: add sanity checks to rx zerocopy
    14690e419bb3 net-zerocopy: Refactor frag-is-remappable test.
    a9bc32879a08 ip6_tunnel: make sure to pull inner header in __ip6_tnl_rcv()
    a57b114a84f8 ip6_tunnel: use dev_sw_netstats_rx_add()
    f5944853f7a9 scsi: core: Move scsi_host_busy() out of host lock for waking up EH handler
    7efadce40a6b scsi: core: Introduce enum scsi_disposition
    dca11bfa0125 scsi: isci: Fix an error code problem in isci_io_request_build()
    948090f66aed drm: using mul_u32_u32() requires linux/math64.h
    02161f622df3 wifi: cfg80211: fix RCU dereference in __cfg80211_bss_update
    b54eecdc08d4 perf: Fix the nr_addr_filters fix
    73eda2693117 drm/amdgpu: Release 'adev->pm.fw' before return in 'amdgpu_device_need_post()'
    feacc800407c drm/amd/powerplay: Fix kzalloc parameter 'ATOM_Tonga_PPM_Table' in 'get_platform_power_management_table()'
    e016e358461b ceph: fix deadlock or deadcode of misusing dget()
    7610ba131925 blk-mq: fix IO hang from sbitmap wakeup race
    27ae156e638d virtio_net: Fix "‘%d’ directive writing between 1 and 11 bytes into a region of size 10" warnings
    0079078f5ee8 libsubcmd: Fix memory leak in uniq()
    32a824378841 PCI/AER: Decode Requester ID when no error info found
    feaf0752b310 fs/kernfs/dir: obey S_ISGID
    6f921430b07a tty: allow TIOCSLCKTRMIOS with CAP_CHECKPOINT_RESTORE
    e962b59d3749 usb: hub: Replace hardcoded quirk value with BIT() macro
    4a5d0528cf19 PCI: switchtec: Fix stdev_release() crash after surprise hot remove
    385e49a40fff PCI: Only override AMD USB controller if required
    bb59b30a5ce2 mfd: ti_am335x_tscadc: Fix TI SoC dependencies
    e4fdf3b17686 xen/gntdev: Fix the abuse of underlying struct page in DMA-buf import
    89bdf3a9f98c i3c: master: cdns: Update maximum prescaler value for i2c clock
    b345f330aeed um: net: Fix return type of uml_net_start_xmit()
    ef21984653fc um: Don't use vfprintf() for os_info()
    e4cc55538841 um: Fix naming clash between UML and scheduler
    d47f5d41d8c0 leds: trigger: panic: Don't register panic notifier if creating the trigger failed
    8342ac4a552a drm/amdgpu: Drop 'fence' check in 'to_amdgpu_amdkfd_fence()'
    48bb06f8e380 drm/amdgpu: Let KFD sync with VM fences
    e90c8f9785ea watchdog: it87_wdt: Keep WDTCTRL bit 3 unmodified for IT8784/IT8786
    6f59516a36b9 clk: mmp: pxa168: Fix memory leak in pxa168_clk_init()
    2cb6059468f8 clk: hi3620: Fix memory leak in hi3620_mmc_clk_init()
    5fd28ab1c89d drm/msm/dpu: Ratelimit framedone timeout msgs
    179fe24bd675 media: ddbridge: fix an error code problem in ddb_probe
    ac2630fd3c90 IB/ipoib: Fix mcast list locking
    9503ce5f8795 drm/exynos: Call drm_atomic_helper_shutdown() at shutdown/unbind time
    1eeca000f268 ALSA: hda: intel-dspcfg: add filters for ARL-S and ARL
    3841b8a64e60 ALSA: hda: Intel: add HDA_ARL PCI ID support
    56d717aa7bbe PCI: add INTEL_HDA_ARL to pci_ids.h
    b68e373dc031 media: rockchip: rga: fix swizzling for RGB formats
    32c5e3f8085f media: stk1160: Fixed high volume of stk1160_dbg messages
    425a441c5c32 drm/mipi-dsi: Fix detach call without attach
    0ec29a0f0366 drm/framebuffer: Fix use of uninitialized variable
    d7b81afa11ba drm/drm_file: fix use of uninitialized variable
    9a572fc1f6af f2fs: fix write pointers on zoned device after roll forward
    7fb8c132738b drm/amd/display: Fix tiled display misalignment
    3a1da8abd772 RDMA/IPoIB: Fix error code return in ipoib_mcast_join
    13d20b2c20be fast_dput(): handle underflows gracefully
    706fb30da0a5 ASoC: doc: Fix undefined SND_SOC_DAPM_NOPM argument
    354785abdf5e ALSA: hda: Refer to correct stream index at loops
    80c69f576ff3 f2fs: fix to check return value of f2fs_reserve_new_block()
    e474e7a7d6f9 i40e: Fix VF disable behavior to block all traffic
    ed6de41473c8 Bluetooth: L2CAP: Fix possible multiple reject send
    e1bcd9a42e5b Bluetooth: qca: Set both WIDEBAND_SPEECH and LE_STATES quirks for QCA2066
    27575c2f1f46 wifi: cfg80211: free beacon_ies when overridden from hidden BSS
    40bcbf7d9069 wifi: rtlwifi: rtl8723{be,ae}: using calculate_bit_shift()
    1632481a990d wifi: rtl8xxxu: Add additional USB IDs for RTL8192EU devices
    2131606a5fd7 arm64: dts: qcom: msm8998: Fix 'out-ports' is a required property
    4668f3e6ac23 arm64: dts: qcom: msm8996: Fix 'in-ports' is a required property
    82f6e7e68e95 md: Whenassemble the array, consult the superblock of the freshest device
    1746cd95a553 block: prevent an integer overflow in bvec_try_merge_hw_page
    1335310a6a87 net: dsa: mv88e6xxx: Fix mv88e6352_serdes_get_stats error path
    9c51d26ff95f ARM: dts: imx23/28: Fix the DMA controller node name
    6c22388d960f ARM: dts: imx23-sansa: Use preferred i2c-gpios properties
    fb9bdf84b612 ARM: dts: imx27-apf27dev: Fix LED name
    1dd3a37909d7 ARM: dts: imx25/27: Pass timing0
    3c2bce897698 ARM: dts: imx25: Fix the iim compatible string
    95bc866c1197 block/rnbd-srv: Check for unlikely string overflow
    03ca1d3d8f4d ionic: pass opcode to devcmd_wait
    ba108f3db98c ARM: dts: imx1: Fix sram node
    2f22ce556e38 ARM: dts: imx27: Fix sram node
    e6c0ea054cf9 ARM: dts: imx: Use flash@0,0 pattern
    bfbaf1551bee ARM: dts: imx25/27-eukrea: Fix RTC node name
    24bb6b264792 ARM: dts: rockchip: fix rk3036 hdmi ports node
    11c1fc73bf17 bpf: Set uattr->batch.count as zero before batched update or deletion
    2e7f8d05ec95 scsi: libfc: Fix up timeout error in fc_fcp_rec_error()
    a72670f465a1 scsi: libfc: Don't schedule abort twice
    80700978cb34 bpf: Add map and need_defer parameters to .map_fd_put_ptr()
    84770a996ad8 wifi: ath9k: Fix potential array-index-out-of-bounds read in ath9k_htc_txstatus()
    c390b6a2c30b ARM: dts: imx7s: Fix nand-controller #size-cells
    d7cb295b53f9 ARM: dts: imx7s: Fix lcdif compatible
    73ead7a37a4d ARM: dts: imx7d: Fix coresight funnel ports
    86781b3a8eae scsi: arcmsr: Support new PCI device IDs 1883 and 1886
    db516f6030bf bonding: return -ENOMEM instead of BUG in alb_upper_dev_walk
    4f87b8d93297 PCI: Add no PM reset quirk for NVIDIA Spectrum devices
    9bc7617a0d46 scsi: lpfc: Fix possible file string name overflow when updating firmware
    9b9bbba16be4 selftests/bpf: Fix pyperf180 compilation failure with clang18
    747838941f1c selftests/bpf: satisfy compiler by having explicit return in btf test
    69e905beca19 wifi: rt2x00: restart beacon queue when hardware reset
    cfbbb3199e71 ext4: avoid online resizing failures due to oversized flex bg
    e7b9fa6c298f ext4: remove unnecessary check from alloc_flex_gd()
    b96019242269 ext4: unify the type of flexbg_size to unsigned int
    64448275f8ef ext4: fix inconsistent between segment fstrim and full fstrim
    5183595c0bfd ecryptfs: Reject casefold directory inodes
    c430e6bb4395 SUNRPC: Fix a suspicious RCU usage warning
    150a3a387149 KVM: s390: fix setting of fpc register
    856caf2730ea s390/ptrace: handle setting of fpc register correctly
    e2b77d107b33 jfs: fix array-index-out-of-bounds in diNewExt
    5f1f459520ed rxrpc_find_service_conn_rcu: fix the usage of read_seqbegin_or_lock()
    ae53c54ed74c afs: fix the usage of read_seqbegin_or_lock() in afs_find_server*()
    a02356d996b4 afs: fix the usage of read_seqbegin_or_lock() in afs_lookup_volume_rcu()
    108c4db05791 crypto: stm32/crc32 - fix parsing list of devices
    a63e48cd835c pstore/ram: Fix crash when setting number of cpus to an odd number
    bc6ef64dbe71 jfs: fix uaf in jfs_evict_inode
    2037cb9d95f1 jfs: fix array-index-out-of-bounds in dbAdjTree
    1c40ca3d39d7 jfs: fix slab-out-of-bounds Read in dtSearch
    7aa33854477d UBSAN: array-index-out-of-bounds in dtSplitRoot
    de34de6e57bb FS:JFS:UBSAN:array-index-out-of-bounds in dbAdjTree
    95c864c81148 ACPI: APEI: set memory failure flags as MF_ACTION_REQUIRED on synchronous events
    3399cc7013e7 PM / devfreq: Synchronize devfreq_monitor_[start/stop]
    b17a71435e7e ACPI: extlog: fix NULL pointer dereference check
    c2615948536a PNP: ACPI: fix fortify warning
    3a13ed6298c4 ACPI: video: Add quirk for the Colorful X15 AT 23 Laptop
    c74b2af2ccbc audit: Send netlink ACK before setting connection in auditd_set
    37e00ed71e86 regulator: core: Only increment use_count when enable_count changes
    19c71322702d debugobjects: Stop accessing objects after releasing hash bucket lock
    c57cb397fe23 perf/core: Fix narrow startup race when creating the perf nr_addr_filters sysfs file
    5224b9db24f6 x86/mce: Mark fatal MCE's page as poison to avoid panic in the kdump kernel
    beee482cc4c9 powerpc/lib: Validate size for vector operations
    24a58abcfff3 powerpc: pmd_move_must_withdraw() is only needed for CONFIG_TRANSPARENT_HUGEPAGE
    02e5b2ff4753 x86/boot: Ignore NMIs during very early boot
    9d06c199d881 powerpc/mm: Fix build failures due to arch_reserved_kernel_pages()
    3928c06363de powerpc: Fix build error due to is_valid_bugaddr()
    353496cb35e2 drivers/perf: pmuv3: don't expose SW_INCR event in sysfs
    aa28eecb43ca powerpc/mm: Fix null-pointer dereference in pgtable_cache_add
    4e806600eb14 x86/entry/ia32: Ensure s32 is sign extended to s64
    cdc01845df11 tick/sched: Preserve number of idle sleeps across CPU hotplug events
    3736a7832bfe mips: Call lose_fpu(0) before initializing fcr31 in mips_set_personality_nan
    95a8a5193e06 spi: bcm-qspi: fix SFDP BFPT read by usig mspi read
    f1ba5bf9e0ac gpio: eic-sprd: Clear interrupt after set the interrupt type
    0924bcd2fd49 drm/exynos: gsc: minor fix for loop iteration in gsc_runtime_resume
    b6abe30de368 drm/exynos: fix accidental on-stack copy of exynos_drm_plane
    4e56c5a9b9cf drm: panel-simple: add missing bus flags for Tianma tm070jvhg[30/33]
    e1c50b0c6242 btrfs: avoid copying BTRFS_ROOT_SUBVOL_DEAD flag to snapshot of subvolume being deleted
    d073f4608b47 btrfs: remove err variable from btrfs_delete_subvolume
    90ad17575d26 mm/sparsemem: fix race in accessing memory_section->usage
    74a80f8dda6a mm: use __pfn_to_section() instead of open coding it
    43872f44eee6 media: mtk-jpeg: Fix use after free bug due to error path handling in mtk_jpeg_dec_device_run
    9087d0c2ba04 arm64: dts: qcom: sc7180: fix USB wakeup interrupt types
    3de807b14036 arm64: dts: qcom: sc7180: Use pdc interrupts for USB instead of GIC interrupts
    8b2c7bb60510 ARM: dts: samsung: exynos4210-i9100: Unconditionally enable LDO12
    162ae0e78bda pipe: wakeup wr_wait after setting max_usage
    b6f27626f56e fs/pipe: move check to pipe_has_watch_queue()
    f46eb832389f PM: sleep: Fix possible deadlocks in core system-wide PM code
    8b604883d4cb PM: core: Remove unnecessary (void *) conversions
    57df40f80089 PM: sleep: Avoid calling put_device() under dpm_list_mtx
    2245a8498569 PM: sleep: Use dev_printk() when possible
    8a6a51b80bbd drm/bridge: nxp-ptn3460: simplify some error checking
    bedbbdf05663 drm/tidss: Fix atomic_flush check
    ea192526910d drm/bridge: nxp-ptn3460: fix i2c_master_send() error checking
    f55261469be8 drm: Don't unref the same fb many times by mistake due to deadlock handling
    bb575bc3e767 gpiolib: acpi: Ignore touchpad wakeup on GPD G1619-04
    55a60251fa50 netfilter: nf_tables: reject QUEUE/DROP verdict parameters
    9489e214ea8f netfilter: nft_chain_filter: handle NETDEV_UNREGISTER for inet/ingress basechain
    05dd9facfb9a wifi: iwlwifi: fix a memory corruption
    c0760a5c3e28 exec: Fix error handling in begin_new_exec()
    30f38928b69b rbd: don't move requests to the running list on errors
    2bdf872bcfe6 btrfs: don't abort filesystem when attempting to snapshot deleted subvolume
    5d3687baa9db btrfs: defrag: reject unknown flags of btrfs_ioctl_defrag_range_args
    f27937426b57 btrfs: don't warn if discard range is not aligned to sector
    f8a7a51a6c2d btrfs: tree-checker: fix inline ref size in error messages
    be90e25880f2 btrfs: ref-verify: free ref cache before clearing mount opt
    7c3a572e1581 net: fec: fix the unhandled context fault from smmu
    a52b2faf6010 fjes: fix memleaks in fjes_hw_setup
    e1bf3ec97a82 selftests: netdevsim: fix the udp_tunnel_nic test
    83f99138bf3b net: mvpp2: clear BM pool before initialization
    6a2e2d9890e7 netfilter: nf_tables: validate NFPROTO_* family
    4fbdc3a18f61 netfilter: nf_tables: restrict anonymous set and map names to 16 bytes
    cf116d9c3c2a net/mlx5e: fix a double-free in arfs_create_groups
    1123661a089a net/mlx5: DR, Use the right GVMI number for drop action
    a3eba5989fc9 ipv6: init the accept_queue's spinlocks in inet6_create
    be8d1f619ea3 netlink: fix potential sleeping issue in mqueue_flush_file
    69ca75e063a5 tcp: Add memory barrier to tcp_push()
    8499e2f1218e afs: Hide silly-rename files from userspace
    ef70dfa0b1e5 tracing: Ensure visibility when inserting an element into tracing_map
    5ae8d5004463 net/rds: Fix UBSAN: array-index-out-of-bounds in rds_cmsg_recv
    9ccdef19cf94 llc: Drop support for ETH_P_TR_802_2.
    04f2a74b562f llc: make llc_ui_sendmsg() more robust against bonding changes
    ea4c3cb7fded vlan: skip nested type that is not IFLA_VLAN_QOS_MAPPING
    fc74f86a3367 bnxt_en: Wait for FLR to complete during probe
    bc99dcedd2f4 tcp: make sure init the accept_queue's spinlocks once
    5fed92ca32ea net/smc: fix illegal rmb_desc access in SMC-D connection dump
    c71e1c1a08c2 KVM: use __vcalloc for very large allocations
    95670878a612 mm: vmalloc: introduce array allocation functions
    02f629bb460d smb3: Replace smb2pdu 1-element arrays with flex-arrays
    443b16ee3d9c stddef: Introduce DECLARE_FLEX_ARRAY() helper
    bfc0647791d7 block: Remove special-casing of compound pages
    ff4332f1ec75 rename(): fix the locking of subdirectories
    d132010e6d5c ubifs: ubifs_symlink: Fix memleak of inode->i_link in error path
    c6e6640784e4 nouveau/vmm: don't set addr on the fail path to avoid warning
    83217f1bcb35 rtc: Adjust failure return code for cmos_set_alarm()
    b51578bd86be mmc: mmc_spi: remove custom DMA mapped buffers
    59020bf0999f mmc: core: Use mrq.sbc in close-ended ffu
    625cb3f3bc8a scripts/get_abi: fix source path leak
    311dc5afad11 lsm: new security_file_ioctl_compat() hook
    f726690397df arm64: dts: qcom: sdm845: fix USB DP/DM HS PHY interrupts
    dfc2c685f3a9 arm64: dts: qcom: sdm845: fix USB wakeup interrupt types
    ac4dcccbe910 async: Introduce async_schedule_dev_nocall()
    9ef68b58fd00 async: Split async_schedule_node_domain()
    1dd8449e2008 parisc/firmware: Fix F-extend for PDC addresses
    20a6dea2d1c6 bus: mhi: host: Drop chan lock before queuing buffers
    69ca89d80f2c rpmsg: virtio: Free driver_override when rpmsg_remove()
    cd51e26a3b89 crypto: s390/aes - Fix buffer overread in CTR mode
    c6a8111aacbf hwrng: core - Fix page fault dead lock on mmap-ed hwrng
    981a31b7547a PM: hibernate: Enforce ordering during image compression/decompression
    462c383e732f crypto: api - Disallow identical driver names
    fa9491224183 ext4: allow for the last group to be marked as trimmed
    d173ef1255bb iio:adc:ad7091r: Move exports into IIO_AD7091R namespace.
    9de69732dde4 dmaengine: fix NULL pointer in channel unregistration function
    653d2890602c iio: adc: ad7091r: Enable internal vref if external vref is not supplied
    1eba6f7ffa29 iio: adc: ad7091r: Allow users to configure device events
    9ec7498a25f1 iio: adc: ad7091r: Set alert bit in config register
    be5d6a297d30 serial: sc16is7xx: add check for unsupported SPI modes during probe
    8df2aec94bf5 spi: introduce SPI_MODE_X_MASK macro
    6ec08ce3bf7f serial: sc16is7xx: set safe default SPI clock frequency
    e83f1149942f units: add the HZ macros
    762217e973ea units: change from 'L' to 'UL'
    f37f4a0c537c PCI: mediatek: Clear interrupt status before dispatching handler
    490eaca84275 usb: cdns3: Fix uvc fail when DMA cross 4k boundery since sg enabled
    bf703214190c usb: cdns3: fix iso transfer error when mult is not zero
    6aec2f089d5c usb: cdns3: fix incorrect calculation of ep_buf_size when more than one config
    2fdc98b05cb2 usb: cdns3: fix uvc failure work since sg support enabled
    67d3c71cf856 usb: cdns3: Fixes for sparse warnings

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.10.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 75bad97d60..95aa8a29b2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "584bbc442a34343aef24cfc58091fa0181bcf949"
+SRCREV_machine ?= "d4e1591e2a700e5317e604af9c46dc9f92d87527"
 SRCREV_meta ?= "b890cbbdcbc8498d1c84ec782bb5de8a51eb7d6d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.209"
+LINUX_VERSION ?= "5.10.210"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 388eb0b83f..832d030031 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.209"
+LINUX_VERSION ?= "5.10.210"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "26ce139169fda3385d07e7e790ab20221a0535a2"
-SRCREV_machine ?= "ce0d143a0b6e70fdd5115bb091e1c226bbfb0656"
+SRCREV_machine:qemuarm ?= "0f8e37aa2c623070ac74f73e6d41ed51fab54b4c"
+SRCREV_machine ?= "2c2439238ab602a10ad6d7aa6b210562ee1df595"
 SRCREV_meta ?= "b890cbbdcbc8498d1c84ec782bb5de8a51eb7d6d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 1e3e496c84..48fb4868fb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -14,23 +14,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "336d5989c007a2fff1e0cf8a6438288a815e264f"
-SRCREV_machine:qemuarm64 ?= "486578dae0e8b3ca825f0f85349fc069b5c58559"
-SRCREV_machine:qemumips ?= "1224d6157a6ba4e5b8d788bf529979b35873e311"
-SRCREV_machine:qemuppc ?= "bc1483b3d570623d38d49c400ec4508f8be68744"
-SRCREV_machine:qemuriscv64 ?= "4ec03fdbcfb82acff38de9d517e520bae44b9a5f"
-SRCREV_machine:qemuriscv32 ?= "4ec03fdbcfb82acff38de9d517e520bae44b9a5f"
-SRCREV_machine:qemux86 ?= "4ec03fdbcfb82acff38de9d517e520bae44b9a5f"
-SRCREV_machine:qemux86-64 ?= "4ec03fdbcfb82acff38de9d517e520bae44b9a5f"
-SRCREV_machine:qemumips64 ?= "fcebc1b9b71e941349bef1fce9ad9fe1f156ac63"
-SRCREV_machine ?= "4ec03fdbcfb82acff38de9d517e520bae44b9a5f"
+SRCREV_machine:qemuarm ?= "b1aa548003c2c76a8aa7d7ad83c7070cac5a4f21"
+SRCREV_machine:qemuarm64 ?= "32d0647cd0dfa7361a5dfdde34d39192f179f6bf"
+SRCREV_machine:qemumips ?= "8780d18791f93bacc3a7d0529fdeb4e31adacafa"
+SRCREV_machine:qemuppc ?= "9353fbbd955b1f29e56876aa332473e1029e9e96"
+SRCREV_machine:qemuriscv64 ?= "ee0d8dfb898ca2dc199437e79efaa02723ff9378"
+SRCREV_machine:qemuriscv32 ?= "ee0d8dfb898ca2dc199437e79efaa02723ff9378"
+SRCREV_machine:qemux86 ?= "ee0d8dfb898ca2dc199437e79efaa02723ff9378"
+SRCREV_machine:qemux86-64 ?= "ee0d8dfb898ca2dc199437e79efaa02723ff9378"
+SRCREV_machine:qemumips64 ?= "136942e72021d05bd1d93389d94a20f763dd8336"
+SRCREV_machine ?= "ee0d8dfb898ca2dc199437e79efaa02723ff9378"
 SRCREV_meta ?= "b890cbbdcbc8498d1c84ec782bb5de8a51eb7d6d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.209"
+LINUX_VERSION ?= "5.10.210"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


