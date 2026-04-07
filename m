Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B23EDB7D8
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 07:13:57 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75677.1775546025229079441
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 00:13:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=lOF7tYu1;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48896199cbaso40723245e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 00:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775546023; x=1776150823; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+yR9Dh3QlptEbmJEZasIQsqijuqDXfBH6Jm1XCMvk/I=;
        b=lOF7tYu1i37UpX2w+XJiOpdtP1e9IzvzRkIOsgmSqyXivKkRD8ry3x45HTdIdW6EsD
         7AHHAUh9b/ZCuyJ1M7klRBrjf1MIcC9T//kBtoLoGiC6Tr+7Q8wYCbRlLYQGGy68zn5B
         pMwYf5TGzPOgK9Xm9FT/HrLrxs8SaOt7FWvoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775546023; x=1776150823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+yR9Dh3QlptEbmJEZasIQsqijuqDXfBH6Jm1XCMvk/I=;
        b=TJ16Et17hDHuIYsMsKwr0Cwb7rnI6IHnvWj8Lu847Ryt97LFETqkUrcUl9ccZYqRPd
         Yp+6WSahyEM7ssVy+a0g6mns/nUFRRp2g33RJHwwW4JQNceeIqKK16f7Qc4Z5QC0Prif
         EEPWMaKIL9yksF5+3g18z2Q2lqv3XcFTDxoE2ew2rOAlsRihSnfl1NuT7tANJRYjqco7
         Fa2EGonNg21uYoDHajE8c+jiI2/1nEi9Tl4dWKINfjq0DU8OezZSVuVakOqpDzlGgiqT
         58djOmLb2LDBMRrWTujP2QJhNeB+nrYnPB1eV52sGBydnoV2K1AAGYsYfdVH6OuTiWvY
         6hZg==
X-Gm-Message-State: AOJu0YyLPHYTD1my+h9pL6j99ana6ISx74/x2DvrRgsnQTPP/IRHHy14
	PvNY/S2OKI7ARNijm8tLTDfkqKoZ8SXCtiLc1qhh4WdtZc47Wd8QOTPgeYPfwTIH+5s2aPh5OaL
	poIlZPwA=
X-Gm-Gg: AeBDiesjcbqOzCWdQfCEGfF4HDIdcd+WA1kerd71mYlrHxN9mk+wMByxx3EO7F6pwpT
	ERDtwsah4WpiEyx5VE2x3vETT5Hj0cba0bAGnLG42uwDXDNgdyLZgicMSkDYxEbs1X+8J+vS9WH
	esTIw6Kb7C8ohhcpey/EvycJu+DCrKZMyclNESTYpn8Mpb4StSlu+nvloNdrhztWmM+T484z7K4
	Rf3YVqqNwANAwj0oeY9eN3lyyalaP8r60iGTNthLIUFkoDn+sDthc6JG1TOxQoagn3COrEkLdVH
	AGk3gKTnjF4n6aylL8oBX/1wzvUsm/npuU1XiNczYdVacRPN1L4GpsuowibKPYiV5L7OYtkSvAq
	uSt3Qo30r4teKZKIY8If1Tj+k6xbuTK11JxHfa5RlkQb7MeCjbJQKOFIe+OcK5LlZ+VDp0P95PV
	sbBU3htowpn5YVFwlacSrzwaVnSpt9HEwFv1wleCuBJN9xrt8ZG3xlqKBNQs4UrDdOtUxelWCaH
	0pn+YuCCmN8MPNSHGqVlBMRi9Q=
X-Received: by 2002:a05:600c:8592:b0:485:5981:1423 with SMTP id 5b1f17b1804b1-488996b04e7mr145537665e9.3.1775546023222;
        Tue, 07 Apr 2026 00:13:43 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899d0fc00sm156364925e9.4.2026.04.07.00.13.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 00:13:42 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v2 02/18] linux-yocto/5.15: update to v5.15.201
