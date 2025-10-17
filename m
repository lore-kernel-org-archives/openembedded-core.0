Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D287ECCD1AB
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 20:39:43 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.3211.1760733583464376514
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 13:39:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WqY7fM8P;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-780fc3b181aso1472475b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 13:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760733583; x=1761338383; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TZhSgR1GpM7WmVnrhivCS5LR0ywxygsjRCsHeXtRNCM=;
        b=WqY7fM8PiRWdmrzpcy6bd1Iod+aOyocoTFpOzY0OR+p4xO7MMh1GPFC1HOuQvnNh/Z
         f3e1DIRtJp4uKLlbIMMvJQX5hdASG6xhJ9pv2Rv0mSPxQF1yfqm3gYqsuLLRAjZE426o
         qMUU9Bx8ABj2JENy7lqvF3/eqSjGNYjlQGDvwbIkHQH1XqDRZassPYfoksahbijX0IY1
         HdlyZsw+dc7xFDR0MgGqCoxiPkW9IbczBtSzstCLxYvuxJDeFyIp8Kg9Xa5LLrAHEa/y
         l4sF+241BFq/H0Uw9v8oEJHdiRniE61nEMfSxv7E1sPmDTusr2VVE/ZYEJg7KOuruh/n
         dA4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733583; x=1761338383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZhSgR1GpM7WmVnrhivCS5LR0ywxygsjRCsHeXtRNCM=;
        b=c3efpuruSmfKcfkvO5lZG8pzoCm4KyihUHzyGPqqjx7Ec3Tiww1zZDtQr8+PhUJ13R
         wO7pzJepBBJGbtIy0+RR7YxKGEjc7ZETKwvlvSPWbjPLnlJHPO9qkxMsWL38IYoCDpJF
         ZjFXRxkPEHxp/inZZ1yFqCmb5n6Xsd1KRQ7UXSqKf4IJ2NY0iEt0CAofbxsKYqoY3ya/
         c/FIXtAU8dEoWsIiuB/z0WzXeqbW6p/ra49ce8SGhPKqVbSeQEbCiZgrDG2qqbwLcXWP
         e+WhnoIucY9HhI7LZT9yOLSvDuqDmKovBd3p6T0CRW4MRq/AVDTiwHqIybHSpODcuEaS
         XJ3Q==
X-Gm-Message-State: AOJu0YwOJSYnpgsyaozlJ+FbkGiOMqLXK/H2CBUxOjF3KZFvuObFiZ9Q
	0P3hNLrtdMyi0+KMXZ52944Q6JhhXkPfQrm3J0lSd4PjV/PAVtGXj0DyJCfvWX2npNxgutQXDgN
	Hjp2UXLA=
X-Gm-Gg: ASbGncs/dYXcteauIAX5SdB5Ed7phofSsBzBomUf2JLcsdcbpjcyqi+GitIzkDT53fG
	mvbt6o1MryuguF21jJ0gf5bR+xca78nOAbAfr27bND+Ke7+DNIbGDmSkyjOsgDgxm9JLU7dr6xB
	m4kLiZuhzacr60AxRGw8ZOfieFSF8nxoOrSIgEURvtY6fDszSyljF24BGrgubZHOeP0SXlW4vsf
	onEdK6XeuPBBcJZb/ET7Pks1GhMpXW2Cm/492vbAje+2ZExAMgZ2G1P9wJWxXQPUh0rUlJkgI78
	d0jDAhNa9vnDJtxmzkij5FmQOiPa7gGOFwGiZElunMSE/WTNwUZyn8vr6Qc84YhsZIARwZ+VLfm
	SFlV1r4aDNJW7zPcQHWWQew6wf9gRCdKlBWO78Na6YzYn6zGEkGPQQrj6dNkJIVCPjw80gd++F3
	xe
X-Google-Smtp-Source: AGHT+IH/thbn7dmpdO07eGhcRetvOX6OChvSBeQ718hEeeMHJDYiA15nkGYlCoFu4ExBJIFvU1xvug==
X-Received: by 2002:a05:6a20:1611:b0:334:7aae:c43b with SMTP id adf61e73a8af0-334a853985emr6553306637.20.1760733582542;
        Fri, 17 Oct 2025 13:39:42 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:aaee:e640:34cd:6f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f254esm477061b3a.45.2025.10.17.13.39.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:39:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/26] linux-yocto/6.6: update to v6.6.98
