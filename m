Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F632D1CDDA
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 04:30:42 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35241.1764822641743032096
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 20:30:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lMkbcE4t;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-882399d60baso3965356d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 20:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764822641; x=1765427441; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ET1nEIDBHijKjQYB3vqWaRZCq2EhiATdcl11G5QQKHw=;
        b=lMkbcE4tC5oUMeOV+Sxtz2NFid/OcKoyqMSYmwY+gR39lQoUKutlb7zoerGhkOKt56
         TalqPYRavydiYyHxJfY7YPGC609Q39wgxVF1NoHO86rtaUbTl7m/qAjXkh6XlT6VxCtD
         ZcMS7l9yV0uKRZbhkFwky4MFv/tKY5EN5sDUeZVpRjTxugDfG1C7k/e0snO8O9BBmgxP
         9fu3OJOp8PrmXkG+AgZc/3zJz0AnY58T2zcfQmlK1iPYmT1O+cLbruVMEeI1kJ2Z6VYt
         LR6teGz6YGTiL7fqZZRwCni8GnkrlOKYSYlnYHxsJbRUBxRDIjTSM+pG4mCMnV+iTY7v
         QnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764822641; x=1765427441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ET1nEIDBHijKjQYB3vqWaRZCq2EhiATdcl11G5QQKHw=;
        b=SGUJOBo5mw6s9odWKfktom/q1BoZ/me7AdKP4Mobn0sQfOaEfVas2j17kvKXQONmpT
         Ormns8tGki1iN3BcCAKsjSQyTAeWDoibkyr/6i/usk0P9Pbymy3VbmOA2rufhdYbIfb2
         RtPc1A2wOWi97exRIUpJxMNTo91moka++gnZ1CbCJRrqIA59LR+1KkqYMvhJQ54Hi7Zv
         puhwsucJGvFJ0+M2InHh9gkMkhQGySqTZ/chdBMKnLibHu3fAaFc7FXK0aOIto2UlqfI
         BHpfCG9Ts+79bMDhDhZQMxd14u6gh8bj6uOnfcnx58+tgr4HYIaCsazPTI0VyEvC4yk/
         KJjQ==
X-Gm-Message-State: AOJu0YxOqZo3zPfJ35tZYI4lV/3fFlNADh8TNEfjut7e1JQxhvE4lCFt
	u8Z75PEt103iZhnONO/mm2grdaVWktFdHdZ4J9rhobq927BIYDeGlAMHUsO8g8Cyfw4=
X-Gm-Gg: ASbGncv+XxqVaFWjJovBTggtxHDMkPTaEHctQUelRlkht95tLPUreLAi4FZu1VO+/Vf
	+XsAXTdh8Kr3+2PKRLGLNBXdo8gZkgTvkUbu/p/XJE4//n1fzWqepUcaYBb4V66TUHxO6TJnnp8
	bRdAZheqTyQTo1Z2soMqbgfGkGYF6JGRaPeWPnPQP2GdT8hvC5qCO2Rc01hb0uLWGiHJuoNVl7X
	pQgh48UjAlH/cHReA/293wYxA7CJs+I/TzxhgP2ZIfWH9gdgb1GPwvCVqD0gYQRKMc/AQ1rAu2F
	1ZzyWfYcsSGjxPWhkbiqdBtlD4nj76INVvqAXPcGOaw88bezR0ybHcEOmpTNEWSCQQwZhkRN81L
	XNN92C8SKm8Lv4R5sBo0Ow85PNM/DO/YWVhrCwny/FE/ZUonTJKDaMX8L3doSPRWSpt8ViPXbDe
	GA+FqenqQsGOQrlNHStHlnthPrHlUqr8xZdFj3XJinE7Ej7Mh0ttyStDP5FVI40t4w+1Q0bMNLw
	veEUpNrHTFdq2E=
X-Google-Smtp-Source: AGHT+IFt98SZ3ZEh0KQ+KHOZ7m4Omxd3tis40epYRR2+BbmEdVw9nE32vktWsrsTinBFHLCAwJm9TA==
X-Received: by 2002:a05:6214:398c:b0:880:638f:1a1e with SMTP id 6a1803df08f44-888248b54b7mr32333146d6.46.1764822640402;
        Wed, 03 Dec 2025 20:30:40 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88827f3347asm3191476d6.6.2025.12.03.20.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 20:30:39 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/16] linux-yocto/6.17: update to v6.17.10
