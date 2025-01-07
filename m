Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF748E7719D
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 18:09:23 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.108.1736273357379032963
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 10:09:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ACdVHLWA;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ee8e8e29f6so18839020a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 10:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736273356; x=1736878156; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sl9mEZqkrNJQkNyiucGWvPUrzufwdJgscmBvOYIqc1E=;
        b=ACdVHLWAZBTv4WrL4dQ3A/0BGX86P5Q8Zqbx5SI1B+HgyadfRI5Dq7yECqwNHIutDy
         6bGcRTgMWIBNUEafwGOnMoedsVzDdb2CxVEMYS0BYRMdr24JxUIIUa780Fvsn5ouMUNw
         Sjj8C87TwdedZsh8q/VmtDXWdk0L8yT99Mz1EJfAZr7YuJWzzqykistct3IQtmHqrGY6
         nzXCJHQuZdB38WTrT4YJNKpGnMcEQOHTYI04vZN8Vkafkn/FjMXiUDA0FTYSOpiQu+Wm
         eHggH4WJbhTEPiVKDHCe0DRO5kzlSuwTLEP1/ahK3VuL0H0hOSluQ5jwRttcwF3O66Gh
         RyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736273356; x=1736878156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sl9mEZqkrNJQkNyiucGWvPUrzufwdJgscmBvOYIqc1E=;
        b=QWPsC4/JLb1h+qsc/V1Iu6QsLfKRgU6qdbd0lQqziOnbBtNLqjblEqM0VhLvDBR36x
         cOIo6qlAkkkM9q6KznNMQkBhBCoofU+xWeWPtoFBxrSJgyDDb5vJnJfpjf+gBI/d4gvz
         pZwSUiImFV7w66seFIr2SHZH/8m79WGa1ScXcmcVEVGEKOBAUKO/xozTDAYa9MpG2TGK
         F/+UKdLRGg/+Kozw55RDPv/dYg9tkIJ307ZutsRixHbVi0gT3SMaRrFichZIliYeUMxG
         T6ibsqBJBcnfF0eosW4f09bPxWcU20+1KTfsHLOwGUOx3eK970tHoFPg4MG5awasDsXz
         E+Cg==
X-Gm-Message-State: AOJu0YzlY0kCnpw5GRNdUIzKcIy0sg22I92Jg5PTot3TIi7MbpGG47Nv
	0NIlO+2/hIWt2DSegbJK+yKSERuOWN1OWj6RPZhVUsSy3AeFwWFl551cofsjjxqDxhMNHa7O2hr
	VpMo=
X-Gm-Gg: ASbGncux/tbnd75G/+e2HvWwLrupCoT8mPwQvJruigcJL25bLbKMjXZd+3m2ymaadwL
	VaYl3byKGYDl4usbsG2pbRg6T8e6KhRcRupm7HyvwNnT2h1DWIXhyYA8SmnoIQDtOzCtJeWzgLl
	0QN4fOlrA65Wab3mu8g/Os5PC04IQfsO5QEEw2U9JbnxErFGnYOO7l8MCmmU+X+BXPNvo2Bk1ZX
	oxq0Z8cXeawtzsWfvD/knpThK8ViTdMDZbEm543rV7NVQ==
X-Google-Smtp-Source: AGHT+IESmheKT0XOWzThS1W5CE4H+6937TU/ln6SWwG/t+fpcw6qEp7wkkUDB7Tr56sNDMr8ezj0/w==
X-Received: by 2002:a17:90b:2c85:b0:2ee:90a1:5d42 with SMTP id 98e67ed59e1d1-2f452d2fc15mr108952578a91.0.1736273355698;
        Tue, 07 Jan 2025 10:09:15 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f4413sm314166335ad.172.2025.01.07.10.09.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 10:09:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/19] linux-yocto/5.15: update to v5.15.174
