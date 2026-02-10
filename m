Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 582F6E9463B
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 03:14:41 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12095.1770693278965925508
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 19:14:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R0VAIqXs;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8c70daf9c94so359319585a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 19:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770693277; x=1771298077; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IwmvgjbQfhLi2fQ2Mare+YLcEww0VAMOG4Z4I6fuvKc=;
        b=R0VAIqXs7IedBoPjyFVzSmqGO9MWAePO3XCtvgABA4gxRZ49HZoert/a4UJak6ZPrF
         GMl5prmALM5Q36h9APe2LMYSSSVDEqLynwL9V14vJtp1J+8DQn1gBt6yfsnyslFNP+0f
         MIhjy6s9KideJwzkD2QfNGaDdp/lq8p5aV7708DL1KeMbEDfbEXgCZbsLTIGqvUqM0KP
         DSCUP83s4Rpgy4ZZyzsVUmrfAzIrIBEs8ye6fTSFnIxkHE1BWO6uhSF1jst755MzJZ4x
         SZ7kJxYE9m27tiu185zQpNlVeL4lRg1pIRpfeKHdtGdS+NTfICppNbqL931MlET1j743
         qY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770693277; x=1771298077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IwmvgjbQfhLi2fQ2Mare+YLcEww0VAMOG4Z4I6fuvKc=;
        b=iMCJjCQ1xhiykbC3RPd8BqZ8PBtZKh+82auJRLTaEFo6+hY2lmZULEFiEmX9D/P89D
         FPeVu7R4wMy6QTibI9t+3T74RybrjslPKG2f4r2n/mehRqxeC/D7En4jgMdGFB0KI8NK
         dhBF9azTdhDTaFns67+LTJ9bDafGgDuCY/0JttLQfkodjULHzT33i7A2LfzBytDv7AGD
         SVJKwCnISEdaifgslemj9GeswxmJPrHTdmBbudXqTeIjmVMrGTO+m22yLOs7zsGxTrHL
         mdn6xI0lE6AVRsdwtQVXII+AJSYQRrOEj9gCd2pIZyOiRjMtiBlzmEtQtp0NeCj72wal
         21Tg==
X-Gm-Message-State: AOJu0Ywf3K9OzPTTXWHxLbZ1U9GjX4iunx1nImEVp2jczRvGftliW98r
	9FFv7yzJ7eWQkkoTENFZBMDAZ9x8LJv2zF+n7dQQ3nSC1V27qcm5RBnbyQpnjzu/
X-Gm-Gg: AZuq6aL7v+XxBR3C4yyJfKtDxtTkBD2d7DBf9oNK7xuEocvyIm5d7q05OEfNXASDFro
	/YV4dkOAc+YWwVExKzM51l+XzyfRPSW6ZtZiRUa0K4Cw0qeKd9JNChu+Hv5/3V6J7XF8BsLg8po
	xTYpo0y3HQlwn2bWTryqVXX+JhSHDPugJiUcVeYFuTWyTaRmcXPOj5yuAkljKf5ydSRwOqxe4fP
	qcaJevTbATiThnVXZM+Gu/kBqmDue1cKBdxCAyMrcuf2jIIv33o5R7aq8sQmuUvsOpDqtQcigfd
	5AZ6SrSLV2wM9MRaFhJwYzxUuzy+BY3EI4/ktKyuS3zZQlFYkNhTvo0x6DODAk+07CvuHR3aH3e
	AYBj44W9zpuez73lt+kkDxaFcdJyRKCEvh63noPF5cN+Sw1f5SaCDMGrdyb8vX+qYgGVVxXISEK
	rA1iHb5/63sxJWWzvtAWEbB6ncELBRfuq0pvZnbygpVmbAEEmoom87Ppt4PKqBPaqWobDyJymHl
	XV5WWZRVXo/etiHRnj1v5ey+N2E15q479e/7aXc0ejpsfhgUvT6hsR4o44=
X-Received: by 2002:a05:620a:28c5:b0:8ca:3854:8110 with SMTP id af79cd13be357-8caf130789cmr1803981685a.72.1770693276977;
        Mon, 09 Feb 2026 19:14:36 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9a157f8sm955632785a.30.2026.02.09.19.14.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 19:14:36 -0800 (PST)
