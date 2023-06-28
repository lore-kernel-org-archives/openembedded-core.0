Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF406C3DA40
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 02:30:04 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.7276.1687919400050248560
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 19:30:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=VphwbOUr;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-668711086f4so350196b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 19:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687919399; x=1690511399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lGa+kq3KdAMWWv8IfHSyA8SOf/e115GNavNlPYy4KuA=;
        b=VphwbOUr7zDKVLfooN1l+hhdIe087Qh18plIhyff08dV/3w/zBJ75vmV/EPBA3zuej
         AD/dkWkuR5IlCDFTCqzop+IS/tteDuORT1VGfwm5+q100Ykco8n8RGw0uMgaPTY61OWN
         d7i0cbFktW10k7L1ZiJTVFZTVYNeS/D6yKe8zfTEGD40dS0TleI5/HJkjK/Wa6l6yGxa
         hbkL6XK7we95Osx2cY0rtiFtN1HxZBoD3VAZ+EWlDyGJGTOphegpg7NNklOWrpZYbKGj
         gtgW14hoC++I0aSXUNdt5A0YUNJCMLut0I+yT+phfUEj3KhYOUz7f+8MVNxh5it+w7rW
         pX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687919399; x=1690511399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lGa+kq3KdAMWWv8IfHSyA8SOf/e115GNavNlPYy4KuA=;
        b=X4a03ugweC/4d9/KTnFKgEJEMaNa3kQ55K2N04OCxf2jLC36uGPTObghJltAxntkrr
         VtlNMZ6gPncxEbKvXuyA75y5zo68fPlmXWc9ctxAHJBA72htQbz+6MYRVu3Brnh5zEKA
         bvq4uPT3isXEUCvAbAlUPGWLVm0bW22RWf11oo1G7XBp0bmkik4spVP+JwEZ8tLEkV5s
         7n0DoQmExaZK8m6WijOKbuRM+Iz03uWvGPNUeiNOxmb6vddANA0KTUrRcscEiNNqNwNW
         K/+TXFRK+tLqkvhaFupxz6rTKeCSds25xjtszvnb0aMsxEBGeTcU3OierssYLPO0GYbE
         tG3g==
X-Gm-Message-State: AC+VfDw4kX7lXgLwk7rLxrRwAqlcyct9fHAV1HDVzwO21Thtp5DnEgkf
	W/cYbqD62I+xQYEC+1SzcB0fpmwDZTZwnj2tloz1kg==
X-Google-Smtp-Source: ACHHUZ5Lp/1WGsxaHsttW9YGOfRE9BBaySu3ws9w9x4qXhWGlAOer026+DkkpPzdl9HAguVqHzyGyg==
X-Received: by 2002:a05:6a00:1305:b0:666:c1ab:d6e5 with SMTP id j5-20020a056a00130500b00666c1abd6e5mr44665444pfu.16.1687919398817;
        Tue, 27 Jun 2023 19:29:58 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c18-20020a62e812000000b0063d2d9990ecsm1568666pfi.87.2023.06.27.19.29.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 19:29:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 03/30] linux-yocto/5.15: update to v5.15.114
