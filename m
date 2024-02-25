Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ADF5C54E49
	for <webhook@archiver.kernel.org>; Sun, 25 Feb 2024 21:53:14 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.7434.1708897992548834275
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 13:53:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mC8ktocL;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.52, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6ddf26eba3cso2157093a34.0
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 13:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708897991; x=1709502791; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=962PX6ukALXbflyRrRlLsZwFRjM/jMUmkVrB6iL8PRU=;
        b=mC8ktocL/wdELrk7kAnC44A9uSCjeENaeJ7vGGof0sTUPzLmSqRvqshV6BdsnYcwVg
         qtEb9CM5NuC02eFsqeAhbQbc2DpJRtn59/vY9DjihXyj9ElAWzroe1+rrKS4CxLsmDhV
         rC0UvTeq66o2OjHNVmRs/4XzWUT+qeCPq7snzaED1hlqRgLlfwh1C0Ap+cp47kxvoIQu
         hU0aGLkDxrKfsLepJ4oCUarxVhZkCf4/nUutO1PKnX0KoAlsYUCp2SHrQxCnki3SVGxw
         uPwHI0ZogD/mMnCtIdXm5buzQY47Ce1KyeLv0Z16b2wI8QuavmGuFoyy3yHZWmVR6iZl
         lIyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708897991; x=1709502791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=962PX6ukALXbflyRrRlLsZwFRjM/jMUmkVrB6iL8PRU=;
        b=BQeBAhWsoCRXIlFQDUsuodJyYuUR1dOQin8UDvwQPg7d1/YwWEXRa6V+Mc8PRYGYvC
         n8iPlskEk9IlUCzlfl5vBOEgsFIPIlP54/rxiyeuaOdx4Zp18WuIsi3mrYxnION1zyW5
         ooIEbc9MXO5uCK8fYGz+EpIv6eUCfgtIsbP9WFUSNUoAA/BYm9UCCY0VYZuNn6KvJUNv
         yhaBTfWcmf/7lZCUz+Lbe/Qu0Ecnq99Bi2yNiRxxFAUySAiCJfHgyocw9j+quVkNo7Dp
         HUG1qnkFTNIxYWG4epmQNJj/4G5LoHaq/Gi7wQxEOQmsYHB2sWMG7t0U4YlWLmTzJv3R
         WiXg==
X-Gm-Message-State: AOJu0Yyi8xotPF6dUmNKfIuJqFgxtYXBe9NonBnmk/Lz41smZMMmq0Ui
	r0BT2A+iOdZuQre4ljAVo7lQYgkVTNSaKi+8EjW25M5/7f3cGkkUkAXSRooAjGnYMmxhNZqGNfS
	4xOs34Q==
X-Google-Smtp-Source: AGHT+IGjEg/E6dspBaNmsyRZfHkxBYbqRTRkQefxEuyiXszL+vEmYExl+FDUcIGM5XTBgpqv0r9WEA==
X-Received: by 2002:a05:6359:4c0b:b0:17a:ed6c:3f0f with SMTP id kj11-20020a0563594c0b00b0017aed6c3f0fmr8106588rwc.22.1708897991284;
        Sun, 25 Feb 2024 13:53:11 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a12-20020a17090acb8c00b0029a4089fbf0sm3082947pju.16.2024.02.25.13.53.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 13:53:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/22] linux-yocto/5.15: update to v5.15.142
