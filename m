Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF79CD38FF9
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 17:24:16 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15745.1768411452248744215
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 09:24:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EmhRh99y;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8b2ed01b95dso6944785a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 09:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768411451; x=1769016251; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vUkaxK2a4RvTlN7eZhgtEpplKBJz8nlMZS0+WCOmq+k=;
        b=EmhRh99yKdxv9l9wd3HIWESgTJDja0lkUeXD3XIFXyHfoMIPRDIGjpgRjnjnOfu+Eb
         P6oh1M40mgOQTyCWPVJxXrCWHHovHp6+e5Hdlgsm1v53bdLHUpFXjbWpdtGj4YXqu9bx
         qSgNo/3HFjHF2v0Yld8Y6JN/8Q95nj403oZTOGUwIfYE9MoN5+rgH6thT+fJBeKXepFo
         zNjl9jv7Jszk3TFckEbDR9HR8PYGPSzvRilpfx3uUUD+wqLe+yyow2VBkJBcu4NAcLSm
         wMtHKi4vqnMd19zqBX+3z2YcAxpbt+JwH5Z0BIMH2UqqKalPqbKRbYb22hf0LEEcuq4M
         e8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768411451; x=1769016251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vUkaxK2a4RvTlN7eZhgtEpplKBJz8nlMZS0+WCOmq+k=;
        b=uQl2kPC6RJ70IxzIHME99UMNjE3SOrWYhUPfmrf1HoHBfsr8wJbb/PHkLG4m9AtoAv
         szRxMCzXcJnOs7R7zxoElaP96L0iCYYRn8UC8JZDR0d+j2I46eRjJSIbOjcjoL3qOQQm
         TXUFpB4ceOOwtMg6h4zWfxWI4ZClsekxWP269nQzsN/iaD61EPcRZa3KdoTILeTAydir
         tGQdoKnz2bhgx4KBJN8tpbrGAQjdBfpwFOf4VRqeJ3kAaXxbNbCdMU9+6TW79PUm3fw4
         AmpCPghguaq/kR9Cg+kELHcAzjigc9th4t1/I/UE9N0EpcVyAc1e5W2odb5FhO1cpUj0
         HhOQ==
X-Gm-Message-State: AOJu0YwnwP6WkyH35AXT8Z8Xq/Ol3PE6yxoB+gfLdXbDC9ff+h9T/LYX
	Eqw/ygxWjS3O5NmkfOtc1TAMwjgFB9WhiIGxWZPrnTCE2X0aiqtpi4YePctFiLxyFKs=
X-Gm-Gg: AY/fxX66Ptu3B6fdpfSoI08oafoDH2dMreqdEsttUXKDLtxnAsNE+cGzTwOidiJUvqN
	dRUI+Tg66g1CDlTg+WsGIkW/AEuok5EQeL5WSdW/apmODrOc/nV6wx3P5v0eWd+RS8Cyf2LQijx
	NA5jmOWZoAyZXVhqnvxvOvHvPmzU6BS8m1U1PtfvJYTUuSeJQULfF22NbvxohEEv+J4KZslFH7z
	EsW/AyW6I2yVcFfj31+6Ybj3xuwWvHoP1QaToH9/fvwVayrGGD0jqf1t5YRpUTUHaa8BaqWcn97
	nYuiTe0N3E8nJlA1SuCkagMBtu1xaVowcvJGH6VW87U+vAlRUdhbIyRcRIjgq0LF6u1r9CZmgaJ
	ok7nDB0KL+taoVZ+fwuxR8dlYzCy3Zf0Rprp6qicbLP6OSDQcJS15tJVzHjj4vk+00opBUUV1vZ
	HRSsAtItct/omfC7wY73mhPsM6q4VCFEEVfJJe9YwlC0BA/6viKphs/tPZpBzAnOmjUP5Uxz0J/
	vdr9l5SlIz7OFQ=
X-Received: by 2002:a05:620a:8c04:b0:8c5:378f:4def with SMTP id af79cd13be357-8c5378f4e09mr148733185a.77.1768411450952;
        Wed, 14 Jan 2026 09:24:10 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c530bc0d9fsm197711385a.45.2026.01.14.09.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 09:24:09 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 01/06] linux-yocto/6.18: update to v6.18.5
