Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F2CE77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 21:17:44 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.32451.1736371054969388863
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 13:17:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=i7UXJt2l;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2166651f752so3462695ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 13:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736371054; x=1736975854; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kESHwblRxB1k/MFkHpi8n9nOUom6fetatnICKO7X7FA=;
        b=i7UXJt2ldKR2eFzZyzdFmUpYrV8MW7qjjuNu8gdjP1HJPl1NoQkekAaX3KXOaNKO94
         K15LbpQYQ8hCSUmVS4tySIk+aN72LKf3sFnPHO0+eaR5DMtfLwXy1y0otFbeDfzI7aD+
         hC88Z5eRpoKUVTQfIjvrYqxXVmkPLZWVS5DwcW8Ppp7d5C3VtA0JNGXdgtTGRZ6mbK61
         KNtDIahnlcMABevIhk70suP+uEx2awhHc/cmPb5qBBtiQ5hieKAZkkYOR0bBDLu3ZaLI
         THLERfhHcV9O5C6V7HotUomDvhHC3oVQl0Flg0P0vDoVCKFmymFUmccGq62oIoncPGg4
         qQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736371054; x=1736975854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kESHwblRxB1k/MFkHpi8n9nOUom6fetatnICKO7X7FA=;
        b=aowP0zfrB6uvSVlPTNppcVEnhx9G4v2vzCwqFoWnphYJXJh4VaRfUyjy7HCNkvpqUc
         1cfNUPmt/AJRLlHgWR519ByprsO9e+iZIxQSz6T3bAHkdpHBBQbJdO437LrUSOrMRdlD
         HvrICb6X1xeUZejpN7j0FgZHr8pfVqmQVCQOyNxL0XXkUR9B9/LILOTE+89cewXy16W2
         lKaytnwCsd5toM3Dzhl9Ny6TDkQXkkOxzuF3xSX7/odp22sEyxFLaZXmTd4QhNmECscB
         5ym5qgwBzaNOkUPyoeQQ1irGMU4S+wSjBcsZyZ8sISim/wSozqZvrM8lU4ONHCwnq1nR
         PCTQ==
X-Gm-Message-State: AOJu0YysbsZ2WugL4SAPOOp2Bu/SGJxvmPe9mkNPSnKrotWzOKhFNYpr
	C9sbAWdde326WkMcph11+nnurvC7+dCPFM4Foa6AA9t09NxMbBPinhVylUERZx9Z0/k8l5+/uJ1
	h+C0=
X-Gm-Gg: ASbGncvafPejUL6XAI7kZ0htSLP/PdrIbgBWVdiUCZCXJTIlFWZlYgHuwLV8/Sdrp+B
	C/rkao6MQn0qCBA0VTgh+IaEsDFZRtKF6oQ7sdvsmFBII158NB4oFoadb6Hd/aRpGzfqRxQNUWF
	q0EoexU9il1uJCGpSnvjPEtKxqJBcuBdJuSuwDK+eYQKuaBGtia7mVF+eTHIPIQyJMqe6E3Y2Lu
	vQWA7COaMBN5tsDpVi2BlcHHaunpIkmmEboC2yWfqylNw==
X-Google-Smtp-Source: AGHT+IHyIh1EWb7Lt7+Pzi5Sj2kF6ja3MjAW+3F6I0NKZGa1b+XoCv9yeDIHH9ifR9zvdnTcx7AyCQ==
X-Received: by 2002:a17:903:22c4:b0:215:3661:747e with SMTP id d9443c01a7336-21a83f48c2fmr69281045ad.8.1736371053994;
        Wed, 08 Jan 2025 13:17:33 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cdd9bsm331403495ad.132.2025.01.08.13.17.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 13:17:33 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 11/18] linux-yocto/6.6: update to v6.6.63