Date: Tue,  7 Apr 2026 09:13:10 +0200
Message-ID: <65c5b6d33aa81de3e85452a1c1e4395e49addcca.1775545489.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775545489.git.yoann.congal@smile.fr>
References: <cover.1775545489.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 07:13:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234706

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    3330a8d33e08 Linux 5.15.201
    cfd5eadd051a USB: serial: option: add Telit FN920C04 RNDIS compositions
    438a405fbad6 f2fs: fix out-of-bounds access in sysfs attribute read/write
    2f67ff1e15a8 f2fs: fix to avoid UAF in f2fs_write_end_io()
    6167af934f95 fbdev: smscufx: properly copy ioctl memory to kernelspace
    52916878db2b fbdev: rivafb: fix divide error in nv3_arb()
    fa9fb38f5fe9 PCI: endpoint: Avoid creating sub-groups asynchronously
    7036aff5a5e8 PCI: endpoint: Remove unused field in struct pci_epf_group
    8055827352b7 PCI: endpoint: Automatically create a function specific attributes group
    b74408de1f22 scsi: qla2xxx: Free sp in error path to fix system crash
    794563147038 scsi: qla2xxx: Reduce fabric scan duplicate code
    23507a811081 scsi: qla2xxx: Remove dead code (GNN ID)
    da9939b1ed8b scsi: qla2xxx: Use named initializers for port_[d]state_str
    f2bbb4db0e4a scsi: qla2xxx: Fix bsg_done() causing double free
    c71dfb7833db bus: fsl-mc: fix use-after-free in driver_override_show()
    38770e103e4e bus: fsl-mc: Replace snprintf and sprintf with sysfs_emit in sysfs show functions
    6dd2645cf080 smb: server: fix leak of active_num_conn in ksmbd_tcp_new_connection()
    dc5f09466448 crypto: virtio - Remove duplicated virtqueue_kick in virtio_crypto_skcipher_crypt_req
    338d40bab283 mptcp: fix race in mptcp_pm_nl_flush_addrs_doit()
    ec7b6a042414 selftests: mptcp: pm: ensure unknown flags are ignored
    51df5513cca6 net: dsa: free routing table on probe failure
    4a6e4c56721a smb: client: set correct id, uid and cruid for multiuser automounts
    b0bb67385480 btrfs: fix racy bitfield write in btrfs_clear_space_info_full()
    cfdb22762f90 Revert "wireguard: device: enable threaded NAPI"
    20c83788eafe gpiolib: acpi: Fix gpio count with string references
    612ffe1f4f04 ASoC: fsl_xcvr: fix missing lock in fsl_xcvr_mode_put()
    ff96318c22fa platform/x86: panasonic-laptop: Fix sysfs group leak in error path
    af673209d43b platform/x86: classmate-laptop: Add missing NULL pointer checks
    72f97ee4950d drm/tegra: hdmi: sor: Fix error: variable ‘j’ set but not used
    f2521ab1f63a romfs: check sb_set_blocksize() return value
    f14e997a372a gpio: sprd: Change sprd_gpio lock to raw_spin_lock
    1fe2603fb171 ALSA: hda/realtek: Fix headset mic for TongFang X6AR55xU
    86588916e188 gpio: omap: do not register driver in probe()
    7e0b2cdbe660 scsi: qla2xxx: Query FW again before proceeding with login
    891f9969a29e scsi: qla2xxx: Delay module unload while fabric scan in progress
    a46f81c1e627 scsi: qla2xxx: Validate sp before freeing associated memory
    ba18e5f22f26 nilfs2: Fix potential block overflow that cause system hang
    8ee8ccfd60bf crypto: virtio - Add spinlock protection with virtqueue notification
    31aff96a41ae crypto: omap - Allocate OMAP_CRYPTO_FORCE_COPY scatterlists correctly
    a60b17cedb44 crypto: octeontx - Fix length check to avoid truncation in ucode_load_store

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/linux-yocto-rt_5.15.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.15.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 24 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 526f3c64b7d..ea763ce9aa1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "671f06e26c741b7d55d8afcc30e64f1480cec166"
+SRCREV_machine ?= "46e4e1200a4fa889438a2cc62151bb7f1057421a"
 SRCREV_meta ?= "b75d71b7f2455467f2260d514040ccb44d4bdda5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.200"
