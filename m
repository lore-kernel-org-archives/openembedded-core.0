Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D865C369C9
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 19:54:53 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.4178.1745006091670795921
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Apr 2025 12:54:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JRcy2usQ;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4768f90bf36so20231361cf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 12:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745006091; x=1745610891; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kh4OLOy/tlruYN4FHDpCCctPWRTplLVSKEPXxBXbDUs=;
        b=JRcy2usQP+q8A6yxn9pIVebyeSaClrNwWrUH5X/kdpHd3jJbGJzVfvvPc89PbQvf8X
         FzLMLmLHdDFb/ohHIo55U+aI+61iAdHnqlAMRt0y49Eki7UqoHvfLUlzRMTTj0A/8LZm
         HrnpGRKB2GPJOmXdxnXPRSOGekdd6wwtlL0+JS+2fYWEz7ugqrRyRslBr/gO3VS1a7WO
         F5V6I/jscpin4ry0JPVWhGfkUQmcSABuQ0dVnBAebY0wu+H5f2TwMFG5A2oId/2ofy2j
         mTWrATa9h8wkjGKOYixagQjk7g6CXA/SFLbjlDINcS/Eqzci9ehAQ4CYUmljdXduUB0e
         4/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745006091; x=1745610891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kh4OLOy/tlruYN4FHDpCCctPWRTplLVSKEPXxBXbDUs=;
        b=XIwKv1y7l7C2jC5kP8uuz7Kz9lGdHToXNPbA3JSqfge7KZvhhSzoh9W37OmHUYyIrt
         i/uNqNQlv/fdipIKJvTZroUedCga65+AoDmnHoZT4D0Vonyo+ji60E0BhkDgDRzQL56V
         +R1qXF+j9RAYhXUQ9ePjF1PfffF5TAe2iy6leS+TwlqS54FZNApQPmcq/kjTkhiY4DD7
         DRf0Lem9a6r7K3G4fZz+vgpE3Q1QGSDCGZiX2ZWgYnhxy5D7HOXVLHEB101DflL2J4nX
         SCMEBoAuIbCsIKTWoBOZr5iGED14r+HnDjakcEejDCPY6wMzN5sJ41Sw6WYUUVx1ARnV
         2bUw==
X-Gm-Message-State: AOJu0Yzu2uintcBbx/7FvAbB797DLWaSXXPaU9PRvH3h7XH+4voHz6/Z
	z3Wgu7XUtGzewkE6liUp2NrTNEIDvGAmUtGJR01C80HA3lIi6dg2rptRPIWK
X-Gm-Gg: ASbGncup4XwhUkK9OD0CEdg9DuQDeUyiLYgdyJn+FwbEiMWo2/WlcLIIkQeD2J7vcmA
	ah/w1hWCvNQmG+X3ZJwf7JYeXGnC3pxCRiJo6NeFRd2/YKwt7pI34WjUBADTrge1Lt/8dmrvZRJ
	hhhSmEU/wJ2aftT9OO/+95SLXLVY8SzMklOoim3rtMKZCsS9riHeWEkSAIrl7yHYmz7eGmuv1/7
	PgNFL+0lkVqxIQONzZU7mkzPMGo5tL/OB/b3SmbV0A/Fr9/JQ6+NObSo8l1S9NyNFixGuL4E5x3
	GybyXXlDoV5rQKZKTGD2Lk0y89jZdlvYkewbpgwq9pBQi6jQDOORKckwDGRietrrWNWoIAoFVyK
	XTanfM/SQmF96F2jvCAcW+DGl1EMbuiz0e860RJlnVQ==
X-Google-Smtp-Source: AGHT+IE/C1bQUxF6W17QLh95l8Rm1916UwMHJtMaHyhpN7iM4Ti9vtUo0n8BA27hGSmgH9rRe+8b3A==
X-Received: by 2002:a05:622a:2d2:b0:477:6e6b:aeb3 with SMTP id d75a77b69052e-47aec23b431mr65862371cf.0.1745006090317;
        Fri, 18 Apr 2025 12:54:50 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9ce085asm13774061cf.51.2025.04.18.12.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 12:54:49 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core] 1/2] linux-yocto/6.12: update to v6.12.23
