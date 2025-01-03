Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFBD0E77198
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 14:17:26 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.31305.1735913843922988124
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jan 2025 06:17:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YYae6Utx;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7b6e8fe401eso1031333785a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 06:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735913843; x=1736518643; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4X4xakW7ma16PPG3aEihvxNE2xmNiRxijlQAC03Mk8E=;
        b=YYae6UtxRe34ZPreCiXuiWXhsvvBveU37l8qXIt4gGIF0veSDvlTchDwDV3NHjEnsD
         jTQFB64VvO7To9+KDS21+X8N7gOMac2p0t2GNcrcdcMuuLvDHTHVFKDFLjkC57eOA2O9
         SPYQjGBRHOFEnVJal/grldhX+ZrV/wp7xniNNRSgOKc2dbPn6mdAzQnANX1C5MOtZ8GP
         0A6eirk+qIXCQkliuvjqNgS2XA1Lq5mpqg3n7kDaKP0PJpwWN3cruEkv3SiwNoWYz+ZH
         pCyBw6UwXFL67zXMxpZsx6J+HmBOGdVYw46E/C3T8R1D98STZpF/ODwkzCeMcS/JVpNQ
         ganQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735913843; x=1736518643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4X4xakW7ma16PPG3aEihvxNE2xmNiRxijlQAC03Mk8E=;
        b=O9GXAYIJIdVAHWNqD/4cKbi9QFLkWJt/x2VMweX4ieoMbHrIo3Si6Fwmn680gNFmva
         16wLcZVjLRKzg6R4lBJXFnn4Z75NDXWInzAFG/7Iyu7aJ4F9nVT6xIyomK8Kr+RyDL5Q
         FPY6essNU1fpsC30/aqlprfiWH2f/G6Yp0+O1f9inzEl14SQKJZ11SZpdt0E4IWA9mfw
         uaAIrYsdYM93JmdGVTZhTi/+B4rLi7sHEI1SfnPeqlAhkCOWwcKTvkK8wIuZE5zbx6tT
         X5Af42a+a0SbHrOcttaQiNGLRfcsKEKo2JeDPYzlB3705azz8te7kp4c3zmaBOvkFBZG
         wPqg==
X-Gm-Message-State: AOJu0Yyy5KSkwis+mYrRQ6jIeLwFgchsCa8voJKkg2jWNdn6zWeM/BvK
	N2+akIE+pJ6Kl6yELBWWzj6JGniziIupooHF42MGGSN7sPa2DiP3/dAsM+atoEo=
X-Gm-Gg: ASbGncvkxr6ubs25W4RYNXSx/0sfNqh/urwVDEaHutnKYsvxtVnlHPMfJF0H9TsIiyQ
	1N8me4939stQSGc8dd4zye642T299pT4IxNM9GRLD+TWWBEdAT3x+i7+oLqGWiGBS1fGMuaAIqV
	E8JoBgr+lGLD0T7tqwvMX9A9aZrLnCuUtFXk2LtdRF6skeblNhsMu8dwMvKNLgCe3KtGeuf0IIH
	PCjonosYVgzFn+hZQFRTQ6qAWJBmV9LSwfx8YzGuUpTF+V5JGoK2SETFiCPVfNoo1Z+LcfcBAFc
	SJ4LRrfoFHpcoUgXMtH4fy/725P7k7q6wJXIPRJwng2cjn0j24sZ5D/27w==
X-Google-Smtp-Source: AGHT+IHCUoBekocCco7J5U/OkrzgoyC+5D3tUChO23v+A5JU6II1q2/E+8r+jPP6VoiFqGcTUVwNeg==
X-Received: by 2002:a05:620a:8089:b0:7b7:142d:53cb with SMTP id af79cd13be357-7b9ba88241fmr8714457285a.61.1735913842716;
        Fri, 03 Jan 2025 06:17:22 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac4ef0f6sm1275015485a.123.2025.01.03.06.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 06:17:21 -0800 (PST)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/10] linux-yocto/5.15: update to v5.15.173
