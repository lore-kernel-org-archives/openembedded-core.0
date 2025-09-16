Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F476CAC59B
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 15:51:27 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.2138.1758037885842750087
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 08:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gppupLi8;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-76ce24d1dcaso35360146d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 08:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758037885; x=1758642685; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upYIwn5AKqjNKOOgxAG8OURFwbdfmHmK5jP2NUK4CFQ=;
        b=gppupLi8ibwjW6BPAqjORiipPIGP4R7PVogCYHrBo5xrpCFB/O4MtCPYjVQku57Gy+
         PCTy9Ix1VH/pQeK2uEqZTdE5XBm/9VQmKVt3Bq8qNsi7JEgv+ohe6EJMhdB6VWl/QQMc
         NUcGe6PjfUrtXPsJLGV2zyQ2O6Oz6I5W5Sal8hOho3+LxKZmxGAdd/9fa9rq/0M32J/o
         nmAIA/KqNEvKazhvkgWJ+yhYm76wpCGCrtOqg0x0f4cymL0+eEisZopQdfr5yGOOR44h
         +2LM8ADX08pEoZPZbw9JAAw3NfmS3GAxfUPog8VaIYZx9Q2Oh/CS29wO0Yo/H3tztJdT
         0GIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758037885; x=1758642685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=upYIwn5AKqjNKOOgxAG8OURFwbdfmHmK5jP2NUK4CFQ=;
        b=XyIYqeUajposIigHCutxNrYEoJzUWcuwlcRIqwSfomYGMNXyuwGVcqDzudf+d47h2T
         MJGEfLhwbw2UacS5pkPhUEZQ/PpOjGOoTX9qKzY6SHBn3NskSkzBxi6vgYOwXlJzrLhN
         dbLA5a522BHZlEPlMHPnR/ETsNTKz+Y81PYEEDqTZNMGZVoFmLUVrk5lRj/2Bi3u5kWi
         Gopyf7yGTGFt2o/OcPAqQHO4b9yl12e5z6pd1NF6RJEDAXzR5TFtQ9du7wwPpy2tj1vs
         FWCBj6waLHIY7DfPMQ/TfeOFXf64XYbsyXSBkMiiC7R3kVKPWi7OF54+4LglpKB3mzrR
         LN6Q==
X-Gm-Message-State: AOJu0YwkezL5/Whxxnef8fv2H7i+IamADUHTcOjqbGetXnT+0dPIekYB
	tApzM/nybTNL8E2kQfk+8FsPFIzgziePOyjlrz3rt8hWJWPJfGrvAQPj/zAXXR8+
X-Gm-Gg: ASbGncuspEzunTcnWIxNPLldEXFsOcuDhjszOC/AO9cIeOrKyOhZYBvgD6WuW8dD6HO
	w6K6eAycyylWvYgtxoCDcJlm5NFt4MZilV9WZVSOs95EWzV0WFAinr4zGhf4rW/HMrLaKtvZWz8
	FzALHLvPbaBiN+Nxut3FWh0qCV4QyfSuEcbSEjz17aT+EzvY/0MiOC3rtWhl9+xGTJ+CwnTha2S
	0cUuP1V/fuOfHgqjPan/VqoTq+gCiivOYecsUOk3HMUcnxNwbHbgw3Gk45+NcrTK2yj2jhW7F0C
	7fozVY3x/Fs3PBmERf/fOAd069WWVUEJnkxANswaJX+I0XB5939Rdq3VuTTjwvYV/r4GOmLYkiO
	PCxF7fHiKQdrqpLkT+vGGxVuSVOXGd18wf35TEo4YIxI/GNj/uuhmcPZfaTgZ8dG0sMkV5Z5xPY
	SfP2T1OtjxLI73KTd0JRaKJ/mvopiZozmjLdQB4RWgcQvN0oPzFl7Yw18=
X-Google-Smtp-Source: AGHT+IF2MwqpdBqRLFxh2UW/E5y3JfsYReCHTRj0GoOi/Vj/rTumpG00/z9ueTamjzTNJHZUOQuVdg==
X-Received: by 2002:ad4:5ca9:0:b0:78a:992a:951e with SMTP id 6a1803df08f44-78a992a9950mr65534726d6.6.1758037884426;
        Tue, 16 Sep 2025 08:51:24 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-786c9c68cd2sm33724456d6.7.2025.09.16.08.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 08:51:23 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] linux-yocto/6.12: update to v6.12.47
