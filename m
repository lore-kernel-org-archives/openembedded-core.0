Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D39F4D58E5F
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 04:56:01 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.153766.1772427355657779698
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 20:55:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WhfnUG8q;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8c710439535so252228185a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Mar 2026 20:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772427355; x=1773032155; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vs2Hlgwkj41BmoZ5CM403Lw2tD5nVMOMnIUxv1+e2Dg=;
        b=WhfnUG8qbcjHjYmMLXOYrRCl3s03nAupNxy7WadJjlmae5Y0XQZwl0OS9fF081QIRP
         0hZ/XG/FXbSG7Wco+JyXGP7UFr/vxTrJ38GJ0+ERALRrPrrbRPSK8lLLn32hi5t52H5T
         Xe9fKciz+fY1JAcDJDPKCp3GTQAGwc/H20cB7RFtp/Gc8pkExzhrjpFZwctZzGT2rgrt
         XgrHzmFhlQS1ZJY5px5NtZI9VRSV8gprGRYVDyIWDtwIIRA2OjQO6myCPhONBIE3FxqK
         Hu4I6IqxEWtd6tRIsm3UiuEd7YzcKCf8UsWSvdaq1vKpxvhGA3An6FsC8FywD618jyct
         PgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772427355; x=1773032155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vs2Hlgwkj41BmoZ5CM403Lw2tD5nVMOMnIUxv1+e2Dg=;
        b=pB2NeeYdXNPEwJ7EhBhxB24RqOuqmfV44JkX0+1PykbCbm3r/VE09BrZhLXd9TA6YO
         tdYUbIjT9tAAgeJ9E29o70t6Tjg2F5nN866Fb4BCU17+x2LtINjcp6/UaY/wTOXMHuGk
         DEyPGRFaj2AmXPWuRh6/aLB1D5sZbUpLABhwsgbDOrT8fSNHnxddPClShYHTHqeuDDJJ
         ZbCzCRE/721vy/hr+hqxn4yKO4gDT+R19+6H4GI5F7EuIm8dS/J1sbOTEGCRJy/sI1E9
         lCkeUluNixZlCooSUc4gByAgO/ceCdpc2oq11L2DTTqraNcJXpZczj+4A4kjYUsHBSse
         +6Hg==
X-Gm-Message-State: AOJu0Yy8L5xECP4LrcDNHTJH8a+g1lF2qNerHwghRteWnlgZmFoZPAV5
	oYI3V2avfFYBO7KRLW3KA/Rp7AO6b49/18mgAxv4cf1NjjKeC2pCYS5Eis5suVYNIOo=
X-Gm-Gg: ATEYQzxOrnHzGQzY8ME4IuAozG2u86rbNCOpplyNr2Dj9gYgGS8rvQgcyvdsC9F4Kot
	D+TW4hb/oddIbVBECNTGuX7nU3yYdw/JSadRcEDH7h5ul3YB5OyslCJqPAtetmWZVPoKlKome4m
	uAUkMEWoNzmO5sad2+qBjcHZxhuRwMQ1/TO0DyWsS33tIEh7ac5w/a3MatMNmgFZZqUJEd1OLNU
	bMN0tlRNZ2gctuowwlj9gKWe5mdMvHAUqae4488AR7InPj4ZB2Xy/aO1VB5IEXK4SxvzanJtSXF
	v69T1I9+7PBKftkQQ3vu3YfHDmo67hx7eVPsZEeLK7MJ22L5i8QrLsbg+TI3wlzycd/1TPW6UCF
	TcFrAzQblAvfVZOREppvtHtyi2jf7+3nuPwVSJ3RthycM50LU/QxNFD8J6Qc1ARQH/u/3Cx1jHA
	96CiKzKBI7g5OMAevkAHw9e9h3YcG+zm6iZP8P0lB0ooUJw50rffqy2O3tzvYqFz9cw2S41oiED
	Ua73lf/UPVyQ5zEmWZHyAtigMKP6XAlU+FU0x6hhpgeQc+rGRcuvx2s51A=
X-Received: by 2002:a05:620a:171f:b0:8c3:650d:577e with SMTP id af79cd13be357-8cbc8e69fb2mr1368514885a.4.1772427354558;
        Sun, 01 Mar 2026 20:55:54 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a017add76sm2488406d6.36.2026.03.01.20.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 20:55:53 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta-yocto-bsp][PATCH 09/10] yocto-bsp: update to v6.18.11
