Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52759CA0FE1
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 14:03:32 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web10.10286.1755785010973333824
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 07:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OOxz69Fi;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4b1258a3d71so10588661cf.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 07:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755785010; x=1756389810; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AP1x9Fm/VhnbaoNSvVF75hU4eE46C1/ILXDuxLAyRzo=;
        b=OOxz69FiZwcBqccJaRYuEM8KWsRYnViywDongnz94OEhWz26KUBBuvstrEdPgMqPmH
         P1rUOepI1iYthmuyH3ekbB0V/N/afBOQyCnDmPiCYZeWXQgMpXiW+QsX2o4oBHnonMkl
         N3Wsz+owxWvtJK3IYhgFxkIV8NNIgG0jmd6bfWWCrsfve96vc0GrVqpG7CPu1dVRdBrr
         QKQen0pqa64BYcLFlZSx88daQ2q6Ie6RRk4DZ3RIZ9DUlFu6f+W0aQAQnUUkrrdc1LPN
         ZTIYEslPdzFsIOBgYAPYbKgqsKTyprTS/GGjmpWdIkRG8+4S4bffGd9EWle6xPWIiceX
         M5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755785010; x=1756389810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AP1x9Fm/VhnbaoNSvVF75hU4eE46C1/ILXDuxLAyRzo=;
        b=QjbAiJ6xoCtS92mziqtwqIwsOWJKa4raQEAjxXniCEKs8LKJ55ICNYASV9aS+QFjEA
         bh2GvXZFfVOT/wtuD3yttxCMRUa0Pe/R2VsSdA60sQCklpLWa0w4UyudUsUIM/A7EKbm
         oC+SpNvd1ioTf3T1EHaK1FItGE6Ysd2v4uWPo6DimefdNnmfembxBqIHpN7iYyIDWYXS
         PNKYUihwum498wgbo+owJfTnK68JQKaUJIEHWeiwCqFkOloa5twIjLMTXhydvcPRDTk3
         l8V+i0SwWqmNUJvRvUE/pNcD3Sd5UI8Wf1HtVzmJFZAuOP4vB/xnRJI/aIl1z5SqHfyP
         IspA==
X-Gm-Message-State: AOJu0YyXxgosEiSwGYVRiSH4lRKHfi/5ie1XVgTLDtiMyVUQ93K4oxFt
	3THrxZ/dBX8OmZ/yFrRGdHr9evIHH4HnBmVZ65bZjenrORtn6HNf/6ZW8ui0f3+R
X-Gm-Gg: ASbGncuxx52HT6Iv/V54Cs+bkDFIoA4dHivnjhumgPppRKcMsd/8nDmwU7SYta8GWJ8
	MG1dR1KiKUs31X6f9s0w13kogxuNrpJ15jjUQJFg6RzhrOPXPYcUdhmBUKulSZOwCXsIFGy5vSI
	v5bRxyyaR3N1dE5LJjgUPj3tFge8XRxUgCnu77V/5Jgq0CA2ap9IIn0vIaNwQgEA9wRBvbl/Ejj
	gerJ3ubKVwYpjNTV4QhssKleUYKaa+6M7eWRuU459XpU68j5OP+HvMwVkcqq/Q8n115Ex2wzhDn
	0MD7q+IGLYeNLkQf6kggjR2lLQ9cIQXpVPuuTnZGM51rAKFQjMFHvvqmhBuBqjv7HgAG0OKGLqn
	VFbdSVBdGbpRzA6nFPh9ALZPI2XAeBiEg4W0pa29O6dEYlkHNc5DYkzS/tiGJlLcsA9xpA1G/uM
	DBJVPL9osKK+OoenGiuvdnW017vJRkd7+k5w==
X-Google-Smtp-Source: AGHT+IEFE8vK2QcX2CZv3V/DYKJXNQqGtDgaKsHwBlAfaB9gdEo5XlNirfU6k05dXOBdO0CI9PAQwQ==
X-Received: by 2002:a05:622a:2615:b0:4b0:77a3:2b12 with SMTP id d75a77b69052e-4b29fa5bf03mr23310641cf.28.1755785009109;
        Thu, 21 Aug 2025 07:03:29 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b11ddd693asm100447711cf.37.2025.08.21.07.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 07:03:28 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] linux-yocto/6.12: update to v6.12.42
Date: Thu, 21 Aug 2025 10:03:21 -0400
Message-Id: <4031d5e9c2f004ae35e5909b8c12f4a760bce7f1.1755784780.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1755784780.git.bruce.ashfield@gmail.com>
References: <cover.1755784780.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 14:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222242

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

