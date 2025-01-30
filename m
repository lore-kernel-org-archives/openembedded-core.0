Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5990C02194
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 16:02:10 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.18816.1738252927936814060
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jan 2025 08:02:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E1WQti4n;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7b6e5ee6ac7so89544785a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 08:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738252927; x=1738857727; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+h4Rfel1FSHF/C4Rr3csaSQDJwZomP/KP+oVbHzIAc=;
        b=E1WQti4no1c0KE6v+xB+apj9a7cc5pYYUu+IXo4vJtgkHjE1jBGJPx49/ENQqmvUq0
         sFrM1BKNe30DrEtkYjuqrDLfqqwRDnDU4nFKX5cE+d8m3rqPLr5ousQ8fXnYf4c9kZVy
         mQeaM9m25+Rq81AGoVRdc5r3IgK6b6ODS0ccNxlFYqzctPkIb+oecy/4/uJZZWlUsRWJ
         0eLeEJlRKT2EUGaIa3sHUPUR2jar5MCUVUMPa6hDtxk+iOBWcAUaanok4P/OYc3FzVL5
         aVofDnvqAp+0dwmyxubjyKcnRh1s5d2oBqBNG2Y+spzlRU38Mf7K0BXf2ABdBuo8F4U+
         Uxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738252927; x=1738857727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+h4Rfel1FSHF/C4Rr3csaSQDJwZomP/KP+oVbHzIAc=;
        b=mh3P7rRP07fOEMP2hlH46FrcpGU3aFVhC+123SM6t0mhR3K2qjCeP7H86Y7yBPHqDX
         BEdfmenvU+RfyMwgF8qcnOhaQlXwKikV77/xpIaISEAEbYc7T0Ylb6Rfc3wKIyCJGb76
         9CBAHmEFrGl+9HZrwJ9Q+TEp++ucdrOjKAR8kR58w/k+XWHqLw7T/Cqowtw6HJ1wG+hX
         6rqxbqXrTlvyXE0VavHN8Vbazp1h3awvQw1drhVoAx+j0LOOzEKpIJA221m5oOOoJcc5
         PI7J2OYV+aZ47/tez728eyix2WCiC6xNQ3xTR19wtiwZg3R5/97H2HqryS7fVamhhbqb
         XSYA==
X-Gm-Message-State: AOJu0YyxCjryaDdC+IKCi3Jd+ucLlQoVjB3ulPXEzUB1ql6NPkJ+JSro
	KkpxJ7oceA1L95HQVH4GaCGV51iPHDdgvQPcmy2dlgvfuyGIozV8Ba7qZWtKIZA=
X-Gm-Gg: ASbGncvDh1QoqJTDgTbaq097iyOtxq1D108Kh3iy+Ytf9QGwZv+qccNxyT4XBZrDPFf
	PH526xHHCm6LlvttTZnFJzW+dWotHgNCVoG+UdPwM1SMOhsjnvNYsWHNtHTY8KHGDNKu9ziWAre
	opP/waoo5/H5b/if6mp6IY4ZkZMKiX0es74GHtVx0CC8pHt67fmJpSYvfj15yGI9qpc3/7ShV72
	OXb+1R7qroEUkYGDTPqWdWS05EPt8iz88Eo0e6mjmo0t3BhZjixeiVFINfXfZlJwnrXJPWmv4+M
	6sRAlU0vW4m4SP9PzOxYqgkcP+RoNW9DQbi36buC3uHNY6Uxc82tserwOTzqJj/LpOtDPJEBUUN
	IZyIZMIKteTa/aFWS
X-Google-Smtp-Source: AGHT+IFcdgoek3wzcAndF4gNVYVy7D3zf+1l0p45m8UDvLf1JtFg3bv6pOE5BqPGkho87mt8VftGTw==
X-Received: by 2002:a05:620a:46a0:b0:7b6:6c33:994e with SMTP id af79cd13be357-7bffcccaa8cmr1097698285a.6.1738252926657;
        Thu, 30 Jan 2025 08:02:06 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a90d3c4sm86086285a.111.2025.01.30.08.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 08:02:05 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] linux-yocto/6.6: update to v6.6.74
