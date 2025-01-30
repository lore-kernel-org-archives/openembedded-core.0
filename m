Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B6FC02190
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 16:02:01 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.18808.1738252919965560515
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jan 2025 08:02:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JD2vHOBz;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7b6f53c12adso84351885a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 08:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738252919; x=1738857719; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+5dxxQjcPxfyI6HDeMT7LmZ4Rp9ZRIhlsu5XNw98Ic=;
        b=JD2vHOBzx36re7nNMjUJoixyZ++o5hWGaTHUiI7rMWls0kv2ik1C2682MMxEPSzkJO
         G+GzWD+YwXmL4ewVfibp9eMto27DCDeo16RTb6k1zHLIlSy20IqPjugTitlBixyuTlgx
         fnMiKwJEo5ziIezrGcJQWFWbJN0qLUhnRdQv+NAjPn59QdxuQUGwAiN4FOu0Wjjy2lmO
         1xQHwrAs/5B3TRZqLuD+lCATYp5Jghq1Ypkz3eAoojU6dv3957dnLeoUXuDzblk2dMBs
         YNTZ19n6WZEPAudzcm2M20N1Adw4+zdroe3Gt9Kgsulx28cHjhj4cjRZHeHB8B45h9Jl
         B9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738252919; x=1738857719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0+5dxxQjcPxfyI6HDeMT7LmZ4Rp9ZRIhlsu5XNw98Ic=;
        b=g1c731g4bIc2ZfzCOpZx77qEjfRMMVO13DNPIDoEHT5LzYY4eS/upesH89yjYnyc/D
         lgWtH8HEO1OOIsTEd+7Q7iMwM5a7GlzBGAOFHXFlwjLLGWD48TMvye5A6ga11W53FLwV
         4YhlB716yS0KqcHUxhPztLiwiE7Xg4Pb9QWGUaV9+5lLV9PC/Vs5yuXtY+fzN0kBz0Ji
         m85gBFubdErj3uJYvoZ7JRbYbZerHhbQNHTNNlZ5b4I2WIyv1YNVOiL1XZtKWWEFSJcG
         hiVUyixcBRNaZ5ObSQ52uKTiV1D3n1JAcz7jpUWSoEbldW1UW7cs2DjovRc3Gj2kd0UT
         Foow==
X-Gm-Message-State: AOJu0YyfkYPA76M/aHguHGHg1q8DTLwQq6JcS9a+WVnMRW0NrBLxGxjW
	1Iq5GBKtbq1ATmdvGMVlqGv8qF0bd9aCHVLbKtC9nyjQAsHZTIFN5wm1v0ZICBU=
X-Gm-Gg: ASbGncta2Hk65t77AClFCrvPTEYdg3eBnekmCxp7T7YMv+iJaTBa8v9Das54np+ZBDN
	G9jGZ3GcBIUKlbpOlDosicnGCfQijthGu/kEPKHcTeg1oKcTmTFsLznDogJLmP2xrENT+xKQFL0
	aVVSStE3QS07kpRkbl6/18Cq95JDjopMDu7iIXmaDVSLNNlBEsJBeer5kWqCgYlabepFPXcf6V+
	UF8YSnIOzvr21TRy1Q2Q8TKw2NeFi45CiEh8AToUj8x77krZGTQ8qJiMMm8H67F9E+l1/KLn2Eg
	hmrcIhKhQ9oferN2Kil9STTukNm4KcT97EyQqsHLoxZf/WwVV7IDPV0IyveWjNvbYBFf4RjhXZ+
	9ReUPCpdmo/jL3SnP
X-Google-Smtp-Source: AGHT+IGuLSaDaTH2WvxrVrVK/dJTzUQaok5nj+OrGdXynZy/nf+RvTwrrSZ7AQ91gIq+bSsHf++iSw==
X-Received: by 2002:a05:620a:4148:b0:7b6:f03e:6c0e with SMTP id af79cd13be357-7bffcd070ffmr1148975085a.31.1738252918593;
        Thu, 30 Jan 2025 08:01:58 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a90d3c4sm86086285a.111.2025.01.30.08.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 08:01:57 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] linux-yocto/6.6: update to v6.6.71
