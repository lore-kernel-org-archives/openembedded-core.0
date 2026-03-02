Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D38D58E54
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 04:55:51 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.153763.1772427350302572154
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 20:55:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HTBLwUyv;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-899a5cb04f9so52142686d6.2
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Mar 2026 20:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772427349; x=1773032149; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZkkvJXhjllp+aTo2CxG7QazzFvl4XSeZMZystS3aLY=;
        b=HTBLwUyvlwIg+Mf0nS7EeSarFv3lVbZuzFQvsoBiztv2241SSIjbaRYVGFMsBy4fa0
         rYqonLMPfSohX4W+3xi/Ppwrmq2ilZbuXjKypMzw9snrk9ZfVv6jbUtZn+xtaT1BadNp
         edOoqRF9IhIjxJbSoglXJUBhYLbYX9fzvp7JVSDMbQuRCm0FGETvXv5JNfFkkrHuqbL2
         +tcfZHxlZ4A1qkjjBaLsaGLDPLQeinNVMupvq7b9rh1oC/1CQ5tpW+eCvJcKddSrxyFW
         H8xwEaJUIJYOkgKV/HYAleuEY+Oceu8VnbX7qf9D4rvr38ft/3gBkMLfNJjzsUJJPphE
         xFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772427349; x=1773032149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lZkkvJXhjllp+aTo2CxG7QazzFvl4XSeZMZystS3aLY=;
        b=V3OIAjNrbPV3Nyd4wwOwX0cg43sszPRWCioZ9X0UbZM4QxgBPF/LMf8s17zYiI0L2c
         4xDjdCkVun/8ZiQLx87Zgq+gybx7TISKJNdlcxHgM5NWiiibYa/yAB64cDkSsejq2I9r
         kTR27k/EEayiMpFdkv2TZY/uj2jjBa0epOB2RD+yK1BqLGTYQvpSOks9q0u6z8YlPG/8
         aX9TuBeskgIJIGyV6NYz07t1Vq2y8JGbBxavMPW0lEmyXeKahVQ1i7UWASPZ1MoYMuZT
         SLh5PM0rPDnbaOX0y98I6a6I4c7F3Dabmp1mRMbt56liaD4/HgEWAeG2LWOG+BGlgLqm
         tDvA==
X-Gm-Message-State: AOJu0Yy70s6LR90cVU1fWce2OM0Jajj3o3cnjWLERJ02dH/IwzluDyxQ
	ZvXZPHfOvlWZlaRMUmbMymsLfzzNCUsZuilYsM4N+BRYGdYudtPP1GsA8jW0LiUUfpg=
X-Gm-Gg: ATEYQzxLvJSjtTG9ihdr0lfhmbidrgo3TgUJdPdy3u2dGeyBya8d9UjGaOVVzH5qPE2
	ygDp4/H9DSKdpR+Ew3lAbK5WOmf8GlA101GoMNoc+13pTRmOsWgtkzwcuZMkjCGn0EhydtALG4y
	tj3Ewsc35HGjRPhbXk2YwRQK7F/zEbBtrfGf8quwFybfya2PDGt8j312YFmLSbzaz/zCOAD1zBe
	sMrJbpRBK/IPjBikIEv3WPxVwTuVi4pecDwTf9TMp9aXEc9a2Mxx0miJcGPi8Iz/Xvx5r0jNsWi
	/kBe5mXJw3n/hr0yziUutk7jFpG32kgFzDCu6L7WPEJ6Bm4s1Omcnum6U8SKQRaWDqfGBZawfYH
	lGP2OURfQPbgjw0mUA0iBogPzfU9SGTR3Htg8MnxsGXleL4YgcXEDFKf8LkOsWNeMGr1tEs/1jw
	rF+677BPNDHgV4tQ/NYhIE+3VivsdKg3QDQvQJ8//n86Pk4HM8rZzlRnMaKuU5YLWEYzeZPDq8q
	Q3PEEU1HHqpnYRvVkXLMyUkLgo/giNj6iYK6zkBIZaPqcThbpsNPpzKrTg=
X-Received: by 2002:a05:6214:76b:b0:899:f820:641a with SMTP id 6a1803df08f44-899f8206bd3mr37304286d6.30.1772427349241;
        Sun, 01 Mar 2026 20:55:49 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a017add76sm2488406d6.36.2026.03.01.20.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 20:55:48 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 06/10] linux-yocto/6.18: update to v6.18.13
