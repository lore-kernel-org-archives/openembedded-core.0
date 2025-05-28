Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2835DC5AD49
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 19:41:31 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web10.4441.1748461281106563774
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 12:41:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LR/VUT0F;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-476b89782c3so1748751cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 12:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748461280; x=1749066080; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T4Zvm7iCmXAbrLsmFDEnBGzgc9uIxmUWY+GgIXFmOBI=;
        b=LR/VUT0FlL5qEWD8EjAJAc41iKvel33EFcgC7xd/B13JnwmofUu2zhj37hOtNaTPYY
         m3jT67J/6TOTC6KDZKJTIFjrHQAIpbRqmaOSkH9xoWpxye4l7VoW7Y7FaCQN8RO/wjA4
         4Ly7Ic0iA/wxI+bkR/L2+vRwIJFtAGbq3D0VQcHiIm2h30E6SPQy1M1IuAwuRZaRof/K
         Tfu33FwG1144tl1FNgW7bb13M3YWbK/CU6jJ9wOQ8t16lw4rWz1xGXMYhs8x4of7HIXU
         zDrWJGeJcAjqUw1IzEoSWhgnU1RIK46seObZQ0pa7LYY7iSVFzmrbaDEPOL/IyHeZLmu
         FtLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748461280; x=1749066080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T4Zvm7iCmXAbrLsmFDEnBGzgc9uIxmUWY+GgIXFmOBI=;
        b=SxfmIjiOnT/mFzdHXWZtEvMbtPokWn3M8zN5k35L42GhgNdA3EbnywLC4zyjfFjaph
         kun8lCl127Tno7ofyozNU15dri1fJzsQpF6/RSg4XG2ABzWU7sGCIUVbFyP20cvCOhdr
         Y/1HPG6F6uPnhSa9szTMUfYvwoVcA37Nc+rFaty4CwVVP/5lU4griwJ8Yox6pAUKzQgu
         VyOKy9dyCyccKwbaestyR1HedvqKpAmbkySDY2fnaMJFX58+SVq9DJGQ+sjgA4pPVSbD
         gN9ekSBG3TVbwZp5ZYF6/dcrtWLPSrkc+vuNZGWiRwbCYRKLpKNzKeJW1bIo6kUIQj0i
         ikAQ==
X-Gm-Message-State: AOJu0YxsTaemrx3bguxrKvi5omdzuPG3DUB9K6V1kfMwaid05b3mLaAM
	rXk4ALWy6NE+pMiFizmF++5dQTdXYXt0ZXNaZMp6qd/PQSQ6QNoxG4rs
X-Gm-Gg: ASbGncuFVdjGIkfrc50l6H4Rb93FZ85Gba97rFeBpan9z04X5O6Q/3yc3+leNJT6JAP
	Ey5gVmzPY3mQYxItoXXAvLQZhqdXVVOt7dZ9A7Ozw5lkXBqyS30tpNMEHP9V0fjDVMQWAz7FHYU
	SF9bQ3ElV/XjwhbRzJG+ADIV2E2Wj3s6907JxGnwCaXkBqHDETJnrhHvRlppuJ2eG0v+dKP80E4
	ObOFL0cd91v5DEfks7/2dXcMdnhndev9vzYKxLT2NGmh2osCj1+skgz4GJkhkdgQxFaNrcDvhIq
	IYRU06h5omRN3sabuSgYc65esc4zWYQQAwN37EnWHgo6lBg3gQuG51LlQBLBvTbz8pKJJd/hTn/
	3Kkumj4VUFk6YYjebVCpVALUCkXQ/NaiAXiL1Y9mH6eV9akaecGgu
X-Google-Smtp-Source: AGHT+IH1XID434lSR6mKCx5W+dQC49LD+mKvrdR6wxLpGerDzOpniazHjkWw58qHPHMvVqXaptvNaA==
X-Received: by 2002:a05:622a:5143:b0:494:a01d:a912 with SMTP id d75a77b69052e-4a3800e5675mr61921921cf.13.1748461279983;
        Wed, 28 May 2025 12:41:19 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a3c80f323bsm9577691cf.72.2025.05.28.12.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:41:19 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 1/6] linux-yocto/6.6: update to v6.6.86