Date: Tue,  7 Jan 2025 10:08:36 -0800
Message-ID: <d96738bdbc96ec9afa369eb8746684a940bba349.1736273200.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736273200.git.steve@sakoman.com>
References: <cover.1736273200.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 18:09:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209498

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    963e654022cc Linux 5.15.174
    2e29116c4596 Bluetooth: hci_core: Fix calling mgmt_device_connected
    5e71985e855c net/smc: Fix af_ops of child socket pointing to released memory
    5cedfe8aaf18 media: venus: vdec: fixed possible memory leak issue
    d3717cf6baa4 serial: amba-pl011: fix build regression
    d897650c5897 drm/amdgpu: rework resume handling for display (v2)
    e1896f381d27 drm/amd/display: Correct the defined value for AMDGPU_DMUB_NOTIFICATION_MAX
    9760b0c61e53 net: dsa: microchip: correct KSZ8795 static MAC table access
    686e05c9dbd6 Bluetooth: L2CAP: Fix uaf in l2cap_connect
    522328e80acf arm64: smccc: Remove broken support for SMCCCv1.3 SVE discard hint
    51d3d80a6dc3 arm64/sve: Discard stale CPU state when handling SVE traps
    221a2c898962 gve: Fixes for napi_poll when budget is 0
    154cf95664de scsi: core: Fix scsi_mode_select() buffer length handling
    7bdecbd49a5d Revert "drm/amdgpu: add missing size check in amdgpu_debugfs_gprwave_read()"
    b1453a5616c7 fou: remove warn in gue_gro_receive on unsupported protocol
    0b31e28fbd77 ima: Fix use-after-free on a dentry's dname.name
    801d64177faa crypto: hisilicon/qm - inject error before stopping queue
    1b5691014f30 ocfs2: Revert "ocfs2: fix the la space leak when unmounting an ocfs2 volume"
    c5cb98554c4c drm/amd/display: Check BIOS images before it is used
    b3cdb9b9f815 mmc: mtk-sd: Fix error handle of probe function
    85e50b4f9896 xhci: dbc: Fix STALL transfer event handling
    fbab85323192 mm/damon/vaddr: fix issue in damon_va_evenly_split_region()
    9a351255db26 mm/damon/vaddr-test: split a test function having >1024 bytes frame size
    a3eca3037e70 jffs2: Fix rtime decompressor
    bd384b04ad19 jffs2: Prevent rtime decompress memory corruption
    a0e0f67f2fc1 KVM: arm64: vgic-its: Clear ITE when DISCARD frees an ITE
    fd92260b7f68 KVM: arm64: vgic-its: Clear DTE when MAPD unmaps a device
    065e075d438f KVM: arm64: vgic-its: Add a data length check in vgic_its_save_*
    9e9f343615c0 Revert "unicode: Don't special case ignorable code points"
    d7e6934eb736 tracing/eprobe: Fix to release eprobe when failed to add dyn_event
    968757f1f45b btrfs: fix missing snapshot drew unlock when root is dead during swap activation
    38a4826f1bdf sched/core: Prevent wakeup of ksoftirqd during idle load balance
    6aeeac48fc1b sched/fair: Check idle_cpu() before need_resched() to detect ilb CPU turning busy
    d071dba5ddd2 sched/fair: Add NOHZ balancer flag for nohz.next_balance updates
    25fc82f3a868 sched/core: Remove the unnecessary need_resched() check in nohz_csd_func()
    7ff5af6bdb1e modpost: Add .irqentry.text to OTHER_SECTIONS
    973cfc7ea3f6 modpost: Include '.text.*' in TEXT_SECTIONS
    d0f2889ec52b misc: eeprom: eeprom_93cx6: Add quirk for extra read clock cycle
    ee68554d2c03 powerpc/prom_init: Fixup missing powermac #size-cells
    a7fd78075031 MIPS: Loongson64: DTS: Really fix PCIe port nodes for ls7a
    da4809b05b65 usb: chipidea: udc: handle USB Error Interrupt if IOC not set
    2d98fa2a50b8 i3c: Use i3cdev->desc->info instead of calling i3c_device_get_info() to avoid deadlock
    a436e75678bf PCI: Add ACS quirk for Wangxun FF5xxx NICs
    ade2062d5b53 PCI: Add 'reset_subordinate' to reset hierarchy below bridge
    67416562ae0d PCI: Detect and trust built-in Thunderbolt chips
    a6cddf68b340 i3c: mipi-i3c-hci: Mask ring interrupts before ring stop request
    a365de2fbfbe f2fs: fix f2fs_bug_on when uninstalling filesystem call f2fs_evict_inode.
    c710201af655 nvdimm: rectify the illogical code within nd_dax_probe()
    ff11b66cf848 pinctrl: qcom-pmic-gpio: add support for PM8937
    f7b0fc4b570a scsi: st: Add MTIOCGET and MTLOAD to ioctls allowed after device reset
    bbb47c06f011 scsi: st: Don't modify unknown block number in MTIOCGET
    b8283d52ed15 leds: class: Protect brightness_show() with led_cdev->led_access mutex
    2174bbc235f7 scsi: hisi_sas: Add cond_resched() for no forced preemption model
    02cef9720550 tracing: Use atomic64_inc_return() in trace_clock_counter()
    7ba51688437b pinctrl: freescale: fix COMPILE_TEST error with PINCTRL_IMX_SCU
    8a4534483e02 netpoll: Use rcu_access_pointer() in __netpoll_setup
    a7b8f71c7a29 net/neighbor: clear error in case strict check is not set
    4e83046d2bc9 rocker: fix link status detection in rocker_carrier_init()
    565dca66578a ASoC: hdmi-codec: reorder channel allocation list
    219960a48771 Bluetooth: hci_core: Fix not checking skb length on hci_acldata_packet
    dfb3f9d3f602 wifi: brcmfmac: Fix oops due to NULL pointer dereference in brcmf_sdiod_sglist_rw()
    0824dcc63580 wifi: ipw2x00: libipw_rx_any(): fix bad alignment
    76581147b05c drm/amdgpu: set the right AMDGPU sg segment limitation
    53b03a43a881 drm/amdgpu: skip amdgpu_device_cache_pci_state under sriov
    a3d408870bc1 jfs: add a check to prevent array-index-out-of-bounds in dbAdjTree
    9efe72eefd4c jfs: fix array-index-out-of-bounds in jfs_readdir
    6676034aa753 jfs: fix shift-out-of-bounds in dbSplit
    823d573f5450 jfs: array-index-out-of-bounds fix in dtReadFirst
    efe1b9bbf356 dma-debug: fix a possible deadlock on radix_lock
    081bc4fe23f9 drm/amdgpu: refine error handling in amdgpu_ttm_tt_pin_userptr
    905dc479b648 drm/amdgpu: Dereference the ATCS ACPI buffer
    80aa90210a7a drm/amdgpu: clear RB_OVERFLOW bit when enabling interrupts for vega20_ih
    1d42b11b7bb7 drm/panel: simple: Add Microchip AC69T88A LVDS Display panel
    b92521c314d2 wifi: ath5k: add PCI ID for Arcadyan devices
    61f1b977949b wifi: ath5k: add PCI ID for SX76X
    276a473c956f net: inet6: do not leave a dangling sk pointer in inet6_create()
    3e8258070b0f net: inet: do not leave a dangling sk pointer in inet_create()
    2b46994a6e76 net: ieee802154: do not leave a dangling sk pointer in ieee802154_create()
    1fe625f12d09 net: af_can: do not leave a dangling sk pointer in can_create()
    a8677028dd51 Bluetooth: L2CAP: do not leave dangling sk pointer on error in l2cap_sock_create()
    132e615bb1d7 af_packet: avoid erroring out after sock_init_data() in packet_create()
    3cc92d542384 net/sched: cbs: Fix integer overflow in cbs_set_port_rate()
    9681a5217b02 net: ethernet: fs_enet: Use %pa to format resource_size_t
    52637f8b7c42 net: fec_mpc52xx_phy: Use %pa to format resource_size_t
    8e9f76ddc20c samples/bpf: Fix a resource leak
    3caa244323a6 r8169: don't apply UDP padding quirk on RTL8126A
    6078d3ca132b drm/radeon/r600_cs: Fix possible int overflow in r600_packet3_check()
    f632b3be8ee8 drm/mcde: Enable module autoloading
    8c715f966406 drm: panel-orientation-quirks: Add quirk for AYA NEO 2 model
    c9c2cf983dc8 drm/vc4: hvs: Set AXI panic modes for the HVS
    e497edb8f31e soc: imx8m: Probe the SoC driver as platform driver
    0b16b2aa2242 media: cx231xx: Add support for Dexatek USB Video Grabber 1d19:6108
    afdfebd9bbe7 media: uvcvideo: Add a quirk for the Kaiweets KTI-W02 infrared camera
    ea6588abcc15 kcsan: Turn report_filterlist_lock into a raw_spinlock
    86680f33461a kselftest/arm64: Don't leak pipe fds in pac.exec_sign_all()
    d476931a6bbc btrfs: avoid unnecessary device path update for the same device
    06a92f810df8 s390/cpum_sf: Handle CPU hotplug remove during sampling
    ac98b8c10346 epoll: annotate racy check
    dc02407ea952 iommu/arm-smmu: Defer probe of clients after smmu device bound
    a9e371e03f08 ocfs2: update seq_file index in ocfs2_dlm_seq_next
    951c53931a91 mmc: core: Further prevent card detect during shutdown
    47de5d1bf378 mmc: sdhci-pci: Add DMI quirk for missing CD GPIO on Vexia Edu Atla 10 tablet
    f373a1898175 regmap: detach regmap from dev on regmap_exit
    4d03f705e9d7 xsk: fix OOB map writes when deleting elements
    f9f50a5792a6 dma-buf: fix dma_fence_array_signaled v4
    ad34306ac683 bpf: fix OOB devmap writes when deleting elements
    fb5fee35bdd1 bcache: revert replacing IS_ERR_OR_NULL with IS_ERR again
    48eb6e740494 nilfs2: fix potential out-of-bounds memory access in nilfs_find_entry()
    87bf3ea841a5 scsi: ufs: core: sysfs: Prevent div by zero
    694598a7828d scsi: qla2xxx: Remove check req_sg_cnt should be equal to rsp_sg_cnt
    ca36d9d53745 scsi: qla2xxx: Fix use after free on unload
    1f1cf3940a36 scsi: qla2xxx: Supported speed displayed incorrectly for VPorts
    66618696bcbb scsi: qla2xxx: Fix NVMe and NPIV connect issue
    7d9f66082b84 scsi: qla2xxx: Fix abort in bsg timeout
    1cc00b106611 ALSA: hda/realtek: Add support for Samsung Galaxy Book3 360 (NP730QFG)
    b89de14c9c80 ALSA: hda/realtek: Enable mute and micmute LED on HP ProBook 430 G8
    023ee962a690 ALSA: usb-audio: add mixer mapping for Corsair HS80
    1c176f5155ee arm64: ptrace: fix partial SETREGSET for NT_ARM_TAGGED_ADDR_CTRL
    dbcdadade0c2 tracing: Fix cmp_entries_dup() to respect sort() comparison rules
    faa0a1975a6f can: dev: can_set_termination(): allow sleeping GPIOs
    fb17d710c7a4 watchdog: rti: of: honor timeout-sec property
    2ed3e3a3ac06 HID: wacom: fix when get product name maybe null pointer
    eb6a5262ec66 bpf: Fix exact match conditions in trie_get_next_key()
    6155fac6d9ae bpf: Handle BPF_EXIST and BPF_NOEXIST for LPM trie
    c5327720a465 ocfs2: free inode when ocfs2_get_init_inode() fails
    c8504c0f1f80 drm/v3d: Enable Performance Counters before clearing them
    cd5106c77d6d spi: mpc52xx: Add cancel_work_sync before module remove
    2c84d183a448 tools: Override makefile ARCH variable if defined, but empty
    9bc69d38e3b8 ALSA: usb-audio: Notify xrun for low-latency mode
    9b9b61c5d0a2 ALSA: pcm: Avoid reference to status->state
    f0294f444afc ALSA: pcm: Add more disconnection checks at file ops
    0d6cd1151e26 tcp_bpf: Fix the sk_mem_uncharge logic in tcp_bpf_sendmsg
    ece859aac1d3 drm/sti: Add __iomem for mixer_dbg_mxn's parameter
    2bd350f0e74c bpftool: fix potential NULL pointer dereferencing in prog_dump()
    ca906853f6c7 bpftool: Remove asserts from JIT disassembler
    3cbde9287469 serial: amba-pl011: Fix RX stall when DMA is used
    e3769d2b62d0 serial: amba-pl011: Use port lock wrappers
    9f0ce8feecb9 dt-bindings: serial: rs485: Fix rs485-rts-delay property
    e9583ac84945 dt_bindings: rs485: Correct delay values
    ad4dfa7ea7f5 gpio: grgpio: Add NULL check in grgpio_probe
    7546c60a3786 gpio: grgpio: use a helper variable to store the address of ofdev->dev
    b65958284401 geneve: do not assume mac header is set in geneve_xmit_skb()
    c20f91bd9395 ethtool: Fix wrong mod state in case of verbose and no_mask bitset
    59a59da8de47 netfilter: nft_set_hash: skip duplicated elements pending gc run
    0e67805e805c netfilter: ipset: Hold module reference while requesting a module
    c7d644f76949 net: sched: fix erspan_opt settings in cls_flower
    4fe517643f52 igb: Fix potential invalid memory access in igb_init_module()
    d7804000d8b9 net/qed: allow old cards not supporting "num_images" to work
    f502a88fdd41 net/smc: fix LGR and link use-after-free issue
    ebfee3e153f6 net/smc: Limit backlog connections
    d2a4894f2385 tipc: Fix use-after-free of kernel socket in cleanup_bearer().
    bc3d4423def1 dccp: Fix memory leak in dccp_feat_change_recv
    0b8903e6c881 net/ipv6: release expired exception dst cached in socket
    4199dd78a598 can: j1939: j1939_session_new(): fix skb reference counting
    c6e778901d00 net: hsr: avoid potential out-of-bound access in fill_frame_info()
    f0f627fd6af2 net/sched: tbf: correct backlog statistic for GSO packets
    fb09c0cc058b ptp: Add error handling for adjfine callback in ptp_clock_adjtime
    36a9d94dac28 netfilter: x_tables: fix LED ID check in led_tg_check()
    d6e1776f51c9 ipvs: fix UB due to uninitialized stack access in ip_vs_protocol_init()
    6e2c9e417ef7 can: ems_usb: ems_usb_rx_err(): fix {rx,tx}_errors statistics
    1ed979b833df can: sun4i_can: sun4i_can_err(): fix {rx,tx}_errors statistics
    c56112f3e709 can: ifi_canfd: ifi_canfd_handle_lec_err(): fix {rx,tx}_errors statistics
    dd3ef4edcc89 can: m_can: m_can_handle_lec_err(): fix {rx,tx}_errors statistics
    46e062d62674 can: sun4i_can: sun4i_can_err(): call can_change_state() even if cf is NULL
    48d8223ff178 can: c_can: c_can_handle_bus_err(): update statistics if skb allocation fails
    f1977d763c9c can: do not increase rx statistics when generating a CAN rx error message frame
    f503436c5e3b can: peak_usb: CANFD: store 64-bits hw timestamps
    c90279de2b99 watchdog: mediatek: Make sure system reset gets asserted in mtk_wdt_restart()
    2663884d248d iTCO_wdt: mask NMI_NOW bit for update_no_reboot_bit() call
    be085075cf2c drm/etnaviv: flush shader L1 cache after user commandstream
    e98ff67f5a68 drm/sti: avoid potential dereference of error pointers
    f5804567cf96 drm/sti: avoid potential dereference of error pointers in sti_gdp_atomic_check
    31c857e7496d drm/sti: avoid potential dereference of error pointers in sti_hqvdp_atomic_check
    6a0648f96c3c btrfs: don't BUG_ON on ENOMEM from btrfs_lookup_extent_info() in walk_down_proc()
    0ab0a3ad24e9 nfsd: fix nfs4_openowner leak when concurrent nfsd4_open occur
    6cefcadd34e3 nfsd: make sure exp active before svc_export_show
    d63f0926b9a7 PCI: rockchip-ep: Fix address translation unit programming
    9f3ea5db09b0 dm thin: Add missing destroy_work_on_stack()
    23af63a55bf5 ovl: properly handle large files in ovl_security_fileattr
    b0c349a65c16 PCI: keystone: Add link up check to ks_pcie_other_map_bus()
    0cb21f1ea3a2 i3c: master: Fix miss free init_dyn_addr at i3c_master_put_i3c_addrs()
    a32d0e136664 scsi: ufs: exynos: Fix hibern8 notify callbacks
    7bb9fa6fe600 util_macros.h: fix/rework find_closest() macros
    ca687fdce5b9 s390/entry: Mark IRQ entries to fix stack depot warnings
    68e79b848196 ad7780: fix division by zero in ad7780_write_raw()
    d2b85ce0561f btrfs: ref-verify: fix use-after-free after invalid ref action
    c71d114ef68c btrfs: add a sanity check for btrfs root in btrfs_search_slot()
    6e2ac5f585a0 btrfs: add might_sleep() annotations
    ab6cfcf8ed2c quota: flush quota_release_work upon quota writeback
    7320429e48cd xfs: remove unknown compat feature check in superblock write validation
    bac5a74c31c2 xfs: fix log recovery when unknown rocompat bits are set
    584754f983d3 ASoC: fsl_micfil: fix the naming style for mask definition
    c3f4f4547fb2 sh: intc: Fix use-after-free bug in register_intc_controller()
    fe6cbf0b2ac3 sunrpc: clear XPRT_SOCK_UPD_TIMEOUT when reset transport
    f211501cfc2b SUNRPC: Replace internal use of SOCKWQ_ASYNC_NOSPACE
    197b613c9080 sunrpc: remove unnecessary test in rpc_task_set_client()
    7338c4377742 nfs: ignore SB_RDONLY when mounting nfs
    14d02aec5898 modpost: remove incorrect code in do_eisa_entry()
    60658fdb6540 rtc: ab-eoz9: don't fail temperature reads on undervoltage notification
    4950408793b1 9p/xen: fix release of IRQ
    db94e06c24cd 9p/xen: fix init sequence
    df2a7aa342f1 block: return unsigned int from bdev_io_min
    b7836529e059 jffs2: fix use of uninitialized variable
    4d9807048b85 ubifs: authentication: Fix use-after-free in ubifs_tnc_end_commit
    b1ee0aa4945c ubi: fastmap: Fix duplicate slab cache names while attaching
    2b19d2fd58be ubifs: Correct the total block count by deducting journal reservation
    246f621d3639 rtc: check if __rtc_read_time was successful in rtc_timer_do_work()
    7c6098bdb62a rtc: abx80x: Fix WDT bit position of the status register
    3b28fb1376aa rtc: st-lpc: Use IRQF_NO_AUTOEN flag in request_irq()
    2ab9639f16b0 NFSv4.0: Fix a use-after-free problem in the asynchronous open()
    fcf32ea8193f um: Always dump trace for specified task in show_stack
    a6294d601075 um: Fix the return value of elf_core_copy_task_fpregs
    1bd118c5f887 um: Fix potential integer overflow during physmem setup
    f5872a2a84ec rpmsg: glink: Propagate TX failures in intentless mode as well
    c7dac3af57e3 SUNRPC: make sure cache entry active before cache_show
    842f1c27a1ae NFSD: Prevent a potential integer overflow
    f78318f70e3c lib: string_helpers: silence snprintf() output truncation warning
    0247da93bf62 usb: dwc3: gadget: Fix looping of queued SG entries
    893f9ea3f6f1 usb: dwc3: gadget: Fix checking for number of TRBs left
    bc3c34362bef ALSA: hda/realtek: Apply quirk for Medion E15433
    0ac6cd6133a1 ALSA: hda/realtek: Fix Internal Speaker and Mic boost of Infinix Y4 Max
    ad78a3a11e66 ALSA: hda/realtek: Set PCBeep to default value for ALC274
    8c50311d8ab0 ALSA: hda/realtek: Update ALC225 depop procedure
    8799f4332a9f ALSA: pcm: Add sanity NULL check for the default mmap fault handler
    150dff3e1bf7 media: v4l2-core: v4l2-dv-timings: check cvt/gtf result
    41979fbb7ced soc: fsl: rcpm: fix missing of_node_put() in copy_ippdexpcr1_setting()
    ed228b74d8a5 media: wl128x: Fix atomicity violation in fmc_send_cmd()
    20082e2e8b79 HID: wacom: Interpret tilt data from Intuos Pro BT as signed values
    bb2f15b5222f block: fix ordering between checking BLK_MQ_S_STOPPED request adding
    5d2e9a42b1fd arm64: tls: Fix context-switching of tpidrro_el0 when kpti is enabled
    e2b91997db28 sh: cpuinfo: Fix a warning for CONFIG_CPUMASK_OFFSTACK
    bef9a2835011 um: vector: Do not use drvdata in release
    c52effe58215 serial: 8250: omap: Move pm_runtime_get_sync
    1635d9a0ff1b um: net: Do not use drvdata in release
    5727343348f3 um: ubd: Do not use drvdata in release
    3b22047378ef ubi: wl: Put source PEB into correct list if trying locking LEB failed
    a162b111ff1a platform/chrome: cros_ec_typec: fix missing fwnode reference decrement
    bc846c0be8a4 cpufreq: mediatek-hw: Fix wrong return value in mtk_cpufreq_get_cpu_power()
    e6e42c57cee9 mtd: spi-nor: core: replace dummy buswidth from addr to data
    6827966f6953 spi: Fix acpi deferred irq probe
    e67471437ae9 netfilter: ipset: add missing range check in bitmap_ip_uadt
    9f2d8f3e813d gpio: exar: set value when external pull-up or pull-down is present
    283211911b42 Revert "serial: sh-sci: Clean sci_ports[0] after at earlycon exit"
    4b14ac9e73bf serial: sh-sci: Clean sci_ports[0] after at earlycon exit
    e2e286306b67 Revert "usb: gadget: composite: fix OS descriptors w_value logic"
    479795371221 driver core: bus: Fix double free in driver API bus_register()
    3a0c02f550c5 usb: xhci: Fix TD invalidation under pending Set TR Dequeue
    2e891a42e75e Bluetooth: Fix type of len in rfcomm_sock_getsockopt{,_old}()
    1d1e618c1706 exfat: fix uninit-value in __exfat_get_dentry_set
    48c335245371 locking/lockdep: Avoid creating new name string literals in lockdep_set_subclass()
    6bdb3907d50d tty: ldsic: fix tty_ldisc_autoload sysctl's proc_handler
    5354599855a9 apparmor: test: Fix memory leak for aa_unpack_strdup()
    8797b7712de7 comedi: Flush partial mappings in error case
    1484fdc59e04 fsnotify: fix sending inotify event with unexpected filename
    41bbb1eb996b PCI: Fix use-after-free of slot->bus on hot remove
    227fde8a27f7 KVM: arm64: Ignore PMCNTENSET_EL0 while checking for overflow status
    4fe0d9228226 powerpc/pseries: Fix KVM guest detection for disabling hardlockup detector
    a304c1412210 crypto: x86/aegis128 - access 32-bit arguments as 32-bit
    dc0c28b7f98f perf/x86/intel/pt: Fix buffer full but size is 0 case
    f00012d5bf0c ASoC: codecs: Fix atomicity violation in snd_soc_component_get_drvdata()
    27a93c45e16a jfs: xattr: check invalid xattr size more strictly
    8d72b5c93360 ext4: fix FS_IOC_GETFSMAP handling
    519320ef836b ext4: supress data-race warnings in ext4_free_inodes_{count,set}()
    9887d859cd60 ALSA: usb-audio: Fix potential out-of-bound accesses for Extigy and Mbox devices
    ca0d15ee5a68 soc: qcom: socinfo: fix revision check in qcom_socinfo_probe()
    9b26540820e5 ASoC: Intel: sst: Fix used of uninitialized ctx to log an error
    13327d78229f Revert "drivers: clk: zynqmp: update divider round rate logic"
    3504696ecfb6 usb: ehci-spear: fix call balance of sehci clk handling routines
    ab011f7439d9 ALSA: usb-audio: Fix out of bounds reads when finding clock sources
    e8823e6ff313 xen: Fix the issue of resource not being properly released in xenbus_dev_probe()
    cb645064e081 ksmbd: fix slab-use-after-free in smb3_preauth_hash_rsp
    dadac97f066a parisc: fix a possible DMA corruption
    487b128f07b8 apparmor: fix 'Do simple duplicate message elimination'
    3c7355690f37 ALSA: hda/realtek: Update ALC256 depop procedure
    d148c0956954 counter: stm32-timer-cnt: Add check for clk_enable()
    098480edee1b misc: apds990x: Fix missing pm_runtime_disable()
    f45e6fc02435 USB: chaoskey: Fix possible deadlock chaoskey_list_lock
    4fb1375d830d USB: chaoskey: fail open after removal
    5f6c28cbd995 usb: yurex: make waiting on yurex_write interruptible
    dc26c8db0837 usb: using mutex lock and supporting O_NONBLOCK flag in iowarrior_read()
    bc2dbad38537 iio: light: al3010: Fix an error handling path in al3010_probe()
    2dcc86fefe09 tcp: Fix use-after-free of nreq in reqsk_timer_handler().
    dcacfcfe20cc bnxt_en: Reserve rings after PCIe AER recovery if NIC interface is down
    16aa78edf6dd net: hsr: fix hsr_init_sk() vs network/transport headers.
    d24b2fa24789 spi: atmel-quadspi: Fix register name in verbose logging function
    c33db53e40e1 octeontx2-af: RPM: Fix mismatch in lmac type
    0be9f9c52e29 net: stmmac: dwmac-socfpga: Set RX watchdog interrupt as broken
    c3c572dd294d marvell: pxa168_eth: fix call balance of pep->clk handling routines
    0659c6de7b98 net: mdio-ipq4019: add missing error check
    bbc697882231 net: usb: lan78xx: Fix refcounting and autosuspend on invalid WoL configuration
    28d185df039a tg3: Set coherent DMA mask bits to 31 for BCM57766 chipsets
    d211ad1209bc net: usb: lan78xx: Fix memory leak on device unplug by freeing PHY device
    3317641dac2d power: supply: bq27xxx: Fix registers of bq27426
    a2cd5d322d22 power: supply: core: Remove might_sleep() from power_supply_put()
    bd87598c6c5b fs_parser: update mount_api doc to match function signature
    9567bd34aa3b vfio/pci: Properly hide first-in-list PCIe extended capability
    dc2144cfefff selftests/mount_setattr: Fix failures on 64K PAGE_SIZE kernels
    6293d3df287d vdpa/mlx5: Fix suboptimal range on iotlb iteration
    fb71f1788624 hwmon: (tps23861) Fix reporting of negative temperatures
    b6a394fe4c6b NFSD: Fix nfsd4_shutdown_copy()
    a12c897adf40 svcrdma: fix miss destroy percpu_counter in svc_rdma_proc_init()
    57dee363185b sunrpc: simplify two-level sysctl registration for svcrdma_parm_table
    d7892d68ee3c NFSD: Cap the number of bytes copied by nfs4_reset_recoverydir()
    c5d90f930274 NFSD: Prevent NULL dereference in nfsd4_process_cb_update()
    74b5756de732 remoteproc: qcom_q6v5_mss: Re-order writes to the IMEM region
    3dbb7e68669d rpmsg: glink: use only lower 16-bits of param2 for CMD_OPEN name length
    04fcb57ac0fe rpmsg: glink: Fix GLINK command prefix
    e74022642291 rpmsg: glink: Send READ_NOTIFY command in FIFO full case
    d2e0ae595a3a rpmsg: glink: Add TX_DATA_CONT command while sending
    5f77ee6fd99d perf trace: Avoid garbage when not printing a syscall's arguments
    e3d8ded16712 perf trace: Do not lose last events in a race
    21e1cf688fb0 svcrdma: Address an integer overflow
    3ffaa3205380 m68k: coldfire/device.c: only build FEC when HW macros are defined
    8d4dcba03745 m68k: mcfgpio: Fix incorrect register offset for CONFIG_M5441x
    8f61c0161f8e perf trace: avoid garbage when not printing a trace event's arguments
    4bd3d783be92 f2fs: check curseg->inited before write_sum_page in change_curseg
    a76172963ea2 f2fs: remove the unused flush argument to change_curseg
    6bd8aa76978d f2fs: open code allocate_segment_by_default
    634ffe866196 f2fs: remove struct segment_allocation default_salloc_ops
    3fd2fc9282dc f2fs: fix the wrong f2fs_bug_on condition in f2fs_do_replace_block
    b5cf7ba111c2 PCI: cpqphp: Fix PCIBIOS_* return value confusion
    48597c484b82 PCI: cpqphp: Use PCI_POSSIBLE_ERROR() to check config reads
    1784ec80bd1c perf probe: Correct demangled symbols in C++ program
    24e19b5f3511 perf probe: Fix libdw memory leak
    403efb4457c0 PCI: Fix reset_method_store() memory leak
    656af7b3dcf1 perf cs-etm: Don't flush when packet_queue fills up
    8ac9fbe43789 mailbox: arm_mhuv2: clean up loop in get_irq_chan_comb()
    246896417a0e pinctrl: k210: Undef K210_PC_DEFAULT
    1b26918fd849 clk: clk-axi-clkgen: make sure to enable the AXI bus clock
    5a254ffef286 dt-bindings: clock: axi-clkgen: include AXI clk
    f4fbd70e15fa fbdev: sh7760fb: Fix a possible memory leak in sh7760fb_alloc_mem()
    038e1d56b252 fbdev/sh7760fb: Alloc DMA memory from hardware device
    7f5355199d21 powerpc/kexec: Fix return of uninitialized variable
    17248fdbe3ca powerpc/sstep: make emulate_vsx_load and emulate_vsx_store static
    8c966150d5ab ocfs2: fix uninitialized value in ocfs2_file_read_iter()
    35f5b68f63aa RDMA/hns: Fix NULL pointer derefernce in hns_roce_map_mr_sg()
    ef0613269a4f RDMA/hns: Fix out-of-order issue of requester when setting FENCE
    bb8b45883eb0 scsi: qedi: Fix a possible memory leak in qedi_alloc_and_init_sb()
    64654bf5efb3 scsi: qedf: Fix a possible memory leak in qedf_alloc_and_init_sb()
    59a4088829bc scsi: fusion: Remove unused variable 'rc'
    e76181a5be90 scsi: bfa: Fix use-after-free in bfad_im_module_exit()
    94c5f05270df mfd: rt5033: Fix missing regmap_del_irq_chip()
    3e4ff2af1b0a clk: imx: clk-scu: fix clk enable state save and restore
    55eb217f8f80 clk: imx: lpcg-scu: SW workaround for errata (e10858)
    6ce29bc3bb9f RDMA/bnxt_re: Check cqe flags to know imm_data vs inv_irkey
    f6ec13366875 powerpc/pseries: Fix dtl_access_lock to be a rw_semaphore
    e0a470b5733c powerpc/mm/fault: Fix kfence page fault reporting
    5fe7709251e3 mtd: rawnand: atmel: Fix possible memory leak
    b2073db65ab3 cpufreq: loongson2: Unregister platform_driver on failure
    bb6642d4b313 mfd: intel_soc_pmic_bxtwc: Use IRQ domain for PMIC devices
    da498e02c92e mfd: intel_soc_pmic_bxtwc: Use IRQ domain for TMU device
    23230ac3c5ca mfd: intel_soc_pmic_bxtwc: Use IRQ domain for USB Type-C device
    91cee88255a3 mfd: intel_soc_pmic_bxtwc: Use dev_err_probe()
    a82dbec6e882 mfd: da9052-spi: Change read-mask to write-mask
    cac4995c03fe mfd: tps65010: Use IRQF_NO_AUTOEN flag in request_irq() to fix race
    af36ccb8f82d powerpc/vdso: Flag VDSO64 entry points as functions
    45b1d10ce84f pinctrl: zynqmp: drop excess struct member description
    aba170f58f64 trace/trace_event_perf: remove duplicate samples on the first tracepoint event
    6694f7acd625 bpf: fix recursive lock when verdict program return SK_PASS
    0d2ad72d100f wireguard: selftests: load nf_conntrack if not present
    d425e975c161 netpoll: Use rcu_access_pointer() in netpoll_poll_lock
    a9584c897d1c Bluetooth: fix use-after-free in device_for_each_child()
    86bd0ba393a3 driver core: Introduce device_find_any_child() helper
    b889a7d68d7e ALSA: 6fire: Release resources at card release
    cadf1d8e9ddc ALSA: caiaq: Use snd_card_free_when_closed() at disconnection
    9a48bd2184b1 ALSA: us122l: Use snd_card_free_when_closed() at disconnection
    befcca177752 ALSA: usx2y: Use snd_card_free_when_closed() at disconnection
    8772cba76574 net: rfkill: gpio: Add check for clk_enable()
    1bda953ed5bc drm/amdkfd: Fix wrong usage of INIT_WORK()
    1d63ab86e155 selftests: net: really check for bg process completion
    46087de50376 bpf, sockmap: Fix sk_msg_reset_curr
    e1f54c61c4c9 bpf, sockmap: Several fixes to bpf_msg_pop_data
    0f8db9b36930 bpf, sockmap: Several fixes to bpf_msg_push_data
    7073d9004fff selftests/bpf: Add push/pop checking for msg_verify_data in test_sockmap
    145edbd2ff19 selftests/bpf: Fix total_bytes in msg_loop_rx in test_sockmap
    8468e42e5bc2 selftests, bpf: Add one test for sockmap with strparser
    d0e5847929a2 selftests/bpf: Fix SENDPAGE data logic in test_sockmap
    72fb93bb48b4 selftests/bpf: Add txmsg_pass to pull/push/pop in test_sockmap
    c99fd5911e27 netlink: typographical error in nlmsg_type constants definition
    43950c95ef8d netfilter: nf_tables: must hold rcu read lock while iterating object type list
    7ffeda67d366 netfilter: nf_tables: skip transaction if update object is not implemented
    65aec8dc425d drm/msm/dpu: cast crtc_clk calculation to u64 in _dpu_core_perf_calc_clk()
    46b8e788c49d wifi: wfx: Fix error handling in wfx_core_init()
    940389e96d99 drm/etnaviv: hold GPU lock across perfmon sampling
    d4ce36476c65 drm/etnaviv: fix power register offset on GC300
    bef66f303ed8 drm/etnaviv: Request pages from DMA32 zone on addressing_limited
    ac378560f90a drm/msm/adreno: Use IRQF_NO_AUTOEN flag in request_irq()
    584fb280f30d drm/panfrost: Remove unused id_mask from struct panfrost_model
    a374e7e79fbd octeontx2-pf: handle otx2_mbox_get_rsp errors in cn10k.c
    55c41b97001a octeontx2-pf: handle otx2_mbox_get_rsp errors in otx2_ethtool.c
    785c6758ea32 octeontx2-pf: handle otx2_mbox_get_rsp errors in otx2_common.c
    dd54e632bed9 drm: fsl-dcu: enable PIXCLK on LS1021A
    581261b2d6fd wifi: mwifiex: Fix memcpy() field-spanning write warning in mwifiex_config_scan()
    7f23fb2e0a15 selftests/bpf: Fix txmsg_redir of test_txmsg_pull in test_sockmap
    f1116a9d236e selftests/bpf: Fix msg_verify_data in test_sockmap
    18f1c9fd9376 drm/bridge: tc358767: Fix link properties discovery
    e69c5ebfb900 netdevsim: copy addresses for both in and out paths
    08c307552119 netdevsim: rely on XFRM state direction instead of flags
    7f6afb1b33fd xfrm: store and rely on direction to construct offload flags
    e4426baa9aa3 xfrm: rename xfrm_state_offload struct to allow reuse
    ded61e552767 libbpf: fix sym_is_subprog() logic for weak global subprogs
    a6fee1be65aa bpf: Fix the xdp_adjust_tail sample prog issue
    4e0e9e7af5f7 libbpf: Fix output .symtab byte-order during linking
    441bbc0cf7fb drm/bridge: anx7625: Drop EDID cache on bridge power off
    363e427097c7 ASoC: dt-bindings: mt6359: Update generic node name and dmic-mode
    f5558e6b5cbe ASoC: fsl_micfil: fix regmap_write_bits usage
    0832e6e657a1 ASoC: fsl_micfil: use GENMASK to define register bit fields
    6869a23070c9 ASoC: fsl_micfil: do not define SHIFT/MASK for single bits
    a20141b2a4f8 ASoC: fsl_micfil: Drop unnecessary register read
    ffa8a4e83c5d dt-bindings: vendor-prefixes: Add NeoFidelity, Inc
    26af2cca4179 wifi: ath10k: fix invalid VHT parameters in supported_vht_mcs_rate_nss2
    4b92467725dc wifi: ath10k: fix invalid VHT parameters in supported_vht_mcs_rate_nss1
    6887f9f41267 drm/v3d: Address race-condition in MMU flush
    89267ef694d0 drm/imx/ipuv3: Use IRQF_NO_AUTOEN flag in request_irq()
    2277397e711a drm/imx/dcss: Use IRQF_NO_AUTOEN flag in request_irq()
    28e6151ccec4 wifi: mwifiex: Use IRQF_NO_AUTOEN flag in request_irq()
    4f5e6866acfe wifi: p54: Use IRQF_NO_AUTOEN flag in request_irq()
    4e3931ffa904 drm/omap: Fix locking in omap_gem_new_dmabuf()
    53e1ad912a64 drm/omap: Fix possible NULL dereference
    8965db7fe2e9 wifi: ath9k: add range check for conn_rsp_epid in htc_connect_service()
    6a806399e4f5 drm/mm: Mark drm_mm_interval_tree*() functions with __maybe_unused
    38c3f8acde76 platform/x86: panasonic-laptop: Return errno correctly in show callback
    0f7f31aaf613 platform/x86: panasonic-laptop: Replace snprintf in show functions with sysfs_emit
    4676e5044404 media: atomisp: Add check for rgby_data memory allocation failure
    6f8f96ab93f7 media: atomisp: remove #ifdef HAS_NO_HMEM
    8aa2da2fd911 media: venus: provide ctx queue lock for ioctl synchronization
    9c704cd7e318 venus: venc: add handling for VIDIOC_ENCODER_CMD
    06ad3f4b0bed media: venus : Addition of support for VIDIOC_TRY_ENCODER_CMD
    f7edaca4f66a media: venus : Addition of EOS Event support for Encoder
    745e6d8bbe6a media: venus: vdec: decoded picture buffer handling during reconfig sequence
    b75d87df0f31 media: venus: venc: Use pmruntime autosuspend
    2a5b8de6fcb9 firmware: arm_scpi: Check the DVFS OPP count returned by the firmware
    ec0b5a3454fe selftests/resctrl: Protect against array overrun during iMC config parsing
    d9f878fd8b99 arm64: dts: mediatek: mt8183-kukui-jacuzzi: Add supplies for fixed regulators
    65816651d9c4 arm64: dts: mediatek: mt8183-kukui-jacuzzi: Fix DP bridge supply names
    c84daf3b325b arm64: dts: mt8183: jacuzzi: Move panel under aux-bus
    03dd02b207dd arm64: dts: mt8183: jacuzzi: remove unused ddc-i2c-bus
    7de5804460c3 regmap: irq: Set lockdep class for hierarchical IRQ domains
    c4908741911d spi: zynqmp-gqspi: Undo runtime PM changes at driver exit time​
    5f116d12c0ef spi: tegra210-quad: Avoid shift-out-of-bounds
    6a6908aa03c9 pmdomain: ti-sci: Add missing of_node_put() for args.np
    4869448ba8cc ARM: dts: cubieboard4: Fix DCDC5 regulator constraints
    504ee6496d11 pwm: imx27: Workaround of the pwm output bug when decrease the duty cycle
    189227d2d8ff arm64: dts: mt8183: Damu: add i2c2's i2c-scl-internal-delay-ns
    3b16dcf7241f arm64: dts: mt8183: burnet: add i2c2's i2c-scl-internal-delay-ns
    ec8b64d666a3 arm64: dts: mt8183: fennel: add i2c2's i2c-scl-internal-delay-ns
    973c859752cb cgroup/bpf: only cgroup v2 can be attached by bpf programs
    d4cc5a87c24d Revert "cgroup: Fix memory leak caused by missing cgroup_bpf_offline"
    f275bbe332f7 arm64: dts: mediatek: mt8173-elm-hana: Add vdd-supply to second source trackpad
    50497379f82a arm64: dts: mt8183: kukui: Fix the address of eeprom at i2c4
    be613fc3c24d arm64: dts: mt8183: krane: Fix the address of eeprom at i2c4
    8d1e8505859f tpm: fix signed/unsigned bug when checking event logs
    2d88cf062b86 mmc: mmc_spi: drop buggy snprintf()
    f4b7bf5a50f1 soc: qcom: geni-se: fix array underflow in geni_se_clk_tbl_get()
    f34d172307f9 soc: ti: smartreflex: Use IRQF_NO_AUTOEN flag in request_irq()
    9f5a2db6be13 spi: spi-fsl-lpspi: Use IRQF_NO_AUTOEN flag in request_irq()
    97e793af8715 spi: spi-fsl-lpspi: downgrade log level for pio mode
    cd1c59275de4 clocksource/drivers:sp804: Make user selectable
    ede7084c9071 kcsan, seqlock: Fix incorrect assumption in read_seqbegin()
    730eb858dff7 kcsan, seqlock: Support seqcount_latch_t
    2f7e3eac5fee seqlock/latch: Provide raw_read_seqcount_latch_retry()
    6c1edccbc980 timekeeping: Consolidate fast timekeeper
    cee8f85696a8 time: Fix references to _msecs_to_jiffies() handling of values
    da7e49db34c5 crypto: cavium - Fix an error handling path in cpt_ucode_load_fw()
    4ea3e3b761e3 crypto: bcm - add error check in the ahash_hmac_init function
    5e959bf234d0 crypto: caam - add error check to caam_rsa_set_priv_key_form
    c5c64ff34a9d ACPI: CPPC: Fix _CPC register setting issue
    029ac07bb92d EDAC/igen6: Avoid segmentation fault on module unload
    d465ea267167 crypto: cavium - Fix the if condition to exit loop after timeout
    96001f52ae8c crypto: pcrypt - Call crypto layer directly when padata_do_parallel() return -EBUSY
    d3008b4ea1d9 EDAC/fsl_ddr: Fix bad bit shift operations
    20c2fe56889b thermal: core: Initialize thermal zones before registering them
    06de6e9bc818 crypto: qat - remove faulty arbiter config reset
    4ad7033de109 EDAC/bluefield: Fix potential integer overflow
    945c76cad892 firmware: google: Unregister driver_info on failure
    6187727e57ae crypto: caam - Fix the pointer passed to caam_qi_shutdown()
    06cbfbb13ac8 hfsplus: don't query the device logical block size multiple times
    b5d785fb2000 s390/syscalls: Avoid creation of arch/arch/ directory
    578b3297aca6 acpi/arm64: Adjust error handling procedure in gtdt_parse_timer_block()
    9529c7a62042 arm64: fix .data.rel.ro size assertion when CONFIG_LTO_CLANG
    4fb897945111 m68k: mvme147: Reinstate early console
    c7bf342937fa m68k: mvme16x: Add and use "mvme16x.h"
    e2097596d34f m68k: mvme147: Fix SCSI controller IRQ numbers
    869cf50b9c9d nvme-pci: fix freeing of the HMB descriptor table
    6983b8ac787b initramfs: avoid filename buffer overrun
    2be0ca62b8e2 mips: asm: fix warning when disabling MIPS_FP_SUPPORT
    41219c147df8 brd: defer automatic disk creation until module initialization succeeds
    60f89db56246 brd: remove brd_devices_mutex mutex
    c5979734eda3 s390/cio: Do not unregister the subchannel based on DNV
    d7a08f5f80ff kselftest/arm64: mte: fix printf type warnings about longs
    38002ab1bd42 x86/barrier: Do not serialize MSR accesses on AMD
    061479ca14af nvme: fix metadata handling in nvme-passthrough
    01cdddde39b0 cifs: Fix buffer overflow when parsing NFS reparse points
    b661948bac86 rcu-tasks: Idle tasks on offline CPUs are in quiescent states
    7251463f4bd0 ipmr: Fix access to mfc_cache_list without lock held
    07df4a754746 ARM: 9420/1: smp: Fix SMP for xip kernels
    2b55ec8d9c49 ALSA: usb-audio: Fix Yamaha P-125 Quirk Entry
    affd04aaef11 proc/softirqs: replace seq_printf with seq_put_decimal_ull_width
    3727c0bf74eb ASoC: stm: Prevent potential division by zero in stm32_sai_get_clk_div()
    80c35a870ea3 ASoC: stm: Prevent potential division by zero in stm32_sai_mclk_round_rate()
    3849d29eef43 can: j1939: fix error in J1939 documentation.
    ba20a72c5a5f platform/x86: dell-wmi-base: Handle META key Lock/Unlock events
    224f87efa087 platform/x86: dell-smbios-base: Extends support to Alienware products
    10987691701a regulator: rk808: Add apply_bit for BUCK3 on RK809
    cba0338d1831 soc: qcom: Add check devm_kasprintf() returned value
    d9b04bbae6c0 net: usb: qmi_wwan: add Quectel RG650V
    6bdf34883e65 x86/amd_nb: Fix compile-testing without CONFIG_AMD_NB
    5e958ced670f ALSA: hda/realtek: Add subwoofer quirk for Infinix ZERO BOOK 13
    f78ccffd9eb7 selftests/watchdog-test: Fix system accidentally reset after watchdog-test
    8ba9e834ff95 usb: add support for new USB device ID 0x17EF:0x3098 for the r8152 driver
    8f6ef43aed11 mac80211: fix user-power when emulating chanctx
    069e1d600bdc wifi: iwlwifi: mvm: Use the sync timepoint API in suspend
    0b9a2fb8bb27 ASoC: Intel: sst: Support LPE0F28 ACPI HID
    96b04a80541e ASoC: Intel: bytcr_rt5640: Add DMI quirk for Vexia Edu Atla 10 tablet
    84e961ad2a16 ASoC: Intel: bytcr_rt5640: Add support for non ACPI instantiated codec
    31545f4b7cdb NFS: nfs_async_write_reschedule_io must not recurse into the writeback code
    44f48eb9a605 mm: resolve faulty mmap_region() error path behaviour
    679d3a53eb02 mm: refactor arch_calc_vm_flag_bits() and arm64 MTE handling
    a08241812f21 mm: unconditionally close VMAs on error
    105d04c88e5c mm: avoid unsafe VMA hook invocation when error arises on mmap hook
    d3f9d88c2c03 mm: revert "mm: shmem: fix data-race in shmem_getattr()"
    0a9a182ea5c7 mptcp: cope racing subflow creation in mptcp_rcv_space_adjust
    9467c49437e9 NFSD: Never decrement pending_async_copies on error
    7267625baf36 NFSD: Initialize struct nfsd4_copy earlier
    43e46ee5efc0 NFSD: Limit the number of concurrent async COPY operations
    34f200d66c1b NFSD: Async COPY result needs to return a write verifier
    24ab9e0cc554 NFSD: initialize copy->cp_clp early in nfsd4_copy for use by trace point
    ef1e1954d784 media: dvbdev: fix the logic when DVB_DYNAMIC_MINORS is not set
    659191444d99 lib/buildid: Fix build ID parsing logic
    7a514335cf41 mmc: sunxi-mmc: Fix A100 compatible description
    43f79bfcfb09 mmc: sunxi-mmc: Add D1 MMC variant
    69434d929adf drm/bridge: tc358768: Fix DSI command tx
    f701eb601470 Revert "mmc: dw_mmc: Fix IDMAC operation with pages bigger than 4K"
    d904e4d845aa nilfs2: fix null-ptr-deref in block_dirty_buffer tracepoint
    647f416d31ac ocfs2: fix UBSAN warning in ocfs2_verify_volume()
    19c71cdd7797 nilfs2: fix null-ptr-deref in block_touch_buffer tracepoint
    b8a1d572478b KVM: VMX: Bury Intel PT virtualization (guest/host mode) behind CONFIG_BROKEN
    8fbac997556b KVM: nVMX: Treat vpid01 as current if L2 is active, but with VPID disabled
    63a47139dd96 vdpa/mlx5: Fix PA offset with unaligned starting iotlb map
    0e04746db2ec ocfs2: uncache inode which has failed entering the group
    903d896448c2 mm: fix NULL pointer dereference in alloc_pages_bulk_noprof
    6ec06379b8de x86/mm: Fix a kdump kernel failure on SME system when CONFIG_IMA_KEXEC=y
    a1e3ba952956 ARM: 9419/1: mm: Fix kernel memory mapping for xip kernels
    0b99de8bbffc samples: pktgen: correct dev to DEV
    882f392d9e36 net/mlx5e: CT: Fix null-ptr-deref in add rule err flow
    c7b97f9e794d net/mlx5e: kTLS, Fix incorrect page refcounting
    5b47c2f47c2f net/mlx5: fs, lock FTE when checking if active
    4e47b99a7764 drm/rockchip: vop: Fix a dereferenced before check warning
    d2fab3d66cc1 netlink: terminate outstanding dump on socket close
    7b4ec178bf38 clk: qcom: gcc-qcs404: fix initial rate of GPLL3
    c80499741610 leds: lp55xx: Remove redundant test for invalid channel number
    03c863749bab iommu/io-pgtable-arm: Fix stage-2 map/unmap for concatenated tables
    b4f3288f9530 vmstat: call fold_vm_zone_numa_events() before show per zone NUMA event
    885109aa0c70 ftrace: Fix regression with module command in stack_trace_filter
    749eac5a6687 ovl: Filter invalid inodes with missing lookup function
    72ed66623953 media: uvcvideo: Require entities to have a non-zero unique ID
    1895f0928d80 media: uvcvideo: Stop stream during unregister
    64f72a738864 media: platform: allegro-dvt: Fix possible memory leak in allocate_buffers_internal()
    944303ecc9b5 media: gspca: ov534-ov772x: Fix off-by-one error in set_frame_rate()
    1cfc844ee3d9 media: venus: Fix pm_runtime_set_suspended() with runtime pm enabled
    b6208d1567f9 media: ts2020: fix null-ptr-deref in ts2020_probe()
    f3c4e088ec01 media: imx-jpeg: Ensure power suppliers be suspended before detach them
    815d14147068 media: i2c: tc358743: Fix crash in the probe error path when using polling
    f68bb1210fbe media: imx-jpeg: Set video drvdata before register video device
    ba57d800592b arm64: dts: allwinner: pinephone: Add mount matrix to accelerometer
    b5d500042eb3 usb: hcd-pci: remove the action of faking interrupt request
    6f0605db50e2 clk: imx: Add check for kcalloc
    5b837b9e1543 bpf: Fix the indention issue in grow_stack_state()
    42b62697634d cifs: Fix the calling of smb_version_operations::calc_smb_size()
    b14acf729e9d f2fs: Add inline to f2fs_build_fault_attr() stub
    7c317bec311f f2fs: check validation of fault attrs in f2fs_build_fault_attr()
    81c12119c23f bpf: Fix accesses to uninit stack slots [ Upstream commit 6b4a64bafd107e521c01eec3453ce94a3fb38529 ]
    c4fa05422d87 smb: client: fix potential OOB in smb2_dump_detail()
    299ef3b5b00b of: module: add buffer overflow check in of_modalias()
    b8086c3c1548 reiserfs: Avoid touching renamed directory if parent does not change
    ea091017ef62 ipv6: Fix data races around sk->sk_prot.
    ff8710da80ee ipv6: annotate some data-races around sk->sk_prot
    e8c2eafaaa6a tcp: Fix data races around icsk->icsk_af_ops.
    8d1bab770956 locking/rwsem: Disable preemption while trying for rwsem lock
    7c82dac02886 block, loop: support partitions without scanning
    45f504f301d4 bpftool: Fix pretty print dump for maps without BTF loaded
    1f24338cb789 jbd2: Drop the merge conflicted hunk
    e1d0e3c51bde tpm: tis_i2c: Limit write bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    1abe841fe331 tpm: tis_i2c: Limit read bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    6224acfc1d56 tpm: Add flag to use default cancellation policy
    1cd19d48fb90 tpm: tis_i2c: Fix sanity check interrupt enable mask
    a883da132fa8 tpm: Add tpm_tis_i2c backend for tpm_tis_core
    a742ac8a1c51 tpm: Add tpm_tis_verify_crc to the tpm_tis_phy_ops protocol layer
    ef495c5f45f2 tpm: Remove read16/read32/write32 calls from tpm_tis_phy_ops
    1f3be2e23aa6 gcc-plugins: Reorganize gimple includes for GCC 13
    24615a3b932a ata: ahci: fix enum constants for gcc-13
    5d6cb145541a net: stmmac: Enable mac_managed_pm phylink config
    fd93aabb4287 tools/resolve_btfids: Use pkg-config to locate libelf
    130f9da78406 tools/resolve_btfids: Build with host flags
    00f2f1a782f9 tools/resolve_btfids: Support cross-building the kernel with clang
    17776a4ba9c2 tools/resolve_btfids: Install libbpf headers when building
    7c9808380d70 libbpf: Make libbpf_version.h non-auto-generated
    37ae1ba791ac libbpf: Add LIBBPF_DEPRECATED_SINCE macro for scheduling API deprecations
    a2667e6d7314 drm/radeon: free iio for atombios when driver shutdown
    f100c753aa1f powerpc: Fix reschedule bug in KUAP-unlocked user copy
    da5513f30187 libbpf: Fix build warning on ref_ctr_off
    4c5a089621a8 perf python: Account for multiple words in CC
    1c5699ee85d4 fs: move S_ISGID stripping into the vfs_*() helpers
    838f5d0701d8 fs: add mode_strip_sgid() helper
    d97172683641 squashfs: provide backing_dev_info in order to disable read-ahead
    ed037d7be40c irq_work: use kasan_record_aux_stack_noalloc() record callstack
    1363bd7dbde3 ixgbevf: add disable link state
    e5601ae2bd24 ixgbe: add improvement for MDD response functionality
    caa57cd80575 ixgbe: add the ability for the PF to disable VF link state
    16a77bfcc7df Check /dev/console using init_stat()
    04574fd5579a tracing/arm: Have max stack tracer handle the case of return address after data
    0e51e5717018 gpiolib: cdev: Set lineevent_state::irq after IRQ register successfully
    1e6b7da6ddba drivers/base: Fix unsigned comparison to -1 in CPUMAP_FILE_MAX_BYTES
    493160901320 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    04224f725aa3 irqchip/gic-v3-its: Skip HP notifier when no ITS is registered
    6f6c2996a81c irqchip/gic-v3-its: Postpone LPI pending table freeing and memreserve
    1fa94473423f irqchip/gic-v3-its: Give the percpu rdist struct its own flags field
    6013d1ae5feb cert host tools: Stop complaining about deprecated OpenSSL functions
    efe20512212b init/Kconfig: fix CC_HAS_ASM_GOTO_TIED_OUTPUT test with dash
    a40d2daf2795 pnmtologo: use relocatable file name
    3b40d5b41155 of: configfs: remove unused variable overlay_lock
    6c085baf1838 tools: use basename to identify file in gen-mach-types
    2fca0fd71981 lib/build_OID_registry: fix reproducibility issues
    0f586f4ee8ad vt/conmakehash: improve reproducibility
    a75774679f28 OF: DT-Overlay configfs interface (v8)
    d179c639b30b x86/boot: Wrap literal addresses in absolute_pointer()
    856ec356cf91 ACPI: thermal: drop an always true check
    7614af249993 xfs: Fix -Werror=dangling-pointer work-around for older GCC
    41470215f97e xfs: Work around GCC 12 -Werror=dangling-pointer for xfs_attr_remote.o
    44a445c1922d virtio-pci: Remove wrong address verification in vp_del_vqs()
    77aa9e489eaf bpf: Disallow unprivileged bpf by default
    ebfb1822e9f9 fs/aufs: fixup 5.15.36 fixups
    4eba9348d3e2 Revert "Revert "fbdev: Hot-unplug firmware fb devices on forced removal""
    5df6d1b00f95 jbd2: fix use-after-free of transaction_t race
    2d83e8196487 jbd2: refactor wait logic for transaction updates into a common function
    07a63f760793 netfilter: conntrack: avoid useless indirection during conntrack destruction
    4e7122625996 Revert "fbdev: Hot-unplug firmware fb devices on forced removal"
    7ba4cb36fd4f rcu: Avoid alloc_pages() when recording stack
    f78574dee71e kasan: test: silence intentional read overflow warnings
    d313cb89b6b1 kasan: arm64: fix pcpu_page_first_chunk crash with KASAN_VMALLOC
    5e279d5647cc arm64: support page mapping percpu first chunk allocator
    e5bf16752dca vmalloc: choose a better start address in vm_area_register_early()
    660b3d21b46f kasan: test: bypass __alloc_size checks
    00aa7573e53a kasan: test: add memcpy test that avoids out-of-bounds write
    67becf0b1bd4 kasan: fix tag for large allocations when using CONFIG_SLAB
    bedf1e033213 workqueue, kasan: avoid alloc_pages() when recording stack
    7195b67ce69b kasan: generic: introduce kasan_record_aux_stack_noalloc()
    bdff763f0e29 kasan: common: provide can_alloc in kasan_save_stack()
    51423ebb36ad lib/stackdepot: introduce __stack_depot_save()
    85373e66d847 lib/stackdepot: remove unused function argument
    5b6cc9b251f3 lib/stackdepot: include gfp.h
    c9f3902d8069 aufs: reduce overhead for "code present but disabled" use case.
    b98d189df02c aufs: bugfix, umount passes NULL to ->parse_monolithic()
    13b883cbbbd9 aufs standalone: cosmetic, missing copyright sentence
    21f8b0d81898 aufs: 5.15.5-20220117 ---> 5.15.5-20220221
    6199fd896645 aufs: tiny, headers after fs_context
    8ddb40e31c29 aufs: fs_context 7/7, finally remount
    69035f71c6fd aufs: fs_context 6/7, now mount
    bc841b970697 aufs: fs_context 5/7, parse all other mount options
    435188053da2 aufs: fs_context 4/7, parse xino options
    9af1f1825cbd aufs: fs_context 3/7, parse the branch-management options
    1c05eb767f8c aufs: fs_context 2/7, parse "br" mount option
    a8488f603134 aufs: fs_context 1/7, skelton of the new shceme
    8e32e0015564 aufs: pre fs_context, convert a static flag to a macro
    f90cb4144aec aufs: pre fs_context, support the incomplete sb and sbinfo case
    948762ef859c aufs: pre fs_context, convert the type of alloc_sbinfo()
    77151a08776b aufs: 5.15.5-20211129 ---> 5.15.5-20220117
    2539adbbbe1e aufs: 5.14-20211018 ---> 5.15.5-20211129
    7d32b25193c4 aufs: for v5.15-rc1, sync_inode() is gone
    66ec0c509225 aufs: for v5.15-rc1, new param 'rcu' for ->get_acl()
    69709dc518cd aufs: for v5.15-rc1, no mand-lock anymore
    ada8fe9543e5 aufs: 5.14-20210906  ---> 5.14-20211018
    b77f7f3f394a Revert "aufs: adjust to v5.15 fs changes"
    81bdce5b5876 tick/nohz: WARN_ON --> WARN_ON_ONCE to prevent console saturation
    97c963889222 sched/isolation: really align nohz_full with rcu_nocbs
    871f23ad3627 Revert "ARM: defconfig: Enable ax88796c driver for Exynos boards"
    ffad0783dd5b ARM: config: multi v7: Regenerate defconifg
    5c1e1a1ff2d3 ARM: config: multi v7: Add renamed symbols
    badaf96564fe ARM: config: multi v7: Clean up enabled by default options
    34996040fc9b ARM: config: multi v7: Drop unavailable options
    7f685244afb3 powerpc/mm: Switch obsolete dssall to .long
    20301aeb1a64 riscv: fix build with binutils 2.38
    9df58d070506 powerpc/lib/sstep: fix 'ptesync' build error
    720b61fc400b x86_64_defconfig: Fix warnings
    02bf23d26bc4 arm64: defconfig: cleanup config options
    05914e2c87e5 arm: defconfig: drop unused POWER_AVS option
    ffb532fa19b9 aufs5: fix build against v5.15.3+
    a4b3abf4d96d qemux86: add configuration symbol to select values
    fee94ee09154 clear_warn_once: add a clear_warn_once= boot parameter
    3d8762d900d9 clear_warn_once: bind a timer to written reset value
    95faacac47e8 clear_warn_once: expand debugfs to include read support
    de20c4240018 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    0e4aacead9c1 perf: x86-32: explicitly include <errno.h>
    9ad92c11468e perf: mips64: Convert __u64 to unsigned long long
    09e7efe3e68a perf: fix bench numa compilation
    e79becc44fa6 perf: add SLANG_INC for slang.h
    b1033b588681 perf: add sgidefs.h to for mips builds
    cf9db484ac0b perf: change --root to --prefix for python install
    7fd052c2c562 perf: add 'libperl not found' warning
    27a437cdd469 perf: force include of <stdbool.h>
    3b99d21bec2f fat: don't use obsolete random32 call in namei_vfat
    a7e9293b506b FAT: Added FAT_NO_83NAME
    6fd0e71d9e5c FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    c379b0d324ae FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    538be0fdb124 aufs: adjust to v5.15 fs changes
    f45da75c8759 aufs5: core
    047f57e07e01 aufs5: standalone
    029fc15574c8 aufs5: mmap
    610d0192ee94 aufs5: base
    d4e428d0ec5f aufs5: kbuild
    eb067eca251a yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    286af18d0875 yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    24d59a4e26a6 yaffs2: v5.12+ build fixups (not runtime tested)
    22c73536d5d7 yaffs: include blkdev.h
    506b7251bfb8 yaffs: fix misplaced variable declaration
    a0e26ff364dc yaffs2: v5.6 build fixups
    b10b1b2d169e yaffs2: fix memory leak when /proc/yaffs is read
    ad9adccbb214 yaffs: add strict check when call yaffs_internal_read_super
    2e3c3aec8279 yaffs: repair yaffs_get_mtd_device
    d662538516a7 yaffs: Fix build failure by handling inode i_version with proper atomic API
    70a6113ee2c7 yaffs2: fix memory leak in mount/umount
    3378e4a9e404 yaffs: Avoid setting any ACL releated xattr
    ec2284edddef Yaffs:check oob size before auto selecting Yaffs1
    c2a49874051c fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    e9a5105a3e73 yaffs2: adjust to proper location of MS_RDONLY
    608807406f13 yaffs2: import git revision b4ce1bb (jan, 2020)
    89e660ece42c initramfs: allow an optional wrapper script around initramfs generation
    b179dbc9aa10 iwlwifi: select MAC80211_LEDS conditionally
    3fd5ca3673d0 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    d1f6edbf0188 arm64/perf: Fix wrong cast that may cause wrong truncation
    d202fb2caf33 defconfigs: drop obselete options
    9a27e3b5f4e7 arm64/perf: fix backtrace for AAPCS with FP enabled
    e20d8cf019b4 linux-yocto: Handle /bin/awk issues
    b6d2a3dbbd3a uvesafb: provide option to specify timeout for task completion
    adb40f1e6a1a uvesafb: print error message when task timeout occurs
    f280a1ed0962 compiler.h: Undef before redefining __attribute_const__
    4352732f268c vmware: include jiffies.h
    7954a677968d Resolve jiffies wrapping about arp
    5f28a1035d95 nfs: Allow default io size to be configured.
    0d7260ad7106 check console device file on fs when booting
    900a12e37e0a mount_root: clarify error messages for when no rootfs found
    7b878cbea726 menuconfig,mconf-cfg: Allow specification of ncurses location
    6604fc1763b3 modpost: mask trivial warnings
    0d294adb09cb kbuild: exclude meta directory from distclean processing
    a097cdd95a9e powerpc: serialize image targets
    5db6ec39a0a3 arm: serialize build targets
    cbabca27905e crtsavres: fixups for 5.4+
    7fc7656ed403 powerpc/ptrace: Disable array-bounds warning with gcc8
    a5faac5a19a2 powerpc: Disable attribute-alias warnings from gcc8
    186c54665b67 powerpc: add crtsavres.o to archprepare for kbuild
    d1ea862964ca powerpc: kexec fix for powerpc64
    2ac35b89a0f9 powerpc: Add unwind information for SPE registers of E500 core
    2e1c348a28bb mips: vdso: fix 'jalr $t9' crash in vdso code
    ec57870b303a mips: Kconfig: add QEMUMIPS64 option
    6a81b3c08107 4kc cache tlb hazard: tlbp cache coherency
    74e3b2a21e54 malta uhci quirks: make allowance for slow 4k(e)c
    22e65b63d3b4 arm/Makefile: Fix systemtap
    b7f1ab59f19e vexpress: Pass LOADADDR to Makefile
    ce2800c73bf7 arm: ARM EABI socketcall
    019d142fd956 ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 489da2cbc3..00dc8a9c3c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1d8830fba57e4ac3d213ca9c94dc68ac46369d43"