+LINUX_VERSION ?= "5.15.201"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 1eeda2e22ca..56853f481fa 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.200"
+LINUX_VERSION ?= "5.15.201"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,7 +14,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "0d4112b87ce7dd038dc712ef616c0b6dd333c786"
+SRCREV_machine ?= "5ae014d6b48449ae38584cc174ef362f6582a8fc"
 SRCREV_meta ?= "b75d71b7f2455467f2260d514040ccb44d4bdda5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 5f8bfba396e..176d17e5736 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,16 +14,16 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "44b7b6bdfaab20ab51f175aeb0df8c27791cc40d"
-SRCREV_machine:qemuarm64 ?= "d67ad97cb5d6a51184bd61853e3af7e044c7f1d4"
-SRCREV_machine:qemumips ?= "94fe5264de5b6ba6a5fab53b3f2283e36033e373"
-SRCREV_machine:qemuppc ?= "a065262f1076ca606ea8229f84b23c10be2680e7"
-SRCREV_machine:qemuriscv64 ?= "af4baa923d4f04a259e3199e9e63d9415bdf3e3a"
-SRCREV_machine:qemuriscv32 ?= "af4baa923d4f04a259e3199e9e63d9415bdf3e3a"
-SRCREV_machine:qemux86 ?= "af4baa923d4f04a259e3199e9e63d9415bdf3e3a"
-SRCREV_machine:qemux86-64 ?= "af4baa923d4f04a259e3199e9e63d9415bdf3e3a"
-SRCREV_machine:qemumips64 ?= "00831bab13b4320ee27e4ddc72b55542bfe75ec8"
-SRCREV_machine ?= "af4baa923d4f04a259e3199e9e63d9415bdf3e3a"
+SRCREV_machine:qemuarm ?= "9750e854c9e92d55a2cb042c5ce72e712b24217d"
+SRCREV_machine:qemuarm64 ?= "8634ca1dd87be9b55bd383dc8636b73b82a28051"
+SRCREV_machine:qemumips ?= "54eca1788efd507120c9dc08681a6a31038513a1"
+SRCREV_machine:qemuppc ?= "3a3a4ecdcebb4d3deaa8b5c4ec3e167d5f31305c"
+SRCREV_machine:qemuriscv64 ?= "b5ccd2e275c9b68e5dc564b6febeaae8dda42bc5"
+SRCREV_machine:qemuriscv32 ?= "b5ccd2e275c9b68e5dc564b6febeaae8dda42bc5"
+SRCREV_machine:qemux86 ?= "b5ccd2e275c9b68e5dc564b6febeaae8dda42bc5"
+SRCREV_machine:qemux86-64 ?= "b5ccd2e275c9b68e5dc564b6febeaae8dda42bc5"
+SRCREV_machine:qemumips64 ?= "e643e82fef4b4352b8f6ddf802181526edc806ca"
+SRCREV_machine ?= "b5ccd2e275c9b68e5dc564b6febeaae8dda42bc5"
 SRCREV_meta ?= "b75d71b7f2455467f2260d514040ccb44d4bdda5"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
@@ -31,7 +31,7 @@ SRCREV_meta ?= "b75d71b7f2455467f2260d514040ccb44d4bdda5"
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "e45d5d41c1343aad8c7587a5b15d58e99aff4c8a"
+SRCREV_machine:class-devupstream ?= "3330a8d33e086f76608bb4e80a3dc569d04a8814"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.200"
+LINUX_VERSION ?= "5.15.201"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"

