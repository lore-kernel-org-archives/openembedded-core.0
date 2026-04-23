Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E5DFC034D
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:32:31 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.413.1776958349322164922
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 08:32:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XV9RbdJI;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8aca4e14411so82145886d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 08:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776958348; x=1777563148; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e18TMxqrE9J4/iD7zp8ZIIKHfnjT8sQa3zPHcMn5uuw=;
        b=XV9RbdJI6NewjjHzJkZ0fonTBE0+gvPcx7/yZ3+aXwLw1jO9PTqELaQ4QgqYhgKvGa
         mYsTWUyCeafXNj0HprbfBU4B/A4B7Acy1Cys3W7YsHhAr5gNrl0WgzXOtMcJ7/prAEO5
         1+J9tdj9uD1DhfucqvkWy2VK+yyIiDyGKMzY1rW3wdlbBKUi02L0iqpVHp3v/qhiQJBZ
         fpTh8SUwhUmOMHIdBp8vYO6qJqzyiv1I2zCCy7MQjLXJVycvCLZbrvl3hPEJ8AcHG9T4
         dTNBh6tUCy3fFB76d85hCUhlFaIx2f+FZ5W9muweGmK4qpX3+TsXlzloz1IJ6xkrT118
         CJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776958348; x=1777563148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e18TMxqrE9J4/iD7zp8ZIIKHfnjT8sQa3zPHcMn5uuw=;
        b=WvXexciAJo/gfoi207iGByrfuUcbox3rqWD9WZMTPj6nG8W9K1+USzpOARx4j4RDO9
         ikkfFinrnAQTOKu+wudbpzeHg20UN8x1DuIQkbsi9F1mE2k1MthsTmxbRCn+ownPBOBu
         08hdlLC09XeQ442D1BzUUKZ6AOvRLtpfc5d+K31Pa4yEOyV+qOHEu0jO7xjfWVkI4Mq8
         jb3b4xkLxXOZhxQiO6fFIK3uVlXoQDpJrs4kwWy9CQYGqRDnZRdeDG0rgdDBzuZjMetu
         0zO6gQTECUfQGGVuajV4768Yf7xSNwkhIQYMYa7x9bev76WrBOg4zyDu3rNZNf5XIGfJ
         5YBg==
X-Gm-Message-State: AOJu0Yw0yfTUGCNlGVH+n5AEPVhW3e5niQq0x2QegCng4ef1+HWXf/ej
	SycAJMiUkF6U9k9Uvwob9kuxuXAv04NkhghsKQYHVs/qqFBVZVwPcvKJgVeX2Vvt
X-Gm-Gg: AeBDiesox11Oi1X+k3iYLdu9QXOvomPl+rJNvzRkOA17WTyGi8uHxswxjhHKGRArtC1
	7jRIpBruknHErMqCRHlE2M7H9kW2hGL3xXRbnAS31nh3XnfkFJFONKYRFinT+9q4uhMsSTRkE4z
	IQs9BOqG+zUt9xCgcgtb3BJPI+G+D+0Pq5cYLx+07Prl+4lPDGn72Kp9Lzap/l67hmIhh2PB/ea
	V9BKgx0/p8xfaJ5R82yVjfypCn17lWBeKCGswe/IW/CGVIpw1oJ3eosYOJlc+3HoaJNuozpc+jo
	3kN1rUjfrp3iGClvcCVpsf9MM9xKyuWMEL7DhmMOkSOTcaSz6WiG4BADIKGMLsxtVzfNGQlc90A
	38Eg82CG9KD4r9iO7L0ToDPwk+obTqZFRE6XdbRNqET5HGPTgBx7ue7KCOsCPn5byso4b0rJ7nK
	bpabeZO6wFDq5xSjGSe4cpw8Aj0ReCsOSDeLJ/pu3ng1LabBxFlix3PmHo5Odhb6uNNGclrKTD8
	9RbRuOI8qKx3DYKQVAKCuZUVmUSRPifLdOdgrnzARj6LR1wN4sZx8HB6RxVUqrTNUlFdA==
X-Received: by 2002:a05:6214:451a:b0:8aa:a025:78e3 with SMTP id 6a1803df08f44-8b027fd1cc8mr474134256d6.6.1776958347812;
        Thu, 23 Apr 2026 08:32:27 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac429ffsm160765996d6.2.2026.04.23.08.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:32:27 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 03/15] linux-yocto/6.18: update to v6.18.21
