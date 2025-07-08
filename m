Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E000C83F09
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 14:36:44 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.20461.1751985400004099732
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 07:36:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J5yZi5HT;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7d09a17d2f7so399064485a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 07:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751985399; x=1752590199; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7iUDSFBrhavFYOkQrttLpWeFZ2PPwp1JHj3PZFOttA4=;
        b=J5yZi5HTX1OTQ7zUSsjZuvhtOS6mryU/SUUhqe/gJ3vX2zacfYcETRe/h+wDqr05vw
         clfD/nAUE9l1UKrSozCpvJDY/JR8+JgJ4SQRdBLiOg6kas2Qph1ayttXz18NBW723zvi
         zCKRHjSp/Ka4GKQfi74ZDRLdtg28lufnvtX1GkaqWd8dDY+b0Qw/1F0WmaOB+zOvIggl
         LmMcDDfTg2HSDhZyZ8B50BW+MBshYDU8/kfxK/g0rqe5heNsuR2oQYMQ5/TYKxh0gA0Q
         pmj8QY24PQoJdX8+On2OfoW5Z+YO0MUc2WW6OoeyM7rweJ5ZQjrwZUf8jx+4OMha3Svr
         LaLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751985399; x=1752590199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7iUDSFBrhavFYOkQrttLpWeFZ2PPwp1JHj3PZFOttA4=;
        b=lJmmLB9U2SyBDkwnmQ4C/bG1A+/sUFu/OZT2eOJcbDy9hLivBVa0Jvl1EuKfnlUJ63
         xkdtA59O/gIPYkm5vgapw20gZSSoRCLBsh62DIWsDOCbEuYO8pclwq8AH8zZLW8/JDk3
         ebnsZzbd9tEph0h3+cjmUAGHmCJpBnOajPdf90oTKOrL3q+cWwDduMO6X70qSQ7k9Mt8
         JrZ0hEsG07J58HVdjWzzIBSHW9IvJVVv/xvsWNzA7P/mq3rcAAQPFtAasUWFXiY1euRd
         Oas26gqqdw6KHFB9bP/LP+5CrFs1MKLe8uhtiwrGubmmn7GFCoM+IxI6HhWILXclFMno
         zLpw==
X-Gm-Message-State: AOJu0YwUhAc1u1YZVBry9VEPyHLko2lOVjnzwsYQ9seivjrzer3BueQK
	zeBoEV5lcz1EOBGqPcdLaYZBSWD1XRTh4vG2vXPIkQ+0HtEc5w8yBqN98+oJyaYH
X-Gm-Gg: ASbGncuP5Jzuh+H8FIKXmZ9nWgd8L8xxD6KMSEFoIAkMAjQhWNYwNNe/hr5WhYaLXYB
	zfjRMJmPnXbpCEWtByEexZh/YSB44UeRhWmkRGTyEmysNY26cXWiauLzQ9NUlmWvSUVPWZLDk+u
	QiaCff0YUBG8pjsgNjeBfd/wy8thvlA1VkawTfcJnvuWBeIRBQnqR3VbcSZgUGxnKFgy6H8pagg
	XeiwcN2YbReeEnGsoV62xggEzPEpYQgdeKLKfCumC4aWJdrAfxzB+fwhLX9g+QG1vdo/mBlYryi
	dNyy8aimN5+0Cf7l3aK2bWnkQhFaKfgWbZAOUyRG+u5dmcfwn4c8SMtobr3+aIiUfGqnt7VCg3A
	cDExURiLshx06lHHDKO0jk+/we1XSmEMvAa+mMgarU1tnSFUPffbBBbD/yFUfmIg=
X-Google-Smtp-Source: AGHT+IFvdru1F15qqSVZxPMLpHZQeImwsFC+rNMqJSX5O/F5APTHdzeGiAjskqUxUD9jbb7Tw0jCSw==
X-Received: by 2002:a05:622a:5b07:b0:4a5:98c2:34b9 with SMTP id d75a77b69052e-4a99879c338mr283996951cf.34.1751985398669;
        Tue, 08 Jul 2025 07:36:38 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9949e4c8esm80462671cf.4.2025.07.08.07.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 07:36:37 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] linux-yocto/6.12: update to v6.12.32
