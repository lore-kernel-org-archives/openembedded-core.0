Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A814FC0373
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:45:23 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.761.1776959118442261672
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 08:45:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gI6iDL4L;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-50faeb8317bso33155781cf.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 08:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776959117; x=1777563917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NkhcL0ozvUDQFF3Ggt6o/RhIdOVi19VGgfZexFwDppI=;
        b=gI6iDL4LXBkterM6AwgDwfOA34ywdO1kzND76W+XHuqsgkWLnlZXRkTZtHaJoB8vqq
         kCKZtKgxUp8Ks+vz0jQ8wWhzLkRKos0aJt0bO00XfnaWMimI/GZvASotU72VjmlAFCZc
         75t7s1yZMHpkKsvJism1uKRMyuz3WDFULYYz6gkkNOQqc1fduKoNxQg3kK6F9D4fcsjL
         BVVH/cxOo5FDlhLSkIikXUmAav7SXJ4b+4WnSADMgz5tQ5CxBp2ylaSQI3YpyFrxiQT+
         /Rk4Vv8/RDJEaI0vWsNembh01CuuCtoYN0LB2ADnddY+vt56XYL/eus7iuouQSdMMnQd
         kRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776959117; x=1777563917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NkhcL0ozvUDQFF3Ggt6o/RhIdOVi19VGgfZexFwDppI=;
        b=bSHJw3mv2B9vDlsajf4enOk9+AErdc3gKn4omP2I99R6M4PL0YEoD7b7GavHUeGdF1
         lXlgaIG5mEJWd1C3E68cuhDvczTP6GT5kDklJ+Is4TlhAxRI44W+wVZ8bAvCjElj4uq+
         h0qqaAKl6gIVHUrvx6cgsjAaDGWQ2D2DdG5Xl39Mnm7d9u2NmXZwiA7m24ur5m1S/ZU+
         wlqMfH3PL70n4P6cAuRAn9zW8+lub56I2GJ8nKc8m5Ua3eRsCzAbEk8MfOyPouK27VaX
         sRSviLE7yzduWTG30mftggAILuQArh7x1gVYRVJdIuIiITetVW/ooXTycA7DLQNsWo3W
         GTbg==
X-Gm-Message-State: AOJu0Yz+aeEOXasbDKCujvBHNrH6hKlfdhV2rOr3h3eKxX1R/5Fd5eIO
	etg+nHcCxtDHDP7MF7CrBd4t4T/3Cc411JswSYwtebz1nxskNvBU/VGo+a8Cdg8o
X-Gm-Gg: AeBDiesY29HfeL/qRY26D6cXyoiicFUmTwb4OJRjGU2HrTExE6Yq5yBt5Ps/SNrJcxN
	DY0xlDtrdOkTW9HjTUnAwOLTgxGIU04MtZ1bn1F5n6EsxiH8i858Rf6IFOW8dQUtnSjl+swN1+T
	GtPP5rLdETFr5vKThxiUGVEZk5qAxIWoW9VYW2l09QHdSqSQffLyk10mrPUvCfb378B466gA9jp
	PMZBS73E3qKsgeKtSlDFjH9RBa6cSUid/QCq+s0CMdXeNiFOkbqtAVxIZA3IRh94PiN6+rjQXlH
	L5mNGr10PzrLGq8Fe/SKMs1wWM8j3A6gF7o1IcV+Z/XwJiE9PCl/ZkOqox1dlFNiYTSw3X54FsI
	ghDVmMzvaF2NSFfksfS8gJGc+cYB/H6MnOwNtuxUT+3NzKa1q8B+rnL1yoBmrP0nN2eLox+muTx
	05Kwb1FYfxspSttDGpa4/WLEQDIaVhvsjqFrCUryaJarEYJv6MkkOMPqg4GRXw3lFdXX9Mcp047
	jjzeT8+usKQgkm4c+PH8TlvIvJd9DGLMf2deZiplrFzQGhWBhKmvPeRymsPUf7NvlQoUxcgPJlt
	PiWG
X-Received: by 2002:a05:622a:1f99:b0:50d:a987:89b2 with SMTP id d75a77b69052e-50e36c12741mr401143191cf.31.1776959117246;
        Thu, 23 Apr 2026 08:45:17 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50fb416b3f5sm74400031cf.28.2026.04.23.08.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:45:16 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
