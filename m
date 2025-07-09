Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B6D3C83F16
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 02:51:51 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.5628.1752029508644718360
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 19:51:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=a+rG7yU9;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2353a2bc210so49482605ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 19:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752029508; x=1752634308; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dBNMoWlmlKLGzZbK4/Ul0aSqqpRer1yDspltY0KzBcc=;
        b=a+rG7yU9PSM82ct1jHFTep3UYKCN8gc1eVzxPguEP0qOhcAO6+Uh/jv5JI8jdgsV+y
         KhG9V30ohEs8rNiGVpIX1hgoAnsjYnA5dcAyi9jnVnu1OTpKb5bwUrCWiwMzdvy4J/99
         c0sfKkevs9FjqdAZIWyWk1hwG3cEuG1l2oPSi9CtvM0lRjkojSQkZKGfcI7wVB8Lrjfb
         K4m3qyiktLVEb0Je/Hu7NIXDcolKUd4FfPsMI0bPygRPmFv98Vy5Mfi0VMKSsEg2Tdg3
         1sWRtc8DC47a+d2kXP29i1VtOLMozY94sqrozrfTyJZd9EddqXQyPvH6p/nGBHIya0W7
         p45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752029508; x=1752634308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dBNMoWlmlKLGzZbK4/Ul0aSqqpRer1yDspltY0KzBcc=;
        b=qTSIhT8zRUX+y2m32P0YmN/+NsFQqb09aEBD8D9zcMoujfGbqbmHMrzjyk0Gxj3sGU
         tn1DS+onQwjuTbfpvA07zBSz1ldpHwGH7jCiU9KtPY0YbM2yttM1vXrzrAJ7teh7ydfM
         1uNe95m4Dz4/QW+NF8yyf4QDSIeIUeEZ8oW01up/0jkvbCmB6xF6lr2hrWtnWf93vD+i
         mjrSXpFY8RKplLftsddf9M/zFiBhO4k9nwTuh7YwCcVIx+9fS3M+zNLf02ypqfhP/yN6
         Ri8SJXnzFaMvEQ+8XzLBEblqkP2XLAJRfnYDrtGLq9i7T6BmSTD9KxUWiyJqywi7sfIK
         68PA==
X-Gm-Message-State: AOJu0YwWPxDk+7vAau0RAPh3xi7AKgOY+8bxjfMeQ0JnqghNl1cWn3JY
	U3OfS5pCnZOt5HduU5g2b7Jd6qI+Bg8m0DpbiOgeaRlBKU5cUHhRlhHBN9N5p1cY9dWhO83cm0i
	pZ8fI
X-Gm-Gg: ASbGncvRjh4ULUGiNmb4K5eg+ajglENdUWgkpFQwL8fc349b4zT6k/pZaqaQRRAQXYk
	EamiPzGPHNkrysW2RYXLNlqvcHqU3vBmR2k1KgEsRutdDSs3/kQh3E5oVNiuDZ7PrcIiXh27YLs
	f1HCoaajLcEYjNnftoV0YpMPUxqfsiY//iXJKiIEJOPiHDmIL3ItmGqMkPfUYgXPKBXOqVLn+Rf
	LxCvaQGZ56unfWSdiCl8yzvhSvGIIAD8sOxDNuyMaYEee7IxZe+y++mYM86C0c6Irdpd5Fg6LD4
	ULnmiiL+ikKADZiQuzwSI0JLwB2esG2OLuks0b9BCDfDjHN4nk0m3g==
X-Google-Smtp-Source: AGHT+IFrq/9qrvaldVRH76tqwh/LHPGBIycLwgdZi3dvwD7VwQxlYuo7nhOzDaNt0elQe+ILE6O7eg==
X-Received: by 2002:a17:902:ce06:b0:224:10a2:cae7 with SMTP id d9443c01a7336-23ddb31207dmr14330745ad.40.1752029507293;
        Tue, 08 Jul 2025 19:51:47 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:a6e1:d218:3fcc:fd7d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c845922b5sm121979075ad.199.2025.07.08.19.51.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 19:51:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/12] linux-yocto/6.6: update to v6.6.94
