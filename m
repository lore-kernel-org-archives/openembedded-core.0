Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6BA6C10F07
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 02:33:49 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.11232.1702002826009457147
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 18:33:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=l5hY1msY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d04c097e34so13402765ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 18:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702002825; x=1702607625; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zq2xcpQkRJ9DaJ8YVAaEOzKQpfKtKP6O9Nx/pGcG/x8=;
        b=l5hY1msYiB55M0tP4QZQyKL/L9d9VQImswYKXIg3E95/LkgULtn59JBjrKKcUzonwZ
         tNysxz7ZhyrZeI9cisosQE197/7+DehGKfaLrtTd2bMagBSikAKJwQdyZ8BKPLOPWtl1
         MR88MW9ml/TUpA2BE8ZferkzeyjHRlfoEycr/9lCErqJkYIhmz/WMHQ6RCWw9wppnyU2
         n4dVo4HnscP8WwlhcSwPuNX3NB+GIk9akOEIGcF0Dc86CdI/M08DcywroI5XlODd32Cs
         AhUpXuqBF63uIOnPOaw+0ZeX+BNkw8xdOq1rhKw6CVb6moPAtU3YJJ+tH6lfpPgiXAoK
         blIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702002825; x=1702607625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zq2xcpQkRJ9DaJ8YVAaEOzKQpfKtKP6O9Nx/pGcG/x8=;
        b=iTlw/7W6Mmqs63ZhHyA/o68clAnrUCviJrQplK5rxWyZ4KENK36KptfXm2VicLFsWb
         CugAjY0wrw9FqRO+YLA4nsahAfk9T+Dk4C9n5mX15B6ptPGlQWwd0CYUHv3TOU7R2oMZ
         oz+lMllW6YyvqktDl8ZkdQ4CX1nJb8eZhd6706pRYJIUTXSuM25ZZR95pjo6oy8Unk0W
         3hemsbawLJRJRK153j3mOgFfN7Bt3S55llhlvv3ixoCg64nlbwkwCQqfFqKz6cYCLYwH
         DmdAUHWw/Xp8gArPq3FKp5/MPdWBAMbtSOgZIVbYXjJA1FaTz6GW9DwFMEYcDnB/RezV
         NL0g==
X-Gm-Message-State: AOJu0YwvLBb8OTqAr8vwpkk4BU5PRJGrkaRV4ZSqBhQ4mBGD02bQYq3R
	LOeXAcia5Et31Yy6G6qpDX7dPvEVY7gqhvQjynI=
X-Google-Smtp-Source: AGHT+IHYZoedMIVZIk5BB48yR6F6Ba/QEDdy52OtryIEEcTTriK4F3RhEGGDH/Dl0xn8tuLz5tW/cw==
X-Received: by 2002:a17:903:230e:b0:1d0:874a:5f98 with SMTP id d14-20020a170903230e00b001d0874a5f98mr309188plh.24.1702002824729;
        Thu, 07 Dec 2023 18:33:44 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id i11-20020a170902c94b00b001c9bc811d4dsm499752pla.295.2023.12.07.18.33.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 18:33:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/15] linux-yocto/5.10: update to v5.10.200
