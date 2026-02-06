Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5728CEE6B5E
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 20:27:51 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20.1770409665107320164
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 12:27:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DXfJex8y;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8ca3807494eso166689285a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 12:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770409664; x=1771014464; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gm9iIKaJKiIoVsYiNZjtBX7l0ZQYQqAzvbEF8R180ls=;
        b=DXfJex8yaD3a68M2j4ZTgGu4U/pa2EVdsDl/JRYP53PEUuXe3l/dD/93xv5NIc/MbO
         hjC1zivgou9UezLWQJ1RTtYyaAfd/XaTzVFb/ArRWckagHcI+aQSm9nnfmPAuvpLuhYa
         81Nk8YgqB0p2aSlXNNOBg3drLwoQl0JThSIIWOgPhT1iX1WIUH4iQbr54bEGckHZuUVv
         qVam5uhpOge6uwD4/QbLsSl9f2qhvB/gWuNwGGBUOek24B7gHE46YpVJv8P6WsSQry4F
         /svsKxUhXcIAUqDG4Qj+n0TurdveKiNy8J3BojpMyU+1/xcmsIhFoOx3+64KQuZP5FvM
         4jdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770409664; x=1771014464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gm9iIKaJKiIoVsYiNZjtBX7l0ZQYQqAzvbEF8R180ls=;
        b=LbXWQRx6WyRsD7uZbZwVLboGTmsLMD8Ytsi7TKUjNaQ95nNqrrUv4VhymZIGw/tdLA
         vSYIoVjjJL8f6bH7zo4+6yiuU6r/IpmvOq3ezryhai45K/I4d397RbCiMN6i+XujERDw
         EnlvW+xcQSnZ0ENOAxcUPHm7CeiV8/LJJjIrtfnmJRQ4+IBstNwf98LQezhXsepjb7K3
         QGPIWDZtLZRujDhWAod5SxgvG7aeJ4yE9PeBZMx90Rr4eyG7MiCKiY92TvFP6FyXBDr1
         oLUkNFdXd1C1sfm7qQgaSXr79y9+tfNKMAli6zBRZ/eL/z1kecwuME/3v2ukR0XACedt
         c5Gg==
X-Gm-Message-State: AOJu0YyGRnARCH/APiYKN0sW1LUsFldnn1z5KD7xwyXKxKbXnoQ7/4IX
	HIXJTzKQL6xtE+FHryCb82pzzZusgotiHeKqEvTTA49mekZjFWMhBY1kpFLjhRBW
X-Gm-Gg: AZuq6aJbWeTIpTZnRKkjpuFKTe3RP3KAk+nA1jdoEAzYNdjl8i5L0KNIb6sFKifte4H
	xd++KzSxaNeLNpEj6JY9V+GLx0/AHJRoNGCLfBoAHuhCBZTdeg66ceEFh5n4s9YQA81xjYgNHxn
	YuXebiBsdHiZ4/B8GHmrRnZeuRHFrXPGbUT1T+ZazOlAILHyIl5Cfw7A6nzYJrY2fNYJRXErwdE
	tim3LcSlPvlq7C8T5ICinAnplsTSiefvIWYQgVk2USYsURQzX6krRKNB4w1SA4RIvSHObZ6HYK/
	gLX+gGktOCNh7xBzm4IM6uvVifp+a+O2LiFu7ii9jA8t6K1EiU9Tpdel9RTZ7Y29IniVcOWK4li
	N6Vv88sbUaa6BwxHD7Y4GPYifX/fzUfscnAFMnjbxx1697c7US7fl77OCrFYajUQzGIn0k/ZaFL
	6WrVQQs9EC62NccFoXWfaV3B4tHna3xu6qTINz9Rl8Yz9fwfIcgRvBNJN2RXLdUpDdniJMG4yZC
	sjpnbFBt0JEYT+yAQp3Gi7AsND7omvbVJ+DYYCr27nv8+0=
