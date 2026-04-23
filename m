Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4757FC0368
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:42:02 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.620.1776958915670631270
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 08:41:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oXvtChxh;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8cbc593a67aso622792885a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 08:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776958915; x=1777563715; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cl0td6uQ+cuO9Td2G6lJ8nYE27YKPJRvu4JoYFemFY4=;
        b=oXvtChxhyDC2dZP50SSHkAp4o8jWnZiDfb5Beid/QLMomsVPB7deQfkTQzOYJUKdqu
         CRQPPtjAOZx1wdHVtEtEzG7RIIlqEDKSnZ2JF5P5EQjFkGdZx4nhjtSrxBvoVVfVlLJK
         sa/MYsM9Gwv9V8EWsVOPQEGF4WVYpPeS4MPyyzfiUcgWTeWAoWoca0nWhmP/5ZCqbrgr
         MPFarm60Ob6lg+IdEqcIZaRiuha0oMezcb4rqI7y6xZ6CM4Dj4/dSgFT8lG7pJeJZi+s
         nmcvJa3sSgckrtySBlRBS29+JSu+ywnSxIuXAjtH7C+O9L4U9dkffcxDBGM2sVr5MicW
         oRMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776958915; x=1777563715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cl0td6uQ+cuO9Td2G6lJ8nYE27YKPJRvu4JoYFemFY4=;
        b=sDJgM3aOjjS/ZNUWMnK7Hkw8QWjiZC4Jg4mmXWwzHXk1W0qvZxFapXuDJXIUstdDyE
         tBTPzrpzjFO5nK7b3R2cYUg/31NfFV4HYMvB4ZFF7U7tATKPXFB/d32swQRge2aZdR5p
         j22VAjIUzFVFTmcSShH7H8szEdWk+2S9Abc7uIYDsr+3/wH9rhsebq8XEZcy2Id5zBAV
         S6iKiXzcQCadVZzPzkAYEuLB4kNhyjlsgURtP/Z+FDFbo57ASkTy+U52aKP6SHTjm+3Z
         PIbgn/BFEfl5xklUGFe7ADNpOqaR7OPZ5zZ80hltwOzXcxDgl4GiL5NZvqfR4mV77yk4
         iH0Q==
X-Gm-Message-State: AOJu0YxpAS8piS7LEg/Y8n9uXiXY6eBkRzVodNX4WrbHMrBYkyksqanF
	7p2M8XizAu7McBsA6tYulMLgv0hQvNlhuCv4f9BO+jQ9jy1l7A7fcanRJ+FAF1IQ
X-Gm-Gg: AeBDieujeFq6+HlyluIaNaKA5WBRD5QxwBdFoQKmaH8uk9cKjUBDv57EtoPbqNAPk8T
	D3En3MAvaldbhOWrzL0LrXYL76LBzikdEtH/9Kd9k5sK1KaUaF/xsl53GeC3uF7SrmZU45sw67Q
	IBjKLf5i8VGLGed1rxBk1qJ7rSmrgX7RiLezpV4RYtb4Om1NKQTVx8CcxQo6ErSXz6bjOCPAx0I
	J0l1pz05VwmV1JxidRbA01e9jHm7S8RYnqhjDF2vTedR2LvOeePX9iYLdYvjnC9k9Xr31ZKLlh3
	1J67FGEuU9EMle2vSKVBgKIpmjGHGegdgSWSXIrHZB9asXDG61xP9khxOZ2HusoBK3OHkLhUqLG
	Y40NYj6xH86CymZajvOws3gKLxiwETnnp090OEg+n8eraB5LhBVghkQKv6hyTc6goGR/DJcoPo+
	vORaX5aeRRigViq3BDY8L682BRh9NHKc4UbEcUN+OScgM6W2qvnfkse6z35gx4ifNpnaxnJ2ZXV
	oBo9Oj0RA8ucbjkkRpCxO+5Q1wq93Fs2Bzld1YbzDbXLkU2YYgL1U/FCp6LM5Jsljnrj2zpqyzu
	FR+0
