Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A535EC5B55A
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 17:39:29 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.1266.1748626764858106209
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 10:39:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=i78zG+PM;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-74264d1832eso2453695b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 10:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748626764; x=1749231564; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CjCENWqRLRekPHUxhuHPLwLcKpOZuFM1PXN1HO05wIg=;
        b=i78zG+PMUyQZK+bzXVO5sZ6kMCpvI/vXMB5rEeQSxBeFVAXIBwD6xgsw8Te6JhqImw
         2QKW2W4UYwB78zkr8cNCZMuKIG5pFxUnzMP/LIXYsIh1jtQT2+wEd0MFqXQnR+TMGhta
         4dZKxOGZVHlksv/ou+27HpKs0nMI+sM8xRiahPVKarXuHjbRIjnenKjnLJSKIszmMJxJ
         qQt0dYMrphz8SaSR0dSnMJWZrLLsiNYBV9XyIhds6UeuUPzSuEshGpjtsrNRIYoBBGM8
         3GJUaOFBHECtiD7mJ20nzvaEKENSXDQjrouTnwcO/dxtDURNBMYYecGpLVg1Y9zcOcj8
         uUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748626764; x=1749231564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CjCENWqRLRekPHUxhuHPLwLcKpOZuFM1PXN1HO05wIg=;
        b=ftLtGq5Fgm+Ar8nHAnJBeUiaJUMYnt5BMykB0S9aWqy47FI/Re3XNijpYcmfYgrdrH
         aB9Y5eG9l37YHHjnYwCBzX98Nu6ReSEVibXRa6hg4SLNZVfRFHpfyw/fuXcQiiFOzx+t
         qFaNjovzBqnfGUWai0jpLshIE2EfQuaAi444QoZtXCjg/V/jhXfSvtL6Tw2g7k2N2ehe
         QnblvuwbXR69QdrJ57zIICANf8RfnvW7hsft25yNA9pFwuz7oz/E72hIewVx2wn+uVXA
         2f7AiDqi2HHWOSf1Vq+8MZLeh/EnfZrWXbP3HDwq10RLUvnuGrtNAWBWDqPjHGx6FTlm
         Aevg==
X-Gm-Message-State: AOJu0Ywg94NZufPgbuoDtnK7UcXAy95D27QeIlG5dumutq/3hUNYf+cg
	0PXbuINENeMQQ1Q6oVAJUglhiEU+sPpTD38clV0sacs6MPXRneZYk1QpiPITT+3Mibm6oWjmWwB
	JUnIJ
X-Gm-Gg: ASbGncvAx/k5nARMp3zg/tVLKA/CBj+O20eB45krGaNYr7ZgGA5ka9yQn//eTewMXIt
	syDxm62dP7Ez+GrDfLiuRVUW+11bg+SNPGvVFK6G9GIBLq5WZGO5SSwnf34W6bzDRWuxM9tOg3R
	CMgPt0W55HCLq4meF8vp3fdZD7qCIhYMbaKj6ZF5uGoQWoIwztYK5x2L0m1FCmNJEjjjrjtMpcU
	Tt5Qp3cUfiagvP4EPceHYdzVhFRzpATwG81yaHN7cSon5DW25whXkAjn62tOBo99oJq+RRimA7A
	Bux8h38S4v+asfwiTVBzl4riror/YPkv05riqGPtE7E=
X-Google-Smtp-Source: AGHT+IFW0+UPFCmZxUvwsjvoXXr9V4vCK8fmgf2hSul54ju0+7463lbWBrhxUkfKzB3kqJ+N9T1JXg==
X-Received: by 2002:a05:6a21:600e:b0:1fa:9819:c0a5 with SMTP id adf61e73a8af0-21ad9537c0emr6630820637.11.1748626763778;
        Fri, 30 May 2025 10:39:23 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c9d8:e2d0:bfbc:3a26])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2ecebb5f40sm1554314a12.67.2025.05.30.10.39.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 10:39:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 10/12] linux-yocto/6.12: update to v6.12.30
