Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05100FC037B
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:45:44 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.770.1776959138492049193
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 08:45:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PGMXk3Br;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-50e5dbd8e0eso43373471cf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 08:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776959137; x=1777563937; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMxLOiAYJSvQSsGSvuiJjs9c4ZA+NqZRFeoY6kOUIrI=;
        b=PGMXk3Brcgj8RmTIgmau7yZe8fRdLScOjDm0pUmdRjfkrLv2wlWhY1+U1JUYqU6X2S
         aqpR9U22PnsoONnTq3mIW93F180QUVk3DyQCMmH5GdPEwok1m/kWFd3y0bkXF7yU2D1j
         fmhgeMmVPVsBW+JQa8H/7GtvxGDYYeDUQ3TE5mbLtCeEjEAAfgoHvGMhCLFbQ/TQ7i4V
         SOO+aP6zUEMBj+AHw6dBspChwNAkFOTUs5VA5BET4nKrqP8xqa23GnNCX1lcVQ9YC/Xh
         7EYBbZrvU6e8pOqXxn4Ig2X/qfuLHvxsB2k09WYNQwu+1Of5zOkaiX6CnU+ETlUqdy6c
         J60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776959137; x=1777563937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mMxLOiAYJSvQSsGSvuiJjs9c4ZA+NqZRFeoY6kOUIrI=;
        b=OgKIQ/8Q8et8vtn4AEkKCg3GFgVE7Oi176trclCZW1y5rGTqPhLYFXp02ZSfDL4W8O
         hpArE6E+R3KD59q/s2iFLwL0cRUm0gOVQGXax/jDS7HEYhUF60emmH0WPHspRKM6x5FG
         MEwZll4bWMOT2t3IElKPexh58dZ04+id8E8Gi+j475DD+z1O7JulQskXo6HaSgATRWYQ
         e1E+Nn1+3wTDM6YJO5ljNOHi6b3BuAM42oxDz3BUgn2AG2iPSCZl/0VJttwjEcDXfTna
         Q4cKfqr+HjA092N7NxoR81CcjJ+LLt9H+nPypOxHnKMJkPeLy8MnZYSAff8eE0nnRX3K
         onwg==
X-Gm-Message-State: AOJu0YyfU8O1CUB487NIxt/I7yf5goFFlszLDNmFgCf7F/si56M7RirY
	3FmYf7KwM9KkY5gkc4gIV7GyU5rtYv1eP2m0zDH8R2ciaQZb8W6m5DprBkJZSduT
X-Gm-Gg: AeBDietFAZIaVqGjsoNhEfWsyngfBTIo9005Ls4/qZYcdLFWkBOEmC4nonAOvIZJBpL
	EHRCCSG3bIPzkZcsZWPGJXMdrY99HIcgoOygUJnDXCsLEgC0+wi0e0nUkl7emMVAi81AsxvwyeB
	Np7pKnhlRL7iLLYtJA3/snyU/tZb9uslr+B+HxzA9o00I16zO4WdKWOZe5HVjr07VNg+oOwWXmd
	ixKa5PnUWiYpSGEr3GHsT5wyEoE4Jd4lAGnOvVaZX6k+56rO2lwf8WgJIOKkqUGKtqDS7L64GMi
	kYSlMZe1nht3QexvKEreGvn2c+3ziousV6+wH6Nxx8oKPJGknhEstvebeg8kKxl8vE83F9sdX/G
	wn1xxaHlT7NVUc8jmm3In2+x406SJa/oRKRhuDyZP/LIK5sj+Q9tcS0X0R2kQfMoqltTTrXlmUs
	EG51vgSGqvGJsA6zcydRyIO5xTsEDe3fgCvROY/CmHvUULuL4K0WCtxMZRiKULQ6unQAdzG7Jg6
	18E4Zlmrodhyj1uu9gdYqphsp0UNMy61g2x9E2rJ6LKqhRAs8h7AL7JH/PzWqniBZlddA==
X-Received: by 2002:a05:622a:4207:b0:50d:3e1e:7998 with SMTP id d75a77b69052e-50e36c13c89mr431720821cf.37.1776959137190;
        Thu, 23 Apr 2026 08:45:37 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50fb416b3f5sm74400031cf.28.2026.04.23.08.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:45:36 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
