Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B0ECA6008
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 15:46:39 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48822.1791301594016523311
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 08:46:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rjmhc1fe;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48afe75f055so2699286f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 08:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791301592; x=1791906392; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+FhdI2I+i46UXfnrNPoPsa5T2yE4JpMBeOD1E7rTYlQ=;
        b=rjmhc1feR915LOJFFvKDJ6HOmvtyduaa0IqV5pH4Y2XkDRCKv3RKH6O3kEnj72v8fl
         GZinkC8CDmg8plEk29n2DUQh9wmik85Lq+7cE9uUYY1fAA753jnYTOcWdMWE3KOAhqhE
         lhrBUvhA7KZdjKns5N3+YUpZue9351DRu5lDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301592; x=1791906392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+FhdI2I+i46UXfnrNPoPsa5T2yE4JpMBeOD1E7rTYlQ=;
        b=nLaiJhNW33mYQDzJFSaiSaR50asnq/MCEEwRFy5E7ME5GK9xktLG86VmgkCdeI6lQI
         yvkx/DKaduOcZdbR6mM2nLT7gus0T5IVTcwyywz2bWoSmi0WcI5n+MoUI6sIAEnwXP1w
         EgsYNCC6FjN7aO1bF8R48UAfV329fo43h2DOCSQIB0ZNntgTBaA8w0La4o2VAnAKGz2z
         xHEGuGIcOTB8Tl2hKcT9MwfWMFVJKGJ89+Yk+2g58Ef6Bs739/vA1+J0RQ/XhPXtuOCb
         zcLU9fU8KtaHe7CDuC4dCPlo6SLY4ROJl7V/V+sK11aQykM6TcsxaEJauv/l6RIliNJt
         lMSw==
X-Gm-Message-State: AFq9FYJmrlxGXnx8+mBMLg/MoJGVy6A1Rqk/4QlRRWxo4bW01jSh64eJ
	0Y6T9xyT9CnaRNXGsvglRCDRqlg1yW0Aij26HfV+UVktthlDC+sH0h9K15utbNcG4kRmwnw12gt
	cHTTgDlE=
X-Gm-Gg: AYBFou0TKew+hppQqpJjn+WytC1sFDyC5Rp7GCneklEYxFcU56d8yXzQKqkcizBctxt
	rxXc1vmsBz2+5j/9esvFSEtF/r9Gu0hH082UcuqH8yn9u1DFs/n//oiFDzuhDt/AE6MR/jI4UbC
	C/XdBMCf6eSZwz8W5qk6MAMBb91ADL6x4HYLBSCLURrmOcdChof/IxmiREV3tcnXzurXdxT1Cuf
	MIyf1lKeiDDQbtOtsqRXPPYBD2gSNQWRMXEESZ+PKCsK+cQbo7BxF4+ovVZE+q7nWyvM4xCj+HV
	HO5WiG2rFqrtT4L/Bn2krwyH0FI6UR4m53SvXqhGNcp7uo/ceFXCsSrKXkkYz3zdyrOKpNfwUSm
	kVa4GRtfPXNczXhJV+wm0HmwCRJNGFgLTW/X6FqPoAd+PskH/HwaJMc9zCHVSfHPsyvSggsvO9i
	EiZLEKaC9sYOuNf273lD/wJ4FBUn4QomB3s62n9cNv3Rs6loojJOBTIuX0PTt1acdpz3kfuafMt
	+mHAlJ3vAwzj+KhVy+IhZC2/h+sfS70wipAazOe5rOKMlljZ7vYL6T/QCEsmBZg3MK6YdoIdaqx
	iLYJIkWpyi4LquxW
X-Received: by 2002:a05:6000:2205:b0:48c:4d32:cd07 with SMTP id ffacd0b85a97d-48c6d1b353emr3232123f8f.50.1791301590768;
        Tue, 06 Oct 2026 08:46:30 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3032csm257281f8f.45.2026.10.06.08.46.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:46:30 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 09/19] linux-yocto/7.2: update to v7.2.8
