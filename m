Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9368C5AE59
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 16:58:07 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.26210.1748537882496259644
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 09:58:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=at8EQiTw;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6faacf5d5adso12958326d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 09:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748537881; x=1749142681; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yYE4bZVTBji8d/IyfomX3Dk3s+Wtc+sQCJq+LOEI4fY=;
        b=at8EQiTwYv8r7ZhxR7rCdlp3Lp6vqSbtrbr146KanrvW/Jye02WsSJfPOjh6HV650s
         rPIH1xa/MtFspn06kebVw8b6yQxJNKpeKWKZTYujwZ9T3D0+LUicpTRmNIBV9UDOL75a
         gEp5IRmp39KNsA5qM/MRnvny9FgcV0tPqT9aumncNSrlvT1uzR+nNFt4dLrmrP3LXgwH
         KNzb68ACfkNKI0Z2y5XV0U46WB0mW+f7P+AsECVaDCxUR9T/J2m4uE+QhuPBIahePGhG
         AHZuZeqGP6GKd+O0cHylLHGutRK2zpwm99vGbN6UeMleBG+tBuSn8/FdcUb09PrWkxs2
         DeKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748537881; x=1749142681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yYE4bZVTBji8d/IyfomX3Dk3s+Wtc+sQCJq+LOEI4fY=;
        b=RnaqKl001TNrUQRLaLwJxG0QYk7QCgq8uzhY0eDAr3GTP0ghtcpym/B6NnhwpAwQxN
         eiHYZjR2czG0JxRPEH/1WVGGtyc6p8WD6JNtBnr2H7/Xd1iYdCBQqqtVZ+fdBsh6t8+f
         qAckJV9cqITMrs2FLJN8tHqgXs9/ffmQJHvHlWVLgMbwv+jpd8JY7y89N9cFQj1+LJKV
         /HGkqxjxTJo7JuYX3JoAfoKBUuDOUooL4/Zmr2Fg+rk8506j9xA4nKlbRIerAudu1Sh+
         JfjlGvvvMIjYvMkk89sm8dIud25c8HrPvuhshY2lRbYLmHos0spy3HoQotQDk+qIYGtd
         thDw==
X-Gm-Message-State: AOJu0Yx4Pl/Pts+zGuMB6AQuJob44cexQItmbv/d2wCTOvwBlFkbK2LO
	KYjeZfTUROCyWvLS4jUxmLYm+iQI9aKSztNFGW/QKoswfbcbmO7Wkj2yxt2KVc4s
X-Gm-Gg: ASbGnctBo8+rdhADjAk03ZZvx9inFkwrFEQdDvyD4/zc2DExFwmL9NHGDLpZOIG7gAv
	juRn+QLAD1clpj/HDMCZfB/MO219QJah33gUELN6fiCgDL7K671nOLGVnSKBFTZC6kYKm1QeHVe
	mERSi3VLpqU88Yp9379MvtoUaI5pODNq1/CWvm8dS49s+7g5nXAF+A77mJIwG8lR52wAUQSSEXW
	UGzqirGuC9bFj6DIgDzuE3kefY33RGKi3FWWWD9FcDL28svxuauyYzF6HS55N6b5qswkeKASy8C
	ocwwsWSgeyNHhedNhMiJ56HEBfCtknxLxM79xPBkA0CFX2hcwXhur/Ypm2yZ50J0D9czvQ0ITkr
	mfMvMp20z+Mt7nmANtaI42Q6xZieFj00MM8vKMyjLzyfeW3EL6oDo
X-Google-Smtp-Source: AGHT+IFdrBM5BGoCfvskRNKLiSg9YMz1pEMTZCjG+TW5Q5xDvCq+jseq9O5rrsADLyGZHvIJZHrORQ==
X-Received: by 2002:a05:6214:3003:b0:6e8:f4c6:681a with SMTP id 6a1803df08f44-6faceb75073mr4633136d6.12.1748537881049;
        Thu, 29 May 2025 09:58:01 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6e1c02csm11382676d6.109.2025.05.29.09.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 09:58:00 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 4/8] linux-yocto/6.6: update to v6.6.87
Date: Thu, 29 May 2025 12:57:50 -0400
Message-Id: <20250529165754.264501-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250529165754.264501-1-bruce.ashfield@gmail.com>
References: <20250529165754.264501-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 16:58:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217423

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