-SRCREV_meta ?= "c20b08deed1bb069e2489413e54e7498dba70057"
+SRCREV_machine ?= "bc2b7af6f78a15623836fb37d6ff80691e06c199"
+SRCREV_meta ?= "65cd92b42128e83bbe4920be8d58d2f44fa0245a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.173"
+LINUX_VERSION ?= "5.15.174"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 1816b47dfe..e99edda2c3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.173"
+LINUX_VERSION ?= "5.15.174"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "0d6b798bb6a1e1ed73032fa5c45f1d599593d21e"
-SRCREV_meta ?= "c20b08deed1bb069e2489413e54e7498dba70057"
+SRCREV_machine ?= "ea64fb5c8f628c8c5aa1cbc817999eb53994e949"
+SRCREV_meta ?= "65cd92b42128e83bbe4920be8d58d2f44fa0245a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 9e5c21f407..1e725b77af 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "c1028e815302012e33e3249ebea99560d27fb35d"
-SRCREV_machine:qemuarm64 ?= "2dc4d24d695ca843b072af76d0b256d0b20c490b"
-SRCREV_machine:qemumips ?= "a325e8ea9f13e35d9685d4efb5361973532c52cb"
-SRCREV_machine:qemuppc ?= "3c68be3fd502a5d9772f734c61e8325c47bbe8cb"
-SRCREV_machine:qemuriscv64 ?= "3ac5c02a471d41782f960090c5d5caab80dc6cdc"
-SRCREV_machine:qemuriscv32 ?= "3ac5c02a471d41782f960090c5d5caab80dc6cdc"
-SRCREV_machine:qemux86 ?= "3ac5c02a471d41782f960090c5d5caab80dc6cdc"
-SRCREV_machine:qemux86-64 ?= "3ac5c02a471d41782f960090c5d5caab80dc6cdc"
-SRCREV_machine:qemumips64 ?= "e5704819da97878c8f22425f8f7b271449935894"
-SRCREV_machine ?= "3ac5c02a471d41782f960090c5d5caab80dc6cdc"
-SRCREV_meta ?= "c20b08deed1bb069e2489413e54e7498dba70057"
+SRCREV_machine:qemuarm ?= "2747d1f29f22840b70fddd943e1911e8c5352001"
+SRCREV_machine:qemuarm64 ?= "78975933bbeb0646ca0d105d60f85d38714f25f7"
+SRCREV_machine:qemumips ?= "f26a7a4c9172032ef25c456022f0cc6ca4312ea2"
+SRCREV_machine:qemuppc ?= "0ad1f117d7b6e1c3c35c454fa50b9904f7b72e9d"
+SRCREV_machine:qemuriscv64 ?= "a340a82f59d3e1ea79ae5e9935387b7ff3bcbe28"
+SRCREV_machine:qemuriscv32 ?= "a340a82f59d3e1ea79ae5e9935387b7ff3bcbe28"
+SRCREV_machine:qemux86 ?= "a340a82f59d3e1ea79ae5e9935387b7ff3bcbe28"
+SRCREV_machine:qemux86-64 ?= "a340a82f59d3e1ea79ae5e9935387b7ff3bcbe28"
+SRCREV_machine:qemumips64 ?= "e8b960dc22b8aa3eaf9621091e14d84e25c15b6a"
+SRCREV_machine ?= "a340a82f59d3e1ea79ae5e9935387b7ff3bcbe28"
+SRCREV_meta ?= "65cd92b42128e83bbe4920be8d58d2f44fa0245a"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "0a51d2d4527b43c5e467ffa6897deefeaf499358"
+SRCREV_machine:class-devupstream ?= "963e654022cc32d72c184b4ab86a76226b3e3b8d"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.173"
+LINUX_VERSION ?= "5.15.174"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.43.0


