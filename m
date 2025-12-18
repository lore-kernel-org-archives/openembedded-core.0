Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 871A2D711B1
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 20:23:03 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2023.1766089378224196940
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 12:22:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bB9KGBS0;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8b2a4b6876fso159615485a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 12:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766089377; x=1766694177; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Pc9MuPZrem9KUOH3ApJ2hx6azipDuHsb5KL2gEK9wk=;
        b=bB9KGBS02stI9iF6+gO4DQBD8COSuIExSXM3Do9ZKntGAU3h8gHJ0RGiex4DQ1UhE+
         tfPrWWiAZC+Mzmay8Lk2H/ab/S7q+38kfkiJPObw4XDeEFMv8BYskJNGOB0nUv3smWon
         URf83mB/E4U9R8WANxtIXuS7LhmXty3uRFP7YZeymJ+6O3h60yqHqmhjBr1kXEDDh8s/
         r9wuDQk8Cz9nCGqi1yZnEFkR1hB2XXz+TRWl9UXfkH1/zDwn53iGcNEYFFT7OjWTR4YA
         H8R+IpNYQ4Pkynyo6PT/I6sZNBQ17JeJihyMsGaH6dOjSpE/jUiuwqPcvTBkAdHC0Vgp
         9XNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766089377; x=1766694177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7Pc9MuPZrem9KUOH3ApJ2hx6azipDuHsb5KL2gEK9wk=;
        b=pkPyC5H0h42RJcLnXOasTRfU+Vna7YUC4csZWToCWSft8an8JONwTmb3cEmoHfeTxo
         X7h4BryPVNEojLIM1lrIoXY/G6z4jv5PhHk3j0Td5t4TBXUYgpcJMLjcaHW54/6BCQJo
         e8EN2ReUqHmQ272caEJcwpu4B0nZSEYI9KzG/UfVXljT66VyXjG6Kr9rgY5uJUwbf1ti
         e+yscfTfxEhAa1sZltvh5VXiSK1VZcN0y2K8yJdJBiW+e4SdtjfAVHeUp+9X7QsT2aTE
         tLj91GSKyVQ7ILRbt6OnjMJuCB/ll357g/XBHje2vAWJkz8QaKXFzlOJVqDMpbAdifmS
         UZnA==
X-Gm-Message-State: AOJu0YyIVaO7nV3Zx5zxhT79y+eUEYcaFtF22AldxhD8Yz82+hWGzsQc
	o0vmoIl2ensOyHqeYaozcvR1agA9yyrxuHpdQQr5bpQnzPi+ijKDB2DpRsgxYnVscrQ=
X-Gm-Gg: AY/fxX7fYkFAzvd9pR+/0rnuYOD9XYwdnVc8OZMaVooOkUwdR7Tw7JdPhHUlKWjz1KI
	vrKzwv6YQFwNf6ThIeYJ1BuyrVQbseoYZEDtx3NeyKatrzANUYkrG90K3Jb/AHG0Xd2gUMDLQA4
	U/QrVOo/wgKEn7RlkxL29Qkq9xxrMhlRVANeAHQFuhg9AejVSO1ynJLzs1BsIJFxD5AOrhIizks
	wzFzy3RiGNc9kE0lzx+p9WQXog8DbHRa3/u1hADNSeOvtmnKDMpGBnMn5D4hPy/MwgQhQRgzxZj
	sm4WjszAHjYHEzDq+sD3J57IthgQ7EGQZ9QEZ7aMNq0QpyIT4h2eX5YvuhY7xUA5uASI9WbrM25
	u2RtoMWtDDKXuQUN2BWCqH4bijszezjNpN6hlR71YloK0D5o7f4wUZ6s82EsRsAWHgQPj8Q3GwF
	JbVCX04FRQQU9KmeSwKf/oVhX5xvCK2lHMhSQZZCer/QDn0+3AclKUdX9CoYm3EWRfl5YdGVBSA
	/N1xjHhaqECJdU=
X-Google-Smtp-Source: AGHT+IHD+qni1WNB4fyZ6OGNf8i+2xTeO6MvgBHH9wMAY9K/VuSsWrpAEwNwszX9UXtYYdTStDJxxQ==
X-Received: by 2002:a05:620a:28cd:b0:8b2:effe:b4d4 with SMTP id af79cd13be357-8c08fbbc3e5mr141712685a.78.1766089377077;
        Thu, 18 Dec 2025 12:22:57 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7dbdcsm3226456d6.43.2025.12.18.12.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 12:22:56 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [07/15][openembedded-core] linux-yocto/6.17: update to v6.17.11
