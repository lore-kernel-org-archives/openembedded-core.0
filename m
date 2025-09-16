Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D9FBCAC598
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 15:51:27 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.2132.1758037883364596616
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 08:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q6i14H8j;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-78cce797cc2so8470706d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 08:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758037882; x=1758642682; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0SRvrZz4D0KBj4R+M5Rd2N9nVGRAR/HxUPTp6fYsN8I=;
        b=Q6i14H8jAWb6gvfBZw4RjofXi0Ju7p7M3eJfKVC9HCvZJssbB50Od8UwrDGTSUqmS1
         w6ukLnOIqz+hsVawvmdch8Mgo4dupknJ4f+0CcMcQBzQHP1GXOp0p5mmPjxBwb7rlIss
         ghT+QJVJHh6Ol4w0lrLvM4P6DDlSddGiya952iQY7LD/jh+ob3ozy01sIVT2ANeFJkQe
         Cab9Zu+AkK14BVxCDghkI6R4aoSQVVe4bf87Gt/IrG6smKGAd7pJok+HtnNqMCyXZOpb
         DHDK3DeDV4CyHju0/uc3B/uaMkuZXUK6i/RIpUiifa1qtRg8G2Eo0DglQdXZJB0MfzIJ
         NkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758037882; x=1758642682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0SRvrZz4D0KBj4R+M5Rd2N9nVGRAR/HxUPTp6fYsN8I=;
        b=qsx4bii/MwFuz4/f2KGCGNGX7liqo/oZ03iuRaWrnF7Op7arCMAfIvFtwJAvHlj1zz
         3zCSd4ASwBEYcgM6X+uuD5MG9nAup5J773G2EQ/HLCye452bbnj9dBMOiCnXgUGDwJ3E
         iLOw/RL1uUHb7Ah9lBsXY9UjOb936RIpTLkqhk1le7JMcQ8tUJgLV2nghWyebaMai2gt
         W+5WYZu7lPMKCQFckHFpKV8+Tc0WVBHpk3S6e/E6xSpf9igAgVblg4wm+dV+zcLIhBCj
         /Bk3+Yv/lxfRhs3u4R0XR7POQDxiNgmfpkZOb4WEDoSvg9xY1ZcmZwnC3o71/WuBk2Mu
         aSVA==
X-Gm-Message-State: AOJu0YxCayd/daeE1E31ebIpnhmr7bcHM6Jvbrf/JzxZAVOW4JtLnROx
	h5yiof59F+FfEUhFBU/ticjjinSl00jOV8ZLOoEYvm8Gik8sovuP7bk9YPuCtb9h
X-Gm-Gg: ASbGncs4zX8TN2O+jPuE9aqsXSNvyPGhmI/iXgBEt17e/z6/eGo0DPhHee5BbHiN/s9
	PjeiIViqp+tmItwxqKULL4OsdscT8NRZbMEoyIbHi+CR9HR4wJlXSX5RDVIWmDcW2d8l0l+Uyeo
	nQBUkMgoOHh+vz9VdPTNBG8nhSRjxCU7XAZvjGeXHGbFAPWGDcTy88NZA86l9NP09xggWIKxgua
	LByttFK6sgWha28SFCbl5esECqZE8IwR9YpsC4utxvb71gRX8LIAT1FL+i07mHJaNK931yTwgsy
	O0fkR2ZI9LN3gPsk4VaS42Y0ijMHP3DItxCAInQrZUBcQwv13G4xat2osqF+JeS0wxOVG/IgRBh
	nwUQIp63nfayQqIWCq8c2pJv80Uab85JlPgVOJ9i76zuj/3+cRBcm807Va3Nb61wFaahBi75ScD
	88RKNIcXcPY3X/NbuWPBbWVUk+2SrUH1JMU/NntlXSL8t1agPODNeizbM=
X-Google-Smtp-Source: AGHT+IG81Sz2+JBvtui0Nv/BC6VAcgQtUK1HYdtzcyjWN1/QtxQ3KTclZarh65RNTO6baRMTyOLC5g==
X-Received: by 2002:ad4:4ee5:0:b0:726:c288:a666 with SMTP id 6a1803df08f44-767c56218f4mr195042956d6.59.1758037881816;
        Tue, 16 Sep 2025 08:51:21 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-786c9c68cd2sm33724456d6.7.2025.09.16.08.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 08:51:21 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] linux-yocto/6.16: update to v6.16.7
Date: Tue, 16 Sep 2025 11:51:16 -0400
Message-Id: <20250916155119.1583243-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 15:51:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223564

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.16 to the latest korg -stable release that comprises
the following commits:

