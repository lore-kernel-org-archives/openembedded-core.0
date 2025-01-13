Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E14A9C02186
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 20:47:28 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.28739.1736801246968306042
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 12:47:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=3d46q0EO;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21661be2c2dso80801675ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 12:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736801246; x=1737406046; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QCuSNwyU8JziyVHkdkUDYT7hdXgmnyqBL58DklyCIe0=;
        b=3d46q0EOInO8WnUzY79ICHguzF2i4MrlB9PNVZqV6Em6l5Nj0Pm9gxctpS7DPNzaPB
         vYIkQxTsrOmURCywdyZ/EsvUZvepsJuaL8Bc2mI+YlLRUDIWd25+pJp8ShsGpqH/v7Yb
         UJOzsNb+HQOVLx0IlKmqsbcUfAyXTcD8wK8rU55SEUoZUSmuedohrwNHmXYEylnVFhZS
         aXxLsvZdPmHfR8w/1Fe3B9uvTjRXxAj/kERldLTCn4Vegandzz/E/e5bkz+v29E0+4jJ
         5wCtyaIf8E8KSGMp/qPdsrOMGddEw87vgkw7Qkkr+TbwN25NELZMoQSRqKUijg2gj5oW
         fRhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736801246; x=1737406046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QCuSNwyU8JziyVHkdkUDYT7hdXgmnyqBL58DklyCIe0=;
        b=mBk4RJTkQ1ybDs1sPVbt4Aa+6AxCXleOSBnoeo5syQUO5QvUiGqCHs/Y7X2aGeqT4w
         CUsoWYaeBJMLoaVnAZnR5J8yODl5cQoCYAOoVaUuZsY+LK6XpPGHSwlUsZc1v2LBX3wJ
         48syORJthNuTgzEaQF3ZmN967MjOSbi2Roh9m9/QISRO65SDBrsU1OV1SfN48tUafAhl
         +GsxOT2VQ7+C3etF5t+ZwaBs9F3dDyUJmVy48kTsCnhlyfJ6m2yd0J9LRYjyje6m0jfx
         IlEeg6gr7db19joADxNtmfecArGLy79EutN1H/rl+P6KqHCwMUSka/Mii0YpbS1YwUqF
         uMWQ==
X-Gm-Message-State: AOJu0Yxb/WMrKXf/y+r3d1Zh056tdoQlY/et9/Ex4dg8ggnYczimFGpB
	lGOa4vrke0z1pSmUS/EoAnuewX44d6T6xzzqpMV5LkISPtEJeG94thekmZIAksn8Gs6vyXDkPCi
	jNzw=
X-Gm-Gg: ASbGncu0veWTD5oJ5pOpk7LuKksPB2j6roGw09OiO6beQrAp+cp3uE3+sOljlbXOLro
	rQk9Sf4QCkFBDpeyvWbkZ24WeGJGoOmuS18Ky7QLahADZax19+SZ//DVSImDcvCEzHiC2YMfinf
	WUOXnj5UhHg6y+azQLuAwYhJRfdWGeybDw50V9IvM5gEqvk/3FPcaVeqme27AjG1NecwHWQxPNk
	K7k1/r9bohNiBTqhuicE3ilGfgFSqPEDeDqrG4PklFGgg==
X-Google-Smtp-Source: AGHT+IH/L/cPW9NQcG2apdATlJbSx3GIVgWrcKItBKkj4YpIK8UdrIVjhusY8vD5Z4LbylLNYX21Ag==
X-Received: by 2002:a05:6a20:c887:b0:1db:ff9c:6f3a with SMTP id adf61e73a8af0-1e88d320c3fmr32561937637.42.1736801245888;
        Mon, 13 Jan 2025 12:47:25 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40549413sm6449435b3a.12.2025.01.13.12.47.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 12:47:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/15] linux-yocto/6.6: update to v6.6.60