Date: Thu, 18 Dec 2025 15:22:32 -0500
Message-Id: <20251218202248.70476-7-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1766087617.bruce.ashfield@gmail.com>
References: <cover.1766087617.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 20:23:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228150

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.17 to the latest korg -stable release that comprises
the following commits:

    5439375ca6987 Linux 6.17.11
    433ec03c531fe spi: cadence-quadspi: Fix cqspi_probe() error handling for runtime pm
    8444e2491524c Revert "ACPI: Suppress misleading SPCR console message when SPCR table is absent"
    3b32caa73d135 usb: gadget: udc: fix use-after-free in usb_gadget_state_work
    66bd704199465 usb: udc: Add trace event for usb_gadget_set_state
    5ddd41b6877ff mm: swap: remove duplicate nr_swap_pages decrement in get_swap_page_of_type()
    b4368b7f97014 libceph: replace BUG_ON with bounds check for map->max_osd
    6920ff09bf911 libceph: prevent potential out-of-bounds writes in handle_auth_session_key()
    3fc43120b22a3 libceph: fix potential use-after-free in have_mon_and_osd_map()
    ae12e4e0ca231 net: dsa: microchip: Fix symetry in ksz_ptp_msg_irq_{setup/free}()
    649f2ff1ef6ea net: dsa: microchip: Free previously initialized ports on init failures
    32abbcf4379a0 net: dsa: microchip: Don't free uninitialized ksz_irq
    903c8a114fa2b net: dsa: microchip: ptp: Fix checks on irq_find_mapping()
    21d2c2423473c net: dsa: microchip: common: Fix checks on irq_find_mapping()
    330198fe2642e drm/amd/display: Increase EDID read retries
    c36bc1d09b636 drm/amd/display: Don't change brightness for disabled connectors
    62150f1e7ec70 drm/amd/display: Check NULL before accessing
    418ec6670bc2e drm/amd/amdgpu: reserve vm invalidation engine for uni_mes
    23316ed02c228 drm/amdgpu: attach tlb fence to the PTs update
    1966838d1c821 drm/xe/guc: Fix stack_depot usage
    e19d1d97d7f77 drm/i915/psr: Reject async flips when selective fetch is enabled
    b4f97ed17917c drm: sti: fix device leaks at component probe
    960e1220ef4ec USB: serial: option: add support for Rolling RW101R-GL
    317ee5d0123a2 USB: serial: ftdi_sio: add support for u-blox EVK-M101
    5cb53ca8e81cc xhci: dbgtty: fix device unregister
    372f1b4029b8a xhci: dbgtty: Fix data corruption when transmitting data form DbC to host
    cc794fd11df12 xhci: fix stale flag preventig URBs after link state error is cleared
    fa5eaf701e576 usb: dwc3: Fix race condition between concurrent dwc3_remove_requests() call paths
    2b653f426ef68 usb: dwc3: pci: Sort out the Intel device IDs
    fcde9a1000f4c usb: dwc3: pci: add support for the Intel Nova Lake -S
    426edbfc88b22 usb: uas: fix urb unmapping issue when the uas device is remove during ongoing data transfer
    222f5fdae114d usb: typec: ucsi: psy: Set max current to zero when disconnected
    5ebe8d479aaf4 usb: storage: sddr55: Reject out-of-bound new_pba
    96ada13ff2241 USB: storage: Remove subclass and protocol overrides from Novatek quirk
    5b815ddb3f556 usb: storage: Fix memory leak in USB bulk transport
    aa658a6d5ac21 usb: renesas_usbhs: Fix synchronous external abort on unbind
    0dea2e0069a7e usb: gadget: f_eem: Fix memory leak in eem_unwrap
    6e6fbcf1ce751 usb: cdns3: Fix double resource release in cdns3_pci_probe
    8d8ffefe3d5d8 most: usb: fix double free on late probe failure
    a2df53d860af7 serial: amba-pl011: prefer dma_mapping_error() over explicit address checking
    e86233f052c7e serial: 8250: Fix 8250_rsa symbol loop
    88163f85d59b4 mptcp: Initialise rcv_mss before calling tcp_send_active_reset() in mptcp_do_fastclose().
    8cb509600a447 mptcp: clear scheduled subflows on retransmit
    3f6769860a33f mmc: sdhci-of-dwcmshc: Promote the th1520 reset handling to ip level
    b09d7c4dc6428 mm/memfd: fix information leak in hugetlb folios
    d1b83fbacd439 mm/huge_memory: fix NULL pointer deference when splitting folio
    39e383af172a8 iommufd/driver: Fix counter initialization for counted_by annotation
    bd226fa02ed6d firmware: stratix10-svc: fix bug in saving controller data
    14459281e027f io_uring/net: ensure vectored buffer node import is tied to notification
    2db8fba9174c1 regulator: rtq2208: Correct LDO2 logic judgment bits
    4842b9514e35e regulator: rtq2208: Correct buck group2 phase mapping logic
    8df4a3489e80b r8169: fix RTL8127 hang on suspend/shutdown
    77d8281433ca7 pmdomain: tegra: Add GENPD_FLAG_NO_STAY_ON flag
    cef910cef13b1 nvmem: layouts: fix nvmem_layout_bus_uevent
    4795c823a4aaa slimbus: ngd: Fix reference count leak in qcom_slim_ngd_notify_slaves
    86cfe2d6e0a50 thunderbolt: Add support for Intel Wildcat Lake
    a67e91d5f446e smb: client: fix memory leak in cifs_construct_tcon()
    05814c389b53d drm, fbcon, vga_switcheroo: Avoid race condition in fbcon setup
    8ba9d114bbe5d drivers/usb/dwc3: fix PCI parent check
    c04a2db8eaf60 dm-verity: fix unreliable memory allocation
    995b14d7d1e2d counter: microchip-tcb-capture: Allow shared IRQ for multi-channel TCBs
    7d1b7de853f7d ceph: fix crash in process_v2_sparse_read() for encrypted directories
    db1b7ae308364 can: sun4i_can: sun4i_can_interrupt(): fix max irq loop handling
    12bfa4d790ec2 can: sja1000: fix max irq loop handling
    94533839dc239 can: rcar_canfd: Fix CAN-FD mode as default
    c3b990e0b2306 Bluetooth: btusb: mediatek: Avoid btusb_mtk_claim_iso_intf() NULL deref
    6610361458e7e atm/fore200e: Fix possible data race in fore200e_open()
    cc69a053deb00 ARM: dts: nxp: imx6ul: correct SAI3 interrupt line
    302cad025cd0a arm64: dts: imx8qm-mek: fix mux-controller select/enable-gpios polarity
    8744c3bf1c35b arm64: dts: imx8dxl: Correct pcie-ep interrupt number
    ae41104ba57ac arm64: dts: imx8dxl-ss-conn: swap interrupts number of eqos
    bf94c1adc8b05 ALSA: usb-audio: Add DSD quirk for LEAK Stereo 230
    9eb7c124d356c ALSA: hda/cirrus fix cs420x MacPro 6,1 inverted jack detection
    45053c12c45f0 tracing: Fix WARN_ON in tracing_buffers_mmap_close for split VMAs
    967301b3fd59d vhost: rewind next_avail_head while discarding descriptors
    60aa73bf7a4c2 virtio-net: avoid unnecessary checksum calculation on guest RX
    81edb2fcccfdc MIPS: mm: kmalloc tlb_vpn array to avoid stack overflow
    6ae28d0d47e4e MIPS: mm: Prevent a TLB shutdown on initial uniquification
    84e4e4790eb83 iio: adc: rtq6056: Correct the sign bit index
    ead79c9e8e330 iio: adc: ad7380: fix SPI offload trigger rate
    38992f484d5bf iio: adc: ad7280a: fix ad7280_store_balance_timer()
    9d0adde131959 iio: adc: ad7124: fix temperature channel
    b583bdb46d373 iio: adc: ad4030: Fix _scale value for common-mode channels
    3d52cc840f044 iio: accel: fix ADXL355 startup race condition
    93eaa5ddc5fc4 iio: accel: bmc150: Fix irq assumption regression
    b970cbe914727 iio: adc: stm32-dfsdm: fix st,adc-alt-channel property handling
    b99f61b256f3e iio:common:ssp_sensors: Fix an error handling path ssp_probe()
    bf1d563d61949 iio: pressure: bmp280: correct meas_time_us calculation
    81219e987d05b iio: imu: st_lsm6dsx: fix array size for st_lsm6dsx_settings fields
    a3034133f2bbd iio: humditiy: hdc3020: fix units for thresholds and hysteresis
    56b6a28e63f18 iio: humditiy: hdc3020: fix units for temperature and humidity measurement
    b0c0ab51c04ee iio: buffer: support getting dma channel from the buffer
    1541370ce73b8 iio: buffer-dmaengine: enable .get_dma_dev()
    832930c111b62 iio: buffer-dma: support getting the DMA channel
    cc29a4bed6c33 Revert "perf/x86: Always store regs->ip in perf_callchain_kernel()"
    7133cd6818291 Revert "drm/amd/display: Move setup_stream_attribute"
    152c4bc73c3db timekeeping: Fix error code in tk_aux_sysfs_init()
    fd50547165444 afs: Fix uninit var in afs_alloc_anon_key()
    be1f77ed0b4dd spi: bcm63xx: fix premature CS deassertion on RX-only transactions
    cece2a2d2e666 spi: nxp-fspi: Propagate fwnode in ACPI case as well
    d5d05cc0b42df spi: spi-nxp-fspi: Add OCT-DTR mode support
    7f19e9d28703e spi: amlogic-spifc-a1: Handle devm_pm_runtime_enable() errors
    2fc1c72d85783 spi: tegra114: remove Kconfig dependency on TEGRA20_APB_DMA
    e6b879ef1a63a riscv: dts: allwinner: d1: fix vlenb property
    2e2aea13983c9 ovl: fail ovl_lock_rename_workdir() if either target is unhashed
    5613bde937dfa afs: Fix delayed allocation of a cell's anonymous key
    fe256e59b8e7f fs/namespace: fix reference leak in grab_requested_mnt_ns
    7f3c5e0585250 spi: spi-cadence-quadspi: Enable pm runtime earlier to avoid imbalance
    237aaa8cb2593 spi: spi-cadence-quadspi: Remove duplicate pm_runtime_put_autosuspend() call
    fd7fb5ecd6a56 mailbox: pcc: don't zero error register
    26cc0fcbc543e mailbox: mtk-cmdq: Refine DMA address handling for the command buffer
    78db090440c56 mailbox: mailbox-test: Fix debugfs_create_dir error checking
    e80aaf3aff150 usb: gadget: renesas_usbf: Handle devm_pm_runtime_enable() errors
    981f3da383cea iio: st_lsm6dsx: Fixed calibrated timestamp calculation
    763e3f496c89d net: fec: do not register PPS event for PEROUT
    1319841e52cf0 net: fec: do not allow enabling PPS and PEROUT simultaneously
    a34137dfdb7a5 net: fec: do not update PEROUT if it is enabled
    f0d1666f0e769 net: fec: cancel perout_timer when PEROUT is disabled
    d5796cf53b080 net: mctp: unconditionally set skb->dev on dst output
    64e47cd1fd631 net: atlantic: fix fragment overflow handling in RX path
    6f4fc4e4f47f3 eth: fbnic: Fix counter roll-over issue
    840cb877f3a5c net: dsa: sja1105: fix SGMII linking at 10M or 100M but not passing traffic
    e0f8ed1373789 net: wwan: mhi: Keep modem name match with Foxconn T99W640
    a8fc4440db707 dma-direct: Fix missing sg_dma_len assignment in P2PDMA bus mappings
    4a9a4f9f917c4 drm/amdgpu: fix cyan_skillfish2 gpu info fw handling
    c5ea2e50b5c9a xsk: avoid data corruption on cq descriptor number
    49d2cea7249a5 xsk: avoid overwriting skb fields for multi-buffer traffic
    88f46c0be77bf net: sxgbe: fix potential NULL dereference in sxgbe_rx()
    e3eed4f038214 team: Move team device type change at the end of team_port_add
    72ea0aadf7c90 net/mlx5e: Fix validation logic in rate limiting
    624ea86fd6e26 drm/xe: Fix conversion from clock ticks to milliseconds
    e025475913565 net: lan966x: Fix the initialization of taprio
    0354b8f6fd65c net: phy: mxl-gpy: fix link properties on USXGMII and internal PHYs
    b27a1f2518966 net: aquantia: Add missing descriptor cache invalidation on ATL2
    c2ee6d3899677 platform/x86: intel: punit_ipc: fix memory corruption
    ac6029bc010bd net: phy: mxl-gpy: fix bogus error on USXGMII and integrated PHY
    3074e7a366eae drm/bridge: sii902x: Fix HDMI detection with DRM_BRIDGE_ATTACH_NO_CONNECTOR
    d0bd018ad72a8 veth: reduce XDP no_direct return section to fix race
    a6a31efa7213e Bluetooth: SMP: Fix not generating mackey and ltk when repairing
    ec74cdf77310c Bluetooth: hci_core: lookup hci_conn on RX path on protocol side
    69fcb0344bc0d Bluetooth: hci_sock: Prevent race in socket write iter and sock bind
    b30cd4d99d4cb Bluetooth: hci_core: Fix triggering cmd_timer for HCI_OP_NOP
    faae9f2ea8806 Bluetooth: btusb: mediatek: Fix kernel crash when releasing mtk iso interface
    fb0c7c77a7ae3 can: gs_usb: gs_usb_receive_bulk_callback(): check actual_length before accessing data
    f31693dc3a584 can: gs_usb: gs_usb_receive_bulk_callback(): check actual_length before accessing header
    9c8eb33b70081 can: gs_usb: gs_usb_xmit_callback(): fix handling of failed transmitted URBs
    bd8135a560cf6 can: kvaser_usb: leaf: Fix potential infinite loop in command parsers

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.17.bb              |  6 ++---
 .../linux/linux-yocto-tiny_6.17.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.17.bb | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb
