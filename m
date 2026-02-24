Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D62F0F357C5
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:33:01 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21462.1771943577255852189
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:32:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ocGUEgRf;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48370174e18so30483275e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943575; x=1772548375; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RZQMV4S7BaxmS4XpDn4ZtXPK4InW7Peew4c1PqkC0/M=;
        b=ocGUEgRfVIovDvtxBxlZWwYKkhWNEGQAvUSIz9NxM5T4q52yl10ieIFotyYvywAHQ3
         RdgBtAAbvxoUwgIRXPF4UmMMgSIqGEBB11LZSBWF+jtHywAYlVpDf0Qssu+CP/9QZIa9
         msmsx4oq4FO7dUpZpYhakC5lkeL/qGcco8xxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943575; x=1772548375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RZQMV4S7BaxmS4XpDn4ZtXPK4InW7Peew4c1PqkC0/M=;
        b=chfuDiiLIL7HYoeE9hZl/EgyQuQ2Fb/EaSboNnMnhJOPSzhNqVRvKuYsewJ2vPbjNj
         +1XmkC+Ha6AuVk4Aoxfq7HY+v7czo26ItqKNpPtGSNcN7q7TF/qSh0BAGiRWzLNsk27Z
         bp68xzenxFR46B45yKTslbQ2aoQS8pW7RA0dleKHhXK8abVJ5pTbAEayPGl9tax+Sixs
         zxx2To7CSQfXuTg2c0JBO/KD8/eKYKc97XieQc8pq0JuVrcHDVqhBhxXdJfq5KAN/aY5
         1rzPRiGZyD8m5hV7gY2M2LvXf2z/VPA9SzAT/qkMzIFMy1yn+CDkY63yIFkZ5Pt3SJdv
         iH+w==
X-Gm-Message-State: AOJu0YxbzeuFCecGPSOXn/wnrG1IYjxizGzbIUrv9njcC9DwyVy43eWa
	K+DBSD7XPtI7idHTOF9wu5b9Q0Hy42WpRZrOIElT2b/gfjkrqeP1ufhl6ktRIsFo6aMc4nYEvAd
	JLgLM
X-Gm-Gg: AZuq6aL9yb6tkkf+EG/E2WdVa62BAOR743tImqiDvYSrTqDTmEGmt7GPJrdLCZpuhg4
	MfA7Ay13iKtDV/NlMazBVHRjcZ6ojl6VJM2c7stOxLrFno14JyLSdkZMGgUfVtmF6C6RhbATaEI
	SKuhxvoazqoBkiZpL/vbtoFefYqpB5ZszPgUzEtb5bolD08zkeGGEtLfjbnBzzY/+/UC+PyoUfJ
	iuhbOsIVhoiHG+4nvhT6TCf15tE0kRy+FsdQBOJU+XBajjcvmd8shI3OfhQ8n9qDLGt4gUnajN7
	6rv0GTFwZXN9m3jjEeGGyP6mE0DLViLhzuwROqB8a3KWqMXy6y8TB35Jy2Io+VJsZaPWTPzm1Ms
	UBwXnd0PHOIUluwWK2Pt1TvNi5MccXEBj6mNLj+EJgqGc57q0SY+oiiN1K9voSe8xZGKv3dhq8k
	zWvv8qfb4cYvH+O53OXUUsZswFyWy2JnMxmh/mnFUyaRQvKn1w2d6qrzuyAYm2oZcn7n+TfSjyD
	bU0HzkG/GJ99WUHdB/jth5Wkw5LwEY7Kg==
X-Received: by 2002:a05:600c:6296:b0:47a:81b7:9a20 with SMTP id 5b1f17b1804b1-483a95c6774mr221688945e9.9.1771943575046;
        Tue, 24 Feb 2026 06:32:55 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.32.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:32:54 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/44] linux-yocto/6.6: update to v6.6.116
