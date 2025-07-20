Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7379CC83F1A
	for <webhook@archiver.kernel.org>; Sun, 20 Jul 2025 20:05:17 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.24808.1753041908733803125
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jul 2025 13:05:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zL66XS0l;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-235ef62066eso43416695ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 13:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753041908; x=1753646708; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D8zhxcbQSnbfIQmwOQgcxtZB9seBivs4Boq7Ho77t5M=;
        b=zL66XS0lx8UWMzxK7PHsmRj5s2cyETNqrfs2NReHftJ+J51sHgnYZWjyTV/yJLGTev
         EOYj5IzTGgNJuZ78/0LFlwh+LFGQY8P85aCyX5W1UttREiE3oVavTqY969/nj+foNC52
         zZiGZL79HgedTTtuG4nhDbQMrS0Vjj3nx9An55nl4LgvHxYWrI+kPFJ/y2zAhVlniJub
         gDR4bFM/DU2Px3pAgT2pDiLlo46HaMweErXa+p/HOmkEGhAyxbTZtA4YMnzM9L6ImVAA
         xmMzsoi4XgEs+CAPWJynZAynDAP7AbV14SU0gn3mT0/ti7uxb0JkLngTx5+4gncfMYET
         ShmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753041908; x=1753646708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D8zhxcbQSnbfIQmwOQgcxtZB9seBivs4Boq7Ho77t5M=;
        b=l4Gz6i5e8Y700ITSJYaQRDEq5RuCyEa528nN23ri6tJevf/uXsGDClSssTFUglkdar
         oh5jp7fFX7ghlpXKmBXVgObS5cbAi+6lKt1pV+MJjZKmpgkfzsJ+EorlOZR8OcXhT7tJ
         I6KIzFtbnzi+jV3iQkFl2fkQLry5Et+ADGA5zXSwp0tkReTUDPiPEFa7yPMqvO76TkG5
         d9M2IQ43KL2ZdL3dL8YPKJa3epLw4T0K8C/H/F0mM5qfsYo9Wz05ZPc7zCgmEaGunPzX
         0NG2duSkXfS9OgniQclaGZNj1UREiW/AzhUMnp3TURYUHOnLxMjU/lqe/z9ReQFBHGBi
         YmsA==
X-Gm-Message-State: AOJu0YyvckiEE1EhM4Q34KRzqY7fuart/4PCe+QOhlBcvBXys/Uxolot
	YM4m5sQQ9dcvrzqX6e7dzKJ+xmo+lqdDT9vImkv1QC667UZBy2JDZ60smahTyITxhB+DDhJE7P9
	ZRbjuU+Q=
X-Gm-Gg: ASbGnctY8zFPnghEcjKzw8bS02jtuuZwU9Xd8EFDRry/iXl0kU1pPJir6Y0Cjv/b+3h
	ggImv3375p9M7mGRTW2e8wNWUtsDGiaa0qc8L+3lXQrGU1wK+ymF/gdDgfNrLOCXJ3fXLts5ps1
	j5sykeXCZjPxyEcEuxn5n5WdXW/D9EOxW0FrKxdFoyIWz982xn9bPkIZaLmn+CB3a59XIvHL2MQ
	4voDTQxnjroIW6DtRlCo6dT3ktY8d5580k4WY/XqAnC0mxvoKNpHjn+bWJZJRy0NZqJJtUSP4Ww
	R0KtuOFb+T7u5uh2do2bDWB1es8b8eXVVJcycltJahTHZdcSmMluvSPrb9rb/NESVkEUAIanBwV
	dK4G5AhHYtYYwlA==
X-Google-Smtp-Source: AGHT+IE8YZeFuIaMqiHbG3QcX2klblFi13njGtdtX+dlBblt25dmue02/MEDASivA5911W90C4bJ2g==
X-Received: by 2002:a17:902:cf0f:b0:23e:277b:b921 with SMTP id d9443c01a7336-23e3035f774mr189999165ad.42.1753041907825;
        Sun, 20 Jul 2025 13:05:07 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:31c9:438f:a923:8d3c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b60f096sm44894035ad.78.2025.07.20.13.05.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 13:05:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 05/12] linux-yocto/6.12: update to v6.12.33
