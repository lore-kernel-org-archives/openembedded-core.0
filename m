Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B62D3CCD185
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 03:09:04 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.4650.1760584135744564175
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 20:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UIF06uxg;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-81fdd5d7b59so4587776d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 20:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760584135; x=1761188935; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dbYgptsqktDcDv8w4IWjVJoH7udrHWUxtWiqM6F+J7g=;
        b=UIF06uxgKGjoKHZZa6bVcFG1XxYUvh5Pdfh/CmaJUav7KNZqLKrInwnAHHI/IzNOH1
         AeaJnS7pPDmDTUZDJNlgB9hgEevtvJSjUEuLtrJ/TVA+W6ilj0y7LzCJDJbdA4EyBZUB
         YuQPrI0RQR0jtLljLpB4h1ken6lYgSLwcpNIXYB+VK14PCSYLD3zZdoCw/HJ3c3G+yBg
         DfAD+5xYcC4L7p0llmz1IEagwIHlSMM0ateBft+Xv6YP5ExXcqb8BwOX/pm1SdKbPWdI
         0Rpm0pH6RIbeZZZvFZaQ3+v0kpKG2kXfm4zOHyDXmHgTPXKmMKsNvGeKDZzeYkPaQTPI
         T2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760584135; x=1761188935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dbYgptsqktDcDv8w4IWjVJoH7udrHWUxtWiqM6F+J7g=;
        b=LXvqq+XetL+1C60NxTWIUbbeyHs8bJNh9jBEN1qEb0BcVJ/WA7TFVajaslbsUOJrnZ
         xUlVoSXuDn/L0+YPoJ23txofosor6CnjMS1Z2oOJGltcvFCo4tQOWr4+7DzQ2Sm2LQB6
         VOnC7whpaq74ehD71sXtJyZ/ke4nxoH9i+pH49aroyKZF/IQtpRYnLeKOenZmS+Xl3vp
         BulzXxBwUrOxv05i+DxI/kOHe/d3+7q9CU/5E5DBfiw8hYNRfk2le5bV/vvgaj+nOtWd
         Ltff/84oRJR8P1RN9BY0HnQU0CNI03HZiIYW0j2/xYp21iErGhGtFHWPsNDdMyie0xNN
         rrSQ==
X-Gm-Message-State: AOJu0YwvV0FvAuh2FBgHl/ZyHQBbj1qOR0NsoqBY05BxreXCHae7FkJ4
	mTHoe0wggy8QJZD5QhpSFGa8ZxC/mDp359mqjW9StSpTpZ5pL46Za+P3gsNaCxoYTfE=
X-Gm-Gg: ASbGncse6TIxTXBDV1gmOLLnpfDyPcmCqzwmk86kEQKmIKInUofUWi3ItUPuY+K6wAv
	+dYLwt1DoQFk9qdi0V5n8Al0z4OKgwCMjaFauVY3EFx/Is5y/4Rz0V/bhO4UCByBH0UP/YBUamz
	wK9DzRItcG5mq8XFSzoplGJUQk5myesvtKFJUgWMJ/ayice8rlSbgWV1jkhq4isRgRQPPrYMedq
	K9T5GED9FQYXhjmC0u5DHv5bKprydNnLCYLTfTTN6yE3yeLF0m4eHFCMCkZiZ8k/uDpKGFko2Zy
	LLLZOZSDvKBQmZ92Vfq7F1NgoajKT/Kf4ZfuXLwdsh3xWYcpqkLhvxb54R7zaGLEclZpfkTY2VR
	5ctn/k8Ycv9jnyYpyrgmyhkzGzd89+ed9Qw5+RHQaI4AQ2pzWUuj6LDb7AqA2rtf8C3HOFSG4uN
	vvaVlRrss8dkK9aixPlqOjilJOMKbQPw+0role2FHIiIgSBM72uIAWyev0Wc0mRTQrAyt7B92SQ
	fMD
