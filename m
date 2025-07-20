Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D97C83F3E
	for <webhook@archiver.kernel.org>; Sun, 20 Jul 2025 20:05:27 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.24670.1753041921051732052
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jul 2025 13:05:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2RV6tOPo;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-311ef4fb43dso3017645a91.3
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 13:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753041920; x=1753646720; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nWpsOmtIg9CFC9NC6PZaS3tPPD6fUoPgEh7kfrQDxII=;
        b=2RV6tOPo+xaumFZjIbw7Md+PELWAeVmiGsnkwS7r/7ISHkur6DP8fj8n25LK0ieAVa
         0401Kmtvfmo+4U+vNHdhmPV9F1ZvcgRyQ1BHHgwukMqJlT7uKN9XENohUoeD/qFkWLaA
         zLRQbCmzMmTPx+YWzKiSVF+90kH+aPKP6N1htrbrpag8+rxueRHrhOYnot7NtB/dm2Mo
         m+Q++EW/SvDBZTtzY5sA+QrKfThzkOfsp5kcKW6aAjMGPNju2RIIAlpy8kggxe2Vfo0d
         mt7+sxAItZvUi8IrWNk+T7e8twa7W78j6Fj+miUNPcPcMk9fknIjmuVWf5rmkXO52iBj
         Db4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753041920; x=1753646720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nWpsOmtIg9CFC9NC6PZaS3tPPD6fUoPgEh7kfrQDxII=;
        b=JMjX4iRKhTdrc6vbQ0Ubt3xBeqg6zsXVBFsXMJ7n2rQjJqx6FazmI//uOjR/XJV0Sw
         UsxZ9SGKd63WcOgpK1ttjIsXrxiIDJMHv+79EtpzR71LCtvN5GxcY0605kzcQ6r/9ZHT
         25ixuLPnwGXoWXgKQmKRd7MS5Nf1bVmDrBw/pd75Zny43A4AQJ2DoY577/zylLR+vDAG
         KydBGjKMUmqRFWKxAFLYwXhhvsobR6B4Us8Hzff4PNqVQJGkDCmDOI5dEQjqbY8jKyLW
         JG5r0taQXedJ3dAl5SopA5w1/y5ZZZ6l3Xc+9pM4xp6+g+EMc3WegTtuMkKKkVtGaJ7p
         6C6Q==
X-Gm-Message-State: AOJu0YxJQqr6GyhM25w2raB8nIe2MWuMGSnDq4OrAyWw0Y36bZcjvqfo
	qx32dE7bodtpUcv9ed1MInJe9kCBNdNoM0fHPZNVPMfa3wfSblcdvKbsQLi3dthek4X1YuU36J5
	dVzk0qr8=
X-Gm-Gg: ASbGncu9FFBlp3xK69XU4smcRx2PvL52S5Q2+jNlwxpvvLDCdtHJeEbwD9j0GbOFq1/
	KG6+XInEC1fPDzAO6LGyLm+KzKfNRC6rBGPMyTIwZDdkixgBYKUC7BmtxXuhXIoCeBc/rB8oeDf
	qjf3J3v3vie+b4LMn7Jd/18kR5f10YYptdSHIg2cHqsjr1dyilUJip9JXpDVYVMXTLSRicqlLQO
	JanE0bE7sQWHkY2cZEcQwZ1fllApKbnCrW2v8Ckq168WZSVLX/FQjRQXRNPL8SzZOPcMXvGv0O+
	yeS00AxhGlVaJo2LxC/uz3mM/BNXDKM8LDQgiI0+W+JgRBJU5RFDyt0uPU0WehdDX3fjIaFUYK1
	iWthS1YloXE21rw==
X-Google-Smtp-Source: AGHT+IG26EY7CxCDNqBcVrplOXevSyc8Lg13m3pzAWZQGdrD6crJCGtJagDRdc9tVp+1IpomLThsog==
X-Received: by 2002:a17:90b:4a4a:b0:312:f650:c795 with SMTP id 98e67ed59e1d1-31c9f4a80b1mr22220676a91.21.1753041919687;
        Sun, 20 Jul 2025 13:05:19 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:31c9:438f:a923:8d3c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b60f096sm44894035ad.78.2025.07.20.13.05.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 13:05:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 11/12] linux-yocto/6.12: update to v6.12.38
