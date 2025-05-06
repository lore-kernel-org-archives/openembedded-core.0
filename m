Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E09C3ABC3
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 16:33:16 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.80412.1746549187105651691
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 09:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BCI0ZFcn;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6e8fb83e137so56760866d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 09:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746549186; x=1747153986; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ooIFsDWnl66TEC3uCHceYVnAr5mvi51JYSci93rMuho=;
        b=BCI0ZFcnElhdSNiaLQNrhRvmFun6ULjYbPptVF8o4q651wtmfIU/fNdpBoNKrjFg3S
         +UQuwnQzjCqbmf12QbQgjQ8rJ88ImPE6CDpi2zaes1hVExLuvlCkhA3mVB5C8ApiLSY3
         qc7Kwgkv0+APHHWzPQenydqjS5zcF9/6ffvY7lziE1+Bql7HQuYqnDPuixNLxI4AF4+E
         xMaYUts4yfdRY1w//X3kWr9CUcOUAYEve64W7GwHXjJvB31Y4VBX+WLxDdwYyKtwLWqU
         5SKi2iTZVKH2aI2/9Ec2L3nfr1oC2qbbZUy3NJc8mU/uU47bVVuZM36fz6qbYAseRPpc
         74ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746549186; x=1747153986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ooIFsDWnl66TEC3uCHceYVnAr5mvi51JYSci93rMuho=;
        b=CwFaaxUgalIBKAN4oI82dnSYiYY1xu2fjMPBMgMAVGyfGxG5/x4iX/FqqOyv5kmlTP
         4ajjAtPzHlcYv8gQCp3Fx5qt1DjJT8dFEAhSs/U7jwJcRW46eajdAK7BdG/j3dLeBtrN
         Zz+gybE88x+zcUVB9PQy5mqKkvH8DJkN4XsWS/MI54JSZ4BJs0X3hoqIgQF12VuEHtWn
         n4D0D23kJ3ivlbeJD//rRt29AjxeTBcdoQwyZwDW17P6s8QhMiH32vDdWjXOcpD8cxAY
         oa9b632kx3eOuuP5vGG3YKIWmdhg/fZTf9bYVXICtNqVaLLhm7V3LEsUSFWUJDVfGFXl
         YwtQ==
X-Gm-Message-State: AOJu0Yxp0MSGDYJ5AyES20AwCKHZEo4bo77JRU/ziLFSBJU/mWobJuem
	Mf9yat2ccijOawIFGwtKZ5Sq0w6TSBSOF4xGKVz1i0mpg5LQ5XAJ17VX1qfv
X-Gm-Gg: ASbGncsH0qy6bV1Y+8GSd67pbsRdWQZ0AZqNl7JVMFPgkYTRjfuP5gqdjjvcqsz0J63
	QfS232wwfTbRwfZ3c5okvDOejEUUUT96Br0I5hdiAEWFlyr7mVB2PLfOyszaBIA6MPrSjqgsCf7
	w85c38LcX7+lUbH2gMykxwdBbHR+GmiGD9vnuzcLtEoY6RNMtP+trg9qLLwCG/awTsr43nE2YgC
	xZaa5pyUzBGHBWIBHEKLzs7KYiTaQOG60VXsZo97KFWoHuJkKtGDA7tzGtJPVrorkz3K6nhGtvY
	zfpm0LPvPnIxmbrkpdIFUAWGr6360jhqXnLYCSWB5ODPZ3lNu0OpdkqN54Lk9OU5vikVUwUiF9a
	LfcoWNDl362FXfr7QFyWV83uJB+cFv/A+7iNLb6GKiRfWlRClcVcP
X-Google-Smtp-Source: AGHT+IGYTeUan8j3MFrNd8kIQYBTXGnPW1y+irpHbK8MJcB7aFG1gwSku6Y/atJbzPqC+g9a/plDUg==
X-Received: by 2002:a05:6214:e65:b0:6d8:80e8:d567 with SMTP id 6a1803df08f44-6f5358958dcmr67780986d6.18.1746549185604;
        Tue, 06 May 2025 09:33:05 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cad23c48ffsm735977085a.45.2025.05.06.09.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 09:33:04 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] linux-yocto/6.12: update to v6.12.24
