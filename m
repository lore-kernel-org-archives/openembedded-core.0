Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B9A8C54E41
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 14:30:58 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.13940.1708612257736994407
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Feb 2024 06:30:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Ysqloav1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d911c2103aso46794955ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 06:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708612257; x=1709217057; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w8xr/mNDY1DcVY7usP8IIVvIOtPa4J/r6zuB77p+UhE=;
        b=Ysqloav1eAo5ocRiIadCLLwh6XrDV9WajTajfzAaJSmSe0YR9JL7ZgzfrZQNpArG5t
         K5f5sjKDTSM7ZjOiFaWNtHTLJVpQ2XfMubAvoozIlBNBYJvRDUI5KRZATt6L5XVCSROJ
         03GJtn0WOBw+qqq3+P3+NNXBMVxZcxzKd9MgbFrvLP5hpcJUj2PxkC0QfEkcKKDP62m/
         +vnTQbyWmAhJ0bKI7mAZf6PIMLnEnjTNtbEp7KV5lAXSZW87zwo5jKhscsMuIGmNMp9o
         Ud3cWiVM9g8SS9nwG789Rl/b83uvg1e6U9L30sn4UpLycNYxOyFhee0186w2YAeUXW4v
         ma5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708612257; x=1709217057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w8xr/mNDY1DcVY7usP8IIVvIOtPa4J/r6zuB77p+UhE=;
        b=Qn4S2Sub9fberRdKnUWMDHWxPTMEkoEXjGAQUAlXG4TKNS6amE0tK6lScUUHR3lV7b
         IvRr5o1GfWvP+UhLhERWIpiSpoJluYw0rW5U4WvuO4xUA3svNyMejG3NHgMe4KKFpmyI
         pC3Jvnsf7sGHj6sAXEpP3GV0/keWyZ0fMsoIteqCuugXl5GEKaygXFN+4KzBxO+hsjo+
         B8I7xPiMJD94vTBAqTTZygGbRMxfcSuQIcM+CgyXQZfa2vMP2UgIrWSWLDlxWbPEcFxG
         dkJoO/aOsKX95iz5CIKAQNvha23Q5dHKT7Rxx1bKAIQO0kOnWGfP6MXcoTacAhFzX3Gc
         nckw==
X-Gm-Message-State: AOJu0YwW8H/hGrceUHTI5QNqBawsF8XSJ9dopEw/Qol1/GJ4yNMYHNHf
	1ob9aMFrnw7OMuoVusEfY2mFe4t9YARJBbKtmy8FrxBvgxlXw0y1JWetNTCHh9qihreDGqtkra7
	rAU4=
X-Google-Smtp-Source: AGHT+IH/e14raH11jvtaoW49lohLsUVe13gyP8Vmn6b5QxnTwrUu9QKQM0QS+fqDvlQwmFRrVSLtOQ==
X-Received: by 2002:a17:902:f54a:b0:1db:fd89:791d with SMTP id h10-20020a170902f54a00b001dbfd89791dmr14343736plf.39.1708612256972;
        Thu, 22 Feb 2024 06:30:56 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id k13-20020a170902f28d00b001dbcf653024sm9364558plc.293.2024.02.22.06.30.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 06:30:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/9] linux-yocto/5.4: update to v5.4.266
