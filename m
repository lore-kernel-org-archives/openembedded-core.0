Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31351E7719A
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 21:17:34 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.31961.1736371045149980993
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 13:17:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Tc2GXrDK;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21675fd60feso3726125ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 13:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736371044; x=1736975844; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yaNT826yqUNgwLrQBhKbdotgV/lhW2W1xLM0wWyMZCg=;
        b=Tc2GXrDKtJ5EfbJ8cOEz5zUCptwZCdxRlJvMa2WhXvB0uAYHdddjv+rqzv21NdRlOb
         b19Fj+/OsHXQsiaVMj0B7xUQimRzypVBc0VBov+L7SQQNdZOisVST4zI80e2HTZLVDKW
         SRIC0O4KAsjA/6ZrjqMtVlDQIbCK2SxciNLIfmM2R7TOa7nu3x/440N8J/IgCEk8t+KD
         uholeX8ecqOFOn6ku4wB0J51Zf0fDd68dJAAhAjo6vdvBR2zifakSBvLa0TsNrC+YaXF
         yKAOtLvhBEYv3Od5FrTgZAv69Anof7E0FpkpO6lW53xmbB3vNqaRDPKSOsAv8So8TKh7
         rihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736371044; x=1736975844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yaNT826yqUNgwLrQBhKbdotgV/lhW2W1xLM0wWyMZCg=;
        b=eoUQaF3eyMTNePs6MV6lnsCWSDPYaO9+QBKb/MfuJnrLsSlQrh53rN1W6uAB4khxhF
         H9RUJ0tCpV9eVOLYmAdFOY3m1sP5wQ9yvs/IX4sziFfGzUZG7dxUb+P/NX3Ns+LtwX8X
         tSb5MwIkDXxvyBb8bSnGpFGTB48hLAOIoG9q7YQkbA64vG978bG5QJ3cYmwpOylUj2Ww
         po6Q+a9D2ZuBrTBSqXNgXoBAnMMKS6A7EDA+e5nbqQPLlm0IGC0mw/cLKss8zb2k9WkF
         fRcoHXiNEzHmcHWIUb+mo6mbIjTPrUnL115ZcbjXr2q+oA69qjdzPnhx3tohecHf/IoZ
         /1Hw==
X-Gm-Message-State: AOJu0Yx1+8nctzdTd2eC3bg3+X/IzKJBbe/QT+Fo+4a2+pgTJmoTuxK2
	YJfLsT+P9fXYq/akW6k6P4MasaB8lSKIjscLDdwsg2VDbaeGD2JTnud9gpkIh0tXSUVI0jY0+as
	7PbQ=
X-Gm-Gg: ASbGncvrt7EXRkUEfs1CS0iHQtTuhHwx2mi6QOwGDLD5eGR30SbqCsByEu5k8WfLcSm
	LCQl43jVJPobd139ejyOAyN1nyDhHLqM/4j6gxsi0LoFMC2Vx3bJo2nV9fmJLTNDYdNd+oSSea6
	697v5OmVaBu4SWDDwp9+N82hwvUja6UHk4F9ktBWnuZ8ohDc/60waToloFdlNdcamaxZ0Sv31ge
	r7v0mlUsZLlk412XK3Yjj1XMYLLaARxOZjNOiCxHN4ThQ==
X-Google-Smtp-Source: AGHT+IGqSkoRK7wkjrcHHJ2eczcjSUskHY3yJdL88RhcJooyYEts3b1Xgfi3MYN28wCugLoAnoxrlw==
X-Received: by 2002:a17:903:1245:b0:216:48f4:4f20 with SMTP id d9443c01a7336-21a83f56f58mr59053245ad.16.1736371043766;
        Wed, 08 Jan 2025 13:17:23 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cdd9bsm331403495ad.132.2025.01.08.13.17.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 13:17:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 05/18] linux-yocto/6.6: update to v6.6.58
