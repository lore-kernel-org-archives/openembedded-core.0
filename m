Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF642CD8CB2
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 16:50:22 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25207.1781110217602080396
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 09:50:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=imUQEDIK;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8cceaacd07bso72295076d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781110216; x=1781715016; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2zig4w7hmB9vbca0jWJ0ABO7ErMMzxJnCTfaeNAB3Y=;
        b=imUQEDIKt9iBlk69+mrLPRx9txgl1+NRq3zT00tN/+OBg0+rBhF8quArrUIuYx6THj
         BAuTHc7AouWo8Hb0eovQ3DwxknvzQXq/1lxzfCDkShaLHS/k2akZ4z95EdDkQMHx2KnN
         Wcvl3d+qrsw5gqReHLGxazz45KyshNx9K9wgh6Rtmo6o+Lb+VpmcPa7BohS6TY/IkVEE
         dhPO2+HR/QG4PnrVvjHHJZEI7wwhGHNKTGkMe2StCzjd4kU9gk6R5wVxNdpw8g/5Z94e
         uPHqX4caTWCZasBooXVKk3a71Ryx2GINVf1MUozUmqAl/e4LTpb/g8qc3QAa4mVBhWHM
         gYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781110216; x=1781715016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n2zig4w7hmB9vbca0jWJ0ABO7ErMMzxJnCTfaeNAB3Y=;
        b=EiuL2K1YqW5Su6fI53so6dV4V3Ms2pVGd2ueb6rzIGIPI19tzHowbXeyn2e/st70yW
         hw5E2BYnjMkOp2ZzfvlIFz3q+nWU7xiOj1SIC7TsiE8x6YKgq2+goOseon7aj4a6j1GA
         o/f2HsKzdVT+ULM7/RlOx6eME2op04LgfkbGJilZaihdduesh6exlOsIADxzNEJLVp5j
         LyT9XdQTzBp3kS/SZupYBSdQ2Z7EAP52QVCJeOC4yI24qtXLbCsqnuF92xK+yU15aGat
         yNqDOKDrJbQaJ3ZB3pRukwUMATPJZHg+yLECWC7p2CTdVYyKGbXa6VtxUia1lOBP2Mum
         eFQA==
X-Gm-Message-State: AOJu0YznFLIBz+6Mq4W2xuN2IMZMWYahPD2Qv78Vm5i+NUcFk8WFXu2o
	z4V+14wa5JuSfr2FspBuEr7lsK32C6KaFMuG2iLuuNrUidgtZwfymwqmbPfsz//P
X-Gm-Gg: Acq92OER3TQ00EK1jekLo3Yubjf2QoxPbyXSf6zOixBuOIS09amI0zY8Hrmhf+m28Dc
	XM9HryKFIPG0ZaqC8DSdnza/Dssh916rBTiz0asVdGyQHKnK9EaPNGSH4sBUOH4nLYvxscp3da8
	E8F8X/MVskClqZHJelAKi5D8t2tFaOVOJK0QFUYG680yyLiX+SMefvaxKYpK92EXCAkhQG+4Prg
	UHCHsuCyIzwQIo1BXTPSfV8fq+7yPAMrMFsEGpEdmVT9DhcVVAoKs+xG09Y3x8HAs+UQd+Hvv9g
	ikoqTZvJ5aTIJ7if3rLcY9Go/UnAu/QbeFCW3wB4d/s5juQfbDcMiM82aW1UBeEIP0LapL3BYX6
	e/a8MTxp8wKMkmds5rRcF4GML50Je+xAfw2ObSf3X68rhoUFmQ2PZ6VviiqWHobB4haCRY8Rlax
	jzOMMB9EIZiXWkkWccx4154Hpa1N5vS11/kIUzpwBbFT/0uzLl+PFc12NR/FV88zWxbFJ3LB1Mg
	vuuyDBkCFsy3mh6dmt3+DCyynvhdrIBp2gpuZMGsIXznWkHO5UUnQLMfl/Nc44tSEYO8y4Fpc5C
	R0BcOfdj5X9Rz+ZNO6UFw/n2si1aaQ2k4ISU+kM1xcf1ZUHu0HGPcjc=
