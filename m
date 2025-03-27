Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E031C3DA4A
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 19:44:38 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.5468.1743104675767768177
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 12:44:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BdBTnaPh;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-227b650504fso32595135ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 12:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1743104675; x=1743709475; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ifzT1bseOHXBuq59FwWT56GQ0zFafR4eo1eQKdlDiVs=;
        b=BdBTnaPh+kcKWBLe7/VvJCD/tFlyQXLbIBau/SsaMHzRsSE//zT6vSHIUrgKYBYaZ/
         N54ciBzQ9g3PGuKqCbzOobhx7xtuMCM4kJXa8LS/pNECSTVmkGLOQtmQ2xfJtrrPHy/D
         NDY5kVa5NuM7m2VANXUSQ+fA1xjwZ5l/gYp/vxi6sxIuBbP4WY8IAPysNX1KF4Q50rTM
         IirQcijDbN5J6TRDFs/ieuALeFiU+VEmxR1A5i3kWXqxJryw5dlwpqilrEe3aWY+kq2j
         d+7fx0EAR7YxFMWs3Z6XfZxEzvvsX8LAxBnqjiSAQf+bSb2aGPBVgY87KQvuw/veAh7l
         vp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104675; x=1743709475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ifzT1bseOHXBuq59FwWT56GQ0zFafR4eo1eQKdlDiVs=;
        b=b+stXgcfBoq5Kex8n2FvSZrTbeR04Y0PRNFQ4OQJ53buHUdPeuzi0lJ3JvET8RXiQr
         vTqk2z5jlO66fgzFDmx0Kmvy9nlOo+qjVY2ojE5pDvTjJtcLijXtV50jUSO8wnOSi+9X
         i/CRQ3McYTbKnA85sug0qVSlK1S1OD0myyXxXY07x1zUY4hExm+CyVravSiue3zcPIWY
         dFnspQE+DKunNbXrYDVTFm+kOvB4ACz0ZbXccrKMoXW3kExabgk8qjXPySZnf4CEi4bp
         UX15WeCgp3ec5xcabkPu4L256HBFcxu7+V+ywSDZ/tauCioEsSzh5dJa0rwhC05NPJnd
         4d9A==
X-Gm-Message-State: AOJu0YxfDUhBjBt1UK1rihk1CPC4qWQkXxuekmxKxOEtnmsXHNLUKKuo
	IWn3HAMl53VvnOBONWMwWNvFTLLiWBDZWMkYm66vFfxU2I/JvsXa361MAVVcW4fQQHbXPdvTrMr
	m
X-Gm-Gg: ASbGncu9owV4eg38cjQBUm1B8KvTEDW5yzyZJof/FrzGp0Ehhx2gQJO1DZfzhZd5cr6
	QcznvJoOw1rQ5/AcE9RePUJz5sO0zbULNJ8JpsdOS815PseoqimNRnp3Ue6QejubcR0ttv0U1sM
	re+1VI/4yIGAALTFQsjtoMF6+dgJD2gJD+EsCztqz4KvTJCtT59jk1KV/PSUCvHc7IXwlLuYswH
	RpIXqpP36oQqKmXL70MuvtMFcIFMlEamT2pi3b9skB4Y/SURISx8QcK1l+o+eKzmQ6dqv1qZ7Fq
	P6EMwFjgdLGOf/KHoRzKLq3jM7YCq4LerR4=
X-Google-Smtp-Source: AGHT+IH0AneYiFjyYsrXsNnHZDb0D1AWdbbGmX/8BHmW3JRK80BY+smOTovaOYF/HQSwqGLSCjgxJg==
X-Received: by 2002:a17:902:d4c5:b0:223:66bc:f1de with SMTP id d9443c01a7336-22804872e5fmr70650085ad.21.1743104674333;
        Thu, 27 Mar 2025 12:44:34 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:811c:968e:2c1:6363])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee0882sm3865875ad.75.2025.03.27.12.44.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:44:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/10] linux-yocto/6.6: update to v6.6.80