Date: Thu, 23 Apr 2026 11:32:10 -0400
Message-ID: <20260423153222.1932256-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423153222.1932256-1-bruce.ashfield@gmail.com>
References: <20260423153222.1932256-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 15:32:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235778

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.18 to the latest korg -stable release that comprises
the following commits:

    44c944a67997 Linux 6.18.21
    e75a5c054d49 Bluetooth: L2CAP: Fix regressions caused by reusing ident
    853f70c67d1b futex: Fix UaF between futex_key_to_node_opt() and vma_replace_policy()
    18b7d09c2b79 futex: Require sys_futex_requeue() to have identical flags
    a7df91375471 irqchip/renesas-rzv2h: Fix error path in rzv2h_icu_probe_common()
    f0035858dfb2 netfs: Fix the handling of stream->front by removing it
    e7ba52b38766 xen/privcmd: unregister xenstore notifier on module exit
    806d40421a59 btrfs: fix lost error when running device stats on multiple devices fs
    3c844d01f987 btrfs: fix leak of kobject name for sub-group space_info
    c1677817b906 btrfs: fix super block offset in error message in btrfs_validate_super()
    3e5fd8f53b57 netfs: Fix read abandonment during retry
    0c9256f31003 selftests/mount_setattr: increase tmpfs size for idmapped mount tests
    285a2602bf37 dmaengine: xilinx_dma: Fix reset related timeout with two-channel AXIDMA
    ec48fb2f5936 dmaengine: xilinx: xilinx_dma: Fix unmasked residue subtraction
    e75f5f76be90 dmaengine: xilinx: xilinx_dma: Fix residue calculation for cyclic DMA
    e9a6eba5f0c0 dmaengine: xilinx: xilinx_dma: Fix dma_device directions
    82656e8daf8d dmaengine: idxd: fix possible wrong descriptor completion in llist_abort_desc()
    a4d1b4ba9754 netfs: Fix NULL pointer dereference in netfs_unbuffered_write() on retry
    4bc2d72c7695 netfs: Fix kernel BUG in netfs_limit_iter() for ITER_KVEC iterators
    f27197ccfd2e dmaengine: xilinx: xdma: Fix regmap init error handling
    e1d0d0080bab dmaengine: dw-edma: Fix multiple times setting of the CYCLE_STATE and CYCLE_BIT bits for HDMA.
    eb048d11fa2a phy: ti: j721e-wiz: Fix device node reference leak in wiz_get_lane_phy_types()
    facd0012708e dmaengine: idxd: Fix leaking event log memory
    a18e809e22d3 dmaengine: idxd: Fix freeing the allocated ida too late
    a9e7815d3862 dmaengine: idxd: Fix memory leak when a wq is reset
    958e96533ddb dmaengine: idxd: Fix not releasing workqueue on .release()
    504c0e675100 dmaengine: idxd: Fix possible invalid memory access after FLR
    aa0ffc6d3990 dmaengine: idxd: Fix crash when the event log is disabled
    40b3f4700e55 mm/mseal: update VMA end correctly on merge
    a5c6f6d6ceef ksmbd: fix use-after-free and NULL deref in smb_grant_oplock()
    7ad1997b9bc8 mm/huge_memory: fix folio isn't locked in softleaf_to_folio()
    e9de9f3ce06b mm/damon/sysfs: fix param_ctx leak on damon_sysfs_new_test_ctx() failure
    9c495f9d3781 mm/damon/core: avoid use of half-online-committed context
    9cf7588aa578 mm/damon/stat: monitor all System RAM resources
    5eeba3a7bf49 drm/amd/pm: fix amdgpu_irq enabled counter unbalanced on smu v11.0
    e1cd6e0251ef rust: pin-init: internal: init: document load-bearing fact of field accessors
    6b60e35a7fdb unwind_user/x86: Fix arch=um build
    41fc9825ac25 powerpc64/bpf: do not increment tailcall count when prog is NULL
    b159111cdd8a arm64: dts: imx8mn-tqma8mqnl: fix LDO5 power off
    812b6a7cd3e7 ext4: always drain queued discard work in ext4_mb_release()
    f7817ad399d6 ext4: fix iloc.bh leak in ext4_fc_replay_inode() error paths
    12624c5b724a ext4: handle wraparound when searching for blocks for indirect mapped blocks
    0652ab1bd814 ext4: fix the might_sleep() warnings in kvfree()
    c97e282f7bfd ext4: fix use-after-free in update_super_work when racing with umount
    ad1f6d608f33 ext4: reject mount if bigalloc with s_first_data_block != 0
    1895f7904be7 ext4: avoid allocate block from corrupted group in ext4_mb_find_by_goal()
    416c86f30f91 ext4: avoid infinite loops caused by residual data
    93f2e975ed65 ext4: validate p_idx bounds in ext4_ext_correct_indexes
    b44fc445b3b7 ext4: test if inode's all dirty pages are submitted to disk
    4855a59e2178 ext4: publish jinode after initialization
    823849a26af0 ext4: replace BUG_ON with proper error handling in ext4_read_inline_folio
    f49a14810dfe ext4: make recently_deleted() properly work with lazy itable initialization
    1d4460f33ce8 ext4: fix fsync(2) for nojournal mode
    16041a808b50 ext4: do not check fast symlink during orphan recovery
    95de75794cd9 ext4: fix stale xarray tags after writeback
    93cb2d103e5c ext4: convert inline data to extents when truncate exceeds inline size
    69835472c726 ext4: fix journal credit check when setting fscrypt context
    2c2db09b9043 xfs: remove file_path tracepoint data
    a1a5df1038f0 xfs: don't irele after failing to iget in xfs_attri_recover_work
    68d80f35ea62 xfs: fix ri_total validation in xlog_recover_attri_commit_pass2
    3b0c3414b308 xfs: scrub: unlock dquot before early return in quota scrub
    95fb5d643cc7 xfs: avoid dereferencing log items after push callbacks
    50f5f056807b xfs: save ailp before dropping the AIL lock in push callbacks
    8147e304d7d3 xfs: stop reclaim before pushing AIL during unmount
    38ec58670a0c mm/pagewalk: fix race between concurrent split and refault
    3527e9fdc385 mm/damon/sysfs: check contexts->nr in repeat_call_fn
    708033c231bd mm/damon/sysfs: check contexts->nr before accessing contexts_arr[0]
    54c143028eb4 drm/amd/pm: Return -EOPNOTSUPP for unsupported OD_MCLK on smu_v13_0_6
    126053d0a685 LoongArch: KVM: Handle the case that EIOINTC's coremap is empty
    878cf6acb4fd LoongArch: KVM: Make kvm_get_vcpu_by_cpuid() more robust
    70fb63c5d36c LoongArch: Workaround LS2K/LS7A GPU DMA hang bug
    53a27c09850b LoongArch: vDSO: Emit GNU_EH_FRAME correctly
    a1da957c25cf LoongArch: Fix missing NULL checks for kstrdup()
    70e2eb91cb63 drm/i915: Unlink NV12 planes earlier
    859b14e0be9e drm/i915: Order OP vs. timeout correctly in __wait_for()
    8581466b827f drm/i915/dp_tunnel: Fix error handling when clearing stream BW in atomic state
    eb95595194e4 drm/amd/display: Fix drm_edid leak in amdgpu_dm
    51ccaf0e30c3 drm/amdgpu: prevent immediate PASID reuse case
    b6a468966347 dmaengine: sh: rz-dmac: Move CHCTRL updates under spinlock
    2b2518b1abb3 dmaengine: sh: rz-dmac: Protect the driver specific lists
    79d2151a7c30 dmaengine: fsl-edma: fix channel parameter config for fixed channel requests
    20768be1734c i2c: imx: ensure no clock is generated after last read
    dca0e38ecfd0 i2c: imx: fix i2c issue when reading multiple messages
    92e47ad03e03 futex: Clear stale exiting pointer in futex_lock_pi() retry path
    83bcea9da919 i2c: designware: amdisp: Fix resume-probe race condition issue
    7319d57db908 irqchip/qcom-mpm: Add missing mailbox TX done acknowledgment
    1d896b408646 jbd2: gracefully abort on checkpointing state corruptions
    bab090e8fd56 KVM: x86/mmu: Only WARN in direct MMUs when overwriting shadow-present SPTE
    695320de6ead KVM: x86/mmu: Drop/zap existing present SPTE even when creating an MMIO SPTE
    f4bc91398b57 net: macb: Use dev_consume_skb_any() to free TX SKBs
    33eeb5471a8b net: macb: Protect access to net_device::ip_ptr with RCU lock
    99405131d6ed net: macb: Move devm_{free,request}_irq() out of spin lock area
    4771b85954be scsi: ses: Handle positive SCSI error from ses_recv_diag()
    786f10b1966e scsi: ibmvfc: Fix OOB access in ibmvfc_discover_targets_done()
    e02685511282 ovl: fix wrong detection of 32bit inode numbers
    ebbac99bb666 ovl: make fsync after metadata copy-up opt-in mount option
    db08e8c32090 phy: qcom: qmp-ufs: Fix SM8650 PCS table for Gear 4
    4cce3cd5ed79 x86/fred: Fix early boot failures on SEV-ES/SNP guests
    a6e14114684d x86/cpu: Remove X86_CR4_FRED from the CR4 pinned bits mask
    5433c7ac4bc8 x86/cpu: Enable FSGSBASE early in cpu_init_exception_handling()
    83800f8ef358 writeback: don't block sync for filesystems with no data integrity guarantees
    e54c8863ba33 alarmtimer: Fix argument order in alarm_timer_forward()
    da4046406459 erofs: add GFP_NOIO in the bio completion if needed
    9a18629f2525 virtio_net: Fix UAF on dst_ops when IFF_XMIT_DST_RELEASE is cleared and napi_tx is false
    6f3c8795ae9b virt: tdx-guest: Fix handling of host controlled 'quote' buffer length
    371a43c4ac70 xfrm: iptfs: only publish mode_data after clone setup
    de6d8e8ce518 xfrm: iptfs: validate inner IPv4 header length in IPTFS payload
    72b9e81e0203 media: mc, v4l2: serialize REINIT and REQBUFS with req_queue_mutex
    529a3f3c49d3 hwmon: (peci/cputemp) Fix off-by-one in cputemp_is_visible()
    d640ef7117a1 hwmon: (peci/cputemp) Fix crit_hyst returning delta instead of absolute temperature
    67fd1e71f768 hwmon: (pmbus/isl68137) Add mutex protection for AVS enable sysfs attributes
    bf28ab8bed18 hwmon: (pmbus/ina233) Fix error handling and sign extension in shunt voltage read
    8e209d882b67 KVM: arm64: Discard PC update state on vcpu reset
    4cf2cc6bc1cd platform/x86: ISST: Correct locked bit width
    fdaf61f2831a RDMA/ionic: Preserve and set Ethernet source MAC after ib_ud_header_init()
    ab839325a41c thermal: intel: int340x: soc_slider: Set offset only for balanced mode
    8def1e51df14 kbuild: Delete .builtin-dtbs.S when running make clean
    e2f7e4d83ab8 cpufreq: conservative: Reset requested_freq on limits change
    f162aa749a40 can: netlink: can_changelink(): add missing error handling to call can_ctrlmode_changelink()
    eec8a1b18a79 can: isotp: fix tx.buf use-after-free in isotp_sendmsg()
    84f8b76d2427 can: gw: fix OOB heap access in cgw_csum_crc8_rel()
    cab361aa6404 ASoC: SOF: ipc4-topology: Allow bytes controls without initial payload
    d472d1a52985 ASoC: sma1307: fix double free of devm_kzalloc() memory
    6ab27f2dc76d ASoC: codecs: wcd934x: fix typo in dt parsing
    c215d25cf050 ALSA: firewire-lib: fix uninitialized local variable
    61aff3c1edc3 ALSA: hda/realtek: add quirk for ASUS Strix G16 G615JMR
    47c459a6c9b6 Revert "ALSA: hda/intel: Add MSI X870E Tomahawk to denylist"
    a897064a4570 ksmbd: do not expire session on binding failure
    3cdacd11b415 ksmbd: fix memory leaks and NULL deref in smb2_lock()
    b0cd9725fe2b ksmbd: fix potencial OOB in get_file_all_info() for compound requests
    80824c7e527b ksmbd: replace hardcoded hdr2_len with offsetof() in smb2_calc_max_out_buf_len()
    5eda8001ebb5 drm/xe: always keep track of remap prev/next
    f278b8ebf7eb tracing: Fix potential deadlock in cpu hotplug with osnoise
    7f4e3233faa8 s390/entry: Scrub r12 register on kernel entry
    3d39a4ec6380 s390/barrier: Make array_index_mask_nospec() __always_inline
    87776f02449e s390/syscalls: Add spectre boundary for syscall dispatch table
    449005087718 ALSA: usb-audio: Exclude Scarlett 2i4 1st Gen from SKIP_IFACE_SETUP
    e89e2b97253c spi: spi-fsl-lpspi: fix teardown order issue (UAF)
    efb07062d95c ASoC: adau1372: Fix clock leak on PLL lock failure
    02709ae51f93 ASoC: adau1372: Fix unchecked clk_prepare_enable() return value
    01d5711be772 sysctl: fix uninitialized variable in proc_do_large_bitmap
    4e9d723d9f19 hwmon: (pmbus/core) Protect regulator operations with mutex
    cdf31cf5ca4a hwmon: (pmbus) Introduce the concept of "write-only" attributes
    34479e52f1e9 hwmon: (pmbus) Mark lowest/average/highest/rated attributes as read-only
    8b476d95e98b hwmon: (adm1177) fix sysfs ABI violation and current unit conversion
    39820864eacd drm/amdgpu: Fix fence put before wait in amdgpu_amdkfd_submit_ib
    d04c007047c8 ACPI: EC: clean up handlers on probe failure in acpi_ec_setup()
    c73a58661a76 spi: use generic driver_override infrastructure
    15da4f5e1001 drm/xe: Implement recent spec updates to Wa_16025250150
    4e96a8440e74 rust: regulator: do not assume that regulator_get() returns non-null
    8f3226f00cb1 ASoC: dt-bindings: stm32: Fix incorrect compatible string in stm32h7-sai match
    8a5edc97fd9c drm/amd/display: Do not skip unrelated mode changes in DSC validation
    da06a104f048 spi: meson-spicc: Fix double-put in remove path
    7af2d06ec25b ASoC: Intel: catpt: Fix the device initialization
    234a82a13886 spi: sn-f-ospi: Fix resource leak in f_ospi_probe()
    3025ca5daa9d PM: sleep: Drop spurious WARN_ON() from pm_restore_gfp_mask()
    13a6af01c1e3 PM: hibernate: Drain trailing zero pages on userspace restore
    842aa6103b6f drm/i915/gmbus: fix spurious timeout on 512-byte burst reads
    9a709b7e3632 drm/mediatek: dsi: Store driver data before invoking mipi_dsi_host_register
    f8afc292d4bc x86/efi: efi_unmap_boot_services: fix calculation of ranges_to_free size
    a8b66cf9ba3c scsi: scsi_transport_sas: Fix the maximum channel scanning issue
    6140239d4518 ASoC: fsl: imx-card: initialize playback_only and capture_only
    3f08351de5ca RDMA/irdma: Harden depth calculation functions
    0e04f3f2dca4 RDMA/irdma: Return EINVAL for invalid arp index error
    cd8bcec2de5e RDMA/irdma: Fix deadlock during netdev reset with active connections
    8203f295b4bc RDMA/irdma: Remove reset check from irdma_modify_qp_to_err()
    30d9491bbb69 RDMA/irdma: Clean up unnecessary dereference of event->cm_node
    4c2b2ea802bc RDMA/irdma: Remove a NOP wait_event() in irdma_modify_qp_roce()
    feeabfc936d7 RDMA/irdma: Update ibqp state to error if QP is already in error state
    3cb88c12461b RDMA/irdma: Initialize free_qp completion before using it
    9d4fe0d7586e ALSA: usb-audio: Exclude Scarlett 2i2 1st Gen from SKIP_IFACE_SETUP
    f9433abfcf83 RDMA/efa: Fix possible deadlock
    21ae8790e5a8 RDMA/rw: Fall back to direct SGE on MR pool exhaustion
    a1dc886137ab ALSA: hda/realtek: Sequence GPIO2 on Star Labs StarFighter
    f710129df9fc regmap: Synchronize cache for the page selector
    0dd98aea1c0c RDMA/efa: Fix use of completion ctx after free
    97da0d993d7c RDMA/efa: Improve admin completion context state machine
    26bd3a77c5ff RDMA/efa: Check stored completion CTX command ID with received one
    7ff87da09921 net: macb: use the current queue number for stats
    c6cb41eaae87 netfilter: ctnetlink: use netlink policy range checks
    01f34a80ac23 netfilter: nf_conntrack_sip: fix use of uninitialized rtp_addr in process_sdp
    9ca8c7452493 netfilter: nf_conntrack_expect: skip expectations in other netns via proc
    53d8899452d9 netfilter: nft_set_rbtree: revisit array resize logic
    d8795fde1f78 netfilter: ip6t_rt: reject oversized addrnr in rt_mt6_check()
    c9f6c51d3648 netfilter: nfnetlink_log: fix uninitialized padding leak in NFULA_PAYLOAD
    9f557c7eae12 tls: Purge async_hold in tls_decrypt_async_wait()
    1019028eb124 Bluetooth: btusb: clamp SCO altsetting table indices
    900e4db5385e Bluetooth: L2CAP: Fix ERTM re-init and zero pdu_len infinite loop
    3f26ecbd9cde Bluetooth: L2CAP: Fix deadlock in l2cap_conn_del()
    ea6cf86167b3 Bluetooth: L2CAP: Fix not tracking outstanding TX ident
    66696648af47 Bluetooth: btintel: serialize btintel_hw_error() with hci_req_sync_lock
    5c7cd74673bc Bluetooth: L2CAP: Fix send LE flow credits in ACL link
    4f23cceb3500 dma-mapping: add missing `inline` for `dma_free_attrs`
    064fede3ae78 rtnetlink: fix leak of SRCU struct in rtnl_link_register
    4e27807943b1 net: lan743x: fix duplex configuration in mac_link_up
    0a7468ed49a6 team: fix header_ops type confusion with non-Ethernet ports
    a72891444623 virtio-net: correct hdr_len handling for tunnel gso
    5f217e718236 virtio-net: correct hdr_len handling for VIRTIO_NET_F_GUEST_HDRLEN
    2fefa595d484 net: enetc: fix the output issue of 'ethtool --show-ring'
    18d84c45def3 udp: Fix wildcard bind conflict check when using hash2
    966937039e07 net: airoha: add RCU lock around dev_fill_forward_path
    d0c7cdc15fdf net: fix fanout UAF in packet_release() via NETDEV_UP race
    103931f6fdbb ipv6: Don't remove permanent routes with exceptions from tb6_gc_hlist.
    edf57ce04bc1 ipv6: Remove permanent routes from tb6_gc_hlist when all exceptions expire.
    bb85741d2dc2 iavf: fix out-of-bounds writes in iavf_get_ethtool_stats()
    22c117745495 ice: use ice_update_eth_stats() for representor stats
    218609e1e466 ice: fix inverted ready check for VF representors
    fe1ed519210a platform/x86: intel-hid: disable wakeup_mode during hibernation
    a825ab202533 platform/olpc: olpc-xo175-ec: Fix overflow error message to print inlen
    eaa3dae239f2 platform/x86: lenovo: wmi-gamezone: Drop gz_chain_head
    e29850b0faa8 platform/x86: ISST: Check HWP support before MSR access
    d57cf5c770c0 net: bcmasp: fix double disable of clk
    9e5f5c07cc7d net: bcmasp: fix double free of WoL irq
    aba90ae2379f net: bcmasp: streamline early exit in probe
    60ed7fa717b1 rtnetlink: count IFLA_INFO_SLAVE_KIND in if_nlmsg_size
    6fa3f2764f49 rtnetlink: count IFLA_PARENT_DEV_{NAME,BUS_NAME} in if_nlmsg_size
    54c87a730157 net/smc: fix double-free of smc_spd_priv when tee() duplicates splice pipe buffer
    bd50c7484c3b openvswitch: validate MPLS set/set_masked payload length
    98b726ab5e2a openvswitch: defer tunnel netdev_put to RCU release
    95265232b497 net: openvswitch: Avoid releasing netdev before teardown completes
    d89b74bf08f0 nfc: nci: fix circular locking dependency in nci_close_device
    097b16ffa61e ionic: fix persistent MAC address override on PF
    936a3c0c10e2 pinctrl: mediatek: common: Fix probe failure for devices without EINT
    1dc6db047919 Bluetooth: L2CAP: Fix null-ptr-deref on l2cap_sock_ready_cb
    9ecbfd93cd6d Bluetooth: hci_ll: Fix firmware leak on error path
    bafec9325d4d Bluetooth: MGMT: Fix dangling pointer on mgmt_add_adv_patterns_monitor_complete
    7197462e90b8 Bluetooth: SCO: Fix use-after-free in sco_recv_frame() due to missing sock_hold
    8c96f3bd4ae0 Bluetooth: L2CAP: Validate PDU length before reading SDU length in l2cap_ecred_data_rcv()
    5b35f8211a91 Bluetooth: L2CAP: Fix stack-out-of-bounds read in l2cap_ecred_conn_req
    46737243be21 pinctrl: stm32: fix HDP driver dependency on GPIO_GENERIC
    1500005f286f can: statistics: add missing atomic access in hot path
    5cf3972c8221 erofs: set fileio bio failed in short read case
    f4b4debc0b73 dma: swiotlb: add KMSAN annotations to swiotlb_bounce()
    83f644ea9298 af_key: validate families in pfkey_send_migrate()
    8854e9367465 xfrm: prevent policy_hthresh.work from racing with netns teardown
    2255ed6adbc3 xfrm: Fix work re-schedule after cancel in xfrm_nat_keepalive_net_fini()
    ee0e3521f806 pinctrl: renesas: rza1: Normalize return value of gpio_get()
    33a7b3626893 xfrm: iptfs: fix skb_put() panic on non-linear skb during reassembly
    7068aaa1cef4 pinctrl: renesas: rzt2h: Fix device node leak in rzt2h_gpio_register()
    88d386243ed3 esp: fix skb leak with espintcp and async crypto
    af834169a410 xfrm: call xdo_dev_state_delete during state update
    ecb02f949e3e xfrm: fix the condition on x->pcpu_num in xfrm_sa_len
    88467620fa4a xfrm: add missing extack for XFRMA_SA_PCPU in add_acquire and allocspi
    b4a1e07944fe i3c: master: dw-i3c: Fix missing of_node for virtual I2C adapter
    6eee692c4204 ALSA: hda/realtek: add quirk for ASUS UM6702RC
    72969a102f93 spi: intel-pci: Add support for Nova Lake mobile SPI flash
    cbc467b4d9f3 usb: core: new quirk to handle devices with zero configurations
    ad696758a45c drm/amdgpu: fix gpu idle power consumption issue for gfx v12
    ca111c9d8d6c nvmet: move async event work off nvmet-wq
    17c9ad5aa46c objtool: Handle Clang RSP musical chairs
    90420418e622 ALSA: hda/realtek: Add headset jack quirk for Thinkpad X390
    f93b6da04ec7 ALSA: hda/realtek: Add quirk for Gigabyte Technology to fix headphone
    bee43f7b9bc6 ALSA: hda/realtek: add HP Laptop 14s-dr5xxx mute LED quirk
    ed97a37b00d9 powerpc64/ftrace: fix OOL stub count with clang
    2ec578e64521 btrfs: set BTRFS_ROOT_ORPHAN_CLEANUP during subvol create
    91608747a8d2 sched_ext: Use WRITE_ONCE() for the write side of dsq->seq update
    be1a341c1614 HID: apple: avoid memory leak in apple_report_fixup()
    74b1b0d84697 bpf: Fix u32/s32 bounds when ranges cross min/max boundary
    b4770c2e70e6 ASoC: amd: acp: Add ACP6.3 match entries for Cirrus Logic parts
    be0c2255d717 drm/ttm/tests: Fix build failure on PREEMPT_RT
    34f0790eb712 ALSA: hda/senary: Ensure EAPD is enabled during init
    5cf83b76f738 block: break pcpu_alloc_mutex dependency on freeze_lock
    e33c0c59f1f4 dma-buf: Include ioctl.h in UAPI header
    9924fd289901 ASoC: cs35l56: Only patch ASP registers if the DAI is part of a DAIlink
    1e68eeada7b0 ASoC: fsl_easrc: Fix event generation in fsl_easrc_iec958_put_bits()
    77759925aeb6 ALSA: hda/hdmi: Add Tegra238 HDA codec device ID
    3d5f63d86720 ASoC: Intel: sof_sdw: Add quirk for Alienware Area 51 (2025) 0CCD SKU
    74b25178943f scsi: devinfo: Add BLIST_SKIP_IO_HINTS for Iomega ZIP
    09293aecd479 ASoC: rt1321: fix DMIC ch2/3 mask issue
    99c9a684b22d scsi: mpi3mr: Clear reset history on ready and recheck state after timeout
    f927555140c7 ASoC: fsl_easrc: Fix event generation in fsl_easrc_iec958_set_reg()
    ef75dc1401d8 module: Fix kernel panic when a symbol st_shndx is out of bounds
    4ebc4d48fca9 HID: asus: add xg mobile 2023 external hardware support
    bf0ffc028f82 HID: mcp2221: cancel last I2C command on read error
    0a4e44eb4b0c platform/x86: oxpec: Add support for OneXPlayer X1 Air
    ba6af12e600b platform/x86: oxpec: Add support for Aokzoe A2 Pro
    6ea6cfdbd646 kbuild: install-extmod-build: Package resolve_btfids if necessary
    4121e616c08a net: usb: r8152: add TRENDnet TUC-ET2G
    1faaa81aabab platform/x86: oxpec: Add support for OneXPlayer X1z
    b06021c3cfd8 HID: apple: Add EPOMAKER TH87 to the non-apple keyboards list
    43c40bfb8503 platform/x86: oxpec: Add support for OneXPlayer APEX
    f061affafb59 HID: intel-ish-hid: ipc: Add Nova Lake-H/S PCI device IDs
    136f605e246b HID: magicmouse: avoid memory leak in magicmouse_report_fixup()
    4101a437c236 HID: magicmouse: fix battery reporting for Apple Magic Trackpad 2
    b96c7b25eb1b nvme-pci: ensure we're polling a polled queue
    4877461104f2 platform/x86: touchscreen_dmi: Add quirk for y-inverted Goodix touchscreen on SUPI S10
    05bc9939b501 platform/x86: intel-hid: Enable 5-button array on ThinkPad X1 Fold 16 Gen 1
    94b2a56fd4b1 platform/x86: hp-wmi: Add Omen 16-xd0xxx fan and thermal support
    470e01ae896c nvme-fabrics: use kfree_sensitive() for DHCHAP secrets
    2e9b4ca982d8 nvme-pci: cap queue creation to used queues
    47910033f542 platform/x86: intel-hid: Add Dell 14 Plus 2-in-1 to dmi_vgbs_allow_list
    a41cc7c1668e HID: asus: avoid memory leak in asus_report_fixup()
    c6a021ae84aa platform/x86: hp-wmi: Add Omen 16-wf0xxx fan and thermal support
    61415d080d43 tracing: Revert "tracing: Remove pid in task_rename tracing output"
    58bd87d0e692 bpf: Fix unsound scalar forking in maybe_fork_scalars() for BPF_OR
    f14ca604c0ff bpf: Fix undefined behavior in interpreter sdiv/smod for INT_MIN
    c0281da1f2aa bpf: Fix exception exit lock checking for subprogs
    a85bbd9ef8a0 cxl: Adjust the startup priority of cxl_pmem to be higher than that of cxl_acpi
    a446dbcb3877 bpf: Release module BTF IDR before module unload
    7c02a9bd7d14 driver core: platform: use generic driver_override infrastructure
    ad9465ca3444 driver core: generalize driver_override in struct device
    1b1f570444dc sh: platform_early: remove pdev->driver_override check
    1f11dc6dc792 hwmon: axi-fan: don't use driver_override as IRQ name
    e85f446e82aa cxl/hdm: Avoid incorrect DVSEC fallback when HDM decoders are enabled
    b36b0e804aee s390/mm: Add missing secure storage access fixups for donated memory
    35f7914e54fe perf: Make sure to use pmu_ctx->pmu for groups
    d94e6989e26c x86/perf: Make sure to program the counter value for stopped events on migration
    ccbf29b28b55 bpf: Fix constant blinding for PROBE_MEM32 stores
    a17443af8742 bpf: Reset register ID for BPF_END value tracking
    2c3214146204 cxl/port: Fix use after free of parent_port in cxl_detach_ep()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.18.bb              |  6 ++---
 .../linux/linux-yocto-tiny_6.18.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index f9ed72acc7..55752d5de5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -15,13 +15,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ed994ec846841494b9a1ff2badfa89970ad1d34f"
