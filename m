Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC6AFC52D71
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 17:08:31 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.30060.1722791306960445265
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Aug 2024 10:08:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xBomJH2R;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2cb510cd097so7328570a91.1
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 10:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722791306; x=1723396106; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rtO6yyu1LNfshB6nYeTJnfY7y4KfrvRLKySPB24Vz9M=;
        b=xBomJH2R6+NrB/QyOcQch8Wp2/JB7MAIfublsiAIWNe4GiwSJSP+0moeTpmElVtXQd
         8YMXJEun/4yBOAkWWbR5ZQ2UBv3ApjjMK4C32SMOp/GGdVsxDh5CImb5PsGVy6Zz1mAl
         tzPSwH5iOjVkgd8wfboc2AEYFdPzrcUk5S1sS5rdbXJggnCH9JxX6SVU8zU2NbRvwMpS
         CiRbDcMe0JeDND+3+s4HbEfLfpbHnI81FP4+i/PyfASGZbSV+XcqrNYLITSXGXcC6R60
         +5vulPgIl9QTlIGoBAtwBBqcny2zJKBrAYTbjcXswnJGc+q53z+F9JCl0QyxD6oSGscF
         Xyvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722791306; x=1723396106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rtO6yyu1LNfshB6nYeTJnfY7y4KfrvRLKySPB24Vz9M=;
        b=cpVVINrdryyIzhy1QU7IfISwuFQM2rAiJbqMpExXHv+WNrnW+hXAKCbZNekvp1h0Fs
         oknx5nnMc2GfKwuZ2IjtgyYdTFqg/sEESm8xb7X9cLjP4NcSTqmiAreV52/TOHJ12Ow+
         hSE1/07duFsYHzP77HbNzEucT6Fn7mbZtf0U2nxJ0x+zUSLGseK5wSN2/9W3/F4tLfAJ
         js9QAKaQoziEqSNrgdSm2tBCdlr9qY8z4r0Yl2+QTcybr28ygLvV9rG1KoR9FUr4cD15
         /2ycVQz1CANJaDnOeWoWqv43MaqVLMHZdlV4SJwkjWvbYgz85nK1cEPBP+8bychtfDP4
         f/fA==
X-Gm-Message-State: AOJu0Ywc3SC9APZPiMr/g7eOQ4bPBX6DEAMdcLOx8+vN1SaLQq85TdYt
	V2zN7XFKXOLv1wHozN1mJBMiuE0cxYa+SCJKj8lRafWNrRe/a3S1w03AkHJnHUqMMggA/KHrrgW
	yKpXZqQ==
X-Google-Smtp-Source: AGHT+IEyoCOWP8fEe00S3bGKVB60UXzEPjbMJCaR++Co3KlN+QrD6rIxOIT6fBgQVdt47jukhg0LQA==
X-Received: by 2002:a17:90a:e601:b0:2d0:680:48c9 with SMTP id 98e67ed59e1d1-2d00680b4c4mr8716601a91.13.1722791305881;
        Sun, 04 Aug 2024 10:08:25 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cfdc4e3c41sm8714415a91.48.2024.08.04.10.08.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 10:08:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/8] linux-yocto/5.15: update to v5.15.158
