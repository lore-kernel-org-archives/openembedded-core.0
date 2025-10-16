Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1093ECCD199
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 03:14:45 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.4732.1760584480425206387
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 20:14:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aG46bjK7;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-88ec598fa11so42818585a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 20:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760584479; x=1761189279; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yOHiT0bljMpVCWJLuXAC3OY1TpqPVkhc0408YdbjOkE=;
        b=aG46bjK78xo5JxOOiZ3VPolfiQLjMIbR7my6ma10CuqvYqQnt6kCUPWvfnuPghXjVr
         SPSSTRN3KkIN+BlJRhVFh2w0nC40a6vITsCBqDSNtqKnPwgJwmiXrFULgtDnGYPigpJO
         pchpW4HH1DpRdqCnq9A/zQjV0x1KgMvJ4t+cxbmcJc8LVqgbMqsKQAoFngCHrqb46Jo7
         CyPbrC8rGxWnnaamdqw+in8p+aJAx8/uOPvpA2Qbng6i/5V8RbwZrUT+n3x4okM/6J2O
         Gp2hNkxHCyoN9csR9kRnHucZpxkFdsoTziSimxET5+43WvZNB7f9kkDSEGgdqFEH2x0Y
         dUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760584479; x=1761189279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yOHiT0bljMpVCWJLuXAC3OY1TpqPVkhc0408YdbjOkE=;
        b=QLRIPV2d/8doxQkYLlH9vGkEll2oR3ixvlBtX2XfWlD58Zq3Ts0YCdI4Oa15ICbNB1
         4dYhgrh7aGDnUzmJbRLNbnWteBLXCvxMIUhEKkAHJgVQ0zIUp3VgTovl150V+G1GFQpX
         sOngQ/8XjqkULVnbAlNTQdwO4buB1tLynM1pH9hVihm/8ZEAIxaZ5bsnBQZEjn5yG8xt
         rua4U7M/P0b/ZSOdXHI8oykHUA6CUG9KFIP4CowYs1cG8KF39zDQcI4NMOfs9ZZw7MFB
         3VOTg/HPQoEunq0Moa0LetIGJWx6sEjuSPFJiMFZamyzCuZqUpxCFZ460i2MRQBS93vW
         nPBw==
X-Gm-Message-State: AOJu0YyPU9zJ6K3m3h3PH6/Ls2S+mhB6yFbNFHIBtxJokzneAq/yg48N
	77281ZL0IMAp/oRmF8lMbowlTLaFnZOXpc+HYLe5FPWCtCStcW4BPnnfWfRJT4ljCAU=
X-Gm-Gg: ASbGncurzk9lHFi8wrNW1DYuJ9dBp5tw0tbYMou6zNm19bw7SpatRemCdqaA+7m8jhJ
	W+whhEqajWuSoX1BIw960OIlEDorPMMVarIbkirE4JSkJgxJam1MEKbQUkS23t1+TBu+wLyLnoF
	GSkkemTit6svg5Pk9A7ryz6TD0aEz9+o4Iw5fp1sGxdPrS+EWnL9OcRLViYxP68wjcv8I3WSD9y
	fG0xaIEKO/zrsf/IyNCJpiU5Fhoj1otMlj+hurO7wnNJ7YmfQBQX0R1F3JMQY5WtqGhew3WQ9Yx
	FUHItSc61ZAexLhMXN/aZX9PLHE2K6AA/6iQoipYdJQA2IdIy3mRG+YrOXYGkF9z7XTZey6ZJ6M
	kmy1tY6/XojCXvzjBHHItxPFk4dx+M+e+CvYg9jjoTRZlND9VJFpPx1CvYPtF46JaMey6THPEZX
	ko6jbrllVyfcf1wcyX8rWXYLw3D2x0bydYTOc1CuYxGSNOfvFtF9qVp5/gTkG5J1ecGk6c3byHB
	w/O
X-Google-Smtp-Source: AGHT+IHcp6Qi+3Zxnrj9NthWH7jWglzVSxrnLfd5cnwYKpeElTERG5zAr+qroYc/wl15dWtHC43WbA==
X-Received: by 2002:a05:620a:40c4:b0:88e:1123:ec9 with SMTP id af79cd13be357-88f10d7c58amr361976685a.36.1760584478949;
        Wed, 15 Oct 2025 20:14:38 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-88f37f45149sm109327085a.32.2025.10.15.20.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 20:14:37 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com
Subject: [OE-core][scarthgap 12/12] linux-yocto/6.6: update to v6.6.111
Date: Wed, 15 Oct 2025 23:14:21 -0400
Message-Id: <20251016031421.3207596-12-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20251016031421.3207596-1-bruce.ashfield@gmail.com>
References: <20251016031421.3207596-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 03:14:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224938

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
2.39.2