Date: Wed, 14 Jan 2026 12:24:01 -0500
Message-ID: <20260114172406.2271015-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114172406.2271015-1-bruce.ashfield@gmail.com>
References: <20260114172406.2271015-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 17:24:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229357

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.18 to the latest korg -stable release that comprises
the following commits:

    dc554c8fb361 Linux 6.18.5
    7a28d65e4beb nfs/localio: fix regression due to out-of-order __put_cred
    98a26893fad4 sched/fair: Proportional newidle balance
    d4ffb9ce8e65 sched/fair: Small cleanup to update_newidle_cost()
    c7ca7e0ff6f0 sched/fair: Small cleanup to sched_balance_newidle()
    f1a77dfc3b04 mptcp: ensure context reset on disconnect()
    3aa9aac0e8b7 Linux 6.18.4
    2d48340ccc9d Revert "gpio: swnode: don't use the swnode's name as the key for GPIO lookup"
    1ba137c89ff0 mm/damon/tests/core-kunit: handle alloc failures on damon_test_split_regions_of()
    a9040eac434b vfio/pci: Disable qword access to the PCI ROM bar
    e7a7d7e629c2 LoongArch: BPF: Enhance the bpf_arch_text_poke() function
    845306163962 powercap: intel_rapl: Add support for Nova Lake processors
    77aa0f5223ff powercap: intel_rapl: Add support for Wildcat Lake platform
    142dbd7ed190 block: fix NULL pointer dereference in blk_zone_reset_all_bio_endio()
    28a6c420f0e7 erofs: fix unexpected EIO under memory pressure
    e8469ef3d480 drm/imagination: Disallow exporting of PM/FW protected objects
    5487edb7b8ed drm/nouveau/dispnv50: Don't call drm_atomic_get_crtc_state() in prepare_fb
    c79ee71f4598 drm/pagemap, drm/xe: Ensure that the devmem allocation is idle before use
    548f139d3c17 drm/xe/svm: Fix a debug printout
    63f23aa2fbb8 drm/i915/gem: Zero-initialize the eb.vma array in i915_gem_do_execbuffer
    3165fcd7a1cb drm/msm: add PERFCTR_CNTL to ifpc_reglist
    35ea3282136a drm/msm/dpu: Add missing NULL pointer check for pingpong interface
    8d9df6d3fa49 drm/xe: Drop preempt-fences when destroying imported dma-bufs.
    e85d0e02121d drm/xe: Use usleep_range for accurate long-running workload timeslicing
    a7229c1ebeed drm/xe: Adjust long-running workload timeslices to reasonable values
    3570a24eb05e drm/xe/eustall: Disallow 0 EU stall property values
    f19cb78876f9 drm/xe/oa: Disallow 0 OA property values
    a965d4869eef drm/xe/bo: Don't include the CCS metadata in the dma-buf sg-table
    7b2e6ca71681 drm: Fix object leak in DRM_IOCTL_GEM_CHANGE_HANDLE
    635c8d6e72f6 drm/mgag200: Fix big-endian support
    b94182b3d722 drm/ttm: Avoid NULL pointer deref for evicted BOs
    71be8825e83c drm/tilcdc: Fix removal actions in case of failed probe
    5457bdfab729 drm/i915: Fix format string truncation warning
    eb1494204d71 drm/amdkfd: Trap handler support for expert scheduling mode
    7f26af7bf9b7 drm/amdkfd: bump minimum vgpr size for gfx1151
    7445db6a7d5a drm/amdkfd: Export the cwsr_size and ctl_stack_size to userspace
    7e56e90b988c drm/nouveau/gsp: Allocate fwsec-sb at boot
    07bcf0498047 drm/bridge: ti-sn65dsi83: ignore PLL_UNLOCK errors
    ec648d8c2db7 drm/rockchip: vop2: Use OVL_LAYER_SEL configuration instead of use win_mask calculate used layers
    355d4d4ffaf8 drm/amd: Fix unbind/rebind for VCN 4.0.5
    fa6cd9230444 drm/mediatek: ovl_adaptor: Fix probe device leaks
    b3e922278622 drm/mediatek: mtk_hdmi: Fix probe device leaks
    8f059592969d drm/mediatek: Fix probe device leaks
    e048e15c97e8 drm/mediatek: Fix probe memory leak
    54291161eeaa drm/mediatek: Fix probe resource leaks
    4fcb7f89479b drm/mediatek: Fix device node reference leak in mtk_dp_dt_parse()
    78bc88fda96c drm/rockchip: Set VOP for the DRM DMA device
    7cdb9a9da935 drm/xe/oa: Fix potential UAF in xe_oa_add_config_ioctl()
    e2e980f09133 drm/gma500: Remove unused helper psb_fbdev_fb_setcolreg()
    391f53db1445 drm/buddy: Separate clear and dirty free block trees
    e983164f179e drm/buddy: Optimize free block management with RB tree
    2c9ba2fbcd97 drm/msm/a6xx: Fix out of bound IO access in a6xx_get_gmu_registers
    b89cd47c4c92 drm/amdgpu/gmc11: add amdgpu_vm_handle_fault() handling
    16a3106cff4a drm/amdgpu/sdma6: Update SDMA 6.0.3 FW version to include UMQ protected-fence fix
    431b9cd09363 drm/amdgpu: add missing lock to amdgpu_ttm_access_memory_sdma
    0b48f98f092b drm/amdgpu: Forward VMID reservation errors
    8b74d0d7f6a5 drm/amdgpu/gmc12: add amdgpu_vm_handle_fault() handling
    60da8c352cdc Revert "drm/amd: Skip power ungate during suspend for VPE"
    3dad9330f71f platform/x86: alienware-wmi-wmax: Add support for Alienware 16X Aurora
    7ba7c591ce05 platform/x86: alienware-wmi-wmax: Add AWCC support for Alienware x16
    d1cb71222a27 platform/x86: alienware-wmi-wmax: Add support for new Area-51 laptops
    ace965a38625 platform/x86: samsung-galaxybook: Fix problematic pointer cast
    64b6cd5f7b5a net: macb: Relocate mog_init_rings() callback from macb_mac_link_up() to macb_open()
    f3a8a7c1aa27 net: nfc: fix deadlock between nfc_unregister_device and rfkill_fop_write
    2431c1e4765a net: phy: mediatek: fix nvmem cell reference leak in mt798x_phy_calibration
    c9a8cd3ac85c net: usb: sr9700: fix incorrect command used to write single register
    a78ee50545ee nfsd: Drop the client reference in client_states_open()
    1285073c878a nfsd: use ATTR_DELEG in nfsd4_finalize_deleg_timestamps()
    c07dc84ed67c nfsd: fix nfsd_file reference leak in nfsd4_add_rdaccess_to_wrdeleg()
    a6493ebd6dd5 LoongArch: BPF: Adjust the jump offset of tail calls
    85fdef3dcc10 LoongArch: BPF: Enable trampoline-based tracing for module functions
    8b3c00c06018 LoongArch: BPF: Save return address register ra to t0 before trampoline
    321993a874f5 LoongArch: BPF: Sign extend kfunc call arguments
    2617bbdead63 LoongArch: BPF: Zero-extend bpf_tail_call() index
    35bb95c80ddd LoongArch: Refactor register restoration in ftrace_common_return
    48f927768092 gve: defer interrupt enabling until NAPI registration
    726fca79cb55 fjes: Add missing iounmap in fjes_hw_init()
    b282b2a9eed8 erspan: Initialize options_len before referencing options.
    ee7c125fb3e8 e1000: fix OOB in e1000_tbi_should_accept()
    a21704df4024 wifi: mac80211: Discard Beacon frames to non-broadcast address
    de5eb6b65e9f wifi: iwlwifi: Fix firmware version handling
    3ba6d01c4b3c RDMA/cm: Fix leaking the multicast GID table reference
    0b948afc1ded RDMA/core: Check for the presence of LS_NLA_TYPE_DGID correctly
    3b8caba93267 rust: maple_tree: rcu_read_lock() in destructor to silence lockdep
    7d7010f5f0ee samples/ftrace: Adjust LoongArch register restore order in direct calls
    6f9af862a859 selftests/mm: fix thread state check in uffd-unit-tests
    4df537e2478d tools/mm/page_owner_sort: fix timestamp comparison for stable sorting
    54e9bd5025a0 x86/microcode/AMD: Fix Entrysign revision check for Zen5/Strix Halo
    4bae7111bf29 mm: consider non-anon swap cache folios in folio_expected_ref_count()
    05a8edf607be mm/page_owner: fix memory leak in page_owner_stack_fops->release()
    a794d65b1321 mm/page_alloc: change all pageblocks migrate type on coalescing
    fcbe159c9060 idr: fix idr_alloc() returning an ID out of range
    7da6f40d2662 lockd: fix vfs_test_lock() calls
    a843e4155c83 kernel/kexec: fix IMA when allocation happens in CMA area
    282ac3cf9bc7 kernel/kexec: change the prototype of kimage_map_segment()
    d16a38f3d908 kasan: unpoison vms[area] addresses with a common tag
    9548f154f79c kasan: refactor pcpu kasan vmalloc unpoison
    234ede2960d5 mm/kasan: fix incorrect unpoisoning in vrealloc for KASAN
    25f1ae942c09 mptcp: fallback earlier on simult connection
    6cce897a37dc compiler_types.h: add "auto" as a macro for "__auto_type"
    089e50f29eee af_unix: don't post cmsg for SO_INQ unless explicitly asked for
    87f09d9245f1 pmdomain: imx: Fix reference count leak in imx_gpc_probe()
    744e1bdd1471 pmdomain: mtk-pm-domains: Fix spinlock recursion fix in probe
    11ccb3476ead mm/damon/tests/core-kunit: handle alloc failure on damos_test_commit_filter()
    792515de4e9d mm/damon/tests/core-kunit: handle alloc failure on damon_test_set_attrs()
    4b0389369065 mm/damon/tests/core-kunit: handle alloc failures in damon_test_ops_registration()
    3987bd5706c9 mm/damon/tests/core-kunit: handle alloc failures on damos_test_filter_out()
    7d0299ff8883 mm/damon/tests/core-kunit: handle alloc failures on damon_test_set_filters_default_reject()
    1e88ea252355 mm/damon/tests/core-kunit: handle alloc failures in damon_test_update_monitoring_result()
    8ce6a884fd4b mm/damon/tests/core-kunit: handle alloc failures in damon_test_set_regions()
    65807e05960b mm/damon/tests/core-kunit: handle alloc failures on damon_test_merge_two()
    753c12ff6d25 mm/damon/tests/core-kunit: handle alloc failures on dasmon_test_merge_regions_of()
    8ac54bafd439 mm/damon/tests/core-kunit: handle memory alloc failure from damon_test_aggregate()
    63669f6b729f mm/damon/tests/core-kunit: handle memory failure from damon_test_target()
    d0870d0fe613 mm/damon/tests/core-kunit: handle allocation failures in damon_test_regions()
    ead9dd2174e9 mm/damon/tests/core-kunit: handle alloc failures on damon_test_split_at()
    9c46f119b70d mm/damon/tests/core-kunit: handle alloc failres in damon_test_new_filter()
    b55a42c605af mm/damon/tests/core-kunit: fix memory leak in damon_test_set_filters_default_reject()
    6e0090114d66 mm/damon/tests/vaddr-kunit: handle alloc failures on damon_test_split_evenly_succ()
    89532a71288c mm/damon/tests/vaddr-kunit: handle alloc failures in damon_test_split_evenly_fail()
    6fd615cb0440 mm/damon/tests/vaddr-kunit: handle alloc failures on damon_do_test_apply_three_regions()
    33cf4171196d mm/damon/tests/sysfs-kunit: handle alloc failures on damon_sysfs_test_add_targets()
    ef17c7e2acda LoongArch: Use unsigned long for _end and _text
    f92ac4ad6c86 LoongArch: Use __pmd()/__pte() for swap entry conversions
    73a0059dcf26 LoongArch: Fix build errors for CONFIG_RANDSTRUCT
    1f8330dcdc60 LoongArch: Fix arch_dup_task_struct() for CONFIG_RANDSTRUCT
    a6021c133ed8 LoongArch: Correct the calculation logic of thread_count
    eea343099fac LoongArch: Add new PCI ID for pci_fixup_vgadev()
    f736a3f4787b media: mediatek: vcodec: Fix a reference leak in mtk_vcodec_fw_vpu_init()
    3e858938b0e6 media: mediatek: vcodec: Use spinlock for context list protection lock
    378deae752a2 media: i2c: imx219: Fix 1920x1080 mode to use 1:1 pixel aspect ratio
    2e9b9a658d42 media: i2c: adv7842: Remove redundant cancel_delayed_work in probe
    4d3c49fea279 media: i2c: ADV7604: Remove redundant cancel_delayed_work in probe
    4d08b38a9828 media: amphion: Cancel message work before releasing the VPU core
    b9b29dae5962 media: amphion: Remove vpu_vb_is_codecconfig
    6132c3e55926 media: vpif_display: fix section mismatch
    5d25f923bdb4 media: vpif_capture: fix section mismatch
    19f7dfa0c1d2 media: videobuf2: Fix device reference leak in vb2_dc_alloc error path
    3cbf9ef5ce84 media: verisilicon: Protect G2 HEVC decoder against invalid DPB index
    49446f8e73e2 media: TDA1997x: Remove redundant cancel_delayed_work in probe
    f65ef4b8415e media: samsung: exynos4-is: fix potential ABBA deadlock on init
    ca31135ad666 media: renesas: rcar_drif: fix device node reference leak in rcar_drif_bond_enabled
    31ba1a4d7a5d media: platform: mtk-mdp3: fix device leaks at probe
    a003505a5c8c media: msp3400: Avoid possible out-of-bounds array accesses in msp3400c_thread()
    7cd1d942b87e media: iris: Refine internal buffer reconfiguration logic for resolution change
    d786859abab3 media: cec: Fix debugfs leak on bus_register() failure
    4357fa7bc03c fbdev: tcx.c fix mem_map to correct smem_start offset
    1470cccf067e fbdev: pxafb: Fix multiple clamped values in pxafb_adjust_timing
    f21b17cb5ed5 fbdev: gbefb: fix to use physical address instead of dma address
    527f5ea4ced1 dm pcache: fix segment info indexing
    87f7a7e2ed57 dm pcache: fix cache info indexing
    c7d8c1018aa6 dm-bufio: align write boundary on physical block size
    e36fd1a4c2ec dm-ebs: Mark full buffer dirty even on partial write
    69a5f0fa6e55 firmware: stratix10-svc: Add mutex in stratix10 memory management
    b693d48a6ed0 media: adv7842: Avoid possible out-of-bounds array accesses in adv7842_cp_log_status()
    8fb48de871a5 powerpc/pseries/cmm: call balloon_devinfo_init() also without CONFIG_BALLOON_COMPACTION
    40a2a25aff5c powerpc/pseries/cmm: adjust BALLOON_MIGRATE when migrating pages
    8a241df8cf6d power: supply: max77705: Fix potential IRQ chip conflict when probing two devices
    c540db17e4af perf/x86/amd/uncore: Fix the return value of amd_uncore_df_event_init() on error
    b635895918d8 PCI: meson: Fix parsing the DBI register region
    96ce6629d470 PCI: brcmstb: Fix disabling L0s capability
    a66cd0e5e034 parisc: entry: set W bit for !compat tasks in syscall_restore_rfi()
    1d0cebc41d83 parisc: entry.S: fix space adjustment on interruption for 64-bit userspace
    116f511839e1 nvmet: pci-epf: move DMA initialization to EPC init callback
    7d94efe68518 NFSD: Make FILE_SYNC WRITEs comply with spec
    71f630e36754 mtd: spi-nor: winbond: Add support for W25H02NWxxAM chips
    7708a5031a40 mtd: spi-nor: winbond: Add support for W25H01NWxxAM chips
    c54fec6b0cb9 mtd: spi-nor: winbond: Add support for W25H512NWxxAM chips
    ac1a8b2244dd mtd: spi-nor: winbond: Add support for W25Q02NWxxIM chips
    609b73efab92 mtd: spi-nor: winbond: Add support for W25Q01NWxxIM chips
    0066afc04fd9 mtd: spi-nor: winbond: Add support for W25Q01NWxxIQ chips
    69a585efbf9c mtd: mtdpart: ignore error -ENOENT from parsers on subpartitions
    65b96ed954b4 arm64: dts: qcom: sm6350: Fix wrong order of freq-table-hz for UFS
    29dc88cc131d arm64: dts: st: Add memory-region-names property for stm32mp257f-ev1
    0b963a6b6137 arm64: dts: ti: k3-am62d2-evm: Fix PMIC padconfig
    51615b85109b arm64: dts: ti: k3-am62d2-evm: Fix regulator properties
    e768a9d22d38 media: verisilicon: Fix CPU stalls on G2 bus error
    e9918c6a0044 media: rc: st_rc: Fix reset control resource leak
    10eecb592afc mfd: max77620: Fix potential IRQ chip conflict when probing two devices
    e4077fcb1479 mfd: altera-sysmgr: Fix device leak on sysmgr regmap lookup
    deb4bc9fc8d0 clk: qcom: Fix dependencies of QCS_{DISP,GPU,VIDEO}CC_615
    8f41129c4b5b clk: qcom: Fix SM_VIDEOCC_6350 dependencies
    34322b533390 clk: qcom: mmcc-sdm660: Add missing MDSS reset
    a317f63255eb clk: samsung: exynos-clkout: Assign .num before accessing .hws
    1c678ce2f56b block: Clear BLK_ZONE_WPLUG_PLUGGED when aborting plugged BIOs
    4d29edea4921 leds: leds-lp50xx: Enable chip before any communication
    c99352597531 leds: leds-lp50xx: LP5009 supports 3 modules for a total of 9 LEDs
    dcd4efe48178 leds: leds-lp50xx: Allow LED 0 to be added to module bank
    67bfbc5a558c leds: leds-cros_ec: Skip LEDs without color components
    2c3edc2b7aa3 mm, swap: do not perform synchronous discard during allocation
    4ae1e46d8a29 powerpc/64s/slb: Fix SLB multihit issue during SLB preload
    96bdd7ba179f powerpc, mm: Fix mprotect on book3s 32-bit
    f1765578621f arm64: dts: ti: k3-j721e-sk: Fix pinmux for pin Y1 used by power regulator
    382895a28851 PCI/PM: Reinstate clearing state_saved in legacy and !PM codepaths
    1a793f06aa69 fgraph: Check ftrace_pids_enabled on registration for early filtering
    c0a565f133f3 fgraph: Initialize ftrace_ops->private for function graph ops
    7c8b636d3ce7 hisi_acc_vfio_pci: Add .match_token_uuid callback in hisi_acc_vfio_pci_migrn_ops
    36b5f6b52ca7 HID: logitech-dj: Remove duplicate error logging
    1e9cf600da98 hwmon: (dell-smm) Fix off-by-one error in dell_smm_is_visible()
    c341dee80b5d iommu: disable SVA when CONFIG_X86 is set
    b16243e7164c iommu/tegra: fix device leak on probe_device()
    bd2f551f575c iommu/sun50i: fix device leak on of_xlate()
    6b8390fcef61 iommu/qcom: fix device leak on of_xlate()
    d496519ccd7e iommu/omap: fix device leaks on probe_device()
    c2a13167991f iommu/mediatek: fix device leak on of_xlate()
    fa3cb4012fb2 iommu/mediatek-v1: fix device leaks on probe()
    574635a02526 iommu/mediatek-v1: fix device leak on probe_device()
    ba202227f98d iommu/ipmmu-vmsa: fix device leak on of_xlate()
    b35eeae8a566 iommu/exynos: fix device leak on of_xlate()
    9bb0b50a759e iommu/apple-dart: fix device leak on of_xlate()
    67c5f84f9b1c iommu/amd: Propagate the error code returned by __modify_irte_ga() in modify_irte_ga()
    47bed96dc7d5 iommu/amd: Fix pci_segment memleak in alloc_pci_segment()
    00ed0cc57232 ASoC: qcom: qdsp6: q6asm-dai: set 10 ms period and buffer alignment.
    372796af87d3 ASoC: qcom: q6adm: the the copp device only during last instance
    cd5691807ba6 ASoC: qcom: q6asm-dai: perform correct state check before closing
    c5c85ef27db6 ASoC: qcom: q6apm-dai: set flags to reflect correct operation of appl_ptr
    150352153ac9 ASoC: codecs: Fix error handling in pm4125 audio codec driver
    fb7d608aa7c4 ASoC: cs35l41: Always return 0 when a subsystem ID is found
    b79b8613c0c4 ASoC: qcom: sdw: fix memory leak for sdw_stream_runtime
    a619ebcf3e97 ASoC: codecs: lpass-tx-macro: fix SM6115 support
    341902036870 ASoC: codecs: pm4125: Remove irq_chip on component unbind
    28bcaff809cb ASoC: codecs: pm4125: Fix potential conflict when probing two devices
    15424b48e226 ASoC: codecs: wcd937x: Fix error handling in wcd937x codec driver
    21d87fde367a ASoC: renesas: rz-ssi: Fix rz_ssi_priv::hw_params_cache::sample_width
    4d2ae0495c75 ASoC: renesas: rz-ssi: Fix channel swap issue in full duplex mode
    3752afcc6d80 ASoC: stm32: sai: fix OF node leak on probe
    88636450c4ad ASoC: stm32: sai: fix clk prepare imbalance on probe failure
    88baed15284e ASoC: stm32: sai: fix device leak on probe
    042169940f6a ASoC: codecs: wcd939x: fix regmap leak on probe failure
    791bc3890d6f ntfs: Do not overwrite uptodate pages
    7c87afd13484 block: handle zone management operations completions
    caf7a6e95854 selftests/ftrace: traceonoff_triggers: strip off names
    7d8a5b44b9f2 blk-mq: skip CPU offline notify on unmapped hctx
    4f6e92b7c2a7 RDMA/bnxt_re: fix dma_free_coherent() pointer
    e4ee11c00d23 RDMA/rtrs: Fix clt_path::max_pages_per_mr calculation
    cf49ffdf57b6 IB/rxe: Fix missing umem_odp->umem_mutex unlock on error path
    d026f47db686 ksmbd: Fix memory leak in get_file_all_info()
    d260dff568ad drm/xe/guc: READ/WRITE_ONCE g2h_fence->done
    63dfbcd59b4b ublk: scan partition in async way
    92f024b8d47a ublk: implement NUMA-aware memory allocation
    e5abb6af905d md/raid5: fix possible null-pointer dereferences in raid5_store_group_thread_cnt()
    b53635e0e42b md: Fix static checker warning in analyze_sbs
    e0321917c03b RDMA/bnxt_re: Fix to use correct page size for PDE table
    e6d8d31d6e87 kunit: Enforce task execution in {soft,hard}irq contexts
    369a161c4872 RDMA/bnxt_re: Fix OOB write in bnxt_re_copy_err_stats()
    ac4567773ce5 RDMA/bnxt_re: Fix IB_SEND_IP_CSUM handling in post_send
    08e98ad766b1 drm/gem-shmem: Fix the MODULE_LICENSE() string
    fe8d45608042 RDMA/core: always drop device refcount in ib_del_sub_device_and_put()
    b20d6455f537 RDMA/bnxt_re: Fix incorrect BAR check in bnxt_qplib_map_creq_db()
    868197d9f85b RDMA/core: Fix logic error in ib_get_gids_from_rdma_hdr()
    277f1f4a80b4 RDMA/efa: Remove possible negative shift
    d9b9affd103f RDMA/irdma: avoid invalid read in irdma_net_event
    94dda131004e RDMA/mana_ib: check cqe length for kernel CQs
    20710399c9b5 RDMA/irdma: Fix irdma_alloc_ucontext_resp padding
    263255a62cea RDMA/ucma: Fix rdma_ucm_query_ib_service_resp struct padding
    787515ccb229 ipv6: fix a BUG in rt6_get_pcpu_route() under PREEMPT_RT
    92d900aac3a5 net: rose: fix invalid array index in rose_kill_by_device()
    ffd335167d7e net: fib: restore ECMP balance from loopback
    e3fc381320d0 ipv4: Fix reference count leak when using error routes with nexthop objects
    73744ad5696d ipv6: BUG() in pskb_expand_head() as part of calipso_skbuff_setattr()
    5e5988736a95 net: stmmac: fix the crash issue for zero copy XDP_TX action
    442848e457f5 octeontx2-pf: fix "UBSAN: shift-out-of-bounds error"
    7f18ebf8c455 platform/x86/intel/pmt/discovery: use valid device pointer in dev_err_probe
    79cab730dbaa platform/x86: hp-bioscfg: Fix out-of-bounds array access in ACPI package parsing
    fe9339b33e2b vfio/pds: Fix memory leak in pds_vfio_dirty_enable()
    4904161220d4 tools/sched_ext: fix scx_show_state.py for scx_root change
    6081ef09c54e net: bridge: Describe @tunnel_hash member in net_bridge_vlan_group struct
    bf8a0f3b787c net: usb: asix: validate PHY address before use
    93a880f73b88 net: mdio: rtl9300: use scoped for loops
    937c7172d1e3 mcb: Add missing modpost build support
    0c1df928f0b8 kbuild: fix compilation of dtb specified on command-line without make rule
    6ddf3ae19574 net: dsa: b53: skip multicast entries for fdb_dump()
    3b3ddded9c86 bng_en: update module description
    f7d95f9ee070 firewire: nosy: Fix dma_free_coherent() size
    3411103f6b3e genalloc.h: fix htmldocs warning
    b6018d5c1a8f smc91x: fix broken irq-context in PREEMPT_RT
    277b256f579a platform/x86/intel/pmt: Fix kobject memory leak on init failure
    66299520bb6e net: wangxun: move PHYLINK dependency
    9b91553a30a6 selftests: net: fix "buffer overflow detected" for tap.c
    151403e90384 net: usb: rtl8150: fix memory leak on usb_submit_urb() failure
    e4e5c21a9cd5 selftests: drv-net: psp: fix test names in ipver_test_builder()
    018071d06c3b selftests: drv-net: psp: fix templated test names in psp_ip_ver_test_builder()
    6602403b2fa1 amd-xgbe: reset retries and mode on RX adapt failures
    ddbb72c338d9 net: dsa: fix missing put_device() in dsa_tree_find_first_conduit()
    0e766b77ba50 net: dsa: properly keep track of conduit reference
    0b4fa7ac1306 net: airoha: Move net_devs registration in a dedicated routine
    b71187648ef2 team: fix check for port enabled in team_queue_override_port_prio_changed()
    4defca287bae platform/x86: ibm_rtl: fix EBDA signature search pointer arithmetic
    8f2ba8ac9ca5 platform/x86: msi-laptop: add missing sysfs_remove_group()
    f1c7923932bb platform/mellanox: mlxbf-pmc: Remove trailing whitespaces from event names
    26cca984de64 powerpc/tools: drop `-o pipefail` in gcc check scripts
    91a2b25be07c ip6_gre: make ip6gre_header() robust
    f31557fb1b35 net: openvswitch: Avoid needlessly taking the RTNL on vport destroy
    05359659c110 net: mdio: aspeed: add dummy read to avoid read-after-write issue
    fdf7c640fb8a Bluetooth: btusb: revert use of devm_kzalloc in btusb
    d084061f3360 Bluetooth: MGMT: report BIS capability flags in supported settings
    5476f7f8a311 crypto: seqiv - Do not use req->iv after crypto_aead_encrypt
    5d8b9d38a767 cpuset: fix warning when disabling remote partition
    5a7ba7e66b54 idpf: reduce mbx_task schedule delay to 300us
    85230d7ab57e idpf: fix LAN memory regions command on some NVMs
    3095228e1320 iavf: fix off-by-one issues in iavf_config_rss_reg()
    5e703706b6ea i40e: validate ring_len parameter against hardware-specific values
    db54feefa859 i40e: fix scheduling in set_rx_mode
    f9cb8a49f7a5 sched_ext: fix uninitialized ret on alloc_percpu() failure
    182a2786d248 wifi: mac80211: do not use old MBSSID elements
    7ea38152a289 wifi: cfg80211: sme: store capped length in __cfg80211_connect_result()
    90a15ff32464 wifi: rtlwifi: 8192cu: fix tid out of range in rtl92cu_tx_fill_desc()
    e5c129a05531 wifi: rtw88: limit indirect IO under powered off for RTL8822CS
    7f1f50c2055b drm/amdgpu: don't attach the tlb fence for SI
    99204fdc989c drm/displayid: add quirk to ignore DisplayID checksum errors
    61c0901cbd72 drm/edid: add DRM_EDID_IDENT_INIT() to initialize struct drm_edid_ident
    2af2abbcbf85 KVM: s390: Fix gmap_helper_zap_one_page() again
    2a30b3c9eae1 mm/huge_memory: merge uniform_split_supported() and non_uniform_split_supported()
    aeabe44c5019 sched_ext: Fix incorrect sched_class settings for per-cpu migration tasks
    b29d5e3a5625 sched/eevdf: Fix min_vruntime vs avg_vruntime
    fc83284e7527 sched/core: Add comment explaining force-idle vruntime snapshots
    d75aa97c90da x86/microcode/AMD: Select which microcode patch to load
    5a7ba9b599fc drm: nova: depend on CONFIG_64BIT
    0522222f2ac2 sched/proxy: Yield the donor task

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.18.bb              |  6 ++---
 .../linux/linux-yocto-tiny_6.18.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index e078abb2e7..ea597826de 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "cae06a38afe2ab47233686af4b49affd31977a9e"
