Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EAC6E77188
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 14:08:26 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.31252.1735913302442308271
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jan 2025 06:08:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dE5r/YVb;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7b6e5ee6ac7so963926985a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 06:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735913301; x=1736518101; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MEPvcl9Wbm4t5Kx532X6ABxZjFyyM5s+sy9PLjGTdaY=;
        b=dE5r/YVb3Aq3PyBbumrMlXsKbGbFurng6cIXo1qPB0EScBhhCQUekQ/LkhRhRwO584
         HFTkpCz4bRCssj0yl9BJaSX2ocI+GhfFT1VYBdSTFjseTRiJdidbTx7xLMAVveuhZwAN
         HNSoyxC2CoMtXUzp3+zrqrI0Ho/5vBu/oDn8wsJNrbZEXgCmh/f0ngyQzSWzAY3phVJg
         FA0uSGO1+kd+Yqswzcu5cEeI7lHcGW0DCYk+FFCit3bWe4IDMeyZla/719X3A2DvNxMF
         rXh+WEw6j46vvNiSftVY/6GaaFqRirBL/bigk+UO26hCwLEs44T2+9WHqBjxZD45132V
         0i1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735913301; x=1736518101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MEPvcl9Wbm4t5Kx532X6ABxZjFyyM5s+sy9PLjGTdaY=;
        b=vOMomD8edqYt1HC7ZhFo8NJw239Dh3b+X7XRvRv37HqpzJs8aa2YBu28+Y6L8qZqgs
         avLooe8+Bcl5asA5B7rPVZDFpshGTA/6uOczdKmKFJGcoMxEhGklT+Rl09E85Xfk8sRk
         P0rx9hsHzQs0Bg9LPXcQDvDu1dHffAIn3QMVxbsx6dSV76ogx4T5kJCuv9lQwPBPPBcp
         O5NFO2dU0LM9Ugja+WIc1Xsj+I+j/S7dylM94xJit7p3ttU7pgIu8Yg+y2cXnxDSYLZo
         iWPHpkAE3tC7Atlzl40j333hogVwyNe6SWg9sfxNdQS0PkmAUj8ziLdN2KfyTXev/3R/
         B0qA==
X-Gm-Message-State: AOJu0YxPnaiV1Jxa+HsT8Nt9qVt7lfq0TWWJu89zPChX7qBBMqDF+e7q
	BlDmB/1mJ74cmNQGCG7CDtFAB++k3tF/OhOHr4Ks1TqyxanqfEFcmRgIX/AFuwE=
X-Gm-Gg: ASbGncuS9951Pv2XUHjKbnS0JsFNbmfoxwSH8CQkI86DuVG5f/kJaHHDcaaTF9xbkFm
	lmVdv5KuaPeVoFfxDPaeQeSjZyx9C90CYDanKn0MdhTzPwmn9K7e7ZIr+WfuPdJeGdjVDi3TIyh
	nRz+DBzh0ws3o3bWPXko2+EaWt9WO92FkcEJy/oQDb8we4XpSyQ4RwjR6aLoX1cWHjOyo5XE6+G
	xr/LRw++D6b3NOu2ORGz1RVfQLHiHvRuCD61eB669HTMJGFFZk0uSdRVMZsjlFkvDw94rDB9Q3n
	PkTpkCTLIhG6XuT5S77zyv2akZ1aXVQqY4KHXvRCqPr2wZyOeq1qyZObdw==
X-Google-Smtp-Source: AGHT+IFbBc7x81LKNb/1+5Cwdru+5Ya1sU6uTexH3QejdnkjQAYXqpY0Fo6dw8FPgu9i+TB3c7cLKA==
X-Received: by 2002:a05:6214:238c:b0:6d8:8390:15db with SMTP id 6a1803df08f44-6dd2331f24emr773565236d6.6.1735913300711;
        Fri, 03 Jan 2025 06:08:20 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ddbe688b33sm18748286d6.84.2025.01.03.06.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 06:08:19 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] linux-yocto/6.12: update to v6.12.8
