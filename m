Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 677F8CA5FA1
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 07:44:08 +0000 (UTC)
Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32865.1790495042504978410
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 00:44:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=amFEDwLa;
 spf=pass (domain: smile.fr, ip: 74.125.225.99, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887f6cf16bso1182766f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 00:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790495041; x=1791099841; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2xay+aHKIbBgQqlQ24JH+yjKQ7mYaiBL+m7p7dVDx9U=;
        b=amFEDwLaFFb0xlY4HKMEev+Ep4th5mWpjdyqxGXzJ7tl2qMk8bioLhw76zSg+acv+y
         a5jVdGZ9B20XJOX+K3Oe0WqdaBn00PB6qCVtC37gtGGvVjAlFK0gtYD+BraprHNu+fvC
         tpe62+YufmYqEOBPJKDqDO/W/prqwWyipweBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790495041; x=1791099841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2xay+aHKIbBgQqlQ24JH+yjKQ7mYaiBL+m7p7dVDx9U=;
        b=OvSPxBUBe5eWLAyDopMrjhN7Axguu2TpFAPyiPcZdgVExl0rnFTYUy8u+2PR38zfyf
         kGikMSyfMki+mj6LGhwDHe2zisZH27IAk/ueov2IHNkacByXIIKt0D/hKza3n0xVI4z/
         jpg7SvB2FX7I4S61trwcHezIwImmV6NtL1NfyPdeVrl+p0jxG2MXGyB20jx8IDUR/qqP
         gkbtf1gb85ePd0ViUUEjTLu+WYgNm1sOX8ipdbewjP0gTxOd7o5zAC0PEiPAYIRF+d3A
         6RWwU7r1ljeYOyxVFAWN8myuusAvDJD3aAZKLf6JBhn/NpbYzTmq+eDH+Xd0DhmiUDBE
         CN9g==
X-Gm-Message-State: AFq9FYKpsqImlsmxsqYlyaCD1OXc+cPphRoWW5ibYTF8HkM0UGHbkKwS
	lDSOUHRXUY9jA3odk1uCj3EdpFHC8tNVGQGQ73yIF3scJVRUk+yGwdqQLE71/HUJEoVQp5bb/CU
	fuoerw+Y=
X-Gm-Gg: AYBFou3m0WXhWYURXK/sEMtF+OeyiLgONgflJ4zF76lv3hO+VRgmn1C4Sar++2OBPCX
	nXuFdPjRiM2IIwaIQDutEKVts1ajx4OhtskG/KIhLR0mpY076eldnUEFpm51A4s7P9b0WzxMkHe
	hFuxQPfPWb8c321WbsJdXX+GFT8FV1iGQ/TK3AWzvBHMNlhhbaRY1PWv2DwWop2dX3kNVRcCk9B
	EpLKh97cUg2/1M2G+9Ea6UASi73yN52wgWresCB8WoOjod/TDHjgPrgiD6qWVRyqVu3nncAOwY+
	Kl/gBtp57lA10NA1EpGu9v9acddMbDEgj74njNpJFMrpLpVnB/F0582dX3zVILl8U7ASI3PP1aK
	HWfGPC5apfCpEVgqc080OUHjZ82guxnxb/yLZvu+SVYTahC9WMmB+JC+cIHxEXIu8ANToXFFE/x
	nTj5U+E+z/SByQ2jeRC46xQIeI6YIioKS0SV5o7f8DRIl8Uk4KgzgED/nEKriXDGwAWlkPKQn6c
	UMigg+Gz0O16moJX8J/1Dr54JG68+sMP3mHcZ7xCE/EBaZHzjiQQecbBnsUXN/0+5ezghXGOQ==
X-Received: by 2002:adf:e005:0:20b0:488:8212:5d73 with SMTP id ffacd0b85a97d-48882125f39mr7018821f8f.31.1790495039036;
        Sun, 27 Sep 2026 00:43:59 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30c43asm19821375f8f.3.2026.09.27.00.43.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:43:57 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 27/28] linux-yocto/6.18: update to v6.18.52
