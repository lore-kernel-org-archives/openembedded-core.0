Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F89BCF536E
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 12:35:01 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.7684.1729686899206092697
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 05:34:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BtUe0Fwf;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20c803787abso6815205ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 05:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729686898; x=1730291698; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5VFpo0FwaRXz4MY5BV1gNa18O0l3ivR3i1D9J4yuxgY=;
        b=BtUe0FwfxsLF2dZBTboXkYxDY+ew+27382MxeFWy0ChGGYIjaPNMVCLFQaoW6f/N2p
         mhxBfyKTuYWQSW/Qf/cPDDI2qWUVpPHOcbY/eNiztv1eq4uQde9EybB8qLEAHCYEfmH1
         HcwgnU7F1iJpTnx/v1aTBplS2rqwTZFMCC3SdG4kRnUS/fhXoZmCPKaeKkjugDxzcqnK
         8Dw6kH536+GMQ3gVWSayQ+KOcwRyBjIQdFmXV+T+1BGU4CVZME6DCbx1TSdLbTx5O5pl
         TOUmUVNCOt1Mk+KulN2kXccBaOo5oDfMB7QzOwRwdyAwJjbCWkTJS/H7zJHXXHQiRzfx
         oYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729686898; x=1730291698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5VFpo0FwaRXz4MY5BV1gNa18O0l3ivR3i1D9J4yuxgY=;
        b=Q2APBl+0oil3ExxlbAGNzmcTOh97J0keM99jMoUFb3CBKcJeviNEjAoYq8oKVb89Cw
         mUquvPGNfKzxEfv/43/3dufLD3CjW35WRApvpCscKoHSM2XvC5DD8pGgG32pYkeNldXr
         5o7sNHENr5zYMGKCUS+qHJvBkS/5yzzaI/fFHlmJG1ADFbbf3iABWzPL9iIDj+7thutZ
         ph739HLFtGO2kmcMwXFzW3r+M2w00ClN9pbgJ5sVWE1uQnz/awnmuiLnX9xsxmKmTnuX
         0SZYXXVSkWXIEGZALRzTyfYmqez1mzmRn8BdZKmBXp8+L0Bt5Gvaq4Z4X27kzYZd9vOt
         oTKw==
X-Gm-Message-State: AOJu0Yzry68t6ZsqGVEb9Ysq+/YQlDtlPyQ9HsRhIbVj+MpdhxzgpqAF
	EIleRDpCvlddD/BMpzhecx9NYXA81XCswDReyxkXrPJkoahRGwEwTuK31jCURQ7+YBwu6nK3NH1
	w
X-Google-Smtp-Source: AGHT+IEwupix5pzAfX+PdyWRfwIxunp43eqZ7p0F8HkWpfoxttho/4zStkgdEZtiuQUzuzt1uVEobg==
X-Received: by 2002:a17:902:cec7:b0:20c:ceaf:e65f with SMTP id d9443c01a7336-20fab359cd7mr32764335ad.25.1729686898180;
        Wed, 23 Oct 2024 05:34:58 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a40:d08b:8aa5:305c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0de3dasm57294245ad.226.2024.10.23.05.34.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:34:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 09/27] linux-yocto/6.10: update to v6.10.12