X-Received: by 2002:a05:6214:3bc1:b0:8cc:edd2:6a57 with SMTP id 6a1803df08f44-8d187fcebb5mr1127546d6.18.1781110216291;
        Wed, 10 Jun 2026 09:50:16 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccdb915csm241444346d6.14.2026.06.10.09.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 09:50:15 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][scarthgap][PATCH 06/11] linux-yocto/6.6: update to v6.6.136
Date: Wed, 10 Jun 2026 12:50:03 -0400
Message-ID: <20260610165008.1870552-6-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610165008.1870552-1-bruce.ashfield@gmail.com>
References: <20260610165008.1870552-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 16:50:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238382

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    142cd8382222 Linux 6.6.136
    deeaba4c54ae md/raid1: fix data lost for writemostly rdev
    1fa36cf495b0 rxrpc: Fix missing validation of ticket length in non-XDR key preparsing
    09427bcb1715 crypto: ccp: Don't attempt to copy ID to userspace if PSP command failed
    b5c14bd4da1f crypto: ccp: Don't attempt to copy PDH cert to userspace if PSP command failed
    607ba280f2ad crypto: ccp: Don't attempt to copy CSR to userspace if PSP command failed
    c89c768734f3 crypto: testmgr - Hide ENOENT errors better
    695cac6ed284 crypto: testmgr - Hide ENOENT errors
    74e2db36fe50 net/packet: fix TOCTOU race on mmap'd vnet_hdr in tpacket_snd()
    f6634af5de72 ALSA: caiaq: take a reference on the USB device in create_card()
    86fc28191418 ALSA: usb-audio: apply quirk for MOONDROP JU Jiu
    ef57cd3329b4 f2fs: fix use-after-free of sbi in f2fs_compress_write_end_io()
    8d5729350b23 ksmbd: use check_add_overflow() to prevent u16 DACL size overflow
    ffbce350c6fd ksmbd: fix out-of-bounds write in smb2_get_ea() EA alignment
    a34d456934fe smb: client: fix OOB read in smb2_ioctl_query_info QUERY_INFO path
    b53b8e98c233 smb: client: require a full NFS mode SID before reading mode bits
    0521a67e4b0f smb: server: fix max_connections off-by-one in tcp accept path
    97f8d2648ef4 smb: server: fix active_num_conn leak on transport allocation failure
    b3e0e7dd53f1 fuse: quiet down complaints in fuse_conn_limit_write
    f1441a1ecace fuse: Check for large folio with SPLICE_F_MOVE
    d23ad78bfd20 fuse: reject oversized dirents in page cache
    a76c1cad4e80 f2fs: fix to avoid memory leak in f2fs_rename()
    f90b8a1798b7 fs/ntfs3: validate rec->used in journal-replay file record check
    a6bcf8010af0 rxrpc: only handle RESPONSE during service challenge
    d6a76b3600e1 rxrpc: Fix anonymous key handling
    6669cf805940 scripts/dtc: Remove unused dts_version in dtc-lexer.l
    cf044df0901f Revert "wifi: cfg80211: stop NAN and P2P in cfg80211_leave"
    e2c9dc6b6e96 ocfs2: fix out-of-bounds write in ocfs2_write_end_inline
    37f074e65f24 ocfs2: validate inline data i_size during inode read
    4bf8cd09f427 ocfs2: add inline inode consistency check to ocfs2_validate_inode_block()
    c98b6fa86b33 rxrpc: Fix key quota calculation for multitoken keys
    e297bb2c2568 KVM: x86: Use __DECLARE_FLEX_ARRAY() for UAPI structures with VLAs
    f363c496e203 scripts: generate_rust_analyzer.py: define scripts
    ceb73484e720 PCI: endpoint: pci-epf-vntb: Stop cmd_handler work in epf_ntb_epc_cleanup
    7ad01905831c net: annotate data-races around sk->sk_{data_ready,write_space}
    fa5d5baf67f6 i40e: Fix preempt count leak in napi poll tracepoint
    71ca90c26eef net: ethernet: mtk_eth_soc: initialize PPE per-tag-layer MTU registers
    f77b51bcee7b wifi: mac80211: always free skb on ieee80211_tx_prepare_skb() failure
    10f4ff4baeb6 md/raid1,raid10: don't ignore IO flags
    50352fc10392 ipv6: add NULL checks for idev in SRv6 paths
    e238ab12556b PCI: endpoint: pci-epf-vntb: Remove duplicate resource teardown
    ebc8815a917f Revert "perf unwind-libdw: Fix invalid reference counts"
    45cbaf5c7cdc media: hackrf: fix to not free memory after the device is registered in hackrf_probe()
    e3957eb26a3d media: vidtv: fix pass-by-value structs causing MSAN warnings
    7318e3549518 nilfs2: fix NULL i_assoc_inode dereference in nilfs_mdt_save_to_shadow_map
    cb8092038e95 media: as102: fix to not free memory after the device is registered in as102_usb_probe()
    47fa09fe7f3e bcache: fix cached_dev.sb_bio use-after-free and crash
    e88354b381e2 ALSA: 6fire: fix use-after-free on disconnect
    b5d141ea15f1 media: em28xx: fix use-after-free in em28xx_v4l2_open()
    9a9bdaf9dc42 media: mediatek: vcodec: fix use-after-free in encoder release path
    17cb7957c979 media: vidtv: fix nfeeds state corruption on start_streaming failure
    115a5266749d mm: blk-cgroup: fix use-after-free in cgwb_release_workfn()
    cec74b2ab7df mm/kasan: fix double free for kasan pXds
    887632163b54 ASoC: qcom: q6apm: move component registration to unmanaged version
    dc6a6c3db3a4 KVM: x86: Use scratch field in MMIO fragment to hold small write values
    24b1e0d5d254 checkpatch: add support for Assisted-by tag
    e0c211a0c261 ice: Fix memory leak in ice_set_ringparam()
    e6661add2d9c nf_tables: nft_dynset: fix possible stateful expression memleak in error path
    aaba6ee63ba6 blktrace: fix __this_cpu_read/write in preemptible context
    9df613ef6e8e nfc: nci: complete pending data exchange on device close
    4604b7b4eee6 net: sched: fix TCF_LAYER_TRANSPORT handling in tcf_get_base_ptr()
    5afb9356a2e5 KVM: nVMX: Fold requested virtual interrupt check into has_nested_events()
    002a73470b56 net: add proper RCU protection to /proc/net/ptype
    f9d4b618f1b9 iio: common: st_sensors: Fix use of uninitialize device structs
    36f127b971c0 btrfs: merge btrfs_orig_bbio_end_io() into btrfs_bio_end_io()
    128b03ccb258 net: skb: fix cross-cache free of KFENCE-allocated skb head
    b670833749ff KVM: SEV: Drop WARN on large size for KVM_MEMORY_ENCRYPT_REG_REGION
    6575f9fbf084 ocfs2: handle invalid dinode in ocfs2_group_extend
    6f072daefcab ocfs2: fix use-after-free in ocfs2_fault() when VM_FAULT_RETRY
    4b80b5a838a3 ocfs2: fix possible deadlock between unlink and dio_end_io_write
    b7efb4c94797 media: vidtv: fix NULL pointer dereference in vidtv_channel_pmt_match_sections
    426ef05e82ee dcache: Limit the minimal number of bucket to two
    452894005b4a ALSA: ctxfi: Limit PTP to a single page
    6718df49e5a7 Docs/admin-guide/mm/damon/reclaim: warn commit_inputs vs param updates race
    554391e7da68 USB: serial: option: add Telit Cinterion FN990A MBIM composition
    779412e0e391 staging: sm750fb: fix division by zero in ps_to_hz()
    f632987306bc wifi: rtw88: fix device leak on probe failure
    e2f8c5d134f7 scripts: generate_rust_analyzer.py: avoid FD leak
    cce24f70090e fbdev: udlfb: avoid divide-by-zero on FBIOPUT_VSCREENINFO
    301857c5ac27 usb: port: add delay after usb_hub_set_port_power()
    8fb82e3555a7 USB: cdc-acm: Add quirks for Yoga Book 9 14IAH10 INGENIC touchscreen
    9dec3276d122 usb: storage: Expand range of matched versions for VL817 quirks entry
    885c8591784d usbip: validate number_of_packets in usbip_pack_ret_submit()
    745a535461bb ksmbd: fix mechToken leak when SPNEGO decode fails after token alloc
    b5b5d5936a50 ksmbd: require 3 sub-authorities before reading sub_auth[2]
    4b73376feecb ksmbd: validate EaNameLength in smb2_get_ea()
    bfbc74df8bbe smb: client: fix off-by-8 bounds check in check_wsl_eas()
    1b2bfedccc4f usb: gadget: renesas_usb3: validate endpoint index in standard request handlers
    9ceff1251904 usb: gadget: f_phonet: fix skb frags[] overflow in pn_rx_complete()
    0f156bb5334e usb: gadget: f_ncm: validate minimum block_len in ncm_unwrap_ntb()
    859a239d58a8 fbdev: tdfxfb: avoid divide-by-zero on FBIOPUT_VSCREENINFO
    f856f4b6efd5 ALSA: fireworks: bound device-supplied status before string array lookup
    63c11b19cdc1 drm/vc4: platform_get_irq_byname() returns an int
    2819f34e08bd NFC: digital: Bounds check NFC-A cascade depth in SDD response handler
    d4e1946bea8d net: usb: cdc-phonet: fix skb frags[] overflow in rx_complete()
    932ae5309e53 HID: core: clamp report_size in s32ton() to avoid undefined shift
    c8cc765253ad HID: alps: fix NULL pointer dereference in alps_raw_event()
    c65ee4d3be5d staging: rtl8723bs: initialize le_tmp64 in rtw_BIP_verify()
    fa00738ab30b i2c: s3c24xx: check the size of the SMBUS message before using it
    5e9cfffad898 can: raw: fix ro->uniq use-after-free in raw_rcv()
    0eb1263a3b8c nfc: llcp: add missing return after LLCP_CLOSED checks
    e2e0e7884314 drm/i915/psr: Do not use pipe_src as borders for SU area
    7ab1832fe163 objtool: Remove max symbol name length limitation
    29d39948ce52 ALSA: usb-audio: Improve Focusrite sample rate filtering
    c5e918390002 netfilter: conntrack: add missing netlink policy validations
    e86ab1e56613 crypto: algif_aead - Fix minimum RX size check for decryption
    cfab2c817d2e perf/x86/intel/uncore: Skip discovery table for offline dies
    1981e469558b gpio: tegra: fix irq_release_resources calling enable instead of disable
    9ccce02d5013 l2tp: Drop large packets with UDP encap
    ae8343a19ccb net: ipa: fix event ring index not programmed for IPA v5.0+
    a7d326dfb13b net: ipa: fix GENERIC_CMD register field masks for IPA v5.0+
    b9232421a77a af_unix: read UNIX_DIAG_VFS data under unix_state_lock
    00e1d650fa4b net: txgbe: leave space for null terminators on property_entry
    288138418bef netfilter: ip6t_eui64: reject invalid MAC header for all packets
    36bf0d98e180 netfilter: xt_multiport: validate range encoding in checkentry
    368c22aea490 netfilter: nfnetlink_log: initialize nfgenmsg in NLMSG_DONE terminator
    730663352c91 ipvs: fix NULL deref in ip_vs_add_service error path
    c4d93470aff0 selftests: net: bridge_vlan_mcast: wait for h1 before querier check
    d3125c541a96 xfrm_user: fix info leak in build_mapping()
    b66920a3348c xfrm: Wait for RCU readers during policy netns exit
    a55793e5a97d xsk: validate MTU against usable frame size on bind
    81ab60836b27 xsk: fix XDP_UMEM_SG_FLAG issues
    cfcc8a82ad03 xsk: respect tailroom for ZC setups
    a03975beb9f6 xsk: tighten UMEM headroom validation to account for tailroom and min frame
    c9eef0760db4 e1000: check return value of e1000_read_eeprom
    d8a747057a17 ixgbevf: add missing negotiate_features op to Hyper-V ops table
    feba4907c302 tracing/probe: reject non-closed empty immediate strings
    7a01c81120f5 dt-bindings: net: Fix Tegra234 MGBE PTP clock
    366f890831ff net: stmmac: Fix PTP ref clock for Tegra234
    d8c2aa3c4a1e nfc: s3fwrn5: allocate rx skb before consuming bytes
    47a8bf52156a ipv4: icmp: fix null-ptr-deref in icmp_build_probe()
    363a38044b8c net: lapbether: handle NETDEV_PRE_TYPE_CHANGE
    eb3765b90eb8 net: sched: act_csum: validate nested VLAN headers
    a6566cd33f6f eventpoll: defer struct eventpoll free to RCU grace period
    34160cca50ec drm/vc4: Protect madv read in vc4_gem_object_mmap() with madv_lock
    dd5c49787a32 drm/vc4: Fix a memory leak in hang state error path
    a812008fe3a0 drm/vc4: Fix memory leak of BO array in hang state
    5befb65dca90 drm/vc4: Release runtime PM reference after binding V3D
    96f71e3a7f9b PCI: hv: Set default NUMA node to 0 for devices without affinity info
    6948caaff66d arm64: dts: imx8mq: Set the correct gpu_ahb clock frequency
    d4d11b70a30f soc: aspeed: socinfo: Mask table entries for accurate SoC ID matching
    f0288da67320 ASoC: stm32_sai: fix incorrect BCLK polarity for DSP_A/B, LEFT_J
    3ec7437e9d11 wifi: brcmfmac: validate bsscfg indices in IF events
    cf50a1178dfc ata: ahci: force 32-bit DMA for JMicron JMB582/JMB585
    e6a445513fbc HID: roccat: fix use-after-free in roccat_report_event
    40f40229baa7 ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7 14IAH10
    e73692e0e271 HID: quirks: add HID_QUIRK_ALWAYS_POLL for 8BitDo Pro 3
    a9098b43562f platform/x86/amd: pmc: Add Thinkpad L14 Gen3 to quirk_s2idle_bug
    36af81124ca8 pinctrl: intel: Fix the revision for new features (1kOhm PD, HW debouncer)
    b17dcf3c9cb4 ASoC: amd: yc: Add DMI entry for HP Laptop 15-fc0xxx
    5d4fe469fe7d fs/smb/client: fix out-of-bounds read in cifs_sanitize_prepath
    7b73bea718fe ALSA: usb-audio: Fix quirk flags for NeuralDSP Quad Cortex
    e51cd8954919 ASoC: soc-core: call missing INIT_LIST_HEAD() for card_aux_list
    b6ba1eacf276 wifi: wl1251: validate packet IDs before indexing tx_frames
    d7b59c2e6109 ALSA: hda/realtek: add quirk for Framework F111:000F
    fa4f1f52528c netfilter: nft_set_pipapo_avx2: don't return non-matching entry on expiry
    b345586c9fe8 ALSA: hda/realtek: Add mute LED quirk for HP Pavilion 15-eg0xxx
    c09a7446aab5 btrfs: tracepoints: get correct superblock from dentry in event btrfs_sync_file()
    aa77bd6d08f0 can: mcp251x: add error handling for power enable in open and resume
    5c37bd025068 ASoC: SOF: topology: reject invalid vendor array size in token parser
    64e4ced7dd47 ASoC: amd: yc: Add DMI quirk for Thin A15 B7VF
    719df67c2003 ALSA: asihpi: avoid write overflow check warning
    384c3f844f53 media: rkvdec: reduce stack usage in rkvdec_init_v4l2_vp9_count_tbl()
    e0c656cbb2a7 ALSA: hda/realtek: Add quirk for ASUS ROG Flow Z13-KJP GZ302EAC
    1e1015643535 ALSA: hda/realtek: Add HP ENVY Laptop 13-ba0xxx quirk
    2cd86c2cd771 ASoC: amd: yc: Add DMI quirk for ASUS EXPERTBOOK BM1403CDA
    62298a48f8b8 RDMA/irdma: Fix double free related to rereg_user_mr

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  4 +--
 .../linux/linux-yocto-tiny_6.6.bb             |  4 +--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 26 +++++++++----------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index fab90bcc14..22af5c2a99 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "796ebf5cd0bb25e473fead08d0e3c8c1b68f0676"
