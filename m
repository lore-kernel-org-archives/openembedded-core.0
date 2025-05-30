Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97658C5B559
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 17:39:19 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.1263.1748626755874203107
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 10:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EWng/82V;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b26f01c638fso2195905a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 10:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748626755; x=1749231555; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jdhHb613/U/sZ815gOEgfSJ+jQtbhLJzoJz9jTQYwSQ=;
        b=EWng/82VE33h7vqvA93Lbv+PXu6Psoes8ioOJEfGuc+CRIo9WF3AiyQshddxKGhkqo
         SWv282yycs5LDv3VYXLwzV0WZeIpr7J6/gTVetRb5WzPBkrG5oaG1afIGRTmeEuVBp5Y
         Hmkf4SjXzsu6pv7hs/uNEGGa4tZsxraAiYJXZzj6jf7mD62LAWNzaqhbR+Zxn/GxpZ8z
         UxxzRHiPMbJ7ykTEVRV7+x0xT78g1vMyYyaJzeg0sbMJUyhhDogWiYKU/qyZHkx/+ieu
         bov9If0DuU4B+/uDRB7YIOFdHZwt4aRRxuz/j+1kYFuNJAeCnhAF7GoiZ+Q/RI0l5EoR
         XzmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748626755; x=1749231555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jdhHb613/U/sZ815gOEgfSJ+jQtbhLJzoJz9jTQYwSQ=;
        b=VNLHV2lQhEYx8Y2Q2KFoSvWMEoR6F+hp3gQdH6Iglsz3zhWENcMmNIC+sdQmU3DPTm
         9cTWUDc2PajYgdZc8oUG+ahKK4JDEb1lbCbTjNLZs/BKTNyqDWD9CYU9/bltkrHa0bRw
         mSxoGe6KeT2B0i8OLE+tjFzc2dtFsvI3apFXxM1HRzHEFHK002Uflb71HlsjX9FN/RrO
         CblgbsOW18hNkcdKudFs847PJWoQB1uocFwSDhuuNMLH42WC2NM5/Q8oRyw2yWvAOsCx
         CkCG8Ij/xqK8uhPrkXmlTihzXF46TwCV11gX4Ma8UpNsOrzkRJQD1mJ81LiMGVTmypTc
         e1HQ==
X-Gm-Message-State: AOJu0Yy1BkG06c+NXFcQXRuLoBPzH+hWg2kTOodnkbTj6baLb2K/iJSW
	Lk/dOycuGN4ONwaue43g7KJRhEnpx62ASHsCRCnZYirjCMYBZi/BAUrDurVfyB1pOGdJyi6uo3U
	2FGDq
X-Gm-Gg: ASbGnct8UwrtzGamLlU7+pFK+zg2bnM9JHKeLOMJeorfYvP/Q3B+ysMGcLXHztxXxLe
	WDujRT9OLLbvacVr79Pr3fVr667QF1vIumFYbqKCs0IU2xfSa38QQ3jM3GgXmBSg0cs6IO7V3HE
	wmdopR7WbsYzngl0JTgTFETG2E4qBuwwtEODzOCCM7/tAVRBNGmsKY5p+a5liWvnGZ7tp8ba8v6
	uMHHrDymGjUZeUfEpEHnAkL7Piq54u67uixRXj+RaEajPLeFzWksIxoqp0UngkdAQRY6KmbiQVG
	rCHtUQpbK/0kyUuS7Y//sEzvSh6VmxeUsp+ZjU5S7RyQ/QGaQgAHHg==
X-Google-Smtp-Source: AGHT+IFUlxU4OHvvbIaUdxikxvBBvJDQkuRfGe7W65lMBrXYaSNh8Qk/8FD+sxA8QJQU5Bb6OiIzZA==
X-Received: by 2002:a05:6a21:516:b0:1f5:8262:2c0b with SMTP id adf61e73a8af0-21ad94eef68mr7766586637.2.1748626754593;
        Fri, 30 May 2025 10:39:14 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c9d8:e2d0:bfbc:3a26])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2ecebb5f40sm1554314a12.67.2025.05.30.10.39.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 10:39:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 05/12] linux-yocto/6.12: update to v6.12.27
