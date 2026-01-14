Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C44F2D38FF9
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 17:24:26 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15741.1768411458176241792
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 09:24:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CujaT2fS;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8b31a665ba5so4640185a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 09:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768411457; x=1769016257; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1E6msyy3bwLtJgu2kuYWiQoushvxpazZNoB1WqOorAU=;
        b=CujaT2fSlpaHm7lKUUzN6w9eJAdddi/BnE/7iWjzYQ+7LxJS5ensMQ1flLhTTmmb9h
         sgjZSra5VLvergBPEc+YgTUF9X5O8+18ohiaVAxxDiupdtUwvlW2U3Zdrrz6DONBV6EI
         nT1vqrj1kHRIKAkhwfSptmxe7OPN9e7mqOWpOq6JiyM8mhZ8W0ifbRpJ4nCY9bQCCF0Y
         QmvzgPc5m+Ok+4VZe1POR9n5Pqkz+kIlKOGyPa+qnYI8vg042i/ilBuyp5+8DGIhLFuu
         BbZ6D8HGmswgO7Zqy1Ab5qLsF+ORFwFkU6xbUqMIg4VDGXWquOBeQvrgQB5NHN68qrAg
         QGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768411457; x=1769016257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1E6msyy3bwLtJgu2kuYWiQoushvxpazZNoB1WqOorAU=;
        b=wVZ1m/I7h2d2j2zjCoBHnXsaIFmScWow8bDeogbWjLNNKR2RoB+sHghLOWAeEk1Tl9
         C4qm7EfnmzBfVCoLJlRBCb5k9Qrw4ZSUhh1AhHTXUWI0dP09b2VHlK11KWTw1I2lWUGZ
         /Kz2hzBjErKKthd2tdEs+3YXOJC6YksTwqt5WhundxAqCKxzeXATMwkKn0hyQGnU88En
         3NednSXoTkdBbYi1iZpnTYZjAqmHnKQ2NzNEeNC0If3zhxkhuSIThqhAAXrdj/5yryIX
         Me3G6VJTNwnq4bqV5PjTkdm0xnMOKaQUnRGytVTzUq6iYx98B3j6w+j0/xSKHwmGV/s4
         oK3Q==
X-Gm-Message-State: AOJu0Yxe1HHcjwh5HfLkZHpvNP+59OZA+G4YV0u6DEkdkavA9PEjukiX
	l4ERHN5bxTONseXqN8dPChvkPQCMzy2kmo6ujAfhBZCT6/O+pjACtyUneTpKhea+abE=
X-Gm-Gg: AY/fxX4OcwTW+LpM+zfi75y2yTgnPB/0ym+00iu4KWFAHVpyX0D6733+z2hyHiE0xBw
	Nyy0rYtqJ4wVDJJMRBTPNn77S/Oop2kwS9Z+PBdqHgakD43XfdaBf9TTt1LWOqE1kbkwYHiIheV
	LtxXM9+PZFxzYnB1XS56Ce8XXTAr1MPnu3vWU1nJwZgpkDeH4pDutE1T28ghOEEozZrTL43F4CN
	mcK9NzqY7dAE+eACcxK5+aCKMedboxygOWz35UfOzBHGbpX6CeCjvjmcT3WMMuyfkV/nusR9y/F
	kGAVuJYiGTOzXhhaXpGKuugnlZSHYh+K1miDWT3cFtoWvRQsyt+NjGAXjGNzkFMCeSydAOf0xBS
	NQWnK93cmw/WLlkrKeISRDi3H17A5MOPiE9uZnX9lSipnXdWakIOJtxw8ZbIa94vQGVeMMdutx5
	aiLDgM/ym1Qy+d0I/hFORa9zyyJyjplsgZ1kfeDn2QxlvEevSlh3u/nuhcJTLu/Xy5kjRKvlcLi
	z8GGGCFDpTAkVI=
X-Received: by 2002:a05:620a:178c:b0:8c5:3415:acef with SMTP id af79cd13be357-8c53415aecemr258694085a.55.1768411456602;
        Wed, 14 Jan 2026 09:24:16 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c530bc0d9fsm197711385a.45.2026.01.14.09.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 09:24:15 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 04/06] linux-yocto/6.12: update to v6.12.64