-SRCREV_meta ?= "83fff3acfc84814b4da0cdb2a63d608d376c3cdd"
+SRCREV_machine ?= "1ea117bba0947d103ac6a28e8188cbead312bda8"
+SRCREV_meta ?= "d8bded29848649b362d0376692bd86a5f6ebc7e0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.18.3"
+LINUX_VERSION ?= "6.18.5"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index be8883a23c..dd84b78239 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.18.inc
 
-LINUX_VERSION ?= "6.18.3"
+LINUX_VERSION ?= "6.18.5"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "f7430dca0cf7d678fdc441f1653b519588861e2e"
-SRCREV_meta ?= "83fff3acfc84814b4da0cdb2a63d608d376c3cdd"
+SRCREV_machine ?= "dee93e99bec48c08795b62ec224e45c5f9b4d9f4"
+SRCREV_meta ?= "d8bded29848649b362d0376692bd86a5f6ebc7e0"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 1421587600..f56006c0f9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "8cc1dbeb4d9adb5358188cac4e3435edd2c45a58"
-SRCREV_machine:qemuarm64 ?= "f7430dca0cf7d678fdc441f1653b519588861e2e"
-SRCREV_machine:qemuloongarch64 ?= "f7430dca0cf7d678fdc441f1653b519588861e2e"
+SRCREV_machine:qemuarm ?= "8758ff0400fd85c08d4cedd687e85bc19398d118"
+SRCREV_machine:qemuarm64 ?= "dee93e99bec48c08795b62ec224e45c5f9b4d9f4"
+SRCREV_machine:qemuloongarch64 ?= "dee93e99bec48c08795b62ec224e45c5f9b4d9f4"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "f7430dca0cf7d678fdc441f1653b519588861e2e"
-SRCREV_machine:qemuriscv64 ?= "f7430dca0cf7d678fdc441f1653b519588861e2e"
-SRCREV_machine:qemuriscv32 ?= "f7430dca0cf7d678fdc441f1653b519588861e2e"
-SRCREV_machine:qemux86 ?= "f7430dca0cf7d678fdc441f1653b519588861e2e"
-SRCREV_machine:qemux86-64 ?= "f7430dca0cf7d678fdc441f1653b519588861e2e"
+SRCREV_machine:qemuppc ?= "dee93e99bec48c08795b62ec224e45c5f9b4d9f4"
+SRCREV_machine:qemuriscv64 ?= "dee93e99bec48c08795b62ec224e45c5f9b4d9f4"
+SRCREV_machine:qemuriscv32 ?= "dee93e99bec48c08795b62ec224e45c5f9b4d9f4"
+SRCREV_machine:qemux86 ?= "dee93e99bec48c08795b62ec224e45c5f9b4d9f4"
+SRCREV_machine:qemux86-64 ?= "dee93e99bec48c08795b62ec224e45c5f9b4d9f4"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "f7430dca0cf7d678fdc441f1653b519588861e2e"
-SRCREV_meta ?= "83fff3acfc84814b4da0cdb2a63d608d376c3cdd"
+SRCREV_machine ?= "dee93e99bec48c08795b62ec224e45c5f9b4d9f4"
+SRCREV_meta ?= "d8bded29848649b362d0376692bd86a5f6ebc7e0"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "78d82960b939df64cf7d26ca5ed34eb87f44c9e5"
+SRCREV_machine:class-devupstream ?= "dc554c8fb361f13580da3f5a98ad8b494a788666"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.18/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.18.3"
+LINUX_VERSION ?= "6.18.5"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


