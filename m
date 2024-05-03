Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1129C4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 03:00:35 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.4334.1714705226741584967
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 20:00:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dh9h7+TV;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-69b24162dd6so51715446d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 20:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714705226; x=1715310026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t1n6/eTvZWFYdfY4LGRRPqyB58OQl540Fuerj+PcS0A=;
        b=dh9h7+TVRwwvXK3A8trn9BgGpCui77CK2RfrbDA/rfaHR9AqL9TjPIYMnT3lGZQ9fD
         UBDlf63U0v/1BBni1S7UeMGEqVWgfhfv1vOBSplsOS3goQS0diWhh9EvJmQ8EQEP2ZdA
         cdFMRkqsP0m0SsNK7QEOSGOQhZ/9Cksq/x3a5W1S1yGSV6upj992PgWschDdCphDZQAF
         EpjCKTd3JENuy68c49mKOUmhjOAWFLNOIUm7iM/sFdsCBApyIJxEsn5GrM3TV7Vllm6j
         jfS+A0i30BFnRISY2okGBTGLqVlHIPcs7KT4uDENKktkDZXWnOTPgvzhvy56A7kB4IHp
         FByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714705226; x=1715310026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t1n6/eTvZWFYdfY4LGRRPqyB58OQl540Fuerj+PcS0A=;
        b=e3MAGQrLAgv0rL1hDYl3XJurPfxfjdHfGVylR6fXtAOxVFZiLN8PwWdEhFa7tHodMX
         BIDdn750Fg8JAchKCPtmShSQgqfK9L3zio3El9Gh1WwNUmasVy0P03SRZz4yW36gWOvx
         lPTurTGGnpMKt5JN2W3qvrbFOh+E4l5NUV+1oPh3P/GXN6bkVjZEG6fEawYpMfhD34Jb
         6NBpgHGodEFBQXoXQC6drgVm7H+Frn2esXY14DatJgENfz/wyWxCSgsmDKOhjImXjPcn
         BLuZSA+fMa/rBDnirqHRUzAjvN4tUnYLV1yNKuwSWCjUNgURdwM5sfQucEqJ0F2H6g8K
         UrBw==
X-Gm-Message-State: AOJu0Yw/5zbHrKYydeaABCQ5W0wgcpEuIbzCjD0gSaSxp+zId02y6uAS
	VRYSaMyuRQ2IieeVAqf0Xkh3ngIb7OyJiVage4/CitaSEHWFHrwJbK36Nw==
X-Google-Smtp-Source: AGHT+IGeuXmkndWcF0gigBBVTxVnbbK1KWFF0JsH4E9mtslk+Q3ckNFuXyfp6zRpDGSh+4rEkvAjOA==
X-Received: by 2002:a05:6214:2582:b0:6a0:c97e:ec44 with SMTP id fq2-20020a056214258200b006a0c97eec44mr1781634qvb.14.1714705225563;
        Thu, 02 May 2024 20:00:25 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id mi5-20020a056214558500b006a0fa96013asm839357qvb.138.2024.05.02.20.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 20:00:24 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 08/10] linux-yocto/6.1: update to v6.1.87