Date: Thu, 30 Jan 2025 11:01:54 -0500
Message-Id: <a18d2cdda51c397cddec3aadd1fca98d4321c12f.1738252521.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1738252521.git.bruce.ashfield@gmail.com>
References: <cover.1738252521.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 16:02:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210460

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    0372f43ab704 Linux 6.6.74
    3f51f8c9d289 net: fix data-races around sk->sk_forward_alloc
    7d082fb20aa2 x86/xen: fix SLS mitigation in xen_hypercall_iret()
    80d39b50bdc0 nfsd: add list_head nf_gc to struct nfsd_file
    0b7b07cb5990 Revert "drm/amdgpu: rework resume handling for display (v2)"
    f47c834a9131 fs: relax assertions on failure to encode file handles
    f0c0ac84de17 ovl: support encoding fid from inode with no alias
    955a355e179f ovl: pass realinode to ovl_encode_real_fh() instead of realdentry
    ec3e32de2d8a ocfs2: fix deadlock in ocfs2_get_system_file_inode
    1364a29b71c7 block: fix uaf for flush rq while iterating tags
    08ac5fdb9c6d drm/amd/display: Fix out-of-bounds access in 'dcn21_link_encoder_create'
    c39d275efbe9 iio: imu: inv_icm42600: fix spi burst write not supported
    bcb9678b1c4f Revert "PCI: Use preserve_config in place of pci_flags"
    0cc84b6636be drm/amdgpu: always sync the GFX pipe on ctx switch
    65622de7c440 drm/i915/fb: Relax clear color alignment to 64 bytes
    a5cbbea145b4 hrtimers: Handle CPU state correctly on hotplug
    6c84ff2e788f irqchip/gic-v3-its: Don't enable interrupts in its_irq_set_vcpu_affinity()
    61c684dbfeb0 irqchip/gic-v3: Handle CPU_PM_ENTER_FAILED correctly
    61ecbceae2ee irqchip: Plug a OF node reference leak in platform_irqchip_probe()
    926ad31b76b8 pmdomain: imx8mp-blk-ctrl: add missing loop break condition
    b0111650ee59 gpio: xilinx: Convert gpio_lock to raw spinlock
    a5a2ee8144c3 fs/proc: fix softlockup in __read_vmcore (part 2)
    09528bb1a412 filemap: avoid truncating 64-bit offset to 32 bits
    c5418187b977 nouveau/fence: handle cross device fences properly
    bc9c49341f97 vsock: prevent null-ptr-deref in vsock_*[has_data|has_space]
    8a15c81063b9 vsock: reset socket state when de-assigning the transport
    dd93823fdd0e vsock/virtio: cancel close work in the destructor
    d88b249e14bd vsock/virtio: discard packets if the transport changes
    58e586c30d0b vsock/bpf: return early if transport is not assigned
    a3a3c1aa5126 net: ethernet: xgbe: re-add aneg to supported features in PHY quirks
    75deec40a774 selftests: mptcp: avoid spurious errors on disconnect
    d09d17c104a9 mptcp: fix spurious wake-up on under memory pressure
    890507bc19b9 mptcp: be sure to send ack when mptcp-level window re-opens
    5cfe4b1d0cfb i2c: atr: Fix client detach
    571d3f6045cd zram: fix potential UAF of zram table
    4c8b783c9d16 ALSA: hda/realtek: Add support for Ayaneo System using CS35L41 HDA
    ee37f3a538fc x86/asm: Make serialize() always_inline
    002b2efb1130 nvmet: propagate npwg topology
    8c9c1a2b48bb RDMA/bnxt_re: Fix to export port num to ib_query_qp
    bd6a4b4aed75 poll_wait: add mb() to fix theoretical race between waitqueue_active() and .poll()
    91371922704c iomap: avoid avoid truncating 64-bit offset to 32 bits
    4aaa1003a3f4 ACPI: resource: acpi_dev_irq_override(): Check DMI match last
    8cc32fc86e47 selftests: tc-testing: reduce rshift value
    8df41b7fb46d scsi: ufs: core: Honor runtime/system PM levels if set by host controller drivers
    933689000dff cachefiles: Parse the "secctx" immediately
    3f81514078fc kheaders: Ignore silly-rename files
    62861a5d4dd6 fs: fix missing declaration of init_files
    c598398815ee hfs: Sanity check the root record
    2e41e98c4e79 mac802154: check local interfaces before deleting sdata list
    1ea680703385 smb: client: fix double free of TCP_Server_Info::hostname
    6152c2c612a7 i2c: rcar: fix NACK handling when being a target
    573f036ba219 i2c: mux: demux-pinctrl: check initial mux selection, too
    f3311576789e Revert "mtd: spi-nor: core: replace dummy buswidth from addr to data"
    b9b63c9cc1e0 hwmon: (tmp513) Fix division of negative numbers
    3c8fe0931d9b soc: ti: pruss: Fix pruss APIs
    63195bae1cbf drm/v3d: Ensure job pointer is set to NULL after job completion
    5faf45beb701 drm/vmwgfx: Add new keep_resv BO param
    ff5b9e9be645 net/mlx5e: Always start IPsec sequence number from 1
    cdb3f2b62e2d net/mlx5e: Rely on reqid in IPsec tunnel mode
    87c4417a9021 net/mlx5e: Fix inversion dependency warning while enabling IPsec tunnel
    473bc285378f net/mlx5: Clear port select structure when fail to create
    ba8fdf7cff09 net/mlx5: Fix RDMA TX steering prio
    8a0097db0544 net: fec: handle page_pool_dev_alloc_pages error
    e8438cb84d0b net: xilinx: axienet: Fix IRQ coalescing packet count overflow
    325f2762fac7 nfp: bpf: prevent integer overflow in nfp_bpf_event_output()
    bb11f992f5a4 gtp: Destroy device along with udp socket's netns dismantle.
    d756c8ac3029 gtp: Use for_each_netdev_rcu() in gtp_genl_dump_pdp().
    3d1c0c5500f5 gtp: use exit_batch_rtnl() method
    1e222169f718 net: add exit_batch_rtnl() method
    7cde21f52042 pktgen: Avoid out-of-bounds access in get_imix_entries
    ea966b669878 openvswitch: fix lockup on tx to unregistering netdev with carrier
    b02e70be498b bpf: Fix bpf_sk_select_reuseport() memory leak
    c5af09473110 net: ethernet: ti: cpsw_ale: Fix cpsw_ale_get_field()
    3b4299ff7a25 Linux 6.6.73
    1795ca657119 Revert "ovl: do not encode lower fh with upper sb_writers held"
    d1c53de4463b Revert "ovl: pass realinode to ovl_encode_real_fh() instead of realdentry"
    950b604384fd Revert "ovl: support encoding fid from inode with no alias"
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
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++---
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 4655e7340f..3269ae02ec 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c2e0c18a98e6f16a4abd1ade619fae00f6fdfd66"
-SRCREV_meta ?= "7800a2b5bc4549ab39dab3bbae2d5dbf202133cb"
+SRCREV_machine ?= "0f28e3f97d1e08e950d8ebbe42ec9515bd651e5b"
+SRCREV_meta ?= "078f986aa4c328285abd0181cc21724d832a3ae0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.72"
+LINUX_VERSION ?= "6.6.74"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 589078e14b..6ad4641ef4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.72"
+LINUX_VERSION ?= "6.6.74"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "2ffba340fc0db0534dadc9c0eca01ad3ba3e1e4a"
-SRCREV_meta ?= "7800a2b5bc4549ab39dab3bbae2d5dbf202133cb"
+SRCREV_machine ?= "88adfb046ab500d81fea869024b0675c618754d9"
+SRCREV_meta ?= "078f986aa4c328285abd0181cc21724d832a3ae0"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index b7bd23784f..d1cc17eaf6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,18 +18,18 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "278435cb5a2e871ca818f0fb00f75249d2f8a9e5"
-SRCREV_machine:qemuarm64 ?= "2ffba340fc0db0534dadc9c0eca01ad3ba3e1e4a"
-SRCREV_machine:qemuloongarch64 ?= "2ffba340fc0db0534dadc9c0eca01ad3ba3e1e4a"
-SRCREV_machine:qemumips ?= "a56762013602aeb1bf2732cf8d21d08b8afdb91f"
-SRCREV_machine:qemuppc ?= "2ffba340fc0db0534dadc9c0eca01ad3ba3e1e4a"
-SRCREV_machine:qemuriscv64 ?= "2ffba340fc0db0534dadc9c0eca01ad3ba3e1e4a"
-SRCREV_machine:qemuriscv32 ?= "2ffba340fc0db0534dadc9c0eca01ad3ba3e1e4a"
-SRCREV_machine:qemux86 ?= "2ffba340fc0db0534dadc9c0eca01ad3ba3e1e4a"
-SRCREV_machine:qemux86-64 ?= "2ffba340fc0db0534dadc9c0eca01ad3ba3e1e4a"
-SRCREV_machine:qemumips64 ?= "11c0555e0dcc573b4803afd802b3b3d215ac8f2b"
-SRCREV_machine ?= "2ffba340fc0db0534dadc9c0eca01ad3ba3e1e4a"
-SRCREV_meta ?= "7800a2b5bc4549ab39dab3bbae2d5dbf202133cb"
+SRCREV_machine:qemuarm ?= "80e490532fddf18ff2565887b38ace8978e0e1bc"
+SRCREV_machine:qemuarm64 ?= "88adfb046ab500d81fea869024b0675c618754d9"
+SRCREV_machine:qemuloongarch64 ?= "88adfb046ab500d81fea869024b0675c618754d9"
+SRCREV_machine:qemumips ?= "1cd71fe6a69cc984c96f9942367bd350d13ffa93"
+SRCREV_machine:qemuppc ?= "88adfb046ab500d81fea869024b0675c618754d9"
+SRCREV_machine:qemuriscv64 ?= "88adfb046ab500d81fea869024b0675c618754d9"
+SRCREV_machine:qemuriscv32 ?= "88adfb046ab500d81fea869024b0675c618754d9"
+SRCREV_machine:qemux86 ?= "88adfb046ab500d81fea869024b0675c618754d9"
+SRCREV_machine:qemux86-64 ?= "88adfb046ab500d81fea869024b0675c618754d9"
+SRCREV_machine:qemumips64 ?= "2469f917cf13e4a2c100ddf2d347017f832ca44c"
+SRCREV_machine ?= "88adfb046ab500d81fea869024b0675c618754d9"
+SRCREV_meta ?= "078f986aa4c328285abd0181cc21724d832a3ae0"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.72"
+LINUX_VERSION ?= "6.6.74"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