Date: Sun, 20 Jul 2025 13:04:42 -0700
Message-ID: <1720a8be4a00a34675c29ae54acbbac3a718b3ba.1753041740.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753041740.git.steve@sakoman.com>
References: <cover.1753041740.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 20:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220630

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    e03ced99c437 Linux 6.12.33
    80fe1ebc1fbc Revert "drm/amd/display: more liberal vmin/vmax update for freesync"
    d452b168da17 dt-bindings: phy: imx8mq-usb: fix fsl,phy-tx-vboost-level-microvolt property
    1ed84b17fa9b dt-bindings: usb: cypress,hx3: Add support for all variants
    eb2d5e794fb9 thunderbolt: Do not double dequeue a configuration request
    b4fac3f172f2 usb: usbtmc: Fix timeout value in get_stb
    985961dd2688 serial: jsm: fix NPE during jsm_uart_port_init
    e428b7e205ed Bluetooth: hci_qca: move the SoC type check to the right place
    4490c7951898 usb: typec: ucsi: fix Clang -Wsign-conversion warning
    1a51004aa046 USB: serial: pl2303: add new chip PL2303GC-Q20 and PL2303GT-2AB
    393ad978388e usb: storage: Ignore UAS driver for SanDisk 3.2 Gen2 storage device
    23179d009cf5 usb: quirks: Add NO_LPM quirk for SanDisk Extreme 55AE
    a347664312be Revert "cpufreq: tegra186: Share policy per cluster"
    0c60158ff14d block: fix adding folio to bio
    3c4fed940db2 PCI/ASPM: Disable L1 before disabling L1 PM Substates
    4685153b121e accel/ivpu: Update power island delays
    f4deea418499 accel/ivpu: Add initial Panther Lake support
    6b482b16f32e rtc: Fix offset calculation for .start_secs < 0
    a6a55fe660f8 rtc: Make rtc_time64_to_tm() support dates before 1970
    f28fae36bad3 Documentation: ACPI: Use all-string data node references
    32b7c46c4dae acpi-cpufreq: Fix nominal_freq units to KHz in get_max_boost_ratio()
    614456f1a0fe pinctrl: armada-37xx: set GPIO output value before setting direction
    f49c751d6000 pinctrl: armada-37xx: use correct OUTPUT_VAL register for GPIOs > 31
    bf49527089ec f2fs: fix to avoid accessing uninitialized curseg
    db758487f3dd tracing: Fix compilation warning on arm32

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f51d876fdf243ec4fb0907e870803ecbdb12ca97)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index f6bc400c71..5f6a563ee5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7e0aff00ea569c858bf82407f501a0bf1f678f35"
-SRCREV_meta ?= "4e9bf48139a77d0a5ce2d4d23a0e2316fe2f5fa3"
+SRCREV_machine ?= "d7a7983928e6846c682771f9671d958e4789d691"
+SRCREV_meta ?= "bc26c6c6b91fa0e4de4920544cc4aeeb3dedd894"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.32"
+LINUX_VERSION ?= "6.12.33"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index db512ddde8..6152ebfaa7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.32"
+LINUX_VERSION ?= "6.12.33"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "1cf1ca9467d84882daea5acf7426b214dd0a7fee"
-SRCREV_meta ?= "4e9bf48139a77d0a5ce2d4d23a0e2316fe2f5fa3"
+SRCREV_machine ?= "897cf66d25d8a7290eeb899e27456f60fbf203ec"
+SRCREV_meta ?= "bc26c6c6b91fa0e4de4920544cc4aeeb3dedd894"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index a57dfd62d3..29532a03cc 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "22fa09f54f9c345541d8e68ca73106489acec177"
-SRCREV_machine:qemuarm64 ?= "1cf1ca9467d84882daea5acf7426b214dd0a7fee"
-SRCREV_machine:qemuloongarch64 ?= "1cf1ca9467d84882daea5acf7426b214dd0a7fee"
-SRCREV_machine:qemumips ?= "bf70488668471d5d0f6128d02cc23529132a7ee4"
-SRCREV_machine:qemuppc ?= "1cf1ca9467d84882daea5acf7426b214dd0a7fee"
-SRCREV_machine:qemuriscv64 ?= "1cf1ca9467d84882daea5acf7426b214dd0a7fee"
-SRCREV_machine:qemuriscv32 ?= "1cf1ca9467d84882daea5acf7426b214dd0a7fee"
-SRCREV_machine:qemux86 ?= "1cf1ca9467d84882daea5acf7426b214dd0a7fee"
-SRCREV_machine:qemux86-64 ?= "1cf1ca9467d84882daea5acf7426b214dd0a7fee"
-SRCREV_machine:qemumips64 ?= "b35f07357970c0de8cce2f6496090f8008ffc0ab"
-SRCREV_machine ?= "1cf1ca9467d84882daea5acf7426b214dd0a7fee"
-SRCREV_meta ?= "4e9bf48139a77d0a5ce2d4d23a0e2316fe2f5fa3"
+SRCREV_machine:qemuarm ?= "588ee9ffcc393af78905cd2e44d54a359d0e500d"
+SRCREV_machine:qemuarm64 ?= "897cf66d25d8a7290eeb899e27456f60fbf203ec"
+SRCREV_machine:qemuloongarch64 ?= "897cf66d25d8a7290eeb899e27456f60fbf203ec"
+SRCREV_machine:qemumips ?= "3610d715bf098ed5d47c98ca9ea395627488ce23"
+SRCREV_machine:qemuppc ?= "897cf66d25d8a7290eeb899e27456f60fbf203ec"
+SRCREV_machine:qemuriscv64 ?= "897cf66d25d8a7290eeb899e27456f60fbf203ec"
+SRCREV_machine:qemuriscv32 ?= "897cf66d25d8a7290eeb899e27456f60fbf203ec"
+SRCREV_machine:qemux86 ?= "897cf66d25d8a7290eeb899e27456f60fbf203ec"
+SRCREV_machine:qemux86-64 ?= "897cf66d25d8a7290eeb899e27456f60fbf203ec"
+SRCREV_machine:qemumips64 ?= "2fd393fbc1b2f8e809b07f4ffb73a4611a569c3d"
+SRCREV_machine ?= "897cf66d25d8a7290eeb899e27456f60fbf203ec"
+SRCREV_meta ?= "bc26c6c6b91fa0e4de4920544cc4aeeb3dedd894"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "ba9210b8c96355a16b78e1b890dce78f284d6f31"
+SRCREV_machine:class-devupstream ?= "e03ced99c437f4a7992b8fa3d97d598f55453fd0"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.32"
+LINUX_VERSION ?= "6.12.33"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


