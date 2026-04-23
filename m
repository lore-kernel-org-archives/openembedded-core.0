Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7D5CFC0349
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:32:30 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.393.1776958347025581887
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 08:32:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=T4TWJAW9;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8a58057d7baso81985746d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 08:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776958346; x=1777563146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAwZPW7EeoGUOgOrFyqos8v/nYHRS9zlHcXdETbnyeo=;
        b=T4TWJAW9avKXoQucjh6WM6Il8cXIoT/p3aWtneAevtWuDhnZrWOo87cc4BgHQjYF3t
         PpO68HIzNAh8ypX1C6ZCgaKnxSyhQwLfUticG6/i2VUYiFzLUMK+wvLRWA3MDNovQsgh
         Ovboow9B8ktlyI3xzDYMvWXqA1/MjJ/Ohae92bhYjjYR+pA+1qSeyr3PUPfBj4vj+76Z
         sjFLKV6pHN3fNTIX5cfvXjySU4WFbapoX/Ib+9eEwYoPRtewExKQ7mwJcwTYLP+KXCLR
         BmYxCSf/ibWDU9k2Ax3Pi4NoWp1vfeQG5yAs2vKPKH4fBRpblN+UrbS91Mkcn6498gvx
         Mtbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776958346; x=1777563146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MAwZPW7EeoGUOgOrFyqos8v/nYHRS9zlHcXdETbnyeo=;
        b=kCqL2f/blPhj0MMVr2/ehuyRaLsjyrSMx8O6/HU096RUiRijLs3aoIVTMX14LffVYt
         o5oA8oGvBzIljy1OCjH6VPAr+ZmlCUHKBtbJRALqU/P6w+27Yw6HN/JVHujy4JhJYH+K
         fVOBGw97mEhxZfE53AaV//+EVxKXpuQZSGyWdCWWncKOs4eqkCWCRtxydFo3+fmXG89m
         c83ELhKG7xM2myM57lBH2vFqn3JpsdpHu1acR6yC2xoksdln3NQTm9hJHYYUtbumXP6O
         K8ShHnPEM3Pom6rsF+euln9wCvIC8u+GabpPhX/WJJEGiV4VNT+qygocOJyWJ0fX8qg1
         GUrw==
X-Gm-Message-State: AOJu0YzOF9pjH/maBycPuLi79vZQpaR2n2kSuV0pgn/JtRNIk/u/X+XU
	Np3lsB0I8fyLVUYehPIebaaPggjDGLlsBsG8qR9hfhD6TZqgglFUbDRS++Cx7qkE
X-Gm-Gg: AeBDiet0UU9fMxvuLyh/Apg8j6lI/lPpCkKCpb3DPyj9lRsY20XfAPftxM4ZwfZMn9+
	OQD6qbXzK/q23fuuN0T72TQA/ls2S6L5McZlrXwv6Bww1vKDQNQFNMr1gGSOOJ9LkAyJYWEegkc
	UTjMk1papIzRDSpwIypkUW7BLhne1EX6EBrL3VYC1dFBEYp1u2AZI/xSvfmW9iDee1DSQCu4UPD
	zLldkcxbq7rN2vasrargb5m2/yo4UKVC/8+qOMNspfazTrO1krLmhHyk2uQN4rrC9WJ2lhOxH13
	DHx5bf/joiC3OyE0/yJwLMK9gaUPx4wqQCOFKLQW4s3ziDJrzrncswvubInWNDOwlj10jpQ9LjA
	v9Bey8c41yLxUzeYZI4IOxzeAc+QWuq5f7T1fUNYjCBKG7XenOzn10+tUN1LxI6ESfdBYGFWP0/
	rX/YhJtt7Ljn3/Bv4B1yTaSmiWDta77Ev7+rUroFONja+3a4hco8746EhWAl5e0F8p5VoXyxDUq
	0PrZUVaxxX1zDJp5ctuJSO8apu0/nozsb9SJe4qdSy233AnsPaWOEYoVcP+ebd9dHblftmwFY19
	TDfX