Date: Sun,  1 Mar 2026 23:55:35 -0500
Message-ID: <20260302045537.2153587-10-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302045537.2153587-1-bruce.ashfield@gmail.com>
References: <20260302045537.2153587-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 04:56:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232169

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.18 to the latest korg -stable release that comprises
the following commits:

    ee4fb138af107 Linux 6.18.11
    32f08c3ddd6dd gpio: omap: do not register driver in probe()
    116f7bd8160c6 wifi: rtl8xxxu: fix slab-out-of-bounds in rtl8xxxu_sta_add
    24a253c3aa6d9 PCI: endpoint: Avoid creating sub-groups asynchronously
    60b75407c172e drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free
    ed82e7949f5ca xfs: fix UAF in xchk_btree_check_block_owner
    d741534302f71 erofs: fix UAF issue for file-backed mounts w/ directio option
    1d6bd6183e723 bus: fsl-mc: fix use-after-free in driver_override_show()
    d14e991279831 scsi: qla2xxx: Query FW again before proceeding with login
    f04840512438a scsi: qla2xxx: Free sp in error path to fix system crash
    c068ebbaf5282 scsi: qla2xxx: Delay module unload while fabric scan in progress
    ae49d33bfc08b scsi: qla2xxx: Allow recovery for tape devices
    1a9585e4c58d1 scsi: qla2xxx: Validate sp before freeing associated memory
    1339455044155 wifi: rtw88: Fix alignment fault in rtw_core_enable_beacon()
    46c1d56ad321f hfs: ensure sb->s_fs_info is always cleaned up
    4aa45f841413c nilfs2: Fix potential block overflow that cause system hang
    52505d7f713bf crypto: virtio - Remove duplicated virtqueue_kick in virtio_crypto_skcipher_crypt_req
    e69a7b0a71b65 crypto: virtio - Add spinlock protection with virtqueue notification
    2ed27b5a11743 crypto: omap - Allocate OMAP_CRYPTO_FORCE_COPY scatterlists correctly
    62c89e1992c86 crypto: octeontx - Fix length check to avoid truncation in ucode_load_store
    d75207465eed2 crypto: iaa - Fix out-of-bounds index in find_empty_iaa_compression_mode
    65a0016016e8b ALSA: hda/conexant: Add quirk for HP ZBook Studio G4
    be7a9bcee0ca6 Bluetooth: btusb: Add USB ID 7392:e611 for Edimax EW-7611UXB
    8d76b2488eb3c driver core: enforce device_lock for driver_match_device()
    16c8be3d55441 smb: client: let send_done handle a completion without IB_SEND_SIGNALED
    6bf260ace7301 smb: client: let smbd_post_send_negotiate_req() use smbd_post_send()
    69ce4ae2ab65c smb: client: fix last send credit problem causing disconnects
    cca0526ef2344 smb: client: make use of smbdirect_socket.send_io.bcredits
    9eff83600edf6 smb: client: use smbdirect_send_batch processing
    d059e5fc49755 smb: client: introduce and use smbd_{alloc, free}_send_io()
    1f3e8e2c67cbc smb: client: split out smbd_ib_post_send()
    8786127068d51 smb: client: port and use the wait_for_credits logic used by server
    1fe0f989beb8b smb: client: remove pointless sc->send_io.pending handling in smbd_post_send_iter()
    2b08ca3ab6cc5 smb: client: remove pointless sc->recv_io.credits.count rollback
    b9ec75aba3c8f smb: client: let smbd_post_send() make use of request->wr
    5b69ba9978dd0 smb: client: let recv_done() queue a refill when the peer is low on credits
    f664e6e8a8110 smb: client: make use of smbdirect_socket.recv_io.credits.available
    24082642654f3 smb: server: let send_done handle a completion without IB_SEND_SIGNALED
    85bf0a73831cc smb: server: fix last send credit problem causing disconnects
    5ef18a2e66f2f smb: server: make use of smbdirect_socket.send_io.bcredits
    cea7afb097b00 smb: server: let recv_done() queue a refill when the peer is low on credits
    66c082e3d4651 smb: server: make use of smbdirect_socket.recv_io.credits.available
    88cf40f7b5fb4 smb: smbdirect: introduce smbdirect_socket.send_io.bcredits.*
    e811e60e1cc79 smb: smbdirect: introduce smbdirect_socket.recv_io.credits.available
    cd25e0d809531 smb: server: fix leak of active_num_conn in ksmbd_tcp_new_connection()
    e4a8a96a93d08 ksmbd: add chann_lock to protect ksmbd_chann_list xarray
    71b5e7c528315 ksmbd: fix infinite loop caused by next_smb2_rcv_hdr_off reset in error paths
    c4b9edd559873 smb: client: split cached_fid bitfields to avoid shared-byte RMW races
    1658b66fed206 io_uring: allow io-wq workers to exit when unused
    f02693a40e407 io_uring/io-wq: add exit-on-idle state
    41cec610f6906 Linux 6.18.10
    31b593fbece63 riscv: Add intermediate cast to 'unsigned long' in __get_user_asm
    ecd164120c248 ALSA: usb-audio: Use the right limit for PCM OOB check
    24ad4cfac0b8e ALSA: hda/realtek: Really fix headset mic for TongFang X6AR55xU.
    57bac08056787 spi: tegra114: Preserve SPI mode bits in def_command1_reg
    b8eec12aa666c spi: tegra: Fix a memory leak in tegra_slink_probe()
    2ac3a105e5149 spi: tegra210-quad: Protect curr_xfer check in IRQ handler
    d51554dc05695 spi: tegra210-quad: Protect curr_xfer clearing in tegra_qspi_non_combined_seq_xfer
    3bc293d5b5650 spi: tegra210-quad: Protect curr_xfer in tegra_qspi_combined_seq_xfer
    2d3c0122e9611 spi: tegra210-quad: Protect curr_xfer assignment in tegra_qspi_setup_transfer_one
    51013068438ac spi: tegra210-quad: Move curr_xfer read inside spinlock
    e1777c400b7a9 spi: tegra210-quad: Return IRQ_HANDLED when timeout already processed transfer
    b767cf2d4efc8 regulator: spacemit-p1: Fix n_voltages for BUCK and LDO regulators
    3f9b508b3eecc i2c: imx: preserve error state in block data length handler
    e71e3fa90a151 gpio: loongson-64bit: Fix incorrect NULL check after devm_kcalloc()
    279cb9180510f ASoC: amd: fix memory leak in acp3x pdm dma ops
    8434b351cd4ea ALSA: usb-audio: fix broken logic in snd_audigy2nx_led_update()
    01d2fb15f15c1 firmware: cs_dsp: rate-limit log messages in KUnit builds
    abd66845227c5 firmware: cs_dsp: Factor out common debugfs string read
    b8ad2d53f706a ipv6: Fix ECMP sibling count mismatch when clearing RTF_ADDRCONF
    f3ed399e9aa6f nvme-pci: handle changing device dma map requirements
    3c58f6121863c drm/xe/guc: Fix CFI violation in debugfs access.
    8b68a45f9722f netfilter: nf_tables: fix inverted genmask check in nft_map_catchall_activate()
    32ddd09d1103e hwmon: (occ) Mark occ_init_attribute() as __printf
    8abb71d4a1dce drm/xe/pm: Disable D3Cold for BMG only on specific platforms
    7c5db0957a230 drm/xe/query: Fix topology query pointer advance
    184a84f03b5e6 drm/mgag200: fix mgag200_bmc_stop_scanout()
    2e5edb69e5d0e net: gro: fix outer network offset
    589a530ae44d0 net: add proper RCU protection to /proc/net/ptype
    9f42cb8fafd6d net: ethernet: adi: adin1110: Check return value of devm_gpiod_get_optional() in adin1110_check_spi()
    100f3bf914612 drm/amd/display: fix wrong color value mapping on MCM shaper LUT
    0031f8829c7fb wifi: iwlwifi: mvm: pause TCM on fast resume
    9b9f52f052f49 wifi: iwlwifi: mld: cancel mlo_scan_start_wk
    5a2b4b0e9c003 net: enetc: Convert 16-bit register reads to 32-bit for ENETC v4
    566ea5769ec27 net: enetc: Convert 16-bit register writes to 32-bit for ENETC v4
    f346253e5fd95 net: enetc: Remove CBDR cacheability AXI settings for ENETC v4
    d98745c68023f net: enetc: Remove SI/BDR cacheability AXI settings for ENETC v4
    c175b1eaf729e tipc: use kfree_sensitive() for session key material
    f3931416cbdd0 net: rss: fix reporting RXH_XFRM_NO_CHANGE as input_xfrm for contexts
    2718ae6af7445 linkwatch: use __dev_put() in callers to prevent UAF
    64cf3016234ce io_uring/zcrx: fix page array leak
    fad7334082cd1 net: don't touch dev->stats in BPF redirect paths
    8860ddf0e07be hwmon: (acpi_power_meter) Fix deadlocks related to acpi_power_meter_notify()
    1b2efc593dca9 net: usb: r8152: fix resume reset deadlock
    cdedcd5aa3f3c macvlan: fix error recovery in macvlan_common_newlink()
    c9e4daf62ca07 net: sfp: Fix quirk for Ubiquiti U-Fiber Instant SFP module
    8553bf2e09828 i40e: drop udp_tunnel_get_rx_info() call from i40e_open()
    07bb882485f89 ice: drop udp_tunnel_get_rx_info() call from ndo_open()
    7565d4df66b66 ice: Fix PTP NULL pointer dereference during VSI rebuild
    ef72678c9df0e ice: PTP: fix missing timestamps on E825 hardware
    6801ef140fc33 ice: fix missing TX timestamps interrupts on E825 devices
    1b381a638e185 dpaa2-switch: add bounds check for if_id in IRQ handler
    4640fa5ad5e1a net: liquidio: Fix off-by-one error in VF setup_nic_devices() cleanup
    293eaad0d6d6b net: liquidio: Fix off-by-one error in PF setup_nic_devices() cleanup
    d028147ae0640 net: liquidio: Initialize netdev pointer before queue setup
    155eb99aff292 dpaa2-switch: prevent ZERO_SIZE_PTR dereference when num_ifs is zero
    8a672f177ebe1 net/sched: cls_u32: use skb_header_pointer_careful()
    9b186feb75267 net: add skb_header_pointer_careful() helper
    f8611a7981cd0 hwmon: (dell-smm) Add Dell G15 5510 to fan control whitelist
    9ee608a64e37c smb/client: fix memory leak in smb2_open_file()
    faff38ebbfe63 platform/x86/intel/tpmi/plr: Make the file domain<n>/status writeable
    9029ccfab2ca9 platform/x86: hp-bioscfg: Skip empty attribute names
    6c45a5a7e1e3b platform/x86: intel_telemetry: Fix PSS event register mask
    f93ae43780b75 platform/x86: toshiba_haps: Fix memory leaks in add/remove routines
    245ff08e261ce Revert "drm/amd/display: pause the workload setting in dm"
    98bf5bc8cb8cb tracing: Avoid possible signed 64-bit truncation
    6dd87f6afe9e9 ALSA: hda/realtek: ALC269 fixup for Lenovo Yoga Book 9i 13IRU8 audio
    3228b2eceb6c3 btrfs: reject new transactions if the fs is fully read-only
    b4b065a880997 wifi: mac80211: don't increment crypto_tx_tailroom_needed_cnt twice
    ccb3c75d57039 btrfs: sync read disk super and set block size
    7a1bec39c014e wifi: mac80211: correctly check if CSA is active
    990e40fb1d111 btrfs: fix Wmaybe-uninitialized warning in replay_one_buffer()
    3835e49e146a4 scsi: target: iscsi: Fix use-after-free in iscsit_dec_conn_usage_count()
    108cbf2b7d295 ALSA: hda/realtek: Fix headset mic for TongFang X6AR55xU
    1d5f2329ab4df io_uring/rw: free potentially allocated iovec on cache put failure
    c65a1a72a41e4 riscv: Use 64-bit variable for output in __get_user_asm
    4530f4e4d0e6a scsi: target: iscsi: Fix use-after-free in iscsit_dec_session_usage_count()
    8a7ef96e6af91 wifi: cfg80211: Fix bitrate calculation overflow for HE rates
    36e88bd40a8c0 spi: intel-pci: Add support for Nova Lake SPI serial flash
    7178b36de1850 ALSA: usb-audio: Add delay quirk for MOONDROP Moonriver2 Ti
    f08f2d2907675 regmap: maple: free entry on mas_store_gfp() failure
    7d4c9c448c2b3 spi: hisi-kunpeng: Fixed the wrong debugfs node name in hisi_spi debugfs initialization
    66b73d3f2cfc7 ALSA: hda/tas2781: Add newly-released HP laptop
    e6ce61e01c9a2 ASoC: tlv320adcx140: Propagate error codes during probe
    3ba3d959c17aa ASoC: amd: yc: Fix microphone on ASUS M6500RE
    1c90f930e7b41 nvmet-tcp: fixup hang in nvmet_tcp_listen_data_ready()
    62932d9ed639a ALSA: usb-audio: Prevent excessive number of frames
    e810b290922c5 nvme-fc: release admin tagset if init fails
    a883080063f97 ASoC: simple-card-utils: Check device node before overwrite direction
    61fa85497c7b7 ASoC: davinci-evm: Fix reference leak in davinci_evm_probe
    9f665b3c3d9a1 dmaengine: mmp_pdma: Fix race condition in mmp_pdma_residue()
    921903d73967f ASoC: Intel: sof_sdw: Add new quirks for PTL on Dell with CS42L43
    74309a4b0ffc7 wifi: mac80211: collect station statistics earlier when disconnect
    da1880c7b6b83 HID: Elecom: Add support for ELECOM M-XT3DRBK (018C)
    71434e45bf124 HID: logitech: add HID++ support for Logitech MX Anywhere 3S
    b1f8285bc8e35 riscv: trace: fix snapshot deadlock with sbi ecall
    151589d15ee87 ring-buffer: Avoid softlockup in ring_buffer_resize() during memory free
    cd7ff7fd3e4b7 drm/amd/pm: Disable MMIO access during SMU Mode 1 reset
    ecb8653a8fe9d HID: Apply quirk HID_QUIRK_ALWAYS_POLL to Edifier QR30 (2d99:a101)
    1e84a807c98a7 HID: Intel-thc-hid: Intel-thc: Add safety check for reading DMA buffer
    2124279f1f8c3 HID: i2c-hid: fix potential buffer overflow in i2c_hid_get_report()
    6e2108daed94e HID: quirks: Add another Chicony HP 5MP Cameras to hid_ignore_list
    645671377158f drm/amd/display: Reduce number of arguments of dcn30's CalculatePrefetchSchedule()
    eb5d6dedadd66 netfilter: replace -EEXIST with -EBUSY
    ddab2d0f93200 PCI: qcom: Remove ASPM L0s support for MSM8996 SoC
    3210077ed2648 ALSA: hda/realtek: add HP Laptop 15s-eq1xxx mute LED quirk
    5b9bbe3d7bb90 x86/sev: Disable GCOV on noinstr object
    75f1f512b1567 ALSA: hda/realtek: Add quirk for Acer Nitro AN517-55
    747b9a7d4c712 HID: playstation: Center initial joystick axes to prevent spurious events
    7ae5b35148119 HID: intel-ish-hid: Reset enum_devices_done before enumeration
    8b44e75379510 riscv: Sanitize syscall table indexing under speculation
    28768bd3abf99 btrfs: fix reservation leak in some error paths when inserting inline extent
    a206870513cda HID: multitouch: add MT_QUIRK_STICKY_FINGERS to MT_CLS_VTL
    ea5ef771f3c26 HID: intel-ish-hid: Update ishtp bus match to support device ID table
    6de3a371a8b9f btrfs: do not free data reservation in fallback from inline due to -ENOSPC
    70dd3513ed6ac smb/server: fix refcount leak in parse_durable_handle_context()
    c2ed4f71e9288 LoongArch: Enable exception fixup for specific ADE subcode
    2bb9c8a77df50 io_uring: use GFP_NOWAIT for overflow CQEs on legacy rings
    4665e52bde3b1 smb/server: fix refcount leak in smb2_open()
    0107b18cd8ac1 md: suspend array while updating raid_disks via sysfs
    9531210f348aa LoongArch: Set correct protection_map[] for VM_NONE/VM_SHARED
    fdda836fcee6f smb/server: call ksmbd_session_rpc_close() on error path in create_smb2_pipe()
    f309b2c7df659 block,bfq: fix aux stat accumulation destination
    86acdc1791944 platform/x86: dell-lis3lv02d: Add Latitude 5400
    ff6892ea544c4 wifi: iwlwifi: Implement settime64 as stub for MVM/MLD PTP
    6b7c60feab3c6 net: usb: sr9700: support devices with virtual driver CD
    10d3ff7e5812c wifi: mac80211: don't WARN for connections on invalid channels
    689a7980e4788 wifi: wlcore: ensure skb headroom before skb_push
    e0bd226804f8e wifi: mac80211: ocb: skip rx_no_sta when interface is not joined
    abd219fd48b11 tracing: Fix ftrace event field alignments
    116ffca92dc4d binderfs: fix ida_alloc_max() upper bound
    e9bcfe865188a binder: fix BR_FROZEN_REPLY error log
    a6050dedb6f1c binder: fix UAF in binder_netlink_report()
    287221c5e0707 rust_binderfs: fix ida_alloc_max() upper bound
    685bb05d307ac rust_binder: add additional alignment checks
    598fe3ff32e43 rust_binder: correctly handle FDA objects of length zero
    13de38aa3ea7a sched/fair: Have SD_SERIALIZE affect newidle balancing
    de7cb4282dafc sched/fair: Skip sched_balance_running cmpxchg when balance is not due
    3a15c519d2b0f bus: mhi: host: pci_generic: Add Telit FE990B40 modem support
    fa2274bb17a4a treewide: Drop pci_save_state() after pci_restore_state()
    71c50e60421bb PCI/ERR: Ensure error recoverability at all times
    1a893bd719121 hwmon: (gpio-fan) Allow to stop FANs when CONFIG_PM is disabled
    37751b6d0b6b5 hwmon: (gpio-fan) Fix set_rpm() return value
    4385b2f284354 KVM: Don't clobber irqfd routing type when deassigning irqfd
    7a245ef476ffb KVM: selftests: Add -U_FORTIFY_SOURCE to avoid some unpredictable test failures
    a82647e1a9499 net: spacemit: k1-emac: fix jumbo frame support
    d5b3a66986697 net: cpsw_new: Execute ndo_set_rx_mode callback in a work queue
    488009aa62bb1 net: cpsw: Execute ndo_set_rx_mode callback in a work queue
    ef763b480a3de nouveau/gsp: fix suspend/resume regression on r570 firmware
    a20887d5239a3 nouveau/gsp: use rpc sequence numbers properly.
    9cc8caba82c2b nouveau: add a third state to the fini handler.
    5f645222eb30c Revert "drm/amd: Check if ASPM is enabled from PCIe subsystem"
    7b6a0f121d502 mm, shmem: prevent infinite loop on truncate race
    41a7b9ab855c8 gve: Correct ethtool rx_dropped calculation
    11f8311f69e4c gve: Fix stats report corruption on queue count change
    e9cdd54797dc2 drm/amd: Set minimum version for set_hw_resource_1 on gfx11 to 0x52
    d3081353acaa6 cgroup/dmem: avoid pool UAF
    5c38604abbfa5 cgroup/dmem: avoid rcu warning when unregister region
    c13816e8fa23d cgroup/dmem: fix NULL pointer dereference when setting max
    e258ed369c9e0 ceph: fix oops due to invalid pointer for kfree() in parse_longname()
    35e6fd0d5bc30 ARM: 9468/1: fix memset64() on big-endian
    46dfdb6f7a79d rbd: check for EOD after exclusive lock is ensured to be held
    57b36ffc8881d ceph: fix NULL pointer dereference in ceph_mds_auth_match()
    e8af57e090790 mm/slab: Add alloc_tagging_slab_free_hook for memcg_alloc_abort_single
    cbc03ce3e6ce7 procfs: avoid fetching build ID while holding VMA lock
    eb54ce033b344 pmdomain: imx8m-blk-ctrl: fix out-of-range access of bc->domains
    11ca03ce17d7d pmdomain: imx8mp-blk-ctrl: Keep usb phy power domain on for system wakeup
    5171a3dddf427 pmdomain: imx: gpcv2: Fix the imx8mm gpu hang due to wrong adb400 reset
    72129d55be9ce pmdomain: imx8mp-blk-ctrl: Keep gpc power domain on for system wakeup
    d72563e402bab pmdomain: qcom: rpmpd: fix off-by-one error in clamping to the highest state
    5727ccf9d19ca ALSA: aloop: Fix racy access at PCM trigger
    21816bbc8492f platform/x86: intel_telemetry: Fix swapped arrays in PSS output
    b5a02290ee3a4 KVM: x86: Explicitly configure supported XSS from {svm,vmx}_set_cpu_caps()
    a94b956bb7272 x86/kfence: fix booting on 32bit non-PAE systems
    feb603a69f830 x86/vmware: Fix hypercall clobbers
    ab200d71553bd nvmet-tcp: add bounds checks in nvmet_tcp_build_pdu_iovec

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
index 40d0b49..3776bb4 100644
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
@@ -8,4 +8,4 @@ KMACHINE:genericx86 ?= "common-pc"
 KMACHINE:genericx86-64 ?= "common-pc-64"
 
 KBRANCH:genericarm64 ?= "v6.18/standard/genericarm64"
-SRCREV_machine:genericarm64 ?= "04436cb2ef497ba23cb52e16f0e5caa54a76904a"
+SRCREV_machine:genericarm64 ?= "9e6d72474d6f996cd4ec8efac6b5ade5c9b6c2c7"
-- 
2.43.0


