Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23EE6E94632
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 03:05:01 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11968.1770692699087285277
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 19:04:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D+sl9NcP;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-505a1789a27so1862601cf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 19:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770692697; x=1771297497; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QiJTEUEq7g0q0B5agWlByMH039+ZPwbN0YahkxxwrnE=;
        b=D+sl9NcPWpMPu8BUba8NutT4L5aR3Y2R9d7mZBPmSypXy43JmOGUnzqH8JjWHL8bbm
         Te93W7mtDC5TJHFNeI+njHg9zFXOb7mkImenc5YbZ7NwoftGq5jgyk7wTWZNER34MqTQ
         lcHRBzgz/4DLoNwJQdFtpoCKhYpAeo9TiMDVLn23wNm6cD9uOIW4+N7sF7Ho8TBxnu/7
         cNtDvHi2E1tF/nK62W+9WfHg7pxtXMfYjW8nYi2QRIa4lLTqq6Q1G5otfEbXrwCxAqhf
         dIKo+Ej61QjKFwkNP/xV6FtjqjELrjNY6jNtQRyDtikE/cux1lB1M6OBtnavKuyPewcX
         nbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770692697; x=1771297497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QiJTEUEq7g0q0B5agWlByMH039+ZPwbN0YahkxxwrnE=;
        b=DDsJrVS4KOFuATktpdoVm/ILYimUr9r1kywy6Yc+yY5/x8vzNM4DLOeimoXuMu+f1D
         +ix5R6TzVWGv7wWxvbw/lUmHM2Y6GWNQUXumfopdTdzTqyJ3NcKVrHJ7TxzAfOsJRW/s
         K327VfSXU7wimddRsjefaAaUHzcq4ISvCQRAc1ObqaOyqN1zd/j1+ft+9AHzt4WOxufM
         6Xh0KoyB7tTMmEjSahpegSzRR9Dj45KVcV3MVzwLLCYRy0CzdW1bjkLVBmwHahNemOiO
         igzWWIC4n0rT1lV0Tu4YocLe3YCUjpRthAGE06sxpy7TOFi9GtJP30unAFJHy+4c6ABT
         NBKg==
X-Gm-Message-State: AOJu0YySR0g5jWNNIbCQhD/jSgu22Lor870I6TkYlNSEPQZhejqFSm/E
	oGF+lwqLKhDQv4R8Qfh8EId89m5ml5gHwn9f2+98vA1TMKC2YBt0H2A7H6zRXR7c
X-Gm-Gg: AZuq6aLkoBas2T8AwEkcFY2RuvI3IMvHDJ97caaSfuKYszyhvx0i8yahbgKXN/6h8Jr
	o45eT0huZ1arhLMcBh6oz9E8wB9wjuf3216VW0yRIQpuFxfS3vqMw+ykviStRJflIxOqD5g+N/B
	PsGpoBxjMZNUVfjoDFzDT8e6Wv5/1489xveQSznGfeoU8pR52CRXFSRiKyJHVWMNjAuJGJ8modb
	PyPxe7oMHRTtbMD1PRKWRwQiNCCfkBmqYy43gLcZeketsWSbyCYRMLaZw2S5xaanOkSibnjWUQB
	T55FOOX2l2mLtInC+bAaaUmJqdAuxPATGLIz4MqtUM8z6Ea7fxIsjW7UGT8uMsrZZcdGlifF4Fk
	A7Mvwe37klrbKqC3AhXh1fMN0mMg4fZcfNziZ8uGuYI0BHmAFIcB03ZeGVF4+BxhqcDXlCZ2fwG
	kO7csStFoKVgMQYHT3xPedUJ1a7AdNALp67EnXoL4enlhwsRXC09H92qdEGIy5GvSsv+IkMRxYV
	OaZ2LRtPIosmOUE8vxANN6TgZ8IRANi2gKQtoaS1udKmtgipOpgHBYrjvGpSGRlcgO35Q==
X-Received: by 2002:ac8:5945:0:b0:4fc:8ed0:d4a4 with SMTP id d75a77b69052e-506399fe0c2mr196362651cf.64.1770692696799;
        Mon, 09 Feb 2026 19:04:56 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5063928e436sm88595551cf.17.2026.02.09.19.04.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 19:04:55 -0800 (PST)
