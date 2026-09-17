Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D33D3C982D5
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 05:13:57 +0000 (UTC)
Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32803.1789622030665760108
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 22:13:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Uciv7tMC;
 spf=pass (domain: gmail.com, ip: 74.125.230.205, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb769ca02so4049841cf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 22:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789622029; x=1790226829; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QTyfwlJ+3k1bR0W4PdQjxrnnJBjMQoZJZ464hywL8WA=;
        b=Uciv7tMCeg5bYzMeimzhZidt4eiAdDLYYUfajP7YlEXPUYQ8a7zaH9jk8hbBw4ounD
         74tFelHn6dzVBNV1Ct0srSTX6B+6QXuktixvT+hdC1OTcRlJIr780mKkXkNgzJNbER6p
         TeDENzu+Tm5DF1oIVb7ou4CaIE4MqKTL2kUj3t0XD/Lsf41xhGpYQ2MZpt0CQrw8faCh
         ekWa1mEE274k5JPS9okYtZ1uXQ/8h/57IDw3bqMtNelRxTMXK0n1Gtj6Sa7JQiWSCJ8e
         N35ig+RCGxHJ84OvgfKuZm7+XInz50G87jArYqbOljj/QVMDG7TDQOklxLVy9hJyfRW7
         wCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789622029; x=1790226829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QTyfwlJ+3k1bR0W4PdQjxrnnJBjMQoZJZ464hywL8WA=;
        b=cekRy0PNNAmIV/MWtfKMk9N4miUd8NnuNwmRmVDKRRcGnVzXhbRiCijtcqNc4HO2RH
         VKYEpXMpkP9ZiTpNUk8xTtrxWIZX3XaWfVskeJfuVDGiXotZAw0O9o8z8V+r4967IsYl
         NLwOpH9YieehZ66Jnoxi4lxuxzIjfYgxjZXzmGWGo4LzLg2n9W9cIga7SYjCz5F6uNiG
         nslV31OpcbOMX19QZYOEKZO4fuQx7q2SsvYkJp3MfdODTnDQ2yfc27TSUC3BkynzYWQ4
         8M3EzBCR5Xg+9kks8UGbunrIPV3CzSd837m2nFosLkpv/p/Dm2lgRuYmo57Wrns0C0fa
         DF3Q==
X-Gm-Message-State: AFuF++lTvSuqU+2jkoCiWNEYv0TGZCXLjLxXtDCC0xaZH+zTI0Igaz81
	WDEqw7VO6S+QegmfYmEOMXa+oOihCxaO2PEj/84G7Xb8a/PTrDI/Sii4Aktrer4s
X-Gm-Gg: AYBFou24I2+Gt9uTPrxQX7bxHqLdzD7Dh4lA4bxh8li+YGmku1sBZqfZ9QnEPl/HwU5
	cD5hm+L3P3czcalC5wuoDA/aIB0DKzveFvgWsB4JW68/ainNsaRsvgFSAKHGJ2MwCRtRmhztkc6
	/VlmeG7cUFQ37WpyyC7YHfWAx7qFthpw6rwN9jsyQAzIuf8Lu7NAmcvGj15Rdms8FaA4G9RGeVi
	flbDUEopHybPKwzhz3pZmt+l+RAscLsuTuZrm1c9arENERhIeyGga5DTU5sFsEQoBCH9e+vHekx
	whrSjyUR4S9sp7K6LoQK4GRkWUISSdBrZ7jTEtmg6Zh0/Hq8VEacB4wVMvL7Z7Dd8xi6b6e/FN1
	sNmF/mmee+tsvlFxGoUm8XRlId/e1cxovXr3OH18qWX9hhdqZR9r8/7X03Ue80cHsF0pX9iNNc3
	mB6HPlRk34wbL4aQwifIDIJFO9v8TnuiJe78OlqPySy1bQo58LeOwWhuP5id+bk9lf8WX2TXYO3
	abOsqx2sA0LXTa7UEwCnK+BhYMAxEC1E0EDR/HCjFex17n5VcpS9N+ZUrJ/dOZbof1Jdv7wwNg7
	aYOODffAUsYCCTH1mDys217HV0YdvSY9dJxnDOPFsdgCXCDHMJEJsVJRZrS8h9IjtZC+/qgPrvo
	j2GuMMQuXkwM/8wegjZttmssZAw==
X-Received: by 2002:a05:622a:5c16:b0:530:f73a:90b4 with SMTP id d75a77b69052e-5327f1f5f4dmr114657501cf.62.1789622028153;
        Wed, 16 Sep 2026 22:13:48 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53261fd4cc4sm39481161cf.6.2026.09.16.22.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 22:13:46 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 03/06] linux-yocto/7.2: update to v7.2.6
