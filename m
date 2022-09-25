Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23895C54EE9
	for <webhook@archiver.kernel.org>; Sun, 25 Sep 2022 19:18:22 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.20498.1664133485924047073
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=6ZRpVd3w;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so10503134pjq.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=3B7MIVP1UZnH7IzZulSMuY/c8vdYuz1D4mTh6LYkOyY=;
        b=6ZRpVd3wPXya47LhWC5nXgD5zaT/7dtbFGoKAGKjFY9DOGfpEeicdT398df/kB9ljK
         THpndlWz/oWrW2SRa+cXw9pAUMARYVcnEbOD5VMViVXgRYLxflPgR0ufhomkIKJBR2Da
         K/Wm+JHVopswyaqAL1qdXXy5oPFRX0tMURuEVvmOsxFXs7/1TTu9Njfgl0AkkVrwo1cI
         wtjpvkX9BZnLAe4b0MwFAg8j0IyqDKWi7lSDnBeq94lEWFCNXLtbWwQVaax+UAuUAJWL
         hbdXHdqLgzZuf0URIgGuU3fZ5y5eT/NcxWx2hA6hZDoT16diejK5I8fvAGqTJrYMnARl
         ZvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=3B7MIVP1UZnH7IzZulSMuY/c8vdYuz1D4mTh6LYkOyY=;
        b=3M6BRfuA6o8QLzAhIEfiuDysImWEC2cUVrPsnZ3+YB0DjsODRlWoVwmqNJSCUjBDqv
         IB3Vnx2ezFxKkEV8IstAPj1geul5xSS9TwMwtIcY/S44aSCkjInPgdI2ioZVXg63psy+
         t0q9g+3VigeKpdYezpZm2ZYOz2ixwZMLow4FAasM/hEciUePWPnHnV0PJj2YF9X4AGwx
         9mnorDpc/n5Mp12KM5HH2AbwTQJiPnQ1r8b0KzezFQOASpsZ30EScoyb5rEAdPhUN8PR
         CD7Y9KQpdlQZguLNklrgZnivOcVHGnmzo7OjOJfozR+Xvp3urdJ7DGbpdH0kDV13NRhk
         hMRQ==
X-Gm-Message-State: ACrzQf3jTBQhD8fGGQFW23MvFHZUzkvM9/BnaQQ8VQBBT4PBUogRj1vU
	MzaLU7CVAkKlr6eBHZ2R279kIwK6F8swo2v2
X-Google-Smtp-Source: 
 AMsMyM6NNXOhnEZrBzyjS7ZHnUANDQn7e5ZLsoJrlBTtSEQ8D4xGmIb8XM10kQnwvaTYY0FkB+o+Kg==
X-Received: by 2002:a17:902:d70a:b0:178:5d52:9e41 with SMTP id
 w10-20020a170902d70a00b001785d529e41mr18433106ply.0.1664133497113;
        Sun, 25 Sep 2022 12:18:17 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f126-20020a625184000000b0053651308a1csm10311257pfb.195.2022.09.25.12.18.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 12:18:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/33] linux-yocto/5.10: update to v5.10.143
Date: Sun, 25 Sep 2022 09:17:21 -1000
Message-Id: 
 <eee473e1442b427ca49e7717991cdf4cc6b2fd87.1664133309.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664133308.git.steve@sakoman.com>
