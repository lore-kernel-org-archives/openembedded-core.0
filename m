Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FAC0CCD1A7
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 20:44:24 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.3289.1760733861445737258
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 13:44:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QvnA1Mpm;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7833765433cso3162974b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 13:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760733861; x=1761338661; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lGrW0Bde7CHWYWhHUIjh1SiC6npZJ3PXxjEjHzkIe8c=;
        b=QvnA1MpmCKcpbyHnlEdpihESzeAJ9c1LHXNnxfJDGUxGBzMIdd144WSSms5He1Bdgq
         Z1B9pYndNztU8g07FsaTnbRiteFwiN+e8vWkgxXlWhFWyPZQn9I6p9DHpg0Tnr/7pAci
         gxaXRdIuZMogLJN576SXi94H8yegfbnz46Vtkkljhrtbs3SgPja8mFrEs5uby/mQSlY3
         g+YbjAHau+SW98SKAuzGovtX1eVGE3MpzUS2mH+8jrlVw5c36bLIhunToKcyRbAFerUi
         SeiwwkSg/ziyaYl63sJGpor9jcO/VVgzzzq7ByxJyXm3bj0FWzsd9X6p2GhXVww93hQs
         xScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733861; x=1761338661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lGrW0Bde7CHWYWhHUIjh1SiC6npZJ3PXxjEjHzkIe8c=;
        b=U6MDxObiBtFfAFq2Vp357TUtOEHrvB8jWd6Vq0TdW2JqYlOdeVYsCs0rHbYpFBmlDh
         JiGLCbP6nKI0BqT4ozgiIrro2JlCnLmZmbR/IuRMO39pqY8htkZ0xHatxldfIXD7dUcN
         2a9aWHhgBU3lR4+4tMW5XGJQUwu/vJ4CEiy6UCNAvWewVdNLCbP1SSd8soTqCcTL4pkr
         RUsWnpAJ8dyV7zBm7QRL+c74XfDfJ6dvAtRyWmBHZkTOqN/LfeNpuMToxMUSab6hvdy7
         aG7iO+P5mxA0zs0Bz53j7rXF/xVYxtoW4etKMPYm8t/HvXwZTYp2YO7RGWrc+sCyHumT
         NBGw==
X-Gm-Message-State: AOJu0YzteWvltNb/h2YlcgFcsbtyIVFgSMM4elnvYmJ2oQJ371NxarsR
	qVaZ9g498JIWsF2XiLPOeYyJNbgCgwZPk95i4kFjLUJNLOl1gfG0QooqAb4pPD5BYcmeq733kwt
	EOAFh4Pc=
X-Gm-Gg: ASbGncs41sCAabn03eN0tyBTNW6lacTid2dwSxmQQmkA/VGbZIf75N7CbUfENUXygsS
	WaZ/ub8O0nglVUO969ASf9kj8GeuHA0B2d4M5jtAfeobWpdDA7CMuyBQ5vLYdwN1gKi8fHKZzyl
	xDUylwyLgGIPPP1HGu3Tk5iz1gS2cfgyTVkGWsSUU90IDnAQzxImooXU6OgBJIj/IqBRyhzlxPo
	eoPcKTxDQYjEcu5UrpLLU9fG/QLhN1KFiMuiTCkE+pPjvSMx9qDHGxlfl9kuv+sh+jwLwui/Nta
	BgQXZQBYH5JC16Z/+BZm9yk/8qgXKQ90gGVn00cagiPk5ZZxhwBh6pMt8JzT+BnDz89aaqOmFO8
	lTaUqe1Ze/bKZ2nn4UlwFXtZzx1a0V/qrlSvATyZW1biVFqV0cRNJG+eFtSELnYS2Sw==
X-Google-Smtp-Source: AGHT+IGJD3GwmgkPAKVIwAikLieDYUn0ogNsCY8Vm3znG+XpNKyXMwrbOekwAjA1qDLGxAzIX8yC6Q==
X-Received: by 2002:a05:6a00:21c9:b0:781:455:df62 with SMTP id d2e1a72fcca58-7a220a56c36mr6747968b3a.5.1760733860459;
        Fri, 17 Oct 2025 13:44:20 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:aaee:e640:34cd:6f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a230121ebfsm477066b3a.70.2025.10.17.13.44.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:44:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/8] linux-yocto/5.15: update to v5.15.188