Date: Tue, 27 Jun 2023 16:29:19 -1000
Message-Id: <b83b248e5042dd1e9fdbc4c48be1af188fece1df.1687919241.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687919241.git.steve@sakoman.com>
References: <cover.1687919241.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 02:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183512

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    0ab06468cbd1 Linux 5.15.114
    193c59ba7299 net: phy: mscc: add VSC8502 to MODULE_DEVICE_TABLE
    350b95e86ca9 3c589_cs: Fix an error handling path in tc589_probe()
    7c2fa3e56d95 regulator: mt6359: add read check for PMIC MT6359
    28ebfb74fbf5 firmware: arm_ffa: Set reserved/MBZ fields to zero in the memory descriptors
    34b0985ebdfc arm64: dts: imx8mn-var-som: fix PHY detection bug by adding deassert delay
    1e7550653680 net/mlx5: Devcom, fix error flow in mlx5_devcom_register_device
    a89a69cea44c net/mlx5: Fix error message when failing to allocate device memory
    e8a974bbf4a5 net/mlx5: DR, Check force-loopback RC QP capability independently from RoCE
    5e0cc0d502d4 net/mlx5: DR, Fix crc32 calculation to work on big-endian (BE) CPUs
    792a8233fc01 net/mlx5e: do as little as possible in napi poll when budget is 0
    fdf8f33e7d03 platform/mellanox: mlxbf-pmc: fix sscanf() error checking
    d5ab5447d910 forcedeth: Fix an error handling path in nv_probe()
    ae7c4ec42655 sctp: fix an issue that plpmtu can never go to complete state
    ee553694be42 ASoC: Intel: Skylake: Fix declaration of enum skl_ch_cfg
    aafa5019e2a3 x86/show_trace_log_lvl: Ensure stack pointer is aligned, again
    90314394a16d xen/pvcalls-back: fix double frees with pvcalls_new_active_socket()
    ff151810fb95 coresight: Fix signedness bug in tmc_etr_buf_insert_barrier_packet()
    24cf11474376 regulator: pca9450: Fix BUCK2 enable_mask
    cd41ec23503f fs: fix undefined behavior in bit shift for SB_NOUSER
    c2f65991097a firmware: arm_ffa: Fix FFA device names for logical partitions
    6a26c62625c5 firmware: arm_ffa: Check if ffa_driver remove is present before executing
    f64567bd9566 power: supply: sbs-charger: Fix INHIBITED bit for Status reg
    71a9f146b3dc power: supply: bq27xxx: Add cache parameter to bq27xxx_battery_current_and_status()
    e98e5bebfcaf power: supply: bq27xxx: Fix poll_interval handling and races on remove
    e01820a94aea power: supply: bq27xxx: Fix I2C IRQ race on remove
    d21b3448577f power: supply: bq27xxx: Fix bq27xxx_battery_update() race condition
    c530f60e5a2e power: supply: mt6360: add a check of devm_work_autocancel in mt6360_charger_probe
    0dd4881238bc power: supply: leds: Fix blink to LED on transition
    5e4bb063dcaf cifs: mapchars mount option ignored
    9b92e2d0eb69 ipv6: Fix out-of-bounds access in ipv6_find_tlv()
    bf478c2643ba bpf: Fix mask generation for 32-bit narrow loads of 64-bit fields
    79081b3f489a octeontx2-pf: Fix TSOv6 offload
    114657365c88 selftests: fib_tests: mute cleanup error message
    e06841a2abf9 net: fix skb leak in __skb_tstamp_tx()
    8f1512d78b5d ASoC: lpass: Fix for KASAN use_after_free out of bounds
    b1bde4b4360c media: radio-shark: Add endpoint checks
    43f569fd0699 USB: sisusbvga: Add endpoint checks
    da0f4b557682 USB: core: Add routines for endpoint checks in old drivers
    387bd0a3af3b udplite: Fix NULL pointer dereference in __sk_mem_raise_allocated().
    cf3b5cd7127c net: fix stack overflow when LRO is disabled for virtual interfaces
    9e12c58a5ece fbdev: udlfb: Fix endpoint check
    aee97eec7702 debugobjects: Don't wake up kswapd from fill_pool()
    c09a7b6190f5 x86/topology: Fix erroneous smp_num_siblings on Intel Hybrid platforms
    a9ffd42eb9ab perf/x86/uncore: Correct the number of CHAs on SPR
    277f206bb874 parisc: Fix flush_dcache_page() for usage from irq context
    eff115ca949a selftests/memfd: Fix unknown type name build failure
    1a98b6e028ee x86/mm: Avoid incomplete Global INVLPG flushes
    683bb30c6947 dt-binding: cdns,usb3: Fix cdns,on-chip-buff-size type
    647af8a998c2 btrfs: use nofs when cleaning up aborted transactions
    7e93fe1d1733 gpio: mockup: Fix mode of debugfs files
    3a2d238c5a3a parisc: Allow to reboot machine after system halt
    96f8dd0483c8 parisc: Handle kgdb breakpoints only in kernel context
    16deb7413ace m68k: Move signal frame following exception on 68020/030
    9be921854e98 net: cdc_ncm: Deal with too low values of dwNtbOutMaxSize
    1f6ae24e3d5a ASoC: rt5682: Disable jack detection interrupt during suspend
    693acaa739dc mmc: sdhci-esdhc-imx: make "no-mmc-hs400" works
    7177586e06ff ALSA: hda/realtek: Enable headset onLenovo M70/M90
    e6a624451afb ALSA: hda: Fix unhandled register update during auto-suspend period
    7716da3fa10b ALSA: hda/ca0132: add quirk for EVGA X299 DARK
    c37eb46c613a arm64: Also reset KASAN tag if page is not PG_mte_tagged
    291fe3d6f5db ocfs2: Switch to security_inode_init_security()
    4badd33929c0 spi: fsl-cpm: Use 16 bit mode for large transfers with even size
    28ffe8c84603 spi: fsl-spi: Re-organise transfer bits_per_word adaptation
    381e55bffe15 ARM: dts: stm32: fix AV96 board SAI2 pin muxing on stm32mp15
    ca338fa8032a watchdog: sp5100_tco: Immediately trigger upon starting.
    6312c7cc07f3 dt-bindings: ata: ahci-ceva: Cover all 4 iommus entries
    7ef9045fe758 dt-bindings: ata: ahci-ceva: convert to yaml
    f19171155305 usb: dwc3: fix gadget mode suspend interrupt handler issue
    7919af1dcb8e usb: gadget: Properly configure the device for remote wakeup

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index f49623a2cc..e59146cd25 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "613a261b361c2f0d1e1428ad02dffe4e81d1a24b"
-SRCREV_meta ?= "957ddf5f9d4bf5791e88a46ce9ec4352a6d0a171"
+SRCREV_machine ?= "85bc9c4be5d0be6f26d120ee466ea456d4b72adc"
+SRCREV_meta ?= "ba0876ac0b787294ecb502d82c057ac71fd3fe3d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "5.15.113"
+LINUX_VERSION ?= "5.15.114"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 1981d6e5ac..d8b0ea9a6b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.113"
+LINUX_VERSION ?= "5.15.114"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "cad8d3fd06feec26840453ddfd483216b4cf5b51"
-SRCREV_meta ?= "957ddf5f9d4bf5791e88a46ce9ec4352a6d0a171"
+SRCREV_machine ?= "91a679c72403cfb28c8a03991c8ab7fd05bae24e"
+SRCREV_meta ?= "ba0876ac0b787294ecb502d82c057ac71fd3fe3d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 6213763295..910a9ad2cc 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "8f55d1b405ec36812e15592bec1a471c4afa8dfa"
-SRCREV_machine:qemuarm64 ?= "6f43cd2bf083a3a6d77edd2ddd275b9c6c3adf63"
-SRCREV_machine:qemumips ?= "942912a383bbb5b1edb362c1da8f328c50e8e16a"
-SRCREV_machine:qemuppc ?= "9b2cc2b52ad546d07bcef0d6c76e657ff46140ce"
-SRCREV_machine:qemuriscv64 ?= "934b0d629afd6e3bf31fcaeada9828b1f13dbd91"
-SRCREV_machine:qemuriscv32 ?= "934b0d629afd6e3bf31fcaeada9828b1f13dbd91"
-SRCREV_machine:qemux86 ?= "934b0d629afd6e3bf31fcaeada9828b1f13dbd91"
-SRCREV_machine:qemux86-64 ?= "934b0d629afd6e3bf31fcaeada9828b1f13dbd91"
-SRCREV_machine:qemumips64 ?= "570b02954e1cf598ba8792aa6127ddde7f2af647"
-SRCREV_machine ?= "934b0d629afd6e3bf31fcaeada9828b1f13dbd91"
-SRCREV_meta ?= "957ddf5f9d4bf5791e88a46ce9ec4352a6d0a171"
+SRCREV_machine:qemuarm ?= "cc8e6ff343cc0c0ca4e81bd9c8246cf26a1386d2"
+SRCREV_machine:qemuarm64 ?= "144e8b0887515060993c55aa6390953facdc5985"
+SRCREV_machine:qemumips ?= "875ca95dfbdc54834a761eca4ace8ea8464553e0"
+SRCREV_machine:qemuppc ?= "4dd882535e9f7b24974b070a33e132ee783cae12"
+SRCREV_machine:qemuriscv64 ?= "08ba9badec4caaec9caa61bab1651716ba2a0eaf"
+SRCREV_machine:qemuriscv32 ?= "08ba9badec4caaec9caa61bab1651716ba2a0eaf"
+SRCREV_machine:qemux86 ?= "08ba9badec4caaec9caa61bab1651716ba2a0eaf"
+SRCREV_machine:qemux86-64 ?= "08ba9badec4caaec9caa61bab1651716ba2a0eaf"
+SRCREV_machine:qemumips64 ?= "788a1a85fd93d1d5b115fbbc6370fe26fae6dea4"
+SRCREV_machine ?= "08ba9badec4caaec9caa61bab1651716ba2a0eaf"
+SRCREV_meta ?= "ba0876ac0b787294ecb502d82c057ac71fd3fe3d"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "1fe619a7d25218e9b9fdcce9fcac6a05cd62abed"
+SRCREV_machine:class-devupstream ?= "0ab06468cbd149aac0d7f216ec00452ff8c74e0b"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.113"
+LINUX_VERSION ?= "5.15.114"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


