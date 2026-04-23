Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B881FC0354
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:32:51 +0000 (UTC)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.425.1776958361433684881
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 08:32:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hk3O3ojJ;
 spf=pass (domain: gmail.com, ip: 209.85.217.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-612d8a59cc0so2144732137.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 08:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776958360; x=1777563160; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T17bfxMyskuFuJJNW3P0ROdNbG9M7dQycMFLTUV0IN0=;
        b=hk3O3ojJd4d+MZ9wx9KOW2/6I/Q+1/X0bR417Ph3p0fCsDDNgohxCLaQUcN3Em9i7J
         1hCRxPxs66ujfrOtVanMg4AZYULRNQg34DxbLaj9q8YpsGIyYwBM7uYUSS5bEO5zMB1i
         d8vdqI2OE2diREAXx0LJZl+e7LXKqq7l3J+0ZU5Sn+PnHURBOApyFTGUUJoMrzeH2XfH
         R/JLs48jgn1I2+8XF2GwMvutU4bpf925OXdcWqRVMGsf3ptT/H0d9sukQzDIuFeil5+i
         w8MxE/A5gIRQxYHPXvcwg0vn5GMkc1ot3thwBE0luyScFD/ILJzD0F9ZSaUbqNRTRKEB
         +WMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776958360; x=1777563160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T17bfxMyskuFuJJNW3P0ROdNbG9M7dQycMFLTUV0IN0=;
        b=euxlWdGsk7kD+sj4MMGkkr7vRzKUS5l5Kn0gHK3jZhMlYV9Om7DclvDVB13O2DAojH
         cOFMytrYTsNTmksH2jeFiNPoqdCcmrBcz0jwYBBscRnYajWbNmQrntY8dNaYwgOT7Mgv
         et9GOqDWc0l1/2C2t0lk3pOmDcM05wTjZdeNhvrMvcOcqUhxnu9lMU6Q4H5VQxfrNYea
         qh3E59f9kzecYKfyXJjaF+06wn+Rcf/CqXa0ojlqv67AJPsSRBwIYA43feA/c8rujdCU
         mMdtZZme06ody4qr6lTx2aCa5Cpjgwp3U5ZnVJWzrhk081ctMBx6ULlcg6etKVVYX/l6
         /bsg==
X-Gm-Message-State: AOJu0YxiZUavDGyT5Br+98Tlsms4vTwQiJkqGWMEqFL2jO69AZx/13A0
	38hwup/n74Fz9x40aqEwiPxDjbz9/48FBBp6x8KbFNm4yqENk0CEWb1nF07r/iRI
X-Gm-Gg: AeBDiet//xiokkPvxZ+hGUX3bJ9b0+mGRl6bTpujgwbnFR6if61DrW1EmU0mch0V42Z
	VMb7qn2AGzW5d5LKvJzph0ITmsd3L8lujOk2e64Vtn7+JNg+enbqN8v91Ykek8lN4ndZRw2kjq8
	oC2NSy+4Mh8KmAU0IZXt9vSdGaZAyfM8ZxKwkNmz7JfyU6QOxgba1inWc4yeZcfExmt/nsaId7f
	QPX5s5roUViyeWHCMBRDgnvdLF6JrpvgqzIlGdGeKgXJrZH/PCRJFXNL3gkWSunG0hAHtNWmgEv
	WLNlm0P2vZ3WS44i8lW66b9qW/Ycgu65V6craEzC1evxL8dWz6w7eTY6E+DOMelosbP/Z2DmDAH
	sDcR9UT7rQi7608W+xomis/0njIRTsGuAzMEjswuZjhZYOBdxqhOKQtN1OnPUlMIQ8/kEuGQe5Y
	hwnzRNIagJsNEEoNTKpNv8cbPKfH7qxyJcc9KpOdQPL8b71zd4fZBhF0ZkEPINCKghmq9MPo/u5
	toDQHTU6E03Us8dHripdWv1jkwpDu5WF1+bUE8tH4lwuJn3dUAHZIYpmK7w86YGqJlBKw==
X-Received: by 2002:a05:6102:5493:b0:5ff:cee8:660c with SMTP id ada2fe7eead31-616f88bac7fmr14505719137.31.1776958359028;
        Thu, 23 Apr 2026 08:32:39 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac429ffsm160765996d6.2.2026.04.23.08.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:32:37 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta-yocto-bsp][PATCH 11/15] yocto-bsps: update to v6.18.20
