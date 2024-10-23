Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83413CF5375
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 12:35:01 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.7902.1729686892998872621
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 05:34:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pfqDNFQS;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20caea61132so52758535ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 05:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729686892; x=1730291692; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qTtw+DWMS2O6lSoKe1baAHWgW8mDmKP42IXjCdqdzzo=;
        b=pfqDNFQSk1qc59iXbdcDiRw+lCLd55gesEgGd39uMskBV3WmjDH1+FY4YphzroNq3V
         PMsE72CAZweAQkLpB8DywMCbFtE/bxNxiqk4JydMHvKmi0YP+3QyvA+a/2DQHgCwWr6Y
         GraJQfhYFUJX0qaapYdXnF4w0cCRkqN9aVi1SACC+kuVEV8Uc6fbDqOkkZYyo4JkBUQl
         hJDrzpfCGVxKDd4snPjyh3w0TLvdkRsAMBCJhEGdfLCYmmorBwno/qeesnpDov/17ZEX
         qdQshiOLkmzsGlvYAw54hZ3+1PGYE6PUDr/pO2fvnpep7L2Hgz/9vGx1hDbbsXDNz9fy
         e4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729686892; x=1730291692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTtw+DWMS2O6lSoKe1baAHWgW8mDmKP42IXjCdqdzzo=;
        b=fOgLKXAqTw+rDJtXErZrnpTmBkhwn3SLzHBcf+GZ9XxAIXDL9mg+MPgt508UuFhLVc
         Fnxb/D8Uue5P/7cxTgxdA1zyWCBka6HcDGSTH6iO1s494QJfxaB2WudtiM3MHi0XCuhK
         m4Y7hF0WTFLST/Ogzd3weXBFtYnzNNSlIZGNst7v6Phmm60AK8rclCyeQqDeOMF04aI6
         atl0yKmzbxaWCPCEOtGe9qNZ/lYN/n99oHyqgbG6HhNRp/66JDELEP6Gq6wzkoNOHwqr
         deWYCqg//keNRgN933QISs4hSx+k9KlMH9xgVgfKUgHu4bcTFhy43K0HmieTRpXanL61
         J1xA==
X-Gm-Message-State: AOJu0YzDX/i3NTo3uWdv1C6LsI046Sp+d7cLQn+t49tEkeHVLJcWAuTQ
	EoLi4IlZ6cusokiIQMsMgEN7MJ5pMv7fEDTVFUut3scnecMyu7Jc1ZryvkmTmS+SU2cjivvYq6B
	d
X-Google-Smtp-Source: AGHT+IGFWFPNfLQisIRY4/ozSSejj84fh7qJY0TWnHfSsWnvcYj1nunwHntvLH/APf66+XUBV3znUA==
X-Received: by 2002:a17:902:f54e:b0:20c:7a0b:74a3 with SMTP id d9443c01a7336-20fa9e4adf0mr25732125ad.24.1729686891563;
        Wed, 23 Oct 2024 05:34:51 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a40:d08b:8aa5:305c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0de3dasm57294245ad.226.2024.10.23.05.34.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:34:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 05/27] linux-yocto/6.6: update to v6.6.54