Date: Thu, 30 Jan 2025 11:01:49 -0500
Message-Id: <e4a263077514a0b7ba971fe6a999191ff744db52.1738252521.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1738252521.git.bruce.ashfield@gmail.com>
References: <cover.1738252521.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 16:02:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210455

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    843e64492a7e Linux 6.6.71
    a6923798e471 x86/hyperv: Fix hv tsc page based sched_clock for hibernation
    b34e805539da Revert "x86, crash: wrap crash dumping code into crash related ifdefs"
    c8bc44c5f961 Revert "x86/hyperv: Fix hv tsc page based sched_clock for hibernation"
    1acb10106df3 Linux 6.6.70
    9722973ad038 scsi: hisi_sas: Remove redundant checks for automatic debugfs dump
    3de1b50f055d RDMA/bnxt_re: Fix max SGEs for the Work Request
    f61e663d78ff mptcp: don't always assume copied data in mptcp_cleanup_rbuf()
    27c843e76447 mptcp: fix recvbuffer adjust on sleeping rcvmsg
    53fe947f67c9 mptcp: fix TCP options overflow.
    1ff2302e8aea mm: vmscan: account for free pages to prevent infinite Loop in throttle_direct_reclaim()
    86d946f3f999 mm/kmemleak: fix sleeping function called from invalid context at print message
    424abdec35ec mm/readahead: fix large folio support in async readahead
    cbe9eb2c39d0 gve: guard XDP xmit NDO on existence of xdp queues
    771d66f2bd8c gve: guard XSK operations on the existence of queues
    9b071576f891 fs/proc/task_mmu: fix pagemap flags with PMD THP entries on 32bit
    1f49aaf55652 drm: adv7511: Fix use-after-free in adv7533_attach_dsi()
    79fcfc900abe dt-bindings: display: adi,adv7533: Drop single lane support
    7b977f8c26b6 drm: adv7511: Drop dsi single lane support
    271f031f4c31 net/sctp: Prevent autoclose integer overflow in sctp_association_init()
    b32c3b748d29 sky2: Add device ID 11ab:4373 for Marvell 88E8075
    8c6fd5803b98 pinctrl: mcp23s08: Fix sleeping in atomic context due to regmap locking
    b92667f75574 RDMA/uverbs: Prevent integer overflow issue
    c9818b61d0a8 scripts/sorttable: fix orc_sort_cmp() to maintain symmetry and transitivity
    edc8ece96c11 kcov: mark in_softirq_really() as __always_inline
    2e3d203b1ade ocfs2: fix slab-use-after-free due to dangling pointer dqi_priv
    d2392b79d8af ALSA: seq: oss: Fix races at processing SysEx messages
    7d1f59defa9e ALSA hda/realtek: Add quirk for Framework F111:000C
    396964d45ca5 ALSA: seq: Check UMP support for midi_version change
    199f04528737 Revert "bpf: support non-r10 register spill/fill to/from stack in precision tracking"
    bc6962f2dbaf modpost: fix the missed iteration for the max bit in do_input()
    f93e9ae0ba5e modpost: fix input MODULE_DEVICE_TABLE() built for 64-bit on 32-bit host
    36e1b6890f22 RDMA/bnxt_re: Fix the max WQE size for static WQE support
    c3b5a7d6a13b seq_buf: Make DECLARE_SEQ_BUF() usable
    f2b94ee08ec6 ARC: build: Try to guess GCC variant of cross compiler
    d8f3f7d30f65 irqchip/gic: Correct declaration of *percpu_base pointer in union gic_base
    bef333418368 Bluetooth: hci_core: Fix sleeping function called from invalid context
    d8ecb248c199 net: usb: qmi_wwan: add Telit FE910C04 compositions
    c6b1d01e7a9c smb: client: destroy cfid_put_wq on module exit
    1d7ee876b8b9 ksmbd: set ATTR_CTIME flags when setting mtime
    2f75da8294bf ksmbd: retry iterate_dir in smb2_query_dir
    f53b37313ab6 bpf: fix potential error return
    73a30cb3e980 sound: usb: format: don't warn that raw DSD is unsupported
    325370be0676 sound: usb: enable DSD output for ddHiFi TC44C
    7523dd63ab22 ALSA: hda/realtek: Add new alc2xx-fixup-headset-mic model
    0d5e2d476000 ALSA: hda/ca0132: Use standard HD-audio quirk matching helpers
    35916b2f9650 btrfs: flush delalloc workers queue before stopping cleaner kthread during unmount
    d0fafe701c6a drm/amdkfd: Correct the migration DMA map direction
    037ea0f28f9a wifi: mac80211: wake the queues in case of failure in resume
    86772872f9f5 wifi: mac80211: fix mbss changed flags corruption on 32 bit systems
    d6b130fabfe1 net: ti: icssg-prueth: Fix clearing of IEP_CMP_CFG registers during iep_init
    17e8fa894345 ila: serialize calls to nf_register_net_hooks()
    a693b87692b4 af_packet: fix vlan_get_protocol_dgram() vs MSG_PEEK
    7aa78d0d8546 af_packet: fix vlan_get_tci() vs MSG_PEEK
    23f2e7a13fa4 net: wwan: iosm: Properly check for valid exec stage in ipc_mmio_init()
    ad91a2dacbf8 net: restrict SO_REUSEPORT to inet sockets
    95ccf006bbc8 net: reenable NETIF_F_IPV6_CSUM offload for BIG TCP packets
    9eea3703c882 net: sfc: Correct key_len for efx_tc_ct_zone_ht_params
    b238f61cc394 RDMA/rtrs: Ensure 'ib_sge list' is accessible
    0cd3bde081cd net: wwan: t7xx: Fix FSM command timeout issue
    313474b10897 net: mv643xx_eth: fix an OF node reference leak
    d5ea3a4d02d8 eth: bcmsysport: fix call balance of priv->clk handling routines
    930f2f96734e ALSA: usb-audio: US16x08: Initialize array before use
    0c896816aa19 net: llc: reset skb->transport_header
    4f49349c1963 netfilter: nft_set_hash: unaligned atomic read on struct nft_set_ext
    c9b344ada5fd drm/i915/dg1: Fix power gate sequence.
    3e45dd1622a2 net/mlx5e: Skip restore TC rules for vport rep without loaded flag
    e66a99b9177b net/mlx5e: macsec: Maintain TX SA from encoding_sa
    43e589ab372f net/mlx5: DR, select MSIX vector 0 for completion queue creation
    f647d72245aa netrom: check buffer length before accessing it
    36eff8669b74 net: Fix netns for ip_tunnel_init_flow()
    7e9aa1a065dc ipv4: ip_tunnel: Unmask upper DSCP bits in ip_tunnel_xmit()
    3b1a7fb74ab1 ipv4: ip_tunnel: Unmask upper DSCP bits in ip_md_tunnel_xmit()
    ae0710c5cc74 ipv4: ip_tunnel: Unmask upper DSCP bits in ip_tunnel_bind_dev()
    77b1e00fe97e ip_tunnel: annotate data-races around t->parms.link
    2af69905180b net: fix memory leak in tcp_conn_request()
    c6870f86bde6 net: stmmac: restructure the error path of stmmac_probe_config_dt()
    6d01d9f66ae1 net: stmmac: don't create a MDIO bus if unnecessary
    48f63e4e64a5 RDMA/hns: Fix missing flush CQE for DWQE
    be4293e108e2 RDMA/hns: Fix warning storm caused by invalid input in IO path
    2746888be48c RDMA/hns: Fix mapping error of zero-hop WQE buffer
    2049fb6c8bd7 RDMA/hns: Remove unused parameters and variables
    363f502cbfc0 RDMA/hns: Refactor mtr find
    ca2a2cad4efb net: dsa: microchip: Fix LAN937X set_ageing_time function
    7583dd5928b6 net: dsa: microchip: Fix KSZ9477 set_ageing_time function
    fa7f96589f17 drm/bridge: adv7511_audio: Update Audio InfoFrame properly
    f28fa7625536 RDMA/bnxt_re: Fix the locking while accessing the QP table
    cd1547b49b2c RDMA/bnxt_re: Fix MSN table size for variable wqe mode
    2e719d89b9fa RDMA/bnxt_re: Add send queue size check for variable wqe
    3ae9ee7ff3b2 RDMA/bnxt_re: Disable use of reserved wqes
    bb46a484a0c6 RDMA/bnxt_re: Add support for Variable WQE in Genp7 adapters
    9fcfe972758b RDMA/bnxt_re: Fix max_qp_wrs reported
    38b49312da2d RDMA/bnxt_re: Fix reporting hw_ver in query_device
    14f66ac898c9 RDMA/bnxt_re: Add check for path mtu in modify_qp
    183a96174cab RDMA/bnxt_re: Fix the check for 9060 condition
    347654387bb1 nvme-pci: 512 byte aligned dma pool segment quirk
    a0ceed736c88 RDMA/bnxt_re: Avoid sending the modify QP workaround for latest adapters
    a5092b138e1c RDMA/bnxt_re: Avoid initializing the software queue for user queues
    25e6e9da6926 RDMA/mlx5: Enforce same type port association for multiport RoCE
    5d1d7522cf82 RDMA/bnxt_re: Remove always true dattr validity check
    c91ae7c12d6f RDMA/bnxt_re: Allow MSN table capability check
    f452f397f9a6 tracing: Check "%s" dereference via the field and not the TP_printk format
    55841e8820b9 tracing: Fix trace_check_vprintf() when tp_printk is used
    680c07fabc2b tracing: Handle old buffer mappings for event strings and functions
    6920e362bc08 seq_buf: Introduce DECLARE_SEQ_BUF and seq_buf_str()
    cd27bbe89810 powerpc: Remove initialisation of readpos
    c46547b4686e tracing: Move readpos from seq_buf to trace_seq
    1ec141d8f51b net: mctp: handle skb cleanup on sock_queue failures
    c47ed91156da ceph: give up on paths longer than PATH_MAX
    a64e5295ebc4 tracing: Have process_string() also allow arrays
    de2a10e19226 mmc: sdhci-msm: fix crypto key eviction
    6228f13f1996 btrfs: fix use-after-free in btrfs_encoded_read_endio()
    c1dbd28a0795 selinux: ignore unknown extended permissions
    c2a7fc514637 f2fs: fix to wait dio completion
    23ea763880d6 platform/x86: mlx-platform: call pci_dev_put() to balance the refcount
    d4eb5b3c115d ALSA: ump: Shut up truncated string warning
    8b2e38f2a9b7 usb: xhci: Avoid queuing redundant Stop Endpoint commands
    8a2273e5c1be usb: typec: ucsi: glink: fix off-by-one in connector_status
    a47f0b03149a scsi: hisi_sas: Fix a deadlock issue related to automatic dump
    8c5ad189e90f cleanup: Remove address space of returned pointer
    55779f26eab9 crypto: ecc - Prevent ecc_digits_from_bytes from reading too many bytes
    9457d783fb94 Bluetooth: btusb: mediatek: add callback function in btusb_disconnect
    3aab20eb1989 Bluetooth: btusb: add callback function in btusb suspend/resume
    9a466b8693b9 btrfs: fix use-after-free when COWing tree bock and tracing is enabled
    0d2cc60b44d0 btrfs: rename and export __btrfs_cow_block()
    151447859d6f x86/fred: Clear WFE in missing-ENDBRANCH #CPs
    9c268be377e7 x86/ptrace: Add FRED additional information to the pt_regs structure
    498bdedca58a x86/ptrace: Cleanup the definition of the pt_regs structure
    48417c3426cf ACPI/IORT: Add PMCG platform information for HiSilicon HIP09A
    4252d023bae7 ACPI/IORT: Add PMCG platform information for HiSilicon HIP10/11
    f5a20424084f scsi: mpi3mr: Start controller indexing from 0
    d424303d8d18 scsi: mpi3mr: Use ida to manage mrioc ID
    8d891c866cf7 ALSA: ump: Update legacy substream names upon FB info update
    9617001adfc9 ALSA: ump: Indicate the inactive group in legacy substream names
    cf29cbf61cf2 ALSA: ump: Don't open legacy substream for an inactive group
    b5e175e18a39 ALSA: ump: Use guard() for locking
    b41d73055284 udf: Verify inode link counts before performing rename
    17b312c5d869 udf_rename(): only access the child content on cross-directory rename
    d33523b0beb5 watchdog: rzg2l_wdt: Power on the watchdog domain in the restart handler
    e145b77fb5c1 watchdog: rzg2l_wdt: Rely on the reset driver for doing proper reset
    7ea100fb50bb watchdog: rzg2l_wdt: Remove reset de-assert from probe
    b222816f9c43 of: address: Preserve the flags portion on 1:1 dma-ranges mapping
    443f803b332b of: address: Store number of bus flag cells rather than bool
    7a40a884f597 of: address: Remove duplicated functions
    6681113633dc x86/hyperv: Fix hv tsc page based sched_clock for hibernation
    e5b1574a8ca2 x86, crash: wrap crash dumping code into crash related ifdefs
    5422f4321640 thunderbolt: Don't display nvm_version unless upgrade supported
    5a23e3e9e245 thunderbolt: Add support for Intel Panther Lake-M/P
    888c554d3dfd thunderbolt: Add support for Intel Lunar Lake
    6cd8e621a689 xhci: Turn NEC specific quirk for handling Stop Endpoint errors generic
    f1ece345ad2c usb: xhci: Limit Stop Endpoint retries
    61329b25dc1d xhci: retry Stop Endpoint on buggy NEC controllers
    43e3aa2f44d6 net: renesas: rswitch: fix possible early skb release
    3dd65ffa2df6 softirq: Allow raising SCHED_SOFTIRQ from SMP-call-function on RT kernel
    d6616dcd8721 net/mlx5: unique names for per device caches
    ddcc7d71be31 Revert "nvme: make keep-alive synchronous operation"
    801acf741c87 nvme: use helper nvme_ctrl_state in nvme_keep_alive_finish function
    2c276bef8273 usb: typec: ucsi: glink: be more precise on orientation-aware ports
    7723988b0127 usb: typec: ucsi: glink: set orientation aware if supported
    01059e0b5cc0 usb: typec: ucsi: add update_connector callback
    fd662c37a108 usb: typec: ucsi: glink: move GPIO reading into connector_status callback
    8dd7fc5e409b usb: typec: ucsi: add callback for connector status updates
    c47940e84398 iio: adc: ad7192: properly check spi_get_device_match_data()
    843b5d1602d6 iio: adc: ad7192: Convert from of specific to fwnode property handling
    f7d548a62f08 usb: chipidea: udc: limit usb request length to max 16KB
    7a2020e83b6a usb: chipidea: add CI_HDRC_HAS_SHORT_PKT_LIMIT flag
    c39df6d3af2d usb: chipidea: add CI_HDRC_FORCE_VBUS_ACTIVE_ALWAYS flag
    c2556801583c fs/ntfs3: Fix warning in ni_fiemap
    48ebb93f933d fs/ntfs3: Implement fallocate for compressed files
    171c40531b04 remoteproc: qcom: pas: enable SAR2130P audio DSP support
    b506a0c41411 remoteproc: qcom: pas: Add support for SA8775p ADSP, CDSP and GPDSP
    25804f9b492b remoteproc: qcom: pas: Add sc7180 adsp
    3c9d3157f3cc mailbox: pcc: Check before sending MCTP PCC response ACK
    d8c0f38208a4 ACPI: PCC: Add PCC shared memory region command and status bitfields
    4460b5236818 i2c: xgene-slimpro: Migrate to use generic PCC shmem related macros
    dcc02c9ebfe8 mailbox: pcc: Support shared interrupt for multiple subspaces
    605018764e21 mailbox: pcc: Add support for platform notification handling
    82461d89c849 clk: qcom: clk-alpha-pll: Add NSS HUAYRA ALPHA PLL support for ipq9574
    deff81f56dff clk: qcom: clk-alpha-pll: Add support for zonda ole pll configure
    7c8c50c9855a scsi: hisi_sas: Create all dump files during debugfs initialization
    044928679823 scsi: hisi_sas: Allocate DFX memory during dump trigger
    91e035e98fa1 scsi: hisi_sas: Directly call register snapshot instead of using workqueue
    4f4fe3db92bb Bluetooth: btusb: Add new VID/PID 0489/e111 for MT7925
    f8a67ffb96c9 Bluetooth: btusb: Add USB HW IDs for MT7921/MT7922/MT7925
    1e7b1a8e7b6e Bluetooth: btusb: Add new VID/PID 13d3/3602 for MT7925
    e612c16ed0b7 Bluetooth: Add support ITTIM PE50-M75C
    ca4e69826d67 Bluetooth: hci_conn: Reduce hci_conn_drop() calls in two functions
    6e6a3479986a i2c: i801: Add support for Intel Panther Lake
    f38ca98b0721 i2c: i801: Add support for Intel Arrow Lake-H
    b35de9e01fc7 wifi: ath10k: avoid NULL pointer error during sdio remove
    358c36eae58d wifi: ath10k: Update Qualcomm Innovation Center, Inc. copyrights
    3ed6b2daa4e9 wifi: ath12k: fix atomic calls in ath12k_mac_op_set_bitrate_mask()
    dc6094108573 wifi: mac80211: Add non-atomic station iterator
    4eceef729c84 wifi: ath12k: Optimize the mac80211 hw data access
    3d94c4b21966 wifi: rtw88: use ieee80211_purge_tx_queue() to purge TX skb
    24b5898a8c73 wifi: mac80211: export ieee80211_purge_tx_queue() for drivers
    ed01e57a8169 media: uvcvideo: Force UVC version to 1.0a for 0408:4033
    9471b8f80526 media: uvcvideo: Force UVC version to 1.0a for 0408:4035
    8fa6f680b5aa cleanup: Adjust scoped_guard() macros to avoid potential warning
    873df38bdf42 cleanup: Add conditional guard support
    4b6beff3c073 crypto: ecdsa - Avoid signed integer overflow on signature decoding
    ec6488917941 crypto: ecdsa - Use ecc_digits_from_bytes to convert signature
    1afc7acbedb8 crypto: ecdsa - Rename keylen to bufsize where necessary
    e7fcd5d696c4 crypto: ecdsa - Convert byte arrays with key coordinates to digits
    93011887013d ext4: partial zero eof block on unaligned inode size extension
    fa42d5f1327f ext4: convert to new timestamp accessors
    1864d4712c4b memblock: allow zero threshold in validate_numa_converage()
    6fdc770506eb NUMA: optimize detection of memory with no node id assigned by firmware
    3adf89f17dbd sched: Initialize idle tasks only once
    106740e978c7 usb: dwc3: gadget: Add missing check for single port RAM in TxFIFO resizing logic
    39619c65ab4b smb: client: fix use-after-free of signing key
    d7cb986425ce smb: client: stop flooding dmesg in smb2_calc_signature()
    5f36890d650c fs/smb/client: implement chmod() for SMB3 POSIX Extensions
    d64429042fef smb/client: rename cifs_ace to smb_ace
    298e73ac323a smb/client: rename cifs_acl to smb_acl
    46c22d37f691 smb/client: rename cifs_sid to smb_sid
    386660bd303e smb/client: rename cifs_ntsd to smb_ntsd
    8322a66f9369 x86/mm: Carve out INVLPG inline asm for use by others
    bffaf4cb2810 docs: media: update location of the media patches
    e8b8c1ecbd2c drm/amd/display: Fix incorrect DSC recompute trigger
    3f9f631f9b91 drm/amd/display: Fix DSC-re-computing
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
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 67123136b0..607c70955a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3a66d8b7000a5efea50ccd9c2c8d0955dcf40c72"
-SRCREV_meta ?= "dff911ce87fe7b9944c6058907f079ddb0f3e840"
+SRCREV_machine ?= "94762e4ed9eafc254a5522cf9107e2f450f79dc8"
+SRCREV_meta ?= "e102afe47d66b37aa6b378c86cdea4b31065ae9e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.69"
+LINUX_VERSION ?= "6.6.71"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index e48dae1160..08cb37e6d2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.69"
+LINUX_VERSION ?= "6.6.71"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c556adf7d54204d713252722b27f5bfe25cd8620"
-SRCREV_meta ?= "dff911ce87fe7b9944c6058907f079ddb0f3e840"
+SRCREV_machine ?= "b51e4ee5e3c342d2035ff50e24e438810bb51b02"
+SRCREV_meta ?= "e102afe47d66b37aa6b378c86cdea4b31065ae9e"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 05bf773c1f..afc66b57db 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "b9db0f967e89de853fa737c164907c4ee111a489"
-SRCREV_machine:qemuarm64 ?= "c556adf7d54204d713252722b27f5bfe25cd8620"
-SRCREV_machine:qemuloongarch64 ?= "c556adf7d54204d713252722b27f5bfe25cd8620"
-SRCREV_machine:qemumips ?= "6cdf7de2dc6c90e973201f52871a3301ec822226"
-SRCREV_machine:qemuppc ?= "c556adf7d54204d713252722b27f5bfe25cd8620"
-SRCREV_machine:qemuriscv64 ?= "c556adf7d54204d713252722b27f5bfe25cd8620"
-SRCREV_machine:qemuriscv32 ?= "c556adf7d54204d713252722b27f5bfe25cd8620"
-SRCREV_machine:qemux86 ?= "c556adf7d54204d713252722b27f5bfe25cd8620"
-SRCREV_machine:qemux86-64 ?= "c556adf7d54204d713252722b27f5bfe25cd8620"
-SRCREV_machine:qemumips64 ?= "c8da027284e8c7ece7e04dcdd1cf49850fea911d"
-SRCREV_machine ?= "c556adf7d54204d713252722b27f5bfe25cd8620"
-SRCREV_meta ?= "dff911ce87fe7b9944c6058907f079ddb0f3e840"
+SRCREV_machine:qemuarm ?= "f4dc412f65b7baa317fb5ea3a0652f7b2b93a22b"
+SRCREV_machine:qemuarm64 ?= "b51e4ee5e3c342d2035ff50e24e438810bb51b02"
+SRCREV_machine:qemuloongarch64 ?= "b51e4ee5e3c342d2035ff50e24e438810bb51b02"
+SRCREV_machine:qemumips ?= "c02dd1cd1dad8fb69fe02b65aeea1263f7e32e8e"
+SRCREV_machine:qemuppc ?= "b51e4ee5e3c342d2035ff50e24e438810bb51b02"
+SRCREV_machine:qemuriscv64 ?= "b51e4ee5e3c342d2035ff50e24e438810bb51b02"
+SRCREV_machine:qemuriscv32 ?= "b51e4ee5e3c342d2035ff50e24e438810bb51b02"
+SRCREV_machine:qemux86 ?= "b51e4ee5e3c342d2035ff50e24e438810bb51b02"
+SRCREV_machine:qemux86-64 ?= "b51e4ee5e3c342d2035ff50e24e438810bb51b02"
+SRCREV_machine:qemumips64 ?= "5e505449aebd58bbcfc93819843c64f56d939917"
+SRCREV_machine ?= "b51e4ee5e3c342d2035ff50e24e438810bb51b02"
+SRCREV_meta ?= "e102afe47d66b37aa6b378c86cdea4b31065ae9e"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "a30cd70ab75aa6b7ee880b6ec2ecc492faf205b2"
+SRCREV_machine:class-devupstream ?= "843e64492a7ed11436cc5c9bbfba46835939071a"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.69"
+LINUX_VERSION ?= "6.6.71"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


