Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82601C83F22
	for <webhook@archiver.kernel.org>; Sun, 20 Jul 2025 20:05:17 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.24664.1753041913074018249
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jul 2025 13:05:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DYSi1IPa;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-23c8a5053c2so33621765ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 13:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753041912; x=1753646712; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qfjvOFhtKeXftXNaOS95Z2nhIeslQWH1ddq+v+Ri6/Y=;
        b=DYSi1IPa5fg5/WGPPrJ8hkWhXUtwD4px61epMc2YIRQkpE/+HwYZxItHWEBwYz9Ula
         ggWSce2QetP5LXAiyljV598Tn5qpvqt1trAFDcP4+CPYTkUVezITO3E/Tg05sXEuB6HL
         vyFiDAzzVi7pZN8wYPbPdFgUwFI99EM49lZ6yeYw0iREpquOg0zAMrPiu1FnV+TKTc/V
         GET8ETkhWbBmfYjamJ0rz7Urtas0+p5kxs5g6SYljqsm9vKVBmCDLWdO68FGDkPgJdsW
         r5ilq7F1eoCTCEHOH7/TclvbWY3B7ptbwL/hhlFdKZpwGoacoifFZfE5H0ulrOJsMuaY
         S2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753041912; x=1753646712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qfjvOFhtKeXftXNaOS95Z2nhIeslQWH1ddq+v+Ri6/Y=;
        b=T1jduo1LKu0x2aUDu62McFmfnzMd5N5DSkImBGPpHpdO5KuQukq5yJtLmraXqaW7H5
         pt1JySFOuLnOS/JvB3NdXu/2Jq8bhLBs5KLViZb9cemWWdMmjGC2zMD1NuvV7I/fZMRH
         cStokt1YB4MsGm+gZbJRFa+evCqOYBI1Vo/Mnj5wjkf9E1+RI2wmbkLODrMUFxAJIVe0
         J2V22UcW0GQhg4e9fmLg8PwXT8J8myuRz2M8Al4vti+iZK4ZwVehSkCgxlX98Khi8NF1
         23EhmfBIg/1dcoV+DLBeKhqmqIda3k19Dkq4x+tlShxNIL0DyoOPJozU7LWppy/3AOaS
         yD2w==
X-Gm-Message-State: AOJu0YwKIXhEiBfQT/BI7XhKVphpxknNBPgH/Bfrw889MDu6XDo9qZF9
	LCoixvJ+wTtixhzFquMfERgZWsqUIFUhy0FCzONEwmcvXXajF2zfhK8VfdPAsfyglApXdb21XdX
	fRs1Fw1M=
X-Gm-Gg: ASbGnctyh/ETbccJWRAFMWAvFuZDGJOBRBNh0Vsf+nFak6S3Ruu+39bGjvxx6vNUxU6
	+ciGBDfOcHBMQLF9L0UwEAqCMomxQMstlBgT5CO4uzRnoohC6VTZoTZWYLMGCrcyhlk9KqBRg+O
	tMGIcQ+NchxUWScDhrDEoilg75smm1Qvcr3qyXuCpBKmrAqK5sAj0kSapgfb17MYpWlYgG3E0tk
	fukYaaRYpL4gvRFpofJ6PfbfSPOvk8WeclzaansjRzcAA9W57fDr1+COC8usRNKcuGzbxFHDIMl
	2QpDYL+DlPYOLp4/HzlkteLU+rquoSj5Zi6xGYlghhIDlItQWNyit2HMRsa2setHr0sKjkSlv9y
	Us+GUgIXwWgfnsw==
X-Google-Smtp-Source: AGHT+IF88wVyWHGKD6NyPciL8UEfVN+qkwYFQmtvDj6CUmsElMaLhAWD6EPUDHHCDACZtWRq8bpmTQ==
X-Received: by 2002:a17:903:2288:b0:224:26fd:82e5 with SMTP id d9443c01a7336-23e24ffdc09mr271615455ad.48.1753041911474;
        Sun, 20 Jul 2025 13:05:11 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:31c9:438f:a923:8d3c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b60f096sm44894035ad.78.2025.07.20.13.05.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 13:05:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 07/12] linux-yocto/6.12: update to v6.12.34
