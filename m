Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49779E748EE
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 16:00:35 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.62419.1696176027657526559
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 09:00:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xoausM9k;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-691c05bc5aaso13948118b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 09:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696176027; x=1696780827; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2p76MlXjIFvZ5BEXRqG+8Avpr0uq07dZcukZeezj2tU=;
        b=xoausM9kXwhHTtj2XBXpDYKi4pxp3+jcs9CP+0R9/j9+3DGEV/+JVnWzYl8RkFEQ14
         udDKUrG8Dpe7jEFF80QK7ebS6mauCLKzdsZAE2gbwAaHQ8gIxt2Pb9DfDxNzoPtf7WEw
         buwxsJmBkv32LDYseYtEhWNvQ2zIqZ2BWtmflzboYOOaVeGkUWONWGjvjQAafXABGIw2
         mytpI0cNWVJxc7CQ6fIo3l989kNePoBReCBy1ruBgL5myfNCCYZMasXoKOBfYnqKgiYn
         WsDz0wQIi96ptNItFg3bfRJ2GjJxeKc7pNSlVf2Ojnvrl+yxLTjcQ8d6IForS5SVqf/D
         S2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696176027; x=1696780827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2p76MlXjIFvZ5BEXRqG+8Avpr0uq07dZcukZeezj2tU=;
        b=EJEP/gPlTk8uWNVwWxk18GdHhsD/1BTTujTYk+AiFY1LrUDX9kgdyIFzTlerLDob08
         VPDqR71JNRdYA2B779y7meWJ3GskbcXz+u9zgix9EbGiYmrkOvh61W3AZSDj63coI8OV
         8VArd+FOr0D9h5kgTP+BUorsCGIUkEKNm+xfyDYbQyo27U1/YumuHPACZevIwfljCeNV
         s8poio9Svu2z7GyBfys4/B65j9o92OultZIi4MlVGEyhH4wYvNmitDUpKCpOgq1woyTZ
         C+Utt0tZaQltJg5u5J0fvQKCtN7BY8pF1gN+mC+V+aVo5UFaOfpH6ODSEdOvqZfLCNK8
         RDsA==
X-Gm-Message-State: AOJu0Yw28HN58+poo0DDZOhZTHA18fJIpDw6GBdOnwLXXXUDSg0rKO0m
	5Zc869cX0HiRJTrojsFjSsOQBiYOKnvauzOWidNGeA==
X-Google-Smtp-Source: AGHT+IEql4vJG7neAHuuOsbrbbb16ITMq2h5VkQ/H6phdV/mmo9rCn3/kOQhftwbkBkAM2HIJ4og2w==
X-Received: by 2002:a05:6a20:32aa:b0:14c:def1:e728 with SMTP id g42-20020a056a2032aa00b0014cdef1e728mr7363155pzd.60.1696176025121;
        Sun, 01 Oct 2023 09:00:25 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jk4-20020a170903330400b001c5900c9e8fsm15416967plb.81.2023.10.01.09.00.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 09:00:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 04/23] linux-yocto/5.15: update to v5.15.125
Date: Sun,  1 Oct 2023 05:59:51 -1000
Message-Id: <50889a1a67a33d1d42f4095d323e4c73ca22c2c8.1696175813.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696175813.git.steve@sakoman.com>
References: <cover.1696175813.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 16:00:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188493

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    c275eaaaa342 Linux 5.15.125
    754e0c7c4a30 x86: fix backwards merge of GDS/SRSO bit
    b14a3924c267 xen/netback: Fix buffer overrun triggered by unusual packet
    153f9a7b02d4 x86/srso: Tie SBPB bit setting to microcode patch detection
    df4c3823cba5 x86/srso: Fix return thunks in generated code
    0071b17eb66b x86/srso: Add IBPB on VMEXIT
    5398faac76a6 x86/srso: Add IBPB
    c24aaa7dde5f x86/srso: Add SRSO_NO support
    4e9115e194a8 x86/srso: Add IBPB_BRTYPE support
    b35087763a44 x86/srso: Add a Speculative RAS Overflow mitigation
    c3b4c644525e x86/cpu, kvm: Add support for CPUID_80000021_EAX
    236dd7133394 x86/bugs: Increase the x86 bugs vector size to two u32s
    0242a8bdef56 Documentation/x86: Fix backwards on/off logic about YMM support
    27a72e350869 x86/mm: Initialize text poking earlier
    d0317b9502ea mm: Move mm_cachep initialization to mm_init()
    8e4c2530879d x86/mm: Use mm_alloc() in poking_init()
    13ec5cb4c113 x86/mm: fix poking_init() for Xen PV guests
    3e90080d5665 x86/xen: Fix secondary processors' FPU initialization
    348741a9e4d3 KVM: Add GDS_NO support to KVM
    59d78655f808 x86/speculation: Add Kconfig option for GDS
    0cc5643b63ae x86/speculation: Add force option to GDS mitigation
    348a89e20184 x86/speculation: Add Gather Data Sampling mitigation
    a094d3b30967 x86/fpu: Move FPU initialization into arch_cpu_finalize_init()
    59f2739111ca x86/fpu: Mark init functions __init
    bb9c20d903f6 x86/fpu: Remove cpuinfo argument from init functions
    de8b7ce4c533 x86/init: Initialize signal frame size late
    041d929233bb init, x86: Move mem_encrypt_init() into arch_cpu_finalize_init()
    8ae795ed6115 init: Invoke arch_cpu_finalize_init() earlier
    7e270cebaffd init: Remove check_bugs() leftovers
    285384ac24c3 um/cpu: Switch to arch_cpu_finalize_init()
    6ea421786426 sparc/cpu: Switch to arch_cpu_finalize_init()
    21a1fc8d13d8 sh/cpu: Switch to arch_cpu_finalize_init()
    dfeb371a2707 mips/cpu: Switch to arch_cpu_finalize_init()
    4baf46a3ba00 m68k/cpu: Switch to arch_cpu_finalize_init()
    8c8165cd25cf ia64/cpu: Switch to arch_cpu_finalize_init()
    de8c592cc5a1 ARM: cpu: Switch to arch_cpu_finalize_init()
    75da6209d3ba x86/cpu: Switch to arch_cpu_finalize_init()
    0774fc2177c3 init: Provide arch_cpu_finalize_init()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index be5dd5efec..f09dbe0b5f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "0ac91942af8fec31671ffe62e9518aaf15f110b3"
