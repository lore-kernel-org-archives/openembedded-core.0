Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F102FD13C37
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 15:24:07 +0000 (UTC)
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22091.1769441043256467873
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 07:24:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kaIUmU2G;
 spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id 6a1803df08f44-894774491deso74729796d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 07:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769441042; x=1770045842; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVu1ReH+c7rd4aE1iXaT/w2lsFOnYMZrk5qdB84Rw/4=;
        b=kaIUmU2GPG3htwlisAxcugBfrBCO3oQ5jGiE0G6wgUzS9BJL7Mf1jIV4zgghcYaUlq
         JJBgbR7HMZJyNPe/7XfGwS6LEfiK11fwq9Dt6cocAUA9cdAWZVTIIp9HF3wcnkHa1cRf
         2FoBNU9N3ok/RshKZfHhm1t5t1YsI8KOX1abo5c+PVcazpwJxPqgaU4wlYqeJAoAw9OM
         Rxp7PBU7hF3L4oHV5TNTXm/lKHNFJkAtDTEIgBivJCCOWlLwzPq/+d9bZNnN0HassKAS
         JDMS4w68lhJKc3k2mVPEk8OrFN/Ddm3AE1vhC49ETOx0QWN771i7Q+a3cG0JgMMcEO+J
         hXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769441042; x=1770045842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yVu1ReH+c7rd4aE1iXaT/w2lsFOnYMZrk5qdB84Rw/4=;
        b=UPDeHyQGju8byin0XXPs0YsvS/C2eTlCtcW1UEOOZsMG3x/OqYKGcQT35I5OAm+wJH
         mH23q9t/TecmJV+GmJTLKXceSikeFwZcgCP2GaJPw2Iint7H/QtYSF7yUZ6kG72Gl4MI
         /VUu0LQSN8HIDpcpdWsJ+aZrnWj39jOO1cb9jiCbZC2PU7QND6uFO1ocee/JCKH8Z4DR
         S1GgtEwcfj0n3CN2j/b37mBdBe1Ahv5wjFb2rSO/eTjeXL3NQKV02v7I/XJ+axA8N6qx
         TOtv7bh6WXdQlCYq6cEOjquRbbb5ASl2d2qyRIY7YIpI0lzmKDBcWuiVHuUMU1FGFGTy
         kmbg==
X-Gm-Message-State: AOJu0YxIUfIGwT3euehGmMuaI9nPwvTSOs1xNXelO0EdMpVh83kqUtBj
	oe9pngVagxIFZc9m9jwocr3dZZWcSSpF0uy0MfP79SvZ48dTkCWnaidy/VYAvudzBhvjZw==
X-Gm-Gg: AZuq6aIlYgAueMxq+kfP1NNSi4ccllHLaAECz/JMWtYC+Mx1GhUyaXvdL5fEfxzRHzi
	uP0Z1zL1TFVVgUOeMnNOAlFECvm98Ah+g0AEYz8mKoNHpZemcjfHeMAl2Q7Aj2wQuSyBWz0/0Oy
	KLgRafSLIVthlLrIx/SMiRkCWjtBUFXseTfhFTdhlX62iBgoMk0XaZcfHyMvCfymnks9lPgiENg
	3yDrYm96VjPM6LjzQyk0pttCXs7c/rh7AnJ05XC2C+eTu0IW5kTtS6fhhv5EtRyNqZK4k5jyt7D
	qOznMFZwhKjm7AmAXQg5Zusg0r9fteRMQJvn2cJLSWoG9JMhFB+OU3l6U7RwEYZwXa2sNPqHdPq
	b8MCCe7NJDIV1XTPO3MT+Yw2iGwot8ii1KDiZB/IQvGhXvwI8Y6L20Rs/zhf/eYWen2vQB6/fn0
	phEe5rpHyJU7aYm4GGk/8w89fUWr7M3j8ThuBjTSkpadG+t1XxGaVYj7UVwY3GBQ23IQDk3sYwi
	xBZDtKq2pY+E00WKz56fW7Kkw==