Date: Wed, 28 May 2025 15:41:13 -0400
Message-Id: <20250528194118.1534655-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 19:41:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217389

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    3fa1ea3ede18 Linux 6.6.86
    72a68d2bede3 usb: gadget: uvc: Fix ERR_PTR dereference in uvc_v4l2.c
    367a281315ec serial: 8250_dma: terminate correct DMA in tx_dma_flush()
    6186fb2cd363 memstick: rtsx_usb_ms: Fix slab-use-after-free in rtsx_usb_ms_drv_remove
    2beb999f73b4 net: usb: usbnet: restore usb%d name exception for local mac addresses
    3007115c2e40 net: usb: qmi_wwan: add Telit Cinterion FE990B composition
    ad43b150e109 net: usb: qmi_wwan: add Telit Cinterion FN990B composition
    5ec93d77200e tty: serial: fsl_lpuart: disable transmitter before changing RS485 related registers
    fe14cfba6c16 tty: serial: 8250: Add Brainboxes XC devices
    be28a3dabdca tty: serial: 8250: Add some more device IDs
    52eed361c250 counter: microchip-tcb-capture: Fix undefined counter channel state on probe
    fa15592e9d92 counter: stm32-lptimer-cnt: fix error handling when enabling
    835807f54fad ALSA: hda/realtek: Support mute LED on HP Laptop 15s-du3xxx
    525104157385 netfilter: socket: Lookup orig tuple for IPv6 SNAT
    f16a097047e3 scsi: ufs: qcom: Only free platform MSIs when ESI is enabled
    3918b2016d28 reset: starfive: jh71x0: Fix accessing the empty member on JH7110 SoC
    790d30578faa mm/page_alloc: fix memory accept before watermarks gets initialized
    404d85a71d5a drm/amd/display: Don't write DP_MSTM_CTRL after LT
    5f57a96e92c6 drm/dp_mst: Add a helper to queue a topology probe
    93ccb0fb3606 drm/dp_mst: Factor out function to queue a topology probe work
    b9264aa24f62 drm/amd/display: Check denominator crb_pipes before used
    ad0410346cc4 ARM: Remove address checking for MMUless devices
    1809cabfe0e9 ARM: 9351/1: fault: Add "cut here" line for prefetch aborts
    fe17c8aaa90f ARM: 9350/1: fault: Implement copy_from_kernel_nofault_allowed()
    9da6b6340dbc atm: Fix NULL pointer dereference
    f99afc594a2b HID: hid-plantronics: Add mic mute mapping and generalize quirks
    8ecdc85b5cab ALSA: usb-audio: Add quirk for Plantronics headsets to fix control names
    6a5b2ed82152 ARM: dts: am335x-bone-common: Increase MDIO reset deassert time
    ceb5fadbf450 Revert "v6.6 -stable -rt merge fixup"
    1c2962a164ff v6.6 -stable -rt merge fixup
    18abb2787b53 x86/syscall: Mark exit[_group] syscall handlers __noreturn
    2879d995e569 pnmtologo: sync with 6.6
    43ea1c5e6eb3 lib/build_OID_registry: take -stable reproducibility changes
    35046aea43c8 bpftool: Fix undefined bpf macro for unix socket
    9a558d4b8621 tools/resolve_btfids: Fix comparison of distinct pointer types warning in resolve_btfids
    42b2eec2e503 bpftool: Query only cgroup-related attach types
    f71bb11887ba cpu/amd: inhibit SMP check for qemux86
    c31365597a17 powerpc/uaccess: Fix build errors seen with GCC 13/14
    64ebf485c56b usb: dwc3: core: remove lock of otg mode during gadget suspend/resume to avoid deadlock
    7c76aad68f6d kselftest: Add a ksft_perror() helper
    06644f0d7193 drm/tilcdc: Set preferred depth
    ff7ae7b32324 crypto: jitter - add RCT/APT support for different OSRs
    50cd24ddb6f0 arm64: defconfig: remove CONFIG_IPQ_APSS_5018
    58e5c91d6701 x86/alternatives: Disable interrupts and sync when optimizing NOPs in place
    c878fd2d4c79 x86/alternatives: Sync core before enabling interrupts
    c2d64b9f52b6 qemux86: add configuration symbol to select values
    630c33229e6d sched/isolation: really align nohz_full with rcu_nocbs
    0e5e0f68e2e6 clear_warn_once: add a clear_warn_once= boot parameter
    46934791b902 clear_warn_once: bind a timer to written reset value
    cdee9e38ff32 clear_warn_once: expand debugfs to include read support
    82b562b81841 tools: Remove some options from CLANG_CROSS_FLAGS
    36dc380b776b libbpf: Fix build warning on ref_ctr_off
    9e3e1fe20982 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    e497a4a5da65 perf: x86-32: explicitly include <errno.h>
    7b57ddd89565 perf: mips64: Convert __u64 to unsigned long long
    1cfc19423dc7 perf: fix bench numa compilation
    98bc2815fade perf: add SLANG_INC for slang.h
    17209a70b9b3 perf: add sgidefs.h to for mips builds
    9cd4258d910a perf: change --root to --prefix for python install
    8110a4f26628 perf: add 'libperl not found' warning
    bc89d5e08f77 perf: force include of <stdbool.h>
    4f6c760cc876 fat: Replace prandom_u32() with get_random_u32()
    bc53117b12b2 fat: don't use obsolete random32 call in namei_vfat
    30b2236ab378 FAT: Added FAT_NO_83NAME
    cef98d22b4ed FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    0bbd7daba9e1 FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    5883fc340084 aufs6: adapt to v6.6 i_op->ctime changes
    c4342d979bf2 aufs6: fix magic.mk include path
    35266bc2dc81 aufs6: adapt to v6.6
    8edede4e98be aufs6: core
    712248233ebe aufs6: standalone
    3b71a8a848d8 aufs6: mmap
    3e2924871f37 aufs6: base
    7f4907a93101 aufs6: kbuild
    d2f7b03e4aa7 yaffs2: update VFS ctime operations to 6.6+
    bcd6cfcd1aa0 yaffs2: v6.5 fixups
    cc615704b5f5 yaffs2: Fix miscalculation of devname buffer length
    8ef2e22dcf91 yaffs2: convert user_namespace to mnt_idmap
    c9c749f9f7d3 yaffs2: replace bdevname call with sprintf
    395b01cdc39d yaffs2: convert read_page -> readfolio
    d98b07e43ba6 yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    613c6d50fdbe yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    622c4648936f yaffs2: v5.12+ build fixups (not runtime tested)
    7562133d4090 yaffs: include blkdev.h
    dbd44252cd59 yaffs: fix misplaced variable declaration
    c223a10b1ac0 yaffs2: v5.6 build fixups
    90f6007cfbf4 yaffs2: fix memory leak when /proc/yaffs is read
    37ee169c5ea1 yaffs: add strict check when call yaffs_internal_read_super
    b6e007b8abb6 yaffs: repair yaffs_get_mtd_device
    fb98f65a466a yaffs: Fix build failure by handling inode i_version with proper atomic API
    51e0aac75ea2 yaffs2: fix memory leak in mount/umount
    2b74a0cae7b0 yaffs: Avoid setting any ACL releated xattr
    ff4130a9c376 Yaffs:check oob size before auto selecting Yaffs1
    ba95b409c67c fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    8fa35eba9056 yaffs2: adjust to proper location of MS_RDONLY
    1eb5deaad8c4 yaffs2: import git revision b4ce1bb (jan, 2020)
    4dce67c1e8c8 initramfs: allow an optional wrapper script around initramfs generation
    2f603d83fcc4 pnmtologo: use relocatable file name
    664a6a0a484b tools: use basename to identify file in gen-mach-types
    9de64bc0c185 lib/build_OID_registry: fix reproducibility issues
    ae9b80797295 vt/conmakehash: improve reproducibility
    a972323151bd iwlwifi: select MAC80211_LEDS conditionally
    15d2adcc0198 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    5556a6c04b19 arm64/perf: Fix wrong cast that may cause wrong truncation
    5552dc768ffc defconfigs: drop obselete options
    00fe4152df31 arm64/perf: fix backtrace for AAPCS with FP enabled
    3888d0652edf linux-yocto: Handle /bin/awk issues
    3d55d299f23a uvesafb: provide option to specify timeout for task completion
    23c068c080be uvesafb: print error message when task timeout occurs
    edbfc939266e compiler.h: Undef before redefining __attribute_const__
    c99ae7e2a19a vmware: include jiffies.h
    572d84d928c8 Resolve jiffies wrapping about arp
    fdcd47cac843 nfs: Allow default io size to be configured.
    927d48801098 check console device file on fs when booting
    57cc27f821dd mount_root: clarify error messages for when no rootfs found
    1b53d82a8152 mconf: fix output of cflags and libraries
    1811da09f42c menuconfig,mconf-cfg: Allow specification of ncurses location
    83c2e0c6eb1f modpost: mask trivial warnings
    6de673039484 kbuild: exclude meta directory from distclean processing
    6decd32815f5 powerpc: serialize image targets
    f6b683b38318 arm: serialize build targets
    e798b09ebf57 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    dc8a1e5a88f8 x86_64_defconfig: Fix warnings
    68491e5f72b6 powerpc/ptrace: Disable array-bounds warning with gcc8
    d71ebfce3004 powerpc: Disable attribute-alias warnings from gcc8
    62f50884b8b1 powerpc: kexec fix for powerpc64
    da6871c62c37 powerpc: Add unwind information for SPE registers of E500 core
    f161c880c11d mips: make current_cpu_data preempt safe
    5e94a8247ce7 mips: vdso: fix 'jalr $t9' crash in vdso code
    19e36714b1c7 mips: Kconfig: add QEMUMIPS64 option
    e2e537db3cbd 4kc cache tlb hazard: tlbp cache coherency
    aee9870611e5 malta uhci quirks: make allowance for slow 4k(e)c
    881948cd1517 drm/fb-helper: move zeroing code to drm_fb_helper_fill_var
    98ec1963fcb7 arm64: defconfig: cleanup config options
    f1727c537ba8 vexpress: Pass LOADADDR to Makefile
    4474c32dc24a arm: ARM EABI socketcall
    75e31a2b70fd ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index e0006035fe..83ab521399 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "4c94a7140a0416421cd82fe18703e99d7c4eec8e"