Date: Wed,  3 Dec 2025 23:30:19 -0500
Message-Id: <5867fae5f92a1e7a909ec68ec8a2aca77be33374.1764822465.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1764822465.git.bruce.ashfield@gmail.com>
References: <cover.1764822465.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 04:30:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227258

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.17 to the latest korg -stable release that comprises
the following commits:

    ae593cd8579f0 Linux 6.17.10
    d45e929de0899 Revert "gpio: swnode: don't use the swnode's name as the key for GPIO lookup"
    4a4abb0f9660d sched_ext: fix flag check for deferred callbacks
    18228a70a01a4 sched_ext: Fix scx_kick_pseqs corruption on concurrent scheduler loads
    f1ad80fdf97b6 drm/i915/dp: Add device specific quirk to limit eDP rate to HBR2
    a6d47b0415810 Revert "drm/i915/dp: Reject HBR3 when sink doesn't support TPS4"
    5dc95f897d06f tty/vt: fix up incorrect backport to stable releases
    82120feecc7b8 drm/amd/display: Prevent Gating DTBCLK before It Is Properly Latched
    b3f28536a80e9 drm/amd/display: Insert dccg log for easy debug
    f7d953c38245c mptcp: fix address removal logic in mptcp_pm_nl_rm_addr
    81a8685cac4bf xfs: fix out of bounds memory read error in symlink repair
    fd6f9919efb4c xfs: Replace strncpy with memcpy
    3e1c43f14521c drm/amdgpu/jpeg: Add parse_cs for JPEG5_0_1
    641b58475afa2 drm/amdgpu/jpeg: Move parse_cs to amdgpu_jpeg.c
    adef931448067 drm/i915/dp_mst: Disable Panel Replay
    cd1aa3e40297c drm/i915/psr: Check drm_dp_dpcd_read return value on PSR dpcd init
    abd29b6e17a91 smb: client: fix incomplete backport in cfids_invalidation_worker()
    eef72d856f978 drm/amdgpu: fix gpu page fault after hibernation on PF passthrough
    7c2a888605b55 btrfs: set inode flag BTRFS_INODE_COPY_EVERYTHING when logging new name
    31eb7a8cec4c6 tracing/tools: Fix incorrcet short option in usage text for --threads
    f9608637ecc16 net: ethernet: ti: netcp: Standardize knav_dma_open_channel to return NULL on error
    b712f234a74c1 scsi: ufs: ufs-qcom: Fix UFS OCP issue during UFS power down (PC=3)
    fdc4d949db22b ALSA: usb-audio: fix uac2 clock source at terminal parser
    4a6f3dff466c8 drm/xe: Prevent BIT() overflow when handling invalid prefetch region
    7f04be008810e kconfig/nconf: Initialize the default locale at startup
    37fc080dec2f5 kconfig/mconf: Initialize the default locale at startup
    89f5f760dcf70 x86/CPU/AMD: Extend Zen6 model range
    2df89d7976190 net: tls: Cancel RX async resync request on rcd_delta overflow
    ede502101fc5d blk-crypto: use BLK_STS_INVAL for alignment errors
    732a71a923a99 net: tls: Change async resync helpers argument
    baeb52ced7318 selftests: net: use BASH for bareudp testing
    7a6df899c2310 smb: client: handle lack of IPC in dfs_cache_refresh()
    9fc7721ed0fce selftests: cachestat: Fix warning on declaration under label
    7b719a57ad0ee x86/microcode/AMD: Limit Entrysign signature checking to known generations
    560292ae3e76b perf/x86/intel/uncore: Add uncore PMU support for Wildcat Lake
    d765389faa297 ALSA: hda/realtek: Fix mute led for HP Victus 15-fa1xxx (MB 8C2D)
    e208fb1660c4a scsi: core: Fix a regression triggered by scsi_host_busy()
    d953e53c9315f cifs: fix typo in enable_gcm_256 module parameter
    7263caac01826 ASoC: rt721: fix prepare clock stop failed
    b865da18b6cb8 drm/msm: Fix pgtable prealloc error path
    f39659da573a8 sched_ext: defer queue_balance_callback() until after ops.dispatch
    047d8f4b620d1 bcma: don't register devices disabled in OF
    15e2041a97ed5 sched_ext: Allocate scx_kick_cpus_pnt_seqs lazily using kvzalloc()
    68b09d5111da9 ALSA: hda/realtek: Add quirk for Lenovo Yoga 7 2-in-1 14AKP10
    4386c200711b3 MIPS: kernel: Fix random segmentation faults
    0bd5502efdab2 timekeeping: Fix resource leak in tk_aux_sysfs_init() error paths
    ab6b19f690d89 vsock: Ignore signal/timeout on connect() if already established
    66c3a3ea465fb perf: Fix 0 count issue of cpu-clock
    37010021d7e03 cifs: fix memory leak in smb3_fs_context_parse_param error path
    b942b5b2693ab LoongArch: Use UAPI types in ptrace UAPI header
    67e44bba51dfb tick/sched: Fix bogus condition in report_idle_softirq()
    d9fa287f92eb7 net: phylink: add missing supported link modes for the fixed-link
    dccc6daa8afa0 gpio: cdev: make sure the cdev fd is still active before emitting events
    24feb40010506 af_unix: Read sk_peek_offset() again after sleeping in unix_stream_read_generic().
    4d6b4bea8b80b net/mlx5: Clean up only new IRQ glue on request_irq() failure
    542f45486f1ce devlink: rate: Unset parent pointer in devl_rate_nodes_destroy
    87cd3b57ad635 pinctrl: s32cc: initialize gpio_pin_config::list after kmalloc()
    7bbdd6c30e8fd pinctrl: s32cc: fix uninitialized memory in s32_pinctrl_desc
    765236f2c4fbb ice: fix PTP cleanup on driver removal in error path
    d5be8663cff0b idpf: fix possible vport_config NULL pointer deref in remove
    548071cbd81aa drm/xe/irq: Handle msix vector0 interrupt
    123d4cc167bae drm/xe/kunit: Fix forcewake assertion in mocs test
    5d60c61d6db1b drm/i915/xe3: Restrict PTL intel_encoder_is_c10phy() to only PHY A
    1e83ae5df21a0 drm/i915/display: Add definition for wcl as subplatform
    265a5be71e266 drm/pcids: Split PTL pciids group to make wcl subplatform
    e441db07f2081 net: qlogic/qede: fix potential out-of-bounds read in qede_tpa_cont() and qede_tpa_end()
    db7b8773eb0e5 platform/x86: intel-uncore-freq: fix all header kernel-doc warnings
    1d9ea42f5b1bb platform/x86/intel/speed_select_if: Convert PCIBIOS_* return codes to errnos
    f0e2a04f0fd09 net: airoha: Do not loopback traffic to GDM2 if it is available on the device
    0243034486355 net: airoha: Add wlan flowtable TX offload
    f0fb86d427e10 selftests: net: lib: Do not overwrite error messages
    7ff76f8dc6b55 s390/ctcm: Fix double-kfree
    fc13b6c92761d drm/i915/xe3lpd: Load DMC for Xe3_LPD version 30.02
    b03eb63288a8f nvme-multipath: fix lockdep WARN due to partition scan work
    f9b222bda5965 nvmet-auth: update sc_c in target host hash calculation
    6db49f6a2e80c tools: riscv: Fixed misalignment of CSR related definitions
    6c8a8b9257a66 veth: more robust handing of race to avoid txq getting stuck
    4689ba45296db net: openvswitch: remove never-working support for setting nsh fields
    ffaa32216604c net: mlxsw: linecards: fix missing error check in mlxsw_linecard_devlink_info_get()
    3e4306dc9e474 net: dsa: hellcreek: fix missing error handling in LED registration
    27ea5c2c75c34 drm/tegra: Add call to put_pid()
    c0ab757b86402 mlxsw: spectrum: Fix memory leak in mlxsw_sp_flower_stats()
    8817f816ae419 net: core: prevent NULL deref in generic_hwtstamp_ioctl_lower()
    958ca19e8d628 mips: dts: econet: fix EN751221 core type
    78f10294683a0 platform/x86: msi-wmi-platform: Fix typo in WMI GUID
    e45172b353dbd platform/x86: msi-wmi-platform: Only load on MSI devices
    d7adbba9298fd pinctrl: cirrus: Fix fwnode leak in cs42l43_pin_probe()
    f8bd0d6eb6315 xfrm: Prevent locally generated packets from direct output in tunnel mode
    6e36af80ad8ef xfrm: Determine inner GSO type from packet inner protocol
    da6f9c14d299c xfrm: Check inner packet family directly from skb_dst
    ffab2ceaf095d pinctrl: realtek: Select REGMAP_MMIO for RTD driver
    290939cf0a9fa clk: sunxi-ng: sun55i-a523-ccu: Lower audio0 pll minimum rate
    ad6fcccc4eed9 clk: sunxi-ng: sun55i-a523-r-ccu: Mark bus-r-dma as critical
    4f2525a05ba00 clk: sunxi-ng: Mark A523 bus-r-cpucfg clock as critical
    e2aa2db2a1771 xfrm: set err and extack on failure to create pcpu SA
    06ccae7bace4d xfrm: call xfrm_dev_state_delete when xfrm_state_migrate fails to add the state
    d6fe5c740c573 xfrm: also call xfrm_state_delete_tunnel at destroy time for states that were never added
    041de1f9bcf44 xfrm: drop SA reference in xfrm_state_update if dir doesn't match
    f74c521768576 pinctrl: mediatek: mt8189: align register base names to dt-bindings ones
    eaf952dc53146 pinctrl: mediatek: mt8196: align register base names to dt-bindings ones
    5e4f2caf39a6b mm/truncate: unmap large folio on split failure
    aed494225be85 drm/amd/display: Clear the CUR_ENABLE register on DCN20 on DPP5
    18030e84cbda0 drm/amd/display: Fix pbn to kbps Conversion
    364ce6bb93292 drm/amd/display: Move sleep into each retry for retrieve_link_cap()
    5266f825a631b drm/amd/display: Increase DPCD read retries
    9c03896ec657d drm/amdgpu: Skip emit de meta data on gfx11 with rs64 enabled
    9539c00f44033 drm/amd: Skip power ungate during suspend for VPE
    860f93f4fce1e drm/plane: Fix create_in_format_blob() return value
    7e3e9b3a44c23 drm/radeon: delete radeon_fence_process in is_signaled, no deadlock
    5c0fd637547d8 drm/tegra: dc: Fix reference leak in tegra_dc_couple()
    51667e623da0f mptcp: do not fallback when OoO is present
    5d18a8969116e mptcp: decouple mptcp fastclose from tcp close
    7731ebbb499d7 mptcp: avoid unneeded subflow-level drops
    1f588398aece1 selftests: mptcp: join: userspace: longer timeout
    e44c5f4e039ae selftests: mptcp: join: endpoints: longer timeout
    29e7f19658451 mptcp: fix premature close in case of fallback
    c4f7b0916b95f mptcp: fix duplicate reset on fastclose
    0b7161eaecd7a mptcp: fix ack generation for fallback msk
    bbbd75346c8e6 mptcp: fix a race in mptcp_pm_del_add_timer()
    3fc7723ed01d1 mptcp: fix race condition in mptcp_schedule_work()
    424f5097f2e03 platform/x86: alienware-wmi-wmax: Add AWCC support to Alienware 16 Aurora
    e83e877bd3d15 platform/x86: alienware-wmi-wmax: Add support for the whole "G" family
    cfcb35ee0d4d7 platform/x86: alienware-wmi-wmax: Add support for the whole "X" family
    359e196aee83d platform/x86: alienware-wmi-wmax: Add support for the whole "M" family
    8bb12e8f05877 platform/x86: alienware-wmi-wmax: Fix "Alienware m16 R1 AMD" quirk order
    95aa37aee4c07 LoongArch: Fix NUMA node parsing with numa_memblks
    7e7b4fff05cd5 LoongArch: Don't panic if no valid cache info for PCI
    44eb3849378be LoongArch: BPF: Disable trampoline for kernel module function trace
    64f2162d29307 dt-bindings: pinctrl: toshiba,visconti: Fix number of items in groups
    f4ebce622e14e MIPS: Malta: Fix !EVA SOC-it PCI MMIO
    13aff3b8a7184 scsi: target: tcm_loop: Fix segfault in tcm_loop_tpg_address_show()
    6983d8375c040 scsi: sg: Do not sleep in atomic context
    625e173e2a59b sched_ext: Fix scx_enable() crash on helper kthread creation failure
    3bb37d29e01d5 PM: sleep: core: Fix runtime PM enabling in device_resume_early()
    fbd5741a556ea nvme: nvme-fc: Ensure ->ioerr_work is cancelled in nvme_fc_delete_ctrl()
    0d1840b2dd8fe nvme: nvme-fc: move tagset removal to nvme_fc_delete_ctrl()
    2bba02a39bfb3 nouveau/firmware: Add missing kfree() of nvkm_falcon_fw::boot
    a79e49e170436 mm/mempool: fix poisoning order>0 pages with HIGHMEM
    763c3f4d2394a Input: pegasus-notetaker - fix potential out-of-bounds access
    6524a15d33951 Input: imx_sc_key - fix memory corruption on unload
    6a88d05de5fef Input: goodix - add support for ACPI ID GDIX1003
    2d251c15c27e2 Input: cros_ec_keyb - fix an invalid memory access
    7a41d0e5f3050 Revert "drm/tegra: dsi: Clear enable register if powered by bootloader"
    aeee1f146f090 net: dsa: microchip: lan937x: Fix RGMII delay tuning
    c85d2cfc5e24e io_uring/cmd_net: fix wrong argument types for skb_queue_splice()
    4c4741f6e7f2f be2net: pass wrb_params in case of OS2BMC
    fc6629b1f0738 ata: libata-scsi: Add missing scsi_device_put() in ata_scsi_dev_rescan()
    2c0622f867ed1 wifi: rtw89: hw_scan: Don't let the operating channel be last
    8d7a5b0e5a07c smb: client: introduce close_cached_dir_locked()
    21879b76831fa selinux: move avdcache to per-task security struct
    646322cf7c95e selinux: rename task_security_struct to cred_security_struct
    447de5c5d2486 ata: libata-scsi: Fix system suspend for a security locked drive
    209773caeb2ec ACPI: APEI: EINJ: Fix EINJV2 initialization and injection
    bb3267bedd902 lib/test_kho: check if KHO is enabled
    1a0d5c74af9b6 mptcp: Fix proto fallback detection with BPF
    5386fdfbd8e28 s390/mm: Fix __ptep_rdp() inline assembly
    1a015bb2b85f0 mptcp: Disallow MPTCP subflows from sockmap
    6758ef4d18112 exfat: check return value of sb_min_blocksize in exfat_read_boot_sector
    71f9ecd17b107 shmem: fix tmpfs reconfiguration (remount) when noswap is set
    1afc4573fb22a isofs: check the return value of sb_min_blocksize() in isofs_fill_super
    deb220e58973c xfs: check the return value of sb_min_blocksize() in xfs_fs_fill_super
    37944f4f8199c mtdchar: fix integer overflow in read/write ioctls
    acfde9400e611 fs: Fix uninitialized 'offp' in statmount_string()
    0c2a43cb43786 mtd: rawnand: cadence: fix DMA device NULL pointer dereference
    ee767b99b0045 vfat: fix missing sb_min_blocksize() return value checks
    e337a45b15538 KVM: SVM: Fix redundant updates of LBR MSR intercepts
    359eeefff4a70 arm64: dts: rockchip: disable HS400 on RK3588 Tiger
    ed4b77f0f45e1 arm64: dts: rockchip: include rk3399-base instead of rk3399 in rk3399-op1
    95aeda9cb135c reset: imx8mp-audiomix: Fix bad mask values
    8aa52de580f2a arm64: dts: rockchip: fix PCIe 3.3V regulator voltage on orangepi-5
    628a2db8a24a8 arm64: dts: rockchip: Fix vccio4-supply on rk3566-pinetab2
    2e6202915d478 HID: quirks: work around VID/PID conflict for 0x4c4a/0x4155
    e3b8ef12f0921 HID: amd_sfh: Stop sensor before starting
    f1aa231c92902 arm64: dts: rockchip: Remove non-functioning CPU OPPs from RK3576
    a01efa7a780c4 timers: Fix NULL function pointer race in timer_shutdown_sync()
    f9f1aed6c8a34 KVM: arm64: Check the untrusted offset in FF-A memory share
    1bfd0faa78d09 Linux 6.17.9
    41840a5e8d632 net: phy: micrel: Fix lan8814_config_init
    ea7936304ed74 isdn: mISDN: hfcsusb: fix memory leak in hfcsusb_probe()
    350d846bf1ad6 KVM: VMX: Inject #UD if guest tries to execute SEAMCALL or TDCALL
    afcb7f694e7a1 KVM: x86: Add support for RDMSR/WRMSRNS w/ immediate on Intel
    e5779f27981cb KVM: x86: Rename local "ecx" variables to "msr" and "pmc" as appropriate
    ce0138dced648 ASoC: da7213: Use component driver suspend/resume
    afd2d225a47d9 ASoC: da7213: Convert to DEFINE_RUNTIME_DEV_PM_OPS()
    f290de3c0f7bd scripts/decode_stacktrace.sh: fix build ID and PC source parsing
    6ca8437dc7261 scripts/decode_stacktrace.sh: symbol: preserve alignment
    626f8c7a2ff9e scripts/decode_stacktrace.sh: symbol: avoid trailing whitespaces
    a2b5df4780132 mm/memory: do not populate page table entries beyond i_size
    6194db7c9e82c mm/huge_memory: do not change split_huge_page*() target order silently
    f4ff166d75f31 selftests: mptcp: join: properly kill background tasks
    acc03eb7e81f0 selftests: mptcp: join: userspace: longer transfer
    4dfd3e5bce989 selftests: mptcp: connect: trunc: read all recv data
    7558cf8893f80 selftests: mptcp: join: endpoints: longer transfer
    927bb5729950f selftests: mptcp: join: rm: set backup flag
    ef51fbbb55065 selftests: mptcp: connect: fix fallback note due to OoO
    e80e08298ce0b pmdomain: samsung: Rework legacy splash-screen handover workaround
    63eaa6cd7385c pmdomain: samsung: plug potential memleak during probe
    ae65e73aeef64 pmdomain: imx: Fix reference count leak in imx_gpc_remove
    983e91da82ec3 pmdomain: arm: scmi: Fix genpd leak on provider registration failure
    fea67de7a636c drm/xe/xe3: Add WA_14024681466 for Xe3_LPG
    4088cac6ba875 drm/xe/xe3: Extend wa_14023061436
    8ce9c3c8d68fb drm/xe/xe3lpg: Extend Wa_15016589081 for xe3lpg
    c805d473355cd drm/i915/psr: fix pipe to vblank conversion
    a0da941ae64b7 drm/amdgpu: disable peer-to-peer access for DCC-enabled GC12 VRAM surfaces
    1ad70a06d7e91 drm/amdgpu: fix lock warning in amdgpu_userq_fence_driver_process
    63600103d2ac5 drm/amdkfd: relax checks for over allocation of save area
    a5b44895dac98 btrfs: release root after error in data_reloc_print_warning_inode()
    3a92d1e28e61d btrfs: do not update last_log_commit when logging inode due to a new name
    6c569c95d0216 btrfs: scrub: put bio after errors in scrub_raid56_parity_stripe()
    72b3b2e2c6c35 btrfs: zoned: fix stripe width calculation
    8ab9bf9ec20b0 btrfs: zoned: fix conventional zone capacity calculation
    ee80ff1f10e18 PM: hibernate: Use atomic64_t for compressed_size variable
    692101646f3e9 PM: hibernate: Emit an error when image writing fails
    2a2b4b0277d35 EDAC/altera: Use INTTEST register for Ethernet and USB SBE injection
    f2937825ca7c1 EDAC/altera: Handle OCRAM ECC enable after warm reset
    8e4c6c2695283 LoongArch: Use physical addresses for CSR_MERRENTRY/CSR_TLBRENTRY
    6a71ead12dbf6 LoongArch: Consolidate max_pfn & max_low_pfn calculation
    72d977150d30c ftrace: Fix BPF fexit with livepatch
    094c6467fe05e io_uring/rw: ensure allocated iovec gets cleared for early failure
    ef15bc6a00b35 gendwarfksyms: Skip files with no exports
    7a9be9dfe325d selftests/user_events: fix type cast for write_index packed member in perf_test
    74c35df32f020 x86/CPU/AMD: Add additional fixed RDSEED microcode revisions
    cfb625fcf447c x86/microcode/AMD: Add Zen5 model 0x44, stepping 0x1 minrev
    27cb5136d2c93 spi: Try to get ACPI GPIO IRQ earlier
    ff2503f41caa7 smb: client: fix cifs_pick_channel when channel needs reconnect
    6f58b75a77fd9 crypto: hisilicon/qm - Fix device reference leak in qm_get_qos_value
    a2bd247f8c6c5 crash: fix crashkernel resource shrink
    3f56c407feb96 codetag: debug: handle existing CODETAG_EMPTY in mark_objexts_empty for slabobj_ext
    4515743cc7a42 cifs: client: fix memory leak in smb3_fs_context_parse_param
    6ec1ecedad6c4 ASoC: sdw_utils: fix device reference leak in is_sdca_endpoint_present()
    d2c04f20ccc6c ALSA: usb-audio: Fix potential overflow of PCM transfer buffer
    d2aed6fac1148 ALSA: hda/hdmi: Fix breakage at probing nvhdmi-mcp driver
    a54ba4afb32e9 mmc: dw_mmc-rockchip: Fix wrong internal phase calculate
    3b935c5353263 mmc: pxamci: Simplify pxamci_probe() error handling using devm APIs
    9e3901a04007f mmc: sdhci-of-dwcmshc: Change DLL_STRBIN_TAPNUM_DEFAULT to 0x4
    9005700c12857 mm/huge_memory: fix folio split check for anon folios in swapcache
    a4145be7b56bf mm, swap: fix potential UAF issue for VMA readahead
    28335885ad43a mm/mremap: honour writable bit in mremap pte batching
    1a1c6289283ef mm/shmem: fix THP allocation and fallback loop
    a4ccabe7907ec mm/kmsan: fix kmsan kmalloc hook when no stack depots are allocated yet
    c07a531f008f7 mm/damon/stat: change last_refresh_jiffies to a global variable
    dacc3793366c0 mm/mm_init: fix hash table order logging in alloc_large_system_hash()
    03de7ff197a3d fs/proc: fix uaf in proc_readdir_de()
    ac502cae3b0b8 mm/huge_memory: preserve PG_has_hwpoisoned if a folio is split to >0 order
    86ea15c66077e wifi: mac80211: reject address change while connecting
    6a994e054849a selftests/tracing: Run sample events to clear page cache events
    4444767e625da mm/secretmem: fix use-after-free race in fault handler
    9a51b5ccd1c79 net: netpoll: fix incorrect refcount handling causing incorrect cleanup
    2f65799e2a736 nilfs2: avoid having an active sc_timer before freeing sci
    514bcff868e6e mm/damon/sysfs: change next_update_jiffies to a global variable
    0fd16ed6dc331 ipv4: route: Prevent rt_bind_exception() from rebinding stale fnhe
    960e1b863b11b LoongArch: Let {pte,pmd}_modify() record the status of _PAGE_DIRTY
    41e610bce9e79 LoongArch: Use correct accessor to read FWPC/MWPC
    7ad00d78504eb LoongArch: Consolidate early_ioremap()/ioremap_prot()
    16bb361f48534 maple_tree: fix tracepoint string pointers
    c991ba68c29fd dma-mapping: benchmark: Restore padding to ensure uABI remained consistent
    50df8d3bd0d0b strparser: Fix signed/unsigned mismatch bug
    9aaf4c2b36d7e kho: warn and exit when unpreserved page wasn't preserved
    f62973e0767e4 ksm: use range-walk function to jump over holes in scan_get_next_rmap_item
    35521b5a7e8a1 ksmbd: close accepted socket when per-IP limit rejects connection
    fc502b112e54b gcov: add support for GCC 15
    f67ad9b33b0e6 NFSD: free copynotify stateid in nfs4_free_ol_stateid()
    91f33a4301b59 nfsd: add missing FATTR4_WORD2_CLONE_BLKSIZE from supported attributes
    c83d7365cec5e nfsd: fix refcount leak in nfsd_set_fh_dentry()
    183d901a7caf7 KVM: VMX: Fix check for valid GVA on an EPT violation
    43da147692b1e KVM: nSVM: Fix and simplify LBR virtualization handling with nested
    689241858e67e KVM: nSVM: Always recalculate LBR MSR intercepts in svm_update_lbrv()
    922d2f04584de KVM: SVM: Mark VMCB_LBR dirty when MSR_IA32_DEBUGCTLMSR is updated
    6e50ae8c779af KVM: arm64: Make all 32bit ID registers fully writable
    393893693a523 KVM: guest_memfd: Remove bindings on memslot deletion when gmem is dying
    af6287e10bdee LoongArch: KVM: Fix max supported vCPUs set with EIOINTC
    54c204e978934 LoongArch: KVM: Add delay until timer interrupt injected
    79a6072961fc6 LoongArch: KVM: Restore guest PMU if it is enabled
    67d7949cd37fc HID: uclogic: Fix potential memory leak in error path
    c0404220cf9e0 HID: playstation: Fix memory leak in dualshock4_get_calibration_data()
    05cb785459f17 pwm: adp5585: Correct mismatched pwm chip info
    ef2d64752c4b1 arm64: dts: rockchip: drop reset from rk3576 i2c9 node
    97a0fbc0fb3f7 arm64: dts: rockchip: Fix USB power enable pin for BTT CB2 and Pi2
    b439d34f2c0d4 ARM: dts: BCM53573: Fix address of Luxul XAP-1440's Ethernet PHY
    f174b7bb69394 HID: hid-ntrig: Prevent memory leak in ntrig_report_version()
    bb787e58ef620 arm64: dts: imx8mp-kontron: Fix USB OTG role switching
    9bddb4dce0471 arm64: dts: imx8-ss-img: Avoid gpio0_mipi_csi GPIOs being deferred
    3589a732c00a3 ARM: dts: imx51-zii-rdu1: Fix audmux node names
    2d8aa56b51b0f ARM: dts: imx6ull-engicam-microgea-rmm: fix report-rate-hz value
    dee29e38a2758 arm64: dts: rockchip: Make RK3588 GPU OPP table naming less generic
    72144224c9298 arm64: dts: rockchip: Fix PCIe power enable pin for BigTreeTech CB2 and Pi2
    4c40220e5e545 arm64: dts: rockchip: Set correct pinctrl for I2S1 8ch TX on odroid-m1
    968589a6495ee perf test: Fix lock contention test
    980d3abbb088c perf test shell lock_contention: Extra debug diagnostics
    18ad5c046831b perf lock: Fix segfault due to missing kernel map
    9d29efa15cd0f perf build: Don't fail fast path feature detection when binutils-devel is not available
    26527bd4863d2 perf header: Write bpf_prog (infos|btfs)_cnt to data file
    b6109750063d3 sched_ext: Fix unsafe locking in the scx_dump_state()
    8ff97ade912dc fs/namespace: correctly handle errors returned by grab_requested_mnt_ns
    e785f552ab04d binfmt_misc: restore write access before closing files opened by open_exec()
    c1e93a5e611e0 virtio-fs: fix incorrect check for fsvq->kobj
    513bb0f569b7c mtd: onenand: Pass correct pointer to IRQ handler
    7e33b15d5a657 afs: Fix dynamic lookup to fail on cell lookup failure
    9a57b84bc82fb hostfs: Fix only passing host root in boot stage with new mount
    92ef36a75fbb5 lib/crypto: arm/curve25519: Disable on CPU_BIG_ENDIAN
    f417f44524e7f posix-timers: Plug potential memory leak in do_timer_create()
    5b6e2c78d0340 irqchip/riscv-intc: Add missing free() callback in riscv_intc_domain_ops
    57e04e2ff56e3 bpf: account for current allocated stack depth in widen_imprecise_scalars()
    8dd2fe5f5d586 bpf: Add bpf_prog_run_data_pointers()
    ad0256f665006 drm/client: fix MODULE_PARM_DESC string for "active"
    ff598b4789692 ASoC: rsnd: fix OF node reference leak in rsnd_ssiu_probe()
    b7d2033392e2d acpi/hmat: Fix lockdep warning for hmem_register_resource()
    0276126dc758a drm/amd/amdgpu: Ensure isp_kernel_buffer_alloc() creates a new BO
    8556853589360 ALSA: usb-audio: Fix NULL pointer dereference in snd_usb_mixer_controls_badd
    0e9be902041c6 NFS: Fix LTP test failures when timestamps are delegated
    a94491a85558a NFSv4: Fix an incorrect parameter when calling nfs4_call_sync()
    b03837f8386e5 NFS: sysfs: fix leak when nfs_client kobject add fails
    fc022d7d5bc58 NFSv2/v3: Fix error handling in nfs_atomic_open_v23()
    21b35335a46d3 simplify nfs_atomic_open_v23()
    b8fa372190748 NFS: Check the TLS certificate fields in nfs_match_client()
    89bbc4cb7e575 pnfs: Set transport security policy to RPC_XPRTSEC_NONE unless using TLS
    6499accbb11cf pnfs: Fix TLS logic in _nfs4_pnfs_v4_ds_connect()
    32230a7313d19 pnfs: Fix TLS logic in _nfs4_pnfs_v3_ds_connect()
    7a12f9c96d06b drm/panthor: Flush shmem writes before mapping buffers CPU-uncached
    8caab17dedf88 ASoC: tas2781: fix getting the wrong device number
    e59e0099d0674 drm/vmwgfx: Restore Guest-Backed only cursor plane support
    f3f3a8eb3f0ba drm/vmwgfx: Validate command header size against SVGA_CMD_MAX_DATASIZE
    c8e0502af39d1 ASoC: codecs: va-macro: fix resource leak in probe error path
    e65cf62400b7e ASoC: cs4271: Fix regulator leak on probe failure
    db57bb3ba6e70 regulator: fixed: fix GPIO descriptor leak on register failure
    2d469d31a8e52 acpi,srat: Fix incorrect device handle check for Generic Initiator
    f9c9a529e2f59 io_uring/rsrc: don't use blk_rq_nr_phys_segments() as number of bvecs
    2b52d89cbbb0d netfilter: nft_ct: add seqadj extension for natted connections
    636b9b2feccc7 Bluetooth: L2CAP: export l2cap_chan_hold for modules
    63e2dfb59b1a8 cpufreq: intel_pstate: Check IDA only before MSR_IA32_PERF_CTL writes
    ac54cc4da6343 ACPI: CPPC: Limit perf ctrs in PCC check only to online CPUs
    5a292e7f98759 ACPI: CPPC: Perform fast check switch only for online CPUs
    c5ab402e60c81 ACPI: CPPC: Check _CPC validity for only the online CPUs
    6980162d2eb13 ACPI: CPPC: Detect preferred core availability on online CPUs
    ef32056ffc5c3 hsr: Follow standard for HSRv0 supervision frames
    40c69966af5a1 hsr: Fix supervision frame sending on HSRv0
    6cb02a845b200 virtio-net: fix incorrect flags recording in big mode
    7a84782f2f592 wifi: iwlwifi: mld: always take beacon ies in link grading
    c6c14c2b08e9c wifi: iwlwifi: mvm: fix beacon template/fixed rate
    fc357cdbc652e net_sched: limit try_bulk_dequeue_skb() batches
    08469f5393a1a mlx5: Fix default values in create CQ
    82c4999e96208 net/mlx5e: Prepare for using different CQ doorbells
    c9b177d9cc24b net/mlx5: Store the global doorbell in mlx5_priv
    13d4d596be966 net/mlx5: Fix typo of MLX5_EQ_DOORBEL_OFFSET
    385118707a19d net/mlx5e: Fix potentially misleading debug message
    329b0922ac635 net/mlx5e: Fix wraparound in rate limiting for values above 255 Gbps
    21e35c0c411e4 net/mlx5e: Fix maxrate wraparound in threshold between units
    f48d823cdc5da net/mlx5e: Fix missing error assignment in mlx5e_xfrm_add_state()
    c8f51dad94cbb net: sched: act_ife: initialize struct tc_ife to fix KMSAN kernel-infoleak
    25837889ec062 net: sched: act_connmark: initialize struct tc_ife to fix kernel leak
    d1c71c64c4dc9 Bluetooth: hci_event: Fix not handling PA Sync Lost event
    1aa7e40ee850c af_unix: Initialise scc_index in unix_add_edge().
    71ce650c03377 wifi: mac80211: skip rate verification for not captured PSDUs
    7b9d9a20e57b0 net: mdio: fix resource leak in mdiobus_register_device()
    fdf7c4c9af4f2 tipc: Fix use-after-free in tipc_mon_reinit_self().
    2f387a26cd774 net: ethernet: ti: am65-cpsw-qos: fix IET verify retry mechanism
    67cea300812f3 net: ethernet: ti: am65-cpsw-qos: fix IET verify/response timeout
    dd1eb65716c3f net/handshake: Fix memory leak in tls_handshake_accept()
    761660e534a65 net/smc: fix mismatch between CLC header and proposal
    75c626ab271e8 net: dsa: tag_brcm: do not mark link local traffic as offloaded
    aaba523dd7b61 sctp: prevent possible shift-out-of-bounds in sctp_transport_update_rto
    c7c20af692a67 Bluetooth: hci_conn: Fix not cleaning up PA_LINK connections
    0eec6c8cbb90f Bluetooth: 6lowpan: Don't hold spin lock over sleeping functions
    9feffe9e1ac21 Bluetooth: 6lowpan: fix BDADDR_LE vs ADDR_LE_DEV address type confusion
    70d84e7c3a44b Bluetooth: 6lowpan: reset link-local header on ipv6 recv path
    a2610ecd9fd57 Bluetooth: btusb: reorder cleanup in btusb_disconnect to avoid UAF
    fd62ca5ad136d Bluetooth: MGMT: cancel mesh send timer when hdev removed
    a20f84535b47d NFSD: Skip close replay processing if XDR encoding fails
    2cfbfe77c248c rust: Add -fno-isolate-erroneous-paths-dereference to bindgen_skip_c_flags
    d18ebd9a845aa net: phy: micrel: lan8814 fix reset of the QSGMII interface
    e011777a4f3ce net: phy: micrel: Replace hardcoded pages with defines
    ff737f19591a1 net: phy: micrel: Introduce lanphy_modify_page_reg
    4288f22fec0b8 net: fec: correct rx_bytes statistic for the case SHIFT16 is set
    9bb9362d5986f selftests: net: local_termination: Wait for interfaces to come up
    1f86d73a0afe4 erofs: avoid infinite loop due to incomplete zstd-compressed data
    51d0b3cd4704c wifi: ath11k: zero init info->status in wmi_process_mgmt_tx_comp()
    822b967dc2671 ixgbe: handle IXGBE_VF_FEATURES_NEGOTIATE mbox cmd
    b7b1c92baf669 ALSA: hda/realtek: Fix mute led for HP Omen 17-cb0xxx
    6b649855bf464 ASoC: max98090/91: fixed max98091 ALSA widget powering up/down
    fa5cfb0e730b0 HID: logitech-hidpp: Add HIDPP_QUIRK_RESET_HI_RES_SCROLL
    d37b2c81c83d6 smb/server: fix possible refcount leak in smb2_sess_setup()
    bfda5422a1665 smb/server: fix possible memory leak in smb2_read()
    d75079bbab4c3 io_uring: fix unexpected placement on same size resizing
    204b1b02ee018 exfat: fix improper check of dentry.stream.valid_size
    37ab137e28e3f HID: quirks: Add ALWAYS_POLL quirk for VRS R295 steering wheel
    456d19de9a0b0 NFS: check if suid/sgid was cleared after a write as needed
    15bdea6d7607c HID: nintendo: Wait longer for initial probe
    ad63dcc402f62 ixgbe: handle IXGBE_VF_GET_PF_LINK_STATE mailbox operation
    c6a7af6e19341 HID: quirks: avoid Cooler Master MM712 dongle wakeup bug
    6984b80b97d55 HID: intel-thc-hid: intel-quickspi: Add ARL PCI Device Id's
    3c0d473fa19bf NFS4: Apply delay_retrans to async operations
    b3b288206a1ea drm/amdkfd: fix suspend/resume all calls in mes based eviction path
    2eff042a73522 NFS4: Fix state renewals missing after boot
    070bdce18fb12 drm/amdgpu: Fix NULL pointer dereference in VRAM logic for APU devices
    a67a9f99ce130 drm/amdgpu: hide VRAM sysfs attributes on GPUs without VRAM
    a41bdba05899c drm/amdgpu: remove two invalid BUG_ON()s
    673caff1744dc ASoC: nau8821: Avoid unnecessary blocking in IRQ handler
    c71bda1f4f4e1 fs: return EOPNOTSUPP from file_setattr/file_getattr syscalls
    01cc35d6ffcb8 riscv: acpi: avoid errors caused by probing DT devices when ACPI is used
    1009f007b3afb RISC-V: clear hot-unplugged cores from all task mm_cpumasks to avoid rfence errors
    94338a0865295 riscv: Build loader.bin exclusively for Canaan K210
    19dd7da511806 compiler_types: Move unused static inline functions warning to W=2
    87f2e9ee9d6b6 arm64: kprobes: check the return value of set_memory_rox()
    ccd8af579101c drm/amd: Disable ASPM on SI
    e95425b6df29c drm/amd/pm: Disable MCLK switching on SI at high pixel clocks
    5ee434b55134c drm/amd/display: Disable fastboot on DCE 6 too
    ac486718d6cc9 drm/amd/pm: Use pm_display_cfg in legacy DPM (v2)
    cc1500bfadea2 drm/amd/display: Add pixel_clock to amd_pp_display_configuration
    dfd1d6b582556 drm/xe: Do clean shutdown also when using flr
    490daa10c8d3e drm/xe: Move declarations under conditional branch
    ce6ccf8e881a9 drm/xe/guc: Synchronize Dead CT worker with unbind
    99b72eaf44c8d drm/amd: Fix suspend failure with secure display TA
    f231587eed7fc futex: Optimize per-cpu reference counting
    d5c62f242e4dc iommufd: Make vfio_compat's unmap succeed if the range is already empty
    e475d3e1867c8 smb: client: fix refcount leak in smb2_set_path_attr
    8d920a02cf531 drm/amd/display: Don't stretch non-native images by default in eDP
    f75cd5557f74a drm/amdgpu: set default gfx reset masks for gfx6-8
    37fc6ea13fc2f drm/i915: Fix conversion between clock ticks and nanoseconds
    858a50127be71 drm/i915: Avoid lock inversion when pinning to GGTT on CHV/BXT+VTD
    1efdc2870ee43 drm/mediatek: Add pm_runtime support for GCE power control
    0b31316ff31b5 iommufd/selftest: Fix ioctl return value in _test_cmd_trigger_vevents()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.17.bb              |  4 ++--
 .../linux/linux-yocto-tiny_6.17.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_6.17.bb | 22 +++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb
