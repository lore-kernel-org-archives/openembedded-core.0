Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 714E4FC0360
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:42:02 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.624.1776958919099072740
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 08:41:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nPwKahQS;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8ee9ec26edaso332628285a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 08:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776958918; x=1777563718; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/xQ8X09jFw2rn7S2Wuv3WRkamc/efD1cUbz2zQF7nk=;
        b=nPwKahQSRokz3SCdXOL9LrEyJLEO8mvuQmBfGh2BjbAaY1J3UGefi5MOR7X1c9l6As
         MmcPry5Bl5nNFqoSt7CYm5A/+8FonDmb1UymwXwjG+DAd2Z+XSKHoVwFaiu6QxfkmRUv
         ecf0fTasmoXAcA1ztIFoDyEobCl8FP85hiQ/kT7Mk2/VKuig2WCCiW4Y4NffgMzSNZDB
         X+7kUtZloCG2APVNApeuGiULUmtJXAc5f4EEEsicR5Lmv/u0HaGy5BcKVV80Wo3mggs/
         EWeUMdcQZzCUrY7sNVvSJJzsxMLVF7Nw7wcZorMiDVeKrJ+f3RVxtNq5JP+YgmZMaZQh
         Q1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776958918; x=1777563718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U/xQ8X09jFw2rn7S2Wuv3WRkamc/efD1cUbz2zQF7nk=;
        b=eSO/culiyXW64M1CLP/Ba+2/z8Zj/NVBQjJ1HcHR5YIQwOy3Lsl5xbT47ESiDkKweS
         sWiQM5P+MPa7MwP8gRbN+YyFoW/qeaLcoEGKduD7jVCXolaOLfnwmW6WpXjxEfMMl0ym
         4xEZN+rDn8TYl9l+AkP/T08ehkpvtAW3rADf+fJtmYHI1z27F/lEPK9JDYXm7mf/1H75
         FI6hrb0NOQ+N8aQcGHJQvxad6b87re29RMf4Lu5A/KzR7KmC7zAM2x7jgye4IZXsjIj+
         NikX4njZ2u1K5zdFJm7BqtoRWPcObqYyqgM41vQIUlZplawpkOh7lBpTLPvC0U38bg8x
         49eg==
X-Gm-Message-State: AOJu0YygL840dz3zppQRRfduwQEI8TC1E5n1yhEc1+sZ5fcy1xdHAH/5
	Lis/uDwcapx8+o7AAIecK1QiQbYsvNXZDmSTU1oeDEKb1Vpm9c9oIyrD0sk79nlY
X-Gm-Gg: AeBDievsyGVlrNtHWlvLIOesuenhV2Y3e+lV1Zkf/cqWB4OqPgw3fUCSyLS2VUZQ6Cy
	2q8oGyG1BixOjAvJsZwMMVh0RK59+wNLdltwElqUPds92GVJ3DqRx44Q2KUYX/cLOIX3sW3DIHZ
	0jtS+NxrO0yv4OTTNvRYDv9hF9J8TB+UDlA2l83bv5Fyd9gu+1ggZH4rXT0WlI/xk3dM4DHsVqp
	RlW8pIej5zBboYyT/riQhUU6fEF4qgzmI2LlThOdeSqrxDB4MBh4Smhk5Z1mmniuz3pTc05fGTh
	cyVp/8hg+/hpmeZgj3He+DPf2LI2lx54lFEdqMlnLbdcyS/7bs3R4CRYcg+WPsGImOvUVbzjL/T
	lojsjow3DoP/g0p9WN8y3Hw3j0qMZJJ6EbtcYmtqIsrQnesetP+t8o1nUFWexMCN2S/BpWDEqtp
	5IE5Ekg4yqujAJirnkbVOS+A/b539FcmtgOfLNU8uXu43fxzsjAbZlZsmHe1W3lYu+kwgUfUj6O
	AUBH7nLUg6vp4Z8Ob78EgDrGSt6u9vqiloflOQ9s3FAxRCxuDwvvd+yLLrjhh8NAdMZkw==
X-Received: by 2002:a05:620a:1999:b0:8cf:ebeb:c284 with SMTP id af79cd13be357-8e79217f588mr3971976085a.54.1776958917601;
        Thu, 23 Apr 2026 08:41:57 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d69abee3sm1602139585a.17.2026.04.23.08.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:41:56 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][scarthgap][PATCH 05/08] linux-yocto/6.6: update to v6.6.130