index b145a73d15..960b9c29ba 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "4c77bf8e2eddb19ae0a6e8ba7f1bbc28477c1c86"
-SRCREV_meta ?= "064a61babfe08bd4240e22c956735f2c9cb200ef"
+SRCREV_machine ?= "d79ffb7a9e37174f6d1704bfc632f87f29358e98"
+SRCREV_meta ?= "514f487f912a5a1a34fd874487ef23b7b08497ed"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.17;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.17.10"
+LINUX_VERSION ?= "6.17.11"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb
index 54457a4c3d..790fd4a95a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.17.inc
 
-LINUX_VERSION ?= "6.17.10"
+LINUX_VERSION ?= "6.17.11"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "43f56832407b25c045689964d109da7231474c1f"
-SRCREV_meta ?= "064a61babfe08bd4240e22c956735f2c9cb200ef"
+SRCREV_machine ?= "b49bfa0f53123c942faa17ac437d343ca144a38d"
+SRCREV_meta ?= "514f487f912a5a1a34fd874487ef23b7b08497ed"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.17.bb b/meta/recipes-kernel/linux/linux-yocto_6.17.bb
index 32a64f6383..439aba2e8c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.17.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.17/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.17/standard/base"
 KBRANCH:qemumips64 ?= "v6.17/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "610683567d4459e872d095cbfdfb71487b398f99"