From: bruce.ashfield@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [meta][kirkstone][PATCH 04/05] linux-yocto/5.15: update to v5.15.198
Date: Mon,  9 Feb 2026 22:04:47 -0500
Message-ID: <20260210030448.1344854-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210030448.1344854-1-bruce.ashfield@gmail.com>
References: <20260210030448.1344854-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 03:05:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230833

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    9eec9a14ee10 Linux 5.15.198
    72d750886b21 NFS: add barriers when testing for NFS_FSDATA_BLOCKED
    7981cff2bee1 NFS: unlink/rmdir shouldn't call d_delete() twice on ENOENT
    220a5ee395e0 efi/cper: Fix cper_bits_to_str buffer handling and return value
    b82594248af1 firmware: imx: scu-irq: Set mu_resource_id before get handle
    bbd35608330d scsi: sg: Fix occasional bogus elapsed time that exceeds timeout
    5517e2497d11 ASoC: fsl_sai: Add missing registers to cache default
    c3a4316e3c74 can: j1939: make j1939_session_activate() fail if device is no longer registered
    c618c4ccb79b powercap: fix sscanf() error return value handling
    7b78832aa94f powercap: fix race condition in register_control_type()
    047ea38d41d9 blk-throttle: Set BIO_THROTTLED when bio has been throttled
    7f7080c51410 pinctrl: qcom: lpass-lpi: mark the GPIO controller as sleeping
    3dc4b3bb4e0a pinctrl: qcom: lpass-lpi: Remove duplicate assignment of of_gpio_n_cells
    ef668c9a2261 counter: interrupt-cnt: Drop IRQF_NO_THREAD flag
    e8bfa2401d4c nfsd: provide locking for v4_end_grace
    061158d27c46 NFSD: Remove NFSERR_EAGAIN
    530476199947 nfs_common: factor out nfs_errtbl and nfs_stat_to_errno
    eb204a6d8bad NFS: trace: show TIMEDOUT instead of 0x6e
    393525dee5c3 arp: do not assume dev_hard_header() does not change skb->head
    2caa31d02c73 net: enetc: fix build warning when PAGE_SIZE is greater than 128K
    a40af9a2904a net: usb: pegasus: fix memory leak in update_eth_regs_async()
    0809c4bc06c9 net/sched: sch_qfq: Fix NULL deref when deactivating inactive aggregate in qfq_reset
    303987beb595 HID: quirks: work around VID/PID conflict for appledisplay
    b4bfc8d26b96 bnxt_en: Fix potential data corruption with HW GRO/LRO
    4248fb36df8d eth: bnxt: move and rename reset helpers
    0e9a7c61978e net/mlx5e: Don't print error message due to invalid module
    ac1fd8362346 netdev: preserve NETIF_F_ALL_FOR_ALL across TSO updates
    c655d2167bf0 net: sock: fix hardened usercopy panic in sock_recv_errqueue
    bee569f5fcf7 inet: ping: Fix icmp out counting
    8767f238b0e6 net: mscc: ocelot: Fix crash when adding interface under a lag
    bf1ffe5e95bd bridge: fix C-VLAN preservation in 802.1ad vlan_tunnel egress
    8a4333b2818f net: marvell: prestera: fix NULL dereference on devlink_alloc() failure
    c4cde57c8aff netfilter: nf_conncount: update last_gc only when GC has been performed
    92d17b97479c netfilter: nf_tables: fix memory leak in nf_tables_newrule()
    d65b19f34c2a netfilter: nft_synproxy: avoid possible data-race on update operation
    ddd097698d8b ARM: dts: imx6q-ba16: fix RTC interrupt level
    e91cffed1c58 arm64: dts: add off-on-delay-us for usdhc2 regulator
    274dfe3b1801 scsi: Revert "scsi: libsas: Fix exp-attached device scan after probe failure scanned in again after probe failed"
    ebabaddab72c scsi: ipr: Enable/disable IRQD_NO_BALANCING during reset
    5ef4392495a8 NFS: Fix up the automount fs_context to use the correct cred
    f269abad66bd NFSv4: ensure the open stateid seqid doesn't go backwards
    d4d09d18059a alpha: don't reference obsolete termio struct for TC* constants
    8c97b0183923 ARM: 9461/1: Disable HIGHPTE on PREEMPT_RT kernels
    df9967c3b757 csky: fix csky_cmpxchg_fixup not working
    b374e9ecc92a ext4: fix out-of-bound read in ext4_xattr_inode_dec_ref_all()
    6c94fd068ba2 ext4: introduce ITAIL helper
    5d0dc83cb9a6 libceph: make calc_target() set t->paused, not just clear it
    77229551f2cf libceph: return the handler error from mon_handle_auth_done()
    851241d3f78a libceph: make free_choose_arg_map() resilient to partial allocation
    4b106fbb1c7b libceph: replace overzealous BUG_ON in osdmap_apply_incremental()
    194cfe2af4d2 libceph: prevent potential out-of-bounds reads in handle_auth_done()
    a3827e310b5a wifi: avoid kernel-infoleak from struct iw_point
    6a0cceb1a8b9 drm/pl111: Fix error handling in pl111_amba_probe
    250e1f9f911d lib/crypto: aes: Fix missing MMU protection for AES S-box
    e57137354d85 mei: me: add nova lake point S DID
    6cff14b831db net: 3com: 3c59x: fix possible null dereference in vortex_probe1()
    02b79361cf97 atm: Fix dma_free_coherent() size
    7f696f15c18b usb: gadget: lpc32xx_udc: fix clock imbalance in error path
    c3ba0557ab2e net: ethtool: fix the error condition in ethtool_get_phy_stats_ethtool()
    f3cc921c237c Revert "iommu/amd: Skip enabling command/event buffers for kdump"
    0b956f79b2f8 firmware: arm_scmi: Fix unused notifier-block in unregister
    3079bf04d35f ext4: fix error message when rejecting the default hash
    bfac7e3ff587 ext4: factor out ext4_hash_info_init()
    86b81d4eab1c ext4: filesystems without casefold feature cannot be mounted with siphash
    e1b826e10ff9 pwm: stm32: Always program polarity
    69e4c711d3f5 x86: remove __range_not_ok()
    dd6d10e00cf4 selftests: net: test_vxlan_under_vrf: fix HV connectivity test
    20d3eb00ab81 ipv4: Fix uninit-value access in __ip_make_skb()
    40e5444a3ac3 ipv6: Fix potential uninit-value access in __ip6_make_skb()
    ef2fe0c6353b KVM: arm64: sys_regs: disable -Wuninitialized-const-pointer warning
    eeeaba737919 HID: core: Harden s32ton() against conversion to 0 bits
    5f35099fa3d5 KVM: x86: Acquire kvm->srcu when handling KVM_SET_VCPU_EVENTS
    d69f28ef7cda page_pool: Fix use-after-free in page_pool_recycle_in_ring
    aec6a1be0be1 drm/i915/selftests: fix subtraction overflow bug
    0f55ac683b27 mmc: core: use sysfs_emit() instead of sprintf()
    f51e471cb157 net: Remove RTNL dance for SIOCBRADDIF and SIOCBRDELIF.
    32ffca069d20 drm/gma500: Remove unused helper psb_fbdev_fb_setcolreg()
    0a59a3895f80 wifi: mac80211: Discard Beacon frames to non-broadcast address
    7daa50a2157e ASoC: stm32: sai: fix OF node leak on probe
    ecd91855dd4f lockd: fix vfs_test_lock() calls
    86d91420bbe3 powerpc/pseries/cmm: adjust BALLOON_MIGRATE when migrating pages
    325fd00621d5 mm/balloon_compaction: convert balloon_page_delete() to balloon_page_finalize()
    ed920d0feafb mm/balloon_compaction: we cannot have isolated pages in the balloon list
    f16e78225eda mm/balloon_compaction: make balloon page compaction callbacks static
    1e3a5fec4917 ASoC: stm32: sai: fix clk prepare imbalance on probe failure
    a93887d284a6 ASoC: stm32: sai: Use the devm_clk_get_optional() helper
    39e5b2de0207 ASoC: stm: Use dev_err_probe() helper
    6009167915d5 r8169: fix RTL8117 Wake-on-Lan in DASH mode
    4c0278938c36 iommu/qcom: fix device leak on of_xlate()
    2e9a95d60f1d powerpc/64s/slb: Fix SLB multihit issue during SLB preload
    374f9984edc8 PCI: brcmstb: Fix disabling L0s capability
    bf03a56d6af9 powerpc/pseries/cmm: call balloon_devinfo_init() also without CONFIG_BALLOON_COMPACTION
    4141049144b3 media: renesas: rcar_drif: fix device node reference leak in rcar_drif_bond_enabled
    3ccce30e5919 media: samsung: exynos4-is: fix potential ABBA deadlock on init
    75f91534f9ac NFSD: NFSv4 file creation neglects setting ACL
    2e6f384b4e6c media: verisilicon: Protect G2 HEVC decoder against invalid DPB index
    b425cd5bc54e media: vpif_capture: fix section mismatch
    61d19d81485d media: mediatek: vcodec: Fix a reference leak in mtk_vcodec_fw_vpu_init()
    4dedb6a11243 SUNRPC: svcauth_gss: avoid NULL deref on zero length gss_token in gss_read_proxy_verf
    610ef5893628 KVM: SVM: Mark VMCB_NPT as dirty on nested VMRUN
    543bf004e4ea crypto: af_alg - zero initialize memory allocated via sock_kmalloc
    a22316f5e9a2 svcrdma: bound check rq_pages index in inline path
    c80b58581fad ARM: dts: microchip: sama7g5: fix uart fifo size to 32
    cbbf3f1bb9f8 fuse: fix readahead reclaim deadlock
    a6c208695220 usb: ohci-nxp: fix device leak on probe failure
    0928573aeccb usb: ohci-nxp: Use helper function devm_clk_get_enabled()
    50ee04e0ae62 mptcp: pm: ignore unknown endpoint flags
    2cf9e72ec9a4 usb: dwc3: keep susphy enabled during exit to avoid controller faults
    72c58a82e6fb f2fs: fix to avoid updating zero-sized extent in extent cache
    671910d2e5b8 f2fs: fix to propagate error from f2fs_enable_checkpoint()
    474cc3ed3743 f2fs: use global inline_xattr_slab instead of per-sb slab cache
    f30ea4a9e793 f2fs: fix to detect recoverable inode during dryrun of find_fsync_dnodes()
    0e8bddb3e081 xfs: fix a memory leak in xfs_buf_item_init()
    06cad7ba5c7b KVM: nVMX: Immediately refresh APICv controls as needed on nested VM-Exit
    fa2dd45ce8ae NFSD: Clear SECLABEL in the suppattr_exclcreat bitmap
    d2f5d8cf1ead ALSA: wavefront: Fix integer overflow in sample size validation
    73d7bfacc5ca ALSA: wavefront: Use standard print API
    151c632b9162 ALSA: wavefront: Clear substream pointers on close
    214a854d0d99 wifi: mt76: Fix DTS power-limits on little endian systems
    8a589c56b0d6 btrfs: don't rewrite ret from inode_permission
    275c686f1e3c tpm: Cap the number of PCR banks
    ed7441ffe3fd jbd2: fix the inconsistency between checksum and data in memory for journal sb
    ee199d259349 xhci: dbgtty: fix device unregister
    4b4315ab4a14 xhci: dbgtty: use IDR to support several dbc instances.
    eee16f3ff08e usb: gadget: udc: fix use-after-free in usb_gadget_state_work
    8b586de6f03c usb: xhci: Apply the link chain quirk on NEC isoc endpoints
    d16a2857ad17 usb: xhci: move link chain bit quirk checks into one helper function.
    86aae7053d2d drm/vmwgfx: Fix a null-ptr access in the cursor snooper
    cfb82ea9cccc virtio_console: fix order of fields cols and rows
    6161d0d62351 kbuild: Use CRC32 and a 1MiB dictionary for XZ compressed modules
    94b45fddc261 mm/damon/tests/core-kunit: handle memory alloc failure from damon_test_aggregate()
    554b17dc14d0 mm/damon/tests/core-kunit: handle alloc failures on damon_test_split_regions_of()
    77ec39ad0ceb mm/damon/tests/core-kunit: handle memory failure from damon_test_target()
    233409d46dc5 mm/damon/tests/core-kunit: handle alloc failures on damon_test_merge_two()
    3f7668f4ffd5 mm/damon/tests/core-kunit: handle alloc failures on dasmon_test_merge_regions_of()
    db10496b2797 mm/damon/tests/core-kunit: handle alloc failures on damon_test_split_at()
    df458acf79c6 mm/damon/tests/core-kunit: handle allocation failures in damon_test_regions()
    c6895612b1e4 mm/damon/tests/vaddr-kunit: handle alloc failures on damon_test_split_evenly_succ()
    5629064f92f0 RDMA/core: Fix "KASAN: slab-use-after-free Read in ib_register_device" problem
    483b541b7ee3 mm/damon/tests/vaddr-kunit: handle alloc failures on damon_do_test_apply_three_regions()
    5ff02cf6c74d mm/damon/tests/vaddr-kunit: handle alloc failures in damon_test_split_evenly_fail()
    87caa0d35aab drm/nouveau/dispnv50: Don't call drm_atomic_get_crtc_state() in prepare_fb
    47a85604a761 drm/ttm: Avoid NULL pointer deref for evicted BOs
    d376aea5f101 drm/msm/a6xx: Fix out of bound IO access in a6xx_get_gmu_registers
    e02a1c33f10a net: nfc: fix deadlock between nfc_unregister_device and rfkill_fop_write
    66d3d821a27f net: usb: sr9700: fix incorrect command used to write single register
    02a02eb93cec nfsd: Drop the client reference in client_states_open()
    96e9b4b4eebe fjes: Add missing iounmap in fjes_hw_init()
    278b7cfe0d4d e1000: fix OOB in e1000_tbi_should_accept()
    abf38398724e RDMA/cm: Fix leaking the multicast GID table reference
    bfe10318fc23 RDMA/core: Check for the presence of LS_NLA_TYPE_DGID correctly
    adca36b7312f idr: fix idr_alloc() returning an ID out of range
    ec9fd10b4803 media: i2c: adv7842: Remove redundant cancel_delayed_work in probe
    d80c606877e3 media: i2c: ADV7604: Remove redundant cancel_delayed_work in probe
    3de6afefd37e media: TDA1997x: Remove redundant cancel_delayed_work in probe
    faf38cced019 media: msp3400: Avoid possible out-of-bounds array accesses in msp3400c_thread()
    718fd69207b6 media: cec: Fix debugfs leak on bus_register() failure
    c3548c44c3c2 fbdev: tcx.c fix mem_map to correct smem_start offset
    37fa1e7e4884 fbdev: pxafb: Fix multiple clamped values in pxafb_adjust_timing
    51fd9c20a530 fbdev: gbefb: fix to use physical address instead of dma address
    c9d6fc7d60c6 dm-ebs: Mark full buffer dirty even on partial write
    f913b9a2ccd6 media: adv7842: Avoid possible out-of-bounds array accesses in adv7842_cp_log_status()
    6a483e56c1ad parisc: entry: set W bit for !compat tasks in syscall_restore_rfi()
    0a476ed7bc87 parisc: entry.S: fix space adjustment on interruption for 64-bit userspace
    76bbb99a030f media: rc: st_rc: Fix reset control resource leak
    f69506115f61 mfd: max77620: Fix potential IRQ chip conflict when probing two devices
    ef97d93d0775 mfd: altera-sysmgr: Fix device leak on sysmgr regmap lookup
    a357f04e6c47 leds: leds-lp50xx: LP5009 supports 3 modules for a total of 9 LEDs
    e24cad510abc leds: leds-lp50xx: Allow LED 0 to be added to module bank
    c9f0eac5745d PCI/PM: Reinstate clearing state_saved in legacy and !PM codepaths
    f0ae659c9652 HID: logitech-dj: Remove duplicate error logging
    3f50e9dbfe9d iommu/tegra: fix device leak on probe_device()
    157b01742a68 iommu/sun50i: fix device leak on of_xlate()
    fa4e003b8fcf iommu/omap: fix device leaks on probe_device()
    6705d63820c6 iommu/mediatek: fix device leak on of_xlate()
    e6b0e3882ab0 iommu/mediatek-v1: fix device leak on probe_device()
    cadf7c83302f iommu/ipmmu-vmsa: fix device leak on of_xlate()
    f62661f577b3 iommu/exynos: fix device leak on of_xlate()
    ac0c50cc85ed iommu/apple-dart: fix device leak on of_xlate()
    fdb64bba6a46 ASoC: qcom: qdsp6: q6asm-dai: set 10 ms period and buffer alignment.
    d543ddcecc93 ASoC: qcom: q6adm: the the copp device only during last instance
    47587d958185 ASoC: qcom: q6asm-dai: perform correct state check before closing
    938117827bca ASoC: stm32: sai: fix device leak on probe
    d739270d09e0 selftests/ftrace: traceonoff_triggers: strip off names
    1f29db2cfb01 RDMA/bnxt_re: fix dma_free_coherent() pointer
    2d34cffaf8c9 RDMA/rtrs: Fix clt_path::max_pages_per_mr calculation
    19682d51e1b6 RDMA/bnxt_re: Fix to use correct page size for PDE table
    b299f01e464d RDMA/bnxt_re: Fix IB_SEND_IP_CSUM handling in post_send
    8165f064641c RDMA/bnxt_re: Fix incorrect BAR check in bnxt_qplib_map_creq_db()
    af9a938b087d RDMA/core: Fix logic error in ib_get_gids_from_rdma_hdr()
    c8002b3a098a RDMA/efa: Remove possible negative shift
    db93ae6fa66f RDMA/irdma: avoid invalid read in irdma_net_event
    ed2639414d43 net: rose: fix invalid array index in rose_kill_by_device()
    33ff5c207c87 ipv4: Fix reference count leak when using error routes with nexthop objects
    6b7522424529 ipv6: BUG() in pskb_expand_head() as part of calipso_skbuff_setattr()
    4cc4cfe4d23c octeontx2-pf: fix "UBSAN: shift-out-of-bounds error"
    6b3a6cb3493f net: bridge: Describe @tunnel_hash member in net_bridge_vlan_group struct
    fc96018f09f8 net: usb: asix: validate PHY address before use
    b3c214ac512e net: dsa: b53: skip multicast entries for fdb_dump()
    d55b060b6c56 firewire: nosy: Fix dma_free_coherent() size
    1fc0c943e445 genalloc.h: fix htmldocs warning
    1c4cb705e733 smc91x: fix broken irq-context in PREEMPT_RT
    2f966186b995 net: usb: rtl8150: fix memory leak on usb_submit_urb() failure
    f820e438b8ec team: fix check for port enabled in team_queue_override_port_prio_changed()
    6f935c0f549f platform/x86: ibm_rtl: fix EBDA signature search pointer arithmetic
    1c423f0fcb08 platform/x86: msi-laptop: add missing sysfs_remove_group()
    41a1a3140aff ip6_gre: make ip6gre_header() robust
    052e5db5be45 net: openvswitch: Avoid needlessly taking the RTNL on vport destroy
    214802e4caaa net: mdio: aspeed: add dummy read to avoid read-after-write issue
    6ff75a5132df net: mdio: aspeed: move reg accessing part into separate functions
    fff9206b0907 Bluetooth: btusb: revert use of devm_kzalloc in btusb
    baf0e2d1e03d crypto: seqiv - Do not use req->iv after crypto_aead_encrypt
    5bb18bfd505c iavf: fix off-by-one issues in iavf_config_rss_reg()
    cfddf4af22a3 i40e: validate ring_len parameter against hardware-specific values
    0daf39ee1e4e i40e: Refactor argument of i40e_detect_recover_hung()
    3fec9e1bad69 i40e: Refactor argument of several client notification functions
    4f28b415a483 i40e: fix scheduling in set_rx_mode
    f7455c5f9218 hwmon: (w83l786ng) Convert macros to functions to avoid TOCTOU
    bf5b03227f2e hwmon: (w83791d) Convert macros to functions to avoid TOCTOU
    5082cdce4344 hwmon: (max16065) Use local variable to avoid TOCTOU
    ac45b270ea28 i2c: amd-mp2: fix reference leak in MP2 PCI device
    24fd02c3a479 rpmsg: glink: fix rpmsg device leak
    dd86de8f8573 soc: amlogic: canvas: fix device leak on lookup
    5527dde9ff12 soc: qcom: ocmem: fix device leak on lookup
    53693b3268c2 amba: tegra-ahb: Fix device leak on SMMU enable
    5ba8ba12920c drm/amd/display: Use GFP_ATOMIC in dc_create_plane_state()
    2420ef01b2e8 io_uring: fix filename leak in __io_openat_prep()
    685889472f29 svcrdma: return 0 on success from svc_rdma_copy_inline_range
    8564deae5375 nfsd: Mark variable __maybe_unused to avoid W=1 build break
    859bdf438f01 fsnotify: do not generate ACCESS/MODIFY events on child for special files
    323e203a944b PM: runtime: Do not clear needs_force_resume with enabled runtime PM
    6d15f08e6d8d tracing: Do not register unsupported perf events
    fd4c14c7b772 KVM: nSVM: Clear exit_code_hi in VMCB when synthesizing nested VM-Exits
    d8c44d566187 KVM: nSVM: Set exit_code_hi to -1 when synthesizing SVM_EXIT_ERR (failed VMRUN)
    30c71d9b4d76 KVM: nSVM: Propagate SVM_EXIT_CR0_SEL_WRITE correctly for LMSW emulation
    d2da0df7bbc4 KVM: x86: Fix VM hard lockup after prolonged inactivity with periodic HV timer
    6ae727f72be0 KVM: x86: Explicitly set new periodic hrtimer expiration in apic_timer_fn()
    fa0c3fbc4bb5 KVM: x86: WARN if hrtimer callback for periodic APIC timer fires with period=0
    145d140abda8 libceph: make decode_pool() more resilient against corrupted osdmaps
    7a146f34e5be parisc: Do not reprogram affinitiy on ASP chip
    cfdf6250b63b scs: fix a wrong parameter in __scs_magic
    e1da6e399df9 platform/chrome: cros_ec_ishtp: Fix UAF after unbinding driver
    d0fd1f732ea8 ocfs2: fix kernel BUG in ocfs2_find_victim_chain
    12ab6ebb3778 media: vidtv: initialize local pointers upon transfer of memory ownership
    04e5abccf5a3 tools/testing/nvdimm: Use per-DIMM device handle
    0de4977a1eea f2fs: fix return value of f2fs_recover_fsync_data()
    3d95ed8cf980 f2fs: invalidate dentry cache on failed whiteout creation
    45fd86b44410 scsi: target: Reset t_task_cdb pointer in error case
    fc3ab9b2cce5 NFSD: use correct reservation type in nfsd4_scsi_fence_client
    278455a82245 scsi: aic94xx: fix use-after-free in device removal path
    50b097d92c99 scsi: Revert "scsi: qla2xxx: Perform lockless command completion in abort path"
    47e7c7496f5a cpufreq: nforce2: fix reference count leak in nforce2
    4f3e0af0d9a8 intel_th: Fix error handling in intel_th_output_open
    d1b045228002 char: applicom: fix NULL pointer dereference in ac_ioctl
    677f382acab1 usb: renesas_usbhs: Fix a resource leak in usbhs_pipe_malloc()
    439c8d0425bb usb: dwc3: of-simple: fix clock resource leak in dwc3_of_simple_probe
    43e58abad6c0 usb: phy: isp1301: fix non-OF device reference imbalance
    0c2b0e747010 USB: lpc32xx_udc: Fix error handling in probe
    76b52ed875d5 phy: broadcom: bcm63xx-usbh: fix section mismatches
    424dd7ef4109 media: pvrusb2: Fix incorrect variable used in trace message
    c2305b4c5fc1 media: dvb-usb: dtv5100: fix out-of-bounds in dtv5100_i2c_msg()
    d14c800ec300 usb: usb-storage: Maintain minimal modifications to the bcdDevice range.
    0ea5763a6ced media: v4l2-mem2mem: Fix outdated documentation
    048f29c90275 jbd2: use a weaker annotation in journal handling
    a973d037229b ext4: align max orphan file size with e2fsprogs limit
    2930d9cb9cd3 ext4: fix incorrect group number assertion in mb_check_buddy
    331d6f52201b ext4: clear i_state_flags when alloc inode
    3d8d22e75f7e ext4: xattr: fix null pointer deref in ext4_raw_inode()
    ea4e2ad6f612 ktest.pl: Fix uninitialized var in config-bisect.pl
    1c0e2617b51c fs/ntfs3: fix mount failure for sparse runs in run_unpack()
    7f24094db7af floppy: fix for PAGE_SIZE != 4KB
    2f945c9892b0 block: rate-limit capacity change info log
    3c35608d6577 lib/crypto: x86/blake2s: Fix 32-bit arg treated as 64-bit
    d685237855bf mmc: sdhci-msm: Avoid early clock doubling during HS400 transition
    3fd7df4636d8 KEYS: trusted: Fix a memory leak in tpm2_load_cmd
    8a69b95bc8c4 vhost/vsock: improve RCU read sections around vhost_vsock_get()
    94476ed97e38 platform/x86/intel/hid: Add Dell Pro Rugged 10/12 tablet to VGBS DMI quirks
    4099d8f057f2 nvme-fc: don't hold rport lock when putting ctrl
    8cb8a84f7af3 serial: sprd: Return -EPROBE_DEFER when uart clock is not ready
    db963adebdf5 usb: usb-storage: No additional quirks need to be added to the EL-R12 optical drive.
    6ddc1cf758b2 usb: xhci: limit run_graceperiod for only usb 3.0 devices
    58941bbb0050 usb: typec: ucsi: Handle incorrect num_connectors capability
    f3f0303b5330 usbip: Fix locking bug in RT-enabled kernels
    c4034574f87a exfat: fix remount failure in different process environments
    c7b986adc9e9 via_wdt: fix critical boot hang due to unnamed resource allocation
    36fe06f5a292 scsi: qla2xxx: Use reinit_completion on mbx_intr_comp
    8416236b992f scsi: qla2xxx: Fix initiator mode with qlini_mode=exclusive
    80e898a3c614 scsi: qla2xxx: Fix lost interrupts with qlini_mode=disabled
    46778b34e021 powerpc/addnote: Fix overflow on 32-bit builds
    c49300043e7b clk: mvebu: cp110 add CLK_IGNORE_UNUSED to pcie_x10, pcie_x11 & pcie_x4
    a5622f46f4fc ti-sysc: allow OMAP2 and OMAP4 timers to be reserved on AM33xx
    92f285834099 firmware: imx: scu-irq: Init workqueue before request mbox channel
    22292508e1c9 ipmi: Fix __scan_channels() failing to rescan channels
    5c7d972756d4 ipmi: Fix the race between __scan_channels() and deliver_response()
    2168866396bd ALSA: usb-mixer: us16x08: validate meter packet indices
    19b626d36aed ALSA: pcmcia: Fix resource leak in snd_pdacf_probe error path
    9f490d2f5dc9 ALSA: vxpocket: Fix resource leak in vxpocket_probe error path
    c851e43b88b4 net/hsr: fix NULL pointer dereference in prp_get_untagged_frame()
    2b4aa7f24820 mmc: sdhci-esdhc-imx: add alternate ARCH_S32 dependency to Kconfig
    9c34a4a2ead0 spi: fsl-cpm: Check length parity before switching to 16 bit mode
    b5e70e7fa904 ACPI: CPPC: Fix missing PCC check for guaranteed_perf
    d16cc7a2b3ed Input: i8042 - add TUXEDO InfinityBook Max Gen10 AMD to i8042 quirk table
    136abe173a3c Input: ti_am335x_tsc - fix off-by-one error in wire_order validation
    ac6b3033d1e5 HID: input: map HID_GD_Z to ABS_DISTANCE for stylus/pen
    42c91dfa772c net: hns3: add VLAN id validation before using
    c9bbeca124e9 net: hns3: using the num_tqps to check whether tqp_index is out of range when vf get ring info from mbx
    de631a0f9872 net: hns3: Align type of some variables with their print type
    bcefdb288eed net: hns3: using the num_tqps in the vf driver to apply for resources
    42406760b28c net/mlx5: fw_tracer, Handle escaped percent properly
    768d559f466c net/mlx5: fw_tracer, Validate format string parameters
    a59e9812aca1 net/mlx5: fw_tracer, Add support for unrecognized string
    f9dc0f45d2cd ethtool: Avoid overflowing userspace buffer on stats query
    72d1c4a07780 net/ethtool/ioctl: split ethtool_get_phy_stats into multiple helpers
    c8666be7c338 net/ethtool/ioctl: remove if n_stats checks from ethtool_get_phy_stats
    78f0d7353bdf ethtool: use phydev variable
    7bf3910b82f6 nfc: pn533: Fix error code in pn533_acr122_poweron_rdr()
    02783a37cb1c net/sched: ets: Remove drr class from the active list if it changes to strict
    c54091eec6fe caif: fix integer underflow in cffrml_receive()
    312d7cd88882 ipvs: fix ipv4 null-ptr-deref in route error path
    e1ac8dce3a89 netfilter: nf_conncount: fix leaked ct in error paths
    a94493dd78b4 broadcom: b44: prevent uninitialized value usage
    3bc2efff20a3 net: openvswitch: fix middle attribute validation in push_nsh() action
    6e367c361a52 mlxsw: spectrum_mr: Fix use-after-free when updating multicast route stats
    9e0a0d9eeb0d mlxsw: spectrum_router: Fix neighbour use-after-free
    194cd36ec05d ipvlan: Ignore PACKET_LOOPBACK in handle_mode_l2()
    c7f6e7cc14df net/sched: ets: Always remove class from active list before deleting in ets_qdisc_change
    09efbf54eeae netrom: Fix memory leak in nr_sendmsg()
    e0f859d5035a Bluetooth: btusb: Add new VID/PID 13d3/3533 for RTL8821CE
    ca91db4f8979 btrfs: scrub: always update btrfs_scrub_progress::last_physical
    eb6a4e7e3d04 hfsplus: fix volume corruption issue for generic/073
    d92333c7a358 hfsplus: Verify inode mode when loading from disk
    39e149d58ef4 hfsplus: fix missing hfs_bnode_get() in __hfs_bnode_create
    1432a4819917 hfsplus: fix volume corruption issue for generic/070
    f6ca2faa3f3e fs/ntfs3: Support timestamps prior to epoch
    3d4e15ef5ccb livepatch: Match old_sympos 0 and 1 in klp_find_func()
    a0f5ffc01af5 cpufreq: s5pv210: fix refcount leak
    08ba2b9983ad ACPI: property: Use ACPI functions in acpi_graph_get_next_endpoint() only
    ecb296286c87 ACPICA: Avoid walking the Namespace if start_node is NULL
    0144d18dd96d x86/ptrace: Always inline trivial accessors
    9019e399684e sched/deadline: only set free_cpus for online runqueues
    fe293b7b0759 btrfs: fix memory leak of fs_devices in degraded seed device path
    b3f937e8912d bpf, arm64: Do not audit capability check in do_jit()
    2ed5e0ca5d9a spi: tegra210-quad: Fix X1_X2_X4 encoding and support x4 transfers
    36cb73c557d1 spi: tegra210-quad: Fix validate combined sequence
    fcf4ad3208e9 coresight: etm4x: Correct polling IDLE bit
    754512b096b9 netfilter: nf_conncount: garbage collection is not skipped when jiffies wrap around
    460fd9a9e820 NFS: Fix missing unlock in nfs_unlink()
    434b84ecb8ff ASoC: fsl_xcvr: get channel status data when PHY is not exists
    3cf854cec0eb ALSA: dice: fix buffer overflow in detect_stream_formats()
    ce205e480799 usb: phy: Initialize struct usb_phy list_head
    b3c4465f2519 usb: gadget: tegra-xudc: Always reinitialize data toggle when clear halt
    8877bbb620a9 ocfs2: fix memory leak in ocfs2_merge_rec_left()
    c5a352071f83 efi/cper: align ARM CPER type with UEFI 2.9A/2.10 specs
    ec7b34401123 efi/cper: Adjust infopfx size to accept an extra space
    095ebf8277b5 efi/cper: Add a new helper function to print bitmasks
    de9f85fdf7eb dm log-writes: Add missing set_freezable() for freezable kthread
    8d656002fa38 dm-raid: fix possible NULL dereference with undefined raid type
    a9bfe4eb0103 ARM: 9464/1: fix input-only operand modification in load_unaligned_zeropad()
    ceb5dff91c86 ALSA: uapi: Fix typo in asound.h comment
    7f031777be02 dma/pool: eliminate alloc_pages warning in atomic_pool_expand
    d8b52fa40fc8 block: fix comment for op_is_zone_mgmt() to include RESET_ALL
    8fe7de5d1c7f blk-mq: Abort suspend when wakeup events are pending
    f123e1fad3a8 ASoC: ak5558: Disable regulator when error happens
    8cb3ed1b5669 ASoC: ak4458: Disable regulator when error happens
    5a38a44815e0 ASoC: bcm: bcm63xx-pcm-whistler: Check return value of of_dma_configure()
    97044043d531 platform/x86: asus-wmi: use brightness_set_blocking() for kbd led
    680f72890147 fs/nls: Fix inconsistency between utf8_to_utf32() and utf32_to_utf8()
    ba1495aefd22 NFS: Automounted filesystems should inherit ro,noexec,nodev,sync flags
    1b44528bf4a1 fs_context: drop the unused lsm_flags member
    ce578fbf8e83 Revert "nfs: ignore SB_RDONLY when mounting nfs"
    8e921550cc85 Revert "nfs: clear SB_RDONLY before getting superblock"
    dca481c17f81 Revert "nfs: ignore SB_RDONLY when remounting nfs"
    b6e4e3a08c03 NFSv4/pNFS: Clear NFS_INO_LAYOUTCOMMIT in pnfs_mark_layout_stateid_invalid
    3dc5156ad61a NFS: Initialise verifiers for visible dentries in nfs_atomic_open()
    e77419cbb547 NFS: Fix the verifier for case sensitive filesystem in nfs_atomic_open()
    19bac87dd821 NFSv4: Add some support for case insensitive filesystems
    3e367777b69c fs/nls: Fix utf16 to utf8 conversion
    2093051b4698 NFS: Avoid changing nlink when file removes and attribute updates race
    777564417810 NFS: don't unhash dentry during unlink/rename
    186072b7a23c NFS: Label the dentry with a verifier in nfs_rmdir() and nfs_unlink()
    5f1bc99ea831 fbdev: ssd1307fb: fix potential page leak in ssd1307fb_probe()
    007408ab8449 pinctrl: single: Fix incorrect type for error return variable
    184146300f78 pinctrl: single: Fix PIN_CONFIG_BIAS_DISABLE handling
    8609287a2646 perf tools: Fix split kallsyms DSO counting
    38abf6e931b1 net/sched: sch_cake: Fix incorrect qlen reduction in cake_drop
    140e6cd7b092 remoteproc: qcom_q6v5_wcss: fix parsing of qcom,halt-regs
    0d39bd3ef77a mtd: lpddr_cmds: fix signed shifts in lpddr_cmds
    1d6155900a69 net: stmmac: fix rx limit check in stmmac_rx_zc()
    53bc0ac47f4f netfilter: nft_connlimit: update the count if add was skipped
    b160895d6bc9 netfilter: nf_conncount: rework API to use sk_buff directly
    be69850b461e netfilter: nf_conncount: reduce unnecessary GC
    aea811b4cf6c netfilter: flowtable: check for maximum number of encapsulations in bridge vlan
    9d041a7ba13f regulator: core: Protect regulator_supply_alias_list with regulator_list_mutex
    4a79a1d496b9 ASoC: Intel: catpt: Fix error path in hw_params()
    c6035886b9d8 virtio: fix virtqueue_set_affinity() docs
    9410895c0e5f virtio_vdpa: fix misleading return in void function
    a9f01f0776f0 vdpa: Sync calls set/get config/status with cf_mutex
    447092100c7e vdpa: Introduce query of device config layout
    3ca8c7a6f9a0 vdpa: Introduce and use vdpa device get, set config helpers
    eed1541ff09d ext4: improve integrity checking in __mb_check_buddy by enhancing order-0 validation
    c082093313c0 ext4: remove unused return value of __mb_check_buddy
    99e011a78210 ACPI: processor_core: fix map_x2apic_id for amd-pstate on am4
    1e8124068c93 drm/amd/display: Fix logical vs bitwise bug in get_embedded_panel_info_v2_1()
    212825c1c8cb ASoC: fsl_xcvr: clear the channel status control memory
    650127b100b1 ASoC: fsl_xcvr: Add support for i.MX93 platform
    c464a9e42def ASoC: fsl_xcvr: Add Counter registers
    9cfb946f51ce RDMA/irdma: Fix data race in irdma_free_pble
    04050bf1a767 RDMA/irdma: Fix data race in irdma_sc_ccq_arm
    5c494997d09e iommu/arm-smmu-qcom: Enable use of all SMR groups when running bare-metal
    342b2c26e5ac backlight: lp855x: Fix lp855x.h kernel-doc warnings
    cd01a24b3e52 backlight: led-bl: Add devlink to supplier LEDs
    d0deba37ac85 backlight: led_bl: Take led_access lock when required
    53072791efe8 wifi: ieee80211: correct FILS status codes
    67d15b5ea082 PCI: dwc: Fix wrong PORT_LOGIC_LTSSM_STATE_MASK definition
    7547755997b3 staging: fbtft: core: fix potential memory leak in fbtft_probe_common()
    d6c91fc73269 mt76: mt7615: Fix memory leak in mt7615_mcu_wtbl_sta_add()
    f57925f0c498 crypto: ccree - Correctly handle return of sg_nents_for_len
    76fc288ce114 selftests/bpf: Improve reliability of test_perf_branches_no_hw()
    1d2e267f4331 selftests/bpf: skip test_perf_branches_hw() on unsupported platforms
    90bb940f1c2f usb: raw-gadget: cap raw_io transfer length to KMALLOC_MAX_SIZE
    7b1766b525da usb: dwc2: fix hang during suspend if set as peripheral
    316a067b2769 usb: dwc2: fix hang during shutdown if set as peripheral
    16514b403f0a usb: dwc2: disable platform lowlevel hw resources during shutdown
    5c94f6e84aec usb: chaoskey: fix locking for O_NONBLOCK
    f2f4627b74c1 ima: Handle error code returned by ima_filter_rule_match()
    6a96bd0d9430 wifi: rtl818x: rtl8187: Fix potential buffer underflow in rtl8187_rx_cb()
    81f087859c97 mfd: mt6358-irq: Fix missing irq_domain_remove() in error path
    68715d885bb6 mfd: mt6397-irq: Fix missing irq_domain_remove() in error path
    d705f1c35080 pwm: bcm2835: Make sure the channel is enabled after pwm_request()
    9a76b3b33e52 drm/mediatek: Fix CCORR mtk_ctm_s31_32_to_s1_n function issue
    e1c7bb405edc fs/ntfs3: Prevent memory leaks in add sub record
    e910114bdbd8 fs/ntfs3: out1 also needs to put mi
    925e825f0c8e fs/ntfs3: Make ni_ins_new_attr return error
    83177ae96486 fs/ntfs3: Add new argument is_mft to ntfs_mark_rec_free
    d29f1ea12adf fs/ntfs3: Remove unused mi_mark_free
    e0a6dcbb8ce5 powerpc/64s/ptdump: Fix kernel_hash_pagetable dump for ISA v3.00 HPTE format
    89caaeee8dd9 wifi: rtl818x: Fix potential memory leaks in rtl8180_init_rx_ring()
    01f1e3015a77 NFSD/blocklayout: Fix minlength check in proc_layoutget
    dbeddfaaa3c0 watchdog: wdat_wdt: Fix ACPI table leak in probe function
    dbe2bb24ac4c watchdog: wdat_wdt: Stop watchdog when uninstalling module
    f93b75779dc0 selftests/bpf: Fix failure paths in send_signal test
    cf31d9fc454f ps3disk: use memcpy_{from,to}_bvec index
    4174c6409e51 PCI: keystone: Exit ks_pcie_probe() for invalid mode
    b6fa2843b30f leds: netxbig: Fix GPIO descriptor leak in error paths
    6682d122e88e scsi: sim710: Fix resource leak by adding missing ioport_unmap() calls
    b9f141eb4182 ACPI: property: Fix fwnode refcount leak in acpi_fwnode_graph_parse_endpoint()
    08b93c1c12c6 ocfs2: relax BUG() to ocfs2_error() in __ocfs2_move_extent()
    3e764e8a055b lib/vsprintf: Check pointer before dereferencing in time_and_date()
    a6189b555ccc clk: renesas: r9a06g032: Fix memory leak in error path
    8368be8a5072 coresight: etm4x: Add context synchronization before enabling trace
    368466234b54 coresight: etm4x: Extract the trace unit controlling
    d4b7290c1b5f coresight-etm4x: add isb() before reading the TRCSTATR
    35d756da2d7e coresight: etm4x: Use Trace Filtering controls dynamically
    53511743c5a8 coresight: etm4x: Save restore TRFCR_EL1
    cd93db1b1b44 nbd: defer config unlock in nbd_genl_connect
    40e6a1ebe430 wifi: cw1200: Fix potential memory leak in cw1200_bh_rx_helper()
    14c209835e47 macintosh/mac_hid: fix race condition in mac_hid_toggle_emumouse
    3061b299fced powerpc/32: Fix unpaired stwcx. on interrupt exit
    79c8a77b1782 ntfs3: init run lock for extend inode
    9794c1a99a3a RDMA/rtrs: server: Fix error handling in get_or_create_srv
    5e9a106883c6 dt-bindings: PCI: amlogic: Fix the register name of the DBI region
    558222badffe dt-bindings: PCI: convert amlogic,meson-pcie.txt to dt-schema
    f0988e776c64 scsi: stex: Fix reboot_notifier leak in probe error path
    d3ba31267591 nbd: defer config put in recv_work
    6b4b2d939537 nbd: partition nbd_read_stat() into nbd_read_reply() and nbd_handle_reply()
    41ecdc2097b1 nbd: clean up return value checking of sock_xmit()
    85db50d9662b regulator: core: disable supply if enabling main regulator fails
    c0763fe31cfe perf/x86/intel: Correct large PEBS flag check
    de33b4593b81 ext4: correct the checking of quota files before moving extents
    8de56b96de2d ext4: minor defrag code improvements
    c23ea1f28855 mfd: da9055: Fix missing regmap_del_irq_chip() in error path
    88db8bb7ed1b spi: tegra210-quad: Fix timeout handling
    f603efe72a28 spi: tegra210-quad: modify chip select (CS) deactivation
    c6d33b46ce13 spi: tegra210-quad: combined sequence mode
    f64a36c44896 spi: tegra210-quad: add new chips to compatible
    036d15dbee1a spi: tegra210-quad: use device_reset method
    5a26b3e8b811 scsi: target: Do not write NUL characters into ASCII configfs output
    43428053153f power: supply: apm_power: only unset own apm_get_power_status
    7158890e3692 power: supply: wm831x: Check wm831x_set_bits() return value
    bf5e04401a10 i3c: master: svc: Prevent incomplete IBI transaction
    763d194b13be i3c: fix refcount inconsistency in i3c_master_register
    fe067c65f760 pinctrl: stm32: fix hwspinlock resource leak in probe function
    9ff4cea267ef x86/dumpstack: Prevent KASAN false positive warnings in __show_regs()
    898581813aaf x86: kmsan: don't instrument stack walking functions
    49c6b5e1e7fa kmsan: introduce __no_sanitize_memory and __no_kmsan_checks
    bd4bcf2d97a8 compiler-gcc.h: Define __SANITIZE_ADDRESS__ under hwaddress sanitizer
    4af48d5cb642 sctp: Defer SCTP_DBG_OBJCNT_DEC() to sctp_destroy_sock().
    59a797709dcb phy: mscc: Fix PTP for VSC8574 and VSC8572
    3c149ffe83d5 firmware: imx: scu-irq: fix OF node leak in
    9c5c10b32f48 s390/ap: Don't leak debug feature files if AP instructions are not available
    fc09726c9213 s390/smp: Fix fallback CPU detection
    0049c460c57c crypto: hisilicon/qm - restore original qos values
    c13c6e9de91d crypto: asymmetric_keys - prevent overflow in asymmetric_key_generate_id
    5c56bbed31e4 uio: uio_fsl_elbc_gpcm:: Add null pointer check to uio_fsl_elbc_gpcm_probe
    d27289e628bf arm64: dts: imx8mm-venice-gw72xx: remove unused sdhc1 pinctrl
    15c09dad9a82 iio: imu: st_lsm6dsx: Fix measurement unit for odr struct member
    5fbae4ee1d2a iio: imu: st_lsm6dsx: discard samples during filters settling time
    830c8336db60 iio: imu: st_lsm6dsx: introduce st_lsm6dsx_device_set_enable routine
    0314de967578 inet: Avoid ehash lookup race in inet_ehash_insert()
    1600b14e3c41 rculist: Add hlist_nulls_replace_rcu() and hlist_nulls_replace_init_rcu()
    90e23db1a859 ntfs3: Fix uninit buffer allocated by __getname()
    afb144bc8e92 ntfs3: fix uninit memory after failed mi_read in mi_format_new
    7bf22893398e irqchip/qcom-irq-combiner: Fix section mismatch
    50fde089fb8a USB: Fix descriptor count when handling invalid MBIM extended descriptor
    489b2158aec9 drm/vgem-fence: Fix potential deadlock on release
    ea0fd5535b0b drm/panel: visionox-rm69299: Don't clear all mode flags
    ca9388fba50d gpu: host1x: Fix race in syncpt alloc/free
    6b1e45e13546 smack: fix bug: unprivileged task can create labels
    c03cb1116289 staging: rtl8723bs: fix out-of-bounds read in OnBeacon ESR IE parsing
    4445adedae77 staging: rtl8723bs: fix stack buffer overflow in OnAssocReq IE parsing
    7141915bf0c4 comedi: check device's attached status in compat ioctls
    4cde9a7e025c comedi: multiq3: sanitize config options in multiq3_attach()
    f7fa1f4670c3 comedi: c6xdigio: Fix invalid PNP driver unregistration
    606f57e57267 HID: elecom: Add support for ELECOM M-XT3URBK (018F)
    2aa1485eff98 platform/x86: huawei-wmi: add keys for HONOR models
    090003de3f6c platform/x86: acer-wmi: Ignore backlight event
    d8dcf8e8852b pinctrl: qcom: msm: Fix deadlock in pinmux configuration
    aeccd6743ee4 bfs: Reconstruct file type when loading from disk
    93536b1d8478 spi: imx: keep dma request disabled before dma transfer setup
    9106a929628f spi: xilinx: increase number of retries before declaring stall
    e86288cb0a8c USB: serial: kobil_sct: fix TIOCMBIS and TIOCMBIC
    5882a3fe61d3 USB: serial: belkin_sa: fix TIOCMBIS and TIOCMBIC
    c032ddd06fe1 serial: add support of CPCI cards
    999138bc35b8 USB: serial: ftdi_sio: match on interface number for jtag
    141ed16ab9b7 USB: serial: option: move Telit 0x10c7 composition in the right place
    2d5855509140 USB: serial: option: add Telit Cinterion FE910C04 new compositions
    97c9ba42d178 USB: serial: option: add Foxconn T99W760
    b2a5b172dc05 comedi: pcl818: fix null-ptr-deref in pcl818_ai_cancel()
    61e03dc3794e ext4: add i_data_sem protection in ext4_destroy_inline_data_nolock()
    c228cb699a07 locking/spinlock/debug: Fix data-race in do_raw_write_lock
    43bf001f0fe4 ext4: refresh inline data size before write operations
    ed62fd8c15d4 jbd2: avoid bug_on in jbd2_journal_get_create_access() when file system corrupted
    5821b648480a Documentation: process: Also mention Sasha Levin as stable tree maintainer
    d76c2063db44 leds: spi-byte: Use devm_led_classdev_register_ext()
    fdcf33b9738c leds: Replace all non-returning strlcpy with strscpy
    799e37e49cb6 drm/i915/selftests: Fix inconsistent IS_ERR and PTR_ERR
    a647db560793 dpaa2-mac: bail if the dpmacs fwnode is not found
    e1d414c5719a xfrm: flush all states in xfrm_state_fini
    1dad653643f2 xfrm: also call xfrm_state_delete_tunnel at destroy time for states that were never added
    9f2d85ead8ff Revert "xfrm: destroy xfrm_state synchronously on net exit path"
    4b2c17d0f9be xfrm: delete x->tunnel as we delete x

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 4baf0bd983..ebe610c64b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "9f3853efc84c7065918f3cb90be1464f61bd0871"
-SRCREV_meta ?= "65baed3263fc04a3bdd461278cca80891b80cc9a"
+SRCREV_machine ?= "2afe5ce992e8048f0728eafea9efed380ec08d46"
+SRCREV_meta ?= "78eca082b68ad521c3bb9a1f9f0325e044045f18"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.197"
+LINUX_VERSION ?= "5.15.198"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index a8ba147044..1a3a110c67 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.197"
+LINUX_VERSION ?= "5.15.198"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "6a3023cca521bd2e295fc1482e5b0c88c08ab2e4"
-SRCREV_meta ?= "65baed3263fc04a3bdd461278cca80891b80cc9a"
+SRCREV_machine ?= "30a5abb43773a288fe85ed754f1d4518ca8f28bb"
+SRCREV_meta ?= "78eca082b68ad521c3bb9a1f9f0325e044045f18"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 26765a216e..f33ef22d83 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "2d635a3e35b83998b2f84bbd2e932eaafdf61826"
-SRCREV_machine:qemuarm64 ?= "bb65897d11ebca68c2017bf0bed4e26599e05ddb"
-SRCREV_machine:qemumips ?= "8192334823c116e4e56368fbf6ca67cdb0c945d0"
-SRCREV_machine:qemuppc ?= "ec35a9c80e2a5006d01a073f9787c784fdf0a04f"
-SRCREV_machine:qemuriscv64 ?= "c04373a83e017e615d8333767c8955732c6c975b"
-SRCREV_machine:qemuriscv32 ?= "c04373a83e017e615d8333767c8955732c6c975b"
-SRCREV_machine:qemux86 ?= "c04373a83e017e615d8333767c8955732c6c975b"
-SRCREV_machine:qemux86-64 ?= "c04373a83e017e615d8333767c8955732c6c975b"
-SRCREV_machine:qemumips64 ?= "5a3b47b8a7c60c97447170242b5c2e70db803b2f"
-SRCREV_machine ?= "c04373a83e017e615d8333767c8955732c6c975b"
-SRCREV_meta ?= "65baed3263fc04a3bdd461278cca80891b80cc9a"
+SRCREV_machine:qemuarm ?= "3cce45b328f3485e7de2bedee542ef6898e050be"
+SRCREV_machine:qemuarm64 ?= "2b2737663d7c08b6df6ae791d46caae904710ce0"
+SRCREV_machine:qemumips ?= "7ae75ed1e71b6038140416ed1c0791373b0ed5e9"
+SRCREV_machine:qemuppc ?= "490def1150cbd931cf4ae1214c6400c47bf7bde6"
+SRCREV_machine:qemuriscv64 ?= "9121f41155a13f494c537589064abf738cb00c76"
+SRCREV_machine:qemuriscv32 ?= "9121f41155a13f494c537589064abf738cb00c76"
+SRCREV_machine:qemux86 ?= "9121f41155a13f494c537589064abf738cb00c76"
+SRCREV_machine:qemux86-64 ?= "9121f41155a13f494c537589064abf738cb00c76"
+SRCREV_machine:qemumips64 ?= "7e46020155a56cdcedf78dcaa4c90fc97393c09c"
+SRCREV_machine ?= "9121f41155a13f494c537589064abf738cb00c76"
+SRCREV_meta ?= "78eca082b68ad521c3bb9a1f9f0325e044045f18"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "68efe5a6c16a05391e3d96025b41e9bf573f968c"
+SRCREV_machine:class-devupstream ?= "9eec9a14ee10820a0c00dd3e02ac1e0ab27ad142"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.197"
+LINUX_VERSION ?= "5.15.198"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.43.0


