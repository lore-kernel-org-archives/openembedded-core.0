Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F228FCE9D52
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 15:24:00 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92231.1767713038452436015
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 07:23:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UH+kB1mR;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4ee05b2b1beso9591171cf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 07:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767713037; x=1768317837; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bxNj3pwyTb07QzPCfSQTQ1GQgN0rCa3QH86dSzq8ok=;
        b=UH+kB1mRd23kdSYpck/7vCE/pF7MD7GDFyX8r5K4fBEmfCUNz9rmDpeJWAXhWLBFEH
         kMnBqP8ArpVPUtuxJiuN+vD7HYyG3T3wniVpF4w7d8xcJHZuZ6rSBsArdm3MspJUJjax
         ZNVUvrlwLxnqS+vELkS9Cgzzs9pWj8I+1zWKfRPH0H0j5+QXhMzlR08ckAGf8yu4x4dz
         0/60cFZwfwXqidRKlSk6JruXFjr1uLMbes3/WetqOYNW/dDAsbvCuy8OOSdnmQoDY3ZD
         Fif/vasd/YsS4FJN4Jcu1fNwalHEMOErXUVh/9PdcBiijBaG0Zy9yxUtsg3/EyJ5SmgB
         1zLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767713037; x=1768317837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5bxNj3pwyTb07QzPCfSQTQ1GQgN0rCa3QH86dSzq8ok=;
        b=njsWciFCi3rt56kzvu/0u81SjzEGTQYe6SIYd9uMyELGket1usPfJImE1DHb6+6k1J
         HsXYkhw7IRONuQoQmNOvTPcpkPI2hutmsJ5oRzexldaTUbFKaF0KtszajMsyx1mFxBDw
         vN4BNUob7egHaAH+eQMKaL/+zdBsYBrkcjt9Um3rSLKhA50Ue4Uj+Sq5gYaGzsrHXEMV
         T2+7C/B3QhFUjdKlcIBYQO15GKb3OHYBYfcYYHdMS7DpqQvXuV0pUEewISev22M5Zssx
         tPW2OZ7K9ERqcHnhCbADkoDHi1fn/Gf6nmnyRgZNIEg2Bi9MnEMmwJMEVFRZA/rrxjVc
         IKHg==
X-Gm-Message-State: AOJu0Yw3e+t4aI5KDRVSaOCXG0K2TkI8hVFk33uLsV8xruAQbAPhBM7W
	6OpcYmzVxiT/9VuTIoXKuyzTDh0HtxtYnXXbwo1D2KB040Ocqs6q9FN/
X-Gm-Gg: AY/fxX5qcwFtT/Z4m5f5lOZdAlPT1Pd2PJn6JLyD8Dn9xL7Qhd9hJLUHcSMRZqK/9aD
	fAztIDxPvp+a5Ecx8DvKPFgxME5u1gSUPY00dw3IGoQOzwyacfnAP1aj3mRPyz+8v8pEvai8vbi
	2s90N4ilB613bZC2ttgA3ty2yz04DwXt8CO43c5qe/nLbmdTCwkc2cc73fWHaIpuM+UcMOY03Mj
	6RdQbCJMZ0O9GqpG8O+A1OVnHfubx69gUqmoLWAQFhIh1oySZ6C35Gm4u6THEIEcBgGpgXeNZy0
	quS4WcpYwTcfjXmFzTh+zxrWDclWzDuqXtQ4S2nbd27hD5qoUbctZB+hqiF4+fIqHWgSsHah4tr
	cl/YP57AXGISTp91yWDGk+1T1/t1+dH9JwkUhXsQV1TET6RNvxBycCb106YyjkjHtvj510qyOCv
	jf2QWRD0DC4R+VK10HeoRI2RsngAdkRPU93GiiKiofeTfiB7W1YQiBTEv7FneTHOmAey/J8ytc0
	5RPe5jRCB/feWM7QmDeIfRaAA==
X-Google-Smtp-Source: AGHT+IEMAsbkU5q/7iwlkCsMbRbA8CwFmS/xFx1tukG0y+UvcyQVnEMNkJsXXVCcL+M/alYIuwrbjg==
X-Received: by 2002:a05:622a:4c18:b0:4ee:2bfb:1658 with SMTP id d75a77b69052e-4ffa77a843bmr42722891cf.45.1767713037169;
        Tue, 06 Jan 2026 07:23:57 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077267b9esm15587326d6.48.2026.01.06.07.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 07:23:56 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	haokexin@gmail.com
