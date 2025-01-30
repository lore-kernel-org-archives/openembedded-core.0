Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C9B0C02198
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 16:02:11 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.18720.1738252924842030652
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jan 2025 08:02:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FtNAHzkl;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7b6edb82f85so137576485a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 08:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738252924; x=1738857724; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXnYx8v4lio++Inp/eGX2Aubk3sPjcE6APsoDFeW89M=;
        b=FtNAHzklRPLruBAQu6l+nkd7I/01h7ultY7nYvaNs0OxTsq79IDv1zUzJEJv4taYRI
         eGqBQuWsFfAh0TzFLfRc7gp9LvMZeh8dsgX1sL2wA2leRuPGDoLRrcQ6Uc6ZCst1VQw3
         YH8UiUEyRkRnJKVMgz/KltAF09O3in2TJZ22hFqfOqmZBRq8wN5ga4sx71H/JOAmfOQ1
         RV++RubQmtNMYeI9wcNU0rxQtRXMrOaKrJtxe3tRzZ5AAGOjRgGBQRLgqag0Bhb2pOqx
         1YUwO/go/n8X+3lUGVYTsBmxL++1OMioGsY0oFGwfnSdKhaHdYO7kv0KeuonNMatYxhk
         UYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738252924; x=1738857724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TXnYx8v4lio++Inp/eGX2Aubk3sPjcE6APsoDFeW89M=;
        b=Ci3EqHqDoaqozW0jJxx7a1QMKEbGwnALxT4PrUrHwhjzzLQEL/3VQYPjPqWL+GJ/XH
         ppDz7H5XAT9OvxCRwuzvrmEEEm90HLUhjYyG5X09UY39Vtle7qvwMtUfZjKUW3Q5W8QT
         2w8ydXWmwDAiNtMw6322Dtl/pC2XvotMgupyyeAtqvi1JQ50Ns5T71vI90qYORO+E1Oz
         BF1yIUMABSq4yc411MztLHvsEbXIestLcAiyxZbEKgcbR8Q3C79m86vND7jEtVy8Fujd
         zJcsNF2bdMvRXkOJ+RGqD2eC1JrmcpCalJUlCei2NGfNYEp3j3zqjGmLemDggI4R1qF2
         dSjQ==
X-Gm-Message-State: AOJu0Yy0Amy7XvE4JHe2OvJbzcReDZ2ZCoe3OfeR20c+gPHKFh81o3Xw
	1JUvkBXxctFzjMjIWhj/DMDOPsqGFHDyS79q8SKLHw0jUS2mxO5yNqJ4abmDSDg=
X-Gm-Gg: ASbGnctcro4gsZsZu4ymeHEli9wz6T7/vXIPX3yhrBwSPXhKC4r/H34LPxgumf4MtkJ
	8S5c90CzlDlkgSoXSdu1nd2a0tpyzt1jqewe2hLpE0PXmRVITwfs+9wu9QVLMDiLTDsHS94BENk
	m6nPXyAv4OIO/B7HeH8QxoHpqsmhVxsEedg8INjg7BLOfH8PI7Z2KAlFZbqBOUqVQaDTvbRRcWZ
	xzBT85jcfmUavpq10PS/mDzru4f+gYkylUdXV9NeVHkeHRV+PMd5yjgxBi3FMfjAFx5c8PzzXIE
	zWr0us8DRRoSe23wA1JLZHlqJi7aCWdi1NnNR3KlsKa3H73HRATeLI+0q//iXtjtzJHRkk8Xz7r
	SxBfCCr6rPloVWp4U
X-Google-Smtp-Source: AGHT+IHCwAIS5zYhl3nLZCn8JojDEB6y3X+qu8CIo73QR5Xnlo9TCYtGMMy6frbEeu8dTZaO7Jfnsg==
X-Received: by 2002:a05:620a:4693:b0:7b7:7d6:dfe9 with SMTP id af79cd13be357-7bffcd99a21mr1347728385a.48.1738252923480;
        Thu, 30 Jan 2025 08:02:03 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a90d3c4sm86086285a.111.2025.01.30.08.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 08:02:02 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] linux-yocto/6.6: update to v6.6.72
