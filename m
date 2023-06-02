Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D4CC7EE2A
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 02:22:29 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.3365.1685672547444390366
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 19:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=fqSAWsG6;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.172, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-39810ce3e13so1315665b6e.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 19:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685672546; x=1688264546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VqY54aDQvmJXBO3JPGhwI3GKTaSoh160a7CsRuQLWXM=;
        b=fqSAWsG6DzyrHu6JkNQhxSFk9HU/KBwBsfSNoYdTFw8DFUu6t4Zz2fWA7KnQs1FftT
         qgtnB2YkfiqIwlxMV3ZeRhZXmOOekP3KxA7p45hKtXaxmEEskD0xsP2EqB3Dg0IapZ7j
         8StAhzlsEHyVfUbtyNUlIWvBsTHlBgGB2gDhDa64q1k78wAXP1c5sbTER1FZwY0FMpkK
         HiOhy5e6Hq/1gibVL8rgMyOksMnR641XC46ateAwfsxHSLB/EO9blmqpLIASJ/b7QcO7
         akM0ZBj5pb37ZM6gBom5xybGGflKJaVDXM48NtQDpD8217CE9xvHP++lBk7sBhJr/E6b
         rSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685672546; x=1688264546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VqY54aDQvmJXBO3JPGhwI3GKTaSoh160a7CsRuQLWXM=;
        b=VU7xF90ZzY5G4mqISgo5UFuU012s1Z1aWy6f3sofKFbuuoJMrftZdpmG2mZuBDI0B0
         3XHw1mxUWJNMyV/YGcZc7PfdZPXf3NSJR2trsUgqy8zJpcx6Mrd9UT2F1qPAZgo9rMs1
         DCNhsB/4NWKHkDaI16oHvbMeCiu3GXvyZ+vipK7g8pVPu3hqc0nn4YE0fvs/YdBA2QZs
         HAF3WOdQns4EuMo1kqP1U4JuKc7y1zgiiby/g+SCkCfKPeM9XqzJNGnT+C3q4lQq2JXD
         uNrZsROvf2vYxojKeS/vb0zk2n9/ei5MvB2c0Q7vSWSSCsWDpygmb0xYlfJ/LJGE5WrJ
         mvbw==
X-Gm-Message-State: AC+VfDw4HqL0w1CU3YkaXhiUzdtfUE4/apPW5IeOGIwM5THloa6peIq+
	jwS54urEVXkSKUEz3bzBT7sYPtq+v54d5bM+plE=
X-Google-Smtp-Source: ACHHUZ6sQicEi0KA7+8HoFwAPhM3nVIcoZopxQVYY936bRa+6Z2/ih79+OONvDg008A5ooDZfP7XBw==
X-Received: by 2002:a54:4514:0:b0:398:139f:fed7 with SMTP id l20-20020a544514000000b00398139ffed7mr1148676oil.8.1685672546362;
        Thu, 01 Jun 2023 19:22:26 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id z16-20020aa785d0000000b0064fc715b380sm5850234pfn.176.2023.06.01.19.22.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 19:22:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 02/13] linux-yocto/5.15: update to v5.15.110
Date: Thu,  1 Jun 2023 16:22:01 -1000
Message-Id: <8fb28c7f71888d65c170c9f5400438a077860c6f.1685672395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685672395.git.steve@sakoman.com>
References: <cover.1685672395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 02:22:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182125

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    8a7f2a5c5aa1 Linux 5.15.110
    cab0f985037b riscv: No need to relocate the dtb as it lies in the fixmap region
    1f09c9bab723 riscv: Do not set initial_boot_params to the linear address of the dtb
    bbf94b042155 riscv: Move early dtb mapping into the fixmap region
    ccb29694c2da selftests: mptcp: join: fix "invalid address, ADD_ADDR timeout"
    0994aa001fde driver core: Don't require dynamic_debug for initcall_debug probe timing
    3dcebcaa258c USB: serial: option: add UNISOC vendor and TOZED LT70C product
    f1e6a14d5ae8 bluetooth: Perform careful capability checks in hci_sock_ioctl()
    39c472809aab drm/fb-helper: set x/yres_virtual in drm_fb_helper_check_var
    936a23293bbb wifi: brcmfmac: slab-out-of-bounds read in brcmf_get_assoc_ies()
    2bd716c6e4d1 KVM: arm64: Fix buffer overflow in kvm_arm_set_fw_reg()
    00f74003edf5 KVM: arm64: Retry fault if vma_lookup() results become invalid
    c1da649699e1 selftests/kselftest/runner/run_one(): allow running non-executable files
    c88435054153 PCI/ASPM: Remove pcie_aspm_pm_state_change()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.15.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 24 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index c3c9ed8967..731a871e11 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "63a865cbbc8ab351f44582a4fcf2999c7681cfd8"
