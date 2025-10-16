Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C3B4CCD185
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 03:16:35 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.4756.1760584585193405238
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 20:16:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RP4RnrmH;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-88e51cf965dso55912085a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 20:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760584584; x=1761189384; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0oRcfLCsrb9Uy7tzqgVumWILiL6ARtSlhLxV7njNNc=;
        b=RP4RnrmHe/lQTp07rm83kDIdfIE7Vz8hjdek38/N6G06YpUPa/PbHYLj66elWAmRek
         Q6uDxhpAsKauzVzN7F7W1z7LvtmTzddFzB6sheiHqorAaRXjY0h5CUxTqLwHnbriqzrT
         ZMZtylO+Wdw+Wx+cmiSKStAgxKTd3l8sJ8mbpgZPosa0pXe/07yhG9meHe0LI8zoPus+
         8h3gM+rZrQHlZr/R7wEydG1QXJvSgj2c98+DOloJ5apWiTdRP6VcP40SDWgmZvxkU6ca
         bEmnaIV6Wy/BCa61SLj7PYY777SXWOXwPm3CCDhzLIc2hRNPYhI+VwlxgJ5eDAXL5i5/
         Z9wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760584584; x=1761189384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k0oRcfLCsrb9Uy7tzqgVumWILiL6ARtSlhLxV7njNNc=;
        b=G2wIiVrg33gIBT1TRr64uDkymqZ4NFzClpf3hbOnel+0qJifSg4JqUZPXsisOeMpYt
         /QM+MPShWUIH8aK1g9nWp+ISgelESpah+6TTzvL9ZSPK4dNKQTjRImQfEKHaipwRSKiz
         xm1NuqRmWgsPMni9sCX+MWjUVAlrfTnH80KpttN1pjv80Jv90EBTFCh5vDg9O+XXARXJ
         kkH3CyexQb5XghUqMyp5o1TDZTe8E+jUKWgD/x6Z2ye7ZHLPjXcRZPsRdlXVoys6CjuY
         8JU2l6zByAfjX/8ahVwH7WXaBOxAwWVdhmvGRt766g8+F2s7S+04EPg73/cNn0fbNb1e
         44/A==
X-Gm-Message-State: AOJu0Yw5QjSTAvhkTsi5JLKZmKSPQemFDFyxlRXn7LyN4e3kgqouCx9v
	dFuFMQAKdBMBETHUEglUjHnXbSIPsj5U3ivN9PMq/k2UK15nTSR83nDvT3GxFuxE4PA=
X-Gm-Gg: ASbGncugY9yt0I3DZl42ORGEqzYm5dDHKBuRkdmD4fnhjB5ywBSgu3d6724qNzgHL47
	0JzVErN7qI+33gT/YkHrc+GC16SXQUeKnxasVLZGUmAyy1bK+SKa44U4q50sJNbo4+ChEIQhj/H
	cKRk0o27DInc1ewxlmPdgVMrU/b76fI+cWVLVIrrc7uLq2pgseWoDqyFssAJLg2MlqDswC7C8mp
	Kj7tg2BAZ5WJSCHDinfLlVqdDe3+QTRbajSuHDUi/eNeW4ayDjobf/j8yeYB4F0SMeXSDjP7k78
	lNCyFO89eZkRf9r7X+64A6QmsqSmR3YkbHq7U1erhVX7ngg8MBeLRvYFW7/H/JiObyYZSlpjUDj
	tZhe6Q8R4ZpGokc659CgA4NEAZD7ulgtM9/UiYjMwaJa+DRpYOnh6++PYAYwxrAPaBEZfa0ofMh
	xPL0veCeIG7xxZHFgPmhfZVrMgZHOfAbT0J+uELVBlxMRHwxxTYQ0dbNgdI8PNtQzGoScfKjtTO
	kfp6ZEyrlzgAuo=
X-Google-Smtp-Source: AGHT+IFZ+sl9LFyrtas3Btv32zhEKa22PlC/e+22+SoDNl58vXR6nzLjyeyOusPUby8jP3Ty5IPqew==
X-Received: by 2002:a05:620a:1a1e:b0:85e:5fef:86fa with SMTP id af79cd13be357-88350a7ade8mr4329593585a.28.1760584583594;
        Wed, 15 Oct 2025 20:16:23 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-88f37f46d0fsm107396885a.33.2025.10.15.20.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 20:16:22 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com
Subject: [OE-core][kirkstone 2/4] linux-yocto/5.15: update to v5.15.189
Date: Wed, 15 Oct 2025 23:16:18 -0400
Message-Id: <20251016031620.3207887-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20251016031620.3207887-1-bruce.ashfield@gmail.com>
References: <20251016031620.3207887-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 03:16:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224940

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
2.39.2


