Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA355C02184
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 20:47:18 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.28625.1736801237705674783
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 12:47:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2XoyA58m;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2164b1f05caso82991465ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 12:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736801237; x=1737406037; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NyVQ3EMA5gMKhWdaDDXTxGxgR99ZFBDFlO8fRFKvaE8=;
        b=2XoyA58mMEmSVnffrGEjZZ+NUBT3ei1S3Ifdo3k2aHrB8xhtP8X+OsfibJ4/rRVx3s
         Ynh5nAVuWJcMS7t4LSgN84HV7lxQuQnuYYb+PLADKQiGnw8CZ3Ug9q8AdhL7lWgTqQvU
         P2N9vKE41gq0ee655OWGeTFHA5n8YdmasjBTFy7JII3YUpkt08KWTGSMl6TIzOiyy7zv
         zEestfzp4yFykwoTp8C9qBAfdF2JQ7WBnY7/5mbuOAt1kw4yPTX3RVOlE9hlFczjfQHm
         oTucfpNx7nrk7L8ZDeeTIM+MDJpEIe0KPjZq9YS2+uMPSNTbCJGnDUTNnyU3qXBlYV/P
         UmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736801237; x=1737406037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NyVQ3EMA5gMKhWdaDDXTxGxgR99ZFBDFlO8fRFKvaE8=;
        b=T5OFjxYNMvkQT7IGky+aXNGj6qYdWFHbylJqYb21+D2eIYfcbWsUhpFwA8ruM0VUMa
         QTOb5O0bmoYdKRlTzTQsoZoV5DaJUyih3BGZPUo5QOrHNyeoZRWFEQbOHDM0AiQMB/+Q
         RweJ5mnjT4noPoaxc5gK1jlufUZFF4hOT6iP08xvMQNxqnBUCKnRJKZ9KewnSPIxWcUf
         yPp3AbXsxwKa4FM7Q1sTM3mNTAWjWjRSH85k9xd2ZNRRyKnpJTPIKi/CdQz9eJ2K6u1e
         XwP6zv7x7TutCEzvCj6g0XmC/ogc/syx54j6wnv8oLBIvcRR1HvMyDu6vKkbG/cAFJAJ
         ChoQ==
X-Gm-Message-State: AOJu0YyRM6LZyOFHiqVeXkD51YyJK4lOh8oPsfjvYrlwU0wbaPWst3K0
	7egkZEB0XnXLwbWuVzHrIY1Yp8T+ypU7sjjK8eb8l1d9Wy+zvgRXvP05n/EY5HFaayciVEY1Y0b
	CANE=
X-Gm-Gg: ASbGnctaOfyrnWVkwpJi1MgzIwb6GRMseCLFWrNXFJGYhzo3e0+UJiGXeeUy80MbIrb
	uySe7AaMGFtlzrIAhUuYc8Jjhr+1KtxZsRac6lUA9Wt6XUJJDRL4kwvBugkCIBxQqQNO88dscVX
	h5wEYTrBSnQh3IP3/p6W3e3iiuvScf/1f/AlHzr2XomO8MzuDKYryiJTM5LWSjPQVUGRLdZvMC+
	W/1RCaLvOVZT9Hu4rXDVBHtMQ3/NCGGr7IyQV7FidsUrw==
X-Google-Smtp-Source: AGHT+IEGpxG7JzZ3c2G4QYpVMiLcmMEdkBrS4docLOYJwwvJYN8Ji8hM4RYwncjgo5d3uJvTF1xxgQ==
X-Received: by 2002:a05:6a20:4323:b0:1ea:ddd1:2fda with SMTP id adf61e73a8af0-1eaddd1346fmr7352619637.26.1736801236461;
        Mon, 13 Jan 2025 12:47:16 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40549413sm6449435b3a.12.2025.01.13.12.47.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 12:47:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/15] linux-yocto/6.6: update to v6.6.56
