Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98681CD5BD0
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 02:37:36 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2836.1779935846851515250
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 19:37:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=E8aqkTzl;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8b7dccd6fe4so118342276d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 19:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779935846; x=1780540646; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxTQ+AntpqamRYV5KKfHPapAeChPKc3XwluxotoYFA8=;
        b=E8aqkTzlWtYf2D/MaQjhntAjm81CDmvPjyXYMlCwz2kX05lOt4wHmO2VK/eW+SGZRZ
         4yAFYe39b2fU62Ja//CPlUwrY6bJjFBC9+/Wasde8ngEMEPgB6fNZ/op9bJ2rDUFD7iu
         5g7xCOayTY0iIDXhi2e0BkzU42OQ83UwdxqZqqRNI/sFkbnXn3Y/n72/5uGREujEe8Qq
         wrX6UkkGUZe7ViJdzY8/g3JQz8vggLMxnFEt3/glNHDRVjwWqOha9GtxU0VX8rH0j+kl
         9ZDSvTcvZnu6frJAvykesw4bVb9/N5CyYovsBSb9Z4DVejHMl/eTJVQuRnbc7bj7TBjo
         yLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779935846; x=1780540646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kxTQ+AntpqamRYV5KKfHPapAeChPKc3XwluxotoYFA8=;
        b=ID6+zTfzMNs73weu2GqnVzQstT7PObCxRoL7RyaAw87auGISxxQk0oGN13DZbgopDy
         bqRaUDpVZxa/IP168LWez9wEKmHmjDuMxb3R+5wQ1CHGtsyMc5C5VbobXJ93TJ8zCA2p
         IE7PLgbSYQBh+o4VdtwLfzC8KEOBS+332Qci6MOABJNpfxak8A5aSgflggyJCQei0Reu
         O06OqtJXGgVUPZ9gfIc+p4Bh6XkwxwbPGHRTGgXAABQQirN3Dtd4INKqQUDq9KNVHyr/
         IEYTiFjxpryd8LG6dDK5EcVapLtUjFRW88S5Ay+BUma07ymDFpeTHVrAJALFMJLdpAxF
         8xfQ==
X-Gm-Message-State: AOJu0YzXNuHIh+2oRITZfVa4OVoz3Exq+t3Bv5bNCBouwu7UvvYyNGGH
	5ju5K04eDU3MJF0ZveEY3jR5n+JYIC195XZDsfOf3+ZIiW5uXVJZZ0lGFrIl8OXw
X-Gm-Gg: Acq92OH3UNm/9FXrgLcNAUqS+Gb5bjKFwCRExdOJQS1My1qCzhm66gwM1u9YgH4RxBw
	6GisvLaRzpuMjBGSyW9pPw0ykFqdkPinx5AO1HEwNLVLoJ41zT51K+NEsZdSDheGGoF6mBrdfE9
	npqtmiO4urjxNlPmptKgjstDBRcbBk/C1l4a0b28rjNX5vTb/9fxXmC2MqVcKu2Kw1HNn6eF8Aa
	HDshX4tipWdi2PLWupbM40wRKY+qbcqDwOHjObt/mZevAZgJULKhXfoJ153EMYuHYBgEbVLF1nd
	4rDiISCcPefNN4k36/cxCv0ttzrp039YNlUcQd8XYdZGAHLMbHkziyFGdm+yMzB9HNfmOQssUhj
	MHtX58Ifmj7fnx2HLLp4qXmV5ZVUOJhiTRzmqFrBEfqzNKyQxuEwz8Ug0jv3SkLA9Be+DbX9jis
	HEPsFevkO5StlqZ9F+Zv2H6IKVg5X3r0QWZ0ul/TyfS0QAL2HPgif2X8u5Mi90L8T+H2XuGCntV
	X+7ATrPLaDgqAkVvZzEcXCXq73hrbALEKOQGG+PACY6suMCNMaWFhKtJsa0g7HdEEwj4FLvnUzM
	tyKuCiYstrXrx/1MRfwZaVP8QZBIWI5Tshic6Hw28gemKC4fjEQcPDg=
X-Received: by 2002:a05:6214:5412:b0:8c6:6d97:b733 with SMTP id 6a1803df08f44-8cc7b5c2bebmr287798506d6.40.1779935844975;
        Wed, 27 May 2026 19:37:24 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc80dcec8esm186146436d6.7.2026.05.27.19.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 19:37:23 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta-yocto-bsp][PATCH 07/07] yocto-bsps: update to v6.18.33