Date: Thu, 17 Sep 2026 01:13:36 -0400
Message-ID: <20260917051340.1472139-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917051340.1472139-1-bruce.ashfield@gmail.com>
References: <20260917051340.1472139-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 05:13:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246014

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/7.2 to the latest korg -stable release that comprises
the following commits:

    500df175a7f9e Linux 7.2.6
    61a8d06600c8c ksmbd: prevent out-of-bounds reads in share config responses
    1f0085f15004d perf python: Add missed explicit dependencies
    8f57985e30a28 perf ui hists: Fix dso_filter reference leak and exit zoom cleanup
    078aca7b80513 perf hists browser: Increase MAX_OPTIONS to prevent stack buffer overflow
    72e9387884554 net/sched: fq: clamp quantum and initial_quantum in change path
    b04326c7927af tcp: reject non zerocopy devmem tx
    2bfcedbf68cbd Revert "esp: do not unref managed frag pages in esp_ssg_unref()"
    dd08a645195f4 dm-integrity: fix buffer overflow with keyed discard
    872317e84fd01 net/sched: sch_htb: limit htb_classify inner-class filter hops
    47eb90299e688 tcp: fix corruption of urgent data on multi-segment retransmit
    7566770311515 usb: atm: usbatm: fix invalid ci_range initialization
    5975009651c4e net: fec: only stop PTP if it was initialized
    a540a49fcca59 slip: remove slip_hangup() to fix use-after-free in slip_receive_buf()
    16d21a27df3f5 net/sched: bound qdisc_pkt_len to prevent qdisc soft lockup
    a9d88c79746cf net: dsa: mxl862xx: enable assisted learning on CPU port
    c0d3f9560cc89 net: stmmac: restore NET_IP_ALIGN in the RX DMA offset
    b445030cca1f6 net: stmmac: drop gso_enabled_types and rely on netdev features
    482b2542eeb82 net: stmmac: selftests: Don't test flow control for small rx fifos
    5a106e59b0519 net: stmmac: selftests: Account for the UC filter list for filtering tests
    d1fad6804be2a net: stmmac: dwxgmac: Account for the primary MAC address for UC filtering
    10cf85addedeb net: stmmac: dwmac4: Account for the primary MAC address for UC filtering
    db57c2c4eaa52 net: stmmac: dwmac1000: Account for the primary MAC address for UC filtering
    756932d2c6a0b net: stmmac: selftests: Check multiple MMC counters
    2bbd61823f227 drm/xe/sysctrl: Read mailbox phase bit from hardware
    08f8c20feca96 drm/xe/xe_ras: Add support to get error counter value
    da853f3304495 drm/xe/uapi: Add additional error components to xe drm_ras
    1ffe1bd34b497 net: airoha: npu: fix missing streaming DMA mask
    fc3ee01090856 selftests/arm64: Fix MTE prctl TAP plan
    5791116f96d4f selftests/arm64: Treat KSM merge_across_nodes as optional
    a327373156bb5 selftests/arm64: Print missing MTE TAP headers
    18c08f84ca483 ALSA: control: Don't add invalid kcontrols to LED layer
    1e7fb6801d9cc netfilter: nf_tables: skip double clone set expressions on element insert
    0044a4b853728 netfilter: x_tables: replace pr_{info,err}() by pr_info_ratelimited()
    6a7d3b074cfbb netfilter: nf_tables: move hardware offload step after building the chain blob
    75c271c48f483 virtio-net: Ensure that TCP packets don't overflow gso_segs
    905d648e97ef3 drm/xe: Reject page faults from non-fault-mode scratch VMs
    9cc86bf96cfc3 drm/xe/xe_gt_idle: Add CCS to the powergating info print
    2f1fac18cbe80 drm/xe: Do not apply WA 14025883347 to media 3503
    1b871710ae9f6 net: stmmac: selftests: Pass the IP proto mask in the TC selftest
    dadcbaa98de3f net: wangxun: use BIT_ULL() to prevent shift overflow on 32-bit archs
    a32c4a6dc96cc net: phy: air_en8811h: move LED GPIO configuration to config_init
    94a913cd521c0 net/smc: release the internal TCP sock on IPPROTO_SMC socket creation failure
    ff481b7ba651d net: ethernet: sun4i-emac: Fix IRQ error handling
    2e658329d7749 ASoC: amd: acp-config: change quirks to cover all ASUS FA401EA variants
    cf839636911d8 samples/ftrace: Fix kthread_stop() on ERR_PTR in ftrace-direct-multi-modify
    84b5c7670a867 samples/ftrace: Fix kthread_stop() on ERR_PTR in ftrace-direct-modify
    c77633a959565 libceph: validate banner payload length
    36138bde421a3 ceph: revalidate ki_pos for O_APPEND writes after cap acquisition
    c5fd89f5e1273 ceph: Fix ERR_PTR(0) in ceph_mkdir()
    55126ef66298e ASoC: dapm: Fix off-by-one check on the second enum channel
    8968852e664f4 of/irq: Fix device node refcount leak in of_irq_get_affinity()
    dd52ab1c5436b apparmor: policy_int make sure list heads are initialized before fail path
    889fa17a0af09 crypto: acomp - allocate async request context when cloning
    f0e06321c70e9 tpm: st33zp24: Validate locality read result
    e6d7d9b665419 tpm: st33zp24: Return zero on status read failure
    0cd7503794856 net/sched: sch_teql: restore skb->dev on the slave failure path
    da16c31517cd2 net/sched: sfq: clamp quantum to avoid signed overflow soft lockup
    2446644b0f6d0 net/sched: hhf: clamp quantum before hhf_change() to avoid overflow
    bf97fd2163ad1 net/sched: fq_pie: clamp default quantum to avoid signed overflow
    f2fe291fbf71c net/sched: sch_codel: clamp default mtu to avoid disabling CoDel
    9f499e5827fdb net/sched: fq_codel: clamp default quantum and mtu
    e35acd56f244d net/sched: fq: add overflow bounds to quantum and initial quantum
    e69bde4eb566a net: fix a resource leak in copy_net_ns() error handling path
    efb4cdd8d72bd net: core: check skb_frags_readable before uncloning in skb_copy_ubufs
    62126464f3a61 net/sched: act_skbmod: fix length calculations and avoid invalid header warnings
    0f0f3df2bde2e selftests/proc: make proc-maps-race work with READ_IMPLIES_EXEC
    7efd495853aeb maple_tree: fix argument name in header
    dfe9ee26a9ad0 maple_tree: catch race in mas_alloc_cyclic()
    21aea0891c204 mm/memcontrol: avoid false sharing between vmstats and events
    3b06d0cc81547 selftests/mm: fix read_file() return value check
    8625208f464ef selftests/mm: skip COW tmpfile cases when fallocate() is unsupported
    f6ec40d1e4f17 smb/client: preserve open info type across compound queries
    a58270c1b3445 cifs: fix clearing stats for fastest execution of each smb2 command
    a0fcbea79f034 octeontx2-af: fix cn20k mailbox lifetime on repeated rvu_mbox_init()
    7e33c6bd049b5 octeontx2-pf: fix NULL deref of af_xdp_zc_qidx on rep setup
    281f9fda2e06d net/rds: use wq_has_sleeper() in rds_cong_map_updated()
    4f9827b314ee5 net: mana: Cap MSI-X vectors to the device MSI-X table size
    138b0054021fd net/sched: act_ife: Only operate on Ethernet frames
    a93b72eb2f5a8 net: enetc: restore RX ring congestion mode for ENETC v4
    18ca1be8426aa net: enetc: remove invalid code from enetc4_pl_mac_link_up()
    1039c56c4c99f net: enetc: improve MAFT entry management with bitmap tracking
    d25a4a481cfbe net: enetc: convert ndo_set_rx_mode() to ndo_set_rx_mode_async()
    c77effb3edb82 net: enetc: extract common helpers for MAC hash filter configuration
    ccdc23869332a net: enetc: extract common helpers for MAC promiscuous mode setting
    1a20660772b67 net: enetc: restore RX ring congestion mode after ring reconfiguration
    b3235a8790a1a octeontx2-af: Fix TL3/TL2 link config ENA clearing
    200460a0793dc net: qualcomm: rmnet: restore skb->dev on deaggregated frames
    ef42c9e922dfa octeontx2-vf: fix workqueue and netdev race in probe/remove
    2f460aa0211e9 octeontx2-af: fix out-of-bounds read setting MSI-X irq affinity
    fdf7358e2688f octeontx2-af: fix NULL deref in NIX TM tree debugfs read path
    8d85498016a5b gtp: add synchronize_net() in gtp_newlink() error path to prevent use-after-free
    bf9387488d639 xsk: honor XDP_TX_METADATA in zero-copy path
    0e00ea9e97a39 xsk: align TX metadata layout across ABIs
    2eafcf310f4e0 Bluetooth: do not leak an hci_conn when a second LE connect is rejected
    3988cbb1be501 Bluetooth: RFCOMM: Validate MTU in rfcomm_apply_pn() to prevent infinite loop
    22d419db7f9a0 Bluetooth: btnxpuart: Validate the FW dump header length
    94a71da6d6b37 Bluetooth: hci_sync: add conditional locking annotations
    7b80d2701a684 Bluetooth: btmtksdio: Fix out-of-bounds DMA read in the TX path
    d84bc309288b2 Bluetooth: btmtksdio: Take exclusive ownership of the SKB before TX
    956b5a979b0df Bluetooth: btmtk: Do not discard the subsystem reset timeout
    820e64cb52dbf Bluetooth: btmtk: Do not report success when subsys reset fails
    32a7bc6e93be3 Bluetooth: L2CAP: fix race l2cap_sock_cleanup_listen() vs. put_chan
    ee2135a14fb2a Bluetooth: mgmt: fix 'hdev->discovery.uuids' NULL dereference
    c47339e169bf4 Bluetooth: L2CAP: reject accept queue add unless BT_LISTEN
    f49321c857851 Bluetooth: L2CAP: access chan->conn safely in get/setsockopt
    a34fb2fa48fbf f2fs: use adjusted write range after f2fs_write_checks()
    2f10bc3ff24c9 arm64: process: Fix context switching MTE store-only tag check
    ae0cfa9772982 arm64: ptdump: Make note_page_flush() range aware
    8f9a725d89711 fuse: Fix the condition to enable over-io-uring
    f940f3d3fd0bb fuse: use release/acquire for fch->initialized
    833963069adf8 fuse: invalidate the correct range after O_APPEND direct write
    faef603939f26 erofs: Fix EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS default logic
    31d299e7d5539 scsi: qla2xxx: Fix an loop timeout test
    4c19c302cc577 Drivers: hv: vmbus: Skip VMBus module cleanup for non-nested root partition
    55d87e888ca1f net/sched: sch_cake: fix autorate reconfiguration throttling
    4384d152e10df net: hibmcge: fix page_pool DMA direction mismatch
    2e5b1f6ee74aa net_sched: sch_fq: fix pacing delay underflow with pacing offload
    72895242ee741 net: page_pool: Remove zone/policy GFP flags when allocating XArray entries
    7d63522f9e590 net: libwx: fix concurrent bitmap overwrite in PTP setup
    c6dfa6dc37d74 net: txgbe: fix MISC interrupt unmasking in non-MSI-X mode and device shutdown
    648d196ccc03a net: sparx5: fix sleep in atomic context in MAC table access
    9057547877624 net: microchip: vcap: use port number instead of netdev name for debugfs
    18c68c8f3d3ff net/sched: account classifier filter allocations to memcg
    08988d1941e18 ptp: netc: fix period truncation and potential divide-by-zero in PEROUT
    98b4998733553 bnxt_en: Gate TPH enablement behind BNXT_SUPPORTS_QUEUE_API check
    b17907ef665bc bnxt_en: Fix call to hardware monitoring event handler
    1cd4b0a184db6 ASoC: fix unmet dependencies on PPC_BESTCOMM and SND_SOC_AC97_BUS
    5d542be0c4921 rtc: pcf85363: Add error checking to regmap calls in probe()
    bbc975cfb07a1 NFSv4/pnfs: key the data server cache on the NFS version
    a973622da0c62 NFSv4.2: fix LAYOUTSTATS send buffer exhaustion
    f31f3c042e024 NFSv4.1: zero referring call lists before decoding
    ecc8bac11a101 vxlan: fix reading neigh ha
    291c9e137b7c7 net: bridge: arp/nd proxy: fix reading neigh ha
    5ff429dd6725f net/smc: free pending qentry in smc_llc_flow_stop() before memset
    e25a602c45c76 net/smc: free stashed qentry before overwrite in REQ_ADD_LINK to ADD_LINK transition
    b2479738ba765 powercap: intel_rapl: Sign-extend the PMU delta on counter wraparound
    d98b92f3d5797 net: sched: fix 32-bit backlog wrap in gred, bfifo and plug enqueue
    bc4e67c9399c7 net: tcp: block mixing readable and unreadable frags
    7109bb63667a5 inetpeer: randomize RB-tree node comparison using SipHash
    4a674afaae413 ip6mr: do not clone dst in ip6mr_cache_report()
    684773c4d26f7 net: qlcnic: validate unified ROM sections before loading
    35a6026eadcb8 net: add missing ref_tracker_dir_exit() to net_passive_dec()
    f82b5dbb2fef6 ipv6: avoid divide by zero in rt6_multipath_rebalance
    db038ac4dca0f netdevsim: update queue NAPI association on queue reset
    f5d53818ba923 net: ipa: balance runtime PM reference on remove error
    976e92931c28e forcedeth: stop the tx_timeout register dump past the requested window
    d52c695b6980b net/mlx5: E-Switch, preserve max tx speed on vport state modification
    8a9a3ccdc35e1 net/mlx5: Move vport DOWN state check out of mlx5_query_vport_max_tx_speed()
    19dd112279167 net/mlx5: E-Switch, use state lock for vport state changes
    21c0a41260e4b net: thunderbolt: Count delivered packets in rx_packets and rx_bytes
    a5ce5b5aacd01 net/sched: add get_fill_size callbacks for actions missing them
    434849b21ef56 net: bridge: Reject descending VLAN tunnel ranges
    8341bd3ff126d xsk: fix NULL pointer dereference in __xsk_rcv()
    e50df85ac835f irqchip/irq-realtek-rtl: Use readl_be()/writel_be() instead of readl()/writel()
    12f903cfacb48 irqchip/irq-realtek-rtl: Add mask for interrupt handling
    7dd58ec1bbd41 irqchip/irq-realtek-rtl: Add interrupt data structure
    1f0b4680d3b5a irqchip/irq-realtek-rtl: Split out parent setup code
    6c94e5f95258b smb: server: remove unused DES crypto header
    93fb16a86d5db smb: server: Remove obsolete "select CRYPTO_LIB_DES" from Kconfig file
    1e16e82581521 ALSA: mtpav: shut down output timer before card teardown
    24d81b7299200 drm/xe: don't WARN on kernel job timeout when device already wedged
    5969a3df8361a spi: amlogic-spisg: Make sure clk_init_data is fully initialized
    e46ef54fe4d9c RDMA/ucma: Allow path records to exactly fit the output buffer
    ea5a3c3071071 ntfs: validate usa_ofs before preserving the update sequence number
    b42644e425fed ntfs: fix off-by-one page overflow in ntfs_decompress()
    e52c8cd7e7544 sched/topology: Add a cpus_read_lock to rebuild_sched_domains()
    24b399f51812d ALSA: ice1712: Fix the card leak at probe error with the auto-cleanup
    ae344ed82795b irqchip/gic-v5: Defer default SPI and LPI IAFFID programming
    3958493a70ced irqchip/gic-v5: Use logical cpu 0 irs_data for dynamic IST allocation
    7c10ec4987b78 irqchip/gic-v5: Release IRS iomem region on driver init failure
    7b7201493383e irqchip/gic-v5: Fix gicv5_init_common() error paths
    69f0c79f5b692 irqchip/gic-v5: Disable IRSes on probe failures
    f43bdac1ae484 irqchip/gic-v5: Check for NULL LPI domain on domain teardown
    6caeb878f809b irqchip/gic-v5: Check get_logical_index() return value in MADT IAFFID parsing
    a7c0415209243 irqchip/gic-v5: Synchronize CPU interface disable
    54937af6f4a0d irqchip/gic-v5: Clear per-CPU IRS data on teardown
    69212cccf4f90 irqchip/ast2700-intc: Disable all interrupt merge banks on probe
    5ecfa72e74c6e clk: visconti: Make sure clk_init_data is fully initialized
    c1c6d311fa830 clk: ti: Make sure clk_init_data is fully initialized
    6234b08fbc4b6 prctl: fix PR_SET_MM_AUXV losing the forced AT_NULL terminator
    56ae1f0b08400 lib/interval_tree: fix allocation warning messages
    63337be8f5c43 rtc: gamecube: check return value of devm_rtc_register_device()
    c80e3c69cf197 i2c: ocores: Disable clock on failed resume
    f2f0da1164861 irqchip/ast2700-intc: Avoid allocating in the irq_domain activate() callback
    dbecbe23dc606 irqchip/renesas-rzg2l: Fix loss of interrupt
    3f00d8a5e16c0 rtc: zynqmp: Return optional clock lookup errors
    a24926c513037 cifs: remove dead size-update blocks in cifs_setattr_unix/nounix
    7ec4098359b9a smb: client: set replay flag on the read send-error retry path
    73f6bdb038048 smb: client: fix request buffer leak in smb2_new_read_req()
    12f124ec61c74 smb/client: return EOPNOTSUPP for unsupported O_TMPFILE
    9a4d2ef7e72b9 rtc: spacemit: handle regmap_test_bits() error return
    6218c0533a722 rtc: pcf8563: fix clock provider leak on unbind
    afbf69d1d691c virtio: rtc: time out alarm requests
    c678d04ac9e5a vdpa/mlx5: fix wrong list iterated in add_direct_chain error path
    89b4d033a4b53 virtio_pci: fix wrong queue index for admin vq in intx path
    43a8e02dc826d vhost/net: fix clear_user start address in VHOST_GET_FEATURES_ARRAY
    bdef50a8226fc virtio_balloon: quiesce balloon work before device shutdown
    1ac4c32198b83 virtio_balloon: factor out virtballoon_quiesce()
    fcbba617b38cb virtio: add virtio_device_shutdown() helper
    ca6f3fa599cb7 vdpa_sim: fix cleanup after worker creation failure
    2ee4d24c88c48 virtio_balloon: disable indirect descriptors
    14dca701e72a1 ntfs: do not update ctime when setxattr fails
    0400e0d50eb3b ntfs: serialize resident iomap reads with mrec_lock
    9d1b68f3dd11a ntfs: convert iomap ops to ->iomap_next()
    95dc8483f2d70 iomap: add ->iomap_next()
    8a255824aa000 iomap: split iomap_iter() logic into iomap_iter_next()
    95d7098561e51 ntfs: allow index root relocation
    86f46508016bc ntfs: reject unprivileged writes to reserved $LX* xattrs
    25a70f2ea77ef ntfs: respect per-file chmod mode over mount masks
    6028b94f28d9a ntfs: apply Windows name checks only with windows_names
    825dec5120933 ntfs: Fix index_root heap OOB write in ntfs_ir_to_ib()
    950e2ecc7aec2 ntfs: fix kmap_local_page() usage in compress
    825f4476ea60b ntfs: Remove references to page->__folio_index
    20224191755b0 ntfs: Use zero_user_segment() in handle_bounds_compressed_page()
    cfa877fdae270 ntfs: Remove use of __folio_index in handle_bounds_compressed_page()
    c13cd1124ec8b ntfs: Inline zero_partial_compressed_page()
    e366735ed2a8a ntfs: rewrite EA stream before updating metadata
    62f39201c0ccd ntfs: remove empty EA attribute pair
    98af5b4ae1385 ntfs: validate final EA attribute size
    9fb0fed1b918d perf vendor events arm64: Fix Tegra410 Olympus event 0x0197
    b3ba86c6c5996 perf vendor events arm64: fix swapped MetricGroup for Tegra410 L1 prefetcher metrics
    4af8e0f7838d4 i3c: mipi-i3c-hci: Fix missing STAT_IBI_STATUS_THLD in PIO mode
    63ab05e8f9654 net: add missing ref_tracker_dir_exit() to alloc_netdev_mqs()
    ba5429c8c43e5 bonding: initialize err for empty target lists
    1058c4379959c mlxbf-bootctl: fix the build error with FIELD_PREP()
    1b0a3d915320f platform/x86/amd/hsmp: Reject negative power cap writes in hwmon
    8a7499b8fd344 platform/x86: hp-bioscfg: fix password encoding bounds check
    0cc59397bbf94 vsock: use sock_error() to consume sk_err after a failed connect
    491b368a0c6e5 vsock: don't check the listener's sk_err in vsock_accept()
    cfcc833cb43b4 platform/x86: dell-wmi-sysman: Fix instance ID bounds
    eddb191cc8d68 net/smc: hash socket only after full initialisation in smc_sk_init()
    b4ce1c461a49a 8139cp: fix Rx and Tx not being disabled in cp_suspend
    f26400b325bdc vxlan: mdb: Fix use-after-free in vxlan_mdb_flush()
    44764dc4b9f9b ALSA: hda: Fix connection list comparison in proc output
    509f4a09bae7f fuse: check for NULL root inode in fuse_fill_super_submount
    710bbbbb66c7b soc: qcom: ubwc: Fix missing include
    236d65ecf3777 fuse: reject a duplicate fd= mount option
    c8a109c9e23a2 fs/ntfs3: validate ef->size covers the record's name and value
    53e56f7aa1d0f fs/ntfs3: fix out-of-bounds read in read_log_rec_buf()
    c40f3f24839f8 cuse: wait for pending RCU callbacks on module exit
    0dffaa477c2d5 net: bridge: vlan: fix inverted default vlan notification
    adb27c5665bd2 tls: fix RX desync on overlapping skbs
    38ce7de7215ad net: dsa: mv88e6xxx: Fix PCS link check on CMODE read error
    ad32e564c62eb vxlan: vnifilter: enforce exact length of GROUP/GROUP6 attributes
    b1908bff0faaa ipvs: fix integer overflow in ftp helper port/address parsing
    454c59ef2dd0b netfilter: ctnetlink: do not expose expectation DEAD flag
    6a31c661ba1e1 netfilter: ipset: remove need to allocate memory on delete operations
    44ff26872e241 f2fs: fix to avoid pinfile fragment on fragment:{block, segment} mode
    87abc928271cb f2fs: cleanup w/ f2fs_need_rand_{blk, seg, seg_blk}
    8344c9233c8f7 virtio_net: Fix resize of the RX ring
    49b01f2939abc net: hsr: free learned nodes on device setup failure
    23fc79697224c pppox: drain queued packets on channel handoff
    93462180871bb net: dsa: b53: fix error propagation from b53_fdb_dump()
    f392affef3c9c net: kcm: Hold RCU read lock while running BPF parser
    fdbf04e3e01a8 dpll: fix NULL deref in dpll_device_ops() during teardown race
    122d0db84b11c ionic: fix completion descriptor access with 2x desc size
    242d2d8bfc09f ionic: add missing dma_rmb() after the completion publish check
    8ed5e2a3c306d ptp: netc: skip PEROUT disable if channel is not enabled
    851f2f82483dd drm/xe: tests: fix error message in xe_migrate_sanity_test()
    96c3959770386 hinic3: Fix skb linearization mismatch and drop skb when skb_checksum_help() failed
    bcd89fdf033ba octeontx2-af: initialize lmac_bmap in rvu_mcs_set_lmac_bmap()
    677b4c6e8c27c can: m_can: Use of_property_present() for wakeup-source
    03022dd874070 bpf, xdp: move offload check into dev_xdp_install()
    33bcf2dd2fd61 regulator: tps65185: wait for the IC to wake before the first I2C access
    df9c1cd0c6e8a clk: ti: mux: resolve parent clocks by DT index, not by name
    647157fecb42b clk: devres: fix cleanup in devm_clk_get_optional_enabled_with_rate()
    7582a485870a9 nfs: fix ENXIO on O_CREAT open of existing symlink over NFSv3
    d179ff22cd851 NFSv4: Fix incorrect argument passed to nfs4_delete_lease() in nfs4_add_lease()
    436a214514e24 NFSv4/flexfiles: fix NULL dereference for NFSv4.0 data servers
    c9c67f7107f74 NFS: Fix delayed delegation return list handling
    23e4162405c45 pnfs/blocklayout: Fix device leaks on parse failure
    5891c03e15092 NFSv4: remove callback IDR entry on client allocation failure
    a30e2a3353094 nfs: refactor pNFS functions using clear_and_wake_up_bit
    2e8a725cdb645 nfs: replace atomic bitops sequence with clear_and_wake_up_bit helper
    8e29e6c43f9de selftests/bpf: Retry stat generation in cgroup_iter_memcg
    f075148f3eebb smb/server: fix session counter on session removal
    f31178bb91cdb smb/server: update session counter under sessions table lock
    46bb82a539020 smb/server: warn if ksmbd_proc_create() fails
    c949ea4edccfc ksmbd: add procfs monitoring for active shares
    55c677619084f smb/server: fix session leak in ksmbd_session_register()
    8e4f75e979c1d ksmbd: bound smb_check_perm_dacl() ACE walks by DACL size
    ce92f3cc7ee48 ksmbd: handle encrypted compressed requests
    6f04e11d500b8 ksmbd: decrypt requests from expired encrypted sessions
    9d3ebd8216226 ksmbd: disconnect on SMB3 decryption failure
    0875872718b98 ksmbd: scope session state changes to bound connections
    b9f1aee32d385 ksmbd: fix encrypted request lookup on bound channels
    3fc762f881c98 ksmbd: expire SMB sessions when Kerberos tickets expire
    599dd43e4ba8b ksmbd: validate SMB2 write offsets
    514a0b2bc9499 ksmbd: detach blocked lock requests before freeing
    d09af9a35ff7b ksmbd: safely discard unregistered deferred locks
    31a89af4f513d bpf: Reject negative optlen in cgroup getsockopt hook
    d73441232f1f0 m68k: nfcon: Do not call console_is_registered() in nfcon_device()
    daeb74f5f398e bpf: Disallow bpf_{g,s}etsockopt() in cgroup UNIX getname hooks
    7b6b6bbbfd13e erofs: fix unused pcluster_pools for higher page sizes
    179a5b2171573 lwt_bpf: Restore reserved headroom after xmit program
    1bbdbf56d3586 objtool/klp: Fix vmlinux klp relocations for EXPORT_SYMBOL_FOR_MODULES()
    0f8a4184c00ce erofs: guard on-disk algorithm IDs against Z_EROFS_COMPRESSION_MAX
    451027c642e75 erofs: fix interlaced ztailpacking pclusters
    a1d26dfb32919 ksmbd: defer publishing granted locks to prevent UAF/double-free race
    a54df0ce7a985 ksmbd: recognize replayed SMB2 lock sequences
    9e8faf91bb11e smb/server: preserve error status in smb2_handle_negotiate()
    7d2cd9269b570 smb/server: call ksmbd_proc_cleanup() on module init failure
    fb4ba2bdfc1de smb/server: abort initialization when proc setup fails
    a2eb72b4d53bb smb/server: fix invalid pointer dereference in ksmbd_stop_durable_scavenger()
    7065d3648b1a4 smb/server: fix null-ptr-deref in ksmbd_ipc_tree_connect_request()
    5f97bac88bfb3 ksmbd: serialize oplock close with pending break ownership
    c2b867861a48f ksmbd: add SMB3 request replay support
    50be5e96c381a ksmbd: retain connection for pending notify work
    a34f809167a46 ksmbd: defer CHANGE_NOTIFY completion instead of STATUS_NOT_IMPLEMENTED
    bbeefd3e96645 ksmbd: add AAPL kAAPL_SERVER_QUERY create context support
    8a765fb56ca76 ksmbd: fix durable handle v2 default timeout units (60 -> 60000)
    ac5104f4bd9a9 ksmbd: support access-based directory enumeration
    8e2ebc7767883 ksmbd: free preauth sessions on connection teardown
    8084b5c719670 ksmbd: do not advertise unimplemented CA support
    c494fcf8e89e3 ksmbd: validate ipc response length before dereferencing its fields
    8ea83ef0c40ec smb: smbdirect: release pending child sockets outside the handler lock
    c4de57fd85459 smb: smbdirect: avoid recursive listen.lock during cleanup
    959813a3752b4 smb: smbdirect: destroy QP before mem pools on accept failure
    8a953b1a47fff smb: smbdirect: free completion queues with ib_free_cq()
    497c221bf6b2f ksmbd: fix slab-out-of-bounds read in ksmbd_alloc_user()
    abb5146b2d819 smb: server: fix leak of ksmbd_ipc_login_request_ext() returned buffer
    07a9e289ff7ed ksmbd: Do not skip lock checks for single-byte ranges
    eb287c6e81ded bpf: Check pointer type for all atomic RMW paths
    9cd837ed9efd8 hwmon: (emc1403) Drop hysteresis for low limit temperature
    9b23a010a1e82 hwmon: (coretemp) Fix core_data leak on CPUs without PTS
    072fb5aeec2ea apparmor: fix deadlock in complain-mode change_hat
    c5a6c30e6ee7a selftests/mm: thuge-gen: fix test_shmget() for PAGE_SIZE check
    b389dc35a5571 block: mtip32xx: synchronize ioctls with device removal
    b9cc6cc74daf6 ublk: avoid teardown retry loop on xarray allocation failure
    6220421b97296 ublk: reject non-power-of-2 zone sizes in SET_PARAMS
    b9c16db833e3f blk-iocost: clear delay state when freeing policy data
    02f1b90ab33ef blk-iolatency: clear delay state when freeing policy data
    d3d35dd045a35 null_blk: serialize configfs attribute updates with device setup
    c70994c2862b0 null_blk: serialize configfs attribute stores with the lock
    baff300541a00 null_blk: reject per-device queue resize for shared tag set
    0a3afab871241 null_blk: free zones array on device power-off
    081cf37e8a0e0 null_blk: free global tag_set on init error path
    cab9bf5f68f76 null_blk: register configfs subsystem after creating default devices
    234117949da3b null_blk: use DEFINE_MUTEX for the file-scope mutex
    c7bc5e7677bcd mailbox: riscv-sbi-mpxy: validate RPMI notification lengths
    c362e993e3a55 mailbox: pcc: Fix command timeout due to missed interrupt
    53281c3a89cf9 mailbox: rockchip: disable pclk on probe failure and unbind
    b3d73e7440e0c mailbox: qcom-cpucp: handle NULL data in send_data callback
    e40b3edeaf25c mailbox: qcom-cpucp: fix PREEMPT_RT self-deadlock in IRQ handler
    f445e7be37ce1 perf dso: Replace assert with runtime check in dso__read_symbol()
    94d82e7a95b51 perf dso: Guard against cache underflow on short reads in dso_cache__memcpy()
    b3339e4bd7a13 perf dso: Use stored fd error instead of stale errno in file_read() and file_size()
    2482a7b86a2bd perf dso: Guard close() against invalid fd in dso__decompress_kmodule_path()
    bd98711ed867e perf dso: Guard against errno==0 when dso__get_filename() returns NULL
    a0161780a0b89 sched_ext: Make SCHED_CLASS_EXT select GENERIC_ALLOCATOR
    ed30a1892c630 sched_ext/scx_flatcg: Fix cvtime true-up on slice expiry
    97bdcf58c0d6d sched_ext: Drop unlocked scx_rq_clock_invalidate() from scx_root_disable()
    9e099588ee6aa crypto: lskcipher - propagate errors from unaligned crypt
    ed9ab15652c24 crypto: hisilicon/sec2 - fix CCM algorithm long packet failure
    9eb64cfc95542 selftests/sched_ext: Fix flaky ddsp failure tests on busy systems
    69f5815a0910b bpf: Fix pending_pos walk on 32-bit ring position wrap
    10158c8aa7bb9 selftests/bpf: Fix selftest build after filter.h update
    c98a1abbda871 ACPI: scan: Use acpi_bus_get_primary_device()
    c9d202d3b6c28 ACPI: platform: Use acpi_bus_get_primary_device()
    5657859851abb ACPI: bus: Introduce acpi_bus_get_primary_device()
    0b9053cd0955c ACPI: scan: fix bus ID cleanup on device_add() failures
    6f21453927d0a ring-buffer: Remove trace_buffer::cpus
    71dbd143be598 riscv, bpf: Fix missing sign-ext for signed 1-byte and 2-byte kfunc args
    e62b867143ef8 bpf: Fix arm64 KASAN false positive after bpf_throw
    a3e6a9bd5ee8a selftests/bpf: Use ping_command() for IPv6 pings in lwt_ip_encap
    aa7200c77b8b6 HID: tmff: Use 64-bit arithmetic for force feedback scaling
    351cdfcd097d0 HID: multitouch: reclassify HTIX5288 to WIN_8_FORCE_MULTI_INPUT_NSMU
    72d0b77412aef ASoC: SOF: validate topology volume range before allocation
    3c44b8673baba tracing: Have trace_event_update_all() only handle module that is loading
    2d92c250815cb HID: haptic: don't write an uninitialized value to unhandled usages
    7d9b5e86775fa ALSA: core: Fix use-after-free in snd_card_do_free()
    2b9a0e57bfd36 fs/ntfs3: reject out-of-range evcn in mi_enum_attr()
    169383d8914b8 fs/ntfs3: fix integer overflow in MFT cluster validation
    fa4168538494c bpf, arm64: Fix stack-passed arguments for indirect trampolines
    9b65b0253ad5a net: page_pool: fix UAF in __page_pool_release_netmem_dma on xa_cmpxchg race
    c52f3c102687b scsi: ufs: core: Set task state before io_schedule_timeout()
    e2cd23443d361 scsi: mpt3sas: Avoid freeing unallocated PCIe SGL buffers
    319324b5fbb29 selftests/bpf: Fix for veristat file/prog filters processing
    e4afd90bc7bf3 Squashfs: check block offset is not negative
    1222f7a3183b3 ocfs2: fix circular locking dependency in ocfs2_init_acl()
    418e0ae42fa76 ocfs2: validate DIO orphan slot during inode read
    3d7c4b7ce7b4b ocfs2: validate orphan slot during inode read
    b262056695e89 bpftool: Fix double close in map dump
    97bc6e3f5f9ac x86/pkeys: Fix pkey_alloc() return value when pkeys are not supported
    404b2a460566b selftests/cgroup: Preserve CPU hotplug write errors
    2c23fc91789df nvmet: fix max_qid race between configfs and controller allocation
    282a3ef9e4b63 ALSA: seq: midi: Serialize input teardown with event_input
    67461b9113e74 ALSA: seq: midi: Optimize event_input locking with RCU
    63730818d3618 clocksource/drivers/armada: Unwind timer clock on init failure
    7eb5764d25c4a clocksource/drivers/samsung_pwm: Switch to raw_spinlock_t type
    e4764fa09a2e3 clocksource/drivers/clps711x: Do not unmap clocksource MMIO
    54e1259b75d64 s390/debug: Fix deadlock during unregister
    e9ba3132a9edc xenbus: Unregister reboot notifier on init failure
    811fdac2d1bdf sched/isolation: Defer freeing of cpumask memblock memory to initcall
    b33197aef2349 selftests/namespaces: Fix racy pipe handshake in timens and pidns_separate
    65c3939656fd7 bpf: Fix UAF in bpf_trampoline_multi_attach_free on update failure
    7edb0248f4ff5 selftests: drv-net: so_txtime: fix qdisc replace with handle
    6dd217e218d47 power: supply: bq27xxx: bq27z561: fix invalid AverageEnergy address
    17d2a9ef48d09 power: supply: bq27xxx: bq28z610: fix invalid AverageEnergy address
    fd7aa80ecf69a power: supply: bq27xxx: bq27520g4: fix REG_TTES address
    4492288889b97 power: supply: bd99954: Drop bad register fields
    c18d09a1012bb power: supply: bd71828: Do not hide errors
    513cdd61debdd power: supply: bd71828: Drop duplicate power-supply property
    80091fbba3e92 power: supply: bd71828: Fix current direction
    367b8a8860e75 power: supply: bd71815: Fix temperature reading
    101cd6f729229 objtool/klp: Fix .kcfi_traps special section extraction
    4e8a940c31539 objtool/klp: Fix vmlinux .klp.symid link error for .exitcall.exit symbols
    01923107661a4 PCI/ASPM: Disable/restore ASPM on every function for multi-function devices
    bcbcbd0370e67 spi: img-spfi: don't disable runtime PM on DMA deferred probe
    6b6007e96d62a ASoC: spacemit: advertise only DMA-backed DAI streams
    0a2129953aea8 selftests/bpf: vmtest.sh: Preserve command quoting when running in the VM
    817ad6d29cbc8 selftests: harness: Mark test fixture objects __maybe_unused
    44b702fceb4cf bpf, s390: Clear fetch destination on faulting arena atomic
    84fac27c0ca3e bpf, arm64: Clear fetch destination on faulting arena atomic
    5eb3ff6a3bf27 bpf, x86: Clear fetch destination on faulting arena atomic
    6465c2c0f1e34 bpf: Derive the atomic load register in one place
    840f727508152 bpf, riscv: Clear fetch destination on faulting arena atomic
    82b97be6a478e kunit: tool: fix _list_tests filtering wrong variable when list has TAP prefix
    7e2ee531560e0 drm/amd/pm: silence uninitialized variable warnings
    e87e015f44f15 perf build: Remove leftover feature tests for removed cxx and clang support
    20ed93f1fd576 backlight: ktd2801: Fix unmet dependency on GPIOLIB
    d32a47e7cda71 backlight: aw99706: Validate all DT property values consistently
    43ba7cdff6dd4 mfd: cs42l43: Fix regmap defaults ordering
    829539c4a6505 arm64/efi: Avoid voluntary preemption with efi_mm installed
    fdbdc5c016a81 iomap: iomap_bio_read_folio_range_sync is missing a call to bio_uninit
    778f6a8070511 super: fix dying superblock warning messages
    ef34de895dfd7 PCI/ASPM: Use pcie_capability_clear_and_set_word() for ASPM disable/restore
    f024208da64d3 objtool/klp: Fix relocations for EXPORT_SYMBOL_FOR_MODULES() symbols
    d4ae0baea6d68 objtool/klp: Don't match local symbols against exports
    a8efbd6bd582a objtool/klp: Fix cross-module klp relocation section naming
    6a990e74d4e84 firewire: core: fix memory leak in error path of build_tree()
    727013e31478e firewire: core: validate parent port count before allocating nodes in build_tree()
    3f3980920f021 firewire: core: consolidate port counting in build_tree()
    75c00ce4049c9 firewire: core: add KUnit tests for failure of tree building
    a41a7dd31c4ab firewire: core: add KUnit tests for successful tree building
    0e86ed95eda9c firewire: core: add KUnit test skeleton for node tree
    6d9c3ae59c7f7 UBI: fix two issues in the ubi.mtd MODULE_PARM_DESC
    4e0ce77df7d98 ASoC: xilinx: formatter_pcm: fix stream_data leak on open error
    851c5e9a829d5 mtd: ubi: Release device reference on busy detach
    ec3fffb06a3f5 objtool/klp: Ignore replacement offset of empty x86 alternatives
    ab0648f06367f objtool/klp: Fix size of empty special section entries
    ba20c5bb872cd objtool/klp: Fix vmlinux .klp.symid link error for .no_trim_symbol symbols
    87b3da4acb860 ubi: Fix rollback for explicit UBI device numbers
    6424b9cde9edc bpf: Compare iterator types during state pruning
    07697272bfacd UBI: fastmap: Pass to_be_tortured when reusing old fastmap PEBs
    41033f8d870bf UBI: Preserve torture flag when rescheduling failed erasures
    4302bc71ace16 ASoC: fsl-asoc-card: defer probe when the CPU DAI device is not ready
    c1829705803a5 ASoC: pxa: Use devm_clk_get_optional() for extclk clock
    5eab61a483f4b idpf: add missing cpu_to_le32 in idpf_tx_splitq_build_flow_desc
    57715e257c8a5 ice: acquire NVM lock around each flash read
    dfa94b403e69a ice: clear the default forwarding VSI rule when releasing a VSI
    dc0234c8c5730 ice: fall back to SBQ when LL PHY timer interface times out
    64a2bd4cfc16c RDMA/cma: Fix WARNING in res_to_rt
    ea41b5630fa3d RDMA/cxgb4: Free debugfs on registration failure
    068122750ee8a dmaengine: qcom-bam-dma: fix autosuspend cleanup during removal
    99c91dca54a6c phy: rockchip: samsung-hdptx: Handle uncommitted PHY config changes
    c4506784a95ce phy: rockchip: samsung-hdptx: Fix rate recalculation for 3.2GHz FRL
    0a111684ed663 phy: rockchip: samsung-hdptx: Guard against clk rate integer underflow
    877657310a66b phy: rockchip: samsung-hdptx: Prevent divide-by-zero when computing clk rate
    b6823d7f95abc phy: rockchip: samsung-hdptx: Fix rate recalculation for high bpc
    6e6e471eef1d5 ALSA: seq: Don't leak the extension cell pointer in the bounce payload
    7d44b897bff84 nfc: nci: fix use of uninitialized memory in CORE_INIT_RSP parsing
    3ea115646abfd nfc: digital: Do not dump a NULL response in command completion
    3e7a093c177f9 nfc: pn533: hold a reference to the request skb during send_frame
    eeb16fb24cfe6 nfc: llcp: bound SNL TLV parsing to the skb and add length checks
    ee08414d78b85 nfc: nci: fix double completion race in nci_data_exchange_complete
    d1b73962675cd nfc: llcp: read llcp_sock->local under the socket lock in getsockopt
    bd6f1277b62bc nfc: llcp: avoid userspace overflow on invalid optlen
    6d8926debeb9d hrtimer: Account nr_retries on recovered interrupt retries
    ece3da898ef56 nvme: reject passthrough of driver-managed Set Features
    b116e9dae433f nvme/ioctl: check SUBMIT_IO with nvme_cmd_allowed()
    0b4cf43f9ca71 nvmet: fix NULL pointer dereference in nvmet_execute_identify_ns_zns()
    ad75556bde3ce nvme-apple: Drop the PRP null check chicken bit
    e019219309813 nvme-apple: Require page aligned buffers on the admin queue
    9650fd559f97f nvme: Add a quirk for page aligned admin queue buffers
    03fd8591e90a5 nvme-apple: Never set the opcode in the NVMMU TCB
    3bda132d063e6 nvme-apple: Don't set a DMA direction for commands without a data transfer
    c11685ee4eedc nvme-apple: Destroy the admin queue on removal
    7b81e4d2230e3 nvmet: fix heap out-of-bounds read in nvmet_auth_negotiate()
    f6374ec9a3443 s390/irqflags: Add out-of-line definitions of arch_local_irq_*() for KMSAN
    7954540e49ffb arm64: bti: Disable in-kernel BTI with recent versions of Clang
    78ac8fc22b12f ASoC: qcom: q6apm: keep the graph start count in sync with the DSP
    b5fb0376c773d spi: sprd-adi: Fix probe succeeding without registering the controller
    49a61174186be arm64: entry: Avoid unnecessary local_irq_disable() on kernel exit
    fdda85094b2f6 phy: qcom: qmp-combo: Drop qmp_v4_calibrate_dp_phy
    8dda7211be1ea phy: qcom: qmp-combo: Correct pre-emphasis table for QMP v4 DP PHYs
    8ecad7d61482f phy: renesas: rcar-gen3-usb2: Ignore missing VBUS regulator
    2041b75c123fe rust: uapi: replace direct asm-generic/ioctl.h include with linux/ioctl.h
    ddddf034ac0e7 iommu/amd: Fix incorrect device ID in invalid PASID error message
    7da0bdf0610f6 apparmor: fix unconfined user namespace restriction forced stack
    4b835e45a4bb3 powerpc/configs: enable CONFIG_RAS to fix EDAC support
    db7c3ced1fe8f selftests: drv-net: so_txtime: only send test traffic to sch_etf
    ab7891cab3f11 selftests: drv-net: Test queue stall upon reconfig
    8dd136173106c PCI: ultrarisc: Get and enable DP1000 PCIe controller clocks
    e1dc0af719a25 amt: Don't support cross-netns setup.
    98518a8312dc1 pinctrl: rockchip: Decode drive strength in the get function
    608816b886a22 selftests/sched_ext: Check skeleton open failure in exit test
    972d037f00464 selftests/cgroup: Avoid awk -e in cpuset tests
    3f3811bacd93f cgroup/cpuset: Use WRITE_ONCE() for shared prs_err updates
    79fb405966edb nvme-pci: release descriptor pools on probe failure
    cead174d42421 nvmet: propagate percpu_ref_init() failure in nvmet_ns_enable()
    480f6b92c914b nvmet: fix Reservation Register Replace for unregistered host with IEKEY
    92533e49fe3c4 NFS: Return a delegation the client fails to record
    d8f0b83753809 sunrpc: xprtsock: annotate shared socket callbacks with READ_ONCE/WRITE_ONCE
    eb476289c12cc SUNRPC: check rpc_sockaddr2uaddr() return value in rpcb_register_inet4/6
    3039101d61bbd hwmon: (pmbus/ltc4283) Add missing MODULE_DEVICE_TABLE for OF match table
    bf3d173e1c410 hwmon: (cros_ec) Synchronize EC access from the thermal device callbacks
    2a1828d693e61 hwmon: (cros_ec) Store the hwmon device in cros_ec_hwmon_priv
    a098347049660 hwmon: (cros_ec) Register the thermal devices after the hwmon ones
    08d4a5f731b33 arm64: Disable KCSAN instrumentation in delay.o
    16fb33a8a323f xdrgen: Fix opaque and string encoders for unbounded members
    621d4bba8f4c6 xdrgen: Add XDR width macros for short integer types
    5585954164f50 xdrgen: Do not declare union XDR functions in the definitions header
    af0f6fb2a2f93 xdrgen: Emit a blank line ahead of enum declarations
    7ea29e2bffffc lockd: Regenerate NLMv4 XDR code
    0a7908d48ea04 nfsd: add protocol support for CB_NOTIFY
    7458727fd7cb7 NFSD: Release the export reference when reaping open stateids
    af3fe52fd108f netfilter: nft_ct: move custom expectation support to helper
    1e694ac22ef2c netfilter: nft_ct: support expectation creation for natted flows
    026f7f91de39b m68k: Fix backtraces for non-running tasks
    74669cc3483e9 media: amd: isp4: fix self-deadlock in isp4sd_pwron_and_init() error path
    a1f8750668e55 media: amd: isp4: release partial allocations in isp4if_alloc_fw_gpumem()
    8cd13087eb57d hwrng: imx-rngc - Disable clock on registration failure
    7c7d3e51c2903 crypto: qat - remove dead ADF_HEX code
    2a3c526c7554c crypto: qat - use 2-arg strscpy where destination size is known
    5baddf100b3be iommu/vt-d: Flush context cache with correct SID when tearing down aliases
    db5daf25f754c iommu/vt-d: Tear down scalable-mode context on probe failure
    143cd37ce7652 iommu/vt-d: Fix iopf_refcount leak on RID domain replacement
    6b822d18c33af iommu/vt-d: Clear Present bit before tearing down copied context entry
    a45f0b5eaac6b iommu/vt-d: Fix UCTP context table slot when copying root entries
    2af1e99ec14d2 iommu/dma: Restore locking around msi_page_list
    9562653261393 fbdev: clps711x-fb: Remove unreachable unregister_framebuffer() call
    7bf36dc23bcf3 fbdev: kyro: Validate overlay viewport coordinates
    4b2c707bf5b1f fbdev: tdfxfb: fix PCI enable cleanup with pcim_enable_device()
    ef79a405f8399 apparmor: fix integer overflow in verify_tags() bounds check
    b518c2468d91a perf synthetic-events: Fix divide by zero in perf_event__synthesize_threads
    8340726a60aa6 perf python: Fix memory leak in pyrf__metrics_cb
    31245887b0e0e perf python: Fix count_values memory leak in pyrf_evsel__read
    9cd2a9a5fd744 perf python: Validate attribute setters in pyrf_evsel
    a05972af8e9aa perf python: Validate CPU and thread maps in pyrf_evsel__open
    1f8f4e482af32 perf python: Handle Py_None for thread and cpu maps
    3d34725649fa6 perf python: Check counts_values size in set_values
    41579b30c2fd7 perf test: Fix skiplist leak in cmd_test
    7e0cf79cd2f9c perf synthetic-events: Fix uninitialized pthread_join
    cf34a68e9adaa perf python: Fix memory leak in pyrf_evlist__get_pollfd
    fbf8dc5170dae perf tools: Fix sb_evlist leaks in top and record
    b0756b5be7298 perf stat: Fix evsel_list leak in cmd_stat
    acf06e025eea4 perf script: Fix metric_evlist leak in script_find_metrics
    a52414ecdbe6f ARM: dts: helios4: add SATA regulator supplies
    e16bf98706185 ARM: dts: helios4: add vcc-supply to GPIO expander
    8d976901462c1 ARM: dts: helios4: add vcc-supply to EEPROM
    393d33d5d54c2 arm64: dts: turris-mox: fix usb3 phys
    d1409d203251f i3c: renesas: Don't register devices when ENTDAA times out
    869ecb1312921 i3c: renesas: Follow a unified pattern for transfer and command initialization
    739eb8ac160db i3c: renesas: Return immediately if there is no transfer
    051f2da26ce37 bpf: Fix mmap_lock leak in irq_work path
    3f45d8358e01f riscv: cpufeature: Clarify ISA spec version for canonical order
    dc8b33b819cb0 net/sched: cls_api: fix teardown of an adopted proto on insert-race loss
    0ffd3e983069b iio: light: gp2ap002: re-enable irq if runtime suspend fails
    470edb012b1d9 iio: light: gp2ap002: Fix unbalanced runtime PM on repeated event writes
    38c077c815901 iio: light: opt4060: Fix pointer type passed to div_u64_rem()
    12feca1268315 bpf, cgroup: Fix storage null-ptr-deref after replacing prog
    bf8f635531232 pinctrl: fix PINCTRL_GENERIC_MUX not always being selectable
    63562cfaea8a6 Bluetooth: MSFT: validate evt_prefix_len against the response length
    22624d43fd737 Bluetooth: btmtksdio: fix usage_count leak when autosuspend_delay is negative
    481533b039851 Bluetooth: MGMT: free the HCI command when it is cancelled
    fa46d428c014e Bluetooth: MGMT: free the mesh send cancel command when it is cancelled
    bb5ca1cc7744c Bluetooth: hci_sync: free the advertising instance on the failure and cancel paths
    4d7b1c834d277 Bluetooth: hci_conn: fix the SCO setup context lifetime
    f2b586d65f90c Bluetooth: btintel: Fix diagnostics event detection
    b495a3a9b33bc Bluetooth: L2CAP: use proto_lock for l2cap_data to fix l2cap_disconn_ind
    84ea9c9987480 Bluetooth: virtio_bt: avoid OOB read of build info string
    1499d5e7e2cf1 pinctrl: airoha: fix edge-triggered interrupts handling
    afd4d7aabb01c pinctrl: airoha: fix IRQ mask/unmask code
    2c968c11592b4 pinctrl: airoha: add missed IRQ resource helpers
    eb2587a252784 pinctrl: airoha: fix getting gpiochip/pinctrl pointers in the IRQ handling code
    f385f3d3248f0 pinctrl: airoha: add missed get_direction() function for gpio_chip
    10e890b305e61 pinctrl: airoha: an7583: fix spi group pins
    458b07ec42819 pinctrl: airoha: an7583: fix muxing of non-gpio default pins
    3fe11ae08e8cd pinctrl: airoha: an7581: fix mux/conf of pcie_reset pins
    ce7710c1151d7 pinctrl: airoha: an7583: fix I2C0_SDA_PD register bit order
    229b61b5b2098 pinctrl: airoha: an7581: fix pinconf of i2c_scl/i2c_sda pins
    dec9a98b444f4 pinctrl: airoha: fix mdio bitfield names
    64c6f46708f17 perf sched: Handle missing trace samples in pipe mode
    01bcff1241368 perf sched: Suppress latency table output when trace samples are missing
    c4c136555ff90 btrfs: qgroup: fix a wrong length calculation in qgroup_free_reserved_data()
    91ed75a0a0cb0 btrfs: use aligned range for locking in extent_fiemap()
    98e3747587f9f btrfs: zoned: don't clobber the extent buffer when zeroing it out
    e2de2989adb3e btrfs: zoned: flush active metadata block group at btree_writepages() start
    81241f734f0f6 btrfs: retry verity reads for not-uptodate Merkle folios
    e6045f6e8d869 btrfs: replace writeback inhibition xarray with a fixed inline buffer
    d5602f96ff1e2 btrfs: check if root is readonly when setting posix acl
    2073f3d97b0c5 btrfs: make sure EXTENT_BUFFER_READING is cleared under refs_lock
    aaac9b352f7f5 btrfs: always wait for ordered extents to avoid OE races
    ac916391e1c70 btrfs: defrag: fix deadlock between defrag and delalloc space reservation
    8249dfe46337d btrfs: zoned: don't force read-only on transient -EAGAIN from reloc merge
    6da989018eee3 scsi: sd: Fix sd_done() sense handling condition
    5d7d1b8b525e5 scsi: sd: Fix special_vec mempool leak when scsi_alloc_sgtables() fails
    748a14a0d41cf scsi: sd: Fix error handling in sd_probe() after large pool creation failure
    56e547a31acee perf trace-event: Fix integer truncation in do_read() and skip()
    077c42c5c04fb Bluetooth: btusb: QCA: Fix populating devcoredump fields on unenabled devices
    42deed40dd99f Bluetooth: btusb: Record matched usb_device_id into btusb_data
    dce459875be52 Bluetooth: btusb: Fix BD_ADDR byte order in btusb_set_bdaddr_wcn6855()
    19f65ea34a539 Bluetooth: btqca: Fix qca_set_bdaddr() waiting for wrong HCI event
    35d534234e249 sched/fair: Check CPU capacity before comparing group types during load balance
    1d3880877efe0 sched/fair: Also gate overloaded status update for SD_ASYM_CPUCAPACITY
    304844b5545f4 perf/x86/intel/pt: Fix stop/start with no update
    55a5bc0de3b4c perf/x86/intel/pt: Use bitwise access for PERF_HES_STOPPED
    b7402b47cb08b perf/x86/intel/pt: Factor out pt_config_enable()
    f0f512b8d9ee7 ACPI: video: Release PCI device reference after lookup
    1b58cfd22ca04 thermal/drivers/spacemit: Validate clamped trip thresholds
    ec320af6cc1ed ACPI: PCI: Avoid misleading _OSC messages for non-PCIe host bridges without _OSC
    0afe0cf203a95 ASoC: tas675x: sort the register default table
    d321dc10e4b02 regulator: qcom-rpmh: Fix PMIC5 BOB bypass mode handling
    b6fc0825df46a bpf, arm64: Fix exception table metadata for arena load-acquire
    76b16abbc5ea1 bpf, x86: Fix exception table metadata for arena load-acquire
    a7dad4c69e5f2 bpf, riscv: Add and use bpf_atomic_is_load_acq() helper
    5f8ade6e9b793 bpf: Reject load-acquire from pointers requiring fault protection
    7d199b6a0651a arm_mpam: Disable driver unbind to avoid UAF
    a29044c9c8351 arm_mpam: Fix a NULL pointer dereference on unbinding after an error interrupt
    988e11b69ef9d perf: arm_pmuv3: Zero initialize hw_id branch stack field
    7e4f2702bbadb coresight: etm4x: missing cscfg_csdev_disable_active_config() in perf enable
    275466e3b95b2 coresight: etm4x: fix leaked trace id
    5ac900f73ce1d coresight: etm4x: fix underflow for usage of (nrseqstate - 1)
    8a0c540e0901d coresight: etm4x: fix wrong check of etm4x_sspcicrn_present()
    b6ec4bf1ec444 md/raid1: don't set array_frozen in raid1_takeover()
    bb7f92d58fca9 md/md-llbitmap: stop daemon timer rearm on destroy
    2f0722435ce3a md/md-llbitmap: prevent create failure bitmap UAF
    35b27002ae9c4 md: avoid stale clone I/O accounting timestamps
    4224dccd325a9 md: wait for behind writes before destroying bitmap
    ccbdc483eb041 md/raid5: round bitmap stripes with sector division
    0fef3967ccb8e phy: qcom: qmp-pcie: Add pcs_lane1 offset to V5 offsets
    03455404fb6cb phy: qcom: qmp-usb: Fix possible NULL-deref on early runtime suspend
    b85bbec72fa81 phy: qcom: snps-femto-v2: Fix possible NULL-deref on early runtime suspend
    0f9789d1b63e7 phy: qcom: qmp-usb-legacy: Fix possible NULL-deref on early runtime suspend
    328cf94be9115 phy: qcom: sgmii-eth: vote for both voltage rails with correct current loads
    fae5aba953686 soc: fsl: qe: check platform_driver_register() in qe_ic_of_init()
    a22464c5df582 ext4: fix transaction overflow during writeback
    c391af5743a44 ext4: teach ext4_meta_trans_blocks() about number of allocated extents
    53f2e4d2b896e selftests/mm: unpoison pages in memory-failure teardown
    dc2bd517ac0bc hugetlbfs: release subpool on fill_super failure
    7bfae60ab7a53 pinctrl: rockchip: Restrict the RV1103B 2-bit drive type to bank 2
    ab698d7710b47 pinctrl: rockchip: Reset the pin count when recalculating SoC data
    1b10015957a63 pinctrl: tegra264: fix DAP2 DIN/DOUT pin assignment
    fb4824880b0db firmware_loader: do not queue completed sysfs fallback requests
    0e4b5f8cad67e scsi: qla2xxx: Remove redundant VPD flash read in sysfs read path
    39de65117fd9c PCI: cadence: Fix host/endpoint dependencies for cadence-plat driver
    e399e9d7e291c drm/amdgpu/gfx6: Use PFP on the compute queues too
    57a9b737e7939 drm/amdgpu/gfx6: Fixup emitting SWITCH_BUFFER packets
    36c99db9f364a perf trace-event: Fix buffer overflow in read_string()
    ece5ad121b2ac phy: rockchip: phy-rockchip-inno-csidphy: fix rk1808 hsfreq table
    5acdc4d5b58bd phy: sunplus: fix error handling in sp_uphy_init()
    5374f3d53376d phy: renesas: rcar-gen2: Fix double of_node_put on phy creation failure
    935f6e837a83b phy: renesas: phy-rcar-gen3-usb2: Fix devm action registration for disabled VBUS regulator
    3f2828c4788ae arm64: dts: ti: k3-am64: Fix MDIO clock reference for ICSSG0 node
    33145914688ed ALSA: hda: cix-ipbloq: Avoid build with 32bit archs
    5826db2ddddb6 ext4: fix spurious message about orphan cleanup on RO fs
    0fa116a17b69a drm/amd/display: Resize MST HDCP per-connector arrays to 32
    6e26232294dbc drm/amdgpu/gfx6: Fixup emit_cntxcntl()
    61b45f9be60cc leds: gpio: Clear error pointers for skipped LEDs
    ad50c2c550ff2 mfd: macsmc: Fix key count endianness annotation
    ad32c823abfb8 drm/amdgpu: read TRUNCATE_COORD_MODE on gfx12
    7b5f4362c41ac drm/gfx12: Program DB_RING_CONTROL
    e54c7a2bce63d mfd: iqs62x: Reject zero-length firmware records
    f81bcb7e83be1 tools: Ensure tools copy of linux/filter.h exports the UAPI
    15327f1eb9cc9 mfd: rave-sp: validate received frame payload lengths
    77053624d0335 arm64: hibernate: Restore DAIF state on error
    d736ace2c4916 arm64: hibernate: mask DAIF before restoring hibernated kernel
    be919eed5e52a wifi: mac80211: skip default WMM setup for AP_VLAN links
    8351d66344237 RDMA/erdma: restrict the driver to little-endian systems
    cd2396fc9684d module/dups: Fix use-after-free in kmod_dup_req lifetime handling
    2bdd4d5d2cae6 module/dups: Inform duplicate requests about the result directly
    5ede61dc58fd3 module: use strscpy() to copy module names in stats and dup tracking
    561651d6a1558 RDMA/siw: Fix use-after-free in siw_accept()
    ad4492dcaf90a IB/isert: post the full-feature receive buffers after session registration
    4397ea31e3b0d IB/isert: delay the final Login Response until the session is registered
    545461671497c soundwire: cadence_master: add BRA_NumBytes[8] support
    55516986a3d81 cpufreq: imx6q: fix out-of-bounds write when probed more than once
    0f77d1a0a2505 cpufreq: imx6q: fix devres accumulation across driver rebind
    35a125c9abbf7 rust: cpufreq: Fix temporary write in Registration::bios_limit_callback
    04ac4e270e3d3 rust: cpufreq: Add CPUFREQ_TABLE_END as last table entry in TableBuilder::to_table
    eadc95c99cbe8 drm/sun4i: hdmi-phy: Fix H6 8-bit MPLL config at 594 MHz
    e71206a8a1d97 drm/sun4i: Drop node references while building component list
    d9fb87926522d drm/sun4i: dw-hdmi: Drop TCON TOP port reference
    68e0643bb227a drm/sun4i: tcon: Drop remote endpoint reference
    c0d3219ffd4c0 drm/sun4i: crtc: Propagate layer initialization error
    ef396e92c50e5 drm/sun4i: hdmi: Don't leak sync polarity bits into packet control
    ae08a67bca781 drm/sun4i: tcon: Drop TCON TOP device reference
    eb1dc0e2c7acb drm/sun4i: tcon: Set output mux for DSI and LVDS
    ac9f274dac952 drm/sun4i: tcon-top: Keep mixer routes distinct
    a42daad53d09e drm/sun4i: vi scaler: Restore opaque alpha in video modes
    f587b2606d710 drm/sun4i: vi scaler: Fix coefficient selection
    4420c243e7892 drm/sun4i: Fix V3s YUV scanline size
    4dd6b79f7099c perf c2c: Clean up registered formats on c2c_hists__init() and c2c_hists__reinit() failure
    86f5cb2d1e612 perf c2c: Fix error masking, OOM, and unchecked caller errors in hpp_list__parse()
    510b305f35aa6 clk: rockchip: rk3576: fix source muxes for SPI0..SPI4
    976f1be72740c bpf: Fix sleepable check for tracing/lsm prog
    f523359c4789b bpf: Clear buf on error in __bpf_get_task_stack
    34cbcb333f30e bpf: Remove trace_in argument from __bpf_get_stack
    27ed6cf4c0ac5 bpf: Factor callchain_finalize function from __bpf_get_stack
    b61aacc66a1f6 bpf: Factor callchain_store function from __bpf_get_stack
    b5a2907bdeced ocfs2: o2hb: quiesce negotiate handlers and timeout work
    073f51e39bed3 ocfs2: synchronize heartbeat callbacks with o2net teardown
    2e689bb5643cf perf libbfd: Fix memory leaks and NULL fclose in BPF disassembly
    61fab78599058 perf bpf: Add PROG_TAGS to required arrays in __bpf_event__print_bpf_prog_info()
    5161e7ef5b388 perf header: Use write lock when translating BPF prog info pointers
    731edc4d0d01b perf libbfd: Validate BPF prog info arrays before pointer cast
    8040663c1dfdf vfio/pci: Avoid mapping BARs for devices with non-mappable BARs
    720408d98d9fb ARM: 9485/1: mm: acquire mmap write lock around show_pte() for user faults
    8d7cbc6df9632 ARM: 9484/1: enable interrupts when unhandled user faults are triggered
    8de56782d6e5b ARM: 9483/1: select HAVE_POSIX_CPU_TIMERS_TASK_WORK
    da64b150e4b7b ARM: 9481/2: breakpoint: CFI breakpoints only on demand
    fa1b33fdab3e7 RDMA/srp: fix heap information leak on a truncated SRP_CRED_REQ
    c92686867638c RDMA/erdma: Hold QP references for AE and CM processing
    4545f355654d0 RDMA/erdma: Hold CQ references when processing EQ events
    795f70fe748bd kbuild: fix modules.builtin(.modinfo) targets in the top-level Makefile
    3c5adf387155a modpost: prevent leak when early return no suffix .o in read_symbols()
    f3b6624d94210 scripts/tags.sh: Prevent binary files appearing in cscope.files
    1b18270e3d881 intel_idle: Avoid using deep idle states during initialization
    36fb592af353c xen/xenbus: check otherend_id only after it has been initialized
    4fa8915f40f74 thermal: hwmon: Remove hwmon class device along with its parent
    422a416041172 bpf: Check load-acquire src ptr type before the load
    8fd17b394719a gpu: nova-core: correct FRTS vidmem offset calculation
    018169883d483 gpu: nova-core: clean up FSP FRTS comments
    b666585dfaf41 gpu: nova-core: factor out common FSP message header
    c93fc0f7ba188 thunderbolt: stream: Fix possible short reads/writes
    de9eac1099f10 thunderbolt: stream: Restore consumer if copying from iter fails
    ede92f86b6c45 arm64: dts: qcom: talos-evk: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
    7b08069029696 arm64: dts: qcom: sa8155p-adp: Fix swapped USB and UFS QMP PHY vdda-phy/vdda-pll supplies
    458864b9ef1ca arm64: dts: qcom: eliza-mtp: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
    c12cf2252ddee arm64: dts: qcom: lemans: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
    4a65a0ffc748a arm64: dts: qcom: glymur: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
    74d6524b34635 arm64: dts: qcom: kaanapali: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
    eb262afc7231e arm64: dts: qcom: sar2130p: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
    407b05cf21eac arm64: dts: qcom: sm8750: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
    83db0e7a95f2f arm64: dts: qcom: sm8650: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
    bfd0c3600b6ed arm64: dts: qcom: purwa: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
    069f1a1523d02 arm64: dts: qcom: hamoa: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
    8aad733a4bb88 arm64: dts: qcom: sc8180x: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
    88ac1561a1ef2 arm64: dts: qcom: sc7280: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
    a9783bec0db41 arm64: dts: qcom: sc7180: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
    4cd993d91c8b7 arm64: dts: qcom: sm7225-fairphone-fp4: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
    dfc8d77f80789 arm64: dts: qcom: qcs6490: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
    221300448bd1d arm64: dts: qcom: qcm6490: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
    93c1c78f9dc26 arm64: dts: qcom: qcs8550-aim300: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
    85f59f34757bd arm64: dts: qcom: sm8550: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
    64e223194230e arm64: dts: qcom: sm8450: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
    d843ed6b412a6 arm64: dts: qcom: sm8350: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
    d143fb29b0ca2 arm64: dts: qcom: sm8250: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
    9063b2373ac8c arm64: dts: qcom: sm8150: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
    1b3154a198b73 arm64: dts: qcom: sdm850: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
    6071a3b06acef arm64: dts: qcom: sdm845: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
    3db02fe87c95f arm64: dts: qcom: sa8540p: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
    15ad83a26241e arm64: dts: qcom: sc8280xp-blackrock: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
    8d951c93e4b19 selftests/mm: fix ternary operator precedence in ksm_tests
    0df56ab44ecf0 selftests/mm: fix ksm NUMA merge test for systems with memoryless NUMA nodes
    cd3c3baaa2564 selftests/mm: handle EINVAL when configuring gigantic hugepages
    229ac37735167 selftests/mm: fix memleak in migration benchmark
    2c2218560b6e2 bpf, cgroup: Fix invalid storage access after __cgroup_bpf_attach failed
    6282d47b24b0c remoteproc: fix OOB read via signed offset in rsc_table_for_each_entry()
    cd07aef510ac6 PCI/sysfs: Add lockdown checks to legacy I/O and memory handlers
    2fae17fd4fe3a PCI/sysfs: Return -EINVAL for unsupported I/O BAR mmap
    fdfb3a1f5c06e ALSA: hda/realtek: ALC269 fixup for Yoga/Legion Mic noise
    8d8d3d4a6483e arm64: dts: qcom: agatti: Add missing CX power domain to DISPCC
    b681c740e6d64 block: handle nogenerate/noverify properly in fs-integrity
    7ccd6b6448cdc block: lift BIP_CHECK_FLAGS to include/linux/bio-integrity.h
    70af551b7fcdf block: remove bip_should_check
    6e959e7691c64 ublk: clear auto buf reg before updating io->buf in batch commit
    30810bdf273b4 drm/omap: dsi: Do not copy isr table
    04e4d18e7fea9 riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel number for DMA controller
    7ae71629357d0 bpf: Invalidate RCU pointers after final spin unlock
    7565e44507634 fat: release buffer head after rebuilding parent
    530a9d5ef831a rapidio: clear mport->net when rio_add_net() fails
    0e7459abff46e ocfs2: do not use make_bad_inode() in ocfs2_read_inode_block_full()
    9f4129b6905b7 ocfs2: validate external xattr entries when reading metadata
    3fd45b24879fa ocfs2: validate inline xattrs during inode block validation
    67201231eeccd pps-gpio: remove dead capture_clear code
    77a6bdb97e02a pps: pps-gpio: split IRQ handler into hardirq timestamper + threaded handler
    a31e768d2e4af pps: don't try to wait for negative timeouts in PPS_FETCH
    13d0dfd5d5f35 lib/string: fix memchr_inv() for large ranges
    70d7bb7a0be03 ocfs2/cluster: keep heartbeat local node stable
    653d22269a8b8 ublk: validate auto buf reg before taking uring_cmd
    af9a009ed4967 ublk: check for ublk_unmap_io() returning 0
    5ac6019cb78e9 ublk: check import_ubuf() return value
    b783da6e32c27 block/kyber-iosched: flush per-cpu latency buckets over possible CPUs
    7a578afab9e93 block/blk-iocost: collect per-cpu latency stats over possible CPUs
    29db15ba44936 block/blk-iolatency: account per-cpu latency stats over possible CPUs
    834fbb747ced4 block/blk-stat: drain per-cpu callback stats over possible CPUs
    d8c872901e645 blk-cgroup: skip dying blkg in blkcg_activate_policy()
    2cf9f50a38c18 blk-cgroup: fix race between policy activation and blkg destruction
    f97022fefe6eb phonet: pep: do not write beyond optlen in getsockopt
    c20cf591d9231 net: stmmac: Skip PHY attach if custom PCS is in use
    3ad0fd538503a iio: light: tsl2583: return zero in write_raw() on success
    0649178f3cedb iio: light: isl29028: return zero in write_raw() on success
    fe73809bc314f iio: light: tsl2772: fix ALS calibscale readback
    b75ee915ab99f perf arm-spe: Reject zero nr_cpu in metadata to prevent division by zero
    e258979168447 perf intel-bts: Fix off-by-one in auxtrace_info minimum size check
    bbf8a944b007c perf intel-pt: Fix off-by-one in auxtrace_info minimum size check
    68b37d885e886 perf auxtrace: Fix queue grow overflow and old array leak
    d18a40a72b502 perf thread-stack: Fix heap buffer overflow on branch stack wrap copy
    ef81d735d5796 HID: lg4ff: validate report length before fixed offsets
    d10a68ac87683 HID: i2c-hid: goodix: Disable VDD on VDDIO enable failure
    b5fc0267ed840 HID: sony: add missing __packed to struct with static_assert()
    93c5cc35bcd9f HID: steam: Reject short reads
    dc766ca718ab5 HID: steam: Improve logging and other cleanup
    fdc4ef7a4bfe7 HID: steam: Add support for sensor events on the Steam Controller (2015)
    5181f83da9227 HID: steam: Rename some constants that got renamed upstream
    de102444a5385 HID: steam: Refactor and clean up report parsing
    7b5ae8d815f7a HID: i2c-hid: Fix "(null)" output when reading report descriptor fails
    b85d1000eb884 HID: synchronize input before cleaning up a failed probe
    4eff0ad8128b8 HID: i2c-hid: Refactor _DSM helper and add i2c-hid-acpi-prp0001 driver
    13378c9ac0a1b HID: logitech-hidpp: Fix FF device cleanup on init failure
    5c288cc441a2c HID: asus: fix a off-by-one in mcu_parse_version_string() validation
    744b3f930c117 HID: asus: refactor the two workqueues and init sequence
    b712b4135ce45 PCI: dwc: ep: Fix unmap potentially unmapping the wrong iATU
    5aed69e20fd3d platform: arm64: qcom-hamoa-ec: reject incomplete responses
    914704c7b318b PCI: dwc: ep: Flush cached MSI write before unmapping the iATU
    79588f2c75494 misc: pci_endpoint_test: Check SUCCESS bit for doorbell status
    6228722c27304 dm-integrity: replace forgeable discard filler with a keyed sector marker
    5c5a795bf6248 tty: clear cdev pointer after cdev_add() failure
    3dbf85ef40b63 tty: skip cdev_del() when no cdev is registered
    06b376432974f serial: core: clear freed pointers on uart_register_driver() failure
    c2aec15f78b2e serial: core: do fallible allocations before the console can be registered
    2ad24c1d0b939 serial: amba-pl011: keep console clock enabled for atomic writes
    0bcf3335dd3b4 serial: amba-pl011: unprepare console clock on unregister
    10232a59e076a MIPS: ptrace: Fix syscall skipping via PTRACE_SYSCALL
    6390b2a352fcf soc: fsl: qe: implement get_direction()
    77159db9c6f1c soc: fsl: qe: properly scan GPIO nodes at startup
    7b0093b638c8f powerpc/irq: Fix missing r2 clobber in PCREL inline assembly
    066e5e9962dd4 powerpc64/bpf: Fix build break for arch_bpf_timed_may_goto
    ce39762511209 powerpc64/bpf: Fix build break in bpf_jit_emit_func_call_rel()
    19b54740e2e11 powerpc/syscall: Fix syscall skip handling for seccomp and ptrace
    de2d453f6f71d powerpc/smp: add NULL guard for cause_ipi in smp_muxed_ipi_message_pass
    c554a8d376d5a powerpc/xive: propagate IPI init errors to prevent use-after-free
    e4c0451aa6154 powerpc/xive: add error return value to xive_smp_probe()
    0a2be2ca7ad7b powerpc/xive: make xive IPI allocation NULL-safe
    7e4b44abf682b pinctrl: spacemit: validate pins in pinconf callbacks
    09f47abc95ee9 pinctrl: generic: free maps on pinctrl_generic_to_map() failure
    9ab072a1469f1 pinctrl: eswin: Fix Handling of PIN_CONFIG_PERSIST_STATE
    91a6f4283099c objtool/klp: Fix symbol resolution for duplicate data symbols
    9f08c40740410 objtool/klp: Add .klp.symid for sympos disambiguation
    20938e167757d objtool/klp: Fix false module dependencies caused by dead relocs
    8844c2efd92ca objtool/klp: Normalize Module.symvers paths to module names
    ce962f04312fa objtool/klp: Fix module name normalization for paths with dots
    e82f260a74dea firmware: coreboot: Validate table bounds
    af8087f16714f bpf: Fix mmap_lock deadlock on arena lock failure
    db3439ad11ac5 wifi: cfg80211: stop PMSR before P2P and NAN teardown
    eef374088450b wifi: mac80211: disconnect on CSA to channel 0
    f26e1b1690455 wifi: brcmfmac: fix P2P action frame handling without device vif
    5f00970da7da0 perf build: Fix a build error on 32-bit x86
    cb04dd061d333 wifi: mac80211: skip unused probe response countdown offsets
    ef65c02a5a1fa wifi: zd1211rw: reject secondary interfaces to prevent conflicts
    4e0a67fbe3d9e wifi: nl80211: clean up color-change beacon data on errors
    c8ae335c4823e wifi: mac80211: send TWT teardown to peer after setup TX failure
    40120891f29d5 perf/cxlpmu: Fix 64-bit write to 32-bit HDM filter register
    6a1e24977e503 iommu/arm-smmu-v3: Convert to use atomic poll timeout
    88493d0d4c81e kselftest/arm64: Don't write to P0 in irritator on SME only systems
    f433869f23841 arm64: ptrace: Keep 'orig_x0' in-sync with x0 on syscall entry
    b568c2097a690 kselftest/arm64: fp-ptrace: Fix checks for inactive SVE and SSVE regsets
    b19c3fd8e2abb arm64/fpsimd: ptrace: Fix inactive SVE and SSVE regsets
    bd89a1988f44d arm_mpam: Apply T241-MPAM-6 to 63-bit counters
    6e61b07c34874 arm64: smp: Fix IPI teardown for GICv5 flow
    0bd829443a50b wifi: mt76: mt7996: remove beacon_int_min_gcd from ADHOC interface combinations
    045d1bfb72d26 wifi: ath10k: snoc: use memcpy_fromio() for MSA ramdump
    c770e7da8cebd wifi: ath12k: fix encrypted EAPOL TX in encap offload mode
    aff81505a84d2 wifi: mt76: mt7996: fix out-of-bounds link array access in mt7996_tx()
    c1442c345ca8d wifi: mt76: reject out-of-range link ids in mt76_vif_link()
    626dce25666a8 wifi: mt76: mt7925: Fix EHT Beamformee SS subfields to meet 802.11be minimum
    fa496e89e01cf wifi: mt76: fix queue assignment for disassoc packets
    c2dfb099ca941 wifi: mt76: mt7915: report RX chain signal for all RX paths
    42082f42969a3 wifi: mt76: mt7915: fix chainmask handling for non-dbdc phys on band 1
    2c488baccd973 wifi: mt76: mt7996: do not leave state behind after a failed WED attach
    d566387df8306 wifi: mt76: mt7996: do not attach hif2 WED when the main WED attach failed
    865c798933a03 wifi: mt76: mt7996: fix reg addr remap when addr is 0
    fb9c7b4c238b4 wifi: mt76: mt7915: release hif2 reference on probe IRQ failure
    648f5f03ff50d wifi: mt76: mt7915: fix ext PHY use-after-free on register error path
    29fbc5256c2d8 wifi: mt76: mt7915: fix double hif2 init on the non-WED path
    9e02b1cfb163b wifi: mt76: mt7996: fix MIB TX aggregation counter registers for mt7990
    60eb18612d216 wifi: mt76: set MT76_SCANNING when starting a hw scan
    fc3762724a368 wifi: mt76: mt7996: clear stale link state on full reset
    8826d7a5e2dd7 wifi: mt76: mt7996: free vif links after clearing wcid entries on full reset
    bb507affe9e23 wifi: mt76: mt7996: wake MCU waiters before aborting scan in L1 SER
    c667ec75881cb wifi: mt76: mt7996: skip key upload when adding an offchannel link
    beaa42b875965 wifi: mt76: mt7915: unlink TWT flow if the MCU rejects the agreement
    a6d7d7a253c55 bpf, x86: Fix trampoline stack size for 128-bit arguments
    d36ac53fc83ba bpf: Reject >8 byte return values on return-reading trampoline paths
    2b33064072c8c perf machine: Check snprintf truncation for guest kallsyms path
    8cd0affed95c6 perf machine: Free scandir entries in guest kernel map creation
    c2d36639d371c perf machine: Reset errno before strtol in guest kernel map creation
    2edeb8a9f07b6 perf machine: Don't abort guest map creation on first inaccessible dir
    f320fd080d036 perf machine: Check snprintf truncation in machines__findnew()
    e67b5cb76c5b9 perf machine: Guard against NULL strlist in machines__findnew()
    c760be5c9f1b7 perf machine: Fix NULL parent dereference in fork event processing
    bb43829acdf47 perf machine: Fix fd leak on bounds check in maps__set_modules_path_dir()
    201636c1cfd34 perf libdw: Fix outer-frame name resolution and spurious "(inlined)" tag
    da56e16f42930 perf unwind-libdw: Fix unwinding of multi-threaded processes
    cb8f0d60160be ASoC: SDCA: Add missing stub for sdca_fdl_free_state()
    29dc2e24f6adb regulator: core: use system_freezable_wq for init complete work
    cc6a0133c7495 arm64: tegra: Fix CMDQV interrupt type on Tegra264
    3a50428864437 ARM: tegra: Fix OF node reference leaks in IRQ init
    08331ff6fffad ASoC: tas2783-sdw: drop stale regcache on uninitialized re-attach
    bfa756f3b8bf8 ASoC: codecs: tas2783-sdw: Propagate regcache_sync() errors
    047a817147806 wifi: ath11k: fix leak in ath11k_service_ready_ext_event()
    00008e6f544c2 drm/msm/dsi: Drop dev_pm_opp_set_rate(0)
    e532b800728d7 drm/msm/dp: Drop dev_pm_opp_set_rate(0)
    54b17a858b8be drm/msm/dpu: Drop sneaky dev_pm_opp_set_rate(0)
    8a3aee5143ea8 perf: arm_spe: Make wakeup range check overflow safe
    2350896a36b58 drm/msm/dp: do not reject wide-bus modes while a YUV420 mode is active
    c89d481a50de2 drm/msm/dp: reject YUV420-only modes without VSC SDP support
    e2a99fa93b400 drm/msm: don't tear down KMS twice when KMS init fails
    0f00f6848f6b6 drm/msm/dpu: Fix DMA SSPP REC block offsets on DPU v13
    182cd086b31ea ACPI: processor: Unregister cpufreq notifier on init failure
    1558c267b78b1 wifi: mt76: only consume the WO drop bit on WED v2 devices
    4087cff2389c9 wifi: mt76: mt7996: add missing rdd_idx check when enabling background radar
    2bcbbfaaa648d wifi: mt76: mt7915: use little-endian for bss_info_ra wire fields
    e1383c17fb5d1 wifi: mt76: report data NSS for STBC frames in RX rate decode
    c4dc85481d389 wifi: mt76: cancel reset and rc work on device unregister
    ea69a378d77ca wifi: mt76: mt7996: don't leak MLD group index on remap alloc failure
    1a51aff0e048d wifi: mt76: mt7996: reserve space for the CSA-abort countdown TLV
    01e3d5707522e wifi: mt76: fix ER-SU 106-tone RU check in RX rate decode
    5f9c09e948cea wifi: mt76: decode the full VHT Rx STBC capability field
    594c4b7f89f9e wifi: mt76: mt7996: hold dev->mt76.mutex while disabling tx worker in SER
    71bf9de2ab3fb wifi: mt76: mt7915: unwind state on add_interface failure
    6ed0fba58bb12 wifi: mt76: fix out-of-bounds access in mmio copy helpers
    93eaddfdd35aa wifi: mt76: mt7996: bound TLV walk in mt7996_mcu_get_chip_config
    e6a7cfe073191 wifi: mt76: fix HE DCM max-RU capability encoding
    fd5a8b049a7e5 wifi: mt76: check txfree done event on the WED hw path
    636ab58493fc2 wifi: mt76: mt7915: poll the correct SLP CTRL register for the second adie
    a273dc3b86a7d wifi: mt76: fix RXDMAD_C buffer recycling race
    a83bc76d17131 wifi: mt76: fix uninitialised RXDMAD_C descriptor info
    0fd0bad6248dc wifi: mt76: fix stranded frames in mt76_txq_schedule_pending
    a68447b884548 wifi: mt76: fix 4th chain ACK RSSI bitmask in sta_poll
    93ce0dae8e770 wifi: mt76: mt7915: write RX header translation bit to the correct register
    7b47f11d6ce0f wifi: mt76: mt7996: don't report a zero TX bitrate
    ecfd1a07e78c3 wifi: mt76: mt7915: avoid nss underflow in mt7915_mcu_get_sta_nss
    a97b2b942d2f8 wifi: mt76: mt7915: clear wcid mask under mutex after RCU pointer clear
    4b92027fd043a wifi: mt76: mt7996: set MT76_MCU_RESET before waking MCU waiters on full reset
    b1c5cf8903bec wifi: mt76: mt7996: validate RX band_idx before dereferencing phys[]
    1584fd436132c wifi: mt76: assign link_id when sending probe request during scan
    186c957ac3325 wifi: mt76: fix non-AQL packet accounting for MLO stations
    0a951ff6704db wifi: mt76: mt7996: fix MLD ID in MAC TXD and HIF TXP
    db4be207f3f6d wifi: mt76: fix RX data queuing of RRO 3.0
    253b30a739ca1 wifi: mt76: mt7996: fix capability of EHT-MCS 15 in MRU
    a142565452eef wifi: mt76: mt7996: fix non-MLD station num_sta leak
    85a0d0bf97266 wifi: mt76: mt7996: fix EAPOL source BSS for non-MLD stations
    6a342db7a6502 wifi: mt76: mt792x: Fix memory leak in SDIO TX path
    27dbe86665dae wifi: mt76: mt7925: fix msg len mismatch between driver and firmware
    5cfd3d6078d91 wifi: mt76: mt7925: update clc before setting sar power table
    7b7060e262731 wifi: mt76: mt7927: set band index for sniffer mode
    f544bcba4721e wifi: mt76: mt7921: Add PCIe AER handler support to prevent system crash
    b250943f3f835 wifi: mt76: mt792x: fix use-after-free in mt76_rx_poll_complete
    0c46d22c30a16 wifi: mt76: add init_wiphy callback
    2691bf35cee6e wifi: mt76: mt7925: add NAN MCU helpers
    2ca99492a7bf7 wifi: mt76: connac: add NAN connection type
    d4029aab5be84 wifi: mt76: mt7915: fix net_fill_forward_path for non-DBDC mt7986
    ef0190f1fafa7 wifi: mt76: mt792x: stop USB register access after bus hang
    063169a2755ab wifi: mt76: fix handling channel context with different bands in mt76_switch_vif_chanctx()
    6def491fe9c4e wifi: mt76: mt76x02: do not WARN on invalid rx descriptor length
    2e3549a038f10 wifi: mt76: connac: add MT7991A (0x7991) to is_mt7996()
    3b052a39c4650 fanotify: report full event length for FIONREAD
    ef81e4a1628ec misc: sgi-gru: remove interrupt-context page-table walks
    961f4406a2dd3 misc: vmc_vmci: Fix potential memory leak in vmci_event_subscribe()
    a1584c5f05cb6 powerpc/crash: Fix possible memory leak in update_crash_elfcorehdr()
    2996d2a7cb92c powerpc/44x: Set GPIO chip parent
    4e8bfb2a3b271 powerpc: implement get_direction() in cpm2
    193fe50a497d4 dma-resv: Fix undefined symbol when CONFIG_DMA_SHARED_BUFFER is disabled
    34470cc3a8e66 iomap: release the folio batch on iomap callback failures
    20e9cbd3be1e3 dcache: keep shrink_dcache_for_umount() making progress on busy roots
    9be10f49dfc2e locking/lockdep: Fix NULL pointer dereference in __lock_set_class()
    1e202ab730014 pinctrl: qcom: shikra: Fix intr_target_width for summary interrupt routing
    c02d675e81468 md/raid1: create serial pool adding rdev to array with serialize_policy=1
    1f42e5898b45a fs: annotate inode timestamp accessors
    dff41b56ab7b7 i3c: master: adi: add OF module alias for autoloading
    618dd640ded6b i3c: dw: avoid shift-out-of-bounds when DAA assigns no devices
    c1f4d7763cdf1 swiotlb: Preserve allocation virtual address for dynamic pools
    8c486293ddd0a iommu/dma: Check atomic pool allocation result directly
    a58923756b0f8 md: scope memalloc_noio to allocation critical sections
    cc543e769b97d md/bitmap: resume array on backlog_store() error path
    af409d56bb38c clk: qcom: Return expected ENOMEM error on dynamic allocation failure
    e13c99679b548 clk: qcom: gpucc-qcm2290: Park RCG's clk source at XO during disable
    bb105eb8cce85 clk: qcom: gpucc-qcm2290: Keep the critical clocks always-on from probe
    679df05c771ae clk: qcom: gpucc-qcm2290: Move to the latest common qcom_cc_probe() model
    73d816a47fcc0 clk: qcom: gpucc-qcm2290: Drop pm_clk handling
    308f3349e2fd6 clk: qcom: qcm2290: Update DISPCC and GPUCC GDSC *wait_val values
    844e78f832279 clk: qcom: qcm2290: Add RETAIN_FF_ENABLE flag for DISPCC and GPUCC GDSCs
    dfc8dea60be27 clk: qcom: qcm2290: Set POLL_CFG_GDSCR flag for DISPCC and GPUCC GDSCs
    8b516ca0d040c clk: qcom: dispcc-qcm2290: Enable runtime PM support
    a0e5c01eb1df8 clk: qcom: dispcc-qcm2290: Move to the latest common qcom_cc_probe() model
    8bc5a909a6110 clk: qcom: negcc-nord: keep GPU2 CFG clock enabled via critical CBCR
    b88c019e2cca9 clk: qcom: gcc-nord: mark PCIe link clocks as critical
    9726f63fb9255 clk: qcom: negcc-nord: use clk_regmap_phy_mux for USB3 pipe clock srcs
    c3683217826d7 clk: qcom: nord: use BRANCH_HALT_SKIP for PHY pipe clocks
    948183bb89dc0 arm64: dts: qcom: eliza: Add fallback compatible for ADSP remoteproc
    a2074f86fc965 lib/test_hmm: fail dmirror_fault() when the mirrored mm is gone
    65e7240d679fe platform/chrome: lightbar: Limit payload to max packet size
    79347e42cfbc9 bpf: Fix potential UAF when reading bpf link info
    923f559e95b89 bpf: Fix potential UAF in bpf_netns_link_update_prog
    aab9d81a415c6 power: supply: sc2731_charger: cancel work on remove
    ad4f4e6678ecd power: supply: isp1704_charger: cancel work on remove
    3646c881b6adb arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Fix the PCIe iommu-map entries
    65fded30a4479 arm64: dts: qcom: qcs6490-rb3gen2: Fix the PCIe iommu-map entries
    d6c3c9c6cc382 arm64: dts: qcom: qcs6490-thundercomm-minipc-g1iot: Fix the PCIe iommu-map entries
    efcf504642bae arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Fix the PCIe iommu-map entries
    a1e2a5239cfc5 arm64: dts: qcom: lemans-evk-ifp-mezzanine: Fix the PCIe iommu-map entries
    e57c32625d30d arm64: dts: qcom: monaco-evk-ifp-mezzanine: Fix the PCIe iommu-map entries
    d0da19edc7baf arm64: dts: qcom: monaco-monza-som: Fix the PCIe iommu-map entries
    5ac48b3956ca9 arm64: dts: qcom: monaco: Fix the PCIe iommu-map entries
    3047cfd5ebdce arm64: dts: qcom: lemans: Fix the PCIe iommu-map entries
    eb16dcbce98bc arm64: dts: qcom: talos: Fix the PCIe iommu-map entries
    604e55211af9b arm64: dts: qcom: sm8750: Fix the PCIe iommu-map entries
    ff9c3c087b67a arm64: dts: qcom: sm8650: Fix the PCIe iommu-map entries
    9eb128da8525a arm64: dts: qcom: sm8550: Fix the PCIe iommu-map entries
    0ce01e1cd0c3b arm64: dts: qcom: sm8450: Fix the PCIe iommu-map entries
    1d6e5c05018be arm64: dts: qcom: sm8350: Fix the PCIe iommu-map entries
    8c8b4f2a352c1 arm64: dts: qcom: sm8250: Fix the PCIe iommu-map entries
    dcdb31fb3e978 arm64: dts: qcom: sm8150: Fix the PCIe iommu-map entries
    22a6fcd328ab1 arm64: dts: qcom: sdm845: Fix the PCIe iommu-map entries
    04ae73e1f607a arm64: dts: qcom: sc8180x: Fix the PCIe iommu-map entries
    bf3f0faa45144 arm64: dts: qcom: sar2130p: Fix the PCIe iommu-map entries
    5f6cc86e9d609 arm64: dts: qcom: kodiak: Fix the PCIe iommu-map entries
    36fb7eea71218 arm64: dts: qcom: kaanapali: Fix the PCIe iommu-map entries
    9d0e427b1bbba arm64: dts: qcom: sm8250-xiaomi-elish: correct the board ID
    58d595f2d695c arm64: dts: qcom: talos: Fix cpu6 1094.4MHz OPP frequency typo
    030376932ffd9 arm64: dts: qcom: glymur: Fix PDC IRQ mapping
    cbbaf0c870dde block: fix dio leak on metadata mapping error
    6809ba75b8bb5 firmware: qcom: scm: Fix tzmem state on probe retry
    6fab857eccfc6 firmware: qcom: scm: Fix reserved memory cleanup on probe failure
    f312ef5026678 firmware: qcom: scm: Fix NULL dereference in IRQ handler before __scm is published
    edad2969959f1 firmware: qcom: scm: instrument SMC call path with tracepoints
    0e93bb22355ef firmware: qcom: scm: add trace events for the SMC call interface
    cb3219dcb859b arm64: dts: qcom: sc8280xp-crd: Fix the pin index for misc_3p3_reg_en
    a9e8aa66c5387 arm64: dts: qcom: glymur-crd: Add FocalTech ft3d81 touchscreen support
    759308ce67e93 soc: qcom: pmic_glink_altmode: Define the TBT extradata properly
    c9edf04712b5c clk: qcom: gcc-qcm2290: don't park QUP RCGs upon registration
    cf8a53ea2a805 arm64: dts: qcom: qcs404: Fix DTBS Check errors in usb controller nodes
    099702ece0620 arm64: dts: qcom: sdm632-motorola-ocean: Fix LED default trigger property
    9f84fcd286907 arm64: dts: qcom: msm8976-longcheer-l9360: Fix accidental node override
    85fc83107415d arm64: dts: qcom: msm8998: Don't pull-up I2C pins by default in sleep
    4c31039af7423 rcu: Mark accesses to ->rcu_urgent_qs and ->rcu_need_heavy_qs
    0a3709557f885 PCI: dwc: ep: Clear MSI iATU mapping in dw_pcie_ep_cleanup()
    379913074bf47 md/raid10: consistently fail atomic writes that require splitting
    110092e68836e md/raid1: restrict atomic write limits and handle runtime constraints
    acff2713c3212 wifi: ath11k: fix stride mismatch in mac_phy_caps_parse()
    26f8f87f0a556 wifi: ath12k: fix stride mismatch in mac_phy_caps_parse()
    ba1ee854b681a Revert "serial: 8250: Clear CON_PRINTBUFFER on port re-registration"
    cd2e268520948 selftests/zram: fix kernel_gte() for POSIX sh
    81b39df5d7019 md: recheck spare changes before starting sync
    9bb9504e2d8f3 md: remove REQ_NOWAIT support from raid1/10/456
    f6215e3a65f19 tools/nolibc/powerpc: mark ctr and xer as clobbered by system call
    86d4e8c527dee fanotify: stop permission watchdog when timeout is zero
    0187a11e2d612 md/raid5: protect lockless recovery_offset accesses during reshape
    bae1d77351139 net: airoha: fix ETS QoS stats counter underflow and cross-channel corruption
    4b9a1b5203d4e md/raid5: fix lockless max_nr_stripes reads
    fcf21df7d3c50 md/raid5-ppl: fix use-after-free in ppl_do_flush()
    16b6e6243d81f md/raid5: protect bitmap batch counters aka seq_flush/seq_write consistency
    4743959aa8d87 bus: mhi: host: Fix controller cleanup on EDL sysfs failure
    84e713a8aa7fe bus: mhi: host: Flush the posted write after writing to MHI_SOC_RESET_REQ_OFFSET
    1b68b6e529ce7 wifi: rtlwifi: pci: fix error path in rtl_pci_probe()
    05c1081ae4503 platform/chrome: cros_ec_debugfs: Unregister panic notifier
    e97d1fce7173f platform/chrome: cros_ec_debugfs: Clean up console log on probe failure
    618781e47fb04 regulator: tps65185: handle gpiod_get_value_cansleep() error returns
    08835d42ce640 s390/vdso: Pass --eh-frame-hdr to the linker
    4d030d7d1af95 media: stm32: dcmi: fix some error handling bugs in probe()
    cb83cfff8dff5 media: qcom: iris: handle runtime PM resume failure in core deinit
    6bd10931ac2d4 media: qcom: iris: Remove duplicate HFI_PROP_OPB_ENABLE entry
    a5e341a25de36 media: qcom: iris: Fix bitmask test in iris_allow_cmd()
    8a61c211d0d52 drm/msm: remove objects from evit list after pinning them
    29d6bbda42aa9 PCI: starfive: Fix unchecked pm_runtime_get_sync() in probe
    dad14ba26c9a2 PCI: starfive: Fix Runtime PM handling and teardown ordering
    7c7fad5607dc2 wifi: ath12k: validate TLV length in process_tpc_stats()
    5de2b8c53714a wifi: ath11k: fix overreads in ath11k_wmi_process_csa_switch_count_event()
    bf97c9d512385 wifi: ath12k: fix overreads in ath12k_wmi_process_csa_switch_count_event()
    761cf9c63274a drm/panthor: Add vm_bind region with kbo range overlap check
    1a7958ce58dc9 spi: davinci: switch to managed controller allocation
    44ec34cd3cbea nvmet: reject out-of-range mdts values in configfs store
    06352dae949c1 nvme-pci: return error when parsing a quirk string fails
    be5eb47ee3fea nvme-fc: unmap cmd_iu DMA on rsp_iu mapping failure in init_request
    9e136150ac55d nvmet: fix return status of RMI log page on allocation failure
    48812c8103071 IB/isert: reject login PDUs declaring more data than was received
    352dc85324b29 IB/isert: reject PDUs declaring more data than was received
    c12cc56eb9fcd media: staging/ipu7: fix async notifier leak on init error
    a64e2beb45017 RDMA/cxgb4: free STAG index when TPT entry write fails
    5b96c5ba26a8f RDMA/mlx5: Send cong param changes to the resolved port mdev
    c75ee076fa097 RDMA/mlx5: Fix stack out-of-bounds read in cc_params debugfs
    6b15fc9bc117f RDMA/cxgb4: Fix dereg_skb leak and double free in write_tpt_entry()
    254579a81e49a riscv: dts: spacemit: Make dtschema recognize the etherent PHY correctly on K3 com260 board
    63ad1eb9dcebb riscv: dts: spacemit: Make dtschema recognize the etherent PHY correctly on K3 pico-itx board
    fcf7e0500ea9a clk: spacemit: k3: fix missing /2 factor in i2s sysclk dividers
    fcadc927cbff4 scsi: smartpqi: Fix AIO retry marker cleared by SCSI core between dispatches.
    f181155baf0c9 nilfs2: fix BUG in nilfs_copy_dirty_pages() on dirty state mismatch
    15c8559376416 nilfs2: prevent out-of-bounds read in super root block parsing
    8cea0bc78ac64 nilfs2: fix infinite loop in nilfs_clean_segments()
    44ea94a65fd27 clk: rockchip: Fractional PLL coefficient on RK3588/RK3576 is two's complement
    554c752ebd460 clk: rockchip: Fix the fractional part denominator on RK3588/RK3576 PLLs
    42a5661ff7e4c PCI: Fix UAF when probe runs concurrent to dyn ID removal
    e0b62b59a0abf PCI: Fix dyn_id add TOCTOU
    30f79038b676b PCI: Make pci_match_one_device() match on ID instead of device
    8e25cfa697a91 clk: mediatek: mt8135: Fix inverted gate control for devapc_ck
    6bc007ee691c3 clk/x86: pmc_atom: add kasprintf return value check
    a3c031fd2c4c8 clk: palmas: Manage external-control prepare with devm
    1183dc2450a26 clk: eswin: Zero-initialize stack-allocated clk_init_data
    fea0b4fd891a2 clk: mediatek: pllfh: Fix IO remapping leak in register_pllfhs error path
    8ed265c0b4720 clk: tegra: tegra124-emc: put EMC node on register failure
    41e42bf05da99 arm64: dts: allwinner: sun50i-a64-pinephone: Fix mpu6050 mount matrix
    0b56ad971fa02 wifi: mac80211: fix per-STA profile length in cross-link CSA parsing
    ce30b9f6ace6f media: stm32: dcmi: fix error handling on MDMA pool alloc failure
    1d4b590277347 RDMA/efa: Fix PBL chunk length computation
    4cfb448705da3 RDMA/rxe: Fix UAF in ODP init error-handling path
    417190bde0fda iommu/tegra241-cmdqv: Fix VINTF0 leak on the init-failure path
    0b139ec4641c7 iommu/tegra241-cmdqv: Require exactly one Stream ID for a vSID
    421f5ab135cd4 iommu/tegra241-cmdqv: Free the error IRQ before tearing down VINTFs
    86197679b293f iommu/tegra241-cmdqv: Don't fall back to a freed smmu after devm_krealloc()
    a168254ff8db0 iommu/tegra241-cmdqv: Don't run the error ISR before probe sets up vintfs
    f3ef4abc271a1 iommu/tegra241-cmdqv: Synchronize the error ISR against VINTF (de)init
    b4535b403d6bf iommu/tegra241-cmdqv: Publish an LVCMDQ only after it is fully initialized
    967a5ff8a614d fs/ntfs3: reject restart table growth beyond U16_MAX entries
    e67992e9089be staging: rtl8723bs: use kfree_sensitive() for key material
    c582b049fd021 arm64: dts: qcom: glymur: fix SoCCP memory mappings
    0dc9e289bbb54 remoteproc: qcom: q6v5: Request shutdown if crash is triggered host-side
    a8deb8980c636 remoteproc: qcom: pas: Add late attach support for subsystems
    61862ed651b24 remoteproc: Prevent crash handling to race with rproc_del()
    0ff49320a49ca remoteproc: core: Attach rproc asynchronously in rproc_add() path via schedule_work()
    38e4018ac5cc1 remoteproc: Allow shutdown of crashed processors
    b22af817f56d0 cpufreq/amd-pstate: Set min_limit_freq based on bios_min_perf
    732fc96c1f872 perf annotate: Be robust to annotating without a thread
    f173b0c5e6561 perf ui hists: In report UI ensure thread is set with reference counting
    b5ea46ba8a953 gpu: nova-core: fix packed registry table size
    973e3c9087f97 gpu: nova-core: build SetRegistry entries dynamically
    4d6270bbb4e08 sched_ext: Abort directly from the hardlockup handler
    30f4e6c8225ed sched_ext: Fix exit_cpu accuracy for lockup paths
    7965965aa2828 w1: ds2482: Fix signedness bug in ds2482_w1_triplet()
    1cd16c8d68f58 spi: oc-tiny: switch to managed controller allocation
    7069684d4bc68 clk: mediatek: mt6735: Unregister PLLs on probe failure
    1c90da6376e47 PCI/pwrctrl: tc9563: Power off only the external ports in tc9563_pwrctrl_disable_port()
    972c771674e88 PCI/pwrctrl: tc9563: Fix parsing the integrated Ethernet MAC Endpoint node
    3371d30a97a25 isofs: release zisofs block pointer buffer head
    16a56afd56c49 powercap: intel_rapl_tpmi: Handle PMU registration failure during probe
    74d2066418412 thermal/drivers/qcom-spmi-adc-tm5: Drop IIO_VAL_INT check in adc_tm5_get_temp
    82d250eb2a04b thermal/drivers/airoha: Fix copy paste error for sen internal
    bf7994d4d7f5e thermal/drivers/airoha: Fix copy paste error on clamp_t low temp
    67332b75ca7ec ACPI: bus: Avoid confusing complaints regarding missing _OSC features
    f917707f0de08 RDMA/mlx5: Fix integer overflow of user QP buffer size
    093f290dd8790 crypto: keembay - publish OF module alias for OCS AES/SM4
    5aae80dcec074 crypto: keembay - Initialize completion before requesting IRQ
    2b3fb5693c25c scsi: ufs: debugfs: Reserve space for a string terminator
    cfef700703d98 scsi: ufs: rpmb: Validate request frame length before parsing
    4b62f73836f4d scsi: ufs: core: Validate connected lane counts
    a769095d1d74e scsi: ufs: Avoid NULL CQE dereference when reporting invalid tags
    66da25277256b scsi: ufs: core: Validate string descriptors
    f7f970bc70529 power: supply: sbs-battery: Use a per-device serial number buffer
    d29a8ee271da1 arm64: RSI: fix field-spanning write warning in attestation token init
    df6bc642201d7 riscv: dts: spacemit: Fix phy id check for the phy on com260 board
    a510644ce03e7 riscv: dts: spacemit: Fix phy id check for the phy on pico-itx board
    9875c4587d651 tools/build: Allow versioning of all LLVM tools defined in Makefile.include
    e06785cba7f86 pinctrl: mediatek: free EINT resources on unbind
    b8fa1098ee9f6 pinctrl: mediatek: use devm_gpiochip_add_data() for GPIO chip
    908f3ea3f050b liveupdate: Remember FLB retrieve() status
    217775362e805 liveupdate: Reference count outgoing FLB data
    f2a3a52b82930 liveupdate: reject nonzero reserved value for SESSION_FINISH
    dc59caae4d8f7 riscv: dts: spacemit: Add enough deassert time for the PHY on com260 board
    bf26fb05720ba riscv: dts: spacemit: Add enough deassert time for the PHY on PICO ITX
    56140bd357c5d riscv: dts: spacemit: improve RTL8211F PHY configuration on K3 Pico-ITX board
    7c37d7cd2d0b5 power: reset: reboot-mode: Remove devres based allocations
    8f7683ce37a53 cxl/region: Fix use-after-free in find_pos_and_ways() error path
    c44c01167aed2 pinctrl: fix unmet dependencies from missing GPIOLIB
    1a6e68cd61174 selftests/bpf: Fix memory leak on subtest_states reallocation
    3d83554653bb2 selftests/bpf: Fix missing allocation null checks in test_progs.c
    8d2b2adee3b94 selftests/bpf: Fix incorrect error checking for pthread_create
    48a0209d8da0d bpf: Fix WARNING in bpf_tracing_link_release
    5de0acc36e233 ARM: lpc32xx: only run SoC init on LPC32xx hardware
    a2cbab47f44e9 bpf: Fix CFI mismatch in task work callback
    843419e12402b arm64: dts: rockchip: Fix rk3566-bigtreetech-cb2 touchscreen property
    94987478c83e0 arm64: dts: rockchip: Fix Gru WLAN sideband interrupt
    331fd2c8cd1e2 arm64: dts: rockchip: Add missing hclk for RK3588 eDP1
    d506e4a1b179f arm64: dts: rockchip: Add missing hclk for RK3588 eDP0
    24f20986b253c exfat: fix valid_size extension over a shared writable mapping
    8cb66c6579ab2 drm/panthor: return PTR_ERR() from devm_drm_dev_alloc()
    72caafbc95c5d fs/ntfs3: fix out-of-bounds read of INDEX_ROOT in reparse/objid init
    c408d416618eb netfilter: nf_nat_sip: rewind offset when NAT shrinks the packet
    fdb1a59dfc8cf drm/tve200: add OF module alias for autoloading
    0b37120b0bb53 perf trace: Correct default cpumask formatting to hexadecimal
    8edcf5385ca71 perf cap: Remove used_root parameter and simplify capability checks
    aabd063d7987c ASoC: spacemit: rename clock inputs to match binding
    5b856fd4a7632 clk: sunxi-ng: mux: fix determine helper rate propagation
    4eda2111b111c leds: pca9532: Fix phantom device registration on missing hardware
    c2b4cd53bc6f3 PM: hibernate: Fix memory leak in snapshot_write_next() error path
    334145d683ad3 RDMA/erdma: complete object teardown when the destroy command fails
    56a347950e661 xfrm: Fix skb double-free in xfrm_dev_direct_output()
    9562da57ff483 perf cs-etm: Avoid truncating AUX buffer sizes to int
    28bb9cb313477 perf cs-etm: Flush thread stacks after decoder reset
    a8412fdcd0007 gpu: nova-core: correct RISC-V HALTED field
    8f396ccaf128d riscv: dts: thead: th1520: remove pclk for I2C1
    e8a504606b945 riscv: dts: spacemit: k1: Split gmac_clk_ref into independent pinctrl groups
    da3066cee2c83 riscv: dts: spacemit: set console baud rate on K3 Pico-ITX board
    24f57e7c75b7e bitmap: Properly initialise destination bitmap for scatter & gather test
    4520d4a1db371 firmware: arm_scmi: Unrequest devices if driver registration fails
    826413b858ea2 firmware: arm_scmi: Roll back partial protocol table registration
    f4ade8d224756 cpufreq/amd-pstate: handle missing policy in dynamic EPP callbacks
    54d63431854b5 cpufreq/amd-pstate: Toggle auto_sel in active mode on shared memory systems
    f15b9aa413078 cpufreq/amd-pstate: Fix EPP return type and handle errors during initialization
    ba6ce23d17db3 cpufreq: amd-pstate-ut: Skip tests when amd-pstate driver is not active
    2f923ccc88715 ARM: dts: allwinner: a10: Fix PMU interrupt
    09c7565ebdf64 ext4: skip tail block zeroing for inline data files
    83663c0b73948 ext4: check dir entry fits before reading the hash trailer in ext4_search_dir()
    e1e342d9a561c ext4: fix buffer_head leak in ext4_init_orphan_info
    518df61b9b0a5 RDMA/bnxt_re: Clear VM_MAYWRITE on DBR/toggle page mmap
    9ddbc95dac167 wifi: ath11k: Avoid buffer overread in ath11k_wmi_tlv_op_rx()
    9e6ec0977f0b9 wifi: ath12k: Avoid buffer overread in ath12k_wmi_op_rx()
    919c31763d65d wifi: ath12k: fix survey indexing across bands
    0fd2c54d8a56a wifi: ath11k: Correctly copy the hint BSSID in WMI scan request
    84f87c46cec51 wifi: ath12k: Correctly copy the hint BSSID in WMI scan request
    8d66010645bc9 wifi: ath12k: allocate HOST_DDR and BDF regions after Q6 RO region
    39520ff5cdfdf wifi: ath12k: refactor QMI memory assignment
    c78e6912404ba wifi: ath12k: switch to name-based reserved memory lookup
    2f3635213ecf5 wifi: ath6kl: avoid buffer overreads in WMI event handlers
    f2dd3a8580dfd wifi: ath12k: fix ML-STA authentication timeout on QCC2072
    850211b0ba6ce wifi: ath12k: advertise ieee_link_id in vdev start MLO params
    1f77d0c58b6ab wifi: ath12k: Set IEEE80211_OFFLOAD_ENCAP_4ADDR after tx_encap_type vdev param
    2d3cb65c4846f wifi: ath12k: Advertise multicast Ethernet encapsulation offload support
    b4c7285779337 ext4: validate readdir offset before accessing dirent
    439aedfd7ae86 ext4: use fsdata to track inline data write state and fix race
    9fd3ffc3c51c9 ext4: drain in-flight DIO before buffered write fallback
    43ae387c3ae6a ext4: clear stale xarray tags on folios skipped during writeback
    7720fddd1fe34 ext4: fix ABBA deadlock in ext4_xattr_inode_cache_find()
    169772cd2147c thermal: intel: int3400: clean up ODVP on probe failures
    b801158f81fe7 iommu/arm-smmu-v3: Declare eats_s1chk and eats_trans as host-endian u64
    64e29e5099069 iommu/qcom: Fix inverted fault report check in qcom_iommu_fault()
    e3e12b851953b iommu/qcom: Remove sysfs device on probe failure path
    99d42aef089a0 iommu/amd: Fix undefined behavior in devid_write debugfs function
    21d35c5f46e99 firmware: arm_scmi: Fix requested device removal race
    c06f2856a1d7e RDMA/core: Fix potential use after free in ib_dealloc_pd_user()
    bfc119a40c04b RDMA/core: Fix potential use after free in uverbs_free_dmah()
    43403fe45379c RDMA/core: Fix potential use after free in ib_free_cq()
    64c72390d8407 RDMA/core: Fix potential use after free in counter_release()
    95c992c869df5 RDMA/core: Fix potential use after free in ib_destroy_srq_user()
    8a72a6aad84b3 RDMA/core: Fix potential use after free in ib_destroy_cq_user()
    001383248e5d7 RDMA/core: Fix use after free in ib_query_qp()
    56024193f6d73 RDMA/core: Add rdma_restrack_begin/abort/commit_del() operations
    638b9a5364c14 RDMA/mana_ib: drain QP references after partial table insertion
    61a25b8d333e1 RDMA/erdma: Fix CEQ tasklet use-after-free on removal
    3ec5f37e14bcb PCI: j721e: Fix incorrect max_lanes for J7200
    425addfb52c46 RDMA/srpt: Pass the mapped task attribute to target_init_cmd()
    641f814965d73 bpf: Mark bpf_refcount field as unique
    373a1e9366e71 bpf: Preserve unique-field state across nested structs
    92356df4aa2b0 bpf: Fix offset warn check for bpf_res_spin_lock
    a21001465264d virt: arm-cca-guest: use migrate_disable() for attestation token requests
    2373496c0dac3 ACPI: battery: Adjust charging status validation check
    08fe2eaa60918 bpf, riscv: Fix extable handling for arena load_acquire
    a6e11a81da342 riscv, bpf: Fix kernel stack corruption in tailcall with CFI
    2a3a29e900218 riscv, bpf: Fix memory leak in bpf_jit_free
    4c39115eb6e30 libbpf: Search /lib64 and /lib in resolve_full_path()
    0e94a2ca7905b selftests/bpf: Fix lsm_bdev dev_t encoding mismatch
    912189169df3f selftests/bpf: Fix make install target
    e2396b8a56207 bpf: Zero queue and stack outputs on lock failure
    27a3be4e965bf platform/x86: acer-wmi: reject missing gaming WMI results
    2fb8ff81659a5 ext4: skip extra isize expansion during mount to prevent deadlock
    36bf17bb90cdf ext4: fix out-of-bounds read in ext4_read_inline_dir()
    32f7ab52875ec ext4: fix circular lock dependency in ext4_ext_migrate
    6e11ac626f9f9 ACPI: PCI: Clear driver_data on all paths that free the acpi_pci_root
    355bee5f11acb ACPI: processor: validate MADT IOAPIC entry bounds
    2267448f67874 ACPI: EC: Avoid _REG disconnect on GPIO IRQ defer
    c57e238b475e8 RDMA/nldev: validate dynamic counter attribute length
    d324c4353f641 irqchip/gic-v3-its: Prevent leak in its_vpe_irq_domain_alloc()
    bf18426dddbf3 samples: rust: debugfs: fix excessive stack use
    5a9f8b7f11674 rust: device: make lifetime on `Core` and `CoreInternal` invariant
    082435d51f286 selftests/bpf: Silence maybe-uninitialized compiler warning in libarena
    555e689c46308 selftests/bpf: Silence array bounds warning in global_map_resize
    0fb8a60765319 selftests/bpf: Check malloc result with ASSERT_NEQ in test_sha256
    05e588ad77154 selftests/bpf: Check malloc result with ASSERT_NEQ in test_loader
    af33d192af2fb x86/bugs: Don't use cpu-type matching in cpu_vuln_blacklist
    b86e65df16da0 arm64: dts: imx8-ss-audio: Fix LPCG clock indices for ASRC0
    cb6b14e24b992 kcsan: avoid unintended access checking in NMIs
    bd02d644bd19a RDMA/srpt: Fix srpt_alloc_rw_ctxs() unwind counters
    c5643ea4f040a RDMA/bnxt_re: Validate udata before executing commands
    ee901a0f46515 RDMA/core: Add ib_no_udata_io() helper
    5ec111ddc1f72 RDMA/rxe: Validate num_sge/cur_sge before indexing wqe->dma.sge[]
    ca99431820e8c RDMA/hfi1: Propagate sdma_txinit_ahg() errors
    7e24fd5253fcf arm64: dts: amlogic: meson-axg-s400: enable mipi_pcie_analog_dphy for PCIe
    a22abf6d48eeb arm64: dts: amlogic: meson-axg: Add missing nand_rb0 pin to nand_all_pins
    0c52d48122a13 phy: starfive: Fix runtime PM cleanup in JH7110 DPHY RX probe
    da666984ffda4 phy: starfive: Fix runtime PM cleanup in JH7110 DPHY TX probe
    cdaa9cb77eb67 iio: dac: ad5686: missing NULL check on match data
    5ed1b048527be ASoC: meson: Keep link pointers valid on realloc failure
    2787034ea0163 dmaengine: dw-edma: Clear stale requests on termination
    6fc436e1500c5 dmaengine: dw-edma: Serialize channel state checks
    f71c94c1a6574 dmaengine: dw-edma: Serialize abort state updates
    f3ec6702a1d21 dmaengine: dw-edma: Terminate all descriptors without callbacks
    57cf929a33cb7 bpf: Disallow interpreter fallback for BPF_ADDR_PERCPU insn
    17da80d0c7b56 bpf: Disallow interpreter fallback for gotox insn
    408b6d3bc19c4 bpf: Disallow interpreter fallback for arena-related insns
    8a08635656037 bpf: Reject arena frees below the arena base
    49882b4d5290d arm64: dts: qcom: glymur: Add CX power domain to GCC
    9d7355c6040cf drm/msm/a6xx: Fix RBBM_CLOCK_CNTL3_TP0 value in a730_hwcg
    50fb8b5857d5c driver core: soc: Unregister bus on early device registration failure
    231bbc04c58f1 software node: Fix software_node_get_reference_args() with index -1
    07fee585336ac drivers: base: Remove statistics group if encryption group not created
    7244dd0f12629 drm/v3d: Associate BOs with every job that accesses them
    89d4159768527 drm/v3d: Convert submit helpers to operate on struct v3d_submit
    87bdadba51c57 drm/v3d: Make v3d_get_cpu_indirect_csd_params() a pure parser
    d7c6dfcd286db drm/v3d: Introduce struct v3d_submit and convert CL/TFU/CSD ioctls
    941522179e62f drm/v3d: Migrate BO reservation locking to DRM exec
    cfb009ab26186 drm/v3d: Extract v3d_job_add_syncobjs() helper
    a3e81f48c9e61 drm/v3d: Drop unused drm_encoder.h include from v3d_drv.h
    02438d15b0f41 perf build: Fix compiler errors with old capstone
    c91d07e966806 perf ui hists: Fix uninitialized stack memory free on pstack allocation failure
    c645f6dd1af2e mtd: part: reject MTDPART_OFS_RETAIN in mtd_add_partition()
    37be7bc2c2d09 mtd: mtdswap: Avoid freeing registered blktrans device twice
    529aeba63d448 mtd: intel-dg: Fix runtime PM error path in probe
    b07d0469126c1 soc: ti: knav_qmss: Remove debugfs file on teardown
    fda8fb7e81795 vfio/pci: clear vdev->msi_perm after freeing it on init failure
    1d36a009c8ee1 vfio: selftests: Avoid VLAs
    6fb4cd8ee68f6 char: xilinx_hwicap: unregister class on init errors
    4a6518be31602 ipack: ipoctal: fix UAF, null-ptr-deref, and use-after-free in cleanup on remove
    5c8927882b70b ppdev: prevent overflow when setting port timeout
    1105f6e7b3922 cacheinfo: don't propagate DT/ACPI error when arch supplies info (arm64)
    b044a6c443d55 misc: lan966x_pci: depopulate children on populate failure
    ab2fe43041412 misc: ad525x_dpot: use driver core groups for sysfs files
    3ac54631098a7 misc: rtsx: add missing write register handling
    4984277bc43f8 misc: bcm-vk: Use acquire/release for msgq_inited
    0b8177cca0c93 misc: pch_phub: Complete enum usage for device identification
    c70f3be8be0d5 mei: lb: fix incorrect type in assignment
    ca4489b3e5466 speakup: keyhelp: guard letter_offsets possible out-of-range indexing
    d65abe969dcb7 accessibility: speakup: Fix incorrect string length computation in report_char_chartab_status()
    ec5bd6731183e uio: Fix stale info pointer in failed registration path
    8bf5e01238c33 gpib: use 'static inline' instead of 'extern inline'
    0a53e4bc076ee gpib: Move stuck SRQ update under lock
    2750b16e85391 tlclk: if sscanf() fails, fall back to 0, not random value
    c48e5aa015255 staging: rtl8723bs: fix xmit_frame/xmit_buf leaks on mgnt-frame error paths
    b21cb958292ee UDF symlink pathComponent header OOB read
    56ad47bee6d37 tty: hvc: restrict HVC_DCC to ARMv6+ and ARM64
    977659adb341f usb: gadget: f_uac1_legacy: remove broken string configfs attributes
    d0667c263362b ACPI: processor: idle: Expand _LPI package sanity checks
    a88fae3508aa3 crypto: aspeed - Propagate platform_get_irq() errors
    6ee726526f08a crypto: sl3516 - drop invalid sg_dma_len checks before DMA mapping
    c5b52d79d6b2e wifi: rtw89: fw: use MAC source for IO offload delay command
    a28a7d9b3bb11 scsi: ufs: core: Avoid possible memory reclaim deadlock in TX EQTR context
    576312f027d15 bpf: Sync tail_call_reachable with callee state on entry
    09b360eb6ce34 drm/msm: Only fini scheduler after successful init
    d684f756d029d drm/msm: Fix task_struct reference leak in recover_worker
    8fc6a356f498d drm/msm/a6xx: Fix IRQ storm during msm_recovery test
    197912ffbb657 drm/msm/a6xx: Fix A621 GPUCC register list for state capture
    9d52bfc956c77 drm/msm/a6xx: Fix A663 GPUCC register list for state capture
    dc64cf9d71428 drm/msm: Recover HW before retire hung submit
    51fcee9d4140b drm/msm/a6xx: Fix stale rpmh votes after suspend
    105aaff286a15 drm/msm/adreno: fix use after free on error path in a6xx_gpu_init()
    b00290d1dc23a gpu: host1x: Avoid stack over-read in debug output helpers
    eb9f221498757 gpu: host1x: Fix offset calculation in trace_write_gather
    a1c4229ebeb46 gpu: host1x: Avoid double device_add when clients already present
    082b353c05b8e wifi: iwlwifi: mei: pass correct argument to function
    bc7a7ad930708 wifi: iwlwifi: guard against division by zero in iwl_dbg_tlv_alloc_fragments
    f7f770d12e6e9 wifi: iwlwifi: mei: check SAP message length before reading it
    2a77cb320e399 wifi: iwlwifi: mvm: fix off-by-one in TXF key sanitiser
    769e1910d41fd wifi: iwlwifi: fix counter type in iwl_fwrt_dump_error_logs
    1d74ddb6da546 perf stat: Fix duplicate output with --for-each-cgroup
    b3ce55b4a9da2 spi: geni-qcom: Fix sticky ret causing wrong return value on invalid proto
    3296c42d1c3c1 drm/solomon: remove unneeded variables in blit functions
    51a548f546519 soc: renesas: r8a78000: Drop duplicate "default ARCH_RENESAS"
    fa8dc4d73314c clk: qcom: gcc-glymur: Enable runtime PM
    64de7f5c2d5cd perf jevents: Add more components to the metric sorting order
    789395e53ebf4 perf sched: Free subcommand string after perf sched stats
    7a936fa41c55c perf sched: Fix memory leaks in perf sched stats report
    cf3282cf46be6 perf sched: Add missing perf_session__delete()
    c2d4db21ad2d5 arm64: dts: qcom: milos: Add reset for sdhc_2
    c5d8ff2d2f055 arm64: dts: qcom: sm8250: correct frequencies in the Iris OPP table
    9362c436aec0b arm64: dts: qcom: sm8250: sort out Iris power domains
    6f73a043f8248 arm64: qcom: ipq5018: Add GEPHY RX and TX clocks
    f9f86d8363a74 arm64: dts: qcom: ipq5018: Correct CMN PLL reference clock rate
    1d857673a0769 arm64: dts: qcom: glymur-crd: merge duplicate &pmh0101_gpios node extensions
    31901797093e0 arm64: dts: qcom: eliza: Enable first QUPv3 wrapper by default
    be3f5db2d705b arm64: dts: qcom: sc8280xp-x13s: Fix the drive-strength of mclk pin
    74689c170832f arm64: dts: qcom: msm8996-xiaomi-gemini: Fix up ti,drv2604 enable GPIO
    fb97d1d6c2069 x86/mm/pat: Take cpa_lock around large-page collapse
    9ff718df54737 drm/bridge: tc358767: clamp the reported AUX read size to the request
    b375b66a47222 perf: evsel: Fix error handling in tp_format lookup
    2907676ed67aa remoteproc: qcom: Fix glink->node reference leak in qcom_add_glink_subdev
    688f621a8d9c4 remoteproc: qcom_q6v5_mss: Fix MDM9607 subsystem control instance ID
    beab49fb74054 remoteproc: qcom_q6v5_mss: Make ssctl_id configurable per platform
    73a9119d57e7a cpufreq: schedutil: Fix self-contradictory comment in sugov_iowait_apply()
    b12839d2af893 cpufreq: intel_pstate: Fix setting minimum P-state at init time
    ae56bcb41607d drm/amd/display: remove duplicate link_dp_panel_replay.h include
    c71783a6ed19a drm/amd/display: fix wrong register field in dccg35_set_hdmistreamclk_src_new
    7ccdcfbb8617c drm/amd/display: Remove unused-but-set variable hubp from
    6970ec944567f drm/amd/display: Fix DM I2C teardown race
    f0c4b7ca24d2e OPP: Fix cleanup ordering
    7d102d1f06318 media: ipu6: Do not free aux device pdata after init
    de9be39cefda1 media: bcm2835-unicam: Fix asc leaked in error/remove path
    c4b00825780a4 media: platform: amd: fix unmet dependency for VIDEO_V4L2_SUBDEV_API
    76511a617ae4b media: i2c: rdacm21: Fix missing media_entity_cleanup()
    78cdd9438ad3b media: ti: vpe: Select V4L2_FWNODE for VIP
    7c614f83301d4 irqchip/renesas-irqc: Fix generic interrupt chip leak on remove
    f58abff399f72 PCI: keystone: Fix OF node reference leak in init
    578ab48dc684c PCI: xgene: Drop unnecessary OF node reference
    f9ed38e80443a cpufreq: spear: Fix an IS_ERR() vs NULL bug in spear1340_set_cpu_rate()
    68682c9b7b8ca dax: fix holder_ops race in fs_put_dax()
    eb412f80311fc dax: read holder_ops once in dax_holder_notify_failure()
    c8c16c2de9114 dax/fsdev: fail probe on invalid pgmap offset
    7b642bd3d3910 dax/fsdev: use __va(phys) for kaddr in direct_access
    9b0f91dc9147a dax/fsdev: clear pgmap ops and owner on unbind
    93c5509033e47 dax/fsdev: don't leave a dangling dev_dax->pgmap on probe failure
    d298a0513aaf7 dax/fsdev: clear vmemmap_shift when binding static pgmap
    58db9b927866b dax/fsdev: fix multi-range offset in memory_failure handler
    154540d584ae1 dax: fix misleading comment about share/index union in dax_folio_reset_order()
    6beaef33ee568 libnvdimm/labels: Bound the on-media label size before the shift
    a8e3a0e8997de tools/sched_ext: scx_qmap: Fix stale API name in comment
    92a4e01e2ef89 regulator: adp5055: Fix error code in adp5055_of_parse_cb()
    ca95b15a0760e cxl/features: Clamp Get Feature output size to the remaining buffer
    16b7c99eff030 cxl/features: Reject Set Features output buffer smaller than the header
    329ea475581c6 cxl/features: Reject Get Feature count larger than the output buffer
    4635953b4c1af firmware: arm_scmi: Fix transport device teardown lookup
    c59b3393df134 firmware: arm_scmi: Fix SCMI device destroy lifetimes
    3515aed7fe424 firmware: arm_scmi: Unwind P2A receiver mailbox setup failure
    9958f55eace8b firmware: arm_scmi: Unwind TX receiver mailbox setup failure
    45e54438f4fd8 firmware: arm_scmi: Fix OF node reference handling
    3f4cf1edf7365 firmware: arm_scmi: Clear SystemPower flag on create failure
    77d2985d1e80e firmware: arm_scmi: Drop handle on protocol bind failures
    09d08581ead97 firmware: arm_scmi: Protect device request lookup with RCU
    ad39c232ffac7 firmware: arm_scmi: Use channel ID for transport teardown
    0b6e59eb885f9 firmware: arm_scmi: Reject out of range DT protocol IDs
    bab26acebe55e firmware: arm_scmi: Avoid IDR updates while cleaning channels
    fbaebd380caa4 firmware: arm_scmi: Free transport channel on IDR failure
    43aad7687238d firmware: arm_scmi: Clean up channels on setup failure
    5e30d3d16d1a9 firmware: arm_scmi: Quiesce notifications before teardown
    74fcaa0a3f7ad firmware: arm_scmi: Unregister device notifier before IDR teardown
    a1bc587568a4e firmware: arm_scmi: Publish channel state before callbacks
    54be1b7c1eb80 x86/entry/fred: Encode frame pointer on entry
    ccbd20f2168f5 wifi: ath11k: cap out-of-range rx MCS instead of leaving bogus rate
    3dfa1b8ccf7c3 wifi: ath12k: fix rx_mpdu_start layout for QCC2072
    329b10ddc919b wifi: ath12k: fix MLO peer delete race
    af405d216316d wifi: ath12k: fix dp_link_peer dangling references on AP vdev rollback
    473ea7aa35615 hfsplus: validate thread record before delete key rebuild
    8e0c487b0b1b5 cxl/port: Restart port enumeration when a sibling adds the dport first
    7682b617db1f1 cxl/features: Serialize multi-part Get/Set Feature transfers
    ada7aa90eb65d cxl/pci: Honor -EPROBE_DEFER from component register setup
    e77594e0cea67 cxl/mbox: Break poison list loop on an empty payload
    5354222bef789 cxl/memdev: Fix firmware upload exact-fit handling
    dc0a119613617 cxl/test: Rework cxl_type2_mem_init() to use cxl_mock_platform_device_add()
    455e817515ffc iommufd: Simplify iommufd_device_remove_vdev()
    795113f9da49f arm64: dts: renesas: r9a09g047: Fix PCIe dma-ranges memory space code
    531ff98bcec50 arm64: dts: renesas: r9a09g056: Fix PCIe dma-ranges memory space code
    92425d1fdebc4 arm64: dts: renesas: rzt2h-n2h-evk: Remove unused MII/GMII pins
    e559626bee8a6 rpmsg: glink: fix deadlock in endpoint destroy during driver detach
    b86dbfe4583bf fs/resctrl: Fix UAF from worker threads when domains are removed
    6bd8bfb85257b perf record: Fix multiple PERF_RECORD_COMPRESSED2 records per push
    9f06abd2f64f5 perf record: Return the written size from process_comp_header()
    4c593c62c1499 fs/resctrl: Prevent use-after-free in rdtgroup_kn_put()
    5116fef23016e tools/sched_ext: scx_flatcg: Fix uninitialized stats on allocation failure
    9fb74dce5c650 media: v4l2-async: Unregister sub-device if asc_list is empty
    fb66f61a8e752 rust: drm: gpuvm: require Send + Sync for the driver's associated data
    59c557d2474c3 iommufd/selftest: Avoid selftest dirty bitmap size wrap
    9c6eace8d07e9 isofs: fix out-of-bounds page array access on empty zisofs block
    4e0af1264a0ff ASoC: apple: mca: increase SERDES reset delay
    6247fbddbcdf1 RDMA/hfi1: Initialize debugfs after probe completes
    364be5873f2ab RDMA/hfi1: Stop flushing the global IB workqueue
    83fe4e4f4fbf0 RDMA/hfi1: Free RX data on late probe failure
    4204f5c0312ba RDMA/hfi1: Preserve unit 0 on allocation failure
    b1e1b25723af4 RDMA/rvt: Return NULL after port allocation failure
    0d85891822df0 misc: rtsx_usb: avoid USB I/O in runtime autosuspend
    901951d0ed7a7 pmdomain: bcm: bcm2835: handle genpd provider registration errors
    6514c99d2c7d5 ALSA: hpi: Check transport errors during HPI6000 adapter initialization
    26b6b14c7a036 esp: do not unref managed frag pages in esp_ssg_unref()
    5f35a29a5eed3 xfrm6: fix out-of-bounds write in xfrm6_input_addr() when secpath is full
    ed566979f99c5 crash_dump: release keyring reference at the correct time
    30e78390af056 hwrng: ks-sa - Fix runtime PM cleanup on registration failure
    e6d3c7eae75a4 crypto: ccp - Fix memory leak in SEV INIT_EX path
    364f3841bc22c crypto: ccp - Fix possible deadlock in SEV init failure path
    5de981b7db1f5 Revert "drm/msm: dsi: fix PLL init in bonded mode"
    96379c2dec725 drm/msm/dp: add missing drm_edid_connector_update() before add_modes on cached EDID
    0d37e2503efd1 RDMA/rxe: Avoid reprocessing the current packet after the QP enters the error state
    24ce944721dcd RDMA/ipoib: Drain RCU callbacks during module teardown
    4664368b9bd9d RDMA/mlx5: Drain RCU callbacks during module teardown
    48b72fa0d209a RDMA/core: Wait for RCU callbacks before unloading ib_core
    ea4a4237b161a iio: accel: dmard09: Implement IIO_CHAN_INFO_SCALE
    13a472452dcd5 wifi: rtw89: 8852a: fix RSSI report when average beacon RSSI is not ready
    280145253fd38 bpf: Mark tracing_multi trampolines as ftrace managed
    b7e2a5c6519ad bpf: Require a BPF cpumask for bpf_cpumask_populate()
    b425cc3913fb1 clk: qcom: camcc-sc8280xp: unregister CAMCC_GDSC_CLK
    b7cd0d057e4fc bus: qcom-ebi2: use managed resources for clocks and children
    f98700ea19755 soc: qcom: rpmh-rsc: manage PM notifiers with devres
    a819fd4479c7f perf metricgroup: Fix metric expression copy leaks
    ad44537175f7e clk: spacemit: k3: fix parent clock of UFS aclk
    c4e364ecb8098 perf record: Fix teardown hang on system-wide multi-threaded sessions
    c30c5ae811eea drm/panel: samsung-s6d16d0: Power off on prepare failure
    a0ac59897309e usb: chipidea: imx: fix missing ret assignment for dev_err_probe
    616dfbd3a0b48 usb: typec: ucsi: gaokun: unwind notifier on UCSI register failure
    9ada6c7692c0c usb: renesas_usbhs: Fix power-off ordering on unbind
    7a5b2e8ec85ac usb: mtu3: allow system suspend during active gadget connection
    428a82d987fcd platform/surface: acpi-notify: Check ACPI companion before use
    d25dd08268aea platform/mellanox: mlxbf-pmc: Check ACPI_COMPANION() against NULL
    3308b8c5f5a28 platform/x86: asus-wmi: fix resource leaks on probe failure
    e6a9c6b79b700 usb: fix UAF when probe runs concurrent to dyn ID removal
    9e6f57107c188 usb: gadget: aspeed_udc: check endpoint DMA allocation
    9c4bc8f7426aa usb: ljca: bound bank_num in ljca_enumerate_gpio()
    969bf1c64b840 usb: typec: tcpm: fix EPR AVS APDO maximum voltage decoding
    36315a330e067 usb: gadget: configfs: fix out-of-bounds read of qw_sign
    58952c83dfe6e usb: gadget: f_fs: Fix fence cleanup in ffs_dmabuf_transfer() error paths
    3819c6f255a37 usb: gadget: uac: validate rate list length before storing
    59faa59c25a0a serial: qcom-geni: do not advance stale DMA completions
    494bb296407fe serial: ma35d1: Fix OF node reference leaks in console init
    606f769df00d8 serial: 8250: Clear CON_PRINTBUFFER on port re-registration
    08182086dca4e media: platform: amd: use refcount_t instead of atomic_t
    55bb98850f392 spi: qcom-geni: Fix missing error check on pm_runtime_get_sync()
    7bfa711f311a5 platform/x86: asus-wireless: Fail probe when there is no ACPI match
    73e2e363a9661 perf capstone: Fix kernel map reference count leak
    01f6c6ff9ebfb selftests/sched_ext: Fix bpf_link leak on early return in prog_run
    891aee54b39d2 hwspinlock: propagate errno when registering single lock
    56a3846830ac9 bpf: Reject rdonly/rdwr_buf_size kfunc arguments that exceed u32 max
    bce6b48af3abf remoteproc: qcom_wcnss: Fix handling the lack of PD regulators in v3
    5aed51501447e remoteproc: qcom_q6v5_adsp: Fix reference leak for device node
    f3614622dc41f bpf: Drop scalar id on sign-extending narrowing stack fills
    acc1903222505 platform/x86: lg-laptop: Fix LED resource handling
    392c19faec6bf platform/x86: dell-wmi-base: Fix handling of ultra performance key
    f59cd5007055c platform/x86: dell-wmi-base: Fix resource leak on module load failure
    ef59ff891adf9 platform/x86: dell-privacy: Fix race condition
    3fd86a5d6facb ACPI: RISC-V: Fix riscv_acpi_add_prt_dep() loop handling
    088c1c8592134 ACPI: RISC-V: Check acpi_get_handle() status in riscv_acpi_add_prt_dep()
    b0f9c3418735b ACPI: RISC-V: Fix riscv_acpi_irq_get_dep() loop termination
    8f194dee0c0d1 printk: Fix possible console use-after-free
    a09efb1e256f0 leds: st1202: Validate LED reg property against channel count
    f1a049284bcb7 leds: st1202: Disable channel when brightness is set to zero
    6d711caa9f240 leds: st1202: Fix brightness having no effect while pattern mode is active
    14bb601435c02 leds: st1202: Set all pattern PWM slots to full after clearing pattern
    037359b67bb9c leds: st1202: Fix spurious pattern sequence start in setup
    2e3900c92db27 leds: st1202: Fix pattern duration prescaler and pattern_clear skip marker
    523902fc6f2e0 leds: st1202: Stop pattern sequence before reprogramming
    e9d1f11c70498 leds: pca9532: Fix inverted GPIO output polarity
    2c1795907ac5a arm64: dts: mediatek: tungsten-smarc: Remove unnecessary cells
    585a58a6568d2 iommu/amd: Fix false positive in SB IOAPIC IVRS validation
    5af7fdb7659b0 iommu/amd: Prevent SB IOAPIC from overriding IVRS validation errors
    697c84154983e iommu/msm: Return -ENOMEM on memory allocation failure in probe
    35ebd93daaec0 bpf: Fix security_bpf_map_create error handling
    90f661bcfaf3a iommu/mediatek-v1: Fix off-by-one in MT2701_LARB_NR_MAX
    21c6445366795 bpf: Reject programs with inlined helpers if JIT is not available
    8467d5a2fb87e bpf: Introduce jit_required flag and remove bpf_prog_has_kfunc_call()
    8f3f64faee335 bus: mhi: ep: Fix device refcount leak in the error path of MHI device creation
    2b2a903bee56d bpf: Fix use-after-free on mm_struct in bpf_find_vma()
    cab81e3ad9485 efi: fix stale reference to efi_recover_from_page_fault()
    86d11c594d60b bpf: Fix vmlinux BTF prep race in bpf_get_btf_vmlinux
    8e29690f91286 perf dso: Fix kallsyms DSO detection with fallback logic
    20740a2115723 perf vendor events amd: Reintroduce deprecated Zen 5 core events
    7ff668cfc3960 drm/amdgpu/mes: Fix hung_queue_db_array loop limit for multi-XCC
    272c97f9286d5 bpftool: Check EVP_Digest when computing excl_prog_hash
    c4058355d2748 udf: Mark LVID buffer as uptodate before marking it dirty
    6be64cca6527f usb: gadget: r8a66597: avoid double free of ep0_req in probe error path
    62efee3515663 usb: typec: ucsi: unregister debugfs entries on teardown
    d67607e774952 thermal/drivers/rcar: Fix error checking in probe()
    437d6d15936db staging: media: ipu7: fix pm_runtime refcount leak in ipu7_resume()
    acd23fc1af6f7 staging: media: ipu7: fix pm_runtime refcount leak in ipu7_init_fw_code_region_by_sys()
    19d5566b84ca1 bpf: Reject writes through untrusted BTF pointers
    1238e1c7e5d3d perf data convert json: Fix trace_seq memory leak in process_sample_event()
    6993d1fdb9de2 perf record: fix poll storm when monitored threads exit
    f7a1cf9f679da clk: qcom: gcc-qcs8300: Use retention for USB power domains
    8dcdeb8e2337c clk: qcom: gcc-qcs8300: Use retention for PCIe power domains
    6ccc420af8188 arm64: dts: qcom: sc8180x-lenovo-flex-5g: Describe the display power net
    1d6f9c6e84523 arm64: dts: qcom: sc8180x-lenovo-flex-5g: Rename regulator nodes
    c7e72d6d5126e arm64: dts: qcom: sc8180x-primus: Describe the display power net
    c64326ede83c2 arm64: dts: qcom: sc8180x-primus: Rename regulator nodes
    9ff0ec945a73f arm64: dts: qcom: sdm670-google: add lpi reserved gpios
    488c42ff7f42f arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Fixup panel compatible
    07bb368ae12b8 arm64: dts: qcom: sc8280xp-arcata: Fix top USB-C DP alt mode
    40bd77fa2857c clk: qcom: gdsc: tear down per-domain genpds in gdsc_unregister()
    fade2037ee2aa clk: qcom: gdsc: propagate gdsc_enable() failure for ALWAYS_ON domains
    02533b6cf5f69 clk: qcom: gdsc: propagate gdsc_check_status() errors from gdsc_poll_status
    609ebd03deee4 arm64: dts: qcom: Add #{address,size}-cells to Chromium-based /firmware
    ac2f3219b3303 timekeeping: Account for monotonicity adjustment in ntp_error
    ad25b583d5919 y2038: uapi: Use 64-bit __kernel_old_timespec::tv_nsec on x32
    1f0c3c0c36c7a time/namespace: Validate nanosecond field in proc_timens_set_offset()
    a36bf15ab84c5 timers/migration: Fix memory leak in tmigr_setup_groups() error path
    7099de4de14af timekeeping: Unwind aux clock sysfs children on failure
    2a4ffc16d3a78 clocksource: Unregister subsystem on device registration failure
    d739c63bfa385 selftests: timers: leap-a-day: Fix -w option and update usage comment
    dd32537936976 irqchip/gic-v3-its: Fix its node leak in gic_acpi_parse_madt_its()
    de5d0190c97fe irqchip/gic-v3-its: Fix memleak in its_probe_one()
    10f639168da59 selftests/lsm: Fix memory leak in attr_lsm_count
    ab0c755ad5e7a selftests/bpf: Fix memory leak in msg_alloc_iov
    88500a86ab79f s390/bpf: Replace ly instruction with llgf
    e626a50d07d43 bpf: Reject MEM_ALLOC BTF accesses past object bounds
    5280e0d3d6a5c selftests/bpf: Fix memory leak in msg_alloc_iov error path
    0916005195488 selftests/bpf: libarena: Clean up allocation state before buddy tests
    c812c2ff5507d ALSA: via82xx: Remove unreachable branch in snd_via686_pcm_pointer()
    08d6d9800e2e1 kbuild: unset sub_make_done before calling kselftest build system
    911190f0b9511 staging: rtl8723bs: fix mismatched free of HalData in rtw_sdio_if1_init()
    b2243ffaac14c staging: octeon: add missing napi_disable in cvm_oct_rx_shutdown
    41a79bd9e5a74 staging: octeon: add missing tasklet_kill in cvm_oct_tx_shutdown
    b7fa32159dc51 staging: fbtft: Use sysfs_emit_at() to print to sysfs file
    cfcc5a41a9664 greybus: audio: bound the topology section sizes against the fetched size
    d13a82297796b staging: sm750fb: Add missing Kconfig dependency
    dd5767bd42401 staging: sm750fb: gate dualview dataflow using g_dualview
    fbf9e0f2d5369 staging: greybus: audio: correct sscanf() return value check
    1c2a4ab6efa26 wifi: mac80211_hwsim: avoid NULL skb in stop queue drain
    b2adb0e2f313e PCI: qcom: Skip PERST# GPIOs provided by downstream PCIe devices
    c6eca03162e1c bus: qcom-ebi2: Fix clock leak on probe failure
    f28e119378322 arm64: dts: qcom: sc8280xp: sort reserved memory regions
    7a9ab46f1e2eb clk: qcom: gcc-glymur: Move EVA clocks to critical clock list
    784d168036a4b arm64: dts: glymur-crd: Add reset GPIO to touchscreen node
    368b8e4299650 arm64: dts: qcom: glymur-crd: Move common board nodes to shared DTSI
    45f5512f13113 arm64: dts: qcom: glymur-crd: Add Embedded controller node
    6f1ed14f6c5e1 arm64: dts: qcom: glymur: Fix gcc clock specifier for usb_mp_qmpphy nodes
    144094da5b917 arm64: dts: qcom: glymur: Fix unit-address mismatch for spmi_bus2
    da9ddc8ba43ca arm64: dts: qcom: hamoa: Fix clocks for HSPHYs
    19c802bcaf764 arm64: dts: qcom: sm6125: Use 64 bit addressing
    f78fcc42099fe arm64: dts: qcom: sm7225-fairphone-fp4: Fix address in fb node name
    e7483891df45e arm64: dts: qcom: sc8280xp-blackrock: switch to uefi rtc offset
    4b6f2aebaa922 arm64: dts: qcom: monaco: fix wrong connection for the replicator
    bee77cd34ce83 clk: qcom: gxclkctl: Use custom disable callback for gx_gdsc
    dee085f96cb91 clk: qcom: gdsc: Add custom disable callback for GX GDSC
    78d9daf5e13ad cgroup/cpuset: Make nr_deadline_tasks an atomic_t
    195d7cca6433e PM: sleep: Fix off-by-one in wakelocks number limit check
    46b5a0f22bfd4 bus: ti-sysc: Fix /chosen node reference leak
    d553a9dc1c456 nvmet-rdma: fix response resource leak on queue teardown
    e24951cab8aa6 nvmet-rdma: factor out response resource cleanup
    840ab22ffa4d8 nvme-apple: Use acquire/release for queue enabled state
    0550a269c04b8 fuse: move "epoch" from dentry.d_time to fuse_dentry.epoch
    02d4ee65dc2e8 RDMA/bng_re: return a timeout when firmware responses stall
    ec790449ad225 arm64: dts: qcom: talos: Fix GMU unit address
    59d485a6289cb arm64: dts: qcom: sm8750: wire UFS to ice instance
    a6c0e693a7c88 RDMA/irdma: Add refcounting to user ring MRs
    ff994bedc6690 RDMA/irdma: Add irdma_cq fields to track pbl allocations
    e4df2e98e4393 RDMA/irdma: Add a refcount to track user ring MR associations
    dc043b8d976df RDMA/irdma: Deduplicate the irdma_del_memlist logic
    a3217fe799862 crypto: keembay - Fix AEAD unregister count in error path
    0a261177ad324 crypto: rk3288 - fail ahash requests on HASH idle timeout
    9486a6bcc90de hwrng: omap - Fix probe error path cleanup
    bdc3b37a935f2 hwrng: xilinx-trng - propagate timeout before any data is read
    b68b35ed97d3e crypto: sa2ul - stop probe if context pool creation fails
    94abda77b57a3 crypto: atmel-sha204a - fix heap info leak on I2C transfer failure
    add28e9988902 crypto: atmel-ecc - reject hardware ECDH without a public key
    92e4979e1a770 crypto: qat - clear AES key schedule from stack
    1a106c6e17525 crypto: qat - cancel work on re-enable SR-IOV timeout
    bee8d1fcdc8f3 hwrng: core - fix rng list on registration error
    15732636ac123 perf vendor events amd: Update Zen 6 core events
    e9d249a231845 perf vendor events amd: Update Zen 5 core events
    6959e254f522c perf test amd ibs: avoid using executable heap
    1b3d6fef10e69 perf/x86/amd/uncore: Add group validation
    945e335da3402 libbpf: Detect uprobe syscall with new error
    7273ac5e72408 libbpf: Change has_nop_combo to work on top of nop10
    16776fb9c55de perf cs-etm: Filter synthesized branch samples
    54080d72abb3c perf cs-etm: Fix thread leaks on trace queue init failure
    56e2ff5c9be15 tools/nolibc: mark arg1 operand in __nolibc_syscall0() as write-only
    08af0f96120a2 fanotify: initialize permission event watchdog state
    1b3fecd099100 uprobes/x86: Move optimized uprobe from nop5 to nop10
    310a504467a18 uprobes/x86: Allow to copy uprobe trampolines on fork
    88a3464c421f1 uprobes/x86: Do not leak trampoline vma mapping on optimization failure
    1ca1ca70e90a9 uprobes/x86: Remove struct uprobe_trampoline object
    f132fc01b359a wifi: rtw89: fix HE extended capability length check
    942becee7e788 wifi: rtw89: check return values in rtw89_ops_start_ap()
    80ea28c94cf18 wifi: rtw89: fw: fix link ID filling for LPS MLO common info
    6268f46d83875 platform/chrome: sensorhub: Fix memory overread in ring handler
    582b5e5362455 wifi: rtw89: fw: correct preload field of w2 in rtw89_fw_h2c_default_cmac_tbl_be()
    876b110114da3 wifi: rtw89: debug: fix off by on in rtw89_ppdu_str()
    e984c63bd3359 selftests/rseq: Replace glibc-specific __GNUC_PREREQ with portable check
    343aa5275484d csky: Fix a4/a5 restoration in syscall trace path
    feb0901bbcaf9 iio: orientation: hid-sensor-rotation: Avoid race between callback setup and device exposure
    c1900758c3a8b soundwire: qcom: Fix port exhaustion check in stream_alloc_ports
    8b5654d317277 dmaengine: xilinx_dma: Fix CPU stall in xilinx_dma_poll_timeout
    54c9b3315adac dmaengine: hisilicon: Return -ENOMEM on dynamic memory allocation in probe
    aec7cf9a5bd89 dmaengine: zynqmp_dma: fix race between runtime PM and device removal
    c3e943490ced0 dmaengine: xilinx_dma: Fix channel idle state management in AXIDMA and MCDMA interrupt handlers
    8896852b6fcd3 dmaengine: mediatek: mtk-uart-apdma: Return -ENOMEM on memory allocation failure
    7d83720d0741d leds: lp5860-spi: Fix an error handling path
    989f3d01fc196 leds: lp5860: Fix a potential double-unlock
    1017fe1c7f48e mm/mm_init: handle alloc_percpu failure in free_area_init_core_hotplug
    915c2d9d69fc6 bpf,lsm: Drop bpf_prog_free from sleepable_lsm_hooks
    1d39861b9c41a selftests/bpf: Mask socket type flags in mptcpify prog
    ff3f22ed8d2f3 bpf: Copy per-CPU map value padding in copy_map_value_long()
    03b44839ce81d tools/bpf/bpftool: Reset vmlinux BTF after struct_ops commands
    f6fd865651ccf tools/bpf/bpftool: Reset vmlinux BTF after map commands
    8d52adf7c923b bpftool: Strip all -Wformat* flags from bootstrap libbpf build
    32bd68edbc6cb drm/amd/display: Fix dangling pointer in CRTC reset function
    80c0f51aced43 drm/amd/display: Fix dangling pointer in plane reset function
    4bd683d1a7d33 ASoC: ti: j721e-evm: Avoid mixing goto with guard()
    daaac025b1588 ASoC: samsung: i2s: Avoid mixing goto with guard()
    06aef6dcc1d52 drm/amdgpu/pm/powerplay: bounds-check voltage index in Vega10 lookup
    1664327ce797e drm/amdgpu/pm/powerplay: bounds-check voltage index in SMU7 lookup
    83c680de6d41d drm/amd/powerplay: fix VoltageObjectInfo zero-stride loop and OOB read
    fceac25487b21 regulator: tps6594: Fix device node reference leaks in multiphase loop
    f88c65473f525 PCI: imx6: Fix building against PCI_PWRCTRL_GENERIC
    6d0343961cebe PCI: imx6: Fix building against PCI_HOST_COMMON
    385f7a0f62b2e perf tests: Fix flakiness in branch stack sampling tests
    8c0a67e54ec32 perf tests: Fix flakiness in BPF counters test on hybrid systems
    16d72de0201e8 perf tests: Fix flakiness in trace record and replay test
    cf79e50a1d30d perf tests: Add robust record retry helper and use subsecond workloads
    a69133af55da2 perf tests: Fix Python JIT dump profiling test failure
    5aa6eb9129c46 perf tests: Skip metrics validation if system-wide recording lacks permission
    63aa9756ce0b6 perf test: Truncate test description to fit terminal width
    b0f59d0a779eb perf parse-events: Restrict core PMU bypass to --cputype option
    2097ae16533d3 perf evlist: Add reference count checking
    fa437210fcbd6 perf evsel: Add reference count
    744f25f0cbab4 perf evlist: Add reference count
    a1a3ba14f4430 perf util: Sort includes and add missed explicit dependencies
    5678f866a499c perf pmu: Recognize default_core as a core PMU in more places
    e482f9ee97762 wifi: ath12k: correct monitor destination ring size
    de3e556137804 wifi: ath12k: fix TLV32 length mask
    82396ecb8f518 media: keymaps: Remove obsolete RC_MAP_HAUPPAUGE_NEW keymap define
    4661b90eb66fb media: keymaps: Remove obsolete RC_MAP_RC5_TV keymap define
    b7f54ac6a1313 cxl/test: Propagate -ENOMEM on platform_device_alloc() failures
    348a95be32389 cxl/test: Add hierarchy enumeration support for type2 device
    3e0285b77f515 cxl/test: Refactor platform device enumerations
    3f6fba439a2d3 cxl/test: Add test for module parameters
    66aa3763cf3fe perf test: Skip failing 'perf test aslr' test case
    15a6207d39b16 workqueue: only show running workers in stall diagnostics
    0d98c5669d01c riscv: kexec_file: Fix crashk_low_res not exclude bug
    23d41b2e68765 drm/panthor: Fix NPD issue on partial unmap of an evicted BO
    f01cb11729447 drm/panthor: Support sparse mappings
    e215d705f5a07 drm/panthor: Pass vm_bind_op to vm_prepare_map_op_ctx
    727f043d699ab pinctrl: bcm2835: Don't remove an unregistered GPIO chip
    76777e5d5139f perf/x86/intel: Keep cap_user_rdpmc in sync with RDPMC user-disable state
    1a6a214f732d9 pinctrl: imx1: fix device_node leak in dt_is_flat_functions()
    64aa1bb4017d5 perf/x86/intel/uncore: Fix uncore_box ref/unref ordering
    9c8967bcbb77e perf/x86/intel/uncore: Introduce PMU flags and broken state
    23fcbd6df3fd3 perf/x86/intel/uncore: Factor out box setup code
    18f4d93162155 perf/x86/intel/uncore: Let init_box() callback report failures
    c27d15aac37a6 perf/x86/intel/uncore: Fix refcnt and other cleanups
    5026e40cf9268 perf/x86/intel/uncore: Fix PCI PMU cleanup on setup failure
    a48296454b486 perf/x86/intel/uncore: Keep PCI PMUs working when MMIO/MSR setup fails
    f94e62d21faad sched/fair: Fix overflow in update_tg_cfs_runnable()
    089e307fda2ea sched/core: Fix inter-class wakeup_preempt()
    d452a11898eb2 mm/mm_init: fix incorrect node_spanned_pages
    e0773ad25a34a drm/lima: call drm_mm_init() with a valid allocation range
    666700062f1ce clk: imx: scu: drop redundant init.ops variable assignment
    99a07a8976704 arm64: dts: imx8mp-ab2: Enable MU2 for DSP communication
    11047c7ed5cc3 arm64: dts: freescale: imx95-toradex-smarc: add alias for lpuart5
    4e29df25bbe67 arm64: dts: imx93-kontron: set memory node to 0x80000000/1GiB
    db414a1cb1d46 firmware: imx: sm-misc: Add NULL check for kmalloc in syslog_show
    bea093a6e388b ARM: OMAP2+: Fix OF node reference leaks in omap_hwmod
    67c9db97fa087 ARM: imx: fix device_node refcount leaks in imx7_src_init()
    6b60c84e78469 ARM: imx: fix device_node refcount leak in imx_src_init()
    48852aed10700 clk: hisilicon: reset: Use devm_kzalloc to initialize hisi_reset_controller
    eebc053abef68 arm64: dts: imx8mp-frdm: Add missing HDMI DDC pinctrl
    22c944e440bc9 ASoC: fsl_audmix: rework runtime PM handling in probe
    a47f087877bb2 ASoC: rt700-sdw: always drain jack work on remove
    3d9f555852975 clk: stm32: add missing bitfield.h header
    a0a546a9625d3 clk: nuvoton: ma35d1: fix ma35d1_clk_pll_determine_rate logic
    ff955d3d1c45e clk: nuvoton: ma35d1: fix PLL_CTL1_FRAC bit field width and fractional calc
    0a6901e715bae clk: nuvoton: ma35d1: fix ignored div_u64 return values in PLL freq calculation
    36d5c243d2db6 clk: moxart: remove unused variables, fix refcount leak
    69815429f8bc7 clk: eswin: Add CLK_IGNORE_UNUSED to NoC clock
    c37fa5d8b2a69 clk: canaan: Clear rate fields before reprogramming dividers
    7b38ddc1c1fb0 clk: versaclock7: Fix APLL clock leak on probe failure
    9c2b1efef2537 ARM: imx: avic: Fix OF node reference leaks
    f0c12add5439d cxl/pci: Remove incorrect mbox.valid check in cxl_pci_type3_init_mailbox()
    723808b2c117c arm64: dts: imx943: Correct PCIe outbound address space configuration
    0c6897bdadffb arm64: dts: imx94: Correct PCIe outbound address space configuration
    b4e11c731d6be cxl/mbox: Clamp mailbox output allocation to the payload size
    4992cdc4eb979 ASoC: SOF: ipc4-topology: Return error for invalid number of formats
    a81768b43b592 mtd: rawnand: pl353: Fix debug prints
    6559174fcb151 media: cec-pin: Fix event FIFO ordering
    394dec22a5d59 soc: samsung: exynos-pmu: fix of_node refcount leak in exynos_get_pmu_regmap()
    99330b12376c3 HID: roccat: bound device-supplied profile index
    12c889727ddc0 HID: nintendo: Fix imu_timestamp_us double increment per report
    0fecd89f979a8 HID: core: quiesce input in hid_hw_stop() to prevent use-after-free
    b1af4cccae717 selftests: proc: include fcntl.h in proc-pidns
    54d6b0ee9b8ba platform/chrome: cros_ec_typec: Reject out-of-bounds PD cap count
    aeb3e0083a07d x86/cfi: Use symmetric SYM_START and SYM_END in __CFI_TYPE()
    6a052a154106e drm/bridge: of-display-mode-bridge: Fix missing static const for the bridge funcs
    26cb44b0afff9 sched_ext/scx_flatcg: Fix cvtime_delta race and add hweight scaling to bypass charging
    c776670f4ec9d cgroup/cpuset: Avoid unnecessary cpus & mems update in cpuset_hotplug_update_tasks()
    f2df709905ab6 smack: restrict smackfs/{direct,mapped} values to 0-255
    4d27a82210103 smack: deduplicate smackfs/{direct,mapped} file_operations
    c62a818897189 smack: simplify write handlers of sysfs entries
    d02c55e3ea82e smack: fix incorrect task context in smack_msg_queue_msgrcv
    66f8255d1dd0f drm/bridge: cdns-mhdp8546: Return an error pointer on allocation failure
    4a2355385486c drm/bridge: cdns-dsi: Return an error pointer on allocation failure
    b49e7a24cf5bd rust: drm: gpuvm: update DriverGpuVm for DeviceContext
    c69e63065f35b drm/rockchip: vop2: Recognise 10-bit YUV422 as YUV format
    a53cc0561dd18 drm/rockchip: vop2: Add RK3576 to the RG swap special case
    0d33645973227 drm/display: hdmi-state-helper: Try subsampling in mode_valid
    0b9878aba5cf9 drm/v3d: Clear queue->active_job when v3d_fence_create() fails
    3b259831b7388 gpu: nova-core: gsp: tu102: keep unloading if FWSEC-SB fails
    23c02299e7d13 drm/bridge: display-connector: trigger initial HPD event for DP
    a1303a44165dd drm/bridge: display-connector: don't autoenable HPD IRQ
    887315e5d2eb8 drm/rockchip: analogix_dp: Fix OF node reference leak via auto cleanup
    4cd23a6e5c9d6 drm/rockchip: analogix_dp: Enable hclk for RK3588
    69173c1ebedec drm/rockchip: vop2: Wait for layer cfg done before switching LAYERSEL_REGDONE_SEL
    e83dbc07404a0 drm/rockchip: vop2: Fix wrong wait target in layer cfg done check
    11f07929f454e drm/rockchip: dw_dp: Release core resources
    b66710d95db2f drm/rockchip: dw_dp: Add missing newline in dev_err_probe() message
    48aaa495e24ce drm/bridge: synopsys: dw-dp: Support unregistering the AUX channel
    317dc1ead82e2 drm: lcdif: Wait for vblank before disabling DMA
    ef28f1970de4b drm/tegra: dsi: Re-add clear enable register if DSI was powered by bootloader
    873fab4fa057b drm/atomic: Drop drm_private_obj.state assignment from create_state
    20a30536d60e3 drm: Remove unused header in drm_dumb_buffers.c
    b34b41c5bda73 Smack: Fix error in capability bypass
    dfc4ee8954d3e KVM: x86: Check EFER validity on KVM_SET_SREGS*
    8fb2065261ec6 KVM: x86: Move the bulk of register specific code from x86.c to regs.c
    562f2b0c8824a KVM: x86: Rename __{g,s}et_sregs2() => kvm_vcpu_ioctl_x86_{g,s}et_sregs2()
    515dead3bb640 KVM: x86: Move get_segment_base() to regs.h, as kvm_get_segment_base()
    e92b03627ad89 KVM: x86: Extract REGS and SREGS runtime sync code to helpers
    34c1d674cef84 clk: qcom: Fix test_ctl_hi field for DEFAULT_EVO PLLs
    6a78b7697a88e mm/mremap: reset unfaulted VMA page offset for MREMAP_DONTUNMAP
    b1e740b915662 nvdimm: virtio_pmem: refcount requests for token lifetime
    c4a140f0a30f2 nvdimm: virtio_pmem: use READ_ONCE()/WRITE_ONCE() for wait flags
    fc25f9a9db8ee nvdimm: virtio_pmem: always wake -ENOSPC waiters
    c9cd77db17a98 nvdimm: virtio_pmem: stop allocating child flush bio
    72561ca1ab96f nvdimm: pmem: keep PREFLUSH before data writes
    e9414030257b4 nvdimm: preserve flush callback -ENOMEM
    007bc1842317b memcg: move LRU size accounting on reparenting instead of copying it
    4e30fbd26e84e ksmbd: fix tree connection use-after-free in smb2_tree_connect()
    a6c88e5e3a75f smb/server: fix tree connection leak in smb2_tree_connect()
    35d5c59fe6b1d ksmbd: fix maximum allowed access checks
    7fa251df1110e btrfs: abort transaction before releasing tree_log_mutex on commit failure
    9cf8c4c60020b tracing/probes: Fix BTF kflag check for anonymous struct member access
    b8f5e4ab11e09 tracing/probes: ignore id update from btf_type_skip_modifiers
    15f78eea8c4be staging: sm750fb: fix mono image source stride mismatch in lynxfb_ops_imageblit()
    daed571f85fe3 udf: Fix data loss when converting inline inodes to out of line
    d347c971aaddc udf: Move udf_map_block() up
    4822a030929e0 dm-pcache: validate the persisted dirty_tail chain at load
    150e71808d371 i3c: master: Do not treat master device as a duplicate target
    50034d8d0f797 i3c: master: Fix use-after-free of master->this
    b4bf8af5e7d7d dm-pcache: validate seg_id fields from persistent memory
    9dc73c51ed3ee i3c: master: Fix recursive locking during device registration
    6ecf17bf5fe8d i3c: master: Fix device_register() error path
    96b066831f6e0 mm/damon/core: skip aging from repeated aggressive merging
    e54602d9e38db batman-adv: bla: avoid CRC corruption due to parallel claim add
    f68038c77a2f3 batman-adv: dat: atomically update mac addresses
    fe3772ea9d269 drm/amd/display: Scale custom brightness curve from full range
    a300e35c0a4b4 Linux 7.2.5
    be15b8da4a82c ksmbd: zero pipe read compound padding
    ecdcceed4d377 PCI: Allow per function PCI slots to fix slot reset on s390
    8418a7201bb3f PCI: Introduce PCI_SLOT_PLACEHOLDER constant for slot_nr placeholder value
    fb27cd32dd781 mm/damon/vaddr: drop last same folio access check optimization
    e3db5d6bb0349 mm/damon/paddr: drop last same folio access check reuse optimization
    91b75a9e79e98 mm/damon/ops-common: use nr_accesses moving sum for quota score
    8a96a06e04d21 mm/damon/core: avoid infinite kdamond_merge_regions() internal loop
    013731074ab6a power: supply: ab8500_fg: fix use-after-free on remove
    7a184e6f211c8 power: supply: ab8500_fg: Remove redundant dev_err()/dev_err_probe()
    57dba479a3e1f remoteproc: qcom: pas: Guard dtb metadata release with dtb_pas_id check
    ea0408273ccf5 rpcrdma: arm rn_done before publishing the notification
    c4efdc1d4cb3e bpf: Disable preemption in bpf_get_stackid
    f1e97925827c5 bpf: Use stack id functions instead of __bpf_get_stackid
    b3024de68b817 bpf: Factor stackid_new_bucket from __bpf_get_stackid
    370069c1f627c bpf: Factor stackid_fastpath function from __bpf_get_stackid
    b8cf96ff8c113 bpf: Factor stackid_init function from __bpf_get_stackid
    8cc98db4fc590 ksmbd: fix use-after-free in oplock break notification
    88abd367fe8a7 drm/nouveau/gsp: fix vblank interrupts on GB20x
    37ae6066f65e6 drm/nouveau/disp: fix head state readback on GB20x
    37a758989faa5 drm/nouveau/disp: fix HDMI GCP AVMute register offsets on GB20x
    20ca0fdad658e drm/nouveau/disp: fix HDMI vendor infoframes on GB20x
    dbcaa9d0e9ee5 drm/nouveau/disp: route GSP-RM display MMIO through nvkm_disp_func hooks
    a1db244bb2828 drm/nouveau/disp: move the GSP HDMI GCP AVMute write to engine/disp
    0cec2ceb5d955 drm/nouveau/disp: move GSP head-timing ISR and vblank helpers to tu102.c
    c60033c172420 drm/nouveau/uvmm: clear the dirty flag when unwinding an OP_UNMAP_SPARSE
    4083d24c2636f drm/nouveau/uvmm: fix premature region free on failed OP_UNMAP_SPARSE
    3857238de6bce drm/nouveau/uvmm: fix NULL deref unwinding an OP_MAP_SPARSE op
    4f3f9deca7e79 drm/nouveau: Use write-combined maps for coherent
    1fef7553dc628 drm/nouveau: unsubscribe the channel-kill event before the fence context
    ae5d57131dbff drm/nouveau/gsp: use per-version DP_CONFIG_STREAM params on r570 firmware
    4deb29b9d33bf drm/nouveau/dmem: fix mismatched DMA unmap size for large folios
    0163b92946d0a drm/nouveau/dmem: fix callocated underflow on large folio split
    10e92e18e3dab drm/pagemap: Fix folio allocation fallback and use-after-put
    f34f8b904592e drm/sysfb: ofdrm: Fix is_avivo() constant comparison bug
    d9daf9a6e7a6f drm/sysfb: ofdrm: Fix integer overflow in fb_size calculation
    bbdc6761c5566 drm/sysfb: simpledrm: Improve stride validation
    48c60b763a0dd drm/sysfb: simpledrm: Improve panel-size validation
    5683b1b2a6090 drm/sysfb: simpledrm: Improve framebuffer-size validation
    62e744babd0b5 drm/amdkfd: Reject zero-sized AQL queue allocations after size halving
    c643c229babe2 drm/amdkfd: guard against NULL restore_mqd in CRIU queue restore
    0a9a0e8a97da7 drm/amdkfd: Fix the case that vm range is hole at svm_migrate_copy_to_vram
    58e866711b234 drm/amdkfd: fix scope of mqd_mgr dereference in pqm_debugfs_mqds
    a2035918a7a1d drm/amdkfd: Fix error path at svm_migrate_copy_to_ram
    6aae545c87087 drm/amdkfd: Add TLB flush after MES queue eviction/suspension
    6decb921f7c58 drm/amdgpu: use AMDGPU_GPU_PAGE_SHIFT instead of PAGE_SHIFT
    4e651478656b5 drm/amdgpu: update the fw version for gfx12 userqueues
    bcc58f2ef7708 drm/amdgpu: update the fw version for gfx11 userqueues
    c931aedaf18c9 drm/amdgpu: Skip accessing psp rum time db for APUs
    ebe7542553d00 drm/amdgpu: force complete the MES ring fences on reset
    bdd6a58743e00 drm/amdgpu: force complete the KIQ ring fences on reset
    4614011a844b4 drm/amdgpu: fix Idle BOs list in VM debugfs status info
    c41cc2632bd60 drm/amdgpu: fix byte/dword unit mismatch in coredump IB dump
    236ccf3ff9fde drm/amdgpu: fix autosuspend cleanup during removal
    6ea36fc580cdb drm/amdgpu: Disable runtime PM for externally attached dGPUs
    0bfb938182d13 drm/amdgpu: clamp the isolation index for rings outside a partition
    4d030c3487074 drm/amdgpu: delay ttm buffer func enablement on xgmi
    fd4746ed0574d drm/amdgpu: check thunderbolt before switcheroo registration
    a46ab76b6cf54 drm/ttm: Drop tt->restore after successful restore
    e6195b941fdc8 drm: Fix drm_crtc_commit leak if signaled when PAGE_FLIP_EVENT is used
    d152b582d852c drm/msm/dsi: round 6G byte clock rate to the PLL-achievable value
    eab46d9629807 drm/gud: validate TV mode names before creating enum property
    6ea61f1d4cbaa drm/gud: NUL-terminate TV mode names read from the device
    9ae19bd60891b drm/amdgpu/vcn: fix integer overflow in dec_msg buffer count check
    25ad527dc92aa drm/amdgpu/gfx8: only apply compute quantums to KCQs
    2d2071d673039 drm/amd/display: Set gpuvm min page size to 4K on dcn35/36
    647426f78a344 drm/amd/display: Remove const Qualifier From Non-Pointer Fields
    b10cc09b32924 drm/amd/display: validate plane degamma LUT size for private color prop
    3891405e64885 drm/amd/display: Fix HPD consideration for VGA/LVDS connectors on DCE
    dac29cbb405b9 drm/amd/display: fix dc_lock leak on GPU reset error paths
    15ee43aad0df4 drm/amd/display: avoid divide-by-zero in __is_lut_linear()
    ac908108d1977 drm/hibmc: Use drm_atomic_helper_check_plane_state()
    93f36cf57c729 drm/hibmc: Fix list of formats on the primary plane
    d8c055b34ab3a drm/nouveau/disp/r535: Add scanline position support + head state support
    423fd96d094c1 drm/ssd130x: fix column and row end address in partial updates in ssd133x
    956005c09cfd9 drm/sun4i: fix refcount leak in sun4i_backend_init_sat()
    adadda76184eb drm/ssd130x: fix column and row end address in partial updates for ssd132x
    84829e324a396 drm/i915: Guard against NULL driver_data in i915_pci_probe()
    80e4fd48b9004 drm/i915/display: Clear SEL_FETCH_PLANE_CTL on plane disable
    2d1215a72159d drm: fix race between partial drm_dev_register() failure and ioctl
    972afe6d53140 drm/panel-edp: fix i2c adapter leak on probe failure
    f7f61839ba393 drm/bridge: dw-hdmi: fix i2c adapter leak on probe failure
    3e5c7cddc0073 drm/panthor: fix firmware control interface bounds checks
    6ae19dce3e8c1 drm/panthor: harden firmware build-info bounds checks
    c659ba6939702 drm/xe/vram: report FLAT_CCS base misalignment
    967a179463d32 drm/amdgpu: avoid force-completing uninitialized UVD rings
    3e234c6face86 drm/amdgpu: Fix init ordering in amdgpu_vram_mgr_init()
    c42608c09b6b5 f2fs: fix to zero post-EOF data when extending file size
    0b196c07407f4 f2fs: fix to pass folio->index to f2fs_sanity_check_node_footer()
    153df7dc3aaee f2fs: fix to reclaim space in f2fs_allocate_pinning_section()
    931e1aa4d44c5 f2fs: fix valid block count leak on data block allocation failure
    bee6dfcc111b1 f2fs: protect critical_task_priority updates with s_umount
    3923ec2b98c96 f2fs: fix to clear dirty flag on folio in error path
    436cdabc64c10 f2fs: fix to off-by-one issue in f2fs_zero_post_eof_page()
    e88a37a6ec5d9 f2fs: fix to return -EFSCORRUPTED in f2fs_get_node_info() correctly
    4e85a62b0c27b f2fs: fix i_size when pinned fallocate partially fails
    905411f650487 f2fs: fix to avoid potential deadloop in f2fs_fsync_node_pages()
    b9776094aa711 f2fs: fix to migrate all curseg types during free_segment_range
    8f3b99c50dd0d f2fs: avoid NULL checkpoint thread access in sysfs
    cc34df18da92f f2fs: fix folio_nr_pages() race after put in large folio invalidate
    93a3e6a4c9e72 f2fs: fix dentry folio leak in find_in_level
    99d14d61aa8be f2fs: embed f2fs_gc_kthread in f2fs_sb_info
    34d9717097485 f2fs: fix to avoid potential section-unaligned pinfile
    47a4aaa566226 f2fs: don't drop the top folio order in the f2fs_iostat tracepoint
    317d32e1a8dea f2fs: limit recovery filename logging to stored length
    cb0446b707668 f2fs: return writeback error from collapse range
    ab31e3b774f5d f2fs: use the mount idmap for the owner check in f2fs_xattr_advise_set()
    83f234dcb0e8d f2fs: dirty directory inodes on mtime/ctime update
    dcae1eeda5314 f2fs: validate MOVE_RANGE destination size
    c14282d35ea86 f2fs: fix to avoid move_range and defragment on device_alias file
    89c65ec3c1890 f2fs: only redirty pinned folios in redirty_blocks
    45837717808fb f2fs: reject overlapping move range after len expansion
    5ba01cc400413 f2fs: return symlink writeback errors
    e9bfb56e2c1bd scsi: qla2xxx: Skip NVMe LS reject IOCB when FW not started
    7881faf862ee3 scsi: qla2xxx: Zero-init bsg stack buffers to avoid info leak
    4cd349f89daa3 scsi: qla2xxx: Use coherent DMA buffer for D_Port diagnostics
    7d0b3f745efb2 scsi: qla2xxx: Hold vport_slock for host map update in report ID acquisition
    91fde7ad72253 scsi: qla2xxx: Drop vport reference under lock in report ID acquisition
    e70036dc2ddc0 scsi: qla2xxx: Fix NVMe abort reference leak on repeated abort
    35124cfa9898b scsi: qla2xxx: Avoid req_q_map double-read in qla2x00_error_entry()
    f6e8977bce887 scsi: qla2xxx: Bound rsp_info_len to avoid OOB sense-data read
    845d4abd92cd2 scsi: qla2xxx: Avoid double completion in async IOCB timeout
    157ca7d1af45f scsi: qla2xxx: Quiesce response IRQ before freeing request queue
    df86c27cf1ba9 scsi: qla2xxx: Fix response queue over-consumption in __qla_consume_iocb()
    29f1f9ad9e354 scsi: qla2xxx: Reject non-SCSI SRB on status IOCB fast path
    a6374b508893d scsi: qla2xxx: Don't query firmware state while chip is down
    aac0d3cb91991 scsi: qla2xxx: Fix FCE trace enable parsing in debugfs
    9f31de4d07e4c scsi: qla2xxx: Zero mailbox struct in qla2x00_get_firmware_state()
    41ef7edde27ac scsi: qla2xxx: Fix FCE trace use-after-free during firmware dump
    122bf170c94a3 scsi: qla2xxx: Fix cs84xx use-after-free on host teardown
    33735490789e5 scsi: qla2xxx: Serialize flash version read in reset handler
    33c77254e6e91 scsi: qla2xxx: Clamp MSI-X derived queue counts to avoid truncation
    b02ff132017b2 scsi: qla2xxx: Hold qpair lock when sending NVMe LS reject
    f2d4f025b67fc scsi: qla2xxx: Bound image count in qla2x00_update_fru_versions()
    9fc03be982763 scsi: qla2xxx: Zero dport diagnostics buffer to avoid info leak
    61f05f2e98f0f scsi: qla2xxx: Check entry_status in qla24xx_modify_vp_config()
    f4aaa4a4e6f1d scsi: qla2xxx: Initialize NVMe abort_work once at submission
    d556f899964d1 scsi: qla2xxx: Hold vport reference in qla24xx_report_id_acquisition()
    e25241f9fa01f scsi: qla2xxx: Fix BSG job leak on validate flash image error path
    b185375d2996b scsi: qla2xxx: Fix Name Server logout detection on FWI2 adapters
    75fd6d041c4a3 scsi: qla2xxx: edif: Fix NULL pointer deref in RX SA delete check
    47049fdadc0ea scsi: qla2xxx: Bound i2c->length in I2C bsg handlers
    a5501c4225623 scsi: qla2xxx: Zero SFP DMA buffer in FRU/I2C bsg handlers
    2215e55ee1e5e media: chips-media: wave5: Resume device before setting EOS flag
    2e5b9d632da6d media: chips-media: wave5: Fix pipeline stall when queuing fails
    63d758d2f9dba media: chips-media: wave5: Defer job_finish() only when a DEC_PIC was queued
    c104f37b9f79d media: chips-media: wave5: Add timeout while stop_streaming
    dc37c478ed659 media: chips-media: wave5: avoid skipping device_run while VPU has work
    8c3cfb9fff965 media: chips-media: wave5: Set inst->std during default format initialization
    5ee3099138fc2 media: chips-media: wave5: Guard bit depth check with initial_info_obtained
    cfcaa26b36f7e media: qcom: iris: fix missing hfi_id in gen1 GOP_SIZE cap
    d7f34cbaced92 media: qcom: iris: use disable_irq() during power-off
    14f49e4577810 media: qcom: iris: fix state-change debug log printing stale value
    672dbccf43513 media: zoran: Avoid freeing a registered video_device twice
    b24d34fd0b7cc media: vimc: fix pixel format lookup in enum_framesizes
    0e7f2cd72a4f9 media: video-i2c: fix kthread error pointer left in kthread_vid_cap on failure
    22128985b581d media: venus: fix payload size calculation in parse_raw_formats()
    66fe517d2dd38 media: venus: fix payload size returned by parse_caps() and parse_alloc_mode()
    881aafb139520 media: v4l2-fwnode: Fix fwnode leak in v4l2_fwnode_parse_link
    2bce73ab36d69 media: v4l2-ctrls: Allow unknown HDR10 white point and luminance
    30f85a7c59113 media: v4l2-ctrls: validate HEVC EXT SPS RPS counts
    a57d94026cb4f media: v4l2-async: avoid deleting unlinked ASC entry on link error
    fd5b4a14c87b2 media: ti: vpe: quiesce overflow recovery before freeing streams
    f1ba602afd5ee media: tda18250: fix possible integer overflow
    fc65623524b5b media: saa7164: fix cleanup on resource allocation failure
    7d221859ba45d media: s2255: check firmware size before reading trailing marker
    dd739517560c8 media: s2255: bound JPEG frame size before copying into the buffer
    5249a092ed2cf media: rzg2l-cru: Align bytesperline to hardware DMA stride requirement
    ac02b2c56ccef media: rtl2832_sdr: release URBs and stream buffers on start_streaming() failure
    a0d9d9a3b41a1 media: rtl2832_sdr: use vb2_video_unregister_device() on remove to fix DMA leak
    74938f83a8abb media: rkvdec: hevc: guard INTER_REF_PIC_SET_PRED index underflow
    5ef075c44c79f media: rkvdec: hevc: tighten EXT SPS RPS control dimensions
    e21f0344fcdfd media: rkvdec: Propagate platform_get_irq() errors
    b866d4bcd2ec6 media: rockchip: rga: don't change RGB quantization
    5e6f5bffaa80f media: rc: sunxi-cir: Unregister rc device on probe failure
    f220b29d318f3 media: mali-c55: Fix scaler factor overflow for large crop sizes
    efb92bf2bd7a6 media: mali-c55: Fix AEXP IHIST disable bit shift
    003b2bf690683 media: mali-c55: Fix clock leak on reset deassert failure
    63fbd6372f77d media: mali-c55: fix dropped last AEC histogram zone weight
    5a65e6f9dff66 media: nxp: imx8-isi: Use BIT_ULL() for 64-bit stream masks
    de7192f111a47 media: nxp: imx8-isi: Correct color map between V4L2 and ISI
    ab15c39a83b6d media: nxp: imx8-isi: Fix stream ID validation bypass in crossbar routing
    426ead7eed6d6 media: platform: mtk-mdp3: fix NULL deref on failed SCP lookup
    0259ade4c4cea media: platform: mtk-mdp3: Fix SCP device refcounting
    d61ba609c3226 media: meson: vdec: fix NULL pointer deref in vdec_try_fmt_common
    f99d78280faaa media: iris: Enumerate cap->bus_info to differentiate between encoder and decoder
    dc31e4f1e1463 media: ipu-bridge: check all DMI entries when overriding sensor rotation
    eee6069e4e951 media: intel/ipu6: fix async notifier cleanup leak on parse error
    ea97482e46cc2 media: imx355: Avoid calling imx355_power_off twice in error path
    64d5e26dc6bb6 media: i2c: vd55g1: Fix media bus code initialization
    7304585c75972 media: i2c: vd55g1: Fix manual digital gain on color variant
    c85aa92f1b166 media: i2c: ov9282: restore flash duration calculation
    09453b467990e media: i2c: ov7740: fix use-after-destroy in remove
    6e13784452785 media: i2c: ov02a10: fix endpoint parsing use-after-free
    55eb48818f778 media: i2c: imx415: Return test pattern write errors
    46c63cc1c1aef media: i2c: imx415: Release runtime PM reference on VBLANK error
    9d2e6262f65dd media: i2c: alvium: Fix: Correct name of register in alvium_set_ctrl_auto_exposure
    e6f1a1ac9b8cc media: go7007: defer the ALSA v4l2 put until card release
    16cb1ee17e093 media: em28xx: fix use-after-free of dev_next->devlist on disconnect
    4666197ca4f7d media: em28xx: defer audio-only extension registration
    86d8468e9015c media: dt-bindings: nxp,imx8-isi: Drop fsl,blk-ctrl requirement for i.MX8ULP
    99cd62b9b1c81 media: cx23885: cancel NetUP CI work before teardown
    a636c72c7f522 media: cx231xx: reject geometry changes while the VBI queue is busy
    8c6610e230b93 media: cobalt: Avoid freeing ALSA private data twice
    81aa608ac3a56 media: cedrus: fix memory leak in cedrus_init_ctrls()
    ae614f4871215 media: cec: Serialize exclusive follower delivery
    6e7a52d237013 media: cec: meson: ao-cec-g12a: name the CEC core regmap to avoid debugfs clash
    7ad2fec276946 media: cec: extron-da-hd-4k-plus: add sanity check
    9c6ceb0949227 media: cec: disable delayed work before freeing an interrupted transmit
    cca2407794795 media: cec: core: Fix kmemleak due to missed rc_free_device() call
    e3c973c912aa4 media: bcm2835-unicam: Fix pipeline wrong validation for unpacked formats
    a6a568171d189 media: amphion: Remove obsolete frame_count check in venc_start_session
    c6749ac8f59cc media: airspy: use vb2_video_unregister_device() on disconnect to fix NULL deref
    cc2bc29770b31 rust: drm: ioctl: fix unbounded lifetimes in ioctl handler arguments
    c4357ebeee63c LoongArch: Avoid preempt count underflow without probe
    c048b0a3c0836 LoongArch: Do not save/restore percpu base register in rethook trampoline
    fbf6ed7d827b4 LoongArch: Do not select HAVE_RUST when KASAN is enabled
    6311b8c471afa LoongArch: Fix acpi_package_ids[] array overflow
    90b84201cb651 LoongArch: BPF: Fix off-by-one error for insn_is_cast_user()
    f0e4d069cb47c LoongArch: BPF: Move arena register slot below TCC context
    00cdb31f17c7c LoongArch: Expand module virtual address space to 2GB
    96f44d493c280 LoongArch: BPF: Refactor jump offset calculation in tail call
    2a148e146993e LoongArch: BPF: Optimize redundant TCC loads in epilogue
    55e18311c705c LoongArch: Add DIRECT_MAP_PHYSMEM_END definition
    83715a40a2d30 LoongArch: KVM: Validate MSI data before routing it to EIOINTC
    bc7a6849b4395 LoongArch: KVM: Preserve memslot arch flags on KVM_MR_FLAGS_ONLY
    3bf6f5e2e1007 LoongArch: KVM: Free init resources if kvm_init() fails
    26bda95b64e8f LoongArch: KVM: Fix TOCTOU race on pv_features
    de54ab63ef127 LoongArch: KVM: Fix resource leak in kvm_loongarch_env_init() error path
    4595c9b2bdb0d LoongArch: KVM: Add unregister helpers for the KVM interrupt devices
    8e61f76e74583 LoongArch: KVM: Fix PC double advance in kernel MMIO read fast path
    f56060b0e10fa LoongArch: KVM: Fix uninitialized stack variable issue with dmsintc
    46aa64821f6c0 LoongArch: KVM: Set vcpu->cpu before IN_GUEST_MODE is set
    2de38f0448b45 KVM: arm64: Correctly cap TLBI Range to the architural limit
    36df368861d26 KVM: arm64: vgic-its: Don't dereference a NULL collection on ITT save
    2bf6e59be382a KVM: arm64: vgic: Reset in_kernel on private IRQ allocation failure
    b6c2abf620a45 KVM: arm64: vgic: Fix detection of MI on no pending LR
    d3a2d20b7248e KVM: arm64: vgic-v3: take an LPI reference in vgic_v3_save_pending_tables
    3feb83918e30f KVM: arm64: Sign-extend VA for range-based TLBI invalidation
    87c2bbf189829 KVM: arm64: Remove VM-wide VNCR mapping counter
    11ee3faab4f17 KVM: arm64: Make VNCR invalidation participate in MMU invalidation retry
    9065c1261f8a0 KVM: arm64: Handle VNCR TLB invalidation race with vcpu_put() VNCR unmapping
    c624731ca6fe5 KVM: arm64: Correctly handle end of VA space TLBI invalidation
    1c9fca34b9625 KVM: arm64: Handle negative S1 walk levels in VNCR TLB size evaluation
    66c36dd659954 KVM: arm64: Consider SCTLR_EL2.M when mapping the L1 VNCR page
    f3064dde05527 KVM: s390: Restore sigset on error path
    3a131f7758d33 KVM: s390: pv: Fix rc/rrc offset for PVM_DUMP
    ae452b990e054 KVM: s390: keyop: use mmu_lock to read gmap->asce
    7077ec953996a KVM: s390: Fix memory corruption by not reinjecting CK machine checks
    f8ed98e97a460 KVM: s390: Zero initialize irq in reinject_machine_check
    134f235e0e8de KVM: s390: Zero initialize data structures for inject_pfault_token
    4c05bf21d1806 KVM: s390: Take srcu when importing watchpoint data
    e4d8b7f176b97 KVM: s390: Free guest debug data on vcpu destroy
    46cb8a273e2f8 KVM: s390: Fix old_data leak in guest debug error path
    581be9f608583 KVM: s390: Fix memory leak in guest debug handling
    3fe801db90bde KVM: s390: Fix length check __import_wp_info()
    ac943db6e5fac KVM: x86: Move enabling EFER.SVME and EFER.LMSLE to generic EFER setup
    a97d4eb883d3c KVM: x86: Ensure runtime reads of disabled_quirks are resolved once
    92e24ca69e0f8 KVM: x86: Serialize writes to disabled_quirks using kvm->lock
    bdb732ebee545 KVM: x86: hyper-v: Clamp stimer deadline to avoid livelock
    8edb3c09e43f7 KVM: x86/mmu: Consume the locked rmap value in the lockless rmap walk
    655694a1cba2d KVM: x86/mmu: Use CMPXCHG when clearing Accessed bit in TDP MMU
    9941850e8adf1 KVM: nVM: Ensure INVVPID is emulated on the correct physical CPU
    62c3ee4c9f0e2 KVM: nVMX: Service local TLB flushes on failed nested VM-Enter
    bbec4adc2f340 KVM: nVMX: Ensure KVM_REQ_GET_NESTED_STATE_PAGES is cleared on VM-Exit
    7fda9304d0d85 KVM: nVMX: Decouple INVVPID operand checks from flushing of vpid02
    121991d150735 KVM: nVMX: Always flush vpid02 on first use
    bb9f763d7aed4 KVM: PPC: Book3S HV: Validate arch_compat against host compatibility mode
    d393ef49d94f5 iio: light: opt4001: Fix reversed GENMASK() arguments in fault count mask
    fb21a4113e911 iio: light: opt4001: Reject integration times with a non-zero seconds part
    2fb1e09451aef iio: light: opt4001: Fix incompatible pointer type passed to div_u64_rem()
    4157573b37f64 iio: light: opt4001: Fix power down clearing bits of the wrong register
    0107ac927b1e7 iio: light: opt4060: Fix incorrect register name in threshold read error message
    7d2ddfee2952e iio: light: opt4060: Reject integration times with a non-zero seconds part
    a54b53b00e0f6 iio: ti-ads7138: Disable STATS_EN bit while reading conversion results
    6b7584b976d58 iio: temperature: hid-sensor-temperature: switch to non-devm iio_device_register()
    44063a6673a63 iio: srf04: fix pm_runtime handling on probe error path
    4a84300a1033d iio: pressure: mpl115: Fix runtime PM cleanup
    3fa189573cca2 iio: pressure: dps310: fix NULL pointer dereference on ACPI probe
    80e7381e8cccb iio: light: ltrf216a: fix runtime PM reference leak in error path
    c2c83ecb1ef7d iio: light: gp2ap002: Disable regulators on resume failure
    c1870bbfcfdd2 iio: light: cm32181: return zero after writing calibscale
    3ce75e455dd6e iio: light: apds9306: fix PM reference leak in apds9306_read_data()
    bc5fbf9868ca1 iio: imu: st_lsm6dsx: Update enable mask when using sensor fusion
    14db27a2f11af iio: gyro: mpu3050: fix sign of raw angular velocity readings
    daa1674ce8736 iio: dac: mcp47feb02: add missing 'select REGMAP_I2C' to Kconfig
    9fe22f563b2a0 iio: dac: m62332: Fix regulator reference count imbalance
    36f17988eb86c iio: dac: ad5446: fix OF module device table
    98bbd0844aeda iio: dac: ad3552r-hs: fix scnprintf() buffer bound in data source show
    44d52c8b1c6da iio: chemical: sgp30: Handle IAQ thread creation failure
    30b0d44c978bb iio: chemical: atlas-sensor: use iio_trigger_poll_nested() to fix remove UAF
    777e8ebfe6b3f iio: chemical: atlas-sensor: fix PM reference leak in buffer postenable
    8b3e221590181 iio: buffer: Tie IIO dma fence lock lifetime to the fence
    11cef99491117 iio: buffer: Make IIO DMA fence release RCU-safe
    6d4bdbf7bad63 iio: buffer: Fix potential use-after-free in anonymous buffer release
    af113b29f884f iio: adc: pac1921: fix wrong channel used in trigger handler read
    90a2810faefb5 iio: adc: max34408: add missing 'select REGMAP_I2C' to Kconfig
    776bb4fb57bab iio: adc: max14001: add missing 'select REGMAP' to Kconfig
    fc8a0d0eb346d iio: adc: adi-axi-adc: add data size support for AD408X backend
    9c408b3309ee8 iio: adc: ad4080: configure backend data size
    87c0fb907c415 ASoC: tas2783-sdw: sort the register default table
    adf51dd6e11b9 ASoC: tas2783-sdw: drop duplicate reg_default entry
    622319a4ac9f6 ASoC: tas2780: sort the register default table
    86870ada907fd ASoC: tas2764: sort the register default table
    fee1916410912 ASoC: tas2552: sort the register default table
    a2ec67511c156 ASoC: sti-sas: sort the register default table
    abf06bc6ac17c ASoC: sgtl5000: sort the register default table
    856f0648beb7f ASoC: samsung: aries_audio_probe: double of_node_put due to direct assignment without of_node_get
    55b5e9fc08223 ASoC: rt721-sdca-sdw: sort the register default table
    b4eb588408717 ASoC: rt715: sort the register default table
    a099f59e8c1d2 ASoC: rt715-sdca: sort the register default tables
    f735844b71afb ASoC: rt715-sdca: drop duplicate reg_default entries
    418da4d4ccb80 ASoC: rt712-sdca-sdw: sort the register default table
    836df0d31a9a1 ASoC: rt712-sdca-dmic: sort the register default table
    cf6017e0feee7 ASoC: rt711: sort the register default table
    b7f7451a29c37 ASoC: rt711-sdca: sort the register default tables
    e15783332f451 ASoC: rt700: sort the register default table
    a35b77dc8e265 ASoC: rt700: drop duplicate reg_default entry
    3954b3b217420 ASoC: rt298: sort the register default table
    b50de175dd03a ASoC: rt286: sort the register default table
    b454c7ed1cf9e ASoC: rt274: sort the register default table
    74fe7483e6eb2 ASoC: rt1318: sort the register default table
    876d3276fd9c4 ASoC: rt1318-sdw: sort the register default table
    ec7064d07e24c ASoC: rt1316-sdw: sort the register default table
    b5a45169cbf91 ASoC: rt1017-sdca-sdw: sort the register default table
    2f972da629f6a ASoC: pm4125-sdw: sort the register default table
    fc569468e874d ASoC: pcm512x: sort the register default table
    0381caa253cb9 ASoC: ml26124: sort the register default table
    207f95aed374f ASoC: max9860: sort the register default table
    bb1602908c67d ASoC: loongson: Fix error handling in ACPI property parsing
    4731e2d22e4be AsoC: intel: sst: fix PCI device reference leak on probe failure
    cb6b0b1a9d5a6 ASoC: hdac_hda: Fix hlink refcount leak on component registration failure
    a201b5bcdfd61 ASoC: fsl_easrc: sort the register default table
    3e50bcfe6212f ASoC: fsl_easrc: Use div64_u64 for 64-by-64 division
    cbb3444113a8f ASoC: fsl: mpc5200-i2s: Free DMA resources on probe failure
    99d5973d7a0f9 ASoC: cx2072x: sort the register default table
    07a86575edc30 ASoC: cs35l34: drain threaded IRQ before runtime suspend
    84cf6acd01a1e ASoC: cs35l33: drain threaded IRQ before runtime suspend
    86f47316e536c ASoC: adau1761: sort the register default table
    1c9a77101f2d1 i2c: mux: demux-pinctrl: fix OF node leak on kstrdup failure
    b2956d578e87a clk: qcom: gcc-mdm9607: Drop incorrect BIMC PLL and related clocks
    fb3438a00799c clk: qcom: gcc-mdm9607: Fix halt_reg for gcc_apss_axi_clk
    76ff1eff73589 clk: qcom: gcc-mdm9607: Fix enable_reg for gcc_blsp1_sleep_clk
    30223154daacf clk: qcom: gcc-mdm9607: Drop incorrect system_noc_bfdcd_clk_src
    691d472c9509f clk: qcom: gcc-mdm9607: Drop incorrect apss_tcu_clk_src
    4865ff30e9189 clk: rockchip: rk3588: Don't change PLL rates when setting dclk_vop2_src
    c6679c13e3c36 clk: qcom: gcc-msm8939: Fix enable_reg for gcc_blsp1_sleep_clk
    508d6150d9405 clk: qcom: gcc-msm8916: Fix enable_reg for gcc_blsp1_sleep_clk
    8eb29dc9a9ad8 clk: microchip: mpfs: fix regmap_update_bits() mask/val order
    bf85bd6e550c1 clk: meson: align gxbb_32k_clk_sel number of parents with actual count
    bf538cdc9bb45 clk: mediatek: mt8196: Select REGMAP_MMIO for vlpckgen
    9a511980e81b1 clk: clocking-wizard: fix integer overflow in rate calculation
    edf86952488fa batman-adv: bla: prevent CRC corruptions after claim flush
    9a0c47023d325 batman-adv: bla: fix freeing of claims on meshif deletion
    0c2df865338bb batman-adv: dat: avoid unaligned fault in IP extraction
    2879177539e3e batman-adv: mcast: linearize skbuff for packet generation
    e4af59a2dc956 batman-adv: mcast: ensure unshared skb for multicast packets
    b9c2d3a5043fc batman-adv: fix TX priority extraction for BATADV_FORW_MCAST
    2dffc8c44b6e3 batman-adv: fix stale receive device on merged fragments
    23e747fe58583 mtd: rawnand: validate ONFI extended parameter page sections
    97f1f4cdec16f mtd: rawnand: sunxi: fix H6/H616 controller timings
    6086af3e39b0a mtd: rawnand: sunxi: describe tADL and tWHR delays
    c3d542c6204c8 mtd: rawnand: sunxi: group controller delay tables
    a732ae52c6aef mtd: rawnand: pl353: Make sure we use the monolithic helpers for raw accesses
    00b4d5d206298 mtd: nand: realtek-ecc: add missing MODULE_DEVICE_TABLE()
    1e5cd8bc90233 mtd: mtdoops: free page bitmap when the backing MTD is removed
    d14e6298139f5 mtd: afs: validate v2 image info bounds
    0307c2e82847a s390/vfio-ap: Fix required lock not held during update of ap_matrix_mdev object
    09548edc6114f s390/vfio-ap: fix potential use of uninitialized apm_filtered bitmap
    7db2511fc601c s390/vfio-ap: Fix NULL deref in status_show() during queue probe
    0fd74477d0574 s390/vfio-ap: Fix missing lock required to access list of ap_matrix_mdev objects
    04b35dd88c108 s390/vfio-ap: Fix hot-unplug skipped when last AP adapter or domain removed
    4f7e869d0db24 s390/vfio-ap: Fix dereference matrix_mdev->kvm without checking for NULL
    2ff68bf414de1 s390/vfio-ap: Fix control domain removal in vfio_ap_mdev_cfg_remove
    c8a9772f6dfee s390/vfio-ap: Fix stale do_remove flag across iterations in vfio_ap_mdev_cfg_remove
    13bfc94eef389 s390/vfio-ap: fix stale pqap_hook pointer on error in vfio_ap_mdev_set_kvm()
    c99e2c7811bee powerpc/crash: stop watchdogs before booting kdump kernel
    08ec4e8e3c540 powerpc/pseries: Move H_WATCHDOG definitions to a common header
    8536f38107a69 powerpc/pseries: Handle and log pseries-wdt registration failures
    7968852a7ca3c powerpc/mm: fix wrong addr_pfn tracking in compound vmemmap population
    c4cb547f26d9b powerpc/kexec_file: Prevent kexec range truncation
    4ff3d9fd71c7b powerpc/kexec_file: Fix null-ptr-def in extra size calculation
    c513c8d173187 parisc: Fix alignment of asm statements in head.S
    16a62a3f2128b parisc: eisa: Fix infinite loop when parsing invalid IRQ value
    9dfa11cef4750 nvdimm/btt: reject an arena whose nfree is below the lane count
    c74eba81766ee mm/hugetlb_cgroup: call page_counter_set_max() outside VM_BUG_ON()
    05caf140e24ad mm/hugetlb: keep max_huge_pages when dissolving surplus folios
    10f616ef06c5b mm/hugetlb_cma: fix null nodemask dereference in hugetlb_cma_alloc_frozen_folio
    e456129942506 mm/hugetlb: fix missing migratable flag on same-node hugetlb migration
    99186b185c245 mm/migrate_device: avoid out-of-bounds writes for compound folios
    431402bfca1c4 mm: fix incorrect vm_flags usage when checking allowable orders for tmpfs
    cc5d6446ead38 Revert "pmdomain: qcom: rpmhpd: Add missing MXC and MMCX power domains for Eliza"
    e19e41d1c6281 Revert "once: don't use a work queue to reset sleepable static key"
    3ddf7b95818a5 Revert "irqchip/mbigen: Fix mbigen node address layout"
    a78d2d9a84569 pmdomain: airoha: fix unselectable AIROHA_CPU_PM_DOMAIN kconfig
    1cbed7538946c nvmet-tcp: reject unsolicited H2CData PDUs
    d95d342bc0ea8 nvmet-tcp: fix out-of-bounds write when receiving an over-long PDU
    eb4f9127a2b8a nvmet-auth: Synchronize timeout work during SQ teardown
    bb6dafa790403 nvme: skip the zoned limits update if the zone info query failed
    76023560d60f1 nvme: add missing SRCU grace period in error path
    a0c389b8a495b nvme-tcp: check the data direction of a C2HData PDU
    5f89d68c00ccd nvme-fc: fix double free of fabrics options when nvme_add_ctrl() fails
    d21da6cc91ba1 nvme-fabrics: fix DHCHAP secret leak on parse failure
    b3e0f79af1f27 accel/ethosu: fix job completion fence cleanup
    f7aad73b48119 accel/ethosu: check MMIO mapping errors in probe
    f00def884a831 accel/amdxdna: return early from a zero-length flush
    dd403f6a38c53 ring-buffer: Allow splice reads on static buffers
    50afadf1ea665 ALSA: pcm: Fix race between non-atomic ops and trigger-start
    cd209eb3136e0 ALSA: harmony: initialize locks before requesting IRQ
    faba321da0eb6 ALSA: rawmidi: Return the error from snd_rawmidi_input_params()
    34f1d4f9f5ea6 arm64: errata: pass REVIDR when matching target implementation CPUs
    d2d22ff377cd4 arm64: Don't read GMID_EL1 when MTE is disabled
    0f05d95b99164 arm64: mm: Fix the lockless page-table walk in show_pte()
    b00ada2f55c53 i2c: qcom-cci: fix autosuspend cleanup
    694e7e6edf249 i2c: mux: Fix channel node leak on adapter add failure
    552836be2d95c i2c: core: fix debugfs UAF on adapter removal
    19cd6394f7ddc i2c: qcom-geni: update frequency table to fix timing parameters
    ac257b283962b i2c: designware: Enable interrupt mask workaround for HJMC3001
    0c739f54f1c77 perf: Fix use-after-free when perf mmap() revival races with the last munmap()
    517b02eaf30dd perf build: Add clang and rust target flags for LoongArch
    d9a9da94c9da6 perf hisi-ptt: Fix PTT trace TLP header parsing
    ecd69a46c029c perf trace: Refactor augmented_raw_syscalls using bpf_for
    92ad79c286f63 perf trace: Factor out BPF loop body
    a820237b03785 perf/x86/intel: Remove anythread_deprecated bit from perf_capabilities
    68c4b780b266a perf/x86/intel: Fix kernel address leakages in LBR stack
    a5c7962e64fff rtc: rzn1: Disable alarm interrupt before reprogramming alarm registers
    ea318a4675ee9 rtc: rzn1: Handle unset alarm weekday in rzn1_rtc_read_alarm
    75c1e64b7b14e rtc: rzn1: Fix weekday underflow when alarm crosses month boundary
    2f24968108904 rtc: rzn1: Handle EPROBE_DEFER for optional pps interrupt
    5ec8f629a300c memcg: make the v1 soft limit knob inert
    d44c3c5986c7a memcg: bypass the reclaim and oom killer for dying tasks once oom_reaper is done
    6165478eaa309 memcg: keep folio's objcg same as its node
    2943f1f4b7f28 mm/mempolicy: fix sleeping allocation in alloc_pages_bulk_weighted_interleave()
    9435cddf1378d mm/huge_memory: transfer the pmd dirty bit to the folio on zap
    d69841dbd92af misc: fastrpc: don't publish fd before copy_to_user() succeeds
    6e62cf983a2bd kprobes: Protect kprobe_blacklist with RCU
    732510e13ee59 irqchip/stm32mp-exti: Fix the unit of the hwspinlock timeout
    d62a84a78de5f ima: Check for ERR_PTR from dentry_path() in validate_hash_algo()
    e5b64bd7e57fb ata: ahci: work around lost interrupts on Marvell 88SE61xx
    df1a97d5313fc ceph: lock mutex in ceph_mds_check_access()
    a5b5e62baceff bpf: Fix infinite loop in pcpu_freelist push with one possible CPU
    683fa887e19f3 bpf, riscv: Make arena support depend on ZACAS
    fdbaeae9313b2 block: flag zoned disks with GENHD_FL_NO_PART
    9b7c322cf29ed cpuidle: psci: Fix support for probe deferral by dropping the faux device
    3394c7ba23336 cpuidle: dt_idle_genpd: kfree() the original name allocation
    e79449be26ac8 dmaengine: dw-edma: Mark emulated IRQ as level-triggered
    d91fb6c0d10da dmaengine: dw-edma: Initialize IRQ data before requesting IRQs
    3044460e2d310 dmaengine: dw-edma: Complete descriptors before pausing
    8cd010697b79b dmaengine: dw-edma: Fix HDMA channel status register access
    2a3801ae5c344 dmaengine: fsl-edma: tracing: no ptr dereference during log output
    feeb2ef775081 dma-direct: return struct page from dma_direct_alloc_from_pool()
    0d4a5d218055d dma-buf: dma-heap: don't publish fd before copy_to_user() succeeds
    94380ecd5ff9b dm: fix resume-vs-remove race
    00ad6f9ed27f9 dm: fix race when loading and unloading a table
    0cdc6cb242dd8 HID: wacom: validate report length in wacom_intuos_pro2_bt_irq
    48934c2927414 HID: rmi: fix OOB access with undersized RMI reports
    bfb7939788f3c HID: bpf: serialize device reference release in struct_ops destroy path
    b260b54f11405 ftrace: Synchronize the initialization of ftrace_ops
    cee8f286794df ftrace: Take trace_array reference before accessing its ftrace_ops
    b715872ef0ccc futex: Provide rt_mutex_.*_schedule() equivalents for futex scheduling
    e4a4ccfa470f9 futex: Prevent rcuwait use-after-free during requeue PI
    3b4f72bdddff6 mm/secretmem: properly account locked pages
    0b8faf28d1374 mm/damon/core: initialize damos->last_applied
    463ebd63e8ee3 mm/damon/core: handle region split failure in apply_min_nr_regions()
    54ef3a3f14e9b mm/damon/core-kunit: skip wrong region walk in commit_target_regions()
    bbbf6a9781fda mm/damon/core-kunit: skip wrong quota goal walk in commit_quota_goals()
    bee189b41f9d0 mm/damon/core-kunit: skip wrong dest walk in commit_dests_for()
    03a8f89172365 mm/damon/core-kunit: handle region split failure in filter_out()
    4deb1ec699936 mm/damon/core-kunit: check region count before testing in split_at()
    54439210c91e4 mm/damon/sysfs: kobject_del() target (normal), context and kdamond dirs
    e94f9f9478af3 mm/damon/sysfs: kobject_del() region and target (error) dirs
    11ce1b269aac5 mm/damon/sysfs-schemes: kobject_del() scheme region dirs
    5091760ab2ac4 mm/damon/sysfs-schemes: kobject_del() scheme quota goal dirs
    eca049e5b5e56 mm/damon/sysfs-schemes: kobject_del() scheme filter dirs
    df7a40102ae43 mm/damon/sysfs-schemes: kobject_del() scheme dirs
    43b33bdace2c5 mm/damon/sysfs-schemes: kobject_del() scheme action destination dirs
    b8ec303f53b04 samples/damon/wsse: stop and free damon ctx when damon_call() fails
    e60774d6335b8 samples/damon/wsse: handle damon_start() failure
    9fbc1811e83f9 samples/damon/prcl: stop and free damon ctx when damon_call() fails
    f383b55811d8e samples/damon/prcl: handle damon_start() failure
    215f9a7e4f1dc samples/damon/mtier: handle damon_stop() failure
    b4bba194bd06e samples/damon/mtier: handle damon_start() failure
    cb97afccffd6a mm/damon/vaddr-kunit: check region count in three_regions test
    3ed555fb2c6e4 mm/damon/tests/core-kunit: catch test failure in test_merge_regions_of()
    25253bbd8066d mm/damon/sysfs: read ops_id only once in damon_sysfs_apply_inputs()
    81e9ca01ebc2d mm/damon/sysfs: read addr_unit only once in damon_sysfs_apply_inputs()
    b9687ed098d7f Docs/ABI/damon: fix typo in intervals_goal sysfs path
    e20b16aa3b49f scsi: pm8001: Use rollback index when freeing MSI-X vectors
    4dd118d06dec9 scsi: megaraid_sas: Limit NVMe request size to the PRP chain frame
    f033530105aa7 scsi: bsg: Fix TOCTOU in io_uring passthrough command setup
    5d326efc334ea scsi: bsg: Cap io_uring sense copy to max_response_len
    3ddf3ea291a0e scsi: target: iscsi: Reserve a terminator byte for the login payload
    5def8b6aaad44 spi: Fix DMA mapping ownership on partial map failure
    103e7b19d1085 spi: bcmbca-hsspi: disable clocks on resume failure
    6b1ccecf311c0 spi: bcm63xx: disable clock on resume failure
    d07d4fbae4793 spi: bcm63xx-hsspi: disable clocks on resume failure
    220cea6c1662b soc: qcom: geni-se: Use HW PROG_RAM_DEPTH to validate firmware size
    b437284a4c29d soc: fsl: qe: Add chained_irq_{enter,exit}() calls in cascade handler
    fa5e1bc673ca5 ublk: clear VM_MAYWRITE on read-only ublk char device mmap
    dfc17986c608d userfaultfd: reset err to be 0 when move_pages_ptes succeeded
    64a41f4a9a968 tracing: Take trace_array reference when opening options file
    2ee3f7d43f79e tracing: Have show_event_filters/triggers files take trace array ref
    e6ccc279cb8ed tracing/probes: Fix anon_stack check for unnamed bitfields in btf_find_struct_member
    50af36b7f9011 thermal/drivers/qoriq: Disable clock on resume failure
    909cdbd028f84 thermal/drivers/imx: Disable clock on runtime resume failure
    7236bbd2cb7d9 xhci: fix lost bounce buffers on TDs spanning several ring segments
    fd19b8895f8a9 staging: rtl8723bs: fix OOB read in rtw_restruct_wmm_ie()
    a54fd1a44862d staging: rtl8723bs: fix OOB read in rtw_action_frame_parse()
    34f51d196c43a staging: rtl8723bs: fix OOB read / stack overflow in rtw_get_wps_attr()
    5117f236e9e30 usb: gadget: fix null pointer dereference in usb_put_function_instance()
    64ec019bf9a8b USB: gadget: fix NULL pointer dereference in gadget_dev_ioctl()
    858576de6b2f5 usb: gadget: f_midi: initialize work in f_midi_alloc()
    49fab5e1bdb20 usb: gadget: f_midi2: fix use-after-free in string attribute show path
    b9b5b5df5b8dd usb: gadget: f_mass_storage: fix null pointer dereference in fsg_common_set_num_buffers()
    4079f19a0e1ce usb: gadget: midi2: Fix null-pointer dereference in f_midi2_free_ep_reqs
    bdaaf3074aedc usb: typec: ucsi: displayport: Fix OOB altmode array index
    87f7222587b48 usb: typec: tipd: Fix Thunderbolt altmode VDOs for cd321x
    e5f9f36c5d610 usb: typec: tcpm: constrain TCPM_SOURCING_VBUS event handling
    52d556f085477 usb: typec: qcom-pmic: cancel reset_work on stop
    b5efa3b89395d usb: typec: qcom-pmic-typec: drain cc_debounce_dwork if port_start() fails
    1ab669c2b44e1 usb: typec: qcom-pmic-typec: disable cc_debounce_dwork on stop
    e2e424655e312 usb: typec: mux: Fix typec_switch_match()
    312a11d6f7392 usb: typec: mux: avoid duplicated mux switches
    df7cd3908e075 usb: typec: hd3ss3220: track VBUS enable state per consumer
    cae9dbba6adae usb: storage: realtek_cr: fix use-after-free on disconnect
    e01408ee52fe5 usb: dwc3: clear forceRM when issuing EndTransfer
    d8cfb7f630eb7 usb: dwc3: google: Initialise probe properties with DWC3_DEFAULT_PROPERTIES
    619aae11b85f9 usb: f_mass_storage: Bump local buffer size in fsg_common_create_luns()
    2571029a92ee7 usb: cdnsp: fix wakeup from S3 after controller context loss
    996c319b8bd5a usb-storage: ene_ub6250: fix race between scan work and probe
    1618257cb0aba media: usbtv: keep device alive while ALSA card exists
    d2c87eadcec4e clk: qcom: gcc-mdm9607: Increase delay for USB PHY reset
    9d81885d97cba ALSA: usb-audio: fix OOB write in snd_usbmidi_us122l_output()
    e22428f0c038c usb: image: mdc800: change kmalloc() to kzalloc()
    b08c3d5ee7fea drm/amd/display: fix division by zero in get_estimated_bw()
    6fedb2eaff775 NFSD: Prevent client use-after-free during blocked-lock reaping
    e57a9ed34ea8c NFSD: Prevent client use-after-free during close_lru reaping
    b75ecd5122088 NFSD: Consolidate the revocation-path client unpin
    c05ae58fe06ce NFSD: Prevent client use-after-free during export state revocation
    0146467a2fce8 NFSD: Guard admin state-revocation walks with NFSD_NET_UP
    f7e7fcd82f574 NFSD: Annotate caller preconditions for the state-table walkers
    2640cc26ed0dd KVM: SEV: Forcefully invalidate SNP VMSA if its backing gmem page is zapped
    98bcc7034db1e KVM: x86/mmu: Use split "zap all fast" helpers when invalidating memslot
    689c1b2da4779 KVM: x86/mmu: Split kvm_mmu_zap_all_fast() into "front" and "back" halves
    00388b7b718a1 KVM: x86/mmu: Fold kvm_mmu_zap_memslot() into kvm_arch_flush_shadow_memslot()
    7a90d99686e5a ACPI: battery: Protect all properties with a separated mutex
    d7a6af8e5176d ACPI: battery: Use kstrtoul() over sscanf("%lu\n")
    d044d796e2a36 HID: sony: clean up device list on probe failure
    5a4ed79030efb HID: sony: use guard() and scoped_guard()
    3b467c68803d7 ceph: properly decrypt filenames in vmalloc() buffers
    052b6b2d5fe97 zram: fix slot lock bit position on big-endian 64-bit
    342d140c82251 zram: move lockmap to be per-zram instead per table
    4a2fb2d12b87b usb: gadget: f_fs: Fix Use-After-Free in AIO error path
    7411de0ce3b45 USB: gadget: ffs: fix mm lifetime handling
    68a069b407303 mm/page_alloc: don't spin_trylock() in NMI on UP
    348c3db4f1520 drm/xe: Don't hand out the flat CCS storage as usable VRAM
    a84f3db72561c fs/ntfs3: fix slab-out-of-bounds write in ni_create_attr_list()
    bab5a851e44a3 net: skbuff: don't skb_tx_error() the source skb in skb_zerocopy()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_7.2.bb               |  6 ++---
 .../linux/linux-yocto-tiny_7.2.bb             |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_7.2.bb  | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
