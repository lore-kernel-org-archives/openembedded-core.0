Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C4F8E94637
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 03:14:41 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12167.1770693275217064996
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 19:14:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c2+Gu/dj;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8ca01dc7d40so46163685a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 19:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770693273; x=1771298073; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TVXGIZmzO7h1v5nzZWAtNPx/6PCH39WuLI5wxfQ8Rxw=;
        b=c2+Gu/djh04f5F/pVBI2x8TXJdUqWXzwB0U9WNxWI6eH9yTmsR2Lr1oGU8NrNG+zLK
         HGXT3+VzlPAz9jC7ts1jGWWube5MJnCJxI+i85ICbJAC1mBEapPNSdQUSS29ALlk1JRd
         ZIITdD5H444oV6c+0wMFFHds42wV5zCcHGgUxtuk0aKA+EmJv8hogBPFKJefekC54mYJ
         FTSTfWe9Zy1rX/Znc4ui96W2+/P5QWtY/a/ALy/EdaCzhELyrILAYfCr/Z5TE+CpUiZh
         GjAihTO9A6xigTS4xJbo6dsyWqnz5nyxw9WGcb4Rg9WTK8lqJ6548X3uDw9Sm9xBsEre
         j0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770693273; x=1771298073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TVXGIZmzO7h1v5nzZWAtNPx/6PCH39WuLI5wxfQ8Rxw=;
        b=k8d5Mpg3U4zNQ3BKvR5YAp7tCdQvabwFenDIFG10Mst/giR6gjr/UXJCbNQ9Aaz2gG
         9//ml3W2BGu3ZGEWFmBLbtu+M6q2o7m+xNONIgHw6+RgoelaVxGklmSzRjOdPnmYoAXE
         HS5yzms29RBOjXgNcdkYAGU0n/cSXWdJNTha63iCFxiCBpsfgObhcY8sZkjzOXdg2d52
         Wq+AZSK5rccdE/ePVpr6appLz82z8jQBRnFUJyPM7+3QZASiIUBIVRVoLAitEfbr9z79
         ZXZRJMoGy7LrWfMVyyRNaG0D8TGNXmup/ZXRtjPxVbncVsQrXvxVaA8xhR/KtuhmDeLy
         yjMA==
X-Gm-Message-State: AOJu0YwiZCMczQoY9RWFus9ck8lBV1JOiVupcIvgTvNK1XpdAXKGY/WJ
	OesTsDqqTZiaMnBD32lhz4DugxvdJIKXAcWGdlcVwQccHgf4Sp7738+q7vJAOzcF
X-Gm-Gg: AZuq6aLwtsM3B4xLdZek6CirjIvlxUWUUMX+FxOT5tNwYrlXwRu32pMQ4PMxTKTPEYo
	48muc2MwoPlD3JnRhAAQ/unc+wf+ZZI6XVcEdEIazsbe2NRXeh6qUu/CX9m0att2Fg7JxeJ8ehZ
	6XKTjJdlF1PvJd67VP5l8RG+EdCSPDBaAFm1D0jjUA3YNrIhaGf4nQIXHgdVG9RC74+QgNA9601
	KllJit6MlLCuqtmaLRV1G+dN4JFCj6dyRGK6a5bzaEAvikGLhsGtd4uX7p+mWgpWS081mHSGf0/
	RMuySGYlTATTFnk/od8T/EqzA/Xo5kHOSEZGElqRw/Nsey7jRlc4CfPOM4Hyy6gRxCww7UgvnmV
	rXBYWmyBT1rbEWRxBgK8hrJ+ZYXuvp3r3FBRRUcEihPmTVqH3Nn9M/Ggejr6jQhGj9WrTQrnRF2
	cXaFWBTfQwaKnq0y/tE67i90mhWhPHynygqz4VMDlw1TD5PgUpHKr1jjy9kkcOTj1E9g+CjNcYQ
	9BYhDTZKkg5NFz8CRB3hN/3X7q35SnSHsWiAa9oCE75Yn6OF9oKupaM5Zs=
X-Received: by 2002:a05:620a:199b:b0:8b2:d72d:e41c with SMTP id af79cd13be357-8caefccae38mr1902763685a.5.1770693273317;
        Mon, 09 Feb 2026 19:14:33 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9a157f8sm955632785a.30.2026.02.09.19.14.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 19:14:32 -0800 (PST)
