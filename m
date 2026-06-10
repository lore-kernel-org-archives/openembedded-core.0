Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6139ECD98C6
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 16:47:52 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25396.1781110065488560591
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 09:47:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iD9U6TpK;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-51761d27612so81167331cf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781110064; x=1781714864; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S5/H2Liv+ZHgwzjBjRrP8wc9UZa5fP8CeFAA9niK3UM=;
        b=iD9U6TpKYMLpGQ5vsO676koTaj7Z2pX8ihG6J/xVbKcbQwrJiO+W4jALO2IEoumE0L
         +/qharRYcH5EsdM+YCmOIO6yqxh/mhvcDIDOe0iDG98zl3/8bzDKdmDXleohfKyAG7eI
         yBimxPRe5JMy3Pycpx+3Rafg1S8n0y672bI19gapyDksYRti+Si8LDr9fH6RfTxqgQXV
         vdxpFDyen2vJ7X2/uzbKRPi8ClX4+Xdo9SxgFxLX2MF4csEJBGt5Yqh2J6GbhBhTPBGE
         7zfuKnvaVV40cVRlo03vOPtJCSdrO3arwuZUFvOqx+RV7tooEZ8OgWUHK1wDH3/A+2Sr
         59WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781110064; x=1781714864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S5/H2Liv+ZHgwzjBjRrP8wc9UZa5fP8CeFAA9niK3UM=;
        b=Glujt1dm7XMPkCmPFTBdC76IQt5XH4cKlgZ7h0WYm9q+SCEvfMzI0TyG1RLHoCMHk5
         Ss+wCNaUjaHxwek15HBITAUiTPRAhahhte0K+aWgzpvRxGjs/fBDGnzqE2R/Zqs1c9aW
         ceOGedAOiA4PHdTSNKcBONNdywHS+gUf7xxY73beFl94agTjOWwTTJ7yI45Ehdh1Gsjj
         Y6fLI7zmgxeBmmGZ6P8j1jXxyJJtou6cebTt8tcfOXroj2Po6oSFMjnCg5mEtdwFJ4Ux
         nuDj/UBIjnzummjc4YpPtrIyNMB1Qvt8FJtM7xvZv//lokaAr7J7VZYJrIclmbMuNhGE
         XhMw==
X-Gm-Message-State: AOJu0Yy4E/L3J0juu3JRkNYbb8KB7B3YpCfAjbcRJTphG04t0rktW8/X
	EcuBd7hFV1d7yXL+P/T1UmLdtKrC3FaFJFckFFNs8FnbZbY/TO2Xkg8WjhR0aenf
X-Gm-Gg: Acq92OE00UF8rO9czt+6PtrRATepp6eZSN3yJGpRgOK3Gr7KHTv7VM2TcjOvrntyBlV
	fmPw0G6Spid2/ay5IyVSgL5tr+iYYqOfDBjQDgnTqW+V6+vfLwmtMRdyivhaCMZFrJcoxwNxk9J
	UQbDIMaqpeo3Q1b5sD2Ik9XNis2WxrGXimTpegjKt/beEyK8mNolSoNNbGt2y433jjSfP3DtgGs
	4WgDO6gi0Whi3As4uPXyTBGFHMWtzRBGJzrfTNTJLkeezD3y7EoIh8BoGoeyPg1FE7pue1kw2Ia
	jUfzVBmfSliE788Rd3Zo6phZB6kJnp9PY4YrdhBB5B+Vz/MUsx4WrTjd4I89kHUyZaqZmMc6rsY
	yXQb83uM/fGLA4DNOLMbRKjzQzZiwqza7Utb6rGIGjNYeoyNgWERhAjVIh8K4MV4xEh58hbibUt
	HlwlKB16m6sCbaruOaVx9HIoT3IeTqbDjd61uCpKa/RYul0cmdBGirG3WAjKghg0QwWX6Bgwer2
	CKUI2f85uMCvONY99UJIpL9Px1H5EL0UisUM29kdxgRqgSYlardxM4z9ehdpNMt1onv/xzaDQLL
	b/BLEBLBQhg0lQGU0dnt/0QdZRqO1tDHgIujFKVia6jVydWKOqX9aJmfiGJGQzE+Aw==
X-Received: by 2002:ac8:5a50:0:b0:516:d60f:6457 with SMTP id d75a77b69052e-51795b0cf8bmr349189871cf.4.1781110064138;
        Wed, 10 Jun 2026 09:47:44 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775d9efa1sm214422401cf.20.2026.06.10.09.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 09:47:43 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta-yocto-bsp][PATCH 03/04] yocto-bsps: update to v6.18.34