X-Received: by 2002:a05:6214:5091:b0:88f:cd1c:68a8 with SMTP id 6a1803df08f44-894b08d6cdfmr62337906d6.49.1769441041956;
        Mon, 26 Jan 2026 07:24:01 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6e3870c48sm1044157185a.51.2026.01.26.07.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 07:24:00 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 05/07] linux-yocto/6.18: update to v6.18.6
Date: Mon, 26 Jan 2026 10:23:51 -0500
Message-ID: <20260126152353.2328046-6-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126152353.2328046-1-bruce.ashfield@gmail.com>
References: <20260126152353.2328046-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 15:24:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230016

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.18 to the latest korg -stable release that comprises
the following commits:

    b6fe42bc55af Linux 6.18.6
    69695f5331d4 spi: cadence-quadspi: Prevent lost complete() call during indirect read
    81531bdea972 scsi: sg: Fix occasional bogus elapsed time that exceeds timeout
    90f5dd44d9bf ASoC: fsl_sai: Add missing registers to cache default
    b3f89f6582e0 ALSA: hda/realtek: enable woofer speakers on Medion NM14LNL
    65f6ae1fdf22 ASoC: amd: yc: Add quirk for Honor MagicBook X16 2025
    003994f3b014 ALSA: usb-audio: Update for native DSD support quirks
    530ec35c211e block: validate pi_offset integrity limit
    79dd3f1d9dd3 can: j1939: make j1939_session_activate() fail if device is no longer registered
    9fd86747daa6 drm/amdkfd: Fix improper NULL termination of queue restore SMI event string
    6fcfcf792ce8 spi: mt65xx: Use IRQF_ONESHOT with threaded IRQ
    6db8e186c977 drm/amd/display: Fix DP no audio issue
    6a2049b7391b accel/amdxdna: Block running under a hypervisor
    a70fd483c4b9 ata: libata-core: Disable LPM on ST2000DM008-2FR102
    09d6074995c1 netfilter: nf_tables: avoid chain re-validation if possible
    9e2fcfc32467 powercap: fix sscanf() error return value handling
    d33cc39e9f7e powercap: fix race condition in register_control_type()
    cbbf6c1fe62b net: sfp: extend Potron XGSPON quirk to cover additional EEPROM variant
    737be05a7657 bpf: Fix reference count leak in bpf_prog_test_run_xdp()
    31e37f44b606 bpf, test_run: Subtract size of xdp_frame from allowed metadata size
    7ea26e6dcabc gpio: mpsse: fix reference leak in gpio_mpsse_probe() error paths
    7882637ea5cc gpio: mpsse: add quirk support
    472d900c8bca gpio: mpsse: ensure worker is torn down
    4374a1cac13e btrfs: fix beyond-EOF write handling
    9cb1a586c78a btrfs: use variable for end offset in extent_writepage_io()
    3b7ca18f3509 btrfs: truncate ordered extent when skipping writeback past i_size
    ebdc99345399 erofs: fix file-backed mounts no longer working on EROFS partitions
    c65f0bafc98f erofs: don't bother with s_stack_depth increasing for now
    234409e0db77 irqchip/gic-v5: Fix gicv5_its_map_event() ITTE read endianness
    72e28774e964 ublk: fix use-after-free in ublk_partition_scan_work
    949647e7771a arp: do not assume dev_hard_header() does not change skb->head
    d93ba83fc3f5 net: enetc: fix build warning when PAGE_SIZE is greater than 128K
    ce6eef731aba net: usb: pegasus: fix memory leak in update_eth_regs_async()
    51ffd447bc37 net/sched: sch_qfq: Fix NULL deref when deactivating inactive aggregate in qfq_reset
    1251bbdb8f5b wifi: mac80211_hwsim: fix typo in frequency notification
    72f93dc6d1a6 net: airoha: Fix schedule while atomic in airoha_ppe_deinit()
    9e17d06663f3 HID: quirks: work around VID/PID conflict for appledisplay
    fb08fec72131 sparc/PCI: Correct 64-bit non-pref -> pref BAR resources
    397691633112 trace: ftrace_dump_on_oops[] is not exported, make it static
    6c0d642e8c58 block: don't merge bios with different app_tags
    086e2928c1da net: netdevsim: fix inconsistent carrier state after link/unlink
    334bbbbf4c80 selftests: drv-net: Bring back tool() to driver __init__s
    67550a1130b6 net/sched: act_api: avoid dereferencing ERR_PTR in tcf_idrinfo_destroy
    06dc322dcb20 net: sfp: return the number of written bytes for smbus single byte access
    0c63d5683eae udp: call skb_orphan() before skb_attempt_defer_free()
    2d6cde9953f9 Revert "dsa: mv88e6xxx: make serdes SGMII/Fiber tx amplitude configurable"
    0ad6d6e50e9d idpf: fix aux device unplugging when rdma is not supported by vport
    258e7c55f939 idpf: cap maximum Rx buffer size
    bfeb4dfc8050 idpf: Fix error handling in idpf_vport_open()
    ab92fa4dd81b idpf: Fix RSS LUT NULL ptr issue after soft reset
    9abe73eff87d idpf: Fix RSS LUT configuration on down interfaces
    b29a5a7dd1f4 idpf: Fix RSS LUT NULL pointer crash on early ethtool operations
    fe33b4252e4b idpf: fix issue with ethtool -n command display
    1aedff70a5e9 idpf: fix memory leak of flow steer list on rmmod
    a514c374edcd idpf: fix error handling in the init_task on load
    23391db8a00c idpf: fix memory leak in idpf_vc_core_deinit()
    ec602a2a4071 idpf: fix memory leak in idpf_vport_rel()
    ac122f5fb050 idpf: detach and close netdevs while handling a reset
    a9f5b61591d3 idpf: convert vport state to bitmap
    14c4fea11536 idpf: keep the netdev when a reset fails
    309a4c2fa676 PCI/VGA: Don't assume the only VGA device on a system is `boot_vga`
    c114a32a2e70 net: fix memory leak in skb_segment_list for GRO packets
    177c71d2709f riscv: pgtable: Cleanup useless VA_USER_XXX definitions
    5bfaf4fa3dc2 riscv: cpufeature: Fix Zk bundled extension missing Zknh
    8a6b410e3d0f net: airoha: Fix npu rx DMA definitions
    6d1b61b8e1e4 btrfs: fix NULL pointer dereference in do_abort_log_replay()
    07effd536ddc btrfs: only enforce free space tree if v1 cache is required for bs < ps cases
    92a559085114 btrfs: release path before initializing extent tree in btrfs_read_locked_inode()
    0185dc4b5b0e vsock: Make accept()ed sockets use custom setsockopt()
    543f8537b470 drm/amd/pm: force send pcie parmater on navi1x
    a1c0a4ccbe6d drm/amd/pm: fix wrong pcie parameter on navi1x
    deee9dfb111a perf: Ensure swevent hrtimer is properly destroyed
    088ca99dbb03 inet: frags: drop fraglist conntrack references
    a5e2d902f64c virtio_net: fix device mismatch in devm_kzalloc/devm_kfree
    e3c738138975 bnxt_en: Fix potential data corruption with HW GRO/LRO
    8181c79757cc net: wwan: iosm: Fix memory leak in ipc_mux_deinit()
    f2c4bcfa193e net/ena: fix missing lock when update devlink params
    b46675e1c593 net/mlx5e: Dealloc forgotten PSP RX modify header
    d35ab9fb5794 net/mlx5e: Don't print error message due to invalid module
    cba6cc0f4654 net/mlx5e: Don't gate FEC histograms on ppcnt_statistical_group
    658496325824 net/mlx5: Lag, multipath, give priority for routes with smaller network prefix
    8bdc624bf33d netdev: preserve NETIF_F_ALL_FOR_ALL across TSO updates
    e00b169eaac5 net: sock: fix hardened usercopy panic in sock_recv_errqueue
    fe71b71f0fe0 net: phy: mxl-86110: Add power management and soft reset support
    1511ba2d6846 inet: ping: Fix icmp out counting
    f490af47bbee net: mscc: ocelot: Fix crash when adding interface under a lag
    b53fca69f455 bridge: fix C-VLAN preservation in 802.1ad vlan_tunnel egress
    326a4b7e61d0 net: marvell: prestera: fix NULL dereference on devlink_alloc() failure
    8bdafdf49000 netfilter: nf_conncount: update last_gc only when GC has been performed
    7f066cba650c netfilter: nf_tables: fix memory leak in nf_tables_newrule()
    58dac9b28a57 gpio: pca953x: handle short interrupt pulses on PCAL devices
    fb674c8f1a5d gpiolib: fix race condition for gdev->srcu
    aaa24eeb63ad gpiolib: rename GPIO chip printk macros
    97531f8e50d9 gpiolib: remove unnecessary 'out of memory' messages
    75bfb05067d6 netfilter: nft_synproxy: avoid possible data-race on update operation
    704c0258f0d7 netfilter: nft_set_pipapo: fix range overlap detection
    499c0db5862f arm64: dts: mba8mx: Fix Ethernet PHY IRQ support
    646d415f9860 arm64: dts: imx8qm-ss-dma: correct the dma channels of lpuart
    4977cac699a4 arm64: dts: imx8mp: Fix LAN8740Ai PHY reference clock on DH electronics i.MX8M Plus DHCOM
    5b5ef7049ebe arm64: dts: freescale: tx8p-ml81: fix eqos nvmem-cells
    f267ced2bcb0 arm64: dts: freescale: moduline-display: fix compatible
    2c3f04f1f70c ARM: dts: imx6q-ba16: fix RTC interrupt level
    88244021003b arm64: dts: add off-on-delay-us for usdhc2 regulator
    c200328fd57f arm64: dts: imx8qm-mek: correct the light sensor interrupt type to low level
    42b66f4557a2 crypto: qat - fix duplicate restarting msg during AER error
    7fd534abaa39 pinctrl: mediatek: mt8189: restore previous register base name array order
    5b5482c0e5ee netfs: Fix early read unlock of page with EOF in middle
    b95a6e3b0d5d HID: Intel-thc-hid: Intel-thc: Fix wrong register reading
    a5eeebb994bf HID: Intel-thc-hid: Intel-thc: fix dma_unmap_sg() nents value
    737f341080f4 gpio: it87: balance superio enter/exit calls in error path
    43c2e3670334 gpu: nova-core: select RUST_FW_LOADER_ABSTRACTIONS
    93900292af11 arm64: dts: ti: k3-am62-lp-sk-nand: Rename pinctrls to fix schema warnings
    c5ebc38066ce arm64: dts: ti: k3-am642-phyboard-electra-x27-gpio1-spi1-uart3: Fix schema warnings
    0d4087c74869 arm64: dts: ti: k3-am642-phyboard-electra-peb-c-010: Fix icssg-prueth schema warning
    f09b0f705bd7 of: unittest: Fix memory leak in unittest_data_add()
    c8385851a543 btrfs: fix use-after-free warning in btrfs_get_or_create_delayed_node()
    99e057f3d3ef btrfs: fix NULL dereference on root when tracing inode eviction
    1ee62906cbd9 btrfs: qgroup: update all parent qgroups when doing quick inherit
    7d59377ada9f btrfs: fix qgroup_snapshot_quick_inherit() squota bug
    5f0fd06d7571 scsi: Revert "scsi: libsas: Fix exp-attached device scan after probe failure scanned in again after probe failed"
    f1e2d448ccc1 scsi: ufs: core: Fix EH failure after W-LUN resume error
    3a96f7f2677a scsi: ipr: Enable/disable IRQD_NO_BALANCING during reset
    382028023669 scsi: mpi3mr: Prevent duplicate SAS/SATA device entries in channel 1
    aba03b371632 smb/client: fix NT_STATUS_NO_DATA_DETECTED value
    d4959a7900af smb/client: fix NT_STATUS_DEVICE_DOOR_OPEN value
    e2c146263966 smb/client: fix NT_STATUS_UNABLE_TO_FREE_VM value
    f1ae589310e1 drm/amd/display: shrink struct members
    93ee5471731b ALSA: hda/realtek: Add support for ASUS UM3406GA
    ab775cc784f6 NFS: Fix up the automount fs_context to use the correct cred
    8e73e0ee4530 ASoC: rockchip: Fix Wvoid-pointer-to-enum-cast warning (again)
    d82f6d1d43b3 NFSv4: ensure the open stateid seqid doesn't go backwards
    6930c0229fb3 dm-snapshot: fix 'scheduling while atomic' on real-time kernels
    232948cf600f dm-verity: disable recursive forward error correction
    fea0f86e4613 alpha: don't reference obsolete termio struct for TC* constants
    9f53cfb9f4c2 ARM: 9461/1: Disable HIGHPTE on PREEMPT_RT kernels
    8ad9e930fb91 csky: fix csky_cmpxchg_fixup not working
    c88717b10792 ALSA: hda: intel-dsp-config: Prefer legacy driver as fallback
    a1d420370a24 ublk: reorder tag_set initialization before queue allocation
    5647d42c47b5 libceph: make calc_target() set t->paused, not just clear it
    10b7c7281036 libceph: reset sparse-read state in osd_fault()
    9e0101e57534 libceph: return the handler error from mon_handle_auth_done()
    f21c3fdb9683 libceph: make free_choose_arg_map() resilient to partial allocation
    6348d70af847 libceph: replace overzealous BUG_ON in osdmap_apply_incremental()
    2d653bb63d59 libceph: prevent potential out-of-bounds reads in handle_auth_done()
    b97be67dc06e wifi: mac80211: restore non-chanctx injection behaviour
    e3c35177103e wifi: avoid kernel-infoleak from struct iw_point
    5c12a13522f4 Revert "drm/mediatek: dsi: Fix DSI host and panel bridge pre-enable order"
    b7a883b0135d PM: hibernate: Fix crash when freeing invalid crypto compressor
    ea7a54393d50 pinctrl: qcom: lpass-lpi: mark the GPIO controller as sleeping
    391adca8e213 PCI: meson: Report that link is up while in ASPM L0s and L1 states
    2b9c15286a17 io_uring/io-wq: fix incorrect io_wq_for_each_worker() termination logic
    3aa67687d558 gpio: rockchip: mark the GPIO controller as sleeping
    b88191562d92 drm/radeon: Remove __counted_by from ClockInfoArray.clockInfo[]
    227997d16a53 drm/tidss: Fix enable/disable order
    124b9d19e1d5 drm/pl111: Fix error handling in pl111_amba_probe
    8a8bf7ed8230 drm/atomic-helper: Export and namespace some functions
    1f50931f79dc drm/amdgpu: Fix query for VPE block_type and ip_count
    b023b3f236e8 drm/amd/display: Apply e4479aecf658 to dml
    1d8b1ac985c9 arm64: dts: imx95: correct I3C2 pclk to IMX95_CLK_BUSWAKEUP
    00d880c469b7 ALSA: hda/tas2781: properly initialize speaker_id for TAS2563
    cb73d37ac18b ALSA: ac97: fix a double free in snd_ac97_controller_register()
    c12df0f5ca41 Revert "drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
    0ce45b2426f9 nouveau: don't attempt fwsec on sb on newer platforms.
    64a0d47e0c32 riscv: boot: Always make Image from vmlinux, not vmlinux.unstripped
    5b7f91acffd2 tracing: Add recursion protection in kernel stack trace recording
    425886b1f830 counter: interrupt-cnt: Drop IRQF_NO_THREAD flag
    844f521604bd counter: 104-quad-8: Fix incorrect return value in IRQ handler
    a0b28dd06a9a lib/crypto: aes: Fix missing MMU protection for AES S-box
    30a98c97f787 rust_binder: remove spin_lock() in rust_shrink_free_page()
    86e49948b0e6 mei: me: add nova lake point S DID
    d52af58dd463 btrfs: always detect conflicting inodes when logging inode refs
    0174d5466cae bnxt_en: Fix NULL pointer crash in bnxt_ptp_enable during error cleanup
    e86c4ee5a029 arm64: Fix cleared E0POE bit after cpu_suspend()/resume()
    ffa2be496ef6 net: do not write to msg_get_inq in callee
    d82796a57cc0 net: 3com: 3c59x: fix possible null dereference in vortex_probe1()
    4ae815bfcfad atm: Fix dma_free_coherent() size
    0f7fb819d63f NFSD: Remove NFSERR_EAGAIN
    db78fa4b9f1f NFSD: net ref data still needs to be freed even if net hasn't startup
    e06c9f6c0f55 nfsd: check that server is running in unlock_filesystem
    099a880ef541 nfsd: use correct loop termination in nfsd4_revoke_states()
    53f07d095e7e nfsd: provide locking for v4_end_grace
    a339b0168251 NFSD: Fix permission check for read access to executable-only files

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.18.bb              |  6 ++---
 .../linux/linux-yocto-tiny_6.18.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index 76eb891a04..2a10815684 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "878f4a23dbbd21b2eaa97cd82be39db3131f26e3"