Date: Tue,  6 May 2025 12:32:57 -0400
Message-Id: <9e5d579ae28b57f792dc6593d1af6ea380958c0d.1746548780.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1746548780.git.bruce.ashfield@gmail.com>
References: <cover.1746548780.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 16:33:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216076

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    b6efa8ce222e Linux 6.12.24
    ae5a6a0b425e HSI: ssi_protocol: Fix use after free vulnerability in ssi_protocol Driver Due to Race Condition
    bdbecb2bf531 s390/cpumf: Fix double free on error in cpumf_pmu_event_init()
    281782d2c673 Bluetooth: hci_uart: Fix another race during initialization
    f87626a55c21 media: mediatek: vcodec: mark vdec_vp9_slice_map_counts_eob_coef noinline
    9c03f6194e88 kbuild: Add '-fno-builtin-wcslen'
    5f494f482341 libbpf: Prevent compiler warnings/errors
    bd6eae1f30bf x86/e820: Fix handling of subpage regions when calculating nosave ranges in e820__register_nosave_regions()
    6a59b70fe71e nfsd: don't ignore the return code of svc_proc_register()
    b2b18a9f68f9 NFSD: Fix CB_GETATTR status fix
    560c03189615 NFSD: fix decoding in nfs4_xdr_dec_cb_getattr
    7005fdceff20 ACPI: platform-profile: Fix CFI violation when accessing sysfs files
    20867f094883 x86/paravirt: Move halt paravirt calls under CONFIG_PARAVIRT
    5d9484cd372d iommufd: Fail replace if device has not been attached
    6d11543bf37a iommufd: Make attach_handle generic than fault specific
    9ca4fe357464 arm64: errata: Add newer ARM cores to the spectre_bhb_loop_affected() lists
    d25a240c5a93 thermal/drivers/mediatek/lvts: Disable Stage 3 thermal threshold
    0131251d932f thermal/drivers/mediatek/lvts: Disable monitor mode during suspend
    9580b603654d selftests: mptcp: fix incorrect fd checks in main_loop
    2f1b4d6725b0 selftests: mptcp: close fd_in before returning in main_loop
    0f91e4f69fe6 sched_ext: create_dsq: Return -EEXIST on duplicate request
    7a30bbd36cb4 s390: Fix linker error when -no-pie option is unavailable
    f268ee2fbb53 s390/virtio_ccw: Don't allocate/assign airqs for non-existing queues
    05a0f9c40781 s390/pci: Fix zpci_bus_is_isolated_vf() for non-VFs
    92ca7270fe5e ring-buffer: Use flush_kernel_vmap_range() over flush_dcache_folio()
    de08212061ea pinctrl: samsung: add support for eint_fltcon_offset
    c1368383cd37 pinctrl: qcom: Clear latched interrupt status when changing IRQ type
    beb9a5cb7aa5 phy: freescale: imx8m-pcie: assert phy reset and perst in power off
    869202291aa4 PCI: Fix wrong length of devres array
    9707d0c932f4 PCI: Fix reference leak in pci_register_host_bridge()
    d69ad6e1a579 PCI: Fix reference leak in pci_alloc_child_bus()
    e4a1d7defbc2 PCI: pciehp: Avoid unnecessary device replacement check
    ce9643a541b6 PCI: j721e: Fix the value of .linkdown_irq_regfield for J784S4
    71bf0769a6c6 PCI: brcmstb: Fix missing of_node_put() in brcm_pcie_probe()
    712d84459a53 of/irq: Fix device node refcount leakages in of_irq_init()
    d0f25a99770f of/irq: Fix device node refcount leakage in API irq_of_parse_and_map()
    29cb94963ca9 of/irq: Fix device node refcount leakages in of_irq_count()
    3540164c7594 of/irq: Fix device node refcount leakage in API of_irq_parse_raw()
    dc83eccc93ed of/irq: Fix device node refcount leakage in API of_irq_parse_one()
    60faeef98b99 ntb: use 64-bit arithmetic for the MSI doorbell mask
    34baf1cfd679 net: mana: Switch to page pool for jumbo frames
    a2acc67d6155 misc: pci_endpoint_test: Fix displaying 'irq_type' after 'request_irq' error
    e98f77f74c66 selftests/landlock: Add a new test for setuid()
    76ab50fa6e35 selftests/landlock: Split signal_scoping_threads tests
    b017f2846a3e landlock: Prepare to add second errata
    332facfa8075 landlock: Always allow signals between threads of the same process
    7dd7f87e0711 landlock: Add erratum for TCP fix
    ea980ea4d18a landlock: Add the errata interface
    9b0d24fa64ca landlock: Move code to ease future backports
    7bc5c360375d KVM: x86: Acquire SRCU in KVM_GET_MP_STATE to protect guest memory accesses
    bbf821c35dab KVM: x86: Explicitly zero-initialize on-stack CPUID unions
    99b99032a89e KVM: PPC: Enable CAP_SPAPR_TCE_VFIO on pSeries KVM guests
    fae0a8796c4f KVM: Allow building irqbypass.ko as as module when kvm.ko is a module
    3bc2208c749c gve: handle overflow when reporting TX consumed descriptors
    62024ad4c51e gpio: zynq: Fix wakeup source leaks on device unbind
    2d66517135de gpio: tegra186: fix resource handling in ACPI probe path
    e66fb9b4e9ad ftrace: Properly merge notrace hashes
    1fce9574b9d5 ftrace: Add cond_resched() to ftrace_graph_set_hash()
    3e467f1c74f4 dt-bindings: coresight: qcom,coresight-tpdm: Fix too many 'reg'
    58c453801bb9 dt-bindings: coresight: qcom,coresight-tpda: Fix too many 'reg'
    74f01c2ca802 dm-verity: fix prefetch-vs-suspend race
    dd91458a8443 dm-integrity: fix non-constant-time tag verification
    ba42f98f092b dm-integrity: set ti->error on memory allocation failure
    a1a4fdc33d9c dm-ebs: fix prefetch-vs-suspend race
    08deafddfcb0 dlm: fix error if active rsb is not hashed
    b77f8a17ef6f dlm: fix error if inactive rsb is not hashed
    eaa7014aecb5 crypto: ccp - Fix uAPI definitions of PSP errors
    5116b340cf88 crypto: ccp - Fix check for the primary ASP device
    1f9648e2460b clk: qcom: gdsc: Set retain_ff before moving to HW CTRL
    4d6fb2a43f0d clk: qcom: gdsc: Capture pm_genpd_add_subdomain result code
    12ef07c4bfe4 clk: qcom: gdsc: Release pm subdomains in reverse add order
    809e83a5758e clk: qcom: clk-branch: Fix invert halt status bit check for votable clocks
    56c29847bc4c clk: renesas: r9a07g043: Fix HP clock source for RZ/Five
    4ed194d9bbf7 cifs: Ensure that all non-client-specific reparse points are processed by the server
    2a240405978d cifs: fix integer overflow in match_server()
    e0717385f5c5 cifs: avoid NULL pointer dereference in dbg call
    2eb6e5e0944c CIFS: Propagate min offload along with other parameters from primary to secondary channels.
    63d71ae01092 thermal/drivers/rockchip: Add missing rk3328 mapping entry
    474b3194c8ff tracing: Do not add length to print format in synthetic events
    868df4eb784c tracing: fprobe events: Fix possible UAF on modules
    a7fda1fd6d6c x86/xen: fix balloon target initialization for PVH dom0
    9e7c37fadb3b sctp: detect and prevent references to a freed transport in sendmsg
    65b259e3e06d mm/hwpoison: introduce folio_contain_hwpoisoned_page() helper
    1fd89407d7cb mm/hugetlb: move hugetlb_sysctl_init() to the __init section
    73d17d48df6c mm/hwpoison: do not send SIGBUS to processes with recovered clean pages
    14936034de92 mm/userfaultfd: fix release hang over concurrent GUP
    cc98577f9117 mm: add missing release barrier on PGDAT_RECLAIM_LOCKED unlock
    2532df0a9b74 mm/mremap: correctly handle partial mremap() of VMA starting at 0
    6dd8d9440fd3 mm: fix lazy mmu docs and usage
    83b6b5061ebd mm: make page_mapped_in_vma() hugetlb walk aware
    53dc6b00c02d mm/rmap: reject hugetlb folios in folio_make_device_exclusive()
    ab0af0126023 mm/damon/ops: have damon_get_folio return folio even for tail pages
    5f7f6abd92b6 net: Fix null-ptr-deref by sock_lock_init_class_and_name() and rmmod.
    fba396b79942 sparc/mm: avoid calling arch_enter/leave_lazy_mmu() in set_ptes
    690446dc72d5 sparc/mm: disable preemption in lazy mmu mode
    cb6b9bd66181 iommu/vt-d: Wire up irq_ack() to irq_move_irq() for posted MSIs
    6722a0cb8186 iommu/vt-d: Fix possible circular locking dependency
    e953e11123aa iommu/vt-d: Don't clobber posted vCPU IRTE when host IRQ affinity changes
    c95a438d2c37 iommu/vt-d: Put IRTE back into posted MSI mode if vCPU posting is disabled
    e5dd974d6e00 iommu/tegra241-cmdqv: Fix warnings due to dmam_free_coherent()
    b8b41eac7054 iommufd: Fix uninitialized rc in iommufd_access_rw()
    327e6b8b2816 btrfs: zoned: fix zone finishing with missing devices
    380ba38801eb btrfs: zoned: fix zone activation with missing devices
    b9af27d020e4 btrfs: tests: fix chunk map leak after failure to add it to the tree
    601db4e8bfe8 btrfs: fix non-empty delayed iputs list on unmount due to compressed write workers
    61a5c565fd24 backlight: led_bl: Hold led_access lock when calling led_sysfs_disable()
    a3b36c9da305 arm64: dts: exynos: gs101: disable pinctrl_gsacore node
    ac45d49df9dc arm64: dts: mediatek: mt8173: Fix disp-pwm compatible string
    1dd288783dcb arm64: mm: Correct the update of max_pfn
    21c512430424 arm64: tegra: Remove the Orin NX/Nano suspend key
    eec737e17e55 arm64: mops: Do not dereference src reg for a set operation
    52f251dbfb38 mtd: rawnand: Add status chack in r852_ready()
    5479a6af3c96 mtd: inftlcore: Add error check for inftl_read_oob()
    6554491b4a77 mptcp: only inc MPJoinAckHMacFailure for HMAC failures
    dc81e41a307d mptcp: fix NULL pointer in can_accept_new_subflow
    c7f611e711c8 lib: scatterlist: fix sg_split_phys to preserve original scatterlist offsets
    95f0958240e6 locking/lockdep: Decrease nr_unused_locks if lock unused in zap_class()
    008b90d36d91 mailbox: tegra-hsp: Define dimensioning masks in SoC data
    7b47df6498f2 mfd: ene-kb3930: Fix a potential NULL pointer dereference
    4b037851edd7 leds: rgb: leds-qcom-lpg: Fix calculation of best period Hi-Res PWMs
    5ae9e361e284 leds: rgb: leds-qcom-lpg: Fix pwm resolution max for Hi-Res PWMs
    e94314b72768 kbuild: exclude .rodata.(cst|str)* when building ranges
    9eaec071f111 jbd2: remove wrong sb->s_sequence check
    e6bba328578f i3c: Add NULL pointer check in i3c_master_queue_ibi()
    34aaf448e204 i3c: master: svc: Use readsb helper for reading MDB
    0327683c5571 ima: limit the number of ToMToU integrity violations
    48085ab823f0 ima: limit the number of open-writers integrity violations
    9a264e4a595d smb311 client: fix missing tcon check when mounting with linux/posix extensions
    44a2572a0fdc soc: samsung: exynos-chipid: Add NULL pointer check in exynos_chipid_probe()
    fbda9cac1bb3 svcrdma: do not unregister device for listeners
    f3cb81cb96d5 tpm: do not start chip while suspended
    76cc21a9a40f udf: Fix inode_getblk() return value
    8fd217a99dbb vdpa/mlx5: Fix oversized null mkey longer than 32bit
    a1dde7457d57 f2fs: fix to avoid atomicity corruption of atomic file
    16d9067f00e3 ext4: fix off-by-one error in do_split
    a77955f7704b bus: mhi: host: Fix race between unprepare and queue_buf
    7d12a7d43c7b accel/ivpu: Fix deadlock in ivpu_ms_cleanup()
    5c200b7ebdf9 accel/ivpu: Fix warning in ivpu_ipc_send_receive_internal()
    7022946773d7 ALSA: hda/realtek: Enable Mute LED on HP OMEN 16 Laptop xd000xx
    d2a2076d9cb7 ASoC: qdsp6: q6asm-dai: fix q6asm_dai_compr_set_params error path
    17f1e4213113 ASoC: qdsp6: q6apm-dai: fix capture pipeline overruns.
    aa7e9eabe68c ASoC: qdsp6: q6apm-dai: set 10 ms period and buffer alignment.
    a28217b064f8 ASoC: q6apm-dai: make use of q6apm_get_hw_pointer
    f5891f204d13 ASoC: q6apm-dai: schedule all available frames to avoid dsp under-runs
    d383051f8293 ASoC: q6apm: add q6apm_get_hw_pointer helper
    acadb2e2b3c5 ASoC: codecs: wcd937x: fix a potential memory leak in wcd937x_soc_codec_probe()
    3e0356857ed5 io_uring/kbuf: reject zero sized provided buffers
    b7c6d081c19a io_uring/net: fix io_req_post_cqe abuse by send bundle
    0828d6e9add6 io_uring/net: fix accept multishot handling
    00026f80c430 wifi: mt76: mt7925: fix the wrong simultaneous cap for MLO
    374f2bf7b3ff wifi: mt76: mt7925: fix the wrong link_idx when a p2p_device is present
    0dd6c62c1370 wifi: mt76: mt7925: fix country count limitation for CLC
    1706a07b38ae wifi: mt76: mt7925: ensure wow pattern command align fw format
    eb434adf79dd wifi: mac80211: fix integer overflow in hwmp_route_info_get()
    ef44c9e81172 wifi: mt76: Add check for devm_kstrdup()
    9d6b789a8ff9 clocksource/drivers/stm32-lptimer: Use wakeup capable instead of init wakeup
    9d99358349e4 mtd: Replace kcalloc() with devm_kcalloc()
    2b27df685244 net: dsa: mv88e6xxx: fix internal PHYs for 6320 family
    020404265b87 net: dsa: mv88e6xxx: workaround RGMII transmit delay erratum for 6320 family
    39fc12742292 mtd: Add check for devm_kcalloc()
    91e1405088a9 mptcp: sockopt: fix getting freebind & transparent
    1b4ecd033e30 mptcp: sockopt: fix getting IPV6_V6ONLY
    c59dc7c425cc media: chips-media: wave5: Fix timeout while testing 10bit hevc fluster
    d595713de7f8 media: chips-media: wave5: Fix a hang after seeking
    76cab9f540cc media: chips-media: wave5: Avoid race condition in the interrupt handler
    7fafaf00cc5f media: chips-media: wave5: Fix gray color on screen
    6f77a6d2ea31 media: i2c: imx214: Rectify probe error handling related to runtime PM
    8dd2d1561c6a media: i2c: imx219: Rectify runtime PM handling in probe and remove
    99f929914713 media: i2c: imx319: Rectify runtime PM handling probe and remove
    bb3fd8b7906a media: venus: hfi_parser: refactor hfi packet parsing logic
    53e376178cea media: venus: hfi_parser: add check to avoid out of bound access
    3da0d7318730 media: nuvoton: Fix reference handling of ece_pdev
    4b1bdaadbf19 media: nuvoton: Fix reference handling of ece_node
    e22fa60bcd85 media: i2c: ov7251: Introduce 1 ms delay between regulators and en GPIO
    b155aecd7f0f media: i2c: ov7251: Set enable GPIO low in probe
    ad466aacb17f media: i2c: ccs: Set the device's runtime PM status correctly in probe
    983b5434a66b media: i2c: ccs: Set the device's runtime PM status correctly in remove
    3ff4feef7af3 Revert "media: imx214: Fix the error handling in imx214_probe()"
    baea1762cdf2 media: v4l2-dv-timings: prevent possible overflow in v4l2_detect_gtf()
    b933486f6b80 media: imx219: Adjust PLL settings based on the number of MIPI lanes
    dd0d323b472f media: platform: stm32: Add check for clk_enable()
    3f1f712f80db media: visl: Fix ERANGE error when setting enum controls
    f67c3f84520b media: hi556: Fix memory leak (on error) in hi556_check_hwcfg()
    df6ef66cc3ff media: streamzap: prevent processing IR data on URB failure
    afada73000be accel/ivpu: Fix PM related deadlocks in MS IOCTLs
    4c8056fbb17d tpm, tpm_tis: Fix timeout handling when waiting for TPM status
    7266066b9469 mtd: rawnand: brcmnand: fix PM resume warning
    33607e924023 spi: cadence-qspi: Fix probe on AM62A LP SK
    c32278961340 KVM: arm64: Tear down vGIC on failed vCPU creation
    20c105f58769 arm64: errata: Add KRYO 2XX/3XX/4XX silver cores to Spectre BHB safe list
    3b0f2526c87e arm64: errata: Assume that unknown CPUs _are_ vulnerable to Spectre BHB
    4af285843525 arm64: errata: Add QCOM_KRYO_4XX_GOLD to the spectre_bhb_k24_list
    2ff58c5b260f arm64: cputype: Add MIDR_CORTEX_A76AE
    7e619d4d2715 xenfs/xensyms: respect hypervisor's "next" indication
    88962f197876 media: rockchip: rga: fix rga offset lookup
    ceb23f66ef8f media: siano: Fix error handling in smsdvb_module_init()
    7631d176086c media: vim2m: print device name after registering device
    679424f8b314 media: venus: hfi: add check to handle incorrect queue size
    530f623f56a6 media: venus: hfi: add a check to handle OOB in sfr region
    72629a582db7 media: intel/ipu6: set the dev_parent of video device to pdev
    f598940803cd media: mgb4: Fix switched CMT frequency range "magic values" sets
    66e35600f726 media: i2c: adv748x: Fix test pattern selection mask
    1c673fa8889e media: mgb4: Fix CMT registers update logic
    ced0ddecc04b media: uapi: rkisp1-config: Fix typo in extensible params example
    8c64a2cfdbb8 media: mtk-vcodec: venc: avoid -Wenum-compare-conditional warning
    9f009fa823c5 media: mediatek: vcodec: Fix a resource leak related to the scp device in FW initialization
    956c5e4965d5 dt-bindings: media: st,stmipid02: correct lane-polarities maxItems
    a9a73da6e014 auxdisplay: hd44780: Fix an API misuse in hd44780.c
    bdbc38bd12eb HID: pidff: Fix set_device_control()
    1565ead12f5c HID: pidff: Fix 90 degrees direction name North -> East
    5318556ed31f HID: pidff: Compute INFINITE value instead of using hardcoded 0xffff
    b15301f28960 HID: pidff: Clamp effect playback LOOP_COUNT value
    42ec3b5bf7e6 HID: pidff: Rename two functions to align them with naming convention
    b782892cd264 HID: pidff: Remove redundant call to pidff_find_special_keys
    239c8ac58cfc HID: pidff: Support device error response from PID_BLOCK_LOAD
    2d698115f9b3 HID: pidff: Comment and code style update
    35ebc643aff9 HID: hid-universal-pidff: Add Asetek wheelbases support
    211861869766 HID: pidff: Make sure to fetch pool before checking SIMULTANEOUS_MAX
    13d15dd6175e HID: pidff: Factor out pool report fetch and remove excess declaration
    6fbf2ac6d5b6 HID: pidff: Use macros instead of hardcoded min/max values for shorts
    87783d301e98 HID: pidff: Simplify pidff_rescale_signed
    61e4de1728ac HID: pidff: Move all hid-pidff definitions to a dedicated header
    8f0b2d791e0f HID: pidff: Factor out code for setting gain
    5243ca2a5c67 HID: pidff: Rescale time values to match field units
    7009a060ffef HID: pidff: Define values used in pidff_find_special_fields
    9cdd95f9a4f3 HID: pidff: Simplify pidff_upload_effect function
    433c4234ff73 HID: pidff: Completely rework and fix pidff_reset function
    2b1e13ed295a HID: pidff: Stop all effects before enabling actuators
    629405d18543 HID: pidff: Clamp PERIODIC effect period to device's logical range
    43e5e2879dee s390/pci: Fix s390_mmio_read/write syscall page fault handling
    dd3edffae868 ext4: don't treat fhandle lookup of ea_inode as FS corruption
    806908d5d978 bpf: support SKF_NET_OFF and SKF_LL_OFF on skb frags
    7b9bdd705911 erofs: set error to bio if file-backed IO fails
    61f590c6771b pwm: fsl-ftm: Handle clk_get_rate() returning 0
    a2786a82de0c pwm: rcar: Improve register calculation
    4cb15042b5f3 pwm: mediatek: Prevent divide-by-zero in pwm_mediatek_config()
    2bef78f9622d tpm: End any active auth session before shutdown
    01c2ed3f7dce tpm, tpm_tis: Workaround failed command reception on Infineon devices
    a4e3c80cecbe ktest: Fix Test Failures Due to Missing LOG_FILE Directories
    9a6be23eb0ff tracing: probe-events: Add comments about entry data storing code
    52eafaa56f8f fbdev: omapfb: Add 'plane' value check
    fb4c507bf24a drm/amdgpu: grab an additional reference on the gang fence v2
    5c3cfcf0b4bf PCI: vmd: Make vmd_dev::cfg_lock a raw_spinlock_t type
    73d2b9625031 PCI: Check BAR index for validity
    e64be12f8401 drm/amdgpu: Fix the race condition for draining retry fault
    8feefd106afb PCI: Enable Configuration RRS SV early
    dc4380f34613 drm/amdgpu: handle amdgpu_cgs_create_device() errors in amd_powerplay_create()
    7a872981c69d PCI: Add Rockchip Vendor ID
    6e415cb823b1 drm/mediatek: mtk_dpi: Explicitly manage TVD clock in power on/off
    39a7576d113c drm/mediatek: mtk_dpi: Move the input_2p_en bit to platform data
    831c4017f4ab drm/xe/xelp: Move Wa_16011163337 from tunings to workarounds
    1a322b330dc0 drm/amdkfd: debugfs hang_hws skip GPU with MES
    10ce36501f1e drm/amdkfd: Fix pqm_destroy_queue race with GPU reset
    ffd37d7d44d7 drm/amdkfd: Fix mode1 reset crash issue
    96757c085bd9 drm/amdkfd: clamp queue size to minimum
    1c38108a49aa drivers: base: devres: Allow to release group on device release
    c9323cbc94d5 drm/amd/display: stop DML2 from removing pipes based on planes
    b22cb42a5ee1 drm/bridge: panel: forbid initializing a panel with unknown connector type
    f04612890c56 drm/debugfs: fix printk format for bridge index
    ba5a998f84cd drm: panel-orientation-quirks: Add quirk for OneXPlayer Mini (Intel)
    a64e0974266e drm: panel-orientation-quirks: Add new quirk for GPD Win 2
    5dd6fdb88953 drm: panel-orientation-quirks: Add quirk for AYA NEO Slide
    6fe4ed94ee82 drm: panel-orientation-quirks: Add quirks for AYA NEO Flip DS and KB
    df33b535f0de drm: panel-orientation-quirks: Add support for AYANEO 2S
    357ba4ed6980 drm/amdgpu: Unlocked unmap only clear page table leaves
    c15a9c84494c drm/amd/display: Update Cursor request mode to the beginning prefetch always
    2eec2fa8666d drm/xe/vf: Don't try to trigger a full GT reset if VF
    4a5f14246bc4 drm/xe/bmg: Add new PCI IDs
    044c1b352841 drm: allow encoder mode_set even when connectors change for crtc
    09246dfb5c87 Bluetooth: Add quirk for broken READ_PAGE_SCAN_TYPE
    035e1bffc063 Bluetooth: Add quirk for broken READ_VOICE_SETTING
    feed98579d40 Bluetooth: qca: simplify WCN399x NVM loading
    fe6f1f349d6e Bluetooth: hci_qca: use the power sequencer for wcn6750
    a4d49212e316 Bluetooth: btusb: Add 2 HWIDs for MT7922
    6b7a32fa9bac Bluetooth: hci_uart: fix race during initialization
    082ae971a1db Bluetooth: btintel_pcie: Add device id of Whale Peak
    40c70ff44b70 tracing: fix return value in __ftrace_event_enable_disable for TRACE_REG_UNREGISTER
    299d7d27af6b net: vlan: don't propagate flags on open
    fe51630ba2ba wifi: mt76: mt76x2u: add TP-Link TL-WDN6200 ID to device table
    bf089c4d1141 btrfs: harden block_group::bg_list against list_del() races
    0519ba030c3e ahci: Marvell 88SE9215 controllers prefer DMA for ATAPI
    7fe3b4deed8b scsi: st: Fix array overflow in st_setup()
    a8a8076210c2 cdc_ether|r8152: ThinkPad Hybrid USB-C/A Dock quirk
    eb59cc31b6ea ext4: ignore xattrs past end
    aa39d45071ec Revert "f2fs: rebuild nat_bits during umount"
    5f815757e6de ext4: protect ext4_release_dquot against freezing
    202ba2f483cd ahci: add PCI ID for Marvell 88SE9215 SATA Controller
    163e8c1083b4 net: sfp: add quirk for FS SFP-10GM-T copper SFP+ module
    ecc461331604 f2fs: fix to avoid out-of-bounds access in f2fs_truncate_inode_blocks()
    3abe15e75648 wifi: ath12k: Fix invalid data access in ath12k_dp_rx_h_undecap_nwifi
    1833e1650059 net: sfp: add quirk for 2.5G OEM BX SFP
    04c0c555049f ata: libata-eh: Do not use ATAPI DMA for a device limited to PIO mode
    ccd97c8a4f90 jfs: add sanity check for agwidth in dbMount
    aeb926e605f9 jfs: Prevent copying of nlink with value 0 from disk inode
    c802a6a4009f fs/jfs: Prevent integer overflow in AG size calculation
    319877db0aa9 fs/jfs: cast inactags to s64 to prevent potential overflow
    63148ce4904f jfs: Fix uninit-value access of imap allocated in the diMount() function
    8e7bb6636082 can: flexcan: add NXP S32G2/S32G3 SoC support
    fba5f41f1536 can: flexcan: Add quirk to handle separate interrupt lines for mailboxes
    7204335d1991 page_pool: avoid infinite loop to schedule delayed worker
    de94d0ca9ea5 net: usb: asix_devices: add FiberGecko DeviceID
    93a562eedcd5 scsi: target: spc: Fix RSOC parameter data header size
    4ae2c7c7d369 wifi: mac80211: ensure sdata->work is canceled before initialized.
    cca16fbd17b0 wifi: mac80211: add strict mode disabling workarounds
    c6e50cb8bf57 f2fs: don't retry IO for corrupted data scenario
    a6bf0fd322ab net: page_pool: don't cast mp param to devmem
    65ba18c84dbd scsi: mpi3mr: Synchronous access b/w reset and tm thread for reply queue
    6a35449df867 scsi: mpi3mr: Avoid reply queue full condition
    b1e0b4f494c5 ata: libata-core: Add 'external' to the libata.force kernel parameter
    535b666118f6 wifi: ath12k: Fix invalid entry fetch in ath12k_dp_mon_srng_process
    3cb47b50926a wifi: ath12k: fix memory leak in ath12k_pci_remove()
    a3981850f14e wifi: ath11k: fix memory leak in ath11k_xxx_remove()
    b92c5179db4b wifi: ath11k: Fix DMA buffer allocation to resolve SWIOTLB issues
    90a5892d8531 platform/x86: x86-android-tablets: Add select POWER_SUPPLY to Kconfig
    7f04c9e8fffe ASoC: amd: yc: update quirk data for new Lenovo model
    3a03a7f0f872 ASoC: amd: Add DMI quirk for ACP6X mic support
    cb1c6cb11056 ALSA: usb-audio: Fix CME quirk for UF series keyboards
    fe74885e3609 mmc: dw_mmc: add a quirk for accessing 64-bit FIFOs in two halves
    6d32a30fa1b5 media: s5p-mfc: Corrected NV12M/NV21M plane-sizes
    3c057a49045f media: uvcvideo: Add quirk for Actions UVC05
    d4fcd06e1231 ASoC: fsl_audmix: register card device depends on 'dais' property
    d981c3d2980a ALSA: hda: intel: Add Lenovo IdeaPad Z570 to probe denylist
    97ae1d5080f7 ALSA: hda: intel: Fix Optimus when GPU has no sound
    25490b45d17c ASoC: amd: ps: use macro for ACP6.3 pci revision id
    f8f4d77710e1 HID: pidff: Fix null pointer dereference in pidff_find_fields
    0301b85fe6f9 HID: pidff: Add PERIODIC_SINE_ONLY quirk
    f45f26a6b3e7 HID: Add hid-universal-pidff driver and supported device ids
    116d4f67aeb5 HID: pidff: Add FIX_WHEEL_DIRECTION quirk
    ed806fd80eba HID: pidff: Add hid_pidff_init_with_quirks and export as GPL symbol
    6a20fae104ef HID: pidff: Add PERMISSIVE_CONTROL quirk
    fd608e2a06c2 HID: pidff: Add MISSING_PBO quirk and its detection
    fab3dbb604be HID: pidff: Add MISSING_DELAY quirk and its detection
    d21ccf544ca1 HID: pidff: Do not send effect envelope if it's empty
    1c0785f16472 HID: pidff: Convert infinite length from Linux API to PID standard
    5330ce1ee2be ASoC: SOF: topology: Use krealloc_array() to replace krealloc()
    377b041c22ac platform/chrome: cros_ec_lpc: Match on Framework ACPI device
    97f68e7287e0 zstd: Increase DYNAMIC_BMI2 GCC version cutoff from 4.8 to 11.0 to work around compiler segfault
    8d0f280e7aec xen/mcelog: Add __nonstring annotations for unterminated strings
    cb58e909203e arm64: cputype: Add QCOM_CPU_PART_KRYO_3XX_GOLD
    ead1fc9f93e2 Flush console log from kernel_power_off()
    11ae4fec1f4b PM: hibernate: Avoid deadlock in hibernate_compressor_param_set()
    89a4db7a67e7 perf/dwc_pcie: fix some unreleased resources
    1b3ebfb15dc0 perf: arm_pmu: Don't disable counter in armpmu_add()
    f48625eeeb29 x86/cpu: Don't clear X86_FEATURE_LAHF_LM flag in init_amd_k8() on AMD when running in a virtual machine
    48e705652db9 x86/ia32: Leave NULL selector values 0~3 unchanged
    640bb2252158 x86/percpu: Disable named address spaces for UBSAN_BOOL with KASAN for GCC < 14.2
    837f5cb7be9a x86/mm: Clear _PAGE_DIRTY for kernel mappings when we clear _PAGE_RW
    f8d28fa305b7 pm: cpupower: bench: Prevent NULL dereference on malloc failure
    67e85cfa951c umount: Allow superblock owners to force umount
    52535688c27f fs: consistently deref the files table with rcu_dereference_raw()
    fa1827fa968c perf: Fix hang while freeing sigtrap event
    7ef5aa081f98 perf/core: Simplify the perf_event_alloc() error path
    c61feda37350 perf/core: Add aux_pause, aux_resume, aux_start_paused
    a0842539e8ef iommu/mediatek: Fix NULL pointer deference in mtk_iommu_device_group
    5efd53900acc iommu/exynos: Fix suspend/resume with IDENTITY domain
    7640c2abb647 nft_set_pipapo: fix incorrect avx2 match of 5th field octet
    b4c836d33ca8 net: ppp: Add bound checking for skb data on ppp_sync_txmung
    cc16f7402a91 ipv6: Align behavior across nexthops during path selection
    a6ed6f8ec81b net: phy: allow MDIO bus PM ops to start/stop state machine for phylink-controlled PHY
    6d98cd63426e net: phy: move phy_link_change() prior to mdio_bus_phy_may_suspend()
    aa5a1e4b8829 smb: client: fix UAF in decryption with multichannel
    f86293adce0c net_sched: sch_sfq: move the limit validation
    70449ca40609 net_sched: sch_sfq: use a temporary work area for validating configuration
    ec12da4bcc44 nvmet-fcloop: swap list_add_tail arguments
    c5a906806162 drm/i915/huc: Fix fence not released on early probe errors
    0ae84adbc9cc ata: sata_sx4: Add error handling in pdc20621_i2c_read()
    ad81d666e114 net: libwx: handle page_pool_dev_alloc_pages error
    c81306c9d6d9 drm/tests: probe-helper: Fix drm_display_mode memory leak
    80f4dc6e1f5b drm/tests: modes: Fix drm_display_mode memory leak
    c7a0a32e6cf7 drm/tests: cmdline: Fix drm_display_mode memory leak
    f951d643bc26 drm/tests: helpers: Create kunit helper to destroy a drm_display_mode
    71dd750a0834 drm/tests: modeset: Fix drm_display_mode memory leak
    a065b9960526 net: ethtool: Don't call .cleanup_data when prepare_data fails
    b2f3c3d57a83 tc: Ensure we have enough buffer space when sending filter netlink notifications
    f0bb06b9f1d0 octeontx2-pf: qos: fix VF root node parent queue index
    9fcbca0f8015 net: tls: explicitly disallow disconnect
    4d55144b12e7 codel: remove sch->q.qlen check before qdisc_tree_reduce_backlog()
    7c5957f7905b tipc: fix memory leak in tipc_link_xmit
    1b7685256db2 objtool: Fix INSN_CONTEXT_SWITCH handling in validate_unret()
    ee2b0301d6bf ata: pata_pxa: Fix potential NULL pointer dereference in pxa_ata_probe()
    9e0bdc15579e drm/xe/hw_engine: define sysfs_ops on all directories
    857e9432dab9 x86/acpi: Don't limit CPUs to 1 for Xen PV guests due to disabled ACPI
    9ddc7edc558a drm/i915: Disable RPG during live selftest
    caa5c8a23586 ublk: fix handling recovery & reissue in ublk_abort_queue()
    cb8372e54fdb ublk: refactor recovery configuration flag helpers
    206d0df7b6a5 selftests/futex: futex_waitv wouldblock test should fail
    179ef2f8109e gpiolib: of: Fix the choice for Ingenic NAND quirk
    cdb6e724e7c5 cgroup/cpuset: Fix race between newly created partition and dying one
    1b06f00edaaa cgroup/cpuset: Further optimize code if CONFIG_CPUSETS_V1 not set
    6b145f8b2201 cgroup/cpuset: Enforce at most one rebuild_sched_domains_locked() call per operation
    2dbd1b166034 cgroup/cpuset: Revert "Allow suppression of sched domain rebuild in update_cpumasks_hier()"
    9701dcbf5fce cgroup/cpuset: Fix error handling in remote_partition_disable()
    40bc55e4fcbd cgroup/cpuset: Fix incorrect isolated_cpus update in update_parent_effective_cpumask()
    b980b832318c ASoC: Intel: adl: add 2xrt1316 audio configuration
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
index 44346445c4..368f1fdb63 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8569a61bf30561b620c3171431906cd8ddb7d095"
-SRCREV_meta ?= "d36334a8b9597faf3978548085097c3b54d462d1"
+SRCREV_machine ?= "f92bb3e911b4a396d4efde18f5422a8e2cba32ea"
+SRCREV_meta ?= "47b69a68c57e1c58e83732fe46849190d2a00cbf"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.23"
+LINUX_VERSION ?= "6.12.24"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index d9c62737a4..3af5769d42 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.23"
+LINUX_VERSION ?= "6.12.24"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c2c450e032c7bf2653e50fc0a87329ce5660b6be"
-SRCREV_meta ?= "d36334a8b9597faf3978548085097c3b54d462d1"
+SRCREV_machine ?= "df727a0a44b11f5e8715dc15c57eac92f1a75193"
+SRCREV_meta ?= "47b69a68c57e1c58e83732fe46849190d2a00cbf"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index e45a8a61d4..5ff2e0e24d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "dfeb3f6f2658b9d6ae4d5abebc184bd498dd59e9"
-SRCREV_machine:qemuarm64 ?= "c2c450e032c7bf2653e50fc0a87329ce5660b6be"
-SRCREV_machine:qemuloongarch64 ?= "c2c450e032c7bf2653e50fc0a87329ce5660b6be"
-SRCREV_machine:qemumips ?= "8c15ba1838fe0cb24f1ced0b24dedad562dbfd7a"
-SRCREV_machine:qemuppc ?= "c2c450e032c7bf2653e50fc0a87329ce5660b6be"
-SRCREV_machine:qemuriscv64 ?= "c2c450e032c7bf2653e50fc0a87329ce5660b6be"
-SRCREV_machine:qemuriscv32 ?= "c2c450e032c7bf2653e50fc0a87329ce5660b6be"
-SRCREV_machine:qemux86 ?= "c2c450e032c7bf2653e50fc0a87329ce5660b6be"
-SRCREV_machine:qemux86-64 ?= "c2c450e032c7bf2653e50fc0a87329ce5660b6be"
-SRCREV_machine:qemumips64 ?= "8a34918e22d2fc3b37282d1929e760747762b74e"
-SRCREV_machine ?= "c2c450e032c7bf2653e50fc0a87329ce5660b6be"
-SRCREV_meta ?= "d36334a8b9597faf3978548085097c3b54d462d1"
+SRCREV_machine:qemuarm ?= "f31649d9e24280f86c7314f988ab817d62e3557f"
+SRCREV_machine:qemuarm64 ?= "df727a0a44b11f5e8715dc15c57eac92f1a75193"
+SRCREV_machine:qemuloongarch64 ?= "df727a0a44b11f5e8715dc15c57eac92f1a75193"
+SRCREV_machine:qemumips ?= "12b5d8353b4882e94de4571b43766f46871c03ec"
+SRCREV_machine:qemuppc ?= "df727a0a44b11f5e8715dc15c57eac92f1a75193"
+SRCREV_machine:qemuriscv64 ?= "df727a0a44b11f5e8715dc15c57eac92f1a75193"
+SRCREV_machine:qemuriscv32 ?= "df727a0a44b11f5e8715dc15c57eac92f1a75193"
+SRCREV_machine:qemux86 ?= "df727a0a44b11f5e8715dc15c57eac92f1a75193"
+SRCREV_machine:qemux86-64 ?= "df727a0a44b11f5e8715dc15c57eac92f1a75193"
+SRCREV_machine:qemumips64 ?= "eca58a19ed046caa5707d546a9f733ca1a96e722"
+SRCREV_machine ?= "df727a0a44b11f5e8715dc15c57eac92f1a75193"
+SRCREV_meta ?= "47b69a68c57e1c58e83732fe46849190d2a00cbf"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "83b4161a63b87ce40d9f24f09b5b006f63d95b7c"
+SRCREV_machine:class-devupstream ?= "ef4999852d307d38cfdecd91ed6892cc03beb9b8"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.23"
+LINUX_VERSION ?= "6.12.24"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


