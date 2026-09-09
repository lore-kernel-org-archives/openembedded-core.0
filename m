Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41453C79FBD
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:30:01 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6426.1788938996192867364
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:29:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TIhbnW0n;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-482dd6ee390so6187177f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788938994; x=1789543794; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cD6YruT+rUtvzUAIwlFxaYubCHVgR3ZAr8lZ+Ven7II=;
        b=TIhbnW0n4+gw1yB6nKwLvkGZqgkIkXimji7xUP29RCW0tHIpQggzmqDzKczeikPLNl
         exw/p3qD/v/NHDTq97xGnpUla1Mp41DGQWNZ+WHAb4Cu8JDEUkFeQmMgcRVYUrF4/kqD
         25ofO65hkCq76nPFSCPzrTkdNWzGQpYJgVnTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788938994; x=1789543794;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cD6YruT+rUtvzUAIwlFxaYubCHVgR3ZAr8lZ+Ven7II=;
        b=iC7XrVqtiUIbNz4Td1q8r44LIv0UwUx2hRDyDwIVHPQ8q3PejNtxOfjHwQkfSnAyiH
         uGNutzLgpYq19mXNuKHUqEnDXanYtAlkT5Fo0MqnKWEHg0r3DQwdZ2dFz6CYiNEqYL2d
         afzK5I55nf87NqgPpojsBgt84GdZSAs2lFsHB3si9Ut/cgPWd5qFqHe1SEvvCgLFbLU8
         YqiV8GTYIItEuxod3tVHHoueIQ4QUYPZB47VeCNnXWAChZUgK40oL7oi429e0EDFL3yg
         3fVQN1qcToi0BWIci7kAny1HlQHaipJgC2AswY0W/kZsWRFqxOccalZjQ7+jF3zpRGix
         e65Q==
X-Gm-Message-State: AFuF++n39RHKkSRBkTag17Ksd9NmpIjJ2FxXFVillHgulPgkGrXeKeN2
	4W/ZykaAPg7m+zRqxtdrbo5JRSUPAk3cL2jxhhsUoe2j6k9TEC3Cl2Xr5AdDawnnywCR4jaonVY
	zfDeIscY=
X-Gm-Gg: AYBFou36v0mwAKQG3M+BPggcc4RdJ+luqcc4bvoXjeSeU8Xfuw0iBjNK8dcsRpgqo8T
	QePDKXkkuczDeqMpC+iBgYaEF035pzwQzQwcpaLsUytDEd3iYsmzTXzkUk9ugiM0MSNs4DG0Wi7
	NvtFzwbVMYYgxJSXHj/nvi9/xC64RfChbj9zE89XU1gXzHeAd8XYe1Zb3SEZG4ex+yAv7UfINeg
	HuKLs4MTqQV4VWTbQyDXJ6oufLehBQdtAEwteNgzFdA28fmjlOIoa4ukUty3uKq2FU1qPBxnX1w
	ghsRkEtTTxrp6Zih2HeJLBDFSAlwEdknrhFBqivT33QBAyA2fljEeC7LK6+wex9t/XwQ5ZjIjHS
	FsRUD9qYkCbvP45TkVF6imbjYhrtiKjo7q1C3EDpWtCnrebj14+ZMPC3GVVtDqYTASve/ZMQmfD
	KPH0JTy8ELk0siOJFa3fy4GyKnTIopY6axn+JNoeHqgE7d+tkzSKEwThx2g0lSZr6kHedWs5r4O
	KTx2Ez9FiBeYDqqNIXnQjGdt0z6lWGklUM22EKwn+iQHml6PVr+vhI3yiLRaJWjPtI0+wgge2A=
X-Received: by 2002:a05:6000:24c8:b0:485:8c16:a33e with SMTP id ffacd0b85a97d-4858c16a715mr31386419f8f.51.1788938992082;
        Wed, 09 Sep 2026 00:29:52 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40624310f8f.16.2026.09.09.00.29.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:29:51 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 01/38] linux-yocto/6.18: update to v6.18.41
