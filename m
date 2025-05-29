Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA45EC54FB3
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 16:58:07 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.26206.1748537878335821991
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 09:57:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UpiuzsBU;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6f8d8fb211eso11205516d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 09:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748537877; x=1749142677; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V0uza0BsEYG9FLeu2BwF9Wr/k4nUT+DFS0FFcidK+yc=;
        b=UpiuzsBUF6+um965KhdCNjIn372VKa7POGHRfSY7XRFZxsxRF9ecb1BzyLejyGmtbt
         zSs56GH4JvHSpcLzM2tT/HWn16nLZ0DH8ZFa0gDtUYQ7K/WlUKjDkCM5pOD7bzwGvNIL
         NyfIglkrnbsrOOVlxK+X+dUNQOfHTzlKkWIUDW5JTEt0YCClDVTob6oC2WG9lvY8KrVz
         XiwU8/+1fF/pR/gzEj9IQycBvALdrQmWC1NY64i6LLU0Mhkum/NVMO4gTalAXytFvh0E
         EQ0iiSyQbdMAyhwvp1sjIsPpZ5CtYMYj24QM+nmwUs6WqVJZmitQD8XRylY8XJ0d+INk
         iTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748537877; x=1749142677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V0uza0BsEYG9FLeu2BwF9Wr/k4nUT+DFS0FFcidK+yc=;
        b=MQutis1W0AY8j3loZibbvJfniqqpprPRCk8UZ6ya+sM/STjvokpVH+4SMJx97wLOFp
         YN0PPJxQruQeYLoq2GpmaC64XExgGfs5VrD6brhGLbU0+oqHrq71aJAglGR/T6u86xdH
         /YPS/wBCrl4mJP8TZGv7h3evsNcxJZhAbnpQwkU7RGzF6VKImhwNBkYKIdd8J7gg+PyL
         XwbngtEWlHtFNjpKUg85sFqptyDPPGn1Y0b6yzvmMKr4v6iFId9zybCIxG16OCiiDrbC
         up69GKhHqZ1nHqHB05qj+k89XMqCwla3J5onUfL81yMaI/8yA5+pCto3MJUoDGEt6YQ7
         8SLw==
X-Gm-Message-State: AOJu0Yya+FKXTy0mBMlmmyHpqQ2uY9VTqV4XUQE4KxoyPJvZ7A0Vtl3M
	N4zp8nHlkb2+LzLi/4a8YA6cngFtPm+k578ixawIpmesiBzK+1WsSp2/tAELJPr6
X-Gm-Gg: ASbGncv1SWv8lSXiDjux0jlRnCqbNCS7dj47CsupDfw3bjLm97t+b8TFBck2RbOiEi/
	nsI+CNYoJdjANozYPby76QqRLbFN6pqcQ0hTaw6Bv9yjXGEx3fOU6T5QHPcxTMzGdlN5Ggb9POo
	IZSRpgt+0sD/4/PxbFQZcnC4C5kgInz8fSi7bQmOSdvMR7wUxX/rq4A7aV50BdrvaJSMf3hrfge
	HsqBbn+ilCUeh1/yarN46dTSKsIWCyca3epG+WCflSNEUZo9UUbjRakS1TkFtqnUoQunxEUnO2m
	7FqVGLhjX7sAuiuIEaPZ7eMoGJNLokjxrK8iiI0/yrvnDV45wvGYgqF5Zj8GUmK7gpANsdHt9BH
	P148WBSPm82NaRntvevgjpTX4qvL+cNaXN48gEJDxfARX000Da4cy
X-Google-Smtp-Source: AGHT+IG1xS2QzJmZHgjJdlej+y9BXrLkd41seWY02MDm+4dmc/7u51qb7odwAXF3RsE1ENP5eD/tEg==
X-Received: by 2002:a05:6214:4009:b0:6f4:c15a:6215 with SMTP id 6a1803df08f44-6faced2546fmr5148286d6.39.1748537876975;
        Thu, 29 May 2025 09:57:56 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6e1c02csm11382676d6.109.2025.05.29.09.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 09:57:56 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 1/8] linux-yocto/6.6: update to v6.6.85