Date: Wed, 23 Oct 2024 05:34:13 -0700
Message-Id: <b9e6a9fe1aa9eab1f45ad1abbc14217feffb01a1.1729686660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729686660.git.steve@sakoman.com>
References: <cover.1729686660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 12:35:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206216

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    63a57420cf79 Linux 6.6.54
    cada2646b748 Revert: "dm-verity: restart or panic on an I/O error"
    646749b423c4 spi: atmel-quadspi: Fix wrong register value written to MR
    4c0c5dcb5471 x86/tdx: Fix "in-kernel MMIO" check
    440fba897c5a thunderbolt: Fix NULL pointer dereference in tb_port_update_credits()
    e2ab9fd64d4f thunderbolt: Fix minimum allocated USB 3.x and PCIe bandwidth
    3dc5525d59da thunderbolt: Send uevent after asymmetric/symmetric switch
    6b5630297e94 wifi: brcmfmac: add linefeed at end of file
    72a3aef9640e iio: magnetometer: ak8975: Fix 'Unexpected device' error
    18b5ee7bf700 perf/arm-cmn: Fail DTC counter allocation correctly
    e43caacf6110 usb: yurex: Fix inconsistent locking bug in yurex_read()
    790c630ab0e7 bpf: Fix use-after-free in bpf_uprobe_multi_link_attach()
    7390c461264c Documentation: KVM: fix warning in "make htmldocs"
    d669e7829007 i2c: isch: Add missed 'else'
    88dfb1dd17d6 i2c: aspeed: Update the stop sw state when the bus recovery occurs
    b35a42bdaf18 mm/damon/vaddr: protect vma traversal in __damon_va_thre_regions() with rcu read lock
    6ec62dba4a19 module: Fix KCOV-ignored file name
    236eb2f95ad0 spi: fspi: add support for imx8ulp
    934760569134 mm: only enforce minimum stack gap size if it's sensible
    e1e734c1a085 lockdep: fix deadlock issue between lockdep and rcu
    bd24f30f5068 dm-verity: restart or panic on an I/O error
    b3c10ac84c5a bpf: lsm: Set bpf_lsm_blob_sizes.lbs_task to 0
    722e9e5acccf mm/filemap: optimize filemap folio adding
    734594d41c8e lib/xarray: introduce a new helper xas_get_order
    ff3c557fa93e mm/filemap: return early if failed to allocate memory for split
    4d0261cea469 thunderbolt: Improve DisplayPort tunnel setup process to be more robust
    aed38a3eaf65 thunderbolt: Configure asymmetric link if needed and bandwidth allows
    9b6933e9bddc thunderbolt: Add support for asymmetric link
    8f053095e13e thunderbolt: Introduce tb_switch_depth()
    e07bc5858e3e thunderbolt: Introduce tb_for_each_upstream_port_on_path()
    18dcdadc9941 thunderbolt: Introduce tb_port_path_direction_downstream()
    5ac89bb0062e thunderbolt: Change bandwidth reservations to comply USB4 v2
    7b85d751081b thunderbolt: Make is_gen4_link() available to the rest of the driver
    22081f720764 thunderbolt: Use weight constants in tb_usb3_consumed_bandwidth()
    c014f37411d5 thunderbolt: Use constants for path weight and priority
    ae2d54f5e5e9 thunderbolt: Create multiple DisplayPort tunnels if there are more DP IN/OUT pairs
    6870e5b499f1 thunderbolt: Expose tb_tunnel_xxx() log macros to the rest of the driver
    95f53ccfe6ed thunderbolt: Use tb_tunnel_dbg() where possible to make logging more consistent
    90135c317d17 thunderbolt: Fix debug log when DisplayPort adapter not available for pairing
    159b1b45300c dt-bindings: spi: nxp-fspi: add imx8ulp support
    eb95bd96465c dt-bindings: spi: nxp-fspi: support i.MX93 and i.MX95
    f56a6d9c267e btrfs: fix race setting file private on concurrent lseek using same fd
    971d03cd457a btrfs: update comment for struct btrfs_inode::lock
    a0cc053ba1e2 btrfs: reorder btrfs_inode to fill gaps
    0131bf19a141 btrfs: subpage: fix the bitmap dump which can cause bitmap corruption
    459b724c3c31 lib/bitmap: add bitmap_{read,write}()
    32e93cae4dc4 x86/entry: Remove unwanted instrumentation in common_interrupt()
    d5c5afdb9e1e x86/idtentry: Incorporate definitions/declarations of the FRED entries
    1d8c1add5e36 serial: don't use uninitialized value in uart_poll_init()
    88e26a196aa4 tty: serial: kgdboc: Fix 8250_* kgdb over serial
    73c1928a0076 pps: add an error check in parport_attach
    8b48ea27185d pps: remove usage of the deprecated ida_simple_xx() API
    aafeabf2765f usb: xhci: fix loss of data on Cadence xHC
    eef5d6219a81 xhci: Add a quirk for writing ERST in high-low order
    225643310df7 USB: misc: yurex: fix race between read and write
    eff6dde4c3a0 usb: yurex: Replace snprintf() with the safer scnprintf() variant
    8526ca3bc8af soc: versatile: realview: fix soc_dev leak during device remove
    c48d5ad1c4b8 soc: versatile: realview: fix memory leak during device remove
    f6bda3f118e3 ARM: dts: imx6ul-geam: fix fsl,pins property in tscgrp pinctrl
    45f690fae473 spi: fspi: involve lut_num for struct nxp_fspi_devtype_data
    1b8cf11b3ca5 padata: use integer wrap around to prevent deadlock on seq_nr overflow
    62004f17039d cpuidle: riscv-sbi: Use scoped device node handling to fix missing of_node_put
    662ec52260cc icmp: change the order of rate limits
    e0be8f2d64d6 EDAC/igen6: Fix conversion of system address to physical memory address
    2a4a997adb36 nfs: fix memory leak in error path of nfs4_do_reclaim
    4d3d0869eccb fs: Fix file_set_fowner LSM hook inconsistencies
    0eed942bc65d vfs: fix race between evice_inodes() and find_inode()&iput()
    ca2a69fdd6af arm64: dts: rockchip: Correct the Pinebook Pro battery design capacity
    eea02200cb8c arm64: dts: qcom: sa8775p: Mark APPS and PCIe SMMUs as DMA coherent
    4fff20cff6e2 arm64: dts: rockchip: Raise Pinebook Pro's panel backlight PWM frequency
    0e6774ec012b arm64: errata: Enable the AC03_CPU_38 workaround for ampere1a
    93e1215f3fe0 arm64: esr: Define ESR_ELx_EC_* constants as UL
    1b4089d56778 hwrng: cctrng - Add missing clk_disable_unprepare in cctrng_resume
    3fd8e444e824 hwrng: bcm2835 - Add missing clk_disable_unprepare in bcm2835_rng_init
    5ad4d0b64820 hwrng: mtk - Use devm_pm_runtime_enable
    7cb51731f24b f2fs: fix to check atomic_file in f2fs ioctl interfaces
    5e0de753bfe8 f2fs: Require FMODE_WRITE for atomic write ioctls
    56d865167992 f2fs: avoid potential int overflow in sanity_check_area_boundary()
    0c598a021718 f2fs: prevent possible int overflow in dir_block_index()
    b18a5c8382c8 f2fs: fix several potential integer overflows in file offsets
    4adf6514949f btrfs: always update fstrim_range on failure in FITRIM ioctl
    6a6a5751c06a btrfs: tree-checker: fix the wrong output of data backref objectid
    534230eebae5 debugobjects: Fix conditions in fill_pool()
    c1ba1f2ca1b8 wifi: mt76: mt7615: check devm_kasprintf() returned value
    eed8db8203a8 wifi: rtw88: 8822c: Fix reported RX band width
    de0cb07dc2c3 wifi: rtw88: 8821cu: Remove VID/PID 0bda:c82c
    8e4b60ae8a04 wifi: mt76: mt7996: fix NULL pointer dereference in mt7996_mcu_sta_bfer_he
    cf23427dd75b wifi: mt76: mt7915: check devm_kasprintf() returned value
    0a74a9b148d3 wifi: mt76: mt7921: Check devm_kasprintf() returned value
    cb0125ec3d99 perf/x86/intel/pt: Fix sampling synchronization
    19fd2f2c5fb3 efistub/tpm: Use ACPI reclaim memory for event log to avoid corruption
    ca659f380469 ACPI: resource: Add another DMI match for the TongFang GMxXGxx
    f0921ecd4ddc ACPI: sysfs: validate return type of _STR method
    df6a82a6b06e drbd: Add NULL check for net_conf to prevent dereference in state validation
    42ac42d79039 drbd: Fix atomicity violation in drbd_uuid_set_bm()
    a3028d70a563 crypto: ccp - Properly unregister /dev/sev on sev PLATFORM_STATUS failure
    633bd1d6be1a serial: qcom-geni: fix fifo polling timeout
    e29a1f8b74a9 xhci: Set quirky xHC PCI hosts to D3 _after_ stopping and freeing them.
    f7ba350f4e7d tty: rp2: Fix reset with non forgiving PCIe host bridges
    7420c1bf7fc7 firmware_loader: Block path traversal
    18ed6a331881 bus: mhi: host: pci_generic: Fix the name for the Telit FE990A
    3ae13d48686b bus: integrator-lm: fix OF node leak in probe()
    4f7908ebafd5 usb: dwc2: drd: fix clock gating on USB role switch
    19fb05d2e5c3 usb: cdnsp: Fix incorrect usb_request status
    a0b4cbeb0936 USB: class: CDC-ACM: fix race between get_serial and set_serial
    7bcd961dcb5a USB: misc: cypress_cy7c63: check for short transfer
    ef08eb1605f5 USB: appledisplay: close race between probe and completion handler
    090386dbedbc arm64: dts: mediatek: mt8195-cherry: Mark USB 3.0 on xhci1 as disabled
    1e44ee6cdd12 usbnet: fix cyclical race on disconnect with work queue
    d71300d07f39 wifi: rtw88: Fix USB/SDIO devices not transmitting beacons
    9ecd9d7ad7f0 can: esd_usb: Remove CAN_CTRLMODE_3_SAMPLES for CAN-USB/3-FD
    ccc87864b097 scsi: mac_scsi: Disallow bus errors during PDMA send
    0120c7762f25 scsi: mac_scsi: Refactor polling loop
    6e8dc2050a4a scsi: mac_scsi: Revise printk(KERN_DEBUG ...) messages
    09b06c2591fa scsi: ufs: qcom: Update MODE_MAX cfg_bw value
    568c7c4c77ee scsi: sd: Fix off-by-one error in sd_read_block_characteristics()
    facf1e49a04a ata: libata-scsi: Fix ata_msense_control() CDL page reporting
    6ab95e27b777 ksmbd: handle caseless file creation
    30fe2a885c28 ksmbd: allow write with FILE_APPEND_DATA
    3c1fd66a1914 ksmbd: make __dir_empty() compatible with POSIX
    ef83620438d7 fs: Create a generic is_dot_dotdot() utility
    ae619de5000b powerpc/atomic: Use YZ constraints for DS-form instructions
    a3765b497a4f KEYS: prevent NULL pointer dereference in find_asymmetric_key()
    c886061bbdd1 drm/amd/display: Validate backlight caps are sane
    9ce1ee22dc68 drm/amd/display: Round calculated vtotal
    55fcbe5f6086 drm/amd/display: Add HDMI DSC native YCbCr422 support
    a53841b074cc drm/amd/display: Skip Recompute DSC Params if no Stream on Link
    4777225ec89f KVM: Use dedicated mutex to protect kvm_usage_count to avoid deadlock
    beef3353c601 KVM: x86: Move x2APIC ICR helper above kvm_apic_write_nodecode()
    7eae461dc357 KVM: x86: Enforce x2APIC's must-be-zero reserved ICR bits
    d5d6489b9211 KVM: arm64: Add memory length checks and remove inline in do_ffa_mem_xfer
    0188ea5facba Input: i8042 - add another board name for TUXEDO Stellaris Gen5 AMD line
    09d94ac8b25f Input: i8042 - add TUXEDO Stellaris 15 Slim Gen6 AMD to i8042 quirk table
    c18dca92da2a Input: i8042 - add TUXEDO Stellaris 16 Gen5 AMD to i8042 quirk table
    2a26c3122d01 Input: adp5588-keys - fix check on return code
    cd6dd564ae7d iommufd: Protect against overflow of ALIGN() during iova allocation
    e48edd476291 Revert "media: tuners: fix error return code of hybrid_tuner_request_state()"
    a4c2fbed2037 soc: versatile: integrator: fix OF node leak in probe() error path
    c3533bf2ed1d soc: fsl: cpm1: tsa: Fix tsa_write8()
    543a3c7dbd5b ASoC: rt5682: Return devm_of_clk_add_hw_provider to transfer the error
    513d60f41945 Revert "soc: qcom: smd-rpm: Match rpmsg channel instead of compatible"
    02a370c4fc0f PCI: xilinx-nwl: Fix off-by-one in INTx IRQ handler
    3d8573abdc65 PCI: Use an error code with PCIe failed link retraining
    a200897dc704 PCI: Correct error reporting with PCIe failed link retraining
    f23785c6e7d3 PCI: imx6: Fix missing call to phy_power_off() in error handling
    b91d041e0756 PCI: dra7xx: Fix threaded IRQ request for "dra7xx-pcie-main" IRQ
    894f21117f63 PCI: Clear the LBMS bit after a link retrain
    fb1769573574 PCI: Revert to the original speed after PCIe failed link retraining
    38dee6edb700 Remove *.orig pattern from .gitignore
    01ad0576f092 io_uring/sqpoll: do not put cpumask on stack
    859f62a2f904 io_uring/sqpoll: retain test for whether the CPU is valid
    adbb44539b56 xen: allow mapping ACPI data using a different physical address
    161fd69123b0 xen: move checks for e820 conflicts further up
    79fec62d0f9b Revert "net: libwx: fix alloc msix vectors failed"
    0851b1ec650a drm/vmwgfx: Prevent unmapping active read buffers
    b5d38f1d4acb drm/amd/display: Fix Synaptics Cascaded Panamera DSC Determination
    49d3a4ad57c5 mm: call the security_mmap_file() LSM hook in remap_file_pages()
    4bdf75c2ef33 io_uring: check for presence of task_work rather than TIF_NOTIFY_SIGNAL
    358124ba2cea io_uring/sqpoll: do not allow pinning outside of cpuset
    da2bb8e177a4 netfilter: nf_tables: use rcu chain hook list iterator from netlink dump path
    b3f7607f2003 netfilter: ctnetlink: compile ctnetlink_label_size with CONFIG_NF_CONNTRACK_EVENTS
    668f4df6d6df netfilter: nf_tables: Keep deleted flowtable hooks until after RCU
    3e8ac2743d48 net: stmmac: set PP_FLAG_DMA_SYNC_DEV only if XDP is enabled
    e9e3424d6d4b virtio_net: Fix mismatched buf address when unmapping for small packets
    ccd3e6ff05e5 bonding: Fix unnecessary warnings and logs from bond_xdp_get_xmit_slave()
    00a0c2d49bb5 net: qrtr: Update packets cloning when broadcasting
    570f7d8c9bf1 tcp: check skb is non-NULL in tcp_rto_delta_us()
    88297d3c1a71 net: ipv6: select DST_CACHE from IPV6_RPL_LWTUNNEL
    d2abc3790718 net: seeq: Fix use after free vulnerability in ether3 Driver Due to Race Condition
    af4b8a704f26 netfilter: nf_reject_ipv6: fix nf_reject_ip6_tcphdr_put()
    89bab8310a0a net: xilinx: axienet: Fix packet counting
    bcce13930b2e net: xilinx: axienet: Schedule NAPI in two steps
    9360d077d319 Revert "dm: requeue IO if mapping table not yet available"
    66e78ade976d ep93xx: clock: Fix off by one in ep93xx_div_recalc_rate()
    ca64edd7ae93 vhost_vdpa: assign irq bypass producer token correctly
    70a180b8d84b cxl/pci: Fix to record only non-zero ranges
    c16fa6d5018b interconnect: icc-clk: Add missed num_nodes initialization
    257c7a39092e coresight: tmc: sg: Do not leak sg_table
    5060a1be9399 serial: 8250: omap: Cleanup on error in request_irq
    b8e45b910525 driver core: Fix a potential null-ptr-deref in module_add_driver()
    fdc637d4f5fb dt-bindings: iio: asahi-kasei,ak8975: drop incorrect AK09116 compatible
    7387270b6837 iio: magnetometer: ak8975: drop incorrect AK09116 compatible
    c5a4a27666e0 iio: magnetometer: ak8975: Convert enum->pointer for data in the match tables
    2bc96d4ea9e1 iio: chemical: bme680: Fix read/write ops to device by adding mutexes
    5d86a29db8a3 ABI: testing: fix admv8818 attr description
    dd69fb026c97 driver core: Fix error handling in driver API device_rename()
    0f115888eaa9 iio: adc: ad7606: fix standby gpio state to match the documentation
    48617707401e iio: adc: ad7606: fix oversampling gpio array
    30b9bf4b4107 nvme-multipath: system fails to create generic nvme device
    ecb8a79d21fb spi: atmel-quadspi: Avoid overwriting delay register settings
    54fd87259c85 lib/sbitmap: define swap_lock as raw_spinlock_t
    93773e446197 spi: spi-fsl-lpspi: Undo runtime PM changes at driver exit time
    2016d58567b6 spi: atmel-quadspi: Undo runtime PM changes at driver exit time
    649ec8b30df1 f2fs: fix to don't set SB_RDONLY in f2fs_handle_critical_error()
    f9ce2f550d53 f2fs: get rid of online repaire on corrupted directory
    66b1b8254d20 f2fs: clean up w/ dotdot_name
    364afd8aa824 f2fs: prevent atomic file from being dirtied before commit
    b6f186bd6aee f2fs: compress: don't redirty sparse cluster during {,de}compress
    4263b3ef81e4 f2fs: compress: do sanity check on cluster when CONFIG_F2FS_CHECK_FS is on
    fc18e655b62a f2fs: fix to avoid use-after-free in f2fs_stop_gc_thread()
    f2971778b2cb f2fs: support .shutdown in f2fs_sops
    783b6ca3428f f2fs: atomic: fix to truncate pagecache before on-disk metadata truncation
    1bb0686a2e8a f2fs: fix to wait page writeback before setting gcing flag
    87f9d26fcc50 f2fs: Create COW inode from parent dentry for atomic write
    67c3c4638f22 f2fs: fix to avoid racing in between read and OPU dio write
    6c59f87e1eea f2fs: reduce expensive checkpoint trigger frequency
    d889928bbc69 f2fs: atomic: fix to avoid racing w/ GC
    8edf3a4038f4 crypto: powerpc/p10-aes-gcm - Disable CRYPTO_AES_GCM_P10
    21b4fa3bffc0 crypto: caam - Pad SG length when allocating hash edesc
    318f70857caa nfsd: return -EINVAL when namelen is 0
    a1afbbb5276f nfsd: call cache_put if xdr_reserve_space returns NULL
    b743922b5aad ntb: Force physically contiguous allocation of rx ring buffers
    fd8932cf6b76 ntb_perf: Fix printk format
    16e5bed6c188 ntb: intel: Fix the NULL vs IS_ERR() bug for debugfs_create_dir()
    b15dd2aa7987 RDMA/irdma: fix error message in irdma_modify_qp_roce()
    0d50ae281a17 RDMA/cxgb4: Added NULL check for lookup_atid
    21ada6915c45 riscv: Fix fp alignment bug in perf_callchain_user()
    6eff336b103f RDMA/mlx5: Obtain upper net device only when needed
    e8721e9ba113 RDMA/hns: Fix restricted __le16 degrades to integer issue
    b3b7ff07675c RDMA/hns: Optimize hem allocation performance
    288ecfd3e8aa RDMA/hns: Fix 1bit-ECC recovery address in non-4K OS
    3ab289914eab RDMA/hns: Fix VF triggering PF reset in abnormal interrupt handler
    094a1821903f RDMA/hns: Fix spin_unlock_irqrestore() called with IRQs enabled
    69d9566822af RDMA/hns: Fix the overflow risk of hem_list_calc_ba_range()
    d2d9c5127122 RDMA/hns: Fix Use-After-Free of rsv_qp on HIP08
    85e37ac13906 RDMA/hns: Don't modify rq next block addr in HIP09 QPC
    b972bade1578 watchdog: imx_sc_wdt: Don't disable WDT in suspend
    613a8d27d1e1 RDMA/mlx5: Limit usage of over-sized mkeys from the MR cache
    7838f6c8a64b RDMA/erdma: Return QP state in erdma_query_qp
    95248d7497bc PCI: kirin: Fix buffer overflow in kirin_pcie_parse_port()
    d08754be993f IB/core: Fix ib_cache_setup_one error flow cleanup
    4c49d34f87a2 pinctrl: mvebu: Fix devinit_dove_pinctrl_probe function
    a685bc3524f3 nfsd: fix refcount leak when file is unhashed after being found
    982dfdfd59b1 nfsd: remove unneeded EEXIST error check in nfsd_do_file_acquire
    6ba262477994 clk: rockchip: rk3588: Fix 32k clock name for pmu_24m_32k_100m_src_p
    521d101e9e8f clk: starfive: Use pm_runtime_resume_and_get to fix pm_runtime_get_sync() usage
    8758691ea89a clk: ti: dra7-atl: Fix leak of of_nodes
    01b9be936ee8 RDMA/rtrs-clt: Reset cid to con_num - 1 to stay in bounds
    effc10f00cf8 RDMA/rtrs: Reset hb_missed_cnt after receiving other traffic from peer
    c6b9f971b439 media: mediatek: vcodec: Fix H264 stateless decoder smatch warning
    dbe5b7373801 media: mediatek: vcodec: Fix VP8 stateless decoder smatch warning
    588bcce9e64c media: mediatek: vcodec: Fix H264 multi stateless decoder smatch warning
    08d13bcb9cea clk: at91: sama7g5: Allocate only the needed amount of memory for PLLs
    b6edb3fd96bf pinctrl: single: fix missing error code in pcs_probe()
    8b7df76356d0 RDMA/iwcm: Fix WARNING:at_kernel/workqueue.c:#check_flush_dependency
    451249bb8d44 media: platform: rzg2l-cru: rzg2l-csi2: Add missing MODULE_DEVICE_TABLE
    4f201a94ac52 PCI: xilinx-nwl: Clean up clock on probe failure/removal
    f1058b0780b4 PCI: xilinx-nwl: Fix register misspelling
    18a672c62d73 nvdimm: Fix devs leaks in scan_labels()
    e39cc0c37d7c x86/PCI: Check pcie_find_root_port() return for NULL
    597c72f4d162 leds: pca995x: Fix device child node usage in pca995x_probe()
    d14451d91a11 leds: pca995x: Use device_for_each_child_node() to access device child nodes
    dbba3fce3e2f leds: leds-pca995x: Add support for NXP PCA9956B
    583314ebaae7 clk: qcom: dispcc-sm8250: use special function for Lucid 5LPE PLL
    4ddb580089e3 clk: qcom: ipq5332: Register gcc_qdss_tsctr_clk_src
    e85ab507882d PCI: keystone: Fix if-statement expression in ks_pcie_quirk()
    8e152448d0a0 firewire: core: correct range of block for case of switch statement
    390de4d01bc1 PCI: Wait for Link before restoring Downstream Buses
    58f31be7dfbc drivers: media: dvb-frontends/rtl2830: fix an out-of-bounds write error
    527ab3eb3b0b drivers: media: dvb-frontends/rtl2832: fix an out-of-bounds write error
    075a0ce1fa28 Input: ilitek_ts_i2c - add report id message validation
    831886bf1a5a Input: ilitek_ts_i2c - avoid wrong input subsystem sync
    a3552e2f7d30 pinctrl: ti: ti-iodelay: Fix some error handling paths
    85427d5109c2 pinctrl: ti: iodelay: Use scope based of_node_put() cleanups
    ccc7cdf49634 pinctrl: Use device_get_match_data()
    a12e8a92909e pinctrl: ti: ti-iodelay: Convert to platform remove callback returning void
    bbf297b4cdc1 leds: bd2606mvv: Fix device child node usage in bd2606mvv_probe()
    676bf8fcf387 clk: qcom: dispcc-sm8550: use rcg2_shared_ops for ESC RCGs
    ffb0ae195b28 clk: qcom: dispcc-sm8650: Update the GDSC flags
    65a25e42a491 clk: qcom: dispcc-sm8550: use rcg2_ops for mdss_dptx1_aux_clk_src
    59938d4f05f4 clk: qcom: dispcc-sm8550: fix several supposed typos
    77c859e8b8a9 clk: rockchip: Set parent rate for DCLK_VOP clock on RK3228
    d271e66f74b5 remoteproc: imx_rproc: Initialize workqueue earlier
    2941577c764b remoteproc: imx_rproc: Correct ddr alias for i.MX8M
    af70d9395d7c clk: imx: imx8qxp: Parent should be initialized earlier than the clock
    d64513b2dab1 clk: imx: imx8qxp: Register dc0_bypass0_clk before disp clk
    5b44298953f3 clk: imx: imx8mp: fix clock tree update of TF-A managed clocks
    908165b5d369 clk: imx: fracn-gppll: fix fractional part of PLL getting lost
    ed323659a011 clk: imx: composite-7ulp: Check the PCC present bit
    c1eb71fd985d clk: imx: composite-93: keep root clock on when mcore enabled
    73034d130b0a clk: imx: composite-8m: Enable gate clk with mcore_booted
    554c590d229d clk: imx: composite-8m: Less function calls in __imx8m_clk_hw_composite() after error detection
    c2ee6de22dac clk: imx: imx6ul: fix default parent for enet*_ref_sel
    bd553be1cfb2 clk: imx: clk-audiomix: Correct parent clock for earc_phy and audpll
    3ba5a2e91c70 perf time-utils: Fix 32-bit nsec parsing
    022f9328ef17 perf sched timehist: Fixed timestamp error when unable to confirm event sched_in time
    fa0720b32afa perf stat: Display iostat headers correctly
    505ec05002c7 perf sched timehist: Fix missing free of session in perf_sched__timehist()
    88c4b5dd2107 perf report: Fix --total-cycles --stdio output error
    297871cb5115 perf ui/browser/annotate: Use global annotation_options
    4c857dcf34a5 perf annotate: Move some source code related fields from 'struct annotation' to 'struct annotated_source'
    4ef032d89995 perf annotate: Split branch stack cycles info from 'struct annotation'
    ba18185bea37 perf inject: Fix leader sampling inserting additional samples
    1490a5dbd55f perf mem: Free the allocated sort string, fixing a leak
    a634fa8e480a bpf: Zero former ARG_PTR_TO_{LONG,INT} args in case of error
    abf7559b4ff6 bpf: Improve check_raw_mode_ok test for MEM_UNINIT-tagged types
    a2c8dc7e2180 bpf: Fix helper writes to read-only maps
    81197a9b4510 bpf: Fix bpf_strtol and bpf_strtoul helpers for 32bit
    257f9e5185eb nilfs2: fix potential oob read in nilfs_btree_check_delete()
    0f28b3b51fc1 nilfs2: determine empty node blocks as corrupted
    21839b6fbc3c nilfs2: fix potential null-ptr-deref in nilfs_btree_insert()
    66f3fc741177 sched/numa: Fix the vma scan starving issue
    e3a2d3f6c40e sched/numa: Complete scanning of inactive VMAs when there is no alternative
    cb7846df6b4f sched/numa: Complete scanning of partial VMAs regardless of PID activity
    7f01977665d7 sched/numa: Move up the access pid reset logic
    6654e54ae7e7 sched/numa: Trace decisions related to skipping VMAs
    707e9a6c880f sched/numa: Rename vma_numab_state::access_pids[] => ::pids_active[], ::next_pid_reset => ::pids_active_reset
    ba4eb7f25886 sched/numa: Document vma_numab_state fields
    faeff8b1ee2e ext4: check stripe size compatibility on remount as well
    2a6579ef5f25 ext4: avoid OOB when system.data xattr changes underneath the filesystem
    dd3f90e8c470 ext4: return error on ext4_find_inline_entry
    9f70768554ac ext4: avoid negative min_clusters in find_group_orlov()
    fae0793abdab ext4: avoid potential buffer_head leak in __ext4_new_inode()
    7a349feead81 ext4: avoid buffer_head leak in ext4_mark_inode_used()
    72eef5226fbe smackfs: Use rcu_assign_pointer() to ensure safe assignment in smk_set_cipso
    e4006410b0f5 ext4: clear EXT4_GROUP_INFO_WAS_TRIMMED_BIT even mount with discard
    cfd257f5e85b kthread: fix task state in kthread worker if being frozen
    b7d6e724e42a xz: cleanup CRC32 edits from 2018
    2288b54b96dc bpf: correctly handle malformed BPF_CORE_TYPE_ID_LOCAL relos
    fc2b89707e47 samples/bpf: Fix compilation errors with cf-protection option
    33ef0b25b022 selftests/bpf: Fix error compiling tc_redirect.c with musl libc
    8553067f1cae selftests/bpf: Fix compile if backtrace support missing in libc
    7824530b80ba selftests/bpf: Fix redefinition errors compiling lwt_reroute.c
    a7d322fd3be8 selftests/bpf: Fix flaky selftest lwt_redirect/lwt_reroute
    fb99b106ad38 selftests/bpf: Fix C++ compile error from missing _Bool type
    99c03869599c selftests/bpf: Fix error compiling test_lru_map.c
    564d1abf506b selftests/bpf: Fix arg parsing in veristat, test_progs
    d57f8de839e4 selftests/bpf: Fix errors compiling cg_storage_multi.h with musl libc
    96416a7e4884 selftests/bpf: Fix errors compiling decap_sanity.c with musl libc
    0bc023e2f600 selftests/bpf: Fix errors compiling lwt_redirect.c with musl libc
    397192f81476 selftests/bpf: Fix compiling core_reloc.c with musl-libc
    227b50fe66eb selftests/bpf: Fix compiling tcp_rtt.c with musl-libc
    fe81b3df3cf9 selftests/bpf: Fix compiling flow_dissector.c with musl-libc
    7d8d5840453a selftests/bpf: Fix compiling kfree_skb.c with musl-libc
    425d4934e4f8 selftests/bpf: Fix compiling parse_tcp_hdr_opt.c with musl-libc
    52f5ed9461f4 selftests/bpf: Fix include of <sys/fcntl.h>
    4730b07ef774 selftests/bpf: Add a cgroup prog bpf_get_ns_current_pid_tgid() test
    17536f3b7262 selftests/bpf: Refactor out some functions in ns_current_pid_tgid test
    d6e16c33e093 selftests/bpf: Replace CHECK with ASSERT_* in ns_current_pid_tgid test
    bedda119babc selftests/bpf: Fix missing BUILD_BUG_ON() declaration
    4bff8cc537ce selftests/bpf: Fix missing UINT_MAX definitions in benchmarks
    2388d181667a selftests/bpf: Fix missing ARRAY_SIZE() definition in bench.c
    103c0431c7fb selftests/bpf: Drop unneeded error.h includes
    c8c590f07ad7 selftests/bpf: Implement get_hw_ring_size function to retrieve current and max interface size
    7c877bad03fb selftests/bpf: Fix error compiling bpf_iter_setsockopt.c with musl libc
    db5cde7b4386 selftests/bpf: Fix compile error from rlim_t in sk_storage_map.c
    7572c32f8ef2 selftests/bpf: Use pid_t consistently in test_progs.c
    b0b99c1226ea tools/runqslower: Fix LDFLAGS and add LDLIBS support
    cd1b7f772f56 selftests/bpf: Fix wrong binary in Makefile log output
    97e4a3ba9de7 selftests/bpf: Add CFLAGS per source file and runner
    5d99839bfe1c bpf: Temporarily define BPF_NO_PRESEVE_ACCESS_INDEX for GCC
    01aa0d2861be bpf: Disable some `attribute ignored' warnings in GCC
    5de3bd34dd5b bpf: Use -Wno-error in certain tests when building with GCC
    b6529a310dfa selftests/bpf: Fix error linking uprobe_multi on mips
    e7d263b2947c selftests/bpf: Workaround strict bpf_lsm return value check.
    5a4f8de92dd7 sched/fair: Make SCHED_IDLE entity be preempted in strict hierarchy
    82478cb8a23b tpm: Clean up TPM space after command failure
    9c21cdae4b93 xen/swiotlb: fix allocated size
    d1691e977860 xen/swiotlb: add alignment check for dma buffers
    ac8ec1268e7a xen: tolerate ACPI NVS memory overlapping with Xen allocated memory
    149fbd6aecdb xen: add capability to remap non-RAM pages to different PFNs
    f12153eece97 xen: move max_pfn in xen_memory_setup() out of function scope
    242d0c3c40cc xen: introduce generic helper checking for memory map conflicts
    35a10211dec2 minmax: avoid overly complex min()/max() macro arguments in xen
    27f113dc120c ata: libata: Clear DID_TIME_OUT for ATA PT commands with sense data
    f7b4ba5f78f2 HID: wacom: Do not warn about dropped packets for first packet
    85572bf646e4 HID: wacom: Support sequence numbers smaller than 16-bit
    cafeba3c2a1f xen: use correct end address of kernel for conflict checking
    37c40c01cf1a drivers:drm:exynos_drm_gsc:Fix wrong assignment in gsc_bind()
    614773a4e536 drm/msm: fix %s null argument error
    476945372b1f drm/msm/dsi: correct programming sequence for SM8350 / SM8450
    52d571a21349 ipmi: docs: don't advertise deprecated sysfs entries
    cbd26fc9ec4c drm/msm/a5xx: workaround early ring-buffer emptiness check
    d9bef5ba5638 drm/msm/a5xx: fix races in preemption evaluation stage
    dfd012052bfb drm/msm/a5xx: properly clear preemption records on resume
    b9415145327c drm/msm/a5xx: disable preemption in submits by default
    7e34440a3d06 drm/msm: Fix incorrect file name output in adreno_request_fw()
    a02d92e8eb55 powerpc/vdso: Inconditionally use CFUNC macro
    efdf2af50b31 powerpc/8xx: Fix kernel vs user address comparison
    6b7a006ab003 powerpc/8xx: Fix initial memory mapping
    415a2c218370 drm/mediatek: Use spin_lock_irqsave() for CRTC event lock
    5b9b8cd28950 drm/mediatek: Fix missing configuration flags in mtk_crtc_ddp_config()
    c1ba4b8ca799 jfs: fix out-of-bounds in dbNextAG() and diAlloc()
    baeb8628ab7f scsi: elx: libefc: Fix potential use after free in efc_nport_vport_del()
    9263023a0b04 drm/vc4: hdmi: Handle error case of pm_runtime_resume_and_get
    087b88088015 drm/bridge: lontium-lt8912b: Validate mode in drm_bridge_funcs::mode_valid()
    fa94d60546d2 drm/radeon/evergreen_cs: fix int overflow errors in cs track offsets
    656803ab1ad2 drm/rockchip: dw_hdmi: Fix reading EDID when using a forced mode
    9ec05e0b4ac4 drm/rockchip: vop: Allow 4096px width scaling
    8e7760ed234f drm/amd/amdgpu: Properly tune the size of struct
    53c18f7baf0c scsi: NCR5380: Check for phase match during PDMA fixup
    464fd60a16d2 scsi: smartpqi: revert propagate-the-multipath-failure-to-SML-quickly
    de67850b4019 drm/radeon: properly handle vbios fake edid sizing
    78b9e10b3bd1 drm/amdgpu: properly handle vbios fake edid sizing
    ddf9ff244d70 drm/amd/display: Add null check for set_output_gamma in dcn30_set_output_transfer_func
    fc8b0b8dbdba drm/stm: ltdc: check memory returned by devm_kzalloc()
    6e513c2e9460 drm/stm: Fix an error handling path in stm_drm_platform_probe()
    8e6f4aa43b79 pmdomain: core: Harden inter-column space in debug summary
    c390a26db31a iommu/arm-smmu-qcom: apply num_context_bank fixes for SDM630 / SDM660
    7acaef4f28b6 iommu/arm-smmu-qcom: Work around SDM845 Adreno SMMU w/ 16K pages
    324e1ec46356 iommu/arm-smmu-qcom: hide last LPASS SMMU context bank from linux
    0f0222d5abe9 mtd: rawnand: mtk: Fix init error path
    e502a0db3422 mtd: rawnand: mtk: Factorize out the logic cleaning mtk chips
    ca63b1cbcd99 mtd: rawnand: mtk: Use for_each_child_of_node_scoped()
    9b52ee18f6d2 rcu/nocb: Fix RT throttling hrtimer armed from offline CPU
    4e31e504201f mtd: powernv: Add check devm_kasprintf() returned value
    e109a01f3d56 iommu/amd: Do not set the D bit on AMD v2 table entries
    9b97d6b08b7f fbdev: hpfb: Fix an error handling path in hpfb_dio_probe()
    508a550eec10 power: supply: max17042_battery: Fix SOC threshold calc w/ no current sense
    05dba1274e7d power: supply: axp20x_battery: Remove design from min and max voltage
    cbb2313e76d3 hwmon: (ntc_thermistor) fix module autoloading
    590960a5b3b3 mtd: slram: insert break after errors in parsing the map
    0a27e17475d4 hwmon: (max16065) Fix alarm attributes
    fc702f5c3d24 hwmon: (max16065) Remove use of i2c_match_id()
    0c7af15f64b6 hwmon: (max16065) Fix overflows seen when writing limits
    f606b9ac4abb ASoC: loongson: fix error release
    886ea81de41f m68k: Fix kernel_clone_args.flags in m68k_clone()
    cc08ac5f42c3 ALSA: hda: cs35l41: fix module autoloading
    c239cfa322ee selftests/ftrace: Add required dependency for kprobe tests
    7000e5f31ccf ASoC: tas2781-i2c: Get the right GPIO line
    92b53ece5d37 ASoC: tas2781-i2c: Drop weird GPIO code
    ac7976b67277 ASoC: tas2781: Use of_property_read_reg()
    c0f652180696 ASoC: tas2781: remove unused acpi_subysystem_id
    06a95f7184ab ASoC: rt5682s: Return devm_of_clk_add_hw_provider to transfer the error
    17c72808dbbd x86/mm: Use IPIs to synchronize LAM enablement
    ecd4adebb852 arm64: dts: mediatek: mt8195: Correct clock order for dp_intf*
    27106b0a292e clocksource/drivers/qcom: Add missing iounmap() on errors in msm_dt_timer_init()
    ee7e02e780f1 reset: k210: fix OF node leak in probe() error path
    cfbf049d1605 reset: berlin: fix OF node leak in probe() error path
    b2cce50abd4e ARM: versatile: fix OF node leak in CPUs prepare
    01f986dc6411 ARM: dts: imx7d-zii-rmu2: fix Ethernet PHY pinctrl property
    58bd96e5ec45 ARM: dts: microchip: sama7g5: Fix RTT clock
    e91e803da1e5 spi: bcmbca-hsspi: Fix missing pm_runtime_disable()
    7c84cb5a3990 arm64: dts: ti: k3-j721e-beagleboneai64: Fix reversed C6x carveout locations
    ff8444011fe5 arm64: dts: ti: k3-j721e-sk: Fix reversed C6x carveout locations
    6d91b3f570ab arm64: dts: rockchip: Correct vendor prefix for Hardkernel ODROID-M1
    c742692fad4a ARM: dts: microchip: sam9x60: Fix rtc/rtt clocks
    514265b1f154 arm64: dts: renesas: r9a07g044: Correct GICD and GICR sizes
    c2bae2675ca6 arm64: dts: renesas: r9a07g054: Correct GICD and GICR sizes
    7d0be3622399 arm64: dts: renesas: r9a07g043u: Correct GICD and GICR sizes
    1ccd886abf45 regulator: Return actual error in of_regulator_bulk_get_all()
    3bf127bc2695 spi: ppc4xx: Avoid returning 0 when failed to parse and map IRQ
    6699567b0bbb firmware: arm_scmi: Fix double free in OPTEE transport
    bd7fa63736c7 arm64: dts: mediatek: mt8186: Fix supported-hw mask for GPU OPPs
    8d81cd1a048a arm64: dts: exynos: exynos7885-jackpotlte: Correct RAM amount to 4GB
    1b08f7b5f56d spi: ppc4xx: handle irq_of_parse_and_map() errors
    80f5bfbb80ea block: fix potential invalid pointer dereference in blk_add_partition
    0d7ddfc89284 block: print symbolic error name instead of error code
    5740c0fa9367 io_uring/io-wq: inherit cpuset of cgroup in io worker
    7b3a35584db4 io_uring/io-wq: do not allow pinning outside of cpuset
    c3eba0a4e940 block, bfq: fix procress reference leakage for bfqq in merge chain
    0780451f03bf block, bfq: fix uaf for accessing waker_bfqq after splitting
    0c9b52bfee0e erofs: fix incorrect symlink detection in fast symlink
    81b048b9484b cachefiles: Fix non-taking of sb_writers around set/removexattr
    19f3bec2ac4b block, bfq: don't break merge chain in bfq_split_bfqq()
    e50c9a352676 block, bfq: choose the last bfqq from merge chain in bfq_setup_cooperator()
    7faed2896d78 block, bfq: fix possible UAF for bfqq->bic with merge chain
    6e73b946a379 nbd: fix race between timeout and normal completion
    75a5e5909b1f ublk: move zone report data out of request pdu
    0ceb2f2b5c81 ipv6: avoid possible NULL deref in rt6_uncached_list_flush_dev()
    2b5e904deabb net: tipc: avoid possible garbage value
    a46add42bd06 net: ipv6: rpl_iptunnel: Fix memory leak in rpl_input
    50d062b6cc90 r8169: disable ALDPS per default for RTL8125
    1e8fc4ffa955 net: enetc: Use IRQF_NO_AUTOEN flag in request_irq()
    905e83c61bdc bareudp: Pull inner IP header on xmit.
    61761f08e361 bareudp: Pull inner IP header in bareudp_udp_encap_recv().
    a4a70cba57aa Bluetooth: btusb: Fix not handling ZPL/short-transfer
    d7572187bce6 can: m_can: m_can_close(): stop clocks after device has been shut down
    7fb4f5605c3e can: m_can: enable NAPI before enabling interrupts
    c3d941cc734e can: bcm: Clear bo->bcm_proc_read after remove_proc_entry().
    80bd490ac0a3 sock_map: Add a cond_resched() in sock_hash_free()
    7eebbdde4b94 Bluetooth: hci_sync: Ignore errors from HCI_OP_REMOTE_NAME_REQ_CANCEL
    ea8d90a5b04a Bluetooth: hci_core: Fix sending MGMT_EV_CONNECT_FAILED
    84398204c5df wifi: wilc1000: fix potential RCU dereference issue in wilc_parse_join_bss_param
    058c9026ad79 wifi: mac80211: use two-phase skb reclamation in ieee80211_do_stop()
    cacdc1189841 wifi: cfg80211: fix two more possible UBSAN-detected off-by-one errors
    2780657f7f53 wifi: mt76: mt7996: fix uninitialized TLV data
    2d9f3e56b9d5 wifi: mt76: mt7996: ensure 4-byte alignment for beacon commands
    15c1d606fa75 wifi: mt76: mt7915: fix rx filter setting for bfee functionality
    9f05824b35a4 wifi: cfg80211: fix UBSAN noise in cfg80211_wext_siwscan()
    0940196c3d62 wifi: mt76: mt7603: fix mixed declarations and code
    aa3e0db35a60 crypto: hisilicon/qm - inject error before stopping queue
    8b21a9b1d8f0 crypto: hisilicon/qm - reset device before enabling it
    7803e8cdaa84 crypto: hisilicon/hpre - mask cluster timeout error
    4589bb97e42f pm:cpupower: Add missing powercap_set_enabled() stub function
    fb2d057539ed x86/sgx: Fix deadlock in SGX NUMA node search
    6f68e1e9ade6 wifi: mt76: mt7996: fix EHT beamforming capability check
    c07082fa2421 wifi: mt76: mt7996: fix HE and EHT beamforming capabilities
    29516e5db9c6 wifi: mt76: mt7996: fix wmm set of station interface to 3
    7146e5aeff6d wifi: mt76: mt7996: fix traffic delay when switching back to working channel
    50d87e3b7098 wifi: mt76: mt7996: use hweight16 to get correct tx antenna
    818dd118f4a9 wifi: mt76: mt7915: fix oops on non-dbdc mt7986
    4d3608ae154b cpufreq: ti-cpufreq: Introduce quirks to handle syscon fails appropriately
    c902e515b6b4 perf/arm-cmn: Ensure dtm_idx is big enough
    5418a61e3207 perf/arm-cmn: Fix CCLA register offset
    a687d9d1fedd perf/arm-cmn: Refactor node ID handling. Again.
    a1b25661a04a perf/arm-cmn: Improve debugfs pretty-printing for large configs
    f5c4ec8d0e2f perf/arm-cmn: Rework DTC counters (again)
    814b8bc5cc0a netfilter: nf_tables: remove annotation to access set timeout while holding lock
    9431e5eddcc1 netfilter: nf_tables: reject expiration higher than timeout
    2a5e648a0cb6 netfilter: nf_tables: reject element expiration with no timeout
    08b25d59ffb0 netfilter: nf_tables: elements with timeout below CONFIG_HZ never expire
    8ad28208be7b ACPI: CPPC: Fix MASK_VAL() usage
    fa3ef5ea3ff4 can: j1939: use correct function name in comment
    37c5024e464c kselftest/arm64: Actually test SME vector length changes via sigreturn
    666a46a90f18 drivers/perf: hisi_pcie: Fix TLP headers bandwidth counting
    6206a0edb29b drivers/perf: hisi_pcie: Record hardware counts correctly
    39dd1f1f48d3 padata: Honor the caller's alignment in case of chunk_size 0
    1661f1352b55 wifi: iwlwifi: mvm: increase the time between ranging measurements
    2c4a7b501422 wifi: iwlwifi: config: label 'gl' devices as discrete
    305b7827cf5d wifi: iwlwifi: remove AX101, AX201 and AX203 support from LNL
    d54455a3a965 wifi: mac80211: don't use rate mask for offchannel TX either
    3b839d461904 drivers/perf: Fix ali_drw_pmu driver interrupt status clearing
    be158b7e6a46 kselftest/arm64: signal: fix/refactor SVE vector length enumeration
    288cbc505e20 powercap: intel_rapl: Fix off by one in get_rpi()
    9fc60f2bdd43 ARM: 9410/1: vfp: Use asm volatile in fmrx/fmxr macros
    c82ea72d96dd mount: handle OOM on mnt_warn_timestamp_expiry
    032ca566f589 RISC-V: KVM: Fix to allow hpmcounter31 from the guest
    3c39f253e2c9 RISC-V: KVM: Allow legacy PMU access from guest
    a72a99da7a8f RISC-V: KVM: Fix sbiret init before forwarding to userspace
    07b90bbfe9c9 wifi: rtw88: remove CPT execution branch never used
    32ba3160889e arm64: signal: Fix some under-bracketed UAPI macros
    f0525a641a4a net: stmmac: dwmac-loongson: Init ref and PTP clocks rate
    0a9445aa8e8f wifi: ath12k: fix invalid AMPDU factor calculation in ath12k_peer_assoc_h_he()
    aafd6ad1d9d6 wifi: ath12k: match WMI BSS chan info structure with firmware definition
    d45fe0115edf wifi: ath12k: fix BSS chan info request WMI command
    dda028a8aa3c wifi: ath9k: Remove error checks when creating debugfs entries
    fb1862ce2664 wifi: brcmfmac: introducing fwil query functions
    c3cfcf51b4e0 wifi: brcmfmac: export firmware interface functions
    9349283fc6b8 ACPI: PMIC: Remove unneeded check in tps68470_pmic_opregion_probe()
    e55fcc821db0 crypto: xor - fix template benchmarking
    1b8178a2ae27 wifi: rtw88: always wait for both firmware loading attempts
    b3e360e00d21 EDAC/synopsys: Fix error injection on Zynq UltraScale+
    23752ababd72 EDAC/synopsys: Fix ECC status and IRQ control race condition
    4ad9fa5c30ed Linux 6.6.53
    51297ef7ad78 USB: usbtmc: prevent kernel-usb-infoleak
    39d69238899a USB: serial: pl2303: add device id for Macrosilicon MS3020
    3a2532d88251 can: mcp251xfd: move mcp251xfd_timestamp_start()/stop() into mcp251xfd_chip_start/stop()
    fa45741f1e90 can: mcp251xfd: properly indent labels
    26b0a1cd9f22 x86/mm: Switch to new Intel CPU model defines
    ab51a98de8d5 nvme-pci: qdepth 1 quirk
    c4e98006092b gpiolib: cdev: Ignore reconfiguration without direction
    53dc61ae5cff Revert "wifi: cfg80211: check wiphy mutex is held for wdev mutex"
    424bd79517ce netfilter: nf_tables: missing iterator type in lookup walk
    f24d8abc2bb8 netfilter: nft_set_pipapo: walk over current view on netlink dump
    94d6fe6b6e6e netfilter: nft_socket: Fix a NULL vs IS_ERR() bug in nft_socket_cgroup_subtree_level()
    f07e28e4c623 netfilter: nft_socket: make cgroupsv2 matching work with namespaces
    ea71c39d4638 powercap/intel_rapl: Add support for AMD family 1Ah
    e615cd84dcf8 drm: Expand max DRM device number to full MINORBITS
    f6b589e36153 accel: Use XArray instead of IDR for minors
    d2e3d344e20e drm: Use XArray instead of IDR for minors
    c726dea9d0c8 ocfs2: strict bound check before memcmp in ocfs2_xattr_find_entry()
    1f6e167d6753 ocfs2: add bounds checking to ocfs2_xattr_find_entry()
    4c21bba38b94 spi: spidev: Add missing spi_device_id for jg10309-01
    c20e89c96f14 block: Fix where bio IO priority gets set
    532ba43dcef8 tools: hv: rm .*.cmd when make clean
    f0759b097377 x86/hyperv: Set X86_FEATURE_TSC_KNOWN_FREQ when Hyper-V provides frequency
    fabc4ed200f9 smb: client: fix hang in wait_for_response() for negproto
    e79896417c03 spi: bcm63xx: Enable module autoloading
    745fe9f19d04 drm: komeda: Fix an issue related to normalized zpos
    d7c126497de6 ALSA: hda: add HDMI codec ID for Intel PTL
    16fb61afffdb ASoC: amd: yc: Add a quirk for MSI Bravo 17 (D7VEK)
    a9affc6dd8b0 spi: spidev: Add an entry for elgin,jg10309-01
    5a8f8d49bcd7 ASoC: fix module autoloading
    b3cc98bd86e8 ASoC: tda7419: fix module autoloading
    1803f06c86b0 ASoC: google: fix module autoloading
    7675ab5900a8 ASoC: intel: fix module autoloading
    ec39e3104a77 ASoC: Intel: soc-acpi-cht: Make Lenovo Yoga Tab 3 X90F DMI match less strict
    740253ebb552 can: mcp251xfd: mcp251xfd_ring_init(): check TX-coalescing configuration
    021cd8f0e479 wifi: iwlwifi: clear trans->state earlier upon error
    9902dacd5b0b wifi: mac80211: free skb on error path in ieee80211_beacon_get_ap()
    4d0a900ec470 wifi: iwlwifi: mvm: don't wait for tx queues if firmware is dead
    2c61b561baf9 wifi: iwlwifi: mvm: pause TCM when the firmware is stopped
    8587a0ed5f07 wifi: iwlwifi: mvm: fix iwl_mvm_max_scan_ie_fw_cmd_room()
    0d07f12e1f06 wifi: iwlwifi: mvm: fix iwl_mvm_scan_fits() calculation
    dfa94a93f7b7 wifi: iwlwifi: lower message level for FW buffer destination
    8a834f251f6c LoongArch: Define ARCH_IRQ_INIT_FLAGS as IRQ_NOPROBE
    d44cfa992b6b net: ftgmac100: Ensure tx descriptor updates are visible
    001eaeaac79d platform/x86: x86-android-tablets: Make Lenovo Yoga Tab 3 X90F DMI match less strict
    1bab72a2b985 microblaze: don't treat zero reserved memory regions as error
    76f74a1c3d5d hwmon: (asus-ec-sensors) remove VRM temp X570-E GAMING
    af08f4506114 pinctrl: at91: make it work with current gpiolib
    013180bf2314 scsi: lpfc: Fix overflow build issue
    49a9fe95eb6f ALSA: hda/realtek - FIxed ALC285 headphone no sound
    4a31d48c096b ALSA: hda/realtek - Fixed ALC256 headphone no sound
    50dcf4b7b76c ASoC: allow module autoloading for table board_ids
    b7420317a90d ASoC: allow module autoloading for table db1200_pids
    0627ba94347b ASoC: mediatek: mt8188: Mark AFE_DAC_CON0 register as volatile
    aef267374152 ASoC: SOF: mediatek: Add missing board compatible
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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 533d46e8c01994a0c2d89d0758fc6b0e7f1174f5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index a425015dbc..7fc0fd078e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a2252fce7715d414dc5877902ff4fe07630aa92c"
-SRCREV_meta ?= "5cefbe3e2770576771fe59b611d3b5fcf5860a1f"
+SRCREV_machine ?= "0ce49672227f66ded53377427efc1f3db72accf6"
+SRCREV_meta ?= "531f6c1ed43222e5c607853390a832479e881d81"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.52"
+LINUX_VERSION ?= "6.6.54"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 5b76af5275..86d8f34c1a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.52"
+LINUX_VERSION ?= "6.6.54"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "01b1f32be4b0eb108c00b16ec4eef29ce7fa9546"
-SRCREV_meta ?= "5cefbe3e2770576771fe59b611d3b5fcf5860a1f"
+SRCREV_machine ?= "df7d92644aafc470930586d9076bafa24f063e06"
+SRCREV_meta ?= "531f6c1ed43222e5c607853390a832479e881d81"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 82bc70a82c..949dbfd7e0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "f526214e00c4b81f94a7609ad5f7cd0a5cc85219"
-SRCREV_machine:qemuarm64 ?= "01b1f32be4b0eb108c00b16ec4eef29ce7fa9546"
-SRCREV_machine:qemuloongarch64 ?= "01b1f32be4b0eb108c00b16ec4eef29ce7fa9546"
-SRCREV_machine:qemumips ?= "34d1fef76d87c348c862115efb0b023c1e58673e"
-SRCREV_machine:qemuppc ?= "01b1f32be4b0eb108c00b16ec4eef29ce7fa9546"
-SRCREV_machine:qemuriscv64 ?= "01b1f32be4b0eb108c00b16ec4eef29ce7fa9546"
-SRCREV_machine:qemuriscv32 ?= "01b1f32be4b0eb108c00b16ec4eef29ce7fa9546"
-SRCREV_machine:qemux86 ?= "01b1f32be4b0eb108c00b16ec4eef29ce7fa9546"
-SRCREV_machine:qemux86-64 ?= "01b1f32be4b0eb108c00b16ec4eef29ce7fa9546"
-SRCREV_machine:qemumips64 ?= "0d173d25a1634af6bd55b4346237962f3c6a0b47"
-SRCREV_machine ?= "01b1f32be4b0eb108c00b16ec4eef29ce7fa9546"
-SRCREV_meta ?= "5cefbe3e2770576771fe59b611d3b5fcf5860a1f"
+SRCREV_machine:qemuarm ?= "ec07bf6095980f034280a64993ca4a02553c6cfa"
+SRCREV_machine:qemuarm64 ?= "df7d92644aafc470930586d9076bafa24f063e06"
+SRCREV_machine:qemuloongarch64 ?= "df7d92644aafc470930586d9076bafa24f063e06"
+SRCREV_machine:qemumips ?= "a452bfda5b8d19a09e56194b9581db1d6c258008"
+SRCREV_machine:qemuppc ?= "df7d92644aafc470930586d9076bafa24f063e06"
+SRCREV_machine:qemuriscv64 ?= "df7d92644aafc470930586d9076bafa24f063e06"
+SRCREV_machine:qemuriscv32 ?= "df7d92644aafc470930586d9076bafa24f063e06"
+SRCREV_machine:qemux86 ?= "df7d92644aafc470930586d9076bafa24f063e06"
+SRCREV_machine:qemux86-64 ?= "df7d92644aafc470930586d9076bafa24f063e06"
+SRCREV_machine:qemumips64 ?= "d0ba176a1f0f743b807fbb13d062b9a6156cafca"
+SRCREV_machine ?= "df7d92644aafc470930586d9076bafa24f063e06"
+SRCREV_meta ?= "531f6c1ed43222e5c607853390a832479e881d81"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "561bbd55f91a8e94576ca3fbf35a0c99ff70d4b2"
+SRCREV_machine:class-devupstream ?= "63a57420cf797edcfca41005dd6c805b77cfb596"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.52"
+LINUX_VERSION ?= "6.6.54"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


