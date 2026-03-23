Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D0C7F46122
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 13:51:16 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17892.1774273871306735439
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 06:51:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NopRBkBO;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-509101189f4so1361351cf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 06:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774273870; x=1774878670; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7bVLzFwGahW/OgwggVVvehR6ru6SUmTDmozEW772Xo=;
        b=NopRBkBOUWP4nWbvyeJcHZeVIxIlA2WBH6/Tb3suezlNVSANg8ImoT/tUNlyumJLBr
         d+ecUHJ7aV1GRF4THQby0BpwpM/NM5sFZDtOkd7ULkVcGYkdXhmD3jmb9VUXoIFGf2Fd
         UsmpbQ+6eK6xulfA3N6yvvWfus1sN2EKsSSP2MwzKuinJxkEDy3EEccFuyPl+ExFU2jU
         XEef6vutorUCmO58qgTc2ngenM2PKQ6xj+5sxqHlcK3NysijMdLtJ2yhCe9Sr5eh0+a1
         Qqn8AlFZH0S8BR4ozp8fBzHuXCIHRGWWhV/UCgyfM6+EJsrAwgy1vwkii4F5no9p83PU
         fq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774273870; x=1774878670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R7bVLzFwGahW/OgwggVVvehR6ru6SUmTDmozEW772Xo=;
        b=gQfyqP3e03eo5kGTdtgEkFGKzJpRP7xAMCQmHQNbTNzGlqNpZBJWJR8pHTWjFrUoOh
         vlvR8TNbblkUj9imkntPkgCLDlG+OSwM+CHOZwFyWgY4WCMkl/zSFu5/C0JLoqq9JxUM
         if9/OM/dgTApc5zPjSOmEB54uCUhAAD38AhAAsMuAFBzD/tFRQn+6ES1OGLWW0LBYV3M
         C3Fdp2jn8U6HNbxXax7NMBvGjYMZfWlhaiGhcbbW9kM5ED45+TKkfhULtvLLp9pCHSuH
         7RCr5PuwzYzJWyXKaosSqsOiUSmFZJd4ZilsLXX6QV9yhWGLJGwdcOzp+kYYSTS5nHU0
         Ye5g==
X-Gm-Message-State: AOJu0Yw9sX/8eVMv0gVyLVSMGsD0XIjrvrfdFc+e9Z+YT7Z2IsWqhGe4
	2Gds0RtejFVRnjh1YeffseFAjUOnUdgu4AcMU+G2p6fR2Sd/zGjW0PxGujOpPkeu
X-Gm-Gg: ATEYQzxC4GgNNCu/6WDuCYJuw+NmFB21VgPpeOlLXEnabtAvuxGsW3y4pI7uxlX4Y4q
	4Fmulgk8zSGTahI1OdA3x1s/xlI9ljtm9GrOQAoSKG5bl3zbrSSX79tNoKNF+3D45JgxGQ9iFx8
	ZtruSRm7F6EKdpYOXYxyH0h9VdbUH2fAq8ZbwhzI8qdu8KcKkeR74Nf+wlbiFNuITQ/iHVSCbJw
	+6R1ndfuCZoA7NbD3E/aze7t/vW7FFwmTyao4get1JUCuAChSzNinFjrOaeVdtkkgEHRXbyPEGh
	u/pdP3R929b0yyOXl6igqOQNLZBqHqM6zgqwMItnryP2Uir63xP7o27wGP0wiMYT+oNJT4Es5OZ
	+fxY9q0UNTn6SBW+Jh4UJuIvibf/OP7lLYu1VlbVM80BNn3x6Ubnjwc/6eQoc/7BrhVORs2M36Q
	9+0ar5cJtNF6arkMEFnvY42kxmXh7MoMF+Rb8MGD0zGYos57DSJm2q+Se7VLLpJwgTTBEa8cTKi
	rCs6vyEAA6wrFkTZnptNd0S5Nx9WKTfk/N9okQDIf+jT550+dt/zOrIvCo=
X-Received: by 2002:a05:622a:1e0b:b0:509:1dc8:e9e7 with SMTP id d75a77b69052e-50b37500af9mr183151711cf.51.1774273869940;
        Mon, 23 Mar 2026 06:51:09 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b664cddc3sm17232041cf.5.2026.03.23.06.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:51:08 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 08/11] linux-yocto/6.18: update to v6.18.19
