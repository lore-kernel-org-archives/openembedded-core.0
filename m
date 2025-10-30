Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDAB8CCFA02
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 17:12:48 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.3241.1761844362310803342
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 10:12:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NOUkv1AU;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-89ead335934so129821285a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 10:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761844361; x=1762449161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wOfkSVWzoqukT8bAzkkZq0OMK2KWWRZlmbsLsHOhyQ0=;
        b=NOUkv1AUyOfovcfDp7ua/tQuGf7JizDGlvb+S78shjYM7GbIHXLWa1LTgZIEdqcRsh
         yz7eA9q3pJ/Gr/3qZnEn8qESfZvRJgf6rX5/xoZCq6Z1Mplg5tYZH8IEKiwOfnPQ4Lm4
         bDxk4OMZY3TR3kgWOFT/x4zB1sL/LhoMA0ls8YZczBIE1nk5ywbUKlUYeyJr+Zb4XEIM
         DY/Sbr11CjxJWfaeVfFaVMNlngyos6dLee/267kklzC5vIqz1vm9DDeV818RPz/9fLrZ
         IncJS+G0bJ5DoZcHLz4t9qQxILtEiMPko2LqwdCoJYFAAW/XF9JSIV65iqtpAkvGgx6M
         8Irw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761844361; x=1762449161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wOfkSVWzoqukT8bAzkkZq0OMK2KWWRZlmbsLsHOhyQ0=;
        b=FZp5j1B4bpJ1hMmaO/xl6hE2opRuxzL2YmZmDcmLYxHHYO5A3GBBaDbj7PH2PlvOQc
         NPcqbOZWufdguDVSwDHNF3ncXLAWgli2rSHU9F7OCKRlA7QVGq4QIossfo9F5l3Lbhbz
         RL75RMiz7T7c/tPkk09mB+tMROC/UkyewxH2HteNfBrQXR3fJim1i1n/zlNXgRl5ax5d
         TY6DRZ/eB3RUL/UJHdS5FRrTpOt1UUxXElXLZIRcLMAy90yUHh42/pLTkVZHzmWRXgFg
         jyWQO1Xhln6/kbSHCuhGLc/HBDyOoapXL0lUcgUEBUGhpdygWenfCMYDwbmNxfzL7NVr
         6PvQ==
X-Gm-Message-State: AOJu0YxLkPdTPwQcXbPyh5RG6OUi1Sn8/ymsQdmYAxl8yEZnb5ZQ0jNu
	GvU8dKogBUbI8Q9th8ViDVq2eZqvMvtaTuEIZYJ5rOVq2XjTkfz0Jk7V8ZC9djNuOgM=
X-Gm-Gg: ASbGnctFQ/oFbdPKNETUCgownNcKByIjGPv2EgZD4OS2s8j8QMZqkHaoGkAlbAuTZ1p
	3/uadd72IkgXBXzl1vsnk14qmvHDgBehtInYw9qlmtXAiCwrKRUt9EkCHDj3YtdD+CCTwYtnToi
	CXzQumtg5G8UQ+itOBTeElsK0b5fi4EAbIulXUax6/ScJ73Bbcf1EQItJi7uJ18xCMdDRCUqYDX
	YUAOFFomxXaWdOFoS9GylwWZbt4pfm1qx5bFrJvjxicuBjDHSnF3TGyAs0j5QmAMviKlTiwxuqP
	k+Xt2Tk0rBo6uF7aOlk6iunzqrc3a/FC/Gz7yJVOVdCArBrAS47jH2LJvD64CpV18d1R6sFSLdJ
	5CmSO6/lauuA6ZFBqNckySBDlFbjW380x6tezQwRFAF9uV00FxtWBlKb+85XrV4GZPb6LgPKxyu
	DVt5dKulXWBySMavZCr+WXXtgOYaU+SGiIMqOD7NGMpbYup64Nib0OB7Hc3gKdPxyA9oIz2aHMg
	Tr80zTjq69JlYE=