Date: Wed,  9 Sep 2026 09:29:00 +0200
Message-ID: <f61ab94457336abbf0b52c28c33213966c24f7c0.1788938909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788938908.git.yoann.congal@smile.fr>
References: <cover.1788938908.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:30:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245412

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.18 to the latest korg -stable release that comprises
the following commits:

    2fe596715f840 Linux 6.18.41
    6a7ecc25abe6f posix-cpu-timers: Prevent UAF caused by non-leader exec() race
    9f7268928ac0c posix-timers: Expand timer_[re]arm() callbacks with a boolean return value
    221fc2f4d0eda Linux 6.18.40
    478c4d24193fe RDMA/bnxt_re: Avoid repeated requests to allocate WC pages
    b87cbd4d198ae RDMA/bnxt_re: Initialize dpi variable to zero
    81e6faa5b6405 ksmbd: fix durable reconnect double-bind race in ksmbd_reopen_durable_fd
    1badb6866482d perf callchain: Handle multiple address spaces
    275eb39930947 seqlock: fix scoped_seqlock_read kernel-doc
    453cb79a15641 perf inject: With --convert-callchain ignore the dummy event for dwarf stacks
    2764d031efd6d PCI: Fix Resizable BAR restore order
    2fb74141ec54e PCI: Fix BAR resize rollback path overwriting ret
    7425e7d82cb93 perf symbol: Fix ENOENT case for filename__read_build_id
    a888f3d5970ff pinctrl: airoha: fix pinctrl function mismatch issue
    267fdd9b6530c bpf: Reject BPF_MAP_TYPE_INODE_STORAGE creation if BPF LSM is uninitialized
    779480ea79551 iommufd: Move vevent memory allocation outside spinlock
    73b5d5cb1f5a1 iommufd: Propagate allocation failure in iommufd_veventq_deliver_fetch()
    ea7a76d7d614b KVM: arm64: nv: Re-translate VNCR before injecting abort
    459adfc6cd35f KVM: arm64: Deduplicate ASID retrieval code
    9d360fb820a3b samples/damon/mtier: fail early if address range parameters are invalid
    ec976851ad934 mm/damon/core: trace esz at first setup
    3b91c35961fa5 mm/damon/core: always put unsuccessfully committed target pids
    ba37cd4d8a751 KVM: arm64: Fix propagation of TLBI level in kvm_pgtable_stage2_relax_perms()
    19d9996435db8 KVM: arm64: Ensure level is always initialized when relaxing perms
    c3a3d39867190 btrfs: fix incorrect buffered IO fallback for append direct writes
    998ee7f01ecfa btrfs: fix false IO failure after falling back to buffered write
    a4497a122e27f crypto: qat - fix restarting state leak on allocation failure
    6c78081d047c5 btrfs: remove folio parameter from ordered io related functions
    1a648c50a5057 btrfs: replace for_each_set_bit() with for_each_set_bitmap()
    99d4ae3fbb5b1 btrfs: concentrate the error handling of submit_one_sector()
    382fd8004cc60 crypto: atmel-sha204a - fail on hwrng registration error in probe path
    952db4b985c79 usb: gadget: f_fs: Tie read_buffer lifetime to ffs_epfile
    69faa3779250d usb: gadget: f_fs: initialize reset_work at allocation time
    8a2fdbf92cdc7 functionfs: use spinlock for FFS_DEACTIVATED/FFS_CLOSING transitions
    5fb0b09180a0f functionfs: switch to simple_remove_by_name()
    4744f07f6bb7c functionfs: don't bother with ffs->ref in ffs_data_{opened,closed}()
    901c036cf6254 functionfs: don't abuse ffs_data_closed() on fs shutdown
    c3e6860252102 new helper: simple_remove_by_name()
    509b51327320b usb: atm: ueagle-atm: wait for pre-firmware load in .disconnect()
    b78826a657998 usb: atm: ueagle-atm: remove function entry/exit debug messages
    6e5ef54b884f4 usb: atm: ueagle-atm: use dev_dbg() for 'device found' message
    41a4e80d5af04 usb: dwc3: fix dwc3_readl() and dwc3_writel() calls in dwc3_ulpi_setup()
    e534790c4c272 usb: dwc3: Support USB3340x ULPI PHY high-speed negotiation.
    bce232923aa9e xfs: use bio_reuse in the zone GC code
    adadb181ad42a xfs: only log freed extents for the current RTG in zoned growfs
    47c0e07433021 xfs: add a xfs_groups_to_rfsbs helper
    57454944737f3 bpf: Allow LPM map access from sleepable BPF programs
    8fccaeeb9e9c5 bpf: Consistently use bpf_rcu_lock_held() everywhere
    0b92ad64d6e4b bpf: Keep dynamic inner array lookups nullable
    c447be8d88c30 bpf: Introduce struct bpf_map_desc in verifier
    dccb3c557879d bpf: Consistently use reg_state() for register access in the verifier
    60eed44674295 xfs: initialize iomap->flags earlier in xfs_bmbt_to_iomap
    607217f7ad419 hfs/hfsplus: fix u32 overflow in check_and_correct_requested_length
    7676ea09beb5d hfs/hfsplus: prevent getting negative values of offset/length
    f9b4b03ccc9c6 proc: protect ptrace_may_access() with exec_update_lock (part 1)
    07bf18dc63f78 seqlock: Change do_task_stat() to use scoped_seqlock_read()
    c897fd63762e0 seqlock: Introduce scoped_seqlock_read()
    497c6bae51674 proc: protect ptrace_may_access() with exec_update_lock (FD links)
    903d78e5aca77 proc: rename proc_setattr to proc_nochmod_setattr
    b56400364aed5 ksmbd: validate NTLMv2 response before updating session key
    74c2f0ffb81c8 ksmbd: Use HMAC-MD5 library for NTLMv2
    51c5f7e84cfed ksmbd: Use HMAC-SHA256 library for message signing and key generation
    bd27d9504d200 ksmbd: Use SHA-512 library for SMB3.1.1 preauth hash
    427faaa52b0b3 ksmbd: track the connection owning a byte-range lock
    6a37bc484f12e ksmbd: centralize ksmbd_conn final release to plug transport leak
    c7c884a1305aa ksmbd: fix path resolution in ksmbd_vfs_kern_path_create
    e205f3e7e8c31 ksmbd: use opener credentials for FSCTL mutations
    90a93fb3230c9 cifs: SMB1 split: Add some #includes
    ff943e1f3d31f cifs: SMB1 split: Rename cifstransport.c
    36da806f7fbae Bluetooth: L2CAP: Fix use-after-free in l2cap_sock_new_connection_cb()
    6d0eeebe22ba7 Bluetooth: 6lowpan: fix cyclic locking warning on netdev unregister
    ef382a6baf0a9 media: nxp: imx8-isi: Fix use-after-free on remove
    4278953ff0cd4 media: nxp: imx8-isi: use devm_pm_runtime_enable() to simplify code
    49cd5ac6de8de crypto: qat - fix VF2PF work teardown race in adf_disable_sriov()
    4b51ee8a40fe4 staging: rtl8723bs: fix OOB reads in rtw_get_sec_ie(), rtw_get_wapi_ie(), and rtw_get_wps_attr()
    5d76bc296bb58 staging: rtl8723bs: fix spaces around binary operators
    48323ebaeeeed staging: rtl8723bs: core: move constants to right side in comparison
    73cc54326de45 PCI: Skip Resizable BAR restore on read error
    f33837a754473 PCI: Move Resizable BAR code to rebar.c
    2242c75b63286 PCI: Add kerneldoc for pci_resize_resource()
    4b5322f0002aa PCI: Fix restoring BARs on BAR resize rollback path
    c18646165f21f PCI: Free saved list without holding pci_bus_sem
    534f20cdddc31 PCI: Try BAR resize even when no window was released
    dbb1d8507dd92 PCI: Change pci_dev variable from 'bridge' to 'dev'
    0d1c263e6fd73 PCI/IOV: Adjust ->barsz[] when changing BAR size
    0dfad346c293e PCI: imx6: Configure REF_USE_PAD before PHY reset for i.MX95
    e53d54b92f0c2 PCI: imx6: Fix reference clock source selection for i.MX95
    1228926e1e4d6 binder: cache secctx size before release zeroes it
    79ac87bb1a4c8 binder: Use LIST_HEAD() to initialize on stack list head
    7ed120b1a007b vfio/mlx5: Fix racy bitfields and tighten struct layout
    f8272331da877 ALSA: hda/tas2781: Cancel async firmware request at unbind
    6438d0707087e firmware_loader: Add cancel helper for async requests
    1ed7ff33cfc8c ALSA: scarlett2: Update offsets for 2i2 Gen 4 firmware 2417
    ad5c5bdb0f580 ALSA: scarlett2: Allow selecting config_set by firmware version
    2745574697ee4 iio: hid-sensor-rotation: Fix stale or zero output when reading raw values
    7f680924c5c2b ACPI: NFIT: core: Fix possible deadlock and missing notifications
    cf5f93228e7ab ACPI: NFIT: core: Use devm_acpi_install_notify_handler()
    d57d2aae87b23 ACPI: bus: Introduce devm_acpi_install_notify_handler()
    34f4d0e4e5065 ACPI: driver: Check ACPI_COMPANION() against NULL during probe
    3b2628f7682ae ACPI: NFIT: core: Fix acpi_nfit_init() error cleanup
    83f29da85dc9d crypto: xilinx-trng - Remove crypto_rng interface
    f84c0bae0e8dd mmc: sdhci-esdhc-imx: fix resume error handling
    174dc8103ab7b mmc: sdhci-esdhc-imx: make non-fatal errors non-blocking in suspend
    5b8f11cbe8ad5 mmc: sdhci-esdhc-imx: use pm_runtime_resume_and_get() in suspend
    4f96903e2fd22 mmc: sdhci-esdhc-imx: disable irq during suspend to fix unhandled interrupt
    aa276aa6cbfbc mmc: sdhci-esdhc-imx: fix esdhc_change_pinstate() to allow default state restore
    52990f6b57526 mmc: sdhci-esdhc-imx: restore DLL override for DDR modes on resume
    eefcd3ca245c1 mmc: sdhci-esdhc-imx: remove unnecessary mmc_card_wake_sdio_irq check for tuning save/restore
    c02237966c199 mmc: sdhci-of-dwcmshc: check bus clock enable result in the probe() method
    8d94498cc4453 mmc: block: fix RPMB device unregister ordering
    cf7258f57d180 mtd: rawnand: lpc32xx_slc: fail DMA transfer on completion timeout
    4b5de4007e5bf mtd: rawnand: lpc32xx_mlc: fail DMA transfers on timeout
    de2bc884d8870 mtd: rawnand: fsl_ifc: return errors for failed page reads
    bf9848a22a8e5 mmc: vub300: defer reset until cmd_mutex is unlocked
    04ebd3766861f mtd: mchp23k256: use SPI match data for chip caps
    ac2d9f6b4f905 mtd: onenand: samsung: report DMA completion timeouts
    a59cfa165aee3 wifi: mwifiex: fix permanently busy scans after multiple roam iterations
    b8df3a993f690 wifi: mac80211: free ack status frame on TX header build failure
    90576bd6921a9 wifi: ieee80211: validate MLE common info length
    584657c5fc58d wifi: cfg80211: validate EHT MLE before MLD ID read
    3c1e92f75e11a powerpc/spufs: fix out-of-bounds access in spufs_mem_mmap_access()
    82753ac86cb3d reset: sunxi: fix memory region leak on ioremap failure
    3fb7edd2018bb ipvs: reload ip header after head reallocation
    d4ec18f48ce78 ipvs: fix more places with wrong ipv6 transport offsets
    39151f0708c84 memstick: ms_block: reject a card that reports too many blocks
    a75d2b5249e38 macsec: fix promiscuity refcount leak in macsec_dev_open()
    fd701fc0d0652 llc: fix SAP refcount leak when creating incoming sockets
    6744ab60dfac5 Bluetooth: btrtl: validate firmware patch bounds
    dbd14f736be02 net: openvswitch: reject oversized nested action attrs
    6926d13865aaa regulator: ltc3676: Fix incorrect IRQSTAT bit offsets
    688bd4c6144d2 riscv: vdso: Do not use LTO for the vDSO
    55b26abb1fa1e wifi: brcmfmac: cyw: fix heap overflow on a short auth frame
    bdc0b8bfdc142 wifi: mac80211: fix memory leak in ieee80211_register_hw()
    65446b85595a4 wifi: mwifiex: fix roaming to different channel in host_mlme mode
    816559409e340 wifi: rt2x00: avoid full teardown before work setup in probe
    262da8b6ea03d net/mlx5: free mlx5_st_idx_data on final dealloc
    9b8df4da2cf79 powerpc/pseries: fix memory leak on krealloc failure in papr_init
    afa0db5322c5f mmc: sdhci-esdhc-imx: restore pinctrl before restoring ios timing on resume
    d94160a5d1ac3 selftests/landlock: Fix screwed up pointers in the scoped_signal_test
    ba481c0b53760 selftests/landlock: Skip scoped_signal subtest with MSG_OOB if not available
    4ff3960f35271 pmdomain: imx: Fix i.MX8MP VC8000E power up sequence
    9a0464fcfae4f pmdomain: imx: Fix i.MX8MP power notifier
    c844b7d9a9586 cgroup/cpuset: rebind mm mempolicy to effective_mems, not mems_allowed
    8131a91fe2dea selftests/rseq: Fix a building error for riscv arch
    3dfec7490f3a2 s390/mm: Fix type mismatch in get_align_mask().
    c6b4d454865a8 s390/diag: Add missing array_index_nospec() call to memtop_get_page_count()
    fad36954b2959 tracing/osnoise: Call synchronize_rcu() when unregistering
    eadd0c2c76aee riscv: Prevent NULL pointer dereference in machine_kexec_prepare()
    38cc4867540ae drbd: reject data replies with an out-of-range payload size
    91ec52dd2a5d9 ata: libata-core: Allow capacity transition to zero for locked drives
    7a9a69641b68a ata: libata-core: Skip HPA resize for locked drives
    52007bfdce531 fs/resctrl: Fix double-add of pseudo-locked region's RMID to free list
    1155a9d0a2e0d fs/resctrl: Free mon_data structures on rdt_get_tree() failure
    ccdf1770a4ba2 cpu/hotplug: Fix NULL kobject warning in cpuhp_smt_enable()
    5f5783c7806fc arm64: smp: Fix hot-unplug tearing by forcing unregistration
    26b131b2d5b55 net: macb: drop in-flight Tx SKBs on close
    b2f426a9a2288 dibs: loopback: validate offset and size in move_data()
    2cf10d0425622 macsec: don't read an unset MAC header in macsec_encrypt()
    83fb4c2c5344f ipvs: reset full ip_vs_seq structs in ip_vs_conn_new
    247d055504dcc ipvs: use parsed transport offset in SCTP state lookup
    61a7ff4a62003 llc: fix SAP refcount leak in llc_ui_autobind()
    685fb410d90e5 selftests: net: make busywait timeout clock portable
    5df30f05db965 octeontx2-pf: fix SQB pointer leak on init failure
    77caf2d6eba7c mac802154: remove interfaces with RCU list deletion
    f0745496f7c17 s390/monwriter: Reject buffer reuse with different data length
    a5a367756926d irqchip/irq-riscv-imsic-early: Fix fwnode leak on state setup failure
    018d7ad26cb8b mm/compaction: handle free_pages_prepare() properly in compaction_free()
    2faf0198168d2 riscv: probes: save original sp in rethook trampoline
    d8d4fa0c4f818 hwmon: (asus_atk0110) Check package count before accessing element
    07f5eb6d268a3 net: wwan: iosm: bound device offsets in the MUX downlink decoder
    1286a41563337 ata: pata_pxa: Fix DMA channel leak on probe error
    1dce4f4bb3c1c net/mlx5: HWS, fix matcher leak on resize target setup failure
    82fc886e244c7 orangefs: keep the readdir entry size 64-bit in fill_from_part()
    2c76c01a505c1 tracing/probes: Fix double addition of offset for @+FOFFSET
    b4427ee3667c5 hwmon: (max1619) add missing 'select REGMAP' to Kconfig
    6c52226072a3c fhandle: reject detached mounts in capable_wrt_mount()
    e2b7ee61989f2 net/sched: sch_taprio: Replace direct dequeue call with peek and qdisc_dequeue_peeked
    5889064919a1e net/sched: sch_multiq: Replace direct dequeue call with peek and qdisc_dequeue_peeked
    99a6f37b113c4 net: lan743x: Initialize eth_syslock spinlock before use
    ac58088d70b8a fsl/fman: Free init resources on KeyGen failure in fman_init()
    f0aad157576da hwmon: (occ) unregister sysfs devices outside occ lock
    715cce38424fb net: liquidio: fix BAR resource leak on PF number failure
    664480021f6a4 hwmon: (w83793) remove vrm sysfs file on probe failure
    c6c990f7208c9 hwmon: (w83627hf) remove VID sysfs files on error and remove
    8dc6c7e8c9678 rtc: mpfs: fix counter upload completion condition
    6e21d1253ef13 rtc: renesas-rtca3: Fix PIE clear polling condition in alarm setup error path
    6c98ccdb9a096 bnx2x: fix potential memory leak in bnx2x_alloc_mem_bp()
    f5c5065963024 ipmi: fix refcount leak in i_ipmi_request()
    a66d45e0ce6d7 espintcp: use sk_msg_free_partial to fix partial send
    ddbb6e3dc9bb4 ipmi: Fix user refcount underflow in event delivery
    a65f49b6f7ece LoongArch: Fix missing dirty page tracking in {pte,pmd}_wrprotect()
    20ac8131f8c90 LoongArch: Fix nr passing in set_direct_map_valid_noflush()
    612cda6630f2e pwm: rzg2l-gpt: Fix period_ticks type from u32 to u64
    4b73889941b95 selftests/bpf: Add simple strscpy() implementation
    da7f17c2d5bb4 KVM: TDX: Account all non-transient page allocations for per-TD structures
    d0cc2c74060be drm/xe/userptr: Stub notifier_lock helpers when DRM_GPUSVM=n
    6cec36c795c03 net/sched: sch_teql: move rcu_read_lock()/spin_lock() from _bh variants
    55da782eb4545 platform/x86/amd/pmc: Avoid logging "(null)" for DMI values
    35267819b2507 gve: fix header buffer corruption with header-split and HW-GRO
    2059c28bd725b ieee802154: ca8210: fix pointer truncation in kfifo on 64-bit
    cb5cca1d2a908 ieee802154: ca8210: fix cas_ctl leak on spi_async failure
    314f21c9dd0dc ieee802154: allow legacy LLSEC ADD/DEL ops to pass strict validation
    1905ebabe638c ieee802154: admin-gate legacy LLSEC dump operations
    19c148cb82d11 octeontx2-af: Free BPID bitmap on setup failure
    234cd54fc500f net: ip6_tunnel: require CAP_NET_ADMIN in the device netns for changelink
    03d8843b143eb net: ip6_gre: require CAP_NET_ADMIN in the device netns for changelink
    68cadc3698c7d net: ipip: require CAP_NET_ADMIN in the device netns for changelink
    9571af2eec802 net: ip_vti: require CAP_NET_ADMIN in the device netns for changelink
    0b2f9c908f930 net: ip6_vti: require CAP_NET_ADMIN in the device netns for changelink
    6596baf804110 net: ena: clean up XDP TX queues when regular TX setup fails
    ab625256882e0 selftests: net: fix file owner for broadcast_ether_dst test
    b3d8354078461 net/sched: act_ct: preserve tc_skb_cb across defragmentation
    3f85fcd520aa7 net: ixp4xx_hss: fix duplicate HDLC netdev allocation
    e89b8829693e6 net: wwan: t7xx: destroy DMA pool on CLDMA late init failure
    121c5f31c3fb7 net: ethernet: ti: icssg: guard PA stat lookups
    3118e97dae533 net: sit: require CAP_NET_ADMIN in the device netns for changelink
    5d7bd8790309b gpios: palmas: add .get_direction() op
    d3b9026ef78da gpio: mt7621: avoid corruption of shared interrupt trigger state
    4e16bc75c7502 gpio-f7188x: Add support for NCT6126D version B
    b6e040b5143cc gpio: mt7621: be sure IRQ domain is created before exposing GPIO chips
    ac761e66708d5 gpio: tegra: do not call pinctrl for GPIO direction
    0630f2c3c16c0 gpio: mt7621: more robust management of IRQ domain teardown
    6cb15b81ff545 cpu: hotplug: Bound hotplug states sysfs output
    f77117530fc3f cpu: hotplug: Preserve per instance callback errors
    afd147e59b32a selftests/ftrace: Drop invalid top-level local in test_ownership
    ea6a188ee805e posix-cpu-timers: Use u64 multiplication in update_rlimit_cpu()
    633cadbc0b832 locking/rt: Fix the incorrect RCU protection in rt_spin_unlock()
    fcff712d0e3d1 wifi: libertas_tf: fix use-after-free in lbtf_free_adapter()
    b33ac2d39953e tracing/user_events: Fix use-after-free in user_event_mm_dup()
    ed3cc4218070d net/mlx5e: macsec: fix use-after-free of metadata_dst on RX SC delete
    0e8115a7ed9a9 Input: ims-pcu - fix type confusion in CDC union descriptor parsing
    f516cba88bf95 Input: ims-pcu - fix race condition in reset_device sysfs callback
    383934c249a98 Input: ims-pcu - fix potential infinite loop in CDC union descriptor parsing
    9c964fc9507ae Input: ims-pcu - fix out-of-bounds read in ims_pcu_irq() debug logging
    99c428d7ef644 Input: ims-pcu - fix firmware leak in async update
    05ac85da12198 Input: ims-pcu - fix DMA mapping violation in line setup
    f28c5cabb2df0 Input: ims-pcu - add response length checks
    c8d3d83f2eaaf Input: ims-pcu - validate control endpoint type
    6329d1af316a4 Input: ims-pcu - release data interface on disconnect
    87e2f89dea078 Input: ims-pcu - only expose sysfs attributes on control interface
    6aacc18004b1a Input: ims-pcu - fix use-after-free and double-free in disconnect
    df87532e92122 scsi: elx: efct: Fix I/O leak on unsupported additional CDB
    9b871369cbb45 scsi: elx: efct: Fix refcount leak in efct_hw_io_abort()
    cb7bdae7fba40 scsi: target: core: Fix iSCSI ISID use-after-free in REGISTER AND MOVE
    004ccd2d3b4ac scsi: target: Bound PR-OUT TransportID parsing to the received buffer
    f1516c56ac540 scsi: xen: scsiback: Free unsubmitted command instead of double-putting it
    255fb7b0cdc94 scsi: xen: scsiback: Free the command tag on the TMR submit-failure path
    d0a8a6660d58e scsi: sg: Report request-table problems when any status is set
    ed08497977820 scsi: lpfc: Fix memory leak in lpfc_sli4_driver_resource_setup()
    d495b403d5b35 scsi: hpsa: Fix DMA mapping leak on IOACCEL2 reset path
    257321a1c036d accel/ivpu: Reject firmware log with size smaller than header
    4e370b5289624 accel/amdxdna: Fix use-after-free in amdxdna_gem_dmabuf_mmap()
    7aa8f3dba5342 dma-fence: Make dma_fence_dedup_array() robust against 0-count input
    089e05b644d5a dm-verity: make error counter atomic
    c8d743bb0e98a dm-verity: increase sprintf buffer size
    f15eaa3801f2f dm-verity: fix a possible NULL pointer dereference
    2a0858cba1dab dm-verity: avoid double increment of &use_bh_wq_enabled
    5dfd804263527 dm-integrity: don't increment hash_offset twice
    aa5113e7155f4 dm-integrity: fix a bug if the bio is out of limits
    0c4e9bb1d4101 dm-integrity: fix leaking uninitialized kernel memory
    92e3c93d60be1 dm_early_create: fix freeing used table on dm_resume failure
    ee458c3c18343 dm-stats: fix merge accounting
    461d36b5ddafc dm-stats: fix dm_jiffies_to_msec64
    1247615aadb74 dm-pcache: reject option groups without values
    e0b0163a65758 dm-log: fix a bitset_size overflow on 32bit machines
    d61c12573ed97 dm-ioctl: fix a possible overflow in list_version_get_info
    021dab70eb37d dm-bufio: fix wrong count calculation in dm_bufio_issue_discard
    1fcb5e29dd7a5 dm era: fix out-of-bounds memory access for non-zero start sector
    7f76245960a33 dm thin metadata: fix metadata snapshot consistency on commit failure
    ac2136dc4441d dm thin metadata: fix superblock refcount leak on snapshot shadow failure
    8a3c44a003176 net: sparx5: unregister blocking notifier on init failure
    ffd17a393921a block: fix IORING_URING_CMD_REISSUE flags check in blkdev_uring_cmd
    2977b5fe401c1 block: fix race in blk_time_get_ns() returning 0
    af382ffca93e5 block: remove redundant GD_NEED_PART_SCAN in add_disk_final()
    0b6252afcd196 bpf: Add missing access_ok call to copy_user_syms
    c4f626ddf2350 bpf,fork: wipe ->bpf_storage before bailouts that access it
    0993dc5fc619c bpf: Reset register bounds before narrowing retval range in check_mem_access()
    b06a4a397ac82 can: bcm: add missing rcu list annotations and operations
    35f0ac19efb1a can: bcm: fix lockless bound/ifindex race and silent RX_SETUP failure
    cd830e0bc25ee can: bcm: defer rx_op deallocation to workqueue to fix thrtimer UAF
    37beb16e08cae can: isotp: serialize TX state transitions under so->rx_lock
    7bef39ba76eb7 can: isotp: fix use-after-free race with concurrent NETDEV_UNREGISTER
    b88a511308779 can: isotp: use unconditional synchronize_rcu() in isotp_release()
    765ba1c91823a can: esd_usb: kill anchored URBs before freeing netdevs
    5e4c8e08ce957 netdev-genl: report NAPI thread PID in the caller's pid namespace
    26355295ce21c nvmet: fix refcount leak in nvmet_sq_create()
    2944113ad5fbc nvmet-rdma: handle inline data with a nonzero offset
    2eaa3ad450141 nvmet-auth: reject short AUTH_RECEIVE buffers
    59cef6abc924a nvme-apple: Prevent shared tags across queues on Apple A11
    0ffc032294a29 NFS: Charge unstable writes by request size, not folio size
    ebe0a55d954fa sctp: validate STALE_COOKIE cause length before reading staleness
    d44b828eb551b spi: uniphier: Fix completion initialization order before devm_request_irq()
    9b092f9e6b34d time: Fix off-by-one in compat settimeofday() usec validation
    ada4b9a5087ea tpm: Make the TPM character devices non-seekable
    95bdf3950d668 tpm: fix event_size output in tpm1_binary_bios_measurements_show
    8ca2a19a987a7 xfrm: xfrm_interface: require CAP_NET_ADMIN in the device netns for changelink
    e0f688ccb20f1 xfrm: use compat translator only for u64 alignment mismatch
    5b0c4c916f202 xfrm: nat_keepalive: avoid double free on send error
    16d3ccdabb8de xen/gntdev: fix error handling in ioctl
    e497fef9ad7e9 ufs: core: tracing: Do not dereference pointers in TP_printk()
    0ced34b4bbc04 tcp: Decrement tcp_md5_needed static branch
    33a1bee413628 tcp: defer md5sig_info kfree past RCU grace period in tcp_connect
    bccae122dab8f ice: fix ice_init_link() error return preventing probe
    8bd84316bbaf3 i2c: spacemit: fix spurious IRQ handling returning IRQ_HANDLED
    e6a395a71f465 i2c: mlxbf: Fix use-after-free in mlxbf_i2c_init_resource()
    2f3f471a448a5 i2c: mediatek: fix WRRD for SoCs without auto_restart option
    5d3240f42a667 i2c: imx: fix locked bus on SMBus block-read of 0 (IRQ)
    6d2c973926d06 i2c: imx: fix locked bus on SMBus block-read of 0 (atomic)
    500716a007b2e hwmon: (max6697) add missing 'select REGMAP_I2C' to Kconfig
    1dcd7565e5909 hwmon: (ltc2992) add missing 'select REGMAP_I2C' to Kconfig
    3cd6f93f3d593 ksmbd: fix integer overflow in set_file_allocation_info()
    6cc1518357369 smb: client: use kvzalloc() for megabyte buffer in simple fallocate
    fe623f9515bb0 pkey: Move keytype check from pkey api to handler
    eafc5aca71564 platform/x86/amd/pmc: Don't log during intermediate wakeups
    e628d9169f9e1 platform/x86/amd/pmc: Add delay_suspend module parameter
    27d16a19ae74f platform/x86/amd/pmc: Delay suspend for some Lenovo Laptops
    d8bc45c4c1a45 platform/x86/amd/pmc: Check for intermediate wakeup in function
    cea03d67db3a8 platform/x86: ISST: Restore SST-PP control to all domains
    1e41ca4a7fba2 platform/x86: dell-laptop: fix missing cleanups in init error path
    ddbc4a8a4fe29 dmaengine: dw-edma: Add spinlock to protect DONE_INT_MASK and ABORT_INT_MASK
    7926c1e4be863 dmaengine: tegra: Fix burst size calculation
    933654508b2bc sunrpc: fix uninitialized xprt_create_args structure
    934d1cd40e289 tpm: tpm2-sessions: wait for async KPP completion in tpm_buf_append_salt
    ba33b4f9d3423 tpm: tpm_tis_spi: Use wait_woken() in wait_for_tmp_stat()
    781f28bd982cf tpm: restore timeout for key creation commands
    36ca587f55a2c irqchip/crossbar: Use correct index in crossbar_domain_free()
    0d078152fcab7 taskstats: retain dead thread stats in TGID queries
    9ac007affa77c mtd: maps: vmu-flash: fix NULL pointer dereference in initialization
    3fac46068fe4c openrisc: Fix jump_label smp syncing
    ff7bcc9d71bf4 mtd: rawnand: Pause continuous reads at block boundaries
    0fd20c1905abc mtd: spi-nor: spansion: use die erase for multi-die devices only
    c0806df5cf806 mtd: spi-nor: swp: Improve locking user experience
    433e5e70cdc1e s390/pkey: Check length in pkey_pckmo handler implementation
    693bf91d4db13 s390/pkey: Check length in PKEY_VERIFYPROTK ioctl
    c9ef79e34bc1e fpga: microchip-spi: fix zero header_size OOB read in mpf_ops_parse_header()
    e5824d5b841d9 net: thunderbolt: Fix frags[] overflow by bounding frame_count
    fc74244e0cc25 bus: mhi: ep: Protect mhi_ep_handle_syserr() in the error path
    3ebe0ee6527e8 bus: mhi: host: pci_generic: Fix the physical function check
    012683accbb7d fpga: dfl: add bounds check in dfh_get_param_size()
    2174c68f623b7 ocfs2: reject non-inline dinodes with i_size and zero i_clusters
    5e512d370a01b ocfs2: reject dinodes whose i_rdev disagrees with the file type
    4db3b6a2a8ecf ocfs2: reject dinodes with non-canonical i_mode type
    499714de42ab4 ocfs2: add journal NULL check in ocfs2_checkpoint_inode()
    671889c553ea5 ocfs2: fix UBSAN array-index-out-of-bounds in ocfs2_sum_rightmost_rec
    bd73971fad89d ocfs2: fix NULL h_transaction deref in ocfs2_assure_trans_credits
    d5d5a21fb33cd ocfs2: avoid moving extents to occupied clusters
    4bbfcf9c7e46c mtd: rawnand: fix condition in 'nand_select_target()'
    a8874c34c4a97 net/9p: fix infinite loop in p9_client_rpc on fatal signal
    ace3a0c839f3b mtd: rawnand: pl353: fix probe resource allocation
    b6337e3687d3d ocfs2: use kzalloc for quota recovery bitmap allocation
    bf53557a96d4c openrisc: Add full instruction cache invalidate functions
    8d263bae573dc scsi: sas: Skip opt_sectors when DMA reports no real optimization hint
    83405848e4030 scsi: smartpqi: Use shost_to_hba() in pqi_scan_finished()
    a7bbf83dfebdc power: supply: bq257xx: Fix VSYSMIN clamping logic
    8d610017c992d 9p: skip nlink update in cacheless mode to fix WARN_ON
    d8dcbbfa0d695 mtd: slram: remove failed entries from the device list
    4e4beef747c68 kcov: use WRITE_ONCE() for selftest mode stores
    da5234df09416 mm/mm_init: fix uninitialized struct pages for ZONE_DEVICE
    749e2051da3b0 powerpc/dt_cpu_ftrs: Set CPU_FTR_P11_PVR for Power11 and later processors
    07ed8b1785480 fs/proc: fix KPF_KSM reported for all anonymous pages
    b6a6fb6803d52 proc: only bump parent nlink when registering directories
    4d67bdef35c32 fs/proc/task_mmu: use huge_page_size() in pagemap_scan_hugetlb_entry()
    43b987ed35be9 fs/proc/task_mmu: fix hugetlb self-deadlock in pagemap_scan_pte_hole()
    40a04601a3f66 mm/damon/sysfs-schemes: put stats for scheme_add_dirs() internal error
    f18c561eb9c51 mm/damon/sysfs-schemes: fix dir put orders in access_pattern_add_dirs()
    f322955d9a1c3 riscv: cacheinfo: Fix node reference leak in populate_cache_leaves
    1caee6e084a96 mips: sched: Fix CPUMASK_OFFSTACK memory corruption
    bd2e9be9ebb64 selftests/landlock: Test SCOPE_SIGNAL on the SIGIO/fowner pgid path
    193e6471e985c power: supply: charger-manager: fix refcount leak in is_full_charged()
    1f18aac263722 landlock: Fix LANDLOCK_SCOPE_SIGNAL bypass on the SIGIO path
    ff05a98150ebb ntfs3: fix out-of-bounds read in decompress_lznt
    f3624cc069195 ntfs3: validate split-point offset in indx_insert_into_buffer
    aaa1f956c0fc4 ntfs3: bound to_move in indx_insert_into_root before hdr_insert_head
    0fad25687d4d3 ntfs3: cap RESTART_TABLE free-chain walker at rt->used
    be306b8d9143a fs/ntfs3: bound NTFS_DE view.data_off in UpdateRecordData{Root,Allocation}
    908c9243ba309 fs/ntfs3: add depth limit to indx_find_buffer to prevent stack overflow
    7adb38279812c fs/ntfs3: validate lcns_follow in log_replay conversion
    50b5e83384e7f fs/ntfs3: bound attr_off in UpdateResidentValue against data_off
    d240cd98f5f7b fs/ntfs3: bound copy_lcns dp->page_lcns[] index in analysis pass
    09fddd52c1b0c fs/ntfs3: bound DeleteIndexEntryAllocation memmove length
    ccd6b70798737 fs/ntfs3: fix syncing wrong inode on DIRSYNC cross-directory rename
    640627f07c79b mm/damon/core: make charge_addr_from aware of end-address exclusivity
    722e6c54bde63 mm/memory_hotplug: fix incorrect altmap passing in error path
    1697d253f51cf mm/hugetlb: fix hugetlb cgroup rsvd charge/uncharge mismatch
    9227b387eee50 power: supply: max17042: fix OF node reference imbalance
    a3d81de441233 power: supply: cpcap-battery: Fix missing nvmem_device_put() causing reference leak
    a39d281f207b9 mm/mm_init: fix pageblock migratetype for ZONE_DEVICE compound pages
    d3fd2d358df0c MIPS: DEC: Ensure 32-bit stack location for o32 prom_printf()
    11a3bc25f2c30 MIPS: ip22-gio: fix device reference leak in probe
    2c551f14f55e4 MIPS: ip22-gio: fix kfree() of static object
    620a37ea7d626 MIPS: ip22-gio: fix gio device memory leak
    51aad3d89a2dd remoteproc: qcom: Fix leak when custom dump_segments addition fails
    69e18135e2a00 SUNRPC: Bound-check xdr_buf_to_bvec() stores before writing
    46d59ff421824 lockd: Plug nlm_file refcount leak on cached nlm_do_fopen() failure
    1161c4b5bd004 lockd: Plug nlm_file leak when nlm_do_fopen() fails
    66014ab165cb0 sunrpc: harden rq_procinfo lifecycle to prevent double-free
    65b23bec1fca6 sunrpc: wait for in-flight TLS handshake callback when cancel loses race
    3f9ee75a97a76 sunrpc: pin svc_xprt across the asynchronous TLS handshake callback
    30d490bb2c4cd nvdimm/btt: Free arena sub-allocations on discover_arenas() error path
    f4ca396bdd60b nvdimm/btt: Free arenas on btt_init() error paths
    78955fdce8ff6 jbd2: fix integer underflow in jbd2_journal_initialize_fast_commit()
    7199c78c3a3e3 Bluetooth: SCO: hold sk properly in sco_conn_ready
    77eb0cf57009e Bluetooth: SCO: fix sleeping under spinlock in sco_conn_ready
    96dd35f1942cd HID: playstation: validate num_touch_reports in DualShock 4 reports
    88ba845468508 mfd: tps6586x: Fix OF node refcount
    d8e2f3e1bc207 cifs: invalidate cfid on unlink/rename/rmdir
    3256c05d5a9db batman-adv: tt: prevent TVLV OOB check overflow
    d2b657c9653fc batman-adv: mcast: avoid OOB read of num_dests header
    a90f4fff90253 batman-adv: frag: fix primary_if leak on failed linearization
    c945f6007e785 batman-adv: clean untagged VLAN on netdev registration failure
    8f54162e07d3e batman-adv: frag: free unfragmentable packet
    2c989ab8e2054 batman-adv: fix VLAN priority offset
    6a65ac8a81e90 batman-adv: tt: avoid request storms during pending request
    ee878decf9e57 batman-adv: dat: fix tie-break for candidate selection
    9e16b6751a820 batman-adv: ensure minimal ethernet header on TX
    8f76277d02176 batman-adv: dat: ensure accessible eth_hdr proto field
    e5e18886aadd3 batman-adv: bla: reacquire gw address after skb realloc
    3b4c70c40f2e1 batman-adv: dat: acquire ARP hw source only after skb realloc
    b8afcf799b2cc batman-adv: access unicast_ttvn skb->data only after skb realloc
    85a71a81854e0 batman-adv: retrieve ethhdr after potential skb realloc on RX
    e6b43acd34b21 batman-adv: gw: acquire ethernet header only after skb realloc
    fa1ebae4206e6 s390/perf_cpum_cf: Add missing array_index_nospec() to __hw_perf_event_init()
    8514585aa9553 cpufreq: intel_pstate: Set non-turbo capacity to HWP_GUARANTEED_PERF()
    221ee479a49fb cpufreq: schedutil: Fix uncleared need_freq_update on the .adjust_perf() path
    5ab0eba9c8819 perf/x86/amd/lbr: Fix kernel address leakage
    046f6244da9b6 perf/x86/amd/brs: Fix kernel address leakage
    394e2bdf7594e x86/boot: Reject too long acpi_rsdp= values
    f7c67c97b37c1 x86/boot: Validate console=uart8250 baud rate to fix early boot hang
    1a1d6e3ef6cf5 x86/video: Only fall back to vga_default_device() without screen info
    19ffeb30fdfce tools/power/x86/intel-speed-select: Harden daemon pidfile open
    16a42c88c4667 mfd: sm501: Fix reference leak on failed device registration
    6dd51d84a9502 leds: uleds: Fix potential buffer overread
    3a134c3fb5f0d selinux: fix incorrect execmem checks on overlayfs
    d61a80b17254b selinux: avoid sk_socket dereference in selinux_sctp_bind_connect()
    fc633a598206d selinux: check connect-related permissions on TCP Fast Open
    e9cdf741ffcb4 soc: fsl: qe: panic on ioremap() failure in qe_reset()
    c6854d9f4e1bd soc: ti: k3-ringacc: Fix access mode for k3_ringacc_ring_pop_tail_io/proxy
    c4d6442ac3ed0 gpu: host1x: Fix device reference leak in host1x_device_parse_dt() error path
    1c4f67c89fd27 netfilter: bridge: fix stale prevhdr pointer in br_ip6_fragment()
    679ced28a9dc2 netfilter: xt_nat: reject unsupported target families
    b2dbbedfa935c netfilter: ecache: fix inverted time_after() check
    3cd9a5792cbea netfilter: nf_conncount: fix zone comparison in tuple dedup
    a58230f3a7c4f netfilter: nf_conntrack_reasm: guard mac_header adjustment after IPv6 defrag
    2bcf2c5052fb5 netfilter: nf_nat_sip: reload possible stale data pointer
    02b6b0e892aea netfilter: nft_set_pipapo: don't leak bad clone into future transaction
    0ca505346c5e2 netfilter: nf_queue: pin bridge device while NFQUEUE holds fake dst
    07f9ddbf5e799 netfilter: xt_cluster: reject template conntracks in hash match
    a1b672a3b5372 netfilter: nfnl_cthelper: apply per-class values when updating policies
    aff589556ed77 netfilter: nf_conntrack_irc: fix parse_dcc() off-by-one OOB read
    ca028334343a1 ASoC: qcom: q6apm: fix NULL pointer dereference in graph_callback
    e42d8322b67f2 ASoC: mediatek: mt8183: Release reserved memory on cleanup
    4b068759d3087 ASoC: mediatek: mt8183: Check runtime resume during probe
    51c367230e30e ASoC: mediatek: mt8192: Release reserved memory on cleanup
    e0f276f1918a2 ASoC: mediatek: mt8192: Check runtime resume during probe
    d3abaedf6a584 ASoC: SOF: ipc3-control: Validate size in snd_sof_update_control
    121577383b5cf ASoC: SOF: ipc3-control: Fix heap overflow in bytes_ext put/get
    4ebe2c3a7db63 fbdev: tridentfb: fix potential memory leak in trident_pci_probe()
    009a8514745b1 fbdev: nvidia: fix potential memory leak in nvidiafb_probe()
    58bc18e03481b fbdev: vesafb: fix memory leak in vesafb_probe()
    d81860691e4cf fbdev: carminefb: fix potential memory leak in alloc_carmine_fb()
    e1ca9b8559e0f fbdev: tdfxfb: fix potential memory leak in tdfxfb_probe()
    12fe6a56506ed fbdev: uvesafb: fix potential memory leak in uvesafb_probe()
    ad54698255a4b fbdev: s3fb: fix potential memory leak in s3_pci_probe()
    146b708bc75f1 fbdev: i740fb: fix potential memory leak in i740fb_probe()
    c2c795a320e7e fbdev: radeon: fix potential memory leak in radeonfb_pci_register()
    febb5b4f67ace fbdev: efifb: fix memory leak in efifb_probe()
    9423e1f105270 fbdev: sm712: Fix operator precedence in big_swap macro
    d684ce2db92b1 fbdev: hecubafb: fix potential memory leak in hecubafb_probe()
    e8c9aae8c9508 fbdev: broadsheetfb: fix potential memory leak in broadsheetfb_probe()
    6854cf33dddb2 fbdev: metronomefb: fix potential memory leak in metronomefb_probe()
    d5436e18e4fc2 KVM: arm64: nv: Inject SEA if guest VNCR isn't normal memory
    4ead4def04659 KVM: arm64: nv: Inject SEA if kvm_translate_vncr() can't resolve PFN
    5c50db5bcbb90 KVM: arm64: nv: Respect read-only PFN when mapping L1 VNCR
    884b44256041e KVM: arm64: nv: Fix SPSR_EL2 restore in kvm_hyp_handle_mops()
    09f35145f3a4a KVM: arm64: nv: Write ESR_EL2 for injected nested SError exceptions
    5000bcae71c86 KVM: arm64: nv: Drop bogus WARN for write to ZCR_EL2
    7099e7148f81c KVM: Move kvm_io_bus_get_dev() locking responsibilities to callers
    7996013b85687 KVM: nVMX: Put vmcs12 pages if nested VM-Enter fails due to invalid guest state
    d1379888cc423 KVM: x86: Nullify irqfd->producer if updating IRTE for bypass fails
    97542f15dc4cf KVM: x86: Ignore pending PV EOI if the vCPU has since disabled PV EOIs
    ba06690b28be9 KVM: SEV: Do not allow intra-host migration/mirroring of SNP VMs
    df72596278b0e KVM: s390: pci: Fix handling of AIF enable without AISB
    d19dca8194ebe KVM: arm64: vgic: Handle race between interrupt affinity change and LPI disabling
    79fdd2aa774e4 KVM: arm64: vgic: Check the interrupt is still ours before migrating it
    5fb75c5272950 KVM: s390: pci: Fix GISC refcount leak on AIF enable failure
    9f8eaef40e955 powerpc/pseries/Kconfig: Enable CONFIG_VPA_PMU to be used with KVM
    33d79ad6ecedf LoongArch: KVM: Return full old CSR value from kvm_emu_xchg_csr()
    f3efcef6648ba LoongArch: KVM: Fix FPU register width with user access API
    45f2e6505fcf6 LoongArch: KVM: Check the return values for put_user()
    efe27b19a15c3 LoongArch: KVM: Check irq validity in kvm_vcpu_ioctl_interrupt()
    199b570d7fca1 LoongArch: KVM: Validate irqchip index in irqfd routing
    1ee200a1764f8 ARM: dts: stm32: stm32mp15x-mecio1-io: Move expander gpio-line-names to board files
    f550bf32b9a06 ARM: dts: stm32: stm32mp15x-mecio1-io: Fix expander gpio line typo
    7da4d1a6b7400 ARM: dts: stm32: stm32mp15x-mecio1-io: Move gpio-line-names to board files
    804821b69b2d1 ARM: dts: stm32: stm32mp15x-mecio1-io: Fix GPIO names typo
    c632a27f35cff arm64: dts: imx8ulp-evk: Correct Type-C int GPIO flags
    bd938c985ab34 ARM: dts: stm32: stm32mp15x-mecio1-io: Enable internal ADC reference
    ead9f10428c73 arm64: dts: ti: k3-am62a7-sk: Add bootph-all tag to vqmmc
    a98bda2305f3f ARM: dts: stm32: stm32mp15x-mecio1-io: Move divergent mecio1 ADC channels to board files
    4fd52ac541ce1 ARM: dts: stm32: stm32mp15x-mecio1-io: Fix ADC sampling times
    68f9773754f05 arm64: dts: rockchip: fix Ethernet PHY not found on PX30 Ringneck
    e2e3fb995175c arm64: dts: qcom: sdm630: describe adsp_mem region properly
    508e55e81870d ARM: dts: imx6ul-var-som: fix warning for non-existent dc-supply property
    e8dc96a42571e arm64: dts: s32g3: Fix SWT8 watchdog address
    89edae4161412 arm64: fpsimd: Fix type mismatch in sve_{save,load}_state()
    5526d1997aea6 net: ife: require ETH_HLEN to be pullable in ife_decode()
    908391d801b24 octeontx2-vf: clear stale mailbox IRQ state before request_irq()
    eebf439aa7a13 octeontx2-pf: clear stale mailbox IRQ state before request_irq()
    e62adb157c2ea net: atm: reject out-of-range traffic classes in QoS validation
    22100a8f73d4a net: qrtr: fix 32-bit integer overflow in qrtr_endpoint_post()
    61a55fa24a5d7 tipc: restrict socket queue dumps in enqueue tracepoints
    d34deef34c99b ASoC: SOF: topology: validate vendor array size before parsing
    0c4fbdaca225b ASoC: SOF: ipc3-control: Fix TOCTOU in bytes_put and bytes_get
    711d912b18763 ASoC: SOF: ipc3-control: Use overflow checks in control_update size calc
    fb4293173db2d ASoC: SOF: ipc4-control: Fix TOCTOU in sof_ipc4_bytes_put
    d8715b5a8fdb2 vduse: Fix race in vduse_dev_msg_sync and vduse_dev_read_iter
    3a2b47d1b4b3d mlxsw: fix refcount leak in mlxsw_sp_vrs_lpm_tree_replace()
    2d8b3c3e12997 mlxsw: fix refcount leak in mlxsw_sp_port_lag_join()
    b65e46eed9e52 idpf: add padding to PTP virtchnl structures
    1627e7d5c9b09 smb: client: fix overflow in passthrough ioctl bounds check
    327595e7c34e3 drm/xe: remove duplicate <kunit/test-bug.h> include
    3de77d2f34c2b octeontx2-af: fix VF bringup affecting PF promiscuous state
    ee3f7566bcf33 net/mlx5: Fix L3 tunnel entropy refcount leak
    1550b07bca2bb selftests/net: fix EVP_MD_CTX leak in tcp_mmap
    346e2d666a29a regulator: core: regulator_lock_two() should test for EDEADLK not EDEADLOCK
    14e03ecd3b1b5 dm era: fix NULL pointer dereference in metadata_open()
    5b0427ba582d1 SUNRPC: pin upper rpc_clnt across the TLS connect_worker
    13965a7b190f3 SUNRPC: release lower rpc_clnt if killed waiting for XPRT_LOCKED
    b784cd1c24d89 cifs: validate DFS referral string offsets
    df0e3e70f6995 s390/zcrypt: Remove the empty file
    8f48cfe657409 ipvs: ensure inner headers in ICMP errors are in headroom
    7510451a58c27 ipvs: fix PMTU for GUE/GRE tunnel ICMP errors
    d73f4249776dd ipvs: use parsed transport offset in TCP state lookup
    d340e351a0a74 ipvs: pass parsed transport offset to state handlers
    238c612357b5a netfilter: nft_lookup: fix catchall element handling with inverted lookups
    f60ec3058a854 ipv4: igmp: Fix potential memory leaks in igmp_mod_timer() and igmp_stop_timer()
    27506827a01f6 ipv4: igmp: annotate data-races around timer-related fields
    d269eb67d2e58 ipv4: igmp: annotate data-races around im->users
    9ce741c22df4f ipv6: mcast: Fix potential UAF in MLD delayed work
    75e984fe0cb9e ipv4: igmp: Fix potential UAF in igmp_gq_start_timer()
    3bfcce441c552 gpio: mvebu: free generic chips on unbind
    7cc438c99bba3 perf/x86/amd/core: Avoid enabling BRS from the SVM reload path
    9579d625171a1 octeontx2-pf: check DMAC extraction support before filtering
    7aa0e64fea778 net/sched: cake: reject overhead values that underflow length
    72119397cdff6 net: mdio: select REGMAP_MMIO instead of depending on it
    762116dfa7286 drm/v3d: Reject invalid indirect BO handle in indirect CSD setup
    267809e2c56fb accel/amdxdna: Fix potential amdxdna_umap lifetime race
    1cd434ac1c222 tracing: Make tracepoint_printk static as not exported
    5e15cf51982f8 gpio: dwapb: Defer clock gating until noirq
    6c736c5ccf4a3 gpio: dwapb: reduce allocation to single kzalloc
    d7b5497e0e45b gpio: dwapb: Use modern PM macros
    a3010b732d620 net: usb: lan78xx: disable VLAN filter in promiscuous mode
    e8a4c9fc437b1 net/tls: Consume empty data records in tls_sw_read_sock()
    b3eeb586f94c7 accel/amdxdna: Use unsigned long for nr_pages in amdxdna_hmm_register()
    ec5e96aee75d2 ring-buffer: Fix event length with forced 8-byte alignment
    0c602cb8f148a Bluetooth: L2CAP: fix tx ident leak for commands without a response
    bfc9e7be289df Bluetooth: bpa10x: avoid OOB read of revision string in bpa10x_setup()
    b69b1ab121fe8 Bluetooth: ISO: exclude RFU bits from ISO_SDU_Length
    da4d8eea0c5f3 Bluetooth: sco: Fix a race condition in sco_sock_timeout()
    dfc8373893b18 Bluetooth: MGMT: Fix adv monitor add failure cleanup
    23a83bac3356e Bluetooth: 6lowpan: hold L2CAP conn across debugfs control
    026c236f0eefe amt: fix size calculation in amt_get_size()
    3bfb96d9bc6a7 net/smc: fix UAF in smc_cdc_rx_handler() by pinning the socket
    6f9b23eb92a89 net/sched: act_pedit: fix TOCTOU heap OOB write in tc offload
    1b12612c367e4 net: qualcomm: rmnet: validate MAP frame length before ingress parsing
    b066420e57f34 qede: fix off-by-one in BD ring consumption on build_skb failure
    1e71a40d10154 net: microchip: vcap: fix races on the shared Super VCAP block
    5c7e3755abf66 net/mlx5e: Fix publication race for priv->channel_stats[]
    60fddda7207d8 net/mlx5e: Fix HV VHCA stats agent registration race
    420aabb32da43 net/mlx5e: Fix HV VHCA stats zero-sized buffer allocation
    6a802de97a8bf net/mlx5: LAG, MPESW, Fix missing complete() on devcom error
    4eef84b09a383 netfilter: xt_connmark: reject invalid shift parameters
    b29b67c729de0 netfilter: nft_set_rbtree: get command skips end element with open interval
    3d441be2b1c5e netfilter: ip6tables: mark malformed IPv6 extension headers for hotdrop
    e702f6dd5d21e netfilter: xt_rateest: fix u64 truncation in xt_rateest_mt()
    a597a722fb71a netfilter: xt_u32: reject invalid shift counts
    4a4a1d41c6e90 gue: validate REMCSUM private option length
    b153cfe84b134 net: usb: net1080: validate packet_len before pad-byte access in rx_fixup
    66f57dc92aeb6 arm64/sysreg: Fix BWE field encoding in ID_AA64DFR2_EL1
    a6185c21d5510 selftests/hid: Cover hid_bpf_get_data() size overflow
    91ac1d7fd51e3 selftests/hid: Load only requested struct_ops maps
    61a959b82f1ae HID: bpf: Fix hid_bpf_get_data() range check
    4c65c3d9f660b arm64/mm: Optimize TLB flush in unmap_hotplug_[pmd|pud]_range()
    dd395744e4ed8 HID: core: Fix OOB read in hid_get_report for numbered reports
    d354e523c6f74 HID: picolcd: prevent NULL pointer dereference in picolcd_send_and_wait()
    793b55c3f36f5 ata: libata-scsi: limit simulated SCSI command copy to response length
    232a2f2fce9b9 ata: sata_gemini: unwind clocks on IDE pinctrl errors
    86652704a7fd4 cifs: Fix missing credit release on failure in cifs_issue_read()
    c9170c83b0e0f uprobes/x86: Use proper mm_struct in __in_uprobe_trampoline
    2265b2b1c5aaa x86/uprobes: Keep shadow stack in sync for emulated CALLs
    adc7dda728ca3 drm/xe/pf: Don't attempt to process FAST_REQ or EVENT relays
    a0a56b4480a0d drm/xe/hw_engine: Fix double-free of managed BO in error path
    f9a9abd7bbdab drm/xe/userptr: Hold notifier_lock for write on inject test path
    78b1074966d29 drm/xe/pt: Fix NULL pointer dereference in xe_pt_zap_ptes_entry()
    a9b89752c2726 netfs: Fix folio state after ENOMEM whilst under writeback iteration
    1bb33d959aabc netfs: Fix writeback error handling
    7838131e296df netfs: Fix writethrough to use collection offload
    8ab75e445c161 netfs: Fix netfs_create_write_req() to handle async cache object creation
    1f38f65bf965f iomap: guard io_size EOF trim against concurrent truncate underflow
    08b2145470667 ovl: fix comment about locking order
    abe3536a4bedc minix: avoid overflow in bitmap block count calculation
    ce6aced2e8554 afs: Fix unchecked-length string display in debug statement
    158c5a0b1dfc0 afs: Fix the volume AFS_VOLUME_RM_TREE is set on
    657449e5581a4 afs: Fix premature cell exposure through /afs
    2ffb70a8a0198 afs: Fix lack of locking around modifications of net->cells_dyn_ino
    8afb1a787a280 afs: Fix vllist leak
    5492799ec5d27 afs: Fix missing NULL pointer check in afs_break_some_callbacks()
    0acbc09d2aca0 afs: Fix callback service message parsers to pass through -EAGAIN
    63d3f283858fa afs: Fix reinitialisation of the inode, in particular ->lock_work
    5ea289ca751c4 afs: Fix misplaced inc of net->cells_outstanding
    b5bc1e5d5ce57 afs: Fix bulk lookup malfunction due to change in dir_emit() API
    083a0ddc9cd49 afs: Remove erroneous seq |= 1 in volume lookup loop
    6eb0d929202a3 afs: use kvfree() to free memory allocated by kvcalloc()
    aa24cec5b3470 afs: Fix double netfs initialisation in afs_root_iget()
    8530206911fd6 afs: Fix error code in afs_extract_vl_addrs()
    a2038514e6937 fs: refuse O_TMPFILE creation with an unmapped fsuid or fsgid
    374fd8122421f net/sched: hhf: clear heavy-hitter state on reset
    fba8e250ce5f3 net/sched: dualpi2: clear stale classification on filter miss
    a203f2c3892b1 pinctrl: meson: restore non-sleeping GPIO access
    47120164c63d3 gpio: timberdale: Return -ENOMEM on dynamic memory allocation in probe
    5a5ac2852cd32 ksmbd: fix use-after-free of fp->owner.name in durable handle owner check
    d020e7f27bf65 ksmbd: reject undersized DACLs before parsing ACEs
    6b1304ce6cff0 net/sched: act_bpf: use rcu_dereference_bh() to read the filter
    a03387e1f6251 selftests: drv-net: tso: don't touch dangerous feature bits
    df9ffdceac053 cxgb4: Fix decode strings dump for T6 adapters
    124440df267dc virtio_net: disable cb when NAPI is busy-polled
    a8323fb2ab6cd sctp: fix addr_wq_timer race in sctp_free_addr_wq()
    4e8d498d32b6c irqchip/ts4800: Fix missing chained handler cleanup on remove
    c5d75800539bc irqchip/gic-v3-its: Fix OF node reference leak
    f0069a262bd41 tracing/probes: Make the $ prefix mandatory for comm access
    62988204162fc tracing/fprobe: Fix NULL pointer dereference in fprobe_fgraph_entry()
    898cb5a7c4154 tracing: eprobe: read the complete FILTER_PTR_STRING pointer
    e0881f5cc4d71 tracing/events: Fix to check the simple_tsk_fn creation
    f148f86c65b8f tracing/probes: Remove WARN_ON_ONCE from parse_btf_arg
    3b51d6f07a199 tracing/eprobes: Allow use of BTF names to dereference pointers
    acbf1ecc22f3c drm/panthor: Interrupt group start/resumption if group_bind_locked() fails
    a9d098b346db5 drm/panthor: Fix a leak when a group is evicted before the tiler OOM is serviced
    1497a438ea34a drm/panthor: Don't overrule pending immediate ticks in sched_resume_tick()
    dd0b2976b7c0f drm/panthor: Fix potential invalid pointer deref in group_process_tiler_oom()
    b4b3458ef88df bridge: stp: Fix a potential use-after-free when deleting a bridge
    9b7d05cbaa601 net/sched: sch_teql: Introduce slaves_lock to avoid race condition and UAF
    ef940e042f329 net: gianfar: dispose irq mappings on probe failure and device removal
    58ba00999898b net: libwx: fix VMDQ mask for 1-queue mode
    86d379fcf1b79 net: phy: sfp: free mii_bus in sfp_i2c_mdiobus_destroy
    0a7d9c7c5f1f2 usbnet: gl620a: fix out-of-bounds read in genelink_rx_fixup()
    d8a01d27873e0 ipv6: fib6: fix NULL deref in fib6_walk_continue() on multi-batch dump
    83df3e2594cd7 eth: fbnic: don't cache shinfo across skb realloc
    898ca04b096b9 hwmon: (aspeed-g6-pwm-tach) Guard fan RPM calculation against divide-by-zero
    489291b6b5697 hwmon: (pmbus) Fix passing events to regulator core
    36554592e2f5c hwmon: adm1275: Prevent reading uninitialized stack
    1797eb92f0b39 ASoC: codecs: lpass-va-macro: Fix LPASS Codec Version for SC7280
    f14c3926fee38 ASoC: codecs: lpass-va-macro: add SM6115 compatible
    3d3638fe92137 MIPS: mm: Add check for highmem before removing memory block
    4e9f4ca9dc73c MIPS: DEC: Ensure RTC platform device deregistration upon failure
    bca3100f55028 sctp: add INIT verification after cookie unpacking
    ad6215d76b644 sctp: fix SCTP_RESET_STREAMS stream list length limit
    1681cc7974a61 net: enetc: check the number of BDs needed for xdp_frame
    b17751a2ebc4a qede: fix out-of-bounds check for cqe->len_list[]
    8dba7a94a269b seg6: validate SRH length before reading fixed fields
    8d501b1411548 net: pse-pd: scope pse_control regulator handle to kref lifetime
    e94d53a9ac22c gpio: htc-egpio: use managed gpiochip registration
    f4af803269ccd gpio: mvebu: fail probe if gpiochip registration fails
    46dee20d30b70 riscv: Fix 32-bit call_on_irq_stack() frame pointer ABI
    8e0b7f94fb394 ACPI: RIMT: Only defer the IOMMU configuration in init stage
    776f70bafd45c spi: sh-msiof: abort transfers when reset times out
    d6cd34d17b951 tracing: probes: fix typo in a log message
    f28d7b5f1578a ALSA: FCP: Fix NULL pointer dereference in interface lookup
    d990a01b853e5 net: hns3: differentiate autoneg default values between copper and fiber
    2d149a20275ac net: hns3: fix permanent link down deadlock after reset
    92d05883ef337 net: hns3: refactor MAC autoneg and speed configuration
    43a6c6fb6ec50 net: hns3: unify copper port ksettings configuration path
    de051b146022c selftests: tls: size splice_short pipe by page size
    6727f580cf462 dt-bindings: net: renesas,ether: Drop example "ethernet-phy-ieee802.3-c22" fallback
    9075efb9b2c1d net: udp_tunnel: prevent double queueing in udp_tunnel_nic_device_sync
    c1e7286d05318 ASoC: fsl_asrc_dma: fix eDMA maxburst misalignment with channel count
    7a7c7263bbbc4 LoongArch: BPF: Fix off-by-one error in tail call
    ed295077a2214 LoongArch: BPF: Fix outdated tail call comments
    0a8a729481c8e LoongArch: Move struct kimage forward declaration before use
    2f3c0895fb20a net: ethernet: sunplus: spl2sw: fix phy_node refcount leak in remove
    b15a3cc68e245 net: sungem: fix probe error cleanup
    b84dd48f9da1e net: mvneta: re-enable percpu interrupt on resume
    e0ac054416bf4 octeontx2-af: Validate NIX maximum LFs correctly
    9dc3cf8a35906 net: phy: realtek: Clear MDIO_AN_10GBT_CTRL_ADV10G bit
    0c11a1da41a64 net: dsa: realtek: fix memory leak in rtl8366rb_setup_led()
    a69ccea6d7eb6 rtc: cmos: unregister HPET IRQ handler on probe failure
    5fd1f0512748d rtc: ds1307: Fix off-by-one issue with wday for rx8130
    d0bfd7004a87f smb/client: preserve errors from smb2_set_sparse()
    5b6165d7ec384 ACPI: processor_idle: Mark LPI enter functions as __cpuidle
    ea43e7a231aa2 thermal: testing: zone: Flush work items during cleanup
    4e62be1490d23 eth: fbnic: fix ordering of heartbeat vs ownership
    123b559aa6bb6 ipv6: fix missing notification for ignore_routes_with_linkdown
    419017dd2dda2 ipv6: fix state corruption during proxy_ndp sysctl restart
    ae58dbf1d78d7 ipv6: fix error handling in disable_policy sysctl
    2bf70e0306f8d ipv6: fix error handling in forwarding sysctl
    b060606bc7e46 ipv6: fix error handling in ignore_routes_with_linkdown sysctl
    56c26538f0e58 ipv6: fix error handling in disable_ipv6 sysctl
    2140c2f3f2e7b net/sched: cls_api: Handle TC_ACT_CONSUMED in tcf_qevent_handle
    ff127c0aa5279 net: usb: lan78xx: restore VLAN and hash filters after link up
    a9e6707322ef2 veth: fix NAPI leak in XDP enable error path
    4106295280670 net: dsa: sja1105: round up PTP perout pin duration
    7557df1b60f20 net: do not acquire dev->tx_global_lock in netdev_watchdog_up()
    03b743586a246 net, bpf: check master for NULL in xdp_master_redirect()
    a0904f7d27035 alpha/PCI: Fix __pci_mmap_fits() overflow for zero-length BARs
    94defb18ac792 alpha/PCI: Add security_locked_down() check to pci_mmap_resource()
    04117aea9bc11 NTB: epf: Fix doorbell bitmask and IRQ vector handling
    56ec2a08d27b5 NTB: epf: Report 0-based doorbell vector via ntb_db_event()
    d2a41c85beb56 NTB: epf: Make db_valid_mask cover only real doorbell bits
    60a6689b9a5df gpio: davinci: fix IRQ domain leak on devm_kzalloc failure
    33e1875d6b5b5 netfilter: nft_compat: ebtables emulation must reject non-bridge targets
    d3e9a7e2ce9dc netfilter: nft_synproxy: stop bypassing the priv->info snapshot
    329f2626ee5cb netfilter: nf_conncount: prevent connlimit drops for early confirmed ct
    a73e7ac3f3b69 netfilter: nf_nat: avoid invalid nat_net pointer use on failed nf_nat_init()
    49fa1be621dde bpf: Disable xfrm_decode_session hook attachment
    4d919c9b77099 md/raid5: avoid R5_Overlap races while breaking stripe batches
    3db13f82ba314 md/raid5: use stripe state snapshot in break_stripe_batch_list()
    828fad4fd418b ipv4: fib: Don't ignore error route in local/main tables.
    630ce3806b706 eth: bnxt: improve the timing of stats
    c0057e5f762b9 eth: bnxt: rename ring_err_stats -> ring_drv_stats
    33168db149d01 eth: bnxt: gather and report HW-GRO stats
    b0d0eb13a0441 ipv6: Fix null-ptr-deref in fib6_nh_mtu_change().
    77bb0bbfcc4e7 ksmbd: fix use-after-free of conn->preauth_info in concurrent SMB2 NEGOTIATE
    1f6a4aec0d366 rtc: msc313: fix NULL deref in shared IRQ handler at probe
    68115a7a336fc i40e: Fix i40e_debug() to use struct i40e_hw argument
    de80d04b13dec ice: dpll: fix memory leak in ice_dpll_init_info error paths
    eaffdd113f560 ice: dpll: set pointers to NULL after kfree in ice_dpll_deinit_info
    854065a75e375 rtc: isl1208: Balance enable_irq_wake() with disable_irq_wake() on cleanup
    4cc632fe63df8 ice: call netif_keep_dst() once when entering switchdev mode
    04c082b7dc5bf ice: fix AQ error code comparison in ice_set_pauseparam()
    dd6d8e4412f80 ice: fix FDIR CTRL VSI resource leak in ice_reset_all_vfs()
    9415a94cf6227 PCI: endpoint: pci-epf-ntb: Add check to detect 'db_count' value of 0
    e1e7c72a2301d PCI: endpoint: pci-epf-vntb: Add check to detect 'db_count' value of 0
    9cc0f8e63e8c3 drm/edid: fix OOB read in drm_parse_tiled_block()
    5e4c4ab99abc9 gpiolib: initialize return value in gpiochip_set_multiple()
    7550becf33014 power: sequencing: fix ABBA deadlock in pwrseq_device_unregister()
    9697db03e0103 bpf: Fix effective prog array index with BPF_F_PREORDER
    3bdfa0e435f31 bpf: zero-initialize the fib lookup flow struct
    b05337635be3c bpftool: Fix vmlinux BTF leak in cgroup commands
    68b41e68a6229 bpf: Fix stack slot index in nospec checks
    aa33b44f70bfe rtc: ds1307: handle oscillator stop flag for ds1337/ds1339/ds3231
    56e5f8a409f8c rtc: abx80x: fix the RTC_VL_CLR clearing all status flags
    93f95538b611a dpaa2-switch: do not accept VLAN uppers while bridged
    ea24f911ead85 ipv6: ioam: fix type confusion of dst_entry
    a6450f7cfae57 ipv6: ndisc: fix NULL deref in accept_untracked_na()
    2066e692ec7a1 net: airoha: Fix skb->priority underflow in airoha_dev_select_queue()
    1d51aff78f078 net/sched: act_ct: fix nf_connlabels leak on two error paths
    a103cdb0681e7 net: emac: Fix NULL pointer dereference in emac_probe
    2855ec137a224 octeontx2-pf: mcs: Fix mcs resources free on PF shutdown
    da603b606ceb3 octeontx2-pf: Clear stats of all resources when freeing resources
    5636f0f3bd99b octeontx2-af: mcs: Fix unsupported secy stats read
    ceef83f0eaf9c net: ethernet: mtk_ppe: Fix rhashtable leak in mtk_ppe_init error paths
    a0c5fdeb5fa25 tipc: fix use-after-free of the discoverer in tipc_disc_rcv()
    5dda4f164a633 net: marvell: prestera: initialize err in prestera_port_sfp_bind
    9200c8149910d selftests/mm: fix exclusive_cow test fork() handling
    55fc2f99d0979 selftests/mm: allow PUD-level entries in compound testcase of hmm tests
    c8add1d06512b selftests/mm: clarify alternate unmapping in compaction_test
    0caa28e978941 selftests/mm: skip uffd-stress test when nr_pages_per_cpu is zero
    471b62966c782 selftests/mm: ensure destination is hugetlb-backed in hugetlb-mremap
    9dbfd514148dd selftest/mm: register existing mapping with userfaultfd in hugetlb-mremap
    a8673dbd3d4a0 selftests/mm: free dynamically allocated PMD-sized buffers in split_huge_page_test
    31b28910abe34 selftests/mm: size tmpfs according to PMD page size in split_huge_page_test
    fff7d3ea3a4c4 selftests/mm: fix cgroup task placement and drop memory.current checks in hugetlb_reparenting_test.sh
    8c65c58868ecc selftests/mm: fix hugetlb pathname construction in hugetlb_reparenting_test.sh
    58cd8ff69e33c selftests/mm: restore default nr_hugepages value via exit trap in hugetlb_reparenting_test.sh
    b805de2abfa34 selftests/mm: restore default nr_hugepages value via exit trap in charge_reserved_hugetlb.sh
    37e3e8a2c3bfd alloc_tag: fix use-after-free in /proc/allocinfo after module unload
    502b3ae43f798 irqchip/crossbar: Fix parent domain resource leak
    002ebbcc8414c mailbox: imx: Forward the timeout/ error in imx_mu_generic_tx()
    7e23965d44f06 netfilter: nft_meta_bridge: fix NFT_META_BRI_IIFPVID stack leak
    d32e4301a0e5e netfilter: nf_reject: skip iphdr options when looking for icmp header
    8e935c51b65d9 netfilter: nft_flow_offload: zero device address for non-ether case
    4c61d28634fbf netfilter: flowtable: move path discovery infrastructure to its own file
    13c6ba6e0f216 netfilter: nft_meta_bridge: add validate callback for get operations
    5baa149abb41a netfilter: nft_payload: reject offsets exceeding 65535 bytes
    12088da6add5b netfilter: ipset: make sure gc is properly stopped
    8087bb360a936 netfilter: ipset: fix order of kfree_rcu() and rcu_assign_pointer()
    c4d257734e91b netfilter: ipset: Don't use test_bit() in lockless RCU readers in hash types
    a0afd353c2f7e netfilter: ipset: annotate "pos" for concurrent readers/writers
    7228cc8ff6265 netfilter: ipset: Fix data race between add and dump in all hash types
    6d92dbd73d19a md/raid1: free r1_bio when REQ_NOWAIT is set and read would block on retry
    2c5384c40a4ce md/raid1: honor REQ_NOWAIT when waiting for behind writes
    119903c320830 md: merge mddev serialize_policy into mddev_flags
    2e414af05a7cf md: merge mddev faillast_dev into mddev_flags
    9408c233a5bbe md: merge mddev has_superblock into mddev_flags
    5464ee6442376 mac802154: Prevent overwrite return code in mac802154_perform_association()
    de3bd9809af75 ieee802154: fix kernel-infoleak in dgram_recvmsg()
    d22e278cd0679 ieee802154: Remove WARN_ON() in cfg802154_pernet_exit()
    f4860dd988b10 ieee802154: Avoid calling WARN_ON() on -ENOMEM in cfg802154_switch_netns()
    5d17ebdf6c236 ieee802154: Restore initial state on failed device_rename() in cfg802154_switch_netns()
    3b40ebc19ad02 ACPI: IPMI: Fix inverted interface check in ipmi_bmc_gone()
    45465b0e01354 ACPI: resource: Amend kernel-doc style
    7ae67f0e1c16b thermal: intel: Fix dangling resources on thermal_throttle_online() failure
    679fd0bf4f8ab arm64/hw_breakpoint: reject unaligned watchpoints that would truncate BAS
    4c16176fc11a6 ALSA: usb-audio: Kill MIDI 2.0 URBs before freeing endpoints
    a762b9865f494 selftests: vlan_bridge_binding: Fix flaky operational state check
    c6d3bcb0f934d flow_dissector: check device type before reading ETH_ADDRS
    68af74ad696ce net: macb: add TX stall timeout callback to recover from lost TSTART write
    112b5eff24e04 net: airoha: fix foe_check_time allocation size
    5ffb2b4987cc9 devlink: Fix parent ref leak on tc-bw failure
    02c884d9aaca3 devlink: Fix parent ref leak in devl_rate_node_create()
    0dafdaaf8684b dpaa2-switch: fix VLAN upper check not rejecting bridge join
    c7fc9adf4e006 virtio-net: fix len check in receive_big()
    0d95587d662a5 spi: rpc-if: Use correct device for hardware reinitialization on resume
    f37f2f804796e PCI: iproc: Restore .map_irq() for the platform bus driver
    53c23d56b46b1 ALSA: usb-audio: qcom: clear opened when stream enable fails
    25a867aa5e67a ALSA: usb-audio: qcom: reject stream disable with no active interface
    207bb4ce8fe7d sctp: hold socket lock when dumping endpoints in sctp_diag
    a6cfb924ad74e net: psample: fix info leak in PSAMPLE_ATTR_DATA
    3d45d40b872ae octeontx2-pf: Fix leak of SQ timestamp buffer on teardown
    290ad0a548915 drm/amdgpu: initialize irq.lock spinlock earlier
    96ac562a9ea30 drm/amdkfd: fix list_del corruption in kfd_criu_resume_svm
    211bb9d8f17c4 drm/amd/display: Fix mem_type change detection for async flips
    0e27d92f69b8e drm/amdkfd: Avoid double-unpin of DOORBELL/MMIO BOs on free
    7bcd4ef375fa3 ASoC: tlv320aic3x: restrict CLKDIV bypass Q values in dual-rate mode
    ca297485271c6 perf dso: Set standard errno on decompression failure
    05b11debdffe0 perf bpf: Validate array presence before casting BPF prog info pointers
    c8cb4a92eda6e perf cs-etm: Bounds-check CPU in cs_etm__get_queue()
    b389a5b215e35 perf cs-etm: Require full global header in auxtrace_info size check
    c13532ff67fae perf cs-etm: Validate num_cpu before metadata allocation
    87d23f25b5e97 perf machine: Use snprintf() for guestmount path construction
    6d99379c58f7f xfrm: validate selector family and prefixlen during match
    7248ae02a9453 xfrm: annotate data-races around xfrm_policy_count[] and xfrm_policy_default[]
    a1a3360a0c44b xfrm: Fix xfrm state cache insertion race
    1467ca02ddac4 ALSA: usb-audio: qcom: Free sideband sg_table objects
    507a7b07f3fa3 i3c: master: Add missing runtime PM get in dev_nack_retry_count_store()
    34cd92141a024 i3c: master: Update dev_nack_retry_count under maintenance lock
    95028569589f4 spi: dw: fix wrong BAUDR setting after resume
    355e51eeffc6b drm/xe: Fix wa_oob codegen recipe for external module builds
    2024940522ef4 drm/i915: clear CRTC color blob pointers after dropping refs
    1348bf64c1978 gpio: mlxbf3: fail probe if gpiochip registration fails
    7d3532a0b11a2 perf cs-etm: Reject CPU IDs that would overflow signed comparison
    a56f29ad8aacf perf: Remove redundant kernel.h include
    f8898d2eb71ae perf bpf: Bounds-check array offsets in bpil_offs_to_addr()
    cafd80d81f08b perf bpf: Reject oversized BPF metadata events that truncate header.size
    1935d213aeb23 perf bpf: Validate func_info_rec_size and sub_id in synthesize_bpf_prog_name()
    aea30b437ebd0 perf sched: Replace (void*)1 sentinel with proper runtime allocation
    bc27041e8971e perf hwmon: Fix fd check to accept fd 0 in hwmon_pmu__describe_items()
    661f60a8a5cf8 perf tools: Use snprintf() for root_dir path construction
    5d080b7324f07 perf dso: Set error code when open() fails on uncompressed fallback path
    debfcd673a6d1 perf dso: Fix heap overflow in dso__get_filename() on decompressed path
    95bf4dbcd5022 perf tools: Fix uninitialized pathname on uncompressed fallback in filename__decompress()
    fa870f951793d perf tools: Add O_CLOEXEC to open() calls in DSO and ELF code
    3ae7947101b97 perf tools: Don't read build-ids from non-regular files
    2c19e40753ec1 perf symbols: Break infinite loop on zero-filled notes in sysfs__read_build_id()
    137eabe3c18ff perf symbols: Validate p_filesz before use in filename__read_build_id()
    ca3393e258f63 perf symbols: Fix bswap copy-paste error for 32-bit ELF p_filesz
    f231387f3d2bb sparc: led: avoid trimming a newline from empty writes
    17955f1995bf9 accel/ivpu: fix HWS command queue leak on registration failure
    85873b1bd3664 apparmor: fix label can not be immediately before a declaration
    38d3d33bf42c2 i3c: master: Prevent reuse of dynamic address on device add failure
    c4f2afcdc5470 i3c: master: Defer new-device registration out of DAA caller context
    3891c061341fb i3c: master: Ensure Hot-Join operations are stopped on shutdown
    57490b302b984 i3c: master: Consolidate Hot-Join DAA work in the core
    0bd450d40f874 i3c: master: Move rstdaa error suppression
    fd32e8d4a2933 i3c: master: Add i3c_master_do_daa_ext() for post-hibernation address recovery
    b07a318afca16 i3c: master: Introduce optional Runtime PM support
    882ee831366a1 i3c: master: Replace WARN_ON() with dev_err() in i3c_dev_free_ibi_locked()
    de2106d99b87a i3c: add sysfs entry and attribute for Device NACK Retry count
    0d66830f302fd i3c: master: Make hot-join workqueue freezable to block hot-join during suspend
    eb9db96a5deb3 i3c: master: add WQ_PERCPU to alloc_workqueue users
    45bbc1e1fe626 i3c: mipi-i3c-hci: Preserve RUN bit when aborting DMA ring
    d22ab94261c7b i3c: mipi-i3c-hci: Switch PIO data allocation to devm_kzalloc()
    973fda38b124c i3c: mipi-i3c-hci: Allow for Multi-Bus Instances
    5625b8767ce3e i3c: mipi-i3c-hci: Quieten initialization messages
    2791dd42d41e3 apparmor: fix uninitialised pointer passed to audit_log_untrustedstring()
    fdf610a9a9e72 apparmor: don't audit files pointing to aa_null.dentry
    b58d240883dfe apparmor: put secmark label after secid lookup
    66a6c61369d41 apparmor: aa_getprocattr free procattr leak on format failure
    22dc9433d458c apparmor: fail policy unpack on accept2 allocation failure
    3b918f6f52390 apparmor: Fix return in ns_mkdir_op
    566d1ef98a711 apparmor: remove or add symlinks to rawdata according to export_binary
    fbfdb5a94a487 apparmor: fix NULL pointer dereference in unpack_pdb
    57b1bd4486d56 apparmor: fix potential UAF in aa_replace_profiles
    b427061ca4983 apparmor: grab ns lock and refresh when looking up changehat child profiles
    9111f76e8dc8c apparmor: fix rawdata_f_data implicit flex array
    ae02e603c0b39 apparmor: aa_label_alloc use aa_label_free on alloc failure
    d821601323456 apparmor: check label build before no_new_privs test
    ad965f36d2986 security/apparmor/apparmorfs.c: conditionally compile get_loaddata_common_ref()
    045dbe89ac317 apparmor: fix refcount leak when updating the sk_ctx
    d8ea44f6090c0 apparmor: fix race in unix socket mediation when peer_path is used
    ef488d7429d23 apparmor: fix shadowing of plabel that prevents cache from being updated
    f79519f636059 Revert "PCI/MSI: Unmap MSI-X region on error"
    514b84b1bf30f PCI: dwc: Avoid dwc_pcie_rasdes_debugfs_deinit() NULL dereference when no RAS DES capability
    11016555d7510 phy: freescale: phy-fsl-imx8qm-lvds-phy: Fix missing pm_runtime_disable() on probe error path
    872f9a63a108e PCI: mediatek: Use actual physical address instead of virt_to_phys()
    f77c490c45d46 PCI: mediatek: Fix possible truncation in mtk_pcie_parse_port()
    9ca0a78a5d561 dt-bindings: phy: sc8280xp-qmp-pcie: Disallow bifurcation register on Purwa
    f1f5f8d334e91 perf symbols: Add bounds checks to read_build_id() note iteration in minimal build
    cc6cd3fe8b8b1 perf symbols: Add bounds checks to elf_read_build_id() note iteration
    a3e758e741228 perf bpf: Fix metadata leak in perf_env__add_bpf_info() on duplicate insert
    f593775fecf5a perf bpf: Fix map data leak in bpf_metadata_create() on alloc failure
    bafb6bfb346fe perf bpf: Add NULL check for btf__type_by_id() in synthesize_bpf_prog_name()
    fe4d8ad2e96f4 tools lib api: Fix mount_overload() snprintf truncation and toupper range
    b0385203a09f0 tools lib api: Fix filename__write_int() writing uninitialized stack data
    41b3a92310450 perf tools: Use snprintf() in dso__read_running_kernel_build_id()
    fbaf9bdfc0917 perf hwmon: Guard label read against empty or failed reads
    d34b42ee0c74d perf symbols: Bounds-check descsz in sysfs__read_build_id() GNU fallback
    bc2fc12ce6e4d perf hwmon: Fix parse_hwmon_filename() strlcpy buffer overflow
    f830bb8d221f3 perf hwmon: Use scnprintf() in hwmon_pmu__for_each_event()
    76dfa13a0acb1 perf hwmon: Fix off-by-one null termination on sysfs reads
    56b17c84394f1 perf tools: Fix thread__set_comm_from_proc() on empty comm file
    f2e5262589d94 perf intel-pt: Fix snprintf size tracking bug in insn decoder
    45e7900e1555c perf symbols: Bounds-check .gnu_debuglink section data
    4f883ab5bc7b7 perf symbols: Fix signed overflow in sysfs__read_build_id() size check
    490473192ac2f tools lib api: Fix missing null termination in filename__read_int/ull()
    09962b811ef14 perf pmu: Fix perf_pmu__parse_scale/unit() OOB access on empty sysfs file
    a6eec54329b43 perf pmu: Fix pmu_id() heap underwrite on empty identifier file
    e274dfa05904f perf cs-etm: Queue context packets for frontend
    fa9eb50ddfea3 perf s390: Fix TEXTREL in Python extension by compiling as PIC
    b5a0a4a564d21 xprtrdma: Return sendctx slot after Send preparation failure
    007b4da2f38dc xprtrdma: Repost Receive buffers for malformed replies
    469b22376ee73 xprtrdma: Sanitize the reply credit grant after parsing
    d7a2870dde3bb xprtrdma: Fix bcall rep leak and unbounded peek
    345652531400f xprtrdma: Resize reply buffers before reposting receives
    47b3dc59e09e9 xprtrdma: Document and assert reply-handler invariants
    7471e66373a44 xprtrdma: Check frwr_wp_create() during connect
    28743571c17b5 xprtrdma: Initialize re_id before removal registration
    d0479c2b12974 xprtrdma: Fix ep kref imbalance on ADDR_CHANGE
    6d52921f47020 perf hists: Fix snprintf() in hists__scnprintf_title() UID filter path
    56ad33189ed5f perf bpf: Use scnprintf() in snprintf_hex() and synthesize_bpf_prog_name()
    c32fe40b0c745 perf sched: Fix idle-hist callchain display using wrong rb_first variant
    77051ef66e4ad perf sched: Bounds-check prio before test_bit() in timehist
    2e0dd50e5a4da PCI: rcar-host: Remove unused LIST_HEAD(res)
    b9e8406651dcc perf tools: Use perf_env__get_cpu_topology() in machine__resolve()
    504028f561b19 perf tools: Use scnprintf() in cpu_map__snprint() to prevent overflow
    2a8244988316a perf tools: Fix get_max_num() size_t underflow on empty sysfs file
    3f4476a089a6d platform/x86/intel/vsec: Restore BAR fallback for header walk
    d6565e08166c8 platform/x86/intel/vsec: Return real error codes from registration path
    4df30a4dc0e97 platform/x86/intel/vsec: Switch exported helpers from pci_dev to device
    817ab332d37ce platform/x86/intel/vsec: Decouple add/link helpers from PCI
    e6523bcafeb61 platform/x86/intel/vsec: correct kernel-doc comments
    c0d97519c9dfb platform/x86:intel/pmc: Relocate lpm_req_guid to pmc_reg_map
    b95e1facc5b7f platform/x86:intel/pmc: Rename PMC index variable to pmc_idx
    3e86797c0699d platform/x86:intel/pmc: Add support for multiple DMU GUIDs
    4f129fc6f756f fs/ntfs3: resize log->one_page_buf when adopting on-disk page size
    d3491b23bc207 PCI: meson: Add missing remove callback
    a5c0ba31eef9e PCI: meson: Propagate devm_add_action_or_reset() failure
    f0aaa198e068b pwm: rzg2l-gpt: Add missing newlines to dev_err_probe() messages
    a57692ad365f3 PCI: mediatek: Fix operator precedence in PCIE_FTS_NUM_L0 macro
    f161ef7b0dd2f nfs: use nfsi->rwsem to protect traversal of the file lock list
    a6f147b23e361 NFSv4/flexfiles: honor FF_FLAGS_NO_IO_THRU_MDS in pg_get_mirror_count_write
    a70375f0b793e NFSv4/flexfiles: honor FF_FLAGS_NO_IO_THRU_MDS on fatal DS connect errors
    b694c7de94bc5 nfs: keep PG_UPTODATE clear after read errors in page groups
    f84949dd17847 NFSv4/pnfs: defer return_range callbacks until after inode unlock
    53442c7d0c888 xprtrdma: Decouple req recycling from RPC completion
    becc90a04780a xprtrdma: Use sendctx DMA state for Send signaling
    e7ae0883c8c89 xprtrdma: Post receive buffers after RPC completion
    f043dd58fbd79 xprtrdma: Close lost-wakeup race in xprt_rdma_alloc_slot
    b7bc8e7f09ae4 xprtrdma: Avoid 250 ms delay on backlog wakeup
    44b73b4b7eff7 pNFS/filelayout: fix cheking if a layout is striped
    f3f21b94cf980 sunrpc: Fix error handling in rpc_sysfs_xprt_switch_add_xprt_store()
    e8dc126e80395 clk: qcom: a53: Corrected frequency multiplier for 1152MHz
    c0e6bb2b0408f dmaengine: dma-axi-dmac: use DMA pool to manange DMA descriptor
    9f1ef67c041ef dmaengine: dma-axi-dmac: Properly free struct axi_dmac_desc
    329ec20a86091 dmaengine: Fix possible use after free
    7d49f0ddaf5a4 dmaengine: qcom: gpi: set DMA_PRIVATE capability
    8e2c460a8f0e4 mshv: add bounds check on vp_index in mshv_intercept_isr()
    eaf937b501fd0 clk: qcom: camcc-x1e80100: Add support for camera QDSS debug clocks
    032692e4525a0 dt-bindings: clock: qcom: Add X1P42100 camera clock controller
    c7c8bab87d0df perf tools: Fix int16_t truncation of max_cpu_num in set_max_cpu_num()
    e16012f8f63d3 perf timechart: Fix cpu2y() OOB read on untrusted CPU index
    330219fe8523f perf c2c: Fix use-after-free in he__get_c2c_hists() error path
    01564c1a260f6 perf stat: Introduce perf_env__get_cpu_topology() to guard NULL env->cpu
    c05ba5b57505a perf mmap: Fix NULL deref in aio cleanup on alloc failure
    c4406dbe5d8f4 perf sched: Replace BUG_ON and add NULL checks in replay event helpers
    b1f7683632712 perf sched: Use thread__put() in free_idle_threads()
    1517402d0a81c perf sched: Clean up idle_threads entry on init failure
    d6b586bb8f489 perf c2c: Bounds-check CPU IDs in setup_nodes() topology loop
    2f9f7224e7691 perf c2c: Bounds-check CPU and node IDs before bitmap and array access
    278e30717c356 perf stat: Bounds-check CPU index in topology aggregation callbacks
    21a9b87ada08d perf mmap: Guard cpu__get_node() return in aio_bind()
    652cea73b7b7b perf sched: Fix register_pid() overflow, strcpy, and BUG_ON
    068e9b6a07bc0 perf sched: Cap max_cpu at MAX_CPUS in timehist sample processing
    1d25a8418c890 perf tools: Add bounds check to cpu__get_node()
    89489a31f4443 perf sched: Fix thread reference leak in latency_switch_event
    ea486d61b1663 perf tools: Guard test_bit from out-of-bounds sample CPU
    18961e0f8966e perf annotate: Fix crashes on empty annotate windows
    93f3e84fc74e6 perf: Fix off-by-one stack buffer overflow in kallsyms__parse()
    d78b16d078149 dt-bindings: dma: nvidia,tegra186-gpc-dma: Make reset optional
    a498063f95bdd dmaengine: imx-sdma: Refine spba bus searching in probe
    da40583823153 thunderbolt: debugfs: Fix margining error counter buffer leak
    038a0f01dda59 drm/amd/display: Add missing kdoc for ALLM parameters
    c5388a957cf1d fs/ntfs3: fix mount failure on 64K page-size kernels
    a318932065883 fs/ntfs3: add bounds check to run_get_highest_vcn()
    097fcf945d93a HID: logitech-hidpp: remove excess kernel-doc member in hidpp_scroll_counter
    26fa946925a09 clk: at91: keep securam node alive while mapping it
    0147c544cbc6e iio: tcs3472: power down chip on probe failure
    1cddef80a180a iio: accel: mma8452: handle I2C read error(s) in mma8452_read()
    9ac3675bf8757 iio: adc: xilinx-ams: fix out-of-bounds channel lookup in event handling
    3d57672119525 iio: magnetometer: ak8975: fix potential kernel stack memory leak
    6ec473b360342 iio: light: si1133: prevent race condition on timeout
    f835b69fbeaeb iio: light: si1133: reset counter to prevent race condition
    fd6b65ade1190 perf header: Sanity check HEADER_EVENT_DESC attr.size before swap
    be62602fe0797 PCI: qcom: Disable ASPM L0s for SA8775P
    de93ef83f99e8 powerpc tools perf: Initialize error code in auxtrace_record_init function
    96c8f732cadf7 clk: renesas: rzg2l: Rename iterator in for_each_mod_clock() to avoid shadowing
    fdee9f207a48c gpib: fix double decrement of descriptor_busy in command_ioctl()
    3d5e4cc0d9dce char: tlclk: fix use-after-free in tlclk_cleanup()
    d72ece584c448 gpib: Fix inappropriate ioctl error return
    92f8b1d833834 perf test amd ibs: Fix incorrect kernel version check
    2b2b1613b734b usb: host: max3421: Reject hub port requests for non-existent ports
    02d03c61e8a7b usb: host: max3421: Fix shift-out-of-bounds in max3421_hub_control()
    43078449ad623 staging: most: video: avoid double free on video register failure
    45652323ce74b perf inject: Add --convert-callchain option
    28ebd287a7fad perf build-id: Fix off-by-one bug when printing kernel/module build-id
    fc5ce5606db57 PCI: dwc: Fix signedness bug in fault injection test code
    7d881615fb637 mailbox: mtk-adsp: fix UAF during device teardown
    91353d63bbf61 mailbox: mpfs: fix check for syscon presence in mpfs_mbox_inbox_isr()
    e6bc4e127707d coresight: Fix source not disabled on idr_alloc_u32 failure
    67d0475e78b39 soundwire: intel_ace2x: release bpt_stream when close it
    5732869c70d42 clk: at91: sam9x7: Fix gmac_gclk clock definition
    f28906e7e32fd perf pmu: Skip test on Arm64 when #slots is zero
    210c202c0576b phy: phy-can-transceiver: Check driver match and driver data against NULL
    226feccaac818 clk: qcom: cmnpll: Account for reference clock divider
    6abdf27fbcfb3 coresight: fix missing error code when trace ID is invalid
    5bb87456dcd66 bus: mhi: ep: Fix potential deadlock in mhi_ep_reset_worker()
    601a9b2e3b2fb rust: alloc: fix assert in `Vec::reserve` doc test
    b773c7161cea7 PCI: loongson: Do not ignore downstream devices on external bridges
    e1b79f77336d1 perf sched: Add missing mmap2 handler in timehist
    c788955b4a145 platform/x86: xo15-ebook: Fix wakeup source and GPE handling
    2ce4d93768d2c x86/platform/olpc: xo15: Drop wakeup source on driver removal
    1d495446ec7ac PCI: Check ROM header and data structure addr before accessing
    78f264c0cb2ac PCI: Introduce named defines for PCI ROM
    10021c2d33061 PCI/ASPM: Don't reconfigure ASPM entering low-power state
    48dde5c56426c coresight: etm4x: Correct TRCVMIDCCTLR1 save and restore
    65d87f28daec3 coresight: ete: Always save state on power down
    1ac8f4c112aa9 coresight: etm4x: Remove the state_needs_restore flag
    a454f61747c97 soundwire: fix bug in sdw_add_element_group_count found by syzkaller
    d3896c944338c soundwire: don't program SDW_SCP_BUSCLOCK_SCALE on a unattached Peripheral
    c3ca7c6741af3 coresight: cti: Fix DT filter signals silently ignored
    fb940466fd4d3 perf debuginfo: Fix libdw API contract violations
    bb3d592c7d6c4 staging: nvec: fix use-after-free in nvec_rx_completed()
    466c7f87de52d i3c: master: svc: Fix missed IBI after false SLVSTART on NPCM845
    db2d8b6525bdd gpiolib: acpi: Only trigger ActiveBoth interrupts on boot
    02e2dadd62eae eventpoll: Fix epoll_wait() report false negative
    f938bc8fde518 eventpoll: rename epi->next and txlist for clarity
    430dac191905b eventpoll: wrap EP_UNACTIVE_PTR in typed sentinel helpers
    d8f88803152f0 eventpoll: extract ep_deliver_event() from ep_send_events()
    4fd51f413d7b5 eventpoll: split ep_insert() into alloc + register stages
    25e85dc040a6c eventpoll: rename attach_epitem() to ep_attach_file()
    baebd892f8a2c eventpoll: expand top-of-file overview / locking doc
    f04166c8677aa eventpoll: rename ep_remove_safe() back to ep_remove()
    13bf9879b778b net/9p: fix race condition on rdma->state in trans_rdma.c
    9c1c120471a67 9p: avoid returning ERR_PTR(0) from mkdir operations
    ae1f3460833d3 ocfs2: fix circular locking dependency in ocfs2_dio_end_io_write
    d35e4032f16d7 mfd: cs42l43: Sanity check firmware size
    706fe1ce4f3a5 mfd: rsmu: Fix page register setup
    35d3d6ff2bc1e ksmbd: fix use-after-free in same_client_has_lease()
    aa0c43c13c0bf RDMA/bnxt_re: Fail DBR related page allocation UAPIs if the feature is disabled
    0fe155aa844e4 RDMA/bnxt_re: Move the UAPI methods to a dedicated file
    95d46a8d3ba9f RDMA/bnxt_re: Avoid displaying the kernel pointer
    104a7ff382a58 RDMA/bnxt_re: Free SRQ toggle page after firmware teardown
    5a48dd5150d7c ionic: Fix check in ionic_get_link_ext_stats
    4c55003566c0b net: ethernet: oa_tc6: Remove FCS size in RX frame
    93e133b9193cb net: airoha: Fix always-true condition in PPE1 queue reservation loop
    d774cdbda6634 tcp: ipv6: clamp default adverting MSS to avoid GSO_BY_FRAGS (0xFFFF)
    0d8a12d714312 tipc: fix UAF in tipc_l2_send_msg()
    db1616263a2c5 KEYS: Use acquire when reading state in keyring search
    66919a6d72b9e powerpc/kexec: fix double get_cpu() imbalance in kexec_prepare_cpus
    527cd14a416f2 powerpc/powernv: fix preempt count leak in pnv_kexec_wait_secondaries_down
    73711688479df powerpc/perf: fix preempt count underflow in fsl_emb_pmu_del
    92f38fe85198a MIPS: mm: Fix out-of-bounds write in maar_res_walk()
    fe09dd288722f bpf, sockmap: fix integer overflow in bpf_msg_pop_data() bounds check
    81567d2b3f4dc sockmap: Fix use-after-free in udp_bpf_recvmsg()
    073d957252696 net: remove addr_len argument of recvmsg() handlers
    4e40056bb5c82 bpf, sockmap: reject overflowing copy + len in bpf_msg_push_data()
    264d6a79c96ee udf: fix nls leak on udf_fill_super() failure
    5e8627b7a7b7c bpf: Fix bpf_get/setsockopt to tos for ipv4-mapped ipv6 socket
    e803077769248 selftests/bpf: Initialize operation name before use
    9f32d4c2de85f selftests/bpf: Fix typo in verify_umulti_link_info
    74badb5e2b00a smb/client: always return a value for FS_IOC_GETFLAGS
    21303c4a2b727 cifs: remove all cifs files before kill super
    7a59146cb9ade ALSA: core: Fix unintuitive behavior of snd_power_ref_and_wait()
    87d1eaffeec41 netfilter: nf_conncount: callers must hold rcu read lock
    98a965cb1e767 ALSA: seq: avoid stale FIFO cells during resize
    287d506d4e086 ALSA: seq: oss: Serialize readq reset state with q->lock
    f01fb6138f8eb kcm: use WRITE_ONCE() when changing lower socket callbacks
    4d48c08a0bf6c net: airoha: Fix debugfs new-tuple display for IPv4 ROUTE entries
    dcac6e4221f39 net: airoha: Fix register index for Tx-fwd counter configuration
    36edab340a067 net: bcmgenet: Use weighted round-robin TX DMA arbitration
    b91b241a4eefe landlock: Fix unmarked concurrent access to socket family
    1bb02353e79f7 dpll: balance create/delete notifications in __dpll_pin_(un)register
    77a1ea975c877 dpll: guard sync-pair removal on full pin unregister
    8008ef973f012 dpll: emit per-dpll delete notifications in dpll_pin_on_pin_unregister()
    6564ce3a2f9c2 dpll: send delete notification before unregister in on-pin rollback
    f1e1c6eb82482 dpll: fix stale iteration in dpll_pin_on_pin_unregister()
    20575400fc1ba dpll: Enhance and consolidate reference counting logic
    ebe4bd3560a7a dpll: Support dynamic pin index allocation
    f7aebaee2961b net: wwan: t7xx: check skb_clone in control TX
    34bd255dba321 net: ethernet: mtk_wed: debugfs: correct index in wed_amsdu_show()
    1d072cc3ba433 octeontx2-af: npc: Fix size of entry2cntr_map
    417bd36a085d7 bpf: Fix setting retval to -EPERM for cgroup hooks not returning errno
    3d90b15fb1918 net/mlx5: Check max_macs devlink param value against max capability
    8d5f4be134882 bpf: Run generic devmap egress prog on private skb
    450e48271827b net/sched: sch_dualpi2: Add missing module alias
    6d585d0dc6743 net: ethernet: mtk_wed: fix loading WO firmware for MT7986
    446fe8ce699ce net: watchdog: fix refcount tracking races
    697db22a9dcc4 net: mana: guard TX wq object destroy with INVALID_MANA_HANDLE check
    62ce489acb428 net: mana: initialize gdma queue id to INVALID_QUEUE_ID
    bd851b10daee7 net/sched: sch_dualpi2: Do not call qdisc_tree_reduce_backlog during peek before restoring qlen
    755108bb7a508 net/sched: sch_codel: Do not call qdisc_tree_reduce_backlog during peek before restoring qlen
    0500af8630c32 net/sched: sch_fq_codel: Do not call qdisc_tree_reduce_backlog during peek before restoring qlen
    a05d638b60746 virtio_net: do not allow tunnel csum offload for non GSO packets
    ce311bd2e3659 tcp: clear sock_ops cb flags before force-closing a child socket
    67cec2f1eb9e5 handshake: Require admin permission for DONE command
    d0503357653ee power: supply: core: fix supplied_from allocations
    7f4aa81f5bb27 ASoC: adau1372: Clear PLL_EN on failed PLL lock without reset GPIO
    0c22c00924359 iommu: Avoid copying the user array twice in the full-array copy helper
    1c9246a199e19 spi: xilinx: use FIFO occupancy register to determine buffer size
    dae23c545eb5a ALSA: seq: Fix kernel heap address leak in bounce_error_event()
    1749fef4bda0f ALSA: usb-audio: qcom: Guard sideband endpoint removal
    2ba2373151936 crypto: rng - Free default RNG on module exit
    fb4d57b83356d crypto: cavium/cpt - fix DMA cleanup using wrong loop index
    5f99a396f706a crypto: marvell/octeontx - fix DMA cleanup using wrong loop index
    4941205f5fa39 cxl/test: Add check after kzalloc() memory in alloc_mock_res()
    a27481516d32f cxl/test: Unregister cxl_acpi in cxl_test_init() error path
    7e401233f9bb7 tipc: reject inverted service ranges from peer bindings
    3cfa3d8e0dc16 tipc: prevent snt_unacked underflow on CONN_ACK
    cebaefe1aceb6 tipc: require net admin for TIPCv2 netlink mutators
    66dbb13eeb2fc net/sched: sch_hfsc: Don't make class passive twice
    51a1d9836acc7 net: pfcp: allocate per-cpu tstats for PFCP netdevs
    ed8605c6f39b9 sctp: validate embedded address parameter length
    a090880c1f544 bridge: cfm: reject invalid CCM interval at configuration time
    bb4a5b3c91af3 net: fib_rules: Don't dump dying fib_rule in fib_rules_dump().
    0a8b5b74f0e6b net/sched: cls_flow: Dont expose folded kernel pointers
    10e05634ddc19 net: dsa: qca8k: fix led devicename when using external mdio bus
    e098c9c6477df ASoC: tegra: tegra210_ahub: Validate written enum value
    0f1510e84d7bf ASoC: fsl: fsl_audmix: Validate written enum values
    9131e4b023e0d ASoC: codecs: hdac_hdmi: Validate written enum value
    cb527e063a32e ASoC: SOF: Intel: hda-sdw-bpt: select SND_SOF_SOF_HDA_SDW_BPT properly
    d3ff718c0c715 RDMA/mlx5: Release the HW‑provided UAR index rather than the SW one
    4b87a2497276a RDMA/mlx5: Fix undefined shift of user RQ WQE size
    1bc1487f7a7f5 RDMA/mlx5: Remove raw RSS QP restrack tracking
    f704db4b0318a RDMA/mlx5: Remove DCT restrack tracking
    3a1687e0506be fs: efs: remove unneeded debug prints
    7e694ac97591c Bluetooth: vhci: validate devcoredump state before side effects
    ec4d352747a62 Bluetooth: hci: validate codec capability element length
    7f206a8d8d822 Bluetooth: btmtk: fix URB leak in alloc_mtk_intr_urb error path
    a0fd1086a57b9 Bluetooth: hci_core: Fix UAF in hci_unregister_dev()
    e8815ae9dcdc5 Bluetooth: hci_event: fix simultaneous discovery stuck in FINDING
    f1b4df9c260c5 Bluetooth: eir: Fix stack OOB write when prepending the Flags AD
    e284bb94ad451 Bluetooth: hci_qca: fix NULL pointer dereference in qca_dmp_hdr() for non-serdev device
    c86c861c64b58 s390/process: Fix kernel thread function pointer type
    0eab19ab9cb1b ASoC: cs35l56: Fix possible uninitialized value in cs35l56_spi_system_reset()
    c83255f3cf22d arm64: dts: allwinner: a523: Add missing GPIO interrupt
    ad6963c3bb458 pinctrl: airoha: an7581: fix misprint in gpio19 pinconf
    5985ddfd3e83f pinctrl: airoha: an7581: add missed gpio32 pin group
    db3cd694ded4c pinctrl: airoha: generalize pins/group/function/confs handling
    0234e8fc296e7 pinctrl: sunxi: a523: Remove unneeded IRQ remuxing flag
    46fbafe3d2d56 bpf: Tighten cgroup storage cookie checks for prog arrays
    d416dcefdbac9 vfio/qat: fix f_pos race in qat_vf_resume_write()
    1201dbb260507 of: cpu: add check in __of_find_n_match_cpu_property()
    d2acea4f47475 cxl/test: Zero out LSA backing memory to avoid leaking to user
    42a9a76f314ef cxl/test: Fix integer overflow in mock LSA bounds checks
    91ad3088ee1b7 selftests/bpf: Fix bpf_iter/task_vma test
    f00f5c0dd5531 ext4: fix kernel BUG in ext4_write_inline_data_end
    c998a09c7144e bonding: 3ad: fix mux port state on oper down
    f0ada4846d11b bonding: 3ad: fix carrier when no usable slaves
    cb20a9b50efe0 bonding: 3ad: add lacp_strict configuration knob
    47636f0a70b36 netlink: specs: rt-link: missed broadcast-neigh
    6b2c271d2c394 tools: missed broadcast_neigh if_link uapi header
    484b3b9aa7986 ext4: fix ERR_PTR(0) in ext4_mkdir()
    88cb304c0be0c ASoC: cs35l56: Don't leave parent IRQ disabled if system_suspend fails
    8b55e7ec116ca ASoC: cs35l56: Fix missing calls to wm_adsp2_remove()
    3ef0cfa77a3d5 vdpa/octeon_ep: fix IRQ-to-ring mapping in interrupt handler
    54556d5394382 vdpa/octeon_ep: Fix PF->VF mailbox data address calculation
    86e0b37738dea tools/virtio: check mmap return value in vringh_test
    321c73baf54d9 vhost/net: complete zerocopy ubufs only once
    646614dcb1607 vduse: Requeue failed read to send_list head
    f9d9220234451 virtio_console: read size from config space during device init
    79366023aa891 virtio: rtc: tear down old virtqueues before restore
    1f5f94c6c6b2e vhost/vdpa: validate virtqueue index in mmap and fault paths
    a2d0a57538fd0 vduse: hold vduse_lock across IDR lookup in open path
    3d56f3fb201ff ASoC: codecs: aw88261: fix incorrect masks for boost regs
    ecb9be4fc8be0 spi: meson-spifc: fix runtime PM leak on remove
    da6f86ff4f2dd NFSD: Handle layout stid in nfsd4_drop_revoked_stid()
    37e85be551c4d IB/mlx4: Fill in the access_flags if IB_MR_REREG_ACCESS is not specified
    e6d83f877d5ab ASoC: sma1307: Fix uevent string leaks in fault worker
    701ea71c17c92 igc: skip RX timestamp header for frame preemption verification
    2aa37c8ef1092 btrfs: fix deadlock cloning inline extent when using flushoncommit
    f85410ebf20bb btrfs: annotate lockless read of defrag_bytes in should_nocow()
    18285888cb41a btrfs: zoned: always set max_active_zones for zoned devices
    943f5917c53ca Revert "btrfs: fix the file offset calculation inside btrfs_decompress_buf2page()"
    ba641829c11cb btrfs: zoned: don't account data relocation space-info in statfs free space
    bd5e90b0f5a09 hwmon: (it87) Clamp negative values to zero in set_fan()
    ebb579c5c0f0f vfs: add FS_USERNS_DELEGATABLE flag and set it for NFS
    de590cdf7efec fbdev: sm501fb: Fix buffer errors in OF binding code
    0678fed27def9 wifi: ath12k: enable IEEE80211_VHT_EXT_NSS_BW_CAPABLE when NSS ratio is reported
    47e5302722e09 gpio: mt7621: fix interrupt banks mapping on gpio chips
    90a9c909c5b75 ALSA: aloop: Drop superfluous break
    3b15d02be05e7 btrfs: fix invalid pointer dereference in __btrfs_run_delayed_refs()
    7ec839c7c0bc1 wifi: mt76: mt7996: fix potential tx_retries underflow
    ad12fdaaed16c wifi: mt76: mt7925: fix potential tx_retries underflow
    3b6e6fefa57f4 wifi: mt76: mt7921: fix potential tx_retries underflow
    6b8e35685c18c wifi: mt76: mt7915: fix potential tx_retries underflow
    6356a829a1edc wifi: mt76: fix argument to ieee80211_is_first_frag()
    42f34c478fcdf wifi: mt76: mt7996: limit work in set_bitrate_mask
    1a399103cacc9 wifi: mt76: mt7996: fix reading zeroed info->control.flags after mt76_tx_status_skb_add()
    dfb27e5dd9e4d wifi: mt76: mt7996: Fix possible NULL pointer dereference in mt7996_mac_write_txwi_80211()
    06e65d6cf8049 wifi: mt76: mt7996: Fix possible token leak in mt7996_tx_prepare_skb()
    c386e90a7ce8d wifi: mt76: mt7925: validate skb length in testmode query
    856fa6a21586f wifi: mt76: mt792x: skip MLD header rewrite for 802.3 encap TX
    a10e4959a73be wifi: mt76: mt7925: keep TX BA state in the primary WCID
    b8bf7c221b364 wifi: mt76: mt7925: fix stale pointer comparisons in change_vif_links
    bd3b91ff13006 wifi: mt76: mt7996: add missing max_remain_on_channel_duration
    c7a83899203ed wifi: mt76: use kfree_rcu for offchannel link in mt76_put_vif_phy_link
    3f0ea6d14fa44 wifi: mt76: mt7925: clean up DMA on probe failure
    ce9d5a021cfca ARM: configs: Drop duplicated CONFIG_EXT4_FS
    c788617705c3a sched/fair: Fix cpu_util runnable_avg arithmetic
    a2e8b5264f92e hwspinlock: qcom: avoid uninitialized struct members
    bbd664b7c77f6 vmalloc: fix NULL pointer dereference in is_vm_area_hugepages()
    648a3960e3664 pinctrl: mediatek: mt8167: Fix Schmitt trigger register offset of pins 34-39
    44cff0737127b pinctrl: mediatek: mt8516: Fix Schmitt trigger register offset of pins 34-39
    f775e7bda9a4f scsi: target: Remove tcm_loop target reset handling
    c2bd9fdb448d6 scsi: target: Fix hexadecimal CHAP_I handling
    0404baeb9e430 pinctrl: qcom: Fix resolving register base address from device node
    298821692d447 watchdog: unregister PM notifier on watchdog unregister
    637ef4961470e configfs: fix lockless traversals of ->s_children
    f25d6e4ec4c25 firmware_loader: Fix recursive lock in device_cache_fw_images()
    9e82497138abe ASoC: amd: acp-sdw-sof: Bound DAI link iteration
    1279bdab5fa1f ASoC: amd: acp-sdw-legacy: Bound DAI link iteration
    e8d89baf92170 spi: ep93xx: fix double-free of zeropage on DMA setup failure
    e123f0ab02d05 IB/mlx5: Don't mangle the mr->pd inside the rereg callback
    fd284b12810e4 IB/mlx5: Pull the pdn out of the depths of the umr machinery
    8119fe468b01f IB/mlx5: Remove unused mkc bits in mlx5r_umr_update_mr_page_shift()
    d4f84bfa089fe IB/mlx5: Properly support implicit ODP rereg_mr
    f5657d399b7ef IB/mlx5: Don't take the rereg_mr fallback without a new translation
    c213b71a2d416 btrfs: don't force DIO writes to be serialized
    920dcf1cb8dae thermal: testing: reject missing command arguments
    dde04550fd6ff cpufreq: Documentation: fix conservative governor freq_step description
    6cb635ad1006d ACPI: IPMI: Fix message kref handling on dead device
    b7474f4432dd9 bpf: Fix NULL pointer dereference in bpf_task_from_vpid()
    84932636d020b powerpc/8xx: implement get_direction() in cpm1
    8daa1a64711ed kunit:tool: Don't write to stdout when it should be disabled
    8b0510cc3a4a0 bpf: Fix NMI/tracepoint re-entry deadlock on lru locks
    74ac1ce1f4afd ALSA: seq: Clear variable event pointer on read
    c04e0cde2fa38 riscv: stacktrace: Remove bogus -0x4 offset in non-FP walk_stackframe
    834d4cc067fa6 riscv: cpu_ops: Change return value type of cpu_is_stopped() to bool
    4b2b6bc7f5ebe ALSA: seq: Fix partial userptr event expansion
    af8f0ea1f0a3a wifi: wcn36xx: fix OOB read from short trigger BA firmware response
    f03782f7f41f2 wifi: wcn36xx: fix OOB read from firmware count in PRINT_REG_INFO indication
    1b5d8a248c3af wifi: wcn36xx: fix heap overflow from oversized firmware HAL response
    495e7e832c670 bpf: Update transport_header when encapsulating UDP tunnel in lwt
    efe57b72196ae bpf: Check tail zero of bpf_prog_info
    58513d6d12410 bpf: Check tail zero of bpf_map_info
    2eb39de4962f8 bpf: Clear rb node linkage when freeing bpf_rb_root
    f6183983ce1ff RDMA/siw: Fix endpoint/socket association handling
    04255bda8d795 arm64: dts: imx8mp-kontron: Fix GPIO for display power switch
    e6ab22200e449 arm64: dts: tqma8mpql-mba8mpxl: configure sai clock in audio codec as well
    f3ef944c55991 arm64: dts: lx2162a-clearfog: use rev2 SoC dtsi
    b5087fc4ef1f8 arm64: dts: imx95: Correct PCIe outbound address space configuration
    ab4b5a07e1c1a arm64: dts: imx8mp-kontron: Reduce EERAM SPI clock frequency
    f9173e0fc026c RDMA/irdma: Initialize iwmr->access during MR registration
    54cab78df0375 RDMA/irdma: Fix OOB read during CQ MR registration
    844a1ae78e220 ALSA: hda: fix Kconfig dependency of HD Audio PCI
    47831b503ecb7 IB/cm: Fix av cm device leak on an error path in cm_init_av_by_path()
    fe5414d6b3995 RDMA/hfi1: Open-code rvt_set_ibdev_name()
    77b4bfc1ce32a netfilter: conntrack: call nf_ct_gre_keymap_destroy() if master helper is pptp
    d53eecbca16f0 netfilter: conntrack: revert ct extension genid infrastructure
    e6665d36b37b4 x86/cpu: Remove obsolete aperfmperf_get_khz() declaration
    dd0d22fdae4cb ALSA: usb-audio: qcom: Initialize offload control return value
    8ebc31b86dccd netfilter: synproxy: protect nf_ct_seqadj_init() with conntrack lock
    5c9c67cf7a3d1 netfilter: synproxy: fix unaligned memory access in timestamp adjustment
    b171119082bab netfilter: synproxy: adjust duplicate timestamp options
    4dbb71c046f72 netfilter: synproxy: drop packets if timestamp adjustment fails
    dce1e3cf735d1 netfilter: nfnetlink_cthelper: use {READ,WRITE}_ONCE for accessing helper flags
    7b819a84f1d5f netfilter: nfnetlink_osf: fix mss parsing on big-endian architectures
    c3ebf67cf8a96 ocfs2: fix race between ocfs2_control_install_private() and ocfs2_control_release()
    a087b2d3411e7 ocfs2/dlm: require a ref for locking_state debugfs open
    3fa7139b5f427 ocfs2: reject FITRIM ranges shorter than a cluster
    0e389fc290c35 ocfs2: fix buffer head management in ocfs2_read_blocks()
    3fe2d0d21c8ae lib: kunit_iov_iter: repeatedly call alloc_pages_bulk()
    bb44a7690a4d5 ocfs2: rebase copied fsdlm LVB pointers in locking_state
    9af58d10d0d8c of: reserved_mem: avoid post-init UAF when alloc_reserved_mem_array() fails
    9a030fcb4b192 drm/amdkfd: always resume_all after suspend_all
    b8d15e85596ad cxl/fwctl: Fix __fortify_panic
    b64120d54278e xfrm: fix NAT-related field inheritance in SA migration
    ac9e29b191a03 perf/x86/amd/uncore: Use Node ID to identify DF and UMC domains
    58cbb1c2aadf8 perf/x86/intel/uncore: Fix discovery unit lookup for multi-die systems
    4e18e9361aab0 perf/x86/amd/core: Always use the NMI latency mitigation
    f5102e0fc3c6d iommu/vt-d: Fix RB-tree corruption in probe error path
    7f229d27bf27c vhost: fix vhost_get_avail_idx for a non empty ring
    73f9f54d71749 bpftool: Use libbpf error code for flow dissector query
    4beed798daf4d drm/amdgpu: set sub_block_index for mca ras sub-blocks
    e82d515092a0c ext4: fix fast commit wait/wake bit mapping on 64-bit
    8cbd587e8cdb6 lockdep/selftests: Restore sched_rt_mutex state on PREEMPT_RT
    8d5ed4810e479 lockdep/selftests: Restore migrate_disable() state on PREEMPT_RT
    c3b073a209a9b configfs_lookup(): don't leave ->s_dentry dangling on failure
    778bb4939d457 riscv: dts: sophgo: sg2042: use hex for CPU unit address
    efe71fbced524 riscv: dts: sophgo: sg2044: use hex for CPU unit address
    5a1168ba0a95b lib/test_meminit: use && for bools
    3777588848520 tick/sched: Fix TOCTOU in nohz idle time fetch
    5cf2c85b12312 bpf: Reject exclusive maps for bpf_map_elem iterators
    0830287cc6cb7 driver core: Use system_percpu_wq instead of system_wq
    5e406928404d6 nvme: fix FDP fdpcidx bounds check
    36bdda0c86d51 sched: restore timer_slack_ns when resetting RT policy on fork
    ffa974b2f50ad ext2: fix ignored return value of generic_write_sync()
    8d763babb2a2f mm/fake-numa: fix under-allocation detection in uniform split
    61f1972972824 bpf: fix UAF by restoring RCU-delayed inode freeing in bpffs
    d81370c6c4f5f scsi: ufs: Fix wrong value printed in unexpected UPIU response case
    846052542cfa6 scsi: pm8001: Fix error code in non_fatal_log_show()
    0de14eae6de88 libbpf: Skip max_entries override on signed loaders
    abe383999640f libbpf: Skip initial_value override on signed loaders
    b6862b6a25c6a libbpf: Reject non-exclusive metadata maps in the signed loader
    3a0f73d27a8d3 bpf: Reject exclusive maps as inner maps in map-in-map
    91ca9eab008b9 scsi: Revert "scsi: Fix sas_user_scan() to handle wildcard and multi-channel scans"
    5c53406098b59 nvdimm/btt: Handle preemption in BTT lane acquisition
    d292b30e1b746 x86/cpu: Keep the PROCESSOR_SELECT menu together
    901802925ebed ARM: imx31: Fix IIM mapping leak in revision check
    617a5a67ce016 ata: libata: Fix ata_exec_internal()
    cfcea221db933 wifi: ath12k: fix NULL deref in change_sta_links for unready link
    eb9b89baf3087 wifi: ath12k: fix incorrect HT/VHT/HE/EHT MCS reporting in monitor mode
    adf0eb748d21d HID: wiimote: Fix table layout and whitespace errors
    2d642797dd1c1 ARM: imx3: Fix CCM node reference leak
    f0742d09eb6ba NFSD: Fix delegation reference leak in nfsd4_revoke_states
    9e565962d999e ASoC: rsnd: Fix RSND_SOC_MASK width to single nibble
    8ec64276ecd24 spi: atmel: fix DMA channel and bounce buffer leaks
    ab4d04bf8b2f3 ext4: fix LOGFLUSH shutdown ordering to allow ordered-mode data writeback
    803087a16a4ea libbpf: Skip endianness swap when loader generation failed
    f3389fbaff1a1 libbpf: Skip hash computation when loader generation failed
    a441c0794ac28 selftests/bpf: add verification for BPF_PROG_QUERY attr size boundaries
    a7131340d0f95 bpf: fix BPF_PROG_QUERY OOB write and cgroup backward compat
    5ac9e793ba258 raid1: fix nr_pending leak in REQ_ATOMIC bad-block error path
    b7313f23ea5a7 md/raid10: reset read_slot when reusing r10bio for discard
    e04e384274f83 rpmsg: use generic driver_override infrastructure
    0e2f0833556c8 Drivers: hv: vmbus: use generic driver_override infrastructure
    d2cf52ba2803b cdx: use generic driver_override infrastructure
    b41923dbf6769 amba: use generic driver_override infrastructure
    ff4e38a37ba53 media: qcom: venus: relax encoder frame/blur step size on v6
    bc7c166cc1012 media: qcom: venus: relax encoder frame/blur dimension steps on v4
    ffe754288750a media: qcom: venus: drop extra padding in NV12 raw size calculation
    f8f48c851a0d2 Revert "media: venus: hfi_platform: Correct supported codecs for sc7280"
    5420eebf3b3c1 RDMA/rxe: Copy WQE to local buffer in non-SRQ receive path
    02558c86b6b76 RDMA/rxe: Fix TOCTOU heap overflow in get_srq_wqe
    4779f435627b2 RDMA/umem: Add ib_umem_is_contiguous() stub for !CONFIG_INFINIBAND_USER_MEM
    bae436a78a058 arm64: dts: st: Fix SAI addresses on stm32mp251
    5da012c605fd5 EDAC/{skx_common,skx}: Fix UBSAN shift-out-of-bounds in skx_get_dimm_info
    9a84ced0243c7 EDAC/igen6: Fix call trace due to missing release()
    ed5c94cf4ee9e drm/msm/dp: Fix the ISR_* enum values
    bdaea74abcf0c drm/msm/dp: fix HPD state status bit shift value
    6d536a9107172 sched/deadline: Reject debugfs dl_server writes for offline CPUs
    4f3c17f14cf90 crypto: tegra - Return ENOMEM when input buffer allocation fails for ccm
    5eac10c521396 crypto: tegra - Fix dma_free_coherent size error
    5231093c08295 crypto: inside-secure/eip93 - Add check for devm_request_threaded_irq
    8572232ed74f5 crypto: hisilicon/qm - disable error report before flr
    ce7a2e26e144f ocfs2: kill osb->system_file_mutex lock
    3852478d34c7b ocfs2: don't BUG_ON an invalid journal dinode
    070f356ea4f41 rapidio/tsi721: prevent a bad dereference in tsi721_db_dpc()
    598ed7393a639 dax/kmem: account for partial discontiguous resource upon removal
    afdb92d9c374d arm64: tegra: Add #{address,size}-cells to Chromium-based /firmware
    e545fcba3660c ARM: tegra: Add #{address,size}-cells to Chromium-based /firmware
    c87339cc08aa0 libbpf: Fix UAF in strset__add_str()
    39e8be33387e3 bpftool: Fix typo in struct_ops map FD generation for light skeleton
    ed7ba8d048a4c libbpf: Harden parse_vma_segs() path parsing
    340936ebf5aec drm/nouveau/bios: specify correct display fuse register for Ampere and Ada
    2ab7c96d8c3fb drm/tegra: Fix iommu_map_sgtable() return value check
    79240eee5a400 gpu: host1x: Fix iommu_map_sgtable() return value check
    142b34f7e329c drm/tegra: dc: Fix device node reference leak in tegra_dc_has_output()
    8c0d3cf0d5108 gpu: host1x: Allow entries in BO caches to be freed
    6b617b6ccb6eb drm/tegra: gr2d/gr3d: Contain PM in the gr*d_probe/gr*d_remove
    40a2a91da02c4 drm/tegra: gr2d/gr3d: Initialize address register map before HOST1X client is registered
    05d85fd32e4fe rtla/actions: Restore continue flag in actions_perform()
    b7ac7ba19a0b8 rtla: Introduce for_each_action() helper
    dc266f6c4e262 iommu/amd: Fix premature break in init_iommu_one()
    10753da2d659d net/sched: cls_bpf: prevent unbounded recursion in offload rollback
    0db1949084e85 ipv6: guard against possible NULL deref in __in6_dev_stats_get()
    dc1470299d11d workqueue: drop spurious '*' from print_worker_info() fn declaration
    3e8aed5edaeeb nvme-pci: fix out-of-bounds access in nvme_setup_descriptor_pools
    140d6fff4ed26 nvme-multipath: fix flex array size in struct nvme_ns_head
    cba2ee57fd302 nvmet-tcp: check return value of nvmet_tcp_set_queue_sock
    ba3209704b3cd nvmet-tcp: fix page fragment cache leak in error path
    24639c4dc466e init/initramfs_test: wait_for_initramfs() before running
    eb9280ea8dbd2 pinctrl: cs42l43: Fix polarity on debounce
    2739d234d8952 pinctrl: cs42l43: Fix leaked pm reference on error path
    95e0b4bc29ab9 pinctrl: nuvoton: ma35d1: fix MFP register offset and pin table
    c418c956c21c9 selftests: Fix Makefile target for nsfs
    11165fe2c5ea0 ALSA: seq: midi: Serialize output teardown with event_input
    6dc781778b595 ALSA: seq: oss: Fix UAF at handling events with embedded SysEx data
    de236b813d8b4 ALSA: xen-front: Connect event channel after stream prepare
    56694f00fbe10 ALSA: xen-front: Reset event channel state on stream clear
    02f156309de0d mtd: spi-nor: Drop duplicate Kconfig dependency
    c4bb92b3ef54c mtd: spi-nor: debugfs: Fix the flags list
    3880ee7c88d78 driver core: Guard deferred probe timeout extension with delayed_work_pending()
    0a294feec21b6 driver core: Fix missing jiffies conversion in deferred_probe_extend_timeout()
    2c12b0dfcedad mips: n64: add __iomem for writel call
    8db227dd895a8 mips: ralink: mt7621: add missing __iomem
    0c83d13f9b3f1 MIPS: DEC: Remove do_IRQ() call indirection
    c9a3ceeddc6ad MIPS: Fix big-endian stack argument fetching in o32 wrapper
    c9670fd84df12 PM: sleep: Use complete() in device_pm_sleep_init()
    80f8e2302e639 pinctrl: meson: amlogic-a4: fix gpio output glitch
    9420871183eab RDMA/counter: Fix incorrect port index in rdma_counter_init() error cleanup
    66f44ec974ab3 RDMA/hns: Fix log flood after cmd_mbox failure
    16138ea9833d6 RDMA/hns: Fix warning in poll cq direct mode
    f67fbbfc3beb8 IB/mlx4: Fix refcount leak in add_port() error path
    e59a6aa89e0fc RDMA/rxe: Fix a use-after-free problem in rxe_mmap
    424d51d33c754 RDMA/irdma: Fix out-of-bounds write in irdma_copy_user_pgaddrs
    7a551951ebeb5 pinctrl: spacemit: fix NULL check in spacemit_pin_set_config
    394ed8ad05889 bus: sunxi-rsb: Always check register address validity
    090f5fb1e3e23 RDMA/mana_ib: Use ib_get_eth_speed for reporting port speed
    c11039512df49 pwm: imx27: Fix variable truncation in .apply()
    13db458099f28 cpufreq: conservative: Simplify frequency limit handling
    3fcbfc50dd52f cpufreq: Documentation: fix sampling_down_factor range
    376951c51cdd0 crypto: eip93 - fix reset ring register definition
    4a6f5cc42c7bf of: dynamic: Fix overlayed devices not probing because of fw_devlink
    ae62edb00c0eb Revert "treewide: Fix probing of devices in DT overlays"
    2df37ead6d84b driver core: Use mod_delayed_work to prevent lost deferred probe work
    62c8cc825f49e device property: fix fwnode reference leak in fwnode_graph_get_endpoint_by_id()
    b0444205ba39e kernfs: fix suspicious RCU usage in kernfs_put()
    29de8448174cf writeback: drop now-unnecessary rcu_barrier() in cgroup_writeback_umount()
    2469039f0fd68 arm64: dts: qcom: lemans: Add eDP ref clock for eDP PHYs
    baa333b2700a7 tracing: Bound synthetic-field strings with seq_buf
    09a2a7d041a78 arm64: dts: qcom: sm8750: Add power-domain and iface clk for ice node
    4ba44339fd3ac arm64: dts: qcom: sm8650: Add power-domain and iface clk for ice node
    3c808cac676c5 arm64: dts: qcom: sm8550: Add power-domain and iface clk for ice node
    0d0ce8c7025ac arm64: dts: qcom: sm8450: Add power-domain and iface clk for ice node
    a8be1bc8d124f arm64: dts: qcom: kodiak: Add power-domain and iface clk for ice node
    dc36463b283d9 arm64: dts: qcom: sc7180: Add power-domain and iface clk for ice node
    a2303478e7301 arm64: dts: qcom: monaco: Add power-domain and iface clk for ice node
    b3e05859cb516 arm64: dts: qcom: lemans: Add power-domain and iface clk for ice node
    11daac2817dca firmware: arm_scmi: Fix OOB in scmi_power_name_get()
    15e7368de5842 media: rockchip: rga: fix too small buffer size
    a88f6da618e8b net/sched: sch_drr: annotate data-races around cl->deficit
    276e731b1b577 nilfs2: Fix return in nilfs_mkdir
    16bf3154f8a80 tools/nolibc: getopt: Fix potential out of bounds access
    c67c672047667 regulator: dt-bindings: mt6359: Drop regulator-name pattern restrictions
    75c0bc011abdd bitops: use common function parameter names
    407aeb8c1aee8 sysfs: clamp show() return value in sysfs_kf_read()
    bac3e70c2fb10 firmware: arm_scmi: Read sensor config as 32-bit value
    1f60c3cc302d2 firmware: smccc: Fix Arm SMCCC SOC_ID name call
    3024229e4a5af riscv: dts: spacemit: set console baud rate on Milk-V Jupiter
    63aa7dda9a1ed staging: media: atomisp: fix loop shadowing in ia_css_stream_destroy()
    d57e67ea48e4d media: atomisp: gc2235: fix UAF and memory leak
    2e3e4cc0dd349 media: atomisp: Fix memory leak in atomisp_fixed_pattern_table()
    5d6f34dc4f056 arm64: dts: imx95-19x19-evk: Fix PCIe EP vpcie-supply
    084d7d5668f30 arm64: dts: imx8qxp-mek: Remove unnecessary PCIe EP vpcie-supply
    6a576739ce4c9 arm64: dts: imx8dxl-evk: Remove unnecessary PCIe EP properties
    0da72a88dbbab firmware: arm_ffa: Honor partition info descriptor size
    5e353d9497f95 selftests/mm: Fix resv_sz when parsing arm64 signal frame
    6a357ceb21100 iommu/arm-smmu-qcom: Fix fastrpc compatible string in ACTLR client match table
    bcfc49f1bcf1b selftests/bpf: Fix test for refinement of single-value tnum
    e4d599a286b5a selftests/bpf: Reject unsupported -k option in vmtest.sh
    7471006cd854d drm/syncobj: Fix memory leak in drm_syncobj_find_fence()
    be2c137f23d15 RDMA/hns: Initialize seqfile before creating file
    65572fbd86033 RDMA/srpt: fix integer overflow in immediate data length check
    5100febf8e9d6 RDMA/mlx5: Fix devx subscribe-event unwind NULL dereference
    ffa85a2c19793 RDMA/mlx5: Fix UMR XLT cleanup on ODP populate failure
    2cd221fca036b RDMA/hns: Fix arithmetic overflow in calc_hem_config()
    65e344925fa30 IB/mlx5: Fix transport-domain rollback and initialize lb mutex earlier
    b61af0268e3d1 ipv6: addrconf: bail out of dad_failure when state is no longer POSTDAD
    5c1196b5a3bf3 net/sched: sch_htb: annotate data-races (I)
    d8cae30582f06 net/sched: sch_htb: do not change sch->flags in htb_dump()
    68eae3592438d spi: hisi-kunpeng: Use dev_err_probe() for host registration failure
    21650fe221ea9 crypto: ccp - Treat zero-length cert chain as query for blob lengths
    cb414aff28e18 scsi: hisi_sas: Add slave_destroy interface for v3 hw
    8b42290df1765 net/sched: sch_hfsc: annotate data-races in hfsc_dump_class_stats()
    d29b9c38f6eb4 clk: scpi: Unregister child clock providers on remove
    69bc4a3998742 thermal: hwmon: Fix critical temperature attribute removal
    a0f64cf8bfcb3 evm: terminate and bound the evm_xattrs read buffer
    4c57df82af833 drm/hisilicon/hibmc: use clock to look up the PLL value
    28b91fd2adc4f drm/hisilicon/hibmc: move display contrl config to hibmc_probe()
    94ab8a6e02bae drm/hisilicon/hibmc: fix no showing when no connectors connected
    689bb48c828ca drm/hisilicon/hibmc: add updating link cap in DP detect()
    27af16a44f590 arm64: dts: qcom: sm8450: Fix ICE reg size
    886fb63981a92 arm64: dts: qcom: kodiak: Fix ICE reg size
    2e2e5888764ba clk: scmi: Fix clock rate rounding
    8200ffd8259f0 rust: alloc: fix `Vec::extend_with` SAFETY comment
    9fe7605c1c143 arm64: dts: mediatek: mt8192-asurada: Move PCIe DMA bounce buffer to host
    02367b12b303a uaccess: fix ignored_trailing logic in copy_struct_to_user()
    e003f3a4be738 bpf: fix crash in bpf_[set|remove]_dentry_xattr for negative dentries
    8960088511ca1 soc: mediatek: mtk-mmsys: Restore MT8167 routing masks lost during merge
    0dd1cf48a4217 iommu/amd: Fix a stale comment about which legacy mode is user visible
    feb10ab7abc24 media: venus: scale MMCX power domain on SM8250
    9e642727b97dd media: iris: scale MMCX power domain on SM8250
    e725aedd26e96 media: qcom: camss: vfe: fix PIX subdev naming on VFE lite
    f9f1a2cd912da nilfs2: fix backing_dev_info reference leak
    712714f818d83 dlm: fix add msg handle in send_queue ordered
    4695cfab48f90 ARM: multi_v7_defconfig: Correct QCOM_RPMH and QCOM_RPMHPD
    6acd2fbd00f9c crypto: asymmetric_keys - fix OOB read in pefile_digest_pe_contents
    9b21d5bd33a7f crypto: ecrdsa - fix unknown OID check in ecrdsa_param_curve
    aac63bbea8fd5 crypto: atmel-sha204a - fix blocking and non-blocking rng logic
    c5c79d92da0f9 crypto: ccp - Fix snp_filter_reserved_mem_regions() off-by-one
    25b0061adc1c1 crypto: ccp - Reverse the cleanup order in psp_dev_destroy()
    46696b0b21234 OPP: Fix race between OPP addition and lookup
    8fe4736532639 alarmtimer: Remove stale return description from alarm_handle_timer()
    224d7300b5691 drm: renesas: rz-du: mipi_dsi: Fix return path on error
    4a8cde6f7281e vxlan: Fix potential null-ptr-deref in vxlan_gro_prepare_receive().
    470984f1c2ed8 Revert "arm64: dts: imx8mp-kontron: Add support for reading SD_VSEL signal"
    5f7777f0da030 Revert "arm64: dts: imx8mm-kontron: Add support for reading SD_VSEL signal"
    b9c6ad49a942d arm64: dts: imx8x-colibri: Correct SODIMM PAD settings
    a5e026d5b9487 arm64: dts: rockchip: fix rk809 interrupt pin on rk3566-roc-pc
    6173c83d4d791 arm64: dts: rockchip: Add #{address,size}-cells to Chromium-based /firmware
    2b553fcec1cd8 ARM: dts: rockchip: Add #{address,size}-cells to Chromium-based /firmware
    d003d9bb44da1 drm/panel: Clean up S6E3HA2 config dependencies and fill help text
    76a4c3af3253d drm/gpuvm: take refcount on DRM device
    02b001d89157a dt-bindings: vendor-prefixes: Add Displaytech Ltd.
    a402b3d093815 pinctrl: sunxi: fix regulator leak in sunxi_pmx_request() error path
    c599af2eacd66 dts: spacemit: set console baud rate on bpif3
    796ff973077c7 lib/vsprintf: Fix to check field_width and precision
    53baa6b90f499 crypto: qat - fix heartbeat error injection
    928f758f8f214 memory: tegra: Wire up system sleep PM ops
    2b2a17af8d8c7 media: v4l2-common: Add YUV24 format info
    4534f70aa7042 media: cedrus: Fix failure to clean up hardware on probe failure
    facbb592e22dd watchdog: sprd_wdt: Remove redundant sprd_wdt_disable() on register failure
    1917015aa0a1d watchdog: sama5d4_wdt: Fix WDDIS detection on SAM9X60 and SAMA7G5
    d6e8d6b2f8f04 watchdog: sp5100_tco: Use EFCH MMIO for newer Hygon FCH
    29fd4f4c73e2b Documentation/rv: Replace stale website link
    19eb0ab0bdffb ARM: dts: am335x-sl50: Fix audio bitclock and frame master endpoint
    5435fd3edcb11 wifi: ath9k: fix OOB access from firmware tx status queue ID
    7c79be7e63447 pinctrl: mediatek: eint: Drop base from mtk_eint_chip_write_mask()
    a83e77d1e52c0 soc: xilinx: Shutdown and free rx mailbox channel
    fbeea02c3564d kconfig: fix potential NULL pointer dereference in conf_askvalue
    ad445de67359f wifi: rtw89: add bounds check on firmware mac_id in link lookup
    01155ded5d4da wifi: rtw88: fix OOB read from firmware RX descriptor exceeding DMA buffer
    7a1ab5fdcae89 wifi: rtw89: Correct data type for scan index to avoid infinite loop
    1ef3d1338d94e wifi: rtw88: fix wrong pci_get_drvdata type in AER handlers
    aefc30e4a829c wifi: rtw89: fix wrong pci_get_drvdata type in AER handlers
    cc77f0d91e321 driver core: use READ_ONCE() for dev->driver in dev_has_sync_state()
    543ed0f61d565 drm/amdkfd: Validate CRIU-restored IDs before idr_alloc
    1638e178e4915 dt-bindings: pinctrl: nvidia,tegra234: Add missing required block
    cc6ef5ee7d88a arm64: tegra: Fix Tegra234 MGBE PTP clock
    228db770fb086 wifi: cfg80211: fix grammar in MLO group key error message
    123e1cd95ba54 arm64: dts: qcom: sdm845-mezzanine: Fix camss ports unit_address_vs_reg warning
    d8367ee271aba arm64: dts: qcom: sc8180x: Fix phy simple_bus_reg warning
    d72ae2c63b683 arm64: dts: qcom: ipq5424: Fix USB simple_bus_reg warnings
    8f8233d544aca arm64: dts: rockchip: Fix gmac0 reset pin for NanoPi R5S
    58d0b4c55cdfd arm64: dts: rockchip: fix Ethernet PHY not found on PX30 Cobra
    6005cdd9f48fd Documentation: proc: fix section numbering in table of contents
    d10227f899c90 selftests/bpf: Use local type for bpf_fou_encap in test_tunnel_kern
    595710e6838c3 selftests/bpf: Use local type for flow_offload_tuple_rhash in xdp_flowtable
    2dfe817167af0 drm/amd/pm: remove trailing semicolon from AMDGPU_PM_POLICY_ATTR macro
    afea00ffcf41c dt-bindings: timer: Remove sifive,fine-ctr-bits property
    bc4737e55ec41 selftests/bpf: Fix off-by-one in bpf_cpumask_populate related selftest
    392c03362c278 libbpf: Report error when a negative kprobe offset is specified
    06dc892561f5a drm/radeon: fix memory leak in radeon_ring_restore() on lock failure
    d9dfa176899d4 drm/radeon: fix integer overflow in radeon_align_pitch()
    daf5d03ddb8cc drm/amdgpu: fix integer overflow in amdgpu_gem_align_pitch()
    41a60487b5b04 drm/gpuvm: Do not prepare NULL objects
    353f26c74660b drm/gpusvm: Reject VMAs with VM_IO or VM_PFNMAP when creating SVM ranges
    626fa93d194db drm/tidss: Drop extra drm_mode_config_reset() call
    ab487bb0402af drm/rockchip: Test for imported buffers with drm_gem_is_imported()
    b3ec263a719e0 drm/rockchip: dw_dp: Fix null-ptr-deref in dw_dp_remove()
    0d60b835bca42 drm/rockchip: dw_dp: Switch to drmm_kzalloc()
    68dc52f308a17 accel/amdxdna: Fix leak when pinning ubuf pages
    8e644d9a8c8dc clocksource/drivers/sun5i: Handle error returns from devm_reset_control_get_optional_exclusive()
    d50d320e88b4c openrisc: mm: Fix section mismatch between map_page and __set_fixmap
    24186d6f9b07e fbcon: Use correct type for vc_resize() return value
    6617df8c24631 fbcon: fix NULL pointer dereference for a console without vc_data
    231414253b648 afs: Fix uncancelled rxrpc OOB message handler
    8b4d1854295b0 afs: Fix further netns teardown to cancel the preallocation charger
    cc848a080f7a6 afs: handle CB.InitCallBackState3 requests without a server record
    23b3d457d8387 afs: fix NULL pointer dereference in afs_get_tree()
    b83ecf80e28af afs: Fix netns teardown to cancel the preallocation charger
    8cd8cf3052fff rxrpc: Fix double unlock in rxrpc_recvmsg()
    a89a13aea38ae rxrpc: Fix leak of connection from OOB challenge
    f9be514984471 rxrpc: Fix the reception of a reply packet before data transmission
    8db6a2c95e369 rxrpc: Fix ACKALL packet handling
    647e8e69c6ea3 rxrpc: Fix oob challenge leak in cleanup after notification failure
    7940e5c535489 rxrpc: Fix rxrpc_rotate_tx_rotate() to check there's something to rotate
    0fc5b37faec26 rxrpc: Fix potential infinite loop in rxrpc_recvmsg()
    2b69b61057eb0 rxrpc: Fix leak of released call in recvmsg(MSG_PEEK)
    0d643a46fdea6 rxrpc: Fix socket notification race
    844b8525ce503 rxrpc: Fix UAF in rxgk_issue_challenge()
    9ada3931beb37 rxrpc: Don't move a peeked OOB message onto the pending queue
    d3b642cf95d48 rxrpc: rxrpc_verify_data ensure rx_dec_buffer alloc
    35a967ff8b24d rxrpc: serialize kernel accept preallocation with socket teardown
    2ecd118fb6913 serial: 8250_omap: clear rx_running on zero-length DMA completes
    c37095c431c39 serial: max310x: implement gpio_chip::get_direction()
    d354716245192 serial: msm: Disable DMA for kernel console UART
    03fd857c33456 dt-bindings: power: imx93: Add MIPI PHY power domain
    d97a6b4a5a4fb dt-bindings: media: sun4i-a10-video-engine: Add interconnect properties
    79982331c1738 media: uvcvideo: Fix sequence number when no EOF
    19cb644d0ca59 media: uvcvideo: Relax the constrains for interpolating the hw clock
    bf58be93c51ba media: uvcvideo: Do not add clock samples with small sof delta
    aed8111f2392d media: uvcvideo: Fix dev_sof filtering in hw timestamp
    0f64f808fb4ee media: uvcvideo: Fix buffer sequence in frame gaps
    1a9baac645769 media: uvcvideo: Avoid partial metadata buffers
    caf800e0cab94 media: uvcvideo: Use hw timestaming if the clock buffer is full
    6b2c0cd5f9689 ALSA: hda/realtek: Fix speakers on Legion Pro 7 16ARX8H with codec SSID 17aa:38a7
    2f33044aedd7a ALSA: hda: Fix cached processing coefficient verbs
    ae7f5b05d225c ALSA: hda: conexant: Remove mic bias threshold override
    12e43f99242b0 ALSA: hda/realtek: Add quirk for TongFang X6xx45xU
    e0a71cbf0c190 af_unix: Drop all SCM attributes for SOCKMAP.
    9b6c12e1a6be0 iommu/amd: Use maximum PPR log buffer size when SNP is enabled on Family 0x19
    a4fb0954f3dc2 iommu/amd: Use maximum Event log buffer size when SNP is enabled on Family 0x19
    62dde71ca2c8c exfat: preserve benign secondary entries during rename and move
    f3a0dd2d88e83 selftests/bpf: Add tests for stale delta leaking through id reassignment
    985b8a0e52c58 selftests/bpf: Add tests for delta tracking when src_reg == dst_reg
    d75376fbc8563 bpf: Clear delta when clearing reg id for non-{add,sub} ops
    19836e8145de9 selftests/bpf: Add a test cases for sync_linked_regs regarding zext propagation
    07259d661c9d4 selftests/bpf: Add tests for improved linked register tracking
    564e4ce9fb401 selftests: bpf: Add test for multiple syncs from linked register
    3659deaf7bf69 media: uvcvideo: Fix deadlock if uvc_status_stop is called from async_ctrl.work
    c401492e01c7b crypto: sun4i-ss - Remove insecure and unused rng_alg
    088ee46c18d99 nvmet-tcp: Fix potential UAF when ddgst mismatch
    2ed3c9d955e8c nvmet-tcp: check INIT_FAILED before nvmet_req_uninit in digest error path
    588718101e844 iommu/vt-d: Clear Present bit before tearing down scalable-mode context entry
    c646431865f4b KVM: arm64: Bound used_lrs when flushing the pKVM hyp vCPU
    d7860b682da55 crypto: algif_skcipher - force synchronous processing
    de5a46f3b2c8d tcp: Add preempt_{disable,enable}_nested() in reqsk_queue_hash_req().
    e0caf7c3d49c7 smb/server: do not require delete access for non-replacing links
    bbf04810b2a06 nvme-pci: DMA unmap the correct regions in nvme_free_sgls
    40e44eff5116d perf trace: Deal with compiler const checks
    30bbd7e8999d1 perf trace: Don't change const char strings
    bc29e0699b35d perf diff: Constify strchr() return variables
    292f32503eda3 perf list: Don't write to const memory
    d03adc7039c39 perf list: Signal changing const memory is ok
    4283a813d7089 perf tp_pmu: Address const-correctness errors in recent glibcs
    018533cfe83cf perf units: Constify variables storing the result of strchr() on const tables
    e7d3f92238a3d perf hwmon_pmu: Constify the variables returning bsearch() on const tables
    5bcff7ce5c3b1 perf tools: Use const for variables receiving str{str,r?chr}() returns
    ee8ab4e8e7029 perf metricgroup: Constify variables storing the result of strchr() on const tables
    8bac35a8fd98f perf trace-event: Constify variables storing the result of strchr() on const tables
    a816153dd8575 perf demangle-java: Constify variables storing the result of strchr() on const tables
    f8cb25b1d5ed2 perf session: Don't write to memory pointed to a const pointer
    5f6d997641de9 perf bpf-event: Constify variables storing the result of strchr() on const tables
    3b540ba9606bf perf tools: Switch printf("...%s", strerror(errno)) to printf("...%m")
    659a56ba86a96 perf list: Remove unused 'sep' variable
    33250aa5cfade perf jitdump: Constify variables storing the result of strchr() on const tables
    972c65697792c perf time-utils: Constify variables storing the result of strchr() on const tables
    9ae21594ee518 perf strlist: Remove dont_dupstr logic, used only once
    110ce8fed0f8e perf strlist: Don't write to const memory

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 197a98e6e4883e47335df4d8a742980ab0a2a6a4)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/linux-yocto-rt_6.18.bb              |  6 ++---
 .../linux/linux-yocto-tiny_6.18.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index 9d44c803eb9..37570538857 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -15,13 +15,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "56572c42354027a50e261f16fe13b057604873e7"
