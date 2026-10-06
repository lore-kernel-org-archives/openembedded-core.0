Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D822CA600A
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 20:44:40 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5173.1791319470467270425
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 13:44:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=UaEdtlCw;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c4649b3aaso759707f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 13:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791319468; x=1791924268; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xKrXT3VGlyqTeL8zNPftEgVK3TVHTFWIp9k17g7pqKA=;
        b=UaEdtlCwY4RTYZks/A7GeMAxFNzTHJXikvQJHUzoblAhsCXmC9nc4YYk3R3wiwP848
         YqGwFtfynmck2ikqlOE7hiCzzdW+B5R1JATV50NRi4uBOKtMBmgF+6WNW251Lxn1Ifzl
         bnaeDrRRMF29NGO2M1jwuD/aQVsI1NKu8AUJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791319468; x=1791924268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xKrXT3VGlyqTeL8zNPftEgVK3TVHTFWIp9k17g7pqKA=;
        b=uzU3BgvrCZuKWBOzK/maiXQSpDhYMmfSVy1G2E8+n6d8s2E5ov6ORwYoUtxYkQQbGr
         FogN7x0ONjxPdAfdbBOhosBE/vPXxRQZyM1WuctFzSz75wpv62AFx/Cz0tg/Ou8fC0jC
         PtZsbi8yQFvbynNy9/dwlqxcHDPEuI3CH17XP0g6PWptSJxsLd1cUfgAqJNQdi6lw8dH
         CHTf2+DcRvqHH34dTWtaF+0Fal4eZ/AvzQJ+rIPVPii01Dj9X2IcwwclO54aipcgvlF1
         KhyW8J8HTPq6+yGDx+Gtn011d7WDTRpvVk8ADbkvV3XJLnsP5zNWj8zr4RjPHaimtmWp
         q0WQ==
X-Gm-Message-State: AFq9FYLQxGXjdkQaCVv1w8ROwTF3ceOG1SLOegRg5H+tVZW6Q/nnGyTg
	6LR5Ah1phz+gw5pvYOqSBG+UORDei26KEz2j08+/y1X8wShJDyXjg40k70oTUFiz3GMFx/+I82E
	/q3zuxAs=
X-Gm-Gg: AYBFou0lN48NSELy2aDK/jrMzF1qiB71iDtyK+qoaBAUdmmJyudnLQ+njvzI0Ri8gFq
	XbMnA+3d73qO6mY9SzLh4NuK/QyBJCBWHbnOc81oeT2Er1bycjwZ3e/1mKqIEcvnbSm/O3lh5Qo
	qUjclbQad1lKkt9oNPqz4GHwhVMefKnhUOnSbHH16BipjWzU/dxNL2DQz9JEfpaB5/1NrDp4TPW
	hCq4QJmzt9xNvA65AXgD24CmUgV6DrLUtrpu6/f1KRNqvoeupt9rFSy/olUA0W8Vh0ebhFtPRVS
	CHKg4Q7ACBs5CxvTSZI3Ey/GOjLWJd5siXyz1RJYVPTY5x6V1hZOHU8qiaruQwMZ3OYo0RqhbXY
	R5lb8Go9vvZs2Z0Vq9okt2cgidBvRrtnj3bZLnxiLqF/w95ivtlBbfdGPjiffsBuFv/TSEbup6h
	sUEMzylhp/2LKgbMKaOstTWxXTnpMx6fg4IIsdR0jFS5/9Aj1rMhjvumvxKIyZtfxMsNLgfj2hZ
	eUS2/4PENB/jiXpOzNXEKEzwzczXWYjmk/5Uix7SkX+eNELV4v7OGdaolnyljnOUSo=
X-Received: by 2002:a05:6000:2911:b0:48a:f320:dba0 with SMTP id ffacd0b85a97d-48c7289c524mr820995f8f.45.1791319467226;
        Tue, 06 Oct 2026 13:44:27 -0700 (PDT)
