Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D2FCF649D
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 01:57:46 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.45279.1727661460934582588
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Sep 2024 18:57:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=M7CuYNKe;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-718da0821cbso2985910b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 18:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727661460; x=1728266260; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QeXQwKfsSEAO60lkUNr0FrYnpN7fi4HTK7/WX5zsP6s=;
        b=M7CuYNKe+6dhaFZkBjzgtO5bgZ9pASzXYocN/+oJzVrPMpp5d1RUtZANVLVJTCbHTF
         /muG0V9pk1kqMy4rNbfGUJCYLz2o9goz/6tbgYJU7f8NuN+F/ZhVoo1LiudMa8PBq8xb
         BEUWBB7OvaChRiEg995A1vCcz9kCBJbF2SSpLZg3yymN79Mf7x5P0ipVX0JJ6898G/rQ
         sf1jJ6BOPX+h9oJfKJQSiA93WuNAAj1bO2f+CxWKHouhzIz58Rq1779fUdhlNwxRM50W
         /kO5k9cXkIgCm4WB/Cw9X829nv9cPGu0GJFSkxvsYZg14n3TbGO+ic4zcbvz9buaf5DO
         xcEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727661460; x=1728266260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QeXQwKfsSEAO60lkUNr0FrYnpN7fi4HTK7/WX5zsP6s=;
        b=C3ldMAMT5uur/Kzijojbe9ndLqS3FNo4pwOtEpxMPXpFJ6DbDlFxWZLn2YCiP4QbNm
         kvSd3Y3IglEyGz7n5Jr3mcEAzrxfOmrCBhJW542JdtSKmDqZah3HDj5aHgatrBxj7kE4
         S8TWO04KMh53I2xld6iuvIsBNZ4/rro4cpDUutAvKSclZNioFbLAacpfFDgUcKG2flcJ
         swKHKb/eVPUPli8N91/A+Zrgwho9wUhKVkJICTbTqnZjsdKi5RyMklUz20cZOIMWEmvs
         NediJG0JwsXpycJMCZ6ehKc+5URJW0fPMS2/QwE9yawQYAbNnjt/SoLTTWqgLdfvAjLO
         D31w==
X-Gm-Message-State: AOJu0YyPdCXd6ysrVzcGNnk1E8+MwHyfZhuAz55kUqMEymZx2AKbHBjL
	v7+QCsBGYBgsKoDi1TzVej6p807JKWQfRYu8ZpPXKKwYSG6XoDdO3a7Te+gcxGI6Wn0vUp/FdPS
	O9dM=
X-Google-Smtp-Source: AGHT+IEpzJF5zfFzmSRZ6R9+qWMoU2DlT475eI5KJEsapAMFogWSMlhIC1sCDqIvUp4J0OII3YCEjg==
X-Received: by 2002:a05:6a20:c797:b0:1d2:bbfc:769e with SMTP id adf61e73a8af0-1d4fa78fce7mr14123324637.38.1727661459785;
        Sun, 29 Sep 2024 18:57:39 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0d4af744bsm5496070a91.23.2024.09.29.18.57.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 18:57:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/27] linux-yocto/6.6: update to v6.6.43
