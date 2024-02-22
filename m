Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C370C54798
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 14:30:58 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.13938.1708612256241680023
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Feb 2024 06:30:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=U7arZe/S;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1dc49afb495so6987545ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 06:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708612255; x=1709217055; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wLBBmoDs1vkypb/P8Jzhznakwh9bWBfZOitmWE5eYs4=;
        b=U7arZe/SMpc1mK7qX3wYpK9WssYZYIkevetHeRd2tHZo5K0frlfzy+Tkz8I7snoFWc
         c4h3+OsF0Zv6MowSGoJHivpbFTxnn9pFZTfShbamNAelYrSFJqBNYyZvte/stdGs7eFY
         dpOnXc9iscfIvNfsnw1G0RCE0ETZcF9TSgzfXG83mvFt9ERg76EO/oYLQKPaeWvmo3h4
         Ebdx5FZIFVsLzi/IeZTNPFakC+vH4b47Ok2L685CiY4TROpruGqkDBKD47fCgLXoO8wk
         BkPuvOJGFcCToeVwiurka+atXl4Pt1iUE5NsI+lXAPcZCvYEetoHoAUSuf069TbZCsUZ
         lxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708612255; x=1709217055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLBBmoDs1vkypb/P8Jzhznakwh9bWBfZOitmWE5eYs4=;
        b=GBr5HciOXyT8z+jy0NCO03uOrYB44M1uECfulkQj19MFN//DY6oJYQNb7nRdsqHpsa
         wCHW+8QEUOEJWpnGlHyL4k8gID8LcK1mfMK6dStDl5gs6z7n7xdAnLPvZ2MjFPF8T4bw
         SJN/znKkf6hfuphEW2ohiBVF2Zn088iWDwzDaiAOP0FKAOqd6t2y5fJ/G8bqcuSGVM/r
         gOCiCvRGBpOt9iDbOK4Q57pmAYEs5SPPnBGsmyK91rxdhD43Vseu+r2PtgWqA2Iv6G/I
         WcRsoxQxrW6DaoQWMjwyB1QACrY6k+My+730GBe5+oR/2DhNmfBobPoHAidbvZGU4GT9
         1Zcg==
X-Gm-Message-State: AOJu0YzMZGS0lP6HIgkDmTIwWvE+3h/T9GQaVD73xI7/v529krXu5e7V
	97Ddrlt9YrB7rtfLrDCyITNq7Ebw6PxU+iLjl/ho6T2E/M6NUrDe2ObDTbja0NbUmoo+70/yceX
	Tp4U=
X-Google-Smtp-Source: AGHT+IEFkMoNTjDy0pJq2qQeM7V2TCxpsFkRPaH1izPs3d5snIMJSfJ6BiGF/oG7HILykkhfS0I8rA==
X-Received: by 2002:a17:903:1104:b0:1db:37b1:b1a3 with SMTP id n4-20020a170903110400b001db37b1b1a3mr25123535plh.17.1708612255430;
        Thu, 22 Feb 2024 06:30:55 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id k13-20020a170902f28d00b001dbcf653024sm9364558plc.293.2024.02.22.06.30.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 06:30:55 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/9] linux-yocto/5.4: update to v5.4.265