Date: Mon, 23 Mar 2026 09:50:54 -0400
Message-ID: <20260323135057.1605923-9-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323135057.1605923-1-bruce.ashfield@gmail.com>
References: <20260323135057.1605923-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 13:51:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233727

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.18 to the latest korg -stable release that comprises
the following commits:

    4aea1dc4cad17 Linux 6.18.19
    224404f54036e bpf: drop kthread_exit from noreturn_deny
    9fd37b636bc2d drm/bridge: ti-sn65dsi86: Add support for DisplayPort mode with HPD
    24fda228496c6 mm/damon/core: disallow non-power of two min_region_sz
    b0d0903594dd6 io_uring/eventfd: use ctx->rings_rcu for flags checking
    7cc4530b3e952 io_uring: ensure ctx->rings is stable for task work flags manipulation
    ae3831b44f477 net/tcp-md5: Fix MAC comparison to be constant-time
    ce2a263bc57c1 lib/crypto: tests: Depend on library options rather than selecting them
    93c0a22fec914 ksmbd: Compare MACs in constant time
    4af5dfb8dca3a smb: client: Compare MACs in constant time
    97ea8f3bbdaef kbuild: Leave objtool binary around with 'make clean'
    ba3bca40f9f25 KVM: SVM: Set/clear CR8 write interception when AVIC is (de)activated
    0ff26b41c882c KVM: SVM: Add a helper to look up the max physical ID for AVIC
    ba28a0dcc41ae KVM: SVM: Limit AVIC physical max index based on configured max_vcpu_ids
    b7493f48c3dba KVM: arm64: Eagerly init vgic dist/redist on vgic creation
    2a01a93ed2266 KVM: arm64: gic: Set vgic_model before initing private IRQs
    8d02bbfb09003 mmc: dw_mmc-rockchip: Fix runtime PM support for internal phase support
    5b58ba042e237 mmc: dw_mmc-rockchip: Add memory clock auto-gating support
    4c3a860b96e72 drm/gud: fix NULL crtc dereference on display disable
    51aa99e59d7f5 drm/gud: rearrange gud_probe() to prepare for function splitting
    94b6d0ba4b640 mm: Fix a hmm_range_fault() livelock / starvation problem
    fffce2310e688 cxl/acpi: Fix CXL_ACPI and CXL_PMEM Kconfig tristate mismatch
    003df94bcc922 i3c: mipi-i3c-hci: Correct RING_CTRL_ABORT handling in DMA dequeue
    b684b420a5bb0 i3c: mipi-i3c-hci: Fix race in DMA ring dequeue
    a21d763335886 i3c: mipi-i3c-hci: Add missing TID field to no-op command descriptor
    57f99dc660e69 i3c: mipi-i3c-hci: Restart DMA ring correctly after dequeue abort
    d986d51a83f5c i3c: mipi-i3c-hci: Consolidate spinlocks
    74a4f77bbf786 i3c: mipi-i3c-hci: Factor out DMA mapping from queuing path
    478a99a961829 i3c: mipi-i3c-hci: Use ETIMEDOUT instead of ETIME for timeout errors
    ad9da7d39cecd iio: proximity: hx9023s: Protect against division by zero in set_samp_freq
    05723a2c4b09d iio: proximity: hx9023s: fix assignment order for __counted_by
    70b455484a661 iio: imu: inv_icm42600: fix odr switch when turning buffer off
    b5a6825579a7c iio: imu: inv_icm42600: fix odr switch to the same value
    aae572ddc2857 iio: light: bh1780: fix PM runtime leak on error path
    a8714d2d0df4e iio: gyro: mpu3050-i2c: fix pm_runtime error handling
    ba19dd366528b iio: imu: adis: Fix NULL pointer dereference in adis_init
    42685cf96e282 iio: gyro: mpu3050-core: fix pm_runtime error handling
    c7ae426705b01 iio: buffer: Fix wait_queue not being removed
    c528dc22d58b7 iio: chemical: bme680: Fix measurement wait duration calculation
    7c5edf1025ddb iio: potentiometer: mcp4131: fix double application of wiper shift
    b8a26d21c7dba iio: magnetometer: tlv493d: remove erroneous shift in X-axis data
    90e978ace5985 iio: chemical: sps30_i2c: fix buffer size in sps30_i2c_read_meas()
    eddba110685f8 iio: chemical: sps30_serial: fix buffer size in sps30_serial_read_meas()
    73dd9acb5b20b iio: frequency: adf4377: Fix duplicated soft reset mask
    1b2d9e23452bd iio: dac: ds4424: reject -128 RAW value
    014a021075c58 btrfs: abort transaction on failure to update root in the received subvol ioctl
    5e1ab71f74a1e btrfs: add missing RCU unlock in error path in try_release_subpage_extent_buffer()
    d11aefe654a04 btrfs: fix transaction abort on set received ioctl due to item overflow
    9273175bf16c8 btrfs: fix transaction abort on file creation due to name hash collision
    bac55dde8efa4 btrfs: fix transaction abort when snapshotting received subvolumes
    9b753ece26524 smb: client: fix iface port assignment in parse_server_interfaces
    92e64f1852f45 smb: client: fix in-place encryption corruption in SMB2_write()
    9509b659ca7eb smb: client: fix atomic open with O_DIRECT & O_SYNC
    bfbf1f286f682 lib/bootconfig: check bounds before writing in __xbc_open_brace()
    6e736a18cfbd5 lib/bootconfig: fix snprintf truncation check in xbc_node_compose_key_after()
    12d2b443b8606 kprobes: Remove unneeded warnings from __arm_kprobe_ftrace()
    11712c4eb3840 x86/apic: Disable x2apic on resume if the kernel expects so
    9f9157ee67b32 scsi: core: Fix error handling for scsi_alloc_sdev()
    d24330cf241f8 lib/bootconfig: fix off-by-one in xbc_verify_tree() unclosed brace error
    d2beb819045e4 powerpc64/bpf: fix the address returned by bpf_get_func_ip
    2ce9b27946125 powerpc64/bpf: fix kfunc call support
    4b89984f72742 powerpc/pseries: Correct MSI allocation tracking
    f7eda676386c5 s390/dasd: Copy detected format information to secondary device
    fe9cd8c8ee359 s390/dasd: Move quiesce state with pprc swap
    950a76e82e05a s390/zcrypt: Enable AUTOSEL_DOM for CCA serialnr sysfs attribute
    997967adf10ce sched_ext: Fix enqueue_task_scx() truncation of upper enqueue flags
    a35be7a17c7b1 xfs: ensure dquot item is deleted from AIL only after log shutdown
    446a1f5bb64ba xfs: fix undersized l_iclog_roundoff values
    ca504d2601b3b xfs: fix returned valued from xfs_defer_can_append
    2b4492d9ed0f2 xfs: fix integer overflow in bmap intent sort comparator
    316cc7b63fd58 cifs: make default value of retrans as zero
    50ad880db3013 io_uring/kbuf: check if target buffer list is still legacy on recycle
    950bda065b05e qmi_wwan: allow max_mtu above hard_mtu to control rx_urb_size
    8738dcc844fff net-shapers: don't free reply skb after genlmsg_reply()
    eb613e3d38abb tracing: Fix trace_buf_size= cmdline parameter with sizes >= 2G
    18bef795332b0 tracing: Fix enabling multiple events on the kernel command line and bootconfig
    9ecea60f132da drm/msm/dpu: Correct the SA8775P intr_underrun/intr_underrun index
    38f1640db7f8b drm/amd: Fix a few more NULL pointer dereference in device cleanup
    a751a1230533f drm/msm: Fix dma_free_attrs() buffer size
    0189bf176dbe6 drm/i915/psr: Repeat Selective Update area alignment
    eae4bf4107571 drm/i915: Fix potential overflow of shmem scatterlist length
    46275c56e7475 drm/bridge: ti-sn65dsi83: halve horizontal syncs for dual LVDS output
    818ebb298a753 drm/bridge: ti-sn65dsi83: fix CHA_DSI_CLK_RANGE rounding
    43025c941aced drm/amd: Fix NULL pointer dereference in device cleanup
    57579312e0e87 drm/amd: Set num IP blocks to 0 if discovery fails
    7885eb335d8f9 drm/amdgpu: Fix use-after-free race in VM acquire
    33c3a4db31719 drm/amd/pm: remove invalid gpu_metrics.energy_accumulator on smu v13.0.x
    6c58a9fdb0d0e net: dsa: microchip: Fix error path in PTP IRQ setup
    8efd5dcd31e22 net: ethernet: arc: emac: quiesce interrupts before requesting IRQ
    b70c4e5e71193 net: ncsi: fix skb leak in error paths
    ab5ebab966421 net: nexthop: fix percpu use-after-free in remove_nh_grp_entry
    3224990fb16a8 net: mctp: fix device leak on probe failure
    1d6abf145615d ksmbd: fix use-after-free by using call_rcu() for oplock_info
    8f5b1a7cb009a smb: server: fix use-after-free in smb2_open()
    dbbd328cf5826 ksmbd: fix use-after-free in smb_lazy_parent_lease_break_close()
    146691daf293c memcg: fix slab accounting in refill_obj_stock() trylock path
    159aebd20e0e9 slab: distinguish lock and trylock for sheaf_flush_main()
    8938a9c60d9ae s390/xor: Fix xor_xc_5() inline assembly
    1a34999922ba6 drm/amd/display: Fallback to boot snapshot for dispclk
    b9a944d0a1d3a s390/xor: Fix xor_xc_2() inline assembly constraints
    87f0349beaaca ata: libata-core: Disable LPM on ST1000DM010-2EP102
    a547ffcb9b1d5 s390/stackleak: Fix __stackleak_poison() inline assembly constraint
    d0e63feca3808 crypto: ccp - allow callers to use HV-Fixed page API when SEV is disabled
    a4d0e2c416db0 pmdomain: bcm: bcm2835-power: Fix broken reset status read
    f29b08755103f regulator: pf9453: Respect IRQ trigger settings from firmware
    4387b2cc9a630 io_uring/net: reject SEND_VECTORIZED when unsupported
    823fb431e4af8 parisc: Check kernel mapping earlier at bootup
    6f92a7a8b48a5 arm64: contpte: fix set_access_flags() no-op check for SMMU/ATS faults
    396dec23e9024 parisc: Fix initial page table creation for boot
    857473efe9341 io_uring/zcrx: use READ_ONCE with user shared RQEs
    73a7a34581694 hwmon: (pmbus/q54sj108a2) fix stack overflow in debugfs read
    439b5fb7280a3 arm64: mm: Add PTE_DIRTY back to PAGE_KERNEL* to fix kexec/hibernation
    ad8fa5bff53f5 nouveau/dpcd: return EBUSY for aux xfer if the device is asleep
    6e6e28898e015 parisc: Increase initial mapping to 64 MB with KALLSYMS
    5737b279a28b6 pmdomain: rockchip: Fix PD_VCODEC for RK3588
    e9b0a6ffe8b95 drm/xe/xe2_hpg: Correct implementation of Wa_16025250150
    2ab9f2531d377 batman-adv: Avoid double-rtnl_lock ELP metric worker
    a269cbdc442f8 net/tcp-ao: Fix MAC comparison to be constant-time
    12db29803c19e tracing: Fix syscall events activation by ensuring refcount hits zero
    f6e7c4f406b68 ice: fix retry for AQ command 0x06EE
    678d5802556b3 net: mana: Ring doorbell at 4 CQ wraparounds
    8bde543d2a5f9 media: dvb-net: fix OOB access in ULE extension header tables
    9e16152a7e337 selftests: fix mntns iteration selftests
    ace46763b282d pinctrl: cy8c95x0: Don't miss reading the last bank registers
    4dd2d9cf563c5 staging: rtl8723bs: fix potential out-of-bounds read in rtw_restruct_wmm_ie
    6d62fa548387e staging: rtl8723bs: properly validate the data in rtw_get_ie_ex()
    ea535b9894d77 staging: sm750fb: add missing pci_release_region on error and removal
    6b9cb42cfdb36 mm/slab: fix an incorrect check in obj_exts_alloc_size()
    ce0aa47c963b8 mm/damon/core: clear walk_control on inactive context in damos_walk()
    7c19757394ddf ixgbevf: fix link setup issue
    216176bcfd2bd kunit: irq: Ensure timer doesn't fire too frequently
    decd9942655db ice: reintroduce retry mechanism for indirect AQ
    ca19f8f51064f iomap: reject delalloc mappings during writeback
    7bdf00ed75c47 btrfs: fix chunk map leak in btrfs_map_block() after btrfs_chunk_map_num_copies()
    f42b4afdd1f89 irqchip/gic-v3-its: Limit number of per-device MSIs to the range the ITS supports
    32752c3e81498 device property: Allow secondary lookup in fwnode_get_next_child_node()
    019debe5851d7 nfsd: Fix cred ref leak in nfsd_nl_listener_set_doit().
    db377ed4ecca4 arm64: gcs: Honour mprotect(PROT_NONE) on shadow stack mappings
    584926c26f0b7 bpf: Fix kprobe_multi cookies access in show_fdinfo callback
    415aed08de0ee s390/pfault: Fix virtual vs physical address confusion
    af65cd1853599 drm/xe/sync: Cleanup partially initialized sync on parse failure
    58e6e3d39c286 ipmi:si: Fix check for a misbehaving BMC
    19e1931841e44 gpiolib: normalize the return value of gc->get() on behalf of buggy drivers
    32cca65189823 drm/i915/alpm: ALPM disable fixes
    214b6bde0e941 nouveau/gsp: drop WARN_ON in ACPI probes
    9b7855110fd75 ipmi:si: Handle waiting messages when BMC failure detected
    bc001cd1a4824 drm/bridge: ti-sn65dsi86: Enable HPD polling if IRQ is not used
    e6d779654cda6 drm/bridge: samsung-dsim: Fix memory leak in error path
    1df500f363bc8 ipmi:si: Use a long timeout when the BMC is misbehaving
    68d7fcb6a451c ipmi:si: Don't block module unload if the BMC is messed up
    06ef2ba582c68 drm/amd: Disable MES LR compute W/A
    b1d10508da559 drm/amdgpu: add upper bound check on user inputs in wait ioctl
    762f47e2b8243 drm/amdgpu/userq: Fix reference leak in amdgpu_userq_wait_ioctl
    6fff5204d8aa2 drm/amdgpu: add upper bound check on user inputs in signal ioctl
    6bfda7ce56e7d cpufreq: intel_pstate: Fix NULL pointer dereference in update_cpu_qos_request()
    4729c7b00a347 kthread: consolidate kthread exit paths to prevent use-after-free
    8a259a5c70ddc Revert "ptdesc: remove references to folios from __pagetable_ctor() and pagetable_dtor()"
    ae931283b2f37 Revert "tcpm: allow looking for role_sw device in the main node"
    21a13db8d449b scsi: hisi_sas: Fix NULL pointer exception during user_scan()
    b17211b512cbf scsi: ufs: core: Fix SError in ufshcd_rtc_work() during UFS suspend
    98074e16742ae powerpc, perf: Check that current->mm is alive before getting user callchain
    9e84113ea6ec2 i3c: dw-i3c-master: Set SIR_REJECT in DAT on device attach and reattach
    2d845604ca4fb time/jiffies: Mark jiffies_64_to_clock_t() notrace
    2e8e9aea8cd5a ALSA: usb-audio: Improve Focusrite sample rate filtering
    097cd68f46686 ceph: fix memory leaks in ceph_mdsc_build_path()
    7335e21830b8d ceph: do not skip the first folio of the next object in writeback
    7db008e85a5d1 ceph: fix i_nlink underrun during async unlink
    bdf614c81081b libceph: admit message frames only in CEPH_CON_S_OPEN state
    ba0a4df8c5635 libceph: Use u32 for non-negative values in ceph_monmap_decode()
    69fe5af33fa38 libceph: prevent potential out-of-bounds reads in process_message_header()
    fc4d944dbaee9 libceph: reject preamble if control segment is empty
    f9da5c1bbac5c libceph: Fix potential out-of-bounds access in ceph_handle_auth_reply()
    8be8911f59081 ceph: add a bunch of missing ceph_path_info initializers
    cae928e3178c7 kprobes: avoid crash when rmmod/insmod after ftrace killed
    2754e7b3d6474 tipc: fix divide-by-zero in tipc_sk_filter_connect()
    22b05abb17e3c ASoC: qcom: qdsp6: Fix q6apm remove ordering during ADSP stop and start
    0e06cc511c61c mmc: core: Avoid bitfield RMW for claim/retune flags
    45785772d538b mm/kfence: disable KFENCE upon KASAN HW tags enablement
    24743b77cae33 mmc: mmci: Fix device_node reference leak in of_get_dml_pipe_index()
    63826cf084468 mm/kfence: fix KASAN hardware tag faults during late enablement
    6dc0919dc7820 mm/tracing: rss_stat: ensure curr is false from kthread context
    e584cb58a2ea7 usb: gadget: f_ncm: Fix net_device lifecycle with device_move
    ef7d456d1e887 Revert "usb: gadget: u_ether: add gether_opts for config caching"
    05dc0c098ca11 Revert "usb: gadget: f_ncm: align net_device lifecycle with bind/unbind"
    d2a08ea03830b Revert "usb: gadget: u_ether: Add auto-cleanup helper for freeing net_device"
    56cb551d2a33d Revert "usb: legacy: ncm: Fix NPE in gncm_bind"
    8a607bae3a0a4 Revert "usb: gadget: f_ncm: Fix atomic context locking issue"
    be5738d19bed2 usb: legacy: ncm: Fix NPE in gncm_bind
    e533a44fb1b33 usb: gadget: f_ncm: Fix atomic context locking issue
    679d9535aeb15 usb: gadget: f_tcm: Fix NULL pointer dereferences in nexus handling
    b7fed917f84e4 usb: image: mdc800: kill download URB on timeout
    513041c71356d usb: gadget: uvc: fix interval_duration calculation
    4cc30a5fc8832 usb: mdc800: handle signal and read racing
    c0b28a042174c usb: gadget: f_hid: fix SuperSpeed descriptors
    0b7d11fd6e742 usb: renesas_usbhs: fix use-after-free in ISR during device removal
    67ed312124bb1 usb: class: cdc-wdm: fix reordering issue in read code path
    64f3d75633aed USB: core: Limit the length of unkillable synchronous timeouts
    6cb7dc91f057d USB: usbtmc: Use usb_bulk_msg_killable() with user-specified timeouts
    f7e115af48745 USB: usbcore: Introduce usb_bulk_msg_killable()
    ac207d57bbb06 usb: typec: altmode/displayport: set displayport signaling rate in configure message
    8c9521a5877e5 usb: roles: get usb role switch from parent only for usb-b-connector
    9459b5731cd8b usb: cdc-acm: Restore CAP_BRK functionnality to CH343
    82f7b4350b9d9 usb: core: don't power off roothub PHYs if phy_set_mode() fails
    1a99da68a5a9c usb: misc: uss720: properly clean up reference in uss720_probe()
    69f090f5e7298 usb: dwc3: pci: add support for the Intel Nova Lake -H
    a41d3d9202e95 usb: yurex: fix race in probe
    cd41e0d1df8fc usb: xhci: Prevent interrupt storm on host controller error (HCE)
    c65f1b840ab8c usb: xhci: Fix memory leak in xhci_disable_slot()
    8043f1c3c89dd USB: ezcap401 needs USB_QUIRK_NO_BOS to function on 10gbs usb speed
    ba3b951b7f7ae usb/core/quirks: Add Huawei ME906S-device to wakeup quirk
    e2554ffa8c252 USB: add QUIRK_NO_BOS for video capture several devices
    213e82ccdea58 KVM: arm64: pkvm: Fallback to level-3 mapping on host stage-2 fault
    c513bbd7da534 KVM: SVM: Initialize AVIC VMCB fields if AVIC is enabled with in-kernel APIC
    b058c30cdf7d5 KVM: x86: Introduce KVM_X86_QUIRK_VMCS12_ALLOW_FREEZE_IN_SMM
    686c8f16112c8 KVM: arm64: Fix protected mode handling of pages larger than 4kB
    e0f582406c3e4 ASoC: amd: yc: Add DMI quirk for ASUS EXPERTBOOK PM1503CDA
    08da6c7ed70f0 ata: libata-core: Add BRIDGE_OK quirk for QEMU drives
    f90768ed813bf rust: str: make NullTerminatedFormatter public
    887098159d705 rust: kbuild: allow `unused_features`
    dd109e3442817 rust_binder: call set_notification_done() without proc lock
    e19afb53f7723 rust_binder: avoid reading the written value in offsets array
    20a01f20d1f40 rust_binder: check ownership before using vma
    edf685946c4ac rust_binder: fix oneway spam detection
    3e89ddbaaea2f net: usb: lan78xx: skip LTM configuration for LAN7850
    20ce2bd1c1848 net: usb: lan78xx: fix WARN in __netif_napi_del_locked on disconnect
    f62ec1babb2ae net: usb: lan78xx: fix TX byte statistics for small packets
    fa41007be691b net: usb: lan78xx: fix silent drop of packets with checksum errors
    00293f362712b can: gs_usb: gs_can_open(): always configure bitrates before starting device
    3d542cf3c4c85 ALSA: usb-audio: Check endpoint numbers at parsing Scarlett2 mixer interfaces
    4a758e9a1f5ed ALSA: pcm: fix use-after-free on linked stream runtime in snd_pcm_drain()
    6eaaa67d6998f sched_ext: Remove redundant css_put() in scx_cgroup_init()
    86ceaccfdfa16 cgroup: fix race between task migration and iteration
    1051eb2f53886 drm/amdgpu: ensure no_hw_access is visible before MMIO
    3428dc5520c81 usb: gadget: f_mass_storage: Fix potential integer overflow in check_command_size_in_blocks()
    678f1212f77bf iio: imu: inv-mpu9150: fix irq ack preventing irq storms
    86f00a9e50b4a net: prevent NULL deref in ip[6]tunnel_xmit()
    7065d73a78ba7 octeontx2-af: devlink: fix NIX RAS reporter to use RAS interrupt status
    c9d6bf8d139a9 octeontx2-af: devlink: fix NIX RAS reporter recovery condition
    8ded073fc8cdc net: ethernet: ti: am65-cpsw-nuss: Fix rx_filter value for PTP support
    c1d06ccbee468 net: ti: am65-cpsw: move hw timestamping to ndo callback
    59489ce60d741 net/mana: Null service_wq on setup error to prevent double destroy
    103e4fedb4784 neighbour: restore protocol != 0 check in pneigh update
    f7f12d551d611 net: dsa: realtek: Fix LED group port bit for non-zero LED group
    95faa1459b83f net: bonding: Fix nd_tbl NULL dereference when IPv6 is disabled
    84c1adb60fdba perf synthetic-events: Fix stale build ID in module MMAP2 records
    529c985da1b27 drm/amdkfd: Unreserve bo if queue update failed
    b3b56d60fee16 ASoC: detect empty DMI strings
    790851ecc983c ASoC: amd: acp3x-rt5682-max9836: Add missing error check for clock acquisition
    9a3106a81fc3c ACPI: OSL: fix __iomem type on return from acpi_os_map_generic_address()
    e987bc1d2e8d4 net: bcmgenet: fix broken EEE by converting to phylib-managed state
    53480725b1395 page_pool: store detach_time as ktime_t to avoid false-negatives
    30e87ade8d678 e1000/e1000e: Fix leak in DMA error cleanup
    981e2805e48fc i40e: fix src IP mask checks and memcpy argument names in cloud filter
    75e0a631c3a13 iavf: fix incorrect reset handling in callbacks
    1b034f2429ce6 iavf: fix PTP use-after-free during reset
    98b36857f3584 drivers: net: ice: fix devlink parameters get without irdma
    b56c49897bdac nvme-pci: Fix race bug in nvme_poll_irqdisable()
    328c551f0cc81 nvme-pci: Fix slab-out-of-bounds in nvme_dbbuf_set
    3cf2d7ca48289 sched: idle: Make skipping governor callbacks more consistent
    a422159d766ad perf ftrace: Fix hashmap__new() error checking
    f7e52a24e5b76 regulator: pca9450: Correct probed name for PCA9452
    55ca06f54f57f regulator: pca9450: Add support for setting debounce settings
    ec1427731244d regulator: pca9450: Correct interrupt type
    0b6803777c003 perf annotate: Fix hashmap__new() error checking
    f5ef97c131655 netfilter: xt_IDLETIMER: reject rev0 reuse of ALARM timer labels
    05018cd9370f7 netfilter: nfnetlink_cthelper: fix OOB read in nfnl_cthelper_dump_table()
    9853d94b82d30 netfilter: nfnetlink_queue: fix entry leak in bridge verdict error path
    bc18551c6169e netfilter: x_tables: guard option walkers against 1-byte tail reads
    e047f6fbb975f netfilter: nft_set_pipapo: fix stack out-of-bounds read in pipapo_drop()
    de47a88c6b807 netfilter: nf_tables: always walk all pending catchall elements
    6d2a95c689057 netfilter: nf_tables: Fix for duplicate device in netdev hooks
    8a57deeb25606 net: add xmit recursion limit to tunnel xmit functions
    f0679522f8ded amd-xgbe: prevent CRC errors during RX adaptation with AN disabled
    cf51e5853398e amd-xgbe: fix link status handling in xgbe_rx_adaptation
    925a5ffd99cdd mctp: route: hold key->lock in mctp_flow_prepare_output()
    6ac890f1d60ac bonding: fix type confusion in bond_setup_by_slave()
    474211fb4a1df bonding: use common function to compute the features
    3c5de399a4427 can: hi311x: hi3110_open(): add check for hi3110_power_enable() return value
    1ec54187e1aa4 mctp: i2c: fix skb memory leak in receive path
    569e6e72c4578 bnxt_en: Fix RSS table size check when changing ethtool channels
    35b58d3bc716e serial: caif: hold tty->link reference in ldisc_open and ser_release
    ecb4ed7a723f0 net: sfp: improve Huawei MA5671a fixup
    ce0b8fd5e3554 ASoC: simple-card-utils: fix graph_util_is_ports0() for DT overlays
    7d33e61409454 ASoC: soc-core: flush delayed work before removing DAIs and widgets
    a4aa08c820f4f ASoC: soc-core: drop delayed_work_pending() check before flush
    b6051f2bdd4bd spi: rockchip-sfc: Fix double-free in remove() callback
    0a83d6c9e149a spi: amlogic: spifc-a4: Fix DMA mapping error handling
    fc7735caf016a drm/sitronix/st7586: fix bad pixel data due to byte swap
    c34ebd7b24ea7 net: spacemit: Fix error handling in emac_tx_mem_map()
    045545790fea7 net: spacemit: Fix error handling in emac_alloc_rx_desc_buffers()
    d55fa7cd4b19b rxrpc, afs: Fix missing error pointer check after rxrpc_kernel_lookup_peer()
    0bad9c86edd22 net/sched: teql: fix NULL pointer dereference in iptunnel_xmit on TEQL slave xmit
    c74557495efb4 net/mlx5e: RX, Fix XDP multi-buf frag counting for legacy RQ
    7d7342a18fadc net/mlx5e: RX, Fix XDP multi-buf frag counting for striding RQ
    ce1b19dd0684e net/mlx5e: Fix DMA FIFO desync on error CQE SQ recovery
    cbd8494fdd6cc net/mlx5: Fix peer miss rules host disabled checks
    835778685f157 net/mlx5: Fix crash when moving to switchdev mode
    4a7838bebc383 net/mlx5: Fix deadlock between devlink lock and esw->wq
    6aaf15f376b0e bonding: handle BOND_LINK_FAIL, BOND_LINK_BACK as valid link states
    ab1bcadc7e517 bonding: do not set usable_slaves for broadcast mode
    2ee3645e0f3f4 drm/amd/pm: add missing od setting PP_OD_FEATURE_ZERO_FAN_BIT for smu v14
    4c32155265b67 drm/amd/pm: add missing od setting PP_OD_FEATURE_ZERO_FAN_BIT for smu v13
    6b4a1ff808851 drm/msm/dsi: fix pclk rate calculation for bonded dsi
    5f5d956b2ce00 net: dsa: realtek: rtl8365mb: remove ifOutDiscards from rx_packets
    98754dda67296 dt-bindings: display/msm: qcom,sm8750-mdss: Fix model typo
    676826aeddb57 perf disasm: Fix off-by-one bug in outside check
    ce69c1b753746 workqueue: Use POOL_BH instead of WQ_BH when checking pool flags
    a39b75c3f4226 btrfs: hold space_info->lock when clearing periodic reclaim ready
    8127b5fec0475 xprtrdma: Decrement re_receiving on the early exit paths
    2871bb923ff8f drm/msm/dsi: fix hdisplay calculation when programming dsi registers
    203c792cb4315 nfs: return EISDIR on nfs3_proc_create if d_alias is a dir
    28a72f653832a smb/server: Fix another refcount leak in smb2_open()
    f426a493db33d powerpc: 83xx: km83xx: Fix keymile vendor prefix
    ba021fb575084 remoteproc: mediatek: Unprepare SCP clock during system suspend
    bf39fed5f22cb remoteproc: sysmon: Correct subsys_name_len type in QMI request
    b7b634be76582 powerpc/crash: adjust the elfcorehdr size
    c171a5f799546 powerpc/kexec/core: use big-endian types for crash variables
    d5697cf3b91d8 kexec: Include kernel-end even without crashkernel
    b3c074a394c66 powerpc/uaccess: Fix inline assembly for clang build on PPC32
    71c57e74baa06 ALSA: usb-audio: Check max frame size for implicit feedback mode, too
    31e6595fd1a05 drm/amdgpu/vcn5: Add SMU dpm interface type
    716fc40446912 ALSA: usb-audio: Avoid implicit feedback mode on DIYINHK USB Audio 2.0
    5faf0ce7d784a scsi: ufs: core: Fix shift out of bounds when MAXQ=32
    f4f590c6c9df7 scsi: ufs: core: Fix possible NULL pointer dereference in ufshcd_add_command_trace()
    87aa0f91ee49e ASoC: cs42l43: Report insert for exotic peripherals
    c072370ad67dd ASoC: amd: yc: Add ASUS EXPERTBOOK BM1503CDA to quirk table
    7035ef0f20bab scsi: ses: Fix devices attaching to different hosts
    8c61a746f7bb8 ACPI: OSI: Add DMI quirk for Acer Aspire One D255
    e03d7bddf0ecc wifi: mac80211: set default WMM parameters on all links
    af8f4be3b68ac unshare: fix unshare_fs() handling
    6407e8baef0ac ALSA: hda/realtek: Fix speaker pop on Star Labs StarFighter
    e978a36f332ed scsi: mpi3mr: Add NULL checks when resetting request and reply queues
    379e19e820dd1 fs: init flags_valid before calling vfs_fileattr_get
    22e54d67b2f57 scsi: ufs: core: Reset urgent_bkops_lvl to allow runtime PM power mode
    55d1e86cb0c90 ACPI: PM: Save NVS memory on Lenovo G70-35
    c2e73d8acd056 scsi: storvsc: Fix scheduling while atomic on PREEMPT_RT

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.18.bb              |  6 ++---
 .../linux/linux-yocto-tiny_6.18.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index fe8ae4c835..39f466d64a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -15,13 +15,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "d6ecc487b3c4ee6516274ed00ab74cae159e6010"
