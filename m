Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC2FCCD1A4
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 20:39:53 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.3132.1760733593431509279
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 13:39:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=H0kJsDe5;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7835321bc98so2263743b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 13:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760733593; x=1761338393; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wb33OUDEUwwDAnKNyMxopLg9MVSy44Tapjqm7qkDsTA=;
        b=H0kJsDe5pBMXNmZFq8ZHojP36ANz1c+9GaPdfw+w1ofj/6H1+NVD5/DYDWUkhFBtlK
         cb1KeOQ3U+5rXEE2w2oW74Hp1qiOy49M+hEjfky1B7p0N9bF8//3lXAJdQSlbR9LedGI
         rtRsOqa1hgRIalh88UftQqzwIKlnssQP25uj6fBmXSWtU+A8jZAnPDJEaZIvD4b5+gk4
         2SUhkxHlVucViKR+TfcnEr1jHR/r/BRv1+KbmEwMJGtKL4t2qj0/vOr/7UpTf3TxMgtr
         TMWRZrMRYrHjQ2hSeM659eMu1gsYP57vbReXxtbyPeMuy8dZnfMwYmP0UMbHJ+2S+1eH
         eL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733593; x=1761338393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wb33OUDEUwwDAnKNyMxopLg9MVSy44Tapjqm7qkDsTA=;
        b=S1LUWAObFT7vvpNbkm8laeCRKgZJo0VrOzhIgIc88fQSaZz3JBsygCjkNNJqec4Oo7
         pqguRXaL3FKMV95pnnXR0A7cQCpzmP6Nuh/F20id2lBgAYaawrqBf/a6p7o+A2cxlsDg
         zVOBGJs0gHL7nfL5gX5Ye2MOetCOdEiQMFovJyDwpqDaDpAZkm4S7LLKoQrMpMnXcvPu
         Gt0rC2I8K5fvt006C/6xyOKrIm2dEKIM+UoU37lggpcD2X900l32uyJ9sXNDvX0eXHDI
         qRmzgXz2rghSEAGj90Lv81coQjWLVDSdlbrtrgPTRPbww2aOnzNAsBqsKtF7gRupOKr6
         0xjA==
X-Gm-Message-State: AOJu0Yy7LCytNgQf4xXnrKjcQRwlnbKan5utSyXd98oU3MC+Jp3V/OSx
	Hs3g4OdB5qlMUJWiHx63pEP/AZbCi4HVjm6Oku5avl0Rr1ucJo3d72eiUJkepeLY+LVU4M+mbhy
	PhW4tl5o=
X-Gm-Gg: ASbGncuqW9tslIzOCnhElK7iUB8l7Z6KlEE1VXRxfjVe5l6t9Mv6qCAGr9d7jKMbPLW
	kZctZX4KzMGjO77DA5T2UPjOh/mM1RYhrMBTOxymHzWsLFo185HTr9SIwbF7Hlr/kp09AB4vSFT
	t5JrTKocXM1yaIdvcmofxh8ieV1jXRYhFUeGNKTrdWLk64v/0nLPb5Eo4LO6j5ZYlxLj28c99bM
	2wmKLoZtO54YENl+1WoHkN1brcaxMYW/pVi2VfRi6tmqgV4JNz7zcgZmYwkQIqa57GbIZ3cCL3r
	lZnpkB/PbRw7MU1tz4E0EBd9dpxdHqJi33hrejROccgcOvCUw8hOYvdYz7avPIoBW0xtdb9ixbC
	kEbhKEL7/wDmUNkIz/4JWDqhmQvK8b1FReGZryvfApe1fejeqKai+0NQsDFqMp6jM67aD5+5DGK
	ZO
X-Google-Smtp-Source: AGHT+IE3MeVYlYORoFIFyCgrZbweZ+d9KXFqWdhAgwd8S5YLLe9WqPqeypo+rDBO1bHd4fEA1cncOw==
X-Received: by 2002:a05:6a20:158a:b0:2f3:f59b:3b03 with SMTP id adf61e73a8af0-334a861fe16mr7076356637.42.1760733592076;
        Fri, 17 Oct 2025 13:39:52 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:aaee:e640:34cd:6f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f254esm477061b3a.45.2025.10.17.13.39.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:39:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/26] linux-yocto/6.6: update to v6.6.103
Date: Fri, 17 Oct 2025 13:39:00 -0700
Message-ID: <f9c140c4856790ae7b752849f4df6533ca5d0027.1760733431.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760733431.git.steve@sakoman.com>
References: <cover.1760733431.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 20:39:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225051

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

