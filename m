Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1AB8F4611D
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 13:51:05 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18030.1774273864981479010
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 06:51:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=feAmfiUg;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-50b3488fb31so47126991cf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 06:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774273864; x=1774878664; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nA9hug7QpRL6N/Ve/XeSi/USGUu6PGsY0ZHmcT/zJ8I=;
        b=feAmfiUgNA+45eilDNNYSbVWVp3lZogw+Vckmhkd5erEoH7M/zLmaNuGHOIZnZtq5N
         SvtvGQep4LsYspBhOzOxAiplFxol06Im3c5todWZi4HBSo4HT79b+owpx3tts8URQyWj
         m6hCQ8QMABpnZCWHqhDQH5MAxLJMiYiH2Rf8CEEJ0hiqg0LAziZyknoAJ+7QFGOyXmQr
         5a6rXveEM2wNlo7B4iqBwtBvqnzTTB/al//YB1BR8WjjMKAHyJM7cqCkGVOAInsnGiYR
         pjelsOsMJPFO/C7r3YAR8ucplXwxyKqvtB4JxqsrAAXt5ECX9fXCybrgjHZJ9ymwFH3c
         wKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774273864; x=1774878664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nA9hug7QpRL6N/Ve/XeSi/USGUu6PGsY0ZHmcT/zJ8I=;
        b=MAMuG9LpPmnhdI9l7F4dGbMuXZqj9c4bykTKYj5AEzlg0WFYZZkxz3fwmx09EgvJVS
         3fOTg/C3XcvD2yQrcmxcF5wR69K4RXZ2vzZ+JC9IVr43kCT1lc+r1U9P8IDBB206jRSf
         CUPnEf4iOguj2nIryZhzupfHfLvK0wNSbVpWbgAnavU5zqAu20n3rA7Ykc+1hEapplnd
         3l1XBuRgg61dz9/UNYUfZqr93/QyVkF4N0iPwsqrlUh2gVmx6VjF4BRpz7kOuLUow28G
         C/zQM/s1ebYCZpDN1vqepBCEVvUek+bOJ6meGN+WjS72A6LnfQRjttnJ9eCimrDnT5bt
         y3XQ==
X-Gm-Message-State: AOJu0Yy0vxO2YZfptXstnaDX6PXvj9CDc9kjnBL2Ll4TlEv+NNipSrv5
	qDod7rcY00C9wUJRXddzgrAO1u2ZyCkuBoXL4ht9wh306oXpgHvbcGKgCtks6mCq
X-Gm-Gg: ATEYQzziaeMd0epYVMTqv9hkaiMujbXaDPK1DHFjbwAXLBfzjH1Lwxcwv5Lm0F4vtcS
	ePx+/NJzKum9qya7dpKeVBtS9ljpZbWlHBVdFqjRWo8MjAHbuZKYkYDBVzA0KZcRlGBatWW7fB3
	5WFfjYNQSZ6z+Pked2xOXJdoAYZrJ0X23zI/LiQg5LRSZwrTcwa8q5k6LlIFVgjOE7pX9AYkGl6
	qW/Qgv+ShmX3tZtu08MP0N89/6TWmYaeGbs1JxVRVZozNqvrlztmF9MCYT565mY3WiYbC0sUHzC
	Dwcoy+IMMOXUAcIzTSHlErEDWZ4eUO3UHU1rRDyj39+xW6Dm+mPFtLnfr60ycytDD0uBv+pfAJ3
	0vj8ANLW/p9SGGiMGc38HXHjuj7XY+ZNpn1etASVHaMnP3qGgSbZ+U4TlzbtJ1f5t6SxVX7xAt8
	0P/cmSYz6yWpcWgJ5wu1zgDX/yJg5MDz+Hg3P+pGOQEroQO7AgEhYh+JQN1kXLlrsEg8OYZF/KQ
	CgXw4SWZZ7l8i/qJbp9Hc7sVXnwVnilU9WWYguu3qufUynokx8lk+x4dA4=
X-Received: by 2002:ac8:5f82:0:b0:509:27be:b010 with SMTP id d75a77b69052e-50b3711626bmr173849071cf.19.1774273863019;
        Mon, 23 Mar 2026 06:51:03 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b664cddc3sm17232041cf.5.2026.03.23.06.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:51:01 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 03/11] linux-yocto/6.18: update to v6.18.16
