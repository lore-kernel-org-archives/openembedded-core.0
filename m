Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C96BC02197
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 16:02:11 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.18722.1738252926834826088
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jan 2025 08:02:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fjSzbU4c;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7b6fc3e9e4aso86661485a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 08:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738252926; x=1738857726; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f50EvjOup5hYWoikh3ZWYBm71+5oLUcqKx51aGqyiVY=;
        b=fjSzbU4c07xN5VZn9k1x6QAlbdM+MdXKW3a/12LIAt1zBZW+zlJI+pyqjrK2Oze27p
         FoVoOYJO0fnWdv/47g2ILjWt/oi9D/YUbSvA+mMpOWXs7VkRIvTqc0pviI/y59C1j5SQ
         L063sdhbRiyG8Ekn5Ywwk5Enpuhlrj0tezWILcSBMjnWeAiXlQgyVAQvFo/YN29QvZbO
         I1+SCPm73addGCoOunqwgQjDfizUefJq/93wSJqtFY91mvod/gk8EaWfpeIoUbYVmWyT
         d6XvrVipnEsusdZxAY3Gt+wdaUHC+wNQ5sUL8Gspa5zcPqjCRtthKzELGH7Urg+EUDXK
         5YwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738252926; x=1738857726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f50EvjOup5hYWoikh3ZWYBm71+5oLUcqKx51aGqyiVY=;
        b=e0LLAvr8By++fYBP09696eJtTD7yjmr9HDJQt5frFXV01bef7LpkTayCwYS8sWY6EA
         nlF9M+iQvbG3cL4lS1gOVl61pcfJ57ugoiMjQxM3VfuB28MBlVIGf4wZ6jU9H8uZpsBn
         Ef1n4ipRFzKVztWbL5Pt+qsDm9fgp07dqakIBoiYHcpA/uFnnKL2mLM9rJr4F0T8FzFL
         ElyE0O8N1QlEU8VtF+56V6YIuwmHPd4DJ+FQtccQ19oGUTRozhl05i5RLju5mHWp45Kc
         P+G//rQDn2mn6DNc82hUBXAtVjTkffO3femx+FpxGUqYm8WvJTd3a/4sdisd6tu4KvPq
         cJfA==
X-Gm-Message-State: AOJu0YymIfrH9rhchI4UgZ01RPlVqrSj4lyUjyi796JvJy10y+Xkf7QN
	V7R25EtekkrzkaZJxhUVrEpecK/IfHgWkrY4sFntBe8tPtYPgPkl
X-Gm-Gg: ASbGncu801kq8+LhDMuORCJdN/7SBQXRfuwa6+rAqAp5ZOB/PVqhHHwEiTM1oigVO9r
	kBCxj0q510ugnt5K1DAUayLvGT6UV3efyZcoGECSS0f2Uu2BVKNwxHWPpDyWdoQ347vFv5WzLPE
	ytat+Txw/SX/sT94OeiwwzSp/nx4nuJZVAvE497RtQxXWrdB+fuLXRfEsI8sw5VhhOyCJWdMhoM
	ypCfxiTQhfgPJz6lPaC3QzudZMTYsoXENOyFS/v6UONrGv1HWGBBc9o1QBCfeGjJOg29XtFsg6+
	Lw7Dk/Uqe0XQpbbqumEd7fdMzLPXcQAfuS/tS9oKrqINgqk/8YW9Nf3XcjMtZRno1BtJSnDN8+5
	Mke+w0DvlpSdmkJG1
X-Google-Smtp-Source: AGHT+IFFnDui3seK3WKDPhlVDkC5W6RanrHUx8qZEB0RtphAA57rq0nYzHBUQ90uP4Y9/Ebfy3ZG2g==
X-Received: by 2002:a05:620a:29cf:b0:7ac:bb00:cd42 with SMTP id af79cd13be357-7bffcd43180mr1269029985a.27.1738252925459;
        Thu, 30 Jan 2025 08:02:05 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a90d3c4sm86086285a.111.2025.01.30.08.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 08:02:03 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] linux-yocto/6.12: update to v6.12.11
