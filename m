Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07E7ACCFA04
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 17:12:49 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.3242.1761844364767604534
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 10:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JiCJDG16;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8909f01bd00so139870685a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 10:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761844364; x=1762449164; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQ42BZ/kTFRrFoDyJ1NVJ8uWRc3Ha+Psi3Rj3T3k0f4=;
        b=JiCJDG167bu+n+Y/bR5iy46rl2bHCTm0J4VTPRnAS08bfgm/sP4BQIbxv2kIrH+fMz
         CdXYhxuRpLSZRDXZkuvJMYWmFUZYNIheoFVxnxYUcBnSOW+6kMXAr7A8gF5AEjzkFWVZ
         iSIv18u1PpCW5mSlJKk+g9Kg2zMGBtuvrOK6lvZMlatepg7RoCu26KA9TwmHOrITvP4L
         Q3FuFnBoSH4tuZhqol7XgGhH6l0FokpmnRgAwaNwgPEz9+xmF5ohin4L2smGST1HtcVk
         hMpCtvapt58vL1SQBRvZDP+xCgtoG8c1GEJbM5HSXPSGcA+cyV6kV5W/LUQPs/s4oKX5
         CTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761844364; x=1762449164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zQ42BZ/kTFRrFoDyJ1NVJ8uWRc3Ha+Psi3Rj3T3k0f4=;
        b=mT9m4cSv8lrpOk9gTR/n/+YPw+i8UkDZ2j69WeMYicWE1eqLVxBx692WOUT7Yd3JWo
         GEG7IuDhiiczePP8gCt4mcYXO/LmkolitawxJvbrMzPbR8GgcxbpkiaCNLF1gx4ic/u3
         zRxTreRSnuGq0g2uYbYSFsZhpk1Ocv/e12hIqTEGKKdHBhSb2KY1ymUNxu2SRUcGJKG5
         D75FlxQ0RvHf82+jdPsou0HOg2pGBHx4KFb3Q0XxC0P6+M8Wdj0LlNxQyfbL73PnRzhW
         1WK2kPJQXh6MwLQJYOWBKNnCWQLLulgO+XkxrJQqp4RufgH8mP7upMFcPG9VcJ4cAIez
         DgkA==
X-Gm-Message-State: AOJu0YyLKMwBr6y/sl5wOzxLpJrZbDiGcO3TYu35EyOoOQAnT/d8NX+v
	fnPfBwygS1bHAoABigQnOXpJ6EtZciE62NniSV5wCgTtwe0S0Hzzfk3mMNIUF7qrQ/U=
X-Gm-Gg: ASbGncsaD/6gBoxqaUJ4Kf3nqHwHwbTmyiKXAezkdeLu+EABuOV8UX1MLR6egPcQNSj
	jTrkWf7OnSGHkyiPctWH9WcrqsW3pa6sK3aZj5WDvb3oKlJxyB55cZTInl+F+28uqTq6mpRugzn
	EUCPLe0pCP9dp1PR/3yAZezVGWcHpmLwBdnaQ5iSOjln8BJXIxfElz9rg8++kPe/4aQy+JoY++V
	qEPu1JPcYCVFOql8QHSeELulP4mZ/1VHcO7DF1ZqO8NdCEcAGhPYc74gZA2nUS7o17JLSkOLh1N
	2wfC7LYOjaFLzP6ZzIvV1kiEzRgVGM54wvDCAKAcz/VFu2b3IufPF4PH30YOf7nPszwSd0Oo0Cg
	2a5yqClpbOtIRM8Ix6SyPnIWf/Ve4W9rcko+yU97PzNUd8VWN7K1pdApegTW99/6NKVxpZr7O+v
	Xf4zfu1XDEXPWOnSWC6ulxX+8ynr3N94MKM5gdy8/uqZ9Bw3dhvc1/ES/gK4NmLi+A5fBqHmbRL
	cX0
X-Google-Smtp-Source: AGHT+IHJTJ3PKazHTyAwZ30KWoVi/+jRhDcZSl09V4lxJVJEGmFZNYcINXUybFncIShKQ2DDvC4KUg==
X-Received: by 2002:a05:620a:40ca:b0:8a1:cd8d:b7dd with SMTP id af79cd13be357-8ab9aed9aa5mr26528485a.48.1761844363403;
        Thu, 30 Oct 2025 10:12:43 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f254ab74fsm1279296385a.32.2025.10.30.10.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 10:12:42 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/14] linux-yocto/6.12: update to v6.12.55
