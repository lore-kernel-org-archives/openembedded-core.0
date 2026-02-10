Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A6A2E94633
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 03:14:31 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12090.1770693268130176654
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 19:14:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YBebqaRv;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8ca01dc7d40so46157585a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 19:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770693267; x=1771298067; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fyXvxVK1gq8gPem9rFf6/VgLMr62xWanfuejuEaQpRo=;
        b=YBebqaRvpGQ/7KyStWk/OKil3aTC5d/uj8o3TbRJ8NMsgjPm3/JrH3YnqjFI+qLip8
         6DZMgYl6VBKyk3wdnSCfpAdk/UCEmt/hV9qPQupwDPebDX+N0UJ+gxoXvaOharqiX6NM
         /Z2k4CtIaEOTKSWQsA3PngfmyVPzywmy03U02YUIpL2en5i1eJfz1wyKVqnuqrY1jC0w
         dH8fvrfVViwgkgrWH5FdOYsNcT+//uGSWl9QjWrSKTOle8D8HMQyVulYr2QN7rNgHwlI
         eqNvrepW6u+ZcVmHxXwEDM9gBIo7tcLMDKmlEoIlARybCgXhhpmNbArOhaHAIYsq6yrY
         qmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770693267; x=1771298067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fyXvxVK1gq8gPem9rFf6/VgLMr62xWanfuejuEaQpRo=;
        b=uolxZKZ1gqCYBusRL5oEqAEPEW7+RuCWS6mTN3+HMj70tfwacO30vVzVlzAB8Su8k+
         0mgD60Uk3GD0RFlFmNJ6JY5UCTKE4Y3f9S5HUcOf7J2WrAYLlwy1K6eHeTfmfnjoBNJS
         /FT6iNwHWHHj+TibPtSUuJU1R68bFuunXU25Kg75aX8QENMirAypkzf1EY8gxK6d/966
         2ct/Z0bI2f5L8Yl82uI0Y0e/bn0HIydr9G6aReO3p9+N4e0GtwwYN2XjTHo8woXbbWlv
         eu2V/8EWbMTbcouEmCFfu39CAxlh+Lzkn8rlj6qb6hKl1G/7MO9ZlAKOUa+hOEtk2Bxn
         SrlQ==
X-Gm-Message-State: AOJu0YzZ+izMXarC/ZEbgrFnEojvFoFMzVxL+0jkvyrLzWwftiuRswdU
	MJV13vnNSLGEVZ8FB7V3uCY7LYgO0dW/NuAmZuT4YV87cOksaW201rl0QbVfbINA
X-Gm-Gg: AZuq6aKt1oXmuA2zcYBxGBxIk7dO5Vp3YwB24+siWT55/fk9o/rsvP0ULCP7VxEn+Y5
	J6xUS/yriN+XsceZWqrP0AdAWlIZb2FugzppeCbbLlRBbBWoH2vG4aaq1j1JFfXdqNNTK4CpQQF
	pmH/sRNEa6Iut/UXu59uNFySrbT7S/jQj1vN3NBqJaox39sdT5wRnMEq4Ocaz5nDLhgxrXXOxn1
	htngpLCr0qQc51nyhmW2yEYQEsyShr/AcDlIk7wyZ1r35+qtUGJKqCr82W2+QUuF53nAn9rtalg
	AzrJtWitMQiK1QS/qmE+X4Zk1KkHi9IDePAF0jncCNYYSE5eN1CUMrEjtwcrbS/r1+HlrpRLWMK
	iOF0B3pxTW7Y4Qki1EE2pzNQs0H0VoA6ZVaTRUiDeKyXnkyO7/kWdMnRyMHfn3jl2OYvzcjocUe
	CbBAOcomsglF7iUkVeo9lmksTrgF1cqyvb0j/RkZMy/DAFTpRf9rJSeg4DMXeORBi/V7ip0/GN/
	l50TmFP0JeV53792HIy1/WUOF9m97vPtWAlA0nfglu9MBjtYX40CNzik5E=
X-Received: by 2002:a05:620a:1789:b0:8ca:2baa:6658 with SMTP id af79cd13be357-8caf238e3bemr1666887685a.70.1770693266383;
        Mon, 09 Feb 2026 19:14:26 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9a157f8sm955632785a.30.2026.02.09.19.14.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 19:14:25 -0800 (PST)