Date: Tue,  8 Jul 2025 10:36:30 -0400
Message-Id: <7c2eaf660fccc6e15cf4f925152a969e1adf64b1.1751985223.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1751985223.git.bruce.ashfield@gmail.com>
References: <cover.1751985223.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 14:36:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220033

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    ba9210b8c9635 Linux 6.12.32
    334da674b25fd ksmbd: use list_first_entry_or_null for opinfo_get_list()
    4a72fa2f59874 net: ethernet: ti: am65-cpsw: Lower random mac address error print to info
    b4b163b0e7fab platform/x86: thinkpad_acpi: Ignore battery threshold change event notification
    f9adb4a16225d ALSA: hda/realtek - restore auto-mute mode for Dell Chrome platform
    5277bc961cf53 platform/x86: fujitsu-laptop: Support Lifebook S2110 hotkeys
    c7ce21b85a5a4 NFS: Avoid flushing data while holding directory locks in nfs_rename()
    87129b9342dbe char: tpm: tpm-buf: Add sanity check fallback in read helpers
    fe7879e5eb3f4 drm/xe: Save the gt pointer in lrc and drop the tile
    089e980525136 drm/xe/xe2hpg: Add Wa_22021007897
    3b3d3174d1b37 nvme-pci: add NVME_QUIRK_NO_DEEPEST_PS quirk for SOLIDIGM P44 Pro
    8c7ecba772bfb spi: spi-sun4i: fix early activation
    44a4a01e91ae0 phy: phy-rockchip-samsung-hdptx: Fix PHY PLL output 50.25MHz error
    2c09a5cbc0100 phy: starfive: jh7110-usb: Fix USB 2.0 host occasional detection failure
    6f47d74081336 drm/amd/display: check stream id dml21 wrapper to get plane_id
    02ed7c617fa36 drm/amd/display: fix link_set_dpms_off multi-display MST corner case
    afe090366f470 gpio: virtuser: fix potential out-of-bound write
    cef4f57980d0e um: let 'make clean' properly clean underlying SUBARCH as well
    cb5d7e7a6f790 platform/x86: thinkpad_acpi: Support also NEC Lavie X1475JAS
    16ed9db158efd nfs: don't share pNFS DS connections between net namespaces
    f7cbb7035c858 HID: quirks: Add ADATA XPG alpha wireless mouse support
    141054adba2f3 dmaengine: idxd: cdev: Fix uninitialized use of sva in idxd_cdev_open
    510cf09f2dedf coredump: hand a pidfd to the usermode coredump helper
    8fdca436d8f2a coredump: fix error handling for replace_fd()
    a6d87cce788d2 perf/arm-cmn: Add CMN S3 ACPI binding
    d96289fcac263 perf/arm-cmn: Initialise cmn->cpu earlier
    c6d2c0d46121f perf/arm-cmn: Fix REQ2/SNP2 mixup
    2f2190ce4ca97 net_sched: hfsc: Address reentrant enqueue adding class to eltree twice
    b7550a25840a2 arm64: dts: ti: k3-j784s4-j742s2-main-common: Fix length of serdes_ln_ctrl
    2ee377336c731 arm64: dts: ti: k3-j722s-main: Disable "serdes_wiz0" and "serdes_wiz1"
    07f51c8f01f9e arm64: dts: ti: k3-j722s-evm: Enable "serdes_wiz0" and "serdes_wiz1"
    5b9e29e74d4ac arm64: dts: ti: k3-j721e-sk: Add requiried voltage supplies for IMX219
    110875e707022 arm64: dts: ti: k3-j721e-sk: Remove clock-names property from IMX219 overlay
    8a26672180a04 arm64: dts: ti: k3-j721e-sk: Add DT nodes for power regulators
    7d6fd34220a75 arm64: dts: ti: k3-am68-sk: Fix regulator hierarchy
    a15e5630133b3 arm64: dts: ti: k3-am65-main: Add missing taps to sdhci0
    e539e3e611183 arm64: dts: ti: k3-am62x: Rename I2C switch to I2C mux in OV5640 overlay
    0451eef436181 arm64: dts: ti: k3-am62x: Rename I2C switch to I2C mux in IMX219 overlay
    8c32e3ca0e1ad arm64: dts: ti: k3-am62x: Remove clock-names property from IMX219 overlay
    8cc39fa7ddaba arm64: dts: ti: k3-am62p-j722s-common-main: Set eMMC clock parent to default
    b605a449b689b arm64: dts: ti: k3-am62a-main: Set eMMC clock parent to default
    ef60b9ba0df95 arm64: dts: ti: k3-am62-main: Set eMMC clock parent to default
    1e5144b53cec2 arm64: dts: qcom: x1e80100: Fix video thermal zone
    fc54ce9d78dec arm64: dts: qcom: x1e80100-yoga-slim7x: mark l12b and l15b always-on
    660baafc99174 arm64: dts: qcom: x1e80100-qcp: mark l12b and l15b always-on
    fa8939991bc4f arm64: dts: qcom: x1e80100-qcp: Fix vreg_l2j_1p2 voltage
    b2f571e0ba1d9 arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Fix vreg_l2j_1p2 voltage
    a5c10cc63dc68 arm64: dts: qcom: x1e80100-asus-vivobook-s15: Fix vreg_l2j_1p2 voltage
    d3400824e096b arm64: dts: qcom: sm8650: Add missing properties for cryptobam
    2a539505321a5 arm64: dts: qcom: sm8550: Add missing properties for cryptobam
    b4412e855317e arm64: dts: qcom: sm8450: Add missing properties for cryptobam
    87ec68b7e92cc arm64: dts: qcom: sm8350: Fix typo in pil_camera_mem node
    c96762b6837d5 arm64: dts: qcom: sa8775p: Remove cdsp compute-cb@10
    920c14a3772dd arm64: dts: qcom: sa8775p: Remove extra entries from the iommus property
    61ffb2e73d753 arm64: dts: qcom: ipq9574: Add missing properties for cryptobam
    e3dfd77a7fca7 can: kvaser_pciefd: Force IRQ edge in case of nested IRQ

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 5a7bad9017..c57ebb3143 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7cb6d42c40de351ecab0a083aef260f84407de0d"
-SRCREV_meta ?= "60b8562e9989f268ad5d241989f56b71cfa1f648"
+SRCREV_machine ?= "b1b3b3bd2dca380a849e9c593a1186d4f5f6b57d"
+SRCREV_meta ?= "0d1b94bc6669a9573f15b9a83a288cc5a666c9ee"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.31"
+LINUX_VERSION ?= "6.12.32"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 0fad73dddd..bee8c550a3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.31"
+LINUX_VERSION ?= "6.12.32"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "298aefdf4112e7c0a84522e4acf2c722e433c8a0"
-SRCREV_meta ?= "60b8562e9989f268ad5d241989f56b71cfa1f648"
+SRCREV_machine ?= "f724ffca3fef3541b4be9f30f0a3261674c60e13"
+SRCREV_meta ?= "0d1b94bc6669a9573f15b9a83a288cc5a666c9ee"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 262ae35704..5d8e0bc3f1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "37a1fd13ca538e7785daf01434495a614bc55ead"
-SRCREV_machine:qemuarm64 ?= "298aefdf4112e7c0a84522e4acf2c722e433c8a0"
-SRCREV_machine:qemuloongarch64 ?= "298aefdf4112e7c0a84522e4acf2c722e433c8a0"
-SRCREV_machine:qemumips ?= "2bcf58ea5aa19d54c436e63c59ab09b307e9ee8e"
-SRCREV_machine:qemuppc ?= "298aefdf4112e7c0a84522e4acf2c722e433c8a0"
-SRCREV_machine:qemuriscv64 ?= "298aefdf4112e7c0a84522e4acf2c722e433c8a0"
-SRCREV_machine:qemuriscv32 ?= "298aefdf4112e7c0a84522e4acf2c722e433c8a0"
-SRCREV_machine:qemux86 ?= "298aefdf4112e7c0a84522e4acf2c722e433c8a0"
-SRCREV_machine:qemux86-64 ?= "298aefdf4112e7c0a84522e4acf2c722e433c8a0"
-SRCREV_machine:qemumips64 ?= "6470f58a8f04951f202cf85afb4421d2e7ec9995"
-SRCREV_machine ?= "298aefdf4112e7c0a84522e4acf2c722e433c8a0"
-SRCREV_meta ?= "60b8562e9989f268ad5d241989f56b71cfa1f648"
+SRCREV_machine:qemuarm ?= "be3c08ed343992d62710e7c6dec59b52ab1ed9a0"
+SRCREV_machine:qemuarm64 ?= "f724ffca3fef3541b4be9f30f0a3261674c60e13"
+SRCREV_machine:qemuloongarch64 ?= "f724ffca3fef3541b4be9f30f0a3261674c60e13"
+SRCREV_machine:qemumips ?= "caf8b2498f27e7cf8d2ea23a823059c53d622567"
+SRCREV_machine:qemuppc ?= "f724ffca3fef3541b4be9f30f0a3261674c60e13"
+SRCREV_machine:qemuriscv64 ?= "f724ffca3fef3541b4be9f30f0a3261674c60e13"
+SRCREV_machine:qemuriscv32 ?= "f724ffca3fef3541b4be9f30f0a3261674c60e13"
+SRCREV_machine:qemux86 ?= "f724ffca3fef3541b4be9f30f0a3261674c60e13"
+SRCREV_machine:qemux86-64 ?= "f724ffca3fef3541b4be9f30f0a3261674c60e13"
+SRCREV_machine:qemumips64 ?= "f785750b2d7a06b2b19e69cc321665cb5f2d8e51"
+SRCREV_machine ?= "f724ffca3fef3541b4be9f30f0a3261674c60e13"
+SRCREV_meta ?= "0d1b94bc6669a9573f15b9a83a288cc5a666c9ee"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "df3f6d10f353de274cc7c87f52dba5d26f185393"
+SRCREV_machine:class-devupstream ?= "ba9210b8c96355a16b78e1b890dce78f284d6f31"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.31"
+LINUX_VERSION ?= "6.12.32"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