Date: Thu, 22 Feb 2024 04:30:35 -1000
Message-Id: <ca73f7645fc9cbabaea1dd81a0f59805f9f991f3.1708612053.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708612053.git.steve@sakoman.com>
References: <cover.1708612053.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 14:30:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196023

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    2d21f73b2f16 Linux 5.4.265
    5c70542f32af powerpc/ftrace: Fix stack teardown in ftrace_no_trace
    0e1867b482b4 powerpc/ftrace: Create a dummy stackframe to fix stack unwind
    9395c04666cc mmc: block: Be sure to wait while busy in CQE error recovery
    3b8b2c5d7675 ring-buffer: Fix memory leak of free page
    3459c9aa6495 team: Fix use-after-free when an option instance allocation fails
    363a67ef3ada arm64: mm: Always make sw-dirty PTEs hw-dirty in pte_modify
    de8ada02369e ext4: prevent the normalized size from exceeding EXT_MAX_BLOCKS
    f451d6784ba6 soundwire: stream: fix NULL pointer dereference for multi_link
    404902216b88 perf: Fix perf_event_validate_size() lockdep splat
    4109d9a855f2 HID: hid-asus: add const to read-only outgoing usb buffer
    1fc4091991c5 net: usb: qmi_wwan: claim interface 4 for ZTE MF290
    88ceaf8e2c61 asm-generic: qspinlock: fix queued_spin_value_unlocked() implementation
    91175d6fe505 HID: multitouch: Add quirk for HONOR GLO-GXXX touchpad
    1f94c0d60d81 HID: hid-asus: reset the backlight brightness level on resume
    e9a3cd3dcf3f HID: add ALWAYS_POLL quirk for Apple kb
    395ad0baa4c1 platform/x86: intel_telemetry: Fix kernel doc descriptions
    af509912cd7c bcache: avoid NULL checking to c->root in run_cache_set()
    356ae9de79b7 bcache: add code comments for bch_btree_node_get() and __bch_btree_node_alloc()
    ca4b00c6cb3d bcache: avoid oversize memory allocation by small stripe_size
    e1d811cbc3de blk-throttle: fix lockdep warning of "cgroup_mutex or RCU read lock required!"
    84f2e5b3e70f usb: aqc111: check packet for fixup for true limit
    619a34066614 Revert "PCI: acpiphp: Reassign resources on bridge if necessary"
    371dbce60a46 ALSA: hda/hdmi: add force-connect quirks for ASUSTeK Z170 variants
    be7676b03aed cred: switch to using atomic_long_t
    9112bd107208 appletalk: Fix Use-After-Free in atalk_ioctl
    23ee06762c6f net: stmmac: Handle disabled MDIO busses from devicetree
    538b7b8f21dc net: stmmac: use dev_err_probe() for reporting mdio bus registration failure
    067e6ec9f530 vsock/virtio: Fix unsigned integer wrap around in virtio_transport_has_space()
    cc7cf0b2ee60 sign-file: Fix incorrect return values check
    510d45207ae1 net: Remove acked SYN flag from packet in the transmit queue correctly
    5d9d500a2811 qed: Fix a potential use-after-free in qed_cxt_tables_alloc
    3df812627e7d net/rose: Fix Use-After-Free in rose_ioctl
    b099c28847cf atm: Fix Use-After-Free in do_vcc_ioctl
    e3430b870eff atm: solos-pci: Fix potential deadlock on &tx_queue_lock
    8cff60fb736b atm: solos-pci: Fix potential deadlock on &cli_queue_lock
    fcf17666ef1b qca_spi: Fix reset behavior
    51ad9c19bb57 qca_debug: Fix ethtool -G iface tx behavior
    b7f58686643f qca_debug: Prevent crash on TX ring changes
    9354e0acdb74 net: ipv6: support reporting otherwise unknown prefix flags in RTM_NEWPREFIX
    053220aaed26 afs: Fix refcount underflow from error handling race

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index e61e97c092..44b239c417 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1193259d93adb90be2688677c70daeffd38b401e"
-SRCREV_meta ?= "60242d5fa3322b8c8d1629d7865d0be6133444dd"
+SRCREV_machine ?= "db182d93638000066b9d174eecbdd86de24d70be"
+SRCREV_meta ?= "a1399e88272ab04a7748051822d5b16b9b1d3f9c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.264"
+LINUX_VERSION ?= "5.4.265"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index b034e5ad84..164b86d71a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.264"
+LINUX_VERSION ?= "5.4.265"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "e3057fe26e087921a4133a885f2bebcb7b4392f3"
-SRCREV_machine ?= "611daf1778b317c4429d0c9e5654219871998ebf"
-SRCREV_meta ?= "60242d5fa3322b8c8d1629d7865d0be6133444dd"
+SRCREV_machine_qemuarm ?= "863de52d7fc04097fde3bef264cc2952d1f3a2b0"
+SRCREV_machine ?= "9880d2f47e2bea1fa9fb069ac35631e724b76d26"
+SRCREV_meta ?= "a1399e88272ab04a7748051822d5b16b9b1d3f9c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 989b675fe3..2d00341d59 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -13,16 +13,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "48487580c951040acb41aef37ee2705f2b31bb64"
-SRCREV_machine_qemuarm64 ?= "106b94311371c0abe70c4ef34fd6bc68eedf1925"
-SRCREV_machine_qemumips ?= "d3ef8b4c2a4569b8c2275a7c28ee1e1736bfb311"
-SRCREV_machine_qemuppc ?= "ef180bf93e83eaeb8844e9968b13390a5dbfb215"
-SRCREV_machine_qemuriscv64 ?= "660d792619ca2cc09c4f2630d1f6944f7a5e5b51"
-SRCREV_machine_qemux86 ?= "660d792619ca2cc09c4f2630d1f6944f7a5e5b51"
-SRCREV_machine_qemux86-64 ?= "660d792619ca2cc09c4f2630d1f6944f7a5e5b51"
-SRCREV_machine_qemumips64 ?= "a311dd01367cfcb11b7e2273b6841201850ccd7d"
-SRCREV_machine ?= "660d792619ca2cc09c4f2630d1f6944f7a5e5b51"
-SRCREV_meta ?= "60242d5fa3322b8c8d1629d7865d0be6133444dd"
+SRCREV_machine_qemuarm ?= "7e4e6b59cac3b71d43a587728acc7bfe78ef16af"
+SRCREV_machine_qemuarm64 ?= "234f5db38e546134931e1e6ffb3677e5516704fc"
+SRCREV_machine_qemumips ?= "60a93a5cfd6f6a5c7374e09d234ceb234367270d"
+SRCREV_machine_qemuppc ?= "63a0e4217eaa70fa4fc7dacf2a9356e88c79f80e"
+SRCREV_machine_qemuriscv64 ?= "abf55d087ff6e9e2cd03499a0eff130b1afc8851"
+SRCREV_machine_qemux86 ?= "abf55d087ff6e9e2cd03499a0eff130b1afc8851"
+SRCREV_machine_qemux86-64 ?= "abf55d087ff6e9e2cd03499a0eff130b1afc8851"
+SRCREV_machine_qemumips64 ?= "9bc9e7c0b392466df817283ea0f05c7cf330f8a5"
+SRCREV_machine ?= "abf55d087ff6e9e2cd03499a0eff130b1afc8851"
+SRCREV_meta ?= "a1399e88272ab04a7748051822d5b16b9b1d3f9c"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -31,7 +31,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.264"
+LINUX_VERSION ?= "5.4.265"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


