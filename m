Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 185C0CCD1A4
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 20:44:24 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.3291.1760733862994395081
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 13:44:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ngDvBG2V;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-782bfd0a977so1867676b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 13:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760733862; x=1761338662; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oY5SxWl4ki9oHWE1mZUvUPxPc8DjDDqn9XkVrxAZe+o=;
        b=ngDvBG2Vd19OvAaDEiZteZipaJmdNRsckgK3BhPtbBf6hUld52AgepYrQ8/bI0nAAe
         7DgxI9/ydj56Ybgh1A8AoyTkc6IwxmjyM17WNkCRP+RZ+IhGZQuFD8LlSX/PIh2yJLEf
         g21Ifd9AGv2swVlkIeYpBOLQ8NhoaOeoS4mIpj3TuFxCSffSJONWIBMOQDKigZ/mcNFu
         dEu3XbrVLBQzbpatxBFrDikGmHkdTsQvhWyBhJnu1oTvncEvp3hph3yJHSIKbT9rZH0Z
         XeyHRqvybqSpGuW51X6AvGPcY3xoETOTjdKVIhEy0bz+HdK0W/FShi/hjHIAjUhN4dD5
         Gheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733862; x=1761338662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oY5SxWl4ki9oHWE1mZUvUPxPc8DjDDqn9XkVrxAZe+o=;
        b=dvNnsIxvpvMm+KN8yriufvbYpqSn5w3ldwqYoNBY86HUpJQXhqLhPy/DrX69O+WzFu
         lqIZVvKLWI6HsCepzY6QG5GCUlqLEN3iTRIoF5WaIEmZZ87VWrfdRBf53sMIbaPbn08E
         k21g0WEUTPSe/OY5DbBphvFNyDKNumBdtyItZRcgHXDN7HiHqRyyWvmIIVpW6nUJL4PP
         ZTcAWmDMM9HbnqF60vMpT1Fxwu4cJZnFEfBieUSatGz85vZ+O/Dvc0/mgXLi03sIWeai
         ImbfQueprJV8H3n32yQBO6dJfErjsQa0kBIP3V8ycneZU6aC+7I3R3GfMK8rRsoyMet2
         vixA==
X-Gm-Message-State: AOJu0YwwsoJkbtLJoEwiosTDIR0gf62lDWD5De0eBl2LcBfR07YD8G+G
	Q+eyWzmxhe9EXzqHksuYzRDF+RU1Y6KwnVBexjjMry5gcfQTyDiQx/NRmSbPq3Nug7r58dwQbPl
	VUAhK0SY=
X-Gm-Gg: ASbGncvu3i+1S5uhzX1XEAvaxJA3iLt/6kA32g4a7lk5UoZfqOqfBtQoaILEfiHqOc4
	yXJYeP0+wsySld9VMEFFSLAglG3HV/kSiUuQEw1vTOb6FBGi3h55eHi0vL+RbK3X5I0Hpf/II8Y
	c/waH0K9pOf5+LUKxvKo5ERiGZTOyp8nHRZR1nCreJ9ZMN6dluvaO1JfGTv/IBYApvQbioaLAAB
	5os+IzvjqSqXj2COasZA9wv1PqugmP/tmW45WGm0sGc/ltixH8Mb6uSREFwUC6qkA0d+e2bxi2e
	0yd4JT6Kmiy+8OF3V9ICGLqU+2lSnDnMKhjLrvXNwKwILguLOgcQwn8vPcaimEj9nr9gQ9+GG6C
	ROoIcQpAivhq7CaUf7VdZIpLP3uWAlOJKto4QGWpWPqq+dbCDGSZuuHtAV4t8iVA+Ow==
X-Google-Smtp-Source: AGHT+IH8JFntz6QwnbdqsvaHOpZua+o0CgFdJJXhJOEhBBIUnhKbQGZXDQePKy00aghFKUoLP6ZoqQ==
X-Received: by 2002:a05:6a00:4b16:b0:78c:99a8:d294 with SMTP id d2e1a72fcca58-7a220428903mr5934910b3a.0.1760733862127;
        Fri, 17 Oct 2025 13:44:22 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:aaee:e640:34cd:6f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a230121ebfsm477066b3a.70.2025.10.17.13.44.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:44:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/8] linux-yocto/5.15: update to v5.15.189