Date: Tue,  6 Oct 2026 17:45:55 +0200
Message-ID: <e35d5a7d03a832a02c6d4b11ad83e3eb259a685c.1791299195.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791299195.git.yoann.congal@smile.fr>
References: <cover.1791299195.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 15:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247299

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/7.2 to the latest korg -stable release that comprises
the following commits:

    9a66fdc0d7fd5 Linux 7.2.8
    070cfdcabe8a9 ksmbd: fix partial normalized name responses
    5612934c255ad drm/amdgpu: restrict BAR0 fallback read to SR-IOV VFs only
    1169fe8c11ca4 drm/ttm: fix swapped-out resources never leaving their bulk_move range
    6971a8a7acf19 ntsync: reject wait ioctls with zero owner
    9a7b2bd590252 drm/amdgpu: Fix GPU PCIe link capability reporting
    95eccb9be68df drm/amdgpu: reduce early full GPU access during SR-IOV init
    085264d580bc9 scsi: fnic: Fix missed link-up when critical IRQ targets offline CPU
    fb6b90807d593 scsi: fnic: Bump up version number
    cb2781062c3c8 scsi: fnic: Make debug logging protocol independent
    7e218f10253a3 fs: fix missed removal of super_fs_objects_eligible()
    cb1848884445c fs/super: skip non-memcg-aware nr_cached_objects in memcg slab shrink
    eac6917a42899 smb: client: fix missing iov bounds check in parse_posix_sids()
    f03178db2c260 smb: client: fix missing lower-bound check on DFS referral string offsets
    282b72f9a7ef3 smb: client: fix server->total_read for compound encrypted PDUs
    8dc5db3a0e583 smb: client: fix reparse buffer bounds in cifs_query_reparse_point()
    dbe452a905dfe smb: client: fix potential OOB read in smb3_enum_snapshots()
    13efcd37a9b3d smb: client: fix OOB struct field reads in move_smb2_ea_to_cifs()
    858d5ac22cb88 smb: client: fix next_buffer UAF and NextCommand bounds in compound PDUs
    3630dfc729b15 smb: client: fix fattr leaking on wsl_to_fattr() failure
    13e43cf5e47e7 smb: client: fix unaligned access in WSL reparse point parser
    b26a3fcf2f1c2 smb: client: fix smbd_connection leak on cifs_get_tcp_session() error
    1e6be99a50e87 smb: client: reject short Next offsets in parse_server_interfaces()
    ec36b38e65596 smb: client: fix use-after-free of iface in cifs_try_adding_channels()
    c037d6bde3dd5 smb: client: fix rlist race and missing initialization
    73df937d9cb98 smb/client: send lease break ACKs thru correct session for multiuser mounts
    2e5103e11a17c smb: client: cancel reconnect work in clean_demultiplex_info()
    6f5319bbaef2b drm/amdkfd: implement restore_mqd callbacks for GFX12/12.1
    82e1b8299c6da drm/amdkfd: Avoid integer underflow with ffs in EOP ring size calc
    287a34c4d712e drm/amdkfd: Avoid integer underflow in EOP ring size calculation.
    157d3f1db7e7e drm/amdgpu: Skip KFD mapping clear before initialization
    1b63348329e0d drm/amdgpu: hold a runtime PM reference for P2P dma-buf attachments
    a645584c3ccc4 drm/amdgpu: fix rmmio iounmap skipped on device removal
    e89900c441fec drm/sched: Fix virtual runtime race
    713abac5c04cc drm/msm: RCU-free the scheduler-containing ring and VM objects
    ad4fd6cfac9de drm/msm/hdmi_phy: fix runtime PM cleanup on probe failure
    fd25668f96ff6 drm/msm/dpu: clear pending peripheral flush state
    ebc273b45d58a drm/msm/adreno: fix autosuspend cleanup during teardown
    1826bbee68f96 drm/gud: Ignore damage clips in full update mode
    ea57100955c1c drm/gud: fix out-of-bounds write in gud_plane_atomic_check()
    46c223468537a wifi: mac80211: refuse to make a monitor active when it has no queue
    3beddbd569465 wifi: mac80211: avoid out-of-bounds read for empty PREQ elements
    c4ee5685af444 wifi: mac80211: avoid WARN in set_bitrate_mask when sdata not in driver
    4832e202c6b6b wifi: mwifiex: validate action frame fixed fields
    877b61a67d5eb wifi: mwifiex: prevent authentication frame length truncation
    7106ad8b74f50 wifi: mwifiex: validate scan response extents
    46cda9d42f0d6 wifi: mwifiex: bound the pairwise-cipher OUI walk to the IE length
    d82492fd0a3fb wifi: p54: require a full exp_if record in PDR_INTERFACE_LIST
    b0c906107150b wifi: p54: validate curve data length in the calibration curve converters
    14dcf4c3d74c8 wifi: wilc1000: fix RX buffer OOB-write in wilc_wlan_handle_isr_ext()
    6fbe76eb2796d wifi: wilc1000: fix out-of-bounds read in P2P public action frames
    a6bb6ad517a0d wifi: wlcore: release runtime PM ref on regdomain config failure
    c0df0878e9110 wifi: wcn36xx: Fix potential use-after-free in TX ack timer teardown
    8dab6ee020b2c wifi: rsi: fix heap OOB write on key removal
    bb7ae8910cc88 wifi: libipw: reject TKIP frames without a full MIC
    04c837d413dc1 wifi: libertas_tf: fix UAF in lbtf_free_adapter()
    a9176fe666af1 wifi: iwlegacy: fix broadcast stations deallocation
    777cb6bba59e8 wifi: brcmsmac: fix UAF in brcms_free_timer()
    fbc3b55175a11 watchdog: starfive-wdt: Fix runtime PM leak in starfive_wdt_pm_start()
    cbd298c2dcd5d watchdog: sp5100_tco: Fix pci_dev reference leak in sp5100_tco_init()
    0dd78d9d9b546 watchdog: rzv2h: Avoid division by zero
    8a12e049d517d watchdog: rtd119x: Avoid division by zero
    68a7e322a56b6 watchdog: msc313e: Propagate error code in resume()
    57ebb0cb6e6f4 watchdog: msc313e: Fix premature reset during timeout update
    fae3b59f4b71f watchdog: digicolor: Avoid division by zero
    1db134d0d2a51 watchdog: da9063: fix suspend/resume handling of HW_RUNNING watchdog
    89dda34123a7c hwmon: (cgbc-hwmon) Add missing sensors
    1eaf83055f655 hwmon: (cgbc-hwmon) Fix current sensors ID lookup
    62f6df2038eda hwmon: (w83793) release probe data through kref
    583e04e88e75b hwmon: (w83791d) remove fan/pwm 4-5 sysfs group on remove
    b48339b0a5777 hwmon: (pwm-fan) Stop RPM timer before freeing tach data
    b5e6f3477e4de hwmon: (pmbus/tps53679) Select page 0 for single-page TPS53676
    36f9b74bd970c hwmon: (pmbus/tps53679) Fix TPS53676 phase page decoding
    b49f100a15b88 hwmon: (pmbus/core) increase number of phases and add new mask
    9c1e65bc79ff1 hwmon: (hp-wmi-sensors) Fix use-after-free in fungible_show()
    ed0406e490f48 Input: zero ff_effect before compat copy in input_ff_effect_from_user
    942b06a192529 Input: synaptics-rmi4 - fix GPF in suspend and resume when unbound
    6614868f1a781 Input: synaptics - disable InterTouch on ThinkPad T440p (board id 2722)
    12d80e6351556 Input: soc_button_array - check btns_desc->package.count
    74607b440aa3a Input: soc_button_array - fix MS Surface Pro 11 probe failure
    9f0ce5e162eed Input: rmi_smbus - fix out-of-bounds read in rmi_smb_write_block()
    e098a019e9940 Input: i8042 - add quirk for Acer Aspire Go 15 AG15-42P
    d012dc31f9119 Input: hp_sdc - shut down kicker timer on module exit
    3dfe48d5307a1 Input: evdev - zero absinfo before partial copy in EVIOCSABS
    495955feb5775 Input: cyttsp5 - clamp the HID report size before memcpy
    f9be4db0281bb Input: atkbd - skip deactivate for Xiaomi Redmi Book Pro 16 2026
    ccd6b7003cd5c Input: adp5588-keys - cache GPIO state before registering the gpiochip
    be402133d1119 mmc: sdhci_am654: Fallback to DT-provided itap delay on DDR50 tuning failure
    3aaeacf8e995d mmc: sdhci_am654: Clear ITAPDLY on tuning failure
    4e5d765f4582f mmc: sdhci_am654: Reset command and data lines on failed tuning
    d62d03755724b mmc: sdhci_am654: Move tuning_loop to local variable
    3ae80c1fb7de4 mmc: spi: reset bytes_xfered before retrying CRC failures
    22f2d28a92ee9 mmc: sh_mmcif: initialize IRQ-thread mutex before requesting interrupt
    5e142adbbdc54 mmc: sdio_uart: fix xmit_fifo leak when the port table is full
    356b4b3b28a8e mmc: sdhci-of-aspeed: Remove children before releasing SDC resources
    4f2867a29d60d mmc: rtsx_pci_sdmmc: ignore broken write-protect on ThinkPad X260
    e2948c4232209 mmc: mxcmmc: cancel data work and watchdog on remove
    432b98c1f5dae mmc: mmci: Fix use-after-free in busy-timeout work
    45341b341642c mmc: hsq: Fix use-after-free in retry work
    dac0895c20624 mmc: core: Fix OF node reference leak on card add failure
    2a863458828ad mmc: core: Cancel SDIO IRQ work before freeing host
    efe21a5c5bfe2 power: sequencing: fix NULL-pointer dereference in pwrseq_device_register()
    6e571aea60de7 power: sequencing: fix NULL-pointer dereference in pwrseq_unit_new()
    ffa52ec238ea1 power: sequencing: don't call .post_enable() if pwrseq_unit_enable() failed
    835133337c2ce selinux: always fill AVC decision in avc_has_perm_noaudit()
    c2bbb905af229 selinux: recheck intermediate backing files on mprotect()
    ff20d16b2e823 selinux: preserve user SID across nested backing files
    bafeac9ce5d1c IB/hfi1: Fix the PIO_CRED credit-return mmap
    dab8b64fbd9a4 IB/hfi1: Resolve the credit-return buffer through the send context's node
    ced1186fea7c7 IB/mlx4: Fix use-after-free on pkey sysfs registration failure
    657ef16c6a3d2 i2c: imx: disable autosuspend on remove
    f1cc745295bc1 i2c: imx: release DMA channels on probe error
    d45306b574a26 i2c: qcom-cci: fix device_node refcount leak in cci_probe()/cci_remove()
    a57d959271450 i2c: atr: fix dangling adapter pointer on add failure
    5a9d85a2f4ca6 i2c: at91: release DMA channels on remove and probe error
    959c66dc4a915 sched_ext: Close the pre-enable ops error claim window
    589f0945bf3eb sched_ext: Fix NULL sched deref in kfunc sub-sched error paths
    134825dfc971f KEYS: trusted: Fix tpm2_load_cmd() boundary check
    60f3811119374 keys: translate request_key_auth pid for the reading procfs instance
    cca38f2102a4c KEYS: encrypted: fix integer overflow of datablob_len
    77c0fade37c80 mm: filemap: retain mapped dropbehind folios
    8fdc521d438fb mm/vma: correctly unaccount on mmap_prepare() failure
    469c12a69ab18 mm/shrinker: fix bogus set_shrinker_bit() with cgroup.memory=nokmem
    d9d3ed93d792f mm/mremap: account mm->locked_vm correctly for MREMAP_DONTUNMAP
    5f3f71941c3a0 mm/mlock: use the IRQ-safe accessor for NR_MLOCK in __munlock_folio()
    244185c31b9a3 mm/huge_memory: bypass THP tuneables for huge pfnmap mappings
    7c0d0d6de4607 mm, swap: fix SWAP_USAGE_OFFLIST_BIT collision with real usage count
    f222bb8c30cf5 memstick: ms_block: destroy io_queue workqueue on removal
    ecc03877b1b05 memcg: avoid charging the root memcg from obj_cgroup_charge_pages()
    3f017c2ca8c31 mips: select CONFIG_WEAK_REORDERING_BEYOND_LLSC from CONFIG_EYEQ
    164313e24cb0f soc: samsung: exynos-pmu: fix use-after-free of interrupt generator node
    537a5ae18b2be xfrm: save input state data before secpath resets
    9b74a47a4cbd0 xfrm: use hlist_del_init_rcu for state_cache and state_cache_input
    84e3783954949 xfrm: serialize state GC with device state flush
    99a6e4a9176da scsi: core: Validate MODE SENSE lengths in scsi_cdl_enable()
    a0ff05906ebca net/packet: avoid truncating TPACKET_V3 private size
    693209a237fc5 net/packet: clear RX owner on VNET header error
    f6547d27ce209 net/sched: hhf: cap hh_flows_limit at change time
    57b477e46ef2d net/sched: act_api: release tail references on DELACTION failure
    7e98216e9da08 net: wwan: mhi_wwan_mbim: check skb_copy_bits() return value
    829fec45122da net: wwan: mhi_wwan_mbim: guard against a cyclic NDP chain
    d28aa2de9654e net: wwan: t7xx: validate the netif index in t7xx_ccmni_recv_skb()
    0ee66c62c4e91 net: phy: mediatek: do not report link and per-speed LED rules together
    161a403c8625e net: lan743x: fix RX checksum use-after-free
    0f6a6beb01c06 net: ip_tunnel: initialize `options_len` before referencing options
    c21f3f7fbfeda ipv6: xfrm: use full sockets in local error paths
    c383815568b6a dma-buf: Split sgl by largest page-aligned chunk
    6b98fd7106d4e dma-buf: Fix silent overflow for phys vec to sgt
    a4db25b8949d6 dma-buf/dma-fence: fix checking signaling bit for timeline and driver name v3
    5b2d92b7b1772 dmaengine: ti: k3-udma-glue: fix NULL dereference in k3_udma_glue_release_rx_chn()
    e2c46d25c13b3 dmaengine: sun6i: fix undefined behaviour in sun6i_dma_tx_status
    9eb91f821db98 dmaengine: sun6i: fix non-atomic read of DMA position registers
    877bfe1b236d4 gpiolib: of: don't mark hog nodes OF_POPULATED before a chip is found
    274c73769bc13 gpiolib: Put fwnode reference on failure
    b1df2997d0cd2 btrfs: clear free space tree creation state on rebuild failure
    5132f05d3c7b3 btrfs: derive f_fsid with dev_t only when temp_fsid is active
    93dd8226e5987 btrfs: fix creation of compressed inline extents that don't save space
    c32490c6d3f3a btrfs: take commit root semaphore when iterating in mark_block_group_to_copy()
    aae553129ff7a Bluetooth: keep dst_type with dst when reusing an LE connection
    1276c2fafd184 Bluetooth: hci_sync: Serialize local codec list cleanup
    12a82819b0cad Bluetooth: hci_codec: validate vendor codec count length
    2e4f594a2baee Bluetooth: eir: validate service data length before reading UUID
    e34ec86ee0247 Bluetooth: btusb: fix NXP IW610 composite device handling
    843ace1d0a39e arm64: percpu: Fix LSE operations on {8,16}-bit types
    39c1cfbe9b1e9 arm64: percpu: Fix this_cpu_and() mask generation
    2f85540c561a4 arm64: percpu: Fix this_cpu_write() casting
    cc32bef6f7fea arm64: dts: socfpga: change access permission from 755 to 644
    e94f9c07ced31 arm64: dts: renesas: r8a779f0: Set UFS lane count
    d3f8f773312af arm64: hibernate: pass HVC_SET_VECTORS args to the resume hvc
    502130544a899 kselftest/arm64: Fix size of thread_data values for pthread_join()
    206f396f46149 net: xfrm: reject unrepresentable espintcp transport headers
    30335038d4e25 nfsd: fix handling of NFSEXP_PNFS in the netlink codepath
    8c9fcc6c33950 openvswitch: avoid reallocating confirmed conntrack labels
    117871cdb8927 RDMA/core: fix refcount bug in iwpm_get_nlmsg_request()
    83610ee5e498f RDMA/ucma: Serialize join and leave on copy_to_user failure
    e06c431afd269 spi: virtio: Use the per-transfer bits per word
    2c9baaf03e9d3 spi: spi-zynqmp-gqspi: stop the controller on shutdown
    bf3e3ba6dd546 spi: fsl-qspi: Reprogram the clock rate when the operation frequency changes
    96bb28b3f28ff soundwire: dmi-quirks: Disable ghost Realtek on Asus GX651AX
    0219b72f5c209 swiotlb: use the adjusted address for the highmem page lookup
    8205ac5ddb42a tcp: exclude old ACKs from tcp fast path
    00e0cb1c29168 x86/microcode/intel: Reject problematic loading on Granite Rapids systems
    c961ce3ac1420 x86/build/64: Prevent native builds from generating EGPR use
    82a15e57ee02b drm/nouveau/gsp/r570: Enable S/R Display workaround in GSP
    1e7f89e7c67c8 drm/nouveau/gsp/r570: Set GcOff = 0 in fbsr
    b66bc6fc7799e drm/nouveau/gsp: Increase delay for magic sleep in r535_gsp_fini()
    db87c5b8957a7 Revert "nouveau/gsp: fix suspend/resume regression on r570 firmware"
    09f78e638768c rust: net: phy: fix off-by-one bit positions in device status accessors
    934bd95f1a640 signal: Prevent exec() race
    7d8c22cb2cb1e rds: ib: use rds_conn_drop() on protocol version mismatch
    4336e3f47d9d5 posix-cpu-timers: Prevent freeing a timer which is queued on the expiry list
    5895cebc8b20d phy: renesas: rcar-gen3-usb2: Avoid long delay in atomic context
    848297e6121e5 PCI: imx6: Move clock enable after core reset assertion
    185cd2f5fe1e3 fs/dax: check zero or empty entry before converting xarray entry
    d602877baf36c exec: Cleanup POSIX timers right after de_thread()
    7a1b27780b113 cifs: Fix server use-after-free in cifs_chan_skip_or_disable()
    cec7cfb57dc6b ata: libahci_platform: Fix device reference leak in ahci_platform_get_resources()
    7912ad8fb5233 ata: libahci: clear PxCLBU and PxFBU for AHCI_HFLAG_32BIT_ONLY
    828938118d6c2 cgroup: Avoid iteration of dying tasks with zero refcount
    a318ee718e744 ASoC: codecs: rt712-sdca-dmic: fix uninitialized stream_config->type
    f070cce7cb361 ALSA: virtio: reset device before deleting virtqueues
    ab77e3f453c5f ALSA: usb-audio: Clamp implicit feedback packet count to URB capacity
    398b21608955c ALSA: core: Fix potential UAF after asynchronous card release
    9cd92e3392bdd 9p: Fix v9fs_issue_write() to update i_size and remote_i_size
    e8c6f660f3525 Input: xpad - fix PDP Marvel Xbox 360 controller
    a3ce17bea1fe2 Input: xpad - add support for Azeron devices
    f55d5503a7394 Input: xpad - add support for Victrix Pro BFG Controller
    797ca8906d424 watchdog: da9062: fix suspend/resume handling of HW_RUNNING watchdog
    feaffce0a4407 hwmon: (hp-wmi-sensors) Improve raw WMI string handling
    0758b77ed24ee hwmon: (gpio-fan) return IRQ_HANDLED from the shared alarm IRQ handler
    39236f046205e Input: eeti_ts - publish the OF module alias
    00fe76665d880 x86/fred: Reconstruct the #GP context for rejected INT instructions
    e4a442da49fff sched/core: Avoid false migration warning for proxy donors
    7fa9a465ae8f0 perf: Fix null pointer access in is_include_guest_event()
    cf8c95d79b546 btrfs: check if there is space for chunk item when validating sys chunk array
    36c68dc909845 btrfs: abort transaction on failure to update inode for hole punching and reflinking
    8fa32e7a21657 drm/amd/display: fix MALL hysteresis timer underflow at high refresh rates
    315c227127154 drm/amdgpu: check ras and obj before dereference
    12929ed66a516 net: skbuff: do not leave stale header offsets after pskb_carve()
    1734c3fc0066e net: mvpp2: prevent buffer overflow in page_pool allocation
    1fe8df0141e2b net: macb: fix ordering around PTP timestamp read
    d8c6a18c05521 x86/kprobes: Fix crash when probing CS CALL instructions
    c8c8c18862337 net: psp: avoid conflicts with skb->decrypted and sk_validate_xmit_skb()
    175683534383b net: stmmac: preserve real_num_tx_queues on mqprio setup failure
    ff8c49b2760a1 net: prevent torn reads in netdev_tc_txq
    c0ad9a0aa8ebe net: stmmac: propagate FPE preemption-class mapping errors
    d4bd670454390 net: ethernet: cortina: Ack RX overrun interrupt correctly
    899650bbf985b net: lock the socket in sock_gettstamp()
    28fb764d670aa eth: fbnic: ring the doorbell if a burst ends in a drop
    c87c82e40824c net: netsec: fix device_node reference leak on phy_np
    d8eb177632dac net: remove WARN_ON_ONCE() from the dev_fill_forward_path() loop check
    3c33b7feadd45 net: pass net_device_path_ctx to dev_fill_forward_path()
    b6a0451b09682 net: pass dst via net_device_path in dev_fill_forward_path()
    17f528ffa7545 net: do not advance stack index from dev_fwd_path()
    bacd72289d34d net/sched: codel: bound the dropping loop per dequeue call
    70561730726b0 ASoC: amd: acp: fix ffs() operator precedence for SoundWire link ID
    255c391c7135d ASoC: amd: acp: refactor codec config count in SOF SoundWire machine driver
    83ce3fb63171e ASoC: sdw_utils: tidyup asoc_sdw_parse_sdw_endpoints()
    b34214b6c962e ASoC: sdw_utils: tidyup .count_sidecar
    0bd12e2ab2059 ASoC: amd: acp: bounds-check SoundWire link ID in machine drivers
    03588d05a105c ASoC: cs-amp-lib: Prevent NULL pointer if efi variable is zero length
    165ab330321f8 ASoC: hdmi-codec: Report a change when the channel status moves
    d9803c64bb1b5 ASoC: ux500: Parenthesize MSP_{RX,TX}_CLKPOL_BIT() arguments
    efa5780b84f06 btrfs: handle lack of space when cleaning up verity items
    571ccbc801aa4 drm/xe/i2c: Disable IRQ on unbind
    eecbafa8cabbc futex: Also allocate private hash on vfork()
    41ed0080181cd Revert "drm/i915/display: Clear SEL_FETCH_PLANE_CTL on plane disable"
    314091243159f powerpc/iommu: Fix the overflow validation in iommu_tce_check_ioba
    fcbff8008b0e0 KVM: PPC: Book3S HV: fix secure device page leak on uv_page_in() failure
    ec2d7a52b3996 KVM: PPC: Book3S HV: fix use-after-free in kvmhv_emulate_tlbie_all_lpid()
    22f313e211d58 netlink: do not free nlk->groups while lockless readers can use it
    ed3ea86db736a net: bridge: vlan: fix bugs caused by switchdev deletion errors
    d09c51ce28e42 net: stmmac: do not overwrite phc_index when no PTP clock is registered
    03b672eba4937 drop_monitor: fix out-of-bounds write in reset_per_cpu_data()
    f4a621946395f drop_monitor: use raw_cpu_ptr() in tracepoint probes
    bda4d9525fb91 drop_monitor: use timer_shutdown_sync() to prevent timer rearming during teardown
    d0d6d65637e12 drop_monitor: synchronize tracepoint unregistration on error path
    30992fe39e655 pppoatm: ensure a writable skb header and linear data
    bcf6013c2b4d7 net: stmmac: fix TSO header length truncation
    be550ee108ad8 af_unix: Unify scc_index when finalising SCC in __unix_walk_scc().
    18174b166547e Bluetooth: RFCOMM: avoid socket lock inversion in listener cleanup
    de4c3c72bcc6e Bluetooth: btintel_pcie: fix off-by-one bounds check in RX submit
    9f74bc9e17a2e Bluetooth: btmtksdio: Fix PM runtime reference leak in shutdown
    5a5cfd8488c97 Bluetooth: btmtksdio, btmtkuart: validate WMT event length before struct access
    805f2ca09d62c Bluetooth: btmtk: fix wrong status for short WMT FUNC_CTRL events
    502c1024f1bcc Bluetooth: ISO: set BT_LISTEN before requesting a BIG sync
    f016daabd4fec Bluetooth: ISO: Fix parent socket leak in iso_conn_ready()
    15754e4ec47ac Bluetooth: hci_qca: Do not write to the serial port after it is closed
    a552b4bc058b3 Bluetooth: put the peer's on-air address on air when we cannot resolve
    82699d1b727ba Bluetooth: coredump: Quiesce dump work on unregister
    c298a61e18029 Bluetooth: btintel_pcie: validate TX skb length in send_sync
    cbb325bc150e8 Bluetooth: hci_core: Fix queuing tx_work after workqueue is drained
    54ccc01012a24 dmaengine: mmp_pdma: fix wrong sg length in mmp_pdma_prep_slave_sg()
    ea06930907de4 ksmbd: keep compound responses on query info errors
    054a35a90c070 ksmbd: fix partial file information responses
    fd8bc313b9ebb ksmbd: return buffer overflow for partial filesystem info
    1c4bb940c3bb4 tcp: do not let tcp_rmem be set below 4096
    56d38839ef0bf tcp: Don't call skb_clone_and_charge_r() for close()d listener in tcp_v6_do_rcv().
    c40ed3e884c8d net: bridge: mst: move switchdev call outside rcu
    c5f73cde72f48 wifi: brcmfmac: fix lost 802.1x TX completion wakeup
    438131e7ae847 net: fddi: skfp: fix NULL deref when setting the MAC address while down
    fda3000147dc9 ipv4: icmp: reject RTN_UNREACHABLE input routes in icmp_route_lookup
    1c23dba51dbf7 sysctl: Check range in proc_dointvec_ms_jiffies_minmax
    906140955c8de net: bcmgenet: restore the hardware filters on open
    97df811a11d4f net: dsa: mxl862xx: disable the stats poll on teardown
    8c16e1ccc082a seg6: set IPSKB_L3SLAVE from IP6SKB_L3SLAVE on IPIP decapsulation
    c59e4a90780f3 drm/msm/dsi: round the byte clock rate after reparenting to the PHY PLL
    0382d1384640d btrfs: tree-checker: print dev extent offset in error message
    be1d5e95ec499 wifi: ath11k: cleanup arsta in ath11k_mac_peer_cleanup_all()
    3db8afba2d210 ALSA: hda: trace PCM open only after assigning a stream
    7f9780df67737 drm/vc4: Use managed KMS polling to fix UAF on unbind
    b7f4d2588b134 drm/xe/shrinker: Take a runtime PM ref before shrinking non-system memory
    bff42b0d1d903 drm/xe/shrinker: Return the freed page count through a parameter
    a6b8b3ce9b487 drm/xe/mmio_gem: Revoke drm_vma_node on xe_mmio_gem destroy
    ec99748122b2b drm/xe/mmio_gem: use write-back mapping for dummy page
    b5849031cfae7 drm/xe/mmio_gem: forbid VMA split
    b808a9af5fd21 wifi: virt_wifi: don't transfer operstate before register
    c99ea7855124c ksmbd: follow SMB2 session expiration semantics
    e8d3bc459112f ksmbd: extend procfs server statistics
    f0d3dba61b365 ksmbd: fix malformed procfs status output
    cdc31537012bc ALSA: 6fire: fix OOB write from device-reported iso length
    d181434549b3d ALSA: usb: 6fire: Avoid embedded URBs
    00a316a7a36f2 gpio: virtuser: skip free_irq when no IRQ is installed
    c692919e8f57a objtool: Validate disassembler headers in libopcodes probe
    d75f640789ad6 Input: trackpoint - fix the inertia attribute name in the ABI document
    022f1cb8f4ee6 spi: spi-qpic-snand: avoid writing QPIC_EBI2_ECC_BUF_CFG register
    65e7668487737 ASoC: soc-pcm: Apply snd_soc_dai_link_ch_map.codec_ch_mask to codec params
    2df594738686f ASoC: Add codec_ch_mask to snd_soc_dai_link_ch_map
    2997440f36a1c ASoC: Rename snd_soc_dai_link_ch_map.ch_mask to cpu_ch_mask
    4483604a4fd66 drm/msm/dp: fix link bandwidth check when wide bus is enabled
    5e97d117b79c3 drm/msm/dp: skip PUSH_IDLE when the link was never enabled
    0b349249d5726 ALSA: pcm: set timer->private_data before registering the PCM timer
    117d19438af57 phy: mediatek: phy-mtk-hdmi-mt8195: Fix TMDS clk bit ratio setting
    f2d482c6ae173 phy: mediatek: phy-mtk-hdmi-mt8195: Fix PLL calc divisor overflow
    c4b0f48ddf7bb ntfs: ignore interrupted inode reads as corruption
    6137d60a03dfb ntfs: propagate folio errors
    742797432e8c9 ntfs: protect runlist updates with the runlist lock
    47aa2ab6391d6 ntfs: account for MFT records added during allocation
    eaa27b0885402 ntfs: repack $MFT/$ATTRIBUTE LIST
    fa4cca0a98046 ntfs: use dynamic MFT tail reservation
    9c8b6eff6e750 ALSA: bcd2000: Fix race between rawmidi and disconnect
    a265524cdd6b2 neighbour: Skip default parms when resumed in neightbl_dump_info().
    001f9b3df58c2 neighbour: Don't render blackhole_netdev via RTM_GETNEIGHTBL.
    8550b50e49b01 neighbour: Enforce min/max to NDTPA_INTERVAL_PROBE_TIME_MS.
    043cb1f7e0ce2 neighbour: Add missing RCU annotation for neightbl_dump_info().
    44cf11a297197 keys: fix lost wakeup when reaping a dead key type
    6913ff607c2bc smb: client: validate absolute native symlink targets before NT fixups
    b9a68a9ccaada drm: Fix drm_pending_vblank_event leak in error path for out_fence_ptr
    62a9d7fc1c7fb arm64: mte: Fix PTRACE_{PEEK,POKE}MTETAGS error documentation
    100887892b1d8 arm64: hibernate: clone only the linear map that exists at runtime
    4e31aa6cf1d6f perf/arm-cmn: Fix wp_dev_sel2 setting for multi-DTM configurations
    d9e6175a3ee48 netfilter: flowtable: hold reference on ct until flow is released
    df80342f4bfc0 netfilter: nf_nat: unregister and release hooks on error
    c8cd6d3463e5d netfilter: nf_tables: fix device name and prefix match in hook lookup
    1c43f5db482f7 netfilter: nft_nat: fully initialise new_addr in netmap setup
    bd6f234e7016f drm/msm/adreno: Fix the skip_gpu parameter description
    cebb1748c3dfb drm/msm: Fix the separate_gpu_kms parameter description
    fd7be7e8b34f7 x86/div64: Fix addition of large constants in mul_u64_add_u64_div_u64()
    e6bdfdf3bcb02 RDMA/siw: Bound fragmented header copies by the remaining length
    9ecd3dcbdf1f3 RDMA/efa: Keep EQ resources alive while IRQ is registered
    cf5520d1c931a RDMA/efa: Keep admin queues alive while IRQ is registered
    bd4f8c894634d dmaengine: xilinx_dma: Fix hardware buffer descriptor chain after cyclic DMA
    1de93785f32b4 dmaengine: pxa: fix double counting of the hw descriptors
    e71fc80d7d38c dmaengine: xilinx_dma: Fix hardware buffer descriptor reuse order
    43b3e8fc153bf scsi: qla2xxx: Fix the ql2xfc2target parameter description
    ae75153f0a9fa scsi: pm80xx: Fix the use_msix, use_tasklet and read_wwn parameter descriptions
    db1ca0ffc56b3 mm: memblock: show all region flags in debugfs
    03d67414bd05b wifi: mac80211: set up the TX info early to fix failure paths
    4a4e3fa77ea36 wifi: mac80211: mesh: release the channel if start fails
    ba5bf83a81e88 wifi: mac80211: mesh: reset the CSA state when leaving
    9d83c08dcce80 wifi: mac80211: add HE 6 GHz capability in the scan elems len
    c68c947e3489a wifi: mac80211: don't access the TSF of a down interface
    15c408bae4f11 wifi: mac80211: don't RCU-dereference the mesh CSA settings we just set
    1cf42768fa082 wifi: mac80211: don't allow link changes when iface is down
    1c0a5c96473b9 wifi: mac80211: require a peer station for TDLS setup confirm
    875835377d8d6 wifi: mac80211: reset the AP_VLAN tailroom counter on ifdown
    c69718519a81e wifi: mac80211: don't allow injecting frames wider than the chanctx
    d7fa45d8123a7 wifi: mac80211_hwsim: don't hand frames to mac80211 while stopping
    b949b27206886 wifi: cfg80211: get the wiphy out of a dying network namespace
    821bab0456dfc wifi: mac80211: unlist vifs when their netdev is unregistered
    739b7bf3942da wifi: cfg80211: undo netns switch if renaming the wiphy fails
    e6660383ebf57 wifi: cfg80211: restore netns_immutable on failures
    0cd452ccaa5c5 wifi: mac80211: only operate on TDLS peers in the TDLS code
    de6f9561db572 wifi: mac80211: reset the LED state when ifup fails
    6eac225f59c1c wifi: mac80211: reset state when starting AP fails
    d222fdc973bb8 wifi: mac80211: abort chanswitch when leaving a mesh
    7aca529c0d8d4 wifi: mac80211: suppress chanctx warning for debugfs reset
    ea3ef2165e475 wifi: mac80211: don't offload TC setup on AP_VLAN interfaces
    23d51c0bc18f2 wifi: mac80211: don't warn when an IBSS has no channel to scan
    58b806f699052 wifi: mac80211: don't start a ROC while scanning
    9580c87b0210d wifi: cfg80211: fix NAN regulatory enforcement
    b0e3f019e461a wifi: cfg80211: ibss: ref BSS entry for joined event
    0aa44982125c8 wifi: cfg80211: don't filter by BSS type when removing stale entries
    332ea1502c46f wifi: cfg80211: only group hidden BSSes with beacon entries
    cf6da29d17994 wifi: cfg80211: don't free driver-owned scan requests
    4aed7e47a10b9 dmaengine: wait for RCU readers before releasing dma_device
    02bd02c585293 dmaengine: fix use-after-free in dma_chan_put() and dma_release_channel()
    77906ac448d2f dmaengine: Fix device kref underflow in dma_chan_put()
    b49a8488a46c6 dma-mapping: don't trace the DMA address when the allocation fails
    d50277d6c193f dma-coherent: report a failed reserved memory assignment
    5a6ecf5e2e524 MIPS: Octeon: apply USB FDT fixups also when USB is modular
    1632b98df4176 mips: econet: fix unmet dependencies for ECONET
    d6dd59a158097 soundwire: cadence_master: wait and cancel cdns->work before clock stop
    65893c8d28f23 wifi: cfg80211: check IP header size in cfg80211_classify8021d()
    7166da84a7fe3 wifi: cfg80211: don't get the radio mask for netdev-less wdevs
    1ff3add37c329 IB/IPoIB: Avoid restoring OPER_UP after multicast flush
    af1b69be19c34 wifi: libipw: reject too-short association responses
    19959fb60228f wifi: libipw: reject too-short beacon and probe responses
    6fba6233e9ca7 wifi: brcmfmac: cyw: pass PMKID to firmware if present
    03d5e4776e8b7 wifi: mwifiex: fix IRQ leak using wrong index in MSI-X error path
    46371442847a7 wifi: virt_wifi: free skb when disconnected
    9f04f9b14416e wifi: mac80211: include TIM bitmap control for buffered S1G mcast traffic
    bea1739bf3e90 dmaengine: sprd: Fix runtime PM reference leak in probe
    b82dfc06d3240 dmaengine: mmp_pdma: fix wrong extended DRCMR base for SpacemiT K3
    bf88ac4867050 RDMA/rtrs-clt: Fix CQ pool leak when connect is interrupted
    6ff94b263d176 RDMA/irdma: Enforce local fence for IB_WR_REG_MR
    74d4085221a7e RDMA/erdma: Use IRQ-safe XArray helpers for QP and CQ tables
    c0d8df85db146 RDMA/mad: Fix receive buffer leak when PKey enforcement fails
    9149e05699f7c RDMA/uverbs: Fix potential leak of resources->collection in flow_resources_alloc()
    dab479a77b655 RDMA/bnxt_re: Avoid exposing umdbr to userspace
    f79cf42ff23f9 RDMA/rtrs: guard against null kobj name
    727bbda37d975 RDMA/bnxt_re: check create_singlethread_workqueue() in DCB setup
    7908fbc597a69 IB/isert: wait for deferred control PDU completions before releasing the connection
    ceecf3f9c322f IB/iser: reject a remote invalidation of an unregistered direction
    92711389ceed5 arm64: dts: renesas: r9a09g087: Switch GBETH TX queue scheduling to WRR
    853306d948125 arm64: dts: renesas: r9a09g077: Switch GBETH TX queue scheduling to WRR
    287437678a708 arm64: dts: renesas: r9a09g047: Switch GBETH TX queue scheduling to WRR
    f2042a2bb43b0 arm64: dts: renesas: r9a09g056: Switch GBETH TX queue scheduling to WRR
    c674261743eea arm64: dts: renesas: r9a09g057: Switch GBETH TX queue scheduling to WRR
    173a9164d901f power: sequencing: Fix build issue with COMPILE_TEST
    426f54f20b79c RDMA/uverbs: Fix mmap_lock/disassociation_lock circular dependency
    5bd42f74ec3b4 RDMA/core: Reject unregistering netdevs in ib_get_eth_speed
    f121721dc631a RDMA/mlx5: Remove warn on missing representor in query_port_speed
    d4fc4e37f8a14 RDMA/rxe: insert mcg into mcg_tree only after rxe_mcast_add() succeeds
    2d6c6f94d3e1c RDMA/rxe: Restore HMM_PFN_WRITE check in ODP write paths
    3988cd49adc31 clk: scpi: register scpi-cpufreq once and clear on failure
    108c46e8dacc4 clk: scpi: bound-check DVFS index in scpi_dvfs_recalc_rate
    cc563a59aded6 firmware: arm_scpi: reject DVFS OPP count above MAX_DVFS_OPPS
    8d85d6bc9c46d xfrm: hold net_device reference under RCU in bundle creation
    3431f525718f6 RDMA/rxe: Fix integer overflow in mr_check_range() leading to OOB access
    4dd7a53f1c5b4 RDMA/rxe: validate access flags before swapping the MR's PD
    bfdc744bf20ae RDMA/siw: Clear association under lock if siw_qp_modify fails in siw_accept
    e4f0d2f6bdc7b ARM: socfpga: select the PL310 erratum 753970 workaround
    3b298e27c3dac arm64: dts: amlogic: t7: fix the pin groups of the vsync PWM
    08194b1c7dfdf arm64: dts: amlogic: t7: khadas-vim4: add the PWM-driven supplies
    6a458c1d6e2ef arm64: dts: amlogic: t7: fix the pin groups of two PWM outputs
    40332d03f6c67 arm64: dts: amlogic: t7: khadas-vim4: allow the SD card to be power cycled
    d8724cb6a2d1d arm64: dts: amlogic: t7: use the real UART pclk
    0d0845ee61c5d esp: downgrade zerocopy managed frags before mutating skb frags
    664fc0941df7c xfrm: add missing rcu_read_lock(), skb_dst_force() and dev_hold() for xfrm_trans_reinject()
    e70f639aee2ff xfrm: fix compat ALLOCSPI request use-after-free
    5b8afb56ccb7c xfrm: iptfs: fix runt reassembly panic from short inner tot_len
    5b31ed6c09411 xfrm: add missing RCU read lock in xfrm_send_migrate_state()
    da56d0ee93d1b xfrm: iptfs: fix stack OOB read in iptfs_skb_reset_frag_walk()
    c43da1dd08cd9 sunvdc: fix -EIO issue due to lack of retries
    1620594720383 selftests/landlock: Add audit test for whiteout object creation
    7c233eabb89ff selftests/landlock: Add tests for whiteout object creation
    bb45f6d4b8906 selftests/landlock: Use an actual chardev for MAKE_CHAR audit test
    f42acb3678424 Linux 7.2.7
    dc054821e639a mptcp: fix bad accounting in __mptcp_subflow_push_pending()
    4c856f3c151a2 mptcp: close race between scheduler and state change
    ce7e4ede01ed3 mptcp: avoid unneeded actions on subflow reset
    2712d052b60c6 mptcp: move the stale logic out of retrans scheduler
    496e2a239cadb x86/mm: Fix and document DEBUG_PAGEALLOC
    c60aab39d8ba8 misc: amd-sbi: Add null check for devm_kasprintf()
    922873cf4fc34 x86/mm/pat: Allocate split page tables as kernel page tables
    706e2bf330144 s390/pai: Support CPU hotplug for PMU PAI
    0fd9fdd7d28b7 s390/pai: Move locking to event init and delete
    62405f69ab0b8 s390/pai: Use PAI PMU index as parameter replacing event
    a1d4d022e1ee5 drm/amd/display: Honor Broadcast RGB for BT.2020 RGB output
    e6d24ae690503 drm/amd/display: Propagate HDMI RGB quantization selectability
    4d8ad6bc8cc5e scsi: qla2xxx: Serialize NVMe unsol ctx list with a per-fcport lock
    c55d649a6cc24 scsi: qla2xxx: Unlink NVMe unsol ctx before freeing on LS reject error
    f75bff451a2fa scsi: qla2xxx: Validate BSG request_len before reading vendor_cmd[]
    76342f971c2a3 scsi: qla2xxx: Clamp max_npiv_vports to VP_CTRL bitmap capacity
    6aa722fca9d2a scsi: qla2xxx: Fix soft lockup polling continuation IOCB signature
    7a83979d92782 scsi: qla2xxx: Skip vport under deletion in report ID acquisition
    94188435020d4 scsi: qla2xxx: Fix 64G link speed reporting in get_data_rate
    286d9594a022d scsi: qla2xxx: Null out freed pointers in qla2x00_mem_alloc() error path
    dc4797c909b6c EDAC/altera: Use parent device for devres in altr_portb_setup()
    cc73b2043d106 x86/mm/pat: Acquire init_mm read lock on attribute changes to avoid UAF
    c76463f41110d x86/mm/pat: Don't gate cpa_lock on debug_pagealloc_enabled()
    dafe2ad3ddfed platform/x86: hp-wmi: Fix board_params typo for 8DD6 board
    50818e0d086f8 platform/x86: hp-wmi: Introduce board-specific feature data
    583a91b1c178e drm/xe/i2c: Fix the interrupt handling
    30ecd5ec1e058 i2c: designware: Global register definitions
    33b00fa8023e8 accel/amdxdna: Disable device buffer exporting
    47501eb6b9894 drm/i915/cdclk: Avoid spurious cdclk sanitization on PTL+
    cc3d3b6a9cb6b f2fs: fix to reset all pinned status during fggc
    8508ea9bc910b f2fs: fix to shrink gc_lock coverage in f2fs_gc_range()
    8a123a10770d2 f2fs: accurately adjust free_sections during free_segment_range
    e41d28d9a242c scsi: qla2xxx: Use memset_io() to clear QLAFX00 request ring slot
    71bbf36cc956a scsi: qla2xxx: Use ring-slot helpers in __qla2x00_alloc_iocbs
    13354ad251ab0 scsi: qla2xxx: Bound VP index against VP_CTRL IOCB bitmap size
    f1f4d1cb93eee scsi: qla2xxx: Fix use-after-free of qpair work on queue teardown
    94fc0c5b45de2 scsi: qla2xxx: Fix queue teardown NULL dma_free and bitmap locking
    7a52e76b63095 media: qcom: iris: fix runtime PM reference leaks
    b141852e65945 media: remove conditional return with no effect
    7fb6ee99bd0e7 hwmon: (asus_rog_ryujin) Synchronize HID command and report handling
    1caa5f9399ff1 hwmon: (asus_rog_ryujin) Validate HID report lengths
    57825d63c51cc hwmon: (asus_rog_ryujin) Add per-device configuration
    ef36230c61ff8 usb: usbtmc: don't store usb_device_id
    f7db611d98b68 usb: xusbatm: don't rely on id table pointer arithmetic
    61b84e964a829 net: usb: pegasus: don't rely on id table pointer arithmetic
    4f9525f96a899 usb: serial: spcp8x5: don't store usb_device_id
    b6cfd26daf236 media: as102: do not rely on id table address comparison
    c34aa59950597 wifi: ath9k_htc: don't store usb_device_id
    98c9ff4644197 ASoC: cs35l56: Fix race between kexec and snd_soc_register_component()
    5074fca9b45b7 xfs: actually check internal-rtdev fields in the superblock
    7eabaebb94412 xfs: actually recover intended file sizes in xfs_xmi_item_recover_intent
    99c669e51c33b xfs: advance the findparent inode scan cursor while holding ILOCK
    f6a331c435fd6 xfs: always set xfs_healthmon::first_event when inserting at front of list
    b5309ae6504e9 xfs: bail out on bitmap errors in xrep_agfl_fill
    72f6a614396e9 xfs: bump lost_prev_errors if we lose even the healthmon lost event
    ca1247567aff2 xfs: check healthmon outbuffer space correctly
    73fc377879dd1 xfs: compute dquot checksum after resetting dd_lsn in repair
    d220e14c17762 xfs: count escaped corruption errors in scrub stats
    8fe78d142ab7c xfs: cross-reference the rtgroup superblock extent, not block
    582f54dce6204 xfs: destroy seen inode bitmap when we fail to add a dirpath
    788c3a46ef9d7 xfs: don't leak dqacct if rhashtable insertion fails
    b19dfd4546088 xfs: don't leak new_bp if xfs_btree_bload_drop_buf fails
    ad72feaa5cbc8 xfs: don't modify file attributes or poke fsnotify for dry runs
    a455c83ce5dc1 xfs: don't spin forever on zero-length dirents when salvaging them
    b73cd6a5fcd7c xfs: don't stash removename operations with unknown ftype
    bbd2300ddc20e xfs: fix backwards mergeability logic in refcount scrubber
    ea3260d91002d xfs: fix backwards skipping logic in xrep_quota_block
    18c310727e303 xfs: fix bnobt repair space reservation disposal failure
    8ae30b9a8c207 xfs: fix exchange-range reflink flag clearing issue with INO1_WRITTEN
    b2d8330e5067d xfs: fix media verification ioctl for internal rt volumes
    8934cbc738403 xfs: fix name string recording in slowpath pptr tracepoints
    5f90096d59b42 xfs: fix parent rec lookup initialization in xrep_metapath_unlink
    9bad46d3ec0fe xfs: fix reclaimed page accounting in xfs_buf_free
    cbbe842f94fa1 xfs: fix replaying dirent removals into the temporary directory
    06c28541e6c8c xfs: fix rtrefcount btree block counting in scrub
    99f38921ed06a xfs: fix rtrmap cross-referencing elision logic
    63a9a2f8d3c29 xfs: fix short ifork reaping computation in xreap_bmapi_binval
    84316cb25af95 xfs: fix the rtrmap and rtrefcount _maxlevels_ondisk functions
    b950e84acd072 xfs: fix under-reservation of blocks when repairing sf directories
    cfeba3bdf4dfa xfs: fix unit conversions in per_binval computation
    de6a0fbfb6357 xfs: fix xfs_rtrmapbt_mem_cursor for non-rmap filesystems
    ac9032882d673 xfs: initialise args->total for parent pointer updates
    6b507c239884f xfs: initialise error in xfs_defer_finish_one()
    d963ce1910bc4 xfs: lock the healthmon when inserting unmount event
    60dd72cd158d0 xfs: log the tempip after we convert it to extents format
    4a3adfe303506 xfs: make the rtsummary repair fix the file size too
    ebedb3b06532d xfs: preserve owner on in-memory btree creation
    ab3c14a9e87bc xfs: release alleged child inode on metapath unlink error
    a70af98621cc4 xfs: report healthy filesystem events in scrub stats
    9fa8cee07b671 xfs: report nonexistent parents as a filesystem corruption
    856763b23d6bd xfs: reset parent pointer args before each dir tree unlink repair
    3a8a5b4db0edb xfs: signal inode btree xref error if get_rec returns an error
    7e38185ae0727 xfs: snapshot old AGFL before rewriting it
    169c7488e8264 xfs: snapshot scrub stats when rendering them
    87ec73be3550a xfs: strengthen the "is cow staging" helpers in scrub
    208b94b8ab727 xfs: truncate quota file correctly when repairing quota file
    60dcfbe0b0685 xfs: use the rtgroup extent count to find rtrefcount gaps
    c9a8b60ce140a smb: client: avoid using uninitialized SIDs in cifs_posix_to_fattr()
    2a9aee9ef5622 smb: client: fix heap overflow in DACL owner/group rewrite
    1d1b0f1d812a4 smb: client: avoid leaking refcount when cifs_sb_tlink() fails
    dfe7b750c7e06 smb: client: avoid leaking refcount in cifs_queue_oplock_break()
    47f772c40fead smb: client: fix file type corruption in wsl_to_fattr()
    b700d02cb2ac5 smb: client: fix file type corruption in posix_reparse_to_fattr()
    fe99108bbf02e smb: client: fix file type corruption in cifs_reparse_point_to_fattr()
    ea93759d6c278 smb: client: fix cifsFileInfo reference leak in deferred close
    ee13d687d06a6 smb: client: fail DACL rewrite when the new DACL exceeds 64K
    2a302fdbaf7dd smb: client: fix one-byte OOB read in smb2_parse_native_symlink()
    e01787e1b64eb smb: client: fix uid/gid override in getattr with posix extensions
    b6e29cd93eecf smb: client: fix WSL reparse point uid/gid override
    e1b74f8f8c1d1 smb: client: honor forceuid/forcegid when mapping SIDs to uid/gid
    5b01a8c020969 smb: client: pin DFS superblock in iterator callback
    667feba13e78d smb: client: reject out-of-bounds DataOffset in CIFSSMBRead()
    1d3b24b16a0b0 smb: client: reject userspace cifs.idmap descriptions
    aaa221c1b1d28 smb: client: reject short READ responses in CIFSSMBRead()
    c31fdbfbe50a7 mptcp: pm: userspace: fix address ID overflow
    652731242f774 mptcp: pm: reset retrans_time when ADD_ADDR entry is reused
    545616b4e7325 mptcp: pm: kernel: drop pending ADD_ADDR when removing ID0
    69a7b2a912672 mptcp: prevent race between disconnect() and rtx
    44cf1e275743f selftests: mptcp: lib: get counters for the right test
    b08cea41bfad2 selftests: mptcp: lib: dump nstat for the right test
    c81cc809174e1 selftests: mptcp: fix an UAF in mptcp_connect.c
    9a682067dd7b9 mptcp: options: fix uninit-value in mptcp_write_data_fin
    06d649f9cd03a mptcp: syncookies: remember the request backup flag
    e173a0c94cf6b mptcp: subflow: no need to copy thmac during ulp_clone
    fe77616c29cac mptcp: options: handle MPC data + csum reqd + no csum
    ff014953977fc mptcp: do not reschedule the RTX timer for fallback sockets
    e33ce547c0cd4 bnxt_en: Prevent queue stop with deferred completions
    05cf64d171772 bnxt_en: Bound SW TPA IDs to prevent crashes
    37e08dc821a57 bnxt_en: Propagate TPA buffer allocation failures in bnxt_queue_mem_alloc()
    dfd73af81cdb9 bnxt_en: Propagate RX ring init failures in bnxt_init_nic()
    8b2fd5c0aeda9 bnxt_en: Handle buffer allocation failure in bnxt_rx_ring_reset()
    0596a7caa6fc2 bnxt_en: Don't free the live ring's TPA state on queue restart failure
    7951e6c893f10 bnxt_en: Only restore LRO if the device supports TPA
    c4c88b5ba8568 media: v4l2-ctrls: validate AV1 tile counts
    ba1023d3a6d5d media: v4l2-ctrls: validate HEVC tile counts
    fd965369220cc media: verisilicon: rockchip: reject AV1 frames exceeding the tile capacity
    6b7a281a815ae media: verisilicon: rockchip: guard VPU981 AV1 divisor and tile buffer
    d45413293e127 media: v4l2-h264: Fix memcmp() size in B1 reference list comparison
    eb0ea3898e392 media: mediatek: vcodec: bound AV1 tile-start copy to the array capacity
    03beb248d8a7b media: rkvdec: bound HEVC tile loops and PPS id to the array capacity
    05e8e4cdfe692 media: verisilicon: hantro: bound G2 HEVC tile loop to the buffer capacity
    3f77f3e10af79 media: ipu-bridge: do not use the CVS device lookup for IVSC
    990a33228320a media: hevc: add bounded tile-count helpers
    6809ebbedbf21 hwmon: (pmbus) Clear generic status alarms with CLEAR_FAULTS
    4951594ff0153 hwmon: (mcp9982) Propagate one-shot polling errors
    c6ab7f8558918 hwmon: (gpio-fan) Fix use-after-free in alarm work
    4bae34c0ead50 hwmon: (chipcap2) fix channels in humidity alarm notifications
    7401f7071c255 hwmon: (applesmc) fix key backlight workqueue leak on register failure
    7f7f5589d0488 afs: Clear stale peer app data after address list changes
    349e713039a1f afs: Fix incorrect free in candidate cleanup in afs_lookup_server()
    b60f51e4ad0f6 afs: Fix double-unmap of directory block
    f57d4728ac549 afs: Fix missing kunmap in afs_dir_search_bucket()
    b598e527a194d perf: RISC-V: use BIT_ULL for u64 overflow masks
    e5481db31f465 perf: RISC-V: store available counter mask as bitmap
    7bed86ac56784 selftests: ublk: install test_common.sh and trace/ scripts
    e267bd142664a s390/crypto: Map EBUSY to EIO when key conversion fails repeatedly
    5480291aa848e s390/crypto: Fix wrong return code to engine in asynch callbacks
    d7159d2132e9a s390/crypto: Fix missing scrub of temp buffers with PAES algorithm
    bcd7f1f1e2f28 s390/crypto: Fix handling of EBUSY in PHMAC when req is pushed to crypto engine
    4e4b9cb77c7f3 s390/crypto: Fix missing cra_flags in paes_s390
    a83488cecb35f s390/crypto: Fix missing scrub of temp buffers with AES ctr and gcm algorithm
    910643fa77655 s390/crypto: Fix use of mutex in atomic context
    aea3e1588f08e s390/crypto: Fix skcipher_walk return code handling in aes_s390
    bdb7a6b24e377 s390/qeth: allow bridgeport queries despite OS_MISMATCH
    41b5e0ce6801b iommu/s390: Fix NULL dereference in iova_to_phys() with ZPCI_TABLE_TYPE_RFX
    ba29c46ccfe3e landlock: Fix use-after-free of the source's parent directory
    83043cb616233 KVM: PPC: Book3S HV: Set irqfd->producer only on success
    3d1fde35f95d7 mac802154: fix use-after-free of sdata via queued RX frames
    0c61f7d8e18a9 ipvs: reject invalid states in connection template sync records
    467467bf4209f ipv6: flowlabel: cap duplicate leases per socket
    2c29c053a6627 ipv4: fib: bound automatic table ID allocation
    db6442deecb1f ieee802154: hwsim: serialize pib updates to fix double-free
    890a80d516a14 ieee802154: cc2520: fix FIFOP work use-after-free
    8528da2333ce0 ieee802154: 6lowpan: fix NULL dereference in lowpan_newlink
    bf3d6c44c84c5 inet: frags: invalidate queues before flushing them
    cd7a1598645b6 idpf: disable DIM work before freeing q_vectors
    3c91e51a53cf8 fbdev: vfb: defer cleanup until the last reference
    38e9e07ac02a9 erofs: preserve LZMA decoders on resize failure
    f355193e8016b erofs: add sysfs feature entry for xattr prefixes
    6259b5d9bdc45 fs: autofs: fix memory leak in autofs_fill_super()
    254d329e94529 scripts/sorttable: Mark long_size as __maybe_unused
    f20d005520d9a vdpa: solidrun: Free IRQs after request failure
    816fd60fea5d5 vdpa: ifcvf: Put device on unsupported feature error
    651032d854d9e netfilter: report NLM_F_DUMP_FILTERED when all is filtered out
    dce24f3a14694 netfilter: nf_log: unregister loggers before per-net teardown
    1f69c570a73f2 netfilter: cttimeout: prevent UAF during module unload
    2e38d500471d0 netfs: Fix uninitialized return value in netfs_unbuffered_write()
    73392fcaf7b3b net: phy: dp83td510: handle the active-high LED polarity mode
    035e9c3722067 net: openvswitch: fix use-after-free of the flow table mask array
    b39120523475d net: mpls: clear inner_protocol when the last label is popped
    6c739cb89ebd6 net: mana: Reserve extra CQ slot for the fence completion CQE
    bb9e77ca5efe2 net: macb: initialize PTP state before registering clock
    fe45a7d7b789f net: hso: fix TIOCMIWAIT race
    3eb5c7e1c154c net: dsa: tag_brcm: legacy FCS: request needed tailroom
    42e033c8f30fd net: bridge: use option bits for CFM/MRP frame handlers
    048617743febf net/sched: act_api: release all action references on NEWACTION failure
    32bf47db9237c ring-buffer: Check resize_disabled before publishing the new subbuf order
    0f3620bc1720e ring-buffer: Acquire the lock with irqsave in rb_wake_up_waiters()
    2e70ea75c7bb3 io_uring/net: don't overconsume buffers when using MSG_TRUNC
    c91c866afa470 io_uring/net: let io_recv_buf_select return the length of the buffer region
    055d43a1233ed io_uring/rw: end write accounting from ->ki_complete
    0fd7f2ba3bac1 drm/amd/display: Rebuild InfoFrames on output color space changes
    10e7920fd5a12 drm/amd/display: Exit IPS before connector detection on resume
    92393fc5227b2 drm/xe: Flush LSC untyped L1 dataport cache after rcs/ccs batches
    a6b0c1d1f83d5 drm/sched: Create a fake device for KUnit tests
    2fcd112caa4eb drm/rockchip: analogix_dp: fix unchecked bound endpoint name length
    59e0a04d95e16 drm/i915: Fix memory leak in query_perf_config_list()
    a565022c02f21 drm/drm_exec: fix up contended obj when num_objects is 0
    94f078b2be152 drm/bridge: ti-sn65dsi83: Fix error handling in sn65dsi83_reset_work()
    691217b10117a drm/bridge: tc358768: Enforce input bus flags via atomic_check
    e56ff2a63f41b drm/amd/pm: fix gpu metrics energy accumulator for smu 13.0.0/13.0.7
    449d615fd1c7c hrtimer: Use hard expiry when updating timers on the same base
    6d8e653fcf1c9 genetlink: pin family module during policy dump
    5894fabba7f3f function_graph: Use the saved entry's size when reprinting it
    ff2a694f6613d fs: don't return -EINVAL for successful nested thaw
    96803a12e8ac1 exit: hold a reference to thread_pid across proc_flush_pid
    63be3d8511bda exec: do_close_on_exec() before taking exec_update_lock
    2cee937f779f6 cpufreq: initialize policy rwsem before sysfs publication
    bbc0472d2270b cpufreq: zero-initialize policy cpumask before sysfs publication
    bff9a1579e2c9 bootconfig: Fix integer overflow in initrd size check
    c4249cf6e80b1 Bluetooth: btrtl: Don't leak return code when parsing firmware format v2
    2d016208a0115 Bluetooth: btqcomsmd: destroy RPMsg endpoints before freeing hci_dev
    a42dd4dae4c91 ASoC: sti: initialize IRQ lock before requesting IRQ
    8064b73997f13 ASoC: sprd: validate compress buffer sizes against fixed allocations
    2ce508def59b4 ASoC: amd: acp-da7219-max98357a: don't bind on Raven/Picasso boards
    bb6f6201c6c88 ata: pata_legacy: remove documentation for removed module parameters
    50c27d412fedc accel: ethosu: Ensure SRAM region size matches job
    e5576641b79ec accel: ethosu: Ensure SRAM size is 0 on mapping failure
    bf957f166f7ba accel: ethosu: Ensure cmd stream ends with a stop op
    63fcf4bba7b5b accel: ethosu: Drop IRQF_SHARED flag
    e98afe5142add accel: ethosu: Fix ethosu_job_open() return value
    3d7130807009e accel/ivpu: Limit firmware log name prints to field size
    b1555f63ee1a6 accel/ivpu: Validate firmware log buffer metadata
    29f82a2280e17 accel/ivpu: Validate full buffer range in ivpu_to_cpu_addr
    bfa6bc11aef93 tracing: Undo the registration when enabling the histogram trigger fails
    91c15cdda6033 tracing: Take the reference before publishing the named histogram trigger
    17e87ce55f877 tracing: Keep the entry count when the histogram stats allocation fails
    90f84dfbc31e4 tracing: Let histogram values keep the percent and graph modifiers
    891c21f6d5673 tracing: Free histogram the field rejected for a bad modifier
    94bbd65da4ae2 tracing: Free histogram var refs regardless of how often they are referenced
    a69baeac38677 tracing: Free histogram the var ref when its initialization fails
    62d6544e86506 tracing/user_events: Don't destroy fields when event removal fails
    495d866e239e1 tools/bootconfig: Fix integer overflow and truncation in size checks
    292b7a8ed8403 tick/broadcast: Plug clockevents replacement race
    a1da7901ed9db tunnels: Drop stale dst when building an ICMP error for PMTUD
    abde9eb331068 ufs: validate cylinder group metadata before caching it
    8173e051a8acb ufs: create the root dentry after loading cylinder metadata
    c0bc47134ff8e virtio_mmio: disable IRQ wake before free_irq
    89ced79cc3f26 watchdog: sunxi_wdt: preserve boot-enabled watchdog
    241d7450cf759 drm/amdgpu: skip the VMID 0 flush for VRAM
    52947c09c41cf drm/amdgpu: skip gfx switch_power_profile during GPU reset
    ab9f92414d052 dm/amdgpu: fix malformed link_settings debugfs output
    2743c5c22939e riscv: hwprobe: initialize pair->value in hwprobe_one_pair()
    c7b2c7aadc4ae Revert "riscv: Reset pmm when PR_TAGGED_ADDR_ENABLE is not set"
    2770321b35865 ALSA: usbusx2y: validate URB actual_length in interrupt callback
    b5753bdfd909f ALSA: usbusx2y: fix in04_last array size mismatch with in04_buf
    0eb9dd4774af0 ALSA: us122l: Prevent write upgrades for read mappings
    a817e12bf2e23 ALSA: ctxfi: Fix CA20K2 S/PDIF passthrough
    a57262303a8bd drm/panic: clean new `clippy::needless_range_loop` lint for Rust 1.100.0
    8ee7286f6854d rust: allow `unknown_lints` in generated bindings for Rust < 1.88
    5409aa512a81a rust: allow `clippy::as_underscore` in the generated bindings
    fdd562ddc1081 rust: pin-init: use irrefutable pattern for `stack_pin_init`
    320e60bde8c01 rust: num: seal Integer
    67fb91a7f7bb1 tracing: Don't dereference trace_event_file in deferred trigger free
    b2fb87d29ffb3 tracing: Take trace_array reference when opening a tracer options file
    c27f8b68c0580 tracing: Fix memory corruption from a "STACKTRACE" histogram key
    65d1e28198f34 tracing: Set the trace clock before registering the histogram trigger
    393dcf61b4353 tracing: Restore :mod: trailer after parsing in ftrace_set_clr_event()
    55caaf25da2c2 tracing: Fix memory corruption from the histogram stacktrace modifier
    1fadebbbf31f6 ftrace: fork: Initialize function graph state before copy_exec_state()
    1e685b7d98806 ftrace: Use rcu_assign_pointer() for tmp_ops filter hash
    9a17b0e053197 reboot: fix cad_pid use-after-free race
    d0a2e2a4ee6bf ipmr: account multicast table and route memory
    4553cfafa8d05 ipv6: fix fib6 walker UAF on seq stop
    570a6aaf6b52c mm/slab: take n->list_lock in __slab_try_return_freelist() to avoid race
    89c60435b90d3 x86/alternatives: Exclude text poking against change_page_attr()
    93b98882198b1 x86/mm/pat: Acquire init_mm write lock on collapse to avoid UAF
    67cf94c30a8b5 x86/cfi: Fix FineIBT hash offset in cfi_get_func_hash()
    a5ad97cbcfcec x86/mm: Fix user-space data loss with MADV_FREE and THP
    aa2a4277ad42f x86/amd_node: Fix PCI device reference counting in amd_smn_init()
    24f27068bd368 crypto: x86/aria - add missing vzeroupper in AVX-512 code
    eec0fefe19640 crypto: x86/aria - add missing vzeroupper in AVX2 code
    a797a2331e5d2 x86/amd_node: Fix potential NULL pointer dereference
    662aa0e5eeb24 x86/MCE/AMD: Fix inverted interrupt enablement during storm handling
    94e984d8858a3 x86/amd_node: Avoid divide by zero on virtualized systems
    5d180176e868f powerpc: pci-ioda: Fix the stale irq chip reference
    85d8eaefc052c powerpc/eeh: Fix recursive locking on devices without EEH sensitive driver
    579667c825a89 powerpc/ps3: Fix repository.c build failure
    925d8564f1b2d configfs: unhash the dentry before dropping the item in rmdir
    d47c5de1cd6bf configfs: pin the symlink target's dirent instead of chasing ->ci_dentry
    37f7f54d06c61 scsi: target: iscsi: Fix hang for aborted WRITE_PENDING commands
    b1eb100750c74 tracing/remotes: Catch nr_page_va overflow in ring_buffer_desc sizing
    aac53a4683b24 tracing/remotes: Account for ring buffer page header in size calculation
    cf1951cfa039b scripts/mksysmap: fix escape of '$' in the __pi_ pattern
    fb548ba5e2c72 scripts/mksysmap: drop the MODULE_INFO() symbols from kallsyms
    fe34800ee6f26 tracing: Fix ring_buffer_read_page_size() kernel-doc
    3ee56aa5330f9 erofs: add missing buf->off in erofs_bread()
    69083eba7585f ublk: clear force_abort in ublk_queue_reset_io_flags()
    f3322baa3a8ac sunvdc: unmap LDC cookies when the descriptor send fails
    bdf1c10c6a632 block: Fix start and length check added to iov_iter_extract_bvecs()
    d81c5c80d77f9 openvswitch: fix wrong flag value in get_ipv6_ext_hdrs()
    756847a25f734 net: hsr: enable promiscuous mode on interlink port with fwd offload
    65820fc743eae net: stmmac: fix TX descriptor availability check for TSO traffic
    f4649a716be20 net/rds: fix tcp stream corruption with large pages
    9801edfba8dfc net: mana: restore the XDP program pointer when pre-allocation fails
    fea2aef26ea52 net: phy: dp83867: handle the active-high LED polarity mode
    f098a6b596d18 octeontx2-af: fix PF/CGX debugfs PCI bus lookup
    c49bfa2c5dbd8 net: net_failover: Fix the deadlock in net_failover_slave_name_change()
    517209690d38a net: phy: mediatek-ge: disable EEE on the MT7530 PHY
    6f549221cc3e8 net: ethernet: mtk_eth_soc: populate lpi_interfaces to fix EEE support
    dcc6d2daa79b7 net: dsa: mt7530: populate lpi_interfaces to fix EEE support
    af5d1ccb3f626 net: dsa: mt7530: add EN7528 support
    513f7b16ed0cf net: hinic: fix mailbox segment buffer overflow
    7d9632d828bb4 net: sun4i-emac: fix missing of_node_put() for phy_node
    e9ac395bb5612 net/sched: cls_api: Don't replay RTM_GETCHAIN in tc_ctl_chain().
    83efad4fc3c90 net/sched: cls_route: Fix in-place replace
    0de0f36e52327 net/sched: cls_route: Reject handle aliasing
    81dd117c04422 net/sched: cls_route: free emptied bucket on filter move
    003f07eeb5855 sched/core: Call wq_worker_tick() for the execution context
    90aa8b43de40c sched: Account cgroup CPU time to the execution context
    85cafaf879de9 sched/eevdf: Fix rb augmented with multi fields
    f47ea366f1053 sched/eevdf: Fix augmented max_slice
    c55599c0ec2aa perf/x86/intel: Prevent drain_pebs() reentry
    d79715f25ea91 perf/x86/intel: Correct pt_regs->flags update for PEBS path
    e2770c76a0245 perf/core: Allow list_del during perf_event_overflow()
    c616733aa797b drm/i915/dp: Gate UHBR SST SDP splitting on sink capability
    720954c6cc98a selftests/powerpc/tm: Fix tcheck() reading uninitialised CR value
    1a2063f062389 powerpc/entry: Fix double accounting of user time on interrupt entry
    d1fcff9b39bac net/mlx5e: Move representor vnic reporter to eswitch devlink port
    b1986595cf827 net: stmmac: initialize ptp_lock at probe time
    4786233082ac1 net: phylink: initialise link_state before a forced major config
    15d0a6c9a42df ppp_synctty: ensure a writeable skb header
    081f22177d9d1 vxlan: initialize _md in vxlan_xmit_one()
    2df186418e17b octeontx2-pf: reset HTB scheduler topology before freeing queues
    0f07cb0727032 hwmon: (nct6694) do not expose enable on DTIN temperature channels
    fdc1bc23ff59e hwmon: (corsair-cpro) Remove debugfs entries when probe fails
    22d0f81552a5a hwmon: (aspeed-pwm-tacho) Propagate reset deassert errors
    f77fd0bb2092c hwmon: (gpio-fan) take fan_data->lock in gpio_fan_shutdown()
    fdfe17cb86571 hwmon: (corsair-cpro) Create debugfs entries after hwmon registration
    f5d193272bd2d net: ks8851: Fix receiver error in 100BASE-TX mode following software power-down
    3a441afa2a49d net: dsa: lantiq_gswip: fix GSWIP_MDIO_PHY_FCONTX_EN value
    89f7b194f4fa9 watchdog: msc313e: Sync timeout value if WDT was running at boot
    64229a6c4ef88 watchdog: msc313e: Fix undefined behavior
    6d7217cf2dbd7 watchdog: msc313e: Fix spurious reset on suspend
    8bd8a53faf6c4 watchdog: msc313e: Enable clock before accessing hardware registers
    faf1eb2895c87 watchdog: msc313e: Fix clock leak and spurious timer in settimeout()
    5788a6747eda8 watchdog: msc313e: Avoid division by zero
    0d8dfcf54823b watchdog: fix hrtimer start when pretimeout is zero
    c9bc3e41aa202 mptcp: remove unneeded READ_ONCE() annotation
    25764620ec64c drm/xe: Guard page-fault worker with runtime PM check
    9e673bf5d88aa nstree: check listing permission before taking a namespace reference
    7d60dc7ff85b7 net: macb: put the "mdio" child node reference on success
    8558e31956641 net: macb: destroy the phylink instance on the probe error path
    1155234c2227c ipv6: null-check fib6_node before accessing in __ip6_del_rt_siblings()
    3a4d79a56d055 net: mana: Clear RDMA teardown and suspend state in mana_rdma_probe()
    188c06af0f5f9 Bluetooth: btusb: Fix leaked runtime PM reference in btusb_reset
    7befa027558d6 Bluetooth: btusb: mediatek: Fix leaked runtime PM reference in reset
    9e9ece97b8e71 Bluetooth: hci_sysfs: Fix NULL pointer dereference in device_del()
    d9b31fe313e08 Bluetooth: btmtk: Declare MT7920 (MT7961 1a) Bluetooth firmware
    a641201a9b4d6 Bluetooth: btintel_pcie: fix tx_handle bounds off-by-one
    46884c0f92708 Bluetooth: btintel_pcie: validate packet_len before skb_put_data
    fa391adb9c755 Bluetooth: btusb: Fix UAF of btusb_data by rx_work
    8691bcc502226 Bluetooth: Properly disable remote wakeup for MT7922/MT7925 on Ryzen platform
    c42db35518bb0 eth: ice: don't dereference pointers from TP_printk()
    d6f38fb12069f ice: add missing xa_destroy for sched_node_ids
    a7cc0478a89d5 idpf: account for VLAN header when parsing RSC packet header
    1c821dcda9736 platform/x86: x86-android-tablets: fix gpio_secondary_fwnode_init() not working
    abd790cad1916 ALSA: hda: Report a change when only the channel status bytes move
    716e1cd378380 s390/debug: Fix NULL pointer dereference in debug_set_level()
    02b9059928075 drm/logicvc: Drop the select of the nonexistent CONFIG_DRM_KMS_DMA_HELPER
    8c38cdbecb67c drm/adp: Drop the select of the nonexistent CONFIG_DRM_KMS_DMA_HELPER
    928b2947f929f net: ethernet: cortina: Count RX descriptors for freeq refill
    39739dd93e2af net: ethernet: cortina: Count RX drops once per frame
    5754e0c075880 net: ethernet: cortina: Count dropped frames as NAPI work
    a4031429ea719 net: ethernet: cortina: Finish RX updates before NAPI completion
    94e06e12a3767 net: ethernet: cortina: Fix budget accounting
    8977d7caf05f6 net: macb: reject an unknown link speed in the taprio setup
    203c064b09ecf net: macb: zero the link settings taprio reads back
    135ac58097fa5 vduse: return compat ioctl results directly
    31d7eea4be53f net: ipv6: Clamp to IP6_MAX_MTU in ip6_dst_mtu_maybe_forward
    e01b7c176d9af net: ipv6: Fix UDP length overflow with PMTU discover and big MTU
    81f540827d243 net: ipv4: Fix UDP length overflow with PMTU discover and big MTU
    c81c5be3826c8 af_unix: Return immediately when manage_oob() returns NULL for 0-length buffer.
    fc62a26493a98 af_unix: Update last skb marker in manage_oob().
    5378f7945856a virtio_input: stop callbacks before unregistering input device
    668ebfea7ba62 virtio_input: reset device if input_register_device() fails
    4a454af8e56c1 vhost: invalidate vring access on IOTLB transitions
    c3c3b0839a119 vduse: validate virtqueue alignment
    5195893d7b3dd virtio-pci: return IRQ_HANDLED after non-zero ISR
    2bbf1c1f69991 vdpa_sim_net: check TX pull result before RX copy
    d6dac17e20fd2 vdpa_sim_blk: reject out-of-range sector starts
    f4a93f15ed1c8 vhost-vdpa: protect config_ctx from being freed under the config callback
    6b20b40f020bd vhost-vdpa: don't install the eventfd_ctx_fdget() error in config_ctx
    59522639a7d71 vhost/vdpa: reject VRING_NUM larger than device max
    f620c40ea6862 virtio_console: do not free control-out buffers on remove
    caf042153016d virtio: fix use-after-free in unregister_virtio_device()
    d595358276b60 virtio_ring: fix stale descriptor flags after a failed packed add
    68a60150ee06d irqchip/gic-v5: Preserve ICC_CR0_EL1 state
    6c7b3b1e7ba8c ASoC: mt6351: Publish the OF module alias
    96e856bbe7054 regulator: pf1550: fix which regulator is notified
    a5b43094d4eab netfilter: ip6_tables: set F_PROTO when proto value is nonzero
    e2dd0f1f8c4e6 netfilter: nfnetlink_log: cope with concurrent instance destruction
    3373cfc7ec19e btrfs: fix unnecessary transaction commit fallback from btrfs_log_all_parents()
    a191d3a2a08b6 ASoC: Intel: SST: Publish the PCI module aliases
    ccbd83e69e1b3 ASoC: bcm: bcm63xx: Publish the OF module aliases
    85a89e529b9ab hwmon: (sht4x) Fix return value from heater_enable_store()
    ef52acffe5c44 hwmon: (sht4x) Add missing locks
    72041f02ae51d hwmon: (yogafan) fix non-kernel-doc comment
    df1edd8e0f009 Documentation: hwmon: replace full-width colon by a standard ASCII colon
    05beedad2de14 hwmon: (ina2xx) Decouple in0 and curr1 alarms
    3e4ba0d57297a hwmon: (ina2xx) Replace masks with enum in alert functions
    5949a7e98a9f2 hwmon: (ina2xx) Parameterize ina2xx_data in ina226_alert_read()
    ba71f55c22667 hwmon: (ina2xx) Acquire hwmon_lock in shunt_resistor_show()
    01dd8b4fc2cf8 hwmon: Fix potential UAF in pec_store
    159ad4370b5a5 Documentation/hwmon: Document hwmon_notify_event()
    aa08ce1ffaf36 hwmon: (ltc4282) Make sure clk_init_data is fully initialized
    80c231f557722 iommu/amd: Fix ineffective error check in nested domain allocation
    f2098875800f3 iommu/amd: Fix premature break in init_iommu_one() again
    b6be275d19cee iommu/amd: Do not reallocate GA log buffers on resume
    79ae5a5a25e18 iommu/riscv: Avoid waiting on failed command enqueue
    6d4c12ab9ab8d iommu/riscv: Serialize command queue publishing
    c80bfa4d49e71 iommu/riscv: Add command queue lock
    16322a67336cf erofs: delimit inode_share cache key components
    d41e6c1533f09 ALSA: caiaq: Decoupling ep1_in_urb in caiaq dev
    f8ae8275c7213 bpf: Reject non-scalar bpf_loop iteration counts
    edb39c7666bb3 net: macb: fix NULL pointer dereference on unbind with fixed-link
    de22c30ec5598 net/sched: ets: clamp quantum in parse and fallback paths
    8f756ae1c8741 net/sched: drr: clamp quantum in change class
    0f5550b8b7c32 net/sched: pie: clamp psched_mtu in pie_drop_early
    1f0a5bb2fa53b net/sched: dualpi2: clamp psched_mtu at all call sites
    0898c6f9fa9ce net/sched: hhf: clamp quantum in change and init paths
    e6c1cb728e389 net/sched: sfq: clamp quantum in change path
    6655b56e28010 net/sched: fq_pie: clamp quantum in change path
    9ab4f3ef4701e net/mlx5e: Keep HW timestamp stats monotonic across reconfiguration
    668e050429c7c net/mlx5: E-Switch, prevent mc_list repopulation during vport disable
    18b2969073879 net/mlx5: E-Switch: fix use-after-free in mlx5_eswitch_termtbl_put
    1daecd76ab9e5 net/mlx5e: Fix use-after-free race in sample_restore_put()
    b1b796a67290f net/mlx5e: Fix ETS zero BW reporting when one TC holds 100%
    fa670c482eee3 net/mlx5: LAG, use local tracker to update active ports
    df643e20c315d net/mlx5e: Fix reporting support for all RS FEC variants
    2647fbc69c566 net/mlx5e: Fix setting RS FEC after remapping
    f8760e28fd3f4 net/mlx5e: Fix missing FEC mode mapping for RS_544_514_INTERLEAVED_QUAD
    5bfe927c5b4b2 net/sched: defer qdisc freeing after failed creation
    95cd316a896f1 powerpc/entry: Fix irq_soft_mask corruption on replayed interrupt exit
    906d8dbafabfa net: mctp: i3c: serialize probe with bus removal
    ada0b3d6ee2d2 powerpc/kexec_file: Use inclusive range checks for excluded memory
    0dbb7d3fc6591 powerpc/kexec_file: Use inclusive range checks in add_usable_mem()
    37803c6aa015f bpf: propagate mark_chain_precision() errors out of loop_flag_is_zero()
    69a9ad004ccf5 bpf: mark a NULL call argument precise
    1e6a26f21f59f pds_core: don't release PCI regions for VFs on reset
    09f831bfe39de pds_core: fix cmd_regs access racing BAR unmap on reset
    a638a2625aa83 net: reject oversized tx_queue_len at netlink parse time
    a03b927bae4af net: cap tx_queue_len at S16_MAX to prevent oversized ring allocations
    3fa64d86fc64e vxlan: reject dynamic fdb entries that reference a nexthop id
    60983356fab0c s390/ism: folio_put() after error
    a4fd1ea63365f dibs: Unregister dibs_class after error
    237c9ae714577 net: usb: cx82310_eth: drop URB after 0xffff reboot sentinel to prevent partial_data heap overflow
    e247d033dd323 ionic: use netif_txq_maybe_stop() in ionic_tx()
    94a7a895677ca octeontx2-af: mcs: Clear stale X2P calibration state before calibration
    f7bf57e94a5d6 net: bridge: mcast: properly convert mglist to rcu
    cda5ac8fe8ac8 net: dsa: mv88e6xxx: bound the policy rule dump by the caller's buffer size
    552e528a7d85c eth: nfp: drop the replaced rule from the list when reprogramming fails
    ecebfdaab72a5 eth: nfp: bound the ntuple rule dump by the caller's buffer size
    b231b6d8516d3 net: dsa: bcm_sf2: bound the CFP rule dump by the caller's buffer size
    8e2a5ffdc32ca bonding: use skb_cow_head() in bond_do_alb_xmit() and rlb_arp_xmit()
    d80677ad7aa5b nexthop: Initialize extack in remove_nh_grp_entry()
    72e750bf178b9 tracing: Fix comment in tracing_buffers_splice_read()
    94e35fcbda973 ring-buffer: Cap static ring buffer nr_pages
    75b37b8369778 tracing: Fix subbuf resize races with trace_pipe_raw readers
    5ccce5bbdfac8 ring-buffer: Remove ring_buffer_per_cpu::mapped
    66ff2eff093d2 bpf: Preserve inner map identity in callback frames
    86168208737bd bpf: Mark NULL kptr stores precise
    28fde1356dbc3 bpf: Cancel special fields when recycling rhtab elements
    6a5266b828821 bpf: Preserve special fields in recycled rhtab elements
    bb998fdbee996 selftests/bpf: Fix flaky bpf_nf test when random NAT port is 0
    8adebc20f9c65 tracing: Fix to avoid creating trace instances with duplicate names
    6b1f786ad85a0 bpf: Reject untrusted allocated-object pointers
    85074498228a2 bpf: Keep refcount_acquire nullable for borrowed RCU kptrs
    ad4ebae5dbc2d bpf: Require MEM_PERCPU for percpu kptr stores
    56d5886eb53f7 thermal: sysfs: switch to use scnprintf() to suppress truncation warning
    ddca9a3b88331 bpf: Mark the zero register precise for a register-form NULL check
    a4d7f94c1ca91 bpf: Don't predict JMP32 pointer vs zero comparisons
    e821ff19b8ef0 bpf: Don't resurrect a scalar id dropped by collect_linked_regs()
    cb6642048739b bpf: Don't infer non-NULL from a pointer with an unbounded offset
    bc489c0c9b8c8 bpf: Reject legacy packet loads from callbacks
    19e8d5a98afd0 bpf: Mark faultable stack helpers as sleepable
    17f54a8f2b971 bpf: Mark bpf_btf_find_by_name_kind() as sleepable
    2410cb2ac0416 bpf: Check ancestor frames for rbtree callbacks
    9ef2b594f6287 bpf: Track verifier instruction stats for each subprogram
    24adbc2c3bbe3 bpf: don't rewrite bpf_fastcall patterns entered by a jump
    1c1b476d43a8b bpf: zero extend the result of an arena 32-bit cmpxchg
    7ddcc460176eb mlxsw: spectrum_ptp: Fix napi_gro_receive() call from GC workqueue context
    5df7ecd302488 net: bcmasp: fix tx_spb_ring_full() checking same slot cnt times
    17e6ad484dea5 net: bcmasp: clear txcb->last before writing each descriptor
    8f20a0f4f7d63 ASoC: Intel: avs: Refactor and fix init_config access
    60b396b2aeca3 ASoC: Intel: avs: Fix unbalanced module reference count
    b4f0941e728cb ASoC: Intel: avs: Do not ignore -ENOENT when loading a topology
    04447cd14ebcc ASoC: Intel: avs: Clean up the bus when fetching ML caps fails
    7b94af22e5c71 nvme-tcp: defer TLS inline send to io_work
    18bc44e127f52 nvmet: print namespace IDs as unsigned 32bit value
    140e211543bda nvme: print namespace IDs as unsigned 32bit value
    52200fc41a79d nvme: remove stale namespaces by NSID range during scan
    69d502457e3f7 ring-buffer: Add checking nr_subbufs to persistent ring buffer validation
    3408e98f06ce0 bpf: Mark syscall helpers as sleepable
    b9205e936dde9 bpf: Mark sched_process_wait argument as nullable
    71930202a0a0c bpf: Reject resilient lock operations in rbtree callbacks
    96d31b28263c4 bpf: Reject tail calls directly from callback frames
    d2eaea3599bcc bpf: Mark signal tracepoint siginfo arguments as scalar
    ea383b3ea5697 bpf: Fix NULL-ptr-deref in btf_var_show()
    5324f4e75ff6e bpf: Fix NULL-ptr-deref when showing a void BTF type
    7ca231252820c bpf: Reject key-less BTF for hash maps
    3c3170d29e55b drm/rockchip: rk3066_hdmi: Add missing Kconfig selects
    0e72cfedd2c5f drm/rockchip: dw_dp: Select DRM_BRIDGE_CONNECTOR
    b629ae7b3eddc ALSA: caiaq: Fix potential double-free at error path
    f5fd0de524329 selftests/alsa: Fix the step check for INTEGER controls
    c9a2db4b9950b erofs: disable LZ4 rolling decompression for now
    be056cc0ee224 arm64: trans_pgd: clone only the linear map that exists at runtime
    eab6f00b7c62a net: gro: Fix nesting of TCP GSO SKBs in skb_gro_receive_list()
    21448b9b85a7b net: stmmac: reconfigure RX packet parser table in stmmac_hw_setup() after reset
    737a95fc15281 net: airoha: enable RX_DONE interrupt for RX queue 31
    c8e80c19c3b9c powerpc: Do not restore KUAP in arch_exit_to_user_mode_prepare()
    ade9f5464ff78 powerpc: Don't drop _TIF_RESTOREALL on syscall restart
    2941561395066 net/rds: don't let rds_conn_shutdown() consume a concurrent drop
    1fe627e5db5c3 net/rds: acquire the fastpath locks in rds_conn_shutdown()
    062d9e008c672 net/rds: acquire RDS_IN_XMIT in rds_tcp_reset_callbacks()
    a76fa27d44649 net/rds: tcp: don't force RDS_CONN_RESETTING over a concurrent shutdown
    cb62aa8f04655 net/rds: clear cp_flags bits individually in rds_conn_path_reset()
    61916e7461110 net/rds: use clear_bit_unlock() in release_refill()
    3764627b30a28 net/rds: use wq_has_sleeper() in release_in_xmit()
    aba934acbfcd3 net: macb: exclude software FCS from TX byte statistics
    2ebeb6e8ab9d6 net: macb: unify device pointer naming convention
    ac6631843269e net: Remove conflicting altnames for dying netns in __dev_change_net_namespace().
    6d0ee411d5437 bonding: do not clear curr_active_slave prematurely when releasing all slaves
    92f0bd0e2b632 bpf: reject BPF_PSEUDO_FUNC reference to the main program
    178ff2e011e21 tracing/probes: Fix use-after-free on field name/type of events with multiple probes
    4a30aa2ba007d netfilter: nf_conntrack_sip: fix OOB read in sip_skip_whitespace()
    de6cc6ec7932b ipvs: fix reversed sequence option serialization
    98d66a95b430a drm/amdgpu/userq: fix struct drm_amdgpu_info_device padding for 32bit compile
    0de9f31d447ae btrfs: zstd: fix lost wakeup when waiting for a workspace
    b5d5ab5a71500 btrfs: do not force reloc root creation during qgroup_account_snapshot()
    cb09becfebbd9 btrfs: send: fix lost error return value in will_overwrite_ref()
    e1b168a53174b btrfs: zoned: finish active block group cleanup if call_zone_finish() fails
    c8e65e7e9c034 btrfs: return proper negative error code for update_raid_extent_item()
    bb4da45766d16 btrfs: fix the possible bioc_list memory leak during error
    b7b94923b3b57 btrfs: fix transaction use-after-free in raid stripe insertion
    fe5a889674ca4 btrfs: scrub: report the failing sector's address, not the stripe base
    f83890dfed9ef bpf: backtracking shouldn't clear outer frame R1-R5 for callbacks
    671b7b9a660ef bpf: backtrack_insn(): Handle ld_{abs,ind} subprog exit edge
    5c421d64a1ae6 ASoC: ux500: Program the MSP FIFO watermarks
    2859e47fd3aa6 ASoC: ux500: Allow repeated MSP prepare calls
    db6abd51ba323 ASoC: ux500: Remove obsolete PRCMU QoS calls
    a68251d68fb05 ASoC: ux500: Request the MSP MMIO resource
    5977cd2af9223 ASoC: ux500: Deassert the MSP reset during probe
    9ed5d1e428ed3 mfd: db8500-prcmu: Fold dbx500 header into db8500
    39fb9ebea7985 ASoC: ux500: Validate MSP DAI configuration
    41da17079fe61 ASoC: ux500: Correct MSP frame and bit clock setup
    68544eca7b184 ASoC: ux500: Propagate MSP setup errors
    0fcf9ac170b8f ASoC: ux500: Fix MSP stream lifecycle handling
    c62b6e081119f platform/x86: x86-android-tablets: hold device reference for secondary fwnode teardown
    24f7b68b69bf1 printk/nbcon: Change nbcon_irq_work to IRQ_WORK_LAZY
    a4cef20cd473e ALSA: ump: do not touch legacy_rmidi before it exists
    34365e921d996 ksmbd: fix sparc build with atomic work state
    03fa3d5585e71 octeontx2-af: Fix limiting SRIOV VF count logic
    baa320fbb2f9f locking/lockdep: Invalidate stale class_cache entries for zapped classes
    da0217aeeacf4 perf/core: Skip empty AUX records with only format flags
    94a643e97e544 x86/itmt: Don't make ITMT enablement depend on debugfs
    4ed549b42cf98 sched/core: Skip rq->avg_idle update without a valid idle_stamp
    b0c6f94705775 sched/rt,dl: Skip migrate-disabled tasks when picking a push candidate
    45504e621b7e8 scsi: mpt3sas: Avoid out-of-bounds cpumask_of_node() call in _base_assign_reply_queues()
    80b45c8b6602f perf: RISC-V: check cpu_hw_evt before dereference in overflow IRQ
    3b178894931a2 bonding: alb: fix uninitialized transport header access in alb_determine_nd()
    b79b4b2900369 btrfs: restore active device pointers after failed sprout
    0ea6814bc0ff7 btrfs: detach failed sprout device from transaction update list
    9f0520143dd10 accel/amdxdna: refuse to flush an imported BO
    f7ac456532092 ALSA: dummy: Report a change when one capture switch channel moves
    7c372ada4aaa3 drm/xe/oa: Remove sysfs entry on idr_alloc failure in xe_oa_add_config_ioctl()
    b66d66c2da568 ASoC: cs35l56: Fix probe deadlock waiting for SoundWire enumeration
    0b027b65addd9 ASoC: cs35l56: Request IRQ in cs35l56_common_probe()
    0f2fe40362f12 block: save page offset gaps in cloned bio
    ac961c34cf39f ASoC: amd: yc: fix memory leak in acp6x_pdm_dma_close()
    4dacdec65982f ASoC: amd: renoir: fix disable_pdm_interrupts() to clear mask bits
    fa1bbe3534499 ASoC: fsl_micfil: balance mclk enable/disable
    8d11bfec8666f s390/boot: Avoid IPL parameter append past command line
    36b63b4d365e8 s390/boot: Fix physical memory search range
    537ea064c0f9b ALSA: hda: restore MFG widget enumeration after core split
    e1b2c0ede2a81 net: bonding: annotate lockless writes with WRITE_ONCE()
    dcb48fde80034 staging: fbtft: make dirty_lock IRQ-safe
    9d714076ff398 af_packet: Don't cast tpacket_hdr.tp_len to int in tpacket_parse_header().
    3ad7dca5e03bd ipv6: sr: restore network header before routing and forwarding
    bee1459e57f2e tipc: Dont send random pad bytes in RESET/ACTIVATE messages
    d0d82f1214f32 tipc: fix NULL deref in tipc_named_node_up() on empty publication list
    390e6ef5325cd ip6_gre: check tunnel info before xmit in ip6gre_tunnel_xmit
    8c1fe57625395 ipv6: mcast: use jiffies_delta_to_clock_t() in igmp6_mc_seq_show()
    2e46b0c9fcf7e ipv6: mcast: use rcu_assign_pointer() for __rcu list updates
    5e62b63f56e57 ipv6: mcast: fix delay calculation in igmp6_join_group()
    20db91a052332 ipv6: mcast: use copy-on-write RCU updates in ip6_mc_source()
    5149c60c40659 ipv6: mcast: fix RCU list diversion in ip6_mc_del1_src()
    d24f76ea332bf objtool/klp: Fix checksums for constant pool references
    a8bc78d640ecd klp-build: Fix wrong index in funcs cleanup error path
    2b51c3d6a5232 ppp: ppp_synctty: simplify tty disc_data access
    1b13502b25da5 ppp: ppp_async: simplify tty disc_data access
    e3206419bdb04 igmp: convert struct ip_sf_list to RCU
    e8fac7521de6f rust: samples: add missing newlines in rust_print_main
    f594f04268d01 net/sched: cls_u32: fix duplicate handle when node ID pool is exhausted
    25e26ba83302d net: ethernet: oa_tc6: Fix for the wrong data type
    264c80a9bfa50 net: ethernet: oa_tc6: Disable tx queues on fatal error
    b89770d493749 net: ethernet: oa_tc6: Improve the error recovery
    1c1f35bc2d27f net: ethernet: oa_tc6: Protect skb pointer used by two different kernel instances
    4e56cbcfe0d9d net: ethernet: oa_tc6: Add the OA_TC6_ prefix to standard registers
    057351f537f51 net: ethernet: oa_tc6: Export standard defined registers
    14864eec58786 net: ethernet: oa_tc6: Handle the OA TC6 SPI protected mode
    95d2386a2b160 drm/pagemap: Reset migration page count on eviction retry
    62451f540c46b drm/pagemap: Prevent double migration of device pages
    9a17d5d364c4b ASoC: ab8500: Skip missing DMIC GPIOs on AB8505
    ce643d02326e9 ASoC: ab8500: Remove the nonfunctional sidetone apply control
    a3df2bb5923ce ASoC: codecs: ab8500: Use guard() for mutex locks
    e78c44bd9dca8 ASoC: ab8500: Validate and program TDM slots correctly
    89a0d0f2c5cfd ASoC: ab8500: Correct digital interface format setup
    3c057babc97ff ASoC: ab8500: Repair the DAPM capture graph
    f48cf599c19a4 ASoC: ab8500: Reset the audio block before configuring it
    ddf6add968116 platform/x86: asus-laptop: Fix ACPI event handling
    adc86d12f13ac Bluetooth: hci_mrvl: Fix wrong return value check of wait_on_bit_timeout()
    cc4545a8a7738 Bluetooth: L2CAP: clear FLAG_DEFER_SETUP only for same PID/PSM
    df8c3af613264 Bluetooth: L2CAP: fix out-of-bounds write in l2cap_ecred_connect
    6cb79e6499228 Bluetooth: L2CAP: fix chan mode for LE_CONN_REQ + EXT_FLOWCTL pchan
    d427b1c71d979 Bluetooth: hci_core: Fix race condition during device registration
    a07b3024a9278 Bluetooth: btintel: bound firmware ID by TLV length
    5ec43df2830b7 Bluetooth: btintel: validate version TLV value lengths
    89d0220cba873 workqueue: reject watchdog thresholds that overflow jiffies
    84fb4138aa082 Bluetooth: btintel_pcie: Clear automask on spurious interrupts
    a14c25fcec671 sched_ext: Fix vtime delta loss in scx_flatcg cgroup migration
    5e2bd013ad8fa sched_ext: Fix timer pinning and return value in scx_central
    c93938a157d7e s390/pai: Reduce excessive debug feature size
    1387c202668c4 s390/diag324: Preserve -EBUSY return code
    280ff19853440 s390/ipl: Fix NULL deref in dump_reipl without re-IPL parm block
    b6bf82bc5e00a s390/ipl: Fix NULL deref in kdump without re-IPL parm block
    565eb4a12a56c s390/time: Use jiffies instead of jiffies_64
    40581f10c1e56 ksmbd: fix listener task lifetime on netdev events
    54cb2a9099963 ksmbd: rate limit unmapped SID errors
    a04dac1f2cffe ksmbd: propagate DACL parsing errors
    a7e6df0bb9264 ksmbd: safely drain sessions during logoff
    0947087678f46 smb/server: cancel async requests when closing connection
    13a411272c936 ovl: return EINVAL instead of EIO in case of mismatched user_ns
    b3e4eeaaff857 drm/i915/cdclk: Fix dg2_power_well_count() return type
    04a36f6f1b918 drm/i915/dp_mst: Remove duplicate intel_pfit_compute_config() call
    5f13ee1f3c39b octeontx2-af: fix CN20K default MCAM rule removal on port cleanup
    9371188ee3c7e dma-buf: fix some kernel-doc warnings
    8c1882dfee8f4 ALSA: pcm: Serialize PCM mmap with buffer reallocation to fix page UAF
    93488ea378b44 cachefiles: Fix potential UAF/KASAN warning
    5b50fa4b6d71c netfs: Fix read progress reporting
    fc18818960ec0 netfs: Mark folios with COPY_TO_CACHE whilst issuing subreqs
    8c9b339457120 netfs: Fix readahead synchronisation issues by loading all folios upfront
    19f246c795e94 netfs: break unbuffered write when netfs_alloc_subrequest() fails
    0a573f4283a96 netfs: Fix subreq ref leak
    7ab7100edff97 netfs: Fix i_size update for partial transfer
    680f6b07e7acf netfs: Fix error vs transferred passed to ->ki_complete()
    8e11e842936c5 netfs: Fix unbuffered/DIO write partial transfer error return
    ccd8bd3b8ca69 perf powerpc-vpadtl: Fix raw_size of DTL samples
    325cd9a8bc42a OPP: of: Fix potential multiplication overflow when calculating freq
    ef9795a0e4738 perf symbol: Do not use debug file as the binary type
    6495dc16e6353 watchdog: msc313e: Fix NULL pointer dereference in PM callbacks
    71203a41d6fa2 vxlan: mdb: Fix use-after-free in vxlan_mdb_remote_src_del()
    411e9b969d9d5 net: amd-xgbe: discard rx packets with bad FCS
    55ad62f9e025d raw: annotate disconnect-side IPv4 match writers
    7ba84e2971d20 sctp: fix soft lockup from unpadded ASCONF-ACK parameter iteration
    4bfaf34d2d4b5 smb: client: transport: Fix debug printing in __release_mid()
    93c6e5a8d7c50 smb/client: invalidate fscache for fallocate range operations
    76222e76d08fb smb/client: fix stale page cache in insert/collapse range
    b7625c7de7da7 smb/client: fix integer truncation in collapse range
    c6379b31abff8 smb/client: fix data corruption in emulated insert range
    1c5d219498cc4 smb/client: mark file sparse before emulating insert range
    f320ca20c273a smb/client: validate new EOF for zero range
    f8cbfe3a3fcee smb/client: validate new EOF for insert range
    60c15270faaeb scsi: ufs: ufs-pci: Add MCQ support for Intel UFS 4.0 controllers
    c9fdc7e2a779a scsi: ufs: ufs-pci: Add support for Intel UFS 4.0 HS-Gear5
    1ccbe8c420097 scsi: mpi3mr: Fix target device refcount leak in mpi3mr_sas_port_add()
    5cb58b052cf09 scsi: mpi3mr: Fix NULL pointer dereference in mpi3mr_sas_port_add()
    3d698d1e6c8bc sctp: fix a TOCTOU race in SCTP_CMD_TIMER_START
    43f874494321a net/sched: act_api: fix skb sizing and action leak on reoffload delete
    5eb1e633b9ed9 net/sched: act_api: size the RTM_GETACTION reply from the actions
    afca30398b99f net/sched: act_api: budget all shared attributes in notify skbs
    3340b8565b856 net: iptunnel: fix stale transport header during tunnel decapsulation
    e85adaac3dc63 net: stmmac: fix dma mapping leak in stmmac_tso_xmit()
    ad051a0a26195 tcp: use GFP_ATOMIC in tcp_send_active_reset()
    2b32f8c356090 net: icmp: avoid invalid transport header access in icmp_send tracepoint
    436fa689630b7 bpf: don't downgrade half-dead scalar zero spills to STACK_ZERO
    5811a08310754 ntfs: leave HasEA flag untouched on setxattr failure
    b55c9f019e169 bpf: check_cond_jmp_op(): properly infer if register is null
    7524c3145a3ba ntfs: reject invalid sectors_per_cluster in the boot sector
    3e2ae47b8ebc6 ntfs: bound $AttrDef table walk to the loaded table size
    56392b0d5290f ntfs: treat any nonzero dio zero-range return as an error
    ca1f9933eff77 ntfs: do not mark the volume clean in sync_fs when errors were recorded
    fc070b91cca84 ntfs: skip free cluster decrement when rollback fails
    7eb97d8828e77 ntfs: only count successfully cleared runs when freeing clusters
    5d7f7bf8fba8c ntfs: fix kmap_local leak in write_mft_record_nolock() error paths
    369597d1afa91 ntfs: return real error from ntfs_non_resident_attr_record_add()
    380540243cc27 ntfs: preserve error code in ntfs_resident_attr_record_add()
    b3575c6692867 ntfs: return -ERANGE for undersized xattr buffer
    c62f446c63398 ntfs: propagate reparse index insertion failure
    6de3a77a5e751 ntfs: return DT_UNKNOWN on inode lookup failure in readdir
    144f51cd0ccc3 drm/cirrus-qemu: Validate BAR0 size during probe
    e44b3a824472a ufs: do not treat unreadable directory blocks as empty
    6b08adbda8ea7 accel: ethosu: Don't read the U65 rounding mode as a storage mode
    a615bcb8a6327 cgroup/cpuset: Preserve boot-isolated CPUs on partition release
    6bc03f48fdb23 selftests/cgroup: Drop invalid boot isolation comparison
    eb90cb257e079 accel/amdxdna: put the chained BO when its mapping fails
    ed74e8d603df4 accel/amdxdna: reject a command chain that carries no commands
    52f3e086760a9 accel/amdxdna: Remove __counted_by from struct amdxdna_cmd_chain
    4e67627979814 printk: Don't WARN on kthread_run failure.
    876b33d8a9a00 drm/gud: validate GUD_ROTATION_0 is present in supported rotations
    a9b264a563d7f sched_ext: Fix spurious aborts in scx_bpf_dsq_move() on ownership change races
    c16c62c91e5d6 bpf: Fix percpu map update indexing with sparse CPU IDs
    bdc5941f6eeef bpf: Fix BPF_F_CPU validation for sparse CPU IDs
    9f9477ae73de9 bpf: Fix REG INVARIANTS VIOLATION on speculative pointer arithmetic
    cec57b68924b1 selftests/cgroup: Fix cg_run_in_subcgroups ignoring arg parameter
    16d1721b05d50 selftests/cgroup: set the test plan after the setup checks
    ea8de2a0eddfc sched_ext: Fix nonexistent field in sched-ext.rst example
    60d56bf0b14d3 nvmet-rdma: fix queue leak when connect backlog is exceeded
    e0a23e3c8c4c3 nvme: fix racy access to FDP placement id array
    5bcff753943ec nvme: set ns->head in nvme_alloc_ns_head
    ca1cf71288f30 nvme: add context annotations for nvme_subsystem::lock
    171b993a4aed9 nvme-rdma: fix -EIO cleanup order in queue_rq
    c72e81ee46bdd accel/qaic: Address potential out-of-bounds read in resp_worker()
    455184dbe9652 drm/virtio: use the DMA API for resource backing on Xen
    f1050a7d36528 drm/virtio: Fix a NULL vs ERR_PTR() bug in virtio_gpu_user_framebuffer_create()
    0e022ee4f8e0d EDAC/device_sysfs: Use kstrtouint() for poll_msec to prevent truncation
    acca637cf4b4d EDAC/igen6: Fix Raptor Lake-P logged error address
    1714dbdc86676 EDAC/igen6: Fix channel address decode for non-hash mode
    2b3ba2fea2a61 EDAC/igen6: Fix channel selection hash
    083bbc5ae7c2f EDAC/igen6: Fix interleave boundary condition
    53ed9ffdbbf46 RAS/AMD/ATL, EDAC/amd64: Only load ATL when needed
    717137221c7d9 ppp_async: drop the errored frame instead of resetting its headroom
    fe1c294202c72 leds: st1202: Validate pattern input before stopping the sequence
    0c5916a036447 wifi: mt76: mt7921: skip unknown CLC firmware records
    3c505e2af16a9 wifi: mt76: mt7921: validate CLC firmware records
    111aa3934be78 iommu/arm-smmu-v3: Disable implementations during devm teardown

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 139c1daa9f205be98b90c524e72b01b66b0d058e)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/linux-yocto-rt_7.2.bb               |  6 ++---
 .../linux/linux-yocto-tiny_7.2.bb             |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_7.2.bb  | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