X-Received: by 2002:a05:6214:226c:b0:8a6:1216:fb6f with SMTP id 6a1803df08f44-8b0280ef2ecmr428263596d6.32.1776958345602;
        Thu, 23 Apr 2026 08:32:25 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac429ffsm160765996d6.2.2026.04.23.08.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:32:25 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 01/15] linux-yocto/6.18: update to v6.18.20
Date: Thu, 23 Apr 2026 11:32:08 -0400
Message-ID: <20260423153222.1932256-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423153222.1932256-1-bruce.ashfield@gmail.com>
References: <20260423153222.1932256-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 15:32:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235776

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.18 to the latest korg -stable release that comprises
the following commits:

    dd26ea937ef59 Linux 6.18.20
    a52e3970f9717 xen/privcmd: add boot control for restricted usage in domU
    389bae9a44099 xen/privcmd: restrict usage in unprivileged domU
    f909f22f5cec6 hwmon: (max6639) Fix pulses-per-revolution implementation
    96955cf9f5ba6 arm64: realm: Fix PTE_NS_SHARED for 52bit PA support
    ef6e6484747e3 tools/bootconfig: fix fd leak in load_xbc_file() on fstat failure
    d03e8c281fd3e lib/bootconfig: check xbc_init_node() return in override path
    3ab1d7c8b6b7e fs/tests: exec: Remove bad test vector
    cf4b224ffb9a5 drm/i915/gt: Check set_default_submission() before deferencing
    a5828c14a9e3d ksmbd: fix use-after-free in durable v2 replay of active file handles
    7f7468fd2a755 ksmbd: fix use-after-free of share_conf in compound request
    2cb24caacee21 drm/bridge: dw-hdmi-qp: fix multi-channel audio output
    c51a5319bf655 drm/amd: fix dcn 2.01 check
    430334e9e4e81 drm/amd/display: Fix DisplayID not-found handling in parse_edid_displayid_vrr()
    58abeb7b9562f iommu/sva: Fix crash in iommu_sva_unbind_device()
    3f300a41a3668 drm/vmwgfx: Don't overwrite KMS surface dirty tracker
    bec21d97c968a spi: amlogic-spisg: Fix memory leak in aml_spisg_probe()
    f15e0706e366b spi: amlogic: spifc-a4: Remove redundant clock cleanup
    a9e119d027fd5 mtd: rawnand: brcmnand: skip DMA during panic write
    5fd5c078af23c mtd: rawnand: serialize lock/unlock against other NAND operations
    f8b5b833728bf binfmt_elf_fdpic: fix AUXV size calculation for ELF_HWCAP3 and ELF_HWCAP4
    75668e58244e6 tracing: Fix trace_marker copy link list updates
    79f0faf81d3bb x86/platform/uv: Handle deconfigured sockets
    38539f55f61ad tracing: Fix failure to read user space from system call trace events
    b6925774dd15d ring-buffer: Fix to update per-subbuf entries of persistent ring buffer
    886fa86915391 perf/x86: Move event pointer setup earlier in x86_pmu_enable()
    ed1f5c1d43c30 perf/x86/intel: Add missing branch counters constraint apply
    560ec8f998522 irqchip/riscv-rpmi-sysmsi: Fix mailbox channel leak in rpmi_sysmsi_probe()
    aa9faa6486cfc i2c: pxa: defer reset on Armada 3700 when recovery is used
    bf8a9c92cdd1f i2c: fsi: Fix a potential leak in fsi_i2c_probe()
    a9778298f4703 i2c: cp2615: fix serial string NULL-deref at probe
    7003794316b18 USB: serial: f81232: fix incomplete serial port generation
    58b91c5cb685a hwmon: (pmbus/isl68137) Fix unchecked return value and use sysfs_emit()
    81f61e3e1ca2d hwmon: (pmbus/mp2869) Check pmbus_read_byte_data() before using its return value
    48fed64590800 hwmon: (pmbus/mp2975) Add error check for pmbus_read_word_data() return value
    4418f3186b223 hwmon: (pmbus/ina233) Add error check for pmbus_read_word_data() return value
    beab26de7bcac MPTCP: fix lock class name family in pm_nl_create_listen_socket
    d938dd5a0ad78 icmp: fix NULL pointer dereference in icmp_tag_validation()
    6ab68b4adf744 net: dsa: bcm_sf2: fix missing clk_disable_unprepare() in error paths
    719f6784f918f net: shaper: protect from late creation of hierarchy
    581eee0890a8b net: shaper: protect late read accesses to the hierarchy
    7df2b50cae1a7 net: mvpp2: guard flow control update with global_tx_fc in buffer switching
    3932620c04c29 nfnetlink_osf: validate individual option lengths in fingerprints
    c8092edb9a11f netfilter: nf_tables: release flowtable after rcu grace period on error
    c25e0dec366ae netfilter: bpf: defer hook memory release until rcu readers are done
    017d674cf6930 net: bonding: fix NULL deref in bond_debug_rlb_hash_show
    003343985f26d udp_tunnel: fix NULL deref caused by udp_sock_create6 when CONFIG_IPV6=n
    96c9c25b74686 net/mlx5e: Fix race condition during IPSec ESN update
    2c6a5be0aee5a net/mlx5e: Prevent concurrent access to IPSec ASO context
    ea52e95be4638 net/mlx5: qos: Restrict RTNL area to avoid a lock cycle
    c852ebfe43344 net: macb: fix uninitialized rx_fs_lock
    63e192b8956a2 netdevsim: drop PSP ext ref on forward failure
    98473309a36ac ACPI: processor: Fix previous acpi_processor_errata_piix4() fix
    06e769dddcbeb wifi: mac80211: always free skb on ieee80211_tx_prepare_skb() failure
    46c670ff1ff46 wifi: wlcore: Return -ENOMEM instead of -EAGAIN if there is not enough headroom
    44699c6cdfce8 wifi: mac80211: fix NULL deref in mesh_matches_local()
    5f284b12cc127 libie: prevent memleak in fwlog code
    cff11b1c03e6f iavf: fix VLAN filter lost on add/delete race
    31521c124e648 igc: fix page fault in XDP TX timestamps handling
    3472c22c067ab igc: fix missing update of skb->tail in igc_xmit_frame()
    89b2b1c64d09a ACPICA: Update the format of Arg3 of _DSM
    d3e32a612c639 net: usb: aqc111: Do not perform PM inside suspend callback
    4c9af67f99aa3 clsact: Fix use-after-free in init/destroy rollback asymmetry
    a5bd5a2710310 net: usb: cdc_ncm: add ndpoffset to NDP32 nframes bounds check
    403f94ddcb36c net: usb: cdc_ncm: add ndpoffset to NDP16 nframes bounds check
    d538b371da1e7 net: airoha: Remove airoha_dev_stop() in airoha_remove()
    e9c66d3e7d855 net/sched: teql: Fix double-free in teql_master_xmit
    fd7579f0a2c84 net/smc: fix NULL dereference and UAF in smc_tcp_syn_recv_sock()
    4172a7901cf43 bonding: prevent potential infinite loop in bond_header_parse()
    bb081fd37f831 PM: runtime: Fix a race condition related to device removal
    34c979e29bf68 sched: idle: Consolidate the handling of two special cases
    afdb1533eb9c0 net: mana: fix use-after-free in mana_hwc_destroy_channel() by reordering teardown
    6995dcc1a93de net: bcmgenet: increase WoL poll timeout
    683be1d1670e9 crypto: ccp - Fix leaking the same page twice
    9d00fe7d6d7c5 netfilter: nf_conntrack_h323: check for zero length in DecodeQ931()
    f1aa81396d779 netfilter: xt_time: use unsigned int for monthday bit shift
    cb549925875fa netfilter: xt_CT: drop pending enqueued packets on template removal
    f29a055e4f593 netfilter: nft_ct: drop pending enqueued packets on removal
    31641c682db73 nf_tables: nft_dynset: fix possible stateful expression memleak in error path
    6bce72daeccca netfilter: nf_conntrack_h323: fix OOB read in decode_int() CONS case
    865dba58958c3 netfilter: nf_conntrack_sip: fix Content-Length u32 truncation in sip_help_tcp()
    04c8907ce4e3d netfilter: ctnetlink: fix use-after-free in ctnetlink_dump_exp_ct()
    e01a597707c88 mpls: add missing unregister_netdevice_notifier to mpls_init
    0c3e8bff808f1 net/rose: fix NULL pointer dereference in rose_transmit_link on reconnect
    d8f35767bacb3 bridge: cfm: Fix race condition in peer_mep deletion
    1e1b7a7496a2e Bluetooth: qca: fix ROM version reading on WCN3998 chips
    da3000cbe4851 Bluetooth: L2CAP: Fix use-after-free in l2cap_unregister_user
    f8b6ed2f06d3b Bluetooth: HIDP: Fix possible UAF
    b5c5e96f3b0a5 Bluetooth: MGMT: Fix list corruption and UAF in command complete handlers
    84d041cfefab5 Bluetooth: hci_sync: Fix hci_le_create_conn_sync
    874e73969d48c Bluetooth: ISO: Fix defer tests being unstable
    fce04c8b54e43 Bluetooth: SMP: make SM/PER/KDU/BI-04-C happy
    37021b16b270c Bluetooth: LE L2CAP: Disconnect if sum of payload sizes exceed SDU
    734aa845f2748 Bluetooth: LE L2CAP: Disconnect if received packet's SDU exceeds IMTU
    70d9bd9a2e683 firmware: arm_scmi: Fix NULL dereference on notify error path
    d282757b0f6dd firmware: arm_scpi: Fix device_node reference leak in probe path
    3983811cab779 firmware: arm_ffa: Remove vm_id argument in ffa_rxtx_unmap()
    ad01256fa62d0 arm64: dts: renesas: rzg3s-smarc-som: Set bypass for Versa3 PLL2
    2a53d63ac78c2 arm64: dts: renesas: r9a09g087: Fix CPG register region sizes
    dfe08c4dde872 arm64: dts: renesas: r9a09g077: Fix CPG register region sizes
    fa59e9cfbed9a arm64: dts: renesas: r9a09g057: Remove wdt{0,2,3} nodes
    74893eb6d3602 arm64: dts: renesas: r9a09g057: Add RTC node
    2e5902c28fbde arm64: dts: renesas: rzv2-evk-cn15-sd: Add ramp delay for SD0 regulator
    edf76d9576907 arm64: dts: renesas: rzt2h-n2h-evk: Add ramp delay for SD0 card regulator
    a1b7a843f12a0 wifi: cfg80211: cancel pmsr_free_wk in cfg80211_pmsr_wdev_down
    5ba05436f15d1 wifi: mac80211: Fix static_branch_dec() underflow for aql_disable.
    31d4ceb785d9b wifi: mac80211: use jiffies_delta_to_msecs() for sta_info inactive times
    f6a620a9d6a60 wifi: mac80211: remove keys after disabling beaconing
    c2f6107728ea3 tee: shm: Remove refcounting of kernel pages
    294e0c8bc3502 soc: fsl: cpm1: qmc: Fix error check for devm_ioremap_resource() in qmc_qe_init_resources()
    85dbbf7dc88b0 soc: fsl: qbman: fix race condition in qman_destroy_fq
    2315d328faa89 soc: rockchip: grf: Add missing of_node_put() when returning
    640452dbc118e cache: ax45mp: Fix device node reference leak in ax45mp_cache_init()
    606fcf901c132 cache: starfive: fix device node leak in starlink_cache_init()
    e3dd5cffba07d soc: microchip: mpfs: Fix memory leak in mpfs_sys_controller_probe()
    8f9e054f605ae btrfs: tree-checker: fix misleading root drop_level error message
    1cf30c73602c6 btrfs: log new dentries when logging parent dir of a conflicting inode
    9691c50fd5dd1 drm/i915/psr: Compute PSR entry_setup_frames into intel_crtc_state
    8d0d94f8ba5b3 Bluetooth: L2CAP: Fix accepting multiple L2CAP_ECRED_CONN_REQ
    1e9e2640d870d drm/xe: Open-code GGTT MMIO access protection
    8613cca4f5f4f drm/xe/oa: Allow reading after disabling OA stream
    954dae0d94fbf drm/xe/guc: Ensure CT state transitions via STOP before DISABLED
    0b35d11fbbcfd drm/i915/dmc: Fix an unlikely NULL pointer deference at probe
    5ce4a38e6c248 drm/amdgpu: Limit BO list entry count to prevent resource exhaustion
    73908f65f5cc3 drm/amdgpu: apply state adjust rules to some additional HAINAN vairants
    c18eef45af036 drm/radeon: apply state adjust rules to some additional HAINAN vairants
    772f3653eef50 drm/imagination: Synchronize interrupts before suspending the GPU
    9497b1f309436 drm/imagination: Fix deadlock in soft reset sequence
    7687403d65805 drm/amdgpu/mmhub4.1.0: add bounds checking for cid
    72365be44cc7e drm/amdgpu/mmhub3.0: add bounds checking for cid
    4b9e5676db815 drm/amdgpu/mmhub3.0.2: add bounds checking for cid
    56f0473d3c631 drm/amdgpu/mmhub3.0.1: add bounds checking for cid
    603db8a36517c drm/amdgpu/mmhub2.3: add bounds checking for cid
    2c4eea0eba197 drm/amdgpu/mmhub2.0: add bounds checking for cid
    3256b95b2d3c4 drm/amdgpu/gmc9.0: add bounds checking for cid
    e25fff4a9eac9 drm/amd/display: Wrap dcn32_override_min_req_memclk() in DC_FP_{START, END}
    074d06d3724cc drm: Fix use-after-free on framebuffers and property blobs when calling drm_dev_unplug
    3b02923b046af serial: uartlite: fix PM runtime usage count underflow on probe
    efe85a557186b serial: core: fix infinite loop in handle_tx() for PORT_UNKNOWN
    a773f019c0b06 serial: 8250_dw: Ensure BUSY is deasserted
    0e16f461f2b19 serial: 8250: Add late synchronize_irq() to shutdown to handle DW UART BUSY
    5dfd8c76c0a4d serial: 8250_dw: Rework IIR_NO_INT handling to stop interrupt storm
    2d21617bce4f2 serial: 8250_dw: Rework dw8250_handle_irq() locking and IIR handling
    9bb497252a420 serial: 8250: Add serial8250_handle_irq_locked()
    3b1d813de41eb serial: 8250_dw: Avoid unnecessary LCR writes
    e6cc0536d1547 serial: 8250: Protect LCR write in shutdown
    4afc12dae7487 serial: 8250: always disable IRQ during THRE test
    5f6b17562f03f serial: 8250: Fix TX deadlock when using DMA
    5e5b209b2d932 serial: 8250_pci: add support for the AX99100
    c4efef65a46f6 vt: save/restore unicode screen buffer for alternate screen
    19e46bf37943b io_uring/kbuf: propagate BUF_MORE through early buffer commit path
    f98405afd2a70 io_uring/kbuf: fix missing BUF_MORE for incremental buffers at EOF
    0f4ce79b8db7b io_uring/poll: fix multishot recv missing EOF on wakeup race
    ee312bb1052e4 iommu/vt-d: Only handle IOPF for SVA when PRI is supported
    300e7cfdc92bb iommu/vt-d: Fix intel iommu iotlb sync hardlockup and retry
    c4054ad2d8bff mtd: Avoid boot crash in RedBoot partition table parser
    215f6d6845a3e mtd: rawnand: cadence: Fix error check for dma_alloc_coherent() in cadence_nand_init()
    978f50a3d7dac mtd: rawnand: pl353: make sure optimal timings are applied
    378b295f67102 spi: fix statistics allocation
    80f3e8cd2b4ad spi: fix use-after-free on controller registration failure
    18605b1b936b6 pmdomain: bcm: bcm2835-power: Increase ASB control timeout
    5ed633b212bda mmc: sdhci: fix timing selection for 1-bit bus width
    c8d5757ab6d6a mmc: sdhci-pci-gli: fix GL9750 DMA write corruption
    1343f110663dd ata: libata-scsi: report correct sense field pointer in ata_scsiop_maint_in()
    2229b4cf97301 ata: libata-core: disable LPM on ADATA SU680 SSD
    08b2b65c63bb2 mm/huge_memory: fix a folio_split() race condition with folio_try_get()
    edb6c2118293c ipmi:msghandler: Handle error returns from the SMI sender
    1e363c11cd2f1 ipmi: Consolidate the run to completion checking for xmit msgs lock
    522acaae34aa7 sched_ext: Disable preemption between scx_claim_exit() and kicking helper work
    c1b8245c0a387 sched_ext: Simplify breather mechanism with scx_aborting flag
    c44198f25fdfe sched_ext: Fix starvation of scx_enable() under fair-class saturation
    2f3dea284c761 nsfs: tighten permission checks for ns iteration ioctls
    05edc78eb4699 drm/xe/sync: Fix user fence leak on alloc failure
    528aaa37d3c3f fgraph: Fix thresh_return nosleeptime double-adjust
    407cc37c21d51 ksmbd: Don't log keys in SMB3 signing and encryption key generation
    58f5d34f88e8f net: macb: Shuffle the tx ring before enabling tx
    0cbc0d719ecc1 net: macb: sort #includes
    8a7d29b8bda14 drm/i915/vrr: Configure VRR timings after enabling TRANS_DDI_FUNC_CTL
    1aa7745b97fda drm/i915/vrr: Move HAS_VRR() check into intel_vrr_set_transcoder_timings()
    c3aa7b837920c drm/xe: Fix memory leak in xe_vm_madvise_ioctl
    f655467a9973f cifs: open files should not hold ref on superblock
    6f502049a96b3 crypto: atmel-sha204a - Fix OOM ->tfm_count leak
    2d7238eec40ad netconsole: fix sysdata_release_enabled_show checking wrong flag
    f13fe67947267 ublk: fix NULL pointer dereference in ublk_ctrl_set_size()
    bea2848ba20e1 LoongArch: Check return values for set_memory_{rw,rox}
    fc9d6999ebfa2 net: macb: Reinitialize tx/rx queue pointer registers and rx ring during resume
    4e1436e0b13c6 net: macb: Introduce gem_init_rx_ring()
    4ab7c9fa0a477 drm/i915/psr: Write DSC parameters on Selective Update in ET mode
    a5cdbbc771470 drm/i915/dsc: Add helper for writing DSC Selective Update ET parameters
    291d19d586a5a drm/i915/dsc: Add Selective Update register definitions
    3d80ebe6d1b7b ksmbd: use volume UUID in FS_OBJECT_ID_INFORMATION
    9feb2d1bf86d9 ksmbd: unset conn->binding on failed binding request
    9ee803bfdba0c smb: client: fix krb5 mount with username option
    e7ff754e339e3 Bluetooth: L2CAP: Validate L2CAP_INFO_RSP payload length before access
    5a1ea296f8589 Bluetooth: L2CAP: Fix type confusion in l2cap_ecred_reconf_rsp()
    1768244b85dd2 crypto: padlock-sha - Disable for Zhaoxin processor
    5a86d4e920d97 mac80211: fix crash in ieee80211_chan_bw_change for AP_VLAN stations
    0e35db29fc5a9 batman-adv: avoid OGM aggregation when skb tailroom is insufficient
    f5ed9e50c0872 parisc: Flush correct cache in cacheflush() syscall
    19aa416eed9e4 bnxt_en: fix OOB access in DBG_BUF_PRODUCER async event handler
    1f4714065b2bc net: macb: fix use-after-free access to PTP clock
    4de9ed2ea22d6 NFC: nxp-nci: allow GPIOs to sleep
    8dd23bb5c6f5c LoongArch: No need to flush icache if text copy failed
    250aae6a5738a LoongArch: Give more information if kmem access failed
    6e096db800db8 mm/huge_memory: fix early failure try_to_migrate() when split huge pmd for shared THP
    f3caaee0f9e48 mm/huge_memory: fix use of NULL folio in move_pages_huge_pmd()
    99888a4f340ca mm/rmap: fix incorrect pte restoration for lazyfree folios
    4897bd307ba87 crash_dump: don't log dm-crypt key bytes in read_key_from_user_keying
    a226e5b49e5fe nvdimm/bus: Fix potential use after free in asynchronous initialization
    be5c35960e5ea sunrpc: fix cache_request leak in cache_release
    73c5b5aea1c44 HID: bpf: prevent buffer overflow in hid_hw_request
    6487774a576dd selftests/hid: fix compilation when bpf_wq and hid_device are not exported
    0f0e2a54a31a7 nfsd: fix heap overflow in NFSv4.0 LOCK replay cache
    db4a9f99b12a7 NFSD: Hold net reference for the lifetime of /proc/fs/nfs/exports fd
    2829e80d29b62 NFSD: Defer sub-object cleanup in export put callbacks

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.18.bb              |  6 ++---
 .../linux/linux-yocto-tiny_6.18.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index 626f30fb83..f9ed72acc7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -15,13 +15,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "64a2ea6184db4c022bec6090982b4b617a6c844b"
