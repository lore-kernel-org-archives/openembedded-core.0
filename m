Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F94CDE003
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 22:27:27 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32870.1782253636364623338
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 15:27:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=feSr9b2b;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso4013875e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 15:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782253635; x=1782858435; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e22rWBXr4qAykEcj9vOpgRiVsmmqlAQH0Vcx2OTlycY=;
        b=feSr9b2bVI8aCkFrFWsOPo9KBs32194+p/4WlW/nnGeb6HH+Q2V2FkGFSVKM9hRItY
         K7C5X2YFmR8zC18SvtIFYhJgQBcJ06Z4lwKa6sMqK5IUnsM645tEBPH+DVCzVOqGm95b
         r8AjWIzOGf/NlgbW5+KTPqTDp1amtfPxq+PSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782253635; x=1782858435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e22rWBXr4qAykEcj9vOpgRiVsmmqlAQH0Vcx2OTlycY=;
        b=etBQ/y2JuYj03bcOvGFtpBhSTUPKtRmDc+2BuuL0TXPF+Un/CWibDcOfkKfOhF/QHG
         TAnq8kanlK/d0tQkHpYZK8VhT04pP1IIOZJqv3turqSvp8CXaQZZC7kLz12BDkju9M5E
         4cb/qGTpzq5xjWi71yENoMLSwLwHh3FkTqL9ArV+6fo8h9EeeOWizqJ4zhf4wtZXaAB0
         OQwSUoTPxlESmqawGX0wBJiFYEKO6TPiMFMP7X8wayWIS7ncwJ1wkR5EtI6rVXZ5gNOJ
         G4iM355T9Jbv3va0e7Sm/SMG0XrdqDl42/GkbaaRtHaqmXNCDjbdQ+K4uqc+wHjAcKt9
         XKRw==
X-Gm-Message-State: AOJu0YyfTslqC8Ql2SiQmb3WQO146Q5QOBjmWHuj62L2YzTDJuxKG+Vu
	woNzXopFbizH2uRpvqO3nSD4eywe0SV+dYEEMr73JQB7CjbadhTZ8xCbj/ebVMRyRVoprFkvwho
	juIrU
X-Gm-Gg: AfdE7cmxOkxwVKCHRynWtwHKgbgb39Jn8s61Ip/QXKD3lfGlFiAhdnWqyQ/aC271vo8
	mvBsYn4ZGn0b6ugOf0tezByhvPw9puz7rAJpspt/2Qg9LWrvGeFrNyT/fjm16ckvYWWBZfahVyC
	OIDlNNkzycvxOqtvJRX9dOmL/97Bkm8jfFMmWAhlyeJpVibvBj+jBRDnKwZyAXeV37amQcLsK7b
	4sWGMEy7MI/vC13IsuclXoKH4j2a8Y5/kmCdHvGcaUndmsigAvsQScQGiPhWbh6pSXbFJgIE3Jz
	pzwA61dMmIl1PSn/xaklye12aZ/SGd+eCINAew/EIfYzu/4ICNGHEShkkg0CCao+wcit3lasYjP
	tCYu1x3RRva2cEpiVmdufe2PFoy4tIVq4C8LRojrUoC2CHcdHqSlaJaqnggyIPqsKUo50PgBx5f
	JbHys65hMaTM2Nlpr5Mmpbn5Cf1Um3b9G5saWLh3D6wFoQNOKPnGyXxmSAqtKllaWS7qO1TIFAu
	uPnyTPKqvzb0wda
X-Received: by 2002:a05:600c:34c2:b0:492:465a:7e5b with SMTP id 5b1f17b1804b1-4926087371bmr7222565e9.22.1782253634419;
        Tue, 23 Jun 2026 15:27:14 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0055dd0cae868d89dd.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:55dd:cae:868d:89dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd21dbdsm370786745e9.6.2026.06.23.15.27.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:27:13 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 30/41] linux-yocto/6.6: update to v6.6.132
