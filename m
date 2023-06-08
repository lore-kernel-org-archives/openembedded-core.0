Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45FC2C7EE43
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 02:36:36 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.514.1686191787818100420
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jun 2023 19:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=BpSWPZc1;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-651f2f38634so45804b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 19:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686191787; x=1688783787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FkDBP9aWoG4e6b7mhR5twUpnfq5qQvQsIYM3EfenyaA=;
        b=BpSWPZc133eE9qUfSFeSxk6IHb6rllQalv39mSdEp16Ce4PUb6NRRej6DN6k7z+64Q
         V9CYGt6a3GuXhNSgF3e7axgNJxR1p6iPnhlecpLhOIZ0aUt0cGmwasL5ukWiDqcck5Rf
         iCDMg7Y/KC32mV5V+O0vOZODmsaLF4E5UqdzI06RXFcqYlXs6gOsfHcmq6vDe08vBv4e
         a/C2QQ0IwXt7ND+4BLrEhROvQ+GmtnO0uZ8pH33P0eCMJb1Brc6l2vnj150obyFf9RGB
         dJLqp8sTWMq4ASEeJB2RclrQWfOV0iISLoFQ10NWh794WVRWQWyOybUDXY/LeCh7KOB0
         L5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686191787; x=1688783787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FkDBP9aWoG4e6b7mhR5twUpnfq5qQvQsIYM3EfenyaA=;
        b=SyxCVgtf0eUf0gxJI7JH3vktfCLesgGMht0nsjvw8HDnKevOhEFntKVR0To6beH3gq
         a9L1XRTA0b1v8v4zQITKqFaAC+xo0a7a2PxGBUl2Zi55JTvH70smxSmDBgMEe46EwDHt
         1GlLGZaWPrmA2hrMFetYqkVJYTJv+jTGisLU0KWMjO1NMktcJ15oAWx6pcDezYPxcug3
         ZOAmnjGKeUJDwi32F8y/fH+MppVTpzw84XA6Ic6QDvPcw9oBmb/El2NcQcJ52mkG7f8v
         l0igbyf6JzF8DHz5dmQR4a60kpKOs6gTT61gzPnWJKltfgROmdZHjRuy3r+fogn8LdUW
         Niug==
X-Gm-Message-State: AC+VfDxNIW3pxPq+J0nBEyx4+kuWfkzbQzHejKESnSnhhYirCvG+QZJ9
	55rsnYJCPfzqNjcxHeHytz30Kc7aWeYdooTz6tE=
X-Google-Smtp-Source: ACHHUZ59w8ZWr37jjUsMReapNiJS5A4bFfWXba07qG3wrP4H/770EhltdLCv5Um2TYl+1oDbgdfg4g==
X-Received: by 2002:a05:6a00:1513:b0:64f:7c9d:9c09 with SMTP id q19-20020a056a00151300b0064f7c9d9c09mr10060888pfu.32.1686191786655;
        Wed, 07 Jun 2023 19:36:26 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j8-20020a62b608000000b00649ac17779csm19478pff.160.2023.06.07.19.36.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 19:36:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/11] linux-yocto/5.4: update to v5.4.241