Date: Thu,  2 May 2024 23:00:13 -0400
Message-Id: <20240503030015.374078-8-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240503030015.374078-1-bruce.ashfield@gmail.com>
References: <20240503030015.374078-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 03:00:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198963

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.1 to the latest korg -stable release that comprises
the following commits:

    b140d9d4515f drm/bridge: adv7511: fix crash on irq during probe
    5c3bf5a26d61 reiserfs: Avoid touching renamed directory if parent does not change
    6741e066ec76 Linux 6.1.87
    724fbc7c0cb8 drm/amd/display: fix disable otg wa logic in DCN316
    90819b1830bc drm/amdgpu: always force full reset for SOC21
    7cc89dbcb8ea drm/amdgpu: Reset dGPU if suspend got aborted
    29bd4d05f2c5 drm/i915: Disable port sync when bigjoiner is used
    2bc1796f8eeb drm/i915/cdclk: Fix CDCLK programming order when pipes are active
    d844df110084 x86/bugs: Replace CONFIG_SPECTRE_BHI_{ON,OFF} with CONFIG_MITIGATION_SPECTRE_BHI
    7f18a0df7621 x86/bugs: Remove CONFIG_BHI_MITIGATION_AUTO and spectre_bhi=auto
    d737d8cd8e64 x86/bugs: Clarify that syscall hardening isn't a BHI mitigation
    4b0b5d621e89 x86/bugs: Fix BHI handling of RRSBA
    dc2db3e978c5 x86/bugs: Rename various 'ia32_cap' variables to 'x86_arch_cap_msr'
    b1b32586f797 x86/bugs: Cache the value of MSR_IA32_ARCH_CAPABILITIES
    662e341e57cc x86/bugs: Fix BHI documentation
    0d433e40827d x86/bugs: Fix return type of spectre_bhi_state()
    d447d8de840c irqflags: Explicitly ignore lockdep_hrtimer_exit() argument
    22f51ddb0cc1 x86/apic: Force native_apic_mem_read() to use the MOV instruction
    881b495ed26b selftests: timers: Fix abs() warning in posix_timers test
    9c09773917fb x86/cpu: Actually turn off mitigations by default for SPECULATION_MITIGATIONS=n
    0c182182d6d9 perf/x86: Fix out of range data
    a2c1c0cfab05 vhost: Add smp_rmb() in vhost_enable_notify()
    f6e2d61dc159 vhost: Add smp_rmb() in vhost_vq_avail_empty()
    18c8cc6680ce drm/client: Fully protect modes[] with dev->mode_config.mutex
    8a6fea3fcb57 drm/ast: Fix soft lockup
    d29b50a32c27 drm/amdkfd: Reset GPU on queue preemption failure
    4b53d7d620c4 drm/i915/vrr: Disable VRR when using bigjoiner
    62029bc9ff2c kprobes: Fix possible use-after-free issue on kprobe registration
    88dd8bb129fc io_uring/net: restore msg_control on sendzc retry
    c00146b399a5 btrfs: qgroup: convert PREALLOC to PERTRANS after record_root_in_trans
    06fe99985427 btrfs: record delayed inode root in transaction
    cb3131b5a204 btrfs: qgroup: correctly model root qgroup rsv in convert
    5f1205b86bd0 iommu/vt-d: Allocate local memory for page request queue
    91580ea48b6d tracing: hide unused ftrace_event_id_fops
    19ff8fed3338 net: ena: Fix incorrect descriptor free behavior
    7d44e12efb7d net: ena: Wrong missing IO completions check order
    4dea83d483d5 net: ena: Fix potential sign extension issue
    b75722be422c af_unix: Fix garbage collector racing against connect()
    fb6d14e23d48 af_unix: Do not use atomic ops for unix_sk(sk)->inflight.
    19643bf8c9b5 net: dsa: mt7530: trap link-local frames regardless of ST Port State
    8edb087c44a4 net: sparx5: fix wrong config being used when reconfiguring PCS
    88a50c8a5048 net/mlx5e: HTB, Fix inconsistencies with QoS SQs number
    ad26f26abd35 net/mlx5e: Fix mlx5e_priv_init() cleanup flow
    2e8dc5cffc84 net/mlx5: Properly link new fs rules into the tree
    c760089aa982 netfilter: complete validation of user input
    9d42f3733912 Bluetooth: L2CAP: Fix not validating setsockopt user input
    7bc65d23ba20 Bluetooth: SCO: Fix not validating setsockopt user input
    de76ae9ea1a6 ipv6: fix race condition between ipv6_get_ifaddr and ipv6_del_addr
    03d564999fa8 ipv4/route: avoid unused-but-set-variable warning
    2c46877f5f93 ipv6: fib: hide unused 'pn' variable
    7e33f68791eb octeontx2-af: Fix NIX SQ mode and BP config
    84a352b7eba1 af_unix: Clear stale u->oob_skb.
    492337a4fbd1 net: ks8851: Handle softirqs at the end of IRQ thread to fix hang
    be033154523f net: ks8851: Inline ks8851_rx_skb()
    ecedcd7e3985 bnxt_en: Reset PTP tx_avail after possible firmware reset
    4a1b65d1e55d geneve: fix header validation in geneve[6]_xmit_skb
    2a523f14a3f5 xsk: validate user input for XDP_{UMEM|COMPLETION}_FILL_RING
    ac1c10b4ebdf u64_stats: fix u64_stats_init() for lockdep when used repeatedly in one file
    0b445005599d net: openvswitch: fix unwanted error log on timeout policy probing
    9fc74e367be4 scsi: qla2xxx: Fix off by one in qla_edif_app_getstats()
    438b9a71b25a scsi: hisi_sas: Modify the deadline for ata_wait_after_reset()
    b7dc2e6b8798 nouveau: fix function cast warning
    84fb60063509 Revert "drm/qxl: simplify qxl_fence_wait"
    24c0c5867ad2 arm64: dts: imx8-ss-conn: fix usdhc wrong lpcg clock order
    49054b3ed249 media: cec: core: remove length check of Timer Status
    bccc8d155092 PM: s2idle: Make sure CPUs will wakeup directly on resume
    bd9b94055c3d drm/amd/pm: fixes a random hang in S4 for SMU v13.0.4/11
    66fab1e120b3 Bluetooth: Fix memory leak in hci_req_sync_complete()
    2d5f12de4cf5 ring-buffer: Only update pages_touched when a new page is touched
    3fe79b2c8346 batman-adv: Avoid infinite loop trying to resize local TT
    0559b2d759be ata: libata-scsi: Fix ata_scsi_dev_rescan() error path
    ca5962bdc53c smb3: fix Open files on server counter going negative
    cc4860dd1375 Subject: [PATCH v6.1] powerpc: drop duplicate entry in Makefile for lib dir
    e083231c43f3 net: fix IPSTATS_MIB_OUTFORWDATAGRAMS increment after fragment check
    6ee7f29fed8c net: ipv4, ipv6: fix IPSTATS_MIB_OUTOCTETS increment duplicated
    a771780cdf4a net: fix IPSTATS_MIB_OUTPKGS increment in OutForwDatagrams.
    8a9f2d0717f0 riscv: Fix build with CONFIG_CC_OPTIMIZE_FOR_SIZE=y
    44fd0c7a5a79 tick/rcu: fix false positive "softirq work is pending" messages on RT
    786775632028 kernel/sched: Fix double free on invalid isolcpus/nohz_full params
    4675ec8d0b9a kernel/sched: Fix uninitialized read in nohz_full/isolcpus setup
    f46dc32a8617 bpf: btf: limit logging of ignored BTF mismatches
    4687b40201db Revert "Revert "tick/common: Align tick period with the HZ tick.""
    947f660bde07 Revert "tick/common: Align tick period with the HZ tick."
    dded404c66bb yaffs2: Fix miscalculation of devname buffer length
    30350f237490 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    0ac32a83ca02 OF: DT-Overlay configfs interface (v8)
    0b07d2478b6b fat: Replace prandom_u32() with get_random_u32()
    927b66bfd641 aufs6: core
    2af5eb310b11 aufs6: standalone
    e6537c94f033 aufs6: mmap
    c51d7f19876f aufs6: base
    1785f762bbbb aufs6: kbuild
    8f625cf94585 qemux86: add configuration symbol to select values
    d81fac6e842a sched/isolation: really align nohz_full with rcu_nocbs
    07c526200cb3 clear_warn_once: add a clear_warn_once= boot parameter
    61e2c52ce198 clear_warn_once: bind a timer to written reset value
    de03f5a3e6c6 clear_warn_once: expand debugfs to include read support
    d3f9a25028d4 tools: Remove some options from CLANG_CROSS_FLAGS
    0fb98cd2429a libbpf: Fix build warning on ref_ctr_off
    e156ff56a19f perf python: Account for multiple words in CC
    f06b9c6ae59d perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    1b099e82095d perf: x86-32: explicitly include <errno.h>
    5fec311e2fd2 perf: mips64: Convert __u64 to unsigned long long
    6cf30287aeaa perf: fix bench numa compilation
    bd8f67dcb8e4 perf: add SLANG_INC for slang.h
    0314b09bf6b9 perf: add sgidefs.h to for mips builds
    4a39cc37b957 perf: change --root to --prefix for python install
    3db4f4e91769 perf: add 'libperl not found' warning
    fa3d24bac29a perf: force include of <stdbool.h>
    deaadc523f8d fat: don't use obsolete random32 call in namei_vfat
    d3c72f5df9a3 FAT: Added FAT_NO_83NAME
    8f1eebeb519c FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    78b0423ccc14 FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    e998ad53fb68 yaffs2: replace bdevname call with sprintf
    1175db6bf4cb yaffs2: convert read_page -> readfolio
    beb275c683de yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    e807c9e420bd yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    2fdd54282de3 yaffs2: v5.12+ build fixups (not runtime tested)
    869f41030ed8 yaffs: include blkdev.h
    e955b68f2b1f yaffs: fix misplaced variable declaration
    f089603aba1d yaffs2: v5.6 build fixups
    82da54859f0b yaffs2: fix memory leak when /proc/yaffs is read
    2c4cf6808649 yaffs: add strict check when call yaffs_internal_read_super
    e7dadb47ef11 yaffs: repair yaffs_get_mtd_device
    f2e29be130f7 yaffs: Fix build failure by handling inode i_version with proper atomic API
    8ea43ac7f3a3 yaffs2: fix memory leak in mount/umount
    56db60d0abd2 yaffs: Avoid setting any ACL releated xattr
    023baea095bc Yaffs:check oob size before auto selecting Yaffs1
    409d39918661 fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    4bf42c774804 yaffs2: adjust to proper location of MS_RDONLY
    08696e21a84c yaffs2: import git revision b4ce1bb (jan, 2020)
    ca3d9f546a60 initramfs: allow an optional wrapper script around initramfs generation
    301742baace5 pnmtologo: use relocatable file name
    aba96ccce7d9 tools: use basename to identify file in gen-mach-types
    e195c32ca7c7 lib/build_OID_registry: fix reproducibility issues
    876e2f1f7726 vt/conmakehash: improve reproducibility
    28b7a366cfef iwlwifi: select MAC80211_LEDS conditionally
    69933d85f61e net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    5a308d8f142a arm64/perf: Fix wrong cast that may cause wrong truncation
    339523a797e9 defconfigs: drop obselete options
    3d751aeb9bcd arm64/perf: fix backtrace for AAPCS with FP enabled
    86fa47f362ae linux-yocto: Handle /bin/awk issues
    86f04668ef6e uvesafb: provide option to specify timeout for task completion
    0db5521a1b3c uvesafb: print error message when task timeout occurs
    710303c12e99 compiler.h: Undef before redefining __attribute_const__
    14a0ede85080 vmware: include jiffies.h
    e232e6ffe081 Resolve jiffies wrapping about arp
    c16abf2d705f nfs: Allow default io size to be configured.
    9e9e885f4a6c check console device file on fs when booting
    0ce0ce443d58 mount_root: clarify error messages for when no rootfs found
    32449db67de8 menuconfig,mconf-cfg: Allow specification of ncurses location
    c55f1054bdce modpost: mask trivial warnings
    30a45d4ee261 kbuild: exclude meta directory from distclean processing
    0890b10d8fb1 powerpc: serialize image targets
    6c0feb81c3ae arm: serialize build targets
    77fa1b70cdbd crtsavres: fixups for 5.4+
    cd107e4edd5f crtsavres: fixups for 5.4+
    8f763b35ae5b powerpc/ptrace: Disable array-bounds warning with gcc8
    fe6f93755196 powerpc: Disable attribute-alias warnings from gcc8
    9b7097364b87 powerpc: add crtsavres.o to archprepare for kbuild
    c106cd86a07b powerpc: kexec fix for powerpc64
    33b7738c61fc powerpc: Add unwind information for SPE registers of E500 core
    c04e26a9beda mips: vdso: fix 'jalr $t9' crash in vdso code
    4733368eab80 mips: Kconfig: add QEMUMIPS64 option
    ec2df6ae5ee5 4kc cache tlb hazard: tlbp cache coherency
    c8c511fae0f0 malta uhci quirks: make allowance for slow 4k(e)c
    b2bf1b6e971a arm64: defconfig: cleanup config options
    a40a34b02336 vexpress: Pass LOADADDR to Makefile
    7c51524611bb arm: ARM EABI socketcall
    1f6e77027c24 ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index aac0e26210..a1b3e2d33c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7a63ce6bf87492f09a8c685bf99e9a09af97c71b"