Date: Fri, 17 Oct 2025 13:44:03 -0700
Message-ID: <6b6a51e73e89903e5766175c54fad23cc4a1721b.1760733724.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760733724.git.steve@sakoman.com>
References: <cover.1760733724.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 20:44:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225065

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    89950c454265 Linux 5.15.188
    cd0d988f7dd7 x86/CPU/AMD: Properly check the TSA microcode
    2f693b607545 Linux 5.15.187
    21953dde398d x86/process: Move the buffer clearing before MONITOR
    c334ae4a545a KVM: SVM: Advertise TSA CPUID bits to guests
    3d6513b51b72 KVM: x86: add support for CPUID leaf 0x80000021
    f2b75f1368af x86/bugs: Add a Transient Scheduler Attacks mitigation
    04304f5fe3e3 x86/bugs: Rename MDS machinery to something more generic
    7be0d1ea71f5 usb: typec: displayport: Fix potential deadlock
    5bcca95ca6d2 platform/x86: think-lmi: Create ksets consecutively
    d01c737efd81 Logitech C-270 even more broken
    475f89e1f9bd i2c/designware: Fix an initialization issue
    b32dfd00bd51 usb: cdnsp: do not disable slot for disabled slot
    969941ca9f1e xhci: dbc: Flush queued requests before stopping dbc
    45f2cd76bc50 xhci: dbctty: disable ECHO flag by default
    d8ccb3d08159 platform/x86: dell-wmi-sysman: Fix class device unregistration
    8ac2cb8d809b platform/x86: think-lmi: Fix class device unregistration
    846baaa88a2d dpaa2-eth: fix xdp_rxq_info leak
    3f0b6236e11f net: dpaa2-eth: rearrange variable in dpaa2_eth_get_ethtool_stats
    b2e1b676711e dpaa2-eth: Update SINGLE_STEP register access
    8e4d49fc2617 dpaa2-eth: Update dpni_get_single_step_cfg command
    0ab03e2616a1 ethernet: atl1: Add missing DMA mapping error checks and count errors
    94a09ec93e93 NFSv4/flexfiles: Fix handling of NFS level errors in I/O
    576a6739e08a drm/v3d: Disable interrupts before resetting the GPU
    56738cbac3bb regulator: gpio: Fix the out-of-bounds access to drvdata::gpiods
    e772f8f5c82d regulator: gpio: Add input_supply support in gpio_regulator_config
    1728e17762b9 mmc: core: sd: Apply BROKEN_SD_DISCARD quirk earlier
    bee6329e5fd5 rcu: Return early if callback is not specified
    68d3417305ee mtd: spinand: fix memory leak of ECC engine conf
    ab1e8491c19e ACPICA: Refuse to evaluate a method if arguments are missing
    46b47d4b06fa wifi: ath6kl: remove WARN on bad firmware input
    a856228c44dc wifi: mac80211: drop invalid source address OCB frames
    1129e0e0a833 scsi: target: Fix NULL pointer dereference in core_scsi3_decode_spec_i_port()
    161ff4102038 powerpc: Fix struct termio related ioctl macros
    ce5f6b2540d6 ata: pata_cs5536: fix build on 32-bit UML
    ba5104b9b3fa ALSA: sb: Force to disable DMAs once when DMA mode is changed
    73337c003f3d ALSA: sb: Don't allow changing the DMA mode during operations
    5deab0fa6cfd drm/msm: Fix a fence leak in submit error path
    e269f29e9395 net/sched: Always pass notifications when child class becomes empty
    7bf497c2ad87 nui: Fix dma_mapping_error() check
    2b952dbb32fe rose: fix dangling neighbour pointers in rose_rt_device_down()
    1fba51f021b2 enic: fix incorrect MTU comparison in enic_change_mtu()
    52b4b2e85e63 amd-xgbe: align CL37 AN sequence as per databook
    7edff1bbdd3a lib: test_objagg: Set error message in check_expect_hints_stats()
    f5874e0dea9e igc: disable L1.2 PCI-E link substate to avoid performance issue
    f10af3426144 drm/i915/gt: Fix timeline left held on VMA alloc error
    92c2d914b533 platform/x86: dell-wmi-sysman: Fix WMI data block retrieval in sysfs callbacks
    4caf6a93ac39 drm/i915/selftests: Change mock_request() to return error pointers
    54f62d542d2c spi: spi-fsl-dspi: Clear completion counter before initiating transfer
    4c315caf16e8 drm/exynos: fimd: Guard display clock control with runtime PM calls
    a1950bb9edfa btrfs: fix missing error handling when searching for inode refs during log replay
    9f0771b8cc4a RDMA/mlx5: Fix CC counters query for MPV
    abfdb3b4ce2b scsi: ufs: core: Fix spelling of a sysfs attribute name
    1afb58c7e32b scsi: qla4xxx: Fix missing DMA mapping error in qla4xxx_alloc_pdu()
    9ceff7ded1e9 scsi: qla2xxx: Fix DMA mapping test in qla24xx_get_port_database()
    8846fd02c98d NFSv4/pNFS: Fix a race to wake on NFS_LAYOUT_DRAIN
    b92397ce9674 nfs: Clean up /proc/net/rpc/nfs when nfs_fs_proc_net_init() fails.
    00ed215f5938 RDMA/mlx5: Initialize obj_event->obj_sub_list before xa_insert
    16a16c901a75 platform/mellanox: mlxbf-tmfifo: fix vring_desc.len assignment
    944ced3e4a09 mtk-sd: reset host->mrq on prepare_data() error
    48bf4f3dfcda mtk-sd: Prevent memory corruption from DMA map failure
    2580162c4ebf mtk-sd: Fix a pagefault in dma_unmap_sg() for not prepared data
    621d5a3ef023 usb: typec: altmodes/displayport: do not index invalid pin_assignments
    aab032d171e7 Revert "mmc: sdhci: Disable SD card clock before changing parameters"
    3d07fd496513 mmc: sdhci: Add a helper function for dump register in dynamic debug mode
    2d44723a091b vsock/vmci: Clear the vmci transport packet properly when initializing it
    1def00386211 rtc: cmos: use spin_lock_irqsave in cmos_interrupt
    8516edd36397 ARM: 9354/1: ptrace: Use bitfield helpers
    143842584c12 btrfs: don't drop extent_map for free space inode on write error
    6a8aa6420ad3 arm64: Restrict pagetable teardown to avoid false warning
    6d486f1e3818 Revert "ipv6: save dontfrag in cork"
    9f69eb424aa2 s390: Add '-std=gnu11' to decompressor and purgatory CFLAGS
    707030cb1c66 s390/entry: Fix last breaking event handling in case of stack corruption
    9e2976e4e326 media: uvcvideo: Rollback non processed entities on error
    45d1aa5674d6 PCI: hv: Do not set PCI_COMMAND_MEMORY to reduce VM boot time
    34d3e10ab905 drm/amd/display: Add null pointer check for get_first_active_display()
    53dee8fd76a6 drm/bridge: cdns-dsi: Wait for Clk and Data Lanes to be ready
    62a7143dce1c drm/bridge: cdns-dsi: Check return value when getting default PHY config
    49a421180aaa drm/bridge: cdns-dsi: Fix connecting to next bridge
    6c3056ed0b73 drm/bridge: cdns-dsi: Fix the clock variable for mode_valid()
    105b0a0c7e65 drm/amdkfd: Fix race in GWS queue scheduling
    b0dc5d6da1da drm/udl: Unregister device before cleaning up on disconnect
    c7fc459ae6f9 drm/tegra: Fix a possible null pointer dereference
    21dfbd590734 drm/tegra: Assign plane type before registration
    03b68435fbe3 HID: wacom: fix kobject reference count leak
    796abf9f710a HID: wacom: fix memory leak on sysfs attribute creation failure
    ca7b6d00a713 HID: wacom: fix memory leak on kobject creation failure
    896bc23e1e25 btrfs: update superblock's device bytes_used when dropping chunk
    2826ef05854d dm-raid: fix variable in journal device check
    78f4cf0e81b7 Bluetooth: L2CAP: Fix L2CAP MTU negotiation
    34cbe5543bec dt-bindings: serial: 8250: Make clocks and clock-frequency exclusive
    f61db0a69d0b staging: rtl8723bs: Avoid memset() in aes_cipher() and aes_decipher()
    9f7fd60fb8f7 net: selftests: fix TCP packet checksum
    26248d5d68c8 atm: Release atm_dev_mutex after removing procfs in atm_dev_deregister().
    6b908e85a739 net: enetc: Correct endianness handling in _enetc_rd_reg64
    8898080d6143 um: ubd: Add missing error check in start_io_thread()
    a4aa7c001043 vsock/uapi: fix linux/vm_sockets.h userspace compilation errors
    1bc8c7b8e5b9 af_unix: Don't set -ECONNRESET for consumed OOB skb.
    2afcde1b3676 wifi: mac80211: fix beacon interval calculation overflow
    1197abb1ee3b libbpf: Fix null pointer dereference in btf_dump__free on allocation failure
    6b4ce195552b attach_recursive_mnt(): do not lock the covering tree when sliding something under it
    c3fb926abe90 ALSA: usb-audio: Fix out-of-bounds read in snd_usb_get_audioformat_uac3()
    9199e8cb75f1 atm: clip: prevent NULL deref in clip_push()
    ad1bdd24a02d s390/pkey: Prevent overflow in size calculation for memdup_user()
    56e54021b77c i2c: robotfuzz-osif: disable zero-length read messages
    d6bc3e078509 i2c: tiny-usb: disable zero-length read messages
    9b084de34f1a platform/x86: ideapad-laptop: use usleep_range() for EC polling
    d0537c51b4a1 dummycon: Trigger redraw when switching consoles with deferred takeover
    acd41ac591b7 tty: vt: make consw::con_switch() return a bool
    a74907cdd18d tty: vt: sanitize arguments of consw::con_clear()
    d2781a0ba98c tty: vt: make init parameter of consw::con_init() a bool
    de2871093fa3 vgacon: remove unneeded forward declarations
    72dc92531df9 vgacon: switch vgacon_scrolldelta() and vgacon_restore_screen()
    4b0b22dfe4d6 tty/vt: consolemap: rename and document struct uni_pagedir
    3a88320314ab fbcon: delete a few unneeded forward decl
    c8ea0f204cf4 uio_hv_generic: Align ring size to system page
    a955c1b360b3 uio_hv_generic: Query the ringbuffer size for device
    a8c1b5e33a1c Drivers: hv: vmbus: Add utility function for querying ring size
    101c4437f6fb Drivers: hv: Rename 'alloced' to 'allocated'
    1f2f2f56f59e f2fs: don't over-report free space or inodes in statvfs
    fbcbbf2ebe5c media: imx-jpeg: Drop the first error frames
    8701675abab4 clk: ti: am43xx: Add clkctrl data for am43xx ADC1
    9f55faa41eac media: omap3isp: use sgtable-based scatterlist wrappers
    78b7d79b8626 media: davinci: vpif: Fix memory leak in probe error path
    c3705c82b740 jfs: validate AG parameters in dbMount() to prevent crashes
    4789cea3f8d4 fs/jfs: consolidate sanity checking in dbMount
    8c8d1dcc726a ovl: Check for NULL d_inode() in ovl_dentry_upper()
    42923c6e9cd7 ceph: fix possible integer overflow in ceph_zero_objects()
    bfdbc927d165 ALSA: usb-audio: Add a quirk for Lenovo Thinkpad Thunderbolt 3 dock
    da01b76bb66a ALSA: hda: Add new pci id for AMD GPU display HD audio controller
    44aa0cdaed5f ALSA: hda: Ignore unsol events for cards being shut down
    56846793f105 usb: typec: displayport: Receive DP Status Update NAK request exit dp altmode
    cd414d7d7077 usb: cdc-wdm: avoid setting WDM_READ for ZLP-s
    383d33f3aeb7 usb: Add checks for snprintf() calls in usb_alloc_dev()
    780e48c99f66 usb: common: usb-conn-gpio: use a unique name for usb connector device
    9c905fdbba68 tty: serial: uartlite: register uart driver in init
    6f77e344515b usb: potential integer overflow in usbg_make_tpg()
    5cb3cb3db317 usb: dwc2: also exit clock_gating when stopping udc while suspended
    fd72dd6a82e2 coresight: Only check bottom two claim bits
    be620f25161f um: Add cmpxchg8b_emu and checksum functions to asm-prototypes.h
    82ddbbc98949 iio: pressure: zpa2326: Use aligned_s64 for the timestamp
    1f25f2d3fa29 bcache: fix NULL pointer in cache_set_flush()
    8ddce5eab6c3 md/md-bitmap: fix dm-raid max_write_behind setting
    477c044309e6 dmaengine: xilinx_dma: Set dma_device directions
    566487aad232 ksmbd: allow a filename to contain special characters on SMB3.1.1 posix extension
    d8322d861a6f hwmon: (pmbus/max34440) Fix support for max34451
    bbd1511e27ee leds: multicolor: Fix intensity setting while SW blinking
    a23b82a0693b mfd: max14577: Fix wakeup source leaks on device unbind
    852a2bda152a mailbox: Not protect module_put with spin_lock_irqsave
    86be8c7409b7 NFSv4.2: fix listxattr to return selinux security label
    a35f2168961e NFSv4: Always set NLINK even if the server doesn't support it
    80251a15ed61 cifs: Fix cifs_query_path_info() for Windows NT servers

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 73c3264016..fc9a3c3397 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "76da2cf32fe004e10f581744496e71547d0a4361"
-SRCREV_meta ?= "5932fcfa6982f5b86a13849b84ef3d80a557a030"
+SRCREV_machine ?= "29a212d112aaa83d5d28c91088c877ee0164afbc"
+SRCREV_meta ?= "35e38f16718b4358712a1545b1b5bcb8b14bb28f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.186"
+LINUX_VERSION ?= "5.15.188"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 0aa51c512c..8fc3e3dc4d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.186"
+LINUX_VERSION ?= "5.15.188"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "4175c60a7b8e282d802be846bae75eeba398969e"
-SRCREV_meta ?= "5932fcfa6982f5b86a13849b84ef3d80a557a030"
+SRCREV_machine ?= "c763c9cf2a50b3e8c7be255112d3322d34e37803"
+SRCREV_meta ?= "35e38f16718b4358712a1545b1b5bcb8b14bb28f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 43d77045bb..da1aedd31d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "d93c7fcf604b572bf93497e00017f9cf34fa34c7"
-SRCREV_machine:qemuarm64 ?= "9e9701d7239420165b342f3c363961ee3040a91e"
-SRCREV_machine:qemumips ?= "be5800a6d9002fd12668c0f8ada68ad7cab4398c"
-SRCREV_machine:qemuppc ?= "6fa52ff2eb31c6855f51a0d4f96339c50437d139"
-SRCREV_machine:qemuriscv64 ?= "48702d462c58d69b4b382bb34984f2f0881d0bb1"
-SRCREV_machine:qemuriscv32 ?= "48702d462c58d69b4b382bb34984f2f0881d0bb1"
-SRCREV_machine:qemux86 ?= "48702d462c58d69b4b382bb34984f2f0881d0bb1"
-SRCREV_machine:qemux86-64 ?= "48702d462c58d69b4b382bb34984f2f0881d0bb1"
-SRCREV_machine:qemumips64 ?= "bb909213f7e13fd17e39d95e5d1b646a7b0bacf2"
-SRCREV_machine ?= "48702d462c58d69b4b382bb34984f2f0881d0bb1"
-SRCREV_meta ?= "5932fcfa6982f5b86a13849b84ef3d80a557a030"
+SRCREV_machine:qemuarm ?= "59eda9c8cd28d83857eca9f39f777188870f00c4"
+SRCREV_machine:qemuarm64 ?= "be863e2ed3deabb3b194aaf8860263d651c26be5"
+SRCREV_machine:qemumips ?= "c67be260b4eb8307f7da8c632fd3ca510b906d7e"
+SRCREV_machine:qemuppc ?= "d0a7f356bbb2b771f8eed843c52b8f9a213a7559"
+SRCREV_machine:qemuriscv64 ?= "aa5fe401b86e527dd49b5a157b71d79bbf19461e"
+SRCREV_machine:qemuriscv32 ?= "aa5fe401b86e527dd49b5a157b71d79bbf19461e"
+SRCREV_machine:qemux86 ?= "aa5fe401b86e527dd49b5a157b71d79bbf19461e"
+SRCREV_machine:qemux86-64 ?= "aa5fe401b86e527dd49b5a157b71d79bbf19461e"
+SRCREV_machine:qemumips64 ?= "648039263363d55f8f3573edcfbb0059657e268b"
+SRCREV_machine ?= "aa5fe401b86e527dd49b5a157b71d79bbf19461e"
+SRCREV_meta ?= "35e38f16718b4358712a1545b1b5bcb8b14bb28f"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "1c700860e8bc079c5c71d73c55e51865d273943c"
+SRCREV_machine:class-devupstream ?= "89950c4542652dfe435f9519a5080f7d2128764c"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.186"
+LINUX_VERSION ?= "5.15.188"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.43.0