no ids found, dumping:
    131e2001572ba Linux 6.16.7
    a6b94f1030917 x86/vmscape: Add old Intel CPUs to affected list
    2bb658abee57f x86/vmscape: Warn when STIBP is disabled with SMT
    923ab9f5743de x86/bugs: Move cpu_bugs_smt_update() down
    9c23a90648e83 x86/vmscape: Enable the mitigation
    510603f504796 x86/vmscape: Add conditional IBPB mitigation
    d83e6111337f3 x86/vmscape: Enumerate VMSCAPE bug
    781b69117c839 Documentation/hw-vuln: Add VMSCAPE documentation
    1037d3a33ba60 Linux 6.16.6
    b5b8685e13885 Revert "drm/i915/gem: Allow EXEC_CAPTURE on recoverable contexts on DG1"
    6976744651f8c riscv: Fix sparse warning about different address spaces
    8b94eb38bf7fc riscv: Fix sparse warning in __get_user_error()
    0e2243cc719f3 riscv: kexec: Initialize kexec_buf struct
    11d86a69dd7f6 riscv, bpf: use lw when reading int cpu in bpf_get_smp_processor_id
    fc11ff5cad08e riscv, bpf: use lw when reading int cpu in BPF_MOV64_PERCPU_REG
    b5176a7d4593b riscv: use lw when reading int cpu in asm_per_cpu
    b363a9e06b791 riscv: use lw when reading int cpu in new_vmalloc_check
    f4bf4771c33d7 riscv: uaccess: fix __put_user_nocheck for unaligned accesses
    b884f96b99e9c riscv: Only allow LTO with CMODEL_MEDANY
    25acf99edbb91 ACPI: RISC-V: Fix FFH_CPPC_CSR error handling
    4d9378e846a09 drm/i915/gem: Allow EXEC_CAPTURE on recoverable contexts on DG1
    91b2601bd2b25 md: prevent incorrect update of resync/recovery offset
    fbd879fc77ebb md/raid1: fix data lost for writemostly rdev
    927f06d82bc0a tools: gpio: remove the include directory on make clean
    17c1e414bdf8a drm/amd/amdgpu: Fix missing error return on kzalloc failure
    e4de48e66af17 spi: spi-qpic-snand: unregister ECC engine on probe error and device remove
    94ed86f35712c perf bpf-utils: Harden get_bpf_prog_info_linear
    355746d9c4c03 perf bpf-utils: Constify bpil_array_desc
    f3bf21de0b192 perf bpf-event: Fix use-after-free in synthesis
    9167bb686dfeb drm/bridge: ti-sn65dsi86: fix REFCLK setting
    0b2cca4ace91a hwmon: (ina238) Correctly clamp power limits
    6bc941d245246 hwmon: (ina238) Correctly clamp shunt voltage limit
    765c24377ba87 spi: spi-fsl-lpspi: Clear status register after disabling the module
    754f6170d9467 spi: spi-fsl-lpspi: Reset FIFO and disable module on transfer abort
    2255b03e254c6 spi: spi-fsl-lpspi: Set correct chip-select polarity bit
    6768188268067 spi: spi-fsl-lpspi: Fix transmissions when using CONT
    28cd1a1938d2e scsi: sr: Reinstate rotational media flag
    db936356012c7 hwmon: (ina238) Correctly clamp temperature
    71895f8bc84a2 hwmon: mlxreg-fan: Prevent fans from getting stuck at 0 RPM
    74286dde3dff5 platform/x86/intel: power-domains: Use topology_logical_package_id() for package ID
    cbb4ff4faa02e platform/x86: acer-wmi: Stop using ACPI bitmap for platform profile choices
    e7a70326fb26b platform/x86: asus-wmi: Fix racy registrations
    796eac3ab5e49 platform/x86: asus-wmi: Remove extra keys from ignore_key_wlan quirk
    369bf6e241506 pcmcia: Add error handling for add_interval() in do_validate_mem()
    afc07186508fd pcmcia: omap: Add missing check for platform_get_resource
    bafcd9a0904c8 ALSA: hda: tas2781: reorder tas2563 calibration variables
    5601628904a4e ALSA: hda: tas2781: fix tas2563 EFI data endianness
    1dfa6e6660521 ALSA: hda/realtek: Fix headset mic for TongFang X6[AF]R5xxY
    cfe842782fa5e ALSA: hda/hdmi: Add pin fix for another HP EliteDesk 800 G4 model
    d4797bdb25ada rust: support Rust >= 1.91.0 target spec
    0fe5997644db7 drm/dp: Change AUX DPCD probe address from LANE0_1_STATUS to TRAINING_PATTERN_SET
    a0d0606bfdc03 microchip: lan865x: Fix LAN8651 autoloading
    1671a3ba1b20e microchip: lan865x: Fix module autoloading
    d9e6c6b87b3b3 net: pcs: rzn1-miic: Correct MODCTRL register offset
    686b70cf18c7f net: dsa: mv88e6xxx: Fix fwnode reference leaks in mv88e6xxx_port_setup_leds
    0aec321128348 e1000e: fix heap overflow in e1000_set_eeprom
    3c26a8d30ed6b cifs: prevent NULL pointer dereference in UTF16 conversion
    a67c6397fcb7e batman-adv: fix OOB read/write in network-coding decode
    9735a9dcc3074 audit: fix out-of-bounds read in audit_compare_dname_path()
    576b3139e6a06 nouveau: Membar before between semaphore writes and the interrupt
    fc988f315be1a nouveau: fix disabling the nonstall irq due to storm code
    897f64b01c124 scsi: lpfc: Fix buffer free/clear order in deferred receive path
    0dd4a4cc9afdd platform/x86/amd/pmc: Add TUXEDO IB Pro Gen10 AMD to spurious 8042 quirks list
    dc2631d967657 drm/amdgpu/sdma: bump firmware version checks for user queue support
    6c6eaa2686d05 drm/amd/display: Clear the CUR_ENABLE register on DCN314 w/out DPP PG
    7d689cd99000e drm/amdgpu/mes11: make MES_MISC_OP_CHANGE_CONFIG failure non-fatal
    f4dbf2378a338 drm/amdgpu: drop hw access in non-DC audio fini
    658e7c743b359 drm/xe: Fix incorrect migration of backed-up object to VRAM
    ac8a13f35d5b8 spi: microchip-core-qspi: stop checking viability of op->max_freq in supports_op callback
    18dc52894e581 net: ethernet: oa_tc6: Handle failure of spi_setup
    e3d63ba3c8939 wifi: mt76: mt7925: skip EHT MLD TLV on non-MLD and pass conn_state for sta_cmd
    c7543945218b2 wifi: mt76: mt7925: fix the wrong bss cleanup for SAP
    f49502797dda5 wifi: mt76: mt7996: Initialize hdr before passing to skb_put_data()
    c6dbd5b27bee7 wifi: mt76: mt7925u: use connac3 tx aggr check in tx complete
    5285b7009dc1e wifi: mwifiex: Initialize the chan_stats array to zero
    2f2a09eb89716 wifi: mac80211: do not permit 40 MHz EHT operation on 5/6 GHz
    6167d72fe59ab soc: qcom: mdt_loader: Deal with zero e_shentsize
    f3286ad8eeae1 of_numa: fix uninitialized memory nodes causing kernel panic
    c7468458f6222 proc: fix missing pde_set_flags() for net proc files
    85e66331b6060 ocfs2: prevent release journal inode after journal shutdown
    2616a517f9e2f kunit: kasan_test: disable fortify string checker on kasan_strings() test
    26fb3a4b5dfe2 kasan: fix GCC mem-intrinsic prefix with sw tags
    b921c288cd8ab sched: Fix sched_numa_find_nth_cpu() if mask offline
    eb3240ffd243b mm: slub: avoid wake up kswapd in set_track_prepare
    28bdebd1a96c9 mm: fix possible deadlock in kmemleak
    458c3d3d5d0f3 mm: introduce and use {pgd,p4d}_populate_kernel()
    469f9d2275147 mm: move page table sync declarations to linux/pgtable.h
    cba402a1654f5 mm: fix accounting of memmap pages
    bd1ee62759d0b mm/userfaultfd: fix kmap_local LIFO ordering for CONFIG_HIGHPTE
    6bf9473727569 x86/mm/64: define ARCH_PAGE_TABLE_SYNC_MASK and arch_sync_kernel_mappings()
    3baa1da473e6e mm/slub: avoid accessing metadata when pointer is invalid in object_err()
    47c430e31bac0 rust: mm: mark VmaNew as transparent
    d7286005e8fde pcmcia: Fix a NULL pointer dereference in __iodyn_find_io_region()
    6bb712ab08468 arm64: ftrace: fix unreachable PLT for ftrace_caller in init_module with CONFIG_DYNAMIC_FTRACE
    01352cf09f616 ACPI/IORT: Fix memory leak in iort_rmr_alloc_sids()
    565d2c15b6c36 accel/ivpu: Prevent recovery work from being queued during device removal
    0bb3678a24cfe ALSA: usb-audio: Add mute TLV for playback volumes on some devices
    38a96e12700ed phy: mscc: Stop taking ts_lock for tx_queue and use its own lock
    539b6b94b1483 selftest: net: Fix weird setsockopt() in bind_bhash.c.
    33a5bac5f1477 ppp: fix memory leak in pad_compress_skb
    92e2fc92bc4eb net: xilinx: axienet: Add error handling for RX metadata pointer retrieval
    008db2e0c171d net: atm: fix memory leak in atm_register_sysfs when device_register fail
    48a3d045a01d7 netfilter: nf_tables: Introduce NFTA_DEVICE_PREFIX
    96040b27f0cda selftests: netfilter: fix udpclash tool hang
    b1c71d674a308 ax25: properly unshare skbs in ax25_kiss_rcv()
    dec6117dc4faf mctp: return -ENOPROTOOPT for unknown getsockopt options
    e5ea3347004c8 net/smc: Remove validation of reserved bits in CLC Decline message
    2e0a09caf438d ipv4: Fix NULL vs error pointer check in inet_blackhole_dev_init()
    ddb3952b8562d net: thunder_bgx: decrement cleanup index before use
    3b25d378cea2d net: thunder_bgx: add a missing of_node_put
    0c5eba454e885 net: lockless sock_i_ino()
    242124e3e3a7f net: remove sock_i_uid()
    bb137937410b7 tools: ynl-gen: fix nested array counting
    5cb7cab7adf9b wifi: cfg80211: sme: cap SSID length in __cfg80211_connect_result()
    d7d989786ad38 wifi: libertas: cap SSID len in lbs_associate()
    a7b20f5e2e96f wifi: cw1200: cap SSID length in cw1200_do_join()
    8cfa0f076842f vxlan: Fix NPD in {arp,neigh}_reduce() when using nexthop objects
    0e8630f24c14d vxlan: Fix NPD when refreshing an FDB entry with a nexthop object
    047a79ada2e0f net: ethernet: mtk_eth_soc: fix tx vlan tag for llc packets
    3d2b356d994a8 net/tcp: Fix socket memory leak in TCP-AO failure handling for IPv6
    9a394fd149502 wifi: ath11k: fix group data packet drops during rekey
    f1b8de7ff8d57 wifi: ath12k: Set EMLSR support flag in MLO flags for EML-capable stations
    129c1cb8a081a ixgbe: fix incorrect map used in eee linkmode
    9c21fc4cebd44 i40e: Fix potential invalid access when MAC list is empty
    7d190963b80f4 i40e: remove read access to debugfs files
    6275dc1c8c80e idpf: set mac type when adding and removing MAC filters
    923c267bdbb64 ice: fix NULL access of tx->in_use in ice_ll_ts_intr
    1467a873b2011 ice: fix NULL access of tx->in_use in ice_ptp_ts_irq
    485302905bada net: ethernet: ti: am65-cpsw-nuss: Fix null pointer dereference for ndev
    d6c3e9bfe7350 net: mctp: usb: initialise mac header in RX path
    058e422598330 net: mctp: mctp_fraq_queue should take ownership of passed skb
    34f17cbe02705 net/smc: fix one NULL pointer dereference in smc_ib_is_sg_need_sync()
    a3b3c20a80c33 macsec: read MACSEC_SA_ATTR_PN with nla_get_uint
    a4cb0a15ab8e6 net: macb: Fix tx_ptr_lock locking
    7b77d8841a98a eth: mlx4: Fix IS_ERR() vs NULL check bug in mlx4_en_create_rx_ring
    c3e20abfd33d8 icmp: fix icmp_ndo_send address translation for reply direction
    d7d0de9255c08 bnxt_en: fix incorrect page count in RX aggr ring log
    c274b62e70c8e selftests: drv-net: csum: fix interface name for remote host
    aaa30b728f346 mISDN: Fix memory leak in dsp_hwec_enable()
    f10d3c7267ac7 ptp: ocp: fix use-after-free bugs causing by ptp_ocp_watchdog
    07edb776309b9 xirc2ps_cs: fix register access when enabling FullDuplex
    e79923824c48b net_sched: gen_estimator: fix est_timer() vs CONFIG_PREEMPT_RT=y
    d927db98d4989 netfilter: nft_flowtable.sh: re-run with random mtu sizes
    3dff390f55ccd Bluetooth: Fix use-after-free in l2cap_sock_cleanup_listen()
    7cc08f2f127b9 Bluetooth: vhci: Prevent use-after-free by removing debugfs files early
    b9b9e95673f89 wifi: iwlwifi: cfg: add back more lost PCI IDs
    79be7358b7abf wifi: iwlwifi: cfg: restore some 1000 series configs
    60c2a809dac57 wifi: iwlwifi: uefi: check DSM item validity
    5deadb93925b2 wifi: iwlwifi: acpi: check DSM func validity
    a530078dede8b wifi: iwlwifi: if scratch is ~0U, consider it a failure
    fb3cd5557e4af netfilter: conntrack: helper: Replace -EEXIST by -EBUSY
    a74abcf0f09f5 netfilter: br_netfilter: do not check confirmed bit in br_nf_local_in() after confirm
    c91a59b04f928 wifi: mt76: fix linked list corruption
    79ed4e9d8624d wifi: mt76: free pending offchannel tx frames on wcid cleanup
    8fa8eb52bc2eb wifi: mt76: mt7915: fix list corruption after hardware restart
    69dcc19048fcd wifi: mt76: mt7996: add missing check for rx wcid entries
    98fa445f046e4 wifi: mt76: mt7996: use the correct vif link for scanning/roc
    eb19d5fb07ce5 wifi: mt76: mt7996: disable beacons when going offchannel
    731ea9b79921b wifi: mt76: prevent non-offchannel mgmt tx during scan/roc
    f614c33469f32 wifi: mt76: mt7925: fix locking in mt7925_change_vif_links()
    eab71f6d9c9e3 wifi: mt76: mt7921: don't disconnect when CSA to DFS chan
    2f6fbc8e04ca1 wifi: brcmfmac: fix use-after-free when rescheduling brcmf_btcoex_info work
    912c4b66bef71 wifi: cfg80211: fix use-after-free in cmp_bss()
    ad5d04d3af6c5 ARM: dts: microchip: sama7d65: Force SDMMC Legacy mode
    3da20d91bf3c3 arm64: dts: rockchip: Add supplies for eMMC on rk3588-orangepi-5
    ab47aff6eacbd arm64: dts: rockchip: Fix the headphone detection on the orangepi 5 plus
    e193a598d44c5 arm64: dts: imx8mp: Fix missing microSD slot vqmmc on Data Modul i.MX8M Plus eDM SBC
    4334484a9fab6 arm64: dts: imx8mp: Fix missing microSD slot vqmmc on DH electronics i.MX8M Plus DHCOM
    fad6a22f7c9ff arm64: dts: imx8mp-tqma8mpql: fix LDO5 power off
    5d5cc7f07e309 tee: optee: ffa: fix a typo of "optee_ffa_api_is_compatible"
    d885fd7ea8767 arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3399-pinebook-pro
    477d1047b42bc arm64: dts: rockchip: mark eeprom as read-only for Radxa E52C
    079cda5416f69 tee: fix memory leak in tee_dyn_shm_alloc_helper
    5e07a4235bb85 tee: fix NULL pointer dereference in tee_shm_put
    c8c14adf80bd1 fs: writeback: fix use-after-free in __mark_inode_dirty()
    016284a03e4b9 platform/x86/amd: pmc: Drop SMU F/W match for Cezanne
    0800d979754e6 btrfs: zoned: skip ZONE FINISH of conventional zones
    6edbd021384f2 btrfs: clear block dirty if submit_one_sector() failed
    e1ec77b94094a drm/rockchip: vop2: make vp registers nonvolatile
    33224433facf0 Bluetooth: hci_sync: Avoid adding default advertising on startup
    47f69d107dc89 cpupower: Fix a bug where the -t option of the set subcommand was not working.
    c4710623b0715 drm/amd/display: Don't warn when missing DCE encoder caps
    c89a3d2976926 cdc_ncm: Flag Intel OEM version of Fibocom L850-GL as WWAN
    c7f5d772cb457 LoongArch: Add cpuhotplug hooks to fix high cpu usage of vCPU threads
    b7c715b1f2db8 LoongArch: Save LBT before FPU in setup_sigcontext()
    76ff6437b42f9 ALSA: usb-audio: Allow Focusrite devices to use low samplerates
    1b1a33795a69f ASoC: SOF: Intel: WCL: Add the sdw_process_wakeen op
    391203f7684a1 ASoC: rsnd: tidyup direction name on rsnd_dai_connect()
    1d282dcd46d97 ASoC: soc-core: care NULL dirver name on snd_soc_lookup_component_nolocked()
    e4d126372b354 btrfs: avoid load/store tearing races when checking if an inode was logged
    e1ed129365590 btrfs: fix race between setting last_dir_index_offset and inode logging
    6ef5d43fe1680 btrfs: fix race between logging inode and checking if it was logged before
    4645fefac0b24 Linux 6.16.5
    18e997eb3f197 thermal/drivers/mediatek/lvts_thermal: Add mt7988 lvts commands
    dcb1ca0f1292c thermal/drivers/mediatek/lvts_thermal: Add lvts commands and their sizes to driver data
    277c236369d3e thermal/drivers/mediatek/lvts_thermal: Change lvts commands array to static const
    05981233cf2e6 Revert "drm/dp: Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS"
    4e06c33aaa5dd firmware: qcom: scm: request the waitqueue irq *after* initializing SCM
    bcd14791ba62d firmware: qcom: scm: initialize tzmem before marking SCM as available
    6e7c7570cec6a firmware: qcom: scm: take struct device as argument in SHM bridge enable
    617ad64abf488 firmware: qcom: scm: remove unused arguments from SHM bridge routines
    29f50d2d45773 net: rose: fix a typo in rose_clear_routes()
    5d7f6c7c8e1f2 drm/amdgpu/gfx12: set MQD as appriopriate for queue types
    bd94b24e430dd drm/amdgpu/gfx11: set MQD as appriopriate for queue types
    b013c68c1e27c drm/amdgpu: update firmware version checks for user queue support
    3f46d1d3028ed drm/amdgpu/userq: fix error handling of invalid doorbell
    6c3f9d0e68cad drm/amd/amdgpu: disable hwmon power1_cap* for gfx 11.0.3 on vf mode
    fae58d0155a97 drm/mediatek: Fix device/node reference count leaks in mtk_drm_get_all_drm_priv
    e15b65e97a24a drm/msm/dpu: Initialize crtc_state to NULL in dpu_plane_virtual_atomic_check()
    b09382cf94f61 drm/nouveau: fix error path in nvkm_gsp_fwsec_v2
    6badb500f28bd drm/nouveau/disp: Always accept linear modifier
    84603ed1d73eb drm/xe/vm: Clear the scratch_pt pointer on error
    39fc2742ca14f xfs: do not propagate ENODATA disk errors into xattr code
    2809b4ad54d52 smb3 client: fix return code mapping of remap_file_range
    9a1e84d931aae net: usb: qmi_wwan: add Telit Cinterion LE910C4-WWX new compositions
    cc82c6dff548f fs/smb: Fix inconsistent refcnt update
    f09b0b4737110 dma/pool: Ensure DMA_DIRECT_REMAP allocations are decrypted
    6ed86bb11d564 blk-zoned: Fix a lockdep complaint about recursive locking
    6a0f13941c3b8 arm64: mm: Fix CFI failure due to kpti_ng_pgd_alloc function signature
    7f5fffcce99e2 Revert "drm/amdgpu: fix incorrect vm flags to map bo"
    183def8e4d786 HID: hid-ntrig: fix unable to handle page fault in ntrig_report_version()
    317daff171202 HID: wacom: Add a new Art Pen 2
    7ad5732b5c8d9 HID: logitech: Add ids for G PRO 2 LIGHTSPEED
    c5a2cced95d5e HID: quirks: add support for Legion Go dual dinput modes
    b8194c1ce4911 HID: elecom: add support for ELECOM M-DT2DRBK
    c13e95587583d HID: multitouch: fix slab out-of-bounds access in mt_report_fixup()
    72a4ec018c9e9 HID: asus: fix UAF via HID_CLAIMED_INPUT validation
    34ec932cdd270 x86/cpu/topology: Use initial APIC ID from XTOPOLOGY leaf on AMD/HYGON
    1b101bd8771dc x86/microcode/AMD: Handle the case of no BIOS microcode
    15bfe327c0d11 x86/cpu/intel: Fix the constant_tsc model check for Pentium 4
    6d28659b692a0 RISC-V: KVM: fix stack overrun when loading vlenb
    f57a4bd8d6cb5 KVM: x86: use array_index_nospec with indices that come from guest
    c45fcd475d2a5 drm/mediatek: mtk_hdmi: Fix inverted parameters in some regmap_update_bits calls
    390a61d284e1c io_uring/kbuf: always use READ_ONCE() to read ring provided buffer lengths
    3fdc52cb8471b net: macb: Disable clocks once
    71581a82f38e5 efivarfs: Fix slab-out-of-bounds in efivarfs_d_compare
    3ac5f54e47eb3 fbnic: Move phylink resume out of service_task and into open/close
    069eb65689974 l2tp: do not use sock_hold() in pppol2tp_session_get_sock()
    f6c2cc99fc238 sctp: initialize more fields in sctp_v6_from_sk()
    384210cceb187 net: rose: include node references in rose_neigh refcount
    203e4f42596ed net: rose: convert 'use' field to refcount_t
    188ec77b9920b net: rose: split remove and free operations in rose_remove_neigh()
    f4f411c068402 io_uring/kbuf: fix signedness in this_len calculation
    1505c0e01ce13 net: hv_netvsc: fix loss of early receive events from host during channel open.
    19a592efa56f7 net: stmmac: Set CIC bit only for TX queues with COE
    5a4ec12b2d6ee net: stmmac: xgmac: Correct supported speed modes
    f71b60e28658e net: stmmac: xgmac: Do not enable RX FIFO Overflow interrupts
    7b1a7ce6e8f2f net/mlx5e: Set local Xoff after FW update
    0802bdbd0e5d0 net/mlx5e: Update and set Xon/Xoff upon port speed set
    58d33407a9fec net/mlx5e: Update and set Xon/Xoff upon MTU set
    a189ac7061062 net/mlx5: Prevent flow steering mode changes in switchdev mode
    4b6789407d88c net/mlx5: Nack sync reset when SFs are present
    06d897148e796 net/mlx5: Fix lockdep assertion on sync reset unload event
    d0ac0788647c4 net/mlx5: Reload auxiliary drivers on fw_activate
    ca20c7a9ac945 net/mlx5: HWS, Fix pattern destruction in mlx5hws_pat_get_pattern error path
    3668ba8832f1f net/mlx5: HWS, Fix uninitialized variables in mlx5hws_pat_calc_nop error flow
    051fd8576a2e4 net/mlx5: HWS, Fix memory leak in hws_action_get_shared_stc_nic error flow
    86d13a6f49cb6 net/mlx5: HWS, Fix memory leak in hws_pool_buddy_init error path
    5c5f9f42680c2 bnxt_en: Fix stats context reservation logic
    c23655b69ec2a bnxt_en: Adjust TX rings if reservation is less than requested
    9ab6a9950f152 bnxt_en: Fix memory corruption when FW resources change during ifdown
    1228285399c56 net: macb: Fix offset error in gem_update_stats
    11a6bd4c111b3 phy: mscc: Fix when PTP clock is register and unregister
    8dc9a2db9e4d1 block: validate QoS before calling __rq_qos_done_bio()
    26dc1731d305c drm/xe: Don't trigger rebind on initial dma-buf validation
    70f7b3757644d drm/xe/vm: Don't pin the vm_resv during validation
    dc023a2821e41 drm/xe/xe_sync: avoid race during ufence signaling
    630c0e6064daf efi: stmm: Fix incorrect buffer allocation method
    ba82313c3cb62 net: dlink: fix multicast stats being counted incorrectly
    43fc5da8133ba mISDN: hfcpci: Fix warning when deleting uninitialized timer
    130dbfea172b2 Octeontx2-af: Fix NIX X2P calibration failures
    691d30b0cd45b octeontx2: Set appropriate PF, VF masks and shifts based on silicon
    aaec54254b02f drm/msm/dpu: Add a null ptr check for dpu_encoder_needs_modeset
    4437134c70418 dt-bindings: display/msm: qcom,mdp5: drop lut clock
    23786f49e1dba ixgbe: fix ixgbe_orom_civd_info struct layout
    6fdfa22260f3b ice: fix incorrect counter for buffer allocation failures
    a9dd49ee69aed ice: use fixed adapter index for E825C embedded devices
    379e7ef26c34b ice: don't leave device non-functional if Tx scheduler config fails
    db783756a7d7c ice: fix NULL pointer dereference in ice_unplug_aux_dev() on reset
    7359123a27ac0 drm/nouveau: remove unused memory target test
    0d6f4cb7b08fe drm/nouveau: remove unused increment in gm200_flcn_pio_imem_wr
    3ab9f5ad9baef atm: atmtcp: Prevent arbitrary write in atmtcp_recv_control().
    4e37da7d8b730 Octeontx2-vf: Fix max packet length errors
    69d75cb29e29a page_pool: fix incorrect mp_ops error handling
    42f0533d5aa74 Bluetooth: hci_sync: fix set_local_name race condition
    95fe796e047cb Bluetooth: hci_event: Disconnect device when BIG sync is lost
    b211e692e7312 Bluetooth: hci_event: Detect if HCI_EV_NUM_COMP_PKTS is unbalanced
    038e265999bdb Bluetooth: hci_event: Mark connection as closed during suspend disconnect
    03a54e430f827 Bluetooth: hci_event: Treat UNKNOWN_CONN_ID on disconnect as success
    7af23ab3235a5 Bluetooth: hci_conn: Make unacked packet handling more robust
    775fe690fd4a3 net: macb: fix unregister_netdev call order in macb_remove()
    7b5b1eec9f615 idpf: stop Tx if there are insufficient buffer resources
    b2eb0df4a8b75 idpf: replace flow scheduling buffer ring with buffer pool
    4de02114bab55 idpf: simplify and fix splitq Tx packet rollback error path
    9e20a0a4b0106 idpf: add support for Tx refillqs in flow scheduling mode
    207efc71c8b75 HID: input: report battery status changes immediately
    7450f1b95d5c5 HID: input: rename hidinput_set_battery_charge_status()
    8d49313e68927 powerpc/kvm: Fix ifdef to remove build warning
    9a94e9d8b50bc drm/mediatek: Add error handling for old state CRTC in atomic_disable
    82e74510142e4 drm/msm: update the high bitfield of certain DSI registers
    d7c5df524435a drm/msm/dpu: correct dpu_plane_virtual_atomic_check()
    127cbbe8fefea drm/msm/kms: move snapshot init earlier in KMS init
    ba3a3c4929bf8 HID: intel-thc-hid: Intel-quicki2c: Enhance driver re-install flow
    78d4cf0466c79 HID: intel-thc-hid: intel-thc: Fix incorrect pointer arithmetic in I2C regs save
    4adce86d4b13d HID: intel-thc-hid: intel-quicki2c: Fix ACPI dsd ICRS/ISUB length
    ff9c072d6b89f of: reserved_mem: Restructure call site for dma_contiguous_early_fixup()
    91b3d8efdfbea drm/msm: Defer fd_install in SUBMIT ioctl
    018afe914b712 net: ipv4: fix regression in local-broadcast routes
    6b4abb5b79280 vhost/net: Protect ubufs with rcu read lock in vhost_net_ubuf_put()
    d9eb5a95b4f99 platform/x86: int3472: add hpd pin support
    88e6c42e40dea io_uring/io-wq: add check free worker before create new worker
    9ee6dbfcf557e erofs: fix atomic context detection when !CONFIG_DEBUG_LOCK_ALLOC
    15e8cc0bf27b7 erofs: Fallback to normal access if DAX is not supported on extra device
    1e46ce777fa1f ASoC: rt1320: fix random cycle mute issue
    7a33a93b3d897 ASoC: rt721: fix FU33 Boost Volume control not working
    880bcc7b20ec8 ASoC: codecs: tx-macro: correct tx_macro_component_drv name
    289f945acb20b smb: client: fix race with concurrent opens in rename(2)
    dddeed19782df smb: client: fix race with concurrent opens in unlink(2)
    b08a26b87b234 scsi: core: sysfs: Correct sysfs attributes access rights
    857eb3e4d0333 vhost: Fix ioctl # for VHOST_[GS]ET_FORK_FROM_OWNER
    ba97b7a8a2089 Revert "virtio: reject shm region if length is zero"
    8d947540ee118 perf symbol-minimal: Fix ehdr reading in filename__read_build_id
    fbd4cf7ee4db6 ftrace: Fix potential warning in trace_printk_seq during ftrace_dump
    aa316a7eb47ab fgraph: Copy args in intermediate storage with entry
    10a5a83d0f2c8 of: dynamic: Fix use after free in of_changeset_add_prop_helper()
    da621fdd3b5b7 mips: lantiq: xway: sysctrl: rename the etop node
    922336e35db11 mips: dts: lantiq: danube: add missing burst length property
    437b883a58354 pinctrl: airoha: Fix return value in pinconf callbacks
    548998501eaf8 pinctrl: STMFX: add missing HAS_IOMEM dependency
    554589d67d939 of: reserved_mem: Add missing IORESOURCE_MEM flag on resources
    28f023beca38a of: dynamic: Fix memleak when of_pci_add_properties() failed
    000aa47a51233 trace/fgraph: Fix the warning caused by missing unregister notifier
    a9ae544dd70ca rtla: Check pkg-config install
    c535c699981b3 tools/latency-collector: Check pkg-config install
    d689135aa9c5e perf: Avoid undefined behavior from stopping/starting inactive events

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.16.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.16.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.16.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
index b86748d7d5..9f3f940b77 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c631c6cf05de829937afe048e6ae2fea15634cc8"
-SRCREV_meta ?= "6cd9824a84b5fd5c8557208a787252e31a063436"
+SRCREV_machine ?= "4ad01ee57e42c93abe2d26816875854c5e475f9e"
+SRCREV_meta ?= "d32229904a43cdac64d57932f997990519b6b773"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.16;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.16.4"
+LINUX_VERSION ?= "6.16.7"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
index 254e6727fe..da4f1032ea 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.16.inc
 
