Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B45DFC036D
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:45:33 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.700.1776959132705037468
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 08:45:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rOEOq9N9;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-506362ac5f7so56186241cf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 08:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776959132; x=1777563932; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wvN/g610r3y4tF+ZKaHrCLk6FrgJCjUMTKKHORp0W2o=;
        b=rOEOq9N9naQJ5OGHNqg5UoqdydX4llDGrVUR5eLaguo0GKaDBBPJd0ZUx4Nifyxpo2
         2JyjUFbPDaM4NfCiSZ4vmX0kuuLdoPWO1zxmuaRvHebhJ5eevpMsHWaY2o2ljwMPeqlI
         FCSPDsyy2glUaJeqoFB4+ShqzKdp7pcwW0kw7S2Laq5Nk8hMnc6r6WZ4p4aDN6keSTWM
         fwXkiFdr/6PUKktLA7e0e669GRPMVz8AVw8QAkuKHUreuNsLNIeSkhmdVIe9zqOq0Yxz
         WVvYKcwfKqFfUfphs+qPF9vqnuCpvAin55mSe9aR2mjEy2RPtBNtzLyHDzU9Ti1vWNnE
         Lqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776959132; x=1777563932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wvN/g610r3y4tF+ZKaHrCLk6FrgJCjUMTKKHORp0W2o=;
        b=bYhl5w/SC+z4RCq/tdXc7Rxh9Sh4BS+P4B3unkDAkwnuwvgUgMfFFR2tn27i0ba4Hj
         uFHUdDMziqs5Xv/mmIkXMJcFIiQtFLKR1ts0s9sPNrNP74KV9P2izcf3Ou0JvACWBShU
         f6wrq1ijclJN6yWTAcTs0kindO9Z5hw3VGJfTb0el+3MixlUtpprxlSWymjgd5lOJuWQ
         vPq+qqlvJMjpM+iw9OEuaxcZink0luvKJHxavAMYsncV69N33U2pZYRovMbmSymZAt+H
         9gXCYzhzBhkgL85l9lGtnXK06Hz1J0nyyeMXdAXCrvRI/q9Hh0+vwItXxrCjn8RlPqZh
         zlfg==
X-Gm-Message-State: AOJu0Yy6f/hjr502hO7/vicSEmLGrnQSx8lgPD2srW1BZZs/Scja01fc
	V73UeWZ9ms9qPKXCvvQZwXfxkAkHI+gY98gmhyGvrQxYwqqVucQyMy/WFc7VfqLh
X-Gm-Gg: AeBDieu2gNEBjOEQbp7U68lJ5tFm7UiW/iOMYfoLeJ6/Bd1da9azouBGZfnjo96yXEC
	ynX7e1E4ZulDfvWiqjJl7TACeC8uSXM7gGgw878QiAqZ6SHjjEGLih+LcU4vDjnPVhLqaWRK4D+
	IaCf+CkzHfIsBYzNk6tj4ODV8HOAch+lS4++o5EJn+n8gxEz4YYJwc9LMUi9V6ZnER+kbyexa7O
	2j4IoYqUp022qVjQgFpodrRgGkd6EiJjaB5p3q8lyYNh/dcjXuiikGQdgNVJCtFLeKMzspx8wEB
	JQ9bc35NBElXFoC0UwUz22IEi4remwOadf4RVpH9Ib0oEEag82Lw5tFLvKAJeQN7UXspKe0vimG
	HIFbkEoWVpWGi3XbNeSX28q0cQOUEHf3aO+cEsBFv868MdTMjz0h04H7vFtzj++zDNkKCaZACEO
	J8Z4kVN5Cxu5VOkSm8r9KNfpHKSxVoz0hgsXjqrVLI/wZaq6LiFzHxCm357oadxchOV703+3gik
	z9N6XEbiMnfdil/9LFLrvsz+0kGF2DxdprqfwDDXhOE2I93xnhrCcs/tLGpBkWebzF0yg==
X-Received: by 2002:ac8:5807:0:b0:50d:7c44:e144 with SMTP id d75a77b69052e-50e36b3ecaamr466873321cf.11.1776959128500;
        Thu, 23 Apr 2026 08:45:28 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50fb416b3f5sm74400031cf.28.2026.04.23.08.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:45:27 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