Date: Fri, 17 Oct 2025 13:44:04 -0700
Message-ID: <b3f7c8cd4d56120e96b2b12f5a1eb76dc65f682b.1760733724.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760733724.git.steve@sakoman.com>
References: <cover.1760733724.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 20:44:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225066

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    c79648372d02 Linux 5.15.189
    3e4028ef31b6 rseq: Fix segfault on registration when rseq_cs is non-zero
    4b934b78041f x86: Fix X86_FEATURE_VERW_CLEAR definition
    562f207d0a91 x86/mm: Disable hugetlb page table sharing on 32-bit
    8312a1ccff15 vhost-scsi: protect vq->log_used with vq->mutex
    02fd0c7d0d14 Input: atkbd - do not skip atkbd_deactivate() when skipping ATKBD_CMD_GETID
    1b297ab6f38c HID: quirks: Add quirk for 2 Chicony Electronics HP 5MP Cameras
    68c0e3adf09a HID: Add IGNORE quirk for SMARTLINKTECHNOLOGY
    95f184337eb4 vt: add missing notification when switching back to text mode
    f174d73b3fb0 HID: lenovo: Add support for ThinkPad X1 Tablet Thin Keyboard Gen2
    acc94849ebb9 net: usb: qmi_wwan: add SIMCom 8230C composition
    78fe114f13a3 um: vector: Reduce stack usage in vector_eth_configure()
    8ea9a9fb79a9 atm: idt77252: Add missing `dma_map_error()`
    8d672a1a6bfc bnxt_en: Set DMA unmap len correctly for XDP_REDIRECT
    0118fe8fbe2b bnxt_en: Fix DCB ETS validation
    8d11e48b1276 net: ll_temac: Fix missing tx_pending check in ethtools_set_ringparam()
    0da557bbeae2 can: m_can: m_can_handle_lost_msg(): downgrade msg lost in rx message to debug level
    6b08605e12b3 net: phy: microchip: limit 100M workaround to link-down events on LAN88xx
    b2f5dfa87367 net: appletalk: Fix device refcount leak in atrtr_create()
    a3aea97d5596 netfilter: flowtable: account for Ethernet header in nf_flow_pppoe_proto()
    df525911974c ksmbd: fix a mount write count leak in ksmbd_vfs_kern_path_locked()
    fedd65b58469 smb: server: make use of rdma_destroy_qp()
    cb121c47f364 nbd: fix uaf in nbd_genl_connect() error path
    10c6021a609d raid10: cleanup memleak at raid10_make_request
    48da050b4f54 md/raid1: Fix stack memory use after return in raid1_reshape
    b24f65c18454 wifi: zd1211rw: Fix potential NULL pointer dereference in zd_mac_tx_to_dev()
    09064e6d6597 dma-buf: fix timeout handling in dma_resv_wait_timeout v2
    419192cb11f2 dma-buf: use new iterator in dma_resv_wait_timeout
    84df80b4c704 dma-buf: add dma_resv_for_each_fence_unlocked v8
    3435a2048972 usb: dwc3: Abort suspend on soft disconnect failure
    c1cb5c166fec usb: cdnsp: Fix issue with CV Bad Descriptor test
    ba3a2e446fc7 usb: cdnsp: Replace snprintf() with the safer scnprintf() variant
    2991f28da681 usb:cdnsp: remove TRB_FLUSH_ENDPOINT command
    9a433cd87236 Input: xpad - support Acer NGR 200 Controller
    e9b894ca7589 xhci: Disable stream for xHC controller with XHCI_BROKEN_STREAMS
    e262ff8d634c usb: xhci: quirk for data loss in ISOC transfers
    59aca35c69c2 xhci: Allow RPM on the USB controller (1022:43f7) by default
    982beb7582c1 virtio-net: ensure the received length does not exceed allocated size
    c47c83f6f2ec netlink: make sure we allow at least one dump skb
    ccc9da90af65 netlink: Fix rmem check in netlink_broadcast_deliver().
    a2504279841f pwm: mediatek: Ensure to disable clocks in error path
    d7684190951e RDMA/mlx5: Fix vport loopback for MPV device
    e774a693b7ff btrfs: use btrfs_record_snapshot_destroy() during rmdir
    21ab2c7c9794 btrfs: propagate last_unlink_trans earlier when doing a rmdir
    d216d5a277de Revert "ACPI: battery: negate current when discharging"
    a5012673d497 usb: gadget: u_serial: Fix race condition in TTY wakeup
    2f4df5d07c77 drm/gem: Fix race in drm_gem_handle_create_tail()
    ef841f8e4e1f drm/sched: Increment job count before swapping tail spsc queue
    cb4b08a095b1 pinctrl: qcom: msm: mark certain pins as invalid for interrupts
    0c1ad5738526 gre: Fix IPv6 multicast route creation.
    e3154a48fd0b x86/mce: Make sure CMCI banks are cleared during shutdown on Intel
    9f4431ba8501 x86/mce: Don't remove sysfs if thresholding sysfs init fails
    9cd4fa64814b x86/mce/amd: Fix threshold limit reset
    ae0e082687b2 xen: replace xen_remap() with memremap()
    f98bf80b20f4 jfs: fix null ptr deref in dtInsertEntry
    65ad600b9bde bpf, sockmap: Fix skb refcnt race after locking changes
    2499fa286fb0 aoe: avoid potential deadlock at set_capacity
    39d5137085a6 thermal/int340x_thermal: handle data_vault when the value is ZERO_SIZE_PTR
    e37e3b6cc8dc bpf: fix precision backtracking instruction iteration
    f5e72b7824d0 rxrpc: Fix oops due to non-existence of prealloc backlog struct
    d30910170f7e ice: safer stats processing
    32caa50275cc fs/proc: do_task_stat: use __for_each_thread()
    25452638f133 net/sched: Abort __tc_modify_qdisc if parent class does not exist
    7f1cad84ac1a atm: clip: Fix NULL pointer dereference in vcc_sendmsg()
    5641019dfbae atm: clip: Fix infinite recursive call of clip_push().
    1c075e88d585 atm: clip: Fix memory leak of struct clip_vcc.
    3251ce3979f4 atm: clip: Fix potential null-ptr-deref in to_atmarpd().
    66f9065c1c7d net: phy: smsc: Fix link failure in forced mode with Auto-MDIX
    29a5de38fa1e net: phy: smsc: Fix Auto-MDIX configuration when disabled by strap
    0ba1021a8302 vsock: Fix IOCTL_VM_SOCKETS_GET_LOCAL_CID to check also `transport_local`
    36a439049b34 vsock: Fix transport_* TOCTOU
    80d7dc15805a vsock: Fix transport_{g2h,h2g} TOCTOU
    dab8ded2e5ff tipc: Fix use-after-free in tipc_conn_close().
    fd69af061010 netlink: Fix wraparounds of sk->sk_rmem_alloc.
    552a066477cb fix proc_sys_compare() handling of in-lookup dentries
    c0aec35f861f perf: Revert to requiring CAP_SYS_ADMIN for uprobes
    2df3e265a301 ASoC: fsl_asrc: use internal measured ratio for non-ideal ratio mode
    87825fbd1e17 drm/exynos: exynos7_drm_decon: add vblank check in IRQ handling

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index fc9a3c3397..1df0d30c81 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "29a212d112aaa83d5d28c91088c877ee0164afbc"
-SRCREV_meta ?= "35e38f16718b4358712a1545b1b5bcb8b14bb28f"
+SRCREV_machine ?= "57a47106b330353648ec7c1c2f5d28437937bb69"
+SRCREV_meta ?= "d8c8889e18158a14223aa6cdb121c26a4d58fb56"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.188"
+LINUX_VERSION ?= "5.15.189"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 8fc3e3dc4d..48a7466509 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.188"
+LINUX_VERSION ?= "5.15.189"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c763c9cf2a50b3e8c7be255112d3322d34e37803"
-SRCREV_meta ?= "35e38f16718b4358712a1545b1b5bcb8b14bb28f"
+SRCREV_machine ?= "c9df5e8ec3f116c77fbc29d8d88cf00da6ecb4f3"
+SRCREV_meta ?= "d8c8889e18158a14223aa6cdb121c26a4d58fb56"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index da1aedd31d..99ce420369 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "59eda9c8cd28d83857eca9f39f777188870f00c4"
-SRCREV_machine:qemuarm64 ?= "be863e2ed3deabb3b194aaf8860263d651c26be5"
-SRCREV_machine:qemumips ?= "c67be260b4eb8307f7da8c632fd3ca510b906d7e"
-SRCREV_machine:qemuppc ?= "d0a7f356bbb2b771f8eed843c52b8f9a213a7559"
-SRCREV_machine:qemuriscv64 ?= "aa5fe401b86e527dd49b5a157b71d79bbf19461e"
-SRCREV_machine:qemuriscv32 ?= "aa5fe401b86e527dd49b5a157b71d79bbf19461e"
-SRCREV_machine:qemux86 ?= "aa5fe401b86e527dd49b5a157b71d79bbf19461e"
-SRCREV_machine:qemux86-64 ?= "aa5fe401b86e527dd49b5a157b71d79bbf19461e"
-SRCREV_machine:qemumips64 ?= "648039263363d55f8f3573edcfbb0059657e268b"
-SRCREV_machine ?= "aa5fe401b86e527dd49b5a157b71d79bbf19461e"
-SRCREV_meta ?= "35e38f16718b4358712a1545b1b5bcb8b14bb28f"
+SRCREV_machine:qemuarm ?= "da6836630834b34b24e1f0457afec67ba2bbab78"
+SRCREV_machine:qemuarm64 ?= "67ec90bce4425aa5b79586360c80fa08a34ca9d0"
+SRCREV_machine:qemumips ?= "2b2d7942cb977389f270d85a58adaf4659a3abbb"
+SRCREV_machine:qemuppc ?= "fcf1b5e6d46c8a7835dbd70331d380fff0319b7f"
+SRCREV_machine:qemuriscv64 ?= "3e27e9870b35af885840862de91caec215486a18"
+SRCREV_machine:qemuriscv32 ?= "3e27e9870b35af885840862de91caec215486a18"
+SRCREV_machine:qemux86 ?= "3e27e9870b35af885840862de91caec215486a18"
+SRCREV_machine:qemux86-64 ?= "3e27e9870b35af885840862de91caec215486a18"
+SRCREV_machine:qemumips64 ?= "366189c9e588082ad8c22b61143aa1fd10f3e273"
+SRCREV_machine ?= "3e27e9870b35af885840862de91caec215486a18"
+SRCREV_meta ?= "d8c8889e18158a14223aa6cdb121c26a4d58fb56"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "89950c4542652dfe435f9519a5080f7d2128764c"
+SRCREV_machine:class-devupstream ?= "c79648372d02944bf4a54d87e3901db05d0ac82e"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.188"
+LINUX_VERSION ?= "5.15.189"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.43.0


