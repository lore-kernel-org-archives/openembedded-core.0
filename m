Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A79E4FC0364
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:42:02 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.627.1776958921274271184
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 08:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=g7nfFxPS;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8cb20bcff5aso636253785a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 08:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776958920; x=1777563720; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYt2w0lB3+TIQT1FYdLKIwEwTmRj/vgQp8oaHG+mXLA=;
        b=g7nfFxPSSnSTtItXiCuP59ik6FLZKD8rJO5WNkj2JYMDi0EbzEAlDNSF56RjRww0qn
         40cojtUyAushU7XBNkvsfPwVbZiDM/l6qLWodaPQNZRJyxRZIcGsUwPI5UyslygOl5IP
         Ta0CZ13DNp4zHAUc/fK8FE++N8gTRz5J4XopmvtZ3ZcoNU+3eEMAMYavI9hAzhLRFddE
         AmMuohDsgmniy4Aehm8tyT2JOFEZTSCic8wPWduMTRmlesWJcroyVxdsuoedR7z1+tj9
         tHWGtMp2w1cgqeglthdXdXGWjk8llG3+9o/RogvhMK0fGgDdRoYOktrBkhzaVYntSpM1
         etZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776958920; x=1777563720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NYt2w0lB3+TIQT1FYdLKIwEwTmRj/vgQp8oaHG+mXLA=;
        b=iTPZuq5l2VPtODhXKck+FSsxwIcIYSv3VP5EXfp91fD5mN1lxIkom2/CG/X4j9ealz
         ZW+8JGpPvCsgw4oDVReOEP2me8xSEDGupsYUrZp2fEgfJP+Gq9Uycw5FNMxx+aSvygqx
         BVzHiPm+byaKU8W6e43bOvTqcKywwq1YPWfWR8AggBaYQHBeSNbSaiW2bAG0wiv/KCPX
         XzTRWGAv0nRxvmgN3CJf32FM0tbqlhUha9AffWryDP/8MuiSCied18NOxpKmZzBoe+6E
         30rpWwsjPkBg68WBFZ+QP2mIB/N83+YR7gOqX2wc/8PA23a2bY030LNgLy2eOc0rS+/f
         8IYg==
X-Gm-Message-State: AOJu0YzzHG4yLc2BhRZVCo+RcFUp9R0QZz8dMzVxWtKwVgRRbbgG3jqj
	i9y4QTwnJY/C2n4ZBmJC5Q1J9/MRS3XTK+Ha66UiqBdJ1hF5EmzhAvmtl4znVN8N
X-Gm-Gg: AeBDietC5Uw69Y0EFFarNCSOnRfSeIhBgueRSaPSWezDpHWtArzc2S+/akIatNaUWwO
	+fjSS+SGWdN6xMEaHU3JkblhiVJ/+PaqgleAqM9bDkhL8cG3lN5L1H09rLhcEiIH5T4Iwz9PT+Z
	jDV7XQwJevEiwRLknH7kFFY195gEo956jssUTT47DEKWhtUldn2b5d+0mOIO8NPnzFD+PycoZXY
	XLKKBKp+NgjLCIkqPbbu6IDhrCUN9CfMQXF9nPQ0iBT7A/mT86pC3KkqAFQLEo6R37ifHblNN43
	S6IbVywrm7O5wAUvmcF5yzUHUpOEFNFZ9siNCIjcG7+lrCOoiZHDjGdBeiUiHXbtOfK8R/Znxyn
	f/xGUYGt3auR9lkBuN9mG202tm+aEVmBujDzfdTqXf3AnJVMIzl7lfwm50bLMfo4OcsiSTQpNdr
	Lnoe5XU177DlZ743oeLT83G7DjiJmCrMCAQ7cD09M2nCg1FcNSJ8KvccjK1HFU8dHiWn1fyXnxN
	l89f4gyflLjMTQBgt524X0tSdztffLj1JE/G2kDkdwg92eW1L0ZGXhk9hynP/T819tNIg==