Date: Sun, 29 Sep 2024 18:57:01 -0700
Message-Id: <26fb3e533df840fb6548349df6f2fcf4f1e2421c.1727661284.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727661284.git.steve@sakoman.com>
References: <cover.1727661284.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 01:57:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205068

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    58b0425ff5df Linux 6.6.43
    aa6a5704cab8 tap: add missing verification for short frame
    d5ad89b7d01e tun: add missing verification for short frame
    73ae349534eb filelock: Fix fcntl/close race recovery compat path
    2c71ab5270b0 ALSA: seq: ump: Skip useless ports for static blocks
    0dbe2b3bb3f8 ALSA: pcm_dmaengine: Don't synchronize DMA channel when DMA is paused
    6782e4f60e39 arm64: dts: qcom: sdm630: Disable SS instance in Parkmode for USB
    9583ad410f33 arm64: dts: qcom: ipq6018: Disable SS instance in Parkmode for USB
    b96d67d87302 arm64: dts: qcom: sm6350: Disable SS instance in Parkmode for USB
    2a3ce77c0a1c arm64: dts: qcom: msm8996: Disable SS instance in Parkmode for USB
    104456f7f4e4 arm64: dts: qcom: qrb4210-rb2: switch I2C2 to i2c-gpio
    d80ab0197054 ALSA: hda/realtek: Fix the speaker output on Samsung Galaxy Book Pro 360
    15e218ab0ac0 ALSA: hda/realtek: Enable headset mic on Positivo SU C1400
    9f0fb112647b usb: gadget: midi2: Fix incorrect default MIDI2 protocol setup
    6ae7265a7b81 fs/ntfs3: Validate ff offset
    f3124d51e4e7 fs/ntfs3: Add a check for attr_names and oatbl
    17440dbc66ab jfs: don't walk off the end of ealist
    e05a24289db9 ocfs2: add bounds checking to ocfs2_check_dir_entry()
    4edb0a84e6b3 drm/amdgpu: Fix signedness bug in sdma_v4_0_process_trap_irq()
    31cf7ebee80a Linux 6.6.42
    9e67589a4a7b cachefiles: fix slab-use-after-free in cachefiles_withdraw_cookie()
    9dd7f5663899 cachefiles: fix slab-use-after-free in fscache_withdraw_volume()
    5c5a577a2cc6 netfs, fscache: export fscache_put_volume() and add fscache_try_get_volume()
    6f1fc7fea4b2 wifi: iwlwifi: mvm: don't wake up rx_sync_waitq upon RFKILL
    ba780cb0cf9a wifi: mac80211: disable softirqs for queued frame handling
    de3994a44ebc wifi: cfg80211: wext: set ssids=NULL for passive scans
    9ca15d7699b1 of/irq: Disable "interrupt-map" parsing for PASEMI Nemo
    b0fc1bd2514b Bluetooth: L2CAP: Fix deadlock
    16380f52b721 mm: page_ref: remove folio_try_get_rcu()
    170ce55eff1f ARM: 9324/1: fix get_user() broken with veneer
    c15682ed16c1 cifs: fix noisy message on copy_file_range
    05ffaf48e22f ALSA: hda: Use imply for suggesting CONFIG_SERIAL_MULTI_INSTANTIATE
    dcd61f34f6e2 spi: mux: set ctlr->bits_per_word_mask
    e41db26543ef selftests/bpf: Extend tcx tests to cover late tcx_entry release
    f08956d8e0f8 hfsplus: fix uninit-value in copy_name
    54f137ee27cc selftests/vDSO: fix clang build errors and warnings
    69f6e9be8713 selftest/timerns: fix clang build failures for abs() calls
    8a3f2ad55f6f ASoC: SOF: Intel: hda-pcm: Limit the maximum number of periods by MAX_BDL_ENTRIES
    d59ccdc4ab4d ksmbd: return FILE_DEVICE_DISK instead of super magic
    bd3ca9bb56aa spi: imx: Don't expect DMA for i.MX{25,35,50,51,53} cspi devices
    55f6da7051e9 riscv: stacktrace: fix usage of ftrace_graph_ret_addr()
    b0fe6e72e690 drivers/perf: riscv: Reset the counter to hpmevent mapping while starting cpus
    d454b32bd2b1 wifi: iwlwifi: properly set WIPHY_FLAG_SUPPORTS_EXT_KEK_KCK
    c09e07857ccd fs: better handle deep ancestor chains in is_subdir()
    f13c96e0e325 drm/radeon: check bo_va->bo is non-NULL before using it
    607731f315d1 drm/amd/display: Fix refresh rate range for some panel
    6ecf239f71ef drm/amd/display: Account for cursor prefetch BW in DML1 mode support
    531e7852fb62 drm/amd/display: Add refresh rate range check
    a2cfe94aa1e2 erofs: ensure m_llen is reset to 0 if metadata is invalid
    b803f30ea23e bluetooth/l2cap: sync sock recv cb and release
    fb02ce1686fb Bluetooth: btnxpuart: Enable Power Save feature on startup
    d6cbce183706 Bluetooth: hci_core: cancel all works upon hci_unregister_dev()
    58911b7abeb5 tee: optee: ffa: Fix missing-field-initializers warning
    945658c21105 scsi: libsas: Fix exp-attached device scan after probe failure scanned in again after probe failed
    f23c3d1ca9c4 powerpc/eeh: avoid possible crash when edev->pdev changes
    e512a59b4726 powerpc/pseries: Whitelist dtl slub object for copying to userspace
    cf3f20313a54 net: mac802154: Fix racy device stats updates by DEV_STATS_INC() and DEV_STATS_ADD()
    30ac8d5e1ba2 net: usb: qmi_wwan: add Telit FN912 compositions
    16cb62c3a625 ASoC: amd: yc: Fix non-functional mic on ASUS M5602RA
    c305a708bcab ALSA: dmaengine_pcm: terminate dmaengine before synchronize
    85b47cd51509 ALSA: hda/relatek: Enable Mute LED on HP Laptop 15-gw0xxx
    802a745caf89 ALSA: PCM: Allow resume only for suspended streams
    267c61c4afed ibmvnic: Add tx check to prevent skb leak
    f88aeff5a173 btrfs: qgroup: fix quota root leak after quota disable failure
    9f25bd7013a3 platform/x86: lg-laptop: Use ACPI device handle when evaluating WMAB/WMBB
    477112af1d48 platform/x86: lg-laptop: Change ACPI device id
    c98123cedbb7 platform/x86: lg-laptop: Remove LGEX0815 hotkey handling
    cd337341cf73 platform/x86: wireless-hotkey: Add support for LG Airplane Button
    939f33bf73f4 platform/mellanox: nvsw-sn2201: Add check for platform_device_add_resources
    0a31b3fdc7e7 s390/sclp: Fix sclp_init() cleanup on failure
    38608d072fcd octeontx2-pf: Fix coverity and klockwork issues in octeon PF driver
    e2ecdddca80d gpio: pca953x: fix pca953x_irq_bus_sync_unlock race
    e4fca9acc7c5 can: kvaser_usb: fix return value for hif_usb_send_regout
    528466f921aa Input: ads7846 - use spi_device_id table
    e7ba46682ae3 nvme: fix NVME_NS_DEAC may incorrectly identifying the disk as EXT_LBA.
    21cb9c4f5bff ASoC: rt722-sdca-sdw: add debounce time for type detection
    e18dfef2b51e ASoC: SOF: sof-audio: Skip unprepare for in-use widgets on error rollback
    9d944d4aa97a ASoC: ti: omap-hdmi: Fix too long driver name
    02c6dd05b095 ASoC: ti: davinci-mcasp: Set min period size using FIFO config
    3b0b50a695cc ALSA: dmaengine: Synchronize dma channel after drop()
    e3394dcb8101 bytcr_rt5640 : inverse jack detect for Archos 101 cesium
    1a13bf4d6a75 ASoC: topology: Do not assign fields that are already set
    ab5a6208b4d6 ASoC: topology: Fix references to freed memory
    423b0c32b0ad Input: xpad - add support for ASUS ROG RAIKIRI PRO
    57534d83687b ASoC: rt722-sdca-sdw: add silence detection register as volatile
    14f445365f91 Input: i8042 - add Ayaneo Kun to i8042 quirk table
    66b1dbc55d8f Input: elantech - fix touchpad state on resume for Lenovo N24
    be7b66d360d2 mips: fix compat_sys_lseek syscall
    94288fc3a19f ALSA: hda: cs35l56: Select SERIAL_MULTI_INSTANTIATE
    86a6a3964f60 drm/amdgpu: Indicate CU havest info to CP
    c436a2351c8d selftests: openvswitch: Set value to nla flags.
    b235848f40ed cpumask: limit FORCE_NR_CPUS to just the UP case
    4bcb8e4c9ff6 spi: Fix OCTAL mode support
    9155f7654461 ALSA: hda/realtek: Add more codec ID to no shutup pins list
    808e92e8c2e7 drm/vmwgfx: Fix missing HYPERVISOR_GUEST dependency
    82c7a4cf14aa KVM: PPC: Book3S HV: Prevent UAF in kvm_spapr_tce_attach_iommu_group()
    1d45fff5da5c ALSA: hda/realtek: Support Lenovo Thinkbook 16P Gen 5
    fe9644efd867 wifi: cfg80211: wext: add extra SIOCSIWSCAN data check
    4871dd2f7193 ALSA: hda: cs35l56: Fix lifecycle of codec pointer
    10967873b807 nvmet: always initialize cqe.result
    ae84383c96d6 nvme: avoid double free special payload
    b241d17aa19f drm/mediatek: Call drm_atomic_helper_shutdown() at shutdown time
    97f71343f794 drm: panel-orientation-quirks: Add quirk for Aya Neo KUN
    208fde6de0f0 drm/exynos: dp: drop driver owner initialization
    24be4091b801 iomap: Fix iomap_adjust_read_range for plen calculation
    53e0b76603dd mei: demote client disconnect warning on suspend to debug
    bd56b910fa94 fs/file: fix the check in find_next_fd()
    7c6ec0827cfe cachefiles: make on-demand read killable
    c32ee78fbc67 cachefiles: Set object to close if ondemand_id < 0 in copen
    36d845ccd7bf cachefiles: add consistency check for copen/cread
    3146a6af8272 nfs: don't invalidate dentries on transient errors
    e3adf9987e90 nfs: Avoid flushing many pages with NFS_FILE_SYNC
    8cebc59d6e8c nfs: propagate readlink errors in nfs_symlink_filler
    b98090699319 NFSv4: Fix memory leak in nfs4_set_security_label
    c7734ddaea85 HID: Ignore battery for ELAN touchscreens 2F2C and 4116
    dd93f857ecc9 input: Add support for "Do Not Disturb"
    39bd2e1c7990 input: Add event code for accessibility key
    d9be8eeab03e kconfig: remove wrong expr_trans_bool()
    737161b438fc kconfig: gconf: give a proper initial state to the Save button
    08f03186b96e null_blk: fix validation of block size
    69a978c7fe2f arm64: armv8_deprecated: Fix warning in isndep cpuhp starting process
    522c3336c202 ila: block BH in ila_output()
    127707132f70 net: ipv6: rpl_iptunnel: block BH in rpl_output() and rpl_input()
    9d88edbe3d4a Input: silead - Always support 10 fingers
    b0f79bda5501 of/irq: Factor out parsing of interrupt-map parent phandle+args from of_irq_parse_raw()
    c9edeb94d16f selftests/futex: pass _GNU_SOURCE without a value to the compiler
    b182dede1a0c selftests/openat2: Fix build warnings on ppc64
    91bf0634230f selftests: cachestat: Fix build warnings on ppc64
    a1834cfcdf2e wifi: mac80211: fix UBSAN noise in ieee80211_prep_hw_scan()
    f5e6b9d765d6 wifi: iwlwifi: mvm: Fix scan abort handling with HW rfkill
    4ae145f29fa0 wifi: iwlwifi: mvm: properly set 6 GHz channel direct probe option
    ef227372b6dd wifi: iwlwifi: mvm: handle BA session teardown in RF-kill
    2d3381e88467 wifi: iwlwifi: mvm: Handle BIGTK cipher in kek_kck cmd
    e25fae980084 wifi: iwlwifi: mvm: remove stale STA link data during restart
    e34b6aa96999 wifi: iwlwifi: mvm: d3: fix WoWLAN command version lookup
    c084a02e3e20 wifi: cfg80211: fix 6 GHz scan request building
    92df1422bac9 wifi: mac80211: handle tasklet frames before stopping
    8936ae49130b wifi: mac80211: apply mcast rate only if interface is up
    dade6785c4a0 wifi: mac80211: mesh: init nonpeer_pm to active by default in mesh sdata
    2a6da27d091b tools/power/cpupower: Fix Pstate frequency reporting on AMD Family 1Ah CPUs
    a0156b837e21 ACPI: EC: Avoid returning AE_OK on errors in address space handler
    5e49b9b5056f ACPI: EC: Abort address space access upon error
    113fa39675f3 efi/libstub: zboot.lds: Discard .discard sections
    b76194fc3b9d scsi: qedf: Set qed_slowpath_params to zero before use
    e949e39acdf4 scsi: qedf: Wait for stag work during unload
    80c971d99c04 scsi: qedf: Don't process stag work during unload and recovery
    74fac04ec2f4 scsi: sr: Fix unintentional arithmetic wraparound
    c28ba74c674e scsi: core: alua: I/O errors for ALUA state transitions
    5f5d0799eb0a filelock: Remove locks reliably when fcntl/close race is detected
    35046aea43c8 bpftool: Fix undefined bpf macro for unix socket
    9a558d4b8621 tools/resolve_btfids: Fix comparison of distinct pointer types warning in resolve_btfids
    42b2eec2e503 bpftool: Query only cgroup-related attach types
    2eaf5c0d8191 Linux 6.6.41
    eb7641fae20c i2c: rcar: fix error code in probe()
    e243c1176d2e kbuild: Make ld-version.sh more robust against version string changes
    dae3543db8f0 x86/bhi: Avoid warning in #DB handler due to BHI mitigation
    2f5f0eb01641 x86/entry/64: Remove obsolete comment on tracing vs. SYSRET
    f73481d9a8fb x86/entry: Rename ignore_sysret()
    557d62e49e71 i2c: rcar: clear NO_RXDMA flag after resetting
    bc6632549c01 i2c: testunit: avoid re-issued work after read message
    4d2d0491b3b1 i2c: rcar: ensure Gen3+ reset does not disturb local targets
    988c31331863 i2c: rcar: introduce Gen4 devices
    4c029f04e47e i2c: rcar: reset controller is mandatory for Gen3+
    ff3d2cf3befb i2c: mark HostNotify target address as used
    5bfec9c2b8d6 i2c: rcar: bring hardware to known state when probing
    c1bf973f57b7 btrfs: tree-checker: add type and sequence check for inline backrefs
    448a2500d171 sched: Move psi_account_irqtime() out of update_rq_clock_task() hotpath
    4dc200e31553 ext4: avoid ptr null pointer dereference
    60f61514374e nilfs2: fix kernel bug on rename operation of broken directory
    6b05ad408f09 selftests/net: fix gro.c compilation failure due to non-existent opt_ipproto_off
    11078e2d1146 mm/damon/core: merge regions aggressively when max_nr_regions is unmet
    93893eacb372 mm/shmem: disable PMD-sized page cache if needed
    5e305b5986dc misc: fastrpc: Restrict untrusted app to attach to privileged PD
    aeab0a85bbe1 misc: fastrpc: Fix ownership reassignment of remote heap
    8b8b82dcf393 misc: fastrpc: Fix memory leak in audio daemon attach operation
    ba602c70c778 misc: fastrpc: Copy the complete capability structure to user
    143982d84ea1 misc: fastrpc: Avoid updating PD type for capability request
    2b2fb816afc7 misc: fastrpc: Fix DSP capabilities request
    b6a5c681d71d wireguard: send: annotate intentional data race in checking empty queue
    f89f44e4147f wireguard: queueing: annotate intentional data race in cpu round robin
    6638a203abad wireguard: allowedips: avoid unaligned 64-bit memory accesses
    6a43cd61b834 wireguard: selftests: use acpi=off instead of -no-acpi for recent QEMU
    e408184365c7 cpufreq: Allow drivers to advertise boost enabled
    2ca2fd474d86 cpufreq: ACPI: Mark boost policy as enabled when setting boost
    08985dd4d145 ACPI: processor_idle: Fix invalid comparison with insertion sort for latency
    9525af1f58f6 libceph: fix race between delayed_work() and ceph_monc_stop()
    f0cc5f7cb43f pmdomain: qcom: rpmhpd: Skip retention level for Power Domains
    cd94cac4069a Fix userfaultfd_api to return EINVAL as expected
    b5634da5d189 ALSA: hda/realtek: Limit mic boost on VAIO PRO PX
    77f64c3df43d ALSA: hda/realtek: Enable Mute LED on HP 250 G7
    9e6b110af097 ALSA: hda/realtek: add quirk for Clevo V5[46]0TU
    23efa74cfe6e tty: serial: ma35d1: Add a NULL check for of_node
    639868f1cb87 platform/x86: toshiba_acpi: Fix array out-of-bounds access
    c01f9a6461dc nvmem: core: only change name to fram for current attribute
    c3debec57729 nvmem: meson-efuse: Fix return value of nvmem callbacks
    5f97b616e2e1 nvmem: rmem: Fix return value of rmem_read()
    25712a379167 arm64: dts: qcom: sc8280xp-x13s: fix touchscreen power on
    1e353014286d arm64: dts: qcom: sa8775p: Correct IRQ number of EL2 non-secure physical timer
    618edb821a80 iio: trigger: Fix condition for own trigger
    9e84b1ba5c98 ksmbd: discard write access to the directory open
    a0c42ddd0969 mm/filemap: make MAX_PAGECACHE_ORDER acceptable to xarray
    06b5a69c27ec mm/filemap: skip to create PMD-sized page cache if needed
    28acd531c9a3 mm: vmalloc: check if a hash-index is in cpu_possible_mask
    794fa52b9463 s390/mm: Add NULL pointer check to crst_table_free() base_crst_free()
    9339641b99fb xhci: always resume roothubs if xHC was reset during resume
    a3d83021fd04 hpet: Support 32-bit userspace
    814a99ba6991 misc: microchip: pci1xxxx: Fix return value of nvmem callbacks
    647d61aef106 USB: core: Fix duplicate endpoint bug by clearing reserved bits in the descriptor
    d1205033e912 usb: gadget: configfs: Prevent OOB read/write in usb_string_copy()
    add279faeb55 usb: dwc3: pci: add support for the Intel Panther Lake
    20836c953dc2 USB: Add USB_QUIRK_NO_SET_INTF quirk for START BP-850k
    5ae6a64f1821 USB: serial: mos7840: fix crash on resume
    511751182c10 USB: serial: option: add Rolling RW350-GL variants
    8ee097aecf3d USB: serial: option: add Netprisma LCUK54 series modules
    4e8c0883a21c USB: serial: option: add support for Foxconn T99W651
    9201d38054b7 USB: serial: option: add Fibocom FM350-GL
    8d320260f096 USB: serial: option: add Telit FN912 rmnet compositions
    5aaeb60b91ff USB: serial: option: add Telit generic core-dump composition
    32b96db30775 net: ks8851: Fix potential TX stall after interface reopen
    80ece0013730 net: ks8851: Fix deadlock with the SPI chip variant
    dfcdd7f89e40 tcp: avoid too many retransmit packets
    b75f281bddeb tcp: use signed arithmetic in tcp_rtx_probe0_timed_out()
    1e116c18e32b Revert "sched/fair: Make sure to try to detach at least one movable task"
    87f3ceb2b143 cifs: fix setting SecurityFlags to true
    8665fb96a393 octeontx2-af: fix issue with IPv4 match for RSS
    0207c7988838 octeontx2-af: fix issue with IPv6 ext match for RSS
    2c41eaa8fba1 octeontx2-af: fix detection of IP layer
    d24b124a960f octeontx2-af: fix a issue with cpt_lf_alloc mailbox
    22b864f7d7fd octeontx2-af: replace cpt slot with lf id on reg write
    0e1792662247 i40e: fix: remove needless retries of NVM update
    cf3c2372d6d0 ARM: davinci: Convert comma to semicolon
    392cff2f86a2 firmware: cs_dsp: Use strnlen() on name fields in V1 wmfw files
    8246bbf818ed ASoC: SOF: Intel: hda: fix null deref on system suspend entry
    76ea8e13aaef firmware: cs_dsp: Prevent buffer overrun when processing V2 alg headers
    3a9cd924aec1 firmware: cs_dsp: Validate payload length before processing block
    90ab191b7d18 firmware: cs_dsp: Return error if block header overflows file
    9c9877a96e03 firmware: cs_dsp: Fix overflow checking of wmfw header
    6bd5afff3911 arm64: dts: qcom: sc8180x: Fix LLCC reg property again
    21379c6fc818 s390: Mark psw in __load_psw_mask() as __unitialized
    d6c686c01c5f net, sunrpc: Remap EPERM in case of connection failure in xs_tcp_setup_socket
    799a34901b63 net/sched: Fix UAF when resolving a clash
    c5fd77ca13d6 udp: Set SOCK_RCU_FREE earlier in udp_lib_get_port().
    feeeeb4c0a79 ethtool: netlink: do not return SQI value if link is down
    099502ca4109 ppp: reject claimed-as-LCP but actually malformed packets
    853f8cd459f7 net: ethernet: mtk-star-emac: set mac_managed_pm when probing
    936983051868 bpf: Fail bpf_timer_cancel when callback is being cancelled
    e97c862e0b4c bpf: replace bpf_timer_init with a generic helper
    591003567401 bpf: make timer data struct more generic
    e65a49b948b5 bpf: fix order of args in call to bpf_map_kvcalloc
    9d23909ae041 net: ethernet: lantiq_etop: fix double free in detach
    5266302cb2c7 i40e: Fix XDP program unloading while removing the driver
    7e9092d7ac2d net: fix rc7's __skb_datagram_iter()
    13bf7ce31239 octeontx2-af: Fix incorrect value output on error path in rvu_check_rsrc_availability()
    b180739b45a3 skmsg: Skip zero length skb in sk_msg_recvmsg
    0370f6670010 net: phy: microchip: lan87xx: reinit PHY after cable test
    230bb13650b0 bpf: Fix too early release of tcx_entry
    124886cf2059 tcp: fix incorrect undo caused by DSACK of TLP retransmit
    e304a6751433 net: bcmasp: Fix error code in probe()
    cbfc844cbe77 vfs: don't mod negative dentry count when on shrinker list
    f71ebe7b3e84 fs/dcache: Re-use value stored to dentry->d_flags instead of re-reading
    432b06b69d1d filelock: fix potential use-after-free in posix_lock_inode
    cae91b5cf9b8 dsa: lan9303: Fix mapping between DSA port number and PHY address
    6bb6bd3dd6f3 cachefiles: add missing lock protection when polling
    de045a82e1a4 cachefiles: cyclic allocation of msg_id to avoid reuse
    d3179bae72b1 cachefiles: wait for ondemand_object_worker to finish when dropping object
    ed60c1a82d6d cachefiles: cancel all requests for the object that is being dropped
    32e0a9a79937 cachefiles: stop sending new request when dropping object
    189438643427 cachefiles: narrow the scope of triggering EPOLLIN events in ondemand mode
    a04cc7f00d48 cachefiles: propagate errors from vfs_getxattr() to avoid infinite loop
    f476dffc52ea vfio/pci: Init the count variable in collecting hot-reset devices
    c3111b3cf388 scsi: ufs: core: Fix ufshcd_abort_one racing issue
    bed089600833 scsi: ufs: core: Fix ufshcd_clear_cmd racing issue
    797323d1cf92 mm: prevent derefencing NULL ptr in pfn_section_valid()
    fc19e231688c Compiler Attributes: Add __uninitialized macro
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
(cherry picked from commit e074b457cc4782aafae9a5f6cb8907d6dd6a96f5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index e5674044f4..a928ac9aa1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a1cc143cd640beb4c378a16345e25853224b5522"
-SRCREV_meta ?= "221d09d9fea4885f4e86d1fc2e83c5767bed4b27"
+SRCREV_machine ?= "299b9490722243371219d1e115eecd5f0fa16367"
+SRCREV_meta ?= "dad768d3d6c23e46e232a5b20a7caad80c3dc0e4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.40"
+LINUX_VERSION ?= "6.6.43"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index bdd24847f6..709341169d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.40"
+LINUX_VERSION ?= "6.6.43"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "12524ba963715d599cd28515eb8814476b6bf1d9"
-SRCREV_meta ?= "221d09d9fea4885f4e86d1fc2e83c5767bed4b27"
+SRCREV_machine ?= "a481fed9f16f9a627e3dfb4ab22df050ae96f9b1"
+SRCREV_meta ?= "dad768d3d6c23e46e232a5b20a7caad80c3dc0e4"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 60b865e870..7a34e6a418 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "e48711f52106a87019e70c1ec6a403bc62cb2031"
-SRCREV_machine:qemuarm64 ?= "12524ba963715d599cd28515eb8814476b6bf1d9"
-SRCREV_machine:qemuloongarch64 ?= "12524ba963715d599cd28515eb8814476b6bf1d9"
-SRCREV_machine:qemumips ?= "c15bdaca7c985d396b0a6e6f1a6e6cf43190e85f"
-SRCREV_machine:qemuppc ?= "12524ba963715d599cd28515eb8814476b6bf1d9"
-SRCREV_machine:qemuriscv64 ?= "12524ba963715d599cd28515eb8814476b6bf1d9"
-SRCREV_machine:qemuriscv32 ?= "12524ba963715d599cd28515eb8814476b6bf1d9"
-SRCREV_machine:qemux86 ?= "12524ba963715d599cd28515eb8814476b6bf1d9"
-SRCREV_machine:qemux86-64 ?= "12524ba963715d599cd28515eb8814476b6bf1d9"
-SRCREV_machine:qemumips64 ?= "71f1727de6e7677b4028c9d8ac55349cac396d18"
-SRCREV_machine ?= "12524ba963715d599cd28515eb8814476b6bf1d9"
-SRCREV_meta ?= "221d09d9fea4885f4e86d1fc2e83c5767bed4b27"
+SRCREV_machine:qemuarm ?= "63d5f5d5e6e730e4d867a9020f07e1e596b1c68c"
+SRCREV_machine:qemuarm64 ?= "a481fed9f16f9a627e3dfb4ab22df050ae96f9b1"
+SRCREV_machine:qemuloongarch64 ?= "a481fed9f16f9a627e3dfb4ab22df050ae96f9b1"
+SRCREV_machine:qemumips ?= "0d762cde73dbf7ddfd9af79612054980030ed330"
+SRCREV_machine:qemuppc ?= "a481fed9f16f9a627e3dfb4ab22df050ae96f9b1"
+SRCREV_machine:qemuriscv64 ?= "a481fed9f16f9a627e3dfb4ab22df050ae96f9b1"
+SRCREV_machine:qemuriscv32 ?= "a481fed9f16f9a627e3dfb4ab22df050ae96f9b1"
+SRCREV_machine:qemux86 ?= "a481fed9f16f9a627e3dfb4ab22df050ae96f9b1"
+SRCREV_machine:qemux86-64 ?= "a481fed9f16f9a627e3dfb4ab22df050ae96f9b1"
+SRCREV_machine:qemumips64 ?= "fba6619b60be1ec8eb7f9e043c92a79686f94641"
+SRCREV_machine ?= "a481fed9f16f9a627e3dfb4ab22df050ae96f9b1"
+SRCREV_meta ?= "dad768d3d6c23e46e232a5b20a7caad80c3dc0e4"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "1a515bd58d1584e2eba85567e16c58dfb82edf32"
+SRCREV_machine:class-devupstream ?= "58b0425ff5df680d0b67f64ae1f3f1ebdf1c4de9"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.40"
+LINUX_VERSION ?= "6.6.43"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


