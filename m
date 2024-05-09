Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F62C25B77
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 12:05:50 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.8636.1715256346060368337
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 May 2024 05:05:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lGwNZItY;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6f467fb2e66so735368b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 05:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1715256345; x=1715861145; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jcvUHcUsFDfAM9PsYll0NrPwRSJD8lihIGArMYpylYU=;
        b=lGwNZItY54WvdQSjDKrClxOmxy0wWWWMIEQZIvewxN7Ytt3jGPX/BUj11vnql5mVtp
         WCsFGkOBkoYlMTn2EWSW/S8tis/TxIzVAh2M6cpNTJyZWyduDxX3k8+nOYEZ1QxkHsym
         avRHhr9q7xJHCTfTouB2Gg3bh/YkZB0h4sKMBkJYFmdIINTFmw4qdHz6LFwpnJ73Nc/X
         TuFpE8nVlZokWNN3mXsB2rVGkN6Mv3nohWMK9iMFmA9qoFD2Su/Pr7n0eo6wGLj0zLnp
         xguiOdqv65Qm2hi1UghwRVV+XrC8IzQyfcEGLRzTDR3NNkWwRS0uQEYLOJLzHppIksx/
         KEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715256345; x=1715861145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jcvUHcUsFDfAM9PsYll0NrPwRSJD8lihIGArMYpylYU=;
        b=BqSjj6M2X8uufYNdEnapkxLcuoWYUCtp2MOTQjMo4043RPMg+4vgPsHJnAD86Sl9DF
         hpD6DHv3jKYD35F5wpyJPIm58EMWtxg/5CVDGvqfhcVPOLZOA3/pTn2CWXw9KNiRrvuD
         64BnRF4uPelI0ufo+K1FaWoG7KmbPZM7eN1cowQSwA0tBNkzU1/O6evLQs91hLNi0WhI
         zbfFbSMjMV6avFmqcTjld1ci2B1aGcr6TG478jZ+ARnHO7sTflLbeUSWXcZosCLf5L45
         3M8B1HOwAwHXzrVDn5ldoq9diJH3sWy8kTk1gPZvlYhZeQEoc8G+BC8sEOLxLU2kIzLC
         YCrA==
X-Gm-Message-State: AOJu0YzLu0gjB3lCIqa7EbKQpnnM525kXR+HS1UfN+XM+5zTiWl8tZW0
	Ir26m4w2SClAtKCpkitzksvsmzgNCTbUVpxtborhpJixebrUmwI5fqUmXSJ4uvquJPvK1xalWEp
	0
X-Google-Smtp-Source: AGHT+IEJD9DEpkuPZB+Zsu08Sxn4LDPgnpxn6fK/4ClcnygLB01zAuEvPh2hrzzjvYo/PMFaNfuSng==
X-Received: by 2002:a05:6a20:9e4d:b0:1a8:e79a:2b0a with SMTP id adf61e73a8af0-1afc8ae9414mr6658388637.0.1715256344904;
        Thu, 09 May 2024 05:05:44 -0700 (PDT)
