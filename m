Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF74CCD199
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 20:40:03 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.3133.1760733594876943838
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 13:39:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PQrskfOO;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-79ef9d1805fso2302637b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 13:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760733594; x=1761338394; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RgX/WfDsKUojlouwxbM9/JE1v1z4IkXpqjV8RxFENEM=;
        b=PQrskfOOR6t+DQKDF3NLnmFhaKxZixtYxsWd+osWEIy6QkA1Al6tPCzGWbGIjJznp8
         V5/Vtrk+jj9EuqI0OuDsWtwrnAonJPNnN/a9YCt/K1Jat9jd+lxb1C+GRYNbUY7WjyqA
         7NlWMhGQm3RyjDiz41wbueleDb9FbE4EaJujoSqMuaCyf/XkcK0/ioq0aZe4NgdIB/3U
         TOOTovvm0sFmW6RqW34zGy2yjscQ+z9Pq3fQl8djOeKQ4u+LDUUYaqp27JrdnuWG2gNu
         crSqTfvxqJTdrCq4DOVgCDYe3CxvzoJARRHd3g8XPNix38aATSVXt4HXzKbPwTjvP8DP
         D2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733594; x=1761338394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RgX/WfDsKUojlouwxbM9/JE1v1z4IkXpqjV8RxFENEM=;
        b=fsTLTliTViSc7eMBgCccfTSe5rsWUsE37Q9CFbMFBkRdinzy1Umji1h8QDIeLdD7Kb
         loatI2069YPE+g7v2jy/aZLPPORLvkVzrEh0gIUT3aMyHU6vrZ4eZ99FalmZF2KFbt1y
         Yvvv9KPR7Npzsxf8eeMQujCPUt2NTvYCiOq9KSBuCDQQP3Z0N4//+2UqEvbfbzMku5l4
         SQ6ooD/nuReyady8ts/nGd9/wRrMb5IlPrQREUugoERvM+WbI5kg1HUVPjvyf3TgC/EA
         LkdBqXNU2tnV/23eOg6x0D1fHu/sJj5QYfUj6u3AKaY8qff4OR5jRioLL4G4u9wHBvty
         olrQ==
X-Gm-Message-State: AOJu0YzpFbINANCkv0lwJcljEwK2AM/YuF5fZ3QHh4ulh3JEezv8xCbj
	mHcceDKe1+GpQbElU9H4MMEfoUZbDLtcMU3O1baOL2jU9VBvkM0Hrby1+oL1DU19IvCyxDxOiPy
	bYnUVwI0=
X-Gm-Gg: ASbGncsSxomekWJF+/uCuROZZYMGGco5o/6Bp4BHjmHorG+GvKCQrbSrgw3A5EcjOva
	TqAMWA0lD2bhzcwlj0+dACizB/kIKK+Clj3AjXbhg7t/j2FkNdn0OoDZWqmhOLEGk4Wxf8jrQlM
	JHSdv+6ap4KBSZFlcqKK7fcZ83tCKqRKBDVnebRZVSwGwVMfJZYCe28lcCQnqIKFZUR4lHOE46N
	iDPuKlc0fupC0iLgeYaARNEUhS5+7aiQN13cHobfjpOidssOOc652oegS4Ip/j08lkaHnxl2blj
	6wGra7+tn8of8uGbMrQ6jowg2rA1OIWfK7/R842ewlhKUBppRyM/9uqUbLGakzl0MYN6hmKW8iO
	aM+IyvhNN55UwdVa44nKVVDgWtlgLwySu9pibrwQ+f5AZYWVDyAj/r/bVYNM8yi2UOPKlm8fxhI
	3ApeUkEiu6cHc=