Date: Thu, 23 Apr 2026 11:41:46 -0400
Message-ID: <20260423154149.1933049-5-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423154149.1933049-1-bruce.ashfield@gmail.com>
References: <20260423154149.1933049-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 15:42:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235796

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    c09fbcd31ae6 Linux 6.6.130
    1dacf6b3718a xen/privcmd: add boot control for restricted usage in domU
    1879319d790f xen/privcmd: restrict usage in unprivileged domU
    2cf5eff223fc tools/bootconfig: fix fd leak in load_xbc_file() on fstat failure
    c1bfc25d62d8 lib/bootconfig: check xbc_init_node() return in override path
    df1f4a7d9cf6 drm/i915/gt: Check set_default_submission() before deferencing
    b0158d9d6f4e ksmbd: fix use-after-free in durable v2 replay of active file handles
    806f13752652 ksmbd: fix use-after-free of share_conf in compound request
    87158a633e9a drm/amd/display: Fix DisplayID not-found handling in parse_edid_displayid_vrr()
    6ec8f8ebd023 mtd: rawnand: brcmnand: skip DMA during panic write
    a80291e577b4 mtd: rawnand: serialize lock/unlock against other NAND operations
    69aece634a7e i2c: cp2615: fix serial string NULL-deref at probe
    2aeb380c731f i2c: cp2615: replace deprecated strncpy with strscpy
    7864c667aed0 netfilter: nft_set_pipapo: split gc into unlink and reclaim phase
    c51957601d32 x86/platform/uv: Handle deconfigured sockets
    197fc4dda1c0 i2c: pxa: defer reset on Armada 3700 when recovery is used
    c40387488be0 i2c: fsi: Fix a potential leak in fsi_i2c_probe()
    994b301a217f USB: serial: f81232: fix incomplete serial port generation
    2124d82fd25e Bluetooth: L2CAP: Fix accepting multiple L2CAP_ECRED_CONN_REQ
    eec4d5758f33 drm: Fix use-after-free on framebuffers and property blobs when calling drm_dev_unplug
    5b0578a9a9ec hwmon: (pmbus/isl68137) Fix unchecked return value and use sysfs_emit()
    5fcef2e370f3 hwmon: (pmbus/mp2975) Add error check for pmbus_read_word_data() return value
    b61529c357f1 icmp: fix NULL pointer dereference in icmp_tag_validation()
    1a0c3c7b5b14 net: dsa: bcm_sf2: fix missing clk_disable_unprepare() in error paths
    ff0c54f088f7 net: mvpp2: guard flow control update with global_tx_fc in buffer switching
    224f4678812e nfnetlink_osf: validate individual option lengths in fingerprints
    adee3436ccd2 netfilter: nf_tables: release flowtable after rcu grace period on error
    d016c216bc75 netfilter: bpf: defer hook memory release until rcu readers are done
    0a3f8cd3f370 net: bonding: fix NULL deref in bond_debug_rlb_hash_show
    a05a2149386f udp_tunnel: fix NULL deref caused by udp_sock_create6 when CONFIG_IPV6=n
    3dffc083292e net/mlx5e: Fix race condition during IPSec ESN update
    99aaee927800 net/mlx5e: Prevent concurrent access to IPSec ASO context
    7712b5ff6967 net/mlx5: qos: Restrict RTNL area to avoid a lock cycle
    5da8009be419 net: macb: fix uninitialized rx_fs_lock
    edf4c2aaee08 ACPI: processor: Fix previous acpi_processor_errata_piix4() fix
    a6dc74209462 wifi: wlcore: Return -ENOMEM instead of -EAGAIN if there is not enough headroom
    0a4da176ae4b wifi: mac80211: fix NULL deref in mesh_matches_local()
    58f74dc73d1b iavf: fix VLAN filter lost on add/delete race
    fb602ed4b19e igc: fix missing update of skb->tail in igc_xmit_frame()
    4de6a43e8ecf net: usb: aqc111: Do not perform PM inside suspend callback
    a73d95b57bf9 clsact: Fix use-after-free in init/destroy rollback asymmetry
    125f932a76a9 net: usb: cdc_ncm: add ndpoffset to NDP32 nframes bounds check
    f1c7701d3ac9 net: usb: cdc_ncm: add ndpoffset to NDP16 nframes bounds check
    21c89a0a8de7 net/sched: teql: Fix double-free in teql_master_xmit
    f00fc26c8a06 net/smc: fix NULL dereference and UAF in smc_tcp_syn_recv_sock()
    39f2d86f2ddd PM: runtime: Fix a race condition related to device removal
    fd8278ffba49 sched: idle: Consolidate the handling of two special cases
    249e90557158 net: mana: fix use-after-free in mana_hwc_destroy_channel() by reordering teardown
    fcdf56bbdade net: bcmgenet: increase WoL poll timeout
    f5e4f4e4cdb7 netfilter: nf_conntrack_h323: check for zero length in DecodeQ931()
    262beb78e95e netfilter: xt_time: use unsigned int for monthday bit shift
    63b8097cea19 netfilter: xt_CT: drop pending enqueued packets on template removal
    e68a8db3a054 netfilter: nft_ct: drop pending enqueued packets on removal
    b477ef7fa612 netfilter: nft_ct: add seqadj extension for natted connections
    52235bf88159 netfilter: nf_conntrack_h323: fix OOB read in decode_int() CONS case
    528b4509c9df netfilter: nf_conntrack_sip: fix Content-Length u32 truncation in sip_help_tcp()
    f04cc86d5990 netfilter: ctnetlink: fix use-after-free in ctnetlink_dump_exp_ct()
    9e5021a90653 netfilter: ctnetlink: remove refcounting in expectation dumpers
    a75d3be96d70 mpls: add missing unregister_netdevice_notifier to mpls_init
    0c9fb70a206a net/rose: fix NULL pointer dereference in rose_transmit_link on reconnect
    e160b869b0a8 Bluetooth: qca: fix ROM version reading on WCN3998 chips
    11a87dd5df42 Bluetooth: L2CAP: Fix use-after-free in l2cap_unregister_user
    45ebe5b90020 Bluetooth: HIDP: Fix possible UAF
    f35209cf4826 Bluetooth: hci_sync: Fix hci_le_create_conn_sync
    2d3deaa162a7 Bluetooth: ISO: Fix defer tests being unstable
    e7899dc538f3 Bluetooth: SMP: make SM/PER/KDU/BI-04-C happy
    c02860835673 Bluetooth: LE L2CAP: Disconnect if sum of payload sizes exceed SDU
    b5c20c899246 Bluetooth: LE L2CAP: Disconnect if received packet's SDU exceeds IMTU
    d30acb4ecbe2 firmware: arm_scpi: Fix device_node reference leak in probe path
    37e776e2e0a5 wifi: cfg80211: cancel pmsr_free_wk in cfg80211_pmsr_wdev_down
    256f7d4c1123 wifi: mac80211: Fix static_branch_dec() underflow for aql_disable.
    d21923a8059f soc: fsl: qbman: fix race condition in qman_destroy_fq
    d0a466caf4ac cache: ax45mp: Fix device node reference leak in ax45mp_cache_init()
    ccb2262681d6 btrfs: tree-checker: fix misleading root drop_level error message
    56e72c8b02d9 btrfs: log new dentries when logging parent dir of a conflicting inode
    df656e45774f drm/amd/display: Wrap dcn32_override_min_req_memclk() in DC_FP_{START, END}
    9085ad02eff0 drm/amdgpu: apply state adjust rules to some additional HAINAN vairants
    41b0edc1be8d drm/radeon: apply state adjust rules to some additional HAINAN vairants
    2a28ad57d12e drm/amdgpu/mmhub3.0: add bounds checking for cid
    46411902afd1 drm/amdgpu/mmhub3.0.2: add bounds checking for cid
    0fabdcd12c29 drm/amdgpu/mmhub3.0.1: add bounds checking for cid
    6b257be5d3ad drm/amdgpu/mmhub2.3: add bounds checking for cid
    aa3c80150b0e drm/amdgpu/mmhub2.0: add bounds checking for cid
    9f41b9f82ecf drm/amdgpu/gmc9.0: add bounds checking for cid
    447f2c6ef11c serial: uartlite: fix PM runtime usage count underflow on probe
    59e13f1c9a8c serial: 8250: Add late synchronize_irq() to shutdown to handle DW UART BUSY
    d2719a0a9c34 serial: 8250: Fix TX deadlock when using DMA
    092cb022a454 serial: 8250_pci: add support for the AX99100
    85654456e394 iommu/vt-d: Fix intel iommu iotlb sync hardlockup and retry
    d8570211a2b1 mtd: Avoid boot crash in RedBoot partition table parser
    2a79fd98b961 mtd: rawnand: cadence: Fix error check for dma_alloc_coherent() in cadence_nand_init()
    d55ff6f213be mtd: rawnand: pl353: make sure optimal timings are applied
    f13100b1f5f1 spi: fix statistics allocation
    6bbd385b30c7 spi: fix use-after-free on controller registration failure
    9443202d9138 pmdomain: bcm: bcm2835-power: Increase ASB control timeout
    4ada013fd7da mmc: sdhci: fix timing selection for 1-bit bus width
    451816d430b3 mmc: sdhci-pci-gli: fix GL9750 DMA write corruption
    0c5026178856 net: macb: Reinitialize tx/rx queue pointer registers and rx ring during resume
    fbbd4c07a537 net: macb: Introduce gem_init_rx_ring()
    2fd0bdd49e57 net: macb: queue tie-off or disable during WOL suspend
    8afb437ea1f7 nfsd: fix heap overflow in NFSv4.0 LOCK replay cache
    1ada20331f2d batman-adv: avoid OGM aggregation when skb tailroom is insufficient
    fc77e0a5600e iio: light: bh1780: fix PM runtime leak on error path
    64ad49597d14 btrfs: fix transaction abort on file creation due to name hash collision
    b19c0465e4da btrfs: fix transaction abort on set received ioctl due to item overflow
    6bce705b699c btrfs: fix transaction abort when snapshotting received subvolumes
    3f04f871a1d4 kprobes: Remove unneeded warnings from __arm_kprobe_ftrace()
    61cfa81f19b9 kprobes: Remove unneeded goto
    6ebef4a220a1 ksmbd: unset conn->binding on failed binding request
    9229709ec8bf smb: client: fix krb5 mount with username option
    807bd1258453 Bluetooth: L2CAP: Validate L2CAP_INFO_RSP payload length before access
    dd3b221e2107 Bluetooth: L2CAP: Fix type confusion in l2cap_ecred_reconf_rsp()
    935c716be860 parisc: Flush correct cache in cacheflush() syscall
    5653af416a48 net: macb: fix use-after-free access to PTP clock
    70662874f646 NFC: nxp-nci: allow GPIOs to sleep
    67f2796354bf LoongArch: Give more information if kmem access failed
    e48bf8f1d2b1 nvdimm/bus: Fix potential use after free in asynchronous initialization
    41f6ba6c98a6 sunrpc: fix cache_request leak in cache_release
    d1a19217995d NFSD: Hold net reference for the lifetime of /proc/fs/nfs/exports fd
    439a6728ec46 io_uring/kbuf: check if target buffer list is still legacy on recycle
    d77401968c78 mm/mempolicy: fix wrong mmap_read_unlock() in migrate_to_node()
    8e7715193e5a s390/zcrypt: Enable AUTOSEL_DOM for CCA serialnr sysfs attribute
    2c5c0f4dc8cc s390/stackleak: Fix __stackleak_poison() inline assembly constraint
    3e0619a2a61b s390/xor: Fix xor_xc_2() inline assembly constraints
    1b3ff4d88b50 mptcp: pm: in-kernel: always set ID as avail when rm endp
    268fd5502281 net: stmmac: remove support for lpi_intr_o
    fbab8c08e1a6 binfmt_misc: restore write access before closing files opened by open_exec()
    8c1befea57db sched/fair: Fix pelt clock sync when entering idle
    d1365d2abfaf f2fs: zone: fix to avoid inconsistence in between SIT and SSA
    3da45ec1e485 rcu/nocb: Fix possible invalid rdp's->nocb_cb_kthread pointer access
    8af210df4f71 platform/x86/amd/pmc: Add support for Van Gogh SoC
    9c05cd8f4232 x86/uprobes: Fix XOL allocation failure for 32-bit tasks
    1b24d3e8792b drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free
    2e147aa3169b drm/exynos: vidi: fix to avoid directly dereferencing user pointer
    21ca24ba51a2 drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
    e1903358b215 drm/amdgpu: Add basic validation for RAS header
    ce63943f9bce l2tp: do not use sock_hold() in pppol2tp_session_get_sock()
    da249eb3206c drm/amd/pm: Use pm_display_cfg in legacy DPM (v2)
    b3367ee3e557 drm/amd/display: Add pixel_clock to amd_pp_display_configuration
    ec2b34acb189 net: dsa: properly keep track of conduit reference
    0643aa246819 bpf: Forget ranges when refining tnum after JSET
    2cbef9ea5a0a net: fix segmentation of forwarding fraglist GRO
    e19201b0c67d net: gso: fix tcp fraglist segmentation after pull from frag_list
    1f2b859225eb net: add support for segmenting TCP fraglist GSO packets
    9b03768037d9 tracing: Add recursion protection in kernel stack trace recording
    eba0c75670c0 dmaengine: mmp_pdma: Fix race condition in mmp_pdma_residue()
    33743ec6679a riscv: Sanitize syscall table indexing under speculation
    4357e02cafab btrfs: do not strictly require dirty metadata threshold for metadata writepages
    bfc717be833f iomap: allocate s_dio_done_wq for async reads as well
    a426f29ac3fa rxrpc: Fix data-race warning and potential load/store tearing
    fc3454a20bef x86/sev: Check for MWAITX and MONITORX opcodes in the #VC handler
    03c29d6d3719 x86/sev: Harden #VC instruction emulation somewhat
    f69fec628756 ipv6: use RCU in ip6_xmit()
    897d9006e75f dm-verity: disable recursive forward error correction
    0464bf75590d rxrpc: Fix recvmsg() unconditional requeue
    1b0edd6022a3 ext4: always allocate blocks only from groups inode can use
    90336fc3d6f5 eth: bnxt: always recalculate features after XDP clearing, fix null-deref
    1e3769aa0946 usb: typec: ucsi: Move unregister out of atomic section
    c57387d447a2 pNFS: Fix a deadlock when returning a delegation during open()
    a4810f8beb01 NFS: Fix a deadlock involving nfs_release_folio()
    1562138b9cab nfs: pass explicit offset/count to trace events
    815db2363e51 dst: fix races in rt6_uncached_list_del() and rt_del_uncached_list()
    64d8abd8c530 btrfs: fix NULL dereference on root when tracing inode eviction
    54322d95309d arm64: mm: Don't remap pgtables for allocate vs populate
    6a36c8e88af7 arm64: mm: Batch dsb and isb when populating pgtables
    37413d064396 arm64: mm: Don't remap pgtables per-cont(pte|pmd) block
    7d115eb231a6 net: stmmac: dwmac-loongson: Set clk_csr_i to 100-150MHz
    9dcd86cb22e1 btrfs: always fallback to buffered write if the inode requires checksum
    dbc4e10619ed ext4: fix dirtyclusters double decrement on fs shutdown
    db489778e6f2 f2fs: fix to avoid migrating empty section
    5d305a95130a net/tcp-md5: Fix MAC comparison to be constant-time
    307afccb751f ksmbd: Compare MACs in constant time
    946054b773ed smb: client: Compare MACs in constant time
    26a29582980b xfs: ensure dquot item is deleted from AIL only after log shutdown
    50c0e03072fc xfs: fix integer overflow in bmap intent sort comparator
    2bfc83cee05f crypto: atmel-sha204a - Fix OOM ->tfm_count leak
    0629a1a187e4 cifs: open files should not hold ref on superblock
    0a47c3889fcd net: macb: Shuffle the tx ring before enabling tx
    0bc70491e466 drm/bridge: ti-sn65dsi83: halve horizontal syncs for dual LVDS output
    920467466d2d drm/msm: Fix dma_free_attrs() buffer size
    fec5c70b82af ksmbd: Don't log keys in SMB3 signing and encryption key generation
    d1cdf0c63947 iomap: reject delalloc mappings during writeback
    0ba544dacec2 mm/kfence: fix KASAN hardware tag faults during late enablement
    816fa1dfae45 KVM: SVM: Set/clear CR8 write interception when AVIC is (de)activated
    5d1e72015b90 KVM: SVM: Add a helper to look up the max physical ID for AVIC
    32ca7117e153 KVM: SVM: Limit AVIC physical max index based on configured max_vcpu_ids
    d146f2775804 usb: gadget: f_tcm: Fix NULL pointer dereferences in nexus handling
    c24c06ed1849 can: gs_usb: gs_can_open(): always configure bitrates before starting device
    dfc314d7c767 net/sched: act_gate: snapshot parameters with RCU on replace
    0be8c9627556 kbuild: Leave objtool binary around with 'make clean'
    2d53b863b401 selftests: mptcp: join: check RM_ADDR not sent over same subflow
    1ec68e2096ef selftests: mptcp: add a check for 'add_addr_accepted'
    05799c2f1ca5 mptcp: pm: in-kernel: always mark signal+subflow endp as used
    a29641dc1267 mptcp: pm: avoid sending RM_ADDR over same subflow
    7f3b7dc8c6ca drm/amd/display: Use GFP_ATOMIC in dc_create_stream_for_sink
    c33523b8fd2d net: phy: register phy led_triggers during probe to avoid AB-BA deadlock
    71511dae56a7 gve: fix incorrect buffer cleanup in gve_tx_clean_pending_packets for QPL
    f9f1660b7ffc x86/sev: Allow IBPB-on-Entry feature for SNP guests
    c8ddb2d30d03 platform/x86: hp-bioscfg: Support allocations of larger data
    3c5c818c78b0 wifi: libertas: fix use-after-free in lbs_free_adapter()
    cf29329a13df ksmbd: call ksmbd_vfs_kern_path_end_removing() on some error paths
    ca049ef5c8c7 gve: defer interrupt enabling until NAPI registration
    212b9632718c drm/bridge: ti-sn65dsi86: Add support for DisplayPort mode with HPD
    3161ae587816 i3c: mipi-i3c-hci: Add missing TID field to no-op command descriptor
    0911fd8e400e i3c: mipi-i3c-hci: Restart DMA ring correctly after dequeue abort
    dcd66a0c0388 i3c: mipi-i3c-hci: Use ETIMEDOUT instead of ETIME for timeout errors
    5c485bc32551 iio: imu: inv_icm42600: fix odr switch to the same value
    27c324ef1638 iio: gyro: mpu3050-i2c: fix pm_runtime error handling
    2a86a396aa00 iio: gyro: mpu3050-core: fix pm_runtime error handling
    10ea2df061f3 iio: buffer: Fix wait_queue not being removed
    dd7b7093bb77 iio: chemical: bme680: Fix measurement wait duration calculation
    342e5f67fb99 iio: potentiometer: mcp4131: fix double application of wiper shift
    dcdf1e92674e iio: chemical: sps30_i2c: fix buffer size in sps30_i2c_read_meas()
    5a3952ba82f8 iio: chemical: sps30_serial: fix buffer size in sps30_serial_read_meas()
    fa87bb35b917 iio: frequency: adf4377: Fix duplicated soft reset mask
    8f9fca12f2f3 iio: dac: ds4424: reject -128 RAW value
    fa6fd9aec721 btrfs: abort transaction on failure to update root in the received subvol ioctl
    40f7c69eb00d smb: client: fix iface port assignment in parse_server_interfaces
    438e77435aee smb: client: fix in-place encryption corruption in SMB2_write()
    dcd1f1321034 smb: client: fix atomic open with O_DIRECT & O_SYNC
    2ca6bdf449b1 lib/bootconfig: check bounds before writing in __xbc_open_brace()
    bbdb80f29ee9 lib/bootconfig: fix snprintf truncation check in xbc_node_compose_key_after()
    f59193807211 x86/apic: Disable x2apic on resume if the kernel expects so
    35e3ec8e589b scsi: core: Fix error handling for scsi_alloc_sdev()
    cc7d44c59ea5 lib/bootconfig: fix off-by-one in xbc_verify_tree() unclosed brace error
    b373ff56ed2d s390/dasd: Copy detected format information to secondary device
    3a67baa8eec4 s390/dasd: Move quiesce state with pprc swap
    41e91dff2d39 xfs: fix undersized l_iclog_roundoff values
    eaaaa3abbb20 cifs: make default value of retrans as zero
    e9311e199ac6 tracing: Fix trace_buf_size= cmdline parameter with sizes >= 2G
    aeb7255531ba drm/i915: Fix potential overflow of shmem scatterlist length
    624f991cac21 drm/bridge: ti-sn65dsi83: fix CHA_DSI_CLK_RANGE rounding
    2550d63cc350 drm/amd: Set num IP blocks to 0 if discovery fails
    c658c1c85ec2 drm/amdgpu: Fix use-after-free race in VM acquire
    3704ac6a0d9a net: dsa: microchip: Fix error path in PTP IRQ setup
    81431da77792 net: ethernet: arc: emac: quiesce interrupts before requesting IRQ
    599625881978 net: ncsi: fix skb leak in error paths
    302fef75512b ksmbd: fix use-after-free by using call_rcu() for oplock_info
    b720c84087cb smb: server: fix use-after-free in smb2_open()
    bf4d66d72e4a ksmbd: fix use-after-free in smb_lazy_parent_lease_break_close()
    d156b1c24f72 pmdomain: bcm: bcm2835-power: Fix broken reset status read
    57e35502faa9 parisc: Check kernel mapping earlier at bootup
    344fde7a3dc0 parisc: Fix initial page table creation for boot
    52db5ef163c9 hwmon: (pmbus/q54sj108a2) fix stack overflow in debugfs read
    7003352d4327 arm64: mm: Add PTE_DIRTY back to PAGE_KERNEL* to fix kexec/hibernation
    fad178ae8949 nouveau/dpcd: return EBUSY for aux xfer if the device is asleep
    5699359529c6 parisc: Increase initial mapping to 64 MB with KALLSYMS
    f3ca45673dab batman-adv: Avoid double-rtnl_lock ELP metric worker
    422b4524320c tracing: Fix syscall events activation by ensuring refcount hits zero
    9298b0806923 ice: fix retry for AQ command 0x06EE
    5138cd978bab net: mana: Ring doorbell at 4 CQ wraparounds
    1a6da3dbb998 media: dvb-net: fix OOB access in ULE extension header tables
    768f25613a9f staging: rtl8723bs: fix potential out-of-bounds read in rtw_restruct_wmm_ie
    740bca8bbdb7 staging: rtl8723bs: properly validate the data in rtw_get_ie_ex()
    627cf4d1f0ea ixgbevf: fix link setup issue
    aac3ac27e6da ice: reintroduce retry mechanism for indirect AQ
    1fc8c3a0d249 irqchip/gic-v3-its: Limit number of per-device MSIs to the range the ITS supports
    3cfdf8d27b66 device property: Allow secondary lookup in fwnode_get_next_child_node()
    54f2f0591216 drm/bridge: ti-sn65dsi86: Enable HPD polling if IRQ is not used
    98310fe3a2a7 drm/bridge: samsung-dsim: Fix memory leak in error path
    f3333543326c Revert "tcpm: allow looking for role_sw device in the main node"
    70c78429ef38 scsi: hisi_sas: Fix NULL pointer exception during user_scan()
    8be15087d037 scsi: hisi_sas: Use macro instead of magic number
    228c626df8d5 scsi: hisi_sas: Add time interval between two H2D FIS following soft reset spec
    a6a894413b04 scsi: ufs: core: Fix SError in ufshcd_rtc_work() during UFS suspend
    069307ae8cb9 i3c: dw-i3c-master: Set SIR_REJECT in DAT on device attach and reattach
    7d86de3847c5 time/jiffies: Mark jiffies_64_to_clock_t() notrace
    657dc653b06a ceph: fix memory leaks in ceph_mdsc_build_path()
    b3f5513141ec ceph: fix i_nlink underrun during async unlink
    59c7bf668c20 libceph: admit message frames only in CEPH_CON_S_OPEN state
    5f2806684b05 libceph: Use u32 for non-negative values in ceph_monmap_decode()
    50156622eb08 libceph: prevent potential out-of-bounds reads in process_message_header()
    3e2e36e9b9f3 libceph: reject preamble if control segment is empty
    8bb87547e92d libceph: Fix potential out-of-bounds access in ceph_handle_auth_reply()
    8b6767e4141b kprobes: avoid crash when rmmod/insmod after ftrace killed
    a360d3815aae tipc: fix divide-by-zero in tipc_sk_filter_connect()
    a8e9cab16771 ASoC: qcom: qdsp6: Fix q6apm remove ordering during ADSP stop and start
    270277c2ab63 mmc: core: Avoid bitfield RMW for claim/retune flags
    d8f20b282418 mm/kfence: disable KFENCE upon KASAN HW tags enablement
    f36ab071abd0 mmc: mmci: Fix device_node reference leak in of_get_dml_pipe_index()
    b88ce81232bb mm/tracing: rss_stat: ensure curr is false from kthread context
    155f471e38aa usb: image: mdc800: kill download URB on timeout
    e7b3d154eb08 usb: mdc800: handle signal and read racing
    9c6159d5b72d usb: renesas_usbhs: fix use-after-free in ISR during device removal
    4ee3062bf2c9 usb: class: cdc-wdm: fix reordering issue in read code path
    659c0c7d50a4 USB: core: Limit the length of unkillable synchronous timeouts
    39bd4097292f USB: usbtmc: Use usb_bulk_msg_killable() with user-specified timeouts
    fc26e98b6cb8 USB: usbcore: Introduce usb_bulk_msg_killable()
    2872b67951fe usb: roles: get usb role switch from parent only for usb-b-connector
    52950203880b usb: cdc-acm: Restore CAP_BRK functionnality to CH343
    24aa4caf7f95 usb: core: don't power off roothub PHYs if phy_set_mode() fails
    19ef3da0a82d usb: misc: uss720: properly clean up reference in uss720_probe()
    f1c8b8183abc usb: dwc3: pci: add support for the Intel Nova Lake -H
    939e3d17b843 usb: yurex: fix race in probe
    b2dd9abf8c06 usb: xhci: Prevent interrupt storm on host controller error (HCE)
    2e2baa8fb5aa usb: xhci: Fix memory leak in xhci_disable_slot()
    2f2418efd495 USB: ezcap401 needs USB_QUIRK_NO_BOS to function on 10gbs usb speed
    9105f4d74762 usb/core/quirks: Add Huawei ME906S-device to wakeup quirk
    551f82df759c USB: add QUIRK_NO_BOS for video capture several devices
    ad4394f269dc KVM: SVM: Initialize AVIC VMCB fields if AVIC is enabled with in-kernel APIC
    22bd6fea06bc ASoC: amd: yc: Add DMI quirk for ASUS EXPERTBOOK PM1503CDA
    af834b026bfc net: usb: lan78xx: skip LTM configuration for LAN7850
    2aaf0a7be0b8 net: usb: lan78xx: fix TX byte statistics for small packets
    e94d81319259 net: usb: lan78xx: fix silent drop of packets with checksum errors
    c5c5a6c53cf3 ALSA: usb-audio: Check endpoint numbers at parsing Scarlett2 mixer interfaces
    629cf09464cf ALSA: pcm: fix use-after-free on linked stream runtime in snd_pcm_drain()
    3dfd1328c052 cgroup: fix race between task migration and iteration
    343d4b4a21a5 Revert "arm64: dts: qcom: sdm845-oneplus: Mark l14a regulator as boot-on"
    ce0caaed5940 usb: gadget: f_mass_storage: Fix potential integer overflow in check_command_size_in_blocks()
    3e2f1628faa3 octeontx2-af: devlink: fix NIX RAS reporter to use RAS interrupt status
    e4a4ca0b69c5 octeontx2-af: devlink health: use retained error fmsg API
    fa3183e7c748 octeontx2-af: devlink: fix NIX RAS reporter recovery condition
    cf6099ef493b net: bonding: Fix nd_tbl NULL dereference when IPv6 is disabled
    764039ff6515 ASoC: detect empty DMI strings
    35c7624d30cb ASoC: amd: acp3x-rt5682-max9836: Add missing error check for clock acquisition
    e15b56da10b5 ACPI: OSL: fix __iomem type on return from acpi_os_map_generic_address()
    0a1fc25deaba e1000/e1000e: Fix leak in DMA error cleanup
    e611b36efca1 i40e: fix src IP mask checks and memcpy argument names in cloud filter
    628773eba024 nvme-pci: Fix race bug in nvme_poll_irqdisable()
    83e6edd63583 nvme-pci: Fix slab-out-of-bounds in nvme_dbbuf_set
    f691272c3e8c sched: idle: Make skipping governor callbacks more consistent
    ac8f2dfcecbd regulator: pca9450: Correct interrupt type
    28986d1c093f regulator: pca9450: Make IRQ optional
    540803559993 netfilter: xt_IDLETIMER: reject rev0 reuse of ALARM timer labels
    4a1f6ee69267 netfilter: nfnetlink_cthelper: fix OOB read in nfnl_cthelper_dump_table()
    47b1c5d1b094 netfilter: nfnetlink_queue: fix entry leak in bridge verdict error path
    9b94f0e42ed2 netfilter: x_tables: guard option walkers against 1-byte tail reads
    0a55d62cdb62 netfilter: nft_set_pipapo: fix stack out-of-bounds read in pipapo_drop()
    61243ff7e757 amd-xgbe: prevent CRC errors during RX adaptation with AN disabled
    df65ae0f1330 amd-xgbe: fix link status handling in xgbe_rx_adaptation
    86f5334fcb48 mctp: route: hold key->lock in mctp_flow_prepare_output()
    a3a1ea5d1f8d can: hi311x: hi3110_open(): add check for hi3110_power_enable() return value
    d7900a43b0a3 mctp: i2c: fix skb memory leak in receive path
    8460187b4852 serial: caif: hold tty->link reference in ldisc_open and ser_release
    bba6c0806a8c net: sfp: improve Huawei MA5671a fixup
    17f69ee2ed08 net: sfp: add quirk for Potron SFP+ XGSPON ONU Stick
    2369830617a5 net: sfp: improve Nokia GPON sfp fixup
    783025a3babb net: sfp: re-implement ignoring the hardware TX_FAULT signal
    d9744892b8ed ASoC: simple-card-utils: fix graph_util_is_ports0() for DT overlays
    e03f8d141911 ASoC: simple-card-utils: use __free(device_node) for device node
    317a9298c54b ASoC: soc-core: flush delayed work before removing DAIs and widgets
    8b76136bd446 ASoC: soc-core: drop delayed_work_pending() check before flush
    59b06d8b9bdb net/sched: teql: fix NULL pointer dereference in iptunnel_xmit on TEQL slave xmit
    383b37c04a48 net/mlx5e: Fix DMA FIFO desync on error CQE SQ recovery
    957d2a58f7f8 net/mlx5: Fix deadlock between devlink lock and esw->wq
    87db2efa8327 net/mlx5: Query to see if host PF is disabled
    0e4dd5078b0c net/mlx5: IFC updates for disabled host PF
    11762a893ffc bonding: handle BOND_LINK_FAIL, BOND_LINK_BACK as valid link states
    43723dff1a59 drm/msm/dsi: fix pclk rate calculation for bonded dsi
    7c370f2cb7fc drm/msm/dsi: Document DSC related pclk_rate and hdisplay calculations
    c58dcaac49b6 net: dsa: realtek: rtl8365mb: remove ifOutDiscards from rx_packets
    74c39a47856b xprtrdma: Decrement re_receiving on the early exit paths
    2f91ef68d0ed smb/server: Fix another refcount leak in smb2_open()
    fd4ff8c64639 powerpc: 83xx: km83xx: Fix keymile vendor prefix
    a971ce3a39e5 remoteproc: mediatek: Unprepare SCP clock during system suspend
    f3394234b849 remoteproc: sysmon: Correct subsys_name_len type in QMI request
    80bc3c57dd32 powerpc/uaccess: Fix inline assembly for clang build on PPC32
    9e5df7e19c44 ALSA: usb-audio: Check max frame size for implicit feedback mode, too
    8d66e46ff0f4 ALSA: usb-audio: Avoid implicit feedback mode on DIYINHK USB Audio 2.0
    32af15506450 scsi: ufs: core: Fix shift out of bounds when MAXQ=32
    0614f5618c24 scsi: ufs: core: Fix possible NULL pointer dereference in ufshcd_add_command_trace()
    7b640a732689 ASoC: cs42l43: Report insert for exotic peripherals
    f43a420065f0 ASoC: amd: yc: Add ASUS EXPERTBOOK BM1503CDA to quirk table
    80e35a0a8ab5 scsi: ses: Fix devices attaching to different hosts
    486519660bd9 ACPI: OSI: Add DMI quirk for Acer Aspire One D255
    b006c61a5d97 wifi: mac80211: set default WMM parameters on all links
    d7963d6997fe unshare: fix unshare_fs() handling
    7da755e0d02e scsi: mpi3mr: Add NULL checks when resetting request and reply queues
    5bb47c03024e ACPI: PM: Save NVS memory on Lenovo G70-35
    e7919a293f9b scsi: storvsc: Fix scheduling while atomic on PREEMPT_RT
    ae10787d955f apparmor: fix race between freeing data and fs accessing it
    6ef1f2926c41 apparmor: fix race on rawdata dereference
    f90e3ecd9e1e apparmor: fix differential encoding verification
    17debf558602 apparmor: fix unprivileged local user can do privileged policy management
    55ef2af7490a apparmor: Fix double free of ns_name in aa_replace_profiles()
    7c7cf05e0606 apparmor: fix missing bounds check on DEFAULT table in verify_dfa()
    5a184f7cbdea apparmor: fix side-effect bug in match_char() macro usage
    3f8699b3ee0c apparmor: fix: limit the number of levels of policy namespaces
    33959a491e9f apparmor: replace recursive profile removal with iterative approach
    663ce34786e7 apparmor: fix memory leak in verify_header
    07cf6320f40e apparmor: validate DFA start states are in bounds in unpack_pdb
    7f4d6a5d3429 net: tcp: accept old ack during closing
    5a110ddcc99b net/sched: Only allow act_ct to bind to clsact/ingress qdiscs and shared blocks
    59c15b9cc453 tracing: Add NULL pointer check to trigger_data_free()
    c7919c1c1d80 selftest/arm64: Fix sve2p1_sigill() to hwcap test
    a0fb59f527d0 xdp: produce a warning when calculated tailroom is negative
    d5f7daed130c i40e: use xdp.frame_sz as XDP RxQ info frag_size
    7b9c0ee7fed9 i40e: fix registering XDP RxQ info
    183f940bdf90 xsk: introduce helper to determine rxq->frag_size
    8701504563fa xdp: use modulo operation to calculate XDP frag tailroom
    5b1449301ca0 net/sched: act_ife: Fix metalist update behavior
    b299121e7453 net: ipv6: fix panic when IPv4 route references loopback IPv6 nexthop
    5f93e6b4d12b net: vxlan: fix nd_tbl NULL dereference when IPv6 is disabled
    a12cdaa3375f net: bridge: fix nd_tbl NULL dereference when IPv6 is disabled
    29629dd7d373 net: ethernet: mtk_eth_soc: Reset prog ptr to old_prog in case of error in mtk_xdp_setup()
    3cdb52d6eba0 net: stmmac: Fix error handling in VLAN add and delete paths
    722a28b635ec nfc: rawsock: cancel tx_work before socket teardown
    edc188322caa nfc: nci: clear NCI_DATA_EXCHANGE before calling completion callback
    dcbcccfc5195 nfc: nci: free skb on nci_transceive early error paths
    f7d8b5d649dd net: nfc: nci: Fix zero-length proprietary notifications
    dbd58b0730aa net: sched: avoid qdisc_reset_all_tx_gt() vs dequeue race for lockless qdiscs
    e42ff5abbd14 nvme: fix memory allocation in nvme_pr_read_keys()
    be3b61ebcafe nvme: reject invalid pr_read_keys() num_keys values
    5d53fe502ef4 drm/sched: Fix kernel-doc warning for drm_sched_job_done()
    0c3dce09e8ef amd-xgbe: fix sleep while atomic on suspend/resume
    581800298313 ipv6: fix NULL pointer deref in ip6_rt_get_dev_rcu()
    db93ff008d2e smb/client: fix buffer size for smb311_posix_qinfo in SMB311_posix_query_info()
    99acd1ea3499 smb/client: fix buffer size for smb311_posix_qinfo in smb2_compound_op()
    9b02c5c4147f bpf: Fix a UAF issue in bpf_trampoline_link_cgroup_shim
    4bb55e430d82 bpf: export bpf_link_inc_not_zero.
    39959a7d3efe xen/acpi-processor: fix _CST detection using undersized evaluation buffer
    8babb2714033 net/rds: Fix circular locking dependency in rds_tcp_tune
    11fc15378e87 indirect_call_wrapper: do not reevaluate function pointer
    7ae7b093b7db wifi: mt76: Fix possible oob access in mt76_connac2_mac_write_txwi_80211()
    a6605f619131 wifi: mt76: mt7996: Fix possible oob access in mt7996_mac_write_txwi_80211()
    aca4c9e4901b wifi: wlcore: Fix a locking bug
    78bb63bbabb3 wifi: cw1200: Fix locking in error paths
    3bf4ee25f051 octeon_ep: avoid compiler and IQ/OQ reordering
    4818b80d20de octeon_ep: Relocate counter updates before NAPI
    5c262bd0e393 bpf/bonding: reject vlan+srcmac xmit_hash_policy change when XDP is loaded
    f8db044a0a47 net: dsa: realtek: rtl8365mb: fix rtl8365mb_phy_ocp_write return value
    14cecde3eb07 kunit: tool: copy caller args in run_kernel to prevent mutation
    eb5632fae6a3 rust: kunit: fix warning when !CONFIG_PRINTK
    b73832292cd9 can: mcp251x: fix deadlock in error path of mcp251x_open
    70e951afad4c can: bcm: fix locking for bcm_op runtime updates
    b4d1e6d27f93 amd-xgbe: fix MAC_TCR_SS register width for 2.5G and 10M speeds
    622062f24644 atm: lec: fix null-ptr-deref in lec_arp_clear_vccs
    c7becfe3e604 dpaa2-switch: Fix interrupt storm after receiving bad if_id in IRQ handler
    420bc92cc966 dpaa2-switch: do not clear any interrupts automatically
    fb64be8e20dc xsk: Fix zero-copy AF_XDP fragment drop
    5172adf9efb8 xsk: Fix fragment node deletion to prevent buffer leak
    eb66c67b0847 xsk: s/free_list_node/list_node/
    560c974b7ccd xsk: Get rid of xdp_buff_xsk::xskb_list_node
    4e58b99c3c33 net: ethernet: ti: am65-cpsw-nuss/cpsw-ale: Fix multicast entry handling in ALE table
    391396b5052d drm/solomon: Fix page start when updating rectangle in page addressing mode
    352d940bcdbd drm/ssd130x: Replace .page_height field in device info with a constant
    3327bb9d474d drm/ssd130x: Store the HW buffer in the driver-private CRTC state
    be3079b7a328 drm/ssd130x: Use bool for ssd130x_deviceinfo flags
    9328cc4e511c e1000e: clear DPG_EN after reset to avoid autonomous power-gating
    337ecf555a4b hwmon: (it87) Check the it87_lock() return value
    95b14ecc5688 pinctrl: cirrus: cs42l43: Fix double-put in cs42l43_pin_probe()
    cc06e3f73390 platform/x86: thinkpad_acpi: Fix errors reading battery thresholds
    896449ad9053 pinctrl: equilibrium: fix warning trace on load
    27fad3a507d6 pinctrl: equilibrium: rename irq_chip function callbacks
    70cde1f24ffb hwmon: (aht10) Fix initialization commands for AHT20
    166678027ad4 hwmon: (aht10) Add support for dht20
    cc7f6f0a2666 ARM: clean up the memset64() C wrapper
    ec312cb9bd97 selftests: mptcp: join: check removing signal+subflow endp
    047de213219d selftests: mptcp: more stable simult_flows tests
    7c01b680beaf scsi: core: Fix refcount leak for tagset_refcnt
    3990f352bb0a smb: client: Don't log plaintext credentials in cifs_set_cifscreds
    f65c92e81cb4 smb: client: fix broken multichannel with krb5+signing
    874c47503e0f smb: client: fix cifs_pick_channel when channels are equally loaded
    6f1d1614f841 drbd: fix null-pointer dereference on local read error
    e91d8d6565b7 drbd: fix "LOGIC BUG" in drbd_al_begin_io_nonblock()
    6b847d65f5b0 Squashfs: check metadata block offset is within range
    e8ef82cb6443 scsi: target: Fix recursive locking in __configfs_open_file()
    7dbffffd5761 net/sched: ets: fix divide by zero in the offload path
    1b1fac4c7a3a RDMA/irdma: Fix kernel stack leak in irdma_create_user_ah()
    d0148965dbca IB/mthca: Add missed mthca_unmap_user_db() for mthca_create_srq()
    22a9adea7e26 wifi: mac80211: fix NULL pointer dereference in mesh_rx_csa_frame()
    650981e718e6 wifi: mac80211: bounds-check link_id in ieee80211_ml_reconfiguration
    fa18639deab4 wifi: cfg80211: cancel rfkill_block work in wiphy_unregister()
    129c8bb320a7 wifi: radiotap: reject radiotap with unknown bits
    a0c6ae2ea845 ALSA: usb-audio: Use correct version for UAC3 header validation
    cf48c2d1db3a platform/x86: dell-wmi: Add audio/mic mute key codes
    411ba3cd837f platform/x86: dell-wmi-sysman: Don't hex dump plaintext password data
    6a25e2527928 x86/efi: defer freeing of boot services memory
    6e330889e6c8 HID: Add HID_CLAIMED_INPUT guards in raw_event callbacks missing them
    888f164453f2 can: usb: f81604: handle bulk write errors properly
    9b740ff5bc64 can: usb: f81604: handle short interrupt urb messages properly
    f6e90c113c92 can: usb: etas_es58x: correctly anchor the urb in the read bulk callback
    13b646eec3ba can: ucan: Fix infinite loop from zero-length messages
    54ee74307165 can: usb: f81604: correctly anchor the urb in the read bulk callback
    1818974e1b5e can: ems_usb: ems_usb_read_bulk_callback(): check the proper length of a message
    7f8505c7ce3f net: usb: pegasus: validate USB endpoints
    12c0243de0ae net: usb: kalmia: validate USB endpoints
    72f90f481c6a net: usb: kaweth: validate USB endpoints
    d1f6d20b3c26 nfc: pn533: properly drop the usb interface reference on disconnect
    af050ab44fa1 media: dvb-core: fix wrong reinitialization of ringbuffer on reopen
    5f8463e43720 eventpoll: Fix integer overflow in ep_loop_check_proc()
    1b3ae721257e drm/amdgpu: keep vga memory on MacBooks with switchable graphics
    aa7f9ef72eae drm/amd: Drop special case for yellow carp without discovery
    4b4eee6d0c00 net: arcnet: com20020-pci: fix support for 2.5Mbit cards
    efc159492b5c ALSA: hda/conexant: Fix headphone jack handling on Acer Swift SF314
    f3cb23e1fcf3 hwmon: (max16065) Use READ/WRITE_ONCE to avoid compiler optimization induced race
    020bfaac6cb4 ALSA: hda/conexant: Add quirk for HP ZBook Studio G4
    c676ab65519c drm/amd: Fix hang on amdgpu unload by using pci_dev_is_disconnected()
    d637f6ec149f usb: cdns3: fix role switching during resume
    3de5fd27af5b usb: cdns3: call cdns_power_is_lost() only once in cdns_resume()
    3097fb95e244 usb: cdns3: remove redundant if branch
    7b900a94d716 clk: tegra: tegra124-emc: fix device leak on set_rate()
    8acf534d5a58 arm64: dts: rockchip: Fix rk356x PCIe range mappings
    3469112edc5c mfd: omap-usb-host: Fix OF populate on driver rebind
    1d4ea57730bf mfd: omap-usb-host: Convert to platform remove callback returning void
    59b76ae68764 mfd: qcom-pm8xxx: Fix OF populate on driver rebind
    a97ff3b70ff5 mfd: qcom-pm8xxx: Convert to platform remove callback returning void
    57e83bfbe1e4 ext4: fix e4b bitmap inconsistency reports
    e33256b2f927 ext4: convert bd_buddy_page to bd_buddy_folio
    ccab2af6c19f ext4: convert bd_bitmap_page to bd_bitmap_folio
    ceee57fd7207 ext4: delete redundant calculations in ext4_mb_get_buddy_page_lock()
    31c4c67dec33 mailbox: Prevent out-of-bounds access in fw_mbox_index_xlate()
    c42ffd816c0f mailbox: Allow controller specific mapping using fwnode
    cfdb216691ec mailbox: Use guard/scoped_guard for con_mutex
    bef5ecf09d70 mailbox: Use dev_err when there is error
    5e99cbdfcd15 mailbox: remove unused header files
    235359afbe0a mailbox: sort headers alphabetically
    97b60acdca6f mailbox: don't protect of_parse_phandle_with_args with con_mutex
    49ada773c180 mailbox: Use of_property_match_string() instead of open-coding
    dc7c9b9d03a5 ext4: drop extent cache when splitting extent fails
    f0931a5c1700 ext4: drop extent cache after doing PARTIAL_VALID1 zeroout
    67cdb7bd7442 ext4: don't set EXT4_GET_BLOCKS_CONVERT when splitting before submitting I/O
    11406eb96a19 ext4: correct the comments place for EXT4_EXT_MAY_ZEROOUT
    ed0096fc86b2 ext4: get rid of ppath in ext4_ext_handle_unwritten_extents()
    d7b04ea31c6e ext4: get rid of ppath in ext4_ext_convert_to_initialized()
    c24ce099bea9 ext4: get rid of ppath in ext4_convert_unwritten_extents_endio()
    147a6a2725b1 ext4: get rid of ppath in ext4_split_convert_extents()
    cda8a34348d7 ext4: get rid of ppath in ext4_split_extent()
    58ddae5d77b1 ext4: don't zero the entire extent if EXT4_EXT_DATA_PARTIAL_VALID1
    e766534911b3 ext4: subdivide EXT4_EXT_DATA_VALID1
    ffb68fc57207 ext4: get rid of ppath in ext4_split_extent_at()
    fb138df7d886 ext4: get rid of ppath in ext4_ext_insert_extent()
    8f6e910852d8 ext4: get rid of ppath in ext4_ext_create_new_leaf()
    cafb151eb180 ext4: get rid of ppath in ext4_find_extent()
    a4a7024448ab bus: omap-ocp2scp: fix OF populate on driver rebind
    e4be2bd01a76 bus: omap-ocp2scp: Convert to platform remove callback returning void
    43bb0a265b26 drm/tegra: dsi: fix device leak on probe
    ec3be7dc9391 KVM: x86: Ignore -EBUSY when checking nested events from vcpu_block()
    5e8bf325ed12 KVM: x86: WARN if a vCPU gets a valid wakeup that KVM can't yet inject
    ca921be7a117 media: tegra-video: Fix memory leak in __tegra_channel_try_format()
    7a9c901edcaf media: tegra-video: Use accessors for pad config 'try_*' fields
    32a1889f7bb0 KVM: x86: Return "unsupported" instead of "invalid" on access to unsupported PV MSR
    469a8a038d8b KVM: x86: Rename KVM_MSR_RET_INVALID to KVM_MSR_RET_UNSUPPORTED
    626ccc6daa7a KVM: x86: Fix KVM_GET_MSRS stack info leak
    fa0e278a1230 PCI: Use resource_set_range() that correctly sets ->end
    ffe8617e2e5b resource: Add resource set range and size helpers
    fffdb0fece19 PCI: Use resource names in PCI log messages
    bc440d87e655 PCI: Update BAR # and window messages
    b9eccd59697f memory: mtk-smi: fix device leak on larb probe
    b16599fedf49 memory: mtk-smi: fix device leaks on common probe
    646ac65db6c1 memory: mtk-smi: Convert to platform remove callback returning void
    5f5997339cf0 PCI: Correct PCI_CAP_EXP_ENDPOINT_SIZEOF_V2 value
    8a95fb9df110 bpf: Fix stack-out-of-bounds write in devmap
    dfe079bb6ab3 btrfs: fix compat mask in error messages in btrfs_check_features()
    a1b82706c233 btrfs: fix warning in scrub_verify_one_metadata()
    6eac621b2deb btrfs: fix objectid value in error message in check_extent_data_ref()
    ad567ccfd90c btrfs: fix incorrect key offset in error message in check_dev_extent_item()
    ab69bf6f8970 btrfs: add support for inserting raid stripe extents
    cbca08a23773 btrfs: read raid stripe tree from disk
    fff272a83847 btrfs: add raid stripe tree definitions
    9895ddc5efec btrfs: move btrfs_extref_hash into inode-item.h
    d928f8aec88d btrfs: remove btrfs_crc32c wrapper
    971658d3932b btrfs: move btrfs_crc32c_final into free-space-cache.c
    37fc52528383 ALSA: hda: cs35l56: Fix signedness error in cs35l56_hda_posture_put()
    996d43a72d11 ALSA: pci: hda: use snd_kcontrol_chip()
    4f8d58123378 perf: Fix __perf_event_overflow() vs perf_remove_from_context() race
    949e15a8dbde ALSA: usb-audio: Use inclusive terms
    6ec99e9c90f4 ALSA: usb-audio: Cap the packet size pre-calculations
    133c3f3dde72 scsi: ufs: core: Move link recovery for hibern8 exit failure to wl_resume
    0990188985f5 rseq: Clarify rseq registration rseq_size bound check comment
    7b2c39f7bada ALSA: usb-audio: Remove VALIDATE_RATES quirk for Focusrite devices
    8b00427317ba scsi: pm8001: Fix use-after-free in pm8001_queue_command()
    be4c63507aca scsi: lpfc: Properly set WC for DPP mapping
    2edbd1733091 irqchip/sifive-plic: Fix frozen interrupt due to affinity setting
    0bd326dffd9e drm/logicvc: Fix device node reference leak in logicvc_drm_config_parse()
    7e55d0788b36 drm/vmwgfx: Return the correct value in vmw_translate_ptr functions
    2106a0153b5d drm/vmwgfx: Fix invalid kref_put callback in vmw_bo_dirty_release

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 8250679ed0..ae78c91f64 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8751b899ea5af349e8570e8985365290efa5e7d6"
-SRCREV_meta ?= "fdd48963e673d657f0df21b4b1fb6b18dbaa96bc"
+SRCREV_machine ?= "aa09ac001c2f96bd4ba32ba47e84e02db0f6ceed"
+SRCREV_meta ?= "a5d680f4986edab4c2c4636c0dc80ca559fc70ef"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.129"
+LINUX_VERSION ?= "6.6.130"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index bd4a10b564..0bc45ffd64 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.129"
+LINUX_VERSION ?= "6.6.130"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "d82c6cc64c037058c6bfd630f2d2604a38684c7d"
-SRCREV_meta ?= "fdd48963e673d657f0df21b4b1fb6b18dbaa96bc"
+SRCREV_machine ?= "2bf97eeefd96e27a2195cb4757c13110e92afcc6"
+SRCREV_meta ?= "a5d680f4986edab4c2c4636c0dc80ca559fc70ef"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 58a72979c5..ce59940544 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "539bf858552c12417a449646d0cad5e53e038aa0"
-SRCREV_machine:qemuarm64 ?= "e4153b3c5bff6c503990c35826d84a034d2d7a33"
-SRCREV_machine:qemuloongarch64 ?= "3dbf485808fc7be82368f70f385fead9735b5904"
-SRCREV_machine:qemumips ?= "d5da07b097555f20280b2484da875c93f1494d48"
-SRCREV_machine:qemuppc ?= "9434ddc68ebc90e9336d4cc6f642aa82c0da023c"
-SRCREV_machine:qemuriscv64 ?= "3dbf485808fc7be82368f70f385fead9735b5904"
-SRCREV_machine:qemuriscv32 ?= "3dbf485808fc7be82368f70f385fead9735b5904"
-SRCREV_machine:qemux86 ?= "3dbf485808fc7be82368f70f385fead9735b5904"
-SRCREV_machine:qemux86-64 ?= "3dbf485808fc7be82368f70f385fead9735b5904"
-SRCREV_machine:qemumips64 ?= "e6f498c7aa6909c17b90b50267d1577ddc19c0d6"
-SRCREV_machine ?= "3dbf485808fc7be82368f70f385fead9735b5904"
-SRCREV_meta ?= "fdd48963e673d657f0df21b4b1fb6b18dbaa96bc"
+SRCREV_machine:qemuarm ?= "b4e8a23613e117b5803dae49e8d4d562c37bd8a3"
+SRCREV_machine:qemuarm64 ?= "236dabe34ed663918803f17cbda90a1d6ac39922"
+SRCREV_machine:qemuloongarch64 ?= "cc107ef0945033f98a169bf1294dad3b574bfc60"
+SRCREV_machine:qemumips ?= "8022cb3ada420a7a3508dcd0a00e7367a0b08e52"
+SRCREV_machine:qemuppc ?= "77817988bcc71ba230e44d14e2d1c66837543dc9"
+SRCREV_machine:qemuriscv64 ?= "cc107ef0945033f98a169bf1294dad3b574bfc60"
+SRCREV_machine:qemuriscv32 ?= "cc107ef0945033f98a169bf1294dad3b574bfc60"
+SRCREV_machine:qemux86 ?= "cc107ef0945033f98a169bf1294dad3b574bfc60"
+SRCREV_machine:qemux86-64 ?= "cc107ef0945033f98a169bf1294dad3b574bfc60"
+SRCREV_machine:qemumips64 ?= "7ffb3cfb496703be3c0951bf54eb6ce69fdd1a1e"
+SRCREV_machine ?= "cc107ef0945033f98a169bf1294dad3b574bfc60"
+SRCREV_meta ?= "a5d680f4986edab4c2c4636c0dc80ca559fc70ef"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "4fc00fe35d46b4fc8dac2eb543a0e3d44bb15f47"
+SRCREV_machine:class-devupstream ?= "c09fbcd31ae6d71e7c69545839bec92d8e15c13b"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.129"
+LINUX_VERSION ?= "6.6.130"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