Received: from xps13.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2af2c41sm1185613b3a.172.2024.05.09.05.05.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 05:05:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/23] linux-yocto/5.15: update to v5.15.156
Date: Thu,  9 May 2024 05:04:54 -0700
Message-Id: <3b229158f19e99588ad714eb993a5618a8f27540.1715256149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715256149.git.steve@sakoman.com>
References: <cover.1715256149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 12:05:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199163

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    b8086c3c1548 reiserfs: Avoid touching renamed directory if parent does not change
    ea091017ef62 ipv6: Fix data races around sk->sk_prot.
    ff8710da80ee ipv6: annotate some data-races around sk->sk_prot
    e8c2eafaaa6a tcp: Fix data races around icsk->icsk_af_ops.
    c52b9710c83d Linux 5.15.156
    88168b947c34 drm/i915/cdclk: Fix CDCLK programming order when pipes are active
    b2bf58581baa x86/bugs: Replace CONFIG_SPECTRE_BHI_{ON,OFF} with CONFIG_MITIGATION_SPECTRE_BHI
    d315f5eba585 x86/bugs: Remove CONFIG_BHI_MITIGATION_AUTO and spectre_bhi=auto
    ebba2270ab74 x86/bugs: Clarify that syscall hardening isn't a BHI mitigation
    e47d1cbde759 x86/bugs: Fix BHI handling of RRSBA
    b4f2718f3d9b x86/bugs: Rename various 'ia32_cap' variables to 'x86_arch_cap_msr'
    c768db14db8e x86/bugs: Cache the value of MSR_IA32_ARCH_CAPABILITIES
    145d9930a151 x86/bugs: Fix BHI documentation
    2c761457ef18 x86/bugs: Fix return type of spectre_bhi_state()
    c6fd0e4f0069 irqflags: Explicitly ignore lockdep_hrtimer_exit() argument
    69843741d64f x86/apic: Force native_apic_mem_read() to use the MOV instruction
    c2981e32cf46 selftests: timers: Fix abs() warning in posix_timers test
    70688450ddda x86/cpu: Actually turn off mitigations by default for SPECULATION_MITIGATIONS=n
    e8f4a290abe9 perf/x86: Fix out of range data
    acf9b01d344f vhost: Add smp_rmb() in vhost_vq_avail_empty()
    d2dc6600d4e3 drm/client: Fully protect modes[] with dev->mode_config.mutex
    773d38f42bbe btrfs: qgroup: correctly model root qgroup rsv in convert
    23b57c556609 iommu/vt-d: Allocate local memory for page request queue
    81f3ad644fbf tracing: hide unused ftrace_event_id_fops
    fdfbf54d128a net: ena: Fix incorrect descriptor free behavior
    ec25a9ce095a net: ena: Wrong missing IO completions check order
    e667a05cbb39 net: ena: Fix potential sign extension issue
    e76c2678228f af_unix: Fix garbage collector racing against connect()
    37120fa8d92a af_unix: Do not use atomic ops for unix_sk(sk)->inflight.
    22641478d80f net: dsa: mt7530: trap link-local frames regardless of ST Port State
    26515606ecb5 net: sparx5: fix wrong config being used when reconfiguring PCS
    7aaee12b804c net/mlx5: Properly link new fs rules into the tree
    97dab36e57c6 netfilter: complete validation of user input
    4b19e9507c27 ipv6: fix race condition between ipv6_get_ifaddr and ipv6_del_addr
    6179cdbfe05d ipv4/route: avoid unused-but-set-variable warning
    ed94af8d07d5 ipv6: fib: hide unused 'pn' variable
    98b3e282623f octeontx2-af: Fix NIX SQ mode and BP config
    b4bc99d04c68 af_unix: Clear stale u->oob_skb.
    3c1ae6de74e3 geneve: fix header validation in geneve[6]_xmit_skb
    f0a068de65d5 xsk: validate user input for XDP_{UMEM|COMPLETION}_FILL_RING
    a9dca26b745e u64_stats: Disable preemption on 32bit UP+SMP PREEMPT_RT during updates.
    11e04135b087 net: openvswitch: fix unwanted error log on timeout policy probing
    8c820f7c8e9b scsi: qla2xxx: Fix off by one in qla_edif_app_getstats()
    5562dbfcf59b nouveau: fix function cast warning
    8d278fc34cdd Revert "drm/qxl: simplify qxl_fence_wait"
    42beda7db44f arm64: dts: imx8-ss-conn: fix usdhc wrong lpcg clock order
    cc7b83f04b43 media: cec: core: remove length check of Timer Status
    75193678cce9 Bluetooth: Fix memory leak in hci_req_sync_complete()
    53e494b7bc43 ring-buffer: Only update pages_touched when a new page is touched
    87b6af1a7683 batman-adv: Avoid infinite loop trying to resize local TT
    8d1bab770956 locking/rwsem: Disable preemption while trying for rwsem lock
    7c82dac02886 block, loop: support partitions without scanning
    45f504f301d4 bpftool: Fix pretty print dump for maps without BTF loaded
    1f24338cb789 jbd2: Drop the merge conflicted hunk
    e1d0e3c51bde tpm: tis_i2c: Limit write bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    1abe841fe331 tpm: tis_i2c: Limit read bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    6224acfc1d56 tpm: Add flag to use default cancellation policy
    1cd19d48fb90 tpm: tis_i2c: Fix sanity check interrupt enable mask
    a883da132fa8 tpm: Add tpm_tis_i2c backend for tpm_tis_core
    a742ac8a1c51 tpm: Add tpm_tis_verify_crc to the tpm_tis_phy_ops protocol layer
    ef495c5f45f2 tpm: Remove read16/read32/write32 calls from tpm_tis_phy_ops
    1f3be2e23aa6 gcc-plugins: Reorganize gimple includes for GCC 13
    24615a3b932a ata: ahci: fix enum constants for gcc-13
    5d6cb145541a net: stmmac: Enable mac_managed_pm phylink config
    fd93aabb4287 tools/resolve_btfids: Use pkg-config to locate libelf
    130f9da78406 tools/resolve_btfids: Build with host flags
    00f2f1a782f9 tools/resolve_btfids: Support cross-building the kernel with clang
    17776a4ba9c2 tools/resolve_btfids: Install libbpf headers when building
    7c9808380d70 libbpf: Make libbpf_version.h non-auto-generated
    37ae1ba791ac libbpf: Add LIBBPF_DEPRECATED_SINCE macro for scheduling API deprecations
    a2667e6d7314 drm/radeon: free iio for atombios when driver shutdown
    f100c753aa1f powerpc: Fix reschedule bug in KUAP-unlocked user copy
    da5513f30187 libbpf: Fix build warning on ref_ctr_off
    4c5a089621a8 perf python: Account for multiple words in CC
    1c5699ee85d4 fs: move S_ISGID stripping into the vfs_*() helpers
    838f5d0701d8 fs: add mode_strip_sgid() helper
    d97172683641 squashfs: provide backing_dev_info in order to disable read-ahead
    ed037d7be40c irq_work: use kasan_record_aux_stack_noalloc() record callstack
    1363bd7dbde3 ixgbevf: add disable link state
    e5601ae2bd24 ixgbe: add improvement for MDD response functionality
    caa57cd80575 ixgbe: add the ability for the PF to disable VF link state
    16a77bfcc7df Check /dev/console using init_stat()
    04574fd5579a tracing/arm: Have max stack tracer handle the case of return address after data
    0e51e5717018 gpiolib: cdev: Set lineevent_state::irq after IRQ register successfully
    1e6b7da6ddba drivers/base: Fix unsigned comparison to -1 in CPUMAP_FILE_MAX_BYTES
    493160901320 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    04224f725aa3 irqchip/gic-v3-its: Skip HP notifier when no ITS is registered
    6f6c2996a81c irqchip/gic-v3-its: Postpone LPI pending table freeing and memreserve
    1fa94473423f irqchip/gic-v3-its: Give the percpu rdist struct its own flags field
    6013d1ae5feb cert host tools: Stop complaining about deprecated OpenSSL functions
    efe20512212b init/Kconfig: fix CC_HAS_ASM_GOTO_TIED_OUTPUT test with dash
    a40d2daf2795 pnmtologo: use relocatable file name
    3b40d5b41155 of: configfs: remove unused variable overlay_lock
    6c085baf1838 tools: use basename to identify file in gen-mach-types
    2fca0fd71981 lib/build_OID_registry: fix reproducibility issues
    0f586f4ee8ad vt/conmakehash: improve reproducibility
    a75774679f28 OF: DT-Overlay configfs interface (v8)
    d179c639b30b x86/boot: Wrap literal addresses in absolute_pointer()
    856ec356cf91 ACPI: thermal: drop an always true check
    7614af249993 xfs: Fix -Werror=dangling-pointer work-around for older GCC
    41470215f97e xfs: Work around GCC 12 -Werror=dangling-pointer for xfs_attr_remote.o
    44a445c1922d virtio-pci: Remove wrong address verification in vp_del_vqs()
    77aa9e489eaf bpf: Disallow unprivileged bpf by default
    ebfb1822e9f9 fs/aufs: fixup 5.15.36 fixups
    4eba9348d3e2 Revert "Revert "fbdev: Hot-unplug firmware fb devices on forced removal""
    5df6d1b00f95 jbd2: fix use-after-free of transaction_t race
    2d83e8196487 jbd2: refactor wait logic for transaction updates into a common function
    07a63f760793 netfilter: conntrack: avoid useless indirection during conntrack destruction
    4e7122625996 Revert "fbdev: Hot-unplug firmware fb devices on forced removal"
    7ba4cb36fd4f rcu: Avoid alloc_pages() when recording stack
    f78574dee71e kasan: test: silence intentional read overflow warnings
    d313cb89b6b1 kasan: arm64: fix pcpu_page_first_chunk crash with KASAN_VMALLOC
    5e279d5647cc arm64: support page mapping percpu first chunk allocator
    e5bf16752dca vmalloc: choose a better start address in vm_area_register_early()
    660b3d21b46f kasan: test: bypass __alloc_size checks
    00aa7573e53a kasan: test: add memcpy test that avoids out-of-bounds write
    67becf0b1bd4 kasan: fix tag for large allocations when using CONFIG_SLAB
    bedf1e033213 workqueue, kasan: avoid alloc_pages() when recording stack
    7195b67ce69b kasan: generic: introduce kasan_record_aux_stack_noalloc()
    bdff763f0e29 kasan: common: provide can_alloc in kasan_save_stack()
    51423ebb36ad lib/stackdepot: introduce __stack_depot_save()
    85373e66d847 lib/stackdepot: remove unused function argument
    5b6cc9b251f3 lib/stackdepot: include gfp.h
    c9f3902d8069 aufs: reduce overhead for "code present but disabled" use case.
    b98d189df02c aufs: bugfix, umount passes NULL to ->parse_monolithic()
    13b883cbbbd9 aufs standalone: cosmetic, missing copyright sentence
    21f8b0d81898 aufs: 5.15.5-20220117 ---> 5.15.5-20220221
    6199fd896645 aufs: tiny, headers after fs_context
    8ddb40e31c29 aufs: fs_context 7/7, finally remount
    69035f71c6fd aufs: fs_context 6/7, now mount
    bc841b970697 aufs: fs_context 5/7, parse all other mount options
    435188053da2 aufs: fs_context 4/7, parse xino options
    9af1f1825cbd aufs: fs_context 3/7, parse the branch-management options
    1c05eb767f8c aufs: fs_context 2/7, parse "br" mount option
    a8488f603134 aufs: fs_context 1/7, skelton of the new shceme
    8e32e0015564 aufs: pre fs_context, convert a static flag to a macro
    f90cb4144aec aufs: pre fs_context, support the incomplete sb and sbinfo case
    948762ef859c aufs: pre fs_context, convert the type of alloc_sbinfo()
    77151a08776b aufs: 5.15.5-20211129 ---> 5.15.5-20220117
    2539adbbbe1e aufs: 5.14-20211018 ---> 5.15.5-20211129
    7d32b25193c4 aufs: for v5.15-rc1, sync_inode() is gone
    66ec0c509225 aufs: for v5.15-rc1, new param 'rcu' for ->get_acl()
    69709dc518cd aufs: for v5.15-rc1, no mand-lock anymore
    ada8fe9543e5 aufs: 5.14-20210906  ---> 5.14-20211018
    b77f7f3f394a Revert "aufs: adjust to v5.15 fs changes"
    81bdce5b5876 tick/nohz: WARN_ON --> WARN_ON_ONCE to prevent console saturation
    97c963889222 sched/isolation: really align nohz_full with rcu_nocbs
    871f23ad3627 Revert "ARM: defconfig: Enable ax88796c driver for Exynos boards"
    ffad0783dd5b ARM: config: multi v7: Regenerate defconifg
    5c1e1a1ff2d3 ARM: config: multi v7: Add renamed symbols
    badaf96564fe ARM: config: multi v7: Clean up enabled by default options
    34996040fc9b ARM: config: multi v7: Drop unavailable options
    7f685244afb3 powerpc/mm: Switch obsolete dssall to .long
    20301aeb1a64 riscv: fix build with binutils 2.38
    9df58d070506 powerpc/lib/sstep: fix 'ptesync' build error
    720b61fc400b x86_64_defconfig: Fix warnings
    02bf23d26bc4 arm64: defconfig: cleanup config options
    05914e2c87e5 arm: defconfig: drop unused POWER_AVS option
    ffb532fa19b9 aufs5: fix build against v5.15.3+
    a4b3abf4d96d qemux86: add configuration symbol to select values
    fee94ee09154 clear_warn_once: add a clear_warn_once= boot parameter
    3d8762d900d9 clear_warn_once: bind a timer to written reset value
    95faacac47e8 clear_warn_once: expand debugfs to include read support
    de20c4240018 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    0e4aacead9c1 perf: x86-32: explicitly include <errno.h>
    9ad92c11468e perf: mips64: Convert __u64 to unsigned long long
    09e7efe3e68a perf: fix bench numa compilation
    e79becc44fa6 perf: add SLANG_INC for slang.h
    b1033b588681 perf: add sgidefs.h to for mips builds
    cf9db484ac0b perf: change --root to --prefix for python install
    7fd052c2c562 perf: add 'libperl not found' warning
    27a437cdd469 perf: force include of <stdbool.h>
    3b99d21bec2f fat: don't use obsolete random32 call in namei_vfat
    a7e9293b506b FAT: Added FAT_NO_83NAME
    6fd0e71d9e5c FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    c379b0d324ae FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    538be0fdb124 aufs: adjust to v5.15 fs changes
    f45da75c8759 aufs5: core
    047f57e07e01 aufs5: standalone
    029fc15574c8 aufs5: mmap
    610d0192ee94 aufs5: base
    d4e428d0ec5f aufs5: kbuild
    eb067eca251a yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    286af18d0875 yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    24d59a4e26a6 yaffs2: v5.12+ build fixups (not runtime tested)
    22c73536d5d7 yaffs: include blkdev.h
    506b7251bfb8 yaffs: fix misplaced variable declaration
    a0e26ff364dc yaffs2: v5.6 build fixups
    b10b1b2d169e yaffs2: fix memory leak when /proc/yaffs is read
    ad9adccbb214 yaffs: add strict check when call yaffs_internal_read_super
    2e3c3aec8279 yaffs: repair yaffs_get_mtd_device
    d662538516a7 yaffs: Fix build failure by handling inode i_version with proper atomic API
    70a6113ee2c7 yaffs2: fix memory leak in mount/umount
    3378e4a9e404 yaffs: Avoid setting any ACL releated xattr
    ec2284edddef Yaffs:check oob size before auto selecting Yaffs1
    c2a49874051c fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    e9a5105a3e73 yaffs2: adjust to proper location of MS_RDONLY
    608807406f13 yaffs2: import git revision b4ce1bb (jan, 2020)
    89e660ece42c initramfs: allow an optional wrapper script around initramfs generation
    b179dbc9aa10 iwlwifi: select MAC80211_LEDS conditionally
    3fd5ca3673d0 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    d1f6edbf0188 arm64/perf: Fix wrong cast that may cause wrong truncation
    d202fb2caf33 defconfigs: drop obselete options
    9a27e3b5f4e7 arm64/perf: fix backtrace for AAPCS with FP enabled
    e20d8cf019b4 linux-yocto: Handle /bin/awk issues
    b6d2a3dbbd3a uvesafb: provide option to specify timeout for task completion
    adb40f1e6a1a uvesafb: print error message when task timeout occurs
    f280a1ed0962 compiler.h: Undef before redefining __attribute_const__
    4352732f268c vmware: include jiffies.h
    7954a677968d Resolve jiffies wrapping about arp
    5f28a1035d95 nfs: Allow default io size to be configured.
    0d7260ad7106 check console device file on fs when booting
    900a12e37e0a mount_root: clarify error messages for when no rootfs found
    7b878cbea726 menuconfig,mconf-cfg: Allow specification of ncurses location
    6604fc1763b3 modpost: mask trivial warnings
    0d294adb09cb kbuild: exclude meta directory from distclean processing
    a097cdd95a9e powerpc: serialize image targets
    5db6ec39a0a3 arm: serialize build targets
    cbabca27905e crtsavres: fixups for 5.4+
    7fc7656ed403 powerpc/ptrace: Disable array-bounds warning with gcc8
    a5faac5a19a2 powerpc: Disable attribute-alias warnings from gcc8
    186c54665b67 powerpc: add crtsavres.o to archprepare for kbuild
    d1ea862964ca powerpc: kexec fix for powerpc64
    2ac35b89a0f9 powerpc: Add unwind information for SPE registers of E500 core
    2e1c348a28bb mips: vdso: fix 'jalr $t9' crash in vdso code
    ec57870b303a mips: Kconfig: add QEMUMIPS64 option
    6a81b3c08107 4kc cache tlb hazard: tlbp cache coherency
    74e3b2a21e54 malta uhci quirks: make allowance for slow 4k(e)c
    22e65b63d3b4 arm/Makefile: Fix systemtap
    b7f1ab59f19e vexpress: Pass LOADADDR to Makefile
    ce2800c73bf7 arm: ARM EABI socketcall
    019d142fd956 ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index f6ff6ede18..426266e9a5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "450d764329026c622d2fcc8e0841ee8c003deb48"
