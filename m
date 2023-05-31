Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 717EBC7EE31
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 02:34:49 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.4587.1685500478896916684
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 19:34:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=iX3SPKbf;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.43, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6af6b5cf489so3964051a34.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 19:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685500485; x=1688092485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bDffYfZf/stPyKBRurxiAde8DJu8HUbpQsCy1+26FhU=;
        b=iX3SPKbfiRznx3HnJDuYMl1RMdzZQurvHPWW18SBzIDA9H4ky363Q02o3y0p2gLgl1
         Bvo24Dlrnf7D+Ws9hwq9sUGwibYWDuGLIZRhm35Tzf19rNne4XNoWm91+QqtbC8zuy4q
         jV3tC8DbMMuE4EUFoX0vRAWwnstoR5IlOUXKEZ7AlJDar1HTX84Yxy9s1x9jz+YR98m9
         KLa7M2gb7onMhBgjB9XO7j9WpJfCwibs3JBDGfbb+2FIGH95Tulc3RxER63w4A7FkDWT
         OhKqryhgGX1fLLqmBR6qjmgMxQtpQ9dgemKUiG1hAeOrMiuQAxJ2puEKCMfL4As+wbx6
         UPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685500485; x=1688092485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bDffYfZf/stPyKBRurxiAde8DJu8HUbpQsCy1+26FhU=;
        b=HuRRLffZ+YFx0lhr0kEVy7RYVfM6ToLoWRkWFHH7FsiaRtvym0NaiJFKpPeFMa2U7l
         c1eKGkN1ICg30zq5S+DpiBoTgwHiavcV8YoLr6jcB6C8cho5cpu2z5Sa0ZZK+pmNVAdT
         l7YXHaC8kwSiNlykP62uG2roT/vgq2byGnK7aP5HE2b1BB2bwdtuaJmCNqpiEu/CXLGC
         qUgPR2r41+zMEqUzGosv55rkP8+RfD80Bxtd3Y1yrP7Nzcjvd+sbZm6fXxYAbwlx3WO+
         anSz/9mMFvyIpMd0UkR4k0FDkIQpb7WiVAv7J2bUbOOCq/G7AW4EVl67liZicioI0LJS
         5iBw==
X-Gm-Message-State: AC+VfDwJyU9Y6R7vNtOIVoGYuV6NDqACTx8i02oT20QwYyRyAYp1PXVk
	0yZKrpt8/Nr3At8jzXcoaOid8Ge34wM0rSD/IAA=
X-Google-Smtp-Source: ACHHUZ6jltrM9vFzIhUwtzZVkQboxTKCpy0Rrh+aiJBSAjDmFzX/ZCIheZ7Um05jaT0JSsi3tAYUXw==
X-Received: by 2002:a05:6358:93a5:b0:121:c4a9:aeb2 with SMTP id h37-20020a05635893a500b00121c4a9aeb2mr294447rwb.28.1685500484433;
        Tue, 30 May 2023 19:34:44 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k91-20020a17090a3ee400b0023a9564763bsm92877pjc.29.2023.05.30.19.34.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 19:34:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/13] linux-yocto/5.10: update to v5.10.180