Date: Fri,  3 Jan 2025 09:17:07 -0500
Message-Id: <20250103141709.2848730-9-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250103141709.2848730-1-bruce.ashfield@gmail.com>
References: <20250103141709.2848730-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 14:17:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209362

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    0a51d2d4527b Linux 5.15.173
    e2eb1b3c807b 9p: fix slab cache name creation for real
    8b1d55e43cee udf: Avoid directory type conversion failure due to ENOMEM
    5ea4b73e268b udf: Allocate name buffer in directory iterator on heap
    a5ee9fe48fa5 mm/memory: add non-anonymous page check in the copy_present_page()
    d43f1430d47c mm: krealloc: Fix MTE false alarm in __do_krealloc
    97ed7ff58de6 io_uring: fix possible deadlock in io_register_iowq_max_workers()
    1f4fd53ffb7c md/raid10: improve code of mrdev in raid10_sync_request
    a3d8f121a12a net: usb: qmi_wwan: add Fibocom FG132 0x0112 composition
    ae8516232db7 HID: lenovo: Add support for Thinkpad X1 Tablet Gen 3 keyboard
    86c48496bcd7 HID: multitouch: Add quirk for Logitech Bolt receiver w/ Casa touchpad
    b3e612bd8f64 fs: Fix uninitialized value issue in from_kuid and from_kgid
    8004122bf90e vDPA/ifcvf: Fix pci_read_config_byte() return code handling
    79c12f418ece powerpc/powernv: Free name on error in opal_event_init()
    4c3dcbb14e57 drm/vmwgfx: Limit display layout ioctl array size to VMWGFX_NUM_DISPLAY_UNITS
    d46e6a0c83e8 sound: Make CONFIG_SND depend on INDIRECT_IOMEM instead of UML
    5c02e1b5760f crypto: marvell/cesa - Disable hash algorithms
    01b7ded8042e bpf: use kvzmalloc to allocate BPF verifier environment
    e781120e8e39 HID: multitouch: Add quirk for HONOR MagicBook Art 14 touchpad
    6711f40490df HID: multitouch: Add support for B2402FVA track point
    f8b7e56b7555 block: Fix elevator_get_default() checking for NULL q->tag_set
    eb94e4a0db42 irqchip/ocelot: Fix trigger register address
    826cbda55820 9p: Avoid creating multiple slab caches with the same name
    d98fd109f827 Linux 5.15.172
    ab812669f191 ALSA: usb-audio: Add endianness annotations
    2a6a4e69f255 vsock/virtio: Initialization of the dangling pointer occurring in vsk->trans
    7cf259878203 hv_sock: Initializing vsk->trans to NULL to prevent a dangling pointer
    d810c7c7d42d ACPI: PRM: Clean up guid type in struct prm_handler_info
    da66f4821e6e ALSA: usb-audio: Add quirks for Dell WD19 dock
    7ea07b808bd5 ALSA: usb-audio: Support jack detection on Dell dock
    e3cd170b998f ucounts: fix counter leak in inc_rlimit_get_ucounts()
    dcc8fe8c8314 ocfs2: remove entry once instead of null-ptr-dereference in ocfs2_xa_remove()
    2e1546ff199b irqchip/gic-v3: Force propagation of the active state with a read-back
    679c414993b5 USB: serial: option: add Quectel RG650V
    8031b262bb32 USB: serial: option: add Fibocom FG132 0x0112 composition
    2fa7d209f071 USB: serial: qcserial: add support for Sierra Wireless EM86xx
    44fff2c16c5a USB: serial: io_edgeport: fix use after free in debug printk
    8f47984b35f3 usb: typec: fix potential out of bounds in ucsi_ccg_update_set_new_cam_cmd()
    d9e65d461a9d usb: dwc3: fix fault at system suspend if device was already runtime suspended
    63559ba8077c usb: musb: sunxi: Fix accessing an released usb phy
    51bc11244a30 fs/proc: fix compile warning about variable 'vmcore_mmap_ops'
    467d84dc78c9 media: uvcvideo: Skip parsing frames of type UVC_VS_UNDEFINED in uvc_parse_format
    e3915f028b1f net: do not delay dst_entries_add() in dst_release()
    e81b674ead8e ice: Add a per-VF limit on number of FDIR filters
    c964429ef53f net: bridge: xmit: make sure we have at least eth header len bytes
    c24fa427fc0a btrfs: reinitialize delayed ref list after deleting it from the list
    9b453e8b108a nfs: Fix KMSAN warning in decode_getfattr_attrs()
    4e24041ba86d io_uring/rw: fix missing NOWAIT check for O_DIRECT start write
    a44e81249b8c io_uring: use kiocb_{start,end}_write() helpers
    9386396a43ef fs: create kiocb_{start,end}_write() helpers
    00334fb35d40 io_uring: rename kiocb_end_write() local helper
    e70ec8ab9fd3 posix-cpu-timers: Clear TICK_DEP_BIT_POSIX_TIMER on clone
    5510496be244 ALSA: usb-audio: Add quirk for HP 320 FHD Webcam
    cd6a370d395a dm-unstriped: cast an operand to sector_t to prevent potential uint32_t overflow
    fdef3b94dfeb dm cache: fix potential out-of-bounds access on the first resume
    01c4e15a45bb dm cache: optimize dirty bit checking with find_next_bit when resizing
    ff1dd8a04c30 dm cache: fix out-of-bounds access to the dirty bitset when resizing
    850c31160f6e dm cache: correct the number of origin blocks to match the target length
    71014a53f20a thermal/drivers/qcom/lmh: Remove false lockdep backtrace
    27fc29b53769 drm/amdgpu: prevent NULL pointer dereference if ATIF is not supported
    aaf6160a4b7f drm/amdgpu: add missing size check in amdgpu_debugfs_gprwave_read()
    4596c0e4f762 drm/amdgpu: Adjust debugfs eviction and IB access permissions
    51488ee3562c pwm: imx-tpm: Use correct MODULO value for EPWM mode
    282ad7124652 media: v4l2-ctrls-api: fix error handling for v4l2_g_ctrl()
    a749c15dccc5 media: v4l2-tpg: prevent the risk of a division by zero
    190cd7728408 media: pulse8-cec: fix data timestamp at pulse8_setup()
    f2b4f277c41d media: cx24116: prevent overflows on SNR calculus
    a930cddfd153 media: s5p-jpeg: prevent buffer overflows
    0d75f887aabd ASoC: stm32: spdifrx: fix dma channel release in stm32_spdifrx_remove
    a511f9bd9871 ALSA: firewire-lib: fix return value on fail in amdtp_tscm_init()
    98e88750df64 scsi: sd_zbc: Use kvzalloc() to allocate REPORT ZONES buffer
    7db74a57cca3 media: adv7604: prevent underflow condition when reporting colorspace
    719112022425 media: dvb_frontend: don't play tricks with underflow values
    5f76f7df1486 media: dvbdev: prevent the risk of out of memory access
    2de476e842c9 media: stb0899_algo: initialize cfr before using it
    e4f6765679e1 Revert "ALSA: hda/conexant: Mute speakers at suspend / shutdown"
    3898393b5483 net: arc: fix the device for dma_map_single/dma_unmap_single
    1654d4888d24 net: stmmac: Fix unbalanced IRQ wake disable warning on single irq case
    3fc95c9771cc net: phy: ti: add PHY_RST_AFTER_CLK_EN flag
    e36482b222e0 net: hns3: fix kernel crash when uninstalling driver
    262dc6ea5f1e i40e: fix race condition by adding filter's intermediate sync state
    e8e35dc97c81 can: c_can: fix {rx,tx}_errors statistics
    a758aa6a773b sctp: properly validate chunk size in sctp_sf_ootb()
    5c8eb37f626a net: enetc: set MAC address to the VF net_device
    199c20fb7499 security/keys: fix slab-out-of-bounds in key_task_permission
    4a8cab88ce77 nfs: avoid i_lock contention in nfs_clear_invalid_mapping
    dbfdfb2eb7f2 NFSv3: handle out-of-order write replies.
    80ca099223ab NFS: Add a tracepoint to show the results of nfs_set_cache_invalid()
    c4be3004fdb1 NFSv3: only use NFS timeout for MOUNT when protocols are compatible
    05ade5d43378 HID: core: zero-initialize the report buffer
    2a8e8ebe9df9 ARM: dts: rockchip: Fix the realtek audio codec on rk3036-kylin
    ea5efbcf0859 ARM: dts: rockchip: Fix the spi controller on rk3036
    7e99abbcc1b1 ARM: dts: rockchip: drop grf reference from rk3036 hdmi
    fc144c295ab7 ARM: dts: rockchip: fix rk3036 acodec node
    98745ce735dc arm64: dts: imx8mp: correct sdhc ipg clk
    17bbedc1347b arm64: dts: rockchip: Fix LED triggers on rk3308-roc-cc
    f2a54c100ebe arm64: dts: rockchip: Remove #cooling-cells from fan on Theobroma lion
    611f304c6b5c arm64: dts: rockchip: Fix bluetooth properties on Rock960 boards
    c74f7c0a2c3a arm64: dts: rockchip: Remove hdmi's 2nd interrupt on rk3328
    3168342c3883 arm64: dts: rockchip: Fix rt5651 compatible value on rk3399-sapphire-excavator
    6f0605db50e2 clk: imx: Add check for kcalloc
    5b837b9e1543 bpf: Fix the indention issue in grow_stack_state()
    42b62697634d cifs: Fix the calling of smb_version_operations::calc_smb_size()
    b14acf729e9d f2fs: Add inline to f2fs_build_fault_attr() stub
    7c317bec311f f2fs: check validation of fault attrs in f2fs_build_fault_attr()
    81c12119c23f bpf: Fix accesses to uninit stack slots [ Upstream commit 6b4a64bafd107e521c01eec3453ce94a3fb38529 ]
    c4fa05422d87 smb: client: fix potential OOB in smb2_dump_detail()
    299ef3b5b00b of: module: add buffer overflow check in of_modalias()
    b8086c3c1548 reiserfs: Avoid touching renamed directory if parent does not change
    ea091017ef62 ipv6: Fix data races around sk->sk_prot.
    ff8710da80ee ipv6: annotate some data-races around sk->sk_prot
    e8c2eafaaa6a tcp: Fix data races around icsk->icsk_af_ops.
    8d1bab770956 locking/rwsem: Disable preemption while trying for rwsem lock
    7c82dac02886 block, loop: support partitions without scanning
    45f504f301d4 bpftool: Fix pretty print dump for maps without BTF loaded
    1f24338cb789 jbd2: Drop the merge conflicted hunk
    e1d0e3c51bde tpm: tis_i2c: Limit write bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    1abe841fe331 tpm: tis_i2c: Limit read bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    6224acfc1d56 tpm: Add flag to use default cancellation policy
    1cd19d48fb90 tpm: tis_i2c: Fix sanity check interrupt enable mask
    a883da132fa8 tpm: Add tpm_tis_i2c backend for tpm_tis_core
    a742ac8a1c51 tpm: Add tpm_tis_verify_crc to the tpm_tis_phy_ops protocol layer
    ef495c5f45f2 tpm: Remove read16/read32/write32 calls from tpm_tis_phy_ops
    1f3be2e23aa6 gcc-plugins: Reorganize gimple includes for GCC 13
    24615a3b932a ata: ahci: fix enum constants for gcc-13
    5d6cb145541a net: stmmac: Enable mac_managed_pm phylink config
    fd93aabb4287 tools/resolve_btfids: Use pkg-config to locate libelf
    130f9da78406 tools/resolve_btfids: Build with host flags
    00f2f1a782f9 tools/resolve_btfids: Support cross-building the kernel with clang
    17776a4ba9c2 tools/resolve_btfids: Install libbpf headers when building
    7c9808380d70 libbpf: Make libbpf_version.h non-auto-generated
    37ae1ba791ac libbpf: Add LIBBPF_DEPRECATED_SINCE macro for scheduling API deprecations
    a2667e6d7314 drm/radeon: free iio for atombios when driver shutdown
    f100c753aa1f powerpc: Fix reschedule bug in KUAP-unlocked user copy
    da5513f30187 libbpf: Fix build warning on ref_ctr_off
    4c5a089621a8 perf python: Account for multiple words in CC
    1c5699ee85d4 fs: move S_ISGID stripping into the vfs_*() helpers
    838f5d0701d8 fs: add mode_strip_sgid() helper
    d97172683641 squashfs: provide backing_dev_info in order to disable read-ahead
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
index 2638f15279..489da2cbc3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "98041125dd21bf5eca755b97ecd285d6ade81570"
-SRCREV_meta ?= "165341e88c9b35945d8b392825aa317ba33bfb57"
+SRCREV_machine ?= "1d8830fba57e4ac3d213ca9c94dc68ac46369d43"
+SRCREV_meta ?= "c20b08deed1bb069e2489413e54e7498dba70057"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.171"
+LINUX_VERSION ?= "5.15.173"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index d7e3c46073..1816b47dfe 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.171"
+LINUX_VERSION ?= "5.15.173"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "0d8a5525fe6e85f1158929bb79b7ce071056206c"
-SRCREV_meta ?= "165341e88c9b35945d8b392825aa317ba33bfb57"
+SRCREV_machine ?= "0d6b798bb6a1e1ed73032fa5c45f1d599593d21e"
+SRCREV_meta ?= "c20b08deed1bb069e2489413e54e7498dba70057"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 82a83ca2c2..9e5c21f407 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "d19efb158e281347f46478971d8d43a821326205"
-SRCREV_machine:qemuarm64 ?= "4feb3e5fa76487c2eed871931fd27cd63348dd45"
-SRCREV_machine:qemumips ?= "61edb2ce1098c9efd69607801e783569952f86e9"
-SRCREV_machine:qemuppc ?= "7adca69e582fde94bec62ddfe6711fac80488892"
-SRCREV_machine:qemuriscv64 ?= "6190c0086a4a6def5c3cbc6958348cbdd9370b7d"
-SRCREV_machine:qemuriscv32 ?= "6190c0086a4a6def5c3cbc6958348cbdd9370b7d"
-SRCREV_machine:qemux86 ?= "6190c0086a4a6def5c3cbc6958348cbdd9370b7d"
-SRCREV_machine:qemux86-64 ?= "6190c0086a4a6def5c3cbc6958348cbdd9370b7d"
-SRCREV_machine:qemumips64 ?= "5370d58e55c5229e60ff358d88139bf9e67507fb"
-SRCREV_machine ?= "6190c0086a4a6def5c3cbc6958348cbdd9370b7d"
-SRCREV_meta ?= "165341e88c9b35945d8b392825aa317ba33bfb57"
+SRCREV_machine:qemuarm ?= "c1028e815302012e33e3249ebea99560d27fb35d"
+SRCREV_machine:qemuarm64 ?= "2dc4d24d695ca843b072af76d0b256d0b20c490b"
+SRCREV_machine:qemumips ?= "a325e8ea9f13e35d9685d4efb5361973532c52cb"
+SRCREV_machine:qemuppc ?= "3c68be3fd502a5d9772f734c61e8325c47bbe8cb"
+SRCREV_machine:qemuriscv64 ?= "3ac5c02a471d41782f960090c5d5caab80dc6cdc"
+SRCREV_machine:qemuriscv32 ?= "3ac5c02a471d41782f960090c5d5caab80dc6cdc"
+SRCREV_machine:qemux86 ?= "3ac5c02a471d41782f960090c5d5caab80dc6cdc"
+SRCREV_machine:qemux86-64 ?= "3ac5c02a471d41782f960090c5d5caab80dc6cdc"
+SRCREV_machine:qemumips64 ?= "e5704819da97878c8f22425f8f7b271449935894"
+SRCREV_machine ?= "3ac5c02a471d41782f960090c5d5caab80dc6cdc"
+SRCREV_meta ?= "c20b08deed1bb069e2489413e54e7498dba70057"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "3c17fc4839052076b9f27f22551d0d0bd8557822"
+SRCREV_machine:class-devupstream ?= "0a51d2d4527b43c5e467ffa6897deefeaf499358"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.171"
+LINUX_VERSION ?= "5.15.173"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.39.2


