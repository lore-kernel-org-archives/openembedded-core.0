Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A7B0C4167B
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 14:28:32 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.2939.1702391307835690609
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 06:28:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MGRhE8AI;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6ce7c1b07e1so4766009b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 06:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702391307; x=1702996107; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pYjY1ICFZmyRXFy8rNJkMwkx4dOzwh+L9XZK8fLHjK0=;
        b=MGRhE8AICQ5+ns7oTuBTe/1Z3+ovLWSdfa6CCyQAy66dVSUpA9e7yeISSpzxxPu+7C
         nD6JpZKs+O1PpI2+HCXcEFavHDa0SHTP8dBEc59idiFF24cgj6K7IcdEHXXZETwDC3aX
         Iwmx1tAeB0N2k8B/tsPuxDxl5LTc0WAj+u8j7fJ5kBLM2FJ3D866cJSYY4MVX8vLZBw6
         joNSPY7cRev43t3dsi2L+j+uHTCgFxDXgbGSck9CEGhx82z0sO1Ukthdvc/azkBQ0EIR
         oAd0Md6OLKEkl3PDofDJXf2ajtCh+a5a3Af5Gq+L/cxscV8NTFwSKGbQEiii5ru2wpBp
         usWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702391307; x=1702996107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pYjY1ICFZmyRXFy8rNJkMwkx4dOzwh+L9XZK8fLHjK0=;
        b=mHPcV6V5dftvaD83uEuava4bRRyOpdyFxWX8ZTnmSYuIG4zzJGJkI0kpGbshXns/ML
         7JfayRsnYBKO+MQujuUZfkcaNUha2VXLWEuv+Kc0BPfQ+0dMTzAmpr9t7bWrOJOgVKAS
         OwJprmm7xThEcYVTv2uKVqXGr62lKGJ/S7WTYFxIQngsvK6qMgebU20gQeyTZ/T9sViM
         XzJo2N7tnV4NK2+4rjeZwjyRqGnGzHmicP2s92LEVXKiS7b3ttMCSKPQ3V7VnH1DIvd5
         pjxWaOWJR0aft8M7psbIO15QgPBGwfycsyqaBdE3vLuvpCmQrFrx8zFZr3sks2GeE/L0
         p2yA==
X-Gm-Message-State: AOJu0YyJ/Dnm6gYCP+6jAad6VhbT1L5pBNDscCyP6u3cT8jDBfk0WON5
	h+vpJs5IVsCbiUEqPOUGHcmnjVWg1thgkRvIZYY=
X-Google-Smtp-Source: AGHT+IFYu4gK0W2V4SVCjq9cXXns85KEWutTTAyTwIxetP3anyv7rpc2sAVvYbUdmvosuY6jreMJFQ==
X-Received: by 2002:a05:6a00:2286:b0:6ce:351e:b0d7 with SMTP id f6-20020a056a00228600b006ce351eb0d7mr7919944pfe.66.1702391306106;
        Tue, 12 Dec 2023 06:28:26 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n23-20020a056a000d5700b006cbb40669b1sm8188928pfv.23.2023.12.12.06.28.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 06:28:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 23/29] linux-yocto/6.5: update to v6.5.12
