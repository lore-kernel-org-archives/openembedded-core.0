Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E1AC3ABB2
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 19:41:41 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web10.4451.1748461295632436670
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 12:41:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ap6If8SZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-735ae79a44bso49144a34.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 12:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748461295; x=1749066095; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fP5ulzTRCR5IP8fd+BRId63RTxcKaqr5aRaqrbWuXrA=;
        b=ap6If8SZsqA4KhJpuJNZWw2c4h8rGc3t7Rw1YFSyp5PWUvg5d+o2Kz6dPeppJ23QVr
         95lmSXd39325mMgKGPsSrLbSNrDebDEnhMkoqjKjLWDeQDeIV0PW8VNs2WPOP6EOwVH1
         fN8FbOgDjUpRP557+dGdZ70NNurA0B9SL3oIYk9Oyhf/3PNsctrkhw+ejBNr51D5o0/0
         TxPRIOZITLF3//BFTcfe/RVQHUvvCljolMKFGW+8gw6QKPla1TNrj8REIegJJXA12fYk
         MWiWbcham83wmZnFsQkwLpSHIbjAjs+LR/dB6tJjOAjqWzfzAJGPg5O22S4BeGP77bfx
         DOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748461295; x=1749066095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fP5ulzTRCR5IP8fd+BRId63RTxcKaqr5aRaqrbWuXrA=;
        b=RoeXXfqqeLN13ru0RZSCM7HCmO10oNUgwv3ujC+ARp/i17rap0/LnMGkvpClrSpPgz
         qBAfxLtP2dPtoIfZykHbpwbHNUWWKg5b1w065Ef4nbbrYrMId0vH6KDn0oqfp06YK8rl
         quzo6jxbUNyPbxbUK8OiFSolfMYN6gyPYnmCk64QfVmMPWwkFDWPizjZX/RZEYqDBREb
         DvLqV5X8lUGYgeGPQKLUm7GUaFqGPT3JFF0IX3cDvy3Kzv9oZ4w46Sdv1FjIPiTfh2Qc
         5cIbGCln3S722i382VcVvMOZQLkpND/ZzridrDrA5dTLlyBP4/wWEPMnM12IxtRi+xxI
         xZnA==
X-Gm-Message-State: AOJu0Yy+ocTxOrOKRKBuBhpYqJ6g8jnsj9q7mB/aAlVi9CshMPKosWaD
	vmhzKG9jC1gJ90nbrGEKn7ns5jcs3T2OO2p3nMBUUItRkqUgC9bHM2R5dZ74VdCb
X-Gm-Gg: ASbGncuTCUSQQwFNqCxXrk2iXBIg/w2SpSj6RhPDjS6SrwtD8YdaO3b/TZ3jWYblWcN
	7brWyr2ejCLXkIMKCdhyBCR+1z0innRCUKsHnlEjA0CPMjCSv6wpCo++cHSYHhlw3JF35OwfDid
	8v5fAaHsC6HyHs2TAtO9mlUzZzgp5oed0GSOTqfwdbUlEpA3hb5OUIWqnF+v1iw9oeX5PBrl4gs
	zKVrUe6Hk/868mxyak64LMifQtRgdLz23KLMYw4Jk0MuuXqGFWryg3cnQ9iE7v5p4QA/qYQkgKs
	EGcPGNc6mCsyGpMpZTIrTLVb0Muem/JqfPB4N33nh6F1m3bv67WUUom86lZVKw7lXfnOMpm7hds
	rcodeRUD9b2cNNc/klvBHop2/TqFatf5aQtgSACniq5j23xqT34V7
X-Google-Smtp-Source: AGHT+IGw6USjMdlZnBkxjKzFcB+uZt/ZLn+8IAeioa8texreF6XrAySzA6CJJnY/eRdjHCFAN9S9dw==
X-Received: by 2002:a05:622a:424e:b0:4a3:fcc7:c733 with SMTP id d75a77b69052e-4a3fcc7c966mr43380211cf.8.1748461284039;
        Wed, 28 May 2025 12:41:24 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a3c80f323bsm9577691cf.72.2025.05.28.12.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:41:23 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 4/6] linux-yocto/6.6: update to v6.6.89