Date: Fri, 18 Apr 2025 15:54:45 -0400
Message-Id: <20250418195446.1914594-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250418195446.1914594-1-bruce.ashfield@gmail.com>
References: <20250418195446.1914594-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 19:54:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215142

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    83b4161a63b8 Linux 6.12.23
    e70b4b8f93d7 platform/x86/amd/pmf: fix cleanup in amd_pmf_init_smart_pc()
    625e9b91eb13 tracing: Do not use PERF enums when perf is not defined
    59fc42318305 ARM: 9443/1: Require linker to support KEEP within OVERLAY for DCE
    c6f2a8146da1 NFSD: Skip sending CB_RECALL_ANY when the backchannel isn't up
    afec5b5010de NFSD: Never return NFS4ERR_FILE_OPEN when removing a directory
    101fd0aa0d7d NFSD: nfsd_unlink() clobbers non-zero status returned from fh_fill_pre_attrs()
    a84c80515ca8 nfsd: fix management of listener transports
    cad3479b6366 nfsd: put dl_stid if fail to queue dl_recall
    52e209203c35 nfsd: allow SC_STATUS_FREEABLE when searching via nfs4_lookup_stateid()
    adf0ddb914c9 media: streamzap: fix race between device disconnection and urb callback
    845e9286ff99 media: vimc: skip .s_stream() for stopped entities
    e2d8e7bd3314 exec: fix the racy usage of fs_struct->in_exec
    747e3eec1d7d mm: zswap: fix crypto_free_acomp() deadlock in zswap_cpu_comp_dead()
    2d9709690f31 jfs: add index corruption check to DT_GETPAGE()
    0beddc2a3f9b jfs: fix slab-out-of-bounds read in ea_get()
    b47584c55644 ext4: fix OOB read when checking dotdot dir
    13d6f8ba5074 ext4: don't over-report free space or inodes in statvfs
    0cfea60966e4 wifi: mt76: mt7921: fix kernel panic due to null pointer dereference
    2df8ee605eb6 arm64: Don't call NULL in do_compat_alignment_fixup()
    2e877ff34922 mm/gup: reject FOLL_SPLIT_PMD with hugetlb VMAs
    1abca855ea9f tracing/osnoise: Fix possible recursive locking for cpus_read_lock()
    33052e7f52c5 tracing: Fix synth event printk format for str fields
    cffc2a6718e4 tracing: Ensure module defining synth event cannot be unloaded while tracing
    c85efe6e1374 tracing: Fix use-after-free in print_graph_function_flags during tracer switching
    37c9875c178f exfat: fix potential wrong error return from get_block
    49b0a6ab8e52 exfat: fix random stack corruption after get_block
    ca8bed31edf7 ksmbd: fix null pointer dereference in alloc_preauth_hash()
    56de7778a485 ksmbd: validate zero num_subauth before sub_auth is accessed
    6a9cd9ff0fa2 ksmbd: fix overflow in dacloffset bounds check
    9069939d7621 ksmbd: fix session use-after-free in multichannel connection
    ca042cc0e4f9 ksmbd: fix use-after-free in ksmbd_sessions_deregister()
    800c482c9ef5 ksmbd: add bounds check for create lease context
    29b946714d6a ksmbd: add bounds check for durable handle context
    9bc3299039d2 KVM: SVM: Don't change target vCPU state on AP Creation VMGEXIT error
    a31fa24813a7 mmc: sdhci-omap: Disable MMC_CAP_AGGRESSIVE_PM for eMMC/SD
    1209241a6b40 mmc: sdhci-pxav3: set NEED_RSP_BUSY capability
    b548a448993a mmc: omap: Fix memory leak in mmc_omap_new_slot
    0c121f2065e4 Remove unnecessary firmware version check for gc v9_4_2
    6b9ddc4f5f2e media: omap3isp: Handle ARM dma_iommu_mapping
    9f7ae45f0c61 ARM: 9444/1: add KEEP() keyword to ARM_VECTORS
    498edda23f7e ACPI: resource: Skip IRQ override on ASUS Vivobook 14 X1404VAP
    e71a57c5aaa3 acpi: nfit: fix narrowing conversion in acpi_nfit_ctl
    339d6c965f20 wifi: mt76: mt7925: remove unused acpi function for clc
    93224deb50a8 x86/mm: Fix flush_tlb_range() when used for zapping normal PMDs
    70a2fa13d4a9 x86/tsc: Always save/restore TSC sched_clock() on suspend/resume
    e3d54decc75c x86/Kconfig: Add cmpxchg8b support back to Geode CPUs
    e8bba7ced03e idpf: Don't hard code napi_struct size
    c35771342e47 uprobes/x86: Harden uretprobe syscall trampoline check
    3a8bec6583e5 perf/x86/intel: Avoid disable PMU if !cpuc->enabled in sample read
    e853bb7d6aec perf/x86/intel: Apply static call for drain_pebs
    854b6764be33 ntb_perf: Delete duplicate dmaengine_unmap_put() call in perf_copy_chunk()
    1a85281415fb platform/x86: ISST: Correct command storage data length
    48792ab44552 platform/x86: thinkpad_acpi: disable ACPI fan access for T495* and E560
    35c1834dd630 ACPI: x86: Extend Lenovo Yoga Tab 3 quirk with skip GPIO event-handlers
    805e3ce5e0e3 x86/tdx: Fix arch_safe_halt() execution for TDX VMs
    3e3d8169c095 x86/mce: use is_copy_from_user() to determine copy-from-user context
    ada88219d531 x86/microcode/AMD: Fix __apply_microcode_amd()'s return value
    d39838da59bd KVM: x86: block KVM_CAP_SYNC_REGS if guest state is protected
    a54247efbc73 x86/hyperv: Fix check of return value from snp_set_vmsa()
    add72c418d0a LoongArch: BPF: Use move_addr() for BPF_PSEUDO_FUNC
    223d565d8892 LoongArch: BPF: Don't override subprog's return value
    205a2182c51f LoongArch: BPF: Fix off-by-one error in build_prologue()
    0aa5d4370b5b LoongArch: Increase MAX_IO_PICS up to 8
    1d0def2d1658 LoongArch: Increase ARCH_DMA_MINALIGN up to 16
    dc07c4698587 rust: Fix enabling Rust and building with GCC for LoongArch
    d689645cd159 usbnet:fix NPE during rx_complete
    86f327305ed4 wifi: mac80211: Fix sparse warning for monitor_sdata
    96fa2608296d tty: serial: lpuart: only disable CTS instead of overwriting the whole UARTMODIR register
    b09ff334c168 tty: serial: fsl_lpuart: Fix unused variable 'sport' build warning
    ac08fa36d8cb tty: serial: fsl_lpuart: use port struct directly to simply code
    82719d0e7584 tty: serial: fsl_lpuart: Use u32 and u8 for register variables
    3501677651ca cgroup/rstat: Fix forceidle time in cpu.stat
    39bc1484eb06 cgroup/rstat: Tracking cgroup-level niced CPU time
    ef79f2dec7a9 tracing: Correct the refcount if the hist/hist_debug file fails to open
    eecb62a24b23 tracing/hist: Support POLLPRI event for poll on histogram
    fe87f8d3a5b4 tracing/hist: Add poll(POLLIN) support on hist file
    387dc88c2c27 tracing: Switch trace_events_hist.c code over to use guard()
    7de8290a66df tools/power turbostat: report CoreThr per measurement interval
    e9c928807239 perf/core: Fix child_total_time_enabled accounting bug at task exit
    d3f0a68b2914 drm/amdgpu/gfx12: fix num_mec
    2ac69453e9e5 drm/amdgpu/gfx11: fix num_mec
    528287815ee5 kbuild: deb-pkg: don't set KBUILD_BUILD_VERSION unconditionally
    8a88bb092f42 net: ibmveth: make veth_pool_store stop hanging
    ebebeb58d48e arcnet: Add NULL check in com20020pci_probe()
    f4fea25f5c7f ipv6: Do not consider link down nexthops in path selection
    1eb36a2cdf63 ipv6: Start path selection from the first nexthop
    2952776c69a1 net: fix geneve_opt length integer overflow
    9dec9dacaeed net: dsa: mv88e6xxx: propperly shutdown PPU re-enable timer on destroy
    de579015d132 ipv6: fix omitted netlink attributes when using RTEXT_FILTER_SKIP_STATS
    0a93a710d6df netfilter: nft_tunnel: fix geneve_opt type confusion addition
    92a5c1851311 net: decrease cached dst counters in dst_release
    9539c1721a36 tunnels: Accept PACKET_HOST in skb_tunnel_check_pmtu().
    47744d0d5f3b vsock: avoid timeout during connect() if the socket is closing
    a116b271bf3c udp: Fix memory accounting leak.
    94d5ad7b4112 udp: Fix multiple wraparounds of sk->sk_rmem_alloc.
    fcbfb54a0269 net: mvpp2: Prevent parser TCAM memory corruption
    e5178bfc55b3 sctp: add mutual exclusion in proc_sctp_do_udp_port()
    2f35b7673a3a net_sched: skbprio: Remove overly strict queue assertions
    3ba9cf69de50 netlabel: Fix NULL pointer exception caused by CALIPSO on IPv4 sockets
    feb1fa2a03a2 netfilter: nf_tables: don't unregister hook when table is dormant
    86bd9609fd3e netfilter: nft_set_hash: GC reaps elements with conncount for dynamic sets only
    79618e952ef4 idpf: fix adapter NULL pointer dereference on reboot
    d11d0ce887f4 e1000e: change k1 configuration on MTP and later platforms
    40d187b247b3 spi: bcm2835: Restore native CS probing when pinctrl-bcm2835 is absent
    174954911f1c ALSA: hda/realtek: Fix built-in mic on another ASUS VivoBook model
    48b175aa4677 spi: bcm2835: Do not call gpiod_put() on invalid descriptor
    4d8458e48ff1 ASoC: imx-card: Add NULL check in imx_card_probe()
    a3800b64f866 nvme/ioctl: don't warn on vectorized uring_cmd with fixed buffer
    c35ec5e046ba riscv/purgatory: 4B align purgatory_start
    4c6b1d08e614 riscv/kexec_file: Handle R_RISCV_64 in purgatory relocator
    be85b932b578 riscv: Fix hugetlb retrieval of number of ptes in case of !present pte
    e50781bf7acc spi: cadence: Fix out-of-bounds array access in cdns_mrvl_xspi_setup_clock()
    d3b862658669 ASoC: codecs: rt5665: Fix some error handling paths in rt5665_probe()
    c76bb2d0aa54 s390/entry: Fix setting _CIF_MCCK_GUEST with lowcore relocation
    7e3497d7dacb ublk: make sure ubq->canceling is set when queue is frozen
    efd101b1f0f5 x86/uaccess: Improve performance by aligning writes to 8 bytes in copy_user_generic(), on non-FSRM/ERMS CPUs
    0751db851374 RISC-V: errata: Use medany for relocatable builds
    92a25feb4546 ALSA: hda/realtek: Fix built-in mic breakage on ASUS VivoBook X515JA
    26d14768c4ba firmware: cs_dsp: Ensure cs_dsp_load[_coeff]() returns 0 on success
    3dbb73a07579 ntb: intel: Fix using link status DB's
    cb153bdc1812 ntb_hw_switchtec: Fix shift-out-of-bounds in switchtec_ntb_mw_set_trans
    4119e80ce22d riscv: ftrace: Add parentheses in macro definitions of make_call_t0 and make_call_ra
    8522051c58d6 fs/9p: fix NULL pointer dereference on mkdir
    d04600f43569 spufs: fix a leak in spufs_create_context()
    029d8c711f5e spufs: fix gang directory lifetimes
    35f789ccebd6 spufs: fix a leak on spufs_new_file() failure
    7a95b4887348 netfs: Fix netfs_unbuffered_read() to return ssize_t rather than int
    8a2cc9ffd13c hwmon: (nct6775-core) Fix out of bounds access for NCT679{8,9}
    bc08c087118e memory: omap-gpmc: drop no compatible check
    d840c84cdddd can: statistics: use atomic access in hot path
    54c198d672ca ALSA: hda/realtek: Add mute LED quirk for HP Pavilion x360 14-dy1xxx
    a3612053b2e7 selftests: netfilter: skip br_netfilter queue tests if kernel is tainted
    93c59b5548ee net: devmem: do not WARN conditionally after netdev_rx_queue_restart()
    cf1b90486748 drm/amd: Keep display off while going into S4
    3e6ce0d9ec79 nvme-pci: fix stuck reset on concurrent DPC and HP
    5e194e0f77ee x86/sgx: Warn explicitly if X86_FEATURE_SGX_LC is not enabled
    eafd7ec55b1d x86/hyperv: Fix output argument to hypercall that changes page visibility
    ddf40162ac79 locking/semaphore: Use wake_q to wake up processes outside lock critical section
    e401fa5b953e wifi: mac80211: fix SA Query processing in MLO
    9465e09b74eb wifi: mac80211: flush the station before moving it to UN-AUTHORIZED state
    56e6d4a8877f ASoC: rt1320: set wake_capable = 0 explicitly
    f8dfd7c50170 ASoC: codecs: wsa884x: report temps to hwmon in millidegree of Celsius
    e1fc76b2bbf3 x86/hyperv/vtl: Stop kernel from probing VTL0 low memory
    ecc08c460866 sched/deadline: Use online cpus for validating runtime
    c730833bc025 ALSA: hda/realtek: Add support for ASUS Zenbook UM3406KA Laptops using CS35L41 HDA
    01a27b2dd07f ALSA: hda/realtek: Add support for ASUS B5405 and B5605 Laptops using CS35L41 HDA
    2e2626d1e8db ALSA: hda/realtek: Add support for ASUS B3405 and B3605 Laptops using CS35L41 HDA
    f57ca98c65cd ALSA: hda/realtek: Add support for various ASUS Laptops using CS35L41 HDA
    ff8ebaf47dce ALSA: hda/realtek: Add support for ASUS ROG Strix G614 Laptops using CS35L41 HDA
    9dcf970c5c38 ALSA: hda/realtek: Add support for ASUS ROG Strix GA603 Laptops using CS35L41 HDA
    c7943f0677d6 ALSA: hda/realtek: Add support for ASUS ROG Strix G814 Laptop using CS35L41 HDA
    92075758782c exfat: add a check for invalid data size
    77a5ed6b0349 platform/x86/amd/pmf: Update PMF Driver for Compatibility with new PMF-TA
    5dd021991430 platform/x86/amd/pmf: Propagate PMF-TA return codes
    f7038ea68fc0 HID: i2c-hid: improve i2c_hid_get_report error message
    95459156b366 net: dsa: rtl8366rb: don't prompt users for LED control
    64eb31d872fe platform/x86/intel/vsec: Add Diamond Rapids support
    10ac73318c3a platform/x86: intel-hid: fix volume buttons on Microsoft Surface Go 4 tablet
    6edee7c63b93 cifs: fix incorrect validation for num_aces field of smb_acl
    da087905e327 smb: common: change the data type of num_aces to le16
    7364420090ac perf/core: Fix perf_pmu_register() vs. perf_init_event()
    fbd3a04bd86f ALSA: hda: Fix speakers on ASUS EXPERTBOOK P5405CSA 1.0
    64c707d24ccc ALSA: hda/realtek: Fix Asus Z13 2025 audio
    83d888b69310 affs: don't write overlarge OFS data block size fields
    4fbfb003bba4 affs: generate OFS sequence numbers starting at 1
    d8575bdcf820 wifi: brcmfmac: keep power during suspend if board requires it
    5eb8c8fee726 nvme-pci: skip CMB blocks incompatible with PCI P2P DMA
    63bd235de242 nvme-pci: clean up CMBMSC when registering CMB fails
    c2fa1deeb4b8 nvme-tcp: fix possible UAF in nvme_tcp_poll
    12622cb7b1d8 wifi: iwlwifi: mvm: use the right version of the rate API
    bd888d67c7ce wifi: iwlwifi: fw: allocate chained SG tables for dump
    e0862a6d3dab wifi: mac80211: remove debugfs dir for virtual monitor
    5d42a3413724 wifi: mac80211: Cleanup sta TXQs on flush
    eb532ac40dc8 nfs: Add missing release on error in nfs_lock_and_join_requests()
    26bf086ebd70 objtool/loongarch: Add unwind hints in prepare_frametrace()
    d80168db5e0c rcu-tasks: Always inline rcu_irq_work_resched()
    00911b416ad7 context_tracking: Always inline ct_{nmi,irq}_{enter,exit}()
    8e49f912ae14 sched/smt: Always inline sched_smt_active()
    22e1e4e11af5 objtool: Fix verbose disassembly if CROSS_COMPILE isn't set
    10856c530de3 octeontx2-af: Free NIX_AF_INT_VEC_GEN irq
    d2e60c3b8a62 octeontx2-af: Fix mbox INTR handler when num VFs > 64
    a436e1434317 net: phy: broadcom: Correct BCM5221 PHY model detection
    d3561dc471ac ACPI: processor: idle: Return an error if both P_LVL{2,3} idle states are invalid
    00c22ab0614a LoongArch: Rework the arch_kgdb_breakpoint() implementation
    035a4a852ee8 LoongArch: Fix device node refcount leak in fdt_cpu_clk_init()
    396cdb580e2e LoongArch: Fix help text of CMDLINE_EXTEND in Kconfig
    11d479dffde5 objtool: Fix segfault in ignore_unreachable_insn()
    2a6f8823ff60 ring-buffer: Fix bytes_dropped calculation issue
    5923492ba353 net/mlx5e: SHAMPO, Make reserved size independent of page size
    457db486203c ksmbd: fix r_count dec/increment mismatch
    e0b32b6f0f13 ksmbd: fix multichannel connection failure
    3e341dbd5f5a ksmbd: use aead_request_free to match aead_request_alloc
    3f17af46cfc7 rndis_host: Flag RNDIS modems as WWAN devices
    28b21ee8e8fb rtnetlink: Allocate vfinfo size for VF GUIDs when supported
    4a9595eb024b exfat: fix missing shutdown check
    6a1407532500 exfat: fix the infinite loop in exfat_find_last_cluster()
    7d8dfc27d90d smb: client: Fix netns refcount imbalance causing leaks and use-after-free
    81270dd79606 NFS: Shut down the nfs_client only after all the superblocks
    cd80277f6521 objtool, media: dib8000: Prevent divide-by-zero in dib8000_set_dds()
    1adc93a525fd objtool, nvmet: Fix out-of-bounds stack access in nvmet_ctrl_state_show()
    456300be232e thermal: core: Remove duplicate struct declaration
    8f178998af67 perf bpf-filter: Fix a parsing error with comma
    2c3dea5d1776 perf tools: annotate asm_pure_loop.S
    aba918999252 fs/procfs: fix the comment above proc_pid_wchan()
    819685fcebdf perf vendor events arm64 AmpereOneX: Fix frontend_bound calculation
    5b2b692804ce tty: n_tty: use uint for space returned by tty_write_room()
    1817c4b85011 staging: vchiq_arm: Fix possible NPR of keep-alive thread
    f3fafa188d96 staging: vchiq_arm: Register debugfs after cdev
    f14dd4025975 staging: rtl8723bs: select CONFIG_CRYPTO_LIB_AES
    ed1d004a5af0 perf: intel-tpebs: Fix incorrect usage of zfree()
    70afdf771171 perf dso: fix dso__is_kallsyms() check
    18ea76a747ac perf python: Check if there is space to copy all the event
    9816424d65a2 perf python: Don't keep a raw_data pointer to consumed ring buffer space
    4608d15a43fb perf python: Decrement the refcount of just created event on failure
    f0343969111f perf python: Fixup description of sample.id event member
    e1c900e078d5 i3c: master: svc: Fix missing the IBI rules
    a8edfc206ed1 um: hostfs: avoid issues on inode number reuse by host
    5b37d2370d0c um: remove copy_from_kernel_nofault_allowed
    2b0328c5f0f9 um: Pass the correct Rust target and options with gcc
    0d8ba0ed03c3 selftests/mm/cow: fix the incorrect error handling
    eafb4e3a82aa fuse: fix dax truncate/punch_hole fault path
    ca27c16539a3 NFS: fix open_owner_id_maxsz and related fields.
    46117472a279 NFSv4: Avoid unnecessary scans of filesystems for delayed delegations
    8765bc2638ce NFSv4: Avoid unnecessary scans of filesystems for expired delegations
    ac8be75a7deb NFSv4: Avoid unnecessary scans of filesystems for returning delegations
    4595beb5fee9 NFSv4: Don't trigger uneccessary scans for return-on-close delegations
    d04bea49c806 arch/powerpc: drop GENERIC_PTDUMP from mpc885_ads_defconfig
    49d2a2ea9d30 ocfs2: validate l_tree_depth to avoid out-of-bounds access
    c6338b0d56f0 kexec: initialize ELF lowest address to ULONG_MAX
    c42282a07832 kernel/events/uprobes: handle device-exclusive entries correctly in __replace_page()
    32222c0fd242 perf units: Fix insufficient array space
    b18056f753bf perf evlist: Add success path to evlist__create_syswide_maps
    7cd1096d3bea perf debug: Avoid stack overflow in recursive error message
    7a40b52d4442 iio: light: Add check for array bounds in veml6075_read_int_time_ms
    967570b52826 iio: adc: ad7768-1: set MOSI idle state to prevent accidental reset
    dd6391006379 iio: adc: ad7173: Fix comparison of channel configs
    12eeec2fe012 iio: adc: ad7124: Fix comparison of channel configs
    0c13dc967e07 iio: adc: ad4130: Fix comparison of channel setups
    55e2dbe2ba78 dmaengine: fsl-edma: free irq correctly in remove path
    bcd00d044346 dmaengine: fsl-edma: cleanup chan after dma_async_device_unregister
    201a2bdda13b fs/ntfs3: Prevent integer overflow in hdr_first_de()
    284c9549386e fs/ntfs3: Fix a couple integer overflows on 32bit systems
    8109f57613a0 usb: xhci: correct debug message page size calculation
    fc1b20f16897 perf bench: Fix perf bench syscall loop count
    8e901e95bedc perf arm-spe: Fix load-store operation checking
    df3892e5e861 iio: backend: make sure to NULL terminate stack buffer
    91cc7dca2a69 iio: accel: msa311: Fix failure to release runtime pm if direct mode claim fails.
    7c640dd70e63 iio: accel: mma8452: Ensure error return on failure to matching oversampling ratio
    a17a3db6d411 ucsi_ccg: Don't show failed to get FW build information error
    d72a8585043b perf build: Fix in-tree build due to symbolic link
    a7b29a28d1e4 tools/x86: Fix linux/unaligned.h include path in lib/insn.c
    72a149792714 perf pmu: Don't double count common sysfs and json events
    1315b08f609e coresight-etm4x: add isb() before reading the TRCSTATR
    3a19eb3d9818 vhost-scsi: Fix handling of multiple calls to vhost_scsi_set_endpoint
    e90a5776e105 coresight: catu: Fix number of pages while using 64k pages
    6f774f82a7fa greybus: gb-beagleplay: Add error handling for gb_greybus_init
    372a144dbb96 perf report: Switch data file correctly in TUI
    0e344b67bf26 soundwire: slave: fix an OF node reference leak in soundwire slave device
    82d0586c3592 isofs: fix KMSAN uninit-value bug in do_isofs_readdir()
    f9b0819e8b10 phy: phy-rockchip-samsung-hdptx: Don't use dt aliases to determine phy-id
    641394fbb5a5 fs/ntfs3: Update inode->i_mapping->a_ops on compression state
    4f750b846280 w1: fix NULL pointer dereference in probe
    4baed8d7452b perf: Always feature test reallocarray
    de9c71274735 perf stat: Fix find_stat for mixed legacy/non-legacy events
    165b155dfedb clk: qcom: mmcc-sdm660: fix stuck video_subcore0 clock
    bf233124d398 pinctrl: intel: Fix wrong bypass assignment in intel_pinctrl_probe_pwm()
    5416777d568a crypto: hisilicon/sec2 - fix for aead auth key length
    0d6460b9d2a3 RDMA/core: Fix use-after-free when rename device name
    782526a40149 x86/dumpstack: Fix inaccurate unwinding from exception stacks due to misplaced assignment
    c2ddf2f5760b leds: Fix LED_OFF brightness race
    a1fab9e64948 mfd: sm501: Switch to BIT() to mitigate integer overflows
    7ee71ef057b1 pinctrl: renesas: rzv2m: Fix missing of_node_put() call
    cad677085274 RDMA/mlx5: Fix mlx5_poll_one() cur_qp update flow
    19e6817f8400 bpf: Fix array bounds error with may_goto
    cff6b3c8085d clk: qcom: gcc-sm8650: Do not turn off USB GDSCs during gdsc_disable()
    4fdbccc738af crypto: nx - Fix uninitialised hv_nxc on error
    ac9e52aca2cb power: supply: max77693: Fix wrong conversion of charge input threshold value
    b6542ef0d4dd x86/entry: Fix ORC unwinder for PUSH_REGS with save_ret=1
    cd0e4789f870 clk: amlogic: g12a: fix mmc A peripheral clock
    f29760cdca4b clk: clk-imx8mp-audiomix: fix dsp/ocram_a clock parents
    64bb7efb0c4c crypto: qat - remove access to parity register for QAT GEN4
    4409e87cdc8b pinctrl: npcm8xx: Fix incorrect struct npcm8xx_pincfg assignment
    8ba426f170f1 rust: fix signature of rust_fmt_argument
    c9fad5ce1ef9 selftests/bpf: Select NUMA_NO_NODE to create map
    4d32504f7ae9 clk: amlogic: gxbb: drop non existing 32k clock parent
    dc8477444ac6 clk: amlogic: g12b: fix cluster A parent data
    52f3ef292b7b pinctrl: tegra: Set SFIO mode to Mux Register
    2aec4d9a79a7 IB/mad: Check available slots before posting receive WRs
    6d4e56e4c581 crypto: api - Fix larval relookup type and mask
    eae034cdcee9 power: supply: bq27xxx_battery: do not update cached flags prematurely
    005d8de09c71 remoteproc: qcom_q6v5_mss: Handle platforms with one power domain
    a114d25d584c RDMA/erdma: Prevent use-after-free in erdma_accept_newconn()
    257f0bdd5a4b RDMA/mlx5: Fix calculation of total invalidated pages
    df45ae2a4f1c RDMA/core: Don't expose hw_counters outside of init net namespace
    c9c2582c4cd1 clk: rockchip: rk3328: fix wrong clk_ref_usb3otg parent
    dcb5997ead6d selftests/bpf: Fix freplace_link segfault in tailcalls prog test
    25aa4fe297a5 RDMA/mlx5: Fix MR cache initialization error flow
    fb4206c76b99 pinctrl: renesas: rzg2l: Fix missing of_node_put() call
    3980e3741a8c pinctrl: renesas: rza2: Fix missing of_node_put() call
    e7b7f5a170d3 lib: 842: Improve error handling in sw842_compress()
    8ed5381756de bpf: Use preempt_count() directly in bpf_send_signal_common()
    42efddee037b clk: qcom: gcc-x1e80100: Unregister GCC_GPU_CFG_AHB_CLK/GCC_DISP_XO_CLK
    82484764ea90 remoteproc: qcom_q6v5_pas: Use resource with CX PD for MSM8226
    4a7e28e3523f crypto: tegra - Set IV to NULL explicitly for AES ECB
    7d25febb0e03 RDMA/mana_ib: Ensure variable err is initialized
    088a200ebf46 s390: Remove ioremap_wt() and pgprot_writethrough()
    bd717b4dea87 clk: qcom: gcc-msm8953: fix stuck venus0_core0 clock
    13a2312c5352 crypto: tegra - Fix CMAC intermediate result handling
    241d9965109b pinctrl: nuvoton: npcm8xx: Fix error handling in npcm8xx_gpio_fw()
    24307866e0ac clk: samsung: Fix UBSAN panic in samsung_clk_init()
    81d4e03116d3 remoteproc: qcom: pas: add minidump_id to SC7280 WPSS
    b5d1970003cc clk: renesas: r8a08g045: Check the source of the CPU PLL settings
    8d6373f83f36 x86/mm/pat: Fix VM_PAT handling when fork() fails in copy_page_range()
    919206201aac selftests/bpf: Fix string read in strncmp benchmark
    652a3dfd8c2b libbpf: Fix hypothetical STT_SECTION extern NULL deref case
    73fd28b12d78 remoteproc: qcom_q6v5_pas: Make single-PD handling more robust
    26c0229b604e pinctrl: renesas: rzg2l: Suppress binding attributes
    bfcca46f01ac of: property: Increase NR_FWNODE_REFERENCE_ARGS
    2df19f5f6f72 remoteproc: core: Clear table_sz when rproc_shutdown
    01fd737776ca RDMA/mlx5: Fix page_size variable overflow
    51bcbe6cdaf0 crypto: hisilicon/sec2 - fix for sec spec check
    71f4581c464b crypto: hisilicon/sec2 - fix for aead authsize alignment
    0069c0e671ab clk: amlogic: gxbb: drop incorrect flag on 32k clock
    46ea02988bb9 crypto: tegra - Use HMAC fallback when keyslots are full
    057298d19334 crypto: bpf - Add MODULE_DESCRIPTION for skcipher
    3e0d61cf588f crypto: tegra - check return value for hash do_one_req
    5d9147db00d3 crypto: tegra - Use separate buffer for setkey
    f23dfee54b57 crypto: qat - set parity error mask for qat_420xx
    92936d50c5b8 crypto: iaa - Test the correct request flag
    238ece4937aa fbdev: sm501fb: Add some geometry checks.
    8356f4570082 mdacon: rework dependency list
    d3ea050c153d dummycon: fix default rows/cols
    9a14cacaf527 fbdev: au1100fb: Move a variable assignment behind a null pointer check
    b1c4bd166771 PCI: pciehp: Don't enable HPIE when resuming in poll mode
    e23dfb926f5b PCI: Fix BAR resizing when VF BARs are assigned
    a1855c2ebb88 PCI: histb: Fix an error handling path in histb_pcie_probe()
    b004cf517d8e PCI: dwc: ep: Return -ENOMEM for allocation failures
    3453bcaf2ca9 drm/amd/display: avoid NPD when ASIC does not support DMUB
    d877bf6eb39c drm/mediatek: dsi: fix error codes in mtk_dsi_host_transfer()
    57a9fb47551b drm/mediatek: dp: drm_err => dev_err in HPD path to avoid NULL ptr
    e5838a2bf16f drm/mediatek: Fix config_updating flag never false when no mbox channel
    02e94069c3e9 PCI: xilinx-cpm: Fix IRQ domain leak in error path of probe
    362b5879a7f3 PCI: Remove stray put_device() in pci_register_host_bridge()
    7b40c5b938e9 powerpc/kexec: fix physical address calculation in clear_utlb_entry()
    7e754aa0daaf crypto: powerpc: Mark ghashp8-ppc.o as an OBJECT_FILES_NON_STANDARD
    a3030fcba3c8 drm/msm/a6xx: Fix a6xx indexed-regs in devcoreduump
    f42a78df8894 drm/amd/display: fix type mismatch in CalculateDynamicMetadataParameters()
    b8b5e2e77083 drm/panthor: Update CS_STATUS_ defines to correct values
    bcb484200441 PCI: Avoid reset when disabled via sysfs
    2a54a1a9c6c9 PCI/portdrv: Only disable pciehp interrupts early when needed
    2cf276e501c4 PCI: brcmstb: Fix potential premature regulator disabling
    df63321a40cc PCI: brcmstb: Fix error path after a call to regulator_bulk_get()
    0fe63272c43c PCI: brcmstb: Use internal register to change link capability
    4557922dbfca PCI: brcmstb: Set generation limit before PCIe link up
    b23b73ea4c21 PCI: cadence-ep: Fix the driver to send MSG TLP for INTx without data payload
    c0ef1c8ef70b drm/amdkfd: Fix Circular Locking Dependency in 'svm_range_cpu_invalidate_pagetables'
    70f1dcc21779 drm/msm/dsi: Set PHY usescase (and mode) before registering DSI host
    2af52e4d2e19 drm/msm/dsi: Use existing per-interface slice count in DSC timing
    a47ee1884c5b drm/msm/dsi/phy: Program clock inverters in correct register
    47a025046640 drm/msm/dpu: don't use active in atomic_check()
    a99219bbd69a drm/amd/display: fix an indent issue in DML21
    8ba27aa51286 PCI/ACS: Fix 'pci=config_acs=' parameter
    91b0ab875128 drm/panel: ilitek-ili9882t: fix GPIO name in error message
    f556b6ba0ac5 PCI/ASPM: Fix link state exit during switch upstream function removal
    4f997843de78 drm/mediatek: mtk_hdmi: Fix typo for aud_sampe_size member
    0fe9a58fa5d0 drm/mediatek: mtk_hdmi: Unregister audio platform device on failure
    372e387c4f1c PCI: Remove add_align overwrite unrelated to size0
    254f771c7067 PCI: Use downstream bridges for distributing resources
    f2b099e945ee drm/amdgpu/umsch: fix ucode check
    2dbf9e3efcc0 drm/amdgpu: refine smu send msg debug log format
    2a07eab05d9d gpu: cdns-mhdp8546: fix call balance of mhdp->clk handling routines
    d5eb8e347905 drm/vkms: Fix use after free and double free on init error
    b84d743c2393 drm: xlnx: zynqmp: Fix max dma segment size
    dd8e6445e4e3 drm/bridge: it6505: fix HDCP V match check is not performed correctly
    69e90c1e3391 drm/dp_mst: Fix drm RAD print
    5ffb6b9a1a04 drm/ssd130x: ensure ssd132x pitch is correct
    5a3461ca54db drm/ssd130x: fix ssd132x encoding
    a9c4366566e6 drm/ssd130x: Set SPI .id_table to prevent an SPI core warning
    950513eba9cb drm/bridge: ti-sn65dsi86: Fix multiple instances
    15291b561d8c ALSA: timer: Don't take register_mutex with copy_from/to_user()
    11242f4b9baa ASoC: ti: j721e-evm: Fix clock configuration for ti,j7200-cpb-audio compatible
    f751361b3a15 ALSA: hda/realtek: Always honor no_shutup_pins
    2050247d5ebf dt-bindings: vendor-prefixes: add GOcontroll
    7fdca6c0b12c HID: remove superfluous (and wrong) Makefile entry for CONFIG_INTEL_ISH_FIRMWARE_DOWNLOADER
    da3ac4cf7f13 ASoC: amd: acp: Fix for enabling DMIC on acp platforms via _DSD entry
    748a1118d20d ASoC: cs35l41: check the return value from spi_setup()
    5b6739341500 platform/x86: dell-ddv: Fix temperature calculation
    0654ea13976c platform/x86: dell-uart-backlight: Make dell_uart_bl_serdev_driver static
    a4f38bc600f3 platform/x86: lenovo-yoga-tab2-pro-1380-fastcharger: Make symbol static
    4f42478af663 auxdisplay: panel: Fix an API misuse in panel.c
    f0a72629ccec media: platform: allgro-dvt: unregister v4l2_device on the error path
    d34100049923 media: verisilicon: HEVC: Initialize start_bit field
    e161533964de auxdisplay: MAX6959 should select BITREVERSE
    d026245063d2 regulator: pca9450: Fix enable register for LDO5
    f5852872eb29 x86/entry: Add __init to ia32_emulation_override_cmdline()
    52e513a8850c x86/fpu/xstate: Fix inconsistencies in guest FPU xfeatures
    b86500597089 x86/traps: Make exc_double_fault() consistently noreturn
    5108828fecfc perf/ring_buffer: Allow the EPOLLRDNORM flag for poll
    345957c1cfb8 lockdep: Don't disable interrupts on RT in disable_irq_nosync_lockdep.*()
    c3a4c91a409e PM: sleep: Fix handling devices with direct_complete set on errors
    953d28a4f459 thermal: int340x: Add NULL check for adev
    a8a1bcc27d46 x86/resctrl: Fix allocation of cleanest CLOSID on platforms with no monitors
    385a0265295f EDAC/ie31200: Fix the error path order of ie31200_init()
    4294e94f43c7 EDAC/ie31200: Fix the DIMM size mask for several SoCs
    67d079c0f29e EDAC/ie31200: Fix the size of EDAC_MC_LAYER_CHIP_SELECT layer
    96b4f2e97408 selinux: Chain up tool resolving errors in install_policy.sh
    864750968d71 watchdog/hardlockup/perf: Fix perf_event memory leak
    b471631fa19a kunit/stackinit: Use fill byte different from Clang i386 pattern
    ff435a627342 RISC-V: KVM: Disable the kernel perf counter during configure
    e2bda794d381 cpufreq: tegra194: Allow building for Tegra234
    31d5665172b3 PM: sleep: Adjust check before setting power.must_resume
    4d28c2ab2af5 lockdep/mm: Fix might_fault() lockdep check of current->mm->mmap_lock
    9807270d7399 x86/sev: Add missing RIP_REL_REF() invocations during sme_enable()
    3e14d9a4eb74 x86/platform: Only allow CONFIG_EISA for 32-bit
    a086e7cde509 x86/fpu: Avoid copying dynamic FP state from init_task in arch_dup_task_struct()
    568aa554e760 x86/fpu: Fix guest FPU state buffer allocation size
    2c27c9e1d18a EDAC/{skx_common,i10nm}: Fix some missing error reports on Emerald Rapids
    f381c92ab4ec cpufreq: governor: Fix negative 'idle_time' handling in dbs_update()
    b576c4834d5a sched/eevdf: Force propagating min_slice of cfs_rq when {en,de}queue tasks
    7b1d2454d0b6 sched: Cancel the slice protection of the idle entity
    2d5c37dff4b0 smack: ipv4/ipv6: tcp/dccp/sctp: fix incorrect child socket label
    9d93922280f9 smack: dont compile ipv6 code unless ipv6 is configured
    40426fc0970e cpufreq: scpi: compare kHz instead of Hz
    bc4d689a231d x86/mm/pat: cpa-test: fix length for CPA_ARRAY test
    56ec918e6c86 watch_queue: fix pipe accounting mismatch
    2ee7ebed771b mips: Add '-std=gnu11' to vdso CFLAGS
    b2c792d89ac5 yaffs2: switch from readlink_copy() to vfs_readlink()
    807165b1ec1c tools/power/x86/intel-speed-select: Prefix header search path with sysroot
    e97df805b938 drm/tilcdc: Set preferred depth
    7160a4379dcc arch/arm64/configs: remove CONFIG_SM_DISPCC_8650
    6d8ac5ebe6e8 aufs6: core
    587abc1b64c4 aufs6: standalone
    1af41d30ef42 aufs6: mmap
    6ee2464d2e9d aufs6: base
    103b676505f7 aufs6: kbuild
    67281562943f qemux86: add configuration symbol to select values
    73f315ca0823 sched/isolation: really align nohz_full with rcu_nocbs
    1e4e7f8ab622 clear_warn_once: add a clear_warn_once= boot parameter
    918e7a825e8b clear_warn_once: bind a timer to written reset value
    f533f87c3758 clear_warn_once: expand debugfs to include read support
    f149ca27cba9 tools: Remove some options from CLANG_CROSS_FLAGS
    e633abe9c44e libbpf: Fix build warning on ref_ctr_off
    ec0916a4cfc1 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    03721ceb5626 perf: x86-32: explicitly include <errno.h>
    4c36c5295bb0 perf: mips64: Convert __u64 to unsigned long long
    b0200449610d perf: fix bench numa compilation
    aff0940b2212 perf: add SLANG_INC for slang.h
    ef912018d28c perf: add sgidefs.h to for mips builds
    d8860f858b87 perf: change --root to --prefix for python install
    dc38a0eee6e5 perf: add 'libperl not found' warning
    6ed51f8786da perf: force include of <stdbool.h>
    c538d4c4ac65 fat: Replace prandom_u32() with get_random_u32()
    63d94846f0c5 fat: don't use obsolete random32 call in namei_vfat
    7816667451ef FAT: Added FAT_NO_83NAME
    f81dbd60f0d5 FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    771cdefba44b FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    a24784fd8f88 yaffs2: update to v6.12 folio changes
    d0a48fd46db8 yaffs2: adapt to v6.10 i_time changes
    d097e4d4115a yaffs: fix mtime/itime field access
    4411e0d49fe3 yaffs2: update VFS ctime operations to 6.6+
    1b6619086e8b yaffs2: v6.5 fixups
    25b261ee3c54 yaffs2: Fix miscalculation of devname buffer length
    5c07936a5d1c yaffs2: convert user_namespace to mnt_idmap
    55986a1284b3 yaffs2: replace bdevname call with sprintf
    6f5508f8db8f yaffs2: convert read_page -> readfolio
    fd179a5df5d5 yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    c9a620dacdd1 yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    78588208ed17 yaffs2: v5.12+ build fixups (not runtime tested)
    8d2dddba272c yaffs: include blkdev.h
    8c1ca9ef9712 yaffs: Fix build failure by handling inode i_version with proper atomic API
    27005cbac2ed yaffs2: v5.6 build fixups
    668211c9f9b7 yaffs2: fix memory leak when /proc/yaffs is read
    285f911dcc1c yaffs: add strict check when call yaffs_internal_read_super
    ffc2ed489ccf yaffs: repair yaffs_get_mtd_device
    6dce4b70a5e3 yaffs: Fix build failure by handling inode i_version with proper atomic API
    19f283abc5d1 yaffs2: fix memory leak in mount/umount
    04e84672b571 yaffs: Avoid setting any ACL releated xattr
    4f221d6a32e2 Yaffs:check oob size before auto selecting Yaffs1
    81f36004e56b fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    26d7a3dd0054 yaffs2: adjust to proper location of MS_RDONLY
    a7016eac4540 yaffs2: import git revision b4ce1bb (jan, 2020)
    feb240bbb91e initramfs: allow an optional wrapper script around initramfs generation
    874746eaa341 drivers: gpu: drm: msm: registers: improve reproducibility
    1d42508faee8 tools: use basename to identify file in gen-mach-types
    4b055eca593d iwlwifi: select MAC80211_LEDS conditionally
    97e20e275ac0 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    6dec58319165 defconfigs: drop obselete options
    a416ccb5b6c9 linux-yocto: Handle /bin/awk issues
    7efe8a1e5158 uvesafb: provide option to specify timeout for task completion
    78d10ae07eca uvesafb: print error message when task timeout occurs
    80473b7eb8ca compiler.h: Undef before redefining __attribute_const__
    ddeff2f1a9a7 vmware: include jiffies.h
    3dcdda8912b4 Resolve jiffies wrapping about arp
    3b1507db6735 nfs: Allow default io size to be configured.
    c2fedad05f77 check console device file on fs when booting
    208d6fbada3f mount_root: clarify error messages for when no rootfs found
    dbe9454c8ea0 mconf: fix output of cflags and libraries
    7c7b224f5cce menuconfig,mconf-cfg: Allow specification of ncurses location
    b6c189c81397 modpost: mask trivial warnings
    a5cc21325ba9 kbuild: exclude meta directory from distclean processing
    361ec143c23f powerpc: serialize image targets
    605e6ccb304c arm: serialize build targets
    e94b04fcb7d2 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    44cc7f69a0a0 cpu/amd: inhibit SMP check for qemux86
    a08cb65331e6 x86_64_defconfig: Fix warnings
    8ad332ef777b mips: make current_cpu_data preempt safe
    754f05ddce3f mips: vdso: fix 'jalr $t9' crash in vdso code
    325ff78ff44d mips: Kconfig: add QEMUMIPS64 option
    99ae0eadcf11 4kc cache tlb hazard: tlbp cache coherency
    c6894c66a534 malta uhci quirks: make allowance for slow 4k(e)c
    8b52c01f3294 arm64: defconfig: remove CONFIG_IPQ_APSS_5018
    16c7629f035e drm/fb-helper: move zeroing code to drm_fb_helper_fill_var
    6b60c874cbb0 arm64: defconfig: cleanup config options
    8e44673ecd89 vexpress: Pass LOADADDR to Makefile
    f34e6805aad5 arm: ARM EABI socketcall
    94dec9b88de4 ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index e672d79dd7..22d7758f8a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "960077a20c6a927a576235a80d23851a00bbc34f"