Date: Wed, 10 Jun 2026 12:47:36 -0400
Message-ID: <20260610164737.1869790-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610164737.1869790-1-bruce.ashfield@gmail.com>
References: <20260610164737.1869790-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 16:47:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238375

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.18 to the latest korg -stable release that comprises
the following commits:

    18ad16ce4a6b Linux 6.18.34
    50bb3435a5e6 security/keys: fix missed RCU read section on lookup
    239172639075 drm/msm: Restore second parameter name in purge() and evict()
    306ba9d0e5aa LoongArch: kprobes: Fix handling of fatal unrecoverable recursions
    a1a39f227c80 ksmbd: fix durable reconnect error path file lifetime
    6836f694126e io_uring/nop: pass all errors to userspace
    e334cbf3388f net: gro: don't merge zcopy skbs
    8129611d4ede pds_core: ensure null-termination for firmware version strings
    d1d76bbb6d7a net: airoha: Disable GDM2 forwarding before configuring GDM2 loopback
    719007c3492f tap: fix stack info leak in tap_ioctl() SIOCGIFHWADDR
    fa627a5eaa83 net: mana: validate rx_req_idx to prevent out-of-bounds array access
    bc0020490f88 octeontx2-af: npc: Fix allmulticast skip logic for LBK and SDP VFs
    76dd50b7888d selftests: net: Fix checksums in xdp_native
    04ef7592eaad drm/xe/oa: Fix exec_queue leak on width check in stream open
    db86ac6d8daf ASoC: cs35l56: Fix flushing of IRQ work in cs35l56_sdw_remove()
    decacc6308c5 gpio: aggregator: lock device when calling device_is_bound()
    3e657619cf72 gpio: aggregator: remove the software node when deactivating the aggregator
    80d94cf1773a gpio: aggregator: stop using dev-sync-probe
    ea28b286649b gpio: aggregator: fix a potential use-after-free
    4669f84adcb1 gpio: cdev: check if uAPI v2 config attributes are correctly zeroed
    e47f7060eaf6 tcp: fix stale per-CPU tcp_tw_isn leak enabling ISN prediction
    1861d369efd6 bpf, skmsg: fix verdict sk_data_ready racing with ktls rx
    26f1d4522060 net: ag71xx: check error for platform_get_irq
    585f9f6aef5c crypto/krb5, rxrpc: Fix lack of pre-decrypt/pre-verify length checks
    2417df5e7bb4 net: shaper: rework the VALID marking (again)
    5a2c2aa139c8 net: shaper: annotate the data races
    b5bd4249e430 net/mlx5e: Fix eswitch mode block underflow on IPsec acquire SA
    a0f5268c77eb Bluetooth: btmtk: fix urb->setup_packet leak in error paths
    c7860b6a6d2d Bluetooth: btintel_pcie: Fix incorrect MAC access programming
    d6c8b3ebdcdb tracing: Avoid NULL return from hist_field_name() on truncation
    8bf00d3ac425 cgroup: rstat: relax NMI guard after switch to try_cmpxchg
    3aab4a58d23f ALSA: seq: Serialize UMP output teardown with event_input
    95c82d498d74 wifi: wilc1000: fix dma_buffer leak on bus acquire failure
    55c479aae99b wifi: mac80211: fix MLE defragmentation
    2d8379834800 wifi: mac80211: bounds-check link_id in ieee80211_ml_epcs
    425d32d6288d erofs: fix managed cache race for unaligned extents
    91d13e92b983 pds_core: fix debugfs_lookup dentry leak and error handling
    784dd2bdc622 pds_core: fix error handling in pdsc_devcmd_wait
    ce23832071af net: airoha: Fix NPU RX DMA descriptor bits
    0c277d203684 net: phy: honor eee_disabled_modes in phy_advertise_eee_all()
    bd731994cff1 net: phy: honor eee_disabled_modes in phy_support_eee()
    a9224862d597 bridge: mcast: Fix a possible use-after-free when removing a bridge port
    981aea209977 net: bridge: Flush multicast groups when snooping is disabled
    eae62c5451e6 RDMA/rtrs: Fix use-after-free in path file creation cleanup
    8c63698737b4 RDMA/mana_ib: Report max_msg_sz in mana_ib_query_port
    d5b11e15ee67 ASoC: soc-utils: Add missing va_end in snd_soc_ret()
    09deb063eecf platform/x86: intel-vbtn: Check ACPI_HANDLE() against NULL
    f6dfd64bfd9b platform/x86: intel-hid: Check ACPI_HANDLE() against NULL
    ed864a7b881c platform/x86: hp_accel: Check ACPI_COMPANION() against NULL
    7ea5aad8d351 platform/x86: adv_swbutton: Check ACPI_HANDLE() against NULL
    098419a4b062 platform/surface: aggregator_registry: omit battery & AC nodes on Surface Laptop 7
    09ec063d87c2 net: mana: Fix TOCTOU double-fetch of hwc_msg_id from DMA buffer
    f71fc35b5e45 net: dsa: mt7530: preserve VLAN tags on trapped link-local frames
    89bed786f231 net: dsa: mt7530: fix FDB entries not aging out with short timeout
    f1739debda62 kbuild: pacman-pkg: make "rc" releases adhere to pacman versioning scheme
    ad8e3d096fa1 drm/i915/dp: Fix readback for target_rr in Adaptive Sync SDP
    1f83545f432d igc: set tx buffer type for SMD frames
    89964ddb322a ice: ptp: use primary NAC semaphore on E825
    0010296879df ice: ptp: serialize E825 PHY timer start with PTP lock
    6a01413a4e8f cgroup/rstat: validate cpu before css_rstat_cpu() access
    83b8a0f72ecc drm/mediatek: mtk_hdmi_ddc: Fix non-static global variable
    8ea34da68964 drm/mediatek: mtk_cec: Fix non-static global variable
    926a08cf19be wifi: ath11k: fix peer resolution on rx path when peer_id=0
    6c9e9272bc37 drm/xe/pf: Fix CFI failure in debugfs access
    dc26e00860a1 drm/xe/vf: Fix signature of print functions
    2c890e71ae26 drm/xe/gsc: Fix double-free of managed BO in error path
    181e67bc11c5 dma-mapping: move dma_map_resource() sanity check into debug code
    3a74aaad0473 wifi: iwlwifi: mld: don't dereference a pointer before NULL checking it
    9e360e610a73 wifi: iwlwifi: mld: fix TSO segmentation explosion when AMSDU is disabled
    bed1fc32e0eb hwmon: (lm90) Add lock protection to lm90_alert
    c98107817b0f hwmon: (lm90) Stop work before releasing hwmon device
    cdd1aaf0ee96 drm/msm/snapshot: fix dumping of the unaligned regions
    0c9e4d9484cc ALSA: hda/realtek: Use ALC287_FIXUP_TXNW2781_I2C for ASUS Strix Gxx5
    df19b6af1716 netfilter: nft_inner: release local_lock before re-enabling softirqs
    0fa225896f4b spi: mtk-snfi: Fix resource leak in mtk_snand_read_page_cache()
    fecfed41da73 ASoC: amd: acp-sdw-legacy: check CPU DAI name before logging
    7e91d3a1a98a btrfs: fix squota accounting during enable generation
    ca56ffdb017b btrfs: check for subvolume before deleting squota qgroup
    b422609291f6 btrfs: relax squota parent qgroup deletion rule
    22d558df51d9 btrfs: check squota parent usage on membership change
    a1296bb9f44a btrfs: remaining BTRFS_PATH_AUTO_FREE conversions
    76ad957a72c7 btrfs: don't search back for dir inode item in INO_LOOKUP_USER
    16141bef6fb1 btrfs: use the key format macros when printing keys
    35f69e993d00 btrfs: add macros to facilitate printing of keys
    76b995bc57bd vsock/virtio: fix zerocopy completion for multi-skb sends
    782693eb53f8 io_uring/net: punt IORING_OP_BIND async if it needs file create
    c53cac053d62 ALSA: scarlett2: Add missing error check when initialise Autogain Status
    1ddf678bb75b ASoC: codecs: fs210x: fix possible buffer overflow
    36de63965464 scsi: sd: Fix return code handling in sd_spinup_disk()
    b4dc0056397f net/mlx5: Do not restore destination-less TC rules
    81c8a9f75a42 tls: Preserve sk_err across recvmsg() when data has been copied
    1370acb8bc39 ovpn: disable BHs when updating device stats
    f7808b7ddcf2 x86/xen: Fix xen_e820_swap_entry_with_ram()
    2378d25675da gcc-plugins: Always define CONST_CAST_GIMPLE and CONST_CAST_TREE
    097d62df3831 ovpn: fix race between deleting interface and adding new peer
    8298834912d7 ovpn: respect peer refcount in CMD_NEW_PEER error path
    e5460eb7238c ovpn: tcp - use cached peer pointer in ovpn_tcp_close()
    2bc34520ce5c net: phy: DP83TC811: add reading of abilities
    af855f4c966a net: tls: prevent chain-after-chain in plain text SG
    eca989eab4b2 net: tls: fix off-by-one in sg_chain entry count for wrapped sk_msg ring
    afa9036b8c99 net/smc: reject CHID-0 ACCEPT that matches an empty ism_dev slot
    6dcd072a5ae3 powerpc/time: Remove redundant preempt_disable|enable() calls from arch_irq_work_raise()
    f4e37f3df436 drm/msm: Fix iommu_map_sgtable() return value check and avoid WARN
    eea43d5ed450 drm/msm/adreno: fix userspace-triggered crash on a2xx-a4xx
    3a7b59d2385d Documentation: intel_pstate: Fix description of asymmetric packing with SMT
    3ad2d8be6e4d x86/mce: Restore MCA polling interval halving
    15dba511d569 selftests: ublk: cap nthreads to kernel's actual nr_hw_queues
    ff58e5ef1b46 drm/msm/dpu: don't mix devm and drmm functions
    a184aec79013 drm/msm/dsi: don't dump registers past the mapped region
    d235f8f7b264 ethtool: fix ethnl_bitmap32_not_zero() bit interval semantics
    d2ea0b8aef87 net/smc: avoid NULL deref of conn->lnk in smc_msg_event tracepoint
    97a8e89cdef3 accel/qaic: Add overflow check to remap_pfn_range during mmap
    76410790f149 block: bio-integrity: Fix null-ptr-deref in bio_integrity_map_user()
    086695145000 HID: quirks: really enable the intended work around for appledisplay
    0943f81e1b31 block: recompute nr_integrity_segments in blk_insert_cloned_request
    0d48654af4d1 block: don't overwrite bip_vcnt in bio_integrity_copy_user()
    a52486394493 net: shaper: reject QUEUE scope handle with missing id
    77ec90d41c59 net: shaper: enforce singleton NETDEV scope with id 0
    d7c2bbbaa2c4 net: shaper: fix undersized reply skb allocation in GROUP command
    f817ce8d1943 net: shaper: set ret to -ENOMEM when genlmsg_new() fails in group_doit
    5098b223f0f0 net: shaper: reject duplicate leaves in GROUP request
    d6128451c591 net: shaper: fix trivial ordering issue in net_shaper_commit()
    d947e6685ff4 net: shaper: flip the polarity of the valid flag
    e1b429d8e712 wifi: ath10k: skip WMI and beacon transmission when device is wedged
    d94127d04017 wifi: ath11k: fix error path leak in ath11k_tm_cmd_wmi_ftm()
    acde4692afcd wifi: ath11k: fix error path leaks in some WMI WOW calls
    9bc70fe995da net: ethernet: cs89x0: remove stale CONFIG_MACH_MX31ADS reference
    c373b34877af net: ethernet: cortina: Carry over frag counter
    3cd05250a2df net: ethernet: cortina: Drop half-assembled SKB
    cfd62907f3cd net: ethernet: cortina: Make RX SKB per-port
    77bb293049d6 netfs, afs: Fix write skipping in dir/link writepages
    f17b9121bb99 netfs: Fix netfs_read_folio() to wait on writeback
    551b5c71ee31 netfs: Fix folio->private handling in netfs_perform_write()
    3d9601c029b9 netfs: Fix partial invalidation of streaming-write folio
    6080fa3ecfbb netfs: Fix potential UAF in netfs_unlock_abandoned_read_pages()
    22ae28aae436 netfs: Fix leak of request in netfs_write_begin() error handling
    d4f4bc87c765 netfs: Fix early put of sink folio in netfs_read_gaps()
    616578e40dcb netfs: Fix write streaming disablement if fd open O_RDWR
    0b18cd70ebab netfs: Fix read-gaps to remove netfs_folio from filled folio
    003aa0dd26c9 netfs: Fix potential deadlock in write-through mode
    ef9b521212e4 netfs: Fix streaming write being overwritten
    185ded4112cd netfs: Defer the emission of trace_netfs_folio()
    fb6ec883b48b netfs: Fix netfs_invalidate_folio() to clear dirty bit if all changes gone
    afeb32d9bf9a netfs: Fix overrun check in netfs_extract_user_iter()
    b63971238beb netfs: fix VM_BUG_ON_FOLIO() issue in netfs_write_begin() call
    884c4c4f35e5 netfs: Fix netfs_read_to_pagecache() to pause on subreq failure
    5366199be46f netfs: Fix cancellation of a DIO and single read subrequests
    9c6f23cf3a07 powerpc: fix dead default for GUEST_STATE_BUFFER_TEST
    822bb1614ec4 powerpc: 82xx: fix uninitialized pointers with free attribute
    aed60070ed7b ASoC: SOF: amd: Fix error code handling in psp_send_cmd()
    510db031ba6e tcp: Fix out-of-bounds access for twsk in tcp_ao_established_key().
    eba8af785fde zonefs: handle integer overflow in zonefs_fname_to_fno
    9525e3a6fbb1 nvme-pci: fix use-after-free in nvme_free_host_mem()
    fea4b46f84c5 nvme: fix bio leak on mapping failure
    18c0456ea261 irq_work: Fix use-after-free in irq_work_single() on PREEMPT_RT
    06ee55f78fbe nsfs: fix wrong error code returned for pidns ioctls
    d168a71fc1d6 ublk: reject max_sectors smaller than PAGE_SECTORS in parameter validation
    617a2564d863 irqchip/ath79-cpu: Remove unused function
    ace6b3e033c6 fs: Fix return in jfs_mkdir and orangefs_mkdir
    e37ea2c6f17f fs/statmount: fix slab out-of-bounds write in statmount_mnt_idmap
    56b4cfcf1518 fprobe: Fix unregister_fprobe() to wait for RCU grace period
    36dc0cea30db ASoC: sdw_utils: Add quirk to ignore RT721 CODEC_MIC
    5afefecfe054 ASoC: sdw_utils: Add quirk to ignore RT712 CODEC_MIC
    fe59ae27d734 NFSD: Fix infinite loop in layout state revocation
    e9405f704127 phy: marvell: mvebu-a3700-utmi: fix incorrect USB2_PHY_CTRL register access
    994358adc098 net: ti: icssm-prueth: fix eth_ports_node leak in probe
    7df3e1dfee53 net: lan966x: avoid unregistering netdev on register failure
    d91a9a049698 ice: fix locking in ice_dcb_rebuild()
    34ad3c782644 ice: fix setting RSS VSI hash for E830
    eb5991d4c8ba idpf: fix read_dev_clk_lock spinlock init in idpf_ptp_init()
    a248793f00ab net: shaper: Reject reparenting of existing nodes
    bfe08fe5624b net: napi: Avoid gro timer misfiring at end of busypoll
    77e7818eb347 tcp: Fix imbalanced icsk_accept_queue count.
    1c24cf1fd67f test_kprobes: clear kprobes between test runs
    ae8a5c6b0316 kprobes: skip non-symbol addresses in kprobe_add_ksym_blacklist()
    c647e2a21bbb netfilter: bridge: eb_tables: close module init race
    524b6337277a netfilter: x_tables: close dangling table module init race
    cc989ef1c044 netfilter: ebtables: close dangling table module init race
    739d5dac7b2d netfilter: ebtables: move to two-stage removal scheme
    86ee5bc9c0f0 netfilter: x_tables: add and use xtables_unregister_table_exit
    89ebafe7910d netfilter: x_tables: add and use xt_unregister_table_pre_exit
    a9b2f73f6ba7 netfilter: x_tables: unregister the templates first
    c32a7e0e3c73 btrfs: tracepoints: fix sleep while in atomic context in btrfs_sync_file()
    373f65b448ed ALSA: hda: cs35l41: Put ACPI device on missing physical node
    fecae8b1fb2d ALSA: hda: cs35l56: Put ACPI device after setting companion
    e984dc22e2c2 ARM: integrator: Fix early initialization
    9e472874c954 firmware: arm_ffa: Fix sched-recv callback partition lookup
    d1e38551fade firmware: arm_ffa: Snapshot notifier callbacks under lock
    419cef661ae8 firmware: arm_ffa: Align RxTx buffer size before mapping
    3c51d99449dc firmware: arm_ffa: Validate framework notification message layout
    0a5dbac5ef53 firmware: arm_ffa: Keep framework RX release under lock
    f39bc7ebe75e firmware: arm_ffa: Bound PARTITION_INFO_GET_REGS copies
    fd2b01637e56 pinctrl: qcom: Fix wakeirq map by removing disconnected irqs for sm8150
    3f4d82780001 kunit: config: KUNIT_DEBUGFS should depend on DEBUG_FS
    91e4446b35f6 kunit: config: Enable KUNIT_DEBUGFS by default
    96b8b9d0dead riscv: mm: Fixup no5lvl failure when vaddr is invalid
    f3216d930c0f riscv: errata: Fix bitwise vs logical AND in MIPS errata patching
    1aa01b46fe3b firmware: arm_ffa: Unregister bus notifier on teardown for FF-A v1.0
    07907b897bb7 firmware: arm_ffa: Fix per-vcpu self notifications handling in workqueue
    1418765d28ab firmware: arm_ffa: Skip free_pages on RX buffer alloc failure
    820245d86ce5 firmware: arm_ffa: Check for NULL FF-A ID table while driver registration
    4894847fcec1 HID: uclogic: Fix regression of input name assignment
    e912d5dc0096 HID: intel-thc-hid: Intel-quickspi: Fix some error codes
    1fce9dcb3a66 pinctrl: qcom: Fix GPIO to PDC wake irq map for qcs615
    e917713f0134 pinctrl: meson: amlogic-a4: fix deadlock issue
    8d1c6b603327 pinctrl: renesas: rzg2l: Fix SMT register cache handling
    c4cfa8ee7737 pinctrl: renesas: rzg2l: Fix incorrect PUPD register offset for high pins during suspend/resume
    a7fee1322683 ARM: dts: renesas: rskrza1: Drop superfluous cells
    d27b29e474a6 ARM: dts: renesas: genmai: Drop superfluous cells
    00aca89f5e34 pinctrl: qcom: ipq4019: mark gpio as a GPIO pin function
    eb3cd9bb5904 hwmon: (pmbus/adm1266) reject short block-read responses in the GPIO accessors
    dd12c6dbe2ac hwmon: (pmbus/adm1266) register the nvmem device after pmbus_do_probe()
    a203125c0e81 hwmon: (pmbus/adm1266) register the gpio_chip after pmbus_do_probe()
    b2998ae90331 hwmon: (pmbus/adm1266) don't clobber GPIO bits before PDIO read in get_multiple
    fa7ca363069a hwmon: (pmbus/adm1266) cap PDIO scan in get_multiple at ADM1266_PDIO_NR
    97a9cf2a8217 hwmon: (pmbus/adm1266) bounce blackbox records through a protocol-sized buffer
    2279c342d94e hwmon: (pmbus/adm1266) include PEC byte in pmbus_block_xfer read buffer
    75c862adf3d3 hwmon: (pmbus/adm1266) reject implausible blackbox record_count
    e9b8f85daebf hwmon: (pmbus/adm1266) seed timestamp from the real-time clock
    e37dbe150515 batman-adv: tt: prevent TVLV entry number overflow
    730de8733dd9 batman-adv: tt: fix negative tt_buff_len
    179eb62506a0 batman-adv: tt: fix negative last_changeset_len
    b93ca6012712 batman-adv: tt: avoid empty VLAN responses
    7cac9c9ef4b7 batman-adv: tt: reject oversized local TVLV buffers
    4cc85aec8d3c batman-adv: tt: fix TOCTOU race for reported vlans
    2d2d365d0b9d batman-adv: tp_meter: avoid role confusion in tp_list
    72d670d7a492 batman-adv: tp_meter: fix race condition in send error reporting
    b285bc0a97f4 batman-adv: tp_meter: fix tp_vars reference leak in receiver shutdown
    770bf0a35f06 batman-adv: tp_meter: directly shut down timer on cleanup
    dc2ae5fbd2da batman-adv: tp_meter: avoid use of uninit sender vars
    6921a7683ae9 batman-adv: bla: avoid NULL-ptr deref for claim via dropped interface
    45384612f296 batman-adv: bla: avoid double decrement of bla.num_requests
    c6de1a5a9c40 batman-adv: bla: fix report_work leak on backbone_gw purge
    5895ad21c705 batman-adv: frag: disallow unicast fragment in fragment
    90ae3eae06b7 batman-adv: fix tp_meter counter underflow during shutdown
    3eb8bcb82339 batman-adv: fix fragment reassembly length accounting
    9cceea8eeba7 batman-adv: dat: handle forward allocation error
    ae7aeb0ce3c0 batman-adv: clear current gateway during teardown
    8a3707653ab6 batman-adv: mcast: fix use-after-free in orig_node RCU release
    ca3ff3d2a0af batman-adv: iv: recover OGM scheduling after forward packet error
    ede47988ac56 batman-adv: tvlv: reject oversized TVLV packets
    23d4ce84df4d batman-adv: tvlv: abort OGM send on tvlv append failure
    1be1e99cbd5b batman-adv: v: stop OGMv2 on disabled interface
    1ecde19bfce6 drm/amd/display: Validate payload length and link_index in dc_process_dmub_aux_transfer_async
    7ca695b31222 drm/amd/display: Validate GPIO pin LUT table size before iterating
    6bbd703ea1c1 drm/amd/display: Fix integer overflow in bios_get_image()
    d35563813296 drm/bridge: megachips: remove bridge when irq request fails
    95306db11956 drm/bridge: it66121: acquire reset GPIO in probe
    3ed448c1dc78 drm/amdgpu/vpe: Force collaborate sync after TRAP
    8fadd01cf461 drm/virtio: use uninterruptible resv lock for plane updates
    35671087a272 drm/v3d: Release indirect CSD GEM reference on CPU job free
    0f8efc45740b drm/v3d: Fix use-after-free of CPU job query arrays on error path
    942968260e61 drm/msm: Fix shrinker deadlock
    508fd8ab158a device property: set fwnode->secondary to NULL in fwnode_init()
    22d9b9739b8e LoongArch: Remove unused code to avoid build warning
    f27a3b9aadfb LoongArch: kprobes: Use larch_insn_text_copy() to patch instructions
    9e3f18883a98 fwctl: pds: Validate RPC input size before parsing
    1012896f4225 RDMA/siw: Reject MPA FPDU length underflow before signed receive math
    d7a076fb596c spi: ti-qspi: fix use-after-free after DMA setup failure
    be409d2bbe9c spi: sprd: fix error pointer deref after DMA setup failure
    8e027db9fa31 spi: ep93xx: fix error pointer deref after DMA setup failure
    b9ff86310062 scsi: isci: Fix use-after-free in device removal path
    78a369a065f1 phy: qcom-qmp-ufs: Fix kaanapali PHY PLL lock failure after SM8650 G4 fix
    58f4a7bd8d73 phy: tegra: xusb: Fix per-pad high-speed termination calibration
    a1f50f5aaa69 phy: exynos5-usbdrd: fix USB 2.0 HS PHY tuning values for Exynos7870
    4bb4764f2c51 spi: qup: fix error pointer deref after DMA setup failure
    ecdf21536c6d drm/bridge: chipone-icn6211: use devm_drm_bridge_add in i2c probe
    bee400ad4f42 virt: sev-guest: Explicitly leak pages in unknown state
    4f087193b5ff riscv: kvm: return SBI_ERR_FAILURE for pmu_event_info() when OOM
    77071943c752 riscv: kvm: return SBI_ERR_FAILURE for pmu_snapshot_set_shmem() when OOM
    94ade38f317e KVM: SVM: Disable AVIC IPI virtualization on Hygon Family 18h (erratum #1235)
    7023900b4988 KVM: arm64: vgic: Free private_irqs when init fails after allocation
    0680f5119265 KVM: arm64: vgic-its: Reject restored DTE with out-of-range num_eventid_bits
    240373425e2d arm64: probes: Handle probes on hinted conditional branch instructions
    798183376d9d tracing: Do not call map->ops->elt_free() if elt_alloc() fails
    5e7d9d0805e5 cifs: Fix busy dentry used after unmounting
    2dd9304727c7 wifi: mac80211: consume only present negotiated TTLM maps
    acdff9907478 af_unix: Fix UAF read of tail->len in unix_stream_data_wait()
    6cfae4914439 wifi: cfg80211: advance loop vars in cfg80211_merge_profile()
    50884c2afd7a ice: restore PTP Rx timestamp config after ethtool set-channels
    0b9431b972a0 ice: fix setting promisc mode while adding VID filter
    9c9d00d81b41 ice: fix locking around wait_event_interruptible_locked_irq
    f1bafd35f11b igc: fix potential skb leak in igc_fpe_xmit_smd_frame()
    8864b664d044 octeontx2-pf: fix double free in rvu_rep_rsrc_init()
    47a4cf2229be octeontx2-af: CGX: add bounds check to cgx_speed_mbps index
    5b906f31e977 lsm: hold cred_guard_mutex for lsm_set_self_attr()
    9dcd4f5c99b4 rbd: eliminate a race in lock_dwork draining on unmap
    dfef79e09ed2 ixgbevf: fix use-after-free in VEPA multicast source pruning
    7725cd3b4717 ipv4: raw: reject IP_HDRINCL packets with ihl < 5
    dc31c6947652 wifi: iwlwifi: mld: stop TX during firmware restart
    6fe92651b44f wifi: iwlwifi: mvm: fix driver-set TX rates on old devices
    614cacec60fe wifi: ath11k: clear shared SRNG pointer state on restart
    a3529032afe2 ice: fix VF queue configuration with low MTU values
    c618cf8926c0 vsock/virtio: reset connection on receiving queue overflow
    440447699c68 vsock/vmci: fix UAF when peer resets connection during handshake
    29b643351012 mptcp: pm: fix ADD_ADDR timer infinite retry on option space insufficient
    abdd03229414 ipv6: ioam: add NULL check for idev in ipv6_hop_ioam()
    2bc60c175568 ring-buffer: Flush and stop persistent ring buffer on panic
    610ff6bc2f44 ring-buffer: Fix reporting of missed events in iterator
    0e47fc1c9181 qed: fix double free in qed_cxt_tables_alloc()
    e0c3dd7b30cc l2tp: use list_del_rcu in l2tp_session_unhash
    d73dcd1520d6 fs/ntfs3: handle attr_set_size() errors when truncating files
    358692462555 net: ethtool: phy: avoid NULL deref when PHY driver is unbound
    61f53c1e58d6 net: ethtool: fix NULL pointer dereference in phy_reply_size
    752ea4a105e6 cgroup/cpuset: Reset DL migration state on can_attach() failure
    1aed73795392 tracing/fprobe: Check the same type fprobe on table as the unregistered one
    f0ad68d2f0ad tracing/fprobe: Avoid kcalloc() in rcu_read_lock section
    bb92f356d2b7 tracing: fprobe: use ftrace if CONFIG_DYNAMIC_FTRACE_WITH_ARGS
    52cc572c9565 tracing: fprobe: Remove unused local variable
    45c7c4e3db8b sched_ext: Avoid UAF in scx_root_enable_workfn() init failure path
    6e73ec10b2a3 sched_ext: Fix missing warning in scx_set_task_state() default case
    689bbf48c1f4 netfilter: nft_inner: Fix IPv6 inner_thoff desync
    952e988163c2 netfilter: ipset: stop hash:* range iteration at end
    15d464265120 netfilter: nf_queue: hold bridge skb->dev while queued
    57b0ac5e1b46 netfilter: ip6t_hbh: reject oversized option lists
    dac025c4e8f9 net: pse-pd: fix sign on -ENOENT check in of_load_pse_pis()
    f8a5a76b4a68 net: ifb: report ethtool stats over num_tx_queues
    1604a2d68414 net/mlx5e: Fix use-after-free in mlx5e_tx_reporter_timeout_recover
    49eff79967fd net: phy: skip EEE advertisement write when autoneg is disabled
    3d4ef05266ab net: bcmgenet: keep RBUF EEE/PM disabled
    84bc87beb4cd phonet/pep: disable BH around forwarded sk_receive_skb()
    8b4c412e001b Bluetooth: serialize accept_q access
    f1febe93ef07 Bluetooth: MGMT: validate Add Extended Advertising Data length
    051922ab709c Bluetooth: L2CAP: ecred_reconfigure: send packed pdu, not stack pointer
    192cb0f1ca70 Bluetooth: hci_uart: fix UAFs and race conditions in close and init paths
    5506aec79513 Bluetooth: bnep: Fix UAF read of dev->name
    61f2410a96de Bluetooth: ISO: drop ISO_END frames received without prior ISO_START
    added1213395 Bluetooth: fix UAF in l2cap_sock_cleanup_listen() vs l2cap_conn_del()
    ffb6dbb49c96 net: wwan: iosm: fix potential memory leaks in ipc_imem_init()
    0fa24311bd42 selftests/mm: run_vmtests.sh: fix destructive tests invocation
    738d18f1da35 mm/page_alloc: fix initialization of tags of the huge zero folio with init_on_free
    09ce923071e7 mm/memory_hotplug: fix memory block reference leak on remove
    62153767e8fc mm: fix __vm_normal_page() to handle missing support for pmd_special()/pud_special()
    2fff0cdd9422 mm/memory: fix spurious warning when unmapping device-private/exclusive pages
    24de676da63c ipv6: ioam: refresh hdr pointer before ioam6_event()
    24840b3139d7 drivers/base/memory: fix memory block reference leak in poison accounting
    b737c6612c60 io_uring/waitid: clear waitid info before copying it to userspace
    5fb947ddae55 spi: amd: Set correct bus number in ACPI probe path
    c32a1fbe0f9a efi: Allocate runtime workqueue before ACPI init
    fcbd0a5fd812 ALSA: scarlett2: Allow flash writes ending at segment boundary
    61c5017c64e2 ALSA: asihpi: Fix potential OOB array access at reading cache
    feff0251386a ALSA: pcm: Don't setup bogus iov_iter for silencing
    cba8dab72e9b ALSA: ua101: Reject too-short USB descriptors
    ca560f7566df hwmon: (pmbus/adm1266) widen blackbox-info buffer to I2C_SMBUS_BLOCK_MAX
    9803e75c9813 smb/server: promote S_DEL_ON_CLS to S_DEL_PENDING when close
    d65104a4a815 smb: client: use data_len for SMB2 READ encrypted folioq copy
    bf4ebdb19ff9 smb: client: protect tc_count increment in smb2_find_smb_sess_tcon_unlocked()
    a8d17d22db59 smb: client: require net admin for CIFS SWN netlink
    6827647fd2dc regulator: tps65219: fix irq_data.rdev not being assigned
    18d8db24b0a5 ksmbd: validate SID in parent security descriptor during ACL inheritance
    0e198f09cb2a ksmbd: fix SID memory leak in set_posix_acl_entries_dacl() on overflow
    cd5c1b75d2f4 ksmbd: fix null pointer dereference in compare_guid_key()
    302e02f9ba49 mm/damon/sysfs-schemes: call missing mem_cgroup_iter_break()
    48fa96538bd2 sysfs: don't remove existing directory on update failure
    141ffb83abe9 drm/vblank: Fix kernel docs for vblank timer
    ed39ecd3a96c drm/atomic: Increase timeout in drm_atomic_helper_wait_for_vblanks()
    a0582cc92398 drm/vkms: Convert to DRM's vblank timer
    60918357456d drm/vblank: Add CRTC helpers for simple use cases
    fa4b91eea433 drm/vblank: Add vblank timer
    18a08b87db71 Revert "ice: Remove jumbo_remove step from TX path"
    523cd0ea0324 Revert "ice: fix double-free of tx_buf skb"
    515de0a3b6c1 ata: libata-scsi: do not needlessly defer commands when using PMP with FBS
    4e6eada8de38 ata: libata-scsi: do not use the deferred QC feature on PMPs with CBS
    f207ebd5656e ata: libata-scsi: do not use the deferred QC feature for ATA_DEFER_PORT
    62ee00c1042c ata: libata-scsi: improve readability of ata_scsi_qc_issue()
    9d11e4b1db1c mfd: bcm2835-pm: Add support for BCM2712
    ed915823d469 arm64: dts: broadcom: bcm2712: Add watchdog DT node
    375d5a17dc8d dt-bindings: soc: bcm: Add bcm2712 compatible
    91f89c1d83e8 smb: client: reject userspace cifs.spnego descriptions
    5da69a65b282 ksmbd: close durable scavenger races against m_fp_list lookups
    aae4a47073b1 spi: spi-dw-dma: fix print error log when wait finish transaction
    e8ec80430bfa bridge: mrp: reject zero test interval to avoid OOM panic
    0638bf16b7a7 sched/deadline: Fix missing ENQUEUE_REPLENISH during PI de-boosting
    3f0543bdf446 sched: Employ sched_change guards
    dc184ac2f0ba cxl/mbox: validate payload size before accessing contents in cxl_payload_from_user_allowed()
    da3d241c5b92 fuse: fix uninit-value in fuse_dentry_revalidate()
    488d2c76bd9f iommu/amd: Remove latent out-of-bounds access in IOMMU debugfs
    b9a4184271b9 iommu/amd: Fix illegal cap/mmio access in IOMMU debugfs
    814326e86e92 drm/xe/hdcp: Add NULL check for media_gt in intel_hdcp_gsc_check_status()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
index ec18aba..90e7c10 100644
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
@@ -8,4 +8,4 @@ KMACHINE:genericx86 ?= "common-pc"
 KMACHINE:genericx86-64 ?= "common-pc-64"
 
 KBRANCH:genericarm64 ?= "v6.18/standard/genericarm64"
-SRCREV_machine:genericarm64 ?= "6bf211598fd7bc81856d3d84b0cc610e2bbe81db"
+SRCREV_machine:genericarm64 ?= "3bf75f8b9c97212d54aac12c3575b42cc504b4d8"
-- 
2.43.0