Date: Tue, 30 May 2023 16:34:16 -1000
Message-Id: <c00e421942407b60145cc52844290e9e0f18f84c.1685500244.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685500244.git.steve@sakoman.com>
References: <cover.1685500244.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 02:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181978

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    4c893ff55907 Linux 5.10.180
    3ebe5d6d69ce drm/amd/display: Fix hang when skipping modeset
    a992c387b411 mm/page_alloc: fix potential deadlock on zonelist_update_seq seqlock
    f2656f437fb1 drm/exynos: move to use request_irq by IRQF_NO_AUTOEN flag
    32232bcd4e53 printk: declare printk_deferred_{enter,safe}() in include/linux/printk.h
    fcfe05990a5c KVM: x86: move guest_pv_has out of user_access section
    85cfbaa575ea KVM: x86: do not report preemption if the steal time cache is stale
    4bffae22bec7 KVM: x86: revalidate steal time cache if MSR value changes
    e10a73f53809 KVM: x86: do not set st->preempted when going back to user space
    029662004359 KVM: x86: Remove obsolete disabling of page faults in kvm_arch_vcpu_put()
    8e39c2f407af KVM: Fix steal time asm constraints
    ebd3010d42ba KVM: x86: Fix recording of guest steal time / preempted status
    4b19cbdb1dd3 KVM: x86: Ensure PV TLB flush tracepoint reflects KVM behavior
    01c0002ec7bd drbd: correctly submit flush bio on barrier
    ef77d602e306 serial: 8250: Fix serial8250_tx_empty() race with DMA Tx
    1a8822343e67 ext4: fix invalid free tracking in ext4_xattr_move_to_block()
    b0fc279de4bf ext4: remove a BUG_ON in ext4_mb_release_group_pa()
    d88fe8e61126 ext4: bail out of ext4_xattr_ibody_get() fails for any reason
    4597554b4f7b ext4: add bounds checking in get_max_inline_xattr_value_size()
    5f8b55136ad7 ext4: fix deadlock when converting an inline directory in nojournal mode
    37c69da3adc4 ext4: improve error recovery code paths in __ext4_remount()
    08838aeefa6f ext4: check iomap type only if ext4_iomap_begin() does not fail
    4aa7f744fa37 ext4: fix data races when using cached status extents
    0dde3141c527 ext4: avoid a potential slab-out-of-bounds in ext4_group_desc_csum
    5d356d902e9d ext4: fix WARNING in mb_find_extent
    529f41f0eb1e KVM: x86: do not report a vCPU as preempted outside instruction boundaries
    0cb6e9e7d3f1 KVM: x86: hyper-v: Avoid calling kvm_make_vcpus_request_mask() with vcpu_mask==NULL
    4502ebbdc0e2 HID: wacom: insert timestamp to packed Bluetooth (BT) events
    77fd800d3f1b HID: wacom: Set a default resolution for older tablets
    c1420276be7a drm/amdgpu: disable sdma ecc irq only when sdma RAS is enabled in suspend
    20ca90ceda71 drm/amdgpu/gfx: disable gfx9 cp_ecc_error_irq only when enabling legacy gfx ras
    eed63477ae06 drm/amdgpu: fix an amdgpu_irq_put() issue in gmc_v9_0_hw_fini()
    c85327c1e93c drm/panel: otm8009a: Set backlight parent to panel device
    957904f531fd f2fs: fix potential corruption when moving a directory
    4a638a958230 ARM: dts: s5pv210: correct MIPI CSIS clock name
    fed6318e4722 ARM: dts: exynos: fix WM8960 clock name in Itop Elite
    777952ce1187 remoteproc: st: Call of_node_put() on iteration error
    30e0834becd8 remoteproc: stm32: Call of_node_put() on iteration error
    62fe5d74ef7f sh: nmi_debug: fix return value of __setup handler
    9245f34029b7 sh: init: use OF_EARLY_FLATTREE for early init
    f19bc0d2a68c sh: mcount.S: fix build error when PRINTK is not enabled
    bbad64abd610 sh: math-emu: fix macro redefined warning
    2d65c97777e5 inotify: Avoid reporting event with invalid wd
    73aef14407de platform/x86: touchscreen_dmi: Add info for the Dexp Ursus KX210i
    4b87eec73e47 platform/x86: touchscreen_dmi: Add upside-down quirk for GDIX1002 ts on the Juno Tablet
    8c2cdb7326f0 cifs: fix pcchunk length type in smb2_copychunk_range
    829c20fd7a7b btrfs: print-tree: parent bytenr must be aligned to sector size
    148b16cd30b2 btrfs: don't free qgroup space unless specified
    08fa23adbdcc btrfs: fix btrfs_prev_leaf() to not return the same key twice
    7a4db11f00f3 perf symbols: Fix return incorrect build_id size in elf_read_build_id()
    87a1fa0ad74e crypto: sun8i-ss - Fix a test in sun8i_ss_setup_ivs()
    be3517ae6b80 perf map: Delete two variable initialisations before null pointer checks in sort__sym_from_cmp()
    604b650fb574 perf pmu: zfree() expects a pointer to a pointer to zero it after freeing its contents
    1ebd0dfb271e perf vendor events power9: Remove UTF-8 characters from JSON files
    796616f216d0 net: enetc: check the index of the SFI rather than the handle
    b6b15de5129e virtio_net: suppress cpu stall when free_unused_bufs
    c043714ef230 virtio_net: split free_unused_bufs()
    0773270b1314 net: dsa: mt7530: fix corrupt frames using trgmii on 40 MHz XTAL MT7621
    0f1ad0ef60cc ALSA: caiaq: input: Add error handling for unsupported input methods in `snd_usb_caiaq_input_init`
    7f497a9451d7 drm/amdgpu: add a missing lock for AMDGPU_SCHED
    f00ef2618fa1 af_packet: Don't send zero-byte data in packet_sendmsg_spkt().
    02359ba526ce ionic: remove noise from ethtool rxnfc error msg
    3605b3318483 octeontx2-vf: Detach LF resources on probe cleanup
    ea7453f5e5b6 octeontx2-pf: Disable packet I/O for graceful exit
    15152b8a4bbb rxrpc: Fix hard call timeout units
    9291aba0ffa0 sfc: Fix module EEPROM reporting for QSFP modules
    774da7052156 net/sched: act_mirred: Add carrier check
    f3fae1b1c721 watchdog: dw_wdt: Fix the error handling path of dw_wdt_drv_probe()
    3b7798b42e1d writeback: fix call of incorrect macro
    f47f0fb5b58b net: dsa: mv88e6xxx: add mv88e6321 rsvd2cpu
    d6f0687d506d sit: update dev->needed_headroom in ipip6_tunnel_bind_dev()
    7311c8be3755 net/sched: cls_api: remove block_cb from driver_list before freeing
    cc8efc78c3f6 net/ncsi: clear Tx enable mode when handling a Config required AEN
    fa19c533ab19 scsi: qedi: Fix use after free bug in qedi_remove()
    4285cc0a22d2 dm verity: fix error handling for check_at_most_once on FEC
    fc097cfca004 dm verity: skip redundant verity_handle_err() on I/O errors
    26b1b0d0bebd mailbox: zynqmp: Fix counts of child nodes
    67fb57f24737 mailbox: zynq: Switch to flexible array to simplify code
    c4e636f025a1 crypto: ccp - Clear PSP interrupt status register before calling handler
    6f60aae72ccc ring-buffer: Ensure proper resetting of atomic variables in ring_buffer_reset_online_cpus
    2fcb12b3f421 tty: Prevent writing chars during tcsetattr TCSADRAIN/FLUSH
    6c2ee50c9012 tty: clean include/linux/tty.h up
    57b510c7d377 tty: move some tty-only functions to drivers/tty/tty.h
    1924d47a2809 tty: move some internal tty lock enums and functions out of tty.h
    f665d81ffad7 tty: audit: move some local functions out of tty.h
    6a392b806f18 tty: create internal tty.h file
    e044a2444718 netfilter: nf_tables: deactivate anonymous set from preparation phase
    a222d2794c53 scsi: target: core: Avoid smp_processor_id() in preemptible code
    14fc6af67b3f arm64: dts: qcom: sdm845: correct dynamic power coefficients
    c820c05c5ff6 sound/oss/dmasound: fix 'dmasound_setup' defined but not used
    9079ff34a1ac debugobject: Ensure pool refill (again)
    3f225f29c69c arm64: Stash shadow stack pointer in the task struct on interrupt
    9134b5a4647e arm64: Always load shadow stack pointer directly from the task struct
    a25a403e4b31 perf intel-pt: Fix CYC timestamps after standalone CBR
    905f847675cf perf auxtrace: Fix address filter entire kernel size
    ea827627a924 dm ioctl: fix nested locking in table_clear() to remove deadlock concern
    a1e3fffe02e0 dm flakey: fix a crash with invalid table line
    44f29e93a55b dm integrity: call kmem_cache_destroy() in dm_integrity_init() error path
    717ceb487bc3 dm clone: call kmem_cache_destroy() in dm_clone_init() error path
    eded3ad80a04 ia64: fix an addr to taddr in huge_pte_offset()
    abb427cb7730 s390/dasd: fix hanging blockdevice after request requeue
    c96807a4adbe btrfs: scrub: reject unsupported scrub flags
    f7fd1eed3125 scripts/gdb: fix lx-timerlist for Python3
    9aabb5f9ef32 afs: Fix updating of i_size with dv jump from server
    3530a795bb07 mfd: tqmx86: Correct board names for TQMxE39x
    cbe060011b56 mfd: tqmx86: Specify IO port register range more precisely
    640a1f7e36e8 mfd: tqmx86: Add support for TQMx110EB and TQMxE40x
    4be49b7c2457 mfd: tqmx86: Remove incorrect TQMx90UC board ID
    6697a3b0ed83 mfd: tqmx86: Do not access I2C_DETECT register through io_base
    15da2acad515 thermal/drivers/mediatek: Use devm_of_iomap to avoid resource leak in mtk_thermal_probe
    08012d9edc52 dmaengine: at_xdmac: do not enable all cyclic channels
    4f6303fd8f90 dmaengine: dw-edma: Fix to enable to issue dma request on DMA processing
    b29543194594 dmaengine: dw-edma: Fix to change for continuous transfer
    da67d60467dd phy: tegra: xusb: Add missing tegra_xusb_port_unregister for usb2_port and ulpi_port
    45e4c00940be pwm: mtk-disp: Disable shadow registers before setting backlight values
    6d13804388d6 pwm: mtk-disp: Adjust the clocks to avoid them mismatch
    060bd30bf705 pwm: mtk-disp: Don't check the return code of pwmchip_remove()
    795cec288e9c leds: tca6507: Fix error handling of using fwnode_property_read_string
    033f00eb8969 dmaengine: mv_xor_v2: Fix an error code.
    198fbdd10620 leds: TI_LMU_COMMON: select REGMAP instead of depending on it
    770b0613637f ext4: fix use-after-free read in ext4_find_extent for bigalloc + inline
    8f009ae90b2b openrisc: Properly store r31 to pt_regs on unhandled exceptions
    1fe1580521dd clocksource/drivers/davinci: Fix memory leak in davinci_timer_register when init fails
    3bc78eddf0a0 RDMA/mlx5: Use correct device num_ports when modify DC
    95468f165d93 SUNRPC: remove the maximum number of retries in call_bind_status
    50440cdb0b47 RDMA/mlx5: Fix flow counter query via DEVX
    0d6a5c9489c8 Input: raspberrypi-ts - fix refcount leak in rpi_ts_probe
    09bfd90d040f input: raspberrypi-ts: Release firmware handle when not needed
    3aa2503717ba firmware: raspberrypi: Introduce devm_rpi_firmware_get()
    73a65744c7fd NFSv4.1: Always send a RECLAIM_COMPLETE after establishing lease
    9c4c6512d733 IB/hfi1: Fix bugs with non-PAGE_SIZE-end multi-iovec user SDMA requests
    f84c02597857 IB/hfi1: Add additional usdma traces
    1af73620a191 IB/hfi1: Add AIP tx traces
    823b59fc5617 IB/hfi1: Fix SDMA mmu_rb_node not being evicted in LRU order
    8ec6acdb9b6a RDMA/srpt: Add a check for valid 'mad_agent' pointer
    16f596cfe956 RDMA/cm: Trace icm_send_rej event before the cm state is reset
    3ef7a4c0d5cd RDMA/siw: Remove namespace check from siw_netdev_event()
    ac7f79ee11c3 clk: add missing of_node_put() in "assigned-clocks" property parsing
    391fbf0d081d power: supply: generic-adc-battery: fix unit scaling
    9e5a7c110645 rtc: meson-vrtc: Use ktime_get_real_ts64() to get the current time
    9ad3221c86cc RDMA/mlx4: Prevent shift wrapping in set_user_sq_size()
    889a2070dc09 rtc: omap: include header for omap_rtc_power_off_program prototype
    647781347af9 workqueue: Fix hung time report of worker pools
    77d9a64cfbc6 workqueue: Rename "delayed" (delayed by active management) to "inactive"
    960167e0e019 RDMA/rdmavt: Delete unnecessary NULL check
    f7790aecb3c7 RDMA/siw: Fix potential page_array out of range access
    ab8646c9a0b1 clk: at91: clk-sam9x60-pll: fix return value check
    8f381b249424 perf/core: Fix hardlockup failure caused by perf throttle
    3ea9186a3ef5 powerpc/rtas: use memmove for potentially overlapping buffer copy
    6339b9dcdba2 macintosh: via-pmu-led: requires ATA to be set
    15f3a811bfde powerpc/sysdev/tsi108: fix resource printk format warnings
    4f41f55d82cb powerpc/wii: fix resource printk format warnings
    701e3e599913 powerpc/mpc512x: fix resource printk format warning
    d68265ec0bb1 macintosh/windfarm_smu_sat: Add missing of_node_put()
    c45ab3ab9c37 spmi: Add a check for remove callback when removing a SPMI driver
    4ca4a3e45436 staging: rtl8192e: Fix W_DISABLE# does not work after stop/start
    d5d628fea5f6 serial: 8250: Add missing wakeup event reporting
    fde8ffaaacfa tty: serial: fsl_lpuart: adjust buffer length to the intended size
    5a76bc35cce8 firmware: stratix10-svc: Fix an NULL vs IS_ERR() bug in probe
    012936502a9c usb: mtu3: fix kernel panic at qmu transfer done irq handler
    e8f64f3200cd usb: chipidea: fix missing goto in `ci_hdrc_probe`
    7d667749b3dd usb: gadget: tegra-xudc: Fix crash in vbus_draw
    95d97e182dbd sh: sq: Fix incorrect element size for allocating bitmap buffer
    a69eb1200eb6 uapi/linux/const.h: prefer ISO-friendly __typeof__
    fd7bf900c321 i2c: cadence: cdns_i2c_master_xfer(): Fix runtime PM leak on error path
    b24f1ecc8fe2 spi: cadence-quadspi: fix suspend-resume implementations
    b5a6930fc6a4 ASoC: fsl_mqs: move of_node_put() to the correct location
    5bf2d84074dd coresight: etm_pmu: Set the module field
    174d7483f15c scripts/gdb: bail early if there are no generic PD
    01710564a92a scripts/gdb: bail early if there are no clocks
    b4b4409510a3 ia64: salinfo: placate defined-but-not-used warning
    65b5b2c5fd86 ia64: mm/contig: fix section mismatch warning/error
    fd4e45d8d7c8 PCI/EDR: Clear Device Status after EDR error recovery
    9e5ee4fa0d06 of: Fix modalias string generation
    85b4aa4eb2e3 vmci_host: fix a race condition in vmci_host_poll() causing GPF
    4bdae667f911 spi: fsl-spi: Fix CPM/QE mode Litte Endian
    bc88243bbe61 spi: qup: Don't skip cleanup in remove's error path
    00c5b5498bd1 linux/vt_buffer.h: allow either builtin or modular for macros
    d4a3c912c87b ASoC: es8316: Handle optional IRQ assignment
    67b6e077fb89 ASoC: es8316: Use IRQF_NO_AUTOEN when requesting the IRQ
    eb971efca7f0 PCI: imx6: Install the fault handler only on compatible match
    36c237b202a4 usb: gadget: udc: renesas_usb3: Fix use after free bug in renesas_usb3_remove due to race condition
    aa93a46f998a spi: imx: Don't skip cleanup in remove's error path
    c3aba912f40e spi: spi-imx: using pm_runtime_resume_and_get instead of pm_runtime_get_sync
    f1f3bc9915b2 iio: light: max44009: add missing OF device matching
    ed1f459af644 fpga: bridge: fix kernel-doc parameter description
    98bf98e749e6 usb: dwc3: gadget: Change condition for processing suspend event
    8a859ac86dea usb: host: xhci-rcar: remove leftover quirk handling
    c76ba917915c pstore: Revert pmsg_lock back to a normal mutex
    7d285c6cfee6 ipmi: ASPEED_BT_IPMI_BMC: select REGMAP_MMIO instead of depending on it
    230a5ed7d813 tcp/udp: Fix memleaks of sk and zerocopy skbs with TX timestamp.
    0abcb0b0d629 net: amd: Fix link leak when verifying config failed
    b978d22fa122 netlink: Use copy_to_user() for optval in netlink_getsockopt().
    0837d10f6c37 Revert "Bluetooth: btsdio: fix use after free bug in btsdio_remove due to unfinished work"
    566785731c6d ipv4: Fix potential uninit variable access bug in __ip_make_skb()
    4b8a05e38016 net/sched: sch_fq: fix integer overflow of "credit"
    cb71b24a8927 netfilter: nf_tables: don't write table validation state without mutex
    f4fc43fde12a bpf: Don't EFAULT for getsockopt with optval=NULL
    80090acb5885 ixgbe: Enable setting RSS table to default values
    7a150a5b5468 ixgbe: Allow flow hash to be set via ethtool
    89496d6cff29 wifi: iwlwifi: fw: fix memory leak in debugfs
    f4eb14d2618f wifi: iwlwifi: mvm: check firmware response size
    4ff7c0fbb3fd wifi: iwlwifi: make the loop for card preparation effective
    62fde4651759 jdb2: Don't refuse invalidation of already invalidated buffers
    038cbab55069 wifi: iwlwifi: fw: move memset before early return
    c0ca3824190e wifi: iwlwifi: yoyo: Fix possible division by zero
    2a65555f7e0f md/raid10: fix memleak of md thread
    6361b0592b46 md/raid10: fix memleak for 'conf->bio_split'
    1697fb124c6d md/raid10: fix leak of 'r10bio->remaining' for recovery
    fcacaa9d0457 bpf, sockmap: Revert buggy deadlock fix in the sockhash and sockmap
    21f2503d37ee nvme-fcloop: fix "inconsistent {IN-HARDIRQ-W} -> {HARDIRQ-ON-W} usage"
    e119d1918303 nvme: fix async event trace event
    a9e3d9bac963 nvme: handle the persistent internal error AER
    2f9307222227 bpf, sockmap: fix deadlocks in the sockhash and sockmap
    2be04fa7ee85 net: ethernet: stmmac: dwmac-rk: fix optional phy regulator handling
    bab8dc38b1a0 scsi: lpfc: Fix ioremap issues in lpfc_sli4_pci_mem_setup()
    b2f423fda64f f2fs: fix to avoid use-after-free for cached IPU bio
    5877980dc2e4 xsk: Fix unaligned descriptor validation
    2a67bc52cd3f crypto: drbg - Only fail when jent is unavailable in FIPS mode
    9dbdedd44ff4 crypto: drbg - make drbg_prepare_hrng() handle jent instantiation errors
    27942f477d10 bpftool: Fix bug for long instructions in program CFG dumps
    072d16abf567 selftests/bpf: Wait for receive in cg_storage_multi test
    d64a12eeb4a6 net: qrtr: correct types of trace event parameters
    dc55805db254 wifi: rtlwifi: fix incorrect error codes in rtl_debugfs_set_write_reg()
    c621697505b3 wifi: rtlwifi: fix incorrect error codes in rtl_debugfs_set_write_rfreg()
    adc2d82eee22 crypto: sa2ul - Select CRYPTO_DES
    de3908e15152 crypto: caam - Clear some memory in instantiate_rng
    a8226a45b2a9 f2fs: compress: fix to call f2fs_wait_on_page_writeback() in f2fs_write_raw_pages()
    d11a74577c21 f2fs: apply zone capacity to all zone type
    d420c4a06d8f f2fs: enforce single zone capacity
    c3a1914b9678 f2fs: handle dqget error in f2fs_transfer_project_quota()
    202048ec1ee5 scsi: megaraid: Fix mega_cmd_done() CMDID_INT_CMDS
    bfe67e056327 scsi: target: iscsit: Fix TAS handling during conn cleanup
    e1f59cd18a10 scsi: target: Fix multiple LUN_RESET handling
    008b936bbde3 scsi: target: Make state_list per CPU
    7c8a29f1b22e scsi: target: Rename cmd.bad_sector to cmd.sense_info
    621c89a0216a scsi: target: Rename struct sense_info to sense_detail
    05c6db12aece net/packet: convert po->auxdata to an atomic flag
    5ca1be3658cd net/packet: convert po->origdev to an atomic flag
    8bb81a925a9f net/packet: annotate accesses to po->xmit
    ba6d56b20e8a vlan: partially enable SIOCSHWTSTAMP in container
    118df5df1b4b bpf: Remove misleading spec_v1 check on var-offset stack read
    10c105126787 scm: fix MSG_CTRUNC setting condition for SO_PASSSEC
    10702be8b373 bpf: fix precision propagation verbose logging
    6be8ad4cdcac bpf: take into account liveness when propagating precision
    243fab8e37d4 wifi: rtw88: mac: Return the original error from rtw_mac_power_switch()
    1980dd8c53ec wifi: rtw88: mac: Return the original error from rtw_pwr_seq_parser()
    3ab6ec6c485b tools: bpftool: Remove invalid \' json escape
    1300517e371e wifi: ath6kl: reduce WARN to dev_dbg() in callback
    6c91b3b57b1f wifi: ath5k: fix an off by one check in ath5k_eeprom_read_freq_list()
    320d760a3527 wifi: ath9k: hif_usb: fix memory leak of remain_skbs
    129c3fb5795d wifi: ath6kl: minor fix for allocation size
    c4013689269d tick/common: Align tick period with the HZ tick.
    107ea1f63b26 tick: Get rid of tick_period
    fdc48767461a tick/sched: Optimize tick_do_update_jiffies64() further
    93c43008368d tick/sched: Reduce seqcount held scope in tick_do_update_jiffies64()
    ca721584e9a4 tick/sched: Use tick_next_period for lockless quick check
    780f303233c3 drm/i915: Make intel_get_crtc_new_encoder() less oopsy
    9edf5518db25 debugobject: Prevent init race with static objects
    f16f065f8ce3 arm64: kgdb: Set PSTATE.SS to 1 to re-enable single-step
    55fc2246c46d x86/ioapic: Don't return 0 from arch_dynirq_lower_bound()
    dfce9bb3517a regulator: stm32-pwr: fix of_iomap leak
    a6aeba550c59 media: venus: dec: Fix handling of the start cmd
    3a227dc12b1a media: venus: vdec: Handle DRC after drain
    5bac3de7f49f media: venus: preserve DRC state across seeks
    4c1239274f41 media: venus: vdec: Make decoder return LAST flag for sufficient event
    a30297bff881 media: venus: vdec: Fix non reliable setting of LAST flag
    025a34716c88 media: rc: gpio-ir-recv: Fix support for wake-up
    1acb982e3616 media: rcar_fdp1: Fix refcount leak in probe and remove function
    ccc454881f09 media: rcar_fdp1: Fix the correct variable assignments
    ee24c9e23206 media: rcar_fdp1: Make use of the helper function devm_platform_ioremap_resource()
    bf91fb6c1e9d media: rcar_fdp1: fix pm_runtime_get_sync() usage count
    21de9d0daab1 media: rcar_fdp1: simplify error check logic at fdp_open()
    7dac96e9cc98 media: saa7134: fix use after free bug in saa7134_finidev due to race condition
    e9d64e90a0ad media: dm1105: Fix use after free bug in dm1105_remove due to race condition
    de19d02d734e media: rkvdec: fix use after free bug in rkvdec_remove
    4883f0f7ee44 x86/apic: Fix atomic update of offset in reserve_eilvt_offset()
    06140d6dfe72 regulator: core: Avoid lockdep reports when resolving supplies
    4c0b98d87c3e regulator: core: Consistently set mutex_owner when using ww_mutex_lock_slow()
    e21c93b20a86 drm/lima/lima_drv: Add missing unwind goto in lima_pdev_probe()
    0fc1a90bcef7 ARM: dts: gta04: fix excess dma channel usage
    f59421334e94 mmc: sdhci-of-esdhc: fix quirk to ignore command inhibit for data
    1487b29030ba ACPI: processor: Fix evaluating _PDC method when running as Xen dom0
    ee22417f8299 drm: msm: adreno: Disable preemption on Adreno 510
    00f02bb8cb05 drm/msm/adreno: drop bogus pm_runtime_set_active()
    f9ba5962ccfc drm/msm/adreno: Defer enabling runpm until hw_init()
    9a3a907cf69f media: max9286: Free control handler
    f8d28cecf210 drm/bridge: adv7533: Fix adv7533_mode_valid for adv7533 and adv7535
    076cdba34de2 firmware: qcom_scm: Clear download bit during reboot
    4362444dca02 media: bdisp: Add missing check for create_workqueue
    a9b9ea0e63a0 x86/MCE/AMD: Use an u64 for bank_map
    a8504f9a1304 ARM: dts: qcom: ipq8064: Fix the PCI I/O port range
    7d731faebc8e ARM: dts: qcom: ipq8064: reduce pci IO size to 64K
    870644bf1bfc ARM: dts: qcom: ipq4019: Fix the PCI I/O port range
    45855912958f arm64: dts: qcom: msm8996: Fix the PCI I/O port range
    b6082e8caad8 arm64: dts: qcom: ipq8074: Fix the PCI I/O port range
    5f6302ab78f4 arm64: dts: qcom: msm8998: Fix the PCI I/O port range
    212352542d72 arm64: dts: qcom: sdm845: Fix the PCI I/O port range
    eb9c5b383e03 arm64: dts: qcom: sdm845: correct dynamic power coefficients
    94e6f7e75729 arm64: dts: qcom: msm8998: Fix stm-stimulus-base reg name
    e951bdaa6586 EDAC/skx: Fix overflows on the DRAM row address mapping arrays
    6e6c27b2fb9d drm/msm/disp/dpu: check for crtc enable rather than crtc active to release shared resources
    9c4c9010ae80 arm64: dts: renesas: r8a774c0: Remove bogus voltages from OPP table
    fbfca9b8399f arm64: dts: renesas: r8a77990: Remove bogus voltages from OPP table
    08310f810975 soc: ti: pm33xx: Fix refcount leak in am33xx_pm_probe
    a1e6a4161a27 soc: ti: pm33xx: Enable basic PM runtime support for genpd
    e33f374d65d9 drm/probe-helper: Cancel previous job before starting new one
    67f07215eb8b drm/vgem: add missing mutex_destroy
    ae784c3ed373 drm/rockchip: Drop unbalanced obj unref
    056a1217cffa erofs: fix potential overflow calculating xattr_isize
    7a4579cd6e49 erofs: stop parsing non-compact HEAD index if clusterofs is invalid
    e5ec129158f3 tpm, tpm_tis: Claim locality when interrupts are reenabled on resume
    933bfc5ad213 tpm, tpm: Implement usage counter for locality
    140735c46d37 tpm, tpm_tis: Claim locality before writing interrupt registers
    35ca7f625283 tpm, tpm_tis: Disable interrupts if tpm_tis_probe_irq() failed
    cbb1dd27058e tpm, tpm_tis: Claim locality before writing TPM_INT_ENABLE register
    c62a2331abfa tpm, tpm_tis: Do not skip reset of original interrupt vector
    3ec77043a27d selinux: ensure av_permissions.h is built when needed
    fea314463926 selinux: fix Makefile dependencies of flask.h
    0c29f14cf470 selftests/resctrl: Check for return value after write_schemata()
    4075fbcde40f selftests/resctrl: Return NULL if malloc_and_init_memory() did not alloc mem
    d0653cc6e0c7 rcu: Fix missing TICK_DEP_MASK_RCU_EXP dependency check
    d1ab8b54b2ce clk: rockchip: rk3399: allow clk_cifout to force clk_cifout_src to reparent
    e0dd13b49da9 wifi: rtl8xxxu: RTL8192EU always needs full init
    0fd9b0f61119 mailbox: zynqmp: Fix typo in IPI documentation
    63314371ebbf mailbox: zynqmp: Fix IPI isr handling
    bdbf104b1c91 md/raid10: fix null-ptr-deref in raid10_sync_request
    8a89d36a07af nilfs2: fix infinite loop in nilfs_mdt_get_block()
    7c3e66204805 nilfs2: do not write dirty data after degenerating to read-only
    e4b526442247 parisc: Fix argument pointer in real64_call_asm()
    be649ea153b0 sound/oss/dmasound: fix build when drivers are mixed =y/=m
    b8f444a4fadf ubifs: Free memory for tmpfile name
    5b4b6cb7246e ubi: Fix return value overwrite issue in try_write_vid_and_data()
    66e9f2fb3e75 ubifs: Fix memleak when insert_old_idx() failed
    a4904c56fc6f Revert "ubifs: dirty_cow_znode: Fix memleak in error handling path"
    87d98984b050 iommu/amd: Fix "Guest Virtual APIC Table Root Pointer" configuration in IRTE
    db8b34ffb29b i2c: omap: Fix standard mode false ACK readings
    2b00b2a0e642 writeback, cgroup: fix null-ptr-deref write in bdi_split_work_to_wbs
    1b0df44753bf relayfs: fix out-of-bounds access in relay_file_read
    e28df70df007 KVM: nVMX: Emulate NOPs in L2, and PAUSE if it's not intercepted
    680c419d0d8a reiserfs: Add security prefix to xattr name in reiserfs_security_write()
    eb18bc5a8678 rcu: Avoid stack overflow due to __rcu_irq_enter_check_tick() being kprobe-ed
    0a89d4a07552 crypto: safexcel - Cleanup ring IRQ workqueues on load failure
    ff86deaba1fa crypto: api - Demote BUG_ON() in crypto_unregister_alg() to a WARN_ON()
    1c99f65d6af2 ring-buffer: Sync IRQ works before buffer destruction
    dda1372c8d83 pwm: meson: Fix g12a ao clk81 name
    c1cabb10e072 pwm: meson: Fix axg ao mux parents
    fcd2da2e6bf2 kheaders: Use array declaration instead of char
    1b633da2fecf ipmi: fix SSIF not responding under certain cond.
    6d5993d56963 ipmi:ssif: Add send_retries increment
    47e61cadc7a5 MIPS: fw: Allow firmware to pass a empty env
    2884595932ea tick/nohz: Fix cpu_is_hotpluggable() by checking with nohz subsystem
    29b89908fdd9 xhci: fix debugfs register accesses while suspended
    a863ac03fae0 staging: iio: resolver: ads1210: fix config mode
    c8714ddf3ccf ext4: use ext4_journal_start/stop for fast commit transactions
    701a8220762f blk-crypto: make blk_crypto_evict_key() more robust
    5072008bef23 blk-crypto: make blk_crypto_evict_key() return void
    874bdf43b4a7 blk-mq: release crypto keyslot before reporting I/O complete
    68494eb75f1f perf sched: Cast PTHREAD_STACK_MIN to int as it may turn into sysconf(__SC_THREAD_STACK_MIN_VALUE)
    7c5811b95c57 posix-cpu-timers: Implement the missing timer_wait_running callback
    aed39acf7ed6 hwmon: (adt7475) Use device_property APIs when configuring polarity
    b009006887e3 hwmon: (k10temp) Check range scale when CUR_TEMP register is read-write
    a71cb92ec431 USB: dwc3: fix runtime pm imbalance on unbind
    27dc207c386e USB: dwc3: fix runtime pm imbalance on probe errors
    b978269ddad4 PCI: qcom: Fix the incorrect register usage in v2.7.0 config
    2f31633da843 PCI: pciehp: Fix AB-BA deadlock between reset_lock and device_lock
    5434c7019d23 wireguard: timers: cast enum limits members to int in prints
    69fdbb334d6e asm-generic/io.h: suppress endianness warnings for readq() and writeq()
    925cbb725367 ASoC: Intel: bytcr_rt5640: Add quirk for the Acer Iconia One 7 B1-750
    f5e96af71eab iio: adc: palmas_gpadc: fix NULL dereference on rmmod
    8aa079c2fdfc driver core: Don't require dynamic_debug for initcall_debug probe timing
    f964a00386ca USB: serial: option: add UNISOC vendor and TOZED LT70C product
    c0e921422359 x86/fpu: Prevent FPU state corruption
    98cfbad52fc2 bluetooth: Perform careful capability checks in hci_sock_ioctl()
    dc110b20f4ce drm/fb-helper: set x/yres_virtual in drm_fb_helper_check_var
    549825602e3e wifi: brcmfmac: slab-out-of-bounds read in brcmf_get_assoc_ies()
    1dd95b2109de KVM: arm64: Fix buffer overflow in kvm_arm_set_fw_reg()
    0f29d0e8fc77 counter: 104-quad-8: Fix race condition between FLAG and CNTR reads
    d4a895e924b4 seccomp: Move copy_seccomp() to no failure path.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index f39b28c5fb..332a19366a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "42be00a6acf8aa69c1816ed0022af788eda02635"
