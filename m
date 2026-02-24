Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D2AEF5862
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:25:10 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21465.1771943104731465016
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:25:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=yr1bTlN2;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48371119eacso65977595e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943103; x=1772547903; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vzMVeM3tshEgZ6mC/VlEdmP14by7YR/wr60zT8/oAKc=;
        b=yr1bTlN2L4PYWQbBKDGswNOJ7XxTfS7Jmpoht4XWp7HjJWlSyEbntwY441NXTmouLH
         A9+hLH1g5hheqZlZt/1DjFWkHVX1BfPXAjEpupkZmWeM1yJwTWMBCY1tuZUMjJIc9Bb8
         aOeF4/qMtMRARYOxjuGt2Xp6Nfp7cirbt4ZrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943103; x=1772547903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vzMVeM3tshEgZ6mC/VlEdmP14by7YR/wr60zT8/oAKc=;
        b=N6WqK1Om8C+sJW4oHvZbByiYAW98Dazu09OpuwZpoI+7/JnHhikpx8MxDdlBlurlPr
         1VSzA0ev90nXaGy9rrhs+FDeDxrHKY/5HhR27ii+o8QT0QSPwuoHTnJaVxLvCh1jZkWh
         kWP2aeEJsYbjNz+KM3KMlOVMjaN4hnrswCYVaNq9cS+8j+RSQpz7XBnfsMzzHwHqTk7Q
         l5NkEkoTyNVdaMeipES3yAzt8w7gfVb2R1v1GMm2YXwa/6CR0mNgaudPSQjmsg/B7RUr
         5ZImdLNxBMJCoW0UMZfHvapszb6ghAYNoObAyIjNuSxTX8jJPmsdPKcWTowvXT2I2rCp
         bO4A==
X-Gm-Message-State: AOJu0Yw8/8bnTTiqpil/PZHweSldRYPq74jTerAUSs6fOqHGGSLD1uK/
	I56GG1zMWtOM9gwg4m6F1p1khDN0ELCOXfP2xQOzAOPGye6XyDTcHCdhUYepTSB4uRnFSXxnb0J
	Vws+O
X-Gm-Gg: AZuq6aLJQW3QwEU3UJ/FTLDIxjRTIk+DGlnmf9wuAF7h6xBs4NiByzEDrKBado10tlr
	Q3Hag9v3ARxwlU8nV484umFL3YLeMWQP22VV+4xZoB1909J5gI66swxHkNSw293xiPjGkydvIKK
	CeVJ45Vl9jJPpF5DBB127IAaV8VGWdNm+z/NjaNpFF4qXlC1S6zf953iXgaYppUKE+Mqpp3kuLY
	yDsXkW0dAteJM93bTNezWkI/BigQRKZGQk807Us0y5b4T0aqsVTnYCmbgYwr9ZCgU6WZ1bXhi5V
	4crOCJILZRtg0KwdL/HDKFluJu7qA9WKbtVv55sH7BRvvR1PdUPvikOtfR34zvFVfB+qif32S7V
	9hMoNi0JxGXX1d64QflPY6Zrn3B3td6oFITvCGnN4/m9vwIFLk6uJ33kRGkIu6S/Us78F+Vj7N5
	+muyqFdzht+/mpVCAtnjE6YsjPinxxCmFMFvowbqzoRi4TkU6EDE/im5gN5kuEzZWArqv5TmlOT
	tVf1E1j53rwmRkxM9rRxyoJk8ib7U0qTw==
X-Received: by 2002:a05:600d:6450:10b0:477:af8d:203a with SMTP id 5b1f17b1804b1-483adc6d068mr120850315e9.27.1771943102498;
        Tue, 24 Feb 2026 06:25:02 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm2047455e9.9.2026.02.24.06.25.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:25:01 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/38] linux-yocto/5.15: update to v5.15.195
