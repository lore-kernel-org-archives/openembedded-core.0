Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12462C47DD9
	for <webhook@archiver.kernel.org>; Sun, 25 Feb 2024 21:53:14 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.7428.1708897984623457261
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 13:53:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aorJVoQV;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-29a74c88f74so1651118a91.3
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 13:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708897984; x=1709502784; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=prRc0dEHjK2h3oQXos9acXfZ6L2q/QmY0yeA8N3Bzx4=;
        b=aorJVoQVnPPcSEYvD953xhQs9/AQ2kivSGfYzijE38PXewJIV8d7bjH28v5IDk+oen
         yYFU3S/0ed/LSd5x98l9BwwWnmE2+5JQQAKt5DS845e0qUqJJDpQrWELoRWOY2ZnRoig
         mkkeFTqv9tGbpYEH0OiwKUxfTJcietnMT+Fl4h2pVct7MAQKzPpOZv0msailnle3H/M4
         AieHW75S4kE1Q/KZaiwciWEzWWQ4Cj/Kldt29UzUqe/rN52NHeQOGKDi6ncE3+N7GThS
         /KCP9NebhAAbxQvnJzVOvo2FEalxTBnK79Zbui4MUJs7m0Fn8/3qOsA8L3e2kRSMKCu5
         NiSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708897984; x=1709502784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=prRc0dEHjK2h3oQXos9acXfZ6L2q/QmY0yeA8N3Bzx4=;
        b=Nr3fWqWsyCEHqCP5wN0ooz3m6PMpsxJb1XtTYLDuK2S+siiEfMvQVnnUcR8+V6+BB4
         cyW9rtJTswJyAuWg9M34slz6sAKsihE671TN6t6AfbkJtPRJHGTrYISsG3zeeD2Hndr9
         Owv0TkowHeqzcIA4hRu3SAIfnHgJABbizdtEtHDe96MbwXJ6APOolvHK6imdExTOhR+a
         LU2cYZTkGhKPY2qg/OciJca/nGW1CDgfEe5sj3XiO8c+OOstKhiMRfZKViPZi6m1bJpa
         T1LYI4oR1fEM5CDvhvnaU/7Un+4ks4aYgYFD3oNJypsOYmCWAACxzy2BgWOYiw2FQ6Kj
         qSzA==
X-Gm-Message-State: AOJu0YxYyY6OgxVPOfjk7cLYgXH7MqaaVA2RyIWgjBbQ+O0o+zwKyVPM
	/+INiftDaZTGlS2S2I1Du58ETq5zBvUG0jV0yso5i1lTSK+kWxVYKFTme5/6YyrCmjOCQ4nbfTk
	PVMw5Uw==
X-Google-Smtp-Source: AGHT+IETmXLfNrfZybsr4glVeFkfJiD0nrMEu4IWC6KLLwGcVts8p8TZVrcP3tRb3Amgy4rMu/4zEg==
X-Received: by 2002:a17:90a:898e:b0:29a:a423:b1bd with SMTP id v14-20020a17090a898e00b0029aa423b1bdmr2482810pjn.9.1708897983560;
        Sun, 25 Feb 2024 13:53:03 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a12-20020a17090acb8c00b0029a4089fbf0sm3082947pju.16.2024.02.25.13.53.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 13:53:03 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/22] linux-yocto/5.10: update to v5.10.209