Date: Thu, 27 Mar 2025 12:44:11 -0700
Message-ID: <f9eb23de00c7d3b5d542c5a321769a778ac73a2c.1743104524.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743104524.git.steve@sakoman.com>
References: <cover.1743104524.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 19:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213782

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    568e253c3e3b Linux 6.6.80
    60ba9b8a5b76 x86/cpu/kvm: SRSO: Fix possible missing IBPB on VM-Exit
    7891ac3b0a5c nilfs2: handle errors that nilfs_prepare_chunk() may return
    35dcb8a3a70e nilfs2: eliminate staggered calls to kunmap in nilfs_rename
    944a4f8f0b07 nilfs2: move page release outside of nilfs_delete_entry and nilfs_set_link
    ad75c8ef506c perf/x86/intel: Fix ARCH_PERFMON_NUM_COUNTER_LEAF
    be2778b6ddbd arm64: dts: rockchip: change eth phy mode to rgmii-id for orangepi r1 plus lts
    8fab939c5d62 md: Fix md_seq_ops() regressions
    4b79bee3e3c0 md: fix missing flush of sync_work
    d6fe973c8873 net/mlx5e: Don't call cleanup on profile rollback failure
    59bdc12fe980 ftrace: Do not add duplicate entries in subops manager ops
    ac35a1db0327 ftrace: Correct preemption accounting for function tracing.
    ae2661f0793b EDAC/qcom: Correct interrupt enable register configuration
    9e5d99a4cf2e smb: client: Add check for next_buffer in receive_encrypted_standard()
    8380ebc6f91b mtd: rawnand: cadence: fix incorrect device in dma_unmap_single
    ad9393467fbd mtd: rawnand: cadence: use dma_map_resource for sdma address
    fcae111830a4 mtd: rawnand: cadence: fix error code in cadence_nand_init()
    91f0e576f937 mm,madvise,hugetlb: check for 0-length range after end address adjustment
    28d23f1351b2 acct: block access to kernel internal filesystems
    5c928e14a2cc acct: perform last write from workqueue
    f69d2cd84600 ASoC: SOF: pcm: Clear the susbstream pointer to NULL on close
    868f6223d2b1 ALSA: hda/conexant: Add quirk for HP ProBook 450 G4 mute LED
    edcb866a93bb ALSA: hda: Add error check for snd_ctl_rename_id() in snd_hda_create_dig_out_ctls()
    afa500d47165 ASoC: fsl_micfil: Enable default case in micfil_set_quality()
    2b3878baf909 ASoC: SOF: stream-ipc: Check for cstream nullity in sof_ipc_msg_data()
    29ccb1e4040d nfp: bpf: Add check for nfp_app_ctrl_msg_alloc()
    95b93d542c75 lib/iov_iter: fix import_iovec_ubuf iovec management
    4f31247ecb37 soc: loongson: loongson2_guts: Add check for devm_kstrdup()
    0efa6c42f81c drop_monitor: fix incorrect initialization order
    d61cc1a435e6 tee: optee: Fix supplicant wait loop
    b9826e3b26ec io_uring: prevent opcode speculation
    f16a74c5f247 drm/i915/dp: Fix error handling during 128b/132b link training
    7cdb066a28f7 drm/i915: Make sure all planes in use by the joiner have their crtc included
    9546aaf0cbd7 drm/msm/dpu: Disable dither in phys encoder cleanup
    80824cef1759 arm64: dts: mediatek: mt8183: Disable DSI display output by default
    fbb770b97e18 drm/nouveau/pmu: Fix gp10b firmware guard
    586f0114875a bpf: skip non exist keys in generic_map_lookup_batch
    d3acd2a4c852 nvme/ioctl: add missing space in err message
    3b4d899d823c drm/msm: Avoid rounding up to one jiffy
    668ee1a95298 nouveau/svm: fix missing folio unlock + put after make_device_exclusive_range()
    ab438396837a power: supply: da9150-fg: fix potential overflow
    6ecb9fa14eec bpf: Fix deadlock when freeing cgroup storage
    eab50afcf715 bpf: Disable non stream socket for strparser
    05a571ee23c0 bpf: Fix wrong copied_seq calculation
    a26f95b6e317 strparser: Add read_sock callback
    29cfda62ab4d bpf: avoid holding freeze_mutex during mmap operation
    fc01ba097319 bpf: unify VM_WRITE vs VM_MAYWRITE use in BPF map mmaping logic
    d56d8a23d951 bpf, test_run: Fix use-after-free issue in eth_skb_pkt_type()
    2b99b2c4621d drm/msm/gem: prevent integer overflow in msm_ioctl_gem_submit()
    c620a776d776 drm/msm/gem: Demote userspace errors to DRM_UT_DRIVER
    f8d9cc332161 drm/tidss: Fix race condition while handling interrupt registers
    ed14b2afe18c drm/tidss: Add simple K2G manual reset
    f1d5e6a5e468 tcp: drop secpath at the same time as we currently drop dst
    820cb874cfa5 net: axienet: Set mac_managed_pm
    24e0ede914a3 arp: switch to dev_getbyhwaddr() in arp_req_set_public()
    026b2a1b6a6f net: Add non-RCU dev_getbyhwaddr() helper
    ef3d41c51eb3 flow_dissector: Fix port range key handling in BPF conversion
    dfc61b8bd1df flow_dissector: Fix handling of mixed port and port-range keys
    87db59995eb1 geneve: Suppress list corruption splat in geneve_destroy_tunnels().
    9d03e7e37187 gtp: Suppress list corruption splat in gtp_net_exit_batch_rtnl().
    4907686790b0 tcp: adjust rcvq_space after updating scaling ratio
    61004a518920 vsock/bpf: Warn on socket without transport
    cc9a7832ede5 sockmap, vsock: For connectible sockets allow only connected
    093b0e5c9059 ibmvnic: Don't reference skb after sending to VIOS
    da8c1f9d8c96 ibmvnic: Add stat for tx direct vs tx batched
    4b1555f9f9fb ibmvnic: Introduce send sub-crq direct
    b43a1ad2b262 ibmvnic: Return error code on TX scrq flush fail
    940d15254d22 s390/ism: add release function for struct device
    48e348ff3e18 ALSA: seq: Drop UMP events when no UMP-conversion is set
    de4b679aa3b4 net/sched: cls_api: fix error handling causing NULL dereference
    a0675917bed1 ALSA: hda/cirrus: Correct the full scale volume set logic
    3ce92ca990cf geneve: Fix use-after-free in geneve_find_dev().
    2d542f13d263 powerpc/code-patching: Fix KASAN hit by not flagging text patching area as VM_ALLOC
    5c83016dfc3d ALSA: hda/realtek: Fixup ALC225 depop procedure
    044ce3bd2441 powerpc/64s: Rewrite __real_pte() and __rpte_to_hidx() as static inline
    a2726229aed7 powerpc/64s/mm: Move __real_pte stubs into hash-4k.h
    9dd4ff502813 ASoC: rockchip: i2s-tdm: fix shift config for SND_SOC_DAIFMT_DSP_[AB]
    deeee3adb2c0 USB: gadget: f_midi: f_midi_complete to call queue_work
    859cb45aefa6 usb: gadget: core: flush gadget workqueue after device removal
    e79e6f2490b3 USB: gadget: core: create sysfs link between udc and gadget
    2c49e894389a nvmem: imx-ocotp-ele: fix MAC address byte order
    a0ee898a5024 nvmem: Move and rename ->fixup_cell_info()
    276dae17ad97 nvmem: Simplify the ->add_cells() hook
    39dfc17a38f7 nvmem: Create a header for internal sharing
    4dbaa738c583 media: uvcvideo: Remove dangling pointers
    08384382e1db media: uvcvideo: Only save async fh if success
    bd747c0a1a0d media: uvcvideo: Refactor iterators
    a5128b5f2905 soc: mediatek: mtk-devapc: Fix leaking IO map on driver remove
    feea30e0754d soc/mediatek: mtk-devapc: Convert to platform remove callback returning void
    3cce694e7e19 arm64: dts: qcom: sm8550: Fix ADSP memory base and length
    5d285b468ed6 arm64: dts: qcom: sm8550: add missing qcom,non-secure-domain property
    5369d3b31f2f arm64: dts: qcom: sm8550: Add dma-coherent property
    5a8f1613a18a arm64: dts: qcom: sm8450: Fix ADSP memory base and length
    e96ddc4f0040 arm64: dts: qcom: sm8450: add missing qcom,non-secure-domain property
    3cfce644d8a7 scsi: core: Do not retry I/Os during depopulation
    7f818ac0ac7f scsi: core: Handle depopulation and restoration in progress
    b11052c8c4f2 firmware: qcom: scm: Fix missing read barrier in qcom_scm_is_available()
    67f04c52e5f9 ASoC: renesas: rz-ssi: Add a check for negative sample_space
    a2cbcd70133d Input: synaptics - fix crash when enabling pass-through port
    c02d630398e4 Input: serio - define serio_pause_rx guard to pause and resume serio ports
    ab8b6bf2bf61 Bluetooth: qca: Fix poor RF performance for WCN6855
    ae2d111c09dc Bluetooth: qca: Update firmware-name to support board specific nvm
    e68d2b880ea9 Bluetooth: qca: Support downloading board id specific NVM for WCN7850
    5d8ba57800a7 cpufreq: fix using cpufreq-dt as module
    a9b868213e7d cpufreq: dt-platdev: add missing MODULE_DESCRIPTION() macro
    972486d37169 memcg: fix soft lockup in the OOM process
    0a657f6e7f3d mm: update mark_victim tracepoints fields
    52848a095b55 md/md-bitmap: Synchronize bitmap_get_stats() with bitmap lifetime
    754fffa651d2 md/md-bitmap: add 'sync_size' into struct md_bitmap_stats
    023d5bc95086 md/md-cluster: fix spares warnings for __le64
    ba9e0f057844 md/md-bitmap: replace md_bitmap_status() with a new helper md_bitmap_get_stats()
    87ebc90e8423 md: simplify md_seq_ops
    452f50807917 md: factor out a helper from mddev_put()
    13231893fb7a md: use separate work_struct for md_start_sync()
    4534162e0916 xfs: don't over-report free space or inodes in statvfs
    1603b0b65731 xfs: report realtime block quota limits on realtime directories
    b887d2fe4a2b xfs: Check for delayed allocations before setting extsize
    067ee59f11bd xfs: streamline xfs_filestream_pick_ag
    1fe5c2aa3903 xfs: Reduce unnecessary searches when searching for the best extents
    c904df659911 xfs: update the pag for the last AG at recovery time
    7a2c24661db6 xfs: don't use __GFP_RETRY_MAYFAIL in xfs_initialize_perag
    5a9f8279988b xfs: error out when a superblock buffer update reduces the agcount
    a9c1ebae75fc xfs: update the file system geometry after recoverying superblock buffers
    bb305f888d6c xfs: pass the exact range to initialize to xfs_initialize_perag
    5a9e3dbb0bf2 xfs: Remove empty declartion in header file
    b5d917a63987 xfs: Use try_cmpxchg() in xlog_cil_insert_pcp_aggregate()
    9716ff882426 xfs: support lowmode allocations in xfs_bmap_exact_minlen_extent_alloc
    a8a80b75b443 xfs: call xfs_bmap_exact_minlen_extent_alloc from xfs_bmap_btalloc
    479e112ddf30 xfs: don't ifdef around the exact minlen allocations
    41e7f8ffee95 xfs: fold xfs_bmap_alloc_userdata into xfs_bmapi_allocate
    f37a5f0e916c xfs: distinguish extra split from real ENOSPC from xfs_attr_node_try_addname
    512a91114295 xfs: distinguish extra split from real ENOSPC from xfs_attr3_leaf_split
    702e1ac48f17 xfs: return bool from xfs_attr3_leaf_add
    3d58507d6c7a xfs: merge xfs_attr_leaf_try_add into xfs_attr_leaf_addname
    7b5b119191bf xfs: don't free cowblocks from under dirty pagecache on unshare
    f56db9ce3cd6 xfs: skip background cowblock trims on inodes open for write
    3e2f7c20510d xfs: fix a typo
    a6790b50bfa0 xfs: fix a sloppy memory handling bug in xfs_iroot_realloc
    629e6a35dd53 xfs: validate inumber in xfs_iget
    ed6282de3d04 xfs: assert a valid limit in xfs_rtfind_forw
    14cc006ed668 arm64: mte: Do not allow PROT_MTE on MAP_HUGETLB user mappings
    c0249d3a0c3c Linux 6.6.79
    50a0821c8203 Revert "vfio/platform: check the bounds of read/write syscalls"
    c02c52036e6d x86/i8253: Disable PIT timer 0 when not in use
    f3b8e9d3414b vsock: Orphan socket after transport release
    3f4354016612 vsock: Keep the binding until socket destruction
    146a185f6c05 io_uring/kbuf: reallocate buf lists on upgrade
    4c8f958a07ff HID: hid-steam: Don't use cancel_delayed_work_sync in IRQ context
    fd0d07cb8b47 alpha: replace hardcoded stack offsets with autogenerated ones
    933b08c0edfa mm: gup: fix infinite loop within __get_longterm_locked
    cad0406ad780 arm64: Filter out SVE hwcaps when FEAT_SVE isn't implemented
    96156eb57726 md/md-bitmap: move bitmap_{start, end}write to md upper layer
    b29e6400be51 md/raid5: implement pers->bitmap_sector()
    14bc83e97fbd md: add a new callback pers->bitmap_sector()
    3e41ab9aef12 md/md-bitmap: remove the last parameter for bimtap_ops->endwrite()
    3b666dad3828 md/md-bitmap: factor behind write counters out from bitmap_{start/end}write()
    03877cb32666 md/raid5: recheck if reshape has finished with device_lock held
    f6b49d4617ad selftests: rtnetlink: update netdevsim ipsec output format
    30472935f708 netdevsim: print human readable IP address
    39a580cd1539 drm/amd/display: Pass non-null to dcn20_validate_apply_pipe_split_flags
    16ce8fd94da8 drm/amd/display: Add null check for head_pipe in dcn201_acquire_free_pipe_for_layer
    ff5d9e3705a3 x86/static-call: Remove early_boot_irqs_disabled check to fix Xen PVH dom0
    eb0e0eca0eab drm/v3d: Stop active perfmon if it is being destroyed
    d7fa812845f6 drm/rcar-du: dsi: Fix PHY lock bit check
    e85e8d48bf6d drm/tidss: Clear the interrupt status for interrupts being disabled
    f99429229916 drm/tidss: Fix issue in irq handling causing irq-flood issue
    1b91c597b021 ipv6: mcast: add RCU protection to mld_newpack()
    81b25a07ebf5 ipv6: mcast: extend RCU protection in igmp6_send()
    ae38982f5216 ndisc: extend RCU protection in ndisc_send_skb()
    8ec57509c36c openvswitch: use RCU protection in ovs_vport_cmd_fill_info()
    e9f4dee534eb arp: use RCU protection in arp_xmit()
    1cbb2aa90cd3 neighbour: use RCU protection in __neigh_notify()
    62091d80e155 neighbour: delete redundant judgment statements
    9e0ec817eb41 ndisc: use RCU protection in ndisc_alloc_skb()
    e1147961b214 HID: hid-steam: Move hidraw input (un)registering to work
    d6187df36586 HID: hid-steam: Make sure rumble work is canceled on removal
    4b996b618294 HID: hid-steam: Add Deck IMU support
    9f82ed6e4197 HID: hid-steam: Fix cleanup in probe()
    0c38fefe773f HID: hid-steam: remove pointless error message
    c68606bdfce3 HID: hid-steam: Add gamepad-only mode switched to by holding options
    622ee123a0d1 HID: hid-steam: Update list of identifiers from SDL
    9544708c64bc HID: hid-steam: Clean up locking
    463b37836e40 HID: hid-steam: Disable watchdog instead of using a heartbeat
    747035cde16f HID: hid-steam: Avoid overwriting smoothing parameter
    463a45592fa5 ipv6: icmp: convert to dev_net_rcu()
    4176a68b0db8 ipv6: use RCU protection in ip6_default_advmss()
    e99e146bf948 flow_dissector: use RCU protection to fetch dev_net()
    338f6418869f ipv4: icmp: convert to dev_net_rcu()
    9b1766d1ff5f ipv4: use RCU protection in __ip_rt_update_pmtu()
    3bed2abab4a6 net: ipv4: Cache pmtu for all packet paths if multipath enabled
    91d93fb59765 ipv4: use RCU protection in inet_select_addr()
    1f778d7a8ba2 ipv4: use RCU protection in rt_is_expired()
    30a26bffd759 ipv4: use RCU protection in ipv4_default_advmss()
    81f369b67006 net: add dev_net_rcu() helper
    4cfecb7fc742 net: treat possible_net_t net pointer as an RCU one and add read_pnet_rcu()
    afd983f102f8 ipv4: add RCU protection to ip4_dst_hoplimit()
    8783ceeee797 clocksource: Use migrate_disable() to avoid calling get_random_u32() in atomic context
    0cc5bb930079 clocksource: Use pr_info() for "Checking clocksource synchronization" message
    29775681433c btrfs: fix hole expansion when writing at an offset beyond EOF
    7511887fcae7 mlxsw: Add return value check for mlxsw_sp_port_get_stats_raw()
    d73d4c9588fc igc: Set buffer type for empty frames in igc_init_empty_frame
    79cf42024050 mmc: mtk-sd: Fix register settings for hs400(es) mode
    c1cf034d8de7 arm64: Handle .ARM.attributes section in linker scripts
    c727f338ab3a regmap-irq: Add missing kfree()
    9722e5b90725 regulator: qcom_smd: Add l2, l5 sub-node to mp5496 regulator
    92527100be38 partitions: mac: fix handling of bogus partition table
    bc7fe1a879fc gpio: stmpe: Check return value of stmpe_reg_read in stmpe_gpio_irq_sync_unlock
    98fde755d661 gpiolib: acpi: Add a quirk for Acer Nitro ANV14
    0f4573f8fe00 alpha: align stack for page fault and user unaligned trap handlers
    5e00346deb7b serial: 8250: Fix fifo underflow on flush
    ccdca0a0ff44 serial: port: Always update ->iotype in __uart_read_properties()
    357c267e5d30 serial: port: Assign ->iotype correctly when ->iobase is set
    a00e607102eb cgroup: fix race between fork and cgroup.kill
    b5bfb235f7e1 efi: Avoid cold plugged memory for placing the kernel
    16467ffd3d20 kbuild: userprogs: fix bitsize and target detection on clang
    f8bef3f067b6 wifi: ath12k: fix handling of 6 GHz rules
    147495d02a7f alpha: make stack 16-byte aligned (most cases)
    1590667a6075 can: etas_es58x: fix potential NULL pointer dereference on udev->serial
    2a6ea31d597d can: j1939: j1939_sk_send_loop(): fix unable to send messages with data length zero
    bb4fbd870cd9 can: c_can: fix unbalanced runtime PM disable in error path
    e505b83b9ee6 can: ctucanfd: handle skb allocation failure
    0947a24193c8 USB: serial: option: drop MeiG Smart defines
    ced6965f55e1 USB: serial: option: fix Telit Cinterion FN990A name
    5a3544d8ba22 USB: serial: option: add Telit Cinterion FN990B compositions
    4e6bd3620aa9 USB: serial: option: add MeiG Smart SLM828
    db89b3bebd08 usb: cdc-acm: Fix handling of oversized fragments
    6abb510251e7 usb: cdc-acm: Check control transfer buffer size before access
    1a3c2c4dce8a USB: cdc-acm: Fill in Renesas R-Car D3 USB Download mode quirk
    e905a0fca7bf USB: hub: Ignore non-compliant devices with too many configs or interfaces
    6ae6dee9f005 usb: gadget: f_midi: fix MIDI Streaming descriptor lengths
    8b6efb4d389e USB: Add USB_QUIRK_NO_LPM quirk for sony xperia xz1 smartphone
    483cfd0f58fd USB: quirks: add USB_QUIRK_NO_LPM quirk for Teclast dist
    54a5e0156ea7 usb: core: fix pipe creation for get_bMaxPacketSize0
    add6d8a137cb USB: pci-quirks: Fix HCCPARAMS register error for LS7A EHCI
    da1b45064fb2 usb: dwc2: gadget: remove of_node reference upon udc_stop
    e3470d4c5c7b usb: gadget: udc: renesas_usb3: Fix compiler warning
    5d6749bb1b1b usb: roles: set switch registered flag early on
    2f71a89d63d7 usb: dwc3: Fix timeout issue during controller enter/exit from halt state
    3aba54561999 usb: gadget: f_midi: Fixing wMaxPacketSize exceeded issue during MIDI bind retries
    1dde83a88392 perf/x86/intel: Ensure LBRs are disabled when a CPU is starting
    d680a1e20222 KVM: nSVM: Enter guest mode before initializing nested NPT MMU
    874ff13c73c4 KVM: x86: Reject Hyper-V's SEND_IPI hypercalls if local APIC isn't in-kernel
    e43a8b9c4d70 drm/amdgpu: avoid buffer overflow attach in smu_sys_set_pp_table()
    a7aa23172858 batman-adv: Drop unmanaged ELP metric worker
    96405e2c499e batman-adv: Ignore neighbor throughput metrics in error case
    072b27873219 batman-adv: fix panic during interface removal
    ec4180dc87b1 ASoC: Intel: bytcr_rt5640: Add DMI quirk for Vexia Edu Atla 10 tablet 5V
    2b84a231910c orangefs: fix a oob in orangefs_debug_write
    a04fe3bfc71e x86/mm/tlb: Only trim the mm_cpumask once a second
    a3bcd891e113 ACPI: x86: Add skip i2c clients quirk for Vexia EDU ATLA 10 tablet 5V
    3d9f63e2ac52 selftests: gpio: gpio-sim: Fix missing chip disablements
    207efb2f4ee5 Grab mm lock before grabbing pt lock
    19b3ca651b4b NFS: Fix potential buffer overflowin nfs_sysfs_link_rpc_client()
    2a0696363da4 vfio/pci: Enable iowrite64 and ioread64 for vfio pci
    5ed11d00737d rtla/timerlat_top: Abort event processing on second signal
    a20341b7a167 rtla/timerlat_hist: Abort event processing on second signal
    5f782d4741bf scsi: ufs: bsg: Set bsg_queue to NULL after removal
    ac7ed282a0f1 PCI: switchtec: Add Microchip PCI100X device IDs
    d8fd38b901ef PCI/DPC: Quirk PIO log size for Intel Raptor Lake-P
    2c5601b99d79 media: vidtv: Fix a null-ptr-deref in vidtv_mux_stop_thread
    06ffcc72121e media: uvcvideo: Add Kurokesu C1 PRO camera
    ec5fa3282465 media: uvcvideo: Add new quirk definition for the Sonix Technology Co. 292a camera
    a7e1b1388d41 media: uvcvideo: Implement dual stream quirk to fix loss of usb packets
    95d0d793b678 media: i2c: ds90ub953: Add error handling for i2c reads/writes
    75ba1588c559 media: i2c: ds90ub913: Add error handling to ub913_hw_init()
    db84810d9996 media: cxd2841er: fix 64-bit division on gcc-9
    3a4f623bb6f2 soc/tegra: fuse: Update Tegra234 nvmem keepout list
    fb6a5edb6092 fbdev: omap: use threaded IRQ for LCD DMA
    edc64c0f686d RDMA/efa: Reset device on probe failure
    627218d4ac85 tools: fix annoying "mkdir -p ..." logs when building tools in parallel
    4d9b2b62e113 gpiolib: Fix crash on error in gpiochip_get_ngpios()
    99ca540851ee block: cleanup and fix batch completion adding conditions
    5a32765ac724 x86/xen: allow larger contiguous memory regions in PV guests
    461d9e8acaa4 xen/swiotlb: relax alignment requirements
    3f40a7ff39d9 drm/amdgpu: bail out when failed to load fw in psp_init_cap_microcode()
    7159b7e13743 gpio: bcm-kona: Add missing newline to dev_err format string
    0d091da7f9da gpio: bcm-kona: Make sure GPIO bits are unlocked when requesting IRQ
    88a78a7bdbaf gpio: bcm-kona: Fix GPIO lock/unlock for banks above bank 0
    b1da0f6264a3 drm/i915/selftests: avoid using uninitialized context
    b25ba45fcfdb cgroup: Remove steal time from usage_usec
    ab90894f33c1 arm64: cacheinfo: Avoid out-of-bounds write to cacheinfo array
    d071a91fa614 team: better TEAM_OPTION_TYPE_STRING validation
    964a8895704a LoongArch: csum: Fix OoB access in IP checksum code for negative lengths
    1dfcc04e3cb4 LoongArch: Fix idle VS timer enqueue
    a303649b99b6 vxlan: check vxlan_vnigroup_init() return value
    c40cb5c03e37 vrf: use RCU protection in l3mdev_l3_out()
    35b3f615fbd4 ndisc: ndisc_send_redirect() must use dev_get_by_index_rcu()
    94a0de224ed5 ax25: Fix refcount leak caused by setting SO_BINDTODEVICE sockopt
    966328191b4c spi: sn-f-ospi: Fix division by zero
    f3ce05283f6c HID: hid-thrustmaster: fix stack-out-of-bounds read in usb_check_int_endpoints()
    62f8bf06262b HID: multitouch: Add NULL check in mt_input_configured
    c5d46ae55a51 pinctrl: cy8c95x0: Respect IRQ trigger settings from firmware
    23ad7797c74c NFSD: fix hang in nfsd4_shutdown_callback
    55d947315fb5 nfsd: clear acl_access/acl_default after releasing them
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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 942b286ed7..475b1624b4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1ea3894afeb849bf7007324b6fbd7f7908d0dc30"
-SRCREV_meta ?= "8315cf9f3b698885f5c4693582d27d66c511f8c5"
+SRCREV_machine ?= "d40fd6f42b7a694c9689ad24b64d75e8c37d0d03"
+SRCREV_meta ?= "8cfcad6ed49d8b56dc69640d30ab834ff5e44aff"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.78"
+LINUX_VERSION ?= "6.6.80"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 4b3471f0a1..b2a72d90f7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.78"
+LINUX_VERSION ?= "6.6.80"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "bff737d93e7a99beb4a6e75955ff4bbe0ef2e1e6"
-SRCREV_meta ?= "8315cf9f3b698885f5c4693582d27d66c511f8c5"
+SRCREV_machine ?= "67833ae0fc57611f518d03e5c2893ce307d9dd0c"
+SRCREV_meta ?= "8cfcad6ed49d8b56dc69640d30ab834ff5e44aff"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 066d82406b..f8e87b7b94 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "2603ba7154f2fb30e30cdd5c195164d07beaa543"
-SRCREV_machine:qemuarm64 ?= "bff737d93e7a99beb4a6e75955ff4bbe0ef2e1e6"
-SRCREV_machine:qemuloongarch64 ?= "bff737d93e7a99beb4a6e75955ff4bbe0ef2e1e6"
-SRCREV_machine:qemumips ?= "d3bc10f494caff75eb0a42491f9cbf4066cf411d"
-SRCREV_machine:qemuppc ?= "bff737d93e7a99beb4a6e75955ff4bbe0ef2e1e6"
-SRCREV_machine:qemuriscv64 ?= "bff737d93e7a99beb4a6e75955ff4bbe0ef2e1e6"
-SRCREV_machine:qemuriscv32 ?= "bff737d93e7a99beb4a6e75955ff4bbe0ef2e1e6"
-SRCREV_machine:qemux86 ?= "bff737d93e7a99beb4a6e75955ff4bbe0ef2e1e6"
-SRCREV_machine:qemux86-64 ?= "bff737d93e7a99beb4a6e75955ff4bbe0ef2e1e6"
-SRCREV_machine:qemumips64 ?= "88b5fbd8c4b788b206370877e2ea23250142de2f"
-SRCREV_machine ?= "bff737d93e7a99beb4a6e75955ff4bbe0ef2e1e6"
-SRCREV_meta ?= "8315cf9f3b698885f5c4693582d27d66c511f8c5"
+SRCREV_machine:qemuarm ?= "58ba48e28b43669926b14db3e026a23a0fc24e4d"
+SRCREV_machine:qemuarm64 ?= "67833ae0fc57611f518d03e5c2893ce307d9dd0c"
+SRCREV_machine:qemuloongarch64 ?= "67833ae0fc57611f518d03e5c2893ce307d9dd0c"
+SRCREV_machine:qemumips ?= "45ca988f1aca2de0a5436d019a82f1242e8de1e9"
+SRCREV_machine:qemuppc ?= "67833ae0fc57611f518d03e5c2893ce307d9dd0c"
+SRCREV_machine:qemuriscv64 ?= "67833ae0fc57611f518d03e5c2893ce307d9dd0c"
+SRCREV_machine:qemuriscv32 ?= "67833ae0fc57611f518d03e5c2893ce307d9dd0c"
+SRCREV_machine:qemux86 ?= "67833ae0fc57611f518d03e5c2893ce307d9dd0c"
+SRCREV_machine:qemux86-64 ?= "67833ae0fc57611f518d03e5c2893ce307d9dd0c"
+SRCREV_machine:qemumips64 ?= "589ba875b2fbf6bb45bb13ac36cc06d2ff54f7cb"
+SRCREV_machine ?= "67833ae0fc57611f518d03e5c2893ce307d9dd0c"
+SRCREV_meta ?= "8cfcad6ed49d8b56dc69640d30ab834ff5e44aff"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "4407146cf3fcfe8883f6123b89f861a11cc4e4df"
+SRCREV_machine:class-devupstream ?= "568e253c3e3bdfecf5a4d65ccc8fc971c6c4b31f"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.78"
+LINUX_VERSION ?= "6.6.80"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