Date: Tue,  8 Jul 2025 19:51:21 -0700
Message-ID: <e92b90ade0b0c3bbb4e2a9d29c7b85e32a161279.1752029282.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752029282.git.steve@sakoman.com>
References: <cover.1752029282.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 02:51:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220067

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    6282921b6825 Linux 6.6.94
    d0e22b854ac6 drm/meson: Use 1000ULL when operating with mode->clock
    65e20c5d99d1 net: usb: aqc111: debug info before sanitation
    0fcfc93576bc regulator: dt-bindings: mt6357: Drop fixed compatible requirement
    1380f68517a7 calipso: unlock rcu before returning -EAFNOSUPPORT
    2cfcbe1554c1 x86/iopl: Cure TIF_IO_BITMAP inconsistencies
    8884c41bae39 xen/arm: call uaccess_ttbr0_enable for dm_op hypercall
    b0e35d563917 usb: typec: tcpm/tcpci_maxim: Fix bounds check in process_rx()
    3c7e52cfa86d usb: Flush altsetting 0 endpoints before reinitializating them after reset.
    c40b5e0aad1f usb: cdnsp: Fix issue with detecting USB 3.2 speed
    81dc3db4c3ac usb: cdnsp: Fix issue with detecting command completion event
    6e3af836805e VMCI: fix race between vmci_host_setup_notify and vmci_ctx_unset_notify
    97f5b57eca7d usb: usbtmc: Fix read_stb function and get_stb ioctl
    b0630d18451a kbuild: Disable -Wdefault-const-init-unsafe
    2c72fe18cc5f posix-cpu-timers: fix race between handle_posix_cpu_timers() and posix_cpu_timer_del()
    99bc5248a479 Revert "io_uring: ensure deferred completions are posted for multishot"
    029d39ae7ecf io_uring/rw: fix wrong NOWAIT check in io_rw_init_file()
    62d5d980b513 io_uring/rw: allow pollable non-blocking attempts for !FMODE_NOWAIT
    90e11232a62b io_uring: add io_file_can_poll() helper
    4fa7831cf0ac HID: usbhid: Eliminate recurrent out-of-bounds bug in usbhid_parse()
    dd4b8e05f2a2 ALSA: usb-audio: Add implicit feedback quirk for RODE AI-1
    37a75cd83dde tools/resolve_btfids: Fix build when cross compiling kernel with clang.
    c9a2e81583d9 block: Fix bvec_set_folio() for very large folios
    9e263d94593b bio: Fix bio_first_folio() for SPARSEMEM without VMEMMAP
    51c695986fa1 perf: Ensure bpf_perf_link path is properly serialized
    efcd52ba648b nvmet-fcloop: access fcpreq only when holding reqlock
    84ead78a3cf8 fs/filesystems: Fix potential unsigned integer underflow in fs_name()
    0383b25488a5 net_sched: ets: fix a race in ets_qdisc_change()
    057f7a61b04b net_sched: tbf: fix a race in tbf_change()
    2a71924ca4af net_sched: red: fix a race in __red_change()
    46c15c9d0f65 net_sched: prio: fix a race in prio_tune()
    77a72d749701 net/mlx5e: Fix leak of Geneve TLV option object
    a810e484778d net/mlx5: Fix return value when searching for existing flow group
    5953ae44dfe5 net/mlx5: Fix ECVF vports unload on shutdown flow
    7fb33ed59867 net/mlx5: Ensure fw pages are always allocated on same NUMA
    3c40cfcbf18a Bluetooth: MGMT: Fix sparse errors
    c621211b3088 Bluetooth: hci_sync: Fix broadcast/PA when using an existing instance
    4bf299105706 Bluetooth: Fix NULL pointer deference on eir_get_service_data
    abb0605ca009 net/mdiobus: Fix potential out-of-bounds clause 45 read/write access
    bab6bca0834c net/mdiobus: Fix potential out-of-bounds read/write access
    7bafe26d7314 macsec: MACsec SCI assignment for ES = 0
    ff55c85a923e net: Fix TOCTOU issue in sk_is_readable()
    c6dad167aade ACPI: CPPC: Fix NULL pointer dereference when nosmp is used
    987c3b8859d6 i40e: retry VFLR handling if there is ongoing VF reset
    dd184939f41e i40e: return false from i40e_reset_vf if reset is in progress
    dc5fc562f1c4 drm/meson: fix more rounding issues with 59.94Hz modes
    81331229971a drm/meson: use vclk_freq instead of pixel_freq in debug print
    e9a5fe781748 drm/meson: fix debug log statement when setting the HDMI clocks
    1f8d03fb90ed drm/meson: use unsigned long long / Hz for frequency types
    d2fc85c90b41 powerpc/vas: Return -EINVAL if the offset is non-zero in mmap()
    8635e325b85d powerpc/powernv/memtrace: Fix out of bounds issue in memtrace mmap
    b4e9bab6011b net_sched: sch_sfq: fix a potential crash on gso_skb handling
    d4cbcf274c51 scsi: iscsi: Fix incorrect error path labels for flashnode operations
    581b7c3d8025 pinctrl: qcom: pinctrl-qcm2290: Add missing pins
    de2adfaa9514 regulator: max20086: Fix refcount leak in max20086_parse_regulators_dt()
    6e329771144c wifi: ath11k: validate ath11k_crypto_mode on top of ath11k_core_qmi_firmware_ready
    e8e405757004 wifi: ath11k: don't wait when there is no vdev started
    a0ec9e39cbf7 wifi: ath11k: don't use static variables in ath11k_debugfs_fw_stats_process()
    e57c74d76076 wifi: ath11k: avoid burning CPU in ath11k_debugfs_fw_stats_request()
    452f55761513 wifi: ath11k: convert timeouts to secs_to_jiffies()
    d66fd9591ff4 wifi: ath11k: fix soc_dp_stats debugfs file permission
    748da2fc1c3c ath10k: snoc: fix unbalanced IRQ enable in crash recovery
    259119595227 ptp: remove ptp->n_vclocks check logic in ptp_vclock_in_use()
    bdd56875c692 Bluetooth: MGMT: Protect mgmt_pending list with its own lock
    5e64376da212 Bluetooth: MGMT: Remove unused mgmt_pending_find_data
    9f66b6531c2b Bluetooth: MGMT: Fix UAF on mgmt_remove_adv_monitor_complete
    6edb171845ed Bluetooth: hci_core: fix list_for_each_entry_rcu usage
    21f071261f94 scsi: core: ufs: Fix a hang in the error handler
    44ab21d74f61 serial: sh-sci: Clean sci_ports[0] after at earlycon exit
    9d50955bf215 serial: sh-sci: Move runtime PM enable to sci_probe_single()
    f8f07ea23116 serial: sh-sci: Check if TX data was written to device in .tx_empty()
    6b60251cab3f arm64: dts: ti: k3-j721e-sk: Add DT nodes for power regulators
    9333ced86ca7 arm64: dts: ti: k3-j721e-sk: Add support for multiple CAN instances
    b18568bae6c7 arm64: dts: ti: k3-j721e-sk: Model CSI2RX connector mux
    1e3db0a98cbd arm64: dts: ti: k3-am65-main: Add missing taps to sdhci0
    869aafe49c6b arm64: dts: ti: k3-am65-main: Fix sdhci node properties
    c789d2c138ca kasan: use unchecked __memset internally
    91d14d9961b7 Input: synaptics-rmi - fix crash with unsupported versions of F34
    73b8f31337fb pmdomain: core: Fix error checking in genpd_dev_pm_attach_by_id()
    4f091ad0862b do_change_type(): refuse to operate on unmounted/not ours mounts
    3d1ea8e048ac fix propagation graph breakage by MOVE_MOUNT_SET_GROUP move_mount(2)
    3b699b94727a path_overmount(): avoid false negatives
    3aed255ae4a3 ASoC: ti: omap-hdmi: Re-add dai_link->platform to fix card init
    cc03c899e6d9 ASoC: Intel: avs: Verify content returned by parse_int_array()
    ea739a5492bd ASoC: Intel: avs: Fix deadlock when the failing IPC is SET_D0IX
    9836cc310ec1 ASoC: codecs: hda: Fix RPM usage count underflow
    0fd2ae401720 scsi: ufs: qcom: Prevent calling phy_exit() before phy_init()
    d2507aeea45b seg6: Fix validation of nexthop addresses
    8c9e9cd39877 wireguard: device: enable threaded NAPI
    a21a4937726f net: dsa: b53: allow RGMII for bcm63xx RGMII ports
    02c03865d26a net: dsa: b53: do not enable RGMII delay on bcm63xx
    1c7a023b0cc9 netfilter: nf_nat: also check reverse tuple to obtain clashing entry
    39bab2d3517b netfilter: nf_set_pipapo_avx2: fix initial map fill
    7f6265fce3bd gve: add missing NULL check for gve_alloc_pending_packet() in TX DQO
    9c49728b61e1 PM: sleep: Fix power.is_suspended cleanup for direct-complete devices
    c07c61ef703a vmxnet3: correctly report gso type for UDP tunnels
    cc89f457d913 net: wwan: t7xx: Fix napi rx poll issue
    85eef1748c02 net: fix udp gso skb_segment after pull from frag_list
    b263088ee8ab net: stmmac: make sure that ptp_rate is not 0 before configuring timestamping
    2e02edb66427 net: dsa: tag_brcm: legacy: fix pskb_may_pull length
    18e648163016 ice: fix rebuilding the Tx scheduler tree for large queue counts
    d78e538b65e4 ice: create new Tx scheduler nodes for new queues only
    1d3c5d0dec67 ice: fix Tx scheduler error handling in XDP callback
    55dd7225217c Bluetooth: L2CAP: Fix not responding with L2CAP_CR_LE_ENCRYPTION
    59d5f3134b5c spi: bcm63xx-hsspi: fix shared reset
    29abb7fc8244 spi: bcm63xx-spi: fix shared reset
    d88839739701 net: lan966x: Make sure to insert the vlan tags also in host mode
    1b2e54f447af net/mlx4_en: Prevent potential integer overflow calculating Hz
    2e3d96ad9549 driver: net: ethernet: mtk_star_emac: fix suspend/resume issue
    acab7ca5ff19 net: tipc: fix refcount warning in tipc_aead_encrypt
    633a80216a44 gve: Fix RX_BUFFERS_POSTED stat to report per-queue fill_cnt
    6ee70ca1fded net: stmmac: platform: guarantee uniqueness of bus_id
    7a8e87568575 vt: remove VT_RESIZE and VT_RESIZEX from vt_compat_ioctl()
    b3b4efa2e623 coresight: prevent deactivate active config while enabling the config
    e69e2cfd8b38 fpga: fix potential null pointer deref in fpga_mgr_test_img_load_sgt()
    32b3f3382d6c counter: interrupt-cnt: Protect enable/disable OPs with mutex
    72166de0a1a5 MIPS: Loongson64: Add missing '#interrupt-cells' for loongson64c_ls7a
    ec20928ecb1c iio: adc: ad7124: Fix 3dB filter frequency reading
    ca0012a63261 iio: filter: admv8818: Support frequencies >= 2^32
    786cdbd4da1b iio: filter: admv8818: fix range calculation
    61b3b2d62888 iio: filter: admv8818: fix integer overflow
    31fa7dd09a25 iio: filter: admv8818: fix band 4, state 15
    f2829faa3fd5 thunderbolt: Fix a logic error in wake on connect
    a6c7c365734c serial: Fix potential null-ptr-deref in mlb_usio_probe()
    db96a4fd8614 usb: renesas_usbhs: Reorder clock handling and power management in probe
    63df0a22dabc rtc: loongson: Add missing alarm notifications for ACPI RTC events
    56035627865e PCI/DPC: Initialize aer_err_info before using it
    b79e10050d9d dmaengine: ti: Add NULL check in udma_probe()
    127dfb4f1c5a phy: qcom-qmp-usb: Fix an NULL vs IS_ERR() bug
    248f52ad6e82 PCI: apple: Use gpiod_set_value_cansleep in probe flow
    004316d2de7e PCI: cadence: Fix runtime atomic count underflow
    92d879eff459 PCI: Print the actual delay time in pci_bridge_wait_for_secondary_bus()
    2e6d9128fe9b rtc: sh: assign correct interrupts with DT
    848d78e3625f cifs: Fix validation of SMB1 query reparse point response
    c050dc2669c2 nfs: ignore SB_RDONLY when remounting nfs
    c9d9a8995f69 nfs: clear SB_RDONLY before getting superblock
    7101de239633 perf trace: Always print return value for syscalls returning a pid
    494395071e85 perf record: Fix incorrect --user-regs comments
    5ec729bc5b03 perf tests switch-tracking: Fix timestamp comparison
    a20bbd91622f mfd: stmpe-spi: Correct the name used in MODULE_DEVICE_TABLE
    611efa317b70 mfd: exynos-lpass: Avoid calling exynos_lpass_disable() twice in exynos_lpass_remove()
    85322ddd449a rpmsg: qcom_smd: Fix uninitialized return variable in __qcom_smd_send()
    3b726bc12624 remoteproc: k3-r5: Drop check performed in k3_r5_rproc_{mbox_callback/kick}
    f1a3c8ceb21d remoteproc: qcom_wcnss_iris: Add missing put_device() on error in probe
    41581d392c81 perf scripts python: exported-sql-viewer.py: Fix pattern matching with Python 3
    53385a400af6 perf intel-pt: Fix PEBS-via-PT data_src
    1737865a12f8 perf trace: Fix leaks of 'struct thread' in set_filter_loop_pids()
    84126960357d dm-flakey: make corrupting read bios work
    1aef0e1083bb dm-flakey: error all IOs when num_features is absent
    4e9e45746b86 hwmon: (asus-ec-sensors) check sensor index in read_string()
    a0d9d9b5a463 mtd: nand: ecc-mxic: Fix use of uninitialized variable ret
    fde314445332 backlight: pm8941: Add NULL check in wled_configure()
    06f41679d35e dm: free table mempools if not used in __bind
    679d40ca030a dm: don't change md if dm_table_set_restrictions() fails
    e431cc956d67 perf ui browser hists: Set actions->thread before calling do_zoom_thread()
    34e124dc2189 perf build: Warn when libdebuginfod devel files are not available
    655d3c6f8ce7 randstruct: gcc-plugin: Fix attribute addition
    c64a16344c52 randstruct: gcc-plugin: Remove bogus void member
    ab91647acdf4 fbdev: core: fbcvt: avoid division by 0 in fb_cvt_hperiod()
    8312b1f776f7 soc: aspeed: Add NULL check in aspeed_lpc_enable_snoop()
    b828083b3d7d soc: aspeed: lpc: Fix impossible judgment condition
    fc5a7a966466 ARM: aspeed: Don't select SRAM
    e774ce479f62 arm64: dts: mt6359: Rename RTC node to match binding expectations
    5b91fc48dcbb arm64: dts: renesas: white-hawk-ard-audio: Fix TPU0 groups
    0d5dd35f7a73 arm64: dts: rockchip: disable unrouted USB controllers and PHY on RK3399 Puma with Haikou
    867dd8a356a1 arm64: defconfig: mediatek: enable PHY drivers
    978991404adc ARM: dts: qcom: apq8064 merge hw splinlock into corresponding syscon device
    9337a54bc620 ARM: dts: qcom: apq8064: add missing clocks to the timer node
    4ca90f54bc65 dt-bindings: vendor-prefixes: Add Liontron name
    4b23c46eb2d8 bus: fsl-mc: fix double-free on mc_dev
    8b8e2966477e nilfs2: do not propagate ENOENT error from nilfs_btree_propagate()
    9ab3008bf984 nilfs2: add pointer check for nilfs_direct_propagate()
    681a35b1dcf1 ocfs2: fix possible memory leak in ocfs2_finish_quota_recovery
    4f99357dadbf Squashfs: check return result of sb_min_blocksize
    2d4ad56428ed arm64: dts: ti: k3-j721e-common-proc-board: Enable OSPI1 on J721E
    38caeda97b5d arm64: tegra: Drop remaining serial clock-names and reset-names
    1aaffafdd44b arm64: dts: rockchip: Update eMMC for NanoPi R5 series
    850fd99f22fc arm64: dts: qcom: sda660-ifc6560: Fix dt-validate warning
    ac25c30462a5 arm64: dts: qcom: sdm660-lavender: Add missing USB phy supply
    6145c491d649 arm64: dts: mt6359: Add missing 'compatible' property to regulators node
    018324818ad5 arm64: dts: mediatek: mt6357: Drop regulator-fixed compatibles
    d6d756d3ea21 arm64: dts: imx8mn-beacon: Set SAI5 MCLK direction to output for HDMI audio
    2eb09d84a00a arm64: dts: imx8mm-beacon: Set SAI5 MCLK direction to output for HDMI audio
    7a276effd506 arm64: dts: imx8mp-beacon: Fix RTC capacitive load
    75b985ef1e64 arm64: dts: imx8mn-beacon: Fix RTC capacitive load
    986c6c52d4aa arm64: dts: imx8mm-beacon: Fix RTC capacitive load
    c8658f43df4f arm64: dts: qcom: sdm660-xiaomi-lavender: Add missing SD card detect GPIO
    62f142f9b863 arm64: dts: mediatek: mt8195: Reparent vdec1/2 and venc1 power domains
    8af84ebd27fc ARM: dts: at91: at91sam9263: fix NAND chip selects
    e6ef5b282e33 ARM: dts: at91: usb_a9263: fix GPIO for Dataflash chip select
    3c9472989031 arm64: dts: qcom: sc8280xp-x13s: Drop duplicate DMIC supplies
    b1253f7c65d1 arm64: dts: qcom: sm8250: Fix CPU7 opp table
    ac0df85cc591 arm64: dts: qcom: sm8350: Reenable crypto & cryptobam
    072b6f8e39ce arm64: dts: qcom: sdm845-starqltechn: remove excess reserved gpios
    618060fc563b arm64: dts: qcom: sdm845-starqltechn: refactor node order
    2bf235c5dddf arm64: dts: qcom: sdm845-starqltechn: fix usb regulator mistake
    8218e21030bd arm64: dts: qcom: sdm845-starqltechn: remove wifi
    c4f2f90ebbad f2fs: fix to correct check conditions in f2fs_cross_rename
    67b800b6d772 f2fs: use d_inode(dentry) cleanup dentry->d_inode
    857b4d2bbeb4 net: phy: mscc: Stop clearing the the UDPv4 checksum for L2 frames
    8ebcd311b486 net: openvswitch: Fix the dead loop of MPLS parse
    946bfdfcb76a calipso: Don't call calipso functions for AF_INET sk.
    5df8db01d6a4 octeontx2-pf: QOS: Refactor TC_HTB_LEAF_DEL_LAST callback
    0b40aeaf83ca net: phy: mscc: Fix memory leak when using one step timestamping
    6486f11ccef4 net: lan743x: rename lan743x_reset_phy to lan743x_hw_reset_phy
    4744a5d71d2a net: phy: fix up const issues in to_mdio_device() and to_phy_device()
    363fdf277742 net: phy: clear phydev->devlink when the link is deleted
    6f639c25bfad bpf: Avoid __bpf_prog_ret0_warn when jit fails
    8d5bc5ec6c94 net: lan966x: Fix 1-step timestamping over ipv4 or ipv6
    ac7897c01240 RDMA/cma: Fix hang when cma_netevent_callback fails to queue_work
    60790d287c1a net: usb: aqc111: fix error handling of usbnet read calls
    333262e5dd8c RISC-V: KVM: lock the correct mp_state during reset
    68b69b50dfba netfilter: nft_tunnel: fix geneve_opt dump
    4c6fa65ab2ae bpf, sockmap: Avoid using sk_socket after free when sending
    9c73afd7f1c9 Bluetooth: MGMT: iterate over mesh commands in mgmt_mesh_foreach()
    801677040bb2 vfio/type1: Fix error unwind in migration dirty bitmap allocation
    cf008d9a08a7 netfilter: nf_tables: nft_fib_ipv6: fix VRF ipv4/ipv6 result discrepancy
    1e8b2048f9e9 wifi: mt76: mt7996: fix RX buffer size of MCU event
    800f7e73a679 wifi: mt76: mt7996: set EHT max ampdu length capability
    e9f9cef1877a wifi: mt76: mt7915: Fix null-ptr-deref in mt7915_mmio_wed_init()
    6c81f1c7812c kernfs: Relax constraint in draining guard
    713b9bfa939d scsi: ufs: mcq: Delete ufshcd_release_scsi_cmd() in ufshcd_mcq_abort()
    5482ef9875ea wifi: ath9k_htc: Abort software beacon handling if disabled
    b5ef128926cd hisi_acc_vfio_pci: bugfix live migration function without VF device driver
    5be5cd86d1e9 hisi_acc_vfio_pci: add eq and aeq interruption restore
    f0423873e7ae hisi_acc_vfio_pci: fix XQE dma address error
    99dbad1b01d3 wifi: ath12k: fix memory leak in ath12k_service_ready_ext_event
    4b1cf1f040a0 iommu: remove duplicate selection of DMAR_TABLE
    74e18211c2c8 wifi: rtw88: fix the 'para' buffer size to avoid reading out of bounds
    f61b8fecec96 s390/bpf: Store backchain even for leaf progs
    fbd4d6293b53 clk: qcom: gcc-msm8939: Fix mclk0 & mclk1 for 24 MHz
    6d8f39875a10 bpf: Fix WARN() in get_bpf_raw_tp_regs
    eb435bc4c74a pinctrl: at91: Fix possible out-of-boundary access
    b44672c17ca0 libbpf: Use proper errno value in nlattr
    07680e38b78d ktls, sockmap: Fix missing uncharge operation
    94ade4147a09 tracing: Fix error handling in event_trigger_parse()
    ae015964d7ff tracing: Rename event_trigger_alloc() to trigger_data_alloc()
    3f7724fcc193 efi/libstub: Describe missing 'out' parameter in efi_load_initrd
    3c1adc2f8c73 clk: bcm: rpi: Add NULL check in raspberrypi_clk_register()
    012fd5987309 clk: qcom: gpucc-sm6350: Add *_wait_val values for GDSCs
    7c95e4a31fc4 clk: qcom: gcc-sm6350: Add *_wait_val values for GDSCs
    f2692b21774d clk: qcom: dispcc-sm6350: Add *_wait_val values for GDSCs
    a1383eb9d6c4 clk: qcom: camcc-sm6350: Add *_wait_val values for GDSCs
    ac7ab38c271b tracing: Move histogram trigger variables from stack to per CPU structure
    c60f57a49619 bpf: Fix uninitialized values in BPF_{CORE,PROBE}_READ
    7c4c84cdcc19 RDMA/mlx5: Fix error flow upon firmware failure for RQ destruction
    5e4519d8cdd8 netfilter: nft_quota: match correctly when the quota just depleted
    585c9ed565c5 netfilter: bridge: Move specific fragmented packet to slow_path instead of dropping it
    50bbbd25597d bpf: Allow XDP dev-bound programs to perform XDP_REDIRECT into maps
    1066c5a7d083 libbpf: Use proper errno value in linker
    1c005c53cf8e f2fs: fix to detect gcing page in f2fs_is_cp_guaranteed()
    43cec280496a f2fs: clean up w/ fscrypt_is_bounce_page()
    4b88a4dfbea0 bonding: assign random address if device address is same as bond
    8fa998b842f2 iommu: Protect against overflow in iommu_pgsize()
    cb4b9369463e Use thread-safe function pointer in libbpf_print
    79669facfe92 libbpf: Remove sample_period init in perf_buffer
    624b4cf6c49c scsi: hisi_sas: Call I_T_nexus after soft reset for SATA disk
    5edd80d4b9c8 RDMA/hns: Include hnae3.h in hns_roce_hw_v2.h
    be049199dec9 wifi: ath12k: fix node corruption in ar->arvifs list
    c9c9107ffa0e wifi: ath12k: Add MSDU length validation for TKIP MIC error
    f76f399004c6 wifi: rtw88: do not ignore hardware read error during DPK
    7b63e52a8bab wifi: rtw88: sdio: call rtw_sdio_indicate_tx_status unconditionally
    446fcc230d9f wifi: rtw88: sdio: map mgmt frames to queue TX_DESC_QSEL_MGMT
    6aa81fc0d67a xfrm: Use xdo.dev instead of xdo.real_dev
    18eb7b5f1e51 libbpf: Fix buffer overflow in bpf_object__init_prog
    0e9c13ed852e net: ncsi: Fix GCPS 64-bit member variables
    a39cc43efc1b f2fs: fix to do sanity check on sbi->total_valid_block_count
    a93db61dfa92 wifi: ath12k: Fix WMI tag for EHT rate in peer assoc
    db1d15a26f21 bpf, sockmap: Fix panic when calling skb_linearize
    34837ae8cded bpf, sockmap: fix duplicated data transmission
    2e36a81d388e bpf: fix ktls panic with sockmap
    7c969106a8ba selftests/bpf: Fix bpf_nf selftest failure
    b524baecb01b IB/cm: use rwlock for MAD agent lock
    f50ba7e7b607 wifi: ath11k: fix node corruption in ar->arvifs list
    3d6e3849b691 xen/x86: fix initial memory balloon target
    7810600b06cb drm/mediatek: mtk_drm_drv: Unbind secondary mmsys components on err
    a2502fd0fa9f drm/mediatek: Fix kobject put for component sub-drivers
    8126855798b0 drm/mediatek: mtk_drm_drv: Fix kobject put for mtk_mutex device ptr
    77511c2d2d1c perf/amlogic: Replace smp_processor_id() with raw_smp_processor_id() in meson_ddr_pmu_create()
    ee96502062ec scsi: qedf: Use designated initializer for struct qed_fcoe_cb_ops
    e500dff1e4e5 arm64/fpsimd: Do not discard modified SVE state
    99d4011a0a32 firmware: SDEI: Allow sdei initialization without ACPI_APEI_GHES
    3215e000eff6 drm/tegra: rgb: Fix the unbound reference count
    01f73e104288 drm/vkms: Adjust vkms_state->active_planes allocation type
    4715d2959d3b drm: rcar-du: Fix memory leak in rcar_du_vsps_init()
    5e99bcff7cb5 selftests/seccomp: fix syscall_restart test for arm compat
    cf08a1cba004 arm64: Support ARM64_VA_BITS=52 when setting ARCH_MMAP_RND_BITS_MAX
    0052f10c25e4 firmware: psci: Fix refcount leak in psci_dt_init
    569829f8fde0 m68k: mac: Fix macintosh_config for Mac II
    428d865fec68 watchdog: exar: Shorten identity name to fit correctly
    701340a25b1a fs/ntfs3: handle hdr_first_de() return value
    94be75619e8c drm/bridge: lt9611uxc: Fix an error handling path in lt9611uxc_probe()
    2f6e645ce64e arm64/fpsimd: Fix merging of FPSIMD state during signal return
    43be952e8854 arm64/fpsimd: Discard stale CPU state when handling SME traps
    8bf6491dab8c arm64/fpsimd: Avoid RES0 bits in the SME trap handler
    0d271c53009a media: rkvdec: Fix frame size enumeration
    cdf7e1ff99ab drm/amd/pp: Fix potential NULL pointer dereference in atomctrl_initialize_mc_reg_table
    079cc1fa46e0 drm/vc4: tests: Use return instead of assert
    83cc36371af8 drm/vmwgfx: Add seqno waiter for sync_files
    8b263e8ab2d3 ASoC: apple: mca: Constrain channels according to TDM mask
    42f7dd4bf5e0 spi: sh-msiof: Fix maximum DMA transfer size
    5174ac310ae7 ACPI: OSI: Stop advertising support for "3.0 _SCP Extensions"
    fca08cfadd45 PM: sleep: Print PM debug messages during hibernation
    aa7b90057bc3 x86/mtrr: Check if fixed-range MTRRs exist in mtrr_save_fixed_ranges()
    2b5459380613 PM: wakeup: Delete space in the end of string shown by pm_show_wakelocks()
    5b71469d77fd ASoC: SOF: ipc4-pcm: Adjust pipeline_list->pipelines allocation type
    d46af758f63d power: reset: at91-reset: Optimize at91_reset()
    c6c142267952 spi: tegra210-quad: modify chip select (CS) deactivation
    41de2c9e30b7 spi: tegra210-quad: remove redundant error handling code
    04034d43e9b6 spi: tegra210-quad: Fix X1_X2_X4 encoding and support x4 transfers
    3ff2422442de EDAC/{skx_common,i10nm}: Fix the loss of saved RRL for HBM pseudo channel 0
    3f5d06590009 EDAC/skx_common: Fix general protection fault
    4191b7669e00 ASoC: tas2764: Enable main IRQs
    8b94e19adae3 ACPICA: exserial: don't forget to handle FFixedHW opregions for reading
    f6941e72d352 kunit: Fix wrong parameter to kunit_deactivate_static_stub()
    5810e9d402c4 crypto: sun8i-ce - move fallback ahash_request to the end of the struct
    04a39a3c7d37 crypto: xts - Only add ecb if it is not already there
    ba2af6855c4d crypto: lrw - Only add ecb if it is not already there
    ec91ab135cf0 rcu/cpu_stall_cputime: fix the hardirq count for x86 architecture
    402fd6a6fe57 btrfs: scrub: fix a wrong error type when metadata bytenr mismatches
    7cfb9086b6d3 btrfs: scrub: update device stats when an error is detected
    3cf4d9cae435 crypto: marvell/cesa - Avoid empty transfer descriptor
    5e9666ac8b94 crypto: marvell/cesa - Handle zero-length skcipher requests
    62af7780054f x86/cpu: Sanitize CPUID(0x80000000) output
    ce167ff4cd17 x86/microcode/AMD: Do not return error when microcode update is not necessary
    4fb22310892c powerpc/crash: Fix non-smp kexec preparation
    fdc39b3ad8a7 powerpc: do not build ppc_save_regs.o always
    cb1e26f53e59 crypto: sun8i-ss - do not use sg_dma_len before calling DMA functions
    c62b79c1c513 crypto: sun8i-ce-cipher - fix error handling in sun8i_ce_cipher_prepare()
    6ce08b3ba52c perf/core: Fix broken throttling when max_samples_per_tick=1
    eec0dd17db02 gfs2: gfs2_create_inode error handling fix
    76c7b1407a7a crypto: sun8i-ce-hash - fix error handling in sun8i_ce_hash_run()
    5dea6398f2dd x86/idle: Remove MFENCEs for X86_BUG_CLFLUSH_MONITOR in mwait_idle_with_hints() and prefer_mwait_c1_over_halt()
    cc5cd8a1719e tools/x86/kcpuid: Fix error handling
    e9019e2214fa Revert "drm/amd/display: more liberal vmin/vmax update for freesync"
    9f837b359d1c dt-bindings: phy: imx8mq-usb: fix fsl,phy-tx-vboost-level-microvolt property
    68c504243737 dt-bindings: usb: cypress,hx3: Add support for all variants
    5a057f261539 thunderbolt: Do not double dequeue a configuration request
    259e4d6e10cd usb: usbtmc: Fix timeout value in get_stb
    3258d7ff8ebf serial: jsm: fix NPE during jsm_uart_port_init
    e2e38c5211b1 Bluetooth: hci_qca: move the SoC type check to the right place
    b63f23fb0ad2 usb: typec: ucsi: fix Clang -Wsign-conversion warning
    5ec1200da929 USB: serial: pl2303: add new chip PL2303GC-Q20 and PL2303GT-2AB
    ff835ab115f0 usb: storage: Ignore UAS driver for SanDisk 3.2 Gen2 storage device
    73c50fa3ff02 usb: quirks: Add NO_LPM quirk for SanDisk Extreme 55AE
    32a5f643ce54 rtc: Fix offset calculation for .start_secs < 0
    b836d94be852 rtc: Make rtc_time64_to_tm() support dates before 1970
    dbd568a30597 acpi-cpufreq: Fix nominal_freq units to KHz in get_max_boost_ratio()
    39ed85ae485d pinctrl: armada-37xx: set GPIO output value before setting direction
    8f0f45a31215 pinctrl: armada-37xx: use correct OUTPUT_VAL register for GPIOs > 31
    4afa9d57ed5e tracing: Fix compilation warning on arm32

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index d9937c2f73..06146fb3f7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c39ccd8635d045d2fb41df620e389b14224822bd"
-SRCREV_meta ?= "2ad3db8c94fece927ad59267524d42ac6353b137"
+SRCREV_machine ?= "27bfdf2a5a0230142c8bd610d0f6d029b32b874c"
+SRCREV_meta ?= "c5e24825003b998f786b65f6e397904a50daa66c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.93"
+LINUX_VERSION ?= "6.6.94"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 3c9dea9fcc..fd5b1467bd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.93"
+LINUX_VERSION ?= "6.6.94"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "467bfb36ac1bc218abb76541fd702ad01cf2b08f"
-SRCREV_meta ?= "2ad3db8c94fece927ad59267524d42ac6353b137"
+SRCREV_machine ?= "1843bb6576a42f208754285f170a824c6777e15b"
+SRCREV_meta ?= "c5e24825003b998f786b65f6e397904a50daa66c"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 2c9dfec885..5683c9b861 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "28044337d9d2d6fd8ce6dea661ddc35284d69299"
-SRCREV_machine:qemuarm64 ?= "2765162684e8e1e08c832efb20e946b033ece5ae"
-SRCREV_machine:qemuloongarch64 ?= "dbc28205654b693ad9557f6ed0387b33eb9b1766"
-SRCREV_machine:qemumips ?= "3fd113a19fa0301bdde9411662c460be81bfd054"
-SRCREV_machine:qemuppc ?= "a687cdebe38217504d5077460e25c16684412f37"
-SRCREV_machine:qemuriscv64 ?= "dbc28205654b693ad9557f6ed0387b33eb9b1766"
-SRCREV_machine:qemuriscv32 ?= "dbc28205654b693ad9557f6ed0387b33eb9b1766"
-SRCREV_machine:qemux86 ?= "dbc28205654b693ad9557f6ed0387b33eb9b1766"
-SRCREV_machine:qemux86-64 ?= "dbc28205654b693ad9557f6ed0387b33eb9b1766"
-SRCREV_machine:qemumips64 ?= "7eaf772c836fa74ce0a5b0cc8135dd578715e6f4"
-SRCREV_machine ?= "dbc28205654b693ad9557f6ed0387b33eb9b1766"
-SRCREV_meta ?= "2ad3db8c94fece927ad59267524d42ac6353b137"
+SRCREV_machine:qemuarm ?= "78cd415ed1379770d897a235b1af4dee842b551a"
+SRCREV_machine:qemuarm64 ?= "84e1934158c201425a17e5b42e1ca1b3b2186ffb"
+SRCREV_machine:qemuloongarch64 ?= "a05382452c269c3c3bd7b593e5e44ef817fe3d5e"
+SRCREV_machine:qemumips ?= "0edc239358dfb8fa8147dd27df814d6200c852d1"
+SRCREV_machine:qemuppc ?= "ff8bafa847fbe675cc041d2b99a6ae2f476ef459"
+SRCREV_machine:qemuriscv64 ?= "a05382452c269c3c3bd7b593e5e44ef817fe3d5e"
+SRCREV_machine:qemuriscv32 ?= "a05382452c269c3c3bd7b593e5e44ef817fe3d5e"
+SRCREV_machine:qemux86 ?= "a05382452c269c3c3bd7b593e5e44ef817fe3d5e"
+SRCREV_machine:qemux86-64 ?= "a05382452c269c3c3bd7b593e5e44ef817fe3d5e"
+SRCREV_machine:qemumips64 ?= "37ef59b7c4942d3c54938ef6a34a13977a741e0d"
+SRCREV_machine ?= "a05382452c269c3c3bd7b593e5e44ef817fe3d5e"
+SRCREV_meta ?= "c5e24825003b998f786b65f6e397904a50daa66c"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "c2603c511feb427b2b09f74b57816a81272932a1"
+SRCREV_machine:class-devupstream ?= "6282921b6825fef6a1243e1c80063421d41e2576"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.93"
+LINUX_VERSION ?= "6.6.94"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