X-Google-Smtp-Source: AGHT+IFCUaimwtj9LxOehelv3nu2ji7NZV0lz8g97PN75tnD6EoxxW49L2QnkzmA4ngZGf0luDOglg==
X-Received: by 2002:a05:6214:5089:b0:794:f422:bcfe with SMTP id 6a1803df08f44-87b2ef4dbb3mr318860776d6.46.1760584134571;
        Wed, 15 Oct 2025 20:08:54 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c012a39d9sm30824986d6.44.2025.10.15.20.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 20:08:53 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/11] linux-yocto/6.12: update to v6.12.52
Date: Wed, 15 Oct 2025 23:08:40 -0400
Message-Id: <6969fdeb97ff584f0442f772e892f737a71445cf.1760583881.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1760583881.git.bruce.ashfield@gmail.com>
References: <cover.1760583881.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 03:09:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224922

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    2b2cbdcede38 Linux 6.12.52
    e7177c7e32cb KVM: x86: Don't (re)check L1 intercepts when completing userspace I/O
    716dceb19a9f net/9p: fix double req put in p9_fd_cancelled
    c5c703b50e91 crypto: rng - Ensure set_ent is always present
    77dd0e6cb9f9 driver core/PM: Set power.no_callbacks along with power.no_pm
    99d67efda945 staging: axis-fifo: flush RX FIFO on read errors
    7441d70d5cd6 staging: axis-fifo: fix TX handling on copy_from_user() failure
    cc9cfbfb2916 staging: axis-fifo: fix maximum TX packet length check
    65422a6a0d2d serial: stm32: allow selecting console when the driver is module
    c301ec61ce6f binder: fix double-free in dbitmap
    1855e18bff88 nvmem: layouts: fix automatic module loading
    4827bd6548e0 hid: fix I2C read buffer overflow in raw_event() for mcp2221
    647d6b8d22be ALSA: usb-audio: fix race condition to UAF in snd_usbmidi_free
    c611b9e55174 ALSA: usb-audio: Kill timer properly at removal
    5980a35c9d13 drm/amdgpu: Enable MES lr_compute_wa by default
    2dedc6b77bf8 drm/amd/include : Update MES v12 API for fence update
    ff2b82286fc8 drm/amd/include : MES v11 and v12 API header update
    bfd0bec4cb2c drm/amd : Update MES API header file for v11 & v12
    44d41506d697 platform/x86/amd/pmc: Add Stellaris Slim Gen6 AMD to spurious 8042 quirks list
    4a918985a35f can: rcar_canfd: Fix controller mode setting
    1d2ef21f02ba can: hi311x: fix null pointer dereference when resuming from sleep before interface was enabled
    60bbfc295a33 netfs: Prevent duplicate unlocking
    ec045333522e btrfs: ref-verify: handle damaged extent root tree
    31a834865209 ASoC: rt5682s: Adjust SAR ADC button mode to fix noise issue
    467dd7cab347 platform/x86/amd/pmf: Support new ACPI ID AMDI0108
    1773f674c4f2 perf subcmd: avoid crash in exclude_cmds when excludes is empty
    6263c898761b platform/x86/amd/pmc: Add MECHREVO Yilong15Pro to spurious_8042 list
    27a0a815dbba dm-integrity: limit MAX_TAG_SIZE to 255
    6a3a7b13ad74 ASoC: amd: acp: Adjust pdm gain value
    e005b52b8398 rust: block: fix `srctree/` links
    1713796d6538 wifi: rtl8xxxu: Don't claim USB ID 07b8:8188
    914d02595ba6 wifi: rtlwifi: rtl8192cu: Don't claim USB ID 07b8:8188
    7c1e37878a2f Bluetooth: btusb: Add USB ID 2001:332a for D-Link AX9U rev. A1
    dad2ac26ac76 USB: serial: option: add SIMCom 8230C compositions
    f92181c0e13c media: i2c: tc358743: Fix use-after-free bugs caused by orphan timer in probe
    895cccf639ac wifi: rtw89: fix use-after-free in rtw89_core_tx_kick_off_and_wait()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 0128e62152..c6697e99b2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "02092ef333fa4503bc6da5f7d1f1eda2dee9c9d7"
