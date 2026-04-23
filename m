Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A803FFC0357
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:32:51 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.402.1776958364169386627
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 08:32:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CxaDxZl5;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8acb3dab8dfso43763626d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 08:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776958363; x=1777563163; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3IMv1l41jlvHfZpUVmZmpYt3jctKSPyKragacWofRSY=;
        b=CxaDxZl5Stw3+dNBZH0IiuguokbqEAKrp5cycjsXTEtxY15eauJSWN3MJJRVPmcTHH
         qRhiNla5zrFUZHjMZTFMQ9AtdQZQTzlfXjlV6KuLhwbA9RSpF73iXFDBsDBhcRwcq/l0
         TZOVUZBN+HHSRDPq+BNbOx8EPnJ1iKLkwp8+NE/Tv/snCKUrchelQMxgkEYG07gCm+OK
         /tfkwRqdWLug1lAEJKLZUwtR5eMHS2itvzYxxe4QJJTS+5SkcGi+bLGyjKILgYm3GBix
         bJlKnf1nmvnbvplvodOY6gaVcoNPqU/zlKjndXCjnkrr6IAEO9Th3q0twl7/26gLViea
         DuqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776958363; x=1777563163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3IMv1l41jlvHfZpUVmZmpYt3jctKSPyKragacWofRSY=;
        b=hJI5Txv62yIQIUyMDkK0ByvW6XSVvwH2I6RbWCwDgoGP1Z70AT3pYy72mxSvWnTL/m
         U2TzCovHTkABc8cWQeOjHXQJ5EcZmpMszJgaiFlS+cjW1EU70ZxiwhWVXDjqL/xTROfP
         M+yxiDe6HI31HFXKmFdRZ9mq1RD03mV7X57R9ZcGFDLPRI31NMaunLUt7/1xuD5AOg8c
         Gn9AT+mk4bIgWbFLq/IFy2gEu2wDCxriaxHLogEyZQtUm9uQPKp42K/MEGdOcC5XVzpP
         SpShUC59jekqtrwC21YqxZ5Vgc8sCqCA3GqJudxJqT6Vh60K6v3Cnk/ND+w3Eqlmvd2I
         +kOQ==
X-Gm-Message-State: AOJu0YzddWiJTMcsAp6wq3Lx81r2ifbUEDudWMs7jYJpPmUBGFslTBBc
	vZYJ6+z5jb/wH/XNV0NqBsjIZ0uN43oaATcPewd/SVyAcPEsA/W46M9o
X-Gm-Gg: AeBDiesg2SAjUpc4mpcJh8pK5GcZgORguOs8YXZHrfps2I+MW9KvyW1k0NoPmqIAF/d
	PaiTLZXNmkyY9ifm3437ymWdFFS1rcAtS9qC2EwMSUodyT3j5qtOiLnJj9qwi8pwPC8g7ab803V
	MeFuWgWut9aYH87x22Vv0OZrDR5Ptra6G9Cyd/Z3xDmoBNdqZTwXoFPM78jb31WEVnDe64eTta8
	j8agZ8wDFfWRolSr1uF4n+70R6OL+LkwcacldkIrbhyot7EMdN0yxHwsKJ7OtstuCEC1hOt5/xZ
	/de6jcX/91sqaj42bEIqks+QOs7TOUoZW0fZk/UoG5hdb3YH2BdyuNQjSG2DqPfEvwkmrO72oQ8
	cMIQ6ixIqI8O+RIggnSdup0USUfFiDGxb17bTafo4y3CKnPjNaoIZEGt33R+oG4gYrojA1tFUE2
	ix2MdqfqWGUapWMk/09iLfzzyZqb7n3Mn06L7g6M4shT+hdXk72PBtLWf5v4dlIIFPNArNlCKPb
	mQtausX/S8GIny75mr3V+QKtCPX42H5L8j69qf48AnzHwjRrTDvYRmCHNEcqFq2Y6l5Xg==
