Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C570C10F1A
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 12:05:50 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.8631.1715256342249932643
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 May 2024 05:05:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=AwyTYj2G;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6f4603237e0so597257b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 05:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1715256341; x=1715861141; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rHylKWN/9L5/MsGiM2RHeJmJLdSZg6ypi7QsB8DOzPA=;
        b=AwyTYj2GLFl43e0qVhx7E7JuQslRIU+6x7mSEhSvqT3/NYthSTUdn3mnLHxB3RCG1A
         6kFsGPWbakPkcJjGrh9Sw6FILFklYAE5TWar+tUZcK1F4+o1g/Qz0lasSoO1CS+8+/1y
         vAXIdR9vu5iYD9L4hJDRs6p5VEQm1+F8hFlGfmEh+fSSV7YxkgS/2/Eirq9BV1x5O7R1
         7Kw8dOJPo5IIQexfEX22op/fEnFvndc+Uq3au/qx8mzys69EaOnJfFu98/9J6oyFZ3Mg
         UPrb4baxPCHG4VIgZ5fO7MxIG/V7KxLcV4XzakCEju+nGQX7cB6DMTE9pVLCZlCQZFhW
         U87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715256341; x=1715861141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rHylKWN/9L5/MsGiM2RHeJmJLdSZg6ypi7QsB8DOzPA=;
        b=lGfN50g4h9FdzP8MN3tPuO1WpQS9aTZ1y8GqIOhSiiQMCIfSHqPta/leiMeXyOa2ZZ
         u+ylAj9pFl+ubM4LDYK1un3mGcDkEbDaPEFAnHbpldScXBVwEpha1Sdu+T6kEyzrVAKg
         ooJT/QPxne9geyX05ZgHHx8AcfdnQTEJoZSz86v5pbgX/kyBoWZRSBGgZbLKDjeWgvME
         LDBoMHhhjyklXFIh1FipWRh4KvnENwmFS/J0YXI8j8AUE2uPdDY7ikI1NbLYxmivBq22
         XbGiux3+RJEKZ03Gp6jxKII0Q+2c+dGxKbIhVKYUje7bxotepEhqODiqrxo3zZsw0+q6
         GoHA==
X-Gm-Message-State: AOJu0Yyw6yy2WAysIkdzqTAhqnQZMxVk8tSyUTjTxzgEiARark5M7NEj
	ktCsPibgc4G4ioEnRMztyfdQP5JUn/ewZnQkqxPrr0FydcLgv7z26AcS2jBwchMzU09MvYeUXTg
	+
X-Google-Smtp-Source: AGHT+IEvHu2ghJCXUbuskX9hgP0hNLjAGQPWy5uhWeA6z9qJiSvLzbyi8xOaxMmV7VB9vJQUDHbIWw==
X-Received: by 2002:a05:6a00:4b43:b0:6f3:ef08:747a with SMTP id d2e1a72fcca58-6f4c93387cfmr3692035b3a.12.1715256340447;
        Thu, 09 May 2024 05:05:40 -0700 (PDT)