Subject: [meta][PATCH 02/07] linux-yocto/6.12: update to v6.12.63
Date: Tue,  6 Jan 2026 10:23:47 -0500
Message-Id: <20260106152352.932717-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260106152352.932717-1-bruce.ashfield@gmail.com>
References: <20260106152352.932717-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 15:24:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228896

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    567bd8cbc2fe6 Linux 6.12.63
    6e611d9cf0723 ASoC: codecs: nau8325: Silence uninitialized variables warnings
    5588b7c86efff ALSA: wavefront: Fix integer overflow in sample size validation
    c0a1fe1902ad2 ALSA: dice: fix buffer overflow in detect_stream_formats()
    8404a1b1f5f16 usb: dwc3: dwc3_power_off_all_roothub_ports: Use ioremap_np when required
    6c36af8083503 usb: phy: Initialize struct usb_phy list_head
    6f31b2ca1e483 usb: gadget: tegra-xudc: Always reinitialize data toggle when clear halt
    4b89397807eb0 tcp_metrics: use dst_dev_net_rcu()
    90c47a1a526c2 net: dst: introduce dst->dev_rcu
    8401fe8638491 net: lan743x: Allocate rings outside ZONE_DMA
    429bf3f04c24a LoongArch: Add machine_kexec_mask_interrupts() implementation
    a4b7a958c908a ocfs2: fix memory leak in ocfs2_merge_rec_left()
    3873afcb57614 irqchip/mchp-eic: Fix error code in mchp_eic_domain_alloc()
    31ab2aad7a7b7 scsi: imm: Fix use-after-free bug caused by unfinished delayed work
    4d7944f49b7cc efi/cper: align ARM CPER type with UEFI 2.9A/2.10 specs
    448fd9d43a122 efi/cper: Adjust infopfx size to accept an extra space
    0294effcc106c efi/cper: Add a new helper function to print bitmasks
    c3590c7812000 dm log-writes: Add missing set_freezable() for freezable kthread
    138603953aab3 dm-raid: fix possible NULL dereference with undefined raid type
    49278ca55ccf0 block: return unsigned int from queue_dma_alignment
    3baeec23a82e7 block: Use RCU in blk_mq_[un]quiesce_tagset() instead of set->tag_list_lock
    592c4fe953d7d ARM: 9464/1: fix input-only operand modification in load_unaligned_zeropad()
    0d71b3c2ed742 ALSA: firewire-motu: add bounds check in put_user loop for DSP events
    5998ad91f8722 rtc: gamecube: Check the return value of ioremap()
    c5bb128353e12 drm/amdkfd: Use huge page size to check split svm range alignment
    79331b0b4df10 ALSA: uapi: Fix typo in asound.h comment
    fb41332a7a8b5 dma/pool: eliminate alloc_pages warning in atomic_pool_expand
    b23111ec50d86 docs: hwmon: fix link to g762 devicetree binding
    341d5aa3f0592 cifs: Fix handling of a beyond-EOF DIO/unbuffered read over SMB2
    7cd9ed8132d38 drm/nouveau: refactor deprecated strcpy
    6275fd726d53a ALSA: firewire-motu: fix buffer overflow in hwdep read for DSP events
    d532934cf11ad regulator: fixed: Rely on the core freeing the enable GPIO
    3371a55632b84 drm/plane: Fix IS_ERR() vs NULL check in drm_plane_create_hotspot_properties()
    19478fd933414 nvme-auth: use kvfree() for memory allocated with kvcalloc()
    453e4b0c84d0d block: fix memory leak in __blkdev_issue_zero_pages
    b8da217fc9280 block: fix comment for op_is_zone_mgmt() to include RESET_ALL
    be83e65542635 blk-mq: Abort suspend when wakeup events are pending
    91aa13e108c75 ASoC: ak5558: Disable regulator when error happens
    436602fc10f7e ASoC: ak4458: Disable regulator when error happens
    7131bff8d2198 ASoC: bcm: bcm63xx-pcm-whistler: Check return value of of_dma_configure()
    5c51a11c1aee0 platform/x86: asus-wmi: use brightness_set_blocking() for kbd led
    76b7524ece4a5 fs/nls: Fix inconsistency between utf8_to_utf32() and utf32_to_utf8()
    a3dbaa09db4f5 NFS: Fix inheritance of the block sizes when automounting
    d867a77a939a1 Expand the type of nfs_fattr->valid
    612cc98698d66 NFS: Automounted filesystems should inherit ro,noexec,nodev,sync flags
    2704453bd1fbb Revert "nfs: ignore SB_RDONLY when mounting nfs"
    1caf1aa241f7f Revert "nfs: clear SB_RDONLY before getting superblock"
    acd4088a25800 Revert "nfs: ignore SB_RDONLY when remounting nfs"
    59947dff0fb7c NFSv4/pNFS: Clear NFS_INO_LAYOUTCOMMIT in pnfs_mark_layout_stateid_invalid
    fa561b29b7a85 NFS: Initialise verifiers for visible dentries in _nfs4_open_and_get_state
    ef97a2a5c1d56 nfs/vfs: discard d_exact_alias()
    af4c780b9f1fd NFS: Initialise verifiers for visible dentries in nfs_atomic_open()
    85d84f6c98fcb NFS: Initialise verifiers for visible dentries in readdir and lookup
    0aba4b43a27bf fs/nls: Fix utf16 to utf8 conversion
    ef7a9c2fae325 NFS: Avoid changing nlink when file removes and attribute updates race
    dfa39de442ecd f2fs: maintain one time GC mode is enabled during whole zoned GC cycle
    3573b62002723 f2fs: add gc_boost_gc_greedy sysfs node
    4236c017c4cec f2fs: add gc_boost_gc_multiple sysfs node
    4c5181b9e1a99 f2fs: introduce reserved_pin_section sysfs entry
    d4a4abba45849 f2fs: sysfs: add encoding_flags entry
    7cc6b80df66f6 f2fs: add carve_out sysfs node
    65e42a7084d1a f2fs: fix to avoid running out of free segments
    9933e05f508e0 f2fs: add a sysfs entry to reclaim POSIX_FADV_NOREUSE pages
    58ecedab080c4 f2fs: keep POSIX_FADV_NOREUSE ranges
    3e50b6e2b118d platform/x86:intel/pmc: Update Arrow Lake telemetry GUID
    cee20212a7b09 sched/fair: Fix unfairness caused by stalled tg_load_avg_contrib when the last task migrates out
    b15affae51ed9 9p: fix cache/debug options printing in v9fs_show_options
    d4b20e53b67cc fbdev: ssd1307fb: fix potential page leak in ssd1307fb_probe()
    15a6847f28085 pinctrl: single: Fix incorrect type for error return variable
    495f3e9155716 perf hist: In init, ensure mem_info is put on error paths
    e8097bd44a52d perf tools: Fix split kallsyms DSO counting
    d6cbe9b36f368 perf tools: Mark split kallsyms DSOs as loaded
    0b6216f9b3d1c net/sched: sch_cake: Fix incorrect qlen reduction in cake_drop
    2c011aea3d28b net: dsa: xrs700x: reject unsupported HSR configurations
    dccbe4fab76f1 net: hsr: create an API to get hsr port type
    ef964411c8ca7 net: hsr: Create and export hsr_get_port_ndev()
    57364f7d6d921 net: hsr: remove synchronize_rcu() from hsr_add_port()
    f906362c605bc net: hsr: remove one synchronize_rcu() from hsr_del_port()
    b61d747c0a749 clk: keystone: fix compile testing
    fa73dbe02e052 md/raid5: fix IO hang when array is broken with IO inflight
    a553e969dc9c4 remoteproc: qcom_q6v5_wcss: fix parsing of qcom,halt-regs
    6e1acbe563ddd mtd: lpddr_cmds: fix signed shifts in lpddr_cmds
    bd8bb75d859a1 selftests: bonding: add delay before each xvlan_over_bond connectivity check
    0b6795286e7a1 selftests: bonding: add ipvlan over bond testing
    b7e669dce505a net: phy: aquantia: check for NVMEM deferral
    45d7cf5174e4b vfio/pci: Use RCU for error/request triggers to avoid circular locking
    cad6c0fd6f3c0 spi: ch341: fix out-of-bounds memory access in ch341_transfer_one
    f6f13e468b725 mtd: rawnand: renesas: Handle devm_pm_runtime_enable() errors
    7c3ba62a4d29f net: stmmac: fix rx limit check in stmmac_rx_zc()
    b29ddccf36946 netfilter: nft_connlimit: update the count if add was skipped
    3558faee8aace netfilter: nf_conncount: rework API to use sk_buff directly
    9f953b045886c netfilter: flowtable: check for maximum number of encapsulations in bridge vlan
    c80fa09cba1f5 Reinstate "resource: avoid unnecessary lookups in find_next_iomem_res()"
    d050ffbf22212 resource: introduce is_type_match() helper and use it
    9a15982a2c099 resource: replace open coded resource_intersection()
    a9864d42ebcdd regulator: core: Protect regulator_supply_alias_list with regulator_list_mutex
    2d2fd5b65b1ed ARM: dts: samsung: exynos4412-midas: turn off SDIO WLAN chip during system suspend
    bac13d9609b50 ARM: dts: samsung: exynos4210-trats: turn off SDIO WLAN chip during system suspend
    03d6aa9e43d89 ARM: dts: samsung: exynos4210-i9100: turn off SDIO WLAN chip during system suspend
    5cc0fd103918c ARM: dts: samsung: universal_c210: turn off SDIO WLAN chip during system suspend
    7be6791043574 spi: airoha-snfi: en7523: workaround flash damaging if UART_TXD was short to GND
    9ff7ef2efae33 ASoC: Intel: catpt: Fix error path in hw_params()
    7bc42097e9729 vdpa/pds: use %pe for ERR_PTR() in event handler registration
    0cea55e0272cb vhost: Fix kthread worker cgroup failure handling
    30be771c090a8 vdpa/mlx5: Fix incorrect error code reporting in query_virtqueues
    807b0fb13a80a virtio: fix virtqueue_set_affinity() docs
    6cdca761ef227 virtio: fix grammar in virtio_queue_info docs
    bdc76b2c1cf50 virtio: fix whitespace in virtio_config_ops
    3a4894736e6b0 virtio: fix typo in virtio_device_ready() comment
    5f5cb2c99ae97 virtio_vdpa: fix misleading return in void function
    094e8f78c6335 of: Skip devicetree kunit tests when RISCV+ACPI doesn't populate root node
    ade5800a8d325 ext4: improve integrity checking in __mb_check_buddy by enhancing order-0 validation
    d6d3371611d28 ublk: prevent invalid access with DEBUG
    438f9673f3cb1 ACPI: processor_core: fix map_x2apic_id for amd-pstate on am4
    0927f7b4dcb9d hwmon: sy7636a: Fix regulator_enable resource leak on error path
    332825d72dcb3 drm/amd/display: Fix logical vs bitwise bug in get_embedded_panel_info_v2_1()
    1b3eb9500fc55 greybus: gb-beagleplay: Fix timeout handling in bootloader functions
    80c2106b09d3b firmware_loader: make RUST_FW_LOADER_ABSTRACTIONS select FW_LOADER
    6f1a1e7b5a48f ASoC: fsl_xcvr: clear the channel status control memory
    edb2b25561862 gfs2: Prevent recursive memory reclaim
    ceb8ee5ed4507 ASoC: nau8325: add missing build config
    78b923fa3de32 ASoC: nau8325: use simple i2c probe function
    c59358338c0b9 drm/panthor: Avoid adding of kernel BOs to extobj list
    6567f40a75adb RDMA/irdma: Do not directly rely on IB_PD_UNSAFE_GLOBAL_RKEY
    ef043432e4ec1 RDMA/irdma: Fix data race in irdma_free_pble
    abd2675d9aac4 RDMA/irdma: Fix data race in irdma_sc_ccq_arm
    64144891d882c iommu/arm-smmu-qcom: Enable use of all SMR groups when running bare-metal
    45285d357287b backlight: lp855x: Fix lp855x.h kernel-doc warnings
    0e63ea4378489 backlight: led-bl: Add devlink to supplier LEDs
    452eec7f208f5 wifi: ieee80211: correct FILS status codes
    3b5f35085f815 iomap: always run error completions in user context
    133900d61dacd iomap: factor out a iomap_dio_done helper
    96eab6610cb3a um: Don't rename vmap to kernel_vmap
    168592b56cae4 drm/nouveau: restrict the flush page to a 32-bit address
    ee1aedaef571f PCI: dwc: Fix wrong PORT_LOGIC_LTSSM_STATE_MASK definition
    14dd377ab65f1 btrfs: fix leaf leak in an error path in btrfs_del_items()
    1b1284e4f30e8 iommu/arm-smmu-v3: Fix error check in arm_smmu_alloc_cd_tables
    e0d1555bb0828 staging: fbtft: core: fix potential memory leak in fbtft_probe_common()
    50b878db54c85 firmware: stratix10-svc: fix make htmldocs warning for stratix10_svc
    278bfed4529a0 mt76: mt7615: Fix memory leak in mt7615_mcu_wtbl_sta_add()
    1df9aeb2a4f03 ASoC: tas2781: correct the wrong period
    7b5f15a32912f RDMA/bnxt_re: Pass correct flag for dma mr creation
    c996c81cecb6c RDMA/bnxt_re: Fix the inline size for GenP7 devices
    34447aeedbaea erofs: limit the level of fs stacking for file-backed mounts
    349f101d3f967 RISC-V: KVM: Fix guest page fault within HLV* instructions
    1e38b525909b4 crypto: ccree - Correctly handle return of sg_nents_for_len
    0c3854d65cc44 crypto: starfive - Correctly handle return of sg_nents_for_len
    ef5e709c0494f selftests/bpf: Improve reliability of test_perf_branches_no_hw()
    510282952d7c6 selftests/bpf: skip test_perf_branches_hw() on unsupported platforms
    ef065c4d4a2d8 usb: raw-gadget: cap raw_io transfer length to KMALLOC_MAX_SIZE
    f8408e1e54dda usb: dwc2: fix hang during suspend if set as peripheral
    23c928493dc5d usb: dwc2: fix hang during shutdown if set as peripheral
    cc9b6180a4c44 usb: dwc2: disable platform lowlevel hw resources during shutdown
    1358e9fecb89c usb: chaoskey: fix locking for O_NONBLOCK
    c2238d487a640 ima: Handle error code returned by ima_filter_rule_match()
    2599ad5e33b62 RAS: Report all ARM processor CPER information to userspace
    4758770a673c6 wifi: rtl818x: rtl8187: Fix potential buffer underflow in rtl8187_rx_cb()
    a0e2c571e8504 cpuset: Treat cpusets in attaching as populated
    d8b726ee9d937 net: phy: adin1100: Fix software power-down ready condition
    42d6ee65cdc89 phy: rockchip: samsung-hdptx: Prevent Inter-Pair Skew from exceeding the limits
    3200ec35a050b phy: rockchip: samsung-hdptx: Reduce ROPLL loop bandwidth
    9f23c97c45dd1 phy: freescale: Initialize priv->lock
    8fee9a8cb58fa phy: renesas: rcar-gen3-usb2: Fix an error handling path in rcar_gen3_phy_usb2_probe()
    3c5869f5fd366 leds: rgb: leds-qcom-lpg: Don't enable TRILED when configuring PWM
    579a91ff0845e mfd: mt6358-irq: Fix missing irq_domain_remove() in error path
    80daa408957ac mfd: mt6397-irq: Fix missing irq_domain_remove() in error path
    199aea40b8680 wifi: mac80211: fix CMAC functions not handling errors
    903e36c9e952f iommu/vt-d: Fix unused invalidation hint in qi_desc_iotlb
    8e9f0a0717ba3 scsi: qla2xxx: Fix improper freeing of purex item
    157cf2b51d74f pwm: bcm2835: Make sure the channel is enabled after pwm_request()
    96e436a051993 perf arm_spe: Fix memset subclass in operation
    c8fe12ed4da96 perf arm-spe: Extend branch operations
    03f642caab84b ipv6: clear RA flags when adding a static route
    a2339a354d115 drm/msm/a6xx: Improve MX rail fallback in RPMH vote init
    ae43fd9d556ea drm/msm/a6xx: Fix the gemnoc workaround
    630f2ce9c7cc6 drm/msm/a6xx: Flush LRZ cache before PT switch
    4f4f7b5797883 drm/mediatek: Fix CCORR mtk_ctm_s31_32_to_s1_n function issue
    e5bb424266927 fs/ntfs3: Prevent memory leaks in add sub record
    c4af1cd7f22a3 fs/ntfs3: out1 also needs to put mi
    8d04afc9da642 powerpc/64s/ptdump: Fix kernel_hash_pagetable dump for ISA v3.00 HPTE format
    f6573f4049f78 powerpc/64s/hash: Restrict stress_hpt_struct memblock region to within RMA limit
    539137e3038ce bpf: Fix invalid prog->stats access when update_effective_progs fails
    ee7db11742b30 wifi: rtl818x: Fix potential memory leaks in rtl8180_init_rx_ring()
    241dcbe651b07 drm/msm/a2xx: stop over-complaining about the legacy firmware
    de38f64811973 block/blk-throttle: Fix throttle slice time for SSDs
    bbc709db0ca76 NFSD/blocklayout: Fix minlength check in proc_layoutget
    3bcb274a192fc tracefs: fix a leak in eventfs_create_events_dir()
    362438cfc52d5 watchdog: starfive: Fix resource leak in probe error path
    0c1646149f4ed watchdog: wdat_wdt: Fix ACPI table leak in probe function
    30ce906557a21 bpf: Check skb->transport_header is set in bpf_skb_check_mtu
    ef87c16884126 selftests/bpf: Fix failure paths in send_signal test
    027ab4cbe3bd0 bpf: Handle return value of ftrace_set_filter_ip in register_fentry
    1dd5d772bcaf8 ps3disk: use memcpy_{from,to}_bvec index
    a25a953b6911e drm/msm/dpu: drop dpu_hw_dsc_destroy() prototype
    33d9ec273d60b crypto: iaa - Fix incorrect return value in save_iaa_wq()
    6816cd35ca5aa arm64: dts: rockchip: Add eeprom vcc-supply for Radxa ROCK 3C
    7225af2545d77 arm64: dts: rockchip: Add eeprom vcc-supply for Radxa ROCK 5A
    117327d2051ae arm64: dts: rockchip: Move the EEPROM to correct I2C bus on Radxa ROCK 5A
    d258d7e5d3c94 PCI: keystone: Exit ks_pcie_probe() for invalid mode
    3bf1378747e25 bpf: Free special fields when update [lru_,]percpu_hash maps
    345e130c0b28d leds: netxbig: Fix GPIO descriptor leak in error paths
    0401a20abbd65 scsi: sim710: Fix resource leak by adding missing ioport_unmap() calls
    9b2e70df6dd02 ACPI: property: Fix fwnode refcount leak in acpi_fwnode_graph_parse_endpoint()
    e5c2503696ec2 ocfs2: relax BUG() to ocfs2_error() in __ocfs2_move_extent()
    c2a0862ad4c36 lib/vsprintf: Check pointer before dereferencing in time_and_date()
    aa07a5df8cf17 clk: renesas: r9a06g032: Fix memory leak in error path
    38e5e8b4d645e coresight: etm4x: Add context synchronization before enabling trace
    11c5672a04d09 coresight: etm4x: Extract the trace unit controlling
    bebb32a222280 coresight: etm4x: Correct polling IDLE bit
    fef8b751d8d05 coresight: Change device mode to atomic type
    c9b99c948b4fb nbd: defer config unlock in nbd_genl_connect
    199c3a2725add wifi: cw1200: Fix potential memory leak in cw1200_bh_rx_helper()
    230621ffdb361 macintosh/mac_hid: fix race condition in mac_hid_toggle_emumouse
    d8a3693c58ae3 powerpc/32: Fix unpaired stwcx. on interrupt exit
    d8c573471ec0b powerpc/kdump: Fix size calculation for hot-removed memory ranges
    37d511e849139 cpufreq/amd-pstate: Call cppc_set_auto_sel() only for online CPUs
    90138ed922e57 scsi: ufs: core: fix incorrect buffer duplication in ufshcd_read_string_desc()
    98ae4025dea14 drm/panthor: Fix potential memleak of vma structure
    6e17555728bc4 ntfs3: init run lock for extend inode
    054e5045f1563 ARM: dts: stm32: stm32mp157c-phycore: Fix STMPE811 touchscreen node properties
    2e2b5aba8ad77 RDMA/rtrs: server: Fix error handling in get_or_create_srv
    71786f697121d dt-bindings: PCI: amlogic: Fix the register name of the DBI region
    eccc02ba17475 scsi: smartpqi: Fix device resources accessed after device removal
    8616943e0729a scsi: stex: Fix reboot_notifier leak in probe error path
    6b69593f72e1b nbd: defer config put in recv_work
    21989cb5034c8 md: fix rcu protection in md_wakeup_thread
    b991eda2a7f1b regulator: core: disable supply if enabling main regulator fails
    a0f1e48023c8f perf/x86/intel: Correct large PEBS flag check
    a7abd40cbfcfd ext4: correct the checking of quota files before moving extents
    520de30d8c92b mfd: da9055: Fix missing regmap_del_irq_chip() in error path
    22b5b6262958a locktorture: Fix memory leak in param_set_cpumask()
    2390e90a5cd2f efi/libstub: Fix page table access in 5-level to 4-level paging transition
    b299217115f54 x86/boot: Fix page table access in 5-level to 4-level paging transition
    2e1132b0832ea ARM: dts: omap3: n900: Correct obsolete TWL4030 power compatible
    99da0f593d0b0 ARM: dts: omap3: beagle-xm: Correct obsolete TWL4030 power compatible
    6110aca23ded7 ARM: dts: am335x-netcom-plus-2xx: add missing GPIO labels
    627be3c40095e libbpf: Fix parsing of multi-split BTF
    551060efb156c spi: tegra210-quad: Fix timeout handling
    5a0060ddfc1fc drm/panthor: Fix UAF on kernel BO VA nodes
    ae6e58069d846 drm/panthor: Fix race with suspend during unplug
    31db188355a49 drm/panthor: Fix UAF race between device unplug and FW event processing
    1ed88300c3330 drm/panthor: Fix group_free_queue() for partially initialized queues
    82484ee4f02f0 drm/panthor: Handle errors returned by drm_sched_entity_init()
    e5b181c4ea852 fs/9p: Don't open remote file with APPEND mode when writeback cache is used
    288fa0d792bcc scsi: target: Do not write NUL characters into ASCII configfs output
    e8fe1cd91ec88 power: supply: apm_power: only unset own apm_get_power_status
    f8897c84d9be6 power: supply: wm831x: Check wm831x_set_bits() return value
    1b8769af5dc1c power: supply: rt9467: Prevent using uninitialized local variable in rt9467_set_value_from_ranges()
    e52391c353028 power: supply: rt9467: Return error on failure in rt9467_set_value_from_ranges()
    076481e5ee775 power: supply: max17040: Check iio_read_channel_processed() return code
    748c3b8a68121 power: supply: cw2015: Check devm_delayed_work_autocancel() return code
    853e3e566595c power: supply: rt5033_charger: Fix device node reference leaks
    3a3dff0a73ba2 perf record: skip synthesize event when open evsel failed
    25b5ee3439cfc perf lock contention: Load kernel map before lookup
    76a339268d75c drm/imagination: Fix reference to devm_platform_get_and_ioremap_resource()
    f674cb00630ab interconnect: debugfs: Fix incorrect error handling for NULL path
    b528a34aaf487 arm64: dts: qcom: msm8996: add interconnect paths to USB2 controller
    3b946560c90d1 interconnect: qcom: msm8996: add missing link to SLAVE_USB_HS
    4351b8664583d wifi: ath12k: fix potential memory leak in ath12k_wow_arp_ns_offload()
    b9f9fbc3777a2 i3c: master: svc: Prevent incomplete IBI transaction
    d3bacdd55ec93 i3c: fix refcount inconsistency in i3c_master_register
    6b860ae7cd95d pinctrl: stm32: fix hwspinlock resource leak in probe function
    60d1c1d4d9258 soc: qcom: smem: fix hwspinlock resource leak in probe error paths
    5bfe033a1b775 tools/nolibc/stdio: let perror work when NOLIBC_IGNORE_ERRNO is set
    d6bec89235d73 x86/dumpstack: Prevent KASAN false positive warnings in __show_regs()
    ee96f47123495 task_work: Fix NMI race condition
    329f8323d3a55 perf/x86/intel/cstate: Remove PC3 support from LunarLake
    d1f424a77b6bd bpf: Fix stackmap overflow check in __bpf_get_stackid()
    0c472ae306761 bpf: Refactor stack map trace depth calculation into helper function
    d6d416f3b822f perf: Remove get_perf_callchain() init_nr argument
    f5a4950ad270c mtd: rawnand: lpc32xx_slc: fix GPIO descriptor leak on probe error and remove
    87e02ae9ad15e mtd: nand: relax ECC parameter validation check
    bfbb87096b953 Revert "mtd: rawnand: marvell: fix layouts"
    1d79c9aa5397a ARM: dts: renesas: r9a06g032-rzn1d400-db: Drop invalid #cells properties
    dfa2bdcf7893a ARM: dts: renesas: gose: Remove superfluous port property
    b8f6eeb87a76b RDMA/rxe: Fix null deref on srq->rq.queue after resize failure
    283a90add79fa sctp: Defer SCTP_DBG_OBJCNT_DEC() to sctp_destroy_sock().
    a720fb15bd06a phy: mscc: Fix PTP for VSC8574 and VSC8572
    41d2074ca8689 arm64: dts: qcom: qcm6490-shift-otter: Add missing reserved-memory
    11fc271a600a4 arm64: dts: qcom: sm8650: set ufs as dma coherent
    3309c64e0ecd6 arm64: dts: qcom: sdm845-oneplus: Correct gpio used for slider
    4173401d2fd8b arm64: dts: qcom: x1e80100: Add missing quirk for HS only USB controller
    7335bfb012594 arm64: dts: qcom: x1e80100: Fix compile warnings for USB HS controller
    17b65e48030ef firmware: imx: scu-irq: fix OF node leak in
    d5b0d62a2ee8f arm64: dts: ti: k3-am62p: Fix memory ranges for GPU
    d1376bcacc820 s390/ap: Don't leak debug feature files if AP instructions are not available
    ecb0b9f92503b s390/smp: Fix fallback CPU detection
    097c870b91817 wifi: ath11k: fix peer HE MCS assignment
    7ee69f3590714 wifi: ath11k: fix VHT MCS assignment
    ecd1ca3bd8bdd crypto: hisilicon/qm - restore original qos values
    c73be4f51eed9 crypto: asymmetric_keys - prevent overflow in asymmetric_key_generate_id
    7e7135c842872 soc: qcom: gsbi: fix double disable caused by devm
    3cc3f161201b7 soc: Switch back to struct platform_driver::remove()
    23e8fc7c9543a clk: qcom: camcc-sm7150: Fix PLL config of PLL2
    01b20bb5313d7 clk: qcom: camcc-sm6350: Fix PLL config of PLL2
    d55e7dec3c2f7 clk: qcom: camcc-sm6350: Specify Titan GDSC power domain as a parent to other
    9bfd3a7d31ba7 clk: qcom: camcc-sm8550: Specify Titan GDSC power domain as a parent to other
    fa963643a8906 uio: uio_fsl_elbc_gpcm:: Add null pointer check to uio_fsl_elbc_gpcm_probe
    f93f66ffcb0d5 PCI: rcar-gen2: Drop ARM dependency from PCI_RCAR_GEN2
    0ac1d13b2442c arm64: dts: exynos: gs101: fix sysreg_apm reg property
    c8c93fe1c444a perf annotate: Check return value of evsel__get_arch() properly
    cc67b6d82b122 arm64: dts: imx8mp-venice-gw702x: remove off-board sdhc1
    7c8dc554965f7 arm64: dts: imx8mp-venice-gw702x: remove off-board uart
    54235eadb2284 arm64: dts: imx8mm-venice-gw72xx: remove unused sdhc1 pinctrl
    ad7356c7ead8b arm64: dts: freescale: imx8mp-venice-gw7905-2x: remove duplicate usdhc1 props
    da06fa2308fe5 block/mq-deadline: Switch back to a single dispatch list
    53d0a52ccc9cb block/mq-deadline: Introduce dd_start_request()
    a38a8be61000e firmware: qcom: tzmem: fix qcom_tzmem_policy kernel-doc
    9e745721342cb iio: imu: st_lsm6dsx: Fix measurement unit for odr struct member
    fe89feb2bdce1 inet: Avoid ehash lookup race in inet_twsk_hashdance_schedule()
    e1480cc48d416 inet: Avoid ehash lookup race in inet_ehash_insert()
    6b9cbefb73c35 rculist: Add hlist_nulls_replace_rcu() and hlist_nulls_replace_init_rcu()
    d96461c6c6a31 clk: qcom: gcc-x1e80100: Add missing USB4 clocks/resets
    6a2af03a6e58f dt-bindings: clock: qcom,x1e80100-gcc: Add missing USB4 clocks/resets
    3a877b22edbed dt-bindings: clock: qcom,x1e80100-gcc: Add missing video resets
    4b1fd82848fdf ntfs3: Fix uninit buffer allocated by __getname()
    7ce8f2028dfcc ntfs3: fix uninit memory after failed mi_read in mi_format_new
    752e578549ff1 crypto: authenc - Correctly pass EINPROGRESS back up to the caller
    9268a215905af irqchip/qcom-irq-combiner: Fix section mismatch
    f761c6e6db3ad irqchip/starfive-jh8100: Fix section mismatch
    d604a43972ca2 irqchip/renesas-rzg2l: Fix section mismatch
    3054c0fcb4bb0 irqchip/imx-mu-msi: Fix section mismatch
    987028716f9dd irqchip/irq-brcmstb-l2: Fix section mismatch
    75f13a37fcf5f irqchip/irq-bcm7120-l2: Fix section mismatch
    c30d7fa84614f irqchip/irq-bcm7038-l1: Fix section mismatch
    d5843e1530d8d sched/fair: Forfeit vruntime on yield
    735e232cd9cc9 wifi: ath11k: restore register window after global reset
    6d9ff97af0151 wifi: ath10k: move recovery check logic into a new work
    78d6455b04bc3 wifi: ath10k: Add missing include of export.h
    5b9c7e103728b wifi: ath10k: Avoid vdev delete timeout when firmware is already down
    aea8e105743be objtool: Fix weak symbol detection
    5be8a348528b7 objtool: Fix standalone --hacks=jump_label
    f0581990dbf3a HID: logitech-hidpp: Do not assume FAP in hidpp_send_message_sync()
    fe4b23d94f3ac drm: atmel-hlcdc: fix atmel_xlcdc_plane_setup_scaler()
    95f29bada0505 clk: renesas: cpg-mssr: Read back reset registers to assure values latched
    c0b15580c17f0 clk: renesas: Pass sub struct of cpg_mssr_priv to cpg_clk_register
    efa305a20eb96 clk: renesas: Use str_on_off() helper
    26fa515baf084 clk: renesas: cpg-mssr: Add missing 1ms delay into reset toggle callback
    d87a89c5a7eba pinctrl: renesas: rzg2l: Fix PMC restore
    1f925f9047a4f USB: Fix descriptor count when handling invalid MBIM extended descriptor
    338e388c0d80f drm/vgem-fence: Fix potential deadlock on release
    470da7a2c29c6 accel/ivpu: Fix DCT active percent format
    e4341b780b22f accel/ivpu: Make function parameter names consistent
    e7bf47d73cd87 drm/panel: visionox-rm69299: Don't clear all mode flags
    a3c1fa8fe761e accel/ivpu: Ensure rpm_runtime_put in case of engine reset/resume fail
    b5890eb95ebb3 accel/ivpu: Prevent runtime suspend during context abort work
    4e6e07ce0197a gpu: host1x: Fix race in syncpt alloc/free
    f0a9ef99fb3c4 smack: fix bug: setting task label silently ignores input garbage
    ac9fce2efabad smack: fix bug: unprivileged task can create labels
    b68902daf0994 smack: fix bug: invalid label of unix socket file
    ad396a05d9851 smack: always "instantiate" inode in smack_inode_init_security()
    abf20a13507fe smack: deduplicate xattr setting in smack_inode_init_security()
    d684f66dd729e smack: fix bug: SMACK64TRANSMUTE set on non-directory
    74a813e575ef5 smack: deduplicate "does access rule request transmutation"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 9ac8507f9f..75e9a80d7c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "921e3aa4f264810a46d67b9d6d84ff2707035cbc"
