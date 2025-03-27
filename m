Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 942BDC36013
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 19:44:38 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.5467.1743104673708807774
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 12:44:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=G1M7yz/+;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2243803b776so46115885ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 12:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1743104673; x=1743709473; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bB0adn0Aw67iKHQRRBasx8OdZ77XJlvKSHwMkfj3+uA=;
        b=G1M7yz/+hUz0jTSBd5mB6gxOD5yAe0Xhgan813cZXBCw1NOMuYAttFhjq2PwF8WL1+
         A/W9SFb0QR/6R6qXtMUXTYDU3Bsf90GYhn3un2W4mH55LqvWQtzwJPTMjhVltSBrgm54
         plQY3tFm9sirAv6l7jDRO8Y3AeWOdnZBf5T0hZNNZTpKpN5HjCD523kUY/yDDotc07O4
         CkaiANwVaiI8URZ9OUvNS5i6hTKU4XWBSLL8bSkrm1gPL26BkNZ3FYLFf1lTCPDZnf6T
         HtT7aULM27rCsMZDNTNgr/5GehLyyCkikCbMYavFbLzdSczrKdKMRs1jnxHtZ2in7T0+
         qJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104673; x=1743709473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bB0adn0Aw67iKHQRRBasx8OdZ77XJlvKSHwMkfj3+uA=;
        b=lrinKtA9MlMCHCc3tMpLSwCMy6Ps7wDHxdHWZSioiAKalYmVZjx9aPtJxIMn37YHsn
         YK4hN8R0yZhuptx2F3+ad1RtahdmIgx84+7WnTNSsKyRgRyZ8ed94nid2lXD1ggvdZ56
         qDK27JV9KkuwfqJig3bPmyjjccAi6U01r04gADgLk0WaOjhyp42bChEVePir5kM+PrtX
         ezWLYVEM3gR0PNbPJvXLVWNQHfDhNxZhbSBLUk9PT2Xcs+2lTMjXfHi+ypR19VrWHlPz
         IVtXSoqhfCvPwmzHIVGFX2wc1qnEFQcsRY8BLidRyue/qm7J5Gq2djNxSDkko7grDoBd
         qUIQ==
X-Gm-Message-State: AOJu0YzoKloidFsOAtNtvIZJUXQPPaVuAjUa2OtGRX/o7XZ6RQajw59A
	XdR21rseGvi2UKD3AkYRRQVgqAmh2kmhn/B2jA/5pLfQJymvihzI9zs3uXdAOdoUqpFbDTcFA+a
	N
X-Gm-Gg: ASbGnctxQABTOkSPUihuLhW/FHSSt0QyX/6Of8BJy3Sw0guZOUHVDumluBIfML2saBP
	sI98kp5XS1z8o7v9namBT0k7wb0odonXpyrQUfnutCVKCRp9ZVxuRISnWZFBcMnPII9xHdUv08C
	0T4Kuc9iouq17QoTku5G+ugAVblMV0B2OEXmSJhBeu9wzXoAtjI11Qn9g50PB0erd1pqqd7SX+d
	O5mZoXcy+xsBfV/zTjEUaMq7gbcmQ/z9xZbiaGbzlED6x9leA9KnjCGd9LWN80VsdvQZzwD71ey
	I87Htwkz4QcBgzx0W/7p/gi1BxWRUZ8yOjs=
X-Google-Smtp-Source: AGHT+IHDLR0fM2+gG9tKrzfPrN6QqcR/WFJNF9uUzRa6/BZtXQB3nP0sqfoIEnDcPBhDYzl66xYDZQ==
X-Received: by 2002:a17:903:46c7:b0:224:8bf:6d81 with SMTP id d9443c01a7336-22804989aeamr82322205ad.46.1743104672532;
        Thu, 27 Mar 2025 12:44:32 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:811c:968e:2c1:6363])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee0882sm3865875ad.75.2025.03.27.12.44.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:44:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/10] linux-yocto/6.6: update to v6.6.78
