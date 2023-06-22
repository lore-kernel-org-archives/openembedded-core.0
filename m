Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 565EDEB64DC
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 02:36:43 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.1253.1687401393681481329
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 19:36:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=ctZQOItd;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1b539d2f969so1324035ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 19:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687401393; x=1689993393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5JIWMHjHXS9hcqpcvhhqbKrUW9CPR5rTZa4yzvyN0hY=;
        b=ctZQOItd0j6WW/8vjWzlkCsaVf5Pe3QJOHFFUTmpGJshno+rIVCgd8IRh+QhXQCG4A
         10yWjJnQqMedA2X3N+AhrT+v6YQnv2XebSQXg9vw2OZxsZ5uCp2RmUBJEahBl53C7RlN
         VODImPW87cZyaVqACtUC+61tCviBydu96UeFelDmHxfGA+BNCFlAp/G08ssACTXIp8Ol
         +kMnI0y87Ux7r2596VxfeWowoeFOE2jQYFKbkAMYiQXRIWAdQE9rX0+6FumzsIa3X/7k
         a/z3jup396oWcckdCr9KVR0Cu45oGPC854qyYHq2oiwti5ornQ6k3MABQ4FoJqZHDq8K
         ZEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687401393; x=1689993393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5JIWMHjHXS9hcqpcvhhqbKrUW9CPR5rTZa4yzvyN0hY=;
        b=EyJoiFfd/BRxaODriQWz35Ud8xpIZQxn/P/qtpLDY+If3Wu786u8EEaBv3sl4e4nSm
         staMPFqRheTn8Ga4x8mfQQiWte/T90oevSyyjleORR60YusdCFGusktI3eF2BqhYU7Fe
         IufaM6lvhbj091YPDwf52BYS9nfDzwqlN26y6Rh+JB0ZeeW+Db0WY2XD4f0XC9v8HkOd
         fAYWA2C/Tg2ZjcOmZMUul6wmYQZ913sJ6+pxjJ2iRkuLaaNBBldsnvhm3f3E2zWPHcmA
         4RZwcUH9TfjHxx/GkvCvrVyXDQaI6ubczn/pmSTqwdSzZWDPt9T0d7wY26iXm7JXOTLu
         SHlQ==
X-Gm-Message-State: AC+VfDxUfk53L3urpLJDR34LbOsmcpLCL3Z0n68UEQ0uwTfGc8iJPKXd
	7jqB1YYDHQ18Qy4kDoW6sy2U5XtKtgnScoVu2oI=
X-Google-Smtp-Source: ACHHUZ7i2uIBy/Uj5hfQ62h4UEuD5Fu425NsmMfvhGE1DJVj1z5Lbi1xmmQZBHyirGeeGKOzpwWN2Q==
X-Received: by 2002:a17:902:b7c9:b0:1b2:676d:1143 with SMTP id v9-20020a170902b7c900b001b2676d1143mr20340563plz.15.1687401391675;
        Wed, 21 Jun 2023 19:36:31 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jn9-20020a170903050900b001b679ec20f2sm4143691plb.31.2023.06.21.19.36.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 19:36:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 14/23] linux-yocto/6.1: update to v6.1.28