Date: Wed,  8 Jan 2025 13:17:01 -0800
Message-ID: <1df135725ed60e06c3ce4dc36878b58261b167fd.1736370890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736370890.git.steve@sakoman.com>
References: <cover.1736370890.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 21:17:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209601

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    bff3e13adb72 Linux 6.6.63
    62aec1e92599 mm/damon/core: copy nr_accesses when splitting region
    6cba27abb669 mm/damon/core: handle zero schemes apply interval
    b0fb9543b119 mm/damon/core: check apply interval in damon_do_apply_schemes()
    bdc136e2b05f mm: resolve faulty mmap_region() error path behaviour
    04b7efa421dc mm: refactor arch_calc_vm_flag_bits() and arm64 MTE handling
    3a6d8d3f1998 mm: refactor map_deny_write_exec()
    a97fe6889b25 mm: unconditionally close VMAs on error
    cd3ed99fca8c mm: avoid unsafe VMA hook invocation when error arises on mmap hook
    172ffd26a5af leds: mlxreg: Use devm_mutex_init() for mutex initialization
    3a741b80b345 fs/9p: fix uninitialized values during inode evict
    f111de0f0103 drm/amd/pm: Vangogh: Fix kernel memory out of bounds write
    3bc4569a727d mptcp: pm: use _rcu variant under rcu_read_lock
    fc3c73284d2e mptcp: drop lookup_by_id in lookup_addr
    416001b0412f mptcp: hold pm lock when deleting entry
    ac56c5e80e1f mptcp: update local address flags when setting it
    aa2b28ddcc26 mptcp: add userspace_pm_lookup_addr_by_id helper
    762ca2d2e3c7 mptcp: define more local variables sk
    fb79d68a36e2 NFSD: Never decrement pending_async_copies on error
    421f1a2a1afb NFSD: Initialize struct nfsd4_copy earlier
    ae267989b7b7 NFSD: Limit the number of concurrent async COPY operations
    20a10c78ac3a NFSD: Async COPY result needs to return a write verifier
    74115b3e41c7 NFSD: initialize copy->cp_clp early in nfsd4_copy for use by trace point
    db12e874e1a2 media: dvbdev: fix the logic when DVB_DYNAMIC_MINORS is not set
    efb258ec337f lib/buildid: Fix build ID parsing logic
    0c623f5692a0 staging: vchiq_arm: Use devm_kzalloc() for vchiq_arm_state allocation
    6dee8f99c690 staging: vchiq_arm: Get the rid off struct vchiq_2835_state
    6bfed8babc1a mm/damon/core: handle zero {aggregation,ops_update} intervals
    973739c94521 mm/damon/core: implement scheme-specific apply interval
    0a326fbc8f72 drm/amd/display: Adjust VSDB parser for replay feature
    5e91cd9a3417 drm/amd: Fix initialization mistake for NBIO 7.7.0
    16abd7ce81e4 nouveau: fw: sync dma after setup is called.
    8fc228ab5d38 pmdomain: imx93-blk-ctrl: correct remove path
    1a312ed8f9b2 drm/bridge: tc358768: Fix DSI command tx
    930f99a21e7f mmc: sunxi-mmc: Fix A100 compatible description
    56de724c58c0 Revert "mmc: dw_mmc: Fix IDMAC operation with pages bigger than 4K"
    32fc8cedcba6 LoongArch: Make KASAN work with 5-level page-tables
    4457bc909d1e LoongArch: Disable KASAN if PGDIR_SIZE is too large for cpu_vabits
    f04125eb9eb5 LoongArch: Fix early_numa_add_cpu() usage for FDT systems
    b0e476574004 nilfs2: fix null-ptr-deref in block_dirty_buffer tracepoint
    672668e0208f ocfs2: fix UBSAN warning in ocfs2_verify_volume()
    037108f03ed4 ALSA: hda/realtek: fix mute/micmute LEDs for a HP EliteBook 645 G10
    630adf4d66f7 ALSA: hda/realtek - Fixed Clevo platform headset Mic issue
    8bbf0ab631cd nommu: pass NULL argument to vma_iter_prealloc()
    59b49ca67cca nilfs2: fix null-ptr-deref in block_touch_buffer tracepoint
    d28b059ee477 KVM: VMX: Bury Intel PT virtualization (guest/host mode) behind CONFIG_BROKEN
    4b7522b0040f KVM: x86: Unconditionally set irr_pending when updating APICv state
    190b344caadc KVM: nVMX: Treat vpid01 as current if L2 is active, but with VPID disabled
    8a84765c62cc ima: fix buffer overrun in ima_eventdigest_init_common
    c4d64534d4b1 vp_vdpa: fix id_table array not null terminated error
    15c49f91cfc8 vdpa/mlx5: Fix PA offset with unaligned starting iotlb map
    d372dd09cfbf vdpa: solidrun: Fix UB bug with devres
    64e67e869425 mm: revert "mm: shmem: fix data-race in shmem_getattr()"
    843dfc804af4 ocfs2: uncache inode which has failed entering the group
    d0f16cec7977 mm: fix NULL pointer dereference in alloc_pages_bulk_noprof
    3414fc6a7888 x86/mm: Fix a kdump kernel failure on SME system when CONFIG_IMA_KEXEC=y
    bcd602ae8c46 tools/mm: fix compile error
    4b9fb3aeb90e ARM: 9419/1: mm: Fix kernel memory mapping for xip kernels
    9ea6b70fecb9 bonding: add ns target multicast address to slave device
    c67ce71d5328 net: ti: icssg-prueth: Fix 1 PPS sync
    faf81a3d64b2 stmmac: dwmac-intel-plat: fix call balance of tx_clk handling routines
    a39058e0e554 net: stmmac: rename stmmac_pltfr_remove_no_dt to stmmac_pltfr_remove
    d54ebfe8d33f net: stmmac: dwmac-visconti: use devm_stmmac_probe_config_dt()
    e6eae391e3d9 net: stmmac: dwmac-intel-plat: use devm_stmmac_probe_config_dt()
    09621bd40205 net: Make copy_safe_from_sockptr() match documentation
    007bdd7878f9 net: stmmac: dwmac-mediatek: Fix inverted handling of mediatek,mac-wol
    4ae7a3c30c32 samples: pktgen: correct dev to DEV
    789f9963bd03 net: sched: cls_u32: Fix u32's systematic failure to free IDR entries for hnodes.
    9fd5661af639 net/sched: cls_u32: replace int refcounts with proper refcounts
    a682b356eaf8 Bluetooth: btintel: Direct exception event to bluetooth stack
    fbc8cf85f6cc Bluetooth: hci_core: Fix calling mgmt_device_connected
    5b0888a87bce Revert "RDMA/core: Fix ENODEV error for iWARP test over vlan"
    897617a413e0 virtio/vsock: Fix accept_queue memory leak
    06dc488a5930 net/mlx5e: CT: Fix null-ptr-deref in add rule err flow
    2aa94921b072 net/mlx5e: clear xdp features on non-uplink representors
    93a14620b97c net/mlx5e: kTLS, Fix incorrect page refcounting
    094d1a2121ce net/mlx5: fs, lock FTE when checking if active
    ff825ab2f455 mptcp: cope racing subflow creation in mptcp_rcv_space_adjust
    a66805c9b22c mptcp: error out earlier on disconnect
    1e5305972969 drm/rockchip: vop: Fix a dereferenced before check warning
    fa8d2d141004 net: vertexcom: mse102x: Fix tx_bytes calculation
    ad975697211f sctp: fix possible UAF in sctp_v6_available()
    bbc769d2fa1b netlink: terminate outstanding dump on socket close
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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f5136e72e011fc2b9ca67d7ecd1ac7603d235c7b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index b02aeb2d08..3eef9a67d7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "67f358194225f9936b9a98ee9366417597be1769"
-SRCREV_meta ?= "0d6304e8cd2ae4269ef1151edef0d9e7b5a1babc"
+SRCREV_machine ?= "db1ff5ceabc3902a2a385e1f1d0a234812bff52c"
+SRCREV_meta ?= "99c5ec65d21cd824d26ee9eb8bca7d2e59311e5f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.62"
+LINUX_VERSION ?= "6.6.63"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 0990260ec1..7d4f9f4306 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.62"
+LINUX_VERSION ?= "6.6.63"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c0b4a8f13b976065abdeaa2f1177dbc5cb600b4b"
-SRCREV_meta ?= "0d6304e8cd2ae4269ef1151edef0d9e7b5a1babc"
+SRCREV_machine ?= "7161bda718e673d92774adeec664c182a9503b23"
+SRCREV_meta ?= "99c5ec65d21cd824d26ee9eb8bca7d2e59311e5f"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index c6355ff33d..2d76148bfb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "1e6b41eda7272a27f84bad099bbd0289936e66e6"
-SRCREV_machine:qemuarm64 ?= "c0b4a8f13b976065abdeaa2f1177dbc5cb600b4b"
-SRCREV_machine:qemuloongarch64 ?= "c0b4a8f13b976065abdeaa2f1177dbc5cb600b4b"
-SRCREV_machine:qemumips ?= "34755af7887cc9dae4d4aa10395a8b2ba16550fc"
-SRCREV_machine:qemuppc ?= "c0b4a8f13b976065abdeaa2f1177dbc5cb600b4b"
-SRCREV_machine:qemuriscv64 ?= "c0b4a8f13b976065abdeaa2f1177dbc5cb600b4b"
-SRCREV_machine:qemuriscv32 ?= "c0b4a8f13b976065abdeaa2f1177dbc5cb600b4b"
-SRCREV_machine:qemux86 ?= "c0b4a8f13b976065abdeaa2f1177dbc5cb600b4b"
-SRCREV_machine:qemux86-64 ?= "c0b4a8f13b976065abdeaa2f1177dbc5cb600b4b"
-SRCREV_machine:qemumips64 ?= "9b078a376adbf198325e1569246106e480191063"
-SRCREV_machine ?= "c0b4a8f13b976065abdeaa2f1177dbc5cb600b4b"
-SRCREV_meta ?= "0d6304e8cd2ae4269ef1151edef0d9e7b5a1babc"
+SRCREV_machine:qemuarm ?= "d2cfc8b451eb38afd1f722e8d1047da4e23bb187"
+SRCREV_machine:qemuarm64 ?= "7161bda718e673d92774adeec664c182a9503b23"
+SRCREV_machine:qemuloongarch64 ?= "7161bda718e673d92774adeec664c182a9503b23"
+SRCREV_machine:qemumips ?= "af4cdb96163587bbf381ebfa551b6fa259201cca"
+SRCREV_machine:qemuppc ?= "7161bda718e673d92774adeec664c182a9503b23"
+SRCREV_machine:qemuriscv64 ?= "7161bda718e673d92774adeec664c182a9503b23"
+SRCREV_machine:qemuriscv32 ?= "7161bda718e673d92774adeec664c182a9503b23"
+SRCREV_machine:qemux86 ?= "7161bda718e673d92774adeec664c182a9503b23"
+SRCREV_machine:qemux86-64 ?= "7161bda718e673d92774adeec664c182a9503b23"
+SRCREV_machine:qemumips64 ?= "e1b42bae30e5681c236b9377d73dee82becd53c3"
+SRCREV_machine ?= "7161bda718e673d92774adeec664c182a9503b23"
+SRCREV_meta ?= "99c5ec65d21cd824d26ee9eb8bca7d2e59311e5f"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "c1036e4f14d03aba549cdd9b186148d331013056"
+SRCREV_machine:class-devupstream ?= "bff3e13adb72656356111d2549d8be7c872d6e15"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.62"
+LINUX_VERSION ?= "6.6.63"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


