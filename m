Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68ACEC021A0
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 14:21:57 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.16823.1739370112658398925
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 06:21:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SxPc40N+;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2fbf77b2b64so1546734a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 06:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739370112; x=1739974912; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q2U6qFd3mazkvNaUbRVPP9DCpIXWGmpRggnDoJYbwI8=;
        b=SxPc40N+7QiKd1OcKEkBMexgi0krSB8uIEbq/4FYPj6SEWr/+GnaXoIfTzUbn5wr5y
         3DZFaXxYZKT/pqrtPwfLj+lDGUtOSZOwHHdkAmekUqTW0Ul5NsZHPadwyXF3WGsX4oIQ
         cU+IJQsC5h/rV4PIVVVQvIxjCqjXVo/yWjxIzBkVDqXvY6zFArp7pOR2A3biNKkyy45/
         /MbwKBJgv3Fa8GWmR8g8SZh13VIg94MlSpHAVt0JJqcyDkbaRKICLpnHd4J3T9dta6ci
         qkyfssWCakh6qbkW3td/DMrbCWdRMHbZ5W32mjdm5gOjixg7yi7J1DyXo8eO6+/UP9c0
         PYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739370112; x=1739974912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q2U6qFd3mazkvNaUbRVPP9DCpIXWGmpRggnDoJYbwI8=;
        b=q2krx7YvMgKjBh4V2mNBFHRyaJgsSHDr8TG1BKv6wCp88THk5rkB3mxbOHhfDUF92l
         sy0gaDIGKBCv0KAgkQIG4Q72t0w/eIzn9lRrZ/E/7gO92VEM70N0BZBUX7tiZX0J+KGa
         W+RMWC7QfklCmE3ZE010L/g9VGuM9szOfFqRXvdKuLspcSMMfhia3GGrZatxh1kFomr1
         /sPzqQj7t+GOYkJRFQy+KY3976sTA+qSywGEUOk1Jw7vwQWcr8xu/CZrJuMqWi5Yh+L9
         3ab4dUlF+99OT3UKDPcMDhg7zARpB14efrh51SAOG/W6WZRXWBkFo271C0HP1+9EjRzz
         aCUw==
X-Gm-Message-State: AOJu0YxhA+vI5jhPfyrqVYmQBwBphYtVBUsKJoVltgD+V8OttJLQSeAd
	wDyEkBxR1LaEggzxXIrNubyBSCZBD4EKac93r9mUgDTEO5C5eX9uJK8lCkn5ycBGxWWMbDtbbij
	c
X-Gm-Gg: ASbGncvAn7H99HphCbfSeTQ5G5/WsLdS4K9VfGHkGwz0Xfl7vbVLIFw+Wjw4TJuLKBl
	UnjxY+58rs6M4+LDsW+sh1m/sWC+XrvN2pm1QuEBpKi3Yv1JXXjG+gVQYd6nKCdeK8EONFugrX7
	SulZ8xQGBb9qnaCUrKtR3FEyY5Le0uDhzu833YtORdRVg7K10gNTd+vwPZyXeFsQFDdOM0t7L6q
	V6KoiphFGeCK6jfWbnVik4ROQ9FWI/bM5en398Bt5qlc131Nmx2UEVmnzD+zHb1tZXmeVUOizjV
	G0TK
X-Google-Smtp-Source: AGHT+IFg25Nx4bKBd9lsoqqs4abEiZ0p/pTZRsMyFyUVTf82BXQUTViqY6l9uTmkO2UkXlkwVqbZZw==
X-Received: by 2002:a05:6a00:807:b0:732:a24:7354 with SMTP id d2e1a72fcca58-7322c37418bmr4936425b3a.4.1739370111424;
        Wed, 12 Feb 2025 06:21:51 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73079facc59sm7445260b3a.123.2025.02.12.06.21.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 06:21:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/7] linux-yocto/5.15: update to v5.15.178