Date: Thu, 30 Oct 2025 13:12:23 -0400
Message-Id: <27dfd4589aff2e6c1a56e38fc5c6250bad96da40.1761844161.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1761844161.git.bruce.ashfield@gmail.com>
References: <cover.1761844161.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 17:12:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225512

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    4fc43debf504 Linux 6.12.55
    d28c1b1566a1 dmaengine: Add missing cleanup on module unload
    f3ccb4918654 arm64: errata: Apply workarounds for Neoverse-V3AE
    6de6d315f34c arm64: cputype: Add Neoverse-V3AE definitions
    ac50c6e0a8f9 mm/ksm: fix flag-dropping behavior in ksm_madvise
    a156af6a4dc3 NFSD: Define a proc_layoutcommit for the FlexFiles layout type
    e4d2a1d31fc9 phy: cadence: cdns-dphy: Update calibration wait time for startup state machine
    963f2239bdbc mptcp: reset blackhole on success with non-loopback ifaces
    ad16235c9d3e mptcp: Use __sk_dst_get() and dst_dev_rcu() in mptcp_active_enable().
    c159590e3234 mptcp: Call dst_release() in mptcp_active_enable().
    4388b7f1e42c net: Add locking to protect skb->dev access in ip_output
    95d4308875d1 ipv4: adopt dst_dev, skb_dst_dev and skb_dst_dev_net[_rcu]
    8f001670cbb2 net: dst: add four helpers to annotate data-races around dst->dev
    bcdbf4d7d913 tcp: cache RTAX_QUICKACK metric in a hot cache line
    f620d9ba4a09 tcp: convert to dev_net_rcu()
    bf580112ed61 ixgbevf: fix mailbox API compatibility by negotiating supported features
    68bfddd2b3be ixgbevf: fix getting link speed data for E610 devices
    8a661d63d554 ixgbevf: Add support for Intel(R) E610 device
    fb151d86dc04 PCI: Add PCI_VDEVICE_SUB helper macro
    620f3b0ede9c vfs: Don't leak disconnected dentries on umount
    dc63d8781463 d_alloc_parallel(): set DCACHE_PAR_LOOKUP earlier
    9ec6939a502d x86/resctrl: Fix miscount of bandwidth event when reactivating previously unavailable RMID
    12e3db99bc4e x86/resctrl: Refactor resctrl_arch_rmid_read()
    78a2d39e2eef md: fix mssing blktrace bio split events
    2d24bf9117ad md/raid10: Handle bio_split() errors
    74dc8c235ad0 md/raid1: Handle bio_split() errors
    069e7bbe4382 md/raid0: Handle bio_split() errors
    fd819637d0cf padata: Reset next CPU when reorder sequence wraps around
    88ad39711bfb xfs: use deferred intent items for reaping crosslinked blocks
    e9fd43b799d2 wifi: rtw89: avoid possible TX wait initialization race
    c33da548fbf2 NFSD: Fix last write offset handling in layoutcommit
    da68bc55d5f8 NFSD: Implement large extent array support in pNFS
    18eee640741c NFSD: Minor cleanup in layoutcommit processing
    47c609979b08 NFSD: Rework encoding and decoding of nfsd4_deviceid
    5def53c55a1e nfsd: Drop dprintk in blocklayout xdr functions
    434b399044ae nfsd: Use correct error code when decoding extents
    7e708dbee2e8 iio: imu: inv_icm42600: Avoid configuring if already pm_runtime suspended
    29c57a688bb4 iio: imu: inv_icm42600: Simplify pm_runtime setup
    69a837b75edc PM: runtime: Add new devm functions
    4d1422bfef2d phy: cadence: cdns-dphy: Fix PLL lock and O_CMN_READY polling
    f9ad5c7c472f phy: cdns-dphy: Store hs_clk_rate and return it
    9909b28175c1 xfs: fix log CRC mismatches between i386 and other architectures
    ab0f805bed81 xfs: rename the old_crc variable in xlog_recover_process
    586c75dfd1d2 hfsplus: fix slab-out-of-bounds read in hfsplus_strcasecmp()
    f3fe1abdeb2c nvme/tcp: handle tls partially sent records in write_space()
    2a87a1c5866c selftests: arg_parsing: Ensure data is flushed to disk before reading.
    095d692e5997 ASoC: amd/sdw_utils: avoid NULL deref when devm_kasprintf() fails
    9ab3e03765b9 HID: multitouch: fix name of Stylus input devices
    560024035fe7 HID: hid-input: only ignore 0 battery events for digitizers
    bba7208765d2 ALSA: usb-audio: Fix NULL pointer deference in try_to_register_card
    c1bcd7205ac3 selftests/bpf: make arg_parsing.c more robust to crashes
    21ba0445e422 accel/qaic: Synchronize access to DBC request queue head & tail pointer
    551f1dfbcb7f accel/qaic: Treat remaining == 0 as error in find_and_map_user_pages()
    646868e6962b accel/qaic: Fix bootlog initialization ordering
    e15f6ac84445 ALSA: firewire: amdtp-stream: fix enum kernel-doc warnings
    cb4c8439cf6d sched/fair: Fix pelt lost idle time detection
    8fecfa1c17a1 drm/rockchip: vop2: use correct destination rectangle height check
    33fee60d39b7 drm/draw: fix color truncation in drm_draw_fill24
    e4628ada9b95 drm/amd/powerplay: Fix CIK shutdown temperature
    87b634c37509 drm/amdgpu: fix handling of harvesting for ip_discovery firmware
    0a77caacc1d3 drm/amdgpu: add support for cyan skillfish without IP discovery
    90653d924b6b drm/amdgpu: add ip offset support for cyan skillfish
    657e8f9f7489 drm/i915/guc: Skip communication warning on reset in progress
    af66058d13f0 ASoC: nau8821: Add DMI quirk to bypass jack debounce circuit
    129cef0e37d4 ASoC: nau8821: Generalize helper to clear IRQ status
    8ed3d6cf03cb ASoC: nau8821: Cancel jdet_work before handling jack ejection
    70a65e2893a7 ASoC: codecs: Fix gain setting ranges for Renesas IDT821034 codec
    e2a7c66261fe drm/bridge: lt9211: Drop check for last nibble of version register
    d694f809df41 riscv: kprobes: Fix probe address validation
    3fc87107f036 nvme-multipath: Skip nr_active increments in RETRY disposition
    5a833099033d drm/panthor: Ensure MCU is disabled on suspend
    d8a3a530d8b3 net: usb: lan78xx: fix use of improperly initialized dev->chipid in lan78xx_reset
    f30f0062f609 net: usb: lan78xx: Add error handling to lan78xx_init_mac_address
    95af08507322 netdevsim: set the carrier when the device goes up
    bbcf2da067ae tls: don't rely on tx_work during send()
    39dec4ea3daf tls: wait for pending async decryptions if tls_strp_msg_hold fails
    bea15cd6f1e2 tls: always set record_type in tls_process_cmsg
    0e2e8c4d0c37 tls: wait for async encrypt in case of error during latter iterations of sendmsg
    b1cf131f6df8 tls: trim encrypted message to match the plaintext on short splice
    49683288a77c tg3: prevent use of uninitialized remote_adv and local_adv variables
    4602b8cee148 ksmbd: fix recursive locking in RPC handle list access
    814ec62e42f4 tcp: fix tcp_tso_should_defer() vs large RTT
    4f4af833c7ee amd-xgbe: Avoid spurious link down messages during interface toggle
    eeb434548867 net/ip6_tunnel: Prevent perpetual tunnel growth
    599f9faabaee r8169: fix packet truncation after S4 resume on RTL8168H/RTL8111H
    34143a23fca8 doc: fix seg6_flowlabel path
    824be3d3437f net: dlink: handle dma_map_single() failure properly
    7ed47a3207f5 can: m_can: fix CAN state in system PM
    b7f989b93836 can: m_can: call deinit/init callback when going into suspend/resume
    6219594f665f can: m_can: add deinit callback
    df689d75c46d can: m_can: m_can_chip_config(): bring up interface in correct state
    4411ca4ca715 can: m_can: m_can_handle_state_errors(): fix CAN state transition to Error Active
    b4851ba36459 can: m_can: m_can_plat_remove(): add missing pm_runtime_disable()
    39563a86579a dax: skip read lock assertion for read-only filesystems
    f32fea4c0234 HID: multitouch: fix sticky fingers
    df23d9ac3455 Revert "io_uring/rw: drop -EOPNOTSUPP check in __io_complete_rw_common()"
    24883bfe09c5 cpufreq: CPPC: Avoid using CPUFREQ_ETERNAL as transition delay
    380353c3a92b usb: gadget: f_rndis: Refactor bind path to use __free()
    15b9faf53ba8 usb: gadget: f_ecm: Refactor bind path to use __free()
    201a66d8e663 usb: gadget: f_acm: Refactor bind path to use __free()
    d3fe7143928d usb: gadget: f_ncm: Refactor bind path to use __free()
    56b5f34542d7 usb: gadget: Introduce free_usb_request helper
    1a3949c3e5c3 usb: gadget: Store endpoint pointer in usb_request
    7138de99f7b1 drm/exynos: exynos7_drm_decon: remove ctx->suspended
    a02e8415156b drm/exynos: exynos7_drm_decon: properly clear channels during bind
    2812c6b13bcc drm/exynos: exynos7_drm_decon: fix uninitialized crtc reference in functions
    e8b5f4d80775 media: nxp: imx8-isi: m2m: Fix streaming cleanup on release
    f0b75b4caaaf media: nxp: imx8-isi: Drop unused argument to mxc_isi_channel_chain()
    3e7b89ed9f07 drm/msm/a6xx: Fix PDC sleep sequence
    2e24713ba2db cdx: Fix device node reference leak in cdx_msi_domain_init
    c472088522d6 irqdomain: cdx: Switch to of_fwnode_handle()
    03fe1647e265 drm/amd: Check whether secure display TA loaded successfully
    eacc4fc28dd9 perf/core: Fix MMAP2 event device with backing files
    7024b11fb47e perf/core: Fix MMAP event path names with backing files
    6ddc602b1cfb perf/core: Fix address filter match with backing files
    e5914820d351 drm/amdgpu: fix gfx12 mes packet status return check
    e4937f3ef925 drm/amdgpu: use atomic functions with memory barriers for vm fault info
    e5e3eb2aff92 drm/sched: Fix potential double free in drm_sched_job_add_resv_dependencies
    8bc4a8d39bac cifs: parse_dfs_referrals: prevent oob on malformed input
    cc87d3d0f4af can: gs_usb: increase max interface to U8_MAX
    52eb720e5bfd can: gs_usb: gs_make_candev(): populate net_device->dev_port
    3fdcfd91b93f btrfs: do not assert we found block group item when creating free space tree
    187333e6d484 btrfs: fix memory leaks when rejecting a non SINGLE data profile without an RST
    376b9f404130 btrfs: fix incorrect readahead expansion length
    2b039c50299b btrfs: fix memory leak on duplicated memory in the qgroup assign ioctl
    d2d3902f134e btrfs: fix clearing of BTRFS_FS_RELOC_RUNNING if relocation already running
    de985264eef6 ext4: detect invalid INLINE_DATA + EXTENTS flag combination
    5b7b9a17151b ext4: wait for ongoing I/O to complete before freeing blocks
    9f5738883977 jbd2: ensure that all ongoing I/O complete before freeing blocks
    40bf3676cb39 f2fs: fix wrong block mapping for multi-devices
    d6cf1320591d r8152: add error handling in rtl8152_driver_init
    4772e7f18ac2 slab: reset slab->obj_ext when freeing and it is OBJEXTS_ALLOC_FAIL
    e15605b68b49 smb: client: Fix refcount leak for cifs_sb_tlink
    dc15450a5b85 rust: cfi: only 64-bit arm and x86 support CFI_CLANG
    2c6e5904c5bd drm/xe/guc: Check GuC running state before deregistering exec queue
    c1859a8cfe84 Linux 6.12.54
    779327c2be02 nfsd: decouple the xprtsec policy check from check_nfsd_access()
    2d68f8a7379d mount: handle NULL values in mnt_ns_release()
    e051ab688e5d ASoC: SOF: ipc4-pcm: fix start offset calculation for chain DMA
    996b8797d62f nfsd: fix access checking for NLM under XPRTSEC policies
    4c4d66e8110e nfsd: fix __fh_verify for localio
    55fd40390e27 perf test stat: Avoid hybrid assumption when virtualized
    e67e3e738f08 sched/fair: Block delayed tasks on throttled hierarchy during dequeue
    496b5ef11dc3 writeback: Avoid excessively long inode switching times
    bd408c334f3a writeback: Avoid softlockup when switching many inodes
    4bdabd52ca1b cramfs: Verify inode mode when loading from disk
    a05855302b50 fs: Add 'initramfs_options' to set initramfs mount options
    2076b916bf41 pid: Add a judgment for ns null in pid_nr_ns
    446a54d35759 minixfs: Verify inode mode when loading from disk
    e85385d5a400 copy_file_range: limit size if in compat mode
    14fd5e880a47 irqchip/sifive-plic: Avoid interrupt ID 0 handling during suspend/resume
    47744d188004 irqchip/sifive-plic: Make use of __assign_bit()
    e1d6661095b0 s390/bpf: Write back tail call counter for BPF_TRAMP_F_CALL_ORIG
    9d04727414b7 s390/bpf: Write back tail call counter for BPF_PSEUDO_CALL
    67228efec545 s390/bpf: Describe the frame using a struct instead of constants
    f6fa61d89ee5 s390/bpf: Centralize frame offset calculations
    14e4623df610 mm/rmap: fix soft-dirty and uffd-wp bit loss when remapping zero-filled mTHP subpage to shared zeropage
    04610b77809f ipmi: Fix handling of messages with provided receive message pointer
    53d6e403affb ipmi: Rework user message limit handling
    1e059ce9cc7b mptcp: pm: in-kernel: usable client side with C-flag
    532db65943fc ACPI: property: Do not pass NULL handles to acpi_attach_data()
    687ff8354acd ACPI: property: Add code comments explaining what is going on
    6c654ecf6e19 ACPI: property: Disregard references in data-only subnode lists
    237d6e1de0f2 ACPI: battery: Add synchronization between interface updates
    6950184bf51b ACPI: battery: Check for error code from devm_mutex_init() call
    ca0e8805d8f0 ACPI: battery: initialize mutexes through devm_ APIs
    5187bb848aab ACPI: battery: allocate driver data through devm_ APIs
    efbc2d6a9291 nfsd: unregister with rpcbind when deleting a transport
    0a1ee3c932dc nfsd: don't use sv_nrthreads in connection limiting calculations.
    18744bc56b0e nfsd: refine and rename NFSD_MAY_LOCK
    763d4aa41845 NFSD: Replace use of NFSD_MAY_LOCK in nfsd4_lock()
    658bedb82ec5 nfsd: Fix NFSD_MAY_BYPASS_GSS and NFSD_MAY_BYPASS_GSS_ON_ROOT
    34ff466f74d0 x86/kvm: Force legacy PCI hole to UC when overriding MTRRs for TDX/SNP
    b7b6f95bb336 x86/mtrr: Rename mtrr_overwrite_state() to guest_force_mtrr_state()
    423eba50f833 arm64: mte: Do not flag the zero page as PG_mte_tagged
    fa1974fad4bc statmount: don't call path_put() under namespace semaphore
    32c258aad47e KVM: x86: Advertise SRSO_USER_KERNEL_NO to userspace
    81c5d23a2975 cpufreq: Make drivers using CPUFREQ_ETERNAL specify transition latency
    820cfaee9d92 btrfs: fix the incorrect max_bytes value for find_lock_delalloc_range()
    24b760c6c45a mfd: intel_soc_pmic_chtdc_ti: Set use_single_read regmap_config flag
    a632935c1758 mfd: intel_soc_pmic_chtdc_ti: Drop unneeded assignment for cache_type
    71e80c82c608 mfd: intel_soc_pmic_chtdc_ti: Fix invalid regmap-config max_register value
    a4ae0c21ae13 ASoC: SOF: ipc4-pcm: fix delay calculation when DSP resamples
    848e6babaa8a ASoC: SOF: ipc4-pcm: Enable delay reporting for ChainDMA streams
    fb54ffd60064 PCI: endpoint: pci-epf-test: Add NULL check for DMA channels before release
    7e8e579a0c2f PCI: endpoint: Remove surplus return statement from pci_epf_test_clean_dma_chan()
    5e311f009daa mm/ksm: fix incorrect KSM counter handling in mm_struct during fork
    0fa388ab2c29 tracing: Fix race condition in kprobe initialization causing NULL pointer dereference
    875fb3f87ae0 Squashfs: reject negative file sizes in squashfs_read_inode()
    234f6e1f7e6f Squashfs: add additional inode sanity checking
    7db47e737128 media: mc: Clear minor number before put device
    394ad2131933 selftests/mm: skip soft-dirty tests when CONFIG_MEM_SOFT_DIRTY is disabled
    6f02e337cbf4 lib/crypto/curve25519-hacl64: Disable KASAN with clang-17 and older
    4c0df2938e11 ext4: free orphan info with kvfree
    2722f13fdeeb ACPICA: Allow to skip Global Lock initialization
    c7242c71cb0f ext4: validate ea_ino and size in check_xattrs
    6b879c4c6bba ext4: guard against EA inode refcount underflow in xattr update
    4c2473d591e1 ext4: fix an off-by-one issue during moving extents
    2a0cf438320c ext4: avoid potential buffer over-read in parse_apply_sb_mount_options()
    d0327630ecab ext4: correctly handle queries for metadata mappings
    c2ad6583fe26 ext4: increase i_disksize to offset + len in ext4_update_disksize_before_punch()
    a2d803fab8a6 ext4: verify orphan file size is not too big
    9169ef838d0c ext4: add ext4_sb_bread_nofail() helper function for ext4_free_branches()
    6248ff249b4f nfsd: nfserr_jukebox in nlm_fopen should lead to a retry
    017addab06aa NFSD: Fix destination buffer size in nfsd4_ssc_setup_dul()
    d9c7886b84b3 mm/damon/lru_sort: use param_ctx for damon_attrs staging
    ac42320ec873 mm/damon/vaddr: do not repeat pte_offset_map_lock() until success
    b9737c2063ab mm/hugetlb: early exit from hugetlb_pages_alloc_boot() when max_huge_pages=0
    856fe1a900a6 mm/page_alloc: only set ALLOC_HIGHATOMIC for __GPF_HIGH allocations
    ee2b37c11d62 mm/thp: fix MTE tag mismatch when replacing zero-filled subpages
    b419093e5e42 wifi: mt76: mt7921u: Add VID/PID for Netgear A7500
    feb1774aaf85 wifi: mt76: mt7925u: Add VID/PID for Netgear A9000
    bd3ac455a88d wifi: ath11k: HAL SRNG: don't deinitialize and re-initialize again
    715b6a5b41da slab: mark slab->obj_exts allocation failures unconditionally
    e8baa4bf9d90 slab: prevent warnings when slab obj_exts vector allocation fails
    f7ab235fa0d7 s390: Add -Wno-pointer-sign to KBUILD_CFLAGS_DECOMPRESSOR
    54ccd92b7976 s390/dasd: Return BLK_STS_INVAL for EINVAL from do_dasd_request
    9582756d9746 s390/dasd: enforce dma_alignment to ensure proper buffer validation
    86cade051b67 selftests: mptcp: join: validate C-flag + def limit
    93749fb7f6a4 x86/umip: Fix decoding of register forms of 0F 01 (SGDT and SIDT aliases)
    4fe479073715 x86/umip: Check that the instruction opcode is at least two bytes
    08c70f1f7217 x86/fred: Remove ENDBR64 from FRED entry points
    1ce9d6c60c92 spi: cadence-quadspi: Fix cqspi_setup_flash()
    a3a7b7467956 spi: cadence-quadspi: Flush posted register writes before DAC access
    4497954dd233 spi: cadence-quadspi: Flush posted register writes before INDAC access
    1f17a94311e8 PCI: tegra194: Reset BARs when running in PCIe endpoint mode
    a93bd0a668b2 PCI: tegra194: Handle errors in BPMP response
    695c062da7d3 PCI: tegra194: Fix broken tegra_pcie_ep_raise_msi_irq()
    7503861b839b PCI: rcar-host: Convert struct rcar_msi mask_lock into raw spinlock
    8f79f82ea5da PCI: rcar-host: Drop PMSR spinlock
    551108bd5c9b PCI: rcar-gen4: Fix PHY initialization
    65b218539486 PCI: keystone: Use devm_request_irq() to free "ks-pcie-error-irq" on exit
    37e46d6cfb7d PCI: j721e: Fix programming sequence of "strap" settings
    3bc0a180d928 PCI/AER: Support errors introduced by PCIe r6.0
    a4bc85f083ad PCI/AER: Fix missing uevent on recovery when a reset is requested
    2fad3c11066c PCI/ERR: Fix uevent on failure to recover
    53154cd40ccf PCI/IOV: Add PCI rescan-remove locking when enabling/disabling SR-IOV
    3ea9bd428581 PCI/sysfs: Ensure devices are powered for config reads
    d4f9b44e81fc PCI: tegra: Convert struct tegra_msi mask_lock into raw spinlock
    97e4a50069fc PCI: xilinx-nwl: Fix ECAM programming
    866236611286 rseq/selftests: Use weak symbol reference, not definition, to link with glibc
    4790e3a1f61d rtc: interface: Fix long-standing race when setting alarm
    04eaae798085 rtc: interface: Ensure alarm irq is enabled when UIE is enabled
    cbcfb32b6aae memory: samsung: exynos-srom: Fix of_iomap leak in exynos_srom_probe
    99141fc03c22 mmc: mmc_spi: multiple block read remove read crc ack
    cb7a1f5e2930 mmc: core: SPI mode remove cmd7
    c2c8a3bfd824 mtd: rawnand: fsmc: Default to autodetect buswidth
    1463cd066f32 xsk: Harden userspace-supplied xdp_desc validation
    d381de7fd4cd xtensa: simdisk: add input size check in proc_write_simdisk
    e3c5ac668bb9 sparc: fix error handling in scan_one_device()
    9632dd92bd55 sparc64: fix hugetlb for sun4u
    8019b3699289 sctp: Fix MAC comparison to be constant-time
    4fbcd2bc60df scsi: sd: Fix build warning in sd_revalidate_disk()
    7b2ef1a0a2f1 scsi: hpsa: Fix potential memory leak in hpsa_big_passthru_ioctl()
    305b1a39f3bb sched/deadline: Fix race in push_dl_task()
    b9cc7155e65f Revert "ipmi: fix msg stack when IPMI is disconnected"
    d9457e625875 pwm: berlin: Fix wrong register in suspend/resume
    e5505b3c7370 powerpc/pseries/msi: Fix potential underflow and leak issue
    e7057be810ed powerpc/powernv/pci: Fix underflow and leak issue
    b91518adbec9 power: supply: max77976_charger: fix constant current reporting
    fb03a2cd4b1b pinctrl: samsung: Drop unused S3C24xx driver data
    df2a0ee58d9e nvme-pci: Add TUXEDO IBS Gen8 to Samsung sleep quirk
    371ccc8908b3 parisc: Remove spurious if statement from raw_copy_from_user()
    a75aa35e1aa1 parisc: don't reference obsolete termio struct for TC* constants
    660b40a31932 openat2: don't trigger automounts with RESOLVE_NO_XDEV
    f112154107d4 of: unittest: Fix device reference count leak in of_unittest_pci_node_verify
    b4f4122b5795 loop: fix backing file reference leak on validation error
    e5400e827220 lib/genalloc: fix device leak in of_gen_pool_get()
    ec230e7ac6a9 KEYS: trusted_tpm1: Compare HMAC values in constant time
    19b45c84bd9f kernel/sys.c: fix the racy usage of task_lock(tsk->group_leader) in sys_prlimit64() paths
    38946f094bbd iommu/vt-d: PRS isn't usable if PDS isn't supported
    c322dc8051b8 iio: imu: inv_icm42600: Drop redundant pm_runtime reinitialization in resume
    6187753da298 init: handle bootloader identifier in kernel parameters
    bb9730d8c063 iio: xilinx-ams: Unmask interrupts after updating alarms
    2165424b1485 iio: xilinx-ams: Fix AMS_ALARM_THR_DIRECT_MASK
    9fcf4821964b iio: frequency: adf4350: Fix prescaler usage.
    4b8613394c0d iio: dac: ad5421: use int type to store negative error codes
    f10ec6a5a22f iio: dac: ad5360: use int type to store negative error codes
    cf2f2250882a iio/adc/pac1934: fix channel disable configuration
    b26923512dbe fuse: fix livelock in synchronous file put from fuseblk workers
    a9bce5fed67c fuse: fix possibly missing fuse_copy_finish() call in fuse_notify()
    f12039df1515 fs: quota: create dedicated workqueue for quota_release_work
    8ce394a094f1 fs/ntfs3: Fix a resource leak bug in wnd_extend()
    f7cf0d774710 fbdev: Fix logic error in "offb" name match
    b99bc5a48ddc eventpoll: Replace rwlock with spinlock
    23351fbe499f crypto: rockchip - Fix dma_unmap_sg() nents value
    f037ab3dd49c crypto: atmel - Fix dma_unmap_sg() direction
    3ddd4942ea3d crypto: aspeed - Fix dma_unmap_sg() direction
    ba63d4e9857a cpufreq: intel_pstate: Fix object lifecycle issue in update_qos_request()
    bc9f74e96b3e copy_sighand: Handle architectures where sizeof(unsigned long) < sizeof(u64)
    c83d6fbabc07 clk: qcom: tcsrcc-x1e80100: Set the bi_tcxo as parent to eDP refclk
    61a60c45ebd6 bus: mhi: host: Do not use uninitialized 'dev' pointer in mhi_init_irq_setup()
    3d20d59c0e86 bus: mhi: ep: Fix chained transfer handling in read path
    361d67276eb8 btrfs: avoid potential out-of-bounds in btrfs_encode_fh()
    c7c6c09cb46f blk-crypto: fix missing blktrace bio split events
    a91c4c1efb9a drm/amd/display: Enable Dynamic DTBCLK Switch
    ee49c1cf1b9c drm/xe/uapi: loosen used tracking restriction
    eca4673229b0 drm/nouveau: fix bad ret code in nouveau_bo_move_prep
    82ba9b12e8ee drm/rcar-du: dsi: Fix 1/2/3 lane support
    ebb874e62067 drm/panthor: Fix memory leak in panthor_ioctl_group_create()
    70de0a96c3a0 media: lirc: Fix error handling in lirc_register()
    cf5cdf7534db media: ti: j721e-csi2rx: Fix source subdev link creation
    a5d05d925a84 media: ti: j721e-csi2rx: Use devm_of_platform_populate
    f52c8cfe84b9 media: vivid: fix disappearing <Vendor Command With ID> messages
    7a5509677577 media: venus: firmware: Use correct reset sequence for IRIS2
    6abc3b74e50a media: s5p-mfc: remove an unused/uninitialized variable
    b7f82da7f864 media: pci: mg4b: fix uninitialized iio scan data
    502ee4852b2c media: pci: ivtv: Add missing check after DMA map
    bf81e513c282 media: mc: Fix MUST_CONNECT handling for pads with no links
    153afef28222 media: i2c: mt9v111: fix incorrect type for ret
    a9edd7f64eed media: cx18: Add missing check after DMA map
    cde6cdb2b25f media: cec: extron-da-hd-4k-plus: drop external-module make commands
    823087ab267e firmware: meson_sm: fix device leak at probe
    b1fc6cc30e12 xen/events: Update virq_to_irq on migration
    a1e7f07ae6b5 xen/events: Return -EEXIST for bound VIRQs
    8f6306ed9f23 xen/manage: Fix suspend error path
    0f8b3aabb253 xen/events: Cleanup find_virq() return codes
    377229c49c08 dt-bindings: phy: rockchip-inno-csi-dphy: make power-domains non-required
    3479e0e9a325 perf/arm-cmn: Fix CMN S3 DTM offset
    719215a16020 ARM: OMAP2+: pm33xx-core: ix device node reference leaks in amx3_idle_init
    3ba58e9158d2 ARM: AM33xx: Implement TI advisory 1.0.36 (EMU0/EMU1 pins state on reset)
    4e7eec38e27d arm64: kprobes: call set_memory_rox() for kprobe page
    454128d96cf5 arm64: dts: ti: k3-am62a-main: Fix main padcfg length
    07dd0edfcdec arm64: dts: qcom: x1e80100-pmics: Disable pm8010 by default
    28901349a6ab arm64: dts: qcom: sdm845: Fix slimbam num-channels/ees
    1e137c4b12b7 arm64: dts: qcom: msm8939: Add missing MDSS reset
    34d90c37bb68 arm64: dts: qcom: msm8916: Add missing MDSS reset
    947751c11e08 ACPI: debug: fix signedness issues in read/write helpers
    594101b69cc5 ACPI: TAD: Add missing sysfs_remove_group() for ACPI_TAD_RT
    c19ce8b13f64 ACPI: property: Fix buffer properties extraction for subnodes
    e3e6f0ba1cd2 s390/vmlinux.lds.S: Move .vmlinux.info to end of allocatable sections
    62f922283aa7 s390: vmlinux.lds.S: Reorder sections
    ee04cff9ed4d bpf: Avoid RCU context warning when unpinning htab with internal structs
    7aef9f900528 gpio: wcd934x: mark the GPIO controller as sleeping
    d9839dbaae6a tpm_tis: Fix incorrect arguments in tpm_tis_probe_irq_single
    fc2f2011d3d8 cifs: Query EA $LXMOD in cifs_query_path_info() for WSL reparse points
    7a411fb4674d smb: client: fix missing timestamp updates after utime(2)
    6e2c760b644a cifs: Fix copy_to_iter return value check
    dc4c854a5e74 crypto: essiv - Check ssize for decryption and in-place encryption
    a794af484367 selftests: netfilter: query conntrack state to check for port clash resolution
    dae85dc6ad5b bridge: br_vlan_fill_forward_path_pvid: use br_vlan_group_rcu()
    7ea55a44493a netfilter: nft_objref: validate objref and objrefmap expressions
    d74bcf496985 drm/amd/display: Properly disable scaling on DCE6
    00f1bd57068b drm/amd/display: Properly clear SCL_*_FILTER_CONTROL on DCE6
    56251bdf36ee drm/amd/display: Add missing DCE6 SCL_HORZ_FILTER_INIT* SRIs
    9626d3af3cd1 drm/amdgpu: Add additional DCE6 SCL registers
    2ff846335798 mailbox: mtk-cmdq: Remove pm_runtime APIs from cmdq_mbox_send_data()
    b586fbbebd49 mailbox: mtk-cmdq: Switch to pm_runtime_put_autosuspend()
    2a2b88a2d780 mailbox: mtk-cmdq-mailbox: Switch to __pm_runtime_put_autosuspend()
    f36a305d30f5 bpf: Fix metadata_dst leak __bpf_redirect_neigh_v{4,6}
    1ee147efee68 mailbox: zynqmp-ipi: Fix SGI cleanup on unbind
    cd0cbf2713f6 mailbox: zynqmp-ipi: Fix out-of-bounds access in mailbox cleanup loop
    91bbee4e6dfe mailbox: zynqmp-ipi: Remove dev.parent check in zynqmp_ipi_free_mboxes
    ddd9c81a1b3b mailbox: zynqmp-ipi: Remove redundant mbox_controller_unregister() call
    6d6754330981 tcp: take care of zero tp->window_clamp in tcp_set_rcvlowat()
    cdab92a75985 perf python: split Clang options when invoking Popen
    882b91ec6e9f tools build: Align warning options with perf
    6f4f4bab8973 net: fsl_pq_mdio: Fix device node reference leak in fsl_pq_mdio_probe
    7b9269de9815 ice: ice_adapter: release xa entry on adapter allocation failure
    70acdd1eb35f net: mscc: ocelot: Fix use-after-free caused by cyclic delayed work
    c11ace909e87 tcp: Don't call reqsk_fastopen_remove() in tcp_conn_request().
    d0e8f1445c19 net/sctp: fix a null dereference in sctp_disposition sctp_sf_do_5_1D_ce()
    488c94753979 drm/vmwgfx: Fix copy-paste typo in validation
    655a2f29bfc2 drm/vmwgfx: Fix Use-after-free in validation
    13c9e4ed125e drm/vmwgfx: Fix a null-ptr access in the cursor snooper
    f224b06c7281 s390/cio: Update purge function to unregister the unused subchannels
    c772e7cc9045 drm/xe/hw_engine_group: Fix double write lock release in error path
    e82948ba83cc net/mlx4: prevent potential use after free in mlx4_en_do_uc_filter()
    9fc2af69d5d1 ASoC: SOF: Intel: Read the LLP via the associated Link DMA channel
    2db1464d8be2 LoongArch: Init acpi_gbl_use_global_lock to false
    f7f2b1c3038c LoongArch: Add cflag -fno-isolate-erroneous-paths-dereference
    eb6cd53402db ASoC: SOF: Intel: hda-pcm: Place the constraint on period time instead of buffer time
    a41a9d0a5b59 ASoC: SOF: ipc4-topology: Account for different ChainDMA host buffer size
    53d07ac2adfb ASoC: SOF: ipc4-topology: Correct the minimum host DMA buffer size
    00d3af40b158 scsi: mvsas: Fix use-after-free bugs in mvs_work_queue
    5e1020047cb7 cpufreq: tegra186: Set target frequency for all cpus in policy
    8d54bd8d8768 clk: tegra: do not overallocate memory for bpmp clocks
    28defa35ed15 clk: nxp: Fix pll0 rate check condition in LPC18xx CGU driver
    a8b0247e7e9e clk: nxp: lpc18xx-cgu: convert from round_rate() to determine_rate()
    04d7cef497a9 clk: mediatek: clk-mux: Do not pass flags to clk_mux_determine_rate_flags()
    51d376a16e55 clk: mediatek: mt8195-infra_ao: Fix parent for infra_ao_hdmi_26m
    c766c3aa3169 perf evsel: Ensure the fallback message is always written to
    f49a92fe5716 perf tools: Add fallback for exclude_guest
    b01c2dd67929 perf test: Add a test for default perf stat command
    8e67c35a6425 perf test: Don't leak workload gopipe in PERF_RECORD_*
    f1c41dbd0810 perf session: Fix handling when buffer exceeds 2 GiB
    3fcbe5482810 perf test shell lbr: Avoid failures with perf event paranoia
    491c4eed60fa perf test: Update sysfs path for core PMU caps
    20027d8416a4 perf vendor events arm64 AmpereOneX: Fix typo - should be l1d_cache_access_prefetches
    c955a161b4a9 perf arm_spe: Correct memory level for remote access
    4dd0a97e3b7a perf arm-spe: Rename the common data source encoding
    ec29c3e9bdcc perf arm_spe: Correct setting remote access
    bdde538d5d8c rtc: optee: fix memory leak on driver removal
    d98a5eeede96 rtc: x1205: Fix Xicor X1205 vendor prefix
    4be14daf8919 perf util: Fix compression checks returning -1 as bool
    ca370366fdcd clk: renesas: cpg-mssr: Fix memory leak in cpg_mssr_reserved_init()
    18a8d826b469 clk: at91: peripheral: fix return value
    2fe5844fa994 clk: qcom: common: Fix NULL vs IS_ERR() check in qcom_cc_icc_register()
    535e310360f6 libperf event: Ensure tracing data is multiple of 8 sized
    2f3e5c090166 perf evsel: Avoid container_of on a NULL leader
    7be1a7b56ef1 perf test trace_btf_enum: Skip if permissions are insufficient
    2692752311d6 perf disasm: Avoid undefined behavior in incrementing NULL
    1aeb7e6392d5 asm-generic/io.h: Skip trace helpers if rwmmio events are disabled
    94e6336dc1f0 media: v4l2-subdev: Fix alloc failure check in v4l2_subdev_call_state_try()
    0cd821daa260 iio: frequency: adf4350: Fix ADF4350_REG3_12BIT_CLKDIV_MODE
    2af086f6fd99 KVM: SVM: Emulate PERF_CNTR_GLOBAL_STATUS_SET for PerfMonV2
    801f7999ab8b dma-mapping: fix direction in dma_alloc direction traces
    15b8a5b4cdc1 page_pool: Fix PP_MAGIC_MASK to avoid crashing on some 32-bit arches
    68a8fc370b86 clocksource/drivers/clps711x: Fix resource leaks in error paths
    659874b7ee49 listmount: don't call path_put() under namespace semaphore
    b42a82c630f4 rseq: Protect event mask against membarrier IPI
    fdd380a59505 arm64: map [_text, _stext) virtual address range non-executable+read-only
    90f60c455d10 fscontext: do not consume log entries when returning -EMSGSIZE
    02f0b08f970f fs: always return zero on success from replace_fd()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 461cce76b5..cccd9b28e9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2972edff35ce97bb8bab97dcd22063be41b244e0"