no ids found, dumping:
    880e4ff5d6c8 Linux 6.12.42
    5f06ee9f9a36 usb: gadget : fix use-after-free in composite_dev_cleanup()
    0ab3ae768c48 USB: gadget: f_hid: Fix memory leak in hidg_bind error path
    ba08cc6801ec HID: apple: validate feature-report field count to prevent NULL pointer dereference
    68e5579f4de1 media: ti: j721e-csi2rx: fix list_del corruption
    efee62c5fc8c perf/arm-ni: Set initial IRQ affinity
    91b370800b3f mm: swap: fix potential buffer overflow in setup_clusters()
    f7c75406b7e6 mm: swap: correctly use maxpages in swapon syscall to avoid potential deadloop
    b85fe4c7403f mm/hmm: move pmd_to_hmm_pfn_flags() to the respective #ifdeffery
    1beca07bd954 MIPS: mm: tlb-r4k: Uniquify TLB entries on init
    082a639b1c67 s390/mm: Remove possible false-positive warning in pte_free_defer()
    296742ab73c2 x86/fpu: Delay instruction pointer fixup until after warning
    860d93bd6a21 platform/x86/intel/pmt: fix a crashlog NULL pointer access
    76563060ec75 ALSA: hda/realtek - Fix mute LED for HP Victus 16-d1xxx (MB 8A26)
    9fb7f010eb2e ALSA: hda/realtek - Fix mute LED for HP Victus 16-s0xxx
    0e1c67e9b8bb ALSA: hda/realtek - Fix mute LED for HP Victus 16-r1xxx
    e1c508818cba ALSA: scarlett2: Add retry on -EPROTO from scarlett2_usb_tx()
    0f158abad0ce ALSA: intel_hdmi: Fix off-by-one error in __hdmi_lpe_audio_probe()
    aed15fc08f15 x86/sev: Evict cache lines during SNP memory validation
    c884cab3bb60 net: usbnet: Fix the wrong netif_carrier_on() call
    d68a867d7401 net: usbnet: Avoid potential RCU stall on LINK_CHANGE event
    8c2b840c5443 Bluetooth: btusb: Add USB ID 3625:010b for TP-LINK Archer TX10UB Nano
    1331e908f2f4 PCI/ASPM: Fix L1SS saving
    78b3007eb08b PCI/ASPM: Save parent L1SS config in pci_save_aspm_l1ss_state()
    8d2026704a79 USB: serial: option: add Foxconn T99W709
    f54eef9be3cf smb: server: Fix extension string in ksmbd_extract_shortname()
    7e5d91d3e6c6 ksmbd: limit repeated connections from clients with the same IP
    68300f2738e0 ksmbd: fix corrupted mtime and ctime in smb2_open
    edeecc7871e8 ksmbd: fix Preauh_HashValue race condition
    2a30ed6428ce ksmbd: fix null pointer dereference error in generate_encryptionkey
    7384e0637fa8 drm/i915/ddi: only call shutdown hooks for valid encoders
    4a764acf4ab3 drm/i915/display: add intel_encoder_is_hdmi()
    428434769e45 drm/i915/ddi: gracefully handle errors from intel_ddi_init_hdmi_connector()
    743de353a434 drm/i915/hdmi: add error handling in g4x_hdmi_init()
    7edff90dc154 drm/i915/hdmi: propagate errors from intel_hdmi_init_connector()
    5913410e4962 drm/i915/ddi: change intel_ddi_init_{dp, hdmi}_connector() return type
    acd6f757f66c selftests/bpf: Fix build error with llvm 19
    01d1f298ba86 selftests/bpf: Add a test for arena range tree algorithm
    22d89925e37e ice/ptp: fix crosstimestamp reporting
    43a27836ac98 Revert "bcache: remove heap-related macros and switch to generic min_heap"
    be8a5602b05b accel/ivpu: Fix reset_engine debugfs file logic
    32950b190791 vsock: Do not allow binding to VMADDR_PORT_ANY
    f2e8fcfd2b1b net/packet: fix a race in packet_set_ring() and packet_notifier()
    15a77e9cb924 selftests/perf_events: Add a mmap() correctness test
    e529888b7e80 perf/core: Prevent VMA split of buffer mappings
    92043120a2e9 perf/core: Exit early on perf_mmap() fail
    8c67899a5295 perf/core: Don't leak AUX buffer refcount on allocation failure
    25bb3647d30a sunrpc: fix handling of server side tls alerts
    39f8e0cf1798 smb: client: return an error if rdma_connect does not return within 5 seconds
    8cb7f685af10 pptp: fix pptp_xmit() error path
    7d0f3072f999 nvmet: exit debugfs after discovery subsystem exits
    8c221b55d0c2 smb: client: let recv_done() avoid touching data_transfer after cleanup/move
    c5b3ce5cc7f6 smb: client: let recv_done() cleanup before notifying the callers.
    501eed35cac6 smb: client: make sure we call ib_dma_unmap_single() only if we called ib_dma_map_single already
    d6917b434919 smb: client: remove separate empty_packet_queue
    0d6d86b0a575 smb: server: let recv_done() avoid touching data_transfer after cleanup/move
    3d970a2f2472 smb: server: let recv_done() consistently call put_recvmsg/smb_direct_disconnect_rdma_connection
    896af4c26100 smb: server: make sure we call ib_dma_unmap_single() only if we called ib_dma_map_single already
    17d675f6390b smb: server: remove separate empty_recvmsg_queue
    b9a8a3f60b9c ALSA: hda/ca0132: Fix missing error handling in ca0132_alt_select_out()
    02541f9d5c58 irqchip: Build IMX_MU_MSI only on ARM
    04d5f4dbef26 eth: fbnic: remove the debugging trick of super high page bias
    9432bcabeeee s390/mm: Allocate page table with PAGE_SIZE granularity
    d00e4125680f net/sched: mqprio: fix stack out-of-bounds write in tc entry parsing
    0ddfe8b127ef benet: fix BUG when creating VFs
    788c5e28cf48 x86/irq: Plug vector setup race
    c36b2fbd60e8 sunrpc: fix client side handling of tls alerts
    034d210f9d56 net/sched: taprio: enforce minimum value for picos_per_byte
    c0ec2e47f1e9 net: drop UFO packets in udp_rcv_segment()
    714b84653841 net: mdio: mdio-bcm-unimac: Correct rate fallback logic
    5489e7fc6f8b ipv6: reject malicious packets in ipv6_gso_segment()
    15c0847df624 net/mlx5: Correctly set gso_segs when LRO is used
    674328102baa spi: cs42l43: Property entry should be a null-terminated array
    e1e15033dfba ASoC: tas2781: Fix the wrong step for TLV on tas2781
    0257dc08a404 block: ensure discard_granularity is zero when discard is not supported
    3ff8fe9194a7 block: Fix default IO priority if there is no IO context
    495cb1e8ec8a netlink: specs: ethtool: fix module EEPROM input/output arguments
    7175bf8a2af5 s390/ap: Unmask SLCF bit in card and queue ap functions sysfs
    929aa980dacf nvmet: initialize discovery subsys after debugfs is initialized
    ea99b88b1999 pptp: ensure minimal skb length in pptp_xmit()
    39468480b321 net: ipa: add IPA v5.1 and v5.5 to ipa_version_string()
    e56e1842289d phy: mscc: Fix parsing of unicast frames
    75b59af723c4 netpoll: prevent hanging NAPI when netcons gets enabled
    1f3a7f53874a md/md-cluster: handle REMOVE message earlier
    b6f47385e457 NFS: Fixup allocation flags for nfsiod's __GFP_NORETRY
    d4ebe94673b3 NFSv4.2: another fix for listxattr
    2ad40b7992aa NFS: Fix filehandle bounds checking in nfs_fh_to_dentry()
    bb96d6dbd005 NFS: Fix wakeup of __nfs_lookup_revalidate() in unblock_revalidate()
    ac9a6b863827 sched: Add test_and_clear_wake_up_bit() and atomic_dec_and_wake_up()
    531914fd74e8 pNFS/flexfiles: don't attempt pnfs on fatal DS errors
    48c6935a3498 PCI: pnv_php: Fix surprise plug detection and recovery
    d2c60a8a387e powerpc/eeh: Make EEH driver device hotplug safe
    5ea0d23aa954 powerpc/eeh: Export eeh_unfreeze_pe()
    11fa01706a4f PCI: pnv_php: Work around switches with broken presence detection
    28aa3cfce124 PCI: pnv_php: Clean up allocated IRQs on unplug
    3df959fd51d6 sched/psi: Fix psi_seq initialization
    c4a0d62bbe99 kconfig: qconf: fix ConfigList::updateListAllforAll()
    74b3fedc57d1 scsi: sd: Make sd shutdown issue START STOP UNIT appropriately
    d710ed68c54a scsi: ufs: core: Use link recovery when h8 exit fails during runtime resume
    13a501f95e22 scsi: Revert "scsi: iscsi: Fix HW conn removal use after free"
    13510a36a22f scsi: mpt3sas: Fix a fw_event memory leak
    fa1607f943f4 vfio/pci: Separate SR-IOV VF dev_set
    1df8150ab4cc vfio/pds: Fix missing detach_ioas op
    12964e77c8c1 vfio: Prevent open_count decrement to negative
    7b2db63ad836 vfio: Fix unbalanced vfio_df_close call in no-iommu mode
    89efd90ec672 i2c: muxes: mule: Fix an error handling path in mule_i2c_mux_probe()
    6038537c4a26 exfat: fdatasync flag should be same like generic_write_sync()
    82765ce5c7a5 f2fs: fix to trigger foreground gc during f2fs_map_blocks() in lfs mode
    4b069ec86c33 f2fs: fix to calculate dirty data during has_not_enough_free_secs()
    3908f15df598 f2fs: fix to update upper_p in __get_secs_required() correctly
    0fe7976b6254 f2fs: vm_unmap_ram() may be called from an invalid context
    70849d33130a f2fs: fix to avoid out-of-boundary access in devs.path
    97df495d7541 f2fs: fix to avoid panic in f2fs_evict_inode
    dea243f58a83 f2fs: fix to avoid UAF in f2fs_sync_inode_meta()
    09a8915e0fcc f2fs: doc: fix wrong quota mount option description
    ca525a64bb92 f2fs: fix to check upper boundary for gc_no_zoned_gc_percent
    1f1efc11132a f2fs: fix to check upper boundary for gc_valid_thresh_ratio
    46f24b1fbf6b f2fs: fix to check upper boundary for value of gc_boost_zoned_gc_percent
    44a79437309e f2fs: fix KMSAN uninit-value in extent_info usage
    334afc40c41c f2fs: fix bio memleak when committing super block
    8b1f1f83e377 f2fs: turn off one_time when forcibly set to foreground GC
    b0002acbec11 rtc: rv3028: fix incorrect maximum clock rate handling
    b6612b05de8e rtc: pcf8563: fix incorrect maximum clock rate handling
    b82c5074f6fc rtc: pcf85063: fix incorrect maximum clock rate handling
    e57edc34bcf7 rtc: nct3018y: fix incorrect maximum clock rate handling
    189ddb44f88c rtc: hym8563: fix incorrect maximum clock rate handling
    6ccd7f451e0e rtc: ds1307: fix incorrect maximum clock rate handling
    a721da19eac7 ucount: fix atomic_long_inc_below() argument type
    db38ade47be4 module: Restore the moduleparam prefix length check
    ff24854e8547 apparmor: Fix unaligned memory accesses in KUnit test
    277bb68f6576 apparmor: fix loop detection used in conflicting attachment resolution
    991a32f71538 apparmor: ensure WB_HISTORY_SIZE value is a power of 2
    258d42024fad bpf: Check netfilter ctx accesses are aligned
    eb2035c1adeb bpf: Check flow_dissector ctx accesses are aligned
    b2a3018e8325 vhost: Reintroduce kthread API and add mode selection
    3c8a15f2229d vdpa: Fix IDR memory leak in VDUSE module exit
    37f26b9013b4 vdpa/mlx5: Fix release of uninitialized resources on error path
    8ed657604bfd vhost-scsi: Fix log flooding with target does not exist errors
    65c9eeff9308 vdpa/mlx5: Fix needs_teardown flag calculation
    966460bace9e perf record: Cache build-ID of hit DSOs only
    0a98771d1e50 selftests: ALSA: fix memory leak in utimer test
    6f7ac9c5ad75 drm/xe/vf: Disable CSC support on VF
    81b117f4a5a3 mtd: rawnand: atmel: set pmecc data setup time
    2529fc0a1873 mtd: rawnand: rockchip: Add missing check after DMA map
    3e2d8d39a328 mtd: rawnand: atmel: Fix dma_mapping_error() address
    3406bd02dee3 jfs: fix metapage reference count leak in dbAllocCtl
    40f0a51f6c54 fbdev: imxfb: Check fb_add_videomode to prevent null-ptr-deref
    a434ce6643de crypto: qat - fix seq_file position update in adf_ring_next()
    71c31562d23b crypto: qat - fix DMA direction for compression on GEN2 devices
    309b23f7b5bc perf tools: Remove libtraceevent in .gitignore
    112ed94f2a45 sh: Do not use hyphen in exported variable name
    32b106dc4622 ASoC: fsl_xcvr: get channel status data when PHY is not exists
    a5f147a934ef dmaengine: nbpfaxi: Add missing check after DMA map
    2c0b57e55d89 dmaengine: mv_xor: Fix missing check after DMA map and missing unmap
    39c4454ed669 fs/orangefs: Allow 2 more characters in do_c_string()
    e3d729db128d remoteproc: xlnx: Disable unsupported features
    c1dead8bb303 clk: imx95-blk-ctl: Fix synchronous abort
    875bdd2f9bbc PCI: endpoint: pci-epf-vntb: Fix the incorrect usage of __iomem attribute
    9cf0d1dbfa44 soundwire: stream: restore params when prepare ports fail
    a510a9869d21 crypto: qat - disable ZUC-256 capability for QAT GEN5
    bcd9cdc74974 crypto: img-hash - Fix dma_unmap_sg() nents value
    44b07ee87c4f crypto: keembay - Fix dma_unmap_sg() nents value
    f63bd615e58f hwrng: mtk - handle devm_pm_runtime_enable errors
    1a43f53b0e9e clk: at91: sam9x7: update pll clk ranges
    b2e294216bf1 ext4: Make sure BH_New bit is cleared in ->write_end handler
    0a844a32e07a watchdog: ziirave_wdt: check record length in ziirave_firm_verify()
    7aa077df2357 scsi: isci: Fix dma_unmap_sg() nents value
    ef42bea6c105 scsi: mvsas: Fix dma_unmap_sg() nents value
    ad1fbfab0dcf scsi: elx: efct: Fix dma_unmap_sg() nents value
    6a9f573ebdb6 scsi: ibmvscsi_tgt: Fix dma_unmap_sg() nents value
    49a6266113f0 clk: sunxi-ng: v3s: Fix de clock definition
    ea11b0d213cc clk: thead: th1520-ap: Correctly refer the parent of osc_12m
    87be3d8ca00b RDMA/mana_ib: Fix DSCP value in modify QP
    c149e3475cac perf tests bp_account: Fix leaked file descriptor
    9ea3f6b9a67b pinmux: fix race causing mux_owner NULL with active mux_usecount
    fc1072d934f6 proc: use the same treatment to check proc_lseek as ones for proc_read_iter et.al
    ec437d015968 kernel: trace: preemptirq_delay_test: use offstack cpu mask
    5f3c0301540b RDMA/hns: Fix -Wframe-larger-than issue
    81c0bdb09cfa RDMA/hns: Drop GFP_NOWARN
    bb8899d40600 RDMA/hns: Fix accessing uninitialized resources
    1209e33fe3af RDMA/hns: Get message length of ack_req from FW
    9dea08eac4f6 crypto: ccp - Fix crash when rebind ccp device for ccp.ko
    c88a902cc5d3 crypto: inside-secure - Fix `dma_unmap_sg()` nents value
    155c1d4c4907 crypto: ccp - Fix locking on alloc failure handling
    88d4191073a5 RDMA/hns: Fix HW configurations not cleared in error flow
    dab173bae330 RDMA/hns: Fix double destruction of rsv_qp
    ffc3c00a0e83 perf sched: Fix memory leaks in 'perf sched latency'
    f7786e6a4f9c perf sched: Use RC_CHK_EQUAL() to compare pointers
    f34d54d2c276 perf sched: Fix memory leaks for evsel->priv in timehist
    31a549b3a294 perf sched: Fix memory leaks in 'perf sched map'
    4b3ab5f3639e perf sched: Free thread->priv using priv_destructor
    5c42686e56fc perf sched: Make sure it frees the usage string
    c2e061c2a5ec mtd: spi-nor: spansion: Fixup params->set_4byte_addr_mode for SEMPER
    ea90bb43be7c perf dso: Add missed dso__put to dso__load_kcore
    e9136a4afe3b perf tools: Fix use-after-free in help_unknown_cmd()
    16ab43828c48 Fix dma_unmap_sg() nents value
    40fd96ce4e60 clk: clk-axi-clkgen: fix fpfd_max frequency for zynq
    de07e1183139 fanotify: sanitize handle_type values when reporting fid
    faa05c6d5ae1 phy: qualcomm: phy-qcom-eusb2-repeater: Don't zero-out registers
    e7d11d7da5e0 dmaengine: mmp: Fix again Wvoid-pointer-to-enum-cast warning
    b2b740a884eb pinctrl: berlin: fix memory leak in berlin_pinctrl_build_state()
    230b23da10d5 pinctrl: sunxi: Fix memory leak on krealloc failure
    c63ca4d3870c PCI: endpoint: pci-epf-vntb: Return -ENOENT if pci_epc_get_next_free_bar() fails
    0e29430d700a crypto: arm/aes-neonbs - work around gcc-15 warning
    99490f243390 power: supply: max14577: Handle NULL pdata when CONFIG_OF is not set
    f642500aa7ed power: supply: cpcap-charger: Fix null check for power_supply_get_by_name
    f1a1be99d5ae clk: xilinx: vcu: unregister pll_post only if registered correctly
    1ff541ea9e0c media: v4l2-ctrls: Fix H264 SEPARATE_COLOUR_PLANE check
    7943ed1f05f5 clk: davinci: Add NULL check in davinci_lpsc_clk_register()
    a508da16feac mtd: fix possible integer overflow in erase_xfer()
    55ece6d9c370 crypto: qat - fix state restore for banks with exceptions
    a32cd73f66b7 crypto: qat - allow enabling VFs in the absence of IOMMU
    bfd78c42f0d7 crypto: marvell/cesa - Fix engine load inaccuracy
    e555e28232b3 crypto: qat - use unmanaged allocation for dc_data
    beea9197b2e9 crypto: sun8i-ce - fix nents passed to dma_unmap_sg()
    e3992ee81eba clk: renesas: rzv2h: Fix missing CLK_SET_RATE_PARENT flag for ddiv clocks
    a0acd38f75de PCI: rockchip-host: Fix "Unexpected Completion" log message
    5f176b9ea18c fortify: Fix incorrect reporting of read buffer size
    3d672fe065aa staging: media: atomisp: Fix stack buffer overflow in gmin_get_var_int()
    0dbef493cae7 bpf, arm64: Fix fp initialization for exception boundary
    87b34d935109 bpf/preload: Don't select USERMODE_DRIVER
    0c58f74f8aa9 ipv6: annotate data-races around rt->fib6_nsiblings
    db65739d406c ipv6: fix possible infinite loop in fib6_info_uses_dev()
    cd8d8bbd9ced ipv6: prevent infinite loop in rt6_nlmsg_size()
    c2241478d248 vrf: Drop existing dst reference in vrf_ip6_input_dst
    f4f5a1a751aa selftests: rtnetlink.sh: remove esp4_offload after test
    77b05e7a2d66 stmmac: xsk: fix negative overflow of budget in zerocopy mode
    5d761dc79f4a net: dsa: microchip: Fix wrong rx drop MIB counter for KSZ8863
    781a0bbf3774 net/mlx5e: Remove skb secpath if xfrm state is not found
    c04bc84aa5e9 net/mlx5e: Clear Read-Only port buffer size in PBMC before update
    7c1ae471da69 netfilter: xt_nfacct: don't assume acct name is null-terminated
    bd5908c1f60d can: kvaser_usb: Assign netdev.dev_port based on device channel index
    4bee385bc330 can: kvaser_pciefd: Store device channel index
    f2880c9cf1ed can: peak_usb: fix USB FD devices potential malfunction
    176784dc75ae selftests: drv-net: Fix remote command checking in require_cmd()
    208040490a4f tools/rv: Do not skip idle in trace
    62f6175d145e bpf: Disable migration in nf_hook_run_bpf().
    cca34a0a767f Bluetooth: hci_event: Mask data status from LE ext adv reports
    16852eccbdfa Bluetooth: hci_sync: fix double free in 'hci_discovery_filter_clear()'
    f15d94491094 memcg_slabinfo: Fix use of PG_slab
    1e30043ee358 kcsan: test: Initialize dummy variable
    5763daf5ca4f ring-buffer: Remove ring_buffer_read_prepare_sync()
    24bf1d10a04a wifi: nl80211: Set num_sub_specs before looping through sub_specs
    471a7904f82f wifi: mac80211: Write cnt before copying in ieee80211_copy_rnr_beacon()
    27244ed7403c wifi: brcmfmac: fix P2P discovery failure in P2P peer due to missing P2P IE
    0c5c0c898314 wifi: ath12k: fix endianness handling while accessing wmi service bit
    f0a0bc39fc52 Reapply "wifi: mac80211: Update skb's control block key in ieee80211_tx_dequeue()"
    01aa86f93e70 wifi: mac80211: Check 802.11 encaps offloading in ieee80211_tx_h_select_key()
    f92ad4f8ecb9 wifi: mac80211: Don't call fq_flow_idx() for management frames
    eadf83a687fd wifi: mac80211: Do not schedule stopped TXQs
    ad1c484f1b81 wifi: plfxlc: Fix error handling in usb driver probe
    af72badd5ee4 wifi: mac80211: reject TDLS operations when station is not associated
    c200ecdd820f rcu: Fix delayed execution of hurry callbacks
    f14341cf874e iommu/amd: Fix geometry.aperture_end for V2 tables
    39dfbf77c6e4 drm/amdgpu/gfx10: fix kiq locking in KCQ reset
    6db9f958b43f drm/amdgpu/gfx9.4.3: fix kiq locking in KCQ reset
    b9f5d112e5e3 drm/amdgpu/gfx9: fix kiq locking in KCQ reset
    9c0e3144924c wifi: ath11k: fix sleeping-in-atomic in ath11k_mac_op_set_bitrate_mask()
    da4d3fd5920a mwl8k: Add missing check after DMA map
    4db9ac2246a7 wifi: rtw88: Fix macid assigned to TDLS station
    2bc4c07394cb wifi: rtl8xxxu: Fix RX skb size for aggregation disabled
    e9c3ae88e4f4 tcp: call tcp_measure_rcv_mss() for ooo packets
    81990ac1d1f0 xen/gntdev: remove struct gntdev_copy_batch from stack
    e59078852604 xen: fix UAF in dmabuf_exp_from_pages()
    19c262401e12 RDMA/mlx5: Fix UMR modifying of mkey page size
    bdb956891c9c net_sched: act_ctinfo: use atomic64_t for three counters
    795cb393e389 net/sched: Restrict conditions for adding duplicating netems to qdisc tree
    6aa95f56a6a7 iommu/amd: Enable PASID and ATS capabilities in the correct order
    67925d8b0d63 um: rtc: Avoid shadowing err in uml_rtc_start()
    fe6345dbae40 arch: powerpc: defconfig: Drop obsolete CONFIG_NET_CLS_TCINDEX
    a9ca56ca4f19 netfilter: nf_tables: adjust lockdep assertions handling
    765eeb44b1a3 netfilter: nf_tables: Drop dead code from fill_*_info routines
    69be0a3c4e5b fbcon: Fix outdated registered_fb reference in comment
    c1cbee3aae2a sched/psi: Optimize psi_group_change() cpu_clock() usage
    82f2cd70222c drm/amd/pm/powerplay/hwmgr/smu_helper: fix order of mask and value
    08cfbe7acac0 refscale: Check that nreaders and loops multiplication doesn't overflow
    ac984f610628 m68k: Don't unregister boot console needlessly
    d89943d1e3a0 drm/msm/dpu: Fill in min_prefill_lines for SC8180X
    6434ca4429eb bpf: Ensure RCU lock is held around bpf_prog_ksym_find
    7989a6056c7e kselftest/arm64: Fix check for setting new VLs in sve-ptrace
    939135ddeae2 net: dst: annotate data-races around dst->output
    002bb5722d7e net: dst: annotate data-races around dst->input
    4249f1307932 net/mlx5: Check device memory pointer before usage
    bfb595e79319 tcp: fix tcp_ofo_queue() to avoid including too much DUP SACK range
    72a48be1f539 wifi: ath11k: clear initialized flag for deinit-ed srng lists
    7dd6350307af iwlwifi: Add missing check for alloc_ordered_workqueue
    a84858649b32 wifi: iwlwifi: Fix memory leak in iwl_mvm_init()
    7858a95566f4 wifi: rtl818x: Kill URBs before clearing tx status queue
    77a7a48f87d6 wifi: rtw89: avoid NULL dereference when RX problematic packet on unsupported 6 GHz band
    1b8397c2d14e caif: reduce stack size, again
    3f91bec30811 powerpc/pseries/dlpar: Search DRC index from ibm,drc-indexes for IO add
    c9c7b91bc1a0 bpftool: Fix memory leak in dump_xx_nlmsg on realloc failure
    bcdd7499bdef drm/amdgpu: Remove nbiov7.9 replay count reporting
    b56acee24e33 drm/vmwgfx: Fix Host-Backed userspace on Guest-Backed kernel
    94927ae3d5c1 net: ipv6: ip6mr: Fix in/out netdev to pass to the FORWARD chain
    443430e67868 selftests/bpf: Fix unintentional switch case fall through
    274bf55fcd3f selftests/bpf: fix signedness bug in redir_partial()
    ee03766d79de bpf, ktls: Fix data corruption when using bpf_msg_pop_data() in ktls
    538b19886ca0 bpf, sockmap: Fix psock incorrectly pointing to sk
    66d64d42d297 drm/panthor: Add missing explicit padding in drm_panthor_gpu_info
    de7834d100f2 drm/panfrost: Fix panfrost device variable name in devfreq
    439b30af0ea9 drm/rockchip: cleanup fb when drm_gem_fb_afbc_init failed
    33cb946a8c73 selftests/tracing: Fix false failure of subsystem event test
    e7d59358a7e3 staging: nvec: Fix incorrect null termination of battery manufacturer
    c458492e2ab8 bus: mhi: host: pci_generic: Fix the modem name of Foxconn T99W640
    7d4f49b9141a interconnect: qcom: sc8180x: specify num_nodes
    3f693357f551 interconnect: qcom: sc8280xp: specify num_links for qnm_a1noc_cfg
    8eaeb8df9159 soc: qcom: pmic_glink: fix OF node leak
    4c80835f6af4 samples: mei: Fix building on musl libc
    c2f05fc69f4a staging: greybus: gbphy: fix up const issue with the match callback
    8e4b38710dd4 cpufreq: Init policy->rwsem before it may be possibly used
    494c213792f3 cpufreq: Initialize cpufreq-based frequency-invariance later
    667eb5aeecd2 cpufreq: intel_pstate: Always use HWP_DESIRED_PERF in passive mode
    7db3a7b2e413 PM / devfreq: Fix a index typo in trans_stat
    d5632359dbc4 PM / devfreq: Check governor before using governor->name
    a7d23e71a66e arm64: dts: imx8mn-beacon: Fix HS400 USDHC clock speed
    6e6c9e2d29b5 arm64: dts: imx8mm-beacon: Fix HS400 USDHC clock speed
    6d5a85e3bb67 ARM: dts: imx6ul-kontron-bl-common: Fix RTS polarity for RS485 interface
    11be9a6e3483 selftests: breakpoints: use suspend_stats to reliably check suspend success
    bed9fa51068f arm64: dts: st: fix timer used for ticks
    e2a57054e999 soc/tegra: cbb: Clear ERR_FORCE register with ERR_STATUS
    bf8d808f77b9 arm: dts: ti: omap: Fixup pinheader typo
    cd865df971c6 usb: early: xhci-dbc: Fix early_ioremap leak
    8374ac7d69a5 powercap: dtpm_cpu: Fix NULL pointer dereference in get_pd_power_uw()
    3e3ebf358cda Revert "vmci: Prevent the dispatching of uninitialized payloads"
    576fc220fb6c selftests: vDSO: chacha: Correctly skip test if necessary
    6ee761012d1a pps: fix poll support
    87f8f8654e55 vmci: Prevent the dispatching of uninitialized payloads
    a3177955f8da staging: fbtft: fix potential memory leak in fbtft_framebuffer_alloc()
    a7645815edf4 spi: stm32: Check for cfg availability in stm32_spi_probe
    5786ccbd317c mei: vsc: Unset the event callback on remove and probe errors
    173a7f17103c mei: vsc: Event notifier fixes
    4a958702b7cc mei: vsc: Destroy mutex after freeing the IRQ
    ae77ebdc4822 usb: typec: ucsi: yoga-c630: fix error and remove paths
    7101b26f7e96 firmware: arm_scmi: Fix up turbo frequencies selection
    e579ab62fefd cpufreq: armada-8k: make both cpu masks static
    1de0e54aaf49 arm64: dts: ti: k3-am62p-j722s: fix pinctrl-single size
    ac0f8fca09f2 arm64: dts: ti: k3-am642-phyboard-electra: Fix PRU-ICSSG Ethernet ports
    8209fc45b04e usb: misc: apple-mfi-fastcharge: Make power supply names unique
    1d88e8e66b68 usb: host: xhci-plat: fix incorrect type for of_match variable in xhci_plat_probe()
    d9632823a400 ARM: dts: vfxxx: Correctly use two tuples for timer address
    e7e370264098 arm64: dts: qcom: msm8976: Make blsp_dma controlled-remotely
    cac895bcbcf2 arm64: dts: qcom: sa8775p: Correct the interrupt for remoteproc
    0f35f4df0590 arm64: dts: exynos: gs101: Add 'local-timer-stop' to cpuidle nodes
    72ee9c7b7c61 arm64: dts: qcom: sc7180: Expand IMEM region
    db9d963622d9 arm64: dts: qcom: sdm845: Expand IMEM region
    04e7717dddc0 soc: qcom: QMI encoding/decoding for big endian
    90040a48030e selftests: Fix errno checking in syscall_user_dispatch test
    c814023c82ae arm64: dts: freescale: imx93-tqma9352: Limit BUCK2 to 600mV
    3b13b5a4f29e ASoC: mediatek: use reserved memory or enable buffer pre-allocation
    a9d00b7f374b ASoC: ops: dynamically allocate struct snd_ctl_elem_value
    2d9ee65b6d84 ASoC: soc-dai: tidyup return value of snd_soc_xlate_tdm_slot_mask()
    cd89d86dd1d5 io_uring: fix breakage in EXPERT menu
    f5426ffbec97 gfs2: No more self recovery
    b356ee013a79 Revert "fs/ntfs3: Replace inode_trylock with inode_lock"
    5055b7db9411 hfsplus: remove mutex_lock check in hfsplus_free_extents
    b53a10073f28 hfs: make splice write available again
    248d605319fe hfsplus: make splice write available again
    0e5c17c2376b ublk: use vmalloc for ublk_device's __queues
    3ed2cc6a6e93 fs/ntfs3: cancle set bad inode after removing name fails
    47706f9acfee fs_context: fix parameter name in infofc() macro
    bb80f7618832 parse_longname(): strrchr() expects NUL-terminated string
    2f6c33b9fab0 audit,module: restore audit logging in load failure case
    6b4b30b863ee ASoC: amd: yc: add DMI quirk for ASUS M6501RM
    362ea99022c9 ASoC: Intel: fix SND_SOC_SOF dependencies
    9b25e1643cc7 ALSA: hda/cs35l56: Workaround bad dev-index on Lenovo Yoga Book 9i GenX
    bf0d05941955 ASoC: amd: yc: Add DMI entries to support HP 15-fb1xxx
    f13486ac6b5b ethernet: intel: fix building with large NR_CPUS
    60291de0c56c ASoC: amd: yc: Add DMI quirk for HP Laptop 17 cp-2033dx

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 72525d8764..8b8a87735c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a40a131df6cba8f7ff468416f0cbe8e694974c8c"
-SRCREV_meta ?= "57f788e849d9b04dd6aa28b896546c56b45f69e7"
+SRCREV_machine ?= "b9c1961e3d966405a925249e8a75ddd436429286"
+SRCREV_meta ?= "ddf44e2c61ca41d03f51f460e7619488a70c6fc1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.41"
+LINUX_VERSION ?= "6.12.42"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 733b163c77..02ac0d068f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.41"
+LINUX_VERSION ?= "6.12.42"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "4137e9dd62e47f0f7472c7f0dfcbef5f8929f280"
-SRCREV_meta ?= "57f788e849d9b04dd6aa28b896546c56b45f69e7"
+SRCREV_machine ?= "42fc5c3dd9290a70fe200ebe8fe3f6a2cc44fafa"
+SRCREV_meta ?= "ddf44e2c61ca41d03f51f460e7619488a70c6fc1"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 3c27a7e719..c78cbb201e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "01bbdad6b55cc37010a721899318f591ba5f09a6"
-SRCREV_machine:qemuarm64 ?= "4137e9dd62e47f0f7472c7f0dfcbef5f8929f280"
-SRCREV_machine:qemuloongarch64 ?= "4137e9dd62e47f0f7472c7f0dfcbef5f8929f280"
-SRCREV_machine:qemumips ?= "aa348bdab88ee1c6358af8e3b9d210738884a8f6"
-SRCREV_machine:qemuppc ?= "4137e9dd62e47f0f7472c7f0dfcbef5f8929f280"
-SRCREV_machine:qemuriscv64 ?= "4137e9dd62e47f0f7472c7f0dfcbef5f8929f280"
-SRCREV_machine:qemuriscv32 ?= "4137e9dd62e47f0f7472c7f0dfcbef5f8929f280"
-SRCREV_machine:qemux86 ?= "4137e9dd62e47f0f7472c7f0dfcbef5f8929f280"
-SRCREV_machine:qemux86-64 ?= "4137e9dd62e47f0f7472c7f0dfcbef5f8929f280"
-SRCREV_machine:qemumips64 ?= "d3850d4a70821a2d63be812b316ca0d05c2c0c24"
-SRCREV_machine ?= "4137e9dd62e47f0f7472c7f0dfcbef5f8929f280"
-SRCREV_meta ?= "57f788e849d9b04dd6aa28b896546c56b45f69e7"
+SRCREV_machine:qemuarm ?= "e743c42b3662ce1378f39deafff553e5a367751b"
+SRCREV_machine:qemuarm64 ?= "42fc5c3dd9290a70fe200ebe8fe3f6a2cc44fafa"
+SRCREV_machine:qemuloongarch64 ?= "42fc5c3dd9290a70fe200ebe8fe3f6a2cc44fafa"
+SRCREV_machine:qemumips ?= "5a890e642a2f5a693544e33a7d1fc160cc13238b"
+SRCREV_machine:qemuppc ?= "42fc5c3dd9290a70fe200ebe8fe3f6a2cc44fafa"
+SRCREV_machine:qemuriscv64 ?= "42fc5c3dd9290a70fe200ebe8fe3f6a2cc44fafa"
+SRCREV_machine:qemuriscv32 ?= "42fc5c3dd9290a70fe200ebe8fe3f6a2cc44fafa"
+SRCREV_machine:qemux86 ?= "42fc5c3dd9290a70fe200ebe8fe3f6a2cc44fafa"
+SRCREV_machine:qemux86-64 ?= "42fc5c3dd9290a70fe200ebe8fe3f6a2cc44fafa"
+SRCREV_machine:qemumips64 ?= "f35fbfe92ba17c777d450e16d5d0ffb30bac499d"
+SRCREV_machine ?= "42fc5c3dd9290a70fe200ebe8fe3f6a2cc44fafa"
+SRCREV_meta ?= "ddf44e2c61ca41d03f51f460e7619488a70c6fc1"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "8f5ff9784f3262e6e85c68d86f8b7931827f2983"
+SRCREV_machine:class-devupstream ?= "880e4ff5d6c8dc6b660f163a0e9b68b898cc6310"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.41"
+LINUX_VERSION ?= "6.12.42"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


