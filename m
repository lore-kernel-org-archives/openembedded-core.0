Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 327C6EE6B5A
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 20:27:51 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25.1770409669208373542
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 12:27:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E8NIEWdz;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id af79cd13be357-8c710439535so169579685a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 12:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770409668; x=1771014468; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWJ9oumgPyFU/aLs6IQ5lA0+e/0O6s1H37ehy+PeUMU=;
        b=E8NIEWdzUnTvsqddfdE9gQWMQtUSTU65dgHViATcSlNKuosed35anwRPZVrJcEK0i0
         fBeF9aQGPQ8Y5L9Oh95U0fMWs/Ojn9rchp1ZKpj/yWohbcf89Iu+ARvqA2DjPjQpl69x
         zbROdkLpAmxZZCY8Aw3xVNoT/5wF85SiVdHX/yrGWz8S0F6OQDT9tuqvQ/JjSjtIDY6K
         2L+MAujreeNimLAddTXQX3ez5OR5dTt9uGXnGqa3STFIeNmR14Ro07RN78vIMQi54skf
         ScjBCxo7K4PKSeX1BojVA+1d4gwsLp6ood0afDjoaqodTZxgbYIJcBT9ATIgDDrC4NCX
         /V3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770409668; x=1771014468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uWJ9oumgPyFU/aLs6IQ5lA0+e/0O6s1H37ehy+PeUMU=;
        b=sBkn+svpIR5Bm8FE4wCLS6jToK0wyBFODP2yF7KlJVFv0D/pbsViQ7t1XQURYm1eEm
         Zk4SWoxg/k7W/d+A+LlclqSgFrxIvBLvnneQDYlgpkFVBp35ljIVncOjgrgoQ82TlmSD
         Jwd5UFM7cqE0YhdN9tK06i93Kmeb+PVrhbXJF5wt9zOwoI5FLtCUFuHqiSINvMHSp+Fr
         4wX75BUGkmFMMPrIAp+GHj6+PGwy2d2DFk985WvX9ufmJMC+MHt8mZOvTSpNEjU49WIT
         WweXOBSuKd2TNmuCPJFq0OlPQoizkcI3eV1w7zrVhVrE6Ywl4/stGabh4DyIRRv16VlB
         3osg==
X-Gm-Message-State: AOJu0Yy2TVmvTu8rX06cJfFl/o29se4xUszBg3NmFiUFgS56d9NuBiaN
	uqfRUeLtEgWGo3NmMjGb8ln4eQlCxqXm1GTTa1J9esN5VXXki95iQ+c1DxkuOQxLzsk=
X-Gm-Gg: AZuq6aJbW4PaXtSUVHjFMwIx/+LgzNtehOQuYdmvkqPsXAilGglgdZ/igtVQ6reRer1
	zZVhF7wxbY0LuZWsGXZqCHoafysRqqT8EakVChbOQfGBm5HhKE9PJ4dRG7Rb8sXZPXOVIy3Dos8
	fSrtdfbuHDqp8lVV/uGjiJeaaZltOeoZeso3Cbo/eSnp9cJeFDBz5V5QsfAbZ1DTl/pdHRPPzln
	J9NBRXELAYZKwCbNiT8R6W9LoOJhKoyAeO897OPtPYom5RCKOy/2FDtYdWrRB+tQSiu/U8ElbUi
	ulI0PEEmhf+Q/CaUq26p6j9up4Al5g9uXCvf7D/tPO4geEpfC6EZiqzmMvSGeVx7S2m46WRyhiA
	Vh/r8anoQhfmFlopps/9lEr6/YIn6ZSQPepxv9M8sTlUhFFiqLazya7VXLk7HPpGFuAqB18oybp
	Dm4wXKgNP7AAyvzZj7v7u9Jn4xq+60WW52W+TdpBdwUHuW5Ol/sjbrteyUfPSzT56aOiCnYVJ1V
	R1F6s2bdeSM75rrrZQ1P5+0Zxqwc2qDZD5nq1f3zEEQGZM=
X-Received: by 2002:a05:622a:14cb:b0:503:2f21:6358 with SMTP id d75a77b69052e-506399b28d4mr49080261cf.39.1770409667995;
        Fri, 06 Feb 2026 12:27:47 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-506392bf955sm22651541cf.25.2026.02.06.12.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 12:27:47 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 08/09] linux-yocto/6.18: update to v6.18.8
