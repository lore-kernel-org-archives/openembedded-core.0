Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87117E77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 18:15:11 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.26409.1736532905159651232
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jan 2025 10:15:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WvFWqpSL;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-467a1d43821so27674551cf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 10:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736532904; x=1737137704; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7C1YiVtttQe8/et74szeUMM+NMaAVINY3eLt/MNfg8=;
        b=WvFWqpSLCdqTJ7qXE+LbQug3kTTlyToKQ7sDfOBg2LSf1IG6PMn22IqU0MlBDGYn3O
         wSZLq9yUWf8Pr4tpRR9+lb9vCnPha1zhXuI3PpIMDvOgI305639I94wrUHKB6x5VSFU0
         39akGXxI/1ScLtE7qtIUVc3dkKW+7rIcT4gyyhI9Vd7aBSziJsq57NI2xtgl7gA0sd8P
         X4vbsj0/ywxveyNpOJH9XZXEiktK4xIaW0rwzeVsfRDgNNtxSpeKSCX3wPXZX/mmAFPa
         QshyKW+zjfy0iku6gXWZOaLxfqaWu1IQSmoQ2AbFL1D+Gek7s3GOEeA8qTqigsDd7ZXH
         XNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736532904; x=1737137704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q7C1YiVtttQe8/et74szeUMM+NMaAVINY3eLt/MNfg8=;
        b=pth7657bzdfyuV88VzcfX5/G8SPQeMrzD1QfumybDPaKqPmJcQyKKqeDRAG23PD8f7
         3Vj/7DcT5QE8r7k0SxHnBBWgG5QjpTA+s5ZlkB0ndR4Nhsl6wiAm/GZ1ATr0KzKvn7rq
         3CQWWig/BaHMdwK16CXAvL3xqW5L1vLUb6C4jj2YL/5QImm5O0YYwL3toIgnenOSmlTp
         A3gud67K/m/JDx3Gly5N30iGn3/s7x1Si7SKgoW8osVkhKrcc9LDx7ARIMr01T44My0Q
         amE4gbC9+EQwpb9CXIo+HVN1huwIQTh5VhxWpiWexkN9lSBW9GltdFSuMToipbOCsJdD
         GlJg==
X-Gm-Message-State: AOJu0YzwVL10WIoYA3xX4LoJ7nqVdK8NidmMs+3ZfFQVnTtg3euZnsPt
	nDV+6sk/zD4+X3NcMeUsHHN5nvC/pHPq6A8JMe53S5a8YI5y4GMTFsgIvtk/ZTQQAA==
X-Gm-Gg: ASbGncsyuGSSZ6C3vRsdBIu+XUYvithspCQsMB7kQFwhEgThPyDj6pf8iCoLehQeq5Y
	v6gcpbpwg8E/VClMTNDIAegfk8b2Cj6JGwRUUURiyI6bJK/DN971UA75XPUDRbO/C+ShYBhPw72
	xieO8pWSVRC5ZJzpArpb6vQpWTFDTQYGi+HB8Sfpc+rzzPAGiVNrzR0g7hoEidJMMX5IoFXmSyd
	K7MgVG0kDwyHT/NVpXKLWl3d4vmLgpboirgf03ioxVaPupWuSAyGpSjxSMRSge3I5BUlnC+VZX+
	5kGw44o/Cq4EZDrm+JWyBZrHpTucOPPjBF8Z2kte7HA84RxyJXbMbEuWsg==
X-Google-Smtp-Source: AGHT+IHFCh/qwcA3HZNFYoQSh7iBMPdYnNGADQkSKlxFCgdVbuoRHxUynCi3jM7sNkDcyt0nHw1oBQ==
X-Received: by 2002:ac8:46c4:0:b0:46c:82dd:9a64 with SMTP id d75a77b69052e-46c82dd9ce6mr86683481cf.22.1736532903702;
        Fri, 10 Jan 2025 10:15:03 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46c873dc8a8sm11656251cf.65.2025.01.10.10.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 10:15:03 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-yocto/6.12: update to v6.12.9
