Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD2BFC0372
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:45:43 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.766.1776959134377193694
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 08:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sgI4hFHS;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-506362ac5f7so56186591cf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 08:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776959133; x=1777563933; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bePRjPo8vk9ma45/GGo5MZPB/JPQTQEeOPwKysYp7us=;
        b=sgI4hFHSshNX5O5Xm3hr3bQcMaL3nWsP9IBYrwBudtQZvPSYLy/DQJF/qkSZ1Lky4M
         0KsHhyfAzOjOtKDV4KFQnSDcL5V6ygoh/x0ZPRZzhEK7l9nCyOX4YaK82sCSbcYLWGYW
         ie4glJelkgHu83oKXllZxwnvKPRCd0sRk0tVGMpSHGlo36yVWLBJws7XPN2Zadb7aKTn
         g+ywnwq2d0Mj6LKPp3Sw3pGI2HCVD6Fa69RdICqb09XpSJByAXk/O/7H42CT40zggsTj
         QsSax+jd1+JtwPovKPkRaevz48MzOUlRhjttJ/q+vJwPl0Q6GEvU37pcnC+RP76qNVUO
         K4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776959133; x=1777563933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bePRjPo8vk9ma45/GGo5MZPB/JPQTQEeOPwKysYp7us=;
        b=e3a5lJFpROmHPDXUyQYDUkIsDZLGUxMO/1cHPRnkxTQ9pOdFpt9ZQ6rZC2Aes25p5c
         8kOY9rLBa5Im2NTfAkuQLAPjASluCtnQrBObM0+yjj/ScTwPrksn0QJt2a85t6yDm7O8
         rz4XvrY8xeKTMnsqw24bwdfDkZd6PCWVTmo/T51i40hFWaXd/1FQRTbtzPHYVv50iK6t
         +Qq4KZFFV+JGcHQZVaUYlBq5CKuQGa1QW3LqiKAydDObiiRcOsmfG+4l1CcyMKYdqpl0
         ffAAXBcjQc5ifvw2mKY5XuOyptKA5TUnBO862SSuFIGQENfBYa8aMW2sNYg5IefqNPhk
         zFDg==
X-Gm-Message-State: AOJu0YwUyINsDULehmozwyCiuNL26jYiVdK9wsLa334Uh7UT/izDnA65
	T3rTChsyxm0DiOqFyGJ1hR+5ABJYVubZ1YWgj+YYxbaYCoZK+pspWRih
X-Gm-Gg: AeBDietSt1+uq6XIzAR5r+VyJr8GrokkPue3fd06DrPb/644V5dojSZcSpQzI1tvEc3
	wce0QDjUlanKG1/nFJ3C1n2EW0B9jFaeG4ZVPn0ERL4v/qlrQGnEIvSTsZjatZJG6KYSuauL60g
	qrvGfAUIL1YE7avQos9avGRqBmHG6FRqIIAZg4OAgBgXoRbeIcevIGWHLkWhwZOfenY7qAcCSTA
	lczMMvVSH/bDE0CKleHwrk1aa0wRYvvOx/4z9SFkzvUekbFqsGpnk/IHRcu7EynGshKjfL8v+rP
	rsp81a5Pve/VifUSwn8L3dr1kHIsCsGUHCA40c4zSuTbPEleN42t/Mm7xRiaKwbYeTCjscQiJaT
	4y7Y6eLXLtxw0iuQmwZfdjU16/uKw3OE8ZGClcyyDC3mnmvp6a7hl0YIiKU8Eo8kp9s/PA5cZYX
	KUoHPf00OjQm+2NnezrKNOkVOdhZwU9G+7OVsEk6ykMNjNaasgG3hikUxR22sIK3BK9geR76ZBn
	Dl8kD0nEnvd3viqmNhLsWc1JHILo8m/Kf9TAaQ/KddRJLiedzagJd6fza3FHp+mMYYgPw==