Date: Sun, 25 Feb 2024 11:52:26 -1000
Message-Id: <bc5c1a8631e65a2e6715987f67b8957b41da5dcc.1708897822.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708897822.git.steve@sakoman.com>
References: <cover.1708897822.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 21:53:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196159

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    16ad71c250c1 Linux 5.10.209
    66e4f4a84791 arm64: dts: armada-3720-turris-mox: set irq type for RTC
    2e23761beb90 i2c: s3c24xx: fix transferring more than one message in polling mode
    da60686bab6b i2c: s3c24xx: fix read transfers in polling mode
    8ba74e90162e selftests: mlxsw: qos_pfc: Adjust the test to support 8 lanes
    3e1ca8065926 selftests: mlxsw: qos_pfc: Convert to iproute2 dcb
    56750ea5d154 mlxsw: spectrum_acl_tcam: Fix stack corruption
    a9b233b287aa mlxsw: spectrum_acl_tcam: Reorder functions to avoid forward declarations
    d3669ebc4c2a mlxsw: spectrum_acl_tcam: Make fini symmetric to init
    a557dbda6407 mlxsw: spectrum_acl_tcam: Add missing mutex_destroy()
    936d06d699c3 mlxsw: spectrum: Use 'bitmap_zalloc()' when applicable
    e8bfdf630142 mlxsw: spectrum_acl_erp: Fix error flow of pool allocation failure
    f90b1cebc442 ethtool: netlink: Add missing ethnl_ops_begin/complete
    b44e1aec8038 kdb: Fix a potential buffer overflow in kdb_local()
    977c2cf5637a ipvs: avoid stat macros calls from preemptible context
    00a86f81c80e netfilter: nf_tables: reject NFT_SET_CONCAT with not field length description
    9a4d25267d50 netfilter: nf_tables: skip dead set elements in netlink dump
    2d4c0798a1ef netfilter: nf_tables: do not allow mismatch field size and set key length
    b099b495e1da net: dsa: vsc73xx: Add null pointer check to vsc73xx_gpio_probe
    6c8a5bbca6e6 net: ravb: Fix dma_addr_t truncation in error case
    ba77c8b4e106 net: phy: micrel: populate .soft_reset for KSZ9131
    1658d7a7a207 net: ethernet: ti: am65-cpsw: Fix max mtu to fit ethernet frames
    2295c22348fa net: qualcomm: rmnet: fix global oob in rmnet_policy
    b55808b96e63 s390/pci: fix max size calculation in zpci_memcpy_toio()
    178b4373446d PCI: keystone: Fix race condition when initializing PHYs
    0de2e62067d2 nvmet-tcp: Fix the H2C expected PDU len calculation
    172276460ab5 serial: imx: Correct clock error message in function probe()
    5ff00408e502 apparmor: avoid crash when parsed profile name is empty
    866d32bff035 perf env: Avoid recursively taking env->bpf_progs.lock
    39669fae69f3 nvmet-tcp: fix a crash in nvmet_req_complete()
    f775f2621c2a nvmet-tcp: Fix a kernel panic when host sends an invalid H2C PDU length
    1550b870ae9c usb: cdc-acm: return correct error code on unsupported break
    d7c74b010aae tty: use 'if' in send_break() instead of 'goto'
    3483ca0390c1 tty: don't check for signal_pending() in send_break()
    2cf81d344032 tty: early return from send_break() on TTY_DRIVER_HARDWARE_BREAK
    4e76dbd7c360 tty: change tty_write_lock()'s ndelay parameter to bool
    abcc25a23731 perf genelf: Set ELF program header addresses properly
    1e17feb4ada9 iio: adc: ad9467: fix scale setting
    a3167e5ab5b8 iio: adc: ad9467: don't ignore error codes
    00e916d9985f iio: adc: ad9467: fix reset gpio handling
    8083d6840179 iio: adc: ad9467: Benefit from devm_clk_get_enabled() to simplify
    6e04a9d30509 serial: imx: fix tx statemachine deadlock
    6746f3e8939d software node: Let args be NULL in software_node_get_reference_args
    381bea33a86e acpi: property: Let args be NULL in __acpi_node_get_property_reference
    7166e8e9135e libapi: Add missing linux/types.h header to get the __u64 type on io.h
    bc57f3ef8a9e serial: 8250: omap: Don't skip resource freeing if pm_runtime_resume_and_get() failed
    89b97e6b19a8 power: supply: cw2015: correct time_to_empty units in sysfs
    5e3995ec39c4 MIPS: Alchemy: Fix an out-of-bound access in db1550_dev_setup()
    c3ed63f6a1c2 MIPS: Alchemy: Fix an out-of-bound access in db1200_dev_setup()
    9995dee8b952 mips: Fix incorrect max_low_pfn adjustment
    5cdda6239ce6 mips: dmi: Fix early remap on MIPS32
    b1528687739b leds: aw2013: Select missing dependency REGMAP_I2C
    927626a20738 mfd: syscon: Fix null pointer dereference in of_syscon_register()
    c964a0597b50 HID: wacom: Correct behavior when processing some confidence == false touches
    c7883c9f83e6 iio: adc: ad7091r: Pass iio_dev to event handler
    ba7be6667408 KVM: arm64: vgic-its: Avoid potential UAF in LPI translation cache
    9b5a278594b9 KVM: arm64: vgic-v4: Restore pending state on host userspace write
    7521ea8f62b2 x86/kvm: Do not try to disable kvmclock if it was not enabled
    322c5fe40f7f wifi: mwifiex: configure BSSID consistently when starting AP
    ba8a4fba622a wifi: rtlwifi: Convert LNKCTL change to PCIe cap RMW accessors
    3dc3122b0be3 wifi: rtlwifi: Remove bogus and dangerous ASPM disable/enable code
    5e9142b6a200 iommu/arm-smmu-qcom: Add missing GMU entry to match table
    394c6c0b6d9b Bluetooth: Fix atomicity violation in {min,max}_key_size_set
    3b8d7a1b8519 rootfs: Fix support for rootfstype= when root= is given
    8c0b563e9b4d io_uring/rw: ensure io->bytes_done is always initialized
    daa61bacd3b9 pwm: jz4740: Don't use dev_err_probe() in .request()
    a7d4ec5672b5 fbdev: flush deferred work in fb_deferred_io_fsync()
    ff2d54d9ccb4 ALSA: hda/relatek: Enable Mute LED on HP Laptop 15s-fq2xxx
    b5c2a32621ae ALSA: oxygen: Fix right channel of capture volume mixer
    57f34589e954 serial: imx: Ensure that imx_uart_rs485_config() is called with enabled clock
    b7747ca58e85 usb: mon: Fix atomicity violation in mon_bin_vma_fault
    5e5ab50effb5 usb: typec: class: fix typec_altmode_put_partner to put plugs
    baaa6d8e3f72 Revert "usb: typec: class: fix typec_altmode_put_partner to put plugs"
    f5c09e1d6e33 usb: chipidea: wait controller resume finished for wakeup irq
    084de4c659bb Revert "usb: dwc3: don't reset device side if dwc3 was configured as host-only"
    1af042358781 Revert "usb: dwc3: Soft reset phy on probe for host"
    325388866014 usb: dwc: ep0: Update request status in dwc3_ep0_stall_restart
    e70b17282a5c usb: phy: mxs: remove CONFIG_USB_OTG condition for mxs_phy_is_otg_host()
    d65cade544de tick-sched: Fix idle and iowait sleeptime accounting vs CPU hotplug
    7e7a0d86542b binder: fix race between mmput() and do_exit()
    cce8ba6fa4ec xen-netback: don't produce zero-size SKB frags
    d1e68ad27901 net: ethernet: mtk_eth_soc: remove duplicate if statements
    8a2946391531 kprobes: Fix to handle forcibly unoptimized kprobes on freeing_list
    c02cdc2c5e87 Revert "ASoC: atmel: Remove system clock tree configuration for at91sam9g20ek"
    79026a2d0a1b virtio-crypto: fix memory leak in virtio_crypto_alg_skcipher_close_session()
    dfdb686d1b43 virtio-crypto: fix memory-leak
    c3b3389ad046 dma-mapping: Fix build error unused-value
    0dfe57f1f237 Input: atkbd - use ab83 as id when skipping the getid command
    c8c1158ffb00 binder: fix use-after-free in shinker's callback
    abbb90928719 binder: fix unused alloc->free_async_space
    fa62c9050e9d binder: fix async space check for 0-sized buffers
    4533e7623e6d keys, dns: Fix size check of V1 server-list header
    9e8a31c1aa4a of: unittest: Fix of_count_phandle_with_args() expected value message
    d5f490343c77 of: Fix double free in of_parse_phandle_with_args_map
    c9ee325baed1 IB/iser: Prevent invalidating wrong MR
    bedecbb5a5fc mmc: sdhci_omap: Fix TI SoC dependencies
    613af7d57622 mmc: sdhci_am654: Fix TI SoC dependencies
    8da3a51f74e1 pwm: stm32: Fix enable count for clk in .probe()
    e33e1bdbe66a pwm: stm32: Use hweight32 in stm32_pwm_detect_channels
    5af4ce2a543d pwm: stm32: Use regmap_clear_bits and regmap_set_bits where applicable
    bed5ec2a5984 clk: fixed-rate: fix clk_hw_register_fixed_rate_with_accuracy_parent_hw
    764b78b927e7 clk: fixed-rate: add devm_clk_hw_register_fixed_rate
    e5236e58cc65 clk: si5341: fix an error code problem in si5341_output_clk_set_rate
    428381fbcb1f watchdog: rti_wdt: Drop runtime pm reference count when watchdog is unused
    d83662bb9079 watchdog: bcm2835_wdt: Fix WDIOC_SETTIMEOUT handling
    6c93290da90b watchdog/hpwdt: Only claim UNKNOWN NMI if from iLO
    cbc15095d1ff watchdog: set cdev owner before adding
    e4f4a2cb7447 drivers: clk: zynqmp: update divider round rate logic
    af0b86199b6c clk: zynqmp: Add a check for NULL pointer
    45b4ea38c93c clk: zynqmp: make bestdiv unsigned
    7fdcd873c047 drivers: clk: zynqmp: calculate closest mux rate
    6cccbfafc0d3 clk: qcom: videocc-sm8150: Add missing PLL config property
    84ee04572faa clk: qcom: videocc-sm8150: Update the videocc resets
    74bbdacf1bc9 dt-bindings: clock: Update the videocc resets for sm8150
    0c8ba6937a8c gpu/drm/radeon: fix two memleaks in radeon_vm_init
    520e213a0b97 drivers/amd/pm: fix a use-after-free in kv_parse_power_table
    aeed2b4e4a70 drm/amd/pm: fix a double-free in si_dpm_init
    d53fee9e34f6 drm/amdgpu/debugfs: fix error code when smc register accessors are NULL
    56a79c68b5e3 media: dvb-frontends: m88ds3103: Fix a memory leak in an error handling path of m88ds3103_probe()
    b5ebb9b4c1da media: dvbdev: drop refcount on error path in dvb_device_open()
    9284f409e407 f2fs: fix to update iostat correctly in f2fs_filemap_fault()
    40d36882c7dc f2fs: fix to check compress file in f2fs_move_file_range()
    b864287581c5 media: rkisp1: Disable runtime PM in probe error path
    962b35733b46 clk: qcom: gpucc-sm8150: Update the gpu_cc_pll1 config
    21a30b59693a media: cx231xx: fix a memleak in cx231xx_init_isoc
    abd50cebf9c7 drm/bridge: tc358767: Fix return value on error case
    3f6932b5baa1 drm/radeon/trinity_dpm: fix a memleak in trinity_parse_power_table
    e646308eda40 drm/radeon/dpm: fix a memleak in sumo_parse_power_table
    57ca7984806d drm/radeon: check the alloc_workqueue return value in radeon_crtc_init()
    c20a6aa0a3f3 drm/drv: propagate errors from drm_modeset_register_all()
    da5e0feb12f2 drm/msm/dsi: Use pm_runtime_resume_and_get to prevent refcnt leaks
    b704eabe8780 drm/msm/mdp4: flush vblank event on disable
    96f5856867f8 ASoC: cs35l34: Fix GPIO name and drop legacy include
    defe0327f555 ASoC: cs35l33: Fix GPIO name and drop legacy include
    1421b06618f7 drm/radeon: check return value of radeon_ring_lock()
    99244692122c drm/radeon/r100: Fix integer overflow issues in r100_cs_track_check()
    ca267f79a578 drm/radeon/r600_cs: Fix possible int overflows in r600_cs_check_reg()
    6f866885e147 f2fs: fix to avoid dirent corruption
    13ea8af95768 drm/bridge: Fix typo in post_disable() description
    3233d8bf7893 media: pvrusb2: fix use after free on context disconnection
    53926e2a3962 drm/bridge: tpd12s015: Drop buggy __exit annotation for remove function
    1eb7ceae4887 drm/nouveau/fence:: fix warning directly dereferencing a rcu pointer
    b1a07165be21 rcu: Create an unrcu_pointer() to remove __rcu from a pointer
    1d1d5b90ea01 drm/panel-elida-kd35t133: hold panel in reset for unprepare
    7794c1481233 RDMA/usnic: Silence uninitialized symbol smatch warnings
    d807f4ef22de ARM: davinci: always select CONFIG_CPU_ARM926T
    da23bd709b46 ip6_tunnel: fix NEXTHDR_FRAGMENT handling in ip6_tnl_parse_tlv_enc_lim()
    4e09df9b24b1 Bluetooth: btmtkuart: fix recv_buf() return value
    fd54d16613cf Bluetooth: Fix bogus check for re-auth no supported with non-ssp
    15be96e1a628 netfilter: nf_tables: mark newset as dead on transaction abort
    6f39bea6629a wifi: rtlwifi: rtl8192se: using calculate_bit_shift()
    c7138266538e wifi: rtlwifi: rtl8192ee: using calculate_bit_shift()
    99f56c3f7c56 wifi: rtlwifi: rtl8192de: using calculate_bit_shift()
    b75b68dde5c1 rtlwifi: rtl8192de: make arrays static const, makes object smaller
    df14e4321997 wifi: rtlwifi: rtl8192ce: using calculate_bit_shift()
    016781c16e96 wifi: rtlwifi: rtl8192cu: using calculate_bit_shift()
    bf277a76d31a wifi: rtlwifi: rtl8192c: using calculate_bit_shift()
    483c975e4094 wifi: rtlwifi: rtl8188ee: phy: using calculate_bit_shift()
    31b651a7a17d wifi: rtlwifi: add calculate_bit_shift()
    64299791d070 dma-mapping: clear dev->dma_mem to NULL after freeing it
    a6dd1095640b dma-mapping: Add dma_release_coherent_memory to DMA API
    ad43344ab432 virtio/vsock: fix logic which reduces credit update messages
    30ae0c663141 selftests/net: fix grep checking for fib_nexthop_multiprefix
    7a0f8295e7e1 scsi: hisi_sas: Replace with standard error code return value
    afea95d319cc bpf: Fix verification of indirect var-off stack access
    419ab8f74a4b arm64: dts: qcom: sdm845-db845c: correct LED panic indicator
    812cebdc5f7b arm64: dts: qcom: qrb5165-rb5: correct LED panic indicator
    ba31bb08c15c scsi: fnic: Return error if vmalloc() failed
    2757f17972d8 bpf: fix check for attempt to corrupt spilled pointer
    7e98bbeb0708 arm64: dts: ti: k3-am65-main: Fix DSS irq trigger type
    d49863ed285d wifi: rtlwifi: rtl8821ae: phy: fix an undefined bitwise shift behavior
    2799324d92a6 firmware: meson_sm: populate platform devices from sm device tree data
    3959dbb37595 firmware: ti_sci: Fix an off-by-one in ti_sci_debugfs_create()
    01f9feb5edc5 net/ncsi: Fix netlink major/minor version numbers
    7bcddd12a947 ncsi: internal.h: Fix a spello
    ae98b7f7bbfb ARM: dts: qcom: apq8064: correct XOADC register address
    4675cacd6b02 wifi: libertas: stop selecting wext
    24d8aef5d93b wifi: ath11k: Defer on rproc_get failure
    91f311155884 bpf: Add crosstask check to __bpf_get_stack
    d5d181df8d75 bpf, lpm: Fix check prefixlen before walking trie
    eb0eac573646 wifi: rtw88: fix RX filter in FIF_ALLMULTI flag
    d8caf15ab156 NFSv4.1/pnfs: Ensure we handle the error NFS4ERR_RETURNCONFLICT
    722c700dd87a blocklayoutdriver: Fix reference leak of pnfs_device_node
    4518dc468cdd crypto: scomp - fix req->dst buffer overflow
    1798c8fd0093 crypto: sahara - do not resize req->src when doing hash operations
    67ae336f3b83 crypto: sahara - fix processing hash requests with req->nbytes < sg->length
    b3287c8a7eab crypto: sahara - improve error handling in sahara_sha_process()
    98985edab61f crypto: sahara - fix wait_for_completion_timeout() error handling
    69451bf97c83 crypto: sahara - fix ahash reqsize
    d8d9580831ea crypto: sahara - handle zero-length aes requests
    b839648d0585 crypto: sahara - avoid skcipher fallback code duplication
    14f57a013a95 crypto: virtio - Wait for tasklet to complete on device remove
    5c28478af371 gfs2: Fix kernel NULL pointer dereference in gfs2_rgrp_dump
    57c7b331f0e5 gfs2: Also reflect single-block allocations in rgd->rd_extfail_pt
    22f63f9bc851 Revert "gfs2: Don't reject a supposedly full bitmap if we have blocks reserved"
    cd48d2a8e6ba fs: indicate request originates from old mount API
    acd413da3e1f pstore: ram_core: fix possible overflow in persistent_ram_init_ecc()
    c60fd7a66366 crypto: sahara - fix error handling in sahara_hw_descriptor_create()
    25b7ca747b0c crypto: sahara - fix processing requests with cryptlen < sg->length
    fc91d32c7ded crypto: sahara - fix ahash selftest failure
    4f4786b81845 crypto: sahara - fix cbc selftest failure
    ccdb86c339d5 crypto: sahara - remove FLAGS_NEW_KEY logic
    7f807dc07341 crypto: af_alg - Disallow multiple in-flight AIO requests
    97f9d0455bd4 crypto: ccp - fix memleak in ccp_init_dm_workarea
    95586bb74bf4 crypto: sa2ul - Return crypto_aead_setkey to transfer the error
    0eb69890e867 crypto: virtio - Handle dataq logic with tasklet
    0dee72f9b7ba virtio-crypto: wait ctrl queue instead of busy polling
    4ee475e76b5e virtio-crypto: use private buffer for control request
    7d386768ef66 virtio-crypto: change code style
    1ff57428894f virtio-crypto: implement RSA algorithm
    f32dfee5a6a6 virtio-crypto: introduce akcipher service
    b2092cdcdabc virtio_crypto: Introduce VIRTIO_CRYPTO_NOSPC
    1bc7a682edea selinux: Fix error priority for bind with AF_UNSPEC on PF_INET6 socket
    001a3f59d8c9 mtd: Fix gluebi NULL pointer dereference caused by ftl notifier
    1d7b39c842c8 ACPI: extlog: Clear Extended Error Log status when RAS_CEC handled the error
    46e3dc02a4ae spi: sh-msiof: Enforce fixed DTDL for R-Car H3
    94c742324ed7 efivarfs: force RO when remounting if SetVariable is not supported
    44a88650ba55 calipso: fix memory leak in netlbl_calipso_add_pass()
    5ac84b01a09b netlabel: remove unused parameter in netlbl_netlink_auditinfo()
    47210a5754ba net: netlabel: Fix kerneldoc warnings
    d5ce66bdf6e4 cpufreq: scmi: process the result of devm_of_clk_add_hw_provider()
    fda130920584 cpufreq: Use of_property_present() for testing DT property presence
    ba7c7e353041 of: Add of_property_present() helper
    ded221bf4c74 of: property: define of_property_read_u{8,16,32,64}_array() unconditionally
    f39c3d578c7d ACPI: LPIT: Avoid u32 multiplication overflow
    c4e1a0ef0b47 ACPI: video: check for error while searching for backlight device parent
    11ac297aba78 mtd: rawnand: Increment IFC_TIMEOUT_MSECS for nand controller response
    f8df7c9886db spi: spi-zynqmp-gqspi: fix driver kconfig dependencies
    5a669f3511d2 powerpc/imc-pmu: Add a null pointer check in update_events_in_group()
    a67a04ad05ac powerpc/powernv: Add a null pointer check in opal_powercap_init()
    e6ad05e3ae9c powerpc/powernv: Add a null pointer check in opal_event_init()
    1eefa93faf69 powerpc/powernv: Add a null pointer check to scom_debug_init_one()
    428ab6a9dda5 selftests/powerpc: Fix error handling in FPU/VMX preemption tests
    b582aa1f6641 powerpc/pseries/memhp: Fix access beyond end of drmem array
    f2ec41874b65 powerpc/pseries/memhotplug: Quieten some DLPAR operations
    81dce186f1dd powerpc/44x: select I2C for CURRITUCK
    d67339e9c81e powerpc: Remove in_kernel_text()
    ecbbd90e7046 powerpc: add crtsavres.o to always-y instead of extra-y
    6aa7865ba7ff EDAC/thunderx: Fix possible out-of-bounds string access
    36dbbfff2823 x86/lib: Fix overflow when counting digits
    83da4fc5aa5c coresight: etm4x: Fix width of CCITMIN field
    67d3d17e3166 PCI: Add ACS quirk for more Zhaoxin Root Ports
    e5457b54add0 parport: parport_serial: Add Brainboxes device IDs and geometry
    937293ff64f4 parport: parport_serial: Add Brainboxes BAR details
    5e0be1229ae1 uio: Fix use-after-free in uio_open
    214aac202d97 binder: fix comment on binder_alloc_new_buf() return value
    689f13128fbc binder: fix trivial typo of binder_free_buf_locked()
    e18d60757bca binder: use EPOLLERR from eventpoll.h
    19d949b37e4a ACPI: resource: Add another DMI match for the TongFang GMxXGxx
    f138fb6e640b drm/crtc: fix uninitialized variable use
    7ba78e08238b ARM: sun9i: smp: fix return code check of of_property_match_string
    01d89184152f net: qrtr: ns: Return 0 if server port is not present
    dbf8b0d9387f ida: Fix crash in ida_free when the bitmap is empty
    d8a07ba130da i2c: rk3x: fix potential spinlock recursion on poll
    a57c59c85c5a Input: xpad - add Razer Wolverine V2 support
    86e4e2eea4ea ARC: fix spare error
    9700ff5a4f77 s390/scm: fix virtual vs physical address confusion
    6e17155869fb Input: i8042 - add nomux quirk for Acer P459-G2-M
    b0e82ef61153 Input: atkbd - skip ATKBD_CMD_GETID in translated mode
    6f1614080fc6 reset: hisilicon: hi6220: fix Wvoid-pointer-to-enum-cast warning
    8d6913d05025 ring-buffer: Do not record in NMI if the arch does not support cmpxchg in NMI
    439f3bbf7554 tracing: Add size check when printing trace_marker output
    bc6619c9aa91 tracing: Have large events show up as '[LINE TOO BIG]' instead of nothing
    c0f1db7380aa jbd2: fix soft lockup in journal_finish_inode_data_buffers()
    cd94f81f7752 neighbour: Don't let neigh_forced_gc() disable preemption for long
    3887ba719800 drm/crtc: Fix uninit-value bug in drm_mode_setcrtc
    956b740f3e46 jbd2: correct the printing of write_flags in jbd2_write_superblock()
    656d684109c6 clk: rockchip: rk3128: Fix HCLK_OTG gate register
    05644e636541 drm/exynos: fix a wrong error checking
    0fc35b0d9f94 drm/exynos: fix a potential error pointer dereference
    fb2f34d93992 nvme: introduce helper function to get ctrl state
    a8b1ddeeacd9 ASoC: da7219: Support low DC impedance headset
    1059aa41c5a8 net/tg3: fix race condition in tg3_reset_task()
    44ad1b9eb37f nouveau/tu102: flush all pdbs on vmm flush
    ffe13302b8fd ASoC: rt5650: add mutex to avoid the jack detection failure
    8b50b177bf98 ASoC: cs43130: Fix incorrect frame delay configuration
    921ff9f2b19e ASoC: cs43130: Fix the position of const qualifier
    304529d56449 ASoC: Intel: Skylake: mem leak in skl register function
    1e31b47b2e57 ASoC: nau8822: Fix incorrect type in assignment and cast to restricted __be16
    9c89777c7dcc ASoC: Intel: Skylake: Fix mem leak in few functions
    c78083013bef ASoC: wm8974: Correct boost mixer inputs
    06a33eec1dc2 nvme-core: check for too small lba shift
    974f127fcf65 drm/amdgpu: Fix cat debugfs amdgpu_regs_didt causes kernel null pointer
    52a33dbeacc8 debugfs: fix automount d_fsdata usage
    65bde47aaddc mptcp: fix uninit-value in mptcp_incoming_options
    6b00598b64dd ALSA: hda - Fix speaker and headset mic pin config for CHUWI CoreBook XPro
    94e192054fac pinctrl: lochnagar: Don't build on MIPS
    3e47740091b0 f2fs: explicitly null-terminate the xattr list
    3fee45ee557a Linux 5.10.208
    929ba86476b3 Revert "nvme: use command_id instead of req->tag in trace_nvme_complete_rq()"
    8a10841c1a9c PCI: Disable ATS for specific Intel IPU E2000 devices
    b74a0c4ddf57 PCI: Extract ATS disabling to a helper function
    25d1e7be85cf netfilter: nf_tables: Reject tables of unsupported family
    03585b18b715 drm/qxl: fix UAF on handle creation
    dd56c5790dc3 ipv6: remove max_size check inline with ipv4
    c6b2a6b827d4 net: tls, update curr on splice as well
    d36b6b152f47 powerpc: update ppc_save_regs to save current r1 in pt_regs
    ae64985e0e9c mmc: sdhci-sprd: Fix eMMC init failure after hw reset
    f7796d76bddd mmc: core: Cancel delayed work before releasing host
    c29da60e1f6b mmc: rpmb: fixes pause retune on all RPMB partitions.
    c82efcaad2a4 mmc: meson-mx-sdhc: Fix initialization frozen issue
    73704c6b35c7 mm: fix unmap_mapping_range high bits shift bug
    4aca0af44721 i2c: core: Fix atomic xfer check for non-preempt config
    0ba8c7ef197c x86/kprobes: fix incorrect return address calculation in kprobe_emulate_call_indirect
    23c006a760a7 firewire: ohci: suppress unexpected system reboot in AMD Ryzen machines and ASM108x/VT630x PCIe cards
    70168fdc743b mm/memory-failure: check the mapcount of the precise page
    18203c4484d5 net: Implement missing SO_TIMESTAMPING_NEW cmsg support
    701b03fc14f7 bnxt_en: Remove mis-applied code from bnxt_cfg_ntp_filters()
    cfbf618e9a21 asix: Add check for usbnet_get_endpoints
    0fc5fe6e4134 net/qla3xxx: fix potential memleak in ql_alloc_buffer_queues
    c492f9c7d313 net/qla3xxx: switch from 'pci_' to 'dma_' API
    53e92564c56a i40e: Restore VF MSI-X state during PCI reset
    6d3465c3dd53 ASoC: meson: g12a-tohdmitx: Fix event generation for S/PDIF mux
    e08399e81210 ASoC: meson: g12a-toacodec: Fix event generation
    51e88b2cef12 ASoC: meson: g12a-tohdmitx: Validate written enum values
    85f8d007deab ASoC: meson: g12a-toacodec: Validate written enum values
    21ecce245624 i40e: fix use-after-free in i40e_aqc_add_filters()
    f8c03fd8262e net: Save and restore msg_namelen in sock_sendmsg
    06ce3b8ec444 netfilter: nft_immediate: drop chain reference counter on error
    cf3c516dec82 netfilter: nftables: add loop check helper function
    4366b7e1f541 net: bcmgenet: Fix FCS generation for fragmented skbuffs
    d1eb795385e1 sfc: fix a double-free bug in efx_probe_filters
    cb69cad457fa ARM: sun9i: smp: Fix array-index-out-of-bounds read in sunxi_mc_smp_init
    8abb7ab7cf2f net: sched: em_text: fix possible memory leak in em_text_destroy()
    ecdfb0970c09 i40e: Fix filter input checks to prevent config with invalid values
    8d4ae760c793 drm/i915/dp: Fix passing the correct DPCD_REV for drm_dp_set_phy_test_pattern
    3ff482518b8e octeontx2-af: Fix marking couple of structure as __packed
    6adeb15cb6ad nfc: llcp_core: Hold a ref to llcp_local->dev when holding a ref to llcp_local
    74c9135d1659 ALSA: hda/realtek: Fix mute and mic-mute LEDs for HP ProBook 440 G6
    132ba71b4e81 block: Don't invalidate pagecache for invalid falloc modes
    ef1d1d7c1048 keys, dns: Fix missing size check of V1 server-list header
    03a0e87f70e8 Linux 5.10.207
    a7fd5c7ba4b9 scsi: core: Always send batch on reset or error handling command
    e30419672e3a Revert "scsi: core: Add scsi_prot_ref_tag() helper"
    f60f60e1deca Revert "scsi: core: Introduce scsi_get_sector()"
    a5edb4070293 Revert "scsi: core: Make scsi_get_lba() return the LBA"
    212929776027 Revert "scsi: core: Use scsi_cmd_to_rq() instead of scsi_cmnd.request"
    cea19678bf55 Revert "scsi: core: Use a structure member to track the SCSI command submitter"
    6963d049a422 Revert "scsi: core: Always send batch on reset or error handling command"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index dadee940a7..75bad97d60 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "14061087c21bd1e06e1bc2481963775df5352ddb"