X-Received: by 2002:a05:6214:c67:b0:89c:5289:4be7 with SMTP id 6a1803df08f44-8b0280ecbeemr433143526d6.26.1776958362440;
        Thu, 23 Apr 2026 08:32:42 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac429ffsm160765996d6.2.2026.04.23.08.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:32:40 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta-yocto-bsp][PATCH 13/15] yocto-bsps: update to v6.18.22
Date: Thu, 23 Apr 2026 11:32:20 -0400
Message-ID: <20260423153222.1932256-14-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423153222.1932256-1-bruce.ashfield@gmail.com>
References: <20260423153222.1932256-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 15:32:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235788

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.18 to the latest korg -stable release that comprises
the following commits:

    f2b09e8b594ce Linux 6.18.22
    5e7b2cc8fae9e sched_ext: Fix stale direct dispatch state in ddsp_dsq_id
    d5776a31c1657 sched_ext: Refactor do_enqueue_task() local and global DSQ paths
    9e36ceb5ca431 mm/memory: fix PMD/PUD checks in follow_pfnmap_start()
    cef18bb87a6c2 mm: replace READ_ONCE() with standard page table accessors
    a836054ea8101 scsi: target: tcm_loop: Drain commands in target_reset handler
    ce54802fe6bb7 scsi: target: file: Use kzalloc_flex for aio_cmd
    a98b78116a27e net: correctly handle tunneled traffic on IPV6_CSUM GSO fallback
    5f4061f8225d1 net: mana: fix use-after-free in add_adev() error path
    24ce568f7553a drm/amd/display: Fix DCE LVDS handling
    ba9be472a438e drm/amd/pm: disable OD_FAN_CURVE if temp or pwm range invalid for smu v13
    5bbadf60b1210 wifi: virt_wifi: remove SET_NETDEV_DEV to avoid use-after-free
    e367143b520ae kallsyms: prevent module removal when printing module name and buildid
    10bbeed03e1db kallsyms: cleanup code for appending the module buildid
    c1d72e846cb4e kallsyms: clean up modname and modbuildid initialization in kallsyms_lookup_buildid()
    ab5f05ae96fcd kallsyms: clean up @namebuf initialization in kallsyms_lookup_buildid()
    8e5eb1d6e6a3d usb: gadget: f_uac1_legacy: validate control request size
    5d1bb391ceeeb usb: gadget: f_hid: move list and spinlock inits from bind to alloc
    18ada801899f2 usb: gadget: f_rndis: Fix net_device lifecycle with device_move
    9cbc4f109bb21 usb: gadget: f_subset: Fix net_device lifecycle with device_move
    4ccdccff8febc usb: gadget: f_eem: Fix net_device lifecycle with device_move
    4e34f3f491fd7 usb: gadget: f_ecm: Fix net_device lifecycle with device_move
    446f1842cda92 usb: gadget: f_rndis: Protect RNDIS options with mutex
    3d436670b4741 usb: gadget: f_subset: Fix unbalanced refcnt in geth_free
    1aa9356881ee4 usb: gadget: uvc: fix NULL pointer dereference during unbind race
    a36e5e800b9c9 usb: gadget: u_ether: Fix NULL pointer deref in eth_get_drvinfo
    6ad77458637b7 usb: gadget: u_ether: Fix race between gether_disconnect and eth_stop
    63dc317dfcd3f ice: Fix memory leak in ice_set_ringparam()
    7d581e2534693 HID: appletb-kbd: add .resume method in PM
    f4e608fe12b7a usb: typec: ucsi: validate connector number in ucsi_notify_common()
    cc300853b9eba usb: gadget: dummy_hcd: fix premature URB completion when ZLP follows partial transfer
    5687a09776069 USB: dummy-hcd: Fix interrupt synchronization error
    efbd9441f1e76 USB: dummy-hcd: Fix locking/synchronization error
    cd9c6fcd1cf13 thunderbolt: Fix property read in nhi_wake_supported()
    15f0c2d9eebc1 usb: typec: thunderbolt: Set enter_vdo during initialization
    acea446ba4f42 misc: fastrpc: check qcom_scm_assign_mem() return in rpmsg_probe
    3a164f640953c misc: fastrpc: possible double-free of cctx->remote_heap
    c4c7219e93319 thermal: core: Fix thermal zone device registration error path
    2dbe93f344f10 thermal: core: Address thermal zone removal races with resume
    f0cf9c7b7c281 gpio: Fix resource leaks on errors in gpiochip_add_data_with_key()
    70b6e2e015030 gpio: mxc: map Both Edge pad wakeup to Rising Edge
    72c43eb2e334f sched_ext: Fix is_bpf_migration_disabled() false negative on non-PREEMPT_RCU
    d2703b4f8fb7c cpufreq: governor: fix double free in cpufreq_dbs_governor_init() error path
    65a5847e1a6c9 virtio_net: clamp rss_max_key_size to NETDEV_RSS_KEY_LEN
    5dff799c67715 net: ethernet: mtk_ppe: avoid NULL deref when gmac0 is disabled
    8351d18989c86 net: ftgmac100: fix ring allocation unwind on open failure
    eddfce70a6f31 vxlan: validate ND option lengths in vxlan_na_create
    3aea268b6d5cd crypto: tegra - Add missing CRYPTO_ALG_ASYNC
    6562290225c19 counter: rz-mtu3-cnt: do not use struct rz_mtu3_channel's dev member
    e07237df8538b counter: rz-mtu3-cnt: prevent counter from being toggled multiple times
    bbb6c37c7a483 vt: resize saved unicode buffer on alt screen exit after resize
    891d790fdb5c9 vt: discard stale unicode buffer on alt screen exit after resize
    554d005d51611 gpib: Fix fluke driver s390 compile issue
    68ca0eea0af02 netfilter: ipset: drop logically empty buckets in mtype_del
    784ed4abded1c nvmem: zynqmp_nvmem: Fix buffer size in DMA and memcpy
    0c94b84b6ef51 nvmem: imx: assign nvmem_cell_info::raw_len
    5a8f2e95f9a19 s390/cpum_sf: Cap sampling rate to prevent lsctl exception
    586222c37d402 s390/zcrypt: Fix memory leak with CCA cards used as accelerator
    a11f022db7d85 spi: cadence-qspi: Fix exec_mem_op error handling
    f5526abe978fd dt-bindings: connector: add pd-disable dependency
    d266498da90d3 firmware: microchip: fail auto-update probe if no flash found
    eae19cab44204 comedi: me4000: Fix potential overrun of firmware buffer
    a47ae40339c10 comedi: me_daq: Fix potential overrun of firmware buffer
    43c68a2c7cc35 comedi: ni_atmio16d: Fix invalid clean-up after failed attach
    b89c026227712 comedi: Reinit dev->spinlock between attachments to low-level drivers
    34c8b3a91bdfb comedi: dt2815: add hardware detection to prevent crash
    e92f5ee730653 cdc-acm: new quirk for EPSON HMD
    837392a384457 bridge: br_nd_send: validate ND option lengths
    5da684c24e8b4 ASoC: qcom: sc7280: make use of common helpers
    f43f77499ec8d io_uring: protect remaining lockless ctx->rings accesses with RCU
    09f78265a93d4 usb: core: use dedicated spinlock for offload state
    5a85599ca4d25 usb: cdns3: gadget: fix state inconsistency on gadget init failure
    390536cc6af4c usb: cdns3: gadget: fix NULL pointer dereference in ep_queue
    701903fcac4a4 usb: core: phy: avoid double use of 'usb3-phy'
    61937f6862904 usb: dwc2: gadget: Fix spin_lock/unlock mismatch in dwc2_hsotg_udc_stop()
    6288b46e5ac68 usb: ehci-brcm: fix sleep during atomic
    34af2da733f4e usb: host: xhci-sideband: delegate offload_usage tracking to class drivers
    65ff09f48b0e7 usb: misc: usbio: Fix URB memory leak on submit failure
    977b632db51d2 usb: usbtmc: Flush anchored URBs in usbtmc_release
    38c28fe256110 usb: ulpi: fix double free in ulpi_register_interface() error path
    882bdb01ff12c usb: quirks: add DELAY_INIT quirk for another Silicon Motion flash drive
    21f942879f861 gpib: lpvo_usb: fix memory leak on disconnect
    ffacfe07177d3 mei: me: reduce the scope on unexpected reset
    fefd0bceac15f iio: gyro: mpu3050: Fix out-of-sequence free_irq()
    cc3de12a5612e iio: gyro: mpu3050: Move iio_device_register() to correct location
    3a8e68d65a443 iio: gyro: mpu3050: Fix irq resource leak
    ac1233397f4cf iio: gyro: mpu3050: Fix incorrect free_irq() variable
    7f14b52a81f94 iio: imu: st_lsm6dsx: Set FIFO ODR for accelerometer and gyroscope only
    d6e078c634094 iio: imu: bmi160: Remove potential undefined behavior in bmi160_config_pin()
    04d8f0a785dc0 iio: light: veml6070: fix veml6070_read() return value
    0ad74c370e8de iio: light: vcnl4035: fix scan buffer on big-endian
    b0e1fec0a0d07 iio: imu: adis16550: fix swapped gyro/accel filter functions
    2ed3d9bc86b66 iio: dac: ad5770r: fix error return in ad5770r_read_raw()
    d7161e8b6211a iio: accel: adxl313: add missing error check in predisable
    b6d6f6e2e329f iio: accel: adxl380: fix FIFO watermark bit 8 always written as 0
    6c4591e716681 iio: accel: fix ADXL355 temperature signature value
    85981790ea35d iio: adc: aspeed: clear reference voltage bits before configuring vref
    5f482fd456bc5 iio: adc: ade9000: move mutex init before IRQ registration
    87180f65f90da iio: adc: ade9000: fix wrong register in CALIBBIAS case for active power
    3707af316f86d iio: adc: ade9000: fix wrong return type in streaming push
    25e04a8291f42 iio: adc: ti-ads7950: do not clobber gpio state in ti_ads7950_get()
    6afa581aed0f1 iio: adc: ti-ads7950: normalize return value of gpio_get
    d0a6b8d186dab Input: xpad - add support for Razer Wolverine V3 Pro
    86620132e9c4c Input: xpad - add support for BETOP BTP-KP50B/C controller's wireless mode
    00f0cc75356b0 Input: bcm5974 - recover from failed mode switch
    beba26c55f4e4 Input: i8042 - add TUXEDO InfinityBook Max 16 Gen10 AMD to i8042 quirk table
    33e646804070c Input: synaptics-rmi4 - fix a locking bug in an error path
    8ea8dc0d62e3a USB: core: add NO_LPM quirk for Razer Kiyo Pro webcam
    42e4fbeb853a6 USB: serial: option: add support for Rolling Wireless RW135R-GL
    70fd81b9c4bf3 USB: serial: io_edgeport: add support for Blackbox IC135A
    2b8ae82d85d75 drm/amdgpu/pm: drop SMU driver if version not matched messages
    77c918eaa4c91 drm/amdgpu: Change AMDGPU_VA_RESERVED_TRAP_SIZE to 64KB
    3543005a42d7e drm/amdgpu: validate doorbell_offset in user queue creation
    1e130cf9cd172 drm/amdgpu: Fix wait after reset sequence in S4
    d0fd0bea84752 drm/i915/dp: Use crtc_state->enhanced_framing properly on ivb/hsw CPU eDP
    86e926b108880 drm/i915/dsi: Don't do DSC horizontal timing adjustments in command mode
    df4979eef358c drm/ast: dp501: Fix initialization of SCU2C
    5a17678b74197 iio: adc: ti-ads1119: Replace IRQF_ONESHOT with IRQF_NO_THREAD
    30e2275b3469f iio: adc: ti-ads1119: Reinit completion before wait_for_completion_timeout()
    64bc0219e4d8e iio: adc: ti-ads1119: Fix unbalanced pm reference count in ds1119_single_conversion()
    014c6d27878d3 iio: adc: ti-adc161s626: use DMA-safe memory for spi_read()
    054ea2f12beb4 iio: adc: ti-adc161s626: fix buffer read on big-endian
    d9bf25ef3d30f iio: orientation: hid-sensor-rotation: add timestamp hack to not break userspace
    7d14b49de8fcc iio: orientation: hid-sensor-rotation: fix quaternion alignment
    2b655a9176442 iio: add IIO_DECLARE_QUATERNION() macro
    cae26eff1b56d gpib: fix use-after-free in IO ioctl handlers
    115a4c8df909f drm/amdgpu: fix the idr allocation flags
    1e3e98596c276 x86/kexec: Disable KCOV instrumentation after load_segments()
    16062d6830a7f mips: mm: Allocate tlb_vpn array atomically
    243d55bd3f08c hwmon: (occ) Fix division by zero in occ_show_power_1()
    1010390094fa2 MIPS: Fix the GCC version check for `__multi3' workaround
    247e1e7e25c8f MIPS: SiByte: Bring back cache initialisation
    075ea208c648c ksmbd: fix OOB write in QUERY_INFO for compound requests
    aba0aea354015 Bluetooth: hci_sync: fix stack buffer overflow in hci_le_big_create_sync
    fa14e0e19820b Bluetooth: SMP: force responder MITM requirements before building the pairing response
    061ee71ac6b03 Bluetooth: SMP: derive legacy responder STK authentication from MITM state
    c314b405dcc4d io_uring/net: fix slab-out-of-bounds read in io_bundle_nbufs()
    2e8194b4fdee7 ALSA: hda/realtek: add quirk for HP Victus 15-fb0xxx
    682b5fd115689 ALSA: hda/realtek: Add quirk for ASUS ROG Strix SCAR 15
    57698f184e1af ALSA: ctxfi: Fix missing SPDIFI1 index handling
    3afa2e67f3523 ALSA: caiaq: fix stack out-of-bounds read in init_card
    1933249263c3a lib/crypto: chacha: Zeroize permuted_state before it leaves scope
    b49bf41b41148 sched_ext: Fix inconsistent NUMA node lookup in scx_select_cpu_dfl()
    10c13c111d0d7 drm/amd/display: Fix NULL pointer dereference in dcn401_init_hw()
    ce47541f5c408 USB: serial: option: add MeiG Smart SRM825WN
    dd90880eb5ec5 wifi: iwlwifi: mvm: fix potential out-of-bounds read in iwl_mvm_nd_match_info_handler()
    d8388614de613 wifi: wilc1000: fix u8 overflow in SSID scan buffer size calculation
    20e2418b98369 rust_binder: use AssertSync for BINDER_VM_OPS
    f0e441be08a2e drm/ioc32: stop speculation on the drm_compat_ioctl path
    1200f4240c07d ACPI: RIMT: Add dependency between iommu and devices
    50392cdfe95e0 riscv: Reset pmm when PR_TAGGED_ADDR_ENABLE is not set
    e1425ff578c4a riscv: kgdb: fix several debug register assignment bugs
    e435a30ca6fe1 perf/x86: Fix potential bad container_of in intel_pmu_hw_config
    87573883c30f1 sched/fair: Fix zero_vruntime tracking fix
    a99f94e4f28a3 mips: ralink: update CPU clock index
    d6fbc5750f382 hwmon: (asus-ec-sensors) Fix T_Sensor for PRIME X670E-PRO WIFI
    d16f8716c927f drm/sysfb: Fix efidrm error handling and memory type mismatch
    6205de166dfb2 hwmon: (occ) Fix missing newline in occ_show_extended()
    ee4c064e37d4d spi: amlogic: spifc-a4: unregister ECC engine on probe failure and remove() callback
    fdbfa1bf2c759 hwmon: (tps53679) Fix device ID comparison and printing in tps53676_identify()
    9e962e68a9d26 drm/xe/pxp: Clear restart flag in pxp_start after jumping back
    5633454e28d30 drm/xe/pxp: Remove incorrect handling of impossible state during suspend
    ec45309671920 drm/xe/pxp: Clean up termination status on failure
    e8298e0cc68de spi: stm32-ospi: Fix reset control leak on probe error
    b4ec54c974c6e spi: stm32-ospi: Fix resource leak in remove() callback
    3a8b66a84f058 dt-bindings: gpio: fix microchip #interrupt-cells
    dfe3a785ae7fc hwmon: (ltc4286) Add missing MODULE_IMPORT_NS("PMBUS")
    13b0cb9963652 hwmon: (pxe1610) Check return value of page-select write in probe
    79b7e588399bb hwmon: (tps53679) Fix array access with zero-length block read
    040a1e7e0e2f0 io_uring/rsrc: reject zero-length fixed buffer import
    f403094d9075d accel/qaic: Handle DBC deactivation if the owner went away
    33b54c7793cf7 gpiolib: clear requested flag if line is invalid
    606f88c162b27 gpio: rename gpio_chip_hwgpio() to gpiod_hwgpio()
    9e5495d216bff iio: imu: bno055: fix BNO055_SCAN_CH_COUNT off by one
    89c3a4ba60309 Revert "drm: Fix use-after-free on framebuffers and property blobs when calling drm_dev_unplug"
    dc9a060d76c12 bpf: Reject sleepable kprobe_multi programs at attach time
    63276547debc4 bpf: reject direct access to nullable PTR_TO_BUF pointers
    7c15dabcbc9e3 eth: fbnic: Increase FBNIC_QUEUE_SIZE_MIN to 64
    9ed81d692758d ipv6: avoid overflows in ip6_datagram_send_ctl()
    1fe371a34e801 net: hsr: fix VLAN add unwind on slave errors
    a208c3e123299 net/sched: cls_flow: fix NULL pointer dereference on shared blocks
    3cb055df9e862 net/sched: cls_fw: fix NULL pointer dereference on shared blocks
    8c92969c197b9 net/x25: Fix overflow when accumulating packets
    fa1dbc93530b3 net/x25: Fix potential double free of skb
    311efb3cfc926 bnxt_en: Restore default stat ctxs for ULP when resource is available
    e27153b2bd6e6 net/mlx5: Fix switchdev mode rollback in case of failure
    276b3efb2b487 net/mlx5: Avoid "No data available" when FW version queries fail
    c53cf44588a93 net/mlx5: lag: Check for LAG device before creating debugfs
    5392a5174df4f net: macb: properly unregister fixed rate clocks
    16ab4c0e2b15d net: macb: fix clk handling on PCI glue driver removal
    3a2999704ac36 net/sched: sch_netem: fix out-of-bounds access in packet corruption
    18861f87a043e bpf: sockmap: Fix use-after-free of sk->sk_socket in sk_psock_verdict_data_ready().
    23e07c340c445 rds: ib: reject FRMR registration before IB connection is established
    edb5898cfa91a Bluetooth: MGMT: validate mesh send advertising payload length
    1d0bdbfe3e91c Bluetooth: hci_event: fix potential UAF in hci_le_remote_conn_param_req_evt
    7d568fede8eac Bluetooth: hci_conn: fix potential UAF in set_cig_params_sync
    50fb64defa72a Bluetooth: MGMT: validate LTK enc_size on load
    3ec3a1588876c Bluetooth: hci_h4: Fix race during initialization
    98c8d3bfdaa65 Bluetooth: SCO: fix race conditions in sco_sock_connect()
    d4d1a4eed6f6c Bluetooth: hci_sync: call destroy in hci_cmd_sync_run if immediate
    42a47f4b1b769 netfilter: nf_tables: reject immediate NF_QUEUE verdict
    dc3e27dd7d76e netfilter: x_tables: restrict xt_check_match/xt_check_target extensions for NFPROTO_ARP
    187b6ec5229ea netfilter: ctnetlink: ignore explicit helper on new expectations
    a0684ccc1ddd2 netfilter: nf_conntrack_expect: store netns and zone in expectation
    b53294bff19e5 netfilter: nf_conntrack_expect: use expect->helper
    54cb3500e8af5 netfilter: nf_conntrack_expect: honor expectation helper field
    929f7a9a7aad9 netfilter: ctnetlink: zero expect NAT fields when CTA_EXPECT_NAT absent
    620f3d14c1ef5 netfilter: nf_conntrack_helper: pass helper to expect cleanup
    a54bbbcd3c628 netfilter: ipset: use nla_strcmp for IPSET_ATTR_NAME attr
    f419bdc205894 netfilter: x_tables: ensure names are nul-terminated
    88a8f56e6276f netfilter: nfnetlink_log: account for netlink header size
    504c9456699dc netfilter: flowtable: strictly check for maximum number of actions
    908dd5faf8169 ALSA: usb-audio: Exclude Scarlett 2i2 1st Gen (8016) from SKIP_IFACE_SETUP
    87a8287e76244 net: stmmac: skip VLAN restore when VLAN hash ops are missing
    58b58b9ba89c4 mptcp: fix soft lockup in mptcp_recvmsg()
    8d38f222795d3 mptcp: add eat_recv_skb helper
    414726b69921f net: ipv6: flowlabel: defer exclusive option free until RCU teardown
    8aebe18069394 bpf: Fix regsafe() for pointers to packet
    917303fda0f1b ASoC: Intel: boards: fix unmet dependency on PINCTRL
    2a0323a913109 net: xilinx: axienet: Fix BQL accounting for multi-BD TX packets
    f3cf32dc1ebbd net: xilinx: axienet: Correct BD length masks to match AXIDMA IP spec
    ad2f60de5045b NFC: pn533: bound the UART receive buffer
    d4cc7e4c80b16 net: bonding: fix use-after-free in bond_xmit_broadcast()
    153d5520c3f9f crypto: authencesn - Do not place hiseq at end of dst for out-of-place decryption
    fafe0fa2995a0 crypto: algif_aead - Revert to operating out-of-place
    c8d53b70166d1 bnxt_en: set backing store type from query type
    906997ea3766c net: sched: cls_api: fix tc_chain_fill_node to initialize tcm_info to zero to prevent an info-leak
    cc91202fc20a4 net: use skb_header_pointer() for TCPv4 GSO frag_off check
    846cd4a5ffdce net: introduce mangleid_features
    ae585d9ac863f net: airoha: Add missing cleanup bits in airoha_qdma_cleanup_rx_queue()
    3cd4efb5df728 ipv6: prevent possible UaF in addrconf_permanent_addr()
    2321b0d47a11a ASoC: ep93xx: Fix unchecked clk_prepare_enable() and add rollback on failure
    19f90e0061b69 ALSA: usb-audio: Exclude Scarlett Solo 1st Gen from SKIP_IFACE_SETUP
    15db5c44f79c4 net: enetc: do not allow VF to configure the RSS key
    85b4fb46a8989 net: enetc: check whether the RSS algorithm is Toeplitz
    3b4df3d43ae42 net: sfp: Fix Ubiquiti U-Fiber Instant SFP module on mvneta
    17c1b9807b8a6 net/sched: sch_hfsc: fix divide-by-zero in rtsc_min()
    9c55e41c73af5 bridge: br_nd_send: linearize skb before parsing ND options
    117f9453dd7cd eth: fbnic: Account for page fragments when updating BDQ tail
    590f622669b97 ip6_tunnel: clear skb2->cb[] in ip4ip6_err()
    a2edbb6393972 ipv6: icmp: clear skb2->cb[] in ip6_err_gen_icmpv6_unreach()
    7e55845bd8971 tg3: Fix race for querying speed/duplex
    184d2e9db27c0 net/ipv6: ioam6: prevent schema length wraparound in trace fill
    b485eef3d97b7 net: ipv6: ndisc: fix ndisc_ra_useropt to initialize nduseropt_padX fields to zero to prevent an info-leak
    f2664bc4f0f35 net: qrtr: replace qrtr_tx_flow radix_tree with xarray to fix memory leak
    77c5f0a105d04 net: enetc: reset PIR and CIR if they are not equal when initializing TX ring
    98bef6f424a37 net: fec: fix the PTP periodic output sysfs interface
    53219f87bd220 netdevsim: fix build if SKB_EXTENSIONS=n
    7267e4c75f9f1 net: mana: Fix RX skb truesize accounting
    00cbdec17c15d crypto: af-alg - fix NULL pointer dereference in scatterwalk
    83622e52431eb crypto: deflate - fix spurious -ENOSPC
    aa545df011338 crypto: caam - fix overflow on long hmac keys
    68feed135a0c7 crypto: caam - fix DMA corruption on long hmac keys
    91478edb8cbc2 wifi: ath11k: Pass the correct value of each TID during a stop AMPDU session
    52dc79062f239 wifi: iwlwifi: mld: correctly set wifi generation data
    2f84d5e9c1c57 wifi: iwlwifi: disable EHT if the device doesn't allow it
    9d713f4f8bb0e wifi: iwlwifi: cfg: add new device names
    c0b3fa5e0eaec wifi: iwlwifi: mvm: don't send a 6E related command when not supported
    624af5c3baa2d wifi: iwlwifi: mld: Fix MLO scan timing
    ee555d539975e wifi: iwlwifi: fix remaining kernel-doc warnings
    fdbc00b8b2eec dt-bindings: auxdisplay: ht16k33: Use unevaluatedProperties to fix common property warning
    4d47b812f9250 spi: geni-qcom: Check DMA interrupts early in ISR
    f4e35576da439 smb: client: fix generic/694 due to wrong ->i_blocks
    850de3d87f472 btrfs: reject root items with drop_progress and zero drop_level
    86d7c80e1cfff i2c: tegra: Don't mark devices with pins as IRQ safe
    cf930a651eef6 btrfs: reserve enough transaction items for qgroup ioctls
    7f66fdbc077fa HID: multitouch: Check to ensure report responses match the request
    8f71034649738 HID: core: Mitigate potential OOB by removing bogus memset()
    b846fb0a73e99 HID: logitech-hidpp: Prevent use-after-free on force feedback initialisation failure
    34b12ab75ae25 objtool: Fix Clang jump table detection
    7e0576dcf245d tg3: replace placeholder MAC address with device property
    8b3484011a83e btrfs: don't take device_list_mutex when querying zone info
    abc10f85a3965 atm: lec: fix use-after-free in sock_def_readable()
    c8dc23c97680e HID: wacom: fix out-of-bounds read in wacom_intuos_bt_irq
    be81f17151fcb wifi: mac80211: check tdls flag in ieee80211_tdls_oper
    6c4e67e6ba250 HID: logitech-hidpp: Enable MX Master 4 over bluetooth
    1c41248cef835 arm64/scs: Fix handling of advance_loc4

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
index ce58481..4fc8c85 100644
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
@@ -8,4 +8,4 @@ KMACHINE:genericx86 ?= "common-pc"
 KMACHINE:genericx86-64 ?= "common-pc-64"
 
 KBRANCH:genericarm64 ?= "v6.18/standard/genericarm64"
-SRCREV_machine:genericarm64 ?= "00e5fc320cb18073f86c8c86f40fbc3787ced78d"
+SRCREV_machine:genericarm64 ?= "26b6ffb0e21a6dbd32de890f070ec9e15b4eff31"
-- 
2.43.0


