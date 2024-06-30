Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2597BC3065C
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 20:08:49 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.4378.1719778121446423516
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jun 2024 13:08:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=u1WTOd8O;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-70673c32118so1316459b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 13:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719778121; x=1720382921; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9zWKiEcrrRZvetqcm0MkXtmt/ik9YjdfBiVgn7Sc3uk=;
        b=u1WTOd8OF+TwvC41VmGhMxapBDpA4+RCcbZuRa4PO/fqnPIfZt4EJesCWCH++7MlcU
         NuO6L8dmb+wmOS1I5ZIWrGxCAjAdDGHqKGN+o7uMDz9TWSK9wmDXwUFuPc5pQkwOFsGF
         djSz0ESjZcDdX4j5C5KPMFSqIL+RCNMe1Iw8KyT1CS2hif+gdfSCkl5Kfr2k7jR7cuu7
         yUmS63fbXU5w3KbbFlLeZCmarOnZtvj+LqhzhFJzYpLcRwSZmyb2efemg1yc5d5v3upZ
         SD1iXWK/0ShTEj/1LQDKTRcqCGc/D/e25j4xQKQvAfEniUVuND4rXEWo/0X2EwuBDhlf
         jcKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719778121; x=1720382921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9zWKiEcrrRZvetqcm0MkXtmt/ik9YjdfBiVgn7Sc3uk=;
        b=sd8I6XwdNtWzqnszwJv8pkgDC/RjNmwm+5CGuuto1XNi0uofq3AyF9PAbhdSo3jpYP
         CgvYUHJQaLaIc5AmYwe989t0MpOsE4VV+vVYtxl6Ht9Ox99kk3++mEZe3hzGrzVVkJgx
         Rf0NHUgJ9vjQAoEsd7lIPBOzoqpZtugQHvsez2/08bd6fP6HeOAd64cmQAgHrcaPdVhv
         ovA/q/w0nAtiCfZM4B4LGuzk+88BwUg2gUGBwSKMLoFh5gsEriqZpw8PIl27bZtWJ00s
         KxtqWxCEYscIG4cHG+yLelQGQ3OSyqF+J7idfl+uI7aVDC42Pq/KHc5s45MuW29wiplT
         RZBg==
X-Gm-Message-State: AOJu0YytTJEdvRsAdiXJlFjEUP4paYGnTZj6bbjKPRuKjqLYIhikx+LK
	FBLXr5apgfr1G7QiDms7FvU/f8VDI7A/x97jxyub7tZWiR2DNZA3WITDQjW+nGU+yXetncHU5Dm
	LcMQ=
X-Google-Smtp-Source: AGHT+IHPVwXAdqgtiWOo0Ngh7cqrXIH7QgG5oT58pJSpAjE84HQVo/+BPKR7CG9uGA9fJE7Mg7DrhQ==
X-Received: by 2002:a05:6a00:80f:b0:705:c029:c9a7 with SMTP id d2e1a72fcca58-70aaad60533mr3057860b3a.15.1719778119992;
        Sun, 30 Jun 2024 13:08:39 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6a6f0817sm3340835a12.27.2024.06.30.13.08.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 13:08:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 25/35] linux-yocto/6.6: update to v6.6.32