References: <cover.1664133308.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Sep 2022 19:18:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171024

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    f1101295c145 Linux 5.10.143
    71d3adbb2890 arm64: errata: add detection for AMEVCNTR01 incrementing incorrectly
    202341395ce3 hwmon: (mr75203) enable polling for all VM channels
    c9da73ae78cb hwmon: (mr75203) fix multi-channel voltage reading
    19841592aea6 hwmon: (mr75203) fix voltage equation for negative source input
    8e8dc8fc53a8 hwmon: (mr75203) update pvt->v_num and vm_num to the actual number of used sensors
    13521c94b9b1 hwmon: (mr75203) fix VM sensor allocation when "intel,vm-map" not defined
    5e17967c7ea2 iommu/amd: use full 64-bit value in build_completion_wait()
    1a2742552372 swiotlb: avoid potential left shift overflow
    586f8c8330b7 MIPS: loongson32: ls1c: Fix hang during startup
    a9453be390b6 ASoC: mchp-spdiftx: Fix clang -Wbitfield-constant-conversion
    9dacdc1d47ed ASoC: mchp-spdiftx: remove references to mchp_i2s_caps
    2ead78fbe6b5 sch_sfb: Also store skb len before calling child enqueue
    d47475d4e502 tcp: fix early ETIMEDOUT after spurious non-SACK RTO
    6a2a34484462 nvme-tcp: fix regression that causes sporadic requests to time out
    5914fa32ef1b nvme-tcp: fix UAF when detecting digest errors
    a00b1b10e0a6 RDMA/mlx5: Set local port to one when accessing counters
    e8de6cb5755e IB/core: Fix a nested dead lock as part of ODP flow
    076f2479fc5a ipv6: sr: fix out-of-bounds read when setting HMAC data.
    047e66867eb6 RDMA/siw: Pass a pointer to virt_to_page()
    0f1e7977e1f2 xen-netback: only remove 'hotplug-status' when the vif is actually destroyed
    342d77769a6c i40e: Fix kernel crash during module removal
    9d11d06e50bb ice: use bitmap_free instead of devm_kfree
    22922da7373c tipc: fix shift wrapping bug in map_get()
    2ee85ac1b29d sch_sfb: Don't assume the skb is still around after enqueueing to child
    63677a09238a afs: Use the operation issue time instead of the reply time for callbacks
    fbbd5d05ea63 rxrpc: Fix an insufficiently large sglist in rxkad_verify_packet_2()
    6ccbb74801bb ALSA: usb-audio: Register card again for iface over delayed_register option
    1d29a63585b3 ALSA: usb-audio: Inform the delayed registration more properly
    e12ce30fe593 netfilter: nf_conntrack_irc: Fix forged IP logic
    910891a2a44c netfilter: nf_tables: clean up hook list when offload flags check fails
    908180f633d0 netfilter: br_netfilter: Drop dst references before setting.
    7d29f2bdd167 ARM: dts: at91: sama5d2_icp: don't keep vdd_other enabled all the time
    0796953300f5 ARM: dts: at91: sama5d27_wlsom1: don't keep ldo2 enabled all the time
    360dd120eb11 ARM: dts: at91: sama5d2_icp: specify proper regulator output ranges
    6bbef2694a06 ARM: dts: at91: sama5d27_wlsom1: specify proper regulator output ranges
    e198c0857032 RDMA/hns: Fix wrong fixed value of qp->rq.wqe_shift
    b2e82e325a84 RDMA/hns: Fix supported page size
    6dc0251638a4 soc: brcmstb: pm-arm: Fix refcount leak and __iomem leak bugs
    e9ea271c2e43 RDMA/cma: Fix arguments order in net device validation
    465eecd2b3a4 tee: fix compiler warning in tee_shm_register()
    75c961d01199 regulator: core: Clean up on enable failure
    bb4bee3eca78 ARM: dts: imx6qdl-kontron-samx6i: remove duplicated node
    015c2ec053f3 smb3: missing inode locks in punch hole
    98127f140bc4 cifs: remove useless parameter 'is_fsctl' from SMB2_ioctl()
    dee1e2b18cf5 cgroup: Fix threadgroup_rwsem <-> cpus_read_lock() deadlock
    bfbacc2ef7b5 cgroup: Elide write-locking threadgroup_rwsem when updating csses on an empty subtree
    a5620d3e0cf9 scsi: lpfc: Add missing destroy_workqueue() in error path
    ea10a652ad2a scsi: mpt3sas: Fix use-after-free warning
    de572edecc29 drm/i915: Implement WaEdpLinkRateDataReload
    be01f1c98875 nvmet: fix a use-after-free
    68f22c80c181 debugfs: add debugfs_lookup_and_remove()
    ab60010225ce kprobes: Prohibit probes in gate area
    6123bec8480d ALSA: usb-audio: Fix an out-of-bounds bug in __snd_usb_parse_audio_interface()
    ab730d3c4491 ALSA: aloop: Fix random zeros in capture data when using jiffies timer
    39a90720f3ab ALSA: emu10k1: Fix out of bounds access in snd_emu10k1_pcm_channel_alloc()
    dfb27648eea5 drm/amdgpu: mmVM_L2_CNTL3 register not initialized correctly
    2078e326b64e fbdev: chipsfb: Add missing pci_disable_device() in chipsfb_pci_init()
    9d040a629e7e net/core/skbuff: Check the return value of skb_copy_bits()
    43b9af72751a arm64: cacheinfo: Fix incorrect assignment of signed error value to unsigned fw_level
    96d206d0a14e parisc: Add runtime check to prevent PA2.0 kernels on PA1.x machines
    44739b5aae3a parisc: ccio-dma: Handle kmalloc failure in ccio_init_resources()
    826b46fd5974 drm/radeon: add a force flush to delay work when radeon
    04102568671e drm/amdgpu: Check num_gfx_rings for gfx v9_0 rb setup.
    c19656cd951a drm/amdgpu: Move psp_xgmi_terminate call from amdgpu_xgmi_remove_device to psp_hw_fini
    67bf86ff81fe drm/gem: Fix GEM handle release errors
    a175aed83eb4 scsi: megaraid_sas: Fix double kfree()
    004e26ef056c scsi: qla2xxx: Disable ATIO interrupt coalesce for quad port ISP27XX
    a14f1799ce37 Revert "mm: kmemleak: take a full lowmem check in kmemleak_*_phys()"
    13c8f561be38 fs: only do a memory barrier for the first set_buffer_uptodate()
    2946d2ae5ace wifi: iwlegacy: 4965: corrected fix for potential off-by-one overflow in il4965_rs_fill_link_cmd()
    918d9c4a4bdf efi: capsule-loader: Fix use-after-free in efi_capsule_write
    94f0f30b2d9d efi: libstub: Disable struct randomization
    eb75efdec8dd tty: n_gsm: avoid call of sleeping functions from atomic context
    fb6cadd2a30f tty: n_gsm: initialize more members at gsm_alloc_mux()
    186cb020bd3a xen-blkfront: Cache feature_persistent value before advertisement
    d3d885507b52 NFSD: Fix verifier returned in stable WRITEs
    281e81a5e2b2 Linux 5.10.142
    2058aab4e306 USB: serial: ch341: fix disabled rx timer on older devices
    2a4c619a87dd USB: serial: ch341: fix lost character on LCR updates
    06a84bda0a08 usb: dwc3: disable USB core PHY management
    451fa90150f2 usb: dwc3: qcom: fix use-after-free on runtime-PM wakeup
    8984ca41de16 usb: dwc3: fix PHY disable sequence
    cb2718936022 mmc: core: Fix UHS-I SD 1.8V workaround branch
    7f73a9dea009 btrfs: harden identification of a stale device
    3c63a22d0243 drm/i915/glk: ECS Liva Q2 needs GLK HDMI port timing quirk
    1079d095725a ALSA: seq: Fix data-race at module auto-loading
    f19a209f6156 ALSA: seq: oss: Fix data-race for max_midi_devs access
    7565c1503074 ALSA: hda/realtek: Add speaker AMP init for Samsung laptops with ALC298
    ab9f890377d1 net: mac802154: Fix a condition in the receive path
    d71a1c9fce18 net: Use u64_stats_fetch_begin_irq() for stats fetch.
    685f4e56717e ip: fix triggering of 'icmp redirect'
    4abc8c07a065 wifi: mac80211: Fix UAF in ieee80211_scan_rx()
    dd649b49219a wifi: mac80211: Don't finalize CSA in IBSS mode if state is disconnected
    742e222dd556 driver core: Don't probe devices after bus_type.match() probe deferral
    6202637fdef0 usb: gadget: mass_storage: Fix cdrom data transfers on MAC-OS
    abe3cfb7a7c8 USB: core: Prevent nested device-reset calls
    b0d4993c4baa s390: fix nospec table alignments
    0361d50e86c0 s390/hugetlb: fix prepare_hugepage_range() check for 2 GB hugepages
    b9097c5e107d usb-storage: Add ignore-residue quirk for NXP PN7462AU
    5f0d11796aa5 USB: cdc-acm: Add Icom PMR F3400 support (0c26:0020)
    d608c131df99 usb: dwc2: fix wrong order of phy_power_on and phy_init
    95791d51f7af usb: typec: altmodes/displayport: correct pin assignment for UFP receptacles
    89b01a88ef7d USB: serial: option: add support for Cinterion MV32-WA/WB RmNet mode
    7f1f17671517 USB: serial: option: add Quectel EM060K modem
    efcc3e1e6a5a USB: serial: option: add support for OPPO R11 diag port
    e547c07c2848 USB: serial: cp210x: add Decagon UCA device id
    5a603f4c1273 xhci: Add grace period after xHC start to prevent premature runtime suspend.
    587f793c64d9 media: mceusb: Use new usb_control_msg_*() routines
    07fb6b10b64a thunderbolt: Use the actual buffer in tb_async_error()
    f210912d1aa9 xen-blkfront: Advertise feature-persistent as user requested
    aa45c507037a xen-blkback: Advertise feature-persistent as user requested
    47a73e5e6ba4 mm: pagewalk: Fix race between unmap and page walker
    5d0d46e6255a xen/grants: prevent integer overflow in gnttab_dma_alloc_pages()
    eb0c614c426c KVM: x86: Mask off unsupported and unknown bits of IA32_ARCH_CAPABILITIES
    7efcbac55aad gpio: pca953x: Add mutex_lock for regcache sync in PM
    517dba798793 hwmon: (gpio-fan) Fix array out of bounds access
    a971343557ff clk: bcm: rpi: Add missing newline
    fcae47b2d23c clk: bcm: rpi: Prevent out-of-bounds access
    8c90a3e0d382 clk: bcm: rpi: Use correct order for the parameters of devm_kcalloc()
    00d8bc0c16ed clk: bcm: rpi: Fix error handling of raspberrypi_fw_get_rate
    e32982115d48 Input: rk805-pwrkey - fix module autoloading
    e2945f936cc4 clk: core: Fix runtime PM sequence in clk_core_unprepare()
    4ff599df312f Revert "clk: core: Honor CLK_OPS_PARENT_ENABLE for clk gate ops"
    c0f0ed9ef9b6 clk: core: Honor CLK_OPS_PARENT_ENABLE for clk gate ops
    5f1aee7f05d8 drm/i915/reg: Fix spelling mistake "Unsupport" -> "Unsupported"
    9629f2dfdb1d binder: fix UAF of ref->proc caused by race condition
    08fa8cb6df88 USB: serial: ftdi_sio: add Omron CS1W-CIF31 device id
    5cf2a57c7a01 misc: fastrpc: fix memory corruption on open
    c99bc901d5eb misc: fastrpc: fix memory corruption on probe
    30fd0e23e373 iio: adc: mcp3911: use correct formula for AD conversion
    89aa443437c6 iio: ad7292: Prevent regulator double disable
    b271090eea38 Input: iforce - wake up after clearing IFORCE_XMIT_RUNNING flag
    b202400c9c9e tty: serial: lpuart: disable flow control while waiting for the transmit engine to complete
    989201bb8c00 vt: Clear selection before changing the font
    7fd8d33adbba powerpc: align syscall table for ppc32
    19e3f69d1980 staging: rtl8712: fix use after free bugs
    6ccd69141b9f serial: fsl_lpuart: RS485 RTS polariy is inverse
    e416fe7f16c1 net/smc: Remove redundant refcount increase
    d73b89c3b3f7 Revert "sch_cake: Return __NET_XMIT_STOLEN when consuming enqueued skb"
    f3d1554d0f67 tcp: annotate data-race around challenge_timestamp
    870b6a15619c sch_cake: Return __NET_XMIT_STOLEN when consuming enqueued skb
    1b6666964ca1 kcm: fix strp_init() order and cleanup
    406d554844cc ethernet: rocker: fix sleep in atomic context bug in neigh_timer_handler
    44dfa645895a net/sched: fix netdevice reference leaks in attach_default_qdiscs()
    699d82e9a6db net: sched: tbf: don't call qdisc_put() while holding tree lock
    c0cb63ee2e22 Revert "xhci: turn off port power in shutdown"
    6855efbaf54a wifi: cfg80211: debugfs: fix return type in ht40allow_map_read()
    ddcb56e84130 ALSA: hda: intel-nhlt: Correct the handling of fmt_config flexible array
    9276eb98cd08 ALSA: hda: intel-nhlt: remove use of __func__ in dev_dbg
    23a29932715c ieee802154/adf7242: defer destroy_workqueue call
    c5f975e3ebfa bpf, cgroup: Fix kernel BUG in purge_effective_progs
    e6aeb8be8571 iio: adc: mcp3911: make use of the sign bit
    b69e05b1e830 platform/x86: pmc_atom: Fix SLP_TYPx bitfield mask
    f040abf62e62 drm/msm/dsi: Fix number of regulators for SDM660
    43e523a4070e drm/msm/dsi: Fix number of regulators for msm8996_dsi_cfg
    1487e8fc16f7 drm/msm/dp: delete DP_RECOVERED_CLOCK_OUT_EN to fix tps4
    631fbefd8777 drm/msm/dsi: fix the inconsistent indenting

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 6fa7b01734..7ce21f0719 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ce806c7f59d429249dba0975608a48ef91bccb75"
-SRCREV_meta ?= "dcf3fae266930708f432bf37ed4668a1ea9c5ac4"
+SRCREV_machine ?= "932359383ea84843300c03ee6633881de1af488b"
+SRCREV_meta ?= "92c947578207d27db250ee7250bacc11d9d80d4f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.141"
+LINUX_VERSION ?= "5.10.143"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index e4eabacccf..760b2be437 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.141"
+LINUX_VERSION ?= "5.10.143"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "8f8accaa8ef91657c3075e9ddd7b17afce6582d6"
-SRCREV_machine ?= "8bc9a9b0b0925e2c1f293742788dd7ab24f37454"
-SRCREV_meta ?= "dcf3fae266930708f432bf37ed4668a1ea9c5ac4"
+SRCREV_machine:qemuarm ?= "f794496466680c6dbd36cb34b3e0884d0ee48d2d"
+SRCREV_machine ?= "8173de3a22ec3395be1ae01dbe823d076313641a"
+SRCREV_meta ?= "92c947578207d27db250ee7250bacc11d9d80d4f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 898ed7f6fd..bf43f77100 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "42deeeee78c60a4fd3f3bf1f9b6f949e83a2c914"
-SRCREV_machine:qemuarm64 ?= "5ee7be1502e787929426cbe2ac15258605121400"
-SRCREV_machine:qemumips ?= "ba39ab3e8a264860360cbe88db7c8689f5cbbb4f"
-SRCREV_machine:qemuppc ?= "3b2073418a5b24809440a8f9501c722ebbfc7bbe"
-SRCREV_machine:qemuriscv64 ?= "e135e50901ef56b6edeef2bfcf5d173583aa9189"
-SRCREV_machine:qemuriscv32 ?= "e135e50901ef56b6edeef2bfcf5d173583aa9189"
-SRCREV_machine:qemux86 ?= "e135e50901ef56b6edeef2bfcf5d173583aa9189"
-SRCREV_machine:qemux86-64 ?= "e135e50901ef56b6edeef2bfcf5d173583aa9189"
-SRCREV_machine:qemumips64 ?= "8ef5e337eb3db82d4f25285fb240c316f4506805"
-SRCREV_machine ?= "e135e50901ef56b6edeef2bfcf5d173583aa9189"
-SRCREV_meta ?= "dcf3fae266930708f432bf37ed4668a1ea9c5ac4"
+SRCREV_machine:qemuarm ?= "1cfbadeee39ed8d3a8840586a57eee0cf1686f62"
+SRCREV_machine:qemuarm64 ?= "12f0f8c4af04c4d4cb7762b7a2e5cfaa917f8fe9"
+SRCREV_machine:qemumips ?= "4b9e240c03b2b60be378ae2cc9a321922201de8f"
+SRCREV_machine:qemuppc ?= "7914a529e3ccd64f347439d5cabc202d24af3ea0"
+SRCREV_machine:qemuriscv64 ?= "8cf777336c9b7160ffdf1e8d7e4d8ee0cd8cdb37"
+SRCREV_machine:qemuriscv32 ?= "8cf777336c9b7160ffdf1e8d7e4d8ee0cd8cdb37"
+SRCREV_machine:qemux86 ?= "8cf777336c9b7160ffdf1e8d7e4d8ee0cd8cdb37"
+SRCREV_machine:qemux86-64 ?= "8cf777336c9b7160ffdf1e8d7e4d8ee0cd8cdb37"
+SRCREV_machine:qemumips64 ?= "05365e1787c60331f88bec98dd0fcca08ce78b06"
+SRCREV_machine ?= "8cf777336c9b7160ffdf1e8d7e4d8ee0cd8cdb37"
+SRCREV_meta ?= "92c947578207d27db250ee7250bacc11d9d80d4f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.141"
+LINUX_VERSION ?= "5.10.143"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1