Date: Wed, 12 Feb 2025 06:21:33 -0800
Message-ID: <709bfb0e600148d65018db450a69de220c874efd.1739369945.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739369945.git.steve@sakoman.com>
References: <cover.1739369945.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 14:21:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211237

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    c16c81c81336 Linux 5.15.178
    6cfafcad46e9 drm/v3d: Assign job pointer to NULL before signaling the fence
    8b74aa1e1c08 Input: xpad - add support for wooting two he (arm)
    c9d4d5785f2d Input: xpad - add unofficial Xbox 360 wireless receiver clone
    1475c07bf30f Input: atkbd - map F23 key to support default copilot shortcut
    66453ea6ed0a ALSA: usb-audio: Add delay quirk for USB Audio Device
    20ce02f2f73a Revert "usb: gadget: u_serial: Disable ep before setting port to null to fix the crash caused by port being null"
    6068dcff7f19 USB: serial: quatech2: fix null-ptr-deref in qt2_process_read_urb()
    091a023cf2ae wifi: iwlwifi: add a few rate index validity checks
    81d4dd05c412 scsi: storvsc: Ratelimit warning logs to prevent VM denial of service
    6ac5dfa57513 ipv4: ip_tunnel: Fix suspicious RCU usage warning in ip_tunnel_find()
    84adb88c8027 platform/chrome: cros_ec_typec: Check for EC driver
    542532afe249 fs/ntfs3: Additional check in ntfs_file_release
    00767fbd67af Bluetooth: RFCOMM: Fix not validating setsockopt user input
    2c2dc87cdebe Bluetooth: SCO: Fix not validating setsockopt user input
    92340e6c5122 vfio/platform: check the bounds of read/write syscalls
    bcf0d815e728 net: sched: fix ets qdisc OOB Indexing
    4e3ded34f3f3 gfs2: Truncate address space when flipping GFS2_DIF_JDATA flag
    322948a57582 mptcp: don't always assume copied data in mptcp_cleanup_rbuf()
    2c3524a308b2 regmap: detach regmap from dev on regmap_exit
    df560e90a4d6 ASoC: samsung: Add missing depends on I2C
    72370a2bc2e6 irqchip/sunxi-nmi: Add missing SKIP_WAKE flag
    46bdd737a16b scsi: iscsi: Fix redundant response for ISCSI_UEVENT_GET_HOST_STATS request
    318ebf851143 seccomp: Stub for !CONFIG_SECCOMP
    42b4b670bd23 ASoC: samsung: Add missing selects for MFD_WM8994
    0783cd485b4a ASoC: wm8994: Add depends on MFD core
    003148680b79 Linux 5.15.177
    448fe5a1a4b5 Partial revert of xhci: use pm_ptr() instead #ifdef for CONFIG_PM conditionals
    0bd4efe3226d xhci: use pm_ptr() instead of #ifdef for CONFIG_PM conditionals
    c3d052cae566 net: fix data-races around sk->sk_forward_alloc
    198b89dd5a59 scsi: sg: Fix slab-use-after-free read in sg_release()
    9a4d196e8a5e x86/xen: fix SLS mitigation in xen_hypercall_iret()
    167cbd3e5268 nfsd: add list_head nf_gc to struct nfsd_file
    e43dd28405e6 ipv6: avoid possible NULL deref in rt6_uncached_list_flush_dev()
    6486915fa661 vsock/virtio: discard packets if the transport changes
    8a07350fe070 blk-cgroup: Fix UAF in blkcg_unpin_online()
    e667d5d566a2 Revert "regmap: detach regmap from dev on regmap_exit"
    d8ebb991790f Revert "drm/amdgpu: rework resume handling for display (v2)"
    7a07fb80ea88 iio: adc: rockchip_saradc: fix information leak in triggered buffer
    b5c2c988cb6a iio: imu: inv_icm42600: fix timestamps after suspend if sensor is on
    96ac1454f343 iio: imu: inv_icm42600: fix spi burst write not supported
    39f320df3537 Revert "PCI: Use preserve_config in place of pci_flags"
    ac3dd2497e6e drm/i915/fb: Relax clear color alignment to 64 bytes
    15b453db41d3 hrtimers: Handle CPU state correctly on hotplug
    59472bf85a3c irqchip/gic-v3: Handle CPU_PM_ENTER_FAILED correctly
    2d008d4961b0 gpiolib: cdev: Fix use after free in lineinfo_changed_notify
    649b266606bc fs/proc: fix softlockup in __read_vmcore (part 2)
    64e5fd96330d filemap: avoid truncating 64-bit offset to 32 bits
    9e5fed46ccd2 vsock: prevent null-ptr-deref in vsock_*[has_data|has_space]
    a4606b774de2 vsock: reset socket state when de-assigning the transport
    048dbd2b5b85 vsock/virtio: cancel close work in the destructor
    92f1b7930f13 net: ethernet: xgbe: re-add aneg to supported features in PHY quirks
    aba13043e628 x86/asm: Make serialize() always_inline
    612269eb3f8f nvmet: propagate npwg topology
    7df94f7f9e22 poll_wait: add mb() to fix theoretical race between waitqueue_active() and .poll()
    1c878c5527e1 ACPI: resource: acpi_dev_irq_override(): Check DMI match last
    a592ce58ca78 kheaders: Ignore silly-rename files
    2d1a5a595bf2 fs: fix missing declaration of init_files
    87e207b6aa93 hfs: Sanity check the root record
    80aee0bc0dbe mac802154: check local interfaces before deleting sdata list
    c5f1bc1d2324 i2c: rcar: fix NACK handling when being a target
    6c6e0961ccfd i2c: mux: demux-pinctrl: check initial mux selection, too
    37c63955ca68 Revert "mtd: spi-nor: core: replace dummy buswidth from addr to data"
    2f176c0ec9f5 hwmon: (tmp513) Fix division of negative numbers
    14e0a874488e drm/v3d: Ensure job pointer is set to NULL after job completion
    83775c9a9a65 net/mlx5: Fix RDMA TX steering prio
    a04effa1b79f net/mlx5: Refactor mlx5_get_flow_namespace
    ef6bb594598b net/mlx5: Add priorities for counters in RDMA namespaces
    3cc3575223c6 net: xilinx: axienet: Fix IRQ coalescing packet count overflow
    fdfe7ef525ad nfp: bpf: prevent integer overflow in nfp_bpf_event_output()
    036f8d814a2c gtp: Destroy device along with udp socket's netns dismantle.
    ed8be92df48d gtp: Use for_each_netdev_rcu() in gtp_genl_dump_pdp().
    a111a7487f65 gtp: use exit_batch_rtnl() method
    041325b73abc net: add exit_batch_rtnl() method
    3450092cc2d1 pktgen: Avoid out-of-bounds access in get_imix_entries
    0ab52a8ca6e1 bpf: Fix bpf_sk_select_reuseport() memory leak
    9bb26176fba5 net: ethernet: ti: cpsw_ale: Fix cpsw_ale_get_field()
    9f15cd4174d0 phy: usb: Fix clock imbalance for suspend/resume
    795537eb2af1 phy: usb: Use slow clock for wake enabled suspend
    88b01048f286 mptcp: fix TCP options overflow.
    05ba00d97bb4 mptcp: drop port parameter of mptcp_pm_add_addr_signal
    f44e6d70c100 ocfs2: fix slab-use-after-free due to dangling pointer dqi_priv
    86f8046aa649 ocfs2: correct return value of ocfs2_local_free_info()
    0552befaccd8 phy: usb: Toggle the PHY power during init
    d0178cb2ccea phy: usb: Add "wake on" functionality for newer Synopsis XHCI controllers
    b2cec0d8f676 of: address: Preserve the flags portion on 1:1 dma-ranges mapping
    6a7832e332d9 of: address: Store number of bus flag cells rather than bool
    1b868ff7950b of: address: Remove duplicated functions
    19ec883a51bd of: address: Fix address translation when address-size is greater than 2
    b3f6bed9bf61 of/address: Add support for 3 address cell bus
    bce3629a9e53 of: unittest: Add bus address range parsing tests
    437b875e7389 arm64: dts: rockchip: add hevc power domain clock to rk3328
    f587c1ac6895 block, bfq: fix waker_bfqq UAF after bfq_split_bfqq()
    e43dfc4a9c15 iio: adc: ad7124: Disable all channels at probe time
    d83ccca9e17e iio: inkern: call iio_device_put() only on mapped devices
    028a1ba8e3ba iio: adc: at91: call input_free_device() on allocated iio_dev
    060214459b63 iio: adc: ti-ads124s08: Use gpiod_set_value_cansleep()
    c31009d2bd49 iio: gyro: fxas21002c: Fix missing data update in trigger handler
    aae967380068 iio: adc: ti-ads8688: fix information leak in triggered buffer
    a07f69808441 iio: imu: kmx61: fix information leak in triggered buffer
    cb488706cdec iio: light: vcnl4035: fix information leak in triggered buffer
    006073761888 iio: dummy: iio_simply_dummy_buffer: fix information leak in triggered buffer
    64a989aa7475 iio: pressure: zpa2326: fix information leak in triggered buffer
    19fc1c83454c usb: gadget: f_fs: Remove WARN_ON in functionfs_bind
    d9d18e2011c1 usb: gadget: f_uac2: Fix incorrect setting of bNumEndpoints
    7cdb2d0f1af9 usb: fix reference leak in usb_new_device()
    162428a00a0c USB: core: Disable LPM only for non-suspended ports
    8309c947b208 USB: usblp: return error when setting unsupported protocol
    d2de56cc45ee usb: gadget: u_serial: Disable ep before setting port to null to fix the crash caused by port being null
    1c7818e2746e topology: Keep the cpumask unchanged when printing cpumap
    85b8a1a3176d usb: dwc3: gadget: fix writing NYET threshold
    7f626e8e148c USB: serial: cp210x: add Phoenix Contact UPS Device
    2165ef034891 usb-storage: Add max sectors quirk for Nokia 208
    2748a203e098 staging: iio: ad9832: Correct phase range check
    e299dcbfc039 staging: iio: ad9834: Correct phase range check
    98645eac8ed4 USB: serial: option: add Neoway N723-EA support
    f072315c5d41 USB: serial: option: add MeiG Smart SRM815
    203f38eb72f2 md/raid5: fix atomicity violation in raid5_cache_count
    3b930badf88d scripts/sorttable: fix orc_sort_cmp() to maintain symmetry and transitivity
    1e5cc8d5b121 drm/amd/display: increase MAX_SURFACES to the value supported by hw
    dd3f23919b4d ACPI: resource: Add Asus Vivobook X1504VAP to irq1_level_low_skip_override[]
    21db38809fb8 ACPI: resource: Add TongFang GM5HG0A to irq1_edge_low_force_override[]
    10c24df2e303 riscv: Fix sleeping in invalid context in die()
    95793f9684e5 drm/amd/display: Add check for granularity in dml ceil/floor helpers
    1dc5da6c4178 sctp: sysctl: plpmtud_probe_interval: avoid using current->nsproxy
    0a0966312ac3 sctp: sysctl: udp_port: avoid using current->nsproxy
    bd2a29394235 sctp: sysctl: auth_enable: avoid using current->nsproxy
    0f78f0946674 sctp: sysctl: rto_min/max: avoid using current->nsproxy
    86ddf8118123 sctp: sysctl: cookie_hmac_alg: avoid using current->nsproxy
    e52a55ec2d1f dm-ebs: don't set the flag DM_TARGET_PASSES_INTEGRITY
    802666a40c71 dm thin: make get_first_thin use rcu-safe list first function
    7cb3e77e9b4e afs: Fix the maximum cell name length
    781c743e18bf ksmbd: fix a missing return value check bug
    e719611285cd drm/mediatek: Add support for 180-degree rotation in the display driver
    b1b2353d768f netfilter: conntrack: clamp maximum hashtable size to INT_MAX
    2f2c1ce86708 netfilter: nf_tables: imbalance in flowtable binding
    6d6ce5f75d0e tls: Fix tls_sw_sendmsg error handling
    8fe5fcf25438 cxgb4: Avoid removal of uninserted tid
    0cfe1297df07 bnxt_en: Fix possible memory leak when hwrm_req_replace fails
    a313d6e6d5f3 net_sched: cls_flow: validate TCA_FLOW_RSHIFT attribute
    10923508eb77 tcp/dccp: allow a connection when sk_max_ack_backlog is zero
    bcd1557f1d38 tcp/dccp: complete lockless accesses to sk->sk_max_ack_backlog
    e67fff8fd12c net: 802: LLC+SNAP OID:PID lookup on start of skb data
    8cc8bdfbe065 ieee802154: ca8210: Add missing check for kfifo_alloc() in ca8210_probe()
    294b9826da0e ASoC: mediatek: disable buffer pre-allocation
    1f94fe692b7e exfat: fix the infinite loop in __exfat_free_cluster()
    28c21f0ac529 exfat: fix the infinite loop in exfat_readdir()
    3995b25d000c dm array: fix cursor index when skipping across block boundaries
    c850ddd1e1d8 dm array: fix unreleased btree blocks on closing a faulty array cursor
    738994872d77 dm array: fix releasing a faulty array block twice in dm_array_cursor_end
    6029c4240529 jbd2: flush filesystem device before updating tail sequence
    d42ad3f161a5 ceph: give up on paths longer than PATH_MAX
    b5d500042eb3 usb: hcd-pci: remove the action of faking interrupt request
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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 1e67936da0..2d78db3fdc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "24252937d6ebfe59470a427ef4f05d4ee7381491"
-SRCREV_meta ?= "b6e2c0d16d49638d30461ce4f832af9bf0608d05"
+SRCREV_machine ?= "e7c2ec263d8c16095369ddd7523a9514aeff11e8"
+SRCREV_meta ?= "853814dcf5cf386ac47bcc85ef384d2055c8a4e7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.176"
+LINUX_VERSION ?= "5.15.178"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 563db2fab6..d9745fd21f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.176"
+LINUX_VERSION ?= "5.15.178"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c90e38bc5ace7a98431d67a23e8b46555fe9d3a3"
-SRCREV_meta ?= "b6e2c0d16d49638d30461ce4f832af9bf0608d05"
+SRCREV_machine ?= "ac353b3cfa6ce5383c90fa9f3dc742fac5ee5ea4"
+SRCREV_meta ?= "853814dcf5cf386ac47bcc85ef384d2055c8a4e7"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index c345f7046f..8759b69c37 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "fa2dd80d85802957a32c8496321f6e49b2f015ac"
-SRCREV_machine:qemuarm64 ?= "accf953d2129f53a7ea1de535bfedfdd55de3556"
-SRCREV_machine:qemumips ?= "cf74a6b6fe7f2a268b40250f134aa1ce094edd77"
-SRCREV_machine:qemuppc ?= "0cb9b5d87e992246e1dda20cebbfc3213b54259d"
-SRCREV_machine:qemuriscv64 ?= "aa5d0061f3fdccec608f50597c50027e684205c5"
-SRCREV_machine:qemuriscv32 ?= "aa5d0061f3fdccec608f50597c50027e684205c5"
-SRCREV_machine:qemux86 ?= "aa5d0061f3fdccec608f50597c50027e684205c5"
-SRCREV_machine:qemux86-64 ?= "aa5d0061f3fdccec608f50597c50027e684205c5"
-SRCREV_machine:qemumips64 ?= "178c81e8a265eac651802a645b95b2b818fd6abc"
-SRCREV_machine ?= "aa5d0061f3fdccec608f50597c50027e684205c5"
-SRCREV_meta ?= "b6e2c0d16d49638d30461ce4f832af9bf0608d05"
+SRCREV_machine:qemuarm ?= "31fa49dbe9f3a64362078de6b59da96afcad718f"
+SRCREV_machine:qemuarm64 ?= "e46eb0a3250c9a5ee8ebea25a80298f693ae691c"
+SRCREV_machine:qemumips ?= "539bfe9f18782440707e86df545a47f425208797"
+SRCREV_machine:qemuppc ?= "c26ce5169b6964dcdafb09b4528c47b378f94528"
+SRCREV_machine:qemuriscv64 ?= "9026df72c466542d6a1592bdc12c9c8dfa54dd33"
+SRCREV_machine:qemuriscv32 ?= "9026df72c466542d6a1592bdc12c9c8dfa54dd33"
+SRCREV_machine:qemux86 ?= "9026df72c466542d6a1592bdc12c9c8dfa54dd33"
+SRCREV_machine:qemux86-64 ?= "9026df72c466542d6a1592bdc12c9c8dfa54dd33"
+SRCREV_machine:qemumips64 ?= "d633d7d27475d3615f5a33467c04b0b0cb14517c"
+SRCREV_machine ?= "9026df72c466542d6a1592bdc12c9c8dfa54dd33"
+SRCREV_meta ?= "853814dcf5cf386ac47bcc85ef384d2055c8a4e7"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "4735586da88ed2254ada53bbe19ce4fe968a1e7b"
+SRCREV_machine:class-devupstream ?= "c16c81c81336c0912eb3542194f16215c0a40037"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.176"
+LINUX_VERSION ?= "5.15.178"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.43.0


