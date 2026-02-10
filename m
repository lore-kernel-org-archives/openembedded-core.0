Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13DCAE94625
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 03:05:01 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11967.1770692696859615417
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 19:04:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IOD2SX7b;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-50336cffef9so46323191cf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 19:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770692695; x=1771297495; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/sonABD183Akl9GHwGIqrLanNyuDVj2SS5vI/lQ/qWc=;
        b=IOD2SX7bIvWEuJkqf9qj/4UE9tbsk3dbwQwhlVihMO161DAlYcYIx2ArXPocLGHunv
         Wi3xDE27TNzh/MxLdVyxOGDs2UH5TKp3nsZq661Tmymj+MD9Bc5bQo0sXPxOJDpbNeSt
         WK1tqXC7Gx1h/jRL2p6yxQWCziA/oSZbs4I0/SeUvHjVgAu8ZuKsUDYnM+1vLF7clMsc
         K0kAoNOTnrFCV8+TGjlLRdDmWfD/r47ig40gpegi7RX+9UQl+7LnhhY2WJMZMtVZwn4Z
         nec4KwaZ6cs8Mm292PYzNsHr9R357hsXN4Lbv5BUGcs1ZsULPk13vL89fgNH/Y0PV2Y3
         aSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770692695; x=1771297495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/sonABD183Akl9GHwGIqrLanNyuDVj2SS5vI/lQ/qWc=;
        b=knZhVf7UqZDTawwERhFjzUIbKtHb0Gq2BoRi1+1EK7boWYzUImmCL0ccYaxX6cwj3+
         yLF4qOrwSL2cbH7AgKOocNXt3/YtQWkXXuez4ZH2309i12x8e5C2Jc+64IdHNr5cXRhu
         pGZHC4JYjts54MKrV3qtE7t3KcHAC4vZCATr4QrwdhJpIP5yaJj8FqmUfMkFVqEwzFPO
         7f2XT7bUaIm5YEm4U9TcH8P2qg2UA99Yz1dgx8Ze2vk8LK5vQOvDWldK3qYqN77BY3qO
         YLaWv4BEe0pfPwqpWOtbVGhwmzvTYtNojOZLIM8ILwG6+4bLI9G3GvSZDgb7IsYeP4br
         UnNA==
X-Gm-Message-State: AOJu0YxiYNRdgQp3dNRZewhUTCRnIKrkzJYKW1S5b69WKotTczrzyt7B
	0QoitKFhy3U/kamyLo5VN0zi5/s7kR/Pfvl0rNqz1EoR6UZcn/YnH6VyYFF1gYp5
X-Gm-Gg: AZuq6aIVdlGq+NmRIRPcRi2rLudI6BYNDtrt93hVHQAHXMpdIW59x+cJGVUW/oXcxef
	ya5lCHkK5DHUEHmhjap3ED88tGN8c1E5K3Q2MqFR1A1FcqkXBd95SNZrQQGsY8vDtLYnydeI3zP
	812tYfKsnMmeQiR3RGv05AdZA1aHjkCurYj7DGxrcS8aFKv+e8n5ebBAKLxzQBBDqSjCi9BhGZW
	rn9H6l8PASdfGKIqtVqOTTEFnjDNAyKcZQWH0buG+lEwcmwXipVyYPaczVXaytGDQ/osqBP2mk7
	U9d/mMmpBlvEda8FnBodjaaq6FfORdw0uXNiEOutcDOYy2YyCHFQo93+kvc4HZjAxPSz3WpP4eH
	seoHHlpeuCvis1QRuVu5v0XfODxEyPJKdlkR3u2qb+jt3SLTPuKyWMPjlq1IhO/6k2c7qlM1PK4
	Cdj9F1EGqxjnYiwfANyfYWJ2Jcl31WmzBRc1byFUGUuTrFcSIaegTM6xKkC2rnO+0+X4M5QC58I
	ZWWeYMMwlcIpWqhhQgcrsZYzdgxN3BiEeBIXV/T1cMYDu5qTY5mi3amN3g=
X-Received: by 2002:a05:622a:1883:b0:4f3:5816:bd8d with SMTP id d75a77b69052e-50673d85fc7mr7886341cf.62.1770692694944;
        Mon, 09 Feb 2026 19:04:54 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5063928e436sm88595551cf.17.2026.02.09.19.04.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 19:04:53 -0800 (PST)