Date: Wed, 14 Jan 2026 12:24:04 -0500
Message-ID: <20260114172406.2271015-5-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114172406.2271015-1-bruce.ashfield@gmail.com>
References: <20260114172406.2271015-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 17:24:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229360

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    1a4a7249e794 Linux 6.12.64
    c8cdc025a6d2 block: fix NULL pointer dereference in blk_zone_reset_all_bio_endio()
    51297686e00f iomap: allocate s_dio_done_wq for async reads as well
    b1671989173d mm/damon/tests/vaddr-kunit: handle alloc failures on damon_do_test_apply_three_regions()
    7ca5ed830df4 mm/damon/tests/core-kunit: handle alloc failres in damon_test_new_filter()
    d13c133704a6 mm/damon/tests/core-kunit: handle alloc failures on damon_test_split_regions_of()
    ce19b1716361 vfio/pci: Disable qword access to the PCI ROM bar
    527a73d111a6 media: amphion: Remove vpu_vb_is_codecconfig
    915775d03710 media: amphion: Make some vpu_v4l2 functions static
    ce6f2d63edcd media: amphion: Add a frame flush mode for decoder
    b92c19675f63 media: mediatek: vcodec: Use spinlock for context list protection lock
    a219c54a15c4 powerpc/pseries/cmm: adjust BALLOON_MIGRATE when migrating pages
    1d71d509b413 mm/balloon_compaction: convert balloon_page_delete() to balloon_page_finalize()
    451b0ed48e1f mm/balloon_compaction: we cannot have isolated pages in the balloon list
    38aa6ca6285f PCI: brcmstb: Fix disabling L0s capability
    b4e2b74f6978 PCI: brcmstb: Set MLW based on "num-lanes" DT property if present
    8d185636a629 PCI: brcmstb: Reuse pcie_cfg_data structure
    ebdbe19336f2 ASoC: renesas: rz-ssi: Fix rz_ssi_priv::hw_params_cache::sample_width
    985131a81ef6 ASoC: qcom: sdw: fix memory leak for sdw_stream_runtime
    28b2ec0662a8 soundwire: stream: extend sdw_alloc_stream() to take 'type' parameter
    2cd2003f7b36 block: handle zone management operations completions
    1fe39f503041 ASoC: renesas: rz-ssi: Fix channel swap issue in full duplex mode
    f5b7f49bd237 gve: defer interrupt enabling until NAPI registration
    d579cc549298 hrtimers: Make hrtimer_update_function() less expensive
    6b60113d7702 idpf: remove obsolete stashing code
    a7a7bff258e1 idpf: stop Tx if there are insufficient buffer resources
    e3e11c9db165 idpf: replace flow scheduling buffer ring with buffer pool
    702c417b5719 idpf: simplify and fix splitq Tx packet rollback error path
    2d799d58d402 idpf: improve when to set RE bit logic
    e8f9e3ec17a2 idpf: add support for Tx refillqs in flow scheduling mode
    b82cc442aa53 idpf: trigger SW interrupt when exiting wb_on_itr mode
    f2a43c70e517 idpf: add support for SW triggered interrupts
    d7d4c3884c99 wifi: mt76: mt7925: add handler to hif suspend/resume event
    cce9746046c9 wifi: mt76: mt7925: fix CLC command timeout when suspend/resume
    08c5a901fdf0 wifi: mt76: mt7925: fix the unfinished command of regd_notifier before suspend
    620f9d7bcf77 media: i2c: imx219: Fix 1920x1080 mode to use 1:1 pixel aspect ratio
    adcef72bc9bc x86/microcode/AMD: Select which microcode patch to load
    6be62c78aed5 tty: fix tty_port_tty_*hangup() kernel-doc
    70390c48d6eb serial: core: Fix serial device initialization
    d1944bab8e0c usbnet: Fix using smp_processor_id() in preemptible code warnings
    5d1be493d111 net: use dst_dev_rcu() in sk_setup_caps()
    8e8d6bf68633 ipv6: adopt dst_dev() helper
    1e28e7701b10 net: ipv6: ioam6: use consistent dst names
    8355eea2a2e9 drm/panthor: Flush shmem writes before mapping buffers CPU-uncached
    31ff67982c5f md/raid10: wait barrier before returning discard request with REQ_NOWAIT
    4ab2cd906e4e netfilter: nft_ct: add seqadj extension for natted connections
    f21e4cc4a6ba gpiolib: acpi: Add quirk for Dell Precision 7780
    8b822b35ac6e gpiolib: acpi: Add quirk for ASUS ProArt PX13
    c1af28f23ab2 gpiolib: acpi: Add a quirk for Acer Nitro V15
    b2023685b2de gpiolib: acpi: Move quirks to a separate file
    134d014bc64f gpiolib: acpi: Add acpi_gpio_need_run_edge_events_on_boot() getter
    7d76825dcd8a gpiolib: acpi: Handle deferred list via new API
    c53dffad8607 gpiolib: acpi: Switch to use enum in acpi_gpio_in_ignore_list()
    d01cdf642524 f2fs: fix to propagate error from f2fs_enable_checkpoint()
    341f6a26bfa9 f2fs: dump more information for f2fs_{enable,disable}_checkpoint()
    621dc9eb90a5 f2fs: add timeout in f2fs_enable_checkpoint()
    cccd92ec7e34 f2fs: clear SBI_POR_DOING before initing inmem curseg
    fdca9bfd6206 serial: xilinx_uartps: fix rs485 delay_rts_after_send
    589ec2d37e38 serial: xilinx_uartps: Use helper function hrtimer_update_function()
    12493e7e888d hrtimers: Introduce hrtimer_update_function()
    f548c5ebe656 drm/displayid: add quirk to ignore DisplayID checksum errors
    d4dd6694d102 sched_ext: Fix missing post-enqueue handling in move_local_task_to_local_dsq()
    44273abc2fea sched_ext: Factor out local_dsq_post_enq() from dispatch_enqueue()
    a3b7eb67225c tpm2-sessions: Fix tpm2_read_public range checks
    aa85f48dfc55 block: freeze queue when updating zone resources
    65484682b1b0 ARM: dts: microchip: sama7g5: fix uart fifo size to 32
    5f140b525180 svcrdma: bound check rq_pages index in inline path
    6673d1d818f0 mm/ksm: fix exec/fork inheritance support for prctl
    984dc07404e2 mptcp: pm: ignore unknown endpoint flags
    2494b4d8a1ba serial: core: Restore sysfs fwnode information
    1060180f3619 serial: core: fix OF node leak
    0bf1a02494c7 f2fs: fix to avoid updating compression context during writeback
    5796c5382101 f2fs: drop inode from the donation list when the last file is closed
    1eb0b130196b f2fs: use global inline_xattr_slab instead of per-sb slab cache
    baf1a27e5664 f2fs: fix to detect recoverable inode during dryrun of find_fsync_dnodes()
    e750e2f2a2dd xhci: dbgtty: fix device unregister: fixup
    2299e3ba1247 tty: introduce and use tty_port_tty_vhangup() helper
    686e3762980f jbd2: fix the inconsistency between checksum and data in memory for journal sb
    e61f636cc310 sched_ext: Fix incorrect sched_class settings for per-cpu migration tasks
    5b9cc2bbde85 erofs: fix unexpected EIO under memory pressure
    bddd95054e33 sched/eevdf: Fix min_vruntime vs avg_vruntime
    c8d4f4c2528b btrfs: don't rewrite ret from inode_permission
    a94048d99318 gfs2: fix freeze error handling
    7578200fa923 lib/crypto: riscv/chacha: Avoid s0/fp register
    8a8c1e06c838 drm/imagination: Disallow exporting of PM/FW protected objects
    64e39e3806bf drm/nouveau/dispnv50: Don't call drm_atomic_get_crtc_state() in prepare_fb
    24d55ac8e31d drm/i915/gem: Zero-initialize the eb.vma array in i915_gem_do_execbuffer
    471baae774a3 drm/msm/dpu: Add missing NULL pointer check for pingpong interface
    700cd81dc5af drm/xe: Drop preempt-fences when destroying imported dma-bufs.
    dd3278ebfc04 drm/xe: Use usleep_range for accurate long-running workload timeslicing
    d420cea5199a drm/xe: Adjust long-running workload timeslices to reasonable values
    641797734d07 drm/xe/oa: Disallow 0 OA property values
    4f26159adc9c drm/xe/bo: Don't include the CCS metadata in the dma-buf sg-table
    106af2a55b85 drm/mgag200: Fix big-endian support
    5a81095d3e1b drm/ttm: Avoid NULL pointer deref for evicted BOs
    a742fa0aa216 drm/i915: Fix format string truncation warning
    f9465376fe19 drm/amdkfd: Trap handler support for expert scheduling mode
    b5971d0cc503 drm/amdkfd: bump minimum vgpr size for gfx1151
    df130b75e955 drm/amdkfd: Export the cwsr_size and ctl_stack_size to userspace
    3eb34432ea94 drm/mediatek: Fix probe device leaks
    49ec28aaa334 drm/mediatek: Fix probe memory leak
    bd5ce36c4181 drm/mediatek: Fix probe resource leaks
    27e44ca6465e drm/mediatek: Fix device node reference leak in mtk_dp_dt_parse()
    c6d30b65b7a4 drm/xe/oa: Fix potential UAF in xe_oa_add_config_ioctl()
    5c831abdf742 drm/edid: add DRM_EDID_IDENT_INIT() to initialize struct drm_edid_ident
    0a82fb3f5827 drm/gma500: Remove unused helper psb_fbdev_fb_setcolreg()
    6417428ce5da drm/buddy: Separate clear and dirty free block trees
    1b339b19eec2 drm/buddy: Optimize free block management with RB tree
    e317afd8db9e drm/msm/a6xx: Fix out of bound IO access in a6xx_get_gmu_registers
    5fc5506edfe0 drm/amdgpu/gmc11: add amdgpu_vm_handle_fault() handling
    2ba843759a3a drm/amdgpu: add missing lock to amdgpu_ttm_access_memory_sdma
    c0cd4bfb729b drm/amdgpu/gmc12: add amdgpu_vm_handle_fault() handling
    f9a4ec64a626 Revert "drm/amd: Skip power ungate during suspend for VPE"
    f5c055c28415 net: macb: Relocate mog_init_rings() callback from macb_mac_link_up() to macb_open()
    8fc4632fb508 net: nfc: fix deadlock between nfc_unregister_device and rfkill_fop_write
    96634d108a17 net: usb: sr9700: fix incorrect command used to write single register
    cb0255265fa0 nfsd: Drop the client reference in client_states_open()
    0d666db731e9 LoongArch: BPF: Sign extend kfunc call arguments
    fcaafcc27ba5 LoongArch: BPF: Zero-extend bpf_tail_call() index
    bb92a3af3ce5 LoongArch: Refactor register restoration in ftrace_common_return
    73feae0c71bd fjes: Add missing iounmap in fjes_hw_init()
    26c8bebc2f25 e1000: fix OOB in e1000_tbi_should_accept()
    5cb34bb5fd72 RDMA/cm: Fix leaking the multicast GID table reference
    acadd4097d25 RDMA/core: Check for the presence of LS_NLA_TYPE_DGID correctly
    c9d0f5a18bd7 samples/ftrace: Adjust LoongArch register restore order in direct calls
    2197c4c6bda5 tools/mm/page_owner_sort: fix timestamp comparison for stable sorting
    802934da00a8 x86/microcode/AMD: Fix Entrysign revision check for Zen5/Strix Halo
    7fbea59f737e mm/page_owner: fix memory leak in page_owner_stack_fops->release()
    36cdde5c28c9 idr: fix idr_alloc() returning an ID out of range
    181bb6766762 lockd: fix vfs_test_lock() calls
    365178de51ac kasan: unpoison vms[area] addresses with a common tag
    c00ca876e073 kasan: refactor pcpu kasan vmalloc unpoison
    69676792c23f mm/kasan: fix incorrect unpoisoning in vrealloc for KASAN
    3d2c0eb67819 compiler_types.h: add "auto" as a macro for "__auto_type"
    a4a4599b9164 pmdomain: imx: Fix reference count leak in imx_gpc_probe()
    365cd49669a6 mm/damon/tests/core-kunit: handle alloc failure on damon_test_set_attrs()
    ffec0aa4750f mm/damon/tests/core-kunit: handle alloc failures in damon_test_ops_registration()
    e74033baf900 mm/damon/tests/core-kunit: handle alloc failures in damon_test_update_monitoring_result()
    b4993197d6cb mm/damon/tests/core-kunit: handle alloc failures in damon_test_set_regions()
    360077a2aa33 mm/damon/tests/core-kunit: handle alloc failures on damon_test_merge_two()
    62d66eb0ce63 mm/damon/tests/core-kunit: handle alloc failures on dasmon_test_merge_regions_of()
    4ec993020fb5 mm/damon/tests/core-kunit: handle memory alloc failure from damon_test_aggregate()
    9d6f085d5ec1 mm/damon/tests/core-kunit: handle memory failure from damon_test_target()
    19b20ac8b4c5 mm/damon/tests/core-kunit: handle allocation failures in damon_test_regions()
    24d20b65e36f mm/damon/tests/core-kunit: handle alloc failures on damon_test_split_at()
    de18eec7420f mm/damon/tests/vaddr-kunit: handle alloc failures on damon_test_split_evenly_succ()
    5574c977b5cb mm/damon/tests/vaddr-kunit: handle alloc failures in damon_test_split_evenly_fail()
    8a2944f5a54f mm/damon/tests/sysfs-kunit: handle alloc failures on damon_sysfs_test_add_targets()
    f4d24ea32f49 LoongArch: Use unsigned long for _end and _text
    6d5ec5a2b2b9 LoongArch: Use __pmd()/__pte() for swap entry conversions
    caffc71aad48 LoongArch: Fix build errors for CONFIG_RANDSTRUCT
    c26d621b3ebb LoongArch: Correct the calculation logic of thread_count
    553e8f9e1845 LoongArch: Add new PCI ID for pci_fixup_vgadev()
    1dcb2f27efb2 media: mediatek: vcodec: Fix a reference leak in mtk_vcodec_fw_vpu_init()
    59f8c23f2bc2 media: i2c: adv7842: Remove redundant cancel_delayed_work in probe
    4f58e5cddcb5 media: i2c: ADV7604: Remove redundant cancel_delayed_work in probe
    b7ef6b263cf9 media: amphion: Cancel message work before releasing the VPU core
    6d0e77882c4c media: vpif_display: fix section mismatch
    51fe47b112d2 media: vpif_capture: fix section mismatch
    29aaec521e54 media: videobuf2: Fix device reference leak in vb2_dc_alloc error path
    3d0ec859e009 media: verisilicon: Protect G2 HEVC decoder against invalid DPB index
    3680da86c180 media: TDA1997x: Remove redundant cancel_delayed_work in probe
    d2f8e900e676 media: samsung: exynos4-is: fix potential ABBA deadlock on init
    2844c564a065 media: renesas: rcar_drif: fix device node reference leak in rcar_drif_bond_enabled
    db4d27e6bbbf media: platform: mtk-mdp3: fix device leaks at probe
    634a5a133ac2 media: msp3400: Avoid possible out-of-bounds array accesses in msp3400c_thread()
    44aedcb25125 media: cec: Fix debugfs leak on bus_register() failure
    a135dfe84a58 fbdev: tcx.c fix mem_map to correct smem_start offset
    b58f85225be0 fbdev: pxafb: Fix multiple clamped values in pxafb_adjust_timing
    77c8170a62f8 fbdev: gbefb: fix to use physical address instead of dma address
    1e1104eb8aa2 dm-bufio: align write boundary on physical block size
    857876418308 dm-ebs: Mark full buffer dirty even on partial write
    e914da9be061 firmware: stratix10-svc: Add mutex in stratix10 memory management
    60dde0960e3e media: adv7842: Avoid possible out-of-bounds array accesses in adv7842_cp_log_status()
    bfa153eae8da powerpc/pseries/cmm: call balloon_devinfo_init() also without CONFIG_BALLOON_COMPACTION
    92686ff2e857 perf/x86/amd/uncore: Fix the return value of amd_uncore_df_event_init() on error
    2aa65e353fb5 parisc: entry: set W bit for !compat tasks in syscall_restore_rfi()
    5e38e72dbcdc parisc: entry.S: fix space adjustment on interruption for 64-bit userspace
    dced78b91861 mtd: spi-nor: winbond: Add support for W25H02NWxxAM chips
    bce08eb15115 mtd: spi-nor: winbond: Add support for W25H01NWxxAM chips
    ea3ccb6ed0e8 mtd: spi-nor: winbond: Add support for W25H512NWxxAM chips
    528bad89e963 mtd: spi-nor: winbond: Add support for W25Q02NWxxIM chips
    dc99e18fe52f mtd: spi-nor: winbond: Add support for W25Q01NWxxIM chips
    80c502df26c4 mtd: spi-nor: winbond: Add support for W25Q01NWxxIQ chips
    846ceb1a9446 mtd: mtdpart: ignore error -ENOENT from parsers on subpartitions
    add7da91ccf4 media: verisilicon: Fix CPU stalls on G2 bus error
    db7ab3323846 media: rc: st_rc: Fix reset control resource leak
    8dda29c9950b mfd: max77620: Fix potential IRQ chip conflict when probing two devices
    9b9e152a87ca mfd: altera-sysmgr: Fix device leak on sysmgr regmap lookup
    eb1f3a6ab3ef clk: samsung: exynos-clkout: Assign .num before accessing .hws
    777a1ddeb915 block: Clear BLK_ZONE_WPLUG_PLUGGED when aborting plugged BIOs
    407f9bd00585 leds: leds-lp50xx: Enable chip before any communication
    5c02ebdf24ee leds: leds-lp50xx: LP5009 supports 3 modules for a total of 9 LEDs
    5b0ceb3ee343 leds: leds-lp50xx: Allow LED 0 to be added to module bank
    ffdec4686eae leds: leds-cros_ec: Skip LEDs without color components
    895123c309a3 powerpc/64s/slb: Fix SLB multihit issue during SLB preload
    acba48ba51bc powerpc, mm: Fix mprotect on book3s 32-bit
    3968852076ed arm64: dts: ti: k3-j721e-sk: Fix pinmux for pin Y1 used by power regulator
    40fa3b520171 PCI/PM: Reinstate clearing state_saved in legacy and !PM codepaths
    47d1f7e78592 fgraph: Check ftrace_pids_enabled on registration for early filtering
    cad08168f139 fgraph: Initialize ftrace_ops->private for function graph ops
    f1d629bda89d HID: logitech-dj: Remove duplicate error logging
    c2c3f1a3fd74 iommu: disable SVA when CONFIG_X86 is set
    9f620cf7496f iommu/tegra: fix device leak on probe_device()
    2deb48f25b91 iommu/sun50i: fix device leak on of_xlate()
    5b696fd46ffe iommu/qcom: fix device leak on of_xlate()
    f1a8835964f4 iommu/omap: fix device leaks on probe_device()
    df5b0080583e iommu/mediatek: fix device leak on of_xlate()
    9d90e4e8986b iommu/mediatek-v1: fix device leaks on probe()
    11cd45ac86fb iommu/mediatek-v1: fix device leak on probe_device()
    4287295758f4 iommu/ipmmu-vmsa: fix device leak on of_xlate()
    480f40ba50f1 iommu/exynos: fix device leak on of_xlate()
    c2e050e7872c iommu/apple-dart: fix device leak on of_xlate()
    1970ddf9f70d iommu/amd: Propagate the error code returned by __modify_irte_ga() in modify_irte_ga()
    168d50e1d82b iommu/amd: Fix pci_segment memleak in alloc_pci_segment()
    cfcd57cc9e5c ASoC: qcom: qdsp6: q6asm-dai: set 10 ms period and buffer alignment.
    0eb81013e47d ASoC: qcom: q6adm: the the copp device only during last instance
    cc1a9a33a90b ASoC: qcom: q6asm-dai: perform correct state check before closing
    488643e5605d ASoC: qcom: q6apm-dai: set flags to reflect correct operation of appl_ptr
    60ffd2bc1997 ASoC: codecs: lpass-tx-macro: fix SM6115 support
    bae74771fc5d ASoC: stm32: sai: fix OF node leak on probe
    27cae2a7fe06 ASoC: stm32: sai: fix clk prepare imbalance on probe failure
    c908cde32dc2 ASoC: stm32: sai: fix device leak on probe
    c69790a51b52 ASoC: codecs: wcd939x: fix regmap leak on probe failure
    b56476d8e9d1 ntfs: Do not overwrite uptodate pages
    b6f446e12e69 selftests/ftrace: traceonoff_triggers: strip off names
    9eb1ee1f2acb blk-mq: skip CPU offline notify on unmapped hctx
    29abf51fdf77 RDMA/bnxt_re: fix dma_free_coherent() pointer
    ff552378e80d RDMA/rtrs: Fix clt_path::max_pages_per_mr calculation
    676907004256 ksmbd: Fix memory leak in get_file_all_info()
    20597b7229ae md/raid5: fix possible null-pointer dereferences in raid5_store_group_thread_cnt()
    d9118a67547f md: Fix static checker warning in analyze_sbs
    8f2f65ee99f7 RDMA/bnxt_re: Fix to use correct page size for PDE table
    e7f29946157a RDMA/bnxt_re: Fix IB_SEND_IP_CSUM handling in post_send
    20436f2742a9 RDMA/core: always drop device refcount in ib_del_sub_device_and_put()
    116a7a351dce RDMA/bnxt_re: Fix incorrect BAR check in bnxt_qplib_map_creq_db()
    33834f51220e RDMA/core: Fix logic error in ib_get_gids_from_rdma_hdr()
    580edee9f39d RDMA/efa: Remove possible negative shift
    bf197c7c79ef RDMA/irdma: avoid invalid read in irdma_net_event
    1dc33ad08673 ipv6: fix a BUG in rt6_get_pcpu_route() under PREEMPT_RT
    b409ba9e1e63 net: rose: fix invalid array index in rose_kill_by_device()
    ee4183501ea5 ipv4: Fix reference count leak when using error routes with nexthop objects
    bf3709738d8a ipv6: BUG() in pskb_expand_head() as part of calipso_skbuff_setattr()
    45ee0462b883 net: stmmac: fix the crash issue for zero copy XDP_TX action
    aa743b0d9844 octeontx2-pf: fix "UBSAN: shift-out-of-bounds error"
    db4c26adf711 platform/x86: hp-bioscfg: Fix out-of-bounds array access in ACPI package parsing
    a09b30ddd4ae vfio/pds: Fix memory leak in pds_vfio_dirty_enable()
    18b6574d4c64 net: bridge: Describe @tunnel_hash member in net_bridge_vlan_group struct
    98a12c2547a4 net: usb: asix: validate PHY address before use
    2c39c0b6de01 kbuild: fix compilation of dtb specified on command-line without make rule
    b37927e834bb net: dsa: b53: skip multicast entries for fdb_dump()
    5934f280ac57 firewire: nosy: Fix dma_free_coherent() size
    00fe09364caf genalloc.h: fix htmldocs warning
    36561b86cb25 smc91x: fix broken irq-context in PREEMPT_RT
    68f66d67d8d5 selftests: net: fix "buffer overflow detected" for tap.c
    6492ad6439ff net: usb: rtl8150: fix memory leak on usb_submit_urb() failure
    9842946cdab6 amd-xgbe: reset retries and mode on RX adapt failures
    8f25951a891f net: dsa: fix missing put_device() in dsa_tree_find_first_conduit()
    107d245f84cb team: fix check for port enabled in team_queue_override_port_prio_changed()
    d95544ee2bd6 platform/x86: ibm_rtl: fix EBDA signature search pointer arithmetic
    b1718c819ffa platform/x86: msi-laptop: add missing sysfs_remove_group()
    70984f8717ef platform/mellanox: mlxbf-pmc: Remove trailing whitespaces from event names
    5fe210533e34 ip6_gre: make ip6gre_header() robust
    5116f61ab118 net: openvswitch: Avoid needlessly taking the RTNL on vport destroy
    72bc82bd1cdb net: mdio: aspeed: add dummy read to avoid read-after-write issue
    1e54c19eaf84 Bluetooth: btusb: revert use of devm_kzalloc in btusb
    ccbb96434d88 crypto: seqiv - Do not use req->iv after crypto_aead_encrypt
    655fdbcbbf00 idpf: reduce mbx_task schedule delay to 300us
    f36de3045d00 iavf: fix off-by-one issues in iavf_config_rss_reg()
    550664e83989 i40e: validate ring_len parameter against hardware-specific values
    9fe48a3c9ddd i40e: fix scheduling in set_rx_mode
    d12d193fe1e4 wifi: mac80211: do not use old MBSSID elements
    0c67efb56d04 wifi: cfg80211: sme: store capped length in __cfg80211_connect_result()
    9765d6eb8298 wifi: rtlwifi: 8192cu: fix tid out of range in rtl92cu_tx_fill_desc()
    1f8ae2e99a9d wifi: rtw88: limit indirect IO under powered off for RTL8822CS
    fbba8b00bbe4 fuse: fix readahead reclaim deadlock
    1ef70a0b104a iommu/mediatek: fix use-after-free on probe deferral
    34cd26b1d86d x86/msi: Make irq_retrigger() functional for posted MSI
    94f03afbb771 ARM: dts: microchip: sama5d2: fix spi flexcom fifo size to 32
    96221a072d5d hwmon: (w83l786ng) Convert macros to functions to avoid TOCTOU
    a9fb6e8835a2 hwmon: (w83791d) Convert macros to functions to avoid TOCTOU
    5596f3eb41b4 hwmon: (max6697) fix regmap leak on probe failure
    2aa6eb6666af hwmon: (max16065) Use local variable to avoid TOCTOU
    a5f4cfd2f2df interconnect: qcom: sdx75: Drop QPIC interconnect and BCM nodes
    36f3cc056dd8 i2c: amd-mp2: fix reference leak in MP2 PCI device
    85d7acd41381 platform/x86: intel: chtwc_int33fe: don't dereference swnode args
    fcab5c2672f8 rpmsg: glink: fix rpmsg device leak
    5c8f2499c5e1 soc: amlogic: canvas: fix device leak on lookup
    eb0df8cf030e soc: apple: mailbox: fix device leak on lookup
    90e176b3e791 soc: qcom: ocmem: fix device leak on lookup
    b38487a29e12 soc: qcom: pbs: fix device leak on lookup
    caf1e989f56e soc: samsung: exynos-pmu: fix device leak on regmap lookup
    8b497efd6bf2 tracing: Fix fixed array of synthetic event
    f65555032246 virtio: vdpa: Fix reference count leak in octep_sriov_enable()
    24a58ffc444c amba: tegra-ahb: Fix device leak on SMMU enable
    f0cab88ff870 crypto: caam - Add check for kcalloc() in test_len()
    5a4b65523608 crypto: af_alg - zero initialize memory allocated via sock_kmalloc
    4398797b3aa1 dt-bindings: PCI: qcom,pcie-sm8550: Add missing required power-domains and resets
    2c29bc88f221 dt-bindings: PCI: qcom,pcie-sm8450: Add missing required power-domains and resets
    e48e50bec7b6 dt-bindings: PCI: qcom,pcie-sm8350: Add missing required power-domains and resets
    bf6738307d15 dt-bindings: PCI: qcom,pcie-sm8250: Add missing required power-domains and resets
    c83b7222e193 dt-bindings: PCI: qcom,pcie-sm8150: Add missing required power-domains and resets
    51e075834cc4 dt-bindings: PCI: qcom,pcie-sc8280xp: Add missing required power-domains and resets
    3e911a40ac5d dt-bindings: PCI: qcom,pcie-sc7280: Add missing required power-domains and resets
    b71781f41cff arm64: Revamp HCR_EL2.E2H RES1 detection
    84e5006115cb KVM: arm64: Initialize SCTLR_EL1 in __kvm_hyp_init_cpu()
    cdd6fb56e93f KVM: arm64: Initialize HCR_EL2.E2H early
    debfbc047196 sched/rt: Fix race in push_rt_task
    9433ba79c2ec hsr: hold rcu and dev lock for hsr_get_port_ndev
    f8bb150f228f pinctrl: renesas: rzg2l: Fix ISEL restore on resume
    3139828f6b75 ALSA: wavefront: Clear substream pointers on close
    04520b4422fd ALSA: wavefront: Use guard() for spin locks
    e6ba921b1779 ALSA: hda: cs35l41: Fix NULL pointer dereference in cs35l41_hda_read_acpi()
    05a609c1e5ed drm/displayid: pass iter to drm_find_displayid_extension()
    0f38ce08dde9 drm/amd/display: Fix scratch registers offsets for DCN351
    29ff286cd520 drm/amd/display: Fix scratch registers offsets for DCN35
    9e7d3b8542d1 drm/amd/display: Use GFP_ATOMIC in dc_create_plane_state()
    90706235f14d Revert "drm/amd/display: Fix pbn to kbps Conversion"
    4ce784e8d223 io_uring: fix min_wait wakeups for SQPOLL
    c1669c03bfbc io_uring/poll: correctly handle io_poll_add() return value on update
    a39b53ee7fa5 gpio: regmap: Fix memleak in error path in gpio_regmap_register()
    b56975f46341 s390/ipl: Clear SBP flag when bootprog is set
    d478f50727c3 btrfs: don't log conflicting inode if it's a dir moved in the current transaction
    f0c0a681ffb7 powerpc/kexec: Enable SMT before waking offline CPUs
    a2c6f25ab98b SUNRPC: svcauth_gss: avoid NULL deref on zero length gss_token in gss_read_proxy_verf
    e8623e9c451e svcrdma: use rc_pageoff for memcpy byte offset
    adef4a2ff334 svcrdma: return 0 on success from svc_rdma_copy_inline_range
    0dacf9ce7954 nfsd: Mark variable __maybe_unused to avoid W=1 build break
    bf4e671c6515 NFSD: NFSv4 file creation neglects setting ACL
    fcb8d118e149 NFSD: Clear SECLABEL in the suppattr_exclcreat bitmap
    7b82a1d6ae86 net/handshake: restore destructor on submit failure
    82f7416bcbd9 fsnotify: do not generate ACCESS/MODIFY events on child for special files
    0b7cc0a99035 net: phy: marvell-88q2xxx: Fix clamped value in mv88q2xxx_hwmon_write
    d60624e909f2 r8169: fix RTL8117 Wake-on-Lan in DASH mode
    46cd9c3b67a1 PM: runtime: Do not clear needs_force_resume with enabled runtime PM
    3437c775bf20 tracing: Do not register unsupported perf events
    1e2d3aa19c79 xfs: fix a UAF problem in xattr repair
    561e0756f1bf xfs: fix stupid compiler warning
    3a07cb7636cd xfs: fix a memory leak in xfs_buf_item_init()
    35ddb0b62400 KVM: nSVM: Clear exit_code_hi in VMCB when synthesizing nested VM-Exits
    de39f5a4be13 KVM: nSVM: Set exit_code_hi to -1 when synthesizing SVM_EXIT_ERR (failed VMRUN)
    3eaa520d282b KVM: nVMX: Immediately refresh APICv controls as needed on nested VM-Exit
    4dac2f321e05 KVM: SVM: Mark VMCB_PERM_MAP as dirty on nested VMRUN
    5d018c1eac35 KVM: nSVM: Propagate SVM_EXIT_CR0_SEL_WRITE correctly for LMSW emulation
    70487dfde0cc KVM: SVM: Mark VMCB_NPT as dirty on nested VMRUN
    254d7963badd KVM: nSVM: Avoid incorrect injection of SVM_EXIT_CR0_SEL_WRITE
    e746e5194705 KVM: x86: Fix VM hard lockup after prolonged inactivity with periodic HV timer
    5707aaba681d KVM: x86: Explicitly set new periodic hrtimer expiration in apic_timer_fn()
    90d3e9c62a45 KVM: x86: WARN if hrtimer callback for periodic APIC timer fires with period=0
    359188420175 powerpc: Add reloc_offset() to font bitmap pointer used for bootx_printf()
    5d0d8c292531 libceph: make decode_pool() more resilient against corrupted osdmaps
    60560d13ff36 parisc: Do not reprogram affinitiy on ASP chip
    9ef28943471a scs: fix a wrong parameter in __scs_magic
    4701493ba376 platform/chrome: cros_ec_ishtp: Fix UAF after unbinding driver
    244e4e60e375 KVM: x86: Don't clear async #PF queue when CR0.PG is disabled (e.g. on #SMI)
    e24aedae7165 ocfs2: fix kernel BUG in ocfs2_find_victim_chain
    a69c7fd603bf media: vidtv: initialize local pointers upon transfer of memory ownership
    89dbbe6ff323 KVM: Disallow toggling KVM_MEM_GUEST_MEMFD on an existing memslot
    030b9cdcb542 tools/testing/nvdimm: Use per-DIMM device handle
    473550e71565 f2fs: fix return value of f2fs_recover_fsync_data()
    baf461563a8d f2fs: fix uninitialized one_time_gc in victim_sel_policy
    19d7ac99e101 f2fs: fix age extent cache insertion skip on counter overflow
    c89845fae250 f2fs: invalidate dentry cache on failed whiteout creation
    4f244c64efe6 f2fs: fix to avoid updating zero-sized extent in extent cache
    6c3bab5c6261 f2fs: fix to avoid potential deadlock
    3b15d5f12935 f2fs: ensure node page reads complete before f2fs_put_super() finishes
    0229d07a7220 scsi: ufs: core: Add ufshcd_update_evt_hist() for UFS suspend error
    7ae98a3cf428 scsi: mpi3mr: Read missing IOCFacts flag for reply queue full overflow
    0d36db68fdb8 scsi: target: Reset t_task_cdb pointer in error case
    d0835714042d NFSD: use correct reservation type in nfsd4_scsi_fence_client
    a41dc180b6e1 scsi: aic94xx: fix use-after-free in device removal path
    b10ebbfd59a5 scsi: Revert "scsi: qla2xxx: Perform lockless command completion in abort path"
    2abf4525593b cpufreq: nforce2: fix reference count leak in nforce2
    6e606c2673e9 cpuidle: governors: teo: Drop misguided target residency check
    7bcbac8dd76a serial: sh-sci: Check that the DMA cookie is valid
    0618fbaf4222 mei: gsc: add dependency on Xe driver
    ef66e2074130 intel_th: Fix error handling in intel_th_output_open
    74883565c621 char: applicom: fix NULL pointer dereference in ac_ioctl
    8313323e3e96 usb: renesas_usbhs: Fix a resource leak in usbhs_pipe_malloc()
    d8d17ff57924 usb: dwc3: keep susphy enabled during exit to avoid controller faults
    50d0d2239d4b usb: dwc3: of-simple: fix clock resource leak in dwc3_of_simple_probe
    6bcbffda814e usb: gadget: lpc32xx_udc: fix clock imbalance in error path
    5d3df03f7054 usb: phy: isp1301: fix non-OF device reference imbalance
    69f9a0701abc usb: phy: fsl-usb: Fix use-after-free in delayed work during device removal
    8bd518ea03b8 USB: lpc32xx_udc: Fix error handling in probe
    5a338aa9dab3 usb: typec: altmodes/displayport: Drop the device reference in dp_altmode_probe()
    c062deb480f5 usb: ohci-nxp: fix device leak on probe failure
    2a38605427f2 phy: broadcom: bcm63xx-usbh: fix section mismatches
    759456cef254 media: pvrusb2: Fix incorrect variable used in trace message
    fe3e129ab498 media: dvb-usb: dtv5100: fix out-of-bounds in dtv5100_i2c_msg()
    bbf91bd694fe usb: usb-storage: Maintain minimal modifications to the bcdDevice range.
    0ca9fb4335e7 mptcp: avoid deadlock on fallback while reinjecting
    9cc0ba7934a9 mptcp: schedule rtx timer only after pushing data
    e1f1ce0442a4 selftests: mptcp: pm: ensure unknown flags are ignored
    1f65b924c5f2 media: v4l2-mem2mem: Fix outdated documentation
    bd1aff606099 jbd2: use a weaker annotation in journal handling
    22ea3cb34dc9 jbd2: use a per-journal lock_class_key for jbd2_trans_commit_key
    4f6f4e5a3328 ext4: align max orphan file size with e2fsprogs limit
    419812d8e675 ext4: fix incorrect group number assertion in mb_check_buddy
    9a424b99d561 ext4: clear i_state_flags when alloc inode
    5b154e901fda ext4: xattr: fix null pointer deref in ext4_raw_inode()
    db9ee13fab02 ext4: fix string copying in parse_apply_sb_mount_options()
    b69492161c05 tpm: Cap the number of PCR banks
    4d1c44cd9823 ktest.pl: Fix uninitialized var in config-bisect.pl
    5c7265d31501 fs/ntfs3: fix mount failure for sparse runs in run_unpack()
    f6dd017bde25 kallsyms: Fix wrong "big" kernel symbol type read from procfs
    6458658807c3 floppy: fix for PAGE_SIZE != 4KB
    0a65cac1d86e block: rate-limit capacity change info log
    e768e889561e wifi: mt76: Fix DTS power-limits on little endian systems
    bfe512fb5b68 s390/dasd: Fix gendisk parent after copy pair swap
    129b3bc14901 lib/crypto: x86/blake2s: Fix 32-bit arg treated as 64-bit
    af225540e7d6 perf: arm_cspmu: fix error handling in arm_cspmu_impl_unregister()
    b679e1985dcb mmc: sdhci-msm: Avoid early clock doubling during HS400 transition
    d0564ab15dda x86/mce: Do not clear bank's poll bit in mce_poll_banks on AMD SMCA systems
    e232269d5115 io_uring: fix filename leak in __io_openat_prep()
    9b015f2918b9 KEYS: trusted: Fix a memory leak in tpm2_load_cmd
    5679cc90bb54 cifs: Fix memory and information leak in smb3_reconfigure()
    4f23082b371a vhost/vsock: improve RCU read sections around vhost_vsock_get()
    af8b6fb41064 block: rnbd-clt: Fix signedness bug in init_dev()
    ee374ebb5e8e scsi: scsi_debug: Fix atomic write enable module param description
    e3e33ac2eb69 MIPS: ftrace: Fix memory corruption when kernel is located beyond 32 bits
    aaa642f20ad7 platform/x86/intel/hid: Add Dell Pro Rugged 10/12 tablet to VGBS DMI quirks
    142b2e74186f nvme-fabrics: add ENOKEY to no retry criteria for authentication failures
    855a444013cf nvme-fc: don't hold rport lock when putting ctrl
    3b4c4f26e87c i2c: designware: Disable SMBus interrupts to prevent storms from mis-configured firmware
    939b6c52f46c clk: qcom: dispcc-sm7150: Fix dispcc_mdss_pclk0_clk_src
    6b4f044d9cd8 libperf cpumap: Fix perf_cpu_map__max for an empty/NULL map
    3f7a5d52a4ea serial: sprd: Return -EPROBE_DEFER when uart clock is not ready
    56664ab5ca28 usb: usb-storage: No additional quirks need to be added to the EL-R12 optical drive.
    5f839f9c8037 usb: xhci: limit run_graceperiod for only usb 3.0 devices
    f421105c99e8 iio: adc: ti_am335x_adc: Limit step_avg to valid range for gcc complains
    3042a57a8e8b usb: typec: ucsi: Handle incorrect num_connectors capability
    015200bb776f usbip: Fix locking bug in RT-enabled kernels
    28442546f2d2 exfat: zero out post-EOF page cache on file extension
    df3ca04116db exfat: fix remount failure in different process environments
    d8218e3f39a7 reset: fix BIT macro reference
    f7b6370d0fbe via_wdt: fix critical boot hang due to unnamed resource allocation
    edadf1d7f919 fuse: Invalidate the page cache after FOPEN_DIRECT_IO write
    b4f4212436ba fuse: Always flush the page cache before FOPEN_DIRECT_IO write
    45100a1a9b31 scsi: qla2xxx: Use reinit_completion on mbx_intr_comp
    3354e116ccc1 scsi: qla2xxx: Fix initiator mode with qlini_mode=exclusive
    c203c1ea9467 scsi: qla2xxx: Fix lost interrupts with qlini_mode=disabled
    a5b26e4a08a9 powerpc/addnote: Fix overflow on 32-bit builds
    83127df037ca clk: mvebu: cp110 add CLK_IGNORE_UNUSED to pcie_x10, pcie_x11 & pcie_x4
    8869c4962570 scsi: smartpqi: Add support for Hurray Data new controller PCI device
    89d33906cb93 ti-sysc: allow OMAP2 and OMAP4 timers to be reserved on AM33xx
    c379ec2361ad firmware: imx: scu-irq: Init workqueue before request mbox channel
    b7200a265d14 scsi: ufs: host: mediatek: Fix shutdown/suspend race condition
    2ab207530ce3 ipmi: Fix __scan_channels() failing to rescan channels
    8f4156b242f8 ipmi: Fix the race between __scan_channels() and deliver_response()
    7ced0c07791f nfsd: fix memory leak in nfsd_create_serv error paths
    43c1b514422e nfsd: rename nfsd_serv_ prefixed methods and variables with nfsd_net_
    6abdb63db720 nfsd: update percpu_ref to manage references on nfsd_net
    47c4976513f1 ASoC: ak4458: remove the reset operation in probe and remove
    a8ad320efb66 ALSA: usb-mixer: us16x08: validate meter packet indices
    6874a88306a5 ALSA: pcmcia: Fix resource leak in snd_pdacf_probe error path
    3837413ab3f4 ALSA: vxpocket: Fix resource leak in vxpocket_probe error path
    14e5a8878d4f x86/fpu: Fix FPU state core dump truncation on CPUs with no extended xfeatures
    1742974c24a9 net/hsr: fix NULL pointer dereference in prp_get_untagged_frame()
    276bbd6061c6 dt-bindings: mmc: sdhci-of-aspeed: Switch ref to sdhci-common.yaml
    52a3f9051d4a mmc: sdhci-of-arasan: Increase CD stable timeout to 2 seconds
    fd750d686674 mmc: sdhci-esdhc-imx: add alternate ARCH_S32 dependency to Kconfig
    743cebcbd1b2 spi: fsl-cpm: Check length parity before switching to 16 bit mode
    ed781eaa9e04 ACPI: CPPC: Fix missing PCC check for guaranteed_perf
    a11f596653f8 ACPI: PCC: Fix race condition by removing static qualifier
    d844aeba5945 soc/tegra: fuse: Do not register SoC device on ACPI boot
    ed2c2c84a2b4 can: gs_usb: gs_can_open(): fix error handling
    507b7333ac1a xfs: don't leak a locked dquot when xfs_dquot_attach_buf fails
    24709064ee47 Input: i8042 - add TUXEDO InfinityBook Max Gen10 AMD to i8042 quirk table
    ed8c61b89be0 Input: alps - fix use-after-free bugs caused by dev3_register_work
    3a7cd1397c20 Input: lkkbd - disable pending work before freeing device
    84e4d3543168 Input: ti_am335x_tsc - fix off-by-one error in wire_order validation
    04e9249d31f5 HID: input: map HID_GD_Z to ABS_DISTANCE for stylus/pen
    d26af6d14da4 ksmbd: fix buffer validation by including null terminator size in EA length
    02e06785e85b ksmbd: Fix refcount leak when invalid session is found on session lookup
    a6f4cfa37838 ksmbd: skip lock-range check on equal size to avoid size==0 underflow
    e5718a35eb03 hwmon: (ltc4282): Fix reset_history file permissions
    b963636331fb drm/xe/oa: Limit num_syncs to prevent oversized allocations
    e281d1fd6903 drm/xe: Limit num_syncs to prevent oversized allocations
    24be3b815554 block: rnbd-clt: Fix leaked ID in init_dev()
    2ae324db9f49 spi: cadence-quadspi: Fix clock disable on probe failure path
    0849560e52c5 arm64: kdump: Fix elfcorehdr overlap caused by reserved memory processing reorder
    ec599026acb6 x86/xen: Fix sparse warning in enlighten_pv.c
    d30f46717fa5 x86/xen: Move Xen upcall handler
    ea55a61d7275 drm/panel: sony-td4353-jdi: Enable prepare_prev_first
    1ed476f3836e MIPS: Fix a reference leak bug in ip22_check_gio()
    ca29fc28fb44 drm/xe: Restore engine registers before restarting schedulers after GT reset
    d0326fd9dfc1 drm/me/gsc: mei interrupt top half should be in irq disabled context
    94f9c07b5675 hwmon: (tmp401) fix overflow caused by default conversion rate value
    68d62e5bebbd hwmon: (ibmpex) fix use-after-free in high/low store
    415d1638c742 hwmon: (dell-smm) Limit fan multiplier to avoid overflow
    95cca255a7a5 net: hns3: add VLAN id validation before using
    96a1b2988119 net: hns3: using the num_tqps to check whether tqp_index is out of range when vf get ring info from mbx
    429f946a7af3 net: hns3: using the num_tqps in the vf driver to apply for resources
    08c37829c01f net: enetc: do not transmit redirected XDP frames when the link is down
    e1641177e7fb net/handshake: duplicate handshake cancellations leak socket
    0e40549e321d net/mlx5: Serialize firmware reset with devlink
    c3f606107a34 net/mlx5: fw_tracer, Handle escaped percent properly
    45bd283b1d69 net/mlx5: fw_tracer, Validate format string parameters
    4f929a9db234 net/mlx5: Drain firmware reset in shutdown callback
    dc7325cc50e6 net/mlx5: fw reset, clear reset requested on drain_fw_reset
    7bea09f60f2a ethtool: Avoid overflowing userspace buffer on stats query
    e6c122cffcbb iommufd/selftest: Check for overflow in IOMMU_TEST_OP_ADD_RESERVED
    b627f7703f07 iommufd/selftest: Make it clearer to gcc that the access is not out of bounds
    724f6df514f7 iommufd/selftest: Update hw_info coverage for an input data_type
    ec519fbf6dd8 iommufd/selftest: Add coverage for reporting max_pasid_log2 via IOMMU_HW_INFO
    a085b36b7a71 selftests: netfilter: packetdrill: avoid failure on HZ=100 kernel
    20594fe15722 netfilter: nf_tables: remove redundant chain validation on register store
    2503f11fbf88 netfilter: nf_nat: remove bogus direction check
    2d6fd8a8dd92 nfc: pn533: Fix error code in pn533_acr122_poweron_rdr()
    cca2ed931b73 net/sched: ets: Remove drr class from the active list if it changes to strict
    4ec29714aa4e caif: fix integer underflow in cffrml_receive()
    25ab24df31f7 ipvs: fix ipv4 null-ptr-deref in route error path
    0b88be7211d2 netfilter: nf_conncount: fix leaked ct in error paths
    70e23c094de5 broadcom: b44: prevent uninitialized value usage
    2ecfc4433acd net: openvswitch: fix middle attribute validation in push_nsh() action
    4b83902a1e67 bnxt_en: Fix XDP_TX path
    216afc198484 mlxsw: spectrum_mr: Fix use-after-free when updating multicast route stats
    ed8141b206bd mlxsw: spectrum_router: Fix neighbour use-after-free
    3c8828fc9bf5 mlxsw: spectrum_router: Fix possible neighbour reference count leak
    c98eeb05d7d9 ipvlan: Ignore PACKET_LOOPBACK in handle_mode_l2()
    06bfb66a7c8b net/sched: ets: Always remove class from active list before deleting in ets_qdisc_change
    8d1ccba4b171 netrom: Fix memory leak in nr_sendmsg()
    278b8a9cd448 net: fec: ERR007885 Workaround for XDP TX path
    9e2e02ca7b2c gfs2: Fix use of bio_chain
    edc2512e8d26 Bluetooth: btusb: Add new VID/PID 0x0489/0xE12F for RTL8852BE-VT
    381a6fdfb3b9 Bluetooth: btusb: Add new VID/PID 13d3/3533 for RTL8821CE
    a087c7cb86a7 Bluetooth: btusb: MT7920: Add VID/PID 0489/e135
    ee3a1e7882e5 Bluetooth: btusb: MT7922: Add VID/PID 0489/e170
    b87b6c1d8b9e Bluetooth: btusb: Add new VID/PID 2b89/6275 for RTL8761BUV
    ccc787810415 ksmbd: vfs: fix race on m_flags in vfs_cache
    21a3d01fc6db ksmbd: fix use-after-free in ksmbd_tree_connect_put under concurrency
    2770b46167b6 smb/server: fix return value of smb2_ioctl()
    ab24e7802dcf gfs2: Fix "gfs2: Switch to wait_event in gfs2_quotad"
    122fdb8d3d86 gfs2: fix remote evict for read-only filesystems
    986908a28730 btrfs: scrub: always update btrfs_scrub_progress::last_physical
    5dadd27e80c4 wifi: brcmfmac: Add DMI nvram filename quirk for Acer A1 840 tablet
    f423753269a0 wifi: mt76: mt792x: fix wifi init fail by setting MCU_RUNNING after CLC load
    1ec6f2e3d5e4 wifi: cfg80211: use cfg80211_leave() in iftype change
    ca6bf76ae4dc wifi: cfg80211: stop radar detection in cfg80211_leave()
    f4001ba4a8ca wifi: rtl8xxxu: Fix HT40 channel config for RTL8192CU, RTL8723AU
    fcd6855b70e6 fs/ntfs3: check for shutdown in fsync
    87027decfe73 hfsplus: fix volume corruption issue for generic/073
    edfb2e602b5b hfsplus: Verify inode mode when loading from disk
    457f795e7abd hfsplus: fix missing hfs_bnode_get() in __hfs_bnode_create
    187d06bcdf31 hfsplus: fix volume corruption issue for generic/070
    4fff9a625da9 ntfs: set dummy blocksize to read boot_block when mounting
    eeb154b999fe kbuild: Use objtree for module signing key path
    4fa631188267 fs/ntfs3: Support timestamps prior to epoch
    5da872dc712e livepatch: Match old_sympos 0 and 1 in klp_find_func()
    93735b3a72f0 cpuidle: menu: Use residency threshold in polling state override decisions
    7488bf981808 cpufreq: s5pv210: fix refcount leak
    84a8b8f53bbb ACPI: fan: Workaround for 64-bit firmware bug
    0055505fa66e cpufreq: dt-platdev: Add JH7110S SOC to the allowlist
    59e60f6d3aac ACPI: property: Use ACPI functions in acpi_graph_get_next_endpoint() only
    0d8bb0812692 ACPICA: Avoid walking the Namespace if start_node is NULL
    73a52f7fd913 x86/ptrace: Always inline trivial accessors
    81343616e712 sched/fair: Revert max_newidle_lb_cost bump
    dbc61834b041 sched/deadline: only set free_cpus for online runqueues
    e1028fb38b32 perf/x86/amd: Check event before enable to avoid GPF
    c186564c96dc scripts/faddr2line: Fix "Argument list too long" error
    7d107be58b5c iomap: account for unaligned end offsets when truncating read range
    12053695c8ef iomap: adjust read range correctly for non-block-aligned positions
    4b0fe71fb396 shmem: fix recovery on rename failures
    e065fc63ecc1 btrfs: fix memory leak of fs_devices in degraded seed device path
    26eb399edcbd bpf, arm64: Do not audit capability check in do_jit()
    c3446d541616 btrfs: fix a potential path leak in print_data_reloc_error()
    a8f13833135b btrfs: do not skip logging new dentries when logging a new name

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 75e9a80d7c..4113aaa21e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1355364a79ad7f57bdcec8ee2190c1859a07c613"
-SRCREV_meta ?= "f7d83a5a4be20f4f4d3fcf3b1fbd23aa69bdc6ac"
+SRCREV_machine ?= "07aa4b788a9075e4aaf221026df896d245d40a3a"
+SRCREV_meta ?= "cc667785e15dd19fa8c38117d76ac1c7d60b5ec7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.63"
+LINUX_VERSION ?= "6.12.64"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 119f50e56f..5a536f0d5a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.63"
+LINUX_VERSION ?= "6.12.64"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "8b6eae329c7720386de14aa56db14b9c81f2e67d"
-SRCREV_meta ?= "f7d83a5a4be20f4f4d3fcf3b1fbd23aa69bdc6ac"
+SRCREV_machine ?= "9bd003fd4f7eb668ec3c1d7c5eae095d4b3764bd"
+SRCREV_meta ?= "cc667785e15dd19fa8c38117d76ac1c7d60b5ec7"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 569e00b391..a5184e5812 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "0d1e473f418dcf7ad2a0dcae8d0b3fcb22c0f5b3"
-SRCREV_machine:qemuarm64 ?= "8b6eae329c7720386de14aa56db14b9c81f2e67d"
-SRCREV_machine:qemuloongarch64 ?= "8b6eae329c7720386de14aa56db14b9c81f2e67d"
-SRCREV_machine:qemumips ?= "aa71382dd614aabfda8e3531c2cca96c0c766cc0"
-SRCREV_machine:qemuppc ?= "8b6eae329c7720386de14aa56db14b9c81f2e67d"
-SRCREV_machine:qemuriscv64 ?= "8b6eae329c7720386de14aa56db14b9c81f2e67d"
-SRCREV_machine:qemuriscv32 ?= "8b6eae329c7720386de14aa56db14b9c81f2e67d"
-SRCREV_machine:qemux86 ?= "8b6eae329c7720386de14aa56db14b9c81f2e67d"
-SRCREV_machine:qemux86-64 ?= "8b6eae329c7720386de14aa56db14b9c81f2e67d"
-SRCREV_machine:qemumips64 ?= "e972741e78964ef4c2c43809e5bb9fb503552e6f"
-SRCREV_machine ?= "8b6eae329c7720386de14aa56db14b9c81f2e67d"
-SRCREV_meta ?= "f7d83a5a4be20f4f4d3fcf3b1fbd23aa69bdc6ac"
+SRCREV_machine:qemuarm ?= "e7f4f79edddeab38061c2f88220becde45e3500c"
+SRCREV_machine:qemuarm64 ?= "9bd003fd4f7eb668ec3c1d7c5eae095d4b3764bd"
+SRCREV_machine:qemuloongarch64 ?= "9bd003fd4f7eb668ec3c1d7c5eae095d4b3764bd"
+SRCREV_machine:qemumips ?= "a6540c970a91fa542babab0633acbd69818686a3"
+SRCREV_machine:qemuppc ?= "9bd003fd4f7eb668ec3c1d7c5eae095d4b3764bd"
+SRCREV_machine:qemuriscv64 ?= "9bd003fd4f7eb668ec3c1d7c5eae095d4b3764bd"
+SRCREV_machine:qemuriscv32 ?= "9bd003fd4f7eb668ec3c1d7c5eae095d4b3764bd"
+SRCREV_machine:qemux86 ?= "9bd003fd4f7eb668ec3c1d7c5eae095d4b3764bd"
+SRCREV_machine:qemux86-64 ?= "9bd003fd4f7eb668ec3c1d7c5eae095d4b3764bd"
+SRCREV_machine:qemumips64 ?= "4b238545c28a667ddd67ff02cb8efb018a5df96c"
+SRCREV_machine ?= "9bd003fd4f7eb668ec3c1d7c5eae095d4b3764bd"
+SRCREV_meta ?= "cc667785e15dd19fa8c38117d76ac1c7d60b5ec7"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "567bd8cbc2fe6b28b78864cbbbc41b0d405eb83c"
+SRCREV_machine:class-devupstream ?= "1a4a7249e794de9e022baabe6387d9c0f831b0be"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.63"
+LINUX_VERSION ?= "6.12.64"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