-SRCREV_meta ?= "465cb5bcefd72f429e0b3ad6ab5b3fcff5b390fc"
+SRCREV_machine ?= "ed994ec846841494b9a1ff2badfa89970ad1d34f"
+SRCREV_meta ?= "41925d8d9ac0b1d6bdc0f9d84c5d7fd68ebcb693"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.18.19"
+LINUX_VERSION ?= "6.18.20"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index b91e05cf37..75cda179f7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.18.inc
 
-LINUX_VERSION ?= "6.18.19"
+LINUX_VERSION ?= "6.18.20"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "1fa8fa91abea837d76ab91c972e8387aae78157e"
-SRCREV_meta ?= "465cb5bcefd72f429e0b3ad6ab5b3fcff5b390fc"
+SRCREV_machine ?= "4bd22cd74687bdc41573595014bfc99a2d25f18a"
+SRCREV_meta ?= "41925d8d9ac0b1d6bdc0f9d84c5d7fd68ebcb693"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index c84bdf2996..63ed493450 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "f1b3530df0e8d9a33dd71b5035af018bf0596618"
-SRCREV_machine:qemuarm64 ?= "1fa8fa91abea837d76ab91c972e8387aae78157e"
-SRCREV_machine:qemuloongarch64 ?= "1fa8fa91abea837d76ab91c972e8387aae78157e"
+SRCREV_machine:qemuarm ?= "d9ebaa48a5dcfb812a0ac2421600f91ca686c4d8"
+SRCREV_machine:qemuarm64 ?= "4bd22cd74687bdc41573595014bfc99a2d25f18a"
+SRCREV_machine:qemuloongarch64 ?= "4bd22cd74687bdc41573595014bfc99a2d25f18a"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "1fa8fa91abea837d76ab91c972e8387aae78157e"
-SRCREV_machine:qemuriscv64 ?= "1fa8fa91abea837d76ab91c972e8387aae78157e"
-SRCREV_machine:qemuriscv32 ?= "1fa8fa91abea837d76ab91c972e8387aae78157e"
-SRCREV_machine:qemux86 ?= "1fa8fa91abea837d76ab91c972e8387aae78157e"
-SRCREV_machine:qemux86-64 ?= "1fa8fa91abea837d76ab91c972e8387aae78157e"
+SRCREV_machine:qemuppc ?= "4bd22cd74687bdc41573595014bfc99a2d25f18a"
+SRCREV_machine:qemuriscv64 ?= "4bd22cd74687bdc41573595014bfc99a2d25f18a"
+SRCREV_machine:qemuriscv32 ?= "4bd22cd74687bdc41573595014bfc99a2d25f18a"
+SRCREV_machine:qemux86 ?= "4bd22cd74687bdc41573595014bfc99a2d25f18a"
+SRCREV_machine:qemux86-64 ?= "4bd22cd74687bdc41573595014bfc99a2d25f18a"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "1fa8fa91abea837d76ab91c972e8387aae78157e"
-SRCREV_meta ?= "465cb5bcefd72f429e0b3ad6ab5b3fcff5b390fc"
+SRCREV_machine ?= "4bd22cd74687bdc41573595014bfc99a2d25f18a"
+SRCREV_meta ?= "41925d8d9ac0b1d6bdc0f9d84c5d7fd68ebcb693"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "4aea1dc4cad17cd146072e13b1fd404f32b8b3ef"
+SRCREV_machine:class-devupstream ?= "dd26ea937ef593a9c47aa4c85296e6b57a5344a1"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.18/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.18.19"
+LINUX_VERSION ?= "6.18.20"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