-SRCREV_machine:qemuarm64 ?= "a26a71902db3c80604d817a8e7a7b5c289a54fb7"
-SRCREV_machine:qemuloongarch64 ?= "a26a71902db3c80604d817a8e7a7b5c289a54fb7"
+SRCREV_machine:qemuarm ?= "d5e840d399d082b5b82ad9464cd4705b3e8fd6c7"
+SRCREV_machine:qemuarm64 ?= "69e150f88757e3d8bbdb3eee9207aa5f627ed70a"
+SRCREV_machine:qemuloongarch64 ?= "69e150f88757e3d8bbdb3eee9207aa5f627ed70a"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "a26a71902db3c80604d817a8e7a7b5c289a54fb7"
-SRCREV_machine:qemuriscv64 ?= "a26a71902db3c80604d817a8e7a7b5c289a54fb7"
-SRCREV_machine:qemuriscv32 ?= "a26a71902db3c80604d817a8e7a7b5c289a54fb7"
-SRCREV_machine:qemux86 ?= "a26a71902db3c80604d817a8e7a7b5c289a54fb7"
-SRCREV_machine:qemux86-64 ?= "a26a71902db3c80604d817a8e7a7b5c289a54fb7"
+SRCREV_machine:qemuppc ?= "69e150f88757e3d8bbdb3eee9207aa5f627ed70a"
+SRCREV_machine:qemuriscv64 ?= "69e150f88757e3d8bbdb3eee9207aa5f627ed70a"
+SRCREV_machine:qemuriscv32 ?= "69e150f88757e3d8bbdb3eee9207aa5f627ed70a"
+SRCREV_machine:qemux86 ?= "69e150f88757e3d8bbdb3eee9207aa5f627ed70a"
+SRCREV_machine:qemux86-64 ?= "69e150f88757e3d8bbdb3eee9207aa5f627ed70a"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "a26a71902db3c80604d817a8e7a7b5c289a54fb7"
-SRCREV_meta ?= "064a61babfe08bd4240e22c956735f2c9cb200ef"
+SRCREV_machine ?= "69e150f88757e3d8bbdb3eee9207aa5f627ed70a"
+SRCREV_meta ?= "514f487f912a5a1a34fd874487ef23b7b08497ed"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "ae593cd8579f0207305263afd7adee01ffab7fb7"
+SRCREV_machine:class-devupstream ?= "5439375ca6987ed27eba246a3b9e036357fd6ba2"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.17/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.17;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.17.10"
+LINUX_VERSION ?= "6.17.11"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