From: bruce.ashfield@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [meta][scarthgap][PATCH 07/07] linux-yocto/6.6: update to v6.6.123
Date: Mon,  9 Feb 2026 22:14:24 -0500
Message-ID: <20260210031424.1346685-7-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210031424.1346685-1-bruce.ashfield@gmail.com>
References: <20260210031424.1346685-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 03:14:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230841

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    c56aaf1a85ae9 Linux 6.6.123
    7e0d31c47b8a9 bpf/selftests: test_select_reuseport_kern: Remove unused header
    5a530c8ead06e Revert "net: Remove conditional threaded-NAPI wakeup based on task state."
    507692c056363 Revert "net: Allow to use SMP threads for backlog NAPI."
    dd4c7800a905d drm/amd/display: use udelay rather than fsleep
    572777a258c04 ptr_ring: do not block hard interrupts in ptr_ring_resize_multiple()
    1891abe832cbf ksmbd: fix recursive locking in RPC handle list access
    b6978c565ce33 xsk: Fix race condition in AF_XDP generic RX path
    c74e2dbb53168 drm/amdgpu: fix NULL pointer dereference in amdgpu_gmc_filter_faults_remove
    a3f75ee1a436e drm/amdkfd: Don't use sw fault filter if retry cam enabled
    21bad75012f76 pinctrl: qcom: sm8350-lpass-lpi: Merge with SC7280 to fix I2S2 and SWR TX pins
    38a0f2215aee4 mptcp: avoid dup SUB_CLOSED events after disconnect
    73408fa92742b writeback: fix 100% CPU usage when dirtytime_expire_interval is 0
    d84a4836dc246 perf: sched: Fix perf crash with new is_user_task() helper
    e57bda247f29c drm/msm/a6xx: fix bogus hwcg register updates
    e228ad913b0d2 pinctrl: lpass-lpi: implement .get_direction() for the GPIO driver
    daf8a4eb70ff4 ALSA: usb-audio: Fix missing unlock at error path of maxpacksize check
    db24153fc77a8 net/sched: act_ife: convert comma to semicolon
    1d14f86e813f6 btrfs: prevent use-after-free on page private data in btrfs_subpage_clear_uptodate()
    9d0ed508a9e2a drm/radeon: delete radeon_fence_process in is_signaled, no deadlock
    e26235840fd96 team: Move team device type change at the end of team_port_add
    27ca8004ba93a wifi: ath11k: add srng->lock for ath11k_hal_srng_* in monitor mode
    fb2b9a1e85bdd wifi: mac80211: move TDLS work to wiphy work
    6b615a8fb3af0 ksmbd: Fix race condition in RPC handle list access
    d1bda2ab0cf95 drm/amdgpu: Replace Mutex with Spinlock for RLCG register access to avoid Priority Inversion in SRIOV
    4d1e9a4a450aa ksmbd: smbd: fix dma_unmap_sg() nents
    143980bd2be75 mei: trace: treat reg parameter as string
    ce820dd4e6e2d arm64/fpsimd: signal: Fix restoration of SVE context
    40b73f0519d3c arm64/fpsimd: signal: Consistently read FPSIMD context
    15110f9cdc877 arm64/fpsimd: signal: Mandate SVE payload for streaming-mode state
    e527e695fdfc1 mm/kfence: randomize the freelist on initialization
    38c32baf6d2c7 gpio: rockchip: Stop calling pinctrl for set_direction
    e618b52a1589a drm/amdgpu/gfx11: fix wptr reset in KGQ init
    c61c93218956c drm/amdgpu/gfx10: fix wptr reset in KGQ init
    cbf4d79e5c619 drm/amdgpu/soc21: fix xclk for APUs
    9a15d3fdc22d4 drm/imx/tve: fix probe device leak
    cdaf07ec0b698 scripts: generate_rust_analyzer: Add compiler_builtins -> core dep
    884b2590ffcc7 flex_proportions: make fprop_new_period() hardirq safe
    4bed436cdef70 selftests: mptcp: join: fix local endp not being tracked
    ba58cd70a4223 selftests: mptcp: check subflow errors in close events
    8b5061c3400a7 selftests: mptcp: check no dup close events after error
    d761d42be060b mptcp: only reset subflow errors when propagated
    510a16f1c5c16 efivarfs: fix error propagation in efivar_entry_get()
    a9c96f113a5f3 scsi: qla2xxx: edif: Fix dma_free_coherent() size
    122751f43f930 gpio: pca953x: mask interrupts in irq shutdown
    c2fc0aae3cf42 ASoC: amd: yc: Add DMI quirk for Acer TravelMate P216-41-TCO
    441d129ba899e scsi: be2iscsi: Fix a memory leak in beiscsi_boot_get_sinfo()
    28a1e5e97c899 ASoC: fsl: imx-card: Do not force slot width to sample width
    018e9e9cae7b3 rust: kbuild: give `--config-path` to `rustfmt` in `.rsi` target
    929e568a83da5 riscv: compat: fix COMPAT_UTS_MACHINE definition
    8519c9231ce23 pinctrl: meson: mark the GPIO controller as sleeping
    be1cebabb3cd2 dma/pool: distinguish between missing and exhausted atomic pools
    0368794dc28a1 gpiolib: acpi: use BIT_ULL() for u64 mask in address space handler
    2f45c46661911 ASoC: Intel: sof_es8336: fix headphone GPIO logic inversion
    ac3a2ea06f3c8 scsi: firewire: sbp-target: Fix overflow in sbp_make_tpg()
    0d434670eb0bb net/mlx5e: Skip ESN replay window setup for IPsec crypto offload
    e43fdee29a96f net: bridge: fix static key check
    546eba0b10989 nfc: nci: Fix race between rfkill and nci_unregister_device().
    970526dde3686 net/mlx5e: Account for netdev stats in ndo_get_stats64
    e014f11f741be net/mlx5e: Report rx_discards_phy via rx_dropped
    62e1d8920f692 net/mlx5e: TC, delete flows only for existing peers
    fd30aa82df73b ice: stop counting UDP csum mismatch as rx_errors
    f8d002626d434 nfc: llcp: Fix memleak in nfc_llcp_send_ui_frame().
    d448bf96889f1 rocker: fix memory leak in rocker_world_port_post_fini()
    2a0522f564acd net: wwan: t7xx: fix potential skb->frags overflow in RX path
    96595848c6fd6 ipv6: use the right ifindex when replying to icmpv6 from localhost
    509b526d64290 net: mvpp2: cls: Fix memory leak in mvpp2_ethtool_cls_rule_ins()
    8c0be3277e7ae bonding: annotate data-races around slave->last_rx
    5058d3f8f1720 octeon_ep: Fix memory leak in octep_device_setup()
    724c9d346a3ac net: bcmasp: fix early exit leak with fixed phy
    923379f1d7e3a can: gs_usb: gs_usb_receive_bulk_callback(): fix error message
    dc5d1eb935be0 net/mlx5: Fix memory leak in esw_acl_ingress_lgcy_setup()
    186d147cf7689 Bluetooth: hci_uart: fix null-ptr-deref in hci_uart_write_work
    2cf6f68313dcc Linux 6.6.122
    96aa13ff68ef5 net: phy: fix phy_uses_state_machine()
    043aa41c43f8c net: phy: allow MDIO bus PM ops to start/stop state machine for phylink-controlled PHY
    b5a933535cc34 net: phy: move phy_link_change() prior to mdio_bus_phy_may_suspend()
    1e2848bda819a x86/fpu: Clear XSTATE_BV[i] in guest XSAVE state whenever XFD[i]=1
    8db5de0cf02fc wifi: ath11k: fix RCU stall while reaping monitor destination ring
    8d2979b9bb1be drm/amdgpu: csa unmap use uninterruptible lock
    7d52c592cf53f fs/ntfs3: Initialize allocated memory before use
    1067361a1cc6a ksmbd: fix use-after-free in ksmbd_session_rpc_open
    17fbad93879e8 usbnet: Fix using smp_processor_id() in preemptible code warnings
    8120e420013d9 NFSD: fix race between nfsd registration and exports_proc
    d89f3037d54d3 nvme: fix PCIe subsystem reset controller state transition
    7dfb39b0186dd nvme-pci: do not directly handle subsys reset fallout
    ca88419cf0623 nvme-fc: rename free_ctrl callback to match name pattern
    f83824b023c75 ASoC: codecs: wsa883x: fix unnecessary initialisation
    0ded4420b54e9 ASoC: codecs: wsa881x: fix unnecessary initialisation
    ea2474ea2eef4 ASoC: codecs: wsa881x: Drop unused version readout
    ebae26dd15140 phy: rockchip: inno-usb2: Fix a double free bug in rockchip_usb2phy_probe()
    479fab9aeade1 phy: phy-rockchip-inno-usb2: Use dev_err_probe() in the probe path
    d6705bcc5fe7c mm: kmsan: fix poisoning of high-order non-compound pages
    4a04ff9cd816e mm/page_alloc: prevent pcp corruption with SMP=n
    93464499df42b dmaengine: stm32: dmamux: fix OF node leak on route allocation failure
    1a179ac01ff39 dmaengine: stm32: dmamux: fix device leak on route allocation
    041863dd410bd iio: adc: exynos_adc: fix OF populate on driver rebind
    91a756d22f048 ALSA: scarlett2: Fix buffer overflow in config retrieval
    6b20590c43538 arm64: dts: rockchip: remove redundant max-link-speed from nanopi-r4s
    fb3c1f24f3b7e mm/rmap: fix two comments related to huge_pmd_unshare()
    522e580524106 iio: core: add separate lockdep class for info_exist_lock
    31c3c9f3b1b9b iio: core: add missing mutex_destroy in iio_dev_release()
    5596ce564a8c3 mm/damon/sysfs-scheme: cleanup quotas subdirs on scheme dir setup failure
    e9711bd0e6481 mm/damon/sysfs-scheme: cleanup access_pattern subdirs on scheme dir setup failure
    adec5e1f9c99f can: esd_usb: esd_usb_read_bulk_callback(): fix URB memory leak
    4d3c2a1d4c7c3 bridge: mcast: Fix use-after-free during router port configuration
    8670b53b8ee91 bpf: Do not let BPF test infra emit invalid GSO types to stack
    1da48da947d0c selftests/bpf: Check for timeout in perf_link test
    526394af4e8ad migrate: correct lock ordering for hugetlb file folios
    59ff56992bba2 can: usb_8dev: usb_8dev_read_bulk_callback(): fix URB memory leak
    179f6f0cf5ae4 can: mcba_usb: mcba_usb_read_bulk_callback(): fix URB memory leak
    7c308f7530bff can: kvaser_usb: kvaser_usb_read_bulk_callback(): fix URB memory leak
    e9410fdd4d5f7 can: ems_usb: ems_usb_read_bulk_callback(): fix URB memory leak
    1b32339156035 irqchip/gic-v3-its: Avoid truncating memory addresses
    dd40d94ffd7c8 perf/x86/intel: Do not enable BTS for guests
    cad7003d951e8 pmdomain: imx8m-blk-ctrl: Remove separate rst and clk mask for 8mq vpu
    6384f7851838f platform/x86: hp-bioscfg: Fix automatic module loading
    bd8955337e376 netrom: fix double-free in nr_route_frame()
    43f233eb6e7b9 uacce: ensure safe queue release with state management
    4c042bc71474d uacce: implement mremap in uacce_vm_ops to return -EPERM
    9ab05cdcac354 uacce: fix isolate sysfs check condition
    d9031575a2f8a uacce: fix cdev handling in the cleanup path
    bf7785434b5d0 intel_th: fix device leak on output open()
    98ecbfb2598c9 tracing: Fix crash on synthetic stacktrace field usage
    2ddc09f6a0a22 slimbus: core: fix device reference leak on report present
    dd58835fba5d6 slimbus: core: fix runtime PM imbalance on report present
    d2846f8a89fd6 octeontx2: Fix otx2_dma_map_page() error return code
    8557bdd9af8dd arm64: Set __nocfi on swsusp_arch_resume()
    19b2c3f3ca1b4 arm64/fpsimd: signal: Allocate SSVE storage when restoring ZA
    7761d7801f40e wifi: rsi: Fix memory corruption due to not set vif driver data size
    5d0ab96350e06 wifi: mwifiex: Fix a loop in mwifiex_update_ampdu_rxwinsize()
    36e0bc5e8b282 wifi: ath12k: fix dma_free_coherent() pointer
    1928851334ecf wifi: ath10k: fix dma_free_coherent() pointer
    f2677d6e2bbc5 mmc: sdhci-of-dwcmshc: Prevent illegal clock reduction in HS200/HS400 mode
    bcb72b6a39e90 mmc: rtsx_pci_sdmmc: implement sdmmc_card_busy function
    7bff0156d13f0 ALSA: usb-audio: Fix use-after-free in snd_usb_mixer_free()
    a8c42d11b0526 ALSA: ctxfi: Fix potential OOB access in audio mixer handling
    cbe409f68380a iio: dac: ad5686: add AD5695R to ad5686_chip_info_tbl
    c2d6e00829cbf iio: chemical: scd4x: fix reported channel endianness
    9795fe80976f8 iio: adc: at91-sama5d2_adc: Fix potential use-after-free in sama5d2_adc driver
    8271e1860c7cd iio: adc: ad9467: fix ad9434 vref mask
    9e77ef924fe31 iio: accel: iis328dq: fix gain values
    c0ebc3d8ad6b5 of: platform: Use default match table for /firmware
    f4c270975fe1d of: fix reference count leak in of_alias_scan()
    2757f7748ce2d leds: led-class: Only Add LED to leds_list when it is fully ready
    93dfcc59b2bf3 x86: make page fault handling disable interrupts properly
    03710cebfc0bc net/sched: act_ife: avoid possible NULL deref
    d9d5f222558b4 vsock/virtio: cap TX credit to local buffer size
    17c9b158bc4d7 vsock/test: fix seqpacket message bounds test
    02f9af192b98d vsock/virtio: fix potential underflow in virtio_transport_get_credit()
    c70e99dd37163 net: openvswitch: fix data race in ovs_vport_get_upcall_stats
    77c6aa2c388e9 octeontx2-af: Fix error handling
    4ad32b1e0ca42 net: dsa: fix off-by-one in maximum bridge ID determination
    0efee0b992f28 bonding: provide a net pointer to __skb_flow_dissect()
    a142ae1c56131 selftests: net: amt: wait longer for connection before sending packets
    e206fb415db36 be2net: Fix NULL pointer dereference in be_cmd_get_mac_from_list
    baafbbc23d421 drm/amd/pm: Workaround SI powertune issue on Radeon 430 (v2)
    2c1fc0547a870 drm/amd/pm: Don't clear SI SMC table when setting power limit
    c378cdae46369 usbnet: limit max_mtu based on device's hard_mtu
    fad8f4ff7928f ipv6: annotate data-race in ndisc_router_discovery()
    fc8ba17fd3337 mISDN: annotate data-race around dev->work
    bfb030a377e05 net: hns3: fix the HCLGE_FD_AD_NXT_KEY error setting issue
    3a1601756a905 net: hns3: fix wrong GENMASK() for HCLGE_FD_AD_COUNTER_NUM_M
    42e16254f1d3e be2net: fix data race in be_get_new_eqd
    a111d1fb91ae3 net: hns3: fix data race in hns3_fetch_stats
    f1f9cfd2f46a7 netdevsim: fix a race issue related to the operation on bpf_bound_progs list
    7f523dd499b72 ALSA: usb: Increase volume range that triggers a warning
    408bfa8d70f79 scsi: qla2xxx: Sanitize payload size to prevent member overflow
    9fdc6f28d5e81 scsi: core: Wake up the error handler when final completions race against each other
    0df7ecb393db7 riscv: clocksource: Fix stimecmp update hazard on RV32
    1b47e6d3bc026 kconfig: fix static linking of nconf
    24f31be6ad705 regmap: Fix race condition in hwspinlock irqsave routine
    417cdfd9b9f98 spi: spi-sprd-adi: Fix double free in probe error path
    1a27bd3c6949f spi: sprd-adi: switch to use spi_alloc_host()
    74634f4a64897 spi: sprd: adi: Use devm_register_restart_handler()
    aa79a5a959c7c interconnect: debugfs: initialize src_node and dst_node to empty strings
    ce8d8a3368128 iio: adc: ad7280a: handle spi_setup() errors in probe()
    7673167fac932 iio: imu: st_lsm6dsx: fix iio_chan_spec for sensors without event detection
    85eb83694a91c io_uring/io-wq: check IO_WQ_BIT_EXIT inside work run loop
    eb5ff1025c921 platform/x86: hp-bioscfg: Fix kernel panic in GET_INSTANCE_ID macro
    29917c80aa96a platform/x86: hp-bioscfg: Fix kobject warnings for empty attribute names
    6484f43740cc9 comedi: Fix getting range information for subdevices 16 to 255
    bf843b0624d89 x86/kfence: avoid writing L1TF-vulnerable PTEs
    8adc31a561a55 arm64: dts: rockchip: Fix voltage threshold for volume keys for Pinephone Pro
    929229fdd116a arm64: dts: rockchip: remove dangerous max-link-speed from helios64
    f86264ec0e2b1 scsi: xen: scsiback: Fix potential memory leak in scsiback_remove()
    156284ab2f641 scsi: storvsc: Process unsupported MODE_SENSE_10
    21937a189daa8 Input: i8042 - add quirk for ASUS Zenbook UX425QA_UM425QA
    dcecb4269dd4b Input: i8042 - add quirks for MECHREVO Wujie 15X Pro
    93cbf6d80da2a Revert "nfc/nci: Add the inconsistency check between the input data length and count"
    9367b4709b528 w1: fix redundant counter decrement in w1_attach_slave_device()
    6a5820ecfa5a7 w1: therm: Fix off-by-one buffer overflow in alarms_store
    aaff8f3a35c9d comedi: dmm32at: serialize use of paged registers
    dce0865a5828a serial: 8250_pci: Fix broken RS485 for F81504/508/512
    b0a9609283a5c crypto: authencesn - reject too-short AAD (assoclen<8) to match ESP/ESN spec
    93b8635974fb0 net/sched: qfq: Use cl_is_active to determine whether class is active in qfq_rm_from_ag
    0686bedfed341 net/sched: Enforce that teql can only be used as root qdisc
    fcf8cd4654790 octeontx2: cn10k: fix RX flowid TCAM mask handling
    04ba6de6eff61 ipvlan: Make the addrs_lock be per port
    68e92085427c8 l2tp: avoid one data-race in l2tp_tunnel_del_work()
    0bb986d83922c veth: fix data race in veth_get_ethtool_stats
    1cc98b8887cab fou: Don't allow 0 for FOU_ATTR_IPPROTO.
    4170ec351e456 tools: ynl: Specify --no-line-number in ynl-regen.sh.
    f87b9b7a618c8 gue: Fix skb memleak with inner IP protocol 0.
    8a8a5a43fef4e amd-xgbe: avoid misleading per-packet error log
    e7e81abbcc562 sctp: move SCTP_CMD_ASSOC_SHKEY right after SCTP_CMD_PEER_INIT
    ce4352057fc5a can: gs_usb: gs_usb_receive_bulk_callback(): unanchor URL on usb_submit_urb() error
    4b37dc63957cb selftests: net: fib-onlink-tests: Convert to use namespaces by default
    8ba4cf99c61cd selftests/net: convert fib-onlink-tests.sh to run it in unique namespace
    80c881e53a4fa bonding: limit BOND_MODE_8023AD to Ethernet devices
    b66dfde203fb4 net: usb: dm9601: remove broken SR9700 support
    b36bbac746ee6 igc: fix race condition in TX timestamp read for register 0
    9a151fd0bd7d9 ice: Avoid detrimental cleanup for bond during interface stop
    a6a0dd00178ea ice: initialize ring_stats->syncp
    e635e5b7eac83 ata: libata: Print features also for ATAPI devices
    02fc7c01a35d3 ata: libata: Call ata_dev_config_lpm() for ATAPI devices
    1c6714932c3df ata: libata-core: Introduce ata_dev_config_lpm()
    557b62028c077 ata: libata: Add cpr_log to ata_dev_print_features() early return
    e2d46e0b76cab pmdomain: qcom: rpmhpd: Add MXC to SC8280XP
    f0070413c6580 dt-bindings: power: qcom,rpmpd: Add SC8280XP_MXC_AO
    230c9ed464eda dt-bindings: power: qcom-rpmpd: split RPMh domains definitions
    564752b42d137 dt-bindings: power: qcom,rpmpd: add Turbo L5 corner
    64a0b97df8366 dt-bindings: power: qcom,rpmpd: document the SM8750 RPMh Power Domains
    658e1879ebe68 dt-bindings: power: rpmpd: Update part number to X1E80100
    ce649f43c4936 dt-bindings: power: qcom,rpmpd: document the SM8650 RPMh Power Domains
    25ebc01125e60 dt-bindings: power: rpmpd: Add MSM8917, MSM8937 and QM215
    f33305f0925be dt-bindings: power: qcom,rpmpd: Add SM7150
    ce5ee09c0aeea btrfs: fix missing fields in superblock backup with BLOCK_GROUP_TREE
    774089dc718f5 Drivers: hv: Always do Hyper-V panic notification in hv_kmsg_dump()
    fe11f976dd0ad hyperv-tlfs: Change prefix of generic HV_REGISTER_* MSRs to HV_MSR_*
    11536f3371f4a arm64: dts: qcom: sc8280xp: Add missing VDD_MXC links
    8d9f22c570ba3 testptp: Add option to open PHC in readonly mode
    4f3c8c7f4e1bd selftest/ptp: update ptp selftest to exercise the gettimex options
    59ac47a0275fc ptp: add testptp mask test
    4fbfc6bca4e37 ptp: Add PHC file mode checks. Allow RO adjtime() without FMODE_WRITE.
    ba3a97c832725 posix-clock: Store file pointer in struct posix_clock_context
    ea2d9bfd422e9 Fix memory leak in posix_clock_open()
    221e4d1e29bb4 posix-clock: introduce posix_clock_context concept
    2c590e4b3d4cc io_uring: move local task_work in exit cancel loop
    99da896614d17 btrfs: fix deadlock in wait_current_trans() due to ignored transaction type
    696ebf74738b9 dmaengine: ti: k3-udma: fix device leak on udma lookup
    6fdf168f57e33 dmaengine: ti: dma-crossbar: fix device leak on am335x route allocation
    8df7c3e6d1e5e dmaengine: ti: dma-crossbar: fix device leak on dra7x route allocation
    4e45ae701b816 dmaengine: sh: rz-dmac: Fix rz_dmac_terminate_all()
    6bf4ef078fd11 dmaengine: qcom: gpi: Fix memory leak in gpi_peripheral_config()
    9fba97baa520c dmaengine: lpc18xx-dmamux: fix device leak on route allocation
    c81ea0222eaaa dmaengine: idxd: fix device leaks on compat bind and unbind
    db7c79c1bbfb1 dmaengine: dw: dmamux: fix OF node leak on route allocation failure
    c80ca7bdff158 dmaengine: bcm-sba-raid: fix device leak on probe
    987c71671367f dmaengine: at_hdmac: fix device leak on of_dma_xlate()
    2838cb6133ac2 dmaengine: apple-admac: Add "apple,t8103-admac" compatible
    1f70af89b0893 drm/vmwgfx: Fix an error return check in vmw_compat_shader_add()
    bc0b17bdba383 drm/panel-simple: fix connector type for DataImage SCF0700C48GGU18 panel
    cb4c9fc5e79a7 drm/nouveau/disp/nv50-: Set lock_core in curs507a_prepare
    3dc1a40180264 drm/amdkfd: fix a memory leak in device_queue_manager_init()
    a4218ac0bb8e7 drm/amd: Clean up kfd node on surprise disconnect
    d9a82256a4c7e drm/amd/display: Bump the HDMI clock to 340MHz
    1d8f4d24fc1b3 LoongArch: Fix PMU counter allocation for mixed-type event groups
    43964644348f6 mm/damon/sysfs: cleanup attrs subdirs on context dir setup failure
    6ef36b329bbe2 mm/page_alloc: make percpu_pagelist_high_fraction reads lock-free
    b73f2834e1bc6 x86/resctrl: Fix memory bandwidth counter width for Hygon
    a78dca14fb2b0 x86/resctrl: Add missing resctrl initialization for Hygon
    71c5bc6720b60 tcpm: allow looking for role_sw device in the main node
    bfefcc78a8ec5 EDAC/i3200: Fix a resource leak in i3200_probe1()
    dc2365df328a9 EDAC/x38: Fix a resource leak in x38_probe1()
    ac92563601513 hrtimer: Fix softirq base check in update_needs_ipi()
    0b06cde92f2f9 ext4: fix iloc.bh leak in ext4_xattr_inode_update_ref
    ed61badfc2bc8 nvme-pci: disable secondary temp for Wodposit WPBSNM8
    3f6a36c9dc73d USB: serial: ftdi_sio: add support for PICAXE AXE027 cable
    f890044ad2959 USB: serial: option: add Telit LE910 MBIM composition
    384084a094c74 USB: OHCI/UHCI: Add soft dependencies on ehci_platform
    93f21786487cd usb: core: add USB_QUIRK_NO_BOS for devices that hang on BOS descriptor
    928e7d022d167 usb: dwc3: Check for USB4 IP_NAME
    ee82bc9f1df97 phy: tegra: xusb: Explicitly configure HS_DISCON_LEVEL to 0x7
    9e0d336e71c47 phy: rockchip: inno-usb2: fix disconnection in gadget mode
    16a6a73087fb4 phy: freescale: imx8m-pcie: assert phy reset during power on
    942381794fc31 phy: rockchip: inno-usb2: fix communication disruption in gadget mode
    9716e427489f6 x86/kaslr: Recognize all ZONE_DEVICE users as physaddr consumers
    809a437e27a3b net: can: j1939: j1939_xtp_rx_rts_session_active(): deactivate session upon receiving the second rts
    58d236065ba65 can: ctucanfd: fix SSP_SRC in cases when bit-rate is higher than 1 MBit.
    f905bcfa971ed can: gs_usb: gs_usb_receive_bulk_callback(): fix URB memory leak
    1a3286edf4d48 null_blk: fix kmemleak by releasing references to fault configfs items
    2de6d3348937f ALSA: pcm: Improve the fix for race of buffer access at PCM OSS layer
    8fab42516eb3c scsi: core: Fix error handler encryption support
    60e450eec5d63 drm/amd/display: Check dce_hwseq before dereferencing it
    d64557b61c1dd HID: usbhid: paper over wrong bNumDescriptor field
    d66d8ad31057d i2c: qcom-geni: make sure I2C hub controllers can't use SE DMA
    88a9483f093bb dmaengine: omap-dma: fix dma_pool resource leak in error paths
    2a7ddafac3820 phy: broadcom: ns-usb3: Fix Wvoid-pointer-to-enum-cast warning (again)
    76b870fdaad82 phy: stm32-usphyc: Fix off by one in probe()
    beba460a29915 phy: qcom-qusb2: Fix NULL pointer dereference on early suspend
    8151ecaaf08e3 phy: drop probe registration printks
    7070ed66aba3b phy: phy-snps-eusb2: refactor constructs names
    0b347b180ad5e phy: fsl-imx8mq-usb: Clear the PCS_TX_SWING_FULL field before using it
    0fd2001907fea dmaengine: xilinx_dma: Fix uninitialized addr_width when "xlnx,addrwidth" property is missing
    59cb421b0902f dmaengine: tegra-adma: Fix use-after-free
    df8a131a41ff6 dmaengine: xilinx: xdma: Fix regmap max_register
    7602a67114cd5 mm, kfence: describe @slab parameter in __kfence_obj_info()
    f332d75388ea5 textsearch: describe @list member in ts_ops search
    805f1c634817a ASoC: tlv320adcx140: fix word length
    659939d08e5f7 ASoC: tlv320adcx140: fix null pointer
    0a234660dc70c net/sched: sch_qfq: do not free existing class in qfq_change_class()
    a3f895d4494a8 selftests: drv-net: fix RPS mask handling for high CPU numbers
    9356b69d03d0f ipv6: Fix use-after-free in inet6_addr_del().
    82c9039c8ebb7 net: hv_netvsc: reject RSS hash key programming without RX indirection table
    58208907c4044 btrfs: fix memory leaks in create_space_info() error paths
    0bd151ce4200c btrfs: introduce btrfs_space_info sub-group
    42c8d48bf3abe btrfs: factor out check_removing_space_info() from btrfs_free_block_groups()
    34d5cd41418af btrfs: factor out init_space_info() from create_space_info()
    1fe74715ccb4e btrfs: store fs_info in space_info
    6126877f90fe7 net/mlx5e: Restore destroying state bit after profile cleanup
    147b9a2fc7a35 vsock/test: add a final full barrier after run all tests
    06fe0801396a3 ipv4: ip_gre: make ipgre_header() robust
    15f6faf36e162 macvlan: fix possible UAF in macvlan_forward_source()
    0ba0a79500fcf net: update netdev_lock_{type,name}
    2f03dafea0a80 ip6_tunnel: use skb_vlan_inet_prepare() in __ip6_tnl_rcv()
    98151bb13af1e net: bridge: annotate data-races around fdb->{updated,used}
    9f1ac4c98add7 net: bridge: Set BR_FDB_ADDED_BY_USER early in fdb_add_entry
    f2dc6ab3a14c2 btrfs: send: check for inline extents in range_is_hole_in_parent()
    fdecd3b6aac10 nvme-tcp: fix NULL pointer dereferences in nvmet_tcp_build_pdu_iovec
    50f80e82e7966 nvmet-tcp: remove boilerplate code
    611e839d2d552 can: etas_es58x: allow partial RX URB allocation to succeed
    869862056e100 pnfs/flexfiles: Fix memory leak in nfs4_ff_alloc_deviceid_node()
    55787a73fbb61 xfrm: Fix inner mode lookup in tunnel mode GSO segmentation
    6eb597cb4e37f ASoC: codecs: wsa884x: fix codec initialisation
    ca72af7608d68 Revert "gfs2: Fix use of bio_chain"
    30f9b41b03903 efi/cper: Fix cper_bits_to_str buffer handling and return value
    73069e1134029 firmware: imx: scu-irq: Set mu_resource_id before get handle
    cbb31f77b879f Linux 6.6.121
    0b1ac9743f3d9 riscv: Replace function-like macro by static inline function
    d03ee41854866 gpio: pca953x: fix wrong error probe return value
    5192f17d1127a bpf: test_run: Fix ctx leak in bpf_prog_test_run_xdp error path
    83eef6f904a84 scsi: sg: Fix occasional bogus elapsed time that exceeds timeout
    06f90c7dce191 ASoC: fsl_sai: Add missing registers to cache default
    2c4404d6e4edb ASoC: amd: yc: Add quirk for Honor MagicBook X16 2025
    be3923930a71b ALSA: usb-audio: Update for native DSD support quirks
    78d87b72cebe2 can: j1939: make j1939_session_activate() fail if device is no longer registered
    f73d92997388b drm/amd/display: Fix DP no audio issue
    53de1e6cde8f9 netfilter: nf_tables: avoid chain re-validation if possible
    c04b3a832c062 powercap: fix sscanf() error return value handling
    e07dea55aa134 powercap: fix race condition in register_control_type()
    98676ee71fd4e bpf: Fix reference count leak in bpf_prog_test_run_xdp()
    7c81ad5e580bd bpf, test_run: Subtract size of xdp_frame from allowed metadata size
    d08b4193cd55a bpf: Support specifying linear xdp packet data size for BPF_PROG_TEST_RUN
    875d7cb4fe156 bpf: Make variables in bpf_prog_test_run_xdp less confusing
    a60c827903b45 bpf: Fix an issue in bpf_prog_test_run_xdp when page size greater than 4K
    77c956152a3a7 riscv: uprobes: Add missing fence.i after building the XOL buffer
    5c7c4131beade x86/microcode/AMD: Select which microcode patch to load
    90c4cb136e398 NFSD: Remove NFSERR_EAGAIN
    249d45ca97381 nfs_common: factor out nfs_errtbl and nfs_stat_to_errno
    93a2e7eaf876d NFS: trace: show TIMEDOUT instead of 0x6e
    21f8bc5179bed ALSA: ac97: fix a double free in snd_ac97_controller_register()
    3b7c1a3805a51 ALSA: ac97bus: Use guard() for mutex locks
    a19df91b5b93b LoongArch: Add more instruction opcodes and emit_* helpers
    029935507d0af arp: do not assume dev_hard_header() does not change skb->head
    0d254b0a15f29 net: enetc: fix build warning when PAGE_SIZE is greater than 128K
    93f18eaa19037 net: usb: pegasus: fix memory leak in update_eth_regs_async()
    11bf9134613f6 net/sched: sch_qfq: Fix NULL deref when deactivating inactive aggregate in qfq_reset
    9be826178831c HID: quirks: work around VID/PID conflict for appledisplay
    88bea149db205 net: fix memory leak in skb_segment_list for GRO packets
    970a1ac90325f bnxt_en: Fix potential data corruption with HW GRO/LRO
    dc6f73f73ce88 net: wwan: iosm: Fix memory leak in ipc_mux_deinit()
    81e7205b82a7f net/mlx5e: Don't print error message due to invalid module
    0ab968d9c56bd netdev: preserve NETIF_F_ALL_FOR_ALL across TSO updates
    582a5e922a965 net: sock: fix hardened usercopy panic in sock_recv_errqueue
    874794fb4f3db inet: ping: Fix icmp out counting
    2985712dc76df net: mscc: ocelot: Fix crash when adding interface under a lag
    4c8facf028ec7 bridge: fix C-VLAN preservation in 802.1ad vlan_tunnel egress
    94e070cd50790 net: marvell: prestera: fix NULL dereference on devlink_alloc() failure
    3cd717359e56f netfilter: nf_conncount: update last_gc only when GC has been performed
    c6cfd76700551 netfilter: nf_tables: fix memory leak in nf_tables_newrule()
    76f4218bdadde gpio: pca953x: handle short interrupt pulses on PCAL devices
    4d7652d1a3525 gpio: pca953x: Add support for level-triggered interrupts
    26f64b3ee5172 gpio: pca953x: Utilise temporary variable for struct device
    2a968d1fd7bd6 gpio: pca953x: Utilise dev_err_probe() where it makes sense
    62ecdf65b8ab0 netfilter: nft_synproxy: avoid possible data-race on update operation
    51ea246778e57 arm64: dts: imx8mp: Fix LAN8740Ai PHY reference clock on DH electronics i.MX8M Plus DHCOM
    b6600d9d893f6 ARM: dts: imx6q-ba16: fix RTC interrupt level
    837fe3df68601 arm64: dts: add off-on-delay-us for usdhc2 regulator
    c6f7b3cf44856 scsi: Revert "scsi: libsas: Fix exp-attached device scan after probe failure scanned in again after probe failed"
    cf73e6020b3d7 scsi: ufs: core: Fix EH failure after W-LUN resume error
    ac01c92333497 scsi: ipr: Enable/disable IRQD_NO_BALANCING during reset
    afd993bababfe smb/client: fix NT_STATUS_NO_DATA_DETECTED value
    bbbc1a48f121a smb/client: fix NT_STATUS_DEVICE_DOOR_OPEN value
    ca9b4aaa7e63b smb/client: fix NT_STATUS_UNABLE_TO_FREE_VM value
    f18975f2cd41c NFS: Fix up the automount fs_context to use the correct cred
    f719a300eaa05 NFSv4: ensure the open stateid seqid doesn't go backwards
    af4fc583fd900 dm-snapshot: fix 'scheduling while atomic' on real-time kernels
    fc220dae3cf89 alpha: don't reference obsolete termio struct for TC* constants
    be3bc3d84a2a5 ARM: 9461/1: Disable HIGHPTE on PREEMPT_RT kernels
    78faf283336dc csky: fix csky_cmpxchg_fixup not working
    13159c7125636 tls: Use __sk_dst_get() and dst_dev_rcu() in get_netdev_for_sock().
    381261f24f4e4 NFSD: NFSv4 file creation neglects setting ACL
    4c06b7cb87e5b nfsd: set security label during create operations
    d761a185f8950 nfsd: Fix NFSv3 atomicity bugs in nfsd_setattr()
    ab2b5755269cf nfsd: convert to new timestamp accessors
    1310640f9ae92 net: Add locking to protect skb->dev access in ip_output
    9c2f8a9b68024 ksm: use range-walk function to jump over holes in scan_get_next_rmap_item
    4ebc711b738d1 libceph: make calc_target() set t->paused, not just clear it
    90a60fe61908a libceph: reset sparse-read state in osd_fault()
    e097cd858196b libceph: return the handler error from mon_handle_auth_done()
    8081faaf089db libceph: make free_choose_arg_map() resilient to partial allocation
    d3613770e2677 libceph: replace overzealous BUG_ON in osdmap_apply_incremental()
    ef208ea331ef6 libceph: prevent potential out-of-bounds reads in handle_auth_done()
    d21ec867d84c9 wifi: avoid kernel-infoleak from struct iw_point
    16e107d586208 pinctrl: qcom: lpass-lpi: mark the GPIO controller as sleeping
    7291ef23491f9 gpio: rockchip: mark the GPIO controller as sleeping
    e23882b11f8d3 drm/radeon: Remove __counted_by from ClockInfoArray.clockInfo[]
    526bd4bfa1206 drm/pl111: Fix error handling in pl111_amba_probe
    1c5a3175aecf8 counter: interrupt-cnt: Drop IRQF_NO_THREAD flag
    8a1b8778b7868 counter: 104-quad-8: Fix incorrect return value in IRQ handler
    84875a1d92243 lib/crypto: aes: Fix missing MMU protection for AES S-box
    e1e8d4973c1a7 mei: me: add nova lake point S DID
    a63998cd6687c btrfs: always detect conflicting inodes when logging inode refs
    28b2a80560969 net: 3com: 3c59x: fix possible null dereference in vortex_probe1()
    8f5211fc891d0 atm: Fix dma_free_coherent() size
    06600719d0f7a nfsd: provide locking for v4_end_grace
    e15e59b5aa624 NFSD: Fix permission check for read access to executable-only files

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 0018061822..3ad8bd54fa 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "9f6b4d4c1c5963ea07d6fe904311cd53ad4c0258"
-SRCREV_meta ?= "49d5ba17b4b5951f28957ba6891a14dd7b27ceee"
+SRCREV_machine ?= "5a49ab75e554557c1d3665b22233c4de9a2c2a75"
+SRCREV_meta ?= "17375dce1754d0783fb3fb9e684691951f9ff357"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.120"
+LINUX_VERSION ?= "6.6.123"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index f4165c9ef4..50c8e69d5c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.120"
+LINUX_VERSION ?= "6.6.123"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "9216b294019c150359dc667f9d3dbbde2c0a8a8a"
-SRCREV_meta ?= "49d5ba17b4b5951f28957ba6891a14dd7b27ceee"
+SRCREV_machine ?= "18a3ba79eed015d2cbd1f5af2c1417d12b369698"
+SRCREV_meta ?= "17375dce1754d0783fb3fb9e684691951f9ff357"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 987c3218ec..3f8b40e305 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "bcbb707216e841d53386a3f1ccf9b09c62961791"
-SRCREV_machine:qemuarm64 ?= "321d1a067132a921414fdfab332fb084d44096c2"
-SRCREV_machine:qemuloongarch64 ?= "993fd928045661cd12c065d82461c47220c67cbc"
-SRCREV_machine:qemumips ?= "669b6afdc64fdb78d06e1997fc077b31721460e0"
-SRCREV_machine:qemuppc ?= "8c9e6ee3f14b711a63744f4fe3b1b7aaaee46a99"
-SRCREV_machine:qemuriscv64 ?= "993fd928045661cd12c065d82461c47220c67cbc"
-SRCREV_machine:qemuriscv32 ?= "993fd928045661cd12c065d82461c47220c67cbc"
-SRCREV_machine:qemux86 ?= "993fd928045661cd12c065d82461c47220c67cbc"
-SRCREV_machine:qemux86-64 ?= "993fd928045661cd12c065d82461c47220c67cbc"
-SRCREV_machine:qemumips64 ?= "827304b327c277b699d94d8f861cde5f4b242b3f"
-SRCREV_machine ?= "993fd928045661cd12c065d82461c47220c67cbc"
-SRCREV_meta ?= "49d5ba17b4b5951f28957ba6891a14dd7b27ceee"
+SRCREV_machine:qemuarm ?= "b562777a433f835ae245e08c27df6b47e3ae2505"
+SRCREV_machine:qemuarm64 ?= "2df2455c7199cb8db4ea0118f908f952ff73eb97"
+SRCREV_machine:qemuloongarch64 ?= "af240d7d57ebf66e87bc2dff34855e630a97ead1"
+SRCREV_machine:qemumips ?= "6b9c16676cd4c8494ca7cdff355cb1cfe4d8fb3a"
+SRCREV_machine:qemuppc ?= "bf3f6c731ea41e519389b24104458870475dce20"
+SRCREV_machine:qemuriscv64 ?= "af240d7d57ebf66e87bc2dff34855e630a97ead1"
+SRCREV_machine:qemuriscv32 ?= "af240d7d57ebf66e87bc2dff34855e630a97ead1"
+SRCREV_machine:qemux86 ?= "af240d7d57ebf66e87bc2dff34855e630a97ead1"
+SRCREV_machine:qemux86-64 ?= "af240d7d57ebf66e87bc2dff34855e630a97ead1"
+SRCREV_machine:qemumips64 ?= "9fb8ff244fe5c5d6aa08457cfb9bbe4a3ef47366"
+SRCREV_machine ?= "af240d7d57ebf66e87bc2dff34855e630a97ead1"
+SRCREV_meta ?= "17375dce1754d0783fb3fb9e684691951f9ff357"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "c596736dadab2ffef4737fa8acbc1244557126ac"
+SRCREV_machine:class-devupstream ?= "c56aaf1a85ae918dd521fb2869028cf533d2755a"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.120"
+LINUX_VERSION ?= "6.6.123"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