Date: Tue, 12 Dec 2023 04:27:29 -1000
Message-Id: <33a9b4a6d292a92443046fec141cb8a6ab2c6084.1702391115.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702391115.git.steve@sakoman.com>
References: <cover.1702391115.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:28:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192227

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    fa1be4637aad Linux 6.5.12
    39ee8317876f btrfs: make found_logical_ret parameter mandatory for function queue_scrub_stripe()
    1c44debc30d2 perf parse-events: Fix driver config term
    9a955334c112 bpf, x86: initialize the variable "first_off" in save_args()
    3dccc81f9ea9 btrfs: use u64 for buffer sizes in the tree search ioctls
    7fbd30155906 Revert "mmc: core: Capture correct oemid-bits for eMMC cards"
    2ee1f00866ac Revert "PCI/ASPM: Disable only ASPM_STATE_L1 when driver, disables L1"
    b592cec2a478 x86/amd_nb: Use Family 19h Models 60h-7Fh Function 4 IDs
    9e1c7fe85391 io_uring/net: ensure socket is marked connected on connect retry
    c0ba439a4333 selftests: mptcp: fix wait_rm_addr/sf parameters
    8a0ba7e4b2e8 Revert "drm/ast: report connection status on Display Port."
    718dfd5b1646 tracing/kprobes: Fix the order of argument descriptions
    afc10d0ca630 fbdev: fsl-diu-fb: mark wr_reg_wa() static
    6e6676c34078 ALSA: hda/realtek: Add support dual speaker for Dell
    18d26f9baca7 fbdev: imsttfb: fix a resource leak in probe
    32310dbf0aa9 fbdev: imsttfb: fix double free in probe()
    7446c44198a5 arm64/arm: arm_pmuv3: perf: Don't truncate 64-bit registers
    68b1ad75906b spi: spi-zynq-qspi: add spi-mem to driver kconfig dependencies
    033ade77d851 ASoC: dapm: fix clock get name
    18795fc33915 ASoC: hdmi-codec: register hpd callback on component probe
    a3ef9afd315a ASoC: mediatek: mt8186_mt6366_rt1019_rt5682s: trivial: fix error messages
    2f769f4c557b drm/syncobj: fix DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE
    fe131f6d71c5 drm/vc4: tests: Fix UAF in the mock helpers
    b2628d195a02 module/decompress: use kvmalloc() consistently
    990345880a1c RISC-V: Don't fail in riscv_of_parent_hartid() for disabled HARTs
    c59f92817719 net/sched: act_ct: Always fill offloading tuple iifidx
    61fd0c64e3bf netfilter: nat: fix ipv6 nat redirect with mapped and scoped addresses
    a95ea2622afb netfilter: xt_recent: fix (increase) ipv6 literal buffer length
    52f7f210bd3d i2c: iproc: handle invalid slave state
    f706e2c9adf2 net: enetc: shorten enetc_setup_xdp_prog() error message to fit NETLINK_MAX_FMTMSG_LEN
    93e7f8feacb1 r8169: respect userspace disabling IFF_MULTICAST
    dbe7967095a5 vsock/virtio: remove socket from connected/bound list on shutdown
    0828d76ba2f9 blk-core: use pr_warn_ratelimited() in bio_check_ro()
    879947f4180b nbd: fix uaf in nbd_open
    d5d744277c03 tg3: power down device only on SYSTEM_POWER_OFF
    57efa187cda5 riscv: boot: Fix creation of loader.bin
    209a13dc04d0 nvme: fix error-handling for io_uring nvme-passthrough
    bf6571bb260b net/smc: put sk reference if close work was canceled
    8d6a49fc39ed net/smc: allow cdc msg send rather than drop it with NULL sndbuf_desc
    6904598dd970 net/smc: fix dangling sock under state SMC_APPFINCLOSEWAIT
    a63ff94ae244 octeontx2-pf: Free pending and dropped SQEs
    d888fcdaa87d selftests: pmtu.sh: fix result checking
    5917a439643b net: stmmac: xgmac: Enable support for multiple Flexible PPS outputs
    aeb378667a00 Fix termination state for idr_for_each_entry_ul()
    28220ff13ac3 net: r8169: Disable multicast filter for RTL8168H and RTL8107E
    0577f93e8481 dccp/tcp: Call security_inet_conn_request() after setting IPv6 addresses.
    9e5386d494fd dccp: Call security_inet_conn_request() after setting IPv4 addresses.
    59f1841a9b14 net: page_pool: add missing free_percpu when page_pool_init fail
    c84f297964fe octeontx2-pf: Fix holes in error code
    b3e4e1162368 octeontx2-pf: Fix error codes
    688f277d0592 inet: shrink struct flowi_common
    d5574d0ad4c4 bpf: Check map->usercnt after timer->timer is assigned
    fe4d6a419062 rxrpc: Fix two connection reaping bugs
    abc1582119e8 tipc: Change nla_policy for bearer-related names to NLA_NUL_STRING
    1787b9f0729d hsr: Prevent use after free in prp_create_tagged_frame()
    0a720d0259ad llc: verify mac len before reading mac header
    f1fd72c06d8e watchdog: ixp4xx: Make sure restart always works
    cc56c4d17721 Input: synaptics-rmi4 - fix use after free in rmi_unregister_function()
    3448b7ba8c56 pwm: brcmstb: Utilize appropriate clock APIs in suspend/resume
    98965075e630 pwm: sti: Reduce number of allocations and drop usage of chip_data
    da97367c938d drm/amdgpu: don't put MQDs in VRAM on ARM | ARM64
    5bb28ff319bf drm/amdgpu/gfx10,11: use memcpy_to/fromio for MQDs
    f6ac81f82692 regmap: prevent noinc writes from clobbering cache
    f232770077e8 cpupower: fix reference to nonexistent document
    531129a7e935 media: cec: meson: always include meson sub-directory in Makefile
    d4076de583f3 media: platform: mtk-mdp3: fix uninitialized variable in mdp_path_config()
    af9c02dd5962 media: imx-jpeg: notify source chagne event when the first picture parsed
    963ac643508a media: verisilicon: Fixes clock list for rk3588 av1 decoder
    1180f59a5b3c media: dvb-usb-v2: af9035: fix missing unlock
    a7ee4299b025 media: cadence: csi2rx: Unregister v4l2 async notifier
    b9be6d023c3e media: cedrus: Fix clock/reset sequence
    cb1300141199 media: vidtv: mux: Add check and kfree for kstrdup
    5cfcc8de7d73 media: vidtv: psi: Add check for kstrdup
    88bdfe1a2439 media: s3c-camif: Avoid inappropriate kfree()
    f589aad0768a media: mtk-jpegenc: Fix bug in JPEG encode quality selection
    1ef450564770 media: amphion: handle firmware debug message
    1871014d6ef4 media: bttv: fix use after free error due to btv->timeout timer
    b43848690b3f media: ov5640: Fix a memory leak when ov5640_probe fails
    220f763dcad3 media: i2c: max9286: Fix some redundant of_node_put() calls
    c4c8324eb142 media: ov5640: fix vblank unchange issue when work at dvp mode
    e028c9573dde media: verisilicon: Do not enable G2 postproc downscale if source is narrower than destination
    66b4c5f980d7 media: hantro: Check whether reset op is defined before use
    a2e2190d994a media: imx-jpeg: initiate a drain of the capture queue in dynamic resolution change
    7ef4cebe945e pcmcia: ds: fix possible name leak in error path in pcmcia_device_add()
    65559a64c276 pcmcia: ds: fix refcount leak in pcmcia_device_add()
    7b3607be4576 pcmcia: cs: fix possible hung task and memory leak pccardd()
    d98f43ab71e5 cxl/hdm: Remove broken error path
    ce82bfafd6f9 cxl/port: Fix @host confusion in cxl_dport_setup_regs()
    f2783b8a218a cxl/core/regs: Rename @dev to @host in struct cxl_register_map
    fb2306ec5099 cxl/region: Fix cxl_region_rwsem lock held when returning to user space
    7ca00fb8c99d cxl/region: Use cxl_calc_interleave_pos() for auto-discovery
    043facdd8d5d cxl/region: Calculate a target position in a region interleave
    5d86b34317d5 cxl/region: Prepare the decoder match range helper for reuse
    c2723a64b63b rtc: pcf85363: fix wrong mask/val parameters in regmap_update_bits call
    5e9051bf642e rtc: pcf85363: Allow to wake up system without IRQ
    a8a063f2c5ec virt: sevguest: Fix passing a stack buffer as a scatterlist target
    cad22a757029 cxl/mem: Fix shutdown order
    516fba3bd586 cxl/memdev: Fix sanitize vs decoder setup locking
    8e09215aadde cxl/pci: Fix sanitize notifier setup
    d50d70827e2a cxl/pci: Clarify devm host for memdev relative setup
    ba524b221cb4 cxl/pci: Remove inconsistent usage of dev_err_probe()
    a1124adef547 cxl/pci: Cleanup 'sanitize' to always poll
    7be8c47426cf cxl/pci: Remove unnecessary device reference management in sanitize work
    e7afa8a065a0 rtc: brcmstb-waketimer: support level alarm_irq
    b24cf43d9bab i3c: Fix potential refcount leak in i3c_master_register_new_i3c_devs
    bcf5e18c0beb rtla: Fix uninitialized variable found
    48b318939955 9p/net: fix possible memory leak in p9_check_errors()
    9a4cc8e1ad73 perf vendor events intel: Add broadwellde two metrics
    e5270cbe0252 perf vendor events intel: Fix broadwellde tma_info_system_dram_bw_use metric
    ccbe6d8c6b4a perf hist: Add missing puts to hist__account_cycles
    57c01bae6c24 libperf rc_check: Make implicit enabling work for GCC
    64fe182e0b20 perf machine: Avoid out of bounds LBR memory read
    a43bdc6ba342 usb: host: xhci-plat: fix possible kernel oops while resuming
    7b8ae3c24efd xhci: Loosen RPM as default policy to cover for AMD xHC 1.1
    056a83850468 perf vendor events: Update PMC used in PM_RUN_INST_CMPL event for power10 platform
    ed905e38c0f2 powerpc/pseries: fix potential memory leak in init_cpu_associativity()
    104f083c5df3 powerpc/imc-pmu: Use the correct spinlock initializer.
    c3f620809a61 powerpc/vas: Limit open window failure messages in log bufffer
    d9d00713b8f7 perf trace: Use the right bpf_probe_read(_str) variant for reading user data
    3af067e50b0e powerpc: Hide empty pt_regs at base of the stack
    fc7957384d7e powerpc/xive: Fix endian conversion size
    1fe1c98a72d2 powerpc/40x: Remove stale PTE_ATOMIC_UPDATES macro
    ea654911b8ee perf tools: Do not ignore the default vmlinux.h
    35278545af13 modpost: fix ishtp MODULE_DEVICE_TABLE built on big-endian host
    db40f538c825 modpost: fix tee MODULE_DEVICE_TABLE built on big-endian host
    6fbbf9f14a53 s390/ap: re-init AP queues on config on
    e94732825a5a perf mem-events: Avoid uninitialized read
    34ca27039e1f perf pmu: Remove logic for PMU name being NULL
    4890aaf24b0c perf parse-events: Fix for term values that are raw events
    63e14dbe45f8 perf build: Add missing comment about NO_LIBTRACEEVENT=1
    49dc517a904e interconnect: fix error handling in qnoc_probe()
    4eb6e78b3f81 powerpc: Only define __parse_fpscr() when required
    7e324e99321c interconnect: qcom: sm8350: Set ACV enable_mask
    ed261c06fcf9 interconnect: qcom: sm8350: Retire DEFINE_QBCM
    6bbf49794fb4 interconnect: qcom: sm8150: Set ACV enable_mask
    389fd2613208 interconnect: qcom: sm8150: Retire DEFINE_QBCM
    57ba6e84bc32 interconnect: qcom: sm6350: Set ACV enable_mask
    ff36f2775bea interconnect: qcom: sm6350: Retire DEFINE_QBCM
    885139b6a071 interconnect: qcom: sdm845: Set ACV enable_mask
    1940f9a3f735 interconnect: qcom: sdm845: Retire DEFINE_QBCM
    f82f1ddb7ec5 interconnect: qcom: sdm670: Set ACV enable_mask
    e8720308de88 interconnect: qcom: sdm670: Retire DEFINE_QBCM
    b7d939c28f80 interconnect: qcom: sc8280xp: Set ACV enable_mask
    9640f78cdc0e interconnect: qcom: sc8180x: Set ACV enable_mask
    0f1b8085a42f interconnect: qcom: sc7280: Set ACV enable_mask
    b5db623daed9 interconnect: qcom: sc7180: Set ACV enable_mask
    4ca7387d611b interconnect: qcom: sc7180: Retire DEFINE_QBCM
    899b86659064 interconnect: qcom: qdu1000: Set ACV enable_mask
    00ca5edeaed1 f2fs: fix to initialize map.m_pblk in f2fs_precache_extents()
    c8fff2c9225f dmaengine: pxa_dma: Remove an erroneous BUG_ON() in pxad_free_desc()
    9a8656a5300c USB: usbip: fix stub_dev hub disconnect
    356a5f8bdb6d tools: iio: iio_generic_buffer ensure alignment
    4428cd427855 misc: st_core: Do not call kfree_skb() under spin_lock_irqsave()
    9bbdea45ea79 tools/perf: Update call stack check in builtin-lock.c
    21e32bf0bb27 dmaengine: ti: edma: handle irq_of_parse_and_map() errors
    5356ca664710 usb: chipidea: Simplify Tegra DMA alignment code
    ac69dc32af3b usb: chipidea: Fix DMA overwrite for Tegra
    3e851a77a13c usb: dwc2: fix possible NULL pointer dereference caused by driver concurrency
    50daad99bd7a dmaengine: idxd: Register dsa_bus_type before registering idxd sub-drivers
    faa48ed2647c perf record: Fix BTF type checks in the off-cpu profiling
    25a88c08352d pinctrl: renesas: rzg2l: Make reverse order of enable() for disable()
    432909464fd9 livepatch: Fix missing newline character in klp_resolve_symbols()
    ad3fa6cc3e23 perf parse-events: Fix tracepoint name memory leak
    bd64a16ba2c5 perf tools: Revert enable indices setting syntax for BPF map
    acd50fcdd4e4 perf parse-events: Remove ABORT_ON
    ee4558a6e062 perf parse-events: Remove unused PE_KERNEL_PMU_EVENT token
    84d2e3f3e74c perf parse-events: Remove unused PE_PMU_EVENT_FAKE token
    49a22ed339a5 tty: tty_jobctrl: fix pid memleak in disassociate_ctty()
    eb42e1862aa7 f2fs: fix to drop meta_inode's page cache in f2fs_put_super()
    d759d1d271f6 f2fs: compress: fix to avoid redundant compress extension
    932ddb5c29e8 f2fs: compress: fix to avoid use-after-free on dic
    f783e3507b09 f2fs: compress: fix deadloop in f2fs_write_cache_pages()
    03832670f99e perf kwork: Set ordered_events to true in 'struct perf_tool'
    7990bb48feea perf kwork: Add the supported subcommands to the document
    83237a95d315 perf kwork: Fix incorrect and missing free atom in work_push_atom()
    0c0044a01cb7 iio: frequency: adf4350: Use device managed functions and fix power down issue.
    89ad251b6f99 perf stat: Fix aggr mode initialization
    f997e1b08f88 apparmor: fix invalid reference on profile->disconnected
    74e5ce33ed3b scripts/gdb: fix usage of MOD_TEXT not defined when CONFIG_MODULES=n
    b76057527912 leds: trigger: ledtrig-cpu:: Fix 'output may be truncated' issue for 'cpu'
    dd88eb7b0c60 leds: pwm: Don't disable the PWM when the LED should be off
    5a237df850f0 leds: turris-omnia: Do not use SMBUS calls
    48c32d8df085 leds: turris-omnia: Drop unnecessary mutex locking
    e84a57ce0435 mfd: arizona-spi: Set pdata.hpdet_channel for ACPI enumerated devs
    49797594d234 dt-bindings: mfd: mt6397: Split out compatible for MediaTek MT6366 PMIC
    e97de887bd28 mfd: dln2: Fix double put in dln2_probe
    b8af0a637afc mfd: core: Ensure disabled devices are skipped without aborting
    b666088a7df2 mfd: core: Un-constify mfd_cell.of_reg
    4f4a7a7d1404 IB/mlx5: Fix init stage error handling to avoid double free of same QP and UAF
    531a6b22b5af erofs: fix erofs_insert_workgroup() lockref usage
    300041583ea5 ASoC: ams-delta.c: use component after check
    837afdc92f69 crypto: qat - fix deadlock in backlog processing
    e7c29266f520 certs: Break circular dependency when selftest is modular
    1e901bcb8af1 padata: Fix refcnt handling in padata_free_shell()
    65f881a0a90d PCI: endpoint: Fix double free in __pci_epc_create()
    f013769f70d3 ASoC: Intel: Skylake: Fix mem leak when parsing UUIDs fails
    cfe88cf748cc HID: logitech-hidpp: Move get_wireless_feature_index() check to hidpp_connect_event()
    c8836943bd4e HID: logitech-hidpp: Revert "Don't restart communication if not necessary"
    aedb6041da69 HID: logitech-hidpp: Don't restart IO, instead defer hid_connect() only
    b4f35870a9b9 sh: bios: Revive earlyprintk support
    08420113b468 HID: uclogic: Fix a work->entry not empty bug in __queue_work()
    64da1f6147da HID: uclogic: Fix user-memory-access bug in uclogic_params_ugee_v2_init_event_hooks()
    f06c2b93502f hid: cp2112: Fix IRQ shutdown stopping polling for all IRQs on chip
    8ef4b7548dcb HID: cp2112: Make irq_chip immutable
    abc6ac81a306 RDMA/hfi1: Workaround truncation compilation error
    8a517831ca9f scsi: ufs: core: Leave space for '\0' in utf8 desc string
    e1fc0752d5e8 ASoC: fsl: Fix PM disable depth imbalance in fsl_easrc_probe
    cd666d29c1ad ASoC: SOF: core: Ensure sof_ops_free() is still called when probe never ran.
    87820275278d RDMA/hns: The UD mode can only be configured with DCQCN
    aaf04e12b60a RDMA/hns: Add check for SL
    37d9b4a8842f RDMA/hns: Fix signed-unsigned mixed comparisons
    3e7665413c0d RDMA/hns: Fix uninitialized ucmd in hns_roce_create_qp_common()
    035a843df60a RDMA/hns: Fix printing level of asynchronous events
    767e4c76e0da IB/mlx5: Fix rdma counter binding for RAW QP
    13ee0d9bae3b dlm: fix no ack after final message
    f67500a59f82 ASoC: fsl-asoc-card: Add comment for mclk in the codec_priv
    b66d7d971467 ASoC: Intel: sof_sdw_rt_sdca_jack_common: add rt713 support
    afdf67c1a521 backlight: pwm_bl: Disable PWM on shutdown, suspend and remove
    f9501d0c1015 ASoC: fsl: mpc5200_dma.c: Fix warning of Function parameter or member not described
    73be585b2912 kselftest: vm: fix mdwe's mmap_FIXED test case
    8575339a5f7c ext4: move 'ix' sanity check to corrent position
    3456dad3d723 ARM: 9323/1: mm: Fix ARCH_LOW_ADDRESS_LIMIT when CONFIG_ZONE_DMA
    1d09354dca6e ARM: 9321/1: memset: cast the constant byte to unsigned char
    11eb0faaae67 crypto: hisilicon/qm - fix PF queue parameter issue
    fb5718bc6733 hid: cp2112: Fix duplicate workqueue initialization
    2f0367ea3a9e PCI: vmd: Correct PCI Header Type Register's multi-function check
    531f107ee700 ASoC: SOF: ipc4-topology: Use size_add() in call to struct_size()
    461b4df72256 crypto: qat - increase size of buffers
    60f93c3b75ff crypto: caam/jr - fix Chacha20 + Poly1305 self test failure
    886e2995b42b crypto: caam/qi2 - fix Chacha20 + Poly1305 self test failure
    b27751fb1f27 nd_btt: Make BTT lanes preemptible
    4f08f132c996 libnvdimm/of_pmem: Use devm_kstrdup instead of kstrdup and check its return value
    4778c1dd656e ASoC: soc-pcm.c: Make sure DAI parameters cleared if the DAI becomes inactive
    ffce1dc8457e scsi: ibmvfc: Fix erroneous use of rtas_busy_delay with hcall return code
    f666c814dc5b crypto: qat - fix unregistration of compression algorithms
    adeee72f0e3b crypto: qat - fix unregistration of crypto algorithms
    99fe5f7b6c99 crypto: qat - ignore subsequent state up commands
    36f45cb3d919 crypto: qat - fix state machines cleanup paths
    8946a17a70c5 RDMA/core: Use size_{add,sub,mul}() in calls to struct_size()
    64254a5b9427 hwrng: geode - fix accessing registers
    b9f8f249a551 hwrng: bcm2835 - Fix hwrng throughput regression
    bc49891f9871 crypto: hisilicon/hpre - Fix a erroneous check after snprintf()
    fce1075147a5 KEYS: Include linux/errno.h in linux/verification.h
    cb759656ffb0 ALSA: hda: cs35l41: Undo runtime PM changes at driver exit time
    bcb94863b056 ALSA: hda: cs35l41: Fix unbalanced pm_runtime_get()
    8cd0ae3660b1 ASoC: cs35l41: Undo runtime PM changes at driver exit time
    22f034db12a2 ASoC: cs35l41: Verify PM runtime resume errors in IRQ handler
    809ec9f7d474 ASoC: cs35l41: Initialize completion object before requesting IRQ
    30a7908fdc18 ASoC: cs35l41: Handle mdsync_down reg write errors
    065d45141019 module/decompress: use vmalloc() for gzip decompression workspace
    1475a083ccee iommufd: Add iopt_area_alloc()
    0a54ac6ff6cc ARM: dts: BCM5301X: Explicitly disable unused switch CPU ports
    bd3cab2d710e soc: qcom: pmic_glink: fix connector type to be DisplayPort
    59a31165fe6d selftests/resctrl: Ensure the benchmark commands fits to its array
    ab13ca1ef2dd selftests/pidfd: Fix ksft print formats
    87483b30fad2 arm64: tegra: Use correct interrupts for Tegra234 TKE
    8e3f93cd849f memory: tegra: Set BPMP msg flags to reset IPC channels
    e3e711ef8a10 firmware: tegra: Add suspend hook and reset BPMP IPC early on resume
    ef3a7c256462 arm64: tegra: Fix P3767 QSPI speed
    d2ab1d75e486 arm64: tegra: Fix P3767 card detect polarity
    0a6baa9b5b64 arm64: dts: imx8mn: Add sound-dai-cells to micfil node
    a1a4d82e99b7 arm64: dts: imx8mm: Add sound-dai-cells to micfil node
    2e79e826233a arm64: dts: imx8mp-debix-model-a: Remove USB hub reset-gpios
    117a07e2e9e2 arm64: dts: imx8qm-ss-img: Fix jpegenc compatible entry
    b0a20843664e clk: scmi: Free scmi_clk allocated when the clocks with invalid info are skipped
    50fc96f3616b ARM: dts: am3517-evm: Fix LED3/4 pinmux
    507d5ffd1af9 firmware: arm_ffa: Allow the FF-A drivers to use 32bit mode of messaging
    90776e2a2f8d firmware: arm_ffa: Assign the missing IDR allocation ID to the FFA device
    128e4aff2c13 arm64: dts: ti: k3-am62a7-sk: Drop i2c-1 to 100Khz
    e1c755a2d0da arm64: dts: ti: k3-am625-beagleplay: Fix typo in ramoops reg
    99639d09f491 firmware: ti_sci: Mark driver as non removable
    2ff42f2d6450 kunit: Fix missed memory release in kunit_free_suite_set()
    3565684309e5 soc: qcom: llcc: Handle a second device without data corruption
    9f388768d380 ARM: dts: qcom: mdm9615: populate vsdcc fixed regulator
    cad2fdf734bc ARM: dts: qcom: apq8026-samsung-matisse-wifi: Fix inverted hall sensor
    895faac163db arm64: dts: qcom: apq8016-sbc: Add missing ADV7533 regulators
    769c5e9d15f6 riscv: dts: allwinner: remove address-cells from intc node
    04be6547e407 arm64: dts: qcom: msm8939: Fix iommu local address range
    f4b77d63a52c arm64: dts: qcom: msm8976: Fix ipc bit shifts
    d71128a962ed ARM64: dts: marvell: cn9310: Use appropriate label for spi1 pins
    19af445c6e45 arm64: dts: qcom: sdm845-mtp: fix WiFi configuration
    a96940caa86a arm64: dts: qcom: sm8350: fix pinctrl for UART18
    27ce256c1f08 arm64: dts: qcom: sm8150: add ref clock to PCIe PHYs
    d1423675ae95 arm64: dts: qcom: sc7280: drop incorrect EUD port on SoC side
    320f5ecb4528 arm64: dts: qcom: qrb2210-rb1: Swap UART index
    732a7b414f99 arm64: dts: qcom: sc7280: Add missing LMH interrupts
    845966edbf49 arm64: dts: qcom: sm6125: Pad APPS IOMMU address to 8 characters
    f9670c979946 arm64: dts: qcom: msm8992-libra: drop duplicated reserved memory
    5a360ea043ec arm64: dts: qcom: msm8916: Fix iommu local address range
    0d28ee4d3034 arm64: dts: qcom: sc7280: link usb3_phy_wrapper_gcc_usb30_pipe_clk
    ad523cd4258b arm64: dts: qcom: sdm845: cheza doesn't support LMh node
    e3d5e71ab28a arm64: dts: qcom: sdm845: Fix PSCI power domain names
    f3531725a243 ARM: dts: renesas: blanche: Fix typo in GP_11_2 pin name
    3405f364f82d perf: hisi: Fix use-after-free when register pmu fails
    3d92672e71d9 drivers/perf: hisi_pcie: Check the type first in pmu::event_init()
    b4a182cd0336 perf/arm-cmn: Fix DTC domain detection
    f0c771695a3f drm/amd/pm: Fix a memory leak on an error path
    3f5827371763 drivers/perf: hisi: use cpuhp_state_remove_instance_nocalls() for hisi_hns3_pmu uninit process
    98812fb0df70 drm: mediatek: mtk_dsi: Fix NO_EOT_PACKET settings/handling
    211267cc420b clocksource/drivers/arm_arch_timer: limit XGene-1 workaround
    57a90fb6ab11 drm/msm/dsi: free TX buffer in unbind
    a4522c7612f3 drm/msm/dsi: use msm_gem_kernel_put to free TX buffer
    2a57291a1131 xen-pciback: Consider INTx disabled when MSI/MSI-X is enabled
    ce60d6cc40fd xenbus: fix error exit in xenbus_init()
    bc27e08ecb09 drm/rockchip: Fix type promotion bug in rockchip_gem_iommu_map()
    1556f041b844 arm64/arm: xen: enlighten: Fix KPTI checks
    0a3d2b736bb9 drm/bridge: lt9611uxc: fix the race in the error path
    4ed0b4b2e49f gpu: host1x: Correct allocated size for contexts
    e30054a351ab drm/rockchip: cdn-dp: Fix some error handling paths in cdn_dp_probe()
    b720a10346a4 accel/habanalabs/gaudi2: Fix incorrect string length computation in gaudi2_psoc_razwi_get_engines()
    5190f8b3cf22 drm/mediatek: Fix iommu fault during crtc enabling
    c34934d7c2e0 drm/mediatek: Fix iommu fault by swapping FBs after updating plane state
    e5c2edb09edd drm/mediatek: Add mmsys_dev_num to mt8188 vdosys0 driver data
    cafff2cfb710 io_uring/kbuf: Allow the full buffer id space for provided buffers
    aabcc4c49967 io_uring/kbuf: Fix check of BID wrapping in provided buffers
    8c18de99dfcc drm/amd/display: Bail from dm_check_crtc_cursor if no relevant change
    7e4702c7b668 drm/amd/display: Refactor dm_get_plane_scale helper
    37289873d183 drm/amd/display: Check all enabled planes in dm_check_crtc_cursor
    97ef07182ac4 drm/amd/display: Fix null pointer dereference in error message
    35a00ee37ab4 drm/amdkfd: Handle errors from svm validate and map
    75800841b2e8 drm/amdkfd: Remove svm range validated_once flag
    96dc6e62eb99 drm/amdkfd: retry after EBUSY is returned from hmm_ranges_get_pages
    68ccd61c8d01 drm/amdkfd: fix some race conditions in vram buffer alloc/free of svm code
    1406172d5b11 drm/amdgpu: Increase IH soft ring size for GFX v9.4.3 dGPU
    84021fa4cf19 drm: Call drm_atomic_helper_shutdown() at shutdown/remove time for misc drivers
    2e6f00e063aa drm/tve200: Convert to platform remove callback returning void
    68da712aa242 drm/stm: Convert to platform remove callback returning void
    813ef38bb98b drm/aspeed: Convert to platform remove callback returning void
    b53575a965c9 drm/bridge: tc358768: Fix tc358768_ns_to_cnt()
    da8168f111ea drm/bridge: tc358768: Clean up clock period code
    194a13ed464a drm/bridge: tc358768: Rename dsibclk to hsbyteclk
    9b7cf64ec8c4 drm/bridge: tc358768: Use dev for dbg prints, not priv->dev
    9ddf3ac09716 drm/bridge: tc358768: Print logical values, not raw register values
    e56561d0354e drm/bridge: tc358768: Use struct videomode
    b85fb1a0721f drm/bridge: tc358768: Fix bit updates
    2ef9177fb721 drm/bridge: tc358768: Fix use of uninitialized variable
    2191950d35d8 x86/tdx: Zero out the missing RSI in TDX_HYPERCALL macro
    0d8a1df39d3f drm/mediatek: Fix coverity issue with unintentional integer overflow
    66e2bbbacaf8 drm/bridge: lt8912b: Add missing drm_bridge_attach call
    07a28632f744 drm/bridge: lt8912b: Manually disable HPD only if it was enabled
    fcd9895e3654 drm/bridge: lt8912b: Fix crash on bridge detach
    dd57f6864a59 drm/bridge: lt8912b: Fix bridge_detach
    1669d7b21a66 drm: bridge: it66121: Fix invalid connector dereference
    d9b4fa249dea drm/radeon: possible buffer overflow
    06a7c295473b drm/rockchip: vop2: Add missing call to crtc reset helper
    dbb193beab88 drm/rockchip: vop2: Don't crash for invalid duplicate_state
    ef76ecd31a81 drm/rockchip: vop: Fix call to crtc reset helper
    bf50a93fdca8 drm/rockchip: vop: Fix reset of state in duplicate state crtc funcs
    8b27fbec3dec drm: bridge: samsung-dsim: Fix waiting for empty cmd transfer FIFO on older Exynos
    7da5a7173ddc drm: bridge: for GENERIC_PHY_MIPI_DPHY also select GENERIC_PHY
    1d714586b36d drm: bridge: samsung-dsim: Initialize ULPS EXIT for i.MX8M DSIM
    97c8e2a7bc1f spi: omap2-mcspi: Fix hardcoded reference clock
    9f236f9f4d0d spi: omap2-mcspi: switch to use modern name
    3c266e619ac8 spi: omap2-mcspi: remove redundant dev_err_probe()
    332973079a2f platform/chrome: cros_ec_lpc: Separate host command and irq disable
    19e557524ded hte: tegra: Fix missing error code in tegra_hte_test_probe()
    2c7c5602622e hwmon: (sch5627) Disallow write access if virtual registers are locked
    0a31b778eed7 hwmon: (sch5627) Use bit macros when accessing the control register
    3c3c2d34a4d5 Revert "hwmon: (sch56xx-common) Add automatic module loading on supported devices"
    e323a3990f65 Revert "hwmon: (sch56xx-common) Add DMI override table"
    4833a85169a6 hwmon: (coretemp) Fix potentially truncated sysfs attribute name
    f62b89698478 hwmon: (axi-fan-control) Fix possible NULL pointer dereference
    6d9ce15c5fa1 regulator: qcom-rpmh: Fix smps4 regulator for pm8550ve
    36d85fa7ae0d platform/x86: wmi: Fix opening of char device
    7298b80337aa platform/x86: wmi: Fix probe failure when failing to register WMI devices
    e6fed83e33af clk: mediatek: fix double free in mtk_clk_register_pllfh()
    63d552f9dae8 clk: qcom: ipq5332: drop the CLK_SET_RATE_PARENT flag from GPLL clocks
    6f6ea5133aba clk: qcom: ipq9574: drop the CLK_SET_RATE_PARENT flag from GPLL clocks
    3731eb54fbef clk: qcom: apss-ipq-pll: Fix 'l' value for ipq5332_pll_config
    5b6384ed71dc clk: qcom: apss-ipq-pll: Use stromer plus ops for stromer plus pll
    3015361a505d clk: qcom: clk-alpha-pll: introduce stromer plus ops
    ddaada8cc4d2 clk: qcom: config IPQ_APSS_6018 should depend on QCOM_SMEM
    e61934720af4 clk: mediatek: clk-mt2701: Add check for mtk_alloc_clk_data
    1d89430fc315 clk: mediatek: clk-mt7629: Add check for mtk_alloc_clk_data
    b20cfe007a46 clk: mediatek: clk-mt7629-eth: Add check for mtk_alloc_clk_data
    be3f12f16038 clk: mediatek: clk-mt6797: Add check for mtk_alloc_clk_data
    a90239551abc clk: mediatek: clk-mt6779: Add check for mtk_alloc_clk_data
    10cc81124407 clk: mediatek: clk-mt6765: Add check for mtk_alloc_clk_data
    a9e4a47f89d9 clk: npcm7xx: Fix incorrect kfree
    ba88f032ff9f clk: ti: fix double free in of_ti_divider_clk_setup()
    67ee360e138c clk: keystone: pll: fix a couple NULL vs IS_ERR() checks
    2e4db0148cb2 clk: ralink: mtmips: quiet unused variable warning
    99bb148bd565 spi: nxp-fspi: use the correct ioremap function
    da164c3c4a2f clk: linux/clk-provider.h: fix kernel-doc warnings and typos
    55de4ff94fb4 clk: renesas: rzg2l: Fix computation formula
    7fdb4ef9812a clk: renesas: rzg2l: Use FIELD_GET() for PLL register fields
    4be4c8e224f9 clk: renesas: rzg2l: Trust value returned by hardware
    5cb18d032293 clk: renesas: rzg2l: Lock around writes to mux register
    8afb9e94e3a9 clk: renesas: rzg2l: Wait for status bit of SD mux before continuing
    40d3370bf2c0 clk: renesas: rcar-gen3: Extend SDnH divider table
    cebb0fe4aa9a clk: imx: imx8qxp: Fix elcdif_pll clock
    b2931c28e1f5 clk: imx: imx8mq: correct error handling path
    fbbcc60999c0 clk: imx: Select MXC_CLK for CLK_IMX8QXP
    3d0eb456567e regulator: mt6358: Fail probe on unknown chip ID
    a3c73486e80e clk: qcom: gcc-sm8150: Fix gcc_sdcc2_apps_clk_src
    efa39c1e151e clk: qcom: mmcc-msm8998: Fix the SMMU GDSC
    08f003231c36 clk: qcom: mmcc-msm8998: Don't check halt bit on some branch clks
    22de7cb08bc6 clk: qcom: clk-rcg2: Fix clock rate overflow for high parent frequencies
    db96de8d8d4a clk: qcom: gcc-msm8996: Remove RPM bus clocks
    577165aa4989 clk: qcom: ipq5332: Drop set rate parent from gpll0 dependent clocks
    4eb8065494ca spi: tegra: Fix missing IRQ check in tegra_slink_probe()
    80a5d81d4cd2 regmap: debugfs: Fix a erroneous check after snprintf()
    a043d6210114 ipvlan: properly track tx_errors
    1589a9ab2566 net: add DEV_STATS_READ() helper
    d2683d7e949b virtio_net: use u64_stats_t infra to avoid data-races
    1c3b6106b64f ipv6: avoid atomic fragment on GSO packets
    cd524da2cb0a mptcp: properly account fastopen data
    729c4521d976 ACPI: sysfs: Fix create_pnp_modalias() and create_of_modalias()
    978f0f776d68 bpf: Fix unnecessary -EBUSY from htab_lock_bucket
    49e30526fa4d Bluetooth: hci_sync: Fix Opcode prints in bt_dev_dbg/err
    e9f708beada5 Bluetooth: Make handle of hci_conn be unique
    cfe86064f3b2 Bluetooth: ISO: Pass BIG encryption info through QoS
    c03a10bd5b6c Bluetooth: ISO: Use defer setup to separate PA sync and BIG sync
    2dae48035862 wifi: iwlwifi: empty overflow queue during flush
    23afa6598cf9 wifi: iwlwifi: mvm: update IGTK in mvmvif upon D3 resume
    e8e2baaee4cb wifi: iwlwifi: pcie: synchronize IRQs before NAPI
    3cccddd70eb0 wifi: iwlwifi: mvm: fix netif csum flags
    e03348361533 wifi: iwlwifi: increase number of RX buffers for EHT devices
    b78cbb0236cf wifi: iwlwifi: mvm: remove TDLS stations from FW
    9c3bd60f393b wifi: iwlwifi: mvm: fix iwl_mvm_mac_flush_sta()
    dbe89643a5cf wifi: iwlwifi: mvm: change iwl_mvm_flush_sta() API
    8ddf2212cfa5 wifi: iwlwifi: mvm: Don't always bind/link the P2P Device interface
    6ff7022af4f9 wifi: iwlwifi: mvm: Fix key flags for IGTK on AP interface
    67abefa1b6a2 wifi: iwlwifi: mvm: Correctly set link configuration
    85998fb855d5 wifi: iwlwifi: yoyo: swap cdb and jacket bits values
    a989fe88b4da wifi: mac80211: Fix setting vif links
    fb506ef6073c wifi: mac80211: don't recreate driver link debugfs in reconfig
    8bb8769a5be4 wifi: iwlwifi: mvm: use correct sta ID for IGTK/BIGTK
    02b4f94db6a9 wifi: iwlwifi: mvm: fix removing pasn station for responder
    eec6e3a038f2 wifi: iwlwifi: mvm: update station's MFP flag after association
    a37178ca64e5 tcp: fix cookie_init_timestamp() overflows
    5a8444edba46 chtls: fix tp->rcv_tstamp initialization
    3ea25904699d thermal: core: Don't update trip points inside the hysteresis range
    25fb2d77d864 net: skb_find_text: Ignore patterns extending past 'to'
    ddd13ab729e8 selftests: netfilter: test for sctp collision processing in nf_conntrack
    36b6a910966a bpf: Fix missed rcu read lock in bpf_task_under_cgroup()
    0e26bd87a123 thermal/drivers/mediatek: Fix probe for THERMAL_V2
    8c38926925e6 r8169: fix rare issue with broken rx after link-down on RTL8125
    0f6b3be28c4d thermal: core: prevent potential string overflow
    1a33a7eed322 wifi: rtw88: Remove duplicate NULL check before calling usb_kill/free_urb()
    6809ededee0c netfilter: nf_tables: Drop pointless memset when dumping rules
    564f5b55c491 wifi: wfx: fix case where rates are out of order
    adf59b43d1c1 PM / devfreq: rockchip-dfi: Make pmu regmap mandatory
    53c468008a7c can: dev: can_put_echo_skb(): don't crash kernel if can_priv::echo_skb is accessed out of bounds
    b20ffe03852c can: dev: can_restart(): fix race condition between controller restart and netif_carrier_on()
    e999bb83bc24 can: dev: can_restart(): don't crash kernel if carrier is OK
    aecdee9ea305 wifi: ath11k: fix Tx power value during active CAC
    6c8a21833542 can: etas_es58x: add missing a blank line after declaration
    a7c770dad30d can: etas_es58x: rework the version check logic to silence -Wformat-truncation
    6fefd3a91f9d ACPI: video: Add acpi_backlight=vendor quirk for Toshiba Portégé R100
    3c243765ecff ACPI: property: Allow _DSD buffer data only for byte accessors
    dc40d464a6e2 wifi: rtlwifi: fix EDCA limit set by BT coexistence
    033ea0297afa tcp_metrics: do not create an entry from tcp_init_metrics()
    9b248b297c5d tcp_metrics: properly set tp->snd_ssthresh in tcp_init_metrics()
    f49ce3b36f19 tcp_metrics: add missing barriers on delete
    1946b7ee4639 wifi: ath: dfs_pattern_detector: Fix a memory initialization issue
    0137d53ad903 wifi: mt76: mt7915: fix beamforming availability check
    c8cbbafb9257 wifi: mt76: fix per-band IEEE80211_CONF_MONITOR flag comparison
    a3974410431a wifi: mt76: get rid of false alamrs of tx emission issues
    53680becbf98 wifi: mt76: fix potential memory leak of beacon commands
    0e39acefbd81 wifi: mt76: update beacon size limitation
    9876a27f8bab wifi: mt76: mt7996: fix TWT command format
    03b551ea5793 wifi: mt76: mt7996: fix rx rate report for CBW320-2
    919eb49073ad wifi: mt76: mt7996: fix wmm queue mapping
    85670c859798 wifi: mt76: mt7996: fix beamformee ss subfield in EHT PHY cap
    c3bcca36485f wifi: mt76: mt7996: fix beamform mcu cmd configuration
    0f646b7673c5 wifi: mt76: mt7996: set correct wcid in txp
    c2deba4c5d44 wifi: mt76: remove unused error path in mt76_connac_tx_complete_skb
    d8633bde468c wifi: mt76: connac: move connac3 definitions in mt76_connac3_mac.h
    c67c80221728 wifi: mt76: mt7603: improve stuck beacon handling
    f65f47ebd64a wifi: mt76: mt7603: improve watchdog reset reliablity
    33f73d154e4e wifi: mt76: mt7603: rework/fix rx pse hang check
    9c6b20fd5e8d cpufreq: tegra194: fix warning due to missing opp_put
    e6db756dea7e PM: sleep: Fix symbol export for _SIMPLE_ variants of _PM_OPS()
    57ec37162d91 wifi: mac80211: fix check for unusable RX result
    5a9f55efa933 wifi: ath11k: fix boot failure with one MSI vector
    c58a1ed71752 wifi: ath12k: fix DMA unmap warning on NULL DMA address
    002835b8594c wifi: rtw88: debug: Fix the NULL vs IS_ERR() bug for debugfs_create_file()
    c4d57007947b net: ethernet: mtk_wed: fix EXT_INT_STATUS_RX_FBUF definitions for MT7986 SoC
    2996a509c0c9 net: spider_net: Use size_add() in call to struct_size()
    26ff419dfd91 tipc: Use size_add() in calls to struct_size()
    7c13d9cce81b tls: Use size_add() in call to struct_size()
    d648260e44a2 mlxsw: Use size_mul() in call to struct_size()
    3f7955a902d8 gve: Use size_add() in call to struct_size()
    1e5788c94e97 bpf: Fix kfunc callback register type handling
    71b468c11ac2 tcp: call tcp_try_undo_recovery when an RTOd TFO SYNACK is ACKed
    861279e5fce0 selftests/bpf: Skip module_fentry_shadow test when bpf_testmod is not available
    91df7ecb5e7d udplite: fix various data-races
    ab764daadadd udplite: remove UDPLITE_BIT
    645d838018f7 udp: annotate data-races around udp->encap_type
    b92fd3e60d7d udp: lockless UDP_ENCAP_L2TPINUDP / UDP_GRO
    f3c11d077a5f udp: move udp->accept_udp_{l4|fraglist} to udp->udp_flags
    f835f0c6252c udp: add missing WRITE_ONCE() around up->encap_rcv
    71e5417cee0f udp: move udp->gro_enabled to udp->udp_flags
    d18aa214b26a udp: move udp->no_check6_rx to udp->udp_flags
    06073e04aeec udp: move udp->no_check6_tx to udp->udp_flags
    f0fe1abb2826 udp: introduce udp->udp_flags
    c7072b00bd09 wifi: cfg80211: fix kernel-doc for wiphy_delayed_work_flush()
    028480eaf2a1 bpf, x64: Fix tailcall infinite loop
    8d650d035ac7 bpf, x86: allow function arguments up to 12 for TRACING
    3953ef4ca975 bpf, x86: save/restore regs with BPF_DW size
    dbb56575b86f selftests/bpf: Correct map_fd to data_fd in tailcalls
    dadda161609c iavf: Fix promiscuous mode configuration flow messages
    e381bf9edc9b i40e: fix potential memory leaks in i40e_remove()
    446d03186fe9 wifi: iwlwifi: don't use an uninitialized variable
    6313926b3e32 wifi: iwlwifi: honor the enable_ini value
    ebda7f6fe90a wifi: mac80211: fix # of MSDU in A-MSDU calculation
    fc658d36928d wifi: cfg80211: fix off-by-one in element defrag
    13455e5b9864 wifi: mac80211: fix RCU usage warning in mesh fast-xmit
    0d7d812fcfde wifi: mac80211: move sched-scan stop work to wiphy work
    f293f4ebcbdc wifi: mac80211: move offchannel works to wiphy work
    63aa1a0fa677 wifi: mac80211: move scan work to wiphy work
    8eb0012a0936 wifi: mac80211: move radar detect work to wiphy work
    a591a106f36c wifi: cfg80211: add flush functions for wiphy work
    364816d0c5d2 wifi: ath12k: fix undefined behavior with __fls in dp
    982ea0aa2bc5 irqchip/sifive-plic: Fix syscore registration for multi-socket systems
    a979a1cc9aea genirq/matrix: Exclude managed interrupts in irq_matrix_allocated()
    4410c1bc4868 string: Adjust strtomem() logic to allow for smaller sources
    728835dc03a3 PCI/MSI: Provide stubs for IMS functions
    9e1d81681317 selftests/x86/lam: Zero out buffer for readlink()
    414d48289cd0 perf: Optimize perf_cgroup_switch()
    1c426da79f9f pstore/platform: Add check for kstrdup
    d15950c49046 x86/nmi: Fix out-of-order NMI nesting checks & false positive warning
    d3dd62fcfa6b drivers/clocksource/timer-ti-dm: Don't call clk_get_rate() in stop function
    8152efcae888 srcu: Fix callbacks acceleration mishandling
    b427ae0ccf13 x86/apic: Fake primary thread mask for XEN/PV
    efd6e0851071 cpu/SMT: Make SMT control more robust against enumeration failures
    15141adf85b1 cpu/SMT: Create topology_smt_thread_allowed()
    2909a6404460 cpu/hotplug: Remove dependancy against cpu_primary_thread_mask
    147a1ba15c5f x86/boot: Fix incorrect startup_gdt_descr.size
    c87f1c452ca1 x86/sev-es: Allow copy_from_kernel_nofault() in earlier boot
    b776e9161ab6 ACPI/NUMA: Apply SRAT proximity domain to entire CFMWS window
    9011702db2c7 x86/numa: Introduce numa_fill_memblks()
    5c758ec2f5b1 futex: Don't include process MM in futex key on no-MMU
    9c39fa2992c3 x86/srso: Fix unret validation dependencies
    e310a2eb785f x86/srso: Fix vulnerability reporting for missing microcode
    1f7f6ef03896 x86/srso: Print mitigation for retbleed IBPB case
    68f9ff154168 x86/srso: Fix SBPB enablement for (possible) future fixed HW
    6ef3d8bed0cb writeback, cgroup: switch inodes with dirty timestamps to release dying cgwbs
    e1d6675d4baf vfs: fix readahead(2) on block devices
    3aa811a186df nfsd: Handle EOPENSTALE correctly in the filecache
    ef90e6ef5cb4 sched: Fix stop_one_cpu_nowait() vs hotplug
    761c20be2c45 objtool: Propagate early errors
    311485482fa4 sched/uclamp: Ignore (util == 0) optimization in feec() when p_util_max = 0
    f4988493495f sched/uclamp: Set max_spare_cap_cpu even if max_spare_cap is 0
    126e7873d4e7 iov_iter, x86: Be consistent about the __user tag on copy_mc_to_user()
    1ba876f33d96 sched/fair: Fix cfs_rq_is_decayed() on !SMP
    107688f52ae3 sched/topology: Fix sched_numa_find_nth_cpu() in non-NUMA case
    e213ce7956cd sched/topology: Fix sched_numa_find_nth_cpu() in CPU-less case
    5efa13258d8f numa: Generalize numa_map_to_online_node()
    ef041fcee0bf hwmon: (nct6775) Fix incorrect variable reuse in fan_div calculation

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d4fc2c7ff53db1b914b9830a71f8fab5e2a27254)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.5.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.5.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.5.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
index 0e64802f6a..1a0107aa7c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a4872c458c13becaa620d5d566627be6c1c96110"
-SRCREV_meta ?= "8368cc1f9d0a6f8681602a918746df3b3932bad6"
+SRCREV_machine ?= "6c68332cd558b8d3ec194abb9d0cdc7324c668f3"
+SRCREV_meta ?= "7ff7145071562b060dedb7a7805958a31e5f0ba3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.5;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.5.11"
+LINUX_VERSION ?= "6.5.12"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
index 1be3186309..8766ffd218 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.5.inc
 
