Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7246BC3600E
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 18:33:10 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.3280.1742927583819535807
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Mar 2025 11:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SvsLJ2G5;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4766cb762b6so1324031cf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 11:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742927583; x=1743532383; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GGgImHL9TGVYUI8nImvg0MZcl3xTre9ecwYZtGH9EC0=;
        b=SvsLJ2G54jUy8wWjonJZ9yKfj3AyBxdDyT1PSglyy6gh5Xea9PgAP4icr2IC3A7p3I
         f97CQmMK6dN33m2AeEQhPsAbA1iEu9vtv3lyO681cAMSt0pB04qveKHf6fILA4UNSGBg
         DGN9jKMzROUDA5boljJ8G9reRmhoKzS33BxOQ5Yazkspyr5bL27GkQ6/t9HJQxCkZ5K+
         CqWJb0HoVBOJWsFE/a9rjgNorKmqgaWWUSxxg6RTjd6NIXfjc+Nhu/U9iKM10MmjHhdH
         iUgg04ugW21qtKGkTjQ+U2/sD7BdYlu2w7uOZQDieRR6CtdtpguIF7ZR70JU5fd6CgXW
         FjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742927583; x=1743532383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GGgImHL9TGVYUI8nImvg0MZcl3xTre9ecwYZtGH9EC0=;
        b=JIGa0afFprn+7AhI8PX3jSgVbg1tz0ytzd1+eDh4K3Zhk/UqggO7LnPQr5RojXi7Zr
         Kp0qMbEq0Y3KNKpIx7fTDwJKjRpgPWfx982TUMLNbTGVqViNZnXbq8WO0PExnRZnhvkU
         evdAI5oKlQyj+tBuY7m7cRuaZ9bd2bQd8rLKlUEnGiariG1E7Vg8PtFfnP9LYv2XEwti
         VfAr/fnSIW1ny3D4ZlJeD2jVwX0Pscaj6RHbMXEiik4Bcv84Vi76H6ZgEYqDkB1/PHnD
         4qrirs8RIyxV9ptwI9fSsh6czr2zeQ7o4n6uvw5V4UPoRKy0epMIivEeA/fq5g/OigDn
         Egxw==
X-Gm-Message-State: AOJu0Yzx1WmeEN9gFG0tVKPVM1uPWfBHzLBeXKAPYbznbd3TmdZfT/Ak
	Zdnz6OyeYY61cAJVHL692rfGeCOXqofxwMw9ps6zUhOsHuZ2xCh5MAP1Bi2wPys=
X-Gm-Gg: ASbGncvAAkN7OwvFLXK9Gg7PpaqDDs8IOZa/CUPiC+GQVrCHPtIF7I7hZqj3jC14+Xa
	U8EaPAIAUOhbfU4BnLbAoGMaqC09UDzha2htbOD4pLDjpShXX6jvDer5MCJTupXrn4qZppGmGxZ
	YLJJiyF9PrGtmzanyvccRZFJO19esOCvWOPQklFbGu+9KZPXBbwyTjPJ0hgu2LfwjHYiXRj+jZH
	QCmvQKfJ9j9AHiGKvY/iiurO3rO6WP5U56gWfV29f3D/bJhJ+roAx0WBSIDQV6ZCz3Ti7p1SSi/
	I0e7+eVsRu3tzBxDEUwdAgXbyVv0P1+vbLXEgnEr53KTxOE1E0x3n2DzEXBwQepi9ll825JB1hE
	XRhuCUohmqPL2XgODeZx3G1GviCRiQ8LusZQxARojftkoOpZDEXbea8Yl
X-Google-Smtp-Source: AGHT+IEks5dOn2hLYVwAxuC6JGQ9CnKqdyN8ap/TiPi/6D/j1zi7RYS0qKml5yCxRdDItplY3T4tXg==
X-Received: by 2002:a05:622a:408a:b0:476:aead:8029 with SMTP id d75a77b69052e-4775f2dd3demr13631131cf.7.1742927582294;
        Tue, 25 Mar 2025 11:33:02 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4771d18d541sm62398541cf.36.2025.03.25.11.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 11:33:01 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 1/6] linux-yocto/6.6: update to v6.6.77