From: bruce.ashfield@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [meta][kirkstone][PATCH 03/05] linux-yocto/5.15: update to v5.15.197
Date: Mon,  9 Feb 2026 22:04:46 -0500
Message-ID: <20260210030448.1344854-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210030448.1344854-1-bruce.ashfield@gmail.com>
References: <20260210030448.1344854-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 03:05:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230832

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    68efe5a6c16a Linux 5.15.197
    3b7841a78357 libbpf: Fix invalid return address register in s390
    46d78c07ce40 libbpf, riscv: Use a0 for RC register
    9e11d30ab096 libbpf: Fix riscv register names
    aadc10434cd1 selftests/bpf: Don't rely on preserving volatile in PT_REGS macros in loop3
    a5d954802bda scsi: pm80xx: Set phy->enable_completion only when we
    f7b814a132c5 Bluetooth: Add more enc key size check
    4df96f1f47a4 usb: typec: ucsi: psy: Set max current to zero when disconnected
    cd5e86e34c66 usb: renesas_usbhs: Fix synchronous external abort on unbind
    bd6a1b29fa31 usb: renesas_usbhs: Convert to platform remove callback returning void
    d146e96fef87 smb: client: fix memory leak in cifs_construct_tcon()
    7ee8f015eb47 mptcp: Fix proto fallback detection with BPF
    dad1e44ed940 mptcp: avoid unneeded subflow-level drops
    5bd1d0ca17f0 selftests: mptcp: join: rm: set backup flag
    85cc2f990287 staging: rtl8712: Remove driver using deprecated API wext
    f22c55a20a2d libceph: prevent potential out-of-bounds writes in handle_auth_session_key()
    05ec43e9a9de libceph: fix potential use-after-free in have_mon_and_osd_map()
    09092269cb76 drm/amd/display: Check NULL before accessing
    c9a315a56da2 drm: sti: fix device leaks at component probe
    6176101b519f USB: serial: option: add support for Rolling RW101R-GL
    6738408111c2 USB: serial: ftdi_sio: add support for u-blox EVK-M101
    593d93b871dc xhci: dbgtty: Fix data corruption when transmitting data form DbC to host
    67192e8cb7f9 usb: dwc3: Fix race condition between concurrent dwc3_remove_requests() call paths
    66ac05e7b0d6 usb: uas: fix urb unmapping issue when the uas device is remove during ongoing data transfer
    26e9b5da3231 usb: storage: sddr55: Reject out-of-bound new_pba
    4aa7426f5326 USB: storage: Remove subclass and protocol overrides from Novatek quirk
    4ba515dfff7e usb: storage: Fix memory leak in USB bulk transport
    5a1628283cd9 usb: gadget: f_eem: Fix memory leak in eem_unwrap
    7fb4b54bbf07 usb: cdns3: Fix double resource release in cdns3_pci_probe
    a4c4118c2af2 most: usb: fix double free on late probe failure
    1f9ba65b019f serial: amba-pl011: prefer dma_mapping_error() over explicit address checking
    354fb03002da firmware: stratix10-svc: fix bug in saving controller data
    113f10c86d7d slimbus: ngd: Fix reference count leak in qcom_slim_ngd_notify_slaves
    db0835dfac45 thunderbolt: Add support for Intel Wildcat Lake
    5a0dcabc8a14 drivers/usb/dwc3: fix PCI parent check
    ed69c3db499c dm-verity: fix unreliable memory allocation
    6fdcd310f92a can: sun4i_can: sun4i_can_interrupt(): fix max irq loop handling
    e36369dfa2e7 can: sja1000: fix max irq loop handling
    bd1415efbab5 atm/fore200e: Fix possible data race in fore200e_open()
    19f3ace94943 MIPS: mm: Prevent a TLB shutdown on initial uniquification
    aad9d048a321 iio: accel: bmc150: Fix irq assumption regression
    17a38b85226c iio:common:ssp_sensors: Fix an error handling path ssp_probe()
    57f759d399e7 iio: imu: st_lsm6dsx: fix array size for st_lsm6dsx_settings fields
    5b9790d2009e Revert "perf/x86: Always store regs->ip in perf_callchain_kernel()"
    891775b1b4ed spi: bcm63xx: fix premature CS deassertion on RX-only transactions
    f231314b64c5 mailbox: mailbox-test: Fix debugfs_create_dir error checking
    b0c4d5135b04 net: atlantic: fix fragment overflow handling in RX path
    05c51c116e0b net: dsa: sja1105: fix SGMII linking at 10M or 100M but not passing traffic
    0bd2b12b3ca9 net: dsa: sja1105: simplify static configuration reload
    1989e6ecee91 net: dsa: sja1105: Convert to mdiobus_c45_read
    18ef3ad1bb57 net: sxgbe: fix potential NULL dereference in sxgbe_rx()
    3c11ac20b5fd net/mlx5e: Fix validation logic in rate limiting
    58a8e250d5b6 net: aquantia: Add missing descriptor cache invalidation on ATL2
    15d560cdf5b3 platform/x86: intel: punit_ipc: fix memory corruption
    4475bac8224c Bluetooth: SMP: Fix not generating mackey and ltk when repairing
    69c7825df64e can: kvaser_usb: leaf: Fix potential infinite loop in command parsers
    0e2d3a8d9fff Revert "block: don't add or resize partition on the disk with GENHD_FL_NO_PART"
    91db2663893a Revert "block: Move checking GENHD_FL_NO_PART to bdev_add_partition()"
    0b6a100efd9b mptcp: do not fallback when OoO is present
    e2d1ad207174 mptcp: fix a race in mptcp_pm_del_add_timer()
    2cc425276ccb mptcp: fix premature close in case of fallback
    4c3d91386d18 mptcp: fix ack generation for fallback msk
    fab9232b3f27 dt-bindings: pinctrl: toshiba,visconti: Fix number of items in groups
    444c875c347c ata: libata-scsi: Fix system suspend for a security locked drive
    015b71996269 Input: pegasus-notetaker - fix potential out-of-bounds access
    7bf70ce0a08e Input: remove third argument of usb_maxpacket()
    78acf73dfc30 usb: deprecate the third argument of usb_maxpacket()
    c22cedbc18dd mptcp: Disallow MPTCP subflows from sockmap
    4a4f32f3185a selftests: mptcp: connect: fix fallback note due to OoO
    f3737fc3b8d9 pmdomain: samsung: plug potential memleak during probe
    582f48d22eb5 pmdomain: arm: scmi: Fix genpd leak on provider registration failure
    1d3f3d4c1faf pmdomain: imx: Fix reference count leak in imx_gpc_remove
    890472d6fbf0 net: netpoll: fix incorrect refcount handling causing incorrect cleanup
    e9af27d1880a mmc: sdhci-of-dwcmshc: Change DLL_STRBIN_TAPNUM_DEFAULT to 0x4
    e24a45da635b net: qede: Initialize qede_ll_ops with designated initializer
    c993fd02ba47 btrfs: fix crash on racing fsync and size-extending write into prealloc
    bff4d06c38a7 btrfs: add helper to truncate inode items when logging inode
    707d49dd441a Makefile.compiler: replace cc-ifversion with compiler-specific macros
    4c019e93f0e5 uio_hv_generic: Set event for all channels on the device
    80fe72069168 tracing/tools: Fix incorrcet short option in usage text for --threads
    3afeb909c3e2 net: ethernet: ti: netcp: Standardize knav_dma_open_channel to return NULL on error
    75ccdb4afe41 ALSA: usb-audio: fix uac2 clock source at terminal parser
    bb1c19636aed mm/secretmem: fix use-after-free race in fault handler
    2ef178413183 mm/mm_init: fix hash table order logging in alloc_large_system_hash()
    dcf80cb1bf88 kconfig/nconf: Initialize the default locale at startup
    87297ab1e783 kconfig/mconf: Initialize the default locale at startup
    699c6cc0f18e net: tls: Cancel RX async resync request on rcd_delta overflow
    fbbcd769c800 selftests: net: use BASH for bareudp testing
    804b5b8e3545 scsi: core: Fix a regression triggered by scsi_host_busy()
    674329151458 vsock: Ignore signal/timeout on connect() if already established
    ecbb12caf399 net: qlogic/qede: fix potential out-of-bounds read in qede_tpa_cont() and qede_tpa_end()
    597bbbe023d9 kernel.h: Move ARRAY_SIZE() to a separate header
    ca4452aa69ab platform/x86/intel/speed_select_if: Convert PCIBIOS_* return codes to errnos
    7616e2eee679 s390/ctcm: Fix double-kfree
    f95bef5ba0b8 net: openvswitch: remove never-working support for setting nsh fields
    20d7e6bce8e2 net: dsa: hellcreek: fix missing error handling in LED registration
    ba8d3df04c00 mlxsw: spectrum: Fix memory leak in mlxsw_sp_flower_stats()
    5fb232c76334 drm/tegra: dc: Fix reference leak in tegra_dc_couple()
    99908e2d6012 mptcp: fix race condition in mptcp_schedule_work()
    7536472a4575 MIPS: Malta: Fix !EVA SOC-it PCI MMIO
    f449a1edd7a1 scsi: target: tcm_loop: Fix segfault in tcm_loop_tpg_address_show()
    109afbd88ecc scsi: sg: Do not sleep in atomic context
    60ba31330faf nvme: nvme-fc: Ensure ->ioerr_work is cancelled in nvme_fc_delete_ctrl()
    4ce5218b1012 Input: imx_sc_key - fix memory corruption on unload
    729d21c82c1b Input: cros_ec_keyb - fix an invalid memory access
    630360c6724e be2net: pass wrb_params in case of OS2BMC
    f2e52a9d10d8 exfat: check return value of sb_min_blocksize in exfat_read_boot_sector
    9c58c64ec412 mtd: rawnand: cadence: fix DMA device NULL pointer dereference
    de9dc8cbeea0 HID: quirks: work around VID/PID conflict for 0x4c4a/0x4155
    652b24f07bae net/sched: act_connmark: handle errno on tcf_idr_check_alloc
    b70c24827e11 isdn: mISDN: hfcsusb: fix memory leak in hfcsusb_probe()
    bf51f26c5bcc EDAC/altera: Use INTTEST register for Ethernet and USB SBE injection
    76eb3ac2f01a EDAC/altera: Handle OCRAM ECC enable after warm reset
    4b63d3858a1e spi: Try to get ACPI GPIO IRQ earlier
    8af069dc2fbf ALSA: usb-audio: Fix missing unlock at error path of maxpacksize check
    217d47255a2e ALSA: usb-audio: Fix potential overflow of PCM transfer buffer
    4cba73c4c892 fs/proc: fix uaf in proc_readdir_de()
    298f1e0694ab ipv4: route: Prevent rt_bind_exception() from rebinding stale fnhe
    5fb4722507b7 strparser: Fix signed/unsigned mismatch bug
    3b9447e68777 gcov: add support for GCC 15
    b114996a095d NFSD: free copynotify stateid in nfs4_free_ol_stateid()
    d0ee0b42a9c0 HID: hid-ntrig: Prevent memory leak in ntrig_report_version()
    4681960bc0f4 netfilter: nf_tables: reject duplicate device on updates
    cbbe9170ca2a mtd: onenand: Pass correct pointer to IRQ handler
    20067f737dc0 lib/crypto: arm/curve25519: Disable on CPU_BIG_ENDIAN
    b69f19244c2b mm/ksm: fix flag-dropping behavior in ksm_madvise
    1a6ed803c4b1 mptcp: pm: in-kernel: C-flag: handle late ADD_ADDR
    c4cdd143c359 bpf: Add bpf_prog_run_data_pointers()
    9f282104627b ALSA: usb-audio: Fix NULL pointer dereference in snd_usb_mixer_controls_badd
    6ec3bfe0ad73 NFSv4: Fix an incorrect parameter when calling nfs4_call_sync()
    709e5c088f9c drm/vmwgfx: Validate command header size against SVGA_CMD_MAX_DATASIZE
    bfa4f33f0a43 ASoC: cs4271: Fix regulator leak on probe failure
    ee29c2319ee8 regulator: fixed: fix GPIO descriptor leak on register failure
    5c1fd2b81e13 acpi,srat: Fix incorrect device handle check for Generic Initiator
    9d1d7858fc5b Bluetooth: L2CAP: export l2cap_chan_hold for modules
    8b1551cacb66 hsr: Fix supervision frame sending on HSRv0
    f8706e15710f net_sched: limit try_bulk_dequeue_skb() batches
    5af7ec404e85 net/mlx5e: Fix wraparound in rate limiting for values above 255 Gbps
    727f158d9a8a net/mlx5e: Fix maxrate wraparound in threshold between units
    37f0680887c5 net: sched: act_ife: initialize struct tc_ife to fix KMSAN kernel-infoleak
    218b67c8c824 net: sched: act_connmark: initialize struct tc_ife to fix kernel leak
    def0860b2caf net_sched: act_connmark: use RCU in tcf_connmark_dump()
    0d14e8ba20cf net/sched: act_connmark: transition to percpu stats and rcu
    b99642817f60 net: sched: act_connmark: get rid of tcf_connmark_walker and tcf_connmark_search
    6a45a97e0099 net: sched: act: move global static variable net_id to tc_action_ops
    659e94c35a3f wifi: mac80211: skip rate verification for not captured PSDUs
    1040834078ac net: mdio: fix resource leak in mdiobus_register_device()
    51b8f0ab888f tipc: Fix use-after-free in tipc_mon_reinit_self().
    8a695769c1e8 net/smc: fix mismatch between CLC header and proposal
    abb086b9a95d sctp: prevent possible shift-out-of-bounds in sctp_transport_update_rto
    17ef29586b76 Bluetooth: 6lowpan: Don't hold spin lock over sleeping functions
    2f2b940e7fa3 Bluetooth: 6lowpan: fix BDADDR_LE vs ADDR_LE_DEV address type confusion
    d566e9a2bfc8 Bluetooth: 6lowpan: reset link-local header on ipv6 recv path
    7a6d1e740220 Bluetooth: btusb: reorder cleanup in btusb_disconnect to avoid UAF
    d11c10bce6f4 net: fec: correct rx_bytes statistic for the case SHIFT16 is set
    dd60d0ba60f8 ASoC: max98090/91: fixed max98091 ALSA widget powering up/down
    652585576866 NFS: check if suid/sgid was cleared after a write as needed
    9727b5dc98c3 HID: quirks: avoid Cooler Master MM712 dongle wakeup bug
    d2560884113c NFS4: Fix state renewals missing after boot
    e5d5b4228e05 RISC-V: clear hot-unplugged cores from all task mm_cpumasks to avoid rfence errors
    be5a8537b2b9 compiler_types: Move unused static inline functions warning to W=2
    e988634d7aae drm/i915: Avoid lock inversion when pinning to GGTT on CHV/BXT+VTD
    7d316c3c9e53 selftests: netdevsim: set test timeout to 10 minutes
    3694a618609b extcon: adc-jack: Cleanup wakeup source only if it was enabled
    d3eaf1052cd8 lib/crypto: curve25519-hacl64: Fix older clang KASAN workaround for GCC
    3a9f46f5d467 rtc: rx8025: fix incorrect register reference
    38771ab159d9 tracing: Fix memory leaks in create_field_var()
    a304aa581895 bnxt_en: Fix a possible memory leak in bnxt_ptp_init
    25979f34feec bnxt_en: PTP: Refactor PTP initialization functions
    4e6b9004f01d net: usb: qmi_wwan: initialize MAC header offset in qmimux_rx_fixup
    82b5ddac0843 sctp: Hold sock lock while iterating over address list
    72e3fea68eac sctp: Prevent TOCTOU out-of-bounds write
    ad5ddc33af9f sctp: Hold RCU read lock while iterating over address list
    6618c36f6d86 net: dsa: b53: stop reading ARL entries if search is done
    ae52ba1ad2ed net: dsa: b53: fix enabling ip multicast
    cd8c2419b50b net: dsa: b53: fix resetting speed and pause on forced link
    48df5cc7fd7c net: vlan: sync VLAN features with lower device
    82acad39d05c selftests: netdevsim: Fix ethtool-coalesce.sh fail by installing ethtool-common.sh
    f3903664c883 netdevsim: add Makefile for selftests
    c2ce8d37e49e selftests/net: use destination options instead of hop-by-hop
    32c3e1cbc2e6 selftests/net: fix GRO coalesce test and add ext header coalesce tests
    e4603c1c4fd1 selftests/net: fix out-of-order delivery of FIN in gro:tcp test
    a8d549eb5aca net: dsa: tag_brcm: legacy: fix untagged rx on unbridged ports for bcm63xx
    f8d974a0e8c2 riscv: ptdump: use seq_puts() in pt_dump_seq_puts() macro
    53c7a2110285 Revert "wifi: ath10k: avoid unnecessary wait for service ready message"
    b345e06f2d35 ALSA: hda/realtek: Audio disappears on HP 15-fc000 after warm boot again
    676ee2061f72 ceph: add checking of wait_for_completion_killable() return value
    8bff07a8fc0a ASoC: meson: aiu-encoder-i2s: fix bit clock polarity
    1943b69e87b0 fbdev: Add bounds checking in bit_putcs to fix vmalloc-out-of-bounds
    6da480c32392 ACPI: property: Return present device nodes only on fwnode interface
    a66596cf5643 9p: sysfs_init: don't hardcode error to ENOMEM
    879f6a7e75c3 cpufreq: tegra186: Initialize all cores to max frequencies
    435b42a10995 9p: fix /sys/fs/9p/caches overwriting itself
    66f257db400a clk: ti: am33xx: keep WKUP_DEBUGSS_CLKCTRL enabled
    c50651c205f6 clk: at91: clk-master: Add check for divide by 3
    e7322da6c50f ARM: at91: pm: save and restore ACR during PLL disable/enable
    a02f2dbdd77a rtc: pcf2127: clear minute/second interrupt
    cebc9f5ee3e3 um: Fix help message for ssl-non-raw
    64ef62fb1c4a fs/hpfs: Fix error code for new_inode() failure in mkdir/create/mknod/symlink
    f7af3813ccff btrfs: mark dirty extent range for out of bound prealloc extents
    8a139fe903f3 RDMA/hns: Fix wrong WQE data when QP wraps around
    63bb04cda173 RDMA/irdma: Set irdma_cq cq_num field during CQ create
    e8805e90ff0c RDMA/irdma: Remove unused struct irdma_cq fields
    2380d634959a RDMA/irdma: Fix SD index calculation
    cc9ab6e1a375 ACPICA: Update dsmethod.c to get rid of unused variable warning
    15afebb95974 orangefs: fix xattr related buffer overflow...
    c12ebeacfbae page_pool: Clamp pool size to max 16K pages
    2acf073edeb7 exfat: limit log print for IO error
    c70926971b36 ALSA: usb-audio: add mono main switch to Presonus S1824c
    b65ca9708bfb Bluetooth: bcsp: receive data only if registered
    d2850f037c2a Bluetooth: SCO: Fix UAF on sco_conn_free
    d4d90a419b55 net: macb: avoid dealing with endianness in macb_set_hwaddr()
    bb7d0d13c6e1 fs: ext4: change GFP_KERNEL to GFP_NOFS to avoid deadlock
    b2eef65a3be2 scsi: libfc: Fix potential buffer overflow in fc_ct_ms_fill()
    fa4daf7d11e4 nfs4_setup_readdir(): insufficient locking for ->d_parent->d_inode dereferencing
    a8a97e0d0b60 NFSv4.1: fix mount hang after CREATE_SESSION failure
    679fd67bac26 NFSv4: handle ERR_GRACE on delegation recalls
    ca806ebc497b remoteproc: qcom: q6v5: Avoid handling handover twice
    e50066336660 sparc/module: Add R_SPARC_UA64 relocation handling
    eb3d29ca0820 PCI: cadence: Check for the existence of cdns_pcie::ops before using it
    c3f99fd7ed17 r8169: set EEE speed down ratio to 1
    826ad86e1270 net: intel: fm10k: Fix parameter idx set but not used
    eb0c150d0279 wifi: ath10k: Fix connection after GTK rekeying
    0f7f34292071 iommu/vt-d: Replace snprintf with scnprintf in dmar_latency_snapshot()
    f878bfd2c14c net: ethernet: microchip: sparx5: make it selectable for ARCH_LAN969X
    a2aa97cde985 jfs: fix uninitialized waitqueue in transaction manager
    46c76cfa17d1 jfs: Verify inode mode when loading from disk
    14b6f0b3cfe2 ipv6: np->rxpmtu race annotation
    318aeeb3f8fe usb: xhci: plat: Facilitate using autosuspend for xhci plat devices
    7a219cbbc9e8 usb: mon: Increase BUFF_MAX to 64 MiB to support multi-MB URBs
    311df10cca0e allow finish_no_open(file, ERR_PTR(-E...))
    ffae0417168e scsi: lpfc: Define size of debugfs entry for xri rebalancing
    57225d17cd8d scsi: lpfc: Remove ndlp kref decrement clause for F_Port_Ctrl in lpfc_cleanup
    430e3ca0a53d scsi: lpfc: Check return status of lpfc_reset_flush_io_context during TGT_RESET
    41cd00665c99 selftests/Makefile: include $(INSTALL_DEP_TARGETS) in clean target to clean net/lib dependency
    0ec2cd5c5879 page_pool: always add GFP_NOWARN for ATOMIC allocations
    a58098c6b91c drm/amdgpu: Use memdup_array_user in amdgpu_cs_wait_fences_ioctl
    fd62e1a94cff net/cls_cgroup: Fix task_get_classid() during qdisc run
    45e4e4a8772f udp_tunnel: use netdev_warn() instead of netdev_WARN()
    d276a6c3bb74 selftests: Replace sleep with slowwait
    fbf410aafc85 eth: 8139too: Make 8139TOO_PIO depend on !NO_IOPORT_MAP
    ff4cd9564dc3 selftests: Disable dad for ipv6 in fcnal-test.sh
    b16a010338bf x86/kvm: Prefer native qspinlock for dedicated vCPUs irrespective of PV_UNHALT
    56c832864e5e netfilter: nf_reject: don't reply to icmp error messages
    0858b8e38884 selftests: traceroute: Use require_command()
    9d2e3da0a0e8 media: redrat3: use int type to store negative error codes
    ffb663e41dde net: sh_eth: Disable WoL if system can not suspend
    eab8d5e5e1d0 phy: rockchip: phy-rockchip-inno-csidphy: allow writes to grf register 0
    04f057e4c156 phy: cadence: cdns-dphy: Enable lower resolutions in dphy
    63eb6730ce06 ntfs3: pretend $Extend records as regular files
    8a8d07553583 net: phy: marvell: Fix 88e1510 downshift counter errata
    0f30019f5a58 drm/msm: make sure to not queue up recovery more than once
    0cf9a50af91f usb: cdns3: gadget: Use-after-free during failed initialization and exit of cdnsp gadget
    2dc7bcc0b112 usb: gadget: f_hid: Fix zero length packet transfer
    bb8f9de71c9b iommu/amd: Skip enabling command/event buffers for kdump
    66bcd6c577d8 net: call cond_resched() less often in __release_sock()
    07ae8cc64557 net: nfc: nci: Increase NCI_DATA_TIMEOUT to 3000 ms
    fdfd91ac1f44 ipv6: Add sanity checks on ipv6_devconf.rpl_seg_enabled
    1452d49956d9 drm/msm/dsi/phy_7nm: Fix missing initial VCO rate
    b4a4bf4b4452 drm/msm/dsi/phy: Toggle back buffer resync after preparing PLL
    bda8e00b354a dmaengine: dw-edma: Set status for callback_result
    35e42324c21f dmaengine: mv_xor: match alloc_wc and free_wc
    e12a50e3621f dmaengine: sh: setup_xref error handling
    774e8d44ac88 ptp: Limit time setting of PTP clocks
    48c1d49c64d0 scsi: pm8001: Use int instead of u32 to store error codes
    7ce10ef9a9b6 mips: lantiq: xway: sysctrl: rename stp clock
    e1f79a12bd62 mips: lantiq: danube: add missing device_type in pci node
    a39c88bedb0f mips: lantiq: danube: add missing properties to cpu node
    69f04cdd1a50 media: fix uninitialized symbol warnings
    b751b7f87acb drm/amdkfd: Tie UNMAP_LATENCY to queue_preemption
    92071a422131 extcon: adc-jack: Fix wakeup source leaks on device unbind
    62443e7d827a scsi: pm80xx: Fix race condition caused by static variables
    866d93632daa scsi: mpi3mr: Fix controller init failure on fault during queue creation
    9650cd59f4e1 rds: Fix endianness annotation for RDS_MPATH_HASH
    fb4f59e66952 ALSA: usb-audio: Add validation of UAC2/UAC3 effect units
    30cc10a05b22 PCI/P2PDMA: Fix incorrect pointer usage in devm_kfree() call
    38edfa2a5a7a net: Call trace_sock_exceed_buf_limit() for memcg failure with SK_MEM_RECV.
    f80a71a29f2d net: When removing nexthops, don't call synchronize_net if it is not necessary
    d2ee1c7fc9c2 char: misc: Does not request module for miscdevice with dynamic minor
    e14d3af189de usb: gadget: f_ncm: Fix MAC assignment NCM ethernet
    f979f913b99c iio: adc: spear_adc: mask SPEAR_ADC_STATUS channel and avg sample before setting register
    ad22eebd7177 drm/bridge: display-connector: don't set OP_DETECT for DisplayPorts
    26f6a1dd5d81 media: imon: make send_packet() more robust
    0bf756ae1e69 net: ipv6: fix field-spanning memcpy warning in AH output
    15def75e75a7 bridge: Redirect to backup port when port is administratively down
    a65cbffb0e81 powerpc/eeh: Use result of error_detected() in uevent
    e269b500b23f thunderbolt: Use is_pciehp instead of is_hotplug_bridge
    157b7b41a5d2 net: stmmac: Check stmmac_hw_setup() in stmmac_resume()
    d178723da249 x86/vsyscall: Do not require X86_PF_INSTR to emulate vsyscall
    5ba991865cee drm/tidss: Set crtc modesetting parameters with adjusted mode
    603c103f9e30 drm/tidss: Use the crtc_* timings when programming the HW
    965813f1afaf media: pci: ivtv: Don't create fake v4l2_fh
    556da2856798 drm/amdkfd: return -ENOTTY for unsupported IOCTLs
    e04e3165bc8b selftests/net: Ensure assert() triggers in psock_tpacket.c
    634d43ee1d23 selftests/net: Replace non-standard __WORDSIZE with sizeof(long) * 8
    be80a71699b4 PCI: Disable MSI on RDC PCI to PCIe bridges
    31caf9efba7e drm/nouveau: replace snprintf() with scnprintf() in nvkm_snprintbf()
    19096bddf873 drm/amdgpu/jpeg: Hold pg_lock before jpeg poweroff
    b9d1d32766d3 drm/amd/pm: Use cached metrics data on arcturus
    89af20042ea5 drm/amd/pm: Use cached metrics data on aldebaran
    446631df0714 mfd: da9063: Split chip variant reading in two bus transactions
    adde0c657c90 mfd: madera: Work around false-positive -Wininitialized warning
    d7bc1931a256 mfd: stmpe-i2c: Add missing MODULE_LICENSE
    72f7a31793bb mfd: stmpe: Remove IRQ domain upon removal
    fa0d842eea8c tools/power x86_energy_perf_policy: Prefer driver HWP limits
    1c0eb3211e17 tools/power x86_energy_perf_policy: Enhance HWP enable
    87de7b4213c1 tools/power x86_energy_perf_policy: Fix incorrect fopen mode usage
    2ba32bd019cf tools/cpupower: Fix incorrect size in cpuidle_state_disable()
    481e609c7854 hwmon: (dell-smm) Add support for Dell OptiPlex 7040
    2617ae62f086 uprobe: Do not emulate/sstep original instruction when ip is changed
    cf3e51d388e1 clocksource/drivers/vf-pit: Replace raw_readl/writel to readl/writel
    39805c732891 cpuidle: Fail cpuidle device registration if there is one already
    7f6993bd3224 tools/cpupower: fix error return value in cpupower_write_sysfs()
    6e9e9558da65 video: backlight: lp855x_bl: Set correct EPROM start for LP8556
    e8cde03de867 nvme-fc: use lock accessing port_state and rport state
    2f4852db87e2 nvmet-fc: avoid scheduling association deletion twice
    75a98126757e tee: allow a driver to allocate a tee_device without a pool
    5a7e2d5d1b68 ACPICA: dispatcher: Use acpi_ds_clear_operands() in acpi_ds_call_control_method()
    13257496a496 mmc: sdhci-msm: Enable tuning for SDR50 mode for SD card
    e3f7173df91b power: supply: sbs-charger: Support multiple devices
    a59c9c1370db hwmon: (sbtsi_temp) AMD CPU extended temperature range support
    9545f5ef8258 ACPI: scan: Add Intel CVS ACPI HIDs to acpi_ignore_dep_ids[]
    799f75a894a6 ACPI: PRM: Skip handlers with NULL handler_address or NULL VA
    2ca16b41e88b irqchip/gic-v2m: Handle Multiple MSI base IRQ Alignment
    1ba13dde6a45 arc: Fix __fls() const-foldability via __builtin_clzl()
    55cf586b9556 cpufreq/longhaul: handle NULL policy in longhaul_exit
    916f62bf6964 selftests/bpf: Fix bpf_prog_detach2 usage in test_lirc_mode2
    76ab1edadf69 ACPI: video: force native for Lenovo 82K8
    edc0b38f26fc memstick: Add timeout to prevent indefinite waiting
    9e18372fcf17 mmc: host: renesas_sdhi: Fix the actual clock
    fd031d98081e pinctrl: single: fix bias pull up/down handling in pin_config_set
    13ce905f0777 bpf: Don't use %pK through printk
    49be75e00d21 soc: ti: pruss: don't use %pK through printk
    ed7b7fbf2d5f spi: loopback-test: Don't use %pK through printk
    d06bbd6f5cd8 soc: qcom: smem: Fix endian-unaware access of num_entries
    9a0d4017a138 soc: aspeed: socinfo: Add AST27xx silicon IDs
    04dde9a7cb73 block: make REQ_OP_ZONE_OPEN a write operation
    6abeff03cb79 drm/sysfb: Do not dereference NULL pointer in plane reset
    afd6e9fe377f drm/sched: Fix race in drm_sched_entity_select_rq()
    9ec40fba7357 usb: gadget: f_fs: Fix epfile null pointer access after ep enable.
    e6f1413b1cfb Revert "docs/process/howto: Replace C89 with C11"
    518eadd15f7e arch: back to -std=gnu89 in < v5.18
    f28b14d235a8 x86/boot: Compile boot code with -std=gnu11 too
    8050bbc2a2b9 xhci: dbc: fix bogus 1024 byte prefix if ttyDBC read races with stall event
    fe9092c42877 xhci: dbc: Avoid event polling busyloop if pending rx transfers are inactive.
    79d7094ecd75 xhci: dbc: Improve performance by removing delay in transfer event polling.
    2f5c3743466f xhci: dbc: Allow users to modify DbC poll interval via sysfs
    d596d39e16e3 xhci: dbc: poll at different rate depending on data transfer activity
    902f900b46e9 xhci: dbc: Provide sysfs option to configure dbc descriptors
    42ccfa662c2e x86/resctrl: Fix miscount of bandwidth event when reactivating previously unavailable RMID
    12a895faa0c9 net: phy: dp83867: Disable EEE support as not implemented
    56612e80a80b can: gs_usb: increase max interface to U8_MAX
    941285def6f6 net: ravb: Enforce descriptor type ordering
    6664de2a13b5 ravb: Exclude gPTP feature support for RZ/G2L
    381eb91874a6 dt-bindings: usb: dwc3-imx8mp: dma-range is required only for imx8mp
    bfb5e825c206 serial: 8250_dw: handle reset control deassert error
    3299a39f9a09 serial: 8250_dw: Use devm_add_action_or_reset()
    d979639f099c regmap: slimbus: fix bus_context pointer in regmap init calls
    c5279b8c91c9 block: fix op_is_zone_mgmt() to handle REQ_OP_ZONE_RESET_ALL
    c674a191ada3 drm/amd/pm/powerplay/smumgr: Fix PCIeBootLinkLevel value on Iceland
    f64e5bdde3be drm/amd/pm/powerplay/smumgr: Fix PCIeBootLinkLevel value on Fiji
    ca8cc1ae1425 drm/amd/pm: fix smu table id bound check issue in smu_cmn_update_table()
    e5e712518b29 net: hns3: return error code when function fails
    8814f060d364 drm/etnaviv: fix flush sequence logic
    43005002b60e usbnet: Prevents free active kevent
    18652ab01a20 libbpf: Fix powerpc's stack register definition in bpf_tracing.h
    e5996b15ab1d libbpf: Normalize PT_REGS_xxx() macro definitions
    82a674170040 riscv, libbpf: Add RISC-V (RV64) support to bpf_tracing.h
    9450d2fe01d0 bpf: Do not audit capability check in do_jit()
    de2ce6b14bc3 bpf: Sync pending IRQ work before freeing ring buffer
    29b6987bdea3 ALSA: usb-audio: fix control pipe direction
    ea48293df43b drm/msm/a6xx: Fix GMU firmware parser
    488f3206325e wifi: ath10k: Fix memory leak on unsupported WMI command
    641e47ea2831 ASoC: qdsp6: q6asm: do not sleep while atomic
    cca3958c5565 mptcp: restore window probe
    90d835caf3eb fbdev: valkyriefb: Fix reference count leak in valkyriefb_init
    9c78e8179a14 fbdev: pvr2fb: Fix leftover reference to ONCHIP_NR_DMA_CHANNELS
    55f60a72a178 wifi: brcmfmac: fix crash while sending Action Frames in standalone AP Mode
    db5c9a162d2f fbdev: bitblit: bound-check glyph index in bit_putcs*
    bc78a4f51d54 ACPI: video: Fix use-after-free in acpi_video_switch_brightness()
    4b05bd1d75d3 fbdev: atyfb: Check if pll_ops->init_pll failed
    c7bf258321a1 net: usb: asix_devices: Check return value of usbnet_get_endpoints
    375fdd8993ce NFSD: Fix crash in nfsd4_read_release()
    5fa8b4382c01 btrfs: use smp_mb__after_atomic() when forcing COW in create_pending_snapshot()
    5a6f9727ae78 btrfs: always drop log root tree reference in btrfs_replay_log()
    f5c926c9e7fe btrfs: scrub: replace max_t()/min_t() with clamp() in scrub_throttle_dev_io()
    a740e71c2344 x86/bugs: Fix reporting of LFENCE retpoline
    1bed56f089f0 net/sched: sch_qfq: Fix null-deref in agg_dequeue

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index a315593e7c..4baf0bd983 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ec706ff09f989e8c03cdc0e1ec5cafd7cf3ee8a2"
-SRCREV_meta ?= "0279325ca207a9cdfa8a956632154831453a85c1"
+SRCREV_machine ?= "9f3853efc84c7065918f3cb90be1464f61bd0871"
+SRCREV_meta ?= "65baed3263fc04a3bdd461278cca80891b80cc9a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.196"
+LINUX_VERSION ?= "5.15.197"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 66da58322e..a8ba147044 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.196"
+LINUX_VERSION ?= "5.15.197"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "6aa88785aa94fe7253e4dcda162c35c8eaa9f500"
-SRCREV_meta ?= "0279325ca207a9cdfa8a956632154831453a85c1"
+SRCREV_machine ?= "6a3023cca521bd2e295fc1482e5b0c88c08ab2e4"
+SRCREV_meta ?= "65baed3263fc04a3bdd461278cca80891b80cc9a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 5b6213a9d7..26765a216e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "6938c8f38582bac21da19fde0f2b27beb6b15ba8"
-SRCREV_machine:qemuarm64 ?= "5650eb3e0a12ce52f0c2b9d5469ec169ab8239e7"
-SRCREV_machine:qemumips ?= "1b8f74e960fcd90cf09ff65426d88fe5ec4affae"
-SRCREV_machine:qemuppc ?= "29d4d06006e7def2e86d3c8c99d0a8550cae5a84"
-SRCREV_machine:qemuriscv64 ?= "3f1742244637534d7f0c70ca2ad471307917ce3f"
-SRCREV_machine:qemuriscv32 ?= "3f1742244637534d7f0c70ca2ad471307917ce3f"
-SRCREV_machine:qemux86 ?= "3f1742244637534d7f0c70ca2ad471307917ce3f"
-SRCREV_machine:qemux86-64 ?= "3f1742244637534d7f0c70ca2ad471307917ce3f"
-SRCREV_machine:qemumips64 ?= "20aaafeb01a044c6e1f2480e119e575461e3fa23"
-SRCREV_machine ?= "3f1742244637534d7f0c70ca2ad471307917ce3f"
-SRCREV_meta ?= "0279325ca207a9cdfa8a956632154831453a85c1"
+SRCREV_machine:qemuarm ?= "2d635a3e35b83998b2f84bbd2e932eaafdf61826"
+SRCREV_machine:qemuarm64 ?= "bb65897d11ebca68c2017bf0bed4e26599e05ddb"
+SRCREV_machine:qemumips ?= "8192334823c116e4e56368fbf6ca67cdb0c945d0"
+SRCREV_machine:qemuppc ?= "ec35a9c80e2a5006d01a073f9787c784fdf0a04f"
+SRCREV_machine:qemuriscv64 ?= "c04373a83e017e615d8333767c8955732c6c975b"
+SRCREV_machine:qemuriscv32 ?= "c04373a83e017e615d8333767c8955732c6c975b"
+SRCREV_machine:qemux86 ?= "c04373a83e017e615d8333767c8955732c6c975b"
+SRCREV_machine:qemux86-64 ?= "c04373a83e017e615d8333767c8955732c6c975b"
+SRCREV_machine:qemumips64 ?= "5a3b47b8a7c60c97447170242b5c2e70db803b2f"
+SRCREV_machine ?= "c04373a83e017e615d8333767c8955732c6c975b"
+SRCREV_meta ?= "65baed3263fc04a3bdd461278cca80891b80cc9a"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "cc5ec87693063acebb60f587e8a019ba9b94ae0e"
+SRCREV_machine:class-devupstream ?= "68efe5a6c16a05391e3d96025b41e9bf573f968c"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.196"
+LINUX_VERSION ?= "5.15.197"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.43.0


