Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19149CA0EE0
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 20:49:33 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.7045.1755118167144073398
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 13:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nH/JVyqn;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4b109bbea05so4291701cf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 13:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755118166; x=1755722966; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EsvcPqs6Hd9NbGg5D8xlcthVPbm1ammjXdeudYUN1xw=;
        b=nH/JVyqncryvMwNR8qK8XYJwhTNKbd2L45JAjNXkDDUUL00iLcUc8AWJHMkAJBNWMp
         TzilZSTqfM58EJgEujNBqFAcYpZyf/th0GnM9zxy24pHJ2qTGdVN4XXluEqouJdWxXAU
         P967yTxXLAG1VLgCcT5RtAnHujLnkbx1K3wAu98LgetKkjUvjhckcDRnVzDtwhXFhI4R
         V4BJYUUAFoQ2RIv7qYGJxWCZOOrVHL5WyrS6m3E1TdI4xqXBNGBtAaksWv3eiJMcDZGo
         iaUprrGz9G9t4X4nKQI5h0HTMB1kHDnhctYMvD5yUTmqiRretGRV4fyFIWecVCJu6+3z
         GhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755118166; x=1755722966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EsvcPqs6Hd9NbGg5D8xlcthVPbm1ammjXdeudYUN1xw=;
        b=IjCkNqyQd0VJn2iTTz86udW/AcKTmhAyXzaSUso6HatrwBD9kg8uRnqDf//s+k8Bnw
         /lvhXFlj2bWIIe+WW0BlckL4D+tjAsm4MCnXgHsKobR+xcB6eU7Y53N5n+m4lQE29/mu
         uTQQMx+4aXoyxwXbBmS3hzelLGQtxCoBWlzaINRcCzYO6ySwx9o1/l3a7Ik+S/BA2zNE
         dqSsazCxHffNdqrvv5SrG6QH9/HyCUX0QeroF6xbNy7y1xYAAB9c5voYDFCKxYxxjKqA
         oAWlL/glycO/y2xa3DzY2n6Z55F0GEIk25ZlmpH/YtjnCIJd5ewam667DvSVDPKRzPEU
         DB+A==
X-Gm-Message-State: AOJu0YxfjZW0Wlf41F3r7coQvtZ/zEn81lhY2C0NW4NjxA4FHkEINLYw
	PvEyJWs9hT0vn030zYDqIPTkKkxgDUFy6Tx1BunS9gnwDM3rptm/3s5SC8T/qdb3
X-Gm-Gg: ASbGncvYWHKimxj2B5TS1YGwxQ842asXVsq2IwkuXM3/uKLlSRJP913TH3J24qeG/qE
	Y4pVgwpJjS1HteVW2LN+gHaqoo8rxAE0+prir8VjXc+84g5oTfBU4Ur7A4TJmyuyOk46dO9R9sl
	g+akaaFPrU8+HKcCUP4gAUM0g1cxgn7WqCR8o6zz7O5LibdpJip19WjLEFAI2BIh/M/atrY3SR5
	8HUsbOisb4ykEE8oABq1LeKE/ARh1ggDPfCthDzaFkx1PobitF1VmN3Ix5Gt8EioBOwlE2cNJIx
	HvY3zB4HMOMwINA10FFxgG3sQBQppObH4ceEtIow+brTXuxdYcA27zP6TVEsk/vpzX2gdayZSWF
	w8XJz2znOog55z76xelxQHTDrOLQtzPiqmZQdN3YD0+P1CKCGcmYP++0EWIU3FuSNx0uZnBguT5
	BRzC2P5jTWaqYgpvEWxqzt7To=
X-Google-Smtp-Source: AGHT+IEj54DBkVcxeb9RDChxpqDNY09Vy22cdUT3KdY/hOEt3q2DWItILnFdK9oMDMb0mu78J+8pXA==
X-Received: by 2002:ad4:588e:0:b0:70b:5320:d416 with SMTP id 6a1803df08f44-70b5320d788mr4449466d6.14.1755118165780;
        Wed, 13 Aug 2025 13:49:25 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70af5b07658sm3326516d6.43.2025.08.13.13.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 13:49:24 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/8] linux-yocto/6.12: update to v6.12.39
