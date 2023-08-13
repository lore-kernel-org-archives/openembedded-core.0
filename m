Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10857C04A94
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 21:19:29 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.93788.1691961564950427105
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 14:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=q/e13lnb;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2680a031283so2073340a91.3
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 14:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691961564; x=1692566364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Zmt8i/eaVN6MPcfbI09cgqIadlxHxITgyn3hA95XlY=;
        b=q/e13lnbmY/WHxfxm81hKIFjsik+ItxvSEzG7pC9HzsT4Yn1hm/Sa1QGnjVeiDNrLo
         Sr8q8TcFau46ACJkCHXfPsv7GcLg0o/bNoQIhXmKF2woAWnFvC56J8yP9nLE+cRNOeHw
         i3Y3pBic4EyAqkjQVcQ6qlDR5ake+RmpfXYn8IrckrxoGgpaIETw8t75tLCAbBtr32JO
         nhvgscb756J5GWWYgj8DoKL5uI3g7R3CavUnpHjoBIUsTDxmUVFEVU2q+LBK8Yq0LlUT
         DOW+P/sE4iW0dp5zn3R3JNZlHP1QSOhI2ufkS/N1OOediiyNUkx993nBXA9veVQbmKcH
         RHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691961564; x=1692566364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Zmt8i/eaVN6MPcfbI09cgqIadlxHxITgyn3hA95XlY=;
        b=AELREHqJisaKGXypgh7hrjZn847KC1g9xNUuyV7FIzqbJBUkPOaZ/WX5fRoxIa50rT
         BtQCE4TADotSQKkwgFXW3iY2+IX5ypzRXLuDN3Owxy8JB7lYU3b01BZKIFphsXAGiqz6
         gvA/rPsrG1aAN3B4Awt7RwAo52BHZtejP7wGfn61tn/jqZumswuu/5auOsUqqBlQhT6M
         a1xlUmPaCB5yJtPsd4lTGXtJ+OnYfL5ddGxJgvojcdLV+xdToviX/JePlB5sUDcbKFbH
         JhTHd8VlD6I9ipRYAleliarTY04a8PDh7/ugi1fiuzdLmhK2FRFO7gHZCVQhF2suX6H6
         fnxg==
X-Gm-Message-State: AOJu0Yw5v+sg7csE7Re3cpG+QXClEXtJYFwwVIBr5bMx6REBYF370JmQ
	38ytuVeup1n7Cx20lcSxK7fNaAaDqA9xGTLWFoS11w==
X-Google-Smtp-Source: AGHT+IF6A7Y0wntmsgUDZ5K+kS45fyOCrniVlJJWKLTakF7ws7IvcAWau+pXCYyRH+S07nszvNQn7g==
X-Received: by 2002:a17:90a:4903:b0:26b:5ccb:4bd2 with SMTP id c3-20020a17090a490300b0026b5ccb4bd2mr728799pjh.38.1691961563522;
        Sun, 13 Aug 2023 14:19:23 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id qa2-20020a17090b4fc200b00263dfe9b972sm8690578pjb.0.2023.08.13.14.19.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 14:19:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/22] linux-yocto/5.4: update to v5.4.251