Date: Mon, 13 Jan 2025 12:46:58 -0800
Message-ID: <5993e3621377e77f031768fa53668f790c364847.1736801113.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736801113.git.steve@sakoman.com>
References: <cover.1736801113.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 20:47:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209750

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    9b5aad3a7498c Linux 6.6.60
    cc082e50375a2 fs/ntfs3: Sequential field availability check in mi_enum_attr()
    10c20d79d59ca drm/amd/display: Add null checks for 'stream' and 'plane' before dereferencing
    e979a6a626abf ASoC: SOF: ipc4-control: Add support for ALSA enum control
    3facc0417d3d7 ASoC: SOF: ipc4-control: Add support for ALSA switch control
    f01d8fc623711 ASoC: SOF: ipc4-topology: Add definition for generic switch/enum control
    d54afaef6570c SUNRPC: Remove BUG_ON call sites
    27a58a19bd20a mtd: spi-nor: winbond: fix w25q128 regression
    3d544942c0010 mm: don't install PMD mappings when THPs are disabled by the hw/process/vma
    02ec4b3bba49e mm: huge_memory: add vma_thp_disabled() and thp_disabled_by_hw()
    fc621e7a043de wifi: iwlwifi: mvm: fix 6 GHz scan construction
    f2f1fa446676c nilfs2: fix kernel bug due to missing clearing of checked flag
    a53c2d847627b wifi: mac80211: fix NULL dereference at band check in starting tx ba session
    6a91a5816b289 io_uring: always lock __io_cqring_overflow_flush
    e3fb0e6afcc39 arm64: dts: imx8ulp: correct the flexspi compatible string
    1a49b96c51063 vmscan,migrate: fix page count imbalance on node stats when demoting pages
    003d2996964c0 io_uring/rw: fix missing NOWAIT check for O_DIRECT start write
    70bbe8d0a9494 kasan: remove vmalloc_percpu test
    c60af16e1d6cc nvmet-auth: assign dh_key to NULL after kfree_sensitive
    4a39320977f9c ALSA: hda/realtek: Fix headset mic on TUXEDO Stellaris 16 Gen6 mb1
    b42adef85aca7 ALSA: hda/realtek: Fix headset mic on TUXEDO Gemini 17 Gen3
    77ddc732416b0 xfs: fix finding a last resort AG in xfs_filestream_pick_ag
    8e886e44397ba mctp i2c: handle NULL header address
    88f97a4b5843c ocfs2: pass u64 to ocfs2_truncate_inline maybe overflow
    c117a980185ee x86/traps: move kmsan check after instrumentation_begin
    86ee1845cbbf5 x86/traps: Enable UBSAN traps on x86
    b958948ae1cb3 mm/page_alloc: let GFP_ATOMIC order-0 allocs access highatomic reserves
    4882a352b5df8 mei: use kvmalloc for read buffer
    cb8b81ad3e893 mptcp: init: protect sched with rcu_read_lock
    4f7ffa83fa79d iov_iter: fix copy_page_from_iter_atomic() if KMAP_LOCAL_FORCE_MAP
    ade91f6e9848b sched/numa: Fix the potential null pointer dereference in task_numa_work()
    8c9a1ec39c698 cxl/acpi: Ensure ports ready at cxl_acpi_probe() return
    a9ed67f39f888 cxl/port: Fix cxl_bus_rescan() vs bus_rescan_devices()
    d210bc87cc4fd riscv: Remove duplicated GET_RM
    6d84e1b2e5ac0 riscv: Remove unused GENERATING_ASM_OFFSETS
    a63ba17207c50 riscv: Use '%u' to format the output of 'cpu'
    909e71f28e961 riscv: efi: Set NX compat flag in PE/COFF header
    58e78589ade88 ALSA: hda/realtek: Limit internal Mic boost on Dell platform
    ceec8ad09135c Input: edt-ft5x06 - fix regmap leak when probe fails
    c19a0c171d37f riscv: vdso: Prevent the compiler from inserting calls to memset()
    e79c1f1c9100b spi: spi-fsl-dspi: Fix crash when not using GPIO chip select
    163e6323799bd phy: freescale: imx8m-pcie: Do CMN_RST just before PHY PLL lock check
    0d86cd70fc6a7 cgroup/bpf: use a dedicated workqueue for cgroup bpf destruction
    b3c301b859c4a block: fix sanity checks in blk_rq_map_user_bvec
    0fc87887dcb3a mmc: sdhci-pci-gli: GL9767: Fix low power mode in the SD Express process
    4159cd6ab5cfe mmc: sdhci-pci-gli: GL9767: Fix low power mode on the set clock function
    8e1b52c15c811 cxl/port: Fix use-after-free, permit out-of-order decoder shutdown
    8cd25f1fce6b8 thunderbolt: Honor TMU requirements in the domain when setting TMU mode
    9523a0268924a tools/mm: -Werror fixes in page-types/slabinfo
    edd1f90505068 mm: shmem: fix data-race in shmem_getattr()
    b6f95df4f7af6 RISC-V: ACPI: fix early_ioremap to early_memremap
    1246d86e7bbde nilfs2: fix potential deadlock with newly created symlinks
    1a797936d3468 iio: light: veml6030: fix microlux value calculation
    38d6e8be234d8 iio: gts-helper: Fix memory leaks in iio_gts_build_avail_scale_table()
    62c1189668312 iio: gts-helper: Fix memory leaks for the error path of iio_gts_build_avail_scale_table()
    3dc0eda2cd5c6 iio: adc: ad7124: fix division by zero in ad7124_set_channel_odr()
    adfbc08b94e7d staging: iio: frequency: ad9832: fix division by zero in ad9832_calc_freqreg()
    cedf0f1db8d5f wifi: iwlegacy: Clear stale interrupts before resuming device
    6c44abb2d4c32 wifi: cfg80211: clear wdev->cqm_config pointer on free
    5f5a939759c79 wifi: ath10k: Fix memory leak in management tx
    ee35c423042c9 wifi: mac80211: do not pass a stopped vif to the driver in .get_txpower
    0b9be24679358 Revert "selftests/mm: replace atomic_bool with pthread_barrier_t"
    1fe6799ee9b5f Revert "selftests/mm: fix deadlock for fork after pthread_create on ARM"
    fd28d95894609 Revert "driver core: Fix uevent_show() vs driver detach race"
    a762d0fc17df2 xhci: Use pm_runtime_get to prevent RPM on unsupported systems
    809dd30ee9011 xhci: Fix Link TRB DMA in command ring stopped completion event
    7e8066811a2c4 phy: qcom: qmp-usb-legacy: fix NULL-deref on runtime suspend
    370814e9d512b phy: qcom: qmp-usb: fix NULL-deref on runtime suspend
    e8180a4b1cf93 usb: typec: qcom-pmic-typec: use fwnode_handle_put() to release fwnodes
    558650b18f090 usb: typec: fix unreleased fwnode_handle in typec_port_register_altmodes()
    cd205590599a3 usb: phy: Fix API devm_usb_put_phy() can not release the phy
    53e0684f3093b usbip: tools: Fix detach_port() invalid port error path
    aa03c31a001ac ALSA: usb-audio: Add quirks for Dell WD19 dock
    b3b2431ed27f4 rcu-tasks: Fix access non-existent percpu rtpcp variable in rcu_tasks_need_gpcb()
    7679283e61a8b rcu-tasks: Initialize data to eliminate RCU-tasks/do_exit() deadlocks
    dc5d4d4c12246 rcu-tasks: Add data to eliminate RCU-tasks/do_exit() deadlocks
    01a2b99ffcca8 rcu-tasks: Pull sampling of ->percpu_dequeue_lim out of loop
    7d85884576a3b USB: gadget: dummy-hcd: Fix "task hung" problem
    e028b82aba882 usb: gadget: dummy_hcd: execute hrtimer callback in softirq context
    365a13cf5baa6 usb: gadget: dummy_hcd: Set transfer interval to 1 microframe
    4a4cb56556124 usb: gadget: dummy_hcd: Switch to hrtimer transfer scheduler
    f6568620246d2 misc: sgi-gru: Don't disable preemption in GRU driver
    fe8cb9fac9793 NFS: remove revoked delegation from server's delegation list
    cc0ff7495e41b net: amd: mvme147: Fix probe banner message
    715db716a9f83 thermal: intel: int340x: processor: Add MMIO RAPL PL4 support
    56029f1bc3f1f thermal: intel: int340x: processor: Remove MMIO RAPL CPU hotplug support
    34c0344e7eac5 cifs: Fix creating native symlinks pointing to current or parent directory
    201430d21faab cifs: Improve creating native symlinks pointing to directory
    45eaaa13dd91d scsi: scsi_transport_fc: Allow setting rport state to current state
    550ef40fa6366 fs/ntfs3: Additional check in ntfs_file_release
    68b39c0765de7 fs/ntfs3: Fix general protection fault in run_is_mapped_full
    7a4ace681dbb6 fs/ntfs3: Additional check in ni_clear()
    34e3220efd666 fs/ntfs3: Fix possible deadlock in mi_read
    e91fbb21f248b fs/ntfs3: Add rough attr alloc_size check
    898c8795ec492 fs/ntfs3: Stale inode instead of bad
    84d363dbcfabc fs/ntfs3: Fix warning possible deadlock in ntfs_set_state
    5f21e3e60982c fs/ntfs3: Check if more than chunk-size bytes are written
    22cdf3be7d34f ntfs3: Add bounds checking to mi_enum_attr()
    3c73746c222a7 cxl/events: Fix Trace DRAM Event Record
    7013af5bbd281 smb: client: set correct device number on nfs reparse points
    bbc258dcdbfe5 smb: client: fix parsing of device numbers
    0eb2b767c42fa ACPI: CPPC: Make rmw_lock a raw_spin_lock
    790dc90b96481 afs: Fix missing subdir edit when renamed between parent dirs
    243d2506e7eb0 afs: Automatically generate trace tag enums
    a6fd78620f25a firmware: arm_sdei: Fix the input parameter of cpuhp_remove_state()
    2e4eb1866990e kasan: Fix Software Tag-Based KASAN with GCC
    4c3575787e988 iomap: turn iomap_want_unshare_iter into an inline function
    9bc18bb476e50 fsdax: dax_unshare_iter needs to copy entire blocks
    35adbe088888a fsdax: remove zeroing code from dax_unshare_iter
    451b0a27ca6a7 iomap: share iomap_unshare_iter predicate code with fsdax
    3c06d13ec80be iomap: don't bother unsharing delalloc extents
    61ada9422009e iomap: improve shared block detection in iomap_unshare_iter
    d4d5767c53581 bpf, test_run: Fix LIVE_FRAME frame update after a page has been recycled
    0ab3be58b45b9 netfilter: nft_payload: sanitize offset and length before calling skb_checksum()
    31384aa2ad05c mlxsw: spectrum_ipip: Fix memory leak when changing remote IPv6 address
    598f95742fdc6 mlxsw: spectrum_ptp: Add missing verification before pushing Tx header
    c69bc67c1cb21 net: skip offload for NETIF_F_IPV6_CSUM if ipv6 header contains extension
    1f1764466c33a Bluetooth: hci: fix null-ptr-deref in hci_read_supported_codecs
    fef63832317d9 netfilter: nf_reject_ipv6: fix potential crash in nf_send_reset6()
    6a1f088f9807f netfilter: Fix use-after-free in get_info()
    ac5977001eee7 net: fix crash when config small gso_max_size/gso_ipv4_max_size
    90a6e0e1e151e bpf: Fix out-of-bounds write in trie_get_next_key()
    6a604877160fe netdevsim: Add trailing zero to terminate the string in nsim_nexthop_bucket_activity_write()
    e20459b5f658b bpf: Force checkpoint when jmp history is too long
    bef1f6beae90f selftests/bpf: Add bpf_percpu_obj_{new,drop}() macro in bpf_experimental.h
    597cf9748c347 net/sched: stop qdisc_tree_reduce_backlog on TC_H_ROOT
    42097a9dcaee3 gtp: allow -1 to be specified as file description from userspace
    699b48fc31727 ipv4: ip_tunnel: Fix suspicious RCU usage warning in ip_tunnel_init_flow()
    07c9c26e37542 net: stmmac: TSO: Fix unbalanced DMA map/unmap for non-paged SKB data
    bf6b2cd3c55de net: stmmac: dwmac4: Fix high address display by updating reg_space[] from register values
    9f5ae743dbe9a macsec: Fix use-after-free while sending the offloading packet
    b33b410597ebe ASoC: cs42l51: Fix some error handling paths in cs42l51_probe()
    fa078b39e3f1b wifi: iwlwifi: mvm: don't add default link in fw restart flow
    3eb986c64c6bf wifi: iwlwifi: mvm: Fix response handling in iwl_mvm_send_recovery_cmd()
    3b01b9985a543 wifi: iwlwifi: mvm: disconnect station vifs if recovery failed
    148f6af754781 RDMA/bnxt_re: synchronize the qp-handle table array
    16dbff3e8d195 RDMA/bnxt_re: Fix the usage of control path spin locks
    8636072c21e39 RDMA/mlx5: Round max_rd_atomic/max_dest_rd_atomic up instead of down
    e9c62661a0697 RDMA/cxgb4: Dump vendor specific QP details
    0a59445e2cdf3 wifi: brcm80211: BRCM_TRACING should depend on TRACING
    9b5c89acc8e99 wifi: ath11k: Fix invalid ring usage in full monitor mode
    189f1bfc5c84e wifi: mac80211: skip non-uploaded keys in ieee80211_iter_keys
    021693dad10a2 mac80211: MAC80211_MESSAGE_TRACING should depend on TRACING
    5db6e193c4ca0 wifi: iwlegacy: Fix "field-spanning write" warning in il_enqueue_hcmd()
    9cfab1f3d425c spi: geni-qcom: Fix boot warning related to pm_runtime and devres
    fb384669cb8c2 cgroup: Fix potential overflow issue when checking max_depth
    73ca1c70b8b7f Input: xpad - add support for 8BitDo Ultimate 2C Wireless Controller
    403777d303399 Input: xpad - sort xpad_device by vendor and product ID
    eabe285e1c629 thermal: core: Free tzp copy along with the thermal zone
    3eb073abba327 thermal: core: Rework thermal zone availability check
    a95a9e3089d56 thermal: core: Make thermal_zone_device_unregister() return after freeing the zone
    18abb2787b536 x86/syscall: Mark exit[_group] syscall handlers __noreturn
    2879d995e5697 pnmtologo: sync with 6.6
    43ea1c5e6eb3c lib/build_OID_registry: take -stable reproducibility changes
    35046aea43c85 bpftool: Fix undefined bpf macro for unix socket
    9a558d4b86219 tools/resolve_btfids: Fix comparison of distinct pointer types warning in resolve_btfids
    42b2eec2e5039 bpftool: Query only cgroup-related attach types
    f71bb11887bae cpu/amd: inhibit SMP check for qemux86
    c31365597a17b powerpc/uaccess: Fix build errors seen with GCC 13/14
    64ebf485c56b5 usb: dwc3: core: remove lock of otg mode during gadget suspend/resume to avoid deadlock
    7c76aad68f6d1 kselftest: Add a ksft_perror() helper
    06644f0d7193d drm/tilcdc: Set preferred depth
    ff7ae7b323242 crypto: jitter - add RCT/APT support for different OSRs
    50cd24ddb6f0b arm64: defconfig: remove CONFIG_IPQ_APSS_5018
    58e5c91d6701f x86/alternatives: Disable interrupts and sync when optimizing NOPs in place
    c878fd2d4c793 x86/alternatives: Sync core before enabling interrupts
    c2d64b9f52b6e qemux86: add configuration symbol to select values
    630c33229e6d5 sched/isolation: really align nohz_full with rcu_nocbs
    0e5e0f68e2e6e clear_warn_once: add a clear_warn_once= boot parameter
    46934791b9026 clear_warn_once: bind a timer to written reset value
    cdee9e38ff324 clear_warn_once: expand debugfs to include read support
    82b562b818419 tools: Remove some options from CLANG_CROSS_FLAGS
    36dc380b776b1 libbpf: Fix build warning on ref_ctr_off
    9e3e1fe209827 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    e497a4a5da65b perf: x86-32: explicitly include <errno.h>
    7b57ddd89565b perf: mips64: Convert __u64 to unsigned long long
    1cfc19423dc7f perf: fix bench numa compilation
    98bc2815fade4 perf: add SLANG_INC for slang.h
    17209a70b9b39 perf: add sgidefs.h to for mips builds
    9cd4258d910af perf: change --root to --prefix for python install
    8110a4f266284 perf: add 'libperl not found' warning
    bc89d5e08f773 perf: force include of <stdbool.h>
    4f6c760cc876a fat: Replace prandom_u32() with get_random_u32()
    bc53117b12b21 fat: don't use obsolete random32 call in namei_vfat
    30b2236ab3786 FAT: Added FAT_NO_83NAME
    cef98d22b4edf FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    0bbd7daba9e1b FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    5883fc340084a aufs6: adapt to v6.6 i_op->ctime changes
    c4342d979bf21 aufs6: fix magic.mk include path
    35266bc2dc81a aufs6: adapt to v6.6
    8edede4e98be1 aufs6: core
    712248233ebe1 aufs6: standalone
    3b71a8a848d8b aufs6: mmap
    3e2924871f371 aufs6: base
    7f4907a931016 aufs6: kbuild
    d2f7b03e4aa77 yaffs2: update VFS ctime operations to 6.6+
    bcd6cfcd1aa04 yaffs2: v6.5 fixups
    cc615704b5f54 yaffs2: Fix miscalculation of devname buffer length
    8ef2e22dcf913 yaffs2: convert user_namespace to mnt_idmap
    c9c749f9f7d34 yaffs2: replace bdevname call with sprintf
    395b01cdc39d1 yaffs2: convert read_page -> readfolio
    d98b07e43ba61 yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    613c6d50fdbe8 yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    622c4648936f3 yaffs2: v5.12+ build fixups (not runtime tested)
    7562133d4090b yaffs: include blkdev.h
    dbd44252cd592 yaffs: fix misplaced variable declaration
    c223a10b1ac08 yaffs2: v5.6 build fixups
    90f6007cfbf41 yaffs2: fix memory leak when /proc/yaffs is read
    37ee169c5ea10 yaffs: add strict check when call yaffs_internal_read_super
    b6e007b8abb6e yaffs: repair yaffs_get_mtd_device
    fb98f65a466a7 yaffs: Fix build failure by handling inode i_version with proper atomic API
    51e0aac75ea27 yaffs2: fix memory leak in mount/umount
    2b74a0cae7b0b yaffs: Avoid setting any ACL releated xattr
    ff4130a9c3766 Yaffs:check oob size before auto selecting Yaffs1
    ba95b409c67cd fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    8fa35eba90565 yaffs2: adjust to proper location of MS_RDONLY
    1eb5deaad8c4a yaffs2: import git revision b4ce1bb (jan, 2020)
    4dce67c1e8c8b initramfs: allow an optional wrapper script around initramfs generation
    2f603d83fcc4d pnmtologo: use relocatable file name
    664a6a0a484ba tools: use basename to identify file in gen-mach-types
    9de64bc0c1857 lib/build_OID_registry: fix reproducibility issues
    ae9b80797295a vt/conmakehash: improve reproducibility
    a972323151bdd iwlwifi: select MAC80211_LEDS conditionally
    15d2adcc01984 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    5556a6c04b197 arm64/perf: Fix wrong cast that may cause wrong truncation
    5552dc768ffcd defconfigs: drop obselete options
    00fe4152df313 arm64/perf: fix backtrace for AAPCS with FP enabled
    3888d0652edf1 linux-yocto: Handle /bin/awk issues
    3d55d299f23a7 uvesafb: provide option to specify timeout for task completion
    23c068c080bea uvesafb: print error message when task timeout occurs
    edbfc939266ec compiler.h: Undef before redefining __attribute_const__
    c99ae7e2a19ab vmware: include jiffies.h
    572d84d928c87 Resolve jiffies wrapping about arp
    fdcd47cac8435 nfs: Allow default io size to be configured.
    927d488010984 check console device file on fs when booting
    57cc27f821ddf mount_root: clarify error messages for when no rootfs found
    1b53d82a81528 mconf: fix output of cflags and libraries
    1811da09f42ca menuconfig,mconf-cfg: Allow specification of ncurses location
    83c2e0c6eb1f3 modpost: mask trivial warnings
    6de6730394846 kbuild: exclude meta directory from distclean processing
    6decd32815f53 powerpc: serialize image targets
    f6b683b38318c arm: serialize build targets
    e798b09ebf572 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    dc8a1e5a88f86 x86_64_defconfig: Fix warnings
    68491e5f72b61 powerpc/ptrace: Disable array-bounds warning with gcc8
    d71ebfce30048 powerpc: Disable attribute-alias warnings from gcc8
    62f50884b8b18 powerpc: kexec fix for powerpc64
    da6871c62c371 powerpc: Add unwind information for SPE registers of E500 core
    f161c880c11de mips: make current_cpu_data preempt safe
    5e94a8247ce7f mips: vdso: fix 'jalr $t9' crash in vdso code
    19e36714b1c7f mips: Kconfig: add QEMUMIPS64 option
    e2e537db3cbdc 4kc cache tlb hazard: tlbp cache coherency
    aee9870611e5d malta uhci quirks: make allowance for slow 4k(e)c
    881948cd15176 drm/fb-helper: move zeroing code to drm_fb_helper_fill_var
    98ec1963fcb7a arm64: defconfig: cleanup config options
    f1727c537ba8d vexpress: Pass LOADADDR to Makefile
    4474c32dc24a4 arm: ARM EABI socketcall
    75e31a2b70fd3 ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d8c3c6dab1b4993c7f122dac86ca9c1a5640245e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 4d18fb7b15..68e9011ffa 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "97ad625f80bc466b28144cf04ae1606b755d70ce"
