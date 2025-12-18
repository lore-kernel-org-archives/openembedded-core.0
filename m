Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94779D711AC
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 20:22:53 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1925.1766089371669519759
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 12:22:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GhPFDUnE;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id af79cd13be357-8b29ff9d18cso112288785a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 12:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766089371; x=1766694171; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OgtQU/jCBrmu+mqVzvm6nzHTRuctI8VH6lWJK1sUEU4=;
        b=GhPFDUnEzp089GV4B+Qw3GbpUC1R+mFr7CxaymSJN0enpkoJaafjNFGAHhmfip+vGy
         P/ejCEfvMlOABD/cKgX8Eo8SuYBsYs6nwuScr2bs7w0Cc5BYTo5LD39huJJXxS3yUKwm
         4ZUwZmiZh1B6giDm8lwaaBEb/kASNCm3bM+/WctOBW2FtOn2KE529pgAf9TlOWS08T9g
         7CpSZDwICl0QgO9jmgKWYqDLVMvnSKS7GgnA5poHD/bFpbtrsfpEXCrYrewWFkKOa/Y+
         yGFcIeVcsmFPwRHOY0ecRv+U+3i719gVEI1qauKma/gCmnmcGE4yl4IGkAFXAqgUXJXT
         Utyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766089371; x=1766694171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OgtQU/jCBrmu+mqVzvm6nzHTRuctI8VH6lWJK1sUEU4=;
        b=PXlYG/yHHHoebx60kVJTlxYIhW1hGCeGBW8MKEppmGc3pyJBdIeM+3/gVmGE/44+Zm
         ZUg9U+glPeDhg9W27+d0ktdbSahzx4J4umWJs3dq3kyfDNjTZLMseg6IGJ42qsuBW2CU
         PiobY/JDZUMngpD0RnqfCjN50H3sDOWELMctEvEoFaDGFe1c+XteNraSB45TT80UpB4c
         ZLnaoU4eAtFl7nNGOcRt++rHQcli4Wv7GS3iVH0aHlk9P+D9e7fQbXbaNmed5PXNuHg1
         jOBJzvPyKVYb/3sKwNjxwDelfK3ji4AdtsjYZJ9wA2APFTIlYxxbE6jf/KW2jU0OZyfr
         r75g==
X-Gm-Message-State: AOJu0YzxFmtxgdevcz6mgYAdOrWp6MXNgoUdIAvhH/dOEz1qwBeEJdPB
	eU8eFvvhnpvKs+0Vqkf18uwVKyPhavfZWZQNgxhzDygeIeekfZuV1O3NxsE5lXc8M22eBg==
X-Gm-Gg: AY/fxX5Qf0r7WoChkhGs0NyHyV6rO+pd50+XvlTcQfprUb3zvWjM+rwVOVNBtyB6w0S
	OV0K75CXHtchqU04p3Q8qM0yHJBlHJrz+3JtMGsdvPu8kIhVt+2xAauyVrsnQjT+jiG4UOJ2ZrB
	1cmVqXb3pkVha9ap892VejxP0Xa/b3BBbai/v7hcwfA0T+obJutcYOxFVBoL3OjZBChg7WdRZPy
	iq97QmhacZkWw3fkvxYDrplyAwuzRaarGxqhLSrNzbf1c9DUsmm/OufFVXk9A9p3CeduwZVHBxr
	P/Q5qMWKHoXzKJr1MrSMtiBu3Fp4QOnP4Gm9S+uSjLXYiB0/pKyD6wJffZIEEc9E4Hvf+rbvEdH
	F4j0ergbwDhskXW1mqL4d0C7Rh9A7rnsE4FD4dNQhGQPsq7wkAXufr8bYRChhKblcPMXR7mfoFg
	c+etfevi++6qWD16n1b3fVFC7t0PjatH44nrJcZWOBciKE41Igtaaplx7KTcQRqWIMegTLF5adg
	v3T05YZTIDSdak=
X-Google-Smtp-Source: AGHT+IGMpDFqwmyLYNJPKVZqb6vuzo1k7xXmyjN2hkhtDekDRnPv90N9a6WcCk3QAg2re+T4uPHDQA==
X-Received: by 2002:a05:620a:4412:b0:8b2:f182:6945 with SMTP id af79cd13be357-8c0901241dbmr136080485a.58.1766089370474;
        Thu, 18 Dec 2025 12:22:50 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7dbdcsm3226456d6.43.2025.12.18.12.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 12:22:49 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [02/15][openembedded-core] linux-yocto/6.12: update to v6.12.61