-SRCREV_meta ?= "d8bded29848649b362d0376692bd86a5f6ebc7e0"
+SRCREV_machine ?= "2ec883ec1af76529a27558fde434a5ae64dee7ab"
+SRCREV_meta ?= "1fbfcbd8a3ce8df814f51ef8710fc0197ff01986"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.18.5"
+LINUX_VERSION ?= "6.18.6"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index 6904ce5f56..ce564d842c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.18.inc
 
-LINUX_VERSION ?= "6.18.5"
+LINUX_VERSION ?= "6.18.6"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "0d1b47da567fe4d6ff80c562b706e7a9232d3553"
-SRCREV_meta ?= "d8bded29848649b362d0376692bd86a5f6ebc7e0"
+SRCREV_machine ?= "3e243d2a1151b1ccb42f80f81c6d77f0af327a3d"
+SRCREV_meta ?= "1fbfcbd8a3ce8df814f51ef8710fc0197ff01986"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 599a3d13b8..daa0cb51d1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "9e147c72113ebc9bc50a4709953834da3c7f76dc"
-SRCREV_machine:qemuarm64 ?= "0d1b47da567fe4d6ff80c562b706e7a9232d3553"
-SRCREV_machine:qemuloongarch64 ?= "0d1b47da567fe4d6ff80c562b706e7a9232d3553"
+SRCREV_machine:qemuarm ?= "ee78c602479902ccc042f3b2c6467a6a1b2010e1"
+SRCREV_machine:qemuarm64 ?= "3e243d2a1151b1ccb42f80f81c6d77f0af327a3d"
+SRCREV_machine:qemuloongarch64 ?= "3e243d2a1151b1ccb42f80f81c6d77f0af327a3d"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "0d1b47da567fe4d6ff80c562b706e7a9232d3553"
-SRCREV_machine:qemuriscv64 ?= "0d1b47da567fe4d6ff80c562b706e7a9232d3553"
-SRCREV_machine:qemuriscv32 ?= "0d1b47da567fe4d6ff80c562b706e7a9232d3553"
-SRCREV_machine:qemux86 ?= "0d1b47da567fe4d6ff80c562b706e7a9232d3553"
-SRCREV_machine:qemux86-64 ?= "0d1b47da567fe4d6ff80c562b706e7a9232d3553"
+SRCREV_machine:qemuppc ?= "3e243d2a1151b1ccb42f80f81c6d77f0af327a3d"
+SRCREV_machine:qemuriscv64 ?= "3e243d2a1151b1ccb42f80f81c6d77f0af327a3d"
+SRCREV_machine:qemuriscv32 ?= "3e243d2a1151b1ccb42f80f81c6d77f0af327a3d"
+SRCREV_machine:qemux86 ?= "3e243d2a1151b1ccb42f80f81c6d77f0af327a3d"
+SRCREV_machine:qemux86-64 ?= "3e243d2a1151b1ccb42f80f81c6d77f0af327a3d"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "0d1b47da567fe4d6ff80c562b706e7a9232d3553"
-SRCREV_meta ?= "d8bded29848649b362d0376692bd86a5f6ebc7e0"
+SRCREV_machine ?= "3e243d2a1151b1ccb42f80f81c6d77f0af327a3d"
+SRCREV_meta ?= "1fbfcbd8a3ce8df814f51ef8710fc0197ff01986"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "dc554c8fb361f13580da3f5a98ad8b494a788666"
+SRCREV_machine:class-devupstream ?= "b6fe42bc55af3fb17c8c03def2f8a1f7fa907af6"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.18/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.18.5"
+LINUX_VERSION ?= "6.18.6"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