Date: Wed, 27 May 2026 22:37:11 -0400
Message-ID: <20260528023714.4026613-8-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528023714.4026613-1-bruce.ashfield@gmail.com>
References: <20260528023714.4026613-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 02:37:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237688

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.18 to the latest korg -stable release that comprises
the following commits:

    83657f418961 Linux 6.18.33
    664736cc1f95 netfs: Fix potential uninitialised var in netfs_extract_user_iter()
    e9a23ec9461e selftests/bpf: Remove test_access_variable_array
    ff375cc75f91 net: skbuff: propagate shared-frag marker through frag-transfer helpers
    3bd9e113d500 net: skbuff: preserve shared-frag marker during coalescing
    640e37f58f99 net/rds: reset op_nents when zerocopy page pin fails
    6bf4253af814 spi: sifive: fix controller deregistration
    27fcf3dd04df spi: sifive: Simplify clock handling with devm_clk_get_enabled()
    fac9cfad2f90 f2fs: fix false alarm of lockdep on cp_global_sem lock
    a4a0340d20ab sched_ext: Pass held rq to SCX_CALL_OP() for core_sched_before
    255c3998dae8 sched_ext: Guard scx_dsq_move() against NULL kit->dsq after failed iter_new
    a3c44e77f379 perf/x86/intel: Disable PMI for self-reloaded ACR events
    b6437e6f8f3d btrfs: do not mark inode incompressible after inline attempt fails
    2647b8fe2f1f smb: client: Use FullSessionKey for AES-256 encryption key derivation
    244575d0c695 eventfs: Use list_add_tail_rcu() for SRCU-protected children list
    4fa42a249e8c drm/v3d: Reject empty multisync extension to prevent infinite loop
    4e003e2fb6d3 drm/gma500/oaktrail_lvds: fix i2c adapter leaks on init
    ab9256936b58 drm/gma500/oaktrail_lvds: fix hang on init failure
    6d835a99474c drm/gma500/oaktrail_hdmi: fix i2c adapter leak on setup
    9a34b94832c3 drm/ttm: Convert -EAGAIN from dmem_cgroup_try_charge to -ENOSPC
    39fdac6be02e drm/xe/dma-buf: fix UAF with retry loop
    20a99ea1e2fd drm/xe/dma-buf: handle empty bo and UAF races
    c76273c3eba9 drm/panfrost: Fix wait_bo ioctl leaking positive return from dma_resv_wait_timeout()
    65a3a1cf29eb drm/i915: skip __i915_request_skip() for already signaled requests
    9022cb9ac0c2 iommu/vt-d: Avoid NULL pointer dereference or refcount corruption
    88397fad7914 iommu/vt-d: Fix oops due to out of scope access
    637b7ce89e54 iommu/vt-d: Disable DMAR for Intel Q35 IGFX
    4d2b37abda95 libceph: handle rbtree insertion error in decode_choose_args()
    0f3604cbe4df libceph: Fix potential out-of-bounds access in crush_decode()
    f2f95e6d4b97 libceph: Fix potential null-ptr-deref in decode_choose_args()
    48df98d12b15 libceph: Fix potential out-of-bounds access in osdmap_decode()
    0de5cb2d61d0 irqchip/gic-v5: Allocate ITS parent LPIs as a range
    2cbd4abe413e irqchip/gic-v5: Support range allocation for LPIs
    e6550b17cc0e irqchip/gic-v5: Move LPI allocation into the LPI domain
    84ff9ae64d9b irqchip/meson-gpio: Use the correct register in meson_s4_gpio_irq_set_type()
    5b0756b6b757 irqchip/riscv-imsic: Clear interrupt move state during CPU offlining
    42558732af4a nfsd: fix file change detection in CB_GETATTR
    fc6db1e47c55 netfs: fix error handling in netfs_extract_user_iter()
    1a78bea6a5e9 powerpc/warp: Fix error handling in pika_dtm_thread
    3f6fb0211b39 virt: sev-guest: Do not use host-controlled page order in cleanup path
    690b7ca1f9b3 xfs: fix memory leak on error in xfs_alloc_zone_info()
    b0bd7a850e1f x86/kexec: Push kjump return address even for non-kjump kexec
    f0a0f01787ec iommu/amd: Bounds-check devid in __rlookup_amd_iommu()
    252c5051dba9 io-wq: check that the predecessor is hashed in io_wq_remove_pending()
    d5bd8b4e39cf ceph: fix BUG_ON in __ceph_build_xattrs_blob() due to stale blob size
    3fa13ceefbc5 ceph: fix a buffer leak in __ceph_setxattr()
    9ebb7eba1237 btrfs: only release the dirty pages io tree after successful writes
    d7b2de5d9862 ALSA: usb-audio: qcom: Check offload mapping failures
    09141583bd97 ALSA: usb-audio: Bound MIDI endpoint descriptor scans
    f9c184a83574 ALSA: usb-audio: Bound MIDI 2.0 endpoint descriptor scans
    651760f57fe0 ALSA: hda/realtek: Add quirk for Samsung Galaxy Book5 360 headphone
    a424946e00f2 ALSA: hda/realtek: Add mute LED quirk for HP Pavilion Laptop 16-ag0xxx
    d3e03c25d520 accel/rocket: Fix prep_bo ioctl leaking positive return from dma_resv_wait_timeout()
    9b718ebe0e97 platform/x86: lenovo-wmi-other: Fix tunable_attr_01 struct members
    b6c0f545c8f9 platform/x86: lenovo-wmi-helpers: Move gamezone enums to wmi-helpers
    1b2dca1f9b5a platform/x86: intel: Move debugfs register before creating devices
    d25b863e2dff drm/i915/dp: Fix VSC dynamic range signaling for RGB formats
    318b995cffcf drm: Replace old pointer to new idr
    d31c6b334215 drm/loongson: Use managed KMS polling
    97a05b0ae9ea smb/client: fix possible infinite loop and oob read in symlink_data()
    0ea9d6e036be nvme-apple: Reset q->sq_tail during queue init
    527cb4a55155 Bluetooth: btmtk: accept too short WMT FUNC_CTRL events
    151cfe527f0a media: staging: imx: configure src_mux in csi_start
    7c96f2e5b6fb ata: libata-scsi: fix requeue of deferred ATA PASS-THROUGH commands
    d92229dfa3f9 fuse: avoid 0x10 fault in fuse_readahead when max_pages == 0
    3ab135238832 HID: core: Fix size_t specifier in hid_report_raw_event()
    301338b8edad HID: core: introduce hid_safe_input_report()
    509c26050650 HID: pass the buffer size to hid_report_raw_event
    8adc988e9f20 KVM: x86: Fix Xen hypercall tracepoint argument assignment
    b22a2da8792a KVM: s390: pci: fix GAIT table indexing due to double-scaling pointer arithmetic
    0d419c23bb11 KVM: Reject wrapped offset in kvm_reset_dirty_gfn()
    d9017d233258 audit: enforce AUDIT_LOCKED for AUDIT_TRIM and AUDIT_MAKE_EQUIV
    e029cbd8c06d net: atlantic: preserve PCI wake-from-D3 on shutdown when WOL enabled
    1dced0725e2f netfilter: nft_ct: fix missing expect put in obj eval
    a9f76de38ba3 Revert "ACPI: CPPC: Adjust debug messages in amd_set_max_freq_ratio() to warn"
    722b91d5086a idpf: fix double free and use-after-free in aux device error paths
    c4a8998aafb8 cgroup/dmem: Return -ENOMEM on failed pool preallocation
    bddf59818ae5 net: ena: PHC: Check return code before setting timestamp output
    e35f3550c5b4 audit: fix incorrect inheritable capability in CAPSET records
    430b05f6c918 netfilter: nf_conntrack_sip: get helper before allocating expectation
    95e8ae9af2a6 net: ena: PHC: Fix potential use-after-free in get_timestamp
    10addc25fa17 workqueue: Fix wq->cpu_pwq leak in alloc_and_link_pwqs() WQ_UNBOUND path
    f43240068791 i40e: Cleanup PTP pins on probe failure
    a1c5672faf8e crypto: af_alg - Cap AEAD AD length to 0x80000000
    b4e1c03b876c sched/fair: Revert force wakeup preemption
    ec4f6da3373d sched/fair: Fix wakeup_preempt_fair() for not waking up task
    ce8ac8432fd7 net: mana: Init gf_stats_work before potential error paths in probe
    45d6c6c10b8b net: mana: Fix use-after-free in reset service rescan path
    80c025618524 net: airoha: Fix VIP configuration for AN7583 SoC
    81a2a3607866 net: airoha: Use gdm port enum value whenever possible
    106581064439 net: airoha: Remove code duplication in airoha_regs.h
    db9af8a2efad net/sched: sch_pie: annotate more data-races in pie_dump_stats()
    90619fdedfb9 net: airoha: Move ndesc initialization at end of airoha_qdma_init_tx()
    7645ead02939 net: airoha: Move entries to queue head in case of DMA mapping failure in airoha_dev_xmit()
    95fdee73c39c rtla: Fix parse_cpu_set() bug introduced by strtoi()
    26b4ea23f511 net: airoha: Fix a copy and paste bug in probe()
    dbbd60129f79 bpf: Fix sync_linked_regs regarding BPF_ADD_CONST32 zext propagation
    22f72b1dccfe PCI: Initialize temporary device in new_id_store()
    735439394dde Revert "papr-hvpipe: convert papr_hvpipe_dev_create_handle() to FD_PREPARE()"
    d66dc9505935 Revert "pseries/papr-hvpipe: Fix race with interrupt handler"
    1dcd36420af2 futex: Drop CLONE_THREAD requirement for private default hash alloc
    dcb89deed40b arm64: Reserve an extra page for early kernel mapping
    b9d854388988 kselftest/arm64: Include <asm/ptrace.h> for user_gcs definition
    5704a90c0970 net/sched: cls_flower: revert unintended changes
    3f4a3f740c23 sfc: fix error code in efx_devlink_info_running_versions()
    9c54e76f8d6e net: tls: fix strparser anchor skb leak on offload RX setup failure
    f5c5692a61f7 ice: add dpll peer notification for paired SMA and U.FL pins
    f5f1b59bdb12 dpll: export __dpll_pin_change_ntf() for use under dpll_lock
    47e53940451c dpll: Add notifier chain for dpll events
    8bcfd78bbc32 dpll: Allow associating dpll pin with a firmware node
    a723643ee055 ice: fix missing dpll notifications for SW pins
    3b3aab57e33f ice: fix SMA and U.FL pin state changes affecting paired pin
    0c56810ce1ba ice: fix missing SMA pin initialization in DPLL subsystem
    c3cad2ae8088 ice: fix infinite recursion in ice_cfg_tx_topo via ice_init_dev_hw
    1e9185b13ce5 ice: fix NULL pointer dereference in ice_reset_all_vfs()
    b166453d8d01 iavf: add VIRTCHNL_OP_ADD_VLAN to success completion handler
    e469b1ff3319 iavf: wait for PF confirmation before removing VLAN filters
    b0173c36977c iavf: stop removing VLAN filters from PF on interface down
    033fa40dff77 iavf: rename IAVF_VLAN_IS_NEW to IAVF_VLAN_ADDING
    864577384d72 page_pool: fix memory-provider leak in page_pool_create_percpu() error path
    c169c5837525 bonding: 3ad: implement proper RCU rules for port->aggregator
    f2edb41645bf bonding: print churn state via netlink
    c1e0b5eccdf0 net: airoha: Do not return err in ndo_stop() callback
    aaad53a55812 net: airoha: fix BQL imbalance in TX path
    d1469eb93af7 drm/xe/gsc: Fix BO leak on error in query_compatibility_version()
    bebce43f34b5 drm/xe/eustall: Fix drm_dev_put called before stream disable in close
    753b149d5a43 drm/xe: Fix error cleanup in xe_exec_queue_create_ioctl()
    2d8656c27ff6 drm/xe/debugfs: Correct printing of register whitelist ranges
    8b85ffe52052 drm/amd/display: Read EDID from VBIOS embedded panel info
    07822f1d9bdb drm/amd/display: Allow constructing DCE8 link encoder without DDC
    e0f874f209d4 drm/amd/display: Allow constructing DCE6 link encoder without DDC
    9b84d67ce8c9 drm/amd/display: Allow DCE link encoder without AUX registers
    69a7cfc66405 futex: Prevent lockup in requeue-PI during signal/ timeout wakeup
    24c22c644ea5 ALSA: hda/tas2781: Fix incorrect bit update for non-book-zero or book 0 pages >1
    7e6f7ac79abe ALSA: hda: cs35l56: Fix uninitialized value in cs35l56_hda_read_acpi()
    f837c7b85143 ALSA: hda/conexant: Fix missing error check for jack detection
    47984e9db9ca netconsole: propagate device name truncation in dev_name_store()
    b19a6804d498 net/sched: sch_cake: annotate data-races in cake_dump_stats() (V)
    cd0401593b2d net/sched: sch_cake: annotate data-races in cake_dump_stats() (III)
    74a02921c48f bareudp: fix NULL pointer dereference in bareudp_fill_metadata_dst()
    ea9b4f07da5d sctp: discard stale INIT after handshake completion
    50c450bae38d netfilter: skip recording stale or retransmitted INIT
    841133395b42 ASoC: codecs: ab8500: Fix casting of private data
    aa1a08a4632a net: psp: require admin permission for dev-set and key-rotate
    d90df5ce6deb net: psp: check for device unregister when creating assoc
    39767f944a8c io_uring/napi: cap busy_poll_to 10 msec
    d0f6ae14c045 drm/amdgpu/jpeg: set no_user_fence for JPEG v5.0.1 ring
    a7e63bb93a7f drm/amdgpu/jpeg: set no_user_fence for JPEG v5.0.0 ring
    f26e3f7186cd drm/amdgpu/jpeg: set no_user_fence for JPEG v4.0.5 ring
    8549b3933038 drm/amdgpu/jpeg: set no_user_fence for JPEG v4.0.3 ring
    6876d05b8991 drm/amdgpu/jpeg: set no_user_fence for JPEG v4.0 ring
    5ada37d7f736 drm/amdgpu/jpeg: set no_user_fence for JPEG v3.0 ring
    3a96fee676fc drm/amdgpu/jpeg: set no_user_fence for JPEG v2.5 ring
    b41248d1c183 drm/amdgpu/jpeg: set no_user_fence for JPEG v2.0 ring
    081ef0e46c9c drm/amdgpu/vcn: set no_user_fence for VCN v5.0.1 enc ring
    139a8a52ef43 drm/amdgpu/vcn: set no_user_fence for VCN v5.0.0 enc ring
    6d9a98c5ed65 drm/amdgpu/vcn: set no_user_fence for VCN v4.0.5 enc ring
    9076a83e5ade drm/amdgpu/vcn: set no_user_fence for VCN v4.0.3 enc ring
    1286b6872de0 drm/amdgpu/vcn: set no_user_fence for VCN v4.0 enc ring
    2d6525e7b250 drm/amdgpu/vcn: set no_user_fence for VCN v3.0 enc/dec rings
    602d4c5872b2 drm/amdgpu/vcn: set no_user_fence for VCN v2.5 enc/dec rings
    ac06ce5cac9e drm/amdgpu/vcn: set no_user_fence for VCN v2.0 enc/dec rings
    fb128a905f7a net: phy: dp83869: fix setting CLK_O_SEL field.
    1c07b968a5d7 s390/mm: Fix phys_to_folio() usage in do_secure_storage_access()
    0f5bca930f8d md/md-bitmap: add a none backend for bitmap grow
    7035caaa1b6f md/md-bitmap: split bitmap sysfs groups
    4d4814310391 md: factor bitmap creation away from sysfs handling
    00d5ae2b3b0f md: add fallback to correct bitmap_ops on version mismatch
    d934a2bbed53 md/raid1,raid10: don't fail devices for invalid IO errors
    8252ae66cfc4 net: mctp i2c: check length before marking flow active
    f3c16e1f4a31 sched/fair: Clear rel_deadline when initializing forked entities
    63273472430e sched/fair: Fix wakeup_preempt_fair() vs delayed dequeue
    7ce7a08cde16 sched/fair: Reimplement NEXT_BUDDY to align with EEVDF goals
    67bdf14af6b8 ALSA: usb-audio: Fix potential leak of pd at parsing UAC3 streams
    f9e6b2f22b1f netpoll: fix IPv6 local-address corruption
    9544ca41e1ec tcp: make probe0 timer handle expired user timeout
    63063ba60d2d neigh: let neigh_xmit take skb ownership
    48b26d48e762 net/sched: taprio: fix NULL pointer dereference in class dump
    cca14c404c0e NFC: trf7970a: Ignore antenna noise when checking for RF field
    3dc58085988b spi: amlogic-spisg: initialize completion before requesting IRQ
    81fc967bf476 net: usb: rtl8150: free skb on usb_submit_urb() failure in xmit
    6999d70e0eda net: usb: rtl8150: fix use-after-free in rtl8150_start_xmit()
    a7a97f2303e6 vrf: Fix a potential NPD when removing a port from a VRF
    02495cc4a33e net/sched: sch_fq_pie: annotate data-races in fq_pie_dump_stats()
    10c242aa0c54 net/sched: sch_choke: annotate data-races in choke_dump_stats()
    f670fa4b19ce net: airoha: Do not read uninitialized fragment address in airoha_dev_xmit()
    f4b7ed23fae6 net: airoha: Do not wake all netdev TX queues in airoha_qdma_wake_netdev_txqs()
    546d998978dc net: airoha: fix typo in function name
    b48399bc63ff net: airoha: stop net_device TX queue before updating CPU index
    7a72efd11722 net/sched: netem: check for negative latency and jitter
    fabf2b2bbfa1 net/sched: netem: fix slot delay calculation overflow
    2e2a8b077699 net/sched: netem: validate slot configuration
    33cc6a26898a net/sched: netem: only reseed PRNG when seed is explicitly provided
    8450462eaf91 net/sched: netem: fix queue limit check to include reordered packets
    1633087d8a76 net/sched: netem: fix probability gaps in 4-state loss model
    750d0091bebf netdevsim: zero initialize struct iphdr in dummy sk_buff
    c9553e0567b0 cdrom, scsi: sr: propagate read-only status to block layer via set_disk_ro()
    156f410cafa2 ACPI: APEI: EINJ: Fix EINJV2 memory error injection
    f6553cca1775 ACPICA: Provide #defines for EINJV2 error types
    b69f420c98b2 arm64/scs: Fix potential sign extension issue of advance_loc4
    793bae6ce71c drm/color-mgmt: Typo s/R332/RGB332/
    df332876455c drm/sysfb: ofdrm: fix PCI device reference leaks
    f4343ddee93b ASoC: tas2770: Fix order of operations for temperature calculation
    6c06e9ba8753 ASoC: tas2764: Mark die temp register as volatile
    9834d8cc89fe spi: rockchip: Read ISR, not IMR, to detect cs-inactive IRQ
    6c554462a6ad ASoC: amd: acp: Add DMI quirk for Valve Steam Deck OLED
    7df9863bf538 netfilter: nf_conntrack_sip: don't use simple_strtoul
    938867e870fb netfilter: xt_policy: fix strict mode inbound policy matching
    e0805ccf7917 drm/amdgpu/gfx6: Support harvested SI chips with disabled TCCs (v2)
    6d6cd5652c86 drm/amdgpu/uvd3.1: Don't validate the firmware when already validated
    a31c3feb54b1 drm/amdgpu: fix AMDGPU_INFO_READ_MMR_REG
    24c55a9aa298 drm/amdgpu/gmc: Fix AMDGPU_GART_PLACEMENT_LOW to not overlap with VRAM
    616af8df424c nvme-pci: fix missed admin queue sq doorbell write
    0bd93ce4f3c3 netfilter: nf_tables: use list_del_rcu for netlink hooks
    1c55053f8ffd netfilter: arp_tables: fix IEEE1394 ARP payload parsing
    c2a11441538b nvmet-tcp: propagate nvmet_tcp_build_pdu_iovec() errors to its callers
    119e84719f98 tracing: branch: Fix inverted check on stat tracer registration
    1aa08e1fd60a cgroup: Increment nr_dying_subsys_* from rmdir context
    64a5a3dfa8fd btrfs: fix double-decrement of bytes_may_use in submit_one_async_extent()
    b740cc86816b fsnotify: fix inode reference leak in fsnotify_recalc_mask()
    f7f5d83b0dc2 mailbox: mailbox-test: make data_ready a per-instance variable
    3c791f6fb791 mailbox: mailbox-test: initialize struct earlier
    82f6dcea46cf mailbox: mailbox-test: don't free the reused channel
    9dd748994332 mailbox: add sanity check for channel array
    8d5e39df95ed cgroup/rdma: fix integer overflow in rdmacg_try_charge()
    03dc070fa0fc sched/psi: fix race between file release and pressure write
    742001919653 mailbox: mailbox-test: free channels on probe error
    d3da3c85cdd6 mailbox: mtk-cmdq: Fix CURR and END addr for task insert case
    d07bc4ce8e24 kbuild: Never respect CONFIG_WERROR / W=e to fixdep
    4d837117d45d tools/power turbostat: Fix unrecognized option '-P'
    262187aa6981 tools/power turbostat: Fix and document --header_iterations
    481dbda367f4 tools/power turbostat: Use strtoul() for iteration parsing
    8adeeef75597 tools/power turbostat.8: Document the "--force" option
    c7a9cde132bf fbdev: offb: fix PCI device reference leak on probe failure
    4b238fb04bd2 kbuild: builddeb - avoid recompiles for non-cross-compiles
    03a817755611 rtc: abx80x: Disable alarm feature if no interrupt attached
    a3fd5dc1c7b0 fs/adfs: validate nzones in adfs_validate_bblk()
    ef4ca02e9536 eventpoll: fix ep_remove struct eventpoll / struct file UAF
    eb206b8f55e1 eventpoll: move epi_fget() up
    e644f892e1f2 eventpoll: drop vestigial __ prefix from ep_remove_{file,epi}()
    e084713397a4 eventpoll: kill __ep_remove()
    416b491cd289 eventpoll: split __ep_remove()
    9348f4763aa9 eventpoll: use hlist_is_singular_node() in __ep_remove()
    bd501c86407d nstree: fix func. parameter kernel-doc warnings
    70f788e22693 vhost_net: fix sleeping with preempt-disabled in vhost_net_busy_poll()
    1d5e58905588 tipc: fix double-free in tipc_buf_append()
    671f743d2dd5 tcp: send a challenge ACK on SEG.ACK > SND.NXT
    b5992dbb3bc5 nfp: fix swapped arguments in nfp_encode_basic_qdr() calls
    1abf8c202caf virtio_net: sync rss_trailer.max_tx_vq on queue_pairs change via VQ_PAIRS_SET
    6af1736b5810 vsock/virtio: fix MSG_ZEROCOPY pinned-pages accounting
    c60545ffb920 net: mana: Fix EQ leak in mana_remove on NULL port
    fb9f98e1041a net: mana: Implement ndo_tx_timeout and serialize queue resets per port.
    2c345eb03d2f net: mana: Handle hardware recovery events when probing the device
    e0596009873e net: mana: Handle SKB if TX SGEs exceed hardware limit
    577441de1983 net: mana: Don't overwrite port probe error with add_adev result
    95e4598b6805 net: mana: Add standard counter rx_missed_errors
    8804f00ea028 net: mana: Move hardware counter stats from per-port to per-VF context
    a1ddfd2c0b7a net: mana: Guard mana_remove against double invocation
    8709d4457faf net: mana: Init link_change_work before potential error paths in probe
    5a90c4cfd8b7 net: airoha: Add size check for TX NAPIs in airoha_qdma_cleanup()
    d8ad264e9a01 net: airoha: Rework the code flow in airoha_remove() and in airoha_probe() error path
    4d4acfa348a1 net: airoha: Move ndesc initialization at end of airoha_qdma_init_rx_queue()
    b707f3109f1a net: dsa: realtek: rtl8365mb: fix mode mask calculation
    c0cfce4d7670 net: airoha: Add missing bits in airoha_qdma_cleanup_tx_queue()
    ad02cb61c52c net: airoha: Add the capability to consume out-of-order DMA tx descriptors
    b7c1bbf78b09 net: airoha: Add AN7583 SoC support
    8d913ab01419 net: airoha: Refactor src port configuration in airhoha_set_gdm2_loopback
    1a21910e32d7 net: airoha: ppe: Move PPE memory info in airoha_eth_soc_data struct
    56b99327a451 net: airoha: ppe: Dynamically allocate foe_check_time array in airoha_ppe struct
    ae68eb4f2fdd net/sched: sch_sfb: annotate data-races in sfb_dump_stats()
    910213de955e net/sched: sch_red: annotate data-races in red_dump_stats()
    1dbe52b6a0af net/sched: sch_fq_codel: remove data-races from fq_codel_dump_stats()
    796fb2037d85 net/sched: sch_pie: annotate data-races in pie_dump_stats()
    48de5f5f0f7b net_sched: sch_hhf: annotate data-races in hhf_dump_stats()
    7846f1e20f9a ice: fix ice_ptp_read_tx_hwtstamp_status_eth56g
    9fb0d0528177 ice: fix ready bitmap check for non-E822 devices
    77803e30cdd0 ice: perform PHY soft reset for E825C ports at initialization
    2496a593c6e3 ice: fix timestamp interrupt configuration for E825C
    91ce1bb6e419 net/rds: zero per-item info buffer before handing it to visitors
    1269a7d38577 bnge: remove unsupported backing store type
    a2b26c4ade3e bnge: fix initial HWRM sequence
    20e3b61e21c7 net: validate skb->napi_id in RX tracepoints
    2cc8a4db633b ksmbd: scope conn->binding slowpath to bound sessions only
    06f709d0e531 ksmbd: fix durable fd leak on ClientGUID mismatch in durable v2 open
    9c3936515a52 ksmbd: destroy async_ida in ksmbd_conn_free()
    6237cc0f7a4c ksmbd: destroy tree_conn_ida in ksmbd_session_destroy()
    9c59c79788e8 pwm: atmel-tcb: Cache clock rates and mark chip as atomic
    83cc775fc8fd arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt number
    3a6dfd9f2cdb arm64: dts: amlogic: meson-axg: Add missing cache information to cpu0
    86cf2eba2056 net/sched: sch_dualpi2: drain both C-queue and L-queue in dualpi2_change()
    0511ecb00e61 slip: bound decode() reads against the compressed packet length
    9e1ff0eead07 slip: reject VJ receive packets on instances with no rstate array
    79b90a96688e netfilter: nfnetlink_osf: fix potential NULL dereference in ttl check
    21883587593d netfilter: nfnetlink_osf: fix out-of-bounds read on option matching
    5b73746bd85f ipvs: fix MTU check for GSO packets in tunnel mode
    32fdd2e38e74 netfilter: nat: use kfree_rcu to release ops
    76160e04440c netfilter: xtables: restrict several matches to inet family
    8e3be0d12615 netfilter: conntrack: remove sprintf usage
    fb965b1cfe92 netfilter: nfnetlink_osf: fix divide-by-zero in OSF_WSS_MODULO
    6e9038e7b394 netfilter: nft_osf: restrict it to ipv4
    8d298ece6db7 net: airoha: Fix possible TX queue stall in airoha_qdma_tx_napi_poll()
    fa6e90bc443b openvswitch: cap upcall PID array size and pre-size vport replies
    d17830d050f7 net/mlx5: Fix HCA caps leak on notifier init failure
    0cab5d077dd1 pppoe: drop PFC frames
    70a089cc9590 sctp: fix OOB write to userspace in sctp_getsockopt_peer_auth_chunks
    7c66b368c6ff ipv6: fix possible UAF in icmpv6_rcv()
    d77baa6214b7 e1000e: Unroll PTP in probe error handling
    15c666a99626 iavf: fix wrong VLAN mask for legacy Rx descriptors L2TAG2
    3c29ddd46aba i40e: don't advertise IFF_SUPP_NOFCS
    3c5c3ac308a7 ice: fix ICE_AQ_LINK_SPEED_M for 200G
    7cb19ec8ac08 ice: fix double-free of tx_buf skb
    55500245ec04 ice: Remove jumbo_remove step from TX path
    05fd391f9065 ice: update PCS latency settings for E825 10G/25Gb modes
    722fcf831107 ice: fix 'adjust' timer programming for E830 devices
    1b579c2001d0 tcp: annotate data-races around tp->plb_rehash
    4d1ea8a2c6ac tcp: annotate data-races around (tp->write_seq - tp->snd_nxt)
    37f33454b284 tcp: annotate data-races around tp->timeout_rehash
    0edffaf11267 tcp: annotate data-races around tp->srtt_us
    cd6011dc4c33 tcp: better handle TCP_TX_DELAY on established flows
    3955bfec74ab tcp: annotate data-races around tp->reord_seen
    7fc9ef56acfe tcp: annotate data-races around tp->dsack_dups
    b20898430984 tcp: annotate data-races around tp->bytes_retrans
    d0ae38a0ee95 tcp: annotate data-races around tp->bytes_sent
    5987cec30473 tcp: add data-race annotations for TCP_NLA_SNDQ_SIZE
    4215a5c7b079 tcp: annotate data-races around tp->delivered and tp->delivered_ce
    d8068252f043 tcp: annotate data-races around tp->snd_ssthresh
    9bce4d9c6da1 tcp: add data-races annotations around tp->reordering, tp->snd_cwnd
    9eb93126c012 tcp: add data-race annotations around tp->data_segs_out and tp->total_retrans
    2962660dc75a tcp: annotate data-races in tcp_get_info_chrono_stats()
    c67c9032ce56 tcp: inline tcp_chrono_start()
    8e8a7c72a24f tcp: move tp->chrono_type next tp->chrono_stat[]
    ce2e164c1c51 ksmbd: fix use-after-free in smb2_open during durable reconnect
    ff3e8515c1d9 smb: move smb_version_values to common/smbglob.h
    37c8933064be net: enetc: fix NTMP DMA use-after-free issue
    1f379216ccc8 net: enetc: correct the command BD ring consumer index
    74d64ae4254e net: dsa: remove redundant netdev_lock_ops() from conduit ethtool ops
    4c078a699a8c net: dsa: append ethtool counters of all hidden ports to conduit
    87bbc2e86439 net: dsa: use kernel data types for ethtool ops on conduit
    f128f04a893d net: dsa: cpu_dp->orig_ethtool_ops might be NULL
    b73235da5dde net/sched: taprio: fix use-after-free in advance_sched() on schedule switch
    75b6c361f417 net: airoha: Wait for NPU PPE configuration to complete in airoha_ppe_offload_setup()
    613c8f4a5014 nexthop: fix IPv6 route referencing IPv4 nexthop
    7ad66185052d net/sched: sch_cake: fix NAT destination port not being updated in cake_update_flowkeys
    b6b7154e9f5d macvlan: fix macvlan_get_size() not reserving space for IFLA_MACVLAN_BC_CUTOFF
    7db3e4e03032 net/sched: act_mirred: fix wrong device for mac_header_xmit check in tcf_blockcast_redir
    7b5501a62214 pwm: stm32: Fix rounding issue for requests with inverted polarity
    ad5dc433b34e arm64: dts: marvell: armada-37xx: use 'usb2-phy' in USB3 controller's phy-names
    5b5f8ff0a2e8 arm64: dts: imx8mm-tqma8mqml: Correct PAD settings for PMIC_nINT
    8002eb9b60a6 arm64: dts: imx8mn-tqma8mqnl: Correct PAD settings for PMIC_nINT
    33d043815ccc arm64: dts: imx8mm-emtop-som: Correct PAD settings for PMIC_nINT
    cde69482d2e6 reset: amlogic: t7: Fix null reset ops
    4790bd29d626 PCMCIA: Fix garbled log messages for KERN_CONT
    9e8087ac4636 arm64: dts: imx8mp-data-modul-edm-sbc: Correct PAD settings for PMIC_nINT
    2b7db3e83f78 arm64: dts: imx8mp-dhcom-som: Correct PAD settings for PMIC_nINT
    d8d75e113532 arm64: dts: imx8mp-ultra-mach-sbc: Correct PAD settings for PMIC_nINT
    e754961b2655 arm64: dts: imx8mp-sr-som: Correct PAD settings for PMIC_nINT
    4ff0003fabd7 arm64: dts: imx8mp-nitrogen-som: Correct PAD settings for PMIC_nINT
    9011a6128935 arm64: dts: imx8mp-aristainetos3a-som-v1: Correct PAD settings for PMIC_nINT
    dde47488fb19 arm64: dts: imx8mp-edm-g: Correct PAD settings for PMIC_nINT
    91c150b3760d arm64: dts: imx8mp-icore-mx8mp: Correct PAD settings for PMIC_nINT
    3a958f45a676 arm64: dts: imx8mp-navqp: Correct PAD settings for PMIC_nINT
    e821e5e0c61b arm64: dts: imx8mp-debix-som-a: Correct PAD settings for PMIC_nINT
    4a259bb36702 arm64: dts: imx8mp-debix-model-a: Correct PAD settings for PMIC_nINT
    858e4d98a86a erofs: unify lcn as u64 for 32-bit platforms
    df9784bb5b63 crypto: ccp - copy IV using skcipher ivsize
    d05ebf0d3f8c crypto: sa2ul - Fix AEAD fallback algorithm names
    fc9310d79fdb crypto: eip93 - fix hmac setkey algo selection
    c6efc77954d8 virt: arm-cca-guest: fix error check for RSI_INCOMPLETE
    60a6842061b4 drm/i915/wm: Verify the correct plane DDB entry
    d0e877810baf f2fs: protect extension_list reading with sb_lock in f2fs_sbi_show()
    2b0ae4b59ff5 f2fs: allow empty mount string for Opt_usr|grp|projjquota
    1c5973c84ab4 clk: visconti: pll: initialize clk_init_data to zero
    cccefa34c09a clk: qcom: gcc-x1e80100: Keep GCC USB QTB clock always ON
    a841167c1ef7 f2fs: fix to preserve previous reserve_{blocks,node} value when remount
    ef72360aa88a f2fs: expand scalability of f2fs mount option
    480307ffa289 lib/hexdump: print_hex_dump_bytes() calls print_hex_dump_debug()
    3547f6b9a110 clk: qcom: gdsc: Fix error path on registration of multiple pm subdomains
    4623c251496b f2fs: avoid reading already updated pages during GC
    fa18659f883e f2fs: use f2fs_filemap_get_folio() instead of f2fs_pagecache_get_page()
    da99d0302d3c clk: spacemit: ccu_mix: fix inverted condition in ccu_mix_trigger_fc()
    16472129ffd7 clk: qcom: dispcc-sc7180: Add missing MDSS resets
    28e796ac0279 dt-bindings: clock: qcom,dispcc-sc7180: Define MDSS resets
    a0195eab4ed5 clk: xgene: Fix mapping leak in xgene_pllclk_init()
    558b2eb623f2 clk: qoriq: avoid format string warning
    074105928626 x86/um: fix vDSO installation
    0f548ecd2d78 x86/um/vdso: Drop VDSO64-y from Makefile
    b55d2128faf5 clk: imx8mq: Correct the CSI PHY sels
    e3d41039263d clk: imx: imx6q: Fix device node reference leak in of_assigned_ldb_sels()
    3cb3f533424b clk: imx: imx6q: Fix device node reference leak in pll6_bypassed()
    8ae85245632c clk: qcom: dispcc-sm8250: Enable parents for pixel clocks
    d7f633fc6e4d clk: qcom: dispcc-sm8250: Use shared ops on the mdss vsync clk
    d79e6ca14c55 clk: qcom: gcc-sc8180x: Use retention for PCIe power domains
    a263813276f9 clk: qcom: gcc-sc8180x: Use retention for USB power domains
    ed9ca2c4dc02 clk: qcom: gcc-sc8180x: Add missing GDSCs
    841d49517768 dt-bindings: clock: qcom,gcc-sc8180x: Add missing GDSCs
    a2fb7c42ab9b scsi: ufs: rockchip,rk3576-ufshc: dt-bindings: Add new mphy reset item
    51075df70c46 scsi: target: core: Fix integer overflow in UNMAP bounds check
    ac0411865e3e clk: renesas: r9a09g057: Remove entries for WDT{0,2,3}
    3c0a96358c13 clk: renesas: r9a09g057: Fix ordering of module clocks array
    21aae9f766a3 clk: renesas: r9a09g057: Add entries for RSCIs
    34e869e21080 clk: renesas: r9a09g057: Add clock and reset entries for RTC
    87534f2a3842 clk: qcom: dispcc[01]-sa8775p: Fix DSI byte clock rate setting
    b92a29da9f7e clk: qcom: dispcc-sm4450: Fix DSI byte clock rate setting
    b0015d7752af clk: qcom: dispcc-milos: Fix DSI byte clock rate setting
    0c7a14a3d580 clk: qcom: dispcc-glymur: Fix DSI byte clock rate setting
    6c87b3a371fa clk: qcom: dispcc-sc8280xp: remove CLK_SET_RATE_PARENT from byte_div_clk_src dividers
    1afd963fcd96 scsi: sg: Resolve soft lockup issue when opening /dev/sgX
    6a4ccbb9b40e scsi: sg: Fix sysctl sg-big-buff register during sg_init()
    b9ab6cf1c2ef clk: sunxi-ng: sun55i-a523-r: Add missing r-spi module clock
    e906a312ee06 clk: qcom: dispcc-sm8450: use RCG2 ops for DPTX1 AUX clock source
    89715e519ab7 clk: qcom: dispcc-glymur: use RCG2 ops for DPTX1 AUX clock source
    1e56e335bc86 clk: qcom: gcc-glymur: Add video axi clock resets for glymur
    927c8a511c2a dt-bindings: clock: qcom: Add GCC video axi reset clock for Glymur
    f2c7b39dde2e RDMA/core: Prefer NLA_NUL_STRING
    c5683ca4949a platform/x86: dell-wmi-sysman: bound enumeration string aggregation
    58688eeaa307 platform/x86: dell_rbu: avoid uninit value usage in packet_size_write()
    6136bbb054f7 fs/ntfs3: terminate the cached volume label after UTF-8 conversion
    c44ad02d591b tty: serial: ip22zilog: Fix section mispatch warning
    bfd3e5309503 platform/x86: asus-wmi: fix screenpad brightness range
    38a9aa192ef7 platform/x86: asus-wmi: adjust screenpad power/brightness handling
    4584229395d0 NFSD: fix nfs4_file access extra count in nfsd4_add_rdaccess_to_wrdeleg
    248e4b9cc719 nfs/blocklayout: Fix compilation error (`make W=1`) in bl_write_pagelist()
    ac8551a4254d mfd: mc13xxx-core: Fix memory leak in mc13xxx_add_subdevice_pdata()
    cc7716bd050b platform/x86: barco-p50-gpio: normalize return value of gpio_get
    e4a666652dae platform/x86: panasonic-laptop: Fix OPTD notifier registration and cleanup
    37a3d1b68277 usb: typec: ps883x: Fix Oops at unbind
    3104a3f40feb tty: hvc_iucv: fix off-by-one in number of supported devices
    19951118fb22 usb: typec: Fix error pointer dereference
    099494e4499d leds: lgm-sso: Remove duplicate assignments for priv->mmap
    34be68c52af8 platform/surface: surfacepro3_button: Drop wakeup source on remove
    834dece8ced2 backlight: sky81452-backlight: Check return value of devm_gpiod_get_optional() in sky81452_bl_parse_dt()
    7d88f2e1a972 i3c: mipi-i3c-hci: fix IBI payload length calculation for final status
    1c70c5b933e2 i3c: master: adi: Fix error propagation for CCCs
    b5a2893ce6fd i3c: dw: Fix memory leak in dw_i3c_master_i3c_xfers()
    1b6a7e94be67 i3c: master: renesas: Fix memory leak in renesas_i3c_i3c_xfers()
    c192859f2775 i3c: master: dw-i3c: Fix missing reset assertion in remove() callback
    b0cdbc690dae perf util: Kill die() prototype, dead for a long time
    e97cc0120390 perf maps: Fix copy_from that can break sorted by name order
    def6cd4271e7 perf maps: Fix fixup_overlap_and_insert that can break sorted by name order
    59a58ada259c pinctrl: sophgo: pinctrl-sg2044: Fix wrong module description
    c98c71ed8834 pinctrl: sophgo: pinctrl-sg2042: Fix wrong module description
    2db35db04c03 perf cgroup: Update metric leader in evlist__expand_cgroup
    e21bac135220 ipmi: ssif_bmc: change log level to dbg in irq callback
    ca4d0555000f ipmi: ssif_bmc: fix message desynchronization after truncated response
    3cce2a3f8f60 ipmi: ssif_bmc: fix missing check for copy_to_user() partial failure
    e62ac39eb2ce perf expr: Return -EINVAL for syntax error in expr__find_ids()
    131e9cb0b932 perf tools: Fix module symbol resolution for non-zero .text sh_addr
    7377e48f9ca8 memblock: reserve_mem: fix end caclulation in reserve_mem_release_by_name()
    3fb038e078ec perf stat: Fix opt->value type for parse_cache_level
    206ac6c702ca perf lock: Fix option value type in parse_max_stack
    509d342d02ff pinctrl: renesas: rzg2l: Fix save/restore of {IOLH,IEN,PUPD,SMT} registers
    71e13d4c1d77 pinctrl: abx500: Fix type of 'argument' variable
    bb548a3c26a1 pinctrl: realtek: Fix function signature for config argument
    6476aac13805 pinctrl: pinconf-generic: Fully validate 'pinmux' property
    be787fea6c66 perf: tools: cs-etm: Fix print issue for Coresight debug in ETE/TRBE trace
    9878e6ed7ec5 perf branch: Avoid incrementing NULL
    518ae2a82efe pinctrl: cy8c95x0: Avoid returning positive values to user space
    df50e63cdf15 pinctrl: cy8c95x0: Unify messages with help of dev_err_probe()
    815a7b8af68d pinctrl: cy8c95x0: remove duplicate error message
    dbfb30248dbe perf trace: Avoid an ERR_PTR in syscall_stats
    4d994ff45727 pinctrl: pinctrl-pic32: Fix resource leak
    dc3ece1d92e6 perf trace: Fix IS_ERR() vs NULL check bug
    02c06e764fe5 bpf, arm32: Reject BPF-to-BPF calls and callbacks in the JIT
    e15900888c09 bpf: Validate node_id in arena_alloc_pages()
    e8bd8274ae56 libbpf: Prevent double close and leak of btf objects
    8abad856e2a5 bpf: allow UTF-8 literals in bpf_bprintf_prepare()
    6982653ce5f1 bpf: Fix NULL deref in map_kptr_match_type for scalar regs
    5c04f89f9557 bpf: Fix precedence bug in convert_bpf_ld_abs alignment check
    921920c34cb5 bpf, sockmap: Take state lock for af_unix iter
    041eb6348d73 bpf, sockmap: Fix af_unix null-ptr-deref in proto update
    527057ebe807 bpf, sockmap: Fix af_unix iter deadlock
    77ad43af2642 bpf, riscv: Remove redundant bpf_flush_icache() after pack allocator finalize
    ca51684db023 bpf, arm64: Remove redundant bpf_flush_icache() after pack allocator finalize
    1a113b549729 bpf, arm64: Fix off-by-one in check_imm signed range check
    07793ce19221 ext4: fix possible null-ptr-deref in mbt_kunit_exit()
    c7abd0e6c874 HID: usbhid: fix deadlock in hid_post_reset()
    c3a6ee43246d mtd: spinand: winbond: Clarify when to enable the HS bit
    52aaa647b02d mtd: spinand: Give the bus interface to the configuration helper
    6a5f5c25fb1f mtd: spinand: Add support for setting a bus interface
    d4e22374b9b0 mtd: spinand: Gather all the bus interface steps in one single function
    a602b7efb876 mtd: spinand: winbond: Configure the IO mode after the dummy cycles
    a5d27efc8e4f mtd: spinand: winbond: Rename IO_MODE register macro
    729833537104 mtd: spinand: Create an array of operation templates
    d5de6d39a3bb mtd: spinand: Decouple write enable and write disable operations
    b5804b3ae4b8 mtd: spinand: Add missing check
    34e666a256de mtd: rawnand: sunxi: fix sunxi_nfc_hw_ecc_read_extra_oob
    84688b608f01 cxl/pci: Check memdev driver binding status in cxl_reset_done()
    5a282a6f8129 mtd: parsers: ofpart: call of_node_get() for dedicated subpartitions
    c92dc1b31a1d mtd: parsers: ofpart: call of_node_put() only in ofpart_fail path
    5549c3f88dd7 mtd: spi-nor: swp: check SR_TB flag when getting tb_mask
    53d7a4e1b041 mtd: spi-nor: update spi_nor_fixups::post_sfdp() documentation
    0173aca3e4b1 mtd: spi-nor: sfdp: introduce smpt_map_id fixup hook
    6278713f55d4 mtd: spi-nor: sfdp: introduce smpt_read_dummy fixup hook
    ad41b585f0e4 mtd: spi-nor: core: correct the op.dummy.nbytes when check read operations
    756afec88e85 dt-bindings: interrupt-controller: arm,gic-v3: Fix EPPI range
    b6766b171a5c ima_fs: Correctly create securityfs files for unsupported hash algos
    e4e0bd721b92 mtd: physmap_of_gemini: Fix disabled pinctrl state check
    fb9364ba4fa6 HID: asus: do not abort probe when not necessary
    59601f0e83d4 HID: asus: make asus_resume adhere to linux kernel coding standards
    148e4f7ece72 ima: check return value of crypto_shash_final() in boot aggregate
    5bfc58588ae0 remoteproc: imx_rproc: Check return value of regmap_attach_dev() in imx_rproc_mmio_detect_mode()
    28122fcd7bcc stop_machine: Fix the documentation for a NULL cpus argument
    405c94550c68 remoteproc: xlnx: Fix sram property parsing
    514f1eb75ffb hte: tegra194: remove Kconfig dependency on Tegra194 SoC
    0402c60abe76 tracing: Rebuild full_name on each hist_field_name() call
    d7338f4dde91 tracing: move __printf() attribute on __ftrace_vbprintk()
    2be24b87a474 tracing: move tracing declarations from kernel.h to a dedicated header
    d09b029f639c tracing: remove size parameter in __trace_puts()
    1e78af701976 soundwire: cadence: Clear message complete before signaling waiting thread
    8995ef2dbebc dmaengine: mxs-dma: Fix missing return value from of_dma_controller_register()
    4cafee50af44 soundwire: Intel: test bus.bpt_stream before assigning it
    03d56c4c3861 soundwire: bus: demote UNATTACHED state warnings to dev_dbg()
    8cedbb75f70e dmaengine: dw-axi-dmac: Remove unnecessary return statement from void function
    aed87e866d1a ocfs2: validate group add input before caching
    4c2d62ddde89 ocfs2: validate bg_bits during freefrag scan
    2685df8577a3 ocfs2: fix listxattr handling when the buffer is full
    a28f56988c8e fwctl: Fix class init ordering to avoid NULL pointer dereference on device removal
    a3879c708a60 firmware: arm_ffa: Use the correct buffer size during RXTX_MAP
    28a547af4432 ARM: dts: imx27-eukrea: replace interrupts with interrupts-extended
    6eab9741965b lib: kunit_iov_iter: fix memory leaks
    3bf5e19c804d slab: Introduce kmalloc_obj() and family
    9777d7e6fc58 arm64/xor: fix conflicting attributes for xor_block_template
    8f466be889a2 ARM: OMAP1: Fix DEBUG_LL and earlyprintk on OMAP16XX
    42fbb173e855 arm64: dts: qcom: sm8250: Add missing CPU7 3.09GHz OPP
    9dd9d748c5a0 soc: qcom: aoss: compare against normalized cooling state
    611d9e46bdc6 soc: qcom: llcc: fix v1 SB syndrome register offset
    1fb7f356547d ocfs2/dlm: fix off-by-one in dlm_match_regions() region comparison
    3f474c33ebc2 ocfs2/dlm: validate qr_numregions in dlm_match_regions()
    a261fccdb4ac unshare: fix nsproxy leak in ksys_unshare() on set_cred_ucounts() failure
    c892d0d4fe5e soc/tegra: cbb: Fix cross-fabric target timeout lookup
    f46870b451f7 soc/tegra: cbb: Fix incorrect ARRAY_SIZE in fabric lookup tables
    9dc2462a7595 soc/tegra: cbb: Set ERD on resume for err interrupt
    aabc9baae9a7 arm64: dts: imx8qxp-mek: switch Type-C connector power-role to dual
    bf9a33944d7d arm64: dts: imx8qm-mek: switch Type-C connector power-role to dual
    3341ca45d280 arm64: dts: lx2160a: complete pinmux for rcwsr12 configuration word
    857dbf1f51fe arm64: dts: lx2160a: change zeros to hexadecimal in pinmux nodes
    e77a86d883b5 arm64: dts: lx2160a: add sda gpio references for i2c bus recovery
    ce85b22e556a arm64: dts: lx2160a: rename pinmux nodes for readability
    b165c477175b arm64: dts: lx2160a: remove duplicate pinmux nodes
    69f4d9ce27d8 arm64: dts: lx2160a: change i2c0 (iic1) pinmux mask to one bit
    5f2ca479f0f3 arm64: dts: imx8dxl-evk: Use audio-graph-card2 for wm8960-2 and wm8960-3
    7fedcbedec65 arm64: dts: imx8mp-kontron: Fix boot order for PMIC and RTC
    85163323ab36 arm64: dts: freescale: imx8mp-tqma8mpql-mba8mp-ras314: fix UART1 RTS/CTS muxing
    4675ae61aa63 arm64: dts: ti: k3-am62-verdin: Fix SPI_1 GPIO CS pinctrl label
    45669e3578ac arm64: dts: ti: k3-am62-lp-sk: Enable internal pulls for MMC0 data pins
    5f852e9baea0 arm64: dts: ti: k3-am62p5-sk: Disable MMC1 internal pulls on data pins
    8caadf4fef50 arm64: dts: qcom: msm8917-xiaomi-riva: Fix board-id for all bootloader
    bf30d3790340 arm64: dts: qcom: sdm845-xiaomi-beryllium: Mark l1a regulator as powered during boot
    7f8365e8ff82 arm64: dts: qcom: sm7225-fairphone-fp4: Fix conflicting bias pinctrl
    1327f28e4775 arm64: dts: qcom: sm8650: Enable UHS-I SDR50 and SDR104 SD card modes
    3578d41b7ef0 arm64: dts: qcom: sm8550: Enable UHS-I SDR50 and SDR104 SD card modes
    2ea7bfce0024 arm64: dts: qcom: sm8450: Enable UHS-I SDR50 and SDR104 SD card modes
    6360bcaf5727 arm64: dts: qcom: hamoa: Fix xo clock supply of platform SD host controller
    168ec540bdfd arm64: dts: qcom: sm8650: Fix xo clock supply of SD host controller
    cd2894362390 arm64: dts: qcom: sm8550: Fix xo clock supply of platform SD host controller
    c1b5e85c88fb arm64: dts: qcom: sm8750: Fix GIC_ITS range length
    000d5533f451 arm64: dts: qcom: sm8650: Fix GIC_ITS range length
    6670dc96864b arm64: dts: qcom: sm8550: Fix GIC_ITS range length
    1de0b109aaa7 arm64: dts: qcom: sm8450: Fix GIC_ITS range length
    3bb7be86f4c0 arm64: dts: qcom: sm8650: correct Iris corners for the MXC rail
    16771dd53aa9 arm64: dts: qcom: sm8550: correct Iris corners for the MXC rail
    14ec98366e30 arm64: dts: qcom: monaco: correct Iris corners for the MXC rail
    e589b6c38265 arm64: dts: qcom: lemans: correct Iris corners for the MXC rail
    c0040375fec7 arm64: dts: qcom: hamoa: correct Iris corners for the MXC rail
    8344cd62b825 bus: rifsc: fix RIF configuration check for peripherals
    8bfa413a1bd8 arm64: dts: rockchip: Add mphy reset to ufshc node
    835d16955dd7 arm64: dts: rockchip: Fix RK3562 EVB2 model name
    2fea83507b4c soc: qcom: ocmem: return -EPROBE_DEFER is ocmem is not available
    c10e14863b62 soc: qcom: ocmem: register reasons for probe deferrals
    702ee8e9821b soc: qcom: ocmem: make the core clock optional
    99eb1df4acd4 arm64: dts: rockchip: Correct Joystick Axes on Gameforce Ace
    fd16a9e05b48 arm64: dts: rockchip: Correct Fan Supply for Gameforce Ace
    6db6534abfe1 Revert "arm64: dts: rockchip: add SPDIF audio to Beelink A1"
    31d145a54f16 arm64: dts: rockchip: Fix Bluetooth stability on LCKFB TaiShan Pi
    2fda9b3776e0 arm64: dts: qcom: msm8953-xiaomi-daisy: fix backlight
    151c29b6952c arm64: dts: qcom: msm8953-xiaomi-vince: correct wled ovp value
    1ab2769df3de arm64: dts: imx8mp-hummingboard-pulse: fix mini-hdmi dsi port reference
    6c5178dd6036 arm64: dts: imx8mp-kontron: Drop vmmc-supply to fix SD card on SMARC eval carrier
    7e6420179e21 arm64: dts: imx8mp-kontron: Fix touch reset configuration on DL devices
    a5f56ff8573f iommufd/selftest: Fix page leaks in mock_viommu_{init,destroy}
    d02f10e74fe2 arm64: dts: mediatek: mt7986a: Fix gpio-ranges pin count
    1cda0e4ef9c4 arm64: dts: mediatek: mt7981b: Fix gpio-ranges pin count
    1a94d799de9e arm64: dts: mediatek: mt6795: Fix gpio-ranges pin count
    a2475c0a2bbb arm64: dts: qcom: talos: Add missing clock-names to GCC
    c4620dad9f1b arm64: dts: qcom: sm6125-xiaomi-ginkgo: Fix reserved gpio ranges
    449023f22c11 arm64: dts: qcom: sm6125-xiaomi-ginkgo: Remove extcon
    e849632c0988 arm64: dts: qcom: sm6125-xiaomi-ginkgo: Correct reserved memory ranges
    6256ef55fe90 arm64: dts: qcom: sm6125-xiaomi-ginkgo: Remove board-id
    4e3f607c3b99 arm64: dts: qcom: sm6125-ginkgo: Fix missing msm-id subtype
    643af7b85459 iommufd: vfio compatibility extension check for noiommu mode
    982b56bf7c7d arm64: dts: imx8mp-evk: Enable pull select bit for PCIe regulator GPIO (M.2 W_DISABLE1)
    8e7ff76becce arm64: dts: rockchip: Make Jaguar PCIe-refclk pin use pull-up config
    e483129ae513 arm64: dts: imx91-11x11-evk: change usdhc tuning step for eMMC and SD
    a028d9919f46 arm64: dts: imx8-apalis: Fix LEDs name collision
    86b77735cb4c memory: tegra30-emc: Fix dll_change check
    1793249c067a memory: tegra124-emc: Fix dll_change check
    6dd527eb8b70 ARM: dts: mediatek: mt7623: fix efuse fallback compatible
    e2b1e633257e arm64: dts: mediatek: mt8365: Describe infracfg-nao as a pure syscon
    7164b3953cef ksmbd: fix use-after-free from async crypto on Qualcomm crypto engine
    e0e6b14995fd efi/capsule-loader: fix incorrect sizeof in phys array reallocation
    d8ffae016c4a gfs2: prevent NULL pointer dereference during unmount
    49d9be0722da gfs2: add some missing log locking
    3f90bfd31f16 vfio: unhide vdev->debug_root
    fdd424d7c356 quota: Fix race of dquot_scan_active() with quota deactivation
    d05d4a6ee877 gfs2: less aggressive low-memory log flushing
    2c57d6c0afcd rtla/utils: Fix resource leak in set_comm_sched_attr()
    6a815bb366c9 rtla: Replace atoi() with a robust strtoi()
    dac3f0a68ec2 rtla: Fix -C/--cgroup interface
    0a7a4ab3be8e ktest: Run POST_KTEST hooks on failure and cancellation
    9b798ad99692 ktest: Honor empty per-test option overrides
    f68e24b9697a ktest: Avoid undef warning when WARNINGS_FILE is unset
    14dee7a3441f fanotify: call fanotify_events_supported() before path_permission() and security_path_notify()
    27c95204b518 fanotify: avoid/silence premature LSM capability checks
    0d19bce16932 gfs2: Call unlock_new_inode before d_instantiate
    ac25916e75ca ALSA: hda/realtek - fixed speaker no sound update
    457369880110 ALSA: usb-audio: Exclude Scarlett 18i20 1st Gen from SKIP_IFACE_SETUP
    ff734dbd9e24 crypto: jitterentropy - replace long-held spinlock with mutex
    3ab9ab2dc188 sched_ext: Fix ops.cgroup_move() invocation kf_mask and rq tracking
    b60a90bf7cde sched_ext: Track @p's rq lock across set_cpus_allowed_scx -> ops.set_cpumask
    9769c143015c dm cache: fix missing return in invalidate_committed's error path
    9a0f6c048554 ALSA: sc6000: Keep the programmed board state in card-private data
    e0b049bd7b27 spi: mtk-snfi: unregister ECC engine on probe failure and remove() callback
    b059a41bdd5b PCI: tegra194: Fix CBB timeout caused by DBI access before core power-on
    4e7a00aeb091 PCI: tegra194: Disable L1.2 capability of Tegra234 EP
    2914977cb75e PCI: tegra194: Remove unnecessary L1SS disable code
    9daf2a8d9cc1 PCI: dwc: Apply ECRC workaround to DesignWare 5.00a as well
    5cb649c27024 PCI: tegra194: Use DWC IP core version
    1e877168b0e7 PCI: tegra194: Free up Endpoint resources during remove()
    e697ea9ecdeb PCI: tegra194: Allow system suspend when the Endpoint link is not up
    849068f0129c PCI: tegra194: Set LTR message request before PCIe link up in Endpoint mode
    e463beb1e130 PCI: tegra194: Disable direct speed change for Endpoint mode
    f4556f70f00a PCI: tegra194: Use devm_gpiod_get_optional() to parse "nvidia,refclk-select"
    89b7185833db PCI: tegra194: Disable PERST# IRQ only in Endpoint mode
    871d9a6bf21b PCI: tegra194: Don't force the device into the D0 state before L2
    fb08535d374c PCI: tegra194: Disable LTSSM after transition to Detect on surprise link down
    8626b64c37c9 PCI: tegra194: Increase LTSSM poll time on surprise link down
    f38e0c5f377a PCI: tegra194: Fix polling delay for L2 state
    feac3db37d14 ALSA: usb-audio: qcom: Fix incorrect type in enable_audio_stream
    19ad2384ce5e PCI/NPEM: Set LED_HW_PLUGGABLE for hotplug-capable ports
    989ccfcc920e ASoC: SOF: compress: return the configured codec from get_params
    12d76d99e845 ALSA: scarlett2: Add missing sentinel initializer field
    2fdb6c1e743d selftest: memcg: skip memcg_sock test if address family not supported
    0619073fd082 Documentation: fix a hugetlbfs reservation statement
    fc1ca4f0d6be kho: make debugfs interface optional
    43106160a00b selftests/mm: skip migration tests if NUMA is unavailable
    fa123b901eb6 gpu: nova-core: bitfield: fix broken Default implementation
    af46044d1671 gpu: nova-core: bitfield: Move bitfield-specific code from register! into new macro
    e6b0e1f74d35 gpu: nova-core: register: use field type for Into implementation
    0a2d60edc3e5 PCI: mediatek-gen3: Prevent leaking IRQ domains when IRQ not found
    db805e9399c8 PCI: Enable AtomicOps only if Root Port supports them
    134c61925e9e ASoC: rsnd: Fix potential out-of-bounds access of component_dais[]
    254091c91767 crypto: qat - use swab32 macro
    8d77cf260535 crypto: iaa - fix per-node CPU counter reset in rebalance_wq_table()
    52906bb0f636 crypto: qat - fix type mismatch in RAS sysfs show functions
    684bd5404f9c crypto: qat - fix compression instance leak
    06b30beb9104 crypto: qat - disable 420xx AE cluster when lead engine is fused off
    6aef8e6fdf4d crypto: qat - disable 4xxx AE cluster when lead engine is fused off
    44faf7ea013c PCI: dwc: Fix type mismatch for kstrtou32_from_user() return value
    a1a24d4b8c96 ASoC: qcom: qdsp6: topology: check widget type before accessing data
    9f0632b0d424 iommu/riscv: Remove overflows on the invalidation path
    20b3c566e270 iommu/amd: Fix clone_alias() to use the original device's devid
    715d7b1e1af8 ASoC: fsl_easrc: Change the type for iec958 channel status controls
    9f8304abcd7e ASoC: fsl_easrc: Fix value type in fsl_easrc_iec958_get_bits()
    cbf3693ddf5a ASoC: fsl_easrc: Check the variable range in fsl_easrc_iec958_put_bits()
    15ff6da3e9bd ASoC: fsl_xcvr: Fix event generation in fsl_xcvr_mode_put()
    4ab351b4b785 ASoC: fsl_xcvr: Fix event generation in fsl_xcvr_arc_mode_put()
    4095fa1c8ed9 ASoC: fsl_micfil: Fix event generation in micfil_quality_set()
    fe6e720bf2a0 ASoC: fsl_micfil: Fix event generation in micfil_put_dc_remover_state()
    79acc3ea6fb6 ASoC: fsl_micfil: Fix event generation in hwvad_put_init_mode()
    891c51e19d3a ASoC: fsl_micfil: Fix event generation in hwvad_put_enable()
    2a6a72a0beab ASoC: fsl_micfil: Add access property for "VAD Detected"
    1140626eb6f5 drm/msm/dpu: drop INTF_0 on MSM8953
    507cc9ab1e8c PM: domains: De-constify fields in struct dev_pm_domain_attach_data
    2ba2e8ce483c pmdomain: imx: scu-pd: Fix device_node reference leak during ->probe()
    2d9cb1f588ce pmdomain: ti: omap_prm: Fix a reference leak on device node
    9232d70f98cd ALSA: hda/cmedia: Remove duplicate pin configuration parsing
    70f694e0bb87 drm/msm/a6xx: Use barriers while updating HFI Q headers
    4180d90a4054 drm/msm/a6xx: Fix dumping A650+ debugbus blocks
    279fde87aa70 drm/msm/shrinker: Fix can_block() logic
    6a83ea4da004 drm/msm/a6xx: Fix HLSQ register dumping
    206f812ef140 drm/msm: Fix VM_BIND UNMAP locking
    8cf18974284f drm/msm: Reject fb creation from _NO_SHARE objs
    30b8a3f88c59 drm/msm/vma: Avoid lock in VM_BIND fence signaling path
    d0b28251ca44 ASoC: SOF: Intel: hda: Place check before dereference
    c87f914822c2 ALSA: hda/realtek: fix code style (ERROR: else should follow close brace '}')
    f329dccceb76 hwmon: (aspeed-g6-pwm-tach): remove redundant driver remove callback
    06fed91296f8 PCI/DPC: Log AER error info for DPC/EDR uncorrectable errors
    0a84e210daec drm/amdgpu/uvd4.2: Don't initialize UVD 4.2 when DPM is disabled
    2381d4c5cc1e drm/amd/pm/smu7: Add SCLK cap for quirky Hawaii board
    c140492d0bbe drm/amd/pm/ci: Fill DW8 fields from SMC
    1de9639b50db drm/amd/pm/ci: Clear EnabledForActivity field for memory levels
    9d92707b43f7 drm/amd/pm/ci: Fix powertune defaults for Hawaii 0x67B0
    432fdc0141b5 drm/amd/pm/smu7: Fix SMU7 voltage dependency on display clock
    c829b4633041 drm/amd/pm/ci: Disable MCLK DPM on problematic CI ASICs
    21e8dd9906bf drm/amd/pm/ci: Use highest MCLK on CI when MCLK DPM is disabled
    67e582c86ab1 ASoC: amd: acp: update dmic_num logic for acp pdm dmic
    edfa91bb652e ALSA: core: Validate compress device numbers without dynamic minors
    3c349995e51e iommu/riscv: Fix signedness bug
    e3fae61f4799 iommu/riscv: Skip IRQ count check when using MSI interrupts
    ccd4c3e5c907 PCI: Fix alignment calculation for resource size larger than align
    b375c3c7209c crypto: hisilicon/sec2 - prevent req used-after-free for sec
    2d18cf09f2b0 PCI: Fix premature removal from realloc_head list during resource assignment
    34678c978888 PCI: Use res_to_dev_res() in reassign_resources_sorted()
    f176c47683bf PCI: qcom: Advertise Hotplug Slot Capability with no Command Completion support
    cd3938c12bda drm/panel: simple: Correct G190EAN01 prepare timing
    31b2d7be7540 drm/panel: sharp-ls043t1le01: make use of prepare_prev_first
    131e01ba249f ASoC: rockchip: rockchip_sai: Set slot width for non-TDM mode
    9c47a36ceaf0 drm/msm/dsi: rename MSM8998 DSI version from V2_2_0 to V2_0_0
    a303f8863c97 drm/msm/dsi: fix hdisplay calculation for CMD mode panel
    e82ef4ef320c drm/msm/dsi: fix bits_per_pclk
    94e021272c45 drm/msm/dpu: don't try using 2 LMs if only one DSC is available
    acde37cb798d drm/msm/dsi: add the missing parameter description
    0f7dd5839cfa drm/msm/dpu: fix mismatch between power and frequency
    c7d586c6348d drm/msm: add missing MODULE_DEVICE_ID definitions
    3441e4b70cf9 iommu/tegra241-cmdqv: Update uAPI to clarify HYP_OWN requirement
    86c8d5cdadd9 iommu/tegra241-cmdqv: Set supports_cmd op in tegra241_vcmdq_hw_init()
    3a8d94405fd5 drm/imagination: Switch reset_reason fields from enum to u32
    3d0ef0567d21 spi: hisi-kunpeng: prevent infinite while() loop in hisi_spi_flush_fifo
    eae672a7ec8a drm/amdgpu/gfx11: look at the right prop for gfx queue priority
    0cd9d5878b3c drm/amdgpu/gfx10: look at the right prop for gfx queue priority
    db201e6fab1e PCI: dwc: rcar-gen4: Change EPC BAR alignment to 4K as per the documentation
    5a9f29a3e076 padata: Put CPU offline callback in ONLINE section to allow failure
    8e26246dc104 padata: Remove cpu online check from cpu add and removal
    3ffcd6c5dca9 crypto: atmel-aes - guard unregister on error in atmel_aes_register_algs
    f4b747f0755e crypto: atmel - Use unregister_{aeads,ahashes,skciphers}
    9458a6513fe7 crypto: tegra - Disable softirqs before finalizing request
    4a894ba48fa5 fbdev: matroxfb: Mark variable with __maybe_unused to avoid W=1 build break
    57a1079af3ee dm init: ensure device probing has finished in dm-mod.waitfor=
    c695257f6b8d drm/amdgpu: Add default case in DVI mode validation
    0d3b392b0f2c iommu/riscv: Stop polling when CQCSR reports an error
    380698b43f07 iommu/riscv: Add missing GENERIC_MSI_IRQ
    3f917d9bff68 iommu/riscv: Add IOTINVAL after updating DDT/PDT entries
    b6263eb2b188 crypto: inside-secure/eip93 - register hash before authenc algorithms
    4ad705f5e889 drm/sun4i: Fix resource leaks
    555eb897a455 drm/v3d: Handle error from drm_sched_entity_init()
    cb54064705ad selftests/sched_ext: Add missing error check for exit__load()
    75849e13e428 drm/amd/pm: Fix xgmi max speed reporting
    9b614ddf3185 media: i2c: og01a1b: Fix V4L2 subdevice data initialization on probe
    1de12fc4b943 spi: fsl-qspi: Use reinit_completion() for repeated operations
    c1c2871f3336 spi: nxp-fspi: Use reinit_completion() for repeated operations
    d7b0489d9955 drm/bridge: cadence: cdns-mhdp8546-core: Handle HDCP state in bridge atomic check
    1a9bef10f894 drm/bridge: cadence: cdns-mhdp8546-core: Add mode_valid hook to drm_bridge_funcs
    cf2ac2cac8b3 drm/bridge: cadence: cdns-mhdp8546-core: Set the mhdp connector earlier in atomic_enable()
    3149c4f7f26f iopoll: fix function parameter names in read_poll_timeout_atomic()
    b455903eed45 dm log: fix out-of-bounds write due to region_count overflow
    322a3b70368d dm cache metadata: fix memory leak on metadata abort retry
    a3c61bd4e943 PCI: dwc: Perform cleanup in the error path of dw_pcie_resume_noirq()
    104a6e53484e PCI: dwc: Invoke post_init in dw_pcie_resume_noirq()
    a763a53d648d PCI: dwc: ep: Fix MSI-X Table Size configuration in dw_pcie_ep_set_msix()
    b7ed10f2d8b5 platform/chrome: chromeos_tbmc: Drop wakeup source on remove
    7f3e53990ad3 dm-mpath: don't stop probing paths at presuspend
    21c503d60a25 dm cache: fix dirty mapping checking in passthrough mode switching
    cb8b250b4277 dm cache: fix concurrent write failure in passthrough mode
    c348ae47d8e6 dm cache policy smq: fix missing locks in invalidating cache blocks
    b8ace9e96983 dm cache: fix write hang in passthrough mode
    788ac6c94d04 dm cache: fix write path cache coherency in passthrough mode
    25dcc1989c19 dm cache: fix null-deref with concurrent writes in passthrough mode
    a3f3c332882c ASoC: sti: use managed regmap_field allocations
    17584bdc7247 ASoC: sti: Return errors from regmap_field_alloc()
    7ed07c9ce525 crypto: inside-secure/eip93 - fix register definition
    1f2e41bd668f ASoC: SDCA: Update counting of SU/GE DAPM routes
    36a0dcd0077b PCI: imx6: Fix device node reference leak in imx_pcie_probe()
    47038159c559 drm/sun4i: backend: fix error pointer dereference
    175717cfc06c PCI: endpoint: pci-ep-msi: Fix error unwind and prevent double alloc
    b13984f0212f PCI: endpoint: pci-epf-test: Don't free doorbell IRQ unless requested
    511c093d9ef4 PCI/TPH: Allow TPH enable for RCiEPs
    e14de2cb819f ASoC: soc-compress: use function to clear symmetric params
    1f7687123d38 drm/virtio: Allow importing prime buffers when 3D is enabled
    fe1f80f8f6e8 drm/komeda: fix integer overflow in AFBC framebuffer size check
    60a90d853fca selftests/futex: Fix incorrect result reporting of futex_requeue test item
    f98084d97864 net: airoha: Add missing PPE configurations in airoha_ppe_hw_init()
    7bad93e99737 net, bpf: fix null-ptr-deref in xdp_master_redirect() for down master
    6a7139084973 sctp: fix missing encap_port propagation for GSO fragments
    c5a1cb8ff82b tcp: Don't set treq->req_usec_ts in cookie_tcp_reqsk_init().
    81cfd603c0bd udp: Force compute_score to always inline
    1218bfe2ad6f net: phy: qcom: at803x: Use the correct bit to disable extended next page
    b28b3bd9c42f Bluetooth: SCO: check for codecs->num_codecs == 1 before assigning to sco_pi(sk)->codec
    dc89961b76f1 Bluetooth: l2cap: Add missing chan lock in l2cap_ecred_reconf_rsp
    385b2d0468a0 Bluetooth: fix locking in hci_conn_request_evt() with HCI_PROTO_DEFER
    3daa5818e473 Bluetooth: hci_ldisc: Clear HCI_UART_PROTO_INIT on error
    4ae187c7915d Bluetooth: L2CAP: Fix printing wrong information if SDU length exceeds MTU
    8042240412de bpf: reject short IPv4/IPv6 inputs in bpf_prog_test_run_skb
    afdc8516213e net/mlx5e: IPsec, fix ASO poll timeout with read_poll_timeout_atomic()
    ef6d5a068811 net/mlx5e: Fix features not applied during netdev registration
    15a9928f8a93 net: phy: fix a return path in get_phy_c45_ids()
    d7637c455a92 dt-bindings: net: dsa: nxp,sja1105: make spi-cpol optional for sja1110
    a3be96c7b1e5 net: ipa: Fix decoding EV_PER_EE for IPA v5.0+
    65c7f0bf8ca3 net: ipa: Fix programming of QTIME_TIMESTAMP_CFG
    5013be175c7f ppp: require CAP_NET_ADMIN in target netns for unattached ioctls
    6086079e6d1c bpf: Fix OOB in pcpu_init_value
    a7494479757d net/rds: Restrict use of RDS/IB to the initial network namespace
    d3f880a6eb44 net/rds: Optimize rds_ib_laddr_check
    bc678fa87552 selftests/bpf: Fix reg_bounds to match new tnum-based refinement
    cddf2bde8420 bpf: Allow instructions with arena source and non-arena dest registers
    9d51c86355d9 net: airoha: Add missing RX_CPU_IDX() configuration in airoha_qdma_cleanup_rx_queue()
    3ddf6523957a net: mana: Move current_speed debugfs file to mana_init_port()
    90ebf3e9c12f net: mana: Support HW link state events
    34dbd7b81954 net: mana: Use pci_name() for debugfs directory naming
    64daf391198c selftests: netfilter: nft_tproxy.sh: adjust to socat changes
    4c727c6967a4 net/sched: act_ct: Only release RCU read lock after ct_ft
    8e1387216d66 selftests/bpf: fix __jited_unpriv tag name
    691adf738817 bpf: Enforce regsafe base id consistency for BPF_ADD_CONST scalars
    adaee08e711b bpf: Relax scalar id equivalence for state pruning
    0df9abbb138f net: airoha: Fix FE_PSE_BUF_SET configuration if PPE2 is available
    83d6371570ba net: airoha: Generalize airoha_ppe2_is_enabled routine
    4ea17f5e5126 net: airoha: Add airoha_eth_soc_data struct
    ae1b40d3abc1 net: airoha: Add airoha_ppe_get_num_stats_entries() and airoha_ppe_get_num_total_stats_entries()
    987af7625ceb net: hamradio: 6pack: fix uninit-value in sixpack_receive_buf
    e1ed678855e3 bpf: Fix RCU stall in bpf_fd_array_map_clear()
    592226d13837 bpf: return VMA snapshot from task_vma iterator
    3745834cf761 bpf: switch task_vma iterator from mmap_lock to per-VMA locks
    d0862de7c866 bpf: fix mm lifecycle in open-coded task_vma iterator
    b79d567fbc53 netfilter: nft_fwd_netdev: check ttl/hl before forwarding
    35a38df4085b netfilter: xt_socket: enable defrag after all other checks
    b9ee2c6c0761 eth: fbnic: Use wake instead of start
    6d28910c5194 net: airoha: Add dma_rmb() and READ_ONCE() in airoha_qdma_rx_process()
    c270e2bec3e5 net: bcmgenet: fix racing timeout handler
    25ff3a3e47ea net: bcmgenet: fix leaking free_bds
    4cab761fc51c net: bcmgenet: fix off-by-one in bcmgenet_put_txcb
    0d8726af877e macsec: Support VLAN-filtering lower devices
    f33fb701ab7e arm64: kexec: Remove duplicate allocation for trans_pgd
    bcfdf159d128 ACPI: AGDI: fix missing newline in error message
    73ae96e2be4e arm64: entry: Don't preempt with SError or Debug masked
    d88e8e4a3b52 bpf: Fix linked reg delta tracking when src_reg == dst_reg
    9f88b29b79a0 bpf: Support negative offsets, BPF_SUB, and alu32 for linked register tracking
    254633506626 wifi: ath10k: fix station lookup failure during disconnect
    76f2ebaf79a9 bpf: reject negative CO-RE accessor indices in bpf_core_parse_spec()
    281f2a214565 bpf: Drop task_to_inode and inet_conn_established from lsm sleepable hooks
    a9937a3ac585 wifi: mac80211: handle VHT EXT NSS in ieee80211_determine_our_sta_mode()
    cbea71b44803 wifi: brcmfmac: Fix error pointer dereference
    a710df104abb net: ethernet: ti-cpsw: fix linking built-in code to modules
    2bbe3d5c9353 net: ethernet: ti-cpsw:: rename soft_reset() function
    059525cf18e6 bpf: Fix stale offload->prog pointer after constant blinding
    32ce55d42439 bpf: fix end-of-list detection in cgroup_storage_get_next_key()
    d3d3d2791c59 macvlan: annotate data-races around port->bc_queue_len_used
    b312cf41b9e4 bpf: Fix abuse of kprobe_write_ctx via freplace
    d41508adff01 selftests/powerpc: Suppress -Wmaybe-uninitialized with GCC 15
    9103787054c6 powerpc/crash: Update backup region offset in elfcorehdr on memory hotplug
    eef879190a1f powerpc/crash: fix backup region offset update to elfcorehdr
    50c601805fe3 r8152: fix incorrect register write to USB_UPHY_XTAL
    ae5f83c0809f drivers/vfio_pci_core: Change PXD_ORDER check from switch case to if/else block
    fa3b3e43e883 vfio: refactor vfio_pci_mmap_huge_fault function
    6b9694702c37 wifi: rtw89: phy: fix uninitialized variable access in rtw89_phy_cfo_set_crystal_cap()
    97757d231bc6 bpf,arc_jit: Fix missing newline in pr_err messages
    1391ecf3a99a bpf: Fix variable length stack write over spilled pointers
    d4c4bd231eba bpf: Use RCU-safe iteration in dev_map_redirect_multi() SKB path
    0b69217310ee bpf: Fix refcount check in check_struct_ops_btf_id()
    a1a8a8bdfa21 wifi: mt76: mt7996: fix RRO EMU configuration
    dc34c01521bf wifi: mt76: support upgrading passive scans to active
    a2cde15af378 wifi: mt76: fix multi-radio on-channel scanning
    98e0118ab51c wifi: mt76: mt7996: Decrement sta counter removing the link in mt7996_mac_reset_sta_iter()
    e54c6440114d wifi: mt76: mt7996: Switch to the secondary link if the default one is removed
    d6f6b3a65660 wifi: mt76: mt7996: use correct link_id when filling TXD and TXP
    5a3353b06387 wifi: mt76: mt7996: Remove link pointer dependency in mt7996_mac_sta_remove_links()
    7da35e2d2fb7 wifi: mt76: mt7996: Add missing CHANCTX_STA_CSA property
    1e0f3e5e2835 wifi: mt76: mt7921: fix 6GHz regulatory update on connection
    aa4a31cd89f4 wifi: mt76: mt7996: fix use-after-free bugs in mt7996_mac_dump_work()
    6b7cbb13c838 wifi: mt76: mt7915: fix use-after-free bugs in mt7915_mac_dump_work()
    419babee9b5c wifi: mt76: mt7996: fix struct mt7996_mcu_uni_event
    ae94ef093a15 wifi: mt76: mt7996: fix wrong DMAD length when using MAC TXP
    612bfcfdb993 arm64: cpufeature: Make PMUVer and PerfMon unsigned
    5fc8c5d45e44 wifi: mt76: fix deadlock in remain-on-channel
    35180c772f5e wifi: mt76: mt7921: fix potential deadlock in mt7921_roc_abort_sync
    153bcba36c87 wifi: mt76: mt7925: fix potential deadlock in mt7925_roc_abort_sync
    e125def8b380 wifi: mt76: mt7925: drop puncturing handling from BSS change path
    a1a59bd3cd1e wifi: mt76: mt7925: cqm rssi low/high event notify
    dcbc13d19bef wifi: mt76: Fix memory leak destroying device
    35835ff71e6e wifi: mt76: mt7921: Place upper limit on station AID
    e00c27608536 wifi: mt76: mt7996: fix FCS error flag check in RX descriptor
    815db7fd57aa wifi: mt76: mt7925: prevent NULL vif dereference in mt7925_mac_write_txwi
    93d0694fb56d wifi: mt76: mt7925: prevent NULL pointer dereference in mt7925_tx_check_aggr()
    b81a93dc0aed wifi: mt76: mt7915: fix use_cts_prot support
    729b4adad191 wifi: mt76: mt7615: fix use_cts_prot support
    9aa3b49e1c5b wifi: mt76: mt7925: Fix incorrect MLO mode in firmware control
    3880639cec09 wifi: mt76: mt7921: Reset ampdu_state state in case of failure in mt76_connac2_tx_check_aggr()
    1e16b0a9b988 wifi: mt76: mt7996: Reset ampdu_state state in case of failure in mt7996_tx_check_aggr()
    455a48685fee wifi: mt76: mt7996: Clear wcid pointer in mt7996_mac_sta_deinit_link()
    6d7f231d5fff wifi: mt76: mt7996: Reset mtxq->idx if primary link is removed in mt7996_vif_link_remove()
    15205c72f1ec wifi: mt76: mt7996: Set mtxq->wcid just for primary link
    900579479395 wifi: mt76: mt7996: fix iface combination for different chipsets
    096b74331df2 wifi: mt76: mt7996: fix the behavior of radar detection
    d902905cb708 tools/nolibc/printf: Move snprintf length check to callback
    ea23d00b98f5 tools/nolibc/printf: Change variables 'c' to 'ch' and 'tmpbuf[]' to 'outbuf[]'
    ca5b2452d6f1 tools/nolibc: implement %m if errno is not defined
    00c0317cebf4 wifi: libertas: don't kill URBs in interrupt context
    a761a1539a55 wifi: libertas: use USB anchors for tracking in-flight URBs
    d538795ea2ef module: Fix freeing of charp module parameters when CONFIG_SYSFS=n
    8f32c95a5678 params: Replace __modinit with __init_or_module
    c8b710655012 powerpc/pgtable-frag: Fix bad page state in pte_frag_destroy
    366b0e05ee24 s390/bpf: Zero-extend bpf prog return values and kfunc arguments
    3849f0ee39ea dpaa2: compile dpaa2 even CONFIG_FSL_DPAA2_ETH=n
    eebe930e785d dpaa2: add independent dependencies for FSL_DPAA2_SWITCH
    0ee803fc4787 wifi: ieee80211: fix definition of EHT-MCS 15 in MRU
    dd827cff429d wifi: ieee80211: split EHT definitions out
    df5720d35848 wifi: ieee80211: split HE definitions out
    f8d1e8038bc7 wifi: ieee80211: split VHT definitions out
    4d5caab09dab wifi: ieee80211: split HT definitions out
    3f459076b2d8 wifi: ieee80211: split mesh definitions out
    5500913516e0 bpf: test_run: Fix the null pointer dereference issue in bpf_lwt_xmit_push_encap
    aa10a452e348 wifi: rtlwifi: pci: fix possible use-after-free caused by unfinished irq_prepare_bcn_tasklet
    9fe48cacab63 wifi: mwifiex: Fix memory leak in mwifiex_11n_aggregate_pkt()
    b4f0a37724de sched/rt: Skip group schedulable check with rt_group_sched=0
    4bd99f4f86b1 firmware: dmi: Correct an indexing error in dmi.h
    e5bdb8404df4 x86/vdso: Clean up remnants of VDSO32_NOTE_MASK
    d739426c2fd1 ASoC: Intel: avs: Include CPUID header at file scope
    7e16c122695c ASoC: Intel: avs: Check maximum valid CPUID leaf
    e2a2781d1ae6 irqchip/renesas-rzg2l: Fix error path in rzg2l_irqc_common_probe()
    b5232c2f04e1 sched/topology: Fix sched_domain_span()
    87800a0bd2fe sched/topology: Compute sd_weight considering cpuset partitions
    5fbefcd7c38e locking: Fix rwlock support in <linux/spinlock_up.h>
    8e1be8f79fca scripts/gdb: timerlist: Adapt to move of tk_core
    6adc01405605 sparc64: vdso: Link with -z noexecstack
    bec2fa23eaf2 rust: sync: atomic: Remove bound `T: Sync` for `Atomic::from_ptr()`
    90e8cfcd217c x86/tdx: Fix the typo in TDX_ATTR_MIGRTABLE
    2783ed2442ce perf/amd/ibs: Avoid calling perf_allow_kernel() from the IBS NMI handler
    aaf2712f7674 perf/amd/ibs: Preserve PhyAddrVal bit when clearing PhyAddr MSR
    e017f5b69b76 hrtimer: Reduce trace noise in hrtimer_start()
    a8759eef4951 hrtimer: Avoid pointless reprogramming in __hrtimer_start_range_ns()
    6b05c427a638 irqchip/irq-pic32-evic: Address warning related to wrong printf() formatter
    8139ce66b52a bus: fsl-mc: use generic driver_override infrastructure
    2081957d8c32 s390/cio: use generic driver_override infrastructure
    654ef9c33e13 vdpa: use generic driver_override infrastructure
    2c5507010fc3 platform/wmi: use generic driver_override infrastructure
    58a42be0d703 PCI: use generic driver_override infrastructure
    e52830bf37a2 cpufreq: Pass the policy to cpufreq_driver->adjust_perf()
    e6210630b24e amd-pstate: Update cppc_req_cached in fast_switch case
    539aabbab190 amd-pstate: Fix memory leak in amd_pstate_epp_cpu_init()
    187c8be0c48f soundwire: debugfs: initialize firmware_file to empty string
    bfe63c16fefb debugfs: fix placement of EXPORT_SYMBOL_GPL for debugfs_create_str()
    172b40b1468e debugfs: check for NULL pointer in debugfs_create_str()
    5b4604cd5a9d thermal/drivers/spear: Fix error condition for reading st,thermal-flags
    01cdbf3dcf89 devres: fix missing node debug info in devm_krealloc()
    ae04d2e67f9a ACPI: x86: cmos_rtc: Improve coordination with ACPI TAD driver
    9f8a61db50a8 ACPI: x86: cmos_rtc: Clean up address space handler driver
    265ab7e7d40d OPP: Move break out of scoped_guard in dev_pm_opp_xlate_required_opp()
    7cbabc3411a7 OPP: debugfs: Use performance level if available to distinguish between rates
    9a24f0000876 btrfs: fix deadlock between reflink and transaction commit when using flushoncommit
    ff6b93410192 md: wake raid456 reshape waiters before suspend
    f8b799e4fd97 md: remove unused static md_wq workqueue
    3f1e2902b5ec dm: add WQ_PERCPU to alloc_workqueue users
    d5559ac21f4a erofs: handle 48-bit blocks/uniaddr for extra devices
    62c44566da74 md: fix array_state=clear sysfs deadlock
    46194b5ba93b erofs: include the trailing NUL in FS_IOC_GETFSLABEL
    5263ed3dd13b pstore/ram: fix resource leak when ioremap() fails
    b3e005f16cd9 blk-cgroup: fix disk reference leak in blkcg_maybe_throttle_current()
    e5ff0ba4b698 nilfs2: reject zero bd_oblocknr in nilfs_ioctl_mark_blocks_dirty()
    37466ec483ea loop: fix partition scan race between udev and loop_reread_partitions()
    996d279f2c98 drbd: Balance RCU calls in drbd_adm_dump_devices()
    c3ec2db64bfe md/raid1: fix the comparing region of interval tree
    0e4eff315d79 fs/mbcache: cancel shrink work before destroying the cache
    6561afc38398 fs/omfs: reject s_sys_blocksize smaller than OMFS_DIR_START
    93383b668107 blk-cgroup: wait for blkcg cleanup before initializing new disk
    52386a7b1beb Linux 6.18.32
    271cd5429513 drm/amdgpu/vcn4: Avoid overflow on msg bound check
    016b64a0313e drm/amdgpu/vcn3: Avoid overflow on msg bound check
    e9edf9893cf2 vsock/virtio: fix accept queue count leak on transport mismatch
    52da6a74ca3d vsock/virtio: fix empty payload in tap skb for non-linear buffers
    a534e1f985b6 vsock/virtio: fix length and offset in tap skb for split packets
    2602f7bb5818 vsock: fix buffer size clamping order
    8be786053797 batman-adv: tp_meter: fix tp_num leak on kmalloc failure
    5e9dfc07d061 tracing/fprobe: Remove fprobe from hash in failure path
    a2181464a4a7 tracing/fprobe: Unregister fprobe even if memory allocation fails
    d83e51202fec tracing: fprobe: optimization for entry only case
    52277410cbed tracing: fprobe: use rhltable for fprobe_ip_table
    5d12e0ab009a btrfs: fix btrfs_ioctl_space_info() slot_count TOCTOU which can lead to info-leak
    dfd05a16b5c9 btrfs: fix double free in create_space_info_sub_group() error path
    a4b5c5d2f8c5 btrfs: remove fs_info argument from btrfs_sysfs_add_space_info_type()
    d784865ce48f usb: dwc3: Move GUID programming after PHY initialization
    476ee6389120 usb: dwc3: Add dwc pointer to dwc3_readl/writel
    e63942da5e96 usb: dwc3: Remove of dep->regs
    ce9aaa3af445 sched_ext: Read scx_root under scx_cgroup_ops_rwsem in cgroup setters
    30cf8e05d635 sched/ext: Implement cgroup_set_idle() callback
    dc34f8d8240f Bluetooth: hci_conn: fix potential UAF in create_big_sync
    c0a8dca8d556 spi: zynq-qspi: fix controller deregistration
    ed822a569645 spi: zynq-qspi: Simplify clock handling with devm_clk_get_enabled()
    33e5ce64b817 spi: tegra114: fix controller deregistration
    65eafad7a600 spi: tegra20-sflash: fix controller deregistration
    fafa9a4e831b spi: uniphier: fix controller deregistration
    b0a97cb0b9ba spi: uniphier: Simplify clock handling with devm_clk_get_enabled()
    6542e180fa6e pseries/papr-hvpipe: Fix race with interrupt handler
    09c15bbbed53 papr-hvpipe: convert papr_hvpipe_dev_create_handle() to FD_PREPARE()
    24d2912962d0 EDAC/versalnet: Fix device name memory leak
    d281f3ac0d00 block: fix zone write plug removal
    7105d9f1387d fbcon: Avoid OOB font access if console rotation fails
    1817dd0c350f fbcon: Rename struct fbcon_ops to struct fbcon_par
    f0d3bb6f5125 drm/amdgpu: rework how we handle TLB fences
    13e9ea445191 Revert "drm/amdgpu: don't attach the tlb fence for SI"
    576b73b24656 drm/amdgpu: Fix validating flush_gpu_tlb_pasid()
    fd78e63459ab drm/amdgpu: validate the flush_gpu_tlb_pasid()
    a9591e4083cc mm/damon/core: disallow time-quota setting zero esz
    377c3d5dc952 usb: typec: tcpm: reset internal port states on soft reset AMS
    d893804e9e3b mm/damon/reclaim: detect and use fresh enabled and kdamond_pid values
    4697ed7be9b9 mm/damon/lru_sort: detect and use fresh enabled and kdamond_pid values
    679e65ae721c mm/damon/core: implement damon_kdamond_pid()
    20048f0b38cd LoongArch: KVM: Compile switch.S directly into the kernel
    f49a00180dfc io_uring/zcrx: warn on freelist violations
    1a516d19100e io_uring/zcrx: use guards for locking
    0baf4b659cdc batman-adv: bla: put backbone reference on failed claim hash insert
    b65365d2b1e6 batman-adv: bla: only purge non-released claims
    00155f336a5e batman-adv: bla: prevent use-after-free when deleting claims
    09dc0d1a1222 batman-adv: stop caching unowned originator pointers in BAT IV
    03660dab86f9 batman-adv: stop tp_meter sessions during mesh teardown
    e1e2194cc725 batman-adv: reject new tp_meter sessions during teardown
    bf872db54f91 batman-adv: fix integer overflow on buff_pos
    c9dadb31f360 sctp: revalidate list cursor after sctp_sendmsg_to_asoc() in SCTP_SENDALL
    cd39452498e2 arm64: dts: ti: k3-am62a7-sk: Fix pin name in comment from M19 to N22
    3eb7d0e2d4a0 arm64: dts: qcom: lemans: Correct QUP interrupt numbers
    f8f546883e87 drm/amdgpu/pm: align Hawaii mclk workaround with radeon
    6fed6e9f1062 drm/amdgpu/pm: add missing revision check for CI
    0b91ea46bb68 drm/amdgpu/sdma4: replace BUG_ON with WARN_ON in fence emission
    6fbd52d210c1 drm/amdkfd: Make all TLB-flushes heavy-weight
    46bc180e6ede drm/panel: boe-tv101wum-nl6: restore MODE_LPM after sending disable cmds
    73af14be7645 drm/bridge: tda998x: Use __be32 for audio port OF property pointer
    71614ab2a683 drm/amdgpu/gfx9: drop unnecessary 64-bit fence flag check in KIQ
    f6dbec5bee72 drm/panel: himax-hx83102: restore MODE_LPM after sending disable cmds
    ed21d6e4ce03 drm/exynos: remove bridge when component_add fails
    b17175d0a375 drm/amdgpu: zero-initialize GART table on allocation
    264ee64cf867 drm/radeon: add missing revision check for CI
    672464dd5323 drm: Set old handle to NULL before prime swap in change_handle
    87f9b1528e1f drm/xe/uapi: Reject coh_none PAT index for CPU cached memory in madvise
    fa449b88706e drm/xe/bo: Fix bo leak on unaligned size validation in xe_bo_init_locked()
    0afa8b1ef582 drm/xe: Fix dma-buf attachment leak in xe_gem_prime_import()
    cd38e1503e67 drm/xe/bo: Fix bo leak on GGTT flag validation in xe_bo_init_locked()
    f9ad21b90162 drm/xe: Fix bo leak in xe_dma_buf_init_obj() on allocation failure
    2b5ba326f9d0 drm/udl: Increase GET_URB_TIMEOUT
    db9530a9873a drm/amdkfd: validate SVM ioctl nattr against buffer size
    a7735b491a2d drm/appletbdrm: Use kvzalloc for big allocations
    1a17ea9861e8 drm/gem: Fix inconsistent plane dimension calculation in drm_gem_fb_init_with_funcs()
    158def957199 drm/amd/display: Change dither policy for 10 bpc output back to dithering
    638e48ee39d0 drm/amdgpu/vcn3: Prevent OOB reads when parsing dec msg
    63b51e8a9d54 drm/amdgpu/vcn4: Prevent OOB reads when parsing dec msg
    b3d1a0a45c4a drm/amdgpu/vce: Prevent partial address patches
    a6d5563ba1f0 drm/amdgpu/vcn4: Prevent OOB reads when parsing IB
    fec8b11b55e5 drm/amdgpu: Add bounds checking to ib_{get,set}_value
    44d5a450c04d drm/amdkfd: Add upper bound check for num_of_nodes
    de137adccf7a drm/amd/pm: fix incorrect FeatureCtrlMask setting on smu v14.0.x
    f34eda3ff33d drm/amdgpu: gate VM CPU HDP flush on reset lock
    2795d325bb5c drm/amdgpu: Use SMUIO 15.0.0 offsets for TSC upper and lower count.
    77d0b5d11387 drm/amdkfd: Clear VRAM on allocation to prevent stale data exposure
    48fb2213e2c2 drm/i915/psr: Init variable to avoid early exit from et alignment loop
    132b8d51f0ff drm/msm: always recover the gpu
    c5b5a0e418b1 drm/imx: parallel-display: Prefer bus format set via legacy "interface-pix-fmt" DT property
    c57c861956b8 drm/msm/gem: fix error handling in msm_ioctl_gem_info_get_metadata()
    e9ae6590405d spi: cadence: fix clock imbalance on probe failure
    6ac380a0071d spi: cadence: fix unclocked access on unbind
    59701f07b19e spi: cadence: fix controller deregistration
    6c3e413919a1 spi: mpc52xx: fix use-after-free on unbind
    28f28a0f4e32 spi: mpc52xx: fix controller deregistration
    336d9ad7560b spi: mpc52xx: fix use-after-free on registration failure
    07dc76d31be4 spi: orion: fix clock imbalance on registration failure
    b809b8d2a114 spi: orion: fix runtime pm leak on unbind
    ec7a4cff8355 spi: orion: fix controller deregistration
    5c03d52ee6ce spi: mxic: fix controller deregistration
    2a2973cb3682 spi: imx: fix runtime pm leak on probe deferral
    6a405d594207 spi: mpfs: fix controller deregistration
    b2bdbe293012 spi: img-spfi: fix controller deregistration
    4b0fe572a8ea spi: slave-mt27xx: fix controller deregistration
    0df72db5a13c spi: sh-msiof: fix controller deregistration
    aee76c1dd189 spi: rspi: fix controller deregistration
    229cc70e4e90 spi: sprd: fix controller deregistration
    cdbf6baefff0 spi: pic32-sqi: fix controller deregistration
    82a95eca235b spi: cavium-thunderx: fix controller deregistration
    e84a84209b3f spi: npcm-pspi: fix controller deregistration
    ee2100d08094 spi: coldfire-qspi: fix controller deregistration
    047f939c602c spi: bcmbca-hsspi: fix controller deregistration
    ca3195c7b883 spi: fsl: fix controller deregistration
    d78c5ca1563c spi: sh-hspi: fix controller deregistration
    4422fc2411cb spi: ch341: fix devres lifetime
    af4f58c18c4c spi: pl022: fix controller deregistration
    cc8a904cbe6d spi: mtk-nor: fix controller deregistration
    894d761a3a85 spi: pic32: fix controller deregistration
    4ed7de898bbb spi: omap2-mcspi: fix controller deregistration
    09ceedcebc77 spi: fsl-espi: fix controller deregistration
    b99939bccae9 spi: s3c64xx: fix controller deregistration
    c74ba7340010 spi: dln2: fix controller deregistration
    724520793a2e spi: mt65xx: fix controller deregistration
    cc525debdfc8 spi: mxs: fix controller deregistration
    22ee38cbf536 media: qcom: camss: Add missing clocks for VFE lite on sa8775p
    696ac7c49c27 media: iris: Fix dma_free_attrs() size in iris_hfi_queues_init()
    095c51bc86d3 media: venus: fix QCOM_MDT_LOADER dependency
    e56a25247860 media: qcom: iris: increase H265D_MAX_SLICE to fix H.265 decoding on SC7280
    9d6217429cd4 media: qcom: camss: Fix csid IRQ offset for sa8775p
    8744fd0835dd media: qcom: camss: Fix csid clock configuration for sa8775p
    dd24998a4a40 media: iris: Fix use-after-free in iris_release_internal_buffers()
    1920b4602ec9 media: iris: fix QCOM_MDT_LOADER dependency
    d172bb82f70c media: omap3isp: drop the use count of v4l2 pipeline
    cedfde9f45b1 media: i2c: ov08d10: fix runtime PM handling in probe
    d9e678e8c633 media: i2c: ov08d10: fix image vertical start setting
    ea91dee38b4e media: staging: imx: request mbus_config in csi_start
    731d7ab8dfa2 media: i2c: imx412: Assert reset GPIO during probe
    34fe9c3c594e media: dib8000: avoid division by 0 in dib8000_set_dds()
    def939175ab8 media: pci: zoran: fix potential memory leak in zoran_probe()
    84d781069294 arm64: dts: broadcom: bcm2712-d-rpi-5-b: update uart10 interrupt
    65d7b2aecdfe arm64: dts: broadcom: bcm2712-d-rpi-5-b: add fixes for pinctrl/pinctrl_aon
    5167575b79e2 vsock/virtio: fix MSG_PEEK ignoring skb offset when calculating bytes to copy
    75c38af4d919 platform/x86: hp-wmi: Ignore backlight and FnLock events
    45890a035e2b spi: aspeed-smc: fix controller deregistration
    07938829cc11 spi: amlogic-spisg: fix controller deregistration
    6047dc542fa4 media: saa7164: add ioremap return checks and cleanups
    d6f56e66e8f4 spi: at91-usart: fix controller deregistration
    5d707cf9c138 spi: qup: fix controller deregistration
    4eccd83f228f spi: meson-spicc: fix controller deregistration
    6ca3eaa82812 spi: lantiq-ssc: fix controller deregistration
    184dcecc9521 regulator: bd9571mwv: fix OF node reference imbalance
    037bcca27835 regulator: s2dos05: fix OF node reference imbalance
    890a8bcef309 regulator: act8945a: fix OF node reference imbalance
    41ef27dcaa12 media: i2c: imx283: Fix hang when going from large to small resolution
    f43e30646fc9 media: intel/ipu6: fix error pointer dereference
    21fade52ab9f media: videobuf2: Set vma_flags in vb2_dma_sg_mmap
    dd681c102b4b regulator: rk808: fix OF node reference imbalance
    e7374c142169 regulator: bq257xx: fix OF node reference imbalance
    6c5d4c819d92 media: i2c: imx283: Enter full standby when stopping streaming
    ecd0c501bd63 media: rc: streamzap: Error handling in probe
    63a960b39de9 media: rc: xbox_remote: heed DMA restrictions
    a8ada5b76115 regulator: max77650: fix OF node reference imbalance
    8993d307cf2c spi: st-ssc4: fix controller deregistration
    2d51cfca8482 regulator: mt6357: fix OF node reference imbalance
    c7848b67ef10 staging: media: atomisp: Disallow all private IOCTLs
    af2dc8b8460c arm64: dts: lx2160a-cex7/lx2162a-sr-som: fix usd-cd & gpio pinmux
    72972aba49df spi: atmel: fix controller deregistration
    c66a6f226a5f spi: bcm63xx: fix controller deregistration
    7fbb3b4bef02 drm/gpusvm: Force unmapping on error in drm_gpusvm_get_pages
    ea28b33e1b15 media: chips-media: wave5: add missing spinlock protection for handle_dynamic_resolution_change()
    d71fc6874fce media: chips-media: wave5: add missing spinlock protection for send_eos_event()
    b40ec65e0926 media: chips-media: wave5: fix a potential memory leak in wave5_vdi_init()
    6261d5fd172b media: dt-bindings: rockchip,vdec: Mark reg-names required for RK35{76,88}
    361e66fb431d media: dt-bindings: rockchip,vdec: Add alternative reg-names order for RK35{76,88}
    791598484fd5 media: i2c: ov8856: free control handler on error in ov8856_init_controls()
    b6e5c80cc2b2 media: renesas: vin: Fix RAW8 (again)
    bfb2081ba00a media: renesas: vsp1: Fix NULL pointer deref on module unload
    4d6e8496486d media: nxp: imx8-isi: Reduce minimum queued buffers from 2 to 0
    0ac9ec121d89 drm/msm/hdmi: Fix wrong CTRL1 register used in writing info frames
    06d99af8db11 media: uvcvideo: Enable VB2_DMABUF for metadata stream
    80d8cc29d3b6 HID: pidff: Fix integer overflow in pidff_rescale
    5c0830323689 HID: appletb-kbd: run inactivity autodim from workqueues
    59a79938ca55 HID: appletb-kbd: fix UAF in inactivity-timer cleanup path
    7812694752a5 HID: playstation: Clamp num_touch_reports

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
index c0ca3ae..ec18aba 100644
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
@@ -8,4 +8,4 @@ KMACHINE:genericx86 ?= "common-pc"
 KMACHINE:genericx86-64 ?= "common-pc-64"
 
 KBRANCH:genericarm64 ?= "v6.18/standard/genericarm64"
-SRCREV_machine:genericarm64 ?= "3acde948b7470a96df7e730a2119ffaee380d6b1"
+SRCREV_machine:genericarm64 ?= "6bf211598fd7bc81856d3d84b0cc610e2bbe81db"
-- 
2.43.0