Date: Tue, 24 Feb 2026 15:31:41 +0100
Message-ID: <15ea8cb001324830f5a89740e0ac2342e97031f4.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:33:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231818

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    0a805b6ea8cda Linux 6.6.116
    63dde0eec59b4 gpio: idio-16: Define fixed direction of the GPIO lines
    92a15817f0fbd gpio: regmap: add the .fixed_direction_output configuration parameter
    38f50558b50cf gpio: regmap: Allow to allocate regmap-irq device
    ddd31f5a5ff39 bits: introduce fixed-type GENMASK_U*()
    739aa67ef147b bits: add comments and newlines to #if, #else and #endif directives
    0e660d8224d07 xhci: dbc: fix bogus 1024 byte prefix if ttyDBC read races with stall event
    3aa367e6aae7a xhci: dbc: Avoid event polling busyloop if pending rx transfers are inactive.
    dae8555062cf0 xhci: dbc: Improve performance by removing delay in transfer event polling.
    6f126ef0117c9 xhci: dbc: Allow users to modify DbC poll interval via sysfs
    1c5cec6625a3f xhci: dbc: poll at different rate depending on data transfer activity
    afdf4f5108513 serial: sc16is7xx: remove useless enable of enhanced features
    74c8eafd42b48 serial: sc16is7xx: refactor EFR lock
    7db1a5451bcb9 serial: sc16is7xx: reorder code to remove prototype declarations
    2f7592e0bdfc6 serial: sc16is7xx: remove unused to_sc16is7xx_port macro
    39a7305e2abad selftests: mptcp: join: mark 'delete re-add signal' as skipped if not supported
    f87c246d7c1ef selftests: mptcp: disable add_addr retrans in endpoint_tests
    1f1632dd97dae mptcp: pm: in-kernel: C-flag: handle late ADD_ADDR
    4784326cb26a4 arch: Add the macro COMPILE_OFFSETS to all the asm-offsets.c
    797f15c2b15e9 btrfs: use smp_mb__after_atomic() when forcing COW in create_pending_snapshot()
    93bcd360c503e btrfs: use level argument in log tree walk callback replay_one_buffer()
    ef64d81fb7ddd btrfs: always drop log root tree reference in btrfs_replay_log()
    3b838f39f4be8 btrfs: scrub: replace max_t()/min_t() with clamp() in scrub_throttle_dev_io()
    fb6ceb6cde7bc btrfs: zoned: refine extent allocator hint selection
    8fabf4d56fd8f btrfs: zoned: return error from btrfs_zone_finish_endio()
    625aecafb1bd2 EDAC/mc_sysfs: Increase legacy channel support to 16
    0956cdef60de8 x86/bugs: Fix reporting of LFENCE retpoline
    077823b06f1cc x86/bugs: Report correct retbleed mitigation status
    5c63fb0b382f9 perf: Skip user unwind if the task is a kernel thread
    89fbfc799e1d5 perf: Have get_perf_callchain() return NULL if crosstask and user are set
    34b5aba8511a1 perf: Use current->flags & PF_KTHREAD|PF_USER_WORKER instead of current->mm == NULL
    a61ed1fb165b0 audit: record fanotify event regardless of presence of rules
    6ffa9d6618718 net/sched: sch_qfq: Fix null-deref in agg_dequeue
    e5bbb12db2c75 Linux 6.6.115
    2dc125f5da134 ksmbd: transport_ipc: validate payload size before reading handle
    2ae71c3770c39 gpio: ljca: Initialize num before accessing item in ljca_gpio_config
    bfd17b6138df0 fuse: fix livelock in synchronous file put from fuseblk workers
    c7ec75f3cbf73 fuse: allocate ff->release_args only if release is needed
    c34b09cbd6fc0 s390/cio: Update purge function to unregister the unused subchannels
    41fe20cfbcd43 x86/resctrl: Fix miscount of bandwidth event when reactivating previously unavailable RMID
    bc1c6b803e14e fs/notify: call exportfs_encode_fid with s_umount
    df75bfc287029 xfs: always warn about deprecated mount options
    b89e20a365442 devcoredump: Fix circular locking dependency with devcd->mutex.
    7c691e10ca958 serial: 8250_mtk: Enable baud clock and manage in runtime PM
    a8527907f28d7 serial: 8250_exar: add support for Advantech 2 port card with Device ID 0x0018
    f354f7510ff0e serial: 8250_dw: handle reset control deassert error
    928a9c9b97ea2 dt-bindings: usb: dwc3-imx8mp: dma-range is required only for imx8mp
    91b2d5fcde526 tcpm: switch check for role_sw device with fw_node
    6fb8fbc0aa542 most: usb: hdm_probe: Fix calling put_device() before device initialization
    72427dc6f8752 most: usb: Fix use-after-free in hdm_disconnect
    9a297a68c3ba4 misc: fastrpc: Fix dma_buf object leak in fastrpc_map_lookup
    a068cbe71c1cb mei: me: add wildcat lake P DID
    d4854eff25efb comedi: fix divide-by-zero in comedi_buf_munge()
    c055480e04561 binder: remove "invalid inc weak" check
    3a25640814ff8 x86/microcode: Fix Entrysign revision check for Zen1/Naples
    03d7e8c749428 xhci: dbc: enable back DbC in resume if it was enabled before suspend
    2c217d0e86885 usb: raw-gadget: do not limit transfer length
    cbf278c90c64a usb/core/quirks: Add Huawei ME906S to wakeup quirk
    102b9b8942e11 USB: serial: option: add Telit FN920C04 ECM compositions
    da06de8f1656f USB: serial: option: add Quectel RG255C
    7070c31465f1c USB: serial: option: add UNISOC UIS7720
    6d63703bec0c1 sched: Remove never used code in mm_cid_get()
    770b33a1a8e46 io_uring: correct __must_hold annotation in io_install_fixed_file
    5ba12858b664f gpio: ljca: Fix duplicated IRQ mapping
    7efa69e0688b5 gpio: update Intel LJCA USB GPIO driver
    d11f2156a93e3 hwmon: (sht3x) Fix error handling
    dc1ac7c1a355b RISC-V: Don't print details of CPUs disabled in DT
    00b58d2c25d10 RISC-V: Define pgprot_dmacoherent() for non-coherent devices
    c7849e8cb22a9 firmware: arm_scmi: Fix premature SCMI_XFER_FLAG_IS_RAW clearing in raw mode
    d719ce9f286c4 firmware: arm_scmi: Account for failed debug initialization
    e42ec4eccebe2 spi: spi-nxp-fspi: add extra delay after dll locked
    18d1c06b72d56 selftests: mptcp: join: mark implicit tests as skipped if not supported
    c8aa3fd5b4a03 selftests: mptcp: join: mark 'flush re-add' as skipped if not supported
    5e46e4dc829e1 net: ravb: Ensure memory write completes before ringing TX doorbell
    d064092c3fc34 net: ravb: Enforce descriptor type ordering
    36838ece81545 net: usb: rtl8150: Fix frame padding
    9f2db04c21cff net: stmmac: dwmac-rk: Fix disabling set_clock_selection
    42ed0784d11ad vsock: fix lock inversion in vsock_assign_transport()
    aa6a21409dd62 ocfs2: clear extent cache after moving/defragmenting extents
    c7ae6b99c982d MIPS: Malta: Fix keyboard resource preventing i8042 driver from registering
    fa41d6f4b1382 cifs: Fix TCP_Server_Info::credits to be signed
    356c7fdf684cd can: netlink: can_changelink(): allow disabling of automatic restart
    a9da00c9cee99 ACPICA: Work around bogus -Wstringop-overread warning since GCC 11
    29d96bcc14952 Revert "cpuidle: menu: Avoid discarding useful information"
    a0c16f20d23cf gpio: 104-idio-16: Define maximum valid register address offset
    67adc5500ad7c gpio: pci-idio-16: Define maximum valid register address offset
    3373f263bb647 arch_topology: Fix incorrect error check in topology_parse_cpu_capacity()
    941096f618c50 dma-debug: don't report false positives with DMA_BOUNCE_UNALIGNED_KMALLOC
    15b80f63269d3 net: bonding: fix possible peer notify event loss or dup issue
    cb9055ba30306 sctp: avoid NULL dereference when chunk data buffer is missing
    4f32f754343a8 arm64, mm: avoid always making PTE dirty in pte_mkwrite()
    8b051d7f530e8 net/mlx5e: RX, Fix generating skb from non-linear xdp_buff for striding RQ
    72328f25755ee net/mlx5e: RX, Fix generating skb from non-linear xdp_buff for legacy RQ
    9d7bc56c550eb net/mlx5e: Reuse per-RQ XDP buffer to avoid stack zeroing overhead
    b411759b9c1a9 selftests: net: fix server bind failure in sctp_vrf.sh
    bbcbbb9d68626 selftests/net: convert sctp_vrf.sh to run it in unique namespace
    dd2a7aba7f8d8 can: bxcan: bxcan_start_xmit(): use can_dev_dropped_skb() instead of can_dropped_invalid_skb()
    05e2c6ef4a9da dpaa2-eth: fix the pointer passed to PTR_ALIGN on Tx path
    050732ace1dbd net: enetc: correct the value of ENETC_RXB_TRUESIZE
    2781ca82ce8ca net: enetc: fix the deadlock of enetc_mdio_lock
    74c94df40ede9 net: Tree wide: Replace xdp_do_flush_map() with xdp_do_flush().
    6993a51388bdc rtnetlink: Allow deleting FDB entries in user namespace
    362f4c52efd05 net/mlx5e: Return 1 instead of 0 in invalid case in mlx5e_mpwrq_umr_entry_size()
    550e311e1b16f Unbreak 'make tools/*' for user-space targets
    6aef39551e60a smb: server: let smb_direct_flush_send_list() invalidate a remote key first
    6ef6ac49fdf1d drivers/perf: hisi: Relax the event ID check in the framework
    99bdd0580d7f2 powerpc/32: Remove PAGE_KERNEL_TEXT to fix startup failure
    6aee82d0bfeee m68k: bitops: Fix find_*_bit() signatures
    5f43ab41ddab1 lkdtm: fortify: Fix potential NULL dereference on kmalloc failure
    24cac083a76b9 hfsplus: return EIO when type of hidden directory mismatch in hfsplus_fill_super()
    cfafefcb0e1fc hfs: fix KMSAN uninit-value issue in hfs_find_set_zero_bits()
    8c18c84ecbfa3 dlm: check for defined force value in dlm_lockspace_release
    2bb8bc99b1a7a hfsplus: fix KMSAN uninit-value issue in hfsplus_delete_cat()
    4f40a2b3969da hfs: validate record offset in hfsplus_bmap_alloc
    a5bfb13b4f406 hfsplus: fix KMSAN uninit-value issue in __hfsplus_ext_cache_extent()
    714e70f603bee hfs: make proper initalization of struct hfs_find_data
    7870fbdce00ef hfs: clear offset and space out of valid records in b-tree node
    b1ec9faef7e36 nios2: ensure that memblock.current_limit is set when setting pfn limits
    813d3d18cfe47 exec: Fix incorrect type for ret

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 07e8de39887..55ab56e2887 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "546594fb2b71368579abbe46685b5b998ed67203"
-SRCREV_meta ?= "e5fb502182a6a12aff7bf98c4395ce4286f5d995"
+SRCREV_machine ?= "a40e6c13f556fd1b07f6a9e21137b47964d897af"
+SRCREV_meta ?= "9f0c7a1604548bd736f348d3fae281f2d726d6a8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.114"
+LINUX_VERSION ?= "6.6.116"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 48919e38537..1456d964114 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.114"
+LINUX_VERSION ?= "6.6.116"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "eee9d9792cc377b1e2818beb1a8db7851ce67ede"
-SRCREV_meta ?= "e5fb502182a6a12aff7bf98c4395ce4286f5d995"
+SRCREV_machine ?= "daacc64fc40b3e47e2d4164ceb1b51a05af73844"
+SRCREV_meta ?= "9f0c7a1604548bd736f348d3fae281f2d726d6a8"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index c15edb3fd08..be92663eb1b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "a4b8e87e13f9d7756b84d17c4b2a35afec9f972c"
-SRCREV_machine:qemuarm64 ?= "1e4d2d3e208273fe270b6b0686a901d5913c3942"
-SRCREV_machine:qemuloongarch64 ?= "0913b7f4e606a1c2adaf202e654a20f66dd6c5d0"
-SRCREV_machine:qemumips ?= "b6f40464a993b4c8d974cf38792c030ccbfe4ead"
-SRCREV_machine:qemuppc ?= "ff43ddf51676e66fb1df65e4d23a3b8d32210677"
-SRCREV_machine:qemuriscv64 ?= "0913b7f4e606a1c2adaf202e654a20f66dd6c5d0"
-SRCREV_machine:qemuriscv32 ?= "0913b7f4e606a1c2adaf202e654a20f66dd6c5d0"
-SRCREV_machine:qemux86 ?= "0913b7f4e606a1c2adaf202e654a20f66dd6c5d0"
-SRCREV_machine:qemux86-64 ?= "0913b7f4e606a1c2adaf202e654a20f66dd6c5d0"
-SRCREV_machine:qemumips64 ?= "3d0a848a03fb800c937eb14669b8f51d8fe70998"
-SRCREV_machine ?= "0913b7f4e606a1c2adaf202e654a20f66dd6c5d0"
-SRCREV_meta ?= "e5fb502182a6a12aff7bf98c4395ce4286f5d995"
+SRCREV_machine:qemuarm ?= "ca0cf34ac378d033a31bd92282d92d3e6f1f6c5a"
+SRCREV_machine:qemuarm64 ?= "698c863fb39998ee9f2f590ff9626ca34cf3a9d1"
+SRCREV_machine:qemuloongarch64 ?= "f9b3617edd37432584510131383ee97a6eb889b5"
+SRCREV_machine:qemumips ?= "fbdfcd56de6c092d0c62e0529231bb41663a7e02"
+SRCREV_machine:qemuppc ?= "7560c9897677e1722452733c7b34e651bcaee399"
+SRCREV_machine:qemuriscv64 ?= "f9b3617edd37432584510131383ee97a6eb889b5"
+SRCREV_machine:qemuriscv32 ?= "f9b3617edd37432584510131383ee97a6eb889b5"
+SRCREV_machine:qemux86 ?= "f9b3617edd37432584510131383ee97a6eb889b5"
+SRCREV_machine:qemux86-64 ?= "f9b3617edd37432584510131383ee97a6eb889b5"
+SRCREV_machine:qemumips64 ?= "5f40729e5eb8c999e2d6f7dc592c2869a36f0169"
+SRCREV_machine ?= "f9b3617edd37432584510131383ee97a6eb889b5"
+SRCREV_meta ?= "9f0c7a1604548bd736f348d3fae281f2d726d6a8"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "4a243110dc884d8e1fe69eecbc2daef10d8e75d7"
+SRCREV_machine:class-devupstream ?= "0a805b6ea8cda0caa268b396a2e5117f3772d849"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.114"
+LINUX_VERSION ?= "6.6.116"
 
 PV = "${LINUX_VERSION}+git"
 