-LINUX_VERSION ?= "6.5.11"
+LINUX_VERSION ?= "6.5.12"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "ddd6dc84db4e5db7a0fee112cc7b1a52995e81e8"
-SRCREV_meta ?= "8368cc1f9d0a6f8681602a918746df3b3932bad6"
+SRCREV_machine ?= "c4b1d3779649c9e212fe516dcecc9d674402f1b6"
+SRCREV_meta ?= "7ff7145071562b060dedb7a7805958a31e5f0ba3"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.5.bb b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
index 2ac3bc6afe..abd9b28249 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.5/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.5/standard/base"
 KBRANCH:qemumips64 ?= "v6.5/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "650162631e214a1f5dd07566245df299ee89f2c3"
-SRCREV_machine:qemuarm64 ?= "2618fc22ebc89c444e2b9b7647ca56e20ddc54f2"
-SRCREV_machine:qemuloongarch64 ?= "74791bad5376c0b615bb1c68026dc826c2405483"
-SRCREV_machine:qemumips ?= "b087920fa750313ed71e34ae39bf03c53d3308dc"
-SRCREV_machine:qemuppc ?= "ffcbdde1cfbbc800ee89ab53918a04e190cc586a"
-SRCREV_machine:qemuriscv64 ?= "74791bad5376c0b615bb1c68026dc826c2405483"
-SRCREV_machine:qemuriscv32 ?= "74791bad5376c0b615bb1c68026dc826c2405483"
-SRCREV_machine:qemux86 ?= "74791bad5376c0b615bb1c68026dc826c2405483"
-SRCREV_machine:qemux86-64 ?= "74791bad5376c0b615bb1c68026dc826c2405483"
-SRCREV_machine:qemumips64 ?= "367dfdd491f461fb94db8463c443007669b64a65"
-SRCREV_machine ?= "74791bad5376c0b615bb1c68026dc826c2405483"
-SRCREV_meta ?= "8368cc1f9d0a6f8681602a918746df3b3932bad6"
+SRCREV_machine:qemuarm ?= "9b735951de2e2d7697beac1258bfc05232213339"
+SRCREV_machine:qemuarm64 ?= "652142e0a8372f0df82300ee97a441b5bb26ee17"
+SRCREV_machine:qemuloongarch64 ?= "2e8b8729afa122ecdf4e0555f5c650782ee6d48c"
+SRCREV_machine:qemumips ?= "6a36d582f1d415abac7c73701d1554f2b1e3c789"
+SRCREV_machine:qemuppc ?= "f95f50a6507d1c6a82bcd30bde6613dedf52b6b7"
+SRCREV_machine:qemuriscv64 ?= "2e8b8729afa122ecdf4e0555f5c650782ee6d48c"
+SRCREV_machine:qemuriscv32 ?= "2e8b8729afa122ecdf4e0555f5c650782ee6d48c"
+SRCREV_machine:qemux86 ?= "2e8b8729afa122ecdf4e0555f5c650782ee6d48c"
+SRCREV_machine:qemux86-64 ?= "2e8b8729afa122ecdf4e0555f5c650782ee6d48c"
+SRCREV_machine:qemumips64 ?= "972de1c66fa87eaba9d55fa27803a46b7441abe2"
+SRCREV_machine ?= "2e8b8729afa122ecdf4e0555f5c650782ee6d48c"
+SRCREV_meta ?= "7ff7145071562b060dedb7a7805958a31e5f0ba3"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "799441832db16b99e400ccbec55db801e6992819"
+SRCREV_machine:class-devupstream ?= "fa1be4637aadf1116091ddc508ad594ff021942f"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.5/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.5;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.5.11"
+LINUX_VERSION ?= "6.5.12"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