Date: Fri, 30 May 2025 10:38:52 -0700
Message-ID: <e73ad0e21159523c814c9228e7ef585451df17d9.1748626640.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748626640.git.steve@sakoman.com>
References: <cover.1748626640.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 17:39:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217528

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    b801eaa96a5a Linux 6.12.27
    92c6f8c577a0 bpf: Fix BPF_INTERNAL namespace import
    c72e4daa7ab2 Linux 6.12.26
    6b9ebcbd315b mq-deadline: don't call req_get_ioprio from the I/O completion handler
    ccc4e973fd19 arm64: dts: ti: k3-j784s4-j742s2-main-common: Correct the GICD size
    4b814a1c0c6d crypto: Kconfig - Select LIB generic option
    ab5281d21e37 usb: typec: class: Unlocked on error in typec_register_partner()
    ff4226252ca5 objtool: Silence more KCOV warnings, part 2
    4dc5c03fbda0 objtool: Ignore end-of-section jumps for KCOV/GCOV
    1b7647efade7 usb: xhci: Fix Short Packet handling rework ignoring errors
    1042d22942c4 nvme: fixup scan failure for non-ANA multipath controllers
    8bfe4f02b647 MIPS: cm: Fix warning if MIPS_CM is disabled
    62bf68561d3c media: i2c: imx214: Fix uninitialized variable in imx214_set_ctrl()
    67727c5764a8 crypto: lib/Kconfig - Hide arch options from user
    4833d0a92b59 iommu: Handle race with default domain setup
    49d628cb2460 net: dsa: mv88e6xxx: enable STU methods for 6320 family
    ff83998b6fa7 net: dsa: mv88e6xxx: enable .port_set_policy() for 6320 family
    7dd0c1b86e6b net: dsa: mv88e6xxx: enable PVT for 6321 switch
    f4106753ae0d net: dsa: mv88e6xxx: fix atu_move_port_mask for 6341 family
    324fd0ba933c Revert "net: dsa: mv88e6xxx: fix internal PHYs for 6320 family"
    40966fc9939e usb: typec: class: Invalidate USB device pointers on partner unregistration
    45314999f950 ext4: goto right label 'out_mmap_sem' in ext4_setattr()
    9f609f04c2a1 comedi: jr3_pci: Fix synchronous deletion of timer
    33e131a10459 vmxnet3: Fix malformed packet sizing in vmxnet3_process_xdp
    de7c24febd21 usb: typec: class: Fix NULL pointer access
    543e0f8765e4 selftests/bpf: Adjust data size to have ETH_HLEN
    a9b0b9421e34 selftests/bpf: check program redirect in xdp_cpumap_attach
    b84e7bc48840 selftests/bpf: make xdp_cpumap_attach keep redirect prog attached
    f8ed4bfb035e selftests/bpf: fix bpf_map_redirect call for cpu map test
    94d9c3366e4d xfs: flush inodegc before swapon
    d6989af0cb1b xfs: rename xfs_iomap_swapfile_activate to xfs_vm_swap_activate
    8185e3ba7146 xfs: Do not allow norecovery mount with quotacheck
    94c5584f36a9 xfs: do not check NEEDSREPAIR if ro,norecovery mount.
    2b344e779d9a driver core: fix potential NULL pointer dereference in dev_uevent()
    4f43c1bf2b1a driver core: introduce device_set_driver() helper
    bfc66c4c2804 Revert "drivers: core: synchronize really_probe() and dev_uevent()"
    185d376875ea spi: spi-imx: Add check for spi_imx_setupxfer()
    54cbce4fe04b drm/amdgpu: Use the right function for hdp flush
    0fd149c26281 drm/amdgpu: use a dummy owner for sysfs triggered cleaner shaders v4
    387461fba314 md/raid1: Add check for missing source disk in process_checks()
    cd0d49958ccb x86/cpu: Add CPU model number for Bartlett Lake CPUs with Raptor Cove cores
    3027e5d81147 ubsan: Fix panic from test_ubsan_out_of_bounds
    33903ad6274c spi: tegra210-quad: add rate limiting and simplify timeout error message
    1b4cf6873a40 spi: tegra210-quad: use WARN_ON_ONCE instead of WARN_ON for timeouts
    8f805b3746d2 ksmbd: fix WARNING "do not call blocking ops when !TASK_RUNNING"
    c9ffbc07920d riscv: Provide all alternative macros all the time
    d53b2d49a8e2 iomap: skip unnecessary ifs_block_is_uptodate check
    2ef6eea2efce netfs: Only create /proc/fs/netfs with CONFIG_PROC_FS
    2d097dc242ee x86/i8253: Call clockevent_i8253_disable() with interrupts disabled
    40216dc23955 ASoC: fsl_asrc_dma: get codec or cpu dai from backend
    0f9802f17422 scsi: pm80xx: Set phy_attached to zero when device is gone
    acf1610d8ba3 scsi: ufs: exynos: gs101: Put UFS device in reset on .suspend()
    b7a05edb2867 scsi: ufs: exynos: Move phy calls to .exit() callback
    c0724ac138db scsi: ufs: exynos: Enable PRDT pre-fetching with UFSHCD_CAP_CRYPTO
    09c7a0692870 scsi: ufs: exynos: Ensure pre_link() executes before exynos_ufs_phy_init()
    731047980d7e scsi: hisi_sas: Fix I/O errors caused by hardware port ID changes
    b626bc3c1dce ext4: make block validity check resistent to sb bh corruption
    b14d98641312 iommu: Clear iommu-dma ops on cleanup
    71c3d43c8f70 cifs: Fix querying of WSL CHR and BLK reparse points over SMB1
    9f8eeac3a61c timekeeping: Add a lockdep override in tick_freeze()
    1776d6d01913 cifs: Fix encoding of SMB1 Session Setup Kerberos Request in non-UNICODE mode
    f4cb2c042a29 nvmet-fc: put ref when assoc->del_work is already scheduled
    9635d486b608 nvmet-fc: take tgtport reference only once
    bb4b487bbd29 x86/bugs: Don't fill RSB on context switch with eIBRS
    3b4fc0785ad4 x86/bugs: Don't fill RSB on VMEXIT with eIBRS+retpoline
    5c41b7913fe0 x86/bugs: Use SBPB in write_ibpb() if applicable
    6f3e9b256663 selftests/mincore: Allow read-ahead pages to reach the end of the file
    f1e28d46a01b x86/xen: disable CPU idle and frequency drivers for PVH dom0
    5e58b93a1214 gpiolib: of: Move Atmel HSMCI quirk up out of the regulator comment
    fecf44d47384 objtool: Stop UNRET validation on UD2
    ee5521176ad8 nvme: multipath: fix return value of nvme_available_path
    b9c89c97d70b nvme: re-read ANA log page after ns scan completes
    5f3f3087a24f drm/xe/xe3lpg: Apply Wa_14022293748, Wa_22019794406
    bbf2d0605247 drm/amdgpu: Increase KIQ invalidate_tlbs timeout
    bd12979c190c ACPI PPTT: Fix coding mistakes in a couple of sizeof() calls
    bff38d184b70 ACPI: EC: Set ec_no_wakeup for Lenovo Go S
    24ede35eb2ab nvme: requeue namespace scan on missed AENs
    781c870bdc20 xen: Change xen-acpi-processor dom0 dependency
    90dc6c1e3b20 perf/core: Fix WARN_ON(!ctx) in __free_event() for partial init
    d6b66c20d585 selftests: ublk: fix test_stripe_04
    a4e99cd41590 cgroup/cpuset: Don't allow creation of local partition over a remote one
    daed646d3cfa KVM: s390: Don't use %pK through debug printing
    5e7c90294e7a KVM: s390: Don't use %pK through tracepoints
    c6c8afdcf824 sched/isolation: Make CONFIG_CPU_ISOLATION depend on CONFIG_SMP
    e5902d7ec720 kbuild: add dependency from vmlinux to sorttable
    3568fd9e440e io_uring: always do atomic put from iowq
    2dc0e5ceb3a9 rtc: pcf85063: do a SW reset if POR failed
    18296b595176 9p/trans_fd: mark concurrent read and writes to p9_conn->err
    c548f95688e2 9p/net: fix improper handling of bogus negative read/write replies
    a3b8d8cf5196 ntb_hw_amd: Add NTB PCI ID for new gen CPU
    b5f8b03af515 ntb: reduce stack usage in idt_scan_mws
    47ab2caba495 qibfs: fix _another_ leak
    69578c7d02a9 objtool, lkdtm: Obfuscate the do_nothing() pointer
    03bb66ede7ef objtool, regulator: rk808: Remove potential undefined behavior in rk806_set_mode_dcdc()
    777e6735fecc objtool, ASoC: codecs: wcd934x: Remove potential undefined behavior in wcd934x_slim_irq_handler()
    0485bdf88fb4 objtool, panic: Disable SMAP in __stack_chk_fail()
    8b4f2b6389bf objtool: Silence more KCOV warnings
    da780c4a075b um: work around sched_yield not yielding in time-travel mode
    0a205fdbb388 thunderbolt: Scan retimers after device router has been enumerated
    7fb9a9d2e320 usb: host: xhci-plat: mvebu: use ->quirks instead of ->init_quirk() func
    052fb65335be usb: gadget: aspeed: Add NULL pointer check in ast_vhub_init_dev()
    2c97354037aa phy: rockchip: usbdp: Avoid call hpd_event_trigger in dp_phy_init
    9ff59cb81500 usb: xhci: Avoid Stop Endpoint retry loop if the endpoint seems Running
    2ef4b0e91170 dmaengine: dmatest: Fix dmatest waiting less when interrupted
    69bb5d420da7 i3c: master: svc: Add support for Nuvoton npcm845 i3c
    635be1360666 xhci: Handle spurious events on Etron host isoc enpoints
    16a7a8e6c47f usb: xhci: Fix isochronous Ring Underrun/Overrun event handling
    cbfa55bda1fe usb: xhci: Complete 'error mid TD' transfers when handling Missed Service
    66046b586c0a sound/virtio: Fix cancel_sync warnings on uninitialized work_structs
    f045fd7d46e8 usb: dwc3: gadget: Avoid using reserved endpoints on Intel Merrifield
    2ecae001385e usb: dwc3: gadget: Refactor loop to avoid NULL endpoints
    8a5e1d32c620 fs/ntfs3: Fix WARNING in ntfs_extend_initialized_size
    8db49e89a7f8 fs/ntfs3: Keep write operations atomic
    523bcab993fc usb: host: max3421-hcd: Add missing spi_device_id table
    8b7b088925e9 mailbox: pcc: Always clear the platform ack interrupt first
    a32ebfa7d80b mailbox: pcc: Fix the possible race in updation of chan_in_use flag
    b817d2bfd6d4 bpf: Reject attaching fexit/fmod_ret to __noreturn functions
    4131411f428d bpf: Only fails the busy counter check in bpf_cgrp_storage_get if it creates storage
    46df1fe944d0 bpf: bpftool: Setting error code in do_loader()
    ab57877603ea s390/tty: Fix a potential memory leak bug
    3b3aa72636a6 s390/sclp: Add check for get_zeroed_page()
    6e026e605088 parisc: PDT: Fix missing prototype warning
    4139072087e2 clk: check for disabled clock-provider in of_clk_get_hw_from_clkspec()
    c5c833f6375f bpf: Fix deadlock between rcu_tasks_trace and event_mutex.
    7758e308aeda bpf: Fix kmemleak warning for percpu hashmap
    0486de3c1b82 crypto: null - Use spin lock instead of mutex
    0195abab4ac8 crypto: lib/Kconfig - Fix lib built-in failure when arch is modular
    fbea0efa8a1d crypto: ccp - Add support for PCI device 0x1134
    eea7d57c4a64 MIPS: cm: Detect CM quirks from device tree
    3da037149416 pinctrl: mcp23s08: Get rid of spurious level interrupts
    d00d598027b6 pinctrl: renesas: rza2: Fix potential NULL pointer dereference
    1badc279b4ae selftests/bpf: Fix stdout race condition in traffic monitor
    caa559d3f74d USB: wdm: add annotation
    b8bf49f3f650 USB: wdm: wdm_wwan_port_tx_complete mutex in atomic context
    52ae15c665b5 USB: wdm: close race between wdm_open and wdm_wwan_port_stop
    eb4973cf6b38 USB: wdm: handle IO errors in wdm_wwan_port_start
    3e52ae347e95 USB: VLI disk crashes if LPM is used
    d85b7af3bdc5 usb: quirks: Add delay init quirk for SanDisk 3.2Gen1 Flash Drive
    9924ee1bcd16 usb: quirks: add DELAY_INIT quirk for Silicon Motion Flash Drive
    694fdc6a9c28 usb: dwc3: xilinx: Prevent spike in reset signal
    52a7c9d930b9 usb: dwc3: gadget: check that event count does not exceed event buffer length
    17c3984a4414 USB: OHCI: Add quirk for LS7A OHCI controller (rev 0x02)
    7fb632a131e5 usb: chipidea: ci_hdrc_imx: implement usb_phy_init() error handling
    c99ace596505 usb: chipidea: ci_hdrc_imx: fix call balance of regulator routines
    887902ca7349 usb: chipidea: ci_hdrc_imx: fix usbmisc handling
    74cd6e408a4c usb: cdns3: Fix deadlock when using NCM gadget
    bce3055b08e3 usb: xhci: Fix invalid pointer dereference in Etron workaround
    177771486508 xhci: Limit time spent with xHC interrupts disabled during bus resume
    54c66c703029 USB: serial: simple: add OWON HDS200 series oscilloscope support
    2eff9768197e USB: serial: option: add Sierra Wireless EM9291
    ea0d806b94bf USB: serial: ftdi_sio: add support for Abacus Electrics Optical Probe
    5d29f884fe9e serial: sifive: lock port in startup()/shutdown() callbacks
    f6ae572683d4 serial: msm: Configure correct working mode before starting earlycon
    6f021bc0083b tty: Require CAP_SYS_ADMIN for all usages of TIOCL_SELMOUSEREPORT
    f6500093584e firmware: stratix10-svc: Add of_platform_default_populate()
    4fb75c0ccc33 misc: microchip: pci1xxxx: Fix incorrect IRQ status handling during ack
    12cc2193f2b9 misc: microchip: pci1xxxx: Fix Kernel panic during IRQ handler registration
    3670dee37657 char: misc: register chrdev region with all possible minors
    26df754de545 KVM: x86: Take irqfds.lock when adding/deleting IRQ bypass producer
    b5de7ac74f69 KVM: x86: Reset IRTE to host control if *new* route isn't postable
    a22fe6f84306 KVM: x86: Explicitly treat routing entry type changes as changes
    3e243378f27c mei: vsc: Fix fortify-panic caused by invalid counted_by() use
    34fafded1ca6 mei: me: add panther lake H DID
    1f439fe4d8d9 scsi: Improve CDL control
    b39bb3b4eb64 USB: storage: quirk for ADATA Portable HDD CH94
    40554c0f74bc ata: libata-scsi: Fix ata_msense_control_ata_feature()
    aa5778d06aeb ata: libata-scsi: Fix ata_mselect_control_ata_feature() return type
    ef2d6c63469e ata: libata-scsi: Improve CDL control
    df1a5d5c6134 mcb: fix a double free bug in chameleon_parse_gdd()
    4c5f6925e267 cxl/core/regs.c: Skip Memory Space Enable check for RCD and RCH Ports
    f3cd533c3ae3 KVM: SVM: Allocate IR data using atomic allocation
    7a8a6b627fde io_uring: fix 'sync' handling of io_fallback_tw()
    74d9e2018789 LoongArch: KVM: Fix PMU pass-through issue if VM exits to host finally
    be83fd71ac6e LoongArch: KVM: Fully clear some CSRs when VM reboot
    3b7f341eee94 LoongArch: Remove a bogus reference to ZONE_DMA
    51424fd171ce LoongArch: Return NULL from huge_pte_offset() for invalid PMD
    93b7872d3325 LoongArch: Handle fp, lsx, lasx and lbt assembly symbols
    3939d6f29d34 irqchip/gic-v2m: Prevent use after free of gicv2m_get_fwnode()
    140f05cbbf6b x86/insn: Fix CTEST instruction decoding
    1ae30272b992 drm/amd/display: Force full update in gpu reset
    3ff83378b6b1 drm/amd/display: Fix gpu reset in multidisplay config
    92b58c671b36 drm: panel: jd9365da: fix reset signal polarity in unprepare
    ea532ba5e1e6 rust: firmware: Use `ffi::c_char` type in `FwFunc`
    1909540037d3 scsi: mpi3mr: Fix pending I/O counter
    9c31ac781950 net: phy: microchip: force IRQ polling mode for lan88xx
    c2a6b4d78c12 net: selftests: initialize TCP header and skb payload with zero
    d6a9c4e6f9b3 xen-netfront: handle NULL returned by xdp_convert_buff_to_frame()
    64b816a6c41c crypto: atmel-sha204a - Set hwrng quality to lowest possible
    28401a63c01a sched_ext: Use kvzalloc for large exit_dump allocation
    30c0d6e778da virtio_console: fix missing byte order handling for cols and rows
    e17bc10bf30b netfilter: fib: avoid lookup if socket is available
    f33b678543b9 KVM: SVM: Disable AVIC on SNP-enabled system without HvInUseWrAllowed feature
    9b34dffcd943 LoongArch: Make do_xyz() exception handlers more robust
    a556bb5178a3 LoongArch: Make regs_irqs_disabled() more clear
    08bbdcb35c81 LoongArch: Select ARCH_USE_MEMTEST
    8d37031464d5 perf/x86: Fix non-sampling (counting) events on certain x86 platforms
    955f9ede52b8 bpf: Add namespace to BPF internal symbols
    3decda1a3c19 splice: remove duplicate noinline from pipe_clear_nowait
    bcf6d3158c59 riscv: uprobes: Add missing fence.i after building the XOL buffer
    4715ab8435eb riscv: Replace function-like macro by static inline function
    e22010c3b83f iommu/amd: Return an error if vCPU affinity is set for non-vCPU IRTE
    7f24ea6a460b block: never reduce ra_pages in blk_apply_bdi_limits
    66d7702b42ff pds_core: make wait_context part of q_info
    ff207e83dac4 pds_core: Remove unnecessary check in pds_client_adminq_cmd()
    6702f5c6b22d pds_core: handle unsupported PDS_CORE_CMD_FW_CONTROL result
    2982e07ad72b pds_core: Prevent possible adminq overflow/stuck condition
    dd6c299390bd net: dsa: mt7530: sync driver-specific behavior of MT7531 variants
    c6f035044104 net_sched: hfsc: Fix a potential UAF in hfsc_dequeue() too
    86cd4641c713 net_sched: hfsc: Fix a UAF vulnerability in class handling
    a61afd54826a fix a couple of races in MNT_TREE_BENEATH handling by do_move_mount()
    4fb743ee2128 net: ethernet: mtk_eth_soc: net: revise NETSYSv3 hardware configuration
    0ceef62a328c tipc: fix NULL pointer dereference in tipc_mon_reinit_self()
    41143e71052a net: phy: leds: fix memory leak
    3340654bbf6b net: lwtunnel: disable BHs when required
    eeab6618037b scsi: ufs: core: Add NULL check in ufshcd_mcq_compl_pending_transfer()
    29daa63f2c75 scsi: core: Clear flags for scsi_cmnd that did not complete
    fdd2a03561a4 net/mlx5: Move ttc allocation after switch case to prevent leaks
    0b682680b12b net/mlx5: Fix null-ptr-deref in mlx5_create_{inner_,}ttc_table()
    ef258a15e76c vhost-scsi: Fix vhost_scsi_send_status()
    0ac4643bf2c9 vhost-scsi: Fix vhost_scsi_send_bad_target()
    461c258ba7f6 vhost-scsi: Add better resource allocation failure handling
    5d92e582d162 cgroup/cpuset-v1: Add missing support for cpuset_v2_mode
    9a447f748f6c btrfs: zoned: return EIO on RAID1 block group write pointer mismatch
    c8a0c38beb87 btrfs: avoid page_lockend underflow in btrfs_punch_hole_lock_range()
    6c1c66580587 cpufreq: fix compile-test defaults
    ef56c130f6e6 cpufreq: Do not enable by default during compile testing
    dbe413a8cdc6 cpufreq: cppc: Fix invalid return value in .get() callback
    7d002f591486 scsi: ufs: mcq: Add NULL check in ufshcd_mcq_abort()
    28fbd7b13b4d cpufreq: scpi: Fix null-ptr-deref in scpi_cpufreq_get_rate()
    7ccfadfb2562 cpufreq: scmi: Fix null-ptr-deref in scmi_cpufreq_get_rate()
    fbdba5f37413 cpufreq: apple-soc: Fix null-ptr-deref in apple_soc_cpufreq_get_rate()
    16c8aa5de135 dma/contiguous: avoid warning about unused size_bytes
    40bf7f560ca4 cpufreq: sun50i: prevent out-of-bounds access
    aef37505c496 ceph: Fix incorrect flush end position calculation
    984830d902fb lib/Kconfig.ubsan: Remove 'default UBSAN' from UBSAN_INTEGER_WRAP
    b26ac563704c drm/amd/display/dml2: use vzalloc rather than kzalloc
    50ec8c24286e drm/amd/display: Fix unnecessary cast warnings from checkpatch
    0fdb612c2072 drm/xe/bmg: Add one additional PCI ID
    c187aaa9e79b net/niu: Niu requires MSIX ENTRY_DATA fields touch before entry reads
    869749e48115 scsi: ufs: exynos: Disable iocc if dma-coherent property isn't set
    56f3327cdd18 scsi: ufs: exynos: Move UFS shareability value to drvdata
    661380d98218 scsi: ufs: exynos: Add gs101_ufs_drv_init() hook and enable WriteBooster
    0e76176edc9b scsi: ufs: exynos: Remove superfluous function parameter
    ffcdfaecd422 scsi: ufs: exynos: Remove empty drv_init method
    1aec4d14cf81 ksmbd: fix use-after-free in __smb2_lease_break_noti()
    0fc403192dcc ksmbd: browse interfaces list on FSCTL_QUERY_INTERFACE_INFO IOCTL
    8d2c1acc88cb ksmbd: add netdev-up/down event debug print
    0772765ac82d ksmbd: use __GFP_RETRY_MAYFAIL
    60cb4dfcf739 accel/ivpu: Fix the NPU's DPU frequency calculation
    27fcf647818b accel/ivpu: Add auto selection logic for job scheduler
    35ba7b2d4dd0 PCI/MSI: Add an option to write MSIX ENTRY_DATA before any reads
    46d357520934 PCI/MSI: Handle the NOMASK flag correctly for all PCI/MSI backends
    aad12468967b PCI/MSI: Convert pci_msi_ignore_mask to per MSI domain flag
    8fe536f1026c scsi: ufs: qcom: fix dev reference leaked through of_qcom_ice_get
    a122b3b1f5b8 of: resolver: Fix device node refcount leakage in of_resolve_phandles()
    05576e1304fd of: resolver: Simplify of_resolve_phandles() using __free()
    56ddf0023b00 arm64: dts: ti: k3-j784s4-j742s2-main-common: Fix serdes_ln_ctrl reg-masks
    107b05f54022 arm64: dts: ti: Refactor J784s4 SoC files to a common file
    bde067b82ac7 iio: adc: ad7768-1: Fix conversion result sign
    68565706b589 iio: adc: ad7768-1: Move setting of val a bit later to avoid unnecessary return value check
    8f229785c5b7 net: dsa: mv88e6xxx: fix VTU methods for 6320 family
    2afa5ea7c48d block: make sure ->nr_integrity_segments is cloned in blk_rq_prep_clone
    ed7535b14116 block: remove the ioprio field from struct request
    3e12e8c273eb block: remove the write_hint field from struct request
    575601d08abf media: ov08x40: Add missing ov08x40_identify_module() call on stream-start
    9c00d5445423 media: ov08x40: Move ov08x40_identify_module() function up
    fc96a720d887 media: i2c: imx214: Fix link frequency validation
    5a5ab62e4a76 media: i2c: imx214: Check number of lanes from device tree
    2a60b6bef436 media: i2c: imx214: Replace register addresses with macros
    694d85794ac6 media: i2c: imx214: Convert to CCI register access helpers
    a9aa21098974 media: i2c: imx214: Simplify with dev_err_probe()
    d3a38834b206 media: i2c: imx214: Use subdev active state
    9d5752b85378 PM: EM: Address RCU-related sparse warnings
    db3b3964af11 PM: EM: use kfree_rcu() to simplify the code
    27ce35d80a1c mmc: sdhci-msm: fix dev reference leaked through of_qcom_ice_get
    311a651fbb78 soc: qcom: ice: introduce devm_of_qcom_ice_get
    1c9798bf8145 mm/vmscan: don't try to reclaim hwpoison folio
    031273540275 tracing: Verify event formats that have "%*p.."
    0b603e775979 tracing: Add __print_dynamic_array() helper
    e62c31802dcc module: sign with sha512 instead of sha1 by default
    2ee7ebed771b mips: Add '-std=gnu11' to vdso CFLAGS
    b2c792d89ac5 yaffs2: switch from readlink_copy() to vfs_readlink()
    807165b1ec1c tools/power/x86/intel-speed-select: Prefix header search path with sysroot
    e97df805b938 drm/tilcdc: Set preferred depth
    7160a4379dcc arch/arm64/configs: remove CONFIG_SM_DISPCC_8650
    6d8ac5ebe6e8 aufs6: core
    587abc1b64c4 aufs6: standalone
    1af41d30ef42 aufs6: mmap
    6ee2464d2e9d aufs6: base
    103b676505f7 aufs6: kbuild
    67281562943f qemux86: add configuration symbol to select values
    73f315ca0823 sched/isolation: really align nohz_full with rcu_nocbs
    1e4e7f8ab622 clear_warn_once: add a clear_warn_once= boot parameter
    918e7a825e8b clear_warn_once: bind a timer to written reset value
    f533f87c3758 clear_warn_once: expand debugfs to include read support
    f149ca27cba9 tools: Remove some options from CLANG_CROSS_FLAGS
    e633abe9c44e libbpf: Fix build warning on ref_ctr_off
    ec0916a4cfc1 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    03721ceb5626 perf: x86-32: explicitly include <errno.h>
    4c36c5295bb0 perf: mips64: Convert __u64 to unsigned long long
    b0200449610d perf: fix bench numa compilation
    aff0940b2212 perf: add SLANG_INC for slang.h
    ef912018d28c perf: add sgidefs.h to for mips builds
    d8860f858b87 perf: change --root to --prefix for python install
    dc38a0eee6e5 perf: add 'libperl not found' warning
    6ed51f8786da perf: force include of <stdbool.h>
    c538d4c4ac65 fat: Replace prandom_u32() with get_random_u32()
    63d94846f0c5 fat: don't use obsolete random32 call in namei_vfat
    7816667451ef FAT: Added FAT_NO_83NAME
    f81dbd60f0d5 FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    771cdefba44b FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    a24784fd8f88 yaffs2: update to v6.12 folio changes
    d0a48fd46db8 yaffs2: adapt to v6.10 i_time changes
    d097e4d4115a yaffs: fix mtime/itime field access
    4411e0d49fe3 yaffs2: update VFS ctime operations to 6.6+
    1b6619086e8b yaffs2: v6.5 fixups
    25b261ee3c54 yaffs2: Fix miscalculation of devname buffer length
    5c07936a5d1c yaffs2: convert user_namespace to mnt_idmap
    55986a1284b3 yaffs2: replace bdevname call with sprintf
    6f5508f8db8f yaffs2: convert read_page -> readfolio
    fd179a5df5d5 yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    c9a620dacdd1 yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    78588208ed17 yaffs2: v5.12+ build fixups (not runtime tested)
    8d2dddba272c yaffs: include blkdev.h
    8c1ca9ef9712 yaffs: Fix build failure by handling inode i_version with proper atomic API
    27005cbac2ed yaffs2: v5.6 build fixups
    668211c9f9b7 yaffs2: fix memory leak when /proc/yaffs is read
    285f911dcc1c yaffs: add strict check when call yaffs_internal_read_super
    ffc2ed489ccf yaffs: repair yaffs_get_mtd_device
    6dce4b70a5e3 yaffs: Fix build failure by handling inode i_version with proper atomic API
    19f283abc5d1 yaffs2: fix memory leak in mount/umount
    04e84672b571 yaffs: Avoid setting any ACL releated xattr
    4f221d6a32e2 Yaffs:check oob size before auto selecting Yaffs1
    81f36004e56b fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    26d7a3dd0054 yaffs2: adjust to proper location of MS_RDONLY
    a7016eac4540 yaffs2: import git revision b4ce1bb (jan, 2020)
    feb240bbb91e initramfs: allow an optional wrapper script around initramfs generation
    874746eaa341 drivers: gpu: drm: msm: registers: improve reproducibility
    1d42508faee8 tools: use basename to identify file in gen-mach-types
    4b055eca593d iwlwifi: select MAC80211_LEDS conditionally
    97e20e275ac0 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    6dec58319165 defconfigs: drop obselete options
    a416ccb5b6c9 linux-yocto: Handle /bin/awk issues
    7efe8a1e5158 uvesafb: provide option to specify timeout for task completion
    78d10ae07eca uvesafb: print error message when task timeout occurs
    80473b7eb8ca compiler.h: Undef before redefining __attribute_const__
    ddeff2f1a9a7 vmware: include jiffies.h
    3dcdda8912b4 Resolve jiffies wrapping about arp
    3b1507db6735 nfs: Allow default io size to be configured.
    c2fedad05f77 check console device file on fs when booting
    208d6fbada3f mount_root: clarify error messages for when no rootfs found
    dbe9454c8ea0 mconf: fix output of cflags and libraries
    7c7b224f5cce menuconfig,mconf-cfg: Allow specification of ncurses location
    b6c189c81397 modpost: mask trivial warnings
    a5cc21325ba9 kbuild: exclude meta directory from distclean processing
    361ec143c23f powerpc: serialize image targets
    605e6ccb304c arm: serialize build targets
    e94b04fcb7d2 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    44cc7f69a0a0 cpu/amd: inhibit SMP check for qemux86
    a08cb65331e6 x86_64_defconfig: Fix warnings
    8ad332ef777b mips: make current_cpu_data preempt safe
    754f05ddce3f mips: vdso: fix 'jalr $t9' crash in vdso code
    325ff78ff44d mips: Kconfig: add QEMUMIPS64 option
    99ae0eadcf11 4kc cache tlb hazard: tlbp cache coherency
    c6894c66a534 malta uhci quirks: make allowance for slow 4k(e)c
    8b52c01f3294 arm64: defconfig: remove CONFIG_IPQ_APSS_5018
    16c7629f035e drm/fb-helper: move zeroing code to drm_fb_helper_fill_var
    6b60c874cbb0 arm64: defconfig: cleanup config options
    8e44673ecd89 vexpress: Pass LOADADDR to Makefile
    f34e6805aad5 arm: ARM EABI socketcall
    94dec9b88de4 ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 727b7c43af5192a26b4a0690b326af45d221fa9b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 2211f78cea..2daf71600a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a20f2b5c8760fc32bd7137fbd952f7f3f810ae26"