-SRCREV_meta ?= "85715aeb30d5d82a7886c148632e13dc4426c72d"
+SRCREV_machine ?= "014bc4e5637527525b6f97f58a09f2207c140293"
+SRCREV_meta ?= "3f0dcb29edf14029f130bc493a939b67ea27852e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.53"
+LINUX_VERSION ?= "6.12.55"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index b49161d29b..d3be33cf38 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.53"
+LINUX_VERSION ?= "6.12.55"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "9f0c7b00d414236127b4154087ba39c1a4df449c"
-SRCREV_meta ?= "85715aeb30d5d82a7886c148632e13dc4426c72d"
+SRCREV_machine ?= "c77f4d163458157a4c88d9cd9e175543a5d20140"
+SRCREV_meta ?= "3f0dcb29edf14029f130bc493a939b67ea27852e"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index f46e1c62e1..fa6a0ba936 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "96644b39336f28f9e23ff945d805186def0b736c"
-SRCREV_machine:qemuarm64 ?= "9f0c7b00d414236127b4154087ba39c1a4df449c"
-SRCREV_machine:qemuloongarch64 ?= "9f0c7b00d414236127b4154087ba39c1a4df449c"
-SRCREV_machine:qemumips ?= "8154a9934a20b59ab134a9aa9984034528c5ec19"
-SRCREV_machine:qemuppc ?= "9f0c7b00d414236127b4154087ba39c1a4df449c"
-SRCREV_machine:qemuriscv64 ?= "9f0c7b00d414236127b4154087ba39c1a4df449c"
-SRCREV_machine:qemuriscv32 ?= "9f0c7b00d414236127b4154087ba39c1a4df449c"
-SRCREV_machine:qemux86 ?= "9f0c7b00d414236127b4154087ba39c1a4df449c"
-SRCREV_machine:qemux86-64 ?= "9f0c7b00d414236127b4154087ba39c1a4df449c"
-SRCREV_machine:qemumips64 ?= "c40f42f2b1038d88142804aac0dafbe106003b8d"
-SRCREV_machine ?= "9f0c7b00d414236127b4154087ba39c1a4df449c"
-SRCREV_meta ?= "85715aeb30d5d82a7886c148632e13dc4426c72d"
+SRCREV_machine:qemuarm ?= "e646fbdc560660a283cb67b585c37ae73610c31b"
+SRCREV_machine:qemuarm64 ?= "c77f4d163458157a4c88d9cd9e175543a5d20140"
+SRCREV_machine:qemuloongarch64 ?= "c77f4d163458157a4c88d9cd9e175543a5d20140"
+SRCREV_machine:qemumips ?= "b1b7883585a3e1adce260c566b8986b5c8d5a12e"
+SRCREV_machine:qemuppc ?= "c77f4d163458157a4c88d9cd9e175543a5d20140"
+SRCREV_machine:qemuriscv64 ?= "c77f4d163458157a4c88d9cd9e175543a5d20140"
+SRCREV_machine:qemuriscv32 ?= "c77f4d163458157a4c88d9cd9e175543a5d20140"
+SRCREV_machine:qemux86 ?= "c77f4d163458157a4c88d9cd9e175543a5d20140"
+SRCREV_machine:qemux86-64 ?= "c77f4d163458157a4c88d9cd9e175543a5d20140"
+SRCREV_machine:qemumips64 ?= "74368748436dddfe2b5cef23fe9f4c149709cc97"
+SRCREV_machine ?= "c77f4d163458157a4c88d9cd9e175543a5d20140"
+SRCREV_meta ?= "3f0dcb29edf14029f130bc493a939b67ea27852e"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "2b2cbdcede3878c424b7937c83660ec9e9a232a2"
+SRCREV_machine:class-devupstream ?= "fcd03f7736b1fa2b2181a7306d14008aa36b66ed"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.53"
+LINUX_VERSION ?= "6.12.55"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