Date: Wed, 23 Oct 2024 05:34:17 -0700
Message-Id: <0807aac21aa77f7fae579be46373e17b6d3bdd67.1729686660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729686660.git.steve@sakoman.com>
References: <cover.1729686660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 12:35:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206220

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.10 to the latest korg -stable release that comprises
the following commits:

    e0081d1e9c57 Linux 6.10.12
    47e0c6b594de powercap: intel_rapl: Change an error pointer to NULL
    e872738e670d USB: usbtmc: prevent kernel-usb-infoleak
    3f24124ed89f USB: serial: pl2303: add device id for Macrosilicon MS3020
    59ea0c908ade can: mcp251xfd: move mcp251xfd_timestamp_start()/stop() into mcp251xfd_chip_start/stop()
    3f08a4a456b1 can: mcp251xfd: properly indent labels
    d285ca605b66 nvme-pci: qdepth 1 quirk
    fa9e1c1b1f38 Bluetooth: btintel_pcie: Allocate memory for driver private data
    3f9d88fbc2eb netfilter: nft_socket: Fix a NULL vs IS_ERR() bug in nft_socket_cgroup_subtree_level()
    ecc5368315af netfilter: nft_socket: make cgroupsv2 matching work with namespaces
    f8a7fa068be0 powercap/intel_rapl: Fix the energy-pkg event for AMD CPUs
    e3203070a635 powercap/intel_rapl: Add support for AMD family 1Ah
    41db9aa05600 drm: Expand max DRM device number to full MINORBITS
    7742221a263f accel: Use XArray instead of IDR for minors
    8b0a86b45ae4 drm: Use XArray instead of IDR for minors
    e4ffea01adf3 ocfs2: strict bound check before memcmp in ocfs2_xattr_find_entry()
    8e7bef408261 ocfs2: add bounds checking to ocfs2_xattr_find_entry()
    b658d9d56a8f spi: spidev: Add missing spi_device_id for jg10309-01
    dd54b7ab069f drm/amd/pm: fix the pp_dpm_pcie issue on smu v14.0.2/3
    e7a76ab59372 tools: hv: rm .*.cmd when make clean
    4e512c442da8 x86/hyperv: Set X86_FEATURE_TSC_KNOWN_FREQ when Hyper-V provides frequency
    e13431de1dfd ice: check for XDP rings instead of bpf program when unconfiguring
    8d92ea5741e1 platform/x86/amd: pmf: Make ASUS GA403 quirk generic
    cb2936c24a7a smb: client: fix hang in wait_for_response() for negproto
    ecc8b3b6cc44 spi: bcm63xx: Enable module autoloading
    ed07a5988031 drm: komeda: Fix an issue related to normalized zpos
    d8635fbd44e9 ALSA: hda: add HDMI codec ID for Intel PTL
    69e4321192d7 clk: qcom: gcc-sm8650: Don't use shared clk_ops for QUPs
    6784da0b04dc ASoC: amd: yc: Add a quirk for MSI Bravo 17 (D7VEK)
    dc41e72e33b8 spi: spidev: Add an entry for elgin,jg10309-01
    9173a2003d8e ASoC: mediatek: mt8188-mt6359: Modify key
    feff318d6d2d ASoC: fix module autoloading
    09ab4b2b460d ASoC: tda7419: fix module autoloading
    ca50510bac3c ASoC: google: fix module autoloading
    7cd03e167735 ASoC: intel: fix module autoloading
    98865eac258a ASoC: Intel: soc-acpi-cht: Make Lenovo Yoga Tab 3 X90F DMI match less strict
    62d0c6ce2cf0 can: mcp251xfd: mcp251xfd_ring_init(): check TX-coalescing configuration
    8809b849687a can: m_can: Limit coalescing to peripheral instances
    d154700d6280 wifi: iwlwifi: clear trans->state earlier upon error
    e31a0656848a wifi: mac80211: free skb on error path in ieee80211_beacon_get_ap()
    7188b7a72320 wifi: iwlwifi: mvm: don't wait for tx queues if firmware is dead
    55086c97a55d wifi: iwlwifi: mvm: pause TCM when the firmware is stopped
    5116deb3ee26 wifi: iwlwifi: mvm: fix iwl_mvm_max_scan_ie_fw_cmd_room()
    05ccaedbd651 wifi: iwlwifi: mvm: fix iwl_mvm_scan_fits() calculation
    0c211da3fcb8 wifi: iwlwifi: lower message level for FW buffer destination
    05969a694471 LoongArch: KVM: Invalidate guest steal time address on vCPU reset
    ae2b89a2a164 LoongArch: Define ARCH_IRQ_INIT_FLAGS as IRQ_NOPROBE
    3520cf2e3cc3 net: ftgmac100: Ensure tx descriptor updates are visible
    66e05bb477da platform/x86: x86-android-tablets: Make Lenovo Yoga Tab 3 X90F DMI match less strict
    6b65b4f1c4c0 platform/x86: asus-wmi: Fix spurious rfkill on UX8406MA
    32ee7b7e9d31 microblaze: don't treat zero reserved memory regions as error
    9afeb3d0c1fe hwmon: (asus-ec-sensors) remove VRM temp X570-E GAMING
    ddbb44b11292 pinctrl: at91: make it work with current gpiolib
    338425c8ba38 scsi: lpfc: Fix overflow build issue
    4b0d65561ee8 ALSA: hda/realtek - FIxed ALC285 headphone no sound
    478b57ec45bf ALSA: hda/realtek - Fixed ALC256 headphone no sound
    0aa8eca1d4dc ASoC: allow module autoloading for table board_ids
    486d4c4485fb ASoC: allow module autoloading for table db1200_pids
    4830fa8eb426 ASoC: mediatek: mt8188: Mark AFE_DAC_CON0 register as volatile
    706ddb6363c0 ASoC: SOF: mediatek: Add missing board compatible
    c4386c5293aa drivers: gpu: drm: msm: registers: improve reproducibility
    915a386c7cff qemux86: add configuration symbol to select values
    62df91b21626 sched/isolation: really align nohz_full with rcu_nocbs
    afe643f5802b clear_warn_once: add a clear_warn_once= boot parameter
    7b016793edbf clear_warn_once: bind a timer to written reset value
    89a5c70f2000 clear_warn_once: expand debugfs to include read support
    8014704c527d tools: Remove some options from CLANG_CROSS_FLAGS
    e9ca44556936 libbpf: Fix build warning on ref_ctr_off
    32fe8c972c36 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    a372ac2b798d perf: x86-32: explicitly include <errno.h>
    a5cb41682777 perf: mips64: Convert __u64 to unsigned long long
    ed8ee9f3d1ae perf: fix bench numa compilation
    6dbb2915e8a7 perf: add SLANG_INC for slang.h
    57f78dddfd93 perf: add sgidefs.h to for mips builds
    130f0306cfba perf: change --root to --prefix for python install
    2520efe95341 perf: add 'libperl not found' warning
    45731b6ae676 perf: force include of <stdbool.h>
    ace10f8dec53 fat: Replace prandom_u32() with get_random_u32()
    64797bdca14e fat: don't use obsolete random32 call in namei_vfat
    2442bae1a645 FAT: Added FAT_NO_83NAME
    7561126bce00 FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    5c51ab959876 FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    5869720658c9 aufs6: match exports to functions
    e125467cf228 aufs: adjust for v6.9+
    eebcdc6635bf aufs6: correct do_splice_from prototype
    4c5829036c45 aufs: update remove_page to remove_folio
    e8d889d0f434 aufs: i_op: Add handling for au_pin_hdir_set_owner with RT kernel
    3ecd9203de17 aufs: fix v6.7 kernel build compilation
    5e8ee028dbe2 aufs6: adapt to v6.6 i_op->ctime changes
    1132c330feed aufs6: adapt to v6.6
    d3e4ede69603 aufs6: core
    49ec9271f41d aufs6: standalone
    dcc0978da2dd aufs6: mmap
    80e1609b37e7 aufs6: base
    0dbb3f062420 aufs6: kbuild
    ad51078c5ebf yaffs: fix mtime/itime field access
    e5f1d35d6188 yaffs2: update VFS ctime operations to 6.6+
    dd374461adc7 yaffs2: v6.5 fixups
    f5908785d88d yaffs2: Fix miscalculation of devname buffer length
    d1403f0acfdf yaffs2: convert user_namespace to mnt_idmap
    7dae5463b54f yaffs2: replace bdevname call with sprintf
    92d30df4eb56 yaffs2: convert read_page -> readfolio
    6c895bffdf72 yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    6801e7d90255 yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    aff012190046 yaffs2: v5.12+ build fixups (not runtime tested)
    fb474842c16e yaffs: include blkdev.h
    fe7d745aac94 yaffs: fix misplaced variable declaration
    bee147b2e533 yaffs2: v5.6 build fixups
    22998f589ec2 yaffs2: fix memory leak when /proc/yaffs is read
    ce7d8084a976 yaffs: add strict check when call yaffs_internal_read_super
    adb7202fda95 yaffs: repair yaffs_get_mtd_device
    2852e5c15d4d yaffs: Fix build failure by handling inode i_version with proper atomic API
    1526802a8147 yaffs2: fix memory leak in mount/umount
    6c7827a16aaa yaffs: Avoid setting any ACL releated xattr
    fa3482815542 Yaffs:check oob size before auto selecting Yaffs1
    aaa4843b73ce fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    48e992af6531 yaffs2: adjust to proper location of MS_RDONLY
    f3af7160d8a0 yaffs2: import git revision b4ce1bb (jan, 2020)
    4add698ed6e8 initramfs: allow an optional wrapper script around initramfs generation
    b619a8d54336 vt/conmakehash: improve reproducibility
    c786186aeef3 tools: use basename to identify file in gen-mach-types
    aa3a8e7ceb6e iwlwifi: select MAC80211_LEDS conditionally
    325db54c4be9 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    23a87c6e13aa defconfigs: drop obselete options
    946e5b78ab94 linux-yocto: Handle /bin/awk issues
    9daee1dba585 uvesafb: provide option to specify timeout for task completion
    f68b8683441a uvesafb: print error message when task timeout occurs
    a1595c6b6017 compiler.h: Undef before redefining __attribute_const__
    8086839613c6 vmware: include jiffies.h
    32e79eb3c169 Resolve jiffies wrapping about arp
    f6fabf91b6f2 nfs: Allow default io size to be configured.
    ad2b29f801e9 check console device file on fs when booting
    5194785d545b mount_root: clarify error messages for when no rootfs found
    78b3498cb59a mconf: fix output of cflags and libraries
    9cc6870708d5 menuconfig,mconf-cfg: Allow specification of ncurses location
    f34088ed9c93 modpost: mask trivial warnings
    4784584582f5 kbuild: exclude meta directory from distclean processing
    73072b5fe25a powerpc: serialize image targets
    a120eb200320 arm: serialize build targets
    51d5719ac05b mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    5155f0bb36f0 cpu/amd: inhibit SMP check for qemux86
    e5a5996ee586 x86_64_defconfig: Fix warnings
    1359db75df0c mips: make current_cpu_data preempt safe
    385edf6090c3 mips: vdso: fix 'jalr $t9' crash in vdso code
    968266397319 mips: Kconfig: add QEMUMIPS64 option
    389ce854fde3 4kc cache tlb hazard: tlbp cache coherency
    9cab61199fa8 malta uhci quirks: make allowance for slow 4k(e)c
    80cae3bd9eea arm64: defconfig: remove CONFIG_IPQ_APSS_5018
    41c82709900f drm/fb-helper: move zeroing code to drm_fb_helper_fill_var
    59ef4f151a5e arm64: defconfig: cleanup config options
    c5fb425762ed vexpress: Pass LOADADDR to Makefile
    07a8b544d4e9 arm: ARM EABI socketcall
    574f3ae3d2ca ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a8f53385d49ca7dddd68056e3bc0e5fefbeee034)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.10.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.10.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.10.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
