Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C549CCD1AA
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 20:40:14 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.3152.1760733609053131522
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 13:40:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=E8fDRYIq;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-77f5d497692so3082778b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 13:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760733608; x=1761338408; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r2IjBpU+VClWguoJitDRTCK9CcCWwZEXgcZsmc8BvWg=;
        b=E8fDRYIqyG4WO+n0BCJ1oeq5OcmGDXJgM7lq6W6vc7it9F2FJoyEYbaydcSUxXYJ/w
         h2vbTJo8H9gwuBR3lSjzy91WlNiFJ30uHxpa34OPcXhfCb4lPxsNCOXcVI15f0XBpj28
         tqKJcnEojsK8AA+mNi+Kh2MBr259MRyywUP6We3P7m6iQAfrrNGJeqMmI1VIZvg+8wGY
         3bU9tiAg4s4EAm7eVwTwWTDoduRPVfQuyM4A/k9t/+S5sb60haH+pjc/OwNaVWXejOh4
         ZkA5A7Zbp0BO4ycHoPEGrjphKQTyRiTKE0wqMw5aiifYo/tSBY19aJI5cNVaBsWupHx0
         E62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733608; x=1761338408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r2IjBpU+VClWguoJitDRTCK9CcCWwZEXgcZsmc8BvWg=;
        b=QJs6+9HQ5YjoxeHzflOdPRClEj5GLW8Cl9J74+W/5rZJ7nXpu7Gy8Af2jfiuyE9fZm
         zLOHwlUHqq24M2oDYDf2NAduB8QTdShWA3pexf5nqXS4JxddsK75a13Lfv8ftnXL0TMI
         jSi6KehQlIN9eslUNDpsBlI1swZ9ELTBBv+9InduqTtMczCcXdtHBO/PhemBPAwCTkpf
         fhjYJSv/BSp57spLd5D1vV2Driv6C3bzCIwlZHKw/Ms4qNXwm9T4QR/9uf9c/aKUhjDF
         wUptpIgxNV0gCRaoEXxrQNCPPyW5m2BDkI6PwmzF9S+to5sRg+Zz+0UTdFmuUY+WlXvQ
         MVWw==
X-Gm-Message-State: AOJu0YziaasTBMXkLBl8rbuSDYOrv364lVdV7nOTqEMlpbXbqSpsDJPe
	W+4OgTypYJLXsZ4crExhbc4SAGD0UBFvhq0FZP25tGLLlFKDg6LsXRdRNe8c9j85hZaIo98IAnv
	Q+B8/uUc=
X-Gm-Gg: ASbGncvAi/ysvI5hlEVAjIUAfRaanTLfx237n0f4sgI3QpCdLjbdvw+PUbnmxRYnT4w
	W0zOrR3qRjeo1upefvFUdaaNyrtye2xdWs3R0A7+rO3KJ1q7vcGOf0CINPklSe94NjVpiTpJ0ue
	fU1hdiLX1bpAlopJHn3OjkgwRgSUYvm+V0tpy4/X0Asv42BOvWrcIbcBhHcTFuhGUod6fgxruKZ
	TCBk5cQWrCuADcvSmQhSucv7lXv/jkaqTj7DYVhhJde3lIgBMaGsIIDhAIQDJAEeK2qA4DdMbi2
	CyDcDSWkONv80xnhtV09M5o4ZUTYL0wQxUmPl5KaPIFDu5rGX/1wdFr5qCf4qa3FvRQ1RlLZgxu
	YJjE8mNosP6xOkgV3yunqXFVqS4BIiRxdgM5xT9BHml7BGu7usQAaJWH8b7OGL8PXDA==
X-Google-Smtp-Source: AGHT+IG6neDjHCC8rcjX7shHtUGJN+9kEoF74Ln5Nk6eldQa5iVVhBBDV63Yc8a3G3y6oDs69eXw2g==
X-Received: by 2002:a05:6a00:21c4:b0:781:2290:e7e7 with SMTP id d2e1a72fcca58-7a220adb22bmr7231922b3a.18.1760733608230;
        Fri, 17 Oct 2025 13:40:08 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:aaee:e640:34cd:6f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f254esm477061b3a.45.2025.10.17.13.40.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:40:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 23/26] linux-yocto/6.6: update to v6.6.111