index f4a561cfee6..b145a73d159 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "aa06dc4f22d9c05bcbfc45c91308f3f8dd65c5e1"
+SRCREV_machine ?= "4c77bf8e2eddb19ae0a6e8ba7f1bbc28477c1c86"
 SRCREV_meta ?= "064a61babfe08bd4240e22c956735f2c9cb200ef"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.17;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.17.8"
+LINUX_VERSION ?= "6.17.10"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb
index 618628d75f6..54457a4c3d7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.17.inc
 
-LINUX_VERSION ?= "6.17.8"
+LINUX_VERSION ?= "6.17.10"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,7 +17,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "7cded9eb9d18c490e808f46f2eb1e286655ccad1"
+SRCREV_machine ?= "43f56832407b25c045689964d109da7231474c1f"
 SRCREV_meta ?= "064a61babfe08bd4240e22c956735f2c9cb200ef"
 
 PV = "${LINUX_VERSION}+git"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.17.bb b/meta/recipes-kernel/linux/linux-yocto_6.17.bb
index 4c72d9e6c4a..32a64f63835 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.17.bb
@@ -18,17 +18,17 @@ KBRANCH:qemux86-64 ?= "v6.17/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.17/standard/base"
 KBRANCH:qemumips64 ?= "v6.17/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "a9b28b052aebddf539073d88f824045724f54e5f"