Date: Fri, 10 Jan 2025 13:15:02 -0500
Message-Id: <20250110181502.313926-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 18:15:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209665

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    5996393469d9 Linux 6.12.9
    10a641cad465 mptcp: don't always assume copied data in mptcp_cleanup_rbuf()
    8353226fe3ca mptcp: fix recvbuffer adjust on sleeping rcvmsg
    fb08e6b0ba28 mptcp: fix TCP options overflow.
    2e31443a0d18 mm: hugetlb: independent PMD page table shared count
    464770df4609 mm: reinstate ability to map write-sealed memfd mappings read-only
    58d0d02dbc67 mm: vmscan: account for free pages to prevent infinite Loop in throttle_direct_reclaim()
    64b2d32f2259 mm/kmemleak: fix sleeping function called from invalid context at print message
    5802fe9cfc05 mm/readahead: fix large folio support in async readahead
    86c9fd14aa7f gve: trigger RX NAPI instead of TX NAPI in gve_xsk_wakeup
    35f44eed5828 gve: guard XDP xmit NDO on existence of xdp queues
    e2ff6dd63159 gve: fix XDP allocation path in edge cases
    8e8d7037c894 gve: guard XSK operations on the existence of queues
    c8a8334fbedb gve: clean XDP queues in gve_tx_stop_ring_gqi
    077ef69099f4 gve: process XSK TX descriptors as part of RX NAPI
    d066ab595cdf fs/proc/task_mmu: fix pagemap flags with PMD THP entries on 32bit
    9e4c11d4cc05 mm: shmem: fix incorrect index alignment for within_size policy
    cabacb18a42d mm: shmem: fix the update of 'shmem_falloc->nr_unswapped'
    3647932d0b3e mm/damon/core: fix new damon_target objects leaks on damon_commit_targets()
    69bbaa0fdddc mm/damon/core: fix ignored quota goals and filters of newly committed schemes
    e55273aa2a55 net: ethernet: ti: am65-cpsw: default to round-robin for host port receive
    b68b2a3fbacc fgraph: Add READ_ONCE() when accessing fgraph_array[]
    19d8a4424168 wifi: iwlwifi: mvm: Fix __counted_by usage in cfg80211_wowlan_nd_*
    ca9d077350fa drm: adv7511: Fix use-after-free in adv7533_attach_dsi()
    9f12616222ce dt-bindings: display: adi,adv7533: Drop single lane support
    6c87986664ab drm: adv7511: Drop dsi single lane support
    41ce61328e0f io_uring/rw: fix downgraded mshot read
    2297890b778b net/sctp: Prevent autoclose integer overflow in sctp_association_init()
    41db022612b6 sched_ext: initialize kit->cursor.flags
    a921eb655809 sky2: Add device ID 11ab:4373 for Marvell 88E8075
    ffb231471a40 workqueue: Do not warn when cancelling WQ_MEM_RECLAIM work from !WQ_MEM_RECLAIM worker
    830f83858952 pinctrl: mcp23s08: Fix sleeping in atomic context due to regmap locking
    b3ef4ae71336 RDMA/uverbs: Prevent integer overflow issue
    786362ce60d7 sched_ext: Fix invalid irq restore in scx_ops_bypass()
    65802da747ac scripts/sorttable: fix orc_sort_cmp() to maintain symmetry and transitivity
    dc05ee603128 clk: clk-imx8mp-audiomix: fix function signature
    90daa2f83585 maple_tree: reload mas before the second call for mas_empty_area
    0e1779478f0c kcov: mark in_softirq_really() as __always_inline
    ba950a02d8d2 ocfs2: fix slab-use-after-free due to dangling pointer dqi_priv
    9d382112b363 ALSA: seq: oss: Fix races at processing SysEx messages
    a369c9b4ad5a ALSA hda/realtek: Add quirk for Framework F111:000C
    c8f05dc8a9ce drm/xe: Wait for migration job before unmapping pages
    7f13d8273e8c drm/xe: Use non-interruptible wait when moving BO to system
    5a45b3497280 ftrace: Fix function profiler's filtering functionality
    ac3ee577c347 ALSA: seq: Check UMP support for midi_version change
    c7e9cb3db798 io_uring/kbuf: use pre-committed buffer address for non-pollable file
    abf81fd09b62 RDMA/mlx5: Enable multiplane mode only when it is supported
    56432f684513 Revert "ALSA: ump: Don't enumeration invalid groups for legacy rawmidi"
    a93c6cf0868f kbuild: pacman-pkg: provide versioned linux-api-headers package
    2a44d48d323a modpost: fix the missed iteration for the max bit in do_input()
    f133ad12fe86 scripts/mksysmap: Fix escape chars '$'
    5ce6fb470eb1 clk: thead: Fix TH1520 emmc and shdci clock rate
    1c2244437f9a bpf: consider that tail calls invalidate packet pointers
    28bcc8024033 bpf: refactor bpf_helper_changes_pkt_data to use helper number
    07bb0775bacc ARC: build: Try to guess GCC variant of cross compiler
    c88e3ecb9468 irqchip/gic: Correct declaration of *percpu_base pointer in union gic_base
    4a31c018bfe4 Bluetooth: hci_core: Fix sleeping function called from invalid context
    87e93faa370d net: usb: qmi_wwan: add Telit FE910C04 compositions
    1d23d5537103 smb: client: destroy cfid_put_wq on module exit
    52cefcff6a4a ksmbd: set ATTR_CTIME flags when setting mtime
    7023866f161b ksmbd: retry iterate_dir in smb2_query_dir
    1da4ebd8691b bpf: fix potential error return
    83d32ae6895a ARC: bpf: Correct conditional check in 'check_jmp_32'
    4be7ad1f9cc2 ARC: build: Use __force to suppress per-CPU cmpxchg warnings
    600340ed717c ARC: build: disallow invalid PAE40 + 4K page config
    5fae14431614 ASoC: audio-graph-card: Call of_node_put() on correct node
    4b1ccdfe589e spi: spi-cadence-qspi: Disable STIG mode for Altera SoCFPGA.
    d49362b059f2 sound: usb: format: don't warn that raw DSD is unsupported
    03c446634f3f sound: usb: enable DSD output for ddHiFi TC44C
    1c643c600407 ALSA: hda/realtek: Add new alc2xx-fixup-headset-mic model
    45f502192bfc ALSA: hda/ca0132: Use standard HD-audio quirk matching helpers
    d77a3a99b53d btrfs: flush delalloc workers queue before stopping cleaner kthread during unmount
    bd51e0d7a255 btrfs: handle bio_split() errors
    d867cee0f30a ALSA: hda/realtek - Add support for ASUS Zen AIO 27 Z272SD_A272SD audio
    5b67d909ac5e ALSA: hda: cs35l56: Remove calls to cs35l56_force_sync_asp1_registers_from_cache()
    de39f7295395 drm/amdkfd: Correct the migration DMA map direction
    4e9ad557e52d drm/amdgpu: use sjt mec fw on gfx943 for sriov
    6ec6025cc666 wifi: mac80211: wake the queues in case of failure in resume
    ae07daf440d3 wifi: cfg80211: clear link ID from bitmap during link delete after clean up
    36b739637d70 wifi: mac80211: fix mbss changed flags corruption on 32 bit systems
    65e282457704 perf/x86/intel: Add Arrow Lake U support
    93d7d212c6ea btrfs: allow swap activation to be interruptible
    4ac8e8bf70b4 net: ti: icssg-prueth: Fix clearing of IEP_CMP_CFG registers during iep_init
    771ab379e87d net: ti: icssg-prueth: Fix firmware load sequence.
    3d1b63cf468e ila: serialize calls to nf_register_net_hooks()
    cd8488fdc711 af_packet: fix vlan_get_protocol_dgram() vs MSG_PEEK
    b65292a548d8 af_packet: fix vlan_get_tci() vs MSG_PEEK
    a0c12973edf7 net: wwan: iosm: Properly check for valid exec stage in ipc_mmio_init()
    3257813a3ae7 net: restrict SO_REUSEPORT to inet sockets
    d3b7a9c7597b net: reenable NETIF_F_IPV6_CSUM offload for BIG TCP packets
    05670a893565 net: sfc: Correct key_len for efx_tc_ct_zone_ht_params
    127c28006716 io_uring/net: always initialize kmsg->msg.msg_inq upfront
    64798d02430b RDMA/bnxt_re: Fix error recovery sequence
    6ffb5c188519 RDMA/rtrs: Ensure 'ib_sge list' is accessible
    e6e6882a1590 net: wwan: t7xx: Fix FSM command timeout issue
    6dfa451b5302 net: mv643xx_eth: fix an OF node reference leak
    5abb84101c0e eth: bcmsysport: fix call balance of priv->clk handling routines
    b48a058db398 ALSA: usb-audio: US16x08: Initialize array before use
    86645d8d062a nvmet: Don't overflow subsysnqn
    1ee54d58d58b net: llc: reset skb->transport_header
    d24cbc43cc7b netfilter: nft_set_hash: unaligned atomic read on struct nft_set_ext
    0e394dd11e95 workqueue: add printf attribute to __alloc_workqueue()
    a0360b9b5f32 drm/i915/dg1: Fix power gate sequence.
    6bf65f39701e drm/i915/cx0_phy: Fix C10 pll programming sequence
    9f6f54e6a686 RDMA/rxe: Remove the direct link to net_device
    de85624c623d net/mlx5e: Keep netdev when leave switchdev for devlink set legacy only
    47c78d3fc26e net/mlx5e: Skip restore TC rules for vport rep without loaded flag
    fa9d8c2e77c4 net/mlx5e: macsec: Maintain TX SA from encoding_sa
    dc59321c0b38 net/mlx5: DR, select MSIX vector 0 for completion queue creation
    b710f18252ef net: pse-pd: tps23881: Fix power on/off issue
    3ba7f80d98d4 netrom: check buffer length before accessing it
    965a34d93b0b net: Fix netns for ip_tunnel_init_flow()
    b0b190218c78 net: fix memory leak in tcp_conn_request()
    b8a888f236ec net: stmmac: restructure the error path of stmmac_probe_config_dt()
    924d43bd10a1 drm/xe: Fix fault on fd close after unbind
    fb1543f3ba43 drm/xe/pf: Use correct function to check LMEM provisioning
    3ff51effd1cc drm/xe: Revert some changes that break a mesa debug tool
    77a807ae2ba5 RDMA/hns: Fix missing flush CQE for DWQE
    ed9466d707fa RDMA/hns: Fix warning storm caused by invalid input in IO path
    a448c775f0ae RDMA/hns: Fix accessing invalid dip_ctx during destroying QP
    c1bc7a427e7c RDMA/hns: Fix mapping error of zero-hop WQE buffer
    b983a01f58fb netdev-genl: avoid empty messages in napi get
    74f9e8f2e831 selftests: net: local_termination: require mausezahn
    e5e2ba1b575a net: dsa: microchip: Fix LAN937X set_ageing_time function
    b3989de20041 net: dsa: microchip: Fix KSZ9477 set_ageing_time function
    929e70e8dbee drm/bridge: adv7511_audio: Update Audio InfoFrame properly
    45ece2a4e3f2 net: phy: micrel: Dynamically control external clock of KSZ PHY
    39480e1271da RDMA/bnxt_re: Fix the locking while accessing the QP table
    003e82749a24 RDMA/bnxt_re: Fix MSN table size for variable wqe mode
    2c73cd31f917 RDMA/bnxt_re: Add send queue size check for variable wqe
    50a85b3bd28d RDMA/bnxt_re: Disable use of reserved wqes
    9b3b83d2f7f4 RDMA/bnxt_re: Fix max_qp_wrs reported
    4eafeb4f021c RDMA/siw: Remove direct link to net_device
    a36820c88865 RDMA/nldev: Set error code in rdma_nl_notify_event
    e61d2495f781 RDMA/bnxt_re: Fix reporting hw_ver in query_device
    75c5dba99e20 RDMA/bnxt_re: Add check for path mtu in modify_qp
    4f6fd7f2dfef RDMA/bnxt_re: Fix the check for 9060 condition
    a337f7b6b2eb wifi: iwlwifi: fix CRF name for Bz
    bfe52e8019ef nvme-pci: 512 byte aligned dma pool segment quirk
    48bd8e9d78c5 RDMA/core: Fix ENODEV error for iWARP test over vlan
    1051250e51cc RDMA/bnxt_re: Avoid sending the modify QP workaround for latest adapters
    a3e0709d462e RDMA/bnxt_re: Avoid initializing the software queue for user queues
    9a479088e0c8 RDMA/bnxt_re: Fix max SGEs for the Work Request
    c1e855a9b95d RDMA/mlx5: Enforce same type port association for multiport RoCE
    00aca33249f7 sched_ext: fix application of sizeof to pointer
    cbe385d9ae48 RDMA/bnxt_re: Remove always true dattr validity check
    b4b77d9b5b0d btrfs: use bio_is_zone_append() in the completion handler
    2cf5d691f849 block: lift bio_is_zone_append to bio.h
    92bd18c74624 tracing: Have process_string() also allow arrays
    cba9d51794ec pmdomain: core: add dummy release function to genpd device
    a45ae8932789 pmdomain: imx: gpcv2: fix an OF node reference leak in imx_gpcv2_probe()
    1595afae01fa mmc: sdhci-msm: fix crypto key eviction
    efefe36c03a7 selinux: ignore unknown extended permissions
    9476e599b445 platform/x86: hp-wmi: mark 8A15 board for timed OMEN thermal profile
    7d43ab99ac60 platform/x86: thinkpad-acpi: Add support for hotkey 0x1401
    063d380ca28e drm/amdgpu: fix backport of commit 73dae652dcac
    2da437336625 platform/x86: mlx-platform: call pci_dev_put() to balance the refcount
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