Date: Wed, 28 May 2025 15:41:16 -0400
Message-Id: <20250528194118.1534655-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250528194118.1534655-1-bruce.ashfield@gmail.com>
References: <20250528194118.1534655-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 19:41:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217394

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    71e4ec9b2abc Linux 6.6.89
    20bab4eb1c7c objtool: Silence more KCOV warnings, part 2
    014a761be083 objtool: Ignore end-of-section jumps for KCOV/GCOV
    26084aa1a143 nvme: fixup scan failure for non-ANA multipath controllers
    17d41d0f3a26 MIPS: cm: Fix warning if MIPS_CM is disabled
    eee19a803731 net: dsa: mv88e6xxx: enable STU methods for 6320 family
    cd17c8638d21 net: dsa: mv88e6xxx: enable .port_set_policy() for 6320 family
    13685484072a net: dsa: mv88e6xxx: enable PVT for 6321 switch
    bfbd730e100b net: dsa: mv88e6xxx: fix atu_move_port_mask for 6341 family
    551667f99bcf ext4: goto right label 'out_mmap_sem' in ext4_setattr()
    ffe79cc6c71d comedi: jr3_pci: Fix synchronous deletion of timer
    c4312c4d244a vmxnet3: Fix malformed packet sizing in vmxnet3_process_xdp
    abe56be73eb1 driver core: fix potential NULL pointer dereference in dev_uevent()
    a55111066205 driver core: introduce device_set_driver() helper
    d29c2d53357f Revert "drivers: core: synchronize really_probe() and dev_uevent()"
    0fd13033d4e7 x86/pvh: Call C code via the kernel virtual mapping
    2b4479eb462e spi: spi-imx: Add check for spi_imx_setupxfer()
    459098685edf md/raid1: Add check for missing source disk in process_checks()
    41866aa93d2e x86/cpu: Add CPU model number for Bartlett Lake CPUs with Raptor Cove cores
    aa0cf04b6959 ubsan: Fix panic from test_ubsan_out_of_bounds
    96ae4c19ed71 spi: tegra210-quad: add rate limiting and simplify timeout error message
    0134e326abc3 spi: tegra210-quad: use WARN_ON_ONCE instead of WARN_ON for timeouts
    6c2e136ffd05 loop: aio inherit the ioprio of original request
    f0209397ed2c riscv: Provide all alternative macros all the time
    ce7e04d26a35 iomap: skip unnecessary ifs_block_is_uptodate check
    bb7878cca969 x86/i8253: Call clockevent_i8253_disable() with interrupts disabled
    a862d24e1fc3 scsi: pm80xx: Set phy_attached to zero when device is gone
    4cdb02e9f963 scsi: ufs: exynos: Ensure pre_link() executes before exynos_ufs_phy_init()
    fa99f1886e0a scsi: hisi_sas: Fix I/O errors caused by hardware port ID changes
    a8550ac19d46 ext4: make block validity check resistent to sb bh corruption
    ea92c93887f5 cifs: Fix querying of WSL CHR and BLK reparse points over SMB1
    dc18c5b1301a timekeeping: Add a lockdep override in tick_freeze()
    e5208da73954 cifs: Fix encoding of SMB1 Session Setup Kerberos Request in non-UNICODE mode
    f444c139e820 nvmet-fc: put ref when assoc->del_work is already scheduled
    e45e8f0dd324 nvmet-fc: take tgtport reference only once
    0cad1849e903 x86/bugs: Don't fill RSB on context switch with eIBRS
    b73c62b1ca43 x86/bugs: Don't fill RSB on VMEXIT with eIBRS+retpoline
    19160ed5e5fa x86/bugs: Use SBPB in write_ibpb() if applicable
    84b52a6cd012 selftests/mincore: Allow read-ahead pages to reach the end of the file
    4978a798a38d gpiolib: of: Move Atmel HSMCI quirk up out of the regulator comment
    18082da6ce0e objtool: Stop UNRET validation on UD2
    0cf5fd802452 nvme: multipath: fix return value of nvme_available_path
    60ed102378a3 nvme: re-read ANA log page after ns scan completes
    4c97ba1b0b98 ACPI PPTT: Fix coding mistakes in a couple of sizeof() calls
    fcf524eaff20 ACPI: EC: Set ec_no_wakeup for Lenovo Go S
    fe063491e90d nvme: requeue namespace scan on missed AENs
    892fcde9941d xen: Change xen-acpi-processor dom0 dependency
    1fe9b92eede3 perf/core: Fix WARN_ON(!ctx) in __free_event() for partial init
    eee189ccd46b selftests: ublk: fix test_stripe_04
    b2ff4e9c599b udmabuf: fix a buf size overflow issue during udmabuf creation
    6234a3c72784 KVM: s390: Don't use %pK through debug printing
    1b2c45697f43 KVM: s390: Don't use %pK through tracepoints
    b205d02726b3 sched/isolation: Make CONFIG_CPU_ISOLATION depend on CONFIG_SMP
    c5d4d103005d io_uring: always do atomic put from iowq
    7e9b836182c1 rtc: pcf85063: do a SW reset if POR failed
    a68768e280b7 9p/net: fix improper handling of bogus negative read/write replies
    04ebabdbe99d ntb_hw_amd: Add NTB PCI ID for new gen CPU
    27f6ee168c00 ntb: reduce stack usage in idt_scan_mws
    5d53e88d8370 qibfs: fix _another_ leak
    db437e985469 objtool, lkdtm: Obfuscate the do_nothing() pointer
    11c16b644934 objtool, regulator: rk808: Remove potential undefined behavior in rk806_set_mode_dcdc()
    547695db502c objtool, ASoC: codecs: wcd934x: Remove potential undefined behavior in wcd934x_slim_irq_handler()
    4ab980b5c309 objtool, panic: Disable SMAP in __stack_chk_fail()
    97f70d27bee2 objtool: Silence more KCOV warnings
    d5ada7bf3dc8 thunderbolt: Scan retimers after device router has been enumerated
    e59fc484d424 usb: host: xhci-plat: mvebu: use ->quirks instead of ->init_quirk() func
    cfa7984f6935 usb: gadget: aspeed: Add NULL pointer check in ast_vhub_init_dev()
    8b26eb1d8bb2 usb: xhci: Avoid Stop Endpoint retry loop if the endpoint seems Running
    2c6a11eaec65 dmaengine: dmatest: Fix dmatest waiting less when interrupted
    5be9407b41ea sound/virtio: Fix cancel_sync warnings on uninitialized work_structs
    a7f9991e4e3c usb: dwc3: gadget: Avoid using reserved endpoints on Intel Merrifield
    e5aabc76d101 usb: dwc3: gadget: Refactor loop to avoid NULL endpoints
    db56636beb3e fs/ntfs3: Fix WARNING in ntfs_extend_initialized_size
    46a150788e16 usb: host: max3421-hcd: Add missing spi_device_id table
    1a0a2d8c6d77 mailbox: pcc: Always clear the platform ack interrupt first
    a6e3026e0ad6 mailbox: pcc: Fix the possible race in updation of chan_in_use flag
    10cf3135c6dc bpf: Reject attaching fexit/fmod_ret to __noreturn functions
    4ed42d1a4a5b bpf: Only fails the busy counter check in bpf_cgrp_storage_get if it creates storage
    c487fcc632e7 bpf: bpftool: Setting error code in do_loader()
    7f30987294b7 s390/tty: Fix a potential memory leak bug
    28e5a867aa54 s390/sclp: Add check for get_zeroed_page()
    96eab3c96a24 parisc: PDT: Fix missing prototype warning
    51ae5b7aa96c clk: check for disabled clock-provider in of_clk_get_hw_from_clkspec()
    b5a528a34e1f bpf: Fix deadlock between rcu_tasks_trace and event_mutex.
    1b66a5920b7f crypto: null - Use spin lock instead of mutex
    d999b11302c4 crypto: ccp - Add support for PCI device 0x1134
    02f53b8f2ffc MIPS: cm: Detect CM quirks from device tree
    979ba0d694ea pinctrl: renesas: rza2: Fix potential NULL pointer dereference
    9c97886f8085 USB: wdm: add annotation
    4b0369c53088 USB: wdm: wdm_wwan_port_tx_complete mutex in atomic context
    54f7f8978af1 USB: wdm: close race between wdm_open and wdm_wwan_port_stop
    8312053acc99 USB: wdm: handle IO errors in wdm_wwan_port_start
    e455bf315eee USB: VLI disk crashes if LPM is used
    097d3c27f871 usb: quirks: Add delay init quirk for SanDisk 3.2Gen1 Flash Drive
    57beab8ea4ff usb: quirks: add DELAY_INIT quirk for Silicon Motion Flash Drive
    127b6aba32d8 usb: dwc3: xilinx: Prevent spike in reset signal
    c4d80e41cb42 usb: dwc3: gadget: check that event count does not exceed event buffer length
    6a91a198cd30 USB: OHCI: Add quirk for LS7A OHCI controller (rev 0x02)
    23d4bb3b0698 usb: chipidea: ci_hdrc_imx: implement usb_phy_init() error handling
    15120673da69 usb: chipidea: ci_hdrc_imx: fix call balance of regulator routines
    121e9f80ea54 usb: chipidea: ci_hdrc_imx: fix usbmisc handling
    48a62deb857f usb: cdns3: Fix deadlock when using NCM gadget
    142273a49f2c usb: xhci: Fix invalid pointer dereference in Etron workaround
    01eeddf93a8a USB: serial: simple: add OWON HDS200 series oscilloscope support
    51d4b23ae5e6 USB: serial: option: add Sierra Wireless EM9291
    c6dc3b71bd4b USB: serial: ftdi_sio: add support for Abacus Electrics Optical Probe
    3b377f805e97 serial: sifive: lock port in startup()/shutdown() callbacks
    c2af265beab7 serial: msm: Configure correct working mode before starting earlycon
    5d5e8a880c48 misc: microchip: pci1xxxx: Fix incorrect IRQ status handling during ack
    62957f58ab3a misc: microchip: pci1xxxx: Fix Kernel panic during IRQ handler registration
    5f253cc40e8d char: misc: register chrdev region with all possible minors
    3481fd96d801 KVM: x86: Reset IRTE to host control if *new* route isn't postable
    9514202882a0 KVM: x86: Explicitly treat routing entry type changes as changes
    ac0fe095ac21 mei: me: add panther lake H DID
    164bc7e26d89 scsi: Improve CDL control
    4c2de359b1a2 USB: storage: quirk for ADATA Portable HDD CH94
    ff733a91a06b ata: libata-scsi: Fix ata_msense_control_ata_feature()
    f0a1b054871f ata: libata-scsi: Fix ata_mselect_control_ata_feature() return type
    f92d5d7134d1 ata: libata-scsi: Improve CDL control
    96838eb1836f mcb: fix a double free bug in chameleon_parse_gdd()
    406ca74adea0 cxl/core/regs.c: Skip Memory Space Enable check for RCD and RCH Ports
    ff826d60d9a8 KVM: SVM: Allocate IR data using atomic allocation
    b675b4c863f1 io_uring: fix 'sync' handling of io_fallback_tw()
    20a3f73dd424 LoongArch: Remove a bogus reference to ZONE_DMA
    2ca9380b1271 LoongArch: Return NULL from huge_pte_offset() for invalid PMD
    2f2803e4b5e4 irqchip/gic-v2m: Prevent use after free of gicv2m_get_fwnode()
    3d36fae38312 drm/amd/display: Force full update in gpu reset
    253827297c4d drm/amd/display: Fix gpu reset in multidisplay config
    689d5be94faa net: phy: microchip: force IRQ polling mode for lan88xx
    a7b8358eb403 net: selftests: initialize TCP header and skb payload with zero
    cefd8a2e2de4 xen-netfront: handle NULL returned by xdp_convert_buff_to_frame()
    284db2f35b39 crypto: atmel-sha204a - Set hwrng quality to lowest possible
    ad787442af7b virtio_console: fix missing byte order handling for cols and rows
    b74fb07153dc LoongArch: Make do_xyz() exception handlers more robust
    eaa0849818eb LoongArch: Make regs_irqs_disabled() more clear
    5767f4ac6428 LoongArch: Select ARCH_USE_MEMTEST
    cd5970e001f7 perf/x86: Fix non-sampling (counting) events on certain x86 platforms
    9e0d94a29222 splice: remove duplicate noinline from pipe_clear_nowait
    415f3481ca76 iommu/amd: Return an error if vCPU affinity is set for non-vCPU IRTE
    1d7c4b2b0bbf pds_core: make wait_context part of q_info
    c918ce100d17 pds_core: Remove unnecessary check in pds_client_adminq_cmd()
    cdd784c96fe2 pds_core: handle unsupported PDS_CORE_CMD_FW_CONTROL result
    49083dc3cbb3 net: dsa: mt7530: sync driver-specific behavior of MT7531 variants
    76c4c22c2437 net_sched: hfsc: Fix a potential UAF in hfsc_dequeue() too
    3aa852e36050 net_sched: hfsc: Fix a UAF vulnerability in class handling
    4f435c1f4c48 fix a couple of races in MNT_TREE_BENEATH handling by do_move_mount()
    e9f67da07753 net: ethernet: mtk_eth_soc: net: revise NETSYSv3 hardware configuration
    dd6cb0a8575b tipc: fix NULL pointer dereference in tipc_mon_reinit_self()
    618541a6cc15 net: phy: leds: fix memory leak
    d5093d6486d7 net: lwtunnel: disable BHs when required
    4d6919dd7c69 scsi: core: Clear flags for scsi_cmnd that did not complete
    4a1b61f91078 btrfs: avoid page_lockend underflow in btrfs_punch_hole_lock_range()
    1845e03ea787 cpufreq: cppc: Fix invalid return value in .get() callback
    d6979fabe812 scsi: ufs: mcq: Add NULL check in ufshcd_mcq_abort()
    19e0eaa62e88 cpufreq: scpi: Fix null-ptr-deref in scpi_cpufreq_get_rate()
    ea834c90aa7c cpufreq: scmi: Fix null-ptr-deref in scmi_cpufreq_get_rate()
    1053dcf8a504 cpufreq: apple-soc: Fix null-ptr-deref in apple_soc_cpufreq_get_rate()
    92d55d705183 dma/contiguous: avoid warning about unused size_bytes
    f55e7f8abbd3 ceph: Fix incorrect flush end position calculation
    d70c078c26c0 cpufreq/sched: Explicitly synchronize limits_changed flag handling
    ada8d7fa0ad4 sched/cpufreq: Rework schedutil governor performance estimation
    7fc781ca938f sched/topology: Consolidate and clean up access to a CPU's max compute capacity
    485104cd6353 scsi: ufs: qcom: fix dev reference leaked through of_qcom_ice_get
    bd2a352a0d72 PCI: Fix reference leak in pci_register_host_bridge()
    81435b85b2eb of: resolver: Fix device node refcount leakage in of_resolve_phandles()
    f549a4d2e029 of: resolver: Simplify of_resolve_phandles() using __free()
    9549391bb64b clk: renesas: r9a07g043: Fix HP clock source for RZ/Five
    3b6f9b555d5b clk: renesas: r9a07g04[34]: Fix typo for sel_shdi variable
    d56be1857909 clk: renesas: r9a07g04[34]: Use SEL_SDHI1_STS status configuration for SD1 mux
    a15ff92d5f06 clk: renesas: rzg2l: Refactor SD mux driver
    1b9daac2383e clk: renesas: rzg2l: Remove CPG_SDHI_DSEL from generic header
    2e1162149b39 clk: renesas: rzg2l: Add struct clk_hw_data
    aa487374d7f6 clk: renesas: rzg2l: Use u32 for flag and mux_flags
    e56acd53a91a arm64: tegra: Remove the Orin NX/Nano suspend key
    6f21dfc4fadb iio: adc: ad7768-1: Fix conversion result sign
    28aadcb759cf iio: adc: ad7768-1: Move setting of val a bit later to avoid unnecessary return value check
    8df02691d09e ASoC: q6apm-dai: make use of q6apm_get_hw_pointer
    175cb0c28aea ASoC: qcom: Fix trivial code style issues
    9f5d3022d8ca ASoC: qcom: lpass: Make asoc_qcom_lpass_cpu_platform_remove() return void
    0addfbfd605b ASoC: q6apm-dai: schedule all available frames to avoid dsp under-runs
    860c028415d9 ASoC: qcom: q6apm-dai: drop unused 'q6apm_dai_rtd' fields
    9973c8192e07 net: dsa: mv88e6xxx: fix VTU methods for 6320 family
    70d2b16cdd12 net: dsa: mv88e6xxx: fix internal PHYs for 6320 family
    83c12c052cf5 auxdisplay: hd44780: Fix an API misuse in hd44780.c
    ab239a12fdb2 auxdisplay: hd44780: Convert to platform remove callback returning void
    880b1c98d1b4 mmc: sdhci-msm: fix dev reference leaked through of_qcom_ice_get
    d4f5f29c26a1 soc: qcom: ice: introduce devm_of_qcom_ice_get
    a505075730d2 media: vimc: skip .s_stream() for stopped entities
    a64a102e01eb media: subdev: Add v4l2_subdev_is_streaming()
    2b3dc697a465 media: subdev: Improve v4l2_subdev_enable/disable_streams_fallback
    beeeea11ee2a media: subdev: Fix use of sd->enabled_streams in call_s_stream()
    4d11fac941d8 tracing: Verify event formats that have "%*p.."
    e13358c4884d tracing: Add __print_dynamic_array() helper
    896e30f76840 tracing: Add __string_len() example
    5724654a084f x86/mce: use is_copy_from_user() to determine copy-from-user context
    415620362062 x86/extable: Remove unused fixup type EX_TYPE_COPY
    247395cbec42 module: sign with sha512 instead of sha1 by default
    6a5b2ed82152 ARM: dts: am335x-bone-common: Increase MDIO reset deassert time
    ceb5fadbf450 Revert "v6.6 -stable -rt merge fixup"
    1c2962a164ff v6.6 -stable -rt merge fixup
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
 .../linux/linux-yocto-rt_6.6.bb               |  4 +--
 .../linux/linux-yocto-tiny_6.6.bb             |  4 +--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 26 +++++++++----------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 765652e6f5..a07f576065 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a0454499911667c6469f2bb8c66040da8fea3d53"
