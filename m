Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38096C5B552
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 19:41:31 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.4393.1748461287220812901
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 12:41:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VyP4+RJw;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-476ab588f32so1714041cf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 12:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748461286; x=1749066086; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7YhsNvQSzHxfb1TwJ8duE1DYSmpzoITMfJAgptjPlc=;
        b=VyP4+RJwPFan7rSuJNmEjl3zKMF1srMagnTRCpWuYJuujJR0Ie153cbMguLGXxunOP
         n30Cr9l1NeRnSSAhbl8/s7WLakn+woS8fSt+0rthZ19dTYtA5Ns06GLYfAePnBnDB0/o
         y+Pkc5CAopKOMsMxjjy0wAsEETlnFBD6sC5hN9/8DR5Pb9h5KETKSCBrKl46CE4vX+k3
         uwOPl5lY65t6DM8+t7sKsqW2wo9lSDVABemTY6V4Z9I1kZT6sKQEgcDn8/4yIVapI8Vr
         Qezl/NFaeigcpqg/erIo1W+bipYQDwvwRyJ15b0HSO7BEoQhye0LHrOP2ZjQw+Qzf/q1
         2uRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748461286; x=1749066086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k7YhsNvQSzHxfb1TwJ8duE1DYSmpzoITMfJAgptjPlc=;
        b=nIrRKMHyPPtPrwB3rQStPeC/OKqt5H3ACwT5LrfUtaupDf83DglJ57YEFsb+RX3hyA
         HCTS8Dva0eHepc/FP2wUkcouookFkAhSaRytxtrm7Zdv/UFCluYa7XFqcCi2TQdC463L
         GFQGaL2Mx1FSq3bIIr7wWeHAr1ZsomMiGpke2qZxFGmzFYnh65sUIbpj7VxsSs3pyhta
         XZiehlWiPv+jgg8THh8MO8/Tk+6LwkZuRtzDuphMCM7oMxupItn9G7T1PDr/e0adPvhr
         mr5Z5xQuYgqvKV6PmRX8xrYwjhWzxmLr9SyE9bDEHKD5VATrkc8sd+truUzmAjTaYEtD
         cTww==
X-Gm-Message-State: AOJu0YyVI4TeGLFrzvAXffjcacItOtXNq0mndfYzqHj4Mo41Wy8XnjzE
	dNDfjeveeKZqiyGhaXzO6Wne0dRZkR3q7nJVb2uF7bEwEZufC40sYts/T8QITG6r
X-Gm-Gg: ASbGncv04J1YX6L0j+BNTjVXhBKb2fuQxsK/V7rrbHDd4PKWMX5fMa8R2h3dhsfseei
	lhB3WFAqZe5KJxY6xNyUFQ/0p4cdFKSrkhICWBjxjH/WqCo7ZLZYXSaOmou5EA5GAiOyAkGZiQi
	6ZbOwuN5YX6wGmizr3A4SBuEVYDUUobiJWm2OKfS40nLg/rmSsBuUUKKj2fuoTCcoERjt4qV2PB
	WZSLskXPX9kmFNQL6NwTK6i1Y4T0ZeniZkJrjhuI6KiLmafoSJ2iQSHSHAKkNDgX1UigXbeIYdU
	1H2UHjmrVeVxlEvnN0U0MqVkQgZuUog9q3nyXqZPDetIh9h0ToSI09ASSTa7yD8OF1OHs1KZvTO
	SQ0itCulcrtkzKnS/7IFJkRnroLspjFLCINy3PLHOuC639jqsCRgE
X-Google-Smtp-Source: AGHT+IGEr3cBAGkGtPLX5WcDWDaBjVBLhsqetr7DTOEDMNmQ2P2IB/46LlbGMMr9iryTasnwiL0DZg==
X-Received: by 2002:ac8:6908:0:b0:494:7bdb:790b with SMTP id d75a77b69052e-49f4781e800mr293737721cf.32.1748461286072;
        Wed, 28 May 2025 12:41:26 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a3c80f323bsm9577691cf.72.2025.05.28.12.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:41:25 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 6/6] linux-yocto/6.6: update to v6.6.92