index b5f2b5229d..b3ea1eede4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "fa096b126e55041c72c87f74ea92116695c1e194"
-SRCREV_meta ?= "4bf82718cf80c9888c75799b1d10cde07bebd155"
+SRCREV_machine ?= "79753a918e36522e7b3ac3ef9cff14dd24eda41c"
+SRCREV_meta ?= "f176a9a323c68085e71f32718dc763d263f95fda"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.10;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.10.11"
+LINUX_VERSION ?= "6.10.12"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
index ba1d10f5d5..8e68ace57c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.10.inc
 
-LINUX_VERSION ?= "6.10.11"
+LINUX_VERSION ?= "6.10.12"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "6c956b2ea691fe2ba5521aa6c6674defb05de4fe"
-SRCREV_meta ?= "4bf82718cf80c9888c75799b1d10cde07bebd155"
+SRCREV_machine ?= "83377716b0580c5594beca4ce565eadbaa94a520"
+SRCREV_meta ?= "f176a9a323c68085e71f32718dc763d263f95fda"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.10.bb b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
index cee06c22ea..778581fbf1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.10/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.10/standard/base"
 KBRANCH:qemumips64 ?= "v6.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "121079aa57b0b3a7cc06c50c44dd13386ee622d3"
-SRCREV_machine:qemuarm64 ?= "6c956b2ea691fe2ba5521aa6c6674defb05de4fe"
-SRCREV_machine:qemuloongarch64 ?= "6c956b2ea691fe2ba5521aa6c6674defb05de4fe"
-SRCREV_machine:qemumips ?= "6fb3af96c4c0dc5453909749875b8390b66d32e6"
-SRCREV_machine:qemuppc ?= "6c956b2ea691fe2ba5521aa6c6674defb05de4fe"
-SRCREV_machine:qemuriscv64 ?= "6c956b2ea691fe2ba5521aa6c6674defb05de4fe"
-SRCREV_machine:qemuriscv32 ?= "6c956b2ea691fe2ba5521aa6c6674defb05de4fe"
-SRCREV_machine:qemux86 ?= "6c956b2ea691fe2ba5521aa6c6674defb05de4fe"
-SRCREV_machine:qemux86-64 ?= "6c956b2ea691fe2ba5521aa6c6674defb05de4fe"
-SRCREV_machine:qemumips64 ?= "37f661e601fa802d54da17d4daa343910cecb1a3"
-SRCREV_machine ?= "6c956b2ea691fe2ba5521aa6c6674defb05de4fe"
-SRCREV_meta ?= "4bf82718cf80c9888c75799b1d10cde07bebd155"
+SRCREV_machine:qemuarm ?= "b925ba006ed8d0543abde1e717601f20be5b4567"
+SRCREV_machine:qemuarm64 ?= "83377716b0580c5594beca4ce565eadbaa94a520"
+SRCREV_machine:qemuloongarch64 ?= "83377716b0580c5594beca4ce565eadbaa94a520"
+SRCREV_machine:qemumips ?= "f6d050ce5a873b8cb1c468f6f7acde929ea687fb"
+SRCREV_machine:qemuppc ?= "83377716b0580c5594beca4ce565eadbaa94a520"
+SRCREV_machine:qemuriscv64 ?= "83377716b0580c5594beca4ce565eadbaa94a520"
+SRCREV_machine:qemuriscv32 ?= "83377716b0580c5594beca4ce565eadbaa94a520"
+SRCREV_machine:qemux86 ?= "83377716b0580c5594beca4ce565eadbaa94a520"
+SRCREV_machine:qemux86-64 ?= "83377716b0580c5594beca4ce565eadbaa94a520"
+SRCREV_machine:qemumips64 ?= "6486530bf0ee464def6a814db6a4b140847c60e1"
+SRCREV_machine ?= "83377716b0580c5594beca4ce565eadbaa94a520"
+SRCREV_meta ?= "f176a9a323c68085e71f32718dc763d263f95fda"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "8a886bee7aa574611df83a028ab435aeee071e00"
+SRCREV_machine:class-devupstream ?= "e0081d1e9c57b0ee4039158a3939317c5085bfe7"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.10/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.10;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.10.11"
+LINUX_VERSION ?= "6.10.12"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