Date: Sun, 30 Jun 2024 13:07:37 -0700
Message-Id: <8533605594fbf1a0e31373b69bde49f6c3a270cb.1719777887.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719777887.git.steve@sakoman.com>
References: <cover.1719777887.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 20:08:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201262

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    91de249b6804 Linux 6.6.32
    3ffef551160a block: add a partscan sysfs attribute for disks
    d6b6dfff6cda block: add a disk_has_partscan helper
    fe4549b1d6ac Docs/admin-guide/mm/damon/usage: fix wrong example of DAMOS filter matching sysfs file
    71483049de80 docs: kernel_include.py: Cope with docutils 0.21
    1266e5a8f5bc admin-guide/hw-vuln/core-scheduling: fix return type of PR_SCHED_CORE_GET
    1c652e1e1067 KEYS: trusted: Do not use WARN when encode fails
    26c6d7dc8c6a remoteproc: mediatek: Make sure IPI buffer fits in L2TCM
    642069561ea5 serial: kgdboc: Fix NMI-safety problems from keyboard reset code
    40b963e45cbb usb: typec: tipd: fix event checking for tps6598x
    2f95dfb647a8 usb: typec: ucsi: displayport: Fix potential deadlock
    a202b26d9531 net: usb: ax88179_178a: fix link status when link is set to down/up
    ec96bcf5f96a usb: dwc3: Wait unconditionally after issuing EndXfer command
    71df2cb2869d binder: fix max_thread type inconsistency
    c364e7a34c85 drm/amdgpu: Fix possible NULL dereference in amdgpu_ras_query_error_status_helper()
    f9b877a7ee31 erofs: reliably distinguish block based and fscache mode
    3924179ba933 erofs: get rid of erofs_fs_context
    fcb05fee0006 bpf: Add missing BPF_LINK_TYPE invocations
    f70d849b679b kselftest: Add a ksft_perror() helper
    7b4bd57cf005 mmc: core: Add HS400 tuning in HS400es initialization
    e62835264d03 KEYS: trusted: Fix memory leak in tpm2_key_encode()
    ad3f7986c5a0 Bluetooth: L2CAP: Fix div-by-zero in l2cap_le_flowctl_init()
    cfe560c7050b Bluetooth: L2CAP: Fix slab-use-after-free in l2cap_connect()
    4d29fd53a0cb ice: remove unnecessary duplicate checks for VF VSI ID
    0ca683f921a9 ice: pass VSI pointer into ice_vc_isvalid_q_id
    3a7ac4902917 net: ks8851: Fix another TX stall caused by wrong ISR flag handling
    7e4f50dfc98c drm/amd/display: Fix division by zero in setup_dsc_config
    d4a079d1466d smb: smb2pdu.h: Avoid -Wflex-array-member-not-at-end warnings
    5a65254c4c4a ksmbd: add continuous availability share parameter
    07e76ea1799c cifs: Add tracing for the cifs_tcon struct refcounting
    2004e41cd2c4 smb: client: instantiate when creating SFU files
    01bce099af0f smb: client: fix NULL ptr deref in cifs_mark_open_handles_for_deleted_file()
    dbd2df36cd67 smb3: add trace event for mknod
    8aff8b8b177d smb311: additional compression flag defined in updated protocol spec
    a9aa7a776efc smb311: correct incorrect offset field in compression header
    c1f3c8204e6f cifs: Move some extern decls from .c files to .h
    39bdc4197acf ksmbd: fix potencial out-of-bounds when buffer offset is invalid
    9e4937cbc150 ksmbd: fix slab-out-of-bounds in smb_strndup_from_utf16()
    74dc3e5bf6e1 ksmbd: Fix spelling mistake "connction" -> "connection"
    27b40b7bfcd1 ksmbd: fix possible null-deref in smb_lazy_parent_lease_break_close
    8b2326963da7 cifs: remove redundant variable assignment
    1598a015c761 cifs: fixes for get_inode_info
    91cdeb0d4baf cifs: defer close file handles having RH lease
    8df4bcdb0a42 ksmbd: add support for durable handles v1/v2
    665e85883098 ksmbd: mark SMB2_SESSION_EXPIRED to session when destroying previous session
    eb4a05e3c34b smb: common: simplify compression headers
    fdd938b2b468 smb: common: fix fields sizes in compression_pattern_payload_v1
    e8aee4f4d2e3 smb: client: negotiate compression algorithms
    25f3604fcd62 smb3: add dynamic trace point for ioctls
    c057a809e128 smb: client: return reparse type in /proc/mounts
    582524019459 smb: client: set correct d_type for reparse DFS/DFSR and mount point
    97db41604555 smb: client: parse uid, gid, mode and dev from WSL reparse points
    7449d736bbbd smb: client: introduce SMB2_OP_QUERY_WSL_EA
    b93ac66fa236 smb: client: Fix a NULL vs IS_ERR() check in wsl_set_xattrs()
    df0a8a192510 smb: client: add support for WSL reparse points
    831ffbd1c7b5 smb: client: reduce number of parameters in smb2_compound_op()
    84c597f7f98c smb: client: fix potential broken compound request
    db0f1c0770bc smb: client: move most of reparse point handling code to common file
    c1468c7e0ab9 smb: client: introduce reparse mount option
    1e60bc0e9543 smb: client: retry compound request without reusing lease
    b6e27f7fc245 smb: client: do not defer close open handles to deleted files
    f93d145f9002 smb: client: reuse file lease key in compound operations
    cfb8f73da601 smb: client: get rid of smb311_posix_query_path_info()
    a90f37e3d7ac smb: client: parse owner/group when creating reparse points
    e4232010b13a smb3: update allocation size more accurately on write completion
    fff4045e712b smb: client: handle path separator of created SMB symlinks
    1b5f2928cc6b cifs: update the same create_guid on replay
    75417833bb3e ksmbd: Add kernel-doc for ksmbd_extract_sharename() function
    cdd7870a5fd5 cifs: set replay flag for retries of write command
    433042a91f93 cifs: commands that are retried should have replay flag set
    a5df7820310b smb: client: delete "true", "false" defines
    5cf3fddbd368 smb: Fix some kernel-doc comments
    b4ca2942a0a4 cifs: new mount option called retrans
    de2cadf4bffa smb: client: don't clobber ->i_rdev from cached reparse points
    6789c8387676 cifs: new nt status codes from MS-SMB2
    b96ea433fff4 cifs: pick channel for tcon and tdis
    36f8070c9bdb cifs: minor comment cleanup
    8358f46bef22 cifs: remove redundant variable tcon_exist
    67ed045c5f40 ksmbd: vfs: fix all kernel-doc warnings
    d4caa984c971 ksmbd: auth: fix most kernel-doc warnings
    42430638ace6 cifs: remove unneeded return statement
    8e6a3999e6d5 cifs: get rid of dup length check in parse_reparse_point()
    774c6452475e cifs: Pass unbyteswapped eof value into SMB2_set_eof()
    88e07de246fa smb3: Improve exception handling in allocate_mr_list()
    d53fcb485f4b cifs: fix in logging in cifs_chan_update_iface
    304ff3c1b07c smb: client: handle special files and symlinks in SMB3 POSIX
    870c73abef4b smb: client: cleanup smb2_query_reparse_point()
    00ecebcb86d8 smb: client: allow creating symlinks via reparse points
    a158bb66b137 smb: client: optimise reparse point querying
    02bcf865cc53 smb: client: allow creating special files via reparse points
    886b7fb4556d smb: client: extend smb2_compound_op() to accept more commands
    da70c1d3c584 smb: client: Fix minor whitespace errors and warnings
    abea3c9ac8c6 smb: client: introduce cifs_sfu_make_node()
    a7b537b3be9f cifs: fix use after free for iface while disabling secondary channels
    bb536892dadd Missing field not being returned in ioctl CIFS_IOC_GET_MNT_INFO
    210c8b9d496e smb3: minor cleanup of session handling code
    cc3035d092eb smb3: more minor cleanups for session handling routines
    b74c8d9be35a smb3: minor RDMA cleanup
    9c88aae1e44c cifs: print server capabilities in DebugData
    69a1669a6ba1 smb: use crypto_shash_digest() in symlink_hash()
    5b3c76351b49 Add definition for new smb3.1.1 command type
    c5c63108a868 SMB3: clarify some of the unused CreateOption flags
    6bd52f41d804 cifs: Add client version details to NTLM authenticate message
    e3d332aaf898 Linux 6.6.31
    9fd0198f7ef0 md: fix kmemleak of rdev->serial
    b02372814ad6 Revert "selftests/bpf: Add netkit to tc_redirect selftest"
    7e0a32287741 mm/hugetlb: fix DEBUG_LOCKS_WARN_ON(1) when dissolve_free_hugetlb_folio()
    845cf1c76987 btrfs: do not wait for short bulk allocation
    25777f3f4e1f keys: Fix overwrite of key expiration on instantiation
    9fda5aed60a0 dmaengine: idxd: add a write() method for applications to submit work
    8cacaaa47568 dmaengine: idxd: add a new security check to deal with a hardware erratum
    c516453577d0 VFIO: Add the SPR_DSA and SPR_IAX devices to the denylist
    7bcba557d5c3 Bluetooth: qca: fix firmware check error path
    6b63e0ef4d3c Bluetooth: qca: fix info leak when fetching fw build id
    ba307abed5e0 Bluetooth: qca: fix info leak when fetching board id
    9d23305f8610 Bluetooth: qca: generalise device address check
    c3a38d10b9ea Bluetooth: qca: fix NVM configuration parsing
    427281f9498e Bluetooth: qca: add missing firmware sanity checks
    2d8823700413 Bluetooth: qca: fix wcn3991 device address check
    3019a9d3d27b Bluetooth: qca: fix invalid device address check
    cc6f5aa151b3 eventfs: Do not treat events directory different than other directories
    0c56915c042a tracefs: Still use mount point as default permissions for instances
    5f91fc82794d tracefs: Reset permissions on remount if permissions are options
    100117279c1d ksmbd: do not grant v2 lease if parent lease key and epoch are not set
    329081691fc2 ksmbd: avoid to send duplicate lease break notifications
    b2ed54957161 ksmbd: off ipv6only for both ipv4/ipv6 binding
    8a5e88cbde3f spi: microchip-core-qspi: fix setting spi bus clock rate
    e9f867739b41 regulator: core: fix debugfs creation regression
    a2da0e5c516b nvme-pci: Add quirk for broken MSIs
    377f3a9a3d03 mm/userfaultfd: reset ptes when close() for wr-protected ones
    468971c3f4b8 mm: use memalloc_nofs_save() in page_cache_ra_order()
    73b58d9d0c8d selftests/mm: fix powerpc ARCH check
    513f8dc02eec x86/apic: Don't access the APIC when disabling x2APIC
    6555d7c06e7c hwmon: (pmbus/ucd9000) Increase delay from 250 to 500us
    b6dbfd5bcc26 net: fix out-of-bounds access in ops_init
    8d0ab6426189 arm64: dts: qcom: sa8155p-adp: fix SDHC2 CD pin configuration
    af8af93c6a4f drm/amd/display: Fix incorrect DSC instance for MST
    7be093e45215 drm/amd/display: Handle Y carry-over in VCP X.Y calculation
    ca82830e4533 drm/i915/bios: Fix parsing backlight BDB data
    be59b2d3d975 drm/i915/gt: Automate CCS Mode setting during engine resets
    b0624c032a02 drm/i915/audio: Fix audio time stamp programming for DP
    7b5fd3af4a25 drm/vmwgfx: Fix invalid reads in fence signaled events
    e10644f8ada4 drm/vmwgfx: Fix Legacy Display Unit
    306e99777886 drm/ttm: Print the memory decryption status just once
    4b4cff994a27 drm/amdkfd: don't allow mapping the MMIO HDP page with large pages
    1a88c18da464 Revert "drm/nouveau/firmware: Fix SG_DEBUG error with nvkm_firmware_ctor()"
    5e2af67d8445 drm/nouveau/firmware: Fix SG_DEBUG error with nvkm_firmware_ctor()
    636a47adcf74 mei: me: add lunar lake point M DID
    785c2392c51e clk: sunxi-ng: a64: Set minimum and maximum rate for PLL-MIPI
    547263745e15 clk: sunxi-ng: common: Support minimum and maximum rate
    ad066c9b0630 slimbus: qcom-ngd-ctrl: Add timeout for wait operation
    a69e1bdd777c dyndbg: fix old BUG_ON in >control parser
    ca3cb178678b ASoC: ti: davinci-mcasp: Fix race condition during probe
    f811ed9af993 ASoC: tegra: Fix DSPK 16-bit playback
    00d1a1bc1f82 net: bcmgenet: synchronize UMAC_CMD access
    51b72afb0db9 net: bcmgenet: synchronize use of bcmgenet_set_rx_mode()
    8b3845de02f9 net: bcmgenet: synchronize EXT_RGMII_OOB_CTRL access
    ef31b4647ee9 xtensa: fix MAKE_PC_FROM_RA second argument
    ffd4917c1edb tipc: fix UAF in error path
    f8a139656c95 e1000e: change usleep_range to udelay in PHY mdic access
    5d6ad8f8efea kmsan: compiler_types: declare __no_sanitize_or_inline
    5eba2638a28d iio: accel: mxc4005: Interrupt handling fixes
    762da5255680 iio: pressure: Fixes BME280 SPI driver data
    b79fc1882386 iio:imu: adis16475: Fix sync mode setting
    3bd0de0bb87d dt-bindings: iio: health: maxim,max30102: fix compatible check
    c57824d4fe07 workqueue: Fix selection of wake_cpu in kick_pool()
    daad878a509d mptcp: only allow set existing scheduler for net.mptcp.scheduler
    aa0c07c1f20e mptcp: ensure snd_nxt is properly initialized on connect
    ac6cf3ce9b7d mm/slab: make __free(kfree) accept error pointers
    6c9c7c1e63b1 maple_tree: fix mas_empty_area_rev() null pointer dereference
    6a911b8884c0 btrfs: set correct ram_bytes when splitting ordered extent
    e42004fd29e5 btrfs: add missing mutex_unlock in btrfs_relocate_sys_chunks()
    5e651695c3c7 firewire: ohci: fulfill timestamp for some local asynchronous transaction
    a34dd17da9d2 ALSA: hda/realtek: Fix mute led of HP Laptop 15-da3001TU
    789326cafbd1 usb: typec: tcpm: Check for port partner validity before consuming it
    b16abab1fb64 usb: typec: tcpm: unregister existing source caps before re-registration
    24e2f570f2c8 usb: typec: tcpm: clear pd_event queue in PORT_RESET
    000f99445553 usb: dwc3: core: Prevent phy suspend during init
    2d8466c9a8bb usb: xhci-plat: Don't include xhci.h
    1a15d6e242bd usb: gadget: f_fs: Fix a race condition when processing setup packets.
    73c05ad46bb4 usb: gadget: f_fs: Fix race between aio_cancel() and AIO request complete
    7a54e5052bde usb: gadget: uvc: use correct buffer size when parsing configfs lists
    2f2886aedeec usb: gadget: composite: fix OS descriptors w_value logic
    63533549ff53 USB: core: Fix access violation during port device removal
    7fce5501d7fc usb: ohci: Prevent missed ohci interrupts
    480c3abbba36 usb: Fix regression caused by invalid ep0 maxpacket in virtual SuperSpeed device
    d5f0c5ea3fc3 usb: typec: ucsi: Fix connector check on init
    4184b7d85422 usb: typec: ucsi: Check for notifications after init
    148ed8b4d64f Reapply "drm/qxl: simplify qxl_fence_wait"
    1fe60ee70943 firewire: nosy: ensure user_length is taken into account when fetching packet contents
    0b76a4f72362 btrfs: fix kvcalloc() arguments order in btrfs_ioctl_send()
    0c7ed3ed35ee drm/amdgpu: once more fix the call oder in amdgpu_ttm_move() v2
    52c1af381cb8 drm/amdgpu: Fix comparison in amdgpu_res_cpu_visible
    7e3030774431 drm/amd/display: Atom Integrated System Info v2_2 for DCN35
    883e4bbf06eb gpiolib: cdev: fix uninitialised kfifo
    309364bc3205 gpiolib: cdev: relocate debounce_period_us from struct gpio_desc
    95ca7c90eaf5 gpiolib: cdev: Fix use after free in lineinfo_changed_notify
    6c83a8f236ec dm/amd/pm: Fix problems with reboot/shutdown for some SMU 13.0.4/13.0.11 users
    1b9e8de483bc drm/connector: Add \n to message about demoting connector force-probes
    fa2d2e2d8eae drm/meson: dw-hdmi: add bandgap setting for g12
    dbe2cf9f09ab drm/meson: dw-hdmi: power up phy on device init
    7019a6416518 net: dsa: mv88e6xxx: add phylink_get_caps for the mv88e6320/21 family
    5c623fe05348 net: hns3: fix kernel crash when devlink reload during initialization
    5a0298f5001b net: hns3: fix port vlan filter not disabled issue
    f806911c220b net: hns3: use appropriate barrier function after setting a bit value
    5d73b414a08a net: hns3: release PTP resources if pf initialization failed
    8ed439067001 net: hns3: change type of numa_node_mask as nodemask_t
    06ce87195a05 net: hns3: direct return when receive a unknown mailbox message
    c9a5a9aa7a45 net: hns3: using user configure after hardware reset
    5df93c029a90 net/smc: fix neighbour and rtable leak in smc_ib_find_route()
    e31b25cc2066 ipv6: prevent NULL dereference in ip6_output()
    4b27116882f5 ipv6: annotate data-races around cnf.disable_ipv6
    d183f297cbb5 hsr: Simplify code for announcing HSR nodes timer setup
    1c2b0f0823f8 net-sysfs: convert dev->operstate reads to lockless ones
    8745a8d74ba1 ipv6: fib6_rules: avoid possible NULL dereference in fib6_rule_action()
    f39c49d06596 dt-bindings: net: mediatek: remove wrongly added clocks and SerDes
    1721afe2ad68 rxrpc: Only transmit one ACK per jumbo packet received
    fa6dbe25e211 rxrpc: Fix congestion control algorithm
    59881e57a722 rxrpc: Fix the names of the fields in the ACK trailer struct
    438d7ceb4523 selftests: test_bridge_neigh_suppress.sh: Fix failures due to duplicate MAC
    2ee2fc6786bc selftests/net: convert test_bridge_neigh_suppress.sh to run it in unique namespace
    68c8ba16ab71 ipv6: Fix potential uninit-value access in __ip6_make_skb()
    1ce60741d7e1 net: bridge: fix corrupted ethernet header on multicast-to-unicast
    6900f0ed0321 nfc: nci: Fix kcov check in nci_rx_work()
    ee9e39a6cb3c phonet: fix rtm_phonet_notify() skb allocation
    d4c6b1807ce6 hwmon: (corsair-cpro) Protect ccp->wait_input_report with a spinlock
    d5ad144fd1ef hwmon: (corsair-cpro) Use complete_all() instead of complete() in ccp_raw_event()
    7d1e7803cb1c hwmon: (corsair-cpro) Use a separate buffer for sending commands
    206003c748b8 rtnetlink: Correct nested IFLA_VF_VLAN_LIST attribute validation
    ae87f661f3c1 net: ks8851: Queue RX packets in IRQ handler instead of disabling BHs
    955b5b6c54d9 Bluetooth: l2cap: fix null-ptr-deref in l2cap_chan_timeout
    1f7ebb69c1d6 Bluetooth: HCI: Fix potential null-ptr-deref
    a85a60e62355 Bluetooth: msft: fix slab-use-after-free in msft_do_close()
    012363cb1bec Bluetooth: Fix use-after-free bugs caused by sco_sock_timeout
    6e48faad92be tcp: Use refcount_inc_not_zero() in tcp_twsk_unique().
    f47d0d32fa94 tcp: defer shutdown(SEND_SHUTDOWN) for TCP_SYN_RECV sockets
    ee0ce7573e50 ARM: 9381/1: kasan: clear stale stack poison
    4a9771c0fb5a xfrm: Preserve vlan tags for transport mode software GRO
    db71ca93259d qibfs: fix dentry leak
    9b332c72299f SUNRPC: add a missing rpc_stat for TCP TLS
    1c172ac7afe4 blk-iocost: do not WARN if iocg was already offlined
    8fb763886756 net:usb:qmi_wwan: support Rolling modules
    aff9dba5e8ce drm/radeon: silence UBSAN warning (v3)
    c06575055ea4 platform/x86: ISST: Add Granite Rapids-D to HPM CPU list
    1f4a2c7f4a54 drm/nouveau/dp: Don't probe eDP ports twice harder
    ca6b0d99cda0 gpio: lpc32xx: fix module autoloading
    1f9c976e942b fs/9p: drop inodes immediately on non-.L too
    427ede281390 clk: Don't hold prepare_lock when calling kref_put()
    ac259d3fa3e5 gpio: crystalcove: Use -ENOTSUPP consistently
    d77f56b649fc gpio: wcove: Use -ENOTSUPP consistently
    6a451fc5e6e6 powerpc/crypto/chacha-p10: Fix failure on non Power10
    48cf6a991431 9p: explicitly deny setlease attempts
    d1250e00e1fe fs/9p: fix the cache always being enabled on files with qid flags
    dbf68fd7e392 fs/9p: translate O_TRUNC into OTRUNC
    e55c601af3b1 fs/9p: only translate RWX permissions for plain 9P2000
    055ea43860e6 iommu: mtk: fix module autoloading
    08bedfbc1b50 smb3: fix broken reconnect when password changing on the server by allowing password rotation
    82f9e213b124 Drivers: hv: vmbus: Don't free ring buffers that couldn't be re-encrypted
    6466a0f6d235 uio_hv_generic: Don't free decrypted memory
    a56fe6113263 hv_netvsc: Don't free decrypted memory
    8e62341f5c45 Drivers: hv: vmbus: Track decrypted status in vmbus_gpadl
    6123a4e8e25b Drivers: hv: vmbus: Leak pages if set_memory_encrypted() fails
    dce583c5bdc7 selftests: timers: Fix valid-adjtimex signed left-shift undefined behavior
    b6f6626528fe amd/amdkfd: sync all devices to wait all processes being evicted
    a624829bba27 drm/amdgpu: Fix VCN allocation in CPX partition
    951a498fa993 drm/amd/display: Skip on writeback when it's not applicable
    c0beff4e35af drm/amdgpu: implement IRQ_STATE_ENABLE for SDMA v4.4.2
    1e2c28e74a82 drm/amdgpu: Refine IB schedule error logging
    037e72e7d7d2 tools/power/turbostat: Fix uncore frequency file string
    f91955da8117 MIPS: scall: Save thread_info.syscall unconditionally on entry
    1061afd58184 gpu: host1x: Do not setup DMA for virtual devices
    ce0e99cae00e blk-iocost: avoid out of bounds shift
    2eab8da937db scsi: hisi_sas: Handle the NCQ error returned by D2H frame
    2f35afac2773 scsi: target: Fix SELinux error when systemd-modules loads the target module
    14e731533b39 memblock tests: fix undefined reference to `BIT'
    85907602db5f memblock tests: fix undefined reference to `panic'
    63e58e5aef23 memblock tests: fix undefined reference to `early_pfn_to_nid'
    54403a77c28b btrfs: always clear PERTRANS metadata during commit
    570bff14e740 btrfs: make btrfs_clear_delalloc_extent() free delalloc reserve
    9678a79d1406 tools/power turbostat: Fix warning upon failed /dev/cpu_dma_latency read
    8a91872a547a tools/power turbostat: Print ucode revision only if valid
    77619a7ace53 tools/power turbostat: Fix Bzy_MHz documentation typo
    52b3541b3513 tools/power turbostat: Increase the limit for fd opened
    95973a9b647c tools/power turbostat: Fix added raw MSR output
    5982887de60c firewire: ohci: mask bus reset interrupts between ISR and bottom half
    dec0c371b46a ata: sata_gemini: Check clk_enable() result
    9872ab5b1e0e vboxsf: explicitly deny setlease attempts
    2f11e24abcf7 net: bcmgenet: Reset RBUF on first open
    e1d38cde2b7b block: fix overflow in blk_ioctl_discard()
    c5d5160d7e00 ALSA: line6: Zero-initialize message buffers
    85bb85801910 scsi: ufs: core: Fix MCQ mode dev command timeout
    684500f29f01 scsi: libsas: Align SMP request allocation to ARCH_DMA_MINALIGN
    cf311e2486c7 scsi: ufs: core: WLUN suspend dev/link state error recovery
    47b5b69f4aee regulator: tps65132: Add of_match table
    de2a108def74 ASoC: SOF: Intel: hda-dsp: Skip IMR boot on ACE platforms in case of S3 suspend
    49ce8b629775 kbuild: Disable KCSAN for autogenerated *.mod.c intermediaries
    926e8bc0cfef selftests/ftrace: Fix event filter target_func selection
    608e13706c8b bpf: Check bloom filter map value size
    41dc67915966 drm/amdkfd: range check cp bad op exception interrupts
    d64496242370 drm/amdkfd: Check cgroup when returning DMABuf info
    1ea068f5b69e btrfs: return accurate error code on open failure in open_fs_devices()
    c885ab23206b scsi: bnx2fc: Remove spin_lock_bh while releasing resources after upload
    f09318244c6c scsi: mpi3mr: Avoid memcpy field-spanning write WARNING
    845d179992fc net: mark racy access on sk->sk_rcvbuf
    94f80a8ec15e wifi: iwlwifi: mvm: guard against invalid STA ID on removal
    b83db8e756de wifi: iwlwifi: read txq->read_ptr under lock
    99046794a617 wifi: mac80211: fix prep_connection error path
    ff9580efb5da wifi: cfg80211: fix rdev_dump_mpp() arguments order
    954a654a3377 wifi: mac80211: fix ieee80211_bss_*_flags kernel-doc
    6eb0d6e6d38c gfs2: Fix invalid metadata access in punch_hole
    e29758e73ef3 scsi: lpfc: Use a dedicated lock for ras_fwlog state
    e8bf2c05e8ad scsi: lpfc: Release hbalock before calling lpfc_worker_wake_up()
    8a1d8deaa40e scsi: lpfc: Replace hbalock with ndlp lock in lpfc_nvme_unregister_port()
    4aba3ca53ba4 scsi: lpfc: Update lpfc_ramp_down_queue_handler() logic
    5e6079164922 scsi: lpfc: Remove IRQF_ONESHOT flag from threaded IRQ handling
    76337eb8daee scsi: lpfc: Move NPIV's transport unregistration to after resource clean up
    ff54c87f32f2 scsi: ufs: core: Fix MCQ MAC configuration
    8d6a1c8e3de3 KVM: arm64: vgic-v2: Check for non-NULL vCPU in vgic_v2_parse_attr()
    d082321d0d73 KVM: arm64: vgic-v2: Use cpuid from userspace as vcpu_id
    f2a6b3ed20f2 swiotlb: initialise restricted pool list_head when SWIOTLB_DYNAMIC=y
    802b13b79ab1 powerpc/pseries/iommu: LPAR panics during boot up with a frozen PE
    3b59a759436a powerpc/pseries: make max polling consistent for longer H_CALLs
    0b82eb134d29 clk: sunxi-ng: h6: Reparent CPUX during PLL CPUX rate change
    a6df6bd30458 clk: qcom: smd-rpm: Restore msm8976 num_clk
    78b6092d7834 net: gro: add flush check in udp_gro_receive_segment
    af276a5ac8e9 net: gro: fix udp bad offset in socket lookup by adding {inner_}network_offset to napi_gro_cb
    7f7b0ebb37af net: gro: parse ipv6 ext headers without frag0 invalidation
    5db08343ddb1 ipv4: Fix uninit-value access in __ip_make_skb()
    fa695db33417 drm/panel: ili9341: Use predefined error codes
    1055cdd5750e drm/panel: ili9341: Respect deferred probe
    c6be5383fb83 drm/panel: ili9341: Correct use of device property APIs
    e28dd1e1bf3e s390/qeth: Fix kernel panic after setting hsuid
    935bcb52ec10 vxlan: Pull inner IP header in vxlan_rcv().
    614c5a5ae45a tipc: fix a possible memleak in tipc_buf_append
    73f81e5a2203 rxrpc: Clients must accept conn from any address
    cfe34d86ef97 net: core: reject skb_copy(_expand) for fraglist GSO skbs
    65fbc7a11d06 net: bridge: fix multicast-to-unicast with fraglist GSO
    a30659f1576d spi: fix null pointer dereference within spi_sync
    4fd8cd4154a2 drm/amdgpu: fix doorbell regression
    6cc5dde9bb95 net: dsa: mv88e6xxx: Fix number of databases for 88E6141 / 88E6341
    6792e5b48323 cxgb4: Properly lock TX queue for the selftest.
    84b38f488366 s390/cio: Ensure the copied buf is NUL terminated
    7db626d2730d ALSA: hda: intel-sdw-acpi: fix usage of device_get_named_child_node()
    76ae951d94e7 ASoC: meson: cards: select SND_DYNAMIC_MINORS
    8ad705b120ce ASoC: meson: axg-tdm-interface: manage formatters in trigger
    52a31a05c1c2 ASoC: meson: axg-card: make links nonatomic
    d7801bd9c89e ASoC: meson: axg-fifo: use threaded irq to check periods
    af8e6bbf66da ASoC: meson: axg-fifo: use FIELD helpers
    0ba4fd45991a vxlan: Add missing VNI filter counter update in arp_reduce().
    843210300967 vxlan: Fix racy device stats updates.
    a89e4db53569 net: qede: use return from qede_parse_actions()
    40fbad8885a0 net: qede: use return from qede_parse_flow_attr() for flow_spec
    b633de6ae98b net: qede: use return from qede_parse_flow_attr() for flower
    c1b9c6be4793 net: qede: sanitize 'rc' in qede_add_tc_flower_fltr()
    32ac5cac5de9 ALSA: emu10k1: fix E-MU dock initialization
    9fc627064211 ALSA: emu10k1: move the whole GPIO event handling to the workqueue
    d4b9262fb93e ALSA: emu10k1: factor out snd_emu1010_load_dock_firmware()
    8db345cfb6c6 ALSA: emu10k1: fix E-MU card dock presence monitoring
    c698e482457e Fix a potential infinite loop in extract_user_to_sg()
    53163e2adb93 s390/vdso: Add CFI for RA register to asm macro vdso_func
    23e25d2fc777 net l2tp: drop flow hash on forward
    696d18bb5972 nsh: Restore skb->{protocol,data,mac_header} for outer header in nsh_gso_segment().
    0a0285cee11c octeontx2-af: avoid off-by-one read from userspace
    e19478763154 bna: ensure the copied buf is NUL terminated
    e22e25820fa0 xdp: use flags field to disambiguate broadcast redirect
    487c4e9a553f s390/mm: Fix clearing storage keys for huge pages
    819c33d7751f s390/mm: Fix storage key clearing for guest huge pages
    27f69caa62aa ASoC: codecs: wsa881x: set clk_stop_mode1 flag
    6f85e9b7151a ASoC: Intel: avs: Set name of control as in topology
    54bfc9ef60c6 riscv, bpf: Fix incorrect runtime stats
    a554fef56c0b bpf, arm64: Fix incorrect runtime stats
    f75a57065570 spi: hisi-kunpeng: Delete the dump interface of data registers in debugfs
    9072aab6e8d6 spi: axi-spi-engine: fix version format string
    deccbe39b56f spi: axi-spi-engine: use common AXI macros
    3915124910c5 spi: axi-spi-engine: move msg state to new struct
    0174c1c4384c spi: axi-spi-engine: use devm_spi_alloc_host()
    03a7d3cf0496 spi: axi-spi-engine: simplify driver data allocation
    ab7722458e8c spi: spi-axi-spi-engine: Use helper function devm_clk_get_enabled()
    fe4bfff1cd72 bpf: Fix a verifier verbose message
    57b736fcbb0e nvme: fix warn output about shared namespaces without CONFIG_NVME_MULTIPATH
    0d34c688b00d ASoC: SOF: Intel: add default firmware library path for LNL
    180ffe229325 ASoC: SOF: Introduce generic names for IPC types
    b5a291e5591e regmap: Add regmap_read_bypassed()
    b397a0ab8582 bpf, skmsg: Fix NULL pointer dereference in sk_psock_skb_ingress_enqueue
    2166cb2e21f2 bpf, kconfig: Fix DEBUG_INFO_BTF_MODULES Kconfig definition
    79b9afd95e28 regulator: change devm_regulator_get_enable_optional() stub to return Ok
    bdeb1b446df0 regulator: change stubbed devm_regulator_get_enable to return Ok
    83fdf050ef03 regulator: mt6360: De-capitalize devicetree regulator subnodes
    026e24cf3173 pinctrl: devicetree: fix refcount leak in pinctrl_dt_to_map()
    109b9ecdcb04 power: supply: mt6360_charger: Fix of_match for usb-otg-vbus regulator
    48e52633d519 power: rt9455: hide unused rt9455_boost_voltage_values
    fc8cbe3a58a0 pinctrl: baytrail: Fix selecting gpio pinctrl state
    8a1f89c98dcc nfs: Handle error of rpc_proc_register() in nfs_net_init().
    260333221cf0 nfs: make the rpc_stat per net namespace
    53a0365c9f9f nfs: expose /proc/net/sunrpc/nfs in net namespaces
    c4d324c414c2 sunrpc: add a struct rpc_stats arg to rpc_create_args
    30287d2018b4 pinctrl: mediatek: paris: Rework support for PIN_CONFIG_{INPUT,OUTPUT}_ENABLE
    d02587173690 pinctrl: mediatek: paris: Fix PIN_CONFIG_INPUT_SCHMITT_ENABLE readback
    558c8039fdf5 pinctrl: core: delete incorrect free in pinctrl_enable()
    70b145d68e27 pinctrl/meson: fix typo in PDM's pin name
    4b1357a2770e pinctrl: pinctrl-aspeed-g6: Fix register offset for pinconf of GPIOR-T
    a381ee26d7c7 Bluetooth: qca: add support for QCA2066
    2af84c46b9b8 eeprom: at24: fix memory corruption race condition
    4d5ace787273 eeprom: at24: Probe for DDR3 thermal sensor in the SPD case
    00d2715aaa8c rust: kernel: require `Send` for `Module` implementations
    244822c09b4f wifi: nl80211: don't free NULL coalescing rule
    a4dec33d27fb rust: macros: fix soundness issue in `module!` macro
    738ea6d9ca0a rust: module: place generated init_module() function in .init.text
    cce311f8bbbf mtd: limit OTP NVMEM cell parse to non-NAND devices
    26e2fe4cab10 nvmem: add explicit config option to read old syntax fixed OF cells
    ed56e266d3c6 dmaengine: Revert "dmaengine: pl330: issue_pending waits until WFP state"
    867818dd132e dmaengine: pl330: issue_pending waits until WFP state
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
(cherry picked from commit e904fb7891b4020e7820d0a21f666fc2dbd9b8b0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 7169e94e79..ea4360215d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "d6479bad645622afeeefff281c6be5339662c701"
-SRCREV_meta ?= "49698cadd79745fa26aa7ef507c16902250c1750"
+SRCREV_machine ?= "59b2635b04e2ef8162e52f82e848b81073cea708"
+SRCREV_meta ?= "5114225a4b9ca817be4456f43e26963005955e13"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.30"
+LINUX_VERSION ?= "6.6.32"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index ee21291ac2..10a8ec0656 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.30"
+LINUX_VERSION ?= "6.6.32"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "955c18e54b19dae67fdeb54cedc003225bcd9380"
-SRCREV_meta ?= "49698cadd79745fa26aa7ef507c16902250c1750"
+SRCREV_machine ?= "9576b5b9f8e3c78e6c315f475def18e5c29e475a"
+SRCREV_meta ?= "5114225a4b9ca817be4456f43e26963005955e13"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 2b68a40162..eab33b3a97 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "25741eb502ad719afba306e4f3739d79228167d6"
-SRCREV_machine:qemuarm64 ?= "955c18e54b19dae67fdeb54cedc003225bcd9380"
-SRCREV_machine:qemuloongarch64 ?= "955c18e54b19dae67fdeb54cedc003225bcd9380"
-SRCREV_machine:qemumips ?= "6f385885b5cc0a6dd65829173eee6af2901be70d"
-SRCREV_machine:qemuppc ?= "955c18e54b19dae67fdeb54cedc003225bcd9380"
-SRCREV_machine:qemuriscv64 ?= "955c18e54b19dae67fdeb54cedc003225bcd9380"
-SRCREV_machine:qemuriscv32 ?= "955c18e54b19dae67fdeb54cedc003225bcd9380"
-SRCREV_machine:qemux86 ?= "955c18e54b19dae67fdeb54cedc003225bcd9380"
-SRCREV_machine:qemux86-64 ?= "955c18e54b19dae67fdeb54cedc003225bcd9380"
-SRCREV_machine:qemumips64 ?= "40b35be7a83982472153cbf0a80fd8ed3f21b053"
-SRCREV_machine ?= "955c18e54b19dae67fdeb54cedc003225bcd9380"
-SRCREV_meta ?= "49698cadd79745fa26aa7ef507c16902250c1750"
+SRCREV_machine:qemuarm ?= "6e4ec0ec5052e3a107ec7e5977ea9282d3642ea7"
+SRCREV_machine:qemuarm64 ?= "9576b5b9f8e3c78e6c315f475def18e5c29e475a"
+SRCREV_machine:qemuloongarch64 ?= "9576b5b9f8e3c78e6c315f475def18e5c29e475a"
+SRCREV_machine:qemumips ?= "cab976b23497344b74b7e4cbcb5df732f8630150"
+SRCREV_machine:qemuppc ?= "9576b5b9f8e3c78e6c315f475def18e5c29e475a"
+SRCREV_machine:qemuriscv64 ?= "9576b5b9f8e3c78e6c315f475def18e5c29e475a"
+SRCREV_machine:qemuriscv32 ?= "9576b5b9f8e3c78e6c315f475def18e5c29e475a"
+SRCREV_machine:qemux86 ?= "9576b5b9f8e3c78e6c315f475def18e5c29e475a"
+SRCREV_machine:qemux86-64 ?= "9576b5b9f8e3c78e6c315f475def18e5c29e475a"
+SRCREV_machine:qemumips64 ?= "aa0c0197b3a0628992e959708a2ad015603e93ad"
+SRCREV_machine ?= "9576b5b9f8e3c78e6c315f475def18e5c29e475a"
+SRCREV_meta ?= "5114225a4b9ca817be4456f43e26963005955e13"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "5697d159afef8c475f13a0b7b85f09bd4578106c"
+SRCREV_machine:class-devupstream ?= "91de249b6804473d49984030836381c3b9b3cfb0"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.30"
+LINUX_VERSION ?= "6.6.32"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