X-Received: by 2002:a05:622a:130e:b0:501:47d3:2176 with SMTP id d75a77b69052e-5063990da85mr51111841cf.26.1770409663953;
        Fri, 06 Feb 2026 12:27:43 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-506392bf955sm22651541cf.25.2026.02.06.12.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 12:27:43 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 05/09] linux-yocto/6.18: update to v6.18.7
Date: Fri,  6 Feb 2026 15:27:23 -0500
Message-ID: <20260206202732.1080699-6-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206202732.1080699-1-bruce.ashfield@gmail.com>
References: <20260206202732.1080699-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 20:27:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230648

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.18 to the latest korg -stable release that comprises
the following commits:

    5dfbc5357c34b Linux 6.18.7
    d6a25e6ee3ec3 iommu/sva: include mmu_notifier.h header
    2d1bf4a7b8ed8 Revert "functionfs: fix the open/removal races"
    3098f8f7c7b06 mm/page_alloc: prevent pcp corruption with SMP=n
    baea24956aea9 mm/page_alloc: batch page freeing in decay_pcp_high
    2a72a8ddf1888 mm/page_alloc/vmstat: simplify refresh_cpu_vm_stats change detection
    9ac63333d6007 btrfs: fix deadlock in wait_current_trans() due to ignored transaction type
    7e58addb8e053 HID: intel-ish-hid: Fix -Wcast-function-type-strict in devm_ishtp_alloc_workqueue()
    3d72fadb764c4 HID: intel-ish-hid: Use dedicated unbound workqueues to prevent resume blocking
    9f0a7ab700f86 iommu/sva: invalidate stale IOTLB entries for kernel address space
    b3039c526f3e1 mm: introduce deferred freeing for kernel page tables
    a1593c90896ba x86/mm: use pagetable_free()
    c32806bf45b62 mm: introduce pure page table freeing function
    b63c129bc3adb x86/mm: use 'ptdesc' when freeing PMD pages
    83ce8bf84846a mm: actually mark kernel page table pages
    1ca0f9e97f315 mm: add a ptdesc flag to mark kernel page tables
    b3bbbf9da38c2 dmaengine: ti: k3-udma: fix device leak on udma lookup
    30352277d8e09 dmaengine: ti: dma-crossbar: fix device leak on am335x route allocation
    61e8970b0de16 dmaengine: ti: dma-crossbar: fix device leak on dra7x route allocation
    f45b1d8bf9d0a dmaengine: stm32: dmamux: fix OF node leak on route allocation failure
    3ef52d31cce8b dmaengine: stm32: dmamux: fix device leak on route allocation
    8dd65e98ce209 dmaengine: sh: rz-dmac: Fix rz_dmac_terminate_all()
    926d1666420c2 dmaengine: sh: rz-dmac: fix device leak on probe failure
    55a67ba5ac4ce dmaengine: qcom: gpi: Fix memory leak in gpi_peripheral_config()
    9249462c55d56 dmaengine: lpc32xx-dmamux: fix device leak on route allocation
    1e47d80f6720f dmaengine: lpc18xx-dmamux: fix device leak on route allocation
    a7226fd61def7 dmaengine: idxd: fix device leaks on compat bind and unbind
    dd5d96722a967 dmaengine: fsl-edma: Fix clk leak on alloc_chan_resources failure
    eabe40f8a53c2 dmaengine: dw: dmamux: fix OF node leak on route allocation failure
    9b3cff9f4007a dmaengine: cv1800b-dmamux: fix device leak on route allocation
    2ed1a9de1f2d7 dmaengine: bcm-sba-raid: fix device leak on probe
    f3c23b7e94134 dmaengine: at_hdmac: fix device leak on of_dma_xlate()
    3706be7cbcd5f dmaengine: apple-admac: Add "apple,t8103-admac" compatible
    fc53a66227af0 LoongArch: KVM: Fix kvm_device leak in kvm_pch_pic_destroy()
    5defcc2f9c22e LoongArch: KVM: Fix kvm_device leak in kvm_ipi_destroy()
    e94ec9661c582 LoongArch: KVM: Fix kvm_device leak in kvm_eiointc_destroy()
    a227c3c98f092 LoongArch: dts: loongson-2k2000: Add default interrupt controller address cells
    8a692ca14f4ca LoongArch: dts: loongson-2k1000: Fix i2c-gpio node names
    dea25e8f6b744 LoongArch: dts: loongson-2k1000: Add default interrupt controller address cells
    aa866e4a13080 LoongArch: dts: loongson-2k0500: Add default interrupt controller address cells
    621fcd0aec180 drm/vmwgfx: Fix an error return check in vmw_compat_shader_add()
    cf60e6b1bf0c3 drm/sysfb: Remove duplicate declarations
    9c676c7a054bc drm/panel: simple: restore connector_type fallback
    f7940d3ec1dc6 drm/panel-simple: fix connector type for DataImage SCF0700C48GGU18 panel
    d4373630fd331 drm/nouveau/disp/nv50-: Set lock_core in curs507a_prepare
    a92ef24071f39 drm/amdkfd: fix a memory leak in device_queue_manager_init()
    0080a3f3fd917 drm/amdgpu: make sure userqs are enabled in userq IOCTLs
    531b1b83cfa0b drm/amdgpu: Fix gfx9 update PTE mtype flag
    b705daaf5f8c4 drm/amd: Clean up kfd node on surprise disconnect
    568c29c7c7c83 drm/amd/display: Initialise backlight level values from hw
    26ed15a42b743 drm/amd/display: Bump the HDMI clock to 340MHz
    c1cc55ea5e956 LoongArch: dts: Describe PCI sideband IRQ through interrupt-extended
    5b14ce4975a02 LoongArch: Fix PMU counter allocation for mixed-type event groups
    78b4eb99751eb mm/damon/sysfs: cleanup attrs subdirs on context dir setup failure
    9dc11b365e4eb mm/damon/sysfs: cleanup intervals subdirs on attrs dir setup failure
    725d4fdaa01bd mm/damon/sysfs-scheme: cleanup access_pattern subdirs on scheme dir setup failure
    253b8f56667ff mm/damon/sysfs-scheme: cleanup quotas subdirs on scheme dir setup failure
    23b061f421eef mm/damon/core: remove call_control in inactive contexts
    0e8838c91e24f mm/page_alloc: make percpu_pagelist_high_fraction reads lock-free
    2ff7e1d125f79 mm/zswap: fix error pointer free in zswap_cpu_comp_prepare()
    2a0db14ff1bc7 mm: numa,memblock: include <asm/numa.h> for 'numa_nodes_parsed'
    b5cb343f0c3d0 mm: kmsan: fix poisoning of high-order non-compound pages
    17f95d348589b nvme: fix PCIe subsystem reset controller state transition
    43d8f1f001072 x86/resctrl: Fix memory bandwidth counter width for Hygon
    1144298c10089 x86/resctrl: Add missing resctrl initialization for Hygon
    0b4c0fbbe00b7 i2c: riic: Move suspend handling to NOIRQ phase
    bd4e97674582a tcpm: allow looking for role_sw device in the main node
    51afd139fac44 EDAC/i3200: Fix a resource leak in i3200_probe1()
    3981650922417 EDAC/x38: Fix a resource leak in x38_probe1()
    d53b8e05be46a hrtimer: Fix softirq base check in update_needs_ipi()
    06e26287f2e34 ext4: fix iloc.bh leak in ext4_xattr_inode_update_ref
    d1b24a57662b6 ext4: fix ext4_tune_sb_params padding
    5caac66da5ba8 ASoC: codecs: wsa881x: fix unnecessary initialisation
    2de213de61031 nvme-pci: disable secondary temp for Wodposit WPBSNM8
    a045dab08049e USB: serial: ftdi_sio: add support for PICAXE AXE027 cable
    37bbcfa2bac9b USB: serial: option: add Telit LE910 MBIM composition
    525779e2df9e5 USB: OHCI/UHCI: Add soft dependencies on ehci_platform
    6e4663c6ec273 usb: core: add USB_QUIRK_NO_BOS for devices that hang on BOS descriptor
    5468051245c23 usb: dwc3: Check for USB4 IP_NAME
    01120b22c57c5 usb: gadget: uvc: fix req_payload_size calculation
    aee473246134b usb: gadget: uvc: fix interval_duration calculation
    34f6634dba87e xhci: sideband: don't dereference freed ring when removing sideband endpoint
    11c82acb4876c usb: host: xhci-tegra: Use platform_get_irq_optional() for wake IRQs
    69d1c05268a86 phy: tegra: xusb: Explicitly configure HS_DISCON_LEVEL to 0x7
    b74edae2a0c7a phy: fsl-imx8mq-usb: fix typec orientation switch when built as module
    e26755512623f phy: rockchip: inno-usb2: fix disconnection in gadget mode
    33194f81b6867 phy: freescale: imx8m-pcie: assert phy reset during power on
    efe92ee7a111f phy: rockchip: inno-usb2: Fix a double free bug in rockchip_usb2phy_probe()
    8b125923f4ea5 phy: ti: gmii-sel: fix regmap leak on probe failure
    d51f1db5a5f8c phy: rockchip: inno-usb2: fix communication disruption in gadget mode
    5a08dc1d8de3f x86/kaslr: Recognize all ZONE_DEVICE users as physaddr consumers
    568aeb3476c77 lib/buildid: use __kernel_read() for sleepable context
    ccc578d2e1540 virtio-net: don't schedule delayed refill worker
    ccd18d250ad8f xfs: Fix the return value of xfs_rtcopy_summary()
    bca07e57e4729 xfs: set max_agbno to allow sparse alloc of last full inode chunk
    9aef476717994 ftrace: Do not over-allocate ftrace memory
    ab09a7816c746 tools/testing/selftests: fix gup_longterm for unknown fs
    3a1c3cd770f48 tools/testing/selftests: add forked (un)/faulted VMA merge tests
    6ca76572c6049 tools/testing/selftests: add tests for !tgt, src mremap() merges
    6121b7564c725 net: can: j1939: j1939_xtp_rx_rts_session_active(): deactivate session upon receiving the second rts
    d922e7c5bb642 can: ctucanfd: fix SSP_SRC in cases when bit-rate is higher than 1 MBit.
    9f669a38ca708 can: gs_usb: gs_usb_receive_bulk_callback(): fix URB memory leak
    f1718da051282 null_blk: fix kmemleak by releasing references to fault configfs items
    ded801af28a99 ALSA: hda/realtek: Add quirk for HP Pavilion x360 to enable mute LED
    819268882628f ALSA: hda/tas2781: Skip UEFI calibration on ASUS ROG Xbox Ally X
    670cd1c2384ac ALSA: pcm: Improve the fix for race of buffer access at PCM OSS layer
    522a38f455bff selftests: kvm: try getting XFD and XSAVE state out of sync
    580581bd4af55 selftests: kvm: replace numbered sync points with actions
    2674004ddc1fb scsi: core: Fix error handler encryption support
    3667af036eead selftests/bpf: Fix selftest verif_scale_strobemeta failure with llvm22
    f57953023f736 HID: usbhid: paper over wrong bNumDescriptor field
    0754d5caac719 sched: Deadline has dynamic priority
    f32d9e475a41f sched/deadline: Avoid double update_rq_clock()
    cf40c73ab25bc i2c: imx-lpi2c: change to PIO mode in system-wide suspend/resume progress
    11ae04ebbe6e5 i2c: qcom-geni: make sure I2C hub controllers can't use SE DMA
    612cbe1aebb32 soundwire: bus: fix off-by-one when allocating slave IDs
    829b00481734d dmaengine: omap-dma: fix dma_pool resource leak in error paths
    d91cee31906a8 selftests/landlock: Properly close a file descriptor
    cdcaec67c55ef phy: broadcom: ns-usb3: Fix Wvoid-pointer-to-enum-cast warning (again)
    f73f911a4cdf0 landlock: Fix wrong type usage
    a45001796aa00 selftests/landlock: Remove invalid unix socket bind()
    c589bc6433667 selftests/landlock: Fix TCP bind(AF_UNSPEC) test case
    75ef8c94d4303 landlock: Fix TCP handling of short AF_UNSPEC addresses
    15dfbe9079987 phy: ti: da8xx-usb: Handle devm_pm_runtime_enable() errors
    7c27eaf183563 phy: stm32-usphyc: Fix off by one in probe()
    4ac15caa27ff8 phy: qcom-qusb2: Fix NULL pointer dereference on early suspend
    d279f7e17b6d4 phy: fsl-imx8mq-usb: Clear the PCS_TX_SWING_FULL field before using it
    f93c703368921 dmaengine: xilinx_dma: Fix uninitialized addr_width when "xlnx,addrwidth" property is missing
    be655c3736b35 dmaengine: tegra-adma: Fix use-after-free
    5e7ad329d259c dmaengine: xilinx: xdma: Fix regmap max_register
    974f241095aaf dmaengine: mmp_pdma: fix DMA mask handling
    94413a84067c3 NFS: Fix size read races in truncate, fallocate and copy offload
    8bc6d92b9a3ed drivers/dax: add some missing kerneldoc comment fields for struct dev_dax
    aec20f3aa684b mips: fix HIGHMEM initialization
    2a582a2ca8dae mm, kfence: describe @slab parameter in __kfence_obj_info()
    cf85a91aa82ea textsearch: describe @list member in ts_ops search
    cf6d059b53728 mm: describe @flags parameter in memalloc_flags_save()
    e1a30e1ab33fc drm/amdgpu/userq: Fix fence reference leak on queue teardown v2
    3d05c5e101521 drm/amdkfd: No need to suspend whole MES to evict process
    226d5d24c7ce1 drm/amd/pm: fix smu overdrive data type wrong issue on smu 14.0.2
    e17e32903684e drm/amd/display: Show link name in PSR status message
    a1aedf4053af7 drm/amdgpu: fix drm panic null pointer when driver not support atomic
    7481e7b9d7366 ASoC: tlv320adcx140: fix word length
    53bd838ed5950 ASoC: tlv320adcx140: fix null pointer
    07d6d21b85137 ASoC: sdw_utils: cs42l43: Enable Headphone pin for LINEOUT jack type
    e9d8f11652fa0 net/sched: sch_qfq: do not free existing class in qfq_change_class()
    a3a4296d8b5b1 selftests: drv-net: fix RPS mask handling for high CPU numbers
    8b6dcb565e419 ipv6: Fix use-after-free in inet6_addr_del().
    722de94521614 dst: fix races in rt6_uncached_list_del() and rt_del_uncached_list()
    11dd9a9ef4dc4 net: hv_netvsc: reject RSS hash key programming without RX indirection table
    78ee2958b096c ALSA: hda/cirrus_scodec_test: Fix test suite name
    aaa969ffe3b4d ALSA: hda/cirrus_scodec_test: Fix incorrect setup of gpiochip
    e1a4a4795c5a1 net: airoha: Fix typo in airoha_ppe_setup_tc_block_cb definition
    d441696397088 net: phy: motorcomm: fix duplex setting error for phy leds
    aa4c066229b05 net: octeon_ep_vf: fix free_irq dev_id mismatch in IRQ rollback
    1b3ed6c512cfd cxl/hdm: Fix potential infinite loop in __cxl_dpa_reserve()
    6cb008f1bb23e btrfs: fix memory leaks in create_space_info() error paths
    fcae8e1b9acd8 net/mlx5e: Restore destroying state bit after profile cleanup
    66a25f6b7c0bf net/mlx5e: Pass netdev to mlx5e_destroy_netdev instead of priv
    a3d4f87d41f51 net/mlx5e: Don't store mlx5e_priv in mlx5e_dev devlink priv
    e05b8084a20f6 net/mlx5e: Fix crash on profile change rollback failure
    f39ab11f118b2 vsock/test: add a final full barrier after run all tests
    554201ed0a8f4 ipv4: ip_gre: make ipgre_header() robust
    d6072557b90e0 block: zero non-PI portion of auto integrity buffer
    6dbead9c76771 macvlan: fix possible UAF in macvlan_forward_source()
    da6d0370eb74e net: update netdev_lock_{type,name}
    b9f915340f25c ip6_tunnel: use skb_vlan_inet_prepare() in __ip6_tnl_rcv()
    17071fb5cb9c2 net: bridge: annotate data-races around fdb->{updated,used}
    368251745679e Bluetooth: hci_sync: enable PA Sync Lost event
    39f83f1077231 btrfs: send: check for inline extents in range_is_hole_in_parent()
    65241e3ddda60 btrfs: release path before iget_failed() in btrfs_read_locked_inode()
    48f6cec8aa56b cxl/port: Fix target list setup for multiple decoders sharing the same dport
    374b095e265fa nvme-tcp: fix NULL pointer dereferences in nvmet_tcp_build_pdu_iovec
    6c5124a609890 can: etas_es58x: allow partial RX URB allocation to succeed
    5584aa64e8062 ipv4: ip_tunnel: spread netdev_lockdep_set_classes()
    754cfada1bbcb PM: EM: Fix incorrect description of the cost field in struct em_perf_state
    9a88b6c3c8695 drm/rockchip: vop2: Only wait for changed layer cfg done when there is pending cfgdone bits
    47244c00bc545 drm/rockchip: vop2: Add delay between poll registers
    d6ea0b7394a44 NFS/localio: Deal with page bases that are > PAGE_SIZE
    0674f22eef471 drm/vmwgfx: Merge vmw_bo_release and vmw_bo_free functions
    a91bdd21d5efb drm/vmwgfx: Fix KMS with 3D on HW version 10
    282061a7f9f30 drm/bridge: dw-hdmi-qp: Fix spurious IRQ on resume
    51926204465e7 pnfs/blocklayout: Fix memory leak in bl_parse_scsi()
    ed5d3f2f6885e pnfs/flexfiles: Fix memory leak in nfs4_ff_alloc_deviceid_node()
    19b4d9ab5e778 NFS: Fix a deadlock involving nfs_release_folio()
    d6c75aa9d6070 pNFS: Fix a deadlock when returning a delegation during open()
    b7f9587f317d9 xfrm: set ipv4 no_pmtu_disc flag only on output sa when direction is set
    df1fae862639f xfrm: Fix inner mode lookup in tunnel mode GSO segmentation
    704cced8eda44 io_uring: move local task_work in exit cancel loop
    ae48108c2310f virtio_net: Fix misalignment bug in struct virtnet_info
    a255ec07f91d4 drm/gud: fix NULL fb and crtc dereferences on USB disconnect
    67dfd9e8567cc ASoC: codecs: wsa883x: fix unnecessary initialisation
    afd7591a4ca92 ASoC: codecs: wsa884x: fix codec initialisation
    6711f723018cc rust: bitops: fix missing _find_* functions on 32-bit ARM
    eea6f395ca502 x86/fpu: Clear XSTATE_BV[i] in guest XSAVE state whenever XFD[i]=1
    c6a38672067b9 Revert "gfs2: Fix use of bio_chain"
    a685f246ad790 nvme-apple: add "apple,t8103-nvme-ans2" as compatible
    a2542fe353a40 efi/cper: Fix cper_bits_to_str buffer handling and return value
    58796d352d746 firmware: imx: scu-irq: Set mu_resource_id before get handle

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.18.bb              |  6 ++---
 .../linux/linux-yocto-tiny_6.18.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index 2a10815684..b6e1d081cc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2ec883ec1af76529a27558fde434a5ae64dee7ab"