Date: Fri, 30 May 2025 10:38:57 -0700
Message-ID: <33f96b93285b1ffa055cce59258837c5eeb165a0.1748626640.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748626640.git.steve@sakoman.com>
References: <cover.1748626640.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 17:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217533

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    e0e2f7824338 Linux 6.12.30
    25e07c8403f4 drm/amdgpu: fix pm notifier handling
    8e7583fb858c phy: tegra: xusb: remove a stray unlock
    5924b3244688 usb: typec: ucsi: displayport: Fix deadlock
    bca94cc34563 drm/tiny: panel-mipi-dbi: Use drm_client_setup_with_fourcc()
    5ed066083fc3 drm/panel-mipi-dbi: Run DRM default client setup
    25998ed87f0c drm/fbdev-dma: Support struct drm_driver.fbdev_probe
    d22496de5049 Bluetooth: btnxpuart: Fix kernel panic during FW release
    7ca84f6a22d5 iio: light: opt3001: fix deadlock due to concurrent flag access
    58517eae326e accel/ivpu: Fix fw log printing
    0923a7d55a85 accel/ivpu: Refactor functions in ivpu_fw_log.c
    1516c55872cc accel/ivpu: Reset fw log on cold boot
    1c302f64ea07 accel/ivpu: Rename ivpu_log_level to fw_log_level
    74953f93f47a mm/page_alloc: fix race condition in unaccepted memory handling
    260ca2e9617f drm/xe/gsc: do not flush the GSC worker from the reset path
    6b2d1fbd4146 CIFS: New mount option for cifs.upcall namespace resolution
    23dc14c52d84 dmaengine: idxd: Refactor remove call with idxd_cleanup() helper
    017d4012dc05 dmaengine: idxd: fix memory leak in error handling path of idxd_pci_probe
    868dbce755ec dmaengine: idxd: fix memory leak in error handling path of idxd_alloc
    21f9f5cd9a0c dmaengine: idxd: Add missing idxd cleanup to fix memory leak in remove call
    e0ba67b10d7c dmaengine: idxd: Add missing cleanups in cleanup internals
    80b02602279a dmaengine: idxd: Add missing cleanup for early error out in idxd_setup_internals
    56e2f09083cf dmaengine: idxd: fix memory leak in error handling path of idxd_setup_groups
    4958737c42e1 dmaengine: idxd: fix memory leak in error handling path of idxd_setup_engines
    5fcd392dae6d dmaengine: idxd: fix memory leak in error handling path of idxd_setup_wqs
    6b5d770e4563 dmaengine: ti: k3-udma: Use cap_mask directly from dma_device structure instead of a local copy
    26e63b2fe30c dmaengine: ti: k3-udma: Add missing locking
    fe0756daad52 mm: userfaultfd: correct dirty flags set for both present and swap pte
    d005c8166528 net: qede: Initialize qede_ll_ops with designated initializer
    20d6e621be48 ring-buffer: Fix persistent buffer when commit page is the reader page
    2b81e76db366 wifi: mt76: disable napi on driver removal
    ec5d9a750e91 tpm: Mask TPM RC in tpm2_start_auth_session()
    cac03fecbcc5 spi: tegra114: Use value to check for invalid delays
    d0df124437cc smb: client: fix memory leak during error handling for POSIX mkdir
    bffc3038a28b scsi: sd_zbc: block: Respect bio vector limits for REPORT ZONES buffer
    c450f648d0fc phy: renesas: rcar-gen3-usb2: Set timing registers only once
    c78a5693bd15 phy: renesas: rcar-gen3-usb2: Fix role detection on unbind/bind
    ed0e7d31d09a phy: Fix error handling in tegra_xusb_port_init
    1db527f0cb8f phy: tegra: xusb: Use a bitmask for UTMI pad power state tracking
    ce14aa00dd53 tracing: samples: Initialize trace_array_printk() with the correct function
    589c9e66bd47 ftrace: Fix preemption accounting for stacktrace filter command
    7d353da580c5 ftrace: Fix preemption accounting for stacktrace trigger command
    511ceee89966 kbuild: Disable -Wdefault-const-init-unsafe
    899e014e6847 Drivers: hv: vmbus: Remove vmbus_sendpacket_pagebuffer()
    4400b05ffabc Drivers: hv: Allow vmbus_sendpacket_mpb_desc() to create multiple ranges
    02a68f11ba84 arm64: dts: rockchip: Remove overdrive-mode OPPs from RK3588J SoC dtsi
    7f2e784f27bb arm64: dts: amlogic: dreambox: fix missing clkc_audio node
    b1d6694b39ec hv_netvsc: Remove rmsg_pgcnt
    7a508c604cd3 hv_netvsc: Preserve contiguous PFN grouping in the page buffer array
    24f05522c1c1 hv_netvsc: Use vmbus_sendpacket_mpb_desc() to send VMBus messages
    fe1bebd0edb2 dma-buf: insert memory barrier before updating num_fences
    93152dac0ba7 ALSA: usb-audio: Add sample rate quirk for Microdia JP001 USB Camera
    c88f4ff5354b ALSA: usb-audio: Add sample rate quirk for Audioengine D1
    f8302100f42b ALSA: es1968: Add error handling for snd_pcm_hw_constraint_pow2()
    7f8d77f65426 ACPI: PPTT: Fix processor subtable walk
    a348ff3f5b69 gpio: pca953x: fix IRQ storm on system wake up
    f0c0b8e6bc26 MAINTAINERS: Update Alexey Makhalov's email address
    64a33088adf2 drm/amd/display: Avoid flooding unnecessary info messages
    2d125a1f0d61 drm/amd/display: Correct the reply value when AUX write incomplete
    8d71c3231b33 drm/amdgpu: csa unmap use uninterruptible lock
    e54f20c5a17e drm/amdgpu: fix incorrect MALL size for GFX1151
    c75f3f9cbfb7 Revert "drm/amd/display: Hardware cursor changes color when switched to software cursor"
    3ee639985425 btrfs: add back warning for mount option commit values exceeding 300
    bf804f34adfb btrfs: fix folio leak in submit_one_async_extent()
    6ea6cea17ff8 btrfs: fix discard worker infinite loop after disabling discard
    12f69c4e3098 LoongArch: uprobes: Remove redundant code about resume_era
    88650dde2eea LoongArch: uprobes: Remove user_{en,dis}able_single_step()
    c92b99c4c097 LoongArch: Fix MAX_REG_OFFSET calculation
    213533657435 LoongArch: Save and restore CSR.CNTC for hibernation
    66a309b4d5bd LoongArch: Move __arch_cpu_idle() to .cpuidle.text section
    111e55db3ca3 LoongArch: Prevent cond_resched() occurring within kernel-fpu
    f8544be7e8e5 HID: bpf: abort dispatch if device destroyed
    d32c1880b33a udf: Make sure i_lenExtents is uptodate on inode eviction
    0102989af4c3 sched_ext: bpf_iter_scx_dsq_new() should always initialize iterator
    a0c247821813 dmaengine: Revert "dmaengine: dmatest: Fix dmatest waiting less when interrupted"
    153367726797 NFSv4/pnfs: Reset the layout state after a layoutreturn
    6dbf38159d8d tsnep: fix timestamping with a stacked DSA driver
    a11b8c0be6ac net/tls: fix kernel panic when alloc_page failed
    abc43c1ffdbc mlxsw: spectrum_router: Fix use-after-free when deleting GRE net devices
    07c737d9ab02 wifi: mac80211: Set n_channels after allocating struct cfg80211_scan_request
    7db81acae084 octeontx2-pf: Do not reallocate all ntuple filters
    1977cec5beaa octeontx2-af: Fix CGX Receive counters
    256adb2da583 net: ethernet: mtk_eth_soc: fix typo for declaration MT7988 ESW capability
    bf85a27605d0 octeontx2-pf: macsec: Fix incorrect max transmit size in TX secy
    38a2fdd3e9c9 netlink: specs: tc: all actions are indexed arrays
    be64ab9c173f netlink: specs: tc: fix a couple of attribute names
    3f16340071d0 drm/xe: Save CTX_TIMESTAMP mmio value instead of LRC value
    d2a9a92bb4cc regulator: max20086: fix invalid memory access
    5451b834b3ff qlcnic: fix memory leak in qlcnic_sriov_channel_cfg_cmd()
    1f80e6ff0260 net/mlx5e: Disable MACsec offload for uplink representor profile
    462e2243812e vsock/test: Fix occasional failure in SIOCOUTQ tests
    225e29465aa7 net: dsa: b53: prevent standalone from trying to forward to other ports
    bd993721789d ALSA: sh: SND_AICA should depend on SH_DMA_API
    a3c147040bb2 nvme-pci: acquire cq_poll_lock in nvme_poll_irqdisable
    ddfa034da318 nvme-pci: make nvme_pci_npages_prp() __always_inline
    0251e13f3f49 net: dsa: sja1105: discard incoming frames in BR_STATE_LISTENING
    3e64d35475aa net: cadence: macb: Fix a possible deadlock in macb_halt_tx.
    5ee626e47330 ALSA: ump: Fix a typo of snd_ump_stream_msg_device_info
    caac5761a6cd ALSA: seq: Fix delivery of UMP events to group ports
    8ee6ec20dd5f net: mctp: Ensure keys maintain only one ref to corresponding dev
    d308312acd0c tests/ncdevmem: Fix double-free of queue array
    38c937dbd4e4 selftests: ncdevmem: Switch to AF_INET6
    04db681f3c75 selftests: ncdevmem: Make client_ip optional
    0738648a7d61 selftests: ncdevmem: Unify error handling
    eb15f4f38013 selftests: ncdevmem: Separate out dmabuf provider
    f3380d119f61 selftests: ncdevmem: Redirect all non-payload output to stderr
    d4d1561d17eb net: mctp: Don't access ifa_index when missing
    9e5efcff49b3 mctp: no longer rely on net->dev_index_head[]
    37050be74e80 tools/net/ynl: ethtool: fix crash when Hardware Clock info is missing
    d1365ca80b01 net_sched: Flush gso_skb list too during ->change()
    28826a89fdfd Bluetooth: MGMT: Fix MGMT_OP_ADD_DEVICE invalid device flags
    10c7f1c647da RDMA/core: Fix "KASAN: slab-use-after-free Read in ib_register_device" problem
    de7acdb46291 spi: loopback-test: Do not split 1024-byte hexdumps
    da824f127163 nfs: handle failure of nfs_get_lock_context in unlock path
    94e7272b636a HID: uclogic: Add NULL check in uclogic_input_configured()
    a6999953707a HID: thrustmaster: fix memory leak in thrustmaster_interrupts()
    336edd6b0f5b RDMA/rxe: Fix slab-use-after-free Read in rxe_queue_cleanup bug
    c43b0a185fa6 virtio_net: ensure netdev_tx_reset_queue is called on bind xsk for tx
    343a77562c1f virtio_ring: add a func argument 'recycle_done' to virtqueue_reset()
    1cf8bdd596a8 iio: chemical: sps30: use aligned_s64 for timestamp
    7b16d3c36123 iio: adc: ad7768-1: Fix insufficient alignment of timestamp.
    b9e0997f2e84 xhci: dbc: Avoid event polling busyloop if pending rx transfers are inactive.
    651eaaae6baa xhci: dbc: Improve performance by removing delay in transfer event polling.
    5d9d62323e18 Revert "drm/amd: Stop evicting resources on APUs in suspend"
    4d45a5f1e2a0 drm/amd: Add Suspend/Hibernate notification callback support
    ea0153e065f4 iio: pressure: mprls0025pa: use aligned_s64 for timestamp
    039681d656a3 iio: chemical: pms7003: use aligned_s64 for timestamp
    b37c112ef265 iio: adc: ad7266: Fix potential timestamp alignment issue.
    a065f78eba2a KVM: x86/mmu: Prevent installing hugepages when mem attributes are changing
    3d962ec543e5 KVM: Add member to struct kvm_gfn_range to indicate private/shared
    54401e29ab4f uio_hv_generic: Fix sysfs creation path for ring buffer
    7bf64cd0ccb8 tpm: tis: Double the timeout B to 4s
    517c11fe4fcb tracing: probes: Fix a possible race in trace_probe_log APIs
    f0d70d8dcae4 cgroup/cpuset: Extend kthread_is_per_cpu() check to all PF_NO_SETAFFINITY tasks
    220444d2095a arm64: dts: imx8mp-var-som: Fix LDO5 shutdown causing SD card timeout
    48fff1267e8d platform/x86: asus-wmi: Fix wlan_ctrl_by_user detection
    03e4ee3a9a26 platform/x86/amd/pmc: Declare quirk_spurious_8042 for MECHREVO Wujie 14XA (GX4HRXL)
    bc4c54cbb430 binfmt_elf: Move brk for static PIE even if ASLR disabled
    97dd8c19f2a3 riscv: dts: sophgo: fix DMA data-width configuration for CV18xx
    a0bde67526c0 drivers/platform/x86/amd: pmf: Check for invalid Smart PC Policies
    5022d7a39255 drivers/platform/x86/amd: pmf: Check for invalid sideloaded Smart PC Policies
    10d1496f85d7 fs/xattr.c: fix simple_xattr_list to always include security.* xattrs
    61f489ca9940 arm64: dts: rockchip: Assign RT5616 MCLK rate on rk3588-friendlyelec-cm3588
    2ee7ebed771b mips: Add '-std=gnu11' to vdso CFLAGS
    b2c792d89ac5 yaffs2: switch from readlink_copy() to vfs_readlink()
    807165b1ec1c tools/power/x86/intel-speed-select: Prefix header search path with sysroot
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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a487b32fc93e639267fc5aee12842132accc0873)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index f2ab88bc55..24d93645ca 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "9ee7ecfcabe12ffae693f11c83d8cf6d8181f12a"
-SRCREV_meta ?= "da71eb19ceab34a7a6ff4284f1580e043c870168"
+SRCREV_machine ?= "3d3d56a846c993611859096016322dccea1317cd"
+SRCREV_meta ?= "60484dda26122958e5f4d8f813424fa637770bf6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.29"
+LINUX_VERSION ?= "6.12.30"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index bf7c61415e..042adf94d0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.29"
+LINUX_VERSION ?= "6.12.30"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "e4b00bee45a4432a5739542e2b50def9a63ba6d0"
-SRCREV_meta ?= "da71eb19ceab34a7a6ff4284f1580e043c870168"
+SRCREV_machine ?= "0898369ce44f92eba60ae9bf0013bc4338ce840e"
+SRCREV_meta ?= "60484dda26122958e5f4d8f813424fa637770bf6"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 79fc65f826..089d4b4c6a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "556bd3efe644334440f7c2be6df21a5d05d9e471"
-SRCREV_machine:qemuarm64 ?= "e4b00bee45a4432a5739542e2b50def9a63ba6d0"
-SRCREV_machine:qemuloongarch64 ?= "e4b00bee45a4432a5739542e2b50def9a63ba6d0"
-SRCREV_machine:qemumips ?= "93b73e8b0f1d2d23499ece2050e55a69057aec5a"
-SRCREV_machine:qemuppc ?= "e4b00bee45a4432a5739542e2b50def9a63ba6d0"
-SRCREV_machine:qemuriscv64 ?= "e4b00bee45a4432a5739542e2b50def9a63ba6d0"
-SRCREV_machine:qemuriscv32 ?= "e4b00bee45a4432a5739542e2b50def9a63ba6d0"
-SRCREV_machine:qemux86 ?= "e4b00bee45a4432a5739542e2b50def9a63ba6d0"
-SRCREV_machine:qemux86-64 ?= "e4b00bee45a4432a5739542e2b50def9a63ba6d0"
-SRCREV_machine:qemumips64 ?= "e2f38ec1df747da895699dcb9955606e1a8d60da"
-SRCREV_machine ?= "e4b00bee45a4432a5739542e2b50def9a63ba6d0"
-SRCREV_meta ?= "da71eb19ceab34a7a6ff4284f1580e043c870168"
+SRCREV_machine:qemuarm ?= "5c1cc01b780f83de6f9c0bacf45ffa2de68be95c"
+SRCREV_machine:qemuarm64 ?= "0898369ce44f92eba60ae9bf0013bc4338ce840e"
+SRCREV_machine:qemuloongarch64 ?= "0898369ce44f92eba60ae9bf0013bc4338ce840e"
+SRCREV_machine:qemumips ?= "87d7d289ec3d56a1bd1d7a7c7cb46af8cf6c0f27"
+SRCREV_machine:qemuppc ?= "0898369ce44f92eba60ae9bf0013bc4338ce840e"
+SRCREV_machine:qemuriscv64 ?= "0898369ce44f92eba60ae9bf0013bc4338ce840e"
+SRCREV_machine:qemuriscv32 ?= "0898369ce44f92eba60ae9bf0013bc4338ce840e"
+SRCREV_machine:qemux86 ?= "0898369ce44f92eba60ae9bf0013bc4338ce840e"
+SRCREV_machine:qemux86-64 ?= "0898369ce44f92eba60ae9bf0013bc4338ce840e"
+SRCREV_machine:qemumips64 ?= "98a85ed93bd5eaefe30c4aa3f7c15549be2bd032"
+SRCREV_machine ?= "0898369ce44f92eba60ae9bf0013bc4338ce840e"
+SRCREV_meta ?= "60484dda26122958e5f4d8f813424fa637770bf6"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "5be5dbf91ef3c8643d2a3698d557a52059702487"
+SRCREV_machine:class-devupstream ?= "e0e2f78243385e7188a57fcfceb6a19f723f1dff"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.29"
+LINUX_VERSION ?= "6.12.30"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