index e8e6c885cab..ecce6498f43 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
@@ -15,13 +15,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c3c2a26425ad13ed7d2bee0ff6f11365564bb33d"
-SRCREV_meta ?= "242eecdf2cb368016f92ad5317702b20f71d8c1e"
+SRCREV_machine ?= "6e3aff84e18e0a58ae185f48365bce087aa25319"
+SRCREV_meta ?= "f26871a964ee3984a78f5e8fa1001cf43e551a20"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-7.2;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "7.2.6"
+LINUX_VERSION ?= "7.2.8"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
index fe2666b86d9..c6ab5544bc1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_7.2.inc
 
-LINUX_VERSION ?= "7.2.6"
+LINUX_VERSION ?= "7.2.8"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "2ebaf2d45071d568d23e6570811bd63fb7cde633"
-SRCREV_meta ?= "242eecdf2cb368016f92ad5317702b20f71d8c1e"
+SRCREV_machine ?= "864d1a112ea46c71a55e62cd5e1eac9ef9a4ea6e"
+SRCREV_meta ?= "f26871a964ee3984a78f5e8fa1001cf43e551a20"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_7.2.bb b/meta/recipes-kernel/linux/linux-yocto_7.2.bb
index 55326a647be..39759329ef0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_7.2.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v7.2/standard/base"
 KBRANCH:qemuloongarch64  ?= "v7.2/standard/base"
 KBRANCH:qemumips64 ?= "v7.2/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "3b075480e3eb36dbdbb7459ceb8220e30c168f7f"
