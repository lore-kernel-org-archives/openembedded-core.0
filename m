Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C242CF5377
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 12:35:11 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.7908.1729686901642786866
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 05:35:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=F54ChioB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20cceb8d8b4so5738995ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 05:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729686901; x=1730291701; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MAdw+keyPbbP2VImcv2XGAHwVbobonIHEynKu19fiYA=;
        b=F54ChioBYtbMJuACXT32b71Sb32blej4kbmXLuVQzAVg63xcnk9YIFnnj4jixNAySw
         UTTJp5SeKvRvm0+L0yh/NJJFlQzd82zjjfIUU3wwsCesxHt5q9BGXKD/9oygjE8aMc8i
         OBniod/nBmR4DLJ+yO+LqqzGsba9Ph4Ngf3wbR2MWtHii12vAK72CAEd+fgJsdcd9Vt9
         U1uQB7b01Wfj4ZUTtZrjlELlYzYeXOCV1eFc5PWlBVIQ/mEnrr9KEz89xcTpKLgXd+LP
         IZkRoEfRWJXZDetiuSa0hl1dfy1D44/gDtWqry/hZL6kVqhzFdcj2qkJfeaYj6BL9O/2
         3kZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729686901; x=1730291701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MAdw+keyPbbP2VImcv2XGAHwVbobonIHEynKu19fiYA=;
        b=W2dqZ5zLgoYP4f+Q35IDKuxzMw9xFyxckxCPNu2qzLw+6sOV/kkbVIP5HJjUPqCcFV
         SILUjwpaEK6XKPkhhJAprX64qmuP9GE+gfgPkIcO12FOAMutjizZpyVfRpB+Lfvb7jnp
         28AEUBMXJeEPUQh1UKgXlIiJBkOW8j17bW/mCOybgAoi1biJAIck/3DuZ/qTBY2gSFzH
         a+2M9aXNxq7rEQW6u74Nczq0wClfPPV+SbMiOK+TUy8zuDzQM0QuPSKnW5tHMIcJ05EG
         LDM4rsTUJAvFOXb9JNTvi1oFDs7ZE/bXs86LrID30Hl9xjXUuE+8GLFbRiCSgK/JK30i
         CVfg==
X-Gm-Message-State: AOJu0YzA7G3/cWPzaT+bRWlhLKNUkbtt/U0TTaBjZWIpP4rX7LlMk/jD
	MxB03sZs3NlJZjlpzpuJx9c6rehXK5F202TAEGQTqYPhMJ2rVvR3eaea5iyGgNIo8CfEEMAxYN5
	a
X-Google-Smtp-Source: AGHT+IFKSUrvH4b87tBnC3tcF/P5tiXEZ6tA/m7ENCjWpNy0Sr//3Fqchm7ypz4/OqI74QoBByLw0w==
X-Received: by 2002:a17:902:cec7:b0:20c:ceaf:e65f with SMTP id d9443c01a7336-20fab359cd7mr32765595ad.25.1729686900020;
        Wed, 23 Oct 2024 05:35:00 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a40:d08b:8aa5:305c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0de3dasm57294245ad.226.2024.10.23.05.34.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:34:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 10/27] linux-yocto/6.10: update to v6.10.13