Received: from FRSMI25-LASER (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c7273b5e0sm997338f8f.14.2026.10.06.13.44.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:44:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail v2 07/18] linux-yocto/6.18: update to v6.18.54
Date: Tue,  6 Oct 2026 22:43:42 +0200
Message-ID: <785b442c1ba8909675f8ce76fcbbe4cc6e2e01f7.1791318909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791318909.git.yoann.congal@smile.fr>
References: <cover.1791318909.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 20:44:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247345

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.18 to the latest korg -stable release that comprises
the following commits:

    1b357ecb32139 Linux 6.18.54
    c8c7639aa3243 smb/client: send lease break ACKs thru correct session for multiuser mounts
    024eb5c4cea07 Revert "ksmbd: Fix to handle removal of rfc1002 header from smb_hdr"
    74f179e75ab03 Bluetooth: hci_qca: fix NULL pointer dereference in qca_setup() for non-serdev device
    8a143f91f1f7d ASoC: sdw_utils: subtract the endpoint that is not present
    3c8f0ae0d3b01 wifi: mac80211: fix list iteration in ieee80211_add_virtual_monitor()
    5a93dbeb555dc ksmbd: fix partial normalized name responses
    d1152c96a3002 smb: client: fix reparse buffer bounds in cifs_query_reparse_point()
    ac7c08626f678 wifi: libipw: reject TKIP frames without a full MIC
    87b9893107ea0 wifi: ipw2x00: Use michael_mic() from cfg80211
    dcbb37bb1f1e8 wifi: mac80211, cfg80211: Export michael_mic() and move it to cfg80211
    47e09d6fd0bf5 wifi: ipw2x00: Rename michael_mic() to libipw_michael_mic()
    aeaa7bdc0ea2c drm/amdgpu: hold a runtime PM reference for P2P dma-buf attachments
    801d8647dcb0d drm/amdgpu: lock bo before calling amdgpu_vm_bo_update_shared
    b8f46ca5cbd62 xfs: fix under-reservation of blocks when repairing sf directories
    24beea233aae4 xfs: remove the i_ino field in struct xfs_inode
    1e0a34f690e52 xfs: convert xchk_inode_xref_set_corrupt to xchk_ip_xref_set_corrupt
    34b3b32fb1a96 xfs: add a xfs_rmap_inode_owner helper
    a6767712902be smb: client: fix cifsFileInfo reference leak in deferred close
    226e066932b5e scsi: fnic: Fix missed link-up when critical IRQ targets offline CPU
    d2494dc0d9de1 scsi: fnic: Bump up version number again
    8118e473d7a10 scsi: fnic: Make debug logging protocol independent
    d1b7ca587d810 scsi: fnic: Bump up version number
    822214913b120 scsi: fnic: Rename fnic_scsi_fcpio_reset()
    abe15e643e576 wifi: mac80211: refuse to make a monitor active when it has no queue
    07c78e1b16900 wifi: mac80211: track MU-MIMO configuration on disabled interfaces
    fb5400bff669c mm/vma: correctly unaccount on mmap_prepare() failure
    88871ab548c1d 9p: Fix v9fs_issue_write() to update i_size and remote_i_size
    a548c7abf65b6 mm/huge_memory: bypass THP tuneables for huge pfnmap mappings
    148db154066b0 xfrm: save input state data before secpath resets
    1acd93259b6be xfrm: Fix dev use-after-free in xfrm async resumption
    e29d6ab39ea3e xfrm: Refactor xfrm_input lock to reduce contention with RSS
    621c365739828 signal: Prevent exec() race
    9eeb282ae6d57 signal: Move MMCID exit out of sighand lock
    79c55a7b5d71c ALSA: usb-audio: Clamp implicit feedback packet count to URB capacity
    722ee726148ea ALSA: usb-audio: Optimize the copy of packet sizes for implicit fb handling
    9fc87899276af smb: client: fix busy dentry warning on unmount after DIO
    4cc1bb9569930 ntsync: reject wait ioctls with zero owner
    fe474ad6dc481 ntsync: Honour caller's time namespace for absolute MONOTONIC timeouts
    29bd40e111262 time/namespace: Export init_time_ns and do_timens_ktime_to_host()
    36981ba106d91 HID: asus: fortify keyboard handshake
    2f8ed71aaaba3 smb: client: fix missing iov bounds check in parse_posix_sids()
    62b50ebc5ded4 smb: client: fix missing lower-bound check on DFS referral string offsets
    ebb8a075fdc7a smb: client: fix server->total_read for compound encrypted PDUs
    1cdf0d304d820 smb: client: fix potential OOB read in smb3_enum_snapshots()
    34a3942e787b9 smb: client: fix OOB struct field reads in move_smb2_ea_to_cifs()
    96c436e4b0107 smb: client: fix next_buffer UAF and NextCommand bounds in compound PDUs
    a1d2a407fdc19 smb: client: fix unaligned access in WSL reparse point parser
    928edc4bd6a61 smb: client: fix smbd_connection leak on cifs_get_tcp_session() error
    a3e4c288e933f smb: client: reject short Next offsets in parse_server_interfaces()
    e99040e5e9c60 smb: client: fix use-after-free of iface in cifs_try_adding_channels()
    04082b1833856 smb: client: fix rlist race and missing initialization
    7ab9ceedd8602 smb: client: cancel reconnect work in clean_demultiplex_info()
    cd55dde2b6378 drm/amdgpu: fix rmmio iounmap skipped on device removal
    d81bf4581903b drm/msm: RCU-free the scheduler-containing ring and VM objects
    f41e64aca2e60 drm/msm/hdmi_phy: fix runtime PM cleanup on probe failure
    7b7b590d721f9 drm/msm/dpu: clear pending peripheral flush state
    57322415b079f drm/msm/adreno: fix autosuspend cleanup during teardown
    e84425f789fa6 drm/gud: Ignore damage clips in full update mode
    2c92af27ad23e drm/gud: fix out-of-bounds write in gud_plane_atomic_check()
    432c8532d5ccc wifi: mac80211: avoid WARN in set_bitrate_mask when sdata not in driver
    71612bda21155 wifi: mwifiex: validate action frame fixed fields
    5747eaa38a7fc wifi: mwifiex: prevent authentication frame length truncation
    9cff2f39ed38a wifi: mwifiex: validate scan response extents
    8bbef2b1ebfba wifi: mwifiex: bound the pairwise-cipher OUI walk to the IE length
    d2fb6b588dc5b wifi: p54: require a full exp_if record in PDR_INTERFACE_LIST
    3bdcc4d61212b wifi: p54: validate curve data length in the calibration curve converters
    4f86fb6f9dce0 wifi: wilc1000: fix RX buffer OOB-write in wilc_wlan_handle_isr_ext()
    68b786691ce24 wifi: wilc1000: fix out-of-bounds read in P2P public action frames
    7f1f25b2db146 wifi: wlcore: release runtime PM ref on regdomain config failure
    2bddc5d088cf4 wifi: wcn36xx: Fix potential use-after-free in TX ack timer teardown
    f4f2852b664c3 wifi: rsi: fix heap OOB write on key removal
    e82536aad653e wifi: libertas_tf: fix UAF in lbtf_free_adapter()
    55d34422c0d91 wifi: iwlegacy: fix broadcast stations deallocation
    1edb3ddd261e9 wifi: brcmsmac: fix UAF in brcms_free_timer()
    405e575444b76 watchdog: starfive-wdt: Fix runtime PM leak in starfive_wdt_pm_start()
    0e2302dc23249 watchdog: sp5100_tco: Fix pci_dev reference leak in sp5100_tco_init()
    eb14ee406e1d0 watchdog: rzv2h: Avoid division by zero
    b4ede87765a2e watchdog: rtd119x: Avoid division by zero
    efb76b8ba522e watchdog: msc313e: Propagate error code in resume()
    61bcb2403bdee watchdog: msc313e: Fix premature reset during timeout update
    1e995d1eef00c watchdog: digicolor: Avoid division by zero
    960d1c85381bc watchdog: da9063: fix suspend/resume handling of HW_RUNNING watchdog
    8319a4142f7d2 hwmon: (cgbc-hwmon) Add missing sensors
    3a5bfc3145c02 hwmon: (cgbc-hwmon) Fix current sensors ID lookup
    1fd330df340cc hwmon: (w83793) release probe data through kref
    2c381e6e0f033 hwmon: (w83791d) remove fan/pwm 4-5 sysfs group on remove
    a5ce3fe5335a2 hwmon: (pwm-fan) Stop RPM timer before freeing tach data
    d84769ab7aae3 hwmon: (pmbus/tps53679) Select page 0 for single-page TPS53676
    ec7443983cab4 hwmon: (pmbus/tps53679) Fix TPS53676 phase page decoding
    9558fc1e042ac hwmon: (pmbus/core) increase number of phases and add new mask
    72c85149794a1 hwmon: (hp-wmi-sensors) Fix use-after-free in fungible_show()
    0d05b43b55d47 Input: zero ff_effect before compat copy in input_ff_effect_from_user
    fa1713dc3d43d Input: synaptics-rmi4 - fix GPF in suspend and resume when unbound
    f16f62b7462f6 Input: synaptics - disable InterTouch on ThinkPad T440p (board id 2722)
    8a70a192e3e5b Input: soc_button_array - check btns_desc->package.count
    518c9f2b8ab43 Input: soc_button_array - fix MS Surface Pro 11 probe failure
    dc05ec97b8299 Input: rmi_smbus - fix out-of-bounds read in rmi_smb_write_block()
    8202e2cb3db23 Input: i8042 - add quirk for Acer Aspire Go 15 AG15-42P
    d1704059be95a Input: hp_sdc - shut down kicker timer on module exit
    71e5619db11dd Input: evdev - zero absinfo before partial copy in EVIOCSABS
    9eb261092d4c9 Input: cyttsp5 - clamp the HID report size before memcpy
    143330cc00d56 Input: atkbd - skip deactivate for Xiaomi Redmi Book Pro 16 2026
    a0a73ae16b57b Input: adp5588-keys - cache GPIO state before registering the gpiochip
    bb8c4aa9a0dca mmc: sdhci_am654: Fallback to DT-provided itap delay on DDR50 tuning failure
    818ec2ffc985e mmc: sdhci_am654: Clear ITAPDLY on tuning failure
    bf1e2c818559e mmc: sdhci_am654: Reset command and data lines on failed tuning
    f6bf12758013a mmc: sdhci_am654: Move tuning_loop to local variable
    4885e587f1afa mmc: spi: reset bytes_xfered before retrying CRC failures
    ba4118e164abc mmc: sh_mmcif: initialize IRQ-thread mutex before requesting interrupt
    ac866db277a4c mmc: sdio_uart: fix xmit_fifo leak when the port table is full
    15b5ffd8af2dd mmc: sdhci-of-aspeed: Remove children before releasing SDC resources
    58c1a7a41c3f0 mmc: rtsx_pci_sdmmc: ignore broken write-protect on ThinkPad X260
    23383e0578b58 mmc: mxcmmc: cancel data work and watchdog on remove
    7fecf79f31568 mmc: mmci: Fix use-after-free in busy-timeout work
    8439bf262ce32 mmc: hsq: Fix use-after-free in retry work
    2d48c5a611b7f mmc: core: Fix OF node reference leak on card add failure
    4553b5004eca9 mmc: core: Cancel SDIO IRQ work before freeing host
    a2890c1eb96d1 power: sequencing: fix NULL-pointer dereference in pwrseq_device_register()
    859880b07a75c power: sequencing: fix NULL-pointer dereference in pwrseq_unit_new()
    244aacaa5e311 power: sequencing: don't call .post_enable() if pwrseq_unit_enable() failed
    24e00850bcff4 selinux: always fill AVC decision in avc_has_perm_noaudit()
    d127c7e1f3e12 selinux: recheck intermediate backing files on mprotect()
    9d99b770e7b67 selinux: preserve user SID across nested backing files
    180752deb7270 IB/hfi1: Fix the PIO_CRED credit-return mmap
    352eab79c0046 IB/hfi1: Resolve the credit-return buffer through the send context's node
    ffb80872617b5 IB/mlx4: Fix use-after-free on pkey sysfs registration failure
    66c7c59cb74e1 i2c: imx: disable autosuspend on remove
    a114c27eb5a9b i2c: imx: release DMA channels on probe error
    8b6230a174397 i2c: qcom-cci: fix device_node refcount leak in cci_probe()/cci_remove()
    eabf7a3d33cd9 i2c: atr: fix dangling adapter pointer on add failure
    48285f2727708 i2c: at91: release DMA channels on remove and probe error
    9ddbc5f4bb498 KEYS: trusted: Fix tpm2_load_cmd() boundary check
    cdc17d8ab62a3 keys: translate request_key_auth pid for the reading procfs instance
    a1a98eca102b1 KEYS: encrypted: fix integer overflow of datablob_len
    2897601dffe57 mm: filemap: retain mapped dropbehind folios
    6e3fe31020050 mm/mremap: account mm->locked_vm correctly for MREMAP_DONTUNMAP
    f5d0e92e23549 mm/mlock: use the IRQ-safe accessor for NR_MLOCK in __munlock_folio()
    0a41a46859df0 mm, swap: fix SWAP_USAGE_OFFLIST_BIT collision with real usage count
    6611f78ec3fd4 memstick: ms_block: destroy io_queue workqueue on removal
    d5cdff14c385b memcg: avoid charging the root memcg from obj_cgroup_charge_pages()
    4450102d6aa2a soc: samsung: exynos-pmu: fix use-after-free of interrupt generator node
    4748c27e2e6a1 xfrm: use hlist_del_init_rcu for state_cache and state_cache_input
    75fc4561772e2 xfrm: serialize state GC with device state flush
    6233d0b3ef462 scsi: core: Validate MODE SENSE lengths in scsi_cdl_enable()
    2d432d59f10a4 net/packet: avoid truncating TPACKET_V3 private size
    805edbdcb8681 net/packet: clear RX owner on VNET header error
    1731ff1d20489 net/sched: hhf: cap hh_flows_limit at change time
    1be63e4579af4 net/sched: act_api: release tail references on DELACTION failure
    02eba5f36d202 net: wwan: mhi_wwan_mbim: check skb_copy_bits() return value
    8dad70ff7e25c net: wwan: mhi_wwan_mbim: guard against a cyclic NDP chain
    9dbf13de4edff net: wwan: t7xx: validate the netif index in t7xx_ccmni_recv_skb()
    21b231c112759 net: phy: mediatek: do not report link and per-speed LED rules together
    5c216bfa9fb7b net: lan743x: fix RX checksum use-after-free
    9907325257b4b net: ip_tunnel: initialize `options_len` before referencing options
    4c030a0400ebf ipv6: xfrm: use full sockets in local error paths
    b14e6c5287255 dmaengine: ti: k3-udma-glue: fix NULL dereference in k3_udma_glue_release_rx_chn()
    3c42546d6c7a0 dmaengine: sun6i: fix undefined behaviour in sun6i_dma_tx_status
    31396d731b284 dmaengine: sun6i: fix non-atomic read of DMA position registers
    a32bedab8ece9 btrfs: clear free space tree creation state on rebuild failure
    709f6a5e98653 btrfs: take commit root semaphore when iterating in mark_block_group_to_copy()
    4dc1ae5ff75b1 Bluetooth: hci_sync: Serialize local codec list cleanup
    f49a543d76d48 Bluetooth: hci_codec: validate vendor codec count length
    4eb614045056a Bluetooth: eir: validate service data length before reading UUID
    684d7252dc4e2 Bluetooth: btusb: fix NXP IW610 composite device handling
    390742871a723 arm64: percpu: Fix LSE operations on {8,16}-bit types
    d575e0079149b arm64: percpu: Fix this_cpu_and() mask generation
    0dd78559c1444 arm64: percpu: Fix this_cpu_write() casting
    169b53d64a943 arm64: dts: renesas: r8a779f0: Set UFS lane count
    e80ea8118a073 arm64: hibernate: pass HVC_SET_VECTORS args to the resume hvc
    8eaf3c3a994fe kselftest/arm64: Fix size of thread_data values for pthread_join()
    4ed6f5d94cc86 HID: logitech-hidpp: fix race condition when accessing stale stack pointer
    cce630c751279 net: xfrm: reject unrepresentable espintcp transport headers
    d16f089bd700f openvswitch: avoid reallocating confirmed conntrack labels
    e15eb536be4f6 RDMA/core: fix refcount bug in iwpm_get_nlmsg_request()
    01cbdb724c584 RDMA/ucma: Serialize join and leave on copy_to_user failure
    8fc1eaae65f51 spi: virtio: Use the per-transfer bits per word
    6eeecd941f4e4 spi: spi-zynqmp-gqspi: stop the controller on shutdown
    ebeff6e7133a1 spi: fsl-qspi: Reprogram the clock rate when the operation frequency changes
    aa4709813b29d swiotlb: use the adjusted address for the highmem page lookup
    ff037920c688a tcp: exclude old ACKs from tcp fast path
    857559b83c816 x86/microcode/intel: Reject problematic loading on Granite Rapids systems
    e0fbc37f09b1b x86/build/64: Prevent native builds from generating EGPR use
    526d8f45c6ef4 drm/nouveau/gsp/r570: Enable S/R Display workaround in GSP
    80b8a76823dee drm/nouveau/gsp/r570: Set GcOff = 0 in fbsr
    28b898b5c7004 drm/nouveau/gsp: Increase delay for magic sleep in r535_gsp_fini()
    b0bd757f910a6 Revert "nouveau/gsp: fix suspend/resume regression on r570 firmware"
    f22d349940cb3 rust: net: phy: fix off-by-one bit positions in device status accessors
    65ca0a5037152 rds: ib: use rds_conn_drop() on protocol version mismatch
    9971dac1a7784 posix-cpu-timers: Prevent freeing a timer which is queued on the expiry list
    8a15369ad1daa phy: renesas: rcar-gen3-usb2: Avoid long delay in atomic context
    44ab7420ab52a fs/dax: check zero or empty entry before converting xarray entry
    75aa08b93c657 exec: Cleanup POSIX timers right after de_thread()
    fcc0a935bb6e3 cifs: Fix server use-after-free in cifs_chan_skip_or_disable()
    7ab7aea170bc3 ata: libahci_platform: Fix device reference leak in ahci_platform_get_resources()
    b691a3e244278 ata: libahci: clear PxCLBU and PxFBU for AHCI_HFLAG_32BIT_ONLY
    d93988c9e58d3 ASoC: codecs: rt712-sdca-dmic: fix uninitialized stream_config->type
    3e24b4a6acfd3 ALSA: virtio: reset device before deleting virtqueues
    2dec4642589a6 ALSA: core: Fix potential UAF after asynchronous card release
    c03fb163a8851 Input: xpad - fix PDP Marvel Xbox 360 controller
    3e6dcea0e12f4 Input: xpad - add support for Azeron devices
    e97d781ec9c87 Input: xpad - add support for Victrix Pro BFG Controller
    55ca2a79ebd72 wifi: rtw88: TX QOS Null data the same way as Null data
    aeab608c97008 ACPI: processor: Update cpuidle driver check in __acpi_processor_start()
    38024286029f7 watchdog: da9062: fix suspend/resume handling of HW_RUNNING watchdog
    984e18de4fcf9 hwmon: (hp-wmi-sensors) Improve raw WMI string handling
    63a31916448f4 hwmon: (gpio-fan) return IRQ_HANDLED from the shared alarm IRQ handler
    7ddff1a7cc8ad Input: eeti_ts - publish the OF module alias
    63c3d0435f2cd x86/fred: Reconstruct the #GP context for rejected INT instructions
    b2faf2cafd14f btrfs: check if there is space for chunk item when validating sys chunk array
    9588850bfa75c btrfs: abort transaction on failure to update inode for hole punching and reflinking
    37583946d8751 drm/amdgpu: check ras and obj before dereference
    bff8a8e53a6d2 net: skbuff: do not leave stale header offsets after pskb_carve()
    f0e7d62c1eb98 net: mvpp2: prevent buffer overflow in page_pool allocation
    748b7a5aca248 net: macb: fix ordering around PTP timestamp read
    cfc1af3d054aa x86/kprobes: Fix crash when probing CS CALL instructions
    1977c843c5777 x86/alternative: Refactor INT3 call emulation selftest
    a13cca5ba5375 net: psp: avoid conflicts with skb->decrypted and sk_validate_xmit_skb()
    598814c24620e net: stmmac: propagate FPE preemption-class mapping errors
    4f33e036e827f net: ethernet: cortina: Ack RX overrun interrupt correctly
    d9f96bc2d8225 net: lock the socket in sock_gettstamp()
    60ef74357a36e eth: fbnic: ring the doorbell if a burst ends in a drop
    647b0ff3bdef3 net: netsec: fix device_node reference leak on phy_np
    9ba5cd7430026 ASoC: amd: acp: fix ffs() operator precedence for SoundWire link ID
    a1b0456c90b1b ASoC: amd: acp: refactor codec config count in SOF SoundWire machine driver
    32e85888af46b ASoC: sdw_utils: tidyup asoc_sdw_parse_sdw_endpoints()
    a4d56b384f825 ASoC: sdw_utils: tidyup .count_sidecar
    91c2615e4dac3 ASoC: intel: sof_sdw: Add ability to have auxiliary devices
    7939a4028c394 ASoC: sdw_utils: Add codec_conf for every DAI
    d1cb686d9ff12 ASoC: amd: acp: bounds-check SoundWire link ID in machine drivers
    944e1a2c02250 ASoC: hdmi-codec: Report a change when the channel status moves
    6d1c95803e1a5 ASoC: ux500: Parenthesize MSP_{RX,TX}_CLKPOL_BIT() arguments
    4b7ecabd87dc4 btrfs: handle lack of space when cleaning up verity items
    4a4294fe7cf7d btrfs: more trivial BTRFS_PATH_AUTO_FREE conversions
    5468a4855b63b futex: Also allocate private hash on vfork()
    0543813753ef5 powerpc/iommu: Fix the overflow validation in iommu_tce_check_ioba
    dfb8427493273 KVM: PPC: Book3S HV: fix secure device page leak on uv_page_in() failure
    fbf69b7d0555e KVM: PPC: Book3S HV: fix use-after-free in kvmhv_emulate_tlbie_all_lpid()
    82d4e43c6261a net: stmmac: do not overwrite phc_index when no PTP clock is registered
    530ae0a145807 drop_monitor: fix out-of-bounds write in reset_per_cpu_data()
    9616b0c67fbd8 drop_monitor: use timer_shutdown_sync() to prevent timer rearming during teardown
    1da515f2e3b27 drop_monitor: synchronize tracepoint unregistration on error path
    e2f5529b0016d pppoatm: ensure a writable skb header and linear data
    b8f71d69380a5 af_unix: Unify scc_index when finalising SCC in __unix_walk_scc().
    bfce253f039eb Bluetooth: RFCOMM: avoid socket lock inversion in listener cleanup
    18464860ce27a Bluetooth: btintel_pcie: fix off-by-one bounds check in RX submit
    80f7bb41b0a83 Bluetooth: btmtksdio: Fix PM runtime reference leak in shutdown
    d42c798a14a3e Bluetooth: btmtk: fix wrong status for short WMT FUNC_CTRL events
    49520ae0f2928 Bluetooth: ISO: set BT_LISTEN before requesting a BIG sync
    e2b156a8d2596 Bluetooth: ISO: Fix parent socket leak in iso_conn_ready()
    a5414b0a9464b Bluetooth: hci_qca: Do not write to the serial port after it is closed
    18a9e9f0070f2 Bluetooth: qca: enable pwrseq support for WCN39xx devices
    aa7aba7164562 Bluetooth: qca: Refactor code on the basis of chipset names
    7812a441617ad Bluetooth: hci_qca: Refactor HFP hardware offload capability handling
    dcaf10ef27f92 Bluetooth: coredump: Quiesce dump work on unregister
    84f353256e170 Bluetooth: btintel_pcie: validate TX skb length in send_sync
    e220c1242a643 Bluetooth: hci_core: Fix queuing tx_work after workqueue is drained
    bae65e4925928 dmaengine: mmp_pdma: fix wrong sg length in mmp_pdma_prep_slave_sg()
    b0024111e4c2b ksmbd: keep compound responses on query info errors
    f86a9f901a941 ksmbd: fix partial file information responses
    bc616390103d4 ksmbd: return buffer overflow for partial filesystem info
    7898bda1ebc19 tcp: do not let tcp_rmem be set below 4096
    619bfbaacbff6 tcp: Don't call skb_clone_and_charge_r() for close()d listener in tcp_v6_do_rcv().
    d5c4ee1fa4e83 net: bridge: mst: move switchdev call outside rcu
    72206aff346ff wifi: brcmfmac: fix lost 802.1x TX completion wakeup
    d6f63fdb298d5 net: fddi: skfp: fix NULL deref when setting the MAC address while down
    1af2d87964d87 ipv4: icmp: reject RTN_UNREACHABLE input routes in icmp_route_lookup
    56db7ec462d6a net: bcmgenet: restore the hardware filters on open
    2077a6997c455 net: bcmgenet: convert RX path to page_pool
    ddf60220c925b seg6: set IPSKB_L3SLAVE from IP6SKB_L3SLAVE on IPIP decapsulation
    78cb2ee981594 drm/msm/dsi: round the byte clock rate after reparenting to the PHY PLL
    441f80df60226 btrfs: tree-checker: print dev extent offset in error message
    57bc3cd46458e wifi: ath11k: cleanup arsta in ath11k_mac_peer_cleanup_all()
    8477643cb91c9 ALSA: hda: trace PCM open only after assigning a stream
    ee507691c18f9 drm/vc4: Use managed KMS polling to fix UAF on unbind
    5d6c49d74a17e drm/xe/shrinker: Return the freed page count through a parameter
    fb2027f7e58c4 drm/xe/mmio_gem: Revoke drm_vma_node on xe_mmio_gem destroy
    2a4555ed75717 drm/xe/mmio_gem: use write-back mapping for dummy page
    6d726f1689cc7 drm/xe/mmio_gem: forbid VMA split
    293c56a66510b wifi: virt_wifi: don't transfer operstate before register
    ea11ade10583c ALSA: 6fire: fix OOB write from device-reported iso length
    999f433c09e46 ALSA: usb: 6fire: Avoid embedded URBs
    84bfead4d4a1a gpio: virtuser: skip free_irq when no IRQ is installed
    80f620951727a Input: trackpoint - fix the inertia attribute name in the ABI document
    74b77820f923c spi: spi-qpic-snand: avoid writing QPIC_EBI2_ECC_BUF_CFG register
    e9aea09626975 ASoC: soc-pcm: Apply snd_soc_dai_link_ch_map.codec_ch_mask to codec params
    2d3bc8ffb52f7 ASoC: Add codec_ch_mask to snd_soc_dai_link_ch_map
    72f5fde1285d0 ASoC: Rename snd_soc_dai_link_ch_map.ch_mask to cpu_ch_mask
    438f0ba25bb6b drm/msm/dp: fix link bandwidth check when wide bus is enabled
    dc57147549a10 drm/msm/dp: skip PUSH_IDLE when the link was never enabled
    d63f5a9f8121f ALSA: pcm: set timer->private_data before registering the PCM timer
    3388f3b76ed0b phy: mediatek: phy-mtk-hdmi-mt8195: Fix TMDS clk bit ratio setting
    7aa1360aca378 phy: mediatek: phy-mtk-hdmi-mt8195: Fix PLL calc divisor overflow
    812ca56867bec ALSA: bcd2000: Fix race between rawmidi and disconnect
    17ac813d4b78f neighbour: Skip default parms when resumed in neightbl_dump_info().
    8de873ba128f3 neighbour: Add missing RCU annotation for neightbl_dump_info().
    b9d00ccdb40b5 neighbour: Convert RTM_GETNEIGHTBL to RCU.
    982c7f66c0413 neighbour: Enforce min/max to NDTPA_INTERVAL_PROBE_TIME_MS.
    151c5a1e4fff0 keys: fix lost wakeup when reaping a dead key type
    daefd7ff159b0 drm: Fix drm_pending_vblank_event leak in error path for out_fence_ptr
    739208827c0b9 arm64: hibernate: clone only the linear map that exists at runtime
    7974314fe4cde perf/arm-cmn: Fix wp_dev_sel2 setting for multi-DTM configurations
    12c1ac230f4ca netfilter: flowtable: hold reference on ct until flow is released
    79084567cd082 netfilter: nf_nat: unregister and release hooks on error
    197a03f5fa9d9 netfilter: nf_tables: fix device name and prefix match in hook lookup
    0ce42c7b84032 netfilter: nft_nat: fully initialise new_addr in netmap setup
    ea27894904452 drm/msm/adreno: Fix the skip_gpu parameter description
    c30c774c2fa67 drm/msm: Fix the separate_gpu_kms parameter description
    b72dcfb9bf1f0 RDMA/siw: Bound fragmented header copies by the remaining length
    38871ff47e2a0 RDMA/efa: Keep EQ resources alive while IRQ is registered
    d2a1c0bf4139c RDMA/efa: Keep admin queues alive while IRQ is registered
    320bf29481fdf dmaengine: xilinx_dma: Fix hardware buffer descriptor chain after cyclic DMA
    c2337cb6d6f37 dmaengine: xilinx_dma: Fix hardware buffer descriptor reuse order
    57537562b026c scsi: qla2xxx: Fix the ql2xfc2target parameter description
    f824f6b83b72f mm: memblock: show all region flags in debugfs
    0fb37d2b6cb82 wifi: mac80211: set up the TX info early to fix failure paths
    41bee71112db5 wifi: mac80211: mesh: release the channel if start fails
    bd3b21145ae2e wifi: mac80211: mesh: reset the CSA state when leaving
    ad5bd0f6a0c33 wifi: mac80211: add HE 6 GHz capability in the scan elems len
    c53040cf8bbdb wifi: mac80211: don't access the TSF of a down interface
    7ef5774db0ed2 wifi: mac80211: don't RCU-dereference the mesh CSA settings we just set
    30c59052fe602 wifi: mac80211: don't allow link changes when iface is down
    fce36d242a18d wifi: mac80211: require a peer station for TDLS setup confirm
    4b54d01b48445 wifi: mac80211: reset the AP_VLAN tailroom counter on ifdown
    73f48f7e16cad wifi: mac80211: don't allow injecting frames wider than the chanctx
    5c79ef616aa16 wifi: mac80211_hwsim: don't hand frames to mac80211 while stopping
    caa02072b2986 wifi: cfg80211: get the wiphy out of a dying network namespace
    d45bf731ec708 wifi: mac80211: unlist vifs when their netdev is unregistered
    96bef5667b0c4 wifi: cfg80211: undo netns switch if renaming the wiphy fails
    fe50844cf94b1 wifi: cfg80211: restore netns_immutable on failures
    5d5ff5b36f574 wifi: mac80211: reset state when starting AP fails
    2e1d6e8014849 wifi: mac80211: abort chanswitch when leaving a mesh
    ae40190b7c5f3 wifi: mac80211: suppress chanctx warning for debugfs reset
    9c34f01b8f217 wifi: mac80211: don't offload TC setup on AP_VLAN interfaces
    5f139e17f5bdb wifi: mac80211: don't warn when an IBSS has no channel to scan
    81baab8b645ec wifi: mac80211: don't start a ROC while scanning
    6d2fd26185678 wifi: cfg80211: don't filter by BSS type when removing stale entries
    86235be788094 wifi: cfg80211: only group hidden BSSes with beacon entries
    e8c75736cfd0c wifi: cfg80211: don't free driver-owned scan requests
    fc1f4884f1d46 dmaengine: wait for RCU readers before releasing dma_device
    6cf31716b77a7 dmaengine: fix use-after-free in dma_chan_put() and dma_release_channel()
    1a0d9b406febf dmaengine: Fix device kref underflow in dma_chan_put()
    3b8633cae8b45 dma-coherent: report a failed reserved memory assignment
    80aafcce8de2a MIPS: Octeon: apply USB FDT fixups also when USB is modular
    fa9ff3bb85a96 soundwire: cadence_master: wait and cancel cdns->work before clock stop
    a2cdb4a675ca0 wifi: cfg80211: check IP header size in cfg80211_classify8021d()
    693d777846d52 wifi: cfg80211: don't get the radio mask for netdev-less wdevs
    188b334a6db36 IB/IPoIB: Avoid restoring OPER_UP after multicast flush
    14cb425ba1f3a wifi: libipw: reject too-short association responses
    2c87bbc00dc93 wifi: libipw: reject too-short beacon and probe responses
    c2cf589c7d546 wifi: brcmfmac: cyw: pass PMKID to firmware if present
    0969c9688389f wifi: mwifiex: fix IRQ leak using wrong index in MSI-X error path
    4f266738af456 wifi: virt_wifi: free skb when disconnected
    b96bc9784a61e wifi: mac80211: include TIM bitmap control for buffered S1G mcast traffic
    afc048e4d2acc dmaengine: sprd: Fix runtime PM reference leak in probe
    8f253d5893f99 RDMA/rtrs-clt: Fix CQ pool leak when connect is interrupted
    8433a15e414a1 RDMA/irdma: Enforce local fence for IB_WR_REG_MR
    5091e25ec503f RDMA/mad: Fix receive buffer leak when PKey enforcement fails
    a0fb2007d00b4 RDMA/bnxt_re: check create_singlethread_workqueue() in DCB setup
    b96b8b3e41c30 IB/isert: wait for deferred control PDU completions before releasing the connection
    6ed3ebaff3345 IB/iser: reject a remote invalidation of an unregistered direction
    89d0406f77591 arm64: dts: renesas: r9a09g047: Switch GBETH TX queue scheduling to WRR
    9d84572a2f7cb arm64: dts: renesas: r9a09g056: Switch GBETH TX queue scheduling to WRR
    4a2cdf631dfb0 arm64: dts: renesas: r9a09g057: Switch GBETH TX queue scheduling to WRR
    77ea927d924f4 power: sequencing: Fix build issue with COMPILE_TEST
    a219459fbd1b2 RDMA/core: Reject unregistering netdevs in ib_get_eth_speed
    9cd08fdca43f6 RDMA/mlx5: Remove warn on missing representor in query_port_speed
    02c0a2fa69c16 RDMA/rxe: insert mcg into mcg_tree only after rxe_mcast_add() succeeds
    c6f56982ec5c7 RDMA/rxe: Restore HMM_PFN_WRITE check in ODP write paths
    e1188332a9110 clk: scpi: bound-check DVFS index in scpi_dvfs_recalc_rate
    69ec03cd48197 firmware: arm_scpi: reject DVFS OPP count above MAX_DVFS_OPPS
    2f3b705144e3a RDMA/rxe: Fix integer overflow in mr_check_range() leading to OOB access
    fe602c91a52e1 RDMA/rxe: validate access flags before swapping the MR's PD
    9dcc0f4e488b7 RDMA/siw: Clear association under lock if siw_qp_modify fails in siw_accept
    593436d6e69f2 ARM: socfpga: select the PL310 erratum 753970 workaround
    6cab554f2c0f2 esp: downgrade zerocopy managed frags before mutating skb frags
    6eb3b071be8e2 xfrm: add missing rcu_read_lock(), skb_dst_force() and dev_hold() for xfrm_trans_reinject()
    248433942155b xfrm: fix compat ALLOCSPI request use-after-free
    c2c6e6f45f309 xfrm: avoid RCU warnings around the per-netns netlink socket
    a7018ee0ea862 xfrm: iptfs: fix runt reassembly panic from short inner tot_len
    7e1c6884a0b49 xfrm: iptfs: fix stack OOB read in iptfs_skb_reset_frag_walk()
    e62a16848bf2c ipv6: Honor oif when choosing nexthop for locally generated traffic
    94671f802bb07 ipv6: Select best matching nexthop object in fib6_table_lookup()
    ba9d1d3524664 media: video-i2c: fix buffer queue ordering
    06724dd3da2e8 sunvdc: fix -EIO issue due to lack of retries
    38984b41f9950 selftests/landlock: Add audit test for whiteout object creation
    ea9965b9474b1 selftests/landlock: Add tests for whiteout object creation
    74bdf27404c24 selftests/landlock: Use an actual chardev for MAKE_CHAR audit test
    ac0a0d7696aa9 selftests/landlock: Add disconnected leafs and branch test suites
    f289962f00450 selftests/landlock: Add tests for access through disconnected paths
    cdc543c9eceb5 selftests/landlock: Explicitly disable audit in teardowns
    3d6f8e2556d5a selftests/landlock: Increase default audit socket timeout
    1be91aa4f5dcb selftests/landlock: Fix socket file descriptor leaks in audit helpers
    d54c0ec29dfa3 selftests/landlock: Add missing connect(minimal AF_UNSPEC) test
    ab115d19fb2c2 selftests/landlock: Add test for TCP fast open
    27d09eaa8b5f2 landlock: Fix TCP Fast Open connection bypass
    8c3b2bf7f39c7 Revert "perf annotate: Fix build with NO_SLANG=1"
    e8694cdbd7db9 Linux 6.18.53
    a0a64525f3414 mptcp: fix bad accounting in __mptcp_subflow_push_pending()
    a09c87abf10a0 mptcp: close race between scheduler and state change
    b2dbcc1ed48b5 mptcp: avoid unneeded actions on subflow reset
    97e684ddf082a mptcp: move the stale logic out of retrans scheduler
    74a2626044de5 x86/mm: Fix and document DEBUG_PAGEALLOC
    100b6b39fe201 misc: amd-sbi: Add null check for devm_kasprintf()
    73867f2536704 drm/ttm: Fix bo resource use-after-free
    329ddc5d438f9 drm/ttm: Drop tt->restore after successful restore
    b21c971e4cb11 drm/ttm: Tidy usage of local variables a little bit
    9d9f6e0612300 smb: client: use atomic_t for mnt_cifs_flags
    2ef532a01f446 smb: client: fail DACL rewrite when the new DACL exceeds 64K
    7de073bbfed44 smb/client: fix security flag calculation when setting security descriptors
    16971cac56f2c smb: client: refactor ACL setting control flow in id_mode_to_cifs_acl()
    374da2b9be128 mptcp: prevent race between disconnect() and rtx
    e2e10b5a45e1e mptcp: do not reschedule the RTX timer for fallback sockets
    2b27760d6b9d9 tcp: remove icsk->icsk_retransmit_timer
    1f4f1db8794b1 tcp: introduce icsk->icsk_keepalive_timer
    d87f96c0d7794 tcp: rename icsk_timeout() to tcp_timeout_expires()
    4a17c73c83798 bnxt_en: Handle buffer allocation failure in bnxt_rx_ring_reset()
    a534569b5cd70 Reapply "bnxt_en: bring back rtnl_lock() in the bnxt_open() path"
    08dd1b268b4bc fwctl/bnxt_en: Move common definitions to include/linux/bnxt/
    4d5834f38b725 mptcp: pm: reset retrans_time when ADD_ADDR entry is reused
    379efd2ce8b26 landlock: Fix use-after-free of the source's parent directory
    c0c40a8f5dc42 landlock: Use mem_is_zero() in is_layer_masks_allowed()
    8e4cc46aa847f landlock: Transpose the layer masks data structure
    b4e4655ba6017 landlock: Add access_mask_subset() helper
    726264e266e1d landlock: Clarify documentation for the IOCTL access right
    7e43129537882 idpf: disable DIM work before freeing q_vectors
    524b781d6553c idpf: introduce idpf_q_vec_rsrc struct and move vector resources to it
    f21cc1e6b7349 idpf: introduce local idpf structure to store virtchnl queue chunks
    1d98a5327fae5 idpf: Fix kernel-doc descriptions to avoid warnings
    e9acb45de8517 erofs: add sysfs feature entry for xattr prefixes
    b734ae4b0d897 erofs: separate plain and compressed filesystems formally
    a7d52d8fd501a net: macb: initialize PTP state before registering clock
    a9e3ae205f7ee net: macb: unify device pointer naming convention
    482c1c7e8fcb0 net: macb: Use netif_napi_add_tx() instead of netif_napi_add() for TX NAPI
    061d8ae82c29c net: macb: Replace open-coded implementation with napi_schedule()
    bcb0936862f2b exit: hold a reference to thread_pid across proc_flush_pid
    34d66c6cf3b54 ns: rename to exit_nsproxy_namespaces()
    4567df9e2d91f ns: add __ns_ref_read()
    a7fdd86c386b7 netfilter: cttimeout: prevent UAF during module unload
    44583fd5735cb netfilter: cttimeout: detach dataplane timeout policy and repurpose refcount
    2cf03ada03532 EDAC/altera: Use parent device for devres in altr_portb_setup()
    962d03bd349c6 EDAC/altera: Use ECC manager compatible to select A10/S10 IRQ layout
    51b07104d563d tracing: Undo the registration when enabling the histogram trigger fails
    2ffaade3611bd tracing: Take the reference before publishing the named histogram trigger
    cfad128171f8e tracing: Set the trace clock before registering the histogram trigger
    3caff4fff9882 tracing: Merge struct event_trigger_ops into struct event_command
    22eb27cdede65 tracing: Remove get_trigger_ops() and add count_func() from trigger ops
    c66e138af626c xfs: initialise args->total for parent pointer updates
    a0c5594541723 drm/bridge: ti-sn65dsi83: Fix error handling in sn65dsi83_reset_work()
    037a00dfd5838 drm/amd/display: Honor Broadcast RGB for BT.2020 RGB output
    6194e1b536dc6 drm/amd/display: Propagate HDMI RGB quantization selectability
    fab569a69c3ae drm/xe: Flush LSC untyped L1 dataport cache after rcs/ccs batches
    925d9aa99a69d drm/amd/display: Rebuild InfoFrames on output color space changes
    cc580cee4dfa2 io_uring/rw: end write accounting from ->ki_complete
    508387ad95ef9 genetlink: pin family module during policy dump
    8d4343a411eaa bootconfig: Fix integer overflow in initrd size check
    6ac44525905e7 init/main: read bootconfig header with get_unaligned_le32()
    84e0cd79d57f0 x86/mm/pat: Allocate split page tables as kernel page tables
    e21a9ea81426a x86/mm/pat: Acquire init_mm read lock on attribute changes to avoid UAF
    5029589bb7736 x86/mm/pat: Don't gate cpa_lock on debug_pagealloc_enabled()
    e164f4a25e23d x86/mm/pat: Convert split_large_page() to use ptdescs
    5d7cbfb65e47c configfs: unhash the dentry before dropping the item in rmdir
    0264b3ee09b11 ipmr: account multicast table and route memory
    e4331c6644db8 drm/pagemap: dma-unmap pages before handling migration errors
    8d1adc3a058f9 drm/xe/i2c: Keep the i2c controller always enabled
    f87259781afcf i2c: designware: Global register definitions
    dc136795f9997 drm/amdgpu: avoid force-completing uninitialized UVD rings
    a335084eae7a1 drm/amdgpu: plumb timedout fence through to force completion
    f90d671463def drm/amdgpu: Make amdgpu_vm_flush() non-failing in submission path
    aa0136206cea8 drm/amdgpu: reorder IB schedule sequence
    3d0162c5be362 drm/amdgpu: add a helper to calculate ring distance
    015a7b68166c2 drm/amdgpu: Fix missing unwind in amdgpu_ib_schedule() error path
    e3c417ad50e63 f2fs: reject setattr size changes on large folio files
    e7a068672b4c5 Revert: "f2fs: check in-memory block bitmap"
    9042867d47017 fou: Fix use-after-free in fou_create()
    ca31116fad095 f2fs: accurately adjust free_sections during free_segment_range
    172dbcf813034 f2fs: fix to reclaim space in f2fs_allocate_pinning_section()
    23eee01c732ec f2fs: embed f2fs_gc_kthread in f2fs_sb_info
    35c5abccd0924 f2fs: limit recovery filename logging to stored length
    db13064669526 f2fs: validate MOVE_RANGE destination size
    740f3458a4798 scsi: qla2xxx: Validate BSG request_len before reading vendor_cmd[]
    b211d138cad86 scsi: qla2xxx: Serialize NVMe unsol ctx list with a per-fcport lock
    a95fc5f1c12bb scsi: qla2xxx: Unlink NVMe unsol ctx before freeing on LS reject error
    359be8dd92a82 scsi: qla2xxx: Clamp max_npiv_vports to VP_CTRL bitmap capacity
    6e6c2ba9022eb scsi: qla2xxx: Fix soft lockup polling continuation IOCB signature
    6ee6dfd922faf scsi: qla2xxx: Use memset_io() to clear QLAFX00 request ring slot
    78dada069bb44 scsi: qla2xxx: Use ring-slot helpers in __qla2x00_alloc_iocbs
    d61e8de98c5a5 scsi: qla2xxx: Skip vport under deletion in report ID acquisition
    20b51ce082392 scsi: qla2xxx: Fix 64G link speed reporting in get_data_rate
    48a44e19746ea scsi: qla2xxx: Bound VP index against VP_CTRL IOCB bitmap size
    1710a69fd74d0 scsi: qla2xxx: Fix use-after-free of qpair work on queue teardown
    f35cb67f2092b scsi: qla2xxx: Fix queue teardown NULL dma_free and bitmap locking
    a57570229edb7 scsi: qla2xxx: Null out freed pointers in qla2x00_mem_alloc() error path
    fff1ae8d0c8c9 media: qcom: iris: fix runtime PM reference leaks
    a91f4445077f8 media: remove conditional return with no effect
    0454bf9b89c2e media: iris: turn platform data into constants
    d6e2411516bb9 scsi: qla2xxx: Zero dport diagnostics buffer to avoid info leak
    c343348473e71 media: chips-media: wave5: Add timeout while stop_streaming
    83899a056aeb1 net: appletalk: fix NULL pointer dereference in aarp_send_ddp()
    c4b478bc50b7c i2c: smbus: reject oversized block transfers in the common path
    7654812b65047 net: usb: pegasus: don't rely on id table pointer arithmetic
    41a52d7e5f193 media: as102: do not rely on id table address comparison
    3236431de8e51 usb: serial: spcp8x5: don't store usb_device_id
    7442ff49371a5 usb: usbtmc: don't store usb_device_id
    9d5e396578097 wifi: ath9k_htc: don't store usb_device_id
    8944ef1bfda53 usb: xusbatm: don't rely on id table pointer arithmetic
    101c68f6aed4f xdrgen: Fix union declarations
    095e8d6e183ef Revert "arm64: dts: qcom: kodiak: Fix the PCIe iommu-map entries"
    d6e796c6ee721 Revert "arm64: dts: qcom: sar2130p: Fix the PCIe iommu-map entries"
    c2be076fa3ea7 Revert "arm64: dts: qcom: sc8180x: Fix the PCIe iommu-map entries"
    3922eef51fb75 Revert "arm64: dts: qcom: sdm845: Fix the PCIe iommu-map entries"
    2708a8804d78e Revert "arm64: dts: qcom: sm8150: Fix the PCIe iommu-map entries"
    1c58d6d3ebc37 Revert "arm64: dts: qcom: sm8250: Fix the PCIe iommu-map entries"
    2b1d21337b37c Revert "arm64: dts: qcom: sm8350: Fix the PCIe iommu-map entries"
    c100af5dca42a Revert "arm64: dts: qcom: sm8450: Fix the PCIe iommu-map entries"
    8ecf63859a17a Revert "arm64: dts: qcom: sm8550: Fix the PCIe iommu-map entries"
    bf61c869a6268 Revert "arm64: dts: qcom: sm8650: Fix the PCIe iommu-map entries"
    e0a03ff2cc815 Revert "arm64: dts: qcom: sm8750: Fix the PCIe iommu-map entries"
    e3a0e9a69f24c Revert "arm64: dts: qcom: talos: Fix the PCIe iommu-map entries"
    7cca135e071ed Revert "arm64: dts: qcom: lemans: Fix the PCIe iommu-map entries"
    7fdedca1d7bf7 Revert "arm64: dts: qcom: qcs6490-rb3gen2: Fix the PCIe iommu-map entries"
    ffd3a3df92be6 crypto: ccp - Fix possible deadlock in SEV init failure path
    868c9038ffd4a ksmbd: don't hold ci->m_lock while waiting for a lease break ack
    26d271aeb294f hwmon: (sht4x) Add missing locks
    3f3f0f2d9847f smb: client: fix UBSAN array-index-out-of-bounds in smb2_copychunk_range
    3889bfff07ebf xfs: actually check internal-rtdev fields in the superblock
    01b369500819f xfs: actually recover intended file sizes in xfs_xmi_item_recover_intent
    0d51c607d80ab xfs: advance the findparent inode scan cursor while holding ILOCK
    82a0fd3fe9089 xfs: bail out on bitmap errors in xrep_agfl_fill
    2828fa1b51245 xfs: compute dquot checksum after resetting dd_lsn in repair
    7418db04b8ccc xfs: count escaped corruption errors in scrub stats
    e1c9eba9ba78d xfs: cross-reference the rtgroup superblock extent, not block
    0b756de8167f2 xfs: destroy seen inode bitmap when we fail to add a dirpath
    7791970a76a3e xfs: don't leak dqacct if rhashtable insertion fails
    176a53af77b43 xfs: don't leak new_bp if xfs_btree_bload_drop_buf fails
    b7bf0cffd41b5 xfs: don't modify file attributes or poke fsnotify for dry runs
    08754ebfa5c28 xfs: don't spin forever on zero-length dirents when salvaging them
    6428adc1f8846 xfs: fix backwards mergeability logic in refcount scrubber
    7756adee4e5a3 xfs: fix backwards skipping logic in xrep_quota_block
    9417c1ecabc98 xfs: fix bnobt repair space reservation disposal failure
    fac32b9950a2a xfs: fix exchange-range reflink flag clearing issue with INO1_WRITTEN
    97fb5eb106f72 xfs: fix name string recording in slowpath pptr tracepoints
    e4e9ff719d516 xfs: fix parent rec lookup initialization in xrep_metapath_unlink
    aafc5bd3b014f xfs: fix reclaimed page accounting in xfs_buf_free
    0040931d8b6f0 xfs: fix replaying dirent removals into the temporary directory
    0f35ecedbef4f xfs: fix rtrefcount btree block counting in scrub
    725ac9b344f7c xfs: fix rtrmap cross-referencing elision logic
    044e1d972ecb8 xfs: fix short ifork reaping computation in xreap_bmapi_binval
    108114437915e xfs: fix the rtrmap and rtrefcount _maxlevels_ondisk functions
    b5089a328acc8 xfs: fix unit conversions in per_binval computation
    2608354447376 xfs: fix xfs_rtrmapbt_mem_cursor for non-rmap filesystems
    ba949a14446b7 xfs: initialise error in xfs_defer_finish_one()
    14ee7065cec64 xfs: log the tempip after we convert it to extents format
    34c680b304664 xfs: make the rtsummary repair fix the file size too
    6c12138eb088b xfs: preserve owner on in-memory btree creation
    11c88bda09a36 xfs: release alleged child inode on metapath unlink error
    57571fc7d9837 xfs: report healthy filesystem events in scrub stats
    5c0e09d2e7aaf xfs: report nonexistent parents as a filesystem corruption
    afc5d6a24e14d xfs: reset parent pointer args before each dir tree unlink repair
    058fc52fe461f xfs: signal inode btree xref error if get_rec returns an error
    10b36be799c2b xfs: snapshot old AGFL before rewriting it
    e119d04706c9c xfs: snapshot scrub stats when rendering them
    5a2c84b85ab8f xfs: strengthen the "is cow staging" helpers in scrub
    f268dd1cff0a7 xfs: truncate quota file correctly when repairing quota file
    9f31c752733ff xfs: use the rtgroup extent count to find rtrefcount gaps
    7fa84c9ca6906 smb: client: fix heap overflow in DACL owner/group rewrite
    dd03fd658ea59 smb: client: avoid leaking refcount when cifs_sb_tlink() fails
    2ed2c29dd9593 smb: client: avoid leaking refcount in cifs_queue_oplock_break()
    99daf75354451 smb: client: fix file type corruption in wsl_to_fattr()
    de54fde4c1861 smb: client: fix file type corruption in posix_reparse_to_fattr()
    73bd76e223e88 smb: client: fix file type corruption in cifs_reparse_point_to_fattr()
    d1f173d28e964 smb: client: fix one-byte OOB read in smb2_parse_native_symlink()
    a6b6561522212 smb: client: pin DFS superblock in iterator callback
    0f1f77b821506 smb: client: reject short READ responses in CIFSSMBRead()
    96751028c0d4d smb: client: reject userspace cifs.idmap descriptions
    78304f78c0956 mptcp: pm: userspace: fix address ID overflow
    d4a67a880654e mptcp: pm: kernel: drop pending ADD_ADDR when removing ID0
    b193ecbd35c2d selftests: mptcp: fix an UAF in mptcp_connect.c
    00b2bd518911e mptcp: syncookies: remember the request backup flag
    109c192f906b6 mptcp: subflow: no need to copy thmac during ulp_clone
    75f58acf5feb6 mptcp: options: handle MPC data + csum reqd + no csum
    c8050386a2209 bnxt_en: Propagate TPA buffer allocation failures in bnxt_queue_mem_alloc()
    b4c40f2c80d7b bnxt_en: Propagate RX ring init failures in bnxt_init_nic()
    8ade95619cbfd bnxt_en: Don't free the live ring's TPA state on queue restart failure
    cc647816fe6a6 bnxt_en: Only restore LRO if the device supports TPA
    c8891da0186fe media: v4l2-ctrls: validate AV1 tile counts
    c7b1ef6dc57f4 media: v4l2-ctrls: validate HEVC tile counts
    a41babf528f70 media: verisilicon: rockchip: reject AV1 frames exceeding the tile capacity
    8f19d869a9f68 media: verisilicon: rockchip: guard VPU981 AV1 divisor and tile buffer
    000b2a6eae2e3 media: v4l2-h264: Fix memcmp() size in B1 reference list comparison
    7992059c04578 media: mediatek: vcodec: bound AV1 tile-start copy to the array capacity
    4f654c9bc9545 media: verisilicon: hantro: bound G2 HEVC tile loop to the buffer capacity
    05720a828096c media: hevc: add bounded tile-count helpers
    02d647428ab1d hwmon: (pmbus) Clear generic status alarms with CLEAR_FAULTS
    30755d3a5782c hwmon: (gpio-fan) Fix use-after-free in alarm work
    21d2b1111abf7 hwmon: (chipcap2) fix channels in humidity alarm notifications
    4d4ce5c3a136f hwmon: (applesmc) fix key backlight workqueue leak on register failure
    c7f77a11a1e71 afs: Clear stale peer app data after address list changes
    e5bc0fa9959dc afs: Fix incorrect free in candidate cleanup in afs_lookup_server()
    9d6c703e24da3 afs: Fix double-unmap of directory block
    c5fa4eb9c4b2c afs: Fix missing kunmap in afs_dir_search_bucket()
    d508312d12ca1 perf: RISC-V: use BIT_ULL for u64 overflow masks
    9bec7beaed074 perf: RISC-V: store available counter mask as bitmap
    f6b263679aa72 s390/crypto: Map EBUSY to EIO when key conversion fails repeatedly
    972e0d9b7d1d1 s390/crypto: Fix wrong return code to engine in asynch callbacks
    7d1456d54b3c7 s390/crypto: Fix missing scrub of temp buffers with PAES algorithm
    203702f0013f9 s390/crypto: Fix handling of EBUSY in PHMAC when req is pushed to crypto engine
    2ea6c036bb922 s390/crypto: Fix missing cra_flags in paes_s390
    8b90a47c4fba2 s390/crypto: Fix missing scrub of temp buffers with AES ctr and gcm algorithm
    d722410191383 s390/crypto: Fix use of mutex in atomic context
    35c3f97569306 s390/crypto: Fix skcipher_walk return code handling in aes_s390
    8407815ae6371 s390/qeth: allow bridgeport queries despite OS_MISMATCH
    d0502ed0a1aae iommu/s390: Fix NULL dereference in iova_to_phys() with ZPCI_TABLE_TYPE_RFX
    5aa22d76c193b KVM: PPC: Book3S HV: Set irqfd->producer only on success
    07f0214018d72 mac802154: fix use-after-free of sdata via queued RX frames
    50c3f06222eaf ipvs: reject invalid states in connection template sync records
    2f1a6dd5c80ce ipv6: flowlabel: cap duplicate leases per socket
    fe9a906d2bff2 ipv4: fib: bound automatic table ID allocation
    d3b8f264ce095 ieee802154: hwsim: serialize pib updates to fix double-free
    c68fd52c73b67 ieee802154: cc2520: fix FIFOP work use-after-free
    98ce5a42cde78 ieee802154: 6lowpan: fix NULL dereference in lowpan_newlink
    7cb5f4643a7fc inet: frags: invalidate queues before flushing them
    5ff1effb047e4 fbdev: vfb: defer cleanup until the last reference
    0b3c8c39e5024 erofs: preserve LZMA decoders on resize failure
    9933ad1c4ff67 fs: autofs: fix memory leak in autofs_fill_super()
    7466511903662 scripts/sorttable: Mark long_size as __maybe_unused
    1efc978dc626b vdpa: solidrun: Free IRQs after request failure
    5ae2dab5d88e5 vdpa: ifcvf: Put device on unsupported feature error
    669fb15936356 netfilter: report NLM_F_DUMP_FILTERED when all is filtered out
    64803ba0a0579 netfilter: nf_log: unregister loggers before per-net teardown
    3d038eebdbd40 netfs: Fix uninitialized return value in netfs_unbuffered_write()
    ca5d2cbd7a307 net: phy: dp83td510: handle the active-high LED polarity mode
    a0d18d21d48a5 net: openvswitch: fix use-after-free of the flow table mask array
    da8c3a7f5d313 net: mpls: clear inner_protocol when the last label is popped
    1e43c407624d2 net: mana: Reserve extra CQ slot for the fence completion CQE
    49d592d5fd4dc net: hso: fix TIOCMIWAIT race
    709451db123d9 net: dsa: tag_brcm: legacy FCS: request needed tailroom
    994fd705ca498 net: bridge: use option bits for CFM/MRP frame handlers
    64b36eaef6ea5 net/sched: act_api: release all action references on NEWACTION failure
    9fd4ea952e6ac ring-buffer: Check resize_disabled before publishing the new subbuf order
    136b443a69fb5 ring-buffer: Acquire the lock with irqsave in rb_wake_up_waiters()
    927d96f91c582 io_uring/net: don't overconsume buffers when using MSG_TRUNC
    fa5c0449f5faa io_uring/net: let io_recv_buf_select return the length of the buffer region
    25dceb2c326e0 drm/sched: Create a fake device for KUnit tests
    49f5268f43a79 drm/rockchip: analogix_dp: fix unchecked bound endpoint name length
    9ac6db531abe9 drm/i915: Fix memory leak in query_perf_config_list()
    f3e74866018da drm/drm_exec: fix up contended obj when num_objects is 0
    2831917ace195 drm/bridge: tc358768: Enforce input bus flags via atomic_check
    fc105d2621cd6 function_graph: Use the saved entry's size when reprinting it
    76e478499913d fs: don't return -EINVAL for successful nested thaw
    19ddef61ee0a4 exec: do_close_on_exec() before taking exec_update_lock
    27c9b491bf760 cpufreq: initialize policy rwsem before sysfs publication
    6e166b9281dec cpufreq: zero-initialize policy cpumask before sysfs publication
    422f654725965 Bluetooth: btrtl: Don't leak return code when parsing firmware format v2
    2dcc2240b4e5f Bluetooth: btqcomsmd: destroy RPMsg endpoints before freeing hci_dev
    998ca92f69bc4 ASoC: sti: initialize IRQ lock before requesting IRQ
    ff63b0adc4f6a ASoC: sprd: validate compress buffer sizes against fixed allocations
    5d06257359c90 accel/ivpu: Limit firmware log name prints to field size
    40868f80a8919 accel/ivpu: Validate firmware log buffer metadata
    43c68f52aecd5 accel/ivpu: Validate full buffer range in ivpu_to_cpu_addr
    c80b2a8067d58 tracing: Keep the entry count when the histogram stats allocation fails
    37b09bf1dbd91 tracing: Let histogram values keep the percent and graph modifiers
    b22dc0add7d72 tracing: Free histogram the field rejected for a bad modifier
    4cff53bb19412 tracing: Free histogram var refs regardless of how often they are referenced
    222abcbe7866f tracing: Free histogram the var ref when its initialization fails
    0892da2272ec5 tracing/user_events: Don't destroy fields when event removal fails
    fb40c5a7eae89 tools/bootconfig: Fix integer overflow and truncation in size checks
    3525b94b2f258 tick/broadcast: Plug clockevents replacement race
    04b943f8756b0 tunnels: Drop stale dst when building an ICMP error for PMTUD
    87b12dc360a00 ufs: validate cylinder group metadata before caching it
    785e523b6c193 ufs: create the root dentry after loading cylinder metadata
    d60a3dbf176bb virtio_mmio: disable IRQ wake before free_irq
    e1daf1ef08e7c watchdog: sunxi_wdt: preserve boot-enabled watchdog
    054022c8e74fe drm/amdgpu: skip gfx switch_power_profile during GPU reset
    784f4e9a0bd6b dm/amdgpu: fix malformed link_settings debugfs output
    26a9a55b58747 Revert "riscv: Reset pmm when PR_TAGGED_ADDR_ENABLE is not set"
    b0c30fe6c0d59 ALSA: usbusx2y: validate URB actual_length in interrupt callback
    381495b5b3da1 ALSA: usbusx2y: fix in04_last array size mismatch with in04_buf
    d9c537b14f498 ALSA: us122l: Prevent write upgrades for read mappings
    dba9369467af1 ALSA: ctxfi: Fix CA20K2 S/PDIF passthrough
    fec4470173562 drm/panic: clean new `clippy::needless_range_loop` lint for Rust 1.100.0
    f1bc7c7cfbc97 rust: allow `unknown_lints` in generated bindings for Rust < 1.88
    d6e72b82f2144 rust: allow `clippy::as_underscore` in the generated bindings
    9e026a91fe799 tracing: Fix memory corruption from a "STACKTRACE" histogram key
    141f7ddee571f tracing: Restore :mod: trailer after parsing in ftrace_set_clr_event()
    57bfc2a17954d tracing: Fix memory corruption from the histogram stacktrace modifier
    ad72e2566643f reboot: fix cad_pid use-after-free race
    b89b691dd00bf ipv6: fix fib6 walker UAF on seq stop
    281e6f536f2f3 x86/alternatives: Exclude text poking against change_page_attr()
    35820cf8dd521 x86/mm/pat: Acquire init_mm write lock on collapse to avoid UAF
    cd9b4595d6283 x86/cfi: Fix FineIBT hash offset in cfi_get_func_hash()
    55ddbc2ca6d5d x86/mm: Fix user-space data loss with MADV_FREE and THP
    84e3a71d11d85 x86/amd_node: Fix PCI device reference counting in amd_smn_init()
    5206e1b65a49b crypto: x86/aria - add missing vzeroupper in AVX-512 code
    8764a17eab6b2 crypto: x86/aria - add missing vzeroupper in AVX2 code
    fcd19bc829eca x86/amd_node: Fix potential NULL pointer dereference
    9273a90465d58 x86/amd_node: Avoid divide by zero on virtualized systems
    eb47c2e85d6b8 powerpc: pci-ioda: Fix the stale irq chip reference
    2920af33d097c powerpc/eeh: Fix recursive locking on devices without EEH sensitive driver
    05ae635ca64eb powerpc/ps3: Fix repository.c build failure
    4f54beb2e7f6d configfs: pin the symlink target's dirent instead of chasing ->ci_dentry
    cd2bcee450bc9 ksmbd: prevent out-of-bounds reads in share config responses
    f6f6351e98c77 scsi: target: iscsi: Fix hang for aborted WRITE_PENDING commands
    7c3d16e2d70cf scripts/mksysmap: fix escape of '$' in the __pi_ pattern
    1bc4b322209fb scripts/mksysmap: drop the MODULE_INFO() symbols from kallsyms
    6bf73fc588da7 erofs: add missing buf->off in erofs_bread()
    57835952566f0 sunvdc: unmap LDC cookies when the descriptor send fails
    447a4c362d9c4 openvswitch: fix wrong flag value in get_ipv6_ext_hdrs()
    709eb0aad071c net: hsr: enable promiscuous mode on interlink port with fwd offload
    c28175220f808 net: stmmac: fix TX descriptor availability check for TSO traffic
    29bc25bdfbbe4 net: stmmac: add TSO check for header length
    bd658b924befd net: stmmac: add stmmac_tso_header_size()
    47411c5489369 net: stmmac: fix TSO support when some channels have TBS available
    8cbfeb54bf781 net/rds: fix tcp stream corruption with large pages
    5b3cdc9abd82b net: mana: restore the XDP program pointer when pre-allocation fails
    f1fd43ada27ed net: phy: dp83867: handle the active-high LED polarity mode
    13b79c3475955 octeontx2-af: fix PF/CGX debugfs PCI bus lookup
    4b20e66d2e52d net: net_failover: Fix the deadlock in net_failover_slave_name_change()
    63756bdb693be net: phy: mediatek-ge: disable EEE on the MT7530 PHY
    9edd644864787 net: ethernet: mtk_eth_soc: populate lpi_interfaces to fix EEE support
    c364e92326809 net: ethernet: mtk_eth_soc: fix supported_interface set after phylink_create
    3bfd924b4c415 net: ethernet: mtk_eth_soc: avoid writing to ESW registers on MT7628
    3c367198e2e28 net: dsa: mt7530: populate lpi_interfaces to fix EEE support
    fe997254b17dc net: dsa: mt7530: add EN7528 support
    9f6ad383901d0 net: hinic: fix mailbox segment buffer overflow
    7aa02f2d88289 net: sun4i-emac: fix missing of_node_put() for phy_node
    503ba58481e3b net/sched: cls_api: Don't replay RTM_GETCHAIN in tc_ctl_chain().
    6cb09c50e6950 net/sched: cls_route: Fix in-place replace
    84a02ebd1af2d net/sched: cls_route: Reject handle aliasing
    f8495d67434e1 net/sched: cls_route: free emptied bucket on filter move
    a7bdefb1e0096 sched/core: Call wq_worker_tick() for the execution context
    abb62a1cde7a7 sched: Account cgroup CPU time to the execution context
    17eac15a45c54 sched/eevdf: Fix rb augmented with multi fields
    0ac7bc0c06fea sched/eevdf: Fix augmented max_slice
    a5fe19dd8b3ed perf/x86/intel: Prevent drain_pebs() reentry
    84874ffde459d perf/x86/intel: Correct pt_regs->flags update for PEBS path
    997a27ce79b7f perf/x86/intel/ds: Factor out PEBS group processing code to functions
    6d0b9ce3be221 perf/core: Allow list_del during perf_event_overflow()
    5f1c9972cb274 selftests/powerpc/tm: Fix tcheck() reading uninitialised CR value
    dcaba72c85c14 net/mlx5e: Move representor vnic reporter to eswitch devlink port
    eab1eec4fd049 net/mlx5: Register SF resource on PF port representor
    95e281451039b devlink: Add port-level resource registration infrastructure
    0ae06df01c929 devlink: Refactor resource functions to be generic
    25cc0096efba8 net: stmmac: initialize ptp_lock at probe time
    0996c3e6bcc6a ppp_synctty: ensure a writeable skb header
    bfb74c48ac2d3 vxlan: initialize _md in vxlan_xmit_one()
    621c99be42e3f octeontx2-pf: reset HTB scheduler topology before freeing queues
    2231c7f0067b4 hwmon: (nct6694) do not expose enable on DTIN temperature channels
    a5de53b08cc31 hwmon: (corsair-cpro) Remove debugfs entries when probe fails
    6f0c3c5fcfd92 hwmon: (aspeed-pwm-tacho) Propagate reset deassert errors
    9c237c7eb0e87 hwmon: (gpio-fan) take fan_data->lock in gpio_fan_shutdown()
    a58a966a44007 hwmon: (corsair-cpro) Create debugfs entries after hwmon registration
    74bab088a7152 net: ks8851: Fix receiver error in 100BASE-TX mode following software power-down
    c0870eeb5234b net/micrel: Fix typos in micrel driver code comments
    312a6da9f42a0 net: dsa: lantiq_gswip: fix GSWIP_MDIO_PHY_FCONTX_EN value
    f324ff4f69c3c watchdog: msc313e: Sync timeout value if WDT was running at boot
    abda3de184785 watchdog: msc313e: Fix undefined behavior
    037a82b74597a watchdog: msc313e: Fix spurious reset on suspend
    cf078e4322f10 watchdog: msc313e: Enable clock before accessing hardware registers
    2abf99a57b0b7 watchdog: msc313e: Fix clock leak and spurious timer in settimeout()
    47eae41c630b9 watchdog: msc313e: Avoid division by zero
    a67224b15bd25 watchdog: fix hrtimer start when pretimeout is zero
    d1fcb4c69f7e4 mptcp: remove unneeded READ_ONCE() annotation
    5fba30080d298 net: macb: put the "mdio" child node reference on success
    e92a45b872b03 net: macb: destroy the phylink instance on the probe error path
    e7ff91f19c1aa ipv6: null-check fib6_node before accessing in __ip6_del_rt_siblings()
    03da1d13b0c01 net: mana: Clear RDMA teardown and suspend state in mana_rdma_probe()
    8b28ff3728e41 Bluetooth: btusb: Fix leaked runtime PM reference in btusb_reset
    61e9bf51c6df9 Bluetooth: btusb: mediatek: Fix leaked runtime PM reference in reset
    eeabdb25c3209 Bluetooth: hci_sysfs: Fix NULL pointer dereference in device_del()
    115d94b4ffe2d Bluetooth: btmtk: Declare MT7920 (MT7961 1a) Bluetooth firmware
    932a87444107e Bluetooth: btintel_pcie: fix tx_handle bounds off-by-one
    73a50c636425c Bluetooth: btintel_pcie: validate packet_len before skb_put_data
    93b59937bda3f Bluetooth: btusb: Fix UAF of btusb_data by rx_work
    0b0d2f9db2406 eth: ice: don't dereference pointers from TP_printk()
    f5463bc124c0d ice: add missing xa_destroy for sched_node_ids
    325ed97a75518 idpf: account for VLAN header when parsing RSC packet header
    b3c5dcf9ae702 ALSA: hda: Report a change when only the channel status bytes move
    89a5a885e45cd drm/logicvc: Drop the select of the nonexistent CONFIG_DRM_KMS_DMA_HELPER
    be638c93d0a3e drm/adp: Drop the select of the nonexistent CONFIG_DRM_KMS_DMA_HELPER
    34b968b0f912d net: ethernet: cortina: Count RX descriptors for freeq refill
    adc42c548c259 net: ethernet: cortina: Count RX drops once per frame
    2368a3636634c net: ethernet: cortina: No mapping is a dropped rx
    cceb6cd7f0e5e net: ethernet: cortina: Count dropped frames as NAPI work
    8b1330a102081 net: ethernet: cortina: Finish RX updates before NAPI completion
    0ef8eaef5806c net: ethernet: cortina: Fix budget accounting
    561ec9bd6eef1 net: ipv6: Clamp to IP6_MAX_MTU in ip6_dst_mtu_maybe_forward
    ce66352d3eb21 net: ipv6: Fix UDP length overflow with PMTU discover and big MTU
    83fedc4741210 net: ipv4: Fix UDP length overflow with PMTU discover and big MTU
    d5dd55b316ca2 af_unix: Return immediately when manage_oob() returns NULL for 0-length buffer.
    f1816b3d7ce80 af_unix: Update last skb marker in manage_oob().
    a3ba86a270dd8 virtio_input: stop callbacks before unregistering input device
    8407da8974326 virtio_input: reset device if input_register_device() fails
    345dd80239556 virtio-pci: return IRQ_HANDLED after non-zero ISR
    3af20238a09ca vdpa_sim_net: check TX pull result before RX copy
    a8a1413a2cfdb vdpa_sim_blk: reject out-of-range sector starts
    5a075ee239892 vhost-vdpa: protect config_ctx from being freed under the config callback
    65faf9eaa00e4 vhost-vdpa: don't install the eventfd_ctx_fdget() error in config_ctx
    68232102f20fc vhost/vdpa: reject VRING_NUM larger than device max
    a80c33488e0bb virtio_console: do not free control-out buffers on remove
    77dbd10a701a3 virtio: fix use-after-free in unregister_virtio_device()
    42ccf20c5318e irqchip/gic-v5: Preserve ICC_CR0_EL1 state
    f76e4622ad037 ASoC: mt6351: Publish the OF module alias
    465dba4a4380a netfilter: ip6_tables: set F_PROTO when proto value is nonzero
    1a7a8ac9a9f0a netfilter: nfnetlink_log: cope with concurrent instance destruction
    d082265bb2c6b ASoC: Intel: SST: Publish the PCI module aliases
    32ca4438c15d5 ASoC: bcm: bcm63xx: Publish the OF module aliases
    267f7f78205cd hwmon: (sht4x) Fix return value from heater_enable_store()
    97fe732231677 hwmon: (sht4x) Rely on subsystem locking
    d54d0b6766b7a Documentation: hwmon: replace full-width colon by a standard ASCII colon
    ec894ec755fd1 hwmon: (ina2xx) Decouple in0 and curr1 alarms
    73f86661d5c1b hwmon: (ina2xx) Replace masks with enum in alert functions
    c95160c296c8a hwmon: (ina2xx) Parameterize ina2xx_data in ina226_alert_read()
    75824defbb6c6 hwmon: (ina2xx) Rely on subsystem locking
    1961b2fe8e680 hwmon: (ina2xx) Acquire hwmon_lock in shunt_resistor_show()
    8afab57bcdbc2 hwmon: Fix potential UAF in pec_store
    7d72088801e77 Documentation/hwmon: Document hwmon_notify_event()
    80b46a3d066d4 hwmon: (ltc4282) Make sure clk_init_data is fully initialized
    01536047c2b73 iommu/amd: Fix premature break in init_iommu_one() again
    94458b80d3b20 iommu/amd: Do not reallocate GA log buffers on resume
    b575a8fe6d647 iommu/amd: Add NUMA node affinity for IOMMU log buffers
    13fbbb2a8caf0 iommu/riscv: Disable SADE
    36b08f2f009e1 iommu/riscv: Add command queue lock
    0c1b907d5db2f ALSA: caiaq: Decoupling ep1_in_urb in caiaq dev
    e2e1161e03fec bpf: Reject non-scalar bpf_loop iteration counts
    5710f6a74f63c net: macb: fix NULL pointer dereference on unbind with fixed-link
    3ec7974b3f3e8 net: macb: rename bp->sgmii_phy field to bp->phy
    8f80b113dea0b net/sched: ets: clamp quantum in parse and fallback paths
    d43cded350fe1 net/sched: drr: clamp quantum in change class
    e2a9a08303e5d net/sched: pie: clamp psched_mtu in pie_drop_early
    b9f96ce6eb4f3 net/sched: dualpi2: clamp psched_mtu at all call sites
    2e77947bbf6c1 net/sched: hhf: clamp quantum in change and init paths
    534cd7ecbbc6e net/sched: sfq: clamp quantum in change path
    c11e3a39807eb net/sched: fq_pie: clamp quantum in change path
    4d3f907dc2b7b net/mlx5e: Keep HW timestamp stats monotonic across reconfiguration
    72cfcb79026cf net/mlx5: E-Switch, prevent mc_list repopulation during vport disable
    e393789e92310 net/mlx5: E-Switch: fix use-after-free in mlx5_eswitch_termtbl_put
    72324da8eeca2 net/mlx5e: Fix use-after-free race in sample_restore_put()
    9f23cf6dcb3a9 net/mlx5e: Fix ETS zero BW reporting when one TC holds 100%
    b3f2e71cb9ea1 net/mlx5: LAG, use local tracker to update active ports
    50de5ca2210c2 net/mlx5e: Fix setting RS FEC after remapping
    a00bcb277e0cc net/mlx5e: Fix missing FEC mode mapping for RS_544_514_INTERLEAVED_QUAD
    156a3bab69744 net/sched: defer qdisc freeing after failed creation
    765c5e357e679 net: mctp: i3c: serialize probe with bus removal
    1a01c88f51f19 powerpc/kexec_file: Use inclusive range checks for excluded memory
    67b4df34f893a powerpc/kexec_file: Use inclusive range checks in add_usable_mem()
    6410209796805 pds_core: don't release PCI regions for VFs on reset
    fa31bd14c5042 pds_core: fix cmd_regs access racing BAR unmap on reset
    2fd0880f0272e net: reject oversized tx_queue_len at netlink parse time
    081340cf70a78 net: cap tx_queue_len at S16_MAX to prevent oversized ring allocations
    53359916ceb64 vxlan: reject dynamic fdb entries that reference a nexthop id
    eebb6a9017b55 s390/ism: folio_put() after error
    2afd5c230e720 dibs: Unregister dibs_class after error
    a1f77c6c7d8d4 dibs: change dibs_class to a const struct
    0e079bbdcee72 dibs: Remove reset of static vars in dibs_init()
    659654654eb14 net: usb: cx82310_eth: drop URB after 0xffff reboot sentinel to prevent partial_data heap overflow
    5a0d7f40624aa ionic: use netif_txq_maybe_stop() in ionic_tx()
    0866936086cfb octeontx2-af: mcs: Clear stale X2P calibration state before calibration
    38ab2a435001a net: bridge: mcast: properly convert mglist to rcu
    7a683c2b06281 net: dsa: mv88e6xxx: bound the policy rule dump by the caller's buffer size
    edaec279f59f8 eth: nfp: drop the replaced rule from the list when reprogramming fails
    a7e023c63e855 eth: nfp: bound the ntuple rule dump by the caller's buffer size
    fd1a78c16b1f6 net: dsa: bcm_sf2: bound the CFP rule dump by the caller's buffer size
    f27ac16357cfa bonding: use skb_cow_head() in bond_do_alb_xmit() and rlb_arp_xmit()
    d643cea424866 nexthop: Initialize extack in remove_nh_grp_entry()
    fc204636300bc selftests/bpf: Fix flaky bpf_nf test when random NAT port is 0
    d6917eebe1798 tracing: Fix to avoid creating trace instances with duplicate names
    96e2a8ab80587 tracing: Add boot-time backup of persistent ring buffer
    135d542b97fa9 bpf: Reject untrusted allocated-object pointers
    0bdd6121c8dd5 bpf: Require MEM_PERCPU for percpu kptr stores
    5dc188b191513 thermal: sysfs: switch to use scnprintf() to suppress truncation warning
    e2ae33247e8b2 bpf: Don't predict JMP32 pointer vs zero comparisons
    3484a99303912 bpf: Reject legacy packet loads from callbacks
    3014e8a8bdad5 bpf: Mark faultable stack helpers as sleepable
    4d8784226bd3c bpf: Mark bpf_btf_find_by_name_kind() as sleepable
    b545fa447e09e bpf: Check ancestor frames for rbtree callbacks
    4965cf2770069 bpf: Track verifier instruction stats for each subprogram
    f9b36239f3a7a bpf: Report maximum combined stack depth
    81a8cc0f81a64 bpf: Print breakdown of insns processed by subprogs
    2b3abe0e90046 bpf: share several utility functions as internal API
    ba3c4c447fed0 bpf: Only enforce 8 frame call stack limit for all-static stacks
    4375b3d1c2898 mlxsw: spectrum_ptp: Fix napi_gro_receive() call from GC workqueue context
    a8bddab54aa68 net: bcmasp: fix tx_spb_ring_full() checking same slot cnt times
    47a5cecca925c net: bcmasp: clear txcb->last before writing each descriptor
    75bd5ea9c858d ASoC: Intel: avs: Refactor and fix init_config access
    b199e3db839b1 ASoC: Intel: avs: Honor NHLT override when setting up a path
    5ba5da8842383 ASoC: Intel: avs: Allow the topology to carry NHLT data
    23ebd4ed57993 ASoC: Intel: avs: Fix unbalanced module reference count
    b230b2219e423 ASoC: Intel: avs: Do not ignore -ENOENT when loading a topology
    498bf26639e99 ASoC: Intel: avs: Clean up the bus when fetching ML caps fails
    cdaa2e829c4eb nvme-tcp: defer TLS inline send to io_work
    f56b2bb4b18b0 nvme: remove stale namespaces by NSID range during scan
    3c03a1b8ded85 bpf: Mark sched_process_wait argument as nullable
    cc2e065ed206a bpf: Reject resilient lock operations in rbtree callbacks
    617c8266e49f4 bpf: Reject tail calls directly from callback frames
    0e78cb242a57e bpf: Mark signal tracepoint siginfo arguments as scalar
    ca086264e9810 bpf: Fix NULL-ptr-deref in btf_var_show()
    98f1cb9522133 bpf: Fix NULL-ptr-deref when showing a void BTF type
    d9952b0ba20f1 drm/rockchip: rk3066_hdmi: Add missing Kconfig selects
    df7c96e390ffa drm/rockchip: dw_dp: Select DRM_BRIDGE_CONNECTOR
    1dd715ca0568e ALSA: caiaq: Fix potential double-free at error path
    7a0f287d71311 selftests/alsa: Fix the step check for INTEGER controls
    ec52dfed7b145 erofs: disable LZ4 rolling decompression for now
    a259c26061fa3 arm64: trans_pgd: clone only the linear map that exists at runtime
    2c2b229d439a0 net: gro: Fix nesting of TCP GSO SKBs in skb_gro_receive_list()
    364b6e4327f72 net: stmmac: reconfigure RX packet parser table in stmmac_hw_setup() after reset
    19811a68a7661 net: airoha: enable RX_DONE interrupt for RX queue 31
    4cb9b6d3d31a2 net/rds: don't let rds_conn_shutdown() consume a concurrent drop
    900e96c9749a0 net/rds: acquire the fastpath locks in rds_conn_shutdown()
    8e4c3b7844c90 net/rds: acquire RDS_IN_XMIT in rds_tcp_reset_callbacks()
    47a1cb4d194ee net/rds: tcp: don't force RDS_CONN_RESETTING over a concurrent shutdown
    6b8d7563c28b8 net/rds: clear cp_flags bits individually in rds_conn_path_reset()
    ea6f65c4f9fe1 net/rds: use clear_bit_unlock() in release_refill()
    a269795107f45 net/rds: use wq_has_sleeper() in release_in_xmit()
    a29ea5b503465 net: Remove conflicting altnames for dying netns in __dev_change_net_namespace().
    19ba7ecfade15 bonding: do not clear curr_active_slave prematurely when releasing all slaves
    d6c39774ae093 bpf: reject BPF_PSEUDO_FUNC reference to the main program
    411c9080a7765 tracing/probes: Fix use-after-free on field name/type of events with multiple probes
    4be8380e3af00 netfilter: nf_conntrack_sip: fix OOB read in sip_skip_whitespace()
    524599714558d ipvs: fix reversed sequence option serialization
    66c08e5ee8f97 drm/amdgpu/userq: fix struct drm_amdgpu_info_device padding for 32bit compile
    d8f5704952194 btrfs: zstd: fix lost wakeup when waiting for a workspace
    203cbfb4fba59 btrfs: do not force reloc root creation during qgroup_account_snapshot()
    c9e0aa9967064 btrfs: send: fix lost error return value in will_overwrite_ref()
    40370f02a1ca3 btrfs: zoned: finish active block group cleanup if call_zone_finish() fails
    d9b42f553c81c btrfs: return proper negative error code for update_raid_extent_item()
    1b4d4e890c2c8 btrfs: fix the possible bioc_list memory leak during error
    2fbfd02bdfe12 btrfs: fix transaction use-after-free in raid stripe insertion
    b6711a77aed3f btrfs: scrub: report the failing sector's address, not the stripe base
    3c948b894fb0f ASoC: ux500: Program the MSP FIFO watermarks
    271bb038cf198 ASoC: ux500: Allow repeated MSP prepare calls
    1af5676c80aa2 ASoC: ux500: Remove obsolete PRCMU QoS calls
    4c31f08819ed7 ASoC: ux500: Request the MSP MMIO resource
    a1e61026f0358 ASoC: ux500: Deassert the MSP reset during probe
    23f993e6cdc18 mfd: db8500-prcmu: Fold dbx500 header into db8500
    dafe8e402ace0 ASoC: ux500: Validate MSP DAI configuration
    23e8d82fa7a28 ASoC: ux500: Correct MSP frame and bit clock setup
    44f34dfd80e44 ASoC: ux500: Propagate MSP setup errors
    25556165cec1d ASoC: ux500: Fix MSP stream lifecycle handling
    64c605f7af901 printk/nbcon: Change nbcon_irq_work to IRQ_WORK_LAZY
    228075f31b141 ALSA: ump: do not touch legacy_rmidi before it exists
    aa8e82904d4b5 octeontx2-af: Fix limiting SRIOV VF count logic
    c7acfb04c7e2e locking/lockdep: Invalidate stale class_cache entries for zapped classes
    e5cf7a6891975 perf/core: Skip empty AUX records with only format flags
    0953b2ad67c48 x86/itmt: Don't make ITMT enablement depend on debugfs
    755476d7ba92a sched/rt,dl: Skip migrate-disabled tasks when picking a push candidate
    6a1a15d86ba69 sched: Make class_schedulers avoid pushing current, and get rid of proxy_tag_curr()
    7b23144c3ff6e scsi: mpt3sas: Avoid out-of-bounds cpumask_of_node() call in _base_assign_reply_queues()
    6af253bccc36c perf: RISC-V: check cpu_hw_evt before dereference in overflow IRQ
    27314f96d29b5 bonding: alb: fix uninitialized transport header access in alb_determine_nd()
    e127ac29a5213 btrfs: restore active device pointers after failed sprout
    8b001df2b37ca btrfs: detach failed sprout device from transaction update list
    b99621d17145a ALSA: dummy: Report a change when one capture switch channel moves
    b13dba708ca09 drm/xe/oa: Remove sysfs entry on idr_alloc failure in xe_oa_add_config_ioctl()
    ecd88ef5f1d20 ASoC: amd: yc: fix memory leak in acp6x_pdm_dma_close()
    4ec48a321a0eb ASoC: amd: renoir: fix disable_pdm_interrupts() to clear mask bits
    470db2026a435 ASoC: fsl_micfil: balance mclk enable/disable
    73eec5a0d5591 s390/boot: Avoid IPL parameter append past command line
    17c25ee98eba6 s390/boot: Fix physical memory search range
    4c9d9cd4d8882 ALSA: hda: restore MFG widget enumeration after core split
    f0c869df2c337 staging: fbtft: make dirty_lock IRQ-safe
    72abe77e88c3f af_packet: Don't cast tpacket_hdr.tp_len to int in tpacket_parse_header().
    97b21ef57dfab ipv6: sr: restore network header before routing and forwarding
    4ab2977323d5f tipc: Dont send random pad bytes in RESET/ACTIVATE messages
    ad805326d8740 tipc: fix NULL deref in tipc_named_node_up() on empty publication list
    35a575df905b9 ip6_gre: check tunnel info before xmit in ip6gre_tunnel_xmit
    2c2091e2ee930 ipv6: mcast: use copy-on-write RCU updates in ip6_mc_source()
    8d4fe5c13f505 ipv6: mcast: fix RCU list diversion in ip6_mc_del1_src()
    335e50c8abe0f ppp: ppp_synctty: simplify tty disc_data access
    152e946133e8f ppp: ppp_async: simplify tty disc_data access
    d3011d1f29347 igmp: convert struct ip_sf_list to RCU
    feab9261b537d net/sched: cls_u32: fix duplicate handle when node ID pool is exhausted
    ada82338765c7 net: ethernet: oa_tc6: Fix for the wrong data type
    f690f83225b49 net: ethernet: oa_tc6: Disable tx queues on fatal error
    9d3f6e714d5f8 net: ethernet: oa_tc6: Improve the error recovery
    0deefb86f7775 net: ethernet: oa_tc6: Protect skb pointer used by two different kernel instances
    3e0ff19d0c4d9 net: ethernet: oa_tc6: Add the OA_TC6_ prefix to standard registers
    dfc4343e1212d net: ethernet: oa_tc6: Export standard defined registers
    d096135160135 net: ethernet: oa_tc6: Handle the OA TC6 SPI protected mode
    4481f0b8384d2 net: ethernet: oa_tc6: Interrupt is active low, level triggered.
    161abd6cefc84 ASoC: ab8500: Validate and program TDM slots correctly
    353659d11a34e ASoC: ab8500: Correct digital interface format setup
    4edc96d4184af ASoC: ab8500: Repair the DAPM capture graph
    c842af2c83705 ASoC: ab8500: Reset the audio block before configuring it
    eb1b43ec5d6b7 Bluetooth: hci_mrvl: Fix wrong return value check of wait_on_bit_timeout()
    3d9fb936d8d9f Bluetooth: L2CAP: clear FLAG_DEFER_SETUP only for same PID/PSM
    6da5c0331fc3e Bluetooth: L2CAP: fix out-of-bounds write in l2cap_ecred_connect
    5d5a625cbc854 Bluetooth: L2CAP: fix chan mode for LE_CONN_REQ + EXT_FLOWCTL pchan
    a11ebe8dc0333 Bluetooth: hci_core: Fix race condition during device registration
    058f56de5f48b Bluetooth: btintel: bound firmware ID by TLV length
    76948d207d097 Bluetooth: btintel: validate version TLV value lengths
    e9c2864ec4cf7 workqueue: reject watchdog thresholds that overflow jiffies
    2f6ca6581ef1d Bluetooth: btintel_pcie: Clear automask on spurious interrupts
    09d16f8580227 sched_ext: Fix vtime delta loss in scx_flatcg cgroup migration
    5dff82f1aa96a sched_ext: Update demo schedulers and selftests to use scx_bpf_task_set_dsq_vtime()
    7271eeb2935ce sched_ext: Fix timer pinning and return value in scx_central
    88a31c7164503 s390/diag324: Preserve -EBUSY return code
    8d7988e8116c3 s390/ipl: Fix NULL deref in dump_reipl without re-IPL parm block
    50f9c40768e84 s390/ipl: Fix NULL deref in kdump without re-IPL parm block
    77cc8e8e882e5 s390/time: Use jiffies instead of jiffies_64
    33c7fba9f9b18 s390/vtime: Use __this_cpu_read() / get rid of READ_ONCE()
    30dbb08777b9a ksmbd: rate limit unmapped SID errors
    37952f03d5171 ksmbd: propagate DACL parsing errors
    fd137bf8149bc ALSA: pcm: Serialize PCM mmap with buffer reallocation to fix page UAF
    68d459e6e609c cachefiles: Fix potential UAF/KASAN warning
    cf6f93b8b06ac netfs: break unbuffered write when netfs_alloc_subrequest() fails
    ebefb12122d13 netfs: Fix subreq ref leak
    5d280d9cc2893 netfs: Fix i_size update for partial transfer
    b706527a90e25 netfs: Fix error vs transferred passed to ->ki_complete()
    9bd43226f4506 netfs: Fix unbuffered/DIO write partial transfer error return
    cda45c3474f2c perf powerpc-vpadtl: Fix raw_size of DTL samples
    31ba77e9001f3 OPP: of: Fix potential multiplication overflow when calculating freq
    d64300f3409dd perf symbol: Do not use debug file as the binary type
    744b25040d820 watchdog: msc313e: Fix NULL pointer dereference in PM callbacks
    74e2a56c82209 vxlan: mdb: Fix use-after-free in vxlan_mdb_remote_src_del()
    9be61da9d7c40 net: amd-xgbe: discard rx packets with bad FCS
    0370abbc75b91 raw: annotate disconnect-side IPv4 match writers
    3be02999ab913 sctp: fix soft lockup from unpadded ASCONF-ACK parameter iteration
    b66b9df8e6515 smb: client: transport: Fix debug printing in __release_mid()
    75e85379a08ae smb/client: fix integer truncation in collapse range
    50c4f40a221ef smb/client: fix data corruption in emulated insert range
    716dc2b391de9 smb: move copychunk definitions to common/smb2pdu.h
    430d0f002ce98 smb/client: mark file sparse before emulating insert range
    06a4f9049cb6d smb/client: validate new EOF for zero range
    bc7602b9082ef smb/client: validate new EOF for insert range
    06a7073b33b8f scsi: mpi3mr: Fix target device refcount leak in mpi3mr_sas_port_add()
    2f69ed909de9e scsi: mpi3mr: Fix NULL pointer dereference in mpi3mr_sas_port_add()
    00b841bac1023 sctp: fix a TOCTOU race in SCTP_CMD_TIMER_START
    10b5483278c18 net/sched: act_api: fix skb sizing and action leak on reoffload delete
    fe2bec63fa999 net/sched: act_api: size the RTM_GETACTION reply from the actions
    bbdc058b971f9 net/sched: act_api: budget all shared attributes in notify skbs
    e4a5b01e59f71 net: iptunnel: fix stale transport header during tunnel decapsulation
    c6bdc97ffd65c tcp: use GFP_ATOMIC in tcp_send_active_reset()
    04c0d35bac512 net: icmp: avoid invalid transport header access in icmp_send tracepoint
    26bd90c886218 drm/cirrus-qemu: Validate BAR0 size during probe
    f8dcbbf843d2b ufs: do not treat unreadable directory blocks as empty
    93fa3e925b15b accel/amdxdna: Remove __counted_by from struct amdxdna_cmd_chain
    b2cd682324b88 drm/gud: validate GUD_ROTATION_0 is present in supported rotations
    d623a4a58bb23 bpf: Fix REG INVARIANTS VIOLATION on speculative pointer arithmetic
    13cf95d19e84b selftests/cgroup: Fix cg_run_in_subcgroups ignoring arg parameter
    a204cfe4c8290 sched_ext: Fix nonexistent field in sched-ext.rst example
    4f7cf573cdf0e nvmet-rdma: fix queue leak when connect backlog is exceeded
    cf3e706963ffb nvme-rdma: fix -EIO cleanup order in queue_rq
    12deeade460d4 accel/qaic: Address potential out-of-bounds read in resp_worker()
    93c557e947ef0 drm/virtio: use the DMA API for resource backing on Xen
    45dc2788a5b0e drm/virtio: Fix a NULL vs ERR_PTR() bug in virtio_gpu_user_framebuffer_create()
    528052af901d6 EDAC/device_sysfs: Use kstrtouint() for poll_msec to prevent truncation
    6890f18448f9f EDAC/igen6: Fix channel address decode for non-hash mode
    f6e326963e9d3 EDAC/igen6: Fix channel selection hash
    c9ebaf08e2f58 EDAC/igen6: Fix interleave boundary condition
    fda123f9e7c17 RAS/AMD/ATL, EDAC/amd64: Only load ATL when needed
    8ee846bd854ee ARM: ensure interrupts are enabled in __do_user_fault()
    8a98ed4f7b706 ARM: 9484/1: enable interrupts when unhandled user faults are triggered
    9811e2c321f77 rtc: cmos: Use platform_get_irq_optional() in cmos_platform_probe()
    fe198b077864f af_unix: Unlink scc_entry in unix_del_edge().
    8c4fde01bcf91 l2tp: fix tunnel and session refcount leak on seq_file release
    a386c83043015 ksmbd: use memcmp() to compare ClientGUIDs
    6dd3701facc0c wifi: ath11k: cancel SSR work items during PCI shutdown
    96f5b92d958bc ASoC: meson: aiu: Validate written enum values
    5c2537cf24d67 ASoC: topology: Check PCM and DAI name strings before use
    bea03e887db5a ipv4: fib: Don't dump dying fib_info in fib_leaf_notify().
    4c03275bc4435 bnxt: fix head underflow on XDP head-grow
    a9f1395028c2b bpf: Guard __get_user acesss with access_ok for uprobe_multi data
    f956477c343aa RDMA/bnxt_re: Proper rollback if the ioremap fails
    706591cccdd3a RDMA/irdma: Replace waitqueue and flag with completion
    09c44549820df coresight: platform: defer connection counter increment until alloc succeeds
    11b35d1906a72 md/raid10: fix writes_pending and barrier reference leaks on discard failures
    1cae40d423a20 sctp: fix err_chunk memory leaks in INIT handling
    b96cb1235fcaa bpf: Mask pseudo pointer values in verifier logs
    4cca4b44e561a netfs: Fix barriering when walking subrequest list
    5e53e285f8c98 Bluetooth: ISO: fix malformed ISO_END/CONT handling
    aafb093adffad bpf: Reject redirect helpers without a bpf_net_context
    708688ec31ac6 drm/vc4: hvs/v3d: Fix null dereference in unbind
    7364014fdc289 tipc: fix integer overflow in tipc_recvmsg() and tipc_recvstream()
    89178ffe5bddc net: drop_monitor: fix info leak in NET_DM_ATTR_PAYLOAD
    925669d4cfd47 drop_monitor: fix size calculations for 64-bit attributes
    7d857cf5f0120 drop_monitor: perform u64_stats updates under IRQ-disabled section
    0c53eb14975f0 ppp_async: drop the errored frame instead of resetting its headroom
    f60cd3867cb6d Bluetooth: btrtl: Add the support for RTL8761CUV
    cb64f655c5f85 leds: st1202: Validate pattern input before stopping the sequence
    4400aa20fe932 wifi: mt76: mt7921: skip unknown CLC firmware records
    3896be051e928 wifi: mt76: mt7921: validate CLC firmware records
    e15b21a10d57d iommu/arm-smmu-v3: Disable implementations during devm teardown
    a15cae16f4432 ksmbd: remove stale channels from all sessions on teardown
    bac4120fd8152 bpftool: Strip all -Wformat* flags from bootstrap libbpf build
    dc20050b6b12c netfilter: nfnetlink_log: wait for rcu grace period before freeing pernet state
    bb462621968ea ASoC: amd: yc: Add DMI quirk for HyperX OMEN Gaming Laptop 16-ap1xxx
    dc9e1b6b9080d scsi: core: Do not block on tag allocation in scsi_eh_lock_door()
    daa0eae8c858f ASoC: rt5645: Perform the initial jack detect at probe
    cd60b758dba6a spi: dw: fix wrong RX_SAMPLE_DLY setting after resume
    985250453b772 ata: libata-core: Disable LPM on WDC WD141KFGX-68FH9N0
    f7750422ebc06 hwmon: (corsair-psu) Fix linear11 calculation
    6c1b802e36b05 vhost-scsi: flush backend after device ioctls
    dfad7293b9005 ASoC: amd: yc: Add DMI quirk for HP Victus Laptop 16-e1xxx
    ceb19f46e4758 Drivers: hv: vmbus: add VTL2 redirect connection ID
    23d478fd5ab45 ata: libata-core: Disable LPM on WD Green 2.5 480GB
    4e4de08510cd8 ALSA: hda/realtek: Add mute LED quirk for HP Victus 16-e0xxx (MB 88ED)
    def08a5290092 ata: libata-core: Disable LPM on some WD drives
    5144ddfb71c18 ALSA: usb-audio: Add quirk for Corsair Virtuoso (later revision)
    bbc310caa2b6b Bluetooth: RFCOMM: validate skb length in rfcomm_recv_frame
    01cc395cecfaa wifi: cfg80211: validate IEs in cfg80211_wext_siwgenie()
    8b12f65d7caf1 cifs: validate idmap key payload length
    d1148f03edead powerpc/pseries: Ensure vpa,slb_shadow & dtl are unregistered during crash
    ca9b1ac1bb990 ice: pass the return value of skb_checksum_help()
    45f25ac3e3175 ALSA: hda/realtek: Add mute LED quirk for HP Laptop 14s-dr1xxx
    0fbfc59f7a710 ALSA: usb-audio: Add dB map quirk for Razer Barracuda X 2.4
    9f0243ca8e256 phonet: check register_netdevice_notifier() error in phonet_device_init()
    c268df0653ab0 drm/gma500: return errors from Oaktrail HDMI I2C reads
    0093909becbda ksmbd: preserve VFS inherited POSIX ACL mask
    13edd8ea7ff2c wifi: mac80211_hwsim: reject undersized HWSIM_ATTR_TX_INFO
    7d984d68150a0 regulator: core: clamp voltage constraints before applying apply_uV
    03003506c86f9 smb: client: bound dirent name against end of SMB response in cifs_filldir
    dfbb9db16497e wifi: mwifiex: replace one-element arrays with flexible array members
    0ba8608dd2d84 ALSA: hda/realtek: Add HDA_CODEC_QUIRK for Samsung 750XBE/730XBE
    346a558491241 wifi: iwlwifi: acpi: validate WGDS table revision index
    042d21f6db334 ALSA: usb-audio: Add FIXED_RATE quirk for JBL Quantum650 Wireless
    7aa9097623afb wifi: iwlwifi: bound aligned TLV advance in FW parser
    414560cd623d0 ALSA: hda/realtek: Add quirk for HP Pavilion x360
    52c4c623474df drm/amd/pm/si: Don't schedule thermal work when queue isn't initialized
    a21bf9cb89312 arm64: kprobes: Allow reentering kprobes while single-stepping
    e8ac5e91b1296 wifi: iwlwifi: mvm: fix out-of-bounds tid_data access in BA notif
    59f64c2839022 wifi: iwlwifi: mvm: add a check on the tid coming from the firmware
    3967499c6ed8e arm64: fixmap: Allow 256K early_ioremap() at any offset
    83f32942a501c wifi: iwlwifi: mvm: fix a possible underflow
    4d942dfc13aec wifi: iwlwifi: mvm: validate TX_CMD response layout
    898e74a9115e9 ASoC: Intel: sof_sdw: Add quirks for new Dell laptops
    39562a56cdb51 smb/client: flush dirty data before punching a hole
    4c0d150fb98ea blk-cgroup: fix leaks and online flag on radix_tree_insert failure
    d16e1dcb260fd ALSA: hda/realtek: Add quirk for HP EliteBook 830 G8 (8AB8) to enable mute LEDs
    3456c5bcc987a wifi: iwlwifi: pcie: null RX pointers after free
    0a63f98e5163a wifi: iwlwifi: mvm: fix sched scan IE sizing
    fa7249d1f3249 wifi: iwlwifi: mvm: parse beacon notif per layout
    4d60332387336 wifi: iwlwifi: mvm: fix an off-by-1 boundary check
    cad3665dee627 wifi: iwlwifi: mvm: validate mac_link_id in session protect notif
    63d6b1f04cd91 btrfs: fix reloc root cleanup in merge_reloc_roots()
    e35ae757c6462 wifi: iwlwifi: mvm: validate sta_id in BA window status notif
    61b46ba803b46 spi: dw-dma: Wait for controller idle before completing Tx
    fda1b6636ff18 btrfs: fix use-after-free on reloc root after error in insert_dirty_subvol()
    c7a2dc9aa0760 btrfs: only account delalloc bytes for regular file inodes in btrfs_getattr()
    6e04cc5a30f47 cifs: Fix support for creating SFU fifo
    7cf1d7c23ee55 ALSA: hda: cs35l56: Fail if wmfw file is missing
    749f54ff34084 ALSA: hda/realtek - Add quirk for HP Victus 15-fa0xxx (MB 8A50)
    bf8eab0aa48df ALSA: hda/realtek: Fix speakers on MECHREVO WUJIE Series
    22532dd88694e smb/client: zero-initialize stack-allocated cifs_open_info_data
    54b6a5c615a00 cifs: Fix support for creating SFU socket
    c16dd04955df6 ASoC: rt712-sdca: reset codec at io_init to fix silent headphone
    266f195d5a14e wifi: rsi: validate beacon length before fixed buffer copy
    ca9fab1ca1553 netfilter: ipset: mark the rcu locked areas properly
    c54b643e9a093 wifi: libipw: fix key index receive bound checks
    169e172130eef gpio: dwapb: Mask interrupts at hardware initialization
    b3451e6971248 wifi: mac80211: ibss: wait for in-flight TX on disconnect
    8f4127a93cf60 wifi: cfg80211: validate rx/tx MLME callback frame lengths before access
    2360acb45a8ef ksmbd: validate SID namespace before mapping IDs
    27768ff26c860 ksmbd: mark invalid session responses as signed
    5a5b0b7a01fe1 ksmbd: find bound sessions during reauthentication
    78ac450ad4624 wifi: cfg80211: validate assoc response length before status and IE access
    cdcfd662c6783 wifi: libertas: reject short monitor TX frames
    55b86ef6c2e68 wifi: rsi: avoid reading TKIP MIC keys for non-TKIP ciphers
    9df64ad43e1f2 wifi: mac80211: validate deauth frame length before reason access
    9c8bfc99ef185 wifi: ralink: RT2X00: init EEPROM properly
    74f3c639f64fa ALSA: usb-audio: caiaq: validate EP1 reply lengths
    150afb1941f1a ksmbd: fix credit charge calculation for SMB2 QUERY_INFO
    27d43ad57759c drm/amdgpu: flush pending RCU callbacks on module unload
    b9b79d6e7fa23 ASoC: amd: yc: Add Alienware m15 R7 AMD to DMIC quirk table
    6cc7d711b8d99 netfs: Fix decision whether to disallow write-streaming due to fscache use
    90b306eee037d cachefiles: Fix double fput
    231542f4e43cf xen/gntalloc: validate grant count before allocation
    405f13d7b2709 freevxfs: don't BUG() on unknown typed-extent type
    6cbaea8ab703e xen/front-pgdir-shbuf: free grant reference head on errors
    6e6329322ad73 ksmbd: Fix acl.sd_buf memory leak and invalid sd_size error handling
    4bc2e7259810c ksmbd: fix n.data memory leak in ksmbd_vfs_set_dos_attrib_xattr
    350b966d39f1e drm/arm/komeda: fix error handling for clk_prepare_enable() and callers
    99901c249aedb ALSA: hda/realtek: Add quirk for HP Victus 16-e0xxx (88EE) to enable mute LED
    c521dd78e036b ksmbd: fix sd_ndr.data memory leak in ksmbd_vfs_set_sd_xattr
    a39ecb8565142 netfilter: nf_conntrack_expect: zero at allocation time
    f31c61369f4b1 drm/arm/malidp: use clk_bulk API in runtime PM resume and suspend
    8f75c19892263 btrfs: tree-checker: validate INODE_REF's namelen
    f6a0cafa265c8 spi: core: Abort active target transfer on controller suspend
    ac759ec8fbd8f ASoC: tas2781: Update default register address to TAS2563
    f1e3691195c24 fbdev: pm2fb: unwind WC setup on probe failure
    6b3d24620ed7a ALSA: hda: Add Lenovo Legion 7i 16IAX7 17AA3874 quirk
    95d725736a3d5 eth: mlx5: fix macsec dependency
    5af7d1f55afce rtc: bq32000: add delay between RTC reads
    cbb97fe2053e0 blk-cgroup: protect iterating blkgs with blkcg->lock in blkcg_print_stat()
    fc2233f1ab2a1 net: au1000: move free_irq out of the close-time spinlocked section
    632dadecba13d regulator: da9121: Use subvariant ids in the I2C table
    ef6db657f4bfe PCI/sysfs: Use kstrtobool() to parse the ROM attribute input
    bc544b61889d6 PCI/proc: Fix race between pci_proc_init() and pci_bus_add_device()
    bc4c5f0784ae8 ksmbd: treat read-control opens as stat opens only for leases
    7015f0e5973c9 ksmbd: break RH leases before delete-on-close
    34603ca51c2b3 ksmbd: start file id allocation at 1
    66775ee3c1398 ksmbd: deny renaming directory with open children
    7821c9816cadf ksmbd: apply create security descriptor first
    a5366ea6b1485 ksmbd: treat unnamed DATA stream as base file
    2c777b09e2be3 ksmbd: use connection ClientGUID for lease lookup
    23b8be9aab0b8 ksmbd: align SMB2 oplock break ack handling
    7410f21f01e38 ksmbd: validate SMB2 lease create contexts
    fba4653a0b4dc ksmbd: fix lease break and ack state handling
    80d99549bb59e rtc: aspeed: add AST2700 compatible
    85a3b2c632cab rtc: mv: add suspend/resume support for wakeup
    7caa8a0ae94b1 f2fs: validate inline dentry name lengths before conversion
    7510513be24d8 ALSA: hda/realtek: Add quirk for Lenovo Yoga 7 16IAP7
    cc8eb1715673d md/raid5: let stripe batch bm_seq comparison wrap-safe
    25c1debf4dc8e mailbox: imx: use devm_of_platform_populate()
    944d8509c2220 mailbox: imx: Add a channel shutdown field
    a5e9a81e7e477 md/raid5: account discard IO
    adcaa21d50c3a mailbox: imx: Use devm_pm_runtime_enable()
    6f1853b2b9f38 perf: Fix addr_filter_ranges lifetime
    cb78a1d7a2787 PCI: plda: Protect root bus removal with rescan lock
    a568939487dcb PCI: mediatek: Protect root bus removal with rescan lock
    9b19201f57d87 PCI: rockchip: Protect root bus removal with rescan lock
    7cbb8f2750d91 PCI: altera: Protect root bus removal with rescan lock
    ee06aafc2d760 PCI: iproc: Protect root bus removal with rescan lock
    c6c290e408fe3 drm/amdkfd: Properly acquire queue buffers in CRIU restore
    7a3b9c73ec965 ALSA: usb-audio: Add quirk for YAMAHA CDS3000
    34c20c79e2a4d drm/amdgpu: Use system unbound workqueue for soft IH ring
    a7a2333f45b15 drm/amdkfd: check find_first_zero_bit before __set_bit on kfd->doorbell_bitmap
    2d9fd0f01550a drm/amdkfd: Let driver decide buffer size at AMDKFD_IOC_GET_DMABUF_INFO ioctl
    8c09528b9ea61 mfd: rsmu: Add 8a34002 support
    f27b4f6b0fb1b leds: trigger: gpio: Use GPIOD_FLAGS_BIT_NONEXCLUSIVE
    f71b6f970a2c4 mfd: tps65219: Make poweroff handler conditional on system-power-controller
    80141441dcef6 leds: pca9532: Don't stop blinking for non-zero brightness
    1cf3b01582e92 leds: uleds: Return -EFAULT on copy_to_user() failure
    641161f2c48db ALSA: hda/conexant: Add pin config quirk for Lenovo IdeaPad Slim 5 16AKP10
    a08e780b6cc11 tls: reject the combination of TLS and sockmap
    e8d895eb54838 ALSA: usb-audio: Add quirk flags for SC13A
    72cc9c6d6fba5 spi: Add NULL check for spi_get_device_id() in spi_get_device_match_data()
    2c9a956278ceb gpio: pisosr: Read "ngpios" as u32
    da2d1a61fea8e scsi: bfa: Reduce kernel stack usage in bfa_fcs_lport_fdmi_build_portattr_block()
    37ad4cd204de8 fuse: set ff->flock only on success
    3303398cc2aa2 HID: hidpp: fix potential UAF in hidpp_connect_event()
    20ef4739b329b virtio-fs: avoid double-free on failed queue setup
    0933634b4a690 ALSA: hda/realtek: Add quirk for Lenovo Xiaoxin 14 GT
    2cc0b61234363 exfat: fix handling of damaged volume in exfat_create_upcase_table()
    a2adb52cf6440 sparc: Disable compat support with LLD
    b1cbbde23215d bpftool: Pass host flags to bootstrap libbpf
    35a83ea4b7094 i3c: mipi-i3c-hci: Tolerate i3c_master_add_i3c_dev_locked() failures in DAA
    0eee1e6cddd1d smb: client: fix races in cifsd thread creation
    e7f217bc66412 net/sched: act_csum: don't mangle UDP tunnel GSO packets
    0de429ddd5254 apparmor: propagate -ENOMEM correctly in unpack_table
    45757484d1d28 net: hns3: improve the unused_tuple parameter setting
    6a3f7fb3e15ca e1000e: limit endianness conversion to boundary words
    d6e12544ddb07 vsock: use sk_acceptq_is_full() helper in all transports
    1ae3c612a2729 ptp: ocp: add shutdown callback
    87e2826ed2058 net: stmmac: xgmac2: disable RBUE in default RX interrupt mask
    a17fce56882e9 sparc64: uprobes: add missing break
    b85ef6483d5b3 Bluetooth: btusb: Add Realtek RTL8922AE VID/PID 0bda/d923
    adb5b79b2cae7 ASoC: rockchip: spdif: Restore regcache cache-only mode on sync failure
    131b18787f2d2 ASoC: rockchip: rockchip_pdm: Reorder clock enable sequence
    b2b5c2ca5a492 ASoC: rockchip: rockchip_pdm: Handle runtime PM resume failures in set_fmt
    1280db765ca87 Bluetooth: btintel_pcie: Add 50 ms delay before MAC init on BlazarIW
    ae69dca122f6d Bluetooth: L2CAP: validate connectionless PSM length
    a14ad2929f56b Bluetooth: btusb: Add support for TP-Link TL-UB250
    4eb5a1ed6e1bf Bluetooth: btusb: MT7925: Add VID/PID 0e8d/8c38
    a1fd0b931c74c Bluetooth: btmtk: Disable remote wakeup for MT7922/MT7925
    0f7f58ea62969 Bluetooth: btusb: Add Mercusys MA530 for Realtek RTL8761BUV
    e80184cf72740 Bluetooth: btusb: Add Realtek RTL8922AE VID/PID 0bda/d922
    d40f3b5eb9f31 Bluetooth: btusb: Add support for Intel Lizard Peak 2 (0x8087:0x0040)
    c305c37da249d Bluetooth: btusb: MT7922: Add VID/PID 0e8d/223c
    0f15f3036d010 spi: xilinx: let transfers timeout in case of no IRQ
    c9cebac673596 hwmon: (pmbus/lm25066) Fix PMBus coefficients for LM5064/5066/5066i
    626e080d297db dmaengine: dw-axi-dmac: fix PM for system sleep and channel alloc
    7e0e7cd4364af dmaengine: altera-msgdma: Use memcpy_toio for descriptor FIFO writes
    0d72270b5e7e6 PCI: Avoid SBR for Qualcomm WCN6855/WCN7850 WiFi, SDX62/SDX65 modems
    b199c6d13261c hwmon: (dell-smm) Add Dell Latitude 7530 to fan control whitelist
    fcd72403e65fd HID: multitouch: Honor ContactCount for Yoga Book 9 to suppress ghost contacts
    a20ff930866d7 sctp: Unwind address notifier registration on failure
    dd39064d2948b nvme-fc: Do not cancel requests in io target before it is initialized
    d3f35b584b09b platform/x86: intel-hid: Add HP ProBook x360 440 G1 to button_array_table
    0a45107c416d0 ata: libata-pmp: add JMicron JMS562 quirk
    489b23e15a828 ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7 14IRH8
    1afbf16dc3da7 ALSA: hda/realtek: Add quirk for HP 255 15.6 inch G9 Notebook PC
    ebed7211ba7ad vdpa/octeon_ep: Use 4 bytes for mailbox signature
    e70d47fba6575 vdpa/ifcvf: handle dev_set_name() failure in ifcvf_vdpa_dev_add()
    b5a6462f46466 net: lan966x: restore RX state on reload failure
    a726cc53424a6 net: dsa: qca8k: Add support for force mode for fixed link topology
    30ec6e0c97a88 btrfs: use lockless read in nr_cached_objects shrinker callback
    991ed1e019bc2 btrfs: use on-disk uuid for s_uuid in temp_fsid mounts
    89288dc01c7cf hwmon: (adt7462) Add of_match_table to support devicetree
    78d830dd0cc07 hwmon: (raspberrypi) Fix delayed-work teardown race
    41dee2dc83479 PCI: Avoid FLR for MediaTek MT7925 WiFi
    8e536d8624cde fbcon: don't suspend/resume when vc is graphics mode
    80cd97c5e9009 btrfs: protect sb_write_pointer() with invalidate lock
    fe8e6c0a2f28b netconsole: take target_cleanup_list_lock in drop_netconsole_target()
    7d177cad4df5c wifi: mt76: transform aspm_conf for pci_disable_link_state
    9d38a188fa1aa wifi: mt76: mt7925: add 320MHz bandwidth to bss_rlm_tlv
    cfde1b6d67a7f wifi: mt76: mt7925: populate EHT 320MHz MCS map in sta_rec
    cde306add3bf9 wifi: mt76: mt7925: add Netgear A8500 USB device ID
    67b05e2d22ad6 platform/x86: msi-ec: Add support for MSI Pulse GL66 12th Gen
    26c4e981525b9 wifi: mt76: mt7925: handle 320MHz bandwidth in RXV and TXS
    d1017cf3c4716 platform/x86: dell-laptop: add Inspiron N5110 to touchpad LED quirk table
    6ad679fcddcd3 tls: Flush backlog before waiting for a new record
    c4cb9a728df66 net: ibm: emac: mal: fix potential system hang in mal_remove()
    9eee6b90bee3d pds_core: quiesce DMA before freeing resources
    1b788fa4cf549 configfs_depend_prep(): pass configfs_dirent instead of dentry
    5094ea022e2f8 RDMA/mlx5: Create ODP EQ for non-pinned dmabuf MRs
    f8862e9c74b96 xprtrdma: Add request-pool slack for delayed recycling
    c76e9123ab91a RDMA/rtrs-srv: Fix integer underflow in process_read and process_write
    1094d83ad3258 ASoC: mediatek: mt8365-afe-pcm: fix possible NULL-pointer dereferences in mt8365_afe_suspend()
    d48cf0288f1ae NFS: fix eof updates after NFSv4.2 fallocate/zero-range
    74f577c722c99 btrfs: tree-checker: validate names in ROOT_REF and ROOT_BACKREF
    59f75e0c8724d btrfs: balance: fix potential bg lookup failure in btrfs_may_alloc_data_chunk()
    662b064911dbd riscv: panic if IRQ handler stacks cannot be allocated
    4abc1af7ac209 netfilter: nf_conntrack: use get_unaligned_be32() in tcp_sack()
    d88c24b76f285 ALSA: es18xx: check control allocation before private data setup
    640c1bd8d359a net: microchip: sparx5: clean up PSFP resources on flower setup failure
    24b3f1a9982c1 hsr: broadcast netlink notifications in the device's net namespace
    0a44945b0d342 net: cpsw_new: unregister devlink on port registration failure
    3b2814dd842a5 bpf: NUL-terminate replaced sysctl value
    73fc151ab09ab RDMA/mlx5: Fix state and counter desync on loopback enable failure
    dff6980fe10e2 firmware: stratix10-svc: fix FCS SMC call kernel-doc
    1234db6e41bfe RDMA/umem: Make ib_umem_is_contiguous() safe on 32 bit
    5fc5b73109540 RDMA/umem: Be careful about boundary conditions in ib_umem_find_best_pgsz()
    0c6a4f8a0d437 wifi: nl80211: Increase ie_len size to prevent truncated IEs in new peer notifications
    125ed82d5b596 ipv6: use READ_ONCE() for bindv6only default in inet6_create()
    1b39f46eec2f9 drm/amdkfd: Unwind debug trap enable on copy_to_user failure
    5bb2dfa65d8da drm/amdkfd: fix SMI event cross-process information leak
    8bf884a356865 net: ethtool: cmis_cdb: hold instance lock for ops locked devices
    22814e3504b83 x86/microcode/AMD: Move the no-revision fixup to get_patch_level()
    06322da06116f cxl/region: Validate partition index before array access
    eeacf99090288 ipmi: si: Use platform_get_irq_optional() to retrieve interrupt
    ac2c9384e2b83 perf/x86/intel/uncore: Guard against invalid box control address
    12fb4ff2dda81 ALSA: hda/realtek: Add quirk for ASUS VivoBook X509DAP
    c92611b4ea97c ALSA: hda/realtek: ALC882: Fixup for Clevo P775TM1
    e5f28e0bed589 clk: keystone: don't cache clock rate
    3d177f46ce3de net: ibm: emac: fix unchecked platform_get_irq return value
    489d7ec35bd8b net/mlx5: E-Switch, align disable sequence with switchdev-to-legacy transition
    001824103f2fe drm/amdgpu/ras: add ras_suspend callback and use it for cp_ecc_error_irq
    d572215973e60 RDMA/irdma: Fix typo in SQ completions generation
    c8f268e7d6c73 net/mlx5e: Verify unique vhca_id count instead of range
    805f11fb10ddb drm/amdgpu: validate RAS EEPROM tbl_size before record count
    29fef371331e8 drm/amdgpu: fix buffer overflow during vBIOS update
    95e13b2519629 drm/amdgpu/pm: fix SmartShift bias sysfs store PM refcount on parse error
    3334985f8b4c7 drm/amd/pm: bound pp_dpm_set_pp_table() memcpy
    4396d74b0c730 drm/amdgpu: harden FRU PIA parsing with bounded helpers
    d98c8032c2994 drm/amdkfd: fix UAF race in destroy_queue_cpsch
    9bde188793a72 drm/amd/display: Check for sharpening case when calculating max vtaps for scaler
    a05e54c1eeaba xhci: Prevent queuing new commands if xhci is inaccessible
    f2463fc246d3c drm/amd/display: Avoid DPMS-on for phantom stream
    388dd5c977782 usb: xhci: remove legacy 'num_trbs_free' tracking
    23078553cee11 usb: xhci: Improve Soft Retries after short transfers
    5983bfe3caa71 wifi: iwlwifi: add support for AX231
    7be2fc679c8f6 wifi: iwlwifi: mvm: fix P2P-Device binding handling
    d4158bc784f4b wifi: iwlwifi: mld: don't WARN on WoWLAN suspend w/o netdetect
    adc126a24ab2b wifi: cfg80211: harden cfg80211_defragment_element()
    47bf1db8ef59e wifi: mac80211: unify link STA removal in vif link removal
    176e9c96326e5 wifi: mac80211: clarify beacon parsing with MBSSID/EMA
    97efd7a41aac0 nvme: validate FDP configuration descriptor sizes
    9ad5697fd344c thermal/drivers/qcom/tsens: Atomic temperature read with hardware-guided retries
    f31c415b539f8 wifi: rtw89: 8851bu: add Mercusys MA60XNB (2c4e:0128)
    6518f87771c88 dpaa2-switch: fix handling of NAPI on the remove path
    abd7511e12b23 net: dsa: sja1105: flower: reject cross-chip redirect
    fa232b4496cb5 dpaa2-switch: fix the error path in dpaa2_switch_rx()
    5adbc4d02d7df dpaa2-switch: rework FDB management on the bridge leave path
    20b8520d1ef99 ALSA: seq: oss: Reject reads that cannot fit the next event
    2e333a2224795 ASoC: codecs: rk3328: Use managed GPIO and clock helpers
    6a8149a20e460 ntfs3: fix out-of-bounds read in ntfs_dir_emit() and hdr_find_e()
    0257e3ea00e19 fs/ntfs3: validate index entry key bounds
    bc8cfef261c99 nvme: refresh multipath head zoned limits from path limits
    407ee19828a7d fs/ntfs3: preserve non-DOS attribute bits in system.dos_attrib
    9299e7d1c7936 powerpc/fadump: Add timeout to RTAS busy-wait loops
    08003cc005c83 iommu/rockchip: disable fetch dte time limit
    e766cc0911cea net: txgbe: fix phylink leak on AML init failure
    9461d11ce1ad3 net: wwan: t7xx: Add delay between MD and SAP suspend
    9d969c98732a4 net: qrtr: fix node refcount leak on ctrl packet alloc failure
    a3b3c69a24bb3 ppc/fadump: invoke kmsg_dump in fadump panic path
    7d976afcb5130 ACPI: PCI: Clear _DEP dependencies after PCI root bridge attach
    d404bb88ca371 ACPI: scan: Honor _DEP for ACPI0016 PCI/CXL host bridge
    f2e291043c37a ata: ahci: fail probe if BAR too small for claimed ports
    9fed6a7806358 wifi: ath12k: Prevent incorrect vif chanctx switch when handling multi-radio contexts
    54c2414359fce ASoC: codecs: pcm3168a: Drop CONFIG_PM-conditional preproc directive
    2738d52a96d93 ASoC: qcom: q6apm: return error code to consumers on failures
    1cec9da75a5b0 ASoC: codecs: pcm3168a: Prevent regulator double-disable in S4
    00738665c875a wifi: ath11k: fix invalid data access in ath11k_dp_rx_h_undecap_nwifi
    cab5bfff2e3ca net: ibm: emac: Reserve VLAN header in MJS limit
    99e6c057f1e52 spi: tegra210-quad: Allocate DMA memory for DMA engine
    4bc0c443d7dfd libbpf: Also reset {insn,data}_cur on realloc failure
    aa3e2c5ce5d5a iio: accel: mma8452: switch to non-devm request_threaded_irq()
    7f845820afaad perf/ftrace: Fix WARNING in __unregister_ftrace_function
    61ede56199da2 iio: light: stk3310: Deal with the ps interrupt issue in PM
    fe63db3544b91 media: qcom: camss: vfe-340: Proper client handling
    d6c51f3e60401 clk: samsung: exynos990: Fix PERIC0/1 USI clock types
    4626eebf35dc9 mmc: renesas_sdhi: Add OF entry for RZ/G2E SoC
    d6787ea5d7a9f tracing: Disable KCOV instrumentation for trace_irqsoff.o
    31250800177ae ARM: tegra: p880: Lower CPU thermal limit
    e38226d308820 mmc: renesas_sdhi: Add OF entry for RZ/G2N SoC
    49ee15b11db63 ARM: tegra: tf600t: Invert accelerometer calibration matrix
    41c72b3d627f5 mmc: davinci: fix mmc_add_host order in probe
    971ba53c11747 soundwire: only handle alert events when the peripheral is attached
    33ca906f79927 gfs2: page poisoning fix
    0300131f0a92d soundwire: dmi-quirks: Disable ghost Realtek devices
    de81bc4f32432 soc/tegra: fuse: Register nvmem lookups at probe
    08dc8e55bd72d libbpf: Add __NR_bpf definition for LoongArch
    ca5f986eb459e drm/nouveau/bios: skip the IFR header if present
    c11edd2975c97 ASoC: Intel: catpt: Complete coredump handling
    4283835e918ea x86/topology: Add missing struct declaration and attribute dependency
    f29267ace0428 drm/nouveau/gsp: add SEC2 to GA100 chip table
    29338bd2e2338 scripts: modpost: detect and report truncated buf_printf() output
    29375e071ea20 host1x: bus: Fix missing ops null check in error teardown
    d5d7c6a3b7152 pinctrl: renesas: rzv2m: Use -ENOTSUPP instead of -EOPNOTSUPP
    c19e9e5493023 net: sfp: add quirk for OEM 2.5G optical modules
    0f35d48ded79d hfs: rework hfsplus_readdir() logic
    4de2cffef5e6b ACPICA: add boundary checks in two places
    d0fb1973f705c ACPICA: Enhance buffer validation in acpi_ut_walk_aml_resources()
    3cbf096a478f4 ACPICA: Fix NULL pointer dereference in acpi_ns_custom_package()
    d15c574022e09 ACPICA: Enhance OEM ID and Table ID validation in acpi_ex_load_table_op()
    21a73528579fc ACPICA: Add validation for node in acpi_ns_build_normalized_path()
    1cac04312b77f ACPICA: Add package limit checks in parser functions
    4c977d57a7846 ACPICA: validate handler object type in two places
    293171dae7230 ACPICA: Improve argument parsing in acpi_ps_get_next_simple_arg()
    b96401812cbfb ACPICA: Fix integer overflow in acpi_ex_opcode_3A_1T_1R() (mid_op)
    a6cd2fc2d5429 ACPICA: Prevent adding invalid references
    9bc0e8c3df689 ACPICA: validate byte_count in acpi_ps_get_next_package_length()
    bc5b2158c7626 ACPICA: add boundary checks in acpi_ps_get_next_field()
    ef5a8d939c1e5 ACPICA: Fix use-after-free in acpi_ds_terminate_control_method()
    5d16f40b019e5 ACPICA: Fix condition check in acpi_ps_parse_loop()
    00814fb7a08ae drm/amd/display: Initialize dsc_caps to 0
    79527ce8d343e drm/amd/pm/si: Fix updating clock limits from power states
    1429524673ac0 drm/dp: Add DSC virtual DPCD quirk for Realtek MST branch device
    971852291bfa8 ALSA: hda: cs35l41: imply SERIAL_MULTI_INSTANTIATE
    916d74343cd60 net: thunderx: fix PTP device ref leak in nicvf_probe()
    a0788aa9875f1 net: napi: Skip last poll when arming gro timer in busy poll
    4df5597c65446 ipv6: addrconf: fix temp address generation after prefix deprecation
    5883aae0a5553 net: hsr: require valid EOT supervision TLV
    eb833b94286d1 ALSA: usb-audio: Add quirk for Novation Mininova
    c8a911b3b07ba irqchip/gic-v4: Don't advertise VLPIs if no ITS is probed
    70c26330a8df9 iio: adc: qcom-spmi-iadc: balance enable_irq_wake() on driver unbind
    83e5973b4164a mips: cps: Assemble jr.hb with an R2 ISA level
    e7d0deecf55db drm/panel: simple: Add AM-1280800W8TZQW-T00H
    0583639ce8d22 genirq/manage: Make NMI cleanup RT safe
    992c60771749d powercap: intel_rapl: Fix memory leak in rapl_add_package_cpuslocked()
    cb2da99604145 wifi: iwlwifi: mld: keep healthy link on EMLSR missed beacon exit
    1b3b7b521041d wifi: iwlwifi: mld: purge async notifications upon nic error
    ed183461c3278 wifi: iwlwifi: mld: disallow puncturing in US/CA for WH
    1412c8714c630 wifi: iwlwifi: pcie: add two LNL PCI IDs
    e960f690a3f64 wifi: iwlwifi: Transition to basic uAPSD with MAC_PM_POWER_TABLE API VER_3
    e59b7cd595735 wifi: iwlwifi: mld: call iwl_mld_free_ap_early_key() for AP only
    043c2c469c2b4 wifi: iwlwifi: pcie: fix ACPI DSM check
    54c811bef719e wifi: iwlwifi: mld: honor BSS_CHANGED_BEACON_ENABLED
    76ad89baf8545 wifi: iwlwifi: fix the access to CNVR TOP registers
    deaeb7be8e6b0 thermal/drivers/tegra/soctherma: Switch to devm cooling device registration
    19fa3e00f7f4f clk: socfpga: agilex: implement l3_main_free_clk
    bffae18ba0488 s390/zcore: Removed unused variables
    b946e246ede90 rds: annotate data-race around rs_seen_congestion
    c4081e49ebe0e rds: filter RDS_INFO_* getsockopt by caller's netns
    9fe33b272d7d0 ALSA: seq: Remove arbitrary prioq insertion limit
    da95cb016812c RDMA/counter: Fix num_counters leak on bind_qp failure in alloc_and_bind()
    607492b1b38e0 netlabel: fix IPv6 unlabeled address add error handling
    295c1b184d01c wifi: rtw89: pci: enable LTR based on pcie control register
    d8156aacfcabb virt: acrn: Fix irqfd use-after-free during eventfd shutdown
    508e28930a161 rcu-tasks: Fix possible boot-time tests failed for the call_rcu_tasks()
    b3674e8c01b36 pwm: mediatek: set mt7628 pwm45_fixup flag to false
    c29bb5acd0cad irqchip/gic-v5: Immediately exec priority drop following activate
    ffb493032c6d3 gpib: Suppress setting END on error from NI_USB dongle
    9c44f41699609 char/nvram: Remove redundant nvram_mutex
    182bec9f9e37a crypto: atmel-sha204a - remove sysfs group before hwrng
    73ea4ec0ec46d driver core: Avoid warning when removing a device while its supplier is unbinding
    5cbab666721d9 tty: serial: 8250: protect against NULL uart->port.dev in register
    a5ff304195ca4 usb: host: add ARCH_AIROHA in XHCI MTK dependency
    4295c58990b7a serial: 8250: fix possible ISR soft lockup
    05171ef065465 usb: gadget: aspeed_udc: avoid past-the-end iterator in dequeue
    45829816ef005 USB: cdc-acm: start bulk-IN polling when ALWAYS_POLL_CTRL is set
    28d78783a871c usb: gadget: goku_udc: avoid NULL deref of dev->driver in INT_USBRESET log
    549672a3fb6b3 usb: core: hcd: fix possible deadlock in rh control transfers
    dacd7c317ba12 usbip: vhci_hcd: fix NULL deref in status_show_vhci
    89097c138061e drm/panel-edp: Add LG LP129WT232166 panel
    9c18399327c32 HID: bpf: Add Huion Inspiroy Frego M button quirk
    9584ab6283721 isofs: handle set_blocksize failures
    fd4d6593c5125 omfs: handle set_blocksize failures
    f27e21cf3c044 hpfs: handle set_blocksize failures
    153374ee67a45 jfs: handle set_blocksize failures
    60f7ccf669882 qnx4: handle set_blocksize failures
    cc30a36f9dd1e minix: handle set_blocksize failures
    ab1d6160d26e6 bfs: handle set_blocksize failures
    e01af5aa64103 affs: handle set_blocksize failures
    78e10082f3e91 ntfs3: handle set_blocksize failures
    28e4a2224c318 befs: handle set_blocksize failures
    23a0b6d6a19b3 spi: dw-mmio: Add ACPI ID LECA0002 for LECARC SoCs
    15fd44bc870cf net/mlx5: Switch vport HCA cap helpers to kvzalloc
    caa51e6da596e net/rds: Don't sleep inside rds_ib_conn_path_shutdown
    7c1e87907b40f net/sched: sch_drr: make cl->quantum lockless
    39679927fa7aa net: bridge: remove stale rcu_barrier() in br_multicast_dev_del()
    c84cdea5684a8 net: usb: qmi_wwan: add MeiG SRM813Q
    fd45359dacb36 nvme-core: align fabrics_q teardown with admin_q in nvme_free_ctrl
    ebd9e64e92f74 bitfield: wire __bf_shf to __builtin_ctzll
    eef9c7072eecf thunderbolt: Verify Router Ready bit is set after router enumeration
    6fb64029457cd wifi: mac80211: don't call ieee80211_handle_reconfig_failure when not needed
    caf8b9216f6de thunderbolt: Increase timeout for Configuration Ready bit
    cb77a50d1114c firmware: arm_scmi: Validate BASE_ERROR_EVENT payload size
    767789a58ae0d firmware: arm_scmi: Validate SENSOR_UPDATE payload size
    8e11ea1401c52 thunderbolt: Verify PCIe adapter in detect state before tunnel setup
    66f0196439aaa thunderbolt: Improve multi-display DisplayPort tunnel allocation
    ef9ea99efae42 thunderbolt: Don't access path config space on Lane 1 adapters in tb_switch_reset_host()
    4b65a3f6ca86d bridge: Add missing READ_ONCE() annotations around FDB destination port
    8f62aa442b202 drm/amdgpu: check and drop invalid bad page records
    054d856ce49f7 drm/amdgpu: avoid integer overflow in VA range check
    f8f0985375c3b drm/amdgpu: Bound GPIO I2C table entry count from VBIOS
    fc84416de710c drm/amdgpu: add first record offset check
    1aa55af304a2d drm/amdgpu: validate and share PSP fw_pri_buf copies via psp_copy_fw
    b1d2b29d3115b drm/amdgpu: cap ATOM command table nesting depth
    a98d0d49757a1 drm/amd/ras: reset CPER ring on corrupt entry size
    4486de65eb5e9 9p: use kvzalloc for readdir buffer
    6d40846b8aa39 drm/imagination: Populate FW common context ID before passing to the FW
    94bb5f46f117f arm64/daifflags: Make local_daif_*() helpers __always_inline
    4953290c71861 arm64: panic from init_IRQ if IRQ handler stacks cannot be allocated
    3e7b07202b35c 9p: invalidate readdir buffer on seek
    2d607646909a5 drm/imagination: Don't timeout job if its fence has been signaled
    ea8bc0ea637a1 iommu: arm-smmu-qcom: Ensure smmu is powered up in set_ttbr0_cfg
    ab909a7ae2728 sched/fair: Reject misfit pulls onto busy SMT siblings on asym-capacity
    08e9e131aa16b drm/amdgpu: use atomic operation to achieve lockless serialization
    7bb22751f72e7 ALSA: usx2y: Drain pending US-428 pipe-4 output commands
    db36881139b67 ALSA: ice1724: Fix blocking open for independent surround PCMs
    70ff472d51f53 ALSA: hda/ca0132: add QUIRK_GENERIC path for Gigabyte GA-Z170X-Gaming G1
    c2c89118c27cb drm/amdkfd: Check bounds on allocate_doorbell
    ec646686613d8 drm/amdkfd: Fix OOB memory exposure in get_wave_state()
    dd2870ca036e1 drm/amdkfd: Check bounds for allocate_sdma_queue restore_sdma_id
    d215e6dbe53b3 PCI: Wait for device readiness after D3hot -> D0uninitialized transition
    a16d9986b7b27 drm/amdgpu/userq: pin mqd and fw object bo to avoid eviction
    2bcae59fa1b60 mailbox: Make mbox_send_message() return error code when tx fails
    b20a70bd6a3d4 iomap: don't make REQ_POLLED imply REQ_NOWAIT
    a078b5165aa7c drm/mediatek: dsi: Add compatible for mt8167-dsi
    14072fc75ee65 coresight: Disable source helpers in coresight_disable_path()
    0f4cb08f30011 coresight: perf: Retrieve path and source from event data
    ef9ba2b334505 RDMA/mlx5: Use QP port when decoding responder CQEs
    c4606e9ba9fde media: imon: Add iMON VFD HID OEM v1.2 key mappings
    f137ae8376901 clk: qcom: clk-rpmh: Make all VRMs optional
    20f46d0077f7a net: airoha: Reserve RX headroom to avoid skb reallocation
    99e7269a91526 crypto: atmel-ecc - add support for atecc608b
    d6fdc93b37118 ASoC: Intel: sof_sdw: append dai type to dai link name unconditionally
    7fb387afd60c5 crypto: ecc - Unbreak the build on arm with CONFIG_KASAN_STACK=y
    5b42cc975a903 scsi: pm8001: Reject non-fatal dump when controller is crashed
    c37923acd67a7 scsi: pm8001: Reject firmware update in fatal error state
    4b569c3cc05b6 clk: samsung: exynos850: mark APM I3C clocks as critical
    c5b3326d12a96 soundwire: intel: Move suspend tracking from trigger to pm suspend
    a76f6e0782743 drivers/of: validate status properties in reconfig state changes
    6b99feda4b85f drivers/of: validate live-tree string properties before string use
    d56cc5a921411 integrity: Check for NULL returned by asymmetric_key_public_key
    f3e0f9c64a855 net: dsa: realtek: rtl8365mb: add support for RTL8367SB
    98e5720afd749 wifi: rtw89: phy: check length before parsing PHY status IE
    7fe2e68675871 HID: multitouch: Fix Yoga Book 9 14IAH10 touchscreen misclassification
    2583d6dcbf500 drm/panel-edp: Add AUO B133HAN06.6 and BOE NV133FHM-N4F V8.0
    05b9953e40d53 bus: mhi: host: pci_generic: Round up nr_irqs to power of two
    82e432c9ebfa1 media: video-i2c: use vb2_video_unregister_device on driver removal
    144f24ec0fc1e media: chips-media: wave5: Add range checks for dec_output_info
    34830acec129d drm/gud: Add RCade Display Adapter VID/PID pair
    f38d02e9f881d net: phy: motorcomm: use device properties for firmware tuning
    3e7a6f5889132 hfsplus: rework hfsplus_readdir() logic
    9e13495e4e3e6 PCI: intel-gw: Enable clock before PHY init
    e1023aac607c9 drm/amd/ras: Fix CPER ring debugfs read overflow
    986b034b0592a pinctrl: mediatek: common-v1: bypass pinctrl GPIO layer in set GPIO direction
    428b031dad390 pinctrl: mediatek: paris: bypass pinctrl GPIO layer in set GPIO direction
    fcec938ce172c drm/amd/display: Fix CRC open failure during active rendering
    546b3d5234846 platform/x86: sel3350-platform: Retain LED state on load and unload
    5b7e151fe9ea9 mmc: davinci: avoid NULL deref of host->data in IRQ handler
    9f67997353caa serial: 8250_port: recognize UPIO_AU
    d4b22fbae7003 genirq/proc: Size interrupt directory names for 10-digit interrupt numbers
    b037c2f7794aa mmc: core: Add validation for host-provided max_segs
    ac96ea0f03781 drm/panel/tdo-tl070wsh30: Use refcounted allocation in place of devm_kzalloc()
    f545ca99785c9 platform/chrome: Resolve kb_wake_angle visibility race
    6efdc212627ce net/mlx5: HWS, Handle destroying table that has a miss table
    7031801eb3281 net/mlx5: HWS, Check if device is down while polling for completion
    c9f1fb5564653 watchdog: lenovo_se10_wdt: Fix use-after-free and resource leak risk
    df4509a4ffb16 watchdog: imx7ulp_wdt: Keep WDOG running until A55 enters WFI on i.MX94
    af2b6638a3dd3 watchdog: lenovo_se10_wdt: Add support for SE10 Gen 2 platform
    b16f07aaad1bd ASoC: ti: omap3pandora: update board check to use DT compatible
    c9f82e7c2a44b phy: qcom: m31-eusb2: Make USB repeater optional
    bafdd6284f1b9 drm/panel-edp: Add BOE NT140WHM-N4T, BOE NT140WHM-T05, BOE NV140FHM-N40
    ed713c88b6bf7 drm/panel-edp: Add AUO B140XTN07.5, AUO B140HAK03.5, AUO B116XTN02.3, AUO B140XTK02.4, AUO B140HAN07.7
    70af8451ceefc net/mlx5: Relax capability check for eswitch query paths
    d8c46c89d2cdb media: qcom: camss: avoid format string warning
    cbf0628c0b7db PCI/sysfs: Add CAP_SYS_ADMIN check to __resource_resize_store()
    64760629b2160 dlm: add usercopy whitelist to dlm_cb cache
    73eecf62219f0 drm/bridge: tc358768: Set pre_enable_prev_first for reverse order
    f22ee3d2ce5b2 clk: renesas: cpg-mssr: Add number of clock cells check
    1931e06034c7d crypto: omap - add omap_des_unregister_algs helper
    028a7f4f3d69e crypto: ixp4xx - fix buffer chain unwind on allocation failure
    d6d4b118c1e37 rtase: Fix flow control configuration
    0a58cb7183638 wifi: mac80211: explicitly disable FTM responder on AP stop
    cb662a328a36a media: em28xx-video: fix missing res_free() on init_usb_xfer failure
    8a630b1037fa9 net: dsa: mv88e6xxx: enable .rmu_disable() for 6320 family
    222b03a6e095f media: v4l2-common: Always register clock with device-specific name
    5f793ee869d0e net: dsa: mv88e6xxx: define .pot_clear() for 6321
    7f626e4a3403e PCI: switchtec: Add Gen6 Device IDs
    a3e749c48fa99 net: dsa: mv88e6xxx: fix number of g1 interrupts for 6320 family
    f3f135c4fac61 media: dm1105: fix missing error check for dma_alloc_coherent
    b2a75ce2af881 drm/panel: Enable GPIOLIB for panels which uses functions from it
    a513f711e0868 drm/amdgpu: Prefer ROM BAR for default VGA device
    223ceba837ad9 drm/amd/display: Find link encoder for flexible DIG mapping cases
    3e6ac4f692c0d thunderbolt: Don't create multiple DMA tunnels on firmware connection manager
    99f019d2e9eb7 thunderbolt: Set tb->root_switch to NULL when domain is stopped
    0a87af3b1e3aa thunderbolt: Keep the domain reference while processing hotplug
    ea60ae6233ca0 thunderbolt: Keep XDomain reference during the lifetime of a service
    0325d017bf435 thunderbolt: Release request if tb_cfg_request() fails in __tb_xdomain_response()
    077fe32114792 thunderbolt: Don't disable lane adapter if XDomain lane bonding isn't possible
    1ca6a345248bf thunderbolt: Avoid reserved fields in path config space for USB4 routers
    7f087f70e020b wifi: mac80211: avoid out-of-bounds access in monitor
    a5a7253924d28 media: platform: cros-ec: Add Kulnex and Moxoe to the match table
    655b925ed1936 s390/cio: Purge based on the cdev's online status
    cc8c940e52da3 net: mana: hardening: Reject zero max_num_queues from MANA_QUERY_VPORT_CONFIG
    b85d356b51c3a media: rc: mceusb: Add support for 04eb:e033
    bb18a346271f8 spi: spi-qcom-qspi: Fix incomplete error handling in runtime PM
    00f16aa8fbaea dm-raid: only requeue bios when dm is suspending
    04cda0b5c4ca3 media: chips-media: wave5: Release m2m_ctx after Instance Removed from List
    072beef6a19f9 media: chips-media: wave5: Fix Reports from Kernel Lock Validator
    87d6911f469c3 soundwire: validate DT compatible before parsing it
    8bdd1ccd055f4 soundwire: intel_auxdevice: Add cs42l43b to wake_capable_list
    7d83f33c0990c bridge: Do not suppress ARP probes and DAD NS unconditionally
    64862b78bb176 firmware: stratix10-svc: change get provision data to async SMC call
    38cc5e49708cf kcsan: Silence -Wmaybe-uninitialized when calling __kcsan_check_access()
    1d9352c31bed4 ASoC: fsl-asoc-card: reduce WM8904 PLL ratio to meet frequency limit
    e9b139c4684ed i3c: master: svc: Prevent IRQ storm from false SLVSTART on NPCM845
    2bef8ba66c622 psp: validate IPv4 header fields in psp_dev_rcv()
    958837ce53484 wifi: rtw89: disable CSI STBC for VHT 160MHz
    a910d2ba69d92 wifi: rtw89: disable HTC field in AP mode
    290d37c09d9c2 wifi: rtw89: suspend DIG when remain-on-channel
    1d1f250432cd8 wifi: rtw88: Add NULL check for chip->edcca_th in rtw_fw_adaptivity_result()
    1583636e0c53d clk: clk-axi-clkgen: Add support versal timings
    7f52d554c4c8a wifi: mac80211: use chandef in ieee80211_get_sta_bw()
    5780fdc944d19 wifi: mac80211: always allow transmitting null-data on TXQs
    e50965c702cfd wifi: nl80211: check link is beaconing for color change
    0d635f0b4a634 wifi: nl80211: reject beacons with bad HE operation
    09aa75bdd7c92 hfsplus: fix issue of direct writes beyond end-of-file
    4cbb2360f4d8c wifi: cfg80211: reject duplicate wiphy cipher suite entries
    2e7a4a7f5ebc4 PCI: Stop setting cached power state to 'unknown' on unbind
    367b14b35a051 tools/nolibc: avoid call to wcslen() in _start_c() inserted by clang
    c33764acee65b tee: optee: Allow MT_NORMAL_TAGGED shared memory
    961b880632101 usb: gadget: udc: skip pullup() if already connected
    2f29f880e98bf ima: return error early if file xattr cannot be changed
    4e28591d08543 pinctrl: renesas: rzg2l: Add SR register cache for PM suspend/resume
    cea5a8ba374ff ALSA: usb-audio: Propagate write errors in generic mixer put callbacks
    8988e30c005d1 pinctrl: renesas: rzg2l: Handle RZ/V2H(P) IOLH configuration in PM cache
    edc70f4510841 iio: adc: rtq6056: add i2c_device_id support
    ce28e0aa23706 driver core: Replace dev->can_match with dev_can_match()
    f5c3144f783f9 drm/xe: Fix null pointer dereference in devcoredump cleanup
    21a50a9373ada gfs2: move quota_init qc iterator increment
    87baeb91c0e1a gpio: usbio: Add ACPI device-id for NVL platforms
    812a766e2b0a8 gfs2: fix quota init duplicate scan
    70d472076ce47 wifi: ath9k: Obtain system GPIOS from descriptors
    7b6b9fc260b1a drm/amd/pm: Check SMUv13.0.6/12 metrics integrity
    db10ba9e7748b drm/panel: jadard-jd9365da-h3: set prepare_prev_first
    c54ef628c74c0 drm/amd/display: Fix DPMS using partially updated pipe context
    b1a5775e90430 drm: renesas: rzg2l_mipi_dsi: Fix deassert/assert of CMN_RSTB signal
    eb94c97199185 drm: rz-du: Ensure correct suspend/resume ordering with VSP
    39a846d1a3a06 drm/xe/guc: Add support for NO_RESPONSE_BUSY in CTB
    803eb90226fad bus: fsl-mc: wait for the MC firmware to complete its boot
    ba03f486672f4 drm/gem: Consider GEM object reclaimable if shrinking fails
    7eeefe23a8196 drm/panel-edp: Add CSW PNB601LS1-2 and LGD LP116WHA-SPB1
    50a7a5aec1aa4 mm/damon/core: avoid infinite kdamond_merge_regions() internal loop
    f2cf7c75d16bd drm/amd/display: Set gpuvm min page size to 4K on dcn35/36

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b57287ec872f4e8ec7fd74b37b09a5b935171078)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/linux-yocto-rt_6.18.bb              |  6 ++---
 .../linux/linux-yocto-tiny_6.18.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index 03487e9f4a2..5db966af1e7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -15,13 +15,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a23529ae3d1aa70979a3399f370638f3086587e3"