Date: Thu, 22 Feb 2024 04:30:36 -1000
Message-Id: <e0e46163ca061f71db3469bef90d0f44e16df77a.1708612053.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708612053.git.steve@sakoman.com>
References: <cover.1708612053.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 14:30:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196024

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    4410df70110f Linux 5.4.266
    7d0f1fd80ad6 block: Don't invalidate pagecache for invalid falloc modes
    a0678f504758 ring-buffer: Fix wake ups when buffer_percent is set to 100
    508e2fdd978e smb: client: fix OOB in smbCalcSize()
    644b956c946a usb: fotg210-hcd: delete an incorrect bounds test
    a56a19e44b17 x86/alternatives: Sync core before enabling interrupts
    4111986fb90e net: rfkill: gpio: set GPIO direction
    5c375a83d1f9 net: 9p: avoid freeing uninit memory in p9pdu_vreadf
    4e7f3899fb81 Bluetooth: hci_event: Fix not checking if HCI_OP_INQUIRY has been sent
    a83debb52310 USB: serial: option: add Quectel RM500Q R13 firmware support
    c82ba4cb44d1 USB: serial: option: add Foxconn T99W265 with new baseline
    1f87ba56c43d USB: serial: option: add Quectel EG912Y module support
    a59cb26bc188 USB: serial: ftdi_sio: update Actisense PIDs constant names
    a70b1933fa54 wifi: cfg80211: fix certs build to not depend on file order
    e8fb00205144 wifi: cfg80211: Add my certificate
    8717fd6d0c30 iio: adc: ti_am335x_adc: Fix return value check of tiadc_request_dma()
    45af72f149a8 iio: common: ms_sensors: ms_sensors_i2c: fix humidity conversion time table
    4257c16c149d scsi: bnx2fc: Fix skb double free in bnx2fc_rcv()
    e1b31edfe7d3 Input: ipaq-micro-keys - add error handling for devm_kmemdup
    a85d6aa2b555 iio: imu: inv_mpu6050: fix an error code problem in inv_mpu6050_read_raw
    388c90c577d7 interconnect: Treat xlate() returning NULL node as an error
    04c22233447d btrfs: do not allow non subvolume root targets for snapshot
    3230a69e663b smb: client: fix NULL deref in asn1_ber_decoder()
    0ccb39511a7f ALSA: hda/hdmi: add force-connect quirk for NUC5CPYB
    6bcf819198d9 ALSA: hda/hdmi: Add quirk to force pin connectivity on NUC10
    34e6c4c6a985 pinctrl: at91-pio4: use dedicated lock class for IRQ
    624659563e26 i2c: aspeed: Handle the coalesced stop conditions with the start conditions.
    47ae5242292d afs: Fix overwriting of result of DNS query
    c04b7b28c9f0 net: check dev->gso_max_size in gso_features_check()
    761ee09e9f5d net: warn if gso_type isn't set for a GSO SKB
    eec7ef60d297 afs: Fix dynamic root lookup DNS check
    82d64cbe487c afs: Fix the dynamic root's d_delete to always delete unused dentries
    2b4600fb6967 net: check vlan filter feature in vlan_vids_add_by_dev() and vlan_vids_del_by_dev()
    b10265532df7 net/rose: fix races in rose_kill_by_device()
    ed4cb8a42ce9 ethernet: atheros: fix a memleak in atl1e_setup_ring_resources
    3f82a6a6d7ee net: sched: ife: fix potential use-after-free
    f48e3337ab0b net/mlx5e: Correct snprintf truncation handling for fw_version buffer used by representors
    d07ef3a87064 net/mlx5: Fix fw tracer first block check
    a46bb28fdbdf net/mlx5: improve some comments
    333fd1095584 Revert "net/mlx5e: fix double free of encap_header"
    7bd305f5f262 wifi: mac80211: mesh_plink: fix matches_local logic
    76366b399a02 s390/vx: fix save/restore of fpu kernel context
    f40d484e1614 reset: Fix crash when freeing non-existent optional resets
    14d915ca5ae3 ARM: OMAP2+: Fix null pointer dereference and memory leak in omap_soc_device_init
    62ef5887dd45 ksmbd: fix wrong name of SMB2_CREATE_ALLOCATION_SIZE
    35e12efde04d ALSA: hda/realtek: Enable headset on Lenovo M90 Gen5

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 44b239c417..72fa7b9118 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "db182d93638000066b9d174eecbdd86de24d70be"
-SRCREV_meta ?= "a1399e88272ab04a7748051822d5b16b9b1d3f9c"
+SRCREV_machine ?= "b587a3fecb37c3e198592a5733ce23cd8a33f6fc"
+SRCREV_meta ?= "8ce0cca5a5a2895ef024bee2daff56c5e846c3bc"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.265"
+LINUX_VERSION ?= "5.4.266"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 164b86d71a..023b9fe9e1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.265"
+LINUX_VERSION ?= "5.4.266"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "863de52d7fc04097fde3bef264cc2952d1f3a2b0"
-SRCREV_machine ?= "9880d2f47e2bea1fa9fb069ac35631e724b76d26"
-SRCREV_meta ?= "a1399e88272ab04a7748051822d5b16b9b1d3f9c"
+SRCREV_machine_qemuarm ?= "da07f26ba47c365237459233a85f398599677b28"
+SRCREV_machine ?= "65fdb0d3fc750b89ed2ad3268d346765a7131094"
+SRCREV_meta ?= "8ce0cca5a5a2895ef024bee2daff56c5e846c3bc"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 2d00341d59..412b8230ab 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -13,16 +13,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "7e4e6b59cac3b71d43a587728acc7bfe78ef16af"
-SRCREV_machine_qemuarm64 ?= "234f5db38e546134931e1e6ffb3677e5516704fc"
-SRCREV_machine_qemumips ?= "60a93a5cfd6f6a5c7374e09d234ceb234367270d"
-SRCREV_machine_qemuppc ?= "63a0e4217eaa70fa4fc7dacf2a9356e88c79f80e"
-SRCREV_machine_qemuriscv64 ?= "abf55d087ff6e9e2cd03499a0eff130b1afc8851"
-SRCREV_machine_qemux86 ?= "abf55d087ff6e9e2cd03499a0eff130b1afc8851"
-SRCREV_machine_qemux86-64 ?= "abf55d087ff6e9e2cd03499a0eff130b1afc8851"
-SRCREV_machine_qemumips64 ?= "9bc9e7c0b392466df817283ea0f05c7cf330f8a5"
-SRCREV_machine ?= "abf55d087ff6e9e2cd03499a0eff130b1afc8851"
-SRCREV_meta ?= "a1399e88272ab04a7748051822d5b16b9b1d3f9c"
+SRCREV_machine_qemuarm ?= "732f4200d901957f0ab0a6c760fcc26e8ddfdb03"
+SRCREV_machine_qemuarm64 ?= "458f12462197606e02368dc74a79cc5f10e3409b"
+SRCREV_machine_qemumips ?= "4a746565ac1418646f94506f983f85779902b4eb"
+SRCREV_machine_qemuppc ?= "f51c8df8974a2b439d6a845ffbf144e935f04f5c"
+SRCREV_machine_qemuriscv64 ?= "c2bd298696fc9965fb3a888e78cfb00a92d6824f"
+SRCREV_machine_qemux86 ?= "c2bd298696fc9965fb3a888e78cfb00a92d6824f"
+SRCREV_machine_qemux86-64 ?= "c2bd298696fc9965fb3a888e78cfb00a92d6824f"
+SRCREV_machine_qemumips64 ?= "d56e5470a9173e9d2af61828619098356fadb75e"
+SRCREV_machine ?= "c2bd298696fc9965fb3a888e78cfb00a92d6824f"
+SRCREV_meta ?= "8ce0cca5a5a2895ef024bee2daff56c5e846c3bc"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -31,7 +31,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.265"
+LINUX_VERSION ?= "5.4.266"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