X-Received: by 2002:a05:620a:2804:b0:8ee:21b3:2eb5 with SMTP id af79cd13be357-8ee21b33069mr1934439885a.6.1776958920099;
        Thu, 23 Apr 2026 08:42:00 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d69abee3sm1602139585a.17.2026.04.23.08.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:41:59 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][scarthgap][PATCH 07/08] linux-yocto/6.6: update to v6.6.134
Date: Thu, 23 Apr 2026 11:41:48 -0400
Message-ID: <20260423154149.1933049-7-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423154149.1933049-1-bruce.ashfield@gmail.com>
References: <20260423154149.1933049-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 15:42:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235798

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    8cee53b8eaeb5 Linux 6.6.134
    6b63a54a790a6 net: sfp: Fix Ubiquiti U-Fiber Instant SFP module on mvneta
    79bc854d44f9f MPTCP: fix lock class name family in pm_nl_create_listen_socket
    83170a05908b6 ext4: handle wraparound when searching for blocks for indirect mapped blocks
    a070d5a872ffe ext4: publish jinode after initialization
    e2316c5d759d3 dmaengine: fsl-edma: fix channel parameter config for fixed channel requests
    72c0f5de91098 dmaengine: fsl-edma: change to guard(mutex) within fsl_edma3_xlate()
    892ba47ef7140 x86/cpu: Enable FSGSBASE early in cpu_init_exception_handling()
    7ddcf4a245c1c mm/huge_memory: fix folio isn't locked in softleaf_to_folio()
    15f5241d5a523 scsi: target: tcm_loop: Drain commands in target_reset handler
    d88541ffd56d6 net: mana: fix use-after-free in add_adev() error path
    ed71cf465c75f net: correctly handle tunneled traffic on IPV6_CSUM GSO fallback
    a2d3c892115e1 net: macb: Move devm_{free,request}_irq() out of spin lock area
    9e7d5b7581ce1 iio: imu: inv_icm42600: fix odr switch when turning buffer off
    d1e3aa80e6e04 wifi: virt_wifi: remove SET_NETDEV_DEV to avoid use-after-free
    c6da4fed7537a usb: gadget: f_uac1_legacy: validate control request size
    cb5316b37288a usb: gadget: f_rndis: Protect RNDIS options with mutex
    75776a055b656 usb: gadget: f_subset: Fix unbalanced refcnt in geth_free
    c78e463ee134b usb: gadget: uvc: fix NULL pointer dereference during unbind race
    f6813c2b2ae78 usb: gadget: u_ether: Fix race between gether_disconnect and eth_stop
    3db70e16fccb4 LoongArch: vDSO: Emit GNU_EH_FRAME correctly
    cddea0c721106 gfs2: Validate i_depth for exhash directories
    514784b8951e7 gfs2: Improve gfs2_consist_inode() usage
    3a9fd45afadec btrfs: do not free data reservation in fallback from inline due to -ENOSPC
    681377e4e229d btrfs: fix the qgroup data free range for inline data extents
    f5b469a84400a usb: gadget: dummy_hcd: fix premature URB completion when ZLP follows partial transfer
    5aa776c8615be USB: dummy-hcd: Fix interrupt synchronization error
    791966f85b439 USB: dummy-hcd: Fix locking/synchronization error
    2516336e825fc thunderbolt: Fix property read in nhi_wake_supported()
    4b8e527aca357 misc: fastrpc: possible double-free of cctx->remote_heap
    9e796001af97a thermal: core: Fix thermal zone device registration error path
    e208c45c63258 gpio: mxc: map Both Edge pad wakeup to Rising Edge
    da39ee627fd82 cpufreq: governor: fix double free in cpufreq_dbs_governor_init() error path
    8a71911fc7eee net: ftgmac100: fix ring allocation unwind on open failure
    602596c69a70e vxlan: validate ND option lengths in vxlan_na_create
    28a371be901ef counter: rz-mtu3-cnt: do not use struct rz_mtu3_channel's dev member
    885aa739a07ab counter: rz-mtu3-cnt: prevent counter from being toggled multiple times
    6cea34d7ec682 netfilter: ipset: drop logically empty buckets in mtype_del
    aca0938d0bb44 nvmem: imx: assign nvmem_cell_info::raw_len
    eeb496e82b916 dt-bindings: connector: add pd-disable dependency
    1603dd471f477 comedi: me4000: Fix potential overrun of firmware buffer
    c16ac4e173a05 comedi: me_daq: Fix potential overrun of firmware buffer
    f517646e008fe comedi: ni_atmio16d: Fix invalid clean-up after failed attach
    c01bcc67a9a69 comedi: Reinit dev->spinlock between attachments to low-level drivers
    d5d9df8b08d68 comedi: dt2815: add hardware detection to prevent crash
    787c21d2cc13b cdc-acm: new quirk for EPSON HMD
    e0bfd6d4dc77a bridge: br_nd_send: validate ND option lengths
    2e5cbab8ccbfc fork: defer linking file vma until vma is fully initialized
    13e8e5bd99849 vfio/pci: Insert full vma on mmap'd MMIO fault
    1a0a115843ec4 vfio/pci: Use unmap_mapping_range()
    764438b5c5d15 vfio: Create vfio_fs_type with inode per device
    cfca84f5986af usb: cdns3: gadget: fix state inconsistency on gadget init failure
    9ab9b0e5fcdac usb: cdns3: gadget: fix NULL pointer dereference in ep_queue
    beab10429439e usb: dwc2: gadget: Fix spin_lock/unlock mismatch in dwc2_hsotg_udc_stop()
    af1e68c43ed88 usb: ehci-brcm: fix sleep during atomic
    95e09b07e5029 usb: usbtmc: Flush anchored URBs in usbtmc_release
    aaeae6533d77e usb: ulpi: fix double free in ulpi_register_interface() error path
    a6f374ba81dde usb: quirks: add DELAY_INIT quirk for another Silicon Motion flash drive
    1f83e4f8509aa iio: gyro: mpu3050: Fix out-of-sequence free_irq()
    2a4537653d200 iio: gyro: mpu3050: Move iio_device_register() to correct location
    8f237c408f300 iio: gyro: mpu3050: Fix irq resource leak
    a09171d3f23e1 iio: gyro: mpu3050: Fix incorrect free_irq() variable
    4cda5db84e917 iio: imu: st_lsm6dsx: Set FIFO ODR for accelerometer and gyroscope only
    11aaba2824a14 iio: imu: bmi160: Remove potential undefined behavior in bmi160_config_pin()
    dae6048cb63fe iio: light: vcnl4035: fix scan buffer on big-endian
    13f4f2d046661 iio: dac: ad5770r: fix error return in ad5770r_read_raw()
    97d908087e85c iio: accel: fix ADXL355 temperature signature value
    81b90c03dd65f Input: xpad - add support for Razer Wolverine V3 Pro
    6260b66c005fa Input: xpad - add support for BETOP BTP-KP50B/C controller's wireless mode
    92b1a92857002 Input: i8042 - add TUXEDO InfinityBook Max 16 Gen10 AMD to i8042 quirk table
    a6d5d972460ca Input: synaptics-rmi4 - fix a locking bug in an error path
    fa64aab25aba4 iio: adc: ti-adc161s626: use DMA-safe memory for spi_read()
    624e292e74769 USB: core: add NO_LPM quirk for Razer Kiyo Pro webcam
    619d8d1cc4688 USB: serial: option: add support for Rolling Wireless RW135R-GL
    d3f78e9cd0bbe USB: serial: io_edgeport: add support for Blackbox IC135A
    beadc871ccf86 drm/i915/dp: Use crtc_state->enhanced_framing properly on ivb/hsw CPU eDP
    32ac48642e71e drm/ast: dp501: Fix initialization of SCU2C
    7759f105e9c89 iio: adc: ti-adc161s626: fix buffer read on big-endian
    43fa022b56dcd mips: mm: Allocate tlb_vpn array atomically
    37ae8fadc74ed hwmon: (occ) Fix division by zero in occ_show_power_1()
    4c10f326f628e MIPS: Fix the GCC version check for `__multi3' workaround
    91649c02c1baa Bluetooth: SMP: force responder MITM requirements before building the pairing response
    b1c6a8e554a39 Bluetooth: SMP: derive legacy responder STK authentication from MITM state
    c8859675f1cf9 ALSA: ctxfi: Fix missing SPDIFI1 index handling
    a82c1bce2d129 ALSA: caiaq: fix stack out-of-bounds read in init_card
    2de70a6149e03 USB: serial: option: add MeiG Smart SRM825WN
    ffbed27ba15ef wifi: iwlwifi: mvm: fix potential out-of-bounds read in iwl_mvm_nd_match_info_handler()
    9907ac9b9a18b wifi: wilc1000: fix u8 overflow in SSID scan buffer size calculation
    489f2ef2b9088 drm/ioc32: stop speculation on the drm_compat_ioctl path
    0320474d92c69 riscv: kgdb: fix several debug register assignment bugs
    e01779a5c0283 mips: ralink: update CPU clock index
    649ceac79c831 hwmon: (occ) Fix missing newline in occ_show_extended()
    164a1b397da0c hwmon: (tps53679) Fix device ID comparison and printing in tps53676_identify()
    cb048be568a85 dt-bindings: gpio: fix microchip #interrupt-cells
    220f29e819244 hwmon: (pxe1610) Check return value of page-select write in probe
    2dd67966f39a2 accel/qaic: Handle DBC deactivation if the owner went away
    690509a2eea89 iio: imu: bno055: fix BNO055_SCAN_CH_COUNT off by one
    8755066f7bd0f bpf: reject direct access to nullable PTR_TO_BUF pointers
    5e4ee5dbea134 ipv6: avoid overflows in ip6_datagram_send_ctl()
    36a5d17d7ddad net: hsr: fix VLAN add unwind on slave errors
    4a09f72007201 net/sched: cls_flow: fix NULL pointer dereference on shared blocks
    18328eff2f97d net/sched: cls_fw: fix NULL pointer dereference on shared blocks
    1734bd85c5e0a net/x25: Fix overflow when accumulating packets
    143d4fa68ae9e net/x25: Fix potential double free of skb
    1fc7fbac8b98f net/mlx5: Avoid "No data available" when FW version queries fail
    7129632cab3e4 net/mlx5: lag: Check for LAG device before creating debugfs
    e1f6f47d6e60d net: macb: properly unregister fixed rate clocks
    b3f799cdf830d net: macb: fix clk handling on PCI glue driver removal
    a14b568633486 net/sched: sch_netem: fix out-of-bounds access in packet corruption
    8d597e3e74027 bpf: sockmap: Fix use-after-free of sk->sk_socket in sk_psock_verdict_data_ready().
    6b0a8de67ac0c rds: ib: reject FRMR registration before IB connection is established
    244b639e6a3a8 Bluetooth: MGMT: validate mesh send advertising payload length
    5fb69e1eeea9d Bluetooth: hci_event: fix potential UAF in hci_le_remote_conn_param_req_evt
    f71695e81f4cb Bluetooth: MGMT: validate LTK enc_size on load
    adb90cd0f9f7a Bluetooth: SCO: fix race conditions in sco_sock_connect()
    2504ce3fc39ed Bluetooth: hci_sync: call destroy in hci_cmd_sync_run if immediate
    4b12a3cc3f075 netfilter: nf_tables: reject immediate NF_QUEUE verdict
    f00ac65c90ea4 netfilter: x_tables: restrict xt_check_match/xt_check_target extensions for NFPROTO_ARP
    2ea0f35f235f7 netfilter: ctnetlink: ignore explicit helper on new expectations
    a76157a1eee5f netfilter: nf_conntrack_expect: store netns and zone in expectation
    e7ccaa0a62a8f netfilter: nf_conntrack_expect: use expect->helper
    d81c3205085b5 netfilter: nf_conntrack_expect: honor expectation helper field
    2898080c054ea netfilter: ctnetlink: zero expect NAT fields when CTA_EXPECT_NAT absent
    2cf2737c85a2b netfilter: nf_conntrack_helper: pass helper to expect cleanup
    1b842ade214b9 netfilter: ipset: use nla_strcmp for IPSET_ATTR_NAME attr
    c2d4a3abb15ca netfilter: x_tables: ensure names are nul-terminated
    607245c4dbb86 netfilter: nfnetlink_log: account for netlink header size
    5382bb03e9c33 netfilter: flowtable: strictly check for maximum number of actions
    6c7fbdb8ffde6 net: ipv6: flowlabel: defer exclusive option free until RCU teardown
    b99d82706bd15 bpf: Fix regsafe() for pointers to packet
    236b564165b49 net: xilinx: axienet: Correct BD length masks to match AXIDMA IP spec
    2c1fadd221b21 NFC: pn533: bound the UART receive buffer
    e35f5195cd44f net: sched: cls_api: fix tc_chain_fill_node to initialize tcm_info to zero to prevent an info-leak
    7d9f2f4aabd11 ipv6: prevent possible UaF in addrconf_permanent_addr()
    584d8648f859f ASoC: ep93xx: Fix unchecked clk_prepare_enable() and add rollback on failure
    c56f78614e778 net/sched: sch_hfsc: fix divide-by-zero in rtsc_min()
    658261898130d bridge: br_nd_send: linearize skb before parsing ND options
    a0c4ce9900a10 ip6_tunnel: clear skb2->cb[] in ip4ip6_err()
    3d5127d998de6 ipv6: icmp: clear skb2->cb[] in ip6_err_gen_icmpv6_unreach()
    c64dc67d70da6 tg3: Fix race for querying speed/duplex
    d1b041080086e net/ipv6: ioam6: prevent schema length wraparound in trace fill
    7f56d87e527bb net: ipv6: ndisc: fix ndisc_ra_useropt to initialize nduseropt_padX fields to zero to prevent an info-leak
    0fda873092b54 net: qrtr: replace qrtr_tx_flow radix_tree with xarray to fix memory leak
    3e52e1b121c28 net: fec: fix the PTP periodic output sysfs interface
    7cdf2c6381b21 crypto: af-alg - fix NULL pointer dereference in scatterwalk
    31022cfde5235 crypto: caam - fix overflow on long hmac keys
    a7ecf06d3ee06 crypto: caam - fix DMA corruption on long hmac keys
    4073217be3df0 wifi: ath11k: Pass the correct value of each TID during a stop AMPDU session
    18e28353074a3 wifi: ath11k: Use dma_alloc_noncoherent for rx_tid buffer allocation
    12322d8654cf9 wifi: ath11k: skip status ring entry processing
    90afe0af4452b dt-bindings: auxdisplay: ht16k33: Use unevaluatedProperties to fix common property warning
    ea553dfb630e1 spi: geni-qcom: Check DMA interrupts early in ISR
    295f8075d0044 btrfs: reject root items with drop_progress and zero drop_level
    b404e6b9863ea i2c: tegra: Don't mark devices with pins as IRQ safe
    c7a27bb4d0f65 HID: multitouch: Check to ensure report responses match the request
    e9126544fd779 objtool: Fix Clang jump table detection
    960159a9f8468 tg3: replace placeholder MAC address with device property
    c9fc98beeedf0 btrfs: don't take device_list_mutex when querying zone info
    b256d055da472 atm: lec: fix use-after-free in sock_def_readable()
    8bd690ac12423 HID: wacom: fix out-of-bounds read in wacom_intuos_bt_irq
    7b56b67776520 arm64/scs: Fix handling of advance_loc4
    80de0a9581338 Linux 6.6.133
    9a3a2ae5efbbc xattr: switch to CLASS(fd)
    16d41d32b7c76 Revert "xattr: switch to CLASS(fd)"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index c58279873e..6440d0babb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a6a88382093932d5f963f38334035221c0b8344e"
-SRCREV_meta ?= "8cfac9f000ccc138d1a11ed500406c4394d803d6"
+SRCREV_machine ?= "fda570bd42ccafdd93a2bc4eae0ab36a4084031e"
+SRCREV_meta ?= "888e60b42c251c492d6f41f154bb8c4eef5f8875"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.132"
+LINUX_VERSION ?= "6.6.134"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 58fd5a57b8..deb5943145 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.132"
+LINUX_VERSION ?= "6.6.134"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "ff381816e34f3ed488248a69843227160f7ede06"
-SRCREV_meta ?= "8cfac9f000ccc138d1a11ed500406c4394d803d6"
+SRCREV_machine ?= "990b12e4095890d00a1c42ee5643443f1491dc0e"
+SRCREV_meta ?= "888e60b42c251c492d6f41f154bb8c4eef5f8875"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 633abb36dd..11efb351e9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "ecff059b6885829e70f8a0fa96956e330b3dc8a4"
-SRCREV_machine:qemuarm64 ?= "a2808cd3d14323f1be06f83c084f7ccc19346305"
-SRCREV_machine:qemuloongarch64 ?= "81aa29cd11159e96623449efb43a609e1a814c87"
-SRCREV_machine:qemumips ?= "e785bf4e3c24d0f6a02c1c12c4b636eaaa539f19"
-SRCREV_machine:qemuppc ?= "f1e47cb079d5fa8a5f22f795bd4130dc001babab"
-SRCREV_machine:qemuriscv64 ?= "81aa29cd11159e96623449efb43a609e1a814c87"
-SRCREV_machine:qemuriscv32 ?= "81aa29cd11159e96623449efb43a609e1a814c87"
-SRCREV_machine:qemux86 ?= "81aa29cd11159e96623449efb43a609e1a814c87"
-SRCREV_machine:qemux86-64 ?= "81aa29cd11159e96623449efb43a609e1a814c87"
-SRCREV_machine:qemumips64 ?= "6357451678385be03d1f7d60d0f8868aa7514418"
-SRCREV_machine ?= "81aa29cd11159e96623449efb43a609e1a814c87"
-SRCREV_meta ?= "8cfac9f000ccc138d1a11ed500406c4394d803d6"
+SRCREV_machine:qemuarm ?= "55c82e0b84e8892add226263bb00dfaef810f487"
+SRCREV_machine:qemuarm64 ?= "c3b5dcdca64f2d9d5dfd9808b2ec4d1363ddc5c2"
+SRCREV_machine:qemuloongarch64 ?= "3db526a0348edbb162b13d91e788eb270bcbb934"
+SRCREV_machine:qemumips ?= "065d9d6fa1db8f762b740b0fac999e8d68b3afcf"
+SRCREV_machine:qemuppc ?= "dd0d7b2a25b1fc953887f6d32247c58b19f23e73"
+SRCREV_machine:qemuriscv64 ?= "3db526a0348edbb162b13d91e788eb270bcbb934"
+SRCREV_machine:qemuriscv32 ?= "3db526a0348edbb162b13d91e788eb270bcbb934"
+SRCREV_machine:qemux86 ?= "3db526a0348edbb162b13d91e788eb270bcbb934"
+SRCREV_machine:qemux86-64 ?= "3db526a0348edbb162b13d91e788eb270bcbb934"
+SRCREV_machine:qemumips64 ?= "5546a26cb003a61697b9c748e80c964188dbde1b"
+SRCREV_machine ?= "3db526a0348edbb162b13d91e788eb270bcbb934"
+SRCREV_meta ?= "888e60b42c251c492d6f41f154bb8c4eef5f8875"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "08667c1437c07ce2e5d323165031ae152d6f061a"
+SRCREV_machine:class-devupstream ?= "8cee53b8eaeb5d1f7c97b7f2381653ed00ffc26b"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.132"
+LINUX_VERSION ?= "6.6.134"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