Date: Fri,  6 Feb 2026 15:27:26 -0500
Message-ID: <20260206202732.1080699-9-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206202732.1080699-1-bruce.ashfield@gmail.com>
References: <20260206202732.1080699-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 20:27:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230652

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.18 to the latest korg -stable release that comprises
the following commits:

    d905362ff5b86 Linux 6.18.8
    5b0caf3913e72 mm/vma: enforce VMA fork limit on unfaulted,faulted mremap merge too
    a4d9dbfc1bab1 mm/vma: fix anon_vma UAF on mremap() faulted, unfaulted merge
    9966c8cc987e3 irqchip/renesas-rzv2h: Prevent TINT spurious interrupt during resume
    79966baabcfe9 arm64: dts: qcom: talos: Correct UFS clocks ordering
    25be3c170ff8e iio: core: add separate lockdep class for info_exist_lock
    2dabc85131c84 iio: core: Replace lockdep_set_class() + mutex_init() by combined call
    c5dbad55ce02a mm/hugetlb: fix two comments related to huge_pmd_unshare()
    918ba220debc4 mm: fix some typos in mm module
    908795c02dbc7 Bluetooth: btintel_pcie: Support for S4 (Hibernate)
    ab140fc931083 gpio: cdev: Fix resource leaks on errors in gpiolib_cdev_register()
    16414341b0dd5 gpio: cdev: Fix resource leaks on errors in lineinfo_changed_notify()
    919f27eb24b0e gpio: cdev: Correct return code on memory allocation failure
    e7200b0a4b2a5 drm/xe: fix WQ_MEM_RECLAIM passed as max_active to alloc_workqueue()
    85d4652f9cdcf drm/xe: Adjust page count tracepoints in shrinker
    569ed6a73e927 drm/bridge: synopsys: dw-dp: fix error paths of dw_dp_bind
    ce2cca8e27d16 drm/amdgpu: remove frame cntl for gfx v12
    07e9373739c63 can: usb_8dev: usb_8dev_read_bulk_callback(): fix URB memory leak
    d374d715e338d can: mcba_usb: mcba_usb_read_bulk_callback(): fix URB memory leak
    3b1a593eab941 can: kvaser_usb: kvaser_usb_read_bulk_callback(): fix URB memory leak
    a9503ae43256e can: esd_usb: esd_usb_read_bulk_callback(): fix URB memory leak
    68c62b3e53901 can: ems_usb: ems_usb_read_bulk_callback(): fix URB memory leak
    aac95b3dd1c26 net: txgbe: remove the redundant data return in SW-FW mailbox
    69b5b028fc130 net: sfp: add potron quirk to the H-COM SPP425H-GAB4 SFP+ Stick
    326470b33c28a net: fec: account for VLAN header in frame length calculations
    03faa61eb4b9c irqchip/gic-v3-its: Avoid truncating memory addresses
    cdb3f95a94f9f perf/x86/intel: Do not enable BTS for guests
    f8cf1368e0a54 rxrpc: Fix data-race warning and potential load/store tearing
    8a957e6d3d262 rust: irq: always inline functions using build_assert with arguments
    ad60902a98181 rust: io: always inline functions using build_assert with arguments
    8776dfa846d5c pmdomain:rockchip: Fix init genpd as GENPD_STATE_ON before regulator ready
    fd675de6bddf7 pmdomain: imx8m-blk-ctrl: Remove separate rst and clk mask for 8mq vpu
    bbcca5a60c88a platform/x86: hp-bioscfg: Fix automatic module loading
    9f5fa78d9980f netrom: fix double-free in nr_route_frame()
    92e4f11e29b98 uacce: ensure safe queue release with state management
    ba29b59d124e7 uacce: implement mremap in uacce_vm_ops to return -EPERM
    82821a681d5dc uacce: fix isolate sysfs check condition
    bd2393ed77125 uacce: fix cdev handling in the cleanup path
    242cbb3df97af s390/boot/vmlinux.lds.S: Ensure bzImage ends with SecureBoot trailer
    ea1b2081d594b s390/ap: Fix wrong APQN fill calculation
    f1cb33a82818d mei: trace: treat reg parameter as string
    f9b059bda4276 intel_th: fix device leak on output open()
    3b90d099efa2b tracing: Fix crash on synthetic stacktrace field usage
    6602bb4d1338e slimbus: core: fix device reference leak on report present
    5f13c946ca449 slimbus: core: fix runtime PM imbalance on report present
    b8a2639341951 octeontx2: Fix otx2_dma_map_page() error return code
    d1943bc9dc950 ksmbd: smbd: fix dma_unmap_sg() nents
    6e32070d29d1a arm64: Set __nocfi on swsusp_arch_resume()
    7b5a52cf252a0 arm64/fpsimd: signal: Fix restoration of SVE context
    70f7f54566afc arm64/fpsimd: signal: Allocate SSVE storage when restoring ZA
    4f39984176e7e arm64/fpsimd: ptrace: Fix SVE writes on !SME systems
    31efbcff90884 wifi: rsi: Fix memory corruption due to not set vif driver data size
    0adefb6396d7b wifi: mwifiex: Fix a loop in mwifiex_update_ampdu_rxwinsize()
    4846b32be324f wifi: ath12k: fix dma_free_coherent() pointer
    07f363f305793 wifi: ath10k: fix dma_free_coherent() pointer
    448a2071a8438 drm/nouveau/disp: Set drm_mode_config_funcs.atomic_(check|commit)
    41ec698854781 iommu/io-pgtable-arm: fix size_t signedness bug in unmap path
    36be050f21dea mmc: sdhci-of-dwcmshc: Prevent illegal clock reduction in HS200/HS400 mode
    6c4555bfd4383 mmc: rtsx_pci_sdmmc: implement sdmmc_card_busy function
    dc1a5dd80af1e ALSA: usb-audio: Fix use-after-free in snd_usb_mixer_free()
    31a3eba5c265a ALSA: scarlett2: Fix buffer overflow in config retrieval
    29f43e8ec7bf0 ALSA: hda/realtek: Add quirk for Samsung 730QED to fix headphone
    873e2360d247e ALSA: ctxfi: Fix potential OOB access in audio mixer handling
    59e54709f9a97 iio: dac: ad5686: add AD5695R to ad5686_chip_info_tbl
    db16e7c52032c iio: dac: ad3552r-hs: fix out-of-bound write in ad3552r_hs_write_data_source
    de8755ae2912d iio: chemical: scd4x: fix reported channel endianness
    d06a4f6c2b186 iio: adc: pac1934: Fix clamped value in pac1934_reg_snapshot
    b6ffc2de37253 iio: adc: exynos_adc: fix OF populate on driver rebind
    d890234a91570 iio: adc: at91-sama5d2_adc: Fix potential use-after-free in sama5d2_adc driver
    348356c91909f iio: adc: ad9467: fix ad9434 vref mask
    ad25bb51203d0 iio: accel: iis328dq: fix gain values
    fa322c8bb2ea4 iio: accel: adxl380: fix handling of unavailable "INT1" interrupt
    1b68efce6dd48 migrate: correct lock ordering for hugetlb file folios
    1093e0a96d168 of: platform: Use default match table for /firmware
    7685286dd7a5e of: fix reference count leak in of_alias_scan()
    67270881c8cf2 panic: only warn about deprecated panic_print on write access
    78822628165f3 leds: led-class: Only Add LED to leds_list when it is fully ready
    c9aeb168e88d2 keys/trusted_keys: fix handle passed to tpm_buf_append_name during unseal
    4040b84ec04a6 x86: make page fault handling disable interrupts properly
    e343973fab43c Octeontx2-af: Add proper checks for fwdata
    236a657422a56 dpll: Prevent duplicate registrations
    6c75fed550800 net/sched: act_ife: avoid possible NULL deref
    3b796b1ecfd3b hinic3: Fix netif_queue_set_napi queue_index input parameter error
    84ef86aa71204 vsock/virtio: cap TX credit to local buffer size
    0aa25bbfd5ea5 vsock/test: fix seqpacket message bounds test
    ec0f1b3da8061 vsock/virtio: fix potential underflow in virtio_transport_get_credit()
    095ec3482a7d3 net: openvswitch: fix data race in ovs_vport_get_upcall_stats
    e22381c1299f7 octeontx2-af: Fix error handling
    b658306ce3835 net: pcs: pcs-mtk-lynxi: report in-band capability for 2500Base-X
    cccf79f688de9 net: dsa: fix off-by-one in maximum bridge ID determination
    05f8f55899289 net: bcmasp: Fix network filter wake for asp-3.0
    de97735a40a14 bonding: provide a net pointer to __skb_flow_dissect()
    cb32707497d48 selftests: net: amt: wait longer for connection before sending packets
    31410a01a86bc be2net: Fix NULL pointer dereference in be_cmd_get_mac_from_list
    f47c6e5a532cc drm/nouveau: implement missing DCB connector types; gracefully handle unknown connectors
    fbc8d1a39da9f drm/nouveau: add missing DCB connector types
    8fd181dada6ea drm/amdgpu: fix type for wptr in ring backup
    c6ec1f665f8f7 drm/amd/pm: Workaround SI powertune issue on Radeon 430 (v2)
    c85aac064f5c2 drm/amd/pm: Don't clear SI SMC table when setting power limit
    91243b926ae96 drm/amd/pm: Fix si_dpm mmCG_THERMAL_INT setting
    79a074be9b57e sched/fair: Fix pelt clock sync when entering idle
    23c0e4bd93d0b perf: Fix refcount warning on event->mmap_count increment
    9d88a79e9018c selftests/ublk: fix garbage output in foreground mode
    e2f4eac26f018 selftests/ublk: fix error handling for starting device
    814e8643b453d selftests/ublk: fix IO thread idle check
    26bf09b6320b8 ublk: fix ublksrv pid handling for pid namespaces
    437553d649647 drm/xe: Update wedged.mode only after successful reset policy change
    7c49c91121194 drm/xe/pm: Add scope-based cleanup helper for runtime PM
    e59924c266a45 drm/xe/migrate: fix job lock assert
    9bba27c222e0e drm/xe/uapi: disallow bind queue sharing
    54c19e7eb2636 clocksource: Reduce watchdog readout delay limit to prevent false positives
    0db865321e63d Octeontx2-pf: Update xdp features
    00a39a148d2fb usbnet: limit max_mtu based on device's hard_mtu
    e3c1040252e59 ipv6: annotate data-race in ndisc_router_discovery()
    7ac345a93af31 mISDN: annotate data-race around dev->work
    d7beeb64be5ca net: hns3: fix the HCLGE_FD_AD_NXT_KEY error setting issue
    bb90d1799073d net: hns3: fix wrong GENMASK() for HCLGE_FD_AD_COUNTER_NUM_M
    5e5dae04ef971 be2net: fix data race in be_get_new_eqd
    7539ae6c67a75 idpf: Fix data race in idpf_net_dim
    b29f51399626b net: hns3: fix data race in hns3_fetch_stats
    1f24dfd556401 net: phy: intel-xway: fix OF node refcount leakage
    2ea06ebaa4abd idpf: read lower clock bits inside the time sandwich
    87c1dacca197c ice: fix devlink reload call trace
    a3d99e2fbf014 ice: add missing ice_deinit_hw() in devlink reinit path
    ec0bfc3ed7e7f ice: Fix persistent failure in ice_get_rxfh
    68462ecc40ea8 netdevsim: fix a race issue related to the operation on bpf_bound_progs list
    9eb4e2396cd7f vsock/test: Do not filter kallsyms by symbol type
    902fd1026ca42 drm/imagination: Wait for FW trace update command completion
    eb98125fa2b33 drm/mediatek: dpi: Find next bridge during probe
    fccaa85ffb73c drm/xe: Disable timestamp WA on VFs
    aa29fe8c1d86b drm/xe/vm: fix xe_vm_validation_exec() kernel-doc
    bc0812416e089 drm/xe/xe_late_bind_fw: fix enum xe_late_bind_fw_id kernel-doc
    a807e4f4f63a5 iommu/amd: Fix error path in amd_iommu_probe_device()
    06657690854fa ntb: transport: Fix uninitialized mutex
    ecb2c8732680c ALSA: usb: Increase volume range that triggers a warning
    aa14451fa5d5f scsi: qla2xxx: Sanitize payload size to prevent member overflow
    219f009ebfd1e scsi: core: Wake up the error handler when final completions race against each other
    1a0072bd1f1e5 platform/x86/amd: Fix memory leak in wbrf_record()
    5f1f79cb90f5e platform/mellanox: Fix SN5640/SN5610 LED platform data
    e150008568a5d riscv: suspend: Fix stimecmp update hazard on RV32
    c4b55a4c600fa riscv: clocksource: Fix stimecmp update hazard on RV32
    82fb54efe7e0f kconfig: fix static linking of nconf
    c2d2cf710dc3e regmap: Fix race condition in hwspinlock irqsave routine
    f6d6b3f172df1 spi: spi-sprd-adi: Fix double free in probe error path
    5d7c7e1fb3ec2 interconnect: debugfs: initialize src_node and dst_node to empty strings
    bcb9803aa1db7 iio: adc: ad7606: Fix incorrect type for error return variable
    489b88567f24d iio: adc: ad7280a: handle spi_setup() errors in probe()
    81ed6e42d6e55 iio: imu: st_lsm6dsx: fix iio_chan_spec for sensors without event detection
    bdf0bf73006ea io_uring/io-wq: check IO_WQ_BIT_EXIT inside work run loop
    8f7c9dbeaa0be timekeeping: Adjust the leap state for the correct auxiliary timekeeper
    2fc23eaea11a7 mm: restore per-memcg proactive reclaim with !CONFIG_NUMA
    f723037e2bfe3 mm/rmap: fix two comments related to huge_pmd_unshare()
    69c4e241ff135 mm/hugetlb: fix hugetlb_pmd_shared()
    193922a23d729 platform/x86: hp-bioscfg: Fix kernel panic in GET_INSTANCE_ID macro
    800b2767905d6 platform/x86: hp-bioscfg: Fix kobject warnings for empty attribute names
    83eae3692c353 drm, drm/xe: Fix xe userptr in the absence of CONFIG_DEVICE_PRIVATE
    3f4ed5e2b8f11 fs/writeback: skip AS_NO_DATA_INTEGRITY mappings in wait_sb_inodes()
    ec56b9f1c1b9b comedi: Fix getting range information for subdevices 16 to 255
    3fe8abec037f5 x86/kfence: avoid writing L1TF-vulnerable PTEs
    930114425065f rxrpc: Fix recvmsg() unconditional requeue
    f60ba4a97ae3f slab: fix kmalloc_nolock() context check for PREEMPT_RT
    37a63671df78f arm64: dts: rockchip: Configure MCLK for analog sound on NanoPi M5
    df546b3311582 arm64: dts: rockchip: Fix headphones widget name on NanoPi M5
    7eb3e77873605 arm64: dts: rockchip: fix unit-address for RK3588 NPU's core1 and core2's IOMMU
    3569a00f66a87 arm64: dts: rockchip: Fix voltage threshold for volume keys for Pinephone Pro
    18d2d227ccd77 arm64: dts: rockchip: remove dangerous max-link-speed from helios64
    c8039a60c31dc arm64: dts: rockchip: remove redundant max-link-speed from nanopi-r4s
    808d8755fc6e6 ARM: dts: microchip: sama7d65: fix size-cells property for i2c3
    5f403d64af721 ARM: dts: microchip: sama7d65: fix the ranges property for flx9
    cd3c1f823e213 i2c: spacemit: drop IRQF_ONESHOT flag from IRQ request
    24c441f0e24da scsi: xen: scsiback: Fix potential memory leak in scsiback_remove()
    a5e4d969392ce scsi: storvsc: Process unsupported MODE_SENSE_10
    bfe76b0f9f3e9 Input: i8042 - add quirk for ASUS Zenbook UX425QA_UM425QA
    2c61ca3c5bed6 Input: i8042 - add quirks for MECHREVO Wujie 15X Pro
    5d5b227c92721 Revert "nfc/nci: Add the inconsistency check between the input data length and count"
    3f5ef08f302cc w1: fix redundant counter decrement in w1_attach_slave_device()
    e6b2609af21b5 w1: therm: Fix off-by-one buffer overflow in alarms_store
    169164fe51b27 comedi: dmm32at: serialize use of paged registers
    2501c49306238 serial: Fix not set tty->port race condition
    0b7383aceaad1 serial: 8250_pci: Fix broken RS485 for F81504/508/512
    f4748bfa3d3e2 wifi: mac80211: don't perform DA check on S1G beacon
    9532ff0d0e90f crypto: authencesn - reject too-short AAD (assoclen<8) to match ESP/ESN spec
    77f1afd0bb4d5 net/sched: qfq: Use cl_is_active to determine whether class is active in qfq_rm_from_ag
    16ed73c1282d3 net/sched: Enforce that teql can only be used as root qdisc
    ed80f605edd6c octeontx2: cn10k: fix RX flowid TCAM mask handling
    6a81e2db09691 ipvlan: Make the addrs_lock be per port
    32d417497b79e l2tp: avoid one data-race in l2tp_tunnel_del_work()
    a635ae2a9fdb8 pwm: max7360: Populate missing .sizeof_wfhw in max7360_pwm_ops
    4230e8cd2f1b4 pwm: Ensure ioctl() returns a negative errno on error
    0f6e1ff56cd27 veth: fix data race in veth_get_ethtool_stats
    9b75dff8446ec fou: Don't allow 0 for FOU_ATTR_IPPROTO.
    18da5acb3c03d tools: ynl: Specify --no-line-number in ynl-regen.sh.
    5437a279804ce gue: Fix skb memleak with inner IP protocol 0.
    392b28d404b74 amd-xgbe: avoid misleading per-packet error log
    0c4adb1f391a7 sctp: move SCTP_CMD_ASSOC_SHKEY right after SCTP_CMD_PEER_INIT
    c3edc14da81a8 can: gs_usb: gs_usb_receive_bulk_callback(): unanchor URL on usb_submit_urb() error
    4f727c422b7fc net: freescale: ucc_geth: Return early when TBI PHY can't be found
    5ebc24f9dbe4f selftests: net: fib-onlink-tests: Convert to use namespaces by default
    d4ce79e6dce2a l2tp: Fix memleak in l2tp_udp_encap_recv().
    43dee6f7ef1d2 bonding: limit BOND_MODE_8023AD to Ethernet devices
    b9f0896f8e229 net: usb: dm9601: remove broken SR9700 support
    63ef9b300bd09 vsock/virtio: Coalesce only linear skb
    88037973c8ef6 igc: Reduce TSN TX packet buffer from 7KB to 5KB per queue
    41d7a27c47b8a igc: fix race condition in TX timestamp read for register 0
    a38d2c624639c igc: Restore default Qbv schedule when changing channels
    695c909d1815b ice: Fix incorrect timeout ice_release_res()
    753171a695b93 ice: Avoid detrimental cleanup for bond during interface stop
    0bc8d94bf6694 ice: initialize ring_stats->syncp
    c35a0cb145f2c wifi: ath12k: Fix wrong P2P device link id issue
    06ac2aa13f701 wifi: ath12k: fix dead lock while flushing management frames
    c8e5f49667f5f wifi: ath12k: Fix scan state stuck in ABORTING after cancel_remain_on_channel
    1aa6698924595 wifi: ath12k: cancel scan only on active scan vdev
    887032ba3ff23 ata: libata: Print features also for ATAPI devices
    d5529d36e7646 ata: libata: Add DIPM and HIPM to ata_dev_print_features() early return
    93f484d63f873 ata: libata: Add cpr_log to ata_dev_print_features() early return
    7fe7e7858b32d ata: libata-sata: Improve link_power_management_supported sysfs attribute
    05db73211387f ata: libata: Call ata_dev_config_lpm() for ATAPI devices
    62ced8e065787 ata: ahci: Do not read the per port area for unimplemented ports
    a57459614aa69 wifi: ath12k: don't force radio frequency check in freq_to_idx()
    d395afac28adb pmdomain: qcom: rpmhpd: Add MXC to SC8280XP
    0f56c3f23ed56 dt-bindings: power: qcom,rpmpd: Add SC8280XP_MXC_AO
    4818f28cd9023 btrfs: fix missing fields in superblock backup with BLOCK_GROUP_TREE
    6abad2eb9a1bd Drivers: hv: Always do Hyper-V panic notification in hv_kmsg_dump()
    4f6884288e4b7 perf parse-events: Fix evsel allocation failure
    83eeeb8c1acb7 arm64: dts: rockchip: Fix wrong register range of rk3576 gpu
    2d73b3ed28be1 arm64: dts: qcom: sm8650: Fix compile warnings in USB controller node
    0e5ad343afa30 arm64: dts: qcom: sm8550: Fix compile warnings in USB controller node
    27357b61522f7 arm64: dts: qcom: sc8280xp: Add missing VDD_MXC links

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.18.bb              |  6 ++---
 .../linux/linux-yocto-tiny_6.18.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index 8df3c14f9e..66c71691be 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1292f3b6fc58f2b157bea9c8703188fd1f4ccd50"