Date: Sun, 13 Aug 2023 11:18:24 -1000
Message-Id: <9d509daf5fdae6b5dd8a81490ee40ea119a42024.1691961051.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691961051.git.steve@sakoman.com>
References: <cover.1691961051.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 21:19:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185909

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    887433e4bc93 Linux 5.4.251
    1e02fbe4f0ed tracing/histograms: Return an error if we fail to add histogram to hist_vars list
    b1062596556e tcp: annotate data-races around fastopenq.max_qlen
    21c325d01ecc tcp: annotate data-races around tp->notsent_lowat
    7175277b4d0b tcp: annotate data-races around rskq_defer_accept
    3121d649e4c6 tcp: annotate data-races around tp->linger2
    b1cd5655fc13 net: Replace the limit of TCP_LINGER2 with TCP_FIN_TIMEOUT_MAX
    8ce44cf35ef6 tcp: annotate data-races around tp->tcp_tx_delay
    c822536b3e41 netfilter: nf_tables: can't schedule in nft_chain_validate
    caa228792fb5 netfilter: nf_tables: fix spurious set element insertion failure
    b8944e53ee70 llc: Don't drop packet from non-root netns.
    b07e31824df6 fbdev: au1200fb: Fix missing IRQ check in au1200fb_drv_probe
    6d39e9fc5934 Revert "tcp: avoid the lookup process failing to get sk in ehash table"
    0c0bd9789a8d net:ipv6: check return value of pskb_trim()
    17046107ca15 iavf: Fix use-after-free in free_netdev
    765e1eaf42de net: ethernet: ti: cpsw_ale: Fix cpsw_ale_get_field()/cpsw_ale_set_field()
    3b6f56021af6 pinctrl: amd: Use amd_pinconf_set() for all config options
    951f4e9730f1 fbdev: imxfb: warn about invalid left/right margin
    3e03319ab97d spi: bcm63xx: fix max prepend length
    c9f56f3c7bc9 igb: Fix igb_down hung on surprise removal
    7d80e834625c wifi: iwlwifi: mvm: avoid baid size integer overflow
    41d149376078 wifi: wext-core: Fix -Wstringop-overflow warning in ioctl_standard_iw_point()
    970c7035f4b0 devlink: report devlink_port_type_warn source device
    e09a285ea1e8 bpf: Address KCSAN report on bpf_lru_list
    cec1857b1ea5 sched/fair: Don't balance task to its current running CPU
    9d8d3df71516 arm64: mm: fix VA-range sanity check
    8ad6679a5bb9 posix-timers: Ensure timer ID search-loop limit is valid
    d0345f7c7dbc md/raid10: prevent soft lockup while flush writes
    09539f9e2076 md: fix data corruption for raid456 when reshape restart while grow up
    4181c30a2c55 nbd: Add the maximum limit of allocated index in nbd_dev_add
    d4f1cd9b9d66 debugobjects: Recheck debug_objects_enabled before reporting
    0afcebcec057 ext4: correct inline offset when handling xattrs in inode body
    5d580017bdb9 drm/client: Fix memory leak in drm_client_modeset_probe
    52daf6ba2e0d drm/client: Fix memory leak in drm_client_target_cloned
    9533dbfac0ff can: bcm: Fix UAF in bcm_proc_show()
    5dd838be69e4 selftests: tc: set timeout to 15 minutes
    7f83199862c2 fuse: revalidate: don't invalidate if interrupted
    ae91ab710d8e btrfs: fix warning when putting transaction with qgroups enabled after abort
    e217a3d19e10 perf probe: Add test for regression introduced by switch to die_get_decl_file()
    380c7ceabdde drm/atomic: Fix potential use-after-free in nonblocking commits
    b7084ebf4f54 scsi: qla2xxx: Remove unused nvme_ls_waitq wait queue
    3f22f9ddbb29 scsi: qla2xxx: Pointer may be dereferenced
    a1c5149a82de scsi: qla2xxx: Correct the index of array
    1b7e5bdf2be2 scsi: qla2xxx: Check valid rport returned by fc_bsg_to_rport()
    4f90a8b04816 scsi: qla2xxx: Fix potential NULL pointer dereference
    d25fded78d88 scsi: qla2xxx: Wait for io return on terminate rport
    056fd1820724 tracing/probes: Fix not to count error code to total length
    93114cbc7cb1 tracing: Fix null pointer dereference in tracing_err_log_open()
    597eb52583d4 xtensa: ISS: fix call to split_if_spec
    e84829522fc7 ring-buffer: Fix deadloop issue on reading trace_pipe
    481535905608 tracing/histograms: Add histograms to hist_vars if they have referenced variables
    46574e5a0a2a tty: serial: samsung_tty: Fix a memory leak in s3c24xx_serial_getclk() when iterating clk
    30962268fa1a tty: serial: samsung_tty: Fix a memory leak in s3c24xx_serial_getclk() in case of error
    0697a1a592c7 Revert "8250: add support for ASIX devices with a FIFO bug"
    45e55e9cac13 meson saradc: fix clock divider mask length
    2cdced57bc00 ceph: don't let check_caps skip sending responses for revoke msgs
    1883a484c87e hwrng: imx-rngc - fix the timeout for init and self check
    e3373e6b6c79 firmware: stratix10-svc: Fix a potential resource leak in svc_create_memory_pool()
    826c7bfe5c49 serial: atmel: don't enable IRQs prematurely
    15d4bd0f0a6b drm/rockchip: vop: Leave vblank enabled in self-refresh
    6bc6ec8b0a0b drm/atomic: Allow vblank-enabled + self-refresh "disable"
    f86942709b0e fs: dlm: return positive pid value for F_GETLK
    ecfd1f82c4f5 md/raid0: add discard support for the 'original' layout
    dac4afa3efae misc: pci_endpoint_test: Re-init completion for every test
    dd2210379205 misc: pci_endpoint_test: Free IRQs before removing the device
    9cfa4ef25de5 PCI: rockchip: Set address alignment for endpoint mode
    35aec6bc0c04 PCI: rockchip: Use u32 variable to access 32-bit registers
    13b93891308c PCI: rockchip: Fix legacy IRQ generation for RK3399 PCIe endpoint core
    c049b20655f6 PCI: rockchip: Add poll and timeout to wait for PHY PLLs to be locked
    a1f311d430f2 PCI: rockchip: Write PCI Device ID to correct register
    592795119f2b PCI: rockchip: Assert PCI Configuration Enable bit after probe
    35c95eda7b6d PCI: qcom: Disable write access to read only registers for IP v2.3.3
    b0aac7792525 PCI: Add function 1 DMA alias quirk for Marvell 88SE9235
    f450388d8b6d PCI/PM: Avoid putting EloPOS E2/S2/H2 PCIe Ports in D3cold
    a4855aeb13e4 jfs: jfs_dmap: Validate db_l2nbperpage while mounting
    ee2fd448608e ext4: only update i_reserved_data_blocks on successful block allocation
    02543d1ddd77 ext4: fix wrong unit use in ext4_mb_clear_bb
    96a85becb811 erofs: fix compact 4B support for 16k block size
    42725e5c1b18 SUNRPC: Fix UAF in svc_tcp_listen_data_ready()
    29a560437f67 misc: fastrpc: Create fastrpc scalar with correct buffer count
    b157987242bd powerpc: Fail build if using recordmcount with binutils v2.37
    2b59740ebc86 net: bcmgenet: Ensure MDIO unregistration has clocks enabled
    1fe96568e78b mtd: rawnand: meson: fix unaligned DMA buffers handling
    86b9820395f2 tpm: tpm_vtpm_proxy: fix a race condition in /dev/vtpmx creation
    96a16069a81d pinctrl: amd: Only use special debounce behavior for GPIO 0
    6dcb493fc478 pinctrl: amd: Detect internal GPIO0 debounce handling
    a1a443651569 pinctrl: amd: Fix mistake in handling clearing pins at startup
    cf57a0853ba5 net/sched: make psched_mtu() RTNL-less safe
    96391959a99e net/sched: flower: Ensure both minimum and maximum ports are specified
    166fa538e0dd cls_flower: Add extack support for src and dst port range options
    aadca5f08aef wifi: airo: avoid uninitialized warning in airo_get_rate()
    cc2c06ca7fbf erofs: avoid infinite loop in z_erofs_do_read_page() when reading beyond EOF
    b55c38fe2441 platform/x86: wmi: Break possible infinite loop when parsing GUID
    cb8a256202b9 platform/x86: wmi: move variables
    669c488cb25a platform/x86: wmi: use guid_t and guid_equal()
    fd8049d6553f platform/x86: wmi: remove unnecessary argument
    4c8e26fc3302 platform/x86: wmi: Fix indentation in some cases
    8717326e4362 platform/x86: wmi: Replace UUID redefinitions by their originals
    c7eeba470585 ipv6/addrconf: fix a potential refcount underflow for idev
    7a06554214fe NTB: ntb_tool: Add check for devm_kcalloc
    88e243618e4c NTB: ntb_transport: fix possible memory leak while device_register() fails
    b5b9e041eb04 ntb: intel: Fix error handling in intel_ntb_pci_driver_init()
    0ae4fac8fe33 NTB: amd: Fix error handling in amd_ntb_pci_driver_init()
    bb17520c0383 ntb: idt: Fix error handling in idt_pci_driver_init()
    4e64ef41c6cf udp6: fix udp6_ehashfn() typo
    61b4c4659746 icmp6: Fix null-ptr-deref of ip6_null_entry->rt6i_idev in icmp6_dev().
    4c7276a6daf7 ionic: remove WARN_ON to prevent panic_on_warn
    3e77647acdcf ionic: ionic_intr_free parameter change
    f0dc38bdef52 ionic: move irq request to qcq alloc
    7cf21fba1bf8 ionic: clean irq affinity on queue deinit
    ef7fc26b6a19 ionic: improve irq numa locality
    808211a8d427 net/sched: cls_fw: Fix improper refcount update leads to use-after-free
    d98ac5bce2d5 net: mvneta: fix txq_map in case of txq_number==1
    58cd168825b4 scsi: qla2xxx: Fix error code in qla2x00_start_sp()
    b49b55a7d578 igc: set TP bit in 'supported' and 'advertising' fields of ethtool_link_ksettings
    a45afb07121c igc: Remove delay during TX ring configuration
    59c190082a01 drm/panel: simple: Add connector_type for innolux_at043tn24
    64b76abfe32d drm/panel: Add and fill drm_panel type field
    362940f8e40f drm/panel: Initialise panel dev and funcs through drm_panel_init()
    6d5172a3ab8f workqueue: clean up WORK_* constant types, clarify masking
    003d33924911 net: lan743x: Don't sleep in atomic context
    373b9475ea8c block/partition: fix signedness issue for Amiga partitions
    22df19fee7b9 tty: serial: fsl_lpuart: add earlycon for imx8ulp platform
    b7d636c924eb netfilter: nf_tables: prevent OOB access in nft_byteorder_eval
    61c7a5256543 netfilter: conntrack: Avoid nf_ct_helper_hash uses after free
    565bdccdded3 netfilter: nf_tables: fix scheduling-while-atomic splat
    7c4610ac3b41 netfilter: nf_tables: unbind non-anonymous set if rule construction fails
    90d54ee329d2 netfilter: nf_tables: reject unbound anonymous set before commit phase
    1df28fde1270 netfilter: nf_tables: add NFT_TRANS_PREPARE_ERROR to deal with bound set/chain
    1adb5c272b20 netfilter: nf_tables: incorrect error path handling with NFT_MSG_NEWRULE
    077ef851f0a3 netfilter: nf_tables: add rescheduling points during loop detection walks
    11352851944c netfilter: nf_tables: use net_generic infra for transaction data
    d59ed9dc0058 netfilter: add helper function to set up the nfnetlink header and use it
    fa498dead9ee netfilter: nftables: add helper function to set the base sequence number
    ef35dd70a340 netfilter: nf_tables: fix nat hook table deletion
    d1b7fe307c75 block: add overflow checks for Amiga partition support
    2b71cbf7ab48 fanotify: disallow mount/sb marks on kernel internal pseudo fs
    9a6ce27a5d61 fs: no need to check source
    c1c41cda0ab1 ARM: orion5x: fix d2net gpio initialization
    679c34821ab7 btrfs: fix race when deleting quota root from the dirty cow roots list
    f0fbbd405a94 fs: Lock moved directories
    b97ac51f8492 fs: Establish locking order for unrelated directories
    d95dc41ad181 Revert "f2fs: fix potential corruption when moving a directory"
    a9a926423a63 ext4: Remove ext4 locking of moved directory
    eefebf8877d3 fs: avoid empty option when generating legacy mount string
    e9a3310bc2fc jffs2: reduce stack usage in jffs2_build_xattr_subsystem()
    a249a61ac528 integrity: Fix possible multiple allocation in integrity_inode_get()
    0729029e6472 bcache: Remove unnecessary NULL point check in node allocations
    4be68f1c7076 mmc: sdhci: fix DMA configure compatibility issue when 64bit DMA mode is used.
    2f6c76994646 mmc: core: disable TRIM on Micron MTFC4GACAJCN-1M
    c491e27151c1 mmc: core: disable TRIM on Kingston EMMC04G-M627
    ce7278dedab7 NFSD: add encoding of op_recall flag for write delegation
    5016511287dc ALSA: jack: Fix mutex call in snd_jack_report()
    c64fda48a3ad i2c: xiic: Don't try to handle more interrupt events after error
    696e470e910e i2c: xiic: Defer xiic_wakeup() and __xiic_start_xfer() in xiic_process()
    498962715773 sh: dma: Fix DMA channel offset calculation
    58b1b3c54e16 net: dsa: tag_sja1105: fix MAC DA patching from meta frames
    67a67e258407 net/sched: act_pedit: Add size check for TCA_PEDIT_PARMS_EX
    ab0085bd7902 xsk: Honor SO_BINDTODEVICE on bind
    9347e432297e xsk: Improve documentation for AF_XDP
    e63dc31b9452 tcp: annotate data races in __tcp_oow_rate_limited()
    e9c2687988b7 net: bridge: keep ports without IFF_UNICAST_FLT in BR_PROMISC mode
    fffa51e786ce powerpc: allow PPC_EARLY_DEBUG_CPM only when SERIAL_CPM=y
    45b34500f3ef f2fs: fix error path handling in truncate_dnode()
    860d9b717f65 mailbox: ti-msgmgr: Fill non-message tx data fields with 0x0
    398e6a015877 spi: bcm-qspi: return error if neither hif_mspi nor mspi is available
    18d50fb44109 Add MODULE_FIRMWARE() for FIRMWARE_TG357766.
    4d8fc6137749 sctp: fix potential deadlock on &net->sctp.addr_wq_lock
    999ff7fe492b rtc: st-lpc: Release some resources in st_rtc_probe() in case of error
    d5c39cca4d03 pwm: sysfs: Do not apply state to already disabled PWMs
    5375c024f8ae pwm: imx-tpm: force 'real_period' to be zero in suspend
    d252c74b8b7a mfd: stmpe: Only disable the regulators if they are enabled
    d9db18addf42 KVM: s390: vsie: fix the length of APCB bitmap
    baec796723b7 mfd: stmfx: Fix error path in stmfx_chip_init
    5d26f134efa8 serial: 8250_omap: Use force_suspend and resume for system suspend
    337073cacad4 mfd: intel-lpss: Add missing check for platform_get_resource
    0a6afc83b028 usb: dwc3: qcom: Release the correct resources in dwc3_qcom_remove()
    becd09685d44 KVM: s390: fix KVM_S390_GET_CMMA_BITS for GFNs in memslot holes
    151b0dd6d1a0 mfd: rt5033: Drop rt5033-battery sub-device
    8e8dae8eb230 usb: hide unused usbfs_notify_suspend/resume functions
    fe9cdc198619 usb: phy: phy-tahvo: fix memory leak in tahvo_usb_probe()
    1531ba3fab51 extcon: Fix kernel doc of property capability fields to avoid warnings
    257daec29dcd extcon: Fix kernel doc of property fields to avoid warnings
    648a163cff21 usb: dwc3: qcom: Fix potential memory leak
    d485150c9a52 media: usb: siano: Fix warning due to null work_func_t function pointer
    619e6f9a564a media: videodev2.h: Fix struct v4l2_input tuner index comment
    e9586c49bdd4 media: usb: Check az6007_read() return value
    fd869bdb5f12 sh: j2: Use ioremap() to translate device tree address into kernel memory
    85f4c53849e4 w1: fix loop in w1_fini()
    dc88382c1d44 block: change all __u32 annotations to __be32 in affs_hardblocks.h
    fa8548d1a0a4 block: fix signed int overflow in Amiga partition support
    bec218258cbd usb: dwc3: gadget: Propagate core init errors to UDC during pullup
    f55127df9918 USB: serial: option: add LARA-R6 01B PIDs
    bac502cd472a hwrng: st - keep clock enabled while hwrng is registered
    071560202a52 hwrng: st - Fix W=1 unused variable warning
    18fa56ca4cb8 NFSv4.1: freeze the session table upon receiving NFS4ERR_BADSESSION
    c182d87c67e2 ARC: define ASM_NL and __ALIGN(_STR) outside #ifdef __ASSEMBLY__ guard
    02dc8e8bdbe4 modpost: fix off by one in is_executable_section()
    1030c0c30968 crypto: marvell/cesa - Fix type mismatch warning
    ad3c4ecff00b modpost: fix section mismatch message for R_ARM_{PC24,CALL,JUMP24}
    084bf580019c modpost: fix section mismatch message for R_ARM_ABS32
    c893658d9ce6 crypto: nx - fix build warnings when DEBUG_FS is not enabled
    a43bcb0b661c hwrng: virtio - Fix race on data_avail and actual data
    b70315e44f03 hwrng: virtio - always add a pending request
    102a354d52ca hwrng: virtio - don't waste entropy
    f2a7dfd35f0c hwrng: virtio - don't wait on cleanup
    6fe732764a58 hwrng: virtio - add an internal buffer
    2cbfb51d2c7e powerpc/mm/dax: Fix the condition when checking if altmap vmemap can cross-boundary
    aa3932eb0739 pinctrl: at91-pio4: check return value of devm_kasprintf()
    e297350c33f6 perf dwarf-aux: Fix off-by-one in die_get_varname()
    7f822c8036fe pinctrl: cherryview: Return correct value if pin in push-pull mode
    1768e362f20f PCI: Add pci_clear_master() stub for non-CONFIG_PCI
    5d3955bc32d4 PCI: ftpci100: Release the clock resources
    331dce61c0d4 PCI: pciehp: Cancel bringup sequence if card is not present
    f58c8563686b scsi: 3w-xxxx: Add error handling for initialization failure in tw_probe()
    666e7f9d60ce PCI/ASPM: Disable ASPM on MFD function removal to avoid use-after-free
    961c8370c5f7 scsi: qedf: Fix NULL dereference in error handling
    6f64558b43cf ASoC: imx-audmix: check return value of devm_kasprintf()
    35455616110b clk: keystone: sci-clk: check return value of kasprintf()
    ffe6ad17cf14 clk: cdce925: check return value of kasprintf()
    5f13d67027fa ALSA: ac97: Fix possible NULL dereference in snd_ac97_mixer
    801c8341f7af clk: tegra: tegra124-emc: Fix potential memory leak
    262db3ff58e2 drm/radeon: fix possible division-by-zero errors
    cacc0506e571 drm/amdkfd: Fix potential deallocation of previously deallocated memory.
    9e3858f82e3c fbdev: omapfb: lcd_mipid: Fix an error handling path in mipid_spi_probe()
    5541d1856c87 arm64: dts: renesas: ulcb-kf: Remove flow control for SCIF1
    40ac5cb6cbb0 IB/hfi1: Fix sdma.h tx->num_descs off-by-one errors
    68e0033dee72 soc/fsl/qe: fix usb.c build errors
    b756eb5eb9b0 ASoC: es8316: Do not set rate constraints for unsupported MCLKs
    d1c1ca27cac0 ASoC: es8316: Increment max value for ALC Capture Target Volume control
    b54bac970b54 memory: brcmstb_dpfe: fix testing array offset after use
    f54142ed16b5 ARM: ep93xx: fix missing-prototype warnings
    c2324c5aa247 drm/panel: simple: fix active size for Ampire AM-480272H3TMQW-T01H
    4a23954279fc arm64: dts: qcom: msm8916: correct camss unit address
    97dcb8dfefaa ARM: dts: gta04: Move model property out of pinctrl node
    25bbd1c7bef8 RDMA/bnxt_re: Fix to remove an unnecessary log
    ed039ad88ab0 drm: sun4i_tcon: use devm_clk_get_enabled in `sun4i_tcon_init_clocks`
    87ccaf56097a Input: adxl34x - do not hardcode interrupt trigger type
    c7a8cc9140cf ARM: dts: BCM5301X: Drop "clock-names" from the SPI node
    c516c00847f5 Input: drv260x - sleep between polling GO bit
    3e789aee218b radeon: avoid double free in ci_dpm_init()
    bc5b57a23087 netlink: Add __sock_i_ino() for __netlink_diag_dump().
    1c405b3d3769 ipvlan: Fix return value of ipvlan_queue_xmit()
    1d2ab3d4383e netfilter: nf_conntrack_sip: fix the ct_sip_parse_numerical_param() return value.
    337fdce45063 netfilter: conntrack: dccp: copy entire header to stack buffer, not just basic one
    32deadf89430 lib/ts_bm: reset initial match offset for every block of text
    dd6ff3f38627 net: nfc: Fix use-after-free caused by nfc_llcp_find_local
    edc5d8776a32 nfc: llcp: simplify llcp_sock_connect() error paths
    9c9662e2512b gtp: Fix use-after-free in __gtp_encap_destroy().
    08d8ff1bc688 selftests: rtnetlink: remove netdevsim device after ipsec offload test
    bd1de6107f10 netlink: do not hard code device address lenth in fdb dumps
    8f6652ed2ad9 netlink: fix potential deadlock in netlink_set_err()
    88d89b4a3102 wifi: ath9k: convert msecs to jiffies where needed
    76d5bda2c3af wifi: cfg80211: rewrite merging of inherited elements
    e4c33144fc75 wifi: iwlwifi: pull from TXQs with softirqs disabled
    2ba902da9090 rtnetlink: extend RTEXT_FILTER_SKIP_STATS to IFLA_VF_INFO
    786e264b37d2 wifi: ath9k: Fix possible stall on ath9k_txq_list_has_key()
    68305a19bada memstick r592: make memstick_debug_get_tpc_name() static
    6f4454ccbea9 kexec: fix a memory leak in crash_shrink_memory()
    4503261ab97b watchdog/perf: more properly prevent false positives with turbo modes
    d5fa3918dfce watchdog/perf: define dummy watchdog_update_hrtimer_threshold() on correct config
    7874fb3bef8b wifi: rsi: Do not set MMC_PM_KEEP_POWER in shutdown
    4dc3560561a0 wifi: ath9k: don't allow to overwrite ENDPOINT0 attributes
    f432198058a6 wifi: ray_cs: Fix an error handling path in ray_probe()
    8fe51dce8bdc wifi: ray_cs: Drop useless status variable in parse_addr()
    0dec0ad304d4 wifi: ray_cs: Utilize strnlen() in parse_addr()
    ee73ad566a29 wifi: wl3501_cs: Fix an error handling path in wl3501_probe()
    b7df4e0cb4ed wl3501_cs: use eth_hw_addr_set()
    24f34f67be24 net: create netdev->dev_addr assignment helpers
    dd5dca10d806 wl3501_cs: Fix misspelling and provide missing documentation
    051d70773b9c wl3501_cs: Remove unnecessary NULL check
    91c3c9eaf1ed wl3501_cs: Fix a bunch of formatting issues related to function docs
    add539f7d16b wifi: atmel: Fix an error handling path in atmel_probe()
    5b06f702805d wifi: orinoco: Fix an error handling path in orinoco_cs_probe()
    ca4a2955d866 wifi: orinoco: Fix an error handling path in spectrum_cs_probe()
    91c3325da240 regulator: core: Streamline debugfs operations
    1bb38ef697e4 regulator: core: Fix more error checking for debugfs_create_dir()
    6ca0c94f2b02 nfc: llcp: fix possible use of uninitialized variable in nfc_llcp_send_connect()
    66a1be74230b nfc: constify several pointers to u8, char and sk_buff
    fea2104e752a wifi: mwifiex: Fix the size of a memory allocation in mwifiex_ret_802_11_scan()
    bc5099512057 spi: spi-geni-qcom: Correct CS_TOGGLE bit in SPI_TRANS_CFG
    f394d204d640 samples/bpf: Fix buffer overflow in tcp_basertt
    90e3c1017757 wifi: ath9k: avoid referencing uninit memory in ath9k_wmi_ctrl_rx
    be3989d93be3 wifi: ath9k: fix AR9003 mac hardware hang check register offset calculation
    717e4277ddf7 ima: Fix build warnings
    8430a8e8e854 pstore/ram: Add check for kstrdup
    540cdd720772 evm: Complete description of evm_inode_setattr()
    568b73406d93 ARM: 9303/1: kprobes: avoid missing-declaration warnings
    ba6da16eefb1 powercap: RAPL: Fix CONFIG_IOSF_MBI dependency
    c97460ce1f7c PM: domains: fix integer overflow issues in genpd_parse_state()
    54cc10a0f4b0 clocksource/drivers/cadence-ttc: Fix memory leak in ttc_timer_probe
    38ca169d66c3 clocksource/drivers/cadence-ttc: Use ttc driver as platform driver
    8af3b8d770da tracing/timer: Add missing hrtimer modes to decode_hrtimer_mode().
    7b0c664541cd irqchip/jcore-aic: Fix missing allocation of IRQ descriptors
    d244927e350e irqchip/jcore-aic: Kill use of irq_create_strict_mappings()
    be481881753b md/raid10: fix io loss while replacement replace rdev
    45fa023b3334 md/raid10: fix null-ptr-deref of mreplace in raid10_sync_request
    31c805a44b75 md/raid10: fix wrong setting of max_corr_read_errors
    283f4a63fee3 md/raid10: fix overflow of md/safe_mode_delay
    b0b971fe7d61 md/raid10: check slab-out-of-bounds in md_bitmap_get_counter
    484104918305 x86/resctrl: Only show tasks' pid in current pid namespace
    7206eca1ac44 x86/resctrl: Use is_closid_match() in more places
    6f2bb37da468 bgmac: fix *initial* chip reset to support BCM5358
    794bfb6fd992 drm/amdgpu: Validate VM ioctl flags.
    2a4cfd5b0354 scripts/tags.sh: Resolve gtags empty index generation
    fff826d665f9 drm/i915: Initialise outparam for error return from wait_for_register
    99036f1aed7e HID: wacom: Use ktime_t rather than int when dealing with timestamps
    815c95d82b79 fbdev: imsttfb: Fix use after free bug in imsttfb_probe
    a7c8d2f3753d video: imsttfb: check for ioremap() failures
    f042d80a631f x86/smp: Use dedicated cache-line for mwait_play_dead()
    23f98fe887ce gfs2: Don't deref jdesc in evict

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index f31b920ca7..3a44375824 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "0057180769503ac049b495a794f864053965c7ea"
-SRCREV_meta ?= "863d597749c6214d272d704c8c04ead3373142f4"
+SRCREV_machine ?= "6a552f5822442183d2487c91903f27085183ca0e"
+SRCREV_meta ?= "25f38de25d47570a132a18a1dc147b10e05b378b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.250"
+LINUX_VERSION ?= "5.4.251"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 6f94fe3bd6..3136b0defc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.250"
+LINUX_VERSION ?= "5.4.251"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "f0ae300728e87e4b1e51305737b9f4dda383e7bf"
-SRCREV_machine ?= "de7c8d928de44e1c130760bf11d741d25e1c0213"
-SRCREV_meta ?= "863d597749c6214d272d704c8c04ead3373142f4"
+SRCREV_machine_qemuarm ?= "29ae0b5c67d29249bf00cb8eaaae5914d928bbd6"
+SRCREV_machine ?= "16db12c2685020aa6347a18df5099f40a9176366"
+SRCREV_meta ?= "25f38de25d47570a132a18a1dc147b10e05b378b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 9589ca280a..848d9a339d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "fb7218e03f4d75e77f3bc50217855e043e32b06a"
-SRCREV_machine_qemuarm64 ?= "9561485ac053a0ea76ee95fa8dead1da30a41a8a"
-SRCREV_machine_qemumips ?= "7bd91d1af3b4a24e1f34e3a9583d02d7f08aaf53"
-SRCREV_machine_qemuppc ?= "f4145ff9d93b0e0b0393d16c1889bcf3c6e13e15"
-SRCREV_machine_qemuriscv64 ?= "c862ec7816d3f8b34c6e2a9ba9d2dae79eda31d1"
-SRCREV_machine_qemux86 ?= "c862ec7816d3f8b34c6e2a9ba9d2dae79eda31d1"
-SRCREV_machine_qemux86-64 ?= "c862ec7816d3f8b34c6e2a9ba9d2dae79eda31d1"
-SRCREV_machine_qemumips64 ?= "72944e165489f0dc5121461bfc74fb2bfaa3d7d7"
-SRCREV_machine ?= "c862ec7816d3f8b34c6e2a9ba9d2dae79eda31d1"
-SRCREV_meta ?= "863d597749c6214d272d704c8c04ead3373142f4"
+SRCREV_machine_qemuarm ?= "9a096c043b453855252aece3716d50fdf4111a77"
+SRCREV_machine_qemuarm64 ?= "25499e5c52ebb2111a3dd7dd863937f56cf2a39d"
+SRCREV_machine_qemumips ?= "12e990899599d1aac8dd8007a8864db68135d6f0"
+SRCREV_machine_qemuppc ?= "19d91ad471bb87a464520283e58d5ff83c7151fa"
+SRCREV_machine_qemuriscv64 ?= "2adacd3242d46ddaff62e5a4695b98edf01cccc5"
+SRCREV_machine_qemux86 ?= "2adacd3242d46ddaff62e5a4695b98edf01cccc5"
+SRCREV_machine_qemux86-64 ?= "2adacd3242d46ddaff62e5a4695b98edf01cccc5"
+SRCREV_machine_qemumips64 ?= "854f6bee15babf95445644cba59691cd45173180"
+SRCREV_machine ?= "2adacd3242d46ddaff62e5a4695b98edf01cccc5"
+SRCREV_meta ?= "25f38de25d47570a132a18a1dc147b10e05b378b"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.250"
+LINUX_VERSION ?= "5.4.251"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