index f4e0d14b57..da34435770 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
@@ -15,13 +15,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "020f32fea18afa789c8eb8f28ce45ad65256fc87"
-SRCREV_meta ?= "ad69d353910ffe62233ed32046d153c01a32cba8"
+SRCREV_machine ?= "5391c0d4e57d3cacdd66e7d5a016dba8c6f5956e"
+SRCREV_meta ?= "b5d69636e3e56aa6a5b8f987b4587e7a56c4782a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-7.2;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "7.2.4"
+LINUX_VERSION ?= "7.2.6"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
index 8d166fd970..3a8f086d5c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_7.2.inc
 
-LINUX_VERSION ?= "7.2.4"
+LINUX_VERSION ?= "7.2.6"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "881860c6d624e61b44ad488360a18310ba83cf26"
-SRCREV_meta ?= "ad69d353910ffe62233ed32046d153c01a32cba8"
+SRCREV_machine ?= "c591fbeae3281cba1d1e16470afd6541ab445b46"
+SRCREV_meta ?= "b5d69636e3e56aa6a5b8f987b4587e7a56c4782a"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_7.2.bb b/meta/recipes-kernel/linux/linux-yocto_7.2.bb
index e3edaaada5..550ba49ebc 100644
--- a/meta/recipes-kernel/linux/linux-yocto_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_7.2.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v7.2/standard/base"
 KBRANCH:qemuloongarch64  ?= "v7.2/standard/base"
 KBRANCH:qemumips64 ?= "v7.2/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "af1653e938edb4571aac7a943ec531e70badb57c"