-SRCREV_meta ?= "4a986ccf44f0b0704aac7219c0c50657b1243869"
+SRCREV_machine ?= "584bbc442a34343aef24cfc58091fa0181bcf949"
+SRCREV_meta ?= "b890cbbdcbc8498d1c84ec782bb5de8a51eb7d6d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.206"
+LINUX_VERSION ?= "5.10.209"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 8e8502082f..388eb0b83f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.206"
+LINUX_VERSION ?= "5.10.209"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "0eb69a54e4228b28635969d8b5285fa00b2d46bf"
-SRCREV_machine ?= "adab8533b3eab4befe6a5c22ef3c0f799f35473c"
-SRCREV_meta ?= "4a986ccf44f0b0704aac7219c0c50657b1243869"
+SRCREV_machine:qemuarm ?= "26ce139169fda3385d07e7e790ab20221a0535a2"
+SRCREV_machine ?= "ce0d143a0b6e70fdd5115bb091e1c226bbfb0656"
+SRCREV_meta ?= "b890cbbdcbc8498d1c84ec782bb5de8a51eb7d6d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 7f10707287..1e3e496c84 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -14,23 +14,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "86b57918e638288aaf1978fc5d848471f5b7b753"
-SRCREV_machine:qemuarm64 ?= "7265b197984efac64d0208735e45012651034b13"
-SRCREV_machine:qemumips ?= "577c296749ff07c282addf48ebe477e37736c6a6"
-SRCREV_machine:qemuppc ?= "efd25ea4b055690af54891598de44c2e50a43754"
-SRCREV_machine:qemuriscv64 ?= "bda297fbd0d0544947816c760977fe3157a197f9"
-SRCREV_machine:qemuriscv32 ?= "bda297fbd0d0544947816c760977fe3157a197f9"
-SRCREV_machine:qemux86 ?= "bda297fbd0d0544947816c760977fe3157a197f9"
-SRCREV_machine:qemux86-64 ?= "bda297fbd0d0544947816c760977fe3157a197f9"
-SRCREV_machine:qemumips64 ?= "543fd3927ab8613288a8e6cfbd9e0a3ba66cfdef"
-SRCREV_machine ?= "bda297fbd0d0544947816c760977fe3157a197f9"
-SRCREV_meta ?= "4a986ccf44f0b0704aac7219c0c50657b1243869"
+SRCREV_machine:qemuarm ?= "336d5989c007a2fff1e0cf8a6438288a815e264f"
+SRCREV_machine:qemuarm64 ?= "486578dae0e8b3ca825f0f85349fc069b5c58559"
+SRCREV_machine:qemumips ?= "1224d6157a6ba4e5b8d788bf529979b35873e311"
+SRCREV_machine:qemuppc ?= "bc1483b3d570623d38d49c400ec4508f8be68744"
+SRCREV_machine:qemuriscv64 ?= "4ec03fdbcfb82acff38de9d517e520bae44b9a5f"
+SRCREV_machine:qemuriscv32 ?= "4ec03fdbcfb82acff38de9d517e520bae44b9a5f"
+SRCREV_machine:qemux86 ?= "4ec03fdbcfb82acff38de9d517e520bae44b9a5f"
+SRCREV_machine:qemux86-64 ?= "4ec03fdbcfb82acff38de9d517e520bae44b9a5f"
+SRCREV_machine:qemumips64 ?= "fcebc1b9b71e941349bef1fce9ad9fe1f156ac63"
+SRCREV_machine ?= "4ec03fdbcfb82acff38de9d517e520bae44b9a5f"
+SRCREV_meta ?= "b890cbbdcbc8498d1c84ec782bb5de8a51eb7d6d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.206"
+LINUX_VERSION ?= "5.10.209"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