Date: Sun,  1 Mar 2026 23:55:32 -0500
Message-ID: <20260302045537.2153587-7-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302045537.2153587-1-bruce.ashfield@gmail.com>
References: <20260302045537.2153587-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 04:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232166

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.18 to the latest korg -stable release that comprises
the following commits:

    25e0b1c206e3d Linux 6.18.13
    df337ba02ca53 f2fs: fix incomplete block usage in compact SSA summaries
    855c54f1803e3 f2fs: fix to do sanity check on node footer in {read,write}_end_io
    cd2fec912a0f0 f2fs: fix to do sanity check on node footer in __write_node_folio()
    715a7a72e4736 USB: serial: option: add Telit FN920C04 RNDIS compositions
    f611dafe0ffd3 iommu/arm-smmu-qcom: do not register driver in probe()
    0415ae51a40e3 f2fs: optimize f2fs_overwrite_io() for f2fs_iomap_begin
    fee27b69dde1a f2fs: fix to avoid mapping wrong physical block for swapfile
    97e4f479939e5 f2fs: support non-4KB block size without packed_ssa feature
    995030be4ce63 f2fs: fix to avoid UAF in f2fs_write_end_io()
    d4a594dd952df f2fs: fix out-of-bounds access in sysfs attribute read/write
    bd66b4c487d50 f2fs: fix IS_CHECKPOINTED flag inconsistency issue caused by concurrent atomic commit and checkpoint writes
    70cf1e96bde07 f2fs: fix to check sysfs filename w/ gc_pin_file_thresh correctly
    fb9f7e52273db f2fs: fix to add gc count stat in f2fs_gc_range
    1c008ad0f0d1c fbdev: smscufx: properly copy ioctl memory to kernelspace
    3e4cbd1d46c24 fbdev: rivafb: fix divide error in nv3_arb()
    98d91080517d4 cpuset: Fix missing adaptation for cpuset_is_populated
    eaa9fcf57934c LoongArch: Rework KASAN initialization for PTW-enabled systems
    9b671f6f432be mm/hugetlb: fix excessive IPI broadcasts when unsharing PMD tables using mmu_gather
    0c74d37343b93 arm64: dts: mediatek: mt8183: Add missing endpoint IDs to display graph
    6d66464d1a059 gpiolib: acpi: Fix gpio count with string references
    fa4938e0d0d64 io_uring/fdinfo: be a bit nicer when looping a lot of SQEs/CQEs
    cab928242853a ASoC: fsl_xcvr: fix missing lock in fsl_xcvr_mode_put()
    00c57e2369386 drm/amd/display: remove assert around dpp_base replacement
    8e6f503961709 drm/amd/display: extend delta clamping logic to CM3 LUT helper
    f2584f791a103 tracing/dma: Cap dma_map_sg tracepoint arrays to prevent buffer overflow
    7bc40c6f36575 ASoC: cs42l43: Correct handling of 3-pole jack load detection
    a8ed5b974a244 platform/x86: panasonic-laptop: Fix sysfs group leak in error path
    2ca80dd4bb0e2 ASoC: sof_sdw: Add a quirk for Lenovo laptop using sidecar amps with cs42l43
    bb6ff25035da5 platform/x86/amd/pmc: Add quirk for MECHREVO Wujie 15X Pro
    a9584e9e46448 ALSA: hda/realtek: Enable headset mic for Acer Nitro 5
    78783e8d588cf ASoC: amd: yc: Add quirk for HP 200 G2a 16
    c3b2e922924bf ASoC: Intel: sof_es8336: Add DMI quirk for Huawei BOD-WXX9
    97528b1622b8f platform/x86: classmate-laptop: Add missing NULL pointer checks
    efdb9c8ca3cfb drm/tegra: hdmi: sor: Fix error: variable ‘j’ set but not used
    4b71ad7676564 romfs: check sb_set_blocksize() return value
    d2e01e0c5e947 ALSA: hda/realtek - fixed speaker no sound
    20bc7062c352f ASoC: cs35l45: Corrects ASP_TX5 DAPM widget channel
    1bdbcf326474c ALSA: hda/realtek: Add quirk for Inspur S14-G1
    b0b2cb84b64a9 gpio: sprd: Change sprd_gpio lock to raw_spin_lock
    652667ac1369e ASoC: amd: yc: Add ASUS ExpertBook PM1503CDA to quirks list
    464a50c6b23aa rust: driver: fix broken intra-doc links to example driver types
    7d82e965fe0e3 rust: dma: fix broken intra-doc links
    68dd6c5ebe799 rust: device: fix broken intra-doc links
    31f33b856d232 scsi: qla2xxx: Fix bsg_done() causing double free
    2784b1b43af37 Linux 6.18.12
    53a76425e0764 Revert "driver core: enforce device_lock for driver_match_device()"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.18.bb              |  6 ++---
 .../linux/linux-yocto-tiny_6.18.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index 33621d9e9e..20392e62ab 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -15,13 +15,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "bf970b6498c3d3e3f8b8a718741e9f98ccaf84f5"