Date: Thu,  7 Dec 2023 16:33:12 -1000
Message-Id: <630963a1396afa8c1550ec971d50e444f5ccbcfd.1702002667.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702002667.git.steve@sakoman.com>
References: <cover.1702002667.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 02:33:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191998

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    3e55583405ac Linux 5.10.200
    a5feaf765935 ALSA: hda: intel-dsp-config: Fix JSL Chromebook quirk detection
    9109649559f9 tty: 8250: Add support for Intashield IS-100
    73bcb4d44988 tty: 8250: Add support for Brainboxes UP cards
    119f38e8ca16 tty: 8250: Add support for additional Brainboxes UC cards
    a8bf6f62187f tty: 8250: Remove UC-257 and UC-431
    e705aee2a657 usb: raw-gadget: properly handle interrupted requests
    8e0324f2cbb7 usb: storage: set 1.50 as the lower bcdDevice for older "Super Top" compatibility
    747b8f877998 PCI: Prevent xHCI driver from claiming AMD VanGogh USB3 DRD device
    deddf60c271f can: isotp: isotp_sendmsg(): fix TX state detection and wait behavior
    8716c28f695c can: isotp: isotp_bind(): do not validate unused address information
    e4c4e0e1b29c can: isotp: add local echo tx processing and tx without FC
    569c95b7ece0 can: isotp: handle wait_event_interruptible() return values
    de3c02383aa6 can: isotp: check CAN address family in isotp_bind()
    0386f3704789 can: isotp: isotp_bind(): return -EINVAL on incorrect CAN ID formatting
    93b1e3f3a263 can: isotp: set max PDU size to 64 kByte
    7adbc048d84b can: isotp: Add error message if txqueuelen is too small
    57798a2cfe15 can: isotp: add symbolic error message to isotp_module_init()
    186ab5645199 can: isotp: change error format from decimal to symbolic error names
    b881ce6c7d10 powerpc/mm: Fix boot crash with FLATMEM
    1b285a1bfb0d net: chelsio: cxgb4: add an error code check in t4_load_phy_fw
    955a1105eec2 platform/mellanox: mlxbf-tmfifo: Fix a warning message
    268ec38b797b scsi: mpt3sas: Fix in error path
    abf9c7811836 fbdev: uvesafb: Call cn_del_callback() at the end of uvesafb_exit()
    ec45886637ee ASoC: rt5650: fix the wrong result of key button
    c683d8b6417c netfilter: nfnetlink_log: silence bogus compiler warning
    66cc633fc6e1 spi: npcm-fiu: Fix UMA reads when dummy.nbytes == 0
    6f9093b6f8f7 fbdev: atyfb: only use ioremap_uc() on i386 and ia64
    ead3c123a753 Input: synaptics-rmi4 - handle reset delay when using SMBus trsnsport
    fb8f253b9532 dmaengine: ste_dma40: Fix PM disable depth imbalance in d40_probe
    e619b38a873f irqchip/stm32-exti: add missing DT IRQ flag translation
    d151fb801957 net: sched: cls_u32: Fix allocation size in u32_init()
    9ade01b2949b x86: Fix .brk attribute in linker script
    3fdd5b2bb09f rpmsg: Fix possible refcount leak in rpmsg_register_device_override()
    41c13a571de4 rpmsg: glink: Release driver_override
    5f1bb9f4d4b5 rpmsg: Fix calling device_lock() on non-initialized device
    5bbd3469a4b6 rpmsg: Fix kfree() of static memory on setting driver_override
    d0208fb38f43 rpmsg: Constify local variable in field store macro
    da369d3996cc driver: platform: Add helper for safer setting of driver_override
    4a20f5ea62db objtool/x86: add missing embedded_insn check
    6b977a7323f7 ext4: avoid overlapping preallocations due to overflow
    58fe961c606c ext4: fix BUG in ext4_mb_new_inode_pa() due to overflow
    c0db17e55ff6 ext4: add two helper functions extent_logical_end() and pa_logical_end()
    c761d34a7ec0 x86/mm: Fix RESERVE_BRK() for older binutils
    01a5e17e3ef3 x86/mm: Simplify RESERVE_BRK()
    571ce7d944cd f2fs: fix to do sanity check on inode type during garbage collection
    d1c37e849f37 smbdirect: missing rc checks while waiting for rdma events
    b2e62728b106 kobject: Fix slab-out-of-bounds in fill_kobj_path()
    b9b197f65904 x86/i8259: Skip probing when ACPI/MADT advertises PCAT compatibility
    62184eb77821 iio: adc: xilinx-xadc: Don't clobber preset voltage/temperature thresholds
    e96eb8853f33 iio: adc: xilinx: use more devres helpers and remove remove()
    0eb1198fe4d6 iio: adc: xilinx: use devm_krealloc() instead of kfree() + kcalloc()
    c4b496c9f772 iio: adc: xilinx: use helper variable for &pdev->dev
    d8928befffe5 clk: Sanitize possible_parent_show to Handle Return Value of of_clk_get_parent_name
    09ce0d85cc00 sparc32: fix a braino in fault handling in csum_and_copy_..._user()
    0258ca32b0ea perf/core: Fix potential NULL deref
    4e3c606afa25 nvmem: imx: correct nregs for i.MX6UL
    37ccf15ebeec nvmem: imx: correct nregs for i.MX6SLL
    7a1c29e93c25 nvmem: imx: correct nregs for i.MX6ULL
    d44166341f4b misc: fastrpc: Clean buffers on remote invocation failures
    866838eb8ee9 tracing/kprobes: Fix the description of variable length arguments
    ca764116b5c1 i2c: aspeed: Fix i2c bus hang in slave read
    18c5167d0460 i2c: stm32f7: Fix PEC handling in case of SMBUS transfers
    80416f6ba002 i2c: muxes: i2c-demux-pinctrl: Use of_get_i2c_adapter_by_node()
    9a9ead53e72f i2c: muxes: i2c-mux-gpmux: Use of_get_i2c_adapter_by_node()
    3cb69f1dbc86 i2c: muxes: i2c-mux-pinctrl: Use of_get_i2c_adapter_by_node()
    0c8587fec9d5 iio: exynos-adc: request second interupt only when touchscreen mode is used
    632c2199e52d kasan: print the original fault addr when access invalid shadow
    be9e6f51ba7b i40e: Fix wrong check for I40E_TXR_FLAGS_WB_ON_ITR
    fe65fc90e9f2 gtp: fix fragmentation needed check with gso
    3ae8b75fce05 gtp: uapi: fix GTPA_MAX
    4d0d5e54b590 tcp: fix wrong RTO timeout when received SACK reneging
    e0308c793943 r8152: Release firmware if we have an error in probe
    17b455747bc6 r8152: Cancel hw_phy_work if we have an error in probe
    7dc907d855df r8152: Run the unload routine if we have errors during probe
    704c25fc6abd r8152: Increase USB control msg timeout to 5000ms as per spec
    79e2610efc94 net: usb: smsc95xx: Fix uninit-value access in smsc95xx_read_reg
    d9864e589f0e net: ieee802154: adf7242: Fix some potential buffer overflow in adf7242_stats_show()
    634c72adc864 igc: Fix ambiguity in the ethtool advertising
    1e628189a21b neighbour: fix various data-races
    77c4f14f952e igb: Fix potential memory leak in igb_add_ethtool_nfc_entry
    1ac4f8e5553c treewide: Spelling fix in comment
    5eab293b1cbf r8169: fix the KCSAN reported data race in rtl_rx while reading desc->opts1
    13d357d9f226 r8169: fix the KCSAN reported data-race in rtl_tx while reading TxDescArray[entry].opts1
    31c31a78dccf drm/dp_mst: Fix NULL deref in get_mst_branch_device_by_guid_helper()
    957ec0823a5a mmc: renesas_sdhi: use custom mask for TMIO_MASK_ALL
    3ab81820bf92 mm/page_alloc: correct start page when guard page debug is enabled
    f2c0b571a5fc virtio-mmio: fix memory leak of vm_dev
    8b857a93d6be virtio_balloon: Fix endless deflation and inflation on arm64
    c88dd2aebf0c mcb-lpc: Reallocate memory region to avoid memory overlapping
    6976459c6439 mcb: Return actual parsed size when reading chameleon table
    09bcf9254838 selftests/ftrace: Add new test case which checks non unique symbol
    cb49f0e441ce Linux 5.10.199
    657a3ca8236c xfrm6: fix inet6_dev refcount underflow problem
    5d5680755bce Bluetooth: hci_sock: Correctly bounds check and pad HCI_MON_NEW_INDEX name
    b423509bc99c Bluetooth: hci_sock: fix slab oob read in create_monitor_event
    653c808023cd phy: mapphone-mdm6600: Fix pinctrl_pm handling for sleep pins
    e9c20d3078cc phy: mapphone-mdm6600: Fix runtime PM for remove
    f42634685ee5 phy: mapphone-mdm6600: Fix runtime disable on probe
    05e06fb6a642 ASoC: pxa: fix a memory leak in probe()
    7e29dadf265d gpio: vf610: set value before the direction to avoid a glitch
    6c3a72d4ae24 platform/x86: asus-wmi: Map 0x2a code, Ignore 0x2b and 0x2c events
    8fece0081b64 platform/x86: asus-wmi: Change ASUS_WMI_BRN_DOWN code from 0x20 to 0x2e
    3be044840e8e s390/pci: fix iommu bitmap allocation
    487a8e24643a perf: Disallow mis-matched inherited group reads
    550c70f72a1b USB: serial: option: add Fibocom to DELL custom modem FM101R-GL
    a39ea926ff6d USB: serial: option: add entry for Sierra EM9191 with new firmware
    3fb223086de9 USB: serial: option: add Telit LE910C4-WWX 0x1035 composition
    d78d3e0d8462 nvme-rdma: do not try to stop unallocated queues
    6238faecf88a nvme-pci: add BOGUS_NID for Intel 0a54 device
    9efa38fdca2c ACPI: irq: Fix incorrect return value in acpi_register_gsi()
    9df654268aec pNFS: Fix a hang in nfs4_evict_inode()
    c44e09a89ad2 Revert "pinctrl: avoid unsafe code pattern in find_pinctrl()"
    b26b0b8757c6 mmc: core: Capture correct oemid-bits for eMMC cards
    f4771efb0683 mmc: core: sdio: hold retuning if sdio in 1-bit mode
    2312fb7f3b20 mtd: physmap-core: Restore map_rom fallback
    3a141424f8fe mtd: spinand: micron: correct bitmask for ecc status
    7682dae0a607 mtd: rawnand: arasan: Ensure program page operations are successful
    875d17e4524b mtd: rawnand: marvell: Ensure program page operations are successful
    6224890ad0b4 mtd: rawnand: qcom: Unmap the right resource upon probe failure
    f707bc0a55b7 Bluetooth: hci_event: Fix using memcmp when comparing keys
    3b6aa631df0c net/mlx5: Handle fw tracer change ownership event based on MTRC
    ead8131372af platform/x86: touchscreen_dmi: Add info for the Positivo C4128B
    fd1271632769 HID: multitouch: Add required quirk for Synaptics 0xcd7e device
    4e71ae53f121 btrfs: fix some -Wmaybe-uninitialized warnings in ioctl.c
    661b4ce3b54a drm: panel-orientation-quirks: Add quirk for One Mix 2S
    5b7cae7c35dd ipv4/fib: send notify when delete source address routes
    21f85b026dfe sky2: Make sure there is at least one frag_addr available
    f06c3a50ef2b regulator/core: Revert "fix kobject release warning and memory leak in regulator_register()"
    461341412960 wifi: cfg80211: avoid leaking stack data into trace
    fde6d84daa0f wifi: mac80211: allow transmitting EAPOL frames with tainted key
    8de7f7058314 wifi: cfg80211: Fix 6GHz scan configuration
    ffb060b136dd Bluetooth: hci_core: Fix build warnings
    65f5da6df897 Bluetooth: Avoid redundant authentication
    115f2c88fde3 HID: holtek: fix slab-out-of-bounds Write in holtek_kbd_input_event
    a59636cdd84a tracing: relax trace_event_eval_update() execution with cond_resched()
    fb60e9c00042 ata: libata-eh: Fix compilation warning in ata_eh_link_report()
    22c3641bef9c gpio: timberdale: Fix potential deadlock on &tgpio->lock
    b4fcf1a0bbd0 overlayfs: set ctime when setting mtime and atime
    4b472c25a597 i2c: mux: Avoid potential false error message in i2c_mux_add_adapter
    840b912df518 btrfs: initialize start_slot in btrfs_log_prealloc_extents
    9801e2798b63 btrfs: return -EUCLEAN for delayed tree ref with a ref count not equals to 1
    d69131b48fea ARM: dts: ti: omap: Fix noisy serial with overrun-throttle-ms for mapphone
    9ed14f807f4f usb: typec: altmodes/displayport: Signal hpd low when exiting mode
    f25a13d318b8 usb: typec: altmodes/displayport: Notify drm subsys of hotplug events
    2ea6a14e8a55 drm/connector: Add support for out-of-band hotplug notification (v3)
    6e55f6a8a498 drm/connector: Add drm_connector_find_by_fwnode() function (v3)
    89b1868bab48 drm/connector: Add a fwnode pointer to drm_connector and register with ACPI (v2)
    86502f1b63aa drm/connector: Give connector sysfs devices there own device_type
    cedcbf61dfce drm/amd/display: Don't set dpms_off for seamless boot
    ebba01fcd562 drm/amd/display: only check available pipe to disable vbios mode.
    1ac717000403 serial: 8250_omap: Fix errors with no_console_suspend
    be300358b55d serial: 8250: omap: Fix imprecise external abort for omap_8250_pm()
    fc778e9d7995 xhci: track port suspend state correctly in unsuccessful resume cases
    1c034c6e224d xhci: decouple usb2 port resume and get_port_status request handling
    92088dd88627 xhci: clear usb2 resume related variables in one place.
    e7abc4b18d1a xhci: rename resume_done to resume_timestamp
    d44c9285ce35 xhci: move port specific items such as state completions to port structure
    e2b4de13e5f9 xhci: cleanup xhci_hub_control port references
    95b9f1e3927b usb: core: Track SuperSpeed Plus GenXxY
    d6316f592988 selftests/mm: fix awk usage in charge_reserved_hugetlb.sh and hugetlb_reparenting_test.sh that may cause error
    69f40ce372b9 selftests/vm: make charge_reserved_hugetlb.sh work with existing cgroup setting
    cb868d8857ae ACPI: resource: Skip IRQ override on ASUS ExpertBook B1402CBA
    7d0728e7ac04 ACPI: resource: Skip IRQ override on ASUS ExpertBook B1502CBA
    3a58c28bff79 ACPI: resource: Skip IRQ override on Asus Expertbook B2402CBA
    1b4659e283bc ACPI: resource: Add Asus ExpertBook B2502 to Asus quirks
    980dd4dfb9e8 ACPI: resource: Skip IRQ override on Asus Vivobook S5602ZA
    e0014184cd11 ACPI: resource: Add ASUS model S5402ZA to quirks
    7f26f0ac3854 ACPI: resource: Skip IRQ override on Asus Vivobook K3402ZA/K3502ZA
    ffcb69e923aa ACPI: resources: Add DMI-based legacy IRQ override quirk
    8a8918b51080 ACPI: Drop acpi_dev_irqresource_disabled()
    196896455bd1 resource: Add irqresource_disabled()
    faa9a9d07c06 thunderbolt: Workaround an IOMMU fault on certain systems with Intel Maple Ridge
    482fa2345f03 net: pktgen: Fix interface flags printing
    068e4ecea226 netfilter: nft_set_rbtree: .deactivate fails if element has expired
    9cef803e9ed0 neighbor: tracing: Move pin6 inside CONFIG_IPV6=y section
    36848adbdeba net/sched: sch_hfsc: upgrade 'rt' to 'sc' when it becomes a inner curve
    923e47c0b40a net: dsa: bcm_sf2: Fix possible memory leak in bcm_sf2_mdio_register()
    a53fc0641683 i40e: prevent crash on probe if hw registers have invalid values
    9b5661bda392 net: usb: smsc95xx: Fix an error code in smsc95xx_reset()
    250cd610f8c4 ipv4: fib: annotate races around nh->nh_saddr_genid and nh->nh_saddr
    1cef1a2d5c22 tun: prevent negative ifindex
    f828e15db3c7 tcp: tsq: relax tcp_small_queue_check() when rtx queue contains a single skb
    c39c31c5265b tcp: fix excessive TLP and RACK timeouts from HZ rounding
    805b38062e28 net: rfkill: gpio: prevent value glitch during probe
    8023c7e90007 net: ipv6: fix return value check in esp_remove_trailer
    2ca00d93f2b1 net: ipv4: fix return value check in esp_remove_trailer
    4ba4eec4f40d xfrm: interface: use DEV_STATS_INC()
    4d78b9dc79d5 xfrm: fix a data-race in xfrm_gen_index()
    8c6c3d0b9f2e qed: fix LL2 RX buffer allocation
    88c493297e40 drm/i915: Retry gtt fault when out of fence registers
    e985d78bdcf3 nvmet-tcp: Fix a possible UAF in queue intialization setup
    287401f92c57 netfilter: nft_payload: fix wrong mac header matching
    fe37e56ed47d tcp: check mptcp-level constraints for backlog coalescing
    6550cbe25de1 x86/sev: Check for user-space IOIO pointing to kernel space
    5bb9ba7dafbe x86/sev: Check IOBM for IOIO exceptions from user-space
    d78c5d8c23c3 x86/sev: Disable MMIO emulation from user mode
    459af3fb81e6 KVM: x86: Mask LVTPC when handling a PMI
    4cbac83549dd regmap: fix NULL deref on lookup
    c95fa5b20fe0 nfc: nci: fix possible NULL pointer dereference in send_acknowledge()
    2e64f4c732cb ice: reset first in crash dump kernels
    95d68fdc71ba ice: fix over-shifted variable
    a56c436b4335 Bluetooth: avoid memcmp() out of bounds warning
    7e83d15e0ca2 Bluetooth: hci_event: Fix coding style
    c6878fa1730b Bluetooth: vhci: Fix race when opening vhci device
    40a33a129d99 Bluetooth: Fix a refcnt underflow problem for hci_conn
    ab950561bca4 Bluetooth: Reject connection with the device which has same BD_ADDR
    0e025a4528f4 Bluetooth: hci_event: Ignore NULL link key
    241f23032433 usb: hub: Guard against accesses to uninitialized BOS descriptors
    aec24b096300 Documentation: sysctl: align cells in second content column
    f10690787d2c mm/memory_hotplug: rate limit page migration warnings
    bf97ea76eac5 lib/Kconfig.debug: do not enable DEBUG_PREEMPT by default
    c44b14469af0 dev_forward_skb: do not scrub skb mark within the same name space
    db9aafa19547 ravb: Fix use-after-free issue in ravb_tx_timeout_work()
    db375fa550c0 RDMA/srp: Fix srp_abort()
    f022576aa03c RDMA/srp: Set scmnd->result only when scmnd is not NULL
    489818719a88 arm64: armv8_deprecated: fix unused-function error
    da7603cedb7d arm64: armv8_deprecated: rework deprected instruction handling
    45a26d2a5394 arm64: armv8_deprecated: move aarch32 helper earlier
    0b6a7a9f6d94 arm64: armv8_deprecated move emulation functions
    2202536144bc arm64: armv8_deprecated: fold ops into insn_emulation
    5aa232345e4d arm64: rework EL0 MRS emulation
    15e964971ff7 arm64: factor insn read out of call_undef_hook()
    0edde7fd1c3b arm64: factor out EL1 SSBS emulation hook
    7a76df1ae1b3 arm64: split EL0/EL1 UNDEF handlers
    8a8d4cc303ef arm64: allow kprobes on EL0 handlers
    793ed958b62a arm64: rework BTI exception handling
    9113333d7c7c arm64: rework FPAC exception handling
    a8d7c8484ff7 arm64: consistently pass ESR_ELx to die()
    004bdab6edc7 arm64: die(): pass 'err' as long
    835cb1f78d74 arm64: report EL1 UNDEFs better
    6788b10620ca x86/alternatives: Disable KASAN in apply_alternatives()
    ba4b37721096 powerpc/64e: Fix wrong test in __ptep_test_and_clear_young()
    dadb86fba67f powerpc/8xx: Fix pte_access_permitted() for PAGE_NONE
    288a0593c798 dmaengine: mediatek: Fix deadlock caused by synchronize_irq()
    17c653d4913b usb: gadget: ncm: Handle decoding of multiple NTB's in unwrap call
    a906f2eb675c usb: gadget: udc-xilinx: replace memcpy with memcpy_toio
    7decb6515138 counter: microchip-tcb-capture: Fix the use of internal GCLK logic
    a177771bff63 pinctrl: avoid unsafe code pattern in find_pinctrl()
    2a4a82804024 cgroup: Remove duplicates in cgroup v1 tasks file
    da7ce52a2f6c tee: amdtee: fix use-after-free vulnerability in amdtee_close_session
    0ea0231dd1b2 Input: goodix - ensure int GPIO is in input for gpio_count == 1 && gpio_int_idx == 0 case
    39fb79407e59 Input: i8042 - add Fujitsu Lifebook E5411 to i8042 quirk table
    8d862a3dff7e Input: xpad - add PXN V900 support
    e8ea649fc35f Input: psmouse - fix fast_reconnect function for PS/2 mode
    cd2fbfd8b922 Input: powermate - fix use-after-free in powermate_config_complete
    27b6c809d393 ceph: fix type promotion bug on 32bit systems
    2b2bf63671cc ceph: fix incorrect revoked caps assert in ceph_fill_file_size()
    62f6d24f2e7d libceph: use kernel_connect()
    5850eb4df422 thunderbolt: Check that lane 1 is in CL0 before enabling lane bonding
    008ba1a5ada5 mcb: remove is_added flag from mcb_device struct
    ec93456c0289 x86/cpu: Fix AMD erratum #1485 on Zen4-based CPUs
    b608f4aedc0e iio: pressure: ms5611: ms5611_prom_is_valid false negative bug
    02388eaf3a15 iio: pressure: dps310: Adjust Timeout Settings
    2abd2cffa1b8 iio: pressure: bmp280: Fix NULL pointer exception
    aadbf612f8b1 usb: musb: Modify the "HWVers" register address
    bc929a0052c4 usb: musb: Get the musb_qh poniter after musb_giveback
    459eb7c6885f usb: dwc3: Soft reset phy on probe for host
    d71d0009f9e7 net: usb: dm9601: fix uninitialized variable use in dm9601_mdio_read
    4bf69ee6bb41 usb: xhci: xhci-ring: Use sysdev for mapping bounce buffer
    2d30692c6c94 dmaengine: stm32-mdma: abort resume if no ongoing transfer
    d346a2ef6b1e media: mtk-jpeg: Fix use after free bug due to uncanceled work
    014cab5329d1 net: release reference to inet6_dev pointer
    d491ac7aa12a net: change accept_ra_min_rtr_lft to affect all RA lifetimes
    354a96770d94 net: add sysctl accept_ra_min_rtr_lft
    1ceaf0d3a883 Revert "spi: spi-zynqmp-gqspi: Fix runtime PM imbalance in zynqmp_qspi_probe"
    649237ccf440 Revert "spi: zynqmp-gqspi: fix clock imbalance on probe failure"
    ce03f0234f9d workqueue: Override implicit ordered attribute in workqueue_apply_unbound_cpumask()
    a424807d860b nfc: nci: assert requested protocol is valid
    b5b03da30bd5 pinctrl: renesas: rzn1: Enable missing PINMUX
    6ac22ecdaad2 net: nfc: fix races in nfc_llcp_sock_get() and nfc_llcp_sock_get_sn()
    31ea13e3ff52 ixgbe: fix crash with empty VF macvlan list
    b24bd1277501 net: phy: mscc: macsec: reject PN update requests
    a848ae8b5ad7 net: macsec: indicate next pn update when offloading
    a629f0575c9c drm/vmwgfx: fix typo of sizeof argument
    d4ba78e5522e riscv, bpf: Sign-extend return values
    2a8ef2234b3a riscv, bpf: Factor out emit_call for kernel and bpf context
    1bf4da1818c2 xen-netback: use default TX queue size for vifs
    33548a6b3c7c mlxsw: fix mlxsw_sp2_nve_vxlan_learning_set() return type
    55e06850c789 ieee802154: ca8210: Fix a potential UAF in ca8210_probe
    ef7a0d51bfdb ravb: Fix up dma_free_coherent() call in ravb_remove()
    1673841da013 drm/msm/dpu: change _dpu_plane_calc_bw() to use u64 to avoid overflow
    6004ca7ad2d0 drm/msm/dsi: skip the wait for video mode done if not applicable
    dbbbeaef7786 drm/msm/dp: do not reinitialize phy unless retry during link training
    31e7e77b24f1 net: prevent address rewrite in kernel_bind()
    22c06bf1f99e quota: Fix slow quotaoff
    093af62c0235 HID: logitech-hidpp: Fix kernel crash on receiver USB disconnect
    cb4a8146e3a9 lib/test_meminit: fix off-by-one error in test_pages()
    06068e7f3ff8 perf/arm-cmn: Fix the unhandled overflow status of counter 4 to 7
    0ed2ad00f333 RDMA/cxgb4: Check skb value for failure to allocate
    26788a5b48d9 RDMA/srp: Do not call scsi_done() from srp_abort()
    81982125c352 RDMA/srp: Make struct scsi_cmnd and struct srp_request adjacent

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index ea27d58ed7..aa142e9991 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2da7024055c1fb827608ef2529c22356612f6ddd"
-SRCREV_meta ?= "d787ac6931e013c185858482f491f8bfa9fa5177"
+SRCREV_machine ?= "b24960ebb2a4b1ef65c32b2d76b3c5cc078da6e3"
+SRCREV_meta ?= "2a34d5498413dc22a5f735d5e830751fe07dc825"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.198"
+LINUX_VERSION ?= "5.10.200"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 7de15b3427..e9b140826f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.198"
+LINUX_VERSION ?= "5.10.200"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "0456488add9cb4b7d3cd462829c9dc7565bd129e"
-SRCREV_machine ?= "a1c6b99d88f23dcdaeb66e932239e43b4ffb44f0"
-SRCREV_meta ?= "d787ac6931e013c185858482f491f8bfa9fa5177"
+SRCREV_machine:qemuarm ?= "649d500e6df0c844c207d14168290483f0e2e3a4"
+SRCREV_machine ?= "913ae61c1450439a52b0ed396805b65c2735a136"
+SRCREV_meta ?= "2a34d5498413dc22a5f735d5e830751fe07dc825"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 764b2ae52b..20ac329cdb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -14,23 +14,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "55637625329cf574d8e33c94e58562d418d9a342"
-SRCREV_machine:qemuarm64 ?= "259c25670564324f7098c7f5e5fd136e0d708216"
-SRCREV_machine:qemumips ?= "8333009219a39ea271fe238a482423bfa4738703"
-SRCREV_machine:qemuppc ?= "bd719802d7bca16c82af1cb31e3dc254cf8992b8"
-SRCREV_machine:qemuriscv64 ?= "5601201f60a8abb5bbb54da99da2a38bfb7a46dd"
-SRCREV_machine:qemuriscv32 ?= "5601201f60a8abb5bbb54da99da2a38bfb7a46dd"
-SRCREV_machine:qemux86 ?= "5601201f60a8abb5bbb54da99da2a38bfb7a46dd"
-SRCREV_machine:qemux86-64 ?= "5601201f60a8abb5bbb54da99da2a38bfb7a46dd"
-SRCREV_machine:qemumips64 ?= "f3dfd049230bbbf54854c21f5b85b8b52e2b2f65"
-SRCREV_machine ?= "5601201f60a8abb5bbb54da99da2a38bfb7a46dd"
-SRCREV_meta ?= "d787ac6931e013c185858482f491f8bfa9fa5177"
+SRCREV_machine:qemuarm ?= "cc21138c594fb43fba8e73aa72f3264c086689ff"
+SRCREV_machine:qemuarm64 ?= "bd39db109551e3df6a5cd523d2d7f7bbf6e756ea"
+SRCREV_machine:qemumips ?= "d8fb3fcb7e6d85e098ab813d26a20f5226f48f47"
+SRCREV_machine:qemuppc ?= "67ee435101a2b79ea826a22877e30d0a5ddf70f3"
+SRCREV_machine:qemuriscv64 ?= "7042b40d250aaaf2fe5f027de38e31575c01b22a"
+SRCREV_machine:qemuriscv32 ?= "7042b40d250aaaf2fe5f027de38e31575c01b22a"
+SRCREV_machine:qemux86 ?= "7042b40d250aaaf2fe5f027de38e31575c01b22a"
+SRCREV_machine:qemux86-64 ?= "7042b40d250aaaf2fe5f027de38e31575c01b22a"
+SRCREV_machine:qemumips64 ?= "a36187617acc67fd12b752e74b68152c59374f88"
+SRCREV_machine ?= "7042b40d250aaaf2fe5f027de38e31575c01b22a"
+SRCREV_meta ?= "2a34d5498413dc22a5f735d5e830751fe07dc825"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.198"
+LINUX_VERSION ?= "5.10.200"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


