Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD4EE9462F
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 03:05:01 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11966.1770692694474650307
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 19:04:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZgWIh8Fa;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-896f4627dffso4777686d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 19:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770692693; x=1771297493; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smM6fEcNQDpzX0n1du2sp98aArSlMpwt4gPW3fOjFFc=;
        b=ZgWIh8FazN3o2QqtELcjcaKjxKs6YZM+XsH4r0gdSk7yiBSGoQ2qQWJjpU3Zelksrj
         fqdxygmzSUMgF54HoMaWiRyOo+775yxIbiR1n96Piur6lMrS/MpH/fhySzu6ZcEMfiV7
         b8eBGywlCud/AwVYBEwxAmcPxeCWtQTgAK5E8J5uRmwBDEXi7WwSb8wf7Dh7y38Vlt8f
         GBYlH2TcT0hYWbazbR5p20rYtcsYFA3Bbd6hEZBlXkHPgmHunmMiIVhKYkB0eOr3phN0
         /3t/z5sIeClWcBwev//Yli9LUhbO98hVMmJq06N5Bb1xlSOremcnbuRBe73BSifHQ3gq
         ILjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770692693; x=1771297493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=smM6fEcNQDpzX0n1du2sp98aArSlMpwt4gPW3fOjFFc=;
        b=Q61JW4g1ZDle/IwV7nUHezS2X0RzoUqNWKke7UVd31Hh31x4oA9X2y1C1WNyHHkAbq
         nzdM2Yh5RNwr3aCQ/KU7VMfPIbFMKC+PzBJ//ekfO9Q+DUp6PabDLTMfwMW/67WA+1Tr
         ciYbQJzYh7w3wL3VoS6w4Dglo/hD/ES4ctd4Zk25uu1EeVG7nz4teO8lZljgoqInvWMj
         aisWoGceB451UUkrvj+v4bqdi5qumbp13smEnOrNWBaz+pP4x/rUWJXgthOsX3SoLzTn
         cKUxyJZwA5XEt5qwq9HgZQGtoI5maU7B/x+eY/gX6aeqKGH3e53jty6MtNKCeCTIcMHG
         qS4A==
X-Gm-Message-State: AOJu0YwhYOPhdq/aomI+m2TCO9qQ6QPZwXn1hB8AbPTjhAmp2SBNtDxZ
	hodZmVt33ip3lWSIQaGWVVEuTu/BEFOB8P/1C+WeALG0uBZ6/2vJT89OXCCSa61e
X-Gm-Gg: AZuq6aKs9JO5bG4MkfOqchDL6ztZaBSC7aDI3cokh9dWd6/hp9Xn+MuL9jpkAAARzFY
	sbQhFfajNLVbQnGWligHdzzgbH1Nr4ueNEvdW5JZw0oKV1NNtCTuqsKMx5za37i2xwN9N/ztHy+
	RH1mGjMT2K/OxtgIwygBTURKHk/dGCicbS6VonunoW76LxcWsyjddYjjpGrKGJg1EGkli0FJLeT
	b58tBjKMTgvOKHFqApSqu7CPZ29BO7/2tKFo/s+s5G3AG0Q+UaorYoLbLKwuqfpNkw/9TT/nOkS
	8lFTfFiXlTtK5tPGcqu6mfQSCKe3XIBMQs5InCQhYFs7bd9U/ZNNWpvt8Vz1tqfUDYtzGYnlhJq
	CUjNiRBpUcbFBMII4c9cQGj38/k71lnH+5ExM0i39wRdRZ9+YnNQsDBsM2xSGcOGNS8D/vhbRBs
	SUgfRdIWrMyJGsdc96OgbJKEw6qOnpyrumjo8zvAaHVVEAVQN3XDYKd/iWhD0sdfGON9a4leX5m
	VwQAOMd0NK2lPNUNooOZTAChyDTxNJekNXtgdXFf6aDTaRjSXXgOk60mEc=
X-Received: by 2002:a05:6214:487:b0:890:8aef:2b3f with SMTP id 6a1803df08f44-8953d0c603bmr191523406d6.65.1770692692901;
        Mon, 09 Feb 2026 19:04:52 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5063928e436sm88595551cf.17.2026.02.09.19.04.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 19:04:52 -0800 (PST)