Date: Wed, 23 Oct 2024 05:34:18 -0700
Message-Id: <f113431c53e5a5d6051478487e34edbba4f19e0c.1729686660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729686660.git.steve@sakoman.com>
References: <cover.1729686660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 12:35:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206221

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.10 to the latest korg -stable release that comprises
the following commits:

    0202c63cba31 Linux 6.10.13
    b332bcca5914 Revert: "dm-verity: restart or panic on an I/O error"
    ff055e9142d8 spi: atmel-quadspi: Fix wrong register value written to MR
    7c1d782e5afb bpf: Fix use-after-free in bpf_uprobe_multi_link_attach()
    a98fd7c6e7b2 Documentation: KVM: fix warning in "make htmldocs"
    119ffd4dc84d i2c: isch: Add missed 'else'
    7ae30ea153fa i2c: aspeed: Update the stop sw state when the bus recovery occurs
    402d8f715fb4 mm/damon/vaddr: protect vma traversal in __damon_va_thre_regions() with rcu read lock
    f6a0cee98082 mm: change vmf_anon_prepare() to __vmf_anon_prepare()
    721aa7c9984e mm/huge_memory: ensure huge_zero_folio won't have large_rmappable flag set
    e897d184a8dd mm/hugetlb.c: fix UAF of vma in hugetlb fault pathway
    d4ed0cf0eeaa tpm: export tpm2_sessions_init() to fix ibmvtpm building
    36b5955c3f68 fbdev: xen-fbfront: Assign fb_info->device
    33faba1cca52 module: Fix KCOV-ignored file name
    d1c8ed814b78 spi: fspi: add support for imx8ulp
    f48e4f4b86b5 mm: only enforce minimum stack gap size if it's sensible
    14a8bac5c98d s390/ftrace: Avoid calling unwinder in ftrace_return_address()
    7cc8ab687d6d mm/hugetlb_vmemmap: batch HVO work when demoting
    f9835aec4967 exfat: resolve memory leak from exfat_create_upcase_table()
    9b8d21246c5c lockdep: fix deadlock issue between lockdep and rcu
    f038423291f0 compiler.h: specify correct attribute for .rodata..c_jump_table
    4a7677a15469 dm-verity: restart or panic on an I/O error
    c98a910c64ef bpf: lsm: Set bpf_lsm_blob_sizes.lbs_task to 0
    fbec4ba70f78 lsm: infrastructure management of the sock security
    04a55dd3419d debugfs show actual source in /proc/mounts
    84f079349d55 debugfs: Convert to new uid/gid option parsing helpers
    df881ff32117 fs_parse: add uid & gid option option parsing helpers
    b249b7b1b134 idpf: fix netdev Tx queue stop/wake
    710e93ec5c3d idpf: merge singleq and splitq &net_device_ops
    90610752baf2 idpf: split &idpf_queue into 4 strictly-typed queue structures
    122d2f10b45c idpf: stop using macros for accessing queue descriptors
    33818ec99d6f serial: qcom-geni: fix console corruption
    7478f1219178 serial: qcom-geni: introduce qcom_geni_serial_poll_bitfield()
    077eeda6704c serial: qcom-geni: fix arg types for qcom_geni_serial_poll_bit()
    4e90db20e901 soc: qcom: geni-se: add GP_LENGTH/IRQ_EN_SET/IRQ_EN_CLEAR registers
    6e0e7e8558a6 usb: xhci: fix loss of data on Cadence xHC
    7688c5a74bf2 xhci: Add a quirk for writing ERST in high-low order
    18ecd5b74682 x86/tdx: Fix "in-kernel MMIO" check
    37263b5d4c18 x86/tdx: Convert shared memory back to private on kexec
    5b026890012d x86/mm: Add callbacks to prepare encrypted memory for kexec
    19b96b1fe195 x86/tdx: Account shared memory
    d6c641139c61 x86/mm: Make x86_platform.guest.enc_status_change_*() return an error
    2578f2637a59 KVM: x86: Re-split x2APIC ICR into ICR+ICR2 for AMD (x2AVIC)
    e99b21b794cb KVM: x86: Make x2APIC ID 100% readonly
    d9ac05ef9ec3 KVM: x86: Drop unused check_apicv_inhibit_reasons() callback definition
    a31e6d3207ce soc: versatile: realview: fix soc_dev leak during device remove
    15c0bd2062e3 soc: versatile: realview: fix memory leak during device remove
    d7e07c2e87d8 tools/nolibc: include arch.h from string.h
    8d80003cf38a ARM: dts: imx6ull-seeed-npi: fix fsl,pins property in tscgrp pinctrl
    e78b09351149 ARM: dts: imx6ul-geam: fix fsl,pins property in tscgrp pinctrl
    077694df5512 dt-bindings: spi: nxp-fspi: add imx8ulp support
    68f267a3372c spi: fspi: involve lut_num for struct nxp_fspi_devtype_data
    71d1380da9f8 lsm: add the inode_free_security_rcu() LSM implementation hook
    9e279e6c1f01 padata: use integer wrap around to prevent deadlock on seq_nr overflow
    f7cdf73258cf cpuidle: riscv-sbi: Use scoped device node handling to fix missing of_node_put
    d19c5b21711c md: Don't flush sync_work in md_write_start()
    c7f9d442d1c4 eventpoll: Annotate data-race of busy_poll_usecs
    a7722921adb0 icmp: change the order of rate limits
    7679db85a814 EDAC/igen6: Fix conversion of system address to physical memory address
    68ee58f3a067 nfs: fix memory leak in error path of nfs4_do_reclaim
    4ee3665e0fbf fs: Fix file_set_fowner LSM hook inconsistencies
    603f95cefbee netfs: Delete subtree of 'fs/netfs' when netfs module exits
    0f8a5b6d0daf vfs: fix race between evice_inodes() and find_inode()&iput()
    84aa262013f3 arm64: dts: rockchip: Correct the Pinebook Pro battery design capacity
    5056c1476cf4 arm64: dts: qcom: sa8775p: Mark APPS and PCIe SMMUs as DMA coherent
    0d0d96f7f6b1 arm64: dts: rockchip: Raise Pinebook Pro's panel backlight PWM frequency
    67b4f0145e55 arm64: dts: mediatek: mt8186-corsola: Disable DPI display interface
    9dc7b42b9d0d arm64: errata: Enable the AC03_CPU_38 workaround for ampere1a
    14f310aeec55 arm64: esr: Define ESR_ELx_EC_* constants as UL
    1bf8e1d07de1 hwrng: cctrng - Add missing clk_disable_unprepare in cctrng_resume
    afdb6186369e hwrng: bcm2835 - Add missing clk_disable_unprepare in bcm2835_rng_init
    970fad1992bf hwrng: mtk - Use devm_pm_runtime_enable
    10569b682ebe f2fs: fix to check atomic_file in f2fs ioctl interfaces
    7bd7ce68ddad f2fs: check discard support for conventional zones
    f3bfac2cabf5 f2fs: Require FMODE_WRITE for atomic write ioctls
    7686e9c32ae9 f2fs: avoid potential int overflow in sanity_check_area_boundary()
    9e34807b75fe f2fs: prevent possible int overflow in dir_block_index()
    baff811ba631 f2fs: fix several potential integer overflows in file offsets
    592a57d3bead btrfs: always update fstrim_range on failure in FITRIM ioctl
    62964916da1b btrfs: tree-checker: fix the wrong output of data backref objectid
    a412ca489ac2 btrfs: fix race setting file private on concurrent lseek using same fd
    0b8d3972792c debugobjects: Fix conditions in fill_pool()
    e0b04c335b13 wifi: mt76: mt7615: check devm_kasprintf() returned value
    c128a1456df1 wifi: rtw88: 8703b: Fix reported RX band width
    556941ad3c4a wifi: rtw88: 8822c: Fix reported RX band width
    667394ab7065 wifi: rtw88: 8821cu: Remove VID/PID 0bda:c82c
    fb60020cb5b3 wifi: mt76: mt7925: fix a potential array-index-out-of-bounds issue for clc
    174c803b4325 wifi: mt76: mt7996: fix NULL pointer dereference in mt7996_mcu_sta_bfer_he
    1eaca38ad2f4 wifi: mt76: mt7915: check devm_kasprintf() returned value
    2b9f8545875a wifi: mt76: mt7921: Check devm_kasprintf() returned value
    1d3589834b00 btrfs: subpage: fix the bitmap dump which can cause bitmap corruption
    16d277b3e920 perf/x86/intel/pt: Fix sampling synchronization
    4a3c332100b0 perf/x86/intel: Allow to setup LBR for counting event for BPF
    b51acf3262dd x86/entry: Remove unwanted instrumentation in common_interrupt()
    38d9b07d99b7 efistub/tpm: Use ACPI reclaim memory for event log to avoid corruption
    4af2e4221c3f ACPI: resource: Add another DMI match for the TongFang GMxXGxx
    5d65d2411d83 ACPI: resource: Do IRQ override on MECHREV GM7XG0M
    f51e5a88f2e7 ACPI: sysfs: validate return type of _STR method
    54be41a85d8d drbd: Add NULL check for net_conf to prevent dereference in state validation
    ad96750f0622 drbd: Fix atomicity violation in drbd_uuid_set_bm()
    cd327e30a9a0 crypto: ccp - Properly unregister /dev/sev on sev PLATFORM_STATUS failure
    86c15cab2785 crypto: qcom-rng - fix support for ACPI-based systems
    36761d1d700d serial: qcom-geni: fix false console tx restart
    25aff44936a5 serial: qcom-geni: fix fifo polling timeout
    e4c3ea5da394 xhci: Set quirky xHC PCI hosts to D3 _after_ stopping and freeing them.
    80cef0f1d06b serial: don't use uninitialized value in uart_poll_init()
    4e017898e9a8 pps: add an error check in parport_attach
    8ec7d8918fd6 tty: rp2: Fix reset with non forgiving PCIe host bridges
    28f1cd94d3f1 firmware_loader: Block path traversal
    0012b71a698c bus: mhi: host: pci_generic: Fix the name for the Telit FE990A
    6a33c79504ee bus: integrator-lm: fix OF node leak in probe()
    40eeefad32b1 usb: dwc2: drd: fix clock gating on USB role switch
    ad653877041b usb: gadget: dummy_hcd: execute hrtimer callback in softirq context
    e527d2ac5455 usb: xHCI: add XHCI_RESET_ON_RESUME quirk for Phytium xHCI host
    e326f29101c9 usb: cdnsp: Fix incorrect usb_request status
    9479f64b9992 USB: misc: yurex: fix race between read and write
    3f682752207d USB: class: CDC-ACM: fix race between get_serial and set_serial
    5f2c43335cc5 USB: misc: cypress_cy7c63: check for short transfer
    c92b7a265de5 USB: appledisplay: close race between probe and completion handler
    f9aa13449211 arm64: dts: mediatek: mt8395-nio-12l: Mark USB 3.0 on xhci1 as disabled
    31fc87cb4eca arm64: dts: mediatek: mt8195-cherry: Mark USB 3.0 on xhci1 as disabled
    ca124236cd14 usbnet: fix cyclical race on disconnect with work queue
    5898a9879803 wifi: rtw88: Fix USB/SDIO devices not transmitting beacons
    36071d878699 can: esd_usb: Remove CAN_CTRLMODE_3_SAMPLES for CAN-USB/3-FD
    ca1e50206718 scsi: mac_scsi: Disallow bus errors during PDMA send
    a960eb7988b4 scsi: mac_scsi: Refactor polling loop
    ab7667ccef06 scsi: mac_scsi: Revise printk(KERN_DEBUG ...) messages
    e3189128e800 scsi: lpfc: Restrict support for 32 byte CDBs to specific HBAs
    0359228a4981 scsi: ufs: qcom: Update MODE_MAX cfg_bw value
    a77605037389 scsi: sd: Fix off-by-one error in sd_read_block_characteristics()
    a16ac25841ee ata: libata-scsi: Fix ata_msense_control() CDL page reporting
    d205cb1a13b3 ksmbd: handle caseless file creation
    e5b77e889cea ksmbd: allow write with FILE_APPEND_DATA
    8205b5d56d21 ksmbd: make __dir_empty() compatible with POSIX
    de6e34238a1b powerpc/atomic: Use YZ constraints for DS-form instructions
    13b5b401ead9 KEYS: prevent NULL pointer dereference in find_asymmetric_key()
    5292dc91a7eb objtool: Handle frame pointer related instructions
    51f87aa74da9 Revert "LoongArch: KVM: Invalidate guest steal time address on vCPU reset"
    1b77dd8520fc drm/amd/display: Skip to enable dsc if it has been off
    517f6e8a60c4 drm/amd/display: Enable DML2 override_det_buffer_size_kbytes
    d13a338fa80b drm/amd/display: Block dynamic IPS2 on DCN35 for incompatible FW versions
    47ab3a0c04e1 drm/amd/display: Disable SYMCLK32_LE root clock gating
    ce3ed9a959c9 drm/amd/display: Validate backlight caps are sane
    c9a3c3e2bffe drm/amd/display: Clean up dsc blocks in accelerated mode
    597f862f516a drm/amd/display: Round calculated vtotal
    fbf3cff7c058 drm/amd/display: Add HDMI DSC native YCbCr422 support
    d6c1abe4b26e drm/amdgpu/vcn: enable AV1 on both instances
    ac1500b229ed drm/amdgpu/mes11: reduce timeout
    6f9c39e81693 drm/amd/display: Skip Recompute DSC Params if no Stream on Link
    a2764afce521 KVM: Use dedicated mutex to protect kvm_usage_count to avoid deadlock
    afd2d93644a0 KVM: x86: Move x2APIC ICR helper above kvm_apic_write_nodecode()
    5b0421ae5185 KVM: x86: Enforce x2APIC's must-be-zero reserved ICR bits
    46a40b3639c4 KVM: arm64: Add memory length checks and remove inline in do_ffa_mem_xfer
    547bce5c250b Input: i8042 - add another board name for TUXEDO Stellaris Gen5 AMD line
    ab770984fba5 Input: i8042 - add TUXEDO Stellaris 15 Slim Gen6 AMD to i8042 quirk table
    af38c4cf0a32 Input: i8042 - add TUXEDO Stellaris 16 Gen5 AMD to i8042 quirk table
    38f45f17a2a3 Input: adp5588-keys - fix check on return code
    a6e9f9fd1477 iommufd: Protect against overflow of ALIGN() during iova allocation
    92e53443dc63 iommu/amd: Fix argument order in amd_iommu_dev_flush_pasid_all()
    eab78824687c Revert "media: tuners: fix error return code of hybrid_tuner_request_state()"
    06cf4125fa92 soc: versatile: integrator: fix OF node leak in probe() error path
    2485d2d8ce63 soc: fsl: cpm1: tsa: Fix tsa_write8()
    531704571a7e soc: fsl: cpm1: qmc: Update TRNSYNC only in transparent mode
    bc4a33eb74f6 ASoC: rt5682: Return devm_of_clk_add_hw_provider to transfer the error
    832653dc7222 Revert "soc: qcom: smd-rpm: Match rpmsg channel instead of compatible"
    774c795aa795 PCI: dra7xx: Fix error handling when IRQ request fails in probe
    07a5794dc862 PCI: xilinx-nwl: Fix off-by-one in INTx IRQ handler
    2cbfcb6389c4 PCI: Use an error code with PCIe failed link retraining
    0f28502c2ae2 PCI: Correct error reporting with PCIe failed link retraining
    7826d9f1eb3d PCI: imx6: Fix i.MX8MP PCIe EP's occasional failure to trigger MSI
    1c59f627ac89 PCI: imx6: Fix establish link failure in EP mode for i.MX8MM and i.MX8MP
    06adf7509477 PCI: imx6: Fix missing call to phy_power_off() in error handling
    c04924915367 PCI: dra7xx: Fix threaded IRQ request for "dra7xx-pcie-main" IRQ
    478e554fe94b PCI: Clear the LBMS bit after a link retrain
    e315cf7f532b PCI: Revert to the original speed after PCIe failed link retraining
    e152508df743 Remove *.orig pattern from .gitignore
    4c3ce023e538 selftests/bpf: correctly move 'log' upon successful match
    bd93fe03abbe io_uring/sqpoll: do not put cpumask on stack
    6222abfa459f io_uring/sqpoll: retain test for whether the CPU is valid
    6c31c83178ce xen: allow mapping ACPI data using a different physical address
    5322ebfe9de3 xen: move checks for e820 conflicts further up
    a8a3ba3deb39 drm/amd/display: Fix Synaptics Cascaded Panamera DSC Determination
    3393fddbfa94 mm: call the security_mmap_file() LSM hook in remap_file_pages()
    1fea7fd0480b mm: migrate: annotate data-race in migrate_folio_unmap()
    fa4890bd8237 fuse: use exclusive lock when FUSE_I_CACHE_IO_MODE is set
    340f20fe8708 io_uring: check for presence of task_work rather than TIF_NOTIFY_SIGNAL
    daf062a2d7ed io_uring/rw: treat -EOPNOTSUPP for IOCB_NOWAIT like -EAGAIN
    a1dbcdfc2320 io_uring/sqpoll: do not allow pinning outside of cpuset
    cfd68a58fb68 selftests: netfilter: Avoid hanging ipvs.sh
    7f44a170ce3f netfilter: nf_tables: missing objects with no memcg accounting
    e6a31dc01d76 netfilter: nf_tables: use rcu chain hook list iterator from netlink dump path
    e80310d02ae9 netfilter: ctnetlink: compile ctnetlink_label_size with CONFIG_NF_CONNTRACK_EVENTS
    d3169bf3e90b netfilter: nf_tables: Keep deleted flowtable hooks until after RCU
    188074ba3668 net: stmmac: set PP_FLAG_DMA_SYNC_DEV only if XDP is enabled
    d27ed6e76f47 virtio_net: Fix mismatched buf address when unmapping for small packets
    72e2c0825a48 bonding: Fix unnecessary warnings and logs from bond_xdp_get_xmit_slave()
    997a908a3bf7 net: ravb: Fix R-Car RX frame size limit
    a8942a6bb6f1 net: qrtr: Update packets cloning when broadcasting
    81d18c152e3f tcp: check skb is non-NULL in tcp_rto_delta_us()
    0fe0258969a7 net: ipv6: select DST_CACHE from IPV6_RPL_LWTUNNEL
    516dbc6d1663 net: seeq: Fix use after free vulnerability in ether3 Driver Due to Race Condition
    7a7b5a27c53b netfilter: nf_reject_ipv6: fix nf_reject_ip6_tcphdr_put()
    4903d8d99476 net: xilinx: axienet: Fix packet counting
    0ecfaff3633d net: xilinx: axienet: Schedule NAPI in two steps
    328ea56813b2 Revert "dm: requeue IO if mapping table not yet available"
    27f493e14182 ep93xx: clock: Fix off by one in ep93xx_div_recalc_rate()
    fae9b1776f53 vhost_vdpa: assign irq bypass producer token correctly
    b6fbb1c7801f vdpa/mlx5: Fix invalid mr resource destroy
    e21de2b784dc cxl/pci: Fix to record only non-zero ranges
    c462e91f47b1 interconnect: qcom: sm8250: Enable sync_state
    706b7a43a351 interconnect: icc-clk: Add missed num_nodes initialization
    4d1bf0bd1b4b coresight: tmc: sg: Do not leak sg_table
    16e2d8eb7185 Coresight: Set correct cs_mode for dummy source to fix disable issue
    c23757a35d36 Coresight: Set correct cs_mode for TPDM to fix disable issue
    4a5ad1554051 serial: 8250: omap: Cleanup on error in request_irq
    4b5d48b7a29c driver core: Fix a potential null-ptr-deref in module_add_driver()
    21829e1a94f7 dt-bindings: iio: asahi-kasei,ak8975: drop incorrect AK09116 compatible
    6c0917cd3d6e iio: magnetometer: ak8975: drop incorrect AK09116 compatible
    6437a9d687b6 iio: chemical: bme680: Fix read/write ops to device by adding mutexes
    c60176b5556e ABI: testing: fix admv8818 attr description
    23f6b0bdeb42 driver core: Fix error handling in driver API device_rename()
    c8cb9b018fe0 iio: adc: ad7606: fix standby gpio state to match the documentation
    e56695c01682 iio: adc: ad7606: fix oversampling gpio array
    1fb2daf531e0 nvme-multipath: system fails to create generic nvme device
    78fac439da12 spi: atmel-quadspi: Avoid overwriting delay register settings
    3b0092907ccf spi: airoha: remove read cache in airoha_snand_dirmap_read()
    864df9264682 lib/sbitmap: define swap_lock as raw_spinlock_t
    81ed78937168 spi: spi-fsl-lpspi: Undo runtime PM changes at driver exit time
    308041f803d1 spi: atmel-quadspi: Undo runtime PM changes at driver exit time
    b75f01b2cb4c spi: airoha: fix airoha_snand_{write,read}_data data_len estimation
    d8e267c24cc4 spi: airoha: fix dirmap_{read,write} operations
    de43021c7299 f2fs: fix to don't set SB_RDONLY in f2fs_handle_critical_error()
    8be95cd60747 f2fs: get rid of online repaire on corrupted directory
    058c1af469aa f2fs: prevent atomic file from being dirtied before commit
    0a4ff4e9d2dd f2fs: compress: don't redirty sparse cluster during {,de}compress
    7c339dee7eb0 f2fs: fix to avoid use-after-free in f2fs_stop_gc_thread()
    a7972f073477 f2fs: atomic: fix to truncate pagecache before on-disk metadata truncation
    89ea17674588 f2fs: fix to wait page writeback before setting gcing flag
    af605d5099dc f2fs: Create COW inode from parent dentry for atomic write
    b21c3009a86f f2fs: fix to avoid racing in between read and OPU dio write
    fe56ed433971 f2fs: reduce expensive checkpoint trigger frequency
    e78299a4b376 f2fs: atomic: fix to avoid racing w/ GC
    e454a6482cd1 crypto: powerpc/p10-aes-gcm - Disable CRYPTO_AES_GCM_P10
    e52bab5f2b40 crypto: caam - Pad SG length when allocating hash edesc
    3a1bb47f2410 nfsd: fix initial getattr on write delegation
    3939b13fcbb9 nfsd: untangle code in nfsd4_deleg_getattr_conflict()
    766d5fbd78f7 nfsd: return -EINVAL when namelen is 0
    e32ee6a61041 nfsd: call cache_put if xdr_reserve_space returns NULL
    d1cb8394545b ntb: Force physically contiguous allocation of rx ring buffers
    9fda5a42e1bd ntb_perf: Fix printk format
    b66bf833e72a ntb: intel: Fix the NULL vs IS_ERR() bug for debugfs_create_dir()
    08e9de3a5619 RDMA/irdma: fix error message in irdma_modify_qp_roce()
    54aaa3ed4097 RDMA/cxgb4: Added NULL check for lookup_atid
    587db10c36de RDMA/hns: Fix ah error counter in sw stat not increasing
    09210bb3a0f4 riscv: Fix fp alignment bug in perf_callchain_user()
    09eee130151d PCI: qcom-ep: Enable controller resources like PHY only after refclk is available
    1621c437ec9d RDMA/mlx5: Obtain upper net device only when needed
    52f61811df43 RDMA/hns: Fix restricted __le16 degrades to integer issue
    e4724f92065d RDMA/hns: Optimize hem allocation performance
    27d7572bb947 RDMA/hns: Fix 1bit-ECC recovery address in non-4K OS
    94a020c0d576 RDMA/hns: Fix VF triggering PF reset in abnormal interrupt handler
    2656336a84fc RDMA/hns: Fix spin_unlock_irqrestore() called with IRQs enabled
    38c01f809e43 RDMA/hns: Fix the overflow risk of hem_list_calc_ba_range()
    dac2723d8bfa RDMA/hns: Fix Use-After-Free of rsv_qp on HIP08
    812f69426de3 RDMA/hns: Don't modify rq next block addr in HIP09 QPC
    93e568e95e9a watchdog: imx_sc_wdt: Don't disable WDT in suspend
    1fe05fbfab15 RDMA/mlx5: Fix MR cache temp entries cleanup
    bcaaa91005f8 RDMA/mlx5: Drop redundant work canceling from clean_keys()
    62d5ba1b8f87 RDMA/mlx5: Limit usage of over-sized mkeys from the MR cache
    efdaddb94ddb RDMA/mlx5: Fix counter update on MR cache mkey creation
    e6e69719c6f2 RDMA/erdma: Return QP state in erdma_query_qp
    6dcc5b49d660 PCI: kirin: Fix buffer overflow in kirin_pcie_parse_port()
    8842412c2777 iommufd: Check the domain owner of the parent before creating a nesting domain
    f6b8766fa3f7 dt-bindings: PCI: layerscape-pci: Replace fsl,lx2160a-pcie with fsl,lx2160ar2-pcie
    af633fd9d9ff IB/core: Fix ib_cache_setup_one error flow cleanup
    7afb394b2e2a pinctrl: mvebu: Fix devinit_dove_pinctrl_probe function
    3f02356f7bbe nfsd: fix refcount leak when file is unhashed after being found
    f490e015aa7b nfsd: remove unneeded EEXIST error check in nfsd_do_file_acquire
    f1ceb401347b clk: rockchip: rk3588: Fix 32k clock name for pmu_24m_32k_100m_src_p
    650bde16cc55 clk: starfive: Use pm_runtime_resume_and_get to fix pm_runtime_get_sync() usage
    e8d6e92abc9d clk: ti: dra7-atl: Fix leak of of_nodes
    1c50e0265fa3 RDMA/rtrs-clt: Reset cid to con_num - 1 to stay in bounds
    bfac76dda554 RDMA/rtrs: Reset hb_missed_cnt after receiving other traffic from peer
    18181b0c1c5b media: mediatek: vcodec: Fix H264 stateless decoder smatch warning
    35cc704622b3 media: mediatek: vcodec: Fix VP8 stateless decoder smatch warning
    47b3b9793091 media: mediatek: vcodec: Fix H264 multi stateless decoder smatch warning
    9a1f532bcde5 iommufd/selftest: Fix buffer read overrrun in the dirty test
    14b2c972b711 clk: at91: sama7g5: Allocate only the needed amount of memory for PLLs
    56856ccabb14 pinctrl: single: fix missing error code in pcs_probe()
    c8b18a75282c RDMA/iwcm: Fix WARNING:at_kernel/workqueue.c:#check_flush_dependency
    a7180d2374c4 media: platform: rzg2l-cru: rzg2l-csi2: Add missing MODULE_DEVICE_TABLE
    c4b43e76e48e leds: gpio: Set num_leds after allocation
    1f6fd239c466 PCI: xilinx-nwl: Clean up clock on probe failure/removal
    e1e61c13ea07 PCI: xilinx-nwl: Fix register misspelling
    939053737edb nvdimm: Fix devs leaks in scan_labels()
    a6fb2bf1e747 x86/PCI: Check pcie_find_root_port() return for NULL
    660c4de1777e leds: pca995x: Fix device child node usage in pca995x_probe()
    382b9448557f leds: pca995x: Use device_for_each_child_node() to access device child nodes
    e8a0f9872ce4 leds: leds-pca995x: Add support for NXP PCA9956B
    baff5d92f571 clk: qcom: dispcc-sm8250: use special function for Lucid 5LPE PLL
    791f0dc95f75 clk: qcom: ipq5332: Register gcc_qdss_tsctr_clk_src
    da8db14447bf media: staging: media: starfive: camss: Drop obsolete return value documentation
    72210e52e19a PCI: keystone: Fix if-statement expression in ks_pcie_quirk()
    1f72f6f6f591 firewire: core: correct range of block for case of switch statement
    fe5a1e8d80ad PCI: Wait for Link before restoring Downstream Buses
    7fd6aae7e53b drivers: media: dvb-frontends/rtl2830: fix an out-of-bounds write error
    66dbe0df6ecc drivers: media: dvb-frontends/rtl2832: fix an out-of-bounds write error
    a3a99af76d90 Input: ilitek_ts_i2c - add report id message validation
    de3f995bc491 Input: ilitek_ts_i2c - avoid wrong input subsystem sync
    f5567c5ca417 phy: phy-rockchip-samsung-hdptx: Explicitly include pm_runtime.h
    2eaf8ae7946a pinctrl: ti: ti-iodelay: Fix some error handling paths
    2913fbc0e3e7 pinctrl: ti: iodelay: Use scope based of_node_put() cleanups
    b0c4c139ac88 leds: bd2606mvv: Fix device child node usage in bd2606mvv_probe()
    f071073a5b2d clk: qcom: dispcc-sm8550: use rcg2_shared_ops for ESC RCGs
    3b5aa2adefd0 clk: qcom: dispcc-sm8650: Update the GDSC flags
    61627c13934e clk: qcom: dispcc-sm8550: use rcg2_ops for mdss_dptx1_aux_clk_src
    7d55b2a82bbd clk: qcom: dispcc-sm8550: fix several supposed typos
    fd7996cc3a96 clk: rockchip: Set parent rate for DCLK_VOP clock on RK3228
    0674d041caa7 remoteproc: imx_rproc: Initialize workqueue earlier
    9b7b3530bf80 remoteproc: imx_rproc: Correct ddr alias for i.MX8M
    65df4be8b412 quota: avoid missing put_quota_format when DQUOT_SUSPENDED is passed
    6e31ccbb2651 clk: imx: imx8qxp: Parent should be initialized earlier than the clock
    d39e7535456b clk: imx: imx8qxp: Register dc0_bypass0_clk before disp clk
    a47b38eff28b clk: imx: imx8mp: fix clock tree update of TF-A managed clocks
    11fd64c352ea clk: imx: fracn-gppll: fix fractional part of PLL getting lost
    c5943ae892da clk: imx: composite-7ulp: Check the PCC present bit
    3bcaa9ce8c2e clk: imx: composite-93: keep root clock on when mcore enabled
    d8aa6d4e3788 clk: imx: composite-8m: Enable gate clk with mcore_booted
    61320f0557e0 clk: imx: imx6ul: fix default parent for enet*_ref_sel
    c92f5a5dbf88 clk: imx: clk-audiomix: Correct parent clock for earc_phy and audpll
    b42d09af5162 perf mem: Fix missed p-core mem events on ADL and RPL
    f0ca1e9bef74 perf mem: Check mem_events for all eligible PMUs
    e0595b40c13d perf time-utils: Fix 32-bit nsec parsing
    69272002abca perf sched timehist: Fixed timestamp error when unable to confirm event sched_in time
    22f725544b26 perf dwarf-aux: Handle bitfield members from pointer access
    d39983c19c58 perf annotate-data: Fix off-by-one in location range check
    ccda4ec09a41 perf dwarf-aux: Check allowed location expressions when collecting variables
    8667eafb4bc8 perf stat: Display iostat headers correctly
    f1e51f63a125 perf sched timehist: Fix missing free of session in perf_sched__timehist()
    5120b9e90026 perf build: Fix up broken capstone feature detection fast path
    377fc923090d perf report: Fix --total-cycles --stdio output error
    5af0069973b8 perf inject: Fix leader sampling inserting additional samples
    20959954ea3a perf lock contention: Change stack_id type to s32
    276556d60a02 perf mem: Free the allocated sort string, fixing a leak
    65a6bc711147 perf scripts python cs-etm: Restore first sample log in verbose mode
    599d15b6d033 bpf: Zero former ARG_PTR_TO_{LONG,INT} args in case of error
    16423089d9fc bpf: Improve check_raw_mode_ok test for MEM_UNINIT-tagged types
    2ed98ee02d1e bpf: Fix helper writes to read-only maps
    db52f0accc12 bpf: Fix bpf_strtol and bpf_strtoul helpers for 32bit
    865d7e81b8ab sched/pelt: Use rq_clock_task() for hw_pressure
    a33e967b681e nilfs2: fix potential oob read in nilfs_btree_check_delete()
    141ba5b7f785 nilfs2: determine empty node blocks as corrupted
    db73500d3f0e nilfs2: fix potential null-ptr-deref in nilfs_btree_insert()
    ee88c6e3ea8b sched/numa: Fix the vma scan starving issue
    297615e992bb ext4: check stripe size compatibility on remount as well
    371d0bacecd5 ext4: avoid OOB when system.data xattr changes underneath the filesystem
    95a5e104d812 ext4: return error on ext4_find_inline_entry
    7eec4892020b ext4: avoid negative min_clusters in find_group_orlov()
    8b60c4fe9c3e ext4: avoid potential buffer_head leak in __ext4_new_inode()
    39c6e2e3bc44 ext4: avoid buffer_head leak in ext4_mark_inode_used()
    df480091e6f7 smackfs: Use rcu_assign_pointer() to ensure safe assignment in smk_set_cipso
    841b1321e1d5 sched/deadline: Fix schedstats vs deadline servers
    a4f5cf015a19 ext4: clear EXT4_GROUP_INFO_WAS_TRIMMED_BIT even mount with discard
    2f29d419fef7 kthread: fix task state in kthread worker if being frozen
    f35b5e081249 xz: cleanup CRC32 edits from 2018
    62d1ff1b9b1c s390/ap: Fix deadlock caused by recursive lock of the AP bus scan mutex
    8b315fbec65d libbpf: Fix bpf_object__open_skeleton()'s mishandling of options
    a700b2390bfa selftests/bpf: Fix incorrect parameters in NULL pointer checking
    584cd3ff792e bpf: correctly handle malformed BPF_CORE_TYPE_ID_LOCAL relos
    b2ef8d59709f selftests/bpf: fix to avoid __msg tag de-duplication by clang
    ba5e6f515c81 selftests/bpf: __arch_* macro to limit test cases to specific archs
    04710faed344 selftests/bpf: allow checking xlated programs in verifier_* tests
    fd3f09cc7ca7 selftests/bpf: extract test_loader->expect_msgs as a data structure
    548b73919da9 selftests/bpf: no need to track next_match_pos in struct test_loader
    892d38159039 selftests/bpf: Support checks against a regular expression
    037df3cacfcf samples/bpf: Fix compilation errors with cf-protection option
    7c497677910a selftests/bpf: Fix error compiling tc_redirect.c with musl libc
    b58afb21e61b selftests/bpf: Fix compile if backtrace support missing in libc
    8c174358ceee selftests/bpf: Fix redefinition errors compiling lwt_reroute.c
    dff4f6d48bf3 selftests/bpf: Fix C++ compile error from missing _Bool type
    591f5af5d664 selftests/bpf: Fix error compiling test_lru_map.c
    8c7d216d4209 selftests/bpf: Fix arg parsing in veristat, test_progs
    ec9a805d01be libbpf: Don't take direct pointers into BTF data from st_ops
    0b0a37b18c64 selftests/bpf: Fix errors compiling cg_storage_multi.h with musl libc
    6c94b4bf7968 selftests/bpf: Fix errors compiling crypto_sanity.c with musl libc
    f1c66b7f13af selftests/bpf: Fix errors compiling decap_sanity.c with musl libc
    8e5b8bf023c7 selftests/bpf: Fix errors compiling lwt_redirect.c with musl libc
    4541fa0ebb6b selftests/bpf: Fix compiling core_reloc.c with musl-libc
    6c6e36ca1ad2 selftests/bpf: Fix compiling tcp_rtt.c with musl-libc
    b2583ed6fde0 selftests/bpf: Fix compiling flow_dissector.c with musl-libc
    c1716c2c8b77 selftests/bpf: Fix compiling kfree_skb.c with musl-libc
    371a0c22b81a selftests/bpf: Fix compiling parse_tcp_hdr_opt.c with musl-libc
    d5acd55bd258 selftests/bpf: Fix include of <sys/fcntl.h>
    396524540716 selftests/bpf: Fix missing BUILD_BUG_ON() declaration
    236f6aa1f1f7 selftests/bpf: Fix missing UINT_MAX definitions in benchmarks
    c5153c44af75 selftests/bpf: Fix missing ARRAY_SIZE() definition in bench.c
    76c0946c89d4 selftests/bpf: Drop unneeded error.h includes
    e6a574a4f9cc selftests/bpf: Fix error compiling bpf_iter_setsockopt.c with musl libc
    7a7030041948 selftests/bpf: Fix compile error from rlim_t in sk_storage_map.c
    9f2c500e4b3e selftests/bpf: Use pid_t consistently in test_progs.c
    f1620c93a1ec bpf: Fail verification for sign-extension of packet data/data_end/data_meta
    25ca515ab4ae tools/runqslower: Fix LDFLAGS and add LDLIBS support
    10c4a99ad7f5 selftests/bpf: Fix wrong binary in Makefile log output
    0054caa96389 selftests/bpf: Fix error linking uprobe_multi on mips
    dd7cf3b64eba selftests/bpf: Workaround strict bpf_lsm return value check.
    9d245b5ad81e bpf: Fix compare error in function retval_range_within
    1050727d83e7 bpf, lsm: Add check for BPF LSM return value
    e36f640f2955 bpf, arm64: Fix tailcall hierarchy
    1b7fd7f2a2d8 bpf, x64: Fix tailcall hierarchy
    80b23691b2c3 sched/fair: Make SCHED_IDLE entity be preempted in strict hierarchy
    adf4ce162561 tpm: Clean up TPM space after command failure
    86bc7bfca5ce xen/swiotlb: fix allocated size
    27475b169a70 xen/swiotlb: add alignment check for dma buffers
    e4522f88cffd xen: tolerate ACPI NVS memory overlapping with Xen allocated memory
    bd089573cf87 xen: add capability to remap non-RAM pages to different PFNs
    82729ec25602 xen: move max_pfn in xen_memory_setup() out of function scope
    dcedf22ce719 xen: introduce generic helper checking for memory map conflicts
    39ff27a4fbb1 minmax: avoid overly complex min()/max() macro arguments in xen
    a5f3cb4fead2 ata: libata: Clear DID_TIME_OUT for ATA PT commands with sense data
    4dc50d098af8 HID: wacom: Do not warn about dropped packets for first packet
    b2824da7639b HID: wacom: Support sequence numbers smaller than 16-bit
    aee96b588070 xen: use correct end address of kernel for conflict checking
    fe706fab95cc drm/amdgpu: fix invalid fence handling in amdgpu_vm_tlb_flush
    98d002ac83d5 drivers:drm:exynos_drm_gsc:Fix wrong assignment in gsc_bind()
    b236e6b2477d kselftest: dt: Ignore nodes that have ancestors disabled
    1b7bb08ee19f platform/x86: ideapad-laptop: Make the scope_guard() clear of its scope
    97cfd8d67eb9 drm/msm: fix %s null argument error
    9a2709b57c5f drm/msm/dsi: correct programming sequence for SM8350 / SM8450
    36bf369fbdba drm/msm/dp: enable widebus on all relevant chipsets
    ccae3661969a ipmi: docs: don't advertise deprecated sysfs entries
    f9ed201cf081 drm/msm/a5xx: workaround early ring-buffer emptiness check
    efb2bffb5a21 drm/msm/a5xx: fix races in preemption evaluation stage
    74e25dd4d3dc drm/msm/a5xx: properly clear preemption records on resume
    fddadef45656 drm/msm/a5xx: disable preemption in submits by default
    3b7e5c1eb5bd drm/msm: Fix incorrect file name output in adreno_request_fw()
    eed32df5009f drm/msm: Fix CP_BV_DRAW_STATE_ADDR name
    79cc4b6f36f1 drm/msm: Dump correct dbgahb clusters on a750
    76b9d4823b6a drm/msm: Use a7xx family directly in gpu_state
    b001d0e023e1 powerpc/vdso: Inconditionally use CFUNC macro
    8135b983b8cb powerpc/8xx: Fix kernel vs user address comparison
    a386b732d529 powerpc/8xx: Fix initial memory mapping
    96bdf304f2f7 drm/mediatek: Use spin_lock_irqsave() for CRTC event lock
    4d7a703d8fc3 drm/mediatek: Fix missing configuration flags in mtk_crtc_ddp_config()
    128d5cfdcf84 jfs: fix out-of-bounds in dbNextAG() and diAlloc()
    7c2908985e4a scsi: elx: libefc: Fix potential use after free in efc_nport_vport_del()
    5da620c86545 drm/vc4: hdmi: Handle error case of pm_runtime_resume_and_get
    b944cad02f2c drm/bridge: lontium-lt8912b: Validate mode in drm_bridge_funcs::mode_valid()
    d98a4c149e44 drm/radeon/evergreen_cs: fix int overflow errors in cs track offsets
    e9703b758059 drm/rockchip: dw_hdmi: Fix reading EDID when using a forced mode
    6c0601ac83c0 drm/rockchip: vop: Allow 4096px width scaling
    b423b9fc0fe9 drm/amd/amdgpu: Properly tune the size of struct
    f2c6a3174c62 scsi: NCR5380: Check for phase match during PDMA fixup
    8fd157fb9fa6 scsi: smartpqi: revert propagate-the-multipath-failure-to-SML-quickly
    5dca6bec1284 drm/radeon: properly handle vbios fake edid sizing
    7c5a3318ca35 drm/amdgpu: properly handle vbios fake edid sizing
    84edd5a3f5fa drm/amd/display: Add null check for set_output_gamma in dcn30_set_output_transfer_func
    06783d9e5791 drm/stm: ltdc: check memory returned by devm_kzalloc()
    f89e5f17662e drm/stm: Fix an error handling path in stm_drm_platform_probe()
    33c9b9978798 pmdomain: core: Harden inter-column space in debug summary
    540757d9245b iommu/arm-smmu-qcom: apply num_context_bank fixes for SDM630 / SDM660
    977a5a3db7a2 iommu/arm-smmu-qcom: Work around SDM845 Adreno SMMU w/ 16K pages
    9e4d7aa135b0 iommu/arm-smmu-qcom: hide last LPASS SMMU context bank from linux
    8d4b468a1741 mtd: rawnand: mtk: Fix init error path
    92603bf6b74e mtd: rawnand: mtk: Factorize out the logic cleaning mtk chips
    7c65bda0d7a6 mtd: rawnand: mtk: Use for_each_child_of_node_scoped()
    bbeaae6f79b2 rcu/nocb: Fix RT throttling hrtimer armed from offline CPU
    b51f8d7dd7af mtd: powernv: Add check devm_kasprintf() returned value
    61759ce298de iommu/amd: Do not set the D bit on AMD v2 table entries
    c4cdd0948126 iommu/amd: Set the pgsize_bitmap correctly
    8cab33c1b290 iommu/amd: Move allocation of the top table into v1_alloc_pgtable
    47b4cfe377f2 iommu/amd: Convert comma to semicolon
    40fe49ce6ad1 iommu/amd: Allocate the page table root using GFP_KERNEL
    747ff04ec850 iommu/amd: Handle error path in amd_iommu_probe_device()
    ea6af3b72af4 fbdev: hpfb: Fix an error handling path in hpfb_dio_probe()
    eb501d4a77e3 power: supply: max17042_battery: Fix SOC threshold calc w/ no current sense
    a8f13a983d79 power: supply: axp20x_battery: Remove design from min and max voltage
    f59516476915 hwmon: (ntc_thermistor) fix module autoloading
    726f63f71c13 mtd: slram: insert break after errors in parsing the map
    61f245910b44 hwmon: (max16065) Fix alarm attributes
    e3afe2425aa1 hwmon: (max16065) Remove use of i2c_match_id()
    16aba660a353 hwmon: (max16065) Fix overflows seen when writing limits
    25f435e9982f selftests:resctrl: Fix build failure on archs without __cpuid_count()
    9dfa29e81b11 selftests/ftrace: Fix eventfs ownership testcase to find mount point
    4cfa0c86dff8 ASoC: loongson: fix error release
    74dbe32f00c8 m68k: Fix kernel_clone_args.flags in m68k_clone()
    4b3ae12d46d7 x86/boot/64: Strip percpu address space when setting up GDT descriptors
    3d3af6aa7665 selftests/ftrace: Fix test to handle both old and new kernels
    a11a6c50d1bf ALSA: hda: cs35l41: fix module autoloading
    42763f6c1ef7 selftests/ftrace: Add required dependency for kprobe tests
    482423cbb547 ASoC: tas2781-i2c: Get the right GPIO line
    44f069577c8b ASoC: tas2781-i2c: Drop weird GPIO code
    709b56aed8f0 ASoC: tas2781: Use of_property_read_reg()
    4ff359f252b6 ASoC: rt5682s: Return devm_of_clk_add_hw_provider to transfer the error
    5d412d562035 x86/mm: Use IPIs to synchronize LAM enablement
    05ede22ac55d arm64: dts: mediatek: mt8195: Correct clock order for dp_intf*
    59c236c6aa28 clocksource/drivers/qcom: Add missing iounmap() on errors in msm_dt_timer_init()
    3331a38ded84 reset: k210: fix OF node leak in probe() error path
    a2a361fc2e00 reset: berlin: fix OF node leak in probe() error path
    8cd2af39e0b9 ARM: versatile: fix OF node leak in CPUs prepare
    67ce8aceb68c arm64: dts: ti: k3-am654-idk: Fix dtbs_check warning in ICSSG dmas
    0c4ec54cfbb0 ARM: dts: imx7d-zii-rmu2: fix Ethernet PHY pinctrl property
    5c17974691df ARM: dts: microchip: sama7g5: Fix RTT clock
    aad4c8273529 arm64: dts: qcom: x1e80100: Fix PHY for DP2
    1d138a636b05 spi: bcmbca-hsspi: Fix missing pm_runtime_disable()
    a927d0eb3dac arm64: dts: ti: k3-j721e-beagleboneai64: Fix reversed C6x carveout locations
    343f86970eed arm64: dts: ti: k3-j721e-sk: Fix reversed C6x carveout locations
    350bb951f2d9 arm64: dts: rockchip: Correct vendor prefix for Hardkernel ODROID-M1
    a1cf480271f1 arm64: tegra: Correct location of power-sensors for IGX Orin
    eff2483ce93e ARM: dts: microchip: sam9x60: Fix rtc/rtt clocks
    d2fa44c83f76 arm64: dts: renesas: r9a07g044: Correct GICD and GICR sizes
    7dae92742a8e arm64: dts: renesas: r9a07g054: Correct GICD and GICR sizes
    ba033bbae9df arm64: dts: renesas: r9a07g043u: Correct GICD and GICR sizes
    f74020ed2de1 arm64: dts: renesas: r9a08g045: Correct GICD and GICR sizes
    92bdd6215a63 regulator: Return actual error in of_regulator_bulk_get_all()
    b1878b6839a8 firmware: qcom: scm: Disable SDI and write no dump to dump mode
    193246cb019a spi: ppc4xx: Avoid returning 0 when failed to parse and map IRQ
    dc9543a4f2a5 firmware: arm_scmi: Fix double free in OPTEE transport
    072f2e1457be arm64: dts: mediatek: mt8186: Fix supported-hw mask for GPU OPPs
    1df9c2eea6fe arm64: dts: exynos: exynos7885-jackpotlte: Correct RAM amount to 4GB
    1aa426194346 spi: ppc4xx: handle irq_of_parse_and_map() errors
    652039ba477c block: fix potential invalid pointer dereference in blk_add_partition
    8f28dd5c4303 io_uring/io-wq: inherit cpuset of cgroup in io worker
    dfe4ece44302 io_uring/io-wq: do not allow pinning outside of cpuset
    e148ae7b0869 block, bfq: fix procress reference leakage for bfqq in merge chain
    0b8bda0ff171 block, bfq: fix uaf for accessing waker_bfqq after splitting
    b9b30af0e86f erofs: handle overlapped pclusters out of crafted images properly
    eeb8e49ece73 erofs: tidy up `struct z_erofs_bvec`
    45a3d11ffd2b erofs: fix incorrect symlink detection in fast symlink
    c63df9845c4a nbd: correct the maximum value for discard sectors
    b54a3a8c0408 cachefiles: Fix non-taking of sb_writers around set/removexattr
    13b3d0e8cb12 block, bfq: don't break merge chain in bfq_split_bfqq()
    d5fe5d253596 block, bfq: choose the last bfqq from merge chain in bfq_setup_cooperator()
    880692ee233b block, bfq: fix possible UAF for bfqq->bic with merge chain
    5236ada8ebbd nbd: fix race between timeout and normal completion
    d35a31ee2064 ublk: move zone report data out of request pdu
    9a0ddc73be37 ipv6: avoid possible NULL deref in rt6_uncached_list_flush_dev()
    b896bab4366a net: tipc: avoid possible garbage value
    d2dd99827dfd net: ipv6: rpl_iptunnel: Fix memory leak in rpl_input
    796d5d3b2779 r8169: disable ALDPS per default for RTL8125
    a42e9bac3432 xsk: fix batch alloc API on non-coherent systems
    fd69e1059822 crypto: n2 - Set err to EINVAL if snprintf fails for hmac
    40a27ef184ac net: enetc: Use IRQF_NO_AUTOEN flag in request_irq()
    a6346d74c75a bareudp: Pull inner IP header on xmit.
    e62be538eaff bareudp: Pull inner IP header in bareudp_udp_encap_recv().
    efeabcb8b846 Bluetooth: btusb: Fix not handling ZPL/short-transfer
    cf49c3096b41 can: m_can: m_can_close(): stop clocks after device has been shut down
    90557e799c0e can: m_can: enable NAPI before enabling interrupts
    770b46326442 can: bcm: Clear bo->bcm_proc_read after remove_proc_entry().
    e66ed8bef78b net: hsr: Use the seqnr lock for frames received via interlink port.
    ae8c1b3e7353 sock_map: Add a cond_resched() in sock_hash_free()
    6a1e4853dc6b Bluetooth: hci_sync: Ignore errors from HCI_OP_REMOTE_NAME_REQ_CANCEL
    a5897cb8e868 Bluetooth: hci_core: Fix sending MGMT_EV_CONNECT_FAILED
    2f944e6255c2 wifi: wilc1000: fix potential RCU dereference issue in wilc_parse_join_bss_param
    eab272972cff wifi: mac80211: use two-phase skb reclamation in ieee80211_do_stop()
    3d5ba51b53fe wifi: cfg80211: fix two more possible UBSAN-detected off-by-one errors
    057ff7597e77 wifi: mt76: mt7996: fix uninitialized TLV data
    f35c96dbed5d wifi: mt76: mt7915: fix rx filter setting for bfee functionality
    cddfd18683bb wifi: cfg80211: fix UBSAN noise in cfg80211_wext_siwscan()
    83dbde9f0753 wifi: mt76: mt7603: fix mixed declarations and code
    2819d588157e wifi: mt76: connac: fix checksum offload fields of connac3 RXD
    aa4e17e36824 wifi: mt76: mt7996: fix handling mbss enable/disable
    f8024f12752e crypto: hisilicon/qm - inject error before stopping queue
    7c5f21d18b63 crypto: hisilicon/qm - reset device before enabling it
    285be321cf07 crypto: hisilicon/hpre - mask cluster timeout error
    b1e093671a71 crypto: ccp - do not request interrupt on cmd completion when irqs disabled
    d3a1f2d375bd pm:cpupower: Add missing powercap_set_enabled() stub function
    0f89fb4042c0 x86/sgx: Fix deadlock in SGX NUMA node search
    3eaadfaf1b05 wifi: mt76: mt7996: fix EHT beamforming capability check
    6ff98d6ee26d wifi: mt76: mt7996: fix HE and EHT beamforming capabilities
    5c1a21ade621 wifi: mt76: mt7996: fix wmm set of station interface to 3
    e4396d6995be wifi: mt76: mt7996: fix traffic delay when switching back to working channel
    8f51fc8a9e2f wifi: mt76: mt7996: use hweight16 to get correct tx antenna
    62385f7bf445 wifi: mt76: mt7921: fix wrong UNII-4 freq range check for the channel usage
    7c128f3ff0be wifi: mt76: mt7915: fix oops on non-dbdc mt7986
    43ebb3039527 thermal: gov_bang_bang: Adjust states of all uninitialized instances
    9d06c6b2aee7 cpufreq: ti-cpufreq: Introduce quirks to handle syscon fails appropriately
    83f51a77ce77 perf/arm-cmn: Ensure dtm_idx is big enough
    8fd3f1053970 perf/arm-cmn: Fix CCLA register offset
    f4c85bdd95e2 perf/arm-cmn: Refactor node ID handling. Again.
    41f9666a779f netfilter: nft_dynset: annotate data-races around set timeout
    40d08076c68e netfilter: nf_tables: remove annotation to access set timeout while holding lock
    84fd57fc09aa netfilter: nf_tables: reject expiration higher than timeout
    79d7f9a68bdf netfilter: nf_tables: reject element expiration with no timeout
    d7d6c0f939a4 netfilter: nf_tables: elements with timeout below CONFIG_HZ never expire
    82cee12ada68 ACPI: CPPC: Fix MASK_VAL() usage
    2ee32a3df7ba can: j1939: use correct function name in comment
    22df2f4cbd8e kselftest/arm64: Actually test SME vector length changes via sigreturn
    0f5ac508b18e drivers/perf: hisi_pcie: Fix TLP headers bandwidth counting
    4b5eddeac193 drivers/perf: hisi_pcie: Record hardware counts correctly
    72cc4e19fa8f padata: Honor the caller's alignment in case of chunk_size 0
    1f100e761f00 ACPICA: executer/exsystem: Don't nag user about every Stall() violating the spec
    d7ccc2663dbe ACPICA: Implement ACPI_WARNING_ONCE and ACPI_ERROR_ONCE
    67b538927f37 wifi: mac80211: Check for missing VHT elements only for 5 GHz
    602c36e8f8a6 wifi: iwlwifi: mvm: allow ESR when we the ROC expires
    2ee6f22a59c3 wifi: mac80211: fix the comeback long retry times
    6e7a928ec322 wifi: cfg80211: fix bug of mapping AF3x to incorrect User Priority
    7c975e4b442f wifi: iwlwifi: mvm: increase the time between ranging measurements
    d89781f68df7 wifi: iwlwifi: config: label 'gl' devices as discrete
    c3e60e5cbac1 wifi: iwlwifi: remove AX101, AX201 and AX203 support from LNL
    3565ef215101 wifi: mac80211: don't use rate mask for offchannel TX either
    2bee86e57407 ACPI: video: force native for Apple MacbookPro9,2
    84fee7bbbeda ACPI: video: force native for some T2 macbooks
    3759825b8cd3 crypto: qat - fix "Full Going True" macro definition
    b14bb4d77408 perf/dwc_pcie: Always register for PCIe bus notifier
    0a0b62259371 perf/dwc_pcie: Fix registration issue in multi PCIe controller instances
    062b7176e484 drivers/perf: Fix ali_drw_pmu driver interrupt status clearing
    c589d8c850f9 thermal: core: Fix rounding of delay jiffies
    6d4fd536708d thermal: core: Fold two functions into their respective callers
    e037604ca718 arm64: smp: smp_send_stop() and crash_smp_send_stop() should try non-NMI first
    f8d9902bc940 kselftest/arm64: signal: fix/refactor SVE vector length enumeration
    851e7f7f14a1 powercap: intel_rapl: Fix off by one in get_rpi()
    cd595d87e5fd ARM: 9410/1: vfp: Use asm volatile in fmrx/fmxr macros
    18d5c2f5bfdf autofs: fix missing fput for FSCONFIG_SET_FD
    5fcf9e0ae069 mount: handle OOM on mnt_warn_timestamp_expiry
    efc979234582 RISC-V: KVM: Fix to allow hpmcounter31 from the guest
    659cd6013527 RISC-V: KVM: Allow legacy PMU access from guest
    81aa95fd5bd1 RISC-V: KVM: Don't zero-out PMU snapshot area before freeing data
    d2b1dd777237 RISC-V: KVM: Fix sbiret init before forwarding to userspace
    4ab6b9c2e8e2 wifi: rtw88: remove CPT execution branch never used
    10463308b945 wifi: rtw89: remove unused C2H event ID RTW89_MAC_C2H_FUNC_READ_WOW_CAM to prevent out-of-bounds reading
    6d2110b4dbb4 arm64: signal: Fix some under-bracketed UAPI macros
    e3ea60496345 net: stmmac: dwmac-loongson: Init ref and PTP clocks rate
    c90e4a08a95a wifi: ath12k: fix invalid AMPDU factor calculation in ath12k_peer_assoc_h_he()
    ffc7069dbd93 wifi: ath12k: match WMI BSS chan info structure with firmware definition
    bbc6d4c5553b wifi: ath12k: fix BSS chan info request WMI command
    a584f1aded79 wifi: ath9k: Remove error checks when creating debugfs entries
    2404db8b39ac wifi: brcmfmac: introducing fwil query functions
    771e66f74285 ACPI: PMIC: Remove unneeded check in tps68470_pmic_opregion_probe()
    b5d534b473e2 crypto: iaa - Fix potential use after free bug
    3926cabcf335 crypto: qat - ensure correct order in VF restarting handler
    f39df661e9f6 crypto: qat - fix recovery flow for VFs
    ea4d47ffd39d crypto: qat - disable IOV in adf_dev_stop()
    df0086689c66 crypto: xor - fix template benchmarking
    9432185540ba wifi: rtw88: always wait for both firmware loading attempts
    7e8c4c7cbaed EDAC/synopsys: Fix error injection on Zynq UltraScale+
    dbd51da69dda wifi: ath11k: use work queue to process beacon tx event
    c4386c5293aa drivers: gpu: drm: msm: registers: improve reproducibility
    915a386c7cff qemux86: add configuration symbol to select values
    62df91b21626 sched/isolation: really align nohz_full with rcu_nocbs
    afe643f5802b clear_warn_once: add a clear_warn_once= boot parameter
    7b016793edbf clear_warn_once: bind a timer to written reset value
    89a5c70f2000 clear_warn_once: expand debugfs to include read support
    8014704c527d tools: Remove some options from CLANG_CROSS_FLAGS
    e9ca44556936 libbpf: Fix build warning on ref_ctr_off
    32fe8c972c36 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    a372ac2b798d perf: x86-32: explicitly include <errno.h>
    a5cb41682777 perf: mips64: Convert __u64 to unsigned long long
    ed8ee9f3d1ae perf: fix bench numa compilation
    6dbb2915e8a7 perf: add SLANG_INC for slang.h
    57f78dddfd93 perf: add sgidefs.h to for mips builds
    130f0306cfba perf: change --root to --prefix for python install
    2520efe95341 perf: add 'libperl not found' warning
    45731b6ae676 perf: force include of <stdbool.h>
    ace10f8dec53 fat: Replace prandom_u32() with get_random_u32()
    64797bdca14e fat: don't use obsolete random32 call in namei_vfat
    2442bae1a645 FAT: Added FAT_NO_83NAME
    7561126bce00 FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    5c51ab959876 FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    5869720658c9 aufs6: match exports to functions
    e125467cf228 aufs: adjust for v6.9+
    eebcdc6635bf aufs6: correct do_splice_from prototype
    4c5829036c45 aufs: update remove_page to remove_folio
    e8d889d0f434 aufs: i_op: Add handling for au_pin_hdir_set_owner with RT kernel
    3ecd9203de17 aufs: fix v6.7 kernel build compilation
    5e8ee028dbe2 aufs6: adapt to v6.6 i_op->ctime changes
    1132c330feed aufs6: adapt to v6.6
    d3e4ede69603 aufs6: core
    49ec9271f41d aufs6: standalone
    dcc0978da2dd aufs6: mmap
    80e1609b37e7 aufs6: base
    0dbb3f062420 aufs6: kbuild
    ad51078c5ebf yaffs: fix mtime/itime field access
    e5f1d35d6188 yaffs2: update VFS ctime operations to 6.6+
    dd374461adc7 yaffs2: v6.5 fixups
    f5908785d88d yaffs2: Fix miscalculation of devname buffer length
    d1403f0acfdf yaffs2: convert user_namespace to mnt_idmap
    7dae5463b54f yaffs2: replace bdevname call with sprintf
    92d30df4eb56 yaffs2: convert read_page -> readfolio
    6c895bffdf72 yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    6801e7d90255 yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    aff012190046 yaffs2: v5.12+ build fixups (not runtime tested)
    fb474842c16e yaffs: include blkdev.h
    fe7d745aac94 yaffs: fix misplaced variable declaration
    bee147b2e533 yaffs2: v5.6 build fixups
    22998f589ec2 yaffs2: fix memory leak when /proc/yaffs is read
    ce7d8084a976 yaffs: add strict check when call yaffs_internal_read_super
    adb7202fda95 yaffs: repair yaffs_get_mtd_device
    2852e5c15d4d yaffs: Fix build failure by handling inode i_version with proper atomic API
    1526802a8147 yaffs2: fix memory leak in mount/umount
    6c7827a16aaa yaffs: Avoid setting any ACL releated xattr
    fa3482815542 Yaffs:check oob size before auto selecting Yaffs1
    aaa4843b73ce fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    48e992af6531 yaffs2: adjust to proper location of MS_RDONLY
    f3af7160d8a0 yaffs2: import git revision b4ce1bb (jan, 2020)
    4add698ed6e8 initramfs: allow an optional wrapper script around initramfs generation
    b619a8d54336 vt/conmakehash: improve reproducibility
    c786186aeef3 tools: use basename to identify file in gen-mach-types
    aa3a8e7ceb6e iwlwifi: select MAC80211_LEDS conditionally
    325db54c4be9 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    23a87c6e13aa defconfigs: drop obselete options
    946e5b78ab94 linux-yocto: Handle /bin/awk issues
    9daee1dba585 uvesafb: provide option to specify timeout for task completion
    f68b8683441a uvesafb: print error message when task timeout occurs
    a1595c6b6017 compiler.h: Undef before redefining __attribute_const__
    8086839613c6 vmware: include jiffies.h
    32e79eb3c169 Resolve jiffies wrapping about arp
    f6fabf91b6f2 nfs: Allow default io size to be configured.
    ad2b29f801e9 check console device file on fs when booting
    5194785d545b mount_root: clarify error messages for when no rootfs found
    78b3498cb59a mconf: fix output of cflags and libraries
    9cc6870708d5 menuconfig,mconf-cfg: Allow specification of ncurses location
    f34088ed9c93 modpost: mask trivial warnings
    4784584582f5 kbuild: exclude meta directory from distclean processing
    73072b5fe25a powerpc: serialize image targets
    a120eb200320 arm: serialize build targets
    51d5719ac05b mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    5155f0bb36f0 cpu/amd: inhibit SMP check for qemux86
    e5a5996ee586 x86_64_defconfig: Fix warnings
    1359db75df0c mips: make current_cpu_data preempt safe
    385edf6090c3 mips: vdso: fix 'jalr $t9' crash in vdso code
    968266397319 mips: Kconfig: add QEMUMIPS64 option
    389ce854fde3 4kc cache tlb hazard: tlbp cache coherency
    9cab61199fa8 malta uhci quirks: make allowance for slow 4k(e)c
    80cae3bd9eea arm64: defconfig: remove CONFIG_IPQ_APSS_5018
    41c82709900f drm/fb-helper: move zeroing code to drm_fb_helper_fill_var
    59ef4f151a5e arm64: defconfig: cleanup config options
    c5fb425762ed vexpress: Pass LOADADDR to Makefile
    07a8b544d4e9 arm: ARM EABI socketcall
    574f3ae3d2ca ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2972338da9563e64d8953921efcedea361b2b4ec)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.10.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.10.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.10.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