-LINUX_VERSION ?= "6.16.4"
+LINUX_VERSION ?= "6.16.7"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "01bcf423b031a36a070c7a983e45992e634fceb7"
-SRCREV_meta ?= "6cd9824a84b5fd5c8557208a787252e31a063436"
+SRCREV_machine ?= "4f0f726a99be121940c4fb44634584d4027073b3"
+SRCREV_meta ?= "d32229904a43cdac64d57932f997990519b6b773"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
index a773d8a426..17d4ae35ee 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.16/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.16/standard/base"
 KBRANCH:qemumips64 ?= "v6.16/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "b1d9863cd54ffc3b03ee0e270c86e8c99c88462c"
-SRCREV_machine:qemuarm64 ?= "01bcf423b031a36a070c7a983e45992e634fceb7"
-SRCREV_machine:qemuloongarch64 ?= "01bcf423b031a36a070c7a983e45992e634fceb7"
-SRCREV_machine:qemumips ?= "297e7bd12c944fd0746419990157ec1a7fb7ddf3"
-SRCREV_machine:qemuppc ?= "01bcf423b031a36a070c7a983e45992e634fceb7"
-SRCREV_machine:qemuriscv64 ?= "01bcf423b031a36a070c7a983e45992e634fceb7"
-SRCREV_machine:qemuriscv32 ?= "01bcf423b031a36a070c7a983e45992e634fceb7"
-SRCREV_machine:qemux86 ?= "01bcf423b031a36a070c7a983e45992e634fceb7"
-SRCREV_machine:qemux86-64 ?= "01bcf423b031a36a070c7a983e45992e634fceb7"
-SRCREV_machine:qemumips64 ?= "2459c29bf2c3d221fd6d3222c7200b368156986e"
-SRCREV_machine ?= "01bcf423b031a36a070c7a983e45992e634fceb7"
-SRCREV_meta ?= "6cd9824a84b5fd5c8557208a787252e31a063436"
+SRCREV_machine:qemuarm ?= "29139e9a27fc305eb999bf2d02086deb441753ba"
+SRCREV_machine:qemuarm64 ?= "4f0f726a99be121940c4fb44634584d4027073b3"
+SRCREV_machine:qemuloongarch64 ?= "4f0f726a99be121940c4fb44634584d4027073b3"
+SRCREV_machine:qemumips ?= "cd9be6bce5b979643b3ca76bbaf0fbe9680cc6c1"
+SRCREV_machine:qemuppc ?= "4f0f726a99be121940c4fb44634584d4027073b3"
+SRCREV_machine:qemuriscv64 ?= "4f0f726a99be121940c4fb44634584d4027073b3"
+SRCREV_machine:qemuriscv32 ?= "4f0f726a99be121940c4fb44634584d4027073b3"
+SRCREV_machine:qemux86 ?= "4f0f726a99be121940c4fb44634584d4027073b3"
+SRCREV_machine:qemux86-64 ?= "4f0f726a99be121940c4fb44634584d4027073b3"
+SRCREV_machine:qemumips64 ?= "14d54ff925a0fff26c30f6fe7eda8b0310f8f512"
+SRCREV_machine ?= "4f0f726a99be121940c4fb44634584d4027073b3"
+SRCREV_meta ?= "d32229904a43cdac64d57932f997990519b6b773"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "be15dab9a451155bdf3f5278608fe8dc67e07cc1"
+SRCREV_machine:class-devupstream ?= "131e2001572ba68b6728bcba91c58647168d237f"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.16/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.16;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.16.4"
+LINUX_VERSION ?= "6.16.7"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