X-Received: by 2002:ac8:5d4b:0:b0:50b:487c:f3d1 with SMTP id d75a77b69052e-50e36b3c940mr396967331cf.3.1776959130942;
        Thu, 23 Apr 2026 08:45:30 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50fb416b3f5sm74400031cf.28.2026.04.23.08.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:45:30 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
Subject: [openembedded-core][whinlatter][PATCH 13/18] linux-yocto/6.12: update to v6.12.80
Date: Thu, 23 Apr 2026 11:45:04 -0400
Message-ID: <20260423154509.1933646-14-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423154509.1933646-1-bruce.ashfield@gmail.com>
References: <20260423154509.1933646-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 15:45:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235813

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    00d7934ffcc35 Linux 6.12.80
    7b8410e13e7d2 idpf: nullify pointers after they are freed
    acf942d0dccd8 net: bcmasp: Fix network filter wake for asp-3.0
    1c0a49ce24c43 net: bcmasp: Restore programming of TX map vector register
    d94f9b0ba28a2 dmaengine: idxd: Fix leaking event log memory
    027145ace09fa futex: Require sys_futex_requeue() to have identical flags
    33dce5758914b xen/privcmd: unregister xenstore notifier on module exit
    d25552196dec0 btrfs: fix lost error when running device stats on multiple devices fs
    1737ddeafbb13 btrfs: fix leak of kobject name for sub-group space_info
    77a119d54c5d6 btrfs: fix super block offset in error message in btrfs_validate_super()
    ea56f1a604941 dmaengine: xilinx_dma: Fix reset related timeout with two-channel AXIDMA
    ba972cf9fe492 dmaengine: xilinx: xilinx_dma: Fix unmasked residue subtraction
    dc2c68f3aa13c dmaengine: xilinx: xilinx_dma: Fix residue calculation for cyclic DMA
    7317ae215d3f1 dmaengine: xilinx: xilinx_dma: Fix dma_device directions
    e21da2ad88445 dmaengine: idxd: fix possible wrong descriptor completion in llist_abort_desc()
    18c2e20b42dd2 netfs: Fix kernel BUG in netfs_limit_iter() for ITER_KVEC iterators
    9787b3d9b9087 dmaengine: xilinx: xdma: Fix regmap init error handling
    97e777f94f9ea dmaengine: dw-edma: Fix multiple times setting of the CYCLE_STATE and CYCLE_BIT bits for HDMA.
    78727334d9c11 phy: ti: j721e-wiz: Fix device node reference leak in wiz_get_lane_phy_types()
    379361cba6e5a dmaengine: idxd: Fix freeing the allocated ida too late
    39c1504e0e76b dmaengine: idxd: Fix memory leak when a wq is reset
    d02c24af126de dmaengine: idxd: Fix not releasing workqueue on .release()
    46dd1b07dcec4 ASoC: ak4458: Convert to RUNTIME_PM_OPS() & co
    a09380354d2f1 idpf: Fix RSS LUT NULL ptr issue after soft reset
    df2790b5228fb idpf: Fix RSS LUT NULL pointer crash on early ethtool operations
    9ad3d0836d8bc idpf: detach and close netdevs while handling a reset
    1ca996324eaca idpf: check error for register_netdev() on init
    ba0c7fff66160 ice: Fix PTP NULL pointer dereference during VSI rebuild
    363377af2c9e8 ice: fix using untrusted value of pkt_len in ice_vc_fdir_parse_raw()
    426d5b681b2f3 landlock: Fix handling of disconnected directories
    17e8b80f199e2 landlock: Optimize file path walks and prepare for audit support
    dcefd3f0b9ed8 net: add proper RCU protection to /proc/net/ptype
    a079a62883e33 virt: tdx-guest: Fix handling of host controlled 'quote' buffer length
    c4d603e8e58a3 xfs: avoid dereferencing log items after push callbacks
    6c0cfbe020c0f ovl: make fsync after metadata copy-up opt-in mount option
    67f35bd8653cc ovl: Use str_on_off() helper in ovl_show_options()
    4fcfeecef69b2 rust: pin-init: internal: init: document load-bearing fact of field accessors
    acc105db08267 rust: pin-init: add references to previously initialized fields
    1e8da79267248 mm/damon/sysfs: check contexts->nr before accessing contexts_arr[0]
    a2008925ed736 media: nxp: imx8-isi: Fix streaming cleanup on release
    84e926c1c272a spi: tegra210-quad: Protect curr_xfer check in IRQ handler
    de4c7c5c131c8 LoongArch: vDSO: Emit GNU_EH_FRAME correctly
    ccd41f110c608 drm/xe: always keep track of remap prev/next
    03474a01c199d tracing: Fix potential deadlock in cpu hotplug with osnoise
    43e5f6deb8bf7 tracing: Switch trace_osnoise.c code over to use guard() and __free()
    7de55bba69cbf ksmbd: fix use-after-free and NULL deref in smb_grant_oplock()
    ff255e69911fe powerpc64/bpf: do not increment tailcall count when prog is NULL
    95a16dcb49227 arm64: dts: imx8mn-tqma8mqnl: fix LDO5 power off
    9b4d9dda6a71a ext4: always drain queued discard work in ext4_mb_release()
    19782b4c793b4 ext4: fix iloc.bh leak in ext4_fc_replay_inode() error paths
    4bec4a498ce86 ext4: handle wraparound when searching for blocks for indirect mapped blocks
    de009e11f31a8 ext4: fix the might_sleep() warnings in kvfree()
    034053378dd81 ext4: fix use-after-free in update_super_work when racing with umount
    d787d3ae96648 ext4: reject mount if bigalloc with s_first_data_block != 0
    9370207b36d26 ext4: avoid allocate block from corrupted group in ext4_mb_find_by_goal()
    3a7667595bcad ext4: avoid infinite loops caused by residual data
    407c944f217c1 ext4: validate p_idx bounds in ext4_ext_correct_indexes
    d4b3f370c3d8f ext4: replace BUG_ON with proper error handling in ext4_read_inline_folio
    30c6e26562ec9 ext4: make recently_deleted() properly work with lazy itable initialization
    f8f7f9ed88462 ext4: fix fsync(2) for nojournal mode
    a29ceb262e957 ext4: fix stale xarray tags after writeback
    7920dcc571cef ext4: convert inline data to extents when truncate exceeds inline size
    ff01e2f410f18 ext4: fix journal credit check when setting fscrypt context
    d5c3ed01f297b xfs: remove file_path tracepoint data
    b5c5a50c2f513 xfs: don't irele after failing to iget in xfs_attri_recover_work
    23e45598f1a83 xfs: fix ri_total validation in xlog_recover_attri_commit_pass2
    e822f535273af xfs: scrub: unlock dquot before early return in quota scrub
    d8fc60bbaf5ae xfs: save ailp before dropping the AIL lock in push callbacks
    a89434a6188d8 xfs: stop reclaim before pushing AIL during unmount
    596c3f8069c47 LoongArch: KVM: Make kvm_get_vcpu_by_cpuid() more robust
    151ba1721ac50 LoongArch: Workaround LS2K/LS7A GPU DMA hang bug
    5e7fde2c551f8 LoongArch: Fix missing NULL checks for kstrdup()
    9a6cbb4a5c168 drm/i915/dp_tunnel: Fix error handling when clearing stream BW in atomic state
    c0b3882836de8 drm/amdgpu: prevent immediate PASID reuse case
    22d997add640f dmaengine: sh: rz-dmac: Move CHCTRL updates under spinlock
    d91c84906e4c1 dmaengine: sh: rz-dmac: Protect the driver specific lists
    abc1f0dabe505 dmaengine: fsl-edma: fix channel parameter config for fixed channel requests
    7475dfad10a05 futex: Clear stale exiting pointer in futex_lock_pi() retry path
    7b61e89c43cc5 irqchip/qcom-mpm: Add missing mailbox TX done acknowledgment
    be9237be3f120 jbd2: gracefully abort on checkpointing state corruptions
    459158151a158 KVM: x86/mmu: Drop/zap existing present SPTE even when creating an MMIO SPTE
    984350b37372f net: macb: Use dev_consume_skb_any() to free TX SKBs
    ff10e3682da0d net: macb: Protect access to net_device::ip_ptr with RCU lock
    17970e0f6b62a net: macb: Move devm_{free,request}_irq() out of spin lock area
    c52df6a33345e scsi: ses: Handle positive SCSI error from ses_recv_diag()
    d1466bf991b23 scsi: ibmvfc: Fix OOB access in ibmvfc_discover_targets_done()
    3699caf7d6601 ovl: fix wrong detection of 32bit inode numbers
    a9f911b6607b1 phy: qcom: qmp-ufs: Fix SM8650 PCS table for Gear 4
    d7853d9fe94ab x86/cpu: Remove X86_CR4_FRED from the CR4 pinned bits mask
    756e19fe86542 x86/cpu: Enable FSGSBASE early in cpu_init_exception_handling()
    6d37ec779d563 alarmtimer: Fix argument order in alarm_timer_forward()
    378949f46e897 erofs: add GFP_NOIO in the bio completion if needed
    f04733c4dc40c virtio_net: Fix UAF on dst_ops when IFF_XMIT_DST_RELEASE is cleared and napi_tx is false
    d8549a453d5bd media: mc, v4l2: serialize REINIT and REQBUFS with req_queue_mutex
    922a500e94767 hwmon: (peci/cputemp) Fix off-by-one in cputemp_is_visible()
    8149678ff2684 hwmon: (peci/cputemp) Fix crit_hyst returning delta instead of absolute temperature
    3510b90b7dcd3 hwmon: (pmbus/isl68137) Add mutex protection for AVS enable sysfs attributes
    68e5da7c5326b KVM: arm64: Discard PC update state on vcpu reset
    9808571b27969 platform/x86: ISST: Correct locked bit width
    72d35b92d329a cpufreq: conservative: Reset requested_freq on limits change
    9649d051e5441 can: isotp: fix tx.buf use-after-free in isotp_sendmsg()
    c4e8eaa75fa0b can: gw: fix OOB heap access in cgw_csum_crc8_rel()
    d131feed8d3ce ASoC: SOF: ipc4-topology: Allow bytes controls without initial payload
    8771d7152f8d3 ALSA: firewire-lib: fix uninitialized local variable
    1d1888b4a7aec ksmbd: do not expire session on binding failure
    91aeaa7256006 ksmbd: fix memory leaks and NULL deref in smb2_lock()
    7aec5a769d235 ksmbd: fix potencial OOB in get_file_all_info() for compound requests
    6aef1765d6807 ksmbd: replace hardcoded hdr2_len with offsetof() in smb2_calc_max_out_buf_len()
    95c899cd79180 s390/entry: Scrub r12 register on kernel entry
    54571224d8988 s390/barrier: Make array_index_mask_nospec() __always_inline
    f8c444b918d63 s390/syscalls: Add spectre boundary for syscall dispatch table
    d5d01f24bc6fb spi: spi-fsl-lpspi: fix teardown order issue (UAF)
    432fa716e96ef ASoC: adau1372: Fix clock leak on PLL lock failure
    2c678860898a2 ASoC: adau1372: Fix unchecked clk_prepare_enable() return value
    82f8dc236dc55 sysctl: fix uninitialized variable in proc_do_large_bitmap
    129d89223c43b hwmon: (pmbus) Introduce the concept of "write-only" attributes
    9f7304720fb87 hwmon: (pmbus) Mark lowest/average/highest/rated attributes as read-only
    881b8d5bbc12d hwmon: (pmbus/core) Fix various coding style issues
    60a1b27313cee hwmon: (adm1177) fix sysfs ABI violation and current unit conversion
    138e42be35ff2 drm/amdgpu: Fix fence put before wait in amdgpu_amdkfd_submit_ib
    808c0f156f48d ACPI: EC: clean up handlers on probe failure in acpi_ec_setup()
    eedf220442d13 spi: use generic driver_override infrastructure
    5cd46bebc4e0c spi: Group CS related fields in struct spi_device
    10862e344b4d6 drm/amd/display: Do not skip unrelated mode changes in DSC validation
    40ad0334c17b2 spi: meson-spicc: Fix double-put in remove path
    8367b909e015a ASoC: Intel: catpt: Fix the device initialization
    6eba074a8a05f spi: sn-f-ospi: Fix resource leak in f_ospi_probe()
    f14c9acb1a773 PM: hibernate: Drain trailing zero pages on userspace restore
    6453341a0c734 drm/i915/gmbus: fix spurious timeout on 512-byte burst reads
    a246bcb5f7ca1 x86/efi: efi_unmap_boot_services: fix calculation of ranges_to_free size
    a5162ebfe0458 scsi: scsi_transport_sas: Fix the maximum channel scanning issue
    6b4d3a91259a1 RDMA/irdma: Return EINVAL for invalid arp index error
    a8a1c7621127a RDMA/irdma: Fix deadlock during netdev reset with active connections
    bb22bf9bf054f RDMA/irdma: Remove reset check from irdma_modify_qp_to_err()
    bc20987765932 RDMA/irdma: Clean up unnecessary dereference of event->cm_node
    0d845d7d834fa RDMA/irdma: Remove a NOP wait_event() in irdma_modify_qp_roce()
    6d1a63d4f2f12 RDMA/irdma: Update ibqp state to error if QP is already in error state
    cd1534c8f4984 RDMA/irdma: Initialize free_qp completion before using it
    49bbcb76c4c8a RDMA/rw: Fall back to direct SGE on MR pool exhaustion
    08cd190baec5a ALSA: hda/realtek: Sequence GPIO2 on Star Labs StarFighter
    9fea479f155d6 regmap: Synchronize cache for the page selector
    9d74d10e4e266 net: macb: use the current queue number for stats
    675c913b94048 netfilter: ctnetlink: use netlink policy range checks
    7edca70751b9b netfilter: nf_conntrack_sip: fix use of uninitialized rtp_addr in process_sdp
    dcfcd95b3ae76 netfilter: nf_conntrack_expect: skip expectations in other netns via proc
    ded71f5684df1 netfilter: ip6t_rt: reject oversized addrnr in rt_mt6_check()
    a2f6ff3444b66 netfilter: nfnetlink_log: fix uninitialized padding leak in NFULA_PAYLOAD
    6dc11e0bd0a54 tls: Purge async_hold in tls_decrypt_async_wait()
    834cf890d2c3d Bluetooth: btusb: clamp SCO altsetting table indices
    9a21a631ee034 Bluetooth: L2CAP: Fix ERTM re-init and zero pdu_len infinite loop
    e10a4cb724686 Bluetooth: btintel: serialize btintel_hw_error() with hci_req_sync_lock
    d2d4f0f15d531 Bluetooth: L2CAP: Fix send LE flow credits in ACL link
    b07431f47fe22 dma-mapping: add missing `inline` for `dma_free_attrs`
    c0e696a74b19e net: lan743x: fix duplex configuration in mac_link_up
    6d3161fa3eee6 team: fix header_ops type confusion with non-Ethernet ports
    a0d9efb1e8f3f net: enetc: fix the output issue of 'ethtool --show-ring'
    f1bed05a832ae udp: Fix wildcard bind conflict check when using hash2
    afb7c7f20f2e0 tcp: optimize inet_use_bhash2_on_bind()
    75fe6db23705a net: fix fanout UAF in packet_release() via NETDEV_UP race
    c58c705939c75 ipv6: Don't remove permanent routes with exceptions from tb6_gc_hlist.
    d9b859a7bf1fe ipv6: Remove permanent routes from tb6_gc_hlist when all exceptions expire.
    1f931dee5b726 iavf: fix out-of-bounds writes in iavf_get_ethtool_stats()
    1beb6a1711502 ice: use ice_update_eth_stats() for representor stats
    7829daee9ba5d ice: fix inverted ready check for VF representors
    42830f80495bb platform/x86: intel-hid: disable wakeup_mode during hibernation
    392b2369fb215 platform/olpc: olpc-xo175-ec: Fix overflow error message to print inlen
    8244cc1ce64bc net: bcmasp: fix double disable of clk
    db060603452b2 net: bcmasp: Add support for asp-v3.0
    121a6ad9cd42b net: bcmasp: fix double free of WoL irq
    6c0a48684e380 net: bcmasp: streamline early exit in probe
    88fff072ba83f net: bcmasp: Remove support for asp-v2.0
    2463b69ccb617 net: bcm: asp2: convert to phylib managed EEE
    5b9555915ab80 net: bcm: asp2: remove tx_lpi_enabled
    ef6469df19f49 net: bcm: asp2: fix LPI timer handling
    bd2e6b6367a29 rtnetlink: count IFLA_INFO_SLAVE_KIND in if_nlmsg_size
    7bcb974c771c8 net/smc: fix double-free of smc_spd_priv when tee() duplicates splice pipe buffer
    98de18d327ef8 openvswitch: validate MPLS set/set_masked payload length
    bbe7bd722bfae openvswitch: defer tunnel netdev_put to RCU release
    43579baa17270 net: openvswitch: Avoid releasing netdev before teardown completes
    1edc12d2bbcb7 nfc: nci: fix circular locking dependency in nci_close_device
    e324506b98bf6 ionic: fix persistent MAC address override on PF
    3334494e69f39 pinctrl: mediatek: common: Fix probe failure for devices without EINT
    0780f93338529 Bluetooth: L2CAP: Fix null-ptr-deref on l2cap_sock_ready_cb
    5213ef54528dd Bluetooth: hci_ll: Fix firmware leak on error path
    340666172cf74 Bluetooth: MGMT: Fix dangling pointer on mgmt_add_adv_patterns_monitor_complete
    108b81514d8f2 Bluetooth: SCO: Fix use-after-free in sco_recv_frame() due to missing sock_hold
    40c7f7eea2f4d Bluetooth: L2CAP: Validate PDU length before reading SDU length in l2cap_ecred_data_rcv()
    c8e1a27edb8b4 Bluetooth: L2CAP: Fix stack-out-of-bounds read in l2cap_ecred_conn_req
    76d115b228e4d can: statistics: add missing atomic access in hot path
    d1ba7d6b3cd17 erofs: set fileio bio failed in short read case
    1cf9fc3b190b3 dma: swiotlb: add KMSAN annotations to swiotlb_bounce()
    7b18692c59afb af_key: validate families in pfkey_send_migrate()
    56ea2257b83ee xfrm: prevent policy_hthresh.work from racing with netns teardown
    32d0f44c2f14d xfrm: Fix work re-schedule after cancel in xfrm_nat_keepalive_net_fini()
    df6f995358dc1 esp: fix skb leak with espintcp and async crypto
    ddd2d7f20ab1c xfrm: Fix the usage of skb->sk
    4092242a7347d xfrm: call xdo_dev_state_delete during state update
    02c30fb68bed9 xfrm: fix the condition on x->pcpu_num in xfrm_sa_len
    934e87be76f3b xfrm: add missing extack for XFRMA_SA_PCPU in add_acquire and allocspi
    bd635bcd0a517 i3c: master: dw-i3c: Fix missing of_node for virtual I2C adapter
    63a5bca438cfb ALSA: hda/realtek: add quirk for ASUS UM6702RC
    3a800ad9382ad spi: intel-pci: Add support for Nova Lake mobile SPI flash
    601e6ff6e5133 usb: core: new quirk to handle devices with zero configurations
    7a27049b5bc27 drm/amdgpu: fix gpu idle power consumption issue for gfx v12
    49c7c50ee6325 nvmet: move async event work off nvmet-wq
    fee55fffbfcd9 objtool: Handle Clang RSP musical chairs
    437b469c801b4 ALSA: hda/realtek: Add headset jack quirk for Thinkpad X390
    b685eba97a5ae ALSA: hda/realtek: add HP Laptop 14s-dr5xxx mute LED quirk
    a41a9b8d19a98 btrfs: set BTRFS_ROOT_ORPHAN_CLEANUP during subvol create
    d81d519f1236d sched_ext: Use WRITE_ONCE() for the write side of dsq->seq update
    31860c3f7ac66 HID: apple: avoid memory leak in apple_report_fixup()
    9535c3eda0949 drm/ttm/tests: Fix build failure on PREEMPT_RT
    c8324d387c794 ALSA: hda/senary: Ensure EAPD is enabled during init
    5858510917896 dma-buf: Include ioctl.h in UAPI header
    c4a5601fe0866 ASoC: fsl_easrc: Fix event generation in fsl_easrc_iec958_put_bits()
    6a029865ef062 scsi: devinfo: Add BLIST_SKIP_IO_HINTS for Iomega ZIP
    1d90b17aea622 scsi: mpi3mr: Clear reset history on ready and recheck state after timeout
    fddbd2fe91cd7 ASoC: fsl_easrc: Fix event generation in fsl_easrc_iec958_set_reg()
    ec2b22a58073f module: Fix kernel panic when a symbol st_shndx is out of bounds
    4abc2186ed5b6 HID: asus: add xg mobile 2023 external hardware support
    6bafb2e9b5b4e HID: mcp2221: cancel last I2C command on read error
    da89e7137b9db kbuild: install-extmod-build: Package resolve_btfids if necessary
    efe3f0d9bc252 net: usb: r8152: add TRENDnet TUC-ET2G
    34221ae510833 HID: apple: Add EPOMAKER TH87 to the non-apple keyboards list
    79e5dcc95d9ab HID: magicmouse: avoid memory leak in magicmouse_report_fixup()
    1ba445e496b5f HID: magicmouse: fix battery reporting for Apple Magic Trackpad 2
    acbc72dd1a09d nvme-pci: ensure we're polling a polled queue
    e3baa5a402237 platform/x86: touchscreen_dmi: Add quirk for y-inverted Goodix touchscreen on SUPI S10
    e34c5f314fa60 platform/x86: intel-hid: Enable 5-button array on ThinkPad X1 Fold 16 Gen 1
    c5a280ff4f745 nvme-fabrics: use kfree_sensitive() for DHCHAP secrets
    242934c6ddfb4 nvme-pci: cap queue creation to used queues
    5e9788df789ce platform/x86: intel-hid: Add Dell 14 Plus 2-in-1 to dmi_vgbs_allow_list
    7a6d6e4d8af04 HID: asus: avoid memory leak in asus_report_fixup()
    342aa1ee995ef bpf: Fix unsound scalar forking in maybe_fork_scalars() for BPF_OR
    9ab1227765c44 bpf: Fix undefined behavior in interpreter sdiv/smod for INT_MIN
    b1f3c2ba6512e bpf: Release module BTF IDR before module unload
    9a6086d2a828d driver core: platform: use generic driver_override infrastructure
    78aba57ca3de5 driver core: generalize driver_override in struct device
    8e655e0effd71 sh: platform_early: remove pdev->driver_override check
    0064ad7695412 hwmon: axi-fan: don't use driver_override as IRQ name
    92c47342c66d4 cxl/hdm: Avoid incorrect DVSEC fallback when HDM decoders are enabled
    3a696e84a8b1f perf: Make sure to use pmu_ctx->pmu for groups
    56af722756ed8 bpf: Fix constant blinding for PROBE_MEM32 stores
    d216a4bd138eb cxl/port: Fix use after free of parent_port in cxl_detach_ep()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 609f2eaefb..4c754bcd21 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -15,13 +15,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7e842d87b9b4b32c87ffa1eff0923050b2fb4579"