This also picks up the graphics fix for the beaglebone reference
platform.

Bruce

 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 20c2ad44e8..044c956b4a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8476be0f3e04eb74fd1991813cafa2f11a8c2f3b"
-SRCREV_meta ?= "1204392cf280ffdab50fdf4c91ae3a4be8dd25f2"
+SRCREV_machine ?= "259cb3adc1a277c386c512449cad948e0f5420f0"
+SRCREV_meta ?= "8acbf9e961463a60949e0ead93260daa6b3361c6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.8"
+LINUX_VERSION ?= "6.12.9"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 0e3d09c3a0..b930f92863 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.8"
+LINUX_VERSION ?= "6.12.9"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "0bd79f208ea519c88a63f3cf283d2239f246ce3f"
-SRCREV_meta ?= "1204392cf280ffdab50fdf4c91ae3a4be8dd25f2"
+SRCREV_machine ?= "4878dc2a6770f4ee8d47051e44dd43102e98a0ff"
+SRCREV_meta ?= "8acbf9e961463a60949e0ead93260daa6b3361c6"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 7c255e9d90..7d5a7afbf4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "6a55012c9ce32a43e766d5cb9d5681095a646cbe"
-SRCREV_machine:qemuarm64 ?= "0bd79f208ea519c88a63f3cf283d2239f246ce3f"
-SRCREV_machine:qemuloongarch64 ?= "0bd79f208ea519c88a63f3cf283d2239f246ce3f"
-SRCREV_machine:qemumips ?= "54a83ae06c1ce7fa15b016ae8d3e3d4de989ba64"
-SRCREV_machine:qemuppc ?= "0bd79f208ea519c88a63f3cf283d2239f246ce3f"
-SRCREV_machine:qemuriscv64 ?= "0bd79f208ea519c88a63f3cf283d2239f246ce3f"
-SRCREV_machine:qemuriscv32 ?= "0bd79f208ea519c88a63f3cf283d2239f246ce3f"
-SRCREV_machine:qemux86 ?= "0bd79f208ea519c88a63f3cf283d2239f246ce3f"
-SRCREV_machine:qemux86-64 ?= "0bd79f208ea519c88a63f3cf283d2239f246ce3f"
-SRCREV_machine:qemumips64 ?= "7cae438d051e6ddd0f99d2ecad1dc81d4c3a8727"
-SRCREV_machine ?= "0bd79f208ea519c88a63f3cf283d2239f246ce3f"
-SRCREV_meta ?= "1204392cf280ffdab50fdf4c91ae3a4be8dd25f2"
+SRCREV_machine:qemuarm ?= "518414bf1eda983dad94cfba3a205321e6f2b206"
+SRCREV_machine:qemuarm64 ?= "4878dc2a6770f4ee8d47051e44dd43102e98a0ff"
+SRCREV_machine:qemuloongarch64 ?= "4878dc2a6770f4ee8d47051e44dd43102e98a0ff"
+SRCREV_machine:qemumips ?= "c34fc7bf2a211653a87617851ef69c13b8cc7316"
+SRCREV_machine:qemuppc ?= "4878dc2a6770f4ee8d47051e44dd43102e98a0ff"
+SRCREV_machine:qemuriscv64 ?= "4878dc2a6770f4ee8d47051e44dd43102e98a0ff"
+SRCREV_machine:qemuriscv32 ?= "4878dc2a6770f4ee8d47051e44dd43102e98a0ff"
+SRCREV_machine:qemux86 ?= "4878dc2a6770f4ee8d47051e44dd43102e98a0ff"
+SRCREV_machine:qemux86-64 ?= "4878dc2a6770f4ee8d47051e44dd43102e98a0ff"
+SRCREV_machine:qemumips64 ?= "ef7cfae37a97b3c61f9127abcfe1307fdd56ec50"
+SRCREV_machine ?= "4878dc2a6770f4ee8d47051e44dd43102e98a0ff"
+SRCREV_meta ?= "8acbf9e961463a60949e0ead93260daa6b3361c6"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "77f85ccd3618f324d221f0faaed6d9cdc118c74a"
+SRCREV_machine:class-devupstream ?= "5996393469d99560b7845d22c9eff00661de0724"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.8"
+LINUX_VERSION ?= "6.12.9"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