-SRCREV_meta ?= "3e8602affb44aa12dc7ea436c5ec8514fccb5870"
+SRCREV_machine ?= "d8b7bfb52d81a60cce39809fb105d760a359def1"
+SRCREV_meta ?= "2ccedc62a19929df39eef4a5f2255b6f03652b31"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.86"
+LINUX_VERSION ?= "6.1.87"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 486534f3cf..2f99c068c1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.86"
+LINUX_VERSION ?= "6.1.87"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "3726df7e9d76ef8836dcf3a34b8cae6ba0aaa594"
-SRCREV_meta ?= "3e8602affb44aa12dc7ea436c5ec8514fccb5870"
+SRCREV_machine ?= "9bf85a364245b2c3b98879c869725adbf8fb37ca"
+SRCREV_meta ?= "2ccedc62a19929df39eef4a5f2255b6f03652b31"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 0b417c471f..ad19080bc7 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "a817e2cafd9a6f3bc48d9e88cc92330d748e0993"
-SRCREV_machine:qemuarm64 ?= "3726df7e9d76ef8836dcf3a34b8cae6ba0aaa594"
-SRCREV_machine:qemuloongarch64 ?= "3726df7e9d76ef8836dcf3a34b8cae6ba0aaa594"
-SRCREV_machine:qemumips ?= "70d990757526c642411d8a238be6f7a331dbff2c"
-SRCREV_machine:qemuppc ?= "ec55f0fb16cfa7335361c8532ccc0883d37d05f5"
-SRCREV_machine:qemuriscv64 ?= "3726df7e9d76ef8836dcf3a34b8cae6ba0aaa594"
-SRCREV_machine:qemuriscv32 ?= "3726df7e9d76ef8836dcf3a34b8cae6ba0aaa594"
-SRCREV_machine:qemux86 ?= "3726df7e9d76ef8836dcf3a34b8cae6ba0aaa594"
-SRCREV_machine:qemux86-64 ?= "3726df7e9d76ef8836dcf3a34b8cae6ba0aaa594"
-SRCREV_machine:qemumips64 ?= "219c6fc52eede3be9e7e3ae5b64bdb16f57b5dca"
-SRCREV_machine ?= "3726df7e9d76ef8836dcf3a34b8cae6ba0aaa594"
-SRCREV_meta ?= "3e8602affb44aa12dc7ea436c5ec8514fccb5870"
+SRCREV_machine:qemuarm ?= "80e50241e06c17d0ba9d637bbd2e01aeadc0b385"
+SRCREV_machine:qemuarm64 ?= "9bf85a364245b2c3b98879c869725adbf8fb37ca"
+SRCREV_machine:qemuloongarch64 ?= "9bf85a364245b2c3b98879c869725adbf8fb37ca"
+SRCREV_machine:qemumips ?= "32a30aff77ba61611596d04faab7658d2e3d9154"
+SRCREV_machine:qemuppc ?= "c2dc480743bc2fa933761e7c68f01d973875f6d9"
+SRCREV_machine:qemuriscv64 ?= "9bf85a364245b2c3b98879c869725adbf8fb37ca"
+SRCREV_machine:qemuriscv32 ?= "9bf85a364245b2c3b98879c869725adbf8fb37ca"
+SRCREV_machine:qemux86 ?= "9bf85a364245b2c3b98879c869725adbf8fb37ca"
+SRCREV_machine:qemux86-64 ?= "9bf85a364245b2c3b98879c869725adbf8fb37ca"
+SRCREV_machine:qemumips64 ?= "fce0b9ab6a695ab8a214c65f22a5f58ad623b1f9"
+SRCREV_machine ?= "9bf85a364245b2c3b98879c869725adbf8fb37ca"
+SRCREV_meta ?= "2ccedc62a19929df39eef4a5f2255b6f03652b31"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "cd5d98c0556cd790f78a3ba26afc9d2f896163e4"
+SRCREV_machine:class-devupstream ?= "6741e066ec7633450d3186946035c1f80c4226b8"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -45,7 +45,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.86"
+LINUX_VERSION ?= "6.1.87"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