-SRCREV_meta ?= "1fbfcbd8a3ce8df814f51ef8710fc0197ff01986"
+SRCREV_machine ?= "4cab0751277e181dc5d1b163b0e85f734725adfb"
+SRCREV_meta ?= "c809ea8463218ea51f3aee6a9471ef593407d4cf"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.18.6"
+LINUX_VERSION ?= "6.18.7"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index ce564d842c..e7f5c85688 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.18.inc
 
-LINUX_VERSION ?= "6.18.6"
+LINUX_VERSION ?= "6.18.7"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "3e243d2a1151b1ccb42f80f81c6d77f0af327a3d"
-SRCREV_meta ?= "1fbfcbd8a3ce8df814f51ef8710fc0197ff01986"
+SRCREV_machine ?= "bafdbc156dae11ada271e112c2e331d9f9b2653d"
+SRCREV_meta ?= "c809ea8463218ea51f3aee6a9471ef593407d4cf"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index daa0cb51d1..dc23819e6c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "ee78c602479902ccc042f3b2c6467a6a1b2010e1"
-SRCREV_machine:qemuarm64 ?= "3e243d2a1151b1ccb42f80f81c6d77f0af327a3d"
-SRCREV_machine:qemuloongarch64 ?= "3e243d2a1151b1ccb42f80f81c6d77f0af327a3d"
+SRCREV_machine:qemuarm ?= "3247ad9a8d55ba35c8707f44ff4e51c434a1feb7"
+SRCREV_machine:qemuarm64 ?= "bafdbc156dae11ada271e112c2e331d9f9b2653d"
+SRCREV_machine:qemuloongarch64 ?= "bafdbc156dae11ada271e112c2e331d9f9b2653d"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "3e243d2a1151b1ccb42f80f81c6d77f0af327a3d"
-SRCREV_machine:qemuriscv64 ?= "3e243d2a1151b1ccb42f80f81c6d77f0af327a3d"
-SRCREV_machine:qemuriscv32 ?= "3e243d2a1151b1ccb42f80f81c6d77f0af327a3d"
-SRCREV_machine:qemux86 ?= "3e243d2a1151b1ccb42f80f81c6d77f0af327a3d"
-SRCREV_machine:qemux86-64 ?= "3e243d2a1151b1ccb42f80f81c6d77f0af327a3d"
+SRCREV_machine:qemuppc ?= "bafdbc156dae11ada271e112c2e331d9f9b2653d"
+SRCREV_machine:qemuriscv64 ?= "bafdbc156dae11ada271e112c2e331d9f9b2653d"
+SRCREV_machine:qemuriscv32 ?= "bafdbc156dae11ada271e112c2e331d9f9b2653d"
+SRCREV_machine:qemux86 ?= "bafdbc156dae11ada271e112c2e331d9f9b2653d"
+SRCREV_machine:qemux86-64 ?= "bafdbc156dae11ada271e112c2e331d9f9b2653d"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "3e243d2a1151b1ccb42f80f81c6d77f0af327a3d"
-SRCREV_meta ?= "1fbfcbd8a3ce8df814f51ef8710fc0197ff01986"
+SRCREV_machine ?= "bafdbc156dae11ada271e112c2e331d9f9b2653d"
+SRCREV_meta ?= "c809ea8463218ea51f3aee6a9471ef593407d4cf"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "b6fe42bc55af3fb17c8c03def2f8a1f7fa907af6"
+SRCREV_machine:class-devupstream ?= "5dfbc5357c34bdf81c84aa78bc8e3d6d9ba10aad"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.18/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.18.6"
+LINUX_VERSION ?= "6.18.7"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