Date: Sun, 27 Sep 2026 09:43:18 +0200
Message-ID: <bb85a6605281221329df8a91b6e58b564a6e1df7.1790494949.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790494949.git.yoann.congal@smile.fr>
References: <cover.1790494949.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 07:44:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246678

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.18 to the latest korg -stable release that comprises
the following commits:

    8f3741e6feb04 Linux 6.18.52
    0d0c637410df6 wifi: mt76: fix airoha_npu dependency tracking
    637e0ea73f690 staging: rtl8723bs: rtw_mlme: add bounds checks before ie_length subtraction
    7d4024037ee30 staging: rtl8723bs: os_dep: avoid NULL pointer dereference in rtw_cbuf_alloc
    7bca33d6f6e00 pinctrl: airoha: an7583: add missed gpio22 pin group
    9aa021b63ab73 ACPI: processor: Add cpuidle driver check in acpi_processor_register_idle_driver()
    4ba887b2bacc8 ACPI: processor: idle: Remove redundant static variable and rename cstate check function
    e1cfb85ab258c ACPI: processor: idle: Move max_cstate update out of the loop
    fcc577939931a ACPI: processor: idle: Remove redundant cstate check in acpi_processor_power_init
    8ddc1da773644 cpufreq/amd-pstate: Allow writes to dynamic_epp when state isn't modified
    9c178eba1542a cpufreq/amd-pstate: Use "epp_default_dc" as default when dynamic_epp is disabled
    bf897a1fa96cb cpufreq/amd-pstate: Add support for raw EPP writes
    b461ae97f2e44 cpufreq/amd-pstate: Add static asserts for EPP indices
    8f8db9af24b9a cpufreq/amd-pstate: Fix some whitespace issues
    a3d24aed0a3e7 io_uring/waitid: fix KCSAN warning on io_waitid->head
    934ffdd1cdef2 io_uring/waitid: use io_waitid_remove_wq() consistently
    798283cd0fe7b net/sched: fq: clamp quantum and initial_quantum in change path
    9289c94fcfe04 Bluetooth: btmtk: hide unused btmtk_mt6639_devs[] array
    2151b2bcf6fce tcp: reject non zerocopy devmem tx
    384907f29dd1e ipmr: Add __rcu to netns_ipv4.mrt.
    7708973e268c4 ipmr: Call ipmr_fib_lookup() under RCU.
    5029156b99bd9 erofs: fix EFSCORRUPTED on multi-algorithm images in z_erofs_map_sanity_check()
    a295f239dee45 erofs: relax sanity check for tail pclusters due to ztailpacking
    bf8601feeb469 block: fix merging data-less bios
    43a4c2afcb5ab blk-mq-dma: always initialize dma state
    f54f709bfb5e4 block: save page offset gaps in cloned bio
    0268313b5de3e integrity: Eliminate weak definition of arch_get_secureboot()
    60aee9cbb82e0 apparmor: fix kernel-doc comments for inview
    caf1e44e672b5 pinctrl: airoha: an7581: fix incorrect led mapping in phy4_led1 pin function
    0ca274a45eaea pinctrl: airoha: Fix AIROHA_PINCTRL_CONFS_DRIVE_E2 in an7583_pinctrl_match_data
    2e7c3c433fd79 pinctrl: airoha: an7583: add missed gpio32 pin group
    46bae3189cf5c pinctrl: airoha: an7583: fix misprint in gpio19 pinconf
    591424f9f5d51 pinctrl: airoha: an7583: fix incorrect led mapping in phy4_led1 pin function
    cf2e698957b65 pinctrl: airoha: an7583: fix gpio21 pin group
    6d0bcb2153128 pinctrl: airoha: an7583: fix phy1_led1 pin function
    5331bf0d5ca05 pinctrl: airoha: an7583: remove undefined groups from pcm_spi pin function
    fc00a596268a0 phy: renesas: rcar-gen3-usb2: add regulator dependency
    e97bd4417010c perf annotate: Fix build with NO_SLANG=1
    fe44ae31ca78a wifi: nl80211: fix UHR capability validation
    3ca32b70e825f wifi: mt76: npu: Add missing rx_token_size initialization
    b0af766d64bc2 wifi: mt76: restrict NPU/PPE active checks to MMIO devices
    15a9acc5e6553 s390/kexec: Disable stack protector in s390_reset_system()
    adf8f940e450d selftests: vDSO: getrandom: Fix path to s390 chacha implementation
    dffea40a832bb cpufreq/amd-pstate: Fix setting EPP in performance mode
    3b4b39f8bfb9b cpufreq/amd-pstate: Add POWER_SUPPLY select for dynamic EPP
    c6584e98b60ee cpufreq/amd-pstate: Grab "amd_pstate_driver_lock" when toggling dynamic_epp
    eee67e91751e0 cpufreq/amd-pstate: Return -ENOMEM on failure to allocate profile_name
    c9d79e27eaefb cpufreq/amd-pstate: Reorder notifier unregistration and floor perf reset
    70c8c8b50d80f cpufreq/amd-pstate: handle missing policy in dynamic EPP callbacks
    be5d0964da97f usb: ucsi: huawei_gaokun: move typec_altmode off stack
    65d97c3d9060f serial: 8250: Ignore flow control on suspend/resume with no_console_suspend
    a79848859b1a8 platform/x86: lg-laptop: Check ACPI_COMPANION() against NULL
    bd8946ddbe9a3 perf tests kvm: Avoid leaving perf.data.guest file around
    3641a3aed2ecc tracing: Move d_max_latency out of CONFIG_FSNOTIFY protection
    3e3fb150abad9 mtd: rawnand: pl353: Fix debug prints
    9988c1c9e0d1c dm-integrity: fix buffer overflow with keyed discard
    e54be9aa503a0 net/sched: sch_htb: limit htb_classify inner-class filter hops
    b8f08a94b2a4a tcp: fix corruption of urgent data on multi-segment retransmit
    ff7f77a234f7b usb: atm: usbatm: fix invalid ci_range initialization
    1f9639caeece7 net: fec: only stop PTP if it was initialized
    ddbc5dc5a2e29 slip: remove slip_hangup() to fix use-after-free in slip_receive_buf()
    1a5c26e586481 net/sched: bound qdisc_pkt_len to prevent qdisc soft lockup
    2ea42936416b2 net: stmmac: restore NET_IP_ALIGN in the RX DMA offset
    6257ec22f6173 net: stmmac: selftests: Account for the UC filter list for filtering tests
    f09abff67d1f2 net: stmmac: dwxgmac: Account for the primary MAC address for UC filtering
    edce4b5a76dd7 net: stmmac: dwmac4: Account for the primary MAC address for UC filtering
    f64902e8ae1fa net: stmmac: dwmac1000: Account for the primary MAC address for UC filtering
    57f598f312f91 net: stmmac: selftests: Check multiple MMC counters
    66cfb39635529 net: airoha: npu: fix missing streaming DMA mask
    99036078abd96 selftests/arm64: Fix MTE prctl TAP plan
    d3bb129dad152 selftests/arm64: Treat KSM merge_across_nodes as optional
    1c6940784c556 selftests/arm64: Print missing MTE TAP headers
    2f0c97b1a32fb ALSA: control: Don't add invalid kcontrols to LED layer
    67dd5a6c449b4 netfilter: x_tables: replace pr_{info,err}() by pr_info_ratelimited()
    3b1066a859dbb netfilter: xt_HL: add pr_fmt and checkentry validation
    d5497644329d3 netfilter: nf_tables: move hardware offload step after building the chain blob
    0e5ed3b98d1d8 virtio-net: Ensure that TCP packets don't overflow gso_segs
    023f06c98e031 drm/xe/xe_gt_idle: Add CCS to the powergating info print
    c826e980f2767 net: stmmac: selftests: Pass the IP proto mask in the TC selftest
    30be8c9d598f3 net: wangxun: use BIT_ULL() to prevent shift overflow on 32-bit archs
    84180988a455f net/smc: release the internal TCP sock on IPPROTO_SMC socket creation failure
    557599edb522a net: ethernet: sun4i-emac: Fix IRQ error handling
    626614df9080d samples/ftrace: Fix kthread_stop() on ERR_PTR in ftrace-direct-multi-modify
    8de8e5476be39 samples/ftrace: Fix kthread_stop() on ERR_PTR in ftrace-direct-modify
    6d1c6f228854a libceph: validate banner payload length
    792bfe803228c ceph: revalidate ki_pos for O_APPEND writes after cap acquisition
    33b3dc47202d0 ceph: Fix ERR_PTR(0) in ceph_mkdir()
    10a36512c21f8 ASoC: dapm: Fix off-by-one check on the second enum channel
    5449f715f24e8 apparmor: policy_int make sure list heads are initialized before fail path
    59fba1d249dce apparmor: Replace sprintf/strcpy with scnprintf/strscpy in aa_policy_init
    d48197cbd5d34 crypto: acomp - allocate async request context when cloning
    fdc992f4bc45f tpm: st33zp24: Validate locality read result
    14feaa498c20c tpm: st33zp24: Return zero on status read failure
    96bc345a3f175 net/sched: sch_teql: restore skb->dev on the slave failure path
    aeb8196ecb951 net/sched: sfq: clamp quantum to avoid signed overflow soft lockup
    99770b5d8e0e1 net/sched: hhf: clamp quantum before hhf_change() to avoid overflow
    044fa2498bbc2 net/sched: fq_pie: clamp default quantum to avoid signed overflow
    7ca8a8717a9fe net/sched: sch_codel: clamp default mtu to avoid disabling CoDel
    dfb4b61db8869 net/sched: fq_codel: clamp default quantum and mtu
    f6b3e3848a5fc net/sched: fq: add overflow bounds to quantum and initial quantum
    76c847e80d2b6 net: fix a resource leak in copy_net_ns() error handling path
    d1c084d4e9f03 net: core: check skb_frags_readable before uncloning in skb_copy_ubufs
    1719865b20b22 net/sched: act_skbmod: fix length calculations and avoid invalid header warnings
    3e07d284ef085 selftests/proc: make proc-maps-race work with READ_IMPLIES_EXEC
    4e70c064213ef maple_tree: fix argument name in header
    64ae85a3a29de maple_tree: catch race in mas_alloc_cyclic()
    005343e0c3294 selftests/mm: skip COW tmpfile cases when fallocate() is unsupported
    3d1b2d84b4909 cifs: fix clearing stats for fastest execution of each smb2 command
    b003d5b4e46ca octeontx2-pf: fix NULL deref of af_xdp_zc_qidx on rep setup
    bf2b8130723ef net/rds: use wq_has_sleeper() in rds_cong_map_updated()
    d218ea7df6eba net/sched: act_ife: Only operate on Ethernet frames
    936e33035d54d net/sched: add qstats_cpu_drop_inc() helper
    ab8e0164c0fee net: enetc: restore RX ring congestion mode after ring reconfiguration
    276e747373170 octeontx2-af: Fix TL3/TL2 link config ENA clearing
    7abe769e72c79 net: qualcomm: rmnet: restore skb->dev on deaggregated frames
    42a139332ce81 octeontx2-vf: fix workqueue and netdev race in probe/remove
    537e11a1700f6 octeontx2-af: fix NULL deref in NIX TM tree debugfs read path
    7677eb2cbf2cc gtp: add synchronize_net() in gtp_newlink() error path to prevent use-after-free
    53a5b262d706b xsk: honor XDP_TX_METADATA in zero-copy path
    5b913e87af4b2 xsk: align TX metadata layout across ABIs
    aeee917a4878a Bluetooth: RFCOMM: Validate MTU in rfcomm_apply_pn() to prevent infinite loop
    a644b8df94966 Bluetooth: btnxpuart: Validate the FW dump header length
    7b37556d7d801 Bluetooth: btmtksdio: Fix out-of-bounds DMA read in the TX path
    566da1197d340 Bluetooth: btmtksdio: Take exclusive ownership of the SKB before TX
    3818502f2f69d Bluetooth: btmtk: Do not discard the subsystem reset timeout
    f3465a143c87c Bluetooth: btmtk: Do not report success when subsys reset fails
    9fc4fd78bc650 Bluetooth: btmtk: Fix short read errors in btmtk_usb_reg_read()
    5a2cb90e23587 Bluetooth: btmtk: Add MT6639 (MT7927) Bluetooth support
    61d5ddbd524c7 Bluetooth: L2CAP: fix race l2cap_sock_cleanup_listen() vs. put_chan
    c3f63610bceaa Bluetooth: mgmt: fix 'hdev->discovery.uuids' NULL dereference
    87276dc15b559 Bluetooth: L2CAP: reject accept queue add unless BT_LISTEN
    00a73ce437e27 arm64: process: Fix context switching MTE store-only tag check
    4a888ccb33d0c arm64: ptdump: Make note_page_flush() range aware
    f365f36bbb5ac erofs: Fix EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS default logic
    f30c8905abdae scsi: qla2xxx: Fix an loop timeout test
    aa17842bbccae Drivers: hv: vmbus: Skip VMBus module cleanup for non-nested root partition
    ff422b8597c28 syscore: Pass context data to callbacks
    f7914ff92e4aa net_sched: sch_fq: fix pacing delay underflow with pacing offload
    9c5d7bdb29ef1 net: page_pool: Remove zone/policy GFP flags when allocating XArray entries
    b9838b655b708 net: libwx: fix concurrent bitmap overwrite in PTP setup
    a13a63558e5c8 net: txgbe: fix MISC interrupt unmasking in non-MSI-X mode and device shutdown
    38fa06f9ccccc net: wangxun: introduce WX_STATE_DOWN to serialize device shutdown state
    6bf50b58f40d0 net: wangxun: schedule hardware stats update in watchdog
    b1d311224479e net: wangxun: replace busy-wait reset flag with kernel mutex
    71adad90236b1 net: txgbe: support RSC offload
    80fd6d42f07ce net: txgbe: support RX desc merge mode
    51fe3fe0ffec0 ptp: netc: fix period truncation and potential divide-by-zero in PEROUT
    430afa27beb92 bnxt_en: Gate TPH enablement behind BNXT_SUPPORTS_QUEUE_API check
    001ff5d8e68aa bnxt_en: Fix call to hardware monitoring event handler
    012bebc861106 rtc: pcf85363: Add error checking to regmap calls in probe()
    27f640cd92eeb NFSv4/pnfs: key the data server cache on the NFS version
    3815b894b922e NFSv4.2: fix LAYOUTSTATS send buffer exhaustion
    0879ea157acc1 net/smc: free pending qentry in smc_llc_flow_stop() before memset
    0fb9a51376607 net/smc: free stashed qentry before overwrite in REQ_ADD_LINK to ADD_LINK transition
    8b2d8c70b969b net: sched: fix 32-bit backlog wrap in gred, bfifo and plug enqueue
    220cfdb17ff6a net: tcp: block mixing readable and unreadable frags
    857681f6835d5 inetpeer: randomize RB-tree node comparison using SipHash
    c7f9740f7a1b2 ip6mr: plug drop_reason to ip6mr_cache_report()
    38778f6abdbda ipmr: Free mr_table after RCU grace period.
    65f87de5f3c3b net: change sock_queue_rcv_skb_reason() to return a drop_reason
    84264cb4e541f ipmr: Remove RTNL in ipmr_rules_init() and ipmr_net_init().
    53eefb9db0b27 ipmr: Convert ipmr_net_exit_batch() to ->exit_rtnl().
    b30f0801b9187 ipmr: Move unregister_netdevice_many() out of ipmr_free_table().
    4012a0656797d ipmr: Move unregister_netdevice_many() out of mroute_clean_tables().
    4be733a450c86 net: qlcnic: validate unified ROM sections before loading
    bf87e4c1e58a0 net: add missing ref_tracker_dir_exit() to net_passive_dec()
    f30cf8fd98722 ipv6: avoid divide by zero in rt6_multipath_rebalance
    b8f32b0804b4b netdevsim: update queue NAPI association on queue reset
    9d7b6916d5f85 net: ipa: balance runtime PM reference on remove error
    5a66873d04b0f forcedeth: stop the tx_timeout register dump past the requested window
    bcf88c039af86 net/mlx5: E-Switch, preserve max tx speed on vport state modification
    38354e591e3ef net/mlx5: Move vport DOWN state check out of mlx5_query_vport_max_tx_speed()
    55d18f3ead831 net/mlx5: Skip disabled vports when setting max TX speed
    6f4adc05c788d RDMA/mlx5: Implement query_port_speed callback
    9137881591f22 IB/core: Add query_port_speed verb
    0864bab42677c IB/core: Add helper to convert port attributes to data rate
    361dfb9322fdc net/mlx5: Add support for querying bond speed
    70cd46d12d7cc net/mlx5: Handle port and vport speed change events in MPESW
    e59b430283455 net/mlx5: E-Switch, use state lock for vport state changes
    99300ea5c4365 net/mlx5: Propagate LAG effective max_tx_speed to vports
    409dc14183ad1 net/mlx5: Add max_tx_speed and its CAP bit to IFC
    4d3fb6977248d net/mlx5: E-Switch, support eswitch inactive mode
    ed246bad28d4e net/mlx5: MPFS, add support for dynamic enable/disable
    01677786ed4f0 devlink: Introduce switchdev_inactive eswitch mode
    ec750e1f82385 net: thunderbolt: Count delivered packets in rx_packets and rx_bytes
    ac2201b484822 net/sched: add get_fill_size callbacks for actions missing them
    c0444d7499f11 net: bridge: Reject descending VLAN tunnel ranges
    214fb79b0379c xsk: fix NULL pointer dereference in __xsk_rcv()
    4585691b28614 xsk: avoid double checking against rx queue being full
    5f02599590a4e irqchip/irq-realtek-rtl: Use readl_be()/writel_be() instead of readl()/writel()
    5aa7bbe0bac89 irqchip/irq-realtek-rtl: Add mask for interrupt handling
    2aa9fcf31f387 irqchip/irq-realtek-rtl: Add interrupt data structure
    421615e833d73 irqchip/irq-realtek-rtl: Split out parent setup code
    f7d818afcc225 irqchip/irq-realtek-rtl: Add multicore support
    a9be529935266 irqchip/irq-realtek-rtl: Add/simplify register helpers
    94834742ef195 smb: server: remove unused DES crypto header
    72a3e6e0c8248 smb: server: Remove obsolete "select CRYPTO_LIB_DES" from Kconfig file
    392c985c6b03d ALSA: mtpav: shut down output timer before card teardown
    bfce0f324efaa spi: amlogic-spisg: Make sure clk_init_data is fully initialized
    4d99a477e61fc RDMA/ucma: Allow path records to exactly fit the output buffer
    b15782627b656 ALSA: ice1712: Fix the card leak at probe error with the auto-cleanup
    735384a9dd599 ALSA: core: Add scoped cleanup helper for card references
    dca93566f0e20 irqchip/gic-v5: Use logical cpu 0 irs_data for dynamic IST allocation
    265fdce1efb1b irqchip/gic-v5: Fix gicv5_init_common() error paths
    76ed544059cae irqchip/gic-v5: Check for NULL LPI domain on domain teardown
    099772e948cc7 irqchip/gic-v5: Synchronize CPU interface disable
    8f7980033e9f7 clk: visconti: Make sure clk_init_data is fully initialized
    58c368552f830 clk: ti: Make sure clk_init_data is fully initialized
    41c2ccf0d740e prctl: fix PR_SET_MM_AUXV losing the forced AT_NULL terminator
    589f8d44c9dca lib/interval_tree: fix allocation warning messages
    5a8f18a7d3691 rtc: gamecube: check return value of devm_rtc_register_device()
    fdc4b500071a2 i2c: ocores: Disable clock on failed resume
    38c6831fefde0 irqchip/renesas-rzg2l: Fix loss of interrupt
    367dbc320b27d rtc: zynqmp: Return optional clock lookup errors
    dbaca07f78a82 cifs: remove dead size-update blocks in cifs_setattr_unix/nounix
    442c5f1358ced smb: client: fix request buffer leak in smb2_new_read_req()
    6fd823a8872dc rtc: spacemit: handle regmap_test_bits() error return
    08a59c28c2bdb rtc: pcf8563: fix clock provider leak on unbind
    28701b74c22d2 virtio: rtc: time out alarm requests
    6ca752850de3b vdpa/mlx5: fix wrong list iterated in add_direct_chain error path
    4d059e7af5e92 virtio_pci: fix wrong queue index for admin vq in intx path
    4f723111a852b vhost/net: fix clear_user start address in VHOST_GET_FEATURES_ARRAY
    6dd28e32f4d81 virtio_balloon: quiesce balloon work before device shutdown
    808b1751540dd virtio_balloon: factor out virtballoon_quiesce()
    0d7b20057d4fd virtio: add virtio_device_shutdown() helper
    68b726b3a01fb vdpa_sim: fix cleanup after worker creation failure
    8b3edaa10a303 virtio_balloon: disable indirect descriptors
    5fe03b5257095 net: add missing ref_tracker_dir_exit() to alloc_netdev_mqs()
    4f80425ad5a06 bonding: initialize err for empty target lists
    795e7b3a356e8 mlxbf-bootctl: fix the build error with FIELD_PREP()
    2c09cadec116e platform/x86/amd/hsmp: Reject negative power cap writes in hwmon
    ace1ba5fca0ab platform/x86: hp-bioscfg: fix password encoding bounds check
    4d35c6d698085 vsock: use sock_error() to consume sk_err after a failed connect
    36e5fa009f98a vsock: don't check the listener's sk_err in vsock_accept()
    06c95182234ae vsock: avoid timeout for non-blocking accept() with empty backlog
    df8f661b4f329 platform/x86: dell-wmi-sysman: Fix instance ID bounds
    3e8fe6503d0c1 net/smc: hash socket only after full initialisation in smc_sk_init()
    6ea95c886d703 8139cp: fix Rx and Tx not being disabled in cp_suspend
    3e6b705bc162f vxlan: mdb: Fix use-after-free in vxlan_mdb_flush()
    5f22943cd2c84 ALSA: hda: Fix connection list comparison in proc output
    a5129155ca9fb fuse: check for NULL root inode in fuse_fill_super_submount
    5559dd7888d2c soc: qcom: ubwc: Fix missing include
    aab1880058ac7 fs/ntfs3: validate ef->size covers the record's name and value
    74a83aa05f730 fs/ntfs3: fix out-of-bounds read in read_log_rec_buf()
    389bd349ddbcf cuse: wait for pending RCU callbacks on module exit
    fdb9cd16f8b6e net: bridge: vlan: fix inverted default vlan notification
    a34d2e0bfb74a tls: fix RX desync on overlapping skbs
    f3b6834c13edd net: dsa: mv88e6xxx: Fix PCS link check on CMODE read error
    daebc7064a1b4 vxlan: vnifilter: enforce exact length of GROUP/GROUP6 attributes
    4aed450adaee3 ipvs: fix integer overflow in ftp helper port/address parsing
    448f505e19241 f2fs: fix to avoid pinfile fragment on fragment:{block, segment} mode
    32ee27946f097 f2fs: cleanup w/ f2fs_need_rand_{blk, seg, seg_blk}
    dd5d8f4a9c67f f2fs:Fix incomplete search range in f2fs_get_victim when f2fs_need_rand_seg is enabled
    65702339b3e9f net: hsr: free learned nodes on device setup failure
    54bc96aeee050 pppox: drain queued packets on channel handoff
    fb511bf117edd net: dsa: b53: fix error propagation from b53_fdb_dump()
    292846223eadd net: kcm: Hold RCU read lock while running BPF parser
    31fbed0b409a6 ionic: fix completion descriptor access with 2x desc size
    3ec0225b9d750 ptp: netc: skip PEROUT disable if channel is not enabled
    00f1000a644e8 drm/xe: tests: fix error message in xe_migrate_sanity_test()
    e794cdc5c369c hinic3: Fix skb linearization mismatch and drop skb when skb_checksum_help() failed
    c0f208d8a5726 octeontx2-af: initialize lmac_bmap in rvu_mcs_set_lmac_bmap()
    ea7b35dcc9430 bpf, xdp: move offload check into dev_xdp_install()
    9e5e2ccc51dfc clk: ti: mux: resolve parent clocks by DT index, not by name
    9d4843f105125 clk: devres: fix cleanup in devm_clk_get_optional_enabled_with_rate()
    4c067f5ffb469 nfs: fix ENXIO on O_CREAT open of existing symlink over NFSv3
    d148a652d52fd NFSv4: Fix incorrect argument passed to nfs4_delete_lease() in nfs4_add_lease()
    163c16e01f53f NFSv4/flexfiles: fix NULL dereference for NFSv4.0 data servers
    1e1c36b206c65 pnfs/blocklayout: Fix device leaks on parse failure
    3f2387e8bfbc4 NFSv4: remove callback IDR entry on client allocation failure
    4c59aca79da0e nfs: refactor pNFS functions using clear_and_wake_up_bit
    8179b8a1d636b nfs: replace atomic bitops sequence with clear_and_wake_up_bit helper
    b967a595fb735 smb/server: fix session leak in ksmbd_session_register()
    a4a307d149327 ksmbd: bound smb_check_perm_dacl() ACE walks by DACL size
    a21597b5730bc ksmbd: disconnect on SMB3 decryption failure
    2bdbe00454200 bpf: Reject negative optlen in cgroup getsockopt hook
    be98f92fc2446 m68k: nfcon: Do not call console_is_registered() in nfcon_device()
    fe91c3f64a738 bpf: Disallow bpf_{g,s}etsockopt() in cgroup UNIX getname hooks
    64eec7314e289 erofs: fix unused pcluster_pools for higher page sizes
    7cf561843ed0a lwt_bpf: Restore reserved headroom after xmit program
    a3d6e590268ee erofs: guard on-disk algorithm IDs against Z_EROFS_COMPRESSION_MAX
    ddb7ea4fd99bf erofs: fix interlaced ztailpacking pclusters
    7f10dc9a7a496 erofs: error out obviously illegal extents in advance
    169f6633d2a35 erofs: clean up encoded map flags
    892048f595505 smb/server: preserve error status in smb2_handle_negotiate()
    b2d78c199dfd9 smb/server: fix invalid pointer dereference in ksmbd_stop_durable_scavenger()
    8461f27902727 smb/server: fix null-ptr-deref in ksmbd_ipc_tree_connect_request()
    a41a98ee16ae0 ksmbd: free preauth sessions on connection teardown
    9f37719d6be82 ksmbd: do not advertise unimplemented CA support
    0aa8f94bfd4d8 ksmbd: validate ipc response length before dereferencing its fields
    7a98c3b903b10 smb: server: fix leak of ksmbd_ipc_login_request_ext() returned buffer
    84c2d8e807ac4 ksmbd: Do not skip lock checks for single-byte ranges
    db141a5ebcb04 hwmon: (emc1403) Drop hysteresis for low limit temperature
    c38cc41bb9dc2 hwmon: (emc1403) Rely on subsystem locking
    86c1617b7d4b0 hwmon: (coretemp) Fix core_data leak on CPUs without PTS
    00cce5e457cb6 apparmor: fix deadlock in complain-mode change_hat
    4609e0e0be709 block: mtip32xx: synchronize ioctls with device removal
    7e3e5273fc9ec ublk: reject non-power-of-2 zone sizes in SET_PARAMS
    32456a8599557 null_blk: serialize configfs attribute updates with device setup
    65cae82fd3c39 null_blk: serialize configfs attribute stores with the lock
    3e35ad503386a null_blk: reject per-device queue resize for shared tag set
    b2437d37fcc31 null_blk: free zones array on device power-off
    2b59484ac1e64 null_blk: free global tag_set on init error path
    d761be1b8f2bb null_blk: register configfs subsystem after creating default devices
    c7dea90c9b4ef null_blk: use DEFINE_MUTEX for the file-scope mutex
    cbc24bce70dfd mailbox: riscv-sbi-mpxy: validate RPMI notification lengths
    1bd910aae6abd mailbox: pcc: Fix command timeout due to missed interrupt
    d255b6575650b mailbox: rockchip: disable pclk on probe failure and unbind
    413b0b94d6d06 mailbox: qcom-cpucp: handle NULL data in send_data callback
    8b8de6400c869 mailbox: qcom-cpucp: fix PREEMPT_RT self-deadlock in IRQ handler
    eb05c19dfb36d perf dso: Replace assert with runtime check in dso__read_symbol()
    ac09bbbde1d49 perf dso: Guard against cache underflow on short reads in dso_cache__memcpy()
    d3eaeabc08ae9 perf dso: Use stored fd error instead of stale errno in file_read() and file_size()
    dd9560c7b46e2 perf dso: Guard close() against invalid fd in dso__decompress_kmodule_path()
    b40859b325772 perf dso: Guard against errno==0 when dso__get_filename() returns NULL
    b8f8642178656 sched_ext/scx_flatcg: Fix cvtime true-up on slice expiry
    9d634e8f9e20a crypto: lskcipher - propagate errors from unaligned crypt
    8c9b0a3a6d27f crypto: hisilicon/sec2 - fix CCM algorithm long packet failure
    efcfda20b7b7f selftests/sched_ext: Fix flaky ddsp failure tests on busy systems
    6b019f0daa613 bpf: Fix pending_pos walk on 32-bit ring position wrap
    15512c6b5dea7 ACPI: scan: fix bus ID cleanup on device_add() failures
    04a43c321e106 ring-buffer: Remove trace_buffer::cpus
    801ae90f8ce09 riscv, bpf: Fix missing sign-ext for signed 1-byte and 2-byte kfunc args
    5a19c3fccc7e3 selftests/bpf: Use ping_command() for IPv6 pings in lwt_ip_encap
    17a4dd3b0e6da selftests/bpf: Add tests to verify the fix of encapsulating VxLAN in lwt
    54bff7c8e410a HID: multitouch: reclassify HTIX5288 to WIN_8_FORCE_MULTI_INPUT_NSMU
    d2f41287b51a3 ASoC: SOF: validate topology volume range before allocation
    e30214289e623 tracing: Have trace_event_update_all() only handle module that is loading
    324cc98b71f0d HID: haptic: don't write an uninitialized value to unhandled usages
    a561012868ae3 ALSA: core: Fix use-after-free in snd_card_do_free()
    ce9a619c432b9 fs/ntfs3: reject out-of-range evcn in mi_enum_attr()
    dc6d85de7e265 fs/ntfs3: fix integer overflow in MFT cluster validation
    863e10c4508cf bpf, arm64: Fix stack-passed arguments for indirect trampolines
    424a9fc4876cc net: page_pool: fix UAF in __page_pool_release_netmem_dma on xa_cmpxchg race
    e44b3b35bb153 scsi: ufs: core: Set task state before io_schedule_timeout()
    2dbdd025b2281 scsi: mpt3sas: Avoid freeing unallocated PCIe SGL buffers
    b6273cd8dc55f selftests/bpf: Fix for veristat file/prog filters processing
    d0a3729d464fc Squashfs: check block offset is not negative
    f8747d81aa6d3 ocfs2: fix circular locking dependency in ocfs2_init_acl()
    e35fa6eb4d2a3 ocfs2: validate DIO orphan slot during inode read
    c6c908f9b4edf ocfs2: validate orphan slot during inode read
    508907eb8ea4a bpftool: Fix double close in map dump
    b000458cab958 x86/pkeys: Fix pkey_alloc() return value when pkeys are not supported
    0ef3f5629051f selftests/cgroup: Preserve CPU hotplug write errors
    210c193a9ef13 ALSA: seq: midi: Serialize input teardown with event_input
    5c94ea1e64d3b ALSA: seq: midi: Optimize event_input locking with RCU
    1f6d28c428cae clocksource/drivers/armada: Unwind timer clock on init failure
    fa0901c1c5551 clocksource/drivers/clps711x: Do not unmap clocksource MMIO
    5d83f3faa3fb7 s390/debug: Fix deadlock during unregister
    e0cb87f438854 xenbus: Unregister reboot notifier on init failure
    ac7b10121140a power: supply: bq27xxx: bq27z561: fix invalid AverageEnergy address
    b3827f2e7b609 power: supply: bq27xxx: bq28z610: fix invalid AverageEnergy address
    2f890ba8521f7 power: supply: bq27xxx: bq27520g4: fix REG_TTES address
    7d181b48da3ff power: supply: bd99954: Drop bad register fields
    3ab6f4eccbbf5 PCI/ASPM: Disable/restore ASPM on every function for multi-function devices
    a3040b9e90eb4 spi: img-spfi: don't disable runtime PM on DMA deferred probe
    41849630000ec selftests/bpf: vmtest.sh: Preserve command quoting when running in the VM
    5e41939ae4929 selftests: harness: Mark test fixture objects __maybe_unused
    d97cb1421c944 selftests: harness: Restore order of test functions
    e17ba89f8b78f kunit: tool: fix _list_tests filtering wrong variable when list has TAP prefix
    afc211a293999 perf build: Remove leftover feature tests for removed cxx and clang support
    1e94e67483e01 super: fix dying superblock warning messages
    c01652db11c29 PCI/ASPM: Use pcie_capability_clear_and_set_word() for ASPM disable/restore
    d6037e42aa4dd firewire: core: fix memory leak in error path of build_tree()
    4679bf3517cec firewire: core: validate parent port count before allocating nodes in build_tree()
    861e6dd1f5939 firewire: core: consolidate port counting in build_tree()
    6d2eba5cdb815 firewire: core: add KUnit tests for failure of tree building
    d7d075f17d612 firewire: core: add KUnit tests for successful tree building
    b5d3c30d03dbc firewire: core: add KUnit test skeleton for node tree
    3216ff97d329a UBI: fix two issues in the ubi.mtd MODULE_PARM_DESC
    8b30628dfc2b2 ASoC: xilinx: formatter_pcm: fix stream_data leak on open error
    e065960366b55 mtd: ubi: Release device reference on busy detach
    e3f7e58189bc2 ubi: Fix rollback for explicit UBI device numbers
    e6d77e2ea55f1 UBI: fastmap: Pass to_be_tortured when reusing old fastmap PEBs
    34b180031021f UBI: Preserve torture flag when rescheduling failed erasures
    e06806a8f4cf2 ASoC: fsl-asoc-card: defer probe when the CPU DAI device is not ready
    efc40977e7104 ASoC: pxa: Use devm_clk_get_optional() for extclk clock
    99c554f193478 idpf: add missing cpu_to_le32 in idpf_tx_splitq_build_flow_desc
    f06d77436aab6 ice: acquire NVM lock around each flash read
    42ff18e407e9c ice: refactor to use helpers
    c0fcef8e24a8b ice: clear the default forwarding VSI rule when releasing a VSI
    f5071e3ad4ca3 ice: fall back to SBQ when LL PHY timer interface times out
    544e40805dbb6 RDMA/cma: Fix WARNING in res_to_rt
    046425412529d RDMA/cxgb4: Free debugfs on registration failure
    3c9c9b56fbaff dmaengine: qcom-bam-dma: fix autosuspend cleanup during removal
    b1e8d40663997 ALSA: seq: Don't leak the extension cell pointer in the bounce payload
    4f0483bbcdacc nfc: nci: fix use of uninitialized memory in CORE_INIT_RSP parsing
    9cfe74542b544 nfc: digital: Do not dump a NULL response in command completion
    7a8e0a7aef807 nfc: pn533: hold a reference to the request skb during send_frame
    749a9048bf51a nfc: llcp: bound SNL TLV parsing to the skb and add length checks
    ba4c776af3dc2 nfc: nci: fix double completion race in nci_data_exchange_complete
    156e65bd29307 nfc: llcp: read llcp_sock->local under the socket lock in getsockopt
    8bf228fa02b1e nfc: llcp: avoid userspace overflow on invalid optlen
    4b59f93cf4baa nvme: reject passthrough of driver-managed Set Features
    736b7c6adc7a6 nvme/ioctl: check SUBMIT_IO with nvme_cmd_allowed()
    1fb1236312ee1 nvmet: fix NULL pointer dereference in nvmet_execute_identify_ns_zns()
    a2cf452ba7109 nvme-apple: Drop the PRP null check chicken bit
    311e4e21ffd41 nvme-apple: Require page aligned buffers on the admin queue
    5ee7e381b1bc8 nvme: Add a quirk for page aligned admin queue buffers
    25c76e0c07f2a nvme: expose active quirks in sysfs
    95e93ee7053b8 nvme: remove virtual boundary for sgl capable devices
    85571e5a37ff2 block: accumulate memory segment gaps per bio
    897184def60c9 nvme-apple: Never set the opcode in the NVMMU TCB
    751e8e18be0a4 nvme-apple: Don't set a DMA direction for commands without a data transfer
    215d1682f0bae nvme-apple: Destroy the admin queue on removal
    c38a818632679 nvmet: fix heap out-of-bounds read in nvmet_auth_negotiate()
    cb30449ee9a9c nvme: Add the DHCHAP maximum HD IDs
    a3453d50130cb s390/irqflags: Add out-of-line definitions of arch_local_irq_*() for KMSAN
    af20646a329e6 s390: Drop unnecessary CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT
    283d2d61c4a3b integrity: Make arch_ima_get_secureboot integrity-wide
    d408d69f92b8c arm64: bti: Disable in-kernel BTI with recent versions of Clang
    bc34d10432303 ASoC: qcom: q6apm: keep the graph start count in sync with the DSP
    79c05936be12c spi: sprd-adi: Fix probe succeeding without registering the controller
    b68d3a7a14585 phy: qcom: qmp-combo: Drop qmp_v4_calibrate_dp_phy
    b499e89a828ed phy: qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms
    becb8b30d9da6 phy: qualcomm: qmp-combo: Update QMP PHY with Glymur settings
    e1ce0661c0ce8 phy: qualcomm: Update the QMP clamp register for V6
    aa615671f486a phy: qcom-qmp-combo: Use regulator_bulk_data with init_load_uA for regulator setup
    660b56537e180 phy: qcom: qmp-combo: Correct pre-emphasis table for QMP v4 DP PHYs
    31b8b620a8aa1 phy: renesas: rcar-gen3-usb2: Ignore missing VBUS regulator
    832022bb2ba5a rust: uapi: replace direct asm-generic/ioctl.h include with linux/ioctl.h
    218c36fdd5c63 iommu/amd: Fix incorrect device ID in invalid PASID error message
    7d1099b86356d apparmor: fix unconfined user namespace restriction forced stack
    07485821b20b2 apparmor: change fn_label_build() call to not return NULL
    ab64b1584a905 apparmor: split xxx_in_ns into its two separate semantic use cases
    c7f53d35455d1 powerpc/configs: enable CONFIG_RAS to fix EDAC support
    569eb11f09908 amt: Don't support cross-netns setup.
    6033cc02fe27d selftests/sched_ext: Check skeleton open failure in exit test
    f1872cddf12ab cgroup/cpuset: Use WRITE_ONCE() for shared prs_err updates
    474da0e00d0c9 cgroup/cpuset: Fail if isolated and nohz_full don't leave any housekeeping
    4fd62a9418ab9 cgroup/cpuset: Rename update_unbound_workqueue_cpumask() to update_isolation_cpumasks()
    c25b6b28a35f9 nvme-pci: release descriptor pools on probe failure
    9e489dc3fbbf4 nvmet: propagate percpu_ref_init() failure in nvmet_ns_enable()
    33f07f8fbb9cb nvmet: fix Reservation Register Replace for unregistered host with IEKEY
    da652cb17f9fa sunrpc: xprtsock: annotate shared socket callbacks with READ_ONCE/WRITE_ONCE
    cda4aacfb0bbf SUNRPC: check rpc_sockaddr2uaddr() return value in rpcb_register_inet4/6
    7d0554350d884 hwmon: (cros_ec) Synchronize EC access from the thermal device callbacks
    13ad7a04b97a6 hwmon: (cros_ec) Store the hwmon device in cros_ec_hwmon_priv
    49390d9d8eaf0 hwmon: (cros_ec) Register the thermal devices after the hwmon ones
    786409d4dcd1b hwmon: Support guard() and scoped_guard for subsystem locks
    1a010fcc0f1b0 hwmon: (cros_ec) Add support for temperature thresholds
    14ec266275419 hwmon: (cros_ec) Move temperature channel params to a macro
    6fa77dea178e7 hwmon: (cros_ec) Split up supported features in the documentation
    28e9bcb654f19 arm64: Disable KCSAN instrumentation in delay.o
    0f7f363cc6ceb xdrgen: Fix opaque and string encoders for unbounded members
    97c12f3e24e7d xdrgen: Do not declare union XDR functions in the definitions header
    184a3e5bbc01b xdrgen: Address some checkpatch whitespace complaints
    221a025fb6aa6 m68k: Fix backtraces for non-running tasks
    0fdc6aaea2965 hwrng: imx-rngc - Disable clock on registration failure
    5067a5fbbd025 crypto: qat - remove dead ADF_HEX code
    0c68bf6b4842e crypto: qat - use 2-arg strscpy where destination size is known
    a803141597d61 iommu/vt-d: Flush context cache with correct SID when tearing down aliases
    d0e978ced7429 iommu/vt-d: Tear down scalable-mode context on probe failure
    3c88cfedc7768 iommu/vt-d: Clear Present bit before tearing down copied context entry
    686bd59429ffe iommu/vt-d: Fix UCTP context table slot when copying root entries
    e3c53e9173a47 iommu/dma: Restore locking around msi_page_list
    7508654e409ed fbdev: clps711x-fb: Remove unreachable unregister_framebuffer() call
    33e54e3e0b2ca fbdev: kyro: Validate overlay viewport coordinates
    656e580c19ca1 fbdev: tdfxfb: fix PCI enable cleanup with pcim_enable_device()
    656e43f7afabb perf synthetic-events: Fix divide by zero in perf_event__synthesize_threads
    e0b01aedf85f8 perf python: Fix memory leak in pyrf__metrics_cb
    9eebbaf7a33be perf python: Validate CPU and thread maps in pyrf_evsel__open
    ce4c4c03ef5bd perf python: Handle Py_None for thread and cpu maps
    2fef75555c0aa perf python: Check counts_values size in set_values
    aba46bc65e083 perf test: Fix skiplist leak in cmd_test
    02ffce64f7ad6 perf test: Support dynamic test suites with setup callback and private data
    122c64347d9a4 perf synthetic-events: Fix uninitialized pthread_join
    a9ee5e8eae20d perf stat: Fix evsel_list leak in cmd_stat
    b567e25ffda7b ARM: dts: helios4: add SATA regulator supplies
    37dac96549d91 ARM: dts: helios4: add vcc-supply to GPIO expander
    5934c1c867070 ARM: dts: helios4: add vcc-supply to EEPROM
    19ebf0422fe91 arm64: dts: turris-mox: fix usb3 phys
    c2178137a7893 i3c: renesas: Don't register devices when ENTDAA times out
    8ca083c0fe2c2 i3c: renesas: Follow a unified pattern for transfer and command initialization
    4e2b33373a0f3 i3c: renesas: Return immediately if there is no transfer
    a052ad5edccf5 bpf: Fix mmap_lock leak in irq_work path
    cc1c1c70d203a bpf: Avoid faultable build ID reads under mm locks
    b25ce833d8f12 bpf: Factor out stack_map build ID helpers
    c1d79bb9c4662 riscv: cpufeature: Clarify ISA spec version for canonical order
    bbe2fd6d77df6 net/sched: cls_api: fix teardown of an adopted proto on insert-race loss
    457ee7219c9ee iio: light: gp2ap002: re-enable irq if runtime suspend fails
    0fc740c25c9ab iio: light: gp2ap002: Fix unbalanced runtime PM on repeated event writes
    1ab7ef7ccfb86 iio: light: opt4060: Fix pointer type passed to div_u64_rem()
    1ab3da12061d7 bpf, cgroup: Fix storage null-ptr-deref after replacing prog
    7c2658023d839 Bluetooth: MSFT: validate evt_prefix_len against the response length
    7efd7fb4c9c77 Bluetooth: btmtksdio: fix usage_count leak when autosuspend_delay is negative
    e1fc9c5878f03 Bluetooth: btmtk: add MT7902 SDIO support
    534d3efd59b3c Bluetooth: btmtk: add MT7902 MCU support
    c00556fbe75eb mmc: sdio: add MediaTek MT7902 SDIO device ID
    e0cd7b34dc6b5 Bluetooth: MGMT: free the HCI command when it is cancelled
    05438d338a875 Bluetooth: MGMT: free the mesh send cancel command when it is cancelled
    9c3b6c1413bd0 Bluetooth: hci_sync: free the advertising instance on the failure and cancel paths
    c1fe3c74a89a7 Bluetooth: hci_conn: fix the SCO setup context lifetime
    2f907608cbcfc Bluetooth: btintel: Fix diagnostics event detection
    be1e3df2c49c9 Bluetooth: virtio_bt: avoid OOB read of build info string
    244d029900814 pinctrl: airoha: fix edge-triggered interrupts handling
    c7596135e7e9a pinctrl: airoha: fix IRQ mask/unmask code
    fda7350f257e5 pinctrl: airoha: add missed IRQ resource helpers
    9ea692247ee24 pinctrl: airoha: fix getting gpiochip/pinctrl pointers in the IRQ handling code
    f3b8fe04dbfe3 pinctrl: airoha: add missed get_direction() function for gpio_chip
    7d2b3f8a996d1 pinctrl: airoha: an7583: fix spi group pins
    38a2a4d6c7ac7 pinctrl: airoha: an7583: fix muxing of non-gpio default pins
    2313f262999c7 pinctrl: airoha: an7581: fix mux/conf of pcie_reset pins
    2ad2147082592 pinctrl: airoha: fix pwm pin function for an7581 and an7583
    cfe4350fdcb53 pinctrl: airoha: convert PWM GPIO to macro
    fa27ddca66022 pinctrl: airoha: an7583: fix I2C0_SDA_PD register bit order
    cbde1169bdd2c pinctrl: airoha: an7581: fix pinconf of i2c_scl/i2c_sda pins
    75ceddfa7df7e pinctrl: airoha: fix mdio bitfield names
    4bf51df55d7bd pinctrl: airoha: add support for Airoha AN7583 PINs
    74c2c5b459b42 pinctrl: airoha: convert PHY LED GPIO to macro
    e6edde29990af btrfs: qgroup: fix a wrong length calculation in qgroup_free_reserved_data()
    b0059242735ea btrfs: avoid GFP_ATOMIC allocations in qgroup free paths
    f44616db1dbce btrfs: use aligned range for locking in extent_fiemap()
    92484ad014f2e btrfs: zoned: don't clobber the extent buffer when zeroing it out
    12b6d1a1715cb btrfs: retry verity reads for not-uptodate Merkle folios
    58ce50b1802a4 btrfs: always wait for ordered extents to avoid OE races
    76b7c505c74f4 btrfs: merge setting ret and return ret
    8a34b30bd1bfc btrfs: make btrfs_repair_io_failure() handle bs > ps cases without large folios
    a9701dd06e82c btrfs: defrag: fix deadlock between defrag and delalloc space reservation
    34f67cfb15fa5 scsi: sd: Fix sd_done() sense handling condition
    8bd807995dd5d perf trace-event: Fix integer truncation in do_read() and skip()
    14470bc005ec6 Bluetooth: btusb: QCA: Fix populating devcoredump fields on unenabled devices
    4ea16cbcc58e3 Bluetooth: btusb: Record matched usb_device_id into btusb_data
    5ca4aa51ab378 Bluetooth: btusb: refactor endpoint lookup
    dc849d11a7d2b Bluetooth: btusb: Fix BD_ADDR byte order in btusb_set_bdaddr_wcn6855()
    4ea53de3e47fa Bluetooth: btqca: Fix qca_set_bdaddr() waiting for wrong HCI event
    1403beab27c64 sched/fair: Check CPU capacity before comparing group types during load balance
    ce065b76c89cb sched/fair: Also gate overloaded status update for SD_ASYM_CPUCAPACITY
    cab5015ee3f25 perf/x86/intel/pt: Fix stop/start with no update
    b53e430f8eab8 perf/x86/intel/pt: Use bitwise access for PERF_HES_STOPPED
    ad9d3402f4b05 perf/x86/intel/pt: Factor out pt_config_enable()
    54eb9b2d18f8b ACPI: video: Release PCI device reference after lookup
    679b862781010 regulator: qcom-rpmh: Fix PMIC5 BOB bypass mode handling
    053ec85cb9f26 bpf, arm64: Fix exception table metadata for arena load-acquire
    415257c38a3fc bpf, x86: Fix exception table metadata for arena load-acquire
    5f13a844d0c9b bpf, riscv: Add and use bpf_atomic_is_load_acq() helper
    c4c8de3bf48d3 bpf: Reject load-acquire from pointers requiring fault protection
    57b72442c1672 perf: arm_pmuv3: Zero initialize hw_id branch stack field
    f61f65fc81dcd coresight: Refactor etm4_config_timestamp_event()
    9e804dbe28b74 coresight: etm4x: fix leaked trace id
    1ade9a335c69f coresight: etm4x: fix underflow for usage of (nrseqstate - 1)
    9241edfb84a0d coresight: Change syncfreq to be a u8
    a29d753e9d83b coresight: etm4x: fix wrong check of etm4x_sspcicrn_present()
    f9cdb5bb8efbf md/raid1: don't set array_frozen in raid1_takeover()
    c55aa6c17f019 md/md-llbitmap: stop daemon timer rearm on destroy
    930cc4f1af5a1 md/md-llbitmap: prevent create failure bitmap UAF
    d81822fd5fa81 md: avoid stale clone I/O accounting timestamps
    73881ff7a7591 md: wait for behind writes before destroying bitmap
    02c10581866d0 md/raid5: round bitmap stripes with sector division
    d2c069ddaec79 phy: qcom: qmp-pcie: Add pcs_lane1 offset to V5 offsets
    5547fd950d6bf phy: qcom: qmp-usb: Fix possible NULL-deref on early runtime suspend
    61749681e4a36 phy: qcom: snps-femto-v2: Fix possible NULL-deref on early runtime suspend
    52ad86ea5f98d phy: qcom: qmp-usb-legacy: Fix possible NULL-deref on early runtime suspend
    f67686d826755 phy: qcom: sgmii-eth: vote for both voltage rails with correct current loads
    12d35c6572622 phy: qcom-sgmii-eth: relax order of .power_on() vs .set_mode*()
    a834458ecaadb soc: fsl: qe: check platform_driver_register() in qe_ic_of_init()
    dfe848cadfde4 hugetlbfs: release subpool on fill_super failure
    2177c04ca0684 pinctrl: rockchip: Reset the pin count when recalculating SoC data
    6eaa632d0ed7b firmware_loader: do not queue completed sysfs fallback requests
    067504c00fe17 scsi: qla2xxx: Remove redundant VPD flash read in sysfs read path
    8d752f1bb73fa drm/amdgpu/gfx6: Use PFP on the compute queues too
    375adae128dd0 drm/amdgpu/gfx6: Fixup emitting SWITCH_BUFFER packets
    1a1ea9738c41d perf trace-event: Fix buffer overflow in read_string()
    b8ae06ccde3ff phy: rockchip: phy-rockchip-inno-csidphy: fix rk1808 hsfreq table
    1489b694b1f32 phy: sunplus: fix error handling in sp_uphy_init()
    bf7fefbc26e29 phy: renesas: phy-rcar-gen3-usb2: Fix devm action registration for disabled VBUS regulator
    b464367d7397b phy: renesas: rcar-gen3-usb2: Add regulator for OTG VBUS control
    733d3c1f3f513 phy: renesas: rcar-gen3-usb2: Factor out VBUS control logic
    66ef9160e878a arm64: dts: ti: k3-am64: Fix MDIO clock reference for ICSSG0 node
    7c4c228b0cc3e ext4: fix spurious message about orphan cleanup on RO fs
    d2d543f9313fa drm/amdgpu/gfx6: Fixup emit_cntxcntl()
    037d9babf6c6b leds: gpio: Clear error pointers for skipped LEDs
    b75f84c010274 mfd: macsmc: Fix key count endianness annotation
    f59ccd8eeaa09 mfd: iqs62x: Reject zero-length firmware records
    8ae4d0ff3e357 mfd: rave-sp: validate received frame payload lengths
    519e7de2c4c7b arm64: hibernate: Restore DAIF state on error
    012823494e20c arm64: hibernate: mask DAIF before restoring hibernated kernel
    73979c96a3b8f wifi: mac80211: skip default WMM setup for AP_VLAN links
    48b5a520b80a7 RDMA/erdma: restrict the driver to little-endian systems
    b2709aad7599f module/dups: Fix use-after-free in kmod_dup_req lifetime handling
    ef7c354f7377f module/dups: Inform duplicate requests about the result directly
    11fa3f7ffd4f7 module: use strscpy() to copy module names in stats and dup tracking
    ba7e83ce0b340 module: replace use of system_wq with system_dfl_wq
    de603f01d9ccf RDMA/siw: Fix use-after-free in siw_accept()
    6c506fee5a5f2 IB/isert: post the full-feature receive buffers after session registration
    a6c19af05c170 IB/isert: delay the final Login Response until the session is registered
    aaa66e60c0e21 cpufreq: imx6q: fix out-of-bounds write when probed more than once
    e2d2612e63e29 cpufreq: imx6q: fix devres accumulation across driver rebind
    db0a49f0a37d4 rust: cpufreq: Fix temporary write in Registration::bios_limit_callback
    2973978781908 rust: cpufreq: Add CPUFREQ_TABLE_END as last table entry in TableBuilder::to_table
    b43a2518c3eca drm/sun4i: hdmi-phy: Fix H6 8-bit MPLL config at 594 MHz
    46510c3e496b6 drm/sun4i: dw-hdmi: Drop TCON TOP port reference
    17a588752ddf8 drm/sun4i: tcon: Drop remote endpoint reference
    65bc02fec98e4 drm/sun4i: crtc: Propagate layer initialization error
    50806c951a68c drm/sun4i: hdmi: Don't leak sync polarity bits into packet control
    1ca06d47ac40b drm/sun4i: tcon: Drop TCON TOP device reference
    425a414f9b5de drm/sun4i: tcon: Set output mux for DSI and LVDS
    6ec54d801440e drm/sun4i: vi scaler: Fix coefficient selection
    46a5fe1a43574 clk: rockchip: rk3576: fix source muxes for SPI0..SPI4
    aee687a2fb369 ocfs2: synchronize heartbeat callbacks with o2net teardown
    ba32c7d6129db perf libbfd: Fix memory leaks and NULL fclose in BPF disassembly
    59cc63d244d93 perf bpf: Add PROG_TAGS to required arrays in __bpf_event__print_bpf_prog_info()
    c473f3aa721e8 perf libbfd: Validate BPF prog info arrays before pointer cast
    c71f9a56520b4 ARM: 9485/1: mm: acquire mmap write lock around show_pte() for user faults
    314f1a6762b5d ARM: 9481/2: breakpoint: CFI breakpoints only on demand
    dc2272c00d7c0 RDMA/srp: fix heap information leak on a truncated SRP_CRED_REQ
    ec987c0654651 RDMA/erdma: Hold QP references for AE and CM processing
    1fc9c1933959d RDMA/erdma: Hold CQ references when processing EQ events
    56ea0a1f9f93d kbuild: fix modules.builtin(.modinfo) targets in the top-level Makefile
    933076eb1d3d6 modpost: prevent leak when early return no suffix .o in read_symbols()
    0fde935ae0ea9 scripts/tags.sh: Prevent binary files appearing in cscope.files
    804378ff0d62c intel_idle: Avoid using deep idle states during initialization
    56450feb6f485 intel_idle: Add cmdline option to adjust C-states table
    33a5d2f00cac3 intel_idle: Initialize sysfs after cpuidle driver initialization
    6ee7b00888498 bpf: Check load-acquire src ptr type before the load
    cb0671ffce488 arm64: dts: qcom: sar2130p: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
    af38023bc47dc arm64: dts: qcom: sm7225-fairphone-fp4: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
    f068388689bea arm64: dts: qcom: qcs8550-aim300: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
    e70a165b79419 arm64: dts: qcom: sc8280xp-blackrock: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
    2fa866714f227 selftests/mm: fix ternary operator precedence in ksm_tests
    5cd78a904275a selftests/mm: fix ksm NUMA merge test for systems with memoryless NUMA nodes
    335b75cfed44b selftests/mm: ksm_tests: use kselftest framework
    86ead17630110 bpf, cgroup: Fix invalid storage access after __cgroup_bpf_attach failed
    6fd220604f06c remoteproc: fix OOB read via signed offset in rsc_table_for_each_entry()
    5a5ed571032e9 remoteproc: use rsc_table_for_each_entry() in rproc_handle_resources()
    a356d08d7151a remoteproc: Move resource table data structure to its own header
    90361f45ffe85 arm64: dts: qcom: agatti: Add missing CX power domain to DISPCC
    9063b30faae8c drm/omap: dsi: Do not copy isr table
    d1cfbccccad7d riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel number for DMA controller
    571ea4263d69d fat: release buffer head after rebuilding parent
    44a37264b2691 rapidio: clear mport->net when rio_add_net() fails
    9df662fcac6fe pps-gpio: remove dead capture_clear code
    599d4c92aa0b4 pps: pps-gpio: split IRQ handler into hardirq timestamper + threaded handler
    e31ff723811ee pps: don't try to wait for negative timeouts in PPS_FETCH
    f637a83115b32 lib/string: fix memchr_inv() for large ranges
    8abb2b7c60d2b ocfs2/cluster: keep heartbeat local node stable
    b55e7e61c5c19 ublk: check for ublk_unmap_io() returning 0
    0121c84adb6a4 ublk: check import_ubuf() return value
    b4e971c80e64f block/kyber-iosched: flush per-cpu latency buckets over possible CPUs
    7c25949cee2f0 block/blk-iocost: collect per-cpu latency stats over possible CPUs
    55bda3de92f8c block/blk-stat: drain per-cpu callback stats over possible CPUs
    3d8c3da95c75a blk-cgroup: skip dying blkg in blkcg_activate_policy()
    ac34e655dffa7 blk-cgroup: fix race between policy activation and blkg destruction
    c4487e4d5309d phonet: pep: do not write beyond optlen in getsockopt
    f16c2c3932ce7 net: stmmac: Skip PHY attach if custom PCS is in use
    c65d67b08bab4 iio: light: tsl2583: return zero in write_raw() on success
    7a6a9bc87c6ee iio: light: isl29028: return zero in write_raw() on success
    1e628f7ce4bc2 iio: light: tsl2772: fix ALS calibscale readback
    6c98ec4447d2c perf arm-spe: Reject zero nr_cpu in metadata to prevent division by zero
    9a857be21e2f3 perf intel-bts: Fix off-by-one in auxtrace_info minimum size check
    b3a42fd1a0cd1 perf intel-pt: Fix off-by-one in auxtrace_info minimum size check
    59910f142da84 perf auxtrace: Fix queue grow overflow and old array leak
    003de0cf0810c perf thread-stack: Fix heap buffer overflow on branch stack wrap copy
    5db6e27ad43d2 HID: lg4ff: validate report length before fixed offsets
    bef8426d7138c HID: i2c-hid: goodix: Disable VDD on VDDIO enable failure
    f694ea0ead544 HID: steam: Reject short reads
    78c39dd5cc4ae HID: steam: Improve logging and other cleanup
    a0fbd9437d7dc HID: steam: Add support for sensor events on the Steam Controller (2015)
    041e63bd2f73c HID: steam: Rename some constants that got renamed upstream
    d73725bf86120 HID: steam: Refactor and clean up report parsing
    17e532415518a HID: i2c-hid: Fix "(null)" output when reading report descriptor fails
    01eeb601a1626 HID: synchronize input before cleaning up a failed probe
    e5b6af32ecdd8 HID: i2c-hid: Refactor _DSM helper and add i2c-hid-acpi-prp0001 driver
    d7f2ec073a05a misc: pci_endpoint_test: Check SUCCESS bit for doorbell status
    5c58ea19a909e dm-integrity: replace forgeable discard filler with a keyed sector marker
    4f6bd79bb7e55 tty: clear cdev pointer after cdev_add() failure
    5b77848423f4a serial: amba-pl011: keep console clock enabled for atomic writes
    5ac19e4e26e99 serial: amba-pl011: unprepare console clock on unregister
    ea7fd4e8e8b87 MIPS: ptrace: Fix syscall skipping via PTRACE_SYSCALL
    6bdbc2b4df1f5 soc: fsl: qe: implement get_direction()
    0f3d1d7ab5d2f soc: fsl: qe: properly scan GPIO nodes at startup
    90d953002cf0b powerpc/irq: Fix missing r2 clobber in PCREL inline assembly
    5fa92c6466fa2 powerpc/smp: add NULL guard for cause_ipi in smp_muxed_ipi_message_pass
    b59a47e20040a pinctrl: spacemit: validate pins in pinconf callbacks
    41eba3b3ef86f pinctrl: eswin: Fix Handling of PIN_CONFIG_PERSIST_STATE
    2d98a3b89394f firmware: coreboot: Validate table bounds
    d0a19a59580a2 firmware: google: Add bounds checks in coreboot_table_populate()
    7a22cbc6c6bdd wifi: cfg80211: stop PMSR before P2P and NAN teardown
    0a0c03e4b7c63 wifi: cfg80211: Add an API to configure local NAN schedule
    84263694c8d1f wifi: nl80211: split out UHR operation information
    e182bf30a38c3 wifi: nl80211: refactor nl80211_parse_chandef
    6481459f78be3 wifi: cfg80211: add support to handle incumbent signal detected event from mac80211/driver
    335c515932a59 wifi: cfg80211: add initial UHR support
    be90aa8bf1775 wifi: ieee80211: add some initial UHR definitions
    66722acd740be wifi: nl80211: Add support for EPP peer indication
    93b4c9130461c wifi: cfg80211: include S1G_NO_PRIMARY flag when sending channel
    e7bc5ab93acd1 wifi: mac80211: disconnect on CSA to channel 0
    7c3d762bc15c5 wifi: mac80211: skip unused probe response countdown offsets
    979ad5269bdf0 wifi: zd1211rw: reject secondary interfaces to prevent conflicts
    26e6123a93dca wifi: mac80211: send TWT teardown to peer after setup TX failure
    97dd2f6560ce3 perf/cxlpmu: Fix 64-bit write to 32-bit HDM filter register
    9ba040f4fec87 iommu/arm-smmu-v3: Convert to use atomic poll timeout
    2a08fd5a082e1 kselftest/arm64: Don't write to P0 in irritator on SME only systems
    ee46a1714d3a9 kselftest/arm64: fp-ptrace: Fix checks for inactive SVE and SSVE regsets
    695e976e25a11 arm64/fpsimd: ptrace: Fix inactive SVE and SSVE regsets
    a2ff70c44fe8e arm64: smp: Fix IPI teardown for GICv5 flow
    80818e72aec4d wifi: mt76: mt7996: remove beacon_int_min_gcd from ADHOC interface combinations
    7039825a7479d wifi: ath10k: snoc: use memcpy_fromio() for MSA ramdump
    637bb99cc766a wifi: mt76: mt7996: fix out-of-bounds link array access in mt7996_tx()
    13f6a9c786022 wifi: mt76: reject out-of-range link ids in mt76_vif_link()
    81ccb9faf3c43 wifi: mt76: mt7925: Fix EHT Beamformee SS subfields to meet 802.11be minimum
    0ead464cb43ef wifi: mt76: mt7925: advertise EHT 320MHz capabilities for 6GHz band
    c59c8b962c4d8 wifi: mt76: fix queue assignment for disassoc packets
    292bc52d8420a wifi: mt76: mt7915: report RX chain signal for all RX paths
    4dee6aca79295 wifi: mt76: mt7915: fix chainmask handling for non-dbdc phys on band 1
    76144da3c6184 wifi: mt76: mt7996: do not attach hif2 WED when the main WED attach failed
    d4326105ee28d wifi: mt76: mt7996: fix reg addr remap when addr is 0
    ed5cc46a3c8f4 wifi: mt76: mt7915: release hif2 reference on probe IRQ failure
    a7fd3bae8e11a wifi: mt76: mt7915: fix ext PHY use-after-free on register error path
    249cbaa187355 wifi: mt76: mt7915: fix double hif2 init on the non-WED path
    51c6d1f665401 wifi: mt76: mt7996: fix MIB TX aggregation counter registers for mt7990
    2b10eb3636d0c wifi: mt76: mt7996: free vif links after clearing wcid entries on full reset
    f3d8cf8c09e3b wifi: mt76: mt7996: wake MCU waiters before aborting scan in L1 SER
    2cc7d32b42dab wifi: mt76: mt7996: skip key upload when adding an offchannel link
    6bce0f1280c94 wifi: mt76: mt7915: unlink TWT flow if the MCU rejects the agreement
    40f3bfbbb222b bpf, x86: Fix trampoline stack size for 128-bit arguments
    f6202ed975070 perf machine: Check snprintf truncation for guest kallsyms path
    eaa350a2ec347 perf machine: Free scandir entries in guest kernel map creation
    9054ad50ffe27 perf machine: Reset errno before strtol in guest kernel map creation
    c0b06d47ac329 perf machine: Don't abort guest map creation on first inaccessible dir
    b3b3175103acf perf machine: Check snprintf truncation in machines__findnew()
    15159fc5441bc perf machine: Guard against NULL strlist in machines__findnew()
    e3a2ed4c0e8e0 perf machine: Fix NULL parent dereference in fork event processing
    28bb9ea64c0c5 perf machine: Fix fd leak on bounds check in maps__set_modules_path_dir()
    0b950aa7ec95e regulator: core: use system_freezable_wq for init complete work
    2e2d63f68211e ASoC: tas2783-sdw: drop stale regcache on uninitialized re-attach
    5589af278c504 ASoC: codecs: tas2783-sdw: Propagate regcache_sync() errors
    551f3e27486bc ASoC: tas2783: Use new SoundWire enumeration helper
    0b5c09512f21b soundwire: Add a helper function to wait for device initialisation
    f5bb3471c9f46 wifi: ath11k: fix leak in ath11k_service_ready_ext_event()
    83bc4eab83ae5 drm/msm/dsi: Drop dev_pm_opp_set_rate(0)
    e0d1d1253ea2a drm/msm/dp: Drop dev_pm_opp_set_rate(0)
    be73b1984086f drm/msm/dpu: Drop sneaky dev_pm_opp_set_rate(0)
    81d21396fea2d perf: arm_spe: Make wakeup range check overflow safe
    ad1d83816b845 drm/msm/dp: do not reject wide-bus modes while a YUV420 mode is active
    6572b5a74ab1c drm/msm/dp: reject YUV420-only modes without VSC SDP support
    08827aa40f0ee drm/msm: don't tear down KMS twice when KMS init fails
    64976f3b34b07 ACPI: processor: Unregister cpufreq notifier on init failure
    6cffb59ee50ea ACPI: processor: idle: Optimize ACPI idle driver registration
    efc57983a1d46 wifi: mt76: only consume the WO drop bit on WED v2 devices
    19f108fee1470 wifi: mt76: mt7996: add missing rdd_idx check when enabling background radar
    b93d0f07ed040 wifi: mt76: mt7915: use little-endian for bss_info_ra wire fields
    92dc45686b9f1 wifi: mt76: mt7996: don't leak MLD group index on remap alloc failure
    45d8896e4cfff wifi: mt76: mt7996: reserve space for the CSA-abort countdown TLV
    906ad486ba5c4 wifi: mt76: mt7996: hold dev->mt76.mutex while disabling tx worker in SER
    507eddb8175a6 wifi: mt76: mt7915: unwind state on add_interface failure
    d0bb2189ade61 wifi: mt76: mt7996: bound TLV walk in mt7996_mcu_get_chip_config
    1c7ad1236bc6f wifi: mt76: check txfree done event on the WED hw path
    31faa92cd5074 wifi: mt76: mt7915: poll the correct SLP CTRL register for the second adie
    7ac05ed3a50e5 wifi: mt76: fix RXDMAD_C buffer recycling race
    576683faa9381 wifi: mt76: fix uninitialised RXDMAD_C descriptor info
    423be355be5ae wifi: mt76: fix stranded frames in mt76_txq_schedule_pending
    471586e88861d wifi: mt76: mt7915: write RX header translation bit to the correct register
    522101cbbb3bc wifi: mt76: mt7996: don't report a zero TX bitrate
    6ce78d04c7ea4 wifi: mt76: mt7915: avoid nss underflow in mt7915_mcu_get_sta_nss
    b4a41a47a67c7 wifi: mt76: mt7915: clear wcid mask under mutex after RCU pointer clear
    bf59177bab17b wifi: mt76: mt7996: set MT76_MCU_RESET before waking MCU waiters on full reset
    0f53ece876e1f wifi: mt76: mt7996: validate RX band_idx before dereferencing phys[]
    310edc8f3f56b wifi: mt76: assign link_id when sending probe request during scan
    fc7fae55255cc wifi: mt76: fix non-AQL packet accounting for MLO stations
    5183b9f092fc0 wifi: mt76: mt7996: fix MLD ID in MAC TXD and HIF TXP
    990ec9215ebe1 wifi: mt76: mt7996: fix out-of-bounds array access during hardware restart
    25b765aa9a61f wifi: mt76: mt7996: set specific BSSINFO and STAREC commands after channel switch
    5c350e3b6065f wifi: mt76: mt7996: support fixed rate for link station
    62aea1d45b524 wifi: mt76: fix RX data queuing of RRO 3.0
    97a77dc0abd90 wifi: mt76: mt7996: fix capability of EHT-MCS 15 in MRU
    674e0ad0ae15f wifi: mt76: mt7996: fix EAPOL source BSS for non-MLD stations
    ddf6a17d8e3d0 wifi: mt76: mt792x: Fix memory leak in SDIO TX path
    52c7bcf067861 wifi: mt76: mt7925: fix msg len mismatch between driver and firmware
    383bb0511dfe6 wifi: mt76: mt7925: update clc before setting sar power table
    670b3dc4e3713 wifi: mt76: mt7921: Add PCIe AER handler support to prevent system crash
    0015b56dff60f wifi: mt76: always enable RRO queues for non-MT7992 chipset
    6e9207ac476ca wifi: mt76: Introduce the NPU generic layer
    c0dbce50c8961 wifi: mt76: Move Q_READ/Q_WRITE definitions in dma.h
    50c896af50e02 wifi: mt76: mt7915: fix net_fill_forward_path for non-DBDC mt7986
    17d6b89e09eac wifi: mt76: mt76x02: do not WARN on invalid rx descriptor length
    0340bd33b4e21 wifi: mt76: connac: add MT7991A (0x7991) to is_mt7996()
    1991d605a45f6 fanotify: report full event length for FIONREAD
    6248eb1833ff0 misc: sgi-gru: remove interrupt-context page-table walks
    e6e4cbc9e8fdd misc: vmc_vmci: Fix potential memory leak in vmci_event_subscribe()
    2a1c16c4700cd powerpc/crash: Fix possible memory leak in update_crash_elfcorehdr()
    7969b571ae940 powerpc/44x: Set GPIO chip parent
    687d42d9eea41 powerpc: implement get_direction() in cpm2
    e7c69c6695d84 locking/lockdep: Fix NULL pointer dereference in __lock_set_class()
    37f11973c3eb7 md/raid1: create serial pool adding rdev to array with serialize_policy=1
    71da948d249a5 fs: annotate inode timestamp accessors
    039e490e3ac47 i3c: master: adi: add OF module alias for autoloading
    9eaac0cb4ca94 i3c: dw: avoid shift-out-of-bounds when DAA assigns no devices
    35e0103177826 swiotlb: Preserve allocation virtual address for dynamic pools
    fb0b39287ba89 iommu/dma: Check atomic pool allocation result directly
    28fdea874f68c md: scope memalloc_noio to allocation critical sections
    c510626bbacb1 md: skip redundant raid_disks update when value is unchanged
    9f16747fc3b23 md: remove unused mddev argument from export_rdev
    6763fb409a0b4 md/bitmap: resume array on backlog_store() error path
    85ece0386c4fe clk: qcom: Return expected ENOMEM error on dynamic allocation failure
    64abdd6961290 clk: qcom: gpucc-qcm2290: Park RCG's clk source at XO during disable
    af7a6d6ec36a1 lib/test_hmm: fail dmirror_fault() when the mirrored mm is gone
    85cf991c881e7 bpf: Fix potential UAF when reading bpf link info
    bda86e9f31b9a bpf: Fix potential UAF in bpf_netns_link_update_prog
    d5266b4c5c771 power: supply: sc2731_charger: cancel work on remove
    f312c5d17f2a7 power: supply: isp1704_charger: cancel work on remove
    1a35eda51a501 arm64: dts: qcom: qcs6490-rb3gen2: Fix the PCIe iommu-map entries
    e1c65abeb6aaf arm64: dts: qcom: lemans: Fix the PCIe iommu-map entries
    03a85ccf857ac arm64: dts: qcom: lemans: Move PCIe devices into soc node
    76e14b0e86567 arm64: dts: qcom: sa8775p: Add reg and clocks for QoS configuration
    8d7411cc0bd95 arm64: dts: qcom: lemans: add QCrypto node
    610d253bef458 arm64: dts: qcom: lemans: add refgen regulator and use it for DSI
    ca29c5c0cc615 arm64: dts: qcom: lemans: move USB PHYs to a proper place
    349752c7ab6be arm64: dts: qcom: talos: Fix the PCIe iommu-map entries
    fc2980ea69202 arm64: dts: qcom: sm8750: Fix the PCIe iommu-map entries
    f418e83ac1abe arm64: dts: qcom: sm8650: Fix the PCIe iommu-map entries
    e8a7928da474e arm64: dts: qcom: sm8550: Fix the PCIe iommu-map entries
    dbcbbb2033736 arm64: dts: qcom: sm8450: Fix the PCIe iommu-map entries
    793dbaa91c3bf arm64: dts: qcom: sm8350: Fix the PCIe iommu-map entries
    c8fd2cabd0b7c arm64: dts: qcom: sm8250: Fix the PCIe iommu-map entries
    152e82a60d70e arm64: dts: qcom: sm8150: Fix the PCIe iommu-map entries
    a98b8bb0ca25f arm64: dts: qcom: sdm845: Fix the PCIe iommu-map entries
    8dfc4641001fb arm64: dts: qcom: sc8180x: Fix the PCIe iommu-map entries
    54176af35d989 arm64: dts: qcom: sar2130p: Fix the PCIe iommu-map entries
    d2b404826bf93 arm64: dts: qcom: kodiak: Fix the PCIe iommu-map entries
    f063039d2e439 arm64: dts: qcom: sm8250-xiaomi-elish: correct the board ID
    d29c5a88d5703 block: fix dio leak on metadata mapping error
    642828f274eb7 block: add a bio_endio_status helper
    8b1817b36ca5c block: don't set BIO_QUIET for BLK_STS_AGAIN
    2b239a920a992 blk-crypto: use on-stack skcipher requests for fallback en/decryption
    196a8f954ae6d blk-crypto: optimize bio splitting in blk_crypto_fallback_encrypt_bio
    30439432f3f2e blk-crypto: submit the encrypted bio in blk_crypto_fallback_bio_prep
    f57adb5beca6b firmware: qcom: scm: Fix tzmem state on probe retry
    1da025b5ceb45 firmware: qcom: scm: Fix reserved memory cleanup on probe failure
    1d753df5899ec firmware: qcom: scm: Fix NULL dereference in IRQ handler before __scm is published
    d72c76684a4a9 firmware: qcom: scm: instrument SMC call path with tracepoints
    347efe779f55f firmware: qcom: scm: add trace events for the SMC call interface
    889ca992d9c4e firmware: qcom_scm: Support multiple waitq contexts
    3d028e241c2aa firmware: qcom_scm: Add API to get waitqueue IRQ info
    81af527ead79c arm64: dts: qcom: sc8280xp-crd: Fix the pin index for misc_3p3_reg_en
    5793229726e25 clk: qcom: gcc-qcm2290: don't park QUP RCGs upon registration
    939c917d037a5 arm64: dts: qcom: qcs404: Fix DTBS Check errors in usb controller nodes
    4ea052255a4a6 arm64: dts: qcom: sdm632-motorola-ocean: Fix LED default trigger property
    d098dd6ec09b8 arm64: dts: qcom: msm8976-longcheer-l9360: Fix accidental node override
    9346a92337075 arm64: dts: qcom: msm8998: Don't pull-up I2C pins by default in sleep
    179713adff1bd rcu: Mark accesses to ->rcu_urgent_qs and ->rcu_need_heavy_qs
    badab2078d459 md/raid10: consistently fail atomic writes that require splitting
    75185e2b214e8 wifi: ath11k: fix stride mismatch in mac_phy_caps_parse()
    b9a5d12cbdeb8 wifi: ath12k: fix stride mismatch in mac_phy_caps_parse()
    ec6edba35aa7b Revert "serial: 8250: Clear CON_PRINTBUFFER on port re-registration"
    d44a02724576c selftests/zram: fix kernel_gte() for POSIX sh
    e5ac7ab78467b md: recheck spare changes before starting sync
    47b61029f146f tools/nolibc/powerpc: mark ctr and xer as clobbered by system call
    a2fbef8a6318b fanotify: stop permission watchdog when timeout is zero
    9d65cb2142533 md/raid5: protect lockless recovery_offset accesses during reshape
    455b56209f961 md/raid5-ppl: fix use-after-free in ppl_do_flush()
    dcd3d87cfc148 md/raid5: protect bitmap batch counters aka seq_flush/seq_write consistency
    4fb17a7c437f1 bus: mhi: host: Fix controller cleanup on EDL sysfs failure
    21ce330f921a5 bus: mhi: host: Flush the posted write after writing to MHI_SOC_RESET_REQ_OFFSET
    a89818977338b wifi: rtlwifi: pci: fix error path in rtl_pci_probe()
    e2cbe14361d7c platform/chrome: cros_ec_debugfs: Unregister panic notifier
    b95664e3f82da platform/chrome: cros_ec_debugfs: Clean up console log on probe failure
    e7768f3dae9f2 media: qcom: iris: handle runtime PM resume failure in core deinit
    c1a48452cc16e media: qcom: iris: Fix bitmask test in iris_allow_cmd()
    794f6d4c4ddef drm/msm: remove objects from evit list after pinning them
    b3624eecb65a2 PCI: starfive: Fix unchecked pm_runtime_get_sync() in probe
    257a0a59598f5 PCI: starfive: Fix Runtime PM handling and teardown ordering
    aa8226f873c91 wifi: ath12k: validate TLV length in process_tpc_stats()
    0364926fb4bfb wifi: ath11k: fix overreads in ath11k_wmi_process_csa_switch_count_event()
    3b544072185c3 spi: davinci: switch to managed controller allocation
    bd764baf82bb4 nvme-fc: unmap cmd_iu DMA on rsp_iu mapping failure in init_request
    c345d9d0b3eef IB/isert: reject login PDUs declaring more data than was received
    cf36fa5357a2f IB/isert: reject PDUs declaring more data than was received
    429b75000c6a9 media: staging/ipu7: fix async notifier leak on init error
    a2e37d1ab773b RDMA/cxgb4: free STAG index when TPT entry write fails
    b1fe9a1bd0012 RDMA/mlx5: Send cong param changes to the resolved port mdev
    4599311e78e88 RDMA/mlx5: Fix stack out-of-bounds read in cc_params debugfs
    75424c5a6620b scsi: smartpqi: Fix AIO retry marker cleared by SCSI core between dispatches.
    3904fb0ee741e nilfs2: fix BUG in nilfs_copy_dirty_pages() on dirty state mismatch
    842397fdfd2e6 nilfs2: prevent out-of-bounds read in super root block parsing
    1fc6df85b4954 nilfs2: fix infinite loop in nilfs_clean_segments()
    49a7d62d64f79 clk: rockchip: Fix the fractional part denominator on RK3588/RK3576 PLLs
    666071b3128ac clk: mediatek: mt8135: Fix inverted gate control for devapc_ck
    1158a9adc7dce clk/x86: pmc_atom: add kasprintf return value check
    b8b81c6c89f0c clk: palmas: Manage external-control prepare with devm
    d35e45e5bad4f clk: mediatek: pllfh: Fix IO remapping leak in register_pllfhs error path
    ac6f7740655d8 clk: mediatek: Refactor pllfh registration to pass device
    c945468a6df72 clk: mediatek: Pass device to clk_hw_register for PLLs
    b7cd043b8412e clk: mediatek: Refactor pll registration to pass device
    03e070e517204 clk: tegra: tegra124-emc: put EMC node on register failure
    75653b0408d52 arm64: dts: allwinner: sun50i-a64-pinephone: Fix mpu6050 mount matrix
    730e71d747051 wifi: mac80211: fix per-STA profile length in cross-link CSA parsing
    da7805f0211af RDMA/efa: Fix PBL chunk length computation
    5f1933163327c RDMA/rxe: Fix UAF in ODP init error-handling path
    1d2271d7df523 iommu/tegra241-cmdqv: Fix VINTF0 leak on the init-failure path
    9b37afb2d34d9 iommu/tegra241-cmdqv: Require exactly one Stream ID for a vSID
    735698e81f798 iommu/tegra241-cmdqv: Free the error IRQ before tearing down VINTFs
    2f627118b6686 iommu/tegra241-cmdqv: Don't run the error ISR before probe sets up vintfs
    bcb82407633c3 iommu/tegra241-cmdqv: Synchronize the error ISR against VINTF (de)init
    792f720fc23fe iommu/tegra241-cmdqv: Publish an LVCMDQ only after it is fully initialized
    aad605a450611 fs/ntfs3: reject restart table growth beyond U16_MAX entries
    7a7d30b1cb890 staging: rtl8723bs: use kfree_sensitive() for key material
    6b2e70e9d52c0 firmware: qcom_scm: Introduce PAS context allocator helper function
    f15cde1129840 remoteproc: Prevent crash handling to race with rproc_del()
    df92f0e142edb remoteproc: core: Attach rproc asynchronously in rproc_add() path via schedule_work()
    d6bf603246c90 remoteproc: Allow shutdown of crashed processors
    a098f5894fcb4 remoteproc: core: Drop redundant initialization of 'ret' in rproc_shutdown()
    8b93b783db329 cpufreq/amd-pstate: Set min_limit_freq based on bios_min_perf
    9b95f10e1688c cpufreq/amd-pstate: Add comment explaining nominal_perf usage for performance policy
    172f24df0dab4 w1: ds2482: Fix signedness bug in ds2482_w1_triplet()
    ef5cc4a8c088d spi: oc-tiny: switch to managed controller allocation
    67e2ffe98d710 clk: mediatek: mt6735: Unregister PLLs on probe failure
    106e1a3b2b345 isofs: release zisofs block pointer buffer head
    c39eb307b4976 powercap: intel_rapl_tpmi: Handle PMU registration failure during probe
    bf32f103a325a thermal/drivers/qcom-spmi-adc-tm5: Drop IIO_VAL_INT check in adc_tm5_get_temp
    686a92cc9f19b thermal/drivers/airoha: Fix copy paste error for sen internal
    a06b2e6b8f508 thermal/drivers/airoha: Fix copy paste error on clamp_t low temp
    5b6cfc6d7ff09 RDMA/mlx5: Fix integer overflow of user QP buffer size
    9c9c64abed530 crypto: keembay - publish OF module alias for OCS AES/SM4
    7efb51a5893b2 crypto: keembay - Initialize completion before requesting IRQ
    cc92af8cc0e4d scsi: ufs: debugfs: Reserve space for a string terminator
    15d4fc8f5f108 power: supply: sbs-battery: Use a per-device serial number buffer
    e505092cb200d arm64: RSI: fix field-spanning write warning in attestation token init
    386600507b23f tools/build: Allow versioning of all LLVM tools defined in Makefile.include
    7f6d898179ca4 pinctrl: mediatek: free EINT resources on unbind
    f54b96e8aadbf cxl/region: Fix use-after-free in find_pos_and_ways() error path
    b804df9aa2942 selftests/bpf: Fix memory leak on subtest_states reallocation
    b7983cd5ba2c7 selftests/bpf: Fix incorrect error checking for pthread_create
    c78a9289084a7 ARM: lpc32xx: only run SoC init on LPC32xx hardware
    85a33c910edc3 bpf: Fix CFI mismatch in task work callback
    4f7e0be664af7 arm64: dts: rockchip: Fix rk3566-bigtreetech-cb2 touchscreen property
    9ca64fd7a2fde arm64: dts: rockchip: Fix Gru WLAN sideband interrupt
    053220e061c7d arm64: dts: rockchip: Add missing hclk for RK3588 eDP1
    f5b4bc09c42f2 arm64: dts: rockchip: Add missing hclk for RK3588 eDP0
    d65261e0902b4 drm/panthor: return PTR_ERR() from devm_drm_dev_alloc()
    64bb6000bfbdf fs/ntfs3: fix out-of-bounds read of INDEX_ROOT in reparse/objid init
    e70d48fcf8382 netfilter: nf_nat_sip: rewind offset when NAT shrinks the packet
    2e199e3ede9c1 drm/tve200: add OF module alias for autoloading
    d9e01c333cebc perf cap: Remove used_root parameter and simplify capability checks
    a73a88bc4f452 leds: pca9532: Fix phantom device registration on missing hardware
    f1e8c4d48583d PM: hibernate: Fix memory leak in snapshot_write_next() error path
    ce7d205c26466 RDMA/erdma: complete object teardown when the destroy command fails
    02deb637e9659 xfrm: Fix skb double-free in xfrm_dev_direct_output()
    78da16d23496f perf cs-etm: Avoid truncating AUX buffer sizes to int
    f78fba8549204 perf cs-etm: Flush thread stacks after decoder reset
    25be36738f5fc riscv: dts: spacemit: k1: Split gmac_clk_ref into independent pinctrl groups
    fe9d15fb66d5e riscv: dts: spacemit: Add OrangePi R2S board device tree
    9933e5f1f61ec riscv: dts: spacemit: add MusePi Pro board device tree
    a76b20b1f0309 firmware: arm_scmi: Unrequest devices if driver registration fails
    456856a349064 firmware: arm_scmi: Roll back partial protocol table registration
    406d5ead1bcb0 cpufreq/amd-pstate: Toggle auto_sel in active mode on shared memory systems
    821b41f6e3e4f cpufreq/amd-pstate: Fix EPP return type and handle errors during initialization
    95ad5fd298bcd cpufreq/amd-pstate: Add support for platform profile class
    471d6659925aa cpufreq/amd-pstate: Add dynamic energy performance preference
    0b99dd4201c25 amd-pstate: Make certain freq_attrs conditionally visible
    ea49944836140 cpufreq/amd-pstate: Use sysfs_match_string() for epp
    baf5a7fd3f3e2 cpufreq: amd-pstate-ut: Skip tests when amd-pstate driver is not active
    937f09ce104c1 ARM: dts: allwinner: a10: Fix PMU interrupt
    3933884bc3102 ext4: check dir entry fits before reading the hash trailer in ext4_search_dir()
    1399f102d8a18 ext4: fix buffer_head leak in ext4_init_orphan_info
    0afbfe019c881 RDMA/bnxt_re: Clear VM_MAYWRITE on DBR/toggle page mmap
    72a5e45f606ec wifi: ath11k: Avoid buffer overread in ath11k_wmi_tlv_op_rx()
    95d1bd1db9e9d wifi: ath12k: Avoid buffer overread in ath12k_wmi_op_rx()
    ccca0f7d9e906 wifi: ath11k: Correctly copy the hint BSSID in WMI scan request
    8f86a58ab9412 wifi: ath12k: Correctly copy the hint BSSID in WMI scan request
    0c9eac0d1fb47 wifi: ath12k: allocate HOST_DDR and BDF regions after Q6 RO region
    e69fd62e8117e wifi: ath12k: refactor QMI memory assignment
    42bc932e05093 wifi: ath12k: switch to name-based reserved memory lookup
    abda58f4529d7 wifi: ath6kl: avoid buffer overreads in WMI event handlers
    64d445d40e5ea ext4: validate readdir offset before accessing dirent
    bd8d74bd46d09 ext4: use fsdata to track inline data write state and fix race
    4e4e3eec50624 ext4: drain in-flight DIO before buffered write fallback
    aa0042630b1f7 ext4: clear stale xarray tags on folios skipped during writeback
    d7b025d3fdf3c thermal: intel: int3400: clean up ODVP on probe failures
    466358635a2e4 iommu/arm-smmu-v3: Declare eats_s1chk and eats_trans as host-endian u64
    267fb3771ddf6 iommu/qcom: Fix inverted fault report check in qcom_iommu_fault()
    0812b282703a7 iommu/qcom: Remove sysfs device on probe failure path
    8aabe0fba0148 iommu/amd: Fix undefined behavior in devid_write debugfs function
    c3d4ef1c0ca69 firmware: arm_scmi: Fix requested device removal race
    66d65f36d3975 RDMA/core: Fix potential use after free in ib_dealloc_pd_user()
    8b22722f45a29 RDMA/core: Fix potential use after free in uverbs_free_dmah()
    9abea37942534 RDMA/core: Fix potential use after free in ib_free_cq()
    8c013e3a8d827 RDMA/core: Fix potential use after free in counter_release()
    bedd7dee72588 RDMA/core: Fix potential use after free in ib_destroy_srq_user()
    197c262dbf94c RDMA/core: Fix potential use after free in ib_destroy_cq_user()
    038cf231b7099 RDMA/core: Fix use after free in ib_query_qp()
    c538cd121be77 RDMA/core: Add rdma_restrack_begin/abort/commit_del() operations
    a07cba1296aaa RDMA/nldev: Fix locking when accessing mr->pd
    b7091e0e2ebab RDMA/restrack: Fix typos in the comments
    4aaa2ab816c71 RDMA/mana_ib: drain QP references after partial table insertion
    a60c36d8d17f1 RDMA/erdma: Fix CEQ tasklet use-after-free on removal
    53446b921cdd6 PCI: j721e: Fix incorrect max_lanes for J7200
    8c24bda66dd1c RDMA/srpt: Pass the mapped task attribute to target_init_cmd()
    e42cede6f9017 bpf: Mark bpf_refcount field as unique
    28d5f20ed022a bpf: Preserve unique-field state across nested structs
    dfdce1f20a7e5 bpf: Fix offset warn check for bpf_res_spin_lock
    2d2616b4f3728 virt: arm-cca-guest: use migrate_disable() for attestation token requests
    662f242863fd8 ACPI: battery: Adjust charging status validation check
    26d9496c82658 bpf, riscv: Fix extable handling for arena load_acquire
    34b1bb33a0257 riscv, bpf: Fix kernel stack corruption in tailcall with CFI
    5cadc66b534fe riscv, bpf: Fix memory leak in bpf_jit_free
    e991c317d4a00 libbpf: Search /lib64 and /lib in resolve_full_path()
    1534c4bff3aac bpf: Zero queue and stack outputs on lock failure
    5af710a4f3e39 platform/x86: acer-wmi: reject missing gaming WMI results
    7ace189b9ea79 ext4: skip extra isize expansion during mount to prevent deadlock
    6702c7da86d8c ext4: fix out-of-bounds read in ext4_read_inline_dir()
    e4223231b6860 ext4: fix circular lock dependency in ext4_ext_migrate
    3eee4c21931dc ACPI: PCI: Clear driver_data on all paths that free the acpi_pci_root
    4d8ecaa332c16 ACPI: processor: validate MADT IOAPIC entry bounds
    87735eb21d7e5 ACPI: EC: Avoid _REG disconnect on GPIO IRQ defer
    0bfa897e3e1a6 RDMA/nldev: validate dynamic counter attribute length
    6eb1f1414bf70 irqchip/gic-v3-its: Prevent leak in its_vpe_irq_domain_alloc()
    93290f29be8f9 selftests/bpf: Silence array bounds warning in global_map_resize
    03cf3a1d950f4 selftests/bpf: Check malloc result with ASSERT_NEQ in test_sha256
    86ce84cf93d2c x86/bugs: Don't use cpu-type matching in cpu_vuln_blacklist
    1654875005c7b arm64: dts: imx8-ss-audio: Fix LPCG clock indices for ASRC0
    18b1deba71546 kcsan: avoid unintended access checking in NMIs
    af073bd245180 RDMA/srpt: Fix srpt_alloc_rw_ctxs() unwind counters
    13cb7160e5b79 RDMA/rxe: Validate num_sge/cur_sge before indexing wqe->dma.sge[]
    3416db552eb37 RDMA/hfi1: Propagate sdma_txinit_ahg() errors
    e166856d4ef2d arm64: dts: amlogic: meson-axg-s400: enable mipi_pcie_analog_dphy for PCIe
    0da7e87b3044d arm64: dts: amlogic: meson-axg: Add missing nand_rb0 pin to nand_all_pins
    624ddc40f2185 phy: starfive: Fix runtime PM cleanup in JH7110 DPHY RX probe
    41cacaa222b0d phy: starfive: Fix runtime PM cleanup in JH7110 DPHY TX probe
    8fec16898f184 ASoC: meson: Keep link pointers valid on realloc failure
    20b92646ee030 dmaengine: dw-edma: Clear stale requests on termination
    fe0ffa0190e86 dmaengine: dw-edma: Serialize channel state checks
    0c3294066c36d dmaengine: dw-edma: Serialize abort state updates
    be87d86537de7 dmaengine: dw-edma: Terminate all descriptors without callbacks
    a968dffa5ab3c bpf: Reject arena frees below the arena base
    122ad34f72583 drm/msm/a6xx: Fix RBBM_CLOCK_CNTL3_TP0 value in a730_hwcg
    333246218efd5 driver core: soc: Unregister bus on early device registration failure
    df5466412b362 software node: Fix software_node_get_reference_args() with index -1
    13a234359ca8d perf ui hists: Fix uninitialized stack memory free on pstack allocation failure
    398aca2f90122 mtd: part: reject MTDPART_OFS_RETAIN in mtd_add_partition()
    5c349c533e72a mtd: mtdswap: Avoid freeing registered blktrans device twice
    b63058bd5e1be mtd: intel-dg: Fix runtime PM error path in probe
    31f3f496da280 mtd: intel-dg: wake card on operations
    533d0c5feef85 vfio/pci: clear vdev->msi_perm after freeing it on init failure
    21d576fc7e298 char: xilinx_hwicap: unregister class on init errors
    1a3258e105f71 ipack: ipoctal: fix UAF, null-ptr-deref, and use-after-free in cleanup on remove
    29df4ee11433c ppdev: prevent overflow when setting port timeout
    e4a7ace58941e cacheinfo: don't propagate DT/ACPI error when arch supplies info (arm64)
    98bb638f583db misc: lan966x_pci: depopulate children on populate failure
    c7ff7a70f405a misc: ad525x_dpot: use driver core groups for sysfs files
    c8b85cad0fa49 misc: rtsx: add missing write register handling
    a45d6dd3c11e9 misc: bcm-vk: Use acquire/release for msgq_inited
    5310334762c3f speakup: keyhelp: guard letter_offsets possible out-of-range indexing
    8688fe2941d54 accessibility: speakup: Fix incorrect string length computation in report_char_chartab_status()
    16695e9059d80 uio: Fix stale info pointer in failed registration path
    1e805a7f4fe01 gpib: Move stuck SRQ update under lock
    6c9f6a3b9fdd3 staging: rtl8723bs: fix xmit_frame/xmit_buf leaks on mgnt-frame error paths
    28ebc34373f04 staging: rtl8723bs: remove multiple blank lines in core/
    368f19a5ed15f staging: rtl8723bs: replace rtw_zmalloc() with kzalloc()
    aa89cd88ae034 staging: rtl8723bs: expand multiple assignment into separate statements
    87ccaea185696 staging: rtl8723bs: fix operator and type cast spacing
    d8664fa56c46b staging: rtl8723bs: use standard offsetof in cfg80211 operations
    11b3765fcb71d staging: rtl8723bs: Fix operator spacing in rtw_security.c
    8da8fd3df9fc1 UDF symlink pathComponent header OOB read
    f42e35e9a7e69 tty: hvc: restrict HVC_DCC to ARMv6+ and ARM64
    2ed25c9d4400c usb: gadget: f_uac1_legacy: remove broken string configfs attributes
    772f29206544f ACPI: processor: idle: Expand _LPI package sanity checks
    19ae79f185bc5 crypto: sl3516 - drop invalid sg_dma_len checks before DMA mapping
    d43e1bbfd4345 drm/msm: Only fini scheduler after successful init
    6c472fde2c809 drm/msm: Fix task_struct reference leak in recover_worker
    133c9aa5b896c drm/msm/a6xx: Fix A621 GPUCC register list for state capture
    15d9b29c7da18 drm/msm/a6xx: Rebase GMU register offsets
    8bc35465c51be drm/msm/a6xx: Fix A663 GPUCC register list for state capture
    e36284257eeca drm/msm: Recover HW before retire hung submit
    8298883bb3edb drm/msm/a6xx: Fix stale rpmh votes after suspend
    9ad7a6ccc7b83 gpu: host1x: Avoid stack over-read in debug output helpers
    9211efca5c657 gpu: host1x: Fix offset calculation in trace_write_gather
    6b7d5abf3e374 wifi: iwlwifi: mei: pass correct argument to function
    f26f72c244882 wifi: iwlwifi: guard against division by zero in iwl_dbg_tlv_alloc_fragments
    242125bbf19a2 wifi: iwlwifi: mei: check SAP message length before reading it
    c9d8641aea01c wifi: iwlwifi: mvm: fix off-by-one in TXF key sanitiser
    8d8a526f3ec65 wifi: iwlwifi: fix counter type in iwl_fwrt_dump_error_logs
    f20b182ff2d44 spi: geni-qcom: Fix sticky ret causing wrong return value on invalid proto
    badb810da2b09 soc: renesas: r8a78000: Drop duplicate "default ARCH_RENESAS"
    d9f25cc138c74 clk: qcom: gcc-glymur: Enable runtime PM
    563a1fcf551cd perf jevents: Add more components to the metric sorting order
    0b5f752d635c5 arm64: dts: qcom: sm8250: correct frequencies in the Iris OPP table
    c795f18678de6 arm64: dts: qcom: sm8250: sort out Iris power domains
    4e59a0b78e048 arm64: qcom: ipq5018: Add GEPHY RX and TX clocks
    c9fed0c7056c5 arm64: dts: qcom: ipq5018: Correct CMN PLL reference clock rate
    5d0fc8094678f arm64: dts: qcom: sc8280xp-x13s: Fix the drive-strength of mclk pin
    188344787dacb arm64: dts: qcom: msm8996-xiaomi-gemini: Fix up ti,drv2604 enable GPIO
    591b6fac9df3f x86/mm/pat: Take cpa_lock around large-page collapse
    57c567e0e8aa7 drm/bridge: tc358767: clamp the reported AUX read size to the request
    b6b68da41b270 perf: evsel: Fix error handling in tp_format lookup
    4bc18263ef7ac remoteproc: qcom: Fix glink->node reference leak in qcom_add_glink_subdev
    b44f085fb484d cpufreq: schedutil: Fix self-contradictory comment in sugov_iowait_apply()
    c23a708a71afc cpufreq: intel_pstate: Fix setting minimum P-state at init time
    ce51fcf0d2385 drm/amd/display: Remove unused-but-set variable hubp from
    8ee385305e890 drm/amd/display: Fix DM I2C teardown race
    5323ed5a7bb25 media: ipu6: Do not free aux device pdata after init
    2c29cd408ef86 media: bcm2835-unicam: Fix asc leaked in error/remove path
    96baeead354ab media: i2c: rdacm21: Fix missing media_entity_cleanup()
    9acc996cb2e84 irqchip/renesas-irqc: Fix generic interrupt chip leak on remove
    f6f6bdf1708ac PCI: xgene: Drop unnecessary OF node reference
    9c001b7dd4d6c cpufreq: spear: Fix an IS_ERR() vs NULL bug in spear1340_set_cpu_rate()
    6a37acecc7c29 dax: read holder_ops once in dax_holder_notify_failure()
    91be086330c3f libnvdimm/labels: Bound the on-media label size before the shift
    25b472c156364 tools/sched_ext: scx_qmap: Fix stale API name in comment
    85e5eeb651a13 regulator: adp5055: Fix error code in adp5055_of_parse_cb()
    b8abbd5c2928f cxl/features: Clamp Get Feature output size to the remaining buffer
    1281dc84c8157 cxl/features: Reject Set Features output buffer smaller than the header
    3f02031a0a53d cxl/features: Reject Get Feature count larger than the output buffer
    c656427440ea6 firmware: arm_scmi: Fix transport device teardown lookup
    3b0b02134ab90 firmware: arm_scmi: Unwind P2A receiver mailbox setup failure
    717b8e972a667 firmware: arm_scmi: Unwind TX receiver mailbox setup failure
    a54dc23e8bd22 firmware: arm_scmi: Drop handle on protocol bind failures
    8197bc6acc517 firmware: arm_scmi: Protect device request lookup with RCU
    71c1f8ced3cc0 firmware: arm_scmi: Use channel ID for transport teardown
    e66756313d1b4 firmware: arm_scmi: Reject out of range DT protocol IDs
    54e5a4f7d83db firmware: arm_scmi: Avoid IDR updates while cleaning channels
    d7c60c0fe2bd4 firmware: arm_scmi: Free transport channel on IDR failure
    d33b2b68bce6d firmware: arm_scmi: Clean up channels on setup failure
    2aac23bc0a79a firmware: arm_scmi: Quiesce notifications before teardown
    f5e528f631425 firmware: arm_scmi: Unregister device notifier before IDR teardown
    1bea027f7ef6f firmware: arm_scmi: Publish channel state before callbacks
    b967c097d1b6a x86/entry/fred: Encode frame pointer on entry
    2bb2a778a4873 wifi: ath11k: cap out-of-range rx MCS instead of leaving bogus rate
    e31985c67ba00 hfsplus: validate thread record before delete key rebuild
    5b894d01117b2 cxl/port: Restart port enumeration when a sibling adds the dport first
    7a14b995931f1 cxl/pci: Honor -EPROBE_DEFER from component register setup
    6ad491cef1a81 cxl/mbox: Break poison list loop on an empty payload
    485bf44090491 cxl/memdev: Fix firmware upload exact-fit handling
    a97eef0d6e2fe iommufd: Simplify iommufd_device_remove_vdev()
    ecad679e2b92c rpmsg: glink: fix deadlock in endpoint destroy during driver detach
    dd2b56f44be49 rpmsg: glink: remove duplicate code for rpmsg device remove
    c7f41c7f7d68f perf record: Fix multiple PERF_RECORD_COMPRESSED2 records per push
    f476567a3a965 perf record: Return the written size from process_comp_header()
    8b771b43710f7 perf zstd: Fix compression error path in zstd_compress_stream_to_records()
    ae69f936e8ffe fs/resctrl: Prevent use-after-free in rdtgroup_kn_put()
    65e55f34fb2d6 media: v4l2-async: Unregister sub-device if asc_list is empty
    f0b084c999606 iommufd/selftest: Avoid selftest dirty bitmap size wrap
    cd616aa0449a7 isofs: fix out-of-bounds page array access on empty zisofs block
    81ff877e458e0 ASoC: apple: mca: increase SERDES reset delay
    1b769e5d5c33c RDMA/hfi1: Initialize debugfs after probe completes
    a913960dd85dc RDMA/hfi1: Stop flushing the global IB workqueue
    e32f985ea38aa RDMA/hfi1: Create workqueues before device initialization
    460aaad5044d5 RDMA/hfi1: Remove redundant PCI device ID validation
    149a14ec70887 RDMA/hfi1: Free RX data on late probe failure
    fd4d3ad5f244a RDMA/hfi1: Preserve unit 0 on allocation failure
    186df50ce26fb misc: rtsx_usb: avoid USB I/O in runtime autosuspend
    1c1c2df09daac pmdomain: bcm: bcm2835: handle genpd provider registration errors
    36cbb7249819a ALSA: hpi: Check transport errors during HPI6000 adapter initialization
    0f679e0523ddf xfrm6: fix out-of-bounds write in xfrm6_input_addr() when secpath is full
    b0f7343a002f9 crash_dump: release keyring reference at the correct time
    c115b908e3508 hwrng: ks-sa - Fix runtime PM cleanup on registration failure
    4a52a2fb96d10 crypto: ccp - Fix memory leak in SEV INIT_EX path
    634e56b4f9913 Revert "drm/msm: dsi: fix PLL init in bonded mode"
    287f458ca2251 drm/msm/dp: add missing drm_edid_connector_update() before add_modes on cached EDID
    399713f1f0eac RDMA/rxe: Avoid reprocessing the current packet after the QP enters the error state
    8dc5ffcb8efcc RDMA/ipoib: Drain RCU callbacks during module teardown
    7babc25d8dd5b RDMA/mlx5: Drain RCU callbacks during module teardown
    9d998297fdaf4 RDMA/core: Wait for RCU callbacks before unloading ib_core
    0e5c6bf4a04c8 iio: accel: dmard09: Implement IIO_CHAN_INFO_SCALE
    dbe8894db922c wifi: rtw89: 8852a: fix RSSI report when average beacon RSSI is not ready
    6e4b73b6b743d wifi: rtw89: phy: support per PHY RX statistics
    0bae3ec6a16a9 wifi: rtw89: mlo: rearrange MLSR link decision flow
    e0abd0b1e2f56 wifi: rtw89: debug: add parser to diagnose along DIAG_MAC fw element
    84cb2ae9c0123 wifi: rtw89: fw: parse firmware element of DIAG_MAC
    f345b7d23c6f0 wifi: rtw89: pci: add to read PCI configuration space from common code
    0cfc9348a045d bpf: Require a BPF cpumask for bpf_cpumask_populate()
    abe7ac019ad99 tools/sched_ext: Strip compatibility macros for cgroup and dispatch APIs
    9257ece49ae72 clk: qcom: camcc-sc8280xp: unregister CAMCC_GDSC_CLK
    086ac3881a8c2 bus: qcom-ebi2: use managed resources for clocks and children
    03991f9a561ce soc: qcom: rpmh-rsc: manage PM notifiers with devres
    dae798b950388 perf metricgroup: Fix metric expression copy leaks
    846ce4d3fda94 drm/panel: samsung-s6d16d0: Power off on prepare failure
    39b000d393dea usb: typec: ucsi: gaokun: unwind notifier on UCSI register failure
    7f2d926a464bb usb: ucsi: huawei_gaokun: support mode switching
    6b0d4519bcf09 usb: renesas_usbhs: Fix power-off ordering on unbind
    f0cfba808e632 usb: mtu3: allow system suspend during active gadget connection
    7fea5a310e3b2 platform/surface: acpi-notify: Check ACPI companion before use
    71ba8b6e28f7a platform/mellanox: mlxbf-pmc: Check ACPI_COMPANION() against NULL
    7e795801295c8 usb: fix UAF when probe runs concurrent to dyn ID removal
    ff6e88e29965b usb: gadget: aspeed_udc: check endpoint DMA allocation
    aed958c4f784a usb: ljca: bound bank_num in ljca_enumerate_gpio()
    afbf39c0f2297 usb: gadget: configfs: fix out-of-bounds read of qw_sign
    5fd8baacc7dc4 usb: gadget: f_fs: Fix fence cleanup in ffs_dmabuf_transfer() error paths
    c02d030747c46 serial: qcom-geni: do not advance stale DMA completions
    783961be18f5c serial: ma35d1: Fix OF node reference leaks in console init
    4e2a433822524 serial: 8250: Clear CON_PRINTBUFFER on port re-registration
    45c64f2c09b2d serial: 8250: Add support for console flow control
    71d8fcbb767b8 serial: 8250: Set cons_flow on port registration
    7416aefeeb822 serial: Replace driver usage of UPF_CONS_FLOW
    b897b1f791f34 serial: core: Add dedicated uart_port field for console flow
    ed07324ed4871 spi: qcom-geni: Fix missing error check on pm_runtime_get_sync()
    4c59f0e5ee0df perf capstone: Fix kernel map reference count leak
    45181de1077c0 selftests/sched_ext: Fix bpf_link leak on early return in prog_run
    892bb4715265f hwspinlock: propagate errno when registering single lock
    7420aac8b1f7e remoteproc: qcom_q6v5_adsp: Fix reference leak for device node
    9a85e2d35e542 platform/x86: lg-laptop: Fix LED resource handling
    c5c3e0036a7ae platform/x86: lg-laptop: Convert ACPI driver to a platform one
    f7f83b0826738 platform/x86: lg-laptop: Drop debug-only ACPI notify handler
    6ff6af62f042b platform/x86: dell-wmi-base: Fix resource leak on module load failure
    9f860050c3d17 platform/x86: dell-privacy: Fix race condition
    c9729ced165d6 ACPI: RISC-V: Fix riscv_acpi_add_prt_dep() loop handling
    4cdcf4e19ed31 ACPI: RISC-V: Check acpi_get_handle() status in riscv_acpi_add_prt_dep()
    7857f19b5219c ACPI: RISC-V: Fix riscv_acpi_irq_get_dep() loop termination
    fbf9bb81b2153 printk: Fix possible console use-after-free
    b84065e9a8307 printk: Introduce console_flush_one_record
    d095438ac3320 leds: st1202: Validate LED reg property against channel count
    4efb94335d70f leds: st1202: Disable channel when brightness is set to zero
    9666b92fe2383 leds: st1202: Fix brightness having no effect while pattern mode is active
    2176b43f70da0 leds: st1202: Set all pattern PWM slots to full after clearing pattern
    48a05db611027 leds: st1202: Fix spurious pattern sequence start in setup
    45dee22d52fd9 leds: st1202: Fix pattern duration prescaler and pattern_clear skip marker
    b8136daec6308 leds: st1202: Stop pattern sequence before reprogramming
    e774c612b7f8e leds: pca9532: Fix inverted GPIO output polarity
    fb43400a3a0f3 iommu/amd: Fix false positive in SB IOAPIC IVRS validation
    21750cb34ca87 iommu/amd: Add support for Hygon family 18h model 4h IOAPIC
    1fe5653706500 iommu/amd: Prevent SB IOAPIC from overriding IVRS validation errors
    3df590e85e1a2 iommu/msm: Return -ENOMEM on memory allocation failure in probe
    9fb04596eb957 bpf: Fix security_bpf_map_create error handling
    e7eda48c34679 iommu/mediatek-v1: Fix off-by-one in MT2701_LARB_NR_MAX
    5587e7871ce99 bus: mhi: ep: Fix device refcount leak in the error path of MHI device creation
    86d54cf069fc5 bpf: Fix use-after-free on mm_struct in bpf_find_vma()
    ca71ee2f6c28c efi: fix stale reference to efi_recover_from_page_fault()
    2892f3f44bf86 bpf: Fix vmlinux BTF prep race in bpf_get_btf_vmlinux
    78cae066f029a perf dso: Fix kallsyms DSO detection with fallback logic
    e69d90bfae1aa perf vendor events amd: Reintroduce deprecated Zen 5 core events
    71e3023c5dddf bpftool: Check EVP_Digest when computing excl_prog_hash
    11afe1912140f udf: Mark LVID buffer as uptodate before marking it dirty
    6648c47091837 usb: gadget: r8a66597: avoid double free of ep0_req in probe error path
    1f44d001620fd usb: typec: ucsi: unregister debugfs entries on teardown
    35bf61798e7d4 thermal/drivers/rcar: Fix error checking in probe()
    593fda71983b9 staging: media: ipu7: fix pm_runtime refcount leak in ipu7_resume()
    fb9fab1a4d635 staging: media: ipu7: fix pm_runtime refcount leak in ipu7_init_fw_code_region_by_sys()
    947056a91d232 perf data convert json: Fix trace_seq memory leak in process_sample_event()
    4b759af64a214 clk: qcom: gcc-qcs8300: Use retention for USB power domains
    a2e4ebada6840 clk: qcom: gcc-qcs8300: Use retention for PCIe power domains
    448f948c9767c arm64: dts: qcom: sc8180x-lenovo-flex-5g: Describe the display power net
    3a624b08d7736 arm64: dts: qcom: sc8180x-lenovo-flex-5g: Rename regulator nodes
    25026bef5183c arm64: dts: qcom: sc8180x-primus: Describe the display power net
    76208cf896aab arm64: dts: qcom: sc8180x-primus: Rename regulator nodes
    badb18b11215b arm64: dts: qcom: sc8280xp-arcata: Fix top USB-C DP alt mode
    f60f495858379 clk: qcom: gdsc: tear down per-domain genpds in gdsc_unregister()
    f8fe8cb89d3a8 clk: qcom: gdsc: propagate gdsc_enable() failure for ALWAYS_ON domains
    e97f24ad63b83 clk: qcom: gdsc: propagate gdsc_check_status() errors from gdsc_poll_status
    27b68ba9af9dd arm64: dts: qcom: Add #{address,size}-cells to Chromium-based /firmware
    05a95478f9603 timekeeping: Account for monotonicity adjustment in ntp_error
    0fcf7857ae110 y2038: uapi: Use 64-bit __kernel_old_timespec::tv_nsec on x32
    db667d2970c75 time/namespace: Validate nanosecond field in proc_timens_set_offset()
    ecd622375e6d5 timens: Simplify some calls to put_time_ns()
    453812e92c760 timens: Add a __free() wrapper for put_time_ns()
    b19176ff94a01 vdso/timens: Move functions to new file
    6e4b520553836 x86/tsx: Make tsx_ctrl_state static
    e165c01653920 timers/migration: Fix memory leak in tmigr_setup_groups() error path
    ed7472619e614 timekeeping: Unwind aux clock sysfs children on failure
    4222494df71bd clocksource: Unregister subsystem on device registration failure
    f84b1c25712ab selftests: timers: leap-a-day: Fix -w option and update usage comment
    d76656e421466 irqchip/gic-v3-its: Fix its node leak in gic_acpi_parse_madt_its()
    68de28e0a098a irqchip/gic-v3-its: Fix memleak in its_probe_one()
    8da5dc215ebc9 selftests/lsm: Fix memory leak in attr_lsm_count
    4d6923a9912da selftests/bpf: Fix memory leak in msg_alloc_iov
    58dc854c302a1 selftests/bpf: Fix memory leak in msg_alloc_iov error path
    3201c4e882847 ALSA: via82xx: Remove unreachable branch in snd_via686_pcm_pointer()
    737c928ff5092 staging: rtl8723bs: fix mismatched free of HalData in rtw_sdio_if1_init()
    89f9f433271fa staging: octeon: add missing napi_disable in cvm_oct_rx_shutdown
    ab63b49bad0da staging: octeon: replace pr_warn with dev_warn in fill and rx paths
    b62bc652590fe staging: octeon: ethernet-mem: replace pr_warn with dev_warn in free functions
    269d16a78a5be staging: octeon: fix free_irq dev_id mismatch in cvm_oct_rx_shutdown
    2c0c9956596e4 staging: octeon: add missing tasklet_kill in cvm_oct_tx_shutdown
    bcd95498f0cfe staging: fbtft: Use sysfs_emit_at() to print to sysfs file
    c9191f2e2f35f greybus: audio: bound the topology section sizes against the fetched size
    c458311637182 staging: sm750fb: Add missing Kconfig dependency
    af65ceb437971 staging: sm750fb: gate dualview dataflow using g_dualview
    311a2e65e42af staging: greybus: audio: correct sscanf() return value check
    e7fccad2c8e6e wifi: mac80211_hwsim: avoid NULL skb in stop queue drain
    2496d9829ab5e bus: qcom-ebi2: Fix clock leak on probe failure
    e6edd7339153c bus: qcom-ebi2: Simplify with scoped for each OF child loop
    3cf9e40432c5d clk: qcom: gcc-glymur: Move EVA clocks to critical clock list
    7be3c0bae7c58 arm64: dts: qcom: hamoa: Fix clocks for HSPHYs
    62b399c4e9856 arm64: dts: qcom: sm7225-fairphone-fp4: Fix address in fb node name
    a81fad1ff1047 arm64: dts: qcom: sc8280xp-blackrock: switch to uefi rtc offset
    e5965ae3f7c91 cgroup/cpuset: Make nr_deadline_tasks an atomic_t
    3a1b23f9ede95 PM: sleep: Fix off-by-one in wakelocks number limit check
    0f297bc93bbfd bus: ti-sysc: Fix /chosen node reference leak
    ca795fc1d8a1a nvmet-rdma: fix response resource leak on queue teardown
    0fed8c64266c2 nvmet-rdma: factor out response resource cleanup
    e5a79244a3c52 nvme-apple: Use acquire/release for queue enabled state
    7117f27eb3bfb arm64: dts: qcom: sm8750: wire UFS to ice instance
    07974c267f603 RDMA/irdma: Add refcounting to user ring MRs
    2ed1164153e92 RDMA/irdma: Add irdma_cq fields to track pbl allocations
    e11379ca6e90b RDMA/irdma: Add a refcount to track user ring MR associations
    8fb2c3106a911 RDMA/irdma: Deduplicate the irdma_del_memlist logic
    5bbb726d27ff6 crypto: keembay - Fix AEAD unregister count in error path
    e7d8ddd471d28 crypto: rk3288 - fail ahash requests on HASH idle timeout
    62219775a07ce hwrng: xilinx-trng - propagate timeout before any data is read
    91ded4742fcde crypto: sa2ul - stop probe if context pool creation fails
    f4d347fb1309b crypto: atmel-sha204a - fix heap info leak on I2C transfer failure
    e64d6f1aae8c8 crypto: atmel-ecc - reject hardware ECDH without a public key
    9af019e213ada crypto: qat - clear AES key schedule from stack
    6b19f343ae8ad crypto: qat - cancel work on re-enable SR-IOV timeout
    cf293c9c7424d hwrng: core - fix rng list on registration error
    48b8b438d2342 perf vendor events amd: Update Zen 5 core events
    0f456e4eca61a perf/x86/amd/uncore: Add group validation
    c6466466185c1 perf cs-etm: Fix thread leaks on trace queue init failure
    47b3686dd841a tools/nolibc: mark arg1 operand in __nolibc_syscall0() as write-only
    e3aa0446e37d1 fanotify: initialize permission event watchdog state
    f2a01deff7d0d wifi: rtw89: fix HE extended capability length check
    8f68dd7e4b2f9 wifi: rtw89: check return values in rtw89_ops_start_ap()
    74f26d1fa61b2 wifi: rtw89: update format of addr cam H2C command
    19052c700bff0 wifi: rtw89: fill addr cam H2C command by struct
    847a5ba0ac75f platform/chrome: sensorhub: Fix memory overread in ring handler
    e4e2d06623d32 selftests/rseq: Replace glibc-specific __GNUC_PREREQ with portable check
    a776afa894245 csky: Fix a4/a5 restoration in syscall trace path
    5ac21c880dcd6 iio: orientation: hid-sensor-rotation: Avoid race between callback setup and device exposure
    69f73ad463b2e soundwire: qcom: Fix port exhaustion check in stream_alloc_ports
    a13974410cee7 dmaengine: hisilicon: Return -ENOMEM on dynamic memory allocation in probe
    32f69e6c95b59 dmaengine: zynqmp_dma: fix race between runtime PM and device removal
    ec927657524be dmaengine: xilinx_dma: Fix channel idle state management in AXIDMA and MCDMA interrupt handlers
    e429184ed58d6 dmaengine: mediatek: mtk-uart-apdma: Return -ENOMEM on memory allocation failure
    bc3b5e6519b8d mm/mm_init: handle alloc_percpu failure in free_area_init_core_hotplug
    d3498c7b587b7 mm: name the anonymous MMOP enum as enum mmop
    420d65038c344 mm: change type of state in struct memory_block
    fff12ff7b3c47 mm: convert memory block states (MEM_*) macros to enum
    d5f2f741a9001 bpf,lsm: Drop bpf_prog_free from sleepable_lsm_hooks
    01c5ad41cf4db selftests/bpf: Mask socket type flags in mptcpify prog
    d51a838da7a79 selftests/bpf: Systematically add SO_REUSEADDR in start_server_addr
    5e9f698298355 bpf: Copy per-CPU map value padding in copy_map_value_long()
    e5f6d43168b2e tools/bpf/bpftool: Reset vmlinux BTF after struct_ops commands
    82a43463ab091 tools/bpf/bpftool: Reset vmlinux BTF after map commands
    46d27e56dbd63 drm/amdgpu/pm/powerplay: bounds-check voltage index in Vega10 lookup
    8a3db9f593b64 drm/amdgpu/pm/powerplay: bounds-check voltage index in SMU7 lookup
    68ce4f8223b78 regulator: tps6594: Fix device node reference leaks in multiphase loop
    506a6aca57c78 perf tests: Fix flakiness in branch stack sampling tests
    7980e2a92a76a perf test: Fixes for check branch stack sampling
    82c0378d4569b perf tests: Fix flakiness in BPF counters test on hybrid systems
    da65eac26fb1f perf test: Fix perf stat --bpf-counters on hybrid machines
    0eec12a34b949 perf tests: Fix flakiness in trace record and replay test
    81877759d7161 perf tests: Add robust record retry helper and use subsecond workloads
    2ab5938f8427c perf test kvm: Add some basic perf kvm test coverage
    f597922c6e521 perf tests: Skip metrics validation if system-wide recording lacks permission
    98e165f28d9b4 perf test: Do not skip when some metrics tests succeeded
    79ddb9f98a8ae perf test all metrics: Fully ignore Default metric failures
    2f1b696dbbb26 perf test metrics: Update all metrics for possibly failing default metrics
    97660f007672a perf test: Truncate test description to fit terminal width
    de9c6dc47601f perf test: Truncate printed test descriptions dynamically to avoid terminal wrapping
    17e39d310b884 perf test: Add -j/--junit option for JUnit XML test reports
    bdd10298be150 perf test: Fix subtest status alignment for multi-digit indexes
    68a81a1eb8d3c perf test: Add summary reporting
    456e1e7ce2092 perf test: Show snippet failure output for verbose=1
    a3d0aad7e44a1 perf test: Refactor parallel poll loop to drain all pipes simultaneously
    1acc1bedf4e69 perf test: Drain pipe after child finishes to avoid losing output
    a2590ff90dca6 wifi: ath12k: correct monitor destination ring size
    5d80268945dfe media: keymaps: Remove obsolete RC_MAP_HAUPPAUGE_NEW keymap define
    6ee86a39a2ff6 media: keymaps: Remove obsolete RC_MAP_RC5_TV keymap define
    9be10543297f0 riscv: kexec_file: Fix crashk_low_res not exclude bug
    68ea6dd23b732 pinctrl: bcm2835: Don't remove an unregistered GPIO chip
    d623e292c6a4c perf/x86/intel/uncore: Keep PCI PMUs working when MMIO/MSR setup fails
    18fdd0978ec3d sched/fair: Fix overflow in update_tg_cfs_runnable()
    912e7263488e1 mm/mm_init: fix incorrect node_spanned_pages
    e2a7cee341986 drm/lima: call drm_mm_init() with a valid allocation range
    d46160ed28478 clk: imx: scu: drop redundant init.ops variable assignment
    79927acbd4594 arm64: dts: imx93-kontron: set memory node to 0x80000000/1GiB
    6b82e11ed1833 ARM: imx: fix device_node refcount leaks in imx7_src_init()
    cfec229dbe9ab ARM: imx: fix device_node refcount leak in imx_src_init()
    9326fd5972eaa clk: hisilicon: reset: Use devm_kzalloc to initialize hisi_reset_controller
    e921cc73fae68 ASoC: fsl_audmix: rework runtime PM handling in probe
    1e8fddab6cbe5 ASoC: rt700-sdw: always drain jack work on remove
    61cae8df14219 clk: stm32: add missing bitfield.h header
    c77bf8b2ca740 clk: nuvoton: ma35d1: fix ma35d1_clk_pll_determine_rate logic
    4c7503f14f25b clk: nuvoton: ma35d1: fix PLL_CTL1_FRAC bit field width and fractional calc
    e165e15e1a9c8 clk: nuvoton: ma35d1: fix ignored div_u64 return values in PLL freq calculation
    5e273be0a987a clk: moxart: remove unused variables, fix refcount leak
    fe3e4196a57a9 clk: versaclock7: Fix APLL clock leak on probe failure
    4ffaaef885fcc cxl/pci: Remove incorrect mbox.valid check in cxl_pci_type3_init_mailbox()
    31d4841eca7c4 cxl/mbox: Clamp mailbox output allocation to the payload size
    5b616612511eb media: cec-pin: Fix event FIFO ordering
    f1fac4561cda1 soc: samsung: exynos-pmu: fix of_node refcount leak in exynos_get_pmu_regmap()
    635914c60da26 HID: roccat: bound device-supplied profile index
    dc32c7423b346 HID: nintendo: Fix imu_timestamp_us double increment per report
    544ebb25bd58f HID: core: quiesce input in hid_hw_stop() to prevent use-after-free
    97093398e75a7 selftests: proc: include fcntl.h in proc-pidns
    e4728288473a5 platform/chrome: cros_ec_typec: Reject out-of-bounds PD cap count
    f633cc23dbcc4 x86/cfi: Use symmetric SYM_START and SYM_END in __CFI_TYPE()
    71ddadef3b912 sched_ext/scx_flatcg: Fix cvtime_delta race and add hweight scaling to bypass charging
    9c73cf53361f2 smack: restrict smackfs/{direct,mapped} values to 0-255
    01d32783bbe01 smack: deduplicate smackfs/{direct,mapped} file_operations
    845525bfb547a smack: simplify write handlers of sysfs entries
    c2ab27c2e1159 smack: fix incorrect task context in smack_msg_queue_msgrcv
    04e674840f7e1 drm/bridge: cdns-mhdp8546: Return an error pointer on allocation failure
    97b8580a112cc drm/bridge: cdns-dsi: Return an error pointer on allocation failure
    4614b7cfaf813 drm/rockchip: vop2: Recognise 10-bit YUV422 as YUV format
    e4c3fb6999a49 drm/rockchip: vop2: Add RK3576 to the RG swap special case
    3a8aa74859dd7 drm/v3d: Clear queue->active_job when v3d_fence_create() fails
    7d65d9651f104 drm/bridge: display-connector: trigger initial HPD event for DP
    826426c26b243 drm/bridge: display-connector: don't autoenable HPD IRQ
    396a193867c6e drm/rockchip: analogix_dp: Fix OF node reference leak via auto cleanup
    55fda5c2887a2 drm/rockchip: analogix_dp: Enable hclk for RK3588
    b4eb01616c0da drm/rockchip: vop2: Wait for layer cfg done before switching LAYERSEL_REGDONE_SEL
    e97f4b4efc1ab drm/rockchip: vop2: Fix wrong wait target in layer cfg done check
    362e005b816ee drm/rockchip: dw_dp: Release core resources
    fe000d791c608 drm/rockchip: dw_dp: Add missing newline in dev_err_probe() message
    82861bdcafda0 drm/rockchip: dw_dp: Simplify error handling
    435de4476dd87 drm/bridge: synopsys: dw-dp: Set pixel mode by platform data
    b2bec2d4a769d drm/bridge: synopsys: dw-dp: Support unregistering the AUX channel
    5afa737da00e5 drm: lcdif: Wait for vblank before disabling DMA
    fa633af222c82 drm: Remove unused header in drm_dumb_buffers.c
    2a0423c648a6d Smack: Fix error in capability bypass
    31507f01ba6d6 KVM: x86: Check EFER validity on KVM_SET_SREGS*
    d975b36e56876 KVM: x86: Move the bulk of register specific code from x86.c to regs.c
    10ddef36d1cc0 KVM: x86: Rename __{g,s}et_sregs2() => kvm_vcpu_ioctl_x86_{g,s}et_sregs2()
    8c03b907b0955 KVM: x86: Extract REGS and SREGS runtime sync code to helpers
    9b046de62b809 KVM: s390: Zero initialize data structures for inject_pfault_token
    310df38690e9f KVM: x86: Disallow EFER.LME and EFER.LMA if long mode is not supported
    5453b85c7ebb6 KVM: arm64: Remove VM-wide VNCR mapping counter
    fd33e8abbcad1 media: dt-bindings: nxp,imx8-isi: Drop fsl,blk-ctrl requirement for i.MX8ULP
    5cbd8761d001c KVM: arm64: Handle VNCR TLB invalidation race with vcpu_put() VNCR unmapping
    892fb48d9dc77 KVM: arm64: nv: Fully update VNCR fixmap state in kvm_translate_vncr()
    8195cf3f4a82e dm-pcache: validate the persisted dirty_tail chain at load
    3d5a87cb909c1 dm-pcache: bound the logical key offset from persistent memory
    01a700e9278da dm-pcache: reject a kset that overruns its segment
    9693980cd7d2f wifi: rtw89: pci: add .shutdown callback to stop rfkill polling on reboot
    9e8dd2a7a8ccb usb: gadget: f_mass_storage: fix null pointer dereference in fsg_common_set_num_buffers()
    d1856e87ee562 usb: cdnsp: fix wakeup from S3 after controller context loss
    3776b82c8099e tracing/probes: Fix anon_stack check for unnamed bitfields in btf_find_struct_member
    240558d6e6caf staging: sm750fb: fix mono image source stride mismatch in lynxfb_ops_imageblit()
    e5daaf27b14db platform/x86: hp-wmi: Add support for OMEN MAX 16-ak0xxx (8DD6)
    1b5c3f11ba548 platform/x86/amd/pmc: Fix msg_port restoration in amd_stb_debugfs_open_v2()
    bf87d1ec3bc23 perf/x86/intel: Remove anythread_deprecated bit from perf_capabilities
    cbb25069fd2e7 mm: fix incorrect vm_flags usage when checking allowable orders for tmpfs
    853043cb12947 mm/secretmem: properly account locked pages
    8e3adebbdd20f mm/mremap: reset unfaulted VMA page offset for MREMAP_DONTUNMAP
    effe3cc6d4fdd mm/huge_memory: transfer the pmd dirty bit to the folio on zap
    4f3145db05fed i3c: master: Fix use-after-free of master->this
    d0cc00957292e i3c: master: Do not treat master device as a duplicate target
    83fd7eca5ab0d ftrace: Take trace_array reference before accessing its ftrace_ops
    3ae455597e3ea clk: qcom: Fix test_ctl_hi field for DEFAULT_EVO PLLs
    45962da5821d0 accel/amdxdna: return early from a zero-length flush
    be072a5d5e35f nvdimm: virtio_pmem: refcount requests for token lifetime
    4fbee1039c460 io_uring/waitid: avoid siginfo copy during ring teardown
    7549d2d113d4a nvdimm: virtio_pmem: use READ_ONCE()/WRITE_ONCE() for wait flags
    0879697520abd io_uring/waitid: honor task_work cancellation
    8c6bc1974311a nvdimm: virtio_pmem: always wake -ENOSPC waiters
    63e1a529bb89b io_uring: add wrapper type for io_req_tw_func_t arg
    c5e2e145bc5e3 nvdimm: virtio_pmem: stop allocating child flush bio
    0860017371131 io_uring: only call io_should_terminate_tw() once for ctx
    d0f37d77b9b4b tracing: Take trace_array reference when opening options file
    23a02ff3464b2 i2c: qcom-cci: fix autosuspend cleanup
    844839aa89e79 futex: Provide rt_mutex_.*_schedule() equivalents for futex scheduling
    770a90c212722 nvdimm: pmem: keep PREFLUSH before data writes
    15d10440b7968 io_uring/waitid: have io_waitid_complete() remove wait queue entry
    76648677aa6ef tracing: Make printk_trace global for tracing system
    538ef70da5229 i2c: qcom-cci: Remove overcautious disable_irq() calls
    884e8484c5fe8 futex: Optimize futex hash bucket access patterns
    5f00df2a88ab4 udf: Fix data loss when converting inline inodes to out of line
    e4cb2bbe73089 tracing/probes: Fix BTF kflag check for anonymous struct member access
    4420cc71841b5 staging: rtl8723bs: fix OOB read in rtw_restruct_wmm_ie()
    6ba2bacc2dd3e ring-buffer: Allow splice reads on static buffers
    f5eed5182d664 platform/x86: ISST: Validate max level for set feature
    08dab7065f936 platform/x86: int1092: Fix potential memory leak in sar_probe()
    929cb3b9dc818 perf: Fix use-after-free when perf mmap() revival races with the last munmap()
    2050d900f9adb PCI: Allow per function PCI slots to fix slot reset on s390
    7fad53ae2052a nvme: skip the zoned limits update if the zone info query failed
    6906fb70af2de net/mlx5e: do not HW-GRO coalesce small frames
    558bfaea4926c mtd: rawnand: pl353: Make sure we use the monolithic helpers for raw accesses
    824348676a50f misc: fastrpc: don't publish fd before copy_to_user() succeeds
    f3d97800b03cd iio: light: apds9306: fix PM reference leak in apds9306_read_data()
    b25232f66e8cd i3c: master: Fix recursive locking during device registration
    e9e52437120fb ALSA: FCP: do not copy out an uninitialised init response
    5881506012f39 nvdimm: preserve flush callback -ENOMEM
    545daf1133323 io_uring: unify task_work cancelation checks
    400607f57f11d tracing: Clean up use of trace_create_maxlat_file()
    871019760cd42 i2c: qcom-cci: Do not check return value of cci_init()
    54bc09b41bf3a compiler_types: Move lock checking attributes to compiler-context-analysis.h
    9e5abb5e2ade0 wifi: mt76: mt7996: bound the device EEPROM address before the EFUSE copy
    84d983e550c75 udf: Move udf_map_block() up
    7d73adba5c851 tracing/probes: ignore id update from btf_type_skip_modifiers
    956cb6c72ae5c staging: rtl8723bs: fix spacing around operators
    cca153095a185 ring-buffer: Show persistent buffer dropped events in trace_pipe file
    803208a50b042 PM: runtime: Wrapper macros for ACQUIRE()/ACQUIRE_ERR()
    0d4fb4f15e550 platform/x86: ISST: Check for admin capability for write commands
    e94b156e5cad0 platform/x86: intel_sar: Check ACPI_HANDLE() against NULL
    b07bcdca18fb9 perf/core: Fix deadlock in perf_mmap() failure path
    1d7be6ff21edc PCI: Introduce PCI_SLOT_PLACEHOLDER constant for slot_nr placeholder value
    b8adb1ffa263c nvme: fold nvme_config_discard() into nvme_update_disk_info()
    2158e178dfc85 net/mlx5e: SHAMPO, Always calculate page size
    285f7f3a651c7 mtd: rawnand: pl353: Add message about ECC mode
    7ef12e1dd06e4 i3c: master: Fix device_register() error path
    69d57dbadb27f dma-buf: dma-heap: don't publish fd before copy_to_user() succeeds
    9d89ffd9101c8 ALSA: usb-audio: Relax __free() variable declarations
    37ac5eb981f42 batman-adv: fix TX priority extraction for BATADV_FORW_MCAST
    a1a0959b2da03 mm/damon/sysfs: read ops_id only once in damon_sysfs_apply_inputs()
    8bcfa58c4277b batman-adv: bla: avoid CRC corruption due to parallel claim add
    a5e4d6cb4f684 batman-adv: dat: atomically update mac addresses
    463743d1d5ef2 drm/amd/display: Scale custom brightness curve from full range
    7e56deae5a796 drm/amd/display: Fix backlight max_brightness to match exported range
    54a97ef102523 net/mlx5e: xsk: Fix unlocked writing to ICOSQ
    f6388029ea9e2 Linux 6.18.51
    d83a9de7cecd4 ksmbd: zero pipe read compound padding
    75640976cf474 cifs: add fscache_resize_cookie() to cifs_setsize()
    d73f79d1a2c26 mm/hugetlb_vmemmap: fix incorrect vmemmap restore in rollback
    15803e2276067 pidfs: protect PIDFD_GET_* ioctls() via ifdef
    ed7380f4621f6 mm/huge_memory: use folio's memcg inside __folio_split()
    80656031dfcd4 migrate: replace RMP_ flags with TTU_ flags
    e4307837d92ca mm/huge_memory: replace can_split_folio() with direct refcount calculation
    f07c94cd3cc20 mm/huge_memory: change folio_split_supported() to folio_check_splittable()
    305f9b6eb8a06 mm: thp: use folio_batch to handle THP splitting in deferred_split_scan()
    0a4a3d7202640 mm: thp: introduce folio_split_queue_lock and its variants
    d913a85cc5f7a mm/damon/core: initialize damos->last_applied
    05bdb7b867bef mm/damon/core-kunit: handle region split failure in filter_out()
    7d4ecfb507f33 mm/damon/sysfs: read addr_unit only once in damon_sysfs_apply_inputs()
    cd6d7f45abc82 mm/damon/core: skip aging from repeated aggressive merging
    081ee85b43096 mm/damon/ops-common: use nr_accesses moving sum for quota score
    cf94a9043f4a6 mm/damon/paddr: drop last same folio access check reuse optimization
    11e4859ec0d8b mm/damon/vaddr: drop last same folio access check optimization
    4c7275444ac65 mm/damon/tests/core-kunit: catch test failure in test_merge_regions_of()
    05dc22d5c4fac iommu/arm-smmu-v3: Add HAFT support for SVA
    c660c017dec1f power: supply: ab8500_fg: fix use-after-free on remove
    68916940332d1 power: supply: ab8500_fg: Remove redundant dev_err()/dev_err_probe()
    62fb3124bf740 Docs/ABI/damon: fix typo in intervals_goal sysfs path
    1811bd8792ee1 mm/hugetlb_vmemmap: fix __hugetlb_vmemmap_optimize_folios()
    dba93b8cceb00 hugetlb: remove VMEMMAP_SYNCHRONIZE_RCU
    e4d1300b457e2 mm: rework compound_head() for power-of-2 sizeof(struct page)
    5cec3e60e9f2d zram: set default primary compressor in zram_destroy_comps()
    fb0e9ecffae59 zram: fix the issue that the write - back limits might overflow
    9a78de3befad6 zram: read slot block idx under slot lock
    fcd467124b19f zram: drop wb_limit_lock
    d1743ec2dd2c8 zram: take write lock in wb limit store handlers
    e7dbcb7a561a2 zram: fix out-of-bounds access in read_block_state()
    878edb39ecf48 zram: fixup read_block_state()
    83dd59ac1c345 NFSD: Prevent client use-after-free during close_lru reaping
    cd489b0358737 NFSD: Prevent client use-after-free during blocked-lock reaping
    7f1abc50ce253 NFSD: Consolidate the revocation-path client unpin
    3be89e8039a85 smb: client: reject a tree connect response whose byte count is too small
    b7e74bccf5887 cifs: Do some preparation prior to organising the function declarations
    672cf86aa6aa0 smb: client: fix OOB read/write from unvalidated DataOffset in coalesce_t2()
    9eed72e9534b1 smb: client: fix UAF and buffer leak in cifs_check_trans2() for malformed secondary T2
    31307a05ed827 cifs: SMB1 split: Separate out SMB1 decls into smb1proto.h
    6493277a52b24 cifs: SMB1 split: Create smb1proto.h for SMB1 declarations
    e7779c9f7e7f9 cifs: Remove dead function prototypes
    b10015807e4c6 smb: client: clear setuid/setgid bit on write with cifsacl/modefromsid/posix extensions
    a3e8b98c823d5 cifs: Scripted clean up fs/smb/client/smb2proto.h
    72796c2ec6e90 cifs: Scripted clean up fs/smb/client/fs_context.h
    4fb5a561866c4 cifs: Scripted clean up fs/smb/client/fscache.h
    1537c6c675104 cifs: Scripted clean up fs/smb/client/cifs_unicode.h
    549bd9868e9d7 NFSD: Prevent client use-after-free during admin state revocation
    3c0a53ee0b442 NFSD: Prevent client use-after-free during delegation revoke
    969b1fefb07d1 nfsd: convert global state_lock to per-net deleg_lock
    6d6b9f6a75c37 nfsd: close shrinker/GC/fsnotify vs per-net shutdown race in filecache
    9031493ef7369 nfsd: fix UAF in async copy cancel and shutdown
    ba0ee9e04b7a0 nfsd: fix fcache_disposal UAF by inlining dispose state into nfsd_net
    f9cec313efb2f nfsd: fix clock domain mismatch in clients_still_reclaiming()
    03c512f22d3fb nfsd: widen nfsd_genl_rqstp address fields to sockaddr_storage
    ccc069d5c47cd nfsd: move struct nfsd_genl_rqstp to nfsctl.c
    430ed49a16cf9 nfsd: check nfsd4_acl_to_attr() return value in nfsd4_create()
    380d138a6b086 net: advertise TCP MSS from the configured MTU, not the learned PMTU
    cfb44c6028e6f tcp: clamp route advmss to TCP_MIN_MSS
    ea44679bc7d21 ipv4: use dst4_mtu() instead of dst_mtu()
    a615a2c8c3062 ipv6: use dst6_mtu() instead of dst_mtu()
    920dacce8734d inet: add dst4_mtu() and dst6_mtu() helpers
    b650560c5ee21 ipv6: add some unlikely()/likely() clauses in ip6_output.c
    a294168185fe8 ipv6: pass proto by value to ipv6_push_nfrag_opts() and ipv6_push_frag_opts()
    194d0fb0ea472 fuse: copy request headers via a stack buffer for io-uring
    b96b0d2c25d14 fuse-uring: use named constants for io-uring iovec indices
    f12ebb0a3ed7d fuse-uring: refactor setting up copy state for payload copying
    121fc8edf5832 fuse-uring: use enum types for header copying
    c46805193fbef fuse-uring: refactor io-uring header copying from ring
    6bb5347e9f8aa fuse-uring: refactor io-uring header copying to ring
    8974575898cd7 fuse: fix missing barrier when checking io-uring readiness
    f1c91222188be PCI: starfive: Fix resource leaks on error paths in host_init()
    e5c1d10003b4d PCI: starfive: Use regulator APIs to control the 3v3 power supply of PCIe slots
    0d72e78c9d38d lockd: fix swapped arguments in nlmsvc_match_ip()
    fcfcba8fe17db ocfs2: validate directory-index entry counts when reading metadata
    625e00fd25ef5 ocfs2: validate dx_root extent list fields during block read
    a1dabe68fb537 ring-buffer: Make cpu_buffer::free_page a buffer_data_read_page
    a6f3b8dfbdf4f ASoC: codecs: aw88261: only check PLL and clock state at power-up
    0ac722e964cdc ASoC: codecs: aw88261: reduce log spam
    d013b7de4dccf remoteproc: qcom: pas: Guard dtb metadata release with dtb_pas_id check
    d6eab9066be0f firmware: qcom_scm: Rename peripheral as pas_id
    9d69422ddaa13 sched/core: Make core-sched flips wait for in-flight selections
    fef4b8f17e1c5 sched: Rework prev_balance() to avoid stale prev references
    c522333c35d48 sched: Add assert_balance_callbacks_empty helper
    c97be9d5ab04c sched_ext: Fix inverted ops.core_sched_before() invocation
    c4ade059aaeb5 scsi: fnic: Use GFP_ATOMIC for VLAN alloc under spinlock
    c98197ee3cd28 RDMA/ionic: Embed counter driver data in rdma_counter allocation
    27b7b0dacae79 sched_ext: Fix exit_task leak on fork failure during enable
    1a3af2262cb38 svcrdma: Reject Read lists that exceed the page budget
    59bcf1b38f898 svcrdma: Reject oversized Read segments at decode time
    3c97b8e76ca2b rpcrdma: arm rn_done before publishing the notification
    9f2f5d0999364 svcrdma: Reorder rpcrdma_rn_unregister before rdma_destroy_id
    ee7f6e5600ae1 svcrdma: Release transport resources synchronously
    3ff45361e9469 SUNRPC: fix gssx_dec_option_array error path bugs
    5563db13c9528 cxl/mce: Make the MCE notifier per-region
    513a9613f7a63 cxl/region: Add helper to check Soft Reserved containment by CXL regions
    040cface98ffd dax/cxl, hmem: Initialize hmem early and defer dax_cxl binding
    dfc86b0c2698e cxl/ras: Fix cxl_rch_get_aer_severity() wrong severity register
    ccf481d73bce6 bpf: Disable preemption in bpf_get_stackid
    b466ff95324f8 bpf: Use stack id functions instead of __bpf_get_stackid
    73ebef25aec49 bpf: Factor stackid_new_bucket from __bpf_get_stackid
    ba1e22a224c39 bpf: Factor stackid_fastpath function from __bpf_get_stackid
    201a381bef3ac bpf: Factor stackid_init function from __bpf_get_stackid
    7c19b94c625dc cpufreq: apple-soc: Fix OPP table cleanup
    e989cede44392 ACPI: TAD: Add locking around AML evaluations
    dd440f6a2e67f ACPI: TAD: Rearrange RT data validation checking
    0a7a192862232 ACPI: x86/rtc-cmos: Use platform device for driver binding
    ec2d81115485d ACPI: x86: cmos_rtc: Create a CMOS RTC platform device
    f2e08c3f994c9 ACPI: CPPC: Reject desired_perf reads on _CPC revision 4+
    7267557ce98cc erofs: skip sufficiently large global buffers when resizing
    03c34309eb1bc HID: mcp2221: clear rxbuf after I2C/SMBus transfer completes
    1a503fbb116da HID: mcp2221: fix OOB write in mcp2221_raw_event()
    3b4709e486490 HID: sony: clean up device list on probe failure
    a15def9a6311e HID: sony: use guard() and scoped_guard()
    d2dd2cced65bc cifs: add cifs_resize_file_locked() to guard fscache_resize_cookie() under i_rwsem
    85d239160dc1b smb/client: emulate small EOF-extending mode 0 fallocate ranges
    41f4c99787398 smb/client: reduce fallocate zero buffer allocation
    c2ae13662137c smb: move some definitions from common/smb2pdu.h into common/fscc.h
    110747ff535e3 ceph: properly decrypt filenames in vmalloc() buffers
    104a51265042b NFSD: Guard admin state-revocation walks with NFSD_NET_UP
    0e763ab306a81 ceph: force a cap message when a deferred revoke can't be acked immediately
    c040e139f1a62 ceph: cap delegated inode count in ceph_parse_deleg_inos()
    8bd3523df1319 cxl/ras: Fix cxl_rch_get_aer_info() out-of-bounds AER register read
    6f9b62687a383 cxl/pci: Move CXL driver's RCH error handling into core/ras_rch.c
    153b5ecd29ed0 usb: gadget: f_fs: Fix Use-After-Free in AIO error path
    f3d31484b3f26 USB: gadget: ffs: fix mm lifetime handling
    06c76d3c389ff mm/page_alloc: don't spin_trylock() in NMI on UP
    22bbde1960d1d x86/xen: fix init of balloon stats again
    6f53c64a880ff xen/balloon: improve accuracy of initial balloon target for dom0
    b4a6050bde9ec mm/slub: fix missing debugfs entries for caches created before sysfs init
    d08ea0fd70386 mm/slab: move and refactor __kmem_cache_alias()
    e7bd804e3c719 mm/rmap: use huge_ptep_get() in try_to_migrate_one()
    54a58d6656dd4 mm/mglru: fix and remove redundant unevictable folio handling
    d4812d21689f1 mm/mglru: use the common routine for dirty/writeback reactivation
    09505232eced5 mm/hugetlb: initialize gigantic bootmem hugepage struct pages earlier
    daeffb841bb96 mm/hugetlb: refactor code around vmemmap_walk
    b662d7bcb5ecd mm/hugetlb: defer vmemmap population for bootmem hugepages
    edc017be82664 rust: bug: prevent dead_code warning from warn_on!'s flags constant
    cf24ce48d6022 pidfd: hold exec_update_lock around namespace ioctl
    7aa9ab5321589 pidfs: simplify PIDFD_GET_<type>_NAMESPACE ioctls
    2fa220bc0f845 ovl: fix double end_creating() on the casefold-mismatch path
    1c4b90902c05c crypto: atmel-ecc - avoid stale fallback key after set_secret failure
    5c1e763b713f0 crypto: atmel-ecc - clean up and improve ECDH comments
    e39767b9a54d9 crypto: atmel-ecc - replace min_t with min
    fc933a4a419ba crypto: iaa - unmap dst before software fallback on decompress
    4fcbc9f4082ca crypto: iaa - fall back to software for multi-entry scatterlists
    1517d1996b523 vlan: fix skb_under_panic and races when toggling HW VLAN offload
    ed25ed29034dd net/packet: defer vmalloc TX_RING free until skbs finish
    0f93090445294 fuse: fix race between interrupt and resend
    f98640c27cde3 fuse: remove fm arg of args->end callback
    952f7a6d392b8 fuse: split off fuse_args and related definitions into a separate header
    a5bb215dbc34b fuse: publish io-uring queues with release semantics
    c051f66b62169 usb: xhci: bail out of setup if the controller is inaccessible
    f0ccc2d323d06 usb: xhci: simplify handling of Structural Parameters 1 values
    46fb722a3bcf0 usb: xhci: use cached HCSPARAMS1 value
    4e141571d0257 usb: xhci: implement USB Port Register Set struct
    8dbc9c86c3186 usb: xhci: add USB Port Register Set struct
    8b7ca0029e94b usb: xhci: add helper to read PORTSC register
    a363197790a87 usb: xhci: add tracing for PORTSC register writes
    78e8ee25a5e8f afs: Fix leak of ungot volume
    c8279ae8df68c ksmbd: fix use-after-free in oplock break notification
    e5e7a61fa9e82 drm/nouveau/gsp: fix vblank interrupts on GB20x
    dc7c40ffaa1b6 drm/nouveau/disp: fix head state readback on GB20x
    0e346b65a4130 drm/nouveau/disp: fix HDMI GCP AVMute register offsets on GB20x
    ecb110991bc94 drm/nouveau/disp: fix HDMI vendor infoframes on GB20x
    4739d519def72 drm/nouveau/disp: route GSP-RM display MMIO through nvkm_disp_func hooks
    94d8195eb4185 drm/nouveau/disp: move the GSP HDMI GCP AVMute write to engine/disp
    a046e789ab66e drm/nouveau/disp: move GSP head-timing ISR and vblank helpers to tu102.c
    1101cbfe7f342 drm/nouveau/uvmm: clear the dirty flag when unwinding an OP_UNMAP_SPARSE
    24c25b182d17d drm/nouveau/uvmm: fix premature region free on failed OP_UNMAP_SPARSE
    b7dc03e09313d drm/nouveau/uvmm: fix NULL deref unwinding an OP_MAP_SPARSE op
    4cf436de06ca9 drm/nouveau: Use write-combined maps for coherent
    f3830fdd6930e drm/nouveau: unsubscribe the channel-kill event before the fence context
    5ba4bcb3b96cd drm/nouveau/gsp: use per-version DP_CONFIG_STREAM params on r570 firmware
    859d8b6c5b274 drm/sysfb: ofdrm: Fix is_avivo() constant comparison bug
    ded6ad826fe0f drm/sysfb: ofdrm: Fix integer overflow in fb_size calculation
    6892f0a2f6b59 drm/sysfb: simpledrm: Improve stride validation
    54e32ad5e0c74 drm/sysfb: simpledrm: Improve panel-size validation
    8d65b8d1722d8 drm/sysfb: simpledrm: Improve framebuffer-size validation
    fd3462acf6590 drm/amdkfd: Reject zero-sized AQL queue allocations after size halving
    ebffa44e7a21e drm/amdkfd: guard against NULL restore_mqd in CRIU queue restore
    ae806a95b28fc drm/amdkfd: Fix the case that vm range is hole at svm_migrate_copy_to_vram
    da87bcad1f781 drm/amdkfd: Fix error path at svm_migrate_copy_to_ram
    e230c546ed937 drm/amdkfd: Add TLB flush after MES queue eviction/suspension
    2e4b909fab96c drm/amdgpu: use AMDGPU_GPU_PAGE_SHIFT instead of PAGE_SHIFT
    65e643703f150 drm/amdgpu: update the fw version for gfx12 userqueues
    b7cb1b6696137 drm/amdgpu: update the fw version for gfx11 userqueues
    8de8b4e11ce48 drm/amdgpu: Skip accessing psp rum time db for APUs
    492dbf832964c drm/amdgpu: fix autosuspend cleanup during removal
    812c406f75291 drm/amdgpu: Disable runtime PM for externally attached dGPUs
    964de255497ff drm/amdgpu: clamp the isolation index for rings outside a partition
    b3a7e0b69903e drm/amdgpu: check thunderbolt before switcheroo registration
    66b1b30988633 drm: Fix drm_crtc_commit leak if signaled when PAGE_FLIP_EVENT is used
    acd2dd6ecd89e drm/msm/dsi: round 6G byte clock rate to the PLL-achievable value
    72a95df6bbc7d drm/gud: validate TV mode names before creating enum property
    b86438a5c6b02 drm/gud: NUL-terminate TV mode names read from the device
    7e28853c78c20 drm/amdgpu/vcn: fix integer overflow in dec_msg buffer count check
    0b2615b8b54f5 drm/amd/display: validate plane degamma LUT size for private color prop
    295d2bf42061d drm/amd/display: fix dc_lock leak on GPU reset error paths
    ee28fafb50f58 drm/amd/display: avoid divide-by-zero in __is_lut_linear()
    4ac7677221754 drm/hibmc: Use drm_atomic_helper_check_plane_state()
    ed38f0be5b61d drm/hibmc: Fix list of formats on the primary plane
    f5acd8f48cacc drm/nouveau/disp/r535: Add scanline position support + head state support
    6f9bdbe713fdf drm/ssd130x: fix column and row end address in partial updates in ssd133x
    6f776d0e43e04 drm/sun4i: fix refcount leak in sun4i_backend_init_sat()
    63c70e292e6b4 drm/ssd130x: fix column and row end address in partial updates for ssd132x
    18b3433f10ee9 drm/i915: Guard against NULL driver_data in i915_pci_probe()
    79d09cfe90304 drm: fix race between partial drm_dev_register() failure and ioctl
    0259846b15a66 drm/panel-edp: fix i2c adapter leak on probe failure
    b51d8fb5e58c2 drm/bridge: dw-hdmi: fix i2c adapter leak on probe failure
    80c9528661c77 drm/panthor: fix firmware control interface bounds checks
    5516f1acfd075 drm/panthor: harden firmware build-info bounds checks
    ef41e8e4ae5b7 drm/xe/vram: report FLAT_CCS base misalignment
    e184e46ca1ba6 drm/amdgpu: Fix init ordering in amdgpu_vram_mgr_init()
    91ec55ddc097c f2fs: fix to zero post-EOF data when extending file size
    a984446aa9d5b f2fs: fix to pass folio->index to f2fs_sanity_check_node_footer()
    dde99df5a9d3b f2fs: fix valid block count leak on data block allocation failure
    ab35ae07f2b5b f2fs: fix to clear dirty flag on folio in error path
    c16cc4622e4b6 f2fs: fix to off-by-one issue in f2fs_zero_post_eof_page()
    f6c49fae98f0f f2fs: fix i_size when pinned fallocate partially fails
    161513f53e4ac f2fs: fix to avoid potential deadloop in f2fs_fsync_node_pages()
    b8ae1228c1536 f2fs: fix to migrate all curseg types during free_segment_range
    aefcec3bebdee f2fs: avoid NULL checkpoint thread access in sysfs
    aefb4b0f465b6 f2fs: fix dentry folio leak in find_in_level
    94917ffab3a94 f2fs: fix to avoid potential section-unaligned pinfile
    3e61c3944b83c f2fs: return writeback error from collapse range
    3b681229e9f8f f2fs: use the mount idmap for the owner check in f2fs_xattr_advise_set()
    db504781ea9b0 f2fs: dirty directory inodes on mtime/ctime update
    dc652b2fe916c f2fs: fix to avoid move_range and defragment on device_alias file
    445e4a1e6025e f2fs: only redirty pinned folios in redirty_blocks
    7f89e2775d5bb f2fs: reject overlapping move range after len expansion
    95d5975c9d1c5 f2fs: return symlink writeback errors
    ac4b019ac0784 scsi: qla2xxx: Skip NVMe LS reject IOCB when FW not started
    4fe5790674097 scsi: qla2xxx: Zero-init bsg stack buffers to avoid info leak
    0bdd0f7a1094a scsi: qla2xxx: Use coherent DMA buffer for D_Port diagnostics
    776e4e8cbcf15 scsi: qla2xxx: Hold vport_slock for host map update in report ID acquisition
    16c731c4f2961 scsi: qla2xxx: Drop vport reference under lock in report ID acquisition
    17fb63c1d0fcd scsi: qla2xxx: Fix NVMe abort reference leak on repeated abort
    5dd9bec8004ba scsi: qla2xxx: Avoid req_q_map double-read in qla2x00_error_entry()
    d7f7746ff031a scsi: qla2xxx: Bound rsp_info_len to avoid OOB sense-data read
    9fa1d71233a82 scsi: qla2xxx: Avoid double completion in async IOCB timeout
    10e9f05f7fd0a scsi: qla2xxx: Quiesce response IRQ before freeing request queue
    31715d1e1cbf3 scsi: qla2xxx: Fix response queue over-consumption in __qla_consume_iocb()
    e93aa3c5125d9 scsi: qla2xxx: Reject non-SCSI SRB on status IOCB fast path
    a194684853dce scsi: qla2xxx: Don't query firmware state while chip is down
    7203d4aed8f44 scsi: qla2xxx: Fix FCE trace enable parsing in debugfs
    e6cfb1ee18336 scsi: qla2xxx: Zero mailbox struct in qla2x00_get_firmware_state()
    8e7a26931b611 scsi: qla2xxx: Fix FCE trace use-after-free during firmware dump
    8286a9095fb59 scsi: qla2xxx: Fix cs84xx use-after-free on host teardown
    8d11613711937 scsi: qla2xxx: Serialize flash version read in reset handler
    7a448f5ed0b28 scsi: qla2xxx: Clamp MSI-X derived queue counts to avoid truncation
    11834e5773e20 scsi: qla2xxx: Hold qpair lock when sending NVMe LS reject
    7b22b4cb88228 scsi: qla2xxx: Bound image count in qla2x00_update_fru_versions()
    5ecdb336df2a9 scsi: qla2xxx: Check entry_status in qla24xx_modify_vp_config()
    67f0d5187c293 scsi: qla2xxx: Initialize NVMe abort_work once at submission
    47272152a13d2 scsi: qla2xxx: Hold vport reference in qla24xx_report_id_acquisition()
    206df5ffa72dc scsi: qla2xxx: Fix Name Server logout detection on FWI2 adapters
    94bfb61478bcb scsi: qla2xxx: edif: Fix NULL pointer deref in RX SA delete check
    97ca58b0fb026 scsi: qla2xxx: Bound i2c->length in I2C bsg handlers
    b157256c28086 scsi: qla2xxx: Zero SFP DMA buffer in FRU/I2C bsg handlers
    dec5624a3f8cb media: chips-media: wave5: Set inst->std during default format initialization
    a0506198a77b9 media: chips-media: wave5: Guard bit depth check with initial_info_obtained
    ff98cd2b8b54c media: qcom: iris: use disable_irq() during power-off
    ab6f088a44ef7 media: qcom: iris: fix state-change debug log printing stale value
    f1c4f3885df1f media: zoran: Avoid freeing a registered video_device twice
    dc005cb7ccb0c media: vimc: fix pixel format lookup in enum_framesizes
    52fd9d80c0cea media: video-i2c: fix kthread error pointer left in kthread_vid_cap on failure
    4a187d9443845 media: venus: fix payload size calculation in parse_raw_formats()
    d031b5ecc4b39 media: venus: fix payload size returned by parse_caps() and parse_alloc_mode()
    3ced388b79082 media: v4l2-fwnode: Fix fwnode leak in v4l2_fwnode_parse_link
    331f22dd63bf9 media: v4l2-ctrls: Allow unknown HDR10 white point and luminance
    3345746e0957b media: v4l2-async: avoid deleting unlinked ASC entry on link error
    7c62bd6535639 media: tda18250: fix possible integer overflow
    4d2048466af9e media: saa7164: fix cleanup on resource allocation failure
    342632a4d8ba3 media: s2255: check firmware size before reading trailing marker
    68d664f1b4efe media: s2255: bound JPEG frame size before copying into the buffer
    93e6ed88f5084 media: rzg2l-cru: Align bytesperline to hardware DMA stride requirement
    26a2a985bbeee media: rtl2832_sdr: release URBs and stream buffers on start_streaming() failure
    7443b16b6dd88 media: rtl2832_sdr: use vb2_video_unregister_device() on remove to fix DMA leak
    12b88016c199e media: rkvdec: Propagate platform_get_irq() errors
    5b58d8c206f37 media: rc: sunxi-cir: Unregister rc device on probe failure
    8281acf5d7049 media: nxp: imx8-isi: Use BIT_ULL() for 64-bit stream masks
    9392375dd4c01 media: nxp: imx8-isi: Correct color map between V4L2 and ISI
    2f9b2768d5ceb media: nxp: imx8-isi: Fix stream ID validation bypass in crossbar routing
    5026f927ef415 media: platform: mtk-mdp3: fix NULL deref on failed SCP lookup
    252850653569f media: platform: mtk-mdp3: Fix SCP device refcounting
    96dafbae77f50 media: meson: vdec: fix NULL pointer deref in vdec_try_fmt_common
    24aca88390388 media: iris: Enumerate cap->bus_info to differentiate between encoder and decoder
    27b7997be552e media: intel/ipu6: fix async notifier cleanup leak on parse error
    1d59c5254c33a media: imx355: Avoid calling imx355_power_off twice in error path
    af81f35e4f429 media: i2c: ov7740: fix use-after-destroy in remove
    90f9b421fc6d4 media: i2c: ov02a10: fix endpoint parsing use-after-free
    4f8fd40b39bf7 media: i2c: imx415: Return test pattern write errors
    1aa66bb3ba440 media: i2c: imx415: Release runtime PM reference on VBLANK error
    312c68e9ed8a4 media: i2c: alvium: Fix: Correct name of register in alvium_set_ctrl_auto_exposure
    0745a59945d92 media: go7007: defer the ALSA v4l2 put until card release
    0782807552b6a media: em28xx: fix use-after-free of dev_next->devlist on disconnect
    f9322ac9f8629 media: em28xx: defer audio-only extension registration
    bf3f49273d5bf media: cx23885: cancel NetUP CI work before teardown
    7087bef6510c7 media: cx231xx: reject geometry changes while the VBI queue is busy
    cb1218da234ea media: cobalt: Avoid freeing ALSA private data twice
    f78cf36cabf91 media: cedrus: fix memory leak in cedrus_init_ctrls()
    5c62095acc2a9 media: cec: Serialize exclusive follower delivery
    38c14532adb34 media: cec: meson: ao-cec-g12a: name the CEC core regmap to avoid debugfs clash
    673611cc2ab97 media: cec: extron-da-hd-4k-plus: add sanity check
    a3adb63b12193 media: cec: disable delayed work before freeing an interrupted transmit
    695063fc57574 media: cec: core: Fix kmemleak due to missed rc_free_device() call
    cb7a4cf63fa20 media: amphion: Remove obsolete frame_count check in venc_start_session
    297fee023f46d media: airspy: use vb2_video_unregister_device() on disconnect to fix NULL deref
    347e9d2246b89 rust: drm: ioctl: fix unbounded lifetimes in ioctl handler arguments
    76395109a051b LoongArch: Avoid preempt count underflow without probe
    266ffc92e6859 LoongArch: Do not save/restore percpu base register in rethook trampoline
    d692b825dc246 LoongArch: Do not select HAVE_RUST when KASAN is enabled
    d3fd094c13c6d LoongArch: Fix acpi_package_ids[] array overflow
    882b8912b7e92 LoongArch: BPF: Refactor jump offset calculation in tail call
    462e6abc8293f LoongArch: BPF: Optimize redundant TCC loads in epilogue
    ab275a23b4d9f LoongArch: Add DIRECT_MAP_PHYSMEM_END definition
    4e4dbc341b158 LoongArch: KVM: Preserve memslot arch flags on KVM_MR_FLAGS_ONLY
    6b78786ee7260 LoongArch: KVM: Free init resources if kvm_init() fails
    07c3037e45c94 LoongArch: KVM: Fix TOCTOU race on pv_features
    b7fab314ade26 LoongArch: KVM: Fix PC double advance in kernel MMIO read fast path
    566b1f08d9836 KVM: arm64: Correctly cap TLBI Range to the architural limit
    3d4c26b16a04a KVM: arm64: vgic-its: Don't dereference a NULL collection on ITT save
    2f1a571af300e KVM: arm64: vgic: Reset in_kernel on private IRQ allocation failure
    de9b4e8f37ce6 KVM: arm64: vgic: Fix detection of MI on no pending LR
    7631f95297560 KVM: arm64: vgic-v3: take an LPI reference in vgic_v3_save_pending_tables
    72bce82c4171b KVM: arm64: Sign-extend VA for range-based TLBI invalidation
    d8580e7aa189b KVM: arm64: Make VNCR invalidation participate in MMU invalidation retry
    ce447651a52ec KVM: arm64: Correctly handle end of VA space TLBI invalidation
    be54a70067c7d KVM: arm64: Handle negative S1 walk levels in VNCR TLB size evaluation
    6408605cbd509 KVM: arm64: Consider SCTLR_EL2.M when mapping the L1 VNCR page
    150c43473dcf0 KVM: s390: Restore sigset on error path
    5ed801685a8a3 KVM: s390: pv: Fix rc/rrc offset for PVM_DUMP
    6ee52d3af2a1b KVM: s390: Fix memory corruption by not reinjecting CK machine checks
    3904a3296e40d KVM: s390: Zero initialize irq in reinject_machine_check
    cc710ee45395e KVM: s390: Take srcu when importing watchpoint data
    b5acacfdb8966 KVM: s390: Free guest debug data on vcpu destroy
    f55e4d415d953 KVM: s390: Fix old_data leak in guest debug error path
    44bf3792c10f4 KVM: s390: Fix memory leak in guest debug handling
    beb9c55af609c KVM: s390: Fix length check __import_wp_info()
    39f7abd5927bf KVM: x86: Ensure runtime reads of disabled_quirks are resolved once
    929fd2d87851a KVM: x86: Serialize writes to disabled_quirks using kvm->lock
    3097582b73a8e KVM: x86: hyper-v: Clamp stimer deadline to avoid livelock
    41debfc98526c KVM: x86/mmu: Consume the locked rmap value in the lockless rmap walk
    7b2721d66525f KVM: x86/mmu: Use split "zap all fast" helpers when invalidating memslot
    0a25ee42e7d1a KVM: x86/mmu: Use CMPXCHG when clearing Accessed bit in TDP MMU
    e29e9a9d81140 KVM: x86/mmu: Split kvm_mmu_zap_all_fast() into "front" and "back" halves
    93b7f6eb76a13 KVM: x86/mmu: Fold kvm_mmu_zap_memslot() into kvm_arch_flush_shadow_memslot()
    27bdeb5fd1904 KVM: nVM: Ensure INVVPID is emulated on the correct physical CPU
    c43563e7518e6 KVM: nVMX: Service local TLB flushes on failed nested VM-Enter
    674a3244f07f3 KVM: nVMX: Ensure KVM_REQ_GET_NESTED_STATE_PAGES is cleared on VM-Exit
    d689dd4eae48d KVM: nVMX: Decouple INVVPID operand checks from flushing of vpid02
    22dfcc22c95e9 KVM: nVMX: Always flush vpid02 on first use
    5778dda871f15 KVM: PPC: Book3S HV: Validate arch_compat against host compatibility mode
    c9f2c50bad37d iio: light: opt4001: Fix reversed GENMASK() arguments in fault count mask
    b6cedf011bd95 iio: light: opt4001: Reject integration times with a non-zero seconds part
    958d691403936 iio: light: opt4001: Fix incompatible pointer type passed to div_u64_rem()
    4a9820aa8ef7e iio: light: opt4001: Fix power down clearing bits of the wrong register
    6d00b4fec5bf2 iio: light: opt4060: Fix incorrect register name in threshold read error message
    38f58a0249666 iio: light: opt4060: Reject integration times with a non-zero seconds part
    fcddb4da54ab9 iio: ti-ads7138: Disable STATS_EN bit while reading conversion results
    c0d491c243e70 iio: temperature: hid-sensor-temperature: switch to non-devm iio_device_register()
    c2d6437663d7c iio: srf04: fix pm_runtime handling on probe error path
    eef652190b00f iio: pressure: mpl115: Fix runtime PM cleanup
    7ded5b76ec2df iio: pressure: dps310: fix NULL pointer dereference on ACPI probe
    0614928a3eda3 iio: light: ltrf216a: fix runtime PM reference leak in error path
    1ce47f00e9c00 iio: light: gp2ap002: Disable regulators on resume failure
    9c1b74fdcffa4 iio: light: cm32181: return zero after writing calibscale
    d2b32b71fa5bd iio: gyro: mpu3050: fix sign of raw angular velocity readings
    08ac8d2976d57 iio: dac: m62332: Fix regulator reference count imbalance
    bcc324f3033cd iio: dac: ad3552r-hs: fix scnprintf() buffer bound in data source show
    2d386efb4c37a iio: chemical: sgp30: Handle IAQ thread creation failure
    2071624c3d0f4 iio: chemical: atlas-sensor: use iio_trigger_poll_nested() to fix remove UAF
    43bce901047e9 iio: chemical: atlas-sensor: fix PM reference leak in buffer postenable
    510497e31be4f iio: buffer: Tie IIO dma fence lock lifetime to the fence
    06a9460b8b792 iio: buffer: Make IIO DMA fence release RCU-safe
    f1f8f0e8e0af9 iio: buffer: Fix potential use-after-free in anonymous buffer release
    8de90e0e0f6d9 iio: adc: pac1921: fix wrong channel used in trigger handler read
    beec14368c943 iio: adc: max34408: add missing 'select REGMAP_I2C' to Kconfig
    d2ed166c901e9 iio: adc: adi-axi-adc: add data size support for AD408X backend
    e9627244ac0d7 ASoC: samsung: aries_audio_probe: double of_node_put due to direct assignment without of_node_get
    4e580d84a638f ASoC: loongson: Fix error handling in ACPI property parsing
    e11b056d69b8c AsoC: intel: sst: fix PCI device reference leak on probe failure
    e8ea01a045708 ASoC: hdac_hda: Fix hlink refcount leak on component registration failure
    0966b76a0e23c ASoC: fsl_easrc: Use div64_u64 for 64-by-64 division
    5ca4bd7543524 ASoC: fsl: mpc5200-i2s: Free DMA resources on probe failure
    5a4fe7a87841a ASoC: cs35l34: drain threaded IRQ before runtime suspend
    6e369bc46663b ASoC: cs35l33: drain threaded IRQ before runtime suspend
    eb5d39dd862f5 i2c: mux: demux-pinctrl: fix OF node leak on kstrdup failure
    b2b87f2e0bb16 clk: qcom: gcc-mdm9607: Drop incorrect BIMC PLL and related clocks
    4763197c6f344 clk: qcom: gcc-mdm9607: Fix halt_reg for gcc_apss_axi_clk
    bd326b0c5b339 clk: qcom: gcc-mdm9607: Fix enable_reg for gcc_blsp1_sleep_clk
    c67fc2fd71395 clk: qcom: gcc-mdm9607: Drop incorrect system_noc_bfdcd_clk_src
    206a6e21a0cf4 clk: qcom: gcc-mdm9607: Drop incorrect apss_tcu_clk_src
    526b0a71a4d91 clk: rockchip: rk3588: Don't change PLL rates when setting dclk_vop2_src
    cc2941bc37351 clk: qcom: gcc-msm8939: Fix enable_reg for gcc_blsp1_sleep_clk
    51b40cb17c216 clk: qcom: gcc-msm8916: Fix enable_reg for gcc_blsp1_sleep_clk
    4582949b7badc clk: meson: align gxbb_32k_clk_sel number of parents with actual count
    88fe6792be2b3 clk: mediatek: mt8196: Select REGMAP_MMIO for vlpckgen
    05952e503cf65 clk: clocking-wizard: fix integer overflow in rate calculation
    82f78c2b3af8f batman-adv: bla: prevent CRC corruptions after claim flush
    871acdf97f64c batman-adv: bla: fix freeing of claims on meshif deletion
    1cfa7d5f70d54 batman-adv: dat: avoid unaligned fault in IP extraction
    c32e5e25c4120 batman-adv: mcast: linearize skbuff for packet generation
    cedacfecf4b40 batman-adv: mcast: ensure unshared skb for multicast packets
    e91d2cc7441d8 batman-adv: fix stale receive device on merged fragments
    c8f86e375b39c mtd: rawnand: validate ONFI extended parameter page sections
    4b282dc6a9e96 mtd: nand: realtek-ecc: add missing MODULE_DEVICE_TABLE()
    d06f91a52af11 mtd: mtdoops: free page bitmap when the backing MTD is removed
    18916f475057c mtd: afs: validate v2 image info bounds
    e8bcb9d54429b s390/vfio-ap: Fix required lock not held during update of ap_matrix_mdev object
    6d554f2571e6b s390/vfio-ap: fix potential use of uninitialized apm_filtered bitmap
    69632952aca04 s390/vfio-ap: Fix NULL deref in status_show() during queue probe
    647916988272f s390/vfio-ap: Fix missing lock required to access list of ap_matrix_mdev objects
    c45753c32d452 s390/vfio-ap: Fix hot-unplug skipped when last AP adapter or domain removed
    178ea7a1c2c3c s390/vfio-ap: Fix dereference matrix_mdev->kvm without checking for NULL
    f7d66afc34bc6 s390/vfio-ap: Fix control domain removal in vfio_ap_mdev_cfg_remove
    3c5f51f257e14 s390/vfio-ap: Fix stale do_remove flag across iterations in vfio_ap_mdev_cfg_remove
    fc069d00a0dbe s390/vfio-ap: fix stale pqap_hook pointer on error in vfio_ap_mdev_set_kvm()
    3b90d769b351a powerpc/crash: stop watchdogs before booting kdump kernel
    36dcb8c2e3391 powerpc/pseries: Move H_WATCHDOG definitions to a common header
    d2be3dd20e833 powerpc/pseries: Handle and log pseries-wdt registration failures
    9c914b7a0bd18 powerpc/mm: fix wrong addr_pfn tracking in compound vmemmap population
    da88a2a2119e4 powerpc/kexec_file: Prevent kexec range truncation
    df45337587db2 powerpc/kexec_file: Fix null-ptr-def in extra size calculation
    6ae9306c75981 parisc: Fix alignment of asm statements in head.S
    3e2691eeee83a parisc: eisa: Fix infinite loop when parsing invalid IRQ value
    6b1faf1f099f7 nvdimm/btt: reject an arena whose nfree is below the lane count
    bdd929e60bc54 mm/hugetlb_cgroup: call page_counter_set_max() outside VM_BUG_ON()
    631d8f39b33e7 mm/hugetlb: keep max_huge_pages when dissolving surplus folios
    ae6a8b0c69901 mm/hugetlb: fix missing migratable flag on same-node hugetlb migration
    8e287f463fc4f Revert "irqchip/mbigen: Fix mbigen node address layout"
    6e96e2bb1065b pmdomain: airoha: fix unselectable AIROHA_CPU_PM_DOMAIN kconfig
    cf1484d9a75de nvmet-tcp: reject unsolicited H2CData PDUs
    dbc4acbdb3ca8 nvmet-tcp: fix out-of-bounds write when receiving an over-long PDU
    7555ddd60af72 nvmet-auth: Synchronize timeout work during SQ teardown
    d663944dbad81 nvme: add missing SRCU grace period in error path
    b4af7999a9987 nvme-tcp: check the data direction of a C2HData PDU
    7df913a7ced5d nvme-fc: fix double free of fabrics options when nvme_add_ctrl() fails
    15d7a35a48928 nvme-fabrics: fix DHCHAP secret leak on parse failure
    7ad2ea7c10044 ALSA: pcm: Fix race between non-atomic ops and trigger-start
    89992bda7dfbb ALSA: harmony: initialize locks before requesting IRQ
    1e67ad10373ea ALSA: rawmidi: Return the error from snd_rawmidi_input_params()
    cd090af03f5df arm64: errata: pass REVIDR when matching target implementation CPUs
    68cbd70795dd8 arm64: mm: Fix the lockless page-table walk in show_pte()
    2b3b06cb709c4 i2c: mux: Fix channel node leak on adapter add failure
    112b3d48084c8 i2c: core: fix debugfs UAF on adapter removal
    954f30c8df0a0 i2c: qcom-geni: update frequency table to fix timing parameters
    c643b6e7852e9 i2c: designware: Enable interrupt mask workaround for HJMC3001
    19d65da9f7497 perf hisi-ptt: Fix PTT trace TLP header parsing
    2421389840738 perf trace: Refactor augmented_raw_syscalls using bpf_for
    f3a6663138496 perf trace: Factor out BPF loop body
    3c492c8eba026 perf/x86/intel: Fix kernel address leakages in LBR stack
    267f0a4fb9fe7 rtc: rzn1: Disable alarm interrupt before reprogramming alarm registers
    3a2b79eae5bef rtc: rzn1: Handle unset alarm weekday in rzn1_rtc_read_alarm
    a4d6666a65d6f rtc: rzn1: Fix weekday underflow when alarm crosses month boundary
    350cb7821b3d2 rtc: rzn1: Handle EPROBE_DEFER for optional pps interrupt
    0a90e268cce70 memcg: make the v1 soft limit knob inert
    801bcbdbfd595 memcg: bypass the reclaim and oom killer for dying tasks once oom_reaper is done
    7269bd95d707e Input: aiptek - validate raw macro indices before updating state
    d07e281f2a771 fs/ntfs3: fix slab-out-of-bounds write in ni_create_attr_list()
    4d6ccd3883df6 fs/ntfs3: fix KMSAN uninit-value in ni_create_attr_list
    0ceda28f371df mm/mempolicy: fix sleeping allocation in alloc_pages_bulk_weighted_interleave()
    5da247e4d1e86 kprobes: Protect kprobe_blacklist with RCU
    863f6726a5c02 irqchip/stm32mp-exti: Fix the unit of the hwspinlock timeout
    f8a2f2a460231 ima: Check for ERR_PTR from dentry_path() in validate_hash_algo()
    685c195fbd7d4 ata: ahci: work around lost interrupts on Marvell 88SE61xx
    ca5bfea2045ef ceph: lock mutex in ceph_mds_check_access()
    a24a146ae2cb5 bpf: Fix infinite loop in pcpu_freelist push with one possible CPU
    bfb469f20aa9e block: flag zoned disks with GENHD_FL_NO_PART
    634e2d23736d4 cpuidle: psci: Fix support for probe deferral by dropping the faux device
    b519dfce1998c cpuidle: dt_idle_genpd: kfree() the original name allocation
    fac202d73e7a6 dmaengine: dw-edma: Initialize IRQ data before requesting IRQs
    8fd47ccbba86c dmaengine: dw-edma: Complete descriptors before pausing
    3b313f7a00d14 dmaengine: dw-edma: Fix HDMA channel status register access
    d382aaf5fed38 dmaengine: fsl-edma: tracing: no ptr dereference during log output
    408ff2d5bf555 dma-direct: return struct page from dma_direct_alloc_from_pool()
    36177beff2a9d dm: fix resume-vs-remove race
    af1f32ccf8051 dm: fix race when loading and unloading a table
    74ec08f7b81c2 HID: wacom: validate report length in wacom_intuos_pro2_bt_irq
    f4cb9c4556dcb HID: rmi: fix OOB access with undersized RMI reports
    c7f927aa8b550 HID: bpf: serialize device reference release in struct_ops destroy path
    078adc03f6e60 ftrace: Synchronize the initialization of ftrace_ops
    7d1559126d86b futex: Prevent rcuwait use-after-free during requeue PI
    1cd41131bc4b8 mm/damon/core-kunit: check region count before testing in split_at()
    382e58c24eabf mm/damon/sysfs: kobject_del() target (normal), context and kdamond dirs
    368f84ec79104 mm/damon/sysfs: kobject_del() region and target (error) dirs
    23c7b91895ff0 mm/damon/sysfs-schemes: kobject_del() scheme region dirs
    20a40e7eb5ec3 mm/damon/sysfs-schemes: kobject_del() scheme quota goal dirs
    e608e7bbe82cb mm/damon/sysfs-schemes: kobject_del() scheme filter dirs
    8a1ebb241fc70 mm/damon/sysfs-schemes: kobject_del() scheme dirs
    b9847d539b9c8 mm/damon/sysfs-schemes: kobject_del() scheme action destination dirs
    cb55606449fd6 samples/damon/wsse: stop and free damon ctx when damon_call() fails
    6179c7f47876d samples/damon/wsse: handle damon_start() failure
    2446d3820cbaf samples/damon/prcl: stop and free damon ctx when damon_call() fails
    9f370353bba7f samples/damon/prcl: handle damon_start() failure
    3c07c57b89411 samples/damon/mtier: handle damon_stop() failure
    f0808262a7616 samples/damon/mtier: handle damon_start() failure
    71de5a082d2ca mm/damon/vaddr-kunit: check region count in three_regions test
    dd817463c9b42 scsi: pm8001: Use rollback index when freeing MSI-X vectors
    4bb34769ef44a scsi: megaraid_sas: Limit NVMe request size to the PRP chain frame
    1624bff4c5118 scsi: target: iscsi: Reserve a terminator byte for the login payload
    a38051fa2dded spi: Fix DMA mapping ownership on partial map failure
    148a3f03aec89 spi: bcmbca-hsspi: disable clocks on resume failure
    0acbfd61aee18 spi: bcm63xx: disable clock on resume failure
    b782a7cb0a424 spi: bcm63xx-hsspi: disable clocks on resume failure
    907752a7b64a6 soc: qcom: geni-se: Use HW PROG_RAM_DEPTH to validate firmware size
    e373c1acdbcf8 ublk: clear VM_MAYWRITE on read-only ublk char device mmap
    89f06342743ca userfaultfd: reset err to be 0 when move_pages_ptes succeeded
    65c2029f3bbae thermal/drivers/qoriq: Disable clock on resume failure
    ec2db87a0bbb8 thermal/drivers/imx: Disable clock on runtime resume failure
    efaab8938fb92 xhci: fix lost bounce buffers on TDs spanning several ring segments
    b041e3f35e0d2 staging: rtl8723bs: fix OOB read in rtw_action_frame_parse()
    ff61aa3289355 staging: rtl8723bs: fix OOB read / stack overflow in rtw_get_wps_attr()
    d3a7fa61997db usb: gadget: fix null pointer dereference in usb_put_function_instance()
    c29a83c1ff3f0 USB: gadget: fix NULL pointer dereference in gadget_dev_ioctl()
    02ac76f27db23 usb: gadget: f_midi: initialize work in f_midi_alloc()
    e89e30f0b5d30 usb: gadget: f_midi2: fix use-after-free in string attribute show path
    9c3d5091e3568 usb: gadget: midi2: Fix null-pointer dereference in f_midi2_free_ep_reqs
    33a81acd2d1d0 usb: typec: ucsi: displayport: Fix OOB altmode array index
    6be5169e7615d usb: typec: tipd: Fix Thunderbolt altmode VDOs for cd321x
    42828aeb40b4a usb: typec: tcpm: constrain TCPM_SOURCING_VBUS event handling
    d4e00a1eb3917 usb: typec: qcom-pmic: cancel reset_work on stop
    1e4f33f99bfb7 usb: typec: qcom-pmic-typec: drain cc_debounce_dwork if port_start() fails
    c614d7c44ca7f usb: typec: qcom-pmic-typec: disable cc_debounce_dwork on stop
    7c4e2f964c65d usb: storage: realtek_cr: fix use-after-free on disconnect
    0afe5c31612de usb: dwc3: clear forceRM when issuing EndTransfer
    62a8b67960637 usb: f_mass_storage: Bump local buffer size in fsg_common_create_luns()
    1c67f2ba9c5f7 usb-storage: ene_ub6250: fix race between scan work and probe
    7690a86b19327 media: usbtv: keep device alive while ALSA card exists
    296a884cd6feb clk: qcom: gcc-mdm9607: Increase delay for USB PHY reset
    9392a2c346762 ALSA: usb-audio: fix OOB write in snd_usbmidi_us122l_output()
    838455cc8bfe1 usb: image: mdc800: change kmalloc() to kzalloc()
    4814f28c45f58 drm/amd/display: fix division by zero in get_estimated_bw()
    12ee39c2b1d3c bpf: fix the return value of push_stack
    c96477e0cabf5 drm/xe: Don't hand out the flat CCS storage as usable VRAM
    a6b088bee95fd fsnotify: inotify: pass mark connector to fsnotify_recalc_mask()
    0ec897493ff82 drm/amd: Drop calls to restore power limit and clock from smu_resume()
    0b6680e306397 mfd: qnap-mcu: keep the reply buffer alive past a command timeout
    617b48fc0baf0 objtool/rust: add one more `noreturn` Rust function
    947400af98b9e fsnotify: Fix stale object mask after concurrent mark updates
    459f33f828647 entry: Fix seccomp bypass after ptrace with TSYNC
    b5a5d389eee65 mm/page_vma_mapped: use huge_ptep_get() for hugetlb
    e15407c3a8a00 openvswitch: Fix CT limit teardown use-after-free
    a13b1e80e5015 net: skbuff: don't skb_tx_error() the source skb in skb_zerocopy()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3ab0b618ccd761fdaf325fec2657ec36f0a9544b)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/linux-yocto-rt_6.18.bb              |  6 ++---
 .../linux/linux-yocto-tiny_6.18.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index d4ca18a7b20..31a0294070e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -15,13 +15,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ed7481e8a1df4a3417915acd6bef5a72d6fa71bb"
