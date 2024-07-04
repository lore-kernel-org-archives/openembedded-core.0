Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FA18C30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 12:27:46 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.8894.1720096059680785934
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 05:27:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IjpM6Mcu;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-6c5bcb8e8edso394230a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 05:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720096059; x=1720700859; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7MBkXWhVJYKtp4L0gD9BGsvpn8tT56ncpZqZuqLSyWc=;
        b=IjpM6Mcu8Yr9V/pn1BfK0HmYQZIt/XSH0OcmS0wEO5TGMA7FCJNTORi63oV/yAX54v
         qin7SoXB5GAVfptKlcm3N2UQG3Uc5i1GgZ5zxt04R+C47Pk4PcuejJhyALf7XhD/zaEJ
         bqwobQIv8og1ce9dix4R8Rl+KvYod9MCoDw8/FwS9JRYAWHhAgKG+Kt4cKR+r+MErjvQ
         IFILDx8BSQlP7egY+bOCTTfRRmqpP5bWGO6Gv/lpziHI7+KcvLt5XBRXJ5lw4nTCLW4K
         RGYd9TWBjMZg4M5bLHLXg2AYYI58ZVnPsaRf+RIoZKmlGD8H2JV6VGkFjwhSgOhCyNH6
         nU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720096059; x=1720700859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7MBkXWhVJYKtp4L0gD9BGsvpn8tT56ncpZqZuqLSyWc=;
        b=wmk0A3+UHFA8SRYuBrKmL9u5nbosPzDyED+4Su1g6Qoz8gHISMdEE8TaQ0AjCaVA9+
         uDEhentDo+pmAhbuQbfOVUMnaCc+B1lwaU5Ux/IhWsjaZX5GoVHAaJok6voxSxM/v3o3
         LbWbPKPuPCIshjKOp2i+YcBhCwfkxKNJC/OVXdubaiDw/fyiMOYlTiVcviy3Ua/TJhJ2
         ootyZP4LXQiMWasVoB3O13GIPEARDOPZP/rsiyl9KKf4gVWB2bGKEPjRFH1dGCQZ6vyi
         iP8BvjjIphlVe2p04/8Gef7u0hZT378hl+BNWAK8RhWpEV16oUU+QjsP4N1GuFH5HgKh
         PjrA==
X-Gm-Message-State: AOJu0YwJNoH6kNSb4pzB2xm9FRY1hrSShfH3BgLZazKtYpvKHD99sbcN
	kSkxnLP9fr4sfiPtVDpZZ8lcUm3SJ9DSmpaOa42c952s8mcdCidHC//Dqgr19lOwjKtxnBFLEol
	O
X-Google-Smtp-Source: AGHT+IHUv9VWTVDLAXjZItCpewQ+Bzp6Ay4GJ4FyoqS/YsRY0Iu8dyg1EnBhWaqMgz38rKPvYvAreA==
X-Received: by 2002:a05:6a20:7286:b0:1be:c7f4:b42e with SMTP id adf61e73a8af0-1c0cc877561mr1737505637.20.1720096058464;
        Thu, 04 Jul 2024 05:27:38 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb1c79682csm29416075ad.8.2024.07.04.05.27.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 05:27:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/21] linux-yocto/6.6: update to v6.6.35