Date: Wed, 21 Jun 2023 16:35:46 -1000
Message-Id: <5303ddb8ee90aefd1d451bc903972914061b9ad2.1687401182.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687401182.git.steve@sakoman.com>
References: <cover.1687401182.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 02:36:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183214

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    bf4ad6fa4e53 Linux 6.1.28
    4507918cd1f8 netfilter: nf_tables: deactivate anonymous set from preparation phase
    1887a4faff5c scsi: libsas: Grab the ATA port lock in sas_ata_device_link_abort()
    6dc7e3633461 debugobject: Ensure pool refill (again)
    010842e88269 drm/amd/display (gcc13): fix enum mismatch
    915923898ffc i40e: use int for i40e_status
    8c82be552512 i40e: Remove string printing for i40e_status
    3cd9d45e87c4 i40e: Remove unused i40e status codes
    b593f157a875 sfc (gcc13): synchronize ef100_enqueue_skb()'s return type
    245653ed73e3 block/blk-iocost (gcc13): keep large values in a new enum
    40db6d172b1f perf intel-pt: Fix CYC timestamps after standalone CBR
    376e662ebb48 perf auxtrace: Fix address filter entire kernel size
    146b7251c129 wifi: ath11k: synchronize ath11k_mac_he_gi_to_nl80211_he_gi()'s return type
    d8d206beb365 bonding (gcc13): synchronize bond_{a,t}lb_xmit() types
    55c91905b9e1 thunderbolt: Use correct type in tb_port_is_clx_enabled() prototype
    e4a37e906009 cifs: protect session status check in smb2_reconnect()
    64d62ac6d651 cifs: fix potential use-after-free bugs in TCP_Server_Info::hostname
    a74406057488 blk-iocost: avoid 64-bit division in ioc_timer_fn
    7ac1a137beb3 dm: don't lock fs when the map is NULL in process of resume
    9a94ebc74c35 dm ioctl: fix nested locking in table_clear() to remove deadlock concern
    cb874a190f3f dm flakey: fix a crash with invalid table line
    3877b5c1509b dm integrity: call kmem_cache_destroy() in dm_integrity_init() error path
    21d5198c210c dm clone: call kmem_cache_destroy() in dm_clone_init() error path
    1da79e01e403 dm verity: fix error handling for check_at_most_once on FEC
    2f5aa54e4051 vhost_vdpa: fix unmap process in no-batch mode
    6b5b755463be mm/mempolicy: correctly update prev when policy is equal on mbind
    840516585c63 ia64: fix an addr to taddr in huge_pte_offset()
    7964bacf8381 s390/dasd: fix hanging blockdevice after request requeue
    9628d45a0667 btrfs: scrub: reject unsupported scrub flags
    7a0a402930ef scripts/gdb: fix lx-timerlist for Python3
    a16e9117759b clk: rockchip: rk3399: allow clk_cifout to force clk_cifout_src to reparent
    5b4052aa956e clk: microchip: fix potential UAF in auxdev release callback
    39712c8aeb79 wifi: rtw89: fix potential race condition between napi_init and napi_enable
    430933064122 wifi: rtl8xxxu: RTL8192EU always needs full init
    ead3b023aef9 mailbox: zynqmp: Fix typo in IPI documentation
    706ae665747b kcsan: Avoid READ_ONCE() in read_instrumented_memory()
    c051c472fbb5 mailbox: zynqmp: Fix IPI isr handling
    8cc1ab7de215 mtd: spi-nor: core: Update flash's current address mode when changing address mode
    f1b4affca1e1 mtd: core: fix error path for nvmem provider
    26358f330405 mtd: core: fix nvmem error reporting
    43a72c1619aa mtd: core: provide unique name for nvmem device, take two
    da4c74773079 kasan: hw_tags: avoid invalid virt_to_page()
    507fbfa79acb md/raid5: Improve performance for sequential IO
    b50fd1c3d9d0 md/raid10: fix null-ptr-deref in raid10_sync_request
    acffdf1a7fe4 drbd: correctly submit flush bio on barrier
    8d67449f907e mm: do not reclaim private data from pinned page
    25457d07c814 nilfs2: fix infinite loop in nilfs_mdt_get_block()
    a73201c607d8 nilfs2: do not write dirty data after degenerating to read-only
    4844052acb55 ALSA: hda/realtek: Fix mute and micmute LEDs for an HP laptop
    358aa78c024a ALSA: hda/realtek: support HP Pavilion Aero 13-be0xxx Mute LED
    6d57f6cc21cb ALSA: hda/realtek: Add quirk for ASUS UM3402YAR using CS35L41
    b433bfab89a5 ALSA: hda/realtek: Add quirk for ThinkPad P1 Gen 6
    9e915d81f5c1 ALSA: usb-audio: Add quirk for Pioneer DDJ-800
    fd0286717764 parisc: Ensure page alignment in flush functions
    b80b7a9bb868 parisc: Fix argument pointer in real64_call_asm()
    274c0b0c2f49 afs: Avoid endless loop if file is larger than expected
    7b6ccf752a11 afs: Fix getattr to report server i_size on dirs, not local size
    2cfce11132e4 afs: Fix updating of i_size with dv jump from server
    72f3217aa1d3 PM: hibernate: Do not get block device exclusively in test_resume mode
    208ba216cc90 PM: hibernate: Turn snapshot_test into global variable
    fc3153a91486 ACPI: PM: Do not turn of unused power resources on the Toshiba Click Mini
    fed87ce073c7 hte: tegra-194: Fix off by one in tegra_hte_map_to_line_id()
    a51e150ef998 hte: tegra: fix 'struct of_device_id' build error
    5790f76dd204 mfd: arizona-spi: Add missing MODULE_DEVICE_TABLE
    d617022971a5 mfd: ocelot-spi: Fix unsupported bulk read
    eefc8cbb6060 mfd: tqmx86: Correct board names for TQMxE39x
    4598908562ae mfd: tqmx86: Specify IO port register range more precisely
    8c989fa9e82f mfd: tqmx86: Do not access I2C_DETECT register through io_base
    b3b3f66bd47c thermal/drivers/mediatek: Use devm_of_iomap to avoid resource leak in mtk_thermal_probe
    86dfb4709490 pinctrl-bcm2835.c: fix race condition when setting gpio dir
    6107896806a6 dmaengine: at_xdmac: do not enable all cyclic channels
    a8c24a80de00 dmaengine: dw-edma: Fix to enable to issue dma request on DMA processing
    7d28c500e5bb dmaengine: dw-edma: Fix to change for continuous transfer
    502c33c7e75f dma: gpi: remove spurious unlock in gpi_ch_init
    a1f131d2e1e8 phy: ti: j721e-wiz: Fix unreachable code in wiz_mode_select()
    548113502ea0 phy: tegra: xusb: Add missing tegra_xusb_port_unregister for usb2_port and ulpi_port
    6c0df503cd2e soundwire: intel: don't save hw_params for use in prepare
    bae3248bb1ed soundwire: cadence: rename sdw_cdns_dai_dma_data as sdw_cdns_dai_runtime
    655b64724568 pwm: mtk-disp: Configure double buffering before reading in .get_state()
    7cbcb1ca53bd pwm: mtk-disp: Disable shadow registers before setting backlight values
    19f5910a1e6e leds: tca6507: Fix error handling of using fwnode_property_read_string
    8c16219c96dd dmaengine: mv_xor_v2: Fix an error code.
    60d95b747f7c pinctrl: ralink: reintroduce ralink,rt2880-pinmux compatible string
    1b50402d3a52 leds: TI_LMU_COMMON: select REGMAP instead of depending on it
    eefc7676d595 pinctrl: renesas: r8a779g0: Fix ERROROUTC function names
    d6004abdf5d6 pinctrl: renesas: r8a779g0: Fix Group 6/7 pin functions
    3727fafed747 pinctrl: renesas: r8a779g0: Fix Group 4/5 pin functions
    9af5833818c7 pinctrl: renesas: r8a779f0: Fix tsn1_avtp_pps pin group
    6a02dda05473 pinctrl: renesas: r8a779a0: Remove incorrect AVB[01] pinmux configuration
    96d440bee177 ext4: fix use-after-free read in ext4_find_extent for bigalloc + inline
    d30090eb546d ext4: fix i_disksize exceeding i_size problem in paritally written case
    32dce45c8eed SMB3: Close deferred file handles in case of handle lease break
    3aa9d065b068 SMB3: Add missing locks to protect deferred close file list
    c2b990d7aad7 timekeeping: Fix references to nonexistent ktime_get_fast_ns()
    b265609a2ad7 openrisc: Properly store r31 to pt_regs on unhandled exceptions
    369d9e8fae93 clocksource/drivers/davinci: Fix memory leak in davinci_timer_register when init fails
    07ad6cc82b3c RDMA/mlx5: Use correct device num_ports when modify DC
    43d48cec9af2 SUNRPC: remove the maximum number of retries in call_bind_status
    10dcd0ed787f RDMA/mlx5: Fix flow counter query via DEVX
    911652893751 RDMA/mlx5: Check pcie_relaxed_ordering_enabled() in UMR
    4aa9243ebe15 swiotlb: fix debugfs reporting of reserved memory pools
    e6c69b06e720 swiotlb: relocate PageHighMem test away from rmem_swiotlb_setup
    36d087e49dab Input: raspberrypi-ts - fix refcount leak in rpi_ts_probe
    ed90364b4299 clk: qcom: dispcc-qcm2290: Remove inexistent DSI1PHY clk
    86d9cafdd89a clk: qcom: dispcc-qcm2290: get rid of test clock
    c3d4119fa5f6 clk: qcom: gcc-sm8350: fix PCIe PIPE clocks handling
    b75450f51c5f clk: qcom: lpassaudiocc-sc7280: Add required gdsc power domain clks in lpass_cc_sc7280_desc
    0b421824ecda clk: qcom: lpasscc-sc7280: Skip qdsp6ss clock registration
    8f7f8d06afd6 iommu/amd: Set page size bitmap during V2 domain allocation
    c49a8c5c8b91 NFSv4.1: Always send a RECLAIM_COMPLETE after establishing lease
    9b75bd4eef4f clk: imx: imx8ulp: Fix XBAR_DIVBUS and AD_SLOW clock parents
    72ff6c115667 clk: imx: fracn-gppll: disable hardware select control
    b32bb993164b clk: imx: fracn-gppll: fix the rate table
    dce59b544370 IB/hfi1: Fix bugs with non-PAGE_SIZE-end multi-iovec user SDMA requests
    39d39bfb82ab IB/hfi1: Fix SDMA mmu_rb_node not being evicted in LRU order
    4323aaedeba3 RDMA/srpt: Add a check for valid 'mad_agent' pointer
    720c915a6298 RDMA/cm: Trace icm_send_rej event before the cm state is reset
    40b4ad4c17cb power: supply: rk817: Fix low SOC bugs
    8be358c80471 clk: qcom: gcc-sm6115: Mark RCGs shared where applicable
    e70ce2193974 RDMA/siw: Remove namespace check from siw_netdev_event()
    d3b2acaa1489 clk: add missing of_node_put() in "assigned-clocks" property parsing
    a2b3eaaa9782 power: supply: generic-adc-battery: fix unit scaling
    37f689d859ee iommu/mediatek: Set dma_mask for PGTABLE_PA_35_EN
    9163a5b4ed29 fs/ntfs3: Fix slab-out-of-bounds read in hdr_delete_de()
    17048287ac79 fs/ntfs3: Fix OOB read in indx_insert_into_buffer
    7898db22ed6c fs/ntfs3: Add check for kmemdup
    1bc6bb657dfb fs/ntfs3: Fix memory leak if ntfs_read_mft failed
    7d374becc000 RDMA/erdma: Use fixed hardware page size
    bb0433ae6fa2 rtc: k3: handle errors while enabling wake irq
    8a4e9482f45d rtc: meson-vrtc: Use ktime_get_real_ts64() to get the current time
    3ce0df349327 RDMA/mlx4: Prevent shift wrapping in set_user_sq_size()
    5f5876ae295a rtc: omap: include header for omap_rtc_power_off_program prototype
    c3c2aee6f926 workqueue: Fix hung time report of worker pools
    8fbcfff08380 clk: qcom: gcc-qcm2290: Fix up gcc_sdcc2_apps_clk_src
    bddbb3b9dc14 RDMA/rdmavt: Delete unnecessary NULL check
    a6d8529dcfee clk: mediatek: mt8135: Properly use CLK_IS_CRITICAL flag
    d193c4aea391 clk: mediatek: mt7622: Properly use CLK_IS_CRITICAL flag
    2b18f12fe6d2 clk: mediatek: Consistently use GATE_MTK() macro
    6f24e8ef3372 clk: mediatek: mt2712: Add error handling to clk_mt2712_apmixed_probe()
    23cc8191255a RDMA/siw: Fix potential page_array out of range access
    d7c8d32e5d3a IB/hifi1: add a null check of kzalloc_node in hfi1_ipoib_txreq_init
    a2290ed2afa7 clk: at91: clk-sam9x60-pll: fix return value check
    0489c2b2c310 tracing/user_events: Ensure write index cannot be negative
    6472a6d0c798 sched/rt: Fix bad task migration for rt tasks
    1969b143d096 riscv: Fix ptdump when KASAN is enabled
    e38f070a57c9 Revert "objtool: Support addition to set CFA base"
    2d44928903ed perf/core: Fix hardlockup failure caused by perf throttle
    944465c772fb sched/fair: Fix inaccurate tally of ttwu_move_affine
    46f773f39e30 powerpc/rtas: use memmove for potentially overlapping buffer copy
    8bcecadabb35 macintosh: via-pmu-led: requires ATA to be set
    5dae22c28f6c powerpc/sysdev/tsi108: fix resource printk format warnings
    89e458456c9d powerpc/wii: fix resource printk format warnings
    2f40b71e4634 powerpc/mpc512x: fix resource printk format warning
    f9325ac52f52 powerpc/perf: Properly detect mpc7450 family
    7c71aee351fe macintosh/windfarm_smu_sat: Add missing of_node_put()
    c0f49bbb305b selftests/powerpc/pmu: Fix sample field check in the mmcra_thresh_marked_sample_test
    ae69d36d4635 fbdev: mmp: Fix deferred clk handling in mmphw_probe()
    ce818ee162cf virtio_ring: don't update event idx on get_buf
    428cc252701d spmi: Add a check for remove callback when removing a SPMI driver
    ec01408c0f5d staging: rtl8192e: Fix W_DISABLE# does not work after stop/start
    7f43a5bde87b spi: cadence-quadspi: use macro DEFINE_SIMPLE_DEV_PM_OPS
    727e92fe13e8 serial: 8250: Add missing wakeup event reporting
    1ae3e5f20203 tty: serial: fsl_lpuart: adjust buffer length to the intended size
    26d40b3fca6d firmware: stratix10-svc: Fix an NULL vs IS_ERR() bug in probe
    f26273428657 usb: mtu3: fix kernel panic at qmu transfer done irq handler
    17993a13b5f6 usb: chipidea: fix missing goto in `ci_hdrc_probe`
    94fa043a47a8 usb: gadget: tegra-xudc: Fix crash in vbus_draw
    6a1cfc3036c2 sh: sq: Fix incorrect element size for allocating bitmap buffer
    ef9f85410301 uapi/linux/const.h: prefer ISO-friendly __typeof__
    9bc5e5417785 scripts/gdb: raise error with reduced debugging information
    06e661a25997 i2c: xiic: xiic_xfer(): Fix runtime PM leak on error path
    a712b5a95270 i2c: cadence: cdns_i2c_master_xfer(): Fix runtime PM leak on error path
    79acf7fb856e spi: cadence-quadspi: fix suspend-resume implementations
    eef4c4109a6d drm/panel: novatek-nt35950: Only unregister DSI1 if it exists
    08e9653bb9e8 PCI/PM: Extend D3hot delay for NVIDIA HDA controllers
    402299cca892 ASoC: fsl_mqs: move of_node_put() to the correct location
    225e81c3af9e drm/panel: novatek-nt35950: Improve error handling
    18e21fa199fc coresight: etm_pmu: Set the module field
    f0b58720f2b0 cacheinfo: Check sib_leaf in cache_leaves_are_shared()
    8ba48e58bafb HID: amd_sfh: Handle "no sensors" enabled for SFH1.1
    198474bef31f HID: amd_sfh: Increase sensor command timeout for SFH1.1
    a5e4df860d40 HID: amd_sfh: Correct the stop all command
    959f6ae96b9f HID: amd_sfh: Add support for shutdown operation
    dac12293c7f7 HID: amd_sfh: Fix illuminance value
    e66a085d900a HID: amd_sfh: Correct the sensor enable and disable command
    269259b7c7be HID: amd_sfh: Correct the structure fields
    7035d8b73af2 scripts/gdb: bail early if there are no generic PD
    ce8137636464 scripts/gdb: bail early if there are no clocks
    15b29ac9b8d5 ia64: salinfo: placate defined-but-not-used warning
    f890f34a15a1 ia64: mm/contig: fix section mismatch warning/error
    ab0f424cd2ce PCI/EDR: Clear Device Status after EDR error recovery
    3e28d59a5fee of: Fix modalias string generation
    d22b2a35729c vmci_host: fix a race condition in vmci_host_poll() causing GPF
    282efdf47279 spi: fsl-spi: Fix CPM/QE mode Litte Endian
    55a32fd96eaf interconnect: qcom: rpm: drop bogus pm domain attach
    2d0f63077f48 spi: qup: Don't skip cleanup in remove's error path
    5e678bfebb52 linux/vt_buffer.h: allow either builtin or modular for macros
    321946fa10d3 ASoC: es8316: Handle optional IRQ assignment
    873fff9fd682 PCI: imx6: Install the fault handler only on compatible match
    9de1183f3f2b ASoC: soc-compress: Inherit atomicity from DAI link for Compress FE
    df2380520926 usb: gadget: udc: renesas_usb3: Fix use after free bug in renesas_usb3_remove due to race condition
    6d16305a1535 spi: imx: Don't skip cleanup in remove's error path
    f6974fb20499 spi: atmel-quadspi: Free resources even if runtime resume failed in .remove()
    d748e32026aa spi: atmel-quadspi: Don't leak clk enable count in pm resume
    3eb8bebd02f0 serial: 8250_bcm7271: Fix arbitration handling
    1757621b873a iio: light: max44009: add missing OF device matching
    53cdfec25135 fpga: bridge: fix kernel-doc parameter description
    c996ca87cf68 serial: stm32: Re-assert RTS/DE GPIO in RS485 mode only if more data are transmitted
    3c5fafc27c02 usb: dwc3: gadget: Change condition for processing suspend event
    cd5708f6052a usb: host: xhci-rcar: remove leftover quirk handling
    9145880e8c04 pstore: Revert pmsg_lock back to a normal mutex
    70ee7b8a6d96 drivers: staging: rtl8723bs: Fix locking in rtw_scan_timeout_handler()
    2a50e44a66d2 drivers: staging: rtl8723bs: Fix locking in _rtw_join_timeout_handler()
    a61639201171 ASoC: cs35l41: Only disable internal boost
    5eb0e23ab05e ipmi: ASPEED_BT_IPMI_BMC: select REGMAP_MMIO instead of depending on it
    cb52e7f24c1d tcp/udp: Fix memleaks of sk and zerocopy skbs with TX timestamp.
    0211342dd66c net: amd: Fix link leak when verifying config failed
    f040bee2913c netlink: Use copy_to_user() for optval in netlink_getsockopt().
    952030c914b5 Revert "Bluetooth: btsdio: fix use after free bug in btsdio_remove due to unfinished work"
    fc60067260c2 ipv4: Fix potential uninit variable access bug in __ip_make_skb()
    4fbefeab88c6 net/sched: sch_fq: fix integer overflow of "credit"
    8fa6c8dad4a6 net: dpaa: Fix uninitialized variable in dpaa_stop()
    6cf1d03a423f netfilter: nf_tables: don't write table validation state without mutex
    551a26668c87 bpf: Don't EFAULT for getsockopt with optval=NULL
    c3fb321447ca bpf: Fix race between btf_put and btf_idr walk.
    ad5b2cf5d135 net: stmmac:fix system hang when setting up tag_8021q VLAN for DSA ports
    fd40d2eb5ef0 net/mlx5e: Nullify table pointer when failing to create
    15968f65081f net/mlx5: Use recovery timeout on sync reset flow
    c63830a1cc98 Revert "net/mlx5: Remove "recovery" arg from mlx5_load_one() function"
    c499593821db net/mlx5: Suspend auxiliary devices only in case of PCI device suspend
    d481a6800ba8 net/mlx5: Remove "recovery" arg from mlx5_load_one() function
    62fea2c2e4e3 net/mlx5e: Fix error flow in representor failing to add vport rx rule
    2ca9f9b837ce net/mlx5: E-switch, Don't destroy indirect table in split rule
    8b5f69628872 net/mlx5: E-switch, Create per vport table based on devlink encap mode
    c382b693ffcb net/mlx5e: Don't clone flow post action attributes second time
    707a31951f7a ixgbe: Enable setting RSS table to default values
    c8b37d2b5b1d ixgbe: Allow flow hash to be set via ethtool
    37f64bc8e001 wifi: iwlwifi: fw: fix memory leak in debugfs
    80c5ba0078e2 netfilter: conntrack: fix wrong ct->timeout value
    6a62a2a09c41 netfilter: conntrack: restore IPS_CONFIRMED out of nf_conntrack_hash_check_insert()
    d6e03af0a4c3 wifi: iwlwifi: mvm: check firmware response size
    180c4ae0de9d wifi: mt76: connac: fix txd multicast rate setting
    d365e1448398 wifi: mt76: mt7921e: stop chip reset worker in unregister hook
    741bf262bdba wifi: mt76: mt7921e: improve reliability of dma reset
    1ab837a34229 wifi: mt76: mt7921: fix missing unwind goto in `mt7921u_probe`
    11181b6c8641 mt76: mt7921: fix kernel panic by accessing unallocated eeprom.data
    c42efff8208a wifi: mt76: fix 6GHz high channel not be scanned
    c5cdab3c045f wifi: mt76: mt7921e: fix probe timeout after reboot
    27ce664b7f49 wifi: mt76: add flexible polling wait-interval support
    710f3c7fb3e2 wifi: mt76: handle failure of vzalloc in mt7615_coredump_work
    9c036152adf8 wifi: mt76: mt7915: expose device tree match table
    bd5121ef1842 wifi: iwlwifi: make the loop for card preparation effective
    5611be6c3d9c io_uring/rsrc: use nospec'ed indexes
    f1bd3414d97c jdb2: Don't refuse invalidation of already invalidated buffers
    f6b46f843829 wifi: iwlwifi: fw: move memset before early return
    6b345ddd4939 wifi: iwlwifi: mvm: initialize seq variable
    243f6d6ba585 wifi: iwlwifi: yoyo: Fix possible division by zero
    7c31103f7f30 wifi: iwlwifi: yoyo: skip dump correctly on hw error
    164acf216c18 wifi: iwlwifi: mvm: don't drop unencrypted MCAST frames
    8f3382624c45 md/raid10: don't call bio_start_io_acct twice for bio which experienced read error
    36ba0c7b86ac md/raid10: fix memleak of md thread
    b21019a220d9 md/raid10: fix memleak for 'conf->bio_split'
    11141630f03e md/raid10: fix leak of 'r10bio->remaining' for recovery
    9050576bff9f md/raid10: fix task hung in raid10d
    df6222b01f53 f2fs: fix to check return value of inc_valid_block_count()
    2eb5d0165b36 f2fs: fix to check return value of f2fs_do_truncate_blocks()
    a8091dc8149e bpf, sockmap: Revert buggy deadlock fix in the sockhash and sockmap
    339d14334a13 wifi: iwlwifi: mvm: don't set CHECKSUM_COMPLETE for unsupported protocols
    6f14a945011e wifi: iwlwifi: trans: don't trigger d3 interrupt twice
    8e5d05ca1527 wifi: iwlwifi: debug: fix crash in __iwl_err()
    6aa401a654fd blk-mq: don't plug for head insertions in blk_execute_rq_nowait
    3c0b7993461a selftests/bpf: Fix leaked bpf_link in get_stackid_cannot_attach
    67c81ecbf723 selftests/bpf: Use read_perf_max_sample_freq() in perf_event_stackmap
    160fcf5c6b17 nvme-fcloop: fix "inconsistent {IN-HARDIRQ-W} -> {HARDIRQ-ON-W} usage"
    0f1c4ae80d14 nvme: fix async event trace event
    1e4f23c61feb nvmet: fix I/O Command Set specific Identify Controller
    fd95ae3bb8a6 nvmet: fix Identify Active Namespace ID list handling
    4898a8d6b16b nvmet: fix Identify Controller handling
    4a7a14e87cca nvmet: fix Identify Namespace handling
    b743d68c9fbd nvmet: fix error handling in nvmet_execute_identify_cns_cs_ns()
    1d4ac7b0ffc9 bpf, sockmap: fix deadlocks in the sockhash and sockmap
    cfc7ee210f2f wifi: ath11k: fix writing to unintended memory region
    f43744872a04 net: ethernet: stmmac: dwmac-rk: fix optional phy regulator handling
    c649bf43a28e net: ethernet: stmmac: dwmac-rk: rework optional clock handling
    e6f1ef4a5385 scsi: lpfc: Fix ioremap issues in lpfc_sli4_pci_mem_setup()
    52c3d68d9910 bpf/btf: Fix is_int_ptr()
    1f1267ce0b0e wifi: iwlwifi: fix duplicate entry in iwl_dev_info_table
    7d058f0ab161 f2fs: fix to avoid use-after-free for cached IPU bio
    3ee343914c1f xsk: Fix unaligned descriptor validation
    8bc8e34e8017 crypto: drbg - Only fail when jent is unavailable in FIPS mode
    81366e333c7e bpftool: Fix bug for long instructions in program CFG dumps
    d199c2b3943e selftests/bpf: Wait for receive in cg_storage_multi test
    751168d0d2a0 selftests: xsk: Deflakify STATS_RX_DROPPED test
    0ea59567d001 selftests: xsk: Disable IPv6 on VETH1
    30a4ff7eb4bf selftests: xsk: Use correct UMEM size in testapp_invalid_desc
    90d2f5225d13 net: qrtr: correct types of trace event parameters
    a7f5be2ac004 f2fs: fix iostat lock protection
    bea3f8aa9993 wifi: rt2x00: Fix memory leak when handling surveys
    828439964f94 scsi: hisi_sas: Handle NCQ error when IPTT is valid
    cd94f74888f2 scsi: libsas: Add sas_ata_device_link_abort()
    f7871c9df18c wifi: rtlwifi: fix incorrect error codes in rtl_debugfs_set_write_reg()
    4eb666646c40 wifi: rtlwifi: fix incorrect error codes in rtl_debugfs_set_write_rfreg()
    7f6714fc2ac8 crypto: sa2ul - Select CRYPTO_DES
    be421554994b crypto: caam - Clear some memory in instantiate_rng
    74f74c8b8419 f2fs: fix scheduling while atomic in decompression path
    6604df2a9d07 f2fs: compress: fix to call f2fs_wait_on_page_writeback() in f2fs_write_raw_pages()
    88fccb8d0c8a f2fs: apply zone capacity to all zone type
    d9e30b8ed41b f2fs: fix uninitialized skipped_gc_rwsem
    61fbf097b7df f2fs: handle dqget error in f2fs_transfer_project_quota()
    10f7b4975b4b net: sunhme: Fix uninitialized return code
    e3e55385fa53 scsi: megaraid: Fix mega_cmd_done() CMDID_INT_CMDS
    770c3fd4d732 scsi: target: iscsit: Fix TAS handling during conn cleanup
    eacfe32c3650 scsi: target: Fix multiple LUN_RESET handling
    cc84bbdde901 scsi: target: iscsit: Stop/wait on cmds during conn close
    edd90020711e scsi: target: iscsit: isert: Alloc per conn cmd counter
    b7ca8ded3731 scsi: target: Pass in cmd counter to use during cmd setup
    741443436ed8 scsi: target: Move cmd counter allocation
    76b77646f171 scsi: target: Move sess cmd counter to new struct
    87ee7227cce3 scsi: target: core: Change the way target_xcopy_do_work() sets restiction on max I/O
    f9361cf40b4d bpf: Fix __reg_bound_offset 64->32 var_off subreg propagation
    2361aee1c52c netfilter: keep conntrack reference until IPsecv6 policy checks are done
    8d05f25475a2 net: dsa: qca8k: remove assignment of an_enabled in pcs_get_state()
    c997f28917da libbpf: Fix ld_imm64 copy logic for ksym in light skeleton.
    382310d9c82e net/packet: convert po->auxdata to an atomic flag
    3eae0f4c3129 net/packet: convert po->origdev to an atomic flag
    f2d971608a88 net/packet: annotate accesses to po->xmit
    c3ee3540a133 vlan: partially enable SIOCSHWTSTAMP in container
    07782db81e08 net: pcs: xpcs: remove double-read of link state when using AN
    157c84b793e7 bpf: Remove misleading spec_v1 check on var-offset stack read
    b73438a4a63f selftests/bpf: Fix a fd leak in an error path in network_helpers.c
    0324300dce34 wifi: ath11k: fix deinitialization of firmware resources
    af5265c64d8a scm: fix MSG_CTRUNC setting condition for SO_PASSSEC
    1f1fba8b3a75 crypto: qat - fix concurrency issue when device state changes
    a62ba7e0d2e8 bpf: fix precision propagation verbose logging
    0049d2eddaf3 bpf: take into account liveness when propagating precision
    78eee85913e7 wifi: rtw88: mac: Return the original error from rtw_mac_power_switch()
    154d4d630ef0 wifi: rtw88: mac: Return the original error from rtw_pwr_seq_parser()
    1c8f46578d03 tools: bpftool: Remove invalid \' json escape
    644df7e865e7 wifi: ath6kl: reduce WARN to dev_dbg() in callback
    0022a3936e4d wifi: brcmfmac: support CQM RSSI notification with older firmware
    9354826c02e0 wifi: ath11k: fix SAC bug on peer addition with sta band migration
    76f9b0d6f01d wifi: ath5k: fix an off by one check in ath5k_eeprom_read_freq_list()
    7e5f42abfc85 wifi: ath5k: Use platform_get_irq() to get the interrupt
    7d3fd8da721f wifi: ath11k: Use platform_get_irq() to get the interrupt
    9b9356a30141 wifi: ath9k: hif_usb: fix memory leak of remain_skbs
    1a59067bde3f wifi: ath6kl: minor fix for allocation size
    830d79af9eee platform/chrome: cros_typec_switch: Add missing fwnode_handle_put()
    aefea3016a15 hwmon: (pmbus/fsp-3y) Fix functionality bitmask in FSP-3Y YM-2151E
    d29faefa8d21 rpmsg: glink: Propagate TX failures in intentless mode as well
    2f51bac27678 cpufreq: use correct unit when verify cur freq
    0985838a9c87 ACPI: bus: Ensure that notify handlers are not running after removal
    290e26ec0d01 tick/common: Align tick period with the HZ tick.
    0fe6ef82e4f4 drm/i915: Make intel_get_crtc_new_encoder() less oopsy
    fc2b20c0921f debugobject: Prevent init race with static objects
    1d1735c6fbfd media: mediatek: vcodec: add remove function for decoder platform driver
    c692a44bc514 media: mediatek: vcodec: fix decoder disable pm crash
    54e85ee2b40d perf/arm-cmn: Fix port detection for CMN-700
    a8897bffca64 arm64: kgdb: Set PSTATE.SS to 1 to re-enable single-step
    3df8a8739415 x86/ioapic: Don't return 0 from arch_dynirq_lower_bound()
    f25994f7a9ad regulator: stm32-pwr: fix of_iomap leak
    16c7fcbfe058 media: venus: dec: Fix capture formats enumeration order
    1e229899e3ea media: venus: dec: Fix handling of the start cmd
    b21a9a57c74e media: rc: gpio-ir-recv: Fix support for wake-up
    b75aaebac265 drm/amd/display: Fix potential null dereference
    fd22e8c8c38f media: hi846: Fix memleak in hi846_init_controls()
    893b267ccc4a media: v4l: async: Return async sub-devices to subnotifier list
    45b7461d914c media: rcar_fdp1: Fix refcount leak in probe and remove function
    affad9e79101 media: platform: mtk-mdp3: fix potential frame size overflow in mdp_try_fmt_mplane()
    5a72aea9acfe media: saa7134: fix use after free bug in saa7134_finidev due to race condition
    305262a23c94 media: dm1105: Fix use after free bug in dm1105_remove due to race condition
    1495945f7c93 platform/x86/amd: pmc: Move out of BIOS SMN pair for STB init
    1603a098b474 platform/x86/amd: pmc: Utilize SMN index 0 for driver probe
    f82af0dd225f platform/x86/amd: pmc: Move idlemask check into `amd_pmc_idlemask_read`
    4e6c35193af6 platform/x86/amd: pmc: Don't dump data after resume from s0i3 on picasso
    abfb0ff8706e platform/x86/amd: pmc: Hide SMU version and program attributes for Picasso
    d1dbf5b7ea45 platform/x86/amd: pmc: Don't try to read SMU version on Picasso
    1c1798c45b40 platform/x86/amd/pmf: Move out of BIOS SMN pair for driver probe
    6a17add9c610 media: rkvdec: fix use after free bug in rkvdec_remove
    2cdc8f729d95 media: cedrus: fix use after free bug in cedrus_remove due to race condition
    231a6947ff84 media: mediatek: vcodec: change lat thread decode error condition
    b02cd74741d9 media: mediatek: vcodec: making sure queue_work successfully
    60fe2a3d6dc8 media: mediatek: vcodec: remove unused lat_buf
    8be5ead0b314 media: mediatek: vcodec: add core decode done event
    894278b772b8 media: mediatek: vcodec: move lat_buf to the top of core list
    f08900ca36d3 media: mediatek: vcodec: using each instance lat_buf count replace core ready list
    8aae2e6444a3 media: mediatek: vcodec: add params to record lat and core lat_buf count
    01dc8f41fc7b media: mediatek: vcodec: Force capture queue format to MM21
    4d5c8a891630 media: mediatek: vcodec: Make MM21 the default capture format
    5c4cc91b77ee media: mediatek: vcodec: Use 4K frame size when supported by stateful decoder
    0333177548fd arm64: dts: sc7280: Rename qspi data12 as data23
    edbbd78148e7 arm64: dts: sc7180: Rename qspi data12 as data23
    39f6de10df32 arm64: dts: qcom: msm8994-angler: removed clash with smem_region
    57aa05d59b56 arm64: dts: qcom: msm8994-angler: Fix cont_splash_mem mapping
    7eaa457d1e71 x86/apic: Fix atomic update of offset in reserve_eilvt_offset()
    849ab4cf182b regulator: core: Avoid lockdep reports when resolving supplies
    fd092b355ac8 regulator: core: Consistently set mutex_owner when using ww_mutex_lock_slow()
    d2151c5d9dbe drm/ttm/pool: Fix ttm_pool_alloc error path
    5e5a4185c66f drm/ttm: optimize pool allocations a bit v2
    dfd1c26e40b5 arm64: dts: qcom: apq8096-db820c: drop unit address from PMI8994 regulator
    3a0c0f7c2f71 arm64: dts: qcom: msm8994-msft-lumia-octagon: drop unit address from PMI8994 regulator
    3c8cb6155ac0 arm64: dts: qcom: msm8994-kitakami: drop unit address from PMI8994 regulator
    f3694202d9ce arm64: dts: qcom: sc7180-trogdor-pazquel: correct trackpad supply
    f89b2591bb2b arm64: dts: qcom: sc7180-trogdor-lazor: correct trackpad supply
    d7d13d353acf arm64: dts: qcom: sc7280-herobrine-villager: correct trackpad supply
    958c6cbc3299 gpu: host1x: Fix memory leak of device names
    b81cfee96703 gpu: host1x: Fix potential double free if IOMMU is disabled
    62cb9c468dc9 soc: renesas: renesas-soc: Release 'chipid' from ioremap()
    724911eeaef4 soc: bcm: brcmstb: biuctrl: fix of_iomap leak
    4cf71779ead4 mailbox: mpfs: switch to txdone_poll
    41a51318ab37 drm/mediatek: dp: Change the aux retries times when receiving AUX_DEFER
    e80c69eb795f drm/lima/lima_drv: Add missing unwind goto in lima_pdev_probe()
    a260921b81b0 ACPI: VIOT: Initialize the correct IOMMU fwspec
    1a258bfa00f1 arm64: dts: mediatek: mt8192-asurada: Fix voltage constraint for Vgpu
    82f6ffb8e0fd cpufreq: qcom-cpufreq-hw: Revert adding cpufreq qos
    2e8aad9cd52a cpufreq: mediatek: Raise proc and sram max voltage for MT7622/7623
    9a5fa6333fac cpufreq: mediatek: raise proc/sram max voltage for MT8516
    4bacdbd7d937 cpufreq: mediatek: fix KP caused by handler usage after regulator_put/clk_put
    bd1c00687249 cpufreq: mediatek: fix passing zero to 'PTR_ERR'
    f977dbefeaea arm64: dts: apple: t8103: Disable unused PCIe ports
    eb617ab02334 ARM: dts: stm32: fix spi1 pin assignment on stm32mp15
    7ff92db0dd6f perf/arm-cmn: Move overlapping wp_combine field
    198ca89deaed firmware: arm_scmi: Fix xfers allocation on Rx channel
    da3babe96be7 ARM: dts: gta04: fix excess dma channel usage
    fd67875ebaea drm: rcar-du: Fix a NULL vs IS_ERR() bug
    46a1c9ba908f arm64: dts: qcom: sm8450: fix pcie1 gpios properties name
    98893ae40bc5 mmc: sdhci-of-esdhc: fix quirk to ignore command inhibit for data
    1975bf02595e ACPI: processor: Fix evaluating _PDC method when running as Xen dom0
    a24194121e7f drm/amd/display/dc/dce60/Makefile: Fix previous attempt to silence known override-init warnings
    acd8f2efa29e arm64: dts: qcom: sm8350-microsoft-surface: fix USB dual-role mode property
    577a64725bfd virt/coco/sev-guest: Double-buffer messages
    02891701516b drm: msm: adreno: Disable preemption on Adreno 510
    a8d2b469541f drm/msm/adreno: drop bogus pm_runtime_set_active()
    a9b3ef13ebdd arm64: dts: ti: k3-am62a7: Correct L2 cache size to 512KB
    fe9dc0a2643e arm64: dts: ti: k3-am625: Correct L2 cache size to 512KB
    1e9fc6c47321 media: max9286: Free control handler
    052d22acd7da drm/bridge: adv7533: Fix adv7533_mode_valid for adv7533 and adv7535
    1f141fe5153a firmware: qcom_scm: Clear download bit during reboot
    423350af9e27 media: av7110: prevent underflow in write_ts_to_decoder()
    0883003ffb5e media: amphion: decoder implement display delay enable
    51fc1880e474 media: platform: mtk-mdp3: Add missing check and free for ida_alloc
    c2e55481731b media: bdisp: Add missing check for create_workqueue
    ba8ffb1251eb x86/MCE/AMD: Use an u64 for bank_map
    c0a8025c746d ARM: dts: qcom: sdx55: Fix the unit address of PCIe EP node
    2b5325f9cce6 ARM: dts: qcom: ipq8064: Fix the PCI I/O port range
    2ebb3f120e34 ARM: dts: qcom: ipq4019: Fix the PCI I/O port range
    671c3a4d7d84 arm64: dts: qcom: sm8450: Fix the PCI I/O port range
    5334324f097d arm64: dts: qcom: sm8150: Fix the PCI I/O port range
    be8101493607 arm64: dts: qcom: sm8250: Fix the PCI I/O port range
    87397ffbc9bb arm64: dts: qcom: msm8996: Fix the PCI I/O port range
    c8178285ba1a arm64: dts: qcom: ipq6018: Fix the PCI I/O port range
    7803b357d9e2 arm64: dts: qcom: ipq8074: Fix the PCI I/O port range
    ec67a4ef28ea arm64: dts: qcom: sc7280: Fix the PCI I/O port range
    a35d6fdd7f60 arm64: dts: qcom: msm8998: Fix the PCI I/O port range
    6035794dd2de arm64: dts: qcom: sdm845: Fix the PCI I/O port range
    44018ad5f230 arm64: dts: qcom: sdm845: correct dynamic power coefficients
    7cb080295476 arm64: dts: qcom: sc7280: fix EUD port properties
    bd90d249bceb arm64: dts: qcom: msm8998: Fix stm-stimulus-base reg name
    6c6a69f82281 arm64: dts: broadcom: bcmbca: bcm4908: fix procmon nodename
    1be866857a3f arm64: dts: broadcom: bcmbca: bcm4908: fix LED nodenames
    c0454f814b36 arm64: dts: broadcom: bcmbca: bcm4908: fix NAND interrupt name
    93c22d107a3e arm64: dts: ti: k3-j721e-main: Remove ti,strobe-sel property
    5ea54b26d6e3 arm64: dts: ti: k3-am62a7-sk: Fix DDR size to full 4GB
    5d77e665ee21 arm64: dts: ti: k3-am62-main: Fix GPIO numbers in DT
    d585d1072eab regulator: core: Shorten off-on-delay-us for always-on/boot-on by time since booted
    36ecd6c6ed52 ARM: dts: qcom-apq8064: Fix opp table child name
    6006310a472d EDAC/skx: Fix overflows on the DRAM row address mapping arrays
    2c8c8398e19e drm/msm/disp/dpu: check for crtc enable rather than crtc active to release shared resources
    6524d3d58797 drm/mediatek: dp: Only trigger DRM HPD events if bridge is attached
    6fcfd2861fd8 arm64: dts: renesas: r9a07g043: Update IRQ numbers for SSI channels
    14c480b2f382 arm64: dts: renesas: r9a07g043: Introduce SOC_PERIPHERAL_IRQ() macro to specify interrupt property
    e83e635becb9 arm64: dts: renesas: r9a07g054: Update IRQ numbers for SSI channels
    684fecd4f332 arm64: dts: renesas: r9a07g044: Update IRQ numbers for SSI channels
    dc062516db36 arm64: dts: renesas: r8a774c0: Remove bogus voltages from OPP table
    c82f50e55f4e arm64: dts: renesas: r8a77990: Remove bogus voltages from OPP table
    6dbcc493a18d soc: ti: pm33xx: Fix refcount leak in am33xx_pm_probe
    f5222fbd797e tools/x86/kcpuid: Fix avx512bw and avx512lvl fields in Fn00000007
    78e32896ecc7 drm/amdgpu: register a vga_switcheroo client for MacBooks with apple-gmux
    809a3fb8d8fc drm/probe-helper: Cancel previous job before starting new one
    6bd38a1454d9 drm/vgem: add missing mutex_destroy
    46473f3bd14a drm/i915/dg2: Drop one PCI ID
    86a77cef0959 drm/rockchip: Drop unbalanced obj unref
    0955b8eac335 erofs: fix potential overflow calculating xattr_isize
    50f1c1fba045 erofs: initialize packed inode after root inode is assigned
    7ee7a86e28ce erofs: stop parsing non-compact HEAD index if clusterofs is invalid
    fe2f093b051c tpm, tpm_tis: Claim locality when interrupts are reenabled on resume
    380f9f79b493 tpm, tpm: Implement usage counter for locality
    71becf3ffea6 tpm, tpm_tis: Claim locality before writing interrupt registers
    0085052a2c27 tpm, tpm_tis: Disable interrupts if tpm_tis_probe_irq() failed
    10eea3cfda29 tpm, tpm_tis: Claim locality before writing TPM_INT_ENABLE register
    12839c326ae5 tpm, tpm_tis: Do not skip reset of original interrupt vector
    784c206c66df selinux: ensure av_permissions.h is built when needed
    5453f22911cb selinux: fix Makefile dependencies of flask.h
    74f77a799dad selftests/resctrl: Check for return value after write_schemata()
    bceef0c7f6ed selftests/resctrl: Allow ->setup() to return errors
    7a570dda1d5a selftests/resctrl: Move ->setup() call outside of test specific branches
    0bf90aac4341 selftests/resctrl: Return NULL if malloc_and_init_memory() did not alloc mem
    ae6803b66365 rcu: Fix missing TICK_DEP_MASK_RCU_EXP dependency check
    05f437eba011 kunit: fix bug in the order of lines in debugfs logs
    9ad3b3867730 kunit: improve KTAP compliance of KUnit test output
    d0e2f01b534f ASoC: dt-bindings: qcom,lpass-rx-macro: correct minItems for clocks
    a2cbb1a45a0c bus: mhi: host: Range check CHDBOFF and ERDBOFF
    4afe300afb37 bus: mhi: host: Use mhi_tryset_pm_state() for setting fw error state
    cc3e7c033367 bus: mhi: host: Remove duplicate ee check for syserr
    a6f5c84b41aa cxl/hdm: Fail upon detecting 0-sized decoders
    0ae98a8b4f00 xfs: don't consider future format versions valid
    2b2515b8095c ceph: fix potential use-after-free bug when trimming caps
    9f565752b328 ubifs: Fix memory leak in do_rename
    29738e1bcc79 ubifs: Free memory for tmpfile name
    884e961674b5 ubi: Fix return value overwrite issue in try_write_vid_and_data()
    ef9aac603659 ubifs: Fix memleak when insert_old_idx() failed
    18c234685603 Revert "ubifs: dirty_cow_znode: Fix memleak in error handling path"
    ccfe86622082 RISC-V: Align SBI probe implementation with spec
    f8076d2a7fce iommu/amd: Fix "Guest Virtual APIC Table Root Pointer" configuration in IRTE
    f455c9cb9eed drm/amd/pm: re-enable the gfx imu when smu resume
    d78777c1d4de swsmu/amdgpu_smu: Fix the wrong if-condition
    d79d3430e174 tracing: Fix permissions for the buffer_percent file
    339dd534f21d riscv: mm: remove redundant parameter of create_fdt_early_page_table
    3c96dd239ae4 i2c: omap: Fix standard mode false ACK readings
    142a975738f7 ACPI: video: Remove acpi_backlight=video quirk for Lenovo ThinkPad W530
    18973b73fa51 ksmbd: fix deadlock in ksmbd_find_crypto_ctx()
    1f0490586544 ksmbd: not allow guest user on multichannel
    c3a3259675a6 ksmbd: fix memleak in session setup
    a70751dd7b60 ksmbd: fix NULL pointer dereference in smb2_get_info_filesystem()
    b80422474ffe ksmbd: call rcu_barrier() in ksmbd_server_exit()
    bd80d35725a0 ksmbd: fix racy issue under cocurrent smb2 tree disconnect
    cec378687a5a KVM: RISC-V: Retry fault if vma_lookup() results become invalid
    e43cf7abece2 drm/amd/display: fix a divided-by-zero error
    09c41688b6e5 drm/amd/display: fix PSR-SU/DSC interoperability support
    2abff94db2c6 drm/amd/display: limit timing for single dimm memory
    5e1574aa0639 drm/amd/display: Remove stutter only configurations
    f6ee841ff216 relayfs: fix out-of-bounds access in relay_file_read
    5bd77c239339 KVM: arm64: vgic: Don't acquire its_lock before config_lock
    569f33c3c2f9 KVM: arm64: Use config_lock to protect vgic state
    2b57af7bb9f1 KVM: arm64: Use config_lock to protect data ordered against KVM_RUN
    6c9d3f2a5e17 KVM: arm64: Avoid lock inversion when setting the VM register width
    36e0c405b86e KVM: arm64: Avoid vcpu->mutex v. kvm->lock inversion in CPU_ON
    f01c5f1ae9de KVM: nVMX: Emulate NOPs in L2, and PAUSE if it's not intercepted
    eae127cd2ce6 reiserfs: Add security prefix to xattr name in reiserfs_security_write()
    c8a3341b3392 rcu: Avoid stack overflow due to __rcu_irq_enter_check_tick() being kprobe-ed
    c0bf94154ce0 crypto: ccp - Don't initialize CCP for PSP 0x1649
    b952a9cf3de2 crypto: arm64/aes-neonbs - fix crash with CFI enabled
    4d9d2fd86766 crypto: safexcel - Cleanup ring IRQ workqueues on load failure
    42ca037d0c3f crypto: api - Demote BUG_ON() in crypto_unregister_alg() to a WARN_ON()
    d9834abd8b24 ring-buffer: Sync IRQ works before buffer destruction
    ad7cc2a29e13 ring-buffer: Ensure proper resetting of atomic variables in ring_buffer_reset_online_cpus
    cb99866895e6 pinctrl: qcom: lpass-lpi: set output value before enabling output
    956bbf1871e1 soundwire: qcom: correct setting ignore bit on v1.5.1
    c2c563c137cf pwm: meson: Fix g12a ao clk81 name
    f7e930b179ef pwm: meson: Fix axg ao mux parents
    1b0341e8fb2f wifi: mt76: add missing locking to protect against concurrent rx/status calls
    b9f6845a492d kheaders: Use array declaration instead of char
    9fd4768b0937 iio: addac: stx104: Fix race condition for stx104_write_raw()
    c38a4eb8aa47 iio: addac: stx104: Fix race condition when converting analog-to-digital
    44847a506e71 ipmi: fix SSIF not responding under certain cond.
    aeff5808f172 ipmi:ssif: Add send_retries increment
    a6b54af40787 MIPS: fw: Allow firmware to pass a empty env
    7f3340bf06f8 fs: fix sysctls.c built
    3e7b8a723b0c tick/nohz: Fix cpu_is_hotpluggable() by checking with nohz subsystem
    c94e5baa989f serial: max310x: fix IO data corruption in batched operations
    65fdabefd9c4 serial: 8250: Fix serial8250_tx_empty() race with DMA Tx
    719a2f969b7d serial: fix TIOCSRS485 locking
    27df5bca965b xhci: fix debugfs register accesses while suspended
    7fb0b81e85d8 tty: Prevent writing chars during tcsetattr TCSADRAIN/FLUSH
    ad44530d46a5 staging: iio: resolver: ads1210: fix config mode
    64ef787bb158 blk-crypto: make blk_crypto_evict_key() more robust
    26632a538222 blk-crypto: make blk_crypto_evict_key() return void
    7d206ec7a04e blk-mq: release crypto keyslot before reporting I/O complete
    3b5fbb8219eb blk-crypto: Add a missing include directive
    5ca1668a9f5d blk-crypto: move internal only declarations to blk-crypto-internal.h
    3aab3abb856b blk-crypto: add a blk_crypto_config_supported_natively helper
    f0efb2365153 blk-crypto: don't use struct request_queue for public interfaces
    316ad076e0d3 blk-stat: fix QUEUE_FLAG_STATS clear
    3285613127d3 media: ov8856: Do not check for for module version
    bccf9fe2963e posix-cpu-timers: Implement the missing timer_wait_running callback
    1408d27f25c7 tpm: Add !tpm_amd_is_rng_defective() to the hwrng_unregister() call site
    ee508dfbafa1 hwmon: (adt7475) Use device_property APIs when configuring polarity
    d899ae3e768e hwmon: (k10temp) Check range scale when CUR_TEMP register is read-write
    986bd947bcd1 USB: dwc3: fix runtime pm imbalance on unbind
    d4b1e04d271b USB: dwc3: fix runtime pm imbalance on probe errors
    befdcb8e880e usb: dwc3: gadget: Stall and restart EP0 if host is unresponsive
    491d32c896e0 usb: gadget: udc: core: Prevent redundant calls to pullup
    f6aaeacf0596 usb: gadget: udc: core: Invoke usb_gadget_connect only when started
    5b6c295947e6 IMA: allow/fix UML builds
    38a42842a6d0 phy: qcom-qmp-pcie: sc8180x PCIe PHY has 2 lanes
    5c274804e27e PCI: qcom: Fix the incorrect register usage in v2.7.0 config
    58e56aa83848 PCI: pciehp: Fix AB-BA deadlock between reset_lock and device_lock
    a07176956014 PCI: kirin: Select REGMAP_MMIO
    6e5bf8c9f7b3 powerpc/boot: Fix boot wrapper code generation with CONFIG_POWER10_CPU
    4403c7b7e5e1 arm64: Stash shadow stack pointer in the task struct on interrupt
    2dd0f8994da1 arm64: Always load shadow stack pointer directly from the task struct
    06003e397523 ASoC: amd: ps: update the acp clock source.
    f9dc736e686c ASoC: amd: fix ACP version typo mistake
    f66cd9995917 wifi: mt76: mt7921e: Set memory space enable in PCI_COMMAND if unset
    24d158856cef wireguard: timers: cast enum limits members to int in prints
    103f618cee51 x86/cpu: Add model number for Intel Arrow Lake processor
    88b9e97c1447 asm-generic/io.h: suppress endianness warnings for readq() and writeq()
    5ded8299b7de tracing: Error if a trace event has an array for a __field()
    324b854ce475 wifi: ath11k: reduce the MHI timeout to 20s
    cde904042870 platform/x86: thinkpad_acpi: Add missing T14s Gen1 type to s2idle quirk list
    7e26bfb49d00 net: sfp: add quirk enabling 2500Base-x for HG MXPD-483II
    388764ea64e2 scsi: mpi3mr: Handle soft reset in progress fault code (0xF002)
    0ac10535aed9 selftests mount: Fix mount_setattr_test builds failed
    ec6f22171dc2 net: wwan: t7xx: do not compile with -Werror
    c58f26bdeec3 ASoC: da7213.c: add missing pm_runtime_disable()
    e373f76e20d6 ASoC: Intel: bytcr_rt5640: Add quirk for the Acer Iconia One 7 B1-750
    372bec6747bb iio: adc: palmas_gpadc: fix NULL dereference on rmmod
    c81f5c8b8c23 ASoC: amd: yc: Add DMI entries to support Victus by HP Laptop 16-e1xxx (8A22)
    32aae7831462 x86/hyperv: Block root partition functionality in a Confidential VM
    5c7648e96d90 ASoC: soc-pcm: fix hw->formats cleared by soc_pcm_hw_init() for dpcm
    a89c7b86b5e2 ASoC: Intel: soc-acpi: add table for Intel 'Rooks County' NUC M15
    4f7b42a9bfd9 ASOC: Intel: sof_sdw: add quirk for Intel 'Rooks County' NUC M15

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ead4f27c1ab133133e2eaf76527d4dbd9cf60138)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 66550914c4..9ed118189f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "573386d3cb8c102496deecf92ca867ff9d044ae1"
-SRCREV_meta ?= "b82e23405925b724cecf3deacc13739db6720ca2"
+SRCREV_machine ?= "085dd99c0bdc160daa3327cf4347d7850ae88e42"
+SRCREV_meta ?= "76f7fbdf330d6a4b2aaa98085546030d7aec4a61"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.27"
+LINUX_VERSION ?= "6.1.28"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 7eec6e97aa..8b90e6b7c2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.27"
+LINUX_VERSION ?= "6.1.28"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "5595b9b98df96b1ef27dc5879d19b9b512cc5c14"
-SRCREV_meta ?= "b82e23405925b724cecf3deacc13739db6720ca2"
+SRCREV_machine ?= "c5c0c7ccfe672491795b3c926f70171dc380ced7"
+SRCREV_meta ?= "76f7fbdf330d6a4b2aaa98085546030d7aec4a61"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 46ed1f8b30..a6ec624a07 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "df2cfcb92e63bdbdd34667d5915a71b1441ec723"
-SRCREV_machine:qemuarm64 ?= "5595b9b98df96b1ef27dc5879d19b9b512cc5c14"
-SRCREV_machine:qemuloongarch64 ?= "5595b9b98df96b1ef27dc5879d19b9b512cc5c14"
-SRCREV_machine:qemumips ?= "9cf687bf5869c57781cb399038d455351e4517e9"
-SRCREV_machine:qemuppc ?= "5595b9b98df96b1ef27dc5879d19b9b512cc5c14"
-SRCREV_machine:qemuriscv64 ?= "5595b9b98df96b1ef27dc5879d19b9b512cc5c14"
-SRCREV_machine:qemuriscv32 ?= "5595b9b98df96b1ef27dc5879d19b9b512cc5c14"
-SRCREV_machine:qemux86 ?= "5595b9b98df96b1ef27dc5879d19b9b512cc5c14"
-SRCREV_machine:qemux86-64 ?= "5595b9b98df96b1ef27dc5879d19b9b512cc5c14"
-SRCREV_machine:qemumips64 ?= "6e551dbbbc3d447255314706f089a45670063901"
-SRCREV_machine ?= "5595b9b98df96b1ef27dc5879d19b9b512cc5c14"
-SRCREV_meta ?= "b82e23405925b724cecf3deacc13739db6720ca2"
+SRCREV_machine:qemuarm ?= "95289cb8222292127ee39078f54542395d839d64"
+SRCREV_machine:qemuarm64 ?= "c5c0c7ccfe672491795b3c926f70171dc380ced7"
+SRCREV_machine:qemuloongarch64 ?= "c5c0c7ccfe672491795b3c926f70171dc380ced7"
+SRCREV_machine:qemumips ?= "15aab7123b475365095665030ec81fd54fbc8041"
+SRCREV_machine:qemuppc ?= "c5c0c7ccfe672491795b3c926f70171dc380ced7"
+SRCREV_machine:qemuriscv64 ?= "c5c0c7ccfe672491795b3c926f70171dc380ced7"
+SRCREV_machine:qemuriscv32 ?= "c5c0c7ccfe672491795b3c926f70171dc380ced7"
+SRCREV_machine:qemux86 ?= "c5c0c7ccfe672491795b3c926f70171dc380ced7"
+SRCREV_machine:qemux86-64 ?= "c5c0c7ccfe672491795b3c926f70171dc380ced7"
+SRCREV_machine:qemumips64 ?= "da9ecfb67170876bff1ca1d5547d438cbcb70671"
+SRCREV_machine ?= "c5c0c7ccfe672491795b3c926f70171dc380ced7"
+SRCREV_meta ?= "76f7fbdf330d6a4b2aaa98085546030d7aec4a61"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "ca48fc16c49388400eddd6c6614593ebf7c7726a"
+SRCREV_machine:class-devupstream ?= "bf4ad6fa4e5332e53913b073d0219319a4091619"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.27"
+LINUX_VERSION ?= "6.1.28"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.34.1