-SRCREV_meta ?= "4ffe48fc9d3491d0123ea5698759f2010f22372d"
+SRCREV_machine ?= "8008621f28248a94b5f1154350a4fc9c71b130d5"
+SRCREV_meta ?= "4476e17760bea9d68c392368f2396a2e9efa86c3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.179"
+LINUX_VERSION ?= "5.10.180"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index c77162c9f9..e8d4eeea72 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.179"
+LINUX_VERSION ?= "5.10.180"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "c368271929a4b4b419575966578abb32cab23b5d"
-SRCREV_machine ?= "f1b49ee7456e402d93961861e611b9ca829da753"
-SRCREV_meta ?= "4ffe48fc9d3491d0123ea5698759f2010f22372d"
+SRCREV_machine:qemuarm ?= "d0dc3a46c784849731fc25990679b676f4306cef"
+SRCREV_machine ?= "5ca66907abef1e8a0be5d3109fd3f0d50f77bc5f"
+SRCREV_meta ?= "4476e17760bea9d68c392368f2396a2e9efa86c3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 46b9fdf870..cb28294a7f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "7b27b209bb9a594edeb3b4f4b919e8900aade179"
-SRCREV_machine:qemuarm64 ?= "17427c04e8d8c55004e817279ea99e977097787f"
-SRCREV_machine:qemumips ?= "0bd9e4cdcd99d0d4576a1198bba063ba2500ab16"
-SRCREV_machine:qemuppc ?= "123f9fe3b1ce8c60a4b55c0030a8a7428c18a516"
-SRCREV_machine:qemuriscv64 ?= "15c1b808c9f87a794a15ceaf104514e0a2bc21c1"
-SRCREV_machine:qemuriscv32 ?= "15c1b808c9f87a794a15ceaf104514e0a2bc21c1"
-SRCREV_machine:qemux86 ?= "15c1b808c9f87a794a15ceaf104514e0a2bc21c1"
-SRCREV_machine:qemux86-64 ?= "15c1b808c9f87a794a15ceaf104514e0a2bc21c1"
-SRCREV_machine:qemumips64 ?= "55e025dc1b9a8847f0307b87e07e175c929528a0"
-SRCREV_machine ?= "15c1b808c9f87a794a15ceaf104514e0a2bc21c1"
-SRCREV_meta ?= "4ffe48fc9d3491d0123ea5698759f2010f22372d"
+SRCREV_machine:qemuarm ?= "1cf6a458134cbbe232467622d8e34d2e9d10e92b"
+SRCREV_machine:qemuarm64 ?= "5db230097771631366812f12c9b04c8379f53c24"
+SRCREV_machine:qemumips ?= "795276fa64f0874a4ee0dcfa9c78e572314bdfa1"
+SRCREV_machine:qemuppc ?= "6ccfcf5138703538662241bf8ed897a1ef2a3def"
+SRCREV_machine:qemuriscv64 ?= "c6515d2a698792220bed8fd39ccbcfec64d1130f"
+SRCREV_machine:qemuriscv32 ?= "c6515d2a698792220bed8fd39ccbcfec64d1130f"
+SRCREV_machine:qemux86 ?= "c6515d2a698792220bed8fd39ccbcfec64d1130f"
+SRCREV_machine:qemux86-64 ?= "c6515d2a698792220bed8fd39ccbcfec64d1130f"
+SRCREV_machine:qemumips64 ?= "4d6b146f00b8efc99e3d3d1d8a63220c29590c8d"
+SRCREV_machine ?= "c6515d2a698792220bed8fd39ccbcfec64d1130f"
+SRCREV_meta ?= "4476e17760bea9d68c392368f2396a2e9efa86c3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.179"
+LINUX_VERSION ?= "5.10.180"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


