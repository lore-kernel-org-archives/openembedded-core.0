Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6650C5AE59
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 18:41:40 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.3064.1748457698395989163
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 11:41:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZJaE6Ygx;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c5a88b34a6so4183185a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 11:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748457697; x=1749062497; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5hcAFH8YSniFHGJR8iw5LFx5NhL8mYQjWpnVJrmVMYs=;
        b=ZJaE6YgxAnwRz1fDnX9E39hJLZW7jM+4/xtsryDWtAmw8xI6icoDYVO3dITbfH4V1D
         N9sxhBzQSSY+QxVxzNLX1eULsGZINgaUDow+3FjbT7Kt4FS71eBOVyfyrkERmOSUQ9zV
         8mAvCUt7JhAeArbFGeXkmePSMz/8hlowh2BnFNejuJbSJx1ITd3RZomvG244HUJWcsrU
         P7kG3gZ4sSfQ48UHxYG17xyTYcK6Th8J+osGEMDiVnxXQdoM46M22Pk10Sr6yoWHiLEQ
         MyfQrfGvyHc+fRfQVkdmQhRjRba/nbChJAE35UIByo8JJaKzlG2x4Om7HtQ9qb5HxtzU
         cyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748457697; x=1749062497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5hcAFH8YSniFHGJR8iw5LFx5NhL8mYQjWpnVJrmVMYs=;
        b=ppr06RQ+hcloAd18K9Jypp6MbXC7VEFmAO7ctOhDI5pfIMkLWnvxwdiIEt0UkDCce/
         tJZ9RwPgeAv2BXa94j6I0mx4Q7H06GNbKvjjHgaBzFLwKPggC2GFJm4ZwLAXSFX4sX6B
         7HpTZ6CAb3wnkCydf7+dJ+B+bazjvCOhH18P/tirBQEymx+qHWE2b74tEw7e6QQ6+ii6
         hPoZMSExbHqs2Sef3jjFCUXYQ3Kxzq/vVvvVdZzbu39F+CYQdGPny8xCnt9O7iNYvxdf
         VDw1xqEx04ff2GbJuqlETKcuCFLYkFXsJyX0r9dSe1Fa6sgVt4TOwujYv7QQuk+R9EkB
         nELw==
X-Gm-Message-State: AOJu0YzNxyEUMaQXU3UA8xx0dKDoeNnobEB3+j92RuMRmZbQ1T8DjgpU
	tQE4Nq9iEvLVq6TQA0X/eDHjEcSb9yl8F/jSqIaF7QGcCreilqwjVlG/hpnmsdgw
X-Gm-Gg: ASbGncvx2ghirvuP5nZH92o+u/SCCaaD3NhXJQjNJH/WO3uztYx/1kXY9oXCGESWxPT
	bZGwy8cp71B+NDPUacM4BhH8gBFlVIb1mK/dhyZN/u8AzmBWS9EDHM7G2XGQU9wg6e8aRJHjQf4
	9r+cHYEP6S1xPhgieR2xSOYuJOXFabCiG9WPU0a2cVYvRWY+gzrJfnrI+he+CnkiLlKKXrVcHKI
	IaRTPcbJkW0GRV9NMjjr0D/qYsjXD2BsRH3fQLNBpIgeTuyJN+b/b52DoCkz5Ctd6euyRQ4ibh/
	F9A6Dm+6vztcn8V+KUplZeojX03fgJ1zyMfKnGF/iLea/1FvTTj+klXd0MLO+/NBlB51JrnIeGe
	WhO+5Zma9hbsct+NV4zAekD50hZ2o3FoAsKUiV3kPSHzpcbPVaoVgvG1C1iNjQtk=
X-Google-Smtp-Source: AGHT+IEl4semVTz375h6te5FgJN0aJz1vYNupdBycBa/a5cXVTgIM9wn8rS0yqKQjOw2zf3cbWwxBQ==
X-Received: by 2002:a05:620a:2909:b0:7c5:5cc4:ca5c with SMTP id af79cd13be357-7ceecbcbd7cmr2284726685a.14.1748457696433;
        Wed, 28 May 2025 11:41:36 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cfb8212759sm102891785a.25.2025.05.28.11.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 11:41:35 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/5] linux-yocto/5.15: update to v5.15.180
