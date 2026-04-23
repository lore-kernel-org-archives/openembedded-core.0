Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBCBEFC0342
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:45:22 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.757.1776959114408280831
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 08:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=b03VgtWC;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-50fb4a7d704so27186481cf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 08:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776959113; x=1777563913; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8CwRnX1SyQ0W4uub0EHmOhkbPnRDovCh5+Fc2RWZoU=;
        b=b03VgtWCQVj1uLxUpbLngZveMM+jjHmqqTxrN49UAinnmDeS29Nn+ufefa/lWkPYlx
         QpokJ2/FhiL2SuY+2vwvB0nlBvQ2iS+nz2kAfN3YQ81voZ34G/MMh1EGOVtvC97grOGC
         hmt6Puhf0s4NhDLsldnLv4L9tWxEzG3Y6eZN04QEuHUmciUun93hAEBZbFD9Gvv0N9iA
         /8dzDjpImJ0lZ9mA3Nyt7SVEOGorEgSEZa/9SumhbMhCwy2o2YF5aizYgpBbeAE7yWZf
         a2IlLKJ2SquH2ek0Klps9s19B2kQXaF//xKpuwvZxWYlEUnbM8j9U9pNGsayrwZc1WpB
         tZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776959113; x=1777563913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X8CwRnX1SyQ0W4uub0EHmOhkbPnRDovCh5+Fc2RWZoU=;
        b=sL3jVegX9b4LnbEFZlvEVBR+xrOa5+fSja8EyIPabQJ4WtKODPZsWYfOyrILbZA37/
         4jnsRu+WyrmXkALA/DVCdAcF5KMX73mhNIlnC0WWmjP8cJxFm1TeSodw6gmOYc7GxPim
         ihEfm7fnT1G6+hdypkZzjCcfaHmW62tzjCuimJK6OJf1yAKV4EFGce+2FmiBaE04BGDy
         CpN87csw/4TOVFawC0pC8vxFNZKgNn0x/UB17S699GlHw8jbXrY1bgG8Q8C0LcpgzYGt
         Ju3e46eI2qWmRCFw298PH0iN5bfoXehYbskhFPB/S5PdXT2MuzhbqHLrGbw/4fIZ7ECP
         9Y8A==
X-Gm-Message-State: AOJu0YxEjiVVrWYsU9w7TVHGaF+jyON6Ug66WlILY/DUq1ZU4lM3fBoR
	iXdhUwrsbjOGphhV+c0Pi2X+mtKhqGZGUBe+8rH/BOSmKxff1NjGd8u+ZOPmEE1u
X-Gm-Gg: AeBDietawu+svfWmSMIGSDDWr0MFhAvWmYsXM2ep8UnWhFp9p48WmtivBAca3mgYjnz
	BBt4H/C47Mvbk7lVbn8IZvAcAEzTiOs5E+RI/MdpzzowQd8yNYTQLGjNRYEOi9TzC1vMlMb4+sa
	6TR77A5aKDZ7oYTPLoJdRxFkmk4ixzESzVZm+rPTLFloq67MjnNZcY3F/vd2egMPLa917riDT2J
	Gll6DUh8hk7fbUDDgNIayKMSzCqU0UPUglEeWchsjXSG23D71xuj6RioDbF9cFBZ2SjA3RaRxGi
	WngX6E61jxudGYP7fKkwf4KH8legpRC5BNUFCufZvVjTUWDh7HZjtPhJG7ha1yJQXJZJY8DCDSH
	/k+odTjZh47fXRLnxehfOUm6sAbO8ndUcDQyIUwS0yyRk/32kx+9LRRAD3wYEMD4vF75RgqcPC0
	fUTuyBTc8GO0aCw2h2zREA+1hjGfUIJCWXOIrxHf1cC5ICcmWaIitAhCrTQE9UtCR1p/G4bKHFs
	6leFtnkyK8UT6FjrnC5Zf7A60xtEfmQGyH+vZADJykioq0RfB98Ge3On70a43dKkSWuXA==
X-Received: by 2002:ac8:5987:0:b0:509:25ab:f545 with SMTP id d75a77b69052e-50e368391c3mr410005601cf.11.1776959112327;
        Thu, 23 Apr 2026 08:45:12 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50fb416b3f5sm74400031cf.28.2026.04.23.08.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:45:11 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