Date: Thu, 23 Apr 2026 11:32:18 -0400
Message-ID: <20260423153222.1932256-12-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423153222.1932256-1-bruce.ashfield@gmail.com>
References: <20260423153222.1932256-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 15:32:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235787

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
    4aea1dc4cad17 Linux 6.18.19
    224404f54036e bpf: drop kthread_exit from noreturn_deny
    9fd37b636bc2d drm/bridge: ti-sn65dsi86: Add support for DisplayPort mode with HPD
    24fda228496c6 mm/damon/core: disallow non-power of two min_region_sz
    b0d0903594dd6 io_uring/eventfd: use ctx->rings_rcu for flags checking
    7cc4530b3e952 io_uring: ensure ctx->rings is stable for task work flags manipulation
    ae3831b44f477 net/tcp-md5: Fix MAC comparison to be constant-time
    ce2a263bc57c1 lib/crypto: tests: Depend on library options rather than selecting them
    93c0a22fec914 ksmbd: Compare MACs in constant time
    4af5dfb8dca3a smb: client: Compare MACs in constant time
    97ea8f3bbdaef kbuild: Leave objtool binary around with 'make clean'
    ba3bca40f9f25 KVM: SVM: Set/clear CR8 write interception when AVIC is (de)activated
    0ff26b41c882c KVM: SVM: Add a helper to look up the max physical ID for AVIC
    ba28a0dcc41ae KVM: SVM: Limit AVIC physical max index based on configured max_vcpu_ids
    b7493f48c3dba KVM: arm64: Eagerly init vgic dist/redist on vgic creation
    2a01a93ed2266 KVM: arm64: gic: Set vgic_model before initing private IRQs
    8d02bbfb09003 mmc: dw_mmc-rockchip: Fix runtime PM support for internal phase support
    5b58ba042e237 mmc: dw_mmc-rockchip: Add memory clock auto-gating support
    4c3a860b96e72 drm/gud: fix NULL crtc dereference on display disable
    51aa99e59d7f5 drm/gud: rearrange gud_probe() to prepare for function splitting
    94b6d0ba4b640 mm: Fix a hmm_range_fault() livelock / starvation problem
    fffce2310e688 cxl/acpi: Fix CXL_ACPI and CXL_PMEM Kconfig tristate mismatch
    003df94bcc922 i3c: mipi-i3c-hci: Correct RING_CTRL_ABORT handling in DMA dequeue
    b684b420a5bb0 i3c: mipi-i3c-hci: Fix race in DMA ring dequeue
    a21d763335886 i3c: mipi-i3c-hci: Add missing TID field to no-op command descriptor
    57f99dc660e69 i3c: mipi-i3c-hci: Restart DMA ring correctly after dequeue abort
    d986d51a83f5c i3c: mipi-i3c-hci: Consolidate spinlocks
    74a4f77bbf786 i3c: mipi-i3c-hci: Factor out DMA mapping from queuing path
    478a99a961829 i3c: mipi-i3c-hci: Use ETIMEDOUT instead of ETIME for timeout errors
    ad9da7d39cecd iio: proximity: hx9023s: Protect against division by zero in set_samp_freq
    05723a2c4b09d iio: proximity: hx9023s: fix assignment order for __counted_by
    70b455484a661 iio: imu: inv_icm42600: fix odr switch when turning buffer off
    b5a6825579a7c iio: imu: inv_icm42600: fix odr switch to the same value
    aae572ddc2857 iio: light: bh1780: fix PM runtime leak on error path
    a8714d2d0df4e iio: gyro: mpu3050-i2c: fix pm_runtime error handling
    ba19dd366528b iio: imu: adis: Fix NULL pointer dereference in adis_init
    42685cf96e282 iio: gyro: mpu3050-core: fix pm_runtime error handling
    c7ae426705b01 iio: buffer: Fix wait_queue not being removed
    c528dc22d58b7 iio: chemical: bme680: Fix measurement wait duration calculation
    7c5edf1025ddb iio: potentiometer: mcp4131: fix double application of wiper shift
    b8a26d21c7dba iio: magnetometer: tlv493d: remove erroneous shift in X-axis data
    90e978ace5985 iio: chemical: sps30_i2c: fix buffer size in sps30_i2c_read_meas()
    eddba110685f8 iio: chemical: sps30_serial: fix buffer size in sps30_serial_read_meas()
    73dd9acb5b20b iio: frequency: adf4377: Fix duplicated soft reset mask
    1b2d9e23452bd iio: dac: ds4424: reject -128 RAW value
    014a021075c58 btrfs: abort transaction on failure to update root in the received subvol ioctl
    5e1ab71f74a1e btrfs: add missing RCU unlock in error path in try_release_subpage_extent_buffer()
    d11aefe654a04 btrfs: fix transaction abort on set received ioctl due to item overflow
    9273175bf16c8 btrfs: fix transaction abort on file creation due to name hash collision
    bac55dde8efa4 btrfs: fix transaction abort when snapshotting received subvolumes
    9b753ece26524 smb: client: fix iface port assignment in parse_server_interfaces
    92e64f1852f45 smb: client: fix in-place encryption corruption in SMB2_write()
    9509b659ca7eb smb: client: fix atomic open with O_DIRECT & O_SYNC
    bfbf1f286f682 lib/bootconfig: check bounds before writing in __xbc_open_brace()
    6e736a18cfbd5 lib/bootconfig: fix snprintf truncation check in xbc_node_compose_key_after()
    12d2b443b8606 kprobes: Remove unneeded warnings from __arm_kprobe_ftrace()
    11712c4eb3840 x86/apic: Disable x2apic on resume if the kernel expects so
    9f9157ee67b32 scsi: core: Fix error handling for scsi_alloc_sdev()
    d24330cf241f8 lib/bootconfig: fix off-by-one in xbc_verify_tree() unclosed brace error
    d2beb819045e4 powerpc64/bpf: fix the address returned by bpf_get_func_ip
    2ce9b27946125 powerpc64/bpf: fix kfunc call support
    4b89984f72742 powerpc/pseries: Correct MSI allocation tracking
    f7eda676386c5 s390/dasd: Copy detected format information to secondary device
    fe9cd8c8ee359 s390/dasd: Move quiesce state with pprc swap
    950a76e82e05a s390/zcrypt: Enable AUTOSEL_DOM for CCA serialnr sysfs attribute
    997967adf10ce sched_ext: Fix enqueue_task_scx() truncation of upper enqueue flags
    a35be7a17c7b1 xfs: ensure dquot item is deleted from AIL only after log shutdown
    446a1f5bb64ba xfs: fix undersized l_iclog_roundoff values
    ca504d2601b3b xfs: fix returned valued from xfs_defer_can_append
    2b4492d9ed0f2 xfs: fix integer overflow in bmap intent sort comparator
    316cc7b63fd58 cifs: make default value of retrans as zero
    50ad880db3013 io_uring/kbuf: check if target buffer list is still legacy on recycle
    950bda065b05e qmi_wwan: allow max_mtu above hard_mtu to control rx_urb_size
    8738dcc844fff net-shapers: don't free reply skb after genlmsg_reply()
    eb613e3d38abb tracing: Fix trace_buf_size= cmdline parameter with sizes >= 2G
    18bef795332b0 tracing: Fix enabling multiple events on the kernel command line and bootconfig
    9ecea60f132da drm/msm/dpu: Correct the SA8775P intr_underrun/intr_underrun index
    38f1640db7f8b drm/amd: Fix a few more NULL pointer dereference in device cleanup
    a751a1230533f drm/msm: Fix dma_free_attrs() buffer size
    0189bf176dbe6 drm/i915/psr: Repeat Selective Update area alignment
    eae4bf4107571 drm/i915: Fix potential overflow of shmem scatterlist length
    46275c56e7475 drm/bridge: ti-sn65dsi83: halve horizontal syncs for dual LVDS output
    818ebb298a753 drm/bridge: ti-sn65dsi83: fix CHA_DSI_CLK_RANGE rounding
    43025c941aced drm/amd: Fix NULL pointer dereference in device cleanup
    57579312e0e87 drm/amd: Set num IP blocks to 0 if discovery fails
    7885eb335d8f9 drm/amdgpu: Fix use-after-free race in VM acquire
    33c3a4db31719 drm/amd/pm: remove invalid gpu_metrics.energy_accumulator on smu v13.0.x
    6c58a9fdb0d0e net: dsa: microchip: Fix error path in PTP IRQ setup
    8efd5dcd31e22 net: ethernet: arc: emac: quiesce interrupts before requesting IRQ
    b70c4e5e71193 net: ncsi: fix skb leak in error paths
    ab5ebab966421 net: nexthop: fix percpu use-after-free in remove_nh_grp_entry
    3224990fb16a8 net: mctp: fix device leak on probe failure
    1d6abf145615d ksmbd: fix use-after-free by using call_rcu() for oplock_info
    8f5b1a7cb009a smb: server: fix use-after-free in smb2_open()
    dbbd328cf5826 ksmbd: fix use-after-free in smb_lazy_parent_lease_break_close()
    146691daf293c memcg: fix slab accounting in refill_obj_stock() trylock path
    159aebd20e0e9 slab: distinguish lock and trylock for sheaf_flush_main()
    8938a9c60d9ae s390/xor: Fix xor_xc_5() inline assembly
    1a34999922ba6 drm/amd/display: Fallback to boot snapshot for dispclk
    b9a944d0a1d3a s390/xor: Fix xor_xc_2() inline assembly constraints
    87f0349beaaca ata: libata-core: Disable LPM on ST1000DM010-2EP102
    a547ffcb9b1d5 s390/stackleak: Fix __stackleak_poison() inline assembly constraint
    d0e63feca3808 crypto: ccp - allow callers to use HV-Fixed page API when SEV is disabled
    a4d0e2c416db0 pmdomain: bcm: bcm2835-power: Fix broken reset status read
    f29b08755103f regulator: pf9453: Respect IRQ trigger settings from firmware
    4387b2cc9a630 io_uring/net: reject SEND_VECTORIZED when unsupported
    823fb431e4af8 parisc: Check kernel mapping earlier at bootup
    6f92a7a8b48a5 arm64: contpte: fix set_access_flags() no-op check for SMMU/ATS faults
    396dec23e9024 parisc: Fix initial page table creation for boot
    857473efe9341 io_uring/zcrx: use READ_ONCE with user shared RQEs
    73a7a34581694 hwmon: (pmbus/q54sj108a2) fix stack overflow in debugfs read
    439b5fb7280a3 arm64: mm: Add PTE_DIRTY back to PAGE_KERNEL* to fix kexec/hibernation
    ad8fa5bff53f5 nouveau/dpcd: return EBUSY for aux xfer if the device is asleep
    6e6e28898e015 parisc: Increase initial mapping to 64 MB with KALLSYMS
    5737b279a28b6 pmdomain: rockchip: Fix PD_VCODEC for RK3588
    e9b0a6ffe8b95 drm/xe/xe2_hpg: Correct implementation of Wa_16025250150
    2ab9f2531d377 batman-adv: Avoid double-rtnl_lock ELP metric worker
    a269cbdc442f8 net/tcp-ao: Fix MAC comparison to be constant-time
    12db29803c19e tracing: Fix syscall events activation by ensuring refcount hits zero
    f6e7c4f406b68 ice: fix retry for AQ command 0x06EE
    678d5802556b3 net: mana: Ring doorbell at 4 CQ wraparounds
    8bde543d2a5f9 media: dvb-net: fix OOB access in ULE extension header tables
    9e16152a7e337 selftests: fix mntns iteration selftests
    ace46763b282d pinctrl: cy8c95x0: Don't miss reading the last bank registers
    4dd2d9cf563c5 staging: rtl8723bs: fix potential out-of-bounds read in rtw_restruct_wmm_ie
    6d62fa548387e staging: rtl8723bs: properly validate the data in rtw_get_ie_ex()
    ea535b9894d77 staging: sm750fb: add missing pci_release_region on error and removal
    6b9cb42cfdb36 mm/slab: fix an incorrect check in obj_exts_alloc_size()
    ce0aa47c963b8 mm/damon/core: clear walk_control on inactive context in damos_walk()
    7c19757394ddf ixgbevf: fix link setup issue
    216176bcfd2bd kunit: irq: Ensure timer doesn't fire too frequently
    decd9942655db ice: reintroduce retry mechanism for indirect AQ
    ca19f8f51064f iomap: reject delalloc mappings during writeback
    7bdf00ed75c47 btrfs: fix chunk map leak in btrfs_map_block() after btrfs_chunk_map_num_copies()
    f42b4afdd1f89 irqchip/gic-v3-its: Limit number of per-device MSIs to the range the ITS supports
    32752c3e81498 device property: Allow secondary lookup in fwnode_get_next_child_node()
    019debe5851d7 nfsd: Fix cred ref leak in nfsd_nl_listener_set_doit().
    db377ed4ecca4 arm64: gcs: Honour mprotect(PROT_NONE) on shadow stack mappings
    584926c26f0b7 bpf: Fix kprobe_multi cookies access in show_fdinfo callback
    415aed08de0ee s390/pfault: Fix virtual vs physical address confusion
    af65cd1853599 drm/xe/sync: Cleanup partially initialized sync on parse failure
    58e6e3d39c286 ipmi:si: Fix check for a misbehaving BMC
    19e1931841e44 gpiolib: normalize the return value of gc->get() on behalf of buggy drivers
    32cca65189823 drm/i915/alpm: ALPM disable fixes
    214b6bde0e941 nouveau/gsp: drop WARN_ON in ACPI probes
    9b7855110fd75 ipmi:si: Handle waiting messages when BMC failure detected
    bc001cd1a4824 drm/bridge: ti-sn65dsi86: Enable HPD polling if IRQ is not used
    e6d779654cda6 drm/bridge: samsung-dsim: Fix memory leak in error path
    1df500f363bc8 ipmi:si: Use a long timeout when the BMC is misbehaving
    68d7fcb6a451c ipmi:si: Don't block module unload if the BMC is messed up
    06ef2ba582c68 drm/amd: Disable MES LR compute W/A
    b1d10508da559 drm/amdgpu: add upper bound check on user inputs in wait ioctl
    762f47e2b8243 drm/amdgpu/userq: Fix reference leak in amdgpu_userq_wait_ioctl
    6fff5204d8aa2 drm/amdgpu: add upper bound check on user inputs in signal ioctl
    6bfda7ce56e7d cpufreq: intel_pstate: Fix NULL pointer dereference in update_cpu_qos_request()
    4729c7b00a347 kthread: consolidate kthread exit paths to prevent use-after-free
    8a259a5c70ddc Revert "ptdesc: remove references to folios from __pagetable_ctor() and pagetable_dtor()"
    ae931283b2f37 Revert "tcpm: allow looking for role_sw device in the main node"
    21a13db8d449b scsi: hisi_sas: Fix NULL pointer exception during user_scan()
    b17211b512cbf scsi: ufs: core: Fix SError in ufshcd_rtc_work() during UFS suspend
    98074e16742ae powerpc, perf: Check that current->mm is alive before getting user callchain
    9e84113ea6ec2 i3c: dw-i3c-master: Set SIR_REJECT in DAT on device attach and reattach
    2d845604ca4fb time/jiffies: Mark jiffies_64_to_clock_t() notrace
    2e8e9aea8cd5a ALSA: usb-audio: Improve Focusrite sample rate filtering
    097cd68f46686 ceph: fix memory leaks in ceph_mdsc_build_path()
    7335e21830b8d ceph: do not skip the first folio of the next object in writeback
    7db008e85a5d1 ceph: fix i_nlink underrun during async unlink
    bdf614c81081b libceph: admit message frames only in CEPH_CON_S_OPEN state
    ba0a4df8c5635 libceph: Use u32 for non-negative values in ceph_monmap_decode()
    69fe5af33fa38 libceph: prevent potential out-of-bounds reads in process_message_header()
    fc4d944dbaee9 libceph: reject preamble if control segment is empty
    f9da5c1bbac5c libceph: Fix potential out-of-bounds access in ceph_handle_auth_reply()
    8be8911f59081 ceph: add a bunch of missing ceph_path_info initializers
    cae928e3178c7 kprobes: avoid crash when rmmod/insmod after ftrace killed
    2754e7b3d6474 tipc: fix divide-by-zero in tipc_sk_filter_connect()
    22b05abb17e3c ASoC: qcom: qdsp6: Fix q6apm remove ordering during ADSP stop and start
    0e06cc511c61c mmc: core: Avoid bitfield RMW for claim/retune flags
    45785772d538b mm/kfence: disable KFENCE upon KASAN HW tags enablement
    24743b77cae33 mmc: mmci: Fix device_node reference leak in of_get_dml_pipe_index()
    63826cf084468 mm/kfence: fix KASAN hardware tag faults during late enablement
    6dc0919dc7820 mm/tracing: rss_stat: ensure curr is false from kthread context
    e584cb58a2ea7 usb: gadget: f_ncm: Fix net_device lifecycle with device_move
    ef7d456d1e887 Revert "usb: gadget: u_ether: add gether_opts for config caching"
    05dc0c098ca11 Revert "usb: gadget: f_ncm: align net_device lifecycle with bind/unbind"
    d2a08ea03830b Revert "usb: gadget: u_ether: Add auto-cleanup helper for freeing net_device"
    56cb551d2a33d Revert "usb: legacy: ncm: Fix NPE in gncm_bind"
    8a607bae3a0a4 Revert "usb: gadget: f_ncm: Fix atomic context locking issue"
    be5738d19bed2 usb: legacy: ncm: Fix NPE in gncm_bind
    e533a44fb1b33 usb: gadget: f_ncm: Fix atomic context locking issue
    679d9535aeb15 usb: gadget: f_tcm: Fix NULL pointer dereferences in nexus handling
    b7fed917f84e4 usb: image: mdc800: kill download URB on timeout
    513041c71356d usb: gadget: uvc: fix interval_duration calculation
    4cc30a5fc8832 usb: mdc800: handle signal and read racing
    c0b28a042174c usb: gadget: f_hid: fix SuperSpeed descriptors
    0b7d11fd6e742 usb: renesas_usbhs: fix use-after-free in ISR during device removal
    67ed312124bb1 usb: class: cdc-wdm: fix reordering issue in read code path
    64f3d75633aed USB: core: Limit the length of unkillable synchronous timeouts
    6cb7dc91f057d USB: usbtmc: Use usb_bulk_msg_killable() with user-specified timeouts
    f7e115af48745 USB: usbcore: Introduce usb_bulk_msg_killable()
    ac207d57bbb06 usb: typec: altmode/displayport: set displayport signaling rate in configure message
    8c9521a5877e5 usb: roles: get usb role switch from parent only for usb-b-connector
    9459b5731cd8b usb: cdc-acm: Restore CAP_BRK functionnality to CH343
    82f7b4350b9d9 usb: core: don't power off roothub PHYs if phy_set_mode() fails
    1a99da68a5a9c usb: misc: uss720: properly clean up reference in uss720_probe()
    69f090f5e7298 usb: dwc3: pci: add support for the Intel Nova Lake -H
    a41d3d9202e95 usb: yurex: fix race in probe
    cd41e0d1df8fc usb: xhci: Prevent interrupt storm on host controller error (HCE)
    c65f1b840ab8c usb: xhci: Fix memory leak in xhci_disable_slot()
    8043f1c3c89dd USB: ezcap401 needs USB_QUIRK_NO_BOS to function on 10gbs usb speed
    ba3b951b7f7ae usb/core/quirks: Add Huawei ME906S-device to wakeup quirk
    e2554ffa8c252 USB: add QUIRK_NO_BOS for video capture several devices
    213e82ccdea58 KVM: arm64: pkvm: Fallback to level-3 mapping on host stage-2 fault
    c513bbd7da534 KVM: SVM: Initialize AVIC VMCB fields if AVIC is enabled with in-kernel APIC
    b058c30cdf7d5 KVM: x86: Introduce KVM_X86_QUIRK_VMCS12_ALLOW_FREEZE_IN_SMM
    686c8f16112c8 KVM: arm64: Fix protected mode handling of pages larger than 4kB
    e0f582406c3e4 ASoC: amd: yc: Add DMI quirk for ASUS EXPERTBOOK PM1503CDA
    08da6c7ed70f0 ata: libata-core: Add BRIDGE_OK quirk for QEMU drives
    f90768ed813bf rust: str: make NullTerminatedFormatter public
    887098159d705 rust: kbuild: allow `unused_features`
    dd109e3442817 rust_binder: call set_notification_done() without proc lock
    e19afb53f7723 rust_binder: avoid reading the written value in offsets array
    20a01f20d1f40 rust_binder: check ownership before using vma
    edf685946c4ac rust_binder: fix oneway spam detection
    3e89ddbaaea2f net: usb: lan78xx: skip LTM configuration for LAN7850
    20ce2bd1c1848 net: usb: lan78xx: fix WARN in __netif_napi_del_locked on disconnect
    f62ec1babb2ae net: usb: lan78xx: fix TX byte statistics for small packets
    fa41007be691b net: usb: lan78xx: fix silent drop of packets with checksum errors
    00293f362712b can: gs_usb: gs_can_open(): always configure bitrates before starting device
    3d542cf3c4c85 ALSA: usb-audio: Check endpoint numbers at parsing Scarlett2 mixer interfaces
    4a758e9a1f5ed ALSA: pcm: fix use-after-free on linked stream runtime in snd_pcm_drain()
    6eaaa67d6998f sched_ext: Remove redundant css_put() in scx_cgroup_init()
    86ceaccfdfa16 cgroup: fix race between task migration and iteration
    1051eb2f53886 drm/amdgpu: ensure no_hw_access is visible before MMIO
    3428dc5520c81 usb: gadget: f_mass_storage: Fix potential integer overflow in check_command_size_in_blocks()
    678f1212f77bf iio: imu: inv-mpu9150: fix irq ack preventing irq storms
    86f00a9e50b4a net: prevent NULL deref in ip[6]tunnel_xmit()
    7065d73a78ba7 octeontx2-af: devlink: fix NIX RAS reporter to use RAS interrupt status
    c9d6bf8d139a9 octeontx2-af: devlink: fix NIX RAS reporter recovery condition
    8ded073fc8cdc net: ethernet: ti: am65-cpsw-nuss: Fix rx_filter value for PTP support
    c1d06ccbee468 net: ti: am65-cpsw: move hw timestamping to ndo callback
    59489ce60d741 net/mana: Null service_wq on setup error to prevent double destroy
    103e4fedb4784 neighbour: restore protocol != 0 check in pneigh update
    f7f12d551d611 net: dsa: realtek: Fix LED group port bit for non-zero LED group
    95faa1459b83f net: bonding: Fix nd_tbl NULL dereference when IPv6 is disabled
    84c1adb60fdba perf synthetic-events: Fix stale build ID in module MMAP2 records
    529c985da1b27 drm/amdkfd: Unreserve bo if queue update failed
    b3b56d60fee16 ASoC: detect empty DMI strings
    790851ecc983c ASoC: amd: acp3x-rt5682-max9836: Add missing error check for clock acquisition
    9a3106a81fc3c ACPI: OSL: fix __iomem type on return from acpi_os_map_generic_address()
    e987bc1d2e8d4 net: bcmgenet: fix broken EEE by converting to phylib-managed state
    53480725b1395 page_pool: store detach_time as ktime_t to avoid false-negatives
    30e87ade8d678 e1000/e1000e: Fix leak in DMA error cleanup
    981e2805e48fc i40e: fix src IP mask checks and memcpy argument names in cloud filter
    75e0a631c3a13 iavf: fix incorrect reset handling in callbacks
    1b034f2429ce6 iavf: fix PTP use-after-free during reset
    98b36857f3584 drivers: net: ice: fix devlink parameters get without irdma
    b56c49897bdac nvme-pci: Fix race bug in nvme_poll_irqdisable()
    328c551f0cc81 nvme-pci: Fix slab-out-of-bounds in nvme_dbbuf_set
    3cf2d7ca48289 sched: idle: Make skipping governor callbacks more consistent
    a422159d766ad perf ftrace: Fix hashmap__new() error checking
    f7e52a24e5b76 regulator: pca9450: Correct probed name for PCA9452
    55ca06f54f57f regulator: pca9450: Add support for setting debounce settings
    ec1427731244d regulator: pca9450: Correct interrupt type
    0b6803777c003 perf annotate: Fix hashmap__new() error checking
    f5ef97c131655 netfilter: xt_IDLETIMER: reject rev0 reuse of ALARM timer labels
    05018cd9370f7 netfilter: nfnetlink_cthelper: fix OOB read in nfnl_cthelper_dump_table()
    9853d94b82d30 netfilter: nfnetlink_queue: fix entry leak in bridge verdict error path
    bc18551c6169e netfilter: x_tables: guard option walkers against 1-byte tail reads
    e047f6fbb975f netfilter: nft_set_pipapo: fix stack out-of-bounds read in pipapo_drop()
    de47a88c6b807 netfilter: nf_tables: always walk all pending catchall elements
    6d2a95c689057 netfilter: nf_tables: Fix for duplicate device in netdev hooks
    8a57deeb25606 net: add xmit recursion limit to tunnel xmit functions
    f0679522f8ded amd-xgbe: prevent CRC errors during RX adaptation with AN disabled
    cf51e5853398e amd-xgbe: fix link status handling in xgbe_rx_adaptation
    925a5ffd99cdd mctp: route: hold key->lock in mctp_flow_prepare_output()
    6ac890f1d60ac bonding: fix type confusion in bond_setup_by_slave()
    474211fb4a1df bonding: use common function to compute the features
    3c5de399a4427 can: hi311x: hi3110_open(): add check for hi3110_power_enable() return value
    1ec54187e1aa4 mctp: i2c: fix skb memory leak in receive path
    569e6e72c4578 bnxt_en: Fix RSS table size check when changing ethtool channels
    35b58d3bc716e serial: caif: hold tty->link reference in ldisc_open and ser_release
    ecb4ed7a723f0 net: sfp: improve Huawei MA5671a fixup
    ce0b8fd5e3554 ASoC: simple-card-utils: fix graph_util_is_ports0() for DT overlays
    7d33e61409454 ASoC: soc-core: flush delayed work before removing DAIs and widgets
    a4aa08c820f4f ASoC: soc-core: drop delayed_work_pending() check before flush
    b6051f2bdd4bd spi: rockchip-sfc: Fix double-free in remove() callback
    0a83d6c9e149a spi: amlogic: spifc-a4: Fix DMA mapping error handling
    fc7735caf016a drm/sitronix/st7586: fix bad pixel data due to byte swap
    c34ebd7b24ea7 net: spacemit: Fix error handling in emac_tx_mem_map()
    045545790fea7 net: spacemit: Fix error handling in emac_alloc_rx_desc_buffers()
    d55fa7cd4b19b rxrpc, afs: Fix missing error pointer check after rxrpc_kernel_lookup_peer()
    0bad9c86edd22 net/sched: teql: fix NULL pointer dereference in iptunnel_xmit on TEQL slave xmit
    c74557495efb4 net/mlx5e: RX, Fix XDP multi-buf frag counting for legacy RQ
    7d7342a18fadc net/mlx5e: RX, Fix XDP multi-buf frag counting for striding RQ
    ce1b19dd0684e net/mlx5e: Fix DMA FIFO desync on error CQE SQ recovery
    cbd8494fdd6cc net/mlx5: Fix peer miss rules host disabled checks
    835778685f157 net/mlx5: Fix crash when moving to switchdev mode
    4a7838bebc383 net/mlx5: Fix deadlock between devlink lock and esw->wq
    6aaf15f376b0e bonding: handle BOND_LINK_FAIL, BOND_LINK_BACK as valid link states
    ab1bcadc7e517 bonding: do not set usable_slaves for broadcast mode
    2ee3645e0f3f4 drm/amd/pm: add missing od setting PP_OD_FEATURE_ZERO_FAN_BIT for smu v14
    4c32155265b67 drm/amd/pm: add missing od setting PP_OD_FEATURE_ZERO_FAN_BIT for smu v13
    6b4a1ff808851 drm/msm/dsi: fix pclk rate calculation for bonded dsi
    5f5d956b2ce00 net: dsa: realtek: rtl8365mb: remove ifOutDiscards from rx_packets
    98754dda67296 dt-bindings: display/msm: qcom,sm8750-mdss: Fix model typo
    676826aeddb57 perf disasm: Fix off-by-one bug in outside check
    ce69c1b753746 workqueue: Use POOL_BH instead of WQ_BH when checking pool flags
    a39b75c3f4226 btrfs: hold space_info->lock when clearing periodic reclaim ready
    8127b5fec0475 xprtrdma: Decrement re_receiving on the early exit paths
    2871bb923ff8f drm/msm/dsi: fix hdisplay calculation when programming dsi registers
    203c792cb4315 nfs: return EISDIR on nfs3_proc_create if d_alias is a dir
    28a72f653832a smb/server: Fix another refcount leak in smb2_open()
    f426a493db33d powerpc: 83xx: km83xx: Fix keymile vendor prefix
    ba021fb575084 remoteproc: mediatek: Unprepare SCP clock during system suspend
    bf39fed5f22cb remoteproc: sysmon: Correct subsys_name_len type in QMI request
    b7b634be76582 powerpc/crash: adjust the elfcorehdr size
    c171a5f799546 powerpc/kexec/core: use big-endian types for crash variables
    d5697cf3b91d8 kexec: Include kernel-end even without crashkernel
    b3c074a394c66 powerpc/uaccess: Fix inline assembly for clang build on PPC32
    71c57e74baa06 ALSA: usb-audio: Check max frame size for implicit feedback mode, too
    31e6595fd1a05 drm/amdgpu/vcn5: Add SMU dpm interface type
    716fc40446912 ALSA: usb-audio: Avoid implicit feedback mode on DIYINHK USB Audio 2.0
    5faf0ce7d784a scsi: ufs: core: Fix shift out of bounds when MAXQ=32
    f4f590c6c9df7 scsi: ufs: core: Fix possible NULL pointer dereference in ufshcd_add_command_trace()
    87aa0f91ee49e ASoC: cs42l43: Report insert for exotic peripherals
    c072370ad67dd ASoC: amd: yc: Add ASUS EXPERTBOOK BM1503CDA to quirk table
    7035ef0f20bab scsi: ses: Fix devices attaching to different hosts
    8c61a746f7bb8 ACPI: OSI: Add DMI quirk for Acer Aspire One D255
    e03d7bddf0ecc wifi: mac80211: set default WMM parameters on all links
    af8f4be3b68ac unshare: fix unshare_fs() handling
    6407e8baef0ac ALSA: hda/realtek: Fix speaker pop on Star Labs StarFighter
    e978a36f332ed scsi: mpi3mr: Add NULL checks when resetting request and reply queues
    379e19e820dd1 fs: init flags_valid before calling vfs_fileattr_get
    22e54d67b2f57 scsi: ufs: core: Reset urgent_bkops_lvl to allow runtime PM power mode
    55d1e86cb0c90 ACPI: PM: Save NVS memory on Lenovo G70-35
    c2e73d8acd056 scsi: storvsc: Fix scheduling while atomic on PREEMPT_RT
    3318f10fa2898 Linux 6.18.18
    6c5e8f16b5e8e ata: libata: cancel pending work after clearing deferred_qc
    13bc2772414d6 apparmor: fix race between freeing data and fs accessing it
    af782cc8871e3 apparmor: fix race on rawdata dereference
    623a9d211bbbb apparmor: fix differential encoding verification
    b60b3f7a35c46 apparmor: fix unprivileged local user can do privileged policy management
    7998ab3010d23 apparmor: Fix double free of ns_name in aa_replace_profiles()
    5a68e46dfe0c8 apparmor: fix missing bounds check on DEFAULT table in verify_dfa()
    0510d1ba0976f apparmor: fix side-effect bug in match_char() macro usage
    d42b2b6bb77ca apparmor: fix: limit the number of levels of policy namespaces
    7eade846e013c apparmor: replace recursive profile removal with iterative approach
    4f0889f2df1ab apparmor: fix memory leak in verify_header
    0baadb0eece2c apparmor: validate DFA start states are in bounds in unpack_pdb
    380ad8b7c65ea net/sched: Only allow act_ct to bind to clsact/ingress qdiscs and shared blocks
    04d75529dc0f9 net/sched: act_gate: snapshot parameters with RCU on replace
    93ea7e1363fb2 Linux 6.18.17
    8a185304e42e0 selftests/bpf: Avoid simplification of crafted bounds test
    63b548c862996 bpf: collect only live registers in linked regs
    2ce8ece5a78da tracing: Add NULL pointer check to trigger_data_free()
    52decf013d533 selftest/arm64: Fix sve2p1_sigill() to hwcap test
    d15ba004b3214 ata: libata-eh: Fix detection of deferred qc timeouts
    98cd8b4d0b836 xdp: produce a warning when calculated tailroom is negative
    45a41aecf5e54 net: enetc: use truesize as XDP RxQ info frag_size
    f1ac9d19721bd i40e: use xdp.frame_sz as XDP RxQ info frag_size
    b6176646c36d2 i40e: fix registering XDP RxQ info
    ff7f356cdbb47 xsk: introduce helper to determine rxq->frag_size
    2a9e6ecf0e858 xdp: use modulo operation to calculate XDP frag tailroom
    cd888c3966672 net/sched: act_ife: Fix metalist update behavior
    b3b5a037d520a net: ipv6: fix panic when IPv4 route references loopback IPv6 nexthop
    fbbd2118982c5 net: vxlan: fix nd_tbl NULL dereference when IPv6 is disabled
    33dec6f10777d net: bridge: fix nd_tbl NULL dereference when IPv6 is disabled
    d3b1c4c70da56 selftests/harness: order TEST_F and XFAIL_ADD constructors
    0168443a5db5b kselftest/harness: Use helper to avoid zero-size memset warning
    6f95b59520278 net: ethernet: mtk_eth_soc: Reset prog ptr to old_prog in case of error in mtk_xdp_setup()
    500a50a301ce9 netfilter: nft_set_pipapo: split gc into unlink and reclaim phase
    9154945a63940 netfilter: nf_tables: clone set on flush only
    6826131c76743 netfilter: nf_tables: unconditionally bump set->nelems before insertion
    6624d1727f3a5 net: Provide a PREEMPT_RT specific check for netdev_queue::_xmit_lock
    c3e8c75fcb2ef block: use trylock to avoid lockdep circular dependency in sysfs
    6b0e35123ba45 net: stmmac: Defer VLAN HW configuration when interface is down
    15e8ef3368955 net: stmmac: Fix VLAN HW state restore
    8b8b97eaecae7 net: stmmac: Improve double VLAN handling
    d55a39435c20b net: stmmac: Fix error handling in VLAN add and delete paths
    edc988613def9 nfc: rawsock: cancel tx_work before socket teardown
    b3fdbc7f59cdf nfc: nci: clear NCI_DATA_EXCHANGE before calling completion callback
    91ff0d8c3464d nfc: nci: complete pending data exchange on device close
    9d448bbab724b nfc: nci: free skb on nci_transceive early error paths
    a77a5423e9c63 net: devmem: use READ_ONCE/WRITE_ONCE on binding->dev
    4596f44d4f5b9 net_sched: sch_fq: clear q->band_pkt_count[] in fq_reset()
    1c46edf20f82e net: nfc: nci: Fix zero-length proprietary notifications
    eae2f14ab2efc tcp: secure_seq: add back ports to TS offset
    8314944cc3bde net: sched: avoid qdisc_reset_all_tx_gt() vs dequeue race for lockless qdiscs
    d9d4ed40b3be3 hwmon: (max6639) fix inverted polarity
    de4ea10ae6b42 timekeeping: Fix timex status validation for auxiliary clocks
    5a501379a0106 nvme: fix memory allocation in nvme_pr_read_keys()
    76f327fa4f1b7 nvme: reject invalid pr_read_keys() num_keys values
    05e3f01974d09 drm/xe/reg_sr: Fix leak on xa_store failure
    3c8852cff2bb8 drm/xe/gsc: Fix GSC proxy cleanup on early initialization failure
    1c72e7b0b442c i2c: i801: Revert "i2c: i801: replace acpi_lock with I2C bus lock"
    da09dfc90cb7e drm/sched: Fix kernel-doc warning for drm_sched_job_done()
    5649775b3ebf2 amd-xgbe: fix sleep while atomic on suspend/resume
    7e4ad34a8889a net: ipv4: fix ARM64 alignment fault in multipath hash seed
    0b5a782602070 ipv6: fix NULL pointer deref in ip6_rt_get_dev_rcu()
    5566a9eeb00e5 smb/client: fix buffer size for smb311_posix_qinfo in SMB311_posix_query_info()
    b751369b03c8a smb/client: fix buffer size for smb311_posix_qinfo in smb2_compound_op()
    3eeddb80191f7 bpf: Fix a UAF issue in bpf_trampoline_link_cgroup_shim
    ba47e33717642 igb: Fix trigger of incorrect irq in igb_xsk_wakeup
    2199e190cf6bb iavf: fix netdev->max_mtu to respect actual hardware limit
    0138d1cdb19fa libie: don't unroll if fwlog isn't supported
    b9333d41ee03a ice: fix adding AQ LLDP filter for VF
    1e077c65e0202 xen/acpi-processor: fix _CST detection using undersized evaluation buffer
    6ce948fa54599 net/rds: Fix circular locking dependency in rds_tcp_tune
    ca795bf1230b6 indirect_call_wrapper: do not reevaluate function pointer
    9612d91f61723 wifi: mt76: Fix possible oob access in mt76_connac2_mac_write_txwi_80211()
    2831a8c574545 wifi: mt76: mt7925: Fix possible oob access in mt7925_mac_write_txwi_80211()
    f4cdf6b43689e wifi: mt76: mt7996: Fix possible oob access in mt7996_mac_write_txwi_80211()
    fcef983ad8883 wifi: wlcore: Fix a locking bug
    f98c195052ab8 wifi: cw1200: Fix locking in error paths
    93e00a88951d6 octeon_ep_vf: avoid compiler and IQ/OQ reordering
    04a9f26d63d95 octeon_ep_vf: Relocate counter updates before NAPI
    986904ab1613f octeon_ep: avoid compiler and IQ/OQ reordering
    142a789a51d5f octeon_ep: Relocate counter updates before NAPI
    0ace8027e41f6 bpf/bonding: reject vlan+srcmac xmit_hash_policy change when XDP is loaded
    d95de5acbf9ed net: dsa: realtek: rtl8365mb: fix rtl8365mb_phy_ocp_write return value
    01f5b85fa0daa kunit: tool: copy caller args in run_kernel to prevent mutation
    3589cc8f56c12 rust: kunit: fix warning when !CONFIG_PRINTK
    7f971dfd48983 drm/xe/configfs: Free ctx_restore_mid_bb in release
    303b446f2e8f9 drm/xe: Do not preempt fence signaling CS instructions
    7196a1ff7b9a2 drm/syncobj: Fix handle <-> fd ioctls with dirty stack
    95ed07644b2c6 wifi: rsi: Don't default to -EOPNOTSUPP in rsi_mac80211_config
    d27f12c3f5e85 can: mcp251x: fix deadlock in error path of mcp251x_open
    8215ba7bc99e8 can: bcm: fix locking for bcm_op runtime updates
    d8e38dc605c1a amd-xgbe: fix MAC_TCR_SS register width for 2.5G and 10M speeds
    d5947c3d2d14c net: ti: icssg-prueth: Fix ping failure after offload mode setup when link speed is not 1G
    7ea92ab075d80 atm: lec: fix null-ptr-deref in lec_arp_clear_vccs
    00f42ace446f1 dpaa2-switch: Fix interrupt storm after receiving bad if_id in IRQ handler
    6a674e0b19b0e xsk: Fix zero-copy AF_XDP fragment drop
    645c6d8376ad4 xsk: Fix fragment node deletion to prevent buffer leak
    2fc623e178545 tcp: give up on stronger sk_rcvbuf checks (for now)
    b955350778b87 udp: Unhash auto-bound connected sk from 4-tuple hash table when disconnected.
    f5fc6fead2775 inet: annotate data-races around isk->inet_num
    3d8f35e182c80 nvme-multipath: fix leak on try_module_get failure
    79cc5a4c311f6 net: ethernet: ti: am65-cpsw-nuss/cpsw-ale: Fix multicast entry handling in ALE table
    f17c1c4acbe2b net: annotate data-races around sk->sk_{data_ready,write_space}
    f30b95159a53e nvmet-fcloop: Check remoteport port_state before calling done callback
    72d08d2839649 netfs: Fix unbuffered/DIO writes to dispatch subrequests in strict sequence
    54b3701901afc drm/solomon: Fix page start when updating rectangle in page addressing mode
    ee8e4b7469b47 e1000e: clear DPG_EN after reset to avoid autonomous power-gating
    9e0f091821571 i40e: Fix preempt count leak in napi poll tracepoint
    e9669c2d0535f ice: recap the VSI and QoS info after rebuild
    4458f9f198f5e idpf: Fix flow rule delete failure due to invalid validation
    e7fca8b7fb6fa idpf: change IRQ naming to match netdev and ethtool queue numbering
    8f742f495ddbd idpf: increment completion queue next_to_clean in sw marker wait routine
    d146275655bbd hwmon: (it87) Check the it87_lock() return value
    ea07fcfbba430 pinctrl: cirrus: cs42l43: Fix double-put in cs42l43_pin_probe()
    acbcfe2f8e646 pinctrl: meson: amlogic-a4: Fix device node reference leak in aml_dt_node_to_map_pinmux()
    6359d2d52c95f pinctrl: generic: move function to amlogic-am4 driver
    2c091292ca421 HID: multitouch: new class MT_CLS_EGALAX_P80H84
    ade03840f829d module: Remove duplicate freeing of lockdep classes
    55aefe1647a6a platform/x86: thinkpad_acpi: Fix errors reading battery thresholds
    82f1bb0ad480f pinctrl: qcom: qcs615: Add missing dual edge GPIO IRQ errata flag
    53eba152810ef pinctrl: equilibrium: fix warning trace on load
    2c947684bdaaa pinctrl: equilibrium: rename irq_chip function callbacks
    9833ed224aad8 hwmon: (aht10) Fix initialization commands for AHT20
    9c1984180260b hwmon: (aht10) Add support for dht20
    e159eb852aeee nvme: fix admin queue leak on controller reset
    0381584929791 drm/amd/display: Use GFP_ATOMIC in dc_create_stream_for_sink
    a5c070aaf796f Bluetooth: Fix CIS host feature condition
    d8a286503553d net: stmmac: remove support for lpi_intr_o
    999ff1af649cb platform/x86: hp-bioscfg: Support allocations of larger data
    0c578e8065c4b ksmbd: call ksmbd_vfs_kern_path_end_removing() on some error paths
    c08ec55617cb9 ipmi: Fix use-after-free and list corruption on sender error
    3c3462e9ae354 ASoC: fsl_xcvr: provide regmap names
    227eb258c2cbe ASoC: fsl_xcvr: use dev_err_probe() replacing dev_err() + return
    3d46af0f8b288 ARM: clean up the memset64() C wrapper
    54e841a036064 Revert "netfilter: nft_set_rbtree: validate open interval overlap"
    861aa1be41bc1 kbuild: Split .modinfo out from ELF_DETAILS
    bc2110c101281 selftests: mptcp: join: check removing signal+subflow endp
    23ec7f54a9d68 selftests: mptcp: join: check RM_ADDR not sent over same subflow
    ee6ce81a24a41 selftests: mptcp: more stable simult_flows tests
    a64aa7db39392 mptcp: pm: in-kernel: always mark signal+subflow endp as used
    19a258d03d086 mptcp: pm: avoid sending RM_ADDR over same subflow
    944a333c8e4d4 scsi: core: Fix refcount leak for tagset_refcnt
    86163b98891aa smb: client: fix oops due to uninitialised var in smb2_unlink()
    2ef0fc3bf49db smb: client: Don't log plaintext credentials in cifs_set_cifscreds
    134596a6e4be9 smb: client: fix broken multichannel with krb5+signing
    0786f9422cbf7 smb: client: fix cifs_pick_channel when channels are equally loaded
    5a34959a2ab18 xfs: Fix error pointer dereference
    b135cd653d1b8 xfs: fix xfs_group release bug in xfs_dax_notify_dev_failure
    4e8935053ba38 drbd: fix null-pointer dereference on local read error
    d1ef3aed4df2e drbd: fix "LOGIC BUG" in drbd_al_begin_io_nonblock()
    01ee0bcc29864 Squashfs: check metadata block offset is within range
    0524ee56af2c9 mm: thp: deny THP for files on anonymous inodes
    9a5641024fbfd scsi: target: Fix recursive locking in __configfs_open_file()
    cdd96641b6429 tracing: Fix WARN_ON in tracing_buffers_mmap_close
    27c13c5bb0948 nfsd: Fix cred ref leak in nfsd_nl_threads_set_doit().
    a6677e23b313c net/sched: ets: fix divide by zero in the offload path
    ca1684dd297bf arm64: gcs: Do not set PTE_SHARED on GCS mappings if FEAT_LPA2 is enabled
    a1850e2aef4d1 cpufreq: intel_pstate: Fix crash during turbo disable
    a6f3e0fa8e862 RDMA/ionic: Fix kernel stack leak in ionic_create_cq()
    cfe962216c164 RDMA/irdma: Fix kernel stack leak in irdma_create_user_ah()
    deee46b37ebd8 IB/mthca: Add missed mthca_unmap_user_db() for mthca_create_srq()
    2764dcb3c35de net: phy: register phy led_triggers during probe to avoid AB-BA deadlock
    07e0c80e17ef7 gve: fix incorrect buffer cleanup in gve_tx_clean_pending_packets for QPL
    2b6c942a52663 Bluetooth: purge error queues in socket destructors
    cc6d5a3c0a854 wifi: mac80211: fix NULL pointer dereference in mesh_rx_csa_frame()
    f35ceec54d48e wifi: mac80211: bounds-check link_id in ieee80211_ml_reconfiguration
    584279ad9ff1e wifi: cfg80211: cancel rfkill_block work in wiphy_unregister()
    ed7d30f90b77f wifi: libertas: fix use-after-free in lbs_free_adapter()
    2f8ceeba67061 wifi: radiotap: reject radiotap with unknown bits
    bf21bfd63e013 ALSA: hda/realtek: add quirk for Samsung Galaxy Book Flex (NT950QCT-A38A)
    36facbc94803c ALSA: hda/realtek: Add quirk for Acer Aspire V3-572G
    7eb2d1ce7b451 ALSA: hda/realtek: fix model name typo for Samsung Galaxy Book Flex (NT950QCG-X716)
    27338f3360ef1 ALSA: hda/intel: increase default bdl_pos_adj for Nvidia controllers
    1e5753ff4c2e8 ALSA: usb-audio: Use correct version for UAC3 header validation
    be7e624f24df8 ALSA: doc: usb-audio: Add doc for QUIRK_FLAG_SKIP_IFACE_SETUP
    8d70dff4a2e27 ALSA: hda/realtek: Add quirk for HP Pavilion 15-eh1xxx to enable mute LED
    5f935f1331071 platform/x86: dell-wmi: Add audio/mic mute key codes
    bf84193d91305 platform/x86: alienware-wmi-wmax: Add G-Mode support to m18 laptops
    5de34126fb2ed platform/x86: dell-wmi-sysman: Don't hex dump plaintext password data
    c42a92d685c4c x86/boot/sev: Move SEV decompressor variables into the .data section
    a586788a669b6 x86/sev: Allow IBPB-on-Entry feature for SNP guests
    c7258d2010e6d x86/boot: Handle relative CONFIG_EFI_SBAT_FILE file paths
    87aeec43ccb92 perf/x86/intel/uncore: Add per-scheduler IMC CAS count events
    f9e9cc320854a x86/efi: defer freeing of boot services memory
    aaca71f8562fb HID: multitouch: Keep latency normal on deactivate for reactivation gesture
    d1edc027a4b0b HID: pidff: Fix condition effect bit clearing
    20864e3e41c74 HID: Add HID_CLAIMED_INPUT guards in raw_event callbacks missing them
    b9a6064179994 can: usb: f81604: handle bulk write errors properly
    36ead57443146 can: usb: f81604: handle short interrupt urb messages properly
    18eee279e9b5b can: usb: etas_es58x: correctly anchor the urb in the read bulk callback
    aa9e0a7fe5efc can: ucan: Fix infinite loop from zero-length messages
    f6d80b104f904 can: usb: f81604: correctly anchor the urb in the read bulk callback
    1cf469026d4a2 can: ems_usb: ems_usb_read_bulk_callback(): check the proper length of a message
    c3f1672eaea68 net: usb: pegasus: validate USB endpoints
    011684cd18349 net: usb: kalmia: validate USB endpoints
    2795fc06e7652 net: usb: kaweth: validate USB endpoints
    00477cab053dc nfc: pn533: properly drop the usb interface reference on disconnect
    cfd94642025e6 media: dvb-core: fix wrong reinitialization of ringbuffer on reopen
    3acc627f235a9 namespace: fix proc mount iteration
    a80161c20370d eventpoll: Fix integer overflow in ep_loop_check_proc()
    14a1db2486fa2 net: arcnet: com20020-pci: fix support for 2.5Mbit cards
    9498fa25a0b0d drm/i915/dp: Fix pipe BPP clamping due to HDR
    99f617ea2ff01 drm/i915/dp: Fail state computation for invalid DSC source input BPP values
    b05ed70feb668 LoongArch: Remove some extern variables in source files
    079deecc2c9f5 LoongArch: Handle percpu handler address for ORC unwinder
    e7c58045ad8c2 LoongArch: Remove unnecessary checks for ORC unwinder
    e653c0718cf57 mm/slab: use prandom if !allow_spin
    d3043852fffa5 slub: remove CONFIG_SLUB_TINY specific code paths
    58aef054b2908 hwmon: (max16065) Use READ/WRITE_ONCE to avoid compiler optimization induced race
    378dff71efddd drm/amd: Fix hang on amdgpu unload by using pci_dev_is_disconnected()
    6c80b35076bcf PM: sleep: core: Avoid bit field races related to work_in_progress
    5ec1d82f00b1c btrfs: zoned: fixup last alloc pointer after extent removal for RAID0/10
    4b508c53f3c50 btrfs: define the AUTO_KFREE/AUTO_KVFREE helper macros
    d2cfea67b1b95 KVM: x86: Add x2APIC "features" to control EOI broadcast suppression
    c6db0f4a1659e PCI: dwc: ep: Fix resizable BAR support for multi-PF configurations
    7c0c4b7e84b7f PCI: dwc: Remove duplicate dw_pcie_ep_hide_ext_capability() function
    794b08c501280 PCI: dwc: Add new APIs to remove standard and extended Capability
    26f9e895616ba PCI: Add preceding capability position support in PCI_FIND_NEXT_*_CAP macros
    7d610f643b04a ARM: dts: imx53-usbarmory: Replace license text comment with SPDX identifier
    f50c91272425b ACPI: APEI: GHES: Disable KASAN instrumentation when compile testing with clang < 18
    0a654ac440c12 ACPI: APEI: GHES: Add helper for CPER CXL protocol errors checks
    baf4b13a4efc8 clk: tegra: tegra124-emc: fix device leak on set_rate()
    e5bdc2159f8b0 arm64: dts: rockchip: Fix rk3588 PCIe range mappings
    7f8f4acf39269 arm64: dts: rockchip: Fix rk356x PCIe range mappings
    e70d5feb10c5b iommu/vt-d: Skip dev-iotlb flush for inaccessible PCIe device without scalable mode
    976c7a3750f71 Input: synaptics_i2c - guard polling restart in resume
    9f5158454eaee Input: synaptics_i2c - replace use of system_wq with system_dfl_wq
    1aa5833f29b88 media: iris: Add missing platform data entries for SM8750
    448a7662ae135 media: iris: remove v4l2_m2m_ioctl_{de,en}coder_cmd API usage during STOP handling
    2698731d25823 ext4: don't set EXT4_GET_BLOCKS_CONVERT when splitting before submitting I/O
    e56d023da3794 ext4: correct the comments place for EXT4_EXT_MAY_ZEROOUT
    663efc5aac21f x86/uprobes: Fix XOL allocation failure for 32-bit tasks
    f7df71d26b308 unwind_user/x86: Teach FP unwind about start of function
    b9537a51b65af unwind_user/x86: Enable frame pointer unwinding on x86
    6f553dbbb25d6 unwind: Implement compat fp unwind
    5364f7bbd611a unwind: Simplify unwind_user_next_fp() alignment check
    c45026c4135d4 drm/tegra: dsi: fix device leak on probe
    1e88b5f854bdb KVM: x86: Ignore -EBUSY when checking nested events from vcpu_block()
    2dff8966a3a88 media: tegra-video: Fix memory leak in __tegra_channel_try_format()
    7fc4b49474c83 accel/rocket: fix unwinding in error path in rocket_probe
    17463839162f6 accel/rocket: fix unwinding in error path in rocket_core_init
    b62076e780a21 usb: gadget: f_ncm: align net_device lifecycle with bind/unbind
    ca9ca411bbcf9 usb: gadget: u_ether: Add auto-cleanup helper for freeing net_device
    f222eb16d597e usb: gadget: u_ether: add gether_opts for config caching
    7bdff9b9b0c65 net: qrtr: Drop the MHI auto_queue feature for IPCR DL channels
    ed9c15c7be25e Revert "PCI: dw-rockchip: Enumerate endpoints based on dll_link_up IRQ"
    15a66eb1b2c6c PCI: dw-rockchip: Change get_ltssm() to provide L1 Substates info
    aad472c928c97 PCI: dwc: Add L1 Substates context to ltssm_status of debugfs
    80d3a201d7add PCI: dw-rockchip: Configure L1SS support
    b1f114b7a6fac PCI: dwc: Advertise L1 PM Substates only if driver requests it
    53abc9c613613 PCI: j721e: Add config guards for Cadence Host and Endpoint library APIs
    ee7f2ce97b082 PCI: j721e: Use devm_clk_get_optional_enabled() to get and enable the clock
    f69535b77fa05 memory: mtk-smi: fix device leak on larb probe
    b44d090d6ca15 memory: mtk-smi: fix device leaks on common probe
    a67540127042c x86/acpi/boot: Correct acpi_is_processor_usable() check again
    1b99c0e5b6bd8 bpf: Improve bounds when tnum has a single possible value
    50a4fab0887ea bpf: Introduce tnum_step to step through tnum's members
    4c03342e5ac53 bpf: Add bitwise tracking for BPF_END
    6c10b019785dc bpf: Fix race in devmap on PREEMPT_RT
    7466ae2aeed48 bpf: Fix race in cpumap on PREEMPT_RT
    ecb4e02614b96 PCI: Correct PCI_CAP_EXP_ENDPOINT_SIZEOF_V2 value
    878fddc519f75 spi: stm32: fix missing pointer assignment in case of dma chaining
    130c436e71499 sched_ext: Fix SCX_EFLAG_INITIALIZED being a no-op flag
    4778033781b5b selftests/bpf: Fix OOB read in dmabuf_collector
    75d474702b2ba bpf: Fix stack-out-of-bounds write in devmap
    519b1ad91de5b bpf, arm64: Force 8-byte alignment for JIT buffer to prevent atomic tearing
    11d1d38087e72 ASoC: SDCA: Fix comments for sdca_irq_request()
    5413b1c94cfe5 ALSA: usb: qcom: Correct parameter comment for uaudio_transfer_buffer_setup()
    51c8bedb2d089 btrfs: fix compat mask in error messages in btrfs_check_features()
    771c1e38385b0 btrfs: print correct subvol num if active swapfile prevents deletion
    136e814d11766 btrfs: fix warning in scrub_verify_one_metadata()
    b178561ac38cd btrfs: fix objectid value in error message in check_extent_data_ref()
    845c0f1ab54ef btrfs: fix incorrect key offset in error message in check_dev_extent_item()
    5ba7d61b5416d btrfs: fix error message order of parameters in btrfs_delete_delayed_dir_index()
    d4f210de01eac btrfs: free pages on error in btrfs_uring_read_extent()
    c18c40e081c19 ALSA: hda: cs35l56: Fix signedness error in cs35l56_hda_posture_put()
    73e8bdf142481 drm/amdgpu: Fix error handling in slot reset
    5c42d9f8b0049 drm/amdgpu: Fix locking bugs in error paths
    39ae59e5c1d88 drm/amdgpu: Unlock a mutex before destroying it
    1753f5f81ab60 drm/amdgpu/userq: Do not allow userspace to trivially triger kernel warnings
    6f60a783860c7 PCI: dwc: ep: Flush MSI-X write before unmapping its ATU entry
    3d64dcc0799c2 arm64: io: Extract user memory type in ioremap_prot()
    835da0da68d0f arm64: io: Rename ioremap_prot() to __ioremap_prot()
    00ea0c8696b40 s390/vtime: Fix virtual timer forwarding
    d30168b0cbc13 s390/idle: Fix cpu idle exit cpu time accounting
    3f89b61dd504c perf: Fix __perf_event_overflow() vs perf_remove_from_context() race
    b9db33aafc129 ALSA: usb-audio: Use inclusive terms
    9a6693b598435 ALSA: usb-audio: Cap the packet size pre-calculations
    4e3ca5f82346c drm/client: Do not destroy NULL modes
    869c979f36574 zloop: check for spurious options passed to remove
    f6c6a888c8a41 zloop: advertise a volatile write cache
    93b64bef8cd40 regulator: bq257xx: Fix device node reference leak in bq257xx_reg_dt_parse_gpio()
    bbc104dcfc59b scsi: ufs: core: Move link recovery for hibern8 exit failure to wl_resume
    5fc4e150c5ada cxl: Fix race of nvdimm_bus object when creating nvdimm objects
    af9bf98896639 cxl: Move devm_cxl_add_nvdimm_bridge() to cxl_pmem.ko
    a29e637950631 cgroup/cpuset: Fix incorrect use of cpuset_update_tasks_cpumask() in update_cpumasks_hier()
    e540616ec3a51 drm/xe/wa: Steer RMW of MCR registers while building default LRC
    3464e75175517 accel/amdxdna: Validate command buffer payload count
    1500b31db9437 accel/amdxdna: Prevent ubuf size overflow
    247cd87f04748 accel/amdxdna: Remove buffer size check when creating command BO
    c67ab059953e3 perf/core: Fix invalid wait context in ctx_sched_in()
    9a3bcd2984b8d rseq: Clarify rseq registration rseq_size bound check comment
    22a1536b3f5ac sched/fair: Fix lag clamp
    c1591343440ef sched/eevdf: Update se->vprot in reweight_entity()
    ee54b5ba72d42 sched/fair: Only set slice protection at pick time
    99673934a89fe sched/fair: Fix zero_vruntime tracking
    423b750d87d2e sched/fair: Introduce and use the vruntime_cmp() and vruntime_op() wrappers for wrapped-signed aritmetics
    028084eca1691 sched/fair: Rename cfs_rq::avg_vruntime to ::sum_w_vruntime, and helper functions
    50890a9a01f34 sched/fair: Rename cfs_rq::avg_load to cfs_rq::sum_weight
    50b3d683dcd45 x86/cfi: Fix CFI rewrite for odd alignments
    e58f1a9b0677d x86/fred: Correct speculative safety in fred_extint()
    ddbbdebeeea80 ALSA: usb-audio: Add QUIRK_FLAG_SKIP_IFACE_SETUP
    71f72c5d74a98 ALSA: usb-audio: Remove VALIDATE_RATES quirk for Focusrite devices
    561cefafd79dc ALSA: scarlett2: Fix DSP filter control array handling
    38072446442c7 drm/imx: parallel-display: check return value of devm_drm_bridge_add() in imx_pd_probe()
    824a7672e3540 scsi: pm8001: Fix use-after-free in pm8001_queue_command()
    c3598e86c916d scsi: lpfc: Properly set WC for DPP mapping
    1883332bf21fe irqchip/sifive-plic: Fix frozen interrupt due to affinity setting
    183a6264b32e4 drm/tiny: sharp-memory: fix pointer error dereference
    cd2713a37336d drm/fourcc: fix plane order for 10/12/16-bit YCbCr formats
    bce3847f7c51b KVM: arm64: Fix ID register initialization for non-protected pKVM guests
    7a15a1e3228db KVM: arm64: Hide S1POE from guests when not supported by the host
    f8a6eba20edb9 drm/logicvc: Fix device node reference leak in logicvc_drm_config_parse()
    a473c09666f0c debugobject: Make it work with deferred page initialization - again
    531f455897877 drm/vmwgfx: Return the correct value in vmw_translate_ptr functions
    2633a30eb45bc drm/vmwgfx: Fix invalid kref_put callback in vmw_bo_dirty_release
    c27dea9f50ed5 perf/core: Fix refcount bug and potential UAF in perf_mmap
    6258e292d7463 Linux 6.18.16
    0ac822bf99024 drm/amdgpu: Refactor amdgpu_gem_va_ioctl for Handling Last Fence Update and Timeline Management v7
    f1ba620f9e8d7 most: core: fix leak on early registration failure
    c954666a07079 arm64: Fix sampling the "stable" virtual counter in preemptible section
    164f57cd0ac86 xfs: fix copy-paste error in previous fix
    ea39bac434c51 drm/i915/wakeref: clean up INTEL_WAKEREF_PUT_* flag macros
    b0bc1aaf938d9 Revert "ACPI: processor: Update cpuidle driver check in __acpi_processor_start()"
    b9f13e55168c1 ALSA: pcm: Revert bufs move in snd_pcm_xfern_frames_ioctl()
    6789db2c8e2fa NTB: ntb_transport: Fix too small buffer for debugfs_name
    358cb7055e03d rust: list: Add unsafe blocks for container_of and safety comments
    49ffdc3589d82 tracing: Wake up poll waiters for hist files when removing an event
    d4e45ca6db678 tracing: Fix checking of freed trace_event_file for hist files
    c71ea5a712339 fgraph: Do not call handlers direct when not using ftrace_ops
    5026010110a5a tracing: ring-buffer: Fix to check event length before using
    bc77986f3cb74 ring-buffer: Fix possible dereference of uninitialized pointer
    c692db813a7e3 net: nfc: nci: Fix parameter validation for packet data
    b1e034af484a4 drm/amdgpu: keep vga memory on MacBooks with switchable graphics
    832f430b6b337 drm/amd/display: Correct logic check error for fastboot
    53002567af57b arm64: Force the use of CNTVCT_EL0 in __delay()
    0ec0156b3fa6a rust: pin-init: replace clippy `expect` with `allow`
    dddc9e67fc454 rust: irq: add `'static` bounds to irq callbacks
    a94f096e28bfc io_uring/zcrx: fix user_ref race between scrub and refill paths
    581a8f0f3338b x86/kexec: Copy ACPI root pointer address from config table
    54f463494eb5b gpio: sysfs: fix chip removal with GPIOs exported over sysfs
    4ece5eb4836f8 net/sched: act_skbedit: fix divide-by-zero in tcf_skbedit_hash()
    1b1d3c5d58a80 net: ethernet: ec_bhf: Fix dma_free_coherent() dma handle
    ffba51100ff61 drm/xe: Add bounds check on pat_index to prevent OOB kernel read in madvise
    ea33c43c2e403 kbuild: rpm-pkg: Disable automatic requires for manual debuginfo package
    caa055b579cd4 ASoC: amd: yc: Add DMI quirk for ASUS Vivobook Pro 15X M6501RR
    422adc95ea9a8 io_uring/cmd_net: fix too strict requirement on ioctl
    89f3d2d541351 gpio: nomadik: Add missing IS_ERR() check
    7c9ce68192eef cifs: some missing initializations on replay
    f1ae403324311 io_uring/zcrx: fix sgtable leak on mapping failures
    bcf40ce466650 fbcon: Remove struct fbcon_display.inverse
    c61afb99c8289 fbdev: ffb: fix corrupted video output on Sun FFB1
    69290f2d3999c fbdev: of: display_timing: fix refcount leak in of_get_display_timings()
    40c1ff2502515 fbdev: vt8500lcdfb: fix missing dma_free_coherent()
    11a93180a70bb fbcon: check return value of con2fb_acquire_newinfo()
    0a08a7fa123c0 fbdev: Use device_create_with_groups() to fix sysfs groups registration race
    861fb0cc95d5d mm: numa_memblks: Identify the accurate NUMA ID of CFMW
    e90346a2f1e89 ipv6: ioam: fix heap buffer overflow in __ioam6_fill_trace_data()
    3d01d8a2cc64a kbuild: rpm-pkg: Fix manual debuginfo generation when using .src.rpm
    39824c8ce0c25 kernel: rpm-pkg: Restore find-debuginfo.sh approach to -debuginfo package
    0ee1887b524ce kbuild: rpm-pkg: Restrict manual debug package creation
    972495bc37be3 kbuild: Fix CC_CAN_LINK detection
    f8d02862e520b function_graph: Restore direct mode when callbacks drop to one
    e4ff4e3ffcf9d atm: fore200e: fix use-after-free in tasklets during device removal
    41023fc00f370 net: intel: fix PCI device ID conflict between i40e and ipw2200
    23b82b7a26182 mm/page_alloc: clear page->private in free_pages_prepare()
    e116e19c95845 mm/vmscan: fix demotion targets checks in reclaim/demotion
    8adaff87db143 procfs: fix possible double mmput() in do_procmap_query()
    f64491066c662 mm/page_alloc: skip debug_check_no_{obj,locks}_freed with FPI_TRYLOCK
    5eac1322a7b14 mm/hugetlb: restore failed global reservations to subpool
    89a9389ad70d3 drm/amdgpu: fix sync handling in amdgpu_dma_buf_move_notify
    be9c5e7af6b3a drm/amd/display: Increase DCN35 SR enter/exit latency
    cc54e0eeee01a io_uring/openclose: fix io_pipe_fixed() slot tracking for specific slots
    749b5e65ab699 io_uring/filetable: clamp alloc_hint to the configured alloc range
    e18d1a82a62e8 ceph: fix write storm on fscrypted files
    746840c87d76b ceph: do not propagate page array emplacement errors as batch errors
    0b9c58126ad1f tracing: Reset last_boot_info if ring buffer is reset
    127f9481ea77b tracing: Fix to set write permission to per-cpu buffer_size_kb
    316d9fe71fb18 net: macb: Fix tx/rx malfunction after phy link down and up
    4cbc8dc736c72 net: ti: icssg-prueth: Add optional dependency on HSR
    6d389382ee655 octeontx2-af: CGX: fix bitmap leaks
    d8a522085d09b net: wan/fsl_ucc_hdlc: Fix dma_free_coherent() in uhdlc_memclean()
    938cf039a6835 net: ethernet: marvell: skge: remove incorrect conflicting PCI ID
    78dd793ae6dcf LoongArch: Disable instrumentation for setup_ptwalker()
    76a0e30a1cea1 LoongArch: Guard percpu handler under !CONFIG_PREEMPT_RT
    0811b951377e3 LoongArch: Use %px to print unmodified unwinding address
    7a6b754bddd34 LoongArch: Prefer top-down allocation after arch_mem_init()
    61a56df2fbaad LoongArch: Make cpumask_of_node() robust against NUMA_NO_NODE
    353dd9934447b mm/slab: do not access current->mems_allowed_seq if !allow_spin
    f843be7642041 rust: kbuild: pass `-Zunstable-options` for Rust 1.95.0
    2d11f9cff0a7b drm/i915/quirks: Fix device id for QUIRK_EDP_LIMIT_RATE_HBR2 entry
    69e59a87bab0e ceph: supply snapshot context in ceph_zero_partial_object()
    a2d53aee3fe2d MIPS: rb532: Fix MMIO UART resource registration
    3969db6b22e3d cifs: Fix locking usage for tcon fields
    80a2e762b2177 i2c: imx-lpi2c: fix SMBus block read NACK after byte count
    5e227857fcd94 watchdog/softlockup: fix sample ring index wrap in need_counting_irqs()
    d14871ce0b400 kcsan, compiler_types: avoid duplicate type issues in BPF Type Format
    677490a6bd4c6 staging: rtl8723bs: fix null dereference in find_network
    7e4d88e36e5d0 mptcp: pm: in-kernel: always set ID as avail when rm endp
    2f33f77397dd1 parisc: kernel: replace kfree() with put_device() in create_tree_node()
    bd435f4b73813 PCI: Fix pci_slot_trylock() error handling
    627f0ea6537ce PCI: Don't claim disabled bridge windows
    29739ec197ed6 net: cpsw_new: Fix potential unregister of netdev that has not been registered yet
    299b825716b82 net: cpsw_new: Fix unnecessary netdev unregistration in cpsw_probe() error path
    fc58ef30e0a15 drm/amdgpu: Protect GPU register accesses in powergated state in some paths
    bfcd6b53e1f4f drm/amdkfd: Fix out-of-bounds write in kfd_event_page_set()
    d58f8d4dcfb1c tipc: fix RCU dereference race in tipc_aead_users_dec()
    ead66f2ed16f3 mtd: rawnand: pl353: Fix software ECC support
    9799f977759e4 usb: dwc2: fix resume failure if dr_mode is host
    2333653ef854c usb: dwc3: gadget: Move vbus draw to workqueue context
    76096f156fe9d mux: mmio: fix regmap leak on probe failure
    e4010282364fc PCI: dwc: Fix msg_atu_index assignment
    b355d927109f1 MIPS: Loongson2ef: Use pcibios_align_resource() to block io range
    3b8fa431e0354 MIPS: Loongson2ef: Register PCI controller in early stage
    222afcca91f36 mm/slab: use unsigned long for orig_size to ensure proper metadata align
    29659497e1001 mm/slab: avoid allocating slabobj_ext array from its own slab
    78d8e2d6352e8 scsi: ufs: core: Flush exception handling work when RPM level is zero
    08c7eadd8a934 perf/arm-cmn: Reject unsupported hardware configurations
    500778df9e4c3 remoteproc: imx_rproc: Fix invalid loaded resource table detection
    4c0382b86600e btrfs: continue trimming remaining devices on failure
    f4951c56d59c2 btrfs: zoned: fixup last alloc pointer after extent removal for DUP
    72f6529487a37 btrfs: zoned: fixup last alloc pointer after extent removal for RAID1
    25afd2a1ee4d2 btrfs: fix periodic reclaim condition
    da86ca15d7389 clk: rs9: Reserve 8 struct clk_hw slots for for 9FGV0841
    4ce27e86d641c uprobes: Fix incorrect lockdep condition in filter_chain()
    956d54e07ca77 arm64: Fix non-atomic __READ_ONCE() with CONFIG_LTO=y
    bea1d373098b2 PCI/IOV: Fix race between SR-IOV enable/disable and hotplug
    40f67686a5002 Revert "PCI/IOV: Add PCI rescan-remove locking when enabling/disabling SR-IOV"
    f86582890bd7a kho: skip memoryless NUMA nodes when reserving scratch areas
    fdf605f64f824 crash_dump: fix dm_crypt keys locking and ref leak
    36eb314184a0a kexec: derive purgatory entry from symbol
    3bdc3766aafb0 ocfs2: fix reflink preserve cleanup issue
    e5a732bfe2945 rapidio: replace rio_free_net() with kfree() in rio_scan_alloc_net()
    9f7a5aee91713 compiler-clang.h: require LLVM 19.1.0 or higher for __typeof_unqual__
    d83396624fda6 mm/highmem: fix __kmap_to_page() build error
    491f04be585c6 power: reset: tdx-ec-poweroff: fix restart
    bc1492651253e mtd: spinand: Disable continuous read during probe
    5a435b0e46098 iio: gyro: itg3200: Fix unchecked return value in read_raw
    9b85c8f624b0f powerpc/smp: Add check for kcalloc() failure in parse_thread_groups()
    7441d35d14d9a vhost: move vdpa group bound check to vhost_vdpa
    dfcbe01951651 tools: Fix bitfield dependency failure
    461242507181e arm64: poe: fix stale POR_EL0 values for ptrace
    e9051992fd21f dm mpath: make pg_init_delay_msecs settable
    b662f91e216fd bus: fsl-mc: fix an error handling in fsl_mc_device_add()
    ab81f9f3319e0 io_uring/net: don't continue send bundle if poll was required for retry
    bce59008b2347 mm/slab: add rcu_barrier() to kvfree_rcu_barrier_on_cache()
    f42941d60f01a usb: gadget: tegra-xudc: Add handling for BLCG_COREPLL_PWRDN
    1afe45f89d54b mm/vmalloc: prevent RCU stalls in kasan_release_vmalloc_node
    d4a132f121c59 x86/kexec: add a sanity check on previous kernel's ima kexec buffer
    1ca6530f07d4a of/kexec: refactor ima_get_kexec_buffer() to use ima_validate_range()
    9e1f51c1ad57c ima: verify the previous kernel's IMA buffer lies in addressable RAM
    995240f823a32 PCI: Fix bridge window alignment with optional resources
    26da747e754c6 nvmem: Drop OF node reference on nvmem_add_one_cell() failure
    2eb988d5c8f8e nfsd: fix return error code for nfsd_map_name_to_[ug]id
    6689272b82618 NFSD: fix setting FMODE_NOCMTIME in nfs4_open_delegation
    9a6f8cd28bb9b md/bitmap: fix GPF in write_page caused by resize race
    b04baa848c054 xfs: check for deleted cursors when revalidating two btrees
    2b658d1249666 xfs: check return value of xchk_scrub_create_subord
    c9ccefacae0d8 xfs: only call xf{array,blob}_destroy if we have a valid pointer
    c2ce8d9a3b989 pinctrl: intel: Add code name documentation
    733cbc3aa97e7 PCI: endpoint: Fix swapped parameters in pci_{primary/secondary}_epc_epf_unlink() functions
    57536ff0a6bd6 KVM: x86: Add SRCU protection for reading PDPTRs in __get_sregs2()
    aaaea528d4768 rust/drm: Fix Registration::{new,new_foreign_owned}() docs
    71cfbc15c91a6 spmi: apple: Add "apple,t8103-spmi" compatible
    18e9cf2259b41 xfs: get rid of the xchk_xfile_*_descr calls
    d1a3cc775c6e2 xfs: fix remote xattr valuelblk check
    652d815b856c6 xfs: fix the xattr scrub to detect freemap/entries array collisions
    43f3b18679615 xfs: fix freemap adjustments when adding xattrs to leaf blocks
    f31a8334e1c54 xfs: delete attr leaf freemap entries when empty
    d54f00547c210 usb: host: tegra: Remove manual wake IRQ disposal
    a50006e7ba0e3 iommu/arm-smmu-v3: Do not set disable_ats unless vSTE is Translate
    779e0c250a6b8 iommu/arm-smmu-v3: Mark EATS_TRANS safe when computing the update sequence
    3f73325f4548b iommu/arm-smmu-v3: Mark STE MEV safe when computing the update sequence
    efd59553e477f iommu/arm-smmu-v3: Add update_safe bits to fix STE update sequence
    a8e88edfd69df iio: accel: adxl380: Avoid reading more entries than present in FIFO
    4828149214491 PCI/PM: Prevent runtime suspend until devices are fully initialized
    d6e866f3a183e arm64: dts: rockchip: Explicitly request UFS reset pin on RK3576
    8d8a878ef6080 erofs: fix incorrect early exits in volume label handling
    041b5163bb9b2 erofs: fix incorrect early exits for invalid metabox-enabled images
    70746336cae66 mfd: omap-usb-host: Fix OF populate on driver rebind
    2694660274408 mfd: qcom-pm8xxx: Fix OF populate on driver rebind
    a1e9e299c0d9e mfd: macsmc: Initialize mutex
    89bdcd39ae8b1 mfd: tps65219: Implement LOCK register handling for TPS65214
    9b02e3fec3a7f mfd: core: Add locking around 'mfd_of_node_list'
    25056a2fc07fa KVM: arm64: nv: Return correct RES0 bits for FGT registers
    8722a8fb7ed92 iommu/vt-d: Flush piotlb for SVM and Nested domain
    9deaacc8dcadd iommu/vt-d: Flush dev-IOTLB only when PCIe device is accessible in scalable mode
    69c32df23bed6 media: uvcvideo: Return queued buffers on start_streaming() failure
    97330e31ea164 dm: fix excessive blk-crypto operations for invalid keys
    f122f2b3ce9db media: verisilicon: AV1: Fix tile info buffer size
    457121c01f609 xfs: remove xfs_attr_leaf_hasname
    00195330d172e xfs: mark data structures corrupt on EIO and ENODATA
    aacb5f183eac5 PCI: dwc: Skip waiting for L2/L3 Ready if dw_pcie_rp::skip_l23_wait is true
    42d9509161d05 phy: fsl-imx8mq-usb: set platform driver data
    5e27e7f229785 drm/bridge: anx7625: Fix invalid EDID size
    6236c1cd9fdf4 drm/buddy: Prevent BUG_ON by validating rounded allocation
    ca666795bd61a selftests/mm/charge_reserved_hugetlb: drop mount size for hugetlbfs
    a39b9928fdfd5 mm, page_alloc, thp: prevent reclaim for __GFP_THISNODE THP allocations
    e14d5a99b1a6c docs: kdoc: avoid error_count overflows
    faccf9c1464aa drm: of: drm_of_panel_bridge_remove(): fix device_node leak
    77f69aa4deb18 media: iris: Prevent output buffer queuing before stream-on completes
    72846441c5f63 media: iris: gen2: Add sanity check for session stop
    7cde76db8883e media: iris: gen1: Destroy internal buffers after FW releases
    64e88089a2940 media: iris: Skip resolution set on first IPSC
    45b30f65feeb4 media: iris: Add buffer to list only after successful allocation
    b59ec89f9cdf3 media: iris: use fallback size when S_FMT is called without width/height
    101f2b3cd0b61 media: iris: Fix fps calculation
    0cd7ca8e96034 media: iris: Fix ffmpeg corrupted frame error
    bd4f8fa216182 Revert "media: iris: Add sanity check for stop streaming"
    f3bf86dec1d8f media: venus: vdec: restrict EOS addr quirk to IRIS2 only
    fa71c413854bd media: venus: vdec: fix error state assignment for zero bytesused
    21fde0b4b166d arm64: dts: rockchip: Do not enable hdmi_sound node on Pinebook Pro
    428966f1151f3 drm/tyr: fix register name in error print
    1a09db973ac6b rtc: pcf8563: use correct of_node for output clock
    dfe2dbe3950f6 dm-unstripe: fix mapping bug when there are multiple targets in a table
    38625191f32f7 dm-integrity: fix recalculation in bitmap mode
    76801c3dfca0a reset: gpio: suppress bind attributes in sysfs
    2097ce274bbc5 drm/i915/psr: Don't enable Panel Replay on sink if globally disabled
    4caae8168d1b8 mailbox: Prevent out-of-bounds access in fw_mbox_index_xlate()
    2c89064ecf676 s390/pci: Handle futile config accesses of disabled devices directly
    b7bbd20d55cef clk: tegra: tegra124-emc: Fix potential memory leak in tegra124_clk_register_emc()
    26b1c59da576a arm64: dts: rockchip: Fix SD card support for RK3576 EVB1
    fed39f0d316f8 media: i2c: ov01a10: Fix digital gain range
    4be6112c79b22 media: stm32: dcmipp: byteproc: disable compose for all bayers
    49c7d405c6cad media: stm32: dcmipp: bytecap: clear all interrupts upon stream stop
    23ad54f2551f7 media: stm32: dcmipp: avoid naming clock if only one is needed
    d13418d75e177 soc: rockchip: grf: Support multiple grf to be handled
    833fd7ad595ff soc: rockchip: grf: Fix wrong RK3576_IOCGRF_MISC_CON definition
    9785b31beb335 clk: clk-apple-nco: Add "apple,t8103-nco" compatible
    ef6647586deb7 bus: omap-ocp2scp: fix OF populate on driver rebind
    d464cf1ed900d KVM: nSVM: Always use vmcb01 in VMLOAD/VMSAVE emulation
    b7db9953c2f8d soc: ti: pruss: Fix double free in pruss_clk_mux_setup()
    ab1ac24c407e4 soc: ti: k3-socinfo: Fix regmap leak on probe failure
    b1c1a2637ebd6 dm: clear cloned request bio pointer when last clone bio completes
    9e30eb22e03a4 dm-integrity: fix a typo in the code for write/discard race
    e3704ce5d7156 platform/x86: ISST: Store and restore all domains data
    067d784870eed platform/x86: ISST: Add missing write block check
    5ca94abfe5a0f media: staging/ipu7: Fix the loop bound in l2 table alloc
    08440d792f97d media: staging/ipu7: Update CDPHY register settings
    8603922f08d95 media: staging/ipu7: Call synchronous RPM suspend in probe failure
    9a8c3cd8a0bbf media: staging/ipu7: Ignore interrupts when device is suspended
    364759ccc3fb4 media: ipu6: Fix RPM reference leak in probe error paths
    39b9626b0559d media: ipu6: Fix typo and wrong constant in ipu6-mmu.c
    605e9a9471d28 media: dw9714: Fix powerup sequence
    fa69b9a87f898 media: i2c: ov5647: use our own mutex for the ctrl lock
    e26aba7c0e9e6 media: ccs: Fix setting initial sub-device state
    78d2c1ca071de media: i2c: ov5647: Fix PIXEL_RATE value for VGA mode
    1b593da3e54c8 media: i2c: ov5647: Sensor should report RAW color space
    ff90942181d00 media: i2c: ov5647: Correct minimum VBLANK value
    8f5082ee17730 media: i2c: ov5647: Correct pixel array offset
    8ecb21c20387c media: i2c: ov5647: Initialize subdev before controls
    a8ff58cc8c751 media: ccs: Avoid possible division by zero
    fade67c88870f media: qcom: camss: vfe: Fix out-of-bounds access in vfe_isr_reg_update()
    e5d08efceffc8 media: i2c: ov01a10: Fix test-pattern disabling
    9466dc871c45a media: i2c: ov01a10: Fix passing stream instead of pad to v4l2_subdev_state_get_format()
    be04fe430bb0f media: i2c: ov01a10: Add missing v4l2_subdev_cleanup() calls
    2195f2be8307f media: i2c: ov01a10: Fix analogue gain range
    e148cdc0f1228 media: i2c: ov01a10: Fix reported pixel-rate value
    8df26a76497f0 media: i2c: ov01a10: Fix the horizontal flip control
    377a775691436 media: i2c/tw9906: Fix potential memory leak in tw9906_probe()
    cc7aeed33e4f5 media: i2c/tw9903: Fix potential memory leak in tw9903_probe()
    280da29ff6034 media: cx25821: Add missing unmap in snd_cx25821_hw_params()
    9544b73cad4ee media: cx23885: Add missing unmap in snd_cx23885_hw_params()
    1ce8c2a8f050a media: cx88: Add missing unmap in snd_cx88_hw_params()
    1d8558a232ecb media: radio-keene: fix memory leak in error path
    9e3b9d2472b36 media: verisilicon: AV1: Set IDR flag for intra_only frame type
    1af2853b4e97f media: rockchip: rga: Fix possible ERR_PTR dereference in rga_buf_init()
    fe1c50fadc4eb media: amphion: Drop min_queued_buffers assignment
    a2ac388aa830a arm64: dts: apple: t8112-j473: Keep the HDMI port powered on
    e75e091a331e9 fs: ensure that internal tmpfs mount gets mount id zero
    1acb28123e57b HID: logitech-hidpp: Check maxfield in hidpp_get_report_length()
    d5512ce892f77 HID: prodikeys: Check presence of pm->input_ep82
    5bbe266272d86 HID: magicmouse: Do not crash on missing msc->input
    1d46d07458dba HID: hid-pl: handle probe errors
    4a1afa32145b5 pinctrl: meson: amlogic-a4: mark the GPIO controller as sleeping
    e3e6e2e4d66e5 arm64: Disable branch profiling for all arm64 code
    969e5e13ff5c1 KVM: nSVM: Remove a user-triggerable WARN on nested_svm_load_cr3() succeeding
    662fae91c30b1 KVM: x86: Return "unsupported" instead of "invalid" on access to unsupported PV MSR
    e28f45102510a powerpc/pseries: Fix MSI-X allocation failure when quota is exceeded
    58bd8c5f67a3c arm64: kernel: initialize missing kexec_buf->random field
    c053b301a0b2d ARM: omap2: Fix reference count leaks in omap_control_init()
    5d83ae6ccdc95 arm64: dts: qcom: sm8750: Fix BAM DMA probing
    b965b990c1913 arm64: dts: qcom: x1e80100: Add missing TCSR ref clock to the DP PHYs
    adae1932f01a5 media: verisilicon: AV1: Fix tx mode bit setting
    93adedf67b07f media: verisilicon: AV1: Fix enable cdef computation
    ea316b784fe6a media: chips-media: wave5: Fix Null reference while testing fluster
    27cb12b7dc88c media: chips-media: wave5: Fix SError of kernel panic when closed
    526816f2e3319 media: chips-media: wave5: Fix device cleanup order to prevent kernel panic
    cc8071b1bac65 media: chips-media: wave5: Fix kthread worker destruction in polling mode
    3a278a55ead50 media: chips-media: wave5: Fix PM runtime usage count underflow
    a62ba5aa9ee95 media: mtk-mdp: Fix a reference leak bug in mtk_mdp_remove()
    b3fc99fe5b256 media: mtk-mdp: Fix error handling in probe function
    d659f72af5666 media: mediatek: encoder: Fix uninitialized scalar variable issue
    e2a45398bba35 media: uvcvideo: Fix support for V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX
    451cc650e40e8 dm-verity: correctly handle dm_bufio_client_create() failure
    2e170d8bb3b3c arm64: dts: qcom: sdm630: Add missing MDSS reset
    c2b9214c34f57 phy: qcom: edp: Make the number of clocks flexible
    6cc6c73a87c33 PCI: Use resource_set_range() that correctly sets ->end
    fcfdf9794afea Revert "PCI: dwc: Don't wait for link up if driver can detect Link Up event"
    f956c3c101e20 Revert "PCI: qcom: Enumerate endpoints based on Link up event in 'global_irq' interrupt"
    46adbe1c144e3 Revert "PCI: qcom: Enable MSI interrupts together with Link up if 'Global IRQ' is supported"
    d6fecafe7b233 Revert "PCI: qcom: Don't wait for link if we can detect Link Up"
    77ac28b38a860 Revert "PCI: dw-rockchip: Don't wait for link since we can detect Link Up"
    4cccf815bccca drm/xe: Fix ggtt fb alignment
    cdf8bbbd9017a drm/tests: shmem: Hold reservation lock around purge
    9cc77691b5fd6 drm/tests: shmem: Hold reservation lock around madvise
    6b953d92f2f29 drm/tests: shmem: Hold reservation lock around vmap/vunmap
    595227cf408fb drm/tests: shmem: Add clean-up action to unpin pages
    496e765b72059 drm/tests: shmem: Swap names of export tests
    bfcee87fd1756 fpga: dfl: use subsys_initcall to allow built-in drivers to be added
    a0eb5f82212b3 ASoC: SOF: ipc4-control: Keep the payload size up to date
    c7bf344a83a10 ASoC: SOF: ipc4-control: Use the correct size for scontrol->ipc_control_data
    a704a1a4394b5 ASoC: SOF: ipc4-topology: Correct the allocation size for bytes controls
    c5fb5db719c7b ASoC: SOF: ipc4-control: If there is no data do not send bytes update
    ab8c0de60f16d drm/panthor: fix for dma-fence safe access rules
    a803cfad1f23c arm64: dts: ti: am62p-verdin: Fix SD regulator startup delay
    0bcfebb83b546 hfsplus: ensure sb->s_fs_info is always cleaned up
    428093cfa8b2b clk: renesas: rzg2l: Select correct div round macro
    01dfc5abfa4df clk: renesas: rzg2l: Fix intin variable size
    2e4a70f3c3091 rpmsg: core: fix race in driver_override_show() and use core helper
    f0a83d0a4b7c1 netfilter: nf_conntrack_h323: fix OOB read in decode_choice()
    89764cf44544e dpaa2-switch: validate num_ifs to prevent out-of-bounds write
    4cb163e9efcac net: consume xmit errors of GSO frames
    57957bc7f1865 net/mlx5e: Fix "scheduling while atomic" in IPsec MAC address query
    f72f646a55524 net/mlx5: Fix missing devlink lock in SRIOV enable error path
    5226e227271a2 net/mlx5: E-switch, Clear legacy flag when moving to switchdev
    f0ed27a3315f7 net/mlx5: LAG, disable MPESW in lag_disable_change()
    858914d1ad190 net/mlx5: DR, Fix circular locking dependency in dump
    bce42728ac488 team: avoid NETDEV_CHANGEMTU event when unregistering slave
    54a7013aa13fc team: use common function to compute the features
    26924d2fdec2c net: add a common function to compute features for upper devices
    fa3c2f8d91523 net: mana: Fix double destroy_workqueue on service rescan PCI path
    f8a06d562638b dpll: zl3073x: Remove redundant cleanup in devm_dpll_init()
    900be42c53cd9 tcp: re-enable acceptance of FIN packets when RWIN is 0
    d3e32e2f3262f RDMA/umem: Fix double dma_buf_unpin in failure path
    9d5a97bc71ed5 erofs: fix interlaced plain identification for encoded extents
    d2e7c898cc02d net: usb: pegasus: enable basic endpoint checking
    f3e4cceafad27 net: Drop the lock in skb_may_tx_timestamp()
    9bc0bca26418a RDMA/efa: Fix typo in efa_alloc_mr()
    2b96156c927cd RDMA/ionic: Fix potential NULL pointer dereference in ionic_query_port
    3126a2f98beae netconsole: avoid OOB reads, msg is not nul-terminated
    21d341fe514fd net: wan: farsync: Fix use-after-free bugs caused by unfinished tasklets
    e57d397bffaba RDMA/core: Fix stale RoCE GIDs during netdev events at registration
    d8fc9f972fbdd tipc: fix duplicate publication key in tipc_service_insert_publ()
    9fc2e95fe5414 dpll: zl3073x: fix REF_PHASE_OFFSET_COMP register width for some chip IDs
    b2acd29bd4878 dpll: zl3073x: Cache all reference properties in zl3073x_ref
    a4b086cc61e6b dpll: zl3073x: Cache reference monitor status
    b1e3edf688a88 kcm: fix zero-frag skb in frag_list on partial sendmsg error
    854cd32bc74fe tls: Fix race condition in tls_sw_cancel_work_tx()
    5455a232edea6 net: do not pass flow_id to set_rps_cpu()
    96581749c7c14 Bluetooth: L2CAP: Fix missing key size check for L2CAP_LE_CONN_REQ
    3a954c75b1cda Bluetooth: L2CAP: Fix not checking output MTU is acceptable on L2CAP_ECRED_CONN_REQ
    69dd2e85f8e83 Bluetooth: L2CAP: Fix response to L2CAP_ECRED_CONN_REQ
    49065204b95b8 Bluetooth: hci_qca: Cleanup on all setup failures
    e981a9392800c Bluetooth: L2CAP: Fix result of L2CAP_ECRED_CONN_RSP when MTU is too short
    7010201831df0 Bluetooth: L2CAP: Fix invalid response to L2CAP_ECRED_RECONF_REQ
    25c3e0de3b467 Remove WARN_ALL_UNSEEDED_RANDOM kernel config option
    64ccb0aac41c5 wifi: brcmfmac: Fix potential kernel oops when probe fails
    3c87b7e64735c wifi: cfg80211: wext: fix IGTK key ID off-by-one
    3e14ba8b95c97 dma-mapping: avoid random addr value print out on error path
    ceae058eb707d ksmbd: fix signededness bug in smb_direct_prepare_negotiation()
    0315bec883c67 ovpn: tcp - fix packet extraction from stream
    8178567c6a97c bnxt_en: Fix deleting of Ntuple filters
    079986d6db1f8 bnxt_en: Fix RSS context delete logic
    f27030ac5bef4 udplite: Fix null-ptr-deref in __udp_enqueue_schedule_skb().
    2d74412dfd362 net: ethernet: xscale: Check for PTP support properly
    cb8f0a3857386 net: phy: qcom: qca807x: normalize return value of gpio_get
    9605406cf28fa proc: Fix pointer error dereference
    f3970be26a308 net: usb: lan78xx: scan all MDIO addresses on LAN7801
    fc393af769af8 net: usb: kaweth: remove TX queue manipulation in kaweth_set_rx_mode
    664e9df53226b espintcp: Fix race condition in espintcp_close()
    b640188b61e63 psp: use sk->sk_hash in psp_write_headers()
    fe89b2f05b854 tcp: fix potential race in tcp_v6_syn_recv_sock()
    82c5acb68c639 ipv6: Move ipv6_fl_list from ipv6_pinfo to inet_sock.
    59581778792cb xfrm: always flush state and policy upon NETDEV_UNREGISTER event
    f726b3a57e00b ipmi: ipmb: initialise event handler read bytes
    27e70f32aef0a xfrm: skip templates check for packet offload tunnel mode
    c7221e7bd8fc2 xfrm6: fix uninitialized saddr in xfrm6_get_saddr()
    5000ce7fcb310 iommu/amd: serialize sequence allocation under concurrent TLB invalidations
    a133e3caf844a ntb: ntb_hw_switchtec: Fix shift-out-of-bounds for 0 mw lut
    2346856b74823 ntb: ntb_hw_switchtec: Fix array-index-out-of-bounds access
    495d9cb4ed711 rtc: zynqmp: correct frequency value
    630ace4d8286f drm/amdgpu: avoid sdma ring reset in sriov
    7a7e7bcefdd3e drm/amd/display: Remove conditional for shaper 3DLUT power-on
    581ed1a5a957a arm64: hugetlbpage: avoid unused-but-set-parameter warning (gcc-16)
    dd6e15658ab5d ALSA: hda/hdmi: Add quirk for TUXEDO IBS14G6
    d70d2a8a491e8 ASoC: amd: amd_sdw: add machine driver quirk for Lenovo models
    c19830db30a09 btrfs: replace BUG() with error handling in __btrfs_balance()
    6af16f1b8649d ALSA: usb-audio: Add sanity check for OOB writes at silencing
    d6e933f29bc05 drm/radeon: Add HAINAN clock adjustment
    e341e18215030 spi: spidev: fix lock inversion between spi_lock and buf_lock
    91e19be60e08b drm/amd/display: bypass post csc for additional color spaces in dal
    e3c0c83844791 drm/amdgpu: Add HAINAN clock adjustment
    e949fd266cfa1 ALSA: usb-audio: Update the number of packets properly at receiving
    ef8b0cc691f1a ALSA: hda/realtek: Fix headset mic on ASUS Zenbook 14 UX3405MA
    8c545bcb1dabd drm/amdgpu: Adjust usleep_range in fence wait
    89232d0db3ca9 drm/amdgpu: return when ras table checksum is error
    dea826897ea37 drm/amd/display: Avoid updating surface with the same surface under MPO
    a71819d2cc6f7 drm/amd/display: Fix system resume lag issue
    16b65c8ca3160 ALSA: hda/tas2781: Ignore reset check for SPI device
    96c5ea9e7a821 regulator: core: Remove regulator supply_name length limit
    0be2f54012b45 ASoC: rt721-sdca: Fix issue of fail to detect OMTP jack type
    c57b6b4bc339a mshv: clear eventfd counter on irqfd shutdown
    8ee9aa80d4f18 drm/amdgpu: Skip vcn poison irq release on VF
    dce5da49f65c7 drm/amd/display: Fix writeback on DCN 3.2+
    b7af28b96ddce ARM: 9467/1: mm: Don't use %pK through printk
    88c624236ef01 include: uapi: netfilter_bridge.h: Cover for musl libc
    dbf5c71218102 ACPI: x86: Force enabling of PWM2 on the Yogabook YB1-X90
    5c4e940075bd6 thermal: int340x: Fix sysfs group leak on DLVR registration failure
    c1a0f5f1e5e7e libceph: define and enforce CEPH_MAX_KEY_LEN
    5b75c7f24973c ceph: supply snapshot context in ceph_uninline_data()
    57633b43a603f fs/ntfs3: avoid calling run_get_entry() when run == NULL in ntfs_read_run_nb_ra()
    b014372b62237 ntfs3: fix circular locking dependency in run_unpack_ex
    b67fb01429fff fs/ntfs3: drop preallocated clusters for sparse and compressed files
    9779a6eaaabdf fs: ntfs3: fix infinite loop triggered by zero-sized ATTR_LIST
    c0b43c45d45f5 fs: ntfs3: fix infinite loop in attr_load_runs_range on inconsistent metadata
    b0ea441f44ce6 fs: ntfs3: check return value of indx_find to avoid infinite loop
    843dc5c215186 MIPS: Loongson: Make cpumask_of_node() robust against NUMA_NO_NODE
    54302ec38da41 iio: magnetometer: Remove IRQF_ONESHOT
    af51e8d99df78 iio: Use IRQF_NO_THREAD
    12cb0a166dc4f mfd: intel-lpss: Add Intel Nova Lake-S PCI IDs
    fcfa64c535860 Revert "mfd: da9052-spi: Change read-mask to write-mask"
    2a99af226fbbb phy: fsl-imx8mq-usb: disable bind/unbind platform driver feature
    c3be09c3c85bd phy: mvebu-cp110-utmi: fix dr_mode property read from dts
    c3beae1bed61d watchdog: rzv2h_wdt: Discard pm_runtime_put() return value
    d6014855a2cba watchdog: imx7ulp_wdt: handle the nowayout option
    17de6ad1c32bf binder: don't use %pK through printk
    5b3350e036670 fix it87_wdt early reboot by reporting running timer
    812e5d3bcc1ea serial: 8250: 8250_omap.c: Clear DMA RX running status only after DMA termination is done
    cbe7f4bc2dc15 serial: 8250: 8250_omap.c: Add support for handling UART error conditions
    af48c1a0abe84 staging: rtl8723bs: fix memory leak on failure path
    f4fbf2d4750d1 usb: chipidea: udc: fix DMA and SG cleanup in _ep_nuke()
    7a8ac86f5133c usb: gadget: f_fs: Fix ioctl error handling
    09820593b5069 usb: gadget: f_fs: fix DMA-BUF OUT queues
    2de2659c206bc iio: bmi270_i2c: Add MODULE_DEVICE_TABLE for BMI260/270
    e86bc719b0618 pinctrl: renesas: rzt2h: Allow .get_direction() for IRQ function GPIOs
    d2975604bf1ba misc: ti_fpc202: fix a potential memory leak in probe function
    b6cfbd4701583 misc: eeprom: Fix EWEN/EWDS/ERAL commands for 93xx56 and 93xx66
    822019d7516b3 pinctrl: mediatek: make devm allocations safer and clearer in mtk_eint_do_init()
    3842f93e6e29d misc: bcm_vk: Fix possible null-pointer dereferences in bcm_vk_read()
    4e033a7215df3 phy: cadence-torrent: restore parent clock for refclk during resume
    4842c87399612 phy: ti: phy-j721e-wiz: restore mux selection during resume
    a6e099cda2473 dmaengine: stm32-mdma: initialize m2m_hw_period and ccr to fix warnings
    bc25f81a3f6e4 dmaengine: sun6i: Choose appropriate burst length under maxburst
    af0b99b2214a1 most: core: fix resource leak in most_register_interface error paths
    f907623616f7f fpga: of-fpga-region: Fail if any bridge is missing
    2433adbe30bfa usb: typec: ucsi: psy: Fix voltage and current max for non-Fixed PDOs
    006470339240c serial: 8250_dw: handle clock enable errors in runtime_resume
    31dcb6316e250 staging: rtl8723bs: fix missing status update on sdio_alloc_irq() failure
    487e455643c04 soundwire: intel_auxdevice: add cs42l45 codec to wake_capable_list
    c7ed6e59a58c7 soundwire: dmi-quirks: add mapping for Avell B.ON (OEM rebranded of NUC15)
    e7e5f19998a9f dmaengine: stm32-dma3: use module_platform_driver
    59e7707492576 9p/xen: protect xen_9pfs_front_free against concurrent calls
    80a27fb114f77 m68k: nommu: fix memmove() with differently aligned src and dest for 68000
    479937252f44b HID: i2c-hid: Add FocalTech FT8112
    534dbb6422f9a clk: microchip: core: correct return value on *_get_parent()
    8d35f60ff0dc4 clk: renesas: rzg2l: Deassert reset on assert timeout
    f990244e0f07e clk: amlogic: remove potentially unsafe flags from S4 video clocks
    803e99ee0d607 mailbox: sprd: clear delivery flag before handling TX done
    c6bc63adddc35 remoteproc: mediatek: Break lock dependency to `prepare_lock`
    780185148d85c mailbox: sprd: mask interrupts that are not handled
    a60671946d85f mailbox: mchp-ipc-sbi: fix uninitialized symbol and other smatch warnings
    cf66aae883a5d mailbox: imx: Skip the suspend flag for i.MX7ULP
    2f41bbab5e326 mailbox: pcc: Remove spurious IRQF_ONESHOT usage
    95438699c9294 mailbox: mchp-ipc-sbi: fix out-of-bounds access in mchp_ipc_get_cluster_aggr_irq()
    dd6c4b4632092 remoteproc: imx_dsp_rproc: Skip RP_MBOX_SUSPEND_SYSTEM when mailbox TX channel is uninitialized
    359ca3038b77b tracing: Fix false sharing in hwlat get_sample()
    d451a01c5a143 riscv: vector: init vector context with proper vlenb
    62b650c4c0ac0 scsi: ufs: mediatek: Fix page faults in ufs_mtk_clk_scale() trace event
    25c429dd11785 vhost: fix caching attributes of MMIO regions by setting them explicitly
    59e14a18a7d5b scsi: buslogic: Reduce stack usage
    263fe43d87531 hisi_acc_vfio_pci: update status after RAS error
    9443fe6d05d11 ata: libata: avoid long timeouts on hot-unplugged SATA DAS
    ba5a09630ebba um: Preserve errno within signal handler
    7b7516ac611cb hisi_acc_vfio_pci: fix the queue parameter anomaly issue
    61ad70c6c9085 RDMA/rtrs-clt: For conn rejection use actual err number
    d527695c1df09 hisi_acc_vfio_pci: resolve duplicate migration states
    e9cc097427e85 nfc: nxp-nci: remove interrupt trigger type
    529eefdf98429 myri10ge: avoid uninitialized variable use
    fb108754550f8 PCI/bwctrl: Disable BW controller on Intel P45 using a quirk
    b8bd9fe67041c PCI: Mark Nvidia GB10 to avoid bus reset
    551f16cd696e5 PCI: Add ACS quirk for Qualcomm Hamoa & Glymur
    8d3fc66a008bc PCI: Enable ACS after configuring IOMMU for OF platforms
    d60ed85b84191 PCI: Fix pci_slot_lock () device locking
    cad253d055e25 PCI/AER: Clear stale errors on reporting agents upon probe
    a175a76147382 PCI: Mark ASM1164 SATA controller to avoid bus reset
    14eae5564053a net/rds: Clear reconnect pending bit
    a036d058f5ef0 vmw_vsock: bypass false-positive Wnonnull warning with gcc-16
    c55ba9760662e net: usb: sr9700: remove code to drive nonexistent multicast filter
    90ecae0dece4d ptp: ptp_vmclock: add 'VMCLOCK' to ACPI device match
    5baf9dc03e84d bnxt_en: Allow ntuple filters for drops
    211958e721983 wifi: ath10k: fix lock protection in ath10k_wmi_event_peer_sta_ps_state_chg()
    0e12a252ec4b8 wifi: rtw89: pci: restore LDO setting after device resume
    2f4de7738aded net: sfp: add quirk for Lantech 8330-265D
    8052d0587fb14 octeontx2-af: Workaround SQM/PSE stalls by disabling sticky
    ea3f3de49cb69 Bluetooth: btusb: Add device ID for Realtek RTL8761BU
    c87634f7b51f2 Bluetooth: btusb: Add new VID/PID for RTL8852CE
    e1b2d0394c8bd Bluetooth: hci_conn: use mod_delayed_work for active mode timeout
    113eeb6e2f94e Bluetooth: btusb: Add USB ID 0489:e112 for Realtek 8851BE
    a6cbc4f5a6fdb Bluetooth: hci_conn: Set link_policy on incoming ACL connections
    4a300678ab7cc Bluetooth: hci_qca: Fix SSR (SubSystem Restart) fail when BT_EN is pulled up by hw
    2d6160de5ff47 Bluetooth: btusb: Add support for MediaTek7920 0489:e158
    f7e05f08849f6 ipv4: fib: Annotate access to struct fib_alias.fa_state.
    ebeaa3b24ba56 wifi: rtw89: pci: validate release report content before using for RTL8922DE
    9e4da6e3907c7 wifi: iwlegacy: add missing mutex protection in il3945_store_measurement()
    998e57caaa469 wifi: iwlegacy: add missing mutex protection in il4965_store_tx_power()
    6b36e5c4741f1 net: hns3: extend HCLGE_FD_AD_QID to 11 bits
    b76eab322b7d9 ipv4: igmp: annotate data-races around idev->mr_maxdelay
    00b36860495ba gro: change the BUG_ON() in gro_pull_from_frag0()
    afe908432e443 ext4: propagate flags to convert_initialized_extent()
    899ef00963ce7 net/rds: No shortcut out of RDS_CONN_ERROR
    4db148f74a99f wifi: rtw89: 8922a: add digital compensation for 2GHz
    98a774e2c58df wifi: rtw89: fix unable to receive probe responses under MLO connection
    6944aaa804af2 driver core: faux: stop using static struct device
    e1c24d4cd1610 wifi: iwlwifi: mld: Fix primary link selection logic
    83f0bb907cc81 wifi: iwlwifi: mld: fix chandef start calculation
    1d49a42717bdc wifi: iwlwifi: fix 22000 series SMEM parsing
    ece13ddb9791e wifi: iwlwifi: mvm: check the validity of noa_len
    f181a659909f1 wifi: iwlwifi: mld: Handle rate selection for NAN interface
    3d39d78b8d487 PCI: imx6: Add CLKREQ# override to enable REFCLK for i.MX95 PCIe
    9650627d0757a net: usb: r8152: fix transmit queue timeout
    a729596086984 openrisc: define arch-specific version of nop()
    5e13d0a376669 netfilter: xt_tcpmss: check remaining length before reading optlen
    29f51913cb77c netfilter: nf_conntrack: Add allow_clash to generic protocol handler
    74431472d16eb ext4: use reserved metadata blocks when splitting extent on endio
    3b3c11f944bd9 ext4: mark group extend fast-commit ineligible
    bf5b609524497 ext4: move ext4_percpu_param_init() before ext4_mb_init()
    27a99fa312527 ext4: mark group add fast-commit ineligible
    c315d742675a5 ipv6: exthdrs: annotate data-race over multiple sysctl
    58e7c79cf0a3a ipv6: annotate data-races in net/ipv6/route.c
    7d4c7533b632c ipv6: annotate data-races over sysctl.flowlabel_reflect
    ccaff26fac79f ipv6: annotate data-races in ip6_multipath_hash_{policy,fields}()
    08e7ae48e175c wifi: cfg80211: allow only one NAN interface, also in multi radio
    8362565a6905a wifi: ath12k: fix mac phy capability parsing
    e8ce435b9b1ff wifi: ath12k: fix preferred hardware mode calculation
    5358df6e61c6f wifi: ath11k: Fix failure to connect to a 6 GHz AP
    0e76bc37f1922 wifi: ath11k: add pm quirk for Thinkpad Z13/Z16 Gen1
    4b4784394099d wifi: rtw89: disable EHT protocol by chip capabilities
    4d510f668f0f7 PCI: dw-rockchip: Disable BAR 0 and BAR 1 for Root Port
    717fc84f180d0 wifi: rtw89: wow: add reason codes for disassociation in WoWLAN mode
    fa8301c29079a wifi: rtw89: mac: correct page number for CSI response
    ef7fa19809b2d wifi: rtw89: pci: validate sequence number of TX release report
    ffbcca93034f1 wifi: rtw89: Add support for MSI AX1800 Nano (GUAX18N)
    e15768e688201 iommu/amd: move wait_on_sem() out of spinlock
    3308c7504e093 wifi: libertas: fix WARNING in usb_tx_block
    27272429732d9 rtla: Fix NULL pointer dereference in actions_parse
    1260bee014931 wifi: rtw89: fix potential zero beacon interval in beacon tracking
    fce7f6f639154 net: wwan: mhi: Add network support for Foxconn T99W760
    c7e5d819388e5 iommu/arm-smmu-v3: Improve CMDQ lock fairness and efficiency
    6cdb21e0c9fde dm: remove fake timeout to avoid leak request
    8f220e851a00b dm: replace -EEXIST with -EBUSY
    6b20fde2f14b3 wifi: rtw89: regd: 6 GHz power type marks default when inactive
    f85d790c3cb70 wifi: rtw88: Fix inadvertent sharing of struct ieee80211_supported_band data
    ad9b80ee310ed wifi: rtw88: Use devm_kmemdup() in rtw_set_supported_band()
    6552d7992860f wifi: rtw89: mcc: reset probe counter when receiving beacon
    5a7362a3b6132 wifi: rtw89: setting TBTT AGG number when mac port initialization
    efa0f7fa3a438 wifi: rtw89: ser: enable error IMR after recovering from L1
    232418bbe0261 wifi: rtw89: 8922a: set random mac if efuse contains zeroes
    e1958f4d66a57 wifi: rtw88: rtw8821cu: Add ID for Mercusys MU6H
    509becaee5680 wifi: rtw88: 8822b: Avoid WARNING in rtw8822b_config_trx_mode()
    3cf7a584327a6 wifi: rtw88: fix DTIM period handling when conf->dtim_period is zero
    cf0e2c8313613 PCI: dwc: Skip PME_Turn_Off broadcast and L2/L3 transition during suspend if link is not up
    fe136426e30ca jfs: nlink overflow in jfs_rename
    974dac536e8c9 jfs: Add missing set_freezable() for freezable kthread
    8e5297128563d ALSA: usb-audio: Add iface reset and delay quirk for AB13X USB Audio
    e6645e625480c ALSA: mixer: oss: Add card disconnect checkpoints
    572e4274251fb ALSA: hda/realtek - Enable mute LEDs on HP ENVY x360 15-es0xxx
    2d8f056e9c68f ASoC: fsl: imx-rpmsg: use snd_soc_find_dai_with_mutex() in probe
    c3ac651a4f89b spi: geni-qcom: Fix abort sequence execution for serial engine errors
    42068f7dd42b5 ASoC: SOF: Intel: hda: Fix NULL pointer dereference
    9da857e6b5fd8 power: sequencing: fix missing state_lock in pwrseq_power_on() error path
    aba5b98c41088 modpost: Amend ppc64 save/restfpr symnames for -Os build
    cafea2adb3583 ASoC: es8328: Add error unwind in resume
    460796f33df7d HID: logitech-hidpp: Add support for Logitech K980
    c8cde3ddd12ad hwmon: (nct7363) Fix a resource leak in nct7363_present_pwm_fanin
    5e13b9b341ee7 hwmon: (f71882fg) Add F81968 support
    3fa44a5e3bc77 hwmon: (emc2305) Fix a resource leak in emc2305_of_parse_pwm_child
    da684ff541a42 hwmon: (nct6683) Add customer ID for ASRock Z590 Taichi
    cabde1dddad3b hwmon: (nct6775) Add ASUS Pro WS WRX90E-SAGE SE
    3f0aa5f0794a7 hwmon: (dell-smm) Add support for Dell OptiPlex 7080
    ff0827301718d ASoC: codecs: max98390: Check return value of devm_gpiod_get_optional() in max98390_i2c_probe()
    f752cc300fa03 spi: cadence-qspi: Try hard to disable the clocks
    cf2a37be899dc drm/amdgpu: validate user queue size constraints
    25c5065bb6766 drm/amd/display: avoid dig reg access timeout on usb4 link training fail
    2d02b419ef8d1 drm/amd/display: Fix GFX12 family constant checks
    30ed220ddcb89 spi: spi-mem: Protect dirmap_create() with spi_mem_access_start/end
    588faab060c54 ASoC: sunxi: sun50i-dmic: Add missing check for devm_regmap_init_mmio
    ffb5fde572e94 gpio: aspeed-sgpio: Change the macro to support deferred probe
    62914b5c29552 ALSA: hda/realtek: fix LG Gram Style 14 speakers
    06d929be11327 ALSA: hda/conexant: Add headset mic fix for MECHREVO Wujie 15X Pro
    a36e053b16804 HID: elecom: Add support for ELECOM HUGE Plus M-HT1MRBK
    37914cef17eee media: uvcvideo: Create an ID namespace for streaming output terminals
    882974699753f HID: multitouch: add eGalaxTouch EXC3188 support
    16790e7e2987d drm/amd/display: Revert "init dispclk from bootup clock for DCN315"
    37282c9129fd6 media: rkisp1: Fix filter mode register configuration
    7b4d0fab3ff2c drm/atmel-hlcdc: fix use-after-free of drm_crtc_commit after release
    f1f3e18596e2e drm/atmel-hlcdc: don't reject the commit if the src rect has fractional parts
    082271e364a32 drm/atmel-hlcdc: fix memory leak from the atomic_destroy_state callback
    1e89f8a2e8b00 drm/amd/display: Ensure link output is disabled in backend reset for PLL_ON
    5f0c5775d4eeb drm/amd/display: Disable FEC when powering down encoders
    bc8b167f031ad PCI: Add Intel Nova Lake audio Device ID
    d5262b2ee0620 ASoC: soc-acpi-intel-arl-match: change rt722 amp endpoint to aggregated
    cfe928c39b48f virt: vbox: uapi: Mark inner unions in packed structs as packed
    b856cf4a15500 hyper-v: Mark inner union in hv_kvp_exchg_msg_value as packed
    79f42487ed60d drm: renesas: rz-du: mipi_dsi: fix kernel panic when rebooting for some panels
    cb8b9a1755fe9 drm: Account property blob allocations to memcg
    662ec0a17b504 drm/amdkfd: Fix GART PTE for non-4K pagesize in svm_migrate_gart_map()
    acfc84cfa70ac drm/amdkfd: Relax size checking during queue buffer get
    6eb9fc7d451ce ALSA: usb-audio: presonus s18xx uses little-endian
    9745c2561e55f ALSA: hda/realtek: add HP Victus 16-e0xxx mute LED quirk
    c626a9b6b7ff2 media: ipu6: Always close firmware stream
    eb7cdb7ab50b0 media: ipu6: Close firmware streams on streaming enable failure
    5d5190cbc4bbe media: ipu6: Ensure stream_mutex is acquired when dealing with node list
    e913d0d8e26cd media: mt9m114: Return -EPROBE_DEFER if no endpoint is found
    7bccb94dff567 media: mt9m114: Avoid a reset low spike during probe()
    b02bcb378efa8 media: v4l2-async: Fix error handling on steps after finding a match
    2e9d6b58ab814 media: qcom: camss: Do not enable cpas fast ahb clock for SM8550 VFE lite
    b7210170b10e2 media: cx25821: Fix a resource leak in cx25821_dev_setup()
    d29f33b2cf98e media: solo6x10: Check for out of bounds chip_id
    2011929f0e4cf media: pvrusb2: fix URB leak in pvr2_send_request_ex
    d484d11030aae media: adv7180: fix frame interval in progressive mode
    2f5427d8726b2 drm/panel: Fix a possible null-pointer dereference in jdi_panel_dsi_remove()
    7c0feaa0026ba media: amphion: Clear last_buffer_dequeued flag for DEC_CMD_START
    efa59cc2142db cgroup/cpuset: Don't fail cpuset.cpus change in v2
    b725955d651df spi: spi-mem: Limit octal DTR constraints to octal DTR situations
    677681a41fc97 ASoC: wm8962: Don't report a microphone if it's shorted to ground on plug
    669220b2fca69 ASoC: wm8962: Add WM8962_ADC_MONOMIX to "3D Coefficients" mask
    a85e45fcff1ba drm/xe: Only toggle scheduling in TDR if GuC is running
    dc3097ef16e7e drm/amd/display: only power down dig on phy endpoints
    2b9e44b3849fd drm/amdgpu: Skip loading SDMA_RS64 in VF
    409d19050cde8 HID: multitouch: add quirks for Lenovo Yoga Book 9i
    5ed818e9560f1 HID: pidff: Do not set out of range trigger button
    18750cac9b015 HID: apple: Add "SONiX KN85 Keyboard" to the list of non-apple keyboards
    e9e477d3197f7 drm/amdgpu: Refactor amdgpu_gem_va_ioctl for Handling Last Fence Update and Timeline Management v4
    486b2909ac284 drm/amd/display: Add signal type check for dcn401 get_phyd32clk_src
    f58458249d868 drm/amdgpu: avoid a warning in timedout job handler
    c10fe9471f3aa drm/amd/display: Fix dsc eDP issue
    0b1005d5ca9a9 drm/amdgpu: add support for HDP IP version 6.1.1
    20e248df7341b media: mediatek: vcodec: Don't try to decode 422/444 VP9
    b173ba3365ff0 drm/panel: edp: add BOE NV140WUM-T08 panel
    5e702ee8c7f5d media: chips-media: wave5: Process ready frames when CMD_STOP sent to Encoder
    b607b5e2c62b6 media: chips-media: wave5: Fix conditional in start_streaming
    98c62dacabbd0 media: omap3isp: set initial format
    7ab5e86088f29 media: omap3isp: isppreview: always clamp in preview_try_format()
    dd1bdabe47bce media: omap3isp: isp_video_mbus_to_pix/pix_to_mbus fixes
    0290934d30abe drm/v3d: Set DMA segment size to avoid debug warnings
    bb09f4584aa2d spi: stm32: fix Overrun issue at < 8bpw
    acd80343470e5 gpio: pca953x: Add support for TCAL6408 TCAL6416
    bbc6e7fc432c4 media: dvb-core: dmxdevfilter must always flush bufs
    f88cd8da2d28e ASoC: SOF: ipc4: Support for sending payload along with LARGE_CONFIG_GET
    59b888198843e drm/amd/display: Don't disable DPCD mst_en if sink connected
    7df6fe98b24de drm/amd/display: Add USB-C DP Alt Mode lane limitation in DCN32
    08dca4c8099a4 spi: cadence-quadspi: Parse DT for flashes with the rest of the DT parsing
    00f77947972ed spi-geni-qcom: use xfer->bits_per_word for can_dma()
    97872d00da3cf spi-geni-qcom: initialize mode related registers to 0
    b3d6ca4f27d49 drm/amdkfd: Handle GPU reset and drain retry fault race
    0bd968c04acfb drm/panel-edp: Add AUO B140QAX01.H panel
    79c5cbeba6b0e drm/amd/display: Guard FAMS2 configuration updates
    7ad1f6f9476b5 drm/amd/display: Correct FIXED_VS Link Rate Toggle Condition
    0b7f78caeffa5 drm/amdgpu/ras: Move ras data alloc before bad page check
    a25cf4a927a7c drm/amdgpu: fix the calculation of RAS bad page number
    276028fd9b60b drm/amdgpu: fix NULL pointer issue buffer funcs
    31a1fb32f5ebd accel/amdxdna: Fix tail-pointer polling in mailbox_get_msg()
    6ca4647a74155 gpu/panel-edp: add AUO panel entry for B140HAN06.4
    d380351cbefe0 drm/xe/xe3_lpg: Apply Wa_16028005424
    49355c85b4cd9 drm/panthor: Always wait after sending a command to an AS
    4d2ccdea18b56 drm/display/dp_mst: Add protection against 0 vcpi
    86017c455e0a5 drm/xe/vm: Skip ufence association for CPU address mirror VMA during MAP
    e72721081bd1a drm/xe: Covert return of -EBUSY to -ENOMEM in VM bind IOCTL
    2583ab12055dd drm/xe/ggtt: Use scope-based runtime pm
    3db57975e9880 parisc: Prevent interrupts during reboot
    707a77b9c6fd5 x86/sev: Use kfree_sensitive() when freeing a SNP message descriptor
    45395efdf6a65 soc: imx8m: Fix error handling for clk_prepare_enable()
    4567753827088 arm64: tegra: smaug: Add usb-role-switch support
    6e1486257a2e8 EDAC/igen6: Add two Intel Amston Lake SoCs support
    3a72bf74f50a6 EDAC/igen6: Add more Intel Panther Lake-H SoCs support
    3983ef126e439 Revert "arm64: zynqmp: Add an OP-TEE node to the device tree"
    919785992a371 firmware: arm_ffa: Unmap Rx/Tx buffers on init failure
    2c99326dc1c79 pstore: ram_core: fix incorrect success return when vmap() fails
    db702ef6d9145 sched/debug: Fix updating of ppos on server write ops
    c075eb0d220da char: tpm: cr50: Remove IRQF_ONESHOT
    4fa6bfa6dc2de mailbox: bcm-ferxrm-mailbox: Use default primary handler
    aaaa758294fb1 crypto: hisilicon/qm - move the barrier before writing to the mailbox register
    a048eb4e37ea7 bpftool: Fix dependencies for static build
    aee8db5f04861 PCI/MSI: Unmap MSI-X region on error
    716f777b6c9b7 clocksource/drivers/timer-integrator-ap: Add missing Kconfig dependency on OF
    bc59d5f3afe41 clocksource/drivers/sh_tmu: Always leave device running after probe
    1088d3cb5b5ba arm64/ftrace,bpf: Fix partial regs after bpf_prog_run
    e1886b473131b perf/core: Fix slow perf_event_task_exit() with LBR callstacks
    df02c3ff3be4b bpf: Properly mark live registers for indirect jumps
    aae391a79f2a1 genirq/cpuhotplug: Notify about affinity changes breaking the affinity mask
    4c122e8ae1495 bpf: Recognize special arithmetic shift in the verifier
    c1357b496286d bpf: net_sched: Use the correct destructor kfunc type
    50d6fd69388cc bpf: crypto: Use the correct destructor kfunc type
    c67bbeb87aea0 gendwarfksyms: Fix build on 32-bit hosts
    cf9e5b8b9e312 perf/x86/intel: Add Airmont NP
    40497751c3f9b perf/x86/cstate: Add Airmont NP
    89571b4a886f6 perf/x86/msr: Add Airmont NP
    501c84f42b89d irqchip/riscv-imsic: Add a CPU pm notifier to restore the IMSIC on exit
    bad352600722f bpf: verifier improvement in 32bit shift sign extension pattern
    c6a27aa658526 sparc: don't reference obsolete termio struct for TC* constants
    6560e1d1fa324 sparc: Synchronize user stack on fork and clone
    f15b4e9286c7f block: decouple secure erase size limit from discard size limit
    ea53119b1dff2 blk-mq-sched: unify elevators checking for async requests
    40932ac2433e8 blk-mq-debugfs: add missing debugfs_mutex in blk_mq_debugfs_register_hctxs()
    d39d675a43030 xenbus: Use .freeze/.thaw to handle xenbus devices
    11d591f1d70e7 ACPI: battery: fix incorrect charging status when current is zero
    baeecf1ac9e8e ACPI: x86: s2idle: Invoke Microsoft _DSM Function 9 (Turn On Display)
    da0ce17c9d5c8 perf/cxlpmu: Replace IRQF_ONESHOT with IRQF_NO_THREAD
    8e6ea0b484fa1 s390/perf: Disable register readout on sampling events
    f5b48df92c1cf cpufreq: dt-platdev: Block the driver from probing on more QC platforms
    e8d10ef5988ea rust: cpufreq: always inline functions using build_assert with arguments
    24783dd06de87 md raid: fix hang when stopping arrays with metadata through dm-raid
    721599e837d3f md-cluster: fix NULL pointer dereference in process_metadata_update
    03e42b5f7ad4c alpha: fix user-space corruption during memory compaction
    bfc1a95012c4d io_uring/timeout: annotate data race in io_flush_timeouts()
    790a984e34f3a powercap: intel_rapl: Add PL4 support for Ice Lake
    2a9bf565d6fe4 ACPICA: Abort AML bytecode execution when executing AML_FATAL_OP
    62dfb8ac00a5c ACPI: resource: Add JWIPC JVC9100 to irq1_level_low_skip_override[]
    29f60d3d06818 ACPI: processor: Fix NULL-pointer dereference in acpi_processor_errata_piix4()
    25b290624b0e3 EFI/CPER: don't go past the ARM processor CPER record buffer
    136093ba4161e APEI/GHES: ARM processor Error: don't go past allocated memory
    6f5d41984ad89 APEI/GHES: ensure that won't go past CPER allocated record
    a8419f5f2c5f2 EFI/CPER: don't dump the entire memory region
    142c444a395f4 ntfs: ->d_compare() must not block
    6d61077981cfd x86/xen/pvh: Enable PAE mode for 32-bit guest only when CONFIG_X86_PAE is set
    c94ede3c436df rnbd-srv: Zero the rsp buffer before using it
    fd51d47fcacec arm64: Add support for TSV110 Spectre-BHB mitigation
    f4ac7292b635f perf/arm-cmn: Support CMN-600AE
    8c7fdc39e38a1 s390/purgatory: Add -Wno-default-const-init-unsafe to KBUILD_CFLAGS
    c7671c46dab46 tools/power cpupower: Reset errno before strtoull()
    f699251d5a2d9 s390/boot: Add -Wno-default-const-init-unsafe to KBUILD_CFLAGS
    f0729486c9076 tools/cpupower: Fix inverted APERF capability check
    6287eefaf21ec smb: client: prevent races in ->query_interfaces()
    2e121c53b581e gfs2: fiemap page fault fix
    327de5b59801b smb: client: add proper locking around ses->iface_last_update
    be0d85bc660af netfs: when subreq is marked for retry, do not check if it faced an error
    66c3be4ac35d5 btrfs: handle user interrupt properly in btrfs_trim_fs()
    4d49275175fdb btrfs: fallback to buffered IO if the data profile has duplication
    082083c9fbd99 dlm: validate length in dlm_search_rsb_tree
    31fefc18096cd minix: Add required sanity checking to minix_check_superblock()
    75903591f869a dlm: fix recovery pending middle conversion
    0e5806ef45f25 i3c: mipi-i3c-hci: Reset RING_OPERATION1 fields during init
    a2198bf95a4ae i3c: mipi-i3c-hci: Stop reading Extended Capabilities if capability ID is 0
    98ddff8a90f82 i3c: master: svc: Initialize 'dev' to NULL in svc_i3c_master_ibi_isr()
    67407d6abc952 hfsplus: pretend special inodes as regular files
    a2e8c144299c3 audit: add missing syscalls to read class
    c6f2c554dd8bd kselftest/kublk: include message in _Static_assert for C11 compatibility
    42c32d7571ccd fs/buffer: add alert in try_to_free_buffers() for folios without buffers
    956b1d8051cfa hfsplus: fix volume corruption issue for generic/498
    4fed776ca8637 audit: add fchmodat2() to change attributes class
    54694417d4384 hfsplus: fix volume corruption issue for generic/480
    f13680f629348 statmount: permission check should return EPERM
    f987cbd82eb4c rtc: interface: Alarm race handling should not discard preceding error
    e1105da952143 perf test: Fix test case perftool-testsuite_report for s390
    68ab096e361dd libperf build: Always place libperf includes first
    b0ae7a8272bfc perf build: Remove NO_LIBCAP that controls nothing
    7f686fb319e68 perf vendor events amd: Fix Zen 5 MAB allocation events
    13458b3b3df7a perf annotate: Fix BUILD_NONDISTRO=1 missing args->ms conversions to pointer
    8943b2c49bd8c tools headers: Go back to include asm-generic/unistd.h for arm64
    0abe77dcaca79 perf annotate: Fix memcpy size in arch__grow_instructions()
    59a7c3c9c3128 perf tests sched: Avoid error in cleanup on loaded machines
    ddbf249d9923e perf maps: Fix reference count leak in maps__find_ams()
    77c08fedf3f46 perf annotate: Fix args leak of map_symbol
    a7819ced00b9b perf cs-etm: Fix decoding for sparse CPU maps
    8d0cf138d1831 perf tools: Get debug info of DSO properly
    82b1f2b0e7abf perf symbol-elf: Fix leak of ELF files with GNU debugdata
    055b4bce85bfc rtc: max31335: use correct CONFIG symbol in IS_REACHABLE()
    46a2044778937 libsubcmd: Fix null intersection case in exclude_cmds()
    68a9c15032e8f perf callchain: Fix srcline printing with inlines
    27c53054d593c perf unwind-libdw: Fix invalid reference counts
    62f730d55aac3 perf build: Raise minimum shellcheck version to 0.7.2
    3b14096e0c9f5 perf test stat tests: Fix for virtualized machines
    b7621a279de3d perf test stat: Update test expectations and events
    df0dc1b06fb6b Linux 6.18.15
    c1f305ac054f2 netfilter: nf_tables: add .abort_skip_removal flag for set types
    2ad6657a787fe Linux 6.18.14
    bcf08144a20af ata: libata-core: fix cancellation of a port deferred qc work
    33abac5b5a530 ata: libata-eh: correctly handle deferred qc timeouts
    a488528a7182b drm/amd/display: Add an hdmi_hpd_debounce_delay_ms module
    a86c53332a81f net: stmmac: dwmac-loongson: Set clk_csr_i to 100-150MHz
    ff763ac977130 drm/amd/display: Clear HDMI HPD pending work only if it is enabled
    5566ebcf41ae1 selftests/bpf: Test bpf_skb_check_mtu(BPF_MTU_CHK_SEGS) when transport_header is not set
    73c2a1255f0fd io_uring/rsrc: clean up buffer cloning arg validation
    b20266f1880b1 Drivers: hv: vmbus: Use kthread for vmbus interrupts on PREEMPT_RT
    4949e32387fe3 drm/exynos: vidi: fix to avoid directly dereferencing user pointer
    b5fc86d753dd4 drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
    5c8e29b5208b8 ALSA: hda/realtek: Add quirk for Samsung Galaxy Book3 Pro 360 (NP965QFG)
    356a6afadb44a ALSA: hda/conexant: Fix headphone jack handling on Acer Swift SF314
    6cadda9d1921d ALSA: hda/realtek: Add quirk for Gigabyte G5 KF5 (2023)
    84dbf4feaa937 ASoC: dt-bindings: asahi-kasei,ak5558: Fix the supply names
    1c1148cbebad2 ASoC: dt-bindings: asahi-kasei,ak4458: Fix the supply names
    8562d921e4eeb ASoC: dt-bindings: asahi-kasei,ak4458: set unevaluatedProperties:false
    a16695e3ac32d dt-bindings: media: qcom,qcs8300-camss: Add missing power supplies
    05072d352ed10 dt-bindings: phy: qcom-edp: Add missing clock for X Elite
    c20f925214249 SUNRPC: fix gss_auth kref leak in gss_alloc_msg error path
    d79b9097a6a2b SUNRPC: auth_gss: fix memory leaks in XDR decoding error paths
    888cd7e40adb2 ata: libata-scsi: avoid Non-NCQ command starvation
    410336fc82ac9 ata: libata-scsi: refactor ata_scsi_translate()
    62a16b2e3ce9b ata: pata_ftide010: Fix some DMA timings
    3be216fd6f89e ext4: use optimized mballoc scanning regardless of inode format
    34c803edc0b33 ext4: always allocate blocks only from groups inode can use
    3924aea2c33df ext4: fix dirtyclusters double decrement on fs shutdown
    29a07d691d282 ext4: fix e4b bitmap inconsistency reports
    12615ab4bfb69 ext4: fix memory leak in ext4_ext_shift_extents()
    808f3191498f3 ext4: drop extent cache when splitting extent fails
    c2ee51d684adc ext4: drop extent cache after doing PARTIAL_VALID1 zeroout
    5b1f429045331 ext4: don't cache extent during splitting extent
    d67c8ecf3d8fd ext4: don't zero the entire extent if EXT4_EXT_DATA_PARTIAL_VALID1
    f86ddca5e4197 ext4: subdivide EXT4_EXT_DATA_VALID1
    561834f6d6f52 MIPS: Work around LLVM bug when gp is used as global register variable
    fc086c0ce3db0 usb: cdns3: fix role switching during resume
    557f65399133f drm/amd/display: Use same max plane scaling limits for all 64 bpp formats
    9fbb4f14462f0 ASoC: rockchip: i2s-tdm: Use param rate if not provided by set_sysclk
    7e92f716a55bf x86/hyperv: Fix error pointer dereference
    d7cf2314dd5e8 btrfs: fix invalid leaf access in btrfs_quota_enable() if ref key not found
    6ca11deb6c944 btrfs: use the correct type to initialize block reserve for delayed refs
    55d02a533a8ae btrfs: reset block group size class when it becomes empty
    74fcfce2a5eee btrfs: reduce block group critical section in btrfs_free_reserved_bytes()
    38944f3c50061 btrfs: remove fs_info argument from btrfs_try_granting_tickets()
    9b18bf59977f5 efi: Fix reservation of unaccepted memory table
    7098d3743105f gpio: amd-fch: ionly return allowed values from amd_fch_gpio_get()
    778f326af79f5 drm/xe/bo: Redirect faults to dummy page for wedged device
    ed945276a76e9 drm/xe: Make xe_modparam.force_vram_bar_size signed
    940b8daa52906 drm/xe/xe2_hpg: Fix handling of Wa_14019988906 & Wa_14019877138
    ef074e9bee055 drm/xe/mmio: Avoid double-adjust in 64-bit reads
    5ba475d1f3419 drm/xe/configfs: Fix 'parameter name omitted' errors
    0c42190a2f269 s390/kexec: Make KEXEC_SIG available when CONFIG_MODULES=n
    0f93a80eb3fd5 spi: wpcm-fiu: Fix potential NULL pointer dereference in wpcm_fiu_probe()
    263e28add4f44 drm/amd/display: Fix out-of-bounds stream encoder index v3
    8eb62f5adc12b drm/amd/display: Reject cursor plane on DCE when scaled differently than primary
    2b36c0c1bcbbe drm/amdkfd: Fix watch_id bounds checking in debug address watch v2
    96f42087b0580 PCI: Validate window resource type in pbus_select_window_for_type()
    e37630e34e246 ASoC: codecs: aw88261: Fix erroneous bitmask logic in Awinic init
    63680351142e8 drm/i915/acpi: free _DSM package when no connectors
    9a2a5da002775 ASoC: fsl_xcvr: Revert fix missing lock in fsl_xcvr_mode_put()
    a62afa5a595ec mshv: fix SRCU protection in irqfd resampler ack handler
    ca2eff3617860 drm/amdgpu/sdma6: enable queue resets unconditionally
    5211aa12e46fc drm/amdgpu/sdma5.2: enable queue resets unconditionally
    0d8ba96c792fc drm/amdgpu/sdma5: enable queue resets unconditionally
    3759040d6d7c1 drm/amdgpu: move reset debug disable handling
    2fef8c2ac67e7 drm/amdgpu: Fix memory leak in amdgpu_ras_init()
    9ae85b0c1909b drm/amdgpu: Use kvfree instead of kfree in amdgpu_gmc_get_nps_memranges()
    d1370ef2ecf7d drm/amdgpu: Fix memory leak in amdgpu_acpi_enumerate_xcc()
    aebd195e93052 apparmor: fix aa_label to return state from compount and component match
    1d2b2b58fde90 apparmor: fix invalid deref of rawdata when export_binary is unset
    80c334acc6d0b apparmor: avoid per-cpu hold underflow in aa_get_buffer
    4610d536ff097 apparmor: make label_match return a consistent value
    9ef25645775b4 apparmor: remove apply_modes_to_perms from label_match
    9bf1fa150775b apparmor: fix rlimit for posix cpu timers
    b2a8011ae8749 apparmor: move check for aa_null file to cover all cases
    7757757908e03 apparmor: account for in_atomic removal in common_file_perm
    f3cb5e58a65d5 apparmor: drop in_atomic flag in common_mmap, and common_file_perm
    1eadeb462ec36 apparmor: fix boolean argument in apparmor_mmap_file
    ac8f179e5c9ee apparmor: return -ENOMEM in unpack_perms_table upon alloc failure
    e027999049c49 apparmor: Fix & Optimize table creation from possibly unaligned memory
    23f112bd6144e AppArmor: Allow apparmor to handle unaligned dfa tables
    ccb66a3c6c8f5 apparmor: fix NULL sock in aa_sock_file_perm
    fea017a7f6abe apparmor: fix NULL pointer dereference in __unix_needs_revalidation
    d80311e398ebe net/mlx5e: Use unsigned for mlx5e_get_max_num_channels
    4329514c61abe net/mlx5e: Fix deadlocks between devlink and netdev instance locks
    54522509cb9aa net/mlx5: Fix misidentification of write combining CQE during poll loop
    b13e896fc47e0 net/mlx5: Fix multiport device check over light SFs
    fef13c403be3f bonding: alb: fix UAF in rlb_arp_recv during bond up/down
    02baf80d1e333 bnge: fix reserving resources from FW
    f5a1f13c9e0fd eth: fbnic: Advertise supported XDP features.
    72726d22786bb octeontx2-af: Fix default entries mcam entry action
    9be9100774b51 ipv6: icmp: remove obsolete code in icmpv6_xrlim_allow()
    66036be40f7f7 inet: move icmp_global_{credit,stamp} to a separate cache line
    2c7384dbfd6a4 icmp: prevent possible overflow in icmp_global_allow()
    d7eaa006c0444 eth: fbnic: Add validation for MTU changes
    d34f7a8aa9a25 macvlan: observe an RCU grace period in macvlan_common_newlink() error path
    2a06576b611e2 selftests: tc_actions: don't dump 2MB of \0 to stdout
    d96b0d661ef04 ping: annotate data-races in ping_lookup()
    4e34deebfb880 net: psp: select CONFIG_SKB_EXTENSIONS
    5c939ebbd72f4 bpftool: Fix truncated netlink dumps
    71b5fc8e8e17e ipv6: fix a race in ip6_sock_set_v6only()
    dbd0af8083dd2 netfilter: nf_tables: fix use-after-free in nf_tables_addchain()
    50422613185d5 net: remove WARN_ON_ONCE when accessing forward path array
    bae53b3baf2ff ipvs: do not keep dest_dst if dev is going down
    9a6b2ba7367f4 netfilter: nf_conntrack_h323: don't pass uninitialised l3num value
    96815220626b2 selftests: forwarding: vxlan_bridge_1d_ipv6: fix test failure with br_netfilter enabled
    a6187e1d47f35 selftests: forwarding: vxlan_bridge_1d: fix test failure with br_netfilter enabled
    fae260fc84e1e net: bridge: mcast: always update mdb_n_entries for vlan contexts
    0243552735937 net/rds: rds_sendmsg should not discard payload_len
    654780dee9eae xen-netback: reject zero-queue configuration from guest
    36c28b028efba net: usb: catc: enable basic endpoint checking
    f998b2c4bec48 ovpn: tcp - don't deref NULL sk_socket member after tcp_close()
    c55ba7501f97d eth: fbnic: set DMA_HINT_L4 for all flows
    aa090d2346def eth: fbnic: increase FBNIC_HDR_BYTES_MIN from 128 to 256 bytes
    9f441ef914527 eth: fbnic: set FBNIC_QUEUE_RDE_CTL0_EN_HDR_SPLIT on RDE_CTL0
    9f9600daaa49e eth: fbnic: Configure RDE settings for pause frame
    ca2a44b31c4d4 bpf: Add a map/btf from a fd array more consistently
    eac65c272f3b4 bpf: Fix a potential use-after-free of BTF object
    068708543a851 libbpf: Fix invalid write loop logic in bpf_linker__add_buf()
    223cfef4812bd fbnic: close fw_log race between users and teardown
    37954733984f6 net: sparx5/lan969x: fix PTP clock max_adj value
    03b5051e02f5a ipv6: Fix out-of-bound access in fib6_add_rt2node().
    d1410317337c9 selftests: netconsole: Increase port listening timeout
    a0070e9635fd5 selftests: netconsole: remove log noise due to socat exit
    51c32ae7fae14 net: mscc: ocelot: add missing lock protection in ocelot_port_xmit_inj()
    2a90d6b837003 net: mscc: ocelot: split xmit into FDMA and register injection paths
    6eb26695a4b20 net: mscc: ocelot: extract ocelot_xmit_timestamp() helper
    fa79b29cc926c net: sparx5/lan969x: fix DWRR cost max to match hardware register width
    b1f23df09e7db net: stmmac: fix oops when split header is enabled
    9e9f1263e210d net: stmmac: replace has_xxxx with core_type
    ee231568d57dc net: stmmac: remove broken PCS code
    87b7321ddc7d0 selftests: net: lib: Fix jq parsing error
    dfd9571c31ef1 selftests: mlxsw: tc_restrictions: Fix test failure with new iproute2
    f4edf0c7d2169 ovpn: fix VPN TX bytes counting
    3e4fbcb4e0789 ovpn: fix possible use-after-free in ovpn_net_xmit
    6f076ba274e29 ovpn: set sk_user_data before overriding callbacks
    63ae78336f40b cpuidle: Skip governor when only one idle state is available
    b800728a8aef6 ACPI: PM: Add unused power resource quirk for THUNDEROBOT ZERO
    43fcc84cd9710 objpool: fix the overestimation of object pooling metadata size
    f6bc23794fa05 selftests/memfd: use IPC semaphore instead of SIGSTOP/SIGCONT
    f056c340b7396 kbuild: Add objtool to top-level clean target
    ba16fb47e8975 powercap: intel_rapl_tpmi: Remove FW_BUG from invalid version check
    02978747e9072 ACPI: CPPC: Fix remaining for_each_possible_cpu() to use online CPUs
    78942172d5bff fs/ntfs3: Fix slab-out-of-bounds read in DeleteIndexEntryRoot
    4bf3bafb8e063 fs/ntfs3: prevent infinite loops caused by the next valid being the same
    5a30cc03bde16 fs/ntfs3: Initialize new folios before use
    5e573e7783641 io_uring/cancel: de-unionize file and user_data in struct io_cancel_data
    a9d157a9bd38e io_uring: delay sqarray static branch disablement
    c766477992722 drbd: always set BLK_FEAT_STABLE_WRITES
    bda2448711795 dmaengine: fsl-edma: don't explicitly disable clocks in .remove()
    0832e88bc69f7 backlight: qcom-wled: Change PM8950 WLED configurations
    54540e574092d backlight: qcom-wled: Support ovp values for PMI8994
    784936cad37ba leds: qcom-lpg: Check the return value of regmap_bulk_write()
    4f45047e3bf0a leds: expresswire: Fix chip state breakage
    3c7d637bfc3df pinctrl: canaan: k230: Fix NULL pointer dereference when parsing devicetree
    e2e367e56bacb pinctrl: single: fix refcount leak in pcs_add_gpio_func()
    fc356d8c3042f pinctrl: meson: amlogic-a4: Fix device node reference leak in bank helpers
    a851ed0ff9015 pinctrl: qcom: sm8250-lpass-lpi: Fix i2s2_data_groups definition
    7446125afb6d9 pidfs: return -EREMOTE when PIDFD_GET_INFO is called on another ns
    21aff1255d728 mips: LOONGSON32: drop a dangling Kconfig symbol
    517d9f2b96308 iio: sca3000: Fix a resource leak in sca3000_probe()
    8ae999c410e2b ovl: Fix uninit-value in ovl_fill_real
    a5f1f8ebc6e2a pinctrl: equilibrium: Fix device node reference leak in pinbank_init()
    18a3ebff869c9 mcb: fix incorrect sanity check
    ab08bb8363b46 nvmem: an8855: drop an unused Kconfig symbol
    0c930fcadb2fe usb: bdc: fix sleep during atomic
    9b8c7a25809ef drivers: iio: mpu3050: use dev_err_probe for regulator request
    bedc5b06493cc mfd: simple-mfd-i2c: Add Delta TN48M CPLD support
    5a4923726a165 mfd: arizona: Fix regulator resource leak on wm5102_clear_write_sequencer() failure
    8e7d8aca8811a Revert "mmc: rtsx_pci_sdmmc: increase power-on settling delay to 5ms"
    38a07194bbcdd coresight: tmc-etr: Fix race condition between sysfs and perf mode
    dd8b9ba3d9701 phy: freescale: imx8qm-hsio: fix NULL pointer dereference
    1bec5f283dd5e coresight: etm3x: Fix cpulocked warning on cpuhp
    8665e18a707ca watchdog: starfive-wdt: Fix PM reference leak in probe error path
    a75046f2efadc iio: pressure: mprls0025pa: fix pressure calculation
    b61512ff73d28 iio: pressure: mprls0025pa: fix scan_type struct
    0beeade4823bc iio: pressure: mprls0025pa: fix interrupt flag
    285af88d5da16 iio: pressure: mprls0025pa: fix SPI CS delay violation
    664ffdf34c018 iio: pressure: mprls0025pa: fix spi_transfer struct initialisation
    37fb15537cc05 mmc: rtsx_pci_sdmmc: increase power-on settling delay to 5ms
    9c97fcfb7a62d gpib: Fix memory leak in ni_usb_init()
    b30ba62cafd8b gpib: Fix error code in ni_usb_write_registers()
    5ca0f7b371837 gpib: Fix error code in ibonline()
    12679ed78c09b serial: SH_SCI: improve "DMA support" prompt
    3f8b835a63341 serial: imx: change SERIAL_IMX_CONSOLE to bool
    06162d85f8305 staging: greybus: lights: avoid NULL deref
    c7f7b55ce2ad8 usb: typec: ucsi: drop an unused Kconfig symbol
    b244fbf3ff829 iio: test: drop dangling symbol in gain-time-scale helpers
    ac00f8a0cb157 soundwire: intel_ace2x: add SND_HDA_CORE dependency
    621a8bf292ede char: misc: Use IS_ERR() for filp_open() return value
    05ce13d78226b phy: rockchip: samsung-hdptx: Pre-compute HDMI PLL config for 461.10125 MHz output
    ccc29a067399e dma: dma-axi-dmac: fix HW scatter-gather not looking at the queue
    dd1e96fd9f60a dma: dma-axi-dmac: fix SW cyclic transfers
    b0ce68420da60 dmaengine: mediatek: uart-apdma: Fix above 4G addressing TX/RX
    2f0d9a5d552c6 interconnect: mediatek: Aggregate bandwidth with saturating add
    86e6547ac6c4d interconnect: mediatek: Don't hijack parent device
    52e4ac51e3fa7 clk: zynqmp: pll: Fix zynqmp_clk_divider_determine_rate kerneldoc
    d53b019a60031 clk: zynqmp: divider: Fix zynqmp_clk_divider_determine_rate kerneldoc
    71e5335fcec08 clk: mediatek: Fix error handling in runtime PM setup
    6e5379c3b5457 clk: mediatek: Add mfg_eb as parent to mt8196 mfgpll clocks
    1debd9ba7eb18 clk: mediatek: Drop __initconst from gates
    053490ddace34 clk: zynqmp: divider: convert from divider_round_rate() to divider_determine_rate()
    df502559b1249 clk: x86: cgu: convert from divider_round_rate() to divider_determine_rate()
    ccab4798a64fd clk: versaclock3: convert from divider_round_rate() to divider_determine_rate()
    c632744ff0af4 clk: stm32: stm32-core: convert from divider_round_rate_parent() to divider_determine_rate()
    29781f258a9f1 clk: stm32: stm32-core: convert from divider_ro_round_rate() to divider_ro_determine_rate()
    141fd6e372781 clk: sprd: div: convert from divider_round_rate() to divider_determine_rate()
    aab1749732515 clk: sophgo: sg2042-clkgen: convert from divider_round_rate() to divider_determine_rate()
    73fbacf475886 clk: nxp: lpc32xx: convert from divider_round_rate() to divider_determine_rate()
    7f487ccf58b02 clk: nuvoton: ma35d1-divider: convert from divider_round_rate() to divider_determine_rate()
    199625f9734ff clk: milbeaut: convert from divider_round_rate() to divider_determine_rate()
    c05f9dfa6959d clk: loongson1: convert from divider_round_rate() to divider_determine_rate()
    0a5c1dff51150 clk: hisilicon: clkdivider-hi6220: convert from divider_round_rate() to divider_determine_rate()
    aa1ed67e58426 clk: bm1880: convert from divider_round_rate() to divider_determine_rate()
    d4274c2df180e clk: actions: owl-divider: convert from divider_round_rate() to divider_determine_rate()
    bfcc7cc9c36ca clk: actions: owl-composite: convert from owl_divider_helper_round_rate() to divider_determine_rate()
    aed53da569fb9 clk: qcom: gfx3d: add parent to parent request map
    e5001c92fc866 clk: qcom: dispcc-sm7150: Fix dispcc_mdss_pclk1_clk_src
    aeb606d885ef6 clk: qcom: dispcc-sdm845: Enable parents for pixel clocks
    2a01a346d20ed clk: qcom: regmap-divider: convert from divider_round_rate() to divider_determine_rate()
    22d691c02ad5c clk: qcom: regmap-divider: convert from divider_ro_round_rate() to divider_ro_determine_rate()
    cdab39223d57e clk: Move clk_{save,restore}_context() to COMMON_CLK section
    4fdbb1e3ffa36 Input: adp5589 - remove a leftover header file
    8ed504f525f1b clk: microchip: core: remove duplicate determine_rate on pic32_sclk_ops
    0533f1cdb382d clk: rockchip: Fix error pointer check after rockchip_clk_register_gate_link()
    0b45cddb73855 clk: qcom: alpha-pll: convert from divider_round_rate() to divider_determine_rate()
    87fa98532b45b clk: qcom: gcc-ipq5018: flag sleep clock as critical
    b88e84b154b97 clk: qcom: gcc-msm8917: Remove ALWAYS_ON flag from cpp_gdsc
    9dbd33356e3d9 clk: qcom: gcc-msm8953: Remove ALWAYS_ON flag from cpp_gdsc
    a9d771adb49a1 clk: qcom: gcc-glymur: Update the SDCC RCGs to use shared_floor_ops
    8d7df9126dad4 clk: qcom: gcc-qdu1000: Update the SDCC RCGs to use shared_floor_ops
    357bdc307c5a1 clk: qcom: gcc-x1e80100: Update the SDCC RCGs to use shared_floor_ops
    16a21335eff9c clk: qcom: gcc-milos: Update the SDCC RCGs to use shared_floor_ops
    76d5437ca4d0b clk: qcom: gcc-sdx75: Update the SDCC RCGs to use shared_floor_ops
    37babf26bfb57 clk: qcom: gcc-sm4450: Update the SDCC RCGs to use shared_floor_ops
    7873e2a407a03 clk: qcom: gcc-sm8750: Update the SDCC RCGs to use shared_floor_ops
    527508eb5712d clk: qcom: gcc-sm8450: Update the SDCC RCGs to use shared_floor_ops
    1bc262014a14a clk: meson: g12a: Limit the HDMI PLL OD to /4
    e82d721b05e07 clk: meson: gxbb: Limit the HDMI PLL OD to /4 on GXL/GXM SoCs
    f7b0686119fd2 clk: qcom: rcg2: compute 2d using duty fraction directly
    aa14e76038353 clk: qcom: gcc-sm8650: Use floor ops for SDCC RCGs
    b714c1d0bb437 clk: qcom: gcc-sm8550: Use floor ops for SDCC RCGs
    e9ed7237b8249 clk: spacemit: Respect Kconfig setting when building modules
    19eb98a970c90 clk: thead: th1520-ap: Poll for PLL lock and wait for stability
    3d4202ee6494c fbdev: au1200fb: Fix a memory leak in au1200fb_drv_probe()
    e76a2f1d40ea9 fbdev: of_display_timing: Fix device node reference leak in of_get_display_timings()
    2cafad617431f Revert "mailbox/pcc: support mailbox management of the shared buffer"
    9a10843740d77 remoteproc: imx_dsp_rproc: Only reset carveout memory at RPROC_OFFLINE state
    ca8f2551772d1 tracing: Remove duplicate ENABLE_EVENT_STR and DISABLE_EVENT_STR macros
    335dfe4bc6368 tracing: Properly process error handling in event_hist_trigger_parse()
    47d3fed638664 fs/nfs: Fix readdir slow-start regression
    e568088337e5a nvdimm: virtio_pmem: serialize flush requests
    25ab5e97d3c5f scsi: csiostor: Fix dereference of null pointer rn
    77794465365bf scsi: ufs: host: mediatek: Require CONFIG_PM
    e5579ebaadc7b scsi: smartpqi: Fix memory leak in pqi_report_phys_luns()
    48cb99e745614 pNFS: fix a missing wake up while waiting on NFS_LAYOUT_DRAIN
    7bc44485182c2 RDMA/uverbs: Add __GFP_NOWARN to ib_uverbs_unmarshall_recv() kmalloc
    f354f16e96989 power: supply: qcom_battmgr: Recognize "LiP" as lithium-polymer
    47abfc207ab02 power: supply: pm8916_lbc: Fix use-after-free for extcon in IRQ handler
    ac092258d0d6b hisi_acc_vfio_pci: fix VF reset timeout issue
    980aa1f8d0dd1 mtd: spinand: Fix kernel doc
    39b74ec0869f5 mtd: parsers: ofpart: fix OF node refcount leak in parse_fixed_partitions()
    eacca14125875 cxl: Fix premature commit_end increment on decoder commit failure
    cc66fc9b5cf7f RDMA/core: add rdma_rw_max_sge() helper for SQ sizing
    5ae9da022ee3c RDMA/rxe: Fix race condition in QP timer handlers
    b2bc649c18fbe RDMA/mlx5: Fix memory leak in GET_DATA_DIRECT_SYSFS_PATH handler
    bf4454da8b1e7 RDMA/uverbs: Validate wqe_size before using it in ib_uverbs_post_send
    409c2c5508f3d RDMA/rxe: Fix iova-to-va conversion for MR page sizes != PAGE_SIZE
    02f720109fed5 cxl/core: Fix cxl_dport debugfs EINJ entries
    055cd68b8ebbd NFS/localio: remove -EAGAIN handling in nfs_local_doio()
    1d6933f32b297 NFS/localio: use GFP_NOIO and non-memreclaim workqueue in nfs_local_commit
    ae26a4cf2baf0 NFS/localio: prevent direct reclaim recursion into NFS via nfs_writepages
    c627769730e98 NFS/localio: Handle short writes by retrying
    ec121ad626c31 mtd: parsers: Fix memory leak in mtd_parser_tplink_safeloader_parse()
    eb0e8003d9a03 crypto: ccp - Send PSP_CMD_TEE_RING_DESTROY when PSP_CMD_TEE_RING_INIT fails
    eb5263f3f8e48 crypto: ccp - Factor out ring destroy handling to a helper
    10eef0f932387 crypto: ccp - Add an S4 restore flow
    b3010ff068fad crypto: ccp - Declare PSP dead if PSP_CMD_TEE_RING_INIT fails
    7c28e27896977 platform/x86/amd/pmf: Prevent TEE errors after hibernate
    8269e0ee89bd8 vfio/pci: Lock upstream bridge for vfio_pci_core_disable()
    721bd22bcf45a mtd: intel-dg: Fix accessing regions before setting nregions
    4d02e3870c88f mtd: rawnand: cadence: Fix return type of CDMA send-and-wait helper
    9b0927c9b91b4 IB/mlx5: Fix port speed query for representors
    6d838873da9cb RDMA/mlx5: Fix UMR hang in LAG error state unload
    71b23ada25b33 tools/power/x86/intel-speed-select: Fix file descriptor leak in isolate_cpus()
    d9aefb386fdc4 platform/x86: hp-wmi: fix platform profile values for Omen 16-wf1xxx
    eb715133e0ae1 RDMA/iwcm: Fix workqueue list corruption by removing work_list
    5c07aef09a121 RDMA/rxe: Fix double free in rxe_srq_from_init
    33e396029002b RDMA/rtrs-srv: fix SG mapping
    c0def811ad8d6 power: supply: wm97xx: Fix NULL pointer dereference in power_supply_changed()
    64327c46f2551 power: supply: bq27xxx: fix wrong errno when bus ops are unsupported
    a465a14992228 power: reset: nvmem-reboot-mode: respect cell size for nvmem_cell_write
    861dda7a9074c power: supply: sbs-battery: Fix use-after-free in power_supply_changed()
    64e15155095f3 power: supply: rt9455: Fix use-after-free in power_supply_changed()
    08e674e9862a2 power: supply: pm8916_lbc: Fix use-after-free in power_supply_changed()
    a8b7117ae3a79 power: supply: pm8916_bms_vm: Fix use-after-free in power_supply_changed()
    8c89aade8335e power: supply: goldfish: Fix use-after-free in power_supply_changed()
    2841bbb5a35c4 power: supply: cpcap-battery: Fix use-after-free in power_supply_changed()
    03d1e4ee4e6aa power: supply: bq25980: Fix use-after-free in power_supply_changed()
    4b6fb0b6124f5 power: supply: bq256xx: Fix use-after-free in power_supply_changed()
    f27eb76def5c0 power: supply: act8945a: Fix use-after-free in power_supply_changed()
    709db4b476e25 power: supply: ab8500: Fix use-after-free in power_supply_changed()
    9b82bdb9e7c93 cxl/mem: Fix devm_cxl_memdev_edac_release() confusion
    51c89a5247bf5 RDMA/mlx5: Fix ucaps init error flow
    8bf968d68ea6c RDMA/hns: Notify ULP of remaining soft-WCs during reset
    4994b9be17ff7 RDMA/hns: Fix RoCEv1 failure due to DSCP
    0cbec8b49270f RDMA/hns: Fix WQ_MEM_RECLAIM warning
    38e2c5ad6f117 IB/cache: update gid cache on client reregister event
    d273d9cedd78d RDMA/rtrs: server: remove dead code
    365996a2b14d0 af_unix: Fix memleak of newsk in unix_stream_connect().
    08b10c468962c octeontx2-pf: Unregister devlink on probe failure
    8abc12ce2573e net: renesas: rswitch: fix forwarding offload statemachine
    1d4f8092bd785 ionic: Rate limit unknown xcvr type messages
    a16bea45d758e octeon_ep_vf: ensure dbell BADDR updation
    13a61502c1c83 octeon_ep: ensure dbell BADDR updation
    1b8e3c8b74436 octeon_ep: disable per ring interrupts
    c8c197aaa56b2 serial: caif: fix use-after-free in caif_serial ldisc_close()
    1c9ef28f643cc xfrm: fix ip_rt_bug race in icmp_route_lookup reverse path
    d8c851cd32452 net: sunhme: Fix sbus regression
    69d3f9ee5489e net: atm: fix crash due to unvalidated vcc pointer in sigd_send()
    03462247e3b65 smb: client: correct value for smbd_max_fragmented_recv_size
    4f9ae386861e2 procfs: fix missing RCU protection when reading real_parent in do_task_stat()
    fdbccddb7e782 net: hns3: fix double free issue for tx spare buffer
    9a4d6c37cb128 dpll: zl3073x: Fix output pin phase adjustment sign
    072cec234a877 dpll: zl3073x: Cache all output properties in zl3073x_out
    9116bb0e0c9f8 dpll: zl3073x: Split ref, out, and synth logic from core
    84b8990f5771d dpll: zl3073x: Store raw register values instead of parsed state
    40bcd1fa0e23c dpll: zl3073x: Specify phase adjustment granularity for pins
    f399e8af187a8 dpll: add phase-adjust-gran pin attribute
    782368c13f5a3 PCI: Add ACS quirk for Pericom PI7C9X2G404 switches [12d8:b404]
    12b1681793e9b netfilter: nft_set_rbtree: validate open interval overlap
    90cbb8561aee0 netfilter: nft_set_rbtree: validate element belonging to interval
    3c40cc71cec7a netfilter: nft_set_rbtree: don't gc elements on insert
    89a3f393ab0d9 netfilter: nft_set_rbtree: remove seqcount_rwlock_t
    e4ea5be0b35fd netfilter: nft_set_rbtree: use binary search array in get command
    36ed9b6e39611 netfilter: nft_set_rbtree: translate rbtree to array for binary search
    dad14d22dff1a netfilter: nft_set_rbtree: check for partial overlaps in anonymous sets
    40a7afde2f536 netfilter: nft_set_rbtree: fix bogus EEXIST with NLM_F_CREATE with null interval
    735ad034f1dcb netfilter: nft_counter: fix reset of counters on 32bit archs
    6f2d238faff01 netfilter: nft_set_hash: fix get operation on big endian
    23901aa6b8a2f netfilter: nfnetlink_queue: do shared-unconfirmed check before segmentation
    870e3e63da8e8 netfilter: nfnetlink_queue: optimize verdict lookup with hash table
    276820278e971 nfc: hci: shdlc: Stop timers and work before freeing context
    531c1aec81bfe inet: RAW sockets using IPPROTO_RAW MUST drop incoming ICMP
    67b75bb0ec55a bonding: only set speed/duplex to unknown, if getting speed failed
    9c3398e5b3a91 octeontx2-af: Fix PF driver crash with kexec kernel booting
    1fff00261c788 mptcp: fix receive space timestamp initialization
    fb7bf00b04a6b mptcp: do not account for OoO in mptcp_rcvbuf_grow()
    10a66a44e3691 of: unittest: fix possible null-pointer dereferences in of_unittest_property_copy()
    b8856aba0fb03 tcp: accecn: handle unexpected AccECN negotiation feedback
    2ff45b29f37ed tcp: disable RFC3168 fallback identifier for CC modules
    69484fd350be4 tcp: ECT_1_NEGOTIATION and NEEDS_ACCECN identifiers
    817780cb3f555 jfs: avoid -Wtautological-constant-out-of-range-compare warning
    b4374b0bed103 ucount: check for CAP_SYS_RESOURCE using ns_capable_noaudit()
    8fd58e0a0f040 ipc: don't audit capability check in ipc_permissions()
    f5efb397c8f93 selftests/mm: fix usage of FORCE_READ() in cow tests
    4a0d8d3729152 PCI/ACPI: Restrict program_hpx_type2() to AER bits
    dbe723b480e47 PCI: Initialize RCB from pci_configure_device()
    da289440f04c9 wifi: ath12k: clear stale link mapping of ahvif->links_map
    474e93f4a5aa5 wifi: ath12k: Fix index decrement when array_len is zero
    0e0ca8dbfef90 wifi: ath11k: add usecase firmware handling based on device compatible
    134bd7f7e42f8 wifi: ath10k: sdio: add missing lock protection in ath10k_sdio_fw_crashed_dump()
    8fb1dc2963780 PCI: Check parent for NULL in of_pci_bus_release_domain_nr()
    adc2deacdd819 tcp: tcp_tx_timestamp() must look at the rtx queue
    2a9370693b1ce PCI: Remove old_size limit from bridge window sizing
    b855d99486219 PCI: Stop over-estimating bridge window size
    d5de3e34dcb5a PCI: Rewrite bridge window head alignment function
    17866f8a0822d fat: avoid parent link count underflow in rmdir
    a77e945c528f0 rust: task: restrict Task::group_leader() to current
    bd1d06eaad53d lib/kstrtox: fix kstrtobool() docstring to mention enabled/disabled
    d75ec4504a434 nfsd: never defer requests during idmap lookup
    b29094276ab22 xdrgen: Remove inclusion of nlm4.h header
    b633683dc0d4c xdrgen: Initialize data pointer for zero-length items
    59d23891cdba5 NFS: NFSERR_INVAL is not defined by NFSv2
    59409c5958b20 xdrgen: Fix struct prefix for typedef types in program wrappers
    1bd726fa8f5cf dm: use bio_clone_blkg_association
    d2138abc8f0a7 iommu/vt-d: Clear Present bit before tearing down context entry
    821807c167b7b iommu/vt-d: Clear Present bit before tearing down PASID entry
    36244dfd3853f iommu/vt-d: Flush cache for PASID table before using it
    53336a811485a wifi: rtw89: debug: Fix memory leak in __print_txpwr_map()
    e532247834428 PCI: Mark 3ware-9650SA Root Port Extended Tags as broken
    feef0143ec5e9 kallsyms/ftrace: set module buildid in ftrace_mod_address_lookup()
    7f4827b247500 module: add helper function for reading module_buildid()
    34de49d09775a kallsyms/bpf: rename __bpf_address_lookup() to bpf_address_lookup()
    536ffc371b52e netfilter: nf_conncount: fix tracking of connections from localhost
    a0cdcacc0d414 netfilter: nft_compat: add more restrictions on netlink attributes
    6e5fa7add3e76 netfilter: nf_conncount: increase the connection clean up limit to 64
    ab455baa7420f netfilter: nf_conncount: make nf_conncount_gc_list() to disable BH
    0d7ccd3d16ad0 netfilter: nf_tables: reset table validation state on abort
    f1f9aea372976 ext4: fast commit: make s_fc_lock reclaim-safe
    59f10fa502ee7 wifi: cfg80211: stop NAN and P2P in cfg80211_leave
    6ff2ebfef75fb mctp i2c: initialise event handler read bytes
    c1116859a7f46 net: mctp-i2c: fix duplicate reception of old data
    02bb1500f1479 quota: fix livelock between quotactl and freeze_super
    7379837c3f9ef wifi: ath12k: do WoW offloads only on primary link
    5a0b892ac90d0 wifi: ath9k: add OF dependency to AHB
    a44220e4eba35 PCI/P2PDMA: Reset page reference count when page mapping fails
    5b1f6531d4a12 PCI/PTM: Fix pcie_ptm_create_debugfs() memory leak
    aeddfb00bb83c dm: use READ_ONCE in dm_blk_report_zones
    7a3385e97af2b dm: fix unlocked test for dm_suspended_md
    5d0a2a2ce94b5 PCI/portdrv: Fix potential resource leak
    1af76378577e0 PCI: sophgo: Disable L0s and L1 on Sophgo 2044 PCIe Root Ports
    ef42c53b7a284 PCI: Do not attempt to set ExtTag for VFs
    1938bf90c1dd0 Documentation: tracing: Add PCI tracepoint documentation
    eb9aa9f801046 PCI/P2PDMA: Fix p2pmem_alloc_mmap() warning condition
    e19cce88ec4c4 PCI/P2PDMA: Release per-CPU pgmap ref when vm_insert_page() fails
    2108e783a7cf2 wifi: cfg80211: Fix use_for flag update on BSS refresh
    d072c2c82322e PCI/PM: Avoid redundant delays on D3hot->D3cold
    ed0ef3d0c92d8 Documentation: PCI: endpoint: Fix ntb/vntb copy & paste errors
    004288f3b24eb PCI: xilinx: Fix INTx IRQ domain leak in error paths
    4e8e7080b5579 PCI: mediatek: Fix IRQ domain leak when MSI allocation fails
    d1878562a41fd hwmon: (pmbus/mpq8785) fix VOUT_MODE mismatch during identification
    14a38784e09ae Revert "hwmon: (ibmpex) fix use-after-free in high/low store"
    98c6a053b6d38 spi: tools: Add include folder to .gitignore
    81190b2e9d04b ASoC: SDCA: Handle volatile controls correctly
    97b513d04e116 ASoC: SDCA: Force some SDCA Controls to be volatile
    32606d55ffc1a ASoC: SDCA: Remove outdated todo comment
    59be162822e56 accel/amdxdna: Fix incorrect error code returned for failed chain command
    feb4bcfd40528 HID: intel-ish-hid: fix NULL-ptr-deref in ishtp_bus_remove_all_clients
    5a68d2c99c859 accel/amdxdna: Fix memory leak in amdxdna_ubuf_map
    b79d31dce49b5 accel/amdxdna: Stop job scheduling across aie2_release_resource()
    f6b4c1d98a7b8 accel/amdxdna: Hold mm structure across iommu_sva_unbind_device()
    e6ff5e9e39005 platform/chrome: cros_ec_lightbar: Fix response size initialization
    52b71d0253978 ASoC: tegra: Add AHUB writeable_reg for RX holes
    a3ce2b030809f mm/slab: fix false lockdep warning in __kfree_rcu_sheaf()
    aa27ad4e20e0a drm/xe: Unregister drm device on probe error
    c287399b66c00 drm/xe/ptl: Disable DCC on PTL
    ede7b0f33c5a6 evm: Use ordered xattrs list to calculate HMAC in evm_init_hmac()
    5332491be2ca1 media: uvcvideo: Fix allocation for small frame sizes
    16dd68310f501 pwm: tiehrpwm: Enable pwmchip's parent device before setting configuration
    39c24b19a6111 platform/chrome: cros_typec_switch: Don't touch struct fwnode_handle::dev
    b7e2bd20e7c8b drm/msm/dp: Avoid division by zero in msm_dp_ctrl_config_msa()
    e60e16d406b23 drm/msm/dpu: program correct register for UBWC config on DPU 8.x+
    d791b31e7da16 drm/msm/dpu: offset HBB values written to DPU by -13
    b573177b314e0 drm/msm/mdss: correct HBB programmed on UBWC 5.x and 6.x devices
    7672af88d3072 drm/rockchip: dw_hdmi_qp: Fix RK3576 HPD interrupt handling
    fb328aa95c34c drm/hisilicon/hibmc: Adding reset colorbar cfg in dp init.
    0922d282f7d30 drm/hisilicon/hibmc: fix no showing problem with loading hibmc manually
    84359ed3c53f0 drm/hisilicon/hibmc: add dp mode valid check
    bc950899ef118 drm/hisilicon/hibmc: fix dp probabilistical detect errors after HPD irq
    840581b30cdeb drm/buddy: release free_trees array on buddy mm teardown
    f83b92c576864 drm/msm/a2xx: fix pixel shader start on A225
    21cf7527de1d1 media: ccs: Accommodate C-PHY into the calculation
    5fab6e1405e18 accel/amdxdna: Fix notifier_wq flushing warning
    c0727bcbf09b4 drm/msm/dsi_phy_14nm: convert from divider_round_rate() to divider_determine_rate()
    2b46bb9f88cd7 drm/msm/dpu: fix CMD panels on DPU 1.x - 3.x
    2f803e86ba4f4 drm/msm/disp: set num_planes to 1 for interleaved YUV formats
    35301ca2a83d1 HID: playstation: Add missing check for input_ff_create_memless
    b6a83ad13d253 regulator: core: move supply check earlier in set_machine_constraints()
    a6b7308f35cdf mei: late_bind: fix struct intel_lb_component_ops kernel-doc
    4ef745e4d0d63 drm/msm/dp: Update msm_dp_controller IDs for sa8775p
    acfd1dce074f8 drm/msm/dpu: fix WD timer handling on DPU 8.x
    822d9b24de402 drm/msm/dpu: Set vsync source irrespective of mdp top support
    dc567a611b169 drm/msm/disp/dpu: add merge3d support for sc7280
    8db8fadf1364f drm/amdgpu: Use explicit VCN instance 0 in SR-IOV init
    30c6faf917059 drm/amdkfd: Fix signal_eviction_fence() bool return value
    083351c6886e3 drm/amd: Drop "amdgpu kernel modesetting enabled" message
    1de71556cbd6e media: chips-media: wave5: Fix memory leak on codec_info allocation failure
    77dc0140ea592 ASoC: nau8821: Fixup nau8821_enable_jack_detect()
    5a247a84de0ba smack: /smack/doi: accept previously used values
    cb59ae5619952 smack: /smack/doi must be > 0
    da3be3289ecfa drm/panthor: Evict groups before VM termination
    956cc8a74f410 ASoC: SDCA: Allow sample width wild cards in set_usage()
    fa3b263c4de3e ALSA: vmaster: Relax __free() variable declarations
    ed9acd01e907f ALSA: pcm: Relax __free() variable declarations
    082aba8e3aab9 drm/panel: sw43408: Remove manual invocation of unprepare at remove
    5b295f0133935 accel/amdxdna: Fix race where send ring appears full due to delayed head update
    0b0d8ed13d292 drm/panthor: Fix panthor_gpu_coherency_set()
    d8d97352bf5d5 workqueue: Process rescuer work items one-by-one using a cursor
    5ec7110f5ed40 workqueue: Only assign rescuer work when really needed
    932c36b81325b workqueue: Factor out assign_rescuer_work()
    8c66adcae91b3 drm/panthor: Make sure we resume the tick when new jobs are submitted
    d2f485242e311 drm/panthor: Fix the logic that decides when to stop ticking
    ef100b8e257b6 drm/panthor: Fix immediate ticking on a disabled tick
    73f2614637f64 drm/panthor: Fix the group priority rotation logic
    693a04f41a54b drm/panthor: Fix the full_tick check
    57753f2c64c03 drm/panthor: Recover from panthor_gpu_flush_caches() failures
    da9c1afd9991e reset: canaan: k230: drop OF dependency and enable by default
    3c0dd95dd5208 arm64: dts: qcom: sm6115: Add CX_MEM/DBGC GPU regions
    58c0b917fdca3 arm64: dts: qcom: agatti: Add CX_MEM/DBGC GPU regions
    222e45e64bbca arm64: dts: qcom: talos: Drop opp-shared from QUP OPP table
    37082c9b418d4 arm64: dts: qcom: x1e: bus is 40-bits (fix 64GB models)
    06557d72ea40c arm64: dts: qcom: sdm845-db845c: specify power for WiFi CH1
    39974be66f817 arm64: dts: qcom: sdm845-db845c: drop CS from SPIO0
    2d7ea0516f2be arm64: dts: qcom: qrb4210-rb2: Fix UART3 wakeup IRQ storm
    33bc5e10165d5 arm64: dts: amlogic: g12: assign the MMC A signal clock
    844317f9b0075 arm64: dts: amlogic: g12: assign the MMC B and C signal clocks
    0709a0901956c arm64: dts: amlogic: gx: assign the MMC signal clocks
    c9bb634897e33 arm64: dts: amlogic: axg: assign the MMC signal clocks
    f6e54c1ea7b84 arm64: dts: amlogic: c3: assign the MMC signal clocks
    6cc29c7148550 hwspinlock: omap: Handle devm_pm_runtime_enable() errors
    eeb84c4f43372 soc: qcom: ubwc: add missing include
    6906a98898989 arm64: dts: ti: k3-j784s4-j742s2-main-common.dtsi: Refactor watchdog instances for j784s4
    8273989e774ab arm64: dts: ti: k3-j784s4-main.dtsi: Move c71_3 node to appropriate order
    1f71dfc03471b arm64: dts: amlogic: s4: fix mmc clock assignment
    5a5ec520e7401 arm64: dts: amlogic: s4: assign mmc b clock to 24MHz
    85cf4f7c2cf22 arm64: dts: mediatek: mt8183-jacuzzi-pico6: Fix typo in pinmux node
    6666c9d544323 arm: dts: lpc32xx: add clocks property to Motor Control PWM device tree node
    bcab50ed6e73c arm64: dts: renesas: rzt2h-n2h-evk-common: Use GPIO for SD0 write protect
    6e6561231c6cf powerpc/eeh: fix recursive pci_lock_rescan_remove locking in EEH event handling
    0f6498077faa9 soc: mediatek: svs: Fix memory leak in svs_enable_debug_write()
    3eeda22d52ff9 soc: qcom: cmd-db: Use devm_memremap() to fix memory leak in cmd_db_dev_probe
    1b39dbd7761d5 powerpc/uaccess: Move barrier_nospec() out of allow_read_{from/write}_user()
    3ce94bf05945c ARM: dts: allwinner: sun5i-a13-utoo-p66: delete "power-gpios" property
    db09ba1f9e704 arm64: dts: qcom: msm8994-octagon: Fix Analog Devices vendor prefix of AD7147
    9bbee82bacb90 arm64: dts: renesas: r9a09g047e57-smarc: Remove duplicate SW_LCD_EN
    480374c75c675 arm64: dts: qcom: x1e80100: Fix USB combo PHYs SS1 and SS2 ref clocks
    02d580c9affa5 arm64: dts: qcom: sdm845-oneplus: Mark l14a regulator as boot-on
    7f4d96e122180 arm64: dts: qcom: sdm845-oneplus: Don't keep panel regulator always on
    f5b047a232718 arm64: dts: qcom: sdm845-oneplus: Don't mark ts supply boot-on
    75a3a27e4f825 arm64: dts: qcom: sdm630: fix gpu_speed_bin size
    97ca54da16f40 clk: qcom: Return correct error code in qcom_cc_probe_by_index()
    911a473e29c32 arm64: dts: tqma8mpql-mba8mp-ras314: Fix HDMI CEC pad control settings
    5a76398d0e03b arm64: dts: tqma8mpql-mba8mpxl: Fix HDMI CEC pad control settings
    9fd6457841282 firmware: arm_ffa: Correct 32-bit response handling in NOTIFICATION_INFO_GET
    f64f4ec804b3e EDAC/i5400: Fix snprintf() limit calculation in calculate_dimm_size()
    3efb54e1201b8 EDAC/i5000: Fix snprintf() size calculation in calculate_dimm_size()
    d32e8339e1fda soc: qcom: smem: handle ENOMEM error during probe
    4f73486ca8223 pstore/ram: fix buffer overflow in persistent_ram_save_old()
    119702b716776 selftests/xsk: fix number of Tx frags in invalid packet
    b2b172a987132 selftests/xsk: properly handle batch ending in the middle of a packet
    8b1a095541c13 selftests/bpf: test_xsk: Split xskxceiver
    dcf416eb88eaf hwrng: core - use RCU and work_struct to fix race condition
    9095671fa2404 hwrng: core - Allow runtime disabling of the HW RNG
    4869d0e4e48a5 crypto: starfive - Fix memory leak in starfive_aes_aead_do_one_req()
    7752d36343862 bpf: Require frozen map for calculating map hash
    5835a077c6f5c bpf: Limit bpf program signature size
    45acb60fe59ab fs/tests: exec: drop duplicate bprm_stack_limits test vectors
    52aeb1e07ec22 sched/rt: Skip currently executing CPU in rto_next_cpu()
    909131ad0a006 sched/deadline: Clear the defer params
    83550d2311559 media: pci: mg4b: Use IRQF_NO_THREAD
    352f1bbbd711a mfd: wm8350-core: Use IRQF_ONESHOT
    7b0c5dec6a01a rtc: amlogic-a4: Remove IRQF_ONESHOT
    5248f7f5b3407 usb: typec: fusb302: Remove IRQF_ONESHOT
    66839f7c2bd66 EDAC/altera: Remove IRQF_ONESHOT
    909dfc310ee53 scsi: efct: Use IRQF_ONESHOT and default primary handler
    f5e5bbf56ecf6 Bluetooth: btintel_pcie: Use IRQF_ONESHOT and default primary handler
    680b652b2d087 iommu/amd: Use core's primary handler and set IRQF_ONESHOT
    91b6a550472a9 platform/x86: int0002: Remove IRQF_ONESHOT from request_irq()
    0c1876a365447 genirq: Set IRQF_COND_ONESHOT in devm_request_irq().
    d7b87adeb0eb5 bpf: Fix bpf_xdp_store_bytes proto for read-only arg
    d7decb572b55d crypto: caam - fix netdev memory leak in dpaa2_caam_probe
    d0bac6618e810 crypto: hisilicon/trng - support tfms sharing the device
    94fdeeaeb7cef selftests/bpf: Fix kprobe multi stacktrace_ips test
    42a155c738b9a x86/fgraph,bpf: Switch kprobe_multi program stack unwind to hw_regs path
    9e10486f79936 x86/fgraph: Fix return_to_handler regs.rsp value
    243d642ff5809 crypto: inside-secure/eip93 - unregister only available algorithm
    9a3ace9b010ff crypto: ccp - Fix a crash due to incorrect cleanup usage of kfree
    4ecbcfb71a50c bpf: Fix verifier_bug_if to account for BPF_CALL
    4e0772cded109 bpf: Fix tcx/netkit detach permissions when prog fd isn't given
    4b8d1424b32c4 bpf, sockmap: Fix FIONREAD for sockmap
    f274a4540226e bpf, sockmap: Fix incorrect copied_seq calculation
    3ed835f6aa188 rqspinlock: Fix TAS fallback lock entry creation
    6abdd33a088db hwrng: airoha - set rng quality to 900
    46825599fad19 crypto: ccp - narrow scope of snp_range_list
    e6a4b3d222211 crypto: ccp - Fix a case where SNP_SHUTDOWN is missed
    7530c3595d1e2 crypto: inside-secure/eip93 - fix kernel panic in driver detach
    1bbb1356f6be5 hrtimer: Fix trace oddity
    c77581cdebada selftests/bpf: Fix resource leak in serial_test_wq on attach failure
    fdfe75161f6e8 bpf: Fix memory access flags in helper prototypes
    92a8cb1806ade bpf: Preserve id of register in sync_linked_regs()
    33d3290333e8e crypto: hisilicon/sgl - fix inconsistent map/unmap direction issue
    740e710a6f272 crypto: hisilicon/sec2 - support skcipher/aead fallback for hardware queue unavailable
    9f35acf698017 crypto: hisilicon/hpre - support the hpre algorithm fallback
    c990abb136b74 crypto: hisilicon - consolidate qp creation and start in hisi_qm_alloc_qps_node
    cc7a36b6ac8f4 crypto: hisilicon/zip - support fallback for zip
    3acd2479c770e crypto: hisilicon/qm - centralize the sending locks of each module into qm
    23fcfd8c0d1fd crypto: hisilicon/qm - enhance the configuration of req_type in queue attributes
    2b8b12e3f869d crypto: hisilicon/hpre: extend tag field to 64 bits for better performance
    139e24de706ed crypto: hisilicon/sec - move backlog management to qp and store sqe in qp for callback
    1f269645bb4c8 crypto: hisilicon/zip - adjust the way to obtain the req in the callback function
    c6eb4991a1776 crypto: octeontx - fix dma_free_coherent() size
    2bdeabe2b6478 crypto: cavium - fix dma_free_coherent() size
    9029e8db69fb3 sched: Fix build for modules using set_tsk_need_resched()
    8ed7f3c03d042 time/sched_clock: Use ACCESS_PRIVATE() to evaluate hrtimer::function
    9b94124cb9c23 ARM: VDSO: Patch out __vdso_clock_getres() if unavailable
    26cbfd67fdb5e sched: Export hidden tracepoints to modules
    c3cfe342d1209 libbpf: Fix OOB read in btf_dump_get_bitfield_value
    c2a90d855bea5 selftests/bpf: veristat: fix printing order in output_stats()
    36abc0b2df605 crypto: qat - fix warning on adf_pfvf_pf_proto.c
    1838a7507e133 perf/x86/core: Do not set bit width for unavailable counters
    7e4c643aa3b22 x86/cpu/amd: Correct the microcode table for Zenbleed
    445d35742d863 io_uring/kbuf: fix memory leak if io_buffer_add_list fails
    6715560527e34 s390/cio: Fix device lifecycle handling in css_alloc_subchannel()
    af5b0854fba03 PM: sleep: wakeirq: harden dev_pm_clear_wake_irq() against races
    630f3eca39624 cpufreq: intel_pstate: Enable asym capacity only when CPU SMT is not possible
    5cbf75e0f07f6 perf: arm_spe: Properly set hw.state on failures
    c787a235deb33 arm64/gcs: Fix error handling in arch_set_shadow_stack_status()
    1141301a71954 PM: wakeup: Handle empty list in wakeup_sources_walk_start()
    80d58a8915d7d md: fix return value of mddev_trylock
    ec10e3dc93994 md/raid1: fix memory leak in raid1_run()
    02455f658db8e Partial revert "x86/xen: fix balloon target initialization for PVH dom0"
    f75a5555e0049 ublk: Validate SQE128 flag before accessing the cmd
    9b03dda1453e8 ublk: restore auto buf unregister refcount optimization
    8344d5da9df74 thermal/of: Fix reference leak in thermal_of_cm_lookup()
    769a8a732e825 iomap: fix submission side handling of completion side errors
    67bbf2527c1d0 cpufreq: scmi: Fix device_node reference leak in scmi_cpu_domain_id()
    27feb209c2d7b OPP: Return correct value in dev_pm_opp_get_level
    095417d6b669c md/md-llbitmap: fix percpu_ref not resurrected on suspend timeout
    870b9f15867b0 md/raid5: fix IO hang with degraded array with llbitmap
    5bf494167291e md/raid10: fix any_working flag handling in raid10_sync_request
    32c046a506ea9 md/raid5: fix raid5_run() to return error when log_init() fails
    649ddf7e5aa64 thermal: intel: x86_pkg_temp_thermal: Handle invalid temperature
    9d589661f21fa cpuidle: governors: menu: Always check timers with tick stopped
    d733106e7c652 io_uring/sync: validate passed in offset
    1d126db2f263f io_uring/eventfd: remove unused ctx->evfd_last_cq_tail member
    b24595b869209 ACPICA: Fix NULL pointer dereference in acpi_ev_address_space_dispatch()
    c1c266e2c1f10 io_uring: use release-acquire ordering for IORING_SETUP_R_DISABLED
    cb45bcc970930 xen/virtio: Don't use grant-dma-ops when running as Dom0
    68f38f648e4b5 ACPI: processor: Update cpuidle driver check in __acpi_processor_start()
    7cce69596cecc rnbd-srv: Fix server side setting of bi_size for special IOs
    cbdb9f3adf542 netfs: avoid double increment of retry_count in subreq
    e66dcf7bb9c4d smb: client: fix potential UAF and double free in smb2_open_file()
    5de1aa0bf3a5d erofs: fix inline data read failure for ztailpacking pclusters
    7d4eadee7042d btrfs: fix EEXIST abort due to non-consecutive gaps in chunk allocation
    80e1fda9c084d btrfs: fix block_group_tree dirty_list corruption
    00ea0370ba7bc btrfs: qgroup: return correct error when deleting qgroup relation item
    f957ddc4d8eb9 btrfs: zoned: don't zone append to conventional zone
    9643b3baa46b6 btrfs: introduce btrfs_bio::async_csum
    0981c6b984a16 btrfs: make sure all btrfs_bio::end_io are called in task context
    4663160aa2d84 btrfs: remove btrfs_bio::fs_info by extracting it from btrfs_bio::inode
    8f7f0e1728685 btrfs: headers cleanup to remove unnecessary local includes
    e49abde0ffc38 erofs: handle end of filesystem properly for file-backed mounts
    728ba43461774 erofs: get rid of raw bi_end_io() usage
    ec15eb67fe9df tpm: st33zp24: Fix missing cleanup on get_burstcount() error
    1a22048c1117c tpm: tpm_i2c_infineon: Fix locality leak on get_burstcount() failure
    8e71414e252c1 i3c: dw: Fix memory leak in dw_i3c_master_i2c_xfers()
    53f4761ab032d i3c: dw: Initialize spinlock to avoid upsetting lockdep
    6d76febba07c4 gfs2: Fix use-after-free in iomap inline data write path
    1d47922b98046 gfs2: Fix slab-use-after-free in qd_put
    5480341dc884f gfs2: Retries missing in gfs2_{rename,exchange}
    7378340f2e220 i3c: master: Update hot-join flag only on success
    5c328675d2a8a fs: add <linux/init_task.h> for 'init_fs'
    44e9f5aedfb4c fs: move initializing f_mode before file_ref_init()
    c2ed725668f23 device_cgroup: remove branch hint after code refactor
    49c201c09b473 i3c: Move device name assignment after i3c_bus_init
    d0200c70e3175 selftests/resctrl: Fix a division by zero error on Hygon
    28397957c75b9 audit: move the compat_xxx_class[] extern declarations to audit_arch.h
    4a4a6e12c9c82 rcu: Fix rcu_read_unlock() deadloop due to softirq
    2e6ff6a6fc69c hfsplus: return error when node already exists in hfs_bnode_create
    91f08ec6a97b2 auxdisplay: arm-charlcd: fix release_mem_region() size
    205955f29c263 RDMA/umad: Reject negative data_len in ib_umad_write
    714c99e1dc8f8 RDMA/siw: Fix potential NULL pointer dereference in header processing
    25e0b1c206e3d Linux 6.18.13
    df337ba02ca53 f2fs: fix incomplete block usage in compact SSA summaries
    855c54f1803e3 f2fs: fix to do sanity check on node footer in {read,write}_end_io
    cd2fec912a0f0 f2fs: fix to do sanity check on node footer in __write_node_folio()
    715a7a72e4736 USB: serial: option: add Telit FN920C04 RNDIS compositions
    f611dafe0ffd3 iommu/arm-smmu-qcom: do not register driver in probe()
    0415ae51a40e3 f2fs: optimize f2fs_overwrite_io() for f2fs_iomap_begin
    fee27b69dde1a f2fs: fix to avoid mapping wrong physical block for swapfile
    97e4f479939e5 f2fs: support non-4KB block size without packed_ssa feature
    995030be4ce63 f2fs: fix to avoid UAF in f2fs_write_end_io()
    d4a594dd952df f2fs: fix out-of-bounds access in sysfs attribute read/write
    bd66b4c487d50 f2fs: fix IS_CHECKPOINTED flag inconsistency issue caused by concurrent atomic commit and checkpoint writes
    70cf1e96bde07 f2fs: fix to check sysfs filename w/ gc_pin_file_thresh correctly
    fb9f7e52273db f2fs: fix to add gc count stat in f2fs_gc_range
    1c008ad0f0d1c fbdev: smscufx: properly copy ioctl memory to kernelspace
    3e4cbd1d46c24 fbdev: rivafb: fix divide error in nv3_arb()
    98d91080517d4 cpuset: Fix missing adaptation for cpuset_is_populated
    eaa9fcf57934c LoongArch: Rework KASAN initialization for PTW-enabled systems
    9b671f6f432be mm/hugetlb: fix excessive IPI broadcasts when unsharing PMD tables using mmu_gather
    0c74d37343b93 arm64: dts: mediatek: mt8183: Add missing endpoint IDs to display graph
    6d66464d1a059 gpiolib: acpi: Fix gpio count with string references
    fa4938e0d0d64 io_uring/fdinfo: be a bit nicer when looping a lot of SQEs/CQEs
    cab928242853a ASoC: fsl_xcvr: fix missing lock in fsl_xcvr_mode_put()
    00c57e2369386 drm/amd/display: remove assert around dpp_base replacement
    8e6f503961709 drm/amd/display: extend delta clamping logic to CM3 LUT helper
    f2584f791a103 tracing/dma: Cap dma_map_sg tracepoint arrays to prevent buffer overflow
    7bc40c6f36575 ASoC: cs42l43: Correct handling of 3-pole jack load detection
    a8ed5b974a244 platform/x86: panasonic-laptop: Fix sysfs group leak in error path
    2ca80dd4bb0e2 ASoC: sof_sdw: Add a quirk for Lenovo laptop using sidecar amps with cs42l43
    bb6ff25035da5 platform/x86/amd/pmc: Add quirk for MECHREVO Wujie 15X Pro
    a9584e9e46448 ALSA: hda/realtek: Enable headset mic for Acer Nitro 5
    78783e8d588cf ASoC: amd: yc: Add quirk for HP 200 G2a 16
    c3b2e922924bf ASoC: Intel: sof_es8336: Add DMI quirk for Huawei BOD-WXX9
    97528b1622b8f platform/x86: classmate-laptop: Add missing NULL pointer checks
    efdb9c8ca3cfb drm/tegra: hdmi: sor: Fix error: variable ‘j’ set but not used
    4b71ad7676564 romfs: check sb_set_blocksize() return value
    d2e01e0c5e947 ALSA: hda/realtek - fixed speaker no sound
    20bc7062c352f ASoC: cs35l45: Corrects ASP_TX5 DAPM widget channel
    1bdbcf326474c ALSA: hda/realtek: Add quirk for Inspur S14-G1
    b0b2cb84b64a9 gpio: sprd: Change sprd_gpio lock to raw_spin_lock
    652667ac1369e ASoC: amd: yc: Add ASUS ExpertBook PM1503CDA to quirks list
    464a50c6b23aa rust: driver: fix broken intra-doc links to example driver types
    7d82e965fe0e3 rust: dma: fix broken intra-doc links
    68dd6c5ebe799 rust: device: fix broken intra-doc links
    31f33b856d232 scsi: qla2xxx: Fix bsg_done() causing double free
    2784b1b43af37 Linux 6.18.12
    53a76425e0764 Revert "driver core: enforce device_lock for driver_match_device()"
    ee4fb138af107 Linux 6.18.11
    32f08c3ddd6dd gpio: omap: do not register driver in probe()
    116f7bd8160c6 wifi: rtl8xxxu: fix slab-out-of-bounds in rtl8xxxu_sta_add
    24a253c3aa6d9 PCI: endpoint: Avoid creating sub-groups asynchronously
    60b75407c172e drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free
    ed82e7949f5ca xfs: fix UAF in xchk_btree_check_block_owner
    d741534302f71 erofs: fix UAF issue for file-backed mounts w/ directio option
    1d6bd6183e723 bus: fsl-mc: fix use-after-free in driver_override_show()
    d14e991279831 scsi: qla2xxx: Query FW again before proceeding with login
    f04840512438a scsi: qla2xxx: Free sp in error path to fix system crash
    c068ebbaf5282 scsi: qla2xxx: Delay module unload while fabric scan in progress
    ae49d33bfc08b scsi: qla2xxx: Allow recovery for tape devices
    1a9585e4c58d1 scsi: qla2xxx: Validate sp before freeing associated memory
    1339455044155 wifi: rtw88: Fix alignment fault in rtw_core_enable_beacon()
    46c1d56ad321f hfs: ensure sb->s_fs_info is always cleaned up
    4aa45f841413c nilfs2: Fix potential block overflow that cause system hang
    52505d7f713bf crypto: virtio - Remove duplicated virtqueue_kick in virtio_crypto_skcipher_crypt_req
    e69a7b0a71b65 crypto: virtio - Add spinlock protection with virtqueue notification
    2ed27b5a11743 crypto: omap - Allocate OMAP_CRYPTO_FORCE_COPY scatterlists correctly
    62c89e1992c86 crypto: octeontx - Fix length check to avoid truncation in ucode_load_store
    d75207465eed2 crypto: iaa - Fix out-of-bounds index in find_empty_iaa_compression_mode
    65a0016016e8b ALSA: hda/conexant: Add quirk for HP ZBook Studio G4
    be7a9bcee0ca6 Bluetooth: btusb: Add USB ID 7392:e611 for Edimax EW-7611UXB
    8d76b2488eb3c driver core: enforce device_lock for driver_match_device()
    16c8be3d55441 smb: client: let send_done handle a completion without IB_SEND_SIGNALED
    6bf260ace7301 smb: client: let smbd_post_send_negotiate_req() use smbd_post_send()
    69ce4ae2ab65c smb: client: fix last send credit problem causing disconnects
    cca0526ef2344 smb: client: make use of smbdirect_socket.send_io.bcredits
    9eff83600edf6 smb: client: use smbdirect_send_batch processing
    d059e5fc49755 smb: client: introduce and use smbd_{alloc, free}_send_io()
    1f3e8e2c67cbc smb: client: split out smbd_ib_post_send()
    8786127068d51 smb: client: port and use the wait_for_credits logic used by server
    1fe0f989beb8b smb: client: remove pointless sc->send_io.pending handling in smbd_post_send_iter()
    2b08ca3ab6cc5 smb: client: remove pointless sc->recv_io.credits.count rollback
    b9ec75aba3c8f smb: client: let smbd_post_send() make use of request->wr
    5b69ba9978dd0 smb: client: let recv_done() queue a refill when the peer is low on credits
    f664e6e8a8110 smb: client: make use of smbdirect_socket.recv_io.credits.available
    24082642654f3 smb: server: let send_done handle a completion without IB_SEND_SIGNALED
    85bf0a73831cc smb: server: fix last send credit problem causing disconnects
    5ef18a2e66f2f smb: server: make use of smbdirect_socket.send_io.bcredits
    cea7afb097b00 smb: server: let recv_done() queue a refill when the peer is low on credits
    66c082e3d4651 smb: server: make use of smbdirect_socket.recv_io.credits.available
    88cf40f7b5fb4 smb: smbdirect: introduce smbdirect_socket.send_io.bcredits.*
    e811e60e1cc79 smb: smbdirect: introduce smbdirect_socket.recv_io.credits.available
    cd25e0d809531 smb: server: fix leak of active_num_conn in ksmbd_tcp_new_connection()
    e4a8a96a93d08 ksmbd: add chann_lock to protect ksmbd_chann_list xarray
    71b5e7c528315 ksmbd: fix infinite loop caused by next_smb2_rcv_hdr_off reset in error paths
    c4b9edd559873 smb: client: split cached_fid bitfields to avoid shared-byte RMW races
    1658b66fed206 io_uring: allow io-wq workers to exit when unused
    f02693a40e407 io_uring/io-wq: add exit-on-idle state
    41cec610f6906 Linux 6.18.10
    31b593fbece63 riscv: Add intermediate cast to 'unsigned long' in __get_user_asm
    ecd164120c248 ALSA: usb-audio: Use the right limit for PCM OOB check
    24ad4cfac0b8e ALSA: hda/realtek: Really fix headset mic for TongFang X6AR55xU.
    57bac08056787 spi: tegra114: Preserve SPI mode bits in def_command1_reg
    b8eec12aa666c spi: tegra: Fix a memory leak in tegra_slink_probe()
    2ac3a105e5149 spi: tegra210-quad: Protect curr_xfer check in IRQ handler
    d51554dc05695 spi: tegra210-quad: Protect curr_xfer clearing in tegra_qspi_non_combined_seq_xfer
    3bc293d5b5650 spi: tegra210-quad: Protect curr_xfer in tegra_qspi_combined_seq_xfer
    2d3c0122e9611 spi: tegra210-quad: Protect curr_xfer assignment in tegra_qspi_setup_transfer_one
    51013068438ac spi: tegra210-quad: Move curr_xfer read inside spinlock
    e1777c400b7a9 spi: tegra210-quad: Return IRQ_HANDLED when timeout already processed transfer
    b767cf2d4efc8 regulator: spacemit-p1: Fix n_voltages for BUCK and LDO regulators
    3f9b508b3eecc i2c: imx: preserve error state in block data length handler
    e71e3fa90a151 gpio: loongson-64bit: Fix incorrect NULL check after devm_kcalloc()
    279cb9180510f ASoC: amd: fix memory leak in acp3x pdm dma ops
    8434b351cd4ea ALSA: usb-audio: fix broken logic in snd_audigy2nx_led_update()
    01d2fb15f15c1 firmware: cs_dsp: rate-limit log messages in KUnit builds
    abd66845227c5 firmware: cs_dsp: Factor out common debugfs string read
    b8ad2d53f706a ipv6: Fix ECMP sibling count mismatch when clearing RTF_ADDRCONF
    f3ed399e9aa6f nvme-pci: handle changing device dma map requirements
    3c58f6121863c drm/xe/guc: Fix CFI violation in debugfs access.
    8b68a45f9722f netfilter: nf_tables: fix inverted genmask check in nft_map_catchall_activate()
    32ddd09d1103e hwmon: (occ) Mark occ_init_attribute() as __printf
    8abb71d4a1dce drm/xe/pm: Disable D3Cold for BMG only on specific platforms
    7c5db0957a230 drm/xe/query: Fix topology query pointer advance
    184a84f03b5e6 drm/mgag200: fix mgag200_bmc_stop_scanout()
    2e5edb69e5d0e net: gro: fix outer network offset
    589a530ae44d0 net: add proper RCU protection to /proc/net/ptype
    9f42cb8fafd6d net: ethernet: adi: adin1110: Check return value of devm_gpiod_get_optional() in adin1110_check_spi()
    100f3bf914612 drm/amd/display: fix wrong color value mapping on MCM shaper LUT
    0031f8829c7fb wifi: iwlwifi: mvm: pause TCM on fast resume
    9b9f52f052f49 wifi: iwlwifi: mld: cancel mlo_scan_start_wk
    5a2b4b0e9c003 net: enetc: Convert 16-bit register reads to 32-bit for ENETC v4
    566ea5769ec27 net: enetc: Convert 16-bit register writes to 32-bit for ENETC v4
    f346253e5fd95 net: enetc: Remove CBDR cacheability AXI settings for ENETC v4
    d98745c68023f net: enetc: Remove SI/BDR cacheability AXI settings for ENETC v4
    c175b1eaf729e tipc: use kfree_sensitive() for session key material
    f3931416cbdd0 net: rss: fix reporting RXH_XFRM_NO_CHANGE as input_xfrm for contexts
    2718ae6af7445 linkwatch: use __dev_put() in callers to prevent UAF
    64cf3016234ce io_uring/zcrx: fix page array leak
    fad7334082cd1 net: don't touch dev->stats in BPF redirect paths
    8860ddf0e07be hwmon: (acpi_power_meter) Fix deadlocks related to acpi_power_meter_notify()
    1b2efc593dca9 net: usb: r8152: fix resume reset deadlock
    cdedcd5aa3f3c macvlan: fix error recovery in macvlan_common_newlink()
    c9e4daf62ca07 net: sfp: Fix quirk for Ubiquiti U-Fiber Instant SFP module
    8553bf2e09828 i40e: drop udp_tunnel_get_rx_info() call from i40e_open()
    07bb882485f89 ice: drop udp_tunnel_get_rx_info() call from ndo_open()
    7565d4df66b66 ice: Fix PTP NULL pointer dereference during VSI rebuild
    ef72678c9df0e ice: PTP: fix missing timestamps on E825 hardware
    6801ef140fc33 ice: fix missing TX timestamps interrupts on E825 devices
    1b381a638e185 dpaa2-switch: add bounds check for if_id in IRQ handler
    4640fa5ad5e1a net: liquidio: Fix off-by-one error in VF setup_nic_devices() cleanup
    293eaad0d6d6b net: liquidio: Fix off-by-one error in PF setup_nic_devices() cleanup
    d028147ae0640 net: liquidio: Initialize netdev pointer before queue setup
    155eb99aff292 dpaa2-switch: prevent ZERO_SIZE_PTR dereference when num_ifs is zero
    8a672f177ebe1 net/sched: cls_u32: use skb_header_pointer_careful()
    9b186feb75267 net: add skb_header_pointer_careful() helper
    f8611a7981cd0 hwmon: (dell-smm) Add Dell G15 5510 to fan control whitelist
    9ee608a64e37c smb/client: fix memory leak in smb2_open_file()
    faff38ebbfe63 platform/x86/intel/tpmi/plr: Make the file domain<n>/status writeable
    9029ccfab2ca9 platform/x86: hp-bioscfg: Skip empty attribute names
    6c45a5a7e1e3b platform/x86: intel_telemetry: Fix PSS event register mask
    f93ae43780b75 platform/x86: toshiba_haps: Fix memory leaks in add/remove routines
    245ff08e261ce Revert "drm/amd/display: pause the workload setting in dm"
    98bf5bc8cb8cb tracing: Avoid possible signed 64-bit truncation
    6dd87f6afe9e9 ALSA: hda/realtek: ALC269 fixup for Lenovo Yoga Book 9i 13IRU8 audio
    3228b2eceb6c3 btrfs: reject new transactions if the fs is fully read-only
    b4b065a880997 wifi: mac80211: don't increment crypto_tx_tailroom_needed_cnt twice
    ccb3c75d57039 btrfs: sync read disk super and set block size
    7a1bec39c014e wifi: mac80211: correctly check if CSA is active
    990e40fb1d111 btrfs: fix Wmaybe-uninitialized warning in replay_one_buffer()
    3835e49e146a4 scsi: target: iscsi: Fix use-after-free in iscsit_dec_conn_usage_count()
    108cbf2b7d295 ALSA: hda/realtek: Fix headset mic for TongFang X6AR55xU
    1d5f2329ab4df io_uring/rw: free potentially allocated iovec on cache put failure
    c65a1a72a41e4 riscv: Use 64-bit variable for output in __get_user_asm
    4530f4e4d0e6a scsi: target: iscsi: Fix use-after-free in iscsit_dec_session_usage_count()
    8a7ef96e6af91 wifi: cfg80211: Fix bitrate calculation overflow for HE rates
    36e88bd40a8c0 spi: intel-pci: Add support for Nova Lake SPI serial flash
    7178b36de1850 ALSA: usb-audio: Add delay quirk for MOONDROP Moonriver2 Ti
    f08f2d2907675 regmap: maple: free entry on mas_store_gfp() failure
    7d4c9c448c2b3 spi: hisi-kunpeng: Fixed the wrong debugfs node name in hisi_spi debugfs initialization
    66b73d3f2cfc7 ALSA: hda/tas2781: Add newly-released HP laptop
    e6ce61e01c9a2 ASoC: tlv320adcx140: Propagate error codes during probe
    3ba3d959c17aa ASoC: amd: yc: Fix microphone on ASUS M6500RE
    1c90f930e7b41 nvmet-tcp: fixup hang in nvmet_tcp_listen_data_ready()
    62932d9ed639a ALSA: usb-audio: Prevent excessive number of frames
    e810b290922c5 nvme-fc: release admin tagset if init fails
    a883080063f97 ASoC: simple-card-utils: Check device node before overwrite direction
    61fa85497c7b7 ASoC: davinci-evm: Fix reference leak in davinci_evm_probe
    9f665b3c3d9a1 dmaengine: mmp_pdma: Fix race condition in mmp_pdma_residue()
    921903d73967f ASoC: Intel: sof_sdw: Add new quirks for PTL on Dell with CS42L43
    74309a4b0ffc7 wifi: mac80211: collect station statistics earlier when disconnect
    da1880c7b6b83 HID: Elecom: Add support for ELECOM M-XT3DRBK (018C)
    71434e45bf124 HID: logitech: add HID++ support for Logitech MX Anywhere 3S
    b1f8285bc8e35 riscv: trace: fix snapshot deadlock with sbi ecall
    151589d15ee87 ring-buffer: Avoid softlockup in ring_buffer_resize() during memory free
    cd7ff7fd3e4b7 drm/amd/pm: Disable MMIO access during SMU Mode 1 reset
    ecb8653a8fe9d HID: Apply quirk HID_QUIRK_ALWAYS_POLL to Edifier QR30 (2d99:a101)
    1e84a807c98a7 HID: Intel-thc-hid: Intel-thc: Add safety check for reading DMA buffer
    2124279f1f8c3 HID: i2c-hid: fix potential buffer overflow in i2c_hid_get_report()
    6e2108daed94e HID: quirks: Add another Chicony HP 5MP Cameras to hid_ignore_list
    645671377158f drm/amd/display: Reduce number of arguments of dcn30's CalculatePrefetchSchedule()
    eb5d6dedadd66 netfilter: replace -EEXIST with -EBUSY
    ddab2d0f93200 PCI: qcom: Remove ASPM L0s support for MSM8996 SoC
    3210077ed2648 ALSA: hda/realtek: add HP Laptop 15s-eq1xxx mute LED quirk
    5b9bbe3d7bb90 x86/sev: Disable GCOV on noinstr object
    75f1f512b1567 ALSA: hda/realtek: Add quirk for Acer Nitro AN517-55
    747b9a7d4c712 HID: playstation: Center initial joystick axes to prevent spurious events
    7ae5b35148119 HID: intel-ish-hid: Reset enum_devices_done before enumeration
    8b44e75379510 riscv: Sanitize syscall table indexing under speculation
    28768bd3abf99 btrfs: fix reservation leak in some error paths when inserting inline extent
    a206870513cda HID: multitouch: add MT_QUIRK_STICKY_FINGERS to MT_CLS_VTL
    ea5ef771f3c26 HID: intel-ish-hid: Update ishtp bus match to support device ID table
    6de3a371a8b9f btrfs: do not free data reservation in fallback from inline due to -ENOSPC
    70dd3513ed6ac smb/server: fix refcount leak in parse_durable_handle_context()
    c2ed4f71e9288 LoongArch: Enable exception fixup for specific ADE subcode
    2bb9c8a77df50 io_uring: use GFP_NOWAIT for overflow CQEs on legacy rings
    4665e52bde3b1 smb/server: fix refcount leak in smb2_open()
    0107b18cd8ac1 md: suspend array while updating raid_disks via sysfs
    9531210f348aa LoongArch: Set correct protection_map[] for VM_NONE/VM_SHARED
    fdda836fcee6f smb/server: call ksmbd_session_rpc_close() on error path in create_smb2_pipe()
    f309b2c7df659 block,bfq: fix aux stat accumulation destination
    86acdc1791944 platform/x86: dell-lis3lv02d: Add Latitude 5400
    ff6892ea544c4 wifi: iwlwifi: Implement settime64 as stub for MVM/MLD PTP
    6b7c60feab3c6 net: usb: sr9700: support devices with virtual driver CD
    10d3ff7e5812c wifi: mac80211: don't WARN for connections on invalid channels
    689a7980e4788 wifi: wlcore: ensure skb headroom before skb_push
    e0bd226804f8e wifi: mac80211: ocb: skip rx_no_sta when interface is not joined
    abd219fd48b11 tracing: Fix ftrace event field alignments
    116ffca92dc4d binderfs: fix ida_alloc_max() upper bound
    e9bcfe865188a binder: fix BR_FROZEN_REPLY error log
    a6050dedb6f1c binder: fix UAF in binder_netlink_report()
    287221c5e0707 rust_binderfs: fix ida_alloc_max() upper bound
    685bb05d307ac rust_binder: add additional alignment checks
    598fe3ff32e43 rust_binder: correctly handle FDA objects of length zero
    13de38aa3ea7a sched/fair: Have SD_SERIALIZE affect newidle balancing
    de7cb4282dafc sched/fair: Skip sched_balance_running cmpxchg when balance is not due
    3a15c519d2b0f bus: mhi: host: pci_generic: Add Telit FE990B40 modem support
    fa2274bb17a4a treewide: Drop pci_save_state() after pci_restore_state()
    71c50e60421bb PCI/ERR: Ensure error recoverability at all times
    1a893bd719121 hwmon: (gpio-fan) Allow to stop FANs when CONFIG_PM is disabled
    37751b6d0b6b5 hwmon: (gpio-fan) Fix set_rpm() return value
    4385b2f284354 KVM: Don't clobber irqfd routing type when deassigning irqfd
    7a245ef476ffb KVM: selftests: Add -U_FORTIFY_SOURCE to avoid some unpredictable test failures
    a82647e1a9499 net: spacemit: k1-emac: fix jumbo frame support
    d5b3a66986697 net: cpsw_new: Execute ndo_set_rx_mode callback in a work queue
    488009aa62bb1 net: cpsw: Execute ndo_set_rx_mode callback in a work queue
    ef763b480a3de nouveau/gsp: fix suspend/resume regression on r570 firmware
    a20887d5239a3 nouveau/gsp: use rpc sequence numbers properly.
    9cc8caba82c2b nouveau: add a third state to the fini handler.
    5f645222eb30c Revert "drm/amd: Check if ASPM is enabled from PCIe subsystem"
    7b6a0f121d502 mm, shmem: prevent infinite loop on truncate race
    41a7b9ab855c8 gve: Correct ethtool rx_dropped calculation
    11f8311f69e4c gve: Fix stats report corruption on queue count change
    e9cdd54797dc2 drm/amd: Set minimum version for set_hw_resource_1 on gfx11 to 0x52
    d3081353acaa6 cgroup/dmem: avoid pool UAF
    5c38604abbfa5 cgroup/dmem: avoid rcu warning when unregister region
    c13816e8fa23d cgroup/dmem: fix NULL pointer dereference when setting max
    e258ed369c9e0 ceph: fix oops due to invalid pointer for kfree() in parse_longname()
    35e6fd0d5bc30 ARM: 9468/1: fix memset64() on big-endian
    46dfdb6f7a79d rbd: check for EOD after exclusive lock is ensured to be held
    57b36ffc8881d ceph: fix NULL pointer dereference in ceph_mds_auth_match()
    e8af57e090790 mm/slab: Add alloc_tagging_slab_free_hook for memcg_alloc_abort_single
    cbc03ce3e6ce7 procfs: avoid fetching build ID while holding VMA lock
    eb54ce033b344 pmdomain: imx8m-blk-ctrl: fix out-of-range access of bc->domains
    11ca03ce17d7d pmdomain: imx8mp-blk-ctrl: Keep usb phy power domain on for system wakeup
    5171a3dddf427 pmdomain: imx: gpcv2: Fix the imx8mm gpu hang due to wrong adb400 reset
    72129d55be9ce pmdomain: imx8mp-blk-ctrl: Keep gpc power domain on for system wakeup
    d72563e402bab pmdomain: qcom: rpmpd: fix off-by-one error in clamping to the highest state
    5727ccf9d19ca ALSA: aloop: Fix racy access at PCM trigger
    21816bbc8492f platform/x86: intel_telemetry: Fix swapped arrays in PSS output
    b5a02290ee3a4 KVM: x86: Explicitly configure supported XSS from {svm,vmx}_set_cpu_caps()
    a94b956bb7272 x86/kfence: fix booting on 32bit non-PAE systems
    feb603a69f830 x86/vmware: Fix hypercall clobbers
    ab200d71553bd nvmet-tcp: add bounds checks in nvmet_tcp_build_pdu_iovec

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
index c2e74b7..1b9f072 100644
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
@@ -8,4 +8,4 @@ KMACHINE:genericx86 ?= "common-pc"
 KMACHINE:genericx86-64 ?= "common-pc-64"
 
 KBRANCH:genericarm64 ?= "v6.18/standard/genericarm64"
-SRCREV_machine:genericarm64 ?= "0704231cf2930b9f7e6cfc2be65ca4cdcd4465ae"
+SRCREV_machine:genericarm64 ?= "ab52f02d7b75097a1517e65897b379b1d47d316c"
-- 
2.43.0