+SRCREV_machine ?= "91c85a978457d009bb57ec0a0867afe4ff7c8278"
 SRCREV_meta ?= "8ce5ee0184fb213962a82ca5ee8c74851452e260"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "5.15.109"
+LINUX_VERSION ?= "5.15.110"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index ae2604ab70..6ded419a02 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.109"
+LINUX_VERSION ?= "5.15.110"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,7 +14,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "7d734295a38a5fc03fb29fb90bb64e38708e2308"
+SRCREV_machine ?= "37cc630d5574860de0b48e67fca03d8cb7d2a260"
 SRCREV_meta ?= "8ce5ee0184fb213962a82ca5ee8c74851452e260"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index d30b12d557..e702fbcf71 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,16 +13,16 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "8ac50c616d30bffb2540f2dd7bfe8ea66d737bfe"
-SRCREV_machine:qemuarm64 ?= "470798ad34773e9e60e08ba80a8b7e6c4cf65c94"
-SRCREV_machine:qemumips ?= "9dcb3aaf2e30172cfb33b13d50bae621cd449f5b"
-SRCREV_machine:qemuppc ?= "faaa6b1dd4c1bf3550efa07e788f6849729e9d7b"
-SRCREV_machine:qemuriscv64 ?= "b8a4501ad3a651d576df481df20bf20fd3e969df"
-SRCREV_machine:qemuriscv32 ?= "b8a4501ad3a651d576df481df20bf20fd3e969df"
-SRCREV_machine:qemux86 ?= "b8a4501ad3a651d576df481df20bf20fd3e969df"
-SRCREV_machine:qemux86-64 ?= "b8a4501ad3a651d576df481df20bf20fd3e969df"
-SRCREV_machine:qemumips64 ?= "a41a7b13730b656588ac38cf0f1af6f9f255e112"
-SRCREV_machine ?= "b8a4501ad3a651d576df481df20bf20fd3e969df"
+SRCREV_machine:qemuarm ?= "c9c4163f1d7a05a8a9e74f519ec7acc54259f53b"
+SRCREV_machine:qemuarm64 ?= "1cbfaca7888ffe8f6ce58987080a86b48161ce44"
+SRCREV_machine:qemumips ?= "9d83787163c68c2390136915fcfbf3e781d56874"
+SRCREV_machine:qemuppc ?= "a6d06d797ba2ae6c391898a42fced6c3eb71aad0"
+SRCREV_machine:qemuriscv64 ?= "4399f7dbd01bd141ad6033438eb818820322ef13"
+SRCREV_machine:qemuriscv32 ?= "4399f7dbd01bd141ad6033438eb818820322ef13"
+SRCREV_machine:qemux86 ?= "4399f7dbd01bd141ad6033438eb818820322ef13"
+SRCREV_machine:qemux86-64 ?= "4399f7dbd01bd141ad6033438eb818820322ef13"
+SRCREV_machine:qemumips64 ?= "577bbb0ffdafbe77c802b1ff6cd09beec4cf0302"
+SRCREV_machine ?= "4399f7dbd01bd141ad6033438eb818820322ef13"
 SRCREV_meta ?= "8ce5ee0184fb213962a82ca5ee8c74851452e260"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
@@ -30,7 +30,7 @@ SRCREV_meta ?= "8ce5ee0184fb213962a82ca5ee8c74851452e260"
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "f48aeeaaa64c628519273f6007a745cf55b68d95"
+SRCREV_machine:class-devupstream ?= "8a7f2a5c5aa1648edb4f2029c6ec33870afb7a95"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.109"
+LINUX_VERSION ?= "5.15.110"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