-SRCREV_meta ?= "2184786cc3deed04926e1cca6c320ed9314da9da"
+SRCREV_machine ?= "f892d97a3d660b9e7f4dc0618e0737f6e23906a7"
+SRCREV_meta ?= "366edfd67e22da481a7e6beb6386e1f7d19e71cf"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.18.52"
+LINUX_VERSION ?= "6.18.54"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index d2bd34732f9..ef90b3db194 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.18.inc
 
-LINUX_VERSION ?= "6.18.52"
+LINUX_VERSION ?= "6.18.54"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "364c4b44ab2dcc7dfff16076522b62827bcb0e7d"
-SRCREV_meta ?= "2184786cc3deed04926e1cca6c320ed9314da9da"
+SRCREV_machine ?= "8372c22a7d24c8fa15b62e13c1b5524a94caf9dc"
+SRCREV_meta ?= "366edfd67e22da481a7e6beb6386e1f7d19e71cf"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 3008f1751f6..8bf35579cda 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "49ec63d52f864d8cece5c6caa6be446362478003"
-SRCREV_machine:qemuarm64 ?= "364c4b44ab2dcc7dfff16076522b62827bcb0e7d"
-SRCREV_machine:qemuloongarch64 ?= "364c4b44ab2dcc7dfff16076522b62827bcb0e7d"
+SRCREV_machine:qemuarm ?= "16672075f0d625c2a7186a00a0d47b34f8ac1e36"
+SRCREV_machine:qemuarm64 ?= "8372c22a7d24c8fa15b62e13c1b5524a94caf9dc"
+SRCREV_machine:qemuloongarch64 ?= "8372c22a7d24c8fa15b62e13c1b5524a94caf9dc"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "364c4b44ab2dcc7dfff16076522b62827bcb0e7d"
-SRCREV_machine:qemuriscv64 ?= "364c4b44ab2dcc7dfff16076522b62827bcb0e7d"
-SRCREV_machine:qemuriscv32 ?= "364c4b44ab2dcc7dfff16076522b62827bcb0e7d"
-SRCREV_machine:qemux86 ?= "364c4b44ab2dcc7dfff16076522b62827bcb0e7d"
-SRCREV_machine:qemux86-64 ?= "364c4b44ab2dcc7dfff16076522b62827bcb0e7d"
+SRCREV_machine:qemuppc ?= "8372c22a7d24c8fa15b62e13c1b5524a94caf9dc"
+SRCREV_machine:qemuriscv64 ?= "8372c22a7d24c8fa15b62e13c1b5524a94caf9dc"
+SRCREV_machine:qemuriscv32 ?= "8372c22a7d24c8fa15b62e13c1b5524a94caf9dc"
+SRCREV_machine:qemux86 ?= "8372c22a7d24c8fa15b62e13c1b5524a94caf9dc"
+SRCREV_machine:qemux86-64 ?= "8372c22a7d24c8fa15b62e13c1b5524a94caf9dc"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "364c4b44ab2dcc7dfff16076522b62827bcb0e7d"
-SRCREV_meta ?= "2184786cc3deed04926e1cca6c320ed9314da9da"
+SRCREV_machine ?= "8372c22a7d24c8fa15b62e13c1b5524a94caf9dc"
+SRCREV_meta ?= "366edfd67e22da481a7e6beb6386e1f7d19e71cf"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "8f3741e6feb045da5b406df0a80b42a1adfb289b"
+SRCREV_machine:class-devupstream ?= "1b357ecb321392158d507b04672ffee57bfa071d"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.18/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.18.52"
+LINUX_VERSION ?= "6.18.54"
 
 PV = "${LINUX_VERSION}+git"
 

