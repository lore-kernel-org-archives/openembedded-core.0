Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B4ECD3427
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 16:59:03 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1050.1778000333091967697
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 09:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=EZWC4PhF;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so53161975e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 09:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778000331; x=1778605131; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qpAQKJUDxdti3+KvstGiNchibBVkVCqrIKsId8lOtKI=;
        b=EZWC4PhFUqc9Yxtg7b++7i4dwI+xLPJY46S7KqVkEQlXv/aD+Q+4S6W8LZl8dUm07Q
         I9N4DpiwdFTAr6tOnJ53EVoTWv8u1WgHVgArlZSYs5O9fvajUO0/qGvf5Rys469iV0HV
         ew1AGMqYjRbLscPSNRjjgl4qPNUOnkRJkmatM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778000331; x=1778605131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qpAQKJUDxdti3+KvstGiNchibBVkVCqrIKsId8lOtKI=;
        b=p5fR+xqXLdHqwNRupT8secXlZvGghpgXv90rqMbfHoLzNY2v/ZUJxvjkubFmQQ7LhX
         ddZ0230kCy+bAtmn0urver9TaBiQJMttt5IE6gPvxB/tkYnD5pF0OjnWO8DDntgsGmlj
         z8hPqSDeLh/vhTfkwPEs0qjZdMq86gmGFDuHZXyukry86sS7TOvNjweRr9Hj8HstbZ3Q
         Ukpxhu9hwkwqppMA+W4OtKs23ZJSdo9iAD3RhCzyc/bL6KMnEcqqjnw9vji3JNBJ2fNC
         NSf4zBnPd4wzyoLOUVB4EY41SWbnae9ZBG7NV4YkVP3Q5L1HOxrYkSDriUDiq19B3yeF
         Bo/g==
X-Gm-Message-State: AOJu0YzHSgPgwWE35TzIl8L0l/wbr7GoE0L6vVXjZMvYGIWsCp93Gt7r
	oIHnqDBYLFukNHQEGkfUD8RlM+6L13WU8drcI42zGUT9xsUKC6ilEIyVkh0BVlDrjX+Tyq++epu
	veiz7+m4=
X-Gm-Gg: AeBDievDy/d4fJc3FJ4LrF7ug5kDqkwn2WZSZ304Zwi119hny+wTbnGCnY1f/BHC5SY
	KxfkEGAIEqAcYsApJOLs7N4jZWvflAFfiG4QR+MfKJhuFR4bFmDkTlRdxNxOkz4I0F2IRsG7jA1
	Z0A3jMb2F9Ovv68op/aXg+x7zFxE8cT1qOPDt/FVriBz2b/+tYVu1or6Ql1l3kIL+iYUHwygXRn
	r2dVCzKK2jQ47qt0+yHeVFS+gxabVqhb4utcjbERvu1EeFCP19/YXegE5Q2ma23LOCU9K3QRil2
	yQvpBte8Vhznes4tzx3WFttIX63V2J1H8AAiLhYqHL1oW7OjLX8QrxwtI6bilYBkCie3ULHVhSp
	5ttJBk1AlGghQ0sdFxXMhSiuoFvzfSRgi0xh0+QA+7eTR6mUQ6Cr8BI1ykE2wnnScYXHdi3/eEh
	dsiPT8bbXIV6V3KA1arWhvQ7y6EyjgDFDhjwBsFMj3Usppug+JngIO0bNYYprsVT6bZsOALOFoe
	cjmsLJUyLB3S8huucKoE+V2KQ==
X-Received: by 2002:a05:600c:c11c:b0:486:fbd1:9dc0 with SMTP id 5b1f17b1804b1-48e51f3b57emr728035e9.22.1778000330852;
        Tue, 05 May 2026 09:58:50 -0700 (PDT)