Date: Tue, 25 Mar 2025 14:32:55 -0400
Message-Id: <20250325183300.3977822-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 18:33:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213607

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    c719455843a8 Linux 6.6.77
    c903f4959a59 Revert "hostfs: convert hostfs to use the new mount API"
    f55d1ee3a43c Revert "hostfs: fix string handling in __dentry_name()"
    dd942aca6445 Revert "hostfs: Add const qualifier to host_root in hostfs_fill_super()"
    fd5799f2ddd4 Revert "hostfs: fix the host directory parse when mounting."
    ef3ce4bf49dc Linux 6.6.76
    9b7f5ef4bace LoongArch: Change 8 to 14 for LOONGARCH_MAX_{BRP,WRP}
    cefbf9f892ce s390: Add '-std=gnu11' to decompressor and purgatory CFLAGS
    49b8241c5aaf btrfs: output the reason for open_ctree() failure
    1b2af918bb71 media: imx-jpeg: Fix potential error pointer dereference in detach_pm()
    dfde3d63afba staging: media: max96712: fix kernel oops when removing module
    16907219ad67 usb: gadget: f_tcm: Don't free command immediately
    cd3bbcb6b3a7 pps: Fix a use-after-free
    6c36dcd662ec media: uvcvideo: Fix double free in error path
    b32d60a852bb remoteproc: core: Fix ida_free call while not allocated
    0263fb2e7b7b mptcp: handle fastopen disconnect correctly
    7f6c72b8ef81 mptcp: consolidate suboption status
    6f10f641b489 usb: typec: tcpci: Prevent Sink disconnection before vPpsShutdown in SPR PPS
    76bae35d44f3 usb: typec: tcpm: set SRC_SEND_CAPABILITIES timeout to PD_T_SENDER_RESPONSE
    876b1bf63b6f usb: dwc3: core: Defer the probe until USB power supply ready
    0962220d7a98 usb: dwc3-am62: Fix an OF node leak in phy_syscon_pll_refclk()
    0e7fc92a0572 usb: gadget: f_tcm: Fix Get/SetInterface return value
    9e490b665ca3 drivers/card_reader/rtsx_usb: Restore interrupt based detection
    b649f0d5bc25 usb: xhci: Fix NULL pointer dereference on certain command aborts
    3c706829ceb6 net: usb: rtl8150: enable basic endpoint checking
    5e75091a93b9 ALSA: usb-audio: Add delay quirk for iBasso DC07 Pro
    fe215b8dd76c ktest.pl: Check kernelrelease return in get_version
    bab3e9f342e0 selftests/rseq: Fix handling of glibc without rseq support
    82e491e08571 netfilter: nf_tables: reject mismatching sum of field_len with set key length
    cbfb30ae17d4 kbuild: switch from lz4c to lz4 for compression
    225b88642aef Revert "SUNRPC: Reduce thread wake-up rate when receiving large RPC messages"
    18edc1d03ca0 NFSD: Reset cb_seq_status after NFS4ERR_DELAY
    0bf2adad03e1 f2fs: Introduce linear search for dentries
    aa420dee3392 hexagon: Fix unbalanced spinlock in die()
    97517cba7671 hexagon: fix using plain integer as NULL pointer warning in cmpxchg
    29f5ee6c9774 kconfig: fix memory leak in sym_warn_unmet_dep()
    582e70f1eddf kconfig: WERROR unmet symbol dependency
    487852a55a48 kconfig: deduplicate code in conf_read_simple()
    94d9ee3b85d2 kconfig: remove unused code for S_DEF_AUTO in conf_read_simple()
    26341c1bb766 kconfig: require a space after '#' for valid input
    13dc6f1692e0 kconfig: fix file name in warnings when loading KCONFIG_DEFCONFIG_LIST
    089d1c188a5a cifs: Fix getting and setting SACLs over SMB1
    32cc06a68d3a cifs: Validate EAs for WSL reparse points
    563ba1701bc1 io_uring/uring_cmd: use cached cmd_op in io_uring_cmd_sock()
    730071ea1ea7 ASoC: rockchip: i2s_tdm: Re-add the set_sysclk callback
    b730c68ea282 RISC-V: Mark riscv_v_init() as __init
    be80de30b347 hostfs: fix the host directory parse when mounting.
    1fbe93dd7e6a hostfs: Add const qualifier to host_root in hostfs_fill_super()
    86ec56b25476 hostfs: fix string handling in __dentry_name()
    d073828fe0f5 hostfs: convert hostfs to use the new mount API
    4517f37bf54e genksyms: fix memory leak when the same symbol is read from *.symref file
    9dc841e89ae0 genksyms: fix memory leak when the same symbol is added from source
    62289ebb2554 net: hsr: fix fill_frame_info() regression vs VLAN packets
    f59acc3f9441 net: sh_eth: Fix missing rtnl lock in suspend/resume path
    b1bc4a35a04c net: xdp: Disallow attaching device-bound programs in generic mode
    b01e7ceb35dc tcp: correct handling of extreme memory squeeze
    5e6e723675e5 bgmac: reduce max frame size to support just MTU 1500
    77ad90dd18ae vsock: Allow retrying on connect() failure
    3924c153761c Bluetooth: btnxpuart: Fix glitches seen in dual A2DP streaming
    d2cd915aea83 perf trace: Fix runtime error of index out of bounds
    6d3693d402a8 net: stmmac: Limit FIFO size by hardware capability
    80083bd4c214 net: stmmac: Limit the number of MTL queues to hardware capability
    2a6d1e1d022b ptp: Properly handle compat ioctls
    c411f9a5fdc9 net: davicom: fix UAF in dm9000_drv_remove
    a84d511165d6 vxlan: Fix uninit-value in vxlan_vnifilter_dump()
    b91034314ad2 net: netdevsim: try to close UDP port harness races
    51c128ba038c net: rose: fix timer races against user threads
    5385c1d1c08f iavf: allow changing VLAN state without calling PF
    02794e35ab0d PM: hibernate: Add error handling for syscore_suspend()
    b379b3162ff5 ipmr: do not call mr_mfc_uses_dev() for unres entries
    d063bec046a0 net: fec: implement TSO descriptor cleanup
    d5a17441bb38 gpio: mxc: remove dead code after switch to DT-only
    b5a8bc47aa0a net: hns3: fix oops when unload drivers paralleling
    c0f6111bb525 regulator: core: Add missing newline character
    40e25a3c0063 ubifs: skip dumping tnc tree when zroot is null
    20f0f55e6d68 rtc: loongson: clear TOY_MATCH0_REG in loongson_rtc_isr()
    9adefa7b9559 rtc: pcf85063: fix potential OOB write in PCF85063 NVMEM read
    c6e1b2cac24b xfrm: delete intermediate secpath entry in packet offload mode
    b0f47b08786d dmaengine: ti: edma: fix OF node reference leaks in edma_driver
    68a5e8b9125b xfrm: replay: Fix the update of replay_esn->oseq_hi for GSO
    9e0f793ee961 tools/bootconfig: Fix the wrong format specifier
    d49ab6857d98 LoongArch: Fix warnings during S3 suspend
    34c3ea55d1a7 NFSv4.2: mark OFFLOAD_CANCEL MOVEABLE
    cedab4047828 NFSv4.2: fix COPY_NOTIFY xdr buf size calculation
    fe616b82bc46 serial: 8250: Adjust the timeout for FIFO mode
    f4b9bc823b0c driver core: class: Fix wild pointer dereferences in API class_dev_iter_next()
    91c9ec5a208d module: Extend the preempt disabled section in dereference_symbol_descriptor().
    8e1b9201c9a2 nilfs2: protect access to buffers with no active references
    61a8a1917a4b nilfs2: convert nilfs_lookup_dirty_data_buffers to use folio_create_empty_buffers
    724dc6daebb1 buffer: make folio_create_empty_buffers() return a buffer_head
    3e6e5acf4c7d ocfs2: mark dquot as inactive if failed to start trans while releasing dquot
    e5565240c648 scsi: ufs: bsg: Delete bsg_dev when setting up bsg fails
    495dcb00d4fe scsi: mpt3sas: Set ioc->manu_pg11.EEDPTagMode directly to 1
    c994716d3391 PCI: endpoint: pci-epf-test: Fix check for DMA MEMCPY test
    48349476ae13 PCI: endpoint: pci-epf-test: Set dma_chan_rx pointer to NULL on error
    2a12efc567a2 PCI: imx6: Skip controller_id generation logic for i.MX7D
    c64da8e0ad76 PCI: imx6: Simplify clock handling by using clk_bulk*() function
    2c54b9fca175 PCI: rcar-ep: Fix incorrect variable used when calling devm_request_mem_region()
    0d3f69add24e media: dvb-usb-v2: af9035: fix ISO C90 compilation error on af9035_i2c_master_xfer
    aba54e4583f6 staging: media: imx: fix OF node leak in imx_media_add_of_subdevs()
    09ab93b4b6b2 watchdog: rti_wdt: Fix an OF node leak in rti_wdt_probe()
    7f6802ca6d13 media: nxp: imx8-isi: fix v4l2-compliance test errors
    4ca60562c0d2 mtd: hyperbus: hbmc-am654: fix an OF node reference leak
    3ec44b69e48f mtd: hyperbus: hbmc-am654: Convert to platform remove callback returning void
    2d95397b1792 mtd: rawnand: brcmnand: fix status read of brcmnand_waitfunc
    ada9f380e799 media: uvcvideo: Propagate buf->error to userspace
    6981619d56a6 media: camif-core: Add check for clk_enable()
    79bf1c4773ba media: mipi-csis: Add check for clk_enable()
    11c7649c9ec3 media: i2c: ov9282: Correct the exposure offset
    c4c35f6958de media: i2c: imx412: Add missing newline to prints
    0e4300717701 media: i2c: imx290: Register 0x3011 varies between imx327 and imx290
    88d08ca77266 media: marvell: Add check for clk_enable()
    c0f94441a1de PCI: endpoint: Destroy the EPC device in devm_pci_epc_destroy()
    dfccddd5874f media: lmedm04: Handle errors for lme2510_int_read
    eb06c7bbf172 media: rc: iguanair: handle timeouts
    e2d565d93d07 spi: omap2-mcspi: Correctly handle devm_clk_get_optional() errors
    38ac76fc06bc iommufd/iova_bitmap: Fix shift-out-of-bounds in iova_bitmap_offset_to_index()
    45e567800492 RDMA/rxe: Fix the warning "__rxe_cleanup+0x12c/0x170 [rdma_rxe]"
    07f8ce734df7 efi: sysfb_efi: fix W=1 warnings when EFI is not set
    c14c6d0a6aa4 of: reserved-memory: Do not make kmemleak ignore freed address
    6ea9e3895f8c RDMA/mlx5: Fix indirect mkey ODP page count
    60d2fb033a99 i3c: dw: Fix use-after-free in dw_i3c_master driver due to race condition
    c30508bb0b4b i3c: dw: Add hot-join support.
    e713ca2e6526 arm64: tegra: Fix DMA ID for SPI2
    35f444b3104a fbdev: omapfb: Fix an OF node leak in dss_of_port_get_parent_device()
    b2c5d45b05d2 ARM: dts: mediatek: mt7623: fix IR nodename
    fb6f0553f8dc arm64: dts: qcom: sm8250: Fix interrupt types of camss interrupts
    ad28a017b542 arm64: dts: qcom: sdm845: Fix interrupt types of camss interrupts
    c7e2f0ee4301 arm64: dts: mediatek: add per-SoC compatibles for keypad nodes
    64f51b68e296 dts: arm64: mediatek: mt8195: Remove MT8183 compatible for OVL
    30fb7a297f16 arm64: dts: qcom: sc8280xp: Fix up remoteproc register space sizes
    df5c93e0c0a0 arm64: dts: qcom: sm8150-microsoft-surface-duo: fix typos in da7280 properties
    e3ec2298c34e arm64: dts: qcom: sc7180: fix psci power domain node names
    1f11e59d464c arm64: dts: qcom: sc7180: change labels to lower-case
    78e69e507f89 arm64: dts: qcom: Add SM7125 device tree
    0789f1224758 arm64: dts: qcom: sc7180-trogdor-pompom: rename 5v-choke thermal zone
    0da37d987580 arm64: dts: qcom: sc7180-*: Remove thermal zone polling delays
    d92cbcfb10cf arm64: dts: qcom: sc7180-trogdor-quackingstick: add missing avee-supply
    4d1dccadf21b arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: remove disabled ov7251 camera
    4fa6d6e521ed arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Convert mezzanine riser to dtso
    6c59ba194002 ARM: omap1: Fix up the Retu IRQ on Nokia 770
    e746da4b0cd6 RDMA/bnxt_re: Fix to drop reference to the mmap entry in case of error
    94526fbf58c4 arm64: dts: allwinner: a64: explicitly assign clock parent for TCON0
    a5e386065e5a arm64: dts: ti: k3-am62a: Remove duplicate GICR reg
    64100cdc3df3 arm64: dts: ti: k3-am62: Remove duplicate GICR reg
    b3b30a524c46 ARM: dts: microchip: sama5d27_wlsom1_ek: Add no-1-8-v property to sdmmc0 node
    7e16a59c7672 ARM: dts: microchip: sama5d27_wlsom1_ek: Remove mmc-ddr-3_3v property from sdmmc0 node
    6919d6d65c71 arm64: dts: qcom: sm8450: correct sleep clock frequency
    a3bc622b2046 arm64: dts: qcom: sm8350: correct sleep clock frequency
    c1574f607d83 arm64: dts: qcom: sm8250: correct sleep clock frequency
    4fed5d47fe8d arm64: dts: qcom: sm6375: correct sleep clock frequency
    78b611083305 arm64: dts: qcom: sm6125: correct sleep clock frequency
    dd951e7b04bc arm64: dts: qcom: sm4450: correct sleep clock frequency
    36cded5e139d arm64: dts: qcom: sdx75: correct sleep clock frequency
    4ba4d5c19ea9 arm64: dts: qcom: sc7280: correct sleep clock frequency
    c38070e3b8a3 arm64: dts: qcom: qrb4210-rb2: correct sleep clock frequency
    29bb336761ed arm64: dts: qcom: q[dr]u1000: correct sleep clock frequency
    a2e31fadc52e arm64: dts: qcom: qcs404: correct sleep clock frequency
    d68ef84ca10d arm64: dts: qcom: msm8994: correct sleep clock frequency
    b7c8c08640d1 arm64: dts: qcom: msm8939: correct sleep clock frequency
    db975f5e7cb2 arm64: dts: qcom: msm8916: correct sleep clock frequency
    f23f69f0f224 arm64: dts: qcom: sm7225-fairphone-fp4: Drop extra qcom,msm-id value
    7e466bb7f544 arm64: dts: qcom: msm8994: Describe USB interrupts
    585081791387 arm64: dts: qcom: msm8996: Fix up USB3 interrupts
    a0753f8993cf arm64: dts: qcom: sa8775p: Update sleep_clk frequency
    74f3061e0330 arm64: dts: qcom: move common parts for sa8775p-ride variants into a .dtsi
    823536e1128b arm64: dts: qcom: sa8775p-ride: enable pmm8654au_0_pon_resin
    9316d15e7d4e arm64: dts: qcom: sa8775p-ride: Describe sgmii_phy1 irq
    0aff49ed0d2a arm64: dts: qcom: sa8775p-ride: Describe sgmii_phy0 irq
    367e43d89b91 arm64: dts: qcom: msm8996-xiaomi-gemini: Fix LP5562 LED1 reg property
    d13b39e072f8 arm64: dts: mediatek: mt8183-kukui-jacuzzi: Drop pp3300_panel voltage settings
    c144423cb07e memory: tegra20-emc: fix an OF node reference bug in tegra_emc_find_node_by_ram_code()
    5607d1e7944f ARM: dts: stm32: Swap USART3 and UART8 alias on STM32MP15xx DHCOM SoM
    cac3340a2fe4 ARM: dts: stm32: Deduplicate serial aliases and chosen node for STM32MP15xx DHCOM SoM
    2fbfacbbf6ee arm64: dts: mediatek: mt8195: Remove suspend-breaking reset from pcie1
    eb9a5a953b64 RDMA/srp: Fix error handling in srp_add_port
    3013bcfc0c2b arm64: dts: mediatek: mt8183: willow: Support second source touchscreen
    90cc73be437c arm64: dts: mediatek: mt8183: kenzo: Support second source touchscreen
    3a01e2dc9f01 RDMA/rxe: Fix mismatched max_msg_sz
    5dfd5a88823c RDMA/rxe: Improve newline in printing messages
    a332e101fcbf arm: dts: socfpga: use reset-name "stmmaceth-ocp" instead of "ahb"
    c62ceade98a0 ARM: dts: aspeed: yosemite4: correct the compatible string for max31790
    4064a22702d3 ARM: dts: aspeed: yosemite4: Add required properties for IOE on fan boards
    b94b27e715cb ARM: dts: aspeed: yosemite4: correct the compatible string of adm1272
    4b14695a7bda arm64: dts: mediatek: mt8173-evb: Fix MT6397 PMIC sub-node names
    08f2d1bcc022 arm64: dts: mediatek: mt8173-elm: Fix MT6397 PMIC sub-node names
    2495b1f85dd9 arm64: dts: mediatek: mt8195-demo: Drop regulator-compatible property
    8fad7737a92e arm64: dts: mediatek: mt8195-cherry: Drop regulator-compatible property
    a4a7aea0c4fb arm64: dts: mediatek: mt8192-asurada: Drop regulator-compatible property
    32ddffac4201 arm64: dts: mediatek: mt8173-elm: Drop regulator-compatible property
    206d385b1237 arm64: dts: mediatek: mt8173-evb: Drop regulator-compatible property
    de8d88b68d0c rdma/cxgb4: Prevent potential integer overflow on 32bit
    47b3acbf31e0 RDMA/mlx4: Avoid false error about access to uninitialized gids array
    410b99a3d062 ARM: dts: stm32: Fix IPCC EXTI declaration on stm32mp151
    434b724ce471 arm64: dts: mediatek: mt8516: reserve 192 KiB for TF-A
    a17b2390322a arm64: dts: mediatek: mt8516: add i2c clock-div property
    8c9cda5a2074 arm64: dts: mediatek: mt8516: fix wdt irq type
    5a10685c816f arm64: dts: mediatek: mt8516: fix GICv2 range
    8bea7ece086b arm64: dts: mt8183: set DMIC one-wire mode on Damu
    ac8f8cc0b2b2 arm64: dts: mediatek: mt8186: Move wakeup to MTU3 to get working suspend
    4aa4a0045753 ARM: at91: pm: change BU Power Switch to automatic mode
    5908e04d7388 soc: atmel: fix device_node release in atmel_soc_device_init()
    7f298125b365 cifs: Use cifs_autodisable_serverino() for disabling CIFS_MOUNT_SERVER_INUM in readdir.c
    3f901c35e1a1 smb: client: fix oops due to unset link speed
    6f45ef616775 padata: avoid UAF for reorder_work
    b5981c994671 padata: add pd get/put refcnt helper
    bbccae982e9f padata: fix UAF in padata_reorder
    55f75ce472ae perf lock: Fix parse_lock_type which only retrieve one lock flag
    40f8b565d595 ALSA: hda/realtek - Fixed headphone distorted sound on Acer Aspire A115-31 laptop
    670ef7b2900b bpf: tcp: Mark bpf_load_hdr_opt() arg2 as read-write
    eeef8e65041a bpf: Send signals asynchronously if !preemptible
    01220c10a7f4 pinctrl: amd: Take suspend type into consideration which pins are non-wake
    3872b4eec88a pinctrl: stm32: Add check for clk_enable()
    2e09336f352f perf report: Fix misleading help message about --demangle
    49bc44a51d72 ASoC: Intel: avs: Fix theoretical infinite loop
    5e6f12d554ae ASoC: Intel: avs: Do not readq() u32 registers
    b9db15cf2d69 ASoC: Intel: avs: Abstract IPC handling
    b5a41d42396e ASoC: Intel: avs: Prefix SKL/APL-specific members
    125066c32953 perf namespaces: Fixup the nsinfo__in_pidns() return type, its bool
    d43c2447032c perf namespaces: Introduce nsinfo__set_in_pidns()
    4318e26fe4f4 perf machine: Don't ignore _etext when not a text symbol
    8487f93db855 perf top: Don't complain about lack of vmlinux when not resolving some kernel samples
    e6e97a24de83 padata: fix sysfs store callback check
    19f17a762ebd ALSA: seq: Make dependency on UMP clearer
    7bd0bb51bd92 ALSA: seq: remove redundant 'tristate' for SND_SEQ_UMP_CLIENT
    78f2ac97823c crypto: ixp4xx - fix OF node reference leaks in init_ixp_crypto()
    cfb531141bda crypto: hisilicon/sec2 - fix for aead invalid authsize
    2309cf3f5e9d crypto: hisilicon/sec2 - fix for aead icv error
    a4cc472ea0d8 crypto: hisilicon/sec2 - optimize the error return process
    3392fa605d7c bpf: bpf_local_storage: Always use bpf_mem_alloc in PREEMPT_RT
    3c7f63d94087 ktest.pl: Remove unused declarations in run_bisect_test function
    1ee00cc23cc8 perf expr: Initialize is_test value in expr__ctx_new()
    dd95e117530e ASoC: renesas: rz-ssi: Use only the proper amount of dividers
    c7d067a47bf8 perf bpf: Fix two memory leakages when calling perf_env__insert_bpf_prog_info()
    bce9da3aca14 perf header: Fix one memory leakage in process_bpf_prog_info()
    4f2582dacad4 perf header: Fix one memory leakage in process_bpf_btf()
    3885a4d4a519 crypto: caam - use JobR's space to access page 0 regs
    e2a5487487bd selftests/bpf: Fix fill_link_info selftest on powerpc
    557065f0a493 ASoC: sun4i-spdif: Add clock multiplier settings
    ccb01198f01d libbpf: Fix segfault due to libelf functions not setting errno
    8d0c37831e28 tools/testing/selftests/bpf/test_tc_tunnel.sh: Fix wait for server bind
    3676e5741739 libbpf: don't adjust USDT semaphore address if .stapsdt.base addr is missing
    352daa50946c net/rose: prevent integer overflows in rose_setsockopt()
    617d7308bd38 tcp_cubic: fix incorrect HyStart round start detection
    88fd5db8c007 net: ethernet: ti: am65-cpsw: fix freeing IRQ in am65_cpsw_nuss_remove_tx_chns()
    e3c1a0e4ba0a netfilter: nft_flow_offload: update tcp state flags under lock
    d9aaae892d46 netfilter: nf_tables: fix set size with rbtree backend
    c80fcb6caa9b netfilter: nft_set_rbtree: prefer sync gc to async worker
    b7e81ae38643 netfilter: nft_set_rbtree: rename gc deactivate+erase function
    6f8277b97ad4 netfilter: nf_tables: de-constify set commit ops function argument
    7e2bd8c13b07 net: sched: Disallow replacing of child qdisc from one parent to another
    2f29127e94ae net: avoid race between device unregistration and ethnl ops
    f9ad8c928921 octeon_ep: remove firmware stats fetch in ndo_get_stats64
    cf7d4b9ca534 net/mlxfw: Drop hard coded max FW flash image size
    6ce38b5a6a49 net: let net.core.dev_weight always be non-zero
    627f67b6d099 selftests/landlock: Fix error message
    c7efca80bdec pwm: stm32: Add check for clk_enable()
    b8e33f0a3c86 clk: analogbits: Fix incorrect calculation of vco rate delta
    5960f4d87398 inet: ipmr: fix data-races
    1c73ffb62422 wifi: cfg80211: adjust allocation of colocated AP data
    1138cf80bbbf wifi: cfg80211: Handle specific BSSID in 6GHz scanning
    2c23036b53a0 selftests: harness: fix printing of mismatch values in __EXPECT()
    e75ae3db46b5 selftests: timers: clocksource-switch: Adapt progress to kselftest framework
    dc343336b7c0 cpufreq: ACPI: Fix max-frequency computation
    5f97a0b96e14 wifi: mt76: mt7996: fix ldpc setting
    7fd26afa1da9 wifi: mt76: mt7996: fix incorrect indexing of MIB FW event
    b9288a136a0a wifi: mt76: mt7996: fix HE Phy capability
    b20cda1df8ba wifi: mt76: mt7996: fix the capability of reception of EHT MU PPDU
    566b749f0d64 wifi: mt76: mt7996: add max mpdu len capability
    0d6961b57365 wifi: mt76: mt7996: fix register mapping
    59e4ebeb43f2 wifi: mt76: mt7915: fix register mapping
    1e474cbe5db6 wifi: mt76: mt7915: fix omac index assignment after hardware reset
    c71d2db21f15 wifi: mt76: mt7915: improve hardware restart reliability
    9d19f26ecf26 wifi: mt76: connac: move mt7615_mcu_del_wtbl_all to connac
    72eabd4c1986 wifi: mt76: mt7915: firmware restart on devices with a second pcie link
    7a249ebfc80e wifi: mt76: mt7996: fix rx filter setting for bfee functionality
    987e8224da66 wifi: mt76: mt7915: fix overflows seen when writing limit attributes
    b823e541dcc1 wifi: mt76: mt7921: fix using incorrect group cipher after disconnection.
    824813ea30a5 wifi: mt76: mt76u_vendor_request: Do not print error messages when -EPROTO
    39bb3d56f1c3 landlock: Handle weird files
    d433ccd98736 net/smc: fix data error when recvmsg with MSG_PEEK flag
    d0edcd0d18d7 clk: ralink: mtmips: remove duplicated 'xtal' clock for Ralink SoC RT3883
    cf21ef3d4308 wifi: mac80211: don't flush non-uploaded STAs
    43b67fb2fea3 wifi: mac80211: Fix common size calculation for ML element
    69226421a5bc wifi: mac80211: fix tid removal during mesh forwarding
    d36e48a4d81c wifi: mac80211: prohibit deactivating all links
    a4ba608bd427 wifi: mt76: mt7915: Fix mesh scan on MT7916 DBDC
    849fb90ccc3d wifi: wlcore: fix unbalanced pm_runtime calls
    9450b3c3c4ff samples/landlock: Fix possible NULL dereference in parse_path()
    e30d21ed451d mfd: syscon: Fix race in device_node_get_regmap()
    4bbe56ed428d mfd: syscon: Use scoped variables with memory allocators to simplify error paths
    b45fd493da18 mfd: syscon: Add of_syscon_register_regmap() API
    d6c5f73c31f0 mfd: syscon: Remove extern from function prototypes
    c2c3949cebef leds: cht-wcove: Use devm_led_classdev_register() to avoid memory leak
    68834217baaf HID: fix generic desktop D-Pad controls
    ae730deded66 HID: hid-thrustmaster: Fix warning in thrustmaster_probe by adding endpoint check
    1efa37f8b548 clk: qcom: gcc-sdm845: Do not use shared clk_ops for QUPs
    eb47144d9111 wifi: ath12k: fix tx power, max reg power update to firmware
    2851acb600d6 ipmi: ssif_bmc: Fix new request loss when bmc ready for a response
    7ec98ebb38dc OPP: OF: Fix an OF node leak in _opp_add_static_v2()
    7705d8a7f2c2 ax25: rcu protect dev->ax25_ptr
    d54308079d05 regulator: of: Implement the unwind path of of_regulator_match()
    32d90424651b clk: sunxi-ng: a64: stop force-selecting PLL-MIPI as TCON0 parent
    e121a4f42b4d clk: sunxi-ng: a64: drop redundant CLK_PLL_VIDEO0_2X and CLK_PLL_MIPI
    11f5bdeff93e dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
    184a564e6000 team: prevent adding a device which is already a team device lower
    a32da24ef8cc clk: imx8mp: Fix clkout1/2 support
    3319bebda6df cpufreq: qcom: Implement clk_ops::determine_rate() for qcom_cpufreq* clocks
    f757327c4ce6 cpufreq: qcom: Fix qcom_cpufreq_hw_recalc_rate() to query LUT if LMh IRQ is not available
    b38f66273f89 gpio: pca953x: log an error when failing to get the reset GPIO
    f66aed661bf2 gpio: pca953x: Fully convert to device managed resources
    e657dc10c4d4 gpio: pca953x: Drop unused fields in struct pca953x_platform_data
    50bcea7af924 cpufreq: schedutil: Fix superfluous updates caused by need_freq_update
    0f06dd950d04 pwm: stm32-lp: Add check for clk_enable()
    280fb099c1dd inetpeer: do not get a refcount in inet_getpeer()
    e22c073471b5 inetpeer: update inetpeer timestamp in inet_getpeer()
    cb8449c34910 inetpeer: remove create argument of inet_getpeer()
    fdaa6b3c7e36 inetpeer: remove create argument of inet_getpeer_v[46]()
    d01e6a675950 leds: netxbig: Fix an OF node reference leak in netxbig_leds_get_of_pdata()
    7fd7fd629a33 dt-bindings: mfd: bd71815: Fix rsense and typos
    97294d480d4b cpupower: fix TSC MHz calculation
    45f1432e74d1 ACPI: fan: cleanup resources in the error path of .probe()
    19958067c4be wifi: brcmfmac: add missing header include for brcmf_dbg
    3afc51492ad9 regulator: dt-bindings: mt6315: Drop regulator-compatible property
    2d259ac7e0c5 HID: multitouch: fix support for Goodix PID 0x01e9
    c2fe1678e04d wifi: rtlwifi: pci: wait for firmware loading before releasing memory
    624cea89a086 wifi: rtlwifi: fix memory leaks and invalid access at probe error path
    c37901c0c8eb wifi: rtlwifi: destroy workqueue at rtl_deinit_core
    465d01ef6962 wifi: rtlwifi: remove unused check_buddy_priv
    43c47210dae3 dt-bindings: leds: class-multicolor: Fix path to color definitions
    1ffbe3a0b816 clk: fix an OF node reference leak in of_clk_get_parent_name()
    914ef7d1a702 of: remove internal arguments from of_property_for_each_u32()
    8b84c2cee295 clk: si5351: allow PLLs to be adjusted without reset
    2321288c4357 serial: sc16is7xx: use device_property APIs when configuring irda mode
    0523ac72a8d8 dt-bindings: mmc: controller: clarify the address-cells description
    9c6702260557 rxrpc: Fix handling of received connection abort
    6bb87d8823d4 spi: zynq-qspi: Add check for clk_enable()
    833e9a1c27b8 net_sched: sch_sfq: don't allow 1 packet limit
    58ae7465f0e7 net_sched: sch_sfq: handle bigger packets
    ab18d76f7852 net_sched: sch_sfq: annotate data-races around q->perturb_period
    e95f9c408ff8 wifi: wcn36xx: fix channel survey memory allocation size
    568460c3c935 wifi: rtlwifi: usb: fix workqueue leak when probe fails
    82a843e949f7 wifi: rtlwifi: fix init_sw_vars leak when probe fails
    20893ffe7a48 wifi: rtlwifi: wait for firmware loading before releasing memory
    d8a376b7b5f5 wifi: rtlwifi: rtl8192se: rise completion of firmware loading as last step
    b304e1f7edc5 wifi: rtlwifi: do not complete firmware loading needlessly
    f4b764d99183 wifi: ath11k: Fix unexpected return buffer manager error for WCN6750/WCN6855
    4c9caf86d04d ipmi: ipmb: Add check devm_kasprintf() returned value
    20412f04bce8 genirq: Make handle_enforce_irqctx() unconditionally available
    c9d24e47419b drm/amdgpu: tear down ttm range manager for doorbell in amdgpu_ttm_fini()
    e576f132cb42 drm/bridge: it6505: Change definition of AUX_FIFO_MAX_SIZE
    41b72c3401a3 drm/msm: Check return value of of_dma_configure()
    d69ded4b4fd3 drm/msm/dpu: link DSPP_2/_3 blocks on SM8550
    d44b7452a58d drm/msm/dpu: link DSPP_2/_3 blocks on SM8350
    ab3077fe61b8 drm/msm/dpu: link DSPP_2/_3 blocks on SM8250
    4ec5e1495ffe drm/msm/dpu: link DSPP_2/_3 blocks on SC8180X
    396c05f170da drm/msm/dpu: link DSPP_2/_3 blocks on SM8150
    84ff05c9bd57 OPP: fix dev_pm_opp_find_bw_*() when bandwidth table not initialized
    eb6ffa0192ba OPP: add index check to assert to avoid buffer overflow in _read_freq()
    753c018fce5a drm/amdgpu/vcn: reset fw_shared under SRIOV
    26862f0223ef drm/rockchip: vop2: include rockchip_drm_drv.h
    b7a2cc4952d1 drm/rockchip: move output interface related definition to rockchip_drm_drv.h
    b126c585fa3a drm/rockchip: vop2: Check linear format for Cluster windows on rk3566/8
    674bb131f70b drm/rockchip: vop2: Fix the windows switch between different layers
    66eeb05b7f7d drm/rockchip: vop2: set bg dly and prescan dly at vop2_post_config
    a56ec21a2972 drm/rockchip: vop2: Set YUV/RGB overlay mode
    0b12c1f8c557 drm/rockchip: vop2: Fix the mixer alpha setup for layer 0
    556178977bfe drm/rockchip: vop2: Fix cluster windows alpha ctrl regsiters offset
    6a30634a2e0f drm/amdgpu: Fix potential NULL pointer dereference in atomctrl_get_smc_sclk_range_table
    d0c34936c3bb drm/amd/pm: Fix an error handling path in vega10_enable_se_edc_force_stall_config()
    ed3d38834764 HID: core: Fix assumption that Resolution Multipliers must be in Logical Collections
    f029961b2d47 drm/etnaviv: Fix page property being used for non writecombine buffers
    d453d03a5e71 drm/msm/dp: set safe_to_exit_level before printing it
    ccfdd3e19c79 x86/topology: Use x86_sched_itmt_flags for PKG domain unconditionally
    046cf2bacea6 x86/cpu: Enable SD_ASYM_PACKING for PKG domain on AMD
    cbef443cab0e sched/topology: Rename 'DIE' domain to 'PKG'
    32fe5c4c3e55 sched/fair: Fix value reported by hot tasks pulled in /proc/schedstat
    c0dbecb204cf perf/core: Save raw sample data conditionally based on sample type
    c89b19e96281 afs: Fix the fallback handling for the YFS.RemoveFile2 RPC call
    db996ed19901 nvme: fix bogus kzalloc() return check in nvme_init_effects_log()
    e1951c169377 select: Fix unbalanced user_access_end()
    a6cfeb1c2850 partitions: ldm: remove the initial kernel-doc notation
    525dc0f60469 nvme: Add error path for xa_store in nvme_init_effects
    136f70dc96b8 selftests/powerpc: Fix argument order to timer_sub()
    48ef61d25e79 nvme: Add error check for xa_store in nvme_get_effects_log
    df62fac30c06 pstore/blk: trivial typo fixes
    d208d2c52b65 nbd: don't allow reconnect after disconnect
    b1e537fa2307 block: retry call probe after request_module in blk_request_module
    5aa2d3a88726 fs: fix proc_handler for sysctl_nr_open
    a5e157074798 afs: Fix cleanup of immediately failed async calls
    7e8ea8e80a46 afs: Fix directory format encoding struct
    684ce13e3f1a afs: Fix EEXIST error returned from afs_rmdir() to be ENOTEMPTY
    5ee9c048089f dlm: fix srcu_read_lock() return type to int
    905507850170 powerpc/book3s64/hugetlb: Fix disabling hugetlb when fadump is active
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
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index f17fd6f76f..704a47b255 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8c0c411701e8feb7e56ec2edf5ae205b187e5457"
-SRCREV_meta ?= "2b3144e07219eb82a8a95913330a31c3c19f75e7"
+SRCREV_machine ?= "a9cda92a1cd1ca99003e925a35b8de15cacb4bf3"
+SRCREV_meta ?= "145708c10581d59d9bc1d280111d046647b30ef8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.75"
+LINUX_VERSION ?= "6.6.77"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index bfbf680202..80c67c7539 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.75"
+LINUX_VERSION ?= "6.6.77"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "0a9cf91f3319931bc037a658ab1ceb86d966ac9b"
-SRCREV_meta ?= "2b3144e07219eb82a8a95913330a31c3c19f75e7"
+SRCREV_machine ?= "3c337295aa74e4422588e500b4b645936ee08894"
+SRCREV_meta ?= "145708c10581d59d9bc1d280111d046647b30ef8"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index f0d477faf4..fba7c3a239 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "8a51a53128a5ec74564e37a6eb8a6f50430b1554"
-SRCREV_machine:qemuarm64 ?= "0a9cf91f3319931bc037a658ab1ceb86d966ac9b"
-SRCREV_machine:qemuloongarch64 ?= "0a9cf91f3319931bc037a658ab1ceb86d966ac9b"
-SRCREV_machine:qemumips ?= "2f0b854a37fa128c15cfae9a0d758c21b9c30b7d"
-SRCREV_machine:qemuppc ?= "0a9cf91f3319931bc037a658ab1ceb86d966ac9b"
-SRCREV_machine:qemuriscv64 ?= "0a9cf91f3319931bc037a658ab1ceb86d966ac9b"
-SRCREV_machine:qemuriscv32 ?= "0a9cf91f3319931bc037a658ab1ceb86d966ac9b"
-SRCREV_machine:qemux86 ?= "0a9cf91f3319931bc037a658ab1ceb86d966ac9b"
-SRCREV_machine:qemux86-64 ?= "0a9cf91f3319931bc037a658ab1ceb86d966ac9b"
-SRCREV_machine:qemumips64 ?= "f9f65cef2c04456589b1cd7a4e054b8aa331c5da"
-SRCREV_machine ?= "0a9cf91f3319931bc037a658ab1ceb86d966ac9b"
-SRCREV_meta ?= "2b3144e07219eb82a8a95913330a31c3c19f75e7"
+SRCREV_machine:qemuarm ?= "53b3d025aa0db82156c29153383f2a53d8878cb3"
+SRCREV_machine:qemuarm64 ?= "3c337295aa74e4422588e500b4b645936ee08894"
+SRCREV_machine:qemuloongarch64 ?= "3c337295aa74e4422588e500b4b645936ee08894"
+SRCREV_machine:qemumips ?= "13641bd6a7816c8a847c707e401591829c118c02"
+SRCREV_machine:qemuppc ?= "3c337295aa74e4422588e500b4b645936ee08894"
+SRCREV_machine:qemuriscv64 ?= "3c337295aa74e4422588e500b4b645936ee08894"
+SRCREV_machine:qemuriscv32 ?= "3c337295aa74e4422588e500b4b645936ee08894"
+SRCREV_machine:qemux86 ?= "3c337295aa74e4422588e500b4b645936ee08894"
+SRCREV_machine:qemux86-64 ?= "3c337295aa74e4422588e500b4b645936ee08894"
+SRCREV_machine:qemumips64 ?= "55cb090e0d8ec3de48eb532da4f2c32da6302fa8"
+SRCREV_machine ?= "3c337295aa74e4422588e500b4b645936ee08894"
+SRCREV_meta ?= "145708c10581d59d9bc1d280111d046647b30ef8"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "d51b7d37f14e76db7a1a13046ed87198c0407fcb"
+SRCREV_machine:class-devupstream ?= "c719455843a8bc3e969ba58ec92335ed7510e9fc"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.75"
+LINUX_VERSION ?= "6.6.77"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