Date: Sun, 20 Jul 2025 13:04:48 -0700
Message-ID: <b721acfced4e422dac693f63b46541f98a3ed7b2.1753041740.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753041740.git.steve@sakoman.com>
References: <cover.1753041740.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 20:05:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220636

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    259f4977409c Linux 6.12.38
    faac2abe895d x86/CPU/AMD: Properly check the TSA microcode
    fbad404f04d7 Linux 6.12.37
    0029b3c1320b x86/process: Move the buffer clearing before MONITOR
    331cfdd27429 x86/microcode/AMD: Add TSA microcode SHAs
    d5d66e31fd9a KVM: SVM: Advertise TSA CPUID bits to guests
    7a0395f6607a x86/bugs: Add a Transient Scheduler Attacks mitigation
    0720e436e594 x86/bugs: Rename MDS machinery to something more generic
    4c443046d8c9 mm: userfaultfd: fix race of userfaultfd_move and swap cache
    ead91de35d9c mm/vmalloc: fix data race in show_numa_info()
    679bf9a0ccb8 powerpc/kernel: Fix ppc_save_regs inclusion in build
    c782f98eef14 usb: typec: displayport: Fix potential deadlock
    f65ad436e4bc platform/x86: think-lmi: Fix sysfs group cleanup
    5805edbea588 platform/x86: think-lmi: Fix kobject cleanup
    b11397bf9ade platform/x86: think-lmi: Create ksets consecutively
    f5fe094f35a3 riscv: cpu_ops_sbi: Use static array for boot_data
    d8ca2036f30d powercap: intel_rapl: Do not change CLAMPING bit if ENABLE bit cannot be changed
    53892dc68693 iommu/rockchip: prevent iommus dead loop when two masters share one IOMMU
    5f28563f0c68 optee: ffa: fix sleep in atomic context
    ccdc472b4df6 Logitech C-270 even more broken
    4c37963d67fb i2c/designware: Fix an initialization issue
    c745744a8231 dma-buf: fix timeout handling in dma_resv_wait_timeout v2
    631f9de9a7f4 cifs: all initializations for tcon should happen in tcon_info_alloc
    7b02e09fc0ba smb: client: fix readdir returning wrong type with POSIX extensions
    7cb875016032 usb: acpi: fix device link removal
    c68a27bbebbd usb: chipidea: udc: disconnect/reconnect from host when do suspend/resume
    3b1407caac17 usb: dwc3: Abort suspend on soft disconnect failure
    27199ab79079 usb: cdnsp: Fix issue with CV Bad Descriptor test
    b68e355a6132 usb: cdnsp: do not disable slot for disabled slot
    46f758928156 Input: iqs7222 - explicitly define number of external channels
    dbdd2a232019 Input: xpad - support Acer NGR 200 Controller
    195597e0beb3 xhci: Disable stream for xHC controller with XHCI_BROKEN_STREAMS
    8bfd11dae3fb xhci: dbc: Flush queued requests before stopping dbc
    9f3b2e497deb xhci: dbctty: disable ECHO flag by default
    fbebc2254af8 usb: xhci: quirk for data loss in ISOC transfers
    9f7589318928 Revert "usb: xhci: Implement xhci_handshake_check_state() helper"
    8caccd2eac33 usb: xhci: Skip xhci_reset in xhci_resume if xhci is being removed
    1a81dfc9d10a NFSv4/flexfiles: Fix handling of NFS level errors in I/O
    5e110e867941 drm/xe: Allow dropping kunit dependency as built-in
    994b0bc2a0e8 drm/xe/bmg: Update Wa_22019338487
    beb89ada5715 IB/mlx5: Fix potential deadlock in MR deregistration
    f6588557023e RDMA/mlx5: Fix cache entry update on dereg error
    f94c422157f3 fs: export anon_inode_make_secure_inode() and fix secretmem LSM bypass
    cdd9862252a0 module: Provide EXPORT_SYMBOL_GPL_FOR_MODULES() helper
    e036efbe5822 add a string-to-qstr constructor
    42c5a4b47d4a rcu: Return early if callback is not specified
    c40b207cafd0 mtd: spinand: fix memory leak of ECC engine conf
    18ff4ed6a33a ACPICA: Refuse to evaluate a method if arguments are missing
    327997afbb5e wifi: ath6kl: remove WARN on bad firmware input
    1b1026563999 wifi: mac80211: drop invalid source address OCB frames
    3e554f115374 aoe: defer rexmit timer downdev work to workqueue
    7296c938df24 scsi: target: Fix NULL pointer dereference in core_scsi3_decode_spec_i_port()
    3d546c8b1070 regulator: fan53555: add enable_time support and soft-start times
    2ec1cc322a01 ASoC: amd: yc: update quirk data for HP Victus
    39e36a744ec3 powerpc: Fix struct termio related ioctl macros
    19bd7597858d genirq/irq_sim: Initialize work context pointers properly
    c584b9b62c0c platform/x86/amd/pmc: Add PCSpecialist Lafite Pro V 14M to 8042 quirks list
    f8155ee19ddc ASoC: amd: yc: Add quirk for MSI Bravo 17 D7VF internal mic
    c24c06bd14f2 ata: pata_cs5536: fix build on 32-bit UML
    3ce57d493dd8 ata: libata-acpi: Do not assume 40 wire cable if no devices are enabled
    f42b8e575395 ALSA: sb: Force to disable DMAs once when DMA mode is changed
    c5e0af68c899 ALSA: sb: Don't allow changing the DMA mode during operations
    3f6ce8433a90 drm/msm: Fix another leak in the submit error path
    0eaa495b3d57 drm/msm: Fix a fence leak in submit error path
    c0527f7534c0 scsi: lpfc: Restore clearing of NLP_UNREG_INP in ndlp->nlp_flag
    790ce73721ab sched_ext: Make scx_group_set_weight() always update tg->scx.weight
    7ccaa5fa5d25 drm/amdgpu/mes: add missing locking in helper functions
    238a218d422e arm64: dts: qcom: x1e80100-crd: mark l12b and l15b always-on
    646442758910 drm/amd/display: Add more checks for DSC / HUBP ONO guarantees
    81ebb8d755d9 drm/amdgpu: add kicker fws loading for gfx11/smu13/psp13
    710deaff6aeb drm/i915/dp_mst: Work around Thunderbolt sink disconnect after SINK_COUNT_ESI read
    b47a1f9323c2 drm/amdgpu: VCN v5_0_1 to prevent FW checking RB during DPG pause
    4f77d8f8a93e drm/simpledrm: Do not upcast in release helpers
    acf9ab15ec97 selinux: change security_compute_sid to return the ssid or tsid on match
    6d0b588614c4 drm/xe/guc: Explicitly exit CT safe mode on unwind
    ff6482fb4589 drm/xe/guc: Dead CT helper
    e595433c6399 drm/xe: Replace double space with single space after comma
    0dadcd17e212 drm/xe: move DPT l2 flush to a more sensible place
    1883a83695fe drm/xe: Allow bo mapping on multiple ggtts
    ce1ef3b64ef7 drm/xe: add interface to request physical alignment for buffer objects
    98e5c71e7e74 drm/xe: Move DSB l2 flush to a more sensible place
    e5f01b2b6771 drm/xe: Fix DSB buffer coherency
    61628111e74f mfd: exynos-lpass: Fix another error handling path in exynos_lpass_probe()
    e0fefe9bc07e netfs: Fix oops in write-retry from mis-resetting the subreq iterator
    c2a952fb41cc remoteproc: k3-r5: Refactor sequential core power up/down operations
    b14a64c1a97f remoteproc: k3-r5: Use devm_rproc_add() helper
    0ea3572c15ad remoteproc: k3-r5: Use devm_ioremap_wc() helper
    e392148f7fa0 remoteproc: k3-r5: Use devm_kcalloc() helper
    f802fb717dfd remoteproc: k3-r5: Add devm action to release reserved memory
    5eec92eb4fe7 remoteproc: k3: Call of_node_put(rmem_np) only once in three functions
    5b6eb04c0552 ubsan: integer-overflow: depend on BROKEN to keep this out of CI
    f3a472b91408 arm64: dts: qcom: sm8650: add the missing l2 cache node
    5a867d09f533 arm64: dts: renesas: white-hawk-single: Improve Ethernet TSN description
    7f0e93324122 arm64: dts: renesas: Factor out White Hawk Single board support
    b9baad894b27 arm64: dts: renesas: Use interrupts-extended for Ethernet PHYs
    d8b92a122aed arm64: dts: qcom: sm8650: Fix domain-idle-state for CPU2
    67b3bb57fa17 arm64: dts: qcom: sm8650: change labels to lower-case
    4265682c29c9 bpf: Do not include stack ptr register in precision backtracking bookkeeping
    c5474a7b04cc bpf: use common instruction history across all states
    be1e0287ac78 hisi_acc_vfio_pci: bugfix the problem of uninstalling driver
    bac4641756c2 hisi_acc_vfio_pci: bugfix cache write-back issue
    ea405fb41449 scsi: lpfc: Avoid potential ndlp use-after-free in dev_loss_tmo_callbk
    6857cbf0e4b3 scsi: lpfc: Change lpfc_nodelist nlp_flag member into a bitmask
    ae082dbcef5b scsi: lpfc: Remove NLP_RELEASE_RPI flag from nodelist structure
    8912b139a8d4 f2fs: zone: fix to calculate first_zoned_segno correctly
    ffbbe11577b7 f2fs: zone: introduce first_zoned_segno in f2fs_sb_info
    58330262213a f2fs: decrease spare area for pinned files for zoned devices
    81fdecac3f2c iommu: ipmmu-vmsa: avoid Wformat-security warning
    7d151bf9bd2b RDMA/rxe: Fix "trying to register non-static key in rxe_qp_do_cleanup" bug
    7e48e3ddf9e3 wifi: ath12k: fix wrong handling of CCMP256 and GCMP ciphers
    3fffbb8d33de wifi: ath12k: Handle error cases during extended skb allocation
    316060297e20 wifi: ath12k: fix skb_ext_desc leak in ath12k_dp_tx() error path
    b77a5ecb3d3b bonding: Mark active offloaded xfrm_states
    b24c3c5b421e ACPI: thermal: Execute _SCP before reading trip points
    0c44a4095803 ACPI: thermal: Fix stale comment regarding trip points
    da45b381aafa ASoC: tas2764: Reinit cache on part reset
    d1f8358c5d35 ASoC: tas2764: Extend driver to SN012776
    9468bcd92d64 gfs2: Don't start unnecessary transactions during log flush
    519aed5bdab7 gfs2: Move gfs2_trans_add_databufs
    a2562bdd35e9 sched/fair: Fixup wake_up_sync() vs DELAYED_DEQUEUE
    3edcabcfc253 sched/fair: Add new cfs_rq.h_nr_runnable
    0cc4721a7182 sched/fair: Rename h_nr_running into h_nr_queued
    2dc82f0d781b btrfs: fix wrong start offset for delalloc space release during mmap write
    5ff2ed0f0aca btrfs: prepare btrfs_page_mkwrite() for large folios
    cde7f9407884 gfs2: deallocate inodes in gfs2_create_inode
    8e753fc3d5fb gfs2: Move GIF_ALLOC_FAILED check out of gfs2_ea_dealloc
    24ae2de15bda gfs2: Move gfs2_dinode_dealloc
    4f66983aeb02 gfs2: Replace GIF_DEFER_DELETE with GLF_DEFER_DELETE
    7df46e6f8847 gfs2: Add GLF_PENDING_REPLY flag
    fbb2d296d4ad gfs2: Decode missing glock flags in tracepoints
    9649fec0f9c2 gfs2: Prevent inode creation race
    af2ce45c2824 gfs2: Rename dinode_demise to evict_behavior
    862ca0b49f1a gfs2: Rename GIF_{DEFERRED -> DEFER}_DELETE
    170af4314e4d gfs2: Initialize gl_no_formal_ino earlier
    33b65fcec79e kunit: qemu_configs: Disable faulting tests on 32-bit SPARC
    b70cda91569a kunit: qemu_configs: sparc: Explicitly enable CONFIG_SPARC32=y
    a55f301e607c kunit: qemu_configs: sparc: use Zilog console
    8a039506c032 crypto: zynqmp-sha - Add locking
    d78f79a2c1ff spinlock: extend guard with spinlock_bh variants
    9a0b8ef2a91b crypto: iaa - Do not clobber req->base.data
    e23ac0026624 crypto: iaa - Remove dst_null support
    3f4adfc58700 arm64: dts: rockchip: fix internal USB hub instability on RK3399 Puma
    2ba9db22d72a smb: client: fix race condition in negotiate timeout by using more precise timing
    4db893a9bf9e amd-xgbe: do not double read link status
    a553afd91f55 net/sched: Always pass notifications when child class becomes empty
    56aebaaa3adc nui: Fix dma_mapping_error() check
    446ac00b86be rose: fix dangling neighbour pointers in rose_rt_device_down()
    16858ab7fd61 enic: fix incorrect MTU comparison in enic_change_mtu()
    6074bff08ac2 amd-xgbe: align CL37 AN sequence as per databook
    f358d949cea2 lib: test_objagg: Set error message in check_expect_hints_stats()
    50c86c094533 netfs: Fix i_size updating
    9b55b7bdb0bb smb: client: set missing retry flag in cifs_writev_callback()
    590eb2574929 smb: client: set missing retry flag in cifs_readv_callback()
    cd8c8c20de3b smb: client: set missing retry flag in smb2_writev_callback()
    3eb39038dca3 igc: disable L1.2 PCI-E link substate to avoid performance issue
    9a36715cd6bc idpf: convert control queue mutex to a spinlock
    018ff57fd79c idpf: return 0 size for RSS key if not supported
    6a17e0d27fbe drm/i915/gsc: mei interrupt top half should be in irq disabled context
    5a7ae7bebdc4 drm/i915/gt: Fix timeline left held on VMA alloc error
    510a6095d754 net: usb: lan78xx: fix WARN in __netif_napi_del_locked on disconnect
    3f6932ef2537 smb: client: fix warning when reconnecting channel
    6a5348dbd745 drm/bridge: aux-hpd-bridge: fix assignment of the of_node
    800a6bde38f9 platform/mellanox: mlxreg-lc: Fix logic error in power state check
    206e2dca0ee5 platform/x86: dell-wmi-sysman: Fix class device unregistration
    8d6b2f704f6e platform/x86: dell-sysman: Directly use firmware_attributes_class
    48edcece52e0 platform/x86: think-lmi: Fix class device unregistration
    1cef9e9e0090 platform/x86: think-lmi: Directly use firmware_attributes_class
    b36faa83285f platform/x86: firmware_attributes_class: Simplify API
    b5c180ec1fbc platform/x86: firmware_attributes_class: Move include linux/device/class.h
    1958bccfa47a platform/x86: hp-bioscfg: Fix class device unregistration
    0386a68f959a platform/x86: hp-bioscfg: Directly use firmware_attributes_class
    5df3b870bc38 platform/x86: dell-wmi-sysman: Fix WMI data block retrieval in sysfs callbacks
    431e58d56fcb nvmet: fix memory leak of bio integrity
    f0fee863a7cb nvme: Fix incorrect cdw15 value in passthru error logging
    9d4064787d8d drm/i915/selftests: Change mock_request() to return error pointers
    3832ddc2fae8 spi: spi-fsl-dspi: Clear completion counter before initiating transfer
    0a38b1836894 drm/exynos: fimd: Guard display clock control with runtime PM calls
    dbd187e8c18c dpaa2-eth: fix xdp_rxq_info leak
    91a6b86d5845 ethernet: atl1: Add missing DMA mapping error checks and count errors
    735ac80fa913 btrfs: use btrfs_record_snapshot_destroy() during rmdir
    bfd5c9e83d89 btrfs: propagate last_unlink_trans earlier when doing a rmdir
    1728fef7ca37 btrfs: record new subvolume in parent dir earlier to avoid dir logging races
    d6d806004605 btrfs: fix inode lookup error handling during log replay
    401d098f92ea btrfs: fix invalid inode pointer dereferences during log replay
    0502d1127436 btrfs: return a btrfs_inode from read_one_inode()
    56e9882ba22f btrfs: return a btrfs_inode from btrfs_iget_logging()
    7ac790dc2ba0 btrfs: fix iteration of extrefs during log replay
    e4c3176acecf btrfs: fix missing error handling when searching for inode refs during log replay
    381c1c121979 Bluetooth: Prevent unintended pause by checking if advertising is active
    b611a5bf44e2 platform/mellanox: nvsw-sn2201: Fix bus number in adapter error message
    4bbdb8dd35b4 platform/mellanox: mlxbf-pmc: Fix duplicate event ID for CACHE_DATA1
    bd69049f981d RDMA/mlx5: Fix vport loopback for MPV device
    3d8d401d3333 RDMA/mlx5: Fix CC counters query for MPV
    a33a0c15b762 RDMA/mlx5: Fix HW counters query for non-representor devices
    e4ff9dedeb56 scsi: ufs: core: Fix spelling of a sysfs attribute name
    b1abc5ab47d6 scsi: sd: Fix VPD page 0xb7 length check
    218ae6bfe253 scsi: qla4xxx: Fix missing DMA mapping error in qla4xxx_alloc_pdu()
    350dae778b63 scsi: qla2xxx: Fix DMA mapping test in qla24xx_get_port_database()
    864a54c1243e NFSv4/pNFS: Fix a race to wake on NFS_LAYOUT_DRAIN
    3c94212b57be nfs: Clean up /proc/net/rpc/nfs when nfs_fs_proc_net_init() fails.
    93fccfa71c66 RDMA/mlx5: Initialize obj_event->obj_sub_list before xa_insert
    9d2ef890e499 RDMA/mlx5: Fix unsafe xarray access in implicit ODP handling
    f5fe78cfcba1 platform/mellanox: mlxbf-tmfifo: fix vring_desc.len assignment
    896e0d9337b5 arm64: dts: apple: t8103: Fix PCIe BCM4377 nodename
    31405510a48d firmware: arm_ffa: Replace mutex with rwlock to avoid sleep in atomic context
    2c07fd0eada8 firmware: arm_ffa: Move memory allocation outside the mutex locking
    076fa20b4f57 firmware: arm_ffa: Fix memory leak by freeing notifier callback node
    9ff95ed0371a drm/v3d: Disable interrupts before resetting the GPU
    ca40e57b22a0 mtk-sd: reset host->mrq on prepare_data() error
    3419bc6a7b65 mtk-sd: Prevent memory corruption from DMA map failure
    cfbdcabab2fb mtk-sd: Fix a pagefault in dma_unmap_sg() for not prepared data
    5581e694d3a1 usb: typec: altmodes/displayport: do not index invalid pin_assignments
    ea20568895c1 Input: cs40l50-vibra - fix potential NULL dereference in cs40l50_upload_owt()
    e4d19e5d71b2 regulator: gpio: Fix the out-of-bounds access to drvdata::gpiods
    dae12bc688b8 iommufd/selftest: Fix iommufd_dirty_tracking with large hugepage sizes
    a99f80c88a97 Bluetooth: MGMT: mesh_send: check instances prior disabling advertising
    44bb1e13b454 Bluetooth: MGMT: set_mesh: update LE scan interval and window
    3672fe9d1ed6 Bluetooth: hci_sync: revert some mesh modifications
    0698a2eb7d89 Bluetooth: HCI: Set extended advertising data synchronously
    50345c93698e mmc: core: sd: Apply BROKEN_SD_DISCARD quirk earlier
    ec9be081c577 Revert "mmc: sdhci: Disable SD card clock before changing parameters"
    cf7235914dc4 mmc: sdhci: Add a helper function for dump register in dynamic debug mode
    9546118ba789 net: libwx: fix the incorrect display of the queue number
    75705b44e0b9 vsock/vmci: Clear the vmci transport packet properly when initializing it
    e036b72d6a16 net: txgbe: request MISC IRQ in ndo_open
    a54280b0eb99 s390/pci: Do not try re-enabling load/store if device is disabled
    2640c230aac4 s390/pci: Fix stale function handles in error handling
    bc68bc356334 virtio-net: ensure the received length does not exceed allocated size
    892f6ed9a4a3 virtio-net: xsk: rx: fix the frame's length check
    bd6c1932ac9c rtc: cmos: use spin_lock_irqsave in cmos_interrupt
    ee61aec8529e rtc: pcf2127: fix SPI command byte for PCF2131
    669e6c723b32 rtc: pcf2127: add missing semicolon after statement

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8119f6a9983d3d6ba909a0c8ba916213db87270c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index baa13c866e..42ad0cbef0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6f409db4f0082642197240f39b8a58850c8eb884"
-SRCREV_meta ?= "f8cd1607519efd135e4037c84b6e42684b12c5a8"
+SRCREV_machine ?= "2aa940a9e5701e5b4107d0250da79a52e01da34a"
+SRCREV_meta ?= "5db57044962c6155c4e82f06d87e90dfe49a59e6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.36"
+LINUX_VERSION ?= "6.12.38"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index ec2136f035..452e3f0eb2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.36"
+LINUX_VERSION ?= "6.12.38"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "5633e9a98a153afa6b2051b116faef6c5e855bd8"
-SRCREV_meta ?= "f8cd1607519efd135e4037c84b6e42684b12c5a8"
+SRCREV_machine ?= "fa4b881d24f752a559d8e1f75ed08895ef20b14d"
+SRCREV_meta ?= "5db57044962c6155c4e82f06d87e90dfe49a59e6"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index cc564b13c5..de6f4851ec 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "511b6848cd392ee9bbc841794a5e905f4db31689"
-SRCREV_machine:qemuarm64 ?= "5633e9a98a153afa6b2051b116faef6c5e855bd8"
-SRCREV_machine:qemuloongarch64 ?= "5633e9a98a153afa6b2051b116faef6c5e855bd8"
-SRCREV_machine:qemumips ?= "afbfb2216d4f16a231b834922a937641864c8931"
-SRCREV_machine:qemuppc ?= "5633e9a98a153afa6b2051b116faef6c5e855bd8"
-SRCREV_machine:qemuriscv64 ?= "5633e9a98a153afa6b2051b116faef6c5e855bd8"
-SRCREV_machine:qemuriscv32 ?= "5633e9a98a153afa6b2051b116faef6c5e855bd8"
-SRCREV_machine:qemux86 ?= "5633e9a98a153afa6b2051b116faef6c5e855bd8"
-SRCREV_machine:qemux86-64 ?= "5633e9a98a153afa6b2051b116faef6c5e855bd8"
-SRCREV_machine:qemumips64 ?= "707ad7179119ed07e5911b61b08b7b11d2c9a352"
-SRCREV_machine ?= "5633e9a98a153afa6b2051b116faef6c5e855bd8"
-SRCREV_meta ?= "f8cd1607519efd135e4037c84b6e42684b12c5a8"
+SRCREV_machine:qemuarm ?= "c2755158bc029faf978e980235471b0f0e864814"
+SRCREV_machine:qemuarm64 ?= "fa4b881d24f752a559d8e1f75ed08895ef20b14d"
+SRCREV_machine:qemuloongarch64 ?= "fa4b881d24f752a559d8e1f75ed08895ef20b14d"
+SRCREV_machine:qemumips ?= "facf6694c9bdcaa9efb2d46a2c6e8e30fc72cdd3"
+SRCREV_machine:qemuppc ?= "fa4b881d24f752a559d8e1f75ed08895ef20b14d"
+SRCREV_machine:qemuriscv64 ?= "fa4b881d24f752a559d8e1f75ed08895ef20b14d"
+SRCREV_machine:qemuriscv32 ?= "fa4b881d24f752a559d8e1f75ed08895ef20b14d"
+SRCREV_machine:qemux86 ?= "fa4b881d24f752a559d8e1f75ed08895ef20b14d"
+SRCREV_machine:qemux86-64 ?= "fa4b881d24f752a559d8e1f75ed08895ef20b14d"
+SRCREV_machine:qemumips64 ?= "4ef2a68a188df7f561f5e297c4a3bab7e79e426f"
+SRCREV_machine ?= "fa4b881d24f752a559d8e1f75ed08895ef20b14d"
+SRCREV_meta ?= "5db57044962c6155c4e82f06d87e90dfe49a59e6"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "df64e51d4ab83244b6a4eb11eb41f89403611e24"
+SRCREV_machine:class-devupstream ?= "259f4977409c87a980fa2227b7c76a2fe3fb8c2f"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.36"
+LINUX_VERSION ?= "6.12.38"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


