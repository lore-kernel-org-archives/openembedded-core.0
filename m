Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33836C0219D
	for <webhook@archiver.kernel.org>; Sun,  9 Feb 2025 23:56:33 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.40276.1739145385873833617
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Feb 2025 15:56:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N4BkasdH;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-46b1d40abbdso33660971cf.2
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Feb 2025 15:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739145385; x=1739750185; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vl068YP7j000MPTHktpcSfpCvuX61UkHmIGAYNmm+7o=;
        b=N4BkasdHhg4GMpmb1E0FIxIWryJY713BETZyfthn9QbyqymJuEzkgZSgma0nq66ErW
         AFAvH7IXZc5LRCWuRmSYiQG78WIAtCxftX5swJzbVqwgXdkjIAX7zbOgzDwaLmIDFIOR
         vh2cmJ7cCZJ/EHuDBFebT6ef7tIBl7r75MXOYvuNmq//HBnZ60vwwIIxeB2QiQB9R7tv
         4rVAUPgexA5eub8LmGY1vSSSIfukXXZ7jclMWtHmuvAqRhv0HIDE2R4n5XYytvA9zi3y
         7gSSRIatdrFgvvXO9rBfGVGqAwq96+OI8pGl2V1cy/G3VWdIAvjcA2NJeil81w0UOJww
         qWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739145385; x=1739750185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vl068YP7j000MPTHktpcSfpCvuX61UkHmIGAYNmm+7o=;
        b=T0TKdAN4BLYTjcyOM7U8JAbb8mIFQA3OvDAmPC5p95kncmjJ7HoYjuFYP7pEnFqOW1
         Ssi8RmkjAjTkmVcqzowCAK8g8vcfyU+KY7Pd+p8Fxx8FzFVJ0lSAbPrH/BzE05Hz0qrC
         XIMhuIgN1V6/BQxoRJllPa7TT/R9cgIkxFS4ZthdpGKCBdgj1KBfRfTHqIZ0/Lobp+VT
         IcTHzY3RwlnPFvI2HO078i1mCn9eFPjaz+7BGntXTYZMiDY+b4gyfYNoPoMSNNobmYV2
         9yI7+lFnzogi/UrdYRy6g+/c3XCPpqzU3feu8DeDXVA8o16+I8PRLkuJAPMowEsW78z/
         BF0w==
X-Gm-Message-State: AOJu0YyzQOkC8DolFq5LypOxBmuJ74nQof+94+Ue0Gkr63ibXTNtazeO
	athjI220MFJN8VQ0yekmzjukjX8UFbEE0d9fh6YFW8gn/dov4hs1r6xAEsAboqI=
X-Gm-Gg: ASbGncuQl+zvwjcoPS1vGb8xDvOnb2HqET6T68jxGRXwMfvefJGM5m8AlpuCjgeNJWE
	wiN9DSFxGHCqUIYTVXQEYjjcX72OBIywM24qeFVKeYiOn7Loobe84iY9O3GnqcrMZ7qnUziAlfj
	0O7Oxe6EMmS5wLpo2cCTklhrDydM7mpSD6eD2HzSEnGHvlyUAcTUU0VfPNn/FbZaAbL3wMKucN1
	1Oa3zv735h2lryuML/IQ5D/WsBc9vAUoc6Be2ZXfJj2cjMGc97uci5ilgIIZeKjP6PagBjgqN58
	ZfrLWaXAZDxvBgDPwNCyQrs6MBgFBZjin+ZfJ8x91YEgm8Sl5mZ2sHWUXau7mYfltFNznydtgR0
	C909IaIds4hW0+5QS
X-Google-Smtp-Source: AGHT+IFZQUOIiceKbVmWdy3ttWfl1vdacnuG4O9PQ37d+Vt6H7ZfHxgaI1T0HbZjoWJ5BkdLMwE1fQ==
X-Received: by 2002:a05:622a:1912:b0:460:aa51:8411 with SMTP id d75a77b69052e-47167a2a8ecmr151005041cf.24.1739145384824;
        Sun, 09 Feb 2025 15:56:24 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47153beaa5csm40754181cf.68.2025.02.09.15.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 15:56:23 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] linux-yocto/6.12: update to v6.12.12