-SRCREV_meta ?= "bf8faf1b184fcf6c555ee951f501e76f88eccf35"
+SRCREV_machine ?= "c191bb993af1f71ef139504fcce530a9ba167a0d"
+SRCREV_meta ?= "9e9d8b1f9128b07d938b8b7d5921aeb3ddf907a1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.18.50"
+LINUX_VERSION ?= "6.18.52"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index 56a3d18ee5b..1b7575be0cd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.18.inc
 
-LINUX_VERSION ?= "6.18.50"
+LINUX_VERSION ?= "6.18.52"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "aba8c69040fd3d5763477a733b4696a79c0514e1"
-SRCREV_meta ?= "bf8faf1b184fcf6c555ee951f501e76f88eccf35"
+SRCREV_machine ?= "08edce0ecd6a36020447f51f11329b6641d3c0e2"
+SRCREV_meta ?= "9e9d8b1f9128b07d938b8b7d5921aeb3ddf907a1"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 719c1fa51a8..055a2d39ddb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "dbe5ee845060d0b8ddf934a2e3d96627fdb1bd81"
-SRCREV_machine:qemuarm64 ?= "aba8c69040fd3d5763477a733b4696a79c0514e1"
-SRCREV_machine:qemuloongarch64 ?= "aba8c69040fd3d5763477a733b4696a79c0514e1"
+SRCREV_machine:qemuarm ?= "4932d76684b2bc2cbf8dc6e0e46ada17ad020c71"
+SRCREV_machine:qemuarm64 ?= "08edce0ecd6a36020447f51f11329b6641d3c0e2"
+SRCREV_machine:qemuloongarch64 ?= "08edce0ecd6a36020447f51f11329b6641d3c0e2"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "aba8c69040fd3d5763477a733b4696a79c0514e1"
-SRCREV_machine:qemuriscv64 ?= "aba8c69040fd3d5763477a733b4696a79c0514e1"
-SRCREV_machine:qemuriscv32 ?= "aba8c69040fd3d5763477a733b4696a79c0514e1"
-SRCREV_machine:qemux86 ?= "aba8c69040fd3d5763477a733b4696a79c0514e1"
-SRCREV_machine:qemux86-64 ?= "aba8c69040fd3d5763477a733b4696a79c0514e1"
+SRCREV_machine:qemuppc ?= "08edce0ecd6a36020447f51f11329b6641d3c0e2"
+SRCREV_machine:qemuriscv64 ?= "08edce0ecd6a36020447f51f11329b6641d3c0e2"
+SRCREV_machine:qemuriscv32 ?= "08edce0ecd6a36020447f51f11329b6641d3c0e2"
+SRCREV_machine:qemux86 ?= "08edce0ecd6a36020447f51f11329b6641d3c0e2"
+SRCREV_machine:qemux86-64 ?= "08edce0ecd6a36020447f51f11329b6641d3c0e2"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "aba8c69040fd3d5763477a733b4696a79c0514e1"
-SRCREV_meta ?= "bf8faf1b184fcf6c555ee951f501e76f88eccf35"
+SRCREV_machine ?= "08edce0ecd6a36020447f51f11329b6641d3c0e2"
+SRCREV_meta ?= "9e9d8b1f9128b07d938b8b7d5921aeb3ddf907a1"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "7cfc41f8e80f11ffa8382ed1a505154ceffb79c7"
+SRCREV_machine:class-devupstream ?= "8f3741e6feb045da5b406df0a80b42a1adfb289b"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.18/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.18.50"
+LINUX_VERSION ?= "6.18.52"
 
 PV = "${LINUX_VERSION}+git"
 