Date: Thu, 27 Mar 2025 12:44:10 -0700
Message-ID: <d0efefc0b58827bd1810f0bb3d41eb12da6f468b.1743104524.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743104524.git.steve@sakoman.com>
References: <cover.1743104524.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 19:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213781

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    4407146cf3fc Linux 6.6.78
    e8ad068c6ab8 KVM: x86: Re-split x2APIC ICR into ICR+ICR2 for AMD (x2AVIC)
    4fc0f9eadda8 KVM: x86: Make x2APIC ID 100% readonly
    8ea0e7b3d7b8 tty: xilinx_uartps: split sysrq handling
    d113f9723f2b x86/mm/ident_map: Use gbpages only where full GB page should be mapped.
    690c7fa03ebb selftests: mptcp: join: fix AF_INET6 variable
    a77201459464 mptcp: prevent excessive coalescing on receive
    de3b8d41d254 mptcp: pm: only set fullmesh for subflow endp
    785408bbafcf cachefiles: Fix NULL pointer dereference in object->file
    893b28374aba btrfs: avoid monopolizing a core when activating a swap file
    b4e355e70e12 Revert "btrfs: avoid monopolizing a core when activating a swap file"
    94459962b862 ocfs2: check dir i_size in ocfs2_find_entry
    2cc0f0e1b976 net/ncsi: use dev_set_mac_address() for Get MC MAC Address handling
    b85a15619899 spi: atmel-qspi: Memory barriers after memory-mapped I/O
    34e7a2360c1c spi: atmel-quadspi: Create `atmel_qspi_ops` to support newer SoC families
    96c40135d8a8 MIPS: ftrace: Declare ftrace_get_parent_ra_addr() as static
    ec8aa93c30f4 rtc: zynqmp: Fix optional clock name property
    81846070cba1 ptp: Ensure info->enable callback is always set
    0228e5a6672d pinctrl: samsung: fix fwnode refcount cleanup if platform_get_irq_optional() fails
    52ad6195bdb9 rtla/timerlat_top: Stop timerlat tracer on signal
    094809f6aff4 rtla/timerlat_hist: Stop timerlat tracer on signal
    5a9eb34972cb rtla: Add trace_instance_stop
    41955b6c2681 rtla/timerlat_top: Set OSNOISE_WORKLOAD for kernel threads
    83b74901bdc9 rtla/timerlat_hist: Set OSNOISE_WORKLOAD for kernel threads
    d5eae440f718 rtla/osnoise: Distinguish missing workload option
    ee8c4c39a8f9 tracing/osnoise: Fix resetting of tracepoints
    d86c6f80972e scripts/gdb: fix aarch64 userspace detection in get_current_task
    82aa8d362a2a maple_tree: simplify split calculation
    78a73c6fe0d8 net: phy: c45-tjaxx: add delay between MDIO write and read in soft_reset
    ab9f2ec09f17 net/ncsi: wait for the last response to Deselect Package before configuring channel
    c0464bad0e85 misc: fastrpc: Fix copy buffer page size
    e563ccd6be3c misc: fastrpc: Fix registered buffer page address
    24bcf8f6f9c0 misc: fastrpc: Deregister device nodes properly in error scenarios
    3df72111c39f misc: misc_minor_alloc to use ida for all dynamic/misc dynamic minors
    5d19ca5d2591 mtd: onenand: Fix uninitialized retlen in do_otp_read()
    221e874ea5bf irqchip/apple-aic: Only handle PMC interrupt as FIQ when configured so
    069a8680af14 i3c: master: Fix missing 'ret' assignment in set_speed()
    172cdfc3a5ea NFC: nci: Add bounds checking in nci_hci_create_pipe()
    88f4311d1d5e mailbox: tegra-hsp: Clear mailbox before using message
    f2bd0f1ab478 nilfs2: fix possible int overflows in nilfs_fiemap()
    b6833b38984d ocfs2: handle a symlink read error correctly
    e763392da6b1 ocfs2: fix incorrect CPU endianness conversion causing mount failure
    e5d289c972eb pnfs/flexfiles: retry getting layout segment for reads
    7a9b86bd2261 selftests: mptcp: connect: -f: no reconnect
    03844b190811 vfio/platform: check the bounds of read/write syscalls
    644636ee7eb2 io_uring/rw: commit provided buffer state on async
    a94592ec30ff io_uring: fix io_req_prep_async with provided buffers
    130675a21942 io_uring/net: don't retry connect operation on EPOLLERR
    b86f1d51731e io_uring: fix multishots with selected buffers
    a9206d8a512e nvmem: imx-ocotp-ele: set word length to 1
    bb2b7ba5faaa nvmem: imx-ocotp-ele: fix reading from non zero offset
    cb091f37cc1c nvmem: imx-ocotp-ele: simplify read beyond device check
    0ba8ea28918b nvmem: core: improve range check for nvmem_cell_write()
    12f428f59748 nvmem: qcom-spmi-sdam: Set size in struct nvmem_config
    e914b2f795b6 crypto: qce - unregister previously registered algos in error path
    37b71cec0bda crypto: qce - fix goto jump in error path
    d5e6e3000309 ata: libata-sff: Ensure that we cannot write outside the allocated buffer
    19b22dadd487 mm: kmemleak: fix upper boundary check for physical address objects
    aed5248fe9e1 media: uvcvideo: Remove redundant NULL assignment
    5448ac02e9c0 media: uvcvideo: Support partial control reads
    53107a8f17df media: uvcvideo: Fix event flags in uvc_ctrl_send_events
    0b5e0445bc83 media: uvcvideo: Fix crash during unbind if gpio unit is in use
    1eb8e73eb4a3 media: i2c: ds90ub960: Fix logging SP & EQ status only for UB9702
    c3c9300062b6 media: i2c: ds90ub960: Fix UB9702 VC map
    45e2ad4e1253 media: i2c: ds90ub960: Fix use of non-existing registers on UB9702
    474d7baf91d3 media: i2c: ds90ub9x3: Fix extra fwnode_handle_put()
    68b645edc412 media: ccs: Fix cleanup order in ccs_probe()
    08cb112ca61b media: ccs: Fix CCS static data parsing for large block sizes
    747c04b1aac9 media: ov5640: fix get_light_freq on auto
    25abffee5ceb media: imx296: Add standby delay during probe
    3e4a43a965a8 media: mc: fix endpoint iteration
    4ab7185ad5a6 media: mmp: Bring back registration of the device
    88792f3992cb soc: qcom: smem_state: fix missing of_node_put in error path
    56eefe1f2fb7 soc: mediatek: mtk-devapc: Fix leaking IO map on error paths
    8eb80b9c9bdf iio: light: as73211: fix channel handling in only-color triggered buffer
    1d447317022e media: ccs: Clean up parsed CCS static data on parse failure
    7753ef5ba2a6 kfence: skip __GFP_THISNODE allocations on NUMA systems
    0796fa13788c rv: Reset per-task monitors also for idle tasks
    50365a6304a5 tpm: Change to kvalloc() in eventlog/acpi.c
    df6c8203f2cb ACPI: PRM: Remove unnecessary strict handler address checks
    970e92cac159 xfs: Add error handling for xfs_reflink_cancel_cow_range
    1af7697727d0 xfs: Propagate errors from xfs_reflink_cancel_cow_range in xfs_dax_write_iomap_end
    3a525fcaa1bb pwm: microchip-core: fix incorrect comparison with max period
    705f566f91ca arm64: tegra: Disable Tegra234 sce-fabric node
    b8cf1649c31d arm64: tegra: Fix typo in Tegra234 dce-fabric compatible
    73142af4e3bf crypto: qce - fix priority to be less than ARMv8 CE
    cb8612851892 arm64: dts: qcom: sm8550: correct MDSS interconnects
    a0f741013a78 arm64: dts: qcom: sm8550: Fix MPSS memory length
    27145756466f arm64: dts: qcom: sm8550: Fix CDSP memory length
    b57466d4638c arm64: dts: qcom: sm8450: Fix MPSS memory length
    29e2abea06fa arm64: dts: qcom: sm8450: Fix CDSP memory length
    e7f3016bd6f5 arm64: dts: qcom: sm8350: Fix MPSS memory length
    62692dd301ee arm64: dts: qcom: sm8350: Fix CDSP memory base and length
    18a384670b3f arm64: dts: qcom: sm8350: Fix ADSP memory base and length
    a77d7958c3ab arm64: dts: qcom: sm6375: Fix MPSS memory base and length
    91ed86aa8c8a arm64: dts: qcom: sm6375: Fix CDSP memory base and length
    7aa20f255751 arm64: dts: qcom: sm6375: Fix ADSP memory length
    4c3ada3f57ac arm64: dts: qcom: sm6350: Fix uart1 interconnect path
    f2d430edb3af arm64: dts: qcom: sm6350: Fix MPSS memory length
    601e6204cc02 arm64: dts: qcom: sm6350: Fix ADSP memory length
    d4a06764feda arm64: dts: qcom: sm6115: Fix ADSP memory base and length
    55c42a2df0b6 arm64: dts: qcom: sm6115: Fix CDSP memory length
    425d3f99fd5c arm64: dts: qcom: sm6115: Fix MPSS memory length
    5538b1b2eeb7 ARM: dts: ti/omap: gta04: fix pm issues caused by spi module
    1995976dc590 ARM: dts: dra7: Add bus_dma_limit for l4 cfg bus
    9a6550bbe419 ubi: Add a check for ubi_num
    e5fe2d01dd97 x86/boot: Use '-std=gnu11' to fix build with GCC 15
    6a42d6378387 rust: init: use explicit ABI to clean warning in future compilers
    3ae5615f48cd kbuild: Move -Wenum-enum-conversion to W=2
    7df68980e8b7 scsi: storvsc: Set correct data length for sending SCSI command without payload
    7f1e0af18198 scsi: ufs: qcom: Fix crypto key eviction
    217230bc8796 scsi: qla2xxx: Move FCE Trace buffer allocation to user control
    7bfa83ee25a6 scsi: st: Don't set pos_unknown just after device recognition
    42385f9c4c67 nvme-pci: Add TUXEDO IBP Gen9 to Samsung sleep quirk
    9db27ba3a127 nvme-pci: Add TUXEDO InfinityFlex to Samsung sleep quirk
    97bc165a0686 PCI: endpoint: Finish virtual EP removal in pci_epf_remove_vepf()
    8852e056e297 PCI: Avoid putting some root ports into D3 on TUXEDO Sirius Gen1
    ce5bcb573279 arm64: tegra: Fix Tegra234 PCIe interrupt-map
    3cef733e15cd ALSA: hda: Fix headset detection failure due to unstable sort
    125c6cb70934 ALSA: hda/realtek: Enable headset mic on Positivo C6400
    a80f82d31ca6 Revert "media: uvcvideo: Require entities to have a non-zero unique ID"
    84671b0630cc block: don't revert iter for -EIOCBQUEUED
    0b0c4d1de598 mips/math-emu: fix emulation of the prefx instruction
    53be273d8def dm-crypt: track tag_offset in convert_context
    179a3e8740a3 dm-crypt: don't update io->sector after kcryptd_crypt_write_io_submit()
    4a3909268073 powerpc/pseries/eeh: Fix get PE state translation
    cfa6d9424c0e LoongArch: Extend the maximum number of watchpoints
    18f34beba652 MIPS: Loongson64: remove ROM Size unit in boardinfo
    92f59f8b45bf serial: sh-sci: Do not probe the serial port if its slot in sci_ports[] is in use
    3b49a756b70b serial: sh-sci: Drop __initdata macro for port_cfg
    47470acd719d soc: qcom: socinfo: Avoid out of bounds read of serial number
    1f4580e049cc ASoC: acp: Support microphone from Lenovo Go S
    d4bbd291c9fe usbnet: ipheth: document scope of NCM implementation
    22475242ddb7 usbnet: ipheth: fix DPE OoB read
    ed9866898e19 usbnet: ipheth: break up NCM header size computation
    e94fb338b523 usbnet: ipheth: refactor NCM datagram loop
    92f2a8094f1f usbnet: ipheth: check that DPE points past NCM header
    8fb062178e1c usbnet: ipheth: use static NDP16 location in URB
    18bf6f5cce31 usbnet: ipheth: fix possible overflow in DPE length check
    ae7045a20d32 usb: gadget: f_tcm: Don't prepare BOT write request twice
    d0d36fb2fea5 usb: gadget: f_tcm: ep_autoconfig with fullspeed endpoint
    9ec6b25b7c7a usb: gadget: f_tcm: Decrement command ref count on cleanup
    bbe8e62f31cd usb: gadget: f_tcm: Translate error to sense
    9875dc6ef9b5 wifi: mt76: mt7915: add module param to select 5 GHz or 6 GHz on MT7916
    2955a92db595 wifi: rtw88: sdio: Fix disconnection after beacon loss
    7b279f966c3e wifi: mt76: mt7921u: Add VID/PID for TP-Link TXE50UH
    3877fc67bd3d wifi: brcmfmac: fix NULL pointer dereference in brcmf_txfinalize()
    5fb45870eba0 wifi: rtlwifi: rtl8821ae: Fix media status report
    8d02b61a0a6e HID: hid-sensor-hub: don't use stale platform-data on remove
    bcf0fb1a4600 of: reserved-memory: Fix using wrong number of cells to get property 'alignment'
    b9f177d535e8 of: Fix of_find_node_opts_by_path() handling of alias+path+options
    fe44f5f5887c of: Correct child specifier used as input of the 2nd nexus node
    0176c4af3f71 scsi: ufs: core: Fix the HIGH/LOW_TEMP Bit Definitions
    8da6b450a17f perf bench: Fix undefined behavior in cmpworker()
    b480d2b5dcc9 efi: libstub: Use '-std=gnu11' to fix build with GCC 15
    993121481b5a blk-cgroup: Fix class @block_class's subsystem refcount leakage
    fc60e9357f15 clk: mediatek: mt2701-mm: add missing dummy clk
    6f4868e6b288 clk: mediatek: mt2701-img: add missing dummy clk
    a1fa3dda6bf0 clk: mediatek: mt2701-bdp: add missing dummy clk
    20210b5c775d clk: mediatek: mt2701-aud: fix conversion to mtk_clk_simple_probe
    b6c5237ab7af clk: mediatek: mt2701-vdec: fix conversion to mtk_clk_simple_probe
    118c66164fbe clk: qcom: clk-rpmh: prevent integer overflow in recalc_rate
    ebe1322167c1 clk: qcom: gcc-mdm9607: Fix cmd_rcgr offset for blsp1_uart6 rcg
    3ad28517385e clk: qcom: dispcc-sm6350: Add missing parent_map for a clock
    08b77ed7cfaa clk: qcom: gcc-sm6350: Add missing parent_map for two clocks
    9b6c92663afe clk: qcom: gcc-sm8550: Do not turn off PCIe GDSCs during gdsc_disable()
    c242fd39dc20 clk: qcom: clk-alpha-pll: fix alpha mode configuration
    30f605e8b8de media: i2c: ds90ub960: Fix UB9702 refclk register access
    61ff966c6481 clk: sunxi-ng: a100: enable MMC clock reparenting
    aa91d5401614 Bluetooth: L2CAP: accept zero as a special value for MTU auto-selection
    245d48c1ba3e Bluetooth: L2CAP: handle NULL sock pointer in l2cap_sock_alloc
    c48f7a360f3c drm/i915: Drop 64bpp YUV formats from ICL+ SDR planes
    065385499ccf drm/komeda: Add check for komeda_get_layer_fourcc_list()
    dc4a876538e6 drm/i915: Fix page cleanup on DMA remap failure
    cce94ba65bbd drm/i915/guc: Debug print LRC state entries only if the context is pinned
    dcc3f2c06d80 Revert "drm/amd/display: Use HW lock mgr for PSR1"
    f4c931e9d203 drm/amdkfd: only flush the validate MES contex
    12457cf8e004 drm/amd/pm: Mark MM activity as unsupported
    82f59d64e629 ksmbd: fix integer overflows on 32 bit systems
    fcd06731f59f KVM: s390: vsie: fix some corner-cases when grabbing vsie pages
    125da53b3c0c KVM: Explicitly verify target vCPU is online in kvm_get_vcpu()
    b7ced74c7e93 arm64: dts: rockchip: increase gmac rx_delay on rk3399-puma
    f12f0457748c drm/rockchip: cdn-dp: Use drm_connector_helper_hpd_irq_event()
    6f796f08856e KVM: arm64: timer: Always evaluate the need for a soft timer
    d17ca8f2dfcf binfmt_flat: Fix integer overflow bug on 32 bit systems
    553fbae0effd fs/proc: do_task_stat: Fix ESP not readable during coredump
    0be6beead8c4 m68k: vga: Fix I/O defines
    44d85a423b56 s390/futex: Fix FUTEX_OP_ANDN implementation
    3c0866372ab8 smb: client: change lease epoch type from unsigned int to __u16
    7a5f926b3737 smb: client: fix order of arguments of tracepoints
    fc962f508a03 drm/modeset: Handle tiled displays in pan_display_atomic.
    af5128c9ebd7 ALSA: hda/realtek: Enable Mute LED on HP Laptop 14s-fq1xxx
    1abeeb919910 leds: lp8860: Write full EEPROM, not only half of it
    96616a37a0f6 cpufreq: s3c64xx: Fix compilation warning
    7770b2211d63 rxrpc: Fix call state set to not include the SERVER_SECURING state
    d2f275112c3a net: sched: Fix truncation of offloaded action statistics
    e8390a47a343 tun: revert fix group permission check
    1f8e3f4a4b8b netem: Update sch->q.qlen before qdisc_tree_reduce_backlog()
    db4ae2879085 ACPI: property: Fix return value for nval == 0 in acpi_data_prop_read()
    b960062afa89 x86/xen: add FRAME_END to xen_hypercall_hvm()
    242f7584da3a x86/xen: fix xen_hypercall_hvm() to not clobber %rbx
    e0384efd45f6 net: rose: lock the socket in rose_bind()
    a86f51724a10 net: atlantic: fix warning during hot unplug
    2d1637afc4eb gpio: pca953x: Improve interrupt support
    f7627c81983c rxrpc: Fix the rxrpc_connection attend queue handling
    eaf4268850dd udp: gso: do not drop small packets when PMTU reduces
    66c96550fe24 tg3: Disable tg3 PCIe AER on system reboot
    858e1feac50d vmxnet3: Fix tx queue race condition with XDP
    14a28eb9bdac ice: Add check for devm_kzalloc()
    fcb2be1b3c2d net: bcmgenet: Correct overlaying of PHY and MAC Wake-on-LAN
    40a29e84995d nvme-fc: use ctrl state getter
    ac1728cf370b ice: put Rx buffers after being done with current frame
    e31e65661c54 gpu: drm_dp_cec: fix broken CEC adapter properties check
    5848c712c82a firmware: iscsi_ibft: fix ISCSI_IBFT Kconfig entry
    795786303295 nvme: handle connectivity loss in nvme_set_queue_count
    ba32f06e15c6 net/ncsi: fix locking in Get MAC Address handling
    67515088591e net/ncsi: Add NC-SI 1.2 Get MC MAC Address command
    b9d93eda1214 KVM: e500: always restore irqs
    ba3cf83f4a50 KVM: PPC: e500: Use __kvm_faultin_pfn() to handle page faults
    59e21c4613b0 KVM: PPC: e500: Mark "struct page" pfn accessed before dropping mmu_lock
    15d60c13b704 KVM: PPC: e500: Mark "struct page" dirty in kvmppc_e500_shadow_map()
    b8261bfaebbb platform/x86: acer-wmi: Ignore AC events
    530a91be13af Input: allocate keycode for phone linking
    a9e33a054cac ASoC: amd: Add ACPI dependency to fix build error
    79b8c7c93beb ASoC: soc-pcm: don't use soc_pcm_ret() on .prepare callback
    f9c7cc44758f platform/x86: int3472: Check for adev == NULL
    d9aa993ae5ba iommu/arm-smmu-v3: Clean up more on probe failure
    cae133ab8df3 iommu/arm-smmu-qcom: add sdm670 adreno iommu compatible
    e2612a5437a0 x86/kexec: Allocate PGD for x86_64 transition page tables separately
    decefd41316b selftests/net/ipsec: Fix Null pointer dereference in rtattr_pack()
    44b4b97439a5 tipc: re-order conditions in tipc_crypto_key_rcv()
    b4f6aa16663f mmc: sdhci-msm: Correctly set the load for the regulator
    2f0fd471cc03 net: wwan: iosm: Fix hibernation by re-binding the driver around it
    4ebbcb9bc794 Bluetooth: MGMT: Fix slab-use-after-free Read in mgmt_remove_adv_monitor_sync
    c09a05b3a394 APEI: GHES: Have GHES honor the panic= setting
    1b00ccd73312 i2c: Force ELAN06FA touchpad I2C bus freq to 100KHz
    d32136e5ba2b wifi: iwlwifi: avoid memory leak
    c9480e9f2d10 wifi: brcmfmac: Check the return value of of_property_read_string_index()
    c2813471b663 net/mlx5: use do_aux_work for PHC overflow checks
    9955d4064d59 HID: Wacom: Add PCI Wacom device support
    8a68e1c374fa clk: qcom: Make GCC_8150 depend on QCOM_GDSC
    6aa0de131f53 mfd: lpc_ich: Add another Gemini Lake ISA bridge PCI device-id
    fe1c021eb03d tomoyo: don't emit warning in tomoyo_write_control()
    093286c33409 wifi: brcmsmac: add gain range check to wlc_phy_iqcal_gainparams_nphy()
    9211e3220738 mmc: core: Respect quirk_max_rate for non-UHS SDIO card
    0b41f8c84167 tun: fix group permission check
    19d452a94632 wifi: rtw89: add crystal_cap check to avoid setting as overflow value
    96fae5bd1589 safesetid: check size of policy writes
    4723df76ac9e drm/bridge: it6505: fix HDCP CTS KSV list wait timer
    a51b9affe5d6 drm/bridge: it6505: fix HDCP CTS compare V matching
    810b6f6aea59 drm/bridge: it6505: fix HDCP encryption when R0 ready
    3a4487883121 drm/bridge: it6505: fix HDCP Bstatus check
    3da5be16af92 drm/bridge: it6505: Change definition MAX_HDCP_DOWN_STREAM_COUNT
    df6fc38a37d4 drm/amd/display: Fix Mode Cutoff in DSC Passthrough to DP2.1 Monitor
    662c20e449dc drm/vc4: hdmi: use eld_mutex to protect access to connector->eld
    300c6efc95fb drm/sti: hdmi: use eld_mutex to protect access to connector->eld
    83e4ac9f87f1 drm/radeon: use eld_mutex to protect access to connector->eld
    0493070d7cee drm/exynos: hdmi: use eld_mutex to protect access to connector->eld
    ac7d01ab10f4 drm/amd/display: use eld_mutex to protect access to connector->eld
    d698cbfef632 drm/bridge: ite-it66121: use eld_mutex to protect access to connector->eld
    ad8870a64714 drm/bridge: anx7625: use eld_mutex to protect access to connector->eld
    f2196ad7c0b3 drm/connector: add mutex to protect ELD from concurrent access
    4acf6bab775d printk: Fix signed integer overflow when defining LOG_BUF_LEN_MAX
    f94036559312 drm/virtio: New fence for every plane update
    737ae6ddec9c x86/amd_nb: Restrict init function to AMD-based systems
    5fbad86fae1e lockdep: Fix upper limit for LOCKDEP_*_BITS configs
    7380819963f5 sched: Don't try to catch up excess steal time.
    3c884b6bd823 btrfs: convert BUG_ON in btrfs_reloc_cow_block() to proper error handling
    726d36347b0f btrfs: fix data race when accessing the inode's disk_i_size at btrfs_drop_extents()
    52c0b3cb6f03 s390/stackleak: Use exrl instead of ex in __stackleak_poison()
    dc5da273051e exec: fix up /proc/pid/comm in the execveat(AT_EMPTY_PATH) case
    4227ce0c5e3f arm64/mm: Ensure adequate HUGE_MAX_HSTATE
    8f5cff471039 btrfs: fix use-after-free when attempting to join an aborted transaction
    927b930f117b btrfs: fix assertion failure when splitting ordered extent after transaction abort
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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 704a47b255..942b286ed7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a9cda92a1cd1ca99003e925a35b8de15cacb4bf3"
-SRCREV_meta ?= "145708c10581d59d9bc1d280111d046647b30ef8"
+SRCREV_machine ?= "1ea3894afeb849bf7007324b6fbd7f7908d0dc30"
+SRCREV_meta ?= "8315cf9f3b698885f5c4693582d27d66c511f8c5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.77"
+LINUX_VERSION ?= "6.6.78"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 80c67c7539..4b3471f0a1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.77"
+LINUX_VERSION ?= "6.6.78"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "3c337295aa74e4422588e500b4b645936ee08894"
-SRCREV_meta ?= "145708c10581d59d9bc1d280111d046647b30ef8"
+SRCREV_machine ?= "bff737d93e7a99beb4a6e75955ff4bbe0ef2e1e6"
+SRCREV_meta ?= "8315cf9f3b698885f5c4693582d27d66c511f8c5"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index fba7c3a239..066d82406b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "53b3d025aa0db82156c29153383f2a53d8878cb3"
-SRCREV_machine:qemuarm64 ?= "3c337295aa74e4422588e500b4b645936ee08894"
-SRCREV_machine:qemuloongarch64 ?= "3c337295aa74e4422588e500b4b645936ee08894"
-SRCREV_machine:qemumips ?= "13641bd6a7816c8a847c707e401591829c118c02"
-SRCREV_machine:qemuppc ?= "3c337295aa74e4422588e500b4b645936ee08894"
-SRCREV_machine:qemuriscv64 ?= "3c337295aa74e4422588e500b4b645936ee08894"
-SRCREV_machine:qemuriscv32 ?= "3c337295aa74e4422588e500b4b645936ee08894"
-SRCREV_machine:qemux86 ?= "3c337295aa74e4422588e500b4b645936ee08894"
-SRCREV_machine:qemux86-64 ?= "3c337295aa74e4422588e500b4b645936ee08894"
-SRCREV_machine:qemumips64 ?= "55cb090e0d8ec3de48eb532da4f2c32da6302fa8"
-SRCREV_machine ?= "3c337295aa74e4422588e500b4b645936ee08894"
-SRCREV_meta ?= "145708c10581d59d9bc1d280111d046647b30ef8"
+SRCREV_machine:qemuarm ?= "2603ba7154f2fb30e30cdd5c195164d07beaa543"
+SRCREV_machine:qemuarm64 ?= "bff737d93e7a99beb4a6e75955ff4bbe0ef2e1e6"
+SRCREV_machine:qemuloongarch64 ?= "bff737d93e7a99beb4a6e75955ff4bbe0ef2e1e6"
+SRCREV_machine:qemumips ?= "d3bc10f494caff75eb0a42491f9cbf4066cf411d"
+SRCREV_machine:qemuppc ?= "bff737d93e7a99beb4a6e75955ff4bbe0ef2e1e6"
+SRCREV_machine:qemuriscv64 ?= "bff737d93e7a99beb4a6e75955ff4bbe0ef2e1e6"
+SRCREV_machine:qemuriscv32 ?= "bff737d93e7a99beb4a6e75955ff4bbe0ef2e1e6"
+SRCREV_machine:qemux86 ?= "bff737d93e7a99beb4a6e75955ff4bbe0ef2e1e6"
+SRCREV_machine:qemux86-64 ?= "bff737d93e7a99beb4a6e75955ff4bbe0ef2e1e6"
+SRCREV_machine:qemumips64 ?= "88b5fbd8c4b788b206370877e2ea23250142de2f"
+SRCREV_machine ?= "bff737d93e7a99beb4a6e75955ff4bbe0ef2e1e6"
+SRCREV_meta ?= "8315cf9f3b698885f5c4693582d27d66c511f8c5"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "c719455843a8bc3e969ba58ec92335ed7510e9fc"
+SRCREV_machine:class-devupstream ?= "4407146cf3fcfe8883f6123b89f861a11cc4e4df"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.77"
+LINUX_VERSION ?= "6.6.78"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