Date: Fri, 17 Oct 2025 13:38:55 -0700
Message-ID: <b9041a3e6ddc8917eba2af45a8e57f2e48998dc9.1760733431.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760733431.git.steve@sakoman.com>
References: <cover.1760733431.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 20:39:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225046

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    9247f4e6573a Linux 6.6.98
    20aa3d519806 x86/CPU/AMD: Properly check the TSA microcode
    59a2de10b81a Linux 6.6.97
    897761d16564 f2fs: fix to avoid use-after-free issue in f2fs_filemap_fault
    8c1944905855 x86/process: Move the buffer clearing before MONITOR
    6fb766d53f61 x86/microcode/AMD: Add TSA microcode SHAs
    276499bb6944 KVM: SVM: Advertise TSA CPUID bits to guests
    90293047df18 x86/bugs: Add a Transient Scheduler Attacks mitigation
    2b6a5fbe9dc1 x86/bugs: Rename MDS machinery to something more generic
    8a7ac2737211 powerpc/kernel: Fix ppc_save_regs inclusion in build
    63cff9f57e86 usb: typec: displayport: Fix potential deadlock
    4b91b77af24c platform/x86: think-lmi: Fix sysfs group cleanup
    98002f1ac947 platform/x86: think-lmi: Fix kobject cleanup
    cb3e3244d88d platform/x86: think-lmi: Create ksets consecutively
    360546362865 powercap: intel_rapl: Do not change CLAMPING bit if ENABLE bit cannot be changed
    73d43c215007 iommu/rockchip: prevent iommus dead loop when two masters share one IOMMU
    6052862ba31c Logitech C-270 even more broken
    6358cb9c2a31 i2c/designware: Fix an initialization issue
    d8eab407c08d dma-buf: fix timeout handling in dma_resv_wait_timeout v2
    59205a3e93ef smb: client: fix readdir returning wrong type with POSIX extensions
    937f49be49d6 usb: chipidea: udc: disconnect/reconnect from host when do suspend/resume
    afbec8c34428 usb: cdnsp: do not disable slot for disabled slot
    c9a841fd2ec2 Input: iqs7222 - explicitly define number of external channels
    2cd5e7c16942 Input: xpad - support Acer NGR 200 Controller
    c16b75aa6fb6 xhci: Disable stream for xHC controller with XHCI_BROKEN_STREAMS
    881c9274246c xhci: dbc: Flush queued requests before stopping dbc
    897d1170c249 xhci: dbctty: disable ECHO flag by default
    7609899eb6b7 usb: xhci: quirk for data loss in ISOC transfers
    204bdc7a8b7b NFSv4/flexfiles: Fix handling of NFS level errors in I/O
    e3eed0134772 fs: export anon_inode_make_secure_inode() and fix secretmem LSM bypass
    adb29b437fe5 module: Provide EXPORT_SYMBOL_GPL_FOR_MODULES() helper
    a6069306f4e1 platform/x86: hp-bioscfg: Fix class device unregistration
    8570c219cd59 platform/x86: hp-bioscfg: Directly use firmware_attributes_class
    387da3b6d1a9 drm/v3d: Disable interrupts before resetting the GPU
    817662f9bdf8 rcu: Return early if callback is not specified
    d5c1e3f32902 mtd: spinand: fix memory leak of ECC engine conf
    d547779e72ce ACPICA: Refuse to evaluate a method if arguments are missing
    347827bd0c56 wifi: ath6kl: remove WARN on bad firmware input
    5aebb9aa538a wifi: mac80211: drop invalid source address OCB frames
    270d637100f9 aoe: defer rexmit timer downdev work to workqueue
    55dfffc5e947 scsi: target: Fix NULL pointer dereference in core_scsi3_decode_spec_i_port()
    7b9203afeb37 regulator: fan53555: add enable_time support and soft-start times
    a1d10fee0783 ASoC: amd: yc: update quirk data for HP Victus
    871beab5b4f9 powerpc: Fix struct termio related ioctl macros
    ba9117312795 platform/x86/amd/pmc: Add PCSpecialist Lafite Pro V 14M to 8042 quirks list
    785200516552 ASoC: amd: yc: Add quirk for MSI Bravo 17 D7VF internal mic
    69283b3fd463 ata: pata_cs5536: fix build on 32-bit UML
    71f89fab5cc9 ata: libata-acpi: Do not assume 40 wire cable if no devices are enabled
    6766316c1a9f ALSA: sb: Force to disable DMAs once when DMA mode is changed
    c7922052c6f2 ALSA: sb: Don't allow changing the DMA mode during operations
    c40ad1c04d30 drm/msm: Fix another leak in the submit error path
    fe2695b2f63b drm/msm: Fix a fence leak in submit error path
    5df2087c9a1e drm/i915/dp_mst: Work around Thunderbolt sink disconnect after SINK_COUNT_ESI read
    ad09bb7cbd14 drm/simpledrm: Do not upcast in release helpers
    51ba65860457 scsi: ufs: core: Fix clk scaling to be conditional in reset and restore
    847af89aa163 scsi: ufs: core: Add OPP support for scaling clocks and regulators
    95ffe734518d scsi: ufs: core: Fix abnormal scale up after last cmd finish
    9e67044aa9a7 f2fs: fix to zero post-eof page
    d1ccd98eddba f2fs: convert f2fs_vm_page_mkwrite() to use folio
    7ac8a61e5503 f2fs: prevent writing without fallocate() for pinned files
    b43c3050d211 f2fs: add tracepoint for f2fs_vm_page_mkwrite()
    bceae1daf302 x86/traps: Initialize DR6 by writing its architectural reset value
    16254aa985d1 bnxt: properly flush XDP redirect lists
    6310aafd4267 wifi: mac80211: finish link init before RCU publish
    ebca4264c648 wifi: mac80211: Add link iteration macro for link data
    32d0b58079ed wifi: mac80211: chan: chandef is non-NULL for reserved
    bc0819a25e04 Bluetooth: hci_core: Fix use-after-free in vhci_flush()
    64d07a40f853 smb: client: remove \t from TP_printk statements
    3499dcb6c507 btrfs: fix qgroup reservation leak on failure to allocate ordered extent
    ccdd3eaec689 Revert "drm/i915/gem: Allow EXEC_CAPTURE on recoverable contexts on DG1"
    ca7d5aa7ccf0 smb: client: fix race condition in negotiate timeout by using more precise timing
    70b32cba5cfd amd-xgbe: do not double read link status
    f680a4643c6f net/sched: Always pass notifications when child class becomes empty
    5ea2a10be7d7 nui: Fix dma_mapping_error() check
    7a1841c96093 rose: fix dangling neighbour pointers in rose_rt_device_down()
    744cd8baffe8 enic: fix incorrect MTU comparison in enic_change_mtu()
    a133683c0567 amd-xgbe: align CL37 AN sequence as per databook
    f2ca04cbf01d lib: test_objagg: Set error message in check_expect_hints_stats()
    8f4652848b36 igc: disable L1.2 PCI-E link substate to avoid performance issue
    832058110a1d drm/i915/gsc: mei interrupt top half should be in irq disabled context
    40e09506aea1 drm/i915/gt: Fix timeline left held on VMA alloc error
    968a419c9513 net: usb: lan78xx: fix WARN in __netif_napi_del_locked on disconnect
    0cee638d92ac smb: client: fix warning when reconnecting channel
    33713f7cda3d platform/mellanox: mlxreg-lc: Fix logic error in power state check
    421672fb7f13 platform/x86: dell-wmi-sysman: Fix class device unregistration
    dba37f72aae3 platform/x86: dell-sysman: Directly use firmware_attributes_class
    4074f6a15e95 platform/x86: think-lmi: Fix class device unregistration
    093ee65bdafb platform/x86: think-lmi: Directly use firmware_attributes_class
    ee813c62af62 platform/x86: firmware_attributes_class: Simplify API
    e52b896d5fb7 platform/x86: firmware_attributes_class: Move include linux/device/class.h
    9143d22a09b5 platform/x86: make fw_attr_class constant
    3df1e72b7bfe arm64: dts: qcom: sm8550: add UART14 nodes
    0deb3eb78ebf platform/x86: dell-wmi-sysman: Fix WMI data block retrieval in sysfs callbacks
    55a90f82d4ff drm/i915/selftests: Change mock_request() to return error pointers
    822c05444ffa spi: spi-fsl-dspi: Clear completion counter before initiating transfer
    1fc5dc930137 drm/exynos: fimd: Guard display clock control with runtime PM calls
    7e6423f80bd6 dpaa2-eth: fix xdp_rxq_info leak
    31afd307975f ethernet: atl1: Add missing DMA mapping error checks and count errors
    2a7ac29f10d8 btrfs: use btrfs_record_snapshot_destroy() during rmdir
    d77a16802896 btrfs: propagate last_unlink_trans earlier when doing a rmdir
    65d7f92db8a9 btrfs: rename err to ret in btrfs_rmdir()
    2d11d274e2e1 btrfs: fix iteration of extrefs during log replay
    79b025ebc1c0 btrfs: fix missing error handling when searching for inode refs during log replay
    529281206f11 Bluetooth: Prevent unintended pause by checking if advertising is active
    e373354ecfbf platform/mellanox: nvsw-sn2201: Fix bus number in adapter error message
    d8a1ad180c24 RDMA/mlx5: Fix vport loopback for MPV device
    efb3413f6ba9 RDMA/mlx5: Fix CC counters query for MPV
    301303d14da6 RDMA/mlx5: Fix HW counters query for non-representor devices
    ee9cb28675a5 scsi: ufs: core: Fix spelling of a sysfs attribute name
    39dac98aca12 scsi: qla4xxx: Fix missing DMA mapping error in qla4xxx_alloc_pdu()
    c3ec87fbb00d scsi: qla2xxx: Fix DMA mapping test in qla24xx_get_port_database()
    8ca65fa71024 NFSv4/pNFS: Fix a race to wake on NFS_LAYOUT_DRAIN
    d0877c479f44 nfs: Clean up /proc/net/rpc/nfs when nfs_fs_proc_net_init() fails.
    23a3b32a274a RDMA/mlx5: Initialize obj_event->obj_sub_list before xa_insert
    edca475158f7 platform/mellanox: mlxbf-tmfifo: fix vring_desc.len assignment
    3962e5a3845d arm64: dts: apple: t8103: Fix PCIe BCM4377 nodename
    b935c1e734d2 mtk-sd: reset host->mrq on prepare_data() error
    61cdd6635646 mtk-sd: Prevent memory corruption from DMA map failure
    b3b00e9b03d3 mtk-sd: Fix a pagefault in dma_unmap_sg() for not prepared data
    45e9444b3b97 usb: typec: altmodes/displayport: do not index invalid pin_assignments
    24418bc77a66 regulator: gpio: Fix the out-of-bounds access to drvdata::gpiods
    0506547f6e3d Bluetooth: MGMT: mesh_send: check instances prior disabling advertising
    8af1406949c1 Bluetooth: MGMT: set_mesh: update LE scan interval and window
    7e88ad41b63e Bluetooth: hci_sync: revert some mesh modifications
    3c0c18ef4c79 mmc: core: sd: Apply BROKEN_SD_DISCARD quirk earlier
    c4fad2460c17 Revert "mmc: sdhci: Disable SD card clock before changing parameters"
    3855b7ace3f9 mmc: sdhci: Add a helper function for dump register in dynamic debug mode
    94d0c326cb3e vsock/vmci: Clear the vmci transport packet properly when initializing it
    e7191481d6ae s390/pci: Do not try re-enabling load/store if device is disabled
    80b971be4c37 virtio-net: ensure the received length does not exceed allocated size
    39617dc3fafe rtc: cmos: use spin_lock_irqsave in cmos_interrupt
    5cdd1f73401d rtc: pcf2127: fix SPI command byte for PCF2131
    1cb814dbb03d rtc: pcf2127: add missing semicolon after statement

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 9323918502..6622b87d19 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a02058f9508e565ca6d62ff4fda707d1b8894ea0"
-SRCREV_meta ?= "533e8057057d5eb7400a400e53972c54ac1169b0"
+SRCREV_machine ?= "1c4b6c1312449f28032c8b83ce96280a404ed6e1"
+SRCREV_meta ?= "6df14e0eacedd9f025d88e310ef7fcc0bde6f550"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.96"
+LINUX_VERSION ?= "6.6.98"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 7424dacc42..0d1d8b332e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.96"
+LINUX_VERSION ?= "6.6.98"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "d68fff9b37fe90feaef6e6e24d560f07420d2044"
-SRCREV_meta ?= "533e8057057d5eb7400a400e53972c54ac1169b0"
+SRCREV_machine ?= "f8e22255578e2c951974340aae60bf9dc56b838c"
+SRCREV_meta ?= "6df14e0eacedd9f025d88e310ef7fcc0bde6f550"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index de6952dad0..031925129f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "a2c45f6283ecd822468883d493f90ab0cc4f3a8a"
-SRCREV_machine:qemuarm64 ?= "d72e5d8e6d1a220a18fb2d9848fadbe443c9d555"
-SRCREV_machine:qemuloongarch64 ?= "cfb2162b885f040f7d3d2c95103af0d62ad94b28"
-SRCREV_machine:qemumips ?= "09314f2a0c95b59863247654f75555489cae9e11"
-SRCREV_machine:qemuppc ?= "7ee481d1b7be6cb8897494430119c4a00d40c29e"
-SRCREV_machine:qemuriscv64 ?= "cfb2162b885f040f7d3d2c95103af0d62ad94b28"
-SRCREV_machine:qemuriscv32 ?= "cfb2162b885f040f7d3d2c95103af0d62ad94b28"
-SRCREV_machine:qemux86 ?= "cfb2162b885f040f7d3d2c95103af0d62ad94b28"
-SRCREV_machine:qemux86-64 ?= "cfb2162b885f040f7d3d2c95103af0d62ad94b28"
-SRCREV_machine:qemumips64 ?= "3b2b3b16411baea07773b9c74093d139a0d0ab25"
-SRCREV_machine ?= "cfb2162b885f040f7d3d2c95103af0d62ad94b28"
-SRCREV_meta ?= "533e8057057d5eb7400a400e53972c54ac1169b0"
+SRCREV_machine:qemuarm ?= "8057ff8a5fafefaf330e60e34bc4b83f4070763a"
+SRCREV_machine:qemuarm64 ?= "6a1a2f157c2b4fd7107ae28ccea2e5dd41086118"
+SRCREV_machine:qemuloongarch64 ?= "760085c1a370bb909a8d256f8bfffdb9f9f879a8"
+SRCREV_machine:qemumips ?= "dc0cec39323fbf083dce76f83fc80462fd582781"
+SRCREV_machine:qemuppc ?= "206991d0103afe59a9ea27619d3ed3e82e49f468"
+SRCREV_machine:qemuriscv64 ?= "760085c1a370bb909a8d256f8bfffdb9f9f879a8"
+SRCREV_machine:qemuriscv32 ?= "760085c1a370bb909a8d256f8bfffdb9f9f879a8"
+SRCREV_machine:qemux86 ?= "760085c1a370bb909a8d256f8bfffdb9f9f879a8"
+SRCREV_machine:qemux86-64 ?= "760085c1a370bb909a8d256f8bfffdb9f9f879a8"
+SRCREV_machine:qemumips64 ?= "fa01c554b0080d610d45cc3dd7fb2dd08ec0e473"
+SRCREV_machine ?= "760085c1a370bb909a8d256f8bfffdb9f9f879a8"
+SRCREV_meta ?= "6df14e0eacedd9f025d88e310ef7fcc0bde6f550"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "a5df3a702b2cba82bcfb066fa9f5e4a349c33924"
+SRCREV_machine:class-devupstream ?= "9247f4e6573a4d05fe70c3e90dbd53da26e8c5cb"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.96"
+LINUX_VERSION ?= "6.6.98"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