-SRCREV_machine:qemuarm64 ?= "881860c6d624e61b44ad488360a18310ba83cf26"
-SRCREV_machine:qemuloongarch64 ?= "881860c6d624e61b44ad488360a18310ba83cf26"
+SRCREV_machine:qemuarm ?= "0e60d19f0d15f5fbef845da9454998c76b37bd97"
+SRCREV_machine:qemuarm64 ?= "c591fbeae3281cba1d1e16470afd6541ab445b46"
+SRCREV_machine:qemuloongarch64 ?= "c591fbeae3281cba1d1e16470afd6541ab445b46"
 SRCREV_machine:qemumips ?= "ab0e33fefa2a3d0366b2b8deb7cfb3be2d8dc436"
-SRCREV_machine:qemuppc ?= "881860c6d624e61b44ad488360a18310ba83cf26"
-SRCREV_machine:qemuriscv64 ?= "881860c6d624e61b44ad488360a18310ba83cf26"
-SRCREV_machine:qemuriscv32 ?= "881860c6d624e61b44ad488360a18310ba83cf26"
-SRCREV_machine:qemux86 ?= "881860c6d624e61b44ad488360a18310ba83cf26"
-SRCREV_machine:qemux86-64 ?= "881860c6d624e61b44ad488360a18310ba83cf26"
+SRCREV_machine:qemuppc ?= "c591fbeae3281cba1d1e16470afd6541ab445b46"
+SRCREV_machine:qemuriscv64 ?= "c591fbeae3281cba1d1e16470afd6541ab445b46"
+SRCREV_machine:qemuriscv32 ?= "c591fbeae3281cba1d1e16470afd6541ab445b46"
+SRCREV_machine:qemux86 ?= "c591fbeae3281cba1d1e16470afd6541ab445b46"
+SRCREV_machine:qemux86-64 ?= "c591fbeae3281cba1d1e16470afd6541ab445b46"
 SRCREV_machine:qemumips64 ?= "ab0e33fefa2a3d0366b2b8deb7cfb3be2d8dc436"
-SRCREV_machine ?= "881860c6d624e61b44ad488360a18310ba83cf26"
-SRCREV_meta ?= "ad69d353910ffe62233ed32046d153c01a32cba8"
+SRCREV_machine ?= "c591fbeae3281cba1d1e16470afd6541ab445b46"
+SRCREV_meta ?= "b5d69636e3e56aa6a5b8f987b4587e7a56c4782a"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "5015d0d945b3d3f2b038d2667880d5762f7d9437"
+SRCREV_machine:class-devupstream ?= "500df175a7f9e6bc1a9c328590ca5150f84f9ff0"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v7.2/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-7.2;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "7.2.4"
+LINUX_VERSION ?= "7.2.6"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