Date: Wed, 13 Aug 2025 16:49:15 -0400
Message-Id: <314face7e665d3fff7220aaf54769b4397b9f32f.1755118020.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1755118020.git.bruce.ashfield@gmail.com>
References: <cover.1755118020.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 20:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221821

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    cdf264c0a590 Linux 6.12.39
    f3f9deccfc68 KVM: SVM: Set synthesized TSA CPUID flags
    f004f58d18a2 rseq: Fix segfault on registration when rseq_cs is non-zero
    f2133b849ff2 crypto: ecdsa - Harden against integer overflows in DIV_ROUND_UP()
    59923d508bd2 arm64: Filter out SME hwcaps when FEAT_SME isn't implemented
    815f1161d6db ksmbd: fix potential use-after-free in oplock/lease break ack
    2d89dab1ea60 kasan: remove kasan_find_vm_area() to prevent possible deadlock
    e1aec954583f net: wangxun: revert the adjustment of the IRQ vector sequence
    5244536e650c erofs: fix rare pcluster memory leak after unmounting
    5ea53aa71c2c selftests/bpf: adapt one more case in test_lru_map to the new target_free
    7b4a02631352 HID: nintendo: avoid bluetooth suspend/resume stalls
    c72536350e82 HID: quirks: Add quirk for 2 Chicony Electronics HP 5MP Cameras
    716a0c8dedc6 HID: Add IGNORE quirk for SMARTLINKTECHNOLOGY
    70685fb6216f riscv: vdso: Exclude .rodata from the PT_DYNAMIC segment
    9ef5d4748dfe bpf: Adjust free target to avoid global starvation of LRU map
    c23e0792b77d vt: add missing notification when switching back to text mode
    0bcc14f36c7a btrfs: fix assertion when building free space tree
    589b290d0935 net: mana: Record doorbell physical address in PF mode
    921fffa1d8bc HID: lenovo: Add support for ThinkPad X1 Tablet Thin Keyboard Gen2
    e46cf2943f91 driver: bluetooth: hci_qca:fix unable to load the BT driver
    a9c357b08672 net: usb: qmi_wwan: add SIMCom 8230C composition
    e55b2126961b ALSA: hda/realtek: Add quirks for some Clevo laptops
    01b0312a4a3a ALSA: hda/realtek - Enable mute LED on HP Pavilion Laptop 15-eg100
    72aad5cf5790 ASoC: amd: yc: add quirk for Acer Nitro ANV15-41 internal mic
    383b2399d586 io_uring: make fallocate be hashed work
    67be7e6c55a9 ALSA: hda/realtek: Add mic-mute LED setup for ASUS UM5606
    68397fda2caa ASoC: SOF: Intel: hda: Use devm_kstrdup() to avoid memleak.
    dd072fa64715 um: vector: Reduce stack usage in vector_eth_configure()
    7df2295c036b atm: idt77252: Add missing `dma_map_error()`
    25cab1b83d66 ublk: sanity check add_dev input for underflow
    f154e41e1d9d bnxt_en: Set DMA unmap len correctly for XDP_REDIRECT
    b4e7e3f4e9d2 bnxt_en: Fix DCB ETS validation
    948ab36ed249 net: ll_temac: Fix missing tx_pending check in ethtools_set_ringparam()
    bbd385b65f9e net/mlx5e: Add new prio for promiscuous mode
    7581afc05154 net/mlx5e: Fix race between DIM disable and net_dim()
    c4270235db92 can: m_can: m_can_handle_lost_msg(): downgrade msg lost in rx message to debug level
    90d0d5a439f5 drm/xe/pm: Correct comment of xe_pm_set_vram_threshold()
    ec4014566377 selftests: net: lib: fix shift count out of range
    182c9f38c367 selftests: net: lib: Move logging from forwarding/lib.sh here
    e3647c40bea2 net: phy: microchip: limit 100M workaround to link-down events on LAN88xx
    b215e916336f net: phy: microchip: Use genphy_soft_reset() to purge stale LPA bits
    4c934e0cac61 ibmvnic: Fix hardcoded NUM_RX_STATS/NUM_TX_STATS with dynamic sizeof
    473f3eadfc73 net: appletalk: Fix device refcount leak in atrtr_create()
    e0dd2e972966 netfilter: flowtable: account for Ethernet header in nf_flow_pppoe_proto()
    fd67f52eea80 erofs: fix to add missing tracepoint in erofs_readahead()
    ea2350dfa378 erofs: refine readahead tracepoint
    9493b5f9ad07 erofs: tidy up zdata.c
    71e4f033a90d erofs: get rid of `z_erofs_next_pcluster_t`
    16396885c26a erofs: free pclusters if no cached folio is attached
    ff4b8c9ade1b drm/xe/pf: Clear all LMTT pages on alloc
    8586552df591 nbd: fix uaf in nbd_genl_connect() error path
    1bbdf4213711 wifi: mt76: mt7925: Fix null-ptr-deref in mt7925_thermal_init()
    fa7e9a15460a drm/nouveau/gsp: fix potential leak of memory used during acpi init
    06c566371f8a wifi: rt2x00: fix remove callback type mismatch
    d21eeb050599 wifi: mac80211: fix non-transmitted BSSID profile search
    d4a7056ca9ab wifi: mac80211: correctly identify S1G short beacon
    2941155d9a5a raid10: cleanup memleak at raid10_make_request
    776e6186dc9e md/raid1: Fix stack memory use after return in raid1_reshape
    a560de522374 drm/tegra: nvdec: Fix dma_alloc_coherent error check
    fcd9c923b58e wifi: zd1211rw: Fix potential NULL pointer dereference in zd_mac_tx_to_dev()
    c6625c21ea66 wifi: cfg80211: fix S1G beacon head validation in nl80211
    8d4d00ea6038 netfs: Fix ref leak on inserted extra subreq in write retry
    42baf997722c netlink: make sure we allow at least one dump skb
    f98c4cec7504 netlink: Fix rmem check in netlink_broadcast_deliver().
    cecc9146d244 ASoC: Intel: sof-function-topology-lib: Print out the unsupported dmic count
    19ff875dc516 erofs: address D-cache aliasing
    4745bfd34ae7 erofs: fix to add missing tracepoint in erofs_read_folio()
    3b16c9b8ba71 ksmbd: fix a mount write count leak in ksmbd_vfs_kern_path_locked()
    92c2c005a8ba smb: server: make use of rdma_destroy_qp()
    1d219778281e clk: scmi: Handle case where child clocks are initialized before their parents
    971da696abf0 x86/mm: Disable hugetlb page table sharing on 32-bit
    a68b85855732 x86/rdrand: Disable RDSEED on AMD Cyan Skillfish
    fcee75daecc5 clk: imx: Fix an out-of-bounds access in dispmix_csr_clk_dev_data
    5d2d34f36724 rust: init: allow `dead_code` warnings for Rust >= 1.89.0
    febc0b5dbabd lib/alloc_tag: do not acquire non-existent lock in alloc_tag_top_users()
    4c39dfd13beb mm/vmalloc: leave lazy MMU mode on PTE mapping error
    92ed107cd26d scripts/gdb: fix interrupts.py after maple tree conversion
    62720dc3cfd9 scripts/gdb: de-reference per-CPU MCE interrupts
    cb89f9bf6c3a scripts/gdb: fix interrupts display after MCP on x86
    ee6c677ef318 mm: fix the inaccurate memory statistics issue for users
    839d8682732e maple_tree: fix mt_destroy_walk() on root leaf node
    92db42e201f4 kallsyms: fix build without execinfo
    7dccd5eb5343 Revert "PCI/ACPI: Fix allocated memory release on error in pci_acpi_scan_root()"
    e4172522d594 Revert "ACPI: battery: negate current when discharging"
    ee6f6138d5f2 drm/xe: Allocate PF queue size on pow2 boundary
    065bd940ee0a drm/framebuffer: Acquire internal references on GEM handles
    9e4af87bd08d Revert "usb: gadget: u_serial: Add null pointer check in gs_start_io"
    abf3620cba68 usb: gadget: u_serial: Fix race condition in TTY wakeup
    48007d6e7bdb Revert "drm/xe/xe2: Enable Indirect Ring State support for Xe2"
    57b7c27ef5e7 drm/xe/bmg: fix compressed VRAM handling
    2d2f07a99487 drm/gem: Fix race in drm_gem_handle_create_tail()
    38df1a5053bc drm/ttm: fix error handling in ttm_buffer_object_transfer
    e2d6547dc8b9 drm/sched: Increment job count before swapping tail spsc queue
    08480e285c6a drm/gem: Acquire references on GEM handles for framebuffers
    e90ee15ce28c drm/amdkfd: Don't call mmput from MMU notifier callback
    9f852d301f64 drm/imagination: Fix kernel crash when hard resetting the GPU
    a7b2f250ffcd wifi: mt76: mt7925: fix invalid array index in ssid assignment during hw scan
    fad0f6fcdae0 wifi: mt76: mt7925: fix the wrong config for tx interrupt
    9b50874f297f wifi: mt76: mt7925: prevent NULL pointer dereference in mt7925_sta_set_decap_offload()
    9639e54025f1 wifi: mt76: mt7921: prevent decap offload config before STA initialization
    a963819a121f wifi: mwifiex: discard erroneous disassoc frames on STA interface
    e01851f6e9a6 wifi: prevent A-MSDU attacks in mesh networks
    373caeec3651 pwm: mediatek: Ensure to disable clocks in error path
    d526e11ab274 pwm: Fix invalid state detection
    275605a8b480 pinctrl: qcom: msm: mark certain pins as invalid for interrupts
    3e0542701b37 md/md-bitmap: fix GPF in bitmap_get_stats()
    9f260e16b297 net: ethernet: rtsn: Fix a null pointer dereference in rtsn_probe()
    8f65277317a8 gre: Fix IPv6 multicast route creation.
    199af064babb ASoC: fsl_sai: Force a software reset when starting in consumer mode
    e14bffc90866 ALSA: ad1816a: Fix potential NULL pointer deref in snd_card_ad1816a_pnp()
    d9bd1163c8d8 KVM: Allow CPU to reschedule while setting per-page memory attributes
    fd044c99d831 KVM: SVM: Reject SEV{-ES} intra host migration if vCPU creation is in-flight
    5cb498b20bff KVM: SVM: Add missing member in SNP_LAUNCH_START command structure
    55f568521e0b KVM: x86/xen: Allow 'out of range' event channel ports in IRQ routing table.
    291eff10b197 x86/mce: Make sure CMCI banks are cleared during shutdown on Intel
    8ed7f3de93e1 x86/mce: Ensure user polling settings are honored when restarting timer
    55ea884c0dce x86/mce: Don't remove sysfs if thresholding sysfs init fails
    afcf4f4e7062 x86/mce/amd: Fix threshold limit reset
    e01d5e33645d x86/mce/amd: Add default names for MCA banks and blocks
    9e0d33e75c16 ipmi:msghandler: Fix potential memory corruption in ipmi_create_user()
    d1ff5f9d2c54 rxrpc: Fix oops due to non-existence of prealloc backlog struct
    5385ad53793d rxrpc: Fix bug due to prealloc collision
    8ecd651ef24a net/sched: Abort __tc_modify_qdisc if parent class does not exist
    fc2fffa2faca net: ethernet: ti: am65-cpsw-nuss: Fix skb size by accounting for skb_shared_info
    34a09d6240a2 atm: clip: Fix NULL pointer dereference in vcc_sendmsg()
    024876b247a8 atm: clip: Fix infinite recursive call of clip_push().
    9f771816f14d atm: clip: Fix memory leak of struct clip_vcc.
    36caab990b69 atm: clip: Fix potential null-ptr-deref in to_atmarpd().
    4d5476fa3931 net: phy: smsc: Fix link failure in forced mode with Auto-MDIX
    6fb4cd247cda net: phy: smsc: Force predictable MDI-X state on LAN87xx
    850812bd2a15 net: phy: smsc: Fix Auto-MDIX configuration when disabled by strap
    be8792c6702b net: stmmac: Fix interrupt handling for level-triggered mode in DWC_XGMAC2
    41a741c476e1 vsock: Fix IOCTL_VM_SOCKETS_GET_LOCAL_CID to check also `transport_local`
    ae2c712ba39c vsock: Fix transport_* TOCTOU
    3734d78210cc vsock: Fix transport_{g2h,h2g} TOCTOU
    62e6160cfb55 tcp: Correct signedness in skb remaining space calculation
    50aa2d121bc2 tipc: Fix use-after-free in tipc_conn_close().
    8fb2802a1654 vsock: fix `vsock_proto` declaration
    4b8e18af7bea netlink: Fix wraparounds of sk->sk_rmem_alloc.
    b90129445f50 net: phy: qcom: qca808x: Fix WoL issue by utilizing at8031_set_wol()
    31db4223db33 net: phy: qcom: move the WoL function to shared library
    778f4e173020 arm64: poe: Handle spurious Overlay faults
    2e0cb0c74d96 bnxt_en: eliminate the compile warning in bnxt_request_irq due to CONFIG_RFS_ACCEL
    0caba66f0073 sched/deadline: Fix dl_server runtime calculation formula
    35bda158da39 fix proc_sys_compare() handling of in-lookup dentries
    df1d6801f16a pinctrl: amd: Clear GPIO debounce for suspend
    cdbcde935e72 Bluetooth: hci_event: Fix not marking Broadcast Sink BIS as connected
    32fa1f92a40e Bluetooth: hci_sync: Fix not disabling advertising instance
    0cd863ab4204 ASoC: cs35l56: probe() should fail if the device ID is not recognized
    a0a8009083e5 perf: Revert to requiring CAP_SYS_ADMIN for uprobes
    f7fe33f629bb sched/core: Fix migrate_swap() vs. hotplug
    1207f57be07f irqchip/irq-msi-lib: Select CONFIG_GENERIC_MSI_IRQ
    bc179aa79a20 perf/core: Fix the WARN_ON_ONCE is out of lock protected region
    8f4c7131721a ASoC: Intel: soc-acpi: arl: Correct order of cs42l43 matches
    cca47e6e1f78 ASoC: Intel: soc-acpi-intel-arl-match: set get_function_tplg_files ops
    fc3a8a5e8f8e ASoC: Intel: add sof_sdw_get_tplg_files ops
    36536435849b ASoC: soc-acpi: add get_function_tplg_files ops
    06e0b070eb97 ASoC: Intel: soc-acpi: arl: Add match entries for new cs42l43 laptops
    97d14c04610c ASoC: Intel: soc-acpi: arl: Correct naming of a cs35l56 address struct
    724b93a6a694 ASoC: Intel: SND_SOC_INTEL_SOF_BOARD_HELPERS select SND_SOC_ACPI_INTEL_MATCH
    d4f6a267cc07 ASoC: fsl_asrc: use internal measured ratio for non-ideal ratio mode
    07ed75bfa7ed drm/amdgpu: Replace Mutex with Spinlock for RLCG register access to avoid Priority Inversion in SRIOV
    56ea7746045a crypto: s390/sha - Fix uninitialized variable in SHA-1 and SHA-2
    04513cf1581b drm/amdgpu/ip_discovery: add missing ip_discovery fw
    39d6a607d531 drm/amdgpu/discovery: use specific ip_discovery.bin for legacy asics
    e9d9b25f3767 drm/exynos: exynos7_drm_decon: add vblank check in IRQ handling
    6dee745bd0ae eventpoll: don't decrement ep refcount while still holding the ep mutex

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 42ad0cbef0..c003d8464b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2aa940a9e5701e5b4107d0250da79a52e01da34a"
-SRCREV_meta ?= "5db57044962c6155c4e82f06d87e90dfe49a59e6"
+SRCREV_machine ?= "ae0f27c5992d230fddf2cab92dc5ae86417285d3"
+SRCREV_meta ?= "ae758a118311062560d89a3721abd38d4a35fc1c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.38"
+LINUX_VERSION ?= "6.12.39"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 452e3f0eb2..50da62af74 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.38"
+LINUX_VERSION ?= "6.12.39"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "fa4b881d24f752a559d8e1f75ed08895ef20b14d"
-SRCREV_meta ?= "5db57044962c6155c4e82f06d87e90dfe49a59e6"
+SRCREV_machine ?= "faa83e63e24b8a42361214170269144e55ea85fb"
+SRCREV_meta ?= "ae758a118311062560d89a3721abd38d4a35fc1c"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index b9ae0954fa..f65bc4796a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "c2755158bc029faf978e980235471b0f0e864814"
-SRCREV_machine:qemuarm64 ?= "fa4b881d24f752a559d8e1f75ed08895ef20b14d"
-SRCREV_machine:qemuloongarch64 ?= "fa4b881d24f752a559d8e1f75ed08895ef20b14d"
-SRCREV_machine:qemumips ?= "facf6694c9bdcaa9efb2d46a2c6e8e30fc72cdd3"
-SRCREV_machine:qemuppc ?= "fa4b881d24f752a559d8e1f75ed08895ef20b14d"
-SRCREV_machine:qemuriscv64 ?= "fa4b881d24f752a559d8e1f75ed08895ef20b14d"
-SRCREV_machine:qemuriscv32 ?= "fa4b881d24f752a559d8e1f75ed08895ef20b14d"
-SRCREV_machine:qemux86 ?= "fa4b881d24f752a559d8e1f75ed08895ef20b14d"
-SRCREV_machine:qemux86-64 ?= "fa4b881d24f752a559d8e1f75ed08895ef20b14d"
-SRCREV_machine:qemumips64 ?= "4ef2a68a188df7f561f5e297c4a3bab7e79e426f"
-SRCREV_machine ?= "fa4b881d24f752a559d8e1f75ed08895ef20b14d"
-SRCREV_meta ?= "5db57044962c6155c4e82f06d87e90dfe49a59e6"
+SRCREV_machine:qemuarm ?= "7898594c1d6927a383cceea44c8e29fdcadaa721"
+SRCREV_machine:qemuarm64 ?= "faa83e63e24b8a42361214170269144e55ea85fb"
+SRCREV_machine:qemuloongarch64 ?= "faa83e63e24b8a42361214170269144e55ea85fb"
+SRCREV_machine:qemumips ?= "465c2461220fbd9e9942cb6360bee9b018fbcd23"
+SRCREV_machine:qemuppc ?= "faa83e63e24b8a42361214170269144e55ea85fb"
+SRCREV_machine:qemuriscv64 ?= "faa83e63e24b8a42361214170269144e55ea85fb"
+SRCREV_machine:qemuriscv32 ?= "faa83e63e24b8a42361214170269144e55ea85fb"
+SRCREV_machine:qemux86 ?= "faa83e63e24b8a42361214170269144e55ea85fb"
+SRCREV_machine:qemux86-64 ?= "faa83e63e24b8a42361214170269144e55ea85fb"
+SRCREV_machine:qemumips64 ?= "cabddbe6741f5b05819b50432e33a0b5a9fe1d68"
+SRCREV_machine ?= "faa83e63e24b8a42361214170269144e55ea85fb"
+SRCREV_meta ?= "ae758a118311062560d89a3721abd38d4a35fc1c"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "259f4977409c87a980fa2227b7c76a2fe3fb8c2f"
+SRCREV_machine:class-devupstream ?= "cdf264c0a5906063a0e2b750d420d77cb992446d"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.38"
+LINUX_VERSION ?= "6.12.39"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


