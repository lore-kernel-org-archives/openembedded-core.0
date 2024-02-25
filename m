Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 637B4C54E49
	for <webhook@archiver.kernel.org>; Sun, 25 Feb 2024 21:53:34 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.7441.1708898005143319109
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 13:53:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Zps7e3oh;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-29a61872f4eso1752134a91.2
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 13:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708898004; x=1709502804; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gb4qAf+RJQOxW3Wp7MEJ5ptZDe4lxNe78a1MiZ+SxQY=;
        b=Zps7e3ohvPUkxpOPJLq/ejORw2gETvY45gyUH1J73w1XHhvF+pXEE/wQFzippqEAj4
         CJaI1bMfYPP6+YGKENUlqLKlpnXXi0zJwqW5lAqyLs5RDZq3x5XiDaBDnFHYZX4zRNbz
         Is76QNpQBeaT3QB7OirL4WcGy5K38P1bTqMRy4+/UYrBm8lxnHZgo9YCkYbLtzQW7NUt
         KjbdXWwT7di9grmoSoIe+aKccLhu/nMufnkxCV9uiykCRaz6v067euYYY6YVmHZihzNU
         XqcYYIXRo1XyUAoiioSJn5r1b03I2u1cdEzffcDAKizPrD8G+xehMNytjOfNPq4lUolz
         +lsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708898004; x=1709502804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gb4qAf+RJQOxW3Wp7MEJ5ptZDe4lxNe78a1MiZ+SxQY=;
        b=iwC7PrSB2cS8YLAMygwdoqVQWRYuLugcSI9oJXyrOEKWKC537/QosipFWEFliDPOiy
         SYBqf6IjB4mK8QLtQj2VSqnX+019h+KEr6N+MFAIFzwBtefAbxCAHM0MCaiJGOoLUX0H
         ZiyspDZtbMEQgARb3wrAUZNQbQYPqhoOI3hiGBIZGBNpVDGm84H+KXTBFjbuKXkVzR62
         R17YoufBd00B99zL8oUZ8/hua6CZwAswnfXXYhpYWLx3zHzQTnV3GpNSsT4vEPoiA/Bg
         eplw5ySKKWMwNNBRG9jbj+fQm2Rup34OzWD5XdrU6jBhFGap6xigee6VMO38k9pj9GHW
         5a5A==
X-Gm-Message-State: AOJu0YyDvfow/Nfb2VlhRkMqQlxbhWilg/v0Sixy2fqq0gPpOwHJrGjK
	UFw7sc331aKfHI5ePIEngj6W0QuQUfdrKudwuNOd0PLsEhooQoYkRwcCifUTxqOTbxoTdT7Vlrk
	jPpma7A==
X-Google-Smtp-Source: AGHT+IFpoWJYotboTD37qDZb5TD4AbBHg24zvXn2i9ie0r+8++YOZEhb1I0z0mA+gU56m0B9tGhHJw==
X-Received: by 2002:a17:90a:4a89:b0:29a:83da:ed62 with SMTP id f9-20020a17090a4a8900b0029a83daed62mr4201585pjh.4.1708898003998;
        Sun, 25 Feb 2024 13:53:23 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a12-20020a17090acb8c00b0029a4089fbf0sm3082947pju.16.2024.02.25.13.53.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 13:53:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/22] linux-yocto/5.15: update to v5.15.148