Date: Sun,  9 Feb 2025 18:56:12 -0500
Message-Id: <5349f75c89aa43fc4b55ad9f8f7b5524881a2522.1739145061.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1739145061.git.bruce.ashfield@gmail.com>
References: <cover.1739145061.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Feb 2025 23:56:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211060

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    d914acc16b59 Linux 6.12.12
    01a7e3a43ee2 drm/v3d: Assign job pointer to NULL before signaling the fence
    efd96fbe23fa io_uring/rsrc: require cloned buffers to share accounting contexts
    5d114fa2b650 Input: xpad - add support for wooting two he (arm)
    41359d0d2e1b Input: xpad - add support for Nacon Evol-X Xbox One Controller
    ccc95d7e2765 Input: xpad - improve name of 8BitDo controller 2dc8:3106
    27ae0bdcb073 Input: xpad - add QH Electronics VID/PID
    a183a11cd688 Input: xpad - add unofficial Xbox 360 wireless receiver clone
    fae6f9589de3 Input: atkbd - map F23 key to support default copilot shortcut
    5c92458f72e3 Input: xpad - add support for Nacon Pro Compact
    5f5e6cbc4f5e HID: wacom: Initialize brightness of LED trigger
    5e1bde45daba wifi: rtl8xxxu: add more missing rtl8192cu USB IDs
    fad7b5641068 ALSA: usb-audio: Add delay quirk for USB Audio Device
    bb50dc2aa49d Revert "usb: gadget: u_serial: Disable ep before setting port to null to fix the crash caused by port being null"
    f371471708c7 USB: serial: quatech2: fix null-ptr-deref in qt2_process_read_urb()
    01d1ebdab9cc scsi: storvsc: Ratelimit warning logs to prevent VM denial of service
    a20fcaa230f7 vfio/platform: check the bounds of read/write syscalls
    780ab8329672 cachestat: fix page cache statistics permission checking
    276df5deb88c Revert "HID: multitouch: Add support for lenovo Y9000P Touchpad"
    997f6ec4208b net: sched: fix ets qdisc OOB Indexing
    efe8db3ecaa4 smb: client: handle lack of EA support in smb2_query_path_info()
    639b40424d17 libfs: Use d_children list to iterate simple_offset directories
    e73e46c96b9b libfs: Replace simple_offset end-of-directory detection
    9e9e710f68ba Revert "libfs: fix infinite directory reads for offset dir"
    bfb98a55cf5e Revert "libfs: Add simple_offset_empty()"
    1c3cf02db810 libfs: Return ENOSPC when the directory offset range is exhausted
    4516febe3253 gfs2: Truncate address space when flipping GFS2_DIF_JDATA flag
    556ee8e94410 mm: zswap: move allocations during CPU init outside the lock
    8d29ff5d5030 mm: zswap: properly synchronize freeing resources during CPU hotunplug
    f5712784c988 ASoC: samsung: Add missing depends on I2C
    d15dfc4e57cf hwmon: (drivetemp) Set scsi command timeout to 10s
    418bd70d1aca irqchip/sunxi-nmi: Add missing SKIP_WAKE flag
    0485a718f3df drm/connector: hdmi: Validate supported_formats matches ycbcr_420_allowed
    d756b869bf47 ALSA: hda/realtek: Fix volume adjustment issue on Lenovo ThinkBook 16P Gen5
    52502780b235 of/unittest: Add test that of_address_to_resource() fails on non-translatable address
    c9d6afb4f9c3 drm/amd/display: Initialize denominator defaults to 1
    4b46fc30b37e drm/amd/display: Use HW lock mgr for PSR1
    a743dc255b9f scsi: iscsi: Fix redundant response for ISCSI_UEVENT_GET_HOST_STATS request
    91e698058e91 ASoC: cs42l43: Add codec force suspend/resume ops
    81aa72e17cca seccomp: Stub for !CONFIG_SECCOMP
    678c6e80babb ASoC: samsung: Add missing selects for MFD_WM8994
    5da8a2c5f369 ASoC: codecs: es8316: Fix HW rate calculation for 48Mhz MCLK
    153ac259c27f ASoC: wm8994: Add depends on MFD core
    807165b1ec1c tools/power/x86/intel-speed-select: Prefix header search path with sysroot
    e97df805b938 drm/tilcdc: Set preferred depth
    7160a4379dcc arch/arm64/configs: remove CONFIG_SM_DISPCC_8650
    6d8ac5ebe6e8 aufs6: core
    587abc1b64c4 aufs6: standalone
    1af41d30ef42 aufs6: mmap
    6ee2464d2e9d aufs6: base
    103b676505f7 aufs6: kbuild
    67281562943f qemux86: add configuration symbol to select values
    73f315ca0823 sched/isolation: really align nohz_full with rcu_nocbs
    1e4e7f8ab622 clear_warn_once: add a clear_warn_once= boot parameter
    918e7a825e8b clear_warn_once: bind a timer to written reset value
    f533f87c3758 clear_warn_once: expand debugfs to include read support
    f149ca27cba9 tools: Remove some options from CLANG_CROSS_FLAGS
    e633abe9c44e libbpf: Fix build warning on ref_ctr_off
    ec0916a4cfc1 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    03721ceb5626 perf: x86-32: explicitly include <errno.h>
    4c36c5295bb0 perf: mips64: Convert __u64 to unsigned long long
    b0200449610d perf: fix bench numa compilation
    aff0940b2212 perf: add SLANG_INC for slang.h
    ef912018d28c perf: add sgidefs.h to for mips builds
    d8860f858b87 perf: change --root to --prefix for python install
    dc38a0eee6e5 perf: add 'libperl not found' warning
    6ed51f8786da perf: force include of <stdbool.h>
    c538d4c4ac65 fat: Replace prandom_u32() with get_random_u32()
    63d94846f0c5 fat: don't use obsolete random32 call in namei_vfat
    7816667451ef FAT: Added FAT_NO_83NAME
    f81dbd60f0d5 FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    771cdefba44b FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    a24784fd8f88 yaffs2: update to v6.12 folio changes
    d0a48fd46db8 yaffs2: adapt to v6.10 i_time changes
    d097e4d4115a yaffs: fix mtime/itime field access
    4411e0d49fe3 yaffs2: update VFS ctime operations to 6.6+
    1b6619086e8b yaffs2: v6.5 fixups
    25b261ee3c54 yaffs2: Fix miscalculation of devname buffer length
    5c07936a5d1c yaffs2: convert user_namespace to mnt_idmap
    55986a1284b3 yaffs2: replace bdevname call with sprintf
    6f5508f8db8f yaffs2: convert read_page -> readfolio
    fd179a5df5d5 yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    c9a620dacdd1 yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    78588208ed17 yaffs2: v5.12+ build fixups (not runtime tested)
    8d2dddba272c yaffs: include blkdev.h
    8c1ca9ef9712 yaffs: Fix build failure by handling inode i_version with proper atomic API
    27005cbac2ed yaffs2: v5.6 build fixups
    668211c9f9b7 yaffs2: fix memory leak when /proc/yaffs is read
    285f911dcc1c yaffs: add strict check when call yaffs_internal_read_super
    ffc2ed489ccf yaffs: repair yaffs_get_mtd_device
    6dce4b70a5e3 yaffs: Fix build failure by handling inode i_version with proper atomic API
    19f283abc5d1 yaffs2: fix memory leak in mount/umount
    04e84672b571 yaffs: Avoid setting any ACL releated xattr
    4f221d6a32e2 Yaffs:check oob size before auto selecting Yaffs1
    81f36004e56b fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    26d7a3dd0054 yaffs2: adjust to proper location of MS_RDONLY
    a7016eac4540 yaffs2: import git revision b4ce1bb (jan, 2020)
    feb240bbb91e initramfs: allow an optional wrapper script around initramfs generation
    874746eaa341 drivers: gpu: drm: msm: registers: improve reproducibility
    1d42508faee8 tools: use basename to identify file in gen-mach-types
    4b055eca593d iwlwifi: select MAC80211_LEDS conditionally
    97e20e275ac0 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    6dec58319165 defconfigs: drop obselete options
    a416ccb5b6c9 linux-yocto: Handle /bin/awk issues
    7efe8a1e5158 uvesafb: provide option to specify timeout for task completion
    78d10ae07eca uvesafb: print error message when task timeout occurs
    80473b7eb8ca compiler.h: Undef before redefining __attribute_const__
    ddeff2f1a9a7 vmware: include jiffies.h
    3dcdda8912b4 Resolve jiffies wrapping about arp
    3b1507db6735 nfs: Allow default io size to be configured.
    c2fedad05f77 check console device file on fs when booting
    208d6fbada3f mount_root: clarify error messages for when no rootfs found
    dbe9454c8ea0 mconf: fix output of cflags and libraries
    7c7b224f5cce menuconfig,mconf-cfg: Allow specification of ncurses location
    b6c189c81397 modpost: mask trivial warnings
    a5cc21325ba9 kbuild: exclude meta directory from distclean processing
    361ec143c23f powerpc: serialize image targets
    605e6ccb304c arm: serialize build targets
    e94b04fcb7d2 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    44cc7f69a0a0 cpu/amd: inhibit SMP check for qemux86
    a08cb65331e6 x86_64_defconfig: Fix warnings
    8ad332ef777b mips: make current_cpu_data preempt safe
    754f05ddce3f mips: vdso: fix 'jalr $t9' crash in vdso code
    325ff78ff44d mips: Kconfig: add QEMUMIPS64 option
    99ae0eadcf11 4kc cache tlb hazard: tlbp cache coherency
    c6894c66a534 malta uhci quirks: make allowance for slow 4k(e)c
    8b52c01f3294 arm64: defconfig: remove CONFIG_IPQ_APSS_5018
    16c7629f035e drm/fb-helper: move zeroing code to drm_fb_helper_fill_var
    6b60c874cbb0 arm64: defconfig: cleanup config options
    8e44673ecd89 vexpress: Pass LOADADDR to Makefile
    f34e6805aad5 arm: ARM EABI socketcall
    94dec9b88de4 ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index ea669781b4..a3499a5118 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b92676dff0434653b4f321a626b894be5e4908d0"