X-Google-Smtp-Source: AGHT+IGGpHY3ioGKHn8+3Sv0GLP78M0o9u+TO1x/+AUO9JeWEsjTDTGszgvfNugkqABXZWglZllwAg==
X-Received: by 2002:a05:620a:450f:b0:89d:547a:e7aa with SMTP id af79cd13be357-8ab990b07femr31096085a.7.1761844360841;
        Thu, 30 Oct 2025 10:12:40 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f254ab74fsm1279296385a.32.2025.10.30.10.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 10:12:40 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/14] linux-yocto/6.12: update to v6.12.53
Date: Thu, 30 Oct 2025 13:12:21 -0400
Message-Id: <724d3b77b77a9e9b78e59c5d9cd572a137dd3407.1761844161.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1761844161.git.bruce.ashfield@gmail.com>
References: <cover.1761844161.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 17:12:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225510

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    fcd03f7736b1 Linux 6.12.53
    9895463ba68a usb: cdns3: cdnsp-pci: remove redundant pci_disable_device() call
    cde10a9473b0 arm64: dts: qcom: qcm2290: Disable USB SS bus instances in park mode
    0e6a67e542f2 usb: typec: tipd: Clear interrupts first
    1534517300e1 net: usb: asix: hold PM usage ref to avoid PM/MDIO + RTNL deadlock
    0da18d49f874 net/9p: Fix buffer overflow in USB transport layer
    84ec0482ed9c bus: fsl-mc: Check return value of platform_get_resource()
    688c688e0bf5 pinctrl: check the return value of pinmux_ops::get_function_name()
    9338093db954 tee: fix register_shm_helper()
    c9b6d789591f remoteproc: pru: Fix potential NULL pointer dereference in pru_rproc_set_ctable()
    affc03d44921 sunrpc: fix null pointer dereference on zero-length checksum
    48c96b7e9e03 Input: uinput - zero-initialize uinput_ff_upload_compat to avoid info leak
    2c988e1f9df0 Input: atmel_mxt_ts - allow reset GPIO to sleep
    802359a52676 misc: fastrpc: Skip reference for DMA handles
    78d33a041555 misc: fastrpc: fix possible map leak in fastrpc_put_args
    6e0928a8988e misc: fastrpc: Fix fastrpc_map_lookup operation
    35216e41b42f misc: fastrpc: Save actual DMA size in fastrpc_map structure
    e4a1e3e88160 nvdimm: ndtest: Return -ENOMEM if devm_kcalloc() fails in ndtest_probe()
    4975c975ed94 mm: hugetlb: avoid soft lockup when mprotect to large memory area
    b1deb39cfd61 fbdev: simplefb: Fix use after free in simplefb_detach_genpds()
    f994e9c790ce KVM: SVM: Skip fastpath emulation on VM-Exit if next RIP isn't valid
    f50bece98c66 ext4: fix checks for orphan inodes
    8173dcfafe11 ksmbd: add max ip connections parameter
    b613671dc185 ksmbd: fix error code overwriting in smb2_get_info_filesystem()
    5cc679ba0f45 ksmbd: Fix race condition in RPC handle list access
    987f2bd63ace LoongArch: Automatically disable kaslr if boot from kexec_file
    19ca45286669 dm: fix NULL pointer dereference in __dm_suspend()
    e258ecf0c2a8 dm: fix queue start/stop imbalance under suspend/load/resume races
    5fa9211e36ea mfd: vexpress-sysreg: Check the return value of devm_gpiochip_add_data()
    0f8b2839b8ce mfd: rz-mtu3: Fix MTU5 NFCR register offset
    74837bca0748 net: nfc: nci: Add parameter validation for packet data
    b57f2d7d3e6b fs: udf: fix OOB read in lengthAllocDescs handling
    0aefa3a4a82b ASoC: codecs: wcd937x: make stub functions inline
    abcd537aae3b ASoC: codecs: wcd937x: set the comp soundwire port correctly
    2be09d893b9c ASoC: SOF: ipc3-topology: Fix multi-core and static pipelines tear down
    1e71e66e8599 ASoC: wcd934x: fix error handling in wcd934x_codec_parse_data()
    696ba6032081 io_uring/waitid: always prune wait queue entry in io_waitid_wait()
    37bd91f22794 uio_hv_generic: Let userspace take care of interrupt mask
    1b3ccd001913 Squashfs: fix uninit-value in squashfs_get_parent
    f45901e51774 tpm: Disable TPM2_TCG_HMAC by default
    5017c302ca4b bpf: Reject negative offsets for ALU ops
    baa37b1c7e29 vhost: vringh: Modify the return value check
    bc5037cafdf5 Revert "net/mlx5e: Update and set Xon/Xoff upon MTU set"
    7a8a8c15468f smb: client: fix crypto buffers in non-linear memory
    52dc9ab65974 net/mlx5: fw reset, add reset timeout work
    91e3b06341d7 net/mlx5: pagealloc: Fix reclaim race during command interface teardown
    a0f5a82cea74 net/mlx5: Stop polling for command response if interface goes down
    7ed5010fef09 net: dlink: handle copy_thresh allocation failure
    778abdf3a511 net: ena: return 0 in ena_get_rxfh_key_size() when RSS hash key is not configurable
    f6ac534b783f nfp: fix RSS hash key size when RSS is not supported
    43a6a33449dd idpf: fix mismatched free function for dma_alloc_coherent
    373d18f55238 PCI: j721e: Fix incorrect error message in probe()
    61202d3520bc mtd: rawnand: atmel: Fix error handling path in atmel_nand_controller_add_nands
    df001482396f drivers/base/node: fix double free in register_one_node()
    694d5b401036 ocfs2: fix double free in user_cluster_connect()
    2b6bcce32cb5 hwrng: ks-sa - fix division by zero in ks_sa_rng_init
    bd117f729d62 KEYS: X.509: Fix Basic Constraints CA flag parsing
    fe66d9a92752 Bluetooth: hci_sync: Fix using random address for BIG/PA advertisements
    63a391691e97 Bluetooth: ISO: don't leak skb in ISO_CONT RX
    cd4d126706d0 Bluetooth: ISO: free rx_skb if not consumed
    80689777919f Bluetooth: ISO: Fix possible UAF on iso_conn_free
    9a331a8d7ce5 Bluetooth: MGMT: Fix not exposing debug UUID on MGMT_OP_READ_EXP_FEATURES_INFO
    b3a950d236e9 vhost: vringh: Fix copy_to_iter return value check
    8dd446056336 ptp: Add a upper bound on max_vclocks
    6053e47bbf21 net: usb: Remove disruptive netif_wake_queue in rtl8150_set_multicast
    745367d04c02 RDMA/siw: Always report immediate post SQ errors
    ebe16d245a00 iommu/vt-d: Disallow dirty tracking if incoherent page walk
    ec853bd88533 PCI: rcar-gen4: Fix inverted break condition in PHY initialization
    6eaea5dfd546 PCI: rcar-gen4: Assure reset occurs before DBI access
    efa275174aab PCI: rcar-gen4: Add missing 1ms delay after PWR reset assertion
    94a84eacca81 usb: vhci-hcd: Prevent suspending virtually attached devices
    1fd39e14d47d scsi: mpt3sas: Fix crash in transport port remove by using ioc_info()
    78e7653ded44 netfilter: nfnetlink: reset nlh pointer during batch replay
    dc1a481359a7 ipvs: Defer ip_vs_ftp unregister during netns cleanup
    35b11653da50 NFSv4.1: fix backchannel max_resp_sz verification check
    8c4e7e646d5d coresight: Fix incorrect handling for return value of devm_kzalloc
    af8286832855 coresight: tpda: fix the logic to setup the element size
    296da7849463 coresight: trbe: Return NULL pointer for allocation failures
    e7c195695b75 coresight: etm4x: Support atclk
    46915cabba69 coresight: catu: Support atclk
    670bdf9eacd9 coresight: tmc: Support atclk
    a1b2c8b7af21 coresight-etm4x: Conditionally access register TRCEXTINSELR
    ad58a89bb5da dm vdo: return error on corrupted metadata in start_restoring_volume functions
    526859e41db8 remoteproc: qcom: q6v5: Avoid disabling handover IRQ twice
    0b22cf23d26d PCI: tegra194: Fix duplicate PLL disable in pex_ep_event_pex_rst_assert()
    8055133a9f64 wifi: rtw89: avoid circular locking dependency in ser_state_run()
    52edccfb5551 RDMA/rxe: Fix race in do_task() when draining
    a87a21a56244 crypto: hisilicon/qm - set NULL to qm->debug.qm_diff_regs
    81b43dd85c52 vfio/pds: replace bitmap_free with vfree
    c31cb4df701b sparc: fix accurate exception reporting in copy_{from,to}_user for M7
    5d8857c43bf1 sparc: fix accurate exception reporting in copy_to_user for Niagara 4
    a90ce516a73d sparc: fix accurate exception reporting in copy_{from_to}_user for Niagara
    5ef9c94d7110 sparc: fix accurate exception reporting in copy_{from_to}_user for UltraSPARC III
    7de3a75bbc84 sparc: fix accurate exception reporting in copy_{from_to}_user for UltraSPARC
    aea038062edf ASoC: Intel: sof_sdw: Prevent jump to NULL add_sidecar callback
    1c873416758f wifi: mac80211: fix Rx packet handling when pubsta information is not available
    d8cf7b59c49f iommu/vt-d: debugfs: Fix legacy mode page table dump logic
    6e7d9fa61d7d wifi: ath10k: avoid unnecessary wait for service ready message
    8d4f6ab4c53e wifi: ath12k: fix wrong logging ID used for CE
    bf4ced5cfa24 Documentation: trace: historgram-design: Separate sched_waking histogram section heading and the following diagram
    e69c550557b9 IB/sa: Fix sa_local_svc_timeout_ms read race
    5f4abda482b9 RDMA/core: Resolve MAC of next-hop device without ARP support
    11559d14ed95 Revert "usb: xhci: Avoid Stop Endpoint retry loop if the endpoint seems Running"
    8ec4fa035c08 f2fs: fix zero-sized extent for precache extents
    5b1c071d5e9f HID: hidraw: tighten ioctl command parsing
    582e82905d97 scsi: qla2xxx: Fix incorrect sign of error code in qla_nvme_xmt_ls_rsp()
    5726fbabdcf6 scsi: qla2xxx: Fix incorrect sign of error code in START_SP_W_RETRIES()
    87c5ec3e3089 scsi: qla2xxx: edif: Fix incorrect sign of error code
    0846bce8f307 ACPI: NFIT: Fix incorrect ndr_desc being reportedin dev_err message
    63ee96c7f47d ALSA: pcm: Disable bottom softirqs as part of spin_lock_irq() on PREEMPT_RT
    d6b19dacc094 f2fs: fix to mitigate overhead of f2fs_zero_post_eof_page()
    a7b7ebdd7045 f2fs: fix to truncate first page in error path of f2fs_truncate()
    f9bd59d1600f f2fs: fix to update map->m_next_extent correctly in f2fs_map_blocks()
    fc00890c55e3 wifi: mt76: mt7915: fix mt7981 pre-calibration
    e18c4e6ba36c wifi: mt76: mt7996: Convert mt7996_wed_rro_addr to LE
    f481404a9826 wifi: mt76: mt7996: Fix RX packets configuration for primary WED device
    57519239c76c wifi: mt76: fix potential memory leak in mt76_wmac_probe()
    04eb384c1233 RDMA/cm: Rate limit destroy CM ID timeout error message
    101bb4cd083a drivers/base/node: handle error properly in register_one_node()
    80c9011ed8fe watchdog: mpc8xxx_wdt: Reload the watchdog timer when enabling the watchdog
    c500963f6a0a ipvs: Use READ_ONCE/WRITE_ONCE for ipvs->enable
    c2086d1ef3d2 netfilter: ipset: Remove unused htable_bits in macro ahash_region
    e2ed57019832 iio: consumers: Fix offset handling in iio_convert_raw_to_processed()
    5be3c7479b99 iio: consumers: Fix handling of negative channel scale in iio_convert_raw_to_processed()
    be66551da203 fs/ntfs3: reject index allocation if $BITMAP is empty but blocks exist
    9378cfe228c2 fs: ntfs3: Fix integer overflow in run_unpack()
    1627a50c8566 drm/msm/dpu: fix incorrect type for ret
    fdf99978a648 ASoC: Intel: bytcr_rt5651: Fix invalid quirk input mapping
    5c03ea2ef4eb ASoC: Intel: bytcr_rt5640: Fix invalid quirk input mapping
    d941f5f9612f ASoC: Intel: bytcht_es8316: Fix invalid quirk input mapping
    209e5d4f5cb7 idpf: fix Rx descriptor ready check barrier in splitq
    27c8e2e4b56f wifi: iwlwifi: Remove redundant header files
    f01fa3588e0b pps: fix warning in pps_register_cdev when register device fail
    d5997900ef5f misc: genwqe: Fix incorrect cmd field being reported in error
    5416e89b81b0 tty: n_gsm: Don't block input queue by waiting MSC
    97f27d4a2b8d usb: gadget: configfs: Correctly set use_os_string at bind
    6dfcd6afa83a usb: phy: twl6030: Fix incorrect type for ret
    a3bc86d5cf70 drm/amdkfd: Fix error code sign for EINVAL in svm_ioctl()
    96a1e350dfed tcp: fix __tcp_close() to only send RST when required
    6207748e77f4 PCI: tegra: Fix devm_kcalloc() argument order for port->phys allocation
    605402433eb8 wifi: mwifiex: send world regulatory domain to driver
    0bb91bed82d4 drm/amd/pm: Disable SCLK switching on Oland with high pixel clocks (v3)
    08de17b64830 drm/amd/pm: Disable MCLK switching with non-DC at 120 Hz+ (v2)
    863cd8f56c8e drm/amd/pm: Treat zero vblank time as too short in si_dpm (v3)
    568f8545f88a drm/amd/pm: Adjust si_upload_smc_data register programming (v3)
    edfa71149429 drm/amd/pm: Fix si_upload_smc_data (v3)
    32710128d3fc drm/amd/pm: Disable ULV even if unsupported (v3)
    3f185e616fcf drm/amdgpu: Power up UVD 3 for FW validation (v2)
    2e5a94f26f37 coresight: Only register perf symlink for sinks with alloc_buffer
    50c3564cca61 inet: ping: check sock_net() in ping_get_port() and ping_lookup()
    8d2a4bc4f7f9 crypto: hisilicon/qm - check whether the input function and PF are on the same device
    a3540380971a crypto: hisilicon - re-enable address prefetch after device resuming
    749c611d680f crypto: hisilicon/zip - remove unnecessary validation for high-performance mode configurations
    2047ffc5c5d3 media: st-delta: avoid excessive stack usage
    ae60a599fd01 ALSA: lx_core: use int type to store negative error codes
    d91b39e21ca1 PCI/ACPI: Fix pci_acpi_preserve_config() memory leak
    98f51490906a RDMA/mlx5: Fix vport loopback forcing for MPV device
    bc63dab8a09b RDMA/mlx5: Better estimate max_qp_wr to reflect WQE count
    e7df90a8522f media: rj54n1cb0c: Fix memleak in rj54n1_probe()
    eacda650a9e8 crypto: octeontx2 - Call strscpy() with correct size argument
    f04335d2020d scsi: myrs: Fix dma_alloc_coherent() error check
    9326a1541e1b scsi: pm80xx: Fix array-index-out-of-of-bounds on rmmod
    39a59796775f hwrng: nomadik - add ARM_AMBA dependency
    353856179c39 crypto: keembay - Add missing check after sg_nents_for_len()
    3c3ee1026e88 drm/amd/display: Remove redundant semicolons
    2f2c75f8692c serial: max310x: Add error checking in probe()
    3c518d2df3ab usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through secure calls
    e68ea6de1d05 usb: host: max3421-hcd: Fix error pointer dereference in probe cleanup
    72c64fa2e474 phy: rockchip: naneng-combphy: Enable U3 OTG port for RK3568
    0ea9e0b0d594 media: zoran: Remove zoran_fh structure
    91fc36f23b30 drm/bridge: it6505: select REGMAP_I2C
    3db3e7d4f2d9 f2fs: fix condition in __allow_reserved_blocks()
    ebed78bfd6df drm/radeon/r600_cs: clean up of dead code in r600_cs
    93831b3914ae drm/panel: novatek-nt35560: Fix invalid return value
    f856c598080b bpf: Enforce expected_attach_type for tailcall compatibility
    9f57ad89c7c2 libbpf: Fix error when st-prefix_ops and ops from differ btf
    66da22768c80 i2c: designware: Add disabling clocks when probe fails
    7493b30cc650 i2c: designware: Fix clock issue when PM is disabled
    be5165760b28 i2c: mediatek: fix potential incorrect use of I2C_MASTER_WRRD
    7ac2241635b0 thermal/drivers/qcom/lmh: Add missing IRQ includes
    482f1b6f562f thermal/drivers/qcom: Make LMH select QCOM_SCM
    8862df27c4a2 hwmon: (mlxreg-fan) Separate methods of fan setting coming from different subsystems
    c8f9b7cd3b68 once: fix race by moving DO_ONCE to separate section
    bafb3f16bd46 bpf: Mark kfuncs as __noclone
    a9f10c9f72d3 spi: fix return code when spi device has too many chipselects
    d7a3eb593190 tools/nolibc: make time_t robust if __kernel_old_time_t is missing in host headers
    372a5b01da50 smp: Fix up and expand the smp_call_function_many() kerneldoc
    76e53c74f116 bpf, arm64: Call bpf_jit_binary_pack_finalize() in bpf_jit_free()
    fe9d33f04703 bpf: Explicitly check accesses to bpf_sock_addr
    48fa79b0c670 selftests: watchdog: skip ping loop if WDIOF_KEEPALIVEPING not supported
    630217db71de i3c: master: svc: Recycle unused IBI slot
    b20c7915b456 i3c: master: svc: Use manual response for IBI events
    7331925c247b nvmet-fc: move lsop put work to nvmet_fc_ls_req_op
    92751937f12a riscv, bpf: Sign extend struct ops return values properly
    f955ceecfca2 ACPICA: Fix largest possible resource descriptor index
    b38bcdba1107 pwm: tiehrpwm: Fix corner case in clock divisor calculation
    a048bb2d4f8f pwm: tiehrpwm: Fix various off-by-one errors in duty-cycle calculation
    6599fff32020 pwm: tiehrpwm: Make code comment in .free() more useful
    0a953be6e35c pwm: tiehrpwm: Don't drop runtime PM reference in .free()
    3eaac5621a43 arm64: dts: mediatek: mt8516-pumpkin: Fix machine compatible
    2ea7d448f92d arm64: dts: mediatek: mt8395-kontron-i1200: Fix MT6360 regulator nodes
    79bf4074d58e arm64: dts: mediatek: mt6795-xperia-m5: Fix mmc0 latch-ck value
    13f46cfa4958 mmc: core: Fix variable shadowing in mmc_route_rpmb_frames()
    ea225b121a55 arm64: dts: mediatek: mt6331: Fix pmic, regulators, rtc, keys node names
    8d35c417f8ab arm64: dts: mediatek: mt8186-tentacruel: Fix touchscreen model
    7dc3b7ac8ef7 cpuidle: qcom-spm: fix device and OF node leaks at probe
    06393f068196 soc: mediatek: mtk-svs: fix device leaks on mt8192 probe failure
    491ffa889e8d soc: mediatek: mtk-svs: fix device leaks on mt8183 probe failure
    1f2b0648ae18 firmware: firmware: meson-sm: fix compile-test default
    f7344709705c PM / devfreq: rockchip-dfi: double count on RK3588
    37ad11f20e16 nbd: restrict sockets to TCP and UDP
    d0498ecc60de arm64: dts: mediatek: mt8195: Remove suspend-breaking reset from pcie0
    bd4abf7c54a2 selftests: vDSO: vdso_test_abi: Correctly skip whole test with missing vDSO
    7bdde6f93870 selftests: vDSO: Fix -Wunitialized in powerpc VDSO_CALL() wrapper
    79eb7b3a385b null_blk: Fix the description of the cache_size module argument
    4efc41da15a9 pinctrl: renesas: Use int type to store negative error codes
    96eff71060f9 power: supply: cw2015: Fix a alignment coding style issue
    44e32104cf7e PM / devfreq: mtk-cci: Fix potential error pointer dereference in probe()
    b08f2e3bbbf2 ARM: dts: omap: am335x-cm-t335: Remove unused mcasp num-serializer property
    465891535f3e ARM: dts: ti: omap: omap3-devkit8000-lcd: Fix ti,keep-vref-on property to use correct boolean syntax in DTS
    1950e0189689 ARM: dts: ti: omap: am335x-baltos: Fix ti,en-ck32k-xtal property in DTS to use correct boolean syntax
    3a57944a483b vdso: Add struct __kernel_old_timeval forward declaration to gettime.h
    4e0043a5424f PM: sleep: core: Clear power.must_resume in noirq suspend error path
    60002c90f2f2 block: use int to store blk_stack_limits() return value
    7b7b864133ad leds: leds-lp55xx: Use correct address for memory programming
    8ef1bbcc40e5 selftests/nolibc: fix EXPECT_NZ macro
    8ffe812280c4 regulator: scmi: Use int type to store negative error codes
    0f43928b691e arm64: dts: apple: t8103-j457: Fix PCIe ethernet iommu-map
    84df283fd679 ARM: at91: pm: fix MCKx restore routine
    babc634e9fe2 blk-mq: check kobject state_in_sysfs before deleting in blk_mq_unregister_hctx
    1982e86cafd0 pinctrl: meson-gxl: add missing i2c_d pinmux
    11df3ff2b4d0 soc: qcom: rpmh-rsc: Unconditionally clear _TRIGGER bit for TCS
    31ff8aa00948 ACPI: processor: idle: Fix memory leak when register cpuidle device failed
    016219d54c90 arm64: dts: imx95: Correct the lpuart7 and lpuart8 srcid
    de6d30a091b7 arm64: dts: imx93-kontron: Fix USB port assignment
    1d25adb99ac0 arm64: dts: imx93-kontron: Fix GPIO for panel regulator
    29fb9633bf12 firmware: arm_scmi: Mark VirtIO ready before registering scmi_virtio_driver
    1a1f50bdd8de cpufreq: scmi: Account for malformed DT in scmi_dev_used_by_cpus()
    e1ce777fbcbd leds: flash: leds-qcom-flash: Update torch current clamp setting
    3d7c00633b83 ARM: dts: renesas: porter: Fix CAN pin group
    623542791a3f libbpf: Fix reuse of DEVMAP
    f059795ec6ea bpf: Remove migrate_disable in kprobe_multi_link_prog_run
    a5af34777e6e bpf/selftests: Fix test_tcpnotify_user
    e907b272e308 regmap: Remove superfluous check for !config in __regmap_init()
    aec49ec4bbf6 arm64: dts: renesas: rzg2lc-smarc: Disable CAN-FD channel0
    e1a5a3a8ab41 pinctrl: renesas: rzg2l: Fix invalid unsigned return in rzg3s_oen_read()
    d673f78da385 btrfs: return any hit error from extent_writepage_io()
    1c060a147670 lsm: CONFIG_LSM can depend on CONFIG_SECURITY
    d607e6b349b0 x86/vdso: Fix output operand size of RDPID
    1652f14cf3be EDAC/i10nm: Skip DIMM enumeration on a disabled memory controller
    180bb95b6908 smb: server: fix IRD/ORD negotiation with the client
    1a19ba8e1f4f perf: arm_spe: Prevent overflow in PERF_IDX2OFF()
    047ce5b3d78c coresight: trbe: Prevent overflow in PERF_IDX2OFF()
    8690cf593113 uprobes: uprobe_warn should use passed task
    26fa5088efca powerpc/603: Really copy kernel PGD entries into all PGDIRs
    554bb7c95eda powerpc/8xx: Remove left-over instruction and comments in DataStoreTLBMiss handler
    9495ba836d9b gfs2: Fix GLF_INVALIDATE_IN_PROGRESS flag clearing in do_xmote
    18cb2685358f selftests: arm64: Check fread return value in exec_target
    dadf1f4423e1 seccomp: Fix a race with WAIT_KILLABLE_RECV if the tracer replies too fast
    cb097bd6c8a4 init: INITRAMFS_PRESERVE_MTIME should depend on BLK_DEV_INITRD
    a13e07abed04 filelock: add FL_RECLAIM to show_fl_flags() macro

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index c6697e99b2..461cce76b5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6e15f26e4078d6d17c8f2dd66b6f3a8976bb5f10"
-SRCREV_meta ?= "350aec7b58ac8a244f7084334cd072cc2b39dfdc"
+SRCREV_machine ?= "2972edff35ce97bb8bab97dcd22063be41b244e0"
+SRCREV_meta ?= "85715aeb30d5d82a7886c148632e13dc4426c72d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.52"
+LINUX_VERSION ?= "6.12.53"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 2fe3f17451..b49161d29b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.52"
+LINUX_VERSION ?= "6.12.53"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "7ec0c63fa4a7870b6e16d255828f5a0ae4ec821b"
-SRCREV_meta ?= "350aec7b58ac8a244f7084334cd072cc2b39dfdc"
+SRCREV_machine ?= "9f0c7b00d414236127b4154087ba39c1a4df449c"
+SRCREV_meta ?= "85715aeb30d5d82a7886c148632e13dc4426c72d"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 84ae7c0360..f46e1c62e1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "172b9fbf63ccfdfbcbeca1a3c7ba5c34eb9f2dcd"
-SRCREV_machine:qemuarm64 ?= "7ec0c63fa4a7870b6e16d255828f5a0ae4ec821b"
-SRCREV_machine:qemuloongarch64 ?= "7ec0c63fa4a7870b6e16d255828f5a0ae4ec821b"
-SRCREV_machine:qemumips ?= "31d0ff8e1f91778a5f6eacd2c539384999becfc9"
-SRCREV_machine:qemuppc ?= "7ec0c63fa4a7870b6e16d255828f5a0ae4ec821b"
-SRCREV_machine:qemuriscv64 ?= "7ec0c63fa4a7870b6e16d255828f5a0ae4ec821b"
-SRCREV_machine:qemuriscv32 ?= "7ec0c63fa4a7870b6e16d255828f5a0ae4ec821b"
-SRCREV_machine:qemux86 ?= "7ec0c63fa4a7870b6e16d255828f5a0ae4ec821b"
-SRCREV_machine:qemux86-64 ?= "7ec0c63fa4a7870b6e16d255828f5a0ae4ec821b"
-SRCREV_machine:qemumips64 ?= "27af9a15a47958d29f1ab8740b1bc4b6d9ecf27e"
-SRCREV_machine ?= "7ec0c63fa4a7870b6e16d255828f5a0ae4ec821b"
-SRCREV_meta ?= "350aec7b58ac8a244f7084334cd072cc2b39dfdc"
+SRCREV_machine:qemuarm ?= "96644b39336f28f9e23ff945d805186def0b736c"
+SRCREV_machine:qemuarm64 ?= "9f0c7b00d414236127b4154087ba39c1a4df449c"
+SRCREV_machine:qemuloongarch64 ?= "9f0c7b00d414236127b4154087ba39c1a4df449c"
+SRCREV_machine:qemumips ?= "8154a9934a20b59ab134a9aa9984034528c5ec19"
+SRCREV_machine:qemuppc ?= "9f0c7b00d414236127b4154087ba39c1a4df449c"
+SRCREV_machine:qemuriscv64 ?= "9f0c7b00d414236127b4154087ba39c1a4df449c"
+SRCREV_machine:qemuriscv32 ?= "9f0c7b00d414236127b4154087ba39c1a4df449c"
+SRCREV_machine:qemux86 ?= "9f0c7b00d414236127b4154087ba39c1a4df449c"
+SRCREV_machine:qemux86-64 ?= "9f0c7b00d414236127b4154087ba39c1a4df449c"
+SRCREV_machine:qemumips64 ?= "c40f42f2b1038d88142804aac0dafbe106003b8d"
+SRCREV_machine ?= "9f0c7b00d414236127b4154087ba39c1a4df449c"
+SRCREV_meta ?= "85715aeb30d5d82a7886c148632e13dc4426c72d"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "a9152eb181adaac576e8ac1ab79989881e0f301b"
+SRCREV_machine:class-devupstream ?= "2b2cbdcede3878c424b7937c83660ec9e9a232a2"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.52"
+LINUX_VERSION ?= "6.12.53"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