Date: Sun, 25 Feb 2024 11:52:35 -1000
Message-Id: <f1326d008a2a37b3860f25eb082efabdeba7cc32.1708897822.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708897822.git.steve@sakoman.com>
References: <cover.1708897822.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 21:53:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196168

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    6139f2a02fe0 Linux 5.15.148
    84c39986fe6d Revert "Revert "md/raid5: Wait for MD_SB_CHANGE_PENDING in raid5d""
    c8483a4845a0 arm64: dts: armada-3720-turris-mox: set irq type for RTC
    98052220f174 netfilter: nft_quota: copy content when cloning expression
    3be3c6123275 netfilter: nft_last: copy content when cloning expression
    42d461784889 netfilter: nft_limit: Clone packet limits' cost value
    d80880585128 netfilter: nft_limit: fix stateful object memory leak
    e562d8422555 netfilter: nft_connlimit: memleak if nf_ct_netns_get() fails
    10823cfe8e91 netfilter: nf_tables: typo NULL check in _clone() function
    0f2dca516541 block: Remove special-casing of compound pages
    08bf561118ca i2c: s3c24xx: fix transferring more than one message in polling mode
    38ce342a19ea i2c: s3c24xx: fix read transfers in polling mode
    62b3387beef1 ipv6: mcast: fix data-race in ipv6_mc_down / mld_ifc_work
    58485b95fde6 selftests: mlxsw: qos_pfc: Adjust the test to support 8 lanes
    348112522a35 mlxsw: spectrum_acl_tcam: Fix stack corruption
    005f2d10f915 mlxsw: spectrum_acl_tcam: Reorder functions to avoid forward declarations
    077c4776d798 mlxsw: spectrum_acl_tcam: Make fini symmetric to init
    d28048d31975 mlxsw: spectrum_acl_tcam: Add missing mutex_destroy()
    196f3595e869 mlxsw: spectrum: Use 'bitmap_zalloc()' when applicable
    87c54033935b mlxsw: spectrum_acl_erp: Fix error flow of pool allocation failure
    3732db294ea3 ethtool: netlink: Add missing ethnl_ops_begin/complete
    7f3d781e0df1 kdb: Fix a potential buffer overflow in kdb_local()
    995d6099d8b1 ipvs: avoid stat macros calls from preemptible context
    27513eff4c0c netfilter: nf_tables: reject NFT_SET_CONCAT with not field length description
    d6420b66ad70 netfilter: nf_tables: skip dead set elements in netlink dump
    77be8c495a3f netfilter: nf_tables: do not allow mismatch field size and set key length
    b8eb65bd13a6 netfilter: nft_limit: do not ignore unsupported flags
    d7b5da4fde7f netfilter: nf_tables: memcg accounting for dynamically allocated objects
    3bb4403d20b7 netfilter: nft_limit: move stateful fields out of expression data
    8a6635074a65 netfilter: nft_limit: rename stateful structure
    e2e8fdd0ad8e netfilter: nft_quota: move stateful fields out of expression data
    b147911d2a7b netfilter: nft_last: move stateful fields out of expression data
    36997eb13d53 netfilter: nft_connlimit: move stateful fields out of expression data
    713a13885579 netfilter: nf_tables: reject invalid set policy
    78e85466460d net: dsa: vsc73xx: Add null pointer check to vsc73xx_gpio_probe
    29ffa63f21bc bpf: Reject variable offset alu on PTR_TO_FLOW_KEYS
    684290895aa0 net: stmmac: ethtool: Fixed calltrace caused by unbalanced disable_irq_wake calls
    8e481c7f81e2 net: ravb: Fix dma_addr_t truncation in error case
    f05301ad0574 mptcp: use OPTION_MPTCP_MPJ_SYN in subflow_check_req()
    413b91350732 mptcp: use OPTION_MPTCP_MPJ_SYNACK in subflow_finish_connect()
    9b82d5f5d042 mptcp: strict validation before using mp_opt->hmac
    c99f490a422b mptcp: drop unused sk in mptcp_get_options
    cbe983d0e4d5 mptcp: mptcp_parse_option() fix for MPTCPOPT_MP_JOIN
    4f2c4ba3216d net: phy: micrel: populate .soft_reset for KSZ9131
    890bc96ef147 net: ethernet: ti: am65-cpsw: Fix max mtu to fit ethernet frames
    3b5254862258 net: qualcomm: rmnet: fix global oob in rmnet_policy
    18babcfa365d s390/pci: fix max size calculation in zpci_memcpy_toio()
    bf3304054e45 PCI: keystone: Fix race condition when initializing PHYs
    a300f741f692 nvmet-tcp: Fix the H2C expected PDU len calculation
    b02a005b19bb nvmet: re-fix tracing strncpy() warning
    763c67e96b05 serial: imx: Correct clock error message in function probe()
    1ed3c202051c usb: xhci-mtk: fix a short packet issue of gen1 isoc-in transfer
    0a12db736edb apparmor: avoid crash when parsed profile name is empty
    367d061a1864 perf env: Avoid recursively taking env->bpf_progs.lock
    0613a2fbdf8d nvmet-tcp: fix a crash in nvmet_req_complete()
    4cb3cf7177ae nvmet-tcp: Fix a kernel panic when host sends an invalid H2C PDU length
    013d7878c729 usb: cdc-acm: return correct error code on unsupported break
    c50f88954cd0 tty: use 'if' in send_break() instead of 'goto'
    a222bd01ca5a tty: don't check for signal_pending() in send_break()
    370b18aefe40 tty: early return from send_break() on TTY_DRIVER_HARDWARE_BREAK
    6f98751fa44d tty: change tty_write_lock()'s ndelay parameter to bool
    7ab8ef24fd0f perf genelf: Set ELF program header addresses properly
    08715e4fa58e iio: adc: ad9467: fix scale setting
    d7773702f813 iio: adc: ad9467: don't ignore error codes
    fd1957c706f3 iio: adc: ad9467: fix reset gpio handling
    71204292a722 iio: adc: ad9467: Benefit from devm_clk_get_enabled() to simplify
    fbcc37f4b409 selftests/sgx: Skip non X86_64 platform
    71005a1d9b38 selftests/sgx: Fix uninitialized pointer dereference in error path
    ff168d4fdb0e serial: imx: fix tx statemachine deadlock
    714778c29947 software node: Let args be NULL in software_node_get_reference_args
    c203812b4e89 libapi: Add missing linux/types.h header to get the __u64 type on io.h
    828cd829483f serial: 8250: omap: Don't skip resource freeing if pm_runtime_resume_and_get() failed
    96d289b57daf power: supply: bq256xx: fix some problem in bq256xx_hw_init
    435671571ef8 power: supply: cw2015: correct time_to_empty units in sysfs
    07733ca556ad MIPS: Alchemy: Fix an out-of-bound access in db1550_dev_setup()
    4590f46c1551 MIPS: Alchemy: Fix an out-of-bound access in db1200_dev_setup()
    c1669b54c3c0 riscv: Fix module_alloc() that did not reset the linear mapping permissions
    938f70d14618 riscv: Check if the code to patch lies in the exit section
    8e0935435bfd mips: Fix incorrect max_low_pfn adjustment
    4b88c9c83fc0 mips: dmi: Fix early remap on MIPS32
    d1c8c7ef3928 mfd: intel-lpss: Fix the fractional clock divider flags
    6109ff5ad5e9 leds: aw2013: Select missing dependency REGMAP_I2C
    c3e3a2144bf5 mfd: syscon: Fix null pointer dereference in of_syscon_register()
    a004323a384c ARM: 9330/1: davinci: also select PINCTRL
    77c20b4cbcd0 iommu/dma: Trace bounce buffer usage when mapping buffers
    fc7c3be66502 serial: sc16is7xx: set safe default SPI clock frequency
    160ef3fc3561 serial: sc16is7xx: add check for unsupported SPI modes during probe
    b1effdda4f60 HID: wacom: Correct behavior when processing some confidence == false touches
    400ad6fe2436 iio: adc: ad7091r: Pass iio_dev to event handler
    12c2759ab134 KVM: arm64: vgic-its: Avoid potential UAF in LPI translation cache
    d99976d145b9 KVM: arm64: vgic-v4: Restore pending state on host userspace write
    9bd4c6e6581a x86/kvm: Do not try to disable kvmclock if it was not enabled
    a4563156c353 PCI: mediatek: Clear interrupt status before dispatching handler
    0f59d3772a2d PCI: dwc: endpoint: Fix dw_pcie_ep_raise_msix_irq() alignment support
    25aab84f1a4e wifi: mwifiex: configure BSSID consistently when starting AP
    a61373d32cd3 wifi: rtlwifi: Convert LNKCTL change to PCIe cap RMW accessors
    1f0b69791317 wifi: rtlwifi: Remove bogus and dangerous ASPM disable/enable code
    5600943b0cdc wifi: mt76: fix broken precal loading from MTD for mt7915
    4124a004d55c iommu/arm-smmu-qcom: Add missing GMU entry to match table
    a7b98aa10f89 bpf: Fix re-attachment branch in bpf_tracing_prog_attach
    4c71c01df8ef Bluetooth: Fix atomicity violation in {min,max}_key_size_set
    27e58d3b5253 rootfs: Fix support for rootfstype= when root= is given
    79ea1c6f06be io_uring/rw: ensure io->bytes_done is always initialized
    801c8adb85e0 pwm: jz4740: Don't use dev_err_probe() in .request()
    c9ed30eea4f7 netfilter: nf_tables: check if catch-all set element is active in next generation
    5010c2712096 block: add check that partition length needs to be aligned with block size
    6a73c9fdb78a scsi: mpi3mr: Refresh sdev queue depth after controller reset
    610ca0cadb07 fbdev: flush deferred work in fb_deferred_io_fsync()
    cb32c0e1bdd9 ALSA: hda/relatek: Enable Mute LED on HP Laptop 15s-fq2xxx
    d37d61c07764 ALSA: oxygen: Fix right channel of capture volume mixer
    314cf7c2dd65 serial: imx: Ensure that imx_uart_rs485_config() is called with enabled clock
    ac0c3a2fe7de usb: mon: Fix atomicity violation in mon_bin_vma_fault
    d7ce8ebd50a3 usb: typec: class: fix typec_altmode_put_partner to put plugs
    4212a9ff6533 Revert "usb: typec: class: fix typec_altmode_put_partner to put plugs"
    2c64904a0e63 usb: cdns3: Fix uvc fail when DMA cross 4k boundery since sg enabled
    e1b3be9bab6f usb: cdns3: fix iso transfer error when mult is not zero
    9cdf2c915982 usb: cdns3: fix uvc failure work since sg support enabled
    2e349cf0d0c4 usb: chipidea: wait controller resume finished for wakeup irq
    295b4fa3219c Revert "usb: dwc3: don't reset device side if dwc3 was configured as host-only"
    4f5a109b8f80 Revert "usb: dwc3: Soft reset phy on probe for host"
    ea968824c485 usb: dwc: ep0: Update request status in dwc3_ep0_stall_restart
    e3e35301f1d8 usb: phy: mxs: remove CONFIG_USB_OTG condition for mxs_phy_is_otg_host()
    41e05f246fe4 tick-sched: Fix idle and iowait sleeptime accounting vs CPU hotplug
    98fee5bee97a binder: fix race between mmput() and do_exit()
    e03023fcdb5e xen-netback: don't produce zero-size SKB frags
    409c30ff6cac virtio-crypto: fix memory leak in virtio_crypto_alg_skcipher_close_session()
    f97f61286464 dma-mapping: Fix build error unused-value
    72d29dcdf526 Input: atkbd - use ab83 as id when skipping the getid command
    9c1fa9eedc3d binder: fix unused alloc->free_async_space
    c44b276bc151 binder: fix async space check for 0-sized buffers
    0921867f77ea keys, dns: Fix size check of V1 server-list header
    10193a5001d6 selftests/bpf: Add assert for user stacks in test_task_stack
    cc9c60b2537d of: unittest: Fix of_count_phandle_with_args() expected value message
    454100408452 of: Fix double free in of_parse_phandle_with_args_map
    83f5d6c1efe3 ksmbd: validate the zero field of packet header
    4af4674158f7 drm/amd/pm/smu7: fix a memleak in smu7_hwmgr_backend_init
    bf1acc6258aa IB/iser: Prevent invalidating wrong MR
    106136f2099b mmc: sdhci_omap: Fix TI SoC dependencies
    da9eae2c1a45 mmc: sdhci_am654: Fix TI SoC dependencies
    e517645ead5e ALSA: scarlett2: Add clamp() in scarlett2_mixer_ctl_put()
    3a09488f4f67 ALSA: scarlett2: Add missing error checks to *_ctl_get()
    12023666f22d ALSA: scarlett2: Allow passing any output to line_out_remap()
    51d5697e1c03 ALSA: scarlett2: Add missing error check to scarlett2_usb_set_config()
    0ba9386e19a8 ALSA: scarlett2: Add missing error check to scarlett2_config_save()
    c60490b81740 ASoC: rt5645: Drop double EF20 entry from dmi_platform_data[]
    cf55afb5a522 pwm: stm32: Fix enable count for clk in .probe()
    df19bf404437 pwm: stm32: Use hweight32 in stm32_pwm_detect_channels
    c82c21e7d97d pwm: stm32: Use regmap_clear_bits and regmap_set_bits where applicable
    fa019c01db8b clk: fixed-rate: fix clk_hw_register_fixed_rate_with_accuracy_parent_hw
    256d1232c847 clk: fixed-rate: add devm_clk_hw_register_fixed_rate
    a30ca04dde09 clk: asm9260: use parent index to link the reference clock
    c45ca73b0194 clk: si5341: fix an error code problem in si5341_output_clk_set_rate
    347f9d725830 watchdog: rti_wdt: Drop runtime pm reference count when watchdog is unused
    3646d83db836 watchdog: bcm2835_wdt: Fix WDIOC_SETTIMEOUT handling
    1711bdfe5e13 watchdog/hpwdt: Only claim UNKNOWN NMI if from iLO
    b9bced8ca7b1 watchdog: set cdev owner before adding
    9117fc44fd3a drivers: clk: zynqmp: update divider round rate logic
    8f4941940da2 clk: zynqmp: Add a check for NULL pointer
    f46c0ec5a50e clk: zynqmp: make bestdiv unsigned
    e27660be6f46 drivers: clk: zynqmp: calculate closest mux rate
    8aff5f672358 clk: qcom: videocc-sm8150: Add missing PLL config property
    b31526b8c5dd clk: qcom: videocc-sm8150: Update the videocc resets
    1dd84d5e8303 dt-bindings: clock: Update the videocc resets for sm8150
    c72dbb780d97 gpu/drm/radeon: fix two memleaks in radeon_vm_init
    b6dcba02ee17 drivers/amd/pm: fix a use-after-free in kv_parse_power_table
    2bf47c89bbac drm/amd/pm: fix a double-free in si_dpm_init
    11d1f2d895a4 drm/amdgpu/debugfs: fix error code when smc register accessors are NULL
    720919b58daa media: dvb-frontends: m88ds3103: Fix a memory leak in an error handling path of m88ds3103_probe()
    0a50ca097a6d media: dvbdev: drop refcount on error path in dvb_device_open()
    11e60be4086e f2fs: fix the f2fs_file_write_iter tracepoint
    f3a220d97530 f2fs: fix to update iostat correctly in f2fs_filemap_fault()
    df2571b4d5d1 f2fs: fix to check compress file in f2fs_move_file_range()
    a3316290a83d media: rkisp1: Disable runtime PM in probe error path
    f4176c518546 clk: qcom: gpucc-sm8150: Update the gpu_cc_pll1 config
    d3a8c5c783f2 media: cx231xx: fix a memleak in cx231xx_init_isoc
    9f583fc91c34 drm/bridge: tc358767: Fix return value on error case
    a3cb0b5b1bd4 drm/bridge: cdns-mhdp8546: Fix use of uninitialized variable
    a5934df4dfcd drm/radeon/trinity_dpm: fix a memleak in trinity_parse_power_table
    1a6cccd7fded drm/radeon/dpm: fix a memleak in sumo_parse_power_table
    14bbfaa5df27 drm/radeon: check the alloc_workqueue return value in radeon_crtc_init()
    929af5cd8ae1 drm/drv: propagate errors from drm_modeset_register_all()
    cbf207b17111 drm/msm/dsi: Use pm_runtime_resume_and_get to prevent refcnt leaks
    6d8dc619857d drm/msm/mdp4: flush vblank event on disable
    d3aa670bbab9 ASoC: cs35l34: Fix GPIO name and drop legacy include
    a0f27f673ebe ASoC: cs35l33: Fix GPIO name and drop legacy include
    528844bb1e15 drm/radeon: check return value of radeon_ring_lock()
    4e57efe03a30 drm/radeon/r100: Fix integer overflow issues in r100_cs_track_check()
    1f7008dd122d drm/radeon/r600_cs: Fix possible int overflows in r600_cs_check_reg()
    f100ba617d8b f2fs: fix to avoid dirent corruption
    4c5e6a02dcff drm/bridge: Fix typo in post_disable() description
    ec3634ebe23f media: pvrusb2: fix use after free on context disconnection
    1821c4d1c3c8 drm/tilcdc: Fix irq free on unload
    08ccff6ece35 drm/bridge: tpd12s015: Drop buggy __exit annotation for remove function
    45c4c4b04ae8 drm/nouveau/fence:: fix warning directly dereferencing a rcu pointer
    ab45a15a503d drm/panel-elida-kd35t133: hold panel in reset for unprepare
    a811031da2b5 RDMA/hns: Fix inappropriate err code for unsupported operations
    5245c05cd9cd RDMA/usnic: Silence uninitialized symbol smatch warnings
    ab8038e7bc12 Revert "drm/omapdrm: Annotate dma-fence critical section in commit path"
    d847363bc5d7 Revert "drm/tidss: Annotate dma-fence critical section in commit path"
    13e3dd2df06d ARM: davinci: always select CONFIG_CPU_ARM926T
    4329426cf6b8 ip6_tunnel: fix NEXTHDR_FRAGMENT handling in ip6_tnl_parse_tlv_enc_lim()
    d0464a7edf5c mlxbf_gige: Enable the GigE port in mlxbf_gige_open
    8d632d0fd203 net: mellanox: mlxbf_gige: Replace non-standard interrupt handling
    86f3df04956c mlxbf_gige: Fix intermittent no ip issue
    172ba7d46c20 net/sched: act_ct: fix skb leak and crash on ooo frags
    c3d8edb17086 null_blk: don't cap max_hw_sectors to BLK_DEF_MAX_SECTORS
    8676b014e49d block: make BLK_DEF_MAX_SECTORS unsigned
    ce3440b6992f Bluetooth: btmtkuart: fix recv_buf() return value
    cede5d0c2957 Bluetooth: Fix bogus check for re-auth no supported with non-ssp
    166d65b0d522 netfilter: nf_tables: mark newset as dead on transaction abort
    e907e9572943 wifi: iwlwifi: mvm: send TX path flush in rfkill
    8d6c61421282 wifi: iwlwifi: mvm: set siso/mimo chains to 1 in FW SMPS request
    5f4ea050bbc1 wifi: rtlwifi: rtl8192se: using calculate_bit_shift()
    aaf4723f5272 wifi: rtlwifi: rtl8192ee: using calculate_bit_shift()
    dbbbd2cc8fe9 wifi: rtlwifi: rtl8192de: using calculate_bit_shift()
    7e0d54f5dc05 wifi: rtlwifi: rtl8192ce: using calculate_bit_shift()
    5dbc5c522208 wifi: rtlwifi: rtl8192cu: using calculate_bit_shift()
    62de5647263a wifi: rtlwifi: rtl8192c: using calculate_bit_shift()
    aec0dee37b49 wifi: rtlwifi: rtl8188ee: phy: using calculate_bit_shift()
    37871c978d7e wifi: rtlwifi: add calculate_bit_shift()
    493cfed24766 arm64: dts: qcom: sc7280: Mark SDHCI hosts as cache-coherent
    2c97f945003c block: add check of 'minors' and 'first_minor' in device_add_disk()
    df4f5a35c5b9 arm64: dts: qcom: sm8150-hdk: fix SS USB regulators
    6f20058dad79 soc: qcom: llcc: Fix dis_cap_alloc and retain_on_pc configuration
    ccc94806d0e6 dma-mapping: clear dev->dma_mem to NULL after freeing it
    99326214f90c dma-mapping: Add dma_release_coherent_memory to DMA API
    930cd34add1d virtio/vsock: fix logic which reduces credit update messages
    a18eff8ba05e selftests/net: fix grep checking for fib_nexthop_multiprefix
    62c904c472a2 scsi: hisi_sas: Correct the number of global debugfs registers
    6bf21261078f scsi: hisi_sas: Rollback some operations if FLR failed
    84e174afb54f scsi: hisi_sas: Replace with standard error code return value
    0d17931d7e88 scsi: hisi_sas: Prevent parallel FLR and controller reset
    0760d1d6d850 scsi: hisi_sas: Rename HISI_SAS_{RESET -> RESETTING}_BIT
    80b0b7c79f8b block: Set memalloc_noio to false on device_add_disk() error path
    02962684258e bpf: Fix verification of indirect var-off stack access
    8c2127dc936b arm64: dts: qcom: sc7280: fix usb_2 wakeup interrupt types
    97c60adff104 arm64: dts: qcom: sdm845-db845c: correct LED panic indicator
    6211a043abb5 arm64: dts: qcom: qrb5165-rb5: correct LED panic indicator
    609c7d556ccd scsi: fnic: Return error if vmalloc() failed
    67e6707f0735 bpf: fix check for attempt to corrupt spilled pointer
    f40cd60f3f44 arm64: dts: qcom: sm8250: Make watchdog bark interrupt edge triggered
    a413fdd3ea21 arm64: dts: qcom: sm8150: Make watchdog bark interrupt edge triggered
    a78ae1060786 arm64: dts: qcom: sdm845: Make watchdog bark interrupt edge triggered
    06ec7a3961f8 arm64: dts: qcom: sc7280: Make watchdog bark interrupt edge triggered
    0c55ace45d6d arm64: dts: qcom: sc7180: Make watchdog bark interrupt edge triggered
    65b28cad7509 ARM: dts: qcom: sdx65: correct SPMI node name
    bb88e2174a30 bpf: enforce precision of R0 on callback return
    fa5b150abfe4 arm64: dts: ti: k3-am65-main: Fix DSS irq trigger type
    18051358d992 wifi: rtlwifi: rtl8821ae: phy: fix an undefined bitwise shift behavior
    bf98ac3288dd firmware: meson_sm: populate platform devices from sm device tree data
    41b3228281c3 firmware: ti_sci: Fix an off-by-one in ti_sci_debugfs_create()
    7e36646237c7 net/ncsi: Fix netlink major/minor version numbers
    024e24086e14 ARM: dts: qcom: apq8064: correct XOADC register address
    ef2373f31f62 wifi: libertas: stop selecting wext
    69f7c1f5d221 wifi: ath11k: Defer on rproc_get failure
    131afd9a5765 bpf: Add crosstask check to __bpf_get_stack
    1ed921e42a99 bpf, lpm: Fix check prefixlen before walking trie
    2b67863c5b2d wifi: rtw88: fix RX filter in FIF_ALLMULTI flag
    9d4f4dea824a NFSv4.1/pnfs: Ensure we handle the error NFS4ERR_RETURNCONFLICT
    d0e09a7ba33f blocklayoutdriver: Fix reference leak of pnfs_device_node
    a5f2f91b3fd7 crypto: scomp - fix req->dst buffer overflow
    dc6779550fae crypto: sahara - do not resize req->src when doing hash operations
    a5e0e39dac06 crypto: sahara - fix processing hash requests with req->nbytes < sg->length
    2dc0f23ac4c6 crypto: sahara - improve error handling in sahara_sha_process()
    faa25455f738 crypto: sahara - fix wait_for_completion_timeout() error handling
    2104f405af91 crypto: sahara - fix ahash reqsize
    34c6a33567b4 crypto: sahara - handle zero-length aes requests
    a7b435e816a0 crypto: sahara - avoid skcipher fallback code duplication
    b1664c53349c crypto: virtio - Wait for tasklet to complete on device remove
    ee0586d73cba gfs2: Fix kernel NULL pointer dereference in gfs2_rgrp_dump
    00e3321c65eb fs: indicate request originates from old mount API
    8fb12524c86b pstore: ram_core: fix possible overflow in persistent_ram_init_ecc()
    8dd9e58c6936 crypto: sahara - fix error handling in sahara_hw_descriptor_create()
    3413d878fd6a crypto: sahara - fix processing requests with cryptlen < sg->length
    a962882a35e5 crypto: sahara - fix ahash selftest failure
    6f31caf8aa10 crypto: sahara - fix cbc selftest failure
    6fb7db05ad39 crypto: sahara - remove FLAGS_NEW_KEY logic
    d2205b9b57b9 crypto: af_alg - Disallow multiple in-flight AIO requests
    088123ddb4d8 crypto: ccp - fix memleak in ccp_init_dm_workarea
    d3ff5362b4e0 crypto: sa2ul - Return crypto_aead_setkey to transfer the error
    75cba72ddb78 crypto: virtio - Handle dataq logic with tasklet
    5e37fa0b4c42 selinux: Fix error priority for bind with AF_UNSPEC on PF_INET6 socket
    d8ac2537763b mtd: Fix gluebi NULL pointer dereference caused by ftl notifier
    a252d5c1ef9d kunit: debugfs: Fix unchecked dereference in debugfs_print_results()
    f23aa841a097 ACPI: extlog: Clear Extended Error Log status when RAS_CEC handled the error
    f5de4ad61da0 ACPI: LPSS: Fix the fractional clock divider flags
    6b15fb99b0b2 spi: sh-msiof: Enforce fixed DTDL for R-Car H3
    2aa141f8bc58 efivarfs: force RO when remounting if SetVariable is not supported
    a4529a08d370 calipso: fix memory leak in netlbl_calipso_add_pass()
    dd645fc8f8e8 cpufreq: scmi: process the result of devm_of_clk_add_hw_provider()
    aead146e8817 cpufreq: Use of_property_present() for testing DT property presence
    435841c1065a of: Add of_property_present() helper
    c5df417936ec of: property: define of_property_read_u{8,16,32,64}_array() unconditionally
    c1814a4ffd01 ACPI: LPIT: Avoid u32 multiplication overflow
    3a370502a568 ACPI: video: check for error while searching for backlight device parent
    45f6080748fa mtd: rawnand: Increment IFC_TIMEOUT_MSECS for nand controller response
    9c92f01bb9c3 spi: spi-zynqmp-gqspi: fix driver kconfig dependencies
    f105c2630098 powerpc/imc-pmu: Add a null pointer check in update_events_in_group()
    6b58d1603721 powerpc/powernv: Add a null pointer check in opal_powercap_init()
    c0b111ea786d powerpc/powernv: Add a null pointer check in opal_event_init()
    2a82c4439b90 powerpc/powernv: Add a null pointer check to scom_debug_init_one()
    5daf0ef6268c selftests/powerpc: Fix error handling in FPU/VMX preemption tests
    999a27b3ce9a powerpc/pseries/memhp: Fix access beyond end of drmem array
    5d69c8859e25 powerpc/44x: select I2C for CURRITUCK
    467c9c9dc0a7 powerpc: add crtsavres.o to always-y instead of extra-y
    0b11a145eb00 powerpc: remove checks for binutils older than 2.25
    63ecb08533b5 powerpc/toc: Future proof kernel toc
    2de654d858ee powerpc: Mark .opd section read-only
    700cf4bead80 EDAC/thunderx: Fix possible out-of-bounds string access
    b53730a40ea8 x86/lib: Fix overflow when counting digits
    0a43304cf682 coresight: etm4x: Fix width of CCITMIN field
    b67064bd3723 PCI: Add ACS quirk for more Zhaoxin Root Ports
    e62243b3538d leds: ledtrig-tty: Free allocated ttyname buffer on deactivate
    6c3388c0af3c parport: parport_serial: Add Brainboxes device IDs and geometry
    72095a54301b parport: parport_serial: Add Brainboxes BAR details
    5cf604ee538e uio: Fix use-after-free in uio_open
    659be220e692 binder: fix comment on binder_alloc_new_buf() return value
    2900c0ee59fb binder: fix trivial typo of binder_free_buf_locked()
    8ad4d580e8af binder: fix use-after-free in shinker's callback
    1263bd9e08f5 binder: use EPOLLERR from eventpoll.h
    0ee3ded745ca Revert "md/raid5: Wait for MD_SB_CHANGE_PENDING in raid5d"
    12b07f443d78 kprobes: Fix to handle forcibly unoptimized kprobes on freeing_list
    66cb0868b123 bpf: Add --skip_encoding_btf_inconsistent_proto, --btf_gen_optimized to pahole flags for v1.25
    2a2495b6a32d Revert "ASoC: atmel: Remove system clock tree configuration for at91sam9g20ek"
    313cfcaefa0b ACPI: resource: Add another DMI match for the TongFang GMxXGxx
    dec512974c45 drm/crtc: fix uninitialized variable use
    21eea9b6c4fd ARM: sun9i: smp: fix return code check of of_property_match_string
    dc26b6770450 net: qrtr: ns: Return 0 if server port is not present
    5dbcdaf4dbfe ida: Fix crash in ida_free when the bitmap is empty
    c9f5b801bce6 i2c: rk3x: fix potential spinlock recursion on poll
    3f0dc646b50b ASoC: Intel: bytcr_rt5640: Add quirk for the Medion Lifetab S10346
    adf4616a440d Input: xpad - add Razer Wolverine V2 support
    d66ffc87ba42 wifi: iwlwifi: pcie: avoid a NULL pointer dereference
    fd13543dbbc1 ARC: fix spare error
    b3f44f21d3d4 s390/scm: fix virtual vs physical address confusion
    46445552ed27 Input: i8042 - add nomux quirk for Acer P459-G2-M
    0f0da2d6bd6c Input: atkbd - skip ATKBD_CMD_GETID in translated mode
    274b4c816208 reset: hisilicon: hi6220: fix Wvoid-pointer-to-enum-cast warning
    5d307038fa09 ring-buffer: Do not record in NMI if the arch does not support cmpxchg in NMI
    a9655e7e4bd5 tracing: Fix uaf issue when open the hist or hist_debug file
    64d81f61ad60 MIPS: dts: loongson: drop incorrect dwmac fallback compatible
    3f483a39e23d stmmac: dwmac-loongson: drop useless check for compatible fallback
    aeb0d506f779 tracing: Add size check when printing trace_marker output
    c3729567de3a tracing: Have large events show up as '[LINE TOO BIG]' instead of nothing
    c8af7ad72968 jbd2: fix soft lockup in journal_finish_inode_data_buffers()
    7b0586ada944 platform/x86: intel-vbtn: Fix missing tablet-mode-switch events
    6511772fc0bc neighbour: Don't let neigh_forced_gc() disable preemption for long
    2e1846b0c044 drm/crtc: Fix uninit-value bug in drm_mode_setcrtc
    c01c44559a8e jbd2: correct the printing of write_flags in jbd2_write_superblock()
    5378fd3c43cf clk: rockchip: rk3128: Fix HCLK_OTG gate register
    a14da83838ef hwmon: (corsair-psu) Fix probe when built-in
    794540520582 drm/exynos: fix a wrong error checking
    e02a2693aed5 drm/exynos: fix a potential error pointer dereference
    10250096f3d5 drm/amdgpu: Add NULL checks for function pointers
    8b985248216f nvme: introduce helper function to get ctrl state
    c11fc224e58e ASoC: ops: add correct range check for limiting volume
    09c0f2814b5a ASoC: da7219: Support low DC impedance headset
    16d3a65eaa60 net/tg3: fix race condition in tg3_reset_task()
    9904379f19ee nouveau/tu102: flush all pdbs on vmm flush
    7a3ff8a2bb26 ASoC: rt5650: add mutex to avoid the jack detection failure
    ebf8d5ec4af3 ASoC: cs43130: Fix incorrect frame delay configuration
    ec52e3e241ff ASoC: cs43130: Fix the position of const qualifier
    ce6cce079948 ASoC: Intel: Skylake: mem leak in skl register function
    cb6b6ff7a79b ASoC: nau8822: Fix incorrect type in assignment and cast to restricted __be16
    4ec0f3b3d8d1 ASoC: Intel: Skylake: Fix mem leak in few functions
    20e23f6b1453 ASoC: wm8974: Correct boost mixer inputs
    05d753d74c3a nvme-core: check for too small lba shift
    9ad8b171c4e6 drm/amdgpu: Fix cat debugfs amdgpu_regs_didt causes kernel null pointer
    f8eadbe713a3 debugfs: fix automount d_fsdata usage
    473fb46aa376 wifi: cfg80211: lock wiphy mutex for rfkill poll
    5d520ae3dad0 mptcp: fix uninit-value in mptcp_incoming_options
    8d40e3514a09 ALSA: hda - Fix speaker and headset mic pin config for CHUWI CoreBook XPro
    3dec0bd9c01a pinctrl: lochnagar: Don't build on MIPS
    32a6cfc67675 f2fs: explicitly null-terminate the xattr list

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index e64f21b2f0..4578a1d819 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7168cfa2ce6492db31163393808806b6f48af5e8"
-SRCREV_meta ?= "487de687c6a4553f11d67b83d01f16f79449ee49"
+SRCREV_machine ?= "198d85bb67700ac968a286cf7f89f008bb6eff39"
+SRCREV_meta ?= "c07c75a1e9438e70a80615cac0f48eb91d8f34ea"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.147"
+LINUX_VERSION ?= "5.15.148"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 38bea23264..267ebb11c4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.147"
+LINUX_VERSION ?= "5.15.148"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "641e2136a155ce3179c84b9365a5998c1354fdd0"
-SRCREV_meta ?= "487de687c6a4553f11d67b83d01f16f79449ee49"
+SRCREV_machine ?= "0780801e81912c4bbd53b4fc01dad6df556739b6"
+SRCREV_meta ?= "c07c75a1e9438e70a80615cac0f48eb91d8f34ea"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 1acd7b62cd..9a7c96b453 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "82f8a25a3894c10d1cf26914b8e51726351ba11e"
-SRCREV_machine:qemuarm64 ?= "cf955e443d881e296b83940143fd30ea83fcf222"
-SRCREV_machine:qemumips ?= "1c3babd3b42768e24c797edfc3f67906aca6d072"
-SRCREV_machine:qemuppc ?= "b08998787bece69376578b049cab073d8b80e872"
-SRCREV_machine:qemuriscv64 ?= "5822f13dba3b1f460536d873aea707f4b25840cf"
-SRCREV_machine:qemuriscv32 ?= "5822f13dba3b1f460536d873aea707f4b25840cf"
-SRCREV_machine:qemux86 ?= "5822f13dba3b1f460536d873aea707f4b25840cf"
-SRCREV_machine:qemux86-64 ?= "5822f13dba3b1f460536d873aea707f4b25840cf"
-SRCREV_machine:qemumips64 ?= "4ff2c0496c0160a96185a080ec9678c63b68bd47"
-SRCREV_machine ?= "5822f13dba3b1f460536d873aea707f4b25840cf"
-SRCREV_meta ?= "487de687c6a4553f11d67b83d01f16f79449ee49"
+SRCREV_machine:qemuarm ?= "c0150afdb5ca785c04acec22c7f42f42b044ca43"
+SRCREV_machine:qemuarm64 ?= "201f4f28b183815dbabda398e9ee90a2e628ad94"
+SRCREV_machine:qemumips ?= "1d82f42872b46d7f129bbe631931a09590d9d6bf"
+SRCREV_machine:qemuppc ?= "e985732d9de961b364b9bbf03ef3eba41adf8e37"
+SRCREV_machine:qemuriscv64 ?= "9bc0938c9f31f2f63b8e9d7b8f43671927858068"
+SRCREV_machine:qemuriscv32 ?= "9bc0938c9f31f2f63b8e9d7b8f43671927858068"
+SRCREV_machine:qemux86 ?= "9bc0938c9f31f2f63b8e9d7b8f43671927858068"
+SRCREV_machine:qemux86-64 ?= "9bc0938c9f31f2f63b8e9d7b8f43671927858068"
+SRCREV_machine:qemumips64 ?= "c87c9b74f382aba2886320ca29dd32544e53f15b"
+SRCREV_machine ?= "9bc0938c9f31f2f63b8e9d7b8f43671927858068"
+SRCREV_meta ?= "c07c75a1e9438e70a80615cac0f48eb91d8f34ea"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "26c690eff0a56293e0b6911a38e406c211b35547"
+SRCREV_machine:class-devupstream ?= "6139f2a02fe0ac7a08389b4eb786e0c659039ddd"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.147"
+LINUX_VERSION ?= "5.15.148"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


