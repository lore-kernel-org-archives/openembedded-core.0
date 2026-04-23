Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25331FC036D
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:45:23 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.763.1776959122259342285
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 08:45:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=btE9cIkp;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-50fae4d1f85so52564201cf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 08:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776959121; x=1777563921; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAWQKc8a6ij3eC0z2JL4mZjkl3BowYFFSXwrilauNSs=;
        b=btE9cIkpVJZpuNwyQpbWYC8gJ1kHHNp8oB22vmS2uAjkPUPhmUlrof5nadbdc3j/2u
         OfBWVCIpgQvmdG5Cj++oiDkhyQx5H9ro2Y90LHRm60WZMHCyeZTSDqaU022oLksrP6nY
         oo9z5qtyyX/n1GpJ+xz+NPMjiQQO5UKZXOV0ow7darhpJ8RrKKQMxc48Lqk7tDa1v6np
         J8EtnhEi6eYh29XQYfheCZgXljJZH0ZVE6qcS5tqY2oXN9jHblV243lqmzZCt6rLeARN
         9Fl+Gx0RWzZE6ilk9V0Cu6ssvxpRi8r+GUMeYA03aoBebA1UVHIf/PJ4giKZXxMhU2CX
         x2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776959121; x=1777563921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TAWQKc8a6ij3eC0z2JL4mZjkl3BowYFFSXwrilauNSs=;
        b=Itk3zzySsjVcgB6QEEUuI4F4ZfskkvhVkJVnLJj/Gey3xgdfmlBGcVX7PdutpKNVbz
         EZF+1IWGeQyMD5XIiBsa6uTaRtbWPzGg2/TXW7QXFdVvSSz1RmF6xgK6UPCDXP+bq4qx
         JkXBwWeidcfZbTXIUIC63GHJwOfolw9szSmtTuY1z2sLm/h6ao+av2h3/+wH4xEuHaJq
         jgquEMu4qg3vpTB6ogsuKLKXdxr42wC9xcB/7PwxSOUO/R1UYYtqKpxo9qEppgKlG31z
         pkq0kVR23iPVy/D5MUhhAA0YXXHa8cwfP1zieWjb9UF+aJt9LSg3JJm5EgCWp8ByTZwO
         oCkw==
X-Gm-Message-State: AOJu0Yw0KpOZ3lc3r707bF42bu2Cv8A8ujs8mAvuWXFQywr544YX2OEU
	mBnLsLoq5epzAWOwjGlhN85/CmG9jTYKf+alNm967lODe6GHLX3/m9GVaFj71B2z
X-Gm-Gg: AeBDieuB4CJaZiCBnnWP0f1VbipsheyR+nsGQE5RzXU5ogTGLQRDIoSW7vrHLE8s9Ep
	WEONdtUQYFxSeJBnWRHADrn5qve1iQ4LYTTLYr5AIyjj44bUPVRMpYeDqDULRASbSkwXfL3Rkw+
	KShOxQdN3I1YuuxFuFeNn3o2XOtI5k7GdaU6tTPlX5Agm+3ar5lksAYoYxEH+KtoHF96rjuMkiZ
	5VmgvuSM0sYSYA+L6xwx1jl1WkXz1evhq0RDTFfNkSphiztJ09oQn6dUxP0NKdhRE1QLc9hKR5f
	WTWjQqpOvgeUYsK8ANC1rjrbyMUwWsDMMGKMliGw8HpchevksdmMTOg/x7po2m5fsAqugfRsZv1
	ma2bZ1eezKAW1Orz9fwXVThtE7f6Os/nmAqBdfOp2x7eLAar5eJB0al4hbWmfWeI4wsnIySkfDH
	Wj1C8MqCAVTTxO+FikNVpWbBQLz5SFKK5YjP0az7k/TbYaNUG9PgNxgz0Q0m2CAD+mtyweoASCd
	52XpZjXgZANjPcPgQ6PgzCx20dUJzwpPfLBOYXDax55Jo6SyTkXAGKguK7xnLvb46dOoQ==
X-Received: by 2002:a05:622a:84:b0:50d:912c:c2cb with SMTP id d75a77b69052e-50e36c4d835mr394126591cf.42.1776959120458;
        Thu, 23 Apr 2026 08:45:20 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50fb416b3f5sm74400031cf.28.2026.04.23.08.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:45:19 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