-SRCREV_meta ?= "cbe89aee4d05e11b15a928dfbc216fbdbdf062d2"
+SRCREV_machine ?= "7db548fdce28b2d08c92e2c95ae59d9631df9240"
+SRCREV_meta ?= "75501dd73b672b229f8b619b5993cc7eaf09ce69"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.11"
+LINUX_VERSION ?= "6.12.12"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index fba11bdbae..8625338b4a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.11"
+LINUX_VERSION ?= "6.12.12"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "807165b1ec1c73b5c1c30e9dd376e9b568e354bd"
-SRCREV_meta ?= "cbe89aee4d05e11b15a928dfbc216fbdbdf062d2"
+SRCREV_machine ?= "c0783a952f13edb776d48fd922e9f32b72a38eb0"
+SRCREV_meta ?= "75501dd73b672b229f8b619b5993cc7eaf09ce69"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 723ffa6ec2..022aa1fda2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "97de3b6e2772d8f694107c1ee3a89fba543f81e9"
-SRCREV_machine:qemuarm64 ?= "807165b1ec1c73b5c1c30e9dd376e9b568e354bd"
-SRCREV_machine:qemuloongarch64 ?= "807165b1ec1c73b5c1c30e9dd376e9b568e354bd"
-SRCREV_machine:qemumips ?= "4a649d3eec0ace22715f0b6a032cd5cd09c288f0"
-SRCREV_machine:qemuppc ?= "807165b1ec1c73b5c1c30e9dd376e9b568e354bd"
-SRCREV_machine:qemuriscv64 ?= "807165b1ec1c73b5c1c30e9dd376e9b568e354bd"
-SRCREV_machine:qemuriscv32 ?= "807165b1ec1c73b5c1c30e9dd376e9b568e354bd"
-SRCREV_machine:qemux86 ?= "807165b1ec1c73b5c1c30e9dd376e9b568e354bd"
-SRCREV_machine:qemux86-64 ?= "807165b1ec1c73b5c1c30e9dd376e9b568e354bd"
-SRCREV_machine:qemumips64 ?= "ca06e8a2e78be9c42c22cb6da65a852acb3c0049"
-SRCREV_machine ?= "807165b1ec1c73b5c1c30e9dd376e9b568e354bd"
-SRCREV_meta ?= "cbe89aee4d05e11b15a928dfbc216fbdbdf062d2"
+SRCREV_machine:qemuarm ?= "54de9d68cb5f13c7229c1a4a3d733042a450a2d5"
+SRCREV_machine:qemuarm64 ?= "c0783a952f13edb776d48fd922e9f32b72a38eb0"
+SRCREV_machine:qemuloongarch64 ?= "c0783a952f13edb776d48fd922e9f32b72a38eb0"
+SRCREV_machine:qemumips ?= "26293c8635512cec43c94c9b9c40efa39a021341"
+SRCREV_machine:qemuppc ?= "c0783a952f13edb776d48fd922e9f32b72a38eb0"
+SRCREV_machine:qemuriscv64 ?= "c0783a952f13edb776d48fd922e9f32b72a38eb0"
+SRCREV_machine:qemuriscv32 ?= "c0783a952f13edb776d48fd922e9f32b72a38eb0"
+SRCREV_machine:qemux86 ?= "c0783a952f13edb776d48fd922e9f32b72a38eb0"
+SRCREV_machine:qemux86-64 ?= "c0783a952f13edb776d48fd922e9f32b72a38eb0"
+SRCREV_machine:qemumips64 ?= "fbd5391a051877d18b4ec30d172bd2d4cb266276"
+SRCREV_machine ?= "c0783a952f13edb776d48fd922e9f32b72a38eb0"
+SRCREV_meta ?= "75501dd73b672b229f8b619b5993cc7eaf09ce69"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "62b2447ec6cf3f8ce4b768cacd7b787a04f54a14"
+SRCREV_machine:class-devupstream ?= "d914acc16b5910bf9b46e2e8b441569bfe180d1b"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.11"
+LINUX_VERSION ?= "6.12.12"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