Date: Thu, 18 Dec 2025 15:22:27 -0500
Message-Id: <20251218202248.70476-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1766087617.bruce.ashfield@gmail.com>
References: <cover.1766087617.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 20:22:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228145

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    dcbeffaf66d03 Linux 6.12.61
    c640adf07d874 spi: spi-nxp-fspi: Check return value of devm_mutex_init()
    e656ba6ca5347 drm/i915/dp: Initialize the source OUI write timestamp always
    fe0d2f610f12f Revert "ACPI: Suppress misleading SPCR console message when SPCR table is absent"
    a1eb56723b320 wifi: ath12k: correctly handle mcast packets for clients
    a017b984db205 net: dsa: microchip: Free previously initialized ports on init failures
    7f0bc8f2c8995 net: dsa: microchip: Do not execute PTP driver code for unsupported switches
    482330f8261b4 drm, fbcon, vga_switcheroo: Avoid race condition in fbcon setup
    1ba6da6ca3db7 net: dsa: microchip: Fix symetry in ksz_ptp_msg_irq_{setup/free}()
    6bee6fc3ed124 KVM: SVM: Fix redundant updates of LBR MSR intercepts
    76b0fef087465 KVM: nSVM: Fix and simplify LBR virtualization handling with nested
    c931ea944e575 KVM: nSVM: Always recalculate LBR MSR intercepts in svm_update_lbrv()
    d8a64e55ceb26 KVM: SVM: Introduce svm_recalc_lbr_msr_intercepts()
    592db83615a9f mm/huge_memory: fix NULL pointer deference when splitting folio
    10014310193cf usb: gadget: udc: fix use-after-free in usb_gadget_state_work
    0a544833e2664 usb: udc: Add trace event for usb_gadget_set_state
    f88ba5098e833 can: rcar_canfd: Fix CAN-FD mode as default
    59cb298d69c0b usb: typec: ucsi: psy: Set max current to zero when disconnected
    6326eb4c58dbf nfsd: Replace clamp_t in nfsd4_get_drc_mem()
    bccf7c5cd434a staging: rtl8712: Remove driver using deprecated API wext
    e67e3be690f5f libceph: replace BUG_ON with bounds check for map->max_osd
    5ef575834ca99 libceph: prevent potential out-of-bounds writes in handle_auth_session_key()
    e08021b3b56b2 libceph: fix potential use-after-free in have_mon_and_osd_map()
    9428654c827fa net: dsa: microchip: Don't free uninitialized ksz_irq
    040444baae90c net: dsa: microchip: ptp: Fix checks on irq_find_mapping()
    4d15bbe4997cf net: dsa: microchip: common: Fix checks on irq_find_mapping()
    901a8766734b6 drm/amd/display: Don't change brightness for disabled connectors
    f7cf491cd5b54 drm/amd/display: Check NULL before accessing
    204d3bb80c927 drm/amd/amdgpu: reserve vm invalidation engine for uni_mes
    9cb4deb88350b drm: sti: fix device leaks at component probe
    d24483349b012 USB: serial: option: add support for Rolling RW101R-GL
    4009495262338 USB: serial: ftdi_sio: add support for u-blox EVK-M101
    81fbc6f6dcaab xhci: dbgtty: fix device unregister
    aa55e09cfc4b6 xhci: dbgtty: Fix data corruption when transmitting data form DbC to host
    d77efd7b3def7 xhci: fix stale flag preventig URBs after link state error is cleared
    7cfb62888eba2 usb: dwc3: Fix race condition between concurrent dwc3_remove_requests() call paths
    61fcb9833071f usb: dwc3: pci: Sort out the Intel device IDs
    425ef1fa2ca7e usb: dwc3: pci: add support for the Intel Nova Lake -S
    2b90a8131c83f usb: uas: fix urb unmapping issue when the uas device is remove during ongoing data transfer
    a20f1dd19d21d usb: storage: sddr55: Reject out-of-bound new_pba
    fada9c8f7ee80 USB: storage: Remove subclass and protocol overrides from Novatek quirk
    0f18eac44c566 usb: storage: Fix memory leak in USB bulk transport
    26838f147aeaa usb: renesas_usbhs: Fix synchronous external abort on unbind
    e72c963177c70 usb: gadget: f_eem: Fix memory leak in eem_unwrap
    77124212374da usb: cdns3: Fix double resource release in cdns3_pci_probe
    2274767dc02b7 most: usb: fix double free on late probe failure
    8fef76f57966c serial: amba-pl011: prefer dma_mapping_error() over explicit address checking
    05f5e26d488cd mptcp: Initialise rcv_mss before calling tcp_send_active_reset() in mptcp_do_fastclose().
    3725bca17d021 mptcp: clear scheduled subflows on retransmit
    ce3b8270392fd mmc: sdhci-of-dwcmshc: Promote the th1520 reset handling to ip level
    50b4c1c28733a mm/memfd: fix information leak in hugetlb folios
    60ab1851614e6 firmware: stratix10-svc: fix bug in saving controller data
    96d9a20a66d56 nvmem: layouts: fix nvmem_layout_bus_uevent
    0904f0400e93c slimbus: ngd: Fix reference count leak in qcom_slim_ngd_notify_slaves
    1a96b5f823a34 thunderbolt: Add support for Intel Wildcat Lake
    f15288c137d96 smb: client: fix memory leak in cifs_construct_tcon()
    237f00629b246 drivers/usb/dwc3: fix PCI parent check
    b3f5d4f6af00b dm-verity: fix unreliable memory allocation
    47144748fbf12 ceph: fix crash in process_v2_sparse_read() for encrypted directories
    b6aa7c5e29cdb can: sun4i_can: sun4i_can_interrupt(): fix max irq loop handling
    0f7213b8fbc66 can: sja1000: fix max irq loop handling
    2fa09fe98ca3b Bluetooth: btusb: mediatek: Avoid btusb_mtk_claim_iso_intf() NULL deref
    667ac86882322 atm/fore200e: Fix possible data race in fore200e_open()
    df4630d02b42a ARM: dts: nxp: imx6ul: correct SAI3 interrupt line
    b543d79b4f48a arm64: dts: imx8qm-mek: fix mux-controller select/enable-gpios polarity
    8e93451fe5394 arm64: dts: imx8dxl-ss-conn: swap interrupts number of eqos
    866df92e7041a ALSA: usb-audio: Add DSD quirk for LEAK Stereo 230
    922fdd0b755a8 tracing: Fix WARN_ON in tracing_buffers_mmap_close for split VMAs
    63a93d1cd6077 MIPS: mm: kmalloc tlb_vpn array to avoid stack overflow
    135178e90aa43 MIPS: mm: Prevent a TLB shutdown on initial uniquification
    45abbbdb46578 iio: adc: rtq6056: Correct the sign bit index
    6656fbfee4f42 iio: adc: ad7280a: fix ad7280_store_balance_timer()
    96a474c35d0f3 iio: accel: fix ADXL355 startup race condition
    65ad4ed983fd9 iio: accel: bmc150: Fix irq assumption regression
    9ef53b3540338 iio: adc: stm32-dfsdm: fix st,adc-alt-channel property handling
    5b82774d0e4fa iio:common:ssp_sensors: Fix an error handling path ssp_probe()
    90e8768209264 iio: imu: st_lsm6dsx: fix array size for st_lsm6dsx_settings fields
    9434c58b8e421 iio: humditiy: hdc3020: fix units for thresholds and hysteresis
    70e1c26f8c469 iio: humditiy: hdc3020: fix units for temperature and humidity measurement
    af8a7abca453d iio: buffer: support getting dma channel from the buffer
    6717a94824203 iio: buffer-dmaengine: enable .get_dma_dev()
    61f136211d063 iio: buffer-dma: support getting the DMA channel
    0cc09278c39c4 Revert "perf/x86: Always store regs->ip in perf_callchain_kernel()"
    a2b16ee991df0 Revert "drm/amd/display: Move setup_stream_attribute"
    e31194bf494f6 spi: bcm63xx: fix premature CS deassertion on RX-only transactions
    74d016b9909e0 spi: nxp-fspi: Propagate fwnode in ACPI case as well
    29504b730405c spi: spi-nxp-fspi: Add OCT-DTR mode support
    96ff82494bb3e spi: spi-nxp-fspi: remove the goto in probe
    f08573eb642e6 spi: nxp-fspi: Support per spi-mem operation frequency switches
    c02d4deb82225 spi: spi-mem: Add a new controller capability
    0941b7cdfc023 spi: spi-mem: Extend spi-mem operations with a per-operation maximum frequency
    698c2abf5280c spi: spi-mem: Allow specifying the byte order in Octal DTR mode
    1f4a8954c6755 spi: amlogic-spifc-a1: Handle devm_pm_runtime_enable() errors
    6e5ee3c217265 spi: tegra114: remove Kconfig dependency on TEGRA20_APB_DMA
    4a16b2a0c1f03 fs/namespace: fix reference leak in grab_requested_mnt_ns
    1080ed39eae39 mailbox: pcc: don't zero error register
    733e3d0c1ab37 mailbox: pcc: Refactor error handling in irq handler into separate function
    ba7a25411c6a5 mailbox: mtk-cmdq: Refine DMA address handling for the command buffer
    f73d41f2a1d6f mailbox: mailbox-test: Fix debugfs_create_dir error checking
    779a422b45d0b usb: gadget: renesas_usbf: Handle devm_pm_runtime_enable() errors
    051e941285b2d iio: st_lsm6dsx: Fixed calibrated timestamp calculation
    4c6c2cf740532 net: fec: do not register PPS event for PEROUT
    ca2964a7cb1ee net: fec: do not allow enabling PPS and PEROUT simultaneously
    10bc6ce79eaab net: fec: do not update PEROUT if it is enabled
    18a474a325572 net: fec: cancel perout_timer when PEROUT is disabled
    3fd2105e1b7e0 net: atlantic: fix fragment overflow handling in RX path
    c40cbebc1a5f4 eth: fbnic: Fix counter roll-over issue
    7c18cd7aa31c1 net: dsa: sja1105: fix SGMII linking at 10M or 100M but not passing traffic
    5b5159fc64fb7 net: dsa: sja1105: simplify static configuration reload
    b7e9ba8dfbfaa net: wwan: mhi: Keep modem name match with Foxconn T99W640
    b46aaeafd6da9 drm/amdgpu: fix cyan_skillfish2 gpu info fw handling
    45b5b4ddb8d6b net: sxgbe: fix potential NULL dereference in sxgbe_rx()
    4040b5e896398 team: Move team device type change at the end of team_port_add
    cf7922c7597a8 net/mlx5e: Fix validation logic in rate limiting
    15f4066889157 drm/xe: Fix conversion from clock ticks to milliseconds
    c20df1e31be2f net: lan966x: Fix the initialization of taprio
    47e6085425bdc net: aquantia: Add missing descriptor cache invalidation on ATL2
    a21615a4ac6fe platform/x86: intel: punit_ipc: fix memory corruption
    fec6e69f0a35d net: phy: mxl-gpy: fix bogus error on USXGMII and integrated PHY
    c1ceabcb347d1 veth: reduce XDP no_direct return section to fix race
    dd419a3f2ebc1 veth: more robust handing of race to avoid txq getting stuck
    76bed44c5a3c3 veth: prevent NULL pointer dereference in veth_xdp_rcv
    9fe31b3f31453 veth: apply qdisc backpressure on full ptr_ring to reduce TX drops
    bf7528722e936 net: sched: generalize check for no-queue qdisc on TX queue
    429bcd8ffa531 Bluetooth: SMP: Fix not generating mackey and ltk when repairing
    e90c05fc5bbea Bluetooth: hci_sock: Prevent race in socket write iter and sock bind
    b1225ccdbdf86 Bluetooth: hci_core: Fix triggering cmd_timer for HCI_OP_NOP
    421e88a0d8578 Bluetooth: btusb: mediatek: Fix kernel crash when releasing mtk iso interface
    ad55004a3cb5b can: gs_usb: gs_usb_receive_bulk_callback(): check actual_length before accessing data
    616eee3e895b8 can: gs_usb: gs_usb_receive_bulk_callback(): check actual_length before accessing header
    4a82072e451ea can: gs_usb: gs_usb_xmit_callback(): fix handling of failed transmitted URBs
    0897cea266e39 can: kvaser_usb: leaf: Fix potential infinite loop in command parsers

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index c4cef55c86..9e29a82ea5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b23e01aff4eb21167db80c8d178ffeaf174be51c"
-SRCREV_meta ?= "204830448d850850867fa4ca7ee0dab04fdb7011"
+SRCREV_machine ?= "114f737b448424bfd7c43548ae1e58fd59629d69"
+SRCREV_meta ?= "b79e50adbe76c872daa7748ac7ac9c80b253e2b9"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.60"
+LINUX_VERSION ?= "6.12.61"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 2818a9fd40..7654b1f1ce 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.60"
+LINUX_VERSION ?= "6.12.61"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "cd2fe60ac1c07ad28e3c84e4325c3f8163ce3719"
-SRCREV_meta ?= "204830448d850850867fa4ca7ee0dab04fdb7011"
+SRCREV_machine ?= "b9d9738047f6057fdbdb871bdc93771069995308"
+SRCREV_meta ?= "b79e50adbe76c872daa7748ac7ac9c80b253e2b9"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 4a82ea08a2..9c34e0b51f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "0435f9a900bbfb3daa3a28123d517c6437831628"
-SRCREV_machine:qemuarm64 ?= "cd2fe60ac1c07ad28e3c84e4325c3f8163ce3719"
-SRCREV_machine:qemuloongarch64 ?= "cd2fe60ac1c07ad28e3c84e4325c3f8163ce3719"
-SRCREV_machine:qemumips ?= "07d29856173d5d2cec0a67801492a95a00e03491"
-SRCREV_machine:qemuppc ?= "cd2fe60ac1c07ad28e3c84e4325c3f8163ce3719"
-SRCREV_machine:qemuriscv64 ?= "cd2fe60ac1c07ad28e3c84e4325c3f8163ce3719"
-SRCREV_machine:qemuriscv32 ?= "cd2fe60ac1c07ad28e3c84e4325c3f8163ce3719"
-SRCREV_machine:qemux86 ?= "cd2fe60ac1c07ad28e3c84e4325c3f8163ce3719"
-SRCREV_machine:qemux86-64 ?= "cd2fe60ac1c07ad28e3c84e4325c3f8163ce3719"
-SRCREV_machine:qemumips64 ?= "f21d4ebef1ebdfd38a182e87c7bdaad6fe79ba3c"
-SRCREV_machine ?= "cd2fe60ac1c07ad28e3c84e4325c3f8163ce3719"
-SRCREV_meta ?= "204830448d850850867fa4ca7ee0dab04fdb7011"
+SRCREV_machine:qemuarm ?= "01d15e59dee5c1c149992c55072ea3ffd06e803f"
+SRCREV_machine:qemuarm64 ?= "b9d9738047f6057fdbdb871bdc93771069995308"
+SRCREV_machine:qemuloongarch64 ?= "b9d9738047f6057fdbdb871bdc93771069995308"
+SRCREV_machine:qemumips ?= "20382395aabd0edcee9edb6e4a9fc964782e9f66"
+SRCREV_machine:qemuppc ?= "b9d9738047f6057fdbdb871bdc93771069995308"
+SRCREV_machine:qemuriscv64 ?= "b9d9738047f6057fdbdb871bdc93771069995308"
+SRCREV_machine:qemuriscv32 ?= "b9d9738047f6057fdbdb871bdc93771069995308"
+SRCREV_machine:qemux86 ?= "b9d9738047f6057fdbdb871bdc93771069995308"
+SRCREV_machine:qemux86-64 ?= "b9d9738047f6057fdbdb871bdc93771069995308"
+SRCREV_machine:qemumips64 ?= "795cfe93f0ba66e70c427b244c3a42a3150d23d1"
+SRCREV_machine ?= "b9d9738047f6057fdbdb871bdc93771069995308"
+SRCREV_meta ?= "b79e50adbe76c872daa7748ac7ac9c80b253e2b9"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "318a47068f7b88de838518897500d7509e3fe205"
+SRCREV_machine:class-devupstream ?= "dcbeffaf66d03968970d7d68ec7800032d00180e"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.60"
+LINUX_VERSION ?= "6.12.61"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