Date: Thu, 30 Jan 2025 11:01:52 -0500
Message-Id: <b7f3d5dd2c048807ec218117586e05448ef08eb6.1738252521.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1738252521.git.bruce.ashfield@gmail.com>
References: <cover.1738252521.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 16:02:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210458

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    c2e420511612 Linux 6.6.72
    ac7f5641e988 drm/mediatek: Only touch DISP_REG_OVL_PITCH_MSB if AFBC is supported
    08a2117e83e5 riscv: Fix text patching when IPI are used
    56b274473d6e mm: hugetlb: independent PMD page table shared count
    ec500230d39a mm/hugetlb: enforce that PMD PT sharing has split PMD PT locks
    5cfaddaa4bdb fs/Kconfig: make hugetlbfs a menuconfig
    1abe0a34aea6 pgtable: fix s390 ptdesc field comments
    1fd2a57dcb4d workqueue: Do not warn when cancelling WQ_MEM_RECLAIM work from !WQ_MEM_RECLAIM worker
    6dc676743a7a workqueue: Update lock debugging code
    2717b5e55a9f workqueue: Add rcu lock check at the end of work item execution
    66e533f0b250 pmdomain: imx: gpcv2: fix an OF node reference leak in imx_gpcv2_probe()
    b1e6351c16b4 pmdomain: imx: gpcv2: Simplify with scoped for each OF child loop
    b613a038fdd7 arm64: dts: rockchip: add hevc power domain clock to rk3328
    be3eed59ac01 block, bfq: fix waker_bfqq UAF after bfq_split_bfqq()
    53e25b10a28e hwmon: (drivetemp) Fix driver producing garbage data when SCSI errors occur
    a4b01371512e ARM: dts: imxrt1050: Fix clocks for mmc
    8efff2aa2d95 io_uring/eventfd: ensure io_eventfd_signal() defers another RCU period
    03753bfacbc6 riscv: kprobes: Fix incorrect address calculation
    6a96af5f309d iio: adc: ad7124: Disable all channels at probe time
    91dd568e3ff9 iio: inkern: call iio_device_put() only on mapped devices
    09e067e3c83e iio: adc: at91: call input_free_device() on allocated iio_dev
    f110a6d71bd8 iio: adc: ti-ads124s08: Use gpiod_set_value_cansleep()
    2df664d7b4f2 iio: gyro: fxas21002c: Fix missing data update in trigger handler
    455df95eb8f2 iio: adc: ti-ads8688: fix information leak in triggered buffer
    5a95fbbecec7 iio: adc: rockchip_saradc: fix information leak in triggered buffer
    cde312e257b5 iio: imu: kmx61: fix information leak in triggered buffer
    a15ea87d4337 iio: light: vcnl4035: fix information leak in triggered buffer
    74058395b2c6 iio: dummy: iio_simply_dummy_buffer: fix information leak in triggered buffer
    fefb88a4da96 iio: pressure: zpa2326: fix information leak in triggered buffer
    ea57f0bbe225 usb: gadget: configfs: Ignore trailing LF for user strings to cdev
    ea6a14987424 usb: gadget: f_fs: Remove WARN_ON in functionfs_bind
    88cdfe9f15d5 usb: typec: tcpm/tcpci_maxim: fix error code in max_contaminant_read_resistance_kohm()
    c1e7ced99da9 usb: gadget: f_uac2: Fix incorrect setting of bNumEndpoints
    dcd4de31bd01 usb: chipidea: ci_hdrc_imx: decrement device's refcount in .remove() and in the error path of .probe()
    43c204b22dd8 usb: gadget: midi2: Reverse-select at the right place
    953dea074bc5 usb: fix reference leak in usb_new_device()
    730016e0b963 USB: core: Disable LPM only for non-suspended ports
    77af0434807b USB: usblp: return error when setting unsupported protocol
    7c3f7c3caa35 usb: dwc3-am62: Disable autosuspend during remove
    0a3a87221418 x86/fpu: Ensure shadow stack is active before "getting" registers
    0c50f00cc299 usb: gadget: u_serial: Disable ep before setting port to null to fix the crash caused by port being null
    0231ecfb1f7a tty: serial: 8250: Fix another runtime PM usage counter underflow
    12f950a6a1c1 misc: microchip: pci1xxxx: Resolve return code mismatch during GPIO set config
    25692750c025 misc: microchip: pci1xxxx: Resolve kernel panic during GPIO IRQ handling
    b02cf1d27e46 topology: Keep the cpumask unchanged when printing cpumap
    c995c81b2a30 usb: dwc3: gadget: fix writing NYET threshold
    05da04bbf3b9 USB: serial: cp210x: add Phoenix Contact UPS Device
    138655dd9ebe usb-storage: Add max sectors quirk for Nokia 208
    e5c87f33b514 staging: iio: ad9832: Correct phase range check
    4c04529c77d5 staging: iio: ad9834: Correct phase range check
    8166f38c8099 USB: serial: option: add Neoway N723-EA support
    2dcb6368adf5 USB: serial: option: add MeiG Smart SRM815
    12caa73a28f0 dm-verity FEC: Fix RS FEC repair for roots unaligned to block size (take 2)
    8dddc12d0324 f2fs: fix null-ptr-deref in f2fs_submit_page_bio()
    e3ed5a14aac7 io_uring/timeout: fix multishot updates
    3ce08bab0105 drm/amd/display: increase MAX_SURFACES to the value supported by hw
    fa6bc7263061 drm/amdkfd: fixed page fault when enable MES shader debugger
    55ee64816bd5 ACPI: resource: Add Asus Vivobook X1504VAP to irq1_level_low_skip_override[]
    b239a3867d58 ACPI: resource: Add TongFang GM5HG0A to irq1_edge_low_force_override[]
    f48f060a4b36 riscv: Fix sleeping in invalid context in die()
    5fe671caedc2 smb: client: sync the root session and superblock context passwords before automounting
    d2512434f4cf thermal: of: fix OF node leak in of_thermal_zone_find()
    ae9ab63a268b drm/amd/display: Add check for granularity in dml ceil/floor helpers
    59d28c133e71 ksmbd: Implement new SMB3 POSIX type
    284a221f8fa5 sctp: sysctl: plpmtud_probe_interval: avoid using current->nsproxy
    55627918febd sctp: sysctl: udp_port: avoid using current->nsproxy
    7ec30c54f339 sctp: sysctl: auth_enable: avoid using current->nsproxy
    dc9d0e3cfd16 sctp: sysctl: rto_min/max: avoid using current->nsproxy
    ad673e514b27 sctp: sysctl: cookie_hmac_alg: avoid using current->nsproxy
    c0e394fd6b88 mptcp: sysctl: sched: avoid using current->nsproxy
    a57ce97c1978 dm-ebs: don't set the flag DM_TARGET_PASSES_INTEGRITY
    086136ad70c5 scsi: ufs: qcom: Power off the PHY if it was already powered on in ufs_qcom_power_up_sequence()
    6b305e98de0d dm thin: make get_first_thin use rcu-safe list first function
    a4a7ac3d2660 riscv: mm: Fix the out of bound issue of vmemmap address
    387f5b8ad3ff cpuidle: riscv-sbi: fix device node release in early exit of for_each_possible_cpu
    65b31b9d992c ksmbd: fix unexpectedly changed path in ksmbd_vfs_kern_path_locked
    5cc621085e2b platform/x86/amd/pmc: Only disable IRQ1 wakeup where i8042 actually enabled it
    7673030efe0f afs: Fix the maximum cell name length
    271ae0edbfc9 ksmbd: fix a missing return value check bug
    5b195e6f8bde drm/mediatek: Add return value check when reading DPCD
    5352901f0bf1 drm/mediatek: Fix mode valid issue for dp
    9db527726634 drm/mediatek: Fix YCbCr422 color format issue for DP
    acefaa6993eb drm/mediatek: stop selecting foreign drivers
    7083b93e9755 drm/mediatek: Set private->all_drm_private[i]->drm to NULL if mtk_drm_bind returns err
    229cc1028437 net/mlx5: Fix variable not being completed when function returns
    235419f0956e net: stmmac: dwmac-tegra: Read iommu stream id from device tree
    27202e2e8721 sched: sch_cake: add bounds checks to host bulk flow fairness counts
    d5807dd1328b netfilter: conntrack: clamp maximum hashtable size to INT_MAX
    1e3f5638c96b netfilter: nf_tables: imbalance in flowtable binding
    281855205a7c iio: imu: inv_icm42600: fix timestamps after suspend if sensor is on
    e026530e20e7 x86/mm/numa: Use NUMA_NO_NODE when calling memblock_set_node()
    85e4923bcbcd memblock tests: fix implicit declaration of function 'numa_valid_node'
    b0b415f1a29d riscv: Fix early ftrace nop patching
    52a6d4f16e5b tcp: Annotate data-race around sk->sk_mark in tcp_v4_send_reset
    b455f050709a Bluetooth: btnxpuart: Fix driver sending truncated data
    327bd191bb44 Bluetooth: MGMT: Fix Add Device to responding before completing
    9ba06f078f33 Bluetooth: hci_sync: Fix not setting Random Address when required
    eff2cd6f53a5 eth: gve: use appropriate helper to set xdp_features
    ba9f7c16ec87 ipvlan: Fix use-after-free in ipvlan_get_iflink().
    7397fa36d676 tls: Fix tls_sw_sendmsg error handling
    a78e04e0236b igc: return early when failing to read EECD register
    30254c85b814 igc: field get conversion
    0677b13dd9b0 ice: fix incorrect PHY settings for 100 GB/s
    9d3884f303b0 cxgb4: Avoid removal of uninserted tid
    70163207b57b bnxt_en: Fix possible memory leak when hwrm_req_replace fails
    b7e540c52137 pds_core: limit loop over fw name list
    24b85a8b0310 btrfs: avoid NULL pointer dereference if no valid extent tree
    a8fbf80c4ff5 net: libwx: fix firmware mailbox abnormal return
    e54beb9aed2a net_sched: cls_flow: validate TCA_FLOW_RSHIFT attribute
    91f89fe177a4 tcp/dccp: allow a connection when sk_max_ack_backlog is zero
    b2c9204e21b5 tcp/dccp: complete lockless accesses to sk->sk_max_ack_backlog
    41d2e3be0f28 net: 802: LLC+SNAP OID:PID lookup on start of skb data
    45ae076dac49 ieee802154: ca8210: Add missing check for kfifo_alloc() in ca8210_probe()
    6c37547a6eeb selftests/alsa: Fix circular dependency involving global-timer
    3d736856e245 ASoC: mediatek: disable buffer pre-allocation
    6754f5473dab ASoC: rt722: add delay time to wait for the calibration procedure
    14f030a807dd erofs: fix PSI memstall accounting
    1bf7e414cac3 erofs: handle overlapped pclusters out of crafted images properly
    a1a541fbfa7e ovl: support encoding fid from inode with no alias
    a3f8a2b13a27 ovl: pass realinode to ovl_encode_real_fh() instead of realdentry
    26423e18cd6f ovl: do not encode lower fh with upper sb_writers held
    1e92afe80197 exfat: fix the infinite loop in __exfat_free_cluster()
    dc1d7afceb98 exfat: fix the infinite loop in exfat_readdir()
    71f4123cf2c7 dm array: fix cursor index when skipping across block boundaries
    14f0e64c2f11 dm array: fix unreleased btree blocks on closing a faulty array cursor
    6002bec5354f dm array: fix releasing a faulty array block twice in dm_array_cursor_end
    a71e465f69be jbd2: flush filesystem device before updating tail sequence
    6b32ff20d16a jbd2: increase IO priority for writing revoke records
    fdebee5c5c2b memblock: use numa_valid_node() helper to check for invalid node ID
    4ddb7f966f3d memblock: make memblock_set_node() also warn about use of MAX_NUMNODES
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
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 607c70955a..4655e7340f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "94762e4ed9eafc254a5522cf9107e2f450f79dc8"
-SRCREV_meta ?= "e102afe47d66b37aa6b378c86cdea4b31065ae9e"
+SRCREV_machine ?= "c2e0c18a98e6f16a4abd1ade619fae00f6fdfd66"
+SRCREV_meta ?= "7800a2b5bc4549ab39dab3bbae2d5dbf202133cb"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.71"
+LINUX_VERSION ?= "6.6.72"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 08cb37e6d2..589078e14b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.71"
+LINUX_VERSION ?= "6.6.72"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "b51e4ee5e3c342d2035ff50e24e438810bb51b02"
-SRCREV_meta ?= "e102afe47d66b37aa6b378c86cdea4b31065ae9e"
+SRCREV_machine ?= "2ffba340fc0db0534dadc9c0eca01ad3ba3e1e4a"
+SRCREV_meta ?= "7800a2b5bc4549ab39dab3bbae2d5dbf202133cb"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index afc66b57db..b7bd23784f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "f4dc412f65b7baa317fb5ea3a0652f7b2b93a22b"
-SRCREV_machine:qemuarm64 ?= "b51e4ee5e3c342d2035ff50e24e438810bb51b02"
-SRCREV_machine:qemuloongarch64 ?= "b51e4ee5e3c342d2035ff50e24e438810bb51b02"
-SRCREV_machine:qemumips ?= "c02dd1cd1dad8fb69fe02b65aeea1263f7e32e8e"
-SRCREV_machine:qemuppc ?= "b51e4ee5e3c342d2035ff50e24e438810bb51b02"
-SRCREV_machine:qemuriscv64 ?= "b51e4ee5e3c342d2035ff50e24e438810bb51b02"
-SRCREV_machine:qemuriscv32 ?= "b51e4ee5e3c342d2035ff50e24e438810bb51b02"
-SRCREV_machine:qemux86 ?= "b51e4ee5e3c342d2035ff50e24e438810bb51b02"
-SRCREV_machine:qemux86-64 ?= "b51e4ee5e3c342d2035ff50e24e438810bb51b02"
-SRCREV_machine:qemumips64 ?= "5e505449aebd58bbcfc93819843c64f56d939917"
-SRCREV_machine ?= "b51e4ee5e3c342d2035ff50e24e438810bb51b02"
-SRCREV_meta ?= "e102afe47d66b37aa6b378c86cdea4b31065ae9e"
+SRCREV_machine:qemuarm ?= "278435cb5a2e871ca818f0fb00f75249d2f8a9e5"
+SRCREV_machine:qemuarm64 ?= "2ffba340fc0db0534dadc9c0eca01ad3ba3e1e4a"
+SRCREV_machine:qemuloongarch64 ?= "2ffba340fc0db0534dadc9c0eca01ad3ba3e1e4a"
+SRCREV_machine:qemumips ?= "a56762013602aeb1bf2732cf8d21d08b8afdb91f"
+SRCREV_machine:qemuppc ?= "2ffba340fc0db0534dadc9c0eca01ad3ba3e1e4a"
+SRCREV_machine:qemuriscv64 ?= "2ffba340fc0db0534dadc9c0eca01ad3ba3e1e4a"
+SRCREV_machine:qemuriscv32 ?= "2ffba340fc0db0534dadc9c0eca01ad3ba3e1e4a"
+SRCREV_machine:qemux86 ?= "2ffba340fc0db0534dadc9c0eca01ad3ba3e1e4a"
+SRCREV_machine:qemux86-64 ?= "2ffba340fc0db0534dadc9c0eca01ad3ba3e1e4a"
+SRCREV_machine:qemumips64 ?= "11c0555e0dcc573b4803afd802b3b3d215ac8f2b"
+SRCREV_machine ?= "2ffba340fc0db0534dadc9c0eca01ad3ba3e1e4a"
+SRCREV_meta ?= "7800a2b5bc4549ab39dab3bbae2d5dbf202133cb"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "843e64492a7ed11436cc5c9bbfba46835939071a"
+SRCREV_machine:class-devupstream ?= "c2e4205116126ab79bfa17a5e8dd73698e3f7299"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.71"
+LINUX_VERSION ?= "6.6.72"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