-SRCREV_meta ?= "a4cdc750c7d35e6bd55393c1690b7135a04be250"
+SRCREV_machine ?= "9bd60c36af4be5a5905bb5408325961475e66880"
+SRCREV_meta ?= "53f6a3a8804eb05a2d03881c4a90b643151dd9b3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.18.11"
+LINUX_VERSION ?= "6.18.13"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index a5d02e7726..07e8caa7dd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.18.inc
 
-LINUX_VERSION ?= "6.18.11"
+LINUX_VERSION ?= "6.18.13"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "057e0bf6446ead5535717da84b234c64615458db"
-SRCREV_meta ?= "a4cdc750c7d35e6bd55393c1690b7135a04be250"
+SRCREV_machine ?= "c9dde4c9d33d3635d3c6604a1bb0c62ea01b0f44"
+SRCREV_meta ?= "53f6a3a8804eb05a2d03881c4a90b643151dd9b3"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index cbc98a1a2b..8fff02b165 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "78ce5d975c473b45539b6008e28485ed54193a4a"
-SRCREV_machine:qemuarm64 ?= "057e0bf6446ead5535717da84b234c64615458db"
-SRCREV_machine:qemuloongarch64 ?= "057e0bf6446ead5535717da84b234c64615458db"
+SRCREV_machine:qemuarm ?= "017989e501a2e6c46e3ed9a663d045dedbcc92cb"
+SRCREV_machine:qemuarm64 ?= "c9dde4c9d33d3635d3c6604a1bb0c62ea01b0f44"
+SRCREV_machine:qemuloongarch64 ?= "c9dde4c9d33d3635d3c6604a1bb0c62ea01b0f44"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "057e0bf6446ead5535717da84b234c64615458db"
-SRCREV_machine:qemuriscv64 ?= "057e0bf6446ead5535717da84b234c64615458db"
-SRCREV_machine:qemuriscv32 ?= "057e0bf6446ead5535717da84b234c64615458db"
-SRCREV_machine:qemux86 ?= "057e0bf6446ead5535717da84b234c64615458db"
-SRCREV_machine:qemux86-64 ?= "057e0bf6446ead5535717da84b234c64615458db"
+SRCREV_machine:qemuppc ?= "c9dde4c9d33d3635d3c6604a1bb0c62ea01b0f44"
+SRCREV_machine:qemuriscv64 ?= "c9dde4c9d33d3635d3c6604a1bb0c62ea01b0f44"
+SRCREV_machine:qemuriscv32 ?= "c9dde4c9d33d3635d3c6604a1bb0c62ea01b0f44"
+SRCREV_machine:qemux86 ?= "c9dde4c9d33d3635d3c6604a1bb0c62ea01b0f44"
+SRCREV_machine:qemux86-64 ?= "c9dde4c9d33d3635d3c6604a1bb0c62ea01b0f44"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "057e0bf6446ead5535717da84b234c64615458db"
-SRCREV_meta ?= "a4cdc750c7d35e6bd55393c1690b7135a04be250"
+SRCREV_machine ?= "c9dde4c9d33d3635d3c6604a1bb0c62ea01b0f44"
+SRCREV_meta ?= "53f6a3a8804eb05a2d03881c4a90b643151dd9b3"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "41cec610f690603820c80c4871dbb55bec77b9a2"
+SRCREV_machine:class-devupstream ?= "ee4fb138af107455c9d6e38cf7087d932796ba8a"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.18/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.18.11"
+LINUX_VERSION ?= "6.18.13"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