From: bruce.ashfield@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [meta][scarthgap][PATCH 05/07] linux-yocto/6.6: update to v6.6.119
Date: Mon,  9 Feb 2026 22:14:22 -0500
Message-ID: <20260210031424.1346685-5-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210031424.1346685-1-bruce.ashfield@gmail.com>
References: <20260210031424.1346685-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 03:14:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230839

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    5fa4793a2d2d Linux 6.6.119
    810189546cb6 HID: core: Harden s32ton() against conversion to 0 bits
    e7e8e9b1a1b1 net: dsa: microchip: Free previously initialized ports on init failures
    3b5a6115d6ea net: dsa: microchip: Fix symetry in ksz_ptp_msg_irq_{setup/free}()
    70ad6455139e ksmbd: fix use-after-free in session logoff
    3a13454fd098 mptcp: fix duplicate reset on fastclose
    b77075c08d7e selftests: mptcp: join: properly kill background tasks
    f12f4c657617 staging: rtl8712: Remove driver using deprecated API wext
    2b9719ccad38 net: macb: fix unregister_netdev call order in macb_remove()
    a395121fe29e iio: adc: rtq6056: Correct the sign bit index
    094f10f3f290 can: rcar_canfd: Fix CAN-FD mode as default
    eecd163fa6da usb: typec: ucsi: psy: Set max current to zero when disconnected
    f02a412c0a18 usb: gadget: udc: fix use-after-free in usb_gadget_state_work
    92234ee7fc23 usb: udc: Add trace event for usb_gadget_set_state
    0722d804f7ad nfsd: Replace clamp_t in nfsd4_get_drc_mem()
    5106da73b016 bonding: check xdp prog when set bond mode
    694a354ddf98 bonding: return detailed error when loading native XDP fails
    becc488a4d86 libceph: replace BUG_ON with bounds check for map->max_osd
    ccbccfba25e9 libceph: prevent potential out-of-bounds writes in handle_auth_session_key()
    183ad6e3b651 libceph: fix potential use-after-free in have_mon_and_osd_map()
    1c6fb1cc5035 net: dsa: microchip: ptp: Fix checks on irq_find_mapping()
    1759edf0e688 net: dsa: microchip: common: Fix checks on irq_find_mapping()
    9d1a65cbe3ec drm/amd/display: Check NULL before accessing
    748ed1b6a2ca drm: sti: fix device leaks at component probe
    28a385af4a94 USB: serial: option: add support for Rolling RW101R-GL
    17cab1f3aefb USB: serial: ftdi_sio: add support for u-blox EVK-M101
    b75d20301703 xhci: dbgtty: fix device unregister
    da7a52bcee3f xhci: dbgtty: Fix data corruption when transmitting data form DbC to host
    afc0e34f161c usb: dwc3: Fix race condition between concurrent dwc3_remove_requests() call paths
    5428c75e92e4 usb: dwc3: pci: Sort out the Intel device IDs
    9dab9859b10e usb: dwc3: pci: add support for the Intel Nova Lake -S
    e3a55221f4de usb: uas: fix urb unmapping issue when the uas device is remove during ongoing data transfer
    04a8a6393f3f usb: storage: sddr55: Reject out-of-bound new_pba
    f5b6b214db12 USB: storage: Remove subclass and protocol overrides from Novatek quirk
    cb1401b5bcc2 usb: storage: Fix memory leak in USB bulk transport
    9d86bc8b188a usb: renesas_usbhs: Fix synchronous external abort on unbind
    41434488ca71 usb: gadget: f_eem: Fix memory leak in eem_unwrap
    730c13a9701c usb: cdns3: Fix double resource release in cdns3_pci_probe
    993bfdc38428 most: usb: fix double free on late probe failure
    41ae1203c5ab serial: amba-pl011: prefer dma_mapping_error() over explicit address checking
    ce318ec9864b mptcp: clear scheduled subflows on retransmit
    71796c91ee8e firmware: stratix10-svc: fix bug in saving controller data
    87b3d0105192 slimbus: ngd: Fix reference count leak in qcom_slim_ngd_notify_slaves
    c4ba90485bfd thunderbolt: Add support for Intel Wildcat Lake
    f62ffdfb431b smb: client: fix memory leak in cifs_construct_tcon()
    4c257170c81d drivers/usb/dwc3: fix PCI parent check
    f8d1f166289f dm-verity: fix unreliable memory allocation
    5a3f3e39b187 ceph: fix crash in process_v2_sparse_read() for encrypted directories
    61089dd37ccd can: sun4i_can: sun4i_can_interrupt(): fix max irq loop handling
    c952664fd54f can: sja1000: fix max irq loop handling
    9917ba597cf9 atm/fore200e: Fix possible data race in fore200e_open()
    5b88725e5ea1 ARM: dts: nxp: imx6ul: correct SAI3 interrupt line
    b4abe6826926 ALSA: usb-audio: Add DSD quirk for LEAK Stereo 230
    231ac951faba MIPS: mm: kmalloc tlb_vpn array to avoid stack overflow
    135713cd0751 MIPS: mm: Prevent a TLB shutdown on initial uniquification
    ad70338c1b87 iio: adc: ad7280a: fix ad7280_store_balance_timer()
    a9fa254af33a iio: accel: fix ADXL355 startup race condition
    cdd4a9e98004 iio: accel: bmc150: Fix irq assumption regression
    a8f6a8256a68 iio:common:ssp_sensors: Fix an error handling path ssp_probe()
    936e082a7c07 iio: imu: st_lsm6dsx: fix array size for st_lsm6dsx_settings fields
    d59a7824444e Revert "perf/x86: Always store regs->ip in perf_callchain_kernel()"
    c538dae04a4c spi: bcm63xx: fix premature CS deassertion on RX-only transactions
    01511983d7b8 spi: nxp-fspi: Propagate fwnode in ACPI case as well
    5fc6f8175b8b spi: nxp-fspi: Support per spi-mem operation frequency switches
    a25cc746f7d0 spi: spi-mem: Add a new controller capability
    f1ea0e8b4a15 spi: spi-mem: Extend spi-mem operations with a per-operation maximum frequency
    94b3c7558748 spi: spi-mem: Allow specifying the byte order in Octal DTR mode
    99aff13bcc13 spi: amlogic-spifc-a1: Handle devm_pm_runtime_enable() errors
    dbb60bd12950 spi: tegra114: remove Kconfig dependency on TEGRA20_APB_DMA
    f29b58e974c7 mailbox: pcc: don't zero error register
    ea621f472cfe mailbox: pcc: Refactor error handling in irq handler into separate function
    5550f9021895 mailbox: mailbox-test: Fix debugfs_create_dir error checking
    826785925627 usb: gadget: renesas_usbf: Handle devm_pm_runtime_enable() errors
    cad94b17e276 iio: st_lsm6dsx: Fixed calibrated timestamp calculation
    21f867e3da98 net: fec: do not register PPS event for PEROUT
    2648b8b51992 net: fec: do not allow enabling PPS and PEROUT simultaneously
    b332c433489e net: fec: do not update PEROUT if it is enabled
    2d8f6acf5623 net: fec: cancel perout_timer when PEROUT is disabled
    3be37c3c96b1 net: atlantic: fix fragment overflow handling in RX path
    90daa70a4d62 net: dsa: sja1105: fix SGMII linking at 10M or 100M but not passing traffic
    d25c17507e80 net: dsa: sja1105: simplify static configuration reload
    0be4d79f8a1b drm/amdgpu: fix cyan_skillfish2 gpu info fw handling
    7fd789d6ea49 net: sxgbe: fix potential NULL dereference in sxgbe_rx()
    aa20dcff033c net/mlx5e: Fix validation logic in rate limiting
    58c411509141 net: lan966x: Fix the initialization of taprio
    30a1d3db72bc net: aquantia: Add missing descriptor cache invalidation on ATL2
    3e7442c58021 platform/x86: intel: punit_ipc: fix memory corruption
    ff45dd52bd18 net: phy: mxl-gpy: fix bogus error on USXGMII and integrated PHY
    fd6a1261d05d Bluetooth: SMP: Fix not generating mackey and ltk when repairing
    fe68510fc99b Bluetooth: hci_sock: Prevent race in socket write iter and sock bind
    4ffac725154c can: gs_usb: gs_usb_receive_bulk_callback(): check actual_length before accessing data
    3433680b7596 can: gs_usb: gs_usb_receive_bulk_callback(): check actual_length before accessing header
    1a588c40a422 can: gs_usb: gs_usb_xmit_callback(): fix handling of failed transmitted URBs
    e9dd83a75a72 can: kvaser_usb: leaf: Fix potential infinite loop in command parsers

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 728248ddd2..8ab76cb2f3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7996419eca2192a1b3bc01cb208f6dcb865b7a9f"
-SRCREV_meta ?= "3adceb388e86d1b704d8153af1d734877529085d"
+SRCREV_machine ?= "d4ff700595af4b924c51677c033f4a7b555d84d9"
+SRCREV_meta ?= "f0da0340213d3d31ce967c0e74f61d560140abba"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.118"
+LINUX_VERSION ?= "6.6.119"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 597514b6de..9ee071546f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.118"
+LINUX_VERSION ?= "6.6.119"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "67f8fd8eb1517d2e7bf208eaaac4c9ef154e033b"
-SRCREV_meta ?= "3adceb388e86d1b704d8153af1d734877529085d"
+SRCREV_machine ?= "b8e89962b199d788f48813ee31cf5d91f02ba625"
+SRCREV_meta ?= "f0da0340213d3d31ce967c0e74f61d560140abba"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 164d7a2900..20a6e11639 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "87089959e10eff2029fb1599fb91e139f7795aa6"
-SRCREV_machine:qemuarm64 ?= "a0c244da87b0489c12507623d182990045ba9e5b"
-SRCREV_machine:qemuloongarch64 ?= "5e24848d4268396bf9c200a52e13dbb22a23ca5f"
-SRCREV_machine:qemumips ?= "72eca83031d5c13e691b19473f82c74d127bcec5"
-SRCREV_machine:qemuppc ?= "326405ca4807b73ae60685781b5595ca8bc73a2d"
-SRCREV_machine:qemuriscv64 ?= "5e24848d4268396bf9c200a52e13dbb22a23ca5f"
-SRCREV_machine:qemuriscv32 ?= "5e24848d4268396bf9c200a52e13dbb22a23ca5f"
-SRCREV_machine:qemux86 ?= "5e24848d4268396bf9c200a52e13dbb22a23ca5f"
-SRCREV_machine:qemux86-64 ?= "5e24848d4268396bf9c200a52e13dbb22a23ca5f"
-SRCREV_machine:qemumips64 ?= "d23ab2b90ba9b7f29a117c054998fb967fe001ad"
-SRCREV_machine ?= "5e24848d4268396bf9c200a52e13dbb22a23ca5f"
-SRCREV_meta ?= "3adceb388e86d1b704d8153af1d734877529085d"
+SRCREV_machine:qemuarm ?= "8b1ffa583db6c7b547d6e02b553d158760bef848"
+SRCREV_machine:qemuarm64 ?= "0b48d78b3a581b68506007e3a67168369ac40ef3"
+SRCREV_machine:qemuloongarch64 ?= "509f595358e435ee6db263ff182397c78e74a09d"
+SRCREV_machine:qemumips ?= "fb588d19e0a30c8cbb4e1727ffa66c871cd93e51"
+SRCREV_machine:qemuppc ?= "deb0adb74e5b744b66105fdef7d56faaecd6e8d6"
+SRCREV_machine:qemuriscv64 ?= "509f595358e435ee6db263ff182397c78e74a09d"
+SRCREV_machine:qemuriscv32 ?= "509f595358e435ee6db263ff182397c78e74a09d"
+SRCREV_machine:qemux86 ?= "509f595358e435ee6db263ff182397c78e74a09d"
+SRCREV_machine:qemux86-64 ?= "509f595358e435ee6db263ff182397c78e74a09d"
+SRCREV_machine:qemumips64 ?= "d87f14c4af036fdb7418e1ced1aa7c168966f6d7"
+SRCREV_machine ?= "509f595358e435ee6db263ff182397c78e74a09d"
+SRCREV_meta ?= "f0da0340213d3d31ce967c0e74f61d560140abba"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "4791134e4aebe300af2b409dc550610ef69fae3e"
+SRCREV_machine:class-devupstream ?= "5fa4793a2d2d70ad08b85387b41020f1fcc2d19e"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.118"
+LINUX_VERSION ?= "6.6.119"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