Date: Thu, 29 May 2025 12:57:47 -0400
Message-Id: <20250529165754.264501-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 16:58:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217420

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    d57a7c616960 Linux 6.6.85
    fa81cb19f5b7 netfilter: nft_counter: Use u64_stats_t for statistic.
    35afffaddbe8 wifi: iwlwifi: mvm: ensure offloading TID queue exists
    fd82d29c4cfb wifi: iwlwifi: support BIOS override for 5G9 in CA also in LARI version 8
    7f306c651fea bnxt_en: Fix receive ring space parameters when XDP is active
    9dff3e36ea89 btrfs: make sure that WRITTEN is set on all metadata blocks
    690597da35d9 Revert "sched/core: Reduce cost of sched_move_task when config autogroup"
    04cd1dc3df7f arm64: dts: rockchip: fix u2phy1_host status for NanoPi R4S
    7d5669629422 KVM: arm64: Eagerly switch ZCR_EL{1,2}
    93074abedecb KVM: arm64: Mark some header functions as inline
    2afe039450a0 KVM: arm64: Refactor exit handlers
    30253b3eb685 KVM: arm64: Remove VHE host restore of CPACR_EL1.SMEN
    88adb7a00754 KVM: arm64: Remove VHE host restore of CPACR_EL1.ZEN
    73f64c676a6b KVM: arm64: Remove host FPSIMD saving for non-protected KVM
    806d5c1e1d2e KVM: arm64: Unconditionally save+flush host FPSIMD/SVE/SME state
    20c6561c4918 KVM: arm64: Calculate cptr_el2 traps on activating traps
    b44a37824878 mptcp: Fix data stream corruption in the address announcement
    d0f87370622a ksmbd: fix incorrect validation for num_aces field of smb_acl
    5e0f5166e2dc drm/amd/display: Use HW lock mgr for PSR1 when only one eDP
    7803ca385941 drm/amd/display: should support dmub hw lock on Replay
    28780816ca29 drm/amdgpu: Fix JPEG video caps max size for navi1x and raven
    e66a1a616fa6 drm/amdgpu: Fix MPEG2, MPEG4 and VC1 video caps max size
    c76bd3c99293 drm/sched: Fix fence reference count leak
    3ce08215cad5 drm/radeon: fix uninitialized size issue in radeon_vce_cs_parse()
    f2bbfd50e95b soc: qcom: pdr: Fix the potential deadlock
    6e38b4a4b382 batman-adv: Ignore own maximum aggregation size during RX
    b7b4be1fa432 xsk: fix an integer overflow in xp_create_and_assign_umem()
    19f4e715f665 efi/libstub: Avoid physical address 0x0 when doing random allocation
    0baa10cf97b5 ARM: shmobile: smp: Enforce shmobile_smp_* alignment
    d6274b9472d5 ARM: dts: imx6qdl-apalis: Fix poweroff on Apalis iMX6
    63b53198aff2 proc: fix UAF in proc_get_inode()
    29124ae980e2 mm/migrate: fix shmem xarray update during migration
    9efb6b502104 mm: fix error handling in __filemap_get_folio() with FGP_NOWAIT
    f42c361843fa mmc: atmel-mci: Add missing clk_disable_unprepare()
    6d2f8c59747a mmc: sdhci-brcmstb: add cqhci suspend/resume to PM ops
    db59b24b3858 arm64: dts: rockchip: fix pinmux of UART0 for PX30 Ringneck on Haikou
    3db71cf02250 arm64: dts: freescale: imx8mm-verdin-dahlia: add Microphone Jack to sound card
    62b5b2eca3e5 arm64: dts: freescale: imx8mp-verdin-dahlia: add Microphone Jack to sound card
    4b2a170c2586 accel/qaic: Fix integer overflow in qaic_validate_req()
    998b1aae22dc regulator: check that dummy regulator has been probed before using it
    e26f24ca4fb9 regulator: dummy: force synchronous probing
    f793c0fdaaf1 riscv: dts: starfive: Fix a typo in StarFive JH7110 pin function definitions
    7cd375d46afc drm/v3d: Don't run jobs that have errors flagged in its fence
    c8eebc9d5b9c can: flexcan: disable transceiver during system PM
    6f5481d4ed39 can: flexcan: only change CAN state when link up in system PM
    cc29775a8a72 can: ucan: fix out of bound read in strscpy() source
    e5e6bd8e0de5 can: rcar_canfd: Fix page entries in the AFL list
    b202afc54e94 i2c: omap: fix IRQ storms
    f0372a4cf285 Revert "gre: Fix IPv6 link-local address generation."
    ae2ec5a51fa0 net/neighbor: add missing policy for NDTPA_QUEUE_LENBYTES
    e4f6de68deba net: lwtunnel: fix recursion loops
    9566f6ee13b1 net: atm: fix use after free in lec_send()
    a235ec29c945 ipv6: Set errno after ip_fib_metrics_init() in ip6_route_info_create().
    119dcafe3679 ipv6: Fix memleak of nhc_pcpu_rth_output in fib_check_nh_v6_gw().
    1e842b459008 ARM: davinci: da850: fix selecting ARCH_DAVINCI_DA8XX
    3d123ec74d81 accel/qaic: Fix possible data corruption in BOs > 2G
    59b683594ff3 Bluetooth: hci_event: Fix connection regression between LE and non-LE adapters
    ecd06ad0823a Bluetooth: Fix error code in chan_alloc_skb_cb()
    9524af58447d RDMA/hns: Fix wrong value of max_sge_rd
    0edfba91b773 RDMA/hns: Fix a missing rollback in error path of hns_roce_create_qp_common()
    5df88c383715 RDMA/hns: Fix unmatched condition in error path of alloc_user_qp_db()
    975355faba56 RDMA/hns: Fix soft lockup during bt pages loop
    dba5577d8e33 RDMA/bnxt_re: Avoid clearing VLAN_ID mask in modify qp path
    1e8d0765da64 ARM: dts: bcm2711: Don't mark timer regs unconfigured
    e68954ecf8b8 ARM: OMAP1: select CONFIG_GENERIC_IRQ_CHIP
    0e6aa61b54a8 RDMA/mlx5: Handle errors returned from mlx5r_ib_rate()
    6a788e32f64e RDMA/bnxt_re: Add missing paranthesis in map_qp_id_to_tbl_indx
    25be7f9bde2d arm64: dts: rockchip: Remove undocumented sdmmc property from lubancat-1
    61820187b3ef ARM: dts: bcm2711: PL011 UARTs are actually r1p5
    1b7b036685c3 soc: imx8m: Unregister cpufreq and soc dev in cleanup path
    4a58a332eedd soc: imx8m: Use devm_* to simplify probe failure handling
    d1fb2e767e1c soc: imx8m: Remove global soc_uid
    8e1704e5b205 xfrm_output: Force software GSO only in tunnel mode
    bfb9b9404a53 xfrm: fix tunnel mode TX datapath in packet offload mode
    e432cb123d89 arm64: dts: freescale: tqma8mpql: Fix vqmmc-supply
    555f05de6f46 firmware: imx-scu: fix OF node leak in .probe()
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
index 05bd9b8386..c3f2c35b1f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "60a86cf65a4bf973b04926050eb05d0e8132690d"
-SRCREV_meta ?= "917317e6b8a757306a04d6d76dd1f5a1a5591ecd"
+SRCREV_machine ?= "0588a366e1193d9ac23855c4a3c2c784d5ca512b"
+SRCREV_meta ?= "39d19bc9f333a0bfb88cd55befe70d5da87adcf8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.84"
+LINUX_VERSION ?= "6.6.85"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 3296a4300a..ae0316dade 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.84"
+LINUX_VERSION ?= "6.6.85"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "36c0e5585c944c19d71f496c306d8229565629a5"
-SRCREV_meta ?= "917317e6b8a757306a04d6d76dd1f5a1a5591ecd"
+SRCREV_machine ?= "93714069321a8e2f7d01f51038cc1d9afd64a57b"
+SRCREV_meta ?= "39d19bc9f333a0bfb88cd55befe70d5da87adcf8"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 98d820d195..55304a1929 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "1411061244e285c0f16dcc35ec34b7a13d7b5708"
-SRCREV_machine:qemuarm64 ?= "cc8c55d771998fb779d3c5990c250a78e223f397"
-SRCREV_machine:qemuloongarch64 ?= "8dd317512c57f68aa212eaf0dcf078fb39afc1bd"
-SRCREV_machine:qemumips ?= "25bda2f47225cf6d74293ba1a0b9583c33b9865d"
-SRCREV_machine:qemuppc ?= "7fd13b08104048b99d66947f682cb5a95360ba65"
-SRCREV_machine:qemuriscv64 ?= "8dd317512c57f68aa212eaf0dcf078fb39afc1bd"
-SRCREV_machine:qemuriscv32 ?= "8dd317512c57f68aa212eaf0dcf078fb39afc1bd"
-SRCREV_machine:qemux86 ?= "8dd317512c57f68aa212eaf0dcf078fb39afc1bd"
-SRCREV_machine:qemux86-64 ?= "8dd317512c57f68aa212eaf0dcf078fb39afc1bd"
-SRCREV_machine:qemumips64 ?= "23fd476a33f79745b2a4c86a2cffcf653564c649"
-SRCREV_machine ?= "8dd317512c57f68aa212eaf0dcf078fb39afc1bd"
-SRCREV_meta ?= "917317e6b8a757306a04d6d76dd1f5a1a5591ecd"
+SRCREV_machine:qemuarm ?= "00f5a7d26256a6c96f4c624ed2fcc2915baf69ed"
+SRCREV_machine:qemuarm64 ?= "44c07335c9354d22e1059b773cc5acc6d5997acb"
+SRCREV_machine:qemuloongarch64 ?= "aa6b73545c4594842542c8943dce67fe397e91cc"
+SRCREV_machine:qemumips ?= "6f7f7ea73242088f08c504a73144e7c3649548f8"
+SRCREV_machine:qemuppc ?= "af203c26b7349967003580d373f7bb4e32b53c5a"
+SRCREV_machine:qemuriscv64 ?= "aa6b73545c4594842542c8943dce67fe397e91cc"
+SRCREV_machine:qemuriscv32 ?= "aa6b73545c4594842542c8943dce67fe397e91cc"
+SRCREV_machine:qemux86 ?= "aa6b73545c4594842542c8943dce67fe397e91cc"
+SRCREV_machine:qemux86-64 ?= "aa6b73545c4594842542c8943dce67fe397e91cc"
+SRCREV_machine:qemumips64 ?= "98b3401fbd220385715648e6bea870482419e7c1"
+SRCREV_machine ?= "aa6b73545c4594842542c8943dce67fe397e91cc"
+SRCREV_meta ?= "39d19bc9f333a0bfb88cd55befe70d5da87adcf8"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "4b6a8fa777d29785c7ddb51dcbb2b5411deefaca"
+SRCREV_machine:class-devupstream ?= "d57a7c6169607dd09157ccf257e556fb75444f28"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.84"
+LINUX_VERSION ?= "6.6.85"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