X-Received: by 2002:a05:620a:4623:b0:8d7:a015:5dbe with SMTP id af79cd13be357-8e792a61cc3mr3973343185a.55.1776958914499;
        Thu, 23 Apr 2026 08:41:54 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d69abee3sm1602139585a.17.2026.04.23.08.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:41:53 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][scarthgap][PATCH 03/08] linux-yocto/6.6: update to v6.6.127
Date: Thu, 23 Apr 2026 11:41:44 -0400
Message-ID: <20260423154149.1933049-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423154149.1933049-1-bruce.ashfield@gmail.com>
References: <20260423154149.1933049-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 15:42:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235794

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    7a137e9bfa0e Linux 6.6.127
    f478b8239d65 net: tunnel: make skb_vlan_inet_prepare() return drop reasons
    35ac888bf8ac USB: serial: option: add Telit FN920C04 RNDIS compositions
    d4534a7f6c92 f2fs: fix to avoid mapping wrong physical block for swapfile
    20a8bad29d18 f2fs: fix zoned block device information initialization
    acc2c97fc000 f2fs: fix to avoid UAF in f2fs_write_end_io()
    75e19da068ad f2fs: fix IS_CHECKPOINTED flag inconsistency issue caused by concurrent atomic commit and checkpoint writes
    eebd72cff518 f2fs: fix out-of-bounds access in sysfs attribute read/write
    81193503af1f f2fs: fix to add gc count stat in f2fs_gc_range
    0634e8d65099 fbdev: smscufx: properly copy ioctl memory to kernelspace
    78daf5984d96 fbdev: rivafb: fix divide error in nv3_arb()
    f42a2d49c465 LoongArch: Add writecombine support for DMW-based ioremap()
    6e5eccdef67e cpuset: Fix missing adaptation for cpuset_is_populated
    ff37dd18ce77 mm/hugetlb: fix excessive IPI broadcasts when unsharing PMD tables using mmu_gather
    2eeca9383efe mm/hugetlb: fix two comments related to huge_pmd_unshare()
    51dcf459845f mm/hugetlb: fix hugetlb_pmd_shared()
    8c9a1b071051 mm/hugetlb: fix copy_hugetlb_page_range() to use ->pt_share_count
    168ee1549fa2 Revert "wireguard: device: enable threaded NAPI"
    78e706f9b197 LoongArch: Rework KASAN initialization for PTW-enabled systems
    f507fc06c7cd LoongArch: Add WriteCombine shadow mapping in KASAN
    16f137fb74c1 gpiolib: acpi: Fix gpio count with string references
    61e007657bf7 ASoC: fsl_xcvr: fix missing lock in fsl_xcvr_mode_put()
    f49d2497da14 ASoC: cs42l43: Correct handling of 3-pole jack load detection
    329bb274a3a9 platform/x86: panasonic-laptop: Fix sysfs group leak in error path
    e8f5d1306a3a platform/x86/amd/pmc: Add quirk for MECHREVO Wujie 15X Pro
    c3876edb0184 ASoC: amd: yc: Add quirk for HP 200 G2a 16
    d7d7b93aca64 ASoC: Intel: sof_es8336: Add DMI quirk for Huawei BOD-WXX9
    9cf4b9b8ad09 platform/x86: classmate-laptop: Add missing NULL pointer checks
    e120bae4c56d drm/tegra: hdmi: sor: Fix error: variable ‘j’ set but not used
    cbd9931e6456 romfs: check sb_set_blocksize() return value
    79100c3bc0c4 ASoC: cs35l45: Corrects ASP_TX5 DAPM widget channel
    6834804ad484 ALSA: hda/realtek: Add quirk for Inspur S14-G1
    b204c5ec24a2 gpio: sprd: Change sprd_gpio lock to raw_spin_lock
    4cfb1aed4753 ASoC: amd: yc: Add ASUS ExpertBook PM1503CDA to quirks list
    2accd79be906 ALSA: hda/realtek: Fix headset mic for TongFang X6AR55xU
    b19838402873 bus: fsl-mc: fix use-after-free in driver_override_show()
    3118a9c6875b bus: fsl-mc: Replace snprintf and sprintf with sysfs_emit in sysfs show functions
    8cb905eca739 PCI: endpoint: Avoid creating sub-groups asynchronously
    68c9fdb01af8 PCI: endpoint: Remove unused field in struct pci_epf_group
    74e7458537cd scsi: qla2xxx: Fix bsg_done() causing double free

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index e5f3c9b6cb..8685e5cbf6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "aaa3191196fccd0d26d55a88dcc2396ce79cfc21"
-SRCREV_meta ?= "17b54189a09494c54960a80a479098010e428f81"
+SRCREV_machine ?= "c45743dc8dc2ddfbe7bd165997e1f7cf887fa6b7"
+SRCREV_meta ?= "45f69741c733e066ed1a12b6025e347e5cd6063e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.126"
+LINUX_VERSION ?= "6.6.127"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 56b3e52003..d6a9afdf17 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.126"
+LINUX_VERSION ?= "6.6.127"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "3a9d8ba770fff7d27a4d2607644d9d6925329e73"
-SRCREV_meta ?= "17b54189a09494c54960a80a479098010e428f81"
+SRCREV_machine ?= "8247922ff493e4fef938ce36562cac9c0cce86aa"
+SRCREV_meta ?= "45f69741c733e066ed1a12b6025e347e5cd6063e"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index b4d9452b80..92ad6afa3a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "746f0ca46b4fdd56ba711cf7b49b9a71d4f64acf"
-SRCREV_machine:qemuarm64 ?= "9da440425610b9335df95d76dfa2a56ea4e492eb"
-SRCREV_machine:qemuloongarch64 ?= "c6bff8c03457825a34929284be97de7fd99f0c83"
-SRCREV_machine:qemumips ?= "208bd32390022fec5948b1808e6d9ea83d88d9bd"
-SRCREV_machine:qemuppc ?= "9645b14ebe59396b0d1035c5f96ac74ae483f4c7"
-SRCREV_machine:qemuriscv64 ?= "c6bff8c03457825a34929284be97de7fd99f0c83"
-SRCREV_machine:qemuriscv32 ?= "c6bff8c03457825a34929284be97de7fd99f0c83"
-SRCREV_machine:qemux86 ?= "c6bff8c03457825a34929284be97de7fd99f0c83"
-SRCREV_machine:qemux86-64 ?= "c6bff8c03457825a34929284be97de7fd99f0c83"
-SRCREV_machine:qemumips64 ?= "b7972053efd2ad49abf9a0637dfa2b4b1bdff8a4"
-SRCREV_machine ?= "c6bff8c03457825a34929284be97de7fd99f0c83"
-SRCREV_meta ?= "17b54189a09494c54960a80a479098010e428f81"
+SRCREV_machine:qemuarm ?= "aa66687c1abe2afe2ee6c00c36bfaaf3d5d9636c"
+SRCREV_machine:qemuarm64 ?= "cf88783fdb92901d9d228afb7d700c6575742f1b"
+SRCREV_machine:qemuloongarch64 ?= "70af2998be31b72a111de67966b7816b3d54d472"
+SRCREV_machine:qemumips ?= "cbd6f9a670486dcd83ef0f8b90a75b2b7b44b447"
+SRCREV_machine:qemuppc ?= "bce75aa765505d7db3bb1bfefb5d3f524a1a5b64"
+SRCREV_machine:qemuriscv64 ?= "70af2998be31b72a111de67966b7816b3d54d472"
+SRCREV_machine:qemuriscv32 ?= "70af2998be31b72a111de67966b7816b3d54d472"
+SRCREV_machine:qemux86 ?= "70af2998be31b72a111de67966b7816b3d54d472"
+SRCREV_machine:qemux86-64 ?= "70af2998be31b72a111de67966b7816b3d54d472"
+SRCREV_machine:qemumips64 ?= "4cc6d51a6f63436a37c3ba4ea2da93c7fd3240b4"
+SRCREV_machine ?= "70af2998be31b72a111de67966b7816b3d54d472"
+SRCREV_meta ?= "45f69741c733e066ed1a12b6025e347e5cd6063e"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "56865d9b7074c08d8191bc721b1e46baa650d9cd"
+SRCREV_machine:class-devupstream ?= "7a137e9bfa0e1919555d60f9dc0c05a7a5ba75d0"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.126"
+LINUX_VERSION ?= "6.6.127"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