no ids found, dumping:
    cc1a1c5b404a Linux 6.6.103
    40b36d9a612b alloc_fdtable(): change calling conventions.
    a0a3ace2a578 netfilter: nf_reject: don't leak dst refcount for loopback packets
    c1aa819059b8 s390/hypfs: Enable limited access during lockdown
    972d84075e3b s390/hypfs: Avoid unnecessary ioctl registration in debugfs
    81a0f002e4fd ALSA: usb-audio: Use correct sub-type for UAC3 feature unit validation
    7d67d591ecb0 net/mlx5e: Preserve shared buffer capacity during headroom updates
    dacf1ca11735 net/mlx5: Base ECVF devlink port attrs from 0
    c71a3e2b02e7 Octeontx2-af: Skip overlap check for SPI field
    2919ca876e15 bonding: send LACPDUs periodically in passive mode after receiving partner's LACPDU
    45b70352d186 bonding: Add independent control state machine
    f0c7885ef8d3 bonding: update LACP activity flag after setting lacp_active
    ca88ac44368c net/sched: Remove unnecessary WARNING condition for empty child qdisc in htb_activate
    aa12ee1c1bd2 net/sched: Make cake_enqueue return NET_XMIT_CN when past buffer_limit
    ee7134481ff7 igc: fix disabling L1.2 PCI-E link substate on I226 on init
    d10f670b6f86 ixgbe: xsk: resolve the negative overflow of budget in ixgbe_xmit_zc
    5189c0b7c251 LoongArch: Optimize module load time by optimizing PLT/GOT counting
    070b4af44c4b net/smc: fix UAF on smcsk after smc_listen_out()
    ba51d73408ed gve: prevent ethtool ops after shutdown
    748da8083122 net: usb: asix_devices: Fix PHY address mask in MDIO bus initialization
    3a4eeea79a46 phy: mscc: Fix timestamping for vsc8584
    ca18d751bcc9 ppp: fix race conditions in ppp_fill_forward_path
    06a7acd45a8f net: ethernet: mtk_ppe: add RCU lock around dev_fill_forward_path
    87f78799e358 ipv6: sr: validate HMAC algorithm ID in seg6_hmac_info_add
    2156d9e9f2e4 net: gso: Forbid IPv6 TSO with extensions on devices with only IPV6_CSUM
    857b8387a977 drm/amd/display: Add null pointer check in mod_hdcp_hdcp1_create_session()
    b79027f7ebb7 ALSA: usb-audio: Fix size validation in convert_chmap_v3()
    f93032e5d68f drm/hisilicon/hibmc: fix the hibmc loaded failed bug
    e50599adc966 mlxsw: spectrum: Forward packets with an IPv4 link-local source IP
    469c45c8a16a Bluetooth: hci_conn: do return error from hci_enhanced_setup_sync()
    ae1d9779f089 Bluetooth: hci_event: fix MTU for BN == 0 in CIS Established
    8f80c633cba1 iommu/amd: Avoid stack buffer overflow from kernel cmdline
    f5ad0819f902 scsi: qla4xxx: Prevent a potential error pointer dereference
    96476b043efb net: bridge: fix soft lockup in br_multicast_query_expired()
    7aee3d519d63 RDMA/bnxt_re: Fix to initialize the PBL array
    5d3f018fc09a RDMA/bnxt_re: Fix to remove workload check in SRQ limit path
    7b044e925aba RDMA/bnxt_re: Fix to do SRQ armena by default
    acf0dea8dc90 RDMA/erdma: Fix ignored return value of init_kernel_qp
    76588276fcf8 iosys-map: Fix undefined behavior in iosys_map_clear()
    34c3bc762bc4 cgroup/cpuset: Use static_branch_enable_cpuslocked() on cpusets_insane_config_key
    72553fe19317 drm/nouveau/nvif: Fix potential memory leak in nvif_vmm_ctor().
    ad994eda5d95 spi: spi-fsl-lpspi: Clamp too high speed_hz
    7207923d8453 x86/cpu/hygon: Add missing resctrl_cpu_detect() in bsp_init helper
    4986548825fe usb: typec: maxim_contaminant: disable low power mode when reading comparator values
    f56e75b85b54 usb: typec: maxim_contaminant: re-enable cc toggle if cc is open and port is clean
    e600de541c37 usb: xhci: Fix slot_id resource race conflict
    8d2b63fbfd4d iio: imu: inv_icm42600: change invalid data error to -EBUSY
    0af5812acfac iio: imu: inv_icm42600: Convert to uXX and sXX integer types
    ec3310a5168b iio: imu: inv_icm42600: use = { } instead of memset()
    f52d8ba43259 iio: imu: inv_icm42600: switch timestamp type from int64_t __aligned(8) to aligned_s64
    f13768b9b829 iio: temperature: maxim_thermocouple: use DMA-safe buffer for spi_read()
    99b508340d0d iio: light: as73211: Ensure buffer holes are zeroed
    58ff8064cb4c tracing: Limit access to parser->buffer when trace_get_user failed
    648e01a023cb tracing: Remove unneeded goto out logic
    c09dd3773b59 tls: fix handling of zero-length records on the rx_list
    93879b3ba967 powerpc/boot: Fix build with gcc 15
    5c67f7e4330e mmc: sdhci-pci-gli: GL9763e: Mask the replay timer timeout of AER
    03695cdfcb5e compiler: remove __ADDRESSABLE_ASM{_STR,}() again
    fa833df2ba9e drm/amd/display: Don't overclock DCE 6 by 15%
    7660124e6506 usb: dwc3: pci: add support for the Intel Wildcat Lake
    84c95dbf5bec usb: dwc3: Remove WARN_ON for device endpoint command timeouts
    319aba29a486 usb: dwc3: Ignore late xferNotReady event to prevent halt timeout
    dbfaa79103b4 USB: storage: Ignore driver CD mode for Realtek multi-mode Wi-Fi dongles
    bf29c9618160 usb: storage: realtek_cr: Use correct byte order for bcs->Residue
    adfdc6ed189b USB: storage: Add unusual-devs entry for Novatek NTK96550-based camera
    cd3bace9c9a3 usb: renesas-xhci: Fix External ROM access timeouts
    3b4a57b5cc3b usb: core: hcd: fix accessing unmapped memory in SINGLE_STEP_SET_FEATURE test
    d84f6e77ebe3 comedi: Fix use of uninitialized memory in do_insn_ioctl() and do_insnlist_ioctl()
    0eb4ed2aa261 comedi: pcl726: Prevent invalid irq number
    842f307a1d11 comedi: Make insn_rw_emulate_bits() do insn->n samples
    decaa5401cb4 usb: quirks: Add DELAY_INIT quick for another SanDisk 3.2Gen1 Flash Drive
    20729b825914 cdx: Fix off-by-one error in cdx_rpmsg_probe()
    4de009fc0a3a most: core: Drop device reference after usage in get_channel()
    bc4e3186a2e2 iio: proximity: isl29501: fix buffered read on big-endian systems
    6a605d307b02 iio: pressure: bmp280: Use IS_ERR() in bmp280_common_probe()
    3b114a3282ab ftrace: Also allocate and copy hash for reading of filter files
    bb912a20fab0 fpga: zynq_fpga: Fix the wrong usage of dma_map_sgtable()
    65e46aeaf84a drm/dp: Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS
    d404824f3d25 cpuidle: governors: menu: Avoid selecting states with too much latency
    3a92598c3e55 cpuidle: menu: Remove iowait influence
    f0aa8591ba0c mmc: sdhci-pci-gli: Add a new function to simplify the code
    1eae029f79b6 mmc: sdhci-pci-gli: Use PCI AER definitions, not hard-coded values
    fd269466abe6 selftests: mptcp: pm: check flush doesn't reset limits
    a9cf4362d4d0 mptcp: disable add_addr retransmission when timeout is 0
    ebe3d8cf1ee6 mptcp: remove duplicate sk_reset_timer call
    1982e18bbcc1 use uniform permission checks for all mount propagation changes
    c5aa6ba11273 fs/buffer: fix use-after-free when call bh_read() helper
    212eb86f75b4 smb: server: split ksmbd_rdma_stop_listening() out of ksmbd_rdma_destroy()
    740ccba37a12 arm64: dts: ti: k3-am62-main: Remove eMMC High Speed DDR support
    342f7a1dda77 ext4: preserve SB_I_VERSION on remount
    047b4cb30e42 scsi: mpi3mr: Serialize admin queue BAR writes on 32-bit systems
    c065c8d20dd0 scsi: mpi3mr: Drop unnecessary volatile from __iomem pointers
    6d53b2a134da scsi: ufs: exynos: Fix programming of HCI_UTRL_NEXUS_TYPE
    0c3333f7bfee PCI: imx6: Add IMX8MM_EP and IMX8MP_EP fixed 256-byte BAR 4 in epc_features
    d0252e69b932 PCI: imx6: Delay link start until configfs 'start' written
    cee067ef2055 PCI: rockchip: Set Target Link Speed to 5.0 GT/s before retraining
    7b688b365ace PCI: rockchip: Use standard PCIe definitions
    72ff3acf0044 soc: qcom: mdt_loader: Fix error return values in mdt_header_valid()
    ef2f64dff281 drm/amd/display: Fill display clock and vblank time in dce110_fill_display_configs
    a98aa702c74f drm/amd/display: Find first CRTC and its line time in dce110_fill_display_configs
    e95f4fd56f6c drm/amd/display: Fix DP audio DTO1 clock source on DCE 6.
    5b011264c5da drm/amd/display: Fix fractional fb divider in set_pixel_clock_v3
    36a6b43573d1 drm/amd/display: Avoid a NULL pointer dereference
    86c2825791c3 s390/sclp: Fix SCCB present check
    50db1ab0f3ec ALSA: hda/realtek: Add support for HP EliteBook x360 830 G6 and EliteBook 830 G6
    0a1385336970 mm/memory-failure: fix infinite UCE for VM_PFNMAP pfn
    63962ff932ef mm/debug_vm_pgtable: clear page table entries at destroy_args()
    8d03bce0dcb2 squashfs: fix memory leak in squashfs_fill_super
    92c9689646c8 mmc: sdhci-pci-gli: GL9763e: Rename the gli_set_gl9763e() for consistency
    0207d8faa1fb memstick: Fix deadlock by moving removing flag earlier
    28b82be094e2 KVM: arm64: Fix kernel BUG() due to bad backport of FPSIMD/SVE/SME fix
    d1446050a29a sched/fair: Fix frequency selection for non-invariant case
    858e035ea448 topology: Set capacity_freq_ref in all cases
    68df021d3cfa arm64/amu: Use capacity_ref_freq() to set AMU ratio
    cf4faefd3a7b cpufreq/cppc: Set the frequency used for computing the capacity
    11da2b1ae4c9 energy_model: Use a fixed reference frequency
    6688eb926932 cpufreq/schedutil: Use a fixed reference frequency
    9771732ab39c cpufreq: Use the fixed and coherent frequency for scaling capacity
    46db6d4797f1 sched/topology: Add a new arch_scale_freq_ref() method
    0ed2068de1f9 kbuild: userprogs: use correct linker when mixing clang and GNU ld
    5b7912d83962 ata: libata-scsi: Return aborted command when missing sense and result TF
    9e9b1fa7ecaa PM: runtime: Take active children into account in pm_runtime_get_if_in_use()
    ac2e62cab097 PM: runtime: Simplify pm_runtime_get_if_active() usage
    c0f179c1547f ata: Fix SATA_MOBILE_LPM_POLICY description in Kconfig
    dc35f594b0d2 usb: dwc3: imx8mp: fix device leak at unbind
    1636b5e9c354 mm/ptdump: take the memory hotplug lock inside ptdump_walk_pgd()
    365771ee3dc8 wifi: mac80211: check basic rates validity in sta_link_apply_parameters
    b59bea60396c KVM: x86: Take irqfds.lock when adding/deleting IRQ bypass producer
    65b6b10fc005 s390/mm: Remove possible false-positive warning in pte_free_defer()
    0852c97fec9c btrfs: send: make fs_path_len() inline and constify its argument
    8f3aae5fd76d btrfs: send: use fallocate for hole punching with send stream v2
    f942e47453a8 btrfs: send: avoid path allocation for the current inode when issuing commands
    dbda681a0a93 btrfs: send: keep the current inode's path cached
    ffc19fe2a7ad btrfs: send: add and use helper to rename current inode when processing refs
    bfed58ed10f1 btrfs: send: only use boolean variables at process_recorded_refs()
    253557254f8d btrfs: send: factor out common logic when sending xattrs
    b1947464c041 btrfs: populate otime when logging an inode item
    d7badc2ba4da btrfs: constify more pointer parameters
    9dfdea89ceb3 btrfs: fix ssd_spread overallocation
    9c64d6b07cbb btrfs: open code timespec64 in struct btrfs_inode
    8f85af32692d xfs: fully decouple XFS_IBULK* flags from XFS_IWALK* flags
    4734255ef39b btrfs: abort transaction on unexpected eb generation at btrfs_copy_root()
    467dcf7e4a61 btrfs: always abort transaction on failure to add block group to free space tree
    8c5bf13905f3 btrfs: move transaction aborts to the error site in add_block_group_free_space()
    b172535ccba1 btrfs: qgroup: fix race between quota disable and quota rescan ioctl
    d6f1a6c2f567 btrfs: don't ignore inode missing when replaying log tree
    a779d1dd7f2d usb: typec: fusb302: cache PD RX state
    827f7b4fe051 PCI/ACPI: Fix runtime PM ref imbalance on Hot-Plug Capable ports
    80617b3926b6 block: Make REQ_OP_ZONE_FINISH a write operation
    6c77d4e0f6ad block: reject invalid operation in submit_bio_noacct
    3bbd52a413fc fscrypt: Don't use problematic non-inline crypto engines
    c8a1e1f02921 leds: flash: leds-qcom-flash: Fix registry access after re-bind
    71230248a711 leds: flash: leds-qcom-flash: Limit LED current based on thermal condition
    84a24fb446ee net/sched: ets: use old 'nbands' while purging unused classes
    81505f137b3a net_sched: sch_ets: implement lockless ets_dump()
    00dc616e6cb5 smb: client: fix netns refcount leak after net_passive changes
    2668e038800b net: better track kernel sockets lifetime
    ac90037bf398 net: Add net_passive_inc() and net_passive_dec().
    5dd481868eb1 selftests/memfd: add test for mapping write-sealed memfd read-only
    2e4179698f84 mm: reinstate ability to map write-sealed memfd mappings read-only
    87a75f68eaba mm: update memfd seal write check to include F_SEAL_WRITE
    17c5d49beb6c mm: drop the assumption that VM_SHARED always implies writable
    440d36847a12 mptcp: pm: kernel: flush: do not reset ADD_ADDR limit
    253b7d8bafe6 mptcp: drop skb if MPTCP skb extension allocation fails
    cf0a88124e35 ACPI: pfr_update: Fix the driver update version check
    3ddd55cf19ed ipv6: sr: Fix MAC comparison to be constant-time
    b117c41b0090 net, hsr: reject HSR frame if skb can't hold tag
    3afdeb96dc5f drm/amd/display: Don't overwrite dce60_clk_mgr
    39f187cbf7ed drm/amd/display: Add primary plane to commits for correct VRR handling
    74ee7445c3b6 drm/amdkfd: Destroy KFD debugfs after destroy KFD wq
    627f30a328f2 drm/amdgpu: update mmhub 3.0.1 client id mappings
    a3201e3b7cf1 drm/amdgpu: Avoid extra evict-restore process.
    0e7f5f9aa498 drm/amd: Restore cached power limit during resume
    002860142ceb media: venus: venc: Clamp param smaller than 1fps and bigger than 240
    f866778583b6 media: venus: vdec: Clamp param smaller than 1fps and bigger than 240.
    f54be97bc69b media: venus: protect against spurious interrupts during probe
    041015a46597 media: venus: hfi: explicitly release IRQ during teardown
    ba567c2e52fb media: venus: Add a check for packet size after reading from shared memory
    03c0e00ccf59 media: qcom: camss: cleanup media device allocated resource on error path
    3c0e4cc4f55f media: ivsc: Fix crash at shutdown due to missing mei_cldev_disable() calls
    61f267b77dbc media: ov2659: Fix memory leaks in ov2659_probe()
    1c2769dc8025 media: rainshadow-cec: fix TOCTOU race condition in rain_interrupt()
    3d83d0b5ae50 media: usbtv: Lock resolution while streaming
    ecb7382089bc media: v4l2-ctrls: Don't reset handler's error in v4l2_ctrl_handler_free()
    b3433cffee8d media: verisilicon: Fix AV1 decoder clock frequency
    6a41dc143e3c media: vivid: fix wrong pixel_array control size
    8ad57bd4a952 media: imx: fix a potential memory leak in imx_media_csc_scaler_device_init()
    c231d1964878 media: hi556: correct the test pattern configuration
    0148fcdd9140 media: gspca: Add bounds checking to firmware parser
    85bfcb0e40fe parisc: Update comments in make_insert_tlb
    9827b2b0c64e parisc: Try to fixup kernel exception in bad_area_nosemaphore path of do_page_fault()
    8bccf47adbf6 parisc: Revise gateway LWS calls to probe user read access
    4c981077255a parisc: Revise __get_user() to probe user read access
    d6ac1e11c4a0 parisc: Rename pte_needs_flush() to pte_needs_cache_flush() in cache.c
    033605fb20a3 parisc: Makefile: explain that 64BIT requires both 32-bit and 64-bit compilers
    69cf90e5aa50 parisc: Drop WARN_ON_ONCE() from flush_cache_vmap
    0199adb6d1f2 parisc: Define and use set_pte_at()
    b334724f6b31 parisc: Check region is readable by user in raw_copy_from_user()
    fe0886c98b63 soc/tegra: pmc: Ensure power-domains are in a known state
    41f40038de62 jbd2: prevent softlockup in jbd2_log_do_checkpoint()
    92ef491b506a f2fs: fix to avoid out-of-boundary access in dnode page
    5d109edb38c9 phy: qcom: phy-qcom-m31: Update IPQ5332 M31 USB phy initialization sequence
    adb482170045 vhost/vsock: Avoid allocating arbitrarily-sized SKBs
    ee438c492b2e vsock/virtio: Validate length in packet header before skb_put()
    6ee4578274d1 PCI: endpoint: Fix configfs group removal on driver teardown
    0758862386f1 PCI: endpoint: Fix configfs group list head handling
    d1f59c792c6f mtd: rawnand: renesas: Add missing check after DMA map
    fcb12d1e4163 mtd: rawnand: fsmc: Add missing check after DMA map
    9de4819feef9 mtd: spinand: propagate spinand_wait() errors from spinand_write_page()
    b9e9afc35a89 mtd: spi-nor: Fix spi_nor_try_unlock_all()
    749ccc175ca5 hwmon: (gsc-hwmon) fix fan pwm setpoint show functions
    747977aeefd4 pwm: mediatek: Fix duty and period setting
    070236488cc9 pwm: mediatek: Handle hardware enable and clock enable separately
    cbf3815d8c11 pwm: imx-tpm: Reset counter if CMOD is 0
    aa48271f7bef wifi: ath11k: fix dest ring-buffer corruption when ring is full
    ee3c10c9738b wifi: ath11k: fix source ring-buffer corruption
    069819aa84d2 wifi: ath11k: fix dest ring-buffer corruption
    daa2b66fa569 wifi: ath12k: fix dest ring-buffer corruption when ring is full
    bfd4918b2b9b wifi: ath12k: fix source ring-buffer corruption
    b5b6201a2b75 wifi: ath12k: fix dest ring-buffer corruption
    97e07460ba85 wifi: brcmsmac: Remove const from tbl_ptr parameter in wlc_lcnphy_common_read_table()
    296bcff76d41 iio: adc: ad_sigma_delta: change to buffer predisable
    50e823a23816 iio: imu: bno055: fix OOB access of hw_xlate array
    e22e5ac22736 zynq_fpga: use sgtable-based scatterlist wrappers
    981c845f2983 soc: qcom: mdt_loader: Ensure we don't read past the ELF header
    bfa87a2cafb5 ata: libata-scsi: Fix CDL control
    6f5d34088250 scsi: ufs: ufs-pci: Fix default runtime and system PM levels
    03d559670ccd scsi: ufs: ufs-pci: Fix hibernate state transition for Intel MTL-like host controllers
    8247c4269acb ata: libata-scsi: Fix ata_to_sense_error() status handling
    728abc895294 scsi: mpi3mr: Fix race between config read submit and interrupt completion
    78f1d313442c dt-bindings: display: sprd,sharkl3-dsi-host: Fix missing clocks constraints
    c4adc491a326 dt-bindings: display: sprd,sharkl3-dpu: Fix missing clocks constraints
    745c9b114eaf arm64: dts: ti: k3-am62-verdin: Enable pull-ups on I2C buses
    d1aca165c1f1 arm64: dts: ti: k3-am62a7-sk: fix pinmux for main_uart1
    06c3fda2bda8 arm64: dts: ti: k3-pinctrl: Enable Schmitt Trigger by default
    2fdddc181262 btrfs: zoned: fix write time activation failure for metadata block group
    5fc0345e1af3 ext4: fix hole length calculation overflow in non-extent inodes
    e0bb195aea7a ext4: use kmalloc_array() for array space allocation
    173270d9fe86 ext4: don't try to clear the orphan_present feature block device is r/o
    d387cee49cfe ext4: fix reserved gdt blocks handling in fsmap
    052cd20d8d75 ext4: fix fsmap end of range reporting with bigalloc
    ab1cc862e55e ext4: check fast symlink for ea_inode correctly
    d0570a5b9ccc tracing: fprobe-event: Sanitize wildcard for fprobe event name
    d9e157fcfebc ksmbd: extend the connection limiting mechanism to support IPv6
    a1d2bab4d533 ksmbd: fix refcount leak causing resource not released
    820949bbf33f Revert "vgacon: Add check for vc_origin address range in vgacon_scroll()"
    5858448a6c65 crypto: qat - flush misc workqueue during device shutdown
    fd2844179567 crypto: qat - lower priority for skcipher and aead algorithms
    ea95d4e8a263 lib/crypto: mips/chacha: Fix clang build and remove unneeded byteswap
    c82ad93be639 vt: defkeymap: Map keycodes above 127 to K_HOLE
    c0942ce38843 vt: keyboard: Don't process Unicode characters in K_OFF mode
    5e17429679a8 bus: mhi: host: Detect events pointing to unexpected TREs
    38de63c2876e bus: mhi: host: Fix endianness of BHI vector table
    e192ebb7521c usb: dwc3: meson-g12a: fix device leaks at unbind
    d52ad077933f usb: musb: omap2430: fix device leak at unbind
    21c400de1079 usb: gadget: udc: renesas_usb3: fix device leak at unbind
    295425f52052 usb: atm: cxacru: Merge cxacru_upload_firmware() into cxacru_heavy_init()
    e06e9ef1912c m68k: Fix lost column on framebuffer debug console
    b4b21367cb9c platform/chrome: cros_ec: Unregister notifier in cros_ec_unregister()
    1bf5cc1edb37 cpufreq: armada-8k: Fix off by one in armada_8k_cpufreq_free_table()
    cb7b3633ed74 serial: 8250: fix panic due to PSLVERR
    2328010117d0 rcu: Fix racy re-initialization of irq_work causing hangs
    049874a185aa HID: apple: avoid setting up battery timer for devices without battery
    05a40e70ff5a HID: magicmouse: avoid setting up battery timer when not needed
    5661fdd218c2 RDMA/siw: Fix the sendmsg byte count in siw_tcp_sendpages
    b9669bedc63d tools/nolibc: fix spelling of FD_SETBITMASK in FD_* macros
    fdd1c9f78c24 media: uvcvideo: Do not mark valid metadata as invalid
    8f274e2b05fd media: venus: Fix OOB read due to missing payload bound check
    a97e062e4ff3 media: uvcvideo: Fix 1-byte out-of-bounds read in uvc_parse_format()
    1da95d3d4b7b mm/kmemleak: avoid deadlock by moving pr_warn() outside kmemleak_lock
    e21a3ddd5873 mm/kmemleak: avoid soft lockup in __kmemleak_do_cleanup()
    74fb3b1b335b parisc: Makefile: fix a typo in palo.conf
    2a70cbd1aef8 hv_netvsc: Fix panic during namespace deletion with VF
    27b118aebdd8 fbdev: Fix vmalloc out-of-bounds write in fast_imageblit
    f83d4c81bda3 btrfs: do not allow relocation of partially dropped subvolumes
    77e07f7226f4 btrfs: zoned: do not select metadata BG as finish target
    6b801da8e146 btrfs: fix log tree replay failure due to file with 0 links and extents
    a002525b2fd7 btrfs: clear dirty status from extent buffer on error at insert_new_root()
    99e36ff41a74 btrfs: zoned: do not remove unwritten non-data block group
    e02bdb223399 btrfs: abort transaction during log replay if walk_log_tree() failed
    ec5bfcfb6e0d btrfs: zoned: use filesystem size not disk size for reclaim decision
    9dfe40cb6c2c cdc-acm: fix race between initial clearing halt and open
    729ac69a3e81 thunderbolt: Fix copy+paste error in match_service_id()
    5c4a2ffcbd05 comedi: fix race between polling and detaching
    e613904fa419 usb: typec: ucsi: Update power_supply on power role change
    ca9fb654f89b misc: rtsx: usb: Ensure mmc child device is active when card is present
    5badd56c711e usb: core: config: Prevent OOB read in SS endpoint companion parsing
    492207cf8372 ext4: fix largest free orders lists corruption on mb_optimize_scan switch
    88d02c333989 ext4: fix zombie groups in average fragment size lists
    d19b817540c0 iommufd: Prevent ALIGN() overflow
    2ccccb0e4178 iommufd: Report unmapped bytes in the error path of iopt_unmap_iova_range
    a11b6ee7cab8 iommu/arm-smmu-qcom: Add SM6115 MDSS compatible
    7e0c0664e9aa cifs: reset iface weights when we cannot find a candidate
    1b6310d14b13 drm/amdgpu: fix incorrect vm flags to map bo
    3fbc2e43ab12 ASoC: fsl_sai: replace regmap_write with regmap_update_bits
    8270fbcc1ec4 scsi: lpfc: Remove redundant assignment to avoid memory leak
    063fe9b16be1 rtc: ds1307: remove clear of oscillator stop flag (OSF) in probe
    24334f3cf8a2 pNFS: Fix uninited ptr deref in block/scsi layout
    198f26c55779 pNFS: Handle RPC size limit for layoutcommits
    2c5b079bcb31 pNFS: Fix disk addr range check in block/scsi layout
    cf949a960653 pNFS: Fix stripe mapping in block/scsi layout
    3b9d69f0e68a block: avoid possible overflow for chunk_sectors check in blk_stack_limits()
    1df5970cd93d ASoC: Intel: avs: Fix uninitialized pointer error in probe()
    f2e480950d1c net: phy: smsc: add proper reset flags for LAN8710A
    6b93ab1ad84a ipmi: Fix strcpy source and destination the same
    9da4d5c3ea6b kconfig: lxdialog: fix 'space' to (de)select options
    44337363300f kconfig: gconf: fix potential memory leak in renderer_edited()
    e55c6f052032 kconfig: gconf: avoid hardcoding model2 in on_treeview2_cursor_changed()
    933992c60c07 ipmi: Use dev_warn_ratelimited() for incorrect message warnings
    2e07a9fe5117 vfio/mlx5: fix possible overflow in tracking max message size
    48d7bdd8759c scsi: aacraid: Stop using PCI_IRQ_AFFINITY
    0787a522cc9c scsi: target: core: Generate correct identifiers for PR OUT transport IDs
    a40c4af8083d scsi: Fix sas_user_scan() to handle wildcard and multi-channel scans
    28d64271510e kconfig: nconf: Ensure null termination where strncpy is used
    106ab3cd026f vfio/type1: conditional rescheduling while pinning
    98b7b47cebe3 kconfig: lxdialog: replace strcpy() with strncpy() in inputbox.c
    b45134f72642 f2fs: check the generic conditions first
    868f23286c1a exfat: add cluster chain loop check for dir
    6af18148675f i2c: Force DLL0945 touchpad i2c freq to 100khz
    f8c001884bb4 apparmor: use the condition in AA_BUG_FMT even with debug disabled
    dd45d42ab290 dm-table: fix checking for rq stackable devices
    f4133dc2b93d dm-mpath: don't print the "loaded" message if registering fails
    cf4a40ad2116 i3c: master: Initialize ret in i3c_i2c_notifier_call()
    4e24a6a42d91 i3c: don't fail if GETHDRCAP is unsupported
    2e487c0fdeb9 apparmor: shift ouid when mediating hard links in userns
    ef8814a9d64a rtc: ds1307: handle oscillator stop flag (OSF) for ds1341
    6e3733fe88a0 i3c: add missing include to internal header
    6dd90afb3945 module: Prevent silent truncation of module name in delete_module(2)
    d386c8e4e587 md: dm-zoned-target: Initialize return variable r to avoid uninitialized use
    b0cab3d9c70d soundwire: Move handle_nested_irq outside of sdw_dev_lock
    1e3697578567 soundwire: amd: serialize amd manager resume sequence during pm_prepare
    d2974cfd4fa6 crypto: octeontx2 - add timeout for load_fvc completion poll
    ae5a0993f1e4 media: uvcvideo: Fix bandwidth issue for Alcor camera
    6bbaec6a0369 media: dvb-frontends: w7090p: fix null-ptr-deref in w7090p_tuner_write_serpar and w7090p_tuner_read_serpar
    09906650484a media: dvb-frontends: dib7090p: fix null-ptr-deref in dib7090p_rw_on_apb()
    77ac2addb1dc media: usb: hdpvr: disable zero-length read messages
    1512ced62c87 media: tc358743: Increase FIFO trigger level to 374
    9b023149b97a media: tc358743: Return an appropriate colorspace from tc358743_set_fmt
    5c809ef89e1b media: tc358743: Check I2C succeeded during probe
    815cb5818eef pinctrl: stm32: Manage irq affinity settings
    67bca5b04313 scsi: mpi3mr: Correctly handle ATA device errors
    80726da54c29 scsi: mpt3sas: Correctly handle ATA device errors
    924226822419 power: supply: qcom_battmgr: Add lithium-polymer entry
    7925dd68807c scsi: lpfc: Check for hdwq null ptr when cleaning up lpfc_vport structure
    8c449e588d81 RDMA/core: reduce stack using in nldev_stat_get_doit()
    89fdac333a17 RDMA: hfi1: fix possible divide-by-zero in find_hw_thread_mask()
    773612b1edf3 dmaengine: stm32-dma: configure next sg only if there are more than 2 sgs
    01c412e31d98 leds: leds-lp50xx: Handle reg to get correct multi_index
    07cba8891f2c media: v4l2-common: Reduce warnings about missing V4L2_CID_LINK_FREQ control
    f54eacb5b7f8 MIPS: lantiq: falcon: sysctrl: fix request memory check logic
    f22de2027b20 MIPS: Don't crash in stack_top() for tasks without ABI or vDSO
    9021924d8893 crypto: jitter - fix intermediary handling
    173cfd741ad7 jfs: upper bound check of tree index in dbAllocAG
    78989af5bbf5 jfs: Regular file corruption check
    34d8e982bac4 jfs: truncate good inode pages when hard link is 0
    39cfe2c83146 scsi: bfa: Double-free fix
    2b98d2c23317 watchdog: iTCO_wdt: Report error if timeout configuration fails
    7fe9533fb069 MIPS: vpe-mt: add missing prototypes for vpe_{alloc,start,stop,free}
    6caa737a77a5 clk: qcom: ipq5018: keep XO clock always on
    16e245176777 hwmon: (emc2305) Set initial PWM minimum value during probe based on thermal state
    d202efb10a4b watchdog: dw_wdt: Fix default timeout
    478bd3bc4e7f fs/orangefs: use snprintf() instead of sprintf()
    66a373f50b42 scsi: libiscsi: Initialize iscsi_conn->dd_data only if memory is allocated
    4db46a83d817 phy: rockchip-pcie: Properly disable TEST_WRITE strobe signal
    41368857a354 mfd: axp20x: Set explicit ID for AXP313 regulator
    6c9e12fef997 clk: tegra: periph: Fix error handling and resolve unsigned compare warning
    d960f4b79391 ext4: do not BUG when INLINE_DATA_FL lacks system.data xattr
    de6af003239a crypto: hisilicon/hpre - fix dma unmap sequence
    cbe740de32bb fbdev: fix potential buffer overflow in do_register_framebuffer()
    6daa13c20190 cifs: Fix calling CIFSFindFirst() for root path without msearch
    74e7af8334c9 watchdog: sbsa: Adjust keepalive timeout to avoid MediaTek WS0 race condition
    3a5236c610e2 drm/amd/display: Avoid configuring PSR granularity if PSR-SU not supported
    8708914f05ec drm/amd/display: Only finalize atomic_obj if it was initialized
    110822d339a0 vhost: fail early when __vhost_add_used() fails
    c2bdb45f366a vsock/virtio: Resize receive buffers so that each SKB fits in a 4K page
    bc9ef9783c6b net: dsa: b53: fix IP_MULTICAST_CTRL on BCM5325
    e7a375453cca rcu: Fix rcu_read_unlock() deadloop due to IRQ work
    58ed3ac8538c drm/ttm: Respect the shrinker core free target
    39de3ce65635 drm/amd/display: Avoid trying AUX transactions on disconnected ports
    d02ee5eebbcf selftests/bpf: Fix a user_ringbuf failure with arm64 64KB page size
    c03a532fe1d3 bpf: Make reg_not_null() true for CONST_PTR_TO_MAP
    86f3cff54956 uapi: in6: restore visibility of most IPv6 socket options
    3c9ca275100e drm/ttm: Should to return the evict error
    e4b67ceb8634 drm: renesas: rz-du: mipi_dsi: Add min check for VCLK range
    1df5e6eb71e4 net: ncsi: Fix buffer overflow in fetching version id
    859c54bb0120 ionic: clean dbpage in de-init
    ec33caca7662 wifi: rtlwifi: fix possible skb memory leak in _rtl_pci_init_one_rxdesc()
    c2e719bcaa26 ptp: Use ratelimite for freerun error message
    868b52651f69 bpftool: Fix JSON writer resource leak in version command
    d930e738c0a8 net: dsa: b53: prevent SWITCH_CTRL access on BCM5325
    8609f3c44e27 net: dsa: b53: prevent DIS_LEARNING access on BCM5325
    bc0e01d663f4 net: dsa: b53: prevent GMII_PORT_OVERRIDE_CTRL access on BCM5325
    668280aa65fc net: dsa: b53: fix b53_imp_vlan_setup for BCM5325
    7f36d13d5243 gve: Return error for unknown admin queue command
    a1172cbfe51c net: vlan: Replace BUG() with WARN_ON_ONCE() in vlan_dev_* stubs
    8d1f4798c876 net: vlan: Make is_vlan_dev() a stub when VLAN is not configured
    63acb8e26620 drm/amd: Allow printing VanGogh OD SCLK levels without setting dpm to manual
    50dbeff47178 dpaa_eth: don't use fixed_phy_change_carrier
    7c299d0bc983 neighbour: add support for NUD_PERMANENT proxy entries
    a70c31416ddd wifi: iwlegacy: Check rate_idx range after addition
    ad8742e2d1da netmem: fix skb_frag_address_safe with unreadable skbs
    88517afa7401 powerpc: floppy: Add missing checks after DMA map
    eb1e1526b82b wifi: ath12k: Decrement TID on RX peer frag setup error handling
    9874a00ba22b wifi: ath12k: Enable REO queue lookup table feature on QCN9274 hw2.0
    afb39537d894 wifi: rtlwifi: fix possible skb memory leak in `_rtl_pci_rx_interrupt()`.
    c387d8fcd330 wifi: mac80211: update radar_required in channel context after channel switch
    cf48c230a17a drm/amd/display: Fix 'failed to blank crtc!'
    c43b6b0a8342 wifi: iwlwifi: fw: Fix possible memory leak in iwl_fw_dbg_collect
    83aba958e33f wifi: iwlwifi: dvm: fix potential overflow in rs_fill_link_cmd()
    5c942d80f3e8 wifi: ath12k: Add memset and update default rate value in wmi tx completion
    9febff30eb52 drm/amd/display: Separate set_gsl from set_gsl_source_select
    f2a4ca5397f5 net: fec: allow disable coalescing
    b3472b9d9d42 net: atlantic: add set_power to fw_ops for atl2 to fix wol
    3d8090bb5342 xfrm: Duplicate SPI Handling
    81667abecebc net: thunderbolt: Fix the parameter passing of tb_xdomain_enable_paths()/tb_xdomain_disable_paths()
    99f142ec75dd net: thunderbolt: Enable end-to-end flow control also in transmit
    bdd66b918215 kselftest/arm64: Specify SVE data when testing VL set in sve-ptrace
    b6c39aaa85c4 wifi: mt76: mt7915: mcu: re-init MCU before loading FW patch
    51eb6a5f209b wifi: rtw89: Disable deep power saving for USB/SDIO
    ecf449ef73a5 wifi: rtw89: Fix rtw89_mac_power_switch() for USB
    f3d4fa12d6b0 drm/msm: use trylock for debugfs
    e457e0560b55 wifi: mac80211: fix rx link assignment for non-MLO stations
    f7bc50927b4e ipv6: mcast: Check inet6_dev->dead under idev->mc_lock in __ipv6_dev_mc_inc().
    5a9b21808323 (powerpc/512) Fix possible `dma_unmap_single()` on uninitialized pointer
    ffa3a8007d2f wifi: mac80211: don't complete management TX on SAE commit
    c73e54dba107 sched/fair: Bump sd->max_newidle_lb_cost when newidle balance fails
    3f8bcc32050e s390/stp: Remove udelay from stp_sync_clock()
    11238e68cb68 wifi: iwlwifi: mvm: fix scan request validation
    6cd174be9239 um: Re-evaluate thread flags repeatedly
    dae6099edf91 wifi: iwlwifi: mvm: set gtk id also in older FWs
    8baba93e2e95 perf/cxlpmu: Remove unintended newline from IRQ name format string
    05ee035af6d8 net: phy: micrel: Add ksz9131_resume()
    fd6a21638a1e net: thunderx: Fix format-truncation warning in bgx_acpi_match_id()
    c133a9327d2d net: ipv4: fix incorrect MTU in broadcast routes
    606908835bc4 wifi: cfg80211: Fix interface type validation
    a4d2cdb31cf4 net: mctp: Prevent duplicate binds
    b55947b725f1 rcu: Protect ->defer_qs_iw_pending from data race
    e424653498e4 arm64: Mark kernel as tainted on SAE and SError panic
    ac361868f134 net/mlx5e: Properly access RCU protected qdisc_sleeping variable
    d1c8d2426a63 net: ag71xx: Add missing check after DMA map
    b0862e88b887 et131x: Add missing check after DMA map
    72cdcaeaa95b wifi: rtw89: Lower the timeout in rtw89_fw_read_c2h_reg() for USB
    b16dfa7b4c94 be2net: Use correct byte order and format string for TCP seq and ack_seq
    d46484e9dbb2 s390/time: Use monotonic clock in get_cycles()
    65b7c838736d wifi: cfg80211: reject HTC bit for management frames
    7eb1e485bc84 ktest.pl: Prevent recursion of default variable options
    30cad8797805 wifi: ath12k: Correct tid cleanup when tid setup fails
    5d3559880e9c net: usb: cdc-ncm: check for filtering capability
    8f5015143227 xen/netfront: Fix TX response spurious interrupts
    5ac23fc080be Bluetooth: hci_sock: Reset cookie to zero in hci_sock_free_cookie()
    b84f88749ecf powerpc/thp: tracing: Hide hugepage events under CONFIG_PPC_BOOK3S_64
    245d23754f5b ASoC: qcom: use drvdata instead of component to keep id
    c3d3492b12dd ASoC: codecs: rt5640: Retry DEVICE_ID verification
    70b3c831cfea iio: adc: ad7768-1: Ensure SYNC_IN pulse minimum timing requirement
    2925edfa98f7 ALSA: usb-audio: Avoid precedence issues in mixer_quirks macros
    2f81d6e98f32 ALSA: pcm: Rewrite recalculate_boundary() to avoid costly loop
    0de69bc9b366 ALSA: hda/ca0132: Fix buffer overflow in add_tuning_control
    7731b7d596c5 platform/chrome: cros_ec_typec: Defer probe on missing EC parent
    8c046583a234 platform/x86: thinkpad_acpi: Handle KCOV __init vs inline mismatches
    c2c252d2c180 soc: qcom: mdt_loader: Actually use the e_phoff
    7589729947aa imx8m-blk-ctrl: set ISI panic write hurry level
    ac62b8f82b24 pm: cpupower: Fix the snapshot-order of tsc,mperf, clock in mperf_stop()
    454a27cbab9b usb: core: usb_submit_urb: downgrade type check
    0455858931ff usb: typec: intel_pmc_mux: Defer probe if SCU IPC isn't present
    41f53afe53a5 ASoC: core: Check for rtd == NULL in snd_soc_remove_pcm_runtime()
    789aa0b98854 ALSA: intel8x0: Fix incorrect codec index usage in mixer for ICH4
    2828f2c4f2e9 ASoC: hdac_hdmi: Rate limit logging on connection and disconnection
    b80d6972859b x86/bugs: Avoid warning when overriding return thunk
    16cdf4f5b959 ALSA: hda: Disable jack polling at shutdown
    240e611b784d ALSA: hda: Handle the jack polling always via a work
    d54d1405f2c6 mmc: rtsx_usb_sdmmc: Fix error-path in sd_set_power_mode()
    24f4ceeaeee7 mei: bus: Check for still connected devices in mei_cl_bus_dev_release()
    a29868db6dcf char: misc: Fix improper and inaccurate error code returned by misc_init()
    f8818e29d268 reset: brcmstb: Enable reset drivers for ARCH_BCM2835
    ff28f5dc3872 pps: clients: gpio: fix interrupt handling order in remove path
    d9d611639bea ACPI: APEI: GHES: add TAINT_MACHINE_CHECK on GHES panic path
    d3dd520206bd mmc: sdhci-msm: Ensure SD card power isn't ON when card removed
    f95174d4d5c4 ACPI: processor: fix acpi_object initialization
    e656c2db4922 PM: sleep: console: Fix the black screen issue
    753cd9f3d396 thermal: sysfs: Return ENODATA instead of EAGAIN for reads
    64d78290599a PM: runtime: Clear power.needs_force_resume in pm_runtime_reinit()
    5aa770f45da7 firmware: tegra: Fix IVC dependency problems
    ab3bf61d9351 ACPI: PRM: Reduce unnecessary printing to avoid user confusion
    783a726d509e selftests: tracing: Use mutex_unlock for testing glob filter
    6ec6282acd89 tools/build: Fix s390(x) cross-compilation with clang
    46b3a7a3a36d ARM: tegra: Use I/O memcpy to write to IRAM
    149b733d5f80 gpio: tps65912: check the return value of regmap_update_bits()
    3c3454b02c62 iio: adc: ad_sigma_delta: don't overallocate scan buffer
    0a4757bf988e tools/nolibc: define time_t in terms of __kernel_old_time_t
    58a39eda7f95 thermal/drivers/qcom-spmi-temp-alarm: Enable stage 2 shutdown when required
    cfa9b873a29c ASoC: soc-dapm: set bias_level if snd_soc_dapm_set_bias_level() was successed
    7423fc4da94d EDAC/synopsys: Clear the ECC counters on init
    f53e16dde8ad PM / devfreq: governor: Replace sscanf() with kstrtoul() in set_freq_store()
    d7d6d076ee95 ARM: rockchip: fix kernel hang during smp initialization
    6a8b0c7e93df cpufreq: Exit governor when failed to start old governor
    20bbe54f454f gpio: wcd934x: check the return value of regmap_update_bits()
    6b8a8eac58a9 remoteproc: imx_rproc: skip clock enable when M-core is managed by the SCU
    082735fbcdb6 ACPI: APEI: send SIGBUS to current task if synchronous memory error not recovered
    84518ec7f928 soc: qcom: rpmh-rsc: Add RSC version 4 support
    16a5088670e6 usb: xhci: Avoid showing errors during surprise removal
    dabf502ee893 usb: xhci: Set avg_trb_len = 8 for EP0 during Address Device Command
    4a62f49f3d04 usb: xhci: Avoid showing warnings for dying controller
    6cd81d4ffbaa usb: typec: ucsi: psy: Set current max to 100mA for BC 1.2 and Default
    b2ba2ad06d8a selftests/futex: Define SYS_futex on 32-bit architectures with 64-bit time_t
    146262a48be2 cpufreq: CPPC: Mark driver with NEED_UPDATE_LIMITS flag
    f5611a58f7af platform/x86/amd: pmc: Add Lenovo Yoga 6 13ALC6 to pmc quirk list
    2d32f522c33a usb: xhci: print xhci->xhc_state when queue_command failed
    839312bff2c9 tracefs: Add d_delete to remove negative dentries
    d7e28036b0e9 securityfs: don't pin dentries twice, once is enough...
    270ea0b61725 fix locking in efi_secret_unlink()
    327276cb8a7e ext2: Handle fiemap on empty files to prevent EINVAL
    6c7fadac6cbc fs/ntfs3: correctly create symlink for relative path
    3572737a768d fs/ntfs3: Add sanity check for file name
    934065fd3024 ata: libata-sata: Disallow changing LPM state if not supported
    847a204d3067 better lockdep annotations for simple_recursive_removal()
    cb7b59560400 hfs: fix not erasing deleted b-tree node issue
    9f53b2433ad2 drbd: add missing kref_get in handle_write_conflicts
    5a1e1ab83796 udf: Verify partition map count
    ce8da5d13d8c loop: Avoid updating block size under exclusive owner
    3d2c05cbc6a3 gfs2: Set .migrate_folio in gfs2_{rgrp,meta}_aops
    524ce0f943d7 nvme-pci: try function level reset on init failure
    1e858a7a51c7 smb/server: avoid deadlock when linking with ReplaceIfExists
    61ad294996c0 arm64: Handle KCOV __init vs inline mismatches
    b3359392b753 hfsplus: don't use BUG_ON() in hfsplus_create_attributes_file()
    291bb5d931c6 hfsplus: fix slab-out-of-bounds read in hfsplus_uni2asc()
    8583d067ae22 hfsplus: fix slab-out-of-bounds in hfsplus_bnode_read()
    384a66b89f95 hfs: fix slab-out-of-bounds in hfs_bnode_read()
    4f032979b63a hfs: fix general protection fault in hfs_find_init()
    f1fe99919f62 tls: handle data disappearing from under the TLS ULP
    acfb4da42fc4 ptp: prevent possible ABBA deadlock in ptp_clock_freerun()
    7337a6356dff cpuidle: governors: menu: Avoid using invalid recent intervals data
    c11f3802d349 intel_idle: Allow loading ACPI tables for any family
    ea094f38d387 sctp: linearize cloned gso packets in sctp_rcv
    7f94af487c7f net: ti: icss-iep: Fix incorrect type for return value in extts_enable()
    30cf81105855 netfilter: ctnetlink: fix refcount leak on table dump
    19e01bc8c1ac udp: also consider secpath when evaluating ipsec use for checksumming
    e65ad9a14256 KVM: VMX: Preserve host's DEBUGCTLMSR_FREEZE_IN_SMM while running the guest
    91fa23d5b9e5 KVM: VMX: Wrap all accesses to IA32_DEBUGCTL with getter/setter APIs
    8867d91ef824 KVM: nVMX: Check vmcs12->guest_ia32_debugctl on nested VM-Enter
    d1e28ef79b43 KVM: VMX: Extract checking of guest's DEBUGCTL into helper
    48ebed8bd66b KVM: VMX: Allow guest to set DEBUGCTL.RTM_DEBUG if RTM is supported
    ec70c3f25777 KVM: x86: Drop kvm_x86_ops.set_dr6() in favor of a new KVM_RUN flag
    0d87da9d6065 KVM: x86: Convert vcpu_run()'s immediate exit param into a generic bitmap
    d5aa9bb5e348 KVM: x86: Fully defer to vendor code to decide how to force immediate exit
    62f586df29ca KVM: VMX: Handle KVM-induced preemption timer exits in fastpath for L2
    ca3cc405a3bc KVM: x86: Move handling of is_guest_mode() into fastpath exit handlers
    1c1158aceaf2 KVM: VMX: Handle forced exit due to preemption timer in fastpath
    1fc288e74cf3 KVM: VMX: Re-enter guest in fastpath for "spurious" preemption timer exits
    baf9c96e4e9d KVM: x86: Plumb "force_immediate_exit" into kvm_entry() tracepoint
    a1d4091f94c6 KVM: x86: Snapshot the host's DEBUGCTL after disabling IRQs
    76025761e8f3 KVM: x86: Snapshot the host's DEBUGCTL in common x86
    cf04778ae1b5 KVM: nVMX: Defer SVI update to vmcs01 on EOI when L2 is active w/o VID
    ebc281bf14aa KVM: x86: Plumb in the vCPU to kvm_x86_ops.hwapic_isr_update()
    abe3d6a559f9 KVM: SVM: Set RFLAGS.IF=1 in C code, to get VMRUN out of the STI shadow
    d5784ea45663 KVM: x86/hyper-v: Skip non-canonical addresses during PV TLB flush
    edc450030b20 smb: client: don't wait for info->send_pending == 0 on error
    429112e9709b smb: client: let send_done() cleanup before calling smbd_disconnect_rdma_connection()
    19849010c9e1 ACPI: processor: perflib: Move problematic pr->performance check
    cb2e6e275d19 ACPI: processor: perflib: Fix initial _PPC limit application
    8c09ad855fbf Documentation: ACPI: Fix parent device references
    2a0c0c974bea eventpoll: Fix semi-unbounded recursion
    237e416eb621 fs: Prevent file descriptor table allocations exceeding INT_MAX
    a5ff67c66208 sunvdc: Balance device refcount in vdc_port_mpgroup_check
    17c010fe45de LoongArch: BPF: Fix jump offset calculation in tailcall
    d89d47abbad2 PCI: Extend isolated function probing to LoongArch
    987c20428f06 NFS: Fix the setting of capabilities when automounting a new filesystem
    f0b89916d2fe NFSD: detect mismatch of file handle and delegation stateid in OPEN op
    d71abd1ae4e0 nfsd: handle get_client_locked() failure in nfsd4_setclientid_confirm()
    3b53dc1c641f io_uring/net: commit partial buffers on retry
    ccef5ee4adf5 net: usb: asix_devices: add phy_mask for ax88772 mdio bus
    eb2d79333f79 net: dpaa: fix device leak when querying time stamp info
    fd5c51a187ba net: ti: icss-iep: fix device and OF node leaks at probe
    5daff127b292 net: mtk_eth_soc: fix device leak at probe
    9adaf9a04f9a net: enetc: fix device and OF node leak at probe
    dc395c838610 net: gianfar: fix device leak when querying time stamp info
    8dae82f81e34 net: phy: micrel: fix KSZ8081/KSZ8091 cable test
    346c820ef513 netlink: avoid infinite retry looping in netlink_unicast()
    c66caf21b1d0 Revert "leds: trigger: netdev: Configure LED blink interval for HW offload"
    16a46f2e84d7 gpio: mlxbf3: use platform_get_irq_optional()
    c1aa0743e54b Revert "gpio: mlxbf3: only get IRQ for device instance 0"
    a157478521b3 gpio: mlxbf2: use platform_get_irq_optional()
    50ae9f2d90b2 gpio: virtio: Fix config space reading.
    217e18011663 smb: client: remove redundant lstrp update in negotiate protocol
    a0620e152566 smb3: fix for slab out of bounds on mount to ksmbd
    d63e929bac53 ALSA: hda/realtek: Add Framework Laptop 13 (AMD Ryzen AI 300) to quirks
    fb5000cfd7bc ALSA: hda/realtek: Fix headset mic on HONOR BRB-X
    1034719fdefd ALSA: usb-audio: Validate UAC3 cluster segment descriptors
    07c8d78dbb5e ALSA: usb-audio: Validate UAC3 power domain descriptors, too
    17a66aef7ddc io_uring: don't use int for ABI

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index bb92f98616..b5e4700d83 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "5a1f8bcc75b8f9d5a7fca6cb99a103f8333d7dc5"
-SRCREV_meta ?= "f3c786ad20e66517d28812760a884ac3d5dda3db"
+SRCREV_machine ?= "7ea3f3274ce1ada089f38f1e5bd6167500084acf"
+SRCREV_meta ?= "6a511f37e5360c6694ef592ad4fcae2630378ef5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.102"
+LINUX_VERSION ?= "6.6.103"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index b8fcd47971..454a9c3102 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.102"
+LINUX_VERSION ?= "6.6.103"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "25e12cc47d631ed5ba46a6a07acf85d7e1175fad"
-SRCREV_meta ?= "f3c786ad20e66517d28812760a884ac3d5dda3db"
+SRCREV_machine ?= "79a205036af6ef1c4d83a1613d5b206ae7b510fa"
+SRCREV_meta ?= "6a511f37e5360c6694ef592ad4fcae2630378ef5"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 3a99ce4f1e..be5c3510fc 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "465d211d5e4e5333b10eddfb597a03b340a1a8df"
-SRCREV_machine:qemuarm64 ?= "57f28ca26dd5f2d2902dd674ed9c9bfafd84139b"
-SRCREV_machine:qemuloongarch64 ?= "b5db76e52474d0ee7dbbb897cf02a2665f1a14fd"
-SRCREV_machine:qemumips ?= "286ff567d5dcee9cd0b86850b93d1315035b5ece"
-SRCREV_machine:qemuppc ?= "c4ee428a256735d175e14da9ebdfede7fa6b57b5"
-SRCREV_machine:qemuriscv64 ?= "b5db76e52474d0ee7dbbb897cf02a2665f1a14fd"
-SRCREV_machine:qemuriscv32 ?= "b5db76e52474d0ee7dbbb897cf02a2665f1a14fd"
-SRCREV_machine:qemux86 ?= "b5db76e52474d0ee7dbbb897cf02a2665f1a14fd"
-SRCREV_machine:qemux86-64 ?= "b5db76e52474d0ee7dbbb897cf02a2665f1a14fd"
-SRCREV_machine:qemumips64 ?= "dd35c2cddf4a3171b9a0d73410b6ac56780855b3"
-SRCREV_machine ?= "b5db76e52474d0ee7dbbb897cf02a2665f1a14fd"
-SRCREV_meta ?= "f3c786ad20e66517d28812760a884ac3d5dda3db"
+SRCREV_machine:qemuarm ?= "1c0e98c8258be1bf7e732fb3c792eb165099836f"
+SRCREV_machine:qemuarm64 ?= "9d19f112cf4341cd09e45ee0ed221e80c6300125"
+SRCREV_machine:qemuloongarch64 ?= "4518ac3620cf9950169ca59bcc72a93c03900f1b"
+SRCREV_machine:qemumips ?= "3f653435fd7315763428d3123883cee7c011d506"
+SRCREV_machine:qemuppc ?= "32c4d7089e3eed04893bfbb5b75cdc934e920cfd"
+SRCREV_machine:qemuriscv64 ?= "4518ac3620cf9950169ca59bcc72a93c03900f1b"
+SRCREV_machine:qemuriscv32 ?= "4518ac3620cf9950169ca59bcc72a93c03900f1b"
+SRCREV_machine:qemux86 ?= "4518ac3620cf9950169ca59bcc72a93c03900f1b"
+SRCREV_machine:qemux86-64 ?= "4518ac3620cf9950169ca59bcc72a93c03900f1b"
+SRCREV_machine:qemumips64 ?= "4f64d38b79ca252c932d017ae05a82388403e625"
+SRCREV_machine ?= "4518ac3620cf9950169ca59bcc72a93c03900f1b"
+SRCREV_meta ?= "6a511f37e5360c6694ef592ad4fcae2630378ef5"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "bb9c90ab9c5a1a933a0dfd302a3fde73642b2b06"
+SRCREV_machine:class-devupstream ?= "cc1a1c5b404a5e6ad751d0831b1991a90c3de4c5"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.102"
+LINUX_VERSION ?= "6.6.103"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