Date: Wed, 24 Jun 2026 00:26:29 +0200
Message-ID: <f95c69b567abe9a87b15ac38b98b2836cb9a8f0c.1782252148.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782252148.git.yoann.congal@smile.fr>
References: <cover.1782252148.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 22:27:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239452

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    08667c1437c07 Linux 6.6.132
    866c39b567bde Revert "rust: pin-init: add references to previously initialized fields"
    e7ccb57fe7164 Revert "rust: pin-init: internal: init: document load-bearing fact of field accessors"
    29242a6238213 Linux 6.6.131
    e10af36ac3f7b tcp: Fix bind() regression for v6-only wildcard and v4-mapped-v6 non-wildcard addresses.
    de7c0c04ad868 futex: Clear stale exiting pointer in futex_lock_pi() retry path
    37cf97e37498a dmaengine: idxd: Fix freeing the allocated ida too late
    509ff03a3f188 dmaengine: idxd: Remove usage of the deprecated ida_simple_xx() API
    e3387416ad6b2 btrfs: fix lost error when running device stats on multiple devices fs
    94054ffd311a1 btrfs: fix leak of kobject name for sub-group space_info
    1ddab07bf2ed5 btrfs: fix super block offset in error message in btrfs_validate_super()
    5a0538380d29e dmaengine: xilinx_dma: Fix reset related timeout with two-channel AXIDMA
    ab4a8624b999a dmaengine: xilinx: xilinx_dma: Fix unmasked residue subtraction
    26271695302c8 dmaengine: xilinx: xilinx_dma: Fix residue calculation for cyclic DMA
    a3142cc1581a5 dmaengine: xilinx: xilinx_dma: Fix dma_device directions
    4b6e1da50b22e dmaengine: xilinx: xdma: Fix regmap init error handling
    afc39537cddcb dmaengine: dw-edma: Fix multiple times setting of the CYCLE_STATE and CYCLE_BIT bits for HDMA.
    5893ae3b4591b phy: ti: j721e-wiz: Fix device node reference leak in wiz_get_lane_phy_types()
    54d77cc0c40ca dmaengine: idxd: Fix memory leak when a wq is reset
    2bb9e9e93adff dmaengine: idxd: Fix not releasing workqueue on .release()
    cfadf46a67b68 erofs: fix "BUG: Bad page state in z_erofs_do_read_page"
    75669e987137f xfs: save ailp before dropping the AIL lock in push callbacks
    7121b22b0bac8 xfs: avoid dereferencing log items after push callbacks
    aba546061341b mm/damon/sysfs: check contexts->nr before accessing contexts_arr[0]
    2efbc838a26d3 nvme: fix admin queue leak on controller reset
    5a1e865e51063 xattr: switch to CLASS(fd)
    bb42e9627aa92 libbpf: Fix -Wdiscarded-qualifiers under C23
    4913592a3358f gfs2: Fix unlikely race in gdlm_put_lock
    8c93e73af8563 mtd: spi-nor: core: avoid odd length/address writes in 8D-8D-8D mode
    8cdc84415a4d2 mtd: spi-nor: core: avoid odd length/address reads on 8D-8D-8D mode
    0890fba6129dc rust: pin-init: internal: init: document load-bearing fact of field accessors
    c28fc9b0dbc7a rust: pin-init: add references to previously initialized fields
    ef41a85a55022 tracing: Fix potential deadlock in cpu hotplug with osnoise
    5a9f33294cc04 tracing: Switch trace_osnoise.c code over to use guard() and __free()
    c9b95ef6f5039 ksmbd: fix memory leaks and NULL deref in smb2_lock()
    9e785f004cbc5 ksmbd: fix use-after-free and NULL deref in smb_grant_oplock()
    d3c4458707e70 powerpc64/bpf: do not increment tailcall count when prog is NULL
    d419788a834f7 arm64: dts: imx8mn-tqma8mqnl: fix LDO5 power off
    1c82f863f090a ext4: always drain queued discard work in ext4_mb_release()
    ca99cbcc316cd ext4: fix iloc.bh leak in ext4_fc_replay_inode() error paths
    c84c0272e0b66 ext4: fix the might_sleep() warnings in kvfree()
    9449f99ba04f5 ext4: fix use-after-free in update_super_work when racing with umount
    b77de3fceafbb ext4: reject mount if bigalloc with s_first_data_block != 0
    2d31a5073f86a ext4: avoid allocate block from corrupted group in ext4_mb_find_by_goal()
    ecc50bfca9b5c ext4: avoid infinite loops caused by residual data
    65c6c30ce6362 ext4: replace BUG_ON with proper error handling in ext4_read_inline_folio
    df3cecfc5036f ext4: make recently_deleted() properly work with lazy itable initialization
    2b7bf66a09873 ext4: fix fsync(2) for nojournal mode
    850e68a1d3b06 ext4: fix stale xarray tags after writeback
    699bac4d4c951 ext4: convert inline data to extents when truncate exceeds inline size
    17c21b951e87c ext4: fix journal credit check when setting fscrypt context
    813f372a3b8aa xfs: fix ri_total validation in xlog_recover_attri_commit_pass2
    d38135af04a3a xfs: stop reclaim before pushing AIL during unmount
    f458dceaa6a35 LoongArch: Workaround LS2K/LS7A GPU DMA hang bug
    ebf6860ef7093 dmaengine: sh: rz-dmac: Move CHCTRL updates under spinlock
    79c4796b2711e dmaengine: sh: rz-dmac: Protect the driver specific lists
    75552b2c17124 irqchip/qcom-mpm: Add missing mailbox TX done acknowledgment
    d536a00f1b451 jbd2: gracefully abort on checkpointing state corruptions
    fd28c56186991 KVM: x86/mmu: Drop/zap existing present SPTE even when creating an MMIO SPTE
    78c8b090a3d5c net: macb: Use dev_consume_skb_any() to free TX SKBs
    d20d3eedbd04e scsi: ses: Handle positive SCSI error from ses_recv_diag()
    4ed727e35b0ab scsi: ibmvfc: Fix OOB access in ibmvfc_discover_targets_done()
    c9e137c26cd45 alarmtimer: Fix argument order in alarm_timer_forward()
    5c8ecdcfbfb0b erofs: add GFP_NOIO in the bio completion if needed
    a58d298a83a3a s390/entry: Scrub r12 register on kernel entry
    fedd2e1630cac virtio_net: Fix UAF on dst_ops when IFF_XMIT_DST_RELEASE is cleared and napi_tx is false
    1a0d9083c24fb media: mc, v4l2: serialize REINIT and REQBUFS with req_queue_mutex
    ebdd28353b958 hwmon: (peci/cputemp) Fix off-by-one in cputemp_is_visible()
    7c0666a26b290 hwmon: (peci/cputemp) Fix crit_hyst returning delta instead of absolute temperature
    844a18493173f hwmon: (pmbus/isl68137) Add mutex protection for AVS enable sysfs attributes
    d4f4364974460 KVM: arm64: Discard PC update state on vcpu reset
    501559fbe2097 platform/x86: ISST: Correct locked bit width
    2e2c7a6b2958e cpufreq: conservative: Reset requested_freq on limits change
    cb3d6efa78460 can: isotp: fix tx.buf use-after-free in isotp_sendmsg()
    54ecdf76a55e7 can: gw: fix OOB heap access in cgw_csum_crc8_rel()
    9e7f353710f85 ASoC: SOF: ipc4-topology: Allow bytes controls without initial payload
    a2842de6856a7 ALSA: firewire-lib: fix uninitialized local variable
    6fafc4c4238e5 ksmbd: do not expire session on binding failure
    358cdaa1f7fbf ksmbd: fix potencial OOB in get_file_all_info() for compound requests
    c3a89e3ec1ccf ksmbd: replace hardcoded hdr2_len with offsetof() in smb2_calc_max_out_buf_len()
    a11911d94c032 s390/barrier: Make array_index_mask_nospec() __always_inline
    7a5260fbc6e79 s390/syscalls: Add spectre boundary for syscall dispatch table
    adb25339b6611 spi: spi-fsl-lpspi: fix teardown order issue (UAF)
    ffd860907d0cb ASoC: adau1372: Fix clock leak on PLL lock failure
    94577b2e936f0 ASoC: adau1372: Fix unchecked clk_prepare_enable() return value
    227b7e14ae408 sysctl: fix uninitialized variable in proc_do_large_bitmap
    6ec394998c42a hwmon: (adm1177) fix sysfs ABI violation and current unit conversion
    e23602eb07797 drm/amdgpu: Fix fence put before wait in amdgpu_amdkfd_submit_ib
    9c886e63b6965 ACPI: EC: clean up handlers on probe failure in acpi_ec_setup()
    d997deaa7de36 ASoC: Intel: catpt: Fix the device initialization
    9014a30df4365 spi: sn-f-ospi: Fix resource leak in f_ospi_probe()
    b5f87d8493f54 PM: hibernate: Drain trailing zero pages on userspace restore
    8dda015822771 PM: hibernate: Don't ignore return from set_memory_ro()
    6a492d10c2f88 drm/i915/gmbus: fix spurious timeout on 512-byte burst reads
    daf1396e8f42a x86/efi: efi_unmap_boot_services: fix calculation of ranges_to_free size
    8212295549e47 scsi: scsi_transport_sas: Fix the maximum channel scanning issue
    ad5085d7ef1c5 RDMA/irdma: Return EINVAL for invalid arp index error
    acb060bc2609c RDMA/irdma: Fix deadlock during netdev reset with active connections
    45897c22a93ec RDMA/irdma: Remove reset check from irdma_modify_qp_to_err()
    2175c64d27e27 RDMA/irdma: Clean up unnecessary dereference of event->cm_node
    18386d84d2ad3 RDMA/irdma: Remove a NOP wait_event() in irdma_modify_qp_roce()
    d783393d2122b RDMA/irdma: Update ibqp state to error if QP is already in error state
    af310407f79d5 RDMA/irdma: Initialize free_qp completion before using it
    e82f2775b50cc RDMA/rw: Fall back to direct SGE on MR pool exhaustion
    96c60fb6896e6 regmap: Synchronize cache for the page selector
    9524634194516 net: macb: use the current queue number for stats
    fcec5ce2d73a4 netfilter: ctnetlink: use netlink policy range checks
    fe463e76c9b4b netfilter: nf_conntrack_sip: fix use of uninitialized rtp_addr in process_sdp
    168145c874446 netfilter: nf_conntrack_expect: skip expectations in other netns via proc
    c6a503a9f4deb netfilter: ip6t_rt: reject oversized addrnr in rt_mt6_check()
    a8365d1064ded netfilter: nfnetlink_log: fix uninitialized padding leak in NFULA_PAYLOAD
    2dcf324855c34 tls: Purge async_hold in tls_decrypt_async_wait()
    6fba3c3d48c92 Bluetooth: btusb: clamp SCO altsetting table indices
    52667c859fe33 Bluetooth: L2CAP: Fix ERTM re-init and zero pdu_len infinite loop
    5f84e845648df Bluetooth: btintel: serialize btintel_hw_error() with hci_req_sync_lock
    8d83194e8a880 Bluetooth: hci_sync: Remove remaining dependencies of hci_request
    0ee469ba7c58c Bluetooth: Remove 3 repeated macro definitions
    50c1e5fc7c444 Bluetooth: L2CAP: Fix send LE flow credits in ACL link
    acfb29f82223e dma-mapping: add missing `inline` for `dma_free_attrs`
    47d5f290fab3c net: enetc: fix the output issue of 'ethtool --show-ring'
    2297e38114316 udp: Fix wildcard bind conflict check when using hash2
    5b5af243e566b tcp: optimize inet_use_bhash2_on_bind()
    79a5c9344eaaf tcp: Rearrange tests in inet_csk_bind_conflict().
    34f5fe33e43bc tcp: Use bhash2 for v4-mapped-v6 non-wildcard address.
    654386baef228 net: fix fanout UAF in packet_release() via NETDEV_UP race
    a8ec35bb7b503 ipv6: Don't remove permanent routes with exceptions from tb6_gc_hlist.
    9241d441feb40 ipv6: Remove permanent routes from tb6_gc_hlist when all exceptions expire.
    6ae421f59bf80 ice: use ice_update_eth_stats() for representor stats
    0677d6bf6e853 platform/olpc: olpc-xo175-ec: Fix overflow error message to print inlen
    b04420f5b9315 rtnetlink: count IFLA_INFO_SLAVE_KIND in if_nlmsg_size
    81acbd345d405 net/smc: fix double-free of smc_spd_priv when tee() duplicates splice pipe buffer
    c1f97152df8df openvswitch: validate MPLS set/set_masked payload length
    42f0d3d812096 openvswitch: defer tunnel netdev_put to RCU release
    4c3e25a7b711a net: openvswitch: Avoid releasing netdev before teardown completes
    eb435d150ca74 nfc: nci: fix circular locking dependency in nci_close_device
    cfd863d4a3f2e ionic: fix persistent MAC address override on PF
    a4fd36bb000db pinctrl: mediatek: common: Fix probe failure for devices without EINT
    a04a760c06bb5 Bluetooth: L2CAP: Fix null-ptr-deref on l2cap_sock_ready_cb
    28904375d54b4 Bluetooth: hci_ll: Fix firmware leak on error path
    45aaca995e4a7 Bluetooth: SCO: Fix use-after-free in sco_recv_frame() due to missing sock_hold
    477ad49760720 Bluetooth: L2CAP: Validate PDU length before reading SDU length in l2cap_ecred_data_rcv()
    a4bda464c0deb can: statistics: add missing atomic access in hot path
    d6923498e972b dma: swiotlb: add KMSAN annotations to swiotlb_bounce()
    d3225e6b9bd51 af_key: validate families in pfkey_send_migrate()
    6a3ec6efbc4f9 esp: fix skb leak with espintcp and async crypto
    e17b0106447ed xfrm: Fix the usage of skb->sk
    86f130cf52504 xfrm: call xdo_dev_state_delete during state update
    7aac2b997e614 spi: intel-pci: Add support for Nova Lake mobile SPI flash
    56bc8de780720 usb: core: new quirk to handle devices with zero configurations
    1eed0199dbf41 objtool: Handle Clang RSP musical chairs
    006ce15577e76 ALSA: hda/realtek: Add headset jack quirk for Thinkpad X390
    f264d4e3a9261 ALSA: hda/realtek: add HP Laptop 14s-dr5xxx mute LED quirk
    c57276ced3c32 btrfs: set BTRFS_ROOT_ORPHAN_CLEANUP during subvol create
    2635d0c715f3f HID: apple: avoid memory leak in apple_report_fixup()
    d9365789a6fd7 dma-buf: Include ioctl.h in UAPI header
    9d43a897a9122 ASoC: fsl_easrc: Fix event generation in fsl_easrc_iec958_put_bits()
    cb4954fc2520d ASoC: fsl_easrc: Fix event generation in fsl_easrc_iec958_set_reg()
    082f15d288732 module: Fix kernel panic when a symbol st_shndx is out of bounds
    f18c38cb24c9c HID: asus: add xg mobile 2023 external hardware support
    4d36b7ad2c18b HID: mcp2221: cancel last I2C command on read error
    952e41b0f9238 net: usb: r8152: add TRENDnet TUC-ET2G
    7edfe4346b052 HID: magicmouse: avoid memory leak in magicmouse_report_fixup()
    eac08882569bc HID: magicmouse: fix battery reporting for Apple Magic Trackpad 2
    6f12734c4b619 nvme-pci: ensure we're polling a polled queue
    50063c576c6ed platform/x86: touchscreen_dmi: Add quirk for y-inverted Goodix touchscreen on SUPI S10
    0ab508ace30c7 platform/x86: intel-hid: Enable 5-button array on ThinkPad X1 Fold 16 Gen 1
    94cfabcf28209 nvme-fabrics: use kfree_sensitive() for DHCHAP secrets
    c69b5dd587f6f nvme-pci: cap queue creation to used queues
    79dc4ced3bb62 platform/x86: intel-hid: Add Dell 14 Plus 2-in-1 to dmi_vgbs_allow_list
    f20f17cffbe34 HID: asus: avoid memory leak in asus_report_fixup()
    694ea55f1b1c7 bpf: Fix undefined behavior in interpreter sdiv/smod for INT_MIN
    d47bba0cfdd4c bpf: Release module BTF IDR before module unload
    0f46fd10de29e sh: platform_early: remove pdev->driver_override check
    0af982240b8f4 hwmon: axi-fan: don't use driver_override as IRQ name
    e73121faf530e hwmon: (axi-fan-control) Make use of dev_err_probe()
    50fe5fbf98290 hwmon: (axi-fan-control) Use device firmware agnostic API
    bd738f986f6a0 cxl/hdm: Avoid incorrect DVSEC fallback when HDM decoders are enabled
    656f35b463995 perf: Make sure to use pmu_ctx->pmu for groups
    79cda13757901 perf: Extract a few helpers

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index ae78c91f64c..c58279873e6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "aa09ac001c2f96bd4ba32ba47e84e02db0f6ceed"
-SRCREV_meta ?= "a5d680f4986edab4c2c4636c0dc80ca559fc70ef"
+SRCREV_machine ?= "a6a88382093932d5f963f38334035221c0b8344e"
+SRCREV_meta ?= "8cfac9f000ccc138d1a11ed500406c4394d803d6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.130"
+LINUX_VERSION ?= "6.6.132"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 0bc45ffd642..58fd5a57b84 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.130"
+LINUX_VERSION ?= "6.6.132"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "2bf97eeefd96e27a2195cb4757c13110e92afcc6"
-SRCREV_meta ?= "a5d680f4986edab4c2c4636c0dc80ca559fc70ef"
+SRCREV_machine ?= "ff381816e34f3ed488248a69843227160f7ede06"
+SRCREV_meta ?= "8cfac9f000ccc138d1a11ed500406c4394d803d6"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index ce599405446..633abb36ddb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "b4e8a23613e117b5803dae49e8d4d562c37bd8a3"
-SRCREV_machine:qemuarm64 ?= "236dabe34ed663918803f17cbda90a1d6ac39922"
-SRCREV_machine:qemuloongarch64 ?= "cc107ef0945033f98a169bf1294dad3b574bfc60"
-SRCREV_machine:qemumips ?= "8022cb3ada420a7a3508dcd0a00e7367a0b08e52"
-SRCREV_machine:qemuppc ?= "77817988bcc71ba230e44d14e2d1c66837543dc9"
-SRCREV_machine:qemuriscv64 ?= "cc107ef0945033f98a169bf1294dad3b574bfc60"
-SRCREV_machine:qemuriscv32 ?= "cc107ef0945033f98a169bf1294dad3b574bfc60"
-SRCREV_machine:qemux86 ?= "cc107ef0945033f98a169bf1294dad3b574bfc60"
-SRCREV_machine:qemux86-64 ?= "cc107ef0945033f98a169bf1294dad3b574bfc60"
-SRCREV_machine:qemumips64 ?= "7ffb3cfb496703be3c0951bf54eb6ce69fdd1a1e"
-SRCREV_machine ?= "cc107ef0945033f98a169bf1294dad3b574bfc60"
-SRCREV_meta ?= "a5d680f4986edab4c2c4636c0dc80ca559fc70ef"
+SRCREV_machine:qemuarm ?= "ecff059b6885829e70f8a0fa96956e330b3dc8a4"
+SRCREV_machine:qemuarm64 ?= "a2808cd3d14323f1be06f83c084f7ccc19346305"
+SRCREV_machine:qemuloongarch64 ?= "81aa29cd11159e96623449efb43a609e1a814c87"
+SRCREV_machine:qemumips ?= "e785bf4e3c24d0f6a02c1c12c4b636eaaa539f19"
+SRCREV_machine:qemuppc ?= "f1e47cb079d5fa8a5f22f795bd4130dc001babab"
+SRCREV_machine:qemuriscv64 ?= "81aa29cd11159e96623449efb43a609e1a814c87"
+SRCREV_machine:qemuriscv32 ?= "81aa29cd11159e96623449efb43a609e1a814c87"
+SRCREV_machine:qemux86 ?= "81aa29cd11159e96623449efb43a609e1a814c87"
+SRCREV_machine:qemux86-64 ?= "81aa29cd11159e96623449efb43a609e1a814c87"
+SRCREV_machine:qemumips64 ?= "6357451678385be03d1f7d60d0f8868aa7514418"
+SRCREV_machine ?= "81aa29cd11159e96623449efb43a609e1a814c87"
+SRCREV_meta ?= "8cfac9f000ccc138d1a11ed500406c4394d803d6"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "c09fbcd31ae6d71e7c69545839bec92d8e15c13b"
+SRCREV_machine:class-devupstream ?= "08667c1437c07ce2e5d323165031ae152d6f061a"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.130"
+LINUX_VERSION ?= "6.6.132"
 
 PV = "${LINUX_VERSION}+git"
 