Date: Mon, 23 Mar 2026 09:50:49 -0400
Message-ID: <20260323135057.1605923-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323135057.1605923-1-bruce.ashfield@gmail.com>
References: <20260323135057.1605923-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 13:51:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233723

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.18 to the latest korg -stable release that comprises
the following commits:

    6258e292d746 Linux 6.18.16
    0ac822bf9902 drm/amdgpu: Refactor amdgpu_gem_va_ioctl for Handling Last Fence Update and Timeline Management v7
    f1ba620f9e8d most: core: fix leak on early registration failure
    c954666a0707 arm64: Fix sampling the "stable" virtual counter in preemptible section
    164f57cd0ac8 xfs: fix copy-paste error in previous fix
    ea39bac434c5 drm/i915/wakeref: clean up INTEL_WAKEREF_PUT_* flag macros
    b0bc1aaf938d Revert "ACPI: processor: Update cpuidle driver check in __acpi_processor_start()"
    b9f13e55168c ALSA: pcm: Revert bufs move in snd_pcm_xfern_frames_ioctl()
    6789db2c8e2f NTB: ntb_transport: Fix too small buffer for debugfs_name
    358cb7055e03 rust: list: Add unsafe blocks for container_of and safety comments
    49ffdc3589d8 tracing: Wake up poll waiters for hist files when removing an event
    d4e45ca6db67 tracing: Fix checking of freed trace_event_file for hist files
    c71ea5a71233 fgraph: Do not call handlers direct when not using ftrace_ops
    5026010110a5 tracing: ring-buffer: Fix to check event length before using
    bc77986f3cb7 ring-buffer: Fix possible dereference of uninitialized pointer
    c692db813a7e net: nfc: nci: Fix parameter validation for packet data
    b1e034af484a drm/amdgpu: keep vga memory on MacBooks with switchable graphics
    832f430b6b33 drm/amd/display: Correct logic check error for fastboot
    53002567af57 arm64: Force the use of CNTVCT_EL0 in __delay()
    0ec0156b3fa6 rust: pin-init: replace clippy `expect` with `allow`
    dddc9e67fc45 rust: irq: add `'static` bounds to irq callbacks
    a94f096e28bf io_uring/zcrx: fix user_ref race between scrub and refill paths
    581a8f0f3338 x86/kexec: Copy ACPI root pointer address from config table
    54f463494eb5 gpio: sysfs: fix chip removal with GPIOs exported over sysfs
    4ece5eb4836f net/sched: act_skbedit: fix divide-by-zero in tcf_skbedit_hash()
    1b1d3c5d58a8 net: ethernet: ec_bhf: Fix dma_free_coherent() dma handle
    ffba51100ff6 drm/xe: Add bounds check on pat_index to prevent OOB kernel read in madvise
    ea33c43c2e40 kbuild: rpm-pkg: Disable automatic requires for manual debuginfo package
    caa055b579cd ASoC: amd: yc: Add DMI quirk for ASUS Vivobook Pro 15X M6501RR
    422adc95ea9a io_uring/cmd_net: fix too strict requirement on ioctl
    89f3d2d54135 gpio: nomadik: Add missing IS_ERR() check
    7c9ce68192ee cifs: some missing initializations on replay
    f1ae40332431 io_uring/zcrx: fix sgtable leak on mapping failures
    bcf40ce46665 fbcon: Remove struct fbcon_display.inverse
    c61afb99c828 fbdev: ffb: fix corrupted video output on Sun FFB1
    69290f2d3999 fbdev: of: display_timing: fix refcount leak in of_get_display_timings()
    40c1ff250251 fbdev: vt8500lcdfb: fix missing dma_free_coherent()
    11a93180a70b fbcon: check return value of con2fb_acquire_newinfo()
    0a08a7fa123c fbdev: Use device_create_with_groups() to fix sysfs groups registration race
    861fb0cc95d5 mm: numa_memblks: Identify the accurate NUMA ID of CFMW
    e90346a2f1e8 ipv6: ioam: fix heap buffer overflow in __ioam6_fill_trace_data()
    3d01d8a2cc64 kbuild: rpm-pkg: Fix manual debuginfo generation when using .src.rpm
    39824c8ce0c2 kernel: rpm-pkg: Restore find-debuginfo.sh approach to -debuginfo package
    0ee1887b524c kbuild: rpm-pkg: Restrict manual debug package creation
    972495bc37be kbuild: Fix CC_CAN_LINK detection
    f8d02862e520 function_graph: Restore direct mode when callbacks drop to one
    e4ff4e3ffcf9 atm: fore200e: fix use-after-free in tasklets during device removal
    41023fc00f37 net: intel: fix PCI device ID conflict between i40e and ipw2200
    23b82b7a2618 mm/page_alloc: clear page->private in free_pages_prepare()
    e116e19c9584 mm/vmscan: fix demotion targets checks in reclaim/demotion
    8adaff87db14 procfs: fix possible double mmput() in do_procmap_query()
    f64491066c66 mm/page_alloc: skip debug_check_no_{obj,locks}_freed with FPI_TRYLOCK
    5eac1322a7b1 mm/hugetlb: restore failed global reservations to subpool
    89a9389ad70d drm/amdgpu: fix sync handling in amdgpu_dma_buf_move_notify
    be9c5e7af6b3 drm/amd/display: Increase DCN35 SR enter/exit latency
    cc54e0eeee01 io_uring/openclose: fix io_pipe_fixed() slot tracking for specific slots
    749b5e65ab69 io_uring/filetable: clamp alloc_hint to the configured alloc range
    e18d1a82a62e ceph: fix write storm on fscrypted files
    746840c87d76 ceph: do not propagate page array emplacement errors as batch errors
    0b9c58126ad1 tracing: Reset last_boot_info if ring buffer is reset
    127f9481ea77 tracing: Fix to set write permission to per-cpu buffer_size_kb
    316d9fe71fb1 net: macb: Fix tx/rx malfunction after phy link down and up
    4cbc8dc736c7 net: ti: icssg-prueth: Add optional dependency on HSR
    6d389382ee65 octeontx2-af: CGX: fix bitmap leaks
    d8a522085d09 net: wan/fsl_ucc_hdlc: Fix dma_free_coherent() in uhdlc_memclean()
    938cf039a683 net: ethernet: marvell: skge: remove incorrect conflicting PCI ID
    78dd793ae6dc LoongArch: Disable instrumentation for setup_ptwalker()
    76a0e30a1cea LoongArch: Guard percpu handler under !CONFIG_PREEMPT_RT
    0811b951377e LoongArch: Use %px to print unmodified unwinding address
    7a6b754bddd3 LoongArch: Prefer top-down allocation after arch_mem_init()
    61a56df2fbaa LoongArch: Make cpumask_of_node() robust against NUMA_NO_NODE
    353dd9934447 mm/slab: do not access current->mems_allowed_seq if !allow_spin
    f843be764204 rust: kbuild: pass `-Zunstable-options` for Rust 1.95.0
    2d11f9cff0a7 drm/i915/quirks: Fix device id for QUIRK_EDP_LIMIT_RATE_HBR2 entry
    69e59a87bab0 ceph: supply snapshot context in ceph_zero_partial_object()
    a2d53aee3fe2 MIPS: rb532: Fix MMIO UART resource registration
    3969db6b22e3 cifs: Fix locking usage for tcon fields
    80a2e762b217 i2c: imx-lpi2c: fix SMBus block read NACK after byte count
    5e227857fcd9 watchdog/softlockup: fix sample ring index wrap in need_counting_irqs()
    d14871ce0b40 kcsan, compiler_types: avoid duplicate type issues in BPF Type Format
    677490a6bd4c staging: rtl8723bs: fix null dereference in find_network
    7e4d88e36e5d mptcp: pm: in-kernel: always set ID as avail when rm endp
    2f33f77397dd parisc: kernel: replace kfree() with put_device() in create_tree_node()
    bd435f4b7381 PCI: Fix pci_slot_trylock() error handling
    627f0ea6537c PCI: Don't claim disabled bridge windows
    29739ec197ed net: cpsw_new: Fix potential unregister of netdev that has not been registered yet
    299b825716b8 net: cpsw_new: Fix unnecessary netdev unregistration in cpsw_probe() error path
    fc58ef30e0a1 drm/amdgpu: Protect GPU register accesses in powergated state in some paths
    bfcd6b53e1f4 drm/amdkfd: Fix out-of-bounds write in kfd_event_page_set()
    d58f8d4dcfb1 tipc: fix RCU dereference race in tipc_aead_users_dec()
    ead66f2ed16f mtd: rawnand: pl353: Fix software ECC support
    9799f977759e usb: dwc2: fix resume failure if dr_mode is host
    2333653ef854 usb: dwc3: gadget: Move vbus draw to workqueue context
    76096f156fe9 mux: mmio: fix regmap leak on probe failure
    e4010282364f PCI: dwc: Fix msg_atu_index assignment
    b355d927109f MIPS: Loongson2ef: Use pcibios_align_resource() to block io range
    3b8fa431e035 MIPS: Loongson2ef: Register PCI controller in early stage
    222afcca91f3 mm/slab: use unsigned long for orig_size to ensure proper metadata align
    29659497e100 mm/slab: avoid allocating slabobj_ext array from its own slab
    78d8e2d6352e scsi: ufs: core: Flush exception handling work when RPM level is zero
    08c7eadd8a93 perf/arm-cmn: Reject unsupported hardware configurations
    500778df9e4c remoteproc: imx_rproc: Fix invalid loaded resource table detection
    4c0382b86600 btrfs: continue trimming remaining devices on failure
    f4951c56d59c btrfs: zoned: fixup last alloc pointer after extent removal for DUP
    72f6529487a3 btrfs: zoned: fixup last alloc pointer after extent removal for RAID1
    25afd2a1ee4d btrfs: fix periodic reclaim condition
    da86ca15d738 clk: rs9: Reserve 8 struct clk_hw slots for for 9FGV0841
    4ce27e86d641 uprobes: Fix incorrect lockdep condition in filter_chain()
    956d54e07ca7 arm64: Fix non-atomic __READ_ONCE() with CONFIG_LTO=y
    bea1d373098b PCI/IOV: Fix race between SR-IOV enable/disable and hotplug
    40f67686a500 Revert "PCI/IOV: Add PCI rescan-remove locking when enabling/disabling SR-IOV"
    f86582890bd7 kho: skip memoryless NUMA nodes when reserving scratch areas
    fdf605f64f82 crash_dump: fix dm_crypt keys locking and ref leak
    36eb314184a0 kexec: derive purgatory entry from symbol
    3bdc3766aafb ocfs2: fix reflink preserve cleanup issue
    e5a732bfe294 rapidio: replace rio_free_net() with kfree() in rio_scan_alloc_net()
    9f7a5aee9171 compiler-clang.h: require LLVM 19.1.0 or higher for __typeof_unqual__
    d83396624fda mm/highmem: fix __kmap_to_page() build error
    491f04be585c power: reset: tdx-ec-poweroff: fix restart
    bc1492651253 mtd: spinand: Disable continuous read during probe
    5a435b0e4609 iio: gyro: itg3200: Fix unchecked return value in read_raw
    9b85c8f624b0 powerpc/smp: Add check for kcalloc() failure in parse_thread_groups()
    7441d35d14d9 vhost: move vdpa group bound check to vhost_vdpa
    dfcbe0195165 tools: Fix bitfield dependency failure
    461242507181 arm64: poe: fix stale POR_EL0 values for ptrace
    e9051992fd21 dm mpath: make pg_init_delay_msecs settable
    b662f91e216f bus: fsl-mc: fix an error handling in fsl_mc_device_add()
    ab81f9f3319e io_uring/net: don't continue send bundle if poll was required for retry
    bce59008b234 mm/slab: add rcu_barrier() to kvfree_rcu_barrier_on_cache()
    f42941d60f01 usb: gadget: tegra-xudc: Add handling for BLCG_COREPLL_PWRDN
    1afe45f89d54 mm/vmalloc: prevent RCU stalls in kasan_release_vmalloc_node
    d4a132f121c5 x86/kexec: add a sanity check on previous kernel's ima kexec buffer
    1ca6530f07d4 of/kexec: refactor ima_get_kexec_buffer() to use ima_validate_range()
    9e1f51c1ad57 ima: verify the previous kernel's IMA buffer lies in addressable RAM
    995240f823a3 PCI: Fix bridge window alignment with optional resources
    26da747e754c nvmem: Drop OF node reference on nvmem_add_one_cell() failure
    2eb988d5c8f8 nfsd: fix return error code for nfsd_map_name_to_[ug]id
    6689272b8261 NFSD: fix setting FMODE_NOCMTIME in nfs4_open_delegation
    9a6f8cd28bb9 md/bitmap: fix GPF in write_page caused by resize race
    b04baa848c05 xfs: check for deleted cursors when revalidating two btrees
    2b658d124966 xfs: check return value of xchk_scrub_create_subord
    c9ccefacae0d xfs: only call xf{array,blob}_destroy if we have a valid pointer
    c2ce8d9a3b98 pinctrl: intel: Add code name documentation
    733cbc3aa97e PCI: endpoint: Fix swapped parameters in pci_{primary/secondary}_epc_epf_unlink() functions
    57536ff0a6bd KVM: x86: Add SRCU protection for reading PDPTRs in __get_sregs2()
    aaaea528d476 rust/drm: Fix Registration::{new,new_foreign_owned}() docs
    71cfbc15c91a spmi: apple: Add "apple,t8103-spmi" compatible
    18e9cf2259b4 xfs: get rid of the xchk_xfile_*_descr calls
    d1a3cc775c6e xfs: fix remote xattr valuelblk check
    652d815b856c xfs: fix the xattr scrub to detect freemap/entries array collisions
    43f3b1867961 xfs: fix freemap adjustments when adding xattrs to leaf blocks
    f31a8334e1c5 xfs: delete attr leaf freemap entries when empty
    d54f00547c21 usb: host: tegra: Remove manual wake IRQ disposal
    a50006e7ba0e iommu/arm-smmu-v3: Do not set disable_ats unless vSTE is Translate
    779e0c250a6b iommu/arm-smmu-v3: Mark EATS_TRANS safe when computing the update sequence
    3f73325f4548 iommu/arm-smmu-v3: Mark STE MEV safe when computing the update sequence
    efd59553e477 iommu/arm-smmu-v3: Add update_safe bits to fix STE update sequence
    a8e88edfd69d iio: accel: adxl380: Avoid reading more entries than present in FIFO
    482814921449 PCI/PM: Prevent runtime suspend until devices are fully initialized
    d6e866f3a183 arm64: dts: rockchip: Explicitly request UFS reset pin on RK3576
    8d8a878ef608 erofs: fix incorrect early exits in volume label handling
    041b5163bb9b erofs: fix incorrect early exits for invalid metabox-enabled images
    70746336cae6 mfd: omap-usb-host: Fix OF populate on driver rebind
    269466027440 mfd: qcom-pm8xxx: Fix OF populate on driver rebind
    a1e9e299c0d9 mfd: macsmc: Initialize mutex
    89bdcd39ae8b mfd: tps65219: Implement LOCK register handling for TPS65214
    9b02e3fec3a7 mfd: core: Add locking around 'mfd_of_node_list'
    25056a2fc07f KVM: arm64: nv: Return correct RES0 bits for FGT registers
    8722a8fb7ed9 iommu/vt-d: Flush piotlb for SVM and Nested domain
    9deaacc8dcad iommu/vt-d: Flush dev-IOTLB only when PCIe device is accessible in scalable mode
    69c32df23bed media: uvcvideo: Return queued buffers on start_streaming() failure
    97330e31ea16 dm: fix excessive blk-crypto operations for invalid keys
    f122f2b3ce9d media: verisilicon: AV1: Fix tile info buffer size
    457121c01f60 xfs: remove xfs_attr_leaf_hasname
    00195330d172 xfs: mark data structures corrupt on EIO and ENODATA
    aacb5f183eac PCI: dwc: Skip waiting for L2/L3 Ready if dw_pcie_rp::skip_l23_wait is true
    42d9509161d0 phy: fsl-imx8mq-usb: set platform driver data
    5e27e7f22978 drm/bridge: anx7625: Fix invalid EDID size
    6236c1cd9fdf drm/buddy: Prevent BUG_ON by validating rounded allocation
    ca666795bd61 selftests/mm/charge_reserved_hugetlb: drop mount size for hugetlbfs
    a39b9928fdfd mm, page_alloc, thp: prevent reclaim for __GFP_THISNODE THP allocations
    e14d5a99b1a6 docs: kdoc: avoid error_count overflows
    faccf9c1464a drm: of: drm_of_panel_bridge_remove(): fix device_node leak
    77f69aa4deb1 media: iris: Prevent output buffer queuing before stream-on completes
    72846441c5f6 media: iris: gen2: Add sanity check for session stop
    7cde76db8883 media: iris: gen1: Destroy internal buffers after FW releases
    64e88089a294 media: iris: Skip resolution set on first IPSC
    45b30f65feeb media: iris: Add buffer to list only after successful allocation
    b59ec89f9cdf media: iris: use fallback size when S_FMT is called without width/height
    101f2b3cd0b6 media: iris: Fix fps calculation
    0cd7ca8e9603 media: iris: Fix ffmpeg corrupted frame error
    bd4f8fa21618 Revert "media: iris: Add sanity check for stop streaming"
    f3bf86dec1d8 media: venus: vdec: restrict EOS addr quirk to IRIS2 only
    fa71c413854b media: venus: vdec: fix error state assignment for zero bytesused
    21fde0b4b166 arm64: dts: rockchip: Do not enable hdmi_sound node on Pinebook Pro
    428966f1151f drm/tyr: fix register name in error print
    1a09db973ac6 rtc: pcf8563: use correct of_node for output clock
    dfe2dbe3950f dm-unstripe: fix mapping bug when there are multiple targets in a table
    38625191f32f dm-integrity: fix recalculation in bitmap mode
    76801c3dfca0 reset: gpio: suppress bind attributes in sysfs
    2097ce274bbc drm/i915/psr: Don't enable Panel Replay on sink if globally disabled
    4caae8168d1b mailbox: Prevent out-of-bounds access in fw_mbox_index_xlate()
    2c89064ecf67 s390/pci: Handle futile config accesses of disabled devices directly
    b7bbd20d55ce clk: tegra: tegra124-emc: Fix potential memory leak in tegra124_clk_register_emc()
    26b1c59da576 arm64: dts: rockchip: Fix SD card support for RK3576 EVB1
    fed39f0d316f media: i2c: ov01a10: Fix digital gain range
    4be6112c79b2 media: stm32: dcmipp: byteproc: disable compose for all bayers
    49c7d405c6ca media: stm32: dcmipp: bytecap: clear all interrupts upon stream stop
    23ad54f2551f media: stm32: dcmipp: avoid naming clock if only one is needed
    d13418d75e17 soc: rockchip: grf: Support multiple grf to be handled
    833fd7ad595f soc: rockchip: grf: Fix wrong RK3576_IOCGRF_MISC_CON definition
    9785b31beb33 clk: clk-apple-nco: Add "apple,t8103-nco" compatible
    ef6647586deb bus: omap-ocp2scp: fix OF populate on driver rebind
    d464cf1ed900 KVM: nSVM: Always use vmcb01 in VMLOAD/VMSAVE emulation
    b7db9953c2f8 soc: ti: pruss: Fix double free in pruss_clk_mux_setup()
    ab1ac24c407e soc: ti: k3-socinfo: Fix regmap leak on probe failure
    b1c1a2637ebd dm: clear cloned request bio pointer when last clone bio completes
    9e30eb22e03a dm-integrity: fix a typo in the code for write/discard race
    e3704ce5d715 platform/x86: ISST: Store and restore all domains data
    067d784870ee platform/x86: ISST: Add missing write block check
    5ca94abfe5a0 media: staging/ipu7: Fix the loop bound in l2 table alloc
    08440d792f97 media: staging/ipu7: Update CDPHY register settings
    8603922f08d9 media: staging/ipu7: Call synchronous RPM suspend in probe failure
    9a8c3cd8a0bb media: staging/ipu7: Ignore interrupts when device is suspended
    364759ccc3fb media: ipu6: Fix RPM reference leak in probe error paths
    39b9626b0559 media: ipu6: Fix typo and wrong constant in ipu6-mmu.c
    605e9a9471d2 media: dw9714: Fix powerup sequence
    fa69b9a87f89 media: i2c: ov5647: use our own mutex for the ctrl lock
    e26aba7c0e9e media: ccs: Fix setting initial sub-device state
    78d2c1ca071d media: i2c: ov5647: Fix PIXEL_RATE value for VGA mode
    1b593da3e54c media: i2c: ov5647: Sensor should report RAW color space
    ff90942181d0 media: i2c: ov5647: Correct minimum VBLANK value
    8f5082ee1773 media: i2c: ov5647: Correct pixel array offset
    8ecb21c20387 media: i2c: ov5647: Initialize subdev before controls
    a8ff58cc8c75 media: ccs: Avoid possible division by zero
    fade67c88870 media: qcom: camss: vfe: Fix out-of-bounds access in vfe_isr_reg_update()
    e5d08efceffc media: i2c: ov01a10: Fix test-pattern disabling
    9466dc871c45 media: i2c: ov01a10: Fix passing stream instead of pad to v4l2_subdev_state_get_format()
    be04fe430bb0 media: i2c: ov01a10: Add missing v4l2_subdev_cleanup() calls
    2195f2be8307 media: i2c: ov01a10: Fix analogue gain range
    e148cdc0f122 media: i2c: ov01a10: Fix reported pixel-rate value
    8df26a76497f media: i2c: ov01a10: Fix the horizontal flip control
    377a77569143 media: i2c/tw9906: Fix potential memory leak in tw9906_probe()
    cc7aeed33e4f media: i2c/tw9903: Fix potential memory leak in tw9903_probe()
    280da29ff603 media: cx25821: Add missing unmap in snd_cx25821_hw_params()
    9544b73cad4e media: cx23885: Add missing unmap in snd_cx23885_hw_params()
    1ce8c2a8f050 media: cx88: Add missing unmap in snd_cx88_hw_params()
    1d8558a232ec media: radio-keene: fix memory leak in error path
    9e3b9d2472b3 media: verisilicon: AV1: Set IDR flag for intra_only frame type
    1af2853b4e97 media: rockchip: rga: Fix possible ERR_PTR dereference in rga_buf_init()
    fe1c50fadc4e media: amphion: Drop min_queued_buffers assignment
    a2ac388aa830 arm64: dts: apple: t8112-j473: Keep the HDMI port powered on
    e75e091a331e fs: ensure that internal tmpfs mount gets mount id zero
    1acb28123e57 HID: logitech-hidpp: Check maxfield in hidpp_get_report_length()
    d5512ce892f7 HID: prodikeys: Check presence of pm->input_ep82
    5bbe266272d8 HID: magicmouse: Do not crash on missing msc->input
    1d46d07458db HID: hid-pl: handle probe errors
    4a1afa32145b pinctrl: meson: amlogic-a4: mark the GPIO controller as sleeping
    e3e6e2e4d66e arm64: Disable branch profiling for all arm64 code
    969e5e13ff5c KVM: nSVM: Remove a user-triggerable WARN on nested_svm_load_cr3() succeeding
    662fae91c30b KVM: x86: Return "unsupported" instead of "invalid" on access to unsupported PV MSR
    e28f45102510 powerpc/pseries: Fix MSI-X allocation failure when quota is exceeded
    58bd8c5f67a3 arm64: kernel: initialize missing kexec_buf->random field
    c053b301a0b2 ARM: omap2: Fix reference count leaks in omap_control_init()
    5d83ae6ccdc9 arm64: dts: qcom: sm8750: Fix BAM DMA probing
    b965b990c191 arm64: dts: qcom: x1e80100: Add missing TCSR ref clock to the DP PHYs
    adae1932f01a media: verisilicon: AV1: Fix tx mode bit setting
    93adedf67b07 media: verisilicon: AV1: Fix enable cdef computation
    ea316b784fe6 media: chips-media: wave5: Fix Null reference while testing fluster
    27cb12b7dc88 media: chips-media: wave5: Fix SError of kernel panic when closed
    526816f2e331 media: chips-media: wave5: Fix device cleanup order to prevent kernel panic
    cc8071b1bac6 media: chips-media: wave5: Fix kthread worker destruction in polling mode
    3a278a55ead5 media: chips-media: wave5: Fix PM runtime usage count underflow
    a62ba5aa9ee9 media: mtk-mdp: Fix a reference leak bug in mtk_mdp_remove()
    b3fc99fe5b25 media: mtk-mdp: Fix error handling in probe function
    d659f72af566 media: mediatek: encoder: Fix uninitialized scalar variable issue
    e2a45398bba3 media: uvcvideo: Fix support for V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX
    451cc650e40e dm-verity: correctly handle dm_bufio_client_create() failure
    2e170d8bb3b3 arm64: dts: qcom: sdm630: Add missing MDSS reset
    c2b9214c34f5 phy: qcom: edp: Make the number of clocks flexible
    6cc6c73a87c3 PCI: Use resource_set_range() that correctly sets ->end
    fcfdf9794afe Revert "PCI: dwc: Don't wait for link up if driver can detect Link Up event"
    f956c3c101e2 Revert "PCI: qcom: Enumerate endpoints based on Link up event in 'global_irq' interrupt"
    46adbe1c144e Revert "PCI: qcom: Enable MSI interrupts together with Link up if 'Global IRQ' is supported"
    d6fecafe7b23 Revert "PCI: qcom: Don't wait for link if we can detect Link Up"
    77ac28b38a86 Revert "PCI: dw-rockchip: Don't wait for link since we can detect Link Up"
    4cccf815bccc drm/xe: Fix ggtt fb alignment
    cdf8bbbd9017 drm/tests: shmem: Hold reservation lock around purge
    9cc77691b5fd drm/tests: shmem: Hold reservation lock around madvise
    6b953d92f2f2 drm/tests: shmem: Hold reservation lock around vmap/vunmap
    595227cf408f drm/tests: shmem: Add clean-up action to unpin pages
    496e765b7205 drm/tests: shmem: Swap names of export tests
    bfcee87fd175 fpga: dfl: use subsys_initcall to allow built-in drivers to be added
    a0eb5f82212b ASoC: SOF: ipc4-control: Keep the payload size up to date
    c7bf344a83a1 ASoC: SOF: ipc4-control: Use the correct size for scontrol->ipc_control_data
    a704a1a4394b ASoC: SOF: ipc4-topology: Correct the allocation size for bytes controls
    c5fb5db719c7 ASoC: SOF: ipc4-control: If there is no data do not send bytes update
    ab8c0de60f16 drm/panthor: fix for dma-fence safe access rules
    a803cfad1f23 arm64: dts: ti: am62p-verdin: Fix SD regulator startup delay
    0bcfebb83b54 hfsplus: ensure sb->s_fs_info is always cleaned up
    428093cfa8b2 clk: renesas: rzg2l: Select correct div round macro
    01dfc5abfa4d clk: renesas: rzg2l: Fix intin variable size
    2e4a70f3c309 rpmsg: core: fix race in driver_override_show() and use core helper
    f0a83d0a4b7c netfilter: nf_conntrack_h323: fix OOB read in decode_choice()
    89764cf44544 dpaa2-switch: validate num_ifs to prevent out-of-bounds write
    4cb163e9efca net: consume xmit errors of GSO frames
    57957bc7f186 net/mlx5e: Fix "scheduling while atomic" in IPsec MAC address query
    f72f646a5552 net/mlx5: Fix missing devlink lock in SRIOV enable error path
    5226e227271a net/mlx5: E-switch, Clear legacy flag when moving to switchdev
    f0ed27a3315f net/mlx5: LAG, disable MPESW in lag_disable_change()
    858914d1ad19 net/mlx5: DR, Fix circular locking dependency in dump
    bce42728ac48 team: avoid NETDEV_CHANGEMTU event when unregistering slave
    54a7013aa13f team: use common function to compute the features
    26924d2fdec2 net: add a common function to compute features for upper devices
    fa3c2f8d9152 net: mana: Fix double destroy_workqueue on service rescan PCI path
    f8a06d562638 dpll: zl3073x: Remove redundant cleanup in devm_dpll_init()
    900be42c53cd tcp: re-enable acceptance of FIN packets when RWIN is 0
    d3e32e2f3262 RDMA/umem: Fix double dma_buf_unpin in failure path
    9d5a97bc71ed erofs: fix interlaced plain identification for encoded extents
    d2e7c898cc02 net: usb: pegasus: enable basic endpoint checking
    f3e4cceafad2 net: Drop the lock in skb_may_tx_timestamp()
    9bc0bca26418 RDMA/efa: Fix typo in efa_alloc_mr()
    2b96156c927c RDMA/ionic: Fix potential NULL pointer dereference in ionic_query_port
    3126a2f98bea netconsole: avoid OOB reads, msg is not nul-terminated
    21d341fe514f net: wan: farsync: Fix use-after-free bugs caused by unfinished tasklets
    e57d397bffab RDMA/core: Fix stale RoCE GIDs during netdev events at registration
    d8fc9f972fbd tipc: fix duplicate publication key in tipc_service_insert_publ()
    9fc2e95fe541 dpll: zl3073x: fix REF_PHASE_OFFSET_COMP register width for some chip IDs
    b2acd29bd487 dpll: zl3073x: Cache all reference properties in zl3073x_ref
    a4b086cc61e6 dpll: zl3073x: Cache reference monitor status
    b1e3edf688a8 kcm: fix zero-frag skb in frag_list on partial sendmsg error
    854cd32bc74f tls: Fix race condition in tls_sw_cancel_work_tx()
    5455a232edea net: do not pass flow_id to set_rps_cpu()
    96581749c7c1 Bluetooth: L2CAP: Fix missing key size check for L2CAP_LE_CONN_REQ
    3a954c75b1cd Bluetooth: L2CAP: Fix not checking output MTU is acceptable on L2CAP_ECRED_CONN_REQ
    69dd2e85f8e8 Bluetooth: L2CAP: Fix response to L2CAP_ECRED_CONN_REQ
    49065204b95b Bluetooth: hci_qca: Cleanup on all setup failures
    e981a9392800 Bluetooth: L2CAP: Fix result of L2CAP_ECRED_CONN_RSP when MTU is too short
    7010201831df Bluetooth: L2CAP: Fix invalid response to L2CAP_ECRED_RECONF_REQ
    25c3e0de3b46 Remove WARN_ALL_UNSEEDED_RANDOM kernel config option
    64ccb0aac41c wifi: brcmfmac: Fix potential kernel oops when probe fails
    3c87b7e64735 wifi: cfg80211: wext: fix IGTK key ID off-by-one
    3e14ba8b95c9 dma-mapping: avoid random addr value print out on error path
    ceae058eb707 ksmbd: fix signededness bug in smb_direct_prepare_negotiation()
    0315bec883c6 ovpn: tcp - fix packet extraction from stream
    8178567c6a97 bnxt_en: Fix deleting of Ntuple filters
    079986d6db1f bnxt_en: Fix RSS context delete logic
    f27030ac5bef udplite: Fix null-ptr-deref in __udp_enqueue_schedule_skb().
    2d74412dfd36 net: ethernet: xscale: Check for PTP support properly
    cb8f0a385738 net: phy: qcom: qca807x: normalize return value of gpio_get
    9605406cf28f proc: Fix pointer error dereference
    f3970be26a30 net: usb: lan78xx: scan all MDIO addresses on LAN7801
    fc393af769af net: usb: kaweth: remove TX queue manipulation in kaweth_set_rx_mode
    664e9df53226 espintcp: Fix race condition in espintcp_close()
    b640188b61e6 psp: use sk->sk_hash in psp_write_headers()
    fe89b2f05b85 tcp: fix potential race in tcp_v6_syn_recv_sock()
    82c5acb68c63 ipv6: Move ipv6_fl_list from ipv6_pinfo to inet_sock.
    59581778792c xfrm: always flush state and policy upon NETDEV_UNREGISTER event
    f726b3a57e00 ipmi: ipmb: initialise event handler read bytes
    27e70f32aef0 xfrm: skip templates check for packet offload tunnel mode
    c7221e7bd8fc xfrm6: fix uninitialized saddr in xfrm6_get_saddr()
    5000ce7fcb31 iommu/amd: serialize sequence allocation under concurrent TLB invalidations
    a133e3caf844 ntb: ntb_hw_switchtec: Fix shift-out-of-bounds for 0 mw lut
    2346856b7482 ntb: ntb_hw_switchtec: Fix array-index-out-of-bounds access
    495d9cb4ed71 rtc: zynqmp: correct frequency value
    630ace4d8286 drm/amdgpu: avoid sdma ring reset in sriov
    7a7e7bcefdd3 drm/amd/display: Remove conditional for shaper 3DLUT power-on
    581ed1a5a957 arm64: hugetlbpage: avoid unused-but-set-parameter warning (gcc-16)
    dd6e15658ab5 ALSA: hda/hdmi: Add quirk for TUXEDO IBS14G6
    d70d2a8a491e ASoC: amd: amd_sdw: add machine driver quirk for Lenovo models
    c19830db30a0 btrfs: replace BUG() with error handling in __btrfs_balance()
    6af16f1b8649 ALSA: usb-audio: Add sanity check for OOB writes at silencing
    d6e933f29bc0 drm/radeon: Add HAINAN clock adjustment
    e341e1821503 spi: spidev: fix lock inversion between spi_lock and buf_lock
    91e19be60e08 drm/amd/display: bypass post csc for additional color spaces in dal
    e3c0c8384479 drm/amdgpu: Add HAINAN clock adjustment
    e949fd266cfa ALSA: usb-audio: Update the number of packets properly at receiving
    ef8b0cc691f1 ALSA: hda/realtek: Fix headset mic on ASUS Zenbook 14 UX3405MA
    8c545bcb1dab drm/amdgpu: Adjust usleep_range in fence wait
    89232d0db3ca drm/amdgpu: return when ras table checksum is error
    dea826897ea3 drm/amd/display: Avoid updating surface with the same surface under MPO
    a71819d2cc6f drm/amd/display: Fix system resume lag issue
    16b65c8ca316 ALSA: hda/tas2781: Ignore reset check for SPI device
    96c5ea9e7a82 regulator: core: Remove regulator supply_name length limit
    0be2f54012b4 ASoC: rt721-sdca: Fix issue of fail to detect OMTP jack type
    c57b6b4bc339 mshv: clear eventfd counter on irqfd shutdown
    8ee9aa80d4f1 drm/amdgpu: Skip vcn poison irq release on VF
    dce5da49f65c drm/amd/display: Fix writeback on DCN 3.2+
    b7af28b96ddc ARM: 9467/1: mm: Don't use %pK through printk
    88c624236ef0 include: uapi: netfilter_bridge.h: Cover for musl libc
    dbf5c7121810 ACPI: x86: Force enabling of PWM2 on the Yogabook YB1-X90
    5c4e940075bd thermal: int340x: Fix sysfs group leak on DLVR registration failure
    c1a0f5f1e5e7 libceph: define and enforce CEPH_MAX_KEY_LEN
    5b75c7f24973 ceph: supply snapshot context in ceph_uninline_data()
    57633b43a603 fs/ntfs3: avoid calling run_get_entry() when run == NULL in ntfs_read_run_nb_ra()
    b014372b6223 ntfs3: fix circular locking dependency in run_unpack_ex
    b67fb01429ff fs/ntfs3: drop preallocated clusters for sparse and compressed files
    9779a6eaaabd fs: ntfs3: fix infinite loop triggered by zero-sized ATTR_LIST
    c0b43c45d45f fs: ntfs3: fix infinite loop in attr_load_runs_range on inconsistent metadata
    b0ea441f44ce fs: ntfs3: check return value of indx_find to avoid infinite loop
    843dc5c21518 MIPS: Loongson: Make cpumask_of_node() robust against NUMA_NO_NODE
    54302ec38da4 iio: magnetometer: Remove IRQF_ONESHOT
    af51e8d99df7 iio: Use IRQF_NO_THREAD
    12cb0a166dc4 mfd: intel-lpss: Add Intel Nova Lake-S PCI IDs
    fcfa64c53586 Revert "mfd: da9052-spi: Change read-mask to write-mask"
    2a99af226fbb phy: fsl-imx8mq-usb: disable bind/unbind platform driver feature
    c3be09c3c85b phy: mvebu-cp110-utmi: fix dr_mode property read from dts
    c3beae1bed61 watchdog: rzv2h_wdt: Discard pm_runtime_put() return value
    d6014855a2cb watchdog: imx7ulp_wdt: handle the nowayout option
    17de6ad1c32b binder: don't use %pK through printk
    5b3350e03667 fix it87_wdt early reboot by reporting running timer
    812e5d3bcc1e serial: 8250: 8250_omap.c: Clear DMA RX running status only after DMA termination is done
    cbe7f4bc2dc1 serial: 8250: 8250_omap.c: Add support for handling UART error conditions
    af48c1a0abe8 staging: rtl8723bs: fix memory leak on failure path
    f4fbf2d4750d usb: chipidea: udc: fix DMA and SG cleanup in _ep_nuke()
    7a8ac86f5133 usb: gadget: f_fs: Fix ioctl error handling
    09820593b506 usb: gadget: f_fs: fix DMA-BUF OUT queues
    2de2659c206b iio: bmi270_i2c: Add MODULE_DEVICE_TABLE for BMI260/270
    e86bc719b061 pinctrl: renesas: rzt2h: Allow .get_direction() for IRQ function GPIOs
    d2975604bf1b misc: ti_fpc202: fix a potential memory leak in probe function
    b6cfbd470158 misc: eeprom: Fix EWEN/EWDS/ERAL commands for 93xx56 and 93xx66
    822019d7516b pinctrl: mediatek: make devm allocations safer and clearer in mtk_eint_do_init()
    3842f93e6e29 misc: bcm_vk: Fix possible null-pointer dereferences in bcm_vk_read()
    4e033a7215df phy: cadence-torrent: restore parent clock for refclk during resume
    4842c8739961 phy: ti: phy-j721e-wiz: restore mux selection during resume
    a6e099cda247 dmaengine: stm32-mdma: initialize m2m_hw_period and ccr to fix warnings
    bc25f81a3f6e dmaengine: sun6i: Choose appropriate burst length under maxburst
    af0b99b2214a most: core: fix resource leak in most_register_interface error paths
    f907623616f7 fpga: of-fpga-region: Fail if any bridge is missing
    2433adbe30bf usb: typec: ucsi: psy: Fix voltage and current max for non-Fixed PDOs
    006470339240 serial: 8250_dw: handle clock enable errors in runtime_resume
    31dcb6316e25 staging: rtl8723bs: fix missing status update on sdio_alloc_irq() failure
    487e455643c0 soundwire: intel_auxdevice: add cs42l45 codec to wake_capable_list
    c7ed6e59a58c soundwire: dmi-quirks: add mapping for Avell B.ON (OEM rebranded of NUC15)
    e7e5f19998a9 dmaengine: stm32-dma3: use module_platform_driver
    59e770749257 9p/xen: protect xen_9pfs_front_free against concurrent calls
    80a27fb114f7 m68k: nommu: fix memmove() with differently aligned src and dest for 68000
    479937252f44 HID: i2c-hid: Add FocalTech FT8112
    534dbb6422f9 clk: microchip: core: correct return value on *_get_parent()
    8d35f60ff0dc clk: renesas: rzg2l: Deassert reset on assert timeout
    f990244e0f07 clk: amlogic: remove potentially unsafe flags from S4 video clocks
    803e99ee0d60 mailbox: sprd: clear delivery flag before handling TX done
    c6bc63adddc3 remoteproc: mediatek: Break lock dependency to `prepare_lock`
    780185148d85 mailbox: sprd: mask interrupts that are not handled
    a60671946d85 mailbox: mchp-ipc-sbi: fix uninitialized symbol and other smatch warnings
    cf66aae883a5 mailbox: imx: Skip the suspend flag for i.MX7ULP
    2f41bbab5e32 mailbox: pcc: Remove spurious IRQF_ONESHOT usage
    95438699c929 mailbox: mchp-ipc-sbi: fix out-of-bounds access in mchp_ipc_get_cluster_aggr_irq()
    dd6c4b463209 remoteproc: imx_dsp_rproc: Skip RP_MBOX_SUSPEND_SYSTEM when mailbox TX channel is uninitialized
    359ca3038b77 tracing: Fix false sharing in hwlat get_sample()
    d451a01c5a14 riscv: vector: init vector context with proper vlenb
    62b650c4c0ac scsi: ufs: mediatek: Fix page faults in ufs_mtk_clk_scale() trace event
    25c429dd1178 vhost: fix caching attributes of MMIO regions by setting them explicitly
    59e14a18a7d5 scsi: buslogic: Reduce stack usage
    263fe43d8753 hisi_acc_vfio_pci: update status after RAS error
    9443fe6d05d1 ata: libata: avoid long timeouts on hot-unplugged SATA DAS
    ba5a09630ebb um: Preserve errno within signal handler
    7b7516ac611c hisi_acc_vfio_pci: fix the queue parameter anomaly issue
    61ad70c6c908 RDMA/rtrs-clt: For conn rejection use actual err number
    d527695c1df0 hisi_acc_vfio_pci: resolve duplicate migration states
    e9cc097427e8 nfc: nxp-nci: remove interrupt trigger type
    529eefdf9842 myri10ge: avoid uninitialized variable use
    fb108754550f PCI/bwctrl: Disable BW controller on Intel P45 using a quirk
    b8bd9fe67041 PCI: Mark Nvidia GB10 to avoid bus reset
    551f16cd696e PCI: Add ACS quirk for Qualcomm Hamoa & Glymur
    8d3fc66a008b PCI: Enable ACS after configuring IOMMU for OF platforms
    d60ed85b8419 PCI: Fix pci_slot_lock () device locking
    cad253d055e2 PCI/AER: Clear stale errors on reporting agents upon probe
    a175a7614738 PCI: Mark ASM1164 SATA controller to avoid bus reset
    14eae5564053 net/rds: Clear reconnect pending bit
    a036d058f5ef vmw_vsock: bypass false-positive Wnonnull warning with gcc-16
    c55ba9760662 net: usb: sr9700: remove code to drive nonexistent multicast filter
    90ecae0dece4 ptp: ptp_vmclock: add 'VMCLOCK' to ACPI device match
    5baf9dc03e84 bnxt_en: Allow ntuple filters for drops
    211958e72198 wifi: ath10k: fix lock protection in ath10k_wmi_event_peer_sta_ps_state_chg()
    0e12a252ec4b wifi: rtw89: pci: restore LDO setting after device resume
    2f4de7738ade net: sfp: add quirk for Lantech 8330-265D
    8052d0587fb1 octeontx2-af: Workaround SQM/PSE stalls by disabling sticky
    ea3f3de49cb6 Bluetooth: btusb: Add device ID for Realtek RTL8761BU
    c87634f7b51f Bluetooth: btusb: Add new VID/PID for RTL8852CE
    e1b2d0394c8b Bluetooth: hci_conn: use mod_delayed_work for active mode timeout
    113eeb6e2f94 Bluetooth: btusb: Add USB ID 0489:e112 for Realtek 8851BE
    a6cbc4f5a6fd Bluetooth: hci_conn: Set link_policy on incoming ACL connections
    4a300678ab7c Bluetooth: hci_qca: Fix SSR (SubSystem Restart) fail when BT_EN is pulled up by hw
    2d6160de5ff4 Bluetooth: btusb: Add support for MediaTek7920 0489:e158
    f7e05f08849f ipv4: fib: Annotate access to struct fib_alias.fa_state.
    ebeaa3b24ba5 wifi: rtw89: pci: validate release report content before using for RTL8922DE
    9e4da6e3907c wifi: iwlegacy: add missing mutex protection in il3945_store_measurement()
    998e57caaa46 wifi: iwlegacy: add missing mutex protection in il4965_store_tx_power()
    6b36e5c4741f net: hns3: extend HCLGE_FD_AD_QID to 11 bits
    b76eab322b7d ipv4: igmp: annotate data-races around idev->mr_maxdelay
    00b36860495b gro: change the BUG_ON() in gro_pull_from_frag0()
    afe908432e44 ext4: propagate flags to convert_initialized_extent()
    899ef00963ce net/rds: No shortcut out of RDS_CONN_ERROR
    4db148f74a99 wifi: rtw89: 8922a: add digital compensation for 2GHz
    98a774e2c58d wifi: rtw89: fix unable to receive probe responses under MLO connection
    6944aaa804af driver core: faux: stop using static struct device
    e1c24d4cd161 wifi: iwlwifi: mld: Fix primary link selection logic
    83f0bb907cc8 wifi: iwlwifi: mld: fix chandef start calculation
    1d49a42717bd wifi: iwlwifi: fix 22000 series SMEM parsing
    ece13ddb9791 wifi: iwlwifi: mvm: check the validity of noa_len
    f181a659909f wifi: iwlwifi: mld: Handle rate selection for NAN interface
    3d39d78b8d48 PCI: imx6: Add CLKREQ# override to enable REFCLK for i.MX95 PCIe
    9650627d0757 net: usb: r8152: fix transmit queue timeout
    a72959608698 openrisc: define arch-specific version of nop()
    5e13d0a37666 netfilter: xt_tcpmss: check remaining length before reading optlen
    29f51913cb77 netfilter: nf_conntrack: Add allow_clash to generic protocol handler
    74431472d16e ext4: use reserved metadata blocks when splitting extent on endio
    3b3c11f944bd ext4: mark group extend fast-commit ineligible
    bf5b60952449 ext4: move ext4_percpu_param_init() before ext4_mb_init()
    27a99fa31252 ext4: mark group add fast-commit ineligible
    c315d742675a ipv6: exthdrs: annotate data-race over multiple sysctl
    58e7c79cf0a3 ipv6: annotate data-races in net/ipv6/route.c
    7d4c7533b632 ipv6: annotate data-races over sysctl.flowlabel_reflect
    ccaff26fac79 ipv6: annotate data-races in ip6_multipath_hash_{policy,fields}()
    08e7ae48e175 wifi: cfg80211: allow only one NAN interface, also in multi radio
    8362565a6905 wifi: ath12k: fix mac phy capability parsing
    e8ce435b9b1f wifi: ath12k: fix preferred hardware mode calculation
    5358df6e61c6 wifi: ath11k: Fix failure to connect to a 6 GHz AP
    0e76bc37f192 wifi: ath11k: add pm quirk for Thinkpad Z13/Z16 Gen1
    4b4784394099 wifi: rtw89: disable EHT protocol by chip capabilities
    4d510f668f0f PCI: dw-rockchip: Disable BAR 0 and BAR 1 for Root Port
    717fc84f180d wifi: rtw89: wow: add reason codes for disassociation in WoWLAN mode
    fa8301c29079 wifi: rtw89: mac: correct page number for CSI response
    ef7fa19809b2 wifi: rtw89: pci: validate sequence number of TX release report
    ffbcca93034f wifi: rtw89: Add support for MSI AX1800 Nano (GUAX18N)
    e15768e68820 iommu/amd: move wait_on_sem() out of spinlock
    3308c7504e09 wifi: libertas: fix WARNING in usb_tx_block
    27272429732d rtla: Fix NULL pointer dereference in actions_parse
    1260bee01493 wifi: rtw89: fix potential zero beacon interval in beacon tracking
    fce7f6f63915 net: wwan: mhi: Add network support for Foxconn T99W760
    c7e5d819388e iommu/arm-smmu-v3: Improve CMDQ lock fairness and efficiency
    6cdb21e0c9fd dm: remove fake timeout to avoid leak request
    8f220e851a00 dm: replace -EEXIST with -EBUSY
    6b20fde2f14b wifi: rtw89: regd: 6 GHz power type marks default when inactive
    f85d790c3cb7 wifi: rtw88: Fix inadvertent sharing of struct ieee80211_supported_band data
    ad9b80ee310e wifi: rtw88: Use devm_kmemdup() in rtw_set_supported_band()
    6552d7992860 wifi: rtw89: mcc: reset probe counter when receiving beacon
    5a7362a3b613 wifi: rtw89: setting TBTT AGG number when mac port initialization
    efa0f7fa3a43 wifi: rtw89: ser: enable error IMR after recovering from L1
    232418bbe026 wifi: rtw89: 8922a: set random mac if efuse contains zeroes
    e1958f4d66a5 wifi: rtw88: rtw8821cu: Add ID for Mercusys MU6H
    509becaee568 wifi: rtw88: 8822b: Avoid WARNING in rtw8822b_config_trx_mode()
    3cf7a584327a wifi: rtw88: fix DTIM period handling when conf->dtim_period is zero
    cf0e2c831361 PCI: dwc: Skip PME_Turn_Off broadcast and L2/L3 transition during suspend if link is not up
    fe136426e30c jfs: nlink overflow in jfs_rename
    974dac536e8c jfs: Add missing set_freezable() for freezable kthread
    8e5297128563 ALSA: usb-audio: Add iface reset and delay quirk for AB13X USB Audio
    e6645e625480 ALSA: mixer: oss: Add card disconnect checkpoints
    572e4274251f ALSA: hda/realtek - Enable mute LEDs on HP ENVY x360 15-es0xxx
    2d8f056e9c68 ASoC: fsl: imx-rpmsg: use snd_soc_find_dai_with_mutex() in probe
    c3ac651a4f89 spi: geni-qcom: Fix abort sequence execution for serial engine errors
    42068f7dd42b ASoC: SOF: Intel: hda: Fix NULL pointer dereference
    9da857e6b5fd power: sequencing: fix missing state_lock in pwrseq_power_on() error path
    aba5b98c4108 modpost: Amend ppc64 save/restfpr symnames for -Os build
    cafea2adb358 ASoC: es8328: Add error unwind in resume
    460796f33df7 HID: logitech-hidpp: Add support for Logitech K980
    c8cde3ddd12a hwmon: (nct7363) Fix a resource leak in nct7363_present_pwm_fanin
    5e13b9b341ee hwmon: (f71882fg) Add F81968 support
    3fa44a5e3bc7 hwmon: (emc2305) Fix a resource leak in emc2305_of_parse_pwm_child
    da684ff541a4 hwmon: (nct6683) Add customer ID for ASRock Z590 Taichi
    cabde1dddad3 hwmon: (nct6775) Add ASUS Pro WS WRX90E-SAGE SE
    3f0aa5f0794a hwmon: (dell-smm) Add support for Dell OptiPlex 7080
    ff0827301718 ASoC: codecs: max98390: Check return value of devm_gpiod_get_optional() in max98390_i2c_probe()
    f752cc300fa0 spi: cadence-qspi: Try hard to disable the clocks
    cf2a37be899d drm/amdgpu: validate user queue size constraints
    25c5065bb676 drm/amd/display: avoid dig reg access timeout on usb4 link training fail
    2d02b419ef8d drm/amd/display: Fix GFX12 family constant checks
    30ed220ddcb8 spi: spi-mem: Protect dirmap_create() with spi_mem_access_start/end
    588faab060c5 ASoC: sunxi: sun50i-dmic: Add missing check for devm_regmap_init_mmio
    ffb5fde572e9 gpio: aspeed-sgpio: Change the macro to support deferred probe
    62914b5c2955 ALSA: hda/realtek: fix LG Gram Style 14 speakers
    06d929be1132 ALSA: hda/conexant: Add headset mic fix for MECHREVO Wujie 15X Pro
    a36e053b1680 HID: elecom: Add support for ELECOM HUGE Plus M-HT1MRBK
    37914cef17ee media: uvcvideo: Create an ID namespace for streaming output terminals
    882974699753 HID: multitouch: add eGalaxTouch EXC3188 support
    16790e7e2987 drm/amd/display: Revert "init dispclk from bootup clock for DCN315"
    37282c9129fd media: rkisp1: Fix filter mode register configuration
    7b4d0fab3ff2 drm/atmel-hlcdc: fix use-after-free of drm_crtc_commit after release
    f1f3e18596e2 drm/atmel-hlcdc: don't reject the commit if the src rect has fractional parts
    082271e364a3 drm/atmel-hlcdc: fix memory leak from the atomic_destroy_state callback
    1e89f8a2e8b0 drm/amd/display: Ensure link output is disabled in backend reset for PLL_ON
    5f0c5775d4ee drm/amd/display: Disable FEC when powering down encoders
    bc8b167f031a PCI: Add Intel Nova Lake audio Device ID
    d5262b2ee062 ASoC: soc-acpi-intel-arl-match: change rt722 amp endpoint to aggregated
    cfe928c39b48 virt: vbox: uapi: Mark inner unions in packed structs as packed
    b856cf4a1550 hyper-v: Mark inner union in hv_kvp_exchg_msg_value as packed
    79f42487ed60 drm: renesas: rz-du: mipi_dsi: fix kernel panic when rebooting for some panels
    cb8b9a1755fe drm: Account property blob allocations to memcg
    662ec0a17b50 drm/amdkfd: Fix GART PTE for non-4K pagesize in svm_migrate_gart_map()
    acfc84cfa70a drm/amdkfd: Relax size checking during queue buffer get
    6eb9fc7d451c ALSA: usb-audio: presonus s18xx uses little-endian
    9745c2561e55 ALSA: hda/realtek: add HP Victus 16-e0xxx mute LED quirk
    c626a9b6b7ff media: ipu6: Always close firmware stream
    eb7cdb7ab50b media: ipu6: Close firmware streams on streaming enable failure
    5d5190cbc4bb media: ipu6: Ensure stream_mutex is acquired when dealing with node list
    e913d0d8e26c media: mt9m114: Return -EPROBE_DEFER if no endpoint is found
    7bccb94dff56 media: mt9m114: Avoid a reset low spike during probe()
    b02bcb378efa media: v4l2-async: Fix error handling on steps after finding a match
    2e9d6b58ab81 media: qcom: camss: Do not enable cpas fast ahb clock for SM8550 VFE lite
    b7210170b10e media: cx25821: Fix a resource leak in cx25821_dev_setup()
    d29f33b2cf98 media: solo6x10: Check for out of bounds chip_id
    2011929f0e4c media: pvrusb2: fix URB leak in pvr2_send_request_ex
    d484d11030aa media: adv7180: fix frame interval in progressive mode
    2f5427d8726b drm/panel: Fix a possible null-pointer dereference in jdi_panel_dsi_remove()
    7c0feaa0026b media: amphion: Clear last_buffer_dequeued flag for DEC_CMD_START
    efa59cc2142d cgroup/cpuset: Don't fail cpuset.cpus change in v2
    b725955d651d spi: spi-mem: Limit octal DTR constraints to octal DTR situations
    677681a41fc9 ASoC: wm8962: Don't report a microphone if it's shorted to ground on plug
    669220b2fca6 ASoC: wm8962: Add WM8962_ADC_MONOMIX to "3D Coefficients" mask
    a85e45fcff1b drm/xe: Only toggle scheduling in TDR if GuC is running
    dc3097ef16e7 drm/amd/display: only power down dig on phy endpoints
    2b9e44b3849f drm/amdgpu: Skip loading SDMA_RS64 in VF
    409d19050cde HID: multitouch: add quirks for Lenovo Yoga Book 9i
    5ed818e9560f HID: pidff: Do not set out of range trigger button
    18750cac9b01 HID: apple: Add "SONiX KN85 Keyboard" to the list of non-apple keyboards
    e9e477d3197f drm/amdgpu: Refactor amdgpu_gem_va_ioctl for Handling Last Fence Update and Timeline Management v4
    486b2909ac28 drm/amd/display: Add signal type check for dcn401 get_phyd32clk_src
    f58458249d86 drm/amdgpu: avoid a warning in timedout job handler
    c10fe9471f3a drm/amd/display: Fix dsc eDP issue
    0b1005d5ca9a drm/amdgpu: add support for HDP IP version 6.1.1
    20e248df7341 media: mediatek: vcodec: Don't try to decode 422/444 VP9
    b173ba3365ff drm/panel: edp: add BOE NV140WUM-T08 panel
    5e702ee8c7f5 media: chips-media: wave5: Process ready frames when CMD_STOP sent to Encoder
    b607b5e2c62b media: chips-media: wave5: Fix conditional in start_streaming
    98c62dacabbd media: omap3isp: set initial format
    7ab5e86088f2 media: omap3isp: isppreview: always clamp in preview_try_format()
    dd1bdabe47bc media: omap3isp: isp_video_mbus_to_pix/pix_to_mbus fixes
    0290934d30ab drm/v3d: Set DMA segment size to avoid debug warnings
    bb09f4584aa2 spi: stm32: fix Overrun issue at < 8bpw
    acd80343470e gpio: pca953x: Add support for TCAL6408 TCAL6416
    bbc6e7fc432c media: dvb-core: dmxdevfilter must always flush bufs
    f88cd8da2d28 ASoC: SOF: ipc4: Support for sending payload along with LARGE_CONFIG_GET
    59b888198843 drm/amd/display: Don't disable DPCD mst_en if sink connected
    7df6fe98b24d drm/amd/display: Add USB-C DP Alt Mode lane limitation in DCN32
    08dca4c8099a spi: cadence-quadspi: Parse DT for flashes with the rest of the DT parsing
    00f77947972e spi-geni-qcom: use xfer->bits_per_word for can_dma()
    97872d00da3c spi-geni-qcom: initialize mode related registers to 0
    b3d6ca4f27d4 drm/amdkfd: Handle GPU reset and drain retry fault race
    0bd968c04acf drm/panel-edp: Add AUO B140QAX01.H panel
    79c5cbeba6b0 drm/amd/display: Guard FAMS2 configuration updates
    7ad1f6f9476b drm/amd/display: Correct FIXED_VS Link Rate Toggle Condition
    0b7f78caeffa drm/amdgpu/ras: Move ras data alloc before bad page check
    a25cf4a927a7 drm/amdgpu: fix the calculation of RAS bad page number
    276028fd9b60 drm/amdgpu: fix NULL pointer issue buffer funcs
    31a1fb32f5eb accel/amdxdna: Fix tail-pointer polling in mailbox_get_msg()
    6ca4647a7415 gpu/panel-edp: add AUO panel entry for B140HAN06.4
    d380351cbefe drm/xe/xe3_lpg: Apply Wa_16028005424
    49355c85b4cd drm/panthor: Always wait after sending a command to an AS
    4d2ccdea18b5 drm/display/dp_mst: Add protection against 0 vcpi
    86017c455e0a drm/xe/vm: Skip ufence association for CPU address mirror VMA during MAP
    e72721081bd1 drm/xe: Covert return of -EBUSY to -ENOMEM in VM bind IOCTL
    2583ab12055d drm/xe/ggtt: Use scope-based runtime pm
    3db57975e988 parisc: Prevent interrupts during reboot
    707a77b9c6fd x86/sev: Use kfree_sensitive() when freeing a SNP message descriptor
    45395efdf6a6 soc: imx8m: Fix error handling for clk_prepare_enable()
    456775382708 arm64: tegra: smaug: Add usb-role-switch support
    6e1486257a2e EDAC/igen6: Add two Intel Amston Lake SoCs support
    3a72bf74f50a EDAC/igen6: Add more Intel Panther Lake-H SoCs support
    3983ef126e43 Revert "arm64: zynqmp: Add an OP-TEE node to the device tree"
    919785992a37 firmware: arm_ffa: Unmap Rx/Tx buffers on init failure
    2c99326dc1c7 pstore: ram_core: fix incorrect success return when vmap() fails
    db702ef6d914 sched/debug: Fix updating of ppos on server write ops
    c075eb0d220d char: tpm: cr50: Remove IRQF_ONESHOT
    4fa6bfa6dc2d mailbox: bcm-ferxrm-mailbox: Use default primary handler
    aaaa758294fb crypto: hisilicon/qm - move the barrier before writing to the mailbox register
    a048eb4e37ea bpftool: Fix dependencies for static build
    aee8db5f0486 PCI/MSI: Unmap MSI-X region on error
    716f777b6c9b clocksource/drivers/timer-integrator-ap: Add missing Kconfig dependency on OF
    bc59d5f3afe4 clocksource/drivers/sh_tmu: Always leave device running after probe
    1088d3cb5b5b arm64/ftrace,bpf: Fix partial regs after bpf_prog_run
    e1886b473131 perf/core: Fix slow perf_event_task_exit() with LBR callstacks
    df02c3ff3be4 bpf: Properly mark live registers for indirect jumps
    aae391a79f2a genirq/cpuhotplug: Notify about affinity changes breaking the affinity mask
    4c122e8ae149 bpf: Recognize special arithmetic shift in the verifier
    c1357b496286 bpf: net_sched: Use the correct destructor kfunc type
    50d6fd69388c bpf: crypto: Use the correct destructor kfunc type
    c67bbeb87aea gendwarfksyms: Fix build on 32-bit hosts
    cf9e5b8b9e31 perf/x86/intel: Add Airmont NP
    40497751c3f9 perf/x86/cstate: Add Airmont NP
    89571b4a886f perf/x86/msr: Add Airmont NP
    501c84f42b89 irqchip/riscv-imsic: Add a CPU pm notifier to restore the IMSIC on exit
    bad352600722 bpf: verifier improvement in 32bit shift sign extension pattern
    c6a27aa65852 sparc: don't reference obsolete termio struct for TC* constants
    6560e1d1fa32 sparc: Synchronize user stack on fork and clone
    f15b4e9286c7 block: decouple secure erase size limit from discard size limit
    ea53119b1dff blk-mq-sched: unify elevators checking for async requests
    40932ac2433e blk-mq-debugfs: add missing debugfs_mutex in blk_mq_debugfs_register_hctxs()
    d39d675a4303 xenbus: Use .freeze/.thaw to handle xenbus devices
    11d591f1d70e ACPI: battery: fix incorrect charging status when current is zero
    baeecf1ac9e8 ACPI: x86: s2idle: Invoke Microsoft _DSM Function 9 (Turn On Display)
    da0ce17c9d5c perf/cxlpmu: Replace IRQF_ONESHOT with IRQF_NO_THREAD
    8e6ea0b484fa s390/perf: Disable register readout on sampling events
    f5b48df92c1c cpufreq: dt-platdev: Block the driver from probing on more QC platforms
    e8d10ef5988e rust: cpufreq: always inline functions using build_assert with arguments
    24783dd06de8 md raid: fix hang when stopping arrays with metadata through dm-raid
    721599e837d3 md-cluster: fix NULL pointer dereference in process_metadata_update
    03e42b5f7ad4 alpha: fix user-space corruption during memory compaction
    bfc1a95012c4 io_uring/timeout: annotate data race in io_flush_timeouts()
    790a984e34f3 powercap: intel_rapl: Add PL4 support for Ice Lake
    2a9bf565d6fe ACPICA: Abort AML bytecode execution when executing AML_FATAL_OP
    62dfb8ac00a5 ACPI: resource: Add JWIPC JVC9100 to irq1_level_low_skip_override[]
    29f60d3d0681 ACPI: processor: Fix NULL-pointer dereference in acpi_processor_errata_piix4()
    25b290624b0e EFI/CPER: don't go past the ARM processor CPER record buffer
    136093ba4161 APEI/GHES: ARM processor Error: don't go past allocated memory
    6f5d41984ad8 APEI/GHES: ensure that won't go past CPER allocated record
    a8419f5f2c5f EFI/CPER: don't dump the entire memory region
    142c444a395f ntfs: ->d_compare() must not block
    6d61077981cf x86/xen/pvh: Enable PAE mode for 32-bit guest only when CONFIG_X86_PAE is set
    c94ede3c436d rnbd-srv: Zero the rsp buffer before using it
    fd51d47fcace arm64: Add support for TSV110 Spectre-BHB mitigation
    f4ac7292b635 perf/arm-cmn: Support CMN-600AE
    8c7fdc39e38a s390/purgatory: Add -Wno-default-const-init-unsafe to KBUILD_CFLAGS
    c7671c46dab4 tools/power cpupower: Reset errno before strtoull()
    f699251d5a2d s390/boot: Add -Wno-default-const-init-unsafe to KBUILD_CFLAGS
    f0729486c907 tools/cpupower: Fix inverted APERF capability check
    6287eefaf21e smb: client: prevent races in ->query_interfaces()
    2e121c53b581 gfs2: fiemap page fault fix
    327de5b59801 smb: client: add proper locking around ses->iface_last_update
    be0d85bc660a netfs: when subreq is marked for retry, do not check if it faced an error
    66c3be4ac35d btrfs: handle user interrupt properly in btrfs_trim_fs()
    4d49275175fd btrfs: fallback to buffered IO if the data profile has duplication
    082083c9fbd9 dlm: validate length in dlm_search_rsb_tree
    31fefc18096c minix: Add required sanity checking to minix_check_superblock()
    75903591f869 dlm: fix recovery pending middle conversion
    0e5806ef45f2 i3c: mipi-i3c-hci: Reset RING_OPERATION1 fields during init
    a2198bf95a4a i3c: mipi-i3c-hci: Stop reading Extended Capabilities if capability ID is 0
    98ddff8a90f8 i3c: master: svc: Initialize 'dev' to NULL in svc_i3c_master_ibi_isr()
    67407d6abc95 hfsplus: pretend special inodes as regular files
    a2e8c144299c audit: add missing syscalls to read class
    c6f2c554dd8b kselftest/kublk: include message in _Static_assert for C11 compatibility
    42c32d7571cc fs/buffer: add alert in try_to_free_buffers() for folios without buffers
    956b1d8051cf hfsplus: fix volume corruption issue for generic/498
    4fed776ca863 audit: add fchmodat2() to change attributes class
    54694417d438 hfsplus: fix volume corruption issue for generic/480
    f13680f62934 statmount: permission check should return EPERM
    f987cbd82eb4 rtc: interface: Alarm race handling should not discard preceding error
    e1105da95214 perf test: Fix test case perftool-testsuite_report for s390
    68ab096e361d libperf build: Always place libperf includes first
    b0ae7a8272bf perf build: Remove NO_LIBCAP that controls nothing
    7f686fb319e6 perf vendor events amd: Fix Zen 5 MAB allocation events
    13458b3b3df7 perf annotate: Fix BUILD_NONDISTRO=1 missing args->ms conversions to pointer
    8943b2c49bd8 tools headers: Go back to include asm-generic/unistd.h for arm64
    0abe77dcaca7 perf annotate: Fix memcpy size in arch__grow_instructions()
    59a7c3c9c312 perf tests sched: Avoid error in cleanup on loaded machines
    ddbf249d9923 perf maps: Fix reference count leak in maps__find_ams()
    77c08fedf3f4 perf annotate: Fix args leak of map_symbol
    a7819ced00b9 perf cs-etm: Fix decoding for sparse CPU maps
    8d0cf138d183 perf tools: Get debug info of DSO properly
    82b1f2b0e7ab perf symbol-elf: Fix leak of ELF files with GNU debugdata
    055b4bce85bf rtc: max31335: use correct CONFIG symbol in IS_REACHABLE()
    46a204477893 libsubcmd: Fix null intersection case in exclude_cmds()
    68a9c15032e8 perf callchain: Fix srcline printing with inlines
    27c53054d593 perf unwind-libdw: Fix invalid reference counts
    62f730d55aac perf build: Raise minimum shellcheck version to 0.7.2
    3b14096e0c9f perf test stat tests: Fix for virtualized machines
    b7621a279de3 perf test stat: Update test expectations and events
    df0dc1b06fb6 Linux 6.18.15
    c1f305ac054f netfilter: nf_tables: add .abort_skip_removal flag for set types
    2ad6657a787f Linux 6.18.14
    bcf08144a20a ata: libata-core: fix cancellation of a port deferred qc work
    33abac5b5a53 ata: libata-eh: correctly handle deferred qc timeouts
    a488528a7182 drm/amd/display: Add an hdmi_hpd_debounce_delay_ms module
    a86c53332a81 net: stmmac: dwmac-loongson: Set clk_csr_i to 100-150MHz
    ff763ac97713 drm/amd/display: Clear HDMI HPD pending work only if it is enabled
    5566ebcf41ae selftests/bpf: Test bpf_skb_check_mtu(BPF_MTU_CHK_SEGS) when transport_header is not set
    73c2a1255f0f io_uring/rsrc: clean up buffer cloning arg validation
    b20266f1880b Drivers: hv: vmbus: Use kthread for vmbus interrupts on PREEMPT_RT
    4949e32387fe drm/exynos: vidi: fix to avoid directly dereferencing user pointer
    b5fc86d753dd drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
    5c8e29b5208b ALSA: hda/realtek: Add quirk for Samsung Galaxy Book3 Pro 360 (NP965QFG)
    356a6afadb44 ALSA: hda/conexant: Fix headphone jack handling on Acer Swift SF314
    6cadda9d1921 ALSA: hda/realtek: Add quirk for Gigabyte G5 KF5 (2023)
    84dbf4feaa93 ASoC: dt-bindings: asahi-kasei,ak5558: Fix the supply names
    1c1148cbebad ASoC: dt-bindings: asahi-kasei,ak4458: Fix the supply names
    8562d921e4ee ASoC: dt-bindings: asahi-kasei,ak4458: set unevaluatedProperties:false
    a16695e3ac32 dt-bindings: media: qcom,qcs8300-camss: Add missing power supplies
    05072d352ed1 dt-bindings: phy: qcom-edp: Add missing clock for X Elite
    c20f92521424 SUNRPC: fix gss_auth kref leak in gss_alloc_msg error path
    d79b9097a6a2 SUNRPC: auth_gss: fix memory leaks in XDR decoding error paths
    888cd7e40adb ata: libata-scsi: avoid Non-NCQ command starvation
    410336fc82ac ata: libata-scsi: refactor ata_scsi_translate()
    62a16b2e3ce9 ata: pata_ftide010: Fix some DMA timings
    3be216fd6f89 ext4: use optimized mballoc scanning regardless of inode format
    34c803edc0b3 ext4: always allocate blocks only from groups inode can use
    3924aea2c33d ext4: fix dirtyclusters double decrement on fs shutdown
    29a07d691d28 ext4: fix e4b bitmap inconsistency reports
    12615ab4bfb6 ext4: fix memory leak in ext4_ext_shift_extents()
    808f3191498f ext4: drop extent cache when splitting extent fails
    c2ee51d684ad ext4: drop extent cache after doing PARTIAL_VALID1 zeroout
    5b1f42904533 ext4: don't cache extent during splitting extent
    d67c8ecf3d8f ext4: don't zero the entire extent if EXT4_EXT_DATA_PARTIAL_VALID1
    f86ddca5e419 ext4: subdivide EXT4_EXT_DATA_VALID1
    561834f6d6f5 MIPS: Work around LLVM bug when gp is used as global register variable
    fc086c0ce3db usb: cdns3: fix role switching during resume
    557f65399133 drm/amd/display: Use same max plane scaling limits for all 64 bpp formats
    9fbb4f14462f ASoC: rockchip: i2s-tdm: Use param rate if not provided by set_sysclk
    7e92f716a55b x86/hyperv: Fix error pointer dereference
    d7cf2314dd5e btrfs: fix invalid leaf access in btrfs_quota_enable() if ref key not found
    6ca11deb6c94 btrfs: use the correct type to initialize block reserve for delayed refs
    55d02a533a8a btrfs: reset block group size class when it becomes empty
    74fcfce2a5ee btrfs: reduce block group critical section in btrfs_free_reserved_bytes()
    38944f3c5006 btrfs: remove fs_info argument from btrfs_try_granting_tickets()
    9b18bf59977f efi: Fix reservation of unaccepted memory table
    7098d3743105 gpio: amd-fch: ionly return allowed values from amd_fch_gpio_get()
    778f326af79f drm/xe/bo: Redirect faults to dummy page for wedged device
    ed945276a76e drm/xe: Make xe_modparam.force_vram_bar_size signed
    940b8daa5290 drm/xe/xe2_hpg: Fix handling of Wa_14019988906 & Wa_14019877138
    ef074e9bee05 drm/xe/mmio: Avoid double-adjust in 64-bit reads
    5ba475d1f341 drm/xe/configfs: Fix 'parameter name omitted' errors
    0c42190a2f26 s390/kexec: Make KEXEC_SIG available when CONFIG_MODULES=n
    0f93a80eb3fd spi: wpcm-fiu: Fix potential NULL pointer dereference in wpcm_fiu_probe()
    263e28add4f4 drm/amd/display: Fix out-of-bounds stream encoder index v3
    8eb62f5adc12 drm/amd/display: Reject cursor plane on DCE when scaled differently than primary
    2b36c0c1bcbb drm/amdkfd: Fix watch_id bounds checking in debug address watch v2
    96f42087b058 PCI: Validate window resource type in pbus_select_window_for_type()
    e37630e34e24 ASoC: codecs: aw88261: Fix erroneous bitmask logic in Awinic init
    63680351142e drm/i915/acpi: free _DSM package when no connectors
    9a2a5da00277 ASoC: fsl_xcvr: Revert fix missing lock in fsl_xcvr_mode_put()
    a62afa5a595e mshv: fix SRCU protection in irqfd resampler ack handler
    ca2eff361786 drm/amdgpu/sdma6: enable queue resets unconditionally
    5211aa12e46f drm/amdgpu/sdma5.2: enable queue resets unconditionally
    0d8ba96c792f drm/amdgpu/sdma5: enable queue resets unconditionally
    3759040d6d7c drm/amdgpu: move reset debug disable handling
    2fef8c2ac67e drm/amdgpu: Fix memory leak in amdgpu_ras_init()
    9ae85b0c1909 drm/amdgpu: Use kvfree instead of kfree in amdgpu_gmc_get_nps_memranges()
    d1370ef2ecf7 drm/amdgpu: Fix memory leak in amdgpu_acpi_enumerate_xcc()
    aebd195e9305 apparmor: fix aa_label to return state from compount and component match
    1d2b2b58fde9 apparmor: fix invalid deref of rawdata when export_binary is unset
    80c334acc6d0 apparmor: avoid per-cpu hold underflow in aa_get_buffer
    4610d536ff09 apparmor: make label_match return a consistent value
    9ef25645775b apparmor: remove apply_modes_to_perms from label_match
    9bf1fa150775 apparmor: fix rlimit for posix cpu timers
    b2a8011ae874 apparmor: move check for aa_null file to cover all cases
    7757757908e0 apparmor: account for in_atomic removal in common_file_perm
    f3cb5e58a65d apparmor: drop in_atomic flag in common_mmap, and common_file_perm
    1eadeb462ec3 apparmor: fix boolean argument in apparmor_mmap_file
    ac8f179e5c9e apparmor: return -ENOMEM in unpack_perms_table upon alloc failure
    e027999049c4 apparmor: Fix & Optimize table creation from possibly unaligned memory
    23f112bd6144 AppArmor: Allow apparmor to handle unaligned dfa tables
    ccb66a3c6c8f apparmor: fix NULL sock in aa_sock_file_perm
    fea017a7f6ab apparmor: fix NULL pointer dereference in __unix_needs_revalidation
    d80311e398eb net/mlx5e: Use unsigned for mlx5e_get_max_num_channels
    4329514c61ab net/mlx5e: Fix deadlocks between devlink and netdev instance locks
    54522509cb9a net/mlx5: Fix misidentification of write combining CQE during poll loop
    b13e896fc47e net/mlx5: Fix multiport device check over light SFs
    fef13c403be3 bonding: alb: fix UAF in rlb_arp_recv during bond up/down
    02baf80d1e33 bnge: fix reserving resources from FW
    f5a1f13c9e0f eth: fbnic: Advertise supported XDP features.
    72726d22786b octeontx2-af: Fix default entries mcam entry action
    9be9100774b5 ipv6: icmp: remove obsolete code in icmpv6_xrlim_allow()
    66036be40f7f inet: move icmp_global_{credit,stamp} to a separate cache line
    2c7384dbfd6a icmp: prevent possible overflow in icmp_global_allow()
    d7eaa006c044 eth: fbnic: Add validation for MTU changes
    d34f7a8aa9a2 macvlan: observe an RCU grace period in macvlan_common_newlink() error path
    2a06576b611e selftests: tc_actions: don't dump 2MB of \0 to stdout
    d96b0d661ef0 ping: annotate data-races in ping_lookup()
    4e34deebfb88 net: psp: select CONFIG_SKB_EXTENSIONS
    5c939ebbd72f bpftool: Fix truncated netlink dumps
    71b5fc8e8e17 ipv6: fix a race in ip6_sock_set_v6only()
    dbd0af8083dd netfilter: nf_tables: fix use-after-free in nf_tables_addchain()
    50422613185d net: remove WARN_ON_ONCE when accessing forward path array
    bae53b3baf2f ipvs: do not keep dest_dst if dev is going down
    9a6b2ba7367f netfilter: nf_conntrack_h323: don't pass uninitialised l3num value
    96815220626b selftests: forwarding: vxlan_bridge_1d_ipv6: fix test failure with br_netfilter enabled
    a6187e1d47f3 selftests: forwarding: vxlan_bridge_1d: fix test failure with br_netfilter enabled
    fae260fc84e1 net: bridge: mcast: always update mdb_n_entries for vlan contexts
    024355273593 net/rds: rds_sendmsg should not discard payload_len
    654780dee9ea xen-netback: reject zero-queue configuration from guest
    36c28b028efb net: usb: catc: enable basic endpoint checking
    f998b2c4bec4 ovpn: tcp - don't deref NULL sk_socket member after tcp_close()
    c55ba7501f97 eth: fbnic: set DMA_HINT_L4 for all flows
    aa090d2346de eth: fbnic: increase FBNIC_HDR_BYTES_MIN from 128 to 256 bytes
    9f441ef91452 eth: fbnic: set FBNIC_QUEUE_RDE_CTL0_EN_HDR_SPLIT on RDE_CTL0
    9f9600daaa49 eth: fbnic: Configure RDE settings for pause frame
    ca2a44b31c4d bpf: Add a map/btf from a fd array more consistently
    eac65c272f3b bpf: Fix a potential use-after-free of BTF object
    068708543a85 libbpf: Fix invalid write loop logic in bpf_linker__add_buf()
    223cfef4812b fbnic: close fw_log race between users and teardown
    37954733984f net: sparx5/lan969x: fix PTP clock max_adj value
    03b5051e02f5 ipv6: Fix out-of-bound access in fib6_add_rt2node().
    d1410317337c selftests: netconsole: Increase port listening timeout
    a0070e9635fd selftests: netconsole: remove log noise due to socat exit
    51c32ae7fae1 net: mscc: ocelot: add missing lock protection in ocelot_port_xmit_inj()
    2a90d6b83700 net: mscc: ocelot: split xmit into FDMA and register injection paths
    6eb26695a4b2 net: mscc: ocelot: extract ocelot_xmit_timestamp() helper
    fa79b29cc926 net: sparx5/lan969x: fix DWRR cost max to match hardware register width
    b1f23df09e7d net: stmmac: fix oops when split header is enabled
    9e9f1263e210 net: stmmac: replace has_xxxx with core_type
    ee231568d57d net: stmmac: remove broken PCS code
    87b7321ddc7d selftests: net: lib: Fix jq parsing error
    dfd9571c31ef selftests: mlxsw: tc_restrictions: Fix test failure with new iproute2
    f4edf0c7d216 ovpn: fix VPN TX bytes counting
    3e4fbcb4e078 ovpn: fix possible use-after-free in ovpn_net_xmit
    6f076ba274e2 ovpn: set sk_user_data before overriding callbacks
    63ae78336f40 cpuidle: Skip governor when only one idle state is available
    b800728a8aef ACPI: PM: Add unused power resource quirk for THUNDEROBOT ZERO
    43fcc84cd971 objpool: fix the overestimation of object pooling metadata size
    f6bc23794fa0 selftests/memfd: use IPC semaphore instead of SIGSTOP/SIGCONT
    f056c340b739 kbuild: Add objtool to top-level clean target
    ba16fb47e897 powercap: intel_rapl_tpmi: Remove FW_BUG from invalid version check
    02978747e907 ACPI: CPPC: Fix remaining for_each_possible_cpu() to use online CPUs
    78942172d5bf fs/ntfs3: Fix slab-out-of-bounds read in DeleteIndexEntryRoot
    4bf3bafb8e06 fs/ntfs3: prevent infinite loops caused by the next valid being the same
    5a30cc03bde1 fs/ntfs3: Initialize new folios before use
    5e573e778364 io_uring/cancel: de-unionize file and user_data in struct io_cancel_data
    a9d157a9bd38 io_uring: delay sqarray static branch disablement
    c76647799272 drbd: always set BLK_FEAT_STABLE_WRITES
    bda244871179 dmaengine: fsl-edma: don't explicitly disable clocks in .remove()
    0832e88bc69f backlight: qcom-wled: Change PM8950 WLED configurations
    54540e574092 backlight: qcom-wled: Support ovp values for PMI8994
    784936cad37b leds: qcom-lpg: Check the return value of regmap_bulk_write()
    4f45047e3bf0 leds: expresswire: Fix chip state breakage
    3c7d637bfc3d pinctrl: canaan: k230: Fix NULL pointer dereference when parsing devicetree
    e2e367e56bac pinctrl: single: fix refcount leak in pcs_add_gpio_func()
    fc356d8c3042 pinctrl: meson: amlogic-a4: Fix device node reference leak in bank helpers
    a851ed0ff901 pinctrl: qcom: sm8250-lpass-lpi: Fix i2s2_data_groups definition
    7446125afb6d pidfs: return -EREMOTE when PIDFD_GET_INFO is called on another ns
    21aff1255d72 mips: LOONGSON32: drop a dangling Kconfig symbol
    517d9f2b9630 iio: sca3000: Fix a resource leak in sca3000_probe()
    8ae999c410e2 ovl: Fix uninit-value in ovl_fill_real
    a5f1f8ebc6e2 pinctrl: equilibrium: Fix device node reference leak in pinbank_init()
    18a3ebff869c mcb: fix incorrect sanity check
    ab08bb8363b4 nvmem: an8855: drop an unused Kconfig symbol
    0c930fcadb2f usb: bdc: fix sleep during atomic
    9b8c7a25809e drivers: iio: mpu3050: use dev_err_probe for regulator request
    bedc5b06493c mfd: simple-mfd-i2c: Add Delta TN48M CPLD support
    5a4923726a16 mfd: arizona: Fix regulator resource leak on wm5102_clear_write_sequencer() failure
    8e7d8aca8811 Revert "mmc: rtsx_pci_sdmmc: increase power-on settling delay to 5ms"
    38a07194bbcd coresight: tmc-etr: Fix race condition between sysfs and perf mode
    dd8b9ba3d970 phy: freescale: imx8qm-hsio: fix NULL pointer dereference
    1bec5f283dd5 coresight: etm3x: Fix cpulocked warning on cpuhp
    8665e18a707c watchdog: starfive-wdt: Fix PM reference leak in probe error path
    a75046f2efad iio: pressure: mprls0025pa: fix pressure calculation
    b61512ff73d2 iio: pressure: mprls0025pa: fix scan_type struct
    0beeade4823b iio: pressure: mprls0025pa: fix interrupt flag
    285af88d5da1 iio: pressure: mprls0025pa: fix SPI CS delay violation
    664ffdf34c01 iio: pressure: mprls0025pa: fix spi_transfer struct initialisation
    37fb15537cc0 mmc: rtsx_pci_sdmmc: increase power-on settling delay to 5ms
    9c97fcfb7a62 gpib: Fix memory leak in ni_usb_init()
    b30ba62cafd8 gpib: Fix error code in ni_usb_write_registers()
    5ca0f7b37183 gpib: Fix error code in ibonline()
    12679ed78c09 serial: SH_SCI: improve "DMA support" prompt
    3f8b835a6334 serial: imx: change SERIAL_IMX_CONSOLE to bool
    06162d85f830 staging: greybus: lights: avoid NULL deref
    c7f7b55ce2ad usb: typec: ucsi: drop an unused Kconfig symbol
    b244fbf3ff82 iio: test: drop dangling symbol in gain-time-scale helpers
    ac00f8a0cb15 soundwire: intel_ace2x: add SND_HDA_CORE dependency
    621a8bf292ed char: misc: Use IS_ERR() for filp_open() return value
    05ce13d78226 phy: rockchip: samsung-hdptx: Pre-compute HDMI PLL config for 461.10125 MHz output
    ccc29a067399 dma: dma-axi-dmac: fix HW scatter-gather not looking at the queue
    dd1e96fd9f60 dma: dma-axi-dmac: fix SW cyclic transfers
    b0ce68420da6 dmaengine: mediatek: uart-apdma: Fix above 4G addressing TX/RX
    2f0d9a5d552c interconnect: mediatek: Aggregate bandwidth with saturating add
    86e6547ac6c4 interconnect: mediatek: Don't hijack parent device
    52e4ac51e3fa clk: zynqmp: pll: Fix zynqmp_clk_divider_determine_rate kerneldoc
    d53b019a6003 clk: zynqmp: divider: Fix zynqmp_clk_divider_determine_rate kerneldoc
    71e5335fcec0 clk: mediatek: Fix error handling in runtime PM setup
    6e5379c3b545 clk: mediatek: Add mfg_eb as parent to mt8196 mfgpll clocks
    1debd9ba7eb1 clk: mediatek: Drop __initconst from gates
    053490ddace3 clk: zynqmp: divider: convert from divider_round_rate() to divider_determine_rate()
    df502559b124 clk: x86: cgu: convert from divider_round_rate() to divider_determine_rate()
    ccab4798a64f clk: versaclock3: convert from divider_round_rate() to divider_determine_rate()
    c632744ff0af clk: stm32: stm32-core: convert from divider_round_rate_parent() to divider_determine_rate()
    29781f258a9f clk: stm32: stm32-core: convert from divider_ro_round_rate() to divider_ro_determine_rate()
    141fd6e37278 clk: sprd: div: convert from divider_round_rate() to divider_determine_rate()
    aab174973251 clk: sophgo: sg2042-clkgen: convert from divider_round_rate() to divider_determine_rate()
    73fbacf47588 clk: nxp: lpc32xx: convert from divider_round_rate() to divider_determine_rate()
    7f487ccf58b0 clk: nuvoton: ma35d1-divider: convert from divider_round_rate() to divider_determine_rate()
    199625f9734f clk: milbeaut: convert from divider_round_rate() to divider_determine_rate()
    c05f9dfa6959 clk: loongson1: convert from divider_round_rate() to divider_determine_rate()
    0a5c1dff5115 clk: hisilicon: clkdivider-hi6220: convert from divider_round_rate() to divider_determine_rate()
    aa1ed67e5842 clk: bm1880: convert from divider_round_rate() to divider_determine_rate()
    d4274c2df180 clk: actions: owl-divider: convert from divider_round_rate() to divider_determine_rate()
    bfcc7cc9c36c clk: actions: owl-composite: convert from owl_divider_helper_round_rate() to divider_determine_rate()
    aed53da569fb clk: qcom: gfx3d: add parent to parent request map
    e5001c92fc86 clk: qcom: dispcc-sm7150: Fix dispcc_mdss_pclk1_clk_src
    aeb606d885ef clk: qcom: dispcc-sdm845: Enable parents for pixel clocks
    2a01a346d20e clk: qcom: regmap-divider: convert from divider_round_rate() to divider_determine_rate()
    22d691c02ad5 clk: qcom: regmap-divider: convert from divider_ro_round_rate() to divider_ro_determine_rate()
    cdab39223d57 clk: Move clk_{save,restore}_context() to COMMON_CLK section
    4fdbb1e3ffa3 Input: adp5589 - remove a leftover header file
    8ed504f525f1 clk: microchip: core: remove duplicate determine_rate on pic32_sclk_ops
    0533f1cdb382 clk: rockchip: Fix error pointer check after rockchip_clk_register_gate_link()
    0b45cddb7385 clk: qcom: alpha-pll: convert from divider_round_rate() to divider_determine_rate()
    87fa98532b45 clk: qcom: gcc-ipq5018: flag sleep clock as critical
    b88e84b154b9 clk: qcom: gcc-msm8917: Remove ALWAYS_ON flag from cpp_gdsc
    9dbd33356e3d clk: qcom: gcc-msm8953: Remove ALWAYS_ON flag from cpp_gdsc
    a9d771adb49a clk: qcom: gcc-glymur: Update the SDCC RCGs to use shared_floor_ops
    8d7df9126dad clk: qcom: gcc-qdu1000: Update the SDCC RCGs to use shared_floor_ops
    357bdc307c5a clk: qcom: gcc-x1e80100: Update the SDCC RCGs to use shared_floor_ops
    16a21335eff9 clk: qcom: gcc-milos: Update the SDCC RCGs to use shared_floor_ops
    76d5437ca4d0 clk: qcom: gcc-sdx75: Update the SDCC RCGs to use shared_floor_ops
    37babf26bfb5 clk: qcom: gcc-sm4450: Update the SDCC RCGs to use shared_floor_ops
    7873e2a407a0 clk: qcom: gcc-sm8750: Update the SDCC RCGs to use shared_floor_ops
    527508eb5712 clk: qcom: gcc-sm8450: Update the SDCC RCGs to use shared_floor_ops
    1bc262014a14 clk: meson: g12a: Limit the HDMI PLL OD to /4
    e82d721b05e0 clk: meson: gxbb: Limit the HDMI PLL OD to /4 on GXL/GXM SoCs
    f7b0686119fd clk: qcom: rcg2: compute 2d using duty fraction directly
    aa14e7603835 clk: qcom: gcc-sm8650: Use floor ops for SDCC RCGs
    b714c1d0bb43 clk: qcom: gcc-sm8550: Use floor ops for SDCC RCGs
    e9ed7237b824 clk: spacemit: Respect Kconfig setting when building modules
    19eb98a970c9 clk: thead: th1520-ap: Poll for PLL lock and wait for stability
    3d4202ee6494 fbdev: au1200fb: Fix a memory leak in au1200fb_drv_probe()
    e76a2f1d40ea fbdev: of_display_timing: Fix device node reference leak in of_get_display_timings()
    2cafad617431 Revert "mailbox/pcc: support mailbox management of the shared buffer"
    9a10843740d7 remoteproc: imx_dsp_rproc: Only reset carveout memory at RPROC_OFFLINE state
    ca8f2551772d tracing: Remove duplicate ENABLE_EVENT_STR and DISABLE_EVENT_STR macros
    335dfe4bc636 tracing: Properly process error handling in event_hist_trigger_parse()
    47d3fed63866 fs/nfs: Fix readdir slow-start regression
    e568088337e5 nvdimm: virtio_pmem: serialize flush requests
    25ab5e97d3c5 scsi: csiostor: Fix dereference of null pointer rn
    77794465365b scsi: ufs: host: mediatek: Require CONFIG_PM
    e5579ebaadc7 scsi: smartpqi: Fix memory leak in pqi_report_phys_luns()
    48cb99e74561 pNFS: fix a missing wake up while waiting on NFS_LAYOUT_DRAIN
    7bc44485182c RDMA/uverbs: Add __GFP_NOWARN to ib_uverbs_unmarshall_recv() kmalloc
    f354f16e9698 power: supply: qcom_battmgr: Recognize "LiP" as lithium-polymer
    47abfc207ab0 power: supply: pm8916_lbc: Fix use-after-free for extcon in IRQ handler
    ac092258d0d6 hisi_acc_vfio_pci: fix VF reset timeout issue
    980aa1f8d0dd mtd: spinand: Fix kernel doc
    39b74ec0869f mtd: parsers: ofpart: fix OF node refcount leak in parse_fixed_partitions()
    eacca1412587 cxl: Fix premature commit_end increment on decoder commit failure
    cc66fc9b5cf7 RDMA/core: add rdma_rw_max_sge() helper for SQ sizing
    5ae9da022ee3 RDMA/rxe: Fix race condition in QP timer handlers
    b2bc649c18fb RDMA/mlx5: Fix memory leak in GET_DATA_DIRECT_SYSFS_PATH handler
    bf4454da8b1e RDMA/uverbs: Validate wqe_size before using it in ib_uverbs_post_send
    409c2c5508f3 RDMA/rxe: Fix iova-to-va conversion for MR page sizes != PAGE_SIZE
    02f720109fed cxl/core: Fix cxl_dport debugfs EINJ entries
    055cd68b8ebb NFS/localio: remove -EAGAIN handling in nfs_local_doio()
    1d6933f32b29 NFS/localio: use GFP_NOIO and non-memreclaim workqueue in nfs_local_commit
    ae26a4cf2baf NFS/localio: prevent direct reclaim recursion into NFS via nfs_writepages
    c627769730e9 NFS/localio: Handle short writes by retrying
    ec121ad626c3 mtd: parsers: Fix memory leak in mtd_parser_tplink_safeloader_parse()
    eb0e8003d9a0 crypto: ccp - Send PSP_CMD_TEE_RING_DESTROY when PSP_CMD_TEE_RING_INIT fails
    eb5263f3f8e4 crypto: ccp - Factor out ring destroy handling to a helper
    10eef0f93238 crypto: ccp - Add an S4 restore flow
    b3010ff068fa crypto: ccp - Declare PSP dead if PSP_CMD_TEE_RING_INIT fails
    7c28e2789697 platform/x86/amd/pmf: Prevent TEE errors after hibernate
    8269e0ee89bd vfio/pci: Lock upstream bridge for vfio_pci_core_disable()
    721bd22bcf45 mtd: intel-dg: Fix accessing regions before setting nregions
    4d02e3870c88 mtd: rawnand: cadence: Fix return type of CDMA send-and-wait helper
    9b0927c9b91b IB/mlx5: Fix port speed query for representors
    6d838873da9c RDMA/mlx5: Fix UMR hang in LAG error state unload
    71b23ada25b3 tools/power/x86/intel-speed-select: Fix file descriptor leak in isolate_cpus()
    d9aefb386fdc platform/x86: hp-wmi: fix platform profile values for Omen 16-wf1xxx
    eb715133e0ae RDMA/iwcm: Fix workqueue list corruption by removing work_list
    5c07aef09a12 RDMA/rxe: Fix double free in rxe_srq_from_init
    33e396029002 RDMA/rtrs-srv: fix SG mapping
    c0def811ad8d power: supply: wm97xx: Fix NULL pointer dereference in power_supply_changed()
    64327c46f255 power: supply: bq27xxx: fix wrong errno when bus ops are unsupported
    a465a1499222 power: reset: nvmem-reboot-mode: respect cell size for nvmem_cell_write
    861dda7a9074 power: supply: sbs-battery: Fix use-after-free in power_supply_changed()
    64e15155095f power: supply: rt9455: Fix use-after-free in power_supply_changed()
    08e674e9862a power: supply: pm8916_lbc: Fix use-after-free in power_supply_changed()
    a8b7117ae3a7 power: supply: pm8916_bms_vm: Fix use-after-free in power_supply_changed()
    8c89aade8335 power: supply: goldfish: Fix use-after-free in power_supply_changed()
    2841bbb5a35c power: supply: cpcap-battery: Fix use-after-free in power_supply_changed()
    03d1e4ee4e6a power: supply: bq25980: Fix use-after-free in power_supply_changed()
    4b6fb0b6124f power: supply: bq256xx: Fix use-after-free in power_supply_changed()
    f27eb76def5c power: supply: act8945a: Fix use-after-free in power_supply_changed()
    709db4b476e2 power: supply: ab8500: Fix use-after-free in power_supply_changed()
    9b82bdb9e7c9 cxl/mem: Fix devm_cxl_memdev_edac_release() confusion
    51c89a5247bf RDMA/mlx5: Fix ucaps init error flow
    8bf968d68ea6 RDMA/hns: Notify ULP of remaining soft-WCs during reset
    4994b9be17ff RDMA/hns: Fix RoCEv1 failure due to DSCP
    0cbec8b49270 RDMA/hns: Fix WQ_MEM_RECLAIM warning
    38e2c5ad6f11 IB/cache: update gid cache on client reregister event
    d273d9cedd78 RDMA/rtrs: server: remove dead code
    365996a2b14d af_unix: Fix memleak of newsk in unix_stream_connect().
    08b10c468962 octeontx2-pf: Unregister devlink on probe failure
    8abc12ce2573 net: renesas: rswitch: fix forwarding offload statemachine
    1d4f8092bd78 ionic: Rate limit unknown xcvr type messages
    a16bea45d758 octeon_ep_vf: ensure dbell BADDR updation
    13a61502c1c8 octeon_ep: ensure dbell BADDR updation
    1b8e3c8b7443 octeon_ep: disable per ring interrupts
    c8c197aaa56b serial: caif: fix use-after-free in caif_serial ldisc_close()
    1c9ef28f643c xfrm: fix ip_rt_bug race in icmp_route_lookup reverse path
    d8c851cd3245 net: sunhme: Fix sbus regression
    69d3f9ee5489 net: atm: fix crash due to unvalidated vcc pointer in sigd_send()
    03462247e3b6 smb: client: correct value for smbd_max_fragmented_recv_size
    4f9ae386861e procfs: fix missing RCU protection when reading real_parent in do_task_stat()
    fdbccddb7e78 net: hns3: fix double free issue for tx spare buffer
    9a4d6c37cb12 dpll: zl3073x: Fix output pin phase adjustment sign
    072cec234a87 dpll: zl3073x: Cache all output properties in zl3073x_out
    9116bb0e0c9f dpll: zl3073x: Split ref, out, and synth logic from core
    84b8990f5771 dpll: zl3073x: Store raw register values instead of parsed state
    40bcd1fa0e23 dpll: zl3073x: Specify phase adjustment granularity for pins
    f399e8af187a dpll: add phase-adjust-gran pin attribute
    782368c13f5a PCI: Add ACS quirk for Pericom PI7C9X2G404 switches [12d8:b404]
    12b1681793e9 netfilter: nft_set_rbtree: validate open interval overlap
    90cbb8561aee netfilter: nft_set_rbtree: validate element belonging to interval
    3c40cc71cec7 netfilter: nft_set_rbtree: don't gc elements on insert
    89a3f393ab0d netfilter: nft_set_rbtree: remove seqcount_rwlock_t
    e4ea5be0b35f netfilter: nft_set_rbtree: use binary search array in get command
    36ed9b6e3961 netfilter: nft_set_rbtree: translate rbtree to array for binary search
    dad14d22dff1 netfilter: nft_set_rbtree: check for partial overlaps in anonymous sets
    40a7afde2f53 netfilter: nft_set_rbtree: fix bogus EEXIST with NLM_F_CREATE with null interval
    735ad034f1dc netfilter: nft_counter: fix reset of counters on 32bit archs
    6f2d238faff0 netfilter: nft_set_hash: fix get operation on big endian
    23901aa6b8a2 netfilter: nfnetlink_queue: do shared-unconfirmed check before segmentation
    870e3e63da8e netfilter: nfnetlink_queue: optimize verdict lookup with hash table
    276820278e97 nfc: hci: shdlc: Stop timers and work before freeing context
    531c1aec81bf inet: RAW sockets using IPPROTO_RAW MUST drop incoming ICMP
    67b75bb0ec55 bonding: only set speed/duplex to unknown, if getting speed failed
    9c3398e5b3a9 octeontx2-af: Fix PF driver crash with kexec kernel booting
    1fff00261c78 mptcp: fix receive space timestamp initialization
    fb7bf00b04a6 mptcp: do not account for OoO in mptcp_rcvbuf_grow()
    10a66a44e369 of: unittest: fix possible null-pointer dereferences in of_unittest_property_copy()
    b8856aba0fb0 tcp: accecn: handle unexpected AccECN negotiation feedback
    2ff45b29f37e tcp: disable RFC3168 fallback identifier for CC modules
    69484fd350be tcp: ECT_1_NEGOTIATION and NEEDS_ACCECN identifiers
    817780cb3f55 jfs: avoid -Wtautological-constant-out-of-range-compare warning
    b4374b0bed10 ucount: check for CAP_SYS_RESOURCE using ns_capable_noaudit()
    8fd58e0a0f04 ipc: don't audit capability check in ipc_permissions()
    f5efb397c8f9 selftests/mm: fix usage of FORCE_READ() in cow tests
    4a0d8d372915 PCI/ACPI: Restrict program_hpx_type2() to AER bits
    dbe723b480e4 PCI: Initialize RCB from pci_configure_device()
    da289440f04c wifi: ath12k: clear stale link mapping of ahvif->links_map
    474e93f4a5aa wifi: ath12k: Fix index decrement when array_len is zero
    0e0ca8dbfef9 wifi: ath11k: add usecase firmware handling based on device compatible
    134bd7f7e42f wifi: ath10k: sdio: add missing lock protection in ath10k_sdio_fw_crashed_dump()
    8fb1dc296378 PCI: Check parent for NULL in of_pci_bus_release_domain_nr()
    adc2deacdd81 tcp: tcp_tx_timestamp() must look at the rtx queue
    2a9370693b1c PCI: Remove old_size limit from bridge window sizing
    b855d9948621 PCI: Stop over-estimating bridge window size
    d5de3e34dcb5 PCI: Rewrite bridge window head alignment function
    17866f8a0822 fat: avoid parent link count underflow in rmdir
    a77e945c528f rust: task: restrict Task::group_leader() to current
    bd1d06eaad53 lib/kstrtox: fix kstrtobool() docstring to mention enabled/disabled
    d75ec4504a43 nfsd: never defer requests during idmap lookup
    b29094276ab2 xdrgen: Remove inclusion of nlm4.h header
    b633683dc0d4 xdrgen: Initialize data pointer for zero-length items
    59d23891cdba NFS: NFSERR_INVAL is not defined by NFSv2
    59409c5958b2 xdrgen: Fix struct prefix for typedef types in program wrappers
    1bd726fa8f5c dm: use bio_clone_blkg_association
    d2138abc8f0a iommu/vt-d: Clear Present bit before tearing down context entry
    821807c167b7 iommu/vt-d: Clear Present bit before tearing down PASID entry
    36244dfd3853 iommu/vt-d: Flush cache for PASID table before using it
    53336a811485 wifi: rtw89: debug: Fix memory leak in __print_txpwr_map()
    e53224783442 PCI: Mark 3ware-9650SA Root Port Extended Tags as broken
    feef0143ec5e kallsyms/ftrace: set module buildid in ftrace_mod_address_lookup()
    7f4827b24750 module: add helper function for reading module_buildid()
    34de49d09775 kallsyms/bpf: rename __bpf_address_lookup() to bpf_address_lookup()
    536ffc371b52 netfilter: nf_conncount: fix tracking of connections from localhost
    a0cdcacc0d41 netfilter: nft_compat: add more restrictions on netlink attributes
    6e5fa7add3e7 netfilter: nf_conncount: increase the connection clean up limit to 64
    ab455baa7420 netfilter: nf_conncount: make nf_conncount_gc_list() to disable BH
    0d7ccd3d16ad netfilter: nf_tables: reset table validation state on abort
    f1f9aea37297 ext4: fast commit: make s_fc_lock reclaim-safe
    59f10fa502ee wifi: cfg80211: stop NAN and P2P in cfg80211_leave
    6ff2ebfef75f mctp i2c: initialise event handler read bytes
    c1116859a7f4 net: mctp-i2c: fix duplicate reception of old data
    02bb1500f147 quota: fix livelock between quotactl and freeze_super
    7379837c3f9e wifi: ath12k: do WoW offloads only on primary link
    5a0b892ac90d wifi: ath9k: add OF dependency to AHB
    a44220e4eba3 PCI/P2PDMA: Reset page reference count when page mapping fails
    5b1f6531d4a1 PCI/PTM: Fix pcie_ptm_create_debugfs() memory leak
    aeddfb00bb83 dm: use READ_ONCE in dm_blk_report_zones
    7a3385e97af2 dm: fix unlocked test for dm_suspended_md
    5d0a2a2ce94b PCI/portdrv: Fix potential resource leak
    1af76378577e PCI: sophgo: Disable L0s and L1 on Sophgo 2044 PCIe Root Ports
    ef42c53b7a28 PCI: Do not attempt to set ExtTag for VFs
    1938bf90c1dd Documentation: tracing: Add PCI tracepoint documentation
    eb9aa9f80104 PCI/P2PDMA: Fix p2pmem_alloc_mmap() warning condition
    e19cce88ec4c PCI/P2PDMA: Release per-CPU pgmap ref when vm_insert_page() fails
    2108e783a7cf wifi: cfg80211: Fix use_for flag update on BSS refresh
    d072c2c82322 PCI/PM: Avoid redundant delays on D3hot->D3cold
    ed0ef3d0c92d Documentation: PCI: endpoint: Fix ntb/vntb copy & paste errors
    004288f3b24e PCI: xilinx: Fix INTx IRQ domain leak in error paths
    4e8e7080b557 PCI: mediatek: Fix IRQ domain leak when MSI allocation fails
    d1878562a41f hwmon: (pmbus/mpq8785) fix VOUT_MODE mismatch during identification
    14a38784e09a Revert "hwmon: (ibmpex) fix use-after-free in high/low store"
    98c6a053b6d3 spi: tools: Add include folder to .gitignore
    81190b2e9d04 ASoC: SDCA: Handle volatile controls correctly
    97b513d04e11 ASoC: SDCA: Force some SDCA Controls to be volatile
    32606d55ffc1 ASoC: SDCA: Remove outdated todo comment
    59be162822e5 accel/amdxdna: Fix incorrect error code returned for failed chain command
    feb4bcfd4052 HID: intel-ish-hid: fix NULL-ptr-deref in ishtp_bus_remove_all_clients
    5a68d2c99c85 accel/amdxdna: Fix memory leak in amdxdna_ubuf_map
    b79d31dce49b accel/amdxdna: Stop job scheduling across aie2_release_resource()
    f6b4c1d98a7b accel/amdxdna: Hold mm structure across iommu_sva_unbind_device()
    e6ff5e9e3900 platform/chrome: cros_ec_lightbar: Fix response size initialization
    52b71d025397 ASoC: tegra: Add AHUB writeable_reg for RX holes
    a3ce2b030809 mm/slab: fix false lockdep warning in __kfree_rcu_sheaf()
    aa27ad4e20e0 drm/xe: Unregister drm device on probe error
    c287399b66c0 drm/xe/ptl: Disable DCC on PTL
    ede7b0f33c5a evm: Use ordered xattrs list to calculate HMAC in evm_init_hmac()
    5332491be2ca media: uvcvideo: Fix allocation for small frame sizes
    16dd68310f50 pwm: tiehrpwm: Enable pwmchip's parent device before setting configuration
    39c24b19a611 platform/chrome: cros_typec_switch: Don't touch struct fwnode_handle::dev
    b7e2bd20e7c8 drm/msm/dp: Avoid division by zero in msm_dp_ctrl_config_msa()
    e60e16d406b2 drm/msm/dpu: program correct register for UBWC config on DPU 8.x+
    d791b31e7da1 drm/msm/dpu: offset HBB values written to DPU by -13
    b573177b314e drm/msm/mdss: correct HBB programmed on UBWC 5.x and 6.x devices
    7672af88d307 drm/rockchip: dw_hdmi_qp: Fix RK3576 HPD interrupt handling
    fb328aa95c34 drm/hisilicon/hibmc: Adding reset colorbar cfg in dp init.
    0922d282f7d3 drm/hisilicon/hibmc: fix no showing problem with loading hibmc manually
    84359ed3c53f drm/hisilicon/hibmc: add dp mode valid check
    bc950899ef11 drm/hisilicon/hibmc: fix dp probabilistical detect errors after HPD irq
    840581b30cde drm/buddy: release free_trees array on buddy mm teardown
    f83b92c57686 drm/msm/a2xx: fix pixel shader start on A225
    21cf7527de1d media: ccs: Accommodate C-PHY into the calculation
    5fab6e1405e1 accel/amdxdna: Fix notifier_wq flushing warning
    c0727bcbf09b drm/msm/dsi_phy_14nm: convert from divider_round_rate() to divider_determine_rate()
    2b46bb9f88cd drm/msm/dpu: fix CMD panels on DPU 1.x - 3.x
    2f803e86ba4f drm/msm/disp: set num_planes to 1 for interleaved YUV formats
    35301ca2a83d HID: playstation: Add missing check for input_ff_create_memless
    b6a83ad13d25 regulator: core: move supply check earlier in set_machine_constraints()
    a6b7308f35cd mei: late_bind: fix struct intel_lb_component_ops kernel-doc
    4ef745e4d0d6 drm/msm/dp: Update msm_dp_controller IDs for sa8775p
    acfd1dce074f drm/msm/dpu: fix WD timer handling on DPU 8.x
    822d9b24de40 drm/msm/dpu: Set vsync source irrespective of mdp top support
    dc567a611b16 drm/msm/disp/dpu: add merge3d support for sc7280
    8db8fadf1364 drm/amdgpu: Use explicit VCN instance 0 in SR-IOV init
    30c6faf91705 drm/amdkfd: Fix signal_eviction_fence() bool return value
    083351c6886e drm/amd: Drop "amdgpu kernel modesetting enabled" message
    1de71556cbd6 media: chips-media: wave5: Fix memory leak on codec_info allocation failure
    77dc0140ea59 ASoC: nau8821: Fixup nau8821_enable_jack_detect()
    5a247a84de0b smack: /smack/doi: accept previously used values
    cb59ae561995 smack: /smack/doi must be > 0
    da3be3289ecf drm/panthor: Evict groups before VM termination
    956cc8a74f41 ASoC: SDCA: Allow sample width wild cards in set_usage()
    fa3b263c4de3 ALSA: vmaster: Relax __free() variable declarations
    ed9acd01e907 ALSA: pcm: Relax __free() variable declarations
    082aba8e3aab drm/panel: sw43408: Remove manual invocation of unprepare at remove
    5b295f013393 accel/amdxdna: Fix race where send ring appears full due to delayed head update
    0b0d8ed13d29 drm/panthor: Fix panthor_gpu_coherency_set()
    d8d97352bf5d workqueue: Process rescuer work items one-by-one using a cursor
    5ec7110f5ed4 workqueue: Only assign rescuer work when really needed
    932c36b81325 workqueue: Factor out assign_rescuer_work()
    8c66adcae91b drm/panthor: Make sure we resume the tick when new jobs are submitted
    d2f485242e31 drm/panthor: Fix the logic that decides when to stop ticking
    ef100b8e257b drm/panthor: Fix immediate ticking on a disabled tick
    73f2614637f6 drm/panthor: Fix the group priority rotation logic
    693a04f41a54 drm/panthor: Fix the full_tick check
    57753f2c64c0 drm/panthor: Recover from panthor_gpu_flush_caches() failures
    da9c1afd9991 reset: canaan: k230: drop OF dependency and enable by default
    3c0dd95dd520 arm64: dts: qcom: sm6115: Add CX_MEM/DBGC GPU regions
    58c0b917fdca arm64: dts: qcom: agatti: Add CX_MEM/DBGC GPU regions
    222e45e64bbc arm64: dts: qcom: talos: Drop opp-shared from QUP OPP table
    37082c9b418d arm64: dts: qcom: x1e: bus is 40-bits (fix 64GB models)
    06557d72ea40 arm64: dts: qcom: sdm845-db845c: specify power for WiFi CH1
    39974be66f81 arm64: dts: qcom: sdm845-db845c: drop CS from SPIO0
    2d7ea0516f2b arm64: dts: qcom: qrb4210-rb2: Fix UART3 wakeup IRQ storm
    33bc5e10165d arm64: dts: amlogic: g12: assign the MMC A signal clock
    844317f9b007 arm64: dts: amlogic: g12: assign the MMC B and C signal clocks
    0709a0901956 arm64: dts: amlogic: gx: assign the MMC signal clocks
    c9bb634897e3 arm64: dts: amlogic: axg: assign the MMC signal clocks
    f6e54c1ea7b8 arm64: dts: amlogic: c3: assign the MMC signal clocks
    6cc29c714855 hwspinlock: omap: Handle devm_pm_runtime_enable() errors
    eeb84c4f4337 soc: qcom: ubwc: add missing include
    6906a9889898 arm64: dts: ti: k3-j784s4-j742s2-main-common.dtsi: Refactor watchdog instances for j784s4
    8273989e774a arm64: dts: ti: k3-j784s4-main.dtsi: Move c71_3 node to appropriate order
    1f71dfc03471 arm64: dts: amlogic: s4: fix mmc clock assignment
    5a5ec520e740 arm64: dts: amlogic: s4: assign mmc b clock to 24MHz
    85cf4f7c2cf2 arm64: dts: mediatek: mt8183-jacuzzi-pico6: Fix typo in pinmux node
    6666c9d54432 arm: dts: lpc32xx: add clocks property to Motor Control PWM device tree node
    bcab50ed6e73 arm64: dts: renesas: rzt2h-n2h-evk-common: Use GPIO for SD0 write protect
    6e6561231c6c powerpc/eeh: fix recursive pci_lock_rescan_remove locking in EEH event handling
    0f6498077faa soc: mediatek: svs: Fix memory leak in svs_enable_debug_write()
    3eeda22d52ff soc: qcom: cmd-db: Use devm_memremap() to fix memory leak in cmd_db_dev_probe
    1b39dbd7761d powerpc/uaccess: Move barrier_nospec() out of allow_read_{from/write}_user()
    3ce94bf05945 ARM: dts: allwinner: sun5i-a13-utoo-p66: delete "power-gpios" property
    db09ba1f9e70 arm64: dts: qcom: msm8994-octagon: Fix Analog Devices vendor prefix of AD7147
    9bbee82bacb9 arm64: dts: renesas: r9a09g047e57-smarc: Remove duplicate SW_LCD_EN
    480374c75c67 arm64: dts: qcom: x1e80100: Fix USB combo PHYs SS1 and SS2 ref clocks
    02d580c9affa arm64: dts: qcom: sdm845-oneplus: Mark l14a regulator as boot-on
    7f4d96e12218 arm64: dts: qcom: sdm845-oneplus: Don't keep panel regulator always on
    f5b047a23271 arm64: dts: qcom: sdm845-oneplus: Don't mark ts supply boot-on
    75a3a27e4f82 arm64: dts: qcom: sdm630: fix gpu_speed_bin size
    97ca54da16f4 clk: qcom: Return correct error code in qcom_cc_probe_by_index()
    911a473e29c3 arm64: dts: tqma8mpql-mba8mp-ras314: Fix HDMI CEC pad control settings
    5a76398d0e03 arm64: dts: tqma8mpql-mba8mpxl: Fix HDMI CEC pad control settings
    9fd645784128 firmware: arm_ffa: Correct 32-bit response handling in NOTIFICATION_INFO_GET
    f64f4ec804b3 EDAC/i5400: Fix snprintf() limit calculation in calculate_dimm_size()
    3efb54e1201b EDAC/i5000: Fix snprintf() size calculation in calculate_dimm_size()
    d32e8339e1fd soc: qcom: smem: handle ENOMEM error during probe
    4f73486ca822 pstore/ram: fix buffer overflow in persistent_ram_save_old()
    119702b71677 selftests/xsk: fix number of Tx frags in invalid packet
    b2b172a98713 selftests/xsk: properly handle batch ending in the middle of a packet
    8b1a095541c1 selftests/bpf: test_xsk: Split xskxceiver
    dcf416eb88ea hwrng: core - use RCU and work_struct to fix race condition
    9095671fa240 hwrng: core - Allow runtime disabling of the HW RNG
    4869d0e4e48a crypto: starfive - Fix memory leak in starfive_aes_aead_do_one_req()
    7752d3634386 bpf: Require frozen map for calculating map hash
    5835a077c6f5 bpf: Limit bpf program signature size
    45acb60fe59a fs/tests: exec: drop duplicate bprm_stack_limits test vectors
    52aeb1e07ec2 sched/rt: Skip currently executing CPU in rto_next_cpu()
    909131ad0a00 sched/deadline: Clear the defer params
    83550d231155 media: pci: mg4b: Use IRQF_NO_THREAD
    352f1bbbd711 mfd: wm8350-core: Use IRQF_ONESHOT
    7b0c5dec6a01 rtc: amlogic-a4: Remove IRQF_ONESHOT
    5248f7f5b340 usb: typec: fusb302: Remove IRQF_ONESHOT
    66839f7c2bd6 EDAC/altera: Remove IRQF_ONESHOT
    909dfc310ee5 scsi: efct: Use IRQF_ONESHOT and default primary handler
    f5e5bbf56ecf Bluetooth: btintel_pcie: Use IRQF_ONESHOT and default primary handler
    680b652b2d08 iommu/amd: Use core's primary handler and set IRQF_ONESHOT
    91b6a550472a platform/x86: int0002: Remove IRQF_ONESHOT from request_irq()
    0c1876a36544 genirq: Set IRQF_COND_ONESHOT in devm_request_irq().
    d7b87adeb0eb bpf: Fix bpf_xdp_store_bytes proto for read-only arg
    d7decb572b55 crypto: caam - fix netdev memory leak in dpaa2_caam_probe
    d0bac6618e81 crypto: hisilicon/trng - support tfms sharing the device
    94fdeeaeb7ce selftests/bpf: Fix kprobe multi stacktrace_ips test
    42a155c738b9 x86/fgraph,bpf: Switch kprobe_multi program stack unwind to hw_regs path
    9e10486f7993 x86/fgraph: Fix return_to_handler regs.rsp value
    243d642ff580 crypto: inside-secure/eip93 - unregister only available algorithm
    9a3ace9b010f crypto: ccp - Fix a crash due to incorrect cleanup usage of kfree
    4ecbcfb71a50 bpf: Fix verifier_bug_if to account for BPF_CALL
    4e0772cded10 bpf: Fix tcx/netkit detach permissions when prog fd isn't given
    4b8d1424b32c bpf, sockmap: Fix FIONREAD for sockmap
    f274a4540226 bpf, sockmap: Fix incorrect copied_seq calculation
    3ed835f6aa18 rqspinlock: Fix TAS fallback lock entry creation
    6abdd33a088d hwrng: airoha - set rng quality to 900
    46825599fad1 crypto: ccp - narrow scope of snp_range_list
    e6a4b3d22221 crypto: ccp - Fix a case where SNP_SHUTDOWN is missed
    7530c3595d1e crypto: inside-secure/eip93 - fix kernel panic in driver detach
    1bbb1356f6be hrtimer: Fix trace oddity
    c77581cdebad selftests/bpf: Fix resource leak in serial_test_wq on attach failure
    fdfe75161f6e bpf: Fix memory access flags in helper prototypes
    92a8cb1806ad bpf: Preserve id of register in sync_linked_regs()
    33d3290333e8 crypto: hisilicon/sgl - fix inconsistent map/unmap direction issue
    740e710a6f27 crypto: hisilicon/sec2 - support skcipher/aead fallback for hardware queue unavailable
    9f35acf69801 crypto: hisilicon/hpre - support the hpre algorithm fallback
    c990abb136b7 crypto: hisilicon - consolidate qp creation and start in hisi_qm_alloc_qps_node
    cc7a36b6ac8f crypto: hisilicon/zip - support fallback for zip
    3acd2479c770 crypto: hisilicon/qm - centralize the sending locks of each module into qm
    23fcfd8c0d1f crypto: hisilicon/qm - enhance the configuration of req_type in queue attributes
    2b8b12e3f869 crypto: hisilicon/hpre: extend tag field to 64 bits for better performance
    139e24de706e crypto: hisilicon/sec - move backlog management to qp and store sqe in qp for callback
    1f269645bb4c crypto: hisilicon/zip - adjust the way to obtain the req in the callback function
    c6eb4991a177 crypto: octeontx - fix dma_free_coherent() size
    2bdeabe2b647 crypto: cavium - fix dma_free_coherent() size
    9029e8db69fb sched: Fix build for modules using set_tsk_need_resched()
    8ed7f3c03d04 time/sched_clock: Use ACCESS_PRIVATE() to evaluate hrtimer::function
    9b94124cb9c2 ARM: VDSO: Patch out __vdso_clock_getres() if unavailable
    26cbfd67fdb5 sched: Export hidden tracepoints to modules
    c3cfe342d120 libbpf: Fix OOB read in btf_dump_get_bitfield_value
    c2a90d855bea selftests/bpf: veristat: fix printing order in output_stats()
    36abc0b2df60 crypto: qat - fix warning on adf_pfvf_pf_proto.c
    1838a7507e13 perf/x86/core: Do not set bit width for unavailable counters
    7e4c643aa3b2 x86/cpu/amd: Correct the microcode table for Zenbleed
    445d35742d86 io_uring/kbuf: fix memory leak if io_buffer_add_list fails
    6715560527e3 s390/cio: Fix device lifecycle handling in css_alloc_subchannel()
    af5b0854fba0 PM: sleep: wakeirq: harden dev_pm_clear_wake_irq() against races
    630f3eca3962 cpufreq: intel_pstate: Enable asym capacity only when CPU SMT is not possible
    5cbf75e0f07f perf: arm_spe: Properly set hw.state on failures
    c787a235deb3 arm64/gcs: Fix error handling in arch_set_shadow_stack_status()
    1141301a7195 PM: wakeup: Handle empty list in wakeup_sources_walk_start()
    80d58a8915d7 md: fix return value of mddev_trylock
    ec10e3dc9399 md/raid1: fix memory leak in raid1_run()
    02455f658db8 Partial revert "x86/xen: fix balloon target initialization for PVH dom0"
    f75a5555e004 ublk: Validate SQE128 flag before accessing the cmd
    9b03dda1453e ublk: restore auto buf unregister refcount optimization
    8344d5da9df7 thermal/of: Fix reference leak in thermal_of_cm_lookup()
    769a8a732e82 iomap: fix submission side handling of completion side errors
    67bbf2527c1d cpufreq: scmi: Fix device_node reference leak in scmi_cpu_domain_id()
    27feb209c2d7 OPP: Return correct value in dev_pm_opp_get_level
    095417d6b669 md/md-llbitmap: fix percpu_ref not resurrected on suspend timeout
    870b9f15867b md/raid5: fix IO hang with degraded array with llbitmap
    5bf494167291 md/raid10: fix any_working flag handling in raid10_sync_request
    32c046a506ea md/raid5: fix raid5_run() to return error when log_init() fails
    649ddf7e5aa6 thermal: intel: x86_pkg_temp_thermal: Handle invalid temperature
    9d589661f21f cpuidle: governors: menu: Always check timers with tick stopped
    d733106e7c65 io_uring/sync: validate passed in offset
    1d126db2f263 io_uring/eventfd: remove unused ctx->evfd_last_cq_tail member
    b24595b86920 ACPICA: Fix NULL pointer dereference in acpi_ev_address_space_dispatch()
    c1c266e2c1f1 io_uring: use release-acquire ordering for IORING_SETUP_R_DISABLED
    cb45bcc97093 xen/virtio: Don't use grant-dma-ops when running as Dom0
    68f38f648e4b ACPI: processor: Update cpuidle driver check in __acpi_processor_start()
    7cce69596cec rnbd-srv: Fix server side setting of bi_size for special IOs
    cbdb9f3adf54 netfs: avoid double increment of retry_count in subreq
    e66dcf7bb9c4 smb: client: fix potential UAF and double free in smb2_open_file()
    5de1aa0bf3a5 erofs: fix inline data read failure for ztailpacking pclusters
    7d4eadee7042 btrfs: fix EEXIST abort due to non-consecutive gaps in chunk allocation
    80e1fda9c084 btrfs: fix block_group_tree dirty_list corruption
    00ea0370ba7b btrfs: qgroup: return correct error when deleting qgroup relation item
    f957ddc4d8eb btrfs: zoned: don't zone append to conventional zone
    9643b3baa46b btrfs: introduce btrfs_bio::async_csum
    0981c6b984a1 btrfs: make sure all btrfs_bio::end_io are called in task context
    4663160aa2d8 btrfs: remove btrfs_bio::fs_info by extracting it from btrfs_bio::inode
    8f7f0e172868 btrfs: headers cleanup to remove unnecessary local includes
    e49abde0ffc3 erofs: handle end of filesystem properly for file-backed mounts
    728ba4346177 erofs: get rid of raw bi_end_io() usage
    ec15eb67fe9d tpm: st33zp24: Fix missing cleanup on get_burstcount() error
    1a22048c1117 tpm: tpm_i2c_infineon: Fix locality leak on get_burstcount() failure
    8e71414e252c i3c: dw: Fix memory leak in dw_i3c_master_i2c_xfers()
    53f4761ab032 i3c: dw: Initialize spinlock to avoid upsetting lockdep
    6d76febba07c gfs2: Fix use-after-free in iomap inline data write path
    1d47922b9804 gfs2: Fix slab-use-after-free in qd_put
    5480341dc884 gfs2: Retries missing in gfs2_{rename,exchange}
    7378340f2e22 i3c: master: Update hot-join flag only on success
    5c328675d2a8 fs: add <linux/init_task.h> for 'init_fs'
    44e9f5aedfb4 fs: move initializing f_mode before file_ref_init()
    c2ed725668f2 device_cgroup: remove branch hint after code refactor
    49c201c09b47 i3c: Move device name assignment after i3c_bus_init
    d0200c70e317 selftests/resctrl: Fix a division by zero error on Hygon
    28397957c75b audit: move the compat_xxx_class[] extern declarations to audit_arch.h
    4a4a6e12c9c8 rcu: Fix rcu_read_unlock() deadloop due to softirq
    2e6ff6a6fc69 hfsplus: return error when node already exists in hfs_bnode_create
    91f08ec6a97b auxdisplay: arm-charlcd: fix release_mem_region() size
    205955f29c26 RDMA/umad: Reject negative data_len in ib_umad_write
    714c99e1dc8f RDMA/siw: Fix potential NULL pointer dereference in header processing

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.18.bb              |  6 ++---
 .../linux/linux-yocto-tiny_6.18.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index ae06d6ed0d..e5afdd14a1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -15,13 +15,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "9bd60c36af4be5a5905bb5408325961475e66880"