-SRCREV_meta ?= "240c73660dec670caa087090b0a1b2bfb0b8b308"
+SRCREV_machine ?= "1d69aa08808e4bb5064cf0dd61ee7e581053dab1"
+SRCREV_meta ?= "d57e94fa9cad660aef7209764d83201dd6f51fb5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.18.7"
+LINUX_VERSION ?= "6.18.8"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index 194bb01d93..2fbd5a91f9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.18.inc
 
-LINUX_VERSION ?= "6.18.7"
+LINUX_VERSION ?= "6.18.8"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "13406870d76895304abb5722793d4abe03b40549"
-SRCREV_meta ?= "240c73660dec670caa087090b0a1b2bfb0b8b308"
+SRCREV_machine ?= "45c180b45ed85ec7b3e4454f8a8f62b122c48a2e"
+SRCREV_meta ?= "d57e94fa9cad660aef7209764d83201dd6f51fb5"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index c7185eb3c0..cc3831f798 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "b36eb7592b944efb3f0c022a25bffb30a74f429b"
-SRCREV_machine:qemuarm64 ?= "13406870d76895304abb5722793d4abe03b40549"
-SRCREV_machine:qemuloongarch64 ?= "13406870d76895304abb5722793d4abe03b40549"
+SRCREV_machine:qemuarm ?= "4f2201e463ee13c7b27e2ed12694d9b700c4e264"
+SRCREV_machine:qemuarm64 ?= "45c180b45ed85ec7b3e4454f8a8f62b122c48a2e"
+SRCREV_machine:qemuloongarch64 ?= "45c180b45ed85ec7b3e4454f8a8f62b122c48a2e"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "13406870d76895304abb5722793d4abe03b40549"
-SRCREV_machine:qemuriscv64 ?= "13406870d76895304abb5722793d4abe03b40549"
-SRCREV_machine:qemuriscv32 ?= "13406870d76895304abb5722793d4abe03b40549"
-SRCREV_machine:qemux86 ?= "13406870d76895304abb5722793d4abe03b40549"
-SRCREV_machine:qemux86-64 ?= "13406870d76895304abb5722793d4abe03b40549"
+SRCREV_machine:qemuppc ?= "45c180b45ed85ec7b3e4454f8a8f62b122c48a2e"
+SRCREV_machine:qemuriscv64 ?= "45c180b45ed85ec7b3e4454f8a8f62b122c48a2e"
+SRCREV_machine:qemuriscv32 ?= "45c180b45ed85ec7b3e4454f8a8f62b122c48a2e"
+SRCREV_machine:qemux86 ?= "45c180b45ed85ec7b3e4454f8a8f62b122c48a2e"
+SRCREV_machine:qemux86-64 ?= "45c180b45ed85ec7b3e4454f8a8f62b122c48a2e"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "13406870d76895304abb5722793d4abe03b40549"
-SRCREV_meta ?= "240c73660dec670caa087090b0a1b2bfb0b8b308"
+SRCREV_machine ?= "45c180b45ed85ec7b3e4454f8a8f62b122c48a2e"
+SRCREV_meta ?= "d57e94fa9cad660aef7209764d83201dd6f51fb5"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "5dfbc5357c34bdf81c84aa78bc8e3d6d9ba10aad"
+SRCREV_machine:class-devupstream ?= "d905362ff5b86f6b619953ada8e0af84158db2e9"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.18/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.18.7"
+LINUX_VERSION ?= "6.18.8"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


