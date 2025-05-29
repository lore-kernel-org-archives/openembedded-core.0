Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC98C5B558
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 16:58:08 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.26214.1748537887235586138
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 09:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ip7mUFVH;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6fac7147cb8so5724096d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 09:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748537886; x=1749142686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xijNWCx1BdhWduYWAXza8+/wU2eaQKJfQDgQg3PZMu4=;
        b=Ip7mUFVHFk8U0NX90k5okufxFjSSQ2NSNpvBXi1tCRSWjwZe8c483G+04c2unuSLCj
         OBHjIYqIPD/NDpe3HEGYQWQ44DTEYef7wLSSMvM9VvS1+i7k3KAdHwa1+KnfjKNl2NXT
         l24mq//ytPrWCNYp6I7h9HUOegb8LI2cse+c9c8S21vMVsS+uSeOB/96qkxulfs8OeGm
         exmjqZNJwwUXddscpe2F/z3VPqtuDP5RS2rbcFFphZYT/YWiHkjbHnrhUkScEUiEDXoZ
         UmUrz4yJ8Fn5sf/T94L2WeApfmE35xflW9u93SXzuflKwdCtjI9YgEIezWBljbPXlgha
         Q5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748537886; x=1749142686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xijNWCx1BdhWduYWAXza8+/wU2eaQKJfQDgQg3PZMu4=;
        b=p53EqCTy9mFrCHw+e7odp/9wBCXa67xH3r+BZhuH1C3K7+98zO9qmmpmcPPq3lFqKN
         kS/YkW187NzjmCVHnLTiShbK27yg85FlGv4B03gcP3lKvR67bMcr6iJB59GL9G5XHgxj
         Ks30bBQNZFl7FwFq8BdLiyFRu5+1kRFtL5YTh1DBzBtzsLoDxdBo0GXSHlH/5X4UwUo2
         z4Xpa1xWzekTZCzRkS26g0odpaINZ6lovy4pZY3sPvIEha7BqJIYmt7SU6YqG6WO1Qkp
         M9g5SEfFO8miLcOelYslRGPnYW2GIcX6TwnBTWL2lavJATWeGznW6rkWziTauvaZhj6a
         OdrQ==
X-Gm-Message-State: AOJu0YxLPSuIzhiR5yUwP3K3533OdM9X35OZuB0ErR+yKzApVb3ge4fw
	jDOj6wSrv4CqNO3AXrtuPgaY33ZQXEkYRhBcTitHenCRwGeuPUVeFLNI7qahy2HA
X-Gm-Gg: ASbGncvwd3siwEB+i68RO9R8Y+uAgXRnqj/Cwgg0h/bzXtZjhjFZAel0NyhMyCOW0sq
	FLGaXOSKlfNttdQbqUgejZbHEnecH83dWICBlKtvL2IGoXY4+Luvh1RhMaazY/cQmZQIxQN4Z7Z
	yUDihjPFXmrdTcG91XA4LXTCEm1mii4mGEOWq3d7uoq1MeEUxOD5ERTPGNt7S7JwsVHKTKIn3D1
	H8ewxibEcECPyoYol/IeI2ULos87HMryk6L/2uzqc7zcniT9JuZu0/BZJSewXtmPPyfpJhEmayh
	3mCOteQS4QBEsty2HzMSPyN2iWQ0I9rJLERU9/LJw/JuiXr5LvY57SI/VA5+KCZW0lblIpYr42z
	rv03AxXYs+VsFQy8CH5RZf7q7rtwumceySlJ9R+0wS9h9V77Kd1TfPcF5c59U8eo=
X-Google-Smtp-Source: AGHT+IGbFa34doBP18wbeuKjXdek6lHv/TdI/iPzF3DqzxIkl/Jsku+zkkY8ALkYAct9vCX0jl7Z/Q==
X-Received: by 2002:a05:6214:c4d:b0:6f8:af20:367d with SMTP id 6a1803df08f44-6faced281ddmr5469606d6.39.1748537885984;
        Thu, 29 May 2025 09:58:05 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6e1c02csm11382676d6.109.2025.05.29.09.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 09:58:05 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 8/8] linux-yocto/6.6: update to v6.6.92