Date: Sun, 20 Jul 2025 13:04:44 -0700
Message-ID: <8d3b9d71fd2a9ccdf134ee0c0de65e36a6757185.1753041740.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753041740.git.steve@sakoman.com>
References: <cover.1753041740.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 20:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220632

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    23fdf46589db Linux 6.12.34
    fe794d1f9bd1 thermal/drivers/mediatek/lvts: Remove unused lvts_debugfs_exit
    6695a1fa988e drm/meson: Use 1000ULL when operating with mode->clock
    da728507b071 gfs2: Don't clear sb->s_fs_info in gfs2_sys_fs_add
    ab20b0bdb01f overflow: Introduce __DEFINE_FLEX for having no initializer
    5ed1d7a70000 net: usb: aqc111: debug info before sanitation
    b4a86d64e487 usb: misc: onboard_usb_dev: fix build warning for CONFIG_USB_ONBOARD_DEV_USB5744=n
    d4724213c82b regulator: dt-bindings: mt6357: Drop fixed compatible requirement
    77e1bf9dad14 calipso: unlock rcu before returning -EAFNOSUPPORT
    ea50a9c348dc x86/fred/signal: Prevent immediate repeat of single step trap on return from SIGTRAP handler
    b3b3b6366dc8 x86/iopl: Cure TIF_IO_BITMAP inconsistencies
    dbbad9a0162c xen/arm: call uaccess_ttbr0_enable for dm_op hypercall
    9332b7a8364e xfs: don't assume perags are initialised when trimming AGs
    2d6a6cfe969f ring-buffer: Move cpus_read_lock() outside of buffer->mutex
    e09c0600beea ring-buffer: Fix buffer locking in ring_buffer_subbuf_order_set()
    b8df8cb8f7ee ring-buffer: Do not trigger WARN_ON() due to a commit_overrun
    6a6ce20657a9 9p: Add a migrate_folio method
    7bdd712abefb usb: typec: tcpm: move tcpm_queue_vdm_unlocked to asynchronous work
    9f907ee83fee usb: typec: tcpm/tcpci_maxim: Fix bounds check in process_rx()
    657003ced7f5 usb: Flush altsetting 0 endpoints before reinitializating them after reset.
    921b3c8050fe usb: cdnsp: Fix issue with detecting USB 3.2 speed
    c7862978b405 usb: cdnsp: Fix issue with detecting command completion event
    3cce1734776d usb: misc: onboard_usb_dev: Fix usb5744 initialization sequence
    393abb68b9ec tty: serial: 8250_omap: fix TX with DMA for am33xx
    00ddc7dad55b VMCI: fix race between vmci_host_setup_notify and vmci_ctx_unset_notify
    6327884fbabd usb: usbtmc: Fix read_stb function and get_stb ioctl
    c8bb1bcea877 nvmem: zynqmp_nvmem: unbreak driver after cleanup
    c29d5318708e posix-cpu-timers: fix race between handle_posix_cpu_timers() and posix_cpu_timer_del()
    74388368927e HID: usbhid: Eliminate recurrent out-of-bounds bug in usbhid_parse()
    84e9f0a2c253 ALSA: usb-audio: Add implicit feedback quirk for RODE AI-1
    81515a447932 Revert "wifi: mwifiex: Fix HT40 bandwidth issue."
    1ed18c90f6d9 tools/resolve_btfids: Fix build when cross compiling kernel with clang.
    403bbbe2fad6 objtool/rust: relax slice condition to cover more `noreturn` Rust functions
    4b1ef15ffd9f block: Fix bvec_set_folio() for very large folios
    a9022c86312c bio: Fix bio_first_folio() for SPARSEMEM without VMEMMAP
    48f33ec14107 io_uring: consistently use rcu semantics with sqpoll thread
    0fccb6773b1f block: don't use submit_bio_noacct_nocheck in blk_zone_wplug_bio_work
    af8c13f9ee04 io_uring: fix use-after-free of sq->thread in __io_uring_show_fdinfo()
    a5c7b61eed6d block: use q->elevator with ->elevator_lock held in elv_iosched_show()
    f351bb308501 perf: Ensure bpf_perf_link path is properly serialized
    1c09795ecee8 nvmet-fcloop: access fcpreq only when holding reqlock
    3c04fafeb3ee btrfs: exit after state split error at set_extent_bit()
    7b4bf4d89683 gfs2: pass through holder from the VFS for freeze/thaw
    0a2500782f4d fs/filesystems: Fix potential unsigned integer underflow in fs_name()
    58c50f45e182 btrfs: exit after state insertion failure at btrfs_convert_extent_bit()
    a8ff2e362d90 net: drv: netdevsim: don't napi_complete() from netpoll
    073f64c03516 net_sched: ets: fix a race in ets_qdisc_change()
    180b12eafa8f net_sched: tbf: fix a race in tbf_change()
    4b755305b2b0 net_sched: red: fix a race in __red_change()
    e3f6745006dc net_sched: prio: fix a race in prio_tune()
    62ef4761bb9a net/mlx5e: Fix leak of Geneve TLV option object
    eb4b59491fea net/mlx5: HWS, fix missing ip_version handling in definer
    5932b1972dbe net/mlx5: Fix return value when searching for existing flow group
    da15ca055332 net/mlx5: Fix ECVF vports unload on shutdown flow
    adb56e5a7199 net/mlx5: Ensure fw pages are always allocated on same NUMA
    7a41744e3854 Bluetooth: MGMT: Fix sparse errors
    2af40d795d3f Bluetooth: eir: Fix possible crashes on eir_create_adv_data
    907ef6e12fb5 Bluetooth: hci_sync: Fix broadcast/PA when using an existing instance
    842f7c3154d5 Bluetooth: Fix NULL pointer deference on eir_get_service_data
    31bf7b2b9256 net/mdiobus: Fix potential out-of-bounds clause 45 read/write access
    b02d9d273248 net/mdiobus: Fix potential out-of-bounds read/write access
    78fa7b723e4e macsec: MACsec SCI assignment for ES = 0
    1e0de7582cec net: Fix TOCTOU issue in sk_is_readable()
    32a48db4cf28 ACPI: CPPC: Fix NULL pointer dereference when nosmp is used
    c3892f1ba0bc i40e: retry VFLR handling if there is ongoing VF reset
    60592d381f12 i40e: return false from i40e_reset_vf if reset is in progress
    0440186a9c1c drm/meson: fix more rounding issues with 59.94Hz modes
    e44408a31774 drm/meson: use vclk_freq instead of pixel_freq in debug print
    dd8d64e91047 drm/meson: fix debug log statement when setting the HDMI clocks
    d7aa2e4b808e drm/meson: use unsigned long long / Hz for frequency types
    c79a1ac2a053 powerpc/vas: Return -EINVAL if the offset is non-zero in mmap()
    9c340b56d605 powerpc/powernv/memtrace: Fix out of bounds issue in memtrace mmap
    d1bc80da75c7 net_sched: sch_sfq: fix a potential crash on gso_skb handling
    98e46d77cd8b scsi: iscsi: Fix incorrect error path labels for flashnode operations
    8a8380773f85 pinctrl: qcom: pinctrl-qcm2290: Add missing pins
    cce3ea5f48c6 spi: omap2-mcspi: Disable multi-mode when the previous message kept CS asserted
    01a968b1c421 spi: omap2-mcspi: Disable multi mode when CS should be kept asserted after message
    f74abf2cdd23 regulator: max20086: Fix refcount leak in max20086_parse_regulators_dt()
    569972c5bdb8 wifi: ath12k: fix GCC_GCC_PCIE_HOT_RST definition for WCN7850
    4c0153d7a19d wifi: ath12k: refactor ath12k_hw_regs structure
    6dabf9e05497 wifi: ath11k: validate ath11k_crypto_mode on top of ath11k_core_qmi_firmware_ready
    7b1a7d35eef5 wifi: ath11k: move some firmware stats related functions outside of debugfs
    d849e671fffa wifi: ath11k: don't wait when there is no vdev started
    b18918782eb6 wifi: ath11k: don't use static variables in ath11k_debugfs_fw_stats_process()
    784cb1c1b8c5 wifi: ath11k: avoid burning CPU in ath11k_debugfs_fw_stats_request()
    b208c674f5c3 wifi: ath11k: convert timeouts to secs_to_jiffies()
    ef8e4aeab3b5 ath10k: snoc: fix unbalanced IRQ enable in crash recovery
    b93e6fef4eda ptp: remove ptp->n_vclocks check logic in ptp_vclock_in_use()
    6c8d3d7c368d net: dsa: b53: fix untagged traffic sent via cpu tagged with VID 0
    4e83f2dbb2bf Bluetooth: MGMT: Protect mgmt_pending list with its own lock
    84ab1283eb5f Bluetooth: MGMT: Remove unused mgmt_pending_find_data
    9df3e5e7f7e4 Bluetooth: MGMT: Fix UAF on mgmt_remove_adv_monitor_complete
    fbf95f446bd6 Bluetooth: btintel_pcie: Reduce driver buffer posting to prevent race condition
    b104a6f5d572 Bluetooth: btintel_pcie: Increase the tx and rx descriptor count
    a075e10cfb6f Bluetooth: btintel_pcie: Fix driver not posting maximum rx buffers
    99e3d6985339 Bluetooth: hci_core: fix list_for_each_entry_rcu usage
    3464a707d137 scsi: core: ufs: Fix a hang in the error handler
    21b2bca88e17 serial: sh-sci: Move runtime PM enable to sci_probe_single()
    e5250b861939 dt-bindings: pwm: adi,axi-pwmgen: Fix clocks
    df4f4cdb064c dt-bindings: pwm: Correct indentation and style in DTS example
    3e81a8c73207 dt-bindings: pwm: adi,axi-pwmgen: Increase #pwm-cells to 3
    595f83730b6d pinctrl: samsung: add gs101 specific eint suspend/resume callbacks
    f33266ec3500 pinctrl: samsung: add dedicated SoC eint suspend/resume callbacks
    d5d5193dde41 pinctrl: samsung: refactor drvdata suspend & resume callbacks
    cd9d354bdd28 arm64: dts: qcom: x1e80100: Add GPU cooling
    9cd06b2ebeb4 arm64: dts: qcom: x1e80100: Apply consistent critical thermal shutdown
    b8de1a502971 mmc: sdhci-of-dwcmshc: add PD workaround on RK3576
    80f7c5be4fe5 pmdomain: core: Introduce dev_pm_genpd_rpm_always_on()
    eccd1fc1b0e1 Input: synaptics-rmi - fix crash with unsupported versions of F34
    59cb05c80448 ALSA: hda/realtek: Add support for HP Agusta using CS35L41 HDA
    0da3314630b9 ALSA: hda/realtek - Add new HP ZBook laptop with micmute led fixup
    c4cc8f6c3126 ALSA: hda/realtek - Support mute led function for HP platform
    410156098b0d ALSA: hda/realtek: Add support for various HP Laptops using CS35L41 HDA
    95e01b950c09 ALSA: hda/realtek: fix micmute LEDs on HP Laptops with ALC3247
    8b8b33ae372d ALSA: hda/realtek: fix micmute LEDs on HP Laptops with ALC3315
    0ce600d7179d tools/power turbostat: Fix AMD package-energy reporting
    9c1ddfeb662b do_change_type(): refuse to operate on unmounted/not ours mounts
    e1d02fe5040d fix propagation graph breakage by MOVE_MOUNT_SET_GROUP move_mount(2)
    1d792307191c path_overmount(): avoid false negatives
    1be1f3b8487c iov_iter: use iov_offset for length calculation in iov_iter_aligned_bvec
    569fb8c12237 ASoC: ti: omap-hdmi: Re-add dai_link->platform to fix card init
    18ff538aac63 ASoC: Intel: avs: Verify content returned by parse_int_array()
    cabc3dc410e8 ASoC: Intel: avs: Fix deadlock when the failing IPC is SET_D0IX
    3668296690e4 ASoC: codecs: hda: Fix RPM usage count underflow
    1cda72119b31 scsi: ufs: qcom: Prevent calling phy_exit() before phy_init()
    e01987354098 riscv: misaligned: fix sleeping function called during misaligned access handling
    d5d9fd13bc19 seg6: Fix validation of nexthop addresses
    933466fc50a8 wireguard: device: enable threaded NAPI
    031f5c5ca097 net: wwan: mhi_wwan_mbim: use correct mux_id for multiplexing
    4f0fcdb8357d wifi: cfg80211/mac80211: correctly parse S1G beacon optional elements
    b2fc08d27679 net: dsa: b53: do not touch DLL_IQQD on bcm53115
    1aa31695bf0d net: dsa: b53: allow RGMII for bcm63xx RGMII ports
    6d1c93a5c6b0 net: dsa: b53: do not enable RGMII delay on bcm63xx
    6c2e06200216 net: ti: icssg-prueth: Fix swapped TX stats for MII interfaces.
    f34dc858e69b netfilter: nf_nat: also check reverse tuple to obtain clashing entry
    251496ce1728 netfilter: nf_set_pipapo_avx2: fix initial map fill
    f33277cda6e8 drm/panel-simple: fix the warnings for the Evervision VGG644804
    a0319c9b1648 gve: add missing NULL check for gve_alloc_pending_packet() in TX DQO
    8cb645117aab nvme: fix command limits status code
    0cffc6e40d5d PM: sleep: Fix power.is_suspended cleanup for direct-complete devices
    1184f7df1d08 selftests: net: build net/lib dependency in all target
    6d300675dc38 vmxnet3: correctly report gso type for UDP tunnels
    e2df04e69c3f net: wwan: t7xx: Fix napi rx poll issue
    4399f59a9467 net: fix udp gso skb_segment after pull from frag_list
    798fd944fbcf drm/i915/guc: Handle race condition where wakeref count drops below 0
    ba282cfba33c drm/i915/psr: Fix using wrong mask in REG_FIELD_PREP
    2679bb2f692e drm/i915/guc: Check if expecting reply before decrementing outstanding_submission_g2h
    451ee661d0f6 net: stmmac: make sure that ptp_rate is not 0 before configuring EST
    bb033c6781ce net: stmmac: make sure that ptp_rate is not 0 before configuring timestamping
    2c32fc56c05a net: dsa: tag_brcm: legacy: fix pskb_may_pull length
    e653c298c5fd idpf: avoid mailbox timeout delays during reset
    12e40d01d6d1 idpf: fix a race in txq wakeup
    635fd9cead3d ice: fix rebuilding the Tx scheduler tree for large queue counts
    f9c3e8573b65 ice: create new Tx scheduler nodes for new queues only
    276849954d7c ice: fix Tx scheduler error handling in XDP callback
    b788cebf72f3 Bluetooth: L2CAP: Fix not responding with L2CAP_CR_LE_ENCRYPTION
    2a98786e2587 spi: bcm63xx-hsspi: fix shared reset
    408ca1d1803b spi: bcm63xx-spi: fix shared reset
    df376638df5f net: lan966x: Make sure to insert the vlan tags also in host mode
    095fe646f8e3 net/mlx4_en: Prevent potential integer overflow calculating Hz
    4c597fb29034 driver: net: ethernet: mtk_star_emac: fix suspend/resume issue
    c762fc79d710 net: tipc: fix refcount warning in tipc_aead_encrypt
    5910cbbfad5a gve: Fix RX_BUFFERS_POSTED stat to report per-queue fill_cnt
    74882beda3a7 net: stmmac: platform: guarantee uniqueness of bus_id
    e869a85acc2e page_pool: Fix use-after-free in page_pool_recycle_in_ring
    90891eadb825 Fix sock_exceed_buf_limit not being triggered in __sk_mem_raise_allocated
    35f116a4658f drm/xe: Make xe_gt_freq part of the Documentation
    3091d4c0d069 loop: add file_start_write() and file_end_write()
    4bd30962f308 USB: typec: fix const issue in typec_match()
    9f40ae8310a7 USB: gadget: udc: fix const issue in gadget_match_driver()
    ad2fc59a6703 iio: adc: mcp3911: fix device dependent mappings for conversion result registers
    9d6c8f561219 iio: adc: PAC1934: fix typo in documentation link
    03eb28352302 mei: vsc: Cast tx_buf to (__be32 *) when passed to cpu_to_be32_array()
    130e134f6eca vt: remove VT_RESIZE and VT_RESIZEX from vt_compat_ioctl()
    31028812724c coresight: prevent deactivate active config while enabling the config
    8b2230ac7ff0 fpga: fix potential null pointer deref in fpga_mgr_test_img_load_sgt()
    8d47a0354407 counter: interrupt-cnt: Protect enable/disable OPs with mutex
    b9c6d66810c4 coresight: catu: Introduce refcount and spinlock for enabling/disabling
    1183a72221d5 coresight: Fixes device's owner field for registered using coresight_init_driver()
    677da45548ec MIPS: Loongson64: Add missing '#interrupt-cells' for loongson64c_ls7a
    8fa544bff846 usb: acpi: Prevent null pointer dereference in usb_acpi_add_usb4_devlink()
    122bbc57cb13 iio: adc: ad7124: Fix 3dB filter frequency reading
    46dd5892ea17 iio: filter: admv8818: Support frequencies >= 2^32
    5bd5808b36e2 iio: filter: admv8818: fix range calculation
    c065694b8d5b iio: filter: admv8818: fix integer overflow
    ba9a3d356bfb iio: filter: admv8818: fix band 4, state 15
    74aca5ca341d thunderbolt: Fix a logic error in wake on connect
    c23d87b43f7d serial: Fix potential null-ptr-deref in mlb_usio_probe()
    d4c368e4a638 usb: renesas_usbhs: Reorder clock handling and power management in probe
    0a3e2ec5085a PCI: endpoint: Retain fixed-size BAR size as well as aligned size
    9137bd312b28 rtc: loongson: Add missing alarm notifications for ACPI RTC events
    7b264700708e PCI/DPC: Log Error Source ID only when valid
    642962fe3f73 PCI/DPC: Initialize aer_err_info before using it
    3d159ffc160f PCI/ACPI: Fix allocated memory release on error in pci_acpi_scan_root()
    bc6ddff79835 dmaengine: ti: Add NULL check in udma_probe()
    5072c1749197 phy: qcom-qmp-usb: Fix an NULL vs IS_ERR() bug
    8da884ec36df PCI: apple: Use gpiod_set_value_cansleep in probe flow
    8c839e71c413 PCI: cadence: Fix runtime atomic count underflow
    d9342fced7da PCI: rcar-gen4: set ep BAR4 fixed size
    17e4b0fcd234 PCI: Print the actual delay time in pci_bridge_wait_for_secondary_bus()
    5aac41632fff phy: rockchip: samsung-hdptx: Do no set rk_hdptx_phy->rate in case of errors
    e3f71127c6d9 phy: rockchip: samsung-hdptx: Fix clock ratio setup
    1dfeafe5850f rtc: sh: assign correct interrupts with DT
    6635bb78eb7d rust: alloc: add missing invariant in Vec::set_len()
    48ca7139ab7f cifs: Fix validation of SMB1 query reparse point response
    f7d9f4fa5385 perf callchain: Always populate the addr_location map when adding IP
    da9addeabdda perf trace: Set errpid to false for rseq and set_robust_list
    afa06f26057e nfs: ignore SB_RDONLY when remounting nfs
    877a3f1be3f0 nfs: clear SB_RDONLY before getting superblock
    aaea7a783d6e perf trace: Always print return value for syscalls returning a pid
    8d313634e67e perf record: Fix incorrect --user-regs comments
    20eafb4e59b3 perf symbol: Fix use-after-free in filename__read_build_id
    3196b6c70853 mailbox: mtk-cmdq: Refine GCE_GCTL_VALUE setting
    0acd44a8d7ee mailbox: imx: Fix TXDB_V2 sending
    28f3b29e74de perf tests switch-tracking: Fix timestamp comparison
    9970210eb1a4 mfd: stmpe-spi: Correct the name used in MODULE_DEVICE_TABLE
    fc66342db730 mfd: exynos-lpass: Avoid calling exynos_lpass_disable() twice in exynos_lpass_remove()
    d374cd56df23 mfd: exynos-lpass: Fix an error handling path in exynos_lpass_probe()
    1fbee9f1856f rpmsg: qcom_smd: Fix uninitialized return variable in __qcom_smd_send()
    4ce341e63936 remoteproc: k3-dsp: Drop check performed in k3_dsp_rproc_{mbox_callback/kick}
    3a4afda6fd3f remoteproc: k3-r5: Drop check performed in k3_r5_rproc_{mbox_callback/kick}
    9b15fcdba919 remoteproc: qcom_wcnss_iris: Add missing put_device() on error in probe
    6a6070d94323 perf scripts python: exported-sql-viewer.py: Fix pattern matching with Python 3
    3b7d37c49f15 perf intel-pt: Fix PEBS-via-PT data_src
    5c37bd26509e perf tests: Fix 'perf report' tests installation
    47eee86e45b0 perf trace: Fix leaks of 'struct thread' in set_filter_loop_pids()
    f481bf3e024e dm-flakey: make corrupting read bios work
    9091c9e039e8 dm-flakey: error all IOs when num_features is absent
    f9c1bdf24615 dm: fix dm_blk_report_zones
    dc16583d21c4 perf symbol-minimal: Fix double free in filename__read_build_id
    19bd9cde38dd hwmon: (asus-ec-sensors) check sensor index in read_string()
    7a23cc510eca mtd: nand: ecc-mxic: Fix use of uninitialized variable ret
    2967178d30ee x86/irq: Ensure initial PIR loads are performed exactly once
    1be2000b703b backlight: pm8941: Add NULL check in wled_configure()
    48e0b54be49d dm: free table mempools if not used in __bind
    2eeb181e76d4 dm: don't change md if dm_table_set_restrictions() fails
    baf8a7fed0ea perf ui browser hists: Set actions->thread before calling do_zoom_thread()
    a951f9a3d912 perf build: Warn when libdebuginfod devel files are not available
    5934a8fab358 randstruct: gcc-plugin: Fix attribute addition
    ab6db95940bd randstruct: gcc-plugin: Remove bogus void member
    b235393b9f43 fbdev: core: fbcvt: avoid division by 0 in fb_cvt_hperiod()
    f697ef117ecb soc: aspeed: Add NULL check in aspeed_lpc_enable_snoop()
    7ce3063fd85a soc: aspeed: lpc: Fix impossible judgment condition
    ffbfe7b0ce9b ARM: aspeed: Don't select SRAM
    0007761ff51f arm64: dts: mt6359: Rename RTC node to match binding expectations
    0e0081991469 arm64: dts: renesas: white-hawk-ard-audio: Fix TPU0 groups
    81f52f39edce arm64: dts: qcom: qcm2290: fix (some) of QUP interconnects
    16f35dcfe37e arm64: dts: rockchip: disable unrouted USB controllers and PHY on RK3399 Puma with Haikou
    318d0f2adc67 arm64: defconfig: mediatek: enable PHY drivers
    833388013346 ARM: dts: qcom: apq8064: move replicator out of soc node
    99f2ee48e945 ARM: dts: qcom: apq8064 merge hw splinlock into corresponding syscon device
    36a1fdd5d55c ARM: dts: qcom: apq8064: add missing clocks to the timer node
    2a8d4567aaa0 dt-bindings: vendor-prefixes: Add Liontron name
    1d5baab39e5b bus: fsl-mc: fix double-free on mc_dev
    9abbace40030 nilfs2: do not propagate ENOENT error from nilfs_btree_propagate()
    ecfc9dfae9f8 nilfs2: add pointer check for nilfs_direct_propagate()
    f6fae70f830d ocfs2: fix possible memory leak in ocfs2_finish_quota_recovery
    0aff95d9bc7f Squashfs: check return result of sb_min_blocksize
    e318a7bd2db5 soc: qcom: smp2p: Fix fallback to qcom,ipc parse
    14f2820a5db6 arm64: dts: ti: k3-j721e-common-proc-board: Enable OSPI1 on J721E
    2e39a12c45d4 arm64: tegra: Add uartd serial alias for Jetson TX1 module
    39ecf2ad203c arm64: tegra: Drop remaining serial clock-names and reset-names
    827746ce8b81 arm64: dts: rockchip: Update eMMC for NanoPi R5 series
    4fd50f6980e2 arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3566-rock3c
    f924280cf4cb arm64: dts: qcom: sda660-ifc6560: Fix dt-validate warning
    2533efb0d6dd arm64: dts: qcom: sdm660-lavender: Add missing USB phy supply
    3c8f511a658d arm64: dts: mt6359: Add missing 'compatible' property to regulators node
    e2df43c9422e arm64: dts: mediatek: mt6357: Drop regulator-fixed compatibles
    66a6daa0ef72 arm64: dts: imx8mn-beacon: Set SAI5 MCLK direction to output for HDMI audio
    b9c7c4e6c8bb arm64: dts: imx8mm-beacon: Set SAI5 MCLK direction to output for HDMI audio
    c48fe69e1748 arm64: dts: imx8mp-beacon: Fix RTC capacitive load
    69120f3767b7 arm64: dts: imx8mn-beacon: Fix RTC capacitive load
    33ff1f13291b arm64: dts: imx8mm-beacon: Fix RTC capacitive load
    e1c84dd136bf arm64: dts: mt8183: Add port node to mt8183.dtsi
    a39ba524fb9e arm64: dts: qcom: sdm660-xiaomi-lavender: Add missing SD card detect GPIO
    269df4263e5e arm64: dts: mediatek: mt8195: Reparent vdec1/2 and venc1 power domains
    5b5a538aad91 ARM: dts: at91: at91sam9263: fix NAND chip selects
    037a3a256791 ARM: dts: at91: usb_a9263: fix GPIO for Dataflash chip select
    3682d4dd0e8d arm64: dts: rockchip: Move SHMEM memory to reserved memory on rk3588
    3d36b1baf038 arm64: dts: qcom: ipq9574: Fix USB vdd info
    79c837807058 arm64: dts: qcom: sc8280xp-x13s: Drop duplicate DMIC supplies
    6e65650cee28 arm64: dts: qcom: sm8250: Fix CPU7 opp table
    3c4aaf3e7665 arm64: dts: qcom: sm8350: Reenable crypto & cryptobam
    9164f9ae3f49 arm64: dts: qcom: sdm845-starqltechn: remove excess reserved gpios
    d997703f9d75 arm64: dts: qcom: sdm845-starqltechn: refactor node order
    83f1b473bb31 arm64: dts: qcom: sdm845-starqltechn: fix usb regulator mistake
    caecebc6b943 arm64: dts: qcom: sdm845-starqltechn: remove wifi
    bdf8915dad6b arm64: dts: qcom: x1e80100-romulus: Keep L12B and L15B always on
    5c721b58d301 arm64: dts: qcom: sm8650: add missing cpu-cfg interconnect path in the mdss node
    a999df6f45a3 arm64: dts: qcom: sm8650: setup gpu thermal with higher temperatures
    4e95465ab940 arm64: dts: qcom: x1e80100: Mark usb_2 as dma-coherent
    0befc3005db9 f2fs: fix to correct check conditions in f2fs_cross_rename
    532601e783b5 f2fs: use d_inode(dentry) cleanup dentry->d_inode
    a3eeaea04e57 net: phy: mscc: Stop clearing the the UDPv4 checksum for L2 frames
    69541e58323e net: openvswitch: Fix the dead loop of MPLS parse
    dd8928897594 calipso: Don't call calipso functions for AF_INET sk.
    ec62c99914a7 octeontx2-pf: QOS: Refactor TC_HTB_LEAF_DEL_LAST callback
    91bed4ccae01 octeontx2-pf: QOS: Perform cache sync on send queue teardown
    66abe2201752 net: phy: mscc: Fix memory leak when using one step timestamping
    4b073a575b7f net: lan743x: Fix PHY reset handling during initialization and WOL
    0e5c90c2ae50 net: lan743x: rename lan743x_reset_phy to lan743x_hw_reset_phy
    f15ed37dd3af net: phy: fix up const issues in to_mdio_device() and to_phy_device()
    ddc654e89ace net: phy: clear phydev->devlink when the link is deleted
    2bc6dffb4b72 bpf: Avoid __bpf_prog_ret0_warn when jit fails
    3a92988a7695 net: xilinx: axienet: Fix Tx skb circular buffer occupancy check in dmaengine xmit
    f066d85170bd net: lan966x: Fix 1-step timestamping over ipv4 or ipv6
    02e45168e0fd RDMA/cma: Fix hang when cma_netevent_callback fails to queue_work
    7893a41deaf2 vsock/virtio: fix `rx_bytes` accounting for stream sockets
    30a9e834c74e net: usb: aqc111: fix error handling of usbnet read calls
    82fe7fbc21f4 RISC-V: KVM: lock the correct mp_state during reset
    9d04742f3e2d netfilter: nft_tunnel: fix geneve_opt dump
    09ecfdff49d3 netfilter: nf_tables: nft_fib: consistent l3mdev handling
    15c0250dae3b bpf, sockmap: Avoid using sk_socket after free when sending
    9427f6081f37 Bluetooth: btintel: Check dsbr size from EFI variable
    1750c3f1d945 Bluetooth: MGMT: iterate over mesh commands in mgmt_mesh_foreach()
    46e68224893b vfio/type1: Fix error unwind in migration dirty bitmap allocation
    fd125f1eefbc netfilter: nf_tables: nft_fib_ipv6: fix VRF ipv4/ipv6 result discrepancy
    c4c18cf58910 netfilter: xtables: support arpt_mark and ipv6 optstrip for iptables-nft only builds
    1d249cc92d08 bpf: Revert "bpf: remove unnecessary rcu_read_{lock,unlock}() in multi-uprobe attach logic"
    7e4835863950 wifi: mt76: mt7996: fix RX buffer size of MCU event
    3fc202198479 wifi: mt76: mt7996: set EHT max ampdu length capability
    ba9bf458fa11 wifi: mt76: mt7925: ensure all MCU commands wait for response
    52ffee9fea8d wifi: mt76: mt7925: refine the sniffer commnad
    17e939897e33 wifi: mt76: mt7925: prevent multiple scan commands
    790d05cde359 wifi: mt76: mt7915: Fix null-ptr-deref in mt7915_mmio_wed_init()
    1072fc0ca1f8 wifi: mt76: mt7996: Fix null-ptr-deref in mt7996_mmio_wed_init()
    df00f9147e6c Bluetooth: ISO: Fix not using SID from adv report
    6bfb154f95d5 kernfs: Relax constraint in draining guard
    e0657136ae94 scsi: ufs: mcq: Delete ufshcd_release_scsi_cmd() in ufshcd_mcq_abort()
    ee5ee646385f wifi: ath9k_htc: Abort software beacon handling if disabled
    59a834592dd2 hisi_acc_vfio_pci: bugfix live migration function without VF device driver
    89729b815292 hisi_acc_vfio_pci: add eq and aeq interruption restore
    884a76e81317 hisi_acc_vfio_pci: fix XQE dma address error
    3a392f874ac8 wifi: ath12k: fix memory leak in ath12k_service_ready_ext_event
    b4f6605dc276 iommu: remove duplicate selection of DMAR_TABLE
    e966a3c01ca1 wifi: rtw89: fix firmware scan delay unit for WiFi 6 chips
    c13255389499 wifi: rtw88: fix the 'para' buffer size to avoid reading out of bounds
    8ffad7be09c5 wifi: rtw89: pci: enlarge retry times of RX tag to 1000
    78a327ef0a78 s390/bpf: Store backchain even for leaf progs
    d32f9927f400 clk: qcom: gcc-msm8939: Fix mclk0 & mclk1 for 24 MHz
    e660e75f845f dt-bindings: soc: fsl,qman-fqd: Fix reserved-memory.yaml reference
    c98cdf6795a3 bpf: Fix WARN() in get_bpf_raw_tp_regs
    e02e12d6a7ab pinctrl: at91: Fix possible out-of-boundary access
    b7384eab8785 libbpf: Use proper errno value in nlattr
    c13e3174991c ktls, sockmap: Fix missing uncharge operation
    64f8f2a93358 of: unittest: Unlock on error in unittest_data_add()
    709412b92a7a tracing: Fix error handling in event_trigger_parse()
    4839a4a6ab9a tracing: Rename event_trigger_alloc() to trigger_data_alloc()
    ec913bc18b45 selftests/bpf: Fix caps for __xlated/jited_unpriv
    69a995644a42 efi/libstub: Describe missing 'out' parameter in efi_load_initrd
    a82f49df6bd6 wifi: iwlfiwi: mvm: Fix the rate reporting
    0a2712cd24ec clk: bcm: rpi: Add NULL check in raspberrypi_clk_register()
    d969194bdae6 bpftool: Fix regression of "bpftool cgroup tree" EINVAL on older kernels
    41c5158d36a5 clk: qcom: gpucc-sm6350: Add *_wait_val values for GDSCs
    45e1ff1284ac clk: qcom: gcc-sm6350: Add *_wait_val values for GDSCs
    a2874b73fdaa clk: qcom: dispcc-sm6350: Add *_wait_val values for GDSCs
    dcdce64095b4 clk: qcom: camcc-sm6350: Add *_wait_val values for GDSCs
    e53a8dcd36b9 tracing: Move histogram trigger variables from stack to per CPU structure
    94068a664aa5 bpf: Fix uninitialized values in BPF_{CORE,PROBE}_READ
    50ac361ff891 RDMA/mlx5: Fix error flow upon firmware failure for RQ destruction
    c1360ac8156c netfilter: nft_set_pipapo: prevent overflow in lookup table allocation
    c7b7d63a3322 netfilter: nft_quota: match correctly when the quota just depleted
    de6edd32370f netfilter: bridge: Move specific fragmented packet to slow_path instead of dropping it
    c1f418cc278a bpf: Allow XDP dev-bound programs to perform XDP_REDIRECT into maps
    277f9ffe873a libbpf: Use proper errno value in linker
    6589bc3699bc scsi: smartpqi: Fix smp_processor_id() call trace for preemptible kernels
    4248ba53e471 f2fs: fix to detect gcing page in f2fs_is_cp_guaranteed()
    04daca601252 f2fs: clean up w/ fscrypt_is_bounce_page()
    83563a166ca4 bonding: assign random address if device address is same as bond
    88f65bb66d75 iommu: Protect against overflow in iommu_pgsize()
    cc26bc26bebb Use thread-safe function pointer in libbpf_print
    30d80c636ec0 libbpf: Remove sample_period init in perf_buffer
    3587bee963f7 libbpf: Fix event name too long error
    034c1796f176 scsi: hisi_sas: Call I_T_nexus after soft reset for SATA disk
    0e7792a3001d RDMA/hns: Include hnae3.h in hns_roce_hw_v2.h
    6285516170f9 wifi: ath12k: fix node corruption in ar->arvifs list
    6a6307f8661d wifi: ath12k: Fix the QoS control field offset to build QoS header
    0c2de959f168 wifi: ath12k: Add MSDU length validation for TKIP MIC error
    371b340affa5 wifi: ath12k: fix invalid access to memory
    bba24336b9df wifi: rtw88: do not ignore hardware read error during DPK
    c5b738a1d993 wifi: rtw88: sdio: call rtw_sdio_indicate_tx_status unconditionally
    308ba450ea57 wifi: rtw88: sdio: map mgmt frames to queue TX_DESC_QSEL_MGMT
    5063fe878974 xfrm: Use xdo.dev instead of xdo.real_dev
    08784c73454c net/mlx5: Avoid using xso.real_dev unnecessarily
    9d57de88d940 libbpf: Fix buffer overflow in bpf_object__init_prog
    cf11bd435ff1 net: ncsi: Fix GCPS 64-bit member variables
    4f51fb0d257f page_pool: Track DMA-mapped pages and unmap them when destroying the pool
    25a912b3e0c5 page_pool: Move pp_magic check into helper functions
    65b3f76592ae f2fs: fix to do sanity check on sbi->total_valid_block_count
    a4d80521352e f2fs: prevent the current section from being selected as a victim during GC
    2fa8d128eced f2fs: clean up unnecessary indentation
    0c57aa8ef94c wifi: ath12k: Fix buffer overflow in debugfs
    827ff610afbb wifi: ath12k: Fix WMI tag for EHT rate in peer assoc
    553c265cd659 wifi: ath12k: fix cleanup path after mhi init
    44a51592ac65 f2fs: zone: fix to avoid inconsistence in between SIT and SSA
    3d25fa2d7f12 bpf, sockmap: Fix panic when calling skb_linearize
    3a8e680f7d7c bpf, sockmap: fix duplicated data transmission
    57fbbe29e860 bpf: fix ktls panic with sockmap
    f1b0b9b71265 selftests/bpf: Fix bpf_nf selftest failure
    671dd1fb8769 bpf: Check link_create.flags parameter for multi_kprobe
    fa5977d89d31 IB/cm: use rwlock for MAD agent lock
    a284820a1c97 wifi: ath12k: Fix invalid memory access while forming 802.11 header
    5a1210a69cc5 wifi: ath12k: Fix memory leak during vdev_id mismatch
    f5d77d0d41ea wifi: ath11k: fix node corruption in ar->arvifs list
    80a81375ef5a xen/x86: fix initial memory balloon target
    7051a80916ce svcrdma: Reduce the number of rdma_rw contexts per-QP
    9e710dc96f9c media: verisilicon: Free post processor buffers on error
    7b6050a9efc3 drm/mediatek: mtk_drm_drv: Unbind secondary mmsys components on err
    62df1ba66839 drm/mediatek: Fix kobject put for component sub-drivers
    ad426a7c3dda drm/mediatek: mtk_drm_drv: Fix kobject put for mtk_mutex device ptr
    5c2efbb3725d drm/msm/a6xx: Disable rgb565_predicator on Adreno 7c3
    295f1b128c9f selftests/seccomp: fix negative_ENOSYS tracer tests on arm32
    b038ffbd49e4 perf/amlogic: Replace smp_processor_id() with raw_smp_processor_id() in meson_ddr_pmu_create()
    c79bee34566d scsi: qedf: Use designated initializer for struct qed_fcoe_cb_ops
    e55f46a11ba5 overflow: Fix direct struct member initialization in _DEFINE_FLEX()
    b3cfc1f9f584 arm64/fpsimd: Do not discard modified SVE state
    7e16ba331ed2 firmware: SDEI: Allow sdei initialization without ACPI_APEI_GHES
    451335c867a7 drm/tegra: rgb: Fix the unbound reference count
    c4487e35d35f drm/vkms: Adjust vkms_state->active_planes allocation type
    7de22bbc5827 drm: rcar-du: Fix memory leak in rcar_du_vsps_init()
    3d0ae6b51141 drm/msm/dpu: enable SmartDMA on SC8180X
    5301f110b965 drm/msm/dpu: enable SmartDMA on SM8150
    ebf467c0ba35 selftests/seccomp: fix syscall_restart test for arm compat
    64a9ee6e111e arm64/fpsimd: Avoid warning when sve_to_fpsimd() is unused
    a4ea74086237 arm64: Support ARM64_VA_BITS=52 when setting ARCH_MMAP_RND_BITS_MAX
    0860d48b70fd firmware: psci: Fix refcount leak in psci_dt_init
    7ccf0c4070c2 m68k: mac: Fix macintosh_config for Mac II
    214307d69b2c watchdog: exar: Shorten identity name to fit correctly
    980b0895a08c kunit/usercopy: Disable u64 test on 32-bit SPARC
    e2bbe6336d15 fs/ntfs3: Add missing direct_IO in ntfs_aops_cmpr
    2d5879f64554 fs/ntfs3: handle hdr_first_de() return value
    33c9956b46be drm/bridge: lt9611uxc: Fix an error handling path in lt9611uxc_probe()
    8a88840699df drm/panel: samsung-sofef00: Drop s6e3fc2x01 support
    8e43fa9c713a perf: arm-ni: Fix missing platform_set_drvdata()
    7e958e116e3b perf: arm-ni: Unregister PMUs on probe failure
    8e6a63acc468 drm/panthor: Update panthor_mmu::irq::mask when needed
    d94b25ac50bc drm/panthor: Fix GPU_COHERENCY_ACE[_LITE] definitions
    f5ffc750dbfb arm64/fpsimd: Fix merging of FPSIMD state during signal return
    2756dac03611 arm64/fpsimd: Reset FPMR upon exec()
    55d52af498da arm64/fpsimd: Avoid clobbering kernel FPSIMD state with SMSTOP
    945d247d1ca2 arm64/fpsimd: Don't corrupt FPMR when streaming mode changes
    6103f9ba51a5 arm64/fpsimd: Discard stale CPU state when handling SME traps
    fa65c89f3fc1 arm64/fpsimd: Avoid RES0 bits in the SME trap handler
    9d6e355a26fb media: rkvdec: Fix frame size enumeration
    64f3acc8c7e6 drm/amd/pp: Fix potential NULL pointer dereference in atomctrl_initialize_mc_reg_table
    aba86d49e5ac drm/vc4: tests: Use return instead of assert
    bf694844daa0 drm/xe/d3cold: Set power state to D3Cold during s2idle/s3
    67ea6af4264a drm/vmwgfx: Fix dumb buffer leak
    af713f6af6fd drm/vmwgfx: Add error path for xa_store in vmw_bo_add_detached_resource
    aa02817f7add drm/vmwgfx: Add seqno waiter for sync_files
    45844a940331 ALSA: core: fix up bus match const issues.
    9bad55fc4a9c ASoC: apple: mca: Constrain channels according to TDM mask
    5787ff1acef2 spi: sh-msiof: Fix maximum DMA transfer size
    c9c8cb0f280b ACPI: OSI: Stop advertising support for "3.0 _SCP Extensions"
    0440baa4d42a thermal/drivers/mediatek/lvts: Fix debugfs unregister on failure
    77d45ba1bec4 PM: sleep: Print PM debug messages during hibernation
    d3cc08bad4b7 x86/mtrr: Check if fixed-range MTRRs exist in mtrr_save_fixed_ranges()
    f551f0e630a7 ACPI: resource: fix a typo for MECHREVO in irq1_edge_low_force_override[]
    0426e929700b PM: wakeup: Delete space in the end of string shown by pm_show_wakelocks()
    06c74bd58783 ASoC: SOF: amd: add missing acp descriptor field
    be0dc3e91952 ASoC: SOF: ipc4-pcm: Adjust pipeline_list->pipelines allocation type
    81d72f9241d8 PM: EM: Fix potential division-by-zero error in em_compute_costs()
    d05c33c14f09 power: reset: at91-reset: Optimize at91_reset()
    109d6bc57931 spi: tegra210-quad: modify chip select (CS) deactivation
    688d0b0d94b3 spi: tegra210-quad: remove redundant error handling code
    6accf99a2e21 spi: tegra210-quad: Fix X1_X2_X4 encoding and support x4 transfers
    29ce9e71e95a EDAC/{skx_common,i10nm}: Fix the loss of saved RRL for HBM pseudo channel 0
    a13e8343ffcf EDAC/skx_common: Fix general protection fault
    87dbfe2b392d ASoC: mediatek: mt8195: Set ETDM1/2 IN/OUT to COMP_DUMMY()
    b49ff1c5e935 ASoC: tas2764: Enable main IRQs
    594380c4b51a ACPICA: exserial: don't forget to handle FFixedHW opregions for reading
    9c094deb6b13 crypto: api - Redo lookup on EEXIST
    e9ecaeaf4136 kunit: Fix wrong parameter to kunit_deactivate_static_stub()
    53bedcd2d2aa crypto: sun8i-ce - move fallback ahash_request to the end of the struct
    5ed92ad1b7d1 crypto: xts - Only add ecb if it is not already there
    b7c09d213119 crypto: lrw - Only add ecb if it is not already there
    58beaa1aee55 rcu/cpu_stall_cputime: fix the hardirq count for x86 architecture
    60f95458154b btrfs: fix invalid data space release when truncating block in NOCOW mode
    7f45183ceab8 btrfs: scrub: fix a wrong error type when metadata bytenr mismatches
    5bd799d2ac6e btrfs: scrub: update device stats when an error is detected
    5539216f734b powerpc/pseries/iommu: Fix kmemleak in TCE table userspace view
    65115472f741 erofs: avoid using multiple devices with different type
    9cfca45aecc9 erofs: fix file handle encoding for 64-bit NIDs
    47810c61475c crypto: marvell/cesa - Avoid empty transfer descriptor
    7894694b5d5b crypto: marvell/cesa - Handle zero-length skcipher requests
    bf3cbf2805b4 kselftest: cpufreq: Get rid of double suspend in rtcwake case
    48e11bcee974 brd: fix discard end sector
    5b814cde622b brd: fix aligned_sector from brd_do_discard()
    7778a6767869 x86/insn: Fix opcode map (!REX2) superscript tags
    a18f8b1092d9 x86/cpu: Sanitize CPUID(0x80000000) output
    c93930857f06 crypto: sun8i-ce - undo runtime PM changes during driver removal
    57a52d74498c x86/microcode/AMD: Do not return error when microcode update is not necessary
    451a18d71bd9 sched/core: Tweak wait_task_inactive() to force dequeue sched_delayed tasks
    f54d2b7ac42b powerpc/crash: Fix non-smp kexec preparation
    4de0bb505fba powerpc: do not build ppc_save_regs.o always
    50de02375fac crypto: sun8i-ss - do not use sg_dma_len before calling DMA functions
    19d267d9fad0 crypto: sun8i-ce-cipher - fix error handling in sun8i_ce_cipher_prepare()
    781bbc8252f7 perf/core: Fix broken throttling when max_samples_per_tick=1
    5cd98656bcbc gfs2: gfs2_create_inode error handling fix
    271e6bf41afa gfs2: replace sd_aspace with sd_inode
    88ab25d7180c perf/x86/amd/uncore: Prevent UMC counters from saturating
    18807198d5db perf/x86/amd/uncore: Remove unused 'struct amd_uncore_ctx::node' member
    623074162b88 sched: Fix trace_sched_switch(.prev_state)
    e8d0d9ae998e crypto: sun8i-ce-hash - fix error handling in sun8i_ce_hash_run()
    41f76e98913a x86/idle: Remove MFENCEs for X86_BUG_CLFLUSH_MONITOR in mwait_idle_with_hints() and prefer_mwait_c1_over_halt()
    25027501e66a tools/x86/kcpuid: Fix error handling

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4d2dc369ca0a7744fb7124d5e4f2e18a4fadcc99)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 7c3769e6d2..5623807c2f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "d7a7983928e6846c682771f9671d958e4789d691"
-SRCREV_meta ?= "d32aa55c8954b11e8e29627e82df6180b2efc4fd"
+SRCREV_machine ?= "83770b9370dec1870d4d4ed2501e28f5be2b6d0c"
+SRCREV_meta ?= "f1c5cbeca3d98713c869113dd8b0c31aada2f5a5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.33"
+LINUX_VERSION ?= "6.12.34"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 2d5cfd7f78..82788e8e42 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.33"
+LINUX_VERSION ?= "6.12.34"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "897cf66d25d8a7290eeb899e27456f60fbf203ec"
-SRCREV_meta ?= "d32aa55c8954b11e8e29627e82df6180b2efc4fd"
+SRCREV_machine ?= "ad3170041071652d21ac5288f76b4692f458adc8"
+SRCREV_meta ?= "f1c5cbeca3d98713c869113dd8b0c31aada2f5a5"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 6c3d3fff55..05eb585637 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "588ee9ffcc393af78905cd2e44d54a359d0e500d"
-SRCREV_machine:qemuarm64 ?= "897cf66d25d8a7290eeb899e27456f60fbf203ec"
-SRCREV_machine:qemuloongarch64 ?= "897cf66d25d8a7290eeb899e27456f60fbf203ec"
-SRCREV_machine:qemumips ?= "3610d715bf098ed5d47c98ca9ea395627488ce23"
-SRCREV_machine:qemuppc ?= "897cf66d25d8a7290eeb899e27456f60fbf203ec"
-SRCREV_machine:qemuriscv64 ?= "897cf66d25d8a7290eeb899e27456f60fbf203ec"
-SRCREV_machine:qemuriscv32 ?= "897cf66d25d8a7290eeb899e27456f60fbf203ec"
-SRCREV_machine:qemux86 ?= "897cf66d25d8a7290eeb899e27456f60fbf203ec"
-SRCREV_machine:qemux86-64 ?= "897cf66d25d8a7290eeb899e27456f60fbf203ec"
-SRCREV_machine:qemumips64 ?= "2fd393fbc1b2f8e809b07f4ffb73a4611a569c3d"
-SRCREV_machine ?= "897cf66d25d8a7290eeb899e27456f60fbf203ec"
-SRCREV_meta ?= "d32aa55c8954b11e8e29627e82df6180b2efc4fd"
+SRCREV_machine:qemuarm ?= "fdfa4799f741ad68067f8595762ca24a28b4e67e"
+SRCREV_machine:qemuarm64 ?= "ad3170041071652d21ac5288f76b4692f458adc8"
+SRCREV_machine:qemuloongarch64 ?= "ad3170041071652d21ac5288f76b4692f458adc8"
+SRCREV_machine:qemumips ?= "7c3d2bbb9ce39a46bbbdf1f20711fcd111b755c5"
+SRCREV_machine:qemuppc ?= "ad3170041071652d21ac5288f76b4692f458adc8"
+SRCREV_machine:qemuriscv64 ?= "ad3170041071652d21ac5288f76b4692f458adc8"
+SRCREV_machine:qemuriscv32 ?= "ad3170041071652d21ac5288f76b4692f458adc8"
+SRCREV_machine:qemux86 ?= "ad3170041071652d21ac5288f76b4692f458adc8"
+SRCREV_machine:qemux86-64 ?= "ad3170041071652d21ac5288f76b4692f458adc8"
+SRCREV_machine:qemumips64 ?= "6453d66effdb1695ecb852bfb2f20d8a0edc88cb"
+SRCREV_machine ?= "ad3170041071652d21ac5288f76b4692f458adc8"
+SRCREV_meta ?= "f1c5cbeca3d98713c869113dd8b0c31aada2f5a5"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "e03ced99c437f4a7992b8fa3d97d598f55453fd0"
+SRCREV_machine:class-devupstream ?= "23fdf46589db718d538fa3e65ab0d57362d50b4a"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.33"
+LINUX_VERSION ?= "6.12.34"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


