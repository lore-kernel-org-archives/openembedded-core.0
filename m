Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D44A0CCD185
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 03:14:34 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.4725.1760584465170401437
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 20:14:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cdiV596v;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-855733c47baso59712285a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 20:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760584464; x=1761189264; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sd3v/knGg0xqlySo3LS4xnxQrUf/uKBVUQAZ6GVE9ZA=;
        b=cdiV596v3vqVxWlh+VHQJ0c+mpEqFMqln5LVSmJFvXHU18bl7I/4q9ZpQa3HazOY+r
         sKLLe3A6jh6UyYF0WKujozfDCp/jzEnHH4Xiv21p6Q1UgGXn/Pr+y47q1BpE5nrvIHfl
         ZPmXgeexBFKTZR5pjdnTBSVwNiqjrzHHevzoLlgE9Xm1qPMNmoUuJuMuhTNqgG2FqZxf
         emr+ht0w7x+FPlS4FWhz5zaugLqgcoSy/9zhg5RDuqQbZKrz19cEWZv7c7w7BeHb2srR
         /sRut9b1bgiAipZXoq5vZs9g4cD1Qi2b7EyuQo1j/fUyau+3z2DjCfgFRa55BQSMF7X/
         zpDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760584464; x=1761189264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sd3v/knGg0xqlySo3LS4xnxQrUf/uKBVUQAZ6GVE9ZA=;
        b=B31an5upsEp/fBn+tsqmRaom/ITdWzP3gBjMjfu6ZFo2QNbxljuNrx009aafZf8OYp
         /pSSeySVfzuUu5S1jmAdVPrS3OToVkhECwj0bNxiQxHcCYvpp+qS45qBLs2HCEK4Xurj
         oH6uePBC8ESWv0fYPKj9aNzdUOvk5s/VW3s+3zY7nlv5BFBBkdIKZacJbnjxjcnssplm
         eV8bYLet2UoppvasWy5O1icVC3GpWIYnnv7cMLw/1OhpQ/DlFEV7UNPJKrga423ES3m5
         A2xcXct6KWNIJYSIaSU8O07n/rfbNR+nXj0pwmAxQc6Jtmu6vf9ontWUTUz8y4aDl9oV
         19mA==
X-Gm-Message-State: AOJu0YztDLNFRNwTVtWfaNRSFdsmnP5FOJLSck4DaSqFoLdWQx9Wrt14
	cqgmZAsm8IJ3bDNdJUKkNgaG5CfLpB0PZA/38ObnAdSVmCJqr9oNRklDwRqNZiUPW5k=
X-Gm-Gg: ASbGncsr4WUcIxWGV+p7FdYCfEqKaiMD7p9kPdXm5wDpg8oiMBxoFnRTrp84Ju0aym0
	An/Sz2kzN3z3Nqf1X4CXhhVH0sr2luNamlrucBQzXsPJRM0K17E2BeC8G89Nx1bT974qdp6ddwt
	QCB1mFZ8qOs0NsQNWfceJ855zTtttZ3bFGa8qKzx68zBB9hmxiYVHaODgSsTnMNIwyDbU47I/wj
	EUN7yHsnldQrMJrxIwuA25jP8689fKzPKSxEBwdO5FrMS44E3X1j6k0aoriibftyAgDSuhr4r29
	p/aoHSbO6/qfdP9XjTGMMhvaGw7Pd0fhTPZANPzG+xXaVvnY32+RWb8jJwooG04QLoH6A9y98F5
	mmYCKY+11vI7xv9AIQScKcxALMaY93lfi7fJ7i5H9MfYnYqADt3mHm/hfyx29IXQUwdCrL9M9YB
	krU0Tp1ETvqFuBoJZ+S/pf1szr4CAmuoIdnmoc47ndSA+/pG8DQPNgARQ0juK5QrCeGAxFNSitG
	I8SHgsgdsWwXyw=
X-Google-Smtp-Source: AGHT+IEkbnO3wssKvesQYgt0h2Kitf9yr1CrWWlHeXrvDK5ebaJJfl/BhRN9Ee9GppFaEQFGZSlcBg==
X-Received: by 2002:a05:620a:d89:b0:86a:3188:bb49 with SMTP id af79cd13be357-883525c06f8mr4575076185a.54.1760584463598;
        Wed, 15 Oct 2025 20:14:23 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-88f37f45149sm109327085a.32.2025.10.15.20.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 20:14:23 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com