Date: Wed, 28 May 2025 15:41:18 -0400
Message-Id: <20250528194118.1534655-6-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250528194118.1534655-1-bruce.ashfield@gmail.com>
References: <20250528194118.1534655-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 19:41:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217393

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    ffaf6178137b9 Linux 6.6.92
    35559ebcdc899 drm/amdgpu: fix pm notifier handling
    c1d42a239be5c phy: tegra: xusb: remove a stray unlock
    3cfec712a439c btrfs: don't BUG_ON() when 0 reference count at btrfs_lookup_extent_info()
    b3598f53211ba sctp: add mutual exclusion in proc_sctp_do_udp_port()
    93df6da64b004 hwpoison, memory_hotplug: lock folio before unmap hwpoisoned folio
    7bcd29181bab8 memblock: Accept allocated memory before use in memblock_double_array()
    6133444518b7a LoongArch: Explicitly specify code model in Makefile
    f521c2a0c0c45 bpf, arm64: Fix address emission with tag-based KASAN enabled
    d9664e6ff0407 bpf, arm64: Fix trampoline for BPF_TRAMP_F_CALL_ORIG
    bfc26aa3ab4cc mm/migrate: correct nr_failed in migrate_pages_sync()
    62798e3291f55 selftests/mm: compaction_test: support platform with huge mount of memory
    962ce9028ca6e usb: typec: ucsi: displayport: Fix deadlock
    a0a736d9857ca Bluetooth: btnxpuart: Fix kernel panic during FW release
    98fdd2f612e94 mm/page_alloc: fix race condition in unaccepted memory handling
    e24073cd8f169 x86/its: Fix build error for its_static_thunk()
    d530dd65f6f3c dmaengine: idxd: Refactor remove call with idxd_cleanup() helper
    a6cce316327c1 dmaengine: idxd: fix memory leak in error handling path of idxd_pci_probe
    6e94a2c3e4c16 dmaengine: idxd: fix memory leak in error handling path of idxd_alloc
    d2d05fd0fc95c dmaengine: idxd: Add missing idxd cleanup to fix memory leak in remove call
    32ec46adf1a62 dmaengine: idxd: Add missing cleanups in cleanup internals
    404aad9b0c6ff dmaengine: idxd: Add missing cleanup for early error out in idxd_setup_internals
    6ab9526e32ac7 dmaengine: idxd: fix memory leak in error handling path of idxd_setup_groups
    9ba964b17fca8 dmaengine: idxd: fix memory leak in error handling path of idxd_setup_engines
    47846211998a9 dmaengine: idxd: fix memory leak in error handling path of idxd_setup_wqs
    1c9e4ed011171 dmaengine: ti: k3-udma: Use cap_mask directly from dma_device structure instead of a local copy
    d87f1cddc5923 dmaengine: ti: k3-udma: Add missing locking
    5340d0e84d5c7 net: qede: Initialize qede_ll_ops with designated initializer
    5e700b06b970f wifi: mt76: disable napi on driver removal
    55018ca1cc7ad spi: tegra114: Use value to check for invalid delays
    d8843fb1a253e smb: client: fix memory leak during error handling for POSIX mkdir
    c682a193447a0 scsi: sd_zbc: block: Respect bio vector limits for REPORT ZONES buffer
    a1546ec7e0498 phy: renesas: rcar-gen3-usb2: Set timing registers only once
    99fc6f1c371e8 phy: renesas: rcar-gen3-usb2: Fix role detection on unbind/bind
    2b169aa46f970 phy: Fix error handling in tegra_xusb_port_init
    ba25131b3c1ce phy: tegra: xusb: Use a bitmask for UTMI pad power state tracking
    b1627af84e1ea tracing: samples: Initialize trace_array_printk() with the correct function
    9d1216bf49103 ftrace: Fix preemption accounting for stacktrace filter command
    fa75d941b104e ftrace: Fix preemption accounting for stacktrace trigger command
    6d2d375205455 Drivers: hv: vmbus: Remove vmbus_sendpacket_pagebuffer()
    c0f3f0c88f166 Drivers: hv: Allow vmbus_sendpacket_mpb_desc() to create multiple ranges
    115c7890476eb hv_netvsc: Remove rmsg_pgcnt
    307963a3abf81 hv_netvsc: Preserve contiguous PFN grouping in the page buffer array
    da5d5bc3ad3d3 hv_netvsc: Use vmbus_sendpacket_mpb_desc() to send VMBus messages
    c9d2b9a80d06a dma-buf: insert memory barrier before updating num_fences
    fc8fa09d40de2 ALSA: usb-audio: Add sample rate quirk for Microdia JP001 USB Camera
    46b33b97252d0 ALSA: usb-audio: Add sample rate quirk for Audioengine D1
    2759938c4a37e ALSA: es1968: Add error handling for snd_pcm_hw_constraint_pow2()
    124522cc6b61e ACPI: PPTT: Fix processor subtable walk
    6456c818dc531 drm/amd/display: Avoid flooding unnecessary info messages
    43b35d404f6d6 drm/amd/display: Correct the reply value when AUX write incomplete
    34439d470ba07 LoongArch: uprobes: Remove redundant code about resume_era
    840663825ef6a LoongArch: uprobes: Remove user_{en,dis}able_single_step()
    ad1e441016e0d LoongArch: Fix MAX_REG_OFFSET calculation
    e89bd983f3cdd LoongArch: Save and restore CSR.CNTC for hibernation
    f4c0a7999fb59 LoongArch: Prevent cond_resched() occurring within kernel-fpu
    7722fba9f3bf0 udf: Make sure i_lenExtents is uptodate on inode eviction
    a0302cb139185 dmaengine: Revert "dmaengine: dmatest: Fix dmatest waiting less when interrupted"
    e1b755c0d876f NFSv4/pnfs: Reset the layout state after a layoutreturn
    c1dd9ccc0f0cd tsnep: fix timestamping with a stacked DSA driver
    0980e62ab8221 tsnep: Inline small fragments within TX descriptor
    406d05da26835 net/tls: fix kernel panic when alloc_page failed
    f1ecccb5cdda3 mlxsw: spectrum_router: Fix use-after-free when deleting GRE net devices
    fde33ab3c052a wifi: mac80211: Set n_channels after allocating struct cfg80211_scan_request
    72ee7af615709 octeontx2-af: Fix CGX Receive counters
    398989c7800ea net: ethernet: mtk_eth_soc: fix typo for declaration MT7988 ESW capability
    03c42d35c329b octeontx2-pf: macsec: Fix incorrect max transmit size in TX secy
    7bddac8603d4e regulator: max20086: fix invalid memory access
    9c2d0899c680c qlcnic: fix memory leak in qlcnic_sriov_channel_cfg_cmd()
    b48a47e137ced net/mlx5e: Disable MACsec offload for uplink representor profile
    4a7d4031fab55 ALSA: sh: SND_AICA should depend on SH_DMA_API
    c70c021be0253 nvme-pci: acquire cq_poll_lock in nvme_poll_irqdisable
    64638f3103d0c nvme-pci: make nvme_pci_npages_prp() __always_inline
    cbe3f0445181f net: dsa: sja1105: discard incoming frames in BR_STATE_LISTENING
    1d60c0781c1bb net: cadence: macb: Fix a possible deadlock in macb_halt_tx.
    4e132f56bc64a ALSA: ump: Fix a typo of snd_ump_stream_msg_device_info
    8a8dc7fd1e3b0 ALSA: seq: Fix delivery of UMP events to group ports
    e4d8a517324c7 net: mctp: Ensure keys maintain only one ref to corresponding dev
    acab78ae12c7f net: mctp: Don't access ifa_index when missing
    2d45eeb7d5d70 mctp: no longer rely on net->dev_index_head[]
    7777ca11a40bb tools/net/ynl: ethtool: fix crash when Hardware Clock info is missing
    95a9e08ea5bbd tools: ynl: ethtool.py: Output timestamping statistics from tsinfo-get operation
    a7d6e0ac0a886 net_sched: Flush gso_skb list too during ->change()
    31492b8386e5a Bluetooth: MGMT: Fix MGMT_OP_ADD_DEVICE invalid device flags
    b8084e8135af7 spi: loopback-test: Do not split 1024-byte hexdumps
    a6879a076b98c nfs: handle failure of nfs_get_lock_context in unlock path
    ad6caaf29bc26 HID: uclogic: Add NULL check in uclogic_input_configured()
    4715f16b1e43c HID: thrustmaster: fix memory leak in thrustmaster_interrupts()
    ee4c5a2a38596 RDMA/rxe: Fix slab-use-after-free Read in rxe_queue_cleanup bug
    99173e6f28e4e iio: chemical: sps30: use aligned_s64 for timestamp
    02023c2899031 iio: adc: ad7768-1: Fix insufficient alignment of timestamp.
    41ade94ad4432 Revert "drm/amd: Stop evicting resources on APUs in suspend"
    c1a4d21a15474 drm/amd: Add Suspend/Hibernate notification callback support
    d59f45595102f drm/amdgpu: trigger flr_work if reading pf2vf data failed
    9a6d2e19448e0 drm/amdgpu: Fix the runtime resume failure issue
    95db39dbaa8cc drm/amd: Stop evicting resources on APUs in suspend
    220192d5141af iio: adc: ad7266: Fix potential timestamp alignment issue.
    ec24e62a1dd35 KVM: SVM: Forcibly leave SMM mode on SHUTDOWN interception
    635b3cc639b80 KVM: SVM: Update SEV-ES shutdown intercepts with more metadata
    2402a3ef9e8c4 firmware: arm_scmi: Fix timeout checks on polling path
    b388129425568 firmware: arm_scmi: Track basic SCMI communication debug metrics
    0b175f7c4fe9d firmware: arm_scmi: Add support for debug metrics at the interface
    844b899f78999 firmware: arm_scmi: Add message dump traces for bad and unexpected replies
    6bddbdbeb748c firmware: arm_scmi: Add helper to trace bad messages
    7ea1913daafc9 tpm: tis: Double the timeout B to 4s
    70417bada46dc tracing: probes: Fix a possible race in trace_probe_log APIs
    4e63b6907d07a cgroup/cpuset: Extend kthread_is_per_cpu() check to all PF_NO_SETAFFINITY tasks
    44a4c0dba8c33 platform/x86: asus-wmi: Fix wlan_ctrl_by_user detection
    6b92eee6b96d5 platform/x86/amd/pmc: Declare quirk_spurious_8042 for MECHREVO Wujie 14XA (GX4HRXL)
    bfe0dd3b7329c binfmt_elf: Move brk for static PIE even if ASLR disabled
    622b7267d7875 binfmt_elf: Honor PT_LOAD alignment for static PIE
    d9c1758756102 binfmt_elf: Calculate total_size earlier
    d3642f29f549a selftests/exec: Build both static and non-static load_address tests
    7435fa1c530d0 binfmt_elf: Leave a gap between .bss and brk
    0d6a2bada5d9c selftests/exec: load_address: conform test to TAP format output
    fe7eb1f32a85a binfmt_elf: elf_bss no longer used by load_elf_binary()
    c6df4c71ae1c7 binfmt_elf: Support segments with 0 filesz and misaligned starts
    11689bb0f7a63 fs/xattr.c: fix simple_xattr_list to always include security.* xattrs

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 1cc29e632a..d855ee3f8a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "d1fbd2d6727d1036c200e4b1aa0190aaf735b3de"
-SRCREV_meta ?= "f39840f2f44ad614ddf59c402b464a0ce7e04532"
+SRCREV_machine ?= "1933814ca46d38977965bbfe58ee3a1f8aacfb36"
+SRCREV_meta ?= "8e66f449e449f9ae2809b6c395ed7089aa37d7a3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.91"
+LINUX_VERSION ?= "6.6.92"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 7db20c0959..382a74f648 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.91"
+LINUX_VERSION ?= "6.6.92"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "d00f12b1b1a9fb6dc55c27c78c8c131e4a1cbdae"
-SRCREV_meta ?= "f39840f2f44ad614ddf59c402b464a0ce7e04532"
+SRCREV_machine ?= "c72b190dc393b310be436153c864144694b184a6"
+SRCREV_meta ?= "8e66f449e449f9ae2809b6c395ed7089aa37d7a3"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 75b41a5317..c1bb736e04 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "9c31285259d92c008165481f4120aded6e10c93a"
-SRCREV_machine:qemuarm64 ?= "c57114d59935f0a976f2ff18b1c7dbd5c24710b6"
-SRCREV_machine:qemuloongarch64 ?= "23977e07766767fc6144b53967998afa04fe9b96"
-SRCREV_machine:qemumips ?= "e27992a5fd0ac7678b59cec9219351fd8f16e3e5"
-SRCREV_machine:qemuppc ?= "5fde391143db93ac37953d90962beba1a4af31d1"
-SRCREV_machine:qemuriscv64 ?= "23977e07766767fc6144b53967998afa04fe9b96"
-SRCREV_machine:qemuriscv32 ?= "23977e07766767fc6144b53967998afa04fe9b96"
-SRCREV_machine:qemux86 ?= "23977e07766767fc6144b53967998afa04fe9b96"
-SRCREV_machine:qemux86-64 ?= "23977e07766767fc6144b53967998afa04fe9b96"
-SRCREV_machine:qemumips64 ?= "dd954fc36eb77f8aab6395ad7ff1341c3712aada"
-SRCREV_machine ?= "23977e07766767fc6144b53967998afa04fe9b96"
-SRCREV_meta ?= "f39840f2f44ad614ddf59c402b464a0ce7e04532"
+SRCREV_machine:qemuarm ?= "1d95b0a9486ae02a4eb38df55b94cb64485bd4c0"
+SRCREV_machine:qemuarm64 ?= "8cd580eb06e43c9a4e9c26e1dd954a334f656fbd"
+SRCREV_machine:qemuloongarch64 ?= "6032c9c1ac18edd7c8eadd6f9f655556b5f5e77c"
+SRCREV_machine:qemumips ?= "a3bbede9b1c6dbd0b51132b8447adbbde1f46f85"
+SRCREV_machine:qemuppc ?= "a5bba7e08dbb26c0dc7d7ec0624e903b7c6bac94"
+SRCREV_machine:qemuriscv64 ?= "6032c9c1ac18edd7c8eadd6f9f655556b5f5e77c"
+SRCREV_machine:qemuriscv32 ?= "6032c9c1ac18edd7c8eadd6f9f655556b5f5e77c"
+SRCREV_machine:qemux86 ?= "6032c9c1ac18edd7c8eadd6f9f655556b5f5e77c"
+SRCREV_machine:qemux86-64 ?= "6032c9c1ac18edd7c8eadd6f9f655556b5f5e77c"
+SRCREV_machine:qemumips64 ?= "a1ed8408c3b0bc729270cc2bd2c9dd0056ab9271"
+SRCREV_machine ?= "6032c9c1ac18edd7c8eadd6f9f655556b5f5e77c"
+SRCREV_meta ?= "8e66f449e449f9ae2809b6c395ed7089aa37d7a3"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "615b9e10e3377467ced8f50592a1b5ba8ce053d8"
+SRCREV_machine:class-devupstream ?= "ffaf6178137b9cdcc9742d6677b70be164dfeb8c"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.91"
+LINUX_VERSION ?= "6.6.92"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


