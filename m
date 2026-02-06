Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A997EE6B4D
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 20:27:41 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17.1770409657682425151
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 12:27:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WJB6rug0;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8c710439535so169563785a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 12:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770409657; x=1771014457; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJEG5+IvmUNSgO2ajEXN272j/IVQU0nvf4fsjiRxLeY=;
        b=WJB6rug0GGfC1G1fx8+n552mA4dM9f63o8/uT0L4f6kPPYEyuKyeB1BcOPbcDxs92e
         njxMLB9+XPI5isRchdhYWu0PSC4k3wVMJ4ejYhoWmEBNyEfHLBo+xh/AkWg+QEGTc8oC
         JpQhyewqNMctidKx2uhyzlpXT0U0M6ALnZR2xvAu12conWN4wm+S2ZPgWW/3NrNFV1ZV
         4NgYxay1fly+1qt81bGmBVYaEWN6z3CExcL99fFrEBDo3z6PR0sS8ymDgqI7oso31vCt
         I/7Q7Gbu1YDah1z6uba//OHX4DGUnxq34hXBNB4L/N6PvdHkd7dUKqXwU+SizDLlYAYi
         3waw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770409657; x=1771014457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DJEG5+IvmUNSgO2ajEXN272j/IVQU0nvf4fsjiRxLeY=;
        b=r8Td26nITNtNkxz+ri1GIwLx2vHSvk42DBqpEzRxP5TQAcbv1GdCRvpeEkgYhsHHPk
         UqKQKfdABakP5L+n+e5hDoAHNxushseA1FRl8VIy6Wqnztz7EP+lvJeQkQT4OqsFLkIj
         lEn7tDomm4tPt+qesMjmb60tM1NFyvrpiPT2bD79IAeJGmcdPqnpAyQdFbHIJdHZAhX2
         5GdOevcp7bDlmdp5UO/x2pBTbHFVEoVw8hIdU+IpG2iJHlEOmHsnTZbYywaVXp1J0DDE
         11EiE8B6XbR0hdMIl6U5hQvU7F6zuCfMZo7swtk0JZ4QGFwXUd3uc21enQLOoK6IrqE5
         NiLw==
X-Gm-Message-State: AOJu0YyxOzT9oRNEgDiiu1lSNhcSNTBjY0k8WLGrwE45rwzwefnK6vtI
	hNWvtYyDCUZJClLrd+bpPzOS5OtYEbaawIcoTixrPU428rhMWJlm38nAK+jUE9nr
X-Gm-Gg: AZuq6aKDlhUrOrXiHxKDBzvsQg/JDDbKR9GtyyEJOlGBKzFMnS52PmY/J7mjMZffxO5
	FRqkZ+qIKk8RxT+EEUaZW4q6aY1SpAju7ayqon2Tueam+g9GLsdIPhHliYViW+/bPLX5YXFZIsF
	mdx38tPqFGyDoF0hXgfI92vqCktDkEA3Wc1zSj8dn1NcqU1QHyOz0Zqup169vDLxhmZf3KshqlZ
	5ZO0zfaq6Z7ZWGHjGl2dSY9n+E3LdGY74/2PEcf/PVkHiZSDmt9VOrmbuz7PDTCiKiNVNxSoCMj
	c1dyAAwcQIIAsfqKkNMhJeJ3jU1zPRpFjFYSsadQfT/P1RmRvE6FAo88dQDcsqszQgZ/Eki1Bio
	m3c1vkVqTXxYAiE/bNA2A7Zy1g0/0Wr4tRMM+OCxTZNZMWNk0W4ltwoA/o0Qq6T5q2nzggsbdUO
	X+jtdmdUR3grdPXLv14jUqXNjtXuyKjPJMcu6AuVo/GLzDymtthv5rDwTFqZ6ou7bcFjCaw4om0
	jmUDqeYtiTrCCZ4oZOEhgPS9AsQ8J4OATwVaJ6eHGbk57E=
X-Received: by 2002:a05:622a:3ce:b0:506:1c5e:d1bb with SMTP id d75a77b69052e-50639928b10mr56364731cf.34.1770409656459;
        Fri, 06 Feb 2026 12:27:36 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-506392bf955sm22651541cf.25.2026.02.06.12.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 12:27:35 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 01/09] linux-yocto/6.12: update to v6.12.67