-SRCREV_meta ?= "50fc2fcce39b1abff6f5438f410b2ef015e10479"
+SRCREV_machine ?= "682f6c2088ea37c1dcc324905956034eda630d52"
+SRCREV_meta ?= "8bb0dbe2b50860402b07a506a5aa3a4ef7aba0a7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.79"
+LINUX_VERSION ?= "6.12.80"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 2cd5b510d9..d760030c21 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.79"
+LINUX_VERSION ?= "6.12.80"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "3bc3831f2b2a1caa0d0a0556019a2c7ff05fc81a"
-SRCREV_meta ?= "50fc2fcce39b1abff6f5438f410b2ef015e10479"
+SRCREV_machine ?= "18e0f76d6fff9522f4df78a484d68e814999b29a"
+SRCREV_meta ?= "8bb0dbe2b50860402b07a506a5aa3a4ef7aba0a7"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 7b34f33272..c50dc6dfac 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "bdecc68b604a59ee8f0bde1b96240d48938009c2"
-SRCREV_machine:qemuarm64 ?= "3bc3831f2b2a1caa0d0a0556019a2c7ff05fc81a"
-SRCREV_machine:qemuloongarch64 ?= "3bc3831f2b2a1caa0d0a0556019a2c7ff05fc81a"
-SRCREV_machine:qemumips ?= "0f5e1025c5fe2f07e5e64dca977e10f4d42389db"
-SRCREV_machine:qemuppc ?= "3bc3831f2b2a1caa0d0a0556019a2c7ff05fc81a"
-SRCREV_machine:qemuriscv64 ?= "3bc3831f2b2a1caa0d0a0556019a2c7ff05fc81a"
-SRCREV_machine:qemuriscv32 ?= "3bc3831f2b2a1caa0d0a0556019a2c7ff05fc81a"
-SRCREV_machine:qemux86 ?= "3bc3831f2b2a1caa0d0a0556019a2c7ff05fc81a"
-SRCREV_machine:qemux86-64 ?= "3bc3831f2b2a1caa0d0a0556019a2c7ff05fc81a"
-SRCREV_machine:qemumips64 ?= "b1f97d0b31600bbbf29d4b9e519bca2a7104a2b4"
-SRCREV_machine ?= "3bc3831f2b2a1caa0d0a0556019a2c7ff05fc81a"
-SRCREV_meta ?= "50fc2fcce39b1abff6f5438f410b2ef015e10479"
+SRCREV_machine:qemuarm ?= "dd1da548895086a19df2c3fc9586999789081636"
+SRCREV_machine:qemuarm64 ?= "18e0f76d6fff9522f4df78a484d68e814999b29a"
+SRCREV_machine:qemuloongarch64 ?= "18e0f76d6fff9522f4df78a484d68e814999b29a"
+SRCREV_machine:qemumips ?= "14123935e5dd112c3a4daa4c5a756b82298ecf4d"
+SRCREV_machine:qemuppc ?= "18e0f76d6fff9522f4df78a484d68e814999b29a"
+SRCREV_machine:qemuriscv64 ?= "18e0f76d6fff9522f4df78a484d68e814999b29a"
+SRCREV_machine:qemuriscv32 ?= "18e0f76d6fff9522f4df78a484d68e814999b29a"
+SRCREV_machine:qemux86 ?= "18e0f76d6fff9522f4df78a484d68e814999b29a"
+SRCREV_machine:qemux86-64 ?= "18e0f76d6fff9522f4df78a484d68e814999b29a"
+SRCREV_machine:qemumips64 ?= "d6af6b480ab453a08f04ce80ab25a131f54f8e34"
+SRCREV_machine ?= "18e0f76d6fff9522f4df78a484d68e814999b29a"
+SRCREV_meta ?= "8bb0dbe2b50860402b07a506a5aa3a4ef7aba0a7"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "c2d104a355013a14bcd73e31fb2c4bc21922115a"
+SRCREV_machine:class-devupstream ?= "00d7934ffcc35e65b113ba4991c8a3338bd85fc1"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.79"
+LINUX_VERSION ?= "6.12.80"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