-SRCREV_meta ?= "9f60e205e8e28fdf90fbceb54c6ed2aec0b42ed3"
+SRCREV_machine ?= "82bab3e1d1637710832e9fe0a222d876b5f9e9e2"
+SRCREV_meta ?= "1427f4d13f99b5b3811ef5f4207b6ff43cf1771a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.155"
+LINUX_VERSION ?= "5.15.156"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 6e59eb6ceb..1ea634f2e1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.155"
+LINUX_VERSION ?= "5.15.156"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "b662753bbd1caacf51d1cef578eceb1b58a753f0"
-SRCREV_meta ?= "9f60e205e8e28fdf90fbceb54c6ed2aec0b42ed3"
+SRCREV_machine ?= "a94a5a767e0b0014c4d1f4ac6587bd30af2b18d5"
+SRCREV_meta ?= "1427f4d13f99b5b3811ef5f4207b6ff43cf1771a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index b6d7fbf7c1..0601353e1c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "699ce07e7326d5a4143655ab8416bf7b8d641260"
-SRCREV_machine:qemuarm64 ?= "1f8f9d20707574ce56ab3ada6554c2a9cbce55fb"
-SRCREV_machine:qemumips ?= "5eeedd87a05a973e797357c61564c2e82cff7755"
-SRCREV_machine:qemuppc ?= "5f854a0765bf57db2289780152651d2b463fb41e"
-SRCREV_machine:qemuriscv64 ?= "97a728f8e22ebd7ed35066e01060e97b4a89da05"
-SRCREV_machine:qemuriscv32 ?= "97a728f8e22ebd7ed35066e01060e97b4a89da05"
-SRCREV_machine:qemux86 ?= "97a728f8e22ebd7ed35066e01060e97b4a89da05"
-SRCREV_machine:qemux86-64 ?= "97a728f8e22ebd7ed35066e01060e97b4a89da05"
-SRCREV_machine:qemumips64 ?= "9aa2c6f70ea08ee03c53ed3a96b91907db782dd8"
-SRCREV_machine ?= "97a728f8e22ebd7ed35066e01060e97b4a89da05"
-SRCREV_meta ?= "9f60e205e8e28fdf90fbceb54c6ed2aec0b42ed3"
+SRCREV_machine:qemuarm ?= "7125a4b2f341b906fa6ad96d7b5caab2fe031b40"
+SRCREV_machine:qemuarm64 ?= "a71076982c5b7d5f38a7c00ab4fd6f4f907e267d"
+SRCREV_machine:qemumips ?= "0d5ad939681fe4971f4895b909554d755ba72d66"
+SRCREV_machine:qemuppc ?= "46ff907d522c13b8f6fab5a0da95f7a9807e2595"
+SRCREV_machine:qemuriscv64 ?= "70388803a5a55f986721232d0160381bb8097ba3"
+SRCREV_machine:qemuriscv32 ?= "70388803a5a55f986721232d0160381bb8097ba3"
+SRCREV_machine:qemux86 ?= "70388803a5a55f986721232d0160381bb8097ba3"
+SRCREV_machine:qemux86-64 ?= "70388803a5a55f986721232d0160381bb8097ba3"
+SRCREV_machine:qemumips64 ?= "a1357daf3592cb612b67058e401d5b05aebde45e"
+SRCREV_machine ?= "70388803a5a55f986721232d0160381bb8097ba3"
+SRCREV_meta ?= "1427f4d13f99b5b3811ef5f4207b6ff43cf1771a"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "fa3df276cd36c5dbbd9deb64129d0d0f14c35dc8"
+SRCREV_machine:class-devupstream ?= "c52b9710c83d3b8ab63bb217cc7c8b61e13f12cd"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.155"
+LINUX_VERSION ?= "5.15.156"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