Date: Fri,  6 Feb 2026 15:27:19 -0500
Message-ID: <20260206202732.1080699-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206202732.1080699-1-bruce.ashfield@gmail.com>
References: <20260206202732.1080699-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 20:27:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230645

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    abf529abd660d Linux 6.12.67
    7c734ad868cea mm/fake-numa: handle cases with no SRAT info
    df63d31e9ae02 mm/page_alloc: prevent pcp corruption with SMP=n
    22056349e8ec9 mm/page_alloc: batch page freeing in decay_pcp_high
    48273ed85fa0a mm/page_alloc/vmstat: simplify refresh_cpu_vm_stats change detection
    ce358252a943c dmaengine: fsl-edma: Fix clk leak on alloc_chan_resources failure
    027d42b97e6eb phy: rockchip: inno-usb2: Fix a double free bug in rockchip_usb2phy_probe()
    10f07114483d6 phy: phy-rockchip-inno-usb2: Use dev_err_probe() in the probe path
    c5b13f0b10faa mm: numa,memblock: include <asm/numa.h> for 'numa_nodes_parsed'
    a76f5cafcca47 mm/fake-numa: allow later numa node hotplug
    d1beb4dd8b8d4 mm: kmsan: fix poisoning of high-order non-compound pages
    2d402c6cc966e selftests/bpf: Test invalid narrower ctx load
    058a0da4f6d91 bpf: Reject narrower access to pointer ctx fields
    16236b0b4a08f mm/damon/sysfs-scheme: cleanup access_pattern subdirs on scheme dir setup failure
    b831557a0d20d mm/damon/sysfs-scheme: cleanup quotas subdirs on scheme dir setup failure
    5ee8005f72c4b xfs: set max_agbno to allow sparse alloc of last full inode chunk
    8b0bb145d3bc2 btrfs: fix deadlock in wait_current_trans() due to ignored transaction type
    68f7f10156fca HID: intel-ish-hid: Fix -Wcast-function-type-strict in devm_ishtp_alloc_workqueue()
    e79b03d386341 HID: intel-ish-hid: Use dedicated unbound workqueues to prevent resume blocking
    23133e0470d28 dmaengine: ti: k3-udma: fix device leak on udma lookup
    f810132e82558 dmaengine: ti: dma-crossbar: fix device leak on am335x route allocation
    e50b9bf91d1f3 dmaengine: ti: dma-crossbar: fix device leak on dra7x route allocation
    f45cafe3b6bfb dmaengine: stm32: dmamux: fix OF node leak on route allocation failure
    2fb10259d4efb dmaengine: stm32: dmamux: fix device leak on route allocation
    9969db4816aed dmaengine: sh: rz-dmac: Fix rz_dmac_terminate_all()
    01b1d781394fc dmaengine: qcom: gpi: Fix memory leak in gpi_peripheral_config()
    618a8229911ea dmaengine: lpc32xx-dmamux: fix device leak on route allocation
    992eb8055a6e5 dmaengine: lpc18xx-dmamux: fix device leak on route allocation
    0c97ff108f825 dmaengine: idxd: fix device leaks on compat bind and unbind
    8f7a391211381 dmaengine: dw: dmamux: fix OF node leak on route allocation failure
    db6f1d6d31711 dmaengine: bcm-sba-raid: fix device leak on probe
    6a86cf2c09e14 dmaengine: at_hdmac: fix device leak on of_dma_xlate()
    aca18ac3332b0 dmaengine: apple-admac: Add "apple,t8103-admac" compatible
    5319234215729 LoongArch: dts: loongson-2k2000: Add default interrupt controller address cells
    4df476a33687b LoongArch: dts: loongson-2k1000: Fix i2c-gpio node names
    9cce27181e9ad LoongArch: dts: loongson-2k1000: Add default interrupt controller address cells
    94b010200a3c9 LoongArch: dts: loongson-2k0500: Add default interrupt controller address cells
    ef4af7597fd8b drm/vmwgfx: Fix an error return check in vmw_compat_shader_add()
    04218cd68d150 drm/panel-simple: fix connector type for DataImage SCF0700C48GGU18 panel
    6a4e619c4209e drm/nouveau/disp/nv50-: Set lock_core in curs507a_prepare
    819c417a30aa7 drm/amdkfd: fix a memory leak in device_queue_manager_init()
    8140ac7c55e75 drm/amd: Clean up kfd node on surprise disconnect
    ae5b1d291c814 drm/amd/display: Bump the HDMI clock to 340MHz
    df7a49b328928 LoongArch: Fix PMU counter allocation for mixed-type event groups
    5651c0c391c00 mm/damon/sysfs: cleanup attrs subdirs on context dir setup failure
    654fa76032eee mm/page_alloc: make percpu_pagelist_high_fraction reads lock-free
    550c228cb0e83 mm/zswap: fix error pointer free in zswap_cpu_comp_prepare()
    a705886ac8ef2 nvme: fix PCIe subsystem reset controller state transition
    05cea40d333bd x86/resctrl: Fix memory bandwidth counter width for Hygon
    56377881cd94d x86/resctrl: Add missing resctrl initialization for Hygon
    469f8fe4c87e4 i2c: riic: Move suspend handling to NOIRQ phase
    eaff85ada8526 tcpm: allow looking for role_sw device in the main node
    df643bfe1d808 EDAC/i3200: Fix a resource leak in i3200_probe1()
    4433ddc3700ce EDAC/x38: Fix a resource leak in x38_probe1()
    0e66a004a3632 hrtimer: Fix softirq base check in update_needs_ipi()
    8e8542c539927 ext4: fix iloc.bh leak in ext4_xattr_inode_update_ref
    60f7e00894350 ASoC: codecs: wsa881x: fix unnecessary initialisation
    2617495ba77ba nvme-pci: disable secondary temp for Wodposit WPBSNM8
    7f78a77c3e16a USB: serial: ftdi_sio: add support for PICAXE AXE027 cable
    fe9175e9127f4 USB: serial: option: add Telit LE910 MBIM composition
    5400370f29b68 USB: OHCI/UHCI: Add soft dependencies on ehci_platform
    17b7ddee0eb40 usb: core: add USB_QUIRK_NO_BOS for devices that hang on BOS descriptor
    f07f660d52cf7 usb: dwc3: Check for USB4 IP_NAME
    40a753a906787 phy: tegra: xusb: Explicitly configure HS_DISCON_LEVEL to 0x7
    28ec201d87454 phy: rockchip: inno-usb2: fix disconnection in gadget mode
    24d759976a4a7 phy: freescale: imx8m-pcie: assert phy reset during power on
    66fcfceee2549 phy: ti: gmii-sel: fix regmap leak on probe failure
    9659ba4217de2 phy: rockchip: inno-usb2: fix communication disruption in gadget mode
    bba9e08d189e4 x86/kaslr: Recognize all ZONE_DEVICE users as physaddr consumers
    b11dfb7708f21 lib/buildid: use __kernel_read() for sleepable context
    87c3ced649fef xfs: Fix the return value of xfs_rtcopy_summary()
    cb2a610867bc3 net: can: j1939: j1939_xtp_rx_rts_session_active(): deactivate session upon receiving the second rts
    ca99392876e4e can: ctucanfd: fix SSP_SRC in cases when bit-rate is higher than 1 MBit.
    08624b7206ddb can: gs_usb: gs_usb_receive_bulk_callback(): fix URB memory leak
    d59ba448ccd59 null_blk: fix kmemleak by releasing references to fault configfs items
    e3073d119c0bb ALSA: pcm: Improve the fix for race of buffer access at PCM OSS layer
    bfa97e3cc0692 scsi: core: Fix error handler encryption support
    42ba3197a5d2b io_uring: move local task_work in exit cancel loop
    7934cb03dc233 drm/amd/display: mark static functions noinline_for_stack
    f394aa2e4217e ASoC: codecs: wsa883x: fix unnecessary initialisation
    bdced577da71b bridge: mcast: Fix use-after-free during router port configuration
    bb719f86be14b HID: usbhid: paper over wrong bNumDescriptor field
    36c627d3a2ba6 i2c: qcom-geni: make sure I2C hub controllers can't use SE DMA
    4b93712e96be1 dmaengine: omap-dma: fix dma_pool resource leak in error paths
    69566a1b88d91 selftests/landlock: Properly close a file descriptor
    0a7f3d4c9d5d4 phy: broadcom: ns-usb3: Fix Wvoid-pointer-to-enum-cast warning (again)
    64bf182dfb429 selftests/landlock: Remove invalid unix socket bind()
    68495f89a19b6 selftests/landlock: Fix TCP bind(AF_UNSPEC) test case
    fe2401c5d8215 phy: ti: da8xx-usb: Handle devm_pm_runtime_enable() errors
    b91c9f6bfb04e phy: stm32-usphyc: Fix off by one in probe()
    d50a9b7fd0729 phy: qcom-qusb2: Fix NULL pointer dereference on early suspend
    742de96d936ee phy: drop probe registration printks
    00dc370dfba94 phy: phy-snps-eusb2: refactor constructs names
    2b36202354f7f phy: fsl-imx8mq-usb: Clear the PCS_TX_SWING_FULL field before using it
    99dccb81cba85 dmaengine: xilinx_dma: Fix uninitialized addr_width when "xlnx,addrwidth" property is missing
    cb2c9c4bb1322 dmaengine: tegra-adma: Fix use-after-free
    606ea969e7829 dmaengine: xilinx: xdma: Fix regmap max_register
    a1bf8ea50cbc4 mm, kfence: describe @slab parameter in __kfence_obj_info()
    d11475ea5c2a5 textsearch: describe @list member in ts_ops search
    7a01b91ad6327 mm: describe @flags parameter in memalloc_flags_save()
    efb769dd9e479 drm/amd/pm: fix smu overdrive data type wrong issue on smu 14.0.2
    e35a9085b4808 ASoC: tlv320adcx140: fix word length
    61757f5191daa ASoC: tlv320adcx140: fix null pointer
    fa4744e659e14 ASoC: sdw_utils: cs42l43: Enable Headphone pin for LINEOUT jack type
    362e269bb03f7 net/sched: sch_qfq: do not free existing class in qfq_change_class()
    1e9d2b422fb68 selftests: drv-net: fix RPS mask handling for high CPU numbers
    2684610a9c9c5 ipv6: Fix use-after-free in inet6_addr_del().
    4cd55c609e85a net: hv_netvsc: reject RSS hash key programming without RX indirection table
    29a3c30b911f0 ALSA: hda/cirrus_scodec_test: Fix incorrect setup of gpiochip
    aa05a8371ae4a net: octeon_ep_vf: fix free_irq dev_id mismatch in IRQ rollback
    bb4fa4c0b54aa btrfs: fix memory leaks in create_space_info() error paths
    190d5a7c4fe42 btrfs: introduce btrfs_space_info sub-group
    d046ff8e554e4 btrfs: factor out check_removing_space_info() from btrfs_free_block_groups()
    3351d4825185b btrfs: factor out init_space_info() from create_space_info()
    32e93a14170a2 net/mlx5e: Restore destroying state bit after profile cleanup
    a7625bacaa8c8 net/mlx5e: Pass netdev to mlx5e_destroy_netdev instead of priv
    dcb2ad755a16c net/mlx5e: Don't store mlx5e_priv in mlx5e_dev devlink priv
    dad52950b409d net/mlx5e: Fix crash on profile change rollback failure
    b7e11383ef3cf vsock/test: add a final full barrier after run all tests
    aa57bfea4674e ipv4: ip_gre: make ipgre_header() robust
    8518712a2ca95 macvlan: fix possible UAF in macvlan_forward_source()
    dfd1f962f2773 net: update netdev_lock_{type,name}
    df5ffde966931 ip6_tunnel: use skb_vlan_inet_prepare() in __ip6_tnl_rcv()
    6dabb5b89ccec net: bridge: annotate data-races around fdb->{updated,used}
    db00636643e66 btrfs: send: check for inline extents in range_is_hole_in_parent()
    3def524315071 nvme-tcp: fix NULL pointer dereferences in nvmet_tcp_build_pdu_iovec
    ba45e3d6b02c9 can: etas_es58x: allow partial RX URB allocation to succeed
    c6dc745bba80e PM: EM: Fix incorrect description of the cost field in struct em_perf_state
    b0c5a56de1951 drm/vmwgfx: Merge vmw_bo_release and vmw_bo_free functions
    0e036606b29fb pnfs/blocklayout: Fix memory leak in bl_parse_scsi()
    86da7efd12295 pnfs/flexfiles: Fix memory leak in nfs4_ff_alloc_deviceid_node()
    49d352bc263fe NFS: Fix a deadlock involving nfs_release_folio()
    a316fd9d3065b pNFS: Fix a deadlock when returning a delegation during open()
    a2a3c7bf2c0cd xfrm: set ipv4 no_pmtu_disc flag only on output sa when direction is set
    f93a187c255f5 xfrm: Fix inner mode lookup in tunnel mode GSO segmentation
    cce714dffcc6e ASoC: codecs: wsa884x: fix codec initialisation
    f577508cc8a0a x86/fpu: Clear XSTATE_BV[i] in guest XSAVE state whenever XFD[i]=1
    d6bb04690b5be Revert "gfs2: Fix use of bio_chain"
    81dcb27e9b596 efi/cper: Fix cper_bits_to_str buffer handling and return value
    1f819393de23f firmware: imx: scu-irq: Set mu_resource_id before get handle

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index c463840c80..4e0f65a6e4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e9cbfbc05015c935e7bc4991c443602122f4b819"
-SRCREV_meta ?= "46ae7e7d4ce1ee55091957bff63e0f54a761a93d"
+SRCREV_machine ?= "2fde7a6e952c5a300a8cd5e55072e24a6eb04b25"
+SRCREV_meta ?= "a1aa7c4442863bf6c0f93059e7d7f26673b36aec"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.66"
+LINUX_VERSION ?= "6.12.67"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index f5610a2d41..95bd7acb5a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.66"
+LINUX_VERSION ?= "6.12.67"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "59d7360e98794225985c1da95ec614563320c61b"
-SRCREV_meta ?= "46ae7e7d4ce1ee55091957bff63e0f54a761a93d"
+SRCREV_machine ?= "2ef0e43d135dd1105527bd541b5f51f3b7c090d7"
+SRCREV_meta ?= "a1aa7c4442863bf6c0f93059e7d7f26673b36aec"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index fbb4f31107..3593b03783 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "6a83054dc7e21d30a030ef52b5ff4c2531c56bf2"
-SRCREV_machine:qemuarm64 ?= "59d7360e98794225985c1da95ec614563320c61b"
-SRCREV_machine:qemuloongarch64 ?= "59d7360e98794225985c1da95ec614563320c61b"
-SRCREV_machine:qemumips ?= "033446da85710e7854f8bbca5b4058d3d158d218"
-SRCREV_machine:qemuppc ?= "59d7360e98794225985c1da95ec614563320c61b"
-SRCREV_machine:qemuriscv64 ?= "59d7360e98794225985c1da95ec614563320c61b"
-SRCREV_machine:qemuriscv32 ?= "59d7360e98794225985c1da95ec614563320c61b"
-SRCREV_machine:qemux86 ?= "59d7360e98794225985c1da95ec614563320c61b"
-SRCREV_machine:qemux86-64 ?= "59d7360e98794225985c1da95ec614563320c61b"
-SRCREV_machine:qemumips64 ?= "57df96df5815eeedc9ab958e7464cf43c7494053"
-SRCREV_machine ?= "59d7360e98794225985c1da95ec614563320c61b"
-SRCREV_meta ?= "46ae7e7d4ce1ee55091957bff63e0f54a761a93d"
+SRCREV_machine:qemuarm ?= "092bf8c4946aa1381618679900f184571039afd7"
+SRCREV_machine:qemuarm64 ?= "2ef0e43d135dd1105527bd541b5f51f3b7c090d7"
+SRCREV_machine:qemuloongarch64 ?= "2ef0e43d135dd1105527bd541b5f51f3b7c090d7"
+SRCREV_machine:qemumips ?= "54775803c878713b4b13e4b76f188856d4e59707"
+SRCREV_machine:qemuppc ?= "2ef0e43d135dd1105527bd541b5f51f3b7c090d7"
+SRCREV_machine:qemuriscv64 ?= "2ef0e43d135dd1105527bd541b5f51f3b7c090d7"
+SRCREV_machine:qemuriscv32 ?= "2ef0e43d135dd1105527bd541b5f51f3b7c090d7"
+SRCREV_machine:qemux86 ?= "2ef0e43d135dd1105527bd541b5f51f3b7c090d7"
+SRCREV_machine:qemux86-64 ?= "2ef0e43d135dd1105527bd541b5f51f3b7c090d7"
+SRCREV_machine:qemumips64 ?= "7ebd0fca6c601144b7cc07dd0e4c06f6ff93f8c0"
+SRCREV_machine ?= "2ef0e43d135dd1105527bd541b5f51f3b7c090d7"
+SRCREV_meta ?= "a1aa7c4442863bf6c0f93059e7d7f26673b36aec"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "f6044d1fd846ed1ae457975738267214b538a222"
+SRCREV_machine:class-devupstream ?= "abf529abd660d8ccad46dd8c8f20e93db6134f5f"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.66"
+LINUX_VERSION ?= "6.12.67"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