Date: Sun,  4 Aug 2024 10:08:09 -0700
Message-Id: <88ec14db188d701168a6d6978475bd9fd61cb20b.1722791084.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722791084.git.steve@sakoman.com>
References: <cover.1722791084.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 17:08:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202953

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    284087d4f7d5 Linux 5.15.158
    802cab68a6d5 serial: core: fix kernel-doc for uart_port_unlock_irqrestore()
    e6a488ae31ce udp: preserve the connected status if only UDP cmsg
    93ba36238db6 bounds: Use the right number of bits for power-of-two CONFIG_NR_CPUS
    b65fb50e04a9 HID: i2c-hid: remove I2C_HID_READ_PENDING flag to prevent lock-up
    b93bdfcf41f2 fbdev: fix incorrect address computation in deferred IO
    5a09eae9a7db i2c: smbus: fix NULL function pointer dereference
    52e8a42b1107 riscv: Fix TASK_SIZE on 64-bit NOMMU
    83c5c0e3cd08 riscv: fix VMALLOC_START definition
    9edd3aa34d50 dmaengine: idxd: Fix oops during rmmod on single-CPU platforms
    0ccac964520a dma: xilinx_dpdma: Fix locking
    dd946e8e57c0 idma64: Don't try to serve interrupts when device is powered off
    f5db31e59fd8 dmaengine: owl: fix register access functions
    4fa0befa92f2 tcp: Fix NEW_SYN_RECV handling in inet_twsk_purge()
    214a2dfbb84f tcp: Clean up kernel listener's reqsk in inet_twsk_purge()
    5be39f901169 mtd: diskonchip: work around ubsan link failure
    ec8d0ee88079 stackdepot: respect __GFP_NOLOCKDEP allocation flag
    018c4ea7002f net: b44: set pause params only when interface is up
    d35fb1664eb2 ethernet: Add helper for assigning packet type when dest address does not match device address
    5dbdbe113391 irqchip/gic-v3-its: Prevent double free on error
    9d0580ded513 drm/amdgpu: Fix leak when GPU memory allocation fails
    7e350ee649e0 drm/amdgpu/sdma5.2: use legacy HDP flush for SDMA2/3
    1a1dc37c23aa arm64: dts: rockchip: enable internal pull-up for Q7_THRM# on RK3399 Puma
    36b32816fbab cpu: Re-enable CPU mitigations by default for !X86 architectures
    e58047553a4e btrfs: fix information leak in btrfs_ioctl_logical_to_ino()
    1200481cd606 mmc: sdhci-msm: pervent access to suspended controller
    52f9041deaca Bluetooth: qca: fix NULL-deref on non-serdev suspend
    b3b2f2ed7d56 Bluetooth: btusb: Add Realtek RTL8852BE support ID 0x0bda:0x4853
    46c105b178b9 Bluetooth: Fix type of len in {l2cap,sco}_sock_getsockopt_old()
    2cb0b9aaa0fe x86/cpu: Fix check for RDPKRU in __show_regs()
    b8511fbf03fb tracing: Increase PERF_MAX_TRACE_SIZE to handle Sentinel1 and docker together
    1ea85ae08e39 tracing: Show size of requested perf buffer
    605a9eb70e92 net/mlx5e: Fix a race in command alloc flow
    7e44291e9615 Revert "crypto: api - Disallow identical driver names"
    51256394970e drm/vmwgfx: Fix crtc's atomic check conditional
    7c3461b6b1dc drm-print: add drm_dbg_driver to improve namespace symmetry
    479244d68f5d serial: mxs-auart: add spinlock around changing cts state
    5c92a4517cc9 serial: core: Provide port lock wrappers
    2e29ff824b47 af_unix: Suppress false-positive lockdep splat for spin_lock() in __unix_gc().
    0b289962c482 net: ethernet: ti: am65-cpts: Fix PTPv1 message type on TX packets
    2418d3f348d5 iavf: Fix TC config comparison with existing adapter TC config
    69ae07c7ad82 i40e: Report MFS in decimal base instead of hex
    ff7431f898dd i40e: Do not use WQ_MEM_RECLAIM flag for workqueue
    5c45feb3c288 netfilter: nf_tables: honor table dormant flag from netdev release event path
    63d814d93c5c mlxsw: spectrum_acl_tcam: Fix memory leak when canceling rehash work
    64435b64e43d mlxsw: spectrum_acl_tcam: Fix incorrect list API usage
    039992b6d2df mlxsw: spectrum_acl_tcam: Fix warning during rehash
    413a01886c39 mlxsw: spectrum_acl_tcam: Fix memory leak during rehash
    7adc29af50f7 mlxsw: spectrum_acl_tcam: Rate limit error message
    4c89642ca47f mlxsw: spectrum_acl_tcam: Fix possible use-after-free during rehash
    c17976b42d54 mlxsw: spectrum_acl_tcam: Fix possible use-after-free during activity update
    2943fb714d83 mlxsw: spectrum_acl_tcam: Fix race during rehash delayed work
    9048616553c6 net: openvswitch: Fix Use-After-Free in ovs_ct_exit
    8ece90ac97eb ipvs: Fix checksumming on GSO of SCTP packets
    2e74b3fd6bf5 net: gtp: Fix Use-After-Free in gtp_dellink
    dd602fb3526d net: usb: ax88179_178a: stop lying about skb->truesize
    03b5a9b2b526 ipv4: check for NULL idev in ip_route_use_hint()
    55da4788ceed NFC: trf7970a: disable all regulators on removal
    f41fbb4ff219 bridge/br_netlink.c: no need to return void function
    23b7ee4a8d55 icmp: prevent possible NULL dereferences from icmp_build_probe()
    8bdd3cf01490 mlxsw: core: Unregister EMAD trap using FORWARD action
    7336b6aa825f vxlan: drop packets from invalid src-address
    66384a7399f9 wifi: iwlwifi: mvm: return uid from iwl_mvm_build_scan_cmd
    f5aa109c94ec wifi: iwlwifi: mvm: remove old PASN station when adding a new one
    0f530ed87266 ARC: [plat-hsdk]: Remove misplaced interrupt-cells property
    7acd2d7b7603 arm64: dts: mediatek: mt2712: fix validation errors
    203e81849bd9 arm64: dts: mediatek: mt7622: drop "reset-names" from thermal block
    7b0a487bce51 arm64: dts: mediatek: mt7622: fix ethernet controller "compatible"
    d856ae10cdcf arm64: dts: mediatek: mt7622: fix IR nodename
    0434c99bf3f1 arm64: dts: mediatek: mt7622: fix clock controllers
    2f83d3d2cc3c arm64: dts: mediatek: mt7622: introduce nodes for Wireless Ethernet Dispatch
    506ac5538498 arm64: dts: mediatek: mt7622: add support for coherent DMA
    a897ecbb5779 arm64: dts: mediatek: mt8183: Add power-domains properity to mfgcfg
    daf284595e6f arm64: dts: rockchip: Remove unsupported node from the Pinebook Pro dts
    91eb350da992 arm64: dts: rockchip: enable internal pull-up on PCIE_WAKE# for RK3399 Puma
    c5ff64a50037 arm64: dts: rockchip: fix alphabetical ordering RK3399 puma
    938cf022b72c arm64: dts: rockchip: enable internal pull-up on Q7_USB_ID for RK3399 Puma
    d69ccea6041e HID: logitech-dj: allow mice to use all types of reports
    9fd9468d1c5e HID: intel-ish-hid: ipc: Fix dev_err usage with uninitialized dev->devc
    e054770d566b cifs: reinstate original behavior again for forceuid/forcegid
    929ba00702cf smb: client: fix rename(2) regression against samba
    b8086c3c1548 reiserfs: Avoid touching renamed directory if parent does not change
    ea091017ef62 ipv6: Fix data races around sk->sk_prot.
    ff8710da80ee ipv6: annotate some data-races around sk->sk_prot
    e8c2eafaaa6a tcp: Fix data races around icsk->icsk_af_ops.
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
index 349aa9854d..8800806194 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f8d4297d452f7c832d90bfb992d90db2e30ffc23"
-SRCREV_meta ?= "7cdb56640a7854c921c292100445334745d5d534"
+SRCREV_machine ?= "a468d787dfbf768aec6fe4a2ee736a87bdab52af"
+SRCREV_meta ?= "a9112e1b2552a7b037b2f90699505e7c1e4d6a34"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.157"
+LINUX_VERSION ?= "5.15.158"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 054e17e871..d7fa046f62 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.157"
+LINUX_VERSION ?= "5.15.158"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "7a8fce8cbd9a8a7d68a0c2537141c85d63f6eda3"
-SRCREV_meta ?= "7cdb56640a7854c921c292100445334745d5d534"
+SRCREV_machine ?= "6c57f57bb65c37c020fd6a061d6de383b4313de2"
+SRCREV_meta ?= "a9112e1b2552a7b037b2f90699505e7c1e4d6a34"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index c066797436..664637f415 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "b844615e2b799c40eac746cd24e009b620114230"
-SRCREV_machine:qemuarm64 ?= "aeb63de10514b28d35049f285ae9a371d6d5ccd2"
-SRCREV_machine:qemumips ?= "3740052e902e15416c22ce7f2544de7afe83a845"
-SRCREV_machine:qemuppc ?= "167c9e8d0e760cfb299408647efe46214fd06ac0"
-SRCREV_machine:qemuriscv64 ?= "f0d16a142e32a7934da39a12bd983a00e629bb48"
-SRCREV_machine:qemuriscv32 ?= "f0d16a142e32a7934da39a12bd983a00e629bb48"
-SRCREV_machine:qemux86 ?= "f0d16a142e32a7934da39a12bd983a00e629bb48"
-SRCREV_machine:qemux86-64 ?= "f0d16a142e32a7934da39a12bd983a00e629bb48"
-SRCREV_machine:qemumips64 ?= "d34e0789d8d5e0d7ab521889e80967edcac38dc6"
-SRCREV_machine ?= "f0d16a142e32a7934da39a12bd983a00e629bb48"
-SRCREV_meta ?= "7cdb56640a7854c921c292100445334745d5d534"
+SRCREV_machine:qemuarm ?= "d9608c78d05977d42b1cbd66aea61e718b5da1d4"
+SRCREV_machine:qemuarm64 ?= "9e2365972e0a5940d366147c330f135edd8788f6"
+SRCREV_machine:qemumips ?= "0be3db6f8f7efe913d84d6d307a4d079df6d423b"
+SRCREV_machine:qemuppc ?= "fd190beb19fa10615d66ab49ff15253588e0c7f6"
+SRCREV_machine:qemuriscv64 ?= "6498e732b08b63bbdc44d6e418603e78966f292b"
+SRCREV_machine:qemuriscv32 ?= "6498e732b08b63bbdc44d6e418603e78966f292b"
+SRCREV_machine:qemux86 ?= "6498e732b08b63bbdc44d6e418603e78966f292b"
+SRCREV_machine:qemux86-64 ?= "6498e732b08b63bbdc44d6e418603e78966f292b"
+SRCREV_machine:qemumips64 ?= "9a5e38846a3622fe75124744a6fa17ae4b8e05c4"
+SRCREV_machine ?= "6498e732b08b63bbdc44d6e418603e78966f292b"
+SRCREV_meta ?= "a9112e1b2552a7b037b2f90699505e7c1e4d6a34"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "b925f60c6ee7ec871d2d48575d0fde3872129c20"
+SRCREV_machine:class-devupstream ?= "284087d4f7d57502b5a41b423b771f16cc6d157a"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.157"
+LINUX_VERSION ?= "5.15.158"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