From: bruce.ashfield@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [meta][scarthgap][PATCH 01/07] linux-yocto/6.6: update to v6.6.112
Date: Mon,  9 Feb 2026 22:14:18 -0500
Message-ID: <20260210031424.1346685-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 03:14:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230835

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    0bbbd97a442d Linux 6.6.112
    acad20578817 usb: cdns3: cdnsp-pci: remove redundant pci_disable_device() call
    5c25a2a403b3 arm64: dts: qcom: qcm2290: Disable USB SS bus instances in park mode
    540aaab034b5 usb: typec: tipd: Clear interrupts first
    724a9db84188 net: usb: asix: hold PM usage ref to avoid PM/MDIO + RTNL deadlock
    78e87b8a3cf8 bus: fsl-mc: Check return value of platform_get_resource()
    1a2ea887a5cd pinctrl: check the return value of pinmux_ops::get_function_name()
    66821fdb723d remoteproc: pru: Fix potential NULL pointer dereference in pru_rproc_set_ctable()
    81cec07d3031 sunrpc: fix null pointer dereference on zero-length checksum
    fd8a23ecbc60 Input: uinput - zero-initialize uinput_ff_upload_compat to avoid info leak
    bbd8f90c3bf4 Input: atmel_mxt_ts - allow reset GPIO to sleep
    d7513b47082c misc: fastrpc: Skip reference for DMA handles
    3ad42dc66445 misc: fastrpc: fix possible map leak in fastrpc_put_args
    6e0d6cc39f41 misc: fastrpc: Fix fastrpc_map_lookup operation
    b808a3590c28 nvdimm: ndtest: Return -ENOMEM if devm_kcalloc() fails in ndtest_probe()
    964598e6f70a mm: hugetlb: avoid soft lockup when mprotect to large memory area
    c6effaab2427 ext4: fix checks for orphan inodes
    c6b15a82a56c ksmbd: fix error code overwriting in smb2_get_info_filesystem()
    7eca645917bc LoongArch: Automatically disable kaslr if boot from kexec_file
    846cafc4725c dm: fix NULL pointer dereference in __dm_suspend()
    ed6877417298 dm: fix queue start/stop imbalance under suspend/load/resume races
    2647603d42d9 mfd: vexpress-sysreg: Check the return value of devm_gpiochip_add_data()
    6c21c4a425d3 mfd: rz-mtu3: Fix MTU5 NFCR register offset
    0ba68bea1e35 net: nfc: nci: Add parameter validation for packet data
    a70dcfa8d0a0 fs: udf: fix OOB read in lengthAllocDescs handling
    28d0e8af8c0a ASoC: SOF: ipc3-topology: Fix multi-core and static pipelines tear down
    e04aa0b00107 ASoC: wcd934x: fix error handling in wcd934x_codec_parse_data()
    2af39ab5e6dc uio_hv_generic: Let userspace take care of interrupt mask
    c28b0ca029ed Squashfs: fix uninit-value in squashfs_get_parent
    3bce44b34404 bpf: Reject negative offsets for ALU ops
    78dc7362662f vhost: vringh: Modify the return value check
    aa57822ade41 Revert "net/mlx5e: Update and set Xon/Xoff upon MTU set"
    ba905a567105 smb: client: fix crypto buffers in non-linear memory
    3311f0d15bb3 net/mlx5: fw reset, add reset timeout work
    3df251a65b4e net/mlx5: pagealloc: Fix reclaim race during command interface teardown
    dda27f370cde net/mlx5: Stop polling for command response if interface goes down
    ea87151df398 net: dlink: handle copy_thresh allocation failure
    5e627ae572b2 net: ena: return 0 in ena_get_rxfh_key_size() when RSS hash key is not configurable
    07a92ab8b479 nfp: fix RSS hash key size when RSS is not supported
    75287554a92e mtd: rawnand: atmel: Fix error handling path in atmel_nand_controller_add_nands
    53683b4d3740 drivers/base/node: fix double free in register_one_node()
    7e76fe9dfadb ocfs2: fix double free in user_cluster_connect()
    f4238064379a hwrng: ks-sa - fix division by zero in ks_sa_rng_init
    96ca6913042e KEYS: X.509: Fix Basic Constraints CA flag parsing
    2ef583b45fe7 Bluetooth: hci_sync: Fix using random address for BIG/PA advertisements
    8fd355f54a62 Bluetooth: ISO: don't leak skb in ISO_CONT RX
    5319145a07d8 Bluetooth: ISO: Fix possible UAF on iso_conn_free
    868196cc8ba8 Bluetooth: MGMT: Fix not exposing debug UUID on MGMT_OP_READ_EXP_FEATURES_INFO
    781226e11d5b vhost: vringh: Fix copy_to_iter return value check
    6394bade9daa net: usb: Remove disruptive netif_wake_queue in rtl8150_set_multicast
    7c853408ee24 RDMA/siw: Always report immediate post SQ errors
    48edf187fdd4 usb: vhci-hcd: Prevent suspending virtually attached devices
    6459dba4f350 scsi: mpt3sas: Fix crash in transport port remove by using ioc_info()
    8cbe2a21d857 ipvs: Defer ip_vs_ftp unregister during netns cleanup
    0901fa02ccf7 NFSv4.1: fix backchannel max_resp_sz verification check
    9768536f8260 coresight: trbe: Return NULL pointer for allocation failures
    e926dfde8ad1 coresight: etm4x: Support atclk
    4960e17a3543 coresight-etm4x: Conditionally access register TRCEXTINSELR
    db1261fe50ff remoteproc: qcom: q6v5: Avoid disabling handover IRQ twice
    f321de0b3847 PCI: tegra194: Fix duplicate PLL disable in pex_ep_event_pex_rst_assert()
    f22d898e080a wifi: rtw89: avoid circular locking dependency in ser_state_run()
    85288bcf7ffe RDMA/rxe: Fix race in do_task() when draining
    1750f1ec143e crypto: hisilicon/qm - set NULL to qm->debug.qm_diff_regs
    f0e6e7b43511 vfio/pds: replace bitmap_free with vfree
    e7979228b3bd sparc: fix accurate exception reporting in copy_{from,to}_user for M7
    9cbb5ebf409e sparc: fix accurate exception reporting in copy_to_user for Niagara 4
    8cdeb5e482d3 sparc: fix accurate exception reporting in copy_{from_to}_user for Niagara
    dc766c4830a7 sparc: fix accurate exception reporting in copy_{from_to}_user for UltraSPARC III
    674ff598148a sparc: fix accurate exception reporting in copy_{from_to}_user for UltraSPARC
    77fe706ff086 wifi: mac80211: fix Rx packet handling when pubsta information is not available
    15bd3f0d0e99 wifi: ath10k: avoid unnecessary wait for service ready message
    12ff1858301e Documentation: trace: historgram-design: Separate sched_waking histogram section heading and the following diagram
    8410e7d65b16 IB/sa: Fix sa_local_svc_timeout_ms read race
    925ff361460b RDMA/core: Resolve MAC of next-hop device without ARP support
    eb976d02c889 Revert "usb: xhci: Avoid Stop Endpoint retry loop if the endpoint seems Running"
    e0a9a737c9a2 f2fs: fix zero-sized extent for precache extents
    8eb6dacd5c23 scsi: qla2xxx: Fix incorrect sign of error code in qla_nvme_xmt_ls_rsp()
    111b64b98874 scsi: qla2xxx: Fix incorrect sign of error code in START_SP_W_RETRIES()
    19a09c909372 scsi: qla2xxx: edif: Fix incorrect sign of error code
    8012e298b968 ACPI: NFIT: Fix incorrect ndr_desc being reportedin dev_err message
    7d9b97e61350 f2fs: fix to mitigate overhead of f2fs_zero_post_eof_page()
    83a8e4efea02 f2fs: fix to truncate first page in error path of f2fs_truncate()
    045375172dd4 f2fs: fix to update map->m_next_extent correctly in f2fs_map_blocks()
    ec4a608bca40 wifi: mt76: fix potential memory leak in mt76_wmac_probe()
    dac556dd2d44 RDMA/cm: Rate limit destroy CM ID timeout error message
    4a594f5c64bf drivers/base/node: handle error properly in register_one_node()
    d12f4499585a watchdog: mpc8xxx_wdt: Reload the watchdog timer when enabling the watchdog
    54f4da8629cf ipvs: Use READ_ONCE/WRITE_ONCE for ipvs->enable
    a2e10d05f5c3 netfilter: ipset: Remove unused htable_bits in macro ahash_region
    9170730674cf iio: consumers: Fix offset handling in iio_convert_raw_to_processed()
    289cbdb27afb iio: consumers: Fix handling of negative channel scale in iio_convert_raw_to_processed()
    978aac54e93e fs/ntfs3: reject index allocation if $BITMAP is empty but blocks exist
    a86c8b9d03f7 fs: ntfs3: Fix integer overflow in run_unpack()
    528807934790 drm/msm/dpu: fix incorrect type for ret
    f197894de2f4 ASoC: Intel: bytcr_rt5651: Fix invalid quirk input mapping
    29a41bf64226 ASoC: Intel: bytcr_rt5640: Fix invalid quirk input mapping
    d75a561ba1ea ASoC: Intel: bytcht_es8316: Fix invalid quirk input mapping
    cf71834a0cfc pps: fix warning in pps_register_cdev when register device fail
    b859d612303a misc: genwqe: Fix incorrect cmd field being reported in error
    c36785f9de03 tty: n_gsm: Don't block input queue by waiting MSC
    0924d8563043 usb: gadget: configfs: Correctly set use_os_string at bind
    f0c98b011e01 usb: phy: twl6030: Fix incorrect type for ret
    a7d262359018 drm/amdkfd: Fix error code sign for EINVAL in svm_ioctl()
    18897db75121 tcp: fix __tcp_close() to only send RST when required
    8120c4638416 PCI: tegra: Fix devm_kcalloc() argument order for port->phys allocation
    1fc4717f5190 wifi: mwifiex: send world regulatory domain to driver
    531a50b2db6d drm/amd/pm: Disable SCLK switching on Oland with high pixel clocks (v3)
    5e64cc74159c drm/amd/pm: Disable MCLK switching with non-DC at 120 Hz+ (v2)
    4e27e18f64a2 drm/amd/pm: Treat zero vblank time as too short in si_dpm (v3)
    1320d1e834c1 drm/amd/pm: Adjust si_upload_smc_data register programming (v3)
    dd3d6befe7db drm/amd/pm: Fix si_upload_smc_data (v3)
    2f68f6f7cec4 drm/amd/pm: Disable ULV even if unsupported (v3)
    d0e0b2c9a2b7 drm/amdgpu: Power up UVD 3 for FW validation (v2)
    553af70d3d68 coresight: Only register perf symlink for sinks with alloc_buffer
    91e487452d5a inet: ping: check sock_net() in ping_get_port() and ping_lookup()
    3a7802716da2 crypto: hisilicon/qm - check whether the input function and PF are on the same device
    c9035e9ba528 crypto: hisilicon - re-enable address prefetch after device resuming
    94b09b0ac0b8 crypto: hisilicon/zip - remove unnecessary validation for high-performance mode configurations
    30a4e81edb15 media: st-delta: avoid excessive stack usage
    6e41267d52ec ALSA: lx_core: use int type to store negative error codes
    ca61e32fcf27 RDMA/mlx5: Fix vport loopback forcing for MPV device
    f891dce0d397 media: rj54n1cb0c: Fix memleak in rj54n1_probe()
    f97f08b9351d scsi: myrs: Fix dma_alloc_coherent() error check
    e62251954a12 scsi: pm80xx: Fix array-index-out-of-of-bounds on rmmod
    c1a15609eade hwrng: nomadik - add ARM_AMBA dependency
    c5d08ff97cdb crypto: keembay - Add missing check after sg_nents_for_len()
    9c5cfe544a63 drm/amd/display: Remove redundant semicolons
    ef3600c6fec3 serial: max310x: Add error checking in probe()
    ac4d189aaa93 usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through secure calls
    b0439e3762ac usb: host: max3421-hcd: Fix error pointer dereference in probe cleanup
    8de227e62a53 phy: rockchip: naneng-combphy: Enable U3 OTG port for RK3568
    20f744fea1b1 media: zoran: Remove zoran_fh structure
    d2e29c36eb5f drm/bridge: it6505: select REGMAP_I2C
    32270c3a65bd f2fs: fix condition in __allow_reserved_blocks()
    08eb6043c9e5 drm/radeon/r600_cs: clean up of dead code in r600_cs
    9c704b291d5d drm/panel: novatek-nt35560: Fix invalid return value
    08cb3dc9d2b4 bpf: Enforce expected_attach_type for tailcall compatibility
    44045b107a4e i2c: designware: Add disabling clocks when probe fails
    6d621778e378 i2c: designware: Fix clock issue when PM is disabled
    59d467bd07ee i2c: mediatek: fix potential incorrect use of I2C_MASTER_WRRD
    a4b5eac932ca thermal/drivers/qcom/lmh: Add missing IRQ includes
    d2e0755412bf thermal/drivers/qcom: Make LMH select QCOM_SCM
    c07e759b3f53 hwmon: (mlxreg-fan) Separate methods of fan setting coming from different subsystems
    c38998ed0e88 once: fix race by moving DO_ONCE to separate section
    2158121117c9 tools/nolibc: make time_t robust if __kernel_old_time_t is missing in host headers
    748bbe2c1673 smp: Fix up and expand the smp_call_function_many() kerneldoc
    cdeafacb4f9f bpf: Explicitly check accesses to bpf_sock_addr
    ec9a5b4f0eee selftests: watchdog: skip ping loop if WDIOF_KEEPALIVEPING not supported
    5477b0045056 i3c: master: svc: Recycle unused IBI slot
    20ff7004c9a0 i3c: master: svc: Use manual response for IBI events
    060ecc81240e nvmet-fc: move lsop put work to nvmet_fc_ls_req_op
    8963484b7e15 ACPICA: Fix largest possible resource descriptor index
    c3202fce0cea pwm: tiehrpwm: Fix corner case in clock divisor calculation
    6926fc62b777 arm64: dts: mediatek: mt8516-pumpkin: Fix machine compatible
    8063e535a5a2 arm64: dts: mediatek: mt6795-xperia-m5: Fix mmc0 latch-ck value
    7e538e84ca7d arm64: dts: mediatek: mt6331: Fix pmic, regulators, rtc, keys node names
    2af05a03b1d2 cpuidle: qcom-spm: fix device and OF node leaks at probe
    aa30d3077298 firmware: firmware: meson-sm: fix compile-test default
    4f9e6ff6319d nbd: restrict sockets to TCP and UDP
    37e5190d4bfe arm64: dts: mediatek: mt8195: Remove suspend-breaking reset from pcie0
    341a1b62a024 null_blk: Fix the description of the cache_size module argument
    70d4e6996a5d pinctrl: renesas: Use int type to store negative error codes
    82b71f330cd0 power: supply: cw2015: Fix a alignment coding style issue
    80eab6a9df7e PM / devfreq: mtk-cci: Fix potential error pointer dereference in probe()
    585499f17d1d ARM: dts: omap: am335x-cm-t335: Remove unused mcasp num-serializer property
    396ee23da443 ARM: dts: ti: omap: omap3-devkit8000-lcd: Fix ti,keep-vref-on property to use correct boolean syntax in DTS
    dcc72335190c ARM: dts: ti: omap: am335x-baltos: Fix ti,en-ck32k-xtal property in DTS to use correct boolean syntax
    96adc664ff27 PM: sleep: core: Clear power.must_resume in noirq suspend error path
    fa2a1c33e081 block: use int to store blk_stack_limits() return value
    12ef6fe2b4ea selftests/nolibc: fix EXPECT_NZ macro
    aac29a895144 regulator: scmi: Use int type to store negative error codes
    5ce4e7a5fe46 arm64: dts: apple: t8103-j457: Fix PCIe ethernet iommu-map
    e9d02b09ded8 ARM: at91: pm: fix MCKx restore routine
    06c4826b1d90 blk-mq: check kobject state_in_sysfs before deleting in blk_mq_unregister_hctx
    299cd1f5fdaa pinctrl: meson-gxl: add missing i2c_d pinmux
    3433843693e0 soc: qcom: rpmh-rsc: Unconditionally clear _TRIGGER bit for TCS
    5b8ac5689739 ACPI: processor: idle: Fix memory leak when register cpuidle device failed
    24a67e7dfd03 cpufreq: scmi: Account for malformed DT in scmi_dev_used_by_cpus()
    64db56dc1fe5 leds: flash: leds-qcom-flash: Update torch current clamp setting
    ca782b2a61d6 ARM: dts: renesas: porter: Fix CAN pin group
    5c6246bc147d libbpf: Fix reuse of DEVMAP
    ab8b2403103f bpf: Remove migrate_disable in kprobe_multi_link_prog_run
    7db2f54be7d5 bpf/selftests: Fix test_tcpnotify_user
    c99c6c593ee2 regmap: Remove superfluous check for !config in __regmap_init()
    0401de6d1665 arm64: dts: renesas: rzg2lc-smarc: Disable CAN-FD channel0
    db82a94b0c10 x86/vdso: Fix output operand size of RDPID
    8100b6c0f908 EDAC/i10nm: Skip DIMM enumeration on a disabled memory controller
    a993be82c512 smb: server: fix IRD/ORD negotiation with the client
    379cae2cb982 perf: arm_spe: Prevent overflow in PERF_IDX2OFF()
    35e5f3759010 coresight: trbe: Prevent overflow in PERF_IDX2OFF()
    239c49a99d63 gfs2: Fix GLF_INVALIDATE_IN_PROGRESS flag clearing in do_xmote
    69e2a7c30750 selftests: arm64: Check fread return value in exec_target
    00f1726e6412 seccomp: Fix a race with WAIT_KILLABLE_RECV if the tracer replies too fast
    9d8b6c9f18e5 init: INITRAMFS_PRESERVE_MTIME should depend on BLK_DEV_INITRD
    a312ec6d768a filelock: add FL_RECLAIM to show_fl_flags() macro

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 1179c03a00..d9281a8dc3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "30009325411827c48a376212ef00a5637f67b914"
-SRCREV_meta ?= "50530c858c90f124629dadce78f696b590747ea5"
+SRCREV_machine ?= "6b56dc2c001e49e222099ea81df6a528daaa6494"
+SRCREV_meta ?= "e9d2569bbf078a9a440eb2a266d4908a8e981efb"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.111"
+LINUX_VERSION ?= "6.6.112"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index eb906bad17..2d4614380a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.111"
+LINUX_VERSION ?= "6.6.112"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "529f5ce5c38c39bc1fe4022f499ee718bff0cb8b"
-SRCREV_meta ?= "50530c858c90f124629dadce78f696b590747ea5"
+SRCREV_machine ?= "024ea2ec19c7ce3b85127ee406b77d1cb5c7d1ba"
+SRCREV_meta ?= "e9d2569bbf078a9a440eb2a266d4908a8e981efb"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 070342f5b7..aec9465d52 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "f864fe79b2b8052e10bbe3ae443941ccefa5a951"
-SRCREV_machine:qemuarm64 ?= "cdd229fbaaa25d5d9eb055477af8c2b82238763b"
-SRCREV_machine:qemuloongarch64 ?= "2a17dc587afe4e133deef4d8c9ec98724aee785b"
-SRCREV_machine:qemumips ?= "2f5bef5596eeb6ac65023cfeb1a6402efcdc965f"
-SRCREV_machine:qemuppc ?= "be45c09ed7f4b5a09f95cd90484ef083c8552344"
-SRCREV_machine:qemuriscv64 ?= "2a17dc587afe4e133deef4d8c9ec98724aee785b"
-SRCREV_machine:qemuriscv32 ?= "2a17dc587afe4e133deef4d8c9ec98724aee785b"
-SRCREV_machine:qemux86 ?= "2a17dc587afe4e133deef4d8c9ec98724aee785b"
-SRCREV_machine:qemux86-64 ?= "2a17dc587afe4e133deef4d8c9ec98724aee785b"
-SRCREV_machine:qemumips64 ?= "130d3c48ab3b914907b88ff240463b4e5718d526"
-SRCREV_machine ?= "2a17dc587afe4e133deef4d8c9ec98724aee785b"
-SRCREV_meta ?= "50530c858c90f124629dadce78f696b590747ea5"
+SRCREV_machine:qemuarm ?= "8bb9f27f007491367c5462bc6621b2b54de3a698"
+SRCREV_machine:qemuarm64 ?= "f3ce184609214572523760978e39e0cb8c9bcd2e"
+SRCREV_machine:qemuloongarch64 ?= "a9ade4af8d792deb5591876c33e227cb8ed66c44"
+SRCREV_machine:qemumips ?= "176f3129fdbd03984202e6e7be1513fb5cf034c8"
+SRCREV_machine:qemuppc ?= "056373204046e1264be8c6dbdc7d6fe5cc8fcd44"
+SRCREV_machine:qemuriscv64 ?= "a9ade4af8d792deb5591876c33e227cb8ed66c44"
+SRCREV_machine:qemuriscv32 ?= "a9ade4af8d792deb5591876c33e227cb8ed66c44"
+SRCREV_machine:qemux86 ?= "a9ade4af8d792deb5591876c33e227cb8ed66c44"
+SRCREV_machine:qemux86-64 ?= "a9ade4af8d792deb5591876c33e227cb8ed66c44"
+SRCREV_machine:qemumips64 ?= "9a4d37ff6055f4ba90ed7dae2521a7aa88a59469"
+SRCREV_machine ?= "a9ade4af8d792deb5591876c33e227cb8ed66c44"
+SRCREV_meta ?= "e9d2569bbf078a9a440eb2a266d4908a8e981efb"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "655054d2c3c184875f95646abd828b5dfc027d5e"
+SRCREV_machine:class-devupstream ?= "0bbbd97a442d5e0136cc2ee921a4b76542d618ce"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.111"
+LINUX_VERSION ?= "6.6.112"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