Subject: [openembedded-core][whinlatter][PATCH 11/18] linux-yocto/6.12: update to v6.12.79
Date: Thu, 23 Apr 2026 11:45:02 -0400
Message-ID: <20260423154509.1933646-12-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423154509.1933646-1-bruce.ashfield@gmail.com>
References: <20260423154509.1933646-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 15:45:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235812

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    c2d104a355013 Linux 6.12.79
    62f01682102e0 Revert "LoongArch: Add machine_kexec_mask_interrupts() implementation"
    4859112559405 Linux 6.12.78
    1f00bad1b69b7 xen/privcmd: add boot control for restricted usage in domU
    78432d8f0372c xen/privcmd: restrict usage in unprivileged domU
    80b02e943613b perf/x86/intel: Add missing branch counters constraint apply
    e7c963868b67a hwmon: (max6639) Fix pulses-per-revolution implementation
    ebf6449effd94 tools/bootconfig: fix fd leak in load_xbc_file() on fstat failure
    21156d04549d5 lib/bootconfig: check xbc_init_node() return in override path
    1db7e11a2e2b9 fs/tests: exec: Remove bad test vector
    2e20a886b443a drm/i915/gt: Check set_default_submission() before deferencing
    568a25fd7bcdf ksmbd: fix use-after-free in durable v2 replay of active file handles
    c742b46a153d3 ksmbd: fix use-after-free of share_conf in compound request
    131e4cafa7662 drm/amd: fix dcn 2.01 check
    7f7d2c4a2333e drm/amd/display: Fix DisplayID not-found handling in parse_edid_displayid_vrr()
    33d289267dfd9 mtd: rawnand: brcmnand: skip DMA during panic write
    f71ce0ae5aefe mtd: rawnand: serialize lock/unlock against other NAND operations
    1bfd188284065 mm/shmem, swap: avoid redundant Xarray lookup during swapin
    62414eec28583 mm/shmem, swap: improve cached mTHP handling and fix potential hang
    1be8e41962f1f mm: shmem: avoid unpaired folio_unlock() in shmem_swapin_folio()
    b0e49178f2ed1 mm: shmem: fix potential data corruption during shmem swapin
    246bbe3ee76f6 mtd: spi-nor: core: avoid odd length/address writes in 8D-8D-8D mode
    a0563931c0282 mtd: spi-nor: core: avoid odd length/address reads on 8D-8D-8D mode
    9956d4892e788 x86/platform/uv: Handle deconfigured sockets
    da102725b4df3 ring-buffer: Fix to update per-subbuf entries of persistent ring buffer
    93cad30c061f4 i2c: pxa: defer reset on Armada 3700 when recovery is used
    3facec19f80cc i2c: fsi: Fix a potential leak in fsi_i2c_probe()
    13ccf9b106bba i2c: cp2615: fix serial string NULL-deref at probe
    c6a24845728e9 USB: serial: f81232: fix incomplete serial port generation
    3ccfbd4da541e drm/i915/psr: Compute PSR entry_setup_frames into intel_crtc_state
    8b3267892b9ce hwmon: (pmbus/isl68137) Fix unchecked return value and use sysfs_emit()
    15db8db56499f hwmon: (pmbus/mp2975) Add error check for pmbus_read_word_data() return value
    9647e99d2a617 icmp: fix NULL pointer dereference in icmp_tag_validation()
    665152cdd8ad0 net: dsa: bcm_sf2: fix missing clk_disable_unprepare() in error paths
    7bd20f4b3ef30 net: mvpp2: guard flow control update with global_tx_fc in buffer switching
    ec8bf0571b142 nfnetlink_osf: validate individual option lengths in fingerprints
    7e3955b282eae netfilter: nf_tables: release flowtable after rcu grace period on error
    cb2bf5efdb02a netfilter: bpf: defer hook memory release until rcu readers are done
    6a3bb74e25d79 net: bonding: fix NULL deref in bond_debug_rlb_hash_show
    9f036aa0fe46c udp_tunnel: fix NULL deref caused by udp_sock_create6 when CONFIG_IPV6=n
    2051c709dce92 net/mlx5e: Fix race condition during IPSec ESN update
    c3db55dc0f334 net/mlx5e: Prevent concurrent access to IPSec ASO context
    869ff44ecf693 net/mlx5: qos: Restrict RTNL area to avoid a lock cycle
    25136c005f714 net: macb: fix uninitialized rx_fs_lock
    e0c470049344e ACPI: processor: Fix previous acpi_processor_errata_piix4() fix
    cfa64e2b3717b wifi: wlcore: Return -ENOMEM instead of -EAGAIN if there is not enough headroom
    a90279e7f7ea0 wifi: mac80211: fix NULL deref in mesh_matches_local()
    97d97bf5b2d43 iavf: fix VLAN filter lost on add/delete race
    5e4c90c94eb76 igc: fix page fault in XDP TX timestamps handling
    79a230f90932a igc: fix missing update of skb->tail in igc_xmit_frame()
    3267bcb744ee8 net: usb: aqc111: Do not perform PM inside suspend callback
    37bef86e5428d clsact: Fix use-after-free in init/destroy rollback asymmetry
    af0d1613d6751 net: usb: cdc_ncm: add ndpoffset to NDP32 nframes bounds check
    789204f980730 net: usb: cdc_ncm: add ndpoffset to NDP16 nframes bounds check
    652ec118d8dc1 net: airoha: Remove airoha_dev_stop() in airoha_remove()
    4cba4373abac7 net: airoha: Read completion queue data in airoha_qdma_tx_napi_poll()
    a04ac7bc97afe net: airoha: fix PSE memory configuration in airoha_fe_pse_ports_init()
    a9ed47c366321 net: airoha: read default PSE reserved pages value before updating
    afbc79a7770b2 net/sched: teql: Fix double-free in teql_master_xmit
    cadf3da46c155 net/smc: fix NULL dereference and UAF in smc_tcp_syn_recv_sock()
    946bb6cacf0cc bonding: prevent potential infinite loop in bond_header_parse()
    c6febaacfb8a0 PM: runtime: Fix a race condition related to device removal
    bd2a8f06c263b sched: idle: Consolidate the handling of two special cases
    2b001901f6890 net: mana: fix use-after-free in mana_hwc_destroy_channel() by reordering teardown
    dcb88a003e390 net: bcmgenet: increase WoL poll timeout
    633e8f87dad32 netfilter: nf_conntrack_h323: check for zero length in DecodeQ931()
    171fe8e6da02c netfilter: xt_time: use unsigned int for monthday bit shift
    19a230dec6bb8 netfilter: xt_CT: drop pending enqueued packets on template removal
    6802ff8beceb9 netfilter: nft_ct: drop pending enqueued packets on removal
    d1354873cbe3b nf_tables: nft_dynset: fix possible stateful expression memleak in error path
    774a434f8c9c8 netfilter: nf_conntrack_h323: fix OOB read in decode_int() CONS case
    75fcaee5170e7 netfilter: nf_conntrack_sip: fix Content-Length u32 truncation in sip_help_tcp()
    f025171feef2a netfilter: ctnetlink: fix use-after-free in ctnetlink_dump_exp_ct()
    078d33c95bf53 netfilter: ctnetlink: remove refcounting in expectation dumpers
    be3a573ba719f mpls: add missing unregister_netdevice_notifier to mpls_init
    508f49ccbe032 net/rose: fix NULL pointer dereference in rose_transmit_link on reconnect
    e89dbd2736a45 bridge: cfm: Fix race condition in peer_mep deletion
    8f8023ad95045 Bluetooth: qca: fix ROM version reading on WCN3998 chips
    c22a5e659959e Bluetooth: L2CAP: Fix use-after-free in l2cap_unregister_user
    7c805b7d1e580 Bluetooth: HIDP: Fix possible UAF
    695b45b2262fc Bluetooth: MGMT: Fix list corruption and UAF in command complete handlers
    537a42a62e400 Bluetooth: hci_sync: Fix hci_le_create_conn_sync
    f678ea4b1315f Bluetooth: ISO: Fix defer tests being unstable
    c53c85583591b Bluetooth: SMP: make SM/PER/KDU/BI-04-C happy
    ca97abddf1968 Bluetooth: LE L2CAP: Disconnect if sum of payload sizes exceed SDU
    ab0b2de04d8de Bluetooth: LE L2CAP: Disconnect if received packet's SDU exceeds IMTU
    158802642a695 firmware: arm_scpi: Fix device_node reference leak in probe path
    71cdba40b4f8e firmware: arm_ffa: Remove vm_id argument in ffa_rxtx_unmap()
    b82eac7a1a38f arm64: dts: renesas: r9a09g057: Remove wdt{0,2,3} nodes
    d82a0f77999fb arm64: dts: renesas: r9a09g057: Add RTC node
    d32c07ef1880f wifi: cfg80211: cancel pmsr_free_wk in cfg80211_pmsr_wdev_down
    29a1a350afcd2 wifi: mac80211: Fix static_branch_dec() underflow for aql_disable.
    af521c7d80ecc soc: fsl: cpm1: qmc: Fix error check for devm_ioremap_resource() in qmc_qe_init_resources()
    751f60bd48eda soc: fsl: qbman: fix race condition in qman_destroy_fq
    209551351a701 soc: rockchip: grf: Add missing of_node_put() when returning
    44084194298cd cache: ax45mp: Fix device node reference leak in ax45mp_cache_init()
    bff13109276a6 cache: starfive: fix device node leak in starlink_cache_init()
    da4b44c42f405 soc: microchip: mpfs: Fix memory leak in mpfs_sys_controller_probe()
    e6b8133e0f51d btrfs: tree-checker: fix misleading root drop_level error message
    f556b1e09d054 btrfs: log new dentries when logging parent dir of a conflicting inode
    18f67e5930724 ata: libata-scsi: report correct sense field pointer in ata_scsiop_maint_in()
    e9b76a88cf046 ata: libata-scsi: Return residual for emulated SCSI commands
    6b949a6b33cbd Bluetooth: L2CAP: Fix accepting multiple L2CAP_ECRED_CONN_REQ
    e2b424aadecb6 drm/xe: Open-code GGTT MMIO access protection
    91edd662f4d9f drm/xe/oa: Allow reading after disabling OA stream
    b7a629d07908b drm/amdgpu: apply state adjust rules to some additional HAINAN vairants
    0285fc016a4fb drm/radeon: apply state adjust rules to some additional HAINAN vairants
    f99e8b813ae5c drm/imagination: Fix deadlock in soft reset sequence
    5af0510112313 drm/amdgpu/mmhub4.1.0: add bounds checking for cid
    d23171e11a220 drm/amdgpu/mmhub3.0: add bounds checking for cid
    76b0c2e88d1a2 drm/amdgpu/mmhub3.0.2: add bounds checking for cid
    2acb07d01c435 drm/amdgpu/mmhub3.0.1: add bounds checking for cid
    3ca77111881c4 drm/amdgpu/mmhub2.3: add bounds checking for cid
    5b53680ff3f3d drm/amdgpu/mmhub2.0: add bounds checking for cid
    04a789b30b002 drm/amdgpu/gmc9.0: add bounds checking for cid
    68b2678c5f85e drm/amd/display: Wrap dcn32_override_min_req_memclk() in DC_FP_{START, END}
    7e3ec3bf40151 drm: Fix use-after-free on framebuffers and property blobs when calling drm_dev_unplug
    0866809dfe19d io_uring/kbuf: propagate BUF_MORE through early buffer commit path
    04d57b332e37b serial: uartlite: fix PM runtime usage count underflow on probe
    0bae1c670aa8c serial: 8250: Add late synchronize_irq() to shutdown to handle DW UART BUSY
    2a72403b985ae serial: 8250: Fix TX deadlock when using DMA
    868b44e2f6467 serial: 8250_pci: add support for the AX99100
    31fd1e0281621 iommu/vt-d: Fix intel iommu iotlb sync hardlockup and retry
    2025b2d1f9d5c mtd: Avoid boot crash in RedBoot partition table parser
    0643441d70234 mtd: rawnand: cadence: Fix error check for dma_alloc_coherent() in cadence_nand_init()
    c96bae994552c mtd: rawnand: pl353: make sure optimal timings are applied
    df30056c78e8b spi: fix statistics allocation
    afe27c1f43aa5 spi: fix use-after-free on controller registration failure
    ea4fa54b83bb2 pmdomain: bcm: bcm2835-power: Increase ASB control timeout
    45fd9d8352f22 mmc: sdhci: fix timing selection for 1-bit bus width
    570bbd5264897 mmc: sdhci-pci-gli: fix GL9750 DMA write corruption
    26760c3382d26 ata: libata-core: disable LPM on ADATA SU680 SSD
    2ee1064926d33 net: macb: Reinitialize tx/rx queue pointer registers and rx ring during resume
    f1cf6177b2304 net: macb: Introduce gem_init_rx_ring()
    6e40ebb999c2c batman-adv: avoid OGM aggregation when skb tailroom is insufficient
    e3d8efc157bc5 btrfs: fix transaction abort when snapshotting received subvolumes
    4998dac563257 kprobes: Remove unneeded warnings from __arm_kprobe_ftrace()
    7838880e78fd3 kprobes: Remove unneeded goto
    c75bdffc07599 powerpc64/bpf: fix kfunc call support
    a87072464ebb6 powerpc64/bpf: Fold bpf_jit_emit_func_call_hlp() into bpf_jit_emit_func_call_rel()
    cd3215d74b323 s390/zcrypt: Enable AUTOSEL_DOM for CCA serialnr sysfs attribute
    1ec7d3c7dc8f2 drm/i915/psr: Write DSC parameters on Selective Update in ET mode
    5329d725add8a drm/i915/dsc: Add helper for writing DSC Selective Update ET parameters
    182d342b111f3 drm/i915/dsc: Add Selective Update register definitions
    ce00616bc1df6 ksmbd: use volume UUID in FS_OBJECT_ID_INFORMATION
    89afe5e2dbea6 ksmbd: unset conn->binding on failed binding request
    d33cbf0bf8979 smb: client: fix krb5 mount with username option
    9aeacde4da0f0 Bluetooth: L2CAP: Validate L2CAP_INFO_RSP payload length before access
    d90150c72d2e6 Bluetooth: L2CAP: Fix type confusion in l2cap_ecred_reconf_rsp()
    65c25b588994d mac80211: fix crash in ieee80211_chan_bw_change for AP_VLAN stations
    d646b038baea3 parisc: Flush correct cache in cacheflush() syscall
    0bb848d8c6493 net: macb: fix use-after-free access to PTP clock
    548a1bfe59136 NFC: nxp-nci: allow GPIOs to sleep
    2970f0f4e7da7 LoongArch: Give more information if kmem access failed
    2c638259ad750 nvdimm/bus: Fix potential use after free in asynchronous initialization
    301670dcd098c sunrpc: fix cache_request leak in cache_release
    d6efaa50af62f HID: bpf: prevent buffer overflow in hid_hw_request
    9cd1005cecfcc selftests/hid: fix compilation when bpf_wq and hid_device are not exported
    dad0c3c0a8e5d nfsd: fix heap overflow in NFSv4.0 LOCK replay cache
    e3d77f935639e NFSD: Hold net reference for the lifetime of /proc/fs/nfs/exports fd
    0479268fdfaaf drm/amdgpu: Add basic validation for RAS header
    0ea986a1cebae drm/amd/pm: Use pm_display_cfg in legacy DPM (v2)
    c179bece52fd2 drm/amd/display: Add pixel_clock to amd_pp_display_configuration
    b0e9965cebf9f drm/i915/psr: Repeat Selective Update area alignment
    bc4a6620e4243 drm/i915/alpm: ALPM disable fixes
    c962bdcd24b49 s390/xor: Fix xor_xc_2() inline assembly constraints
    6949c35ef26e4 s390/stackleak: Fix __stackleak_poison() inline assembly constraint
    d2fc2dcfce47a sched/fair: Fix zero_vruntime tracking
    f3fb54e7a8b4a io_uring/kbuf: check if target buffer list is still legacy on recycle
    cc095cd305fdd sched_ext: Remove redundant css_put() in scx_cgroup_init()
    08de46a75f91a mm: thp: deny THP for files on anonymous inodes
    ad07ea069f924 erofs: fix inline data read failure for ztailpacking pclusters
    695455fbc4905 xfs: get rid of the xchk_xfile_*_descr calls
    6cce7bc7fac84 binfmt_misc: restore write access before closing files opened by open_exec()
    b358fc6ff3b35 net: dsa: properly keep track of conduit reference
    fc023b8fab057 dmaengine: mmp_pdma: Fix race condition in mmp_pdma_residue()
    7b4bfd02c934d blk-throttle: fix access race during throttle policy activation
    25d2dc669f2a7 f2fs: fix to avoid migrating empty section
    cc81768212cdc f2fs: compress: fix UAF of f2fs_inode_info in f2fs_free_dic
    7c002e242ddd0 f2fs: compress: change the first parameter of page_array_{alloc,free} to sbi
    cd19a32de5d05 net: stmmac: remove support for lpi_intr_o
    7c1d221e475e3 mptcp: pm: in-kernel: always set ID as avail when rm endp
    996092ba6df66 platform/x86/amd/pmc: Add support for Van Gogh SoC
    5844e21800dc2 x86/uprobes: Fix XOL allocation failure for 32-bit tasks
    55a88ab8a1314 io_uring/uring_cmd: fix too strict requirement on ioctl
    079050a23de6b Octeontx2-af: Add proper checks for fwdata
    19e18e6dabb1b tracing: Add recursion protection in kernel stack trace recording
    8ac7dd0f813fb ice: fix devlink reload call trace
    0c3666ec18864 btrfs: do not strictly require dirty metadata threshold for metadata writepages
    cf969bddd6e69 rxrpc: Fix recvmsg() unconditional requeue
    4220cb3740691 dm-verity: disable recursive forward error correction
    bd0905e2122e3 ipv6: use RCU in ip6_xmit()
    91c228f96fcfa drm/xe/sync: Cleanup partially initialized sync on parse failure
    3729fd784d156 xfs: fix integer overflow in bmap intent sort comparator
    1ab70c260cf16 crypto: atmel-sha204a - Fix OOM ->tfm_count leak
    0e4b8faaaebe3 cifs: open files should not hold ref on superblock
    88f974fe118cb net: macb: Shuffle the tx ring before enabling tx
    c20b47ae4f4dd drm/bridge: ti-sn65dsi83: halve horizontal syncs for dual LVDS output
    3fe2d9ec166b7 ksmbd: Don't log keys in SMB3 signing and encryption key generation
    60fe02840272d KVM: x86: Introduce KVM_X86_QUIRK_VMCS12_ALLOW_FREEZE_IN_SMM
    0e729a5368925 KVM: nVMX: Add consistency checks for CR0.WP and CR4.CET
    4055f250a3294 KVM: x86: Introduce Intel specific quirk KVM_X86_QUIRK_IGNORE_GUEST_PAT
    18fd5e4bcf04d KVM: x86: Introduce supported_quirks to block disabling quirks
    541304df9d989 KVM: x86: Allow vendor code to disable quirks
    70bc291dcc804 KVM: x86: do not allow re-enabling quirks
    d3e2196c3e534 KVM: x86: Quirk initialization of feature MSRs to KVM's max configuration
    715b07abac522 KVM: x86: Co-locate initialization of feature MSRs in kvm_arch_vcpu_create()
    5bc7aeb75b65e fgraph: Fix thresh_return clear per-task notrace
    2ca7125fff6bb iomap: reject delalloc mappings during writeback
    e0b14bf06393b sched_ext: Fix starvation of scx_enable() under fair-class saturation
    41423912f7ac7 sched_ext: Disable preemption between scx_claim_exit() and kicking helper work
    3376b345df155 nsfs: tighten permission checks for ns iteration ioctls
    fe8b548fb40da mm/kfence: fix KASAN hardware tag faults during late enablement
    e305204d7a5a8 mm/page_alloc: forward the gfp flags from alloc_contig_range() to post_alloc_hook()
    05634a14e7437 mm/page_alloc: sort out the alloc_contig_range() gfp flags mess
    9287df8de02e6 mm/page_alloc: move set_page_refcounted() to callers of post_alloc_hook()
    a10b3c5dec40e mmc: dw_mmc-rockchip: Fix runtime PM support for internal phase support
    7457b35afafef mmc: dw_mmc-rockchip: Add memory clock auto-gating support
    bcb599684ef14 mmc: dw_mmc-rockchip: use modern PM macros
    01651e7751edb KVM: SVM: Set/clear CR8 write interception when AVIC is (de)activated
    04898c16f1bca KVM: SVM: Add a helper to look up the max physical ID for AVIC
    eb78f67f94d0e KVM: SVM: Limit AVIC physical max index based on configured max_vcpu_ids
    f962ca3b020e1 usb: gadget: f_tcm: Fix NULL pointer dereferences in nexus handling
    93f116c3393a2 usb: gadget: f_ncm: Fix net_device lifecycle with device_move
    b1e8c177c033b cleanup: Provide retain_and_null_ptr()
    88ced0d1aa62f can: gs_usb: gs_can_open(): always configure bitrates before starting device
    970e13ead0a1e xfs: Fix error pointer dereference
    035d0d09d5ab3 net/sched: act_gate: snapshot parameters with RCU on replace
    03a072e0fbf99 kbuild: Leave objtool binary around with 'make clean'
    a60307872a2e3 selftests: mptcp: join: check RM_ADDR not sent over same subflow
    f6429557edd01 selftests: mptcp: add a check for 'add_addr_accepted'
    27c9acbb9c81f drm/amd/display: Use GFP_ATOMIC in dc_create_stream_for_sink
    5299c355c0921 mptcp: pm: avoid sending RM_ADDR over same subflow
    67f34ab318807 mptcp: pm: in-kernel: always mark signal+subflow endp as used
    3bc5856bd458b perf/x86/intel/uncore: Add per-scheduler IMC CAS count events
    4597b9243fcce perf/x86/intel/uncore: Support more units on Granite Rapids
    d0155fe68f31b wifi: libertas: fix use-after-free in lbs_free_adapter()
    0b6e86e18c354 platform/x86: hp-bioscfg: Support allocations of larger data
    99e7b48c03972 x86/sev: Allow IBPB-on-Entry feature for SNP guests
    241cd64cf2e32 net: phy: register phy led_triggers during probe to avoid AB-BA deadlock
    c171f90f58974 gve: fix incorrect buffer cleanup in gve_tx_clean_pending_packets for QPL
    65ed52200080e spi: cadence-quadspi: Implement refcount to handle unbind during busy
    34d6691933682 ksmbd: call ksmbd_vfs_kern_path_end_removing() on some error paths
    f24a52948c95e dst: fix races in rt6_uncached_list_del() and rt_del_uncached_list()
    7955a914cf935 smb: client: Compare MACs in constant time
    2cdc56ed67615 ksmbd: Compare MACs in constant time
    02669e2a4d207 net/tcp-md5: Fix MAC comparison to be constant-time
    43515d1d4d826 drm/bridge: ti-sn65dsi86: Add support for DisplayPort mode with HPD
    d7159817b9f36 i3c: mipi-i3c-hci: Add missing TID field to no-op command descriptor
    bc729067d180a i3c: mipi-i3c-hci: Restart DMA ring correctly after dequeue abort
    5775296df3cc2 i3c: mipi-i3c-hci: Use ETIMEDOUT instead of ETIME for timeout errors
    451ec5e67444f iio: proximity: hx9023s: Protect against division by zero in set_samp_freq
    b776df251da87 iio: imu: inv_icm42600: fix odr switch when turning buffer off
    1d9243d418153 iio: imu: inv_icm42600: fix odr switch to the same value
    65932eadd9596 iio: gyro: mpu3050-i2c: fix pm_runtime error handling
    66c0d1d600e7b iio: gyro: mpu3050-core: fix pm_runtime error handling
    52b56f4377b78 iio: buffer: Fix wait_queue not being removed
    3b99983617f9b iio: chemical: bme680: Fix measurement wait duration calculation
    bb99fac138b49 iio: potentiometer: mcp4131: fix double application of wiper shift
    2a4d111a6a34a iio: chemical: sps30_i2c: fix buffer size in sps30_i2c_read_meas()
    154a37c0d475a iio: chemical: sps30_serial: fix buffer size in sps30_serial_read_meas()
    6bef4094e3c84 iio: frequency: adf4377: Fix duplicated soft reset mask
    d67832dc1dc96 iio: dac: ds4424: reject -128 RAW value
    05d064e3633f3 btrfs: abort transaction on failure to update root in the received subvol ioctl
    2e57b8cac2ba0 btrfs: fix transaction abort on set received ioctl due to item overflow
    5e2ea10b800d1 btrfs: fix transaction abort on file creation due to name hash collision
    7874947057851 smb: client: fix iface port assignment in parse_server_interfaces
    52327268224fb smb: client: fix in-place encryption corruption in SMB2_write()
    b8dda19e36b1e smb: client: fix atomic open with O_DIRECT & O_SYNC
    ab10bf1645618 lib/bootconfig: check bounds before writing in __xbc_open_brace()
    197c3716937ba lib/bootconfig: fix snprintf truncation check in xbc_node_compose_key_after()
    1a85f84214f9d x86/apic: Disable x2apic on resume if the kernel expects so
    2cb75e66b6f0c scsi: core: Fix error handling for scsi_alloc_sdev()
    6a1b45a06880a lib/bootconfig: fix off-by-one in xbc_verify_tree() unclosed brace error
    b9f26a4b7f821 s390/dasd: Copy detected format information to secondary device
    6413c7d2f71ef s390/dasd: Move quiesce state with pprc swap
    db353ade50dc3 xfs: ensure dquot item is deleted from AIL only after log shutdown
    e88ce9f0536f3 xfs: fix undersized l_iclog_roundoff values
    2705ca90792b9 xfs: fix returned valued from xfs_defer_can_append
    72a0bb8de73a7 cifs: make default value of retrans as zero
    f54fff845e469 qmi_wwan: allow max_mtu above hard_mtu to control rx_urb_size
    06722ffc58135 tracing: Fix trace_buf_size= cmdline parameter with sizes >= 2G
    a8f96f00edcd2 tracing: Fix enabling multiple events on the kernel command line and bootconfig
    d34bc6eef9c5d drm/msm: Fix dma_free_attrs() buffer size
    1c956f0fccc26 drm/i915: Fix potential overflow of shmem scatterlist length
    3133acd82556a drm/bridge: ti-sn65dsi83: fix CHA_DSI_CLK_RANGE rounding
    01c82133e226f drm/amd: Set num IP blocks to 0 if discovery fails
    904025fa8bba1 drm/amdgpu: Fix use-after-free race in VM acquire
    a8de25f00bbf7 drm/amd/pm: remove invalid gpu_metrics.energy_accumulator on smu v13.0.x
    e80fef36c676c net: dsa: microchip: Fix error path in PTP IRQ setup
    d0f2386f52980 net: ethernet: arc: emac: quiesce interrupts before requesting IRQ
    553366c271479 net: ncsi: fix skb leak in error paths
    abf4feaee6405 net: nexthop: fix percpu use-after-free in remove_nh_grp_entry
    08aa9f3c8cf4d ksmbd: fix use-after-free by using call_rcu() for oplock_info
    54b48ae83de8b smb: server: fix use-after-free in smb2_open()
    960699317d39f ksmbd: fix use-after-free in smb_lazy_parent_lease_break_close()
    7abf59e1852ed drm/amd/display: Fallback to boot snapshot for dispclk
    f897b72cc74d2 ata: libata-core: Disable LPM on ST1000DM010-2EP102
    6b36695f5ec50 pmdomain: bcm: bcm2835-power: Fix broken reset status read
    540e52dcf225a parisc: Check kernel mapping earlier at bootup
    05d239f2c95e6 arm64: contpte: fix set_access_flags() no-op check for SMMU/ATS faults
    7d1f55d8799a9 parisc: Fix initial page table creation for boot
    b48a0f8d4541a hwmon: (pmbus/q54sj108a2) fix stack overflow in debugfs read
    ab67221a6fdaf arm64: mm: Add PTE_DIRTY back to PAGE_KERNEL* to fix kexec/hibernation
    6bdd2d70c338d nouveau/dpcd: return EBUSY for aux xfer if the device is asleep
    ce8ef2be6ae81 parisc: Increase initial mapping to 64 MB with KALLSYMS
    b7e5d8ddfdf1d batman-adv: Avoid double-rtnl_lock ELP metric worker
    8be6ed64966da net/tcp-ao: Fix MAC comparison to be constant-time
    c2bbdee7650ca tracing: Fix syscall events activation by ensuring refcount hits zero
    efd959809cf6f ice: fix retry for AQ command 0x06EE
    065783d651492 net: mana: Ring doorbell at 4 CQ wraparounds
    145e50c2c700f media: dvb-net: fix OOB access in ULE extension header tables
    e14a1148f02e8 staging: rtl8723bs: fix potential out-of-bounds read in rtw_restruct_wmm_ie
    821f7d759fb2d staging: rtl8723bs: properly validate the data in rtw_get_ie_ex()
    27694ccbd8398 ixgbevf: fix link setup issue
    0709748234159 ice: reintroduce retry mechanism for indirect AQ
    0e4aaf5a3212b btrfs: fix chunk map leak in btrfs_map_block() after btrfs_chunk_map_num_copies()
    bb19587205443 irqchip/gic-v3-its: Limit number of per-device MSIs to the range the ITS supports
    64dc258f9eec1 device property: Allow secondary lookup in fwnode_get_next_child_node()
    02e87ec0bc706 nfsd: Fix cred ref leak in nfsd_nl_listener_set_doit().
    854f926195762 s390/pfault: Fix virtual vs physical address confusion
    22d1abf8f5250 drm/bridge: ti-sn65dsi86: Enable HPD polling if IRQ is not used
    0b07f7d2c5a40 drm/bridge: samsung-dsim: Fix memory leak in error path
    bde8659d8b51f drm/amd: Disable MES LR compute W/A
    655d719aadbb8 Revert "tcpm: allow looking for role_sw device in the main node"
    07faa2aaa6984 Fix CC_HAS_ASM_GOTO_OUTPUT on non-x86 architectures
    391983c9118ea kbuild: Disable CC_HAS_ASM_GOTO_OUTPUT on clang < 17
    40119a21d9769 scsi: hisi_sas: Fix NULL pointer exception during user_scan()
    393763830ec84 scsi: hisi_sas: Use macro instead of magic number
    890bcf9ef90ea scsi: hisi_sas: Add time interval between two H2D FIS following soft reset spec
    2fcc2fc21cae7 scsi: ufs: core: Fix SError in ufshcd_rtc_work() during UFS suspend
    980f18d058049 i3c: dw-i3c-master: Set SIR_REJECT in DAT on device attach and reattach
    8ee08589549c2 time/jiffies: Mark jiffies_64_to_clock_t() notrace
    5895d0164c84d ceph: fix memory leaks in ceph_mdsc_build_path()
    aedd29386b23f ceph: fix i_nlink underrun during async unlink
    f35736a3ae736 libceph: admit message frames only in CEPH_CON_S_OPEN state
    b268984ae88cb libceph: Use u32 for non-negative values in ceph_monmap_decode()
    dbd857a9e1e33 libceph: prevent potential out-of-bounds reads in process_message_header()
    27a2a3c26ed30 libceph: reject preamble if control segment is empty
    ed024d2f4c79c libceph: Fix potential out-of-bounds access in ceph_handle_auth_reply()
    644b47f0574fd ceph: add a bunch of missing ceph_path_info initializers
    b0ca81616a010 kprobes: avoid crash when rmmod/insmod after ftrace killed
    c2ebfbe63deb7 tipc: fix divide-by-zero in tipc_sk_filter_connect()
    0da170b9e600d ASoC: qcom: qdsp6: Fix q6apm remove ordering during ADSP stop and start
    45038e03f15e9 mmc: core: Avoid bitfield RMW for claim/retune flags
    44520da00f6b2 mm/kfence: disable KFENCE upon KASAN HW tags enablement
    590f8a4ad46c0 mmc: mmci: Fix device_node reference leak in of_get_dml_pipe_index()
    b07fc09a226c7 mm/tracing: rss_stat: ensure curr is false from kthread context
    19a44efe43fec rust: kbuild: allow `unused_features`
    d4a400a6a4c4d usb: image: mdc800: kill download URB on timeout
    7003be7a51189 usb: mdc800: handle signal and read racing
    6287e0c01ccb8 usb: renesas_usbhs: fix use-after-free in ISR during device removal
    276aef0fd2b92 usb: class: cdc-wdm: fix reordering issue in read code path
    24b31a227f679 USB: core: Limit the length of unkillable synchronous timeouts
    0535f84cb94c9 USB: usbtmc: Use usb_bulk_msg_killable() with user-specified timeouts
    53ab34d522e50 USB: usbcore: Introduce usb_bulk_msg_killable()
    5b561fabe682e usb: typec: altmode/displayport: set displayport signaling rate in configure message
    ed8c19af08423 usb: roles: get usb role switch from parent only for usb-b-connector
    c8eb4016c2571 usb: cdc-acm: Restore CAP_BRK functionnality to CH343
    f43e86c19101c usb: core: don't power off roothub PHYs if phy_set_mode() fails
    78aae91d7db26 usb: misc: uss720: properly clean up reference in uss720_probe()
    5df5ce0cac6c2 usb: dwc3: pci: add support for the Intel Nova Lake -H
    3cec135415a89 usb: yurex: fix race in probe
    6f91f3f087194 usb: xhci: Prevent interrupt storm on host controller error (HCE)
    807e4fb5140c7 usb: xhci: Fix memory leak in xhci_disable_slot()
    015af103c06cb USB: ezcap401 needs USB_QUIRK_NO_BOS to function on 10gbs usb speed
    eb07da446ad97 usb/core/quirks: Add Huawei ME906S-device to wakeup quirk
    41f33bd77bb51 USB: add QUIRK_NO_BOS for video capture several devices
    43cbfb3bd6042 KVM: SVM: Initialize AVIC VMCB fields if AVIC is enabled with in-kernel APIC
    fe1c92383a771 ASoC: amd: yc: Add DMI quirk for ASUS EXPERTBOOK PM1503CDA
    84e39ec13122b ata: libata-core: Add BRIDGE_OK quirk for QEMU drives
    9037a536df46e net: usb: lan78xx: skip LTM configuration for LAN7850
    cab4d982de09d net: usb: lan78xx: fix TX byte statistics for small packets
    b46d769ab2a05 net: usb: lan78xx: fix silent drop of packets with checksum errors
    b267255c15d2a ALSA: usb-audio: Check endpoint numbers at parsing Scarlett2 mixer interfaces
    ae8f8d30d334b ALSA: pcm: fix use-after-free on linked stream runtime in snd_pcm_drain()
    9cca530c7cc1b cgroup: fix race between task migration and iteration
    ba76b18d8d2c8 Revert "arm64: dts: qcom: sdm845-oneplus: Mark l14a regulator as boot-on"
    228b379363761 usb: gadget: f_mass_storage: Fix potential integer overflow in check_command_size_in_blocks()
    e4c887b673ec4 iio: imu: inv-mpu9150: fix irq ack preventing irq storms
    1ecc39dc8cdc3 net: prevent NULL deref in ip[6]tunnel_xmit()
    357fc9f07dbc3 octeontx2-af: devlink: fix NIX RAS reporter to use RAS interrupt status
    ad403c9607eb0 octeontx2-af: devlink: fix NIX RAS reporter recovery condition
    f18640b9236ea net: dsa: realtek: Fix LED group port bit for non-zero LED group
    c78f01abe5358 net: bonding: Fix nd_tbl NULL dereference when IPv6 is disabled
    781110700ada2 drm/amdkfd: Unreserve bo if queue update failed
    5f8d1ed366d86 ASoC: detect empty DMI strings
    33de168afdd57 ASoC: amd: acp3x-rt5682-max9836: Add missing error check for clock acquisition
    2ca9da563a5fc ACPI: OSL: fix __iomem type on return from acpi_os_map_generic_address()
    dd8ac1017b3c2 net: bcmgenet: fix broken EEE by converting to phylib-managed state
    fa5ba9867a55e e1000/e1000e: Fix leak in DMA error cleanup
    5f205d2d640c8 i40e: fix src IP mask checks and memcpy argument names in cloud filter
    843e913cef4e3 nvme-pci: Fix race bug in nvme_poll_irqdisable()
    50bad78f03a02 nvme-pci: Fix slab-out-of-bounds in nvme_dbbuf_set
    8d770de29989c sched: idle: Make skipping governor callbacks more consistent
    6d9fc17dce6a2 perf ftrace: Fix hashmap__new() error checking
    baefa11ec8dc4 regulator: pca9450: Correct interrupt type
    61e1a600338fc perf annotate: Fix hashmap__new() error checking
    5e7ece24c5cb7 netfilter: xt_IDLETIMER: reject rev0 reuse of ALARM timer labels
    894c5780ddadd netfilter: nfnetlink_cthelper: fix OOB read in nfnl_cthelper_dump_table()
    cf4a4df38d174 netfilter: nfnetlink_queue: fix entry leak in bridge verdict error path
    5b18b8b35c7cd netfilter: x_tables: guard option walkers against 1-byte tail reads
    dfbdac7191987 netfilter: nft_set_pipapo: fix stack out-of-bounds read in pipapo_drop()
    eb0948fa13298 netfilter: nf_tables: always walk all pending catchall elements
    834c4f645726a net: add xmit recursion limit to tunnel xmit functions
    0d070be560e6e xdp: register system page pool as an XDP memory model
    2b1c64db6934f xdp: allow attaching already registered memory model to xdp_rxq_info
    4f9c20113f87d amd-xgbe: prevent CRC errors during RX adaptation with AN disabled
    9285fe46130ca amd-xgbe: fix link status handling in xgbe_rx_adaptation
    0695712f3a6f1 mctp: route: hold key->lock in mctp_flow_prepare_output()
    9baf26a91565b bonding: fix type confusion in bond_setup_by_slave()
    c8d250e0a8d61 bonding: use common function to compute the features
    744c03df1002f net: add a common function to compute features for upper devices
    00ed3c3ade696 bonding: Correctly support GSO ESP offload
    999fed0236754 bonding: add ESP offload features when slaves support
    cde0bccc67739 can: hi311x: hi3110_open(): add check for hi3110_power_enable() return value
    9f81be2ab9d8e mctp: i2c: fix skb memory leak in receive path
    acf162d8d7e91 bnxt_en: Fix RSS table size check when changing ethtool channels
    27e43356d0def serial: caif: hold tty->link reference in ldisc_open and ser_release
    bbdf6d378e1dd net: sfp: improve Huawei MA5671a fixup
    7dcf2de716560 ASoC: simple-card-utils: fix graph_util_is_ports0() for DT overlays
    142a386a80580 ASoC: simple-card-utils: use __free(device_node) for device node
    eab71e11ce244 ASoC: soc-core: flush delayed work before removing DAIs and widgets
    b467eb43b5e98 ASoC: soc-core: drop delayed_work_pending() check before flush
    3e41ae3fddcb7 drm/sitronix/st7586: fix bad pixel data due to byte swap
    81a43e8005366 net/sched: teql: fix NULL pointer dereference in iptunnel_xmit on TEQL slave xmit
    9c5ee9b981ee0 net/mlx5e: Fix DMA FIFO desync on error CQE SQ recovery
    05c9a6df3646c net/mlx5: Fix crash when moving to switchdev mode
    3c7313cb41b1b net/mlx5: Fix deadlock between devlink lock and esw->wq
    d7079f496a790 net/mlx5: Query to see if host PF is disabled
    752e14738479c net/mlx5: IFC updates for disabled host PF
    eb9af3de556db bonding: handle BOND_LINK_FAIL, BOND_LINK_BACK as valid link states
    9bd8c7a11c4ca drm/amd/pm: add missing od setting PP_OD_FEATURE_ZERO_FAN_BIT for smu v14
    06a6e2d3c57b9 drm/msm/dsi: fix pclk rate calculation for bonded dsi
    5a16ae6e3f174 net: dsa: realtek: rtl8365mb: remove ifOutDiscards from rx_packets
    955387df028de perf disasm: Fix off-by-one bug in outside check
    9937423c6647e workqueue: Use POOL_BH instead of WQ_BH when checking pool flags
    c1c08fd42a8ff btrfs: hold space_info->lock when clearing periodic reclaim ready
    49f53ee4e2529 xprtrdma: Decrement re_receiving on the early exit paths
    275dc9f8bc3c1 drm/msm/dsi: fix hdisplay calculation when programming dsi registers
    7e2963773760a nfs: return EISDIR on nfs3_proc_create if d_alias is a dir
    d1e8b015bc621 smb/server: Fix another refcount leak in smb2_open()
    ca235eac5b3af powerpc: 83xx: km83xx: Fix keymile vendor prefix
    a8e66eed84608 remoteproc: mediatek: Unprepare SCP clock during system suspend
    ae48ed8c39686 remoteproc: sysmon: Correct subsys_name_len type in QMI request
    631b7e154e58c powerpc/crash: adjust the elfcorehdr size
    b273e3a1b9ef3 powerpc/kexec/core: use big-endian types for crash variables
    c65c6ee4c56c5 kexec: Include kernel-end even without crashkernel
    60331e09173fc kexec: Consolidate machine_kexec_mask_interrupts() implementation
    7a03422aa3b47 powerpc/uaccess: Fix inline assembly for clang build on PPC32
    394d89cf4626b ALSA: usb-audio: Check max frame size for implicit feedback mode, too
    09927231a257f drm/amdgpu/vcn5: Add SMU dpm interface type
    314f1b873862e ALSA: usb-audio: Avoid implicit feedback mode on DIYINHK USB Audio 2.0
    6557af8245c07 scsi: ufs: core: Fix shift out of bounds when MAXQ=32
    be730f9ee92ae scsi: ufs: core: Fix possible NULL pointer dereference in ufshcd_add_command_trace()
    f1d4b894076f4 ASoC: cs42l43: Report insert for exotic peripherals
    20232d7bec4e5 ASoC: amd: yc: Add ASUS EXPERTBOOK BM1503CDA to quirk table
    af95b5735c822 scsi: ses: Fix devices attaching to different hosts
    c66c957bb7d2f ACPI: OSI: Add DMI quirk for Acer Aspire One D255
    662d9f6d25d03 wifi: mac80211: set default WMM parameters on all links
    aa9ebc084505f unshare: fix unshare_fs() handling
    fe1dafba72ce4 ALSA: hda/realtek: Fix speaker pop on Star Labs StarFighter
    78d3f201f8b60 scsi: mpi3mr: Add NULL checks when resetting request and reply queues
    81b0e0276f5fe ACPI: PM: Save NVS memory on Lenovo G70-35
    f8db760f4f52a scsi: storvsc: Fix scheduling while atomic on PREEMPT_RT

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index dd906d5ac6..609f2eaefb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -15,13 +15,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "d684a294eb3f7a4122771290905565ddc36efd45"
-SRCREV_meta ?= "19b5087399932add6bc893493fe1146fca7d4799"
+SRCREV_machine ?= "7e842d87b9b4b32c87ffa1eff0923050b2fb4579"
+SRCREV_meta ?= "50fc2fcce39b1abff6f5438f410b2ef015e10479"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.77"
+LINUX_VERSION ?= "6.12.79"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 2803d0215a..2cd5b510d9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.77"
+LINUX_VERSION ?= "6.12.79"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "43dd0f289325a90f8d17ec0ee8b2544555d056c3"
-SRCREV_meta ?= "19b5087399932add6bc893493fe1146fca7d4799"
+SRCREV_machine ?= "3bc3831f2b2a1caa0d0a0556019a2c7ff05fc81a"
+SRCREV_meta ?= "50fc2fcce39b1abff6f5438f410b2ef015e10479"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 294431f5dd..7b34f33272 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "448ef862c891700b3d94201e63a831b34a7713e4"
-SRCREV_machine:qemuarm64 ?= "43dd0f289325a90f8d17ec0ee8b2544555d056c3"
-SRCREV_machine:qemuloongarch64 ?= "43dd0f289325a90f8d17ec0ee8b2544555d056c3"
-SRCREV_machine:qemumips ?= "794aa4ace83aa50352e4abc39ed84229c864310c"
-SRCREV_machine:qemuppc ?= "43dd0f289325a90f8d17ec0ee8b2544555d056c3"
-SRCREV_machine:qemuriscv64 ?= "43dd0f289325a90f8d17ec0ee8b2544555d056c3"
-SRCREV_machine:qemuriscv32 ?= "43dd0f289325a90f8d17ec0ee8b2544555d056c3"
-SRCREV_machine:qemux86 ?= "43dd0f289325a90f8d17ec0ee8b2544555d056c3"
-SRCREV_machine:qemux86-64 ?= "43dd0f289325a90f8d17ec0ee8b2544555d056c3"
-SRCREV_machine:qemumips64 ?= "3b21c90c913a00a52877a25a4cd1aff57fc14695"
-SRCREV_machine ?= "43dd0f289325a90f8d17ec0ee8b2544555d056c3"
-SRCREV_meta ?= "19b5087399932add6bc893493fe1146fca7d4799"
+SRCREV_machine:qemuarm ?= "bdecc68b604a59ee8f0bde1b96240d48938009c2"
+SRCREV_machine:qemuarm64 ?= "3bc3831f2b2a1caa0d0a0556019a2c7ff05fc81a"
+SRCREV_machine:qemuloongarch64 ?= "3bc3831f2b2a1caa0d0a0556019a2c7ff05fc81a"
+SRCREV_machine:qemumips ?= "0f5e1025c5fe2f07e5e64dca977e10f4d42389db"
+SRCREV_machine:qemuppc ?= "3bc3831f2b2a1caa0d0a0556019a2c7ff05fc81a"
+SRCREV_machine:qemuriscv64 ?= "3bc3831f2b2a1caa0d0a0556019a2c7ff05fc81a"
+SRCREV_machine:qemuriscv32 ?= "3bc3831f2b2a1caa0d0a0556019a2c7ff05fc81a"
+SRCREV_machine:qemux86 ?= "3bc3831f2b2a1caa0d0a0556019a2c7ff05fc81a"
+SRCREV_machine:qemux86-64 ?= "3bc3831f2b2a1caa0d0a0556019a2c7ff05fc81a"
+SRCREV_machine:qemumips64 ?= "b1f97d0b31600bbbf29d4b9e519bca2a7104a2b4"
+SRCREV_machine ?= "3bc3831f2b2a1caa0d0a0556019a2c7ff05fc81a"
+SRCREV_meta ?= "50fc2fcce39b1abff6f5438f410b2ef015e10479"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "6f232446a62980e51f537db1c655e686d869b9ed"
+SRCREV_machine:class-devupstream ?= "c2d104a355013a14bcd73e31fb2c4bc21922115a"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.77"
+LINUX_VERSION ?= "6.12.79"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