Date: Tue, 16 Sep 2025 11:51:18 -0400
Message-Id: <20250916155119.1583243-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250916155119.1583243-1-bruce.ashfield@gmail.com>
References: <20250916155119.1583243-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 15:51:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223566

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

no ids found, dumping:
    f6cf124428f51 Linux 6.12.47
    766424cef1e6b x86/vmscape: Add old Intel CPUs to affected list
    8d675611b96a6 x86/vmscape: Warn when STIBP is disabled with SMT
    28504e31029b1 x86/bugs: Move cpu_bugs_smt_update() down
    459274c77b37a x86/vmscape: Enable the mitigation
    d7ddc93392e4a x86/vmscape: Add conditional IBPB mitigation
    7c62c442b6eb9 x86/vmscape: Enumerate VMSCAPE bug
    4c6fbb4dba3fc Documentation/hw-vuln: Add VMSCAPE documentation
    d497f0738df95 Linux 6.12.46
    cf3c7fd1c466b dmaengine: mediatek: Fix a flag reuse error in mtk_cqdma_tx_status()
    fd0333fe3cb17 md/raid1: fix data lost for writemostly rdev
    8352fdfc04db3 riscv, bpf: use lw when reading int cpu in bpf_get_smp_processor_id
    1a1e84c284169 riscv, bpf: use lw when reading int cpu in BPF_MOV64_PERCPU_REG
    fecd903917861 riscv: use lw when reading int cpu in asm_per_cpu
    8d164de928aa3 riscv: use lw when reading int cpu in new_vmalloc_check
    489be48ea1059 riscv: Only allow LTO with CMODEL_MEDANY
    fce8d4599b8c7 ACPI: RISC-V: Fix FFH_CPPC_CSR error handling
    514600ed8d85b md: prevent incorrect update of resync/recovery offset
    1affb649e221d tools: gpio: remove the include directory on make clean
    e9998d65bca2c drm/amd/amdgpu: Fix missing error return on kzalloc failure
    203719d82999b perf bpf-utils: Harden get_bpf_prog_info_linear
    150101bbe24ab perf bpf-utils: Constify bpil_array_desc
    25eac390c4af3 perf bpf-event: Fix use-after-free in synthesis
    beec8f807ecc2 drm/bridge: ti-sn65dsi86: fix REFCLK setting
    d0f379279cd84 spi: spi-fsl-lpspi: Clear status register after disabling the module
    15d3ab4858797 spi: spi-fsl-lpspi: Reset FIFO and disable module on transfer abort
    8d981d2230e90 spi: spi-fsl-lpspi: Set correct chip-select polarity bit
    ed635ec0b5458 spi: spi-fsl-lpspi: Fix transmissions when using CONT
    a5760d3fb6e35 scsi: sr: Reinstate rotational media flag
    0073c41d4b99f block: add a queue_limits_commit_update_frozen helper
    2ec315207ccb8 hwmon: mlxreg-fan: Prevent fans from getting stuck at 0 RPM
    212e17721839d platform/x86/intel: power-domains: Use topology_logical_package_id() for package ID
    ee1df9ba388bd platform/x86: asus-wmi: Remove extra keys from ignore_key_wlan quirk
    289b58f8ff319 pcmcia: Add error handling for add_interval() in do_validate_mem()
    278842aca27e4 pcmcia: omap: Add missing check for platform_get_resource
    2a7cf13dd6740 Revert "drm/amdgpu: Avoid extra evict-restore process."
    c5e6e56f2ce37 ALSA: hda/realtek: Fix headset mic for TongFang X6[AF]R5xxY
    ebdf11cf294aa ALSA: hda/hdmi: Add pin fix for another HP EliteDesk 800 G4 model
    17cab7b45f4db rust: support Rust >= 1.91.0 target spec
    585a593ad5e8b dmaengine: mediatek: Fix a possible deadlock error in mtk_cqdma_tx_status()
    523aefb90b593 thermal/drivers/mediatek/lvts: Disable low offset IRQ for minimum threshold
    1ee0e14814b88 mm: fix accounting of memmap pages
    a7f7d4223ff05 kunit: kasan_test: disable fortify string checker on kasan_strings() test
    607b2bf5708fe nouveau: fix disabling the nonstall irq due to storm code
    dda6ec365ab04 mm/slub: avoid accessing metadata when pointer is invalid in object_err()
    9cd3206f0126d mm, slab: cleanup slab_bug() parameters
    d06b739f41dcc mm: slub: call WARN() when detecting a slab corruption
    20a54a8db4dd8 mm: slub: Print the broken data before restoring them
    60196f92bbc79 md/md-bitmap: fix wrong bitmap_limit for clustermd when write sb
    59599bce44af3 net: fix NULL pointer dereference in l3mdev_l3_rcv
    fa4abd439f275 wifi: ath11k: update channel list in worker when wait flag is set
    26618c039b78a wifi: ath11k: update channel list in reg notifier instead reg worker
    eddca44ddf810 ext4: avoid journaling sb update on error if journal is destroying
    c868e9306ea6f ext4: define ext4_journal_destroy wrapper
    2c46c14fd386a md/raid1,raid10: strip REQ_NOWAIT from member bios
    ed6aac13dd9d6 md/raid1,raid10: don't handle IO error for REQ_RAHEAD and REQ_NOWAIT
    73506e581c0b1 md/raid1,raid10: don't ignore IO flags
    3fbe3f4c57fda net: dsa: b53: do not enable EEE on bcm63xx
    b765b9ee4e5a8 net: dsa: b53/bcm_sf2: implement .support_eee() method
    cda6c5c095e19 net: dsa: provide implementation of .support_eee()
    f7976772b16a7 net: dsa: add hook to determine whether EEE is supported
    6482c3dccbfb8 fs/fhandle.c: fix a race in call of has_locked_children()
    b9290581d2ecf microchip: lan865x: Fix LAN8651 autoloading
    fe03df84e19ef microchip: lan865x: Fix module autoloading
    bb8fd694ba6b4 net: pcs: rzn1-miic: Correct MODCTRL register offset
    b370f7b1f470a e1000e: fix heap overflow in e1000_set_eeprom
    1f797f062b5cf cifs: prevent NULL pointer dereference in UTF16 conversion
    20080709457bc batman-adv: fix OOB read/write in network-coding decode
    367cb5ffd8a8a scsi: lpfc: Fix buffer free/clear order in deferred receive path
    cc5911dc2f989 platform/x86/amd/pmc: Add TUXEDO IB Pro Gen10 AMD to spurious 8042 quirks list
    274668efe1a26 drm/amd/display: Clear the CUR_ENABLE register on DCN314 w/out DPP PG
    608a015c65cc9 drm/amdgpu: drop hw access in non-DC audio fini
    3573291c7901a net: ethernet: oa_tc6: Handle failure of spi_setup
    089fd41902ee6 wifi: mt76: mt7925: fix the wrong bss cleanup for SAP
    eefa2ad9009b2 wifi: mt76: mt7996: Initialize hdr before passing to skb_put_data()
    a001c2f6a40c1 wifi: mt76: mt7925u: use connac3 tx aggr check in tx complete
    06616410a3e5e wifi: mwifiex: Initialize the chan_stats array to zero
    2fae927c25bbf soc: qcom: mdt_loader: Deal with zero e_shentsize
    c2daa6eb47407 of_numa: fix uninitialized memory nodes causing kernel panic
    3eebe856d09b6 proc: fix missing pde_set_flags() for net proc files
    f4a917e6cd6c7 ocfs2: prevent release journal inode after journal shutdown
    28ef61701e298 kasan: fix GCC mem-intrinsic prefix with sw tags
    b3ec50cc5eb5c sched: Fix sched_numa_find_nth_cpu() if mask offline
    243b705a90ed8 mm: slub: avoid wake up kswapd in set_track_prepare
    cd0236550cf80 mm: fix possible deadlock in kmemleak
    4f7537772011f mm: move page table sync declarations to linux/pgtable.h
    b051f70701896 mm/userfaultfd: fix kmap_local LIFO ordering for CONFIG_HIGHPTE
    b7f4051dd3388 x86/mm/64: define ARCH_PAGE_TABLE_SYNC_MASK and arch_sync_kernel_mappings()
    094ba14a471cc io_uring/msg_ring: ensure io_kiocb freeing is deferred for RCU
    fafa7450075f4 pcmcia: Fix a NULL pointer dereference in __iodyn_find_io_region()
    650c14abe3031 arm64: ftrace: fix unreachable PLT for ftrace_caller in init_module with CONFIG_DYNAMIC_FTRACE
    d2b18756dbbba ACPI/IORT: Fix memory leak in iort_rmr_alloc_sids()
    54c49eca38dbd accel/ivpu: Prevent recovery work from being queued during device removal
    47c72af327270 ALSA: usb-audio: Add mute TLV for playback volumes on some devices
    594a8a74e02b1 phy: mscc: Stop taking ts_lock for tx_queue and use its own lock
    3ed0d6a7b3220 selftest: net: Fix weird setsockopt() in bind_bhash.c.
    631fc8ab5beb9 ppp: fix memory leak in pad_compress_skb
    d0ecda6fdd840 net: xilinx: axienet: Add error handling for RX metadata pointer retrieval
    4a5633b22fc72 net: atm: fix memory leak in atm_register_sysfs when device_register fail
    89064cf534bea ax25: properly unshare skbs in ax25_kiss_rcv()
    5ad5be90414dc mctp: return -ENOPROTOOPT for unknown getsockopt options
    b3bab397a377e net/smc: Remove validation of reserved bits in CLC Decline message
    8b3e9f5567433 ipv4: Fix NULL vs error pointer check in inet_blackhole_dev_init()
    ae9459f2acb35 net: thunder_bgx: decrement cleanup index before use
    2a12c6d58de0a net: thunder_bgx: add a missing of_node_put
    31229145e6ba5 wifi: cfg80211: sme: cap SSID length in __cfg80211_connect_result()
    92bedee7168d4 wifi: libertas: cap SSID len in lbs_associate()
    cedbbba8a8e82 wifi: cw1200: cap SSID length in cw1200_do_join()
    e211e3f4199ac vxlan: Fix NPD in {arp,neigh}_reduce() when using nexthop objects
    317122c53d5f2 vxlan: Rename FDB Tx lookup function
    02bebe7d0483d vxlan: Add RCU read-side critical sections in the Tx path
    9238419f6de35 vxlan: Avoid unnecessary updates to FDB 'used' time
    300b4e8ff890a vxlan: Refresh FDB 'updated' time upon 'NTF_USE'
    c1ce8ee5d7c6a net: vxlan: rename SKB_DROP_REASON_VXLAN_NO_REMOTE
    6fa0469be9cf5 net: vxlan: use kfree_skb_reason() in vxlan_mdb_xmit()
    da1178c6e9bb4 net: vxlan: use kfree_skb_reason() in vxlan_xmit()
    e89198454fb62 net: vxlan: make vxlan_set_mac() return drop reasons
    4ff4f3104da65 vxlan: Fix NPD when refreshing an FDB entry with a nexthop object
    5cf22915f2c37 net: vxlan: make vxlan_snoop() return drop reasons
    b186fb3bb3cd0 net: vxlan: add skb drop reasons to vxlan_rcv()
    74872113f895d net: tunnel: add pskb_inet_may_pull_reason() helper
    14f0d3c704b92 net: skb: add pskb_network_may_pull_reason() helper
    f8b4b6f7c2bbf net: ethernet: mtk_eth_soc: fix tx vlan tag for llc packets
    46d33c878fc0b net/tcp: Fix socket memory leak in TCP-AO failure handling for IPv6
    609a8ffff5a0d wifi: ath11k: fix group data packet drops during rekey
    682105ab63826 ixgbe: fix incorrect map used in eee linkmode
    66e7cdbda74ee i40e: Fix potential invalid access when MAC list is empty
    70d3dad7d5ad0 i40e: remove read access to debugfs files
    b862a132b43ec idpf: set mac type when adding and removing MAC filters
    2cde98a02da95 ice: fix NULL access of tx->in_use in ice_ll_ts_intr
    18cdfd7f699b9 net: mctp: mctp_fraq_queue should take ownership of passed skb
    eb929910bd4b4 net/smc: fix one NULL pointer dereference in smc_ib_is_sg_need_sync()
    0925c3c0c6d05 macsec: read MACSEC_SA_ATTR_PN with nla_get_uint
    7db8aa3fc4ed0 net: macb: Fix tx_ptr_lock locking
    f3d761e527c55 icmp: fix icmp_ndo_send address translation for reply direction
    dd70cd6a44f5c bnxt_en: fix incorrect page count in RX aggr ring log
    29b58eedbc5ac selftests: drv-net: csum: fix interface name for remote host
    349f7dbe3b5ab mISDN: Fix memory leak in dsp_hwec_enable()
    63480696b872a xirc2ps_cs: fix register access when enabling FullDuplex
    a22ec2ee824be net_sched: gen_estimator: fix est_timer() vs CONFIG_PREEMPT_RT=y
    e7a903c429e5c netfilter: nft_flowtable.sh: re-run with random mtu sizes
    306b0991413b4 Bluetooth: Fix use-after-free in l2cap_sock_cleanup_listen()
    1503756fffe76 Bluetooth: vhci: Prevent use-after-free by removing debugfs files early
    c2e32ac3f107e wifi: iwlwifi: uefi: check DSM item validity
    7614b00f16e53 netfilter: conntrack: helper: Replace -EEXIST by -EBUSY
    c47ca77fee907 netfilter: br_netfilter: do not check confirmed bit in br_nf_local_in() after confirm
    e4d5a5fc61fdc wifi: mt76: fix linked list corruption
    2aef3667e6b0f wifi: mt76: free pending offchannel tx frames on wcid cleanup
    1fb26fd3f6015 wifi: mt76: prevent non-offchannel mgmt tx during scan/roc
    d9f2fb6a2ac83 wifi: mt76: mt7925: fix locking in mt7925_change_vif_links()
    3e789f8475f6c wifi: brcmfmac: fix use-after-free when rescheduling brcmf_btcoex_info work
    5b7ae04969f82 wifi: cfg80211: fix use-after-free in cmp_bss()
    863443b02837d mmc: sdhci-of-arasan: Ensure CD logic stabilization before power-up
    b32990fb5738f mmc: sdhci-of-arasan: Support for emmc hardware reset
    1ec1b0d5e2758 LoongArch: vDSO: Remove -nostdlib complier flag
    0a97a654a26a7 LoongArch: vDSO: Remove --hash-style=sysv
    ed6a4c0ca7c53 net: usb: qmi_wwan: add Telit Cinterion FN990A w/audio composition
    9c111e6e31e88 net: usb: qmi_wwan: fix Telit Cinterion FE990A name
    67ffb6a337b1d net: usb: qmi_wwan: fix Telit Cinterion FN990A name
    d3b504146c111 HID: core: Harden s32ton() against conversion to 0 bits
    d6cfa97a4d6f3 HID: stop exporting hid_snto32()
    7a7ba33110698 HID: simplify snto32()
    a905edfec7447 arm64: dts: imx8mp: Fix missing microSD slot vqmmc on Data Modul i.MX8M Plus eDM SBC
    12fa00b401c0e arm64: dts: imx8mp: Fix missing microSD slot vqmmc on DH electronics i.MX8M Plus DHCOM
    b9e9092995aae arm64: dts: imx8mp-tqma8mpql: fix LDO5 power off
    606ae71e158d3 tee: optee: ffa: fix a typo of "optee_ffa_api_is_compatible"
    02a90ca443676 arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3399-pinebook-pro
    3f3d54180accf tee: fix memory leak in tee_dyn_shm_alloc_helper
    963fca19fe34c tee: fix NULL pointer dereference in tee_shm_put
    e63052921f1b2 fs: writeback: fix use-after-free in __mark_inode_dirty()
    6839108b660b4 btrfs: zoned: skip ZONE FINISH of conventional zones
    70a6e89b338bb Bluetooth: hci_sync: Avoid adding default advertising on startup
    e04e08c2c3878 cpupower: Fix a bug where the -t option of the set subcommand was not working.
    5817d249d3cc0 drm/amd/display: Don't warn when missing DCE encoder caps
    d619c55d7455e cdc_ncm: Flag Intel OEM version of Fibocom L850-GL as WWAN
    8e504a5ad6d98 LoongArch: Save LBT before FPU in setup_sigcontext()
    8446ff5a8377c btrfs: avoid load/store tearing races when checking if an inode was logged
    3d9c5e1512422 btrfs: fix race between setting last_dir_index_offset and inode logging
    37c491006e539 btrfs: fix race between logging inode and checking if it was logged before
    41688d1fc5d16 bpf: Fix oob access in cgroup local storage
    f1f241ee13403 bpf: Move cgroup iterator helpers to bpf.h
    f13441c171d56 bpf: Move bpf map owner out of common struct
    963e79f6bdac5 bpf: Add cookie object to bpf maps
    b0c51e95f54e5 Linux 6.12.45
    9a7141d4808dc thermal/drivers/mediatek/lvts_thermal: Add mt7988 lvts commands
    739229eb4d5cd thermal/drivers/mediatek/lvts_thermal: Add lvts commands and their sizes to driver data
    d1f4b09d9bb99 thermal/drivers/mediatek/lvts_thermal: Change lvts commands array to static const
    79f6a6460ef30 Revert "drm/dp: Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS"
    7259d9d6f0ae7 PCI: dwc: Ensure that dw_pcie_wait_for_link() waits 100 ms after link up
    72fdedb69cad9 PCI: Rename PCIE_RESET_CONFIG_DEVICE_WAIT_MS to PCIE_RESET_CONFIG_WAIT_MS
    1d9c73561c581 net: rose: fix a typo in rose_clear_routes()
    56f376507b1a0 drm/amd/amdgpu: disable hwmon power1_cap* for gfx 11.0.3 on vf mode
    31ce7c089b50c drm/mediatek: Fix device/node reference count leaks in mtk_drm_get_all_drm_priv
    c5e42567724ee drm/nouveau: fix error path in nvkm_gsp_fwsec_v2
    2de53596eeb20 drm/nouveau/disp: Always accept linear modifier
    c8277d229c784 drm/xe/vm: Clear the scratch_pt pointer on error
    dcdf36f1b6788 xfs: do not propagate ENODATA disk errors into xattr code
    806fdb4422128 smb3 client: fix return code mapping of remap_file_range
    6c1f8cef93dbd net: usb: qmi_wwan: add Telit Cinterion LE910C4-WWX new compositions
    4735f5991f514 fs/smb: Fix inconsistent refcnt update
    23d7325151d43 dma/pool: Ensure DMA_DIRECT_REMAP allocations are decrypted
    c50747a963c49 blk-zoned: Fix a lockdep complaint about recursive locking
    07b367f7ebb14 Revert "drm/amdgpu: fix incorrect vm flags to map bo"
    98520a9a3d69a HID: hid-ntrig: fix unable to handle page fault in ntrig_report_version()
    82e721413565d HID: wacom: Add a new Art Pen 2
    64eb2737fa351 HID: logitech: Add ids for G PRO 2 LIGHTSPEED
    14dfac42f5334 HID: quirks: add support for Legion Go dual dinput modes
    3055309821dd3 HID: multitouch: fix slab out-of-bounds access in mt_report_fixup()
    c0d77e3441a92 HID: asus: fix UAF via HID_CLAIMED_INPUT validation
    44bce62994fa2 x86/cpu/topology: Use initial APIC ID from XTOPOLOGY leaf on AMD/HYGON
    43be33b8a2f2b x86/microcode/AMD: Handle the case of no BIOS microcode
    c76bf8359188a RISC-V: KVM: fix stack overrun when loading vlenb
    67a05679621b7 KVM: x86: use array_index_nospec with indices that come from guest
    7b6b76e3f0790 net: macb: Disable clocks once
    c2925cd620707 efivarfs: Fix slab-out-of-bounds in efivarfs_d_compare
    7aab65c62a8a8 fbnic: Move phylink resume out of service_task and into open/close
    d2d08fc3577f1 l2tp: do not use sock_hold() in pppol2tp_session_get_sock()
    1bbc0c02aea1f sctp: initialize more fields in sctp_v6_from_sk()
    d7563b456ed44 net: rose: include node references in rose_neigh refcount
    0085b250fcc79 net: rose: convert 'use' field to refcount_t
    8e88504a28743 net: rose: split remove and free operations in rose_remove_neigh()
    e98884092a53c net: hv_netvsc: fix loss of early receive events from host during channel open.
    22b6f45719672 hv_netvsc: Link queues to NAPIs
    6037d6f243c18 net: stmmac: Set CIC bit only for TX queues with COE
    62c8b75da2d70 net: stmmac: xgmac: Correct supported speed modes
    160a7e072a0ce net: stmmac: xgmac: Do not enable RX FIFO Overflow interrupts
    fe67f30b41f13 net/mlx5e: Set local Xoff after FW update
    628df4d5d8e09 net/mlx5e: Update and set Xon/Xoff upon port speed set
    1f5f18acd8dd8 net/mlx5e: Update and set Xon/Xoff upon MTU set
    bde946b2a06d3 net/mlx5: Nack sync reset when SFs are present
    0c87dba9ccd38 net/mlx5: Fix lockdep assertion on sync reset unload event
    00a098e960454 net/mlx5: Reload auxiliary drivers on fw_activate
    17209bada19e9 bnxt_en: Fix stats context reservation logic
    35e129b060444 bnxt_en: Adjust TX rings if reservation is less than requested
    d00e98977ef51 bnxt_en: Fix memory corruption when FW resources change during ifdown
    3d6a89fecf41d phy: mscc: Fix when PTP clock is register and unregister
    2c697970da492 drm/xe: Don't trigger rebind on initial dma-buf validation
    83f94a04074e2 drm/xe/xe_sync: avoid race during ufence signaling
    77ff27ff0e452 efi: stmm: Fix incorrect buffer allocation method
    ee8c2f7d8f653 net: dlink: fix multicast stats being counted incorrectly
    c1cd3cede22e2 dt-bindings: display/msm: qcom,mdp5: drop lut clock
    32c8031015d2f ice: fix incorrect counter for buffer allocation failures
    e8b97c7cda142 ice: use fixed adapter index for E825C embedded devices
    5ff0860d1f618 ice: don't leave device non-functional if Tx scheduler config fails
    43f72994e4dda drm/nouveau: remove unused memory target test
    0d70a166dec65 drm/nouveau: remove unused increment in gm200_flcn_pio_imem_wr
    33f9e6dc66b32 atm: atmtcp: Prevent arbitrary write in atmtcp_recv_control().
    2651657f57e77 Bluetooth: hci_sync: fix set_local_name race condition
    7c3df1b8a3a9f Bluetooth: hci_event: Detect if HCI_EV_NUM_COMP_PKTS is unbalanced
    d1f4364d84059 Bluetooth: hci_event: Mark connection as closed during suspend disconnect
    aacecaee1b454 Bluetooth: hci_event: Treat UNKNOWN_CONN_ID on disconnect as success
    ff0d3bad32108 net: macb: fix unregister_netdev call order in macb_remove()
    8ac194ad5254b HID: input: report battery status changes immediately
    e2cf56faa25f1 HID: input: rename hidinput_set_battery_charge_status()
    eb7eafbfd1a27 powerpc/kvm: Fix ifdef to remove build warning
    7d5cc22efa44e drm/mediatek: Add error handling for old state CRTC in atomic_disable
    469a026cac4a2 drm/msm: update the high bitfield of certain DSI registers
    bc0aff1e703fd drm/msm/kms: move snapshot init earlier in KMS init
    46efab01648a0 of: reserved_mem: Restructure call site for dma_contiguous_early_fixup()
    7536b29903344 drm/msm: Defer fd_install in SUBMIT ioctl
    81ff76c1b0882 net: ipv4: fix regression in local-broadcast routes
    cbc00a76a5ff9 vhost/net: Protect ubufs with rcu read lock in vhost_net_ubuf_put()
    f5da8116cd52e ACPI: EC: Add device to acpi_ec_no_wakeup[] qurik list
    cc2ec79a6cb14 erofs: fix atomic context detection when !CONFIG_DEBUG_LOCK_ALLOC
    cd79a25f451e9 ASoC: codecs: tx-macro: correct tx_macro_component_drv name
    c9991af5e0992 smb: client: fix race with concurrent opens in rename(2)
    c2c9d0ae69714 smb: client: fix race with concurrent opens in unlink(2)
    ba884ba29cc94 scsi: core: sysfs: Correct sysfs attributes access rights
    7bab8fb51d3b1 vhost: Fix ioctl # for VHOST_[GS]ET_FORK_FROM_OWNER
    2e6e208825bf9 perf symbol-minimal: Fix ehdr reading in filename__read_build_id
    ced94e137e6cd ftrace: Fix potential warning in trace_printk_seq during ftrace_dump
    0d3471ab7186c of: dynamic: Fix use after free in of_changeset_add_prop_helper()
    76c872066d75f mips: lantiq: xway: sysctrl: rename the etop node
    41534a4790620 mips: dts: lantiq: danube: add missing burst length property
    f945cb27fea12 pinctrl: STMFX: add missing HAS_IOMEM dependency
    9362d520b2b44 of: dynamic: Fix memleak when of_pci_add_properties() failed
    2a2deb9f8df70 trace/fgraph: Fix the warning caused by missing unregister notifier
    f471b3e24d1ec rtla: Check pkg-config install
    9903b4afd70f3 tools/latency-collector: Check pkg-config install

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index aba255dfa3..e04450bf99 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2f3bb461fad19a35096f049d947cc639f517e22b"
-SRCREV_meta ?= "b14d2173319779e94720b45b7be544da8a5f4026"
+SRCREV_machine ?= "b463156a724cd3f095e1dadd87bf3c1c8115c9ff"
+SRCREV_meta ?= "fb30a9a1d027d938de70890be92c22b33e0194b1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.44"
+LINUX_VERSION ?= "6.12.47"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 75d4116c3c..03582980bd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.44"
+LINUX_VERSION ?= "6.12.47"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "cb57c5e0ea50dc87ee76514c4237291a365c2cd9"
-SRCREV_meta ?= "b14d2173319779e94720b45b7be544da8a5f4026"
+SRCREV_machine ?= "8161e9a0fe4611484f3f055a7c633759a513bd84"
+SRCREV_meta ?= "fb30a9a1d027d938de70890be92c22b33e0194b1"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 1873fcc195..47590bd0f4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "62c2bce13752b28ac71dae8ea8d9364e55443b60"
-SRCREV_machine:qemuarm64 ?= "cb57c5e0ea50dc87ee76514c4237291a365c2cd9"
-SRCREV_machine:qemuloongarch64 ?= "cb57c5e0ea50dc87ee76514c4237291a365c2cd9"
-SRCREV_machine:qemumips ?= "2a0916216246246cacbe4cccab8ec82bf5632df4"
-SRCREV_machine:qemuppc ?= "cb57c5e0ea50dc87ee76514c4237291a365c2cd9"
-SRCREV_machine:qemuriscv64 ?= "cb57c5e0ea50dc87ee76514c4237291a365c2cd9"
-SRCREV_machine:qemuriscv32 ?= "cb57c5e0ea50dc87ee76514c4237291a365c2cd9"
-SRCREV_machine:qemux86 ?= "cb57c5e0ea50dc87ee76514c4237291a365c2cd9"
-SRCREV_machine:qemux86-64 ?= "cb57c5e0ea50dc87ee76514c4237291a365c2cd9"
-SRCREV_machine:qemumips64 ?= "8d94c777a9e942a599e10384f6747b3404368264"
-SRCREV_machine ?= "cb57c5e0ea50dc87ee76514c4237291a365c2cd9"
-SRCREV_meta ?= "b14d2173319779e94720b45b7be544da8a5f4026"
+SRCREV_machine:qemuarm ?= "ace248eb90be5ddc94caea17db41d7190fc87817"
+SRCREV_machine:qemuarm64 ?= "8161e9a0fe4611484f3f055a7c633759a513bd84"
+SRCREV_machine:qemuloongarch64 ?= "8161e9a0fe4611484f3f055a7c633759a513bd84"
+SRCREV_machine:qemumips ?= "a766160558c9434368462f9fada2ac0871017cbd"
+SRCREV_machine:qemuppc ?= "8161e9a0fe4611484f3f055a7c633759a513bd84"
+SRCREV_machine:qemuriscv64 ?= "8161e9a0fe4611484f3f055a7c633759a513bd84"
+SRCREV_machine:qemuriscv32 ?= "8161e9a0fe4611484f3f055a7c633759a513bd84"
+SRCREV_machine:qemux86 ?= "8161e9a0fe4611484f3f055a7c633759a513bd84"
+SRCREV_machine:qemux86-64 ?= "8161e9a0fe4611484f3f055a7c633759a513bd84"
+SRCREV_machine:qemumips64 ?= "ea35e13b7cd3d7cea1c2e8c17f8144209496a8b7"
+SRCREV_machine ?= "8161e9a0fe4611484f3f055a7c633759a513bd84"
+SRCREV_meta ?= "fb30a9a1d027d938de70890be92c22b33e0194b1"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "11a24528d080a6ac23f07d6031da9e271728d62d"
+SRCREV_machine:class-devupstream ?= "f6cf124428f51e3ef07a8e54c743873face9d2b2"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.44"
+LINUX_VERSION ?= "6.12.47"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