Subject: [openembedded-core][whinlatter][PATCH 05/18] linux-yocto/6.12: update to v6.12.74
Date: Thu, 23 Apr 2026 11:44:56 -0400
Message-ID: <20260423154509.1933646-6-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423154509.1933646-1-bruce.ashfield@gmail.com>
References: <20260423154509.1933646-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 15:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235805

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    444b39ef6108 Linux 6.12.74
    9001c6815e53 USB: serial: option: add Telit FN920C04 RNDIS compositions
    962c167b0f26 f2fs: fix IS_CHECKPOINTED flag inconsistency issue caused by concurrent atomic commit and checkpoint writes
    cf4a9e1bc812 f2fs: fix to avoid UAF in f2fs_write_end_io()
    121f787e740d iommu/arm-smmu-qcom: do not register driver in probe()
    1ff415eef513 f2fs: fix to avoid mapping wrong physical block for swapfile
    4ef30b9f1641 f2fs: fix out-of-bounds access in sysfs attribute read/write
    b72d775424f5 f2fs: fix to check sysfs filename w/ gc_pin_file_thresh correctly
    aeb70609e6b5 f2fs: fix to add gc count stat in f2fs_gc_range
    52917e265aa5 fbdev: smscufx: properly copy ioctl memory to kernelspace
    9efa0dc46270 fbdev: rivafb: fix divide error in nv3_arb()
    7b7829839dac cpuset: Fix missing adaptation for cpuset_is_populated
    e94b369ff82f Revert "wireguard: device: enable threaded NAPI"
    56db97af7c89 LoongArch: Rework KASAN initialization for PTW-enabled systems
    da06bb0ca45b mm/hugetlb: fix excessive IPI broadcasts when unsharing PMD tables using mmu_gather
    baa198a93401 mm/hugetlb: fix two comments related to huge_pmd_unshare()
    3a18b452dd5f mm/hugetlb: fix hugetlb_pmd_shared()
    b285b1fd51fa mm/hugetlb: fix copy_hugetlb_page_range() to use ->pt_share_count
    56ef68a5b8a1 gpiolib: acpi: Fix gpio count with string references
    daaf4fe333e0 ASoC: fsl_xcvr: fix missing lock in fsl_xcvr_mode_put()
    67484f35c447 drm/amd/display: remove assert around dpp_base replacement
    7165dc5133fb drm/amd/display: extend delta clamping logic to CM3 LUT helper
    02d209bb018a tracing/dma: Cap dma_map_sg tracepoint arrays to prevent buffer overflow
    ded6043c3358 ASoC: cs42l43: Correct handling of 3-pole jack load detection
    b3851fb4aba8 platform/x86: panasonic-laptop: Fix sysfs group leak in error path
    bc3da98445cf platform/x86/amd/pmc: Add quirk for MECHREVO Wujie 15X Pro
    db8799e80cb7 ALSA: hda/realtek: Enable headset mic for Acer Nitro 5
    c9575a0cd571 ASoC: amd: yc: Add quirk for HP 200 G2a 16
    a1ad7bbeafd7 ASoC: Intel: sof_es8336: Add DMI quirk for Huawei BOD-WXX9
    da6e06a5fdba platform/x86: classmate-laptop: Add missing NULL pointer checks
    45668b63be01 drm/tegra: hdmi: sor: Fix error: variable ‘j’ set but not used
    9b203b8ddd73 romfs: check sb_set_blocksize() return value
    59ec2c61fe03 ALSA: hda/realtek - fixed speaker no sound
    10a948cb71d1 ASoC: cs35l45: Corrects ASP_TX5 DAPM widget channel
    284ded9e5b72 ALSA: hda/realtek: Add quirk for Inspur S14-G1
    5beb4ddac6a9 gpio: sprd: Change sprd_gpio lock to raw_spin_lock
    8a6e19a406d8 ASoC: amd: yc: Add ASUS ExpertBook PM1503CDA to quirks list
    209d027747cb ALSA: hda/realtek: Fix headset mic for TongFang X6AR55xU
    dd8ba8c0c3f3 bus: fsl-mc: fix use-after-free in driver_override_show()
    b7a5b454b7f7 bus: fsl-mc: Replace snprintf and sprintf with sysfs_emit in sysfs show functions
    a22fe7581f11 bnxt_en: hide CONFIG_DETECT_HUNG_TASK specific code
    7096cc734240 bnxt_en: Change FW message timeout warning
    871f6236da96 scsi: qla2xxx: Fix bsg_done() causing double free

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 4572915cf4..a8d17a5c14 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -15,13 +15,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1be6d1eaceba0860348c41af8951ccebfa5aa2c8"
-SRCREV_meta ?= "6d166217a8feea3a7e961be354ea9deabeb8d356"
+SRCREV_machine ?= "96b72162b68a3a6084945ef4bf357a3de5c196ed"
+SRCREV_meta ?= "d427132ce6626fdae8a1690305e1b578a5509699"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.73"
+LINUX_VERSION ?= "6.12.74"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index d5c1c8c052..22b15e69f2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.73"
+LINUX_VERSION ?= "6.12.74"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "b67de812f086e14ab0897455a7bdc17dd9b0d6de"
-SRCREV_meta ?= "6d166217a8feea3a7e961be354ea9deabeb8d356"
+SRCREV_machine ?= "daff0c37ea8999b6dbd3c7e2d761a102fe32a23d"
+SRCREV_meta ?= "d427132ce6626fdae8a1690305e1b578a5509699"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 5b6bf7ef0a..92807f9057 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "a7cf22192ce38f303c8a5070b750583953a34e09"
-SRCREV_machine:qemuarm64 ?= "b67de812f086e14ab0897455a7bdc17dd9b0d6de"
-SRCREV_machine:qemuloongarch64 ?= "b67de812f086e14ab0897455a7bdc17dd9b0d6de"
-SRCREV_machine:qemumips ?= "9a4ed79b88cab20c169656abe310068f8cdab2c3"
-SRCREV_machine:qemuppc ?= "b67de812f086e14ab0897455a7bdc17dd9b0d6de"
-SRCREV_machine:qemuriscv64 ?= "b67de812f086e14ab0897455a7bdc17dd9b0d6de"
-SRCREV_machine:qemuriscv32 ?= "b67de812f086e14ab0897455a7bdc17dd9b0d6de"
-SRCREV_machine:qemux86 ?= "b67de812f086e14ab0897455a7bdc17dd9b0d6de"
-SRCREV_machine:qemux86-64 ?= "b67de812f086e14ab0897455a7bdc17dd9b0d6de"
-SRCREV_machine:qemumips64 ?= "0a68bc37afffea25aa627239d1de74f4b7088824"
-SRCREV_machine ?= "b67de812f086e14ab0897455a7bdc17dd9b0d6de"
-SRCREV_meta ?= "6d166217a8feea3a7e961be354ea9deabeb8d356"
+SRCREV_machine:qemuarm ?= "f4b46d6d3a4e38d532c5e11866d3d071ae398f16"
+SRCREV_machine:qemuarm64 ?= "daff0c37ea8999b6dbd3c7e2d761a102fe32a23d"
+SRCREV_machine:qemuloongarch64 ?= "daff0c37ea8999b6dbd3c7e2d761a102fe32a23d"
+SRCREV_machine:qemumips ?= "da8487babd144628f801a204696523e077829fa2"
+SRCREV_machine:qemuppc ?= "daff0c37ea8999b6dbd3c7e2d761a102fe32a23d"
+SRCREV_machine:qemuriscv64 ?= "daff0c37ea8999b6dbd3c7e2d761a102fe32a23d"
+SRCREV_machine:qemuriscv32 ?= "daff0c37ea8999b6dbd3c7e2d761a102fe32a23d"
+SRCREV_machine:qemux86 ?= "daff0c37ea8999b6dbd3c7e2d761a102fe32a23d"
+SRCREV_machine:qemux86-64 ?= "daff0c37ea8999b6dbd3c7e2d761a102fe32a23d"
+SRCREV_machine:qemumips64 ?= "29ca2370cd8722cc5fd712f4a6b4757ad84fde3e"
+SRCREV_machine ?= "daff0c37ea8999b6dbd3c7e2d761a102fe32a23d"
+SRCREV_meta ?= "d427132ce6626fdae8a1690305e1b578a5509699"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "5fb0303f6cb6a89bcfb19bd7a68cb793c86e78b2"
+SRCREV_machine:class-devupstream ?= "444b39ef6108313e8452010b22aaba588e8fb92b"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.73"
+LINUX_VERSION ?= "6.12.74"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


