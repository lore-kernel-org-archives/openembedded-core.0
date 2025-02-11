Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6991C0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 20:09:47 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.3292.1739304578719202607
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 12:09:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VWm22S1Y;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21f4a4fbb35so1983405ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 12:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739304578; x=1739909378; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJnQlRh/S8ZivhVsfNYC84ocwDIUgAdRR5MLmCFC/So=;
        b=VWm22S1YBUbCKmhuEFVWoZ9b2Vlp3hgW2NVx+1S4riELPn6dD4flMyQRCOqsjWg/Yr
         vSLMcJBQhKdiYjYt6IsOAk7YAc34sMGbT67MHLj8uIkl26Sy2eKjG0rppzUJr9gtXQ4+
         o1j8wRTzVjdS/W2hFvjGZVIzD3aLrjO2PGq9w40rcQAJGY8LK13M7D9QoEHVQMGt167k
         SlPZMNQSgHU63M6Rg4U4YipecPM7yufyA47aZJkY8tFeKbk9sI6L/VQlOFHnR3ljNw0K
         4tH/+luTQ272JVqf5pKwfw0hKCEZHb16wv2QjT0R0yEfTOC159BPAzOYbX+LQNGYZ2dT
         08MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739304578; x=1739909378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LJnQlRh/S8ZivhVsfNYC84ocwDIUgAdRR5MLmCFC/So=;
        b=mqmhFO/58lvqqzH1zSyTW2z40W3WNw9tuiu+ML7a4AtPPlZYfDOUoj80VwYkuKjyYD
         eoN4kmnKIhjh06PPlDXAFFTc4wgHxfa593dpDHP+vAkqqzYna+jLj72qXfC1rAm3/4P3
         yEmMDm8lGcVtXicYw210we4+1zF5+VnfJszpDlRaRTtlg+vEWzjmnLsbfn3nrr8zEaGV
         iyflqJFZbDmXQpOvdOP9swSmdHX2gYNooZp0HomVKsGi3gcCCiKMJO+LrJZnMJuDNXd4
         N6VWMBTvAvUB/uAD3j4ToaWkWtCHcGQDgdcK/v1jJ5tfof9l9TKKQJReIqJCTTKOU1lQ
         a94w==
X-Gm-Message-State: AOJu0YyV+DV+iVwp5XTu37DrY3cMZCVCmMd+8iNQvTz3wok5PaDgnTJw
	lj07I7J+53kJIQvaQ3U5GinPfwrWyeEz7Rzbnj/J+NsU8obGhpSrYPxBOa0gY2EG0jrz2PQjhXp
	M
X-Gm-Gg: ASbGncu2j1bXJn9wpb7qpNMZpcr5fKx+4PTbodtTKOnmDJEDcP93JxcSJPqz/NEBSwH
	5zNk/SybhUUlCgbUyKo8G85kfUkJs84q1SIsxsQY3wCO+KTc3XsrV2vAOeZIa7xpCW4NknGlr4z
	oiaKp1bIuKcodza7F0fL/AHS+keeZJil0VdaZiOhqdAmDDG+VvmQUELBAiS6zC18VN/2w6dMdnF
	Ha1Y9+dilPSPUheLf2bwfXQ4aGiyBVLj0y64XgqbGPqcI+6+cKFAj2kPjayb1/XgHWiFQbA8WGk
	1hOW
X-Google-Smtp-Source: AGHT+IFziqXvKmzNyfdxKpeEIc7JKexek+/uS5djd00+CGITJiYMjxtBg7vqJmuRaYPYBjZWmMfCUA==
X-Received: by 2002:a17:903:41c5:b0:21f:40de:ae4e with SMTP id d9443c01a7336-220bc1e4a6fmr5212255ad.9.1739304577132;
        Tue, 11 Feb 2025 12:09:37 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687e696sm100486485ad.209.2025.02.11.12.09.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 12:09:36 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/14] linux-yocto/6.6: update to v6.6.75