+SRCREV_machine ?= "99c037f00af27169304f268e388fa3fc65688633"
 SRCREV_meta ?= "b162eec5fa39c4658181073e741efe3a9d498454"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.135"
+LINUX_VERSION ?= "6.6.136"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 80234909a3..1153249b8d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.135"
+LINUX_VERSION ?= "6.6.136"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,7 +17,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "8c3e42c1177c1cf7f4b028ffe1ddacf5a7e8b018"
+SRCREV_machine ?= "4aa4f6df28cc4541355f39ce0c40237408690c14"
 SRCREV_meta ?= "b162eec5fa39c4658181073e741efe3a9d498454"
 
 PV = "${LINUX_VERSION}+git"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 43d0ad9c8e..f2307dd6e0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,17 +18,17 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "e3d837b99e32b26f86c7e0c956787aa7ac11cbc8"
-SRCREV_machine:qemuarm64 ?= "440d78702ecd1f42162acba37434033a5ca903cb"
-SRCREV_machine:qemuloongarch64 ?= "97fc5acdc890a23017140ff16705091544b0ab09"
-SRCREV_machine:qemumips ?= "8692ec9071ca8f4432c2c3409bf79240f34a7af5"
-SRCREV_machine:qemuppc ?= "d49f40c6896b5d1ac37a84564ed7ab5b7a839519"
-SRCREV_machine:qemuriscv64 ?= "97fc5acdc890a23017140ff16705091544b0ab09"
-SRCREV_machine:qemuriscv32 ?= "97fc5acdc890a23017140ff16705091544b0ab09"
-SRCREV_machine:qemux86 ?= "97fc5acdc890a23017140ff16705091544b0ab09"
-SRCREV_machine:qemux86-64 ?= "97fc5acdc890a23017140ff16705091544b0ab09"
-SRCREV_machine:qemumips64 ?= "91b8fff701cdc434e211a58915886224eb6e0d1a"
-SRCREV_machine ?= "97fc5acdc890a23017140ff16705091544b0ab09"
+SRCREV_machine:qemuarm ?= "9d8556efa4dbd3ee1cfac4af6426a8476637fcef"
+SRCREV_machine:qemuarm64 ?= "aaa7c5002cfdf0f46dcf9239f3074aee1e29741d"
+SRCREV_machine:qemuloongarch64 ?= "59f5af18d31e596ec928a48848bd837d53e06c26"
+SRCREV_machine:qemumips ?= "d9adf59334edff1b09b883ea5717895e9735aa13"
+SRCREV_machine:qemuppc ?= "52b968d255a67240a548e64e784d3f5269ca3894"
+SRCREV_machine:qemuriscv64 ?= "59f5af18d31e596ec928a48848bd837d53e06c26"
+SRCREV_machine:qemuriscv32 ?= "59f5af18d31e596ec928a48848bd837d53e06c26"
+SRCREV_machine:qemux86 ?= "59f5af18d31e596ec928a48848bd837d53e06c26"
+SRCREV_machine:qemux86-64 ?= "59f5af18d31e596ec928a48848bd837d53e06c26"
+SRCREV_machine:qemumips64 ?= "746738b15a00d5d36105d09ea0f259f44be48ad5"
+SRCREV_machine ?= "59f5af18d31e596ec928a48848bd837d53e06c26"
 SRCREV_meta ?= "b162eec5fa39c4658181073e741efe3a9d498454"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
@@ -36,7 +36,7 @@ SRCREV_meta ?= "b162eec5fa39c4658181073e741efe3a9d498454"
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "9760bf04666dfe154161d49b6207c3486685bf29"
+SRCREV_machine:class-devupstream ?= "142cd8382222d9b135e0029da6830e5e30444d34"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.135"
+LINUX_VERSION ?= "6.6.136"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