From: bruce.ashfield@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [meta][kirkstone][PATCH 02/05] linux-yocto/5.15: update to v5.15.196
Date: Mon,  9 Feb 2026 22:04:45 -0500
Message-ID: <20260210030448.1344854-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210030448.1344854-1-bruce.ashfield@gmail.com>
References: <20260210030448.1344854-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 03:05:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230831

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    cc5ec87693063 Linux 5.15.196
    59c78e8fddc1f PCI: rcar: Demote WARN() to dev_warn_ratelimited() in rcar_pcie_wakeup()
    83a563fab563f net: rtnetlink: fix module reference count leak issue in rtnetlink_rcv_msg
    c5d116862dd3e usb: gadget: f_acm: Refactor bind path to use __free()
    185193a4714aa usb: gadget: f_ncm: Refactor bind path to use __free()
    d44e82f46cd0e usb: gadget: Introduce free_usb_request helper
    97fc7aa654e30 usb: gadget: Store endpoint pointer in usb_request
    02fbea0864fd4 arch_topology: Fix incorrect error check in topology_parse_cpu_capacity()
    9b82da54a0305 xfs: always warn about deprecated mount options
    b57a3760d12bd devcoredump: Fix circular locking dependency with devcd->mutex.
    11300f645870a PCI: tegra194: Reset BARs when running in PCIe endpoint mode
    61d6249ea441b PCI: rcar-host: Drop PMSR spinlock
    9e14fb714ebf5 PCI: rcar: Finish transition to L1 state in rcar_pcie_config_access()
    97ab6a90c72d9 PCI: tegra194: Handle errors in BPMP response
    13981b0555ab4 f2fs: fix wrong block mapping for multi-devices
    ba88a53d7f5df NFSD: Define a proc_layoutcommit for the FlexFiles layout type
    8004d4b8cbf1b vfs: Don't leak disconnected dentries on umount
    0157c469edac2 drm/amdgpu: use atomic functions with memory barriers for vm fault info
    c6fa15fa94016 PCI: rcar-host: Convert struct rcar_msi mask_lock into raw spinlock
    0e143e87264db wifi: ath11k: HAL SRNG: don't deinitialize and re-initialize again
    ddcfc52965c19 PCI: j721e: Fix programming sequence of "strap" settings
    2ddb51e228192 PCI: j721e: Enable ACSPCIE Refclk if "ti,syscon-acspcie-proxy-ctrl" exists
    cfd1aa3e2b71f fuse: fix livelock in synchronous file put from fuseblk workers
    a39f70d63f437 fuse: allocate ff->release_args only if release is needed
    6012804a77860 padata: Reset next CPU when reorder sequence wraps around
    38d702a06487c iio: imu: inv_icm42600: Simplify pm_runtime setup
    be16df3c3c5dd PM: runtime: Add new devm functions
    0f9f51390c866 iio: imu: inv_icm42600: Avoid configuring if already pm_runtime suspended
    f35ab1ba853ab iio: imu: inv_icm42600: use = { } instead of memset()
    8e69c8f3ae1c5 NFSD: Fix last write offset handling in layoutcommit
    0570c78e6c707 NFSD: Minor cleanup in layoutcommit processing
    68d615f4b00ab NFSD: Rework encoding and decoding of nfsd4_deviceid
    2dc2bc27578c3 xfs: fix log CRC mismatches between i386 and other architectures
    71f9402044636 xfs: rename the old_crc variable in xlog_recover_process
    6e7f06895db6e s390/cio: Update purge function to unregister the unused subchannels
    dc9f91f849860 arm64: errata: Apply workarounds for Neoverse-V3AE
    a6ef05314d5a8 arm64: cputype: Add Neoverse-V3AE definitions
    1bff561ebe700 serial: 8250_exar: add support for Advantech 2 port card with Device ID 0x0018
    ad2be44882716 most: usb: hdm_probe: Fix calling put_device() before device initialization
    578eb18cd111a most: usb: Fix use-after-free in hdm_disconnect
    cee4ab233f895 mei: me: add wildcat lake P DID
    2670932f24657 comedi: fix divide-by-zero in comedi_buf_munge()
    97a71d277e759 binder: remove "invalid inc weak" check
    55c7290b1a2af xhci: dbc: enable back DbC in resume if it was enabled before suspend
    6d0edbdb0bf72 usb: raw-gadget: do not limit transfer length
    f9bfb3fc7ffa3 usb/core/quirks: Add Huawei ME906S to wakeup quirk
    1a5afa2b586ee USB: serial: option: add Telit FN920C04 ECM compositions
    443bc87ec125a USB: serial: option: add Quectel RG255C
    57bb21f4e7b1d USB: serial: option: add UNISOC UIS7720
    2c651b835b9f6 net: ravb: Ensure memory write completes before ringing TX doorbell
    a63ab2c3c48a2 net: usb: rtl8150: Fix frame padding
    09bba278ccde2 vsock: fix lock inversion in vsock_assign_transport()
    93b1ab422f196 ocfs2: clear extent cache after moving/defragmenting extents
    f2ef52fbdc5f0 MIPS: Malta: Fix keyboard resource preventing i8042 driver from registering
    5666bcc3c00f7 Revert "cpuidle: menu: Avoid discarding useful information"
    f49962e51a428 net: bonding: fix possible peer notify event loss or dup issue
    03e80a4b04ef1 sctp: avoid NULL dereference when chunk data buffer is missing
    8a2375b0e9b89 arm64, mm: avoid always making PTE dirty in pte_mkwrite()
    c42dbdcde7220 dpaa2-eth: fix the pointer passed to PTR_ALIGN on Tx path
    00daafde87d2e net: enetc: correct the value of ENETC_RXB_TRUESIZE
    e7a8c57671a1f rtnetlink: Allow deleting FDB entries in user namespace
    bde6afe89ac15 net: rtnetlink: add NLM_F_BULK support to rtnl_fdb_del
    7cd416cc0220c net: add ndo_fdb_del_bulk
    31017cda9928e net: rtnetlink: add bulk delete support flag
    a36130f7921c9 net: netlink: add NLM_F_BULK delete request modifier
    40ffa6a8c1907 net: rtnetlink: use BIT for flag values
    fc69b00561e49 net: rtnetlink: add helper to extract msg type's kind
    a6c202c341624 m68k: bitops: Fix find_*_bit() signatures
    1701af4d10b4f hfsplus: return EIO when type of hidden directory mismatch in hfsplus_fill_super()
    2a112cdd66f5a hfs: fix KMSAN uninit-value issue in hfs_find_set_zero_bits()
    450ac1c490f8d dlm: check for defined force value in dlm_lockspace_release
    9df3c241fbf69 hfsplus: fix KMSAN uninit-value issue in hfsplus_delete_cat()
    418e48cab99c5 hfs: validate record offset in hfsplus_bmap_alloc
    c135b8dca6552 hfsplus: fix KMSAN uninit-value issue in __hfsplus_ext_cache_extent()
    725522af093ff hfs: make proper initalization of struct hfs_find_data
    b92904866b9f3 hfs: clear offset and space out of valid records in b-tree node
    25f09699edd36 nios2: ensure that memblock.current_limit is set when setting pfn limits
    45ec13d6ce557 exec: Fix incorrect type for ret
    3324e5e3ac97a Revert "perf test: Don't leak workload gopipe in PERF_RECORD_*"
    ae9ad3b673252 PCI/sysfs: Ensure devices are powered for config reads (part 2)
    7ab44236b32ed hfsplus: fix slab-out-of-bounds read in hfsplus_strcasecmp()
    736159f7b296d ALSA: usb-audio: Fix NULL pointer deference in try_to_register_card
    3c77e994e4ecd ALSA: firewire: amdtp-stream: fix enum kernel-doc warnings
    fdccb3adc59d7 sched/fair: Fix pelt lost idle time detection
    15fda76f7a57a sched/balancing: Rename newidle_balance() => sched_balance_newidle()
    343e991e2596a drm/amd/powerplay: Fix CIK shutdown temperature
    d38aec7cd3502 riscv: kprobes: Fix probe address validation
    6a90c8381c333 net: usb: lan78xx: fix use of improperly initialized dev->chipid in lan78xx_reset
    50b2fb48a4733 net: usb: lan78xx: Add error handling to lan78xx_init_mac_address
    a6b33d9edf260 net: usb: use eth_hw_addr_set() instead of ether_addr_copy()
    bab04baafc1c5 tls: don't rely on tx_work during send()
    09b1c01df5d46 tls: always set record_type in tls_process_cmsg
    669d389ed231b tls: wait for async encrypt in case of error during latter iterations of sendmsg
    2cb75c87428e0 net: tls: wait for async completion on last message
    4de9057aebb15 splice, net: Add a splice_eof op to file-ops and socket-ops
    01abf7b445062 tg3: prevent use of uninitialized remote_adv and local_adv variables
    c43fe40e67d69 tcp: fix tcp_tso_should_defer() vs large RTT
    14c9047ad5165 amd-xgbe: Avoid spurious link down messages during interface toggle
    402b6985e872b net/ip6_tunnel: Prevent perpetual tunnel growth
    1095322a7e014 r8169: fix packet truncation after S4 resume on RTL8168H/RTL8111H
    5b9c949c66846 doc: fix seg6_flowlabel path
    06477bbe26e04 net: dlink: handle dma_map_single() failure properly
    97760193e892b can: m_can: m_can_plat_remove(): add missing pm_runtime_disable()
    aca91cae0c917 dax: skip read lock assertion for read-only filesystems
    77711d850bed7 HID: multitouch: fix sticky fingers
    a510364e8cac0 cpufreq: CPPC: Avoid using CPUFREQ_ETERNAL as transition delay
    9699fd9e13df2 crypto: rockchip - Fix dma_unmap_sg() nents value
    df808a1f1550b drm/exynos: exynos7_drm_decon: remove ctx->suspended
    d6a3c53eebd1f drm/exynos: exynos7_drm_decon: properly clear channels during bind
    0e212fdcea59c drm/exynos: exynos7_drm_decon: fix uninitialized crtc reference in functions
    4b354a29166a3 blk-crypto: fix missing blktrace bio split events
    5918d914a3a67 media: lirc: Fix error handling in lirc_register()
    ddb9a92a999b6 media: rc: Directly use ida_free()
    723e7084497ef media: s5p-mfc: remove an unused/uninitialized variable
    78f6eaf14fe3d btrfs: fix clearing of BTRFS_FS_RELOC_RUNNING if relocation already running
    2e9e10657b041 ext4: detect invalid INLINE_DATA + EXTENTS flag combination
    14476553253b2 jbd2: ensure that all ongoing I/O complete before freeing blocks
    34033f75d0ccb r8152: add error handling in rtl8152_driver_init

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 7d55e17514..a315593e7c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f54e8af7284d39e9129452ac12c6a78511333335"
-SRCREV_meta ?= "1bfe6bf1a07dbce00c9a7b4ab051014a26a799a8"
+SRCREV_machine ?= "ec706ff09f989e8c03cdc0e1ec5cafd7cf3ee8a2"
+SRCREV_meta ?= "0279325ca207a9cdfa8a956632154831453a85c1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.195"
+LINUX_VERSION ?= "5.15.196"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 896b512dac..66da58322e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.195"
+LINUX_VERSION ?= "5.15.196"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "9ce0ec0c426ae703dbce0bbc4d56b919bea21e10"
-SRCREV_meta ?= "1bfe6bf1a07dbce00c9a7b4ab051014a26a799a8"
+SRCREV_machine ?= "6aa88785aa94fe7253e4dcda162c35c8eaa9f500"
+SRCREV_meta ?= "0279325ca207a9cdfa8a956632154831453a85c1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index b2adfd3544..5b6213a9d7 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "5200e910cb4a700023e548693aacdd166b008f8b"
-SRCREV_machine:qemuarm64 ?= "2a69501b11075d6c4e6cab2e05fc04f61a8991cd"
-SRCREV_machine:qemumips ?= "6e318293304f232aa650d41bbc6ae7ad40c03fa5"
-SRCREV_machine:qemuppc ?= "c861e5a8012080cc03be9725dd996e0d68f4e93b"
-SRCREV_machine:qemuriscv64 ?= "8f21ac8bce967e4ae9afbe4c66f8fbc11982c59e"
-SRCREV_machine:qemuriscv32 ?= "8f21ac8bce967e4ae9afbe4c66f8fbc11982c59e"
-SRCREV_machine:qemux86 ?= "8f21ac8bce967e4ae9afbe4c66f8fbc11982c59e"
-SRCREV_machine:qemux86-64 ?= "8f21ac8bce967e4ae9afbe4c66f8fbc11982c59e"
-SRCREV_machine:qemumips64 ?= "d3a7bcb9d74f245de665994e3c9d8a35e42351de"
-SRCREV_machine ?= "8f21ac8bce967e4ae9afbe4c66f8fbc11982c59e"
-SRCREV_meta ?= "1bfe6bf1a07dbce00c9a7b4ab051014a26a799a8"
+SRCREV_machine:qemuarm ?= "6938c8f38582bac21da19fde0f2b27beb6b15ba8"
+SRCREV_machine:qemuarm64 ?= "5650eb3e0a12ce52f0c2b9d5469ec169ab8239e7"
+SRCREV_machine:qemumips ?= "1b8f74e960fcd90cf09ff65426d88fe5ec4affae"
+SRCREV_machine:qemuppc ?= "29d4d06006e7def2e86d3c8c99d0a8550cae5a84"
+SRCREV_machine:qemuriscv64 ?= "3f1742244637534d7f0c70ca2ad471307917ce3f"
+SRCREV_machine:qemuriscv32 ?= "3f1742244637534d7f0c70ca2ad471307917ce3f"
+SRCREV_machine:qemux86 ?= "3f1742244637534d7f0c70ca2ad471307917ce3f"
+SRCREV_machine:qemux86-64 ?= "3f1742244637534d7f0c70ca2ad471307917ce3f"
+SRCREV_machine:qemumips64 ?= "20aaafeb01a044c6e1f2480e119e575461e3fa23"
+SRCREV_machine ?= "3f1742244637534d7f0c70ca2ad471307917ce3f"
+SRCREV_meta ?= "0279325ca207a9cdfa8a956632154831453a85c1"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "ac56c046adf41fdb64ddda46fd66090f21dc381a"
+SRCREV_machine:class-devupstream ?= "cc5ec87693063acebb60f587e8a019ba9b94ae0e"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.195"
+LINUX_VERSION ?= "5.15.196"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.43.0