Date: Sun, 25 Feb 2024 11:52:29 -1000
Message-Id: <4deed206f92fc207d18cdb4c8bc35ce1bf0fb0f6.1708897822.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708897822.git.steve@sakoman.com>
References: <cover.1708897822.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 21:53:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196162

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    8a1d809b0545 Linux 5.15.142
    4d9bd1b108d7 iomap: update ki_pos a little later in iomap_dio_complete
    6ed02493ef14 r8169: fix deadlock on RTL8125 in jumbo mtu mode
    0249024aa48e r8169: disable ASPM in case of tx timeout
    8912dbddb25f mmc: sdhci-sprd: Fix vqmmc not shutting down after the card was pulled
    68156ce2527f mmc: core: add helpers mmc_regulator_enable/disable_vqmmc
    9807860f6ad4 iommu/vt-d: Make context clearing consistent with context mapping
    7960f2cf4378 iommu/vt-d: Omit devTLB invalidation requests when TES=0
    cfd842b71db2 cpufreq: imx6q: Don't disable 792 Mhz OPP unnecessarily
    f0b6880658f5 cpufreq: imx6q: don't warn for disabling a non-existing frequency
    bb08df40d451 smb3: fix caching of ctime on setxattr
    15b4158c872d fs: add ctime accessors infrastructure
    db78835b68c6 fbdev: stifb: Make the STI next font pointer a 32-bit signed offset
    711ee151a303 ASoC: SOF: sof-pci-dev: Fix community key quirk detection
    81952f82e32b ASoC: SOF: sof-pci-dev: don't use the community key on APL Chromebooks
    fa0a570d84b7 ASoC: SOF: sof-pci-dev: add parameter to override topology filename
    0d38d659a9d2 ASoC: SOF: sof-pci-dev: use community key on all Up boards
    f3db01e4d012 ASoC: Intel: Move soc_intel_is_foo() helpers to a generic header
    b4329a3a93d3 smb3: fix touch -h of symlink
    b60187f610fb selftests/resctrl: Move _GNU_SOURCE define into Makefile
    072c17d4003a selftests/resctrl: Add missing SPDX license to Makefile
    1e9973aea221 perf intel-pt: Fix async branch flags
    0a6b5321dcb0 net: ravb: Stop DMA in case of failures on ravb_open()
    a4515a2f5b1e net: ravb: Start TX queues after HW initialization succeeded
    2ba0a8330dae net: ravb: Use pm_runtime_resume_and_get()
    5823191fb2ba net: ravb: Check return value of reset_control_deassert()
    24681e92e517 ravb: Fix races between ravb_tx_timeout_work() and net related ops
    9750941783a2 r8169: prevent potential deadlock in rtl8169_close
    666250692881 Revert "workqueue: remove unused cancel_work()"
    2587d8fe1484 octeontx2-pf: Fix adding mbox work queue entry when num_vfs > 64
    54260f148377 net: stmmac: xgmac: Disable FPE MMC interrupts
    9af4884b8ae6 octeontx2-af: Fix possible buffer overflow
    f4499f0fc1e6 selftests/net: ipsec: fix constant out of range
    8454f0e090d4 uapi: propagate __struct_group() attributes to the container union
    0bf95654e999 dpaa2-eth: increase the needed headroom to account for alignment
    c4a00c47a140 ipv4: igmp: fix refcnt uaf issue when receiving igmp query packet
    64c27b7b2357 usb: config: fix iteration issue in 'usb_get_bos_descriptor()'
    e704db8ea64a USB: core: Change configuration warnings to notices
    bec3ae293810 hv_netvsc: fix race of netvsc and VF register_netdevice
    69732d2151b5 rcu: Avoid tracing a few functions executed in stop machine
    02caa78cbc22 vlan: move dev_put into vlan_dev_uninit
    842801181864 vlan: introduce vlan_dev_free_egress_priority
    a8604a90e1db Input: xpad - add HyperX Clutch Gladiate Support
    875eeda48161 btrfs: make error messages more clear when getting a chunk map
    47693835edb1 btrfs: send: ensure send_fd is writable
    36b98806d243 btrfs: fix off-by-one when checking chunk map includes logical address
    0ffd9d356ea0 btrfs: ref-verify: fix memory leaks in btrfs_ref_tree_mod()
    a480eb262b17 btrfs: add dmesg output for first mount and last unmount of a filesystem
    2e931b33060c parisc: Drop the HP-UX ENOSYM and EREMOTERELEASE error codes
    f0d052223488 powerpc: Don't clobber f0/vs0 during fp|altivec register save
    d48f9008e892 iommu/vt-d: Add MTL to quirk list to skip TE disabling
    0c7fa41e3e74 bcache: revert replacing IS_ERR_OR_NULL with IS_ERR
    c986cb72eb41 dm verity: don't perform FEC for failed readahead IO
    9a2590b400d4 dm-verity: align struct dm_verity_fec_io properly
    61a982f9a575 ALSA: hda/realtek: Add supported ALC257 for ChromeOS
    5fe4d96502e8 ALSA: hda/realtek: Headset Mic VREF to 100%
    4ed5ad052286 ALSA: hda: Disable power-save on KONTRON SinglePC
    a75793684734 mmc: block: Be sure to wait while busy in CQE error recovery
    8dfdd6038e32 mmc: block: Do not lose cache flush during CQE error recovery
    129984dc9b1b mmc: block: Retry commands in CQE error recovery
    85afaefa9568 mmc: cqhci: Fix task clearing in CQE error recovery
    ceec82319989 mmc: cqhci: Warn of halt or task clear failure
    9edc063598c9 mmc: cqhci: Increase recovery halt timeout
    443829382220 firewire: core: fix possible memory leak in create_units()
    b20f71c8098b pinctrl: avoid reload of p state in list iteration

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index f7286759a9..37fb729e0d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "423b5d5cb3f45a272285fa4157d1964086fabc2e"
-SRCREV_meta ?= "92bd0a656f0f9db955fb53c52be71cce9296bdb2"
+SRCREV_machine ?= "205938506aafa86698f2753a59d2c9f13d080fbb"
+SRCREV_meta ?= "9a1e0301f56cda16a9fabd03745dba445f068349"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.141"
+LINUX_VERSION ?= "5.15.142"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 7461087299..f502030c9d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.141"
+LINUX_VERSION ?= "5.15.142"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "ddf2eeeb31d1edaa5a80e9aabc8b2674ae95f865"
-SRCREV_meta ?= "92bd0a656f0f9db955fb53c52be71cce9296bdb2"
+SRCREV_machine ?= "53b8058476d634a0103dff993e24d15b1fd087c7"
+SRCREV_meta ?= "9a1e0301f56cda16a9fabd03745dba445f068349"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index c7b07dee62..1021065bf7 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "0bd882ff2a47566033965928ab468491f7e1ffd6"
-SRCREV_machine:qemuarm64 ?= "d353330a9ba30300be32f1d732723ae3678da684"
-SRCREV_machine:qemumips ?= "7f8fbffda634dc22a70f69ff2b762a1f3ff9c842"
-SRCREV_machine:qemuppc ?= "fb2191ca96824c7451fbca4eef129660d25711af"
-SRCREV_machine:qemuriscv64 ?= "54a3472506956ed41289ae423ca9b7ad4cbb3ab5"
-SRCREV_machine:qemuriscv32 ?= "54a3472506956ed41289ae423ca9b7ad4cbb3ab5"
-SRCREV_machine:qemux86 ?= "54a3472506956ed41289ae423ca9b7ad4cbb3ab5"
-SRCREV_machine:qemux86-64 ?= "54a3472506956ed41289ae423ca9b7ad4cbb3ab5"
-SRCREV_machine:qemumips64 ?= "35895af6b529915f9c09a720592554feaca9a2c7"
-SRCREV_machine ?= "54a3472506956ed41289ae423ca9b7ad4cbb3ab5"
-SRCREV_meta ?= "92bd0a656f0f9db955fb53c52be71cce9296bdb2"
+SRCREV_machine:qemuarm ?= "325679bc1a595ca81783f7652e13ce7f2be58620"
+SRCREV_machine:qemuarm64 ?= "338f086bcd841a5b0239ddb66c34ca23ff5af2f5"
+SRCREV_machine:qemumips ?= "af26192f4dd0fc7396faedd4653034ae02d5ed6d"
+SRCREV_machine:qemuppc ?= "be567407d4d9009407c4e7a511e7227fcb36b0b7"
+SRCREV_machine:qemuriscv64 ?= "97015a8737f3f284f9a9c4967bf12c8b26efcdcc"
+SRCREV_machine:qemuriscv32 ?= "97015a8737f3f284f9a9c4967bf12c8b26efcdcc"
+SRCREV_machine:qemux86 ?= "97015a8737f3f284f9a9c4967bf12c8b26efcdcc"
+SRCREV_machine:qemux86-64 ?= "97015a8737f3f284f9a9c4967bf12c8b26efcdcc"
+SRCREV_machine:qemumips64 ?= "3a2ff5c2f2e6e0c0653da1192081681e2a50b592"
+SRCREV_machine ?= "97015a8737f3f284f9a9c4967bf12c8b26efcdcc"
+SRCREV_meta ?= "9a1e0301f56cda16a9fabd03745dba445f068349"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "9b91d36ba301db86bbf9e783169f7f6abf2585d8"
+SRCREV_machine:class-devupstream ?= "8a1d809b05454b2e08fb3d801787917975fdb037"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.141"
+LINUX_VERSION ?= "5.15.142"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