Date: Mon, 13 Jan 2025 12:46:54 -0800
Message-ID: <0bd693d60a5e82f2aca99aa6ba21da217884a4e2.1736801113.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736801113.git.steve@sakoman.com>
References: <cover.1736801113.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 20:47:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209746

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    d4576c567009 Linux 6.6.56
    1e0f696469d6 Revert "perf callchain: Fix stitch LBR memory leaks"
    9b15f68c4127 Linux 6.6.55
    e334ae4a0cd5 perf python: Allow checking for the existence of warning options in clang
    3faea7810e2b Revert "ubifs: ubifs_symlink: Fix memleak of inode->i_link in error path"
    e0aba0c6d521 null_blk: Fix return value of nullb_device_power_store()
    e0b065ec636d drm/amd/display: enable_hpo_dp_link_output: Check link_res->hpo_dp_link_enc before using it
    776ebdeee65b perf report: Fix segfault when 'sym' sort key is not used
    eada63e6e337 drm/amd/display: Revert Avoid overflow assignment
    de4841fca84f crypto: octeontx* - Select CRYPTO_AUTHENC
    25613e6d9841 vhost/scsi: null-ptr-dereference in vhost_scsi_get_req()
    cdf4bbbdb956 rxrpc: Fix a race between socket set up and I/O thread creation
    b538fefeb102 net: stmmac: move the EST lock to struct stmmac_priv
    aaadb755f2d6 null_blk: fix null-ptr-dereference while configuring 'power' and 'submit_queues'
    b2b02202f87d null_blk: Remove usage of the deprecated ida_simple_xx() API
    2deb10a99671 platform/x86: think-lmi: Fix password opcode ordering for workstations
    e115c1b5de55 efi/unaccepted: touch soft lockup during memory accept
    50f4b57e9a9d drm/bridge: adv7511: fix crash on irq during probe
    fd4d5cd7a2e8 iommufd: Fix protection fault in iommufd_test_syz_conv_iova
    69a1e2d938db net: dsa: fix netdev_priv() dereference before check on non-DSA netdevice events
    164936b2fc88 netfilter: nf_tables: restore set elements when delete set fails
    a1bd2a38a1c6 netfilter: nf_tables: fix memleak in map from abort path
    b90778973293 ubifs: ubifs_symlink: Fix memleak of inode->i_link in error path
    1428da2f4a33 Revert "drm/amd/display: Skip Recompute DSC Params if no Stream on Link"
    d253f71605e4 drm/rockchip: vop: enable VOP_FEATURE_INTERNAL_RGB on RK3066
    907717eea14c btrfs: drop the backref cache during relocation if we commit
    4dc6ea8b4d9d btrfs: relocation: constify parameters where possible
    5ae94c639777 btrfs: relocation: return bool from btrfs_should_ignore_reloc_root
    ce31847f109c ACPI: battery: Fix possible crash when unregistering a battery hook
    2deeb3c748da ACPI: battery: Simplify battery hook locking
    712d30f9a505 clk: qcom: gcc-sc8180x: Add GPLL9 support
    1c723d785adb r8169: add tally counter fields added with RTL8125
    f02fcb7283b1 r8169: Fix spelling mistake: "tx_underun" -> "tx_underrun"
    736da4240815 iio: pressure: bmp280: Fix waiting time for BMP3xx configuration
    ae6724f9f13e iio: pressure: bmp280: Fix regmap for BMP280 device
    5da669d9ee26 iio: pressure: bmp280: Use BME prefix for BME280 specifics
    b71b2d704a93 iio: pressure: bmp280: Improve indentation and line wrapping
    afe335a6c5e2 iio: pressure: bmp280: Allow multiple chips id per family of devices
    c059a2661a1d dt-bindings: clock: qcom: Add GPLL9 support on gcc-sc8180x
    65e71cffb833 dt-bindings: clock: qcom: Add missing UFS QREF clocks
    fc1ed6f791e3 remoteproc: k3-r5: Delay notification of wakeup event
    e1df6bbf4771 remoteproc: k3-r5: Acquire mailbox handle during probe routine
    9eac174a9b89 media: imx335: Fix reset-gpio handling
    2b00bc1d7d40 media: i2c: imx335: Enable regulator supplies
    e6be95592c9f RDMA/mana_ib: use the correct page table index based on hardware page size
    6c95c700f2b6 net: mana: Add support for page sizes other than 4KB on ARM64
    86b6cf7e253b net: mana: Enable MANA driver on ARM64 with 4K page size
    1f997b1d13e0 sched: psi: fix bogus pressure spikes from aggregation race
    c83a80d8b84f lib/buildid: harden build ID parsing logic
    f941d779622b build-id: require program headers to be right after ELF header
    a94ec40b9405 drm/amd/display: Allow backlight to go below `AMDGPU_DM_DEFAULT_MIN_BACKLIGHT`
    54ad9c760854 mm: z3fold: deprecate CONFIG_Z3FOLD
    5b981d8335e1 uprobes: fix kernel info leak via "[uprobes]" vma
    24f7989ed2e1 io_uring/net: harden multishot termination case for recv
    3c38faa39e6c arm64: errata: Expand speculative SSBS workaround once more
    9a3e9aab606d arm64: cputype: Add Neoverse-N3 definitions
    c7e0da744932 i2c: synquacer: Deal with optional PCLK correctly
    6109f5319bfd i2c: synquacer: Remove a clk reference from struct synquacer_i2c
    316be4911f63 i2c: core: Lock address during client device instantiation
    4a2be5a72865 i2c: create debugfs entry per adapter
    aac871e493fc platform/x86: x86-android-tablets: Fix use after free on platform_device_register() errors
    2dbc42f554b3 platform/x86: x86-android-tablets: Create a platform_device from module_init()
    ce5ec367994d kconfig: qconf: fix buffer overflow in debug links
    eebc10e92477 cpufreq: intel_pstate: Make hwp_notify_lock a raw spinlock
    68d603f467a7 drm/amd/display: Fix system hang while resume with TBT monitor
    487f6450bcb9 drm/amd/display: Add HDR workaround for specific eDP
    579a0a84e3c0 drm/sched: Add locking to drm_sched_entity_modify_sched
    451c87d21db6 drm/i915/gem: fix bitwise and logical AND mixup
    a8023f8b5598 close_range(): fix the logics in descriptor table trimming
    310d95316791 rtla: Fix the help text in osnoise and timerlat top tools
    8b0f0a268ddb tracing/timerlat: Fix duplicated kthread creation due to CPU online/offline
    a6e9849063a6 tracing/timerlat: Fix a race during cpuhp processing
    a4a05ceffe8f tracing/timerlat: Drop interface_lock in stop_kthread()
    79250decc9ab tracing/hwlat: Fix a race during cpuhp processing
    b8c118c2a2ad ceph: fix cap ref leak via netfs init_request
    e676e4ea76bb mac802154: Fix potential RCU dereference issue in mac802154_scan_worker
    830c03e58beb Bluetooth: hci_event: Align BR/EDR JUST_WORKS paring with LE
    2f4e3926bc50 net: pcs: xpcs: fix the wrong register that was written back
    7c5cd531d093 gpio: davinci: fix lazy disable
    0f41f383b5a6 cpufreq: Avoid a bad reference count on CPU node
    ed87190e9d9c btrfs: wait for fixup workers before stopping cleaner kthread during umount
    521cfe23fbcb btrfs: send: fix invalid clone operation for file that got its size decreased
    7ad0c5868f2f btrfs: fix a NULL pointer dereference when failed to start a new trasacntion
    d7674ed0dcd4 ACPI: resource: Add Asus ExpertBook B2502CVA to irq1_level_low_skip_override[]
    27ec4a380bc1 ACPI: resource: Add Asus Vivobook X1704VAP to irq1_level_low_skip_override[]
    c7d10fa7d769 cachefiles: fix dentry leak in cachefiles_open_file()
    195e42c9a92f Input: adp5589-keys - fix adp5589_gpio_get_value()
    7c3f04223aaf Input: adp5589-keys - fix NULL pointer dereference
    cda7d597245f rtc: at91sam9: fix OF node leak in probe() error path
    03582f475242 net: stmmac: Fix zero-division error when disabling tc cbs
    cd9ce830facd tomoyo: fallback to realpath if symlink's pathname does not exist
    af3122f5fdc0 gso: fix udp gso fraglist segmentation after pull from frag_list
    718a752bd746 vrf: revert "vrf: Remove unnecessary RCU-bh critical section"
    73328d2af5aa iio: magnetometer: ak8975: Fix reading for ak099xx sensors
    3374f06f9544 smb3: fix incorrect mode displayed for read-only files
    472973229cb0 smb: client: use actual path when queryfs
    868e843e522d clk: qcom: clk-alpha-pll: Fix CAL_L_VAL override for LUCID EVO PLL
    5bdb3cc0cced clk: qcom: gcc-sc8180x: Fix the sdcc2 and sdcc4 clocks freq table
    ea3a6938cb9b media: qcom: camss: Fix ordering of pm_runtime_enable
    c2218a82f795 media: qcom: camss: Remove use_count guard in stop_streaming
    8c860f35867a clk: qcom: gcc-sm8250: Do not turn off PCIe GDSCs during gdsc_disable()
    b0686aedc5f1 media: venus: fix use after free bug in venus_remove due to race condition
    56770d1e01d6 clk: qcom: gcc-sm8150: De-register gcc_cpuss_ahb_clk_src
    7e21770654f5 clk: samsung: exynos7885: Update CLKS_NR_FSYS after bindings fix
    8cf5c85d5edf clk: qcom: clk-rpmh: Fix overflow in BCM vote
    1229485abfce media: uapi/linux/cec.h: cec_msg_set_reply_to: zero flags
    e6f63d04c03e clk: qcom: gcc-sm8450: Do not turn off PCIe GDSCs during gdsc_disable()
    6fa24b41d3b5 media: sun4i_csi: Implement link validate for sun4i_csi subdev
    fb2867420e4e clk: qcom: dispcc-sm8250: use CLK_SET_RATE_PARENT for branch clocks
    fc71c2395893 remoteproc: k3-r5: Fix error handling when power-up failed
    bd588d52562a clk: rockchip: fix error for unknown clocks
    eb4df5e36a6e media: ov5675: Fix power on/off delay timings
    acc5103a0a8c aoe: fix the potential use-after-free problem in more places
    1587db113004 riscv: Fix kernel stack size when KASAN is enabled
    83b39493cd00 RDMA/mana_ib: use the correct page size for mapping user-mode doorbell page
    4ac637122930 i3c: master: svc: Fix use after free vulnerability in svc_i3c_master Driver Due to Race Condition
    6b17072c7db5 NFSD: Fix NFSv4's PUTPUBFH operation
    f7d8ee9db943 nfsd: map the EBADMSG to nfserr_io to avoid warning
    33658acea064 nfsd: fix delegation_blocked() to block correctly for at least 30 seconds
    be8d32ebfa0b perf hist: Update hist symbol when updating maps
    bebb4c240500 perf python: Disable -Wno-cast-function-type-mismatch if present on clang
    bf0b3b352594 exfat: fix memory leak in exfat_load_bitmap()
    9a2585ad17cd riscv: define ILLEGAL_POINTER_VALUE for 64bit
    8f91116f3682 arm64: Subscribe Microsoft Azure Cobalt 100 to erratum 3194386
    5f5ec16bd14d arm64: fix selection of HAVE_DYNAMIC_FTRACE_WITH_ARGS
    d52c5652e7dc ocfs2: fix possible null-ptr-deref in ocfs2_set_buffer_uptodate
    86a89e75e9e4 ocfs2: fix null-ptr-deref when journal load failed.
    84543da867c9 ocfs2: remove unreasonable unlock in ocfs2_read_blocks
    ef768020366f ocfs2: cancel dqi_sync_work before freeing oinfo
    637c00e06564 ocfs2: reserve space for inline xattr before attaching reflink tree
    8d176ca5d915 ocfs2: fix uninit-value in ocfs2_get_block()
    e7a801014726 ocfs2: fix the la space leak when unmounting an ocfs2 volume
    e3a9fc1520a6 mm: krealloc: consider spare memory for __GFP_ZERO
    fd3496243409 jbd2: correctly compare tids with tid_geq function in jbd2_fc_begin_commit
    1c62dc0d82c6 jbd2: stop waiting for space when jbd2_cleanup_journal_tail() returns error
    393331e16ce2 resource: fix region_intersects() vs add_memory_driver_managed()
    b57b53e8ffcd drm: omapdrm: Add missing check for alloc_ordered_workqueue
    0022085f11c6 of/irq: Support #msi-cells=<0> in of_msi_get_domain
    d657d28641ec of: address: Report error on resource bounds overflow
    25b7a6703728 drm/rockchip: vop: clear DMA stop bit on RK3066
    a17dfde57704 parisc: Fix stack start for ADDR_NO_RANDOMIZE personality
    62f3e58c4e39 parisc: Allow mmap(MAP_STACK) memory to automatically expand upwards
    42451ba0d6e1 parisc: Fix 64-bit userspace syscall path
    89bbc55d6b16 ext4: mark fc as ineligible using an handle in ext4_xattr_set()
    c5771f1c484c ext4: use handle to mark fc as ineligible in __track_dentry_update()
    d13a3558e824 ext4: fix fast commit inode enqueueing during a full journal commit
    1552199ace59 ext4: fix incorrect tid assumption in jbd2_journal_shrink_checkpoint_list()
    80dccb81b7db ext4: fix incorrect tid assumption in ext4_wait_for_tail_page_commit()
    f55ecc58d07a ext4: update orig_path in ext4_find_extent()
    9203817ba46e ext4: fix timer use-after-free on failed mount
    68a69cf60660 ext4: fix double brelse() the buffer of the extents path
    8162ee5d94b8 ext4: aovid use-after-free in ext4_ext_insert_extent()
    1b558006d98b ext4: drop ppath from ext4_ext_replay_update_ex() to avoid double-free
    93051d16b312 ext4: fix incorrect tid assumption in __jbd2_log_wait_for_space()
    5efccdee4a7d ext4: dax: fix overflowing extents beyond inode size when partially writing
    8c762b4e1921 ext4: fix incorrect tid assumption in ext4_fc_mark_ineligible()
    f4308d8ee384 ext4: propagate errors from ext4_find_extent() in ext4_insert_range()
    8fe117790b37 ext4: fix slab-use-after-free in ext4_split_extent_at()
    a56e5f389d42 ext4: correct encrypted dentry name hash when not casefolded
    2d64e7dada22 ext4: no need to continue when the number of entries is 1
    9cdf65c6c311 ALSA: hda/realtek: Add a quirk for HP Pavilion 15z-ec200
    762650cd5e7f ALSA: hda/realtek: Add quirk for Huawei MateBook 13 KLV-WX9
    3624416ab149 ALSA: line6: add hw monitor volume control to POD HD500X
    228a8b952cf4 ALSA: usb-audio: Add native DSD support for Luxman D-08u
    9d125aab4c47 ALSA: usb-audio: Add delay quirk for VIVO USB-C HEADSET
    aba1be9a804f ALSA: core: add isascii() check to card ID generator
    633d3456849d ALSA: hda/tas2781: Add new quirk for Lenovo Y990 Laptop
    c923bc874659 drm: Consistently use struct drm_mode_rect for FB_DAMAGE_CLIPS
    6e6f89549c66 drm/mediatek: ovl_adaptor: Add missing of_node_put()
    3eff30f2c315 parisc: Fix itlb miss handler for 64-bit programs
    9fca08c06a8d perf/core: Fix small negative period being ignored
    888f728d81f8 power: supply: hwmon: Fix missing temp1_max_alarm attribute
    7febcf11742f spi: bcm63xx: Fix missing pm_runtime_disable()
    f2d0b351e03f spi: bcm63xx: Fix module autoloading
    0a42f6360798 dt-bindings: clock: exynos7885: Fix duplicated binding
    ff580d01301e memory: tegra186-emc: drop unused to_tegra186_emc()
    028258156f65 firmware: tegra: bpmp: Drop unused mbox_client_to_bpmp()
    bf47be5479b3 ovl: fail if trusted xattrs are needed but caller lacks permission
    6fcd6feaf132 rust: sync: require `T: Sync` for `LockedBy::access`
    d6c159c066d2 i2c: designware: fix controller is holding SCL low while ENABLE bit is disabled
    b80dc74c386f i2c: xiic: Fix pm_runtime_set_suspended() with runtime pm enabled
    625a77b68c96 media: i2c: ar0521: Use cansleep version of gpiod_set_value()
    c0e00163f804 i2c: xiic: Wait for TX empty to avoid missed TX NAKs
    7e263fd6efba i2c: qcom-geni: Use IRQF_NO_AUTOEN flag in request_irq()
    22a1f8a5b56b i2c: stm32f7: Do not prepare/unprepare clock during runtime suspend/resume
    8176d4878ed2 platform/x86: ISST: Fix the KASAN report slab-out-of-bounds bug
    b8c0aee7c2a5 Revert "ALSA: hda: Conditionally use snooping for AMD HDMI"
    2c74d33dbfd9 selftests: vDSO: fix vdso_config for s390
    0fe35c473713 selftests: vDSO: fix ELF hash table entry size for s390x
    676727021dbd powerpc/vdso: Fix VDSO data access when running in a non-root time namespace
    dfb569762ce7 selftests/mm: fix charge_reserved_hugetlb.sh test
    b88842a9f1b8 selftests: vDSO: fix vDSO symbols lookup for powerpc64
    d3b90ed9a08d selftests: vDSO: fix vdso_config for powerpc
    6c8aff20229f selftests: vDSO: fix vDSO name for powerpc
    9629c0c3e876 perf: Really fix event_function_call() locking
    42cd165b4cf8 perf callchain: Fix stitch LBR memory leaks
    e2955fbe08b0 spi: rpc-if: Add missing MODULE_DEVICE_TABLE
    106f10fef0b9 accel/ivpu: Add missing MODULE_FIRMWARE metadata
    4019391dfe37 selftests: breakpoints: use remaining time to check if suspend succeed
    c2aa41032872 spi: s3c64xx: fix timeout counters in flush_fifo
    dbda70bbe421 selftest: hid: add missing run-hid-tools-tests.sh
    494380a4e4c0 spi: spi-cadence: Fix missing spi_controller_is_target() check
    97aa3293db69 spi: spi-cadence: Fix pm_runtime_set_suspended() with runtime pm enabled
    97f76711a90e spi: spi-cadence: Use helper function devm_clk_get_enabled()
    d6e3898d62a8 spi: spi-imx: Fix pm_runtime_set_suspended() with runtime pm enabled
    c2d9f9a7837a bpftool: Fix undefined behavior in qsort(NULL, 0, ...)
    390b9e54cdfd iomap: handle a post-direct I/O invalidate race in iomap_write_delalloc_release
    ad762c520471 bpftool: Fix undefined behavior caused by shifting into the sign bit
    d43776b90765 ext4: fix i_data_sem unlock order in ext4_ind_migrate()
    34b2096380ba ext4: avoid use-after-free in ext4_ext_show_leaf()
    1fe2852720cd ext4: ext4_search_dir should return a proper error
    b111ae42bbfd bpf: Make the pointer returned by iter next method valid
    18f06bacc197 ksmbd: add refcnt to ksmbd_conn struct
    f5e30a30fce7 platform/x86: lenovo-ymc: Ignore the 0x0 state
    4298813a43f7 drm/amdgpu/gfx10: use rlc safe mode for soft recovery
    c20cd3d6d261 drm/amdgpu/gfx11: use rlc safe mode for soft recovery
    e16a6d1a3357 powerpc/pseries: Use correct data types from pseries_hp_errorlog struct
    fe2c86e1927e of/irq: Refer to actual buffer size in of_irq_parse_one()
    b511474f4958 drm/amd/pm: ensure the fw_info is not null before using it
    3ffbdc977d80 drm/amdgpu/gfx9: use rlc safe mode for soft recovery
    8361e3f78828 drm/amdgpu: Block MMR_READ IOCTL in reset
    c474a1a75599 drm/radeon/r100: Handle unknown family in r100_cp_init_microcode()
    ee5d547006d3 scsi: NCR5380: Initialize buffer for MSG IN and STATUS transfers
    66a403d89b73 perf: Fix event_function_call() locking
    deb78dc859dd drm/amdgpu: fix unchecked return value warning for amdgpu_gfx
    5e0e1a941e57 scsi: lpfc: Update PRLO handling in direct attached topology
    55119faf5abc scsi: aacraid: Rearrange order of struct aac_srb_unit
    adf290fe434c perf,x86: avoid missing caller address in stack traces captured in uprobe
    4ee08b4a7201 drm/printer: Allow NULL data in devcoredump printer
    c7630935d9a4 drm/amd/display: Initialize get_bytes_per_element's default to 1
    a1495acc6234 drm/amd/display: Avoid overflow assignment in link_dp_cts
    929506d56714 drm/amd/display: Fix index out of bounds in DCN30 color transformation
    122e3a7a8c7b drm/amd/display: Fix index out of bounds in degamma hardware format translation
    0d38a0751143 drm/amd/display: Fix index out of bounds in DCN30 degamma hardware format translation
    be2ca7a2c156 drm/amd/display: Check link_res->hpo_dp_link_enc before using it
    42d31a336438 drm/amd/display: Check stream before comparing them
    fb557a36b0b9 drm/stm: ltdc: reset plane transparency after plane disable
    64f38c08b592 platform/x86: touchscreen_dmi: add nanote-next quirk
    651ba62c255f HID: multitouch: Add support for Thinkpad X12 Gen 2 Kbd Portfolio
    71cfb54e0f0c drm/amdkfd: Fix resource leak in criu restore queue
    fe90214179d5 drm/amdgpu: enable gfxoff quirk on HP 705G4
    a3c8cbefce38 drm/amdgpu: add raven1 gfxoff quirk
    c076b3746224 jfs: Fix uninit-value access of new_ea in ea_buffer
    9288a9676c52 drm/msm/adreno: Assign msm_gpu->pdev earlier to avoid nullptrs
    4155dff76a8c scsi: smartpqi: correct stream detection
    7fff9a9f866e jfs: check if leafidx greater than num leaves per dmap tree
    4218b31ecc7a jfs: Fix uaf in dbFreeBits
    f04925a02ea2 jfs: UBSAN: shift-out-of-bounds in dbFindBits
    cf6f3ebd6312 drm/amd/display: fix double free issue during amdgpu module unload
    75839e2365b6 drm/amd/display: Add null check for 'afb' in amdgpu_dm_plane_handle_cursor_update (v2)
    9641bc4adf84 drm/amd/display: Check null pointers before using dc->clk_mgr
    4778982c73d6 drm/amd/display: Handle null 'stream_status' in 'planes_changed_for_existing_stream'
    6ec7c739346c HID: Ignore battery for all ELAN I2C-HID devices
    29d2d5eda393 ata: sata_sil: Rename sil_blacklist to sil_quirks
    8fcf85196adc ata: pata_serverworks: Do not use the term blacklist
    e47e563c6f0d drm/amd/display: Add null check for top_pipe_to_program in commit_planes_for_stream
    30ceb873cc2e drm/amdkfd: amdkfd_free_gtt_mem clear the correct pointer
    44e4aeaef96b drm/amdgpu: disallow multiple BO_HANDLES chunks in one submit
    0a1741d10da2 drm/stm: Avoid use-after-free issues with crtc and plane
    dfdbc5ba10fb iommu/vt-d: Fix potential lockup if qi_submit_sync called with 0 count
    54e86bfec010 iommu/vt-d: Always reserve a domain ID for identity setup
    1c36eb173249 power: reset: brcmstb: Do not go into infinite loop if reset fails
    2d56271fce96 rcuscale: Provide clear error when async specified without primitives
    fdda354f60a5 fbdev: pxafb: Fix possible use after free in pxafb_task()
    36bfefb6baaa fbdev: efifb: Register sysfs groups through driver core
    4b101d2f40df hwmon: (nct6775) add G15CF to ASUS WMI monitoring list
    2de5fd836bd6 x86/syscall: Avoid memcpy() for ia32 syscall_get_arguments()
    e9df4c61079e selftests/nolibc: avoid passing NULL to printf("%s")
    fc975b8daba2 tools/nolibc: powerpc: limit stack-protector workaround to GCC
    6cc4e5eaadae ALSA: hdsp: Break infinite MIDI input flush loop
    7a5574099670 ALSA: asihpi: Fix potential OOB array access
    ddd52c9fe992 x86/kexec: Add EFI config table identity mapping for kexec kernel
    407abc7e0c7f x86/pkeys: Restore altstack access in sigreturn()
    19059128205f x86/pkeys: Add PKRU as a parameter in signal handling functions
    ef6c1ed5887f tools/x86/kcpuid: Protect against faulty "max subleaf" values
    71faa656b8e7 ASoC: codecs: wsa883x: Handle reading version failure
    70d5e30b0a3c ALSA: usb-audio: Add logitech Audio profile quirk
    fb2ed616af7e ALSA: usb-audio: Replace complex quirk lines with macros
    0bf9779cd954 ALSA: usb-audio: Define macros for quirk table entries
    077e1b7cd521 x86/ioapic: Handle allocation failures gracefully
    864f68a24293 ALSA: usb-audio: Add input value sanity checks for standard types
    f888741fcfab nfp: Use IRQF_NO_AUTOEN flag in request_irq()
    fef7b51f22cf wifi: mwifiex: Fix memcpy() field-spanning write warning in mwifiex_cmd_802_11_scan_ext()
    0a630d690b7f wifi: mt76: mt7915: hold dev->mt76.mutex while disabling tx worker
    833ebae26663 wifi: mt76: mt7915: add dummy HW offload of IEEE 802.11 fragmentation
    b4f8240bc389 can: netlink: avoid call to do_set_data_bittiming callback with stale can_priv::ctrlmode
    b017f4f6709a drivers/perf: arm_spe: Use perf_allow_kernel() for permissions
    8552508033b2 proc: add config & param to block forcing mem writes
    8b2906e1349a ACPICA: iasl: handle empty connection_node
    f37319609335 wifi: mac80211: fix RCU list iterations
    6dcadb2ed3b7 wifi: iwlwifi: mvm: avoid NULL pointer dereference
    324116255492 wifi: iwlwifi: mvm: use correct key iteration
    5cce1c07bf89 tcp: avoid reusing FIN_WAIT2 when trying to find port in connect() process
    27fe713c62a1 netpoll: Ensure clean state on setup failures
    b60d2bc676e4 crypto: simd - Do not call crypto_alloc_tfm during registration
    0f6dab0b79f1 net: atlantic: Avoid warning about potential string truncation
    f989162f55ed ipv4: Mask upper DSCP bits and ECN bits in NETLINK_FIB_LOOKUP family
    239ac7faeaea wifi: rtw89: correct base HT rate mask for firmware
    d4c4653b60de ipv4: Check !in_dev earlier for ioctl(SIOCSIFADDR).
    0d6255e512b3 bnxt_en: Extend maximum length of version string by 1 byte
    74834f4a6c19 net: mvpp2: Increase size of queue_name buffer
    12d26aa7fd3c tipc: guard against string buffer overrun
    4588ea78d390 ACPICA: check null return of ACPI_ALLOCATE_ZEROED() in acpi_db_convert_to_package()
    93d065b704bd ACPI: EC: Do not release locks during operation region accesses
    90ec583a85c4 wifi: rtw88: select WANT_DEV_COREDUMP
    7a552bc2f3ef wifi: ath11k: fix array out-of-bound access in SoC stats
    d0e4274d9dc9 wifi: ath12k: fix array out-of-bound access in SoC stats
    1ab2cfe19700 blk_iocost: fix more out of bound shifts
    29dbea4c56df ACPI: CPPC: Add support for setting EPP register in FFH
    716dae9686fe ACPI: video: Add force_vendor quirk for Panasonic Toughbook CF-18
    cc026a7f9be6 Bluetooth: btrtl: Set msft ext address filter quirk for RTL8852B
    18ed567ad0aa Bluetooth: btusb: Add Realtek RTL8852C support ID 0x0489:0xe122
    37a6fc0d8fca net: sched: consistently use rcu_replace_pointer() in taprio_change()
    3f5625e9e92b wifi: mt76: mt7915: disable tx worker during tx BA session enable/disable
    1c6db07811fb e1000e: avoid failing the system during pm_suspend
    13ca2b3568fb ACPICA: Fix memory leak if acpi_ps_get_next_field() fails
    0b02303431a3 ACPICA: Fix memory leak if acpi_ps_get_next_namepath() fails
    68a8e45743d6 ACPI: PAD: fix crash in exit_round_robin()
    0a94777ba4ca net: hisilicon: hns_mdio: fix OF node leak in probe()
    359a218ce1a9 net: hisilicon: hns_dsaf_mac: fix OF node leak in hns_mac_get_info()
    f62bf4ffeba5 net: hisilicon: hip04: fix OF node leak in probe()
    143edf098b80 net/xen-netback: prevent UAF in xenvif_flush_hash()
    04053e55dd50 wifi: cfg80211: Set correct chandef when starting CAC
    d76360adabd6 wifi: iwlwifi: mvm: drop wrong STA selection in TX
    191e8d525620 wifi: iwlwifi: mvm: Fix a race in scan abort flow
    82465e05ca6f ice: Adjust over allocation of memory in ice_sched_add_root_node() and ice_sched_add_node()
    21ba7132a911 crypto: octeontx2 - Fix authenc setkey
    0ac97b001cce crypto: octeontx - Fix authenc setkey
    6300199be334 crypto: x86/sha256 - Add parentheses around macros' single arguments
    e37e34883503 wifi: ath9k_htc: Use __skb_set_length() for resetting urb before resubmit
    fdc73f2cfbe8 wifi: rtw89: avoid to add interface to list twice when SER
    e6e4cfb5f6d6 wifi: ath9k: fix possible integer overflow in ath9k_get_et_stats()
    40346cbb19ad ALSA: hda/conexant: Fix conflicting quirk for System76 Pangolin
    b0f3c6a2d0bd ALSA: gus: Fix some error handling paths related to get_bpos() usage
    2c3c1f87cf7e cifs: Do not convert delimiter when parsing NFS-style symlinks
    c6db81c550ce cifs: Fix buffer overflow when parsing NFS reparse points
    92e71ccd8fd4 ASoC: imx-card: Set card.owner to avoid a warning calltrace if SND=m
    f8f081578b5b ALSA: hda/generic: Unconditionally prefer preferred_dacs pairs
    e4c886dd24a3 cifs: Remove intermediate object of failed create reparse call
    fa72abf31bd0 ALSA: hda/realtek: Fix the push button function for the ALC257
    466129e3d0ad ALSA: mixer_oss: Remove some incorrect kfree_const() usages
    0152c81f61fa ASoC: atmel: mchp-pdmc: Skip ALSA restoration if substream runtime is uninitialized
    28234f8ab69c Bluetooth: L2CAP: Fix not validating setsockopt user input
    6a6baa1ee7a9 Bluetooth: ISO: Fix not validating setsockopt user input
    dea46e246ef0 media: usbtv: Remove useless locks in usbtv_video_free()
    0c18a64039aa Bluetooth: hci_sock: Fix not validating setsockopt user input
    b66ff9a3fc90 loop: don't set QUEUE_FLAG_NOMERGES
    3000f3a86dd0 i2c: xiic: Try re-initialization on bus busy timeout
    7c48b5a6c32c i2c: xiic: improve error message when transfer fails to start
    7f64cb5b4d8c sctp: set sk_state back to CLOSED if autobind fails in sctp_listen_start
    25a54df40841 dt-bindings: net: xlnx,axi-ethernet: Add missing reg minItems
    1372c7579ec5 iomap: constrain the file range passed to iomap_file_unshare
    f9620e2a665a ppp: do not assume bh is held in ppp_channel_bridge_input()
    d9dfd41e32cc net: test for not too small csum_start in virtio_net_hdr_to_skb()
    ea8cad4ca5e0 ipv4: ip_gre: Fix drops of small packets in ipgre_xmit
    a9ad307c0dde net: stmmac: dwmac4: extend timeout for VLAN Tag register busy bit check
    9b0ee571d20a net: add more sanity checks to qdisc_pkt_len_init()
    25ab0b87dbd8 net: avoid potential underflow in qdisc_pkt_len_init() with UFO
    da143240028c net: fec: Reload PTP registers after link-state change
    dc5fb264168c net: fec: Restart PPS after link state change
    e66e38d07b31 net: ethernet: lantiq_etop: fix memory disclosure
    718b66340364 net: Fix gso_features_check to check for both dev->gso_{ipv4_,}max_size
    dae9b99bd21f net: Add netif_get_gro_max_size helper for GRO
    f0a84ad84d98 Bluetooth: btmrvl: Use IRQF_NO_AUTOEN flag in request_irq()
    b90907696c30 Bluetooth: L2CAP: Fix uaf in l2cap_connect
    4883296505aa Bluetooth: MGMT: Fix possible crash on mgmt_index_removed
    4e3542f40f3a netfilter: nf_tables: prevent nf_skb_duplicated corruption
    fe9ccbf1b749 selftests: netfilter: Fix nft_audit.sh for newer nft binaries
    271b4904727b net: wwan: qcom_bam_dmux: Fix missing pm_runtime_disable()
    96858258de2f net: ieee802154: mcr20a: Use IRQF_NO_AUTOEN flag in request_irq()
    8691a82abf0c netfilter: uapi: NFTA_FLOWTABLE_HOOK is NLA_NESTED
    fab615ac9fcb net/mlx5e: Fix crash caused by calling __xfrm_state_delete() twice
    0168ab6fbd9e net/mlx5e: Fix NULL deref in mlx5e_tir_builder_alloc()
    1c252d64652e net/mlx5: Added cond_resched() to crdump collection
    26fad69b34fc net/mlx5: Fix error path in multi-packet WQE transmit
    70db858273c7 net: sparx5: Fix invalid timestamps
    d6c4c0867086 ieee802154: Fix build error
    11ab19d48ab8 ceph: remove the incorrect Fw reference check when dirtying pages
    10a58555e0bb mailbox: bcm2835: Fix timeout during suspend mode
    b372b484d232 mailbox: rockchip: fix a typo in module autoloading
    7879ad0aa996 drm/amdgpu: Fix get each xcp macro
    f42595fb8fdb scsi: pm8001: Do not overwrite PCI queue mapping
    6b63cda2d4f4 scsi: st: Fix input/output error on empty drive reset
    86fdd1806461 jump_label: Fix static_key_slow_dec() yet again
    33f3e832275e jump_label: Simplify and clarify static_key_fast_inc_cpus_locked()
    e67534bd31d7 static_call: Replace pointless WARN_ON() in static_call_module_notify()
    c0abbbe8c98c static_call: Handle module init failure correctly in static_call_del_module()
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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7829fdb1f05cf04d55d25db2d3ff705626008105)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 7fc0fd078e..67ab87170a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "0ce49672227f66ded53377427efc1f3db72accf6"
-SRCREV_meta ?= "531f6c1ed43222e5c607853390a832479e881d81"
+SRCREV_machine ?= "b4c40099f879ea449a59d7a503481a17c3e66210"
+SRCREV_meta ?= "e9e4b926a150efa11d55c454e1230a6ffa557aa7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.54"
+LINUX_VERSION ?= "6.6.56"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 86d8f34c1a..364752185a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.54"
+LINUX_VERSION ?= "6.6.56"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "df7d92644aafc470930586d9076bafa24f063e06"
-SRCREV_meta ?= "531f6c1ed43222e5c607853390a832479e881d81"
+SRCREV_machine ?= "fa499b0011358a6816108e097efae3d689242b7e"
+SRCREV_meta ?= "e9e4b926a150efa11d55c454e1230a6ffa557aa7"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 949dbfd7e0..0b9cec5dd2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "ec07bf6095980f034280a64993ca4a02553c6cfa"
-SRCREV_machine:qemuarm64 ?= "df7d92644aafc470930586d9076bafa24f063e06"
-SRCREV_machine:qemuloongarch64 ?= "df7d92644aafc470930586d9076bafa24f063e06"
-SRCREV_machine:qemumips ?= "a452bfda5b8d19a09e56194b9581db1d6c258008"
-SRCREV_machine:qemuppc ?= "df7d92644aafc470930586d9076bafa24f063e06"
-SRCREV_machine:qemuriscv64 ?= "df7d92644aafc470930586d9076bafa24f063e06"
-SRCREV_machine:qemuriscv32 ?= "df7d92644aafc470930586d9076bafa24f063e06"
-SRCREV_machine:qemux86 ?= "df7d92644aafc470930586d9076bafa24f063e06"
-SRCREV_machine:qemux86-64 ?= "df7d92644aafc470930586d9076bafa24f063e06"
-SRCREV_machine:qemumips64 ?= "d0ba176a1f0f743b807fbb13d062b9a6156cafca"
-SRCREV_machine ?= "df7d92644aafc470930586d9076bafa24f063e06"
-SRCREV_meta ?= "531f6c1ed43222e5c607853390a832479e881d81"
+SRCREV_machine:qemuarm ?= "13d5d6eadef09782574d682a8ab07833cd707568"
+SRCREV_machine:qemuarm64 ?= "fa499b0011358a6816108e097efae3d689242b7e"
+SRCREV_machine:qemuloongarch64 ?= "fa499b0011358a6816108e097efae3d689242b7e"
+SRCREV_machine:qemumips ?= "c766982c5c5fe27a21d86eefb8b6d9008ead2ae9"
+SRCREV_machine:qemuppc ?= "fa499b0011358a6816108e097efae3d689242b7e"
+SRCREV_machine:qemuriscv64 ?= "fa499b0011358a6816108e097efae3d689242b7e"
+SRCREV_machine:qemuriscv32 ?= "fa499b0011358a6816108e097efae3d689242b7e"
+SRCREV_machine:qemux86 ?= "fa499b0011358a6816108e097efae3d689242b7e"
+SRCREV_machine:qemux86-64 ?= "fa499b0011358a6816108e097efae3d689242b7e"
+SRCREV_machine:qemumips64 ?= "917501a67b861765419d9ad1051de54d3353a9c8"
+SRCREV_machine ?= "fa499b0011358a6816108e097efae3d689242b7e"
+SRCREV_meta ?= "e9e4b926a150efa11d55c454e1230a6ffa557aa7"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "63a57420cf797edcfca41005dd6c805b77cfb596"
+SRCREV_machine:class-devupstream ?= "d4576c5670090297b903771726a526f81fdd8c7c"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.54"
+LINUX_VERSION ?= "6.6.56"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