-SRCREV_meta ?= "702c2b220c24ba42deb79a2d3c40488a698bd77b"
+SRCREV_machine ?= "8569a61bf30561b620c3171431906cd8ddb7d095"
+SRCREV_meta ?= "cc3691c02d54e5a5d91ef5dfe670ee80ab323ef3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.22"
+LINUX_VERSION ?= "6.12.23"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 23b1d80c4b..c7a058599b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.22"
+LINUX_VERSION ?= "6.12.23"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "6c467459255e4005f8fa082a7c1f2909abcf9de5"
-SRCREV_meta ?= "702c2b220c24ba42deb79a2d3c40488a698bd77b"
+SRCREV_machine ?= "c2c450e032c7bf2653e50fc0a87329ce5660b6be"
+SRCREV_meta ?= "cc3691c02d54e5a5d91ef5dfe670ee80ab323ef3"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index b0fcecc850..4df34f3b0b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "fe9e38fa63fe6652f86046bcc6f670729deee4bf"
-SRCREV_machine:qemuarm64 ?= "6c467459255e4005f8fa082a7c1f2909abcf9de5"
-SRCREV_machine:qemuloongarch64 ?= "6c467459255e4005f8fa082a7c1f2909abcf9de5"
-SRCREV_machine:qemumips ?= "4b24835dc644c442b4008815241a38497356f029"
-SRCREV_machine:qemuppc ?= "6c467459255e4005f8fa082a7c1f2909abcf9de5"
-SRCREV_machine:qemuriscv64 ?= "6c467459255e4005f8fa082a7c1f2909abcf9de5"
-SRCREV_machine:qemuriscv32 ?= "6c467459255e4005f8fa082a7c1f2909abcf9de5"
-SRCREV_machine:qemux86 ?= "6c467459255e4005f8fa082a7c1f2909abcf9de5"
-SRCREV_machine:qemux86-64 ?= "6c467459255e4005f8fa082a7c1f2909abcf9de5"
-SRCREV_machine:qemumips64 ?= "bf4d16d07b6213b7423097d9c6b207d809313392"
-SRCREV_machine ?= "6c467459255e4005f8fa082a7c1f2909abcf9de5"
-SRCREV_meta ?= "702c2b220c24ba42deb79a2d3c40488a698bd77b"
+SRCREV_machine:qemuarm ?= "dfeb3f6f2658b9d6ae4d5abebc184bd498dd59e9"
+SRCREV_machine:qemuarm64 ?= "c2c450e032c7bf2653e50fc0a87329ce5660b6be"
+SRCREV_machine:qemuloongarch64 ?= "c2c450e032c7bf2653e50fc0a87329ce5660b6be"
+SRCREV_machine:qemumips ?= "8c15ba1838fe0cb24f1ced0b24dedad562dbfd7a"
+SRCREV_machine:qemuppc ?= "c2c450e032c7bf2653e50fc0a87329ce5660b6be"
+SRCREV_machine:qemuriscv64 ?= "c2c450e032c7bf2653e50fc0a87329ce5660b6be"
+SRCREV_machine:qemuriscv32 ?= "c2c450e032c7bf2653e50fc0a87329ce5660b6be"
+SRCREV_machine:qemux86 ?= "c2c450e032c7bf2653e50fc0a87329ce5660b6be"
+SRCREV_machine:qemux86-64 ?= "c2c450e032c7bf2653e50fc0a87329ce5660b6be"
+SRCREV_machine:qemumips64 ?= "8a34918e22d2fc3b37282d1929e760747762b74e"
+SRCREV_machine ?= "c2c450e032c7bf2653e50fc0a87329ce5660b6be"
+SRCREV_meta ?= "cc3691c02d54e5a5d91ef5dfe670ee80ab323ef3"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "55767d6e74ef155f43fff978ad4e2f69f3f8fad7"
+SRCREV_machine:class-devupstream ?= "83b4161a63b87ce40d9f24f09b5b006f63d95b7c"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.22"
+LINUX_VERSION ?= "6.12.23"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