-SRCREV_meta ?= "1ee48237bcd76936b5fb21bcd3b9202faa25e18b"
+SRCREV_machine ?= "64a2ea6184db4c022bec6090982b4b617a6c844b"
+SRCREV_meta ?= "899d5e6d3dd929b52ec2acc5b81e317444279f19"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.18.18"
+LINUX_VERSION ?= "6.18.19"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index 3867c91693..7f3d3bc649 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.18.inc
 
-LINUX_VERSION ?= "6.18.18"
+LINUX_VERSION ?= "6.18.19"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "d8bda5bce522d27c0e71c9190ca1d6fe4ce8c580"
-SRCREV_meta ?= "1ee48237bcd76936b5fb21bcd3b9202faa25e18b"
+SRCREV_machine ?= "1fa8fa91abea837d76ab91c972e8387aae78157e"
+SRCREV_meta ?= "899d5e6d3dd929b52ec2acc5b81e317444279f19"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 8adc49acca..1490feb10a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "4161affdabd6a1ac22fe9e8591b8c51e7765b675"
-SRCREV_machine:qemuarm64 ?= "d8bda5bce522d27c0e71c9190ca1d6fe4ce8c580"
-SRCREV_machine:qemuloongarch64 ?= "d8bda5bce522d27c0e71c9190ca1d6fe4ce8c580"
+SRCREV_machine:qemuarm ?= "f1b3530df0e8d9a33dd71b5035af018bf0596618"
+SRCREV_machine:qemuarm64 ?= "1fa8fa91abea837d76ab91c972e8387aae78157e"
+SRCREV_machine:qemuloongarch64 ?= "1fa8fa91abea837d76ab91c972e8387aae78157e"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "d8bda5bce522d27c0e71c9190ca1d6fe4ce8c580"
-SRCREV_machine:qemuriscv64 ?= "d8bda5bce522d27c0e71c9190ca1d6fe4ce8c580"
-SRCREV_machine:qemuriscv32 ?= "d8bda5bce522d27c0e71c9190ca1d6fe4ce8c580"
-SRCREV_machine:qemux86 ?= "d8bda5bce522d27c0e71c9190ca1d6fe4ce8c580"
-SRCREV_machine:qemux86-64 ?= "d8bda5bce522d27c0e71c9190ca1d6fe4ce8c580"
+SRCREV_machine:qemuppc ?= "1fa8fa91abea837d76ab91c972e8387aae78157e"
+SRCREV_machine:qemuriscv64 ?= "1fa8fa91abea837d76ab91c972e8387aae78157e"
+SRCREV_machine:qemuriscv32 ?= "1fa8fa91abea837d76ab91c972e8387aae78157e"
+SRCREV_machine:qemux86 ?= "1fa8fa91abea837d76ab91c972e8387aae78157e"
+SRCREV_machine:qemux86-64 ?= "1fa8fa91abea837d76ab91c972e8387aae78157e"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "d8bda5bce522d27c0e71c9190ca1d6fe4ce8c580"
-SRCREV_meta ?= "1ee48237bcd76936b5fb21bcd3b9202faa25e18b"
+SRCREV_machine ?= "1fa8fa91abea837d76ab91c972e8387aae78157e"
+SRCREV_meta ?= "899d5e6d3dd929b52ec2acc5b81e317444279f19"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "3318f10fa28986dc5767444de585e00369c4ace3"
+SRCREV_machine:class-devupstream ?= "4aea1dc4cad17cd146072e13b1fd404f32b8b3ef"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.18/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.18.18"
+LINUX_VERSION ?= "6.18.19"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