Subject: [openembedded-core][whinlatter][PATCH 07/18] linux-yocto/6.12: update to v6.12.76
Date: Thu, 23 Apr 2026 11:44:58 -0400
Message-ID: <20260423154509.1933646-8-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423154509.1933646-1-bruce.ashfield@gmail.com>
References: <20260423154509.1933646-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 15:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235807

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    39b686f8d57d Linux 6.12.76
    412c9b54585c Revert "x86/kexec: add a sanity check on previous kernel's ima kexec buffer"
    c1924e059c72 Linux 6.12.75
    bbfe49ffb892 most: core: fix leak on early registration failure
    9f3ffd49da12 arm64: Fix sampling the "stable" virtual counter in preemptible section
    1147ab1336bc xfs: fix copy-paste error in previous fix
    c2bc05dc5ff2 drm/i915/wakeref: clean up INTEL_WAKEREF_PUT_* flag macros
    5af4761d11a7 ALSA: pcm: Revert bufs move in snd_pcm_xfern_frames_ioctl()
    26034b60d806 NTB: ntb_transport: Fix too small buffer for debugfs_name
    af45c677dbf9 tracing: Wake up poll waiters for hist files when removing an event
    588c08026d6a tracing: Fix checking of freed trace_event_file for hist files
    fea7c9a23c0f fgraph: Do not call handlers direct when not using ftrace_ops
    b4700c089a10 tracing: ring-buffer: Fix to check event length before using
    3b91160e9a91 net: nfc: nci: Fix parameter validation for packet data
    bd135851106c drm/amdgpu: keep vga memory on MacBooks with switchable graphics
    5fc0933641a8 arm64: Force the use of CNTVCT_EL0 in __delay()
    d95f0851cf40 x86/kexec: Copy ACPI root pointer address from config table
    015cebdfcb97 net/sched: act_skbedit: fix divide-by-zero in tcf_skbedit_hash()
    1b1371cd4032 net: ethernet: ec_bhf: Fix dma_free_coherent() dma handle
    8122e05bd27b ASoC: amd: yc: Add DMI quirk for ASUS Vivobook Pro 15X M6501RR
    1d731e512134 cifs: some missing initializations on replay
    f73b3653a4c3 fbcon: Remove struct fbcon_display.inverse
    8225baf882d5 fbdev: ffb: fix corrupted video output on Sun FFB1
    d6f34bbff074 fbdev: of: display_timing: fix refcount leak in of_get_display_timings()
    f47d5b9e8aa6 fbdev: vt8500lcdfb: fix missing dma_free_coherent()
    0b038c0be682 fbcon: check return value of con2fb_acquire_newinfo()
    e93d898ee997 mm: numa_memblks: Identify the accurate NUMA ID of CFMW
    0591d6509c2f ipv6: ioam: fix heap buffer overflow in __ioam6_fill_trace_data()
    91892dafccb1 function_graph: Restore direct mode when callbacks drop to one
    97900f512252 atm: fore200e: fix use-after-free in tasklets during device removal
    df4308cb52dc net: intel: fix PCI device ID conflict between i40e and ipw2200
    f9fe092084cd procfs: fix possible double mmput() in do_procmap_query()
    82a7ea35a152 drm/amdgpu: fix sync handling in amdgpu_dma_buf_move_notify
    8f08df326752 drm/amd/display: Increase DCN35 SR enter/exit latency
    5cfc202825ba io_uring/filetable: clamp alloc_hint to the configured alloc range
    74f7e464ad88 tracing: Fix to set write permission to per-cpu buffer_size_kb
    6e704e89f16f net: macb: Fix tx/rx malfunction after phy link down and up
    86ad5c4ac790 net: ti: icssg-prueth: Add optional dependency on HSR
    ccef79af58b4 octeontx2-af: CGX: fix bitmap leaks
    84b932bc9899 net: wan/fsl_ucc_hdlc: Fix dma_free_coherent() in uhdlc_memclean()
    f73c042724d9 net: ethernet: marvell: skge: remove incorrect conflicting PCI ID
    e6e65be0752f LoongArch: Disable instrumentation for setup_ptwalker()
    35a384eb064e LoongArch: Guard percpu handler under !CONFIG_PREEMPT_RT
    808ac152e46a LoongArch: Use %px to print unmodified unwinding address
    af7db33e5d2e LoongArch: Prefer top-down allocation after arch_mem_init()
    92adfb707bee LoongArch: Make cpumask_of_node() robust against NUMA_NO_NODE
    4f5b7016e552 rust: kbuild: pass `-Zunstable-options` for Rust 1.95.0
    531a76c5a2e4 ceph: supply snapshot context in ceph_zero_partial_object()
    e7d70a77ad6f MIPS: rb532: Fix MMIO UART resource registration
    601dd3b79769 cifs: Fix locking usage for tcon fields
    7d9e0df82207 watchdog/softlockup: fix sample ring index wrap in need_counting_irqs()
    3713af7e95a3 kcsan, compiler_types: avoid duplicate type issues in BPF Type Format
    04d24a3654ed staging: rtl8723bs: fix null dereference in find_network
    6d2dae6b97bd parisc: kernel: replace kfree() with put_device() in create_tree_node()
    0425aaf20b40 PCI: Fix pci_slot_trylock() error handling
    87ab6b527f07 net: cpsw_new: Fix unnecessary netdev unregistration in cpsw_probe() error path
    75fb57efdd78 drm/amdkfd: Fix out-of-bounds write in kfd_event_page_set()
    43bc12f6d611 tipc: fix RCU dereference race in tipc_aead_users_dec()
    a4b964b7377c mtd: rawnand: pl353: Fix software ECC support
    42ef7c504ae5 usb: dwc2: fix resume failure if dr_mode is host
    a7a80c25b651 usb: dwc3: gadget: Move vbus draw to workqueue context
    f3132336db39 PCI: dwc: Fix msg_atu_index assignment
    b6e5cef4d6df mm/slab: use unsigned long for orig_size to ensure proper metadata align
    aac2fee7513d scsi: ufs: core: Flush exception handling work when RPM level is zero
    00d69f21ef2a perf/arm-cmn: Reject unsupported hardware configurations
    65379adf7d23 remoteproc: imx_rproc: Fix invalid loaded resource table detection
    e00549dd86f5 btrfs: continue trimming remaining devices on failure
    2f926875dffe clk: rs9: Reserve 8 struct clk_hw slots for for 9FGV0841
    0ca20d699b64 arm64: Fix non-atomic __READ_ONCE() with CONFIG_LTO=y
    97c18f074ff1 PCI/IOV: Fix race between SR-IOV enable/disable and hotplug
    d47f27e145f8 Revert "PCI/IOV: Add PCI rescan-remove locking when enabling/disabling SR-IOV"
    875355152b33 kexec: derive purgatory entry from symbol
    b2952dbeac2c ocfs2: fix reflink preserve cleanup issue
    87272e3e70ec rapidio: replace rio_free_net() with kfree() in rio_scan_alloc_net()
    68b5efd6c6b3 mm/highmem: fix __kmap_to_page() build error
    27d953201eae mtd: spinand: Disable continuous read during probe
    7037f3161a6d iio: gyro: itg3200: Fix unchecked return value in read_raw
    ca46d2092f30 powerpc/smp: Add check for kcalloc() failure in parse_thread_groups()
    ddb57354634b vhost: move vdpa group bound check to vhost_vdpa
    74a29a02ff65 tools: Fix bitfield dependency failure
    9bc366175509 arm64: poe: fix stale POR_EL0 values for ptrace
    052c611bcb28 dm mpath: make pg_init_delay_msecs settable
    a7733b51cd74 bus: fsl-mc: fix an error handling in fsl_mc_device_add()
    d1d07cbeca04 io_uring/net: don't continue send bundle if poll was required for retry
    37b14e59db5d usb: gadget: tegra-xudc: Add handling for BLCG_COREPLL_PWRDN
    2efa9c02c9b4 mm/vmalloc: prevent RCU stalls in kasan_release_vmalloc_node
    f8f73bf0f8a5 x86/kexec: add a sanity check on previous kernel's ima kexec buffer
    77a31097d6df nvmem: Drop OF node reference on nvmem_add_one_cell() failure
    982815bb0455 nfsd: fix return error code for nfsd_map_name_to_[ug]id
    a437e3bf30e3 md/bitmap: fix GPF in write_page caused by resize race
    d69de525bc7a xfs: check for deleted cursors when revalidating two btrees
    d6f3f7d4dd8a xfs: check return value of xchk_scrub_create_subord
    5de5be3ed7e7 xfs: only call xf{array,blob}_destroy if we have a valid pointer
    078e78821d91 pinctrl: intel: Add code name documentation
    339191811e6f PCI: endpoint: Fix swapped parameters in pci_{primary/secondary}_epc_epf_unlink() functions
    9f2bfea51151 KVM: x86: Add SRCU protection for reading PDPTRs in __get_sregs2()
    1c9b6aad70e5 xfs: fix remote xattr valuelblk check
    084d39d7847f xfs: fix the xattr scrub to detect freemap/entries array collisions
    ef42a8766ff3 xfs: fix freemap adjustments when adding xattrs to leaf blocks
    e1b8c6452ee9 xfs: delete attr leaf freemap entries when empty
    a40f31608598 iio: accel: adxl380: Avoid reading more entries than present in FIFO
    90cde30d8815 mfd: omap-usb-host: Fix OF populate on driver rebind
    428cfd5d5a50 mfd: qcom-pm8xxx: Fix OF populate on driver rebind
    db131ef9d898 mfd: core: Add locking around 'mfd_of_node_list'
    9813306610d0 iommu/vt-d: Flush dev-IOTLB only when PCIe device is accessible in scalable mode
    34f36f9c6114 media: verisilicon: AV1: Fix tile info buffer size
    2fbc8421d1db xfs: remove xfs_attr_leaf_hasname
    3628a1a38404 xfs: mark data structures corrupt on EIO and ENODATA
    96775be9f12f drm/bridge: anx7625: Fix invalid EDID size
    d764b8dd4200 drm/buddy: Prevent BUG_ON by validating rounded allocation
    51d54ff2b750 selftests/mm/charge_reserved_hugetlb: drop mount size for hugetlbfs
    11165f420b2a mm, page_alloc, thp: prevent reclaim for __GFP_THISNODE THP allocations
    cbae775b2265 drm: of: drm_of_panel_bridge_remove(): fix device_node leak
    087d915bb1ea media: venus: vdec: restrict EOS addr quirk to IRIS2 only
    99cf4a8fbf9e media: venus: vdec: fix error state assignment for zero bytesused
    63922c96e137 arm64: dts: rockchip: Do not enable hdmi_sound node on Pinebook Pro
    fbcc04ad7aec dm-unstripe: fix mapping bug when there are multiple targets in a table
    c6138af1f545 dm-integrity: fix recalculation in bitmap mode
    09d6efc6abd4 reset: gpio: suppress bind attributes in sysfs
    f0cddb616f75 s390/pci: Handle futile config accesses of disabled devices directly
    5aa2b0450031 clk: tegra: tegra124-emc: Fix potential memory leak in tegra124_clk_register_emc()
    d5952a3bfdd6 media: i2c: ov01a10: Fix digital gain range
    330d37a24ecb media: stm32: dcmipp: bytecap: clear all interrupts upon stream stop
    bac9fc78f367 soc: rockchip: grf: Support multiple grf to be handled
    61dfbb6bb9ee soc: rockchip: grf: Fix wrong RK3576_IOCGRF_MISC_CON definition
    5059221d2ead clk: clk-apple-nco: Add "apple,t8103-nco" compatible
    5b958dfe278f bus: omap-ocp2scp: fix OF populate on driver rebind
    fce2fd4a2ca0 KVM: nSVM: Always use vmcb01 in VMLOAD/VMSAVE emulation
    69aa67c1e22d soc: ti: pruss: Fix double free in pruss_clk_mux_setup()
    eaa16059f9af soc: ti: k3-socinfo: Fix regmap leak on probe failure
    e2e738e8dfbb dm: clear cloned request bio pointer when last clone bio completes
    b95a9810c38c dm-integrity: fix a typo in the code for write/discard race
    e438caff813f platform/x86: ISST: Add missing write block check
    fdc06d36dab7 media: ipu6: Fix RPM reference leak in probe error paths
    92019e41c1fe media: ipu6: Fix typo and wrong constant in ipu6-mmu.c
    13aa594f5f7e media: i2c: ov5647: use our own mutex for the ctrl lock
    e83c4debf2c1 media: ccs: Fix setting initial sub-device state
    ecba356cd7c6 media: i2c: ov5647: Fix PIXEL_RATE value for VGA mode
    fbf2a108ed5e media: i2c: ov5647: Sensor should report RAW color space
    ff65571ffae5 media: i2c: ov5647: Correct minimum VBLANK value
    58f1767ad5c9 media: i2c: ov5647: Correct pixel array offset
    2dedda97a64e media: i2c: ov5647: Initialize subdev before controls
    32a21ed2ad74 media: ccs: Avoid possible division by zero
    1b103307df6d media: qcom: camss: vfe: Fix out-of-bounds access in vfe_isr_reg_update()
    b9c3b0a13636 media: i2c: ov01a10: Fix test-pattern disabling
    b32a74bdc0a6 media: i2c: ov01a10: Fix passing stream instead of pad to v4l2_subdev_state_get_format()
    93804dda39f0 media: i2c: ov01a10: Add missing v4l2_subdev_cleanup() calls
    79dff20b1a57 media: i2c: ov01a10: Fix analogue gain range
    fe3e92312a46 media: i2c: ov01a10: Fix reported pixel-rate value
    577dafd9f68e media: i2c: ov01a10: Fix the horizontal flip control
    fb09d8b80046 media: i2c/tw9906: Fix potential memory leak in tw9906_probe()
    a114918270f0 media: i2c/tw9903: Fix potential memory leak in tw9903_probe()
    2df98c45a74a media: cx25821: Add missing unmap in snd_cx25821_hw_params()
    9c0a6ff53866 media: cx23885: Add missing unmap in snd_cx23885_hw_params()
    e3fb15aadfc8 media: cx88: Add missing unmap in snd_cx88_hw_params()
    7fa9754f48cb media: radio-keene: fix memory leak in error path
    cffde73f0d5f media: verisilicon: AV1: Set IDR flag for intra_only frame type
    5da29ade540b media: rockchip: rga: Fix possible ERR_PTR dereference in rga_buf_init()
    4ff5b0fd1faa media: amphion: Drop min_queued_buffers assignment
    b19beca4ae66 arm64: dts: apple: t8112-j473: Keep the HDMI port powered on
    f1ceaaf93ea3 HID: logitech-hidpp: Check maxfield in hidpp_get_report_length()
    e7ac1cd823cd HID: prodikeys: Check presence of pm->input_ep82
    922bd3e498a4 HID: magicmouse: Do not crash on missing msc->input
    04e50f45b517 HID: hid-pl: handle probe errors
    43a19467d3f3 arm64: Disable branch profiling for all arm64 code
    ce904c8a5bbe KVM: nSVM: Remove a user-triggerable WARN on nested_svm_load_cr3() succeeding
    c481d4edf070 KVM: x86: Return "unsupported" instead of "invalid" on access to unsupported PV MSR
    b61843503d54 ARM: omap2: Fix reference count leaks in omap_control_init()
    8c73302be475 arm64: dts: qcom: x1e80100: Add missing TCSR ref clock to the DP PHYs
    885e26f6845d media: verisilicon: AV1: Fix tx mode bit setting
    72e6e79568f3 media: verisilicon: AV1: Fix enable cdef computation
    b73d85231d5b media: chips-media: wave5: Fix device cleanup order to prevent kernel panic
    156020e889ed media: chips-media: wave5: Fix kthread worker destruction in polling mode
    4f2a51433a3a media: mtk-mdp: Fix a reference leak bug in mtk_mdp_remove()
    c8737d33d4e8 media: mtk-mdp: Fix error handling in probe function
    fe17309d9bf7 media: mediatek: encoder: Fix uninitialized scalar variable issue
    9b8dc1d327e2 dm-verity: correctly handle dm_bufio_client_create() failure
    ff613d11f78e phy: qcom: edp: Make the number of clocks flexible
    6ad50d3a1670 Revert "PCI: qcom: Enable MSI interrupts together with Link up if 'Global IRQ' is supported"
    57fa97ae2385 drm/tests: shmem: Swap names of export tests
    501ace56f3f8 fpga: dfl: use subsys_initcall to allow built-in drivers to be added
    885ec8577622 ASoC: SOF: ipc4-control: Keep the payload size up to date
    20b55c3831cf ASoC: SOF: ipc4-control: Use the correct size for scontrol->ipc_control_data
    491956b45b5f ASoC: SOF: ipc4-topology: Correct the allocation size for bytes controls
    698988dda4db ASoC: SOF: ipc4-control: If there is no data do not send bytes update
    47671671a370 clk: renesas: rzg2l: Select correct div round macro
    2f7042ca608d clk: renesas: rzg2l: Fix intin variable size
    7654e6e3cd6b rpmsg: core: fix race in driver_override_show() and use core helper
    53d32735d77a netfilter: nf_conntrack_h323: fix OOB read in decode_choice()
    8b841fd529db dpaa2-switch: validate num_ifs to prevent out-of-bounds write
    ea5d7787635e net: consume xmit errors of GSO frames
    e1407fb7c337 net/mlx5e: Fix "scheduling while atomic" in IPsec MAC address query
    c7bbd8632bcf net/mlx5e: Support routed networks during IPsec MACs initialization
    b32498dd7621 net/mlx5e: Separate address related variables to be in struct
    2e4c69121156 net/mlx5: Fix missing devlink lock in SRIOV enable error path
    53f5c553149a net/mlx5: E-switch, Clear legacy flag when moving to switchdev
    6a825a26f9e3 net/mlx5: DR, Fix circular locking dependency in dump
    ba3bf0f1bf1d RDMA/umem: Fix double dma_buf_unpin in failure path
    67ba6b13dbca net: usb: pegasus: enable basic endpoint checking
    f21d71a0962a RDMA/efa: Fix typo in efa_alloc_mr()
    200bdb8d367c net: wan: farsync: Fix use-after-free bugs caused by unfinished tasklets
    36abfc850cdf RDMA/core: Fix stale RoCE GIDs during netdev events at registration
    075cbc1a4aa2 tipc: fix duplicate publication key in tipc_service_insert_publ()
    9ea3671d70ee kcm: fix zero-frag skb in frag_list on partial sendmsg error
    a5de36d6cee7 tls: Fix race condition in tls_sw_cancel_work_tx()
    ec91078e1321 Bluetooth: L2CAP: Fix missing key size check for L2CAP_LE_CONN_REQ
    ffb7214f04da Bluetooth: L2CAP: Fix not checking output MTU is acceptable on L2CAP_ECRED_CONN_REQ
    730058f51b8f Bluetooth: L2CAP: Fix response to L2CAP_ECRED_CONN_REQ
    8285742519b5 Bluetooth: hci_qca: Cleanup on all setup failures
    935f324e4b24 Bluetooth: L2CAP: Fix result of L2CAP_ECRED_CONN_RSP when MTU is too short
    1e09410c98fe Bluetooth: L2CAP: Fix invalid response to L2CAP_ECRED_RECONF_REQ
    464808911fb9 Remove WARN_ALL_UNSEEDED_RANDOM kernel config option
    f204c1379a98 wifi: cfg80211: wext: fix IGTK key ID off-by-one
    cf95db5e33bd bnxt_en: Fix deleting of Ntuple filters
    348a5f8d06c7 bnxt_en: Fix RSS context delete logic
    21d1e80d0d6e net: ethernet: xscale: Check for PTP support properly
    d077c45b34b8 net: ixp4xx_eth: convert to ndo_hwtstamp_get() and ndo_hwtstamp_set()
    b88194c1cfe7 net: usb: lan78xx: scan all MDIO addresses on LAN7801
    9c79b839a639 net: usb: kaweth: remove TX queue manipulation in kaweth_set_rx_mode
    f7ad8b1d0e42 espintcp: Fix race condition in espintcp_close()
    a3c8fede034f xfrm: always flush state and policy upon NETDEV_UNREGISTER event
    2dfbc8c17dd1 ipmi: ipmb: initialise event handler read bytes
    f1713988e932 xfrm: skip templates check for packet offload tunnel mode
    dc0abce05513 xfrm6: fix uninitialized saddr in xfrm6_get_saddr()
    2e4d5e8d86a9 ntb: ntb_hw_switchtec: Fix shift-out-of-bounds for 0 mw lut
    0e9304209451 ntb: ntb_hw_switchtec: Fix array-index-out-of-bounds access
    faf7f4073d5d rtc: zynqmp: correct frequency value
    d4c08521c77d drm/amd/display: Remove conditional for shaper 3DLUT power-on
    5c3de2cae7ce arm64: hugetlbpage: avoid unused-but-set-parameter warning (gcc-16)
    4f2eb019d87b btrfs: replace BUG() with error handling in __btrfs_balance()
    fc9e5af60dc1 ALSA: usb-audio: Add sanity check for OOB writes at silencing
    7a3b0a893b94 drm/radeon: Add HAINAN clock adjustment
    f8431b867223 spi: spidev: fix lock inversion between spi_lock and buf_lock
    b701db9f535a drm/amd/display: bypass post csc for additional color spaces in dal
    6561e0914ac9 drm/amdgpu: Add HAINAN clock adjustment
    32a1f64f8ff6 ALSA: usb-audio: Update the number of packets properly at receiving
    2d9cb8a280aa drm/amdgpu: Adjust usleep_range in fence wait
    3fb5155a39ab drm/amd/display: Avoid updating surface with the same surface under MPO
    761b208dfafc drm/amd/display: Fix system resume lag issue
    9a4483972bf7 drm/amd/display: Fix writeback on DCN 3.2+
    8ec5b525221e ARM: 9467/1: mm: Don't use %pK through printk
    44c8c02779bf include: uapi: netfilter_bridge.h: Cover for musl libc
    09e437ba3f2d ACPI: x86: Force enabling of PWM2 on the Yogabook YB1-X90
    ecd2fc9e4c32 thermal: int340x: Fix sysfs group leak on DLVR registration failure
    1b275bd49e58 libceph: define and enforce CEPH_MAX_KEY_LEN
    a46cec9cc5b2 ceph: supply snapshot context in ceph_uninline_data()
    39aef9080f27 fs/ntfs3: avoid calling run_get_entry() when run == NULL in ntfs_read_run_nb_ra()
    9b877e5e1cbf fs/ntfs3: drop preallocated clusters for sparse and compressed files
    7ef219656feb fs: ntfs3: fix infinite loop triggered by zero-sized ATTR_LIST
    78b61f7eac37 fs: ntfs3: fix infinite loop in attr_load_runs_range on inconsistent metadata
    398e768d1acc fs: ntfs3: check return value of indx_find to avoid infinite loop
    0569822bb36c MIPS: Loongson: Make cpumask_of_node() robust against NUMA_NO_NODE
    f86bee0ef4fd iio: magnetometer: Remove IRQF_ONESHOT
    48be61552318 iio: Use IRQF_NO_THREAD
    a4c154685855 mfd: intel-lpss: Add Intel Nova Lake-S PCI IDs
    1fb137d985f2 Revert "mfd: da9052-spi: Change read-mask to write-mask"
    0bfb54195be6 phy: fsl-imx8mq-usb: disable bind/unbind platform driver feature
    c435e63530f7 phy: mvebu-cp110-utmi: fix dr_mode property read from dts
    5db6da613e9c watchdog: imx7ulp_wdt: handle the nowayout option
    21cc92fddf4f binder: don't use %pK through printk
    bf66b535daed fix it87_wdt early reboot by reporting running timer
    29e9413dfae9 serial: 8250: 8250_omap.c: Clear DMA RX running status only after DMA termination is done
    aebf83897bb6 serial: 8250: 8250_omap.c: Add support for handling UART error conditions
    9f70f78e22b3 staging: rtl8723bs: fix memory leak on failure path
    1b72b834511d usb: chipidea: udc: fix DMA and SG cleanup in _ep_nuke()
    f505b91db2c0 usb: gadget: f_fs: Fix ioctl error handling
    3875c8eca2df usb: gadget: f_fs: fix DMA-BUF OUT queues
    4d55fe3cd765 misc: eeprom: Fix EWEN/EWDS/ERAL commands for 93xx56 and 93xx66
    aa97ccc3dc1e misc: bcm_vk: Fix possible null-pointer dereferences in bcm_vk_read()
    297428ee6f6e phy: cadence-torrent: restore parent clock for refclk during resume
    2930ddda9273 phy: ti: phy-j721e-wiz: restore mux selection during resume
    874558ec341b dmaengine: stm32-mdma: initialize m2m_hw_period and ccr to fix warnings
    340d7c73dab7 dmaengine: sun6i: Choose appropriate burst length under maxburst
    a49028a796d7 most: core: fix resource leak in most_register_interface error paths
    12afc931e7c7 fpga: of-fpga-region: Fail if any bridge is missing
    0945ed3284e9 usb: typec: ucsi: psy: Fix voltage and current max for non-Fixed PDOs
    3590c1751c1d serial: 8250_dw: handle clock enable errors in runtime_resume
    98d6bdb521f2 staging: rtl8723bs: fix missing status update on sdio_alloc_irq() failure
    23aaf922bd3e soundwire: intel_auxdevice: add cs42l45 codec to wake_capable_list
    d6f73398da63 soundwire: dmi-quirks: add mapping for Avell B.ON (OEM rebranded of NUC15)
    0e6bf9b4e291 dmaengine: stm32-dma3: use module_platform_driver
    a5d00dff9711 9p/xen: protect xen_9pfs_front_free against concurrent calls
    edc3261ceb73 m68k: nommu: fix memmove() with differently aligned src and dest for 68000
    bc775cc7c085 HID: i2c-hid: Add FocalTech FT8112
    563a6ab857b3 clk: microchip: core: correct return value on *_get_parent()
    8d6bc7da8021 mailbox: sprd: clear delivery flag before handling TX done
    22cfa9e10cfa remoteproc: mediatek: Break lock dependency to `prepare_lock`
    34035ddfbd77 mailbox: sprd: mask interrupts that are not handled
    9824db3eadb3 mailbox: imx: Skip the suspend flag for i.MX7ULP
    fa3635fa761a mailbox: pcc: Remove spurious IRQF_ONESHOT usage
    b74e552df8e5 remoteproc: imx_dsp_rproc: Skip RP_MBOX_SUSPEND_SYSTEM when mailbox TX channel is uninitialized
    37b7cc18380c tracing: Fix false sharing in hwlat get_sample()
    f7fc25362c07 riscv: vector: init vector context with proper vlenb
    d42ec56b30ba scsi: ufs: mediatek: Fix page faults in ufs_mtk_clk_scale() trace event
    2fcdc1ccc201 vhost: fix caching attributes of MMIO regions by setting them explicitly
    c45363db0d5f scsi: buslogic: Reduce stack usage
    dbf9416360aa hisi_acc_vfio_pci: update status after RAS error
    9cf87b6bf6fb ata: libata: avoid long timeouts on hot-unplugged SATA DAS
    9662e7b1e915 RDMA/rtrs-clt: For conn rejection use actual err number
    78ac2b2f981f nfc: nxp-nci: remove interrupt trigger type
    0ed3ab68c153 myri10ge: avoid uninitialized variable use
    cbda3855897f PCI: Mark Nvidia GB10 to avoid bus reset
    7e9a64228209 PCI: Add ACS quirk for Qualcomm Hamoa & Glymur
    7a126c1b6cfa PCI: Enable ACS after configuring IOMMU for OF platforms
    63345c47ae43 PCI: Fix pci_slot_lock () device locking
    7ac154e37a91 PCI/AER: Clear stale errors on reporting agents upon probe
    bc8710fd1b92 PCI: Mark ASM1164 SATA controller to avoid bus reset
    ba2e3472022f net/rds: Clear reconnect pending bit
    7ebd51c3f032 vmw_vsock: bypass false-positive Wnonnull warning with gcc-16
    73a92ae5a990 net: usb: sr9700: remove code to drive nonexistent multicast filter
    c8847a8eaacb bnxt_en: Allow ntuple filters for drops
    39c6ab2d2eea wifi: ath10k: fix lock protection in ath10k_wmi_event_peer_sta_ps_state_chg()
    16ca0282e099 wifi: rtw89: pci: restore LDO setting after device resume
    2a4f7827e001 net: sfp: add quirk for Lantech 8330-265D
    cec2ceb35ce7 octeontx2-af: Workaround SQM/PSE stalls by disabling sticky
    416c01dd95f4 Bluetooth: btusb: Add device ID for Realtek RTL8761BU
    5d0b46ab5d55 Bluetooth: btusb: Add new VID/PID for RTL8852CE
    0f5c4d8745d7 Bluetooth: hci_conn: use mod_delayed_work for active mode timeout
    a86ebcb3b08f Bluetooth: hci_conn: Set link_policy on incoming ACL connections
    430bdb44c0b2 Bluetooth: btusb: Add support for MediaTek7920 0489:e158
    cdcaafeb40f9 ipv4: fib: Annotate access to struct fib_alias.fa_state.
    de3974edd057 wifi: iwlegacy: add missing mutex protection in il3945_store_measurement()
    7d355d937dc3 wifi: iwlegacy: add missing mutex protection in il4965_store_tx_power()
    b9074687ffea net: hns3: extend HCLGE_FD_AD_QID to 11 bits
    70debb2b34a2 ipv4: igmp: annotate data-races around idev->mr_maxdelay
    2803d02aa7a1 gro: change the BUG_ON() in gro_pull_from_frag0()
    b3978714bd4a ext4: propagate flags to convert_initialized_extent()
    81248b1eb3c5 net/rds: No shortcut out of RDS_CONN_ERROR
    b0ea9e2a5644 wifi: rtw89: 8922a: add digital compensation for 2GHz
    0a56a63a3bb3 wifi: rtw89: fix unable to receive probe responses under MLO connection
    a8347aa56749 wifi: iwlwifi: mvm: check the validity of noa_len
    4cca2bb73717 net: usb: r8152: fix transmit queue timeout
    6cb281662a63 openrisc: define arch-specific version of nop()
    8b300f726640 netfilter: xt_tcpmss: check remaining length before reading optlen
    fb0af2fcee17 netfilter: nf_conntrack: Add allow_clash to generic protocol handler
    c51755090c94 ext4: use reserved metadata blocks when splitting extent on endio
    5b5a9abdc5f4 ext4: mark group extend fast-commit ineligible
    9e9fb259bcdd ext4: move ext4_percpu_param_init() before ext4_mb_init()
    102428f145f9 ext4: mark group add fast-commit ineligible
    bd463fcd7f0c ipv6: exthdrs: annotate data-race over multiple sysctl
    762e76c93823 ipv6: annotate data-races over sysctl.flowlabel_reflect
    45e2b1cf2689 ipv6: annotate data-races in ip6_multipath_hash_{policy,fields}()
    69b4bcaece65 wifi: cfg80211: allow only one NAN interface, also in multi radio
    e2ee86fefe01 wifi: ath12k: fix preferred hardware mode calculation
    4234f2d90f7b wifi: ath11k: Fix failure to connect to a 6 GHz AP
    b71487cb692e wifi: ath11k: add pm quirk for Thinkpad Z13/Z16 Gen1
    26c82ec5add2 wifi: rtw89: wow: add reason codes for disassociation in WoWLAN mode
    faac634c2795 wifi: rtw89: mac: correct page number for CSI response
    715c263119fd iommu/amd: move wait_on_sem() out of spinlock
    b82073564373 wifi: libertas: fix WARNING in usb_tx_block
    939dc5eddae6 net: wwan: mhi: Add network support for Foxconn T99W760
    65bc40fea4fd iommu/arm-smmu-v3: Improve CMDQ lock fairness and efficiency
    cf2d06c9fd4b dm: remove fake timeout to avoid leak request
    209149bd758e dm: replace -EEXIST with -EBUSY
    b4d46b4fb240 wifi: rtw88: Fix inadvertent sharing of struct ieee80211_supported_band data
    9b5418070ee8 wifi: rtw88: Use devm_kmemdup() in rtw_set_supported_band()
    46216a48cd89 wifi: rtw89: ser: enable error IMR after recovering from L1
    e31daf5fbcda wifi: rtw89: 8922a: set random mac if efuse contains zeroes
    1c7ad1b82ec4 wifi: rtw88: rtw8821cu: Add ID for Mercusys MU6H
    0d0c2fb80ca4 wifi: rtw88: 8822b: Avoid WARNING in rtw8822b_config_trx_mode()
    400ca64e87ac wifi: rtw88: fix DTIM period handling when conf->dtim_period is zero
    5d77c36cd4b6 jfs: nlink overflow in jfs_rename
    aeecd32724c5 jfs: Add missing set_freezable() for freezable kthread
    de10c10eb0e8 ALSA: usb-audio: Add iface reset and delay quirk for AB13X USB Audio
    ae583f113d15 ALSA: mixer: oss: Add card disconnect checkpoints
    72210c1ad2d4 ALSA: hda/realtek - Enable mute LEDs on HP ENVY x360 15-es0xxx
    bfefacf1996f ASoC: fsl: imx-rpmsg: use snd_soc_find_dai_with_mutex() in probe
    21207c003700 spi: geni-qcom: Fix abort sequence execution for serial engine errors
    10411f1f2c76 ASoC: SOF: Intel: hda: Fix NULL pointer dereference
    566657cafa5d power: sequencing: fix missing state_lock in pwrseq_power_on() error path
    648a26c3bda4 modpost: Amend ppc64 save/restfpr symnames for -Os build
    31a37c62e6a5 ASoC: es8328: Add error unwind in resume
    c46992fa770a HID: logitech-hidpp: Add support for Logitech K980
    2ec472ad5c19 hwmon: (f71882fg) Add F81968 support
    066bbecaef26 hwmon: (nct6775) Add ASUS Pro WS WRX90E-SAGE SE
    2c7a5235a8c8 hwmon: (dell-smm) Add support for Dell OptiPlex 7080
    ba5d922b3153 ASoC: codecs: max98390: Check return value of devm_gpiod_get_optional() in max98390_i2c_probe()
    5a22d4560c35 drm/amd/display: avoid dig reg access timeout on usb4 link training fail
    b21402b55722 drm/amd/display: Fix GFX12 family constant checks
    f1c5fcf80d77 spi: spi-mem: Protect dirmap_create() with spi_mem_access_start/end
    6d802e37525b ASoC: sunxi: sun50i-dmic: Add missing check for devm_regmap_init_mmio
    2a85a0ebd33c gpio: aspeed-sgpio: Change the macro to support deferred probe
    adae2d63f81d ALSA: hda/realtek: fix LG Gram Style 14 speakers
    6e1664116a96 ALSA: hda/conexant: Add headset mic fix for MECHREVO Wujie 15X Pro
    f5623483341b HID: elecom: Add support for ELECOM HUGE Plus M-HT1MRBK
    0fa0a82274c8 HID: multitouch: add eGalaxTouch EXC3188 support
    0f5fe6ae25f9 media: rkisp1: Fix filter mode register configuration
    a205740a7231 drm/atmel-hlcdc: fix use-after-free of drm_crtc_commit after release
    cc18db0860c8 drm/atmel-hlcdc: don't reject the commit if the src rect has fractional parts
    25e832a78307 drm/atmel-hlcdc: fix memory leak from the atomic_destroy_state callback
    fe3cf809c1e5 drm/amd/display: Disable FEC when powering down encoders
    c3b6733dd4c9 PCI: Add Intel Nova Lake audio Device ID
    02a4d03515d4 ASoC: soc-acpi-intel-arl-match: change rt722 amp endpoint to aggregated
    ae57ffd142fa virt: vbox: uapi: Mark inner unions in packed structs as packed
    359d29e76dba hyper-v: Mark inner union in hv_kvp_exchg_msg_value as packed
    8e1664b9ee43 drm: Account property blob allocations to memcg
    cc904b44e4e6 drm/amdkfd: Fix GART PTE for non-4K pagesize in svm_migrate_gart_map()
    ee0dc6c66a91 drm/amdkfd: Relax size checking during queue buffer get
    a2dfdb19f856 ALSA: hda/realtek: add HP Victus 16-e0xxx mute LED quirk
    2d9b17a177c0 media: ipu6: Always close firmware stream
    1ff2c616944c media: ipu6: Close firmware streams on streaming enable failure
    a4257bf49221 media: ipu6: Ensure stream_mutex is acquired when dealing with node list
    888523a37c93 media: mt9m114: Return -EPROBE_DEFER if no endpoint is found
    22ffbc504a73 media: mt9m114: Avoid a reset low spike during probe()
    461733d83e67 media: v4l2-async: Fix error handling on steps after finding a match
    e220ec4c4596 media: cx25821: Fix a resource leak in cx25821_dev_setup()
    5849ae68d7b8 media: solo6x10: Check for out of bounds chip_id
    58dd722b6c3d media: pvrusb2: fix URB leak in pvr2_send_request_ex
    a854c58dc989 media: adv7180: fix frame interval in progressive mode
    ec2f37bbb733 drm/panel: Fix a possible null-pointer dereference in jdi_panel_dsi_remove()
    533bd1c1e2ca media: amphion: Clear last_buffer_dequeued flag for DEC_CMD_START
    aaced618189a spi: spi-mem: Limit octal DTR constraints to octal DTR situations
    bbc8396394f2 ASoC: wm8962: Don't report a microphone if it's shorted to ground on plug
    64d7ff20fb03 ASoC: wm8962: Add WM8962_ADC_MONOMIX to "3D Coefficients" mask
    5b27fcb5d1eb drm/xe: Only toggle scheduling in TDR if GuC is running
    2193fe76d360 drm/amd/display: only power down dig on phy endpoints
    ef9ed9e786dd drm/amdgpu: Skip loading SDMA_RS64 in VF
    a951d6630b3a HID: apple: Add "SONiX KN85 Keyboard" to the list of non-apple keyboards
    23e7150afc70 drm/amd/display: Add signal type check for dcn401 get_phyd32clk_src
    d89aef80790f drm/amdgpu: avoid a warning in timedout job handler
    11718976c53a drm/amd/display: Fix dsc eDP issue
    eba3bc49971d drm/amdgpu: add support for HDP IP version 6.1.1
    4394a810dd66 media: mediatek: vcodec: Don't try to decode 422/444 VP9
    1ba3a56f4854 media: chips-media: wave5: Process ready frames when CMD_STOP sent to Encoder
    2ed2feef3d2a media: chips-media: wave5: Fix conditional in start_streaming
    39a624a65c77 media: omap3isp: set initial format
    b78de03a56ce media: omap3isp: isppreview: always clamp in preview_try_format()
    89772f640b0b media: omap3isp: isp_video_mbus_to_pix/pix_to_mbus fixes
    cf510785f74e drm/v3d: Set DMA segment size to avoid debug warnings
    86ba653114ba spi: stm32: fix Overrun issue at < 8bpw
    a57f1024b9d7 media: dvb-core: dmxdevfilter must always flush bufs
    1aa3db5864d9 ASoC: SOF: ipc4: Support for sending payload along with LARGE_CONFIG_GET
    ca36d953d7bb drm/amd/display: Add USB-C DP Alt Mode lane limitation in DCN32
    46e108c70227 spi-geni-qcom: use xfer->bits_per_word for can_dma()
    e15d7f3597de spi-geni-qcom: initialize mode related registers to 0
    f3a26d1d0a37 drm/amdkfd: Handle GPU reset and drain retry fault race
    29fd416e0e08 drm/amdgpu: fix NULL pointer issue buffer funcs
    0c11e9f7cf94 gpu/panel-edp: add AUO panel entry for B140HAN06.4
    3f44cdb5371f drm/display/dp_mst: Add protection against 0 vcpi
    47af25d855b7 parisc: Prevent interrupts during reboot
    589b7b0fc87e arm64: tegra: smaug: Add usb-role-switch support
    eece81eeda10 Revert "arm64: zynqmp: Add an OP-TEE node to the device tree"
    3dcd45cfda1b firmware: arm_ffa: Unmap Rx/Tx buffers on init failure
    8d849adfbc3e pstore: ram_core: fix incorrect success return when vmap() fails
    d53d092019f8 sched/debug: Fix updating of ppos on server write ops
    c821922bb768 char: tpm: cr50: Remove IRQF_ONESHOT
    117fe6b91c51 mailbox: bcm-ferxrm-mailbox: Use default primary handler
    a321dd2b6356 crypto: hisilicon/qm - move the barrier before writing to the mailbox register
    76f7abd4ee01 PCI/MSI: Unmap MSI-X region on error
    bd1be0d58b61 clocksource/drivers/timer-integrator-ap: Add missing Kconfig dependency on OF
    88c76792180d clocksource/drivers/sh_tmu: Always leave device running after probe
    dea9989a3f39 bpf: Recognize special arithmetic shift in the verifier
    4e3e57dbf46d bpf: crypto: Use the correct destructor kfunc type
    caa44eb450d9 perf/x86/cstate: Add Airmont NP
    af1e3d63c8e2 perf/x86/msr: Add Airmont NP
    17440ef493aa bpf: verifier improvement in 32bit shift sign extension pattern
    5ab9a958681e sparc: don't reference obsolete termio struct for TC* constants
    8e6b0e2adf86 sparc: Synchronize user stack on fork and clone
    bfc2420bac71 block: decouple secure erase size limit from discard size limit
    1f0221070f02 blk-mq-debugfs: add missing debugfs_mutex in blk_mq_debugfs_register_hctxs()
    7fb2e1fa6e98 xenbus: Use .freeze/.thaw to handle xenbus devices
    6ac7d51ae076 ACPI: battery: fix incorrect charging status when current is zero
    7aa95b6f1465 ACPI: x86: s2idle: Invoke Microsoft _DSM Function 9 (Turn On Display)
    e3f21fdea4cb perf/cxlpmu: Replace IRQF_ONESHOT with IRQF_NO_THREAD
    7f5a66a18b5c s390/perf: Disable register readout on sampling events
    e35db916e803 cpufreq: dt-platdev: Block the driver from probing on more QC platforms
    dec123825c1e md-cluster: fix NULL pointer dereference in process_metadata_update
    d4ca6ca2c6f5 alpha: fix user-space corruption during memory compaction
    33f53ac8e9d5 powercap: intel_rapl: Add PL4 support for Ice Lake
    61103a85e632 ACPICA: Abort AML bytecode execution when executing AML_FATAL_OP
    5e7c8b5cce4c ACPI: resource: Add JWIPC JVC9100 to irq1_level_low_skip_override[]
    b803811485ac ACPI: processor: Fix NULL-pointer dereference in acpi_processor_errata_piix4()
    be10c1bdf64a EFI/CPER: don't go past the ARM processor CPER record buffer
    242c652849d9 APEI/GHES: ARM processor Error: don't go past allocated memory
    b6be51a12441 APEI/GHES: ensure that won't go past CPER allocated record
    7780c0bad2a3 EFI/CPER: don't dump the entire memory region
    0cb30030b483 x86/xen/pvh: Enable PAE mode for 32-bit guest only when CONFIG_X86_PAE is set
    7aac0a30dcf4 rnbd-srv: Zero the rsp buffer before using it
    5dbe1f143597 arm64: Add support for TSV110 Spectre-BHB mitigation
    fc38a1f0d55f perf/arm-cmn: Support CMN-600AE
    c0ec4299b15b s390/purgatory: Add -Wno-default-const-init-unsafe to KBUILD_CFLAGS
    bcbfd4d81812 tools/power cpupower: Reset errno before strtoull()
    ab6564f416a6 smb: client: prevent races in ->query_interfaces()
    5d2c4f182ea8 gfs2: fiemap page fault fix
    a20d029585c2 smb: client: add proper locking around ses->iface_last_update
    0a45c428ad19 btrfs: handle user interrupt properly in btrfs_trim_fs()
    b034e842e326 btrfs: fallback to buffered IO if the data profile has duplication
    67288113c5e6 dlm: validate length in dlm_search_rsb_tree
    f57ccd4657c7 minix: Add required sanity checking to minix_check_superblock()
    91705db6642c i3c: mipi-i3c-hci: Reset RING_OPERATION1 fields during init
    689d85945cbd i3c: master: svc: Initialize 'dev' to NULL in svc_i3c_master_ibi_isr()
    d209ebaee93f hfsplus: pretend special inodes as regular files
    5632d14b2f2a audit: add missing syscalls to read class
    727e5140e0cf fs/buffer: add alert in try_to_free_buffers() for folios without buffers
    773855c2ef5f hfsplus: fix volume corruption issue for generic/498
    3e762a03713e audit: add fchmodat2() to change attributes class
    9c1c09c3d134 statmount: permission check should return EPERM
    0fd52d901b69 rtc: interface: Alarm race handling should not discard preceding error
    70a69f675b9f libperf build: Always place libperf includes first
    5f15fa06dccb libperf: Don't remove -g when EXTRA_CFLAGS are used
    73e1f48e5149 perf vendor events amd: Fix Zen 5 MAB allocation events
    f7ed915c96b3 perf annotate: Fix memcpy size in arch__grow_instructions()
    08e16d9a3cef perf maps: Fix reference count leak in maps__find_ams()
    e9003b440603 libsubcmd: Fix null intersection case in exclude_cmds()
    2edbcd501c7b perf callchain: Fix srcline printing with inlines
    ccfafeb79a91 perf unwind-libdw: Fix invalid reference counts
    4062fb52682c perf test stat tests: Fix for virtualized machines
    99dc6b1674fb perf test stat: Update test expectations and events
    6b3dd1674005 ASoC: dt-bindings: asahi-kasei,ak5558: Fix the supply names
    6eb2b702dd61 ASoC: dt-bindings: asahi-kasei,ak4458: Fix the supply names
    cbebce4ddfab ASoC: dt-bindings: asahi-kasei,ak4458: set unevaluatedProperties:false
    596900f63aaf dt-bindings: phy: qcom-edp: Add missing clock for X Elite
    e464e26b2457 SUNRPC: fix gss_auth kref leak in gss_alloc_msg error path
    b4af38068467 SUNRPC: auth_gss: fix memory leaks in XDR decoding error paths
    6bd22de73c12 Drivers: hv: vmbus: Use kthread for vmbus interrupts on PREEMPT_RT
    e77bcf83bc90 ata: libata-scsi: refactor ata_scsi_translate()
    17df036a24aa ata: pata_ftide010: Fix some DMA timings
    f1cd271b431b ext4: use optimized mballoc scanning regardless of inode format
    61e372122b6d ext4: fix dirtyclusters double decrement on fs shutdown
    c05033cfc5c7 ext4: fix e4b bitmap inconsistency reports
    2f4b1052246c ext4: fix memory leak in ext4_ext_shift_extents()
    120c6bd7ca9d ext4: drop extent cache when splitting extent fails
    d8ee559fccde ext4: drop extent cache after doing PARTIAL_VALID1 zeroout
    96007fd3c106 ext4: don't cache extent during splitting extent
    d17857b4fb9b ext4: don't zero the entire extent if EXT4_EXT_DATA_PARTIAL_VALID1
    c83f08394056 ext4: subdivide EXT4_EXT_DATA_VALID1
    e3a6498a6339 MIPS: Work around LLVM bug when gp is used as global register variable
    6038e092508f drm/amd/display: Use same max plane scaling limits for all 64 bpp formats
    6610bc8fe927 ASoC: rockchip: i2s-tdm: Use param rate if not provided by set_sysclk
    b5f50519bf20 x86/hyperv: Fix error pointer dereference
    0761447f6f51 btrfs: fix invalid leaf access in btrfs_quota_enable() if ref key not found
    74a52716ec24 btrfs: use the correct type to initialize block reserve for delayed refs
    ba6b6f1502fa efi: Fix reservation of unaccepted memory table
    bc78bfd287f3 drm/xe/xe2_hpg: Fix handling of Wa_14019988906 & Wa_14019877138
    c89bde96e8dd drm/xe/xe2_hpg: Add set of workarounds
    9e18acc5aa0e drm/xe/ptl: Apply Wa_13011645652
    8f6848b2f6ea drm/xe/mmio: Avoid double-adjust in 64-bit reads
    26a40327c25c drm/xe: Switch MMIO interface to take xe_mmio instead of xe_gt
    f5508f1e656c drm/xe: Adjust mmio code to pass VF substructure to SRIOV code
    9472d36b3de9 drm/xe: Add xe_tile backpointer to xe_mmio
    74bff541ec88 drm/xe: Switch mmio_ext to use 'struct xe_mmio'
    0b433e086b9f drm/xe: Populate GT's mmio iomap from tile during init
    85354b21a548 drm/xe: Move GSI offset adjustment fields into 'struct xe_mmio'
    c31019bca815 drm/xe: Clarify size of MMIO region
    6c5894d7acdb drm/xe: Create dedicated xe_mmio structure
    4d4e940bc00b drm/xe: Move forcewake to 'gt.pm' substructure
    acb70e2949d4 s390/kexec: Make KEXEC_SIG available when CONFIG_MODULES=n
    2c538a0b3472 spi: wpcm-fiu: Fix potential NULL pointer dereference in wpcm_fiu_probe()
    29f3824b08a9 drm/amd/display: Fix out-of-bounds stream encoder index v3
    c4e4df8ea642 drm/amd/display: Reject cursor plane on DCE when scaled differently than primary
    a0d367e13db6 drm/amdkfd: Fix watch_id bounds checking in debug address watch v2
    288311849f8e ASoC: codecs: aw88261: Fix erroneous bitmask logic in Awinic init
    42dbd7cadc2c drm/i915/acpi: free _DSM package when no connectors
    b0f74f5d24fe ASoC: fsl_xcvr: Revert fix missing lock in fsl_xcvr_mode_put()
    c11cd77a1811 drm/amdgpu: Fix memory leak in amdgpu_ras_init()
    16e7e7ad8cdc drm/amdgpu: Use kvfree instead of kfree in amdgpu_gmc_get_nps_memranges()
    18a7bbd11f17 drm/amdgpu: Fix memory leak in amdgpu_acpi_enumerate_xcc()
    3f2d2cbe8e22 apparmor: fix aa_label to return state from compount and component match
    19f2e4055626 apparmor: fix invalid deref of rawdata when export_binary is unset
    202824a1f89a apparmor: avoid per-cpu hold underflow in aa_get_buffer
    6c7e329629a4 apparmor: make label_match return a consistent value
    d5eb32cf3e14 apparmor: remove apply_modes_to_perms from label_match
    e43818b16815 apparmor: fix rlimit for posix cpu timers
    bd7df71b91d9 apparmor: return -ENOMEM in unpack_perms_table upon alloc failure
    47e351dfef60 apparmor: Fix & Optimize table creation from possibly unaligned memory
    ec737e7fdf2f AppArmor: Allow apparmor to handle unaligned dfa tables
    3852eb9a0392 apparmor: fix NULL sock in aa_sock_file_perm
    77d2e4d03db6 net/mlx5e: Use unsigned for mlx5e_get_max_num_channels
    481a86e5a0e5 net/mlx5: Fix multiport device check over light SFs
    c65cdf46ce34 bonding: alb: fix UAF in rlb_arp_recv during bond up/down
    0ff788b84fa5 octeontx2-af: Fix default entries mcam entry action
    c480680be377 inet: move icmp_global_{credit,stamp} to a separate cache line
    5aea79b91084 icmp: prevent possible overflow in icmp_global_allow()
    a1f686d273d1 macvlan: observe an RCU grace period in macvlan_common_newlink() error path
    1ec0d56a8467 ping: annotate data-races in ping_lookup()
    6ed7864a5c1a bpftool: Fix truncated netlink dumps
    f26af58f794d ipv6: fix a race in ip6_sock_set_v6only()
    f3fe58ce3792 netfilter: nf_tables: fix use-after-free in nf_tables_addchain()
    959ea349c7e2 net: remove WARN_ON_ONCE when accessing forward path array
    64af43033503 ipvs: do not keep dest_dst if dev is going down
    06676b8ea98f netfilter: nf_conntrack_h323: don't pass uninitialised l3num value
    bb7ce39f8864 selftests: forwarding: vxlan_bridge_1d_ipv6: fix test failure with br_netfilter enabled
    48f3c88a8eaa selftests: forwarding: vxlan_bridge_1d: fix test failure with br_netfilter enabled
    724a405ce030 net: bridge: mcast: always update mdb_n_entries for vlan contexts
    ac30e78dd8de net/rds: rds_sendmsg should not discard payload_len
    ec4859ac5c93 xen-netback: reject zero-queue configuration from guest
    a488001a8197 net: usb: catc: enable basic endpoint checking
    ae3cfa51471c net: sparx5/lan969x: fix PTP clock max_adj value
    bf5009a06e03 ipv6: Fix out-of-bound access in fib6_add_rt2node().
    7ac58d883280 net: mscc: ocelot: add missing lock protection in ocelot_port_xmit_inj()
    6702700ad94c net: mscc: ocelot: split xmit into FDMA and register injection paths
    1bbcb4e9c02c net: mscc: ocelot: extract ocelot_xmit_timestamp() helper
    9e1815472ae4 net: sparx5/lan969x: fix DWRR cost max to match hardware register width
    569a833031d7 selftests: mlxsw: tc_restrictions: Fix test failure with new iproute2
    8f6833d919ba cpuidle: Skip governor when only one idle state is available
    d08fb559b455 ACPI: PM: Add unused power resource quirk for THUNDEROBOT ZERO
    f712f7256324 objpool: fix the overestimation of object pooling metadata size
    cf27a5efbbfb selftests/memfd: use IPC semaphore instead of SIGSTOP/SIGCONT
    42c7b5d00261 kbuild: Add objtool to top-level clean target
    5c32bfbcefc0 powercap: intel_rapl_tpmi: Remove FW_BUG from invalid version check
    ff0641957bce ACPI: CPPC: Fix remaining for_each_possible_cpu() to use online CPUs
    c065541b71b7 fs/ntfs3: Fix slab-out-of-bounds read in DeleteIndexEntryRoot
    b97e371e5d1c fs/ntfs3: prevent infinite loops caused by the next valid being the same
    dd6c81527d09 fs/ntfs3: Initialize new folios before use
    65521ecb8640 io_uring/cancel: de-unionize file and user_data in struct io_cancel_data
    0d1f21220261 drbd: always set BLK_FEAT_STABLE_WRITES
    68feac21bd4d dmaengine: fsl-edma: don't explicitly disable clocks in .remove()
    f076d69aae81 backlight: qcom-wled: Change PM8950 WLED configurations
    92de557d5de4 backlight: qcom-wled: Support ovp values for PMI8994
    37fa7dd13786 leds: qcom-lpg: Check the return value of regmap_bulk_write()
    7814b1431848 pinctrl: single: fix refcount leak in pcs_add_gpio_func()
    50a55756c90e pinctrl: qcom: sm8250-lpass-lpi: Fix i2s2_data_groups definition
    103ac8e3a7f3 iio: sca3000: Fix a resource leak in sca3000_probe()
    721f679d4eb2 ovl: Fix uninit-value in ovl_fill_real
    a7a7196185c3 pinctrl: equilibrium: Fix device node reference leak in pinbank_init()
    8991b4e55f85 usb: bdc: fix sleep during atomic
    024ea0d2ff89 drivers: iio: mpu3050: use dev_err_probe for regulator request
    2b81db8a7f44 mfd: simple-mfd-i2c: Add Delta TN48M CPLD support
    02302482205a mfd: simple-mfd-i2c: Keep compatible strings in alphabetical order
    8993ca8904db mfd: simple-mfd-i2c: Add SpacemiT P1 support
    5614db619980 mfd: simple-mfd-i2c: Add compatible strings for Layerscape QIXIS FPGA
    0ecce3512344 mfd: simple-mfd-i2c: Add MAX77705 support
    e0527c09bcf1 mfd: arizona: Fix regulator resource leak on wm5102_clear_write_sequencer() failure
    d225e23c07a4 Revert "mmc: rtsx_pci_sdmmc: increase power-on settling delay to 5ms"
    a771b386cb6c phy: freescale: imx8qm-hsio: fix NULL pointer dereference
    3fa4fdfe6883 coresight: etm3x: Fix cpulocked warning on cpuhp
    151becfbe1fd watchdog: starfive-wdt: Fix PM reference leak in probe error path
    91557f3459e5 iio: pressure: mprls0025pa: fix pressure calculation
    b843b1f47868 iio: pressure: mprls0025pa: fix scan_type struct
    188273fcb3c5 iio: pressure: mprls0025pa: fix interrupt flag
    14207e94fe36 iio: pressure: mprls0025pa: fix SPI CS delay violation
    72158f9ae29a iio: pressure: mprls0025pa: fix spi_transfer struct initialisation
    b58f107f359d mmc: rtsx_pci_sdmmc: increase power-on settling delay to 5ms
    1ec1a893ee2a serial: SH_SCI: improve "DMA support" prompt
    5449736d2a84 serial: imx: change SERIAL_IMX_CONSOLE to bool
    01b91cb3e748 staging: greybus: lights: avoid NULL deref
    b1e288645d69 iio: test: drop dangling symbol in gain-time-scale helpers
    9d00bf5ca6d5 soundwire: intel_ace2x: add SND_HDA_CORE dependency
    055273d82544 dma: dma-axi-dmac: fix HW scatter-gather not looking at the queue
    2813261626d4 dma: dma-axi-dmac: fix SW cyclic transfers
    25da519fb5e9 dmaengine: mediatek: uart-apdma: Fix above 4G addressing TX/RX
    525858eb00fb interconnect: mediatek: Aggregate bandwidth with saturating add
    5d7c7c54b6a5 interconnect: mediatek: Don't hijack parent device
    c5fa94489fe8 clk: mediatek: Fix error handling in runtime PM setup
    56360aa4ddd7 clk: qcom: gfx3d: add parent to parent request map
    cb7b741e350f clk: qcom: dispcc-sm7150: Fix dispcc_mdss_pclk1_clk_src
    f9c45fb866d9 clk: qcom: dispcc-sdm845: Enable parents for pixel clocks
    c4a00b99dc6d clk: Move clk_{save,restore}_context() to COMMON_CLK section
    b109dd4970a0 clk: qcom: gcc-ipq5018: flag sleep clock as critical
    596048c0d7ec clk: qcom: gcc-msm8917: Remove ALWAYS_ON flag from cpp_gdsc
    6b3b27031c5b clk: qcom: gcc-msm8953: Remove ALWAYS_ON flag from cpp_gdsc
    a4fb5a9dc622 clk: qcom: gcc-qdu1000: Update the SDCC RCGs to use shared_floor_ops
    0c74a63b797c clk: qcom: gcc-x1e80100: Update the SDCC RCGs to use shared_floor_ops
    1936fe74af4a clk: qcom: gcc-sdx75: Update the SDCC RCGs to use shared_floor_ops
    daa1b65f23cd clk: qcom: gcc-sm4450: Update the SDCC RCGs to use shared_floor_ops
    99db18b34fd6 clk: qcom: gcc-sm8450: Update the SDCC RCGs to use shared_floor_ops
    762c69e6ed2a clk: meson: gxbb: Limit the HDMI PLL OD to /4 on GXL/GXM SoCs
    909b48a3b3b4 clk: qcom: rcg2: compute 2d using duty fraction directly
    662676d6e735 clk: qcom: gcc-sm8650: Use floor ops for SDCC RCGs
    b1b6935689b8 clk: qcom: gcc-sm8550: Use floor ops for SDCC RCGs
    762a26818934 fbdev: au1200fb: Fix a memory leak in au1200fb_drv_probe()
    f620398f0db1 fbdev: of_display_timing: Fix device node reference leak in of_get_display_timings()
    bcd1aea42610 tracing: Remove duplicate ENABLE_EVENT_STR and DISABLE_EVENT_STR macros
    9b0513905e05 tracing: Properly process error handling in event_hist_trigger_parse()
    596c8b168cfd fs/nfs: Fix readdir slow-start regression
    2eff9d3537b8 nvdimm: virtio_pmem: serialize flush requests
    6037124dbf67 scsi: csiostor: Fix dereference of null pointer rn
    eb10468cef22 scsi: ufs: host: mediatek: Require CONFIG_PM
    d52e13122d37 scsi: smartpqi: Fix memory leak in pqi_report_phys_luns()
    b3a8b2bbc48e pNFS: fix a missing wake up while waiting on NFS_LAYOUT_DRAIN
    84667e99a8bc RDMA/uverbs: Add __GFP_NOWARN to ib_uverbs_unmarshall_recv() kmalloc
    2b3b3e0d8abf power: supply: qcom_battmgr: Recognize "LiP" as lithium-polymer
    9fab0120907e power: supply: pm8916_lbc: Fix use-after-free for extcon in IRQ handler
    896a54984905 mtd: spinand: Fix kernel doc
    fbd5b014a966 mtd: parsers: ofpart: fix OF node refcount leak in parse_fixed_partitions()
    130381dd82e7 cxl: Fix premature commit_end increment on decoder commit failure
    5c32cabddc4e RDMA/core: add rdma_rw_max_sge() helper for SQ sizing
    3c2ae79fb19d RDMA/rxe: Fix race condition in QP timer handlers
    ee998cdbff66 RDMA/mlx5: Fix memory leak in GET_DATA_DIRECT_SYSFS_PATH handler
    d533425ac1f2 RDMA/uverbs: Validate wqe_size before using it in ib_uverbs_post_send
    8d9798d6ff41 NFS/localio: use GFP_NOIO and non-memreclaim workqueue in nfs_local_commit
    af87ebd34318 nfs/localio: eliminate unnecessary kref in nfs_local_fsync_ctx
    e97f5fac8ce9 mtd: parsers: Fix memory leak in mtd_parser_tplink_safeloader_parse()
    d473b0677310 crypto: ccp - Send PSP_CMD_TEE_RING_DESTROY when PSP_CMD_TEE_RING_INIT fails
    90c1858d4e65 crypto: ccp - Factor out ring destroy handling to a helper
    809fd697dab0 crypto: ccp - Add an S4 restore flow
    122c3cb563bd crypto: ccp - Declare PSP dead if PSP_CMD_TEE_RING_INIT fails
    38c30ee6a626 platform/x86/amd/pmf: Prevent TEE errors after hibernate
    3d2b60a8d682 vfio/pci: Lock upstream bridge for vfio_pci_core_disable()
    12e07451ef98 mtd: rawnand: cadence: Fix return type of CDMA send-and-wait helper
    9b67c7fd5bff IB/mlx5: Fix port speed query for representors
    c8fb5c965ac7 RDMA/mlx5: Fix UMR hang in LAG error state unload
    f143ea1ff6bd tools/power/x86/intel-speed-select: Fix file descriptor leak in isolate_cpus()
    38c5b49fffa1 RDMA/iwcm: Fix workqueue list corruption by removing work_list
    ce6f8e007682 RDMA/rxe: Fix double free in rxe_srq_from_init
    6b644871d4e4 RDMA/rtrs-srv: fix SG mapping
    93bdf715d33c power: supply: wm97xx: Fix NULL pointer dereference in power_supply_changed()
    352e364a56cc power: supply: bq27xxx: fix wrong errno when bus ops are unsupported
    e9667db8b17e power: reset: nvmem-reboot-mode: respect cell size for nvmem_cell_write
    82d3eb97a976 power: supply: sbs-battery: Fix use-after-free in power_supply_changed()
    2178dc65d45e power: supply: rt9455: Fix use-after-free in power_supply_changed()
    dbe579e620ef power: supply: pm8916_lbc: Fix use-after-free in power_supply_changed()
    b69bb88e20c6 power: supply: pm8916_bms_vm: Fix use-after-free in power_supply_changed()
    4350505e82b4 power: supply: goldfish: Fix use-after-free in power_supply_changed()
    f3fbe309c9bf power: supply: cpcap-battery: Fix use-after-free in power_supply_changed()
    4aeaf03c1726 power: supply: bq25980: Fix use-after-free in power_supply_changed()
    83c27fdd696a power: supply: bq256xx: Fix use-after-free in power_supply_changed()
    76a42ba547a9 power: supply: act8945a: Fix use-after-free in power_supply_changed()
    847eeb6c0efc power: supply: ab8500: Fix use-after-free in power_supply_changed()
    7ac44096bad0 RDMA/hns: Notify ULP of remaining soft-WCs during reset
    c3c45f367981 RDMA/hns: Fix RoCEv1 failure due to DSCP
    562c96b1393d RDMA/hns: Fix WQ_MEM_RECLAIM warning
    2adc6c08f960 IB/cache: update gid cache on client reregister event
    46ccb0a0f950 RDMA/rtrs: server: remove dead code
    6d59928f8b0e octeontx2-pf: Unregister devlink on probe failure
    193a9e2d4d18 ionic: Rate limit unknown xcvr type messages
    63692055743e octeon_ep_vf: ensure dbell BADDR updation
    530a79f0589c octeon_ep: ensure dbell BADDR updation
    2286bfef3368 octeon_ep: disable per ring interrupts
    52731ef44381 serial: caif: fix use-after-free in caif_serial ldisc_close()
    b04061f89ffc xfrm: fix ip_rt_bug race in icmp_route_lookup reverse path
    35e00df60f7e net: Switch to skb_dstref_steal/skb_dstref_restore for ip_route_input callers
    791f028b1e42 net: Add skb_dstref_steal and skb_dstref_restore
    b89269bdb3ba net: sunhme: Fix sbus regression
    21c303fec138 net: atm: fix crash due to unvalidated vcc pointer in sigd_send()
    e99f816a424e smb: client: correct value for smbd_max_fragmented_recv_size
    73ec7c96601d procfs: fix missing RCU protection when reading real_parent in do_task_stat()
    d2c785733dfb net: hns3: fix double free issue for tx spare buffer
    5cd63214b529 PCI: Add ACS quirk for Pericom PI7C9X2G404 switches [12d8:b404]
    05feaf826390 netfilter: nft_set_rbtree: check for partial overlaps in anonymous sets
    afe1a28fa9de netfilter: nft_set_rbtree: fix bogus EEXIST with NLM_F_CREATE with null interval
    4f899976eedc netfilter: nft_counter: fix reset of counters on 32bit archs
    bce4581e02d5 netfilter: nft_set_hash: fix get operation on big endian
    79b713ef4261 netfilter: nfnetlink_queue: do shared-unconfirmed check before segmentation
    371de2bef658 netfilter: nfnetlink_queue: optimize verdict lookup with hash table
    cf70cedce327 nfc: hci: shdlc: Stop timers and work before freeing context
    19e42490c89b inet: RAW sockets using IPPROTO_RAW MUST drop incoming ICMP
    da637d725a11 bonding: only set speed/duplex to unknown, if getting speed failed
    7d56ba306e93 octeontx2-af: Fix PF driver crash with kexec kernel booting
    73db8a61af8b mptcp: fix receive space timestamp initialization
    1f5433b23e2a of: unittest: fix possible null-pointer dereferences in of_unittest_property_copy()
    530d1ecd3639 ucount: check for CAP_SYS_RESOURCE using ns_capable_noaudit()
    d075cf169e82 ipc: don't audit capability check in ipc_permissions()
    a4720c30ea77 selftests/mm: convert page_size to unsigned long
    306c11e7b82e selftests/mm: pagemap_ioctl: Fix types mismatches shown by compiler options
    3f3dc0663ca1 PCI/ACPI: Restrict program_hpx_type2() to AER bits
    7d168610e727 PCI: Add defines for bridge window indexing
    f68179cc3d88 PCI: Initialize RCB from pci_configure_device()
    ef04714ef4ae wifi: ath10k: sdio: add missing lock protection in ath10k_sdio_fw_crashed_dump()
    0f514a9bf432 PCI: Check parent for NULL in of_pci_bus_release_domain_nr()
    f4a681c870d1 tcp: tcp_tx_timestamp() must look at the rtx queue
    955c5d670b5a fat: avoid parent link count underflow in rmdir
    063a6f22478e nfsd: never defer requests during idmap lookup
    e4d0e135ee38 xdrgen: Initialize data pointer for zero-length items
    25ad5d691390 NFS: NFSERR_INVAL is not defined by NFSv2
    a3a05e5ae1bb xdrgen: Fix struct prefix for typedef types in program wrappers
    771ba4c6a805 dm: use bio_clone_blkg_association
    a84d30e8d2ba iommu/vt-d: Clear Present bit before tearing down PASID entry
    e148b5194ad9 iommu/vt-d: Avoid draining PRQ in sva mm release path
    191311180935 iommu/vt-d: Drain PRQs when domain removed from RID
    d5cd1db0ac93 iommu/vt-d: Separate page request queue from SVM
    5962c30a6f05 iommu/vt-d: Flush cache for PASID table before using it
    428a543c4ab1 PCI: Mark 3ware-9650SA Root Port Extended Tags as broken
    19d0708a39ed kallsyms/ftrace: set module buildid in ftrace_mod_address_lookup()
    0bdc4b1ad694 module: add helper function for reading module_buildid()
    95d9748cc9b4 netfilter: nf_conncount: fix tracking of connections from localhost
    63fece123bbe netfilter: nft_compat: add more restrictions on netlink attributes
    3d0994ed0aa1 netfilter: nf_conncount: increase the connection clean up limit to 64
    4fe47671aa29 netfilter: nf_conncount: make nf_conncount_gc_list() to disable BH
    01726b9021cb netfilter: nf_tables: reset table validation state on abort
    f6c4c7a5cf5b wifi: cfg80211: stop NAN and P2P in cfg80211_leave
    fa9861e5c8af mctp i2c: initialise event handler read bytes
    8468dd5bc1c4 net: mctp-i2c: fix duplicate reception of old data
    414259caf81a quota: fix livelock between quotactl and freeze_super
    dec62b741a39 dm: use READ_ONCE in dm_blk_report_zones
    175ac0a61154 dm: fix unlocked test for dm_suspended_md
    160913364fcc PCI/portdrv: Fix potential resource leak
    d773a4826195 PCI: Do not attempt to set ExtTag for VFs
    c8c6cb9fa632 Documentation: tracing: Add PCI tracepoint documentation
    2cacab8c7a05 Documentation: trace: Refactor toctree
    b53efc230ab2 docs: fix WARNING document not included in any toctree
    51b7181cfbed PCI/P2PDMA: Release per-CPU pgmap ref when vm_insert_page() fails
    33b2230edd86 wifi: cfg80211: Fix use_for flag update on BSS refresh
    9e2b4159289c PCI/PM: Avoid redundant delays on D3hot->D3cold
    29c4f6e0ac97 Documentation: PCI: endpoint: Fix ntb/vntb copy & paste errors
    e44b390e01c1 PCI: mediatek: Fix IRQ domain leak when MSI allocation fails
    d8308dff30bd hwmon: (pmbus/mpq8785) fix VOUT_MODE mismatch during identification
    369d2ed2da20 hwmon: pmbus: mpq8785: Add support for MPM82504
    8c311c726f1f hwmon: pmbus: mpq8785: Implement VOUT feedback resistor divider ratio configuration
    7cd0bc5fe14c hwmon: pmbus: mpq8785: Prepare driver for multiple device support
    914b47c9b824 Revert "hwmon: (ibmpex) fix use-after-free in high/low store"
    ee842490a604 spi: tools: Add include folder to .gitignore
    0b605e8ce606 HID: intel-ish-hid: fix NULL-ptr-deref in ishtp_bus_remove_all_clients
    1a2482e5fcb4 platform/chrome: cros_ec_lightbar: Fix response size initialization
    be7486307449 drm/xe: Unregister drm device on probe error
    450d8e18ba8b evm: Use ordered xattrs list to calculate HMAC in evm_init_hmac()
    e25b9f071226 media: uvcvideo: Fix allocation for small frame sizes
    9aae11893e55 platform/chrome: cros_typec_switch: Don't touch struct fwnode_handle::dev
    b61deabec46b drm/buddy: release free_trees array on buddy mm teardown
    af8294a2a51c drm/msm/a2xx: fix pixel shader start on A225
    9f6453e5177a media: ccs: Accommodate C-PHY into the calculation
    33a76dcced8c drm/msm/dpu: fix CMD panels on DPU 1.x - 3.x
    9c53a12b3eb4 drm/msm/disp: set num_planes to 1 for interleaved YUV formats
    d955aeb26e12 HID: playstation: Add missing check for input_ff_create_memless
    db3cc304a9a6 regulator: core: move supply check earlier in set_machine_constraints()
    a2106181066a drm/msm/dpu: fix WD timer handling on DPU 8.x
    f5478534cd47 drm/msm/dpu: Set vsync source irrespective of mdp top support
    03306604738b drm/msm/disp/dpu: add merge3d support for sc7280
    ba4c9a09e360 drm/amdgpu: Use explicit VCN instance 0 in SR-IOV init
    0d4c7c2cbdf9 drm/amdkfd: Fix signal_eviction_fence() bool return value
    9654ca3790b1 drm/amd: Drop "amdgpu kernel modesetting enabled" message
    52defdd4034d media: chips-media: wave5: Fix memory leak on codec_info allocation failure
    3ad42057c5b8 ASoC: nau8821: Fixup nau8821_enable_jack_detect()
    47e5bf04d05b ASoC: nau8821: Avoid unnecessary blocking in IRQ handler
    bbedfab10d49 ASoC: nau8821: Consistently clear interrupts before unmasking
    f8071500177f smack: /smack/doi: accept previously used values
    17da2a78bd31 smack: /smack/doi must be > 0
    b78e8a12edb3 drm/panthor: Evict groups before VM termination
    d12be704f710 ALSA: vmaster: Relax __free() variable declarations
    37135ec54b97 ALSA: pcm: Relax __free() variable declarations
    232cfc860a9d ALSA: pcm: use new array-copying-wrapper
    a54e02cc637b drm/panel: sw43408: Remove manual invocation of unprepare at remove
    00b16c7b17b4 workqueue: Process rescuer work items one-by-one using a cursor
    2178f0587c91 workqueue: Only assign rescuer work when really needed
    fa80f288a5e4 workqueue: Factor out assign_rescuer_work()
    104504a773b3 drm/panthor: Make sure we resume the tick when new jobs are submitted
    47b2d73b5a0e drm/panthor: Fix the logic that decides when to stop ticking
    4f74f3da52cb drm/panthor: Fix immediate ticking on a disabled tick
    bab13dcc4404 drm/panthor: Fix the group priority rotation logic
    202d532672b3 drm/panthor: Fix the full_tick check
    8ec4f1b14a61 drm/panthor: Recover from panthor_gpu_flush_caches() failures
    50a74e38ded1 arm64: dts: qcom: sm6115: Add CX_MEM/DBGC GPU regions
    b5dc5990ee32 arm64: dts: qcom: agatti: Add CX_MEM/DBGC GPU regions
    5d31ca77c743 arm64: dts: qcom: x1e: bus is 40-bits (fix 64GB models)
    466400375386 arm64: dts: qcom: sdm845-db845c: specify power for WiFi CH1
    e3e856e399ed arm64: dts: qcom: sdm845-db845c: drop CS from SPIO0
    982a23d5d35b arm64: dts: qcom: qrb4210-rb2: Fix UART3 wakeup IRQ storm
    8f15df824262 arm64: dts: amlogic: g12: assign the MMC A signal clock
    041037a24fbe arm64: dts: amlogic: g12: assign the MMC B and C signal clocks
    8f5196fc8d17 arm64: dts: amlogic: gx: assign the MMC signal clocks
    0378739bc8ce arm64: dts: amlogic: axg: assign the MMC signal clocks
    ddf288f21d7a arm64: dts: amlogic: c3: assign the MMC signal clocks
    d1ffd3c633a9 hwspinlock: omap: Handle devm_pm_runtime_enable() errors
    03af8c0d468e arm64: dts: ti: k3-j784s4-j742s2-main-common.dtsi: Refactor watchdog instances for j784s4
    3f1cb740e890 arm64: dts: ti: k3-j784s4-main.dtsi: Move c71_3 node to appropriate order
    448d14117381 arm64: dts: amlogic: s4: fix mmc clock assignment
    6cdbd53e0867 arm64: dts: amlogic: s4: assign mmc b clock to 24MHz
    3d9d76bfaf28 arm64: dts: mediatek: mt8183-jacuzzi-pico6: Fix typo in pinmux node
    e018f7d42b58 arm: dts: lpc32xx: add clocks property to Motor Control PWM device tree node
    4b992b5cadf6 ARM: dts: lpc32xx: Set motor PWM #pwm-cells property value to 3 cells
    f8b16d5764ee powerpc/eeh: fix recursive pci_lock_rescan_remove locking in EEH event handling
    a58c97828911 soc: mediatek: svs: Fix memory leak in svs_enable_debug_write()
    cdcc7e335f2d soc: qcom: cmd-db: Use devm_memremap() to fix memory leak in cmd_db_dev_probe
    682d9d73d513 powerpc/uaccess: Move barrier_nospec() out of allow_read_{from/write}_user()
    37cf81576dff ARM: dts: allwinner: sun5i-a13-utoo-p66: delete "power-gpios" property
    5a6ebb6cc3c5 arm64: dts: qcom: msm8994-octagon: Fix Analog Devices vendor prefix of AD7147
    dce238e12d94 arm64: dts: qcom: x1e80100: Fix USB combo PHYs SS1 and SS2 ref clocks
    a7037c3eb013 arm64: dts: qcom: sdm845-oneplus: Mark l14a regulator as boot-on
    c818d840c878 arm64: dts: qcom: sdm845-oneplus: Don't mark ts supply boot-on
    cd4b042521d2 arm64: dts: qcom: sdm630: fix gpu_speed_bin size
    7aaa4384b871 clk: qcom: Return correct error code in qcom_cc_probe_by_index()
    5c85820e3905 arm64: dts: tqma8mpql-mba8mp-ras314: Fix HDMI CEC pad control settings
    255af53a67e1 arm64: dts: tqma8mpql-mba8mpxl: Fix HDMI CEC pad control settings
    4a4ffd352a69 firmware: arm_ffa: Correct 32-bit response handling in NOTIFICATION_INFO_GET
    dca904ffd751 EDAC/i5400: Fix snprintf() limit calculation in calculate_dimm_size()
    1fd7c29a1543 EDAC/i5000: Fix snprintf() size calculation in calculate_dimm_size()
    35b034cfddca soc: qcom: smem: handle ENOMEM error during probe
    9a6fc69a570c pstore/ram: fix buffer overflow in persistent_ram_save_old()
    d5b7730f0699 hwrng: core - use RCU and work_struct to fix race condition
    24761c8441c4 hwrng: core - Allow runtime disabling of the HW RNG
    38d80307decc crypto: starfive - Fix memory leak in starfive_aes_aead_do_one_req()
    acd06323c2c4 fs/tests: exec: drop duplicate bprm_stack_limits test vectors
    a6a73403733e sched/rt: Skip currently executing CPU in rto_next_cpu()
    375622de010f sched/deadline: Clear the defer params
    6e661a23d886 media: pci: mg4b: Use IRQF_NO_THREAD
    8da4ba169435 mfd: wm8350-core: Use IRQF_ONESHOT
    670abc7e5694 EDAC/altera: Remove IRQF_ONESHOT
    fb7481344f9e scsi: efct: Use IRQF_ONESHOT and default primary handler
    be3ff229b90a Bluetooth: btintel_pcie: Use IRQF_ONESHOT and default primary handler
    5938fb0e3285 platform/x86: int0002: Remove IRQF_ONESHOT from request_irq()
    a13566c2f7b7 genirq: Set IRQF_COND_ONESHOT in devm_request_irq().
    0db169a91381 bpf: Fix bpf_xdp_store_bytes proto for read-only arg
    d5c6f254528c crypto: caam - fix netdev memory leak in dpaa2_caam_probe
    96bac9ce2292 crypto: hisilicon/trng - support tfms sharing the device
    a9c6d178d822 x86/fgraph,bpf: Switch kprobe_multi program stack unwind to hw_regs path
    41d766859df7 x86/fgraph,bpf: Fix stack ORC unwind from kprobe_multi return probe
    3eb79d8d02c7 tracing: Add ftrace_fill_perf_regs() for perf event
    a142bbc11f8b tracing: Add ftrace_partial_regs() for converting ftrace_regs to pt_regs
    33d4e904e24d fgraph: Replace fgraph_ret_regs with ftrace_regs
    fee2da394085 ftrace: Rename ftrace_regs_return_value to ftrace_regs_get_return_value
    ff57dbe037be ftrace: Use arch_ftrace_regs() for ftrace_regs_*() macros
    a701884d1398 ftrace: Consolidate ftrace_regs accessor functions for archs using pt_regs
    550a16d87d33 ftrace: Make ftrace_regs abstract from direct use
    ef3166bd8d33 tracing: Add a comment about ftrace_regs definition
    c2681ce178a2 bpf, sockmap: Fix FIONREAD for sockmap
    4f9f0cbb4b27 bpf, sockmap: Fix incorrect copied_seq calculation
    57cd88f4b609 crypto: ccp - narrow scope of snp_range_list
    1c3506ea8599 crypto: ccp - Ensure implicit SEV/SNP init and shutdown in ioctls
    cf8a8f13deb0 hrtimer: Fix trace oddity
    0f893b33e6a7 selftests/bpf: Fix resource leak in serial_test_wq on attach failure
    58059335e465 bpf: Preserve id of register in sync_linked_regs()
    0bbfa5542670 crypto: hisilicon/sec2 - support skcipher/aead fallback for hardware queue unavailable
    21ad2c1dcb18 crypto: hisilicon/zip - adjust the way to obtain the req in the callback function
    ce2e7e471da0 crypto: octeontx - fix dma_free_coherent() size
    dc8af9baf764 crypto: cavium - fix dma_free_coherent() size
    4e39e4d847b0 ARM: VDSO: Patch out __vdso_clock_getres() if unavailable
    5731312c4cb5 libbpf: Fix OOB read in btf_dump_get_bitfield_value
    5478540eafbe selftests/bpf: veristat: fix printing order in output_stats()
    138fc0ee9034 crypto: qat - fix warning on adf_pfvf_pf_proto.c
    9faf20a1819b perf/x86/core: Do not set bit width for unavailable counters
    f96c5ccf95ae s390/cio: Fix device lifecycle handling in css_alloc_subchannel()
    06b3e765fdc5 PM: sleep: wakeirq: harden dev_pm_clear_wake_irq() against races
    73caf86fe92e cpufreq: intel_pstate: Enable asym capacity only when CPU SMT is not possible
    26bec96bc5f3 perf: arm_spe: Properly set hw.state on failures
    b909d420d6b8 PM: wakeup: Handle empty list in wakeup_sources_walk_start()
    c94fd6e8a71e md/raid1: fix memory leak in raid1_run()
    aaac92c72d6e md/raid1: fix memory leak in raid1_run() if no active rdev
    db8c4b15deab Partial revert "x86/xen: fix balloon target initialization for PVH dom0"
    dbe8e81a2ec6 ublk: Validate SQE128 flag before accessing the cmd
    8af710156c53 thermal/of: Fix reference leak in thermal_of_cm_lookup()
    87283ce6218b iomap: fix submission side handling of completion side errors
    10bb2f5d365d cpufreq: scmi: Fix device_node reference leak in scmi_cpu_domain_id()
    b114bc9f075c OPP: Return correct value in dev_pm_opp_get_level
    9a205d16e88b md/raid10: fix any_working flag handling in raid10_sync_request
    fcb54ef1dbfc md/raid5: fix raid5_run() to return error when log_init() fails
    3c08d86d0c8e thermal: intel: x86_pkg_temp_thermal: Handle invalid temperature
    101cc8e5506a cpuidle: governors: menu: Always check timers with tick stopped
    c812673deb81 io_uring/sync: validate passed in offset
    cce354524da4 ACPICA: Fix NULL pointer dereference in acpi_ev_address_space_dispatch()
    a67a23e9dedf io_uring: use release-acquire ordering for IORING_SETUP_R_DISABLED
    becedc3aceca xen/virtio: Don't use grant-dma-ops when running as Dom0
    4dd5c62c201c rnbd-srv: Fix server side setting of bi_size for special IOs
    5afd2f4e1608 rnbd-srv: use bio_add_virt_nofail
    cef2315cb84e block: add a bio_add_virt_nofail helper
    4d339b219004 smb: client: fix potential UAF and double free in smb2_open_file()
    4eb830847d84 btrfs: fix block_group_tree dirty_list corruption
    af30ffbdeb05 btrfs: qgroup: return correct error when deleting qgroup relation item
    8d582d65d20b erofs: handle end of filesystem properly for file-backed mounts
    113eac582ccb erofs: get rid of raw bi_end_io() usage
    cc09d55f519e tpm: st33zp24: Fix missing cleanup on get_burstcount() error
    a61b8412e3eb tpm: tpm_i2c_infineon: Fix locality leak on get_burstcount() failure
    140a45bd4f6d i3c: dw: Fix memory leak in dw_i3c_master_i2c_xfers()
    7ff9c410dd26 i3c: dw: Initialize spinlock to avoid upsetting lockdep
    87d4954b5c59 gfs2: Fix use-after-free in iomap inline data write path
    ca7c67bdd293 gfs2: Fix slab-use-after-free in qd_put
    ae4d9781ed0f gfs2: Retries missing in gfs2_{rename,exchange}
    1d8a994edffa i3c: master: Update hot-join flag only on success
    7edd798f191e fs: add <linux/init_task.h> for 'init_fs'
    28050803c559 i3c: Move device name assignment after i3c_bus_init
    01fd0ceb44e1 audit: move the compat_xxx_class[] extern declarations to audit_arch.h
    1f16679a5aa6 rcu: Fix rcu_read_unlock() deadloop due to softirq
    586a5effe50f rcu: Remove local_irq_save/restore() in rcu_preempt_deferred_qs_handler()
    24d44e0f05ab rcu: Refactor expedited handling check in rcu_read_unlock_special()
    51838112d9c2 hfsplus: return error when node already exists in hfs_bnode_create
    517813eb6e73 auxdisplay: arm-charlcd: fix release_mem_region() size
    9c80d688f402 RDMA/umad: Reject negative data_len in ib_umad_write
    87b7a036d2c7 RDMA/siw: Fix potential NULL pointer dereference in header processing

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index a8d17a5c14..444cab413f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -15,13 +15,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "96b72162b68a3a6084945ef4bf357a3de5c196ed"
-SRCREV_meta ?= "d427132ce6626fdae8a1690305e1b578a5509699"
+SRCREV_machine ?= "5c7879a7b2753ea23b696b6a3e7e4a38c40f5776"
+SRCREV_meta ?= "9a7e5434a02c01df4901784d29694d940743d56c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.74"
+LINUX_VERSION ?= "6.12.76"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 22b15e69f2..63135de5c7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.74"
+LINUX_VERSION ?= "6.12.76"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "daff0c37ea8999b6dbd3c7e2d761a102fe32a23d"
-SRCREV_meta ?= "d427132ce6626fdae8a1690305e1b578a5509699"
+SRCREV_machine ?= "b1a05d710b72913717bcc1139e714080d99e79a8"
+SRCREV_meta ?= "9a7e5434a02c01df4901784d29694d940743d56c"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 92807f9057..0e1b1fa61f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "f4b46d6d3a4e38d532c5e11866d3d071ae398f16"
-SRCREV_machine:qemuarm64 ?= "daff0c37ea8999b6dbd3c7e2d761a102fe32a23d"
-SRCREV_machine:qemuloongarch64 ?= "daff0c37ea8999b6dbd3c7e2d761a102fe32a23d"
-SRCREV_machine:qemumips ?= "da8487babd144628f801a204696523e077829fa2"
-SRCREV_machine:qemuppc ?= "daff0c37ea8999b6dbd3c7e2d761a102fe32a23d"
-SRCREV_machine:qemuriscv64 ?= "daff0c37ea8999b6dbd3c7e2d761a102fe32a23d"
-SRCREV_machine:qemuriscv32 ?= "daff0c37ea8999b6dbd3c7e2d761a102fe32a23d"
-SRCREV_machine:qemux86 ?= "daff0c37ea8999b6dbd3c7e2d761a102fe32a23d"
-SRCREV_machine:qemux86-64 ?= "daff0c37ea8999b6dbd3c7e2d761a102fe32a23d"
-SRCREV_machine:qemumips64 ?= "29ca2370cd8722cc5fd712f4a6b4757ad84fde3e"
-SRCREV_machine ?= "daff0c37ea8999b6dbd3c7e2d761a102fe32a23d"
-SRCREV_meta ?= "d427132ce6626fdae8a1690305e1b578a5509699"
+SRCREV_machine:qemuarm ?= "9dcacd6df5189be895d0b0d59d728ef61743338d"
+SRCREV_machine:qemuarm64 ?= "b1a05d710b72913717bcc1139e714080d99e79a8"
+SRCREV_machine:qemuloongarch64 ?= "b1a05d710b72913717bcc1139e714080d99e79a8"
+SRCREV_machine:qemumips ?= "eca7f78fe1f9f2bd98951df1100e46a8e39d0ea0"
+SRCREV_machine:qemuppc ?= "b1a05d710b72913717bcc1139e714080d99e79a8"
+SRCREV_machine:qemuriscv64 ?= "b1a05d710b72913717bcc1139e714080d99e79a8"
+SRCREV_machine:qemuriscv32 ?= "b1a05d710b72913717bcc1139e714080d99e79a8"
+SRCREV_machine:qemux86 ?= "b1a05d710b72913717bcc1139e714080d99e79a8"
+SRCREV_machine:qemux86-64 ?= "b1a05d710b72913717bcc1139e714080d99e79a8"
+SRCREV_machine:qemumips64 ?= "8acf70fbeddae4770f3d24cbd8548402ae6a4f9e"
+SRCREV_machine ?= "b1a05d710b72913717bcc1139e714080d99e79a8"
+SRCREV_meta ?= "9a7e5434a02c01df4901784d29694d940743d56c"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "444b39ef6108313e8452010b22aaba588e8fb92b"
+SRCREV_machine:class-devupstream ?= "39b686f8d57d7506af7789e915fe7fd103b0fe57"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.74"
+LINUX_VERSION ?= "6.12.76"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