Date: Wed,  8 Jan 2025 13:16:55 -0800
Message-ID: <69f69087739fde666163ed82af4ac1c358731279.1736370890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736370890.git.steve@sakoman.com>
References: <cover.1736370890.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 21:17:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209595

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    18916a684a8b Linux 6.6.58
    fd6e2af79a94 ALSA: hda/conexant - Use cached pin control for Node 0x1d on HP EliteOne 1000 G2
    9698088ac770 nilfs2: propagate directory read errors from nilfs_find_entry()
    87cb3f6e0c04 selftests: mptcp: remove duplicated variables
    ec0d0fcbd5d8 selftests: mptcp: join: test for prohibited MPC to port-based endp
    d46b96f0a489 selftests: mptcp: join: change capture/checksum as bool
    229dfdc36f31 tcp: fix mptcp DSS corruption due to large pmtu xmit
    647cd4494cc3 serial: qcom-geni: fix receiver enable
    61c8f746ed83 serial: qcom-geni: fix dma rx cancellation
    7176aee5a1b2 serial: qcom-geni: revert broken hibernation support
    90e3f819e6aa serial: qcom-geni: fix polled console initialisation
    6acd19ad3aaf irqchip/sifive-plic: Unmask interrupt in plic_irq_enable()
    01282ab5182f irqchip/gic-v4: Don't allow a VMOVP on a dying VPE
    fad940e2dd78 pinctrl: apple: check devm_kasprintf() returned value
    3b36bb1fca2b pinctrl: stm32: check devm_kasprintf() returned value
    20728e86289a pinctrl: ocelot: fix system hang on level based interrupts
    481b477ab63c x86/bugs: Use code segment selector for VERW operand
    c29f192e0d44 tty: n_gsm: Fix use-after-free in gsm_cleanup_mux
    227358e89703 x86/entry_32: Clear CPU buffers after register restore in NMI return
    0c6a7e2c6012 x86/entry_32: Do not clobber user EFLAGS.ZF
    c8170b5ddc41 x86/CPU/AMD: Only apply Zenbleed fix for Zen2 during late microcode load
    6663f0c65885 x86/apic: Always explicitly disarm TSC-deadline timer
    16d7d35f1c1e x86/resctrl: Annotate get_mem_config() functions as __init
    66029078fee0 parport: Proper fix for array out-of-bounds access
    c895d48c843d serial: imx: Update mctrl old_status on RTSD interrupt
    245bee12a52d misc: microchip: pci1xxxx: add support for NVMEM_DEVID_AUTO for OTP device
    78df42183e82 misc: microchip: pci1xxxx: add support for NVMEM_DEVID_AUTO for EEPROM device
    c3d3501cf896 usb: dwc3: Wait for EndXfer completion before restoring GUSB2PHYCFG
    479830f6c15b usb: typec: qcom-pmic-typec: fix sink status being overwritten with RP_DEF
    86c68aa714d0 USB: serial: option: add Telit FN920C04 MBIM compositions
    90a5c64279ae USB: serial: option: add support for Quectel EG916Q-GL
    53cd1bb1f8eb xhci: Mitigate failed set dequeue pointer commands
    cc7b7050996a xhci: Fix incorrect stream context type macro
    9c696bf4ab54 xhci: tegra: fix checked USB2 port number
    dc2d5f02636c vt: prevent kernel-infoleak in con_font_get()
    885f8c873fed Bluetooth: btusb: Fix regression with fake CSR controllers 0a12:0001
    8fb8e912afb4 Bluetooth: ISO: Fix multiple init when debugfs is disabled
    59bd80df4b88 Bluetooth: Remove debugfs directory on module init failure
    05f84d86169b Bluetooth: Call iso_exit() on module unload
    232c2eb6d60c iio: accel: kx022a: add missing select IIO_(TRIGGERED_)BUFFER in Kconfig
    d8ef39dad9b9 iio: adc: ti-ads124s08: add missing select IIO_(TRIGGERED_)BUFFER in Kconfig
    48e594b77cb7 iio: adc: ti-lmp92064: add missing select REGMAP_SPI in Kconfig
    2f76debe69b8 iio: dac: ad3552r: add missing select IIO_(TRIGGERED_)BUFFER in Kconfig
    ad60bbd7c071 iio: proximity: mb1232: add missing select IIO_(TRIGGERED_)BUFFER in Kconfig
    1fcc9d634b50 iio: dac: ad5766: add missing select IIO_(TRIGGERED_)BUFFER in Kconfig
    66bfe12005f6 iio: light: bu27008: add missing select IIO_(TRIGGERED_)BUFFER in Kconfig
    5d41abc777dc iio: frequency: adf4377: add missing select REMAP_SPI in Kconfig
    dc7a11e8cebd iio: amplifiers: ada4250: add missing select REGMAP_SPI in Kconfig
    7f06b154ffcf iio: light: opt3001: add missing full-scale range value
    2cbb41abae65 iio: light: veml6030: fix IIO device retrieval from embedded device
    6bd2b16425d4 iio: light: veml6030: fix ALS sensor resolution
    6acb0a4dac40 iio: hid-sensors: Fix an error handling path in _hid_sensor_set_report_latency()
    082a75594ba4 iio: adc: ti-ads8688: add missing select IIO_(TRIGGERED_)BUFFER in Kconfig
    e0eb585eef6c iio: dac: stm32-dac-core: add missing select REGMAP_MMIO in Kconfig
    ea8180528111 iio: dac: ltc1660: add missing select REGMAP_SPI in Kconfig
    c3a230c1df36 iio: dac: ad5770r: add missing select REGMAP_SPI in Kconfig
    64cf93b87fe3 drm/amdgpu: prevent BO_HANDLES error from being overwritten
    db0978d3ed8b drm/amdgpu/swsmu: Only force workload setup on init
    7c0763fd7974 drm/vmwgfx: Handle surface check failure correctly
    1a235af02164 drm/radeon: Fix encoder->possible_clones
    8e6ca01b3b8d scsi: ufs: core: Fix the issue of ICU failure
    7bd9af254275 scsi: ufs: core: Set SDEV_OFFLINE when UFS is shut down
    d3c4f41ae32c Input: xpad - add support for MSI Claw A1M
    a16af52f2442 selftest: hid: add the missing tests directory
    6414ab5c9c9c ublk: don't allow user copy for unprivileged device
    2762b3cc9094 io_uring/sqpoll: close race on waiting for sqring entries
    4c5b123ab289 blk-rq-qos: fix crash on rq_qos_wait vs. rq_qos_wake_function race
    c04670dffb3f x86/bugs: Do not use UNTRAIN_RET with IBPB on entry
    c42a343158ea x86/bugs: Skip RSB fill at VMEXIT
    61211f2da0be x86/entry: Have entry_ibpb() invalidate return predictions
    b28d3f44e20c x86/cpufeatures: Add a IBPB_NO_RET BUG flag
    6ccc10ed0a7d x86/cpufeatures: Define X86_FEATURE_AMD_IBPB_RET
    369535232d6a KVM: s390: Change virtual to physical address access in diag 0x258 handler
    88607ed93ee6 KVM: s390: gaccess: Check if guest address is in memslot
    82b433fb9b13 s390/sclp_vt220: Convert newlines to CRLF instead of LFCR
    ccea29b1e072 s390/sclp: Deactivate sclp after all its users
    fe2e0b6cd00a iommu/vt-d: Fix incorrect pci_for_each_dma_alias() for non-PCI devices
    37d9305caace mptcp: prevent MPC handshake on port-based signal endpoints
    6365900cb10e net: fec: Remove duplicated code
    1e1eb62c40e1 net: fec: Move `fec_ptp_read()` to the top of the file
    677f1df179cb maple_tree: correct tree corruption on spanning store
    9a0ab4fc28ed xfs: restrict when we try to align cow fork delalloc to cowextsz hints
    3eeac3311683 xfs: allow unlinked symlinks and dirs with zero size
    2bc2d49c36c2 xfs: fix freeing speculative preallocations for preallocated files
    740a427e8f45 xfs: fix unlink vs cluster buffer instantiation race
    0e52b98bf041 xfs: make sure sb_fdblocks is non-negative
    0aca73915dc1 xfs: allow symlinks with short remote targets
    4c99f3026cf2 xfs: convert delayed extents to unwritten when zeroing post eof blocks
    36081fd0ee37 xfs: make xfs_bmapi_convert_delalloc() to allocate the target offset
    0f726c17dfd8 xfs: make the seq argument to xfs_bmapi_convert_delalloc() optional
    f24ba2183148 xfs: match lock mode in xfs_buffered_write_iomap_begin()
    7c03b124353a xfs: use dontcache for grabbing inodes during scrub
    20adb1e2f069 xfs: revert commit 44af6c7e59b12
    5689d2345a01 xfs: enforce one namespace per attribute
    9716cdcc2f9e xfs: validate recovered name buffers when recovering xattr items
    db460c26f0b0 xfs: check shortform attr entry flags specifically
    cad051826d83 xfs: fix missing check for invalid attr flags
    0934046e3392 xfs: check opcode and iovec count match in xlog_recover_attri_commit_pass2
    c13c21f77824 xfs: require XFS_SB_FEAT_INCOMPAT_LOG_XATTRS for attr log intent item recovery
    c299188b443a xfs: remove a racy if_bytes check in xfs_reflink_end_cow_extent
    4bcef72d96b5 xfs: fix xfs_bmap_add_extent_delay_real for partial conversions
    f43bd357fde0 xfs: fix error returns from xfs_bmapi_write
    bed2b9037806 mm/swapfile: skip HugeTLB pages for unuse_vma
    a0035fc55554 mm/mglru: only clear kswapd_failures if reclaimable
    17396e32f975 mm/mremap: fix move_normal_pmd/retract_page_tables race
    6b91fd65a117 selftests/mm: fix deadlock for fork after pthread_create on ARM
    8f5fa1c677df selftests/mm: replace atomic_bool with pthread_barrier_t
    a9af9d5fb01b fat: fix uninitialized variable
    8e29f3235181 irqchip/gic-v3-its: Fix VSYNC referencing an unmapped VPE on GIC v4.1
    20b5342de51b net: microchip: vcap api: Fix memory leaks in vcap_api_encode_rule_test()
    81db1e528486 net: macb: Avoid 20s boot delay by skipping MDIO bus registration for fixed-link PHY
    8165bf83b8a6 arm64: probes: Fix uprobes for big-endian kernels
    173c13e38799 arm64: probes: Fix simulate_ldr*_literal()
    9f1e7735474e arm64: probes: Remove broken LDR (literal) uprobe support
    a3f169e39821 posix-clock: Fix missing timespec64 check in pc_clock_settime()
    75150ba93dda net: enetc: add missing static descriptor and inline keyword
    760a7c9695c0 net: enetc: disable NAPI after all rings are disabled
    a419f478b927 net: enetc: disable Tx BD rings after they are empty
    37184349468a net: enetc: block concurrent XDP transmissions during ring reconfiguration
    1c95443e44e1 net: enetc: remove xdp_drops statistic from enetc_xdp_drop()
    7b2e478abab0 mptcp: pm: fix UaF read in mptcp_pm_nl_rm_addr_or_subflow
    3c088dba8a4e ALSA: hda/conexant - Fix audio routing for HP EliteOne 1000 G2
    5511999e9615 ksmbd: fix user-after-free from session log off
    7fc7c47b9ba0 btrfs: fix uninitialized pointer free on read_alloc_one_name() error
    e11ce03b5874 btrfs: fix uninitialized pointer free in add_inode_ref()
    e9448e371c87 Linux 6.6.57
    8d5aebfff846 scsi: Revert "scsi: sd: Do not repeat the starting disk message"
    e6fc67c0efea e1000e: fix force smbus during suspend flow
    611f74b0e7fb net: ethernet: cortina: Restore TSO support
    7caf966390e6 secretmem: disable memfd_secret() if arch cannot set direct map
    e5a0031c7965 fs/proc/kcore.c: allow translation of physical memory addresses
    19a5029981c8 kthread: unpark only parked kthread
    f00545e8386e btrfs: split remaining space to discard in chunks
    73a4f5a704a2 selftests/rseq: Fix mm_cid test failure
    87070a96b1d2 selftests/mm: fix incorrect buffer->mirror size in hmm2 double_map test
    bd3222d47fae powercap: intel_rapl_tpmi: Fix bogus register reading
    697e3ddcf1f8 nouveau/dmem: Fix vulnerability in migrate_to_ram upon copy error
    b822007e8db3 device-dax: correct pgoff align in dax_set_mapping()
    8b36f4dcacb9 mptcp: pm: do not remove closing subflows
    b8be15d1ae7e mptcp: handle consistently DSS corruption
    143ffa7878e2 net: phy: Remove LED entry from LEDs list on unregister
    28a2c3e51d09 net: dsa: lan9303: ensure chip reset and wait for READY status
    3be342e0332a net: Fix an unsafe loop on the list
    563e6892e21d net: explicitly clear the sk pointer, when pf->create fails
    31c62224e91c ata: libata: avoid superfluous disk spin down + spin up during hibernation
    a448ced30802 mptcp: fallback when MPTCP opts are dropped after 1st data
    7994a4849c8b scsi: ufs: Use pre-calculated offsets in ufshcd_init_lrb()
    e04642a207f1 scsi: wd33c93: Don't use stale scsi_pointer value
    867639300759 Bluetooth: hci_conn: Fix UAF in hci_enhanced_setup_sync
    55f2bd90b9fb drm/i915/hdcp: fix connector refcounting
    937943c04250 drm/vc4: Stop the active perfmon before being destroyed
    07c51108d9e2 drm/v3d: Stop the active perfmon before being destroyed
    fb1643d00a50 hid: intel-ish-hid: Fix uninitialized variable 'rv' in ish_fw_xfer_direct_dma
    0b97fe09f099 usb: gadget: core: force synchronous registration
    0770cda1e40f usb: storage: ignore bogus device raised by JieLi BR21 USB sound chip
    cb8b441f73a6 usb: xhci: Fix problem with xhci resume from suspend
    38aef06ea2fd usb: dwc3: core: Stop processing of pending events if controller is halted
    936564b4dafa Revert "usb: yurex: Replace snprintf() with the safer scnprintf() variant"
    1fa959e74e50 HID: plantronics: Workaround for an unexcepted opposite volume key
    c1846e023899 HID: multitouch: Add support for lenovo Y9000P Touchpad
    1c3b4c90479a HID: amd_sfh: Switch to device-managed dmam_alloc_coherent()
    11381eea8897 hwmon: (adt7470) Add missing dependency on REGMAP_I2C
    f5033290daa1 hwmon: (adm9240) Add missing dependency on REGMAP_I2C
    fe5866fc1254 hwmon: (mc34vr500) Add missing dependency on REGMAP_I2C
    de90999ec3de hwmon: (tmp513) Add missing dependency on REGMAP_I2C
    2caf6c42629e hwmon: intel-m10-bmc-hwmon: relabel Columbiaville to CVL Die Temperature
    26b177ecdd31 wifi: mac80211: Avoid address calculations via out of bounds array indexing
    ea912d384d8e hid-asus: add ROG Ally X prod ID to quirk list
    1815b3236d6b HID: asus: add ROG Z13 lightbar
    5ec4596a0ba9 HID: asus: add ROG Ally N-Key ID and keycodes
    f74210883e53 HID: i2c-hid: Skip SET_POWER SLEEP for Cirque touchpad on system suspend
    64575ec3d24a HID: i2c-hid: Renumber I2C_HID_QUIRK_ defines
    e600ee984f72 HID: i2c-hid: Remove I2C_HID_QUIRK_SET_PWR_WAKEUP_DEV quirk
    b289b83409a6 HID: mcp2200: added driver for GPIOs of MCP2200
    84a5feebba10 rcu/nocb: Fix rcuog wake-up from offline softirq
    174caf7a16d6 rcu/nocb: Make IRQs disablement symmetric
    8bb79eb1db85 slip: make slhc_remember() more robust against malicious packets
    8fe992ff3df4 ppp: fix ppp_async_encode() illegal access
    c246bfbb35fb phonet: Handle error of rtnl_register_module().
    a8e473f7454a phonet: no longer hold RTNL in route_dumpit()
    4597c3866d04 mpls: Handle error of rtnl_register_module().
    ff7abccdd581 mpls: no longer hold RTNL in mpls_netconf_dump_devconf()
    ba5366b87c0d rtnetlink: add RTNL_FLAG_DUMP_UNLOCKED flag
    c8c76f1550b9 rtnetlink: change nlk->cb_mutex role
    f4df31a05153 mctp: Handle error of rtnl_register_module().
    60bfd345cc9b bridge: Handle error of rtnl_register_module().
    ca15d2882d8a vxlan: Handle error of rtnl_register_module().
    35b72beac967 rtnetlink: Add bulk registration helpers for rtnetlink message handlers.
    eae7435b48ff net: do not delay dst_entries_add() in dst_release()
    64121e36fdce netfilter: fib: check correct rtable in vrf setups
    997f67d813ce netfilter: xtables: avoid NFPROTO_UNSPEC where needed
    b4ff011609d0 sctp: ensure sk_state is set to CLOSED if hashing fails in sctp_listen_start
    a63850d0d941 btrfs: zoned: fix missing RCU locking in error message when loading zone info
    25c5ef253a4c net: ibm: emac: mal: fix wrong goto
    1edf039ee017 net/sched: accept TCA_STAB only for root qdisc
    ba578ecdd161 e1000e: change I219 (19) devices to ADP
    57c5053eaa5f igb: Do not bring the device up after non-fatal error
    703c4d820b31 i40e: Fix macvlan leak by synchronizing access to mac_filter_hash
    29d7aa1857b2 ice: Flush FDB entries before reset
    3b66266aa7ec ice: rename switchdev to eswitch
    fa6ab2d78c19 ice: Fix netif_is_ice() in Safe Mode
    a91c6e117079 powercap: intel_rapl_tpmi: Ignore minor version change
    f0a6c431d20d platform/x86/intel/tpmi: Add defines to get version information
    1e4a5eed757c gpio: aspeed: Use devm_clk api to manage clock source
    2a165df9ce20 gpio: aspeed: Add the flush write to ensure the write complete.
    cfa836da7f4c nouveau/dmem: Fix privileged error in copy engine channel
    0aac3fb641cc drm/nouveau: pass cli to nouveau_channel_new() instead of drm+device
    ca57186f2dec net: dsa: b53: fix jumbo frames on 10/100 ports
    dd5b3a830540 net: dsa: b53: allow lower MTUs on BCM5325/5365
    94c4cb9b9113 net: dsa: b53: fix max MTU for BCM5325/BCM5365
    bd1f41c3abd1 net: dsa: b53: fix max MTU for 1g switches
    f9a966afcd76 net: dsa: b53: fix jumbo frame mtu check
    1d068c925418 net: ethernet: adi: adin1110: Fix some error handling path in adin1110_read_fifo()
    826e9b748dec Revert "net: stmmac: set PP_FLAG_DMA_SYNC_DEV only if XDP is enabled"
    dd64ea033756 thermal: intel: int340x: processor: Fix warning during module unload
    335a4cbcaa6b thermal: int340x: processor_thermal: Set feature mask before proc_thermal_add
    80a146b9bb08 net: phy: bcm84881: Fix some error handling paths
    38b2d5a57d12 Bluetooth: RFCOMM: FIX possible deadlock in rfcomm_sk_state_change
    597ea17d84d3 selftests: net: no_forwarding: fix VID for $swp2 in one_bridge_two_pvids() test
    3453f5839420 netfilter: br_netfilter: fix panic with metadata_dst skb
    446be5505ea0 rxrpc: Fix uninitialised variable in rxrpc_send_data()
    2daffbd861de tcp: fix TFO SYN_RECV to not zero retrans_stamp with retransmits out
    718c49f840ef tcp: new TCP_INFO stats for RTO events
    04dce9a12050 tcp: fix tcp_enter_recovery() to zero retrans_stamp when it's safe
    e676ca60ad2a tcp: fix to allow timestamp undo if no retransmits were sent
    9ca634676ff6 net: phy: dp83869: fix memory corruption when enabling fiber
    fca41e5fa491 NFSv4: Prevent NULL-pointer dereference in nfs42_complete_copies()
    dedc14e1301a SUNRPC: Fix integer overflow in decode_rc_list()
    fde7db1c0614 ice: fix VLAN replay after reset
    803f31073b08 ice: set correct dst VSI in only LAN filters
    4ab072325c62 NFSD: Mark filecache "down" if init fails
    1fab0233720f x86/amd_nb: Add new PCI IDs for AMD family 1Ah model 60h
    9736678bc21c x86/amd_nb: Add new PCI IDs for AMD family 0x1a
    688872c4ea4a fbdev: sisfb: Fix strbuf array overflow
    0809fb86ad13 smb: client: fix UAF in async decryption
    f7fb5dda5553 fbcon: Fix a NULL pointer dereference issue in fbcon_putcs
    65b2d49e55fe drm/amd/display: Check null pointer before dereferencing se
    0ef6e016eb53 scsi: lpfc: Ensure DA_ID handling completion before deleting an NPIV instance
    ab88c77894aa scsi: lpfc: Add ELS_RSP cmd to the list of WQEs to flush in lpfc_els_flush_cmd()
    5da9855385bc driver core: bus: Return -EIO instead of 0 when show/store invalid bus attribute
    d885c464c250 driver core: bus: Fix double free in driver API bus_register()
    a84ae28d710b staging: vme_user: added bound check to geoid
    5b53a7a6bdba tools/iio: Add memory allocation failure check for trigger_name
    b01793cc63dd virtio_pmem: Check device status before requesting flush
    784744b01b08 netfilter: nf_reject: Fix build warning when CONFIG_BRIDGE_NETFILTER=n
    5b04f41abaf8 netfilter: nf_nat: don't try nat source port reallocation for reverse dir clash
    1215e29918af LoongArch: Fix memleak in pci_acpi_scan_root()
    0b700d29ebad comedi: ni_routing: tools: Check when the file could not be opened
    0be52823e51c usb: dwc2: Adjust the timing of USB Driver Interrupt Registration in the Crashkernel Scenario
    01ac64e09261 usb: chipidea: udc: enable suspend interrupt after usb reset
    b72bf5cade51 usb: typec: tipd: Free IRQ only if it was requested before
    e418d91195d2 serial: protect uart_port_dtr_rts() in uart_shutdown() too
    339273a9ddfe clk: imx: Remove CLK_SET_PARENT_GATE for DRAM mux for i.MX7D
    7fb5f957213b remoteproc: imx_rproc: Use imx specific hook for find_loaded_rsc_table
    7af8d697b70f media: videobuf2-core: clear memory related fields in __vb2_plane_dmabuf_put()
    a39416d8597a riscv/kexec_file: Fix relocation type R_RISCV_ADD16 and R_RISCV_SUB16 unknown
    740a6059c367 soundwire: cadence: re-check Peripheral status with delayed_work
    99002ae8a1a8 RDMA/mlx5: Enforce umem boundaries for explicit ODP page faults
    a29a9c2c9dce riscv: avoid Imbalance in RAS
    50c4307e8261 mfd: intel_soc_pmic_chtwc: Make Lenovo Yoga Tab 3 X90F DMI match less strict
    fa840ba4bd9f ntb: ntb_hw_switchtec: Fix use after free vulnerability in switchtec_ntb_remove due to race condition
    f4ce3b5d26ce io_uring: check if we need to reschedule during overflow flush
    30884833361b RISC-V: Don't have MAX_PHYSMEM_BITS exceed phys_addr_t
    ea0256e393e0 i3c: master: cdns: Fix use after free vulnerability in cdns_i3c_master Driver Due to Race Condition
    8f53f6f96678 PCI: Mark Creative Labs EMU20k2 INTx masking as broken
    f8e2a0416a68 i2c: i801: Use a different adapter-name for IDF adapters
    2488685858ed PCI: Add ACS quirk for Qualcomm SA8775P
    f829cb4535ba clk: bcm: bcm53573: fix OF node leak in init
    ccb8e44ae3e2 RDMA/rtrs-srv: Avoid null pointer deref during path establishment
    bd9a77a93049 PCI: Add function 0 DMA alias quirk for Glenfly Arise chip
    1598bf01006d soundwire: intel_bus_common: enable interrupts before exiting reset
    a195a42dd25c RDMA/mad: Improve handling of timed out WRs of mad agent
    6ba8ecf9aa4e ktest.pl: Avoid false positives with grub2 skip regex
    5d5e3b4cbe8e bpf: Prevent tail call between progs attached to different hooks
    96b128028801 s390/cpum_sf: Remove WARN_ON_ONCE statements
    e789b7fdd7ba ext4: nested locking for xattr inode
    58c0648e4c77 ext4: don't set SB_RDONLY after filesystem errors
    cadbdd78e049 bpf, x64: Fix a jit convergence issue
    5575beab1b26 s390/mm: Add cond_resched() to cmm_alloc/free_pages()
    78cddbd77595 s390/facility: Disable compile time optimization for decompressor code
    c43622d6f917 bpf: Check percpu map value size first
    aaa880f8a9a5 selftests/bpf: Fix ARG_PTR_TO_LONG {half-,}uninitialized test
    1881193bf2cb Input: synaptics-rmi4 - fix UAF of IRQ domain on driver removal
    6e20720b1229 zram: don't free statically defined names
    6272936fd242 zram: free secondary algorithms names
    c556e72cea2a ntfs3: Change to non-blocking allocation in ntfs_d_hash
    fd94986382d1 virtio_console: fix misc probe bugs
    5e20797c824b fs/ntfs3: Refactor enum_rstbl to suppress static checker
    cdb1efee542c fs/ntfs3: Fix sparse warning in ni_fiemap
    16f93bdd61e4 fs/ntfs3: Do not call file_modified if collapse range failed
    939b4b2c008d drm/amd/display: Revert "Check HDCP returned status"
    b505e4fc411c drm/amd/display: Remove a redundant check in authenticated_dp
    1a7ca970112c lib/build_OID_registry: avoid non-destructive substitution for Perl < 5.13.2 compat
    dcfaf8b500db jbd2: fix kernel-doc for j_transaction_overhead_buffers
    5f77c8e84ae4 Bluetooth: Fix usage of __hci_cmd_sync_status
    66c43605be89 selftests: Introduce Makefile variable to list shared bash scripts
    f45c65b1b941 selftests: net: Remove executable bits from library scripts
    ab656dd9fc0d libsubcmd: Don't free the usage string
    03cec19f546d perf sched: Move curr_pid and cpu_last_switched initialization to perf_sched__{lat|map|replay}()
    4078f1d442d8 perf sched: Move curr_thread initialization to perf_sched__map()
    e649fb7f8361 perf sched: Fix memory leak in perf_sched__map()
    85ca3d45bd40 perf sched: Move start_work_mutex and work_done_wait_mutex initialization to perf_sched__replay()
    86052433693b bootconfig: Fix the kerneldoc of _xbc_exit()
    f0fc028b6f1f e1000e: move force SMBUS near the end of enable_ulp function
    1fe83044fdc9 i40e: Include types.h to some headers
    f717743ecfdf i40e: Fix ST code value for Clause 45
    a47a759e435b scsi: sd: Do not repeat the starting disk message
    9e6075e112ee scsi: Remove scsi device no_start_on_resume flag
    2e561175e9cf ASoC: tas2781: mark dvc_tlv with __maybe_unused
    9c122d020a62 ata: ahci: Add mask_port_map module parameter
    924c0af49c63 spi: spi-fsl-lpspi: remove redundant spi_controller_put call
    18f3fdb17496 riscv: cpufeature: Fix thead vector hwcap removal
    5915b8981ad6 tracing: Have saved_cmdlines arrays all in one allocation
    26c907b8d887 libceph: init the cursor when preparing sparse read in msgr2
    fb90d9729549 pds_core: no health-thread in VF path
    bd1521e0ea9a Revert "powerpc/ps3_defconfig: Disable PPC64_BIG_ENDIAN_ELF_ABI_V2"
    43987659fa9c bus: mhi: ep: Do not allocate memory for MHI objects from DMA zone
    39601f49c9e0 bus: mhi: ep: Add support for async DMA read operation
    b6af3a95417b bus: mhi: ep: Add support for async DMA write operation
    a77e5950f93f bus: mhi: ep: Introduce async read/write callbacks
    efdfa92a823a bus: mhi: ep: Rename read_from_host() and write_to_host() APIs
    be6c52b059a2 drm/crtc: fix uninitialized variable use even harder
    0d3d2236a0e0 ALSA: hda/realtek: cs35l41: Fix device ID / model name
    c800174e0865 ALSA: hda/realtek: cs35l41: Fix order and duplicates in quirks table
    e87cb9dd3fad tracing: Remove precision vsnprintf() check from print event
    9dd05dac697c drm/panel: boe-tv101wum-nl6: Fine tune Himax83102-j02 panel HFP and HBP (again)
    452c0740d72c net: ethernet: cortina: Drop TSO support
    6e0d0554d857 riscv: Remove SHADOW_OVERFLOW_STACK_SIZE macro
    50e33567bc4a gfs2: Revert "ignore negated quota changes"
    8251e3b0ce92 gfs2: qd_check_sync cleanups
    e51c5aff8480 gfs2: Revert "introduce qd_bh_get_or_undo"
    9060935b4b8b phy: qualcomm: eusb2-repeater: Rework init to drop redundant zero-out loop
    fa3532b1540f phy: qualcomm: phy-qcom-eusb2-repeater: Add tuning overrides
    e905bc71e7ed ASoC: cs35l56: Load tunings for the correct speaker models
    9790a7acc352 Revert "PCI/MSI: Provide stubs for IMS functions"
    7745e14f4c03 net: fec: don't save PTP state if PTP is unsupported
    ac20736861f3 unicode: Don't special case ignorable code points
    18abb2787b53 x86/syscall: Mark exit[_group] syscall handlers __noreturn
    2879d995e569 pnmtologo: sync with 6.6
    43ea1c5e6eb3 lib/build_OID_registry: take -stable reproducibility changes
    35046aea43c8 bpftool: Fix undefined bpf macro for unix socket
    9a558d4b8621 tools/resolve_btfids: Fix comparison of distinct pointer types warning in resolve_btfids
    42b2eec2e503 bpftool: Query only cgroup-related attach types
    f71bb11887ba cpu/amd: inhibit SMP check for qemux86
    c31365597a17 powerpc/uaccess: Fix build errors seen with GCC 13/14
    64ebf485c56b usb: dwc3: core: remove lock of otg mode during gadget suspend/resume to avoid deadlock
    7c76aad68f6d kselftest: Add a ksft_perror() helper
    06644f0d7193 drm/tilcdc: Set preferred depth
    ff7ae7b32324 crypto: jitter - add RCT/APT support for different OSRs
    50cd24ddb6f0 arm64: defconfig: remove CONFIG_IPQ_APSS_5018
    58e5c91d6701 x86/alternatives: Disable interrupts and sync when optimizing NOPs in place
    c878fd2d4c79 x86/alternatives: Sync core before enabling interrupts
    c2d64b9f52b6 qemux86: add configuration symbol to select values
    630c33229e6d sched/isolation: really align nohz_full with rcu_nocbs
    0e5e0f68e2e6 clear_warn_once: add a clear_warn_once= boot parameter
    46934791b902 clear_warn_once: bind a timer to written reset value
    cdee9e38ff32 clear_warn_once: expand debugfs to include read support
    82b562b81841 tools: Remove some options from CLANG_CROSS_FLAGS
    36dc380b776b libbpf: Fix build warning on ref_ctr_off
    9e3e1fe20982 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    e497a4a5da65 perf: x86-32: explicitly include <errno.h>
    7b57ddd89565 perf: mips64: Convert __u64 to unsigned long long
    1cfc19423dc7 perf: fix bench numa compilation
    98bc2815fade perf: add SLANG_INC for slang.h
    17209a70b9b3 perf: add sgidefs.h to for mips builds
    9cd4258d910a perf: change --root to --prefix for python install
    8110a4f26628 perf: add 'libperl not found' warning
    bc89d5e08f77 perf: force include of <stdbool.h>
    4f6c760cc876 fat: Replace prandom_u32() with get_random_u32()
    bc53117b12b2 fat: don't use obsolete random32 call in namei_vfat
    30b2236ab378 FAT: Added FAT_NO_83NAME
    cef98d22b4ed FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    0bbd7daba9e1 FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    5883fc340084 aufs6: adapt to v6.6 i_op->ctime changes
    c4342d979bf2 aufs6: fix magic.mk include path
    35266bc2dc81 aufs6: adapt to v6.6
    8edede4e98be aufs6: core
    712248233ebe aufs6: standalone
    3b71a8a848d8 aufs6: mmap
    3e2924871f37 aufs6: base
    7f4907a93101 aufs6: kbuild
    d2f7b03e4aa7 yaffs2: update VFS ctime operations to 6.6+
    bcd6cfcd1aa0 yaffs2: v6.5 fixups
    cc615704b5f5 yaffs2: Fix miscalculation of devname buffer length
    8ef2e22dcf91 yaffs2: convert user_namespace to mnt_idmap
    c9c749f9f7d3 yaffs2: replace bdevname call with sprintf
    395b01cdc39d yaffs2: convert read_page -> readfolio
    d98b07e43ba6 yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    613c6d50fdbe yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    622c4648936f yaffs2: v5.12+ build fixups (not runtime tested)
    7562133d4090 yaffs: include blkdev.h
    dbd44252cd59 yaffs: fix misplaced variable declaration
    c223a10b1ac0 yaffs2: v5.6 build fixups
    90f6007cfbf4 yaffs2: fix memory leak when /proc/yaffs is read
    37ee169c5ea1 yaffs: add strict check when call yaffs_internal_read_super
    b6e007b8abb6 yaffs: repair yaffs_get_mtd_device
    fb98f65a466a yaffs: Fix build failure by handling inode i_version with proper atomic API
    51e0aac75ea2 yaffs2: fix memory leak in mount/umount
    2b74a0cae7b0 yaffs: Avoid setting any ACL releated xattr
    ff4130a9c376 Yaffs:check oob size before auto selecting Yaffs1
    ba95b409c67c fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    8fa35eba9056 yaffs2: adjust to proper location of MS_RDONLY
    1eb5deaad8c4 yaffs2: import git revision b4ce1bb (jan, 2020)
    4dce67c1e8c8 initramfs: allow an optional wrapper script around initramfs generation
    2f603d83fcc4 pnmtologo: use relocatable file name
    664a6a0a484b tools: use basename to identify file in gen-mach-types
    9de64bc0c185 lib/build_OID_registry: fix reproducibility issues
    ae9b80797295 vt/conmakehash: improve reproducibility
    a972323151bd iwlwifi: select MAC80211_LEDS conditionally
    15d2adcc0198 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    5556a6c04b19 arm64/perf: Fix wrong cast that may cause wrong truncation
    5552dc768ffc defconfigs: drop obselete options
    00fe4152df31 arm64/perf: fix backtrace for AAPCS with FP enabled
    3888d0652edf linux-yocto: Handle /bin/awk issues
    3d55d299f23a uvesafb: provide option to specify timeout for task completion
    23c068c080be uvesafb: print error message when task timeout occurs
    edbfc939266e compiler.h: Undef before redefining __attribute_const__
    c99ae7e2a19a vmware: include jiffies.h
    572d84d928c8 Resolve jiffies wrapping about arp
    fdcd47cac843 nfs: Allow default io size to be configured.
    927d48801098 check console device file on fs when booting
    57cc27f821dd mount_root: clarify error messages for when no rootfs found
    1b53d82a8152 mconf: fix output of cflags and libraries
    1811da09f42c menuconfig,mconf-cfg: Allow specification of ncurses location
    83c2e0c6eb1f modpost: mask trivial warnings
    6de673039484 kbuild: exclude meta directory from distclean processing
    6decd32815f5 powerpc: serialize image targets
    f6b683b38318 arm: serialize build targets
    e798b09ebf57 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    dc8a1e5a88f8 x86_64_defconfig: Fix warnings
    68491e5f72b6 powerpc/ptrace: Disable array-bounds warning with gcc8
    d71ebfce3004 powerpc: Disable attribute-alias warnings from gcc8
    62f50884b8b1 powerpc: kexec fix for powerpc64
    da6871c62c37 powerpc: Add unwind information for SPE registers of E500 core
    f161c880c11d mips: make current_cpu_data preempt safe
    5e94a8247ce7 mips: vdso: fix 'jalr $t9' crash in vdso code
    19e36714b1c7 mips: Kconfig: add QEMUMIPS64 option
    e2e537db3cbd 4kc cache tlb hazard: tlbp cache coherency
    aee9870611e5 malta uhci quirks: make allowance for slow 4k(e)c
    881948cd1517 drm/fb-helper: move zeroing code to drm_fb_helper_fill_var
    98ec1963fcb7 arm64: defconfig: cleanup config options
    f1727c537ba8 vexpress: Pass LOADADDR to Makefile
    4474c32dc24a arm: ARM EABI socketcall
    75e31a2b70fd ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e8a5b1c53d9cae12b4f3c6d3259be55df5f1d2f4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 67ab87170a..fa4a8f564e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b4c40099f879ea449a59d7a503481a17c3e66210"
