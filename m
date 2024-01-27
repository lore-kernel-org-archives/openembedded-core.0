Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E91C48285
	for <webhook@archiver.kernel.org>; Sat, 27 Jan 2024 02:37:59 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.8489.1706323074584642209
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 18:37:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EXZMl6EO;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d73066880eso9065565ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 18:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706323074; x=1706927874; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6BMVo6+piVgBRJPAUOawTIupC9hSeSC+KImyQy9SgNs=;
        b=EXZMl6EO9IRXiozsghqKDC4oB2QrH3/ZG4nmf43okCdHxtaqnWhprmtUWwUcAQAg7n
         TqWigvPBSeOFUJlmJKb1ltdUJ92wKFXr8PTR/XONzPCtO7M9ZN4OvGkLh/qI386XrcjO
         2jvWBJlYwaqCRfFQTULgjNyXs2dRESJOmKXgpdRd6OUeQHRLKwr0OyjeLmkDIv1kbcJj
         gi5YcOjrd1C88fSaR0nJAc2gUI55Pti/ypmvUWZbSkQDVL/95ZizSSCJj+UJQd4Gi9Ia
         yV7KWQylRBnBqX3v2eGansCJVuhU4+CiNoBTTklGuPjXCTz2W/nR2nK/pxY7TWiwH0K+
         WRhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706323074; x=1706927874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6BMVo6+piVgBRJPAUOawTIupC9hSeSC+KImyQy9SgNs=;
        b=peqz2QOvTV1XkL4DMJnUWza5boW/3C329Wz+tUJEOR4+ItzHghXQeBOHPvColZVsYf
         1vmgdfT7MSxP5WsGaHyyYo01niNgvRJgr3pYtQo2DoalNX0AWSeMKSTZvL3hNimNlzEg
         xis2CGekMpUBXPcj7c8jjFAfSBaYb6bCXU6yiyHBEuMirpjz6zdQFKOKRlCCJKCXCi6h
         jv4tI/p1xQ126nW1veCnVmgddydUcmLB79FKTr9FshT0fALvkyxLBS3F0kqU0Q/Vdfg7
         tJxaCdUlbAlNqay72PEm0LPBM8J2Hfzi6p/JhTGGnX77/BBl4zxto3VDNZzW8AMIfYaR
         91ZQ==
X-Gm-Message-State: AOJu0Yy3Uy4VFJMVw49RO2JPg1FeEZ4H00J5OnFufLPcmx0CdeRazwOk
	ALr+49tJ/q/JMw5G2Ttlo7Nx1Pe/LRMfVp+ivhwC+4iPLihKcREg2fmik9leQQgLJXasSqbbk/l
	5Cj3tMg==
X-Google-Smtp-Source: AGHT+IFkQJYBBOtc0KAfl1cSuKISitMcGQWapA+Jzb0JaLHPrk1JKt4XcaT2ZF4F2E0kU2SVT5OPUQ==
X-Received: by 2002:a17:902:6e02:b0:1d7:505f:9227 with SMTP id u2-20020a1709026e0200b001d7505f9227mr757280plk.110.1706323073446;
        Fri, 26 Jan 2024 18:37:53 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id r8-20020a170902be0800b001d7405022ecsm1547045pls.159.2024.01.26.18.37.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 18:37:53 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 08/23] linux-yocto/6.1: update to v6.1.72