Date: Tue, 11 Feb 2025 12:09:09 -0800
Message-ID: <989dc0cea1de8c971fb68494b647c6c194feaed2.1739304425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739304425.git.steve@sakoman.com>
References: <cover.1739304425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 20:09:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211179

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    d51b7d37f14e Linux 6.6.75
    431fb709db43 drm/v3d: Assign job pointer to NULL before signaling the fence
    35b144b393db Input: xpad - add support for wooting two he (arm)
    7c477b26d39e Input: xpad - add support for Nacon Evol-X Xbox One Controller
    c009f1865582 Input: xpad - improve name of 8BitDo controller 2dc8:3106
    723aa536831c Input: xpad - add QH Electronics VID/PID
    7ea7e327a199 Input: xpad - add unofficial Xbox 360 wireless receiver clone
    dc8c9c171ef3 Input: atkbd - map F23 key to support default copilot shortcut
    80327feb234c Input: xpad - add support for Nacon Pro Compact
    cca07b29f7af ALSA: usb-audio: Add delay quirk for USB Audio Device
    3d8f4dc8c78f Revert "usb: gadget: u_serial: Disable ep before setting port to null to fix the crash caused by port being null"
    6377838560c0 USB: serial: quatech2: fix null-ptr-deref in qt2_process_read_urb()
    088bde862f8d scsi: storvsc: Ratelimit warning logs to prevent VM denial of service
    e0500e4373cd ipv4: ip_tunnel: Fix suspicious RCU usage warning in ip_tunnel_find()
    6e35f560daeb ext4: fix access to uninitialised lock in fc replay path
    c981c32c38af vfio/platform: check the bounds of read/write syscalls
    7d6405c13b0d cachestat: fix page cache statistics permission checking
    854d0d361e45 Revert "HID: multitouch: Add support for lenovo Y9000P Touchpad"
    a99bacb35c14 block: fix integer overflow in BLKSECDISCARD
    f4168299e553 net: sched: fix ets qdisc OOB Indexing
    5ddcc9e92d54 smb: client: handle lack of EA support in smb2_query_path_info()
    850e696f3627 libfs: Use d_children list to iterate simple_offset directories
    0f03dd06e5d1 libfs: Replace simple_offset end-of-directory detection
    6b1de53b1a0a Revert "libfs: Add simple_offset_empty()"
    a01bb1c5cac9 libfs: Return ENOSPC when the directory offset range is exhausted
    2b6da3fa94cd shmem: Fix shmem_rename2()
    753828d6775e libfs: Add simple_offset_rename() API
    3e716f31ff8b libfs: Fix simple_offset_rename_exchange()
    307f68e49dda libfs: Add simple_offset_empty()
    fc90bbcc08da libfs: Define a minimum directory offset
    3bd97ebf7e4f libfs: Re-arrange locking in offset_iterate_dir()
    4dd57d1f0e98 gfs2: Truncate address space when flipping GFS2_DIF_JDATA flag
    7998e7efd1d5 RDMA/bnxt_re: Avoid CPU lockups due fifo occupancy check loop
    52da02521ede ipv6: Fix soft lockups in fib6_select_path under high next hop churn
    cd9f7bf6cad8 cpufreq: amd-pstate: add check for cpufreq_cpu_get's return value
    2364dc21ba5a ata: libata-core: Set ATA_QCFLAG_RTF_FILLED in fill_result_tf()
    509a928e815e ASoC: samsung: Add missing depends on I2C
    85af156e158c hwmon: (drivetemp) Set scsi command timeout to 10s
    2148a41dc8ff irqchip/sunxi-nmi: Add missing SKIP_WAKE flag
    b25bf1d7f5ff of/unittest: Add test that of_address_to_resource() fails on non-translatable address
    758abba3dd41 drm/amd/display: Use HW lock mgr for PSR1
    44c485f0fcb2 scsi: iscsi: Fix redundant response for ISCSI_UEVENT_GET_HOST_STATS request
    06bfc95f817b seccomp: Stub for !CONFIG_SECCOMP
    ed0d02b7e147 ASoC: samsung: Add missing selects for MFD_WM8994
    bb60f107c96b ASoC: wm8994: Add depends on MFD core
    0372f43ab704 Linux 6.6.74
    3f51f8c9d289 net: fix data-races around sk->sk_forward_alloc
    7d082fb20aa2 x86/xen: fix SLS mitigation in xen_hypercall_iret()
    80d39b50bdc0 nfsd: add list_head nf_gc to struct nfsd_file
    0b7b07cb5990 Revert "drm/amdgpu: rework resume handling for display (v2)"
    f47c834a9131 fs: relax assertions on failure to encode file handles
    f0c0ac84de17 ovl: support encoding fid from inode with no alias
    955a355e179f ovl: pass realinode to ovl_encode_real_fh() instead of realdentry
    ec3e32de2d8a ocfs2: fix deadlock in ocfs2_get_system_file_inode
    1364a29b71c7 block: fix uaf for flush rq while iterating tags
    08ac5fdb9c6d drm/amd/display: Fix out-of-bounds access in 'dcn21_link_encoder_create'
    c39d275efbe9 iio: imu: inv_icm42600: fix spi burst write not supported
    bcb9678b1c4f Revert "PCI: Use preserve_config in place of pci_flags"
    0cc84b6636be drm/amdgpu: always sync the GFX pipe on ctx switch
    65622de7c440 drm/i915/fb: Relax clear color alignment to 64 bytes
    a5cbbea145b4 hrtimers: Handle CPU state correctly on hotplug
    6c84ff2e788f irqchip/gic-v3-its: Don't enable interrupts in its_irq_set_vcpu_affinity()
    61c684dbfeb0 irqchip/gic-v3: Handle CPU_PM_ENTER_FAILED correctly
    61ecbceae2ee irqchip: Plug a OF node reference leak in platform_irqchip_probe()
    926ad31b76b8 pmdomain: imx8mp-blk-ctrl: add missing loop break condition
    b0111650ee59 gpio: xilinx: Convert gpio_lock to raw spinlock
    a5a2ee8144c3 fs/proc: fix softlockup in __read_vmcore (part 2)
    09528bb1a412 filemap: avoid truncating 64-bit offset to 32 bits
    c5418187b977 nouveau/fence: handle cross device fences properly
    bc9c49341f97 vsock: prevent null-ptr-deref in vsock_*[has_data|has_space]
    8a15c81063b9 vsock: reset socket state when de-assigning the transport
    dd93823fdd0e vsock/virtio: cancel close work in the destructor
    d88b249e14bd vsock/virtio: discard packets if the transport changes
    58e586c30d0b vsock/bpf: return early if transport is not assigned
    a3a3c1aa5126 net: ethernet: xgbe: re-add aneg to supported features in PHY quirks
    75deec40a774 selftests: mptcp: avoid spurious errors on disconnect
    d09d17c104a9 mptcp: fix spurious wake-up on under memory pressure
    890507bc19b9 mptcp: be sure to send ack when mptcp-level window re-opens
    5cfe4b1d0cfb i2c: atr: Fix client detach
    571d3f6045cd zram: fix potential UAF of zram table
    4c8b783c9d16 ALSA: hda/realtek: Add support for Ayaneo System using CS35L41 HDA
    ee37f3a538fc x86/asm: Make serialize() always_inline
    002b2efb1130 nvmet: propagate npwg topology
    8c9c1a2b48bb RDMA/bnxt_re: Fix to export port num to ib_query_qp
    bd6a4b4aed75 poll_wait: add mb() to fix theoretical race between waitqueue_active() and .poll()
    91371922704c iomap: avoid avoid truncating 64-bit offset to 32 bits
    4aaa1003a3f4 ACPI: resource: acpi_dev_irq_override(): Check DMI match last
    8cc32fc86e47 selftests: tc-testing: reduce rshift value
    8df41b7fb46d scsi: ufs: core: Honor runtime/system PM levels if set by host controller drivers
    933689000dff cachefiles: Parse the "secctx" immediately
    3f81514078fc kheaders: Ignore silly-rename files
    62861a5d4dd6 fs: fix missing declaration of init_files
    c598398815ee hfs: Sanity check the root record
    2e41e98c4e79 mac802154: check local interfaces before deleting sdata list
    1ea680703385 smb: client: fix double free of TCP_Server_Info::hostname
    6152c2c612a7 i2c: rcar: fix NACK handling when being a target
    573f036ba219 i2c: mux: demux-pinctrl: check initial mux selection, too
    f3311576789e Revert "mtd: spi-nor: core: replace dummy buswidth from addr to data"
    b9b63c9cc1e0 hwmon: (tmp513) Fix division of negative numbers
    3c8fe0931d9b soc: ti: pruss: Fix pruss APIs
    63195bae1cbf drm/v3d: Ensure job pointer is set to NULL after job completion
    5faf45beb701 drm/vmwgfx: Add new keep_resv BO param
    ff5b9e9be645 net/mlx5e: Always start IPsec sequence number from 1
    cdb3f2b62e2d net/mlx5e: Rely on reqid in IPsec tunnel mode
    87c4417a9021 net/mlx5e: Fix inversion dependency warning while enabling IPsec tunnel
    473bc285378f net/mlx5: Clear port select structure when fail to create
    ba8fdf7cff09 net/mlx5: Fix RDMA TX steering prio
    8a0097db0544 net: fec: handle page_pool_dev_alloc_pages error
    e8438cb84d0b net: xilinx: axienet: Fix IRQ coalescing packet count overflow
    325f2762fac7 nfp: bpf: prevent integer overflow in nfp_bpf_event_output()
    bb11f992f5a4 gtp: Destroy device along with udp socket's netns dismantle.
    d756c8ac3029 gtp: Use for_each_netdev_rcu() in gtp_genl_dump_pdp().
    3d1c0c5500f5 gtp: use exit_batch_rtnl() method
    1e222169f718 net: add exit_batch_rtnl() method
    7cde21f52042 pktgen: Avoid out-of-bounds access in get_imix_entries
    ea966b669878 openvswitch: fix lockup on tx to unregistering netdev with carrier
    b02e70be498b bpf: Fix bpf_sk_select_reuseport() memory leak
    c5af09473110 net: ethernet: ti: cpsw_ale: Fix cpsw_ale_get_field()
    3b4299ff7a25 Linux 6.6.73
    1795ca657119 Revert "ovl: do not encode lower fh with upper sb_writers held"
    d1c53de4463b Revert "ovl: pass realinode to ovl_encode_real_fh() instead of realdentry"
    950b604384fd Revert "ovl: support encoding fid from inode with no alias"
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
    843e64492a7e Linux 6.6.71
    a6923798e471 x86/hyperv: Fix hv tsc page based sched_clock for hibernation
    b34e805539da Revert "x86, crash: wrap crash dumping code into crash related ifdefs"
    c8bc44c5f961 Revert "x86/hyperv: Fix hv tsc page based sched_clock for hibernation"
    1acb10106df3 Linux 6.6.70
    9722973ad038 scsi: hisi_sas: Remove redundant checks for automatic debugfs dump
    3de1b50f055d RDMA/bnxt_re: Fix max SGEs for the Work Request
    f61e663d78ff mptcp: don't always assume copied data in mptcp_cleanup_rbuf()
    27c843e76447 mptcp: fix recvbuffer adjust on sleeping rcvmsg
    53fe947f67c9 mptcp: fix TCP options overflow.
    1ff2302e8aea mm: vmscan: account for free pages to prevent infinite Loop in throttle_direct_reclaim()
    86d946f3f999 mm/kmemleak: fix sleeping function called from invalid context at print message
    424abdec35ec mm/readahead: fix large folio support in async readahead
    cbe9eb2c39d0 gve: guard XDP xmit NDO on existence of xdp queues
    771d66f2bd8c gve: guard XSK operations on the existence of queues
    9b071576f891 fs/proc/task_mmu: fix pagemap flags with PMD THP entries on 32bit
    1f49aaf55652 drm: adv7511: Fix use-after-free in adv7533_attach_dsi()
    79fcfc900abe dt-bindings: display: adi,adv7533: Drop single lane support
    7b977f8c26b6 drm: adv7511: Drop dsi single lane support
    271f031f4c31 net/sctp: Prevent autoclose integer overflow in sctp_association_init()
    b32c3b748d29 sky2: Add device ID 11ab:4373 for Marvell 88E8075
    8c6fd5803b98 pinctrl: mcp23s08: Fix sleeping in atomic context due to regmap locking
    b92667f75574 RDMA/uverbs: Prevent integer overflow issue
    c9818b61d0a8 scripts/sorttable: fix orc_sort_cmp() to maintain symmetry and transitivity
    edc8ece96c11 kcov: mark in_softirq_really() as __always_inline
    2e3d203b1ade ocfs2: fix slab-use-after-free due to dangling pointer dqi_priv
    d2392b79d8af ALSA: seq: oss: Fix races at processing SysEx messages
    7d1f59defa9e ALSA hda/realtek: Add quirk for Framework F111:000C
    396964d45ca5 ALSA: seq: Check UMP support for midi_version change
    199f04528737 Revert "bpf: support non-r10 register spill/fill to/from stack in precision tracking"
    bc6962f2dbaf modpost: fix the missed iteration for the max bit in do_input()
    f93e9ae0ba5e modpost: fix input MODULE_DEVICE_TABLE() built for 64-bit on 32-bit host
    36e1b6890f22 RDMA/bnxt_re: Fix the max WQE size for static WQE support
    c3b5a7d6a13b seq_buf: Make DECLARE_SEQ_BUF() usable
    f2b94ee08ec6 ARC: build: Try to guess GCC variant of cross compiler
    d8f3f7d30f65 irqchip/gic: Correct declaration of *percpu_base pointer in union gic_base
    bef333418368 Bluetooth: hci_core: Fix sleeping function called from invalid context
    d8ecb248c199 net: usb: qmi_wwan: add Telit FE910C04 compositions
    c6b1d01e7a9c smb: client: destroy cfid_put_wq on module exit
    1d7ee876b8b9 ksmbd: set ATTR_CTIME flags when setting mtime
    2f75da8294bf ksmbd: retry iterate_dir in smb2_query_dir
    f53b37313ab6 bpf: fix potential error return
    73a30cb3e980 sound: usb: format: don't warn that raw DSD is unsupported
    325370be0676 sound: usb: enable DSD output for ddHiFi TC44C
    7523dd63ab22 ALSA: hda/realtek: Add new alc2xx-fixup-headset-mic model
    0d5e2d476000 ALSA: hda/ca0132: Use standard HD-audio quirk matching helpers
    35916b2f9650 btrfs: flush delalloc workers queue before stopping cleaner kthread during unmount
    d0fafe701c6a drm/amdkfd: Correct the migration DMA map direction
    037ea0f28f9a wifi: mac80211: wake the queues in case of failure in resume
    86772872f9f5 wifi: mac80211: fix mbss changed flags corruption on 32 bit systems
    d6b130fabfe1 net: ti: icssg-prueth: Fix clearing of IEP_CMP_CFG registers during iep_init
    17e8fa894345 ila: serialize calls to nf_register_net_hooks()
    a693b87692b4 af_packet: fix vlan_get_protocol_dgram() vs MSG_PEEK
    7aa78d0d8546 af_packet: fix vlan_get_tci() vs MSG_PEEK
    23f2e7a13fa4 net: wwan: iosm: Properly check for valid exec stage in ipc_mmio_init()
    ad91a2dacbf8 net: restrict SO_REUSEPORT to inet sockets
    95ccf006bbc8 net: reenable NETIF_F_IPV6_CSUM offload for BIG TCP packets
    9eea3703c882 net: sfc: Correct key_len for efx_tc_ct_zone_ht_params
    b238f61cc394 RDMA/rtrs: Ensure 'ib_sge list' is accessible
    0cd3bde081cd net: wwan: t7xx: Fix FSM command timeout issue
    313474b10897 net: mv643xx_eth: fix an OF node reference leak
    d5ea3a4d02d8 eth: bcmsysport: fix call balance of priv->clk handling routines
    930f2f96734e ALSA: usb-audio: US16x08: Initialize array before use
    0c896816aa19 net: llc: reset skb->transport_header
    4f49349c1963 netfilter: nft_set_hash: unaligned atomic read on struct nft_set_ext
    c9b344ada5fd drm/i915/dg1: Fix power gate sequence.
    3e45dd1622a2 net/mlx5e: Skip restore TC rules for vport rep without loaded flag
    e66a99b9177b net/mlx5e: macsec: Maintain TX SA from encoding_sa
    43e589ab372f net/mlx5: DR, select MSIX vector 0 for completion queue creation
    f647d72245aa netrom: check buffer length before accessing it
    36eff8669b74 net: Fix netns for ip_tunnel_init_flow()
    7e9aa1a065dc ipv4: ip_tunnel: Unmask upper DSCP bits in ip_tunnel_xmit()
    3b1a7fb74ab1 ipv4: ip_tunnel: Unmask upper DSCP bits in ip_md_tunnel_xmit()
    ae0710c5cc74 ipv4: ip_tunnel: Unmask upper DSCP bits in ip_tunnel_bind_dev()
    77b1e00fe97e ip_tunnel: annotate data-races around t->parms.link
    2af69905180b net: fix memory leak in tcp_conn_request()
    c6870f86bde6 net: stmmac: restructure the error path of stmmac_probe_config_dt()
    6d01d9f66ae1 net: stmmac: don't create a MDIO bus if unnecessary
    48f63e4e64a5 RDMA/hns: Fix missing flush CQE for DWQE
    be4293e108e2 RDMA/hns: Fix warning storm caused by invalid input in IO path
    2746888be48c RDMA/hns: Fix mapping error of zero-hop WQE buffer
    2049fb6c8bd7 RDMA/hns: Remove unused parameters and variables
    363f502cbfc0 RDMA/hns: Refactor mtr find
    ca2a2cad4efb net: dsa: microchip: Fix LAN937X set_ageing_time function
    7583dd5928b6 net: dsa: microchip: Fix KSZ9477 set_ageing_time function
    fa7f96589f17 drm/bridge: adv7511_audio: Update Audio InfoFrame properly
    f28fa7625536 RDMA/bnxt_re: Fix the locking while accessing the QP table
    cd1547b49b2c RDMA/bnxt_re: Fix MSN table size for variable wqe mode
    2e719d89b9fa RDMA/bnxt_re: Add send queue size check for variable wqe
    3ae9ee7ff3b2 RDMA/bnxt_re: Disable use of reserved wqes
    bb46a484a0c6 RDMA/bnxt_re: Add support for Variable WQE in Genp7 adapters
    9fcfe972758b RDMA/bnxt_re: Fix max_qp_wrs reported
    38b49312da2d RDMA/bnxt_re: Fix reporting hw_ver in query_device
    14f66ac898c9 RDMA/bnxt_re: Add check for path mtu in modify_qp
    183a96174cab RDMA/bnxt_re: Fix the check for 9060 condition
    347654387bb1 nvme-pci: 512 byte aligned dma pool segment quirk
    a0ceed736c88 RDMA/bnxt_re: Avoid sending the modify QP workaround for latest adapters
    a5092b138e1c RDMA/bnxt_re: Avoid initializing the software queue for user queues
    25e6e9da6926 RDMA/mlx5: Enforce same type port association for multiport RoCE
    5d1d7522cf82 RDMA/bnxt_re: Remove always true dattr validity check
    c91ae7c12d6f RDMA/bnxt_re: Allow MSN table capability check
    f452f397f9a6 tracing: Check "%s" dereference via the field and not the TP_printk format
    55841e8820b9 tracing: Fix trace_check_vprintf() when tp_printk is used
    680c07fabc2b tracing: Handle old buffer mappings for event strings and functions
    6920e362bc08 seq_buf: Introduce DECLARE_SEQ_BUF and seq_buf_str()
    cd27bbe89810 powerpc: Remove initialisation of readpos
    c46547b4686e tracing: Move readpos from seq_buf to trace_seq
    1ec141d8f51b net: mctp: handle skb cleanup on sock_queue failures
    c47ed91156da ceph: give up on paths longer than PATH_MAX
    a64e5295ebc4 tracing: Have process_string() also allow arrays
    de2a10e19226 mmc: sdhci-msm: fix crypto key eviction
    6228f13f1996 btrfs: fix use-after-free in btrfs_encoded_read_endio()
    c1dbd28a0795 selinux: ignore unknown extended permissions
    c2a7fc514637 f2fs: fix to wait dio completion
    23ea763880d6 platform/x86: mlx-platform: call pci_dev_put() to balance the refcount
    d4eb5b3c115d ALSA: ump: Shut up truncated string warning
    8b2e38f2a9b7 usb: xhci: Avoid queuing redundant Stop Endpoint commands
    8a2273e5c1be usb: typec: ucsi: glink: fix off-by-one in connector_status
    a47f0b03149a scsi: hisi_sas: Fix a deadlock issue related to automatic dump
    8c5ad189e90f cleanup: Remove address space of returned pointer
    55779f26eab9 crypto: ecc - Prevent ecc_digits_from_bytes from reading too many bytes
    9457d783fb94 Bluetooth: btusb: mediatek: add callback function in btusb_disconnect
    3aab20eb1989 Bluetooth: btusb: add callback function in btusb suspend/resume
    9a466b8693b9 btrfs: fix use-after-free when COWing tree bock and tracing is enabled
    0d2cc60b44d0 btrfs: rename and export __btrfs_cow_block()
    151447859d6f x86/fred: Clear WFE in missing-ENDBRANCH #CPs
    9c268be377e7 x86/ptrace: Add FRED additional information to the pt_regs structure
    498bdedca58a x86/ptrace: Cleanup the definition of the pt_regs structure
    48417c3426cf ACPI/IORT: Add PMCG platform information for HiSilicon HIP09A
    4252d023bae7 ACPI/IORT: Add PMCG platform information for HiSilicon HIP10/11
    f5a20424084f scsi: mpi3mr: Start controller indexing from 0
    d424303d8d18 scsi: mpi3mr: Use ida to manage mrioc ID
    8d891c866cf7 ALSA: ump: Update legacy substream names upon FB info update
    9617001adfc9 ALSA: ump: Indicate the inactive group in legacy substream names
    cf29cbf61cf2 ALSA: ump: Don't open legacy substream for an inactive group
    b5e175e18a39 ALSA: ump: Use guard() for locking
    b41d73055284 udf: Verify inode link counts before performing rename
    17b312c5d869 udf_rename(): only access the child content on cross-directory rename
    d33523b0beb5 watchdog: rzg2l_wdt: Power on the watchdog domain in the restart handler
    e145b77fb5c1 watchdog: rzg2l_wdt: Rely on the reset driver for doing proper reset
    7ea100fb50bb watchdog: rzg2l_wdt: Remove reset de-assert from probe
    b222816f9c43 of: address: Preserve the flags portion on 1:1 dma-ranges mapping
    443f803b332b of: address: Store number of bus flag cells rather than bool
    7a40a884f597 of: address: Remove duplicated functions
    6681113633dc x86/hyperv: Fix hv tsc page based sched_clock for hibernation
    e5b1574a8ca2 x86, crash: wrap crash dumping code into crash related ifdefs
    5422f4321640 thunderbolt: Don't display nvm_version unless upgrade supported
    5a23e3e9e245 thunderbolt: Add support for Intel Panther Lake-M/P
    888c554d3dfd thunderbolt: Add support for Intel Lunar Lake
    6cd8e621a689 xhci: Turn NEC specific quirk for handling Stop Endpoint errors generic
    f1ece345ad2c usb: xhci: Limit Stop Endpoint retries
    61329b25dc1d xhci: retry Stop Endpoint on buggy NEC controllers
    43e3aa2f44d6 net: renesas: rswitch: fix possible early skb release
    3dd65ffa2df6 softirq: Allow raising SCHED_SOFTIRQ from SMP-call-function on RT kernel
    d6616dcd8721 net/mlx5: unique names for per device caches
    ddcc7d71be31 Revert "nvme: make keep-alive synchronous operation"
    801acf741c87 nvme: use helper nvme_ctrl_state in nvme_keep_alive_finish function
    2c276bef8273 usb: typec: ucsi: glink: be more precise on orientation-aware ports
    7723988b0127 usb: typec: ucsi: glink: set orientation aware if supported
    01059e0b5cc0 usb: typec: ucsi: add update_connector callback
    fd662c37a108 usb: typec: ucsi: glink: move GPIO reading into connector_status callback
    8dd7fc5e409b usb: typec: ucsi: add callback for connector status updates
    c47940e84398 iio: adc: ad7192: properly check spi_get_device_match_data()
    843b5d1602d6 iio: adc: ad7192: Convert from of specific to fwnode property handling
    f7d548a62f08 usb: chipidea: udc: limit usb request length to max 16KB
    7a2020e83b6a usb: chipidea: add CI_HDRC_HAS_SHORT_PKT_LIMIT flag
    c39df6d3af2d usb: chipidea: add CI_HDRC_FORCE_VBUS_ACTIVE_ALWAYS flag
    c2556801583c fs/ntfs3: Fix warning in ni_fiemap
    48ebb93f933d fs/ntfs3: Implement fallocate for compressed files
    171c40531b04 remoteproc: qcom: pas: enable SAR2130P audio DSP support
    b506a0c41411 remoteproc: qcom: pas: Add support for SA8775p ADSP, CDSP and GPDSP
    25804f9b492b remoteproc: qcom: pas: Add sc7180 adsp
    3c9d3157f3cc mailbox: pcc: Check before sending MCTP PCC response ACK
    d8c0f38208a4 ACPI: PCC: Add PCC shared memory region command and status bitfields
    4460b5236818 i2c: xgene-slimpro: Migrate to use generic PCC shmem related macros
    dcc02c9ebfe8 mailbox: pcc: Support shared interrupt for multiple subspaces
    605018764e21 mailbox: pcc: Add support for platform notification handling
    82461d89c849 clk: qcom: clk-alpha-pll: Add NSS HUAYRA ALPHA PLL support for ipq9574
    deff81f56dff clk: qcom: clk-alpha-pll: Add support for zonda ole pll configure
    7c8c50c9855a scsi: hisi_sas: Create all dump files during debugfs initialization
    044928679823 scsi: hisi_sas: Allocate DFX memory during dump trigger
    91e035e98fa1 scsi: hisi_sas: Directly call register snapshot instead of using workqueue
    4f4fe3db92bb Bluetooth: btusb: Add new VID/PID 0489/e111 for MT7925
    f8a67ffb96c9 Bluetooth: btusb: Add USB HW IDs for MT7921/MT7922/MT7925
    1e7b1a8e7b6e Bluetooth: btusb: Add new VID/PID 13d3/3602 for MT7925
    e612c16ed0b7 Bluetooth: Add support ITTIM PE50-M75C
    ca4e69826d67 Bluetooth: hci_conn: Reduce hci_conn_drop() calls in two functions
    6e6a3479986a i2c: i801: Add support for Intel Panther Lake
    f38ca98b0721 i2c: i801: Add support for Intel Arrow Lake-H
    b35de9e01fc7 wifi: ath10k: avoid NULL pointer error during sdio remove
    358c36eae58d wifi: ath10k: Update Qualcomm Innovation Center, Inc. copyrights
    3ed6b2daa4e9 wifi: ath12k: fix atomic calls in ath12k_mac_op_set_bitrate_mask()
    dc6094108573 wifi: mac80211: Add non-atomic station iterator
    4eceef729c84 wifi: ath12k: Optimize the mac80211 hw data access
    3d94c4b21966 wifi: rtw88: use ieee80211_purge_tx_queue() to purge TX skb
    24b5898a8c73 wifi: mac80211: export ieee80211_purge_tx_queue() for drivers
    ed01e57a8169 media: uvcvideo: Force UVC version to 1.0a for 0408:4033
    9471b8f80526 media: uvcvideo: Force UVC version to 1.0a for 0408:4035
    8fa6f680b5aa cleanup: Adjust scoped_guard() macros to avoid potential warning
    873df38bdf42 cleanup: Add conditional guard support
    4b6beff3c073 crypto: ecdsa - Avoid signed integer overflow on signature decoding
    ec6488917941 crypto: ecdsa - Use ecc_digits_from_bytes to convert signature
    1afc7acbedb8 crypto: ecdsa - Rename keylen to bufsize where necessary
    e7fcd5d696c4 crypto: ecdsa - Convert byte arrays with key coordinates to digits
    93011887013d ext4: partial zero eof block on unaligned inode size extension
    fa42d5f1327f ext4: convert to new timestamp accessors
    1864d4712c4b memblock: allow zero threshold in validate_numa_converage()
    6fdc770506eb NUMA: optimize detection of memory with no node id assigned by firmware
    3adf89f17dbd sched: Initialize idle tasks only once
    106740e978c7 usb: dwc3: gadget: Add missing check for single port RAM in TxFIFO resizing logic
    39619c65ab4b smb: client: fix use-after-free of signing key
    d7cb986425ce smb: client: stop flooding dmesg in smb2_calc_signature()
    5f36890d650c fs/smb/client: implement chmod() for SMB3 POSIX Extensions
    d64429042fef smb/client: rename cifs_ace to smb_ace
    298e73ac323a smb/client: rename cifs_acl to smb_acl
    46c22d37f691 smb/client: rename cifs_sid to smb_sid
    386660bd303e smb/client: rename cifs_ntsd to smb_ntsd
    8322a66f9369 x86/mm: Carve out INVLPG inline asm for use by others
    bffaf4cb2810 docs: media: update location of the media patches
    e8b8c1ecbd2c drm/amd/display: Fix incorrect DSC recompute trigger
    3f9f631f9b91 drm/amd/display: Fix DSC-re-computing
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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 67123136b0..f17fd6f76f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3a66d8b7000a5efea50ccd9c2c8d0955dcf40c72"
-SRCREV_meta ?= "dff911ce87fe7b9944c6058907f079ddb0f3e840"
+SRCREV_machine ?= "8c0c411701e8feb7e56ec2edf5ae205b187e5457"
+SRCREV_meta ?= "2b3144e07219eb82a8a95913330a31c3c19f75e7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.69"
+LINUX_VERSION ?= "6.6.75"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index e48dae1160..bfbf680202 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.69"
+LINUX_VERSION ?= "6.6.75"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c556adf7d54204d713252722b27f5bfe25cd8620"
-SRCREV_meta ?= "dff911ce87fe7b9944c6058907f079ddb0f3e840"
+SRCREV_machine ?= "0a9cf91f3319931bc037a658ab1ceb86d966ac9b"
+SRCREV_meta ?= "2b3144e07219eb82a8a95913330a31c3c19f75e7"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 05bf773c1f..f0d477faf4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "b9db0f967e89de853fa737c164907c4ee111a489"
-SRCREV_machine:qemuarm64 ?= "c556adf7d54204d713252722b27f5bfe25cd8620"
-SRCREV_machine:qemuloongarch64 ?= "c556adf7d54204d713252722b27f5bfe25cd8620"
-SRCREV_machine:qemumips ?= "6cdf7de2dc6c90e973201f52871a3301ec822226"
-SRCREV_machine:qemuppc ?= "c556adf7d54204d713252722b27f5bfe25cd8620"
-SRCREV_machine:qemuriscv64 ?= "c556adf7d54204d713252722b27f5bfe25cd8620"
-SRCREV_machine:qemuriscv32 ?= "c556adf7d54204d713252722b27f5bfe25cd8620"
-SRCREV_machine:qemux86 ?= "c556adf7d54204d713252722b27f5bfe25cd8620"
-SRCREV_machine:qemux86-64 ?= "c556adf7d54204d713252722b27f5bfe25cd8620"
-SRCREV_machine:qemumips64 ?= "c8da027284e8c7ece7e04dcdd1cf49850fea911d"
-SRCREV_machine ?= "c556adf7d54204d713252722b27f5bfe25cd8620"
-SRCREV_meta ?= "dff911ce87fe7b9944c6058907f079ddb0f3e840"
+SRCREV_machine:qemuarm ?= "8a51a53128a5ec74564e37a6eb8a6f50430b1554"
+SRCREV_machine:qemuarm64 ?= "0a9cf91f3319931bc037a658ab1ceb86d966ac9b"
+SRCREV_machine:qemuloongarch64 ?= "0a9cf91f3319931bc037a658ab1ceb86d966ac9b"
+SRCREV_machine:qemumips ?= "2f0b854a37fa128c15cfae9a0d758c21b9c30b7d"
+SRCREV_machine:qemuppc ?= "0a9cf91f3319931bc037a658ab1ceb86d966ac9b"
+SRCREV_machine:qemuriscv64 ?= "0a9cf91f3319931bc037a658ab1ceb86d966ac9b"
+SRCREV_machine:qemuriscv32 ?= "0a9cf91f3319931bc037a658ab1ceb86d966ac9b"
+SRCREV_machine:qemux86 ?= "0a9cf91f3319931bc037a658ab1ceb86d966ac9b"
+SRCREV_machine:qemux86-64 ?= "0a9cf91f3319931bc037a658ab1ceb86d966ac9b"
+SRCREV_machine:qemumips64 ?= "f9f65cef2c04456589b1cd7a4e054b8aa331c5da"
+SRCREV_machine ?= "0a9cf91f3319931bc037a658ab1ceb86d966ac9b"
+SRCREV_meta ?= "2b3144e07219eb82a8a95913330a31c3c19f75e7"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "a30cd70ab75aa6b7ee880b6ec2ecc492faf205b2"
+SRCREV_machine:class-devupstream ?= "d51b7d37f14e76db7a1a13046ed87198c0407fcb"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.69"
+LINUX_VERSION ?= "6.6.75"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