-SRCREV_meta ?= "2f71b0a288c307062fc60948ac793d8d51c685e2"
+SRCREV_machine ?= "fa4de2c8b38ef83fd991db3b507630001104cac5"
+SRCREV_meta ?= "24949c3ef490d79a73a821f688efdc2f562fc851"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.18.39"
+LINUX_VERSION ?= "6.18.41"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index 7ff47505aa0..5addcaae07e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.18.inc
 
-LINUX_VERSION ?= "6.18.39"
+LINUX_VERSION ?= "6.18.41"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "9eb7db1359675f27707b030ba228f381c10cd53e"
-SRCREV_meta ?= "2f71b0a288c307062fc60948ac793d8d51c685e2"
+SRCREV_machine ?= "06f4fd92efb65a6108294f43855ca32fe22cb96f"
+SRCREV_meta ?= "24949c3ef490d79a73a821f688efdc2f562fc851"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 6111ae89daa..3ceba003fa4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "78e0248ce3cecd33f63926cd1d54c64e163d076c"
-SRCREV_machine:qemuarm64 ?= "9eb7db1359675f27707b030ba228f381c10cd53e"
-SRCREV_machine:qemuloongarch64 ?= "9eb7db1359675f27707b030ba228f381c10cd53e"
+SRCREV_machine:qemuarm ?= "fbf752dfa74a5be78586014f82002bca11063fa8"
+SRCREV_machine:qemuarm64 ?= "06f4fd92efb65a6108294f43855ca32fe22cb96f"
+SRCREV_machine:qemuloongarch64 ?= "06f4fd92efb65a6108294f43855ca32fe22cb96f"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "9eb7db1359675f27707b030ba228f381c10cd53e"
-SRCREV_machine:qemuriscv64 ?= "9eb7db1359675f27707b030ba228f381c10cd53e"
-SRCREV_machine:qemuriscv32 ?= "9eb7db1359675f27707b030ba228f381c10cd53e"
-SRCREV_machine:qemux86 ?= "9eb7db1359675f27707b030ba228f381c10cd53e"
-SRCREV_machine:qemux86-64 ?= "9eb7db1359675f27707b030ba228f381c10cd53e"
+SRCREV_machine:qemuppc ?= "06f4fd92efb65a6108294f43855ca32fe22cb96f"
+SRCREV_machine:qemuriscv64 ?= "06f4fd92efb65a6108294f43855ca32fe22cb96f"
+SRCREV_machine:qemuriscv32 ?= "06f4fd92efb65a6108294f43855ca32fe22cb96f"
+SRCREV_machine:qemux86 ?= "06f4fd92efb65a6108294f43855ca32fe22cb96f"
+SRCREV_machine:qemux86-64 ?= "06f4fd92efb65a6108294f43855ca32fe22cb96f"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "9eb7db1359675f27707b030ba228f381c10cd53e"
-SRCREV_meta ?= "2f71b0a288c307062fc60948ac793d8d51c685e2"
+SRCREV_machine ?= "06f4fd92efb65a6108294f43855ca32fe22cb96f"
+SRCREV_meta ?= "24949c3ef490d79a73a821f688efdc2f562fc851"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "f89c296854b755a66657065c35b05406fc18264d"
+SRCREV_machine:class-devupstream ?= "2fe596715f840d053aed5cee5455f701bdcd2b50"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.18/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.18.39"
+LINUX_VERSION ?= "6.18.41"
 
 PV = "${LINUX_VERSION}+git"
 