Subject: [OE-core][scarthgap 02/12] linux-yocto/6.6: update to v6.6.99
Date: Wed, 15 Oct 2025 23:14:11 -0400
Message-Id: <20251016031421.3207596-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20251016031421.3207596-1-bruce.ashfield@gmail.com>
References: <20251016031421.3207596-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 03:14:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224928

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    d96eb99e2f0e Linux 6.6.99
    eaf112069a90 rseq: Fix segfault on registration when rseq_cs is non-zero
    f02f0218be41 crypto: ecdsa - Harden against integer overflows in DIV_ROUND_UP()
    97c355989928 ksmbd: fix potential use-after-free in oplock/lease break ack
    8377d7744bdc kasan: remove kasan_find_vm_area() to prevent possible deadlock
    d3927e55c959 smb: client: fix potential race in cifs_put_tcon()
    a4bb7ced4e8f selftests/bpf: adapt one more case in test_lru_map to the new target_free
    f35c825a012d Input: atkbd - do not skip atkbd_deactivate() when skipping ATKBD_CMD_GETID
    3ce1d87d1f5d HID: quirks: Add quirk for 2 Chicony Electronics HP 5MP Cameras
    ae915b38e262 HID: Add IGNORE quirk for SMARTLINKTECHNOLOGY
    b71a75739af9 bpf: Adjust free target to avoid global starvation of LRU map
    cd5b424d8322 vt: add missing notification when switching back to text mode
    f4428b2d4c68 btrfs: fix assertion when building free space tree
    2cc5ef01ea03 net: mana: Record doorbell physical address in PF mode
    9f460b235ef3 HID: lenovo: Add support for ThinkPad X1 Tablet Thin Keyboard Gen2
    cd4df14f6180 net: usb: qmi_wwan: add SIMCom 8230C composition
    e07c2feb4916 ALSA: hda/realtek - Enable mute LED on HP Pavilion Laptop 15-eg100
    ee287cf30ffb ASoC: amd: yc: add quirk for Acer Nitro ANV15-41 internal mic
    50b1e01aa123 io_uring: make fallocate be hashed work
    825088c90357 um: vector: Reduce stack usage in vector_eth_configure()
    8cafaba2f275 atm: idt77252: Add missing `dma_map_error()`
    0d8a9b6dd321 ublk: sanity check add_dev input for underflow
    5909679a82cd bnxt_en: Set DMA unmap len correctly for XDP_REDIRECT
    e644935d40cb bnxt_en: Fix DCB ETS validation
    7d4d1993517b net: ll_temac: Fix missing tx_pending check in ethtools_set_ringparam()
    5aa8b3a1d8ab can: m_can: m_can_handle_lost_msg(): downgrade msg lost in rx message to debug level
    10946f834638 net: phy: microchip: limit 100M workaround to link-down events on LAN88xx
    9fa29314eba1 ibmvnic: Fix hardcoded NUM_RX_STATS/NUM_TX_STATS with dynamic sizeof
    4a17370da6e4 net: appletalk: Fix device refcount leak in atrtr_create()
    9fbc49429a23 netfilter: flowtable: account for Ethernet header in nf_flow_pppoe_proto()
    d46186eb7bbd nbd: fix uaf in nbd_genl_connect() error path
    8fc3d7b23d13 raid10: cleanup memleak at raid10_make_request
    df5894014a92 md/raid1: Fix stack memory use after return in raid1_reshape
    d1240029f97a drm/tegra: nvdec: Fix dma_alloc_coherent error check
    5420de65efbe wifi: zd1211rw: Fix potential NULL pointer dereference in zd_mac_tx_to_dev()
    739296467a59 cifs: all initializations for tcon should happen in tcon_info_alloc
    03c3cd0c3b67 smb: client: fix DFS interlink failover
    d043b5da37fc smb: client: avoid unnecessary reconnects when refreshing referrals
    609a617a97c0 usb: dwc3: Abort suspend on soft disconnect failure
    e3f79e2c9ad1 usb: cdnsp: Fix issue with CV Bad Descriptor test
    ae5b191184ce usb: cdnsp: Replace snprintf() with the safer scnprintf() variant
    7227a8229f43 usb:cdnsp: remove TRB_FLUSH_ENDPOINT command
    fd79927c8191 btrfs: fix inode lookup error handling during log replay
    6aea26dc23d5 btrfs: return a btrfs_inode from btrfs_iget_logging()
    e6031107f397 btrfs: remove redundant root argument from fixup_inode_link_count()
    28a36e75d196 btrfs: remove redundant root argument from btrfs_update_inode_fallback()
    ddead3c5ca18 btrfs: remove noinline from btrfs_update_inode()
    c31ee1695b6d netlink: make sure we allow at least one dump skb
    ce2ac2e46719 netlink: Fix rmem check in netlink_broadcast_deliver().
    5b1b8f06b179 erofs: fix to add missing tracepoint in erofs_read_folio()
    4c4f931676b6 ksmbd: fix a mount write count leak in ksmbd_vfs_kern_path_locked()
    d903a0fe324e smb: server: make use of rdma_destroy_qp()
    3c0994a3fd93 x86/mm: Disable hugetlb page table sharing on 32-bit
    ee21fbcb87a0 x86/rdrand: Disable RDSEED on AMD Cyan Skillfish
    ad9d4db5a8ac pwm: mediatek: Ensure to disable clocks in error path
    37e2911d2ec1 mm/vmalloc: leave lazy MMU mode on PTE mapping error
    f64046ae3401 scripts/gdb: fix interrupts.py after maple tree conversion
    ecf16604f3f0 scripts/gdb: de-reference per-CPU MCE interrupts
    e2e200c98e9f scripts/gdb: fix interrupts display after MCP on x86
    56995226431a mm: fix the inaccurate memory statistics issue for users
    167134042418 maple_tree: fix mt_destroy_walk() on root leaf node
    688bf63ee6ba kallsyms: fix build without execinfo
    c23a41086899 Revert "ACPI: battery: negate current when discharging"
    2e2e9b3d7084 drm/framebuffer: Acquire internal references on GEM handles
    dec7774d0ef9 Revert "usb: gadget: u_serial: Add null pointer check in gs_start_io"
    c6eb4a05af3d usb: gadget: u_serial: Fix race condition in TTY wakeup
    8c290a9d629b drm/gem: Fix race in drm_gem_handle_create_tail()
    db7402d78e7c drm/ttm: fix error handling in ttm_buffer_object_transfer
    c64f5310530b drm/sched: Increment job count before swapping tail spsc queue
    cb4c956a15f8 drm/gem: Acquire references on GEM handles for framebuffers
    ec6392061de6 wifi: prevent A-MSDU attacks in mesh networks
    1d57f7132662 pinctrl: qcom: msm: mark certain pins as invalid for interrupts
    3d82a729530b md/md-bitmap: fix GPF in bitmap_get_stats()
    2ca1db269a8d gre: Fix IPv6 multicast route creation.
    8c8e8d4d7544 KVM: SVM: Reject SEV{-ES} intra host migration if vCPU creation is in-flight
    20d1d9e7ce69 KVM: x86/xen: Allow 'out of range' event channel ports in IRQ routing table.
    a18776abc592 x86/mce: Make sure CMCI banks are cleared during shutdown on Intel
    f536f3b09773 x86/mce: Don't remove sysfs if thresholding sysfs init fails
    cc058adb9beb x86/mce/amd: Fix threshold limit reset
    8e5058a5812e x86/mce/amd: Add default names for MCA banks and blocks
    e2d5c005dfc9 ipmi:msghandler: Fix potential memory corruption in ipmi_create_user()
    efc1b2b7c1a3 rxrpc: Fix oops due to non-existence of prealloc backlog struct
    ddc4fe078948 Bluetooth: HCI: Set extended advertising data synchronously
    eb952372bf48 perf: build: Setup PKG_CONFIG_LIBDIR for cross compilation
    e63032e66bca maple_tree: fix MA_STATE_PREALLOC flag in mas_preallocate()
    432c5363cd6f rxrpc: Fix bug due to prealloc collision
    4c691d1b6b6d net/sched: Abort __tc_modify_qdisc if parent class does not exist
    07b585ae3699 atm: clip: Fix NULL pointer dereference in vcc_sendmsg()
    3f61b997fe01 atm: clip: Fix infinite recursive call of clip_push().
    1fb9fb5a4b5c atm: clip: Fix memory leak of struct clip_vcc.
    06935c50cfa3 atm: clip: Fix potential null-ptr-deref in to_atmarpd().
    36cf9bcf09bd net: phy: smsc: Fix link failure in forced mode with Auto-MDIX
    0a0d040f12fe net: phy: smsc: Force predictable MDI-X state on LAN87xx
    72c62b4991a2 net: phy: smsc: Fix Auto-MDIX configuration when disabled by strap
    791c8d6b76c5 net: stmmac: Fix interrupt handling for level-triggered mode in DWC_XGMAC2
    d437e8e7dcb9 vsock: Fix IOCTL_VM_SOCKETS_GET_LOCAL_CID to check also `transport_local`
    9d24bb678028 vsock: Fix transport_* TOCTOU
    401239811fa7 vsock: Fix transport_{g2h,h2g} TOCTOU
    81373cd1d72d tcp: Correct signedness in skb remaining space calculation
    be4b8392da79 tipc: Fix use-after-free in tipc_conn_close().
    42262bc4e8ef vsock: fix `vsock_proto` declaration
    55baecb9eb90 netlink: Fix wraparounds of sk->sk_rmem_alloc.
    f9b3d28f1f62 fix proc_sys_compare() handling of in-lookup dentries
    82c0f15c26be pinctrl: amd: Clear GPIO debounce for suspend
    a219fcea8e8e Bluetooth: hci_event: Fix not marking Broadcast Sink BIS as connected
    51e082108345 Bluetooth: hci_sync: Fix not disabling advertising instance
    c604dd2c5e6b ASoC: cs35l56: probe() should fail if the device ID is not recognized
    183bdb89af1b perf: Revert to requiring CAP_SYS_ADMIN for uprobes
    71eb118baf6e perf/core: Fix the WARN_ON_ONCE is out of lock protected region
    407f1073ea23 ASoC: fsl_asrc: use internal measured ratio for non-ideal ratio mode
    391e5ea5b877 drm/exynos: exynos7_drm_decon: add vblank check in IRQ handling
    521e9ff0b67c eventpoll: don't decrement ep refcount while still holding the ep mutex

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 6622b87d19..cfc7b72da8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1c4b6c1312449f28032c8b83ce96280a404ed6e1"
-SRCREV_meta ?= "6df14e0eacedd9f025d88e310ef7fcc0bde6f550"
+SRCREV_machine ?= "a1284b1ec1c1b4818675778b9746b28dfa62c4bb"
+SRCREV_meta ?= "62a638bf97b8ca5e8e7c2e889b9965d6e5aed1bc"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.98"
+LINUX_VERSION ?= "6.6.99"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 0d1d8b332e..ecc94b4c70 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.98"
+LINUX_VERSION ?= "6.6.99"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "f8e22255578e2c951974340aae60bf9dc56b838c"
-SRCREV_meta ?= "6df14e0eacedd9f025d88e310ef7fcc0bde6f550"
+SRCREV_machine ?= "a92b0c8786e4b797f2cd47fb12b36e621a79834d"
+SRCREV_meta ?= "62a638bf97b8ca5e8e7c2e889b9965d6e5aed1bc"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 031925129f..d47a186a85 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "8057ff8a5fafefaf330e60e34bc4b83f4070763a"
-SRCREV_machine:qemuarm64 ?= "6a1a2f157c2b4fd7107ae28ccea2e5dd41086118"
-SRCREV_machine:qemuloongarch64 ?= "760085c1a370bb909a8d256f8bfffdb9f9f879a8"
-SRCREV_machine:qemumips ?= "dc0cec39323fbf083dce76f83fc80462fd582781"
-SRCREV_machine:qemuppc ?= "206991d0103afe59a9ea27619d3ed3e82e49f468"
-SRCREV_machine:qemuriscv64 ?= "760085c1a370bb909a8d256f8bfffdb9f9f879a8"
-SRCREV_machine:qemuriscv32 ?= "760085c1a370bb909a8d256f8bfffdb9f9f879a8"
-SRCREV_machine:qemux86 ?= "760085c1a370bb909a8d256f8bfffdb9f9f879a8"
-SRCREV_machine:qemux86-64 ?= "760085c1a370bb909a8d256f8bfffdb9f9f879a8"
-SRCREV_machine:qemumips64 ?= "fa01c554b0080d610d45cc3dd7fb2dd08ec0e473"
-SRCREV_machine ?= "760085c1a370bb909a8d256f8bfffdb9f9f879a8"
-SRCREV_meta ?= "6df14e0eacedd9f025d88e310ef7fcc0bde6f550"
+SRCREV_machine:qemuarm ?= "81a67e3d3d46f20a12e869078c60864c466a4fee"
+SRCREV_machine:qemuarm64 ?= "68f8e3b8ae0c65828794cdb9e03a8030d3a32c0b"
+SRCREV_machine:qemuloongarch64 ?= "58d3f59a009b2b25547fc4a9ec7cd59fca4776f0"
+SRCREV_machine:qemumips ?= "90565b2dd07c5ba430ecd9311a5297292f630d71"
+SRCREV_machine:qemuppc ?= "7fdf770f5adb7da51033fbf95a44fe4c7da08d74"
+SRCREV_machine:qemuriscv64 ?= "58d3f59a009b2b25547fc4a9ec7cd59fca4776f0"
+SRCREV_machine:qemuriscv32 ?= "58d3f59a009b2b25547fc4a9ec7cd59fca4776f0"
+SRCREV_machine:qemux86 ?= "58d3f59a009b2b25547fc4a9ec7cd59fca4776f0"
+SRCREV_machine:qemux86-64 ?= "58d3f59a009b2b25547fc4a9ec7cd59fca4776f0"
+SRCREV_machine:qemumips64 ?= "f8013e6f23a92cb0a74c7cff75a340a3e49e0e36"
+SRCREV_machine ?= "58d3f59a009b2b25547fc4a9ec7cd59fca4776f0"
+SRCREV_meta ?= "62a638bf97b8ca5e8e7c2e889b9965d6e5aed1bc"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "9247f4e6573a4d05fe70c3e90dbd53da26e8c5cb"
+SRCREV_machine:class-devupstream ?= "d96eb99e2f0e32b6d29e7f12a790b08c08825503"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.98"
+LINUX_VERSION ?= "6.6.99"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