Received: from xps13.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2af2c41sm1185613b3a.172.2024.05.09.05.05.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 05:05:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/23] linux-yocto/5.15: update to v5.15.155
Date: Thu,  9 May 2024 05:04:52 -0700
Message-Id: <d34a2df7a7bba954ec9e1a6f5c4a8f1b5789256c.1715256149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715256149.git.steve@sakoman.com>
References: <cover.1715256149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 12:05:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199161

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    fa3df276cd36 Linux 5.15.155
    b54c4632946a Revert "ACPI: CPPC: Use access_width over bit_width for system memory accesses"
    1793e6b2dae0 VMCI: Fix possible memcpy() run-time warning in vmci_datagram_invoke_guest_handler()
    dd883e0138f1 Bluetooth: btintel: Fixe build regression
    bb6b88270714 platform/x86: intel-vbtn: Update tablet mode switch at end of probe
    dfb2ce952143 randomize_kstack: Improve entropy diffusion
    7cfee26d1950 x86/mm/pat: fix VM_PAT handling in COW mappings
    abfae420789a virtio: reenable config if freezing device failed
    5d17986cbfd5 gcc-plugins/stackleak: Avoid .head.text section
    7e0bd07ce965 gcc-plugins/stackleak: Ignore .noinstr.text and .entry.text
    2d154a54c58f tty: n_gsm: require CAP_NET_ADMIN to attach N_GSM0710 ldisc
    6cbbe1ba76ee netfilter: nf_tables: discard table flag update with pending basechain deletion
    eb769ff4e281 netfilter: nf_tables: release mutex after nft_gc_seq_end from abort path
    37fc2cde9d19 netfilter: nf_tables: release batch on table validation from abort path
    48d6bcfc3175 fbmon: prevent division by zero in fb_videomode_from_videomode()
    e2ce8625c321 drivers/nvme: Add quirks for device 126f:2262
    871e695c08a3 fbdev: viafb: fix typo in hw_bitblt_1 and hw_bitblt_2
    3beea96d4fc8 ASoC: soc-core.c: Skip dummy codec when adding platforms
    eb7e92dbdc78 usb: sl811-hcd: only defined function checkdone if QUIRK2 is defined
    e0db818c0871 usb: typec: tcpci: add generic tcpci fallback compatible
    b6b12f4577a1 tools: iio: replace seekdir() in iio_generic_buffer
    1d5276914eb7 ring-buffer: use READ_ONCE() to read cpu_buffer->commit_page in concurrent environment
    39438227f888 ktest: force $buildonly = 1 for 'make_warnings_file' test type
    72794acdd16b platform/x86: touchscreen_dmi: Add an extra entry for a variant of the Chuwi Vi8 tablet
    18c51d97a242 Input: allocate keycode for Display refresh rate toggle
    baf8a6d2cdd1 RDMA/cm: add timeout to cm_destroy_id wait
    21e7d72d0cfc block: prevent division by zero in blk_rq_stat_sum()
    be113e082b65 libperf evlist: Avoid out-of-bounds access
    5dcded25c7e1 Revert "ACPI: PM: Block ASUS B1400CEAE from suspend to idle by default"
    504eb6b26ce8 SUNRPC: increase size of rpc_wait_queue.qlen from unsigned short to unsigned int
    343586deb873 drm/amd/display: Fix nanosec stat overflow
    ad207d1ca6d5 ext4: forbid commit inconsistent quota data when errors=remount-ro
    19b7a1ff81b7 ext4: add a hint for block bitmap corrupt state in mb_groups
    85f315792fac ALSA: firewire-lib: handle quirk to calculate payload quadlets as data block counter
    09de9c3614ad media: sta2x11: fix irq handler cast
    46e8711231b2 isofs: handle CDs with bad root inode but good Joliet root directory
    7849e6f8410d scsi: lpfc: Fix possible memory leak in lpfc_rcv_padisc()
    fd203d2c671b sysv: don't call sb_bread() with pointers_lock held
    0b75d679e88f pinctrl: renesas: checker: Limit cfg reg enum checks to provided IDs
    f917c66b1135 Input: synaptics-rmi4 - fail probing if memory allocation for "phys" fails
    006936ecb4ed Bluetooth: btintel: Fix null ptr deref in btintel_read_version
    b9117dc783c0 net/smc: reduce rtnl pressure in smc_pnet_create_pnetids_list()
    2f6174fd4ccf btrfs: send: handle path ref underflow in header iterate_inode_ref()
    a83c1f67a0f7 btrfs: export: handle invalid inode or root reference in btrfs_get_parent()
    d1ffa4ae2d59 btrfs: handle chunk tree lookup error in btrfs_relocate_sys_chunks()
    805a1cdde82f wifi: ath11k: decrease MHI channel buffer length to 8KB
    0f22f30f79a8 net: pcs: xpcs: Return EINVAL in the internal methods
    9a16a0d03305 tools/power x86_energy_perf_policy: Fix file leak in get_pkg_num()
    0ff96ec22a84 pstore/zone: Add a null pointer check to the psz_kmsg_read
    35f6b46eeb03 ionic: set adminq irq affinity
    ba30ee96e87a arm64: dts: rockchip: fix rk3399 hdmi ports node
    ba580534db14 arm64: dts: rockchip: fix rk3328 hdmi ports node
    64a7694c851c cpuidle: Avoid potential overflow in integer multiplication
    f4e70f422b76 panic: Flush kernel log buffer at the end
    130b0cd06487 VMCI: Fix memcpy() run-time warning in dg_dispatch_as_host()
    9ab8e24e81b9 wifi: ath9k: fix LNA selection in ath_ant_try_scan()
    ff45899e732e net: dsa: fix panic when DSA master device unbinds on shutdown
    cbac7de1d990 amdkfd: use calloc instead of kzalloc to avoid integer overflow
    cdfd0a7f0139 Linux 5.15.154
    8d8dc7ee5b98 x86: set SPECTRE_BHI_ON as default
    a976b129dc86 KVM: x86: Add BHI_NO
    c2b9e038896f x86/bhi: Mitigate KVM by default
    f825494f2c6f x86/bhi: Add BHI mitigation knob
    aa6247c9da25 x86/bhi: Enumerate Branch History Injection (BHI) bug
    a9ca0e34a406 x86/bhi: Define SPEC_CTRL_BHI_DIS_S
    bd53ec80f218 x86/bhi: Add support for clearing branch history at syscall entry
    55516b355b0c x86/syscall: Don't force use of indirect calls for system calls
    276fb9a658d0 x86/bugs: Change commas to semicolons in 'spectre_v2' sysfs file
    b9c5f7da76b1 nvme: fix miss command type check
    d225b0ac96dc gro: fix ownership transfer
    6564b014af92 mm/secretmem: fix GUP-fast succeeding on secretmem folios
    a479b4de11dd mptcp: don't account accept() of non-MPC client as fallback to TCP
    1f7e13d3e870 x86/retpoline: Do the necessary fixup to the Zen3/4 srso return thunk for !SRSO
    ff137c5c0dcf x86/bugs: Fix the SRSO mitigation on Zen3/4
    dff6072124f6 riscv: process: Fix kernel gp leakage
    fd9662109deb riscv: Fix spurious errors from __get/put_kernel_nofault
    6135537e1e66 s390/entry: align system call table on 8 bytes
    f860595512ff x86/mce: Make sure to grab mce_sysfs_mutex in set_bank()
    3ee242410754 of: dynamic: Synchronize of_changeset_destroy() with the devlink removals
    03c356860b8b driver core: Introduce device_link_wait_removal()
    5e32c0cc476d ALSA: hda/realtek: Update Panasonic CF-SZ6 quirk to support headset with microphone
    de48795233cc fs/pipe: Fix lockdep false-positive in watchqueue pipe_write()
    eaaaa49593e9 openrisc: Fix pagewalk usage in arch_dma_{clear, set}_uncached
    58e5349bb4ed HID: uhid: Use READ_ONCE()/WRITE_ONCE() for ->running
    f7a3090bfd3b nfsd: hold a lighter-weight client reference over CB_RECALL_ANY
    00f7576062a7 ata: sata_mv: Fix PCI device ID table declaration compilation warning
    e0ad4c270670 scsi: mylex: Fix sysfs buffer lengths
    117d7ef3190c ata: sata_sx4: fix pdc20621_get_from_dimm() on 64-bit
    e9b71370cbc7 ASoC: ops: Fix wraparound for mask in snd_soc_get_volsw
    562adaf79df4 ASoC: rt711-sdw: fix locking sequence
    bcf894d7eebe ASoC: rt711-sdca: fix locking sequence
    b53cf951389c ASoC: rt5682-sdw: fix locking sequence
    9df33e57f5c9 net: ravb: Always process TX descriptor ring
    fcc739d7f034 net: fec: Set mac_managed_pm during probe
    498cc233c460 drivers: net: convert to boolean for the mac_managed_pm flag
    0985fbfbcb8f net: usb: asix: suspend embedded PHY if external is used
    342cb04dcf2a i40e: Enforce software interrupt during busy-poll exit
    c9bcd6465538 i40e: Remove _t suffix from enum type names
    2a0a64c9d1d5 i40e: Store the irq number in i40e_q_vector
    bf7396ec564f Revert "usb: phy: generic: Get the vbus supply"
    506a9ec5d3f1 scsi: qla2xxx: Update manufacturer detail
    315c4527cdd8 scsi: qla2xxx: Update manufacturer details
    951d2748a2a8 i40e: fix vf may be used uninitialized in this function warning
    8db472e17dec i40e: fix i40e_count_filters() to count only active/new filters
    f53bea1c7971 octeontx2-pf: check negative error code in otx2_open()
    ec694ca1567e octeontx2-af: Fix issue with loading coalesced KPU profiles
    73a328df2c4a udp: prevent local UDP tunnel packets from being GROed
    7223f4ee4f31 udp: do not transition UDP GRO fraglist partial checksums to unnecessary
    d49ae15a5767 udp: do not accept non-tunnel GSO skbs landing in a tunnel
    63a10b530e22 mlxbf_gige: stop interface during shutdown
    40a344b2ddc0 ipv6: Fix infinite recursion in fib6_dump_done().
    61f5b43bc04e selftests: reuseaddr_conflict: add missing new line at the end of the output
    ee0088101bee erspan: make sure erspan_base_hdr is present in skb->head
    3f9a8b794fc9 selftests: net: gro fwd: update vxlan GRO test expectations
    457c832a0c5d net: stmmac: fix rx queue priority assignment
    a097fc199ab5 net/sched: act_skbmod: prevent kernel-infoleak
    d1e73fb19a4c bpf, sockmap: Prevent lock inversion deadlock in map delete elem
    465abe8a7af4 vboxsf: Avoid an spurious warning if load_nls_xxx() fails
    440e948cf0ef netfilter: validate user input for expected length
    2485bcfe05ee netfilter: nf_tables: Fix potential data-race in __nft_flowtable_type_get()
    f7e3c88cc2a9 netfilter: nf_tables: flush pending destroy work before exit_net release
    8ba81dca416a netfilter: nf_tables: reject new basechain after table flag update
    a9bd6bb6f02b KVM: x86: Mark target gfn of emulated atomic instruction as dirty
    bd9a25a0228e KVM: x86: Bail to userspace if emulation of atomic user access faults
    a7c6a643b25b thermal: devfreq_cooling: Fix perf state when calculate dfc res_util
    8d7132a67eeb mm, vmscan: prevent infinite loop for costly GFP_NOIO | __GFP_RETRY_MAYFAIL allocations
    b279ddce1030 Revert "x86/mm/ident_map: Use gbpages only where full GB page should be mapped."
    a180ca336989 io_uring: ensure '0' is returned on file registration success
    fe9df687e74a locking/rwsem: Disable preemption while trying for rwsem lock
    d49fac38479b net/rds: fix possible cp null dereference
    4143b9479caa xen-netfront: Add missing skb_mark_for_recycle
    a8170af8b10e Bluetooth: Fix TOCTOU in HCI debugfs implementation
    d6cfb0d7bb2d Bluetooth: hci_event: set the conn encrypted before conn establishes
    96bd0de3915f arm64: dts: qcom: sc7180-trogdor: mark bluetooth address as broken
    76299c3f11b4 x86/cpufeatures: Add CPUID_LNX_5 to track recently added Linux-defined word
    571d80f8a458 x86/cpufeatures: Add new word for scattered features
    9956d0504f0b r8169: fix issue caused by buggy BIOS on certain boards with RTL8168d
    b8438db83732 dm integrity: fix out-of-range warning
    bef3bc962dcc Octeontx2-af: fix pause frame configuration in GMP mode
    37dc1718dc0c bpf: Protect against int overflow for stack access size
    a583117668dd mlxbf_gige: call request_irq() after NAPI initialized
    85c410f65b36 ACPICA: debugger: check status of acpi_evaluate_object() in acpi_db_walk_for_fields()
    2e43d8eba6ed tcp: properly terminate timers for kernel sockets
    744494dbb058 s390/qeth: handle deferred cc1
    2fb283e2f3cc ixgbe: avoid sleeping allocation in ixgbe_ipsec_vf_add_sa()
    28db0ae86cb9 wifi: iwlwifi: mvm: rfi: fix potential response leaks
    254f1c252171 iwlwifi: mvm: rfi: use kmemdup() to replace kzalloc + memcpy
    d60ff8e04b17 mlxbf_gige: stop PHY during open() error paths
    ac68d9fa09e4 nfc: nci: Fix uninit-value in nci_dev_up and nci_ntf_packet
    5e1984aba37a USB: UAS: return ENODEV when submit urbs fail with device not attached
    e38f1ea6cbc5 scsi: usb: Stop using the SCSI pointer
    172800c69cd0 scsi: usb: Call scsi_done() directly
    1b175bc579f4 USB: core: Fix deadlock in usb_deauthorize_interface()
    ea8839e31942 scsi: lpfc: Correct size for wqe for memset()
    0f608ce96520 PCI/DPC: Quirk PIO log size for Intel Ice Lake Root Ports
    ff5305ec8c0e x86/cpu: Enable STIBP on AMD if Automatic IBRS is enabled
    34c0786ef6c7 scsi: qla2xxx: Delay I/O Abort on PCI error
    d37f3b14da07 scsi: qla2xxx: Change debug message during driver unload
    b03e626bd6d3 scsi: qla2xxx: Fix double free of fcport
    a859f6a8f423 scsi: qla2xxx: Fix command flush on cable pull
    0bd653100a8e scsi: qla2xxx: NVME|FCP prefer flag not being honored
    a139d643c5d6 scsi: qla2xxx: Split FCE|EFT trace control
    002caa257783 scsi: qla2xxx: Fix N2N stuck connection
    786121320183 scsi: qla2xxx: Prevent command send on chip reset
    f18f5fcdaa8c usb: typec: ucsi: Clear UCSI_CCI_RESET_COMPLETE before reset
    ad165b37fd4f usb: typec: ucsi: Ack unsupported commands
    df5cbb908f16 usb: udc: remove warning when queue disabled ep
    7de1df3212d8 usb: dwc2: gadget: LPM flow fix
    2cf845a770d6 usb: dwc2: gadget: Fix exiting from clock gating
    32d3f2f108eb usb: dwc2: host: Fix ISOC flow in DDMA mode
    555be0cc2a2f usb: dwc2: host: Fix hibernation flow
    3b1a9f852b4c usb: dwc2: host: Fix remote wakeup from hibernation
    489e8064ac00 USB: core: Add hub_get() and hub_put() routines
    7094516d7b30 staging: vc04_services: fix information leak in create_component()
    77a46fbfe6ae staging: vc04_services: changen strncpy() to strscpy_pad()
    cea234bb214b scsi: core: Fix unremoved procfs host directory regression
    8c9902216816 ALSA: sh: aica: reorder cleanup operations to avoid UAF bugs
    8bf22f8d1d53 drm/amd/display: Preserve original aspect ratio in create stream
    9e6bb089649a drm/amdgpu: Use drm_mode_copy()
    a86e54a34513 usb: cdc-wdm: close race between read and workqueue
    ac9b6b3e8d12 drm/i915/gt: Reset queue_priority_hint on parking
    553d294db94b net: ll_temac: platform_get_resource replaced by wrong function
    81b8645feca0 mmc: core: Avoid negative index with array access
    0ecd5689767b mmc: core: Initialize mmc_blk_ioc_data
    f2bbbeb8287f hexagon: vmlinux.lds.S: handle attributes section
    818e531cfb1d exec: Fix NOMMU linux_binprm::exec in transfer_args_to_stack()
    c8bddbd91bc8 wifi: mac80211: check/clear fast rx for non-4addr sta VLAN changes
    56e05d28c39b btrfs: zoned: use zone aware sb location for scrub
    3f0cda401d6e init: open /initrd.image with O_LARGEFILE
    c612edbc5ec6 mm/migrate: set swap entry values of THP tail pages properly.
    e635f652696e serial: sc16is7xx: convert from _raw_ to _noinc_ regmap functions for FIFO
    250219c6a556 vfio/fsl-mc: Block calling interrupt handler without trigger
    cc5838f19d39 vfio/platform: Create persistent IRQ handlers
    4cb0d7532126 vfio/pci: Create persistent INTx handler
    26a6a1e0b4ec vfio: Introduce interface to flush virqfd inject workqueue
    ec73e0797292 vfio/pci: Lock external INTx masking ops
    b7a2f0955ffc vfio/pci: Disable auto-enable of exclusive INTx IRQ
    c035ce9feb0c selftests: mptcp: diag: return KSFT_FAIL not test_cnt
    dc394fe41d6b powerpc: xor_vmx: Add '-mhard-float' to CFLAGS
    9bc9c11c151a efivarfs: Request at most 512 bytes for variable names
    36b5c35d43aa perf/core: Fix reentry problem in perf_output_read_group()
    ccd9fe71b9ee nfsd: Fix a regression in nfsd_setattr()
    e90402fb0697 nfsd: don't call locks_release_private() twice concurrently
    8b4fa191deed nfsd: don't take fi_lock in nfsd_break_deleg_cb()
    c6f8b3fcc627 nfsd: fix RELEASE_LOCKOWNER
    32c2cb2c0d37 nfsd: drop the nfsd_put helper
    c52fee7a1f98 nfsd: call nfsd_last_thread() before final nfsd_put()
    2267b2e84593 lockd: introduce safe async lock op
    6e5fed48d8b7 NFSD: fix possible oops when nfsd/pool_stats is closed.
    394d3f294a9a Documentation: Add missing documentation for EXPORT_OP flags
    56e5eeff6cfa nfsd: separate nfsd_last_thread() from nfsd_put()
    dec6b8bcac73 nfsd: Simplify code around svc_exit_thread() call in nfsd()
    05b452e8748b nfsd: Fix creation time serialization order
    760a6f755d94 NFSD: Add an nfsd4_encode_nfstime4() helper
    663ec8f5ffc4 lockd: drop inappropriate svc_get() from locked_get()
    9b405c0f84d9 nfsd: fix double fget() bug in __write_ports_addfd()
    645c1b4b139b nfsd: make a copy of struct iattr before calling notify_change
    4e6e49829151 NFSD: Fix problem of COMMIT and NFS4ERR_DELAY in infinite loop
    786e3248d5ef nfsd: simplify the delayed disposal list code
    a53d804930dc NFSD: Convert filecache to rhltable
    b27ee0682437 nfsd: allow reaping files still under writeback
    12f8f9fe1146 nfsd: update comment over __nfsd_file_cache_purge
    ad9cf5b1d017 nfsd: don't take/put an extra reference when putting a file
    b5a439e8b087 nfsd: add some comments to nfsd_file_do_acquire
    83a019b049db nfsd: don't kill nfsd_files because of lease break error
    55e429715edc nfsd: simplify test_bit return in NFSD_FILE_KEY_FULL comparator
    9fff2daca45a nfsd: NFSD_FILE_KEY_INODE only needs to find GC'ed entries
    bfa4a3996e73 nfsd: don't open-code clear_and_wake_up_bit
    b11d8162c24a nfsd: call op_release, even when op_func returns an error
    12eca509234a nfsd: don't replace page in rq_pages if it's a continuation of last page
    8e469b994407 NFSD: Protect against filesystem freezing
    17298e08006e NFSD: copy the whole verifier in nfsd_copy_write_verifier
    4161b518e4a9 nfsd: don't fsync nfsd_files on last close
    94e412c945e6 nfsd: fix courtesy client with deny mode handling in nfs4_upgrade_open
    a0df1c3326e7 NFSD: fix problems with cleanup on errors in nfsd4_copy
    22a0dd206a32 nfsd: don't hand out delegation on setuid files being opened for write
    80a15dc4a021 NFSD: fix leaked reference count of nfsd4_ssc_umount_item
    b3169b6ffe03 nfsd: clean up potential nfsd_file refcount leaks in COPY codepath
    31d4aa4584cf nfsd: allow nfsd_file_get to sanely handle a NULL pointer
    97522085eeec NFSD: enhance inter-server copy cleanup
    005ef7285fb9 nfsd: don't destroy global nfs4_file table in per-net shutdown
    0bc6d703109e nfsd: don't free files unconditionally in __nfsd_file_cache_purge
    958294a3eb82 NFSD: replace delayed_work with work_struct for nfsd_client_shrinker
    354eade5f278 NFSD: register/unregister of nfsd-client shrinker at nfsd startup/shutdown time
    72906e8da982 NFSD: Use set_bit(RQ_DROPME)
    d7cfba56fa75 Revert "SUNRPC: Use RMW bitops in single-threaded hot paths"
    0b778361998d nfsd: fix handling of cached open files in nfsd4_open codepath
    83a8aba1b725 nfsd: rework refcounting in filecache
    43afef9fab65 NFSD: Avoid clashing function prototypes
    1e9eac6a111c NFSD: Use only RQ_DROPME to signal the need to drop a reply
    d8065d0f2121 NFSD: add CB_RECALL_ANY tracepoints
    e18fc5fb2f00 NFSD: add delegation reaper to react to low memory condition
    ed36015f7ef9 NFSD: add support for sending CB_RECALL_ANY
    8766b38f54e9 NFSD: refactoring courtesy_client_reaper to a generic low memory shrinker
    ce0b786b6ebf trace: Relocate event helper files
    af7ee7ec1051 lockd: fix file selection in nlmsvc_cancel_blocked
    eb0433d95c84 lockd: ensure we use the correct file descriptor when unlocking
    281092cf3fc3 lockd: set missing fl_flags field when retrieving args
    d561fe540e80 NFSD: Use struct_size() helper in alloc_session()
    4e293f2d214c nfsd: return error if nfs4_setacl fails
    2c1be5d65d76 NFSD: Add an nfsd_file_fsync tracepoint
    8dafc6143041 nfsd: fix up the filecache laundrette scheduling
    e8f25bd0e842 filelock: add a new locks_inode_context accessor function
    dc468e079961 nfsd: reorganize filecache.c
    6340d965599d nfsd: remove the pages_flushed statistic from filecache
    99bf0850f399 NFSD: Fix licensing header in filecache.c
    43cf59a34b34 NFSD: Use rhashtable for managing nfs4_file objects
    323c83bde6d6 NFSD: Refactor find_file()
    2b03fd9fe4bc NFSD: Clean up find_or_add_file()
    d02c59ebe058 NFSD: Add a nfsd4_file_hash_remove() helper
    0b4436381ee0 NFSD: Clean up nfsd4_init_file()
    d78f7abe63fc NFSD: Update file_hashtbl() helpers
    94f52a094c24 NFSD: Use const pointers as parameters to fh_ helpers
    3d1af4319d25 NFSD: Trace delegation revocations
    0cf54e35894c NFSD: Trace stateids returned via DELEGRETURN
    cb966b357f01 NFSD: Clean up nfs4_preprocess_stateid_op() call sites
    6baa3dfe404b NFSD: Flesh out a documenting comment for filecache.c
    5fbeb6216e10 NFSD: Add an NFSD_FILE_GC flag to enable nfsd_file garbage collection
    a08d9df51c52 NFSD: Revert "NFSD: NFSv4 CLOSE should release an nfsd_file immediately"
    b34aa1a8c7a7 NFSD: Pass the target nfsd_file to nfsd_commit()
    81c3ab9b95bf exportfs: use pr_debug for unreachable debug statements
    10d55a17899a nfsd: allow disabling NFSv2 at compile time
    4d1fa40d54ae nfsd: move nfserrno() to vfs.c
    3b623a6a12b7 nfsd: ignore requests to disable unsupported versions
    1c2f1a171bf0 NFSD: Finish converting the NFSv3 GETACL result encoder
    98278765a215 NFSD: Remove redundant assignment to variable host_err
    28798577f805 NFSD: Simplify READ_PLUS
    19fbd8c2b53f nfsd: use locks_inode_context helper
    b11f5d7bc0ea lockd: use locks_inode_context helper
    071eb319ce4d NFSD: Fix reads with a non-zero offset that don't end on a page boundary
    e4d787430855 NFSD: Fix trace_nfsd_fh_verify_err() crasher
    3f439c7701d3 nfsd: put the export reference in nfsd4_verify_deleg_dentry
    98d400fc2d09 nfsd: fix use-after-free in nfsd_file_do_acquire tracepoint
    3ec2c9976c17 nfsd: fix net-namespace logic in __nfsd_file_cache_purge
    f17c07f8ea77 nfsd: ensure we always call fh_verify_error tracepoint
    15d01caf3587 NFSD: unregister shrinker when nfsd_init_net() fails
    d1b0ceeac1dc nfsd: rework hashtable handling in nfsd_do_file_acquire
    405ade5b561a nfsd: fix nfsd_file_unhash_and_dispose
    dde8424b249c fanotify: Remove obsoleted fanotify_event_has_path()
    a0ca9025c8be fsnotify: remove unused declaration
    6029a4f7ad98 fs/notify: constify path
    3af497e3f7cc nfsd: extra checks when freeing delegation stateids
    e55378bce5f6 nfsd: make nfsd4_run_cb a bool return function
    f6279fa0dc9d nfsd: fix comments about spinlock handling with delegations
    ecb0eb07eeda nfsd: only fill out return pointer on success in nfsd4_lookup_stateid
    4ad28d583e58 NFSD: Cap rsize_bop result based on send buffer size
    4794c948de06 NFSD: Rename the fields in copy_stateid_t
    0793ec49baaf nfsd: use DEFINE_SHOW_ATTRIBUTE to define nfsd_file_cache_stats_fops
    815efd78cbe8 nfsd: use DEFINE_SHOW_ATTRIBUTE to define nfsd_reply_cache_stats_fops
    861a163d4973 nfsd: use DEFINE_SHOW_ATTRIBUTE to define client_info_fops
    25e0dd89d455 nfsd: use DEFINE_SHOW_ATTRIBUTE to define export_features_fops and supported_enctypes_fops
    685d01c2b280 nfsd: use DEFINE_PROC_SHOW_ATTRIBUTE to define nfsd_proc_ops
    82fbfbe92d4b NFSD: Pack struct nfsd4_compoundres
    cd8bcaeeae6f NFSD: Remove unused nfsd4_compoundargs::cachetype field
    ba3bd2bf0c74 NFSD: Remove "inline" directives on op_rsize_bop helpers
    d8d3a672e159 NFSD: Clean up nfs4svc_encode_compoundres()
    fc47f8ddfc85 NFSD: Clean up WRITE arg decoders
    b3f3b21ed289 NFSD: Use xdr_inline_decode() to decode NFSv3 symlinks
    cab5399262ec NFSD: Refactor common code out of dirlist helpers
    07b68ff5c71c NFSD: Reduce amount of struct nfsd4_compoundargs that needs clearing
    2005eba603e9 SUNRPC: Parametrize how much of argsize should be zeroed
    9acc4812427e NFSD: add shrinker to reap courtesy clients on low memory condition
    8c9e5ad10357 NFSD: keep track of the number of courtesy clients in the system
    c65977020ba8 NFSD: Make nfsd4_remove() wait before returning NFS4ERR_DELAY
    d1ee3403e098 NFSD: Make nfsd4_rename() wait before returning NFS4ERR_DELAY
    50aa6a80d0a7 NFSD: Make nfsd4_setattr() wait before returning NFS4ERR_DELAY
    9863ece99e95 NFSD: Refactor nfsd_setattr()
    8a3c48cd5346 NFSD: Add a mechanism to wait for a DELEGRETURN
    bcd4c7511593 NFSD: Add tracepoints to report NFSv4 callback completions
    3fe32c519bef NFSD: Trace NFSv4 COMPOUND tags
    62980365d6e8 NFSD: Replace dprintk() call site in fh_verify()
    5118eb6c2926 nfsd: remove nfsd4_prepare_cb_recall() declaration
    4440588b936c nfsd: clean up mounted_on_fileid handling
    5f6f6b2a3bb1 NFSD: drop fname and flen args from nfsd_create_locked()
    37f3b9c39895 NFSD: Increase NFSD_MAX_OPS_PER_COMPOUND
    56ffc3ab884c nfsd: Propagate some error code returned by memdup_user()
    371d2d25bf61 nfsd: Avoid some useless tests
    211014047ec9 NFSD: remove redundant variable status
    5b6441a5d371 NFSD enforce filehandle check for source file in COPY
    285579928965 lockd: move from strlcpy with unused retval to strscpy
    574ec47ac850 NFSD: move from strlcpy with unused retval to strscpy
    460743da0e55 nfsd_splice_actor(): handle compound pages
    c9cb32ad429c NFSD: fix regression with setting ACLs.
    4b910dd7fe47 NFSD: discard fh_locked flag and fh_lock/fh_unlock
    7538fc9cba84 NFSD: use (un)lock_inode instead of fh_(un)lock for file operations
    e0335e7c4a51 NFSD: use explicit lock/unlock for directory ops
    ebd1b016ad4d NFSD: reduce locking in nfsd_lookup()
    ba4b518a23d3 NFSD: only call fh_unlock() once in nfsd_link()
    ff01da71e484 NFSD: always drop directory lock in nfsd_unlink()
    4655bcbce761 NFSD: change nfsd_create()/nfsd_symlink() to unlock directory before returning.
    d52acd23a327 NFSD: add posix ACLs to struct nfsd_attrs
    a3f27177c21b NFSD: add security label to struct nfsd_attrs
    8a26a1b5c887 NFSD: set attributes when creating symlinks
    183514794814 NFSD: introduce struct nfsd_attrs
    162f99ff7b95 NFSD: verify the opened dentry after setting a delegation
    3a5ab224a838 NFSD: drop fh argument from alloc_init_deleg
    b6494b36b80c NFSD: Move copy offload callback arguments into a separate structure
    8918b50537e9 NFSD: Add nfsd4_send_cb_offload()
    bb1eb9755892 NFSD: Remove kmalloc from nfsd4_do_async_copy()
    9cecf4772e8c NFSD: Refactor nfsd4_do_copy()
    a48454785bc9 NFSD: Refactor nfsd4_cleanup_inter_ssc() (2/2)
    4952fe668917 NFSD: Refactor nfsd4_cleanup_inter_ssc() (1/2)
    6cb00ba23083 NFSD: Replace boolean fields in struct nfsd4_copy
    6ff95a5f72eb NFSD: Make nfs4_put_copy() static
    9a99c7f5d98b NFSD: Reorder the fields in struct nfsd4_op
    7d1e44fd0637 NFSD: Shrink size of struct nfsd4_copy
    24286575c674 NFSD: Shrink size of struct nfsd4_copy_notify
    00eb5bd3844c NFSD: nfserrno(-ENOMEM) is nfserr_jukebox
    9032c8e3aecb NFSD: Fix strncpy() fortify warning
    0dfb19289614 NFSD: Clean up nfsd4_encode_readlink()
    fc7380a198f2 NFSD: Use xdr_pad_size()
    2528f487c825 NFSD: Simplify starting_len
    7bc543311784 NFSD: Optimize nfsd4_encode_readv()
    a70976ec89c2 NFSD: Add an nfsd4_read::rd_eof field
    2540b7042998 NFSD: Clean up SPLICE_OK in nfsd4_encode_read()
    3e7adac61db2 NFSD: Optimize nfsd4_encode_fattr()
    0d6c82286ddf NFSD: Optimize nfsd4_encode_operation()
    b9e6a5610b5c nfsd: silence extraneous printk on nfsd.ko insertion
    650417956a22 NFSD: limit the number of v4 clients to 1024 per 1GB of system memory
    59d35878294b NFSD: keep track of the number of v4 clients in the system
    0f202977cad1 NFSD: refactoring v4 specific code to a helper in nfs4state.c
    a52bb607abd0 NFSD: Ensure nf_inode is never dereferenced
    e3befca679a9 NFSD: NFSv4 CLOSE should release an nfsd_file immediately
    9be6499171fb NFSD: Move nfsd_file_trace_alloc() tracepoint
    06d9c87204b2 NFSD: Separate tracepoints for acquire and create
    4b338b528c43 NFSD: Clean up unused code after rhashtable conversion
    1bea66c08890 NFSD: Convert the filecache to use rhashtable
    208bd42a1a16 NFSD: Set up an rhashtable for the filecache
    0b3a69057db2 NFSD: Replace the "init once" mechanism
    76e2424c0d29 NFSD: Remove nfsd_file::nf_hashval
    ec30a456359c NFSD: nfsd_file_hash_remove can compute hashval
    7e8d4a933468 NFSD: Refactor __nfsd_file_close_inode()
    2aa9fd1db009 NFSD: nfsd_file_unhash can compute hashval from nf->nf_inode
    d6a23d45e2ef NFSD: Remove lockdep assertion from unhash_and_release_locked()
    e97c2d5a71cf NFSD: No longer record nf_hashval in the trace log
    1db19c3574f2 NFSD: Never call nfsd_file_gc() in foreground paths
    81e3c7702799 NFSD: Fix the filecache LRU shrinker
    ffb1a10a4405 NFSD: Leave open files out of the filecache LRU
    175f88a6d509 NFSD: Trace filecache LRU activity
    eed6df31603e NFSD: WARN when freeing an item still linked via nf_lru
    16cbc64f9ce4 NFSD: Hook up the filecache stat file
    4ade29dd0944 NFSD: Zero counters when the filecache is re-initialized
    a880dcef74da NFSD: Record number of flush calls
    ae76efbdfef7 NFSD: Report the number of items evicted by the LRU walk
    5ce93c611c13 NFSD: Refactor nfsd_file_lru_scan()
    5b6f8b083676 NFSD: Refactor nfsd_file_gc()
    c162c99a29f7 NFSD: Add nfsd_file_lru_dispose_list() helper
    4420d19ed4e4 NFSD: Report average age of filecache items
    c18563275fbc NFSD: Report count of freed filecache items
    b2dc4d30b0d8 NFSD: Report count of calls to nfsd_file_acquire()
    0369b53886ec NFSD: Report filecache LRU size
    f1785afc8946 NFSD: Demote a WARN to a pr_warn()
    f87230a7dbe4 nfsd: remove redundant assignment to variable len
    cad76843c768 NFSD: Fix space and spelling mistake
    dcbebc868503 NFSD: Instrument fh_verify()
    6345e92a9d0c NLM: Defend against file_lock changes after vfs_test_lock()
    3482739bd413 fsnotify: Fix comment typo
    b65b2d418759 fanotify: introduce FAN_MARK_IGNORE
    c1f1797a8316 fanotify: cleanups for fanotify_mark() input validations
    4c3723c53549 fanotify: prepare for setting event flags in ignore mask
    cbe3bf6fcdf1 fs: inotify: Fix typo in inotify comment
    f3222a6b66ae NFSD: Decode NFSv4 birth time attribute
    0a160dc54991 fanotify: refine the validation checks on non-dir inode mask
    47a1d1a2c1d5 NFS: restore module put when manager exits.
    261eabe19cb2 NFSD: Fix potential use-after-free in nfsd_file_put()
    ba68ab7d14dc NFSD: nfsd_file_put() can sleep
    f55b83a598db NFSD: Add documenting comment for nfsd4_release_lockowner()
    0775c8784e4c NFSD: Modernize nfsd4_release_lockowner()
    5e4ee807e35a nfsd: Fix null-ptr-deref in nfsd_fill_super()
    bf3182054995 nfsd: Unregister the cld notifier when laundry_wq create failed
    3a66ad7ea7b1 SUNRPC: Use RMW bitops in single-threaded hot paths
    7af208c9ea06 NFSD: Trace filecache opens
    73d9eb9e19c6 NFSD: Move documenting comment for nfsd4_process_open2()
    7dfad7f7da07 NFSD: Fix whitespace
    b54f6a079ab2 NFSD: Remove dprintk call sites from tail of nfsd4_open()
    106331a12b0f NFSD: Instantiate a struct file when creating a regular NFSv4 file
    ce2296da5dad NFSD: Clean up nfsd_open_verified()
    dabf24069b12 NFSD: Remove do_nfsd_create()
    62bac33a70e8 NFSD: Refactor NFSv4 OPEN(CREATE)
    ab407e0bf8d5 NFSD: Refactor NFSv3 CREATE
    3bd0ae962ba8 NFSD: Refactor nfsd_create_setattr()
    cf655c890bb6 NFSD: Avoid calling fh_drop_write() twice in do_nfsd_create()
    55cb08630eb6 NFSD: Clean up nfsd3_proc_create()
    2e0f8ee3c1ae NFSD: Show state of courtesy client in client info
    6e56a5f75c55 NFSD: add support for lock conflict to courteous server
    c3b2013544c8 fs/lock: add 2 callbacks to lock_manager_operations to resolve conflict
    a8040fed13ed fs/lock: add helper locks_owner_has_blockers to check for blockers
    d9fc2f8267e7 NFSD: move create/destroy of laundry_wq to init_nfsd and exit_nfsd
    492634cbfe3d NFSD: add support for share reservation conflict to courteous server
    26540b8940a2 NFSD: add courteous server support for thread with only delegation
    56bc7e3821e8 NFSD: Clean up nfsd_splice_actor()
    f14aa4a04472 fanotify: fix incorrect fmode_t casts
    40ca5d91b578 fsnotify: consistent behavior for parent not watching children
    f0628430d25d fsnotify: introduce mark type iterator
    a97561b460c7 fanotify: enable "evictable" inode marks
    c47bab4394a7 fanotify: use fsnotify group lock helpers
    7fcef3285ade fanotify: implement "evictable" inode marks
    33e91fb5eee5 fanotify: factor out helper fanotify_mark_update_flags()
    5054f130f81f fanotify: create helper fanotify_mark_user_flags()
    4f145b67c075 fsnotify: allow adding an inode mark without pinning inode
    3c9dc688678b dnotify: use fsnotify group lock helpers
    50612cd6a783 nfsd: use fsnotify group lock helpers
    35f3fad0e30a inotify: use fsnotify group lock helpers
    e419965d9323 fsnotify: create helpers for group mark_mutex lock
    cdf89b045b30 fsnotify: make allow_dups a property of the group
    ac51c087abd2 fsnotify: pass flags argument to fsnotify_alloc_group()
    d032dd5a823b inotify: move control flags from mask to mark flags
    93d2afc7d27c fs/lock: documentation cleanup. Replace inode->i_lock with flc_lock.
    e19ec9acfbcb fanotify: do not allow setting dirent events in mask of non-dir
    a98e5b3d958a nfsd: Clean up nfsd_file_put()
    893fa2b80235 nfsd: Fix a write performance regression
    091e4062ffd0 fsnotify: remove redundant parameter judgment
    fd7de66b50b5 fsnotify: optimize FS_MODIFY events with no ignored masks
    4bef66ca56d1 fsnotify: fix merge with parent's ignored mask
    7dcd851cf863 nfsd: fix using the correct variable for sizeof()
    bd0fee92b4e8 NFSD: Clean up _lm_ operation names
    a028a32ab617 NFSD: Remove CONFIG_NFSD_V3
    511360e1f526 NFSD: Move svc_serv_ops::svo_function into struct svc_serv
    a5deac8754d6 NFSD: Remove svc_serv_ops::svo_module
    7d94952cd5cf SUNRPC: Remove svc_shutdown_net()
    c3fa9c2d3666 SUNRPC: Rename svc_close_xprt()
    6c8231f0c289 SUNRPC: Rename svc_create_xprt()
    4c9a56a70b4d SUNRPC: Remove svo_shutdown method
    9d3cc211779a SUNRPC: Merge svc_do_enqueue_xprt() into svc_enqueue_xprt()
    466562c48101 SUNRPC: Remove the .svo_enqueue_xprt method
    61a9ecdb77c6 NFSD: Remove NFSD_PROC_ARGS_* macros
    b42c9b5d9c84 NFSD: Streamline the rare "found" case
    69e08eb5bf00 NFSD: Skip extra computation for RC_NOCACHE case
    863aed522ef0 orDate: Thu Sep 30 19:19:57 2021 -0400
    5b3110364f50 nfsd: Add support for the birth time attribute
    392c68189565 NFSD: Deprecate NFS_OFFSET_MAX
    91ec401bcd67 fsnotify: invalidate dcache before IN_DELETE event
    8d5d1b4956a1 NFSD: Move fill_pre_wcc() and fill_post_wcc()
    6be1619d4b05 NFSD: Trace boot verifier resets
    d83ffc800f12 NFSD: Rename boot verifier functions
    1510c051967e NFSD: Clean up the nfsd_net::nfssvc_boot field
    5b2cfc4bb751 NFSD: Write verifier might go backwards
    14d5c7263d42 nfsd: Add a tracepoint for errors in nfsd4_clone_file_range()
    399451927d0e NFSD: De-duplicate net_generic(SVC_NET(rqstp), nfsd_net_id)
    a330a794f428 NFSD: Clean up nfsd_vfs_write()
    e7a3814a0029 nfsd: Retry once in nfsd_open on an -EOPENSTALE return
    87e2bf374be2 nfsd: Add errno mapping for EREMOTEIO
    92453b36fabc nfsd: map EBADF
    1a197bcedf80 nfsd4: add refcount for nfsd4_blocked_lock
    64ff32b8ad80 nfs: block notification on fs with its own ->lock
    190a61768581 NFSD: De-duplicate nfsd4_decode_bitmap4()
    30000dff921e nfsd: improve stateid access bitmask documentation
    6f8664c6b50f NFSD: Combine XDR error tracepoints
    3bc94fb44f10 NFSD: simplify per-net file cache management
    fdf657bd7537 NFSD: Fix inconsistent indenting
    19fbf344ba33 NFSD: Remove be32_to_cpu() from DRC hash function
    018f6069471c NFS: switch the callback service back to non-pooled.
    a11fe42af525 lockd: use svc_set_num_threads() for thread start and stop
    f3f120852428 SUNRPC: always treat sv_nrpools==1 as "not pooled"
    5c377f380120 SUNRPC: move the pool_map definitions (back) into svc.c
    764ab3f970e6 lockd: rename lockd_create_svc() to lockd_get()
    d38cc54be6f3 lockd: introduce lockd_put()
    232cbc9b359d lockd: move svc_exit_thread() into the thread
    3b068224105c lockd: move lockd_start_svc() call into lockd_create_svc()
    ace565c3f246 lockd: simplify management of network status notifiers
    d30ef2cf0656 lockd: introduce nlmsvc_serv
    95364365f5b0 NFSD: simplify locking for network notifier.
    c1ef7e9d72d4 SUNRPC: discard svo_setup and rename svc_set_num_threads_sync()
    b11ea2be63b8 NFSD: Make it possible to use svc_set_num_threads_sync
    091b6f516c50 NFSD: narrow nfsd_mutex protection in nfsd thread
    dedfae92f9d7 SUNRPC: use sv_lock to protect updates to sv_nrthreads.
    e6f08647c559 nfsd: make nfsd_stats.th_cnt atomic_t
    c78050962735 SUNRPC: stop using ->sv_nrthreads as a refcount
    c6f2b5942783 SUNRPC/NFSD: clean up get/put functions.
    d021ef89a7de SUNRPC: change svc_get() to return the svc.
    4fdd01ce33b6 NFSD: handle errors better in write_ports_addfd()
    2049935c523e exit: Rename module_put_and_exit to module_put_and_kthread_exit
    dd6663096680 exit: Implement kthread_exit
    de7e2adfc784 fanotify: wire up FAN_RENAME event
    a187e777d74d fanotify: report old and/or new parent+name in FAN_RENAME event
    4b5743bdc592 fanotify: record either old name new name or both for FAN_RENAME
    9acb63f955ca fanotify: record old and new parent and name in FAN_RENAME event
    6a8facc4bd3e fanotify: support secondary dir fh and name in fanotify_info
    c8d3ee69ee5d fanotify: use helpers to parcel fanotify_info buffer
    3eec21b66085 fanotify: use macros to get the offset to fanotify_info buffer
    932090b8abf6 fsnotify: generate FS_RENAME event with rich information
    8bd3d40ea3df fanotify: introduce group flag FAN_REPORT_TARGET_FID
    395ff6dc9ba3 fsnotify: separate mark iterator type from object type enum
    f7d76fa9a881 fsnotify: clarify object type argument
    a20d087cdffc ext4: fix error code saved on super block during file system abort
    e11c8a6e8c92 nfsd4: remove obselete comment
    60f18f40ca88 NFSD:fix boolreturn.cocci warning
    0ca26103e06f nfsd: update create verifier comment
    bf0416e0284b SUNRPC: Change return value type of .pc_encode
    bd117f87569b SUNRPC: Replace the "__be32 *p" parameter to .pc_encode
    b24695861020 NFSD: Save location of NFSv4 COMPOUND status
    eadf587a2a25 SUNRPC: Change return value type of .pc_decode
    85658caa8bbf SUNRPC: Replace the "__be32 *p" parameter to .pc_decode
    10150232dcdd NFSD: Initialize pointer ni with NULL and not plain integer 0
    767727a7e02f NFSD: simplify struct nfsfh
    ed0815c8b7ca NFSD: drop support for ancient filehandles
    f829bb3a0682 NFSD: move filehandle format declarations out of "uapi".
    af12deba5335 NFSD: Optimize DRC bucket pruning
    61116d723ea2 NFS: Move NFS protocol display macros to global header
    53af55ba9ea2 NFS: Move generic FS show macros to global header
    f78ab849df2b SUNRPC: Tracepoints should display tk_pid and cl_clid as a fixed-size field
    20bbdbe31c0b NFS: Remove unnecessary TRACE_DEFINE_ENUM()s
    45e16146c159 docs: Document the FAN_FS_ERROR event
    b394c80e2c8d ext4: Send notifications on error
    0e825bc84df7 fanotify: Allow users to request FAN_FS_ERROR events
    c7c013dff4bd fanotify: Emit generic error info for error event
    92eb45210b87 fanotify: Report fid info for file related file system errors
    c8b6b09f3fb2 fanotify: WARN_ON against too large file handles
    ebd89f7d0737 fanotify: Add helpers to decide whether to report FID/DFID
    a83c3ed2e267 fanotify: Wrap object_fh inline space in a creator macro
    7aafd61567a9 fanotify: Support merging of error events
    c44d8071436c fanotify: Support enqueueing of error events
    9258a9908b6d fanotify: Pre-allocate pool of error events
    11280c7181b0 fanotify: Reserve UAPI bits for FAN_FS_ERROR
    c0a6b12ecde7 fsnotify: Support FS_ERROR event type
    965daffd0d15 fanotify: Require fid_mode for any non-fd event
    1dad39ebf451 fanotify: Encode empty file handle when no inode is provided
    5f34524dde58 fanotify: Allow file handle encoding for unhashed events
    900fe4d70474 fanotify: Support null inode event in fanotify_dfid_inode
    20bb62edd673 fsnotify: Pass group argument to free_event
    84f904f03116 fsnotify: Protect fsnotify_handle_inode_event from no-inode events
    4b6b5edcc701 fsnotify: Retrieve super block from the data field
    8eb16abe8937 fsnotify: Add wrapper around fsnotify_add_event
    e58d543a8cf2 fsnotify: Add helper to detect overflow_event
    3e63bff7acdb inotify: Don't force FS_IN_IGNORED
    dbeb08836b69 fanotify: Split fsid check from other fid mode checks
    cce35a487832 fanotify: Fold event size calculation to its own function
    8c7986c2bcc9 fsnotify: Don't insert unmergeable events in hashtable
    18370157880b fsnotify: clarify contract for create event hooks
    d92a8789fef6 fsnotify: pass dentry instead of inode data
    7d5be4f79dac fsnotify: pass data_type to fsnotify_name()
    764929accff3 x86/static_call: Add support for Jcc tail-calls
    7339b1ce5ea6 x86/alternatives: Teach text_poke_bp() to patch Jcc.d32 instructions
    f4ba357b0739 x86/alternatives: Introduce int3_emulate_jcc()
    9b4eff016dea x86/asm: Differentiate between code and function alignment
    ab8f581408c5 arch: Introduce CONFIG_FUNCTION_ALIGNMENT
    2ae88e83f3b7 KVM/x86: Export RFDS_NO and RFDS_CLEAR to guests
    2fb08b672eb7 x86/rfds: Mitigate Register File Data Sampling (RFDS)
    4fa001418efd Documentation/hw-vuln: Add documentation for RFDS
    a2b586df5546 x86/mmio: Disable KVM mitigation when X86_FEATURE_CLEAR_CPU_BUF is set
    598fb2804482 KVM/VMX: Move VERW closer to VMentry for MDS mitigation
    9fe80d3c1197 KVM/VMX: Use BT+JNC, i.e. EFLAGS.CF to select VMRESUME vs. VMLAUNCH
    913ae894c2b0 x86/bugs: Use ALTERNATIVE() instead of mds_user_clear static key
    d54de9f2a127 x86/entry_32: Add VERW just before userspace transition
    eabab0a5f13e x86/entry_64: Add VERW just before userspace transition
    f32b5db5fe35 x86/bugs: Add asm helpers for executing VERW
    6b54d55bb3bc x86/asm: Add _ASM_RIP() macro for x86-64 (%rip) suffix
    0a6f0f8702ea KVM: arm64: Limit stage2_apply_range() batch size to largest block
    b4926c95ad0f KVM: arm64: Work out supported block level at compile time
    142a01435c1e tty: serial: imx: Fix broken RS485
    9bd2f11ac9ef printk: Update @console_may_schedule in console_trylock_spinning()
    2280bb8577aa iommu/dma: Force swiotlb_max_mapping_size on an untrusted device
    aa4cc17b3418 dma-iommu: add iommu_dma_opt_mapping_size()
    f3e7d9471cc1 dma-mapping: add dma_opt_mapping_size()
    685e8332deff swiotlb: Fix alignment checks when both allocation and DMA masks are present
    cf716d5a0dd8 minmax: add umin(a, b) and umax(a, b)
    f2ad3ce0b0b8 entry: Respect changes to system call number by trace_sys_enter()
    2e2aadd6e175 clocksource/drivers/arm_global_timer: Fix maximum prescaler value
    4949affd5288 ACPI: CPPC: Use access_width over bit_width for system memory accesses
    ea592baf9e41 xen/events: close evtchn after mapping cleanup
    b3914fee0955 i2c: i801: Avoid potential double call to gpiod_remove_lookup_table
    4b12ff5edd14 tee: optee: Fix kernel panic caused by incorrect error handling
    a71cba07783a fs/aio: Check IOCB_AIO_RW before the struct aio_kiocb conversion
    0190d19d7651 vt: fix unicode buffer corruption when deleting characters
    7dc4ed980968 mei: me: add arrow lake point H DID
    e294f0eb3510 mei: me: add arrow lake point S DID
    fed1f00e4834 tty: serial: fsl_lpuart: avoid idle preamble pending if CTS is enabled
    a44c6c61af48 usb: port: Don't try to peer unused USB ports based on location
    92b051b87658 usb: gadget: ncm: Fix handling of zero block length packets
    6c1f36d92c0a USB: usb-storage: Prevent divide-by-0 error in isd200_ata_command
    f4ffa18d2eb0 ALSA: hda/realtek - Fix headset Mic no show at resume back for Lenovo ALC897 platform
    3e31af7c468b drm/i915: Check before removing mm notifier
    898127d612a2 tracing: Use .flush() call to wake up readers
    e126b508ed2e KVM: SVM: Flush pages under kvm->lock to fix UAF in svm_register_enc_region()
    461a4f333c5a xfrm: Avoid clang fortify warning in copy_to_user_tmpl()
    2fb9845251ce Drivers: hv: vmbus: Calculate ring buffer size for more efficient use of memory
    9a92743d533e netfilter: nf_tables: reject constant set with timeout
    7cdc1be24cc1 netfilter: nf_tables: disallow anonymous set with timeout flag
    291cca35818b netfilter: nf_tables: mark set as dead when unbinding anonymous set with timeout
    f381224482ec cpufreq: brcmstb-avs-cpufreq: fix up "add check for cpufreq_cpu_get's return value"
    df7889f78cc0 net: ravb: Add R-Car Gen4 support
    1e7d2f14a24f x86/pm: Work around false positive kmemleak report in msr_build_context()
    116562e804ff dm snapshot: fix lockup in dm_exception_table_exit
    76c1568ac842 drm/amd/display: Fix noise issue on HDMI AV mute
    efb754344932 drm/amd/display: Return the correct HDCP error code
    5d5f1a7f3b10 drm/amdgpu: amdgpu_ttm_gart_bind set gtt bound flag
    d69abe190a5f ahci: asm1064: asm1166: don't limit reported ports
    205c06684a18 ahci: asm1064: correct count of reported ports
    4be453271a88 wireguard: netlink: access device through ctx instead of peer
    710a177f3472 wireguard: netlink: check for dangling peer via is_dead instead of empty list
    3ff793aa0742 net: hns3: tracing: fix hclgevf trace event strings
    81b9ddd44d3a NFSD: Fix nfsd_clid_class use of __string_len() macro
    2031b61be8b7 x86/CPU/AMD: Update the Zenbleed microcode revisions
    d8ae3bf07ebc cpufreq: dt: always allocate zeroed cpumask
    ca581d237f3b nilfs2: prevent kernel bug at submit_bh_wbc()
    2e2619ff5d0d nilfs2: fix failure to detect DAT corruption in btree and direct mappings
    5a1729bc070f memtest: use {READ,WRITE}_ONCE in memory scanning
    e8d993bd36b6 drm/vc4: hdmi: do not return negative values from .get_modes()
    9ae98fc9fe4a drm/imx/ipuv3: do not return negative values from .get_modes()
    912c149a52c3 drm/exynos: do not return negative values from .get_modes()
    f781f0d82cf7 drm/panel: do not return negative error codes from drm_panel_get_modes()
    a55677878b93 s390/zcrypt: fix reference counting on zcrypt card objects
    9a3ca8292ce9 soc: fsl: qbman: Use raw spinlock for cgr_lock
    d378c937131a soc: fsl: qbman: Add CGR update function
    e25ceea9bc79 soc: fsl: qbman: Add helper for sanity checking cgr ops
    e6378314bb92 soc: fsl: qbman: Always disable interrupts when taking cgr_lock
    de0dcfa62306 ring-buffer: Use wait_event_interruptible() in ring_buffer_wait()
    73becffc5d08 ring-buffer: Fix full_waiters_pending in poll
    5a24b3a28d0c ring-buffer: Fix resetting of shortest_full
    d3229afd170b ring-buffer: Do not set shortest_full when full target is hit
    66fdf3a7cf52 ring-buffer: Fix waking up ring buffer readers
    34cd4d5de121 ksmbd: retrieve number of blocks using vfs_getattr in set_file_allocation_info
    f73c3e259593 vfio/platform: Disable virqfds on cleanup
    fc92804048f3 PCI: dwc: endpoint: Fix advertised resizable BAR size
    5273c56f3fd4 kbuild: Move -Wenum-{compare-conditional,enum-conversion} into W=1
    80d24b308b7e nfs: fix UAF in direct writes
    a323e5e98f46 PCI/AER: Block runtime suspend when handling errors
    967e74124f1e speakup: Fix 8bit characters from direct synth
    eebe53270b4f usb: gadget: tegra-xudc: Fix USB3 PHY retrieval logic
    fd8e9ef13ac7 phy: tegra: xusb: Add API to retrieve the port number of phy
    4960561a6c36 slimbus: core: Remove usage of the deprecated ida_simple_xx() API
    cf51c32c00c5 nvmem: meson-efuse: fix function pointer type mismatch
    239c669edb2b ext4: fix corruption during on-line resize
    d778917dd033 hwmon: (amc6821) add of_match table
    a6c13d23d9e0 landlock: Warn once if a Landlock action is requested while disabled
    6203f20d668c drm/etnaviv: Restore some id values
    05ecc53f9480 mmc: core: Fix switch on gp3 partition
    2da5568ee222 mm: swap: fix race between free_swap_and_cache() and swapoff()
    86a08ddff8bb swap: comments get_swap_device() with usage rule
    d3d858650933 mac802154: fix llsec key resources release in mac802154_llsec_key_del
    a3b6004bfc2f dm-raid: fix lockdep waring in "pers->hot_add_disk"
    125de155011c PCI/DPC: Quirk PIO log size for Intel Raptor Lake Root Ports
    4e194de3a961 PCI/DPC: Quirk PIO log size for certain Intel Root Ports
    ecbe3ca2ac9c PCI/ASPM: Make Intel DG2 L1 acceptable latency unlimited
    25f6c4c440b6 PCI: Work around Intel I210 ROM BAR overlap defect
    7cc94dd36e48 PCI/PM: Drain runtime-idle callbacks before driver removal
    95e86a8f1c9e PCI: Drop pci_device_remove() test of pci_dev->driver
    fa3762b45ea9 btrfs: fix off-by-one chunk length calculation at contains_pending_extent()
    bbf72db11fe6 serial: Lock console when calling into driver before registration
    63f8999cac33 printk/console: Split out code that enables default console
    3f6a9daf0da4 usb: typec: ucsi: Clean up UCSI_CABLE_PROP macros
    6eac5030fc97 fuse: don't unhash root
    773783681d87 fuse: fix root lookup with nonzero generation
    ede56884ccde mmc: tmio: avoid concurrent runs of mmc_request_done()
    f3f867201bb8 PM: sleep: wakeirq: fix wake irq warning in system suspend
    ad71f7bbd4c2 USB: serial: cp210x: add pid/vid for TDK NC0110013M and MM0110113M
    c1db6b1613ed USB: serial: option: add MeiG Smart SLM320 product
    f9bad5759668 USB: serial: cp210x: add ID for MGP Instruments PDS100
    1342e40c0779 USB: serial: add device ID for VeriFone adapter
    60e9148baf12 USB: serial: ftdi_sio: add support for GMC Z216C Adapter IR-USB
    c11808f4fb71 powerpc/fsl: Fix mfpmr build errors with newer binutils
    4a49d24fdec0 usb: xhci: Add error handling in xhci_map_urb_for_dma
    8f562f3b2517 clk: qcom: mmcc-msm8974: fix terminating of frequency table arrays
    3aedcf3755c7 clk: qcom: mmcc-apq8084: fix terminating of frequency table arrays
    9de184d4e557 clk: qcom: gcc-ipq8074: fix terminating of frequency table arrays
    b4527ee3de36 clk: qcom: gcc-ipq6018: fix terminating of frequency table arrays
    18f1f468dd79 PM: suspend: Set mem_sleep_current during kernel command line setup
    0552d5727e80 parisc: Strip upper 32 bit of sum in csum_ipv6_magic for 64-bit builds
    6a427a132e73 parisc: Fix csum_ipv6_magic on 64-bit systems
    c38df21ec9a0 parisc: Fix csum_ipv6_magic on 32-bit systems
    6817e1a1d650 parisc: Fix ip_fast_csum
    a903a1e93f3b parisc: Avoid clobbering the C/B bits in the PSW with tophys and tovirt macros
    60d6c5d40de9 mtd: rawnand: meson: fix scrambling mode value in command macro
    6f203afea2dc ubi: correct the calculation of fastmap size
    8ce982285414 ubi: Check for too small LEB size in VTBL code
    f19b1023a375 ubifs: Set page uptodate in the correct place
    b7fb63e807c6 fat: fix uninitialized field in nostale filehandles
    d2a7a81088c6 bounds: support non-power-of-two CONFIG_NR_CPUS
    218e2610b015 kasan/test: avoid gcc warning for intentional overflow
    76645e0f5a2a kasan: test: add memcpy test that avoids out-of-bounds write
    d05e6ba1b74a block: Clear zone limits for a non-zoned stacked queue
    447753bdd69b ext4: correct best extent lstart adjustment logic
    29d7089bed0d selftests/mqueue: Set timeout to 180 seconds
    4ae5a97781ce crypto: qat - resolve race condition during AER recovery
    b228e16a3ae1 crypto: qat - fix double free during reset
    980cc81298c0 sparc: vDSO: fix return value of __setup handler
    dc8c55b3ecbc sparc64: NMI watchdog: fix return value of __setup handler
    83d3c5e30961 KVM: Always flush async #PF workqueue when vCPU is being destroyed
    fec51819607f media: xc4000: Fix atomicity violation in xc4000_get_frequency
    5e4b23e7a7b3 pci_iounmap(): Fix MMIO mapping leak
    899e154f9546 drm/vmwgfx: Fix possible null pointer derefence with invalid contexts
    29a327c4544a arm: dts: marvell: Fix maxium->maxim typo in brownstone dts
    840e1b69081a smack: Handle SMACK64TRANSMUTE in smack_inode_setsecurity()
    28b78c7b620e smack: Set SMACK64TRANSMUTE only for dirs in smack_inode_setxattr()
    8b47e69ac83e clk: qcom: gcc-sdm845: Add soft dependency on rpmhpd
    0fa86b3b6a15 media: staging: ipu3-imgu: Set fields before media_entity_pads_init()
    8c36205123dc wifi: brcmfmac: Fix use-after-free bug in brcmf_cfg80211_detach
    2382f2e45c71 timers: Rename del_timer_sync() to timer_delete_sync()
    2a873e61782f timers: Use del_timer_sync() even on UP
    1c2f22864bcd timers: Update kernel-doc for various functions
    85c3bdff671f KVM: x86: Use a switch statement and macros in __feature_translate()
    01771ffad6f1 KVM: x86: Advertise CPUID.(EAX=7,ECX=2):EDX[5:0] to userspace
    e99e8685fde5 KVM: x86: Update KVM-only leaf handling to allow for 100% KVM-only leafs
    9ccce26837a8 x86/bugs: Use sysfs_emit()
    4957fd741d61 x86/cpu: Support AMD Automatic IBRS
    26445d9bb036 Documentation/hw-vuln: Update spectre doc
    8d1bab770956 locking/rwsem: Disable preemption while trying for rwsem lock
    7c82dac02886 block, loop: support partitions without scanning
    45f504f301d4 bpftool: Fix pretty print dump for maps without BTF loaded
    1f24338cb789 jbd2: Drop the merge conflicted hunk
    e1d0e3c51bde tpm: tis_i2c: Limit write bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    1abe841fe331 tpm: tis_i2c: Limit read bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    6224acfc1d56 tpm: Add flag to use default cancellation policy
    1cd19d48fb90 tpm: tis_i2c: Fix sanity check interrupt enable mask
    a883da132fa8 tpm: Add tpm_tis_i2c backend for tpm_tis_core
    a742ac8a1c51 tpm: Add tpm_tis_verify_crc to the tpm_tis_phy_ops protocol layer
    ef495c5f45f2 tpm: Remove read16/read32/write32 calls from tpm_tis_phy_ops
    1f3be2e23aa6 gcc-plugins: Reorganize gimple includes for GCC 13
    24615a3b932a ata: ahci: fix enum constants for gcc-13
    5d6cb145541a net: stmmac: Enable mac_managed_pm phylink config
    fd93aabb4287 tools/resolve_btfids: Use pkg-config to locate libelf
    130f9da78406 tools/resolve_btfids: Build with host flags
    00f2f1a782f9 tools/resolve_btfids: Support cross-building the kernel with clang
    17776a4ba9c2 tools/resolve_btfids: Install libbpf headers when building
    7c9808380d70 libbpf: Make libbpf_version.h non-auto-generated
    37ae1ba791ac libbpf: Add LIBBPF_DEPRECATED_SINCE macro for scheduling API deprecations
    a2667e6d7314 drm/radeon: free iio for atombios when driver shutdown
    f100c753aa1f powerpc: Fix reschedule bug in KUAP-unlocked user copy
    da5513f30187 libbpf: Fix build warning on ref_ctr_off
    4c5a089621a8 perf python: Account for multiple words in CC
    1c5699ee85d4 fs: move S_ISGID stripping into the vfs_*() helpers
    838f5d0701d8 fs: add mode_strip_sgid() helper
    d97172683641 squashfs: provide backing_dev_info in order to disable read-ahead
    ed037d7be40c irq_work: use kasan_record_aux_stack_noalloc() record callstack
    1363bd7dbde3 ixgbevf: add disable link state
    e5601ae2bd24 ixgbe: add improvement for MDD response functionality
    caa57cd80575 ixgbe: add the ability for the PF to disable VF link state
    16a77bfcc7df Check /dev/console using init_stat()
    04574fd5579a tracing/arm: Have max stack tracer handle the case of return address after data
    0e51e5717018 gpiolib: cdev: Set lineevent_state::irq after IRQ register successfully
    1e6b7da6ddba drivers/base: Fix unsigned comparison to -1 in CPUMAP_FILE_MAX_BYTES
    493160901320 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    04224f725aa3 irqchip/gic-v3-its: Skip HP notifier when no ITS is registered
    6f6c2996a81c irqchip/gic-v3-its: Postpone LPI pending table freeing and memreserve
    1fa94473423f irqchip/gic-v3-its: Give the percpu rdist struct its own flags field
    6013d1ae5feb cert host tools: Stop complaining about deprecated OpenSSL functions
    efe20512212b init/Kconfig: fix CC_HAS_ASM_GOTO_TIED_OUTPUT test with dash
    a40d2daf2795 pnmtologo: use relocatable file name
    3b40d5b41155 of: configfs: remove unused variable overlay_lock
    6c085baf1838 tools: use basename to identify file in gen-mach-types
    2fca0fd71981 lib/build_OID_registry: fix reproducibility issues
    0f586f4ee8ad vt/conmakehash: improve reproducibility
    a75774679f28 OF: DT-Overlay configfs interface (v8)
    d179c639b30b x86/boot: Wrap literal addresses in absolute_pointer()
    856ec356cf91 ACPI: thermal: drop an always true check
    7614af249993 xfs: Fix -Werror=dangling-pointer work-around for older GCC
    41470215f97e xfs: Work around GCC 12 -Werror=dangling-pointer for xfs_attr_remote.o
    44a445c1922d virtio-pci: Remove wrong address verification in vp_del_vqs()
    77aa9e489eaf bpf: Disallow unprivileged bpf by default
    ebfb1822e9f9 fs/aufs: fixup 5.15.36 fixups
    4eba9348d3e2 Revert "Revert "fbdev: Hot-unplug firmware fb devices on forced removal""
    5df6d1b00f95 jbd2: fix use-after-free of transaction_t race
    2d83e8196487 jbd2: refactor wait logic for transaction updates into a common function
    07a63f760793 netfilter: conntrack: avoid useless indirection during conntrack destruction
    4e7122625996 Revert "fbdev: Hot-unplug firmware fb devices on forced removal"
    7ba4cb36fd4f rcu: Avoid alloc_pages() when recording stack
    f78574dee71e kasan: test: silence intentional read overflow warnings
    d313cb89b6b1 kasan: arm64: fix pcpu_page_first_chunk crash with KASAN_VMALLOC
    5e279d5647cc arm64: support page mapping percpu first chunk allocator
    e5bf16752dca vmalloc: choose a better start address in vm_area_register_early()
    660b3d21b46f kasan: test: bypass __alloc_size checks
    00aa7573e53a kasan: test: add memcpy test that avoids out-of-bounds write
    67becf0b1bd4 kasan: fix tag for large allocations when using CONFIG_SLAB
    bedf1e033213 workqueue, kasan: avoid alloc_pages() when recording stack
    7195b67ce69b kasan: generic: introduce kasan_record_aux_stack_noalloc()
    bdff763f0e29 kasan: common: provide can_alloc in kasan_save_stack()
    51423ebb36ad lib/stackdepot: introduce __stack_depot_save()
    85373e66d847 lib/stackdepot: remove unused function argument
    5b6cc9b251f3 lib/stackdepot: include gfp.h
    c9f3902d8069 aufs: reduce overhead for "code present but disabled" use case.
    b98d189df02c aufs: bugfix, umount passes NULL to ->parse_monolithic()
    13b883cbbbd9 aufs standalone: cosmetic, missing copyright sentence
    21f8b0d81898 aufs: 5.15.5-20220117 ---> 5.15.5-20220221
    6199fd896645 aufs: tiny, headers after fs_context
    8ddb40e31c29 aufs: fs_context 7/7, finally remount
    69035f71c6fd aufs: fs_context 6/7, now mount
    bc841b970697 aufs: fs_context 5/7, parse all other mount options
    435188053da2 aufs: fs_context 4/7, parse xino options
    9af1f1825cbd aufs: fs_context 3/7, parse the branch-management options
    1c05eb767f8c aufs: fs_context 2/7, parse "br" mount option
    a8488f603134 aufs: fs_context 1/7, skelton of the new shceme
    8e32e0015564 aufs: pre fs_context, convert a static flag to a macro
    f90cb4144aec aufs: pre fs_context, support the incomplete sb and sbinfo case
    948762ef859c aufs: pre fs_context, convert the type of alloc_sbinfo()
    77151a08776b aufs: 5.15.5-20211129 ---> 5.15.5-20220117
    2539adbbbe1e aufs: 5.14-20211018 ---> 5.15.5-20211129
    7d32b25193c4 aufs: for v5.15-rc1, sync_inode() is gone
    66ec0c509225 aufs: for v5.15-rc1, new param 'rcu' for ->get_acl()
    69709dc518cd aufs: for v5.15-rc1, no mand-lock anymore
    ada8fe9543e5 aufs: 5.14-20210906  ---> 5.14-20211018
    b77f7f3f394a Revert "aufs: adjust to v5.15 fs changes"
    81bdce5b5876 tick/nohz: WARN_ON --> WARN_ON_ONCE to prevent console saturation
    97c963889222 sched/isolation: really align nohz_full with rcu_nocbs
    871f23ad3627 Revert "ARM: defconfig: Enable ax88796c driver for Exynos boards"
    ffad0783dd5b ARM: config: multi v7: Regenerate defconifg
    5c1e1a1ff2d3 ARM: config: multi v7: Add renamed symbols
    badaf96564fe ARM: config: multi v7: Clean up enabled by default options
    34996040fc9b ARM: config: multi v7: Drop unavailable options
    7f685244afb3 powerpc/mm: Switch obsolete dssall to .long
    20301aeb1a64 riscv: fix build with binutils 2.38
    9df58d070506 powerpc/lib/sstep: fix 'ptesync' build error
    720b61fc400b x86_64_defconfig: Fix warnings
    02bf23d26bc4 arm64: defconfig: cleanup config options
    05914e2c87e5 arm: defconfig: drop unused POWER_AVS option
    ffb532fa19b9 aufs5: fix build against v5.15.3+
    a4b3abf4d96d qemux86: add configuration symbol to select values
    fee94ee09154 clear_warn_once: add a clear_warn_once= boot parameter
    3d8762d900d9 clear_warn_once: bind a timer to written reset value
    95faacac47e8 clear_warn_once: expand debugfs to include read support
    de20c4240018 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    0e4aacead9c1 perf: x86-32: explicitly include <errno.h>
    9ad92c11468e perf: mips64: Convert __u64 to unsigned long long
    09e7efe3e68a perf: fix bench numa compilation
    e79becc44fa6 perf: add SLANG_INC for slang.h
    b1033b588681 perf: add sgidefs.h to for mips builds
    cf9db484ac0b perf: change --root to --prefix for python install
    7fd052c2c562 perf: add 'libperl not found' warning
    27a437cdd469 perf: force include of <stdbool.h>
    3b99d21bec2f fat: don't use obsolete random32 call in namei_vfat
    a7e9293b506b FAT: Added FAT_NO_83NAME
    6fd0e71d9e5c FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    c379b0d324ae FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    538be0fdb124 aufs: adjust to v5.15 fs changes
    f45da75c8759 aufs5: core
    047f57e07e01 aufs5: standalone
    029fc15574c8 aufs5: mmap
    610d0192ee94 aufs5: base
    d4e428d0ec5f aufs5: kbuild
    eb067eca251a yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    286af18d0875 yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    24d59a4e26a6 yaffs2: v5.12+ build fixups (not runtime tested)
    22c73536d5d7 yaffs: include blkdev.h
    506b7251bfb8 yaffs: fix misplaced variable declaration
    a0e26ff364dc yaffs2: v5.6 build fixups
    b10b1b2d169e yaffs2: fix memory leak when /proc/yaffs is read
    ad9adccbb214 yaffs: add strict check when call yaffs_internal_read_super
    2e3c3aec8279 yaffs: repair yaffs_get_mtd_device
    d662538516a7 yaffs: Fix build failure by handling inode i_version with proper atomic API
    70a6113ee2c7 yaffs2: fix memory leak in mount/umount
    3378e4a9e404 yaffs: Avoid setting any ACL releated xattr
    ec2284edddef Yaffs:check oob size before auto selecting Yaffs1
    c2a49874051c fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    e9a5105a3e73 yaffs2: adjust to proper location of MS_RDONLY
    608807406f13 yaffs2: import git revision b4ce1bb (jan, 2020)
    89e660ece42c initramfs: allow an optional wrapper script around initramfs generation
    b179dbc9aa10 iwlwifi: select MAC80211_LEDS conditionally
    3fd5ca3673d0 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    d1f6edbf0188 arm64/perf: Fix wrong cast that may cause wrong truncation
    d202fb2caf33 defconfigs: drop obselete options
    9a27e3b5f4e7 arm64/perf: fix backtrace for AAPCS with FP enabled
    e20d8cf019b4 linux-yocto: Handle /bin/awk issues
    b6d2a3dbbd3a uvesafb: provide option to specify timeout for task completion
    adb40f1e6a1a uvesafb: print error message when task timeout occurs
    f280a1ed0962 compiler.h: Undef before redefining __attribute_const__
    4352732f268c vmware: include jiffies.h
    7954a677968d Resolve jiffies wrapping about arp
    5f28a1035d95 nfs: Allow default io size to be configured.
    0d7260ad7106 check console device file on fs when booting
    900a12e37e0a mount_root: clarify error messages for when no rootfs found
    7b878cbea726 menuconfig,mconf-cfg: Allow specification of ncurses location
    6604fc1763b3 modpost: mask trivial warnings
    0d294adb09cb kbuild: exclude meta directory from distclean processing
    a097cdd95a9e powerpc: serialize image targets
    5db6ec39a0a3 arm: serialize build targets
    cbabca27905e crtsavres: fixups for 5.4+
    7fc7656ed403 powerpc/ptrace: Disable array-bounds warning with gcc8
    a5faac5a19a2 powerpc: Disable attribute-alias warnings from gcc8
    186c54665b67 powerpc: add crtsavres.o to archprepare for kbuild
    d1ea862964ca powerpc: kexec fix for powerpc64
    2ac35b89a0f9 powerpc: Add unwind information for SPE registers of E500 core
    2e1c348a28bb mips: vdso: fix 'jalr $t9' crash in vdso code
    ec57870b303a mips: Kconfig: add QEMUMIPS64 option
    6a81b3c08107 4kc cache tlb hazard: tlbp cache coherency
    74e3b2a21e54 malta uhci quirks: make allowance for slow 4k(e)c
    22e65b63d3b4 arm/Makefile: Fix systemtap
    b7f1ab59f19e vexpress: Pass LOADADDR to Makefile
    ce2800c73bf7 arm: ARM EABI socketcall
    019d142fd956 ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 5ad7febb20..f6ff6ede18 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "bf104e8f5db008e45d982ff2d96b136e619be9ee"