-SRCREV_machine:qemuarm64 ?= "2ebaf2d45071d568d23e6570811bd63fb7cde633"
-SRCREV_machine:qemuloongarch64 ?= "2ebaf2d45071d568d23e6570811bd63fb7cde633"
+SRCREV_machine:qemuarm ?= "2fd911abf4b675ed9f8904b8a57b087323bfa2cc"
+SRCREV_machine:qemuarm64 ?= "864d1a112ea46c71a55e62cd5e1eac9ef9a4ea6e"
+SRCREV_machine:qemuloongarch64 ?= "864d1a112ea46c71a55e62cd5e1eac9ef9a4ea6e"
 SRCREV_machine:qemumips ?= "ab0e33fefa2a3d0366b2b8deb7cfb3be2d8dc436"
-SRCREV_machine:qemuppc ?= "2ebaf2d45071d568d23e6570811bd63fb7cde633"
-SRCREV_machine:qemuriscv64 ?= "2ebaf2d45071d568d23e6570811bd63fb7cde633"
-SRCREV_machine:qemuriscv32 ?= "2ebaf2d45071d568d23e6570811bd63fb7cde633"
-SRCREV_machine:qemux86 ?= "2ebaf2d45071d568d23e6570811bd63fb7cde633"
-SRCREV_machine:qemux86-64 ?= "2ebaf2d45071d568d23e6570811bd63fb7cde633"
+SRCREV_machine:qemuppc ?= "864d1a112ea46c71a55e62cd5e1eac9ef9a4ea6e"
+SRCREV_machine:qemuriscv64 ?= "864d1a112ea46c71a55e62cd5e1eac9ef9a4ea6e"
+SRCREV_machine:qemuriscv32 ?= "864d1a112ea46c71a55e62cd5e1eac9ef9a4ea6e"
+SRCREV_machine:qemux86 ?= "864d1a112ea46c71a55e62cd5e1eac9ef9a4ea6e"
+SRCREV_machine:qemux86-64 ?= "864d1a112ea46c71a55e62cd5e1eac9ef9a4ea6e"
 SRCREV_machine:qemumips64 ?= "ab0e33fefa2a3d0366b2b8deb7cfb3be2d8dc436"
-SRCREV_machine ?= "2ebaf2d45071d568d23e6570811bd63fb7cde633"
-SRCREV_meta ?= "242eecdf2cb368016f92ad5317702b20f71d8c1e"
+SRCREV_machine ?= "864d1a112ea46c71a55e62cd5e1eac9ef9a4ea6e"
+SRCREV_meta ?= "f26871a964ee3984a78f5e8fa1001cf43e551a20"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "500df175a7f9e6bc1a9c328590ca5150f84f9ff0"
+SRCREV_machine:class-devupstream ?= "9a66fdc0d7fd55f54235524a73435af99051e46f"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v7.2/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-7.2;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "7.2.6"
+LINUX_VERSION ?= "7.2.8"
 
 PV = "${LINUX_VERSION}+git"
 