+SRCREV_machine ?= "f5eaa9ffda0168a6c779dd79da8c5085d7c0bafa"
 SRCREV_meta ?= "60d2dc333c5a027c81bf12f650deebcf4337a5b0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.88"
+LINUX_VERSION ?= "6.6.89"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 6cc8d766fa..1cb5652024 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.88"
+LINUX_VERSION ?= "6.6.89"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,7 +17,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "f152cbb186c26d709c289a33b34ffc1cbf0ab8c2"
+SRCREV_machine ?= "bea51ee05667a082fdb2de48f2b779920de37aab"
 SRCREV_meta ?= "60d2dc333c5a027c81bf12f650deebcf4337a5b0"
 
 PV = "${LINUX_VERSION}+git"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 285285462d..b346190879 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,17 +18,17 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "dd6ce84338d67979d2ca408ca956affc239954c3"
-SRCREV_machine:qemuarm64 ?= "9b9fe6cea58a9ca82a3359bf450cb9b25a9827b0"
-SRCREV_machine:qemuloongarch64 ?= "358824da80133d743605499668f295f00c8e11cb"
-SRCREV_machine:qemumips ?= "072ba5c31caecbaa2a4e999d8fa6cb5d830c4cb1"
-SRCREV_machine:qemuppc ?= "30195da29112099bf74cca8b9a7a4792ebac07ae"
-SRCREV_machine:qemuriscv64 ?= "358824da80133d743605499668f295f00c8e11cb"
-SRCREV_machine:qemuriscv32 ?= "358824da80133d743605499668f295f00c8e11cb"
-SRCREV_machine:qemux86 ?= "358824da80133d743605499668f295f00c8e11cb"
-SRCREV_machine:qemux86-64 ?= "358824da80133d743605499668f295f00c8e11cb"
-SRCREV_machine:qemumips64 ?= "41a26cf54207c045a113a613cf400a4ba52c375c"
-SRCREV_machine ?= "358824da80133d743605499668f295f00c8e11cb"
+SRCREV_machine:qemuarm ?= "46314bb9440c533de81ad6fd1e4465a1a92dbaf1"
+SRCREV_machine:qemuarm64 ?= "c2536612ab8cdfef938781c99eb8ef57466740fc"
+SRCREV_machine:qemuloongarch64 ?= "26ad3d3b1796f301f5491a94487ec7af0e5c4a34"
+SRCREV_machine:qemumips ?= "48a91048f92b14d77663c5faae98a2154c0c406b"
+SRCREV_machine:qemuppc ?= "a92a2bd6411a5dcf62ca06c947eab278edd56151"
+SRCREV_machine:qemuriscv64 ?= "26ad3d3b1796f301f5491a94487ec7af0e5c4a34"
+SRCREV_machine:qemuriscv32 ?= "26ad3d3b1796f301f5491a94487ec7af0e5c4a34"
+SRCREV_machine:qemux86 ?= "26ad3d3b1796f301f5491a94487ec7af0e5c4a34"
+SRCREV_machine:qemux86-64 ?= "26ad3d3b1796f301f5491a94487ec7af0e5c4a34"
+SRCREV_machine:qemumips64 ?= "3ef0bab27a99c6e29e97ef4e71a7967b31b4f562"
+SRCREV_machine ?= "26ad3d3b1796f301f5491a94487ec7af0e5c4a34"
 SRCREV_meta ?= "60d2dc333c5a027c81bf12f650deebcf4337a5b0"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
@@ -36,7 +36,7 @@ SRCREV_meta ?= "60d2dc333c5a027c81bf12f650deebcf4337a5b0"
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "23ec0b4057294d86cdefafe373b1f03568f75aff"
+SRCREV_machine:class-devupstream ?= "71e4ec9b2abccce5adecb3b354d0d5003f6f88f2"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.88"
+LINUX_VERSION ?= "6.6.89"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