-SRCREV_meta ?= "0b6359f487c6f8dc0d6adb061dd5afe476cc71a2"
+SRCREV_machine ?= "450d764329026c622d2fcc8e0841ee8c003deb48"
+SRCREV_meta ?= "9f60e205e8e28fdf90fbceb54c6ed2aec0b42ed3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.153"
+LINUX_VERSION ?= "5.15.155"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index a55ad58eaa..6e59eb6ceb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.153"
+LINUX_VERSION ?= "5.15.155"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "4ef577ca14a247aa0c3283ad1fc3f5c9dcc80e63"
-SRCREV_meta ?= "0b6359f487c6f8dc0d6adb061dd5afe476cc71a2"
+SRCREV_machine ?= "b662753bbd1caacf51d1cef578eceb1b58a753f0"
+SRCREV_meta ?= "9f60e205e8e28fdf90fbceb54c6ed2aec0b42ed3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 8026be18a8..b6d7fbf7c1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "019dfee2a419e087baacbfca08d7bbb2bfd26ec5"
-SRCREV_machine:qemuarm64 ?= "17269f6b7e7ddf2178fb957f7e3f4c038de10f51"
-SRCREV_machine:qemumips ?= "a0b4f69bd55db8f36a749febbe952ed635677faf"
-SRCREV_machine:qemuppc ?= "9768dfa1dde96b13c14a40a7abb936217d8ac1ef"
-SRCREV_machine:qemuriscv64 ?= "163500b871852fd7eb5f148948583ca7bed338db"
-SRCREV_machine:qemuriscv32 ?= "163500b871852fd7eb5f148948583ca7bed338db"
-SRCREV_machine:qemux86 ?= "163500b871852fd7eb5f148948583ca7bed338db"
-SRCREV_machine:qemux86-64 ?= "163500b871852fd7eb5f148948583ca7bed338db"
-SRCREV_machine:qemumips64 ?= "5a278da2a79b5b84ce6bb6a6e19af7b1f30af0b2"
-SRCREV_machine ?= "163500b871852fd7eb5f148948583ca7bed338db"
-SRCREV_meta ?= "0b6359f487c6f8dc0d6adb061dd5afe476cc71a2"
+SRCREV_machine:qemuarm ?= "699ce07e7326d5a4143655ab8416bf7b8d641260"
+SRCREV_machine:qemuarm64 ?= "1f8f9d20707574ce56ab3ada6554c2a9cbce55fb"
+SRCREV_machine:qemumips ?= "5eeedd87a05a973e797357c61564c2e82cff7755"
+SRCREV_machine:qemuppc ?= "5f854a0765bf57db2289780152651d2b463fb41e"
+SRCREV_machine:qemuriscv64 ?= "97a728f8e22ebd7ed35066e01060e97b4a89da05"
+SRCREV_machine:qemuriscv32 ?= "97a728f8e22ebd7ed35066e01060e97b4a89da05"
+SRCREV_machine:qemux86 ?= "97a728f8e22ebd7ed35066e01060e97b4a89da05"
+SRCREV_machine:qemux86-64 ?= "97a728f8e22ebd7ed35066e01060e97b4a89da05"
+SRCREV_machine:qemumips64 ?= "9aa2c6f70ea08ee03c53ed3a96b91907db782dd8"
+SRCREV_machine ?= "97a728f8e22ebd7ed35066e01060e97b4a89da05"
+SRCREV_meta ?= "9f60e205e8e28fdf90fbceb54c6ed2aec0b42ed3"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "9465fef4ae351749f7068da8c78af4ca27e61928"
+SRCREV_machine:class-devupstream ?= "fa3df276cd36c5dbbd9deb64129d0d0f14c35dc8"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.153"
+LINUX_VERSION ?= "5.15.155"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