-SRCREV_meta ?= "e8b9f0530a30d2536429c78676f09189ba5d3a50"
+SRCREV_machine ?= "28fcf1f308c59515410f6a0d0bc3278d5296a3c1"
+SRCREV_meta ?= "23e01a412ce53c2b1a9ac83d143702c7d03ec0f0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.25"
+LINUX_VERSION ?= "6.12.27"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index bfe1773e48..b1a45ab168 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.25"
+LINUX_VERSION ?= "6.12.27"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "8bdb46d18b39209344e65cd7ee24d1fa451397d5"
-SRCREV_meta ?= "e8b9f0530a30d2536429c78676f09189ba5d3a50"
+SRCREV_machine ?= "5b22e7aef539a991b75fa45101cbc02051327cb6"
+SRCREV_meta ?= "23e01a412ce53c2b1a9ac83d143702c7d03ec0f0"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index b7cfbca475..b44bb94590 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "ab61ca00dc8c8d6992d25112dadeed88b8c48bdc"
-SRCREV_machine:qemuarm64 ?= "8bdb46d18b39209344e65cd7ee24d1fa451397d5"
-SRCREV_machine:qemuloongarch64 ?= "8bdb46d18b39209344e65cd7ee24d1fa451397d5"
-SRCREV_machine:qemumips ?= "9d52a1ea29e175681780b615541b0af66f9d0d55"
-SRCREV_machine:qemuppc ?= "8bdb46d18b39209344e65cd7ee24d1fa451397d5"
-SRCREV_machine:qemuriscv64 ?= "8bdb46d18b39209344e65cd7ee24d1fa451397d5"
-SRCREV_machine:qemuriscv32 ?= "8bdb46d18b39209344e65cd7ee24d1fa451397d5"
-SRCREV_machine:qemux86 ?= "8bdb46d18b39209344e65cd7ee24d1fa451397d5"
-SRCREV_machine:qemux86-64 ?= "8bdb46d18b39209344e65cd7ee24d1fa451397d5"
-SRCREV_machine:qemumips64 ?= "54af295ab3ca402812576c8425d92dcabe9f0b0d"
-SRCREV_machine ?= "8bdb46d18b39209344e65cd7ee24d1fa451397d5"
-SRCREV_meta ?= "e8b9f0530a30d2536429c78676f09189ba5d3a50"
+SRCREV_machine:qemuarm ?= "e1aec462165a127bd7a549f77e8e955c6d38ba79"
+SRCREV_machine:qemuarm64 ?= "5b22e7aef539a991b75fa45101cbc02051327cb6"
+SRCREV_machine:qemuloongarch64 ?= "5b22e7aef539a991b75fa45101cbc02051327cb6"
+SRCREV_machine:qemumips ?= "c8eb4283f60d76e0f0e3db984bb09e1309550604"
+SRCREV_machine:qemuppc ?= "5b22e7aef539a991b75fa45101cbc02051327cb6"
+SRCREV_machine:qemuriscv64 ?= "5b22e7aef539a991b75fa45101cbc02051327cb6"
+SRCREV_machine:qemuriscv32 ?= "5b22e7aef539a991b75fa45101cbc02051327cb6"
+SRCREV_machine:qemux86 ?= "5b22e7aef539a991b75fa45101cbc02051327cb6"
+SRCREV_machine:qemux86-64 ?= "5b22e7aef539a991b75fa45101cbc02051327cb6"
+SRCREV_machine:qemumips64 ?= "8e88d1714f7f56efc4650cf84b86845d44c01eb1"
+SRCREV_machine ?= "5b22e7aef539a991b75fa45101cbc02051327cb6"
+SRCREV_meta ?= "23e01a412ce53c2b1a9ac83d143702c7d03ec0f0"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "ef4999852d307d38cfdecd91ed6892cc03beb9b8"
+SRCREV_machine:class-devupstream ?= "b801eaa96a5a2f2a8fe0b5982ffe4a1fba3c1e93"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.25"
+LINUX_VERSION ?= "6.12.27"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


