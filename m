Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88060CA101F
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 16:09:39 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.587.1757088576581667357
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 09:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kkMYz7Kk;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-7220d7dea27so18352646d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 09:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757088575; x=1757693375; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pNeW0QEAJS5cgKS/4/bT5QT8hNsDWEReg+dGeovgCYM=;
        b=kkMYz7Kkif0Y6Q6+kSnSzaImy307urwBpMxTHGc1CndGPZTfMWhGL4MfpNUNkQU7Cb
         Ux7sp5/Mq/hejvsEZpZ5nUNRyqBAoLNqZ1u4wIWtbmTVwYVC9GAqvK0V0/P5JF51pxVa
         IAMxe0qitouXvFRbpiBRsCwsQxJQD+yRzXDnXcWW+R9nqsbyozBQhw2erxPQjRmldCne
         5CLy2nLL4zCXSHDTLhl/Tnxvodu9OHy0GOoeUhojrfpXdyCO9Z5f17ihkemThMgy/KX3
         2KIzy27aokYTDeMuZW4XVIupfISiw0Hzn4SZ/ghULL72Xknj3OP06eP9bVQAJNOEGVMf
         dHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757088575; x=1757693375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pNeW0QEAJS5cgKS/4/bT5QT8hNsDWEReg+dGeovgCYM=;
        b=J8KXpuNKsykpgZQv2jMcPYgs/Gctz8AJYUOOYSpTR0Xoa3VUY9qbWREg0mUP7aehB7
         HqCbb+sqZBM4Zbj85SijwHhc64Vj9lp1h05jLteiLkf0HbpSUSM/D6ZM1Zrl8b1UaxLB
         nYG7HTfXoIsxZuVRjyBlFcE8TbvEtq5p19tCcFJCAED/MhB3Gg8451lJ7fFQb56Lkf9W
         uG3JCEeCVERMfIwv1p7j3AomqNNtOmD5v6/fPuqDPf/mJJy5kSuutwSziBuzvg3qre6V
         mNULmu+zOEcJjtjY9wXl3SIRLyc/SLaCT/MTYxgvkEBMvEp7dnOts8cFL7zhzbiD9bQE
         Dgew==
X-Gm-Message-State: AOJu0YyF7A8ZcgVv4W5p8oIQAtYNO2aQ6Jyq7MzCT3MnJIlRKaQyi2i/
	1naP5ZEbi0fUaEuFKRMWn3Am3Dx8ptvNcL0p7cJ5CU1+m3u9JscFL6hC9O99DNhU
X-Gm-Gg: ASbGnctbEsoOO41ANnsN/eTL7wOnACLYrl+puTP/NMpZ1mIbPW+fepZqCE6jDqw46so
	sI0378NYkDIuQzPap35mh3Bc17vBMxrm1P+xm3tQPF8DZxYofUZy4CPqsA/YgdujIi4qRkt4ywr
	Ygj36mOnBp4sknLdsOzj5hDxR8/4Cxxi/PkHC8QZZRCfC/SsELx0QeqsdB56X9bucCrBadi1Tz2
	IjFVfxHYSFA5d0JsMCc9FyHGfthA/3fgSWfvrQuKreXTtuqGSXRxnhXsl0Sy0b/s8Otn5S84+DU
	UtK6j9bbVI8uI0uooTrEYA+SenWHSZ6UQfrXh9WTOnGvt0EmtOLI360/79tB6GX7fH8X9C6NvDs
	Rltpi7ssqlPDmiCqEYw3FfV/rnVW3/lSL755R6o6dRuK499my45J/6uW8H7WtFsQESBs5cpLTZ/
	oAbl+Elf0t+Dg3w9u+3E0D1LOetf1HtdVK2CpTCXKjzwSkxYeYR8MdEd1D6S5txMqjIA==
X-Google-Smtp-Source: AGHT+IFU3lnpAGXn95liStJth82ok11O2u2KIQOg98GnCV5EIJQWponiNCq92hi2y59Sf/URc6csaQ==
X-Received: by 2002:ad4:5be9:0:b0:72f:f7d0:b0bf with SMTP id 6a1803df08f44-72ff7d0b49dmr27095906d6.7.1757088574719;
        Fri, 05 Sep 2025 09:09:34 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720ac16de30sm69127446d6.7.2025.09.05.09.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 09:09:33 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] linux-yocto/6.12: update to v6.12.44
Date: Fri,  5 Sep 2025 12:09:26 -0400
Message-Id: <49711da41bc89be1bd5001b4e1398e6c88f10438.1757088383.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1757088383.git.bruce.ashfield@gmail.com>
References: <cover.1757088383.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 16:09:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223014

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