-SRCREV_meta ?= "f484a7f175b4f3c4f7d2b553cde232bd41f757d8"
+SRCREV_machine ?= "897961fcc3a4126a9d86096b4c3f0de174eb51e7"
+SRCREV_meta ?= "9d45e4358eec5d4585e6e26d7f2f6f03ad909ea7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "5.15.124"
+LINUX_VERSION ?= "5.15.125"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index b8f3d71a72..2f0e232fe6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.124"
+LINUX_VERSION ?= "5.15.125"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "cdb289c798fe1fc9f259a08c32e2dd9516ccb7a4"
-SRCREV_meta ?= "f484a7f175b4f3c4f7d2b553cde232bd41f757d8"
+SRCREV_machine ?= "673a7d93e8c401525183fd793cd1fbc5d688761f"
+SRCREV_meta ?= "9d45e4358eec5d4585e6e26d7f2f6f03ad909ea7"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index a15284fb4b..f3c6733656 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "676a22c65ec0f8bb5dc7e13d130f6e3764959d75"
-SRCREV_machine:qemuarm64 ?= "f0e7afd5948f71be062cd9194b56cd03de94b7cb"
-SRCREV_machine:qemumips ?= "0f1ceb9008f182cd7f21420bbec6f21a67da8397"
-SRCREV_machine:qemuppc ?= "4ec9fc13283ce01627ef8c32617a1eb71e127c62"
-SRCREV_machine:qemuriscv64 ?= "1c09be01f4b87f60ea64136459167d73502a118f"
-SRCREV_machine:qemuriscv32 ?= "1c09be01f4b87f60ea64136459167d73502a118f"
-SRCREV_machine:qemux86 ?= "1c09be01f4b87f60ea64136459167d73502a118f"
-SRCREV_machine:qemux86-64 ?= "1c09be01f4b87f60ea64136459167d73502a118f"
-SRCREV_machine:qemumips64 ?= "fad09cc6acf2175aa6b5979ef48cd5f05afc3da0"
-SRCREV_machine ?= "1c09be01f4b87f60ea64136459167d73502a118f"
-SRCREV_meta ?= "f484a7f175b4f3c4f7d2b553cde232bd41f757d8"
+SRCREV_machine:qemuarm ?= "f1655130f428a06fd10df1401cf4a97c2c9e98fe"
+SRCREV_machine:qemuarm64 ?= "3562a213e44daf360d873c1c1773d64c7b1bdb90"
+SRCREV_machine:qemumips ?= "bff8d6b2771b531f996b41ab89d742b21d6d1a5f"
+SRCREV_machine:qemuppc ?= "9ccbf6add86b58f8446ba2b439ccdaaa1646c20b"
+SRCREV_machine:qemuriscv64 ?= "50ad222fc4256538597cc943ddb328692041424d"
+SRCREV_machine:qemuriscv32 ?= "50ad222fc4256538597cc943ddb328692041424d"
+SRCREV_machine:qemux86 ?= "50ad222fc4256538597cc943ddb328692041424d"
+SRCREV_machine:qemux86-64 ?= "50ad222fc4256538597cc943ddb328692041424d"
+SRCREV_machine:qemumips64 ?= "05401de4dd847384e7592e2d729e2d8ff4a1e1bd"
+SRCREV_machine ?= "50ad222fc4256538597cc943ddb328692041424d"
+SRCREV_meta ?= "9d45e4358eec5d4585e6e26d7f2f6f03ad909ea7"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "38d4ca22a5288c4bae7e6d62a1728b0718d51866"
+SRCREV_machine:class-devupstream ?= "c275eaaaa34260e6c907bc5e7ee07c096bc45064"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.124"
+LINUX_VERSION ?= "5.15.125"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