-SRCREV_meta ?= "41925d8d9ac0b1d6bdc0f9d84c5d7fd68ebcb693"
+SRCREV_machine ?= "700b638db800d9dae90ec3cbd464a6bc69708fae"
+SRCREV_meta ?= "8af6e86ecd97388ecbae830d484445146a2a2159"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.18.20"
+LINUX_VERSION ?= "6.18.21"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index 75cda179f7..a9053563c5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.18.inc
 
-LINUX_VERSION ?= "6.18.20"
+LINUX_VERSION ?= "6.18.21"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "4bd22cd74687bdc41573595014bfc99a2d25f18a"
-SRCREV_meta ?= "41925d8d9ac0b1d6bdc0f9d84c5d7fd68ebcb693"
+SRCREV_machine ?= "82a182f895e9b2a4021cd580e8f3fd18ac82420a"
+SRCREV_meta ?= "8af6e86ecd97388ecbae830d484445146a2a2159"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 63ed493450..db96131fbe 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "d9ebaa48a5dcfb812a0ac2421600f91ca686c4d8"
-SRCREV_machine:qemuarm64 ?= "4bd22cd74687bdc41573595014bfc99a2d25f18a"
-SRCREV_machine:qemuloongarch64 ?= "4bd22cd74687bdc41573595014bfc99a2d25f18a"
+SRCREV_machine:qemuarm ?= "02474ad96bbf476ffcbdaa7d60be3b40beecd5a4"
+SRCREV_machine:qemuarm64 ?= "82a182f895e9b2a4021cd580e8f3fd18ac82420a"
+SRCREV_machine:qemuloongarch64 ?= "82a182f895e9b2a4021cd580e8f3fd18ac82420a"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "4bd22cd74687bdc41573595014bfc99a2d25f18a"
-SRCREV_machine:qemuriscv64 ?= "4bd22cd74687bdc41573595014bfc99a2d25f18a"
-SRCREV_machine:qemuriscv32 ?= "4bd22cd74687bdc41573595014bfc99a2d25f18a"
-SRCREV_machine:qemux86 ?= "4bd22cd74687bdc41573595014bfc99a2d25f18a"
-SRCREV_machine:qemux86-64 ?= "4bd22cd74687bdc41573595014bfc99a2d25f18a"
+SRCREV_machine:qemuppc ?= "82a182f895e9b2a4021cd580e8f3fd18ac82420a"
+SRCREV_machine:qemuriscv64 ?= "82a182f895e9b2a4021cd580e8f3fd18ac82420a"
+SRCREV_machine:qemuriscv32 ?= "82a182f895e9b2a4021cd580e8f3fd18ac82420a"
+SRCREV_machine:qemux86 ?= "82a182f895e9b2a4021cd580e8f3fd18ac82420a"
+SRCREV_machine:qemux86-64 ?= "82a182f895e9b2a4021cd580e8f3fd18ac82420a"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "4bd22cd74687bdc41573595014bfc99a2d25f18a"
-SRCREV_meta ?= "41925d8d9ac0b1d6bdc0f9d84c5d7fd68ebcb693"
+SRCREV_machine ?= "82a182f895e9b2a4021cd580e8f3fd18ac82420a"
+SRCREV_meta ?= "8af6e86ecd97388ecbae830d484445146a2a2159"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "dd26ea937ef593a9c47aa4c85296e6b57a5344a1"
+SRCREV_machine:class-devupstream ?= "44c944a679974c2d18ee9b87070456d34193f3d4"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.18/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.18.20"
+LINUX_VERSION ?= "6.18.21"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


