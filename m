Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71938F364D6
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 23:11:17 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.145065.1775776274654475393
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 16:11:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fAAg2g6o;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-488971db0fdso14167545e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775776273; x=1776381073; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+yR9Dh3QlptEbmJEZasIQsqijuqDXfBH6Jm1XCMvk/I=;
        b=fAAg2g6o2RXzhju8e+GR9R6QIiQP3p4tEswla3Jjv19a+GyN7cVOeI5CvCsQLWPQai
         5pouvj2bTY3pHSK+kauUlqABO01fjusuAepw+/i7DQDFYCrOQGuEeh4trS5hEtRXJHal
         wc0Rltl/R18yxWz9KgZ/IWRucZShRkAyg6P20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775776273; x=1776381073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+yR9Dh3QlptEbmJEZasIQsqijuqDXfBH6Jm1XCMvk/I=;
        b=gjW84xkBstT7g86Xewe1RFlEr+qTm08UEXsPD01Jf5FXSKXXZM0aBtNcOCF/HYQTm1
         VtsDP3XyVdDmpN4dcZjnga/94oUeFqF5LDo1IuFVli/eDovS/rprQzQYposkkmknEVb1
         /iOvEwXktQqAfo4xXYrnBwadbpKlW/5AbyP5lfQz3gtlza+zQ0LSKgh3LinmrjULEgWY
         ezv7JHCkHaL7n+TnVYPOzuI9fA7SghrKoZgC3pa7Tb8YxXKZCR7fzpKRRBPOdoJyZPPf
         LxtvlbckTfXsS0L2omgTWIwF3FFQnH76ZZ9+Qb/ZmRj3o5azN9I/6r9EOSfiMZ5WTr+g
         Fg2Q==
X-Gm-Message-State: AOJu0YyYEy2rKW+73NNkxwj8pbAe43dNk9knuPo+mVqAMoDpa09zcFMa
	qloBiGBqrh+kcw+YljRhJB0Ue+tNVXaSg2XP/qmjx2TfsRkfQEQUW+brfhJZrGgn2a/lqS/K09U
	Q+MTI7XzyCxEB
X-Gm-Gg: AeBDietizBQMo0vVk12ONhnGsKHejMj8cGVErNnr6tnqcifSEiAAM1kShxoCrMkJ7e2
	9UE6p9AFa6rl1gskq5vh+lco1NSNRgMdQc3J+W/Fuh2CEt2p8qLqltTBQm+Y5H1vu8cgOkiMoBy
	Mg1kiIO6C/AcfKwYJu4g24qZ2j2FH05QR6+ZthGcS0fI6oGBJtQEcNlj+LL7LM0cBf/+dJEGjMV
	c9VdQpWjPw3k+HB93eMeN0szxCS2gk7MN1XK7RvLi6dqZ7ldrJ+nasckXo4lQ31kK2Wk+5SqdZv
	REuMZRwywiVbDOF/r+R/mhDJXOExlNpRJRMdHHOJ/hr/iV8iaCWMFTa+LtR2aS8nwmU3RZdqreg
	p6Cxh6ICO4MPrSHM8mZ2q2WUqV4EIY+gg7eoXnKM2EMohTtVYRznDhAeKask1DcKcE2T1DHJoHq
	vmXxMX3QKOu7zS6KFcVOFVNRqhjK25xh2s3GsHUIQFkXpaVCv8vt+I2fNpz4+FhPuTUmfumTTUm
	vaU6KX+Y4TjgUmsBX22+X+EzA/f
X-Received: by 2002:a05:600c:5249:b0:485:7f02:afd5 with SMTP id 5b1f17b1804b1-488d680079bmr7223345e9.13.1775776272775;
        Thu, 09 Apr 2026 16:11:12 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00af4acfc73fc9518a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:af4a:cfc7:3fc9:518a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67e685csm7708855e9.6.2026.04.09.16.11.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 16:11:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v4 02/30] linux-yocto/5.15: update to v5.15.201
Date: Fri, 10 Apr 2026 01:10:02 +0200
Message-ID: <65c5b6d33aa81de3e85452a1c1e4395e49addcca.1775775155.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775775154.git.yoann.congal@smile.fr>
References: <cover.1775775154.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 23:11:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234961

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