X-Google-Smtp-Source: AGHT+IG5ziiF7xF5f0jWuv3ckjpRNlbNcOLtL2XcN1Ohihm9sQGfB4S5XJ0NKZr+EgHQW8AHzb5NwQ==
X-Received: by 2002:a05:6a20:430d:b0:319:1c54:17ad with SMTP id adf61e73a8af0-334a8607494mr6702236637.37.1760733593835;
        Fri, 17 Oct 2025 13:39:53 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:aaee:e640:34cd:6f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f254esm477061b3a.45.2025.10.17.13.39.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:39:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/26] linux-yocto/6.6: update to v6.6.106
Date: Fri, 17 Oct 2025 13:39:01 -0700
Message-ID: <212df1778245f7b299b549285ea0994234e163fa.1760733431.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760733431.git.steve@sakoman.com>
References: <cover.1760733431.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 20:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225052

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

no ids found, dumping:
    60a9e718726f Linux 6.6.106
    3b9e7e5c5298 x86/vmscape: Add old Intel CPUs to affected list
    1e1dc1f9edb9 x86/vmscape: Warn when STIBP is disabled with SMT
    a5d029f1152a x86/bugs: Move cpu_bugs_smt_update() down
    34e566704105 x86/vmscape: Enable the mitigation
    f866eef8d1c6 x86/vmscape: Add conditional IBPB mitigation
    813cb831439c x86/vmscape: Enumerate VMSCAPE bug
    9d1677060428 Documentation/hw-vuln: Add VMSCAPE documentation
    fe9731e10004 Linux 6.6.105
    be4e6a221467 spi: fsl-qspi: Fix double cleanup in probe error path
    054a444b4c17 dmaengine: mediatek: Fix a flag reuse error in mtk_cqdma_tx_status()
    b718de5904a6 cpufreq: intel_pstate: Check turbo_is_disabled() in store_no_turbo()
    d0b26a9f5742 cpufreq: intel_pstate: Read global.no_turbo under READ_ONCE()
    a44d0904d673 cpufreq: intel_pstate: Rearrange show_no_turbo() and store_no_turbo()
    524ee2606a30 riscv: use lw when reading int cpu in asm_per_cpu
    522ffe298627 mm: slub: avoid wake up kswapd in set_track_prepare
    ad2df864033e slub: Reflow ___slab_alloc()
    c866c40d07c4 tools: gpio: remove the include directory on make clean
    3c331f7fc5b6 tools: gpio: rm .*.cmd on make clean
    7e4f8e09d577 drm/amd/amdgpu: Fix missing error return on kzalloc failure
    718c248902dd drm/amdgpu: Replace DRM_* with dev_* in amdgpu_psp.c
    c9c4635a6d55 perf bpf-event: Fix use-after-free in synthesis
    85da7f36d9a0 drm/bridge: ti-sn65dsi86: fix REFCLK setting
    1a7d3947a5dd spi: spi-fsl-lpspi: Clear status register after disabling the module
    cd53048e7460 spi: spi-fsl-lpspi: Reset FIFO and disable module on transfer abort
    a339956545a5 spi: spi-fsl-lpspi: Set correct chip-select polarity bit
    a786ef5f693b spi: spi-fsl-lpspi: Fix transmissions when using CONT
    2313baff36d0 hwmon: mlxreg-fan: Prevent fans from getting stuck at 0 RPM
    8699358b6ac9 pcmcia: Add error handling for add_interval() in do_validate_mem()
    3ee8f5c8938f pcmcia: omap: Add missing check for platform_get_resource
    8d7ee56bf530 Revert "drm/amdgpu: Avoid extra evict-restore process."
    b9cf42a8f034 ALSA: hda/realtek: Fix headset mic for TongFang X6[AF]R5xxY
    5f46882be912 ALSA: hda/hdmi: Add pin fix for another HP EliteDesk 800 G4 model
    7d98166183d6 drm/mediatek: Fix device/node reference count leaks in mtk_drm_get_all_drm_priv
    2c6c9d319017 drm/mediatek: Fix using wrong drm private data to bind mediatek-drm
    13d0854e3538 drm/mediatek: Add crtc path enum for all_drm_priv array
    d5875a478b1b vmxnet3: update MTU after device quiesce
    5174ea81d6ca net: dsa: microchip: linearize skb for tail-tagging switches
    3b6a5df36604 net: dsa: microchip: update tag_ksz masks for KSZ9477 family
    16fea5067092 dmaengine: mediatek: Fix a possible deadlock error in mtk_cqdma_tx_status()
    dd2b7abd0da3 ALSA: hda/realtek - Add new HP ZBook laptop with micmute led fixup
    7df63b5ddd07 ALSA: hda/realtek: Add support for HP Agusta using CS35L41 HDA
    47aba94a924c iio: pressure: mprls0025pa: use aligned_s64 for timestamp
    e791bf216c9e iio: light: opt3001: fix deadlock due to concurrent flag access
    91da53307391 iio: chemical: pms7003: use aligned_s64 for timestamp
    fb6a7c1da207 iio: imu: inv_mpu6050: align buffer for timestamp
    977849e8acd2 btrfs: adjust subpage bit start based on sectorsize
    b088ae4e4184 PCI/MSI: Add an option to write MSIX ENTRY_DATA before any reads
    30d201ee3a37 thermal/drivers/mediatek/lvts: Disable low offset IRQ for minimum threshold
    50ae352c1848 spi: fsl-qspi: use devm function instead of driver remove
    0ef7058b4dc6 mm/slub: avoid accessing metadata when pointer is invalid in object_err()
    ba0ccc1be52c nouveau: fix disabling the nonstall irq due to storm code
    033f09b647db cpufreq: intel_pstate: Unchecked MSR aceess in legacy mode
    83440514ef2a cpufreq: intel_pstate: Do not update global.turbo_disabled after initialization
    86cade7791a2 cpufreq: intel_pstate: Fold intel_pstate_max_within_limits() into caller
    e7f4f16ff167 cpufreq: intel_pstate: Revise global turbo disable check
    de6b545bcdba Revert "spi: spi-cadence-quadspi: Fix pm runtime unbalance"
    94f7d9070382 Revert "spi: cadence-quadspi: fix cleanup of rx_chan on failure paths"
    f4f7cde70f59 net: pcs: rzn1-miic: Correct MODCTRL register offset
    50a84d5c8140 e1000e: fix heap overflow in e1000_set_eeprom
    1cfa5dd05847 cifs: prevent NULL pointer dereference in UTF16 conversion
    bb37252c9af1 batman-adv: fix OOB read/write in network-coding decode
    d96cc9a1b577 scsi: lpfc: Fix buffer free/clear order in deferred receive path
    abab31c377cb platform/x86/amd/pmc: Add TUXEDO IB Pro Gen10 AMD to spurious 8042 quirks list
    350bfdd2841f drm/amdgpu: drop hw access in non-DC audio fini
    9e4293766e4f wifi: mt76: mt7996: Initialize hdr before passing to skb_put_data()
    9df29aa5637d wifi: mwifiex: Initialize the chan_stats array to zero
    bc983b834354 soc: qcom: mdt_loader: Deal with zero e_shentsize
    698abcf08818 proc: fix missing pde_set_flags() for net proc files
    e9188f66e949 ocfs2: prevent release journal inode after journal shutdown
    f9b8d4dba8e7 sched: Fix sched_numa_find_nth_cpu() if mask offline
    6797a8b3f71b mm: move page table sync declarations to linux/pgtable.h
    26ff568f390a x86/mm/64: define ARCH_PAGE_TABLE_SYNC_MASK and arch_sync_kernel_mappings()
    2ee32c4c4f63 pcmcia: Fix a NULL pointer dereference in __iodyn_find_io_region()
    50f2f392eb6e arm64: ftrace: fix unreachable PLT for ftrace_caller in init_module with CONFIG_DYNAMIC_FTRACE
    90e9372ec0b0 ACPI/IORT: Fix memory leak in iort_rmr_alloc_sids()
    ad17940a6618 ALSA: usb-audio: Add mute TLV for playback volumes on some devices
    a4e366fbec8a phy: mscc: Stop taking ts_lock for tx_queue and use its own lock
    9b035445b7c9 selftest: net: Fix weird setsockopt() in bind_bhash.c.
    85c1c86a67e0 ppp: fix memory leak in pad_compress_skb
    01d2690c09e6 net: atm: fix memory leak in atm_register_sysfs when device_register fail
    7d449b7a6c8e ax25: properly unshare skbs in ax25_kiss_rcv()
    5852cee1d8f6 mctp: return -ENOPROTOOPT for unknown getsockopt options
    7f8869586dd6 net/smc: Remove validation of reserved bits in CLC Decline message
    90ab05ed47c1 ipv4: Fix NULL vs error pointer check in inet_blackhole_dev_init()
    bee1e19cf1fa net: thunder_bgx: decrement cleanup index before use
    4535729550cf net: thunder_bgx: add a missing of_node_put
    e472f59d02c8 wifi: cfg80211: sme: cap SSID length in __cfg80211_connect_result()
    609f6debdff3 wifi: libertas: cap SSID len in lbs_associate()
    ccb839602a82 wifi: cw1200: cap SSID length in cw1200_do_join()
    61b80fbdc072 net: ethernet: mtk_eth_soc: fix tx vlan tag for llc packets
    5d7b2d45770e wifi: ath11k: fix group data packet drops during rekey
    6bf934426760 wifi: ath11k: avoid forward declaration of ath11k_mac_start_vdev_delay()
    38b86b0a37df wifi: ath11k: rename ath11k_start_vdev_delay()
    14ed9f84c7c0 wifi: ath11k: Introduce and use ath11k_sta_to_arsta()
    fb216d980fae i40e: Fix potential invalid access when MAC list is empty
    f18d9b3abf9c net/smc: fix one NULL pointer dereference in smc_ib_is_sg_need_sync()
    668f4f6382c3 macsec: read MACSEC_SA_ATTR_PN with nla_get_uint
    1cf0b558cbb7 netlink: add variable-length / auto integers
    5430388a8111 net: macb: Fix tx_ptr_lock locking
    8d09b13789ba icmp: fix icmp_ndo_send address translation for reply direction
    1dda64fb3f5e mISDN: Fix memory leak in dsp_hwec_enable()
    9a4abe262df9 xirc2ps_cs: fix register access when enabling FullDuplex
    6077d16b5c0f Bluetooth: Fix use-after-free in l2cap_sock_cleanup_listen()
    bd75eba88e88 Bluetooth: vhci: Prevent use-after-free by removing debugfs files early
    2acc8d3f0a3c netfilter: conntrack: helper: Replace -EEXIST by -EBUSY
    50db11e2bbb6 netfilter: br_netfilter: do not check confirmed bit in br_nf_local_in() after confirm
    f1150153c4e5 wifi: brcmfmac: fix use-after-free when rescheduling brcmf_btcoex_info work
    b7d08929178c wifi: cfg80211: fix use-after-free in cmp_bss()
    4a05520d12a7 arm64: dts: imx8mp: Fix missing microSD slot vqmmc on Data Modul i.MX8M Plus eDM SBC
    f7a48ef44576 arm64: dts: imx8mp: Fix missing microSD slot vqmmc on DH electronics i.MX8M Plus DHCOM
    5b94a825945a tee: optee: ffa: fix a typo of "optee_ffa_api_is_compatible"
    0383e172435f arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3399-pinebook-pro
    add1ecc8f3ad tee: fix NULL pointer dereference in tee_shm_put
    bf89b1f87c72 fs: writeback: fix use-after-free in __mark_inode_dirty()
    41e168db5942 Bluetooth: hci_sync: Avoid adding default advertising on startup
    703ea9e34f96 cpupower: Fix a bug where the -t option of the set subcommand was not working.
    2b21fd1cf77e drm/amd/display: Don't warn when missing DCE encoder caps
    235a4c0a8aaa cdc_ncm: Flag Intel OEM version of Fibocom L850-GL as WWAN
    ee58a0a35378 LoongArch: Save LBT before FPU in setup_sigcontext()
    dc4a024b1990 btrfs: avoid load/store tearing races when checking if an inode was logged
    48545620ca8f btrfs: fix race between setting last_dir_index_offset and inode logging
    9f76a2e19baf btrfs: fix race between logging inode and checking if it was logged before
    7acfa07c585e bpf: Fix oob access in cgroup local storage
    dbd8ec2261b8 bpf: Move bpf map owner out of common struct
    8e573ac21fcd bpf: Move cgroup iterator helpers to bpf.h
    3eeefeb9d62d bpf: Add cookie object to bpf maps
    355bd0b51d2f Linux 6.6.104
    d3cc7476b89f xfs: do not propagate ENODATA disk errors into xattr code
    0699faf70413 Revert "drm/dp: Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS"
    6c9552de7f7e HID: mcp2221: Handle reads greater than 60 bytes
    5a809b34250c HID: mcp2221: Don't set bus speed on every transfer
    1b3ccc394807 net/mlx5: SF, Fix add port error handling
    ea687c003663 net: rose: fix a typo in rose_clear_routes()
    4e86e5ba325e drm/nouveau/disp: Always accept linear modifier
    1424f6132fc8 smb3 client: fix return code mapping of remap_file_range
    3c3321091733 net: usb: qmi_wwan: add Telit Cinterion LE910C4-WWX new compositions
    4191ea1f0bb3 fs/smb: Fix inconsistent refcnt update
    4f43a6d376da dma/pool: Ensure DMA_DIRECT_REMAP allocations are decrypted
    8911ec881cd7 Revert "drm/amdgpu: fix incorrect vm flags to map bo"
    e422370e6ab2 HID: hid-ntrig: fix unable to handle page fault in ntrig_report_version()
    b9166ea27d0a HID: wacom: Add a new Art Pen 2
    88d3c2790c33 HID: logitech: Add ids for G PRO 2 LIGHTSPEED
    8783b2a0b740 HID: quirks: add support for Legion Go dual dinput modes
    d4e6e2680807 HID: multitouch: fix slab out-of-bounds access in mt_report_fixup()
    5f3c0839b173 HID: asus: fix UAF via HID_CLAIMED_INPUT validation
    c84ba4cdf4c6 x86/microcode/AMD: Handle the case of no BIOS microcode
    f49161646e03 KVM: x86: use array_index_nospec with indices that come from guest
    925599eba460 efivarfs: Fix slab-out-of-bounds in efivarfs_d_compare
    463aa96fca62 sctp: initialize more fields in sctp_v6_from_sk()
    9c547c8eee9d net: rose: include node references in rose_neigh refcount
    f8c29fc437d0 net: rose: convert 'use' field to refcount_t
    4998ab3eb2b8 net: rose: split remove and free operations in rose_remove_neigh()
    b0f8725196ae net: stmmac: Set CIC bit only for TX queues with COE
    dc38d0111c16 net: stmmac: xgmac: Correct supported speed modes
    d02d635fc03d net: stmmac: Rename phylink_get_caps() callback to update_caps()
    ce006b60fc49 net: stmmac: xgmac: Do not enable RX FIFO Overflow interrupts
    9b0acd3bb291 net/mlx5e: Set local Xoff after FW update
    dec9d873bdf7 net/mlx5e: Update and set Xon/Xoff upon port speed set
    cdd96ed12524 net/mlx5e: Update and set Xon/Xoff upon MTU set
    3e07c623fbc5 net/mlx5: Nack sync reset when SFs are present
    a623e80aaa85 net/mlx5: Convert SF port_indices xarray to function_ids xarray
    a7e9da4d3afb net/mlx5: Use devlink port pointer to get the pointer of container SF struct
    25659835c7af net/mlx5: Call mlx5_sf_id_erase() once in mlx5_sf_dealloc()
    ddac9d0fe249 net/mlx5: Fix lockdep assertion on sync reset unload event
    8da591ae2614 net/mlx5: Add support for sync reset using hot reset
    6292688e07d0 net/mlx5: Add device cap for supporting hot reset in sync reset flow
    09fd27c8621e net/mlx5: Reload auxiliary drivers on fw_activate
    7acefa4c66aa phy: mscc: Fix when PTP clock is register and unregister
    b3c70f6fc258 net: dlink: fix multicast stats being counted incorrectly
    589edd3dc8fb dt-bindings: display/msm: qcom,mdp5: drop lut clock
    dc70ea942fcd ice: fix incorrect counter for buffer allocation failures
    05fc7307e352 ice: stop storing XDP verdict within ice_rx_buf
    29bcd31ace16 ice: gather page_count()'s of each frag right before XDP prog call
    40a9f217cde1 ice: Introduce ice_xdp_buff
    4de399767ddc drm/nouveau: remove unused memory target test
    32a498445641 drm/nouveau: remove unused increment in gm200_flcn_pio_imem_wr
    3c80c230d6e3 atm: atmtcp: Prevent arbitrary write in atmtcp_recv_control().
    4bd2866db002 Bluetooth: hci_sync: fix set_local_name race condition
    961abec8184a Bluetooth: hci_event: Detect if HCI_EV_NUM_COMP_PKTS is unbalanced
    f356ed87c78c Bluetooth: hci_event: Mark connection as closed during suspend disconnect
    4c549d87f016 Bluetooth: hci_event: Treat UNKNOWN_CONN_ID on disconnect as success
    430786612abe HID: input: report battery status changes immediately
    61d733a568d8 HID: input: rename hidinput_set_battery_charge_status()
    e7d0bd359f4c powerpc/kvm: Fix ifdef to remove build warning
    6de90c2a3b6c drm/msm: Defer fd_install in SUBMIT ioctl
    a208d67cb44b net: ipv4: fix regression in local-broadcast routes
    9b2700151660 vhost/net: Protect ubufs with rcu read lock in vhost_net_ubuf_put()
    181feb41f0b2 NFS: Fix a race when updating an existing write
    9a1963404cc2 nfs: fold nfs_page_group_lock_subrequests into nfs_lock_and_join_requests
    b15342e09644 ACPI: EC: Add device to acpi_ec_no_wakeup[] qurik list
    612527136e0c erofs: fix atomic context detection when !CONFIG_DEBUG_LOCK_ALLOC
    8f8e6a781783 ASoC: codecs: tx-macro: correct tx_macro_component_drv name
    24b9ed739c8c smb: client: fix race with concurrent opens in rename(2)
    bc1427a48371 smb: client: fix race with concurrent opens in unlink(2)
    43662b846c7a scsi: core: sysfs: Correct sysfs attributes access rights
    28c8fb7ae2ad ftrace: Fix potential warning in trace_printk_seq during ftrace_dump
    9e0743eb6dcf of: dynamic: Fix use after free in of_changeset_add_prop_helper()
    749137b41e70 of: Add a helper to free property struct
    d3be2b8cff6f mips: lantiq: xway: sysctrl: rename the etop node
    e877b861dab9 mips: dts: lantiq: danube: add missing burst length property
    6e59b8483e6e pinctrl: STMFX: add missing HAS_IOMEM dependency
    43e3118c677a of: dynamic: Fix memleak when of_pci_add_properties() failed

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index b5e4700d83..596b7bc49e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7ea3f3274ce1ada089f38f1e5bd6167500084acf"
-SRCREV_meta ?= "6a511f37e5360c6694ef592ad4fcae2630378ef5"
+SRCREV_machine ?= "ddefe7df2a51318c404e7add38ab5e9d6d56eef3"
+SRCREV_meta ?= "8483e6808972d92efd206b41c79f4e7122364d43"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.103"
+LINUX_VERSION ?= "6.6.106"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 454a9c3102..2624180bf1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.103"
+LINUX_VERSION ?= "6.6.106"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "79a205036af6ef1c4d83a1613d5b206ae7b510fa"
-SRCREV_meta ?= "6a511f37e5360c6694ef592ad4fcae2630378ef5"
+SRCREV_machine ?= "5e027cdb537f4185431ed08d988fbd4eccf4beb3"
+SRCREV_meta ?= "8483e6808972d92efd206b41c79f4e7122364d43"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index be5c3510fc..5614809066 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "1c0e98c8258be1bf7e732fb3c792eb165099836f"
-SRCREV_machine:qemuarm64 ?= "9d19f112cf4341cd09e45ee0ed221e80c6300125"
-SRCREV_machine:qemuloongarch64 ?= "4518ac3620cf9950169ca59bcc72a93c03900f1b"
-SRCREV_machine:qemumips ?= "3f653435fd7315763428d3123883cee7c011d506"
-SRCREV_machine:qemuppc ?= "32c4d7089e3eed04893bfbb5b75cdc934e920cfd"
-SRCREV_machine:qemuriscv64 ?= "4518ac3620cf9950169ca59bcc72a93c03900f1b"
-SRCREV_machine:qemuriscv32 ?= "4518ac3620cf9950169ca59bcc72a93c03900f1b"
-SRCREV_machine:qemux86 ?= "4518ac3620cf9950169ca59bcc72a93c03900f1b"
-SRCREV_machine:qemux86-64 ?= "4518ac3620cf9950169ca59bcc72a93c03900f1b"
-SRCREV_machine:qemumips64 ?= "4f64d38b79ca252c932d017ae05a82388403e625"
-SRCREV_machine ?= "4518ac3620cf9950169ca59bcc72a93c03900f1b"
-SRCREV_meta ?= "6a511f37e5360c6694ef592ad4fcae2630378ef5"
+SRCREV_machine:qemuarm ?= "f922ef6c5d2f40b588b374303b125a556665c427"
+SRCREV_machine:qemuarm64 ?= "f1a3c57fd940c97cdc5454f0b833a48f7e2d49b3"
+SRCREV_machine:qemuloongarch64 ?= "ee1824941e0bfbd888e46be38faea742328372ec"
+SRCREV_machine:qemumips ?= "93f844921cf7bb3df44cf48756bb8872b9a86856"
+SRCREV_machine:qemuppc ?= "19a0163dd3acd0c52a8543d5ac0e3f69264d4c99"
+SRCREV_machine:qemuriscv64 ?= "ee1824941e0bfbd888e46be38faea742328372ec"
+SRCREV_machine:qemuriscv32 ?= "ee1824941e0bfbd888e46be38faea742328372ec"
+SRCREV_machine:qemux86 ?= "ee1824941e0bfbd888e46be38faea742328372ec"
+SRCREV_machine:qemux86-64 ?= "ee1824941e0bfbd888e46be38faea742328372ec"
+SRCREV_machine:qemumips64 ?= "0311ea6c2383b09cbe18b0d3e3cc1dfa2bd91c1d"
+SRCREV_machine ?= "ee1824941e0bfbd888e46be38faea742328372ec"
+SRCREV_meta ?= "8483e6808972d92efd206b41c79f4e7122364d43"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "cc1a1c5b404a5e6ad751d0831b1991a90c3de4c5"
+SRCREV_machine:class-devupstream ?= "60a9e718726fa7019ae00916e4b1c52498da5b60"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.103"
+LINUX_VERSION ?= "6.6.106"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