no ids found, dumping:
    11a24528d080 Linux 6.12.44
    4edaeba45bcc alloc_fdtable(): change calling conventions.
    51e8531371f9 netfilter: nf_reject: don't leak dst refcount for loopback packets
    e133ea6dd6a7 s390/hypfs: Enable limited access during lockdown
    782a7d2ddbf2 s390/hypfs: Avoid unnecessary ioctl registration in debugfs
    ba1e8eab16d2 ALSA: usb-audio: Use correct sub-type for UAC3 feature unit validation
    66d25bb8ab0e net/mlx5e: Preserve shared buffer capacity during headroom updates
    3ef5a3a68b8f net/mlx5e: Query FW for buffer ownership
    892fe7bf7390 net/mlx5: Add IFC bits and enums for buf_ownership
    736dab2783ba net/mlx5: Relocate function declarations from port.h to mlx5_core.h
    cacc591fb03e net/mlx5: Base ECVF devlink port attrs from 0
    b510ba91ad4f Octeontx2-af: Skip overlap check for SPI field
    69c849660633 bonding: send LACPDUs periodically in passive mode after receiving partner's LACPDU
    dc17f43d9666 bonding: update LACP activity flag after setting lacp_active
    34327b362ce2 ALSA: timer: fix ida_free call while not allocated
    23ff73c9495d net/sched: Remove unnecessary WARNING condition for empty child qdisc in htb_activate
    ff57186b2cc3 net/sched: Make cake_enqueue return NET_XMIT_CN when past buffer_limit
    9bbf16b649b0 net: dsa: microchip: Fix KSZ9477 HSR port setup issue
    9b136c1e442b igc: fix disabling L1.2 PCI-E link substate on I226 on init
    e6e7966c3203 ixgbe: xsk: resolve the negative overflow of budget in ixgbe_xmit_zc
    30bf5728bb21 s390/mm: Do not map lowcore with identity mapping
    e94cdb9fb279 LoongArch: Optimize module load time by optimizing PLT/GOT counting
    995889c25886 microchip: lan865x: fix missing Timer Increment config for Rev.B0/B1
    71f6b75f1f4d microchip: lan865x: fix missing netif_start_queue() call on device open
    2e765ba0ee0e net/smc: fix UAF on smcsk after smc_listen_out()
    a7efffeecb88 gve: prevent ethtool ops after shutdown
    22042ffedd8c net: usb: asix_devices: Fix PHY address mask in MDIO bus initialization
    78ba077e323f phy: mscc: Fix timestamping for vsc8584
    4931fe2dbe1c cifs: Fix oops due to uninitialised variable
    1b7862974266 net: ti: icssg-prueth: Fix HSR and switch offload Enablement during firwmare reload.
    94731cc551e2 ppp: fix race conditions in ppp_fill_forward_path
    b6be9f91c61c net: ethernet: mtk_ppe: add RCU lock around dev_fill_forward_path
    53aee4fc347c ipv6: sr: validate HMAC algorithm ID in seg6_hmac_info_add
    041e2f945f82 net: gso: Forbid IPv6 TSO with extensions on devices with only IPV6_CSUM
    af9742effde6 drm/amd/display: Don't print errors for nonexistent connectors
    97fc94c5fd3c drm/amd/display: Add null pointer check in mod_hdcp_hdcp1_create_session()
    9d9b04562628 ALSA: usb-audio: Fix size validation in convert_chmap_v3()
    a4f1b9c57092 drm/hisilicon/hibmc: fix the hibmc loaded failed bug
    d85331542e98 drm/hisilicon/hibmc: fix the i2c device resource leak when vdac init failed
    c8029abe45c5 drm/hisilicon/hibmc: refactored struct hibmc_drm_private
    a0d2e6f9d34a rust: alloc: fix `rusttest` by providing `Cmalloc::aligned_layout` too
    bce19c62ed00 mlxsw: spectrum: Forward packets with an IPv4 link-local source IP
    975e2590a72e Bluetooth: hci_conn: do return error from hci_enhanced_setup_sync()
    dcb367e70770 Bluetooth: hci_event: fix MTU for BN == 0 in CIS Established
    369518d9f713 Bluetooth: hci_sync: Prevent unintended PA sync when SID is 0xFF
    3313f062338a Bluetooth: btmtk: Fix wait_on_bit_timeout interruption during shutdown
    0d340bbb8d49 Bluetooth: hci_sync: Fix scan state after PA Sync has been established
    4bdb0f78bddb iommu/amd: Avoid stack buffer overflow from kernel cmdline
    f1424c830d6c scsi: qla4xxx: Prevent a potential error pointer dereference
    313f2c85f64d rtase: Fix Rx descriptor CRC error bit definition
    bdb19cd0de73 net: bridge: fix soft lockup in br_multicast_query_expired()
    87c36bef9e0f net: xilinx: axienet: Fix RX skb ring management in DMAengine mode
    8d2bf2ec20a6 RDMA/hns: Fix dip entries leak on devices newer than hip09
    17ed810811ec RDMA/bnxt_re: Fix to initialize the PBL array
    f884c7b15ebd RDMA/bnxt_re: Fix a possible memory leak in the driver
    948577ad2876 RDMA/bnxt_re: Fix to remove workload check in SRQ limit path
    d43f27aa9e3c RDMA/bnxt_re: Fix to do SRQ armena by default
    89053e3f0c2d RDMA/hns: Fix querying wrong SCC context for DIP algorithm
    ed4f1d589168 RDMA/erdma: Fix ignored return value of init_kernel_qp
    60a56f5a54f5 rust: alloc: replace aligned_size() with Kmalloc::aligned_layout()
    846bda1478b1 iosys-map: Fix undefined behavior in iosys_map_clear()
    6bfa361d7278 drm/tests: Fix drm_test_fb_xrgb8888_to_xrgb2101010() on big-endian
    46d9ebf9fd82 drm/tests: Do not use drm_fb_blit() in format-helper tests
    f7798cb62de9 drm/format-helper: Add generic conversion to 32-bit formats
    845687312b68 drm/format-helper: Move helpers for pixel conversion to header file
    d218e87db084 drm/format-helper: Add conversion from XRGB8888 to BGR888
    268a5b682a18 drm/panic: Move drawing functions to drm_draw
    8b9c53f8edd4 drm/tests: Fix endian warning
    7a60c21384c8 cgroup/cpuset: Fix a partition error with CPU hotplug
    68da1fac48f0 cgroup/cpuset: Use static_branch_enable_cpuslocked() on cpusets_insane_config_key
    cabcb52d76d3 drm/nouveau/nvif: Fix potential memory leak in nvif_vmm_ctor().
    aa2b0dc33258 spi: spi-fsl-lpspi: Clamp too high speed_hz
    a9e5924daa95 x86/cpu/hygon: Add missing resctrl_cpu_detect() in bsp_init helper
    f860000c1f5e iio: imu: inv_icm42600: change invalid data error to -EBUSY
    06230d6dec21 iio: imu: inv_icm42600: Convert to uXX and sXX integer types
    78de165b61b1 iio: imu: inv_icm42600: use = { } instead of memset()
    4bd0edbd83b6 iio: imu: inv_icm42600: switch timestamp type from int64_t __aligned(8) to aligned_s64
    3439c15ae91a tls: fix handling of zero-length records on the rx_list
    e42ac65e257b powerpc/boot: Fix build with gcc 15
    9c4afcaf8275 ovl: use I_MUTEX_PARENT when locking parent in ovl_create_temp()
    f483319e1f9b drm/i915/icl+/tc: Cache the max lane count value
    51ffbf14e261 compiler: remove __ADDRESSABLE_ASM{_STR,}() again
    ae94295132b8 drm/i915/icl+/tc: Convert AUX powered WARN to a debug message
    d0c68045b8b0 tracing: Limit access to parser->buffer when trace_get_user failed
    e1fdc506c315 tracing: Remove unneeded goto out logic
    c456108605f5 iio: temperature: maxim_thermocouple: use DMA-safe buffer for spi_read()
    cce55ca4e7a2 iio: light: as73211: Ensure buffer holes are zeroed
    1856de52e0f4 iio: light: Use aligned_s64 instead of open coding alignment.
    8e64b52bc895 usb: dwc3: pci: add support for the Intel Wildcat Lake
    f49697dfba29 usb: dwc3: Remove WARN_ON for device endpoint command timeouts
    900fdc733f84 usb: dwc3: Ignore late xferNotReady event to prevent halt timeout
    2f7fc6ec5a11 usb: xhci: Fix slot_id resource race conflict
    adeb6ccc145f usb: typec: maxim_contaminant: re-enable cc toggle if cc is open and port is clean
    b21f9560a970 usb: typec: maxim_contaminant: disable low power mode when reading comparator values
    b93f5d439d74 USB: storage: Ignore driver CD mode for Realtek multi-mode Wi-Fi dongles
    d6f3ec41c60b usb: storage: realtek_cr: Use correct byte order for bcs->Residue
    ad105db0a264 USB: storage: Add unusual-devs entry for Novatek NTK96550-based camera
    5bbe1e67fc67 usb: renesas-xhci: Fix External ROM access timeouts
    b0cdcacd9174 usb: core: hcd: fix accessing unmapped memory in SINGLE_STEP_SET_FEATURE test
    f3b0c9ec5473 comedi: Fix use of uninitialized memory in do_insn_ioctl() and do_insnlist_ioctl()
    a3cfcd0c78c8 comedi: pcl726: Prevent invalid irq number
    92352ed2f9ac comedi: Make insn_rw_emulate_bits() do insn->n samples
    33bfc3a4cce3 usb: quirks: Add DELAY_INIT quick for another SanDisk 3.2Gen1 Flash Drive
    5ed0465d7c11 cdx: Fix off-by-one error in cdx_rpmsg_probe()
    f42e2149f2a1 kcov, usb: Don't disable interrupts in kcov_remote_start_usb_softirq()
    4e0c0771bd3e most: core: Drop device reference after usage in get_channel()
    993e0cadd807 iio: proximity: isl29501: fix buffered read on big-endian systems
    88818b5288a6 iio: pressure: bmp280: Use IS_ERR() in bmp280_common_probe()
    c591ba1acd08 ftrace: Also allocate and copy hash for reading of filter files
    598e1e4f392e fpga: zynq_fpga: Fix the wrong usage of dma_map_sgtable()
    baa11a683d11 mmc: sdhci_am654: Disable HS400 for AM62P SR1.0 and SR1.1
    3c778a98bee1 drm/dp: Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS
    87dca4c6a672 cpuidle: governors: menu: Avoid selecting states with too much latency
    b39b62075ab4 cpuidle: menu: Remove iowait influence
    d133154ca39c use uniform permission checks for all mount propagation changes
    042cf48ecf67 fs/buffer: fix use-after-free when call bh_read() helper
    003e6a315029 smb: server: split ksmbd_rdma_stop_listening() out of ksmbd_rdma_destroy()
    3adec7077192 debugfs: fix mount options not being applied
    a3888a24131a arm64: dts: ti: k3-am62*: Move eMMC pinmux to top level board file
    4627b6c718eb arm64: dts: ti: k3-am6*: Remove disable-wp for eMMC
    b926a5860696 arm64: dts: ti: k3-am62*: Add non-removable flag for eMMC
    cb2e511b92c1 arm64: dts: ti: k3-am6*: Add boot phase flag to support MMC boot
    3d61136945a7 btrfs: subpage: keep TOWRITE tag until folio is cleaned
    74482f0005fa ext4: preserve SB_I_VERSION on remount
    f02d8e200cb5 scsi: mpi3mr: Serialize admin queue BAR writes on 32-bit systems
    95ba8440f72d scsi: mpi3mr: Drop unnecessary volatile from __iomem pointers
    8b419b1d6f0f iio: adc: ad7173: fix setting ODR in probe
    22e29e843c88 PCI: rockchip: Set Target Link Speed to 5.0 GT/s before retraining
    4905709a195e PCI: rockchip: Use standard PCIe definitions
    32559a9ae496 PCI: imx6: Add IMX8MQ_EP third 64-bit BAR in epc_features
    d9126b98c70a PCI: imx6: Add i.MX8Q PCIe Endpoint (EP) support
    ec22f927327d Mark xe driver as BROKEN if kernel page size is not 4kB
    92d6b3747b49 mptcp: disable add_addr retransmission when timeout is 0
    43ffe59d1666 mptcp: remove duplicate sk_reset_timer call
    782470d0aa8b soc: qcom: mdt_loader: Fix error return values in mdt_header_valid()
    12e7df89a0c7 scsi: core: Fix command pass through retry regression
    6b124585a5d1 drm/amd/display: Fill display clock and vblank time in dce110_fill_display_configs
    1fa5189ab6d3 drm/amd/display: Find first CRTC and its line time in dce110_fill_display_configs
    1b7e7c371b47 drm/amd/display: Fix DP audio DTO1 clock source on DCE 6.
    34f2e0bb85c2 drm/amd/display: Fix Xorg desktop unresponsive on Replay panel
    88d5d27264ef drm/amd/display: Fix fractional fb divider in set_pixel_clock_v3
    dae271ef2b89 drm/amd/display: Don't overclock DCE 6 by 15%
    f653dd30839e drm/amd/display: Avoid a NULL pointer dereference
    be68ddbf23ff drm/amdgpu/swm14: Update power limit logic
    1414220d5b5e accel/habanalabs/gaudi2: Use kvfree() for memory allocated with kvcalloc()
    b1fbf1b68bbf kvm: retry nx_huge_page_recovery_thread creation
    0a61c9bcab64 platform/x86/intel-uncore-freq: Check write blocked for ELC
    61605c847599 s390/sclp: Fix SCCB present check
    732d4bd7b78a RDMA/rxe: Flush delayed SKBs while releasing RXE resources
    570507f08f0c ALSA: hda/realtek: Add support for HP EliteBook x360 830 G6 and EliteBook 830 G6
    8e2b8a30791b mm/memory-failure: fix infinite UCE for VM_PFNMAP pfn
    61a9f2e5c49f mm/debug_vm_pgtable: clear page table entries at destroy_args()
    0b7f6d02d490 squashfs: fix memory leak in squashfs_fill_super
    92278ae36935 NFS: Fix a race when updating an existing write
    a9f726bd1044 mmc: sdhci-pci-gli: GL9763e: Rename the gli_set_gl9763e() for consistency
    2911c2e05c35 mmc: sdhci-pci-gli: GL9763e: Mask the replay timer timeout of AER
    9fccdc9f3dc9 memstick: Fix deadlock by moving removing flag earlier
    d7dfbda8eefb mmc: sdhci-pci-gli: Add a new function to simplify the code
    9efa1a429cc2 iommu/arm-smmu-v3: Fix smmu_domain->nr_ats_masters decrement
    4652d0b6f7e6 iov_iter: iterate_folioq: fix handling of offset >= folio size
    d9f93172820a io_uring/futex: ensure io_futex_wait() cleans up properly on failure
    eb0abacdd3fc Revert "can: ti_hecc: fix -Woverflow compiler warning"
    3c06e9ad0bea sched_ext: initialize built-in idle state before ops.init()
    3c0d35b3caf5 ata: libata-scsi: Return aborted command when missing sense and result TF
    fe9da1812f86 io_uring/net: commit partial buffers on retry
    f08c80af3c9a netfs: Fix unbuffered write error handling
    06eb8b95cbc3 btrfs: send: make fs_path_len() inline and constify its argument
    7386d3e3dd2c btrfs: send: use fallocate for hole punching with send stream v2
    039d05430ecf btrfs: send: avoid path allocation for the current inode when issuing commands
    a4eac4fd1b6c btrfs: send: keep the current inode's path cached
    eb38777ad10e btrfs: send: add and use helper to rename current inode when processing refs
    a7920a7ea65b btrfs: send: only use boolean variables at process_recorded_refs()
    efb8eb976ab5 btrfs: send: factor out common logic when sending xattrs
    404dd9617257 xfs: fully decouple XFS_IBULK* flags from XFS_IWALK* flags
    4cb852e43f56 btrfs: zoned: requeue to unused block group list if zone finish failed
    e663071ae9b9 btrfs: codify pattern for adding block_group to bg_list
    9a20e95694cf btrfs: explicitly ref count block_group on new_bgs list
    da2124719f38 btrfs: abort transaction on unexpected eb generation at btrfs_copy_root()
    cd2bce7d8438 btrfs: always abort transaction on failure to add block group to free space tree
    7eb547071cd6 btrfs: move transaction aborts to the error site in add_block_group_free_space()
    dd0b28d877b2 btrfs: qgroup: fix race between quota disable and quota rescan ioctl
    8efc2a4d2fad btrfs: qgroup: drop unused parameter fs_info from __del_qgroup_rb()
    31c6235301c6 usb: typec: fusb302: cache PD RX state
    c826250c492e USB: typec: Use str_enable_disable-like helpers
    1c24f24f6b67 x86/sev: Ensure SVSM reserved fields in a page validation entry are initialized to zero
    7c303fa1f311 mm/damon/ops-common: ignore migration request to invalid nodes
    e35c822d6565 selftests: mptcp: pm: check flush doesn't reset limits
    243d21f94751 mptcp: pm: kernel: flush: do not reset ADD_ADDR limit
    6fa78478795f mptcp: drop skb if MPTCP skb extension allocation fails
    b00219888c11 ACPI: pfr_update: Fix the driver update version check
    b3967c493799 ipv6: sr: Fix MAC comparison to be constant-time
    786f6314604b sched/ext: Fix invalid task state transitions on class switch
    acd69b597bd3 net, hsr: reject HSR frame if skb can't hold tag
    3575d22e94dc LoongArch: KVM: Make function kvm_own_lbt() robust
    0a42692cdb8f drm/amd/display: Don't overwrite dce60_clk_mgr
    0961673cc5f0 drm/amd/display: fix a Null pointer dereference vulnerability
    de0780d26f6c drm/amd/display: Add primary plane to commits for correct VRR handling
    96609a51e613 drm/amdkfd: Destroy KFD debugfs after destroy KFD wq
    75a10c872cae drm/amdgpu: update mmhub 4.1.0 client id mappings
    c56ef0e7d2de drm/amdgpu: update mmhub 3.0.1 client id mappings
    20e97e9a2939 drm/amdgpu: Update external revid for GC v9.5.0
    fc647f6c51bb drm/amdgpu: Initialize data to NULL in imu_v12_0_program_rlc_ram()
    83cfdc2b018c drm/amdgpu: check if hubbub is NULL in debugfs/amdgpu_dm_capabilities
    71598a5a7797 drm/amdgpu: Avoid extra evict-restore process.
    1fc9d8f5a665 drm/amd: Restore cached power limit during resume
    9225818539c7 drm/amdgpu/discovery: fix fw based ip discovery
    daaea1706de5 media: venus: venc: Clamp param smaller than 1fps and bigger than 240
    d63a2d93e8d2 media: venus: vdec: Clamp param smaller than 1fps and bigger than 240.
    639eb587f977 media: venus: protect against spurious interrupts during probe
    24dd1536d43c media: venus: hfi: explicitly release IRQ during teardown
    32798309540a media: venus: Fix MSM8998 frequency table
    2d8cea8310a2 media: venus: Add a check for packet size after reading from shared memory
    93775183e6f3 media: qcom: camss: cleanup media device allocated resource on error path
    639f5b33fcd7 media: ivsc: Fix crash at shutdown due to missing mei_cldev_disable() calls
    0d23b548d71e media: mt9m114: Fix deadlock in get_frame_interval/set_frame_interval
    6b499ee04b30 media: ov2659: Fix memory leaks in ov2659_probe()
    42c661c27ccb media: pisp_be: Fix pm_runtime underrun in probe
    ed905fe7cba0 media: rainshadow-cec: fix TOCTOU race condition in rain_interrupt()
    c3d75524e100 media: usbtv: Lock resolution while streaming
    0ac47b860947 media: v4l2-ctrls: Don't reset handler's error in v4l2_ctrl_handler_free()
    d4177e8874b2 media: verisilicon: Fix AV1 decoder clock frequency
    5fd3269dfaaa media: vivid: fix wrong pixel_array control size
    c851e2c89234 media: ipu6: isys: Use correct pads for xlate_streams()
    a5c8984a5b77 media: imx: fix a potential memory leak in imx_media_csc_scaler_device_init()
    5c54ef825c9e media: hi556: correct the test pattern configuration
    7b15256361e6 media: gspca: Add bounds checking to firmware parser
    35128d4c49ff parisc: Update comments in make_insert_tlb
    98e2b6af0238 parisc: Try to fixup kernel exception in bad_area_nosemaphore path of do_page_fault()
    bc0a24c24cee parisc: Revise gateway LWS calls to probe user read access
    f410ef9a032c parisc: Revise __get_user() to probe user read access
    1dc6244651ed parisc: Rename pte_needs_flush() to pte_needs_cache_flush() in cache.c
    41d6a489cbe2 parisc: Makefile: explain that 64BIT requires both 32-bit and 64-bit compilers
    8f8a07ad04da parisc: Drop WARN_ON_ONCE() from flush_cache_vmap
    753bc5f5a3f5 parisc: Define and use set_pte_at()
    537264f4b3dc parisc: Check region is readable by user in raw_copy_from_user()
    a2513b82fe7a soc/tegra: pmc: Ensure power-domains are in a known state
    033b3d0e4175 kbuild: userprogs: use correct linker when mixing clang and GNU ld
    429d50cbaff4 jbd2: prevent softlockup in jbd2_log_do_checkpoint()
    888aa660144b f2fs: fix to avoid out-of-boundary access in dnode page
    539fa8a7f163 ASoC: SOF: amd: acp-loader: Use GFP_KERNEL for DMA allocations in resume context
    9ef515e1714d amdgpu/amdgpu_discovery: increase timeout limit for IFWI init
    e2f8f9d9252b phy: qcom: phy-qcom-m31: Update IPQ5332 M31 USB phy initialization sequence
    21d9382c44a4 vhost/vsock: Avoid allocating arbitrarily-sized SKBs
    faf332a10372 vsock/virtio: Validate length in packet header before skb_put()
    7c001febe46a PCI: imx6: Delay link start until configfs 'start' written
    90fa5884bc8f PCI: imx6: Remove apps_reset toggling from imx_pcie_{assert/deassert}_core_reset
    0845e3bdb98f PCI: imx6: Add IMX8MM_EP and IMX8MP_EP fixed 256-byte BAR 4 in epc_features
    74955851ad4c PCI: endpoint: Fix configfs group removal on driver teardown
    6cf655055232 PCI: endpoint: Fix configfs group list head handling
    365cc41d527f PCI/portdrv: Use is_pciehp instead of is_hotplug_bridge
    72e849b5b16a readahead: fix return value of page_cache_next_miss() when no hole is found
    617a8d148d92 mtd: rawnand: renesas: Add missing check after DMA map
    c74e7333b5a3 mtd: rawnand: fsmc: Add missing check after DMA map
    2c2a6c4d1d5d mtd: spinand: propagate spinand_wait() errors from spinand_write_page()
    264e99d50e88 mtd: spi-nor: Fix spi_nor_try_unlock_all()
    52a14d291107 hwmon: (gsc-hwmon) fix fan pwm setpoint show functions
    d10700cbd1f0 pwm: mediatek: Fix duty and period setting
    6dff1cf891f5 pwm: mediatek: Handle hardware enable and clock enable separately
    dea337456b69 pwm: imx-tpm: Reset counter if CMOD is 0
    54299905bdc6 wifi: ath11k: fix dest ring-buffer corruption when ring is full
    c2c67e8ffd89 wifi: ath11k: fix source ring-buffer corruption
    654f9eba7e88 wifi: ath11k: fix dest ring-buffer corruption
    e4f5abdf5b25 wifi: ath12k: fix dest ring-buffer corruption when ring is full
    34606f060a7e wifi: ath12k: fix source ring-buffer corruption
    06af1f72e081 wifi: ath12k: fix dest ring-buffer corruption
    e8d817bb9ada wifi: brcmsmac: Remove const from tbl_ptr parameter in wlc_lcnphy_common_read_table()
    e0d68d52a300 iio: adc: ad_sigma_delta: change to buffer predisable
    4808ca3aa30a iio: imu: bno055: fix OOB access of hw_xlate array
    b7a840afe31f zynq_fpga: use sgtable-based scatterlist wrappers
    87bfabb3b2f4 soc: qcom: mdt_loader: Ensure we don't read past the ELF header
    12e65070d23c ata: libata-scsi: Fix CDL control
    47bf4ef2d03a scsi: ufs: ufs-pci: Fix default runtime and system PM levels
    6dc4a6eb5e7a scsi: ufs: ufs-pci: Fix hibernate state transition for Intel MTL-like host controllers
    c7c56473410b ata: libata-scsi: Fix ata_to_sense_error() status handling
    2c84f085d628 scsi: mpi3mr: Fix race between config read submit and interrupt completion
    dc8fb963742f scsi: ufs: exynos: Fix programming of HCI_UTRL_NEXUS_TYPE
    fee4b9e1b2f5 scsi: dt-bindings: mediatek,ufs: Add ufs-disable-mcq flag for UFS host
    19ef81195c52 dt-bindings: display: sprd,sharkl3-dsi-host: Fix missing clocks constraints
    2faccb81e3c4 dt-bindings: display: sprd,sharkl3-dpu: Fix missing clocks constraints
    785e79e1d3d7 apparmor: Fix 8-byte alignment for initial dfa blob streams
    1187dc67b931 arm64: dts: ti: k3-am62-verdin: Enable pull-ups on I2C buses
    4c02f4cd92fa arm64: dts: ti: k3-am62a7-sk: fix pinmux for main_uart1
    bc254ce9b4eb arm64: dts: exynos: gs101: ufs: add dma-coherent property
    1e20a92593a7 arm64: dts: ti: k3-pinctrl: Enable Schmitt Trigger by default
    7d90b80c2e57 arm64: dts: ti: k3-am62-main: Remove eMMC High Speed DDR support
    0c2f2fd7dc6f btrfs: fix printing of mount info messages for NODATACOW/NODATASUM
    7b16d89fdae4 btrfs: restore mount option info messages during mount
    30776a735dea btrfs: fix incorrect log message for nobarrier mount option
    5abf2cec45b9 btrfs: zoned: fix write time activation failure for metadata block group
    275c88b797f2 ext4: fix hole length calculation overflow in non-extent inodes
    e767e51caef3 ext4: use kmalloc_array() for array space allocation
    48a6128a4a39 ext4: don't try to clear the orphan_present feature block device is r/o
    0bbcd9434c56 ext4: fix reserved gdt blocks handling in fsmap
    4fa1098957e0 ext4: fix fsmap end of range reporting with bigalloc
    14cfb25eaf79 ext4: check fast symlink for ea_inode correctly
    daf7938a205f tracing: fprobe-event: Sanitize wildcard for fprobe event name
    d5ab785183ae ksmbd: extend the connection limiting mechanism to support IPv6
    36e010bb865f ksmbd: fix refcount leak causing resource not released
    25e39d8da1f9 Revert "vgacon: Add check for vc_origin address range in vgacon_scroll()"
    90bc64329612 crypto: octeontx2 - Fix address alignment on CN10KB and CN10KA-B0
    ee44c1e0ca68 crypto: octeontx2 - Fix address alignment on CN10K A0/A1 and OcteonTX2
    dc2579cee57d crypto: octeontx2 - Fix address alignment issue on ucode loading
    fe546f5c50fc crypto: qat - flush misc workqueue during device shutdown
    f9534674ce53 crypto: caam - Prevent crash on suspend with iMX8QM / iMX8ULP
    7cd656e25f20 crypto: qat - lower priority for skcipher and aead algorithms
    c1f5a9d4f0ae lib/crypto: mips/chacha: Fix clang build and remove unneeded byteswap
    e447303a2869 vt: defkeymap: Map keycodes above 127 to K_HOLE
    2ee5eca08257 vt: keyboard: Don't process Unicode characters in K_OFF mode
    2ec99b922f46 bus: mhi: host: Detect events pointing to unexpected TREs
    58379e95599e bus: mhi: host: Fix endianness of BHI vector table
    8b557259cb2d usb: dwc3: imx8mp: fix device leak at unbind
    1d14af4aaab5 usb: dwc3: meson-g12a: fix device leaks at unbind
    68aaf7b29230 usb: musb: omap2430: fix device leak at unbind
    dd773c917edd usb: gadget: udc: renesas_usb3: fix device leak at unbind
    ac5d7bfa5da3 usb: atm: cxacru: Merge cxacru_upload_firmware() into cxacru_heavy_init()
    a8cd0f7f9c6c m68k: Fix lost column on framebuffer debug console
    f0fc87ca5c44 dm: Check for forbidden splitting of zone write operations
    8864616719b6 dm: dm-crypt: Do not partially accept write BIOs with zoned targets
    2b6e3546fb94 PM: runtime: Take active children into account in pm_runtime_get_if_in_use()
    14153500da34 platform/chrome: cros_ec: Unregister notifier in cros_ec_unregister()
    3e1bb7397593 cpufreq: armada-8k: Fix off by one in armada_8k_cpufreq_free_table()
    bf1d64092b0e ata: Fix SATA_MOBILE_LPM_POLICY description in Kconfig
    8e2739478c16 serial: 8250: fix panic due to PSLVERR
    9becd7c25c61 Linux 6.12.43
    e67d015b3732 ACPI: Return -ENODEV from acpi_parse_spcr() when SPCR support is disabled
    25ae311e322d PCI: Honor Max Link Speed when determining supported speeds
    411950235485 dm: split write BIOs on zone boundaries when zone append is not emulated
    b672daa89d1a rcu: Fix racy re-initialization of irq_work causing hangs
    cf04cdc419b2 drm/amd/display: Allow DCN301 to clear update flags
    ccc5a37e6370 firmware: arm_scmi: Convert to SYSTEM_SLEEP_PM_OPS
    f5f8bf41ab17 io_uring/rw: cast rw->flags assignment to rwf_t
    f170bc6fa429 ata: libata-sata: Add link_power_management_supported sysfs attribute
    f6367a4d03b9 rust: workaround `rustdoc` target modifiers bug
    fed5d8679b57 rust: kbuild: clean output before running `rustdoc`
    231d783e0cf0 arm64: dts: ti: k3-j722s-evm: Fix USB gpio-hog level for Type-C
    4a95cfc9a413 arm64: dts: ti: k3-j722s-evm: Fix USB2.0_MUX_SEL to select Type-C
    272d619a5301 PCI/ACPI: Fix runtime PM ref imbalance on Hot-Plug Capable ports
    18b88bbcbde6 PCI: Allow PCI bridges to go to D3Hot on all non-x86
    47ecb8f8ec00 PCI: Store all PCIe Supported Link Speeds
    5a9c80656775 smb: client: fix netns refcount leak after net_passive changes
    4ceb0bd4ffd0 net: better track kernel sockets lifetime
    2b260dc923e8 net: Add net_passive_inc() and net_passive_dec().
    130362b4b39d mfd: cros_ec: Separate charge-control probing from USB-PD
    dfa79be0b45b HID: apple: avoid setting up battery timer for devices without battery
    16decac6ed8f tools/hv: fcopy: Fix irregularities with size of ring buffer
    110821e5de82 wifi: mac80211: check basic rates validity in sta_link_apply_parameters
    20d03830f037 HID: magicmouse: avoid setting up battery timer when not needed
    673cf582fd78 RDMA/siw: Fix the sendmsg byte count in siw_tcp_sendpages
    261757617c68 tools/nolibc: fix spelling of FD_SETBITMASK in FD_* macros
    714d36077cb0 media: v4l2: Add support for NV12M tiled variants to v4l2_format_info()
    4aa1c497a19c media: uvcvideo: Do not mark valid metadata as invalid
    6f08bfb58056 media: venus: Fix OOB read due to missing payload bound check
    cac702a43905 media: uvcvideo: Fix 1-byte out-of-bounds read in uvc_parse_format()
    a0854de00ce2 mm/kmemleak: avoid deadlock by moving pr_warn() outside kmemleak_lock
    8d2d22a55ffe mm/kmemleak: avoid soft lockup in __kmemleak_do_cleanup()
    ff40839e018b mm/ptdump: take the memory hotplug lock inside ptdump_walk_pgd()
    769682164de8 mm, slab: restore NUMA policy support for large kmalloc
    bffedc06e27e parisc: Makefile: fix a typo in palo.conf
    d03610494717 hv_netvsc: Fix panic during namespace deletion with VF
    5b3b346bc4c2 net/sched: ets: use old 'nbands' while purging unused classes
    ed9b8e501623 fbdev: Fix vmalloc out-of-bounds write in fast_imageblit
    bb81c18dbd42 userfaultfd: fix a crash in UFFDIO_MOVE when PMD is a migration entry
    579c5488fe6e xfs: fix scrub trace with null pointer in quotacheck
    39a93e1c9dbf btrfs: do not allow relocation of partially dropped subvolumes
    03880ebe47dd btrfs: fix iteration bug in __qgroup_excl_accounting()
    c2972df789b3 btrfs: zoned: do not select metadata BG as finish target
    58e66d83e1ac btrfs: error on missing block group when unaccounting log tree extent buffers
    807c42274006 btrfs: fix log tree replay failure due to file with 0 links and extents
    16c5f8907104 btrfs: clear dirty status from extent buffer on error at insert_new_root()
    d115fc9e96c3 btrfs: don't skip remaining extrefs if dir not found during log replay
    38bb34617bc7 btrfs: qgroup: fix qgroup create ioctl returning success after quotas disabled
    f21928dba292 btrfs: populate otime when logging an inode item
    acc48b70460c btrfs: fix ssd_spread overallocation
    6c25acf3a0d1 btrfs: don't ignore inode missing when replaying log tree
    3c87ae17b736 btrfs: qgroup: set quota enabled bit if quota disable fails flushing reservations
    7e1dfc32452a btrfs: zoned: do not remove unwritten non-data block group
    f044b8492836 btrfs: abort transaction during log replay if walk_log_tree() failed
    eb2114b98ffb btrfs: zoned: use filesystem size not disk size for reclaim decision
    2853aaad686a cdc-acm: fix race between initial clearing halt and open
    fe8e2ea0797a thunderbolt: Fix copy+paste error in match_service_id()
    017198079551 comedi: fix race between polling and detaching
    c94bf0166539 usb: typec: ucsi: Update power_supply on power role change
    c07be32ba33a misc: rtsx: usb: Ensure mmc child device is active when card is present
    9512510cee7d usb: core: config: Prevent OOB read in SS endpoint companion parsing
    a2bbe1fcd351 ext4: initialize superblock fields in the kballoc-test.c kunit tests
    c0d7c9827239 ext4: fix largest free orders lists corruption on mb_optimize_scan switch
    9dc75a54c0cd ext4: fix zombie groups in average fragment size lists
    ebb6021560b9 iommufd: Prevent ALIGN() overflow
    91b0eca73d2b iommufd: Report unmapped bytes in the error path of iopt_unmap_iova_range
    c62963370627 iommu/arm-smmu-qcom: Add SM6115 MDSS compatible
    fc5747575472 iommu/vt-d: Optimize iotlb_sync_map for non-caching/non-RWBF modes
    83e6c09b0154 cifs: reset iface weights when we cannot find a candidate
    f1c5c55fb6cd clk: qcom: gcc-ipq8074: fix broken freq table for nss_port6_tx_clk_src
    d10bf66d9f93 dm: Always split write BIOs to zoned device limits
    8263f32e1017 block: Introduce bio_needs_zone_write_plugging()
    2214b5de0a93 mm/damon/core: commit damos->target_nid
    cd54dc1fd7af drm/amdgpu: fix incorrect vm flags to map bo
    0d086c85ecfa drm/amdgpu: fix vram reservation issue
    ea1724dc0e2f cifs: Fix collect_sample() to handle any iterator type
    a431bf3d3700 ASoC: fsl_sai: replace regmap_write with regmap_update_bits
    7fdc6efef6a5 scsi: lpfc: Remove redundant assignment to avoid memory leak
    6cb0d8587b96 rtc: ds1307: remove clear of oscillator stop flag (OSF) in probe
    f0b2eee3fbba pNFS: Fix uninited ptr deref in block/scsi layout
    2eb8d5323e7d pNFS: Handle RPC size limit for layoutcommits
    ad466c09f4d0 pNFS: Fix disk addr range check in block/scsi layout
    49fc5bea56e1 pNFS: Fix stripe mapping in block/scsi layout
    46aa80ef4959 block: avoid possible overflow for chunk_sectors check in blk_stack_limits()
    aaa447ae853a ASoC: Intel: avs: Fix uninitialized pointer error in probe()
    c583f968daed net: phy: smsc: add proper reset flags for LAN8710A
    21e91cc3184f ALSA: hda/realtek: add LG gram 16Z90R-A to alc269 fixup table
    ed30c38d1e00 lib/sbitmap: convert shallow_depth from one word to the whole sbitmap
    4191feb410a0 smb: client: don't call init_waitqueue_head(&info->conn_wait) twice in _smbd_get_connection
    da649d9da68d tools/power turbostat: Handle cap_get_proc() ENOSYS
    6c31faeb3209 tools/power turbostat: Fix build with musl
    8a0c86474f9a tools/power turbostat: Handle non-root legacy-uncore sysfs permissions
    85344872609d ipmi: Fix strcpy source and destination the same
    33f423bddba0 kconfig: lxdialog: fix 'space' to (de)select options
    43ffed87f8bd kconfig: gconf: fix potential memory leak in renderer_edited()
    96f4083f9ec3 kconfig: gconf: avoid hardcoding model2 in on_treeview2_cursor_changed()
    7aa22b064069 ipmi: Use dev_warn_ratelimited() for incorrect message warnings
    410e89981111 vfio/mlx5: fix possible overflow in tracking max message size
    955b05d79091 scsi: aacraid: Stop using PCI_IRQ_AFFINITY
    8561dc1d5dcc scsi: target: core: Generate correct identifiers for PR OUT transport IDs
    ec602b3928f9 scsi: Fix sas_user_scan() to handle wildcard and multi-channel scans
    2bcc768365fc kconfig: nconf: Ensure null termination where strncpy is used
    bcbad21fe9be vfio/type1: conditional rescheduling while pinning
    d850808db603 kconfig: lxdialog: replace strcpy() with strncpy() in inputbox.c
    6d85a25c1bfe printk: nbcon: Allow reacquire during panic
    a50e10af2fc5 f2fs: check the generic conditions first
    aa8fe7b7b73d exfat: add cluster chain loop check for dir
    ab0a2713fd42 i2c: Force DLL0945 touchpad i2c freq to 100khz
    6614194456be apparmor: fix x_table_lookup when stacking is not the first entry
    3692877bea89 apparmor: use the condition in AA_BUG_FMT even with debug disabled
    c80c1b09074f dm-table: fix checking for rq stackable devices
    bffa4056686a dm-mpath: don't print the "loaded" message if registering fails
    c6801a87179f i3c: master: Initialize ret in i3c_i2c_notifier_call()
    3d2262c9aa7a i3c: don't fail if GETHDRCAP is unsupported
    cbc395f3bad9 apparmor: shift ouid when mediating hard links in userns
    ae03a28e12a7 rtc: ds1307: handle oscillator stop flag (OSF) for ds1341
    22fd8485b148 i3c: add missing include to internal header
    3276f657a4bc module: Prevent silent truncation of module name in delete_module(2)
    167f7ba3a0b3 md: dm-zoned-target: Initialize return variable r to avoid uninitialized use
    f8a9411ef145 soundwire: Move handle_nested_irq outside of sdw_dev_lock
    c2b1ae54b557 soundwire: amd: cancel pending slave status handling workqueue during remove sequence
    2f0163f1cab2 soundwire: amd: serialize amd manager resume sequence during pm_prepare
    0daced27470a clk: renesas: rzg2l: Postpone updating priv->clks[]
    62d24beb848e crypto: ccp - Add missing bootloader info reg for pspv6
    404da09310fb crypto: octeontx2 - add timeout for load_fvc completion poll
    55dc87dc2ac1 media: uvcvideo: Fix bandwidth issue for Alcor camera
    ea955d78bbc4 media: uvcvideo: Add quirk for HP Webcam HD 2300
    f98132a59ccc media: dvb-frontends: w7090p: fix null-ptr-deref in w7090p_tuner_write_serpar and w7090p_tuner_read_serpar
    0bb32863426a media: dvb-frontends: dib7090p: fix null-ptr-deref in dib7090p_rw_on_apb()
    216ca748c7da media: usb: hdpvr: disable zero-length read messages
    f25d566c5674 media: tc358743: Increase FIFO trigger level to 374
    b42b107293b5 media: tc358743: Return an appropriate colorspace from tc358743_set_fmt
    3e03ee3b65ba media: tc358743: Check I2C succeeded during probe
    e6f36f58a8b4 pinctrl: stm32: Manage irq affinity settings
    1540499b6630 scsi: mpi3mr: Correctly handle ATA device errors
    ead8f9714710 scsi: mpt3sas: Correctly handle ATA device errors
    90e0bd0f8f1a power: supply: qcom_battmgr: Add lithium-polymer entry
    571617f171f7 scsi: lpfc: Check for hdwq null ptr when cleaning up lpfc_vport structure
    64d853788fcb scsi: lpfc: Ensure HBA_SETUP flag is used only for SLI4 in dev_loss_tmo_callbk
    699f86dbd9e4 RDMA/core: reduce stack using in nldev_stat_get_doit()
    9b05e91afe94 RDMA: hfi1: fix possible divide-by-zero in find_hw_thread_mask()
    4d463b4876fb dmaengine: stm32-dma: configure next sg only if there are more than 2 sgs
    944c8bd67413 leds: leds-lp50xx: Handle reg to get correct multi_index
    4e6339ca7c9a media: v4l2-common: Reduce warnings about missing V4L2_CID_LINK_FREQ control
    dd0ec0f2368d media: ipu-bridge: Add _HID for OV5670
    154a8f62169d clk: thead: Mark essential bus clocks as CLK_IGNORE_UNUSED
    1e9079ff83ea MIPS: lantiq: falcon: sysctrl: fix request memory check logic
    82d140f6aab5 MIPS: Don't crash in stack_top() for tasks without ABI or vDSO
    86974d140faf crypto: jitter - fix intermediary handling
    7fa59a1816b2 RDMA/bnxt_re: Fix size of uverbs_copy_to() in BNXT_RE_METHOD_GET_TOGGLE_MEM
    d41111bb4606 media: hi556: Fix reset GPIO timings
    c8ca21a28369 jfs: upper bound check of tree index in dbAllocAG
    00462be586b3 jfs: Regular file corruption check
    df3fd8daf278 jfs: truncate good inode pages when hard link is 0
    13f613228cf3 scsi: bfa: Double-free fix
    e843852eccef watchdog: iTCO_wdt: Report error if timeout configuration fails
    8520c843d9a2 MIPS: vpe-mt: add missing prototypes for vpe_{alloc,start,stop,free}
    d2030aaa50a5 clk: qcom: ipq5018: keep XO clock always on
    ce7cd22c04a2 hwmon: (emc2305) Set initial PWM minimum value during probe based on thermal state
    d006f8cbecc7 watchdog: dw_wdt: Fix default timeout
    62b4f6c6abe4 fs/orangefs: use snprintf() instead of sprintf()
    35782c32528d scsi: libiscsi: Initialize iscsi_conn->dd_data only if memory is allocated
    8dd761d63bcb phy: rockchip-pcie: Properly disable TEST_WRITE strobe signal
    37ed0eeadb0b mfd: axp20x: Set explicit ID for AXP313 regulator
    f60c4943cbff clk: tegra: periph: Fix error handling and resolve unsigned compare warning
    81e7e2e7ba07 ext4: do not BUG when INLINE_DATA_FL lacks system.data xattr
    57d73888202a crypto: hisilicon/hpre - fix dma unmap sequence
    806f85bdd3a6 fbdev: fix potential buffer overflow in do_register_framebuffer()
    ec12068f10c1 cifs: Fix calling CIFSFindFirst() for root path without msearch
    188265ece138 watchdog: sbsa: Adjust keepalive timeout to avoid MediaTek WS0 race condition
    5ea8e53d2db7 drm/amd/display: Disable dsc_power_gate for dcn314 by default
    0a0097e2b900 drm/amd/display: Avoid configuring PSR granularity if PSR-SU not supported
    d2b6f313ac00 drm/amd/display: Only finalize atomic_obj if it was initialized
    a1a63d8a442d vhost: fail early when __vhost_add_used() fails
    680c7d9d9197 vsock/virtio: Resize receive buffers so that each SKB fits in a 4K page
    394bd12d1f93 net: dsa: b53: fix IP_MULTICAST_CTRL on BCM5325
    1cfa244f7198 rcu: Fix rcu_read_unlock() deadloop due to IRQ work
    f6eaa8ba86d7 drm/ttm: Respect the shrinker core free target
    bd821df9cc41 drm/amd/display: Avoid trying AUX transactions on disconnected ports
    0793ce8b0dc6 drm/amd/display: Update DMCUB loading sequence for DCN3.5
    811068726e2a selftests/bpf: Fix a user_ringbuf failure with arm64 64KB page size
    e49253b5046c selftests/bpf: Fix ringbuf/ringbuf_write test failure with arm64 64KB page size
    c14bf7f87346 bpf: Make reg_not_null() true for CONST_PTR_TO_MAP
    3aaa339f64d9 uapi: in6: restore visibility of most IPv6 socket options
    5c196b3c1222 drm/ttm: Should to return the evict error
    d7458645c40c drm: renesas: rz-du: mipi_dsi: Add min check for VCLK range
    0b96747667c3 net: ncsi: Fix buffer overflow in fetching version id
    b17fcce70733 drm/xe: Make dma-fences compliant with the safe access rules
    3ea9509cb82a ionic: clean dbpage in de-init
    262db48ef07e wifi: rtlwifi: fix possible skb memory leak in _rtl_pci_init_one_rxdesc()
    5643cd6c0302 wifi: rtw89: scan abort when assign/unassign_vif
    74bfb1b61a72 ptp: Use ratelimite for freerun error message
    45218b8b2269 bpftool: Fix JSON writer resource leak in version command
    f16f96ccfe56 net: dsa: b53: prevent SWITCH_CTRL access on BCM5325
    9f45e4858f80 net: dsa: b53: prevent DIS_LEARNING access on BCM5325
    15cf46cc6ecc net: dsa: b53: prevent GMII_PORT_OVERRIDE_CTRL access on BCM5325
    757955c80663 net: dsa: b53: fix b53_imp_vlan_setup for BCM5325
    0d250ad617a0 net: dsa: b53: ensure BCM5325 PHYs are enabled
    d40d53c6bb06 gve: Return error for unknown admin queue command
    db7e926a15a5 net: vlan: Replace BUG() with WARN_ON_ONCE() in vlan_dev_* stubs
    4311d06ab643 net: vlan: Make is_vlan_dev() a stub when VLAN is not configured
    c086fbbfc9f2 drm/amd: Allow printing VanGogh OD SCLK levels without setting dpm to manual
    5e683397f1d2 dpaa_eth: don't use fixed_phy_change_carrier
    8ec37adfb678 neighbour: add support for NUD_PERMANENT proxy entries
    d86996dc1afc wifi: iwlegacy: Check rate_idx range after addition
    a2bdd6e3e5ab arm64: stacktrace: Check kretprobe_find_ret_addr() return value
    c500a13fd6cf netmem: fix skb_frag_address_safe with unreadable skbs
    8f2d0a7d993d powerpc: floppy: Add missing checks after DMA map
    7c3e99fd4a66 wifi: ath12k: Decrement TID on RX peer frag setup error handling
    3b5e5185881e wifi: ath12k: Enable REO queue lookup table feature on QCN9274 hw2.0
    a529809063c4 wifi: rtlwifi: fix possible skb memory leak in `_rtl_pci_rx_interrupt()`.
    99322e24247a wifi: mac80211: update radar_required in channel context after channel switch
    8c2a46aafe08 drm/amd/display: Initialize mode_select to 0
    c9298c19377f drm/amd/display: Fix 'failed to blank crtc!'
    d838d5a3f2ee wifi: iwlwifi: fw: Fix possible memory leak in iwl_fw_dbg_collect
    a07ab4a265fc wifi: iwlwifi: dvm: fix potential overflow in rs_fill_link_cmd()
    18dbc182a97f lib: packing: Include necessary headers
    6246776e35b8 wifi: ath12k: Fix station association with MBSSID Non-TX BSS
    3cf181b44cd4 wifi: ath12k: Add memset and update default rate value in wmi tx completion
    201c9b4485ed wifi: ath10k: shutdown driver when hardware is unreliable
    3a1f6b418c34 drm/amd/display: Separate set_gsl from set_gsl_source_select
    fc5ec93e7f8a net: fec: allow disable coalescing
    3d3d1b57bf4f net: ieee8021q: fix insufficient table-size assertion
    dd10a7109991 ACPI: Suppress misleading SPCR console message when SPCR table is absent
    2131852573e3 net: atlantic: add set_power to fw_ops for atl2 to fix wol
    2fc5b54368a1 xfrm: Duplicate SPI Handling
    40e78d186d06 net: thunderbolt: Fix the parameter passing of tb_xdomain_enable_paths()/tb_xdomain_disable_paths()
    a262d4296cd7 net: thunderbolt: Enable end-to-end flow control also in transmit
    3f53761181a1 drm/xe/xe_query: Use separate iterator while filling GT list
    5fc69bf3294d kselftest/arm64: Specify SVE data when testing VL set in sve-ptrace
    125701019c9f wifi: mt76: mt7915: mcu: re-init MCU before loading FW patch
    7fd46ccab6e6 wifi: rtw89: Fix rtw89_mac_power_switch() for USB
    df4d27f56c61 drm/imagination: Clear runtime PM errors while resetting the GPU
    280f6011ba9f perf/arm: Add missing .suppress_bind_attrs
    53dc780c1e94 drm/msm: Add error handling for krealloc in metadata setup
    20406ace80ad drm/msm: use trylock for debugfs
    574fb734ac3d wifi: mac80211: fix rx link assignment for non-MLO stations
    cce3d027227c rcu/nocb: Fix possible invalid rdp's->nocb_cb_kthread pointer access
    347b94ee253e ipv6: mcast: Check inet6_dev->dead under idev->mc_lock in __ipv6_dev_mc_inc().
    43c0e1c11bea (powerpc/512) Fix possible `dma_unmap_single()` on uninitialized pointer
    419733db212d s390/early: Copy last breaking event address to pt_regs
    18ca0c91dc51 wifi: mac80211: avoid weird state in error path
    c46f3f0da978 wifi: mac80211: don't complete management TX on SAE commit
    fc4289233e4b sched/fair: Bump sd->max_newidle_lb_cost when newidle balance fails
    302debf01d52 net: phy: bcm54811: PHY initialization
    c999814d0b9f s390/stp: Remove udelay from stp_sync_clock()
    56cabce6229a wifi: iwlwifi: mvm: fix scan request validation
    0cfcc16ecd02 um: Re-evaluate thread flags repeatedly
    0c7b57f9fd9c wifi: iwlwifi: mvm: set gtk id also in older FWs
    f01e06930444 bpf: Forget ranges when refining tnum after JSET
    1b9f54ac0bbc sched/deadline: Fix accounting after global limits change
    98761837889b perf/cxlpmu: Remove unintended newline from IRQ name format string
    027de6f3937d net: phy: micrel: Add ksz9131_resume()
    f19c83141bdc net: thunderx: Fix format-truncation warning in bgx_acpi_match_id()
    010ec8daeed8 net: ipv4: fix incorrect MTU in broadcast routes
    433a3592014b wifi: mac80211: don't unreserve never reserved chanctx
    89649d700772 wifi: cfg80211: Fix interface type validation
    1b1a54308465 net: mctp: Prevent duplicate binds
    1da38b70d90f can: ti_hecc: fix -Woverflow compiler warning
    f602c62c923f drm/amd/display: limit clear_update_flags to dcn32 and above
    e35e711c78c8 rcu: Protect ->defer_qs_iw_pending from data race
    a83ffafd02a7 drm/amd/pm: fix null pointer access
    3d03c85f850b arm64: Mark kernel as tainted on SAE and SError panic
    6547f890bd4e net: pcs: xpcs: mask readl() return value to 16 bits
    ae4053eefb0e net/mlx5e: Properly access RCU protected qdisc_sleeping variable
    31dcbba40eba net: ag71xx: Add missing check after DMA map
    2fddd59597eb et131x: Add missing check after DMA map
    29fe6bb14f20 wifi: rtw89: Lower the timeout in rtw89_fw_read_c2h_reg() for USB
    c673277d5761 wifi: rtw89: wow: Add Basic Rate IE to probe request in scheduled scan mode
    bd80fbf3ed25 idpf: preserve coalescing settings across resets
    9ea8fb379fdf libbpf: Verify that arena map exists when adding arena relocations
    efaa18e467e2 be2net: Use correct byte order and format string for TCP seq and ack_seq
    decbacd6a9c5 s390/time: Use monotonic clock in get_cycles()
    8ab6e67ae524 wifi: cfg80211: reject HTC bit for management frames
    1d325fed242d ktest.pl: Prevent recursion of default variable options
    2ef17d1476ab wifi: ath12k: Correct tid cleanup when tid setup fails
    82d399f5841f net: usb: cdc-ncm: check for filtering capability
    0c51db51c3ad wifi: iwlwifi: mvm: avoid outdated reorder buffer head_sn
    1706904ef005 xen/netfront: Fix TX response spurious interrupts
    76c26460f53c Bluetooth: hci_sock: Reset cookie to zero in hci_sock_free_cookie()
    e2b990cfeb04 Bluetooth: btusb: Add new VID/PID 0489/e14e for MT7925
    281d3fbe51fd powerpc/thp: tracing: Hide hugepage events under CONFIG_PPC_BOOK3S_64
    52f238dc6730 selftests: netfilter: Enable CONFIG_INET_SCTP_DIAG
    5376403f2714 netfilter: nft_set_pipapo: prefer kvmalloc for scratch maps
    9314cd0fb179 ASoC: qcom: use drvdata instead of component to keep id
    73a1a77630be ASoC: codecs: rt5640: Retry DEVICE_ID verification
    f1d285ed4b05 iio: adc: ad7768-1: Ensure SYNC_IN pulse minimum timing requirement
    91364d70f847 ALSA: usb-audio: Avoid precedence issues in mixer_quirks macros
    f301c878d08d ALSA: pcm: Rewrite recalculate_boundary() to avoid costly loop
    417407cdf587 ALSA: hda/ca0132: Fix buffer overflow in add_tuning_control
    55d2bc82f241 platform/chrome: cros_ec_typec: Defer probe on missing EC parent
    d1b0d93bfcaa platform/x86: thinkpad_acpi: Handle KCOV __init vs inline mismatches
    ed2089fe9359 soc: qcom: mdt_loader: Actually use the e_phoff
    add2219de2c8 imx8m-blk-ctrl: set ISI panic write hurry level
    e6601bb3cb94 pm: cpupower: Fix the snapshot-order of tsc,mperf, clock in mperf_stop()
    1dfeedf1d40e usb: core: usb_submit_urb: downgrade type check
    6254a6689366 usb: typec: intel_pmc_mux: Defer probe if SCU IPC isn't present
    2fce20decc6a ASoC: core: Check for rtd == NULL in snd_soc_remove_pcm_runtime()
    06db21c02c7a tty: serial: fix print format specifiers
    e0f748ef3799 ASoC: SOF: topology: Parse the dapm_widget_tokens in case of DSPless mode
    5b317a5f24ba ALSA: intel8x0: Fix incorrect codec index usage in mixer for ICH4
    7c0a62604c3f ASoC: hdac_hdmi: Rate limit logging on connection and disconnection
    24e7957e16c7 x86/bugs: Avoid warning when overriding return thunk
    37676c45c162 ALSA: hda: Disable jack polling at shutdown
    b2d9ff960a83 ALSA: hda: Handle the jack polling always via a work
    908d50aa38b2 platform/chrome: cros_ec_sensorhub: Retries when a sensor is not ready
    af34cc8c5ebf mmc: rtsx_usb_sdmmc: Fix error-path in sd_set_power_mode()
    612c8d21ce6e mei: bus: Check for still connected devices in mei_cl_bus_dev_release()
    8152499f09eb char: misc: Fix improper and inaccurate error code returned by misc_init()
    e285cdb9d2e4 reset: brcmstb: Enable reset drivers for ARCH_BCM2835
    5a96b1e9e9a5 pps: clients: gpio: fix interrupt handling order in remove path
    ae12c0666a07 selftests: vDSO: vdso_test_getrandom: Always print TAP header
    bdf159a29403 ACPI: APEI: GHES: add TAINT_MACHINE_CHECK on GHES panic path
    6f38d9ae4b6c mmc: sdhci-msm: Ensure SD card power isn't ON when card removed
    de12d2c69b5d ACPI: processor: fix acpi_object initialization
    9725102fb2a4 PM: sleep: console: Fix the black screen issue
    e90a4edb7e6a thermal: sysfs: Return ENODATA instead of EAGAIN for reads
    bf30f947c2d3 PM: runtime: Clear power.needs_force_resume in pm_runtime_reinit()
    de52cc040d90 firmware: tegra: Fix IVC dependency problems
    6c7e2caa35fc firmware: arm_scmi: power_control: Ensure SCMI_SYSPOWER_IDLE is set early during resume
    e20cc295149a ACPI: PRM: Reduce unnecessary printing to avoid user confusion
    fbfcc443c225 selftests: tracing: Use mutex_unlock for testing glob filter
    124e2ef3df71 tools/build: Fix s390(x) cross-compilation with clang
    9b0b3b5e5cae ARM: tegra: Use I/O memcpy to write to IRAM
    5c2390401841 gpio: tps65912: check the return value of regmap_update_bits()
    c0d5054684f0 iio: adc: ad_sigma_delta: don't overallocate scan buffer
    c8db5c7a00b1 tools/nolibc: define time_t in terms of __kernel_old_time_t
    f740ee4a0713 thermal/drivers/qcom-spmi-temp-alarm: Enable stage 2 shutdown when required
    db8c915a0335 ASoC: soc-dapm: set bias_level if snd_soc_dapm_set_bias_level() was successed
    694cd8ac4a59 EDAC/synopsys: Clear the ECC counters on init
    398961058303 PM / devfreq: governor: Replace sscanf() with kstrtoul() in set_freq_store()
    0223a3683d50 ARM: rockchip: fix kernel hang during smp initialization
    2cbf5564beeb cpufreq: intel_pstate: Add Granite Rapids support in no-HWP mode
    bd5cd23c7ae4 cpufreq: Exit governor when failed to start old governor
    50d210e1ff32 gpio: wcd934x: check the return value of regmap_update_bits()
    ecfe4ae9cb83 pmdomain: ti: Select PM_GENERIC_DOMAINS
    58383ea1b20a usb: typec: tcpm/tcpci_maxim: fix irq wake usage
    02e184dadb3d remoteproc: imx_rproc: skip clock enable when M-core is managed by the SCU
    cfc9bc15bda6 ACPI: APEI: send SIGBUS to current task if synchronous memory error not recovered
    97f503498981 soc: qcom: rpmh-rsc: Add RSC version 4 support
    0dd2456bb92f usb: xhci: Avoid showing errors during surprise removal
    a4f53e2ed5ae usb: xhci: Set avg_trb_len = 8 for EP0 during Address Device Command
    84430ce1f23a usb: xhci: Avoid showing warnings for dying controller
    1070a3355fcb usb: typec: ucsi: psy: Set current max to 100mA for BC 1.2 and Default
    1dd5bb380525 selftests/futex: Define SYS_futex on 32-bit architectures with 64-bit time_t
    31c0205923d9 cpufreq: CPPC: Mark driver with NEED_UPDATE_LIMITS flag
    a0560f861ad3 platform/x86/amd: pmc: Add Lenovo Yoga 6 13ALC6 to pmc quirk list
    83fc5d725729 usb: xhci: print xhci->xhc_state when queue_command failed
    c51db71fc143 tracefs: Add d_delete to remove negative dentries
    a24ed0e8ce7d securityfs: don't pin dentries twice, once is enough...
    136994f74e8f fix locking in efi_secret_unlink()
    c8e09674007b ext2: Handle fiemap on empty files to prevent EINVAL
    a482e56b2a73 pidfs: raise SB_I_NODEV and SB_I_NOEXEC
    e1b58b475981 fs/ntfs3: correctly create symlink for relative path
    2ac47f738ddf fs/ntfs3: Add sanity check for file name
    caf7f7c1a050 ata: libata-sata: Disallow changing LPM state if not supported
    86cc6d907200 ata: ahci: Disable DIPM if host lacks support
    aa078896e331 ata: ahci: Disallow LPM policy control if not supported
    afa5ceab9d23 better lockdep annotations for simple_recursive_removal()
    01e20eb22d1d hfs: fix not erasing deleted b-tree node issue
    7d483ad300fc drbd: add missing kref_get in handle_write_conflicts
    699b30248309 udf: Verify partition map count
    139a000d20f2 loop: Avoid updating block size under exclusive owner
    9d9b053f7f9c gfs2: Set .migrate_folio in gfs2_{rgrp,meta}_aops
    53a0249d68a2 gfs2: Validate i_depth for exhash directories
    b37768e48785 nvme-tcp: log TLS handshake failures at error level
    552e1a93b315 md/raid10: set chunk_sectors limit
    fc26f6f2e651 dm-stripe: limit chunk_sectors to the stripe size
    bc255fec6fd7 nvme-pci: try function level reset on init failure
    814cfdb6358d smb/server: avoid deadlock when linking with ReplaceIfExists
    58c364238177 firmware: arm_ffa: Change initcall level of ffa_init() to rootfs_initcall
    cd47a512e033 arm64: Handle KCOV __init vs inline mismatches
    1bb8da27ff15 hfsplus: don't use BUG_ON() in hfsplus_create_attributes_file()
    f7534cbfac0a hfsplus: fix slab-out-of-bounds read in hfsplus_uni2asc()
    475d770c1992 hfsplus: fix slab-out-of-bounds in hfsplus_bnode_read()
    efc095b35b23 hfs: fix slab-out-of-bounds in hfs_bnode_read()
    5d8b24952736 hfs: fix general protection fault in hfs_find_init()
    c0bffbc92a1c net: kcm: Fix race condition in kcm_unattach()
    eb0336f213fe tls: handle data disappearing from under the TLS ULP
    54f8f98665cc ptp: prevent possible ABBA deadlock in ptp_clock_freerun()
    1e25d8051bb6 cpuidle: governors: menu: Avoid using invalid recent intervals data
    a8df217c1415 intel_idle: Allow loading ACPI tables for any family
    7d757f17bc2e sctp: linearize cloned gso packets in sctp_rcv
    e9165b79a10d net: ti: icss-iep: Fix incorrect type for return value in extts_enable()
    8153bce470af net: ti: icssg-prueth: Fix emac link speed handling
    a2cb4df7872d netfilter: ctnetlink: fix refcount leak on table dump
    5e95347bf4ca udp: also consider secpath when evaluating ipsec use for checksumming
    2a1f36639741 mm/smaps: fix race between smaps_hugetlb_range and migration
    c07886761fd6 habanalabs: fix UAF in export_dmabuf()
    7ea3763d3a2c KVM: VMX: Preserve host's DEBUGCTLMSR_FREEZE_IN_SMM while running the guest
    a8db75995ada KVM: VMX: Wrap all accesses to IA32_DEBUGCTL with getter/setter APIs
    73a8e77bb5dd KVM: nVMX: Check vmcs12->guest_ia32_debugctl on nested VM-Enter
    6c6a7c69a006 KVM: VMX: Extract checking of guest's DEBUGCTL into helper
    56eb5c57e32c KVM: VMX: Allow guest to set DEBUGCTL.RTM_DEBUG if RTM is supported
    d1a530a22440 KVM: x86: Drop kvm_x86_ops.set_dr6() in favor of a new KVM_RUN flag
    1fc1d9b85408 KVM: x86: Convert vcpu_run()'s immediate exit param into a generic bitmap
    a831c3e679d4 smb: client: don't wait for info->send_pending == 0 on error
    65969af6dd5a smb: client: let send_done() cleanup before calling smbd_disconnect_rdma_connection()
    89237dd4c8c4 mm/memory-tier: fix abstract distance calculation overflow
    05ea5b2f5147 block: Make REQ_OP_ZONE_FINISH a write operation
    bf2809541497 ACPI: processor: perflib: Move problematic pr->performance check
    8cc2020d910f ACPI: processor: perflib: Fix initial _PPC limit application
    dba5701ed65f Documentation: ACPI: Fix parent device references
    7a2125962c42 eventpoll: Fix semi-unbounded recursion
    d4f9351243c1 fs: Prevent file descriptor table allocations exceeding INT_MAX
    cfe27f8aff2e fscrypt: Don't use problematic non-inline crypto engines
    a12df9e57922 clk: samsung: gs101: fix alternate mout_hsi0_usb20_ref parent clock
    fc4c256883f5 clk: samsung: gs101: fix CLK_DOUT_CMU_G3D_BUSD
    bc3c149be8ea clk: samsung: exynos850: fix a comment
    0bd77a08d592 sunvdc: Balance device refcount in vdc_port_mpgroup_check
    facc69f43502 LoongArch: Avoid in-place string operation on FDT content
    17bac5a345a2 LoongArch: Make relocate_new_kernel_size be a .quad value
    92ccdef6e441 LoongArch: Don't use %pK through printk() in unwinder
    f83d469e16bb LoongArch: BPF: Fix jump offset calculation in tailcall
    154bfe9acbdb PCI: Extend isolated function probing to LoongArch
    816a6f60c2c2 NFS: Fix the setting of capabilities when automounting a new filesystem
    944ec8c77544 NFSD: detect mismatch of file handle and delegation stateid in OPEN op
    74ad36ed60df nfsd: handle get_client_locked() failure in nfsd4_setclientid_confirm()
    ee2cd40b0bb4 net: usb: asix_devices: add phy_mask for ax88772 mdio bus
    e6ec7aa021d3 net: dpaa: fix device leak when querying time stamp info
    400177f147ab net: ti: icss-iep: fix device and OF node leaks at probe
    8de5f47f34f2 net: mtk_eth_soc: fix device leak at probe
    3328ff844e13 net: enetc: fix device and OF node leak at probe
    744d9cf898f3 net: gianfar: fix device leak when querying time stamp info
    ae59ec969c07 net: ftgmac100: fix potential NULL pointer access in ftgmac100_phy_disconnect
    e6269d987835 net: phy: micrel: fix KSZ8081/KSZ8091 cable test
    44ddd7b1ae0b netlink: avoid infinite retry looping in netlink_unicast()
    cb9bb872366e Revert "leds: trigger: netdev: Configure LED blink interval for HW offload"
    12c4d55dd0bd leds: flash: leds-qcom-flash: Fix registry access after re-bind
    f3a2d068e05c gpio: mlxbf3: use platform_get_irq_optional()
    1ce6f627a314 Revert "gpio: mlxbf3: only get IRQ for device instance 0"
    78b086e110ed gpio: mlxbf2: use platform_get_irq_optional()
    5d6c696da5f0 gpio: virtio: Fix config space reading.
    b3f7932c8eb4 smb: client: remove redundant lstrp update in negotiate protocol
    8de33d4d72e8 smb3: fix for slab out of bounds on mount to ksmbd
    33eb2d87e069 ALSA: hda/realtek: Add Framework Laptop 13 (AMD Ryzen AI 300) to quirks
    fc7fd29b284c ALSA: hda/realtek: Fix headset mic on HONOR BRB-X
    ae17b3b5e753 ALSA: usb-audio: Validate UAC3 cluster segment descriptors
    cd08d390d15b ALSA: usb-audio: Validate UAC3 power domain descriptors, too
    ecc39c79d913 io_uring: don't use int for ABI

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 8b8a87735c..aba255dfa3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b9c1961e3d966405a925249e8a75ddd436429286"
-SRCREV_meta ?= "ddf44e2c61ca41d03f51f460e7619488a70c6fc1"
+SRCREV_machine ?= "2f3bb461fad19a35096f049d947cc639f517e22b"
+SRCREV_meta ?= "b14d2173319779e94720b45b7be544da8a5f4026"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.42"
+LINUX_VERSION ?= "6.12.44"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 02ac0d068f..75d4116c3c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.42"
+LINUX_VERSION ?= "6.12.44"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "42fc5c3dd9290a70fe200ebe8fe3f6a2cc44fafa"
-SRCREV_meta ?= "ddf44e2c61ca41d03f51f460e7619488a70c6fc1"
+SRCREV_machine ?= "cb57c5e0ea50dc87ee76514c4237291a365c2cd9"
+SRCREV_meta ?= "b14d2173319779e94720b45b7be544da8a5f4026"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index c78cbb201e..1873fcc195 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "e743c42b3662ce1378f39deafff553e5a367751b"
-SRCREV_machine:qemuarm64 ?= "42fc5c3dd9290a70fe200ebe8fe3f6a2cc44fafa"
-SRCREV_machine:qemuloongarch64 ?= "42fc5c3dd9290a70fe200ebe8fe3f6a2cc44fafa"
-SRCREV_machine:qemumips ?= "5a890e642a2f5a693544e33a7d1fc160cc13238b"
-SRCREV_machine:qemuppc ?= "42fc5c3dd9290a70fe200ebe8fe3f6a2cc44fafa"
-SRCREV_machine:qemuriscv64 ?= "42fc5c3dd9290a70fe200ebe8fe3f6a2cc44fafa"
-SRCREV_machine:qemuriscv32 ?= "42fc5c3dd9290a70fe200ebe8fe3f6a2cc44fafa"
-SRCREV_machine:qemux86 ?= "42fc5c3dd9290a70fe200ebe8fe3f6a2cc44fafa"
-SRCREV_machine:qemux86-64 ?= "42fc5c3dd9290a70fe200ebe8fe3f6a2cc44fafa"
-SRCREV_machine:qemumips64 ?= "f35fbfe92ba17c777d450e16d5d0ffb30bac499d"
-SRCREV_machine ?= "42fc5c3dd9290a70fe200ebe8fe3f6a2cc44fafa"
-SRCREV_meta ?= "ddf44e2c61ca41d03f51f460e7619488a70c6fc1"
+SRCREV_machine:qemuarm ?= "62c2bce13752b28ac71dae8ea8d9364e55443b60"
+SRCREV_machine:qemuarm64 ?= "cb57c5e0ea50dc87ee76514c4237291a365c2cd9"
+SRCREV_machine:qemuloongarch64 ?= "cb57c5e0ea50dc87ee76514c4237291a365c2cd9"
+SRCREV_machine:qemumips ?= "2a0916216246246cacbe4cccab8ec82bf5632df4"
+SRCREV_machine:qemuppc ?= "cb57c5e0ea50dc87ee76514c4237291a365c2cd9"
+SRCREV_machine:qemuriscv64 ?= "cb57c5e0ea50dc87ee76514c4237291a365c2cd9"
+SRCREV_machine:qemuriscv32 ?= "cb57c5e0ea50dc87ee76514c4237291a365c2cd9"
+SRCREV_machine:qemux86 ?= "cb57c5e0ea50dc87ee76514c4237291a365c2cd9"
+SRCREV_machine:qemux86-64 ?= "cb57c5e0ea50dc87ee76514c4237291a365c2cd9"
+SRCREV_machine:qemumips64 ?= "8d94c777a9e942a599e10384f6747b3404368264"
+SRCREV_machine ?= "cb57c5e0ea50dc87ee76514c4237291a365c2cd9"
+SRCREV_meta ?= "b14d2173319779e94720b45b7be544da8a5f4026"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "880e4ff5d6c8dc6b660f163a0e9b68b898cc6310"
+SRCREV_machine:class-devupstream ?= "11a24528d080a6ac23f07d6031da9e271728d62d"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.42"
+LINUX_VERSION ?= "6.12.44"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