Date: Tue, 24 Feb 2026 15:24:04 +0100
Message-ID: <e32eda2e64b69a5d07338a41d62227f3baa0acbe.1771942869.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771942869.git.yoann.congal@smile.fr>
References: <cover.1771942869.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:25:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231778

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    ac56c046adf41 Linux 5.15.195
    636e7d6bdf205 selftests: mptcp: join: validate C-flag + def limit
    4b9b376856a95 mptcp: pm: in-kernel: usable client side with C-flag
    946771c2a2b11 mm/slab: make __free(kfree) accept error pointers
    81d0664bed91a media: pci: ivtv: Add check for DMA map result
    71285c029dcc4 xen/events: Update virq_to_irq on migration
    9c1df18612fbb media: pci: ivtv: Add missing check after DMA map
    66c8a83bf1de2 media: pci/ivtv: switch from 'pci_' to 'dma_' API
    55a954a54ffc8 arm64: mte: Do not flag the zero page as PG_mte_tagged
    26ea9b6a93a54 media: cx18: Add missing check after DMA map
    cb044864188cc media: switch from 'pci_' to 'dma_' API
    9339cf38762ce writeback: Avoid excessively long inode switching times
    6483eabc195dc writeback: Avoid softlockup when switching many inodes
    9b902f370b93e cramfs: Verify inode mode when loading from disk
    5c64e8be2a7ef fs: Add 'initramfs_options' to set initramfs mount options
    c3b654021931d pid: Add a judgment for ns null in pid_nr_ns
    1d144b4cdde08 minixfs: Verify inode mode when loading from disk
    3fb4c19233a0e minmax.h: remove some #defines that are only expanded once
    092036da9b6d5 minmax.h: simplify the variants of clamp()
    64394017d091a minmax.h: move all the clamp() definitions after the min/max() ones
    4942fcc84a1ee minmax.h: use BUILD_BUG_ON_MSG() for the lo < hi test in clamp()
    5011c410f9670 minmax.h: reduce the #define expansion of min(), max() and clamp()
    b7ae5d8baa5ca minmax.h: update some comments
    2524736951b23 minmax.h: add whitespace around operators and after commas
    82b39b1090b0e minmax: fix up min3() and max3() too
    b1094b4b54b0f minmax: improve macro expansion and type checking
    3854a23090858 minmax: simplify min()/max()/clamp() implementation
    89f6bf22d039a minmax: don't use max() in situations that want a C constant expression
    e035ca130ff7f minmax: make generic MIN() and MAX() macros available everywhere
    4b5dda7f8b02a minmax: simplify and clarify min_t()/max_t() implementation
    3d1169785a9c1 minmax: add a few more MIN_T/MAX_T users
    e73a9333cdaee minmax: avoid overly complicated constant expressions in VM code
    9ed1e4221cb67 minmax: fix indentation of __cmp_once() and __clamp_once()
    d16b73f6c5939 minmax: deduplicate __unconst_integer_typeof()
    e3774f3281ed1 minmax: Introduce {min,max}_array()
    9c88de0e0c1e5 arm64: dts: qcom: sdm845: Fix slimbam num-channels/ees
    d238fee82dd83 btrfs: fix the incorrect max_bytes value for find_lock_delalloc_range()
    f2bd5493ef501 fscontext: do not consume log entries when returning -EMSGSIZE
    f550466949e82 locking: Introduce __cleanup() based infrastructure
    a0e54bd8d7ea7 dm: fix NULL pointer dereference in __dm_suspend()
    95dd33361061f tracing: Fix race condition in kprobe initialization causing NULL pointer dereference
    41acc922c7811 ksmbd: fix error code overwriting in smb2_get_info_filesystem()
    71a0ba7fdaf8d net: usb: asix: hold PM usage ref to avoid PM/MDIO + RTNL deadlock
    32097a08ab5de mfd: intel_soc_pmic_chtdc_ti: Set use_single_read regmap_config flag
    21d79eac5f953 mfd: intel_soc_pmic_chtdc_ti: Drop unneeded assignment for cache_type
    715f4914fdd3e mfd: intel_soc_pmic_chtdc_ti: Fix invalid regmap-config max_register value
    5d327391f9faf media: mc: Clear minor number before put device
    fbfc745db628d Squashfs: reject negative file sizes in squashfs_read_inode()
    2ec88c3d9f8fe Squashfs: add additional inode sanity checking
    49f3a867d948c ASoC: wcd934x: fix error handling in wcd934x_codec_parse_data()
    44cee8ef325c0 ASoC: codecs: wcd934x: Simplify with dev_err_probe
    e0ce3ed1048a4 KVM: x86: Don't (re)check L1 intercepts when completing userspace I/O
    6836714a08756 lib/crypto/curve25519-hacl64: Disable KASAN with clang-17 and older
    a4e7273a45e85 ext4: free orphan info with kvfree
    505e69f76ac49 ext4: guard against EA inode refcount underflow in xattr update
    b975b3607605f ext4: correctly handle queries for metadata mappings
    32702f1ce389f ext4: increase i_disksize to offset + len in ext4_update_disksize_before_punch()
    95a21611b14ae ext4: verify orphan file size is not too big
    550e0bccec100 nfsd: nfserr_jukebox in nlm_fopen should lead to a retry
    8c5b1200596ce NFSD: Fix destination buffer size in nfsd4_ssc_setup_dul()
    735457683e235 mm/page_alloc: only set ALLOC_HIGHATOMIC for __GPF_HIGH allocations
    fff24a9c116d2 x86/umip: Fix decoding of register forms of 0F 01 (SGDT and SIDT aliases)
    46a986888a149 x86/umip: Check that the instruction opcode is at least two bytes
    eaa16de419692 spi: cadence-quadspi: Flush posted register writes before DAC access
    5a6c760bc332f spi: cadence-quadspi: Flush posted register writes before INDAC access
    f104a67b28053 PCI: tegra194: Fix broken tegra_pcie_ep_raise_msi_irq()
    870457e7b7229 PCI: keystone: Use devm_request_irq() to free "ks-pcie-error-irq" on exit
    5533169bb2539 PCI/AER: Support errors introduced by PCIe r6.0
    09adece72b8c8 PCI/AER: Fix missing uevent on recovery when a reset is requested
    1f06b4864177b PCI/ERR: Fix uevent on failure to recover
    a645ca21de09e PCI/IOV: Add PCI rescan-remove locking when enabling/disabling SR-IOV
    690f307a81954 PCI/sysfs: Ensure devices are powered for config reads
    b167bfa432e3c rseq/selftests: Use weak symbol reference, not definition, to link with glibc
    aaaa92ab55f13 rtc: interface: Fix long-standing race when setting alarm
    fa1bdbefe1f46 rtc: interface: Ensure alarm irq is enabled when UIE is enabled
    c19b29291f21c memory: samsung: exynos-srom: Fix of_iomap leak in exynos_srom_probe
    e5caecea44a7a mmc: core: SPI mode remove cmd7
    e614975f9b5df mtd: rawnand: fsmc: Default to autodetect buswidth
    971009a25fb8b sparc: fix error handling in scan_one_device()
    365282fc60155 sparc64: fix hugetlb for sun4u
    1cd60e0d0fb8f sctp: Fix MAC comparison to be constant-time
    d906e61d4d81b scsi: hpsa: Fix potential memory leak in hpsa_big_passthru_ioctl()
    9ee5eb3d09217 pwm: berlin: Fix wrong register in suspend/resume
    40c86afc81b51 powerpc/pseries/msi: Fix potential underflow and leak issue
    7bb05500a3ad3 powerpc/powernv/pci: Fix underflow and leak issue
    aa18f55365e93 nvme-pci: Add TUXEDO IBS Gen8 to Samsung sleep quirk
    6195d15fe4888 parisc: don't reference obsolete termio struct for TC* constants
    ef84ddf89dab4 openat2: don't trigger automounts with RESOLVE_NO_XDEV
    c2b88b66bc359 lib/genalloc: fix device leak in of_gen_pool_get()
    4ce6902cc67d7 KEYS: trusted_tpm1: Compare HMAC values in constant time
    e94c99c026179 iommu/vt-d: PRS isn't usable if PDS isn't supported
    d202d1ac609bc iio: imu: inv_icm42600: Drop redundant pm_runtime reinitialization in resume
    3ed42a6686f4f init: handle bootloader identifier in kernel parameters
    06d81ce319242 iio: frequency: adf4350: Fix prescaler usage.
    0016356ebd6a3 iio: dac: ad5421: use int type to store negative error codes
    c71fd8dcb7ae6 iio: dac: ad5360: use int type to store negative error codes
    8df273ef0f5ad fs/ntfs3: Fix a resource leak bug in wnd_extend()
    459d819648fe6 crypto: atmel - Fix dma_unmap_sg() direction
    ad4e8f9bdbef1 cpufreq: intel_pstate: Fix object lifecycle issue in update_qos_request()
    83b594504d64f copy_sighand: Handle architectures where sizeof(unsigned long) < sizeof(u64)
    816bb8b4e5c46 bus: mhi: host: Do not use uninitialized 'dev' pointer in mhi_init_irq_setup()
    d3a9a8e1275eb btrfs: avoid potential out-of-bounds in btrfs_encode_fh()
    184b0aab791a5 drm/nouveau: fix bad ret code in nouveau_bo_move_prep
    a812fc67d8855 media: i2c: mt9v111: fix incorrect type for ret
    e57d98c02ec84 firmware: meson_sm: fix device leak at probe
    0c2ac5a03a209 xen/manage: Fix suspend error path
    6f8e37bff9119 xen/events: Cleanup find_virq() return codes
    846f911295b2a ARM: OMAP2+: pm33xx-core: ix device node reference leaks in amx3_idle_init
    267801317911b arm64: dts: qcom: msm8916: Add missing MDSS reset
    3a0f197dd8e5f ACPI: debug: fix signedness issues in read/write helpers
    85580cbac5d4b ACPI: TAD: Add missing sysfs_remove_group() for ACPI_TAD_RT
    e28616ca3d67e bpf: Avoid RCU context warning when unpinning htab with internal structs
    28112b3d86b15 gpio: wcd934x: mark the GPIO controller as sleeping
    512aa949666ef gpio: wcd934x: Remove duplicate assignment of of_gpio_n_cells
    33e49de5dc09b tpm_tis: Fix incorrect arguments in tpm_tis_probe_irq_single
    df58651968f82 crypto: essiv - Check ssize for decryption and in-place encryption
    4331a0ba2d15c bridge: br_vlan_fill_forward_path_pvid: use br_vlan_group_rcu()
    fa391f17a819f drm/amd/display: Properly disable scaling on DCE6
    cc857ceb2b3b4 drm/amd/display: Properly clear SCL_*_FILTER_CONTROL on DCE6
    736153f3c4933 drm/amd/display: Add missing DCE6 SCL_HORZ_FILTER_INIT* SRIs
    32ee65934d6b7 drm/amdgpu: Add additional DCE6 SCL registers
    057764172fcc6 bpf: Fix metadata_dst leak __bpf_redirect_neigh_v{4,6}
    b2986d63303d3 mailbox: zynqmp-ipi: Remove dev.parent check in zynqmp_ipi_free_mboxes
    e3602ddfcc2f9 mailbox: zynqmp-ipi: Remove redundant mbox_controller_unregister() call
    325425b0d066f tools build: Align warning options with perf
    b1d073728ef60 net: fsl_pq_mdio: Fix device node reference leak in fsl_pq_mdio_probe
    eb85ad5f23268 tcp: Don't call reqsk_fastopen_remove() in tcp_conn_request().
    dbceedc0213e7 net/sctp: fix a null dereference in sctp_disposition sctp_sf_do_5_1D_ce()
    4c918f9d1cccc drm/vmwgfx: Fix Use-after-free in validation
    fb5df8006adde drm/vmwgfx: Copy DRM hash-table code into driver
    4139b1e435e3f s390/cio: unregister the subchannel while purging
    2dbf27f672c03 net/mlx4: prevent potential use after free in mlx4_en_do_uc_filter()
    6ba7e73cafd15 scsi: mvsas: Fix use-after-free bugs in mvs_work_queue
    c1f8a7e6efe58 scsi: mvsas: Use sas_task_find_rq() for tagging
    77798c6e94fd2 scsi: mvsas: Delete mvs_tag_init()
    43c3e8ce2f5f0 scsi: libsas: Add sas_task_find_rq()
    9ecd496233772 cpufreq: tegra186: Set target frequency for all cpus in policy
    bb78ef6dc7470 clk: nxp: Fix pll0 rate check condition in LPC18xx CGU driver
    7d9eee92ed67a clk: nxp: lpc18xx-cgu: convert from round_rate() to determine_rate()
    b7e5c59f3b097 perf test: Don't leak workload gopipe in PERF_RECORD_*
    24e296d087f7d perf session: Fix handling when buffer exceeds 2 GiB
    3e97394445a0f rtc: x1205: Fix Xicor X1205 vendor prefix
    8dac32c17b01c perf util: Fix compression checks returning -1 as bool
    250cd976bbda0 clk: at91: peripheral: fix return value
    fcb3b7c30486d libperf event: Ensure tracing data is multiple of 8 sized
    1450bbb0ccd7f perf evsel: Avoid container_of on a NULL leader
    2977f02ee25a1 iio: frequency: adf4350: Fix ADF4350_REG3_12BIT_CLKDIV_MODE
    86e23d78ec177 clocksource/drivers/clps711x: Fix resource leaks in error paths
    ed43bf13a6ac8 fs: always return zero on success from replace_fd()
    70322caf9f193 usb: cdns3: cdnsp-pci: remove redundant pci_disable_device() call
    8a4dd74fe413d bus: fsl-mc: Check return value of platform_get_resource()
    d77ef2f621cd1 pinctrl: check the return value of pinmux_ops::get_function_name()
    e63aade22a33e Input: uinput - zero-initialize uinput_ff_upload_compat to avoid info leak
    9eed157e5e27f Input: atmel_mxt_ts - allow reset GPIO to sleep
    972cbba5cd384 nvdimm: ndtest: Return -ENOMEM if devm_kcalloc() fails in ndtest_probe()
    547e123e9d342 mm: hugetlb: avoid soft lockup when mprotect to large memory area
    26b1bfbd84172 ext4: fix checks for orphan inodes
    3901ae3c75a11 mfd: vexpress-sysreg: Check the return value of devm_gpiochip_add_data()
    8fcc7315a10a8 net: nfc: nci: Add parameter validation for packet data
    1d1847812a1a5 fs: udf: fix OOB read in lengthAllocDescs handling
    a44f61f878f32 uio_hv_generic: Let userspace take care of interrupt mask
    61d38b5ce2782 Squashfs: fix uninit-value in squashfs_get_parent
    21c58835634df Revert "net/mlx5e: Update and set Xon/Xoff upon MTU set"
    5aa9b88560281 net: dlink: handle copy_thresh allocation failure
    7973555560eb0 net: ena: return 0 in ena_get_rxfh_key_size() when RSS hash key is not configurable
    3fa52104e4797 nfp: fix RSS hash key size when RSS is not supported
    0eddc0e5aebcc drivers/base/node: fix double free in register_one_node()
    827c8efa0d1af ocfs2: fix double free in user_cluster_connect()
    d76b099011fa0 hwrng: ks-sa - fix division by zero in ks_sa_rng_init
    eb682b765533d Bluetooth: MGMT: Fix not exposing debug UUID on MGMT_OP_READ_EXP_FEATURES_INFO
    54f8ef1a970a8 net: usb: Remove disruptive netif_wake_queue in rtl8150_set_multicast
    5c06bc0b44ed8 RDMA/siw: Always report immediate post SQ errors
    8f67d2506f0ca usb: vhci-hcd: Prevent suspending virtually attached devices
    a89253eb4e648 scsi: mpt3sas: Fix crash in transport port remove by using ioc_info()
    1d79471414d7b ipvs: Defer ip_vs_ftp unregister during netns cleanup
    eb5da8e9db25a NFSv4.1: fix backchannel max_resp_sz verification check
    cef047e0a55cb coresight: trbe: Return NULL pointer for allocation failures
    0e9ec3bab4622 remoteproc: qcom: q6v5: Avoid disabling handover IRQ twice
    58ce0b1bc2711 sparc: fix accurate exception reporting in copy_{from,to}_user for M7
    b43c208c40179 sparc: fix accurate exception reporting in copy_to_user for Niagara 4
    37547d8e6eba8 sparc: fix accurate exception reporting in copy_{from_to}_user for Niagara
    1857cdca12c4a sparc: fix accurate exception reporting in copy_{from_to}_user for UltraSPARC III
    59424dc0d0e04 sparc: fix accurate exception reporting in copy_{from_to}_user for UltraSPARC
    4acb786042da4 wifi: ath10k: avoid unnecessary wait for service ready message
    c6d3da43b8540 Documentation: trace: historgram-design: Separate sched_waking histogram section heading and the following diagram
    c15829a1fb0b0 IB/sa: Fix sa_local_svc_timeout_ms read race
    d77fb0bdce411 RDMA/core: Resolve MAC of next-hop device without ARP support
    77edaeb4dde29 Revert "usb: xhci: Avoid Stop Endpoint retry loop if the endpoint seems Running"
    523d184a495be scsi: qla2xxx: Fix incorrect sign of error code in START_SP_W_RETRIES()
    ce75dfd1748e7 scsi: qla2xxx: edif: Fix incorrect sign of error code
    54ded576045ef ACPI: NFIT: Fix incorrect ndr_desc being reportedin dev_err message
    248776651cef4 wifi: mt76: fix potential memory leak in mt76_wmac_probe()
    795c8dbc82827 RDMA/cm: Rate limit destroy CM ID timeout error message
    1bdb3bc5bfd33 drivers/base/node: handle error properly in register_one_node()
    eeeaa4b5a5f52 watchdog: mpc8xxx_wdt: Reload the watchdog timer when enabling the watchdog
    6a9c2fcf6de54 netfilter: ipset: Remove unused htable_bits in macro ahash_region
    581ba44117ed7 iio: consumers: Fix offset handling in iio_convert_raw_to_processed()
    f6b36cfd25cba fs: ntfs3: Fix integer overflow in run_unpack()
    95e29db33b5f7 ASoC: Intel: bytcr_rt5651: Fix invalid quirk input mapping
    dea9c8c9028c9 ASoC: Intel: bytcr_rt5640: Fix invalid quirk input mapping
    fbd79072f1cab ASoC: Intel: bytcht_es8316: Fix invalid quirk input mapping
    125527db41805 pps: fix warning in pps_register_cdev when register device fail
    f77e91b4283b5 misc: genwqe: Fix incorrect cmd field being reported in error
    c2024c8abd742 usb: gadget: configfs: Correctly set use_os_string at bind
    fe9fdc066c8cf usb: phy: twl6030: Fix incorrect type for ret
    650368aacbc78 drm/amdkfd: Fix error code sign for EINVAL in svm_ioctl()
    82448110ee625 tcp: fix __tcp_close() to only send RST when required
    14ebe743b9647 PCI: tegra: Fix devm_kcalloc() argument order for port->phys allocation
    94aa9bf2ddfcb wifi: mwifiex: send world regulatory domain to driver
    8b3589d7a763a drm/amdgpu: Power up UVD 3 for FW validation (v2)
    e00d07d780b3d ALSA: lx_core: use int type to store negative error codes
    39d0e7fd73efb media: rj54n1cb0c: Fix memleak in rj54n1_probe()
    916c7891b59b9 scsi: myrs: Fix dma_alloc_coherent() error check
    eef5ef400893f scsi: pm80xx: Fix array-index-out-of-of-bounds on rmmod
    e0e0ce06f3571 usb: host: max3421-hcd: Fix error pointer dereference in probe cleanup
    2cd9c97ad5529 drm/radeon/r600_cs: clean up of dead code in r600_cs
    666da97c49c2d i2c: designware: Add disabling clocks when probe fails
    90fb83f7863b6 i2c: mediatek: fix potential incorrect use of I2C_MASTER_WRRD
    31660d4d93057 thermal/drivers/qcom/lmh: Add missing IRQ includes
    32240232b2a3b thermal/drivers/qcom: Make LMH select QCOM_SCM
    ae7b1443f4746 tools/nolibc: make time_t robust if __kernel_old_time_t is missing in host headers
    0b515a2839980 smp: Fix up and expand the smp_call_function_many() kerneldoc
    6d8b1a21fd5c3 bpf: Explicitly check accesses to bpf_sock_addr
    e822f368f758a selftests: watchdog: skip ping loop if WDIOF_KEEPALIVEPING not supported
    7ac8f7a186451 i3c: master: svc: Recycle unused IBI slot
    11269c08013f4 nvmet-fc: move lsop put work to nvmet_fc_ls_req_op
    ebf97395b0a0b pwm: tiehrpwm: Fix corner case in clock divisor calculation
    cc2b2a8c18a96 arm64: dts: mediatek: mt8516-pumpkin: Fix machine compatible
    3c8ceb2d4dbdb firmware: firmware: meson-sm: fix compile-test default
    5cfaadc902249 pinctrl: renesas: Use int type to store negative error codes
    45052d922054c PM: sleep: core: Clear power.must_resume in noirq suspend error path
    22863772e94fd block: use int to store blk_stack_limits() return value
    a04120b2d187b regulator: scmi: Use int type to store negative error codes
    2927ef93169a0 ARM: at91: pm: fix MCKx restore routine
    4b97e99b87a77 blk-mq: check kobject state_in_sysfs before deleting in blk_mq_unregister_hctx
    29db98243205b pinctrl: meson-gxl: add missing i2c_d pinmux
    8b063076fa7e1 soc: qcom: rpmh-rsc: Unconditionally clear _TRIGGER bit for TCS
    1955c776a6077 ACPI: processor: idle: Fix memory leak when register cpuidle device failed
    ce780f740cf44 cpufreq: scmi: Account for malformed DT in scmi_dev_used_by_cpus()
    3a502b0eefcfc libbpf: Fix reuse of DEVMAP
    c6552fac71990 regmap: Remove superfluous check for !config in __regmap_init()
    64f14b1ab6f39 x86/vdso: Fix output operand size of RDPID
    5d01f2b815682 perf: arm_spe: Prevent overflow in PERF_IDX2OFF()
    90ea4c0484ebb coresight: trbe: Prevent overflow in PERF_IDX2OFF()
    0ddd59d58b597 selftests: arm64: Check fread return value in exec_target
    cf038b6bb9ed5 filelock: add FL_RECLAIM to show_fl_flags() macro
    c1db864270eb7 net/9p: fix double req put in p9_fd_cancelled
    3fe58fa612052 minmax: add in_range() macro
    bd903c25b652c crypto: rng - Ensure set_ent is always present
    46263a0b687a0 platform/x86: int3472: Check for adev == NULL
    823671bb8b05d driver core/PM: Set power.no_callbacks along with power.no_pm
    53dab62cda6e7 staging: axis-fifo: flush RX FIFO on read errors
    82e0bb28a060c staging: axis-fifo: fix maximum TX packet length check
    e18cfcb828ed2 serial: stm32: allow selecting console when the driver is module
    48685b39f2fed hid: fix I2C read buffer overflow in raw_event() for mcp2221
    c094712e40488 perf subcmd: avoid crash in exclude_cmds when excludes is empty
    0eb762f420b25 dm-integrity: limit MAX_TAG_SIZE to 255
    8ed134c2520d7 wifi: rtlwifi: rtl8192cu: Don't claim USB ID 07b8:8188
    6c7c5b465a7b8 USB: serial: option: add SIMCom 8230C compositions
    663faf1179db9 media: i2c: tc358743: Fix use-after-free bugs caused by orphan timer in probe
    3f876cd47ed8b media: tuner: xc5000: Fix use-after-free in xc5000_release
    3fdeb807b93d0 media: tunner: xc5000: Refactor firmware load
    c3ad8c30b6b10 udp: Fix memory accounting leak.
    20fc1431bcdf4 KVM: arm64: Fix softirq masking in FPSIMD register saving sequence
    71c52b073922d media: rc: fix races with imon_disconnect()
    120e221b4bbe9 media: b2c2: Fix use-after-free causing by irq_check_work in flexcop_pci_remove
    ddc79fba132b8 scsi: target: target_core_configfs: Add length check to avoid buffer overflow
    9407809b44dc6 iommu/amd: Add map/unmap_pages() iommu_domain_ops callback support

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index a79d3b1511d..7d55e175146 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "259f7f9d0bd0df2c3e497395568a655c5745b5ac"
-SRCREV_meta ?= "578937826ffad97749eba3a5d1b21b37b5cd7bdc"
+SRCREV_machine ?= "f54e8af7284d39e9129452ac12c6a78511333335"
+SRCREV_meta ?= "1bfe6bf1a07dbce00c9a7b4ab051014a26a799a8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.194"
+LINUX_VERSION ?= "5.15.195"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index e2e56ec010f..896b512dac1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.194"
+LINUX_VERSION ?= "5.15.195"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "57960f78280a75ea48270a3984ac01bd06078b88"
-SRCREV_meta ?= "578937826ffad97749eba3a5d1b21b37b5cd7bdc"
+SRCREV_machine ?= "9ce0ec0c426ae703dbce0bbc4d56b919bea21e10"
+SRCREV_meta ?= "1bfe6bf1a07dbce00c9a7b4ab051014a26a799a8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index bbdf94746d3..b2adfd3544d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "7b19f872b07703f73c494baa81cd7e984db01336"
-SRCREV_machine:qemuarm64 ?= "431a37a229ce5be7b6ba116dc7bd282be4a745fa"
-SRCREV_machine:qemumips ?= "9404d4015b457e7324d5675d3e14f46d84cd8c40"
-SRCREV_machine:qemuppc ?= "bfd132d4b358cdb5260fccc71eb1e5a09daae033"
-SRCREV_machine:qemuriscv64 ?= "5df8e23ccadd62ab9945320b6b4327b082870c61"
-SRCREV_machine:qemuriscv32 ?= "5df8e23ccadd62ab9945320b6b4327b082870c61"
-SRCREV_machine:qemux86 ?= "5df8e23ccadd62ab9945320b6b4327b082870c61"
-SRCREV_machine:qemux86-64 ?= "5df8e23ccadd62ab9945320b6b4327b082870c61"
-SRCREV_machine:qemumips64 ?= "ed52c5eccf0cc2b0da2dd7d13d012c50db78a62a"
-SRCREV_machine ?= "5df8e23ccadd62ab9945320b6b4327b082870c61"
-SRCREV_meta ?= "578937826ffad97749eba3a5d1b21b37b5cd7bdc"
+SRCREV_machine:qemuarm ?= "5200e910cb4a700023e548693aacdd166b008f8b"
+SRCREV_machine:qemuarm64 ?= "2a69501b11075d6c4e6cab2e05fc04f61a8991cd"
+SRCREV_machine:qemumips ?= "6e318293304f232aa650d41bbc6ae7ad40c03fa5"
+SRCREV_machine:qemuppc ?= "c861e5a8012080cc03be9725dd996e0d68f4e93b"
+SRCREV_machine:qemuriscv64 ?= "8f21ac8bce967e4ae9afbe4c66f8fbc11982c59e"
+SRCREV_machine:qemuriscv32 ?= "8f21ac8bce967e4ae9afbe4c66f8fbc11982c59e"
+SRCREV_machine:qemux86 ?= "8f21ac8bce967e4ae9afbe4c66f8fbc11982c59e"
+SRCREV_machine:qemux86-64 ?= "8f21ac8bce967e4ae9afbe4c66f8fbc11982c59e"
+SRCREV_machine:qemumips64 ?= "d3a7bcb9d74f245de665994e3c9d8a35e42351de"
+SRCREV_machine ?= "8f21ac8bce967e4ae9afbe4c66f8fbc11982c59e"
+SRCREV_meta ?= "1bfe6bf1a07dbce00c9a7b4ab051014a26a799a8"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "29e53a5b1c4f144301ee36a907e8b03d7733f0b0"
+SRCREV_machine:class-devupstream ?= "ac56c046adf41fdb64ddda46fd66090f21dc381a"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.194"
+LINUX_VERSION ?= "5.15.195"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"