-SRCREV_meta ?= "9b173d3a50825b8bffbb62ac6e504a7a56312e2e"
+SRCREV_machine ?= "08ee3b03d7797adc88926f332bf27b1c39ffe6c1"
+SRCREV_meta ?= "8ef043d5cbfe1d4c6b6b92d6d884d23c4d3411a3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.18.13"
+LINUX_VERSION ?= "6.18.16"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index 619fc8a59c..f782a383d2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.18.inc
 
-LINUX_VERSION ?= "6.18.13"
+LINUX_VERSION ?= "6.18.16"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c9dde4c9d33d3635d3c6604a1bb0c62ea01b0f44"
-SRCREV_meta ?= "9b173d3a50825b8bffbb62ac6e504a7a56312e2e"
+SRCREV_machine ?= "84ff1c125bcfdae85155ffaf1d171463eaa2db8a"
+SRCREV_meta ?= "8ef043d5cbfe1d4c6b6b92d6d884d23c4d3411a3"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index f5ad28780e..a4b589c0f6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "017989e501a2e6c46e3ed9a663d045dedbcc92cb"
-SRCREV_machine:qemuarm64 ?= "c9dde4c9d33d3635d3c6604a1bb0c62ea01b0f44"
-SRCREV_machine:qemuloongarch64 ?= "c9dde4c9d33d3635d3c6604a1bb0c62ea01b0f44"
+SRCREV_machine:qemuarm ?= "97ca229698636b7e65c1b06d446584b6a84fa2b9"
+SRCREV_machine:qemuarm64 ?= "84ff1c125bcfdae85155ffaf1d171463eaa2db8a"
+SRCREV_machine:qemuloongarch64 ?= "84ff1c125bcfdae85155ffaf1d171463eaa2db8a"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "c9dde4c9d33d3635d3c6604a1bb0c62ea01b0f44"
-SRCREV_machine:qemuriscv64 ?= "c9dde4c9d33d3635d3c6604a1bb0c62ea01b0f44"
-SRCREV_machine:qemuriscv32 ?= "c9dde4c9d33d3635d3c6604a1bb0c62ea01b0f44"
-SRCREV_machine:qemux86 ?= "c9dde4c9d33d3635d3c6604a1bb0c62ea01b0f44"
-SRCREV_machine:qemux86-64 ?= "c9dde4c9d33d3635d3c6604a1bb0c62ea01b0f44"
+SRCREV_machine:qemuppc ?= "84ff1c125bcfdae85155ffaf1d171463eaa2db8a"
+SRCREV_machine:qemuriscv64 ?= "84ff1c125bcfdae85155ffaf1d171463eaa2db8a"
+SRCREV_machine:qemuriscv32 ?= "84ff1c125bcfdae85155ffaf1d171463eaa2db8a"
+SRCREV_machine:qemux86 ?= "84ff1c125bcfdae85155ffaf1d171463eaa2db8a"
+SRCREV_machine:qemux86-64 ?= "84ff1c125bcfdae85155ffaf1d171463eaa2db8a"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "c9dde4c9d33d3635d3c6604a1bb0c62ea01b0f44"
-SRCREV_meta ?= "9b173d3a50825b8bffbb62ac6e504a7a56312e2e"
+SRCREV_machine ?= "84ff1c125bcfdae85155ffaf1d171463eaa2db8a"
+SRCREV_meta ?= "8ef043d5cbfe1d4c6b6b92d6d884d23c4d3411a3"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "ee4fb138af107455c9d6e38cf7087d932796ba8a"
+SRCREV_machine:class-devupstream ?= "6258e292d7463f96d0f06dff2a39093a54c9d16f"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.18/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.18.13"
+LINUX_VERSION ?= "6.18.16"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