Date: Thu,  4 Jul 2024 05:27:01 -0700
Message-Id: <9988063874c1105c8a762739c13c6db9b5e19bb0.1720095886.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720095886.git.steve@sakoman.com>
References: <cover.1720095886.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 12:27:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201551

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    5f2d0708acd0 Linux 6.6.35
    3466abafa9f4 zap_pid_ns_processes: clear TIF_NOTIFY_SIGNAL along with TIF_SIGPENDING
    2fd6cfb2a4e6 i2c: designware: Fix the functionality flags of the slave-only interface
    572afd43c959 i2c: at91: Fix the functionality flags of the slave-only interface
    a4cd6074aed6 misc: microchip: pci1xxxx: Fix a memory leak in the error handling of gp_aux_bus_probe()
    2cc32639ec34 usb-storage: alauda: Check whether the media is initialized
    3a03ef31c1e9 serial: 8250_dw: Don't use struct dw8250_data outside of 8250_dw
    836e1a9fd8eb serial: 8250_dw: Replace ACPI device check by a quirk
    1d98b6a0b90c serial: 8250_dw: Switch to use uart_read_port_properties()
    f59e2391d3a9 serial: port: Introduce a common helper to read properties
    68a53d1212ed serial: core: Add UPIO_UNKNOWN constant for unknown port type
    1006d1b5eb01 device property: Implement device_is_big_endian()
    dd431c3ac1fc ima: Fix use-after-free on a dentry's dname.name
    0b8fba38bdfb greybus: Fix use-after-free bug in gb_interface_release due to race condition.
    aefd8f343d90 selftests: net: lib: avoid error removing empty netns name
    44bdef23572c selftests: net: lib: support errexit with busywait
    1d650d2c9bcc selftests/net/lib: no need to record ns name if it already exist
    d722ed2530e1 selftests/net/lib: update busywait timeout value
    8a73c08e00fe cachefiles, erofs: Fix NULL deref in when cachefiles is not doing ondemand-mode
    3beccb6a326d remoteproc: k3-r5: Jump to error handling labels in start/stop errors
    bb2f3187e310 selftests: forwarding: Avoid failures to source net/lib.sh
    2a969959b94f selftests/net: add variable NS_LIST for lib.sh
    04f7b9b4d7f8 selftests/net: add lib.sh
    dd782da47076 Revert "fork: defer linking file vma until vma is fully initialized"
    72b5c7f3b358 serial: 8250_pxa: Configure tx_loadsz to match FIFO IRQ level
    0d73477af964 mm/huge_memory: don't unpoison huge_zero_folio
    93d61e1bac0a tick/nohz_full: Don't abuse smp_call_function_single() in tick_setup_device()
    614d397be0cf nilfs2: fix potential kernel bug due to lack of writeback flag waiting
    f8474caf39bd swiotlb: extend buffer pre-padding to alloc_align_mask if necessary
    6c385c1fa0a7 swiotlb: Reinstate page-alignment for mappings >= PAGE_SIZE
    6033fc9522d2 swiotlb: Enforce page alignment in swiotlb_alloc()
    9f2050106f37 xfs: allow cross-linking special files without project quota
    8bb0402836d0 xfs: don't use current->journal_info
    79ba47df4e98 xfs: allow sunit mount option to repair bad primary sb stripe values
    ae609281ecae xfs: ensure submit buffers on LSN boundaries in error handlers
    04fa4269089b xfs: shrink failure needs to hold AGI buffer
    ea365e606231 xfs: fix SEEK_HOLE/DATA for regions with active COW extents
    7f0e5af2690a xfs: fix scrub stats file permissions
    20bccdb03a7b xfs: fix imprecise logic in xchk_btree_check_block_owner
    092571ef9a81 btrfs: zoned: fix use-after-free due to race with dev replace
    069e0cc343da btrfs: zoned: factor out DUP bg handling from btrfs_load_block_group_zone_info
    68713bc70dab btrfs: zoned: factor out single bg handling from btrfs_load_block_group_zone_info
    a139ad664240 btrfs: zoned: factor out per-zone logic from btrfs_load_block_group_zone_info
    f9526760879a btrfs: zoned: introduce a zone_info struct in btrfs_load_block_group_zone_info
    a3be677629e4 pmdomain: ti-sci: Fix duplicate PD referrals
    6fd062713d99 intel_th: pci: Add Lunar Lake support
    ebcef9116484 intel_th: pci: Add Meteor Lake-S support
    c8727ddde12c intel_th: pci: Add Sapphire Rapids SOC support
    37eb9f7cc719 intel_th: pci: Add Granite Rapids SOC support
    3b08df88b00d intel_th: pci: Add Granite Rapids support
    f287b1e34f1d drm/i915: Fix audio component initialization
    7a9883be3b98 drm/i915/dpt: Make DPT object unshrinkable
    1b4a8b89bf67 drm/shmem-helper: Fix BUG_ON() on mmap(PROT_WRITE, MAP_PRIVATE)
    1d2f1123a05e drm/i915/gt: Disarm breadcrumbs if engines are already idle
    42524cc5feef rtla/auto-analysis: Replace \t with spaces
    d32f12e15732 rtla/timerlat: Simplify "no value" printing on top
    8661a7af0499 riscv: rewrite __kernel_map_pages() to fix sleeping in invalid context
    6ee0c842d4ad iio: invensense: fix interrupt timestamp alignment
    955c824d543c iio: adc: axi-adc: make sure AXI clock is enabled
    33187fa1a8bb remoteproc: k3-r5: Do not allow core1 to power up before core0 via sysfs
    2494bc856e7c remoteproc: k3-r5: Wait for core0 power-up before powering up core1
    aa81c7b078e0 dmaengine: axi-dmac: fix possible race in remove()
    4145835ec209 PCI: rockchip-ep: Remove wrong mask on subsys_vendor_id
    3c361f313d69 ocfs2: fix races between hole punching and AIO+DIO
    7ec0e3b86f5a ocfs2: use coarse time for new created files
    518fbd644dab fs/proc: fix softlockup in __read_vmcore
    ba04b459efd1 knfsd: LOOKUP can return an illegal error value
    591d5b12f814 spmi: hisi-spmi-controller: Do not override device identifier
    e293c6b38ac9 vmci: prevent speculation leaks by sanitizing event in event_deliver()
    2d11505e79c7 dma-buf: handle testing kthreads creation failure
    e946428439a0 sock_map: avoid race between sock_map_close and sk_psock_put
    2c581ca0d68f null_blk: Print correct max open zones limit in null_init_zoned_dev()
    5fc6b708ef20 kheaders: explicitly define file modes for archived headers
    fcb88dc66b72 tracing/selftests: Fix kprobe event name test for .isra. functions
    d63e501ac6da riscv: fix overlap of allocated page and PTR_ERR
    7063f15d2ae2 perf auxtrace: Fix multiple use of --itrace option
    809a2ed17179 perf/core: Fix missing wakeup when waiting for context reference
    348008f0043c x86/amd_nb: Check for invalid SMN reads
    d91ddd050826 x86/kexec: Fix bug with call depth tracking
    5c0fb9cb404a irqchip/gic-v3-its: Fix potential race condition in its_vlpi_prop_update()
    6d0881a00d4c clkdev: Update clkdev id usage to allow for longer names
    dbf0787c2f45 mptcp: pm: update add_addr counters after connect
    09469a081715 mptcp: pm: inc RmAddr MIB counter once per RM_ADDR ID
    f1f0a46f8bb8 mptcp: ensure snd_una is properly initialized on connect
    35bcf16b4a28 drm/exynos: hdmi: report safe 640x480 mode as a fallback when no EDID found
    a269c5701244 drm/exynos/vidi: fix memory leak in .get_modes()
    fd880577c6d4 ACPI: x86: Force StorageD3Enable on more products
    5bf196f1936b parisc: Try to fix random segmentation faults in package builds
    a42b0060d6ff drivers: core: synchronize really_probe() and dev_uevent()
    e57c84e156e7 iio: imu: inv_icm42600: delete unneeded update watermark call
    aaf6b327a386 iio: invensense: fix odr switching to same value
    8e472061a32c iio: dac: ad5592r: fix temperature channel scaling value
    24ff87bb9f0b iio: adc: ad9467: fix scan type sign
    d4f3861893f9 x86/boot: Don't add the EFI stub to targets, again
    db20d4e4872b ksmbd: fix missing use of get_write in in smb2_set_ea()
    13b38f9262f5 ksmbd: move leading slash check to smb2_get_name()
    86c9713602f7 misc: microchip: pci1xxxx: fix double free in the error handling of gp_aux_bus_probe()
    ca6660c95624 bnxt_en: Adjust logging of firmware messages in case of released token in __hwrm_send()
    185c72f6b9eb af_unix: Read with MSG_PEEK loops if the first unread byte is OOB
    183ebc167a8a ionic: fix use after netif_napi_del()
    7caefa277172 net: bridge: mst: fix suspicious rcu usage in br_mst_set_state
    a6cc9e9a651b net: bridge: mst: pass vlan group directly to br_mst_vlan_set_state
    96d3265fc4f1 net/ipv6: Fix the RT cache flush via sysctl using a previous delay
    9a3eb4816ab9 nvmet-passthru: propagate status from id override functions
    fe1e395563cc block: fix request.queuelist usage in flush
    6b7155458ed2 block: sed-opal: avoid possible wrong address reference in read_sed_opal_key()
    35119b1139e7 net: stmmac: replace priv->speed with the portTransmitRate from the tc-cbs parameters
    d01f39f73bed gve: ignore nonrelevant GSO type bits when processing TSO headers
    b0c95cefd9b6 net: pse-pd: Use EOPNOTSUPP error code instead of ENOTSUPP
    2ad10c2aadb7 scsi: ufs: core: Quiesce request queues before checking pending cmds
    567cfc59e468 x86/uaccess: Fix missed zeroing of ia32 u64 get_user() range checking
    5396ce9a5e68 x86/asm: Use %c/%n instead of %P operand modifier in asm templates
    2ba35b37f780 netfilter: ipset: Fix race between namespace cleanup and gc in the list:set type
    b30669fdea0c netfilter: nft_inner: validate mandatory meta and payload
    7ccca396e989 Bluetooth: fix connection setup in l2cap_connect
    599a28fa9ecd Bluetooth: L2CAP: Fix rejecting L2CAP_CONN_PARAM_UPDATE_REQ
    110764a0713e net/mlx5e: Fix features validation check for tunneled UDP (non-VXLAN) packets
    bb5c1b0fbd98 geneve: Fix incorrect inner network header offset when innerprotoinherit is set
    c72660999c17 net dsa: qca8k: fix usages of device_get_named_child_node()
    d61808ac9947 tcp: fix race in tcp_v6_syn_recv_sock()
    b5c8ffc8cfde drm/bridge/panel: Fix runtime warning on panel bridge release
    9460961d8213 drm/komeda: check for error-valued pointer
    f100031fd6a5 net: stmmac: dwmac-qcom-ethqos: Configure host DMA width
    fd2b613bc4c5 liquidio: Adjust a NULL pointer handling path in lio_vf_rep_copy_packet
    47016dcb50e9 net: hns3: add cond_resched() to hns3 ring buffer init process
    689de7c3bfc7 net: hns3: fix kernel crash problem in concurrent scenario
    ef01c26d6f7a net: sfp: Always call `sfp_sm_mod_remove()` on remove
    6797259d9b92 modpost: do not warn about missing MODULE_DESCRIPTION() for vmlinux.o
    6fdc1152afae af_unix: Annotate data-race of sk->sk_state in unix_accept().
    b82c97a79b8e drm/vmwgfx: Don't memcmp equivalent pointers
    ce48b688a8d2 drm/vmwgfx: Remove STDU logic from generic mode_valid function
    15a875ecfc2f drm/vmwgfx: 3D disabled should not effect STDU memory limits
    3ca8e582e03e drm/vmwgfx: Filter modes which exceed graphics memory
    b0b05171de1f drm/vmwgfx: Refactor drm connector probing for display modes
    f677ca8cfefe HID: logitech-dj: Fix memory leak in logi_dj_recv_switch_to_dj_mode()
    1bbadf953fad io_uring/io-wq: avoid garbage value of 'match' in io_wq_enqueue()
    ab702c3483db io_uring/io-wq: Use set_bit() and test_bit() at worker->flags
    7388ae6f26c0 iommu: Return right value in iommu_sva_bind_device()
    c344d7030717 iommu/amd: Fix sysfs leak in iommu init
    30f76bc468b9 HID: core: remove unnecessary WARN_ON() in implement()
    17a6806f606f gpio: tqmx86: fix broken IRQ_TYPE_EDGE_BOTH interrupt type
    12043e85bd71 gpio: tqmx86: store IRQ trigger type and unmask status separately
    01aa7b7a3dd7 gpio: tqmx86: introduce shadow register for GPIO output value
    d69079010813 gpio: tqmx86: fix typo in Kconfig label
    b07a62f8c843 platform/x86: dell-smbios: Fix wrong token data in sysfs
    2c82e21bbc05 drm/panel: sitronix-st7789v: Add check for of_drm_get_panel_orientation
    ca060e255794 nvme: fix nvme_pr_* status code parsing
    beb2dde5e1b9 selftests/tracing: Fix event filter test to retry up to 10 times
    b21cae468849 NFS: add barriers when testing for NFS_FSDATA_BLOCKED
    b1a6e884de15 SUNRPC: return proper error from gss_wrap_req_priv
    c30988e06b15 NFSv4.1 enforce rootpath check in fs_location query
    a9aa5a49c8ed clk: sifive: Do not register clkdevs for PRCI clocks
    dff9b2238969 selftests/ftrace: Fix to check required event file
    3bf0b8030296 cachefiles: flush all requests after setting CACHEFILES_DEAD
    d2d3eb377a5d cachefiles: defer exposing anon_fd until after copy_to_user() succeeds
    527db1cb4cd6 cachefiles: never get a new anonymous fd if ondemand_id is valid
    1d95e5010ce8 cachefiles: remove err_put_fd label in cachefiles_ondemand_daemon_read()
    3958679c4915 cachefiles: fix slab-use-after-free in cachefiles_ondemand_daemon_read()
    a6de82765e12 cachefiles: fix slab-use-after-free in cachefiles_ondemand_get_fd()
    9f5fa40f0924 cachefiles: add restore command to recover inflight ondemand read requests
    e564e48ca299 cachefiles: add spin_lock for cachefiles_ondemand_info
    f740fd943bb1 cachefiles: resend an open request if the read request's object is closed
    33d21f0658cf cachefiles: extract ondemand info field from cachefiles_object
    955190e1851a cachefiles: introduce object ondemand state
    50d0e55356ba cachefiles: remove requests from xarray during flushing requests
    19133f53f199 cachefiles: add output string to cachefiles_obj_[get|put]_ondemand_fd
    d8316838aa06 cxl/region: Fix memregion leaks in devm_cxl_add_region()
    09b4aa2815bf cxl/test: Add missing vmalloc.h for tools/testing/cxl/test/mem.c
    b3f206985a33 HID: nvidia-shield: Add missing check for input_ff_create_memless
    af4cff0dd640 powerpc/uaccess: Fix build errors seen with GCC 13/14
    2ce5341c3699 gve: Clear napi->skb before dev_kfree_skb_any()
    323d2563bde0 scsi: sd: Use READ(16) when reading block zero on large capacity disks
    9079338c5a0d scsi: mpt3sas: Avoid test/set_bit() operating in non-allocated memory
    da097dccaece scsi: mpi3mr: Fix ATA NCQ priority support
    3e9785d3e92b scsi: core: Disable CDL by default
    d5ceeb0b6a71 thunderbolt: debugfs: Fix margin debugfs node creation condition
    d4121290b427 xhci: Apply broken streams quirk to Etron EJ188 xHCI host
    949be4ec5835 xhci: Handle TD clearing for multiple streams case
    0a834fb6dbd8 xhci: Apply reset resume quirk to Etron EJ188 xHCI host
    834c57876cc2 xhci: Set correct transferred length for cancelled bulk transfers
    4598233d9748 jfs: xattr: fix buffer overflow for invalid xattr
    cc30d05b34f9 landlock: Fix d_parent walk
    3380fa014a89 serial: port: Don't block system suspend even if bytes are left to xmit
    b895a1b981cf tty: n_tty: Fix buffer offsets when lookahead is used
    ce356d8d7e91 mei: me: release irq in mei_me_pci_resume error path
    ad47b23e4704 usb: typec: tcpm: Ignore received Hard Reset in TOGGLING state
    04c05d50fa79 usb: typec: tcpm: fix use-after-free case in tcpm_register_source_caps
    b641889cc1cf USB: xen-hcd: Traverse host/ when CONFIG_USB_XEN_HCD is selected
    72a3fe36cf9f USB: class: cdc-wdm: Fix CPU lockup caused by excessive log messages
    43cfac7b88ad io_uring: check for non-NULL file pointer in io_file_can_poll()
    0c9df3df0c88 io_uring/rsrc: don't lock while !TASK_RUNNING
    d18b05eda7fa nilfs2: fix nilfs_empty_dir() misjudgment and long loop on I/O errors
    8394dce13573 nilfs2: return the mapped address from nilfs_get_page()
    39a143a2b072 bpf: fix multi-uprobe PID filtering logic
    7ec535ed8724 eventfs: Update all the eventfs_inodes from the events descriptor
    1c88d94a7a33 irqchip/riscv-intc: Prevent memory leak when riscv_intc_init_common() fails
    85ca483e729d irqchip/riscv-intc: Introduce Andes hart-level interrupt controller
    482095341313 irqchip/riscv-intc: Allow large non-standard interrupt number
    01c987b8282c selftests/mm: compaction_test: fix bogus test success on Aarch64
    3f6ccd40afc4 selftests/mm: log a consistent test name for check_compaction
    d39532e9186a selftests/mm: conform test to TAP format output
    bb9bb13ce64c mm/memory-failure: fix handling of dissolved but not taken off from buddy pages
    fe01748ca6d6 memory-failure: use a folio in me_huge_page()
    130b4b9478c3 firmware: qcom_scm: disable clocks if qcom_scm_bw_enable() fails
    16ece7c5645a ksmbd: use rwsem instead of rwlock for lease break
    6548d543a274 net: ethtool: fix the error condition in ethtool_get_phy_stats_ethtool()
    7e796c3fefa8 ipv6: fix possible race in __fib6_drop_pcpu_from()
    d8011254e9b1 af_unix: Annotate data-race of sk->sk_shutdown in sk_diag_fill().
    60db0759c4f5 af_unix: Use skb_queue_len_lockless() in sk_diag_show_rqlen().
    471ec7b77a8d af_unix: Use skb_queue_empty_lockless() in unix_release_sock().
    f1683d07ebd1 af_unix: Use unix_recvq_full_lockless() in unix_stream_connect().
    29fce603b14b af_unix: Annotate data-race of net->unx.sysctl_max_dgram_qlen.
    996ec22ff576 af_unix: Annotate data-races around sk->sk_sndbuf.
    4398f59518ce af_unix: Annotate data-races around sk->sk_state in UNIX_DIAG.
    0ede400c32ae af_unix: Annotate data-race of sk->sk_state in unix_stream_read_skb().
    776fcc45e3f4 af_unix: Annotate data-races around sk->sk_state in sendmsg() and recvmsg().
    3d25de6486f4 af_unix: Annotate data-race of sk->sk_state in unix_stream_connect().
    484e036e1a2c af_unix: Annotate data-races around sk->sk_state in unix_write_space() and poll().
    4e38d6c04943 af_unix: Annotate data-race of sk->sk_state in unix_inq_len().
    45733e981e8c af_unix: Annodate data-races around sk->sk_state for writers.
    8003545ca10d af_unix: Set sk->sk_state under unix_state_lock() for truly disconencted peer.
    040d93848703 net: wwan: iosm: Fix tainted pointer delete is case of region creation fail
    649b63f5daf6 ice: add flag to distinguish reset from .ndo_bpf in XDP rings config
    eab834acb474 ice: remove af_xdp_zc_qps bitmap
    3201ba7d1c8c ice: fix iteration of TLVs in Preserved Fields Area
    b21bb09f8be6 ptp: Fix error message on failed pin verification
    724050ae4b76 net/sched: taprio: always validate TCA_TAPRIO_ATTR_PRIOMAP
    d857df86837a net/mlx5: Fix tainted pointer delete is case of flow rules creation fail
    6ccada6ffb42 net/mlx5: Always stop health timer during driver removal
    e3001df36cd6 net/mlx5: Stop waiting for PCI if pci channel is offline
    3dd41669b300 mptcp: count CLOSE-WAIT sockets for MPTCP_MIB_CURRESTAB
    acdf17546ef8 tcp: count CLOSE-WAIT sockets for TCP_MIB_CURRESTAB
    924f7bbfc5cf vxlan: Fix regression when dropping packets due to invalid src addresses
    54c2c171c11a net: sched: sch_multiq: fix possible OOB write in multiq_tune()
    cba5467442b2 net: phy: Micrel KSZ8061: fix errata solution not taking effect problem
    b03255294e88 net/smc: avoid overwriting when adjusting sock bufsizes
    2d7912f3ac65 octeontx2-af: Always allocate PF entries from low prioriy zone
    d387805d4b4a bpf: Set run context for rawtp test_run callback
    50569d12945f net: tls: fix marking packets as decrypted
    f8dd092e8b47 ipv6: sr: block BH in seg6_output_core() and seg6_input_core()
    db21c1ee6b6d ipv6: ioam: block BH from ioam6_output()
    9ee14af24e67 vmxnet3: disable rx data ring on dma allocation failure
    834aa2c34b8f KVM: SEV-ES: Delegate LBR virtualization to the processor
    b6e4076ca94b KVM: SEV: Do not intercept accesses to MSR_IA32_XSS for SEV-ES guests
    2128bae4ecab KVM: SEV-ES: Disallow SEV-ES guests when X86_FEATURE_LBRV is absent
    91cff53136da bpf: Fix a potential use-after-free in bpf_link_free()
    2ad2f2edb944 bpf: Optimize the free of inner map
    5aa03dd388d1 bpf: Store ref_ctr_offsets values in bpf_uprobe array
    02a255723e6b net: phy: micrel: fix KSZ9477 PHY issues after suspend/resume
    645e643eeb9a net/ncsi: Fix the multi thread manner of NCSI driver
    d7dd9d1f02b2 net/ncsi: Simplify Kconfig/dts control flow
    87cc2514162f ax25: Replace kfree() in ax25_dev_free() with ax25_dev_put()
    52100fd74ad0 ax25: Fix refcount imbalance on inbound connections
    909dc098a754 RISC-V: KVM: Fix incorrect reg_subtype labels in kvm_riscv_vcpu_set_reg_isa_ext function
    5d8622f61ef1 RISC-V: KVM: No need to use mask when hart-index-bit is 0
    b2b1043ac1f5 scsi: ufs: mcq: Fix error output and clean up ufshcd_mcq_abort()
    2f467fefdfae wifi: mac80211: correctly parse Spatial Reuse Parameter Set element
    a05018739a5e wifi: iwlwifi: mvm: don't read past the mfuart notifcation
    29a18d56bd64 wifi: iwlwifi: mvm: check n_ssids before accessing the ssids
    f7773fff6dda wifi: iwlwifi: dbg_ini: move iwl_dbg_tlv_free outside of debugfs ifdef
    bdfa7cf3281b wifi: iwlwifi: mvm: set properly mac header
    1ef2671de723 wifi: iwlwifi: mvm: revert gen2 TX A-MPDU size to 64
    1fd3f32695af wifi: iwlwifi: mvm: don't initialize csa_work twice
    ff2b4dc81e67 wifi: cfg80211: pmsr: use correct nla_get_uX functions
    0ccc63958d83 wifi: cfg80211: Lock wiphy in cfg80211_get_station
    46b7eff59a32 wifi: cfg80211: fully move wiphy work to unbound workqueue
    456bbb8a31e4 wifi: mac80211: Fix deadlock in ieee80211_sta_ps_deliver_wakeup()
    63d5f89bb566 wifi: mac80211: mesh: Fix leak of mesh_preq_queue objects
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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c404775afcb500aa931ace1289df7a194f0778ba)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 50f4fe0eb6..3900690c74 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e88fd5bf97b83b10f7e93c2af4100cd16d59db63"
-SRCREV_meta ?= "e48b725284bb2889c8c5da8d255ec277f44bf8a0"
+SRCREV_machine ?= "1d96726faac7f57c1bb3466edc283d929fc183b6"
+SRCREV_meta ?= "fe550a76832d3c144e7af34ab78d5da0dcf092ce"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.34"
+LINUX_VERSION ?= "6.6.35"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index a330e14468..0a9b96753c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.34"
+LINUX_VERSION ?= "6.6.35"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "64ebf485c56b5375d9196020b3ed92f857283ee0"
-SRCREV_meta ?= "e48b725284bb2889c8c5da8d255ec277f44bf8a0"
+SRCREV_machine ?= "4c1fbbd1c2b7c31e1755cfa83199cdfcb9707832"
+SRCREV_meta ?= "fe550a76832d3c144e7af34ab78d5da0dcf092ce"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index f67d73d2e6..808561f45a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "a12679d200785775317fb7b7fe9b145cd77187eb"
-SRCREV_machine:qemuarm64 ?= "64ebf485c56b5375d9196020b3ed92f857283ee0"
-SRCREV_machine:qemuloongarch64 ?= "64ebf485c56b5375d9196020b3ed92f857283ee0"
-SRCREV_machine:qemumips ?= "f0ff71ea239e1395c9318d4edd2213a702aa8d19"
-SRCREV_machine:qemuppc ?= "64ebf485c56b5375d9196020b3ed92f857283ee0"
-SRCREV_machine:qemuriscv64 ?= "64ebf485c56b5375d9196020b3ed92f857283ee0"
-SRCREV_machine:qemuriscv32 ?= "64ebf485c56b5375d9196020b3ed92f857283ee0"
-SRCREV_machine:qemux86 ?= "64ebf485c56b5375d9196020b3ed92f857283ee0"
-SRCREV_machine:qemux86-64 ?= "64ebf485c56b5375d9196020b3ed92f857283ee0"
-SRCREV_machine:qemumips64 ?= "39f86019c95a6efb4aa3bf4d0185f05bb184d29b"
-SRCREV_machine ?= "64ebf485c56b5375d9196020b3ed92f857283ee0"
-SRCREV_meta ?= "e48b725284bb2889c8c5da8d255ec277f44bf8a0"
+SRCREV_machine:qemuarm ?= "7e5d1df22352c96c1d63d81d59457ff30e82e2d9"
+SRCREV_machine:qemuarm64 ?= "4c1fbbd1c2b7c31e1755cfa83199cdfcb9707832"
+SRCREV_machine:qemuloongarch64 ?= "4c1fbbd1c2b7c31e1755cfa83199cdfcb9707832"
+SRCREV_machine:qemumips ?= "f26493dbcd22b4d89beed4eabdc52d124d59658a"
+SRCREV_machine:qemuppc ?= "4c1fbbd1c2b7c31e1755cfa83199cdfcb9707832"
+SRCREV_machine:qemuriscv64 ?= "4c1fbbd1c2b7c31e1755cfa83199cdfcb9707832"
+SRCREV_machine:qemuriscv32 ?= "4c1fbbd1c2b7c31e1755cfa83199cdfcb9707832"
+SRCREV_machine:qemux86 ?= "4c1fbbd1c2b7c31e1755cfa83199cdfcb9707832"
+SRCREV_machine:qemux86-64 ?= "4c1fbbd1c2b7c31e1755cfa83199cdfcb9707832"
+SRCREV_machine:qemumips64 ?= "1ef0c6554b95984a5fc9e7cd3bb27ab617204149"
+SRCREV_machine ?= "4c1fbbd1c2b7c31e1755cfa83199cdfcb9707832"
+SRCREV_meta ?= "fe550a76832d3c144e7af34ab78d5da0dcf092ce"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "76d42e596d895c53abf86daca4e5877fe0088145"
+SRCREV_machine:class-devupstream ?= "5f2d0708acd0e1d2475d73c61819053de284bcc4"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.34"
+LINUX_VERSION ?= "6.6.35"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


