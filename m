Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00794CCD1A5
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 20:40:04 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.3140.1760733601180639100
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 13:40:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=oA+VFO+u;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-782a77b5ec7so2268911b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 13:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760733600; x=1761338400; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p3Bjg6gtZA0NE7cezLtGdjTW3tsvU37Tz2MDmI0fCQk=;
        b=oA+VFO+uMpkmZ5ep/i/RNSXnc/mCxl2rRw/tDHjRuJeKN5im7OPZ1Z1ekPka1Rl+rF
         MQxRQ5ztOYZ3EED6O5jtcDsFqPd65GorMc8Bw7Ay9U7uZwN42J2WGeNRpmat7cxQqOTk
         3mAdaa7bxxjyOTFGFPebWwO8nPXuIm4YoOnv1A0luYJ1v+NX+HAGvHGZzuNPYQXIg4M9
         sqBA4uDFEGlXsCMYWkS8VyQykMdUjup8DpN6szK6lH/MgW9kQVduukMQk0hSo0NrVwp+
         r6FsZTuUi0bAkXiH6cK3v6k+0lrzt0GuBscADR3GaqKxirWIJkTagKqNHImccpFJYbzd
         2AEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733600; x=1761338400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p3Bjg6gtZA0NE7cezLtGdjTW3tsvU37Tz2MDmI0fCQk=;
        b=pj6HNdDl1jzQh28wqNLcTeCI29k/cQofNd7YZ0EYfx9jEy87ETmbqkcI1UfUxQzh8m
         1+vca8ka5rKiEWQaO0ZQN1cUZ4XYSmatdW/FOKTiuWnMfGng8vkusG1EXa0oatwBULtt
         5DPgp4X6mN/8T8Z40HzzMh8Y4St/xPtzBJAJaLWsmuOO7h/yd4+Foi1aDHMjB+a465e0
         /o1U6C8eSoZMKApjdutUn4PeGMxPLOkwUDwHeLrL39QVCxVSLXC6w6OvJUpYtPoXsDCG
         gegm0kOx/ppCQ7ARBmce9yvGGN7+Q+JqaASmpYjjGYuDxK76ksmPA5Wm2i3sfyPGdvbu
         GnYg==
X-Gm-Message-State: AOJu0Yx9G/0kPKMGI47uSYgeTk8BfFlW072pr0I3qQKfL/J2hnExeWOF
	WrTWDGpIcjdjceW2/qlowTyxqsZx9z/HCFCNEXNOXrSrpwQSPTuGw8UTTE538QWt0i3LDnGMm3/
	JBPbAIig=
X-Gm-Gg: ASbGncuYBhsJUI0hpxt8ev/p6FOrkhSZ2gCXNY6jhAOhWzZDBZ3RTQGOjYwRv8moPuG
	iiQ5foxc2boM24z9dqEoACvAdFAgR8Ci3ODNqYaiYVQqNUbWOv8fi//uYR+sr5KvBskdL7wt37N
	qANV+F0ajUs0B+Qp8DhgZ3cgSG1M7KgkbDXLHKDU0Dv2GCo55jCMEzVDlu0rGVdZzph7e7MQy6I
	pcuPioycoxMGCsuDFhfzahUwXNfB+Ecmyl0RJl2lY8+b6y2sHbFrUyaLdnordyOWL1w1GJbHjPj
	8/+CvfZrMP6Dt9kWazbgOgwPiNYVbJuFlF901MUtiobVVsbdPU6nYkbEOJBtWR+MEO8nyp/tFIR
	spV+/7w6wKYusYptTF+Lz+ike2oClozxfSRinxj5lHWC/tXagnP35mIeNyxwBUC7q47PKbRzWX5
	ZT
X-Google-Smtp-Source: AGHT+IGyXvvynN2vfaJFJpOXyqaiqiZHWO6LuYFeIFZXgfTdhYW1B/2zmcnr6ptubARPMER47YWZqw==
X-Received: by 2002:a05:6a00:3ccd:b0:781:17fb:d3d0 with SMTP id d2e1a72fcca58-7a2208f01dcmr5584143b3a.8.1760733600290;
        Fri, 17 Oct 2025 13:40:00 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:aaee:e640:34cd:6f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f254esm477061b3a.45.2025.10.17.13.39.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:39:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 19/26] linux-yocto/6.6: update to v6.6.107
Date: Fri, 17 Oct 2025 13:39:02 -0700
Message-ID: <4964bdf8bf8b4c889928478db3e0d901e748fe55.1760733431.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760733431.git.steve@sakoman.com>
References: <cover.1760733431.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 20:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225053

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