Date: Wed,  7 Jun 2023 16:36:01 -1000
Message-Id: <41eacaf738d753632fb17031e58dc898f2290a61.1686191643.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686191643.git.steve@sakoman.com>
References: <cover.1686191643.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 02:36:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182490

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    58f42ed1cd31 Linux 5.4.241
    879593643717 xfs: force log and push AIL to clear pinned inodes when aborting mount
    c76dd368759a xfs: don't reuse busy extents on extent trim
    4679b73a8ed4 xfs: consider shutdown in bmapbt cursor delete assert
    9355fd118b4e xfs: shut down the filesystem if we screw up quota reservation
    48f75df5b3bb xfs: report corruption only as a regular error
    3cce34ceb2ef xfs: set inode size after creating symlink
    e76bd6da5123 xfs: fix up non-directory creation in SGID directories
    ad6613c98463 xfs: remove the di_version field from struct icdinode
    ca4533c951e1 xfs: simplify a check in xfs_ioctl_setattr_check_cowextsize
    e078b3de3e41 xfs: simplify di_flags2 inheritance in xfs_ialloc
    0c553917b61a xfs: only check the superblock version for dinode size calculation
    90aab52d062c xfs: add a new xfs_sb_version_has_v3inode helper
    edd36a57b4a6 xfs: remove the kuid/kgid conversion wrappers
    3ef81874f71c xfs: remove the icdinode di_uid/di_gid members
    cc508a41ae48 xfs: ensure that the inode uid/gid match values match the icdinode ones
    7a9dc7977140 xfs: merge the projid fields in struct xfs_icdinode
    4f3252e7e132 xfs: show the proper user quota options
    799cafa4f304 coresight-etm4: Fix for() loop drvdata->nr_addr_cmp range bug
    440bdc49f744 watchdog: sbsa_wdog: Make sure the timeout programming is within the limits
    70ca826d3ddb i2c: ocores: generate stop condition after timeout in polling mode
    5fb5bdcdcd5a ubi: Fix deadlock caused by recursively holding work_sem
    0b27716f2d44 mtd: ubi: wl: Fix a couple of kernel-doc issues
    e55588c44255 ubi: Fix failure attaching when vid_hdr offset equals to (sub)page size
    a652c30fa2ba asymmetric_keys: log on fatal failures in PE/pkcs7
    5809dbacc431 verify_pefile: relax wrapper length check
    0213f027d030 drm: panel-orientation-quirks: Add quirk for Lenovo Yoga Book X90F
    b3052e5d468b efi: sysfb_efi: Add quirk for Lenovo Yoga Book X91F/L
    02a78e653933 i2c: imx-lpi2c: clean rx/tx buffers upon new message
    1ef56397449e power: supply: cros_usbpd: reclassify "default case!" as debug
    7169d1638824 net: macb: fix a memory corruption in extended buffer descriptor mode
    c39fa0398a30 udp6: fix potential access to stale information
    9c46c49ad3ff RDMA/core: Fix GID entry ref leak when create_ah fails
    ad831a7079c9 sctp: fix a potential overflow in sctp_ifwdtsn_skip
    afffe0d1e6b9 qlcnic: check pci_reset_function result
    a841f6a0a39d niu: Fix missing unwind goto in niu_alloc_channels()
    fcd084e199b9 9p/xen : Fix use after free bug in xen_9pfs_front_remove due to race condition
    1b77cb6f5e4a mtd: rawnand: stm32_fmc2: remove unsupported EDO mode
    4c1d882b53a3 mtd: rawnand: meson: fix bitmask for length in command word
    266746003439 mtdblock: tolerate corrected bit-flips
    50dbfd9dacda btrfs: fix fast csum implementation detection
    c6db5f2a31cd btrfs: print checksum type and implementation at mount time
    8a99e6200c38 Bluetooth: Fix race condition in hidp_session_thread
    c02421992505 Bluetooth: L2CAP: Fix use-after-free in l2cap_disconnect_{req,rsp}
    9025cea8e03b ALSA: hda/sigmatel: fix S/PDIF out on Intel D*45* motherboards
    4d419195d6b8 ALSA: firewire-tascam: add missing unwind goto in snd_tscm_stream_start_duplex()
    fe158eeccc38 ALSA: i2c/cs8427: fix iec958 mixer control deactivation
    aa23fa32e5ff ALSA: hda/sigmatel: add pin overrides for Intel DP45SG motherboard
    62ccf2e0b106 ALSA: emu10k1: fix capture interrupt handler unlinking
    9a3ba7b24d08 Revert "pinctrl: amd: Disable and mask interrupts on resume"
    2945f948aa84 irqdomain: Fix mapping-creation race
    e8f3aea716d2 irqdomain: Refactor __irq_domain_alloc_irqs()
    3804f265c1bf irqdomain: Look for existing mapping only once
    e7bba7ddb431 mm/swap: fix swap_info_struct race between swapoff and get_swap_pages()
    fd644712bccd ring-buffer: Fix race while reader and writer are on the same page
    c208b4321e8f drm/panfrost: Fix the panfrost_mmu_map_fault_addr() error path
    c381527918b1 net_sched: prevent NULL dereference if default qdisc setup failed
    987f599fc556 tracing: Free error logs of tracing instances
    d2136f05690c can: j1939: j1939_tp_tx_dat_new(): fix out-of-bounds memory access
    5a74a75fc3d3 ftrace: Mark get_lock_parent_ip() __always_inline
    95bbfeb4ff0e perf/core: Fix the same task check in perf_event_set_output
    666c25d35e5e ALSA: hda/realtek: Add quirk for Clevo X370SNW
    83b16a60e413 nilfs2: fix sysfs interface lifetime
    613bf23c070d nilfs2: fix potential UAF of struct nilfs_sc_info in nilfs_segctor_thread()
    aa8e50688d44 tty: serial: fsl_lpuart: avoid checking for transfer complete when UARTCTRL_SBK is asserted in lpuart32_tx_empty
    aabba4440409 tty: serial: sh-sci: Fix Rx on RZ/G2L SCI
    209ab5c234c5 tty: serial: sh-sci: Fix transmit end interrupt handler
    9a2a6443d655 iio: dac: cio-dac: Fix max DAC write value check for 12-bit
    e469ebb28dbe iio: adc: ti-ads7950: Set `can_sleep` flag for GPIO chip
    abc5b4f8cdff USB: serial: option: add Quectel RM500U-CN modem
    b9c11537efcf USB: serial: option: add Telit FE990 compositions
    38c00a22d67b usb: typec: altmodes/displayport: Fix configure initial pin assignment
    f417d3fea3de USB: serial: cp210x: add Silicon Labs IFS-USB-DATACABLE IDs
    47132be17d7b xhci: also avoid the XHCI_ZERO_64B_REGS quirk with a passthrough iommu
    5fccf2c546ed NFSD: callback request does not use correct credential for AUTH_SYS
    3686380d9d60 sunrpc: only free unix grouplist after RCU settles
    1627119153d9 gpio: davinci: Add irq chip flag to skip set wake
    0cf600ca1bdf ipv6: Fix an uninit variable access bug in __ip6_make_skb()
    0443fff49d63 sctp: check send stream number after wait_for_sndbuf
    93f3885211ae net: don't let netpoll invoke NAPI if in xmit context
    0d2fa30078af icmp: guard against too small mtu
    a3593082e0da wifi: mac80211: fix invalid drv_sta_pre_rcu_remove calls for non-uploaded sta
    4220f83b9f03 pwm: sprd: Explicitly set .polarity in .get_state()
    6e1f29397dea pwm: cros-ec: Explicitly set .polarity in .get_state()
    dbd764e9d422 pinctrl: amd: Disable and mask interrupts on resume
    dd7e19f97f71 pinctrl: amd: disable and mask interrupts on probe
    3f3e4bd3f0cc pinctrl: amd: Use irqchip template
    387236b9e002 smb3: fix problem with null cifs super block with previous patch
    2e64d7b182c6 treewide: Replace DECLARE_TASKLET() with DECLARE_TASKLET_OLD()
    199197660bdd Revert "treewide: Replace DECLARE_TASKLET() with DECLARE_TASKLET_OLD()"
    522af69af24f cgroup/cpuset: Wake up cpuset_attach_wq tasks in cpuset_cancel_attach()
    4311ae04b386 x86/PCI: Add quirk for AMD XHCI controller that loses MSI-X state in D3hot
    110d425cdfb1 scsi: ses: Handle enclosure with just a primary component gracefully

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index a20525abb9..5d77bc3ae3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "304e411fa33ff303ec73d29376dd975c0d5f9cea"
-SRCREV_meta ?= "aaa00d56c80ea2cbb07f7a018b80b89dc59f28e0"
+SRCREV_machine ?= "bf0fd4b1c757c39b99fb742f7023718fca6477de"
+SRCREV_meta ?= "6f28deea807165327b46a5b2613bb220e36e3ef1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.240"
+LINUX_VERSION ?= "5.4.241"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 19b6e2fa66..245e049b60 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.240"
+LINUX_VERSION ?= "5.4.241"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "718954ab9a87d4414eb24c502a4a9a772c7020f8"
-SRCREV_machine ?= "e5560b6cd3de039d68422b61746dcf3343ec73e2"
-SRCREV_meta ?= "aaa00d56c80ea2cbb07f7a018b80b89dc59f28e0"
+SRCREV_machine_qemuarm ?= "8ccc251148dca811482b01afe95b24f02e9c0b8b"
+SRCREV_machine ?= "e0fc5fe58eac8f2a552a3fe5b3da0f18c8fd5a52"
+SRCREV_meta ?= "6f28deea807165327b46a5b2613bb220e36e3ef1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 989d3a2049..60b4c44ec9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "a17398a736969b170c742324a65c885203234b8e"
-SRCREV_machine_qemuarm64 ?= "c3ae9d7cd0727680ec16b97ba6f92b82d35a9cfb"
-SRCREV_machine_qemumips ?= "bfd98dba6758a2f47aad79e09e3509dfb99b6886"
-SRCREV_machine_qemuppc ?= "6030458f53886df464fe9fbf3e52c4f91a6ad3ec"
-SRCREV_machine_qemuriscv64 ?= "b1db2f47a35d8a71c038a3438779f4d50807e5e5"
-SRCREV_machine_qemux86 ?= "b1db2f47a35d8a71c038a3438779f4d50807e5e5"
-SRCREV_machine_qemux86-64 ?= "b1db2f47a35d8a71c038a3438779f4d50807e5e5"
-SRCREV_machine_qemumips64 ?= "53a370f9356803b7d5b93369439c97572916bcad"
-SRCREV_machine ?= "b1db2f47a35d8a71c038a3438779f4d50807e5e5"
-SRCREV_meta ?= "aaa00d56c80ea2cbb07f7a018b80b89dc59f28e0"
+SRCREV_machine_qemuarm ?= "a38fd554c6a9d49f33b4097a7300f5a2d134cb83"
+SRCREV_machine_qemuarm64 ?= "99b6ecddbf3cf1909e8208a46842c81cce09d02c"
+SRCREV_machine_qemumips ?= "55f3e8be5f53e522210db32f6bf60c9d153fe5d6"
+SRCREV_machine_qemuppc ?= "536eee19189590e19bdcb5baf5b6c752abd14455"
+SRCREV_machine_qemuriscv64 ?= "2dc29af86649e3006eb05972e1e175989d64d537"
+SRCREV_machine_qemux86 ?= "2dc29af86649e3006eb05972e1e175989d64d537"
+SRCREV_machine_qemux86-64 ?= "2dc29af86649e3006eb05972e1e175989d64d537"
+SRCREV_machine_qemumips64 ?= "60b346865774d6d320f8b5b3ef35661fdaa6dffb"
+SRCREV_machine ?= "2dc29af86649e3006eb05972e1e175989d64d537"
+SRCREV_meta ?= "6f28deea807165327b46a5b2613bb220e36e3ef1"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.240"
+LINUX_VERSION ?= "5.4.241"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