-SRCREV_meta ?= "5f4ac28eb4130083ed7214f9bdedd4ee230af1a2"
+SRCREV_machine ?= "6e15f26e4078d6d17c8f2dd66b6f3a8976bb5f10"
+SRCREV_meta ?= "350aec7b58ac8a244f7084334cd072cc2b39dfdc"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.51"
+LINUX_VERSION ?= "6.12.52"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 0cd6e9b99b..2fe3f17451 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.51"
+LINUX_VERSION ?= "6.12.52"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "d12617f73759e07b81f95e6451e212e21dcd3230"
-SRCREV_meta ?= "5f4ac28eb4130083ed7214f9bdedd4ee230af1a2"
+SRCREV_machine ?= "7ec0c63fa4a7870b6e16d255828f5a0ae4ec821b"
+SRCREV_meta ?= "350aec7b58ac8a244f7084334cd072cc2b39dfdc"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 620e46b250..84ae7c0360 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "21e7e89f6bbcaec3d70000333004e47031246bfd"
-SRCREV_machine:qemuarm64 ?= "d12617f73759e07b81f95e6451e212e21dcd3230"
-SRCREV_machine:qemuloongarch64 ?= "d12617f73759e07b81f95e6451e212e21dcd3230"
-SRCREV_machine:qemumips ?= "64965a9f8fd95a53788b1ed6c275056ef6be9510"
-SRCREV_machine:qemuppc ?= "d12617f73759e07b81f95e6451e212e21dcd3230"
-SRCREV_machine:qemuriscv64 ?= "d12617f73759e07b81f95e6451e212e21dcd3230"
-SRCREV_machine:qemuriscv32 ?= "d12617f73759e07b81f95e6451e212e21dcd3230"
-SRCREV_machine:qemux86 ?= "d12617f73759e07b81f95e6451e212e21dcd3230"
-SRCREV_machine:qemux86-64 ?= "d12617f73759e07b81f95e6451e212e21dcd3230"
-SRCREV_machine:qemumips64 ?= "5298636e61f0c9d939f79cee4d48e9013aceeaef"
-SRCREV_machine ?= "d12617f73759e07b81f95e6451e212e21dcd3230"
-SRCREV_meta ?= "5f4ac28eb4130083ed7214f9bdedd4ee230af1a2"
+SRCREV_machine:qemuarm ?= "172b9fbf63ccfdfbcbeca1a3c7ba5c34eb9f2dcd"
+SRCREV_machine:qemuarm64 ?= "7ec0c63fa4a7870b6e16d255828f5a0ae4ec821b"
+SRCREV_machine:qemuloongarch64 ?= "7ec0c63fa4a7870b6e16d255828f5a0ae4ec821b"
+SRCREV_machine:qemumips ?= "31d0ff8e1f91778a5f6eacd2c539384999becfc9"
+SRCREV_machine:qemuppc ?= "7ec0c63fa4a7870b6e16d255828f5a0ae4ec821b"
+SRCREV_machine:qemuriscv64 ?= "7ec0c63fa4a7870b6e16d255828f5a0ae4ec821b"
+SRCREV_machine:qemuriscv32 ?= "7ec0c63fa4a7870b6e16d255828f5a0ae4ec821b"
+SRCREV_machine:qemux86 ?= "7ec0c63fa4a7870b6e16d255828f5a0ae4ec821b"
+SRCREV_machine:qemux86-64 ?= "7ec0c63fa4a7870b6e16d255828f5a0ae4ec821b"
+SRCREV_machine:qemumips64 ?= "27af9a15a47958d29f1ab8740b1bc4b6d9ecf27e"
+SRCREV_machine ?= "7ec0c63fa4a7870b6e16d255828f5a0ae4ec821b"
+SRCREV_meta ?= "350aec7b58ac8a244f7084334cd072cc2b39dfdc"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "72b82d56b82137a92a20e5584029d35408d810c2"
+SRCREV_machine:class-devupstream ?= "a9152eb181adaac576e8ac1ab79989881e0f301b"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.51"
+LINUX_VERSION ?= "6.12.52"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


