Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60BB2FC0352
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:32:51 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.405.1776958366535571053
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 08:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bfXe1PsV;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8a3b0242631so83058646d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 08:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776958365; x=1777563165; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iarykYnIAs0KR6izPN39ayOmqFDldICZm2ggxTCIztc=;
        b=bfXe1PsVUswLtJ1G7bUe+YYszgw7toLVXGJNvv9ETDkAMQ4ZXTHWom8bSYbN8wEX/l
         SqBsMspkec2FmFp77Sis/ZU6ypwCkUvqxju/Pu9Pul2WI1imPQDY7D8RNFMek6CmyaKL
         gkXmlReC4MdVpKOIINCOFDKoFZTAbAuYoTLeeLHaX1ZDCEluOyMrOaBYIjcIzrhDVGXi
         cJt7p4mBeQoWOpFJ1MIwx36PqptaboWSienVY1o2Yv8H+LF4rV+OBS1oWcusTCmlTc/h
         bdxaztczVipYVHnwn8nw0eDvnhpFewsHMQaIYQZucHYZSzVz07gKgKAZFnOjuScqlng4
         11xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776958365; x=1777563165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iarykYnIAs0KR6izPN39ayOmqFDldICZm2ggxTCIztc=;
        b=n4IV9Hme7CCLCCWGZ5dA2kNHakNjeSSiamBKh1cn9V53bCx4vsoGla1R2ehcl0SaWI
         R0SE7Z5TfCZFqBlDqQHjx1Sw9LUUdmKBJ03oQsn5JPpCS+yBkCqEv5YHAqcPGWR/YNnm
         SKNLCiFGJzc5NJSDOq4zGvbYKFcmshFeq7IlzjWaCziAGZleRdPZ2SIwF6PIoFmWqwo1
         mPSegTqsmI1+Dh/eQe4zS07pFv5PdwiM1fK+lJ200yi1ah5muGpSMIUUkie1VDe5KiGV
         8HkZ+jVA0wJ3wYvsTOl0ZZBuYIJnfXMQYkMMmg4ulIvfHD1Bqfbs19plIB9boDOuq288
         mCoA==
X-Gm-Message-State: AOJu0YyxdCwSKy1EmxDly7yKfWfzgETd3jc8t6QGoAaPFcxtLoTfQqe1
	nX2GRGTw+YRxDtix/+KMjFjzjIP5degwJrZ5Pjqr9458sqkCq1MijLpeGqrvT9O5
X-Gm-Gg: AeBDievBx342x7e0Z6v/rRSI+6e04EsGcHspJGmx7SGmJ51Nnv2q8Q7S7aeV9iJpbD8
	WrD3vl91aK37Fpzjgc6lFOLaOnbrJxzTNt8NhVjfB4x+uqzmP76nVRVULhF17WHbgccF+GXoaQd
	JKAf5Cb0ndkZDNQod2W+P+mlpCIk3oRzKMx/R8o+f4ovD1McUrkVWjcg0OzeJ29DmNNsGedF5Gr
	m16q0tirA6orW1097/VUcYT8YdCimyZah6WjG4nOoiIrhyMvrkMeSbB+pEU2YbtWDGwb+2dOZfX
	02Qn6xttnf2twQO/MynalfztjGZl7TOVMu37HDYHWM5KLhf1VJRkcARoMcA5KCFRehaxwDpGHcS
	3S32IudSs48AXIB52T8peGZPpyXOLKWfsktYCZIYT1UktlP13LcunGTZ5dnp1vZ36vembCQc00p
	2Xcgg0O9VuaFE30pUs+lz44aqyiS73jg7mk4NxBm+0w7Z/MFggO0ijVD8WLxtVB0dKaUoU/Hycq
	qDQa84abtSrloAw1oIcvLobeKTzzziD0C38N6EHVv+mUd5UdkWVbpu494ZLmzfQIvpepQ==
X-Received: by 2002:a05:6214:76c:b0:8b1:f297:a54b with SMTP id 6a1803df08f44-8b1f297a61bmr206213616d6.18.1776958365337;
        Thu, 23 Apr 2026 08:32:45 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac429ffsm160765996d6.2.2026.04.23.08.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:32:44 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta-yocto-bsp][PATCH 15/15] yocto-bsps: update to v6.18.24