Date: Fri, 26 Jan 2024 16:37:16 -1000
Message-Id: <127092cdb8818bfa454d85e95fc91d3f5a58351e.1706322780.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706322780.git.steve@sakoman.com>
References: <cover.1706322780.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jan 2024 02:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194417

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.1 to the latest korg -stable release that comprises
the following commits:

    7c58bfa711cb Linux 6.1.72
    2dbe25ae06e6 Revert "interconnect: qcom: sm8250: Enable sync_state"
    f73a374c1969 smb3: Replace smb2pdu 1-element arrays with flex-arrays
    ec162546a733 media: qcom: camss: Comment CSID dt_id field
    a5c3f2b4cee7 bpf: syzkaller found null ptr deref in unix_bpf proto add
    15db682980fc bpf: Fix a verifier bug due to incorrect branch offset comparison with cpu=v4
    7cbdf36eabf3 net/sched: act_ct: Always fill offloading tuple iifidx
    2be4e8ac2d16 net/sched: act_ct: additional checks for outdated flows
    87318b7e374c f2fs: compress: fix to assign compress_level for lz4 correctly
    397f719037c2 genirq/affinity: Only build SMP-only helper functions on SMP kernels
    28c9222e29e5 mmc: sdhci-sprd: Fix eMMC init failure after hw reset
    2813a434d461 mmc: core: Cancel delayed work before releasing host
    575e127041f2 mmc: rpmb: fixes pause retune on all RPMB partitions.
    9c5efaa09b31 mmc: meson-mx-sdhc: Fix initialization frozen issue
    48e1d426f452 drm/amd/display: add nv12 bounding box
    11c3510d1d4d drm/amdgpu: skip gpu_info fw loading on navi12
    dafdeb7b91f1 mm: fix unmap_mapping_range high bits shift bug
    08038069c237 i2c: core: Fix atomic xfer check for non-preempt config
    53b42cb33fb1 x86/kprobes: fix incorrect return address calculation in kprobe_emulate_call_indirect
    d1db1ef5e633 firewire: ohci: suppress unexpected system reboot in AMD Ryzen machines and ASM108x/VT630x PCIe cards
    09a44d994bfe ring-buffer: Fix 32-bit rb_time_read() race with rb_time_cmpxchg()
    820a7802f25a btrfs: mark the len field in struct btrfs_ordered_sum as unsigned
    ab220f4f5c70 btrfs: fix qgroup_free_reserved_data int overflow
    0f74dde5be2c octeontx2-af: Support variable number of lmacs
    7d3912613d5b octeontx2-af: Fix pause frame configuration
    a29b15cc68a6 net/sched: act_ct: Take per-cb reference to tcf_ct_flow_table
    2bb4ecb3349c netfilter: flowtable: GC pushes back packets to classic path
    df01de08b411 net/sched: act_ct: Fix promotion of offloaded unreplied tuple
    87466a374571 net/sched: act_ct: offload UDP NEW connections
    8b160f2fba77 netfilter: flowtable: cache info of last offload
    c29a7656f8a2 netfilter: flowtable: allow unidirectional rules
    e681f711e9e8 net: sched: call tcf_ct_params_free to free params in tcf_ct_init
    d49bf9c1ceb3 mm/memory_hotplug: fix error handling in add_memory_resource()
    4666f003afff mm/memory_hotplug: add missing mem_hotplug_lock
    a576780a2a66 lib/group_cpus.c: avoid acquiring cpu hotplug lock in group_cpus_evenly
    f33b27f5c3de genirq/affinity: Move group_cpus_evenly() into lib/
    617ba3735d3b genirq/affinity: Rename irq_build_affinity_masks as group_cpus_evenly
    aeeb4e4e49f8 genirq/affinity: Don't pass irq_affinity_desc array to irq_build_affinity_masks
    9e84d7bb1505 genirq/affinity: Pass affinity managed mask array to irq_build_affinity_masks
    a1dcd1794730 genirq/affinity: Remove the 'firstvec' parameter from irq_build_affinity_masks
    f4fe76467e7b ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7
    aee609302d65 firmware: arm_scmi: Fix frequency truncation by promoting multiplier type
    90d1f74c3cf6 bpf, sockmap: af_unix stream sockets need to hold ref for pair sock
    5ff1682fec18 ethtool: don't propagate EOPNOTSUPP from dumps
    e570b1508753 dpaa2-eth: recycle the RX buffer only after all processing done
    5b8938fc7d00 net: dpaa2-eth: rearrange variable in dpaa2_eth_get_ethtool_stats
    e88275ce7e7b smb: client: fix missing mode bits for SMB symlinks
    bf223fd4d914 block: update the stable_writes flag in bdev_add
    a8e4300ae58d filemap: add a per-mapping stable writes flag
    d0eafc763135 mm, netfs, fscache: stop read optimisation when folio removed from pagecache
    bceff380f361 mm: merge folio_has_private()/filemap_release_folio() call pairs
    8b6b3ecf0c13 memory-failure: convert truncate_error_page() to use folio
    a6f440f3b956 khugepage: replace try_to_release_page() with filemap_release_folio()
    4c78612e5fbc ext4: convert move_extent_per_page() to use folios
    b92a8f591ca8 media: qcom: camss: Fix set CSI2_RX_CFG1_VC_MODE when VC is greater than 3
    710f70555d5b media: camss: sm8250: Virtual channels for CSID
    c96a4f936008 selftests: mptcp: set FAILING_LINKS in run_tests
    4b85e920afc8 selftests: mptcp: fix fastclose with csum failure
    336d1ee07efb f2fs: set the default compress_level on ioctl
    1ff3f5ef284b f2fs: assign default compression level
    55d3f41e5583 f2fs: convert to use bitmap API
    84a8d913fb53 f2fs: clean up i_compress_flag and i_compress_level usage
    2c14f4991610 s390/cpumf: support user space events for counting
    a1a1e5ce88a7 s390/mm: add missing arch_set_page_dat() call to vmem_crst_alloc()
    31051f722db2 net/mlx5: Increase size of irq name buffer
    b5c8e0ff76d1 blk-mq: make sure active queue usage is held for bio_integrity_prep()
    803fb6109fcf bpf: fix precision backtracking instruction iteration
    b08acd5c4602 bpf: handle ldimm64 properly in check_cfg()
    2c795ce09042 bpf: Support new 32bit offset jmp instruction
    b1c780ed3c22 bpf: clean up visit_insn()'s instruction processing
    97bb6dab0172 bpf: Remove unused insn_cnt argument from visit_[func_call_]insn()
    8266c47d04b2 bpf: remove unnecessary prune and jump points
    743f3548d301 bpf: decouple prune and jump points
    eb4f2e17886a fbdev: imsttfb: fix double free in probe()
    f2a79f3651a5 fbdev: imsttfb: Release framebuffer and dealloc cmap on error path
    51a1b943022f arm64: dts: qcom: sdm845: Fix PSCI power domain names
    5db8b93cbe2d arm64: dts: qcom: sdm845: align RPMh regulator nodes with bindings
    343bb27e3152 wifi: iwlwifi: yoyo: swap cdb and jacket bits values
    158b71f3a9fa udp: annotate data-races around udp->encap_type
    8d929b6c1114 udp: lockless UDP_ENCAP_L2TPINUDP / UDP_GRO
    b680a907d17c udp: move udp->accept_udp_{l4|fraglist} to udp->udp_flags
    753886c0b994 udp: move udp->gro_enabled to udp->udp_flags
    a01cff15ccdc udp: move udp->no_check6_rx to udp->udp_flags
    50e41aa9ea0d udp: move udp->no_check6_tx to udp->udp_flags
    e2a4392b61f6 udp: introduce udp->udp_flags
    2489502fb1f5 ipv4, ipv6: Use splice_eof() to flush
    4713b7c7568b splice, net: Add a splice_eof op to file-ops and socket-ops
    ac8c69e448f7 udp: Convert udp_sendpage() to use MSG_SPLICE_PAGES
    6bcc79a4e760 net: Declare MSG_SPLICE_PAGES internal sendmsg() flag
    89b51e70e5e3 bpf, x86: save/restore regs with BPF_DW size
    4ee461c5dc99 bpf, x86: Simplify the parsing logic of structure parameters
    605c8d8f9966 bpf, x64: Fix tailcall infinite loop
    5573fdbc3423 srcu: Fix callbacks acceleration mishandling
    abc3e3fb71a5 cpu/SMT: Make SMT control more robust against enumeration failures
    482fa21635c8 cpu/SMT: Create topology_smt_thread_allowed()
    a364c18553d0 selftests: secretmem: floor the memory size to the multiple of page_size
    c38c5cfd3ed7 net: Implement missing SO_TIMESTAMPING_NEW cmsg support
    14937f47a48f bnxt_en: Remove mis-applied code from bnxt_cfg_ntp_filters()
    55fbcd83aaca net: ravb: Wait for operating mode to be applied
    8a09b0f01c40 asix: Add check for usbnet_get_endpoints
    db9c4a1f37ee octeontx2-af: Re-enable MAC TX in otx2_stop processing
    b67e7d78e48a octeontx2-af: Always configure NIX TX link credits based on max frame size
    84c3833a93bb net/smc: fix invalid link access in dumping SMC-R connections
    0af75845ff5e net/qla3xxx: fix potential memleak in ql_alloc_buffer_queues
    9b0504292237 igc: Fix hicredit calculation
    7663226274af i40e: Restore VF MSI-X state during PCI reset
    5735f529e318 ASoC: meson: g12a-tohdmitx: Fix event generation for S/PDIF mux
    8719838c126a ASoC: meson: g12a-toacodec: Fix event generation
    5de3c8496e77 ASoC: meson: g12a-tohdmitx: Validate written enum values
    95b4d4093ac0 ASoC: meson: g12a-toacodec: Validate written enum values
    2f3b6e8600c9 i40e: fix use-after-free in i40e_aqc_add_filters()
    72fa66177859 net: Save and restore msg_namelen in sock_sendmsg
    81f8a995ebc8 netfilter: nft_immediate: drop chain reference counter on error
    bb1bf97fa187 net: bcmgenet: Fix FCS generation for fragmented skbuffs
    e75715e1c2e5 sfc: fix a double-free bug in efx_probe_filters
    725d44e49fb5 ARM: sun9i: smp: Fix array-index-out-of-bounds read in sunxi_mc_smp_init
    85f6fae44bba selftests: bonding: do not set port down when adding to bond
    3edd66bd4e42 net: Implement missing getsockopt(SO_TIMESTAMPING_NEW)
    ac5fde92b510 net: annotate data-races around sk->sk_bind_phc
    c48fcb4f4906 net: annotate data-races around sk->sk_tsflags
    5d586f7ca0fc net-timestamp: extend SOF_TIMESTAMPING_OPT_ID to HW timestamps
    b2130366a952 can: raw: add support for SO_MARK
    633a49e34b32 r8169: Fix PCI error on system resume
    565460e180d9 net: sched: em_text: fix possible memory leak in em_text_destroy()
    ac5cbe931c43 mlxbf_gige: fix receive packet race condition
    6d7f45492706 ASoC: mediatek: mt8186: fix AUD_PAD_TOP register and offset
    811604fb02c4 ASoC: fsl_rpmsg: Fix error handler with pm_runtime_enable
    c3a37dc15685 igc: Check VLAN EtherType mask
    6edff0b8381c igc: Check VLAN TCI mask
    d27b98f4aeae igc: Report VLAN EtherType matching back to user
    e76d1913f6a8 i40e: Fix filter input checks to prevent config with invalid values
    188c9970d05e ice: Shut down VSI with "link-down-on-close" enabled
    83b80170b7fa ice: Fix link_down_on_close message
    f3f6a23e054c drm/i915/dp: Fix passing the correct DPCD_REV for drm_dp_set_phy_test_pattern
    6cf7235bc1fb octeontx2-af: Fix marking couple of structure as __packed
    a4b0a9b80a96 nfc: llcp_core: Hold a ref to llcp_local->dev when holding a ref to llcp_local
    282e3fb61285 netfilter: nf_tables: set transport offset from mac header for netdev/egress
    9487cc4c90fb netfilter: use skb_ip_totlen and iph_totlen
    5f523f1beb46 drm/bridge: ti-sn65dsi86: Never store more than msg->size bytes in AUX xfer
    3da4868907da wifi: iwlwifi: pcie: don't synchronize IRQs from IRQ
    493d556278a3 KVM: x86/pmu: fix masking logic for MSR_CORE_PERF_GLOBAL_CTRL
    3152a7d361c6 cifs: do not depend on release_iface for maintaining iface_list
    5982a625fc0d cifs: cifs_chan_is_iface_active should be called with chan_lock held
    4afcb82518b9 drm/mgag200: Fix gamma lut not initialized for G200ER, G200EV, G200SE
    b9c370b61d73 Revert "PCI/ASPM: Remove pcie_aspm_pm_state_change()"
    af9a5307656d mptcp: prevent tcp diag from closing listener subflows
    105063f7f441 ALSA: hda/realtek: Fix mute and mic-mute LEDs for HP ProBook 440 G6
    0fa3cf2d151e ALSA: hda/realtek: fix mute/micmute LEDs for a HP ZBook
    beda900d3aaf ALSA: hda/realtek: enable SND_PCI_QUIRK for hp pavilion 14-ec1xxx series
    9539e3b56e0d block: Don't invalidate pagecache for invalid falloc modes
    079eefaecfd7 keys, dns: Fix missing size check of V1 server-list header
    38fb82ecd144 Linux 6.1.71
    74c4c7d57cf2 Revert "platform/x86: p2sb: Allow p2sb_bar() calls during PCI device probe"
    7709b16bdbd5 tracing/kprobes: Fix symbol counting logic by looking at modules as well
    9dd295341dc1 kallsyms: Make module_kallsyms_on_each_symbol generally available
    29cb16577189 device property: Allow const parameter to dev_fwnode()
    e7b04372179e spi: Constify spi parameters of chip select APIs
    f9a01938e079 NFSD: fix possible oops when nfsd/pool_stats is closed.
    899ac41804d8 ring-buffer: Fix slowpath of interrupted event
    0105571f80ed netfilter: nf_tables: skip set commit for deleted/destroyed sets
    4768430d5a69 ring-buffer: Remove useless update to write_stamp in rb_try_to_discard()
    f33c4e4cabce tracing: Fix blocked reader of snapshot buffer
    09640899e6b7 ring-buffer: Fix wake ups when buffer_percent is set to 100
    4ee9d9291b95 mm/memory-failure: check the mapcount of the precise page
    fb21c9780a31 mm/memory-failure: cast index to loff_t before shifting it
    be72d197b228 mm: migrate high-order folios in swap cache correctly
    a8df791470fb mm/filemap: avoid buffered read/write race to read inconsistent data
    b954b92ef08f platform/x86: p2sb: Allow p2sb_bar() calls during PCI device probe
    7a3bbbadac4b ksmbd: fix slab-out-of-bounds in smb_strndup_from_utf16()
    b9c5f0fd5cd5 block: renumber QUEUE_FLAG_HW_WC
    e21b5fc5b887 spi: atmel: Fix clock issue when using devices with different polarities
    025cf65f68d4 spi: Add APIs in spi core to set/get spi->chip_select and spi->cs_gpiod
    64a4eb2982db spi: Reintroduce spi_set_cs_timing()
    95e21657ffe9 linux/export: Ensure natural alignment of kcrctab array
    bb4f791cb2de nfsd: call nfsd_last_thread() before final nfsd_put()
    03d68ffc48b9 nfsd: separate nfsd_last_thread() from nfsd_put()
    481561a431ff iio: imu: adis16475: add spi_device_id table
    027eaeaf3294 spi: Introduce spi_get_device_match_data() helper
    457a219c8453 usb: fotg210-hcd: delete an incorrect bounds test
    119127273b5d ARM: dts: Fix occasional boot hang for am3 usb
    98235bc13aa8 ksmbd: fix wrong allocation size update in smb2_open()
    04b8e04f8f89 ksmbd: avoid duplicate opinfo_put() call on error of smb21_lease_break_ack()
    34f7d5b5c972 ksmbd: lazy v2 lease break on smb2_write()
    500c7a5e9af8 ksmbd: send v2 lease break notification for directory
    1993959460c0 ksmbd: downgrade RWH lease caching state to RH for directory
    2fcb46df3460 ksmbd: set v2 lease capability
    3eddc811a7c8 ksmbd: set epoch in create context v2 lease
    52a32eafd0a5 ksmbd: don't update ->op_state as OPLOCK_STATE_NONE on error
    0bc46c2370ee ksmbd: move setting SMB2_FLAGS_ASYNC_COMMAND and AsyncId
    d9aa5c19084e ksmbd: release interim response after sending status pending response
    013bf453af0d ksmbd: move oplock handling after unlock parent dir
    20dd92c23756 ksmbd: separately allocate ci per dentry
    d5651972e5c5 ksmbd: fix possible deadlock in smb2_open
    aabc944ebf08 ksmbd: prevent memory leak on error return
    b4a269bb89dd ksmbd: fix kernel-doc comment of ksmbd_vfs_kern_path_locked()
    699ad8d03cc5 ksmbd: no need to wait for binded connection termination at logoff
    3cf44550814c ksmbd: add support for surrogate pair conversion
    d26e024a5ead ksmbd: fix missing RDMA-capable flag for IPoIB device in ksmbd_rdma_capable_netdev()
    5113f7222554 ksmbd: fix recursive locking in vfs helpers
    42e56982bed1 ksmbd: fix kernel-doc comment of ksmbd_vfs_setxattr()
    533e6dc4469f ksmbd: reorganize ksmbd_iov_pin_rsp()
    1d95c5a54184 ksmbd: Remove unused field in ksmbd_user struct
    5929e98f3bb7 ksmbd: fix potential double free on smb2_read_pipe() error path
    a7aae713eaf2 ksmbd: fix Null pointer dereferences in ksmbd_update_fstate()
    943cebf9ea34 ksmbd: fix wrong error response status by using set_smb2_rsp_status()
    7b58ee8d0b91 ksmbd: fix race condition between tree conn lookup and disconnect
    0090f0bfc225 ksmbd: fix race condition from parallel smb2 lock requests
    6584ca894f30 ksmbd: fix race condition from parallel smb2 logoff requests
    b3a843caed29 ksmbd: fix race condition with fp
    7345f5dbf66d ksmbd: check iov vector index in ksmbd_conn_write()
    8beae8a0a065 ksmbd: return invalid parameter error response if smb2 request is invalid
    e523a26c0567 ksmbd: fix passing freed memory 'aux_payload_buf'
    b4b3fd1a95b4 ksmbd: remove unneeded mark_inode_dirty in set_info_sec()
    1ee419e08fa1 ksmbd: remove experimental warning
    83b01f7330d7 ksmbd: add missing calling smb2_set_err_rsp() on error
    422c0cd01693 ksmbd: Fix one kernel-doc comment
    c20105a8975c ksmbd: fix `force create mode' and `force directory mode'
    f8cf1ebb7de6 ksmbd: fix wrong interim response on compound
    9f297df20d93 ksmbd: add support for read compound
    673e60c69124 ksmbd: switch to use kmemdup_nul() helper
    0a9b91f45e88 ksmbd: check if a mount point is crossed during path lookup
    d782f42eed93 ksmbd: Fix unsigned expression compared with zero
    48cc49384048 ksmbd: Replace one-element array with flexible-array member
    63fbfd212c82 ksmbd: Use struct_size() helper in ksmbd_negotiate_smb_dialect()
    e7ab53bd81b0 ksmbd: Replace the ternary conditional operator with min()
    143da652cee8 ksmbd: use kvzalloc instead of kvmalloc
    de43cdaa88c2 ksmbd: Change the return value of ksmbd_vfs_query_maximal_access to void
    deb79f20be21 ksmbd: return a literal instead of 'err' in ksmbd_vfs_kern_path_locked()
    fe7977b872a6 ksmbd: use kzalloc() instead of __GFP_ZERO
    294a275f374b ksmbd: remove unused ksmbd_tree_conn_share function
    b069977b2b47 ksmbd: add mnt_want_write to ksmbd vfs functions
    13a5045011ec ksmbd: fix posix_acls and acls dereferencing possible ERR_PTR()
    1524884c3efb ksmbd: call putname after using the last component
    30a1344198aa ksmbd: fix uninitialized pointer read in smb2_create_link()
    6d4e21e369f3 ksmbd: fix uninitialized pointer read in ksmbd_vfs_rename()
    6927ffe7479c ksmbd: fix racy issue from using ->d_parent and ->d_name
    6e99fbb4296a fs: introduce lock_rename_child() helper
    965eb8650737 ksmbd: remove unused compression negotiate ctx packing
    49d9f6ad1ee0 ksmbd: avoid duplicate negotiate ctx offset increments
    2182d96ec0b7 ksmbd: set NegotiateContextCount once instead of every inc
    8d271ef5e5ca ksmbd: delete asynchronous work from list
    4ef3fd2f85bb ksmbd: remove unused is_char_allowed function
    226aaaa59365 ksmbd: Fix parameter name and comment mismatch
    e8c49f9364c5 ksmbd: Fix spelling mistake "excceed" -> "exceeded"
    ada8bcc48acd ksmbd: update Kconfig to note Kerberos support and fix indentation
    5c0306b0abcd ksmbd: Remove duplicated codes
    b6502c34cf30 ksmbd: fix typo, syncronous->synchronous
    052b41ef2abe ksmbd: Implements sess->rpc_handle_list as xarray
    264547e13f80 ksmbd: Convert to use sysfs_emit()/sysfs_emit_at() APIs
    87ffbb9e24ba ksmbd: Fix resource leak in smb2_lock()
    d847b7588341 ksmbd: use F_SETLK when unlocking a file
    343d667deee1 ksmbd: set SMB2_SESSION_FLAG_ENCRYPT_DATA when enforcing data encryption for this share
    ab69d3e8f7a0 ksmbd: replace one-element arrays with flexible-array members

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b5a2a428407e7f94ef9207dbac9f24dad14c7202)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 3dbec14af8..2d471e3ee3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c7164e4299dfbd93c9ec4f9bd307ebbb88aa6b71"
-SRCREV_meta ?= "4fe5dc52631f3b990aefbb3f97330137c4ebb288"
+SRCREV_machine ?= "6d67557b912380b57b6081da7ac106e9c003f4d1"
+SRCREV_meta ?= "dd140f6b950d56c837dc464af8f2a2a53af24fbf"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.70"
+LINUX_VERSION ?= "6.1.72"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 01641a8462..3314e7b2f1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.70"
+LINUX_VERSION ?= "6.1.72"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "7d183bf1b0b8ded0b2a8a352aa75729a37293b1e"
-SRCREV_meta ?= "4fe5dc52631f3b990aefbb3f97330137c4ebb288"
+SRCREV_machine ?= "d08880e7ec70e70249f80b8305da8e90bd47c606"
+SRCREV_meta ?= "dd140f6b950d56c837dc464af8f2a2a53af24fbf"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index fc7bed9fcd..fd018db6ed 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "b763843c7f0f71c1488daf5d7453656360bfd217"
-SRCREV_machine:qemuarm64 ?= "7d183bf1b0b8ded0b2a8a352aa75729a37293b1e"
-SRCREV_machine:qemuloongarch64 ?= "7d183bf1b0b8ded0b2a8a352aa75729a37293b1e"
-SRCREV_machine:qemumips ?= "f72c516f5594f4eef9c26d380abf60768695c7da"
-SRCREV_machine:qemuppc ?= "7d183bf1b0b8ded0b2a8a352aa75729a37293b1e"
-SRCREV_machine:qemuriscv64 ?= "7d183bf1b0b8ded0b2a8a352aa75729a37293b1e"
-SRCREV_machine:qemuriscv32 ?= "7d183bf1b0b8ded0b2a8a352aa75729a37293b1e"
-SRCREV_machine:qemux86 ?= "7d183bf1b0b8ded0b2a8a352aa75729a37293b1e"
-SRCREV_machine:qemux86-64 ?= "7d183bf1b0b8ded0b2a8a352aa75729a37293b1e"
-SRCREV_machine:qemumips64 ?= "951e24cce7143380de09baa2d1d59062a969d021"
-SRCREV_machine ?= "7d183bf1b0b8ded0b2a8a352aa75729a37293b1e"
-SRCREV_meta ?= "4fe5dc52631f3b990aefbb3f97330137c4ebb288"
+SRCREV_machine:qemuarm ?= "4b6d6ef48b0d11dfdcdc9ae25e1c83be9396a116"
+SRCREV_machine:qemuarm64 ?= "d08880e7ec70e70249f80b8305da8e90bd47c606"
+SRCREV_machine:qemuloongarch64 ?= "d08880e7ec70e70249f80b8305da8e90bd47c606"
+SRCREV_machine:qemumips ?= "8a0e36da16bca1553532936c198c43362be35a82"
+SRCREV_machine:qemuppc ?= "d08880e7ec70e70249f80b8305da8e90bd47c606"
+SRCREV_machine:qemuriscv64 ?= "d08880e7ec70e70249f80b8305da8e90bd47c606"
+SRCREV_machine:qemuriscv32 ?= "d08880e7ec70e70249f80b8305da8e90bd47c606"
+SRCREV_machine:qemux86 ?= "d08880e7ec70e70249f80b8305da8e90bd47c606"
+SRCREV_machine:qemux86-64 ?= "d08880e7ec70e70249f80b8305da8e90bd47c606"
+SRCREV_machine:qemumips64 ?= "3407157586b654c9932356124429ee9dc9f56f18"
+SRCREV_machine ?= "d08880e7ec70e70249f80b8305da8e90bd47c606"
+SRCREV_meta ?= "dd140f6b950d56c837dc464af8f2a2a53af24fbf"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "a507f147e6f06e86b7649b46bc1d3caa34b196d6"
+SRCREV_machine:class-devupstream ?= "7c58bfa711cb556ef1edc48e7dfa6d84e5fb8912"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -45,7 +45,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.70"
+LINUX_VERSION ?= "6.1.72"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