Date: Thu, 29 May 2025 12:57:54 -0400
Message-Id: <20250529165754.264501-8-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250529165754.264501-1-bruce.ashfield@gmail.com>
References: <20250529165754.264501-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 16:58:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217427

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    ffaf6178137b Linux 6.6.92
    35559ebcdc89 drm/amdgpu: fix pm notifier handling
    c1d42a239be5 phy: tegra: xusb: remove a stray unlock
    3cfec712a439 btrfs: don't BUG_ON() when 0 reference count at btrfs_lookup_extent_info()
    b3598f53211b sctp: add mutual exclusion in proc_sctp_do_udp_port()
    93df6da64b00 hwpoison, memory_hotplug: lock folio before unmap hwpoisoned folio
    7bcd29181bab memblock: Accept allocated memory before use in memblock_double_array()
    6133444518b7 LoongArch: Explicitly specify code model in Makefile
    f521c2a0c0c4 bpf, arm64: Fix address emission with tag-based KASAN enabled
    d9664e6ff040 bpf, arm64: Fix trampoline for BPF_TRAMP_F_CALL_ORIG
    bfc26aa3ab4c mm/migrate: correct nr_failed in migrate_pages_sync()
    62798e3291f5 selftests/mm: compaction_test: support platform with huge mount of memory
    962ce9028ca6 usb: typec: ucsi: displayport: Fix deadlock
    a0a736d9857c Bluetooth: btnxpuart: Fix kernel panic during FW release
    98fdd2f612e9 mm/page_alloc: fix race condition in unaccepted memory handling
    e24073cd8f16 x86/its: Fix build error for its_static_thunk()
    d530dd65f6f3 dmaengine: idxd: Refactor remove call with idxd_cleanup() helper
    a6cce316327c dmaengine: idxd: fix memory leak in error handling path of idxd_pci_probe
    6e94a2c3e4c1 dmaengine: idxd: fix memory leak in error handling path of idxd_alloc
    d2d05fd0fc95 dmaengine: idxd: Add missing idxd cleanup to fix memory leak in remove call
    32ec46adf1a6 dmaengine: idxd: Add missing cleanups in cleanup internals
    404aad9b0c6f dmaengine: idxd: Add missing cleanup for early error out in idxd_setup_internals
    6ab9526e32ac dmaengine: idxd: fix memory leak in error handling path of idxd_setup_groups
    9ba964b17fca dmaengine: idxd: fix memory leak in error handling path of idxd_setup_engines
    47846211998a dmaengine: idxd: fix memory leak in error handling path of idxd_setup_wqs
    1c9e4ed01117 dmaengine: ti: k3-udma: Use cap_mask directly from dma_device structure instead of a local copy
    d87f1cddc592 dmaengine: ti: k3-udma: Add missing locking
    5340d0e84d5c net: qede: Initialize qede_ll_ops with designated initializer
    5e700b06b970 wifi: mt76: disable napi on driver removal
    55018ca1cc7a spi: tegra114: Use value to check for invalid delays
    d8843fb1a253 smb: client: fix memory leak during error handling for POSIX mkdir
    c682a193447a scsi: sd_zbc: block: Respect bio vector limits for REPORT ZONES buffer
    a1546ec7e049 phy: renesas: rcar-gen3-usb2: Set timing registers only once
    99fc6f1c371e phy: renesas: rcar-gen3-usb2: Fix role detection on unbind/bind
    2b169aa46f97 phy: Fix error handling in tegra_xusb_port_init
    ba25131b3c1c phy: tegra: xusb: Use a bitmask for UTMI pad power state tracking
    b1627af84e1e tracing: samples: Initialize trace_array_printk() with the correct function
    9d1216bf4910 ftrace: Fix preemption accounting for stacktrace filter command
    fa75d941b104 ftrace: Fix preemption accounting for stacktrace trigger command
    6d2d37520545 Drivers: hv: vmbus: Remove vmbus_sendpacket_pagebuffer()
    c0f3f0c88f16 Drivers: hv: Allow vmbus_sendpacket_mpb_desc() to create multiple ranges
    115c7890476e hv_netvsc: Remove rmsg_pgcnt
    307963a3abf8 hv_netvsc: Preserve contiguous PFN grouping in the page buffer array
    da5d5bc3ad3d hv_netvsc: Use vmbus_sendpacket_mpb_desc() to send VMBus messages
    c9d2b9a80d06 dma-buf: insert memory barrier before updating num_fences
    fc8fa09d40de ALSA: usb-audio: Add sample rate quirk for Microdia JP001 USB Camera
    46b33b97252d ALSA: usb-audio: Add sample rate quirk for Audioengine D1
    2759938c4a37 ALSA: es1968: Add error handling for snd_pcm_hw_constraint_pow2()
    124522cc6b61 ACPI: PPTT: Fix processor subtable walk
    6456c818dc53 drm/amd/display: Avoid flooding unnecessary info messages
    43b35d404f6d drm/amd/display: Correct the reply value when AUX write incomplete
    34439d470ba0 LoongArch: uprobes: Remove redundant code about resume_era
    840663825ef6 LoongArch: uprobes: Remove user_{en,dis}able_single_step()
    ad1e441016e0 LoongArch: Fix MAX_REG_OFFSET calculation
    e89bd983f3cd LoongArch: Save and restore CSR.CNTC for hibernation
    f4c0a7999fb5 LoongArch: Prevent cond_resched() occurring within kernel-fpu
    7722fba9f3bf udf: Make sure i_lenExtents is uptodate on inode eviction
    a0302cb13918 dmaengine: Revert "dmaengine: dmatest: Fix dmatest waiting less when interrupted"
    e1b755c0d876 NFSv4/pnfs: Reset the layout state after a layoutreturn
    c1dd9ccc0f0c tsnep: fix timestamping with a stacked DSA driver
    0980e62ab822 tsnep: Inline small fragments within TX descriptor
    406d05da2683 net/tls: fix kernel panic when alloc_page failed
    f1ecccb5cdda mlxsw: spectrum_router: Fix use-after-free when deleting GRE net devices
    fde33ab3c052 wifi: mac80211: Set n_channels after allocating struct cfg80211_scan_request
    72ee7af61570 octeontx2-af: Fix CGX Receive counters
    398989c7800e net: ethernet: mtk_eth_soc: fix typo for declaration MT7988 ESW capability
    03c42d35c329 octeontx2-pf: macsec: Fix incorrect max transmit size in TX secy
    7bddac8603d4 regulator: max20086: fix invalid memory access
    9c2d0899c680 qlcnic: fix memory leak in qlcnic_sriov_channel_cfg_cmd()
    b48a47e137ce net/mlx5e: Disable MACsec offload for uplink representor profile
    4a7d4031fab5 ALSA: sh: SND_AICA should depend on SH_DMA_API
    c70c021be025 nvme-pci: acquire cq_poll_lock in nvme_poll_irqdisable
    64638f3103d0 nvme-pci: make nvme_pci_npages_prp() __always_inline
    cbe3f0445181 net: dsa: sja1105: discard incoming frames in BR_STATE_LISTENING
    1d60c0781c1b net: cadence: macb: Fix a possible deadlock in macb_halt_tx.
    4e132f56bc64 ALSA: ump: Fix a typo of snd_ump_stream_msg_device_info
    8a8dc7fd1e3b ALSA: seq: Fix delivery of UMP events to group ports
    e4d8a517324c net: mctp: Ensure keys maintain only one ref to corresponding dev
    acab78ae12c7 net: mctp: Don't access ifa_index when missing
    2d45eeb7d5d7 mctp: no longer rely on net->dev_index_head[]
    7777ca11a40b tools/net/ynl: ethtool: fix crash when Hardware Clock info is missing
    95a9e08ea5bb tools: ynl: ethtool.py: Output timestamping statistics from tsinfo-get operation
    a7d6e0ac0a88 net_sched: Flush gso_skb list too during ->change()
    31492b8386e5 Bluetooth: MGMT: Fix MGMT_OP_ADD_DEVICE invalid device flags
    b8084e8135af spi: loopback-test: Do not split 1024-byte hexdumps
    a6879a076b98 nfs: handle failure of nfs_get_lock_context in unlock path
    ad6caaf29bc2 HID: uclogic: Add NULL check in uclogic_input_configured()
    4715f16b1e43 HID: thrustmaster: fix memory leak in thrustmaster_interrupts()
    ee4c5a2a3859 RDMA/rxe: Fix slab-use-after-free Read in rxe_queue_cleanup bug
    99173e6f28e4 iio: chemical: sps30: use aligned_s64 for timestamp
    02023c289903 iio: adc: ad7768-1: Fix insufficient alignment of timestamp.
    41ade94ad443 Revert "drm/amd: Stop evicting resources on APUs in suspend"
    c1a4d21a1547 drm/amd: Add Suspend/Hibernate notification callback support
    d59f45595102 drm/amdgpu: trigger flr_work if reading pf2vf data failed
    9a6d2e19448e drm/amdgpu: Fix the runtime resume failure issue
    95db39dbaa8c drm/amd: Stop evicting resources on APUs in suspend
    220192d5141a iio: adc: ad7266: Fix potential timestamp alignment issue.
    ec24e62a1dd3 KVM: SVM: Forcibly leave SMM mode on SHUTDOWN interception
    635b3cc639b8 KVM: SVM: Update SEV-ES shutdown intercepts with more metadata
    2402a3ef9e8c firmware: arm_scmi: Fix timeout checks on polling path
    b38812942556 firmware: arm_scmi: Track basic SCMI communication debug metrics
    0b175f7c4fe9 firmware: arm_scmi: Add support for debug metrics at the interface
    844b899f7899 firmware: arm_scmi: Add message dump traces for bad and unexpected replies
    6bddbdbeb748 firmware: arm_scmi: Add helper to trace bad messages
    7ea1913daafc tpm: tis: Double the timeout B to 4s
    70417bada46d tracing: probes: Fix a possible race in trace_probe_log APIs
    4e63b6907d07 cgroup/cpuset: Extend kthread_is_per_cpu() check to all PF_NO_SETAFFINITY tasks
    44a4c0dba8c3 platform/x86: asus-wmi: Fix wlan_ctrl_by_user detection
    6b92eee6b96d platform/x86/amd/pmc: Declare quirk_spurious_8042 for MECHREVO Wujie 14XA (GX4HRXL)
    bfe0dd3b7329 binfmt_elf: Move brk for static PIE even if ASLR disabled
    622b7267d787 binfmt_elf: Honor PT_LOAD alignment for static PIE
    d9c175875610 binfmt_elf: Calculate total_size earlier
    d3642f29f549 selftests/exec: Build both static and non-static load_address tests
    7435fa1c530d binfmt_elf: Leave a gap between .bss and brk
    0d6a2bada5d9 selftests/exec: load_address: conform test to TAP format output
    fe7eb1f32a85 binfmt_elf: elf_bss no longer used by load_elf_binary()
    c6df4c71ae1c binfmt_elf: Support segments with 0 filesz and misaligned starts
    11689bb0f7a6 fs/xattr.c: fix simple_xattr_list to always include security.* xattrs
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
index 1cc29e632a..d855ee3f8a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "d1fbd2d6727d1036c200e4b1aa0190aaf735b3de"
-SRCREV_meta ?= "f39840f2f44ad614ddf59c402b464a0ce7e04532"
+SRCREV_machine ?= "1933814ca46d38977965bbfe58ee3a1f8aacfb36"
+SRCREV_meta ?= "8e66f449e449f9ae2809b6c395ed7089aa37d7a3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.91"
+LINUX_VERSION ?= "6.6.92"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 7db20c0959..382a74f648 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.91"
+LINUX_VERSION ?= "6.6.92"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "d00f12b1b1a9fb6dc55c27c78c8c131e4a1cbdae"
-SRCREV_meta ?= "f39840f2f44ad614ddf59c402b464a0ce7e04532"
+SRCREV_machine ?= "c72b190dc393b310be436153c864144694b184a6"
+SRCREV_meta ?= "8e66f449e449f9ae2809b6c395ed7089aa37d7a3"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 75b41a5317..c1bb736e04 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "9c31285259d92c008165481f4120aded6e10c93a"
-SRCREV_machine:qemuarm64 ?= "c57114d59935f0a976f2ff18b1c7dbd5c24710b6"
-SRCREV_machine:qemuloongarch64 ?= "23977e07766767fc6144b53967998afa04fe9b96"
-SRCREV_machine:qemumips ?= "e27992a5fd0ac7678b59cec9219351fd8f16e3e5"
-SRCREV_machine:qemuppc ?= "5fde391143db93ac37953d90962beba1a4af31d1"
-SRCREV_machine:qemuriscv64 ?= "23977e07766767fc6144b53967998afa04fe9b96"
-SRCREV_machine:qemuriscv32 ?= "23977e07766767fc6144b53967998afa04fe9b96"
-SRCREV_machine:qemux86 ?= "23977e07766767fc6144b53967998afa04fe9b96"
-SRCREV_machine:qemux86-64 ?= "23977e07766767fc6144b53967998afa04fe9b96"
-SRCREV_machine:qemumips64 ?= "dd954fc36eb77f8aab6395ad7ff1341c3712aada"
-SRCREV_machine ?= "23977e07766767fc6144b53967998afa04fe9b96"
-SRCREV_meta ?= "f39840f2f44ad614ddf59c402b464a0ce7e04532"
+SRCREV_machine:qemuarm ?= "1d95b0a9486ae02a4eb38df55b94cb64485bd4c0"
+SRCREV_machine:qemuarm64 ?= "8cd580eb06e43c9a4e9c26e1dd954a334f656fbd"
+SRCREV_machine:qemuloongarch64 ?= "6032c9c1ac18edd7c8eadd6f9f655556b5f5e77c"
+SRCREV_machine:qemumips ?= "a3bbede9b1c6dbd0b51132b8447adbbde1f46f85"
+SRCREV_machine:qemuppc ?= "a5bba7e08dbb26c0dc7d7ec0624e903b7c6bac94"
+SRCREV_machine:qemuriscv64 ?= "6032c9c1ac18edd7c8eadd6f9f655556b5f5e77c"
+SRCREV_machine:qemuriscv32 ?= "6032c9c1ac18edd7c8eadd6f9f655556b5f5e77c"
+SRCREV_machine:qemux86 ?= "6032c9c1ac18edd7c8eadd6f9f655556b5f5e77c"
+SRCREV_machine:qemux86-64 ?= "6032c9c1ac18edd7c8eadd6f9f655556b5f5e77c"
+SRCREV_machine:qemumips64 ?= "a1ed8408c3b0bc729270cc2bd2c9dd0056ab9271"
+SRCREV_machine ?= "6032c9c1ac18edd7c8eadd6f9f655556b5f5e77c"
+SRCREV_meta ?= "8e66f449e449f9ae2809b6c395ed7089aa37d7a3"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "615b9e10e3377467ced8f50592a1b5ba8ce053d8"
+SRCREV_machine:class-devupstream ?= "ffaf6178137b9cdcc9742d6677b70be164dfeb8c"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.91"
+LINUX_VERSION ?= "6.6.92"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