index b3ea1eede4..3a26cff924 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "79753a918e36522e7b3ac3ef9cff14dd24eda41c"
-SRCREV_meta ?= "f176a9a323c68085e71f32718dc763d263f95fda"
+SRCREV_machine ?= "fd5cf8bfe549fa46fdcece138885a52ab4d9d729"
+SRCREV_meta ?= "699cd9b4a63953c9334f635d7c19add5d0957b93"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.10;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.10.12"
+LINUX_VERSION ?= "6.10.13"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
index 8e68ace57c..c493d1d914 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.10.inc
 
-LINUX_VERSION ?= "6.10.12"
+LINUX_VERSION ?= "6.10.13"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "83377716b0580c5594beca4ce565eadbaa94a520"
-SRCREV_meta ?= "f176a9a323c68085e71f32718dc763d263f95fda"
+SRCREV_machine ?= "ef209b71b02e80280883cd74bcdecec0a52de608"
+SRCREV_meta ?= "699cd9b4a63953c9334f635d7c19add5d0957b93"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.10.bb b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
index 778581fbf1..5c8a51ca5c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.10/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.10/standard/base"
 KBRANCH:qemumips64 ?= "v6.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "b925ba006ed8d0543abde1e717601f20be5b4567"
-SRCREV_machine:qemuarm64 ?= "83377716b0580c5594beca4ce565eadbaa94a520"
-SRCREV_machine:qemuloongarch64 ?= "83377716b0580c5594beca4ce565eadbaa94a520"
-SRCREV_machine:qemumips ?= "f6d050ce5a873b8cb1c468f6f7acde929ea687fb"
-SRCREV_machine:qemuppc ?= "83377716b0580c5594beca4ce565eadbaa94a520"
-SRCREV_machine:qemuriscv64 ?= "83377716b0580c5594beca4ce565eadbaa94a520"
-SRCREV_machine:qemuriscv32 ?= "83377716b0580c5594beca4ce565eadbaa94a520"
-SRCREV_machine:qemux86 ?= "83377716b0580c5594beca4ce565eadbaa94a520"
-SRCREV_machine:qemux86-64 ?= "83377716b0580c5594beca4ce565eadbaa94a520"
-SRCREV_machine:qemumips64 ?= "6486530bf0ee464def6a814db6a4b140847c60e1"
-SRCREV_machine ?= "83377716b0580c5594beca4ce565eadbaa94a520"
-SRCREV_meta ?= "f176a9a323c68085e71f32718dc763d263f95fda"
+SRCREV_machine:qemuarm ?= "2b4b41e2f9c5569729e1686449c68fa12eb4d270"
+SRCREV_machine:qemuarm64 ?= "ef209b71b02e80280883cd74bcdecec0a52de608"
+SRCREV_machine:qemuloongarch64 ?= "ef209b71b02e80280883cd74bcdecec0a52de608"
+SRCREV_machine:qemumips ?= "a659b440ff6f9325136c3ebce78f2507ace768b0"
+SRCREV_machine:qemuppc ?= "ef209b71b02e80280883cd74bcdecec0a52de608"
+SRCREV_machine:qemuriscv64 ?= "ef209b71b02e80280883cd74bcdecec0a52de608"
+SRCREV_machine:qemuriscv32 ?= "ef209b71b02e80280883cd74bcdecec0a52de608"
+SRCREV_machine:qemux86 ?= "ef209b71b02e80280883cd74bcdecec0a52de608"
+SRCREV_machine:qemux86-64 ?= "ef209b71b02e80280883cd74bcdecec0a52de608"
+SRCREV_machine:qemumips64 ?= "dbf6eab8fb21784a4e8010a5b7045681e2bb06de"
+SRCREV_machine ?= "ef209b71b02e80280883cd74bcdecec0a52de608"
+SRCREV_meta ?= "699cd9b4a63953c9334f635d7c19add5d0957b93"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "e0081d1e9c57b0ee4039158a3939317c5085bfe7"
+SRCREV_machine:class-devupstream ?= "0202c63cba31e9b3d59b8204db3cda3cdd209f15"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.10/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.10;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.10.12"
+LINUX_VERSION ?= "6.10.13"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