Date: Thu, 30 Jan 2025 11:01:53 -0500
Message-Id: <a5d9885d6b52c27582c9e983e2dad535ba8b1f76.1738252521.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1738252521.git.bruce.ashfield@gmail.com>
References: <cover.1738252521.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 16:02:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210459

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    62b2447ec6cf Linux 6.12.11
    4c3f731b253b apparmor: allocate xmatch for nullpdb inside aa_alloc_null
    35c2f2a46ae5 drm/amd/display: Validate mdoe under MST LCT=1 case as well
    ec744819bdd4 Revert "drm/amd/display: Enable urgent latency adjustments for DCN35"
    f6be6248d649 drm/amd/display: Do not wait for PSR disable on vbl enable
    0f0c5ca1863e drm/amd/display: Disable replay and psr while VRR is enabled
    583d3a42b2bf drm/amd/display: Fix PSR-SU not support but still call the amdgpu_dm_psr_enable
    1366b0e9dd57 drm/amdgpu: always sync the GFX pipe on ctx switch
    ffb0308bd6ec drm/amdgpu: disable gfxoff with the compute workload on gfx12
    0c2196bb020d drm/amdgpu: fix fw attestation for MP0_14_0_{2/3}
    6f8e1a35cc12 drm/amdgpu/smu13: update powersave optimizations
    b7da3df91042 drm/xe/oa: Add missing VISACTL mux registers
    95af4bfd6702 drm/xe: Mark ComputeCS read mode as UC on iGPU
    def3ddf10be4 drm/i915/fb: Relax clear color alignment to 64 bytes
    a737a81d5255 x86/fred: Fix the FRED RSP0 MSR out of sync with its per-CPU cache
    6e641d499bb1 timers/migration: Enforce group initialization visibility to tree walkers
    12ead225b799 timers/migration: Fix another race between hotplug and idle entry/exit
    38492f6ee883 hrtimers: Handle CPU state correctly on hotplug
    93955a778812 irqchip/gic-v3-its: Don't enable interrupts in its_irq_set_vcpu_affinity()
    44feb7612989 irqchip/gic-v3: Handle CPU_PM_ENTER_FAILED correctly
    115719a95385 irqchip: Plug a OF node reference leak in platform_irqchip_probe()
    e96a2838d8b1 tracing: gfp: Fix the GFP enum values shown for user space tracing tools
    c78b04977d19 mm: vmscan : pgdemote vmstat is not getting updated when MGLRU is enabled.
    310ac886d68d mm: clear uffd-wp PTE/PMD state on mremap()
    4e4ab0748cd8 drm/amd/display: Do not elevate mem_type change to full update
    6f8a91d9aeb5 selftests/mm: set allocated memory to non-zero content in cow test
    391da9c6a69d mm/kmemleak: fix percpu memory leak detection failure
    488a68c948bc pmdomain: imx8mp-blk-ctrl: add missing loop break condition
    2e3194dc1197 tools: fix atomic_set() definition to set the value correctly
    9c035105c553 gpio: xilinx: Convert gpio_lock to raw spinlock
    80828540dad0 fs/proc: fix softlockup in __read_vmcore (part 2)
    280f1fb89afc filemap: avoid truncating 64-bit offset to 32 bits
    20a1b9a4ef55 net/ncsi: fix locking in Get MAC Address handling
    ce67e0e54ab8 drm/nouveau/disp: Fix missing backlight control on Macbook 5,1
    de440945811d nouveau/fence: handle cross device fences properly
    c23d1d4f8efe vsock: prevent null-ptr-deref in vsock_*[has_data|has_space]
    01c178d6902c vsock: reset socket state when de-assigning the transport
    450aa12993a1 vsock/virtio: cancel close work in the destructor
    677579b641af vsock/virtio: discard packets if the transport changes
    6771e1279dad vsock/bpf: return early if transport is not assigned
    97564250d43c net: ethernet: xgbe: re-add aneg to supported features in PHY quirks
    84a2db01f500 selftests: mptcp: avoid spurious errors on disconnect
    470f313603df mptcp: fix spurious wake-up on under memory pressure
    34e8ad3f2326 mptcp: be sure to send ack when mptcp-level window re-opens
    4143ae9faf75 i2c: atr: Fix client detach
    902ef8f16d5c zram: fix potential UAF of zram table
    07c956f7904b ALSA: hda/realtek: fixup ASUS H7606W
    843a1ab9ceee ALSA: hda/realtek: fixup ASUS GA605W
    4711481c8032 ALSA: hda/realtek: Add support for Ayaneo System using CS35L41 HDA
    85f1e093b831 x86/asm: Make serialize() always_inline
    e98394f7bc91 sched/fair: Fix update_cfs_group() vs DELAY_DEQUEUE
    d01a7e05ea38 nvmet: propagate npwg topology
    6ffdf037dd7a sched_ext: Fix dsq_local_on selftest
    d94bb9a6f936 RDMA/bnxt_re: Fix to export port num to ib_query_qp
    21900bfd332a scx: Fix maximal BPF selftest prog
    fc20e87419e5 selftests/sched_ext: fix build after renames in sched_ext API
    621f95fa0b93 poll_wait: add mb() to fix theoretical race between waitqueue_active() and .poll()
    22be1d90a621 afs: Fix merge preference rule failure condition
    402ce1642147 iomap: avoid avoid truncating 64-bit offset to 32 bits
    fdb13258ad86 sched_ext: keep running prev when prev->scx.slice != 0
    d9157d15ded5 ACPI: resource: acpi_dev_irq_override(): Check DMI match last
    0af195b20c9f platform/x86: ISST: Add Clearwater Forest to support list
    b9497f168256 platform/x86/intel: power-domains: Add Clearwater Forest support
    634e989f58d6 selftests: tc-testing: reduce rshift value
    e559ee6bb587 gpio: sim: lock up configfs that an instantiated device depends on
    61cc1df086d4 gpio: virtuser: lock up configfs that an instantiated device depends on
    ac216ffa697c scsi: ufs: core: Honor runtime/system PM levels if set by host controller drivers
    04c3c7acb5ec cachefiles: Parse the "secctx" immediately
    3d460376254e netfs: Fix non-contiguous donation between completed reads
    3aabe0106475 kheaders: Ignore silly-rename files
    7c37879b76c8 fs: fix missing declaration of init_files
    465fb8680c88 fs/qnx6: Fix building with GCC 15
    709dfdd7e5ca hfs: Sanity check the root record
    b856d2c1384b mac802154: check local interfaces before deleting sdata list
    a2be5f2ba34d smb: client: fix double free of TCP_Server_Info::hostname
    eed792d9894c hwmon: (ltc2991) Fix mixed signed/unsigned in DIV_ROUND_CLOSEST
    9e2d61c4dcd8 i2c: testunit: on errors, repeat NACK until STOP
    d1e4aff10c6b i2c: rcar: fix NACK handling when being a target
    894076b78a7e i2c: mux: demux-pinctrl: check initial mux selection, too
    ec7329647fbf Revert "mtd: spi-nor: core: replace dummy buswidth from addr to data"
    e208535991f1 hwmon: (tmp513) Fix division of negative numbers
    3f67e07873df platform/x86: lenovo-yoga-tab2-pro-1380-fastcharger: fix serdev race
    d3a24d923333 platform/x86: dell-uart-backlight: fix serdev race
    e19f31169f85 i2c: core: fix reference leak in i2c_register_adapter()
    999fe486cb5d soc: ti: pruss: Fix pruss APIs
    40c28d1a0ac4 reset: rzg2l-usbphy-ctrl: Assign proper of node to the allocated device
    b22467b1ae10 drm/v3d: Ensure job pointer is set to NULL after job completion
    bf5105dd6d6c drm/vmwgfx: Add new keep_resv BO param
    5ee247046e13 drm/vmwgfx: Unreserve BO on error
    17f0e22bcba0 drm/tests: helpers: Fix compiler warning
    2b78cab481a6 netdev: avoid CFI problems with sock priv helpers
    d823355f9238 net/mlx5e: Always start IPsec sequence number from 1
    9e9c667ffd15 net/mlx5e: Rely on reqid in IPsec tunnel mode
    6d3d69c070d9 net/mlx5e: Fix inversion dependency warning while enabling IPsec tunnel
    1f6e619ef2a4 net/mlx5: Clear port select structure when fail to create
    df0e2cddc169 net/mlx5: SF, Fix add port error handling
    6210f069dcb9 net/mlx5: Fix a lockdep warning as part of the write combining test
    6a3085458d2e net/mlx5: Fix RDMA TX steering prio
    7a4fd3df85b3 net: make page_pool_ref_netmem work with net iovs
    1425cb829556 net: fec: handle page_pool_dev_alloc_pages error
    17b678858959 net: xilinx: axienet: Fix IRQ coalescing packet count overflow
    4fc02808ebd7 nfp: bpf: prevent integer overflow in nfp_bpf_event_output()
    5a3096ba2b46 cpufreq: Move endif to the end of Kconfig file
    1c35a66e2bfe pfcp: Destroy device along with udp socket's netns dismantle.
    86f73d4ab2f2 gtp: Destroy device along with udp socket's netns dismantle.
    e6225173b502 gtp: Use for_each_netdev_rcu() in gtp_genl_dump_pdp().
    d0fb5741932b btrfs: add the missing error handling inside get_canonical_dev_path
    1654578a3b1d cpuidle: teo: Update documentation after previous changes
    11a642ad58a2 ice: Add correct PHY lane assignment
    2f59743be4d9 ice: Use ice_adapter for PTP shared data instead of auxdev
    499db66f690b ice: Add ice_get_ctrl_ptp() wrapper to simplify the code
    922af90ffb77 ice: Introduce ice_get_phy_model() wrapper
    2e166786d088 ice: Fix ETH56G FC-FEC Rx offset value
    0e5a802fcf5f ice: Fix quad registers read on E825
    605c7381b5d8 ice: Fix E825 initialization
    1a9b65c672ca pktgen: Avoid out-of-bounds access in get_imix_entries
    82f433e8dd06 openvswitch: fix lockup on tx to unregistering netdev with carrier
    8c1a1fda1726 net: ravb: Fix max TX frame size for RZ/V2M
    08831a894d18 eth: bnxt: always recalculate features after XDP clearing, fix null-deref
    cccd51dd2257 bpf: Fix bpf_sk_select_reuseport() memory leak
    9e08229256e5 net: ethernet: ti: cpsw_ale: Fix cpsw_ale_get_field()
    a8edd5e1f8e6 efi/zboot: Limit compression options to GZIP and ZSTD
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
index 3a3e228bd7..f5120d9180 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f2ef371cec8f31a45c108756bfad162c622aaa3a"
-SRCREV_meta ?= "5d9c6c5b0531161f9e8e9d108740ebcec9177398"
+SRCREV_machine ?= "b93740cee99b08c6c9c7268c6595eaa7debeb28b"
+SRCREV_meta ?= "9c34085a1b39aaba74176c64be0ef5081f81e1ed"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.10"
+LINUX_VERSION ?= "6.12.11"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 097e1fc20a..95da0514d5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.10"
+LINUX_VERSION ?= "6.12.11"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "e2f65ce84a5423915adf9ef2be1e323fbb713916"
-SRCREV_meta ?= "5d9c6c5b0531161f9e8e9d108740ebcec9177398"
+SRCREV_machine ?= "b37e2dde9b32bd7678b16d3c1c21c3e06ab2e785"
+SRCREV_meta ?= "9c34085a1b39aaba74176c64be0ef5081f81e1ed"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index a793637f90..b92d81cb9f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "2f251fc1043b18812b301628ec5ae1a1a0341bb7"
-SRCREV_machine:qemuarm64 ?= "e2f65ce84a5423915adf9ef2be1e323fbb713916"
-SRCREV_machine:qemuloongarch64 ?= "e2f65ce84a5423915adf9ef2be1e323fbb713916"
-SRCREV_machine:qemumips ?= "7ef0609e8d65a6a501cf521905fe6d6c3c20d190"
-SRCREV_machine:qemuppc ?= "e2f65ce84a5423915adf9ef2be1e323fbb713916"
-SRCREV_machine:qemuriscv64 ?= "e2f65ce84a5423915adf9ef2be1e323fbb713916"
-SRCREV_machine:qemuriscv32 ?= "e2f65ce84a5423915adf9ef2be1e323fbb713916"
-SRCREV_machine:qemux86 ?= "e2f65ce84a5423915adf9ef2be1e323fbb713916"
-SRCREV_machine:qemux86-64 ?= "e2f65ce84a5423915adf9ef2be1e323fbb713916"
-SRCREV_machine:qemumips64 ?= "f3de26417bfb0cf51627f2a4f9b86aaaaf42b781"
-SRCREV_machine ?= "e2f65ce84a5423915adf9ef2be1e323fbb713916"
-SRCREV_meta ?= "5d9c6c5b0531161f9e8e9d108740ebcec9177398"
+SRCREV_machine:qemuarm ?= "5fdaf7068e5f256c3243d436524a4abd455d3acb"
+SRCREV_machine:qemuarm64 ?= "b37e2dde9b32bd7678b16d3c1c21c3e06ab2e785"
+SRCREV_machine:qemuloongarch64 ?= "b37e2dde9b32bd7678b16d3c1c21c3e06ab2e785"
+SRCREV_machine:qemumips ?= "b1c0fd52ddf62f20232698fd524ce3cf7a724562"
+SRCREV_machine:qemuppc ?= "b37e2dde9b32bd7678b16d3c1c21c3e06ab2e785"
+SRCREV_machine:qemuriscv64 ?= "b37e2dde9b32bd7678b16d3c1c21c3e06ab2e785"
+SRCREV_machine:qemuriscv32 ?= "b37e2dde9b32bd7678b16d3c1c21c3e06ab2e785"
+SRCREV_machine:qemux86 ?= "b37e2dde9b32bd7678b16d3c1c21c3e06ab2e785"
+SRCREV_machine:qemux86-64 ?= "b37e2dde9b32bd7678b16d3c1c21c3e06ab2e785"
+SRCREV_machine:qemumips64 ?= "54b3fb63e85f80e396ccccbe6106a9f83bba43e0"
+SRCREV_machine ?= "b37e2dde9b32bd7678b16d3c1c21c3e06ab2e785"
+SRCREV_meta ?= "9c34085a1b39aaba74176c64be0ef5081f81e1ed"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "a6ad5510dbb5f55cd2d1b44b11a18120bf79a5a3"
+SRCREV_machine:class-devupstream ?= "62b2447ec6cf3f8ce4b768cacd7b787a04f54a14"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.10"
+LINUX_VERSION ?= "6.12.11"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