:ddddddddddddddddddddddddddddddddddddddddddddd
bbbbbbbbbbbb  bbbbbbbbbb
    814637ca257f Linux 6.6.87
    47ee832819f4 tracing: Do not use PERF enums when perf is not defined
    661f09d39a59 NFSD: Skip sending CB_RECALL_ANY when the backchannel isn't up
    9a81cde8c7ce nfsd: put dl_stid if fail to queue dl_recall
    15483afb930f media: streamzap: fix race between device disconnection and urb callback
    753a620a7f8e exec: fix the racy usage of fs_struct->in_exec
    72a3b5c3d16e jfs: add index corruption check to DT_GETPAGE()
    a8c31808925b jfs: fix slab-out-of-bounds read in ea_get()
    52a5509ab19a ext4: fix OOB read when checking dotdot dir
    d12a6016281a ext4: don't over-report free space or inodes in statvfs
    617a4b0084a5 arm64: Don't call NULL in do_compat_alignment_fixup()
    77029c613fac tracing/osnoise: Fix possible recursive locking for cpus_read_lock()
    fad52c9ae5bd tracing: Fix synth event printk format for str fields
    fc128e85cfc4 tracing: Ensure module defining synth event cannot be unloaded while tracing
    099ef3385800 tracing: Fix use-after-free in print_graph_function_flags during tracer switching
    0e36a3e080d6 ksmbd: validate zero num_subauth before sub_auth is accessed
    3980770cb147 ksmbd: fix session use-after-free in multichannel connection
    a8a8ae303a83 ksmbd: fix use-after-free in ksmbd_sessions_deregister()
    60b7207893a8 ksmbd: add bounds check for create lease context
    8d4848c45943 ksmbd: add bounds check for durable handle context
    68d64f7329a5 mmc: sdhci-omap: Disable MMC_CAP_AGGRESSIVE_PM for eMMC/SD
    d8d7b50586ec mmc: sdhci-pxav3: set NEED_RSP_BUSY capability
    261f51775ef5 mmc: omap: Fix memory leak in mmc_omap_new_slot
    90bcdefe220a ACPI: resource: Skip IRQ override on ASUS Vivobook 14 X1404VAP
    c90402d2a226 acpi: nfit: fix narrowing conversion in acpi_nfit_ctl
    7085895c59e4 x86/mm: Fix flush_tlb_range() when used for zapping normal PMDs
    e329d137b076 x86/tsc: Always save/restore TSC sched_clock() on suspend/resume
    67e4ca7ddc67 btrfs: handle errors from btrfs_dec_ref() properly
    99ddb9c58511 kunit/overflow: Fix UB in overflow_allocation_test
    e7f6922c8a5b perf/x86/intel: Avoid disable PMU if !cpuc->enabled in sample read
    79159fbd13f6 perf/x86/intel: Apply static call for drain_pebs
    2e6df032a0b6 ntb_perf: Delete duplicate dmaengine_unmap_put() call in perf_copy_chunk()
    3820d20d51fd platform/x86: ISST: Correct command storage data length
    b1a673850c58 ACPI: x86: Extend Lenovo Yoga Tab 3 quirk with skip GPIO event-handlers
    763f4d638f71 x86/microcode/AMD: Fix __apply_microcode_amd()'s return value
    10edc4cecad4 x86/hyperv: Fix check of return value from snp_set_vmsa()
    7cf8fe2b2bcc LoongArch: BPF: Use move_addr() for BPF_PSEUDO_FUNC
    7df2696256a0 LoongArch: BPF: Don't override subprog's return value
    b3ffad2f02db LoongArch: BPF: Fix off-by-one error in build_prologue()
    279ec25c2df4 LoongArch: Increase ARCH_DMA_MINALIGN up to 16
    acacd48a37b5 usbnet:fix NPE during rx_complete
    032c5407a608 drm/amd/display: Check link_index before accessing dc->links[]
    41a2c7abc339 tracing: Correct the refcount if the hist/hist_debug file fails to open
    d24e5e631849 tracing/hist: Support POLLPRI event for poll on histogram
    13edaf997904 tracing/hist: Add poll(POLLIN) support on hist file
    77b7dbd3420e tracing: Switch trace_events_hist.c code over to use guard()
    f568fbe8c603 tracing: Allow creating instances with specified system events
    1913adb58b84 perf/core: Fix child_total_time_enabled accounting bug at task exit
    40316f29b043 drm/amdgpu/gfx11: fix num_mec
    1e458c292f4c net: ibmveth: make veth_pool_store stop hanging
    ececf8eff6c2 arcnet: Add NULL check in com20020pci_probe()
    fa2f9fc35f56 ipv6: Do not consider link down nexthops in path selection
    21f678f672dc ipv6: Start path selection from the first nexthop
    5a2976cc4d9c net: fix geneve_opt length integer overflow
    0ae509b075b2 net: dsa: mv88e6xxx: propperly shutdown PPU re-enable timer on destroy
    fbab7bbf7204 ipv6: fix omitted netlink attributes when using RTEXT_FILTER_SKIP_STATS
    28d88ee1e1cc netfilter: nft_tunnel: fix geneve_opt type confusion addition
    ccc331fd5bca net: decrease cached dst counters in dst_release
    858695324644 tunnels: Accept PACKET_HOST in skb_tunnel_check_pmtu().
    b0a1055e0a9e vsock: avoid timeout during connect() if the socket is closing
    aeef6456692c udp: Fix memory accounting leak.
    5b0ae1723a7d net: mvpp2: Prevent parser TCAM memory corruption
    864ca690ff13 net_sched: skbprio: Remove overly strict queue assertions
    1927d0bcd5b8 netlabel: Fix NULL pointer exception caused by CALIPSO on IPv4 sockets
    6134d1ea1e14 netfilter: nf_tables: don't unregister hook when table is dormant
    073b04796c07 netfilter: nft_set_hash: GC reaps elements with conncount for dynamic sets only
    aff1860507ea e1000e: change k1 configuration on MTP and later platforms
    e283a5bf4337 ASoC: imx-card: Add NULL check in imx_card_probe()
    8db65e4432b2 riscv: Fix hugetlb retrieval of number of ptes in case of !present pte
    992678427eff ASoC: codecs: rt5665: Fix some error handling paths in rt5665_probe()
    a59594c370cd x86/uaccess: Improve performance by aligning writes to 8 bytes in copy_user_generic(), on non-FSRM/ERMS CPUs
    f7a53d32cc60 RISC-V: errata: Use medany for relocatable builds
    b52e13bfd69c ALSA: hda/realtek: Fix built-in mic breakage on ASUS VivoBook X515JA
    c37616f1521d firmware: cs_dsp: Ensure cs_dsp_load[_coeff]() returns 0 on success
    830169a5ceeb ntb: intel: Fix using link status DB's
    c61a3f2df162 ntb_hw_switchtec: Fix shift-out-of-bounds in switchtec_ntb_mw_set_trans
    2174fa133dcc riscv: ftrace: Add parentheses in macro definitions of make_call_t0 and make_call_ra
    239ea3c34673 spufs: fix a leak in spufs_create_context()
    324f280806aa spufs: fix gang directory lifetimes
    90d1b276d1b1 spufs: fix a leak on spufs_new_file() failure
    6e75137ac8de hwmon: (nct6775-core) Fix out of bounds access for NCT679{8,9}
    aaf534ad0720 memory: omap-gpmc: drop no compatible check
    68adc6f17a36 can: statistics: use atomic access in hot path
    2a435a8cb891 ALSA: hda/realtek: Add mute LED quirk for HP Pavilion x360 14-dy1xxx
    05413508bc35 drm/amd: Keep display off while going into S4
    5272e986ea96 nvme-pci: fix stuck reset on concurrent DPC and HP
    d276f4050067 x86/sgx: Warn explicitly if X86_FEATURE_SGX_LC is not enabled
    83fa62a06e40 x86/hyperv: Fix output argument to hypercall that changes page visibility
    e7d8c5703238 locking/semaphore: Use wake_q to wake up processes outside lock critical section
    e87b8f209cb2 wifi: mac80211: flush the station before moving it to UN-AUTHORIZED state
    c0863207c012 x86/hyperv/vtl: Stop kernel from probing VTL0 low memory
    0ada80483275 sched/deadline: Use online cpus for validating runtime
    264f9a797c18 ALSA: hda/realtek: Add support for ASUS Zenbook UM3406KA Laptops using CS35L41 HDA
    b9fa3901b612 ALSA: hda/realtek: Add support for ASUS ROG Strix G614 Laptops using CS35L41 HDA
    4c8865331899 HID: i2c-hid: improve i2c_hid_get_report error message
    64f974466183 platform/x86/intel/vsec: Add Diamond Rapids support
    84d6da6738ba platform/x86: intel-hid: fix volume buttons on Microsoft Surface Go 4 tablet
    fa19b53716f9 cifs: fix incorrect validation for num_aces field of smb_acl
    68ee6f71a2a9 perf/core: Fix perf_pmu_register() vs. perf_init_event()
    11e2ae4fe025 ALSA: hda: Fix speakers on ASUS EXPERTBOOK P5405CSA 1.0
    fc424138592a ALSA: hda/realtek: Fix Asus Z13 2025 audio
    54fd5a5b7583 affs: don't write overlarge OFS data block size fields
    9fcab9c72142 affs: generate OFS sequence numbers starting at 1
    ec7315e68d88 wifi: brcmfmac: keep power during suspend if board requires it
    d9189555fbe5 nvme-pci: skip CMB blocks incompatible with PCI P2P DMA
    a74dad107e52 nvme-pci: clean up CMBMSC when registering CMB fails
    9ca8c6f6a227 nvme-tcp: fix possible UAF in nvme_tcp_poll
    60856e6cdb3e wifi: iwlwifi: mvm: use the right version of the rate API
    aadb8a9a90c0 wifi: iwlwifi: fw: allocate chained SG tables for dump
    a3160e7f6d90 rcu-tasks: Always inline rcu_irq_work_resched()
    0a0813d1277e context_tracking: Always inline ct_{nmi,irq}_{enter,exit}()
    698243234d63 sched/smt: Always inline sched_smt_active()
    7ae00d2903ee objtool: Fix verbose disassembly if CROSS_COMPILE isn't set
    08796bd2389a octeontx2-af: Free NIX_AF_INT_VEC_GEN irq
    aa042c453227 octeontx2-af: Fix mbox INTR handler when num VFs > 64
    f9b61f837eb7 ACPI: processor: idle: Return an error if both P_LVL{2,3} idle states are invalid
    d32f20470c9e LoongArch: Rework the arch_kgdb_breakpoint() implementation
    37319d6d8540 LoongArch: Fix help text of CMDLINE_EXTEND in Kconfig
    8f77c286d5e0 objtool: Fix segfault in ignore_unreachable_insn()
    de37b82be68d ring-buffer: Fix bytes_dropped calculation issue
    17e3c520aeef net/mlx5e: SHAMPO, Make reserved size independent of page size
    4790bcb269e5 ksmbd: fix r_count dec/increment mismatch
    a32086cc6444 ksmbd: fix multichannel connection failure
    1de7fec4d301 ksmbd: use aead_request_free to match aead_request_alloc
    8857aadaecef rndis_host: Flag RNDIS modems as WWAN devices
    15f150771e0e rtnetlink: Allocate vfinfo size for VF GUIDs when supported
    af089264d108 exfat: fix the infinite loop in exfat_find_last_cluster()
    c6b6b8dcef4a smb: client: Fix netns refcount imbalance causing leaks and use-after-free
    d7ca0969bf87 NFS: Shut down the nfs_client only after all the superblocks
    75b42dfe8765 objtool, media: dib8000: Prevent divide-by-zero in dib8000_set_dds()
    f2dc3c3b1b85 perf tools: annotate asm_pure_loop.S
    e6fe7f82f3b9 fs/procfs: fix the comment above proc_pid_wchan()
    0a3bf3bc3444 tty: n_tty: use uint for space returned by tty_write_room()
    357c1a3deb1f staging: rtl8723bs: select CONFIG_CRYPTO_LIB_AES
    769a0f187ba2 perf python: Check if there is space to copy all the event
    88f5dd0002f4 perf python: Don't keep a raw_data pointer to consumed ring buffer space
    6bc0c3e7582c perf python: Decrement the refcount of just created event on failure
    b8e2e2cfa319 perf python: Fixup description of sample.id event member
    9c764db1794e i3c: master: svc: Fix missing the IBI rules
    4ee8160c47e0 um: hostfs: avoid issues on inode number reuse by host
    c9a6cf3fe680 um: remove copy_from_kernel_nofault_allowed
    5e06e6412a73 selftests/mm/cow: fix the incorrect error handling
    db75d49a4107 fuse: fix dax truncate/punch_hole fault path
    4e2a03d766f1 NFSv4: Don't trigger uneccessary scans for return-on-close delegations
    d03ce46090f6 arch/powerpc: drop GENERIC_PTDUMP from mpc885_ads_defconfig
    3d012ba4404a ocfs2: validate l_tree_depth to avoid out-of-bounds access
    8c69e83028bf kexec: initialize ELF lowest address to ULONG_MAX
    4159cb408f8c kernel/events/uprobes: handle device-exclusive entries correctly in __replace_page()
    fa55abb99de9 perf units: Fix insufficient array space
    8a832ed0f6d6 perf evlist: Add success path to evlist__create_syswide_maps
    1f562f8efa72 iio: adc: ad7124: Fix comparison of channel configs
    a2ae5afa0837 iio: adc: ad4130: Fix comparison of channel setups
    cb7687e37735 dmaengine: fsl-edma: cleanup chan after dma_async_device_unregister
    f6d44b1aa46d fs/ntfs3: Prevent integer overflow in hdr_first_de()
    0dfe700fbd35 fs/ntfs3: Fix a couple integer overflows on 32bit systems
    0566a11d5e65 usb: xhci: correct debug message page size calculation
    fe2ada4ed436 perf bench: Fix perf bench syscall loop count
    31ebc5701a82 perf arm-spe: Fix load-store operation checking
    d3f0bad2c43e iio: accel: msa311: Fix failure to release runtime pm if direct mode claim fails.
    2d8c171e6212 iio: accel: mma8452: Ensure error return on failure to matching oversampling ratio
    1287c788f33b ucsi_ccg: Don't show failed to get FW build information error
    d2b1ee18c1d3 perf pmu: Don't double count common sysfs and json events
    a8b3879b2e3b coresight-etm4x: add isb() before reading the TRCSTATR
    2b34bdc42df0 vhost-scsi: Fix handling of multiple calls to vhost_scsi_set_endpoint
    01592ce19138 coresight: catu: Fix number of pages while using 64k pages
    b302c4d3f42a soundwire: slave: fix an OF node reference leak in soundwire slave device
    98fa452d0cf2 isofs: fix KMSAN uninit-value bug in do_isofs_readdir()
    6258b8ac583b perf stat: Fix find_stat for mixed legacy/non-legacy events
    a7bae9f76636 clk: qcom: mmcc-sdm660: fix stuck video_subcore0 clock
    f2176ab4b30f pinctrl: intel: Fix wrong bypass assignment in intel_pinctrl_probe_pwm()
    75f095daf623 crypto: hisilicon/sec2 - fix for aead auth key length
    b6fc1fdd3e71 x86/dumpstack: Fix inaccurate unwinding from exception stacks due to misplaced assignment
    966fdfc45373 leds: Fix LED_OFF brightness race
    d6f517e8d866 mfd: sm501: Switch to BIT() to mitigate integer overflows
    7d8e0ac233d7 pinctrl: renesas: rzv2m: Fix missing of_node_put() call
    7c51a6964b45 RDMA/mlx5: Fix mlx5_poll_one() cur_qp update flow
    c4db297e8896 crypto: nx - Fix uninitialised hv_nxc on error
    a278a4164bde power: supply: max77693: Fix wrong conversion of charge input threshold value
    02586692acdb x86/entry: Fix ORC unwinder for PUSH_REGS with save_ret=1
    3d39022704e0 clk: amlogic: g12a: fix mmc A peripheral clock
    c6f63ae9b51b clk: clk-imx8mp-audiomix: fix dsp/ocram_a clock parents
    48e5f4fdadd7 selftests/bpf: Select NUMA_NO_NODE to create map
    7061afacc89d clk: amlogic: gxbb: drop non existing 32k clock parent
    b36254e8f865 clk: amlogic: g12b: fix cluster A parent data
    4dc225623804 pinctrl: tegra: Set SFIO mode to Mux Register
    5fa3bfd3d025 IB/mad: Check available slots before posting receive WRs
    1b2641d16167 remoteproc: qcom_q6v5_mss: Handle platforms with one power domain
    667a628ab67d RDMA/erdma: Prevent use-after-free in erdma_accept_newconn()
    68438629de34 RDMA/mlx5: Fix calculation of total invalidated pages
    0cf80f924aec RDMA/core: Don't expose hw_counters outside of init net namespace
    02527e62d7ee clk: rockchip: rk3328: fix wrong clk_ref_usb3otg parent
    622d52c99a91 pinctrl: renesas: rzg2l: Fix missing of_node_put() call
    182ae87e1435 pinctrl: renesas: rza2: Fix missing of_node_put() call
    77461377d3be lib: 842: Improve error handling in sw842_compress()
    43681d603ff0 bpf: Use preempt_count() directly in bpf_send_signal_common()
    8e3e21129cfe remoteproc: qcom_q6v5_pas: Use resource with CX PD for MSM8226
    b32da6cf9d4e RDMA/mana_ib: Ensure variable err is initialized
    db6f0b88d772 clk: qcom: gcc-msm8953: fix stuck venus0_core0 clock
    4d29a6dcb51e clk: samsung: Fix UBSAN panic in samsung_clk_init()
    b07398e8a5da x86/mm/pat: Fix VM_PAT handling when fork() fails in copy_page_range()
    22280deb312f selftests/bpf: Fix string read in strncmp benchmark
    b55c47027511 libbpf: Fix hypothetical STT_SECTION extern NULL deref case
    5db897802c39 remoteproc: qcom_q6v5_pas: Make single-PD handling more robust
    ba1a885c9012 of: property: Increase NR_FWNODE_REFERENCE_ARGS
    7c6bb82a6f3d remoteproc: core: Clear table_sz when rproc_shutdown
    8594bbffc266 crypto: hisilicon/sec2 - fix for sec spec check
    0aafd0ec5101 crypto: hisilicon/sec2 - fix for aead authsize alignment
    2ff09de2c8ff clk: amlogic: gxbb: drop incorrect flag on 32k clock
    ce88afbc0934 fbdev: sm501fb: Add some geometry checks.
    6ed70f3dc68f mdacon: rework dependency list
    88ebc63d6a67 fbdev: au1100fb: Move a variable assignment behind a null pointer check
    f6c1a08e9163 PCI: pciehp: Don't enable HPIE when resuming in poll mode
    cbcb02cc0e2f PCI: histb: Fix an error handling path in histb_pcie_probe()
    b3a93a2407ad drm/amd/display: avoid NPD when ASIC does not support DMUB
    390304035b32 drm/mediatek: dsi: fix error codes in mtk_dsi_host_transfer()
    13ec849fd2ea drm/mediatek: dp: drm_err => dev_err in HPD path to avoid NULL ptr
    48b5e31bc354 PCI: xilinx-cpm: Fix IRQ domain leak in error path of probe
    745783303c41 PCI: Remove stray put_device() in pci_register_host_bridge()
    d5563f120575 drm/amd/display: fix type mismatch in CalculateDynamicMetadataParameters()
    431f51068a0c PCI: Avoid reset when disabled via sysfs
    0aad0d291690 PCI/portdrv: Only disable pciehp interrupts early when needed
    eeeac24b42e6 PCI: brcmstb: Fix potential premature regulator disabling
    eedd05483493 PCI: brcmstb: Fix error path after a call to regulator_bulk_get()
    8b2853fd6ef8 PCI: brcmstb: Use internal register to change link capability
    17a37367d032 PCI: cadence-ep: Fix the driver to send MSG TLP for INTx without data payload
    0f88894aa628 drm/amdkfd: Fix Circular Locking Dependency in 'svm_range_cpu_invalidate_pagetables'
    a984e6108c9c drm/msm/dsi: Set PHY usescase (and mode) before registering DSI host
    7570e5693092 drm/msm/dsi: Use existing per-interface slice count in DSC timing
    45e03341d2b1 drm/msm/dpu: don't use active in atomic_check()
    8b930ddc2044 PCI/ASPM: Fix link state exit during switch upstream function removal
    9c44e29cfd76 drm/mediatek: mtk_hdmi: Fix typo for aud_sampe_size member
    34c1720a3830 drm/mediatek: mtk_hdmi: Unregister audio platform device on failure
    347641b02fbe PCI: Use downstream bridges for distributing resources
    561fc0c5cf41 drm/vkms: Fix use after free and double free on init error
    e2b310717382 drm: xlnx: zynqmp: Fix max dma segment size
    d360c02cdedb drm/bridge: it6505: fix HDCP V match check is not performed correctly
    c3b8e7c6809a drm/dp_mst: Fix drm RAD print
    8830a2a324c4 drm/bridge: ti-sn65dsi86: Fix multiple instances
    1b5f3dc474cb ASoC: ti: j721e-evm: Fix clock configuration for ti,j7200-cpb-audio compatible
    a589f15d4014 ALSA: hda/realtek: Always honor no_shutup_pins
    f8e2e91bae08 dt-bindings: vendor-prefixes: add GOcontroll
    ba65e56f717a HID: remove superfluous (and wrong) Makefile entry for CONFIG_INTEL_ISH_FIRMWARE_DOWNLOADER
    20bbf66ab4e2 ASoC: cs35l41: check the return value from spi_setup()
    756945c13fbb platform/x86: dell-ddv: Fix temperature calculation
    693b38ee7c2f media: platform: allgro-dvt: unregister v4l2_device on the error path
    57e257d9744c media: verisilicon: HEVC: Initialize start_bit field
    63a0b0d052b3 x86/fpu/xstate: Fix inconsistencies in guest FPU xfeatures
    4c94efdc5140 x86/traps: Make exc_double_fault() consistently noreturn
    36aee8100e8b perf/ring_buffer: Allow the EPOLLRDNORM flag for poll
    477b6882f18b lockdep: Don't disable interrupts on RT in disable_irq_nosync_lockdep.*()
    01c5ab292477 PM: sleep: Fix handling devices with direct_complete set on errors
    ac2eb7378319 thermal: int340x: Add NULL check for adev
    12c5e76acf55 EDAC/ie31200: Fix the error path order of ie31200_init()
    9ca0c34ac1f5 EDAC/ie31200: Fix the DIMM size mask for several SoCs
    a26d5a100ae0 EDAC/ie31200: Fix the size of EDAC_MC_LAYER_CHIP_SELECT layer
    06ca76e7e353 selinux: Chain up tool resolving errors in install_policy.sh
    b9ad6385ca4d RISC-V: KVM: Disable the kernel perf counter during configure
    3c64a5bacb6b PM: sleep: Adjust check before setting power.must_resume
    913b739cd2bf lockdep/mm: Fix might_fault() lockdep check of current->mm->mmap_lock
    71fc439af51a x86/sev: Add missing RIP_REL_REF() invocations during sme_enable()
    7c376f91f2e1 x86/platform: Only allow CONFIG_EISA for 32-bit
    2541b0d1ced5 x86/fpu: Avoid copying dynamic FP state from init_task in arch_dup_task_struct()
    b58c6545db04 x86/fpu: Fix guest FPU state buffer allocation size
    f2d51d45a507 EDAC/{skx_common,i10nm}: Fix some missing error reports on Emerald Rapids
    62173b2fc2ed cpufreq: governor: Fix negative 'idle_time' handling in dbs_update()
    f7a1e1c2d6de smack: dont compile ipv6 code unless ipv6 is configured
    e4b3585ad908 cpufreq: scpi: compare kHz instead of Hz
    b8db5776f042 x86/mm/pat: cpa-test: fix length for CPA_ARRAY test
    6dafa2776418 watch_queue: fix pipe accounting mismatch
    6a5b2ed82152 ARM: dts: am335x-bone-common: Increase MDIO reset deassert time
    ceb5fadbf450 Revert "v6.6 -stable -rt merge fixup"
    1c2962a164ff v6.6 -stable -rt merge fixup
    18abb2787b53 x86/syscall: Mark exit[_group] syscall handlers __noreturn
    2879d995e569 pnmtologo: sync with 6.6
    43ea1c5e6eb3 lib/build_OID_registry: take -stable reproducibility changes
    35046aea43c8 bpftool: Fix undefined bpf macro for unix socket
    9a558d4b8621 tools/resolve_btfids: Fix comparison of distinct pointer types warning in resolve_btfids
    42b2eec2e503 bpftool: Query only cgroup-related attach types
    f71bb11887ba cpu/amd: inhibit SMP check for qemux86
    c31365597a17 powerpc/uaccess: Fix build errors seen with GCC 13/14
    64ebf485c56b usb: dwc3: core: remove lock of otg mode during gadget suspend/resume to avoid deadlock
    7c76aad68f6d kselftest: Add a ksft_perror() helper
    06644f0d7193 drm/tilcdc: Set preferred depth
    ff7ae7b32324 crypto: jitter - add RCT/APT support for different OSRs
    50cd24ddb6f0 arm64: defconfig: remove CONFIG_IPQ_APSS_5018
    58e5c91d6701 x86/alternatives: Disable interrupts and sync when optimizing NOPs in place
    c878fd2d4c79 x86/alternatives: Sync core before enabling interrupts
    c2d64b9f52b6 qemux86: add configuration symbol to select values
    630c33229e6d sched/isolation: really align nohz_full with rcu_nocbs
    0e5e0f68e2e6 clear_warn_once: add a clear_warn_once= boot parameter
    46934791b902 clear_warn_once: bind a timer to written reset value
    cdee9e38ff32 clear_warn_once: expand debugfs to include read support
    82b562b81841 tools: Remove some options from CLANG_CROSS_FLAGS
    36dc380b776b libbpf: Fix build warning on ref_ctr_off
    9e3e1fe20982 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    e497a4a5da65 perf: x86-32: explicitly include <errno.h>
    7b57ddd89565 perf: mips64: Convert __u64 to unsigned long long
    1cfc19423dc7 perf: fix bench numa compilation
    98bc2815fade perf: add SLANG_INC for slang.h
    17209a70b9b3 perf: add sgidefs.h to for mips builds
    9cd4258d910a perf: change --root to --prefix for python install
    8110a4f26628 perf: add 'libperl not found' warning
    bc89d5e08f77 perf: force include of <stdbool.h>
    4f6c760cc876 fat: Replace prandom_u32() with get_random_u32()
    bc53117b12b2 fat: don't use obsolete random32 call in namei_vfat
    30b2236ab378 FAT: Added FAT_NO_83NAME
    cef98d22b4ed FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    0bbd7daba9e1 FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    5883fc340084 aufs6: adapt to v6.6 i_op->ctime changes
    c4342d979bf2 aufs6: fix magic.mk include path
    35266bc2dc81 aufs6: adapt to v6.6
    8edede4e98be aufs6: core
    712248233ebe aufs6: standalone
    3b71a8a848d8 aufs6: mmap
    3e2924871f37 aufs6: base
    7f4907a93101 aufs6: kbuild
    d2f7b03e4aa7 yaffs2: update VFS ctime operations to 6.6+
    bcd6cfcd1aa0 yaffs2: v6.5 fixups
    cc615704b5f5 yaffs2: Fix miscalculation of devname buffer length
    8ef2e22dcf91 yaffs2: convert user_namespace to mnt_idmap
    c9c749f9f7d3 yaffs2: replace bdevname call with sprintf
    395b01cdc39d yaffs2: convert read_page -> readfolio
    d98b07e43ba6 yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    613c6d50fdbe yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    622c4648936f yaffs2: v5.12+ build fixups (not runtime tested)
    7562133d4090 yaffs: include blkdev.h
    dbd44252cd59 yaffs: fix misplaced variable declaration
    c223a10b1ac0 yaffs2: v5.6 build fixups
    90f6007cfbf4 yaffs2: fix memory leak when /proc/yaffs is read
    37ee169c5ea1 yaffs: add strict check when call yaffs_internal_read_super
    b6e007b8abb6 yaffs: repair yaffs_get_mtd_device
    fb98f65a466a yaffs: Fix build failure by handling inode i_version with proper atomic API
    51e0aac75ea2 yaffs2: fix memory leak in mount/umount
    2b74a0cae7b0 yaffs: Avoid setting any ACL releated xattr
    ff4130a9c376 Yaffs:check oob size before auto selecting Yaffs1
    ba95b409c67c fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    8fa35eba9056 yaffs2: adjust to proper location of MS_RDONLY
    1eb5deaad8c4 yaffs2: import git revision b4ce1bb (jan, 2020)
    4dce67c1e8c8 initramfs: allow an optional wrapper script around initramfs generation
    2f603d83fcc4 pnmtologo: use relocatable file name
    664a6a0a484b tools: use basename to identify file in gen-mach-types
    9de64bc0c185 lib/build_OID_registry: fix reproducibility issues
    ae9b80797295 vt/conmakehash: improve reproducibility
    a972323151bd iwlwifi: select MAC80211_LEDS conditionally
    15d2adcc0198 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    5556a6c04b19 arm64/perf: Fix wrong cast that may cause wrong truncation
    5552dc768ffc defconfigs: drop obselete options
    00fe4152df31 arm64/perf: fix backtrace for AAPCS with FP enabled
    3888d0652edf linux-yocto: Handle /bin/awk issues
    3d55d299f23a uvesafb: provide option to specify timeout for task completion
    23c068c080be uvesafb: print error message when task timeout occurs
    edbfc939266e compiler.h: Undef before redefining __attribute_const__
    c99ae7e2a19a vmware: include jiffies.h
    572d84d928c8 Resolve jiffies wrapping about arp
    fdcd47cac843 nfs: Allow default io size to be configured.
    927d48801098 check console device file on fs when booting
    57cc27f821dd mount_root: clarify error messages for when no rootfs found
    1b53d82a8152 mconf: fix output of cflags and libraries
    1811da09f42c menuconfig,mconf-cfg: Allow specification of ncurses location
    83c2e0c6eb1f modpost: mask trivial warnings
    6de673039484 kbuild: exclude meta directory from distclean processing
    6decd32815f5 powerpc: serialize image targets
    f6b683b38318 arm: serialize build targets
    e798b09ebf57 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    dc8a1e5a88f8 x86_64_defconfig: Fix warnings
    68491e5f72b6 powerpc/ptrace: Disable array-bounds warning with gcc8
    d71ebfce3004 powerpc: Disable attribute-alias warnings from gcc8
    62f50884b8b1 powerpc: kexec fix for powerpc64
    da6871c62c37 powerpc: Add unwind information for SPE registers of E500 core
    f161c880c11d mips: make current_cpu_data preempt safe
    5e94a8247ce7 mips: vdso: fix 'jalr $t9' crash in vdso code
    19e36714b1c7 mips: Kconfig: add QEMUMIPS64 option
    e2e537db3cbd 4kc cache tlb hazard: tlbp cache coherency
    aee9870611e5 malta uhci quirks: make allowance for slow 4k(e)c
    881948cd1517 drm/fb-helper: move zeroing code to drm_fb_helper_fill_var
    98ec1963fcb7 arm64: defconfig: cleanup config options
    f1727c537ba8 vexpress: Pass LOADADDR to Makefile
    4474c32dc24a arm: ARM EABI socketcall
    75e31a2b70fd ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 83ab521399..b98a092ba8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "baede5a5c17bce04338fe12d6d0f8277edd43dd4"