no ids found, dumping:
    af1544b5d072 Linux 6.6.107
    f075a33ef204 x86: disable image size check for test builds
    23f24d0a538e drm/i915/power: fix size for for_each_set_bit() in abox iteration
    0a87bf8bd5d7 drm/amdgpu: fix a memory leak in fence cleanup when unloading
    d70b5910ca31 net: mdiobus: release reset_gpio in mdiobus_unregister_device()
    cce57cd8c5de ksmbd: fix null pointer dereference in alloc_preauth_hash()
    ce807c4c88d2 phy: ti-pipe3: fix device leak at unbind
    7c89ea3ab302 phy: tegra: xusb: fix device and OF node leak at probe
    221f6739369b dmaengine: dw: dmamux: Fix device reference leak in rzn1_dmamux_route_allocate
    ebf6c7c908e5 dmaengine: qcom: bam_dma: Fix DT error handling for num-channels/ees
    e0727853992a usb: gadget: midi2: Fix MIDI2 IN EP max packet size
    a04b32b0ec1b usb: gadget: midi2: Fix missing UMP group attributes initialization
    bea1946b6919 USB: gadget: dummy-hcd: Fix locking bug in RT-enabled kernels
    26f296e4c497 xhci: fix memory leak regression when freeing xhci vdev devices depth first
    0d861bc0b5c4 RISC-V: Remove unnecessary include from compat.h
    156677ea10ba hrtimers: Unconditionally update target CPU base after offline timer migration
    b1fa39fb3026 hrtimer: Rename __hrtimer_hres_active() to hrtimer_hres_active()
    6276a6b2c84e hrtimer: Remove unused function
    c504b5aaaaa5 regulator: sy7636a: fix lifecycle of power good gpio
    1baed10553fc dmaengine: ti: edma: Fix memory allocation size for queue_priority_map
    df82c7901513 dmaengine: idxd: Fix double free in idxd_setup_wqs()
    f0e460925679 dmaengine: idxd: Fix refcount underflow on module unload
    0e95ee7f532b dmaengine: idxd: Remove improper idxd_free
    608c14c671a8 hsr: use hsr_for_each_port_rtnl in hsr_port_get_hsr
    b072e32e0874 hsr: use rtnl lock when iterating over ports
    72dbae1f2f21 net: hsr: Add VLAN CTAG filter support
    64a58ae64da5 net: hsr: Add support for MC filtering at the slave device
    94b050726288 can: xilinx_can: xcan_write_frame(): fix use-after-free of transmitted SKB
    deedea599e87 can: j1939: j1939_local_ecu_get(): undo increment when j1939_local_ecu_get() fails
    1e1adfffd3fe can: j1939: j1939_sk_bind(): call j1939_priv_put() immediately when j1939_local_ecu_get() failed
    23431998a377 i40e: fix IRQ freeing in i40e_vsi_request_irq_msix error path
    ff00b2ed7c64 igb: fix link test skipping when interface is admin down
    e450b4966f72 docs: networking: can: change bcm_msg_head frames member to support flexible array
    e6867c0ae100 tunnels: reset the GSO metadata before reusing the skb
    5e84e18f6727 net: bridge: Bounce invalid boolopts
    fe78891f296a net: fec: Fix possible NPD in fec_enet_phy_reset_after_clk_enable()
    092e5703d400 Disable SLUB_TINY for build testing
    8a8f093e621c USB: serial: option: add Telit Cinterion LE910C4-WWX new compositions
    e88b7810b43e USB: serial: option: add Telit Cinterion FN990A w/audio compositions
    bb3498089f86 dt-bindings: serial: brcm,bcm7271-uart: Constrain clocks
    a0da801d3ea0 serial: sc16is7xx: fix bug in flow control levels init
    1e92afef6061 tty: hvc_console: Call hvc_kick in hvc_write unconditionally
    af253b1a5daa Revert "net: usb: asix: ax88772: drop phylink use in PM to avoid MDIO runtime PM wakeups"
    7bd41f9c96dd Input: i8042 - add TUXEDO InfinityBook Pro Gen10 AMD to i8042 quirk table
    27e126072ee0 Input: iqs7222 - avoid enabling unused interrupts
    854baafc00c4 kernfs: Fix UAF in polling when open file is released
    5de7b4141af1 cifs: fix pagecache leak when do writepages
    9f4b38ad41d6 mm/khugepaged: fix the address passed to notifier on testing young
    c95c22402b00 mm/khugepaged: convert hpage_collapse_scan_pmd() to use folios
    394547b9113f btrfs: fix corruption reading compressed range when block size is smaller than page size
    a29f891d4f37 btrfs: use readahead_expand() on compressed extents
    7bb675c9f025 mm/damon/lru_sort: avoid divide-by-zero in damon_lru_sort_apply_parameters()
    9fe0415156fb mm/damon/reclaim: avoid divide-by-zero in damon_reclaim_apply_parameters()
    60d7a3d2b985 mm/damon/sysfs: fix use-after-free in state_show()
    23538cfbeed8 libceph: fix invalid accesses to ceph_connection_v1_info
    b97edd195442 mtd: nand: raw: atmel: Respect tAR, tCLR in read setup timing
    252bc25d7aac mtd: nand: raw: atmel: Fix comment in timings preparation
    cfdde9197ecd drm/amdgpu/vcn4: Fix IB parsing with multiple engine info packages
    9adb902be26b drm/amdgpu/vcn: Allow limiting ctx to instance 0 for AV1 at any time
    b2fbe0f9f80b drm/mediatek: fix potential OF node use-after-free
    6632845292a4 mm/damon/core: set quota->charged_from to jiffies at first charge window
    3d278e89c2ea mm/memory-failure: fix VM_BUG_ON_PAGE(PagePoisoned(page)) when unpoison memory
    8577ded2ee3d fuse: prevent overflow in copy_file_range return value
    01e1eba64860 fuse: check if copy_file_range() returns larger than requested size
    c50336dfcb24 mtd: rawnand: stm32_fmc2: fix ECC overwrite
    06d8ef8f8537 mtd: rawnand: stm32_fmc2: avoid overlapping mappings on ECC buffer
    31dc1603aa43 net: usb: asix: ax88772: drop phylink use in PM to avoid MDIO runtime PM wakeups
    9d55370cc4e2 i2c: i801: Hide Intel Birch Stream SoC TCO WDT
    0709bc11b942 ocfs2: fix recursive semaphore deadlock in fiemap call
    8345a93b9bda mptcp: sockopt: make sync_socket_options propagate SOCK_KEEPOPEN
    e69f61b8c08e compiler-clang.h: define __SANITIZE_*__ macros only when undefined
    deedce87471e Revert "SUNRPC: Don't allow waiting for exiting tasks"
    6f628d7dd8ac EDAC/altera: Delete an inappropriate dma_free_coherent() call
    2089d8a316f4 KVM: SVM: Set synthesized TSA CPUID flags
    2b8a1969cae5 rcu-tasks: Maintain real-time response in rcu_tasks_postscan()
    d89abc4fbee8 rcu-tasks: Eliminate deadlocks involving do_exit() and RCU tasks
    4e86206b6967 rcu-tasks: Maintain lists to eliminate RCU-tasks/do_exit() deadlocks
    8be3d52101b0 proc: fix type confusion in pde_set_flags()
    66bcb04a441f tcp_bpf: Call sk_msg_free() when tcp_bpf_send_verdict() fails to allocate psock->cork.
    449682e76f32 bpf: Tell memcg to use allow_spinning=false path in bpf_timer_init()
    d660c8d8142e s390/cpum_cf: Deny all sampling events by counter PMU
    1262bda871da tracing: Silence warning when chunk allocation fails in trace_pid_write
    69d99a936f00 NFSv4/flexfiles: Fix layout merge mirror check.
    c288e4c39d21 NFSv4.2: Serialise O_DIRECT i/o and copy range
    9f2fdb18d0bf NFSv4.2: Serialise O_DIRECT i/o and clone range
    4089fd70a508 NFSv4.2: Serialise O_DIRECT i/o and fallocate()
    320a0954e2c8 NFS: Serialise O_DIRECT i/o and truncate()
    275d9fd06d96 fs/nfs/io: make nfs_start_io_*() killable
    06c26a679029 ftrace/samples: Fix function size computation
    f7ec68cc74d8 tracing: Fix tracing_marker may trigger page fault during preempt_disable
    781ec30354e6 NFSv4: Clear the NFS_CAP_XATTR flag if not supported by the server
    b39234ede545 NFSv4: Clear the NFS_CAP_FS_LOCATIONS flag if it is not set
    a022c9a46455 NFSv4: Don't clear capabilities that won't be reset
    9339b4e75a81 SUNRPC: call xs_sock_process_cmsg for all cmsg
    fd00ae04c5aa flexfiles/pNFS: fix NULL checks on result of ff_layout_choose_ds_for_read
    0214b96a6a63 ima: limit the number of ToMToU integrity violations
    905d43b8ad24 net: Fix null-ptr-deref by sock_lock_init_class_and_name() and rmmod.
    9da2a9d3ccd8 media: i2c: imx214: Fix link frequency validation
    817a962db3f3 NFSD: nfsd_unlink() clobbers non-zero status returned from fh_fill_pre_attrs()
    913ff520714f nfsd: Fix a regression in nfsd_setattr()
    392260eb8e67 kasan: fix GCC mem-intrinsic prefix with sw tags
    d699575d00ff mm: introduce and use {pgd,p4d}_populate_kernel()
    3f8810b2d22d kunit: kasan_test: disable fortify string checker on kasan_strings() test

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 596b7bc49e..8c9704052e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ddefe7df2a51318c404e7add38ab5e9d6d56eef3"
-SRCREV_meta ?= "8483e6808972d92efd206b41c79f4e7122364d43"
+SRCREV_machine ?= "30885ee3c489e60b779cc24e2fc03a8e6779d935"
+SRCREV_meta ?= "053630c8c982aba6d423a87ddc5bc048d02e1371"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.106"
+LINUX_VERSION ?= "6.6.107"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 2624180bf1..851f55a779 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.106"
+LINUX_VERSION ?= "6.6.107"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "5e027cdb537f4185431ed08d988fbd4eccf4beb3"
-SRCREV_meta ?= "8483e6808972d92efd206b41c79f4e7122364d43"
+SRCREV_machine ?= "aaaee193fafab055dd88cf0d607aae621d2176c4"
+SRCREV_meta ?= "053630c8c982aba6d423a87ddc5bc048d02e1371"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 5614809066..86b21fdcb1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "f922ef6c5d2f40b588b374303b125a556665c427"
-SRCREV_machine:qemuarm64 ?= "f1a3c57fd940c97cdc5454f0b833a48f7e2d49b3"
-SRCREV_machine:qemuloongarch64 ?= "ee1824941e0bfbd888e46be38faea742328372ec"
-SRCREV_machine:qemumips ?= "93f844921cf7bb3df44cf48756bb8872b9a86856"
-SRCREV_machine:qemuppc ?= "19a0163dd3acd0c52a8543d5ac0e3f69264d4c99"
-SRCREV_machine:qemuriscv64 ?= "ee1824941e0bfbd888e46be38faea742328372ec"
-SRCREV_machine:qemuriscv32 ?= "ee1824941e0bfbd888e46be38faea742328372ec"
-SRCREV_machine:qemux86 ?= "ee1824941e0bfbd888e46be38faea742328372ec"
-SRCREV_machine:qemux86-64 ?= "ee1824941e0bfbd888e46be38faea742328372ec"
-SRCREV_machine:qemumips64 ?= "0311ea6c2383b09cbe18b0d3e3cc1dfa2bd91c1d"
-SRCREV_machine ?= "ee1824941e0bfbd888e46be38faea742328372ec"
-SRCREV_meta ?= "8483e6808972d92efd206b41c79f4e7122364d43"
+SRCREV_machine:qemuarm ?= "55ed661faf43ddeb46b59ce680ae34f801f0795b"
+SRCREV_machine:qemuarm64 ?= "33aeb3e8739ce6389b0cf5b4215a1b73d4d5a943"
+SRCREV_machine:qemuloongarch64 ?= "b730d8dc28f20af856a66b9fdfbdc9b00ccd9fb9"
+SRCREV_machine:qemumips ?= "b1a43ff872dddc15f24c1a0e949370f2425826a4"
+SRCREV_machine:qemuppc ?= "8d992b51ac4e4623d5a8dd71bae46fe7018cc552"
+SRCREV_machine:qemuriscv64 ?= "b730d8dc28f20af856a66b9fdfbdc9b00ccd9fb9"
+SRCREV_machine:qemuriscv32 ?= "b730d8dc28f20af856a66b9fdfbdc9b00ccd9fb9"
+SRCREV_machine:qemux86 ?= "b730d8dc28f20af856a66b9fdfbdc9b00ccd9fb9"
+SRCREV_machine:qemux86-64 ?= "b730d8dc28f20af856a66b9fdfbdc9b00ccd9fb9"
+SRCREV_machine:qemumips64 ?= "01e9998c89f60f5bf5e6ffbb7708cd2f39c495c3"
+SRCREV_machine ?= "b730d8dc28f20af856a66b9fdfbdc9b00ccd9fb9"
+SRCREV_meta ?= "053630c8c982aba6d423a87ddc5bc048d02e1371"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "60a9e718726fa7019ae00916e4b1c52498da5b60"
+SRCREV_machine:class-devupstream ?= "af1544b5d072514b219695b0a9fba0b1e0d5e289"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.106"
+LINUX_VERSION ?= "6.6.107"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