-SRCREV_meta ?= "4e156f65ccbc88f0e7b7017fd641c305872cd681"
+SRCREV_machine ?= "00cd5a2760872bcd59fad7e687b3e7fc01b8eea3"
+SRCREV_meta ?= "0b2608e19938739a210b80898ad59d1dd8914636"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.59"
+LINUX_VERSION ?= "6.6.60"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index a1a12ae1db..0cf105d40b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.59"
+LINUX_VERSION ?= "6.6.60"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "e558aca87ea3665ed1b86bb90974e7b88694ec69"
-SRCREV_meta ?= "4e156f65ccbc88f0e7b7017fd641c305872cd681"
+SRCREV_machine ?= "0748903d61df7571e5e3aa5d7e305e064498094e"
+SRCREV_meta ?= "0b2608e19938739a210b80898ad59d1dd8914636"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index fd8fa1da71..446619c7fc 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "267df33395ed7a86b047a0c7f2f6495985b88c3e"
-SRCREV_machine:qemuarm64 ?= "e558aca87ea3665ed1b86bb90974e7b88694ec69"
-SRCREV_machine:qemuloongarch64 ?= "e558aca87ea3665ed1b86bb90974e7b88694ec69"
-SRCREV_machine:qemumips ?= "7aac15fa06719901f8c9c19d25fcf98284e73e34"
-SRCREV_machine:qemuppc ?= "e558aca87ea3665ed1b86bb90974e7b88694ec69"
-SRCREV_machine:qemuriscv64 ?= "e558aca87ea3665ed1b86bb90974e7b88694ec69"
-SRCREV_machine:qemuriscv32 ?= "e558aca87ea3665ed1b86bb90974e7b88694ec69"
-SRCREV_machine:qemux86 ?= "e558aca87ea3665ed1b86bb90974e7b88694ec69"
-SRCREV_machine:qemux86-64 ?= "e558aca87ea3665ed1b86bb90974e7b88694ec69"
-SRCREV_machine:qemumips64 ?= "8e946d861567941bf31d468ed034cb0a3beadd7d"
-SRCREV_machine ?= "e558aca87ea3665ed1b86bb90974e7b88694ec69"
-SRCREV_meta ?= "4e156f65ccbc88f0e7b7017fd641c305872cd681"
+SRCREV_machine:qemuarm ?= "9d35c8ab017f07efb3e2a571747ef34cc231e83f"
+SRCREV_machine:qemuarm64 ?= "0748903d61df7571e5e3aa5d7e305e064498094e"
+SRCREV_machine:qemuloongarch64 ?= "0748903d61df7571e5e3aa5d7e305e064498094e"
+SRCREV_machine:qemumips ?= "37d619f98381af0e00da822aed6baacc90ede82a"
+SRCREV_machine:qemuppc ?= "0748903d61df7571e5e3aa5d7e305e064498094e"
+SRCREV_machine:qemuriscv64 ?= "0748903d61df7571e5e3aa5d7e305e064498094e"
+SRCREV_machine:qemuriscv32 ?= "0748903d61df7571e5e3aa5d7e305e064498094e"
+SRCREV_machine:qemux86 ?= "0748903d61df7571e5e3aa5d7e305e064498094e"
+SRCREV_machine:qemux86-64 ?= "0748903d61df7571e5e3aa5d7e305e064498094e"
+SRCREV_machine:qemumips64 ?= "bf5c9805a70504d2d4cc6a2bdcede372dd899c6f"
+SRCREV_machine ?= "0748903d61df7571e5e3aa5d7e305e064498094e"
+SRCREV_meta ?= "0b2608e19938739a210b80898ad59d1dd8914636"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "bf3af7e92bda9f48085b7741e657eeb387a61644"
+SRCREV_machine:class-devupstream ?= "9b5aad3a7498c261116a0251fe57f14ba9c4c6cf"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.59"
+LINUX_VERSION ?= "6.6.60"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