Date: Fri,  3 Jan 2025 09:08:11 -0500
Message-Id: <0e2c7abbcd6ddcc8f29e6d6862d718e2e92fad53.1735913191.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1735913191.git.bruce.ashfield@gmail.com>
References: <cover.1735913191.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 14:08:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209353

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    77f85ccd3618 Linux 6.12.8
    f3e6eaf033f4 ALSA: sh: Fix wrong argument order for copy_from_iter()
    f59b81fe8df9 ALSA: ump: Shut up truncated string warning
    f5c5661f02b5 Bluetooth: btusb: mediatek: change the conditions for ISO interface
    cc569d791ab2 Bluetooth: btusb: mediatek: add intf release flow when usb disconnect
    9da1cfc4f111 Bluetooth: btusb: mediatek: add callback function in btusb_disconnect
    b967b37cefdf Bluetooth: btusb: mediatek: move Bluetooth power off command position
    d508e5627038 btrfs: check folio mapping after unlock in relocate_one_folio()
    dd8bbfe72377 btrfs: check folio mapping after unlock in put_file_data()
    c3a403d8ce36 btrfs: fix use-after-free when COWing tree bock and tracing is enabled
    dbebb0cc5139 btrfs: sysfs: fix direct super block member reads
    b87c9b9ba05b btrfs: fix transaction atomicity bug when enabling simple quotas
    8faba508242b btrfs: fix swap file activation failure due to extents that used to be shared
    9f372e86b9bd btrfs: avoid monopolizing a core when activating a swap file
    f6174bb982a8 btrfs: fix race with memory mapped writes when activating swap file
    f6279a98db13 power: supply: gpio-charger: Fix set charge current limits
    c110095013ad power: supply: cros_charge-control: hide start threshold on v2 cmd
    5792ae1cb1b0 power: supply: cros_charge-control: allow start_threshold == end_threshold
    77e6c8adf8d6 power: supply: cros_charge-control: add mutex for driver data
    7182f93bb358 perf/x86/intel/ds: Add PEBS format 6
    2a9cbd6c9049 i2c: microchip-core: fix "ghost" detections
    bcfb9d856bd6 i2c: imx: add imx7d compatible string for applying erratum ERR007805
    5e44779d12bd perf/x86/intel: Fix bitmask of OCR and FRONTEND events for LNC
    aed157301c65 PCI/MSI: Handle lack of irqdomain gracefully
    1429ae7b7d47 virt: tdx-guest: Just leak decrypted memory on unrecoverable errors
    b939f108e86b x86/fred: Clear WFE in missing-ENDBRANCH #CPs
    a0d637675f2b i2c: microchip-core: actually use repeated sends
    8e8494c83cf7 io_uring/sqpoll: fix sqpoll error handling races
    4c0f79cbc42d rtla/timerlat: Fix histogram ALL for zero samples
    1cca920af19d tracing: Prevent bad count for tracing_cpumask_write
    a744146969a0 tracing: Constify string literal data member in struct trace_event_call
    8659da87d216 perf/x86/intel/uncore: Add Clearwater Forest support
    908dd70d5446 dmaengine: loongson2-apb: Change GENMASK to GENMASK_ULL
    79a47fd0f176 freezer, sched: Report frozen tasks as 'D' instead of 'R'
    2cae02a84b98 objtool: Add bch2_trans_unlocked_error() to bcachefs noreturns
    1d397722cf3e drm/xe: Move the coredump registration to the worker thread
    5db43dfda1f2 drm/xe: Take PM ref in delayed snapshot capture worker
    7d680f2f76a3 ublk: detach gendisk from ublk device if add_disk() fails
    ccdc8fd86fc7 wifi: iwlwifi: be less noisy if the NIC is dead in S3
    16b54ee81d8a blk-mq: register cpuhp callback after hctx is added to xarray table
    92d5139b9114 virtio-blk: don't keep queue frozen during system suspend
    ce55818b2d3a drm/dp_mst: Ensure mst_primary pointer is valid in drm_dp_mst_handle_up_req()
    0aca51715e68 spi: omap2-mcspi: Fix the IS_ERR() bug for devm_clk_get_optional_enabled()
    d00e75e4fecf ACPI/IORT: Add PMCG platform information for HiSilicon HIP09A
    1aea06f703de scsi: storvsc: Do not flag MAINTENANCE_IN return of SRB_STATUS_DATA_OVERRUN as an error
    05d44e2571d4 scsi: mpi3mr: Handling of fault code for insufficient power
    0dd139341f04 scsi: mpi3mr: Start controller indexing from 0
    869fdc6f0606 scsi: mpi3mr: Fix corrupt config pages PHY state is switched in sysfs
    b8ed09e397f8 scsi: mpi3mr: Synchronize access to ioctl data buffer
    4524a8d175f0 scsi: mpt3sas: Diag-Reset when Doorbell-In-Use bit is set during driver load time
    b34f7381cd10 spi: intel: Add Panther Lake SPI controller support
    fdaaf929432f bpf: Zero index arg error string for dynptr and iter
    a089dad6f92d platform/x86: asus-nb-wmi: Ignore unknown event 0xCF
    2d95df70e594 LoongArch: BPF: Adjust the parameter of emit_jirl()
    45d7745c89c1 LoongArch: Fix reserving screen info memory for above-4G firmware
    ca5995f805bb regmap: Use correct format specifier for logging range errors
    98575bd6e7b1 smb: server: Fix building with GCC 15
    532a29e8fa28 ALSA: sh: Use standard helper for buffer accesses
    4287eb3951ca ALSA: hda/conexant: fix Z60MR100 startup pop issue
    f0a3b2d9692d ALSA: ump: Update legacy substream names upon FB info update
    9dc4b8a8a415 ALSA: ump: Indicate the inactive group in legacy substream names
    fc98df1d7a9e ALSA: ump: Don't open legacy substream for an inactive group
    0a65d850c45d udf: Verify inode link counts before performing rename
    4d9b403474f0 udf: Skip parent dir link count update if corrupted
    466ca39dbf5d scsi: megaraid_sas: Fix for a potential deadlock
    65289f50c18d scsi: qla1280: Fix hw revision numbering for ISP1020/1040
    56216257d429 watchdog: mediatek: Add support for MT6735 TOPRGU/WDT
    a42417a8cffc Revert "watchdog: s3c2410_wdt: use exynos_get_pmu_regmap_by_phandle() for PMU regs"
    486fc631cc49 watchdog: rzg2l_wdt: Power on the watchdog domain in the restart handler
    b94011427ee3 watchdog: it87_wdt: add PWRGD enable quirk for Qotom QCML04
    68662d78afbc tracing/kprobe: Make trace_kprobe's module callback called after jump_label update
    a39ff5bf2357 stddef: make __struct_group() UAPI C++-friendly
    155829fd1e1d power: supply: bq24190: Fix BQ24296 Vbus regulator support
    6d9cd2710545 powerpc/pseries/vas: Add close() callback in vas_vm_ops struct
    16258a1d9303 ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 21Q6 and 21Q7
    3b0f5d3e5ebd ASoC: dt-bindings: realtek,rt5645: Fix CPVDD voltage comment
    f4d68bdfaef6 ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 21QA and 21QB
    7a51e3a5a1b8 ASoC: amd: ps: Fix for enabling DMIC on acp63 platform via _DSD entry
    d2f090ea57f8 mtd: rawnand: fix double free in atmel_pmecc_create_user()
    ba465de3022a platform/chrome: cros_ec_lpc: fix product identity for early Framework Laptops
    909ecf15cb70 ASoC: SOF: Intel: hda-dai: Do not release the link DMA on STOP
    54376d8d2659 dmaengine: at_xdmac: avoid null_prt_deref in at_xdmac_prep_dma_memset
    ed31336f8117 dmaengine: apple-admac: Avoid accessing registers in probe
    f5d231592430 dmaengine: fsl-edma: implement the cleanup path of fsl_edma3_attach_pd()
    4ecd6f505e4f dmaengine: amd: qdma: Remove using the private get and set dma_ops APIs
    d8c3d13f5519 dmaengine: tegra: Return correct DMA status when paused
    5dd888449338 dmaengine: dw: Select only supported masters for ACPI devices
    27dd33034561 dmaengine: mv_xor: fix child node refcount handling in early exit
    c180c3f42d34 ALSA: memalloc: prefer dma_mapping_error() over explicit address checking
    5cdf336412a9 phy: rockchip: naneng-combphy: fix phy reset
    7061849a4a17 phy: rockchip: samsung-hdptx: Set drvdata before enabling runtime PM
    e4e6217cf7a6 phy: usb: Toggle the PHY power during init
    7e7c8ffc017d phy: core: Fix that API devm_phy_destroy() fails to destroy the phy
    f797151e8479 phy: core: Fix that API devm_of_phy_provider_unregister() fails to unregister the phy provider
    09f17bfb3653 phy: core: Fix that API devm_phy_put() fails to release the phy
    479b6c2a5ff2 phy: core: Fix an OF node refcount leakage in of_phy_provider_lookup()
    a817e938a0c6 phy: core: Fix an OF node refcount leakage in _of_phy_get()
    d84bd63d4391 phy: qcom-qmp: Fix register name in RX Lane config of SC8280XP
    464b493ac4d8 mtd: rawnand: arasan: Fix missing de-registration of NAND
    acb13fcf7590 mtd: rawnand: arasan: Fix double assertion of chip-select
    ee33d36f4174 mtd: diskonchip: Cast an operand to prevent potential overflow
    b186b36a7c21 nfsd: restore callback functionality for NFSv4.0
    7b005cff0de4 nfsd: Revert "nfsd: release svc_expkey/svc_export with rcu_work"
    997cf2d8c206 bpf: Check negative offsets in __bpf_skb_min_len()
    4aa5dcb3891f tcp_bpf: Add sk_rmem_alloc related logic for tcp_bpf ingress redirection
    35727f450603 tcp_bpf: Charge receive socket buffer in bpf_tcp_ingress()
    987cf3869d77 smb: fix bytes written value in /proc/fs/cifs/Stats
    825aaa75f785 smb: client: Deduplicate "select NETFS_SUPPORT" in Kconfig
    f7ef892250f8 selftests/bpf: Fix compilation error in get_uprobe_offset()
    2175b66c7fc0 mm/vmstat: fix a W=1 clang compiler warning
    8cdfb0656965 fork: avoid inappropriate uprobe access to invalid mm
    f4ab7d74247b bpf: Fix bpf_get_smp_processor_id() on !CONFIG_SMP
    f0f2e5aa56e9 arm64: dts: broadcom: Fix L2 linesize for Raspberry Pi 5
    122a2f3550a8 ceph: allocate sparse_ext map only for sparse reads
    c1197c1457bb media: dvb-frontends: dib3000mb: fix uninit-value in dib3000_write_reg
    319addc2ad90 Linux 6.12.7
    2d129beb8dd4 epoll: Add synchronous wakeup support for ep_poll_callback
    a086c8d7f279 mm: convert partially_mapped set/clear operations to be atomic
    a095090b7015 mm: shmem: fix ShmemHugePages at swapout
    cb12d61361ce mm: use aligned address in copy_user_gigantic_page()
    b79b6fe0737f mm: use aligned address in clear_gigantic_page()
    eb9041837123 ceph: fix memory leak in ceph_direct_read_write()
    cbd952b2c4e6 ceph: fix memory leaks in __ceph_sync_read()
    28433d0b7b29 ceph: improve error handling and short/overflow-read logic in __ceph_sync_read()
    ddbbc04989f0 ceph: validate snapdirname option length when mounting
    99a37ab76a31 ceph: give up on paths longer than PATH_MAX
    adc4b70fb659 of: Fix refcount leakage for OF node returned by __of_get_dma_parent()
    c62318587c06 of: Fix error path in of_parse_phandle_with_args_map()
    501d68639106 of: address: Preserve the flags portion on 1:1 dma-ranges mapping
    e0d9c581ac73 of: property: fw_devlink: Do not use interrupt-parent directly
    185edda7d773 udmabuf: also check for F_SEAL_FUTURE_WRITE
    93f08e5c393f udmabuf: fix racy memfd sealing check
    ff561987ff12 nilfs2: prevent use of deleted inode
    4a650eb9482c nilfs2: fix buffer head leaks in calls to truncate_inode_pages()
    69860ca08e5c ocfs2: fix the space leak in LA when releasing LA
    e30e72844c1c of/irq: Fix using uninitialized variable @addr_len in API of_irq_parse_one()
    2976661ed4de of/irq: Fix interrupt-map cell length check in of_irq_parse_imap_parent()
    3931567bf175 KVM: SVM: Allow guest writes to set MSR_AMD64_DE_CFG bits
    16846e8e0ace NFS/pnfs: Fix a live lock between recalled layouts and layoutget
    4f95a2186b7f io_uring: check if iowq is killed before queuing
    06eb0894896b io_uring: Fix registered ring file refcount leak
    416226eb3f3a selftests/bpf: Use asm constraint "m" for LoongArch
    fcd39809bf67 selftests/memfd: run sysctl tests when PID namespace support is enabled
    d3e73fe7ca21 tracing: Check "%s" dereference via the field and not the TP_printk format
    683eccacc02d tracing: Add "%s" check in test_event_printk()
    71a613ceac1a tracing: Add missing helper functions in event pointer dereference check
    3985cd30472a tracing: Fix test_event_printk() to process entire print argument
    578874b2bb94 accel/ivpu: Fix WARN in ivpu_ipc_send_receive_internal()
    a1e597ee5920 accel/ivpu: Fix general protection fault in ivpu_bo_list()
    127e907e11cc smb: client: fix TCP timers deadlock after rmmod
    22b5c2acd65d KVM: x86: Play nice with protected guests in complete_hypercall_exit()
    bacd0498dea0 x86/hyperv: Fix hv tsc page based sched_clock for hibernation
    9015ebfe8ec5 tools: hv: Fix a complier warning in the fcopy uio daemon
    3dd7a30c6d7f Drivers: hv: util: Avoid accessing a ringbuffer not initialized yet
    52f46047031f fgraph: Still initialize idle shadow stacks when starting
    01b888b31b52 drm/amdgpu/mmhub4.1: fix IP version check
    b2f23a1c7181 drm/amdgpu/gfx12: fix IP version check
    5c923087adc7 drm/amdgpu/nbio7.0: fix IP version check
    f7d75bc2430f s390/mm: Fix DirectMap accounting
    f16eadc6fce4 btrfs: tree-checker: reject inline extent items with 0 ref count
    c85a41172efb btrfs: fix improper generation check in snapshot delete
    39f1ef13d8da btrfs: split bios to the fs sector size boundary
    9667c9146418 alloc_tag: fix set_codetag_empty() when !CONFIG_MEM_ALLOC_PROFILING_DEBUG
    ec12f30fe542 ring-buffer: Fix overflow in __rb_map_vma
    4234ca9884bc mm/page_alloc: don't call pfn_to_page() on possibly non-existent PFN in split_large_buddy()
    ad7c9f1f4322 vmalloc: fix accounting with i915
    6fb92e9a52e3 zram: fix uninitialized ZRAM not releasing backing device
    6d91e90cfc34 zram: refuse to use zero sized block device as backing device
    cbe4eef73d0e drm/amdgpu/smu14.0.2: fix IP version check
    ea72b2f21f74 drm/amdgpu/nbio7.7: fix IP version check
    d887a3b08ad9 drm/amdgpu/nbio7.11: fix IP version check
    1828714c091b trace/ring-buffer: Do not use TP_printk() formatting for boot mapped buffers
    b5792c162dcf block: avoid to reuse `hctx` not removed from cpuhp callback list
    0f289ba4e5ae hwmon: (tmp513) Fix interpretation of values of Temperature Result and Limit Registers
    62721d74829e hwmon: (tmp513) Fix Current Register value interpretation
    2a4a917cbab8 hwmon: (tmp513) Fix interpretation of values of Shunt Voltage and Limit Registers
    67291d601f2b drm/amdgpu: don't access invalid sched
    5d6f446eca40 i915/guc: Accumulate active runtime on gt reset
    4f02f0866342 i915/guc: Ensure busyness counter increases motonically
    7779088287dc i915/guc: Reset engine utilization buffer before registration
    17a915416b1f drm/panel: synaptics-r63353: Fix regulator unbalance
    e44cc317b8db drm/panel: st7701: Add prepare_prev_first flag to drm_panel
    4021a163e101 drm/panel: novatek-nt35950: fix return value check in nt35950_probe()
    747547972e64 drm/panel: himax-hx83102: Add a check to prevent NULL pointer dereference
    c8395bfcd0e3 dma-buf: Fix __dma_buf_debugfs_list_del argument for !CONFIG_DEBUG_FS
    c9fc8428d425 udmabuf: fix memory leak on last export_udmabuf() error path
    8e86e9909ad2 udmabuf: udmabuf_create pin folio codestyle cleanup
    004da42b8e57 drm/amdgpu: Handle NULL bo->tbo.resource (again) in amdgpu_vm_bo_update
    3818802ddc3d drm/amdgpu: fix amdgpu_coredump
    47c8b6cf1d08 drm/modes: Avoid divide by zero harder in drm_mode_vrefresh()
    ef1f520cf574 drm/amd: Update strapping for NBIO 2.5.0
    d9369f0c9f95 drm/display: use ERR_PTR on DP tunnel manager creation fail
    eed704d8ab67 thunderbolt: Don't display nvm_version unless upgrade supported
    9e2ff33ce003 thunderbolt: Improve redrive mode handling
    cb13e17466a0 thunderbolt: Add support for Intel Panther Lake-M/P
    7ccad1ee83c4 xhci: Turn NEC specific quirk for handling Stop Endpoint errors generic
    ced29f2149c9 USB: serial: option: add Telit FE910C04 rmnet compositions
    23e63f62c64f USB: serial: option: add MediaTek T7XX compositions
    50d84d15e338 USB: serial: option: add Netprisma LCUK54 modules for WWAN Ready
    121b84c987e2 USB: serial: option: add MeiG Smart SLM770A
    e6b2735a766a USB: serial: option: add TCL IK512 MBIM & ECM
    ebdfd6b0f297 hexagon: Disable constant extender optimization for LLVM prior to 19.1.0
    dedea26a149f efivarfs: Fix error on non-existent file
    065b3e27e45d i2c: riic: Always round-up when calculating bus period
    97701315e32e block: Revert "block: Fix potential deadlock while freezing queue and acquiring sysfs_lock"
    b2b4eddf2f18 net: mctp: handle skb cleanup on sock_queue failures
    7e1ad75dccf3 chelsio/chtls: prevent potential integer overflow on 32bit
    4f393ea1e2f9 net: tun: fix tun_napi_alloc_frags()
    b965edb0197a KVM: x86: Cache CPUID.0xD XSTATE offsets+sizes during module init
    ea78f77f7832 KVM: arm64: Do not allow ID_AA64MMFR0_EL1.ASIDbits to be overridden
    06e213205826 EDAC/amd64: Simplify ECC check on unified memory controllers
    20bf32f48288 irqchip/gic-v3: Work around insecure GIC integrations
    2f19001192cc mmc: mtk-sd: disable wakeup in .remove() and in the error path of .probe()
    b2dc310a5591 mmc: sdhci-tegra: Remove SDHCI_QUIRK_BROKEN_ADMA_ZEROLEN_DESC quirk
    aa9e573145e2 net: mdiobus: fix an OF node reference leak
    98031a6992c9 psample: adjust size if rate_as_probability is set
    57ed6505ba70 netdev-genl: avoid empty messages in queue dump
    67814ea2d1b0 net: dsa: restore dsa_software_vlan_untag() ability to operate on VLAN-untagged traffic
    cb82774ee721 selftests: openvswitch: fix tcpdump execution
    8fe8bffbb997 netfilter: ipset: Fix for recursive locking warning
    d2e6df65ecfb ipvs: Fix clamp() of ip_vs_conn_tab on small memory systems
    0f897e47e2e4 can: m_can: fix missed interrupts with m_can_pci
    3a3696ec46cf can: m_can: set init flag earlier in probe
    5c553262f063 net: netdevsim: fix nsim_pp_hold_write()
    b3b49641a99b net: ethernet: bgmac-platform: fix an OF node reference leak
    1f2eb6c32bae net: ethernet: oa_tc6: fix tx skb race condition between reference pointers
    b15b0df3967e net: ethernet: oa_tc6: fix infinite loop error when tx credits becomes 0
    9f88db1b771b net: hinic: Fix cleanup in create_rxqs/txqs()
    ed6f8d671933 team: Fix feature exposure when no ports are present
    b38e858ab0c0 netdev: fix repeated netlink messages in queue stats
    d924c8afe666 netdev: fix repeated netlink messages in queue dump
    938e7c364e29 ksmbd: fix broken transfers when exceeding max simultaneous operations
    7e2bb4108a05 ksmbd: count all requests in req_running counter
    280d1b743a3b net: renesas: rswitch: rework ts tags management
    69324efed0e2 ionic: use ee->offset when returning sprom data
    13355dd37e22 ionic: no double destroy workqueue
    ee2e931b2b46 ionic: Fix netdev notifier unregister on failure
    1c2d7999d152 tools/net/ynl: fix sub-message key lookup for nested attributes
    8e9ef6bdf71b netdevsim: prevent bad user input in nsim_dev_health_break_write()
    a8836eae3288 net: mscc: ocelot: fix incorrect IFH SRC_PORT field in ocelot_ifh_set_basic()
    df3dfe1a93c6 net/smc: check return value of sock_recvmsg when draining clc data
    48d5a8a304a6 net/smc: check smcd_v2_ext_offset when receiving proposal msg
    42f6beb2d577 net/smc: check v2_ext_offset/eid_cnt/ism_gid_cnt when receiving proposal msg
    47ce46349672 net/smc: check iparea_offset and ipv6_prefixes_cnt when receiving proposal msg
    45455e780f65 net/smc: check sndbuf_space again after NOSPACE flag is set in smc_poll
    841b1824750d net/smc: protect link down work from execute after lgr freed
    cec68375b8e1 cxl/region: Fix region creation for greater than x2 switches
    87d5a852f0bc cxl/pci: Fix potential bogus return value upon successful probing
    d72139fa2024 tools: hv: change permissions of NetworkManager configuration file
    bc1f8a86e34a xfs: fix zero byte checking in the superblock scrubber
    07f2f8083a7a xfs: fix sb_spino_align checks for large fsblock sizes
    5ca4ca38bc74 xfs: fix off-by-one error in fsmap's end_daddr usage
    5b935d8b7024 xfs: fix sparse inode limits on runt AG
    825fe7dae3b8 xfs: sb_spino_align is not verified
    30424481090d erofs: use buffered I/O for file-backed mounts by default
    f067d3f69d19 erofs: reference `struct erofs_device_info` for erofs_map_dev
    3e0d81efcb45 erofs: use `struct erofs_device_info` for the primary device
    910798ecd33d erofs: add erofs_sb_free() helper
    532d40c321fb s390/mm: Consider KMSAN modules metadata for paging levels
    baedaacee165 sched/dlserver: Fix dlserver time accounting
    bdd68033d11a sched/dlserver: Fix dlserver double enqueue
    0653fa6ee045 erofs: fix PSI memstall accounting
    97645ed2f3eb s390/ipl: Fix never less than zero warning
    9945c014cb01 i2c: pnx: Fix timeout in wait functions
    68298822cc95 p2sb: Do not scan and remove the P2SB device when it is unhidden
    5969df5eaad4 p2sb: Move P2SB hide and unhide code to p2sb_scan_and_cache()
    de96c4de9c87 p2sb: Introduce the global flag p2sb_hidden_by_bios
    e6e1555d2170 p2sb: Factor out p2sb_read_from_cache()
    ecffd162e97e sched/eevdf: More PELT vs DELAYED_DEQUEUE
    0ee98301f1f0 sched/fair: Fix sched_can_stop_tick() for fair tasks
    5dbe6816c491 sched/fair: Fix NEXT_BUDDY
    5d4380ec054e RISC-V: KVM: Fix csr_write -> csr_set for HVIEN PMU overflow bit
    891c43f4f9a8 firmware: arm_ffa: Fix the race around setting ffa_dev->properties
    e385c781a305 firmware: arm_scmi: Fix i.MX build dependency
    9d5dd7ccea1b net: stmmac: fix TSO DMA API usage causing oops
    e3e54ad9eff8 net: sched: fix ordering of qlen adjustment
    e9d65b48ce1a Linux 6.12.6
    5013bd1e23dc x86/static-call: fix 32-bit build
    f6e1c44d731a x86/xen: remove hypercall page
    42d50bb38a69 x86/xen: use new hypercall functions instead of hypercall page
    3fbfac0f3044 x86/xen: add central hypercall functions
    f7c3fdad0a47 x86/xen: don't do PV iret hypercall through hypercall page
    fa0f23a60ea5 x86/static-call: provide a way to do very early static-call updates
    c6eef3643608 objtool/x86: allow syscall instruction
    505b3523644d x86: make get_cpu_vendor() accessible from Xen code
    7728e974ffbf xen/netfront: fix crash when removing device
    1e04ca11a444 KVM: arm64: Disable MPAM visibility by default and ignore VMM writes
    5804b6a7f67c rust: kbuild: set `bindgen`'s Rust target version
    f1a494df8350 block: Fix potential deadlock while freezing queue and acquiring sysfs_lock
    c1291ea131d1 blk-mq: move cpuhp callback registering out of q->sysfs_lock
    7ccd62135403 kselftest/arm64: abi: fix SVCR detection
    eea698975153 blk-iocost: Avoid using clamp() on inuse in __propagate_weights()
    b0193a31a0ca drm/xe/reg_sr: Remove register pool
    3c73dad37c31 drm/xe: fix the ERR_PTR() returned on failure to allocate tiny pt
    0d66dd490427 net: dsa: tag_ocelot_8021q: fix broken reception
    124bedb2889b net: dsa: microchip: KSZ9896 register regmap alignment to 32 bit boundaries
    b7f75516fe11 net: renesas: rswitch: fix initial MPIC register setting
    d20ff1d3cb40 Bluetooth: btmtk: avoid UAF in btmtk_process_coredump
    cbe640d6cae5 Bluetooth: iso: Fix circular lock in iso_conn_big_sync
    c541d7b5e179 Bluetooth: iso: Fix circular lock in iso_listen_bis
    d0f4a51246e2 Bluetooth: SCO: Add support for 16 bits transparent voice setting
    827f30b1dfaf Bluetooth: iso: Fix recursive locking warning
    4ca50db1c567 Bluetooth: iso: Always release hdev at the end of iso_listen_bis
    f9ecc90b5d50 Bluetooth: hci_event: Fix using rcu_read_(un)lock while iterating
    458aa6704c00 ACPICA: events/evxfregn: don't release the ContextMutex that was never acquired
    b21a849764a4 ASoC: Intel: sof_sdw: Add space for a terminator into DAIs array
    e500152469fd team: Fix feature propagation of NETIF_F_GSO_ENCAP_ALL
    eddf3105e619 team: Fix initial vlan_feature set in __team_compute_features
    c6b9b1f67b6d bonding: Fix feature propagation of NETIF_F_GSO_ENCAP_ALL
    6069914e0f42 bonding: Fix initial {vlan,mpls}_feature set in bond_compute_features
    4b8fd0751a2a net, team, bonding: Add netdev_base_features helper
    356078a5c55e net/sched: netem: account for backlog updates from child qdisc
    62380275954e net: dsa: felix: fix stuck CPU-injected packets with short taprio windows
    9f468bfed1fb net: mana: Fix irq_contexts memory leak in mana_gd_setup_irqs
    9fda340cbfbf net: mana: Fix memory leak in mana_gd_setup_irqs
    7cf0bd232b56 netfilter: nf_tables: do not defer rule destruction via call_rcu
    45fe76573a25 netfilter: IDLETIMER: Fix for possible ABBA deadlock
    baf9d7f5a75f selftests: netfilter: Stabilize rpath.sh
    c3a2fb308678 ASoC: fsl_spdif: change IFACE_PCM to IFACE_MIXER
    1e65b0511203 ASoC: fsl_xcvr: change IFACE_PCM to IFACE_MIXER
    eef2a7d8113c libperf: evlist: Fix --cpu argument on hybrid platform
    13ba06e2601e Bluetooth: Improve setsockopt() handling of malformed user input
    e4ac72dd79e0 ASoC: tas2781: Fix calibration issue in stress test
    0e01edde2559 net: renesas: rswitch: handle stop vs interrupt race
    92007a28f954 net: renesas: rswitch: avoid use-after-put for a device tree node
    df3aa9c5600d net: renesas: rswitch: fix leaked pointer on error path
    d39c2d9577c4 net: renesas: rswitch: fix race window between tx start and complete
    f36e30822f1a net: renesas: rswitch: fix possible early skb release
    0dfcc215b4ce cifs: Fix rmdir failure due to ongoing I/O on deleted file
    3f5bf3dc6f31 Documentation: networking: Add a caveat to nexthop_compat_mode sysctl
    fe9274027697 bnxt_en: Fix aggregation ID mask to prevent oops on 5760X chips
    e7b02a0febbc block: get wp_offset by bdev_offset_from_zone_start
    0749982c51da Documentation: PM: Clarify pm_runtime_resume_and_get() return value
    f5e71ae56cb7 ASoC: amd: yc: Fix the wrong return value
    36c0764474b6 ALSA: control: Avoid WARN() for symlink errors
    586241f4160e qca_spi: Make driver probing reliable
    6df6cab9b6eb qca_spi: Fix clock speed for multiple QCA7000
    51403c89a789 cxgb4: use port number to set mac addr
    889825d9a475 ACPI: resource: Fix memory resource type union access
    53654cd4c896 net: sparx5: fix the maximum frame length register
    730ab6397a18 net: sparx5: fix FDMA performance issue
    771e7fc9f186 spi: aspeed: Fix an error handling path in aspeed_spi_[read|write]_user()
    10eb845a8719 regulator: axp20x: AXP717: set ramp_delay
    6a4c7173a645 net: mscc: ocelot: perform error cleanup in ocelot_hwstamp_set()
    266ac61e5911 net: mscc: ocelot: be resilient to loss of PTP packets during transmission
    2a80ea8b2541 net: mscc: ocelot: ocelot->ts_id_lock and ocelot_port->tx_skbs.lock are IRQ-safe
    123515f97cab net: mscc: ocelot: improve handling of TX timestamp for unknown skb
    b12cdb8f2e9c net: mscc: ocelot: fix memory leak on ocelot_port_add_txtstamp_skb()
    6610c7f8a8d4 net: defer final 'struct net' free in netns dismantle
    2b351355bbd5 net: lapb: increase LAPB_HEADER_LEN
    35fe39bc39af bnxt_en: Fix GSO type for HW GRO packets on 5750X chips
    aca99e1fa9d7 ptp: kvm: x86: Return EOPNOTSUPP instead of ENODEV from kvm_arch_ptp_init()
    04ac4bd0faf7 selftests: mlxsw: sharedbuffer: Ensure no extra packets are counted
    0e69887a8932 selftests: mlxsw: sharedbuffer: Remove duplicate test cases
    735742ef07b9 selftests: mlxsw: sharedbuffer: Remove h1 ingress test case
    c2f296183c61 wifi: cfg80211: sme: init n_channels before channels[] access
    a59c61a1869c net/mlx5: DR, prevent potential error pointer dereference
    a852c82eda49 tipc: fix NULL deref in cleanup_bearer()
    14a122007c04 batman-adv: Do not let TT changes list grows indefinitely
    b2abe3570749 batman-adv: Remove uninitialized data in full table TT response
    075704ca741a batman-adv: Do not send uninitialized TT changes
    cc9b20ddc2d2 amdgpu/uvd: get ring reference from rq scheduler
    212846fafb75 acpi: nfit: vmalloc-out-of-bounds Read in acpi_nfit_ctl
    6234eda09372 perf machine: Initialize machine->env to address a segfault
    80579c198dd2 wifi: mac80211: fix station NSS capability initialization order
    fbe94d4ab93e wifi: mac80211: fix a queue stall in certain cases of CSA
    1145c393651c wifi: mac80211: init cnt before accessing elem in ieee80211_copy_mbssid_beacon
    f850d1d9f110 wifi: nl80211: fix NL80211_ATTR_MLO_LINK_ID off-by-one
    ce1ecccd6d4e perf tools: Fix build-id event recording
    b2fc4b17fc13 bpf: Augment raw_tp arguments with PTR_MAYBE_NULL
    2bd517bafc38 bpf, sockmap: Fix update element with same
    bf2318e288f6 bpf, sockmap: Fix race between element replace and close()
    dfb15ddf3b65 bpf,perf: Fix invalid prog_array access in perf_event_detach_bpf_prog
    e6d1dec1424c bpf: Fix theoretical prog_array UAF in __uprobe_perf_func()
    2c3ca17a071a bpf: Check size for BTF-based ctx access of pointer members
    6aefe5d97ae5 xfs: unlock inodes when erroring out of xfs_trans_alloc_dir
    202f2350e6a0 xfs: only run precommits once per transaction object
    704d5733bf39 xfs: fix scrub tracepoints when inode-rooted btrees are involved
    181cb9643633 xfs: return from xfs_symlink_verify early on V4 filesystems
    3b6616ffc99b xfs: fix null bno_hint handling in xfs_rtallocate_rtg
    3e2f62d1d773 xfs: return a 64-bit block count from xfs_btree_count_blocks
    31ecfd1d4f74 xfs: don't drop errno values when we fail to ficlone the entire range
    8fb661bfcb92 xfs: update btree keys correctly when _insrec splits an inode root block
    9a741ed41242 xfs: set XFS_SICK_INO_SYMLINK_ZAPPED explicitly when zapping a symlink
    2d981e170fb2 drm/amdkfd: hard-code MALL cacheline size for gfx11, gfx12
    01bdb31fc5aa drm/amdkfd: hard-code cacheline size for gfx11
    768442d91893 drm/amdkfd: Dereference null return value
    5a6bd9350424 drm/amdgpu: fix when the cleaner shader is emitted
    bd882c3ca13e drm/amd/pm: Set SMU v13.0.7 default workload type
    6c4102522abf drm/amdgpu: fix UVD contiguous CS mapping problem
    e6ebe4f14a26 drm/i915: Fix NULL pointer dereference in capture_engine
    8ce157e38f4a drm/i915/color: Stop using non-posted DSB writes for legacy LUT
    b9dd95dc5eec drm/i915: Fix memory leak by correcting cache object name in error handler
    bfb6f5ea906b drm/amdkfd: pause autosuspend when creating pdd
    840527f4a818 drm/xe: Call invalidation_fence_fini for PT inval fences in error state
    ffd774c34774 iommu/vt-d: Fix qi_batch NULL pointer with nested parent domain
    9a0a72d3ed91 iommu/vt-d: Remove cache tags before disabling ATS
    568e3a7546f6 iommu/tegra241-cmdqv: do not use smp_processor_id in preemptible context
    9e77eb481ba6 usb: dwc3: xilinx: make sure pipe clock is deselected in usb2 only mode
    d32babf3feea usb: typec: ucsi: Fix completion notifications
    dd6b0ca6025f usb: gadget: u_serial: Fix the issue that gs_start_io crashed due to accessing null pointer
    7737279ce67c usb: typec: anx7411: fix OF node reference leaks in anx7411_typec_switch_probe()
    b089cdb7e199 usb: dwc3: imx8mp: fix software node kernel dump
    f4911ecc0034 usb: typec: anx7411: fix fwnode_handle reference leak
    0967e8e734b8 usb: ehci-hcd: fix call balance of clocks handling routines
    f73c42713523 usb: gadget: midi2: Fix interpretation of is_midi1 bits
    cab34b0c9da7 scsi: ufs: core: Update compl_time_stamp_local_clock after completing a cqe
    681cdeb6dfd1 usb: dwc2: Fix HCD port connection race
    5aae028263d9 usb: dwc2: hcd: Fix GetPortStatus & SetPortFeature
    54db591cb797 usb: dwc2: Fix HCD resume
    22671807181c ata: sata_highbank: fix OF node reference leak in highbank_initialize_phys()
    5de70cdf42c1 bpf: Revert "bpf: Mark raw_tp arguments with PTR_MAYBE_NULL"
    2588c29afdc8 usb: core: hcd: only check primary hcd skip_phy_initialization
    d7a7e501fb72 gpio: graniterapids: Check if GPIO line can be used for IRQs
    e1ae30510440 gpio: graniterapids: Determine if GPIO pad can be used by driver
    9e45c2eea3f7 gpio: graniterapids: Fix invalid RXEVCFG register bitmask
    7247fa29c7bb gpio: graniterapids: Fix invalid GPI_IS register offset
    6832fcfb44da gpio: graniterapids: Fix incorrect BAR assignment
    e631cab10c6b gpio: graniterapids: Fix vGPIO driver crash
    0eae680d03fb block: Ignore REQ_NOWAIT for zone reset and zone finish operations
    15e56cd38546 usb: host: max3421-hcd: Correctly abort a USB request.
    8f2cf4d32b15 drm/panic: remove spurious empty line to clean warning
    71c359f6a4f7 crypto: hisilicon/debugfs - fix the struct pointer incorrectly offset problem
    3abfc4130c42 riscv: Fix IPIs usage in kfence_protect_page()
    abf985f61a01 ALSA: hda/realtek: Fix headset mic on Acer Nitro 5
    3be6628c4746 ALSA: usb-audio: Add implicit feedback quirk for Yamaha THR5
    e4dbfa63612b gpio: ljca: Initialize num before accessing item in ljca_gpio_config
    e9bce603fb21 spi: rockchip: Fix PM runtime count on no-op cs
    825bccd94343 memcg: slub: fix SUnreclaim for post charged objects
    6e564f2ae924 gpio: graniterapids: Fix GPIO Ack functionality
    7fa80134cf26 block: Prevent potential deadlocks in zone write plug error recovery
    a4b656ea1b90 dm: Fix dm-zoned-reclaim zone write pointer alignment
    eea49fcea50a block: Use a zone write plug BIO work for REQ_NOWAIT BIOs
    cbd06d98087c block: Switch to using refcount_t for zone write plugs
    29d1e06560f0 blk-cgroup: Fix UAF in blkcg_unpin_online()
    7174f13ea28a riscv: Fix wrong usage of __pa() on a fixmap address
    344945806f2f riscv: mm: Do not call pmd dtor on vmemmap page table teardown
    edd776618eee virtio_net: ensure netdev_tx_reset_queue is called on tx ring resize
    098b9821fe26 virtio_ring: add a func argument 'recycle_done' to virtqueue_resize()
    b4294d4ac61f virtio_net: correct netdev_tx_reset_queue() invocation point
    9891675bba06 perf ftrace: Fix undefined behavior in cmp_profile_data()
    8aa9d1ff5b7f tcp: check space before adding MPTCP SYN options
    26702b3439f5 splice: do not checksum AF_UNIX sockets
    a39e31e22a53 ksmbd: fix racy issue from session lookup and expire
    0535f67fbafa clk: en7523: Fix wrong BUS clock for EN7581
    c0ab5e01a51a perf/x86/intel/ds: Unconditionally drain PEBS DS when changing PEBS_DATA_CFG
    a3d85c14899b sched/deadline: Fix replenish_dl_new_period dl_server condition
    9b53d2c2a38a bpf: Fix UAF via mismatching bpf_prog/attachment RCU flavors
    7415bc5198ef serial: sh-sci: Check if TX data was written to device in .tx_empty()
    1832e61d879c usb: misc: onboard_usb_dev: skip suspend/resume sequence for USB5744 SMBus support
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
index d5c50d7e07..20c2ad44e8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6d3cbfc4586bbdc1bea2ee4d40e3ab8f60b0ac79"
-SRCREV_meta ?= "96ce9b7ee67702aec75816c4d44a527061c418c5"
+SRCREV_machine ?= "8476be0f3e04eb74fd1991813cafa2f11a8c2f3b"
+SRCREV_meta ?= "1204392cf280ffdab50fdf4c91ae3a4be8dd25f2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.5"
+LINUX_VERSION ?= "6.12.8"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 867f1a8683..0e3d09c3a0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.5"
+LINUX_VERSION ?= "6.12.8"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "ce1b5cfc9bdef020d007b881d78aca2d0350d6fe"
-SRCREV_meta ?= "96ce9b7ee67702aec75816c4d44a527061c418c5"
+SRCREV_machine ?= "0bd79f208ea519c88a63f3cf283d2239f246ce3f"
+SRCREV_meta ?= "1204392cf280ffdab50fdf4c91ae3a4be8dd25f2"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index b3934341eb..7c255e9d90 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "9142db2532267443050a42deb8a17c3ac8cda055"
-SRCREV_machine:qemuarm64 ?= "ce1b5cfc9bdef020d007b881d78aca2d0350d6fe"
-SRCREV_machine:qemuloongarch64 ?= "ce1b5cfc9bdef020d007b881d78aca2d0350d6fe"
-SRCREV_machine:qemumips ?= "075aa6336cc711850452d1767c84ade46ce88137"
-SRCREV_machine:qemuppc ?= "ce1b5cfc9bdef020d007b881d78aca2d0350d6fe"
-SRCREV_machine:qemuriscv64 ?= "ce1b5cfc9bdef020d007b881d78aca2d0350d6fe"
-SRCREV_machine:qemuriscv32 ?= "ce1b5cfc9bdef020d007b881d78aca2d0350d6fe"
-SRCREV_machine:qemux86 ?= "ce1b5cfc9bdef020d007b881d78aca2d0350d6fe"
-SRCREV_machine:qemux86-64 ?= "ce1b5cfc9bdef020d007b881d78aca2d0350d6fe"
-SRCREV_machine:qemumips64 ?= "e576f3b991cb3f33dd80f5d33fa65ef21abc78cf"
-SRCREV_machine ?= "ce1b5cfc9bdef020d007b881d78aca2d0350d6fe"
-SRCREV_meta ?= "96ce9b7ee67702aec75816c4d44a527061c418c5"
+SRCREV_machine:qemuarm ?= "6a55012c9ce32a43e766d5cb9d5681095a646cbe"
+SRCREV_machine:qemuarm64 ?= "0bd79f208ea519c88a63f3cf283d2239f246ce3f"
+SRCREV_machine:qemuloongarch64 ?= "0bd79f208ea519c88a63f3cf283d2239f246ce3f"
+SRCREV_machine:qemumips ?= "54a83ae06c1ce7fa15b016ae8d3e3d4de989ba64"
+SRCREV_machine:qemuppc ?= "0bd79f208ea519c88a63f3cf283d2239f246ce3f"
+SRCREV_machine:qemuriscv64 ?= "0bd79f208ea519c88a63f3cf283d2239f246ce3f"
+SRCREV_machine:qemuriscv32 ?= "0bd79f208ea519c88a63f3cf283d2239f246ce3f"
+SRCREV_machine:qemux86 ?= "0bd79f208ea519c88a63f3cf283d2239f246ce3f"
+SRCREV_machine:qemux86-64 ?= "0bd79f208ea519c88a63f3cf283d2239f246ce3f"
+SRCREV_machine:qemumips64 ?= "7cae438d051e6ddd0f99d2ecad1dc81d4c3a8727"
+SRCREV_machine ?= "0bd79f208ea519c88a63f3cf283d2239f246ce3f"
+SRCREV_meta ?= "1204392cf280ffdab50fdf4c91ae3a4be8dd25f2"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "61baee2dc5341c936e7fa7b1ca33c5607868de69"
+SRCREV_machine:class-devupstream ?= "77f85ccd3618f324d221f0faaed6d9cdc118c74a"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.5"
+LINUX_VERSION ?= "6.12.8"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