Subject: [openembedded-core][whinlatter][PATCH 01/18] linux-yocto/6.12: update to v6.12.72
Date: Thu, 23 Apr 2026 11:44:52 -0400
Message-ID: <20260423154509.1933646-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423154509.1933646-1-bruce.ashfield@gmail.com>
References: <20260423154509.1933646-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 15:45:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235801

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    19b3cac2b50b5 Linux 6.12.72
    2211d77892913 gpio: omap: do not register driver in probe()
    5d810ba377edd wifi: rtl8xxxu: fix slab-out-of-bounds in rtl8xxxu_sta_add
    d9af3cf58bb4c PCI: endpoint: Avoid creating sub-groups asynchronously
    1d411278dda29 xfs: fix UAF in xchk_btree_check_block_owner
    ae385826840a3 erofs: fix UAF issue for file-backed mounts w/ directio option
    51223bdd0f60b mptcp: fix race in mptcp_pm_nl_flush_addrs_doit()
    9bef8beef1557 bus: mhi: host: pci_generic: Add Telit FE990B40 modem support
    2a6bfa97d4d52 scsi: qla2xxx: Query FW again before proceeding with login
    05fcd590e5fbb scsi: qla2xxx: Free sp in error path to fix system crash
    d70f71d4c92bc scsi: qla2xxx: Delay module unload while fabric scan in progress
    387c26bf60042 scsi: qla2xxx: Allow recovery for tape devices
    40ae93668226b scsi: qla2xxx: Validate sp before freeing associated memory
    7d31dde1bd867 wifi: rtw88: Fix alignment fault in rtw_core_enable_beacon()
    ea2278657ad0d nilfs2: Fix potential block overflow that cause system hang
    687e1d4af79c3 crypto: virtio - Remove duplicated virtqueue_kick in virtio_crypto_skcipher_crypt_req
    c0a0ded3bb7fd crypto: virtio - Add spinlock protection with virtqueue notification
    c184341920ed7 crypto: omap - Allocate OMAP_CRYPTO_FORCE_COPY scatterlists correctly
    1ff337fc7cefe crypto: octeontx - Fix length check to avoid truncation in ucode_load_store
    c77b33b585127 crypto: iaa - Fix out-of-bounds index in find_empty_iaa_compression_mode
    52b6e7417ff76 Bluetooth: btusb: Add USB ID 7392:e611 for Edimax EW-7611UXB
    cd0e0a76e40c2 driver core: enforce device_lock for driver_match_device()
    baf664fc90a61 smb: server: fix leak of active_num_conn in ksmbd_tcp_new_connection()
    f7b1c2f5642bb ksmbd: fix infinite loop caused by next_smb2_rcv_hdr_off reset in error paths
    3eaa22d688311 smb: client: split cached_fid bitfields to avoid shared-byte RMW races
    ae591174b1f2e Linux 6.12.71
    aa9f6f353bcc3 vsock/test: verify socket options after setting them
    ceab30fec9ed2 io_uring/rw: recycle buffers manually for non-mshot reads
    4ce768ac429ec net: tunnel: make skb_vlan_inet_prepare() return drop reasons
    88969c951665e Linux 6.12.70
    c1ae8301551f3 gpiolib-acpi: Update file references in the Documentation and MAINTAINERS
    833a9452f59f4 ALSA: hda/realtek: Really fix headset mic for TongFang X6AR55xU.
    6d6b23aada49c spi: tegra114: Preserve SPI mode bits in def_command1_reg
    075415ae18b5b spi: tegra: Fix a memory leak in tegra_slink_probe()
    947e6c7ba1578 spi: tegra210-quad: Protect curr_xfer clearing in tegra_qspi_non_combined_seq_xfer
    6fd446178a610 spi: tegra210-quad: Protect curr_xfer in tegra_qspi_combined_seq_xfer
    f5a8a27e6eea4 spi: tegra210-quad: Protect curr_xfer assignment in tegra_qspi_setup_transfer_one
    62059d8ac0acf spi: tegra210-quad: Move curr_xfer read inside spinlock
    69079e7b26d55 spi: tegra210-quad: Return IRQ_HANDLED when timeout already processed transfer
    c9c14d2abe4c5 ASoC: amd: fix memory leak in acp3x pdm dma ops
    ae0aad8c49df8 ALSA: usb-audio: fix broken logic in snd_audigy2nx_led_update()
    d8143c54ceeba ipv6: Fix ECMP sibling count mismatch when clearing RTF_ADDRCONF
    1444ff890b465 netfilter: nf_tables: fix inverted genmask check in nft_map_catchall_activate()
    09dc5be323d4f hwmon: (occ) Mark occ_init_attribute() as __printf
    c0de1cc6a6943 drm/xe/pm: Disable D3Cold for BMG only on specific platforms
    c8a5ec95c9616 drm/xe/pm: Also avoid missing outer rpm warning on system suspend
    422f646b4ab50 drm/xe/query: Fix topology query pointer advance
    1aacebe9d4ccb drm/mgag200: fix mgag200_bmc_stop_scanout()
    b83557bc6f560 net: gro: fix outer network offset
    642c8a50df4c7 net: ethernet: adi: adin1110: Check return value of devm_gpiod_get_optional() in adin1110_check_spi()
    d4d5d152d94f6 drm/amd/display: fix wrong color value mapping on MCM shaper LUT
    5003e92af2b90 tipc: use kfree_sensitive() for session key material
    73585e603dee8 net: don't touch dev->stats in BPF redirect paths
    61c8091b7937f net: usb: r8152: fix resume reset deadlock
    986967a162142 macvlan: fix error recovery in macvlan_common_newlink()
    4a15468051d2c net: sfp: Fix quirk for Ubiquiti U-Fiber Instant SFP module
    d8f3c5b5543cf net: sfp: convert sfp quirks to modify struct sfp_module_support
    248c29a4d3e47 net: sfp: pre-parse the module support
    ecd57017429e3 net: phy: add phy_interface_copy()
    4dc7b69bca8ef net: phy: add phy_interface_weight()
    2447edc367800 dpaa2-switch: add bounds check for if_id in IRQ handler
    52b19b3a22306 net: liquidio: Fix off-by-one error in VF setup_nic_devices() cleanup
    f86bd16280a0f net: liquidio: Fix off-by-one error in PF setup_nic_devices() cleanup
    1d4590fde856c net: liquidio: Initialize netdev pointer before queue setup
    4acc40db06ffd dpaa2-switch: prevent ZERO_SIZE_PTR dereference when num_ifs is zero
    e41a23e61259f net/sched: cls_u32: use skb_header_pointer_careful()
    8b6c7f1476646 net: add skb_header_pointer_careful() helper
    b64e3b5d8d759 smb/client: fix memory leak in smb2_open_file()
    2b5e6819ff7ee platform/x86/intel/tpmi/plr: Make the file domain<n>/status writeable
    bd3ecd6018cb5 platform/x86: hp-bioscfg: Skip empty attribute names
    177f8c06e879f platform/x86: intel_telemetry: Fix PSS event register mask
    bf0474356875d platform/x86: toshiba_haps: Fix memory leaks in add/remove routines
    071982199b47a ALSA: hda/realtek: ALC269 fixup for Lenovo Yoga Book 9i 13IRU8 audio
    a928eecf030a9 btrfs: reject new transactions if the fs is fully read-only
    586c628c0bdd8 wifi: mac80211: don't increment crypto_tx_tailroom_needed_cnt twice
    29443629fe745 wifi: mac80211: correctly check if CSA is active
    48fe983e92de2 scsi: target: iscsi: Fix use-after-free in iscsit_dec_conn_usage_count()
    2901d799a26d9 ALSA: hda/realtek: Fix headset mic for TongFang X6AR55xU
    41b86a9ec037b scsi: target: iscsi: Fix use-after-free in iscsit_dec_session_usage_count()
    30f1507376d6e wifi: cfg80211: Fix bitrate calculation overflow for HE rates
    811b45e2d795d regmap: maple: free entry on mas_store_gfp() failure
    70b24ad9d84a9 spi: hisi-kunpeng: Fixed the wrong debugfs node name in hisi_spi debugfs initialization
    58df2eca707c2 ASoC: tlv320adcx140: Propagate error codes during probe
    1c1c8fafa0b91 ASoC: amd: yc: Fix microphone on ASUS M6500RE
    6e0c7503a5803 nvmet-tcp: fixup hang in nvmet_tcp_listen_data_ready()
    fa301aef50e3f nvme-fc: release admin tagset if init fails
    1d5c634789492 ASoC: simple-card-utils: Check device node before overwrite direction
    e07de198dbcca ASoC: davinci-evm: Fix reference leak in davinci_evm_probe
    66a7153fd67c8 wifi: mac80211: collect station statistics earlier when disconnect
    95d2a20ae6873 HID: logitech: add HID++ support for Logitech MX Anywhere 3S
    4cd8f9799981b ring-buffer: Avoid softlockup in ring_buffer_resize() during memory free
    c1853ebbec980 drm/amd/pm: Disable MMIO access during SMU Mode 1 reset
    ff8a020151798 HID: Apply quirk HID_QUIRK_ALWAYS_POLL to Edifier QR30 (2d99:a101)
    786ec171788bd HID: i2c-hid: fix potential buffer overflow in i2c_hid_get_report()
    81a074334c01f HID: quirks: Add another Chicony HP 5MP Cameras to hid_ignore_list
    3521db9fcbd22 netfilter: replace -EEXIST with -EBUSY
    beb54a7f9c674 PCI: qcom: Remove ASPM L0s support for MSM8996 SoC
    dc60a7d2dc78b ALSA: hda/realtek: add HP Laptop 15s-eq1xxx mute LED quirk
    04818a914fdce ALSA: hda/realtek: Add quirk for Acer Nitro AN517-55
    cba4664a19f5a HID: playstation: Center initial joystick axes to prevent spurious events
    40c3f16aa7235 HID: intel-ish-hid: Reset enum_devices_done before enumeration
    c45848936ebdb riscv: Sanitize syscall table indexing under speculation
    f3ee1732851ae btrfs: fix reservation leak in some error paths when inserting inline extent
    626f39c9c8ed3 HID: multitouch: add MT_QUIRK_STICKY_FINGERS to MT_CLS_VTL
    367ec17610106 HID: intel-ish-hid: Update ishtp bus match to support device ID table
    8a15107c4c031 smb/server: fix refcount leak in parse_durable_handle_context()
    c49a28068363f LoongArch: Enable exception fixup for specific ADE subcode
    39ca11ff158c9 smb/server: fix refcount leak in smb2_open()
    165d1359f945b md: suspend array while updating raid_disks via sysfs
    380d7c1af4bd3 LoongArch: Set correct protection_map[] for VM_NONE/VM_SHARED
    ac18761b530b5 smb/server: call ksmbd_session_rpc_close() on error path in create_smb2_pipe()
    5fa0faf0e4d08 block,bfq: fix aux stat accumulation destination
    e297a64beff9f net: usb: sr9700: support devices with virtual driver CD
    71de0b6e04bbe wifi: wlcore: ensure skb headroom before skb_push
    536447521b3b9 wifi: mac80211: ocb: skip rx_no_sta when interface is not joined
    76d035271e120 tracing: Fix ftrace event field alignments
    b9b97e6aeb534 procfs: avoid fetching build ID while holding VMA lock
    87ff11143615c KVM: selftests: Add -U_FORTIFY_SOURCE to avoid some unpredictable test failures
    ee5e42e9a59ac binderfs: fix ida_alloc_max() upper bound
    9eec6f49d3fae binder: fix BR_FROZEN_REPLY error log
    5b5228964619b hfsplus: fix slab-out-of-bounds read in hfsplus_uni2asc()
    9bcc47343ee0e ublk: fix deadlock when reading partition table
    d288ba832d92d tools/power turbostat: fix GCC9 build regression
    58130e7ce6cb6 PCI/ERR: Ensure error recoverability at all times
    ff48c9312d042 KVM: Don't clobber irqfd routing type when deassigning irqfd
    5b794951541e8 Revert "drm/amd: Check if ASPM is enabled from PCIe subsystem"
    dfc3ab6bd6486 mm, shmem: prevent infinite loop on truncate race
    fe787920fac00 gve: Correct ethtool rx_dropped calculation
    9fa0a755db3e1 gve: Fix stats report corruption on queue count change
    8c9af7339de41 ceph: fix oops due to invalid pointer for kfree() in parse_longname()
    60645e27e3ec6 ARM: 9468/1: fix memset64() on big-endian
    41ededf7ef153 rbd: check for EOD after exclusive lock is ensured to be held
    c6f8326f26bd2 ceph: fix NULL pointer dereference in ceph_mds_auth_match()
    b8bc72587c79f mm/slab: Add alloc_tagging_slab_free_hook for memcg_alloc_abort_single
    4390dcdabb5fc pmdomain: imx8m-blk-ctrl: fix out-of-range access of bc->domains
    e142106ee355e pmdomain: imx8mp-blk-ctrl: Keep usb phy power domain on for system wakeup
    b8ea101959ab1 pmdomain: imx: gpcv2: Fix the imx8mm gpu hang due to wrong adb400 reset
    fb14cb9a1cd69 pmdomain: imx8mp-blk-ctrl: Keep gpc power domain on for system wakeup
    ab99415e30f22 pmdomain: qcom: rpmpd: fix off-by-one error in clamping to the highest state
    bad15420050db ALSA: aloop: Fix racy access at PCM trigger
    e6ff2ebff427b platform/x86: intel_telemetry: Fix swapped arrays in PSS output
    917ccf6fd180a x86/kfence: fix booting on 32bit non-PAE systems
    2f467a92df61e x86/vmware: Fix hypercall clobbers
    19672ae68d52f nvmet-tcp: add bounds checks in nvmet_tcp_build_pdu_iovec

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 5816902a7f..0f21f2e4d5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -15,13 +15,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "35d6569f165579f64f76cbdfd1feb41a2b5359ec"
-SRCREV_meta ?= "5b1ff7df002df6e7069a53b361d9e8f5f9df3aac"
+SRCREV_machine ?= "6adb3759af2b8904cab35fdb1b40c12e17e313c1"
+SRCREV_meta ?= "5025770c6104c36f0b102a1a813ee23d7151a755"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.69"
+LINUX_VERSION ?= "6.12.72"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 5828ff986b..7cea4ea4f7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.69"
+LINUX_VERSION ?= "6.12.72"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "a7fbaf7533ae7ebc35f56c0dfb86970eda4d721c"
-SRCREV_meta ?= "5b1ff7df002df6e7069a53b361d9e8f5f9df3aac"
+SRCREV_machine ?= "0ca0aa71c7c9f5f206a3748c1b9475ae1023d172"
+SRCREV_meta ?= "5025770c6104c36f0b102a1a813ee23d7151a755"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 91b013f498..6f9906fb74 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "4c24c5ab253ea3f46bb578fe43d25877bc269206"
-SRCREV_machine:qemuarm64 ?= "a7fbaf7533ae7ebc35f56c0dfb86970eda4d721c"
-SRCREV_machine:qemuloongarch64 ?= "a7fbaf7533ae7ebc35f56c0dfb86970eda4d721c"
-SRCREV_machine:qemumips ?= "377285b4e49c411f89784c6b1c374dbfb634e253"
-SRCREV_machine:qemuppc ?= "a7fbaf7533ae7ebc35f56c0dfb86970eda4d721c"
-SRCREV_machine:qemuriscv64 ?= "a7fbaf7533ae7ebc35f56c0dfb86970eda4d721c"
-SRCREV_machine:qemuriscv32 ?= "a7fbaf7533ae7ebc35f56c0dfb86970eda4d721c"
-SRCREV_machine:qemux86 ?= "a7fbaf7533ae7ebc35f56c0dfb86970eda4d721c"
-SRCREV_machine:qemux86-64 ?= "a7fbaf7533ae7ebc35f56c0dfb86970eda4d721c"
-SRCREV_machine:qemumips64 ?= "f2e77270b007d80acbfc32114e81d1abc411e8b4"
-SRCREV_machine ?= "a7fbaf7533ae7ebc35f56c0dfb86970eda4d721c"
-SRCREV_meta ?= "5b1ff7df002df6e7069a53b361d9e8f5f9df3aac"
+SRCREV_machine:qemuarm ?= "c4d3cba9c7fe4e4f7275fdaa50e35d479108813f"
+SRCREV_machine:qemuarm64 ?= "0ca0aa71c7c9f5f206a3748c1b9475ae1023d172"
+SRCREV_machine:qemuloongarch64 ?= "0ca0aa71c7c9f5f206a3748c1b9475ae1023d172"
+SRCREV_machine:qemumips ?= "e5e61bd34c2ce267b67502f95dd3f11dfdb5c77e"
+SRCREV_machine:qemuppc ?= "0ca0aa71c7c9f5f206a3748c1b9475ae1023d172"
+SRCREV_machine:qemuriscv64 ?= "0ca0aa71c7c9f5f206a3748c1b9475ae1023d172"
+SRCREV_machine:qemuriscv32 ?= "0ca0aa71c7c9f5f206a3748c1b9475ae1023d172"
+SRCREV_machine:qemux86 ?= "0ca0aa71c7c9f5f206a3748c1b9475ae1023d172"
+SRCREV_machine:qemux86-64 ?= "0ca0aa71c7c9f5f206a3748c1b9475ae1023d172"
+SRCREV_machine:qemumips64 ?= "482153ceffc764c453274f27e950fee03a0fe17e"
+SRCREV_machine ?= "0ca0aa71c7c9f5f206a3748c1b9475ae1023d172"
+SRCREV_meta ?= "5025770c6104c36f0b102a1a813ee23d7151a755"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "ff2177382799753070b71747f646963147eabc7c"
+SRCREV_machine:class-devupstream ?= "19b3cac2b50b53cc000b4cd795415c7d03484707"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.69"
+LINUX_VERSION ?= "6.12.72"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