Received: from localhost ([2a01:e0a:8cc:5b00:b8fa:c45c:f26d:53a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e51f6805fsm60025e9.2.2026.05.05.09.58.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:58:49 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/23] linux-yocto/6.6: update to v6.6.124
Date: Tue,  5 May 2026 18:57:25 +0200
Message-ID: <0844b7e2205b530febbc7a9b6640e3e30d3c8dd1.1777995876.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1777995876.git.fabien.thomas@smile.fr>
References: <cover.1777995876.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 16:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236499

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    1b4ef5214f17e Linux 6.6.124
    23897ece6167c ALSA: hda/realtek: Really fix headset mic for TongFang X6AR55xU.
    d0a6e43d7cccc spi: tegra114: Preserve SPI mode bits in def_command1_reg
    126a09f4fcd2b spi: tegra: Fix a memory leak in tegra_slink_probe()
    dfc6367898077 spi: tegra210-quad: Protect curr_xfer clearing in tegra_qspi_non_combined_seq_xfer
    712cde8d91688 spi: tegra210-quad: Protect curr_xfer in tegra_qspi_combined_seq_xfer
    53eba2a4a4666 spi: tegra210-quad: Protect curr_xfer assignment in tegra_qspi_setup_transfer_one
    f9cafa63039b8 spi: tegra210-quad: Move curr_xfer read inside spinlock
    552e3d8a8bef2 spi: tegra210-quad: Return IRQ_HANDLED when timeout already processed transfer
    a168f2002b2b4 gve: Correct ethtool rx_dropped calculation
    d4a81b8ec6398 btrfs: fix racy bitfield write in btrfs_clear_space_info_full()
    0e0120214b5dc ASoC: amd: fix memory leak in acp3x pdm dma ops
    50b7c7a255858 ipv6: Fix ECMP sibling count mismatch when clearing RTF_ADDRCONF
    42c574c1504aa netfilter: nf_tables: fix inverted genmask check in nft_map_catchall_activate()
    8c934bafd10b9 hwmon: (occ) Mark occ_init_attribute() as __printf
    3f89a4ef6505a drm/mgag200: fix mgag200_bmc_stop_scanout()
    9d40a85138568 net: gro: fix outer network offset
    00a7512ff7195 net: ethernet: adi: adin1110: Check return value of devm_gpiod_get_optional() in adin1110_check_spi()
    17d340e81c4b5 tipc: use kfree_sensitive() for session key material
    b2c9edad3620f net: don't touch dev->stats in BPF redirect paths
    11ba9f0dc8651 macvlan: fix error recovery in macvlan_common_newlink()
    f89e33c9c37f0 dpaa2-switch: add bounds check for if_id in IRQ handler
    3bf519e39b51c net: liquidio: Fix off-by-one error in VF setup_nic_devices() cleanup
    a0d2389c8cdc1 net: liquidio: Fix off-by-one error in PF setup_nic_devices() cleanup
    c0ed6c77ec340 net: liquidio: Initialize netdev pointer before queue setup
    b97415c4362f7 dpaa2-switch: prevent ZERO_SIZE_PTR dereference when num_ifs is zero
    13336a6239b9d net/sched: cls_u32: use skb_header_pointer_careful()
    fcbda653b5a88 net: add skb_header_pointer_careful() helper
    3a6d6b332f929 smb/client: fix memory leak in smb2_open_file()
    f54886e18b856 platform/x86: hp-bioscfg: Skip empty attribute names
    9423990550a2a platform/x86: intel_telemetry: Fix PSS event register mask
    ca9ff71c15bc8 platform/x86: toshiba_haps: Fix memory leaks in add/remove routines
    bae0565fa975d wifi: mac80211: don't increment crypto_tx_tailroom_needed_cnt twice
    ccd1843b63f64 wifi: mac80211: correctly check if CSA is active
    73b487d44bf4f scsi: target: iscsi: Fix use-after-free in iscsit_dec_conn_usage_count()
    29fe5ff92433a ALSA: hda/realtek: Fix headset mic for TongFang X6AR55xU
    11ebafffce31e scsi: target: iscsi: Fix use-after-free in iscsit_dec_session_usage_count()
    2f4f008f622d4 wifi: cfg80211: Fix bitrate calculation overflow for HE rates
    d61171cf09715 regmap: maple: free entry on mas_store_gfp() failure
    f9b06d28a60b3 spi: hisi-kunpeng: Fixed the wrong debugfs node name in hisi_spi debugfs initialization
    254f303cd6663 ASoC: tlv320adcx140: Propagate error codes during probe
    e2c03961b01a8 ASoC: amd: yc: Fix microphone on ASUS M6500RE
    f532b29b0e313 nvmet-tcp: fixup hang in nvmet_tcp_listen_data_ready()
    7c54d3f5ebbc5 nvme-fc: release admin tagset if init fails
    1d395dae332ba ASoC: davinci-evm: Fix reference leak in davinci_evm_probe
    db1bef623ae32 wifi: mac80211: collect station statistics earlier when disconnect
    1fbb409652e3d ring-buffer: Avoid softlockup in ring_buffer_resize() during memory free
    f63f30607dd8e HID: Apply quirk HID_QUIRK_ALWAYS_POLL to Edifier QR30 (2d99:a101)
    cff3f619fd1cb HID: i2c-hid: fix potential buffer overflow in i2c_hid_get_report()
    68ab5057e690e HID: quirks: Add another Chicony HP 5MP Cameras to hid_ignore_list
    383bc94e90661 netfilter: replace -EEXIST with -EBUSY
    a58fbeda600fe ALSA: hda/realtek: add HP Laptop 15s-eq1xxx mute LED quirk
    bfcfb9e548bc1 HID: playstation: Center initial joystick axes to prevent spurious events
    9edee94001b63 HID: intel-ish-hid: Reset enum_devices_done before enumeration
    28b97fcbbf523 btrfs: fix reservation leak in some error paths when inserting inline extent
    9ab846d8dd027 HID: multitouch: add MT_QUIRK_STICKY_FINGERS to MT_CLS_VTL
    5b25505b52dff HID: intel-ish-hid: Update ishtp bus match to support device ID table
    07df5ff4f6490 smb/server: fix refcount leak in parse_durable_handle_context()
    73ede654d9daa LoongArch: Enable exception fixup for specific ADE subcode
    2456fde2b1377 smb/server: fix refcount leak in smb2_open()
    5fbdf95d2575e LoongArch: Set correct protection_map[] for VM_NONE/VM_SHARED
    04dd114b682a4 smb/server: call ksmbd_session_rpc_close() on error path in create_smb2_pipe()
    b03415955ed31 block,bfq: fix aux stat accumulation destination
    8365785e59ea4 net: usb: sr9700: support devices with virtual driver CD
    b167312390fdd wifi: wlcore: ensure skb headroom before skb_push
    ffe1e19c3b0e5 wifi: mac80211: ocb: skip rx_no_sta when interface is not joined
    d75245dad5cc6 tracing: Fix ftrace event field alignments
    df54838ab6182 gve: Fix stats report corruption on queue count change
    a8adf1ceee4e1 KVM: selftests: Add -U_FORTIFY_SOURCE to avoid some unpredictable test failures
    46c93903e4c19 binderfs: fix ida_alloc_max() upper bound
    ebb6aa6928d5c binder: fix BR_FROZEN_REPLY error log
    9f6022b2573ae sched/rt: Fix race in push_rt_task
    64c0b7e229375 ublk: fix deadlock when reading partition table
    c3db89ea1ed3d hfsplus: fix slab-out-of-bounds read in hfsplus_uni2asc()
    df524a68d9021 netfilter: nft_set_pipapo: clamp maximum map bucket size to INT_MAX
    b61f9b2fcf181 KVM: Don't clobber irqfd routing type when deassigning irqfd
    d2bddc2da2b3b Revert "drm/amd: Check if ASPM is enabled from PCIe subsystem"
    7f7467be748eb ARM: 9468/1: fix memset64() on big-endian
    4f9f1fdc0ebdf rbd: check for EOD after exclusive lock is ensured to be held
    071159ff5c0bf pmdomain: imx8m-blk-ctrl: fix out-of-range access of bc->domains
    7aa0c2bb0771a pmdomain: imx8mp-blk-ctrl: Keep usb phy power domain on for system wakeup
    e2e1c77319d52 pmdomain: imx: gpcv2: Fix the imx8mm gpu hang due to wrong adb400 reset
    1267af5b2033d pmdomain: imx8mp-blk-ctrl: Keep gpc power domain on for system wakeup
    c28dcc1cb4fda pmdomain: qcom: rpmpd: fix off-by-one error in clamping to the highest state
    302651ccef698 platform/x86: intel_telemetry: Fix swapped arrays in PSS output
    c56b4c84b3b21 x86/kfence: fix booting on 32bit non-PAE systems
    dca1a6ba0da9f nvmet-tcp: add bounds checks in nvmet_tcp_build_pdu_iovec

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 3ad8bd54fa..3c28f96906 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "5a49ab75e554557c1d3665b22233c4de9a2c2a75"
-SRCREV_meta ?= "17375dce1754d0783fb3fb9e684691951f9ff357"
+SRCREV_machine ?= "a32dc01f5dbce65781e06a973624a2c3572fa7cd"
+SRCREV_meta ?= "307ef96123620278563ff5b1c9fb8b7b4da26970"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.123"
+LINUX_VERSION ?= "6.6.124"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 50c8e69d5c..08c176a698 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.123"
+LINUX_VERSION ?= "6.6.124"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "18a3ba79eed015d2cbd1f5af2c1417d12b369698"
-SRCREV_meta ?= "17375dce1754d0783fb3fb9e684691951f9ff357"
+SRCREV_machine ?= "a00c570459f5486c036aefc93ab323efa8c7e645"
+SRCREV_meta ?= "307ef96123620278563ff5b1c9fb8b7b4da26970"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 3f8b40e305..565022a615 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "b562777a433f835ae245e08c27df6b47e3ae2505"
-SRCREV_machine:qemuarm64 ?= "2df2455c7199cb8db4ea0118f908f952ff73eb97"
-SRCREV_machine:qemuloongarch64 ?= "af240d7d57ebf66e87bc2dff34855e630a97ead1"
-SRCREV_machine:qemumips ?= "6b9c16676cd4c8494ca7cdff355cb1cfe4d8fb3a"
-SRCREV_machine:qemuppc ?= "bf3f6c731ea41e519389b24104458870475dce20"
-SRCREV_machine:qemuriscv64 ?= "af240d7d57ebf66e87bc2dff34855e630a97ead1"
-SRCREV_machine:qemuriscv32 ?= "af240d7d57ebf66e87bc2dff34855e630a97ead1"
-SRCREV_machine:qemux86 ?= "af240d7d57ebf66e87bc2dff34855e630a97ead1"
-SRCREV_machine:qemux86-64 ?= "af240d7d57ebf66e87bc2dff34855e630a97ead1"
-SRCREV_machine:qemumips64 ?= "9fb8ff244fe5c5d6aa08457cfb9bbe4a3ef47366"
-SRCREV_machine ?= "af240d7d57ebf66e87bc2dff34855e630a97ead1"
-SRCREV_meta ?= "17375dce1754d0783fb3fb9e684691951f9ff357"
+SRCREV_machine:qemuarm ?= "225cb65775de5e687da708da8f126bf94a426c54"
+SRCREV_machine:qemuarm64 ?= "632fdc720fa54154453715becbbf57793363b62d"
+SRCREV_machine:qemuloongarch64 ?= "6e00181d086766512ef48806d649d032c479566d"
+SRCREV_machine:qemumips ?= "083f8e7fb7cacf7167aaf41b6366dc63b0b42b9a"
+SRCREV_machine:qemuppc ?= "0149565b9e2219e923ba0eebc4f7c60661778453"
+SRCREV_machine:qemuriscv64 ?= "6e00181d086766512ef48806d649d032c479566d"
+SRCREV_machine:qemuriscv32 ?= "6e00181d086766512ef48806d649d032c479566d"
+SRCREV_machine:qemux86 ?= "6e00181d086766512ef48806d649d032c479566d"
+SRCREV_machine:qemux86-64 ?= "6e00181d086766512ef48806d649d032c479566d"
+SRCREV_machine:qemumips64 ?= "3f1d938eafffaadd2fa9d9bc83446c90d8f36093"
+SRCREV_machine ?= "6e00181d086766512ef48806d649d032c479566d"
+SRCREV_meta ?= "307ef96123620278563ff5b1c9fb8b7b4da26970"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "c56aaf1a85ae918dd521fb2869028cf533d2755a"
+SRCREV_machine:class-devupstream ?= "1b4ef5214f17e671cc13f2da4a678574ce91d151"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.123"
+LINUX_VERSION ?= "6.6.124"
 
 PV = "${LINUX_VERSION}+git"
 