-SRCREV_machine:qemuarm64 ?= "b9df5c4816e8095813e5e341ab013c6e7c8d726b"
-SRCREV_machine:qemuloongarch64 ?= "b9df5c4816e8095813e5e341ab013c6e7c8d726b"
+SRCREV_machine:qemuarm ?= "610683567d4459e872d095cbfdfb71487b398f99"
+SRCREV_machine:qemuarm64 ?= "a26a71902db3c80604d817a8e7a7b5c289a54fb7"
+SRCREV_machine:qemuloongarch64 ?= "a26a71902db3c80604d817a8e7a7b5c289a54fb7"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "b9df5c4816e8095813e5e341ab013c6e7c8d726b"
-SRCREV_machine:qemuriscv64 ?= "b9df5c4816e8095813e5e341ab013c6e7c8d726b"
-SRCREV_machine:qemuriscv32 ?= "b9df5c4816e8095813e5e341ab013c6e7c8d726b"
-SRCREV_machine:qemux86 ?= "b9df5c4816e8095813e5e341ab013c6e7c8d726b"
-SRCREV_machine:qemux86-64 ?= "b9df5c4816e8095813e5e341ab013c6e7c8d726b"
+SRCREV_machine:qemuppc ?= "a26a71902db3c80604d817a8e7a7b5c289a54fb7"
+SRCREV_machine:qemuriscv64 ?= "a26a71902db3c80604d817a8e7a7b5c289a54fb7"
+SRCREV_machine:qemuriscv32 ?= "a26a71902db3c80604d817a8e7a7b5c289a54fb7"
+SRCREV_machine:qemux86 ?= "a26a71902db3c80604d817a8e7a7b5c289a54fb7"
+SRCREV_machine:qemux86-64 ?= "a26a71902db3c80604d817a8e7a7b5c289a54fb7"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "b9df5c4816e8095813e5e341ab013c6e7c8d726b"
+SRCREV_machine ?= "a26a71902db3c80604d817a8e7a7b5c289a54fb7"
 SRCREV_meta ?= "064a61babfe08bd4240e22c956735f2c9cb200ef"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
@@ -36,7 +36,7 @@ SRCREV_meta ?= "064a61babfe08bd4240e22c956735f2c9cb200ef"
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "8ac42a63c561a8b4cccfe84ed8b97bb057e6ffae"
+SRCREV_machine:class-devupstream ?= "ae593cd8579f0207305263afd7adee01ffab7fb7"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.17/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.17;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.17.8"
+LINUX_VERSION ?= "6.17.10"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