Date: Fri, 17 Oct 2025 13:39:06 -0700
Message-ID: <2a947cb13d0d46747f14aa6a1aa39a486459ee8a.1760733431.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760733431.git.steve@sakoman.com>
References: <cover.1760733431.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 20:40:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225057

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    655054d2c3c1 Linux 6.6.111
    3d3abf3f7e8b KVM: x86: Don't (re)check L1 intercepts when completing userspace I/O
    284e67a93b8c net/9p: fix double req put in p9_fd_cancelled
    ab172f4f4262 crypto: rng - Ensure set_ent is always present
    f5f235be7612 riscv: mm: Do not restrict mmap address based on hint
    1602c9b4578a riscv: mm: Use hint address in mmap if available
    e242e52fdfe4 driver core/PM: Set power.no_callbacks along with power.no_pm
    e857421992ce staging: axis-fifo: flush RX FIFO on read errors
    a3c71d6c8332 staging: axis-fifo: fix TX handling on copy_from_user() failure
    6d953e9d3981 staging: axis-fifo: fix maximum TX packet length check
    bfeea103cad9 serial: stm32: allow selecting console when the driver is module
    cb7630e714d6 hid: fix I2C read buffer overflow in raw_event() for mcp2221
    dc4874366cf6 ALSA: usb-audio: fix race condition to UAF in snd_usbmidi_free
    647410a7da46 ALSA: usb-audio: Kill timer properly at removal
    97e87f367c91 platform/x86/amd/pmc: Add Stellaris Slim Gen6 AMD to spurious 8042 quirks list
    bf28f5db40d5 can: rcar_canfd: Fix controller mode setting
    e93af787187e can: hi311x: fix null pointer dereference when resuming from sleep before interface was enabled
    03510f5fce33 btrfs: ref-verify: handle damaged extent root tree
    bcccd0220751 ASoC: rt5682s: Adjust SAR ADC button mode to fix noise issue
    081f14b9a3eb perf subcmd: avoid crash in exclude_cmds when excludes is empty
    6d59f7467f83 platform/x86/amd/pmc: Add MECHREVO Yilong15Pro to spurious_8042 list
    4b91d0c5781a dm-integrity: limit MAX_TAG_SIZE to 255
    7f7187118bb5 ASoC: amd: acp: Adjust pdm gain value
    8281c2a63bbc wifi: rtlwifi: rtl8192cu: Don't claim USB ID 07b8:8188
    96dc17ae64b1 USB: serial: option: add SIMCom 8230C compositions
    228d06c4cbfc media: i2c: tc358743: Fix use-after-free bugs caused by orphan timer in probe
    71ed8b81a490 media: tuner: xc5000: Fix use-after-free in xc5000_release
    f82dc869220d media: tunner: xc5000: Refactor firmware load
    250b6e009ff9 KVM: arm64: Fix softirq masking in FPSIMD register saving sequence

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 7652e03569..1179c03a00 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "07bc1b79b450a91fa9ed645a4c6c77332f6c7fd3"
-SRCREV_meta ?= "46ee47b6ee7ce2b3cef51844d7a7e82c6c2daf5d"
+SRCREV_machine ?= "30009325411827c48a376212ef00a5637f67b914"
+SRCREV_meta ?= "50530c858c90f124629dadce78f696b590747ea5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.110"
+LINUX_VERSION ?= "6.6.111"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 33eafc2f6d..eb906bad17 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.110"
+LINUX_VERSION ?= "6.6.111"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "0381ada6e1fee2c488a718f82ed83f0435a950c2"
-SRCREV_meta ?= "46ee47b6ee7ce2b3cef51844d7a7e82c6c2daf5d"
+SRCREV_machine ?= "529f5ce5c38c39bc1fe4022f499ee718bff0cb8b"
+SRCREV_meta ?= "50530c858c90f124629dadce78f696b590747ea5"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index c75094dc59..070342f5b7 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "2a0fa5ba202ff49a42a8f1c5e36ed1a2d7dc9b91"
-SRCREV_machine:qemuarm64 ?= "0974351ebdd700bc59eb25d7144e96c34cc28751"
-SRCREV_machine:qemuloongarch64 ?= "272bf113897632849f52e9dfc1bb990daa566375"
-SRCREV_machine:qemumips ?= "4b003154faca105c81dcfaebfe4e753b378eddde"
-SRCREV_machine:qemuppc ?= "b1416ec0248422122027ab9cee287d7c86e5cf77"
-SRCREV_machine:qemuriscv64 ?= "272bf113897632849f52e9dfc1bb990daa566375"
-SRCREV_machine:qemuriscv32 ?= "272bf113897632849f52e9dfc1bb990daa566375"
-SRCREV_machine:qemux86 ?= "272bf113897632849f52e9dfc1bb990daa566375"
-SRCREV_machine:qemux86-64 ?= "272bf113897632849f52e9dfc1bb990daa566375"
-SRCREV_machine:qemumips64 ?= "4b0c928fbc6df11ad63d99b006a8448597ccdd7d"
-SRCREV_machine ?= "272bf113897632849f52e9dfc1bb990daa566375"
-SRCREV_meta ?= "46ee47b6ee7ce2b3cef51844d7a7e82c6c2daf5d"
+SRCREV_machine:qemuarm ?= "f864fe79b2b8052e10bbe3ae443941ccefa5a951"
+SRCREV_machine:qemuarm64 ?= "cdd229fbaaa25d5d9eb055477af8c2b82238763b"
+SRCREV_machine:qemuloongarch64 ?= "2a17dc587afe4e133deef4d8c9ec98724aee785b"
+SRCREV_machine:qemumips ?= "2f5bef5596eeb6ac65023cfeb1a6402efcdc965f"
+SRCREV_machine:qemuppc ?= "be45c09ed7f4b5a09f95cd90484ef083c8552344"
+SRCREV_machine:qemuriscv64 ?= "2a17dc587afe4e133deef4d8c9ec98724aee785b"
+SRCREV_machine:qemuriscv32 ?= "2a17dc587afe4e133deef4d8c9ec98724aee785b"
+SRCREV_machine:qemux86 ?= "2a17dc587afe4e133deef4d8c9ec98724aee785b"
+SRCREV_machine:qemux86-64 ?= "2a17dc587afe4e133deef4d8c9ec98724aee785b"
+SRCREV_machine:qemumips64 ?= "130d3c48ab3b914907b88ff240463b4e5718d526"
+SRCREV_machine ?= "2a17dc587afe4e133deef4d8c9ec98724aee785b"
+SRCREV_meta ?= "50530c858c90f124629dadce78f696b590747ea5"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "e617101e562654c7d59ed5cfcd30f610f1f64411"
+SRCREV_machine:class-devupstream ?= "655054d2c3c184875f95646abd828b5dfc027d5e"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.110"
+LINUX_VERSION ?= "6.6.111"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