Date: Wed, 28 May 2025 14:41:30 -0400
Message-Id: <20250528184134.1527736-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 18:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217384

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    f7347f400572 Linux 5.15.180
    0d709c0ccceb mmc: sdhci-brcmstb: Initialize base_clk to NULL in sdhci_brcmstb_probe()
    35254cb9d115 tracing: Do not use PERF enums when perf is not defined
    3e47f3a703c6 mm, slab: remove duplicate kernel-doc comment for ksize()
    c1030da07a24 mmc: sdhci-brcmstb: use clk_get_rate(base_clk) in PM resume
    58bc361822db NFSD: Skip sending CB_RECALL_ANY when the backchannel isn't up
    cdb796137c57 nfsd: put dl_stid if fail to queue dl_recall
    b0274ddac570 jfs: add index corruption check to DT_GETPAGE()
    78c9cbde8880 jfs: fix slab-out-of-bounds read in ea_get()
    b7531a4f99c3 ext4: fix OOB read when checking dotdot dir
    1b77a8c7f8b7 ext4: don't over-report free space or inodes in statvfs
    37e8719b1791 tracing/osnoise: Fix possible recursive locking for cpus_read_lock()
    585464695f63 tracing: Fix synth event printk format for str fields
    caefd40151f7 tracing: Ensure module defining synth event cannot be unloaded while tracing
    81a85b12132c tracing: Fix use-after-free in print_graph_function_flags during tracer switching
    801bc749fe66 mmc: sdhci-pxav3: set NEED_RSP_BUSY capability
    7fbfe8d99b2f ACPI: resource: Skip IRQ override on ASUS Vivobook 14 X1404VAP
    92ba06aef655 acpi: nfit: fix narrowing conversion in acpi_nfit_ctl
    0a8f806ea6b5 x86/mm: Fix flush_tlb_range() when used for zapping normal PMDs
    5ac5f2a3a8ff x86/tsc: Always save/restore TSC sched_clock() on suspend/resume
    2c4fe45351e5 btrfs: handle errors from btrfs_dec_ref() properly
    7b02f69bfb19 ntb_perf: Delete duplicate dmaengine_unmap_put() call in perf_copy_chunk()
    1df48e8773cf platform/x86: ISST: Correct command storage data length
    95789c2f94fd usbnet:fix NPE during rx_complete
    4331ae2788e7 drm/amd/display: Skip inactive planes within ModeSupportAndSystemConfiguration
    e549cd6da1f2 drm/amd/pm: Fix negative array index read
    91264238e941 tty: serial: fsl_lpuart: disable transmitter before changing RS485 related registers
    557f6adcd07d tty: serial: fsl_lpuart: use UARTMODIR register bits for lpuart32 platform
    f8100551939b mmc: sdhci-brcmstb: add cqhci suspend/resume to PM ops
    6991fabddd6f mmc: sdhci-brcmstb: Add ability to increase max clock rate for 72116b0
    4c671d0377b8 can: flexcan: disable transceiver during system PM
    c79d1fba305d can: flexcan: only change CAN state when link up in system PM
    ef8b29398ea6 arcnet: Add NULL check in com20020pci_probe()
    b4513ad0f391 net: fix geneve_opt length integer overflow
    0baa3f0369a9 ipv6: fix omitted netlink attributes when using RTEXT_FILTER_SKIP_STATS
    ca2adfc03cd6 netfilter: nft_tunnel: fix geneve_opt type confusion addition
    e7479a2549cb tunnels: Accept PACKET_HOST in skb_tunnel_check_pmtu().
    0162cb87b3cd vsock: avoid timeout during connect() if the socket is closing
    e3711163d14d net: mvpp2: Prevent parser TCAM memory corruption
    32ee79682315 net_sched: skbprio: Remove overly strict queue assertions
    a7e89541d05b netlabel: Fix NULL pointer exception caused by CALIPSO on IPv4 sockets
    b87f19c495cb netfilter: nft_set_hash: GC reaps elements with conncount for dynamic sets only
    018e6cf2503e ASoC: imx-card: Add NULL check in imx_card_probe()
    03fd0444e719 ntb: intel: Fix using link status DB's
    2429bdf26a0f ntb_hw_switchtec: Fix shift-out-of-bounds in switchtec_ntb_mw_set_trans
    de237129b9fd riscv: ftrace: Add parentheses in macro definitions of make_call_t0 and make_call_ra
    c4e72a0d7544 spufs: fix a leak in spufs_create_context()
    53b189651c33 spufs: fix a leak on spufs_new_file() failure
    90c4a3eaa7d5 hwmon: (nct6775-core) Fix out of bounds access for NCT679{8,9}
    051be169fb7c can: statistics: use atomic access in hot path
    fe2ffc3442bf ALSA: hda/realtek: Add mute LED quirk for HP Pavilion x360 14-dy1xxx
    c3021a955e77 drm/amd: Keep display off while going into S4
    3c9a43eef01d x86/sgx: Warn explicitly if X86_FEATURE_SGX_LC is not enabled
    46c66d975a58 locking/semaphore: Use wake_q to wake up processes outside lock critical section
    26d4d84aa6cf sched/deadline: Use online cpus for validating runtime
    c3a3484d9d31 ksmbd: fix incorrect validation for num_aces field of smb_acl
    397e6aa03f9a affs: don't write overlarge OFS data block size fields
    4441c2658337 affs: generate OFS sequence numbers starting at 1
    35d7887ab2d1 nvme-pci: skip CMB blocks incompatible with PCI P2P DMA
    7b860d9a4d56 nvme-pci: clean up CMBMSC when registering CMB fails
    8dad8a6b4f61 nvme-tcp: fix possible UAF in nvme_tcp_poll
    2be5bed3e089 wifi: iwlwifi: fw: allocate chained SG tables for dump
    7929187c67a3 sched/smt: Always inline sched_smt_active()
    cb615d3fdaae octeontx2-af: Free NIX_AF_INT_VEC_GEN irq
    f1e97333d34a octeontx2-af: Fix mbox INTR handler when num VFs > 64
    190d766abe6f ACPI: processor: idle: Return an error if both P_LVL{2,3} idle states are invalid
    1db23504775a ring-buffer: Fix bytes_dropped calculation issue
    55cf766eba06 ksmbd: fix multichannel connection failure
    571b342d4688 ksmbd: use aead_request_free to match aead_request_alloc
    bb7bdf636cef rtnetlink: Allocate vfinfo size for VF GUIDs when supported
    52a6316af117 exfat: fix the infinite loop in exfat_find_last_cluster()
    9b76b198cf20 objtool, media: dib8000: Prevent divide-by-zero in dib8000_set_dds()
    b20a4ca247a5 fs/procfs: fix the comment above proc_pid_wchan()
    ccf40f82638d perf python: Check if there is space to copy all the event
    69abc7554403 perf python: Don't keep a raw_data pointer to consumed ring buffer space
    cdf417656af5 perf python: Decrement the refcount of just created event on failure
    be0f2d515164 perf python: Fixup description of sample.id event member
    1c0bd3d322ae i3c: master: svc: Fix missing the IBI rules
    c5d2d17aecb4 fuse: fix dax truncate/punch_hole fault path
    257fd2aa2893 NFSv4: Don't trigger uneccessary scans for return-on-close delegations
    17c99ab3db2b ocfs2: validate l_tree_depth to avoid out-of-bounds access
    d2421351549c kexec: initialize ELF lowest address to ULONG_MAX
    adb0ac53b73e perf units: Fix insufficient array space
    201e7d7c0e32 iio: adc: ad7124: Fix comparison of channel configs
    0922d86a7a60 fs/ntfs3: Fix a couple integer overflows on 32bit systems
    7041fafd0dc6 iio: accel: mma8452: Ensure error return on failure to matching oversampling ratio
    473362787faf coresight: catu: Fix number of pages while using 64k pages
    abb8f3369f44 soundwire: slave: fix an OF node reference leak in soundwire slave device
    ae44c01f3fbb isofs: fix KMSAN uninit-value bug in do_isofs_readdir()
    b9d693b3bc25 clk: qcom: mmcc-sdm660: fix stuck video_subcore0 clock
    f19a85216aa8 crypto: hisilicon/sec2 - fix for aead auth key length
    1c644d8ab3f6 x86/dumpstack: Fix inaccurate unwinding from exception stacks due to misplaced assignment
    ab776df91d67 mfd: sm501: Switch to BIT() to mitigate integer overflows
    f0447ceb8a31 RDMA/mlx5: Fix mlx5_poll_one() cur_qp update flow
    6d662e7666f2 crypto: nx - Fix uninitialised hv_nxc on error
    a2d672786704 power: supply: max77693: Fix wrong conversion of charge input threshold value
    9b35d55bfc9f x86/entry: Fix ORC unwinder for PUSH_REGS with save_ret=1
    93c6fb0d18ad clk: amlogic: g12a: fix mmc A peripheral clock
    f95e0f36e592 clk: amlogic: gxbb: drop non existing 32k clock parent
    cc2817165e5e clk: amlogic: g12b: fix cluster A parent data
    8c9652d29438 pinctrl: tegra: Set SFIO mode to Mux Register
    b26ed1d80c48 IB/mad: Check available slots before posting receive WRs
    79103371b574 remoteproc: qcom_q6v5_mss: Handle platforms with one power domain
    9a5b7f8842a9 RDMA/core: Don't expose hw_counters outside of init net namespace
    d82fd0fb9750 clk: rockchip: rk3328: fix wrong clk_ref_usb3otg parent
    f6adccd0a887 pinctrl: renesas: rzg2l: Fix missing of_node_put() call
    93a0760d371e pinctrl: renesas: rza2: Fix missing of_node_put() call
    3b619f280328 lib: 842: Improve error handling in sw842_compress()
    eba7778cf9b9 bpf: Use preempt_count() directly in bpf_send_signal_common()
    948b7898a81a clk: qcom: gcc-msm8953: fix stuck venus0_core0 clock
    d974e177369c clk: samsung: Fix UBSAN panic in samsung_clk_init()
    b28c6712afb6 libbpf: Fix hypothetical STT_SECTION extern NULL deref case
    be6a831b44fe remoteproc: qcom_q6v5_pas: Make single-PD handling more robust
    791de7357bdd of: property: Increase NR_FWNODE_REFERENCE_ARGS
    6e66bca8cd51 remoteproc: core: Clear table_sz when rproc_shutdown
    cca86355466f crypto: hisilicon/sec2 - fix for aead authsize alignment
    d512627292bc clk: amlogic: gxbb: drop incorrect flag on 32k clock
    8a16be14db76 fbdev: sm501fb: Add some geometry checks.
    7dc76ac3eb84 mdacon: rework dependency list
    dbac029069f8 fbdev: au1100fb: Move a variable assignment behind a null pointer check
    272a425d77ca PCI: pciehp: Don't enable HPIE when resuming in poll mode
    9ac06e063209 drm/mediatek: dsi: fix error codes in mtk_dsi_host_transfer()
    ce7ebca5488f PCI: xilinx-cpm: Fix IRQ domain leak in error path of probe
    8916ca26d4e6 PCI: Remove stray put_device() in pci_register_host_bridge()
    bb4a1eb2c6a1 drm/amd/display: fix type mismatch in CalculateDynamicMetadataParameters()
    9a376697fcac PCI: Avoid reset when disabled via sysfs
    8656d24467a9 PCI/portdrv: Only disable pciehp interrupts early when needed
    df97eb2fd468 PCI: brcmstb: Use internal register to change link capability
    fa2fcc7706fe PCI: cadence-ep: Fix the driver to send MSG TLP for INTx without data payload
    e5cd58f61e9d PCI/ASPM: Fix link state exit during switch upstream function removal
    01be87ebbf44 drm/mediatek: mtk_hdmi: Fix typo for aud_sampe_size member
    67ccd3e9fdc7 drm/mediatek: mtk_hdmi: Unregister audio platform device on failure
    49a69f67f535 drm/vkms: Fix use after free and double free on init error
    9842973b93c4 drm: xlnx: zynqmp: Fix max dma segment size
    1b990d384b28 drm/dp_mst: Fix drm RAD print
    271755cd8ff0 drm/bridge: ti-sn65dsi86: Fix multiple instances
    b02c23f38fe2 ASoC: ti: j721e-evm: Fix clock configuration for ti,j7200-cpb-audio compatible
    1cfb0ed41174 ALSA: hda/realtek: Always honor no_shutup_pins
    c877ac2c888d HID: remove superfluous (and wrong) Makefile entry for CONFIG_INTEL_ISH_FIRMWARE_DOWNLOADER
    2453d54d6700 media: platform: allgro-dvt: unregister v4l2_device on the error path
    f343b4420263 perf/ring_buffer: Allow the EPOLLRDNORM flag for poll
    3a96b835f82e lockdep: Don't disable interrupts on RT in disable_irq_nosync_lockdep.*()
    4eb3afae45cd PM: sleep: Fix handling devices with direct_complete set on errors
    3155d5261b51 thermal: int340x: Add NULL check for adev
    c5e1a3d67651 EDAC/ie31200: Fix the error path order of ie31200_init()
    1f64ad3034dc EDAC/ie31200: Fix the DIMM size mask for several SoCs
    537a5a3de19b EDAC/ie31200: Fix the size of EDAC_MC_LAYER_CHIP_SELECT layer
    ed68a544b931 selinux: Chain up tool resolving errors in install_policy.sh
    24045932e7e0 PM: sleep: Adjust check before setting power.must_resume
    3914a222d673 x86/platform: Only allow CONFIG_EISA for 32-bit
    3047aba14253 x86/fpu: Avoid copying dynamic FP state from init_task in arch_dup_task_struct()
    dc6e7db76a35 cpufreq: governor: Fix negative 'idle_time' handling in dbs_update()
    74e918950ba9 cpufreq: scpi: compare kHz instead of Hz
    990d17f5d35d x86/mm/pat: cpa-test: fix length for CPA_ARRAY test
    471c89b7d4f5 watch_queue: fix pipe accounting mismatch
    ece3fc1c1019 media: i2c: et8ek8: Don't strip remove function when driver is builtin
    03c4c633a022 serial: 8250_dma: terminate correct DMA in tx_dma_flush()
    31f0eaed6914 memstick: rtsx_usb_ms: Fix slab-use-after-free in rtsx_usb_ms_drv_remove
    df594b4bf294 net: usb: usbnet: restore usb%d name exception for local mac addresses
    f9f2b4139ac5 net: usb: qmi_wwan: add Telit Cinterion FE990B composition
    7a8e62c90f27 net: usb: qmi_wwan: add Telit Cinterion FN990B composition
    7802030f86e4 tty: serial: 8250: Add Brainboxes XC devices
    463e16de8ab4 tty: serial: 8250: Add some more device IDs
    1e82f28f2958 counter: microchip-tcb-capture: Fix undefined counter channel state on probe
    889c71c613c0 counter: stm32-lptimer-cnt: fix error handling when enabling
    ce37a881271a ALSA: hda/realtek: Support mute LED on HP Laptop 15s-du3xxx
    1ca2169cc19d netfilter: socket: Lookup orig tuple for IPv6 SNAT
    523b9c2ed5dc ARM: Remove address checking for MMUless devices
    7da1f403ad80 ARM: 9351/1: fault: Add "cut here" line for prefetch aborts
    db8e5866d1aa ARM: 9350/1: fault: Implement copy_from_kernel_nofault_allowed()
    d7f1e4a53a51 atm: Fix NULL pointer dereference
    2498a3a95c80 HID: hid-plantronics: Add mic mute mapping and generalize quirks
    6e8093be53ed ALSA: usb-audio: Add quirk for Plantronics headsets to fix control names
    fdb2cd8957ac bpf, sockmap: Fix race between element replace and close()
    22b49d6e4f39 Bluetooth: hci_event: Align BR/EDR JUST_WORKS paring with LE
    f50efd386116 arm64: dts: rockchip: fix u2phy1_host status for NanoPi R4S
    590327b49706 mptcp: Fix data stream corruption in the address announcement
    037e753561ec drm/amdgpu: Fix JPEG video caps max size for navi1x and raven
    9b2da9c673a0 drm/radeon: fix uninitialized size issue in radeon_vce_cs_parse()
    daba84612236 soc: qcom: pdr: Fix the potential deadlock
    a35b68e55089 batman-adv: Ignore own maximum aggregation size during RX
    4a7d4f01f440 ARM: shmobile: smp: Enforce shmobile_smp_* alignment
    4b0b8445b6fd proc: fix UAF in proc_get_inode()
    4667e64b3916 mmc: atmel-mci: Add missing clk_disable_unprepare()
    8e500180904a regulator: check that dummy regulator has been probed before using it
    f45a322c9994 drm/v3d: Don't run jobs that have errors flagged in its fence
    0ffefd3117fb i2c: omap: fix IRQ storms
    4d9c2a0d8a27 Revert "gre: Fix IPv6 link-local address generation."
    fc0f223ea342 net/neighbor: add missing policy for NDTPA_QUEUE_LENBYTES
    82d9084a9789 net: atm: fix use after free in lec_send()
    d2ae4cc39c1a ipv6: Set errno after ip_fib_metrics_init() in ip6_route_info_create().
    596a883c4ce2 ipv6: Fix memleak of nhc_pcpu_rth_output in fib_check_nh_v6_gw().
    76304cba8cba Bluetooth: Fix error code in chan_alloc_skb_cb()
    33a839830dcc RDMA/hns: Fix wrong value of max_sge_rd
    1d9e126a5db7 RDMA/hns: Fix a missing rollback in error path of hns_roce_create_qp_common()
    bd3774c05c8f RDMA/hns: Fix unmatched condition in error path of alloc_user_qp_db()
    efe544462fc0 RDMA/hns: Fix soft lockup during bt pages loop
    e6f5739f13f0 RDMA/hns: Remove redundant 'phy_addr' in hns_roce_hem_list_find_mtt()
    48dc65b3dd0c RDMA/bnxt_re: Avoid clearing VLAN_ID mask in modify qp path
    0eb62974d6fa ARM: dts: bcm2711: Don't mark timer regs unconfigured
    4296c2f111d6 RDMA/bnxt_re: Add missing paranthesis in map_qp_id_to_tbl_indx
    5608b9b07a39 ARM: dts: bcm2711: PL011 UARTs are actually r1p5
    7a64c8ebf73e xfrm_output: Force software GSO only in tunnel mode
    7631e903a1d0 firmware: imx-scu: fix OF node leak in .probe()
    a140224bcf87 smb: client: fix potential UAF in cifs_debug_files_proc_show()
    9b7cabd24812 smb: client: Fix match_session bug preventing session reuse
    f435192e00bc drm/amd/display: Fix null check for pipe_ctx->plane_state in resource_build_scaling_params
    53ce3ffe7b09 drm/amd/display: Check for invalid input params when building scaling params
    b4d89d5cb794 i2c: sis630: Fix an error handling path in sis630_probe()
    449aaab1338b i2c: ali15x3: Fix an error handling path in ali15x3_probe()
    35092c242e10 i2c: ali1535: Fix an error handling path in ali1535_probe()
    513f6cf2e906 cifs: Fix integer overflow while processing closetimeo mount option
    ea8e5dd4e4cd cifs: Fix integer overflow while processing actimeo mount option
    0c26edf477e0 cifs: Fix integer overflow while processing acdirmax mount option
    a13351624a6a cifs: Fix integer overflow while processing acregmax mount option
    2fc361f0d32c ASoC: codecs: wm0010: Fix error handling path in wm0010_spi_probe()
    b14482befdb6 drm/gma500: Add NULL check for pci_gfx_root in mid_get_vbt_data()
    c402f184a053 ASoC: ops: Consistently treat platform_max as control value
    5defdaddd53a tcp: fix races in tcp_abort()
    105c66116a8b lib/buildid: Handle memfd_secret() files in build_id_parse()
    68ae5ef2dc98 qlcnic: fix memory leak issues in qlcnic_sriov_common.c
    1397715b011b drm/amd/display: Fix slab-use-after-free on hdcp_work
    0c0016712e5d drm/amd/display: Assign normalized_pix_clk when color depth = 14
    9e8637d974f7 drm/amd/display: Restore correct backlight brightness after a GPU reset
    70b8c6f7b061 drm/atomic: Filter out redundant DPMS calls
    18b5d857c649 x86/microcode/AMD: Fix out-of-bounds on systems with CPU-less NUMA nodes
    479258418366 USB: serial: option: match on interface class for Telit FN990B
    8d57aa9f5207 USB: serial: option: fix Telit Cinterion FE990A name
    9ce2056eaada USB: serial: option: add Telit Cinterion FE990B compositions
    cdc013ff804b USB: serial: ftdi_sio: add support for Altera USB Blaster 3
    a755c6d1dfe7 block: fix 'kmem_cache of name 'bio-108' already exists'
    e51d136d3369 drm/nouveau: Do not override forced connector status
    d42130a5a228 mptcp: safety check before fallback
    4d63301ae35c x86/irq: Define trace events conditionally
    c21d1fa13902 fuse: don't truncate cached, mutated symlink
    0cae84544670 ASoC: tas2764: Set the SDOUT polarity correctly
    631bc990daea ASoC: tas2764: Fix power control mask
    2a0177da8a81 ASoC: tas2770: Fix volume scale
    fb97ca69cc21 nvme: only allow entering LIVE from CONNECTING state
    f7580f081edd sctp: Fix undefined behavior in left shift operation
    f25a991ea177 nvmet-rdma: recheck queue state is LIVE in state lock in recv done
    75308c6bb93e net: wwan: mhi_wwan_mbim: Silence sequence number glitch errors
    eed857c0d173 ASoC: SOF: Intel: hda: add softdep pre to snd-hda-codec-hdmi module
    e1b6ee40153b ASoC: arizona/madera: use fsleep() in up/down DAPM event delays.
    92d029655812 ASoC: rsnd: don't indicate warning on rsnd_kctrl_accept_runtime()
    5664d28540ae thermal/cpufreq_cooling: Remove structure member documentation
    9f5921f38f46 s390/cio: Fix CHPID "configure" attribute caching
    64577690e49c sched: Clarify wake_up_q()'s write to task->wake_q.next
    007a849126ef HID: ignore non-functional sensor in HP 5MP Camera
    6e0397d0a4ec HID: intel-ish-hid: fix the length of MNG_SYNC_FW_CLOCK in doorbell
    3ad860fd4be1 vboxsf: fix building with GCC 15
    01f5839123d6 alpha/elf: Fix misc/setarch test of util-linux by removing 32bit support
    e8ed82ff391b ACPI: resource: IRQ override for Eluktronics MECH-17
    c737e2a5fb7f scsi: qla1280: Fix kernel oops when debug level > 2
    67aad09faab8 scsi: core: Use GFP_NOIO to avoid circular locking dependency
    b388e185bfad iscsi_ibft: Fix UBSAN shift-out-of-bounds warning in ibft_attr_show_nic()
    4a2ea3dd4eb9 powercap: call put_device() on an error path in powercap_register_control_type()
    54595d6e8b6f hrtimers: Mark is_migration_base() with __always_inline
    c26d65527f31 nvme-fc: go straight to connecting state when initializing
    e4cb0dd364af net/mlx5e: Prevent bridge link show failure for non-eswitch-allowed devices
    f90c4d657248 net/mlx5: Bridge, fix the crash caused by LAG state check
    057dbc5b72e9 net: openvswitch: remove misbehaving actions length check
    23721bbf1481 openvswitch: Use kmalloc_size_roundup() to match ksize() usage
    b6be0f687841 slab: Introduce kmalloc_size_roundup()
    4207e812e49f slab: clean up function prototypes
    cb4407c921e1 gre: Fix IPv6 link-local address generation.
    46ea2a7a8c27 netfilter: nft_exthdr: fix offset with ipv4_find_option()
    003d92c91cdb net_sched: Prevent creation of classes with TC_H_ROOT
    65b0a61ca237 ipvs: prevent integer overflow in do_ip_vs_get_ctl()
    e8544a5a97be netfilter: nf_conncount: Fully initialize struct nf_conncount_tuple in insert_tree()
    29c419c64e9b net/mlx5: handle errors in mlx5_chains_create_table()
    77d9b2d60b57 Drivers: hv: vmbus: Don't release fb_mmio resource in vmbus_free_mmio()
    b018706f5fdb netpoll: hold rcu read lock in __netpoll_send_skb()
    7274119e8128 net: dsa: mv88e6xxx: Verify after ATU Load ops
    e6902101f34f ice: fix memory leak in aRFS after reset
    595e855a0f38 netfilter: nft_ct: Use __refcount_inc() for per-CPU nft_ct_pcpu_template.
    10e33014552c pinctrl: bcm281xx: Fix incorrect regmap max_registers value
    179cf97ee278 fbdev: hyperv_fb: iounmap() the correct memory when removing a device
    70549c80fe80 ipv6: Fix signed integer overflow in __ip6_append_data
    21c0225b66b8 sched/isolation: Prevent boot crash when the boot CPU is nohz_full
    cfd5ee5a6684 clockevents/drivers/i8253: Fix stop sequence for timer 0
    f5dc10b910bd vlan: fix memory leak in vlan_newlink()
    e0bb89c44b56 efi: libstub: Use '-std=gnu11' to fix build with GCC 15
    b5d500042eb3 usb: hcd-pci: remove the action of faking interrupt request
    1b4c2b1574e7 usb: dwc3: Remove the duplicate code in the dwc3_suspend_common()
    96238227b1ba firmware: xilinx: Fix two enum-int-mismatch errors
    6f0605db50e2 clk: imx: Add check for kcalloc
    5b837b9e1543 bpf: Fix the indention issue in grow_stack_state()
    42b62697634d cifs: Fix the calling of smb_version_operations::calc_smb_size()
    b14acf729e9d f2fs: Add inline to f2fs_build_fault_attr() stub
    7c317bec311f f2fs: check validation of fault attrs in f2fs_build_fault_attr()
    81c12119c23f bpf: Fix accesses to uninit stack slots [ Upstream commit 6b4a64bafd107e521c01eec3453ce94a3fb38529 ]
    c4fa05422d87 smb: client: fix potential OOB in smb2_dump_detail()
    299ef3b5b00b of: module: add buffer overflow check in of_modalias()
    80afbc1b2fd1 fpga: region: Drop unneeded part due to merge issue
    b8086c3c1548 reiserfs: Avoid touching renamed directory if parent does not change
    ea091017ef62 ipv6: Fix data races around sk->sk_prot.
    ff8710da80ee ipv6: annotate some data-races around sk->sk_prot
    e8c2eafaaa6a tcp: Fix data races around icsk->icsk_af_ops.
    b534e1adeb7c gpio: zynq: fix zynqmp_gpio not an immutable chip warning
    939540dec448 gpio: Don't fiddle with irqchips marked as immutable
    9201366ba1cd sound: xilinx: use hdmi-codec as dp audio codec
    8d1bab770956 locking/rwsem: Disable preemption while trying for rwsem lock
    7c82dac02886 block, loop: support partitions without scanning
    45f504f301d4 bpftool: Fix pretty print dump for maps without BTF loaded
    c1fac418c555 driver: soc: xilinx: rename cpu_number1 to dummy_cpu_number
    01867ba4c4bd net: axienet: Fix check for partial TX checksum
    1f24338cb789 jbd2: Drop the merge conflicted hunk
    e1d0e3c51bde tpm: tis_i2c: Limit write bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    1abe841fe331 tpm: tis_i2c: Limit read bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    6224acfc1d56 tpm: Add flag to use default cancellation policy
    1cd19d48fb90 tpm: tis_i2c: Fix sanity check interrupt enable mask
    a883da132fa8 tpm: Add tpm_tis_i2c backend for tpm_tis_core
    a742ac8a1c51 tpm: Add tpm_tis_verify_crc to the tpm_tis_phy_ops protocol layer
    ef495c5f45f2 tpm: Remove read16/read32/write32 calls from tpm_tis_phy_ops
    45f25f24d09f usb: dwc3: Restore the SDK changes in dwc3_core_soft_reset()
    ce9531008011 i2c: xiic: Drop the duplicate codes introduced by stable merge
    1f3be2e23aa6 gcc-plugins: Reorganize gimple includes for GCC 13
    24615a3b932a ata: ahci: fix enum constants for gcc-13
    5d6cb145541a net: stmmac: Enable mac_managed_pm phylink config
    fd93aabb4287 tools/resolve_btfids: Use pkg-config to locate libelf
    130f9da78406 tools/resolve_btfids: Build with host flags
    00f2f1a782f9 tools/resolve_btfids: Support cross-building the kernel with clang
    17776a4ba9c2 tools/resolve_btfids: Install libbpf headers when building
    7c9808380d70 libbpf: Make libbpf_version.h non-auto-generated
    37ae1ba791ac libbpf: Add LIBBPF_DEPRECATED_SINCE macro for scheduling API deprecations
    a764687951a8 usb: dwc3: gadget: do cleanup for dwc3_stop_active_transfer
    b687af038c30 arm64: dts: versal: add i2c devices
    dba87a9085b3 arm64: zynqmp: Skip frequency resetting of si570 clocks during probe
    b1a17a5b31c1 arm64: versal-net: Switch alias order for sdhci
    f2f423bf8b37 arm64: versal: Enable LPD DMA on vek280 board
    791764ddefd1 spi: spi-zynqmp-gqspi: Fix call trace during QSPI suspend
    2941442ba6c1 drm: xlnx: hdmi: Add VPSS bridge support
    6f9d0dea524e drm: to find the standard mode in CEA table
    a024a464ec78 phy: xilinx-xhdmiphy: Add support to GTYE5 and GTYP devices
    45433dc914fe dt: bindings: phy: Add new compatible string to support HDMI GT controller
    bc4f21863016 misc: xilinx-ai-engine: Skip error interrupt backtrack for AIE-ML
    bc97498a91be arm64: versal-net: Add 'power-domains' and 'reset-gpios' properties
    f0072d866c6d drm: xlnx: dp: share the dp registers to dp audio driver
    4d87a5a7432f drm: xlnx: dp: Fix the condition check and get audio clock rate
    fd0dc83f179e v4l: xilinx: dprx: Add HDCP1X support
    20584a013b2c dt-bindings: xilinx: Add hdcp1x support for DPRXSS
    7dd6cc0aeb13 v4l: xilinx: Add HDCP1X rx driver
    86b57ba6fd1e staging: xlnx_hdcp1x: Add HDCP1X cipher functionality for Xilinx devices
    f45966d27e80 Revert "arm64: zynqmp: Add power domain description for PL"
    b205a9a8228e arm64: xilinx: Add Versal NET platforms
    0a60bfafdc59 dt-bindings: xilinx: Add support for Versal NET power/reset
    adc401f52fc1 arm64: zynqmp: Add support for vck190-revB SC board
    ef74629dd1cc arm64: xilinx: Add support for vek280 revA board
    c6cb3f956e4e arm64: versal: Add support for Versal vhk158 board
    df90c617ecc5 iio: adc: versal-sysmon: Add nodeid property to DT
    6029118d61a2 iio: adc: versal-sysmon: Support multi SLR sysmon
    95b03d322808 iio: adc: versal-sysmon: Add nodeid in DT doc
    6e93ee82927e iio: adc: versal-sysmon: Add nodeid to PLM interface
    7bc75b4ab0d1 arm64: zynqmp: Differentiate clock nodes with 'clock-output-names' property
    adf0a9df7c4c arm64: zynqmp: Differentiate clock nodes with 'clock-output-names' property
    3b3aea49f9ed arm64: zynqmp: Correct labels of TCA6416A GPIO Expander
    2a8036a4dab7 arm64: zynqmp: Add mtd partition for secure OS storage area
    a335ba3699fe Revert "arm64: zynqmp: Comment sata phy setting for zcu102"
    524e12d43f6a spi: increase timeout value for spi transfers
    1676e9bfd9e5 i3c: master: dw: HACK: Update the scl timings
    a4b648c0b36b spi: spi-cadence-quadspi: Add module param to configure read timeout
    64389588052f firmware: xilinx: add support for Versal NET
    5c6838583891 reset: reset-zynqmp: add support for Versal NET platform
    56aeff13ab84 dt-bindings: reset: add compatible string for Versal NET reset driver
    69cb391ebffc dt-bindings: arm: cpus: Add ARM Cortex-A78
    d1501fb479c0 Revert "pinctrl: pinctrl-zynqmp: Add support for output-enable and bias-high-impedance"
    4b0747f59ad5 drm: xlnx: hdmi: Add support for arbitrary resolutions
    45de2ad5e676 dt-bindings: display: xlnx: hdmitxss: Add v1.2 compatible string
    db7d84274707 drm: xlnx: hdmi: update video timing parameters
    1a224c0dbc75 drm: xlnx: hdmi: Update phy configure call sequence in HPD event handler
    4109612448f9 mtd: spi-nor: Add support for Macronix mx66l2g45g flash
    d6d12b247476 mtd: spi-nor: Add flash lock/unlock support for Macronix flashes
    f4b6421bf219 net: macb: Fix ZynqMP SGMII non-wakeup source resume failure
    ae19c886f666 staging: xilinx-tsn: Fix compilation error in xilinx-tsn when PHYLIB is configured as a module.
    c9846ef8df8a staging: xilinx-tsn: Separate mdio related functions from axiethernet
    3bc6aeeb2d83 misc: xilinx-ai-engine: fix shim dma laddr mask
    a8a0a105f786 clk: versaclock7: Use a property to differentiate between nodes
    6562d87b8057 dt-bindings: watchdog: Add versal support
    2790bd839c7b dt-bindings: watchdog: Convert Xilinx watchdog bindings to json-schema
    abef39c9a8e1 crypto: xilinx: Handle invalid RSA key size
    f53aa5077538 dt-bindings: gpio: gpio-xilinx: Convert Xilinx axi gpio binding to YAML
    c13d3f34a0a1 clk: versalclock7: Use index to output mapping to reference banks
    3dc3245a3f0e arm64: versal: Add resets property in ospi DT node
    cc5b3e7c17e7 arm: dts: versal: add resets property for usb
    9c421b280643 arm64: versal: add reset-controller node
    4e940e2c56b2 arm: dts: versal: add ref_clk property for REFCLKPER calculation
    e4f7870ad1c7 arm64: versal: Add OCM controller node
    118d91dd45f8 arm64: versal: Wire gpio ethernet phy reset properly
    446e621dac56 arm64: zynqmp: Add missing tca6416 to zynqmp SC
    fc484a82a4c3 arm64: zynqmp: Add linux,code for gpio button
    f7206a5d36aa arm: dts: Add xlnx prefix to GEM compatible string
    7ef94d498482 arm64: versal: add xilsem edac node
    72c6f2bbe946 arm: dts: zynqmp: add snps,xhci-reset-on-resume quirk
    dc65c26efecc misc: xilinx-ai-engine: Fix uninitialized symbol 'dev'
    1c50544169ac usb: gadget: udc-xilinx: fix compilation error
    930f47675f3e usb: add quirk for xhci reinit warning on resume
    2f683f948012 dt-bindings: usb: dwc3: Add snps,xhci-reset-on-resume quirk
    d5fbdbe50e99 usb: gadget: udc-xilinx: replace memcpy with __memcpy_toio
    989fb52752ae net: cdns,macb: use correct xlnx prefix for Xilinx
    2dd512429d54 dt-bindings: net: cdns,macb: use correct xlnx prefix for Xilinx
    3fc7813ff947 arm64: zynqmp: add ref_clk property for REFCLKPER calculation
    ffd2602f73d9 arm64: zynqmp: Add clk bindings for RC21008A clock generator
    a143eb6d1e8a arm64: zynqmp: Add RC21008A clock nodes for vhk158
    7a3690b5bc82 drm: xlnx: sdi: Fix coding style (double space)
    ec807b81bc02 v4l: xilinx: sdirxss: HFR handling for 12G mode
    6110b1f1af22 drm: xlnx: sdi: HFR feature support
    2bc5b30b1d7a drm: xlnx: sdi: YUV444 format support
    15e5bfdc9985 drm: xlnx: dsi: Remove holes in dsi structure
    e854fc09f0d5 soc: xilinx: Fix for call trace due to the usage of smp_processor_id()
    5ccd0b215d18 net: macb: Fix macb mdiobus handing for DT nodes without phy-handle
    506f2abf47dc spi: spi-xilinx: Fix spi timeout issue with threaded irq enabled
    0d0f78000535 v4l: xilinx: dma: Fix back pressure on upstream entities in LLP2
    32b9cd58cf4c misc: xilinx_trafgen: deprecate the driver
    3f44aaf3a23f soc: xilinx: fix unhandled SGI warning message
    b62d1e4af698 PCI: xilinx-cpm: Add support for Versal CPM5 Root Port
    5b365e4275c1 dt-bindings: PCI: xilinx-cpm: Add Versal CPM5 Root Port
    5b27a7c40acc PCI: xilinx-cpm: Rename xilinx_cpm_pcie_port to xilinx_cpm_pcie
    a7ad86e82828 misc: xlnx_dpu: Dual license update for DPU header driver: GPL + Apache
    a0b60881ea8d iio: adc: versal-sysmon: update irq handling
    26f487d904ec iio: adc: versal-sysmon: fix write reg. in secure mode
    156016dbeb05 drm: xlnx: dptx: Change the VTC sub-core offset address
    858709bc53cf dt-bindings: display: xlnx: Add VTC offset DT property
    708f34f0b99e dt-bindings: display: xlnx: Add support for DP Tx SS v3.1
    6d333b80caeb misc: xilinx-ai-engine: Make direct writes to sysfs export buffers
    7f16cabb6602 v4l: xilinx: sdirxss: No payload handling for SDI 3G Mode
    28b785363ecc net: macb: In shared MDIO usecase make MDIO producer ethernet node to probe first
    66a2a7563426 edac: xilinx: Added EDAC support for Xilinx XilSem
    4cc9a928e978 firmware: xilinx: Add XilSem error events
    c725b98c50df dt-bindings: edac: Add bindings for Xilinx Versal EDAC for XilSem
    c5b7a7b5ecdf mtd: spi-nor: Add lock/unlock support for ISSI flash parts
    d94a3382260c phy: xilinx_dpgtquadphy: Add missing bitfield header
    dc5e3442b5ac misc: xlnx_dpu: Update the compatible
    6fc04412573a dt-bindings: misc: xlnx_dpu: Update the compatible for dpu v4.0 and v4.1
    180aed3313eb mtd: rawnand: arasan: Provide an additional ->exec_op() check
    3eea39e8b077 mtd: rawnand: Check the CHANGE_READ_COLUMN from nand_read_subpage() is supported
    0f230ac02255 mtd: rawnand: Add a helper to check if a CHANGE_READ_COLUMN is possible
    5383b60ee54a Revert "mtd: rawnand: arasan: Prevent an unsupported configuration"
    f8452cea3ad3 ARM: zynq: Fix OCM mmio-sram node
    e54dd6c00052 fpga: zynqmp: Make word align the configuration data
    d7f814493759 v4l: xlnx: sdirxss: Fixed kernel-doc warnings.
    28c759ccf4aa v4l: xlnx: sdirxss: Reset s_stream flag on STREAMOFF always
    4b345156490d v4l: xlnx: sdirxss: Continue streaming on connecting after disconnect from same source
    014c671b4045 mtd: spi-nor: swp: Fix lock/unlock failure on spansion flashes
    19a0850f948b mtd: spi-nor: swp: fix unlock lower area failure
    fbd2f8235aee mtd: spi-nor: Enable lock/unlock feature for s25fl256s spansion flashes
    61db1b6710e8 dt-bindings: ata: ahci-ceva: convert to yaml
    f3dae8232883 misc: xilinx_flex: deprecate the driver
    cf0e98a17340 clk: versalclock7: Add Renesas versaclock7 ccf device driver
    3f48da69fc36 dt-bindings: Renesas versaclock7 device tree bindings
    c6ee26d27753 ARM: zynq: Deprecate zynq ocmc driver
    50393cac74b6 spi: spi-cadence: Fix SPI NO Slave Select macro definition
    1e8e78d31ca4 v4l: xilinx: dprx: Fix compilation error
    3c31cedf8db5 misc: xilinx-ai-engine: Deprecate support for Versal S80 ES1
    d8b86a06344f spi: spi-xilinx: Fix bits_per_word_mask
    cf1a0b008089 sound: xilinx: pcm: Convert driver to use SPDX license header
    5f55231f417c sound: xilinx: pcm: Fixes NULL pointer dereference while setting config from DAI data
    9a7703423a4c soc: xilinx: remove pm_final_initialize call
    69f346cf74c1 soc: xilinx: add a to_zynqmp_pm_domain macro
    725660ddd2dd soc: xilinx: use a properly named field instead of flags
    80d7a7d8c087 soc: xilinx: cleanup debug and error messages
    6a198f68905c soc: xilinx: move PM_INIT_FINALIZE to zynqmp_pm_domains driver
    57d4a8a797d9 drm: xlnx: dptx: Add support for static HDR
    ab0b94b1da3c arm64: versal: dts: drop legacy property #stream-id-cells
    bf293c877963 arm64: xilinx: dts: drop legacy property #stream-id-cells
    a2667e6d7314 drm/radeon: free iio for atombios when driver shutdown
    f100c753aa1f powerpc: Fix reschedule bug in KUAP-unlocked user copy
    da5513f30187 libbpf: Fix build warning on ref_ctr_off
    4c5a089621a8 perf python: Account for multiple words in CC
    1c5699ee85d4 fs: move S_ISGID stripping into the vfs_*() helpers
    838f5d0701d8 fs: add mode_strip_sgid() helper
    d97172683641 squashfs: provide backing_dev_info in order to disable read-ahead
    bd383081ee5b usb: dwc3: delete dwc3_xhci_plat_priv
    ed037d7be40c irq_work: use kasan_record_aux_stack_noalloc() record callstack
    1363bd7dbde3 ixgbevf: add disable link state
    e5601ae2bd24 ixgbe: add improvement for MDD response functionality
    caa57cd80575 ixgbe: add the ability for the PF to disable VF link state
    16a77bfcc7df Check /dev/console using init_stat()
    04574fd5579a tracing/arm: Have max stack tracer handle the case of return address after data
    0e51e5717018 gpiolib: cdev: Set lineevent_state::irq after IRQ register successfully
    1e6b7da6ddba drivers/base: Fix unsigned comparison to -1 in CPUMAP_FILE_MAX_BYTES
    493160901320 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    04224f725aa3 irqchip/gic-v3-its: Skip HP notifier when no ITS is registered
    6f6c2996a81c irqchip/gic-v3-its: Postpone LPI pending table freeing and memreserve
    1fa94473423f irqchip/gic-v3-its: Give the percpu rdist struct its own flags field
    6013d1ae5feb cert host tools: Stop complaining about deprecated OpenSSL functions
    efe20512212b init/Kconfig: fix CC_HAS_ASM_GOTO_TIED_OUTPUT test with dash
    a40d2daf2795 pnmtologo: use relocatable file name
    3b40d5b41155 of: configfs: remove unused variable overlay_lock
    6c085baf1838 tools: use basename to identify file in gen-mach-types
    2fca0fd71981 lib/build_OID_registry: fix reproducibility issues
    0f586f4ee8ad vt/conmakehash: improve reproducibility
    a75774679f28 OF: DT-Overlay configfs interface (v8)
    305f859e03d4 dt-bindings: net: xilinx: document xilinx emaclite driver binding
    ae6e40cf8a72 drm: xlnx: mixer: Correct the fourcc string copy
    35a3ae1ce469 usb: dwc3: xilinx: Make regulator ops const
    823e05bbad26 usb: dwc3: xilinx: Fix alignment issues
    07960d1ac23d usb: dwc3: xilinx: Make dwc3_xilinx_wakeup_capable() static
    53bc249b031d pinctrl: pinctrl-zynqmp: Fix kernel-doc warning
    c2d2fc3e21ed net: xilinx: fix mixed declarations and code compile warning
    ef547c815f8f arm64: zynqmp: Add 'i2c-mux-idle-disconnect' property for vpk180
    9ea37dfc8a7d arm64: zynqmp: Set qspi tx-buswidth to 4
    8198f12c7f97 arm64: zynqmp: Add linux,code for fwuen button
    f428057f09ee arm64: zynqmp: Enable DP for kv260-revA board
    4cc745fe47d1 arm64: zynqmp: Fix usb node drive strength and slew rate
    1eab728efe96 arm64: zynqmp: Add pinctrl setting for zynqmp-sc-revB
    9714cc71a36e arm64: zynqmp: In sc-revB dts move PHY reset to PHY node
    5665349a16fe arm64: zynqmp: Invert the pwm-fan polarity in SC
    0b1cb42afa31 arm64: versal: Set qspi tx-buswidth to 4
    fb3165f182ca dts: versal: Enable LPD DMA on Versal boards
    a4ab0c56fa2b arm64: versal: Specify console and early console for vck5000
    f82a172b753a pinctrl: pinctrl-zynqmp: Add support for output-enable and bias-high-impedance
    258bd8ad12e1 dt-bindings: pinctrl-zynqmp: Add output-enable configuration
    7fc647e5b00f v4l: xilinx: dprx: Enable audio to receive infoframes with static HDR metadata
    1016f2e05f76 checkpatch: get default codespell dictionary path from package location
    c44978da576f v4l: xilinx: dprx: Add support for static HDR
    dd621316483a staging: xilinx-tsn: initialize timer_priv struct in axienet_local
    bae1ad6e454b misc: xilinx-ai-engine: Fix return value of sysfs current_freq read op
    29b397ecec62 drm: xlnx: zynqmp_dp: Fix kernel dump messages when the DP cable is disconnected
    bbc3330950e3 staging: xilinx-tsn: set default pcp to queue mapping
    3c89677edd67 firmware: xilinx: export sysmon used APIs
    ad1645056c33 dt-bindings: PCI: xilinx-cpm: Fix reg property order
    536a807501dc dt-bindings: net: xilinx_tsn: Document MCDMA properties
    3420aa064190 dt-bindings: net: xilinx_tsn: Add ranges property
    f511502dd6ff usb: dwc3: xilinx: fix usb3 non-wakeup source resume failure
    e8345d774971 usb: dwc3: xilinx: Fix error handling when getting USB3 PHY
    a272e82ea851 drm: xlnx: sdi: Fix typo in kernel-doc
    a5d85cd868d5 drm: xlnx: sdi: reset gt-phy based on device tree property
    c29e7f0f91ac v4l: xilinx: multi-scaler: Fix warnings for unchecked return value
    b6fa9d374751 staging: xilinx-tsn: Remove hardcoded interface names
    246849ced049 staging: xilinx-tsn: Add ethtool hook to read phc associated with ep
    78f87e970bd5 staging: xilinx-tsn: Fix axienet_tsn ioctl
    03dea74d4542 dt-bindings: mailbox: zynqmp_ipi: convert to yaml (sync with upstream v5)
    f2ba685e03a8 staging: xilinx_tsn: Correct skb passed in error handling path
    ec5600035771 net: xilinx: Correct skb passed in error handling path
    0784f34cb4c6 Revert "spi: spi-cadence: Fix uninit_use coverity warning"
    877926d2392f xilinx-ams: Fix UBSan Warning
    28e9f1e57866 net: macb: Use device_link framework to specify suspend/resume dependency
    0f00d2f4bd7f fpga: Add ps-pl reset handling through xilinx afi driver
    f96f1a495a59 dt-bindings: fpga: Add property "resets" to xilinx-afi driver
    526d37391236 arm64: xilinx: Add support for vhk158 system controller
    28a080a95635 mtd: spi-nor: For erase size equal to 0 set erase size_shift to 0
    c5d8a348b129 fpga: zynq-fpga: Ensure proper xCAP interface switch
    3d5b816d13ff net: macb: Fix ethtool WOL helper
    2668745ee5e4 mmc: sdhci-of-arasan: Add NULL check for data field
    c0e396f04c42 v4l: xilinx: dprx: Fix dtg enable register update
    b1fd62d3794b crypto: xilinx: Mark zynqmp-aes.c and zynqmp-sha-deprecated.c as deprecated
    a5b0e6bf456d mtd: spi-nor: Fix read/write failures with 16MB flashes connected in dual parallel or stacked mode
    242f0e824254 net: xilinx: Fix TX TS FIFO read sequence
    269ca22b10eb spi: spi-zynq-qspi: Remove multiple instances of clock enable
    39f68769a590 drm: xlnx: pl_disp: Add strict check of video format in dt parsing.
    52946832ebbf ASoC: xilinx: Sync up with upstream version
    7752c80971ab arm64: xilinx: Fix opp-table-cpu
    c22cef7e09f8 dt-bindings: watchdog: xps-timebase: Align filename
    6d3f544a86ec dt-bindings: media: xilinx: xcsi2rxss: Declare fixed value with const
    1d371a0798ff dt-bindings: soc: xilinx: ai-engine: Fix node name example
    705f2010736b driver: soc: xilinx: Update function prototype for xlnx_unregister_event
    9d053bdc8eeb driver: soc: xilinx: Add support of multiple callbacks for same event in event management driver
    9af0d6a3aef9 net: xilinx: Fix indentation in axienet probe
    a78cb33266fb Revert "net: macb: Process tx timestamp only on ptp packets"
    e4fdec05b704 dt-bindings: iio: xilinx-ams: Fix typo in VUSER indices
    4bd43cc02aa8 v4l: xilinx: dma: Fix warnings for UNINIT
    e05c4cebebd8 xilinx: zynqmp: Fix i2c addresses for vck190 SC
    672fdb9349dd xilinx: zynqmp: Fix tps544/u3007 node description
    a22c64f7e98f xilinx: zynqmp: Wire SC dtbs for vpk120/vpk180
    16f0a5eb1b6c arm64: xilinx: Update tps53681 i2c address
    e763d738aa7e tty: serial: uartps: add missing mutex_unlock in cdns_get_id()
    478d52c4d0b9 arm64: xilinx: Use zynqmp prefix for SOM dt overlays
    daecb3e0d436 media: xilinx: Fix typos in Kconfig (RGB2YUV)
    44cbed465da0 dt-bindings: mailbox: zynqmp_ipi: convert to yaml
    d6396ec7cd27 iio: versal-sysmon: fix for_each_child.cocci warnings
    53b3938cebb4 clk: clk-xlnx-clock-wizard-v: fix missing bitfield include
    5a0db4eef82d clk: clk-xlnx-clock-wizard: fix missing bitfield include
    db963525c49d misc: xilinx-ai-engine: Null terminate local event sysfs buffer
    df38209ac2e0 net: xilinx: Move Xilinx TSN to staging
    1b1dd83c8936 net: xilinx: Fix ep ioctl
    b7f48dd8077b net: xilinx: Pass phy interface to of_phy_connect()
    9c72219a9872 net: xilinx: Simplify device reset sequence
    30c5fd86a239 net: xilinx: Add support for dynamic configuration of Layer 2 stream identification
    f6cdac24dec6 net: xilinx: Add barriers to fix bootup, switch cam entry and qci issues
    5c0dd2feed41 net: xilinx: Change TADMA from discrete to continuous
    e01cf3531a6c net: xilinx: EP only data path change
    1cfde22c3c9b dt-bindings: Add EP MCDMA related bindings
    fafc235e861f net: xilinx: TSN endpoint extension support
    c3dd0448af02 dt-bindings: net: Add Xilinx TSN extended endpoint bindings
    733838099e66 net: xilinx: Add check for minimum number of MCDMA Rx queues
    9b2f9e39e564 net: xilinx: Compile time pcp mapping
    6cfc052c38c9 net: xilinx: Add support for enabling preemption
    b196e7042eb9 net: xilinx: Add PTPv2 support
    55db12099986 net: xilinx: TSN queue numbers
    ca5e422780fa net: xilinx: Modify CB and QCI ioctl api
    cc16dae4738c net: xilinx: Change irq name with details
    ff7eeab1c6e6 net: xilinx: Add default cam entries for Management queue
    dcf32da3a96e dt-bindings: xilinx_tsn_switch: Document number of ports
    b57e49066dd4 net: xilinx: Add switch device support
    e64a38334bf2 net: xilinx: Free the reference to ep, when register_netdevice fails
    32a499932fd6 net: xilinx: Access qbv registers only when Qbv is enabled
    d34db2bde51e net: xilinx: Add a separate function to set mac address for ep
    4d00d9cd12c8 net: xilinx: Add TADMA driver support
    e961534b71cd dt-bindings: Add TADMA specific properties
    c8b4f3ed1ce4 net: xilinx: Set default pcp value for egress queue 1
    849e48518df7 net: xilinx: Add support for tag/untag options in switch cam
    f95c2e62ae45 net: xilinx: Enable ipv when qci isn't enabled.
    59321d05ec32 net: xilinx: Change the name of cam add/del function
    d41085e4d0e8 net: xilinx: Add support to read switch CAM entries
    715a9296a86b net: xilinx: Add native vlan support in PL TSN driver
    6d6d74f8916d net: xilinx: Add per vlan HW learning support
    f4d9fdd1ac50 net: xilinx: Add port vlan membership support in PL TSN driver
    8db4cbf63242 net: xilinx: Add switch port state change support
    b83d7b5be013 net: xilinx: Add switch learning support in TSN driver
    756cd193b566 net: xilinx: Fix HW hang issue for accesses to KEY2 and TV1 registers
    69e7a85da261 net: xilinx: Correct register write values for cam read/write
    670a351941c7 arm64: zynqmp: Add dmas, gpu, rtc, watchdogs and opp nodes for SOM
    91cc4e0437ed arm64: zynqmp: Add power domain description for PL
    173f84cf056a drivers: crypto: Return error code if data size is out of bounds
    d872cab1a5dd arm64: versal: Update USB node handle from dwc3 to usb
    405f9ccf0bfd arm64: versal: Add support for sysmon SSIT
    2dc7bdf85d6f arm64: zynqmp: Add pwm-fan node and ttc0 pwm-cells property
    42a075cbb6bd arm64: zynqmp: Add pwm-fan node and fix ttc0 pwm-cells property
    6e9e5a0f2d5c arm64: zynqmp: Comment sata phy setting for zcu102
    e07cf3453cd7 dmaengine: xilinx: frmbuf: Corrected error checking condition in fid_err and fid_out getter functions
    a07d44125257 Revert "net: macb: Use pm_runtime_force_resume/suspend APIs in MDIO helper functions"
    c3cde6f408eb net: macb: Use pm_runtime_force_resume/suspend APIs in MDIO helper functions
    1cd222a36855 net: macb: Add ethtool support to advertise WOL
    58598a61f071 crypto: xilinx: Add upstreamed SHA driver
    3d6b240702c2 firmware: xilinx: Used lower_32_bits and upper_32_bits
    dd70f52891d8 dmaengine: xilinx: ps_pcie: Remove ZynqMP PS-PCIe End Point Driver
    d6c913fa811c sound: soc: xilinx: Correct channel status register value for 48k sampled audio
    41e39b1a26ef misc: xilinx-ai-engine: fix return for overlay use case
    0ad2ae8f6c0e drivers: soc: xilinx: Fix error message on SGI registration failure
    b60de5d6d124 mmc: sdhci-of-arasan: Add delay to reach card stable state
    edf15171fec0 mmc: sdhci-of-arasan: Fix SDx_BASECLK configuration issue
    24341495b907 edac: xilinx: make event manager registration configurable
    17de17c9b0f4 can: xilinx_can: Add Transmitter delay compensation (TDC) feature support
    43179e9939aa misc: xilinx-ai-engine: Fix clock frequency to QoS conversion
    47f94d3224f7 misc: xilinx-ai-engine: Query AIE clock by name ID
    2ed95369da0c staging: uartlite-rs485: Advertise RS485 CAP
    92f922b0df6f staging: uartlite-rs485: Initial commit to add drv
    04e19d32857f drm: xlnx: Update DSI-Tx Kconfig
    b3e238b307c5 drm: xlnx: Move SND_PCM_ELD selection under DRM_XLNX
    3a2e6a1fb998 v4l: xilinx: axis-subsetconv: Add driver for axis subset converter
    9bc63bcff8bc dt: bindings: media: xilinx: Add device tree bindings for subset conv
    b353d2844ba3 dt-bindings: can: xilinx_can: Convert Xilinx CAN binding to YAML
    4e5de7229167 fpga: select FPGA_BRIDGE for 'Xilinx LogiCORE PR Decoupler' helper
    c4948b8ad9cf spi: spi-cadence-quadspi: Fix ospi resume failures
    90ffe730ebb2 drm: xlnx: Update DPTX kconfig setting
    bb6fb1716df2 ASoC: xlnx: Remove unnecessary dependency
    bba128d4554b drm: xlnx: hdmi: Update pixel max rate to support higher resolutions
    e21d0907db59 drm: xlnx: hdmi: Correct DDC write field logic
    6a8608aa702f drm: xlnx: hdmi: Get maximum link rate and number of lanes supported by sink
    6fc52f42b782 misc: xlnx_dpu: Add debugfs interface to export memory and regs
    c1e2986106a4 misc: xlnx_dpu: add helper function to dump all registers
    46c6c5ba9bd8 misc: xlnx_dpu: Add Xilinx DPU IP driver for Vivado tool flow
    dc2bc15bc958 dt-bindings: misc: xlnx_dpu: Add DPUCZDX8G v3.4 documentation
    4bef67f55650 sound: soc: xilinx: Remove using hdmi_codec_driver
    79e7069841de drm: xlnx: dptx: Add audio codec driver support
    825db638de6c dt-bindings: timer: Update pwm-cells value ranges
    81e55b86faac pwm: pwm-cadence: Handle pwm-cells through of_xlate
    26e42e6912cd clk: xilinx: vcu: don't set pll_ref as parent of VCU(enc/dec) clocks
    87421eaa1ac1 net: axienet: Add coding style related fixes
    5b13760a36db net: axienet: Fix missing kernel description warnings
    e4d309d076c7 net: axienet: Fix warnings related to function prototype
    a0adc0ff7488 dt-bindings: remoteproc: Update lockstep/split R5 configuration values
    3427bd54cfc0 media: i2c: ap1302: Update the min values for ap1302 controls
    fb77c972cb37 dt-bindings: xilinx: Fix issues with dprxss dt binding yaml
    a69af5c0b18d media: v4l2-tpg: add support for new pixelformat V4L2_PIX_FMT_YUV444P
    23d3b36c64e0 dmaengine: xilinx: frmbuf: Add support for 3 planar YUV444P 8bpc
    3083b1684e99 dt-bindings: dma: xilinx_frmbuf: Add support for 3 planar YUV444P 8bpc
    060b8d3b18b7 v4l: xilinx: vip: Support for 3 planar YUV444 8bpc format in contiguous memory
    7545fa6a05c3 media: v4l: Support 3 planar YUV444P 8bpc pixel format in contiguous memory
    4f6844b5ac05 mtd: spi-nor: Avoid updating the flash_info struct in dual and stacked modes
    f150364be8ee xlnx: drv: m2m: Fix SPDX license coding style
    695712e4ab06 dma: xlnx: drv: Added failsafe code for mem2mem DMA channels init-deinit
    54235ce1174a misc: xilinx-ai-engine: log additional hardware info
    80c27fa6deb0 Revert "ARM: zynq: Fix nand partitions for zc770-xm011"
    d6e88b17b851 sound: soc: xilinx: Added 44.1k & 48k sample rate support for DP
    d66a9c83720c arm64: xilinx: dts: Move DP audio registers to separate node
    705655d6eabb dt-bindings: display: xlnx: extract zynqmp dpaud setting to separate binding
    ae68eb919a6d arm64: zynqmp: Add PHY description for SGMII on vck190 SC
    bd1756c82909 v4l: xilinx: dprx: Add unplug handler function in work queue
    7c8c8e2308fb net: xilinx: axiethernet: Change the link up sequence from Block lock to Rx status and valid Rx code.
    15917379c285 drm: xlnx: sdi: Add extra check to get the correct timing table index
    ce99647324d6 net: macb: In ZynqMP initialization make SGMII phy configuration optional
    9b4766ad4244 dmaengine: xilinx: frmbuf: Add support for 3 planar YUV444 10bpc
    926d8238dbcc dt-bindings: dma: xilinx_frmbuf: Add support for 3 planar YUV444 10bpc
    0b150b983835 dmaengine: xilinx: Handle IRQ mapping errors
    69e5e44f3793 v4l: xilinx: vip: Support for 3 planar YUV444 10bpc format in contiguous memory
    138ef0d4fc8c media: v4l: Support 3 planar YUV 444 10bpc pixel format in contiguous memory
    d65f44ad3832 drm: xlnx: zynqmp_dpsub: Add 3 planar YUV444 10bpc format in contiguous memory
    c514aca92bc4 misc: xilinx-ai-engine: balance braces
    b4c4774ddb8e misc: xilinx-ai-engine: add dev_gen description
    8ec5d5684754 misc: xilinx-ai-engine: release lock before return
    eb0cb99a3483 firmware: xilinx: fix backward compatibility
    a1cd3af8e4ce v4l: xilinx: hdmirx: Fix incorrect framerate size for pixel repeat cases
    c876b05d40db v4l: xilinx: hdmirx: Fix reference clock based on TMDS clock ratio
    135ca4c80c7b firmware: xilinx: fix build warnings
    c9064bbb7ffc mtd: spi-nor: Enable 4byte opcode for Winbond w25h02jvt flash
    2cd6e9d45640 spi: spi-zynq-qspi: Add spi-mem to driver dependencies
    ea98c7881b06 spi: spi-zynqmp-gqspi: Update driver dependencies
    f2178afb4243 drm: xlnx: pl_disp: Add condition check for VTC bridge
    4e7870b5ab84 spi: spi-zynqmp-gqspi: direct read made word aligned
    b80cebdc0ed8 net: axienet: Handle dma mapping errors in RX datapath
    7ade4f447ef6 net: axienet: Handle dma mapping errors in TX datapath
    066ad7abae5c net: axienet: Fix DMA memory error handling during initialization
    7d97ac9971d5 mtd: tests: Fix eraseblock read speed miscalculation for lower partition sizes
    eda0dc1823fe usb: dwc3: xilinx: Update GPIO access api with sleep
    eed7da1270ca v4l: xilinx: hls: remove from the UAPI header kernel specific __user macro
    7a718138a774 arm64: zynqmp: Fix bias setting for gem1
    1fd46e94c354 usb: gadget: tcm: error handling for each command allocation
    fbf98ca0770f firmware: xilinx: enable feature check for ZU+
    efe5a4f4aeff ASoC: xlnx: Set dai_fmt for hdmi and dp sound cards
    2f3362414dd9 dt-bindings: ptp: xilinx: Add additionalProperties
    bd9b6a376dbf arm64: versal: Add all missing dt files for Xilinx boards
    368185cfe58f arm64: zynqmp: Add all missing dt files for Xilinx boards
    037135b9895f arm64: zynqmp: Add the latest changes for SOM boards
    ec844bf7b325 arm64: xilinx: Fix dtb filename for smk-k26 board
    f1065b4ebe17 arm64: zynqmp: Add support for Xilinx Kria SOM board
    fba24ce97513 arm64: zynqmp: Add support for zcu102-rev1.1 board
    7a2ba32ff760 arm64: zynqmp: Add resets property to sdhci nodes
    34c764177fa4 drm: xlnx: Update dependency for ZynqMP DP driver
    c95791943f5b drm: xlnx: Update dependency for DRM PL display driver
    cb5072053978 iio: adc: versal-sysmon: Add support for events on slave SLRs
    461bae7152a5 iio: adc: versal-sysmon: Add support for secure access
    d03efb559856 firmware: xilinx: Move FIRMWARE_VERSION_MASK to xlnx-zynqmp.h
    3705b71257bd misc: xilinx-ai-engine: disable interrupts for aieml
    3f555f49bb8f misc: xilinx-ai-engine: disable sysfs nodes for aieml
    e4ab40d38385 misc: xilinx-ai-engine: disable rsc mgr for aieml
    1a806b5b928b misc: xilinx-ai-engine: enable aieml device support
    5e6fb34b3752 misc: xilinx-ai-engine: add support for aieml
    ad96a2bd07ee misc: xilinx-ai-engine: issue privilege ops to firmware
    e8f28be84b5a misc: xilinx-ai-engine: remove hard coded row attributes
    0ec5caddc8b6 misc: xilinx-ai-engine: get device properties from device tree
    c0c3eb8c7cf9 misc: xilinx-ai-engine: device struct for tile type
    6ba9f4332cfc misc: xilinx-ai-engine: move mem clear to dev ops
    5842b7f90b65 dt-bindings: soc: xilinx: ai-engine: add aie gen and mem rows
    7e0f7b8f7ee3 v4l: xilinx: hdmirxss: Fix kernel-doc warnings
    2605006097be usb: misc: Fix gcc warnings for usb2244 and usb5744 driver
    6c578833fa44 dt-bindings: misc: tmr-inject: Add device-tree binding for TMR Inject
    dc92d55bef56 dt-bindings: misc: tmr-manager: Add device-tree binding for TMR Manager
    034eb5d1b60a v4l: xilinx: hdmirxss: Correctly disable timers while initializing
    de007cecd82e v4l: xilinx: hdmirxss: Fix DDC writes for 0xFF field mask
    8fd43788c195 v4l: xilinx: hdmirxss: Add v1.2 compatible string
    5bd00778f0b0 dt-bindings: media: xilinx: hdmirxss: Add v1.2 compatible string
    1861622dd1e4 misc: xilinx-ai-engine: Add get partition current freq sysfs entry
    4cf58c20f49f misc: xilinx-ai-engine: Remove get/set frequency IOCTLs
    923876f0770f misc: xilinx-ai-engine: Fix QoS and frequency calculations as defined by PLM
    0614b593b3c5 misc: xilinx-ai-engine: Add frequency scaling kernel APIs
    56da96ee990c misc: xilinx-ai-engine: add device tree overlay support
    c03ab3125c5a usb: dwc3: gadget: Handle pending stream transfer bit
    d9d5a048383c usb: dwc3: gadget: Skip checking Update Transfer status
    3e1f604c6503 usb: dwc3: gadget: Ignore Update Transfer cmd params
    b6569256148d staging: xlnxsync: Added IOCTL to reset the current syncIp slot
    e37e565707eb net: xilinx: Update Kconfig to select XILINX_AXI_EMAC for XILINX_TSN
    0e84c22c350e iio: adc: versal-sysmon: Add macros for delayed work
    e3fc6c476f49 net: macb: Add zynqmp SGMII dynamic configuration support
    113511e23ef2 net: macb: Added ZynqMP-specific initialization
    64ce014d80c5 dt-bindings: net: cdns,macb: added generic PHY and reset mappings for ZynqMP
    def1552d6cdd dt-bindings: net: cdns,macb: Add versal compatible string
    0fc3350df6ed dt-bindings: net: cdns,macb: Convert to json-schema
    f6155e66ae89 misc: xilinx_flex: Prevent exiting with mutex
    6f1a095cf64b phy: xilinx-xhdmiphy: Fix connector linerate setting in FRL mode
    ec6a977891fd phy: xilinx-xhdmiphy: Set connector linerate in HDMI-RX TMDS mode
    306dbffed45b arm64: zynqmp: Add/Update/Sync DTs for xilinx platforms
    daad91b75908 ARM: zynq: Add/Update/Sync DTs for xilinx platforms
    d03a18ccff67 firmware: xilinx: Fix incorrect return val in zynqmp_pm_sec_read_reg()
    b48353264fa7 v4l: xilinx: dprx: Add MMCM configuration for rx_dec_clk for versal systems
    5b8cb21b5a78 fpga: fpga-region: Add missing kernel-doc description
    8818eb2edf92 fpga: region: Update runtime PM handling logic
    dea71a09b1ae spi: spi-xilinx: Updated axi-qspi controller driver
    7b951e80a502 spi: spi-cadence-quadspi: Add support for Stacked mode
    278e7d5bc325 mtd: spi-nor: Update flash properties in flash_info table
    dd6abaabb140 spi: spi-zynqmp-gqspi: Fix erase failure when tx buswidth is 4
    68c3fa48f8ac spi: spi-zynqmp-gqspi: Fix suspend/resume
    8d6055bc5761 spi: spi-zynqmp-gqspi: Fix the zynqmp qspi driver call to get the spi controller devdata
    8f60a252bbfb spi: spi-zynqmp-gqspi: Fix chipselect timeout issue
    4ea88f868810 spi: spi-cadence: Align function name s/cnds/cdns/g
    c13c75fae238 spi: spi-cadence: Fix kernel-doc format for resume/suspend
    9d83a60e1643 mtd: spi-nor: Fix call trace when qspi driver built as module
    152a77792279 mtd: spi-nor: Don't parse 4BAIT via Zynq QSPI
    171dd94e71a7 spi: spi-zynq-qspi: Fixed buffer overflow in zynq_qspi_exec_mem_op
    cff0be4ce1a0 spi: spi-zynq-qspi: Add dual parallal and stacked support
    082f2e7f36ec spi: spi-zynqmp-gqspi: Add dual parallel and stacked mode support in driver
    de718eb5b92f mtd: spi-nor: Add EAR support in spi-nor framework
    0b40dd735104 mtd: spi-nor: Update flash lock/unlock feature
    763a65af97a7 spi: spi-zynq-gqspi: Set appropriate tapdelay values
    d6d25e458b2a dt-bindings: spi: spi-zynqmp-gqspi: Add support for Xilinx Versal QSPI
    b8a6c2c649c3 spi: spi-zynqmp-gqspi: Update driver to support both IO and dma modes
    5ed61ce8f7b8 spi: spi-zynqmp-gqspi: Increase timeout interval during data transfer
    269ddea12dd0 spi: spi-zynqmp-gqspi: Remove txfifo empty check during chip select/deselect
    687db78ba7aa mtd: spi-nor: Add dual parallel and stacked mode support
    2fdf718f2177 spi: spi-cadence: Fix SPI CS gets toggling sporadically
    eeab4a5979d6 mmc: sdhci-of-arasan: Add support for dynamic configuration
    9893d84d2725 gpio: xilinx: Trivial patch
    a72365a7e36c dmaengine: xilinx: dpdma: Fix race condition in vsync IRQ
    a441731d4158 phy: Add driver for GTQUAD BASE for Displayport
    4e0bc8301c79 dt: bindings: phy: Documentation for Xilinx GT QUAD BASE PHY controller for DP
    4007fc1588f2 dt-bindings: dmaengine: zynqmp_dma: Convert zynqmp dma bindings to yaml
    c8491b42517a v4l: xilinx: vip: Fix alignment to match open parenthesis
    bd7b2aebd602 v4l: xilinx: dma: Add support for 3 planar YUV444 8bpc format
    0840b83b29db v4l: xilinx: vip: Add support for 3 planar YUV444 8bpc
    833d75410b86 phy: xilinx-xhdmiphy: initial driver support for xilinx HDMI PHY 2.1 IP
    04817b785bd5 dt: bindings: phy: Documentation for Xilinx HDMI PHY controller
    59d4ce39718a v4l: xilinx: vip: Allow media pipeline enable with single dma start
    9a970134bc62 dt-bindings: media: xilinx: Add xlnx,atomic_streamon documentation
    d1d3441ab060 kbuild: add xilinx-sdirxss.h/xilinx-hls.h/xilinx-v4l2-events.h to no-header-test
    c7613bbc1d26 media: vivid: Fix the check of frame interval index
    0450af706144 drm: xlnx: zynqmp: tpg should use swap_coeffs as csc matrix
    bd7d33345327 drm: xlnx: bridge: check bridge->debugfs_file->status when calling strlen
    3b7f650a538f dt-bindings: dmaengine: xilinx_dma: Add MCMDA channel ID index description
    fcfa4cc3e337 drm: xlnx: hdmi: Add HDMI 2.1 Tx subsystem driver
    beb1bf3fe81a dt-bindings: display: xlnx: Add HDMI 2.1 Tx subsystem documentation
    0e2da67bc3d7 drm: xlnx: drv: initialize vblank for all crtcs
    ca45da8e8975 v4l: xilinx: hdmirx: Add HDMI 2.1 Rx subsystem driver
    2375589bfe84 dt-bindings: media: xilinx: Add HDMI 2.1 Rx subsystem documentation
    22126a5181c7 phy: xilinx: hdmi: Add linerate, nchannels and reset_gt
    fa8675f0f0f2 v4l: xilinx: vip: Add 10-bpp Bayer formats support
    18ac3c208eb3 v4l: xilinx: vip: Fix incorrect media bus format code
    f0c4169fad8b v4l: xilinx: vip: Fix bpl_factor values for Bayer formats
    3ede4e94c1ae v4l2: xilinx: dma: Align width as per underlying DMA prerequisite
    bc8cf38fd388 v4l: xilinx: xcsi2rxss: Fix warnings for NULL_RETURNS
    4cc6c4fd855f v4l: xilinx: csi2rxss: Remove downstream controls
    7f6dd5131ba2 v4l: xilinx: xcsi2rxss: Add support for YUV 420 8bpc
    c012c50f7f4d dt-bindings: media: xilinx: xcsi2rxss: Add YUV420 8b support
    0805a2b63957 phy: Add HDMI PHY configuration options
    fd4bddefa780 drm: fourcc: Mark XV20 and XV15 formats as YUV based
    6faa23b00457 dmaengine: xilinx: dpdma: Add support for cyclic dma mode
    80ec28e9c065 dt-bindings: display: xlnx: mixer: Add example for reserved memory usage
    ddebcbd11402 v4l2: xilinx: vipp: Allow reserving memory and DMA using 64bit addresses
    0c758310e78f dt-bindings: media: xilinx: Add reserved memory usage information
    d50e80fc4308 drm: xlnx: zynqmp: remove layer sub node based on DP DT change
    5e96602bc17e drm: xlnx: bridge: Fix xlnx_bridge_unregister issue
    086d8f24cb2e drm: xlnx: add a new member extra_name for xlnx_bridge structure
    0d22caff843e drm: xlnx: Update DP subsystem with downstream version
    8cf1a1bd165a v4l: xilinx: Driver support for Xilinx AXI4-Stream Broadcaster
    41e7fde6ad9c dt: bindings: media: xilinx: Doc for Xilinx AXI4-Stream Broadcaster driver
    8a2a800d0c9d media: i2c: Add ON Semiconductor AP1302 ISP driver
    5b3d4ad2a9ee media: dt-bindings: media: i2c: Add bindings for AP1302
    179e801586c7 drm: xlnx: zynqmp_dp: Fix UNINIT type warning
    17f31b8a7962 v4l: xilinx: tpg: Fix warnings for CHECKED_RETURN
    c57a34b65a66 v4l: xilinx: tpg: Fix warnings for NULL_RETURNS
    0b42ceaf3e70 media: xilinx: vtc: Fix warning for OVERFLOW_BEFORE_WIDEN
    bcb86daa32cd v4l: xilinx: dma: Fix OVERFLOW_BEFORE_WIDEN warnings
    cd5d041457c1 v4l: xilinx: vip: Fix UNINIT warnings
    d01deb9ea7de v4l: xilinx: vip: Fix CHECKED_RETURN warnings
    d8cbed33130b v4l: xilinx: vip: Fix V4L2_PIX_FMT_XY10 bpl_factor
    80e044376067 drm: xlnx: dptx: Add DisplayPort tx driver
    71f118d4c189 dt-bindings: display: xlnx: Add DisplayPort Tx bindings
    cd6c37bd3136 v4l: xilinx: dma: Remove struct xventity_list
    addaba3cea84 v4l: xilinx: vipp: remove unused variable
    581ea243e5a6 v4l: xilinx: vipp: Perform stream start/stop at pipeline level
    e3253da27eb4 dt-bindings: display: xlnx: mixer: Updated layer max height and width ranges
    eb723f4c547b v4l: xilinx: Driver support for Xilinx DP Rx subsystem
    74b4699d000a dt: bindings: media: xilinx: Documentation for Xilinx DP Rx subsystem
    6171e882d9d5 v4l: xilinx: dma: Add control handler to v4l2 device
    f9e0eb198f9a v4l: xilinx: tpg: Don't read version if HLS IP
    086e4cf98df3 v4l: xilinx: events: Fix the uapi header license
    5c890545ff16 v4l: xilinx: hls: Fix the uapi header license
    44ce7ddc1efc v4l: xilinx: sdi: Fix the uapi header license
    d1c1a9decfba drm: xlnx: fix some typos in the Kconfig help texts
    66ca1836d985 v4l: xilinx: vipp: Remove set streaming on subdev
    19e0d84335c2 v4l: xilinx: vipp: Change xvip_entity_start/stop to take graph entity
    cc20af724483 v4l: xilinx: vipp: remove a loop for graph start / stop
    b1e6f73c9bad v4l: xilinx: vipp: do enabling in the dependency check
    0f51e658352f v4l: xilinx: vipp: use async list for start and stop
    c826de01ae57 v4l: xilinx: vipp: move xvip_entity_start_stop() to xilinx-vipp
    f8a61a3dede7 v4l: xilinx: dma: Prevent divide by zero error
    a634dd1d1878 dt-bindings: display: xlnx: mixer: Add rev 5.0 to compatible string
    e4278d15a90c drm/fb_helper: Enable drm_leak_fbdev_smem by default for zynqmp
    4e65354c36c8 drm: xlnx: scaler: Improve quality by adding more coefficients
    eb678e0c0b60 staging: xlnx_tsmux: Initial version of xlnx mpeg2tsmux driver
    d24ab54b2890 dt-bindings: Add device tree binding for xilinx mpeg2tsmux driver
    611614e795c5 staging: xlnxsync: Add driver for Xilinx Synchronizer
    3528a93f4623 staging: dt-bindings: xlnxsync: Add initial bindings for Xilinx Synchronizer
    cb5447acf7a4 dma: xilinx: Disable low latency capture in file ops open
    880c582ec7ae drm: xlnx: scaler: Add support for ip version 2.2
    8f0919368334 dt-bindings: display: xlnx: Add support for vpss ip version 2.2
    0b2d717fa236 dt-bindings: display: xlnx: dsi: Add command mode support
    a4d28db1565c v4l: xilinx: vip: Use the right media code for 422 16bit formats
    90c77a8c2ca8 v4l: xilinx: vip: Keep NV16 first in vip table
    00c6edfea70b dt-bindings: display: xlnx: mixer: Updated compatible string
    d837d1eb529d v4l: xilinx: vip: Add YUV444 12bit and 16bit formats
    a8589551f6ea v4l: xilinx: vip: Fix stride calculation
    8cb03da32f1c v4l: xilinx: vip: Use correct media bus code for RGB 10bit format
    4436473fb739 v4l: xilinx: vip: Add scaling and padding factor for XY10
    df99faccab5b v4l: xilinx: vip: Add YUV 10bit media bus formats
    885f28d4032a v4l: xilinx: tpg: Use 10bit media bus codes
    51559060f03a drm: xlnx: scaler: Add max width and height properties
    8022e4cb2480 dt-bindings: display: xlnx: Add max width and height as mandatory properties
    bac639091dad drm: xlnx: csc: Add max width and height dt properties
    3367e0581342 dt-bindings: display: xlnx: vpss-csc: Add max width and height properties
    606d53ea1fe5 media: xilinx: tpg: Add support for v8.0
    e2b95f5d51a5 dt-bindings: media: xilinx: tpg: Update for v8.0
    4a29295c34c4 v4l: xilinx: vip: Add 12 and 16 bpc RAW and RGB color formats
    0a4480645cd4 v4l: xilinx: dma: Add s_ctrl ioctl for low latency capture
    f1e71e82edb6 v4l: xilinx: dma: Add control for low latency
    f9c5ec6721f6 media: xilinx: tpg: dt pixel per clock validate.
    0f082e6772f4 dt-bindings: display: xlnx: Add clock framework support to VTC bridge driver
    af1ae82fbd40 drm: xlnx: scaler: Add support for clock framework
    11b806ad0101 dt-bindings: display: xlnx: Add clock framework support to VPSS Scaler bridge driver
    1e96bab15eb0 drm: xlnx: csc: Add clock framework support
    3d0eed7436fd dt-bindings: display: xlnx: Add clock framework support to VPSS CSC bridge driver
    c175ea953bb7 dt-bindings: display: xlnx: Add clock framework support to DSI Tx
    b88babd1c91d documentation: dt: multi-scaler: Add clock framework support
    2b70e190c646 documentation: dt: multi-scaler: Add properties for pixels per clock
    d9b97666b159 media: xilinx: vtc: Dynamically calculate pixel clock
    b11e52694112 media: xilinx: tpg: v4l subdevice controls to set fps
    ae7f7ba22541 dt: bindings: media: xilinx: tpg: Add ppc dt bindings.
    e99dcc745bba media: xilinx: tpg: Add pixel per clock dt support
    428f6296b3a6 dt-bindings: display: xlnx: Add device tree binding for xlnx control drivers
    ac7239d953d1 dt: bindings: media: xilinx: Add clock support to AXI4 Stream switch
    8b3ecd666686 dt-bindings: display: xlnx: mixer: Correct DRM fourcc for BGR8 and RGB8
    904a0c90053c drm: xlnx: crtc: Fix max width and height overflow
    c5a2bd4f6838 documentation: dt: Add bindings documentation for Streaming SCD
    851c86cd843f xilinx: v4l: dma: Stop subdevs in reverse order of starting
    0f6cb0a1fff2 media: ov5640: Don't access ctrl regs when off
    00be32d73c49 media: ov5640: fix get_light_freq on auto
    314c9638db9e drm: xlnx: Select VIDEOMODE_HELPERS when DRM_XLNX_PL_DISP is selected
    9999804d2abb xilinx: v4l: dma: Invoke s_power function of subdevice
    20161568902c xilinx: v4l: vipp: Avoid decrementing refcount of a node twice
    c498433479f4 xilinx: v4l: dma: In case of error xvip_pipeline_start_stop should return gracefully
    9531e42a2e14 dt-bindings: media: xilinx: vpss-csc: Make max width, height mandatory
    c7dae6480b61 dt-bindings: media: xilinx: demosaic: Make max width, height mandatory
    f65cc73f5dec xilinx: v4l: dma: Remove unused function definition
    5479e8305cfa drm: xlnx: scaler: Fix array out of bound access
    e6f21132f2ea documentation: dt: gamma: Add support for max width and height
    617d2d1853bb documentation: dt: demosaic: add support for max width and height
    ad687c9a7b77 v4l: xilinx: tpg: Add check for max width and height
    c403e3c5337a documentation: dt: vtpg: Add support for max width and height
    830376b156b6 drm: fb: Modify check to ensure correctness of flags
    54b60352b8d2 v4l: dma: Use media graph traversal to stream on/off subdevs
    6ab898352908 xilinx: v4l: mem2mem: Initial version of driver
    8b6f13ecf814 dt: bindings: media: xilinx: Documentation for mem2mem driver
    ace3ac8f7633 platform: xilinx: Add mem to mem Multi-Scaler driver (XM2MSC)
    aca8ec5e3d91 documentation: dt: add bindings documentation for multi-scaler
    b20b33f83d24 v4l: xilinx: scd: New Scene Change Detection driver
    0de84861640e documentation: dt: add bindings documentation for Scene Change Detection
    2d245ca7bc74 v4l: xilinx: scd: Add v4l2 custom events
    4540144b1bc2 xilinx: v4l: dma: Add format enumeration for output
    75bc5fa3b3ba xilinx: v4l: dma: Add DMA input direction support
    ebc4922f7ed5 xilinx: v4l: dma: Add ioctl operations for v4l2 output device
    08d3efbce73c media: platform: xilinx: Fix Kconfig indentation
    60e697a8dd6a v4l: xilinx: Driver support for Xilinx AXI4-Stream Switch
    8aac14ad768a dt: bindings: media: xilinx: Doc for Xilinx AXI4-Stream Switch driver
    63f5089e6a9a xilinx: v4l: dma: Fix bug in calculating interlaced height
    2e7170f9c713 xilinx: v4l: dma: Multi-threading issue
    83f3d5415616 dt-bindings: display: xlnx: Add VTC bridge support to PL display
    0d552ab71605 dt-bindings: display: xlnx: mixer: Adding xlnx vtc bridge support
    87004f631d5e drm: xlnx: Add a Video Timing Controller(VTC) driver
    1ce4926d9c84 dt-bindings: display: xlnx: Add VTC bindings
    aae8abafd515 dt-bindings: display: xlnx: mixer: Adding xlnx,layer-primary property
    f6ac99e88cdd dt-bindings: display: xlnx: mixer: Added xlnx,num-layers description
    031f9d0386df xilinx: v4l2: dma: Add multiple output support
    836aec067b8e v4l: xilinx: dma: Terminate DMA when media pipeline fails to start
    26ef589dbead v4l: xilinx: dma: Add interlaced support
    a149b7e81dd8 dt-bindings: display: xlnx: mixer: Update example to fix format strings
    7234ac339d92 dt-bindings: display: xlnx: mixer: Add supported formats table
    64ef5e96bfa0 bindings: display: xlnx: Fixing device tree documentation
    39ee292e24e0 xilinx: v4l2: dma: Bug fix in single plane support
    78b57a065de3 drm: xlnx: csc: Adding vpss-csc reset through gpio
    11c2e3ceb1e4 dt: bindings: display: xlnx: Adding gpio reset entry
    e374132fffb1 drm: xlnx: scaler: Updating vpss-scaler reset logic
    ef913ad00042 dt: bindings: display: xlnx: Updated gpio reset entry
    983e915eeeba uvcvideo: Prevent new URBs being processed at stream stop
    faf20c843171 v4l: xilinx: dma: Add XV15 and XV20 contiguous format support
    94e4a9511c43 dt: bindings: media: xilinx: Remove unimplemented TPG compatible string
    644a64a0aaba media: xilinx: vip: Correct the fourcc code for BGRX8 format.
    d73866d33266 v4l: xilinx: Add BGR color format support.
    fa9844a42fac v4l: xilinx: dma: Fix bytes per line calculation
    dd05b106aa1a v4l: xilinx: dma: Handle 10 bit format calucations for XV20
    fabbb4ce3f4a v4l: xilinx: dma: Fix sizeimage calculation
    679cf6856067 v4l: xilinx-tpg: Add YUV 420 media bus format support to TPG driver
    5b1095d0160c dt-bindings: display: xlnx: Modifing mixer compatible string
    9b03240732b4 Documentation: media: Correct dt-bindings doc for Gamma LUT IP
    5b041869d6db drm: xlnx: csc: Add YUV420 support
    54a3e85f37f7 drm: xlnx: scaler: Add YUV420 support
    27fb40a29f8f v4l: xilinx: dma: Get scaling and padding factor to calculate DMA params
    8b5b33a63243 v4l: xilinx: dma: Add scaling and padding factor functions
    3e780411b9f8 v4l: xilinx: dma: Fix v4l2 enumeration callback for multiplanar
    6c61ff095253 v4l: xilinx: dma: Add multi-planar support
    8423ae631e59 v4l: xilinx: dma: Update video format descriptor
    114fa8fdcf64 media: Add new dt-bindings/vf_codes for supported formats
    216979ce2780 drm: xlnx: correcting data type for cursor with and height
    5b9cb5c7c21a drm: xlnx: scaler: Adding Zero out H-phase array before changing resolution
    36ad3b0ddbb0 drm: xlnx: scaler: Adding vpss-scaler reset through gpio
    f5fbd48f0c02 dt: bindings: display: xlnx: Adding gpio reset entry
    7c3899f2d764 dt-bindings: display: xlnx: Added vpss bridge phandle as optional property
    a3e5442f1a4c drm: xlnx: scaler: Adding vpss-scaler driver
    dc2bb7e677c2 dt: bindings: display: xlnx: Adding scaler bindings
    d566157b7f61 drm: xlnx: csc: Adding vpss-color space converter driver
    669743baaa28 dt: bindings: display: xlnx: Adding csc bindings
    2eeac6f3bc4a drm: xlnx: DRM KMS driver for xilinx display pipeline
    7282da5fc11e dt-bindings: display: xlnx: Adding pl_disp bindings
    ded87739e4a6 dma: xilinx: Support early callback modes
    ed20f485abf4 dt-bindings: dma: xilinx_frmbuf: Add support for 12 and 16 bpc RGB formats
    fe0c5876ddfa drm: xlnx: sdi: Adding sdi-tx driver
    59331f75ade1 dt-bindings: display: xlnx: Adding sdi bindings
    1f7bd8f88a2c drm: Add generic HDR support
    db3d1e6388d2 drm: xlnx: mixer: Initial video mixer driver
    5aa61ca5a317 dt-bindings: display: xlnx: Adding mixer bindings
    5cddd027d4a2 drm: xlnx: adding cursor width / height support
    2ec09ed7b544 drm: xlnx: dsi: Adding dsi driver to new framework
    203f1f139013 dt-bindings: display: xlnx: Adding dsi bindings
    6fef36764852 drm: xlnx: drv: Add Xilinx bridge support
    4191aa2a489b dt-bindings: display: xlnx: Add bridge bindings
    afc2bf8bc47a dt-bindings: display: xlnx: Add ZynqMP DP subsystem bindings
    75528c891441 drm: xlnx: Xilinx DRM KMS driver
    6f64f5daa195 drm: mipi: Bring DT format description closer to the hardware
    4028319017c2 drivers: media: Customized adv7511 for Xylon LogiCVC (deprecated)
    cabaf56261b1 v4l: xilinx-vpss-csc: driver support for xilinx vpss csc
    720786e57a6d Documentation: DT: Add bindings documentation for VPSS CSC
    4b9736224363 v4l: xilinx-gamma: initial driver support for xilinx video gamma lut ip
    5feda25eef30 documentation: dt: add bindings documentation for gamma lut ip
    d92112b1c8fc v4l: xilinx: Driver support for Xilinx UHDSDI Rx subsystem
    514ed574f676 dt: bindings: media: xilinx: Documentation for Xilinx UHDSDI Rx driver
    d5a7e729b237 media: videodev2.h: Add control type for HDR
    e99af9a1767a media: videodev2.h: add Hybrid Log Gamma transfer function define
    6c246df955f6 media: v4l2-ioctl: Add description for new pixel formats
    a72054ceebc8 media: v4l2-ioctl: Add YUV444 12bit and 16bit pixel formats
    259c230e0692 media: v4l2-ioctl: Use correct fourcc for YUV444 10bit format
    8a0edc45660c media: v4l2-ioctl: Add YUV 12bit and 16bit pixel formats
    abfca3d5ebdc media: v4l2-ioctl: Add 12 and 16 bpc RGB pixel formats
    1c2ee33623d8 v4l2-core: Update entries for XV15 and XV20 contiguous formats
    33f25ae1164b media: v4l2-core: Update V4L2 framework with new fourcc codes
    a7844d4bfa9d media: v4l: Add HDR support through compound controls
    a4497afab37e v4l: xilinx-vpss-scaler: driver support for xilinx vpss scaler
    c39d60c10381 documentation: dt: add bindings documentation for vpss scaler
    3a6b1f09750e v4l: xilinx-demosaic: driver support for xilinx video demosaic
    c449fbef2ce6 documentation: dt: add bindings documentation for xilinx video demosaic driver
    5d2c4bedf257 media: v4l: Group Xilinx downstream formats
    16bbc28f18cd media: xilinx: Improve pipeline management code
    fc302edc3b55 v4l: xilinx: dma: Remove colorspace check in xvip_dma_verify_format
    75e8d051225f media: xilinx: dma: Enable use of Framebuffer Write IP in V4L2 Driver
    778a7cec25a3 v4l: xilinx: dma: Terminate DMA when stream on fails
    bf3befd2fbb5 media: xilinx: vip: Add the pixel format for RGB24
    c74caf48a29e media: xilinx: Refactor VTC configuration code
    90a4e4e7520f media: xilinx: tpg: Block comments
    30912a79b459 media: xilinx: Integrate TPG v7 support
    8bf9838d2dd5 media: xilinx: Add HLS core driver
    d5c378db45c1 media: xilinx: Add AXI4 stream switch driver
    2fd1eb015d23 media: xilinx: Add Scaler driver (SCALER) driver
    fdc231d362b1 media: xilinx: Add RGB to YUV (RGB2YUV) driver
    27865b58b582 media: xilinx: Add Chroma Resampler (CRESAMPLE) driver
    4c45d2c5b5ed media: xilinx: Add Color Filter Array (CFA) driver
    19589acaf508 v4l: xilinx: Add Video Remapper driver
    7c1a953f7216 media: xilinx: Ensure Video Framebuffer selected by Kconfig
    03bb70654f7e v4l: xilinx: Kconfig: Add missing DMADEVICES dependencies
    dad73e6e1863 uvcvideo: Xilinx: Bump up URBS and MAX_PACKETS
    2935916b025d v4l: Add VUY8 24 bits bus format
    9241e01b5c8e v4l: Add RGB 8:8:8 media bus format on 24 and 32 bit busses
    7b89e9aa32fd v4l: subdev: Add [GS]_ROUTING subdev ioctls and operations
    ac925a4ab952 media: entity: Add media_entity_has_route() function
    3d7dde73acb3 media: entity: Add has_route entity operation
    df27aebce90a drm: panel: Added timing for AUO B101UAN01 display panel
    dddebcaa8e18 dmaengine: xilinx_frmbuf: New driver for Video Framebuffer IP
    dea4b0a56259 dt-bindings: dmaengine: xilinx_frmbuf: Video Framebuffer IP
    4eec2efb1897 media: Add documentation for YUV420 bus format
    f31d1c712869 uapi: media: New fourcc codes needed by Xilinx Video IP
    6fb13b23cf69 drm: Add new flags for interlaced alternate fields
    72a08259513b uapi: drm: Add AVUY fourcc
    6513e66d489e drm: drm_fourcc: Correct the DRM YUV444 10bpc
    c36f34ba9654 drm: fourcc: Add new formats needed by Xilinx IP
    63be6dcd943a drm: drm_fourcc: Add new formats for Xilinx IPs
    ad208ed1fdc0 drm: fourcc: Add drm_format_plane_width_bytes()
    ffa3db2ad6c6 drm: drm_fourcc: Introduce macro-pixel info to drm_format_info
    cfcbe4608067 ASoC: xlnx: change I2S driver data
    42df385bd328 ASoC: xlnx,i2s: dt-bindings: add reference to audio formatter
    60cb2ecbc1a7 ASoC: xlnx: add SPDIF audio driver
    d9ba35accd91 dt-bindings: ASoC: xlnx,spdif: Document spdif bindings
    874d5549a5d9 ASoC: xlnx: add PL sound card support
    3e7f02fc3ca0 ASoC: xlnx: add pcm formatter platform driver
    abaef462fc0d dt-bindings: ASoC: Document audio formatter bindings for xlnx,audio-formatter
    093f04343e7f AsoC: xlnx: add platform driver to support SDI audio
    e5b07fec102e dt-bindings: ASoC: xlnx-v-uhdsdi-audio: document sdi audio bindings
    f97adf628974 sound: soc: xilinx: Add ZynqMP DP subsystem audio drivers
    15795e91c086 dt: bindings: sound: Add DT bindings for Xilinx ZynqMP DP audio
    cdb97cc4ae6c remoteproc: Add initial zynqmp R5 remoteproc driver
    e524a9d46d79 dt-bindings: remoteproc: Add documentation for ZynqMP R5 rproc bindings
    6827009a5271 remoteproc: Add support for AMP on Zynq platform
    bc34d17afb7a dt-bindings: Add Zynq remoteproc binding
    8687d8d5a485 remoteproc: Add support for peek from remote and acking kick from remote
    66d2e77fb51a nvmem: Add driver for BBRAM and volatile user keys access
    3d76b0ceb819 dt-bindings: nvmem: Added nodes for BBRAM and volatile user keys
    f8f39ce69a1a iio: adc: versal-sysmon: Add runtime resume function for sysmon
    8f1f7f5038a6 drivers: iio: Add support for TI INA260 power monitors
    bd7eb16df078 dt-bindings: iio: adc: Add ti,ina260.yaml
    6dbc2bee04b8 dt-bindings: gpio: zynq: Add all the supported compatibles
    695532b44955 iio: versal-sysmon: add driver for Versal Sysmon
    9f99547626c4 dt-bindings: iio: xilinx: Add Documentation for Sysmon
    15030b4c9b32 iio: adc: Add Xilinx AMS driver
    022b9fd755c5 dt-bindings: Add Xilinx AMS binding documentation
    bd749016e1f5 usb: misc: usb2244: add support for USB2 ultra fast sd controller
    c8ec20c8360a dt-bindings: usb: misc: Add binding for Microchip usb2244 Controller
    faf7df2c8275 usb: misc: usb5744: add support for USB hub controller
    3ea5ca73e6be dt-bindings: usb: misc: Add binding for Microchip usb5744 hub
    6bb5f952c61b arm: zynq: don't remove -march=armv6k from KBUILD_AFLAGS
    244d268406c4 arm: zynq: add "-march=armv7-a" to AFLAGS
    ad5e41b44a7b firmware: zynqmp: Add sysfs entry for runtime features
    898e178c8a86 mtd: cfi: Add macro for Winbond NOR flashes
    5eb77738623f dt-bindings: zynqmp: Add new PD_PL macro
    715d52270edd dt-bindings: zynqmp: add RPU nodes
    74c05b85a1c4 arm64: zynqmp: Add support for ZynqMP RSA H/W accelerator
    30bc5ecb4468 arm64: zynqmp: Add Xilinx SHA3 node
    2edd2f165e7e dt-bindings: clock: versal: Remove alt_ref_clk from clock source
    8314c58ba4c8 dt-bindings: clk: xlnx: Update VCU bindings for vcu reset pin
    e1b58b6198e3 dt-bindings: clk: xlnx: move xlnx_vcu dt-binding to clk from soc
    563938754341 dt-bindings: serial: uartlite: Convert uartlite to json-schema
    573f76dc41d2 watchdog: of_xilinx_wdt: use wdd->parent in print
    137d5dd7ca42 clk: xilinx: vcu: Populate children node
    3437961c2439 clk: xilinx: vcu: disable aclk incase of probe failure
    74630c85a24c clk: xilinx: vcu: Update vcu init/reset sequence
    d4fe6e0432ee soc: xilinx: vcu: Export functions to obtain logicore settings
    fd03e132faf2 firmware: zynqmp: Add Node IDs in xlnx-zynqmp.h
    790ec5f70d6e firmware: xilinx: sync firmware pm_query_id entries with PLM query id entries
    ef9c14fad2b7 firmware: xilinx: Remove kernel-doc marking instead of regular comment
    8773b15933b5 uartlite: Update the default for the parameter
    db8bd3e0289e include: xilinx_phy: Add Copyright and License
    ab2ba922aef1 clk: si5324: fix linking failure for ARCH arm
    b2a7967314da crypto: xilinx: Drop COMPILE_TEST for CRYPTO_DEV_ZYNQMP_SHA3
    2838a3306ee2 ptp: Add support for port offset registers
    1dffefd4faec dt-bindings: ptp: xilinx: Update new compatible string
    a6c55514423f crypto: xilinx: zynqmp-aes: Add skcipher based AES driver
    6632285e9bf4 pmbus: tps544: adapt for updated pmbus interfaces
    ef0b84a82013 irqchip: gic: Add changes to handle SGI for Zynq Remoteproc driver
    9b526f096deb uio: Add the UIO driver for AI engine
    498135f770b8 dt-bindings: soc: xilinx: Add the dt binding for AI engine
    18b0794a5305 arm: zynq: delete AFLAGS_suspend.o to fix compile warning
    5e53cd34e124 dmaengine: pl330: Typecast with enum to fix the coverity warning
    39c3a41a659e i2c-cadence: Replace the value with enum
    b89fbc73d901 dt-bindings: serial: Add xilinx compatible
    a29d66f74209 ptp: Add Xilinx PTP timer driver
    35cd73b65e66 dt-bindings: Add devicetree documentation for Xilinx PTP timer
    37ec7efc7786 edac: xilinx: Added EDAC support for Xilinx DDR controller
    3c9b7a38fc80 dt-bindings: edac: Add bindings for Xilinx Versal EDAC for DDRMC
    1679d1d91d9d spi: spi-cadence: Fix uninit_use coverity warning
    cb329a401995 spi: spi-cadence: Fix mixed_enum_type coverity warning
    12c571f4d5c9 ARM: zynq: Fix spurious BUG with old DT
    97048676f036 misc: ai-engine: Move AI engine reg access to kernel
    c6bb0200b3f0 dt-bindings: soc: xilinx: ai-engine-npi: Add the binding for AIE NPI
    3e79e35a50f3 dt-binding: soc: xilinx: ai-engine: Add new AI engine binding
    32a5fc5f2326 dt-bindings: usb: host: ehci-xilinx: Add binding doc
    138b442b19fa clocking-wizard: Add versal clocking wizard support
    20d514f89cef dt-bindings: Add versal clocking wizard
    ecf71cc12055 clk: idt: Fix i2cwritebulk() failure
    3b7981675a98 dt-bindings: xilinx: Document new evaluation boards
    e48726847ef1 mtd: fixing CFI for Numonyx CFI bug
    da5081880882 misc: jesd204b: Add driver for Xilinx jesd204b
    05de1d200b3e dt-bindings: misc: Add bindings for JESD phy
    bd0c5c0c3725 dt-bindings: misc: Add documentation for jesd204b
    a6b600bc0a6d PCI: ZYNQMP EP client driver: Adding support for ZynqMP dma test client
    6dfb4afc5148 PCI: ZYNQMP EP driver: Adding support for ZynqMP ep driver
    61cc13a94e8b dt-bindings: pci: ZYNQMP PS PCIe Driver Root DMA dt bindings
    72064421def3 dt-bindings: power: Add versal power domain bindings
    8e1adae19ac5 mtd: Expand the ecc placement locations to 1260
    fa3c594bbe0a staging: xroetrafficgen: initial commit of roe traffic generator driver
    094b761f42fe staging: Add xroeframer driver
    a76ad50413c8 xilinx: Update MAINTAINERS fragment
    11dc089529ad samples: xilinx_apm: Add sample application for xilinx_apm
    c235d0d7d400 drivers: ata: Add CCI support for SATA if CCI is enabled
    d0e346544ace arm64: zynqmp: Change Kconfig dependency for cortexa53 edac
    8b4971dde69b edac: Add sysfs entries for cortex arm64
    578fb5936ef3 edac: Add documentation for cortexa53 edac sysfs
    6d5b80c86d6d EDAC: Add ARM64 EDAC
    d46c704562ad dt-bindings: edac: Add bindings for cortex_arm64
    b2da5fe7a96f edac: zynqmp: Add EDAC support for ZynqMP OCM Controller
    c97e2248909f dt-bindings: edac: Add bindings for ZynqMP OCM Controller
    59e1a7ac9fc4 edac: add support for ARM PL310 L2 cache parity
    d54641a737ac clk: Adding Silicon labs si5324 clock driver
    906b7c441f4b dt-bindings: clock: Adding si5324 bindings
    7e629d216c76 phy: mscc: Add support for VSC8531_02 with RGMII tuning
    b2ac0d9aafa6 dt-bindings: mscc: Add RGMII RX and TX delay tuning
    bd9ffe83f89c include: dt-bindings: Add mscc-vsc8531 RGMII clock delay definitions
    bf5b6559726c phy: dp83867: Add support for SGMII
    5469fa63a1cf crypto: zynqmp-rsa: Adopted RSA support for ZynqMP SoC
    00bc7c7e446f dt-bindings: crypto: Added binding docs for Xilinx ZynqMP RSA H/W accelerator
    61c5350201df crypto: zynqmp-sha: Adopted SHA3 support for ZynqMP Soc
    06f16e5ce077 dt-bindings: crypto: Added binding docs for Xilinx ZynqMP SHA3 H/W accelerator
    c93ad459fc73 pmbus: Add new tps544 power regulator driver
    929fa01900e7 dt-bindings: pmbus: Add tps544 bindings
    6b145ba8d836 zynqmp: firmware: Adds a driver for loading secure partition from Linux
    56efa970dde8 clk: Add ccf driver for IDT 8T49N24x UFT
    e2bba31bb85e dt-bindings: Add binding for IDT 8T49N24x UFT
    8fc9ad358ed2 i2c: mux: pca954x: write to mux channel always
    589c85a3194a watchdog: of_xilinx_wdt: Used dev_dbg()
    e4b83ec42fce irqchip: gic: Add remoteproc changes to the driver
    816f461a9911 staging: fclk: Enable pl clock with sysfs entry for set_rate
    a6358dc644e0 dt-bindings: Add doc for xilinx fclk
    498be8e1221e Xilinx: ARM: Devcfg and SLCR drivers updated to support reconfiguration.
    a54bb969e15c zynq: Add OCM driver
    208e432a6f88 zynq: slcr: Introduce new get_ocm_config()
    b519a7db2fc6 ARM: zynq: Fix prefetch option
    0c6eccf65023 ARM: zynq: Add support for Zynq-7000S devices
    8f438ef28249 dt-bindings: ARM: zynq: Add DT binding for eFuse controller
    51d65b77bcbe uio: rename uio.c -> uio_core.c & unify into uio.ko
    487148436435 apf: Add kernel modules to the kernel
    ffb9cd00a176 uio: Add dma-buf import ioctls
    f9e5a580c252 Bluetooth: hci_ll: Extend timeout between start and communication
    fee7722dd68d dt-bindings: usb: dwc3-xilinx: Convert USB DWC3 bindings
    dd46eb837657 dt-bindings: usb: dwc3: Add interrupt-names to include hibernation interrupt
    58ba5afcc621 usb: dwc3: gadget: Increase timeout for CmdAct cleared by device controller
    f92c8e05d481 usb: dwc3: gadget: disable hibernation interrupt on gadget enumeration
    bfc87833e9ae usb: dwc3: core: add PM_SLEEP kernel config check
    d463a2e39c1b usb: dwc3: core: Update REFCLK_FLADJ for frame length adjustment
    668832665601 usb: dwc3: xilinx: fix reset-gpio logic
    b7b98952b203 usb: dwc3: xilinx: fix error handling for reset-gpio
    937719183006 usb: xhci-plat: Add remote wakeup support for xilinx
    d30b7a25b95d usb: dwc3: Added remote wake-up in xilinx glue driver
    ab7a77c9778f usb: dwc3: Fixed common regulator for multiple controller instance
    3032fb9b5957 usb: chipidea: udc: make controller hardware endpoint primed
    50485109b073 usb: dwc3: handle usb2.0 gadget mode early hibernation event occurrence
    8f4f309624cd Revert "usb: function: f_tcm: Add support for getting alt interface number"
    d26f8fd4361f usb: dwc3: core: scratchpad buffers allocation handling in host mode
    7eab45e8ca50 usb: dwc3: xilinx: enable D3 power state entry feature
    1d54ec88f001 usb: dwc3: xilinx: Handle USB3 PHY initialization properly
    20d159d68fc9 usb: gadget: webcam: Add support for Full HD and 4K UHD Raw Video Formats
    00ace4683b16 usb: dwc3: Fix OTG driver to work with v5.10 kernel
    0de5df674dc7 usb: dwc3: gadget: Add new platform_data.h file
    81a5bf2483f2 usb: dwc3: xilinx: Handle dr_mode setting from DT properly
    f29f51de38f6 usb: chipidea: udc: Add xilinx revision support
    9219b23554f0 usb: dwc3: xilinx: fixed dwc3-xilinx driver warnings
    e16d48b334e0 usb: dwc3: xilinx: Add support for controller power state for host mode
    16d154bb59a7 usb: dwc3: xilinx: Register drvdata before registering regulator
    0e90a3c04846 usb: dwc3: xilinx: Add gpio-reset support
    46974cdb261f gpio: modepin: Add driver support for modepin GPIO controller
    b2a892a1d24c dt-bindings: gpio: zynqmp: Add binding documentation for modepin
    ba31e16df9fa usb: dwc3: Enable Xilinx platform only when Regulator is enabled
    9f6849b772d1 usb: dwc3: Implement stream transfer timeout
    5ee4927cd6fc usb: dwc3: use PROPERTY_ENTRY_BOOL to initialize property entries
    8d4df820b3e7 usb: dwc3: otg: Enable OTG support in dwc3-core driver
    3f9ac176ce18 usb: dwc3: Initialized variable with a proper value
    77f35fc999e4 usb: dwc3: use proper typecast to handle overflow
    f22c9636abba usb: dwc3: otg: remove otg static export warning
    2435bffeed0c usb: dwc3: otg: fix the function call used to get otg descriptor
    4a06a60c0a37 usb: dwc3: retain resource index for unforced stops
    31f76632a97b usb: dwc3: otg: add support for OTG in DWC3 host driver
    35a686a3c83b usb: dwc3: otg: Update Kconfig and Makefile for enabling OTG
    c61293294f26 usb: dwc3: gadget: Don't kick transfer if LST or SHORT bits are set
    13503abd4a01 usb: dwc3: Check for IOC/LST bit in both event->status and TRB->ctrl fields
    f672b02981a6 usb: dwc3: otg: fix broken OTG HNP feature
    5189066ee4c7 usb: dwc3: gadget: ISOC transfers should be stopped before starting a transfer
    381d55eea4a6 usb: dwc3: Correct usb dma mask for making SMMU work in device mode
    3975f8c8e21b usb: dwc3: Fix the broken suspend/resume functionality in dwc3
    a43c65c2a29c usb: dwc3: add support for enabling/disabling hibernation dynamically
    8ddea1d10c01 usb: dwc3: Fix the logic for allocating and setting scratchpad buffers
    144b0ff35ba8 usb: dwc3: don't setup event buffers when operating in host mode
    205f9ea16a66 usb: dwc3: update GFLADJ_REFCLK_FLADJ in dwc3_frame_length_adjustment
    6db9232e5118 usb: dwc3: of-simple: Enable CCI support in dwc3 driver
    d2ee5e149722 usb: Add quirk for enabling workaround for BULK IN streams
    b0592d53221a dwc3: core: Enable GUCTL1 chicken bit 9 for correcting Inter Packet Delay(IPD)
    acf131c85b51 dwc3: core: Enable GUCTL1 chicken bit 10 for fixing crc error after resume bug
    b2a364a4bf45 usb: dwc3: hibernation: fix scratch buffer allocation
    b01dd000b938 usb: dwc3: gadget: add support for OTG in gadget framework
    10ba9c763857 usb: dwc3: core: Add regulator calls for communicating with dwc3 PMU
    8451958e6379 usb: dwc3: gadget: Add hibernation support when operating in gadget mode
    5ce6f7528014 usb: chipidea: core: Add return value function check
    18f365f1633b usb: chipidea: Fix return value handling
    f7871d99bc4b usb: gadget: udc: Add return value error handling of function
    98f55b17d9e1 usb: gadget: udc: Remove useless variable assignment in xudc_read_fifo()
    478fd97b5676 usb: chipidea: Check usb_phy exists before using it
    2ee3a4c83b19 usb: chipidea: Use usb2 phy for Zynq platform
    3de559f7cbc6 usb: chipidea: Add support for VBUS control with PHY
    2b618786bffc usb: gadget: send usb_gadget as an argument in get_config_params
    8823f2f119a0 usb: host: xhci: Add xhci_hcd to xhci_ring for use in stream_timeout_function
    01e6212d8f12 usb: xhci: wait for atleast 1ms after exiting U3
    ae44b2658f57 usb: gadget: uvc_video: unlock before submitting a request to ep
    16555a5e1906 usb: xhci-plat: Add remote wakeup support
    77ca2aa40160 usb: function: f_tcm: Add support for getting alt interface number
    1072bb0852a6 usb: gadget: f_tcm: support to set maxburst through configfs
    2edc01f2c118 usb: gadget: f_tcm: add TARGET_SCF_ACK_KREF flag in BOT
    60887fd6a74e usb: gadget: f_tcm: queue multiple commands request
    04b1e97e2acd usb: gadget: f_tcm: comp_descriptor workaround during SS gadget
    a6c2895e422e usb: gadget: f_tcm: adjust write length with max packet size
    14d1ebba040e uas: Add US_FL_NO_ATA_1X for linux tcm_usb_gadget
    25a5856b0ce4 usb: uas: Add workaround for DATA IN urb's returned with status -EAGAIN
    6dcc7bcebeaa usb: xhci: Add workaround for fixing ep stream ring hang issue
    568ea45b97c7 usb: host: xhci: add support for Light Reset for DWC3 DRD
    f6e88ee5deda usb: host: xhci: plat: add support for otg_set_host() call
    e8944820830b usb: host: ehci-xilinx: Resolve kernel-doc Warnings
    92caef416da6 usb: host: ehci-xilinx: modified driver to resolve formatting warnings
    be8603e95882 usb: gadget: udc: udc-xilinx: Add identifier to read_fn function arg
    daed788b5bf2 usb: phy: Add platform driver support for ULPI phys
    a91aeb4ceef3 usb: xilinx: Add suspend resume support
    87337cf8fb5a usb: gadget: udc-xilinx: Add clock support
    6c59c4128bc3 dt-bindings: udc-xilinx: Fix coding style in binding doc
    e076ad0c9395 dt-bindings: usb: Add clock support for udc-xilinx
    8148c58e423b irqchip: xilinx: Add support to remove the Xilinx INTC driver module
    e90c010bc359 irqchip: xilinx: Add support to remove Xilinx INTC irqchip driver module
    6ed255a3b26e irqchip: xilinx: Avoid __init macro usage for xilinx_intc_of_init
    057bc8fc1e58 irqchip: xilinx: Change level for cpu-id warning
    eace9259fa8d irqchip: xilinx: Add support for Microblaze SMP
    76480a327eef irqchip: xilinx: Add support for cpu hotplug
    6ea2229eacc2 irqchip: xilinx: Rename root_domain just to domain
    26f37d376b24 irqchip: xilinx: Support only LE/BE irqc by the same driver
    bf483280aa06 irqchip: xilinx: Add support for sw interrupts
    fd33fc3cd1ea irqchip: xilinx: Move early initialization to own function
    dc3513cf5a04 irqchip: xilinx: Use handle_domain_irq()
    1cdfe0515c3f irqchip: xilinx: Enable generic irq multi handler
    6dfe2d306fe9 irqchip: xilinx: Make per cpu primary controller entries
    a9cfc203b65c dt-bindings: irqchip: Add Xilinx Interrupt Controller bindings
    8b8c06c3eb5e PCI: XDMA PL PCIe: Adding XDMA PL PCIe Root Port
    0ce6d855720e PCI: XDMA PL PCIe: Adding device tree binding for XDMA PL PCIe
    5358cf51ff8e PCI: xilinx-nwl: Fix coding style violations
    c2505045ad79 serial: uartps: Fix stuck ISR if RX disabled with non-empty FIFO
    407eb64f5a6c serial: uartps: Prevent writes when the controller is disabled
    93d2b712a1d4 serial: uartps: Fix the ignore_status
    d00ec6bd2474 serial: uartps: Change uart ID port allocation
    5c827ba7d579 tty: xilinx_uartps: Make the timeout unsigned
    5128a1a9b06c tty: xilinx_uartps: Check clk_enable return type
    9a944d174a8a tty: xilinx_uartps: Add check for runtime_get_sync calls
    eec024c5e028 tty: xilinx_uartps: Check the clk_enable return value
    a97613c34b50 xilinx: Update copyright text to correct format
    3179288230f3 clk: zynqmp: Fix stack-out-of-bounds in strncpy`
    596fc12f05c8 clk: zynqmp: make bestdiv unsigned
    b9ce42d420ee clk: zynqmp: Add a check for NULL pointer
    8d9441bf0e46 can: xilinx_can: Remove repeated work the from kernel-doc
    30ffdc2b2f33 can: xilinx_can: Add check for NAPI Poll function
    498cbf79edd1 pinctrl: zynq: use module_platform_driver to simplify the code
    66399a3170cf serial: pl011: Add support for Xilinx Uart
    4d81d7d94613 dt-bindings: serial: pl011: Add 'arm,xlnx-uart'
    0f2cd4d7140c watchdog: of_xilinx_wdt: Add Versal Window watchdog support
    7ec21c310d37 watchdog: of_xilinx_wdt: Use a proper variable to handle overflow
    d6836a99d4c8 watchdog: of_xilinx_wdt: Wire setting up timeout via module parameter/DT
    f43c59ceae8b watchdog: of_xilinx_wdt: Add Versal support
    22e840fdf615 watchdog: of_xilinx_wdt: Introduce wdttype enum for identification
    52206a1807f7 watchdog: of_xilinx_wdt: Initialize watchdog via data structure
    846ea51e6a80 dt-bindings: Convert Xilinx watchdog bindings to json-schema
    d5d2c796c7fb nvmem: zynqmp_nvmem: Fix zynqmp_nvmem_read() parameter alignment
    a73a6a5a2733 nvmem: zynqmp-nvmem: Fix passing incompatible parameters
    83ef5c2e5690 nvmem: zynqmp: Replace ENOTSUPP by EOPNOTSUPP
    d070eb96690c nvmem: zynqmp: Add support to PUF eFuses programming for User data
    45114f5f9401 nvmem: zynqmp: Removed \r format specifier for prints.
    52ed2e469d11 nvmem: zynqmp: Added support to access efuse
    987c652bc692 dt-bindings: nvmem: Added efuse nodes
    22d3c7c3ed8d net: axienet: Add GT reset status check for XXV new IP version
    6538ea1f407b net: xilinx: axiethernet: Pass correct phy interface to of_phy_connect()
    42cda9570fa3 net: xilinx: fix compile warning due to typecheck
    f8c09e68cbd5 net: xilinx: In MCMDA designs fix crash on ifconfig up
    59292a39293e net: xilinx: axiethernet: Correct phy-mode comparison logic in _probe()
    0869f1cc4405 net: xilinx: Ethtool statistics support
    b72b33640123 net: xilinx: axiethernet: Fix compilation error when HW timestamp is enabled
    0ceefac8945e net: axienet: MRMAC reset sequence fixes
    01b9f018d071 net: axienet: Add one step PDelay support
    d3dc3bc79dc4 net: xilinx: Add one step 1588 support for MRMAC
    e1134a6cc7ea net: xilinx: MRMAC TX CMD FIFO update
    39f7bd39fb5f net: xilinx: Handle TX TS FIFO timeout error
    d8d73b148a73 net: xilinx: Update MRMAC config structure with PTP command length
    d362488d5c68 net: xilinx: Add supported_coalesce_params to fix axienet on 5.10
    15b9e099689f net: xilinx: GT reset updates for 2020.2
    62ce30685f3e net: xilinx: axiethernet: Enable dynamic MDIO MDC
    dbfab9dd6ee7 net: xilinx: axiethernet: Reduce the width of variable to handle overflow
    52328d13e2d2 net: xilinx: axiethernet: Add variables and conditions to check return value
    bd9ceb904dfb net: xilinx: axiethernet: Add condition to check the return value
    72da03c512e4 net: xilinx: axiethernet: Replace the value with enum
    b96ca439cb48 net: xilinx: axiethernet: Fix indentation warnings
    5394b524013f net: xilinx: axiethernet: Add check to overcome NULL dereference warning
    99bbaaa8e02d net: xilinx: axiethernet: Fix the use of uninitialized variable
    6b44b3370fdd net: xilinx: axiethernet: Remove the NULL assigning to a pointer
    6b0456b9cfd3 net: xilinx: Cleanup xilinx_tsn_shaper.* files
    91ed830f75b5 net: xilinx: Access qdv address and associated properties separately
    c2bcaa2c17f9 net: xilinx: Add MCDMA management channel support
    43b5b909f4da net: xilinx: Add a master xmit function for TSN packets.
    6aa91dc5a68a net: xilinx: Add a separate mcdma probe function for TSN IP
    d5614ab8c424 net: xilinx: Refactor TSN functions into xilinx_tsn_ip.c
    b60ea7d7bad3 net: xilinx: Check if dma_map_single returned a valid address.
    0236f643b223 net: xilinx: axiethernet: Add check for transmit data FIFO vacancy
    8430dcd9e7f1 net: xilinx: Fix indentation issues
    6a8385064fb9 net: xilinx: Add missing kernel-doc descriptions
    83aaf89897f2 net: xilinx: Add HW timestamping support for MRMAC
    900f3039fec4 net: xilinx: Add MRMAC support
    cd9e7e274cc5 net: xilinx: XXV Ethernet HW timestamp fixes
    6cd1303dfc43 net: xilinx: Use prandom with range to avoid corner cases
    895d280e4840 net: xilinx: axiethernet: Pass phy interface to of_phy_connect()
    1acc0ce5d2d4 net: xilinx: axiethernet: Fix swiotlb buffer full error
    8d2c60b85348 net: xilinx: Add support for Qbu/br feature of PL TSN IP
    efc7cf76a30b net: xilinx: Add Support for CB/FRER feature of PL TSN IP
    a4dc8db62ba9 net: xilinx: Add Qci support to the PL TSN IP driver
    2f682c383c7b net: xilinx: Add support for PL TSN endpoint interface
    6384ce5ee020 net: xilinx: Add support for PL TSN IP features
    d6a42a8396bd Revert "net: axienet: convert to phylink API"
    dad41407a324 net: xilinx: axiethernet: Fix crash in axienet_recv
    8a8b566a2d9e net: xilinx: axiethernet: Fix axiethernet register description
    8faea500a288 net: xilinx: axiethernet: Check for queue full in transmit path
    a4dc276716e6 net: xilinx: axiethernet: Add USXGMII support
    2a880e7b51ec net: axienet: added multichannel DMA support
    b2dbc2e6b5af net: axienet: Add clock support
    063be1ee73a2 net: axienet: Fix issues when DRE is not enabled in the h/w
    727f3a5c8f27 net: axienet: Fix coding style issues
    8cce77b51c92 net: axienet: Use ether_addr_copy()
    d241d300782a net: axienet: Allow unaligned transfers
    d0c93a4f5318 net: axienet: Remove unnecessary phy defines
    355ed8ae8a9a net: axienet: Adding highmem support
    64052d0b3845 net: axienet: Add support for ZynqMP
    c5e69e552ec6 net: axienet: Add support for 1588
    55ffb3c182f1 net: axienet: Add support for 10G/25G MAC
    2cedc8fa2980 net: axienet: Add support for 10G MAC
    98061a32e7ae net: axienet: Add support for 2.5G MAC
    f7675dec1b2b net: axienet: Add support for config structure
    1115c018112d net: axienet: Add support for non-processor mode
    713b2b3690e3 net: axienet: Fix lost wake-up scenario in xmit
    763aed86a2dd net: axienet: Use barriers at relevant places
    93ed62f37db8 net: axienet: Add NAPI support
    292cfee22d66 Revert "net: axienet: make use of axistream-connected attribute optional"
    a84e67a6fa88 dt-bindings: net: Add devicetree documentation for MRMAC
    708b43eca0f1 dt-bindings: Add devicetree documentation for ep
    37c3a8064ee6 dt-bindings: Add devicetree documentation for TSN
    0a442196b1e8 dt-bindings: net: axienet: Add support for mcdma
    f26c850a9112 dt-bindings: net: axienet: Add clock support
    43077fd30fd8 dt-bindings: net: axienet: Update binding doc for 10G/25G MAC 1588
    737a14056cb3 dt-bindings: net: axienet: Add binding for 2.5G, 10G and usxgmii mac variants
    b176e141940f Revert "net: axienet: document axistream-connected attribute"
    fc3794a6edfa xilinx: Update copyright text to correct format
    75b094330f57 net: emaclite: Remove custom BUFFER_ALIGN macro
    0146c2c57963 net: emaclite: Fix coding style
    49da784794c7 dt-bindings: net: Add binding documentation for axi emaclite
    35430b30f1f5 net: xilinx_phy: Add flag to reset after clock enable
    c1fbadc9f397 net: phy: Add support for xilinx SGMII and 1000BASE-X phys
    65d69c6c214d dt-bindings: net: Add bindings documentation for Xilinx PCS/PMA PHY
    7841eb835b10 dmaengine: zynqmp_dma: Add conditions for return value check
    427d5c025e85 dmaengine: zynqmp_dma: Typecast with enum to fix the coverity warning
    599e12bbf307 dmaengine: zynqmp_dma: Typecast the variable with dma_addr_t to handle overflow
    9767db3c8884 dmaengine: zynqmp_dma: Typecast the variable to handle overflow
    298922bdf14f dma: zynqmp_dma: Initialize descriptor list after freeing during reset
    5d3dea6fc600 dmaengine: xilinx: Add vdmatest test client code
    5584a3280a8a dt-bindings: dmaengine: Add binding for vdmatest client
    65c2f7dd9e2d dmaengine: xilinx: Add axidmatest test client code
    655eb50ebb09 dt-bindings: dmaengine: Add binding for xilinx axidma test client
    c00b65c3a4c4 dmaengine: xilinx_dma: Implement error handling in xilinx_dma_child_probe() API
    908f454a5599 dmaengine: xilinx_dma: Fix kernel-doc warnings
    7af7892205db edac: zynqmp: Add EDAC support for ZynqMP OCM Controller
    9c5b9d5718a1 dt-bindings: edac: Add bindings for Xilinx ZynqMP OCM binding
    6b8f58e3fd3b i2c: xiic: Correct the BNB interrupt enable sequence
    4115dbc8ed91 dt-bindings: i2c: xiic: Add 'clock-frequency' property
    be4456162ad9 dt-bindings: i2c: xiic: Add 'xlnx,axi-iic-2.1' to compatible
    e809f68dc7c4 i2c: xiic: Add SCL frequency configuration support
    6002b4d40444 i2c: xiic: Update compatible with new IP version
    60849c483fbe i2c: xiic: Remove interrupt enable/disable in Rx path
    13e01446936a i2c: xiic: Switch to Xiic standard mode for i2c-read
    693a50a26414 i2c-xiic: Fix the type check for xiic_wakeup
    6b7031d358fc i2c-xiic: return value of xiic_reinit
    19d54cfd5ccb i2c: xiic: Add smbus_block_read functionality
    9f19d8f260fb i2c: xiic: Use 'nmsgs' variable instead of repeated_start
    ab1034c36585 i2c: xiic: Add wait for FIFO empty in send_tx
    abdec326ff9d i2c: xiic: Fix Rx and Tx paths in standard mode repeated start
    c2ada1322975 i2c: xiic: Correct the datatype for rx_watermark
    9371e3e5be5c i2c: xiic: Enter standard mode only for > 255 byte read transfers
    ffc4bfb1b8cb i2c: xiic: Fix coding style issues
    ab6be0774635 i2c: xiic: Add standard mode support for > 255 byte read transfers
    622176d24add i2c: xiic: Fix Tx Interrupt path for grouped messages
    b1e31132570b rtc: zynqmp: fix linking failure for ARCH arm
    50c43b106308 rtc: zynqmp: Add calibration set and get support
    2c1e6ef29bd9 arm: zynq: Suspend support
    a52ec0d01e2a clk: zynq: Update the parameters to zynq_clk_register_periph_clk
    92237f2096e3 clk: zynq: trivial warning fix
    eb5c194fe712 clk: zynq: pll: Fix kernel-doc warnings
    6461bd8f8bbc uio: uio_xilinx_apm: Add Xilinx AXI performance monitor driver
    e903b998a3ae dt-binding: apm: Add the binding document for APM
    386e0a2b7d11 clk: clocking-wizard: Fix coding style violations
    808472ee387f clocking-wizard: Support higher frequency accuracy
    1b0b1fcc0f35 clk: clocking-wizard: Update the compatible
    a6af66ef4704 clk: clocking-wizard: Fix the reconfig for 5.2
    aabc766ffa0d clk: clocking-wizard: Rename nr-outputs to xlnx,nr-outputs
    714046154405 clk: clocking-wizard: Add the clockwizard to clk directory
    dc8d9e247bd8 dt-bindings: add documentation of xilinx clocking wizard
    f8b100484ab4 i2c: cadence: Handling Slave monitor mode
    46952bbd1349 i2c-cadence: Check the return value of pin-ctrl
    2d3dc169c329 i2c: cadence: Recover bus after controller reset
    8d4f3e897a6b trafgen: Document sysfs entries
    e54e88aa8db6 trafgen: xilinx: add axi traffic generator driver
    db6c97a16709 dt-bindings: misc: Add dt bindings for traffic generator
    0b3a9cf23208 Documentation: short descriptions for Flexnoc Performance Monitor driver
    af9310156cdb misc: xilinx_flex: Add support for the flex noc Performance Monitor
    eed98bc1bd20 dt-bindings: Add dt bindings for flex noc Performance Monitor
    b39ce6188d8f fpga: zynqmp: Add feature-list validation check
    c3debbb075e8 firmware: xilinx: Use proper indentation in kernel-doc
    2f36766c292f firmware: xilinx: always check API version for IOCTL/QUERY
    31e6cfd7b3b4 firmware: xilinx: add new function for do_feature_check_call
    1e6083feb220 firmware: xilinx: Add support for IOCTL and QUERY ID feature check
    9d198dc12070 firmware: zynqmp: Add support for secure_image
    53e474616f13 firmware: xilinx: Add IOCTL support to query QoS
    772697ce114a firmware: xilinx: Implemented pm API functions to get the xilfpga component info
    2746bd976c4b firmware: xilinx: Add IOCTL support for the AIE run time operations
    9513498385d4 firmware: xilinx: Add TF_A_PM_REGISTER_SGI SMC call
    56e40c7dd8b6 firmware: xilinx: Add support to get the image meta-header info
    e03694978cf3 firmware: xilinx: Update the zynqmp_pm_fpga_load() API
    fbc91cdb367b fpga: versal: Use tab instead of spaces for indentation
    19e115da53f1 fpga: fpga-mgr: Add missing kernel-doc description
    7837d95cdd94 fpga: fpga-mgr: fix for coding style issues
    4481faa1bf49 fpga: mgr: Update the state to provide the exact error code
    bc8e9b6e0983 fpga: region: Adds runtime PM support
    54d8f9d9ca81 fpga: region: Add fpga-region property 'power-domains'
    a7a2276ed8f1 fpga: zynqmp: Initialized variables before using it
    292dbac1677e fpga: zynq: Fix incorrect variable type
    b918a2e218ca fpga: zynqmp: Use the scatterlist interface
    e155630575c4 fpga: versal: Use the scatterlist interface
    8e749d381f33 fpga: mgr: Adds secure BitStream loading support
    2dd53589d0a4 fpga: add bindings document for secure flags
    f59058929ba0 fpga: support loading from a pre-allocated buffer
    b536b65e5c7c fpga: fpga-bridge: Add manual set option via sysfs
    b752f2a3995b fpga: zynq: Add AFI config driver
    f8e7bc8ce2f2 fpga: doc: Add binding doc for the afi config driver
    5a1c2fd19a5d fpga: Add xilinx AFI config driver
    2433e3deb357 fpga: doc: Add binding doc for the afi config driver
    536a7eca23fe fpga: Adopted Authenticated BitStream loading support for Xilinx
    8a20fda8bffe fpga: zynqmp-fpga: Adds status interface
    2794dcc31d3d fpga: mgr: Update the status for fpga-manager
    5f095e3b363a fpga: zynqmp-fpga: Add support for pl configuration readback
    49f97f21ebce fpga: fpga-mgr: Add readback support
    453b5c0bdb77 fpga: mgr: Adopted Encrypted BitStream loading support for Xilinx zynqmp
    771420904d30 fpga: Add firmware store function
    298985c827de spi: spi-cadence-quadspi: Add Rx periodic Tuning support
    0d82358fa8e5 spi: spi-cadence-quadspi: Add support for OSPI Macronix
    f8e60991e92b mtd: spi-nor: micron-st: Add support for mt35xu01g flash
    7321890bd2f2 mtd: spi-nor: gigadevice: Add support for GD25LX256E
    595b205a7646 mtd: spi-nor: issi: Add support for is25wx256
    60db395c8bf9 spi: spi-cadence-quadspi: Add support for odd byte count read/write in DDR mode
    01c7f51c1324 spi: spi-cadence-quadspi: Add support for DDR PHY mode
    915923d73f7f spi: spi-cadence-quadspi: Add support for OSPI device reset
    742af72f442c firmware: xilinx: Add tristate configurations
    73cbd854ef83 spi: cadence-quadspi: fix dma_unmap_single() call
    d7228207a0c8 spi: cadence-quadspi: Add Xilinx Versal external DMA support
    af34a3dd349c spi: cadence-quadspi: Add OSPI support for Xilinx Versal SoC
    4004e9c16f95 dt-bindings: spi: cadence-quadspi: Add support for Xilinx Versal OSPI
    59803de0a3b3 net: macb: Move the phy re-init to phylink function instead of open
    80ed3cc175ae net: macb: Handle phy reset for PCS PMA IP
    a34ea9656915 net: macb: Kernel gives call trace during resume from Wake on Lan
    c9f9e43c4ee3 net: macb: Handle phy reset for PCS PMA IP
    9b06c1cc7a63 net: macb: Reorder probe and fix exit path
    31720bd54735 net: macb: Reset TX when TX halt times out
    73cd1e1e0b94 net: macb: Increase halt timeout to accommodate 10Mbps link
    0ddb734603a0 net: macb: Use queue disable instead of tieoff in Versal suspend
    4034a3f56f0f net: macb: Update tsu clk usage in runtime suspend/resume for Versal
    aee3952e9a18 dt-bindings: net: macb: Add GEM versal compatible string
    b3acf26ff48a net: macb: Optimize reading HW timestamp
    48d58b99f331 net: macb: Process tx timestamp only on ptp packets
    6b265011b9e9 net: macb: Use WOL via ARP
    d38cf41379d4 net: macb: Add provision for queue tie off
    c20373c21196 net: macb: PTP fixes
    2c46511d8159 net: macb: Add support for partial store and forward
    a11ece690080 dt-bindings: net: macb: update for partial store and forward
    00766c76dddd net: macb: add support for mdio phy nodes
    ac0976c90259 drivers: soc: xilinx: Call InitFinalize from late_initcall_sync instead of probe
    3daad588a65f pwm: pwm-cadence: Add support for TTC PWM
    413a103eb561 dt-bindings: timer: Update device tree bindings for cadence TTC PWM
    813603f7b72c clocksource: timer-cadence-ttc: Do not probe TTC device configured as PWM
    94461f06fbfb drivers: gpio: Add support for SLG7XL45106 I2C GPO expander
    2bdd366ed0ab dt-bindings: gpio: Add gpio-slg7xl45106.yaml
    7284fac81dec mtd: rawnand: Add jedec_id to struct onfi_params
    19c7e50b6c39 firmware: xilinx: Add OSPI Mux selection support
    1c44a8fcc5b1 firmware: xilinx: add support for sd/usb/gem config
    9fcd8933730f firmware: xilinx: Add support for secure read/write ioctl interface
    64db7b5940bd xilinx: Fix alignment issues
    2f4d392d63b9 firmware: xilinx: Update firmware call interface to support additional arg
    af114b23708c firmware: xilinx: Add support to access BBRAM and volatile user keys
    ffdf3479387c firmware: xilinx: Add support to get the image uid info
    bacd03b43e9a firmware: xilinx: Add sysfs support for feature config
    2dd992b1a66a firmware: xilinx: Add support for runtime features
    f78d30ce1170 firmware: xilinx: Open MMIO read/write interface via debugfs
    1705288f9b7e firmware: zynqmp: Add MMIO read and write support for PS_MODE pin
    03696811c57b usb: dwc3: Add power management support in DWC3 Xilinx driver
    4522562bac02 firmware: zynqmp: Use DEVICE_ATTR_* to create sysfs entry
    8679afc083a7 firmware: xilinx: Use u32 for reset ID in reset APIs
    894211e12431 xilinx: firmware: Add sysfs to get last reset reason
    4ccc1c0cb0d1 firmware: xilinx: Add support for GET_LAST_RESET_REASON IOCTL
    1d8d2dfe3408 firmware: xilinx: Add IOCTL for handling usb power requests
    ac757349260a firmware: xilinx: xilinx: Add IOCTL ids for probe counter
    007d0f428ab0 firmware: xilinx: Add qspi firmware interface
    e46e8af477fc firmware: xilinx: Add zynqmp SGMII firmware support
    6e6b3ac16542 firmware: xilinx: Add ULPI reset support
    f7ff9a4be882 firmware: xilinx: Add AFI ioctl support
    3fd244dfb317 firmware: xilinx: Add pm api function for PL readback
    989d4b8540ed firmware: xilinx: Add missing debug firmware interfaces
    16fe6e7d76b2 firmware: xilinx: Enable PM_IOCTL in debugfs
    c1171a34d2ef firmware: xilinx: Adds new eemi call for reg access
    c3e265ab42fe firmware: xilinx: Added pm api functions for RSA and SHA
    10ea96ed9201 firmware: xilinx: provides support to access efuse
    4049e236df60 firmware: xilinx: Add IOCTL support for AIE ISR Clear
    cdf530a25695 firmware: xilinx: Add ZynqMP firmware ioctl enums for RPU configuration.
    c2b985b88f09 firmware: xilinx: check return value of zynqmp_pm_get_api_version()
    c98909d6f9e5 firmware: xilinx: Add shutdown/wakeup APIs
    4ae799581030 driver: soc: xilinx: register for power events in zynqmp power driver
    3f0ca0276e98 firmware: xilinx: instantiate xilinx event manager driver
    ceeb8c19f199 drivers: soc: xilinx: add xilinx event management driver
    3b83c76d98b9 include: linux: firmware: Add header file with error events details
    dea4d8d0720a firmware: xilinx: move supported api callback ids
    0255c20b2d2c firmware: xilinx: export the feature check of zynqmp firmware
    22ef1e02ef40 firmware: xilinx: add register notifier in zynqmp firmware
    d179c639b30b x86/boot: Wrap literal addresses in absolute_pointer()
    856ec356cf91 ACPI: thermal: drop an always true check
    7614af249993 xfs: Fix -Werror=dangling-pointer work-around for older GCC
    41470215f97e xfs: Work around GCC 12 -Werror=dangling-pointer for xfs_attr_remote.o
    44a445c1922d virtio-pci: Remove wrong address verification in vp_del_vqs()
    77aa9e489eaf bpf: Disallow unprivileged bpf by default
    ebfb1822e9f9 fs/aufs: fixup 5.15.36 fixups
    4eba9348d3e2 Revert "Revert "fbdev: Hot-unplug firmware fb devices on forced removal""
    5df6d1b00f95 jbd2: fix use-after-free of transaction_t race
    2d83e8196487 jbd2: refactor wait logic for transaction updates into a common function
    07a63f760793 netfilter: conntrack: avoid useless indirection during conntrack destruction
    4e7122625996 Revert "fbdev: Hot-unplug firmware fb devices on forced removal"
    7ba4cb36fd4f rcu: Avoid alloc_pages() when recording stack
    f78574dee71e kasan: test: silence intentional read overflow warnings
    d313cb89b6b1 kasan: arm64: fix pcpu_page_first_chunk crash with KASAN_VMALLOC
    5e279d5647cc arm64: support page mapping percpu first chunk allocator
    e5bf16752dca vmalloc: choose a better start address in vm_area_register_early()
    660b3d21b46f kasan: test: bypass __alloc_size checks
    00aa7573e53a kasan: test: add memcpy test that avoids out-of-bounds write
    67becf0b1bd4 kasan: fix tag for large allocations when using CONFIG_SLAB
    bedf1e033213 workqueue, kasan: avoid alloc_pages() when recording stack
    7195b67ce69b kasan: generic: introduce kasan_record_aux_stack_noalloc()
    bdff763f0e29 kasan: common: provide can_alloc in kasan_save_stack()
    51423ebb36ad lib/stackdepot: introduce __stack_depot_save()
    85373e66d847 lib/stackdepot: remove unused function argument
    5b6cc9b251f3 lib/stackdepot: include gfp.h
    c9f3902d8069 aufs: reduce overhead for "code present but disabled" use case.
    b98d189df02c aufs: bugfix, umount passes NULL to ->parse_monolithic()
    13b883cbbbd9 aufs standalone: cosmetic, missing copyright sentence
    21f8b0d81898 aufs: 5.15.5-20220117 ---> 5.15.5-20220221
    6199fd896645 aufs: tiny, headers after fs_context
    8ddb40e31c29 aufs: fs_context 7/7, finally remount
    69035f71c6fd aufs: fs_context 6/7, now mount
    bc841b970697 aufs: fs_context 5/7, parse all other mount options
    435188053da2 aufs: fs_context 4/7, parse xino options
    9af1f1825cbd aufs: fs_context 3/7, parse the branch-management options
    1c05eb767f8c aufs: fs_context 2/7, parse "br" mount option
    a8488f603134 aufs: fs_context 1/7, skelton of the new shceme
    8e32e0015564 aufs: pre fs_context, convert a static flag to a macro
    f90cb4144aec aufs: pre fs_context, support the incomplete sb and sbinfo case
    948762ef859c aufs: pre fs_context, convert the type of alloc_sbinfo()
    77151a08776b aufs: 5.15.5-20211129 ---> 5.15.5-20220117
    2539adbbbe1e aufs: 5.14-20211018 ---> 5.15.5-20211129
    7d32b25193c4 aufs: for v5.15-rc1, sync_inode() is gone
    66ec0c509225 aufs: for v5.15-rc1, new param 'rcu' for ->get_acl()
    69709dc518cd aufs: for v5.15-rc1, no mand-lock anymore
    ada8fe9543e5 aufs: 5.14-20210906  ---> 5.14-20211018
    b77f7f3f394a Revert "aufs: adjust to v5.15 fs changes"
    81bdce5b5876 tick/nohz: WARN_ON --> WARN_ON_ONCE to prevent console saturation
    97c963889222 sched/isolation: really align nohz_full with rcu_nocbs
    871f23ad3627 Revert "ARM: defconfig: Enable ax88796c driver for Exynos boards"
    ffad0783dd5b ARM: config: multi v7: Regenerate defconifg
    5c1e1a1ff2d3 ARM: config: multi v7: Add renamed symbols
    badaf96564fe ARM: config: multi v7: Clean up enabled by default options
    34996040fc9b ARM: config: multi v7: Drop unavailable options
    7f685244afb3 powerpc/mm: Switch obsolete dssall to .long
    20301aeb1a64 riscv: fix build with binutils 2.38
    9df58d070506 powerpc/lib/sstep: fix 'ptesync' build error
    720b61fc400b x86_64_defconfig: Fix warnings
    02bf23d26bc4 arm64: defconfig: cleanup config options
    05914e2c87e5 arm: defconfig: drop unused POWER_AVS option
    ffb532fa19b9 aufs5: fix build against v5.15.3+
    a4b3abf4d96d qemux86: add configuration symbol to select values
    fee94ee09154 clear_warn_once: add a clear_warn_once= boot parameter
    3d8762d900d9 clear_warn_once: bind a timer to written reset value
    95faacac47e8 clear_warn_once: expand debugfs to include read support
    de20c4240018 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    0e4aacead9c1 perf: x86-32: explicitly include <errno.h>
    9ad92c11468e perf: mips64: Convert __u64 to unsigned long long
    09e7efe3e68a perf: fix bench numa compilation
    e79becc44fa6 perf: add SLANG_INC for slang.h
    b1033b588681 perf: add sgidefs.h to for mips builds
    cf9db484ac0b perf: change --root to --prefix for python install
    7fd052c2c562 perf: add 'libperl not found' warning
    27a437cdd469 perf: force include of <stdbool.h>
    3b99d21bec2f fat: don't use obsolete random32 call in namei_vfat
    a7e9293b506b FAT: Added FAT_NO_83NAME
    6fd0e71d9e5c FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    c379b0d324ae FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    538be0fdb124 aufs: adjust to v5.15 fs changes
    f45da75c8759 aufs5: core
    047f57e07e01 aufs5: standalone
    029fc15574c8 aufs5: mmap
    610d0192ee94 aufs5: base
    d4e428d0ec5f aufs5: kbuild
    eb067eca251a yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    286af18d0875 yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    24d59a4e26a6 yaffs2: v5.12+ build fixups (not runtime tested)
    22c73536d5d7 yaffs: include blkdev.h
    506b7251bfb8 yaffs: fix misplaced variable declaration
    a0e26ff364dc yaffs2: v5.6 build fixups
    b10b1b2d169e yaffs2: fix memory leak when /proc/yaffs is read
    ad9adccbb214 yaffs: add strict check when call yaffs_internal_read_super
    2e3c3aec8279 yaffs: repair yaffs_get_mtd_device
    d662538516a7 yaffs: Fix build failure by handling inode i_version with proper atomic API
    70a6113ee2c7 yaffs2: fix memory leak in mount/umount
    3378e4a9e404 yaffs: Avoid setting any ACL releated xattr
    ec2284edddef Yaffs:check oob size before auto selecting Yaffs1
    c2a49874051c fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    e9a5105a3e73 yaffs2: adjust to proper location of MS_RDONLY
    608807406f13 yaffs2: import git revision b4ce1bb (jan, 2020)
    89e660ece42c initramfs: allow an optional wrapper script around initramfs generation
    b179dbc9aa10 iwlwifi: select MAC80211_LEDS conditionally
    3fd5ca3673d0 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    d1f6edbf0188 arm64/perf: Fix wrong cast that may cause wrong truncation
    d202fb2caf33 defconfigs: drop obselete options
    9a27e3b5f4e7 arm64/perf: fix backtrace for AAPCS with FP enabled
    e20d8cf019b4 linux-yocto: Handle /bin/awk issues
    b6d2a3dbbd3a uvesafb: provide option to specify timeout for task completion
    adb40f1e6a1a uvesafb: print error message when task timeout occurs
    f280a1ed0962 compiler.h: Undef before redefining __attribute_const__
    4352732f268c vmware: include jiffies.h
    7954a677968d Resolve jiffies wrapping about arp
    5f28a1035d95 nfs: Allow default io size to be configured.
    0d7260ad7106 check console device file on fs when booting
    900a12e37e0a mount_root: clarify error messages for when no rootfs found
    7b878cbea726 menuconfig,mconf-cfg: Allow specification of ncurses location
    6604fc1763b3 modpost: mask trivial warnings
    0d294adb09cb kbuild: exclude meta directory from distclean processing
    a097cdd95a9e powerpc: serialize image targets
    5db6ec39a0a3 arm: serialize build targets
    cbabca27905e crtsavres: fixups for 5.4+
    7fc7656ed403 powerpc/ptrace: Disable array-bounds warning with gcc8
    a5faac5a19a2 powerpc: Disable attribute-alias warnings from gcc8
    186c54665b67 powerpc: add crtsavres.o to archprepare for kbuild
    d1ea862964ca powerpc: kexec fix for powerpc64
    2ac35b89a0f9 powerpc: Add unwind information for SPE registers of E500 core
    2e1c348a28bb mips: vdso: fix 'jalr $t9' crash in vdso code
    ec57870b303a mips: Kconfig: add QEMUMIPS64 option
    6a81b3c08107 4kc cache tlb hazard: tlbp cache coherency
    74e3b2a21e54 malta uhci quirks: make allowance for slow 4k(e)c
    22e65b63d3b4 arm/Makefile: Fix systemtap
    b7f1ab59f19e vexpress: Pass LOADADDR to Makefile
    ce2800c73bf7 arm: ARM EABI socketcall
    019d142fd956 ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index fa8c25c34c..080f6301d8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b3259cd1a23cad4b953927eff2ff3bb33455942c"
-SRCREV_meta ?= "896128cbf5fc140cad076227af3456cc38e8f442"
+SRCREV_machine ?= "8a13160b91cb6ee1c352beff6b1499f78c2e3b8c"
+SRCREV_meta ?= "4247019012f1e9a1650dcc3b84589883bedb78c0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.179"
+LINUX_VERSION ?= "5.15.180"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 8204c85350..21fe72dfa4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.179"
+LINUX_VERSION ?= "5.15.180"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "0add6cb84172889c436c78560713eaa3e86c4041"
-SRCREV_meta ?= "896128cbf5fc140cad076227af3456cc38e8f442"
+SRCREV_machine ?= "ace85b13a79e7a9dbff02fbfae8a7d8d63e98187"
+SRCREV_meta ?= "4247019012f1e9a1650dcc3b84589883bedb78c0"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 98729e3a41..3a63cf2032 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "cf3b7736503d85cf402e004c050c50eea7a77e37"
-SRCREV_machine:qemuarm64 ?= "2bf9cba52f8924bdb2f0daba23ee62cc34d85622"
-SRCREV_machine:qemumips ?= "a29f88d7cef3c7da41cc1c801b50cd09a35e837d"
-SRCREV_machine:qemuppc ?= "db3626867d8d215297b745a95aea30881de96f72"
-SRCREV_machine:qemuriscv64 ?= "e3234082ae63e31dad3500dac02b90633079d79c"
-SRCREV_machine:qemuriscv32 ?= "e3234082ae63e31dad3500dac02b90633079d79c"
-SRCREV_machine:qemux86 ?= "e3234082ae63e31dad3500dac02b90633079d79c"
-SRCREV_machine:qemux86-64 ?= "e3234082ae63e31dad3500dac02b90633079d79c"
-SRCREV_machine:qemumips64 ?= "afef0f609941ca98d67ac6fcf4ca97d28a171243"
-SRCREV_machine ?= "e3234082ae63e31dad3500dac02b90633079d79c"
-SRCREV_meta ?= "896128cbf5fc140cad076227af3456cc38e8f442"
+SRCREV_machine:qemuarm ?= "0b93ca5c0930b1bae3100474d7312b6a951a376d"
+SRCREV_machine:qemuarm64 ?= "6a5c9cec0971ea6810091088c7d3e5c18e9cdcd1"
+SRCREV_machine:qemumips ?= "dead39d95cf00bc4351c2c86e0cfcf9fcaa2a899"
+SRCREV_machine:qemuppc ?= "e0ae237653f6de4c2cbadcab798e2976560615d2"
+SRCREV_machine:qemuriscv64 ?= "d3877a02f0b7b367143d561c558078889228ae29"
+SRCREV_machine:qemuriscv32 ?= "d3877a02f0b7b367143d561c558078889228ae29"
+SRCREV_machine:qemux86 ?= "d3877a02f0b7b367143d561c558078889228ae29"
+SRCREV_machine:qemux86-64 ?= "d3877a02f0b7b367143d561c558078889228ae29"
+SRCREV_machine:qemumips64 ?= "ea852bd2185a4565473cc390fbff3df8aba9e163"
+SRCREV_machine ?= "d3877a02f0b7b367143d561c558078889228ae29"
+SRCREV_meta ?= "4247019012f1e9a1650dcc3b84589883bedb78c0"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "0c935c049b5c196b83b968c72d348ae6fff83ea2"
+SRCREV_machine:class-devupstream ?= "f7347f4005727f3155551c0550f4deb9c40b56c2"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.179"
+LINUX_VERSION ?= "5.15.180"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.39.2