-SRCREV_meta ?= "39d19bc9f333a0bfb88cd55befe70d5da87adcf8"
+SRCREV_machine ?= "baede5a5c17bce04338fe12d6d0f8277edd43dd4"
+SRCREV_meta ?= "a56c84ea9e406a96490a0d70668e31b10675f1bd"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.85"
+LINUX_VERSION ?= "6.6.86"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 8c0617be10..49a2bb9aa4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.85"
+LINUX_VERSION ?= "6.6.86"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "50111c8145a573a5eb34859736492d3914d74f26"
-SRCREV_meta ?= "39d19bc9f333a0bfb88cd55befe70d5da87adcf8"
+SRCREV_machine ?= "754b91c970cb5001c4f1b205be0b29b0efbbe82d"
+SRCREV_meta ?= "a56c84ea9e406a96490a0d70668e31b10675f1bd"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 061837ec88..abbfdbbd43 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "c7fc26b463b6d492177ab4f3133ac709f72959e6"
-SRCREV_machine:qemuarm64 ?= "a2123abde1b536e17d6f8b41c07006b1b78fc14e"
-SRCREV_machine:qemuloongarch64 ?= "6a5b2ed821525dac9e4f3f5283376f02965d3a7b"
-SRCREV_machine:qemumips ?= "441ff4147581f8866ccb145ee1fcecb418543a46"
-SRCREV_machine:qemuppc ?= "c186535e4a16fe6524c963f40744f56d56cc37ae"
-SRCREV_machine:qemuriscv64 ?= "6a5b2ed821525dac9e4f3f5283376f02965d3a7b"
-SRCREV_machine:qemuriscv32 ?= "6a5b2ed821525dac9e4f3f5283376f02965d3a7b"
-SRCREV_machine:qemux86 ?= "6a5b2ed821525dac9e4f3f5283376f02965d3a7b"
-SRCREV_machine:qemux86-64 ?= "6a5b2ed821525dac9e4f3f5283376f02965d3a7b"
-SRCREV_machine:qemumips64 ?= "ef983636bee26dd17055fbff877a6ca4cd10e4ed"
-SRCREV_machine ?= "6a5b2ed821525dac9e4f3f5283376f02965d3a7b"
-SRCREV_meta ?= "39d19bc9f333a0bfb88cd55befe70d5da87adcf8"
+SRCREV_machine:qemuarm ?= "d5fad62ae36747211fcfda82fc984c7085c7d343"
+SRCREV_machine:qemuarm64 ?= "4469abd262a2de4c66cd5d37f9dfbfb2060d4e67"
+SRCREV_machine:qemuloongarch64 ?= "257833f963feceebad0ef58d5e5426f910349a85"
+SRCREV_machine:qemumips ?= "8dabd4628c1c131637bda6915bea0b21493b9338"
+SRCREV_machine:qemuppc ?= "1862875baa7888ec55244d0ccfe30c94f94be1a7"
+SRCREV_machine:qemuriscv64 ?= "257833f963feceebad0ef58d5e5426f910349a85"
+SRCREV_machine:qemuriscv32 ?= "257833f963feceebad0ef58d5e5426f910349a85"
+SRCREV_machine:qemux86 ?= "257833f963feceebad0ef58d5e5426f910349a85"
+SRCREV_machine:qemux86-64 ?= "257833f963feceebad0ef58d5e5426f910349a85"
+SRCREV_machine:qemumips64 ?= "1d698ed1a159dde9479181de457e51343c01cd70"
+SRCREV_machine ?= "257833f963feceebad0ef58d5e5426f910349a85"
+SRCREV_meta ?= "a56c84ea9e406a96490a0d70668e31b10675f1bd"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "d57a7c6169607dd09157ccf257e556fb75444f28"
+SRCREV_machine:class-devupstream ?= "3fa1ea3ede181bf11c329df056840b04ec2e3dca"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.85"
+LINUX_VERSION ?= "6.6.86"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