Date: Thu, 23 Apr 2026 11:32:22 -0400
Message-ID: <20260423153222.1932256-16-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423153222.1932256-1-bruce.ashfield@gmail.com>
References: <20260423153222.1932256-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 15:32:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235790

From: Bruce Ashfield <bruce.ashfield@gmail.com>

    c0d886e4af57 Linux 6.18.24
    ff628171d5f4 dma-mapping: handle DMA_ATTR_CPU_CACHE_CLEAN in trace output
    c2d109c982e9 dma-debug: Allow multiple invocations of overlapping entries
    574501ede47a mm/userfaultfd: fix hugetlb fault mutex hash calculation
    07e9e674b614 media: hackrf: fix to not free memory after the device is registered in hackrf_probe()
    6d75a9ec5bdb media: vidtv: fix pass-by-value structs causing MSAN warnings
    c36e206f302f nilfs2: fix NULL i_assoc_inode dereference in nilfs_mdt_save_to_shadow_map
    09e9206008b8 media: as102: fix to not free memory after the device is registered in as102_usb_probe()
    9a9e69155b20 wireguard: device: use exit_rtnl callback instead of manual rtnl_lock in pre_exit
    2d6965581e16 bcache: fix cached_dev.sb_bio use-after-free and crash
    d21e8a2af486 ALSA: 6fire: fix use-after-free on disconnect
    9e1b798257f9 hwmon: (powerz) Fix use-after-free on USB disconnect
    871b8ea8ef39 media: em28xx: fix use-after-free in em28xx_v4l2_open()
    f99353cd0e9f media: mediatek: vcodec: fix use-after-free in encoder release path
    25f19e476ab1 media: vidtv: fix nfeeds state corruption on start_streaming failure
    ea3af09eb87d mm: blk-cgroup: fix use-after-free in cgwb_release_workfn()
    f6204f7ff6af mm/kasan: fix double free for kasan pXds
    30383b7780ff ASoC: qcom: q6apm: move component registration to unmanaged version
    22d2ff69d487 KVM: x86: Use scratch field in MMIO fragment to hold small write values
    576d365f31d9 x86-64/arm64/powerpc: clean up and rename __copy_from_user_flushcache
    03fd014cd9f3 x86: rename and clean up __copy_from_user_inatomic_nocache()
    c6d4e0599e7e x86-64: rename misleadingly named '__copy_user_nocache()' function
    8e7666acfabb checkpatch: add support for Assisted-by tag
    0c1af902223b ocfs2: fix out-of-bounds write in ocfs2_write_end_inline
    cd2d765aa715 ocfs2: validate inline data i_size during inode read
    df030a9374a5 ocfs2: add inline inode consistency check to ocfs2_validate_inode_block()
    0ed88ac9bc64 KVM: x86: Use __DECLARE_FLEX_ARRAY() for UAPI structures with VLAs
    df61c2c99c7f KVM: Remove subtle "struct kvm_stats_desc" pseudo-overlay
    9309daac5034 selftests/bpf: Test refinement of single-value tnum
    28cc13ca2043 KVM: SEV: Drop WARN on large size for KVM_MEMORY_ENCRYPT_REG_REGION
    30fd9d8c8208 KVM: SEV: Lock all vCPUs when synchronzing VMSAs for SNP launch finish
    2c59132c4786 KVM: SEV: Disallow LAUNCH_FINISH if vCPUs are actively being created
    35a0963d361f KVM: SEV: Protect *all* of sev_mem_enc_register_region() with kvm->lock
    692fdf05e55f KVM: SEV: Reject attempts to sync VMSA of an already-launched/encrypted vCPU
    5d57a1ee587c KVM: selftests: Remove duplicate LAUNCH_UPDATE_VMSA call in SEV-ES migrate test
    cec9ead73ab1 PCI: endpoint: pci-epf-vntb: Remove duplicate resource teardown
    9921cce25bfe PCI: endpoint: pci-epf-vntb: Stop cmd_handler work in epf_ntb_epc_cleanup
    e384a850a337 ocfs2: handle invalid dinode in ocfs2_group_extend
    d45ff441b416 ocfs2: fix use-after-free in ocfs2_fault() when VM_FAULT_RETRY
    bc0fb5c7d54c ocfs2: fix possible deadlock between unlink and dio_end_io_write
    2dff11fb5098 media: vidtv: fix NULL pointer dereference in vidtv_channel_pmt_match_sections
    8140b21d1901 arm64: mm: Handle invalid large leaf mappings correctly
    755b40903eff dcache: Limit the minimal number of bucket to two
    3fd0685d7fef ALSA: ctxfi: Limit PTP to a single page
    de5c3e67037f Docs/admin-guide/mm/damon/reclaim: warn commit_inputs vs param updates race
    4c971d577a9f USB: serial: option: add Telit Cinterion FN990A MBIM composition
    1412ba36597a staging: sm750fb: fix division by zero in ps_to_hz()
    89a9c1bc7d79 wifi: rtw88: fix device leak on probe failure
    9c401606e2d0 scripts: generate_rust_analyzer.py: avoid FD leak
    6de048d78f30 fbdev: udlfb: avoid divide-by-zero on FBIOPUT_VSCREENINFO
    5d02df1b130b usb: port: add delay after usb_hub_set_port_power()
    eb6ef6185f20 usb: gadget: f_hid: don't call cdev_init while cdev in use
    5d29d7ff8679 USB: cdc-acm: Add quirks for Yoga Book 9 14IAH10 INGENIC touchscreen
    63dc7cdb1f4e usb: storage: Expand range of matched versions for VL817 quirks entry
    9aef3f979190 usb: typec: fusb302: Switch to threaded IRQ handler
    906f16a836de usbip: validate number_of_packets in usbip_pack_ret_submit()
    6968c91fab05 smb: server: avoid double-free in smb_direct_free_sendmsg after smb_direct_flush_send_list()
    a9940dcbe5cb smb: client: avoid double-free in smbd_free_send_io() after smbd_send_batch_flush()
    dd53414e301b ksmbd: fix mechToken leak when SPNEGO decode fails after token alloc
    d2454f4a002d ksmbd: require 3 sub-authorities before reading sub_auth[2]
    3363a770b193 ksmbd: validate EaNameLength in smb2_get_ea()
    e0dd90d14cbb smb: client: fix OOB reads parsing symlink error response
    b2b76d09a64c smb: client: fix off-by-8 bounds check in check_wsl_eas()
    44216e3dd445 usb: gadget: renesas_usb3: validate endpoint index in standard request handlers
    4e476c25bfca usb: gadget: f_phonet: fix skb frags[] overflow in pn_rx_complete()
    6762f8a95772 usb: gadget: f_ncm: validate minimum block_len in ncm_unwrap_ntb()
    fc386daa6846 fbdev: tdfxfb: avoid divide-by-zero on FBIOPUT_VSCREENINFO
    67cfd14074cd ALSA: fireworks: bound device-supplied status before string array lookup
    09b145c1f133 ALSA: usx2y: us144mkii: fix NULL deref on missing interface 0
    0185e0494a56 drm/vc4: platform_get_irq_byname() returns an int
    5a59bf70c38e NFC: digital: Bounds check NFC-A cascade depth in SDD response handler
    c183d5775129 net: usb: cdc-phonet: fix skb frags[] overflow in rx_complete()
    8a8333237f1f HID: core: clamp report_size in s32ton() to avoid undefined shift
    0091dfa542a3 HID: alps: fix NULL pointer dereference in alps_raw_event()
    b487a7754d87 staging: rtl8723bs: initialize le_tmp64 in rtw_BIP_verify()
    377fae22a137 i2c: s3c24xx: check the size of the SMBUS message before using it
    1a0f2de81f7f can: raw: fix ro->uniq use-after-free in raw_rcv()
    8977fad2b3c6 nfc: llcp: add missing return after LLCP_CLOSED checks
    67c53c1978ce netfilter: conntrack: add missing netlink policy validations
    78cea133daf7 crypto: algif_aead - Fix minimum RX size check for decryption
    dea5fcf085f9 crypto: af_alg - Fix page reassignment overflow in af_alg_pull_tsgl
    66dfc9179b78 sched/deadline: Use revised wakeup rule for dl_server
    f34feda8e0c9 perf/x86/intel/uncore: Skip discovery table for offline dies
    07c6f6ffe290 crypto: af_alg - limit RX SG extraction by receive buffer budget
    7af379af9d34 gpio: tegra: fix irq_release_resources calling enable instead of disable
    86534c97abd6 l2tp: Drop large packets with UDP encap
    2d2dc166d551 net: ipa: fix event ring index not programmed for IPA v5.0+
    bafc45ea30d2 net: ipa: fix GENERIC_CMD register field masks for IPA v5.0+
    a31b3ee4dba0 devlink: Fix incorrect skb socket family dumping
    900a4e0910e9 af_unix: read UNIX_DIAG_VFS data under unix_state_lock
    8eff73e58e1f net: txgbe: leave space for null terminators on property_entry
    6d1d9ed9b409 net: ioam6: fix OOB and missing lock
    607b86397622 net: mdio: realtek-rtl9300: use scoped device_for_each_child_node loop
    8c3984a0872c ASoC: amd: acp: update DMI quirk and add ACP DMIC for Lenovo platforms
    c877bc8058a9 ASoC: SDCA: Fix overwritten var within for loop
    41e3652a178c netfilter: nfnetlink_queue: make hash table per queue
    06e054ace8b8 netfilter: nfnetlink_queue: nfqnl_instance GFP_ATOMIC -> GFP_KERNEL_ACCOUNT allocation
    807d6ee15804 netfilter: ip6t_eui64: reject invalid MAC header for all packets
    8368ce8eb01f netfilter: xt_multiport: validate range encoding in checkentry
    d552bcfca323 netfilter: nfnetlink_log: initialize nfgenmsg in NLMSG_DONE terminator
    a32dabacee11 ipvs: fix NULL deref in ip_vs_add_service error path
    585fe11fedb8 selftests: net: bridge_vlan_mcast: wait for h1 before querier check
    8083b7da229b drm/xe: Fix bug in idledly unit conversion
    a4532ec7b885 ASoC: Intel: avs: Fix memory leak in avs_register_i2s_test_boards()
    f779a6b6cdb6 xfrm_user: fix info leak in build_mapping()
    836ee1b0426e xfrm: fix refcount leak in xfrm_migrate_policy_find
    3733fce2871c xfrm: Wait for RCU readers during policy netns exit
    25e1e91a8da8 xsk: validate MTU against usable frame size on bind
    4947e2ae9c57 xsk: fix XDP_UMEM_SG_FLAG issues
    29a68f4baaf9 xsk: respect tailroom for ZC setups
    9ea6ba4f3195 xsk: tighten UMEM headroom validation to account for tailroom and min frame
    70b85c177344 e1000: check return value of e1000_read_eeprom
    4db7b61ec1d1 ixgbevf: add missing negotiate_features op to Hyper-V ops table
    4da3465a7f00 ixgbe: stop re-reading flash on every get_drvinfo for e610
    e19675b384e9 ice: ptp: don't WARN when controlling PF is unavailable
    7dad8bf14346 tracing/probe: reject non-closed empty immediate strings
    9550d1d9f716 dt-bindings: net: Fix Tegra234 MGBE PTP clock
    b6b9c17ef8ae net: stmmac: Fix PTP ref clock for Tegra234
    6d931680a985 nfc: s3fwrn5: allocate rx skb before consuming bytes
    4d90f9a271a6 net: increase IP_TUNNEL_RECURSION_LIMIT to 5
    f91b3ed9e7fa ipv4: icmp: fix null-ptr-deref in icmp_build_probe()
    40bd39e383a0 ipv4: nexthop: allocate skb dynamically in rtm_get_nexthop()
    69aa3c713980 ipv4: nexthop: avoid duplicate NHA_HW_STATS_ENABLE on nexthop group dump
    0975b64ffb34 rtnetlink: add missing netlink_ns_capable() check for peer netns
    fb612d436ff0 bridge: guard local VLAN-0 FDB helpers against NULL vlan group
    4198aab6f000 ipv6: ioam: fix potential NULL dereferences in __ioam6_fill_trace_data()
    4429b761874f net: airoha: Fix memory leak in airoha_qdma_rx_process()
    63851f60781a net: lapbether: handle NETDEV_PRE_TYPE_CHANGE
    ec4930979b3f net: sched: act_csum: validate nested VLAN headers
    7e8083f5eeed eventpoll: defer struct eventpoll free to RCU grace period
    0cf8ea9d677b drm/vc4: Protect madv read in vc4_gem_object_mmap() with madv_lock
    e352e9adc9f6 drm/vc4: Fix a memory leak in hang state error path
    421cea4f71f7 drm/vc4: Fix memory leak of BO array in hang state
    ce12a1af6779 drm/vc4: Release runtime PM reference after binding V3D
    9a945edeabb5 dma-debug: suppress cacheline overlap warning when arch has no DMA alignment requirement
    ad187e0506ab dma-debug: track cache clean flag in entries
    4e8a1b970168 dma-mapping: add DMA_ATTR_CPU_CACHE_CLEAN
    e62e322ea20b xfrm: account XFRMA_IF_ID in aevent size calculation
    73e3e4dac102 HID: amd_sfh: don't log error when device discovery fails with -EOPNOTSUPP
    0d364d863c70 PCI: hv: Set default NUMA node to 0 for devices without affinity info
    e4093997420f ARM: dts: microchip: sam9x7: fix gpio-lines count for pioB
    edde62571f76 arm64: dts: qcom: monaco: Reserve full Gunyah metadata region
    d0deac48e57a tools/power turbostat: Fix --show/--hide for individual cpuidle counters
    fbc581977db2 tools/power/turbostat: Fix microcode patch level output for AMD/Hygon
    7d75145672cf soc: qcom: pd-mapper: Fix element length in servreg_loc_pfr_req_ei
    52632daf6425 arm64: dts: qcom: monaco: Fix UART10 pinconf
    95894966bce9 arm64: dts: imx93-tqma9352: improve eMMC pad configuration
    b3b725b902b3 arm64: dts: imx91-tqma9131: improve eMMC pad configuration
    737a4ee014e1 arm64: dts: imx93-9x9-qsb: change usdhc tuning step for eMMC and SD
    d0fcd4858918 arm64: dts: imx8mq: Set the correct gpu_ahb clock frequency
    ecbc5e9277da arm64: dts: qcom: qcm6490-idp: Fix WCD9370 reset GPIO polarity
    878ccc18d94c arm64: dts: qcom: hamoa/x1: fix idle exit latency
    c448aad9a779 soc: aspeed: socinfo: Mask table entries for accurate SoC ID matching
    d2c7153fe0ca ASoC: stm32_sai: fix incorrect BCLK polarity for DSP_A/B, LEFT_J
    c64cebcc5c4f x86: shadow stacks: proper error handling for mmap lock
    0a59c12ce50a net: sfp: add quirks for Hisense and HSGQ GPON ONT SFP modules
    1ae1e1caa428 wifi: brcmfmac: validate bsscfg indices in IF events
    f5a5d0e8704e ata: ahci: force 32-bit DMA for JMicron JMB582/JMB585
    36bb2d0b9150 HID: roccat: fix use-after-free in roccat_report_event
    0fa5713ac7a1 ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7 14IAH10
    42032a75da03 HID: quirks: add HID_QUIRK_ALWAYS_POLL for 8BitDo Pro 3
    c2854af5774b HID: Intel-thc-hid: Intel-quickspi: Add NVL Device IDs
    0f2e312626c7 platform/x86/amd: pmc: Add Thinkpad L14 Gen3 to quirk_s2idle_bug
    91f915d57416 pinctrl: intel: Fix the revision for new features (1kOhm PD, HW debouncer)
    b98ecc1c60ad ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7 14IMH9
    1d788e6a4150 ASoC: amd: yc: Add DMI entry for HP Laptop 15-fc0xxx
    86f9c23e0814 fs/smb/client: fix out-of-bounds read in cifs_sanitize_prepath
    647fb0dc3818 drm/amdkfd: Fix queue preemption/eviction failures by aligning control stack size to GPU page size
    fceb2a469121 ALSA: hda/realtek: Add quirk for Lenovo Yoga Slim 7 14AKP10
    66b315279b88 ALSA: usb-audio: Fix quirk flags for NeuralDSP Quad Cortex
    f664b56d8fc3 ALSA: hda/realtek: Add quirk for Samsung Book2 Pro 360 (NP950QED)
    a9d32e6c8a55 ASoC: soc-core: call missing INIT_LIST_HEAD() for card_aux_list
    8d7465be5163 wifi: wl1251: validate packet IDs before indexing tx_frames
    21a1acf6b16a ALSA: hda/realtek: add quirk for Framework F111:000F
    07de44424bb7 netfilter: nft_set_pipapo_avx2: don't return non-matching entry on expiry
    7556bd5cd8ef ALSA: hda/realtek: add HP Laptop 15-fd0xxx mute LED quirk
    6a9f2683c66d drm/amdgpu: Handle GPU page faults correctly on non-4K page systems
    f338ced04738 netfilter: ctnetlink: ensure safe access to master conntrack
    8db3663d3c3e ALSA: hda/realtek: Add mute LED quirk for HP Pavilion 15-eg0xxx
    2e4adfaec97e btrfs: tracepoints: get correct superblock from dentry in event btrfs_sync_file()
    d4ff92dd98ad platform/x86: hp-wmi: Add support for Omen 16-wf1xxx (8C76)
    fddb157536e6 btrfs: fix zero size inode with non-zero size after log replay
    c66a0e9a19c0 platform/x86: asus-nb-wmi: add DMI quirk for ASUS ROG Flow Z13-KJP GZ302EAC
    c2be593c7ec2 ALSA:usb:qcom: add AUXILIARY_BUS to Kconfig dependencies
    5486d20a0818 ASoC: amd: acp: add ASUS HN7306EA quirk for legacy SDW machine
    c306ac170bc3 can: mcp251x: add error handling for power enable in open and resume
    550243229155 ASoC: SOF: topology: reject invalid vendor array size in token parser
    36d706d03346 ASoC: amd: yc: Add DMI quirk for Thin A15 B7VF
    a7a1cdb4a64c Bluetooth: hci_sync: annotate data-races around hdev->req_status
    02ce2a77acc8 ALSA: asihpi: avoid write overflow check warning
    222f4fd0fe06 media: rkvdec: reduce stack usage in rkvdec_init_v4l2_vp9_count_tbl()
    fc40821d94b9 ALSA: hda/realtek: Add quirk for ASUS ROG Flow Z13-KJP GZ302EAC
    e656ef8698e2 ALSA: hda/realtek: add quirk for Lenovo Yoga 7 2-in-1 16AKP10
    b395549928e5 ALSA: hda/realtek: Add HP ENVY Laptop 13-ba0xxx quirk
    4b59719db211 ASoC: amd: yc: Add DMI quirk for ASUS EXPERTBOOK BM1403CDA
    0f22c32141ac RDMA/irdma: Fix double free related to rereg_user_mr
    0aa0c509aa69 dmaengine: idxd: Fix lockdep warnings when calling idxd_device_config()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
index b1d265a..1a80c65 100644
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
@@ -8,4 +8,4 @@ KMACHINE:genericx86 ?= "common-pc"
 KMACHINE:genericx86-64 ?= "common-pc-64"
 
 KBRANCH:genericarm64 ?= "v6.18/standard/genericarm64"
-SRCREV_machine:genericarm64 ?= "3875f920c45a973fa027f39c77c2904ac8ba1042"
+SRCREV_machine:genericarm64 ?= "b37320d600b3206435a10fa3c3d9fe9a574256b2"
-- 
2.43.0