-SRCREV_meta ?= "a56c84ea9e406a96490a0d70668e31b10675f1bd"
+SRCREV_machine ?= "4e24c0078d347a06de2d385594f2f0973f022d7a"
+SRCREV_meta ?= "79c4bead901471e10fd490024be437feeb562d20"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.86"
+LINUX_VERSION ?= "6.6.87"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 49a2bb9aa4..93ca6ef039 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.86"
+LINUX_VERSION ?= "6.6.87"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "754b91c970cb5001c4f1b205be0b29b0efbbe82d"
-SRCREV_meta ?= "a56c84ea9e406a96490a0d70668e31b10675f1bd"
+SRCREV_machine ?= "27de730c610542bb1cf01401f477bc79ec524e90"
+SRCREV_meta ?= "79c4bead901471e10fd490024be437feeb562d20"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index abbfdbbd43..239469e0d1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "d5fad62ae36747211fcfda82fc984c7085c7d343"
-SRCREV_machine:qemuarm64 ?= "4469abd262a2de4c66cd5d37f9dfbfb2060d4e67"
-SRCREV_machine:qemuloongarch64 ?= "257833f963feceebad0ef58d5e5426f910349a85"
-SRCREV_machine:qemumips ?= "8dabd4628c1c131637bda6915bea0b21493b9338"
-SRCREV_machine:qemuppc ?= "1862875baa7888ec55244d0ccfe30c94f94be1a7"
-SRCREV_machine:qemuriscv64 ?= "257833f963feceebad0ef58d5e5426f910349a85"
-SRCREV_machine:qemuriscv32 ?= "257833f963feceebad0ef58d5e5426f910349a85"
-SRCREV_machine:qemux86 ?= "257833f963feceebad0ef58d5e5426f910349a85"
-SRCREV_machine:qemux86-64 ?= "257833f963feceebad0ef58d5e5426f910349a85"
-SRCREV_machine:qemumips64 ?= "1d698ed1a159dde9479181de457e51343c01cd70"
-SRCREV_machine ?= "257833f963feceebad0ef58d5e5426f910349a85"
-SRCREV_meta ?= "a56c84ea9e406a96490a0d70668e31b10675f1bd"
+SRCREV_machine:qemuarm ?= "05feaab2ce4c325c87564949d4bca59b38c31641"
+SRCREV_machine:qemuarm64 ?= "63fc4f3e7d43d60d768645a8b7c39e8791fbedd8"
+SRCREV_machine:qemuloongarch64 ?= "c2cf29e216cebdcdb6352ce8e8d23550bdc9ba2f"
+SRCREV_machine:qemumips ?= "f41ac798fa73c10c1a06f9fe7be4a7f30e7b02c6"
+SRCREV_machine:qemuppc ?= "0a1c77f1b1051f4653530a27d12753af2060963f"
+SRCREV_machine:qemuriscv64 ?= "c2cf29e216cebdcdb6352ce8e8d23550bdc9ba2f"
+SRCREV_machine:qemuriscv32 ?= "c2cf29e216cebdcdb6352ce8e8d23550bdc9ba2f"
+SRCREV_machine:qemux86 ?= "c2cf29e216cebdcdb6352ce8e8d23550bdc9ba2f"
+SRCREV_machine:qemux86-64 ?= "c2cf29e216cebdcdb6352ce8e8d23550bdc9ba2f"
+SRCREV_machine:qemumips64 ?= "e527daa55776fb53eceeedbc59f9a4c97f7eadaf"
+SRCREV_machine ?= "c2cf29e216cebdcdb6352ce8e8d23550bdc9ba2f"
+SRCREV_meta ?= "79c4bead901471e10fd490024be437feeb562d20"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "3fa1ea3ede181bf11c329df056840b04ec2e3dca"
+SRCREV_machine:class-devupstream ?= "814637ca257f4faf57a73fd4e38888cce88b5911"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.86"
+LINUX_VERSION ?= "6.6.87"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