-SRCREV_meta ?= "e9e4b926a150efa11d55c454e1230a6ffa557aa7"
+SRCREV_machine ?= "0dc843fc43271230499a7e5c39e7a22eb1dbd2b9"
+SRCREV_meta ?= "b1108273b878547b3d3281f21aba44a8c41ca741"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.56"
+LINUX_VERSION ?= "6.6.58"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 364752185a..d913e09212 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.56"
+LINUX_VERSION ?= "6.6.58"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "fa499b0011358a6816108e097efae3d689242b7e"
-SRCREV_meta ?= "e9e4b926a150efa11d55c454e1230a6ffa557aa7"
+SRCREV_machine ?= "cf1b259ea79d8e8509e08f9c121e2bab85412d30"
+SRCREV_meta ?= "b1108273b878547b3d3281f21aba44a8c41ca741"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 0b9cec5dd2..9feaec24c4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "13d5d6eadef09782574d682a8ab07833cd707568"
-SRCREV_machine:qemuarm64 ?= "fa499b0011358a6816108e097efae3d689242b7e"
-SRCREV_machine:qemuloongarch64 ?= "fa499b0011358a6816108e097efae3d689242b7e"
-SRCREV_machine:qemumips ?= "c766982c5c5fe27a21d86eefb8b6d9008ead2ae9"
-SRCREV_machine:qemuppc ?= "fa499b0011358a6816108e097efae3d689242b7e"
-SRCREV_machine:qemuriscv64 ?= "fa499b0011358a6816108e097efae3d689242b7e"
-SRCREV_machine:qemuriscv32 ?= "fa499b0011358a6816108e097efae3d689242b7e"
-SRCREV_machine:qemux86 ?= "fa499b0011358a6816108e097efae3d689242b7e"
-SRCREV_machine:qemux86-64 ?= "fa499b0011358a6816108e097efae3d689242b7e"
-SRCREV_machine:qemumips64 ?= "917501a67b861765419d9ad1051de54d3353a9c8"
-SRCREV_machine ?= "fa499b0011358a6816108e097efae3d689242b7e"
-SRCREV_meta ?= "e9e4b926a150efa11d55c454e1230a6ffa557aa7"
+SRCREV_machine:qemuarm ?= "4716fde8fc6bd72e95465c85e6a0c5878df3f59b"
+SRCREV_machine:qemuarm64 ?= "cf1b259ea79d8e8509e08f9c121e2bab85412d30"
+SRCREV_machine:qemuloongarch64 ?= "cf1b259ea79d8e8509e08f9c121e2bab85412d30"
+SRCREV_machine:qemumips ?= "b1965dc5855088df8636d3891f366e9b5bcdf95e"
+SRCREV_machine:qemuppc ?= "cf1b259ea79d8e8509e08f9c121e2bab85412d30"
+SRCREV_machine:qemuriscv64 ?= "cf1b259ea79d8e8509e08f9c121e2bab85412d30"
+SRCREV_machine:qemuriscv32 ?= "cf1b259ea79d8e8509e08f9c121e2bab85412d30"
+SRCREV_machine:qemux86 ?= "cf1b259ea79d8e8509e08f9c121e2bab85412d30"
+SRCREV_machine:qemux86-64 ?= "cf1b259ea79d8e8509e08f9c121e2bab85412d30"
+SRCREV_machine:qemumips64 ?= "b15f0ede8d222c8fe745a21e830166a7a8da2f1f"
+SRCREV_machine ?= "cf1b259ea79d8e8509e08f9c121e2bab85412d30"
+SRCREV_meta ?= "b1108273b878547b3d3281f21aba44a8c41ca741"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "d4576c5670090297b903771726a526f81fdd8c7c"
+SRCREV_machine:class-devupstream ?= "18916a684a8b836957df88438f9bca590799d04c"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.56"
+LINUX_VERSION ?= "6.6.58"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