Subject: [openembedded-core][whinlatter][PATCH 17/18] linux-yocto/6.12: update to v6.12.83
Date: Thu, 23 Apr 2026 11:45:08 -0400
Message-ID: <20260423154509.1933646-18-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423154509.1933646-1-bruce.ashfield@gmail.com>
References: <20260423154509.1933646-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 15:45:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235816

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    eefc95626b5c Linux 6.12.83
    817daf163312 PCI: Revert "Enable ACS after configuring IOMMU for OF platforms"
    bc9843c39f99 ipv6: add NULL checks for idev in SRv6 paths
    f8f55a226aab PCI: Fix placement of pci_save_state() in pci_bus_add_device()
    29f05b91d8da rxrpc: Fix key quota calculation for multitoken keys
    947f953978b0 ocfs2: fix out-of-bounds write in ocfs2_write_end_inline
    c1de19e891be ocfs2: validate inline data i_size during inode read
    fad0e70f4ace ocfs2: add inline inode consistency check to ocfs2_validate_inode_block()
    98a0a81ce780 media: hackrf: fix to not free memory after the device is registered in hackrf_probe()
    be57e52e27c7 media: vidtv: fix pass-by-value structs causing MSAN warnings
    449ec5fc99f4 nilfs2: fix NULL i_assoc_inode dereference in nilfs_mdt_save_to_shadow_map
    582fbecb3756 media: as102: fix to not free memory after the device is registered in as102_usb_probe()
    add4982510f3 bcache: fix cached_dev.sb_bio use-after-free and crash
    af75b486f7e8 ALSA: 6fire: fix use-after-free on disconnect
    c78e1d4e48f2 hwmon: (powerz) Fix use-after-free on USB disconnect
    5fb294032772 media: em28xx: fix use-after-free in em28xx_v4l2_open()
    a8a55913552a media: mediatek: vcodec: fix use-after-free in encoder release path
    98c22210aead media: vidtv: fix nfeeds state corruption on start_streaming failure
    dfc8292a1d67 mm: blk-cgroup: fix use-after-free in cgwb_release_workfn()
    a05f77cb227c mm/kasan: fix double free for kasan pXds
    b7412ed789ff ASoC: qcom: q6apm: move component registration to unmanaged version
    b5a02d37eb07 KVM: x86: Use scratch field in MMIO fragment to hold small write values
    b1e13fdc27ca x86-64/arm64/powerpc: clean up and rename __copy_from_user_flushcache
    f5945c8904e5 x86: rename and clean up __copy_from_user_inatomic_nocache()
    14b9194db4a2 x86-64: rename misleadingly named '__copy_user_nocache()' function
    e46a2cbd942c checkpatch: add support for Assisted-by tag
    300fb45afa7c KVM: x86: Use __DECLARE_FLEX_ARRAY() for UAPI structures with VLAs
    b46ef44fe927 KVM: Remove subtle "struct kvm_stats_desc" pseudo-overlay
    74c2471eb891 kernel: be more careful about dup_mmap() failures and uprobe registering
    af2648ee5847 net: sched: fix TCF_LAYER_TRANSPORT handling in tcf_get_base_ptr()
    1ef731547dfd gpiolib: fix race condition for gdev->srcu
    3dc1f48c42f2 gpiolib: unify two loops initializing GPIO descriptors
    ab423e589282 KVM: SEV: Drop WARN on large size for KVM_MEMORY_ENCRYPT_REG_REGION
    d93f7c00d884 KVM: SEV: Disallow LAUNCH_FINISH if vCPUs are actively being created
    c9609847ae65 KVM: SEV: Reject attempts to sync VMSA of an already-launched/encrypted vCPU
    6773cc24c004 PCI: endpoint: pci-epf-vntb: Stop cmd_handler work in epf_ntb_epc_cleanup
    911b557dd781 ocfs2: handle invalid dinode in ocfs2_group_extend
    4cf2768a0291 ocfs2: fix use-after-free in ocfs2_fault() when VM_FAULT_RETRY
    2b884d52273c ocfs2: fix possible deadlock between unlink and dio_end_io_write
    e589de36da10 media: vidtv: fix NULL pointer dereference in vidtv_channel_pmt_match_sections
    ddd57ebce245 dcache: Limit the minimal number of bucket to two
    365c36e1a126 ALSA: ctxfi: Limit PTP to a single page
    3be0d8895704 Docs/admin-guide/mm/damon/reclaim: warn commit_inputs vs param updates race
    6e921c599161 USB: serial: option: add Telit Cinterion FN990A MBIM composition
    2f640c6043ae staging: sm750fb: fix division by zero in ps_to_hz()
    a4f4371d194d wifi: rtw88: fix device leak on probe failure
    4b762046b1bd scripts: generate_rust_analyzer.py: avoid FD leak
    03797cdee38e fbdev: udlfb: avoid divide-by-zero on FBIOPUT_VSCREENINFO
    ad279de5d6f1 usb: port: add delay after usb_hub_set_port_power()
    c6c0d13db5d0 usb: gadget: f_hid: don't call cdev_init while cdev in use
    603d5a711083 USB: cdc-acm: Add quirks for Yoga Book 9 14IAH10 INGENIC touchscreen
    57662bd432f3 usb: storage: Expand range of matched versions for VL817 quirks entry
    8d155e2d1c41 usbip: validate number_of_packets in usbip_pack_ret_submit()
    dd577cb55588 ksmbd: fix mechToken leak when SPNEGO decode fails after token alloc
    08f9e6d899b5 ksmbd: require 3 sub-authorities before reading sub_auth[2]
    551dfb15b182 ksmbd: validate EaNameLength in smb2_get_ea()
    5cc0574c84aa smb: client: fix off-by-8 bounds check in check_wsl_eas()
    adb8014599fd usb: gadget: renesas_usb3: validate endpoint index in standard request handlers
    c9315ce9da36 usb: gadget: f_phonet: fix skb frags[] overflow in pn_rx_complete()
    8757a2593631 usb: gadget: f_ncm: validate minimum block_len in ncm_unwrap_ntb()
    53cb4e79a071 fbdev: tdfxfb: avoid divide-by-zero on FBIOPUT_VSCREENINFO
    e103f98f6615 ALSA: fireworks: bound device-supplied status before string array lookup
    ef2ee9db13b6 drm/vc4: platform_get_irq_byname() returns an int
    1bec5698b55a NFC: digital: Bounds check NFC-A cascade depth in SDD response handler
    a23b1b1aaf41 net: usb: cdc-phonet: fix skb frags[] overflow in rx_complete()
    58386f00af71 HID: core: clamp report_size in s32ton() to avoid undefined shift
    8eed7bce7a4c HID: alps: fix NULL pointer dereference in alps_raw_event()
    d5b8f5f8d6fc staging: rtl8723bs: initialize le_tmp64 in rtw_BIP_verify()
    d87d5620125a i2c: s3c24xx: check the size of the SMBUS message before using it
    572f0bf536eb can: raw: fix ro->uniq use-after-free in raw_rcv()
    796e0cac0582 nfc: llcp: add missing return after LLCP_CLOSED checks
    b448529f2f29 idpf: fix PREEMPT_RT raw/bh spinlock nesting for async VC handling
    09e17780dc0c ALSA: usb-audio: Improve Focusrite sample rate filtering
    1a6d2b001eb7 thermal: core: Address thermal zone removal races with resume
    ac72b577dadb thermal: core: Mark thermal zones as exiting before unregistration
    5d40cb3ba31b Revert "drm/xe: Switch MMIO interface to take xe_mmio instead of xe_gt"
    94a14a68ad31 Revert "drm/xe/mmio: Avoid double-adjust in 64-bit reads"
    9174d28f3f15 netfilter: conntrack: add missing netlink policy validations
    af2fa2fbbced crypto: algif_aead - Fix minimum RX size check for decryption
    d66792919d4f sched/deadline: Use revised wakeup rule for dl_server
    6cfc187d85f1 perf/x86/intel/uncore: Skip discovery table for offline dies
    9bf3e6ccfdcf crypto: af_alg - limit RX SG extraction by receive buffer budget
    4ee7dcd76ce9 gpio: tegra: fix irq_release_resources calling enable instead of disable
    77c1489398c8 l2tp: Drop large packets with UDP encap
    2bf18b643c46 net: ipa: fix event ring index not programmed for IPA v5.0+
    d1c66396796f net: ipa: fix GENERIC_CMD register field masks for IPA v5.0+
    0c739f3785f8 af_unix: read UNIX_DIAG_VFS data under unix_state_lock
    16eb3c2f86de net: txgbe: leave space for null terminators on property_entry
    22730cb96093 netfilter: nfnetlink_queue: make hash table per queue
    7bc3f58c452f netfilter: nfnetlink_queue: nfqnl_instance GFP_ATOMIC -> GFP_KERNEL_ACCOUNT allocation
    9eda5478746e netfilter: ip6t_eui64: reject invalid MAC header for all packets
    aec14808271f netfilter: xt_multiport: validate range encoding in checkentry
    d1399632ba25 netfilter: nfnetlink_log: initialize nfgenmsg in NLMSG_DONE terminator
    403995931500 ipvs: fix NULL deref in ip_vs_add_service error path
    c2275ac1a9a3 selftests: net: bridge_vlan_mcast: wait for h1 before querier check
    5a1a4b049ddd xfrm_user: fix info leak in build_mapping()
    21e235a36cfb xfrm: fix refcount leak in xfrm_migrate_policy_find
    438b1f668ad5 xfrm: Wait for RCU readers during policy netns exit
    f669d60db11d xsk: validate MTU against usable frame size on bind
    b412b5e33943 xsk: fix XDP_UMEM_SG_FLAG issues
    a4ee85f55a2d xsk: respect tailroom for ZC setups
    0ec4d3f6e693 xsk: tighten UMEM headroom validation to account for tailroom and min frame
    dc230df28471 e1000: check return value of e1000_read_eeprom
    2270ebab5312 ixgbevf: add missing negotiate_features op to Hyper-V ops table
    83f2daf5297b tracing/probe: reject non-closed empty immediate strings
    96f8efe50464 dt-bindings: net: Fix Tegra234 MGBE PTP clock
    9a3351cf1b2c net: stmmac: Fix PTP ref clock for Tegra234
    7c31f7a599cf nfc: s3fwrn5: allocate rx skb before consuming bytes
    be638321b0da net: increase IP_TUNNEL_RECURSION_LIMIT to 5
    6be325206850 ipv4: icmp: fix null-ptr-deref in icmp_build_probe()
    615517f3f8d5 ipv4: nexthop: allocate skb dynamically in rtm_get_nexthop()
    e20b85bfbed8 ipv4: nexthop: avoid duplicate NHA_HW_STATS_ENABLE on nexthop group dump
    328bb2cff5c2 net: lapbether: handle NETDEV_PRE_TYPE_CHANGE
    a69738efea09 net: sched: act_csum: validate nested VLAN headers
    5b1173b16542 eventpoll: defer struct eventpoll free to RCU grace period
    0768598cf753 drm/vc4: Protect madv read in vc4_gem_object_mmap() with madv_lock
    d8fdd6adc07b drm/vc4: Fix a memory leak in hang state error path
    0d3c014a8439 drm/vc4: Fix memory leak of BO array in hang state
    44361a76b151 drm/vc4: Release runtime PM reference after binding V3D
    2c41283d94af xfrm: account XFRMA_IF_ID in aevent size calculation
    c5c13f1a6dc4 HID: amd_sfh: don't log error when device discovery fails with -EOPNOTSUPP
    5fde03df639d PCI: hv: Set default NUMA node to 0 for devices without affinity info
    29af688c457a tools/power/turbostat: Fix microcode patch level output for AMD/Hygon
    c93ca7c5a72e soc: qcom: pd-mapper: Fix element length in servreg_loc_pfr_req_ei
    2d3248fe5663 arm64: dts: imx93-tqma9352: improve eMMC pad configuration
    7a5082db69e6 arm64: dts: imx93-9x9-qsb: change usdhc tuning step for eMMC and SD
    42e3ff61bbd6 arm64: dts: imx8mq: Set the correct gpu_ahb clock frequency
    35550eb71aaf arm64: dts: qcom: hamoa/x1: fix idle exit latency
    cd4aab4d7b61 soc: aspeed: socinfo: Mask table entries for accurate SoC ID matching
    4ec47edcf3cd ASoC: stm32_sai: fix incorrect BCLK polarity for DSP_A/B, LEFT_J
    9224ba3215a9 net: sfp: add quirks for Hisense and HSGQ GPON ONT SFP modules
    9fca68c2512a wifi: brcmfmac: validate bsscfg indices in IF events
    ee95f3c56a0d ata: ahci: force 32-bit DMA for JMicron JMB582/JMB585
    e16a6d11bd77 HID: roccat: fix use-after-free in roccat_report_event
    609057040da9 ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7 14IAH10
    1753b0c6fd53 HID: quirks: add HID_QUIRK_ALWAYS_POLL for 8BitDo Pro 3
    a712242521be platform/x86/amd: pmc: Add Thinkpad L14 Gen3 to quirk_s2idle_bug
    66dd07f0b93c pinctrl: intel: Fix the revision for new features (1kOhm PD, HW debouncer)
    361b9cddf20b ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7 14IMH9
    f9ac49dda21e ASoC: amd: yc: Add DMI entry for HP Laptop 15-fc0xxx
    2d29214448ec fs/smb/client: fix out-of-bounds read in cifs_sanitize_prepath
    8db2ca260d56 ALSA: usb-audio: Fix quirk flags for NeuralDSP Quad Cortex
    50eed7986f23 ALSA: hda/realtek: Add quirk for Samsung Book2 Pro 360 (NP950QED)
    ade07920ca2c ASoC: soc-core: call missing INIT_LIST_HEAD() for card_aux_list
    df15adc692a8 wifi: wl1251: validate packet IDs before indexing tx_frames
    0843006565bd ALSA: hda/realtek: add quirk for Framework F111:000F
    3d53f9aafd46 netfilter: nft_set_pipapo_avx2: don't return non-matching entry on expiry
    48a21d309343 drm/amdgpu: Handle GPU page faults correctly on non-4K page systems
    b46e7a31e5d2 ALSA: hda/realtek: Add mute LED quirk for HP Pavilion 15-eg0xxx
    32372781d664 btrfs: tracepoints: get correct superblock from dentry in event btrfs_sync_file()
    7a8886444cc6 platform/x86: asus-nb-wmi: add DMI quirk for ASUS ROG Flow Z13-KJP GZ302EAC
    a06d3a930973 can: mcp251x: add error handling for power enable in open and resume
    06d4938e41d6 ASoC: SOF: topology: reject invalid vendor array size in token parser
    c5dfe0fb6a43 ASoC: amd: yc: Add DMI quirk for Thin A15 B7VF
    6e539907c0d1 Bluetooth: hci_sync: annotate data-races around hdev->req_status
    ec010891da57 ALSA: asihpi: avoid write overflow check warning
    c7630d574e33 media: rkvdec: reduce stack usage in rkvdec_init_v4l2_vp9_count_tbl()
    545206174816 ALSA: hda/realtek: Add quirk for ASUS ROG Flow Z13-KJP GZ302EAC
    e3c263cb6e28 ALSA: hda/realtek: Add HP ENVY Laptop 13-ba0xxx quirk
    dcc2ab487da1 ASoC: amd: yc: Add DMI quirk for ASUS EXPERTBOOK BM1403CDA
    66964118f1f5 RDMA/irdma: Fix double free related to rereg_user_mr
    d75ae3350fe8 Linux 6.12.82
    b731aca06387 x86/CPU: Fix FPDSS on Zen1
    ed918050c9ec ALSA: hda/hdmi: Add quirk for TUXEDO IBS14G6
    60313768a8ed net: skb: fix cross-cache free of KFENCE-allocated skb head
    e9c369d58785 rxrpc: Fix missing error checks for rxkad encryption/decryption failure
    57cf7625db25 rxrpc: Fix key/keyring checks in setsockopt(RXRPC_SECURITY_KEY/KEYRING)
    12de9e0e0b0b rxrpc: fix reference count leak in rxrpc_server_keyring()
    a149dcae2330 rxrpc: reject undecryptable rxkad response tickets
    0c156aff8a2d rxrpc: Only put the call ref if one was acquired
    e6b7943c5dc8 rxrpc: Fix key reference count leak from call->key
    c63abf25203b rxrpc: Fix call removal to use RCU safe deletion
    502ff04fa3aa rxrpc: Fix anonymous key handling
    691082c0b93c net: lan966x: fix use-after-free and leak in lan966x_fdma_reload()
    73e940c4249d net: lan966x: fix page pool leak in error paths
    305832c53551 net: lan966x: fix page_pool error handling in lan966x_fdma_rx_alloc_page_pool()
    116cface1b13 idpf: set the payload size before calling the async handler
    6911b7e365bf idpf: improve locking around idpf_vc_xn_push_free()
    633ab680c405 mm: filemap: fix nr_pages calculation overflow in filemap_map_pages()
    2c91b3991227 net: stmmac: fix integer underflow in chain mode
    546cfc65c4bf net: qualcomm: qca_uart: report the consumed byte on RX skb allocation failure
    53f2642d77ab mmc: vub300: fix NULL-deref on disconnect
    3086374e8bc7 pmdomain: imx8mp-blk-ctrl: Keep the NOC_HDCP clock enabled
    a1a416134fc1 net/mlx5: Update the list of the PCI supported devices
    fe3b2f2084b1 drm/i915/psr: Do not use pipe_src as borders for SU area
    a00e92bf6583 drm/i915/gt: fix refcount underflow in intel_engine_park_heartbeat
    7962b5222226 batman-adv: hold claim backbone gateways by reference
    9f3ec44aeb58 net: altera-tse: fix skb leak on DMA mapping error in tse_start_xmit()
    aa9facde6c50 net/tls: fix use-after-free in -EBUSY error path of tls_do_encryption
    d20e98c2df93 EDAC/mc: Fix error path ordering in edac_mc_alloc()
    30ab358fad0c X.509: Fix out-of-bounds access when parsing extensions
    f970646b9a39 batman-adv: reject oversized global TT response buffers
    a9495069b43b nfc: pn533: allocate rx skb before consuming bytes
    bc7ee8cb8b3f arm64: dts: hisilicon: hi3798cv200: Add missing dma-ranges
    53be38076032 arm64: dts: hisilicon: poplar: Correct PCIe reset GPIO polarity
    b7ea2a650ac4 arm64: dts: imx8mq-librem5: Bump BUCK1 suspend voltage up to 0.85V
    ec5cf6e8a125 Revert "arm64: dts: imx8mq-librem5: Set the DVS voltages lower"
    c17a2340d38b platform/x86/intel-uncore-freq: Handle autonomous UFS status bit
    77263f053963 wifi: brcmsmac: Fix dma_free_coherent() size
    a2ea1ef0167d tipc: fix bc_ackers underflow on duplicate GRP_ACK_MSG
    eda30846ea54 xfrm: clear trailing padding in build_polexpire()
    36a36105d957 workqueue: Add pool_workqueue to pending_pwqs list when unplugging multiple inactive works
    aa7cfa16f98f netfilter: nft_ct: fix use-after-free in timeout object destroy
    c1678b76541b LoongArch: Handle percpu handler address for ORC unwinder
    a9f522e12df8 LoongArch: Remove unnecessary checks for ORC unwinder
    c494448bb522 net: annotate data-races around sk->sk_{data_ready,write_space}
    96bfd850d5d3 Revert "mptcp: add needs_id for netlink appending addr"
    ca685511f7af sched_ext: Fix stale direct dispatch state in ddsp_dsq_id
    038cb4a94ed0 misc: fastrpc: check qcom_scm_assign_mem() return in rpmsg_probe
    7854c0f118d8 arm64: dts: renesas: white-hawk-cpu-common: Add pin control for DSI-eDP IRQ
    702029337b05 nfc: nci: complete pending data exchange on device close
    e5584932ac1d blktrace: fix __this_cpu_read/write in preemptible context
    4125a194db4a btrfs: fix incorrect return value after changing leaf in lookup_extent_data_ref()
    42995e4e034b btrfs: remove pointless out labels from extent-tree.c
    8a340c39a33a btrfs: remove unused flag EXTENT_BUFFER_CORRUPT
    70d34bd2a35c btrfs: remove unused flag EXTENT_BUFFER_READAHEAD
    3e6ac6c4b395 btrfs: split waiting from read_extent_buffer_pages(), drop parameter wait
    00f0fbd71440 btrfs: remove unused define WAIT_PAGE_LOCK for extent io
    781da277d05c btrfs: make wait_on_extent_buffer_writeback() static inline
    16a49e3fda33 ASoC: simple-card-utils: Don't use __free(device_node) at graph_util_parse_dai()
    5bc51bc77f22 MIPS: mm: Rewrite TLB uniquification for the hidden bit feature
    497f7f978946 MIPS: mm: Suppress TLB uniquification on EHINV hardware
    d937204d13f9 MIPS: Always record SEGBITS in cpu_data.vmbits
    b8acc3914594 Input: uinput - take event lock when submitting FF request "event"
    a3d6c9c053c9 Input: uinput - fix circular locking dependency with ff-core
    6305ad032b03 seg6: separate dst_cache for input and output paths in seg6 lwtunnel
    eb9c6aeb512f mptcp: fix slab-use-after-free in __inet_lookup_established
    82843afc1901 net: rfkill: prevent unlimited numbers of rfkill events from being created
    ff5ee5073023 xfrm_user: fix info leak in build_report()
    b245db719bc7 wifi: rt2x00usb: fix devres lifetime
    632544de0fd9 usb: typec: ucsi: skip connector validation before init
    1d761e5a7340 lib/crypto: chacha: Zeroize permuted_state before it leaves scope

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 5a7d17c21e..03cd397db0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -15,13 +15,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "4277a7a5b623fcf652c3c73d77baa1fc15c1faf4"
-SRCREV_meta ?= "b507ba98ba3ecc385b14a231dddafaea3421f778"
+SRCREV_machine ?= "151d19206b5cd4a4cf6fd3ec8939463bf30d4b6b"
+SRCREV_meta ?= "1a28be589c9aa79335563af67fbce0dadf570537"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.81"
+LINUX_VERSION ?= "6.12.83"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 533da7130b..802205b38d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.81"
+LINUX_VERSION ?= "6.12.83"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "bd0143fa06a31c277c6fba5d06f84e1165e734e5"
-SRCREV_meta ?= "b507ba98ba3ecc385b14a231dddafaea3421f778"
+SRCREV_machine ?= "f35602ea0c4f5b913a843251bc60949f65fda47c"
+SRCREV_meta ?= "1a28be589c9aa79335563af67fbce0dadf570537"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index e48084fcd3..3e91d22469 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "54a370021957bfa24b4580a75518248174890205"
-SRCREV_machine:qemuarm64 ?= "bd0143fa06a31c277c6fba5d06f84e1165e734e5"
-SRCREV_machine:qemuloongarch64 ?= "bd0143fa06a31c277c6fba5d06f84e1165e734e5"
-SRCREV_machine:qemumips ?= "0b864eeca749237236d8ec10e7ed373958f497c4"
-SRCREV_machine:qemuppc ?= "bd0143fa06a31c277c6fba5d06f84e1165e734e5"
-SRCREV_machine:qemuriscv64 ?= "bd0143fa06a31c277c6fba5d06f84e1165e734e5"
-SRCREV_machine:qemuriscv32 ?= "bd0143fa06a31c277c6fba5d06f84e1165e734e5"
-SRCREV_machine:qemux86 ?= "bd0143fa06a31c277c6fba5d06f84e1165e734e5"
-SRCREV_machine:qemux86-64 ?= "bd0143fa06a31c277c6fba5d06f84e1165e734e5"
-SRCREV_machine:qemumips64 ?= "20f68d6b803a62b9bd958a453a669cd9ac75d22a"
-SRCREV_machine ?= "bd0143fa06a31c277c6fba5d06f84e1165e734e5"
-SRCREV_meta ?= "b507ba98ba3ecc385b14a231dddafaea3421f778"
+SRCREV_machine:qemuarm ?= "429bd391e936b7a9d8164b1446d9c2e591680af4"
+SRCREV_machine:qemuarm64 ?= "f35602ea0c4f5b913a843251bc60949f65fda47c"
+SRCREV_machine:qemuloongarch64 ?= "f35602ea0c4f5b913a843251bc60949f65fda47c"
+SRCREV_machine:qemumips ?= "4c9c4e63b8b075890e9837591cb3b5aa87599938"
+SRCREV_machine:qemuppc ?= "f35602ea0c4f5b913a843251bc60949f65fda47c"
+SRCREV_machine:qemuriscv64 ?= "f35602ea0c4f5b913a843251bc60949f65fda47c"
+SRCREV_machine:qemuriscv32 ?= "f35602ea0c4f5b913a843251bc60949f65fda47c"
+SRCREV_machine:qemux86 ?= "f35602ea0c4f5b913a843251bc60949f65fda47c"
+SRCREV_machine:qemux86-64 ?= "f35602ea0c4f5b913a843251bc60949f65fda47c"
+SRCREV_machine:qemumips64 ?= "aab15ddcde0fa7d8e367a6488ff5206fc12679ee"
+SRCREV_machine ?= "f35602ea0c4f5b913a843251bc60949f65fda47c"
+SRCREV_meta ?= "1a28be589c9aa79335563af67fbce0dadf570537"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "e7a3953084a7050ca349010deb22546834c2e196"
+SRCREV_machine:class-devupstream ?= "eefc95626b5cb02ea6268d1ae58237768004a60d"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.81"
+LINUX_VERSION ?= "6.12.83"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