-SRCREV_meta ?= "0bc72383691f29eb7fc4661afa9d67e106635929"
+SRCREV_machine ?= "1355364a79ad7f57bdcec8ee2190c1859a07c613"
+SRCREV_meta ?= "f7d83a5a4be20f4f4d3fcf3b1fbd23aa69bdc6ac"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.62"
+LINUX_VERSION ?= "6.12.63"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 940561352c..119f50e56f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.62"
+LINUX_VERSION ?= "6.12.63"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "f206d396d0a1a71cc4911b8c6714fcc1ba561caf"
-SRCREV_meta ?= "0bc72383691f29eb7fc4661afa9d67e106635929"
+SRCREV_machine ?= "8b6eae329c7720386de14aa56db14b9c81f2e67d"
+SRCREV_meta ?= "f7d83a5a4be20f4f4d3fcf3b1fbd23aa69bdc6ac"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 84419f8c78..569e00b391 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "2b0e0a13ceb7489631bbd27be1562e7203b6bbde"
-SRCREV_machine:qemuarm64 ?= "f206d396d0a1a71cc4911b8c6714fcc1ba561caf"
-SRCREV_machine:qemuloongarch64 ?= "f206d396d0a1a71cc4911b8c6714fcc1ba561caf"
-SRCREV_machine:qemumips ?= "6b71abf154b206dfc44af020a74c9b9700fa966c"
-SRCREV_machine:qemuppc ?= "f206d396d0a1a71cc4911b8c6714fcc1ba561caf"
-SRCREV_machine:qemuriscv64 ?= "f206d396d0a1a71cc4911b8c6714fcc1ba561caf"
-SRCREV_machine:qemuriscv32 ?= "f206d396d0a1a71cc4911b8c6714fcc1ba561caf"
-SRCREV_machine:qemux86 ?= "f206d396d0a1a71cc4911b8c6714fcc1ba561caf"
-SRCREV_machine:qemux86-64 ?= "f206d396d0a1a71cc4911b8c6714fcc1ba561caf"
-SRCREV_machine:qemumips64 ?= "abc4547fe89dba23de4366b8cd183226cab0cf85"
-SRCREV_machine ?= "f206d396d0a1a71cc4911b8c6714fcc1ba561caf"
-SRCREV_meta ?= "0bc72383691f29eb7fc4661afa9d67e106635929"
+SRCREV_machine:qemuarm ?= "0d1e473f418dcf7ad2a0dcae8d0b3fcb22c0f5b3"
+SRCREV_machine:qemuarm64 ?= "8b6eae329c7720386de14aa56db14b9c81f2e67d"
+SRCREV_machine:qemuloongarch64 ?= "8b6eae329c7720386de14aa56db14b9c81f2e67d"
+SRCREV_machine:qemumips ?= "aa71382dd614aabfda8e3531c2cca96c0c766cc0"
+SRCREV_machine:qemuppc ?= "8b6eae329c7720386de14aa56db14b9c81f2e67d"
+SRCREV_machine:qemuriscv64 ?= "8b6eae329c7720386de14aa56db14b9c81f2e67d"
+SRCREV_machine:qemuriscv32 ?= "8b6eae329c7720386de14aa56db14b9c81f2e67d"
+SRCREV_machine:qemux86 ?= "8b6eae329c7720386de14aa56db14b9c81f2e67d"
+SRCREV_machine:qemux86-64 ?= "8b6eae329c7720386de14aa56db14b9c81f2e67d"
+SRCREV_machine:qemumips64 ?= "e972741e78964ef4c2c43809e5bb9fb503552e6f"
+SRCREV_machine ?= "8b6eae329c7720386de14aa56db14b9c81f2e67d"
+SRCREV_meta ?= "f7d83a5a4be20f4f4d3fcf3b1fbd23aa69bdc6ac"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "53d3c6ddbb9749ebc06956a13ed6eead31402a7d"
+SRCREV_machine:class-devupstream ?= "567bd8cbc2fe6b28b78864cbbbc41b0d405eb83c"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.62"
+LINUX_VERSION ?= "6.12.63"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


