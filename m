Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83307C8303C
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 14:40:44 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.20546.1751985639561584259
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 07:40:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MqYbdfF3;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7d95b08634fso117634585a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 07:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751985638; x=1752590438; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nc1Qm9sW5zAZDVMyZKfhjOvpPd2KvfJ9vmrzhKwVOYg=;
        b=MqYbdfF3+6E5c73bCOibdsv2VPrLhp/0zKNQ6ctT/S/zeTyg5gvUvKBQUQgqrdYxts
         Kert6axAP0IKXvvnIULYJ1CDfMY+QBGsFZ1ZzM0bdpjOB1oIANpxgKR2ZydabI5DjLnU
         d2jXHeZFZvq2NOrxE81ArbjVNTHrmHZQo/SlHT6fSQKE2DtozBKO+kuoOKtPuK1uuuHL
         o0kHFZUsvh34FofW3cb7IsXrdvqhaCrr9fwWwBP5YRPuUFUW7Mq/D/KHIKU0HTa1dh1G
         2WTX74S6zdw5iy8QAccwCalxbf5o8kqq9koRbi45wAHZdCgMOrPPHz1efDzuEejbXTSy
         t7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751985638; x=1752590438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nc1Qm9sW5zAZDVMyZKfhjOvpPd2KvfJ9vmrzhKwVOYg=;
        b=XPAY6YhTMWGp7vFkLCc7JGSHb07WMhavbWPwPViult20dmkL/+MKCjoGHvGI+0Mcqu
         nca78wgqC+0r6UyPtW+Guk8TytAnQs5gLGebZucbb8R05+QOUX4jIfOJbCYfh6WjDJV7
         sljpAGgAo3TcbVxPOwTjvNC63PXBfZkyKjG571xDBGJJG6WBvMx1NgRGs+4v5SyehkHn
         Uq4YDL9mSvYhQt2ZAE7A/1UX2d/qRw/oE/qv0U5LN1HVZcm5tpa3I70JgdelX2fh4xnO
         ogLZS6NTznVQ111vN6ffWxJbaAOEa5R2HZQKOq2Cg5j599djwcFFG00vS3qQX2I1yEJB
         XwKw==
X-Gm-Message-State: AOJu0Yza7IS9EjRkQbBztKItyfqaimSPP/Bt+sy4kv4lKYiNsmm8bcBx
	JDiGdPF1KoDvCwz7pdkvX4hC+nE3fJFKEJaHTilGnvkjsMeZC+s3K+wYFEnp1UZF
X-Gm-Gg: ASbGnct95Zr2lKUT+QDK0pQn4k/iqHjUbazPM4cAwUmtEn022upY06hblraGTYnYt7O
	McLbSWQzqLorsTNV8FFZyEHOruyFmUSrzvLGff13CGJvKTP3qNVaPMrFnhMA/oWWrO3I1uuQO4S
	Z3z4tc0b/5HtN/Dkkefmq7U3SkMXkCT6NZomYCa/fqxeLDaWtct2oDmaKz+QdyubDSVwDQUxgW6
	tUbXQfOWZvurCyFm30KRba4/1y8T4Bp8n94Y+OHSFL2qxZkjvYotG9wMxu76NOEUlncQNaedzQP
	jUcS+bRP/FTHGTITBAz5GM7TdNv2Kg25eOVoPtji4u4wJJx5M4m3yXvGD1n9B7oYtiJRySxthde
	CRer7kG0uasSmffdZic1z6pkZ/ubtAWfXgdzZrmqRbkGhJ4xf8fnWs3pqBOvMcMY=
X-Google-Smtp-Source: AGHT+IGhkcy4MQwYlm/brWt5hN9NN4wkoVTquhvAA/r1CG0hT25n1+/LFI66vS2TQ2hZdyw7XF9e+w==
X-Received: by 2002:a05:620a:4149:b0:7d4:576d:46f3 with SMTP id af79cd13be357-7d5df10999dmr2205902185a.5.1751985637870;
        Tue, 08 Jul 2025 07:40:37 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbdbbbbbsm787718785a.39.2025.07.08.07.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 07:40:36 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 3/3] linux-yocto/6.6: update to v6.6.96
Date: Tue,  8 Jul 2025 10:40:32 -0400
Message-Id: <20250708144032.3095021-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250708144032.3095021-1-bruce.ashfield@gmail.com>
References: <20250708144032.3095021-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 14:40:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220041

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    a5df3a702b2c Linux 6.6.96
    18d3f9b8e4b9 ARM: 9354/1: ptrace: Use bitfield helpers
    f9917821c527 firmware: arm_scmi: Ensure that the message-id supports fastchannel
    67a50f572178 firmware: arm_scmi: Add a common helper to check if a message is supported
    6f27bbf3de0d nvme: always punt polled uring_cmd end_io work to task_work
    cdfb20e4b34a spi: spi-cadence-quadspi: Fix pm runtime unbalance
    c46358d02759 Revert "ipv6: save dontfrag in cork"
    1583d908cc77 x86/tools: Drop duplicate unlikely() definition in insn_decoder_test.c
    ed1f395ea5c0 Kunit to check the longest symbol length
    5f4787834cb7 s390/entry: Fix last breaking event handling in case of stack corruption
    56aa7679c9f3 media: uvcvideo: Rollback non processed entities on error
    f165d04c41a3 kbuild: rpm-pkg: simplify installkernel %post
    cca5bb42b736 scripts: clean up IA-64 code
    b90dc5d67b68 ksmbd: remove unsafe_memcpy use in session setup
    107a48df3f94 ksmbd: Use unsafe_memcpy() for ntlm_negotiate
    8302adf60aba drm/amdgpu: switch job hw_fence to amdgpu_fence
    a5d7cc1647f9 drm/amdgpu: Add kicker device detection
    f640d011080d drm/i915/gem: Allow EXEC_CAPTURE on recoverable contexts on DG1
    a8ceffaeb780 drm/amdgpu: amdgpu_vram_mgr_new(): Clamp lpfn to total vram
    5148c7ea69e9 drm/amd/display: Add null pointer check for get_first_active_display()
    ede04b471596 drm/bridge: cdns-dsi: Wait for Clk and Data Lanes to be ready
    252e6e96f9b6 drm/bridge: cdns-dsi: Check return value when getting default PHY config
    c4ee1b31a540 drm/bridge: cdns-dsi: Fix connecting to next bridge
    f9b819c39d13 drm/bridge: cdns-dsi: Fix phy de-init and flag it so
    2565ff3ac3f5 drm/bridge: cdns-dsi: Fix the clock variable for mode_valid()
    76115eafad12 drm/amdkfd: Fix race in GWS queue scheduling
    7946a10f8da7 drm/msm/gpu: Fix crash when throttling GPU immediately during boot
    50e48e940329 drm/udl: Unregister device before cleaning up on disconnect
    5ff3636bcc32 drm/tegra: Fix a possible null pointer dereference
    23134a522758 drm/tegra: Assign plane type before registration
    9ec447c23753 drm/etnaviv: Protect the scheduler's pending list with its lock
    6d7b814c527c drm/cirrus-qemu: Fix pitch programming
    66f122e67261 drm/ast: Fix comment on modeset lock
    bf2c1643abc3 scsi: megaraid_sas: Fix invalid node index
    42cf4f016173 HID: wacom: fix kobject reference count leak
    f531651c394e HID: wacom: fix memory leak on sysfs attribute creation failure
    33acbeeb5ad6 HID: wacom: fix memory leak on kobject creation failure
    f0ffc8076d39 HID: lenovo: Restrict F7/9/11 mode to compact keyboards only
    8a89e9c27b77 net: libwx: fix the creation of page_pool
    9052c7bca391 btrfs: update superblock's device bytes_used when dropping chunk
    aeeae8feeaae btrfs: fix a race between renames and directory logging
    6ad80378f928 dm-raid: fix variable in journal device check
    e395e34b0652 Bluetooth: L2CAP: Fix L2CAP MTU negotiation
    f90d78d65ccc serial: imx: Restore original RXTL for console to fix data loss
    40f62f8cf854 dt-bindings: serial: 8250: Make clocks and clock-frequency exclusive
    f89c40520fa1 staging: rtl8723bs: Avoid memset() in aes_cipher() and aes_decipher()
    e5e6a5aa3915 EDAC/amd64: Fix size calculation for Non-Power-of-Two DIMMs
    c82c7041258d smb: client: fix potential deadlock when reconnecting channels
    ced8eff11a4f drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort connector type
    1c9a8a84c5a8 drm/bridge: ti-sn65dsi86: make use of debugfs_init callback
    ee800ff711c9 drm/i915: fix build error some more
    0804d77fd6e6 net: selftests: fix TCP packet checksum
    5b63793da82a ALSA: hda/realtek: Fix built-in mic on ASUS VivoBook X507UAR
    cabed6ba92a9 atm: Release atm_dev_mutex after removing procfs in atm_dev_deregister().
    63528d60673a net: enetc: Correct endianness handling in _enetc_rd_reg64
    ad9c4941d32e libbpf: Fix possible use-after-free for externs
    c61e284d72d6 um: ubd: Add missing error check in start_io_thread()
    8f96a2ae16b5 vsock/uapi: fix linux/vm_sockets.h userspace compilation errors
    d58343f81354 af_unix: Don't set -ECONNRESET for consumed OOB skb.
    86136c670569 wifi: mac80211: fix beacon interval calculation overflow
    9b9a87f0bd18 libbpf: Fix null pointer dereference in btf_dump__free on allocation failure
    591f79625702 attach_recursive_mnt(): do not lock the covering tree when sliding something under it
    74fcb3852a2f ALSA: usb-audio: Fix out-of-bounds read in snd_usb_get_audioformat_uac3()
    3c709dce1699 atm: clip: prevent NULL deref in clip_push()
    64a99eff8dcf lib/group_cpus: fix NULL pointer dereference from group_cpus_evenly()
    88f3869649ed s390/pkey: Prevent overflow in size calculation for memdup_user()
    db33aa6c5c93 ASoC: amd: yc: Add DMI quirk for Lenovo IdeaPad Slim 5 15
    490a43d07f16 mm/damon/sysfs-schemes: free old damon_sysfs_scheme_filter->memcg_path on write
    c9036b6390af i2c: robotfuzz-osif: disable zero-length read messages
    4841060d2e7a i2c: tiny-usb: disable zero-length read messages
    fad0a2c16062 af_unix: Don't leave consecutive consumed OOB skbs.
    aabb458c33d9 af_unix: Don't call skb_get() for OOB skb.
    0919388ac44f af_unix: Define locking order for U_RECVQ_LOCK_EMBRYO in unix_collect_skb().
    fd3af69c14ed af_unix: Define locking order for U_LOCK_SECOND in unix_state_double_lock().
    b7904e2fccd0 af_unix: Define locking order for unix_table_double_lock().
    47847495a6ea platform/x86: ideapad-laptop: use usleep_range() for EC polling
    6e7af3d4f67f platform/x86: ideapad-laptop: move ACPI helpers from header to source file
    f8761b11f1c0 platform/x86: ideapad-laptop: move ymc_trigger_ec from lenovo-ymc
    d19ae7b033b2 platform/x86: ideapad-laptop: introduce a generic notification chain
    b6b5bcae7aa5 dummycon: Trigger redraw when switching consoles with deferred takeover
    8853bad7634f tty: vt: make consw::con_switch() return a bool
    e9ba8c528b8f tty: vt: sanitize arguments of consw::con_clear()
    0b10b5ab7d1d tty: vt: make init parameter of consw::con_init() a bool
    7bf946a284c3 PCI: apple: Set only available ports up
    b8704eef56c5 PCI: apple: Use helper function for_each_child_of_node_scoped()
    df1d7e879edd uio_hv_generic: Align ring size to system page
    ca0198894bf9 uio_hv_generic: Query the ringbuffer size for device
    ebba6cc0781c Drivers: hv: vmbus: Add utility function for querying ring size
    3bc5abf8e75a f2fs: don't over-report free space or inodes in statvfs
    9830ef1803a5 ASoC: codecs: wcd9335: Fix missing free of regulator supplies
    28b6ef1ab65d ASoC: codec: wcd9335: Convert to GPIO descriptors
    99d696842287 ASoC: codecs: wcd9335: Handle nicer probe deferral and simplify with dev_err_probe()
    0c40fa81f850 jfs: validate AG parameters in dbMount() to prevent crashes
    7747d3f9a506 fs/jfs: consolidate sanity checking in dbMount
    fc97a116dc49 btrfs: handle csum tree error with rescue=ibadroots correctly
    2cbeb47ea983 ovl: Check for NULL d_inode() in ovl_dentry_upper()
    d120737a6da7 scsi: ufs: core: Don't perform UFS clkscaling during host async scan
    acc1d4cc47f1 ceph: fix possible integer overflow in ceph_zero_objects()
    f3465bb32050 ALSA: usb-audio: Add a quirk for Lenovo Thinkpad Thunderbolt 3 dock
    789a3f63bd60 ALSA: hda: Add new pci id for AMD GPU display HD audio controller
    b8cd384c53ae ALSA: hda: Ignore unsol events for cards being shut down
    23fe269bfab3 usb: typec: mux: do not return on EOPNOTSUPP in {mux, switch}_set
    8851e4058701 usb: typec: displayport: Receive DP Status Update NAK request exit dp altmode
    00626325dba7 usb: cdc-wdm: avoid setting WDM_READ for ZLP-s
    433cb3e70dc9 usb: Add checks for snprintf() calls in usb_alloc_dev()
    0aaf810416c9 usb: common: usb-conn-gpio: use a unique name for usb connector device
    8e958d10dd0c tty: serial: uartlite: register uart driver in init
    a33f507f36d5 usb: potential integer overflow in usbg_make_tpg()
    a8d1b4f219e8 misc: tps6594-pfsm: Add NULL pointer check in tps6594_pfsm_probe()
    1063c586a35c iio: adc: ad_sigma_delta: Fix use of uninitialized status_pos
    41732f9febdc usb: dwc2: also exit clock_gating when stopping udc while suspended
    8217fa7d92f0 coresight: Only check bottom two claim bits
    8dbc01f09cad um: use proper care when taking mmap lock during segfault
    265ca1741075 um: Add cmpxchg8b_emu and checksum functions to asm-prototypes.h
    462215a2a3f4 iio: pressure: zpa2326: Use aligned_s64 for the timestamp
    c5734f9bab6f drm/scheduler: signal scheduled fence when kill job
    553f560e0a74 bcache: fix NULL pointer in cache_set_flush()
    9d578589e3ec amd/amdkfd: fix a kfd_process ref leak
    2fb2470bc683 md/md-bitmap: fix dm-raid max_write_behind setting
    aaef4f1f44b3 PCI: apple: Fix missing OF node reference in apple_pcie_setup_port
    969c9646f0d0 PCI: dwc: Make link training more robust by setting PORT_LOGIC_LINK_WIDTH to one lane
    7d942dbcd155 dmaengine: xilinx_dma: Set dma_device directions
    e0051a3daa8b dmaengine: idxd: Check availability of workqueue allocated by idxd wq driver before using
    c765f592adc7 rust: module: place cleanup_module() in .exit.text section
    efe5db9d98b1 ksmbd: provide zero as a unique ID to the Mac client
    f72093f270ea ksmbd: allow a filename to contain special characters on SMB3.1.1 posix extension
    ad804e3648d3 hwmon: (pmbus/max34440) Fix support for max34451
    2d8b3898caf5 NFSv4: xattr handlers should check for absent nfs filehandles
    9d90ab45d3d3 cxl/region: Add a dev_err() on missing target list entries
    96715eb1a120 fuse: fix race between concurrent setattrs from multiple nodes
    a13b2634dd66 leds: multicolor: Fix intensity setting while SW blinking
    c3616dfddf1d sunrpc: don't immediately retransmit on seqno miss
    f0ba7e6d06f2 mfd: max14577: Fix wakeup source leaks on device unbind
    35cda8619d97 mailbox: Not protect module_put with spin_lock_irqsave
    7d03b140af33 NFSv4.2: fix listxattr to return selinux security label
    cad6f283f6a6 NFSv4: Always set NLINK even if the server doesn't support it
    670c1c546cda cifs: Fix encoding of SMB1 Session Setup NTLMSSP Request in non-UNICODE mode
    0e7f0e6e14ba cifs: Fix cifs_query_path_info() for Windows NT servers
    4a6499ffc84c cifs: Correctly set SMB1 SessionKey field in Session Setup Request
    3f5b4c104b7d Linux 6.6.95
    218c3629fb8f cifs: Remove duplicate fattr->cf_dtype assignment from wsl_to_fattr() function
    6b4311f78a13 gpio: mlxbf3: only get IRQ for device instance 0
    f6071c3cfe3a perf evsel: Missed close() when probing hybrid core PMUs
    2a673aca82fe RISC-V: KVM: Don't treat SBI HFENCE calls as NOPs
    e20f0f44ec59 RISC-V: KVM: Fix the size parameter check in SBI SFENCE calls
    a77d0a14ed47 scsi: elx: efct: Fix memory leak in efct_hw_parse_filter()
    21da6d3561f3 arm64/ptrace: Fix stack-out-of-bounds read in regs_get_kernel_stack_nth()
    7c631e5cd38e perf/core: Fix WARN in perf_cgroup_switch()
    bddec730501b perf: Fix cgroup state vs ERROR
    2ee6044a6937 perf: Fix sample vs do_exit()
    4ca4f418b761 s390/pci: Fix __pcilg_mio_inuser() inline assembly
    d7094ad35104 platform/loongarch: laptop: Add backlight power control support
    7b47919aff63 smb: client: fix first command failure during re-negotiation
    cc77844d61f7 Revert "cpufreq: tegra186: Share policy per cluster"
    eb74c6f1b209 ARM: dts: am335x-bone-common: Increase MDIO reset deassert delay to 50ms
    94ec33e9600b ARM: dts: am335x-bone-common: Increase MDIO reset deassert time
    2f38986e93d3 platform/x86: ideapad-laptop: add missing Ideapad Pro 5 fn keys
    e9a011fc6b04 serial: sh-sci: Increment the runtime usage counter for the earlycon device
    cfa7fa02078d net: make for_each_netdev_dump() a little more bug-proof
    b8ced2b9a23a smb: Log an error when close_all_cached_dirs fails
    aaaa689aa29d dt-bindings: i2c: nvidia,tegra20-i2c: Specify the required properties
    6377977485f7 EDAC/amd64: Correct number of UMCs for family 19h models 70h-7fh
    a5e3a1442688 net: atm: fix /proc/net/atm/lec handling
    dffd03422ae6 net: atm: add lec_mutex
    bde8833eb075 calipso: Fix null-ptr-deref in calipso_req_{set,del}attr().
    3162d8235c8c ublk: santizize the arguments from userspace when adding a device
    66bba1fd5bad net: lan743x: fix potential out-of-bounds write in lan743x_ptp_io_event_clock_get()
    7382b6f7d102 net: microchip: lan743x: Reduce PTP timeout on HW failure
    235aa081e2d9 tcp: fix passive TFO socket having invalid NAPI ID
    d3dfe821dfe0 tipc: fix null-ptr-deref when acquiring remote ip of ethernet bearer
    9d0ddfb574a2 tcp: fix tcp_packet_delayed() for tcp_is_non_sack_preventing_reopen() behavior
    3261c017a7c5 atm: atmtcp: Free invalid length skb in atmtcp_c_send().
    a06078164001 mpls: Use rcu_dereference_rtnl() in mpls_route_input_rcu().
    4e9ab5c48ad5 wifi: carl9170: do not ping device which has failed to load firmware
    43e3433a48c3 ptp: allow reading of currently dialed frequency to succeed on free-running clocks
    a8c669bbc831 ptp: fix breakage after ptp_vclock_in_use() rework
    aaef8e3a54b9 e1000e: set fixed clock frequency indication for Nahum 11 and Nahum 13
    f4c19a8e51ee net: ice: Perform accurate aRFS flow match
    8662ac79a634 aoe: clean device rq_list in aoedev_downdev()
    9311d6d1a54f pldmfw: Select CRC32 when PLDMFW is selected
    4c8f5b0483ac hwmon: (occ) fix unaligned accesses
    1312d9bf88be hwmon: (occ) Rework attribute registration for stack usage
    ff3dcf7f8184 drm/i915/pmu: Fix build error with GCOV and AutoFDO enabled
    af2f5f21599a drm/nouveau/bl: increase buffer size to avoid truncate warning
    b599b310380a ionic: Prevent driver/fw getting out of sync on devcmd(s)
    002aa3ed19f3 drm/msm/dsi/dsi_phy_10nm: Fix missing initial VCO rate
    77087a79779c drm/msm/disp: Correct porch timing for SDM845
    7e6980c225c1 smb: fix secondary channel creation issue with kerberos by populating hostname when adding channels
    599c489eea79 sunrpc: handle SVC_GARBAGE during svc auth processing as auth error
    5e5d2ad9765a erofs: remove unused trace event erofs_destroy_inode
    2536810df13f bpf: Fix L4 csum update on IPv6 in CHECKSUM_COMPLETE
    f6393e5cb913 net: Fix checksum update for ILA adj-transport
    3977946f61cd mm/huge_memory: fix dereferencing invalid pmd migration entry
    af6cfcd0efb7 mm/hugetlb: unshare page tables during VMA split, not before
    39c86833f973 iio: accel: fxls8962af: Fix temperature calculation
    3d849cc3dfd3 ALSA: hda/realtek: enable headset mic on Latitude 5420 Rugged
    f80e551050e4 ALSA: hda/intel: Add Thinkpad E15 to PM deny list
    d61975567d9d ALSA: usb-audio: Rename ALSA kcontrol PCM and PCM1 for the KTMicro sound card
    6562806f3200 arm64: Restrict pagetable teardown to avoid false warning
    66bde385a1d3 wifi: rtw89: pci: use DBI function for 8852AE/8852BE/8851BE
    eeacfbab9842 wifi: cfg80211: init wiphy_work before allocating rfkill fails
    6d60d822809b Input: sparcspkr - avoid unannotated fall-through
    3902205eadf3 atm: Revert atm_account_tx() if copy_from_iter_full() fails.
    c1a2081f0347 platform/x86/intel-uncore-freq: Fail module load when plat_info is NULL
    2753481c40af selinux: fix selinux_xfrm_alloc_user() to set correct ctx_len
    0902625a24ee ksmbd: fix null pointer dereference in destroy_previous_session
    2a03531c00b2 selftests/x86: Add a test to detect infinite SIGTRAP handler loop
    372b511e9345 udmabuf: use sgtable-based scatterlist wrappers
    bfa4d86e130a net: clear the dst when changing skb protocol
    0357da9149ea net_sched: sch_sfq: reject invalid perturb period
    bb9d4ffff6d8 scsi: s390: zfcp: Ensure synchronous unit_add
    8d60df50e62f scsi: storvsc: Increase the timeouts to storvsc_timeout
    a504536c2923 smb: improve directory cache reuse for readdir operations
    202d7e838967 cifs: do not disable interface polling on failure
    58021a32f25e cifs: serialize other channels when query server interfaces is pending
    b530c44e1f38 cifs: deal with the channel loading lag while picking channels
    cd42ddddd70a jffs2: check jffs2_prealloc_raw_node_refs() result in few other places
    3f46644a5131 jffs2: check that raw node were preallocated before writing summary
    b427d98d5521 LoongArch: Fix panic caused by NULL-PMD in huge_pte_offset()
    099cfcb98fb4 LoongArch: Avoid using $r0/$r1 as "mask" for csrxchg
    782baee5d917 platform/loongarch: laptop: Unregister generic_sub_drivers on exit
    3bce9e6be030 platform/loongarch: laptop: Get brightness setting from EC on probe
    1921781ec4a8 drivers/rapidio/rio_cm.c: prevent possible heap overwrite
    675d90ee874c io_uring: fix task leak issue in io_wq_create()
    3c3c7c66bdfa Revert "x86/bugs: Make spectre user default depend on MITIGATION_SPECTRE_V2" on v6.6 and older
    af4ed5262d30 powerpc/eeh: Fix missing PE bridge reconfiguration during VFIO EEH recovery
    a7f3cfc1eb99 powerpc/vdso: Fix build of VDSO32 with pcrel
    dd95b3e00346 platform/x86: dell_rbu: Stop overwriting data buffer
    f3b840fb1508 platform/x86: dell_rbu: Fix list usage
    523e2f8a7f83 platform/x86/amd: pmc: Clear metrics table at start of cycle
    7d71ba5b0a01 fs/xattr.c: fix simple_xattr_list()
    897e6d88f0e3 Revert "bus: ti-sysc: Probe for l4_wkup and l4_cfg interconnect devices first"
    cdc1b9b47bc5 tee: Prevent size calculation wraparound on 32-bit kernels
    59b7304d0dff ARM: OMAP2+: Fix l4ls clk domain handling in STANDBY
    bca6fe52bd95 bus: fsl-mc: increase MC_CMD_COMPLETION_TIMEOUT_MS value
    c85311a73d74 watchdog: da9052_wdt: respect TWDMIN
    519ba75728ee fbcon: Make sure modelist not set on unregistered console
    8df53ee74cac wifi: ath12k: Pass correct values of center freq1 and center freq2 for 160 MHz
    2304e2b5e470 wifi: ath12k: fix incorrect CE addresses
    9db1bf90147c wifi: ath12k: fix link valid field initialization in the monitor Rx
    6bd0f2e71b15 wifi: ath11k: determine PM policy based on machine model
    42d0bfbe0296 octeontx2-pf: Add error log forcn10k_map_unmap_rq_policer()
    a37888a435b0 net: ethernet: cortina: Use TOE/TSO on all TCP
    38c4106cb4e9 bpf, sockmap: Fix data lost during EAGAIN retries
    bdb4da9e1921 f2fs: fix to set atomic write status more clear
    a3c32f17acbf usbnet: asix AX88772: leave the carrier control to phylink
    e036d648773c ice: fix check for existing switch rule
    8cde755f5616 i40e: fix MMIO write access to an invalid page in i40e_clear_hw
    52a16bafda0e sock: Correct error checking condition for (assign|release)_proto_idx()
    34c0a670556b scsi: lpfc: Use memcpy() for BIOS version
    79dc5e78d13d wifi: ath12k: fix failed to set mhi state error during reboot with hardware grouping
    5cf32cef3a38 pinctrl: mcp23s08: Reset all pins to input at probe
    f9397cf7bfb6 software node: Correct a OOB check in software_node_get_reference_args()
    03545901ec09 net: ethernet: ti: am65-cpsw: handle -EPROBE_DEFER
    c0d8c14d9bf2 vxlan: Do not treat dst cache initialization errors as fatal
    b4c83b37490d net: bridge: mcast: re-implement br_multicast_{enable, disable}_port functions
    cd97899361bc net: bridge: mcast: update multicast contex when vlan state is changed
    a0ab9e9148dd wifi: iwlwifi: Add missing MODULE_FIRMWARE for Qu-c0-jf-b0
    172d1e4a6804 wifi: mac80211: VLAN traffic in multicast path
    4fc2b3c0657b wifi: mac80211_hwsim: Prevent tsf from setting if beacon is disabled
    2077cef44d33 wifi: iwlwifi: pcie: make sure to lock rxq->read
    920fcc7adc73 iommu/amd: Ensure GA log notifier callbacks finish running before module unload
    32f25633f366 scsi: lpfc: Fix lpfc_check_sli_ndlp() handling for GEN_REQUEST64 commands
    c697dac96937 libbpf: Add identical pointer detection to btf_dedup_is_equiv()
    f11cfb48f2d2 clk: rockchip: rk3036: mark ddrphy as critical
    dfec43c50376 wifi: mac80211: do not offer a mesh path if forwarding is disabled
    efa7997ce846 wireless: purelifi: plfxlc: fix memory leak in plfxlc_usb_wreq_asyn()
    187829fb0c35 net: vertexcom: mse102x: Return code for mse102x_rx_pkt_spi
    84d34bd55d6a net: mlx4: add SOF_TIMESTAMPING_TX_SOFTWARE flag when getting ts info
    ae48bc0b8be8 pinctrl: armada-37xx: propagate error from armada_37xx_gpio_get()
    8a15a5438c58 pinctrl: armada-37xx: propagate error from armada_37xx_pmx_gpio_set_direction()
    02c966a8869b pinctrl: armada-37xx: propagate error from armada_37xx_gpio_get_direction()
    14a26f669206 pinctrl: armada-37xx: propagate error from armada_37xx_pmx_set_by_name()
    79f3e44df6e6 net: atlantic: generate software timestamp just before the doorbell
    9121c2ddd177 ipv4/route: Use this_cpu_inc() for stats on PREEMPT_RT
    62b62a2a6dc5 x86/sgx: Prevent attempts to reclaim poisoned pages
    c1025a54289b tcp: fix initial tp->rcvq_space.space value for passive TS enabled flows
    156b6bac7645 tcp: always seek for minimal rtt in tcp_rcv_rtt_update()
    969d61aa168c wifi: rtw89: leave idle mode when setting WEP encryption for AP mode
    f11520c6174c wifi: ath11k: Fix QMI memory reuse logic
    dcf7bb4397de wifi: ath12k: fix a possible dead lock caused by ab->base_lock
    7c4b6d8bd72d wifi: ath12k: fix macro definition HAL_RX_MSDU_PKT_LENGTH_GET
    6f79eb2e6816 net: dlink: add synchronization for stats update
    04fa1bef29d5 i2c: npcm: Add clock toggle recovery
    be5f6a65509c i2c: tegra: check msg length in SMBUS block read
    762325441e3a cpufreq: scmi: Skip SCMI devices that aren't used by the CPUs
    a620f66675e5 sctp: Do not wake readers in __sctp_write_space()
    a0b91fa813d4 wifi: mt76: mt7921: add 160 MHz AP for mt7922 device
    bf3dcb53ba32 wifi: mt76: mt76x2: Add support for LiteOn WN4516R,WN4519R
    2c1a2d863b24 emulex/benet: correct command version selection in be_cmd_get_stats()
    24900688ee47 wifi: mt76: mt7996: drop fragments with multicast or broadcast RA
    775fdb4042b2 i2c: designware: Invoke runtime suspend on quick slave re-registration
    7bf4461f1c97 bpf: Check rcu_read_lock_trace_held() in bpf_map_lookup_percpu_elem()
    61fc32485d64 f2fs: use vmalloc instead of kvmalloc in .init_{,de}compress_ctx
    92dbc2a2e2ec tipc: use kfree_sensitive() for aead cleanup
    088279ff18cd net: lan743x: Modify the EEPROM and OTP size for PCI1xxxx devices
    d2a25ca4134c net: macb: Check return value of dma_set_mask_and_coherent()
    c148af1f398b ACPI: battery: negate current when discharging
    6635356483b8 PM: runtime: fix denying of auto suspend in pm_suspend_timer_fn()
    6a7c583f56b9 gpiolib: of: Add polarity quirk for s5m8767
    5505ec191f77 ASoC: tegra210_ahub: Add check to of_device_get_match_data()
    cf961a38e450 ACPICA: utilities: Fix overflow check in vsnprintf()
    558ba4afdfe5 power: supply: bq27xxx: Retrieve again when busy
    1fee4324b566 ACPICA: fix acpi parse and parseext cache leaks
    8621fbeb4db9 ACPI: Add missing prototype for non CONFIG_SUSPEND/CONFIG_X86 case
    0ab90839bf6c ACPI: bus: Bail out if acpi_kobj registration fails
    7d346ca11a6e ASoC: tas2770: Power cycle amp on ISENSE/VSENSE change
    30e11a8cff73 ACPICA: Avoid sequence overread in call to strncmp()
    58cf7ba36b94 mmc: Add quirk to disable DDR50 tuning
    74f765e85d4b power: supply: collie: Fix wakeup source leaks on device unbind
    1c24a738971c clocksource: Fix the CPUs' choice in the watchdog per CPU verification
    28ecaebbed55 ASoC: amd: yc: Add quirk for Lenovo Yoga Pro 7 14ASP9
    755a8006b767 ACPICA: fix acpi operand cache leak in dswstate.c
    3175377e8ee1 iio: adc: ad7606_spi: fix reg write value mask
    f6a5b84f450b iio: imu: inv_icm42600: Fix temperature calculation
    fe684290418e mm/hugetlb: fix huge_pmd_unshare() vs GUP-fast race
    6a860536306e iio: accel: fxls8962af: Fix temperature scan element sign
    a9f6c1ad6c93 PCI: dw-rockchip: Fix PHY function call sequence in rockchip_pcie_phy_deinit()
    0b522796a80f PCI: Fix lock symmetry in pci_slot_unlock()
    7f6a2d378425 PCI: Add ACS quirk for Loongson PCIe
    9895f9d9b515 PCI: cadence-ep: Correct PBA offset in .set_msix() callback
    7ca06d696a2f uio_hv_generic: Use correct size for interrupt and monitor pages
    6f824cdd8209 Drivers: hv: Allocate interrupt and monitor pages aligned to system page boundary
    37166d63e42c smb: client: add NULL check in automount_fullpath
    39ff3774693f cifs: dns resolution is needed only for primary channel
    5713127da855 cifs: update dstaddr whenever channel iface is updated
    9d80e1d37e85 cifs: reset connections for all channels when reconnect requested
    3ee979709e16 remoteproc: core: Release rproc->clean_table after rproc_attach() fails
    9515d74c9d1a remoteproc: core: Cleanup acquired resources when rproc_handle_resources() fails in rproc_attach()
    a4df96e2e81c regulator: max14577: Add error check for max14577_read_reg()
    231f6a1de15b mips: Add -std= flag specified in KBUILD_CFLAGS to vdso CFLAGS
    dfa9ef978d9c staging: iio: ad5933: Correct settling cycles encoding per datasheet
    cc3cc41ed670 video: screen_info: Relocate framebuffers behind PCI bridges
    fa2118e9e233 KVM: s390: rename PROT_NONE to PROT_TYPE_DUMMY
    6bd2569d0b2f net: ch9200: fix uninitialised access during mii_nway_restart
    b1bf167f46dd phy: fsl-imx8mq-usb: fix phy_tx_vboost_level_from_property()
    83a692a9792a ftrace: Fix UAF when lookup kallsym after ftrace disabled
    6737c4551d2b mtd: rawnand: qcom: Fix read len for onfi param page
    df4918c0bb49 dm-verity: fix a memory leak if some arguments are specified multiple times
    61850a1b2673 dm-mirror: fix a tiny race condition
    fe0ff7d801fb KVM: VMX: Flush shadow VMCS on emergency reboot
    0d7a2ea4351b KVM: SVM: Clear current_vmcb during vCPU free for all *possible* CPUs
    7775ab2d53b3 mtd: nand: sunxi: Add randomizer configuration before randomizer enable
    e06a1dadc481 mtd: rawnand: sunxi: Add randomizer configuration in sunxi_nfc_hw_ecc_write_chunk
    d3abf0066b5e mm: fix ratelimit_pages update error in dirty_ratio_handler()
    23a707bbcbea RDMA/iwcm: Fix use-after-free of work objects after cm_id destruction
    442e80dcf6fe watchdog: fix watchdog may detect false positive of softlockup
    5180561afff8 ipc: fix to protect IPCS lookups using RCU
    f24d42245239 clk: meson-g12a: add missing fclk_div2 to spicc
    ebb8060561d5 parisc: fix building with gcc-15
    2f4040a5855a vgacon: Add check for vc_origin address range in vgacon_scroll()
    7f27859721ae parisc/unaligned: Fix hex output to show 8 hex chars
    3ca78032a388 fbdev: Fix fb_set_var to prevent null-ptr-deref in fb_videomode_to_var
    e32a40db6796 EDAC/altera: Use correct write width with the INTTEST register
    0909b2b49c45 fbdev: Fix do_register_framebuffer to prevent null-ptr-deref in fb_videomode_to_var
    061a5dd66608 net: ftgmac100: select FIXED_PHY
    8c5713ce1ced net/sched: fix use-after-free in taprio_dev_notifier
    a8acc7080ad5 NFC: nci: uart: Set tty->disc_data only in success path
    d95d87841d2a hwmon: (ftsteutates) Fix TOCTOU race in fts_read()
    79ef8a6c4ec5 f2fs: fix to do sanity check on sit_bitmap_size
    a87cbcc909cc f2fs: prevent kernel warning due to negative i_nlink from corrupted image
    aaddc6c696bd f2fs: fix to do sanity check on ino and xnid
    0f7100e8d9f0 Input: gpio-keys - fix possible concurrent access in gpio_keys_irq_timer()
    17474a56acf7 Input: ims-pcu - check record size in ims_pcu_flash_firmware()
    cf6a4c4ac7b6 ext4: only dirty folios when data journaling regular files
    3e8a5163bcd3 ext4: ensure i_size is smaller than maxbytes
    68cea04f1fb2 ext4: factor out ext4_get_maxbytes()
    223091c9897c ext4: fix calculation of credits for extent tree modification
    26e09d18599d ext4: inline: fix len overflow in ext4_prepare_inline_data
    55995f172598 bus: fsl-mc: fix GET/SET_TAILDROP command ids
    1e474b5fab51 bus: fsl-mc: do not add a device-link for the UAPI used DPMCP device
    8edfed4439b1 ata: pata_via: Force PIO for ATAPI devices on VT6415/VT6330
    48f35a32947b cgroup,freezer: fix incomplete freezing when attaching tasks
    96707ff5818f ceph: set superblock s_magic for IMA fsmagic matching
    636391e8c98c can: tcan4x5x: fix power regulator retrieval during probe
    d5d4be47e06c bus: mhi: host: Fix conflict between power_up and SYSERR
    44b9620e82bb bus: mhi: ep: Update read pointer only after buffer is written
    838d63de34a9 ARM: omap: pmic-cpcap: do not mess around without CPCAP or OMAP4
    c592d3ceca1a ARM: 9447/1: arm/memremap: fix arch_memremap_can_ram_remap()
    12cffd5bd1da arm64/mm: Close theoretical race where stale TLB entry remains valid
    a31dce9b561d media: uvcvideo: Fix deferred probing error
    c51c0a0be239 media: uvcvideo: Send control events for partial succeeds
    d314f99b6f19 media: uvcvideo: Return the number of processed controls
    ec26be7d6355 media: imx-jpeg: Cleanup after an allocation error
    20a6db0ef356 media: imx-jpeg: Reset slot data pointers when freed
    683a1db6800e media: imx-jpeg: Move mxc_jpeg_free_slot_data() ahead
    350d4af0493a media: imx-jpeg: Drop the first error frames
    f6b1b0f8ba0b media: vivid: Change the siize of the composing
    9824e1732a16 media: vidtv: Terminating the subsequent process of initialization failure
    17cb043ea133 media: videobuf2: use sgtable-based scatterlist wrappers
    36318ff3d6bf media: venus: Fix probe error handling
    ae7b143e05b3 media: v4l2-dev: fix error handling in __video_register_device()
    dfb2add0baa7 media: omap3isp: use sgtable-based scatterlist wrappers
    ac3a8e37cb8e media: mediatek: vcodec: Correct vsi_core framebuffer size
    025a943c49c7 media: gspca: Add error handling for stv06xx_read_sensor()
    ec5c328606ba media: davinci: vpif: Fix memory leak in probe error path
    04354c529c82 media: cxusb: no longer judge rbuf when the write fails
    4425db511b9d media: ccs-pll: Check for too high VT PLL multiplier in dual PLL case
    1e4b3f166795 media: ccs-pll: Correct the upper limit of maximum op_pre_pll_clk_div
    b9e314231ffc media: ccs-pll: Start OP pre-PLL multiplier search from correct value
    ae2fe6606511 media: ccs-pll: Start VT pre-PLL multiplier search from correct value
    eb7a4ea0a18c media: i2c: ds90ub913: Fix returned fmt from .set_fmt()
    ecaf904a55c1 media: nxp: imx8-isi: better handle the m2m usage_count
    585acb354977 media: ov5675: suppress probe deferral errors
    ce4a5a34a2bf media: ov8856: suppress probe deferral errors
    aaf516bb732c wifi: rtlwifi: disable ASPM for RTL8723BE with subsystem ID 11ad:1723
    d4356ce8f826 wifi: rtw88: usb: Reduce control message timeout to 500 ms
    2e7c64d7a92c jbd2: fix data-race and null-ptr-deref in jbd2_journal_dirty_metadata()
    1eeecd9be9fe wifi: ath12k: fix ring-buffer corruption
    14f5549ad163 fs/nfs/read: fix double-unlock bug in nfs_return_empty_folio()
    5ee9a07b456d SUNRPC: Prevent hang on NFS mount with xprtsec=[m]tls
    5060e1a5fef1 nfsd: Initialize ssc before laundromat_work to prevent NULL dereference
    e7e943ddd1c6 nfsd: nfsd4_spo_must_allow() must check this is a v4 compound request
    f08689fe3153 wifi: ath11k: fix ring-buffer corruption
    68b29235778b wifi: ath11k: fix rx completion meta data corruption
    0e4dc150423b wifi: p54: prevent buffer-overflow in p54_rx_eeprom_readback()
    782b3aff6763 net/mlx5: Add error handling in mlx5_query_nic_vport_node_guid()
    477e4319c371 net/mlx5_core: Add error handling inmlx5_query_nic_vport_qkey_viol_cntr()
    278a92b87463 regulator: max20086: Change enable gpio to optional
    420f6942f109 regulator: max20086: Fix MAX200086 chip id
    bf70b3c3df5f powerpc/pseries/msi: Avoid reading PCI device registers in reduced power states
    0257c26bbca5 io_uring/kbuf: account ring io_buffer_list memory
    a8b5ef355477 io_uring: account drain memory to cgroup
    abf80985f4d6 ASoC: meson: meson-card-utils: use of_property_present() for DT parsing
    3895a7590e6e ASoC: qcom: sdm845: Add error handling in sdm845_slim_snd_hw_params()
    40aefac870c1 gfs2: move msleep to sleepable context
    f5b9144715da crypto: marvell/cesa - Do not chain submitted requests
    0df5e4c7de27 configfs: Do not override creating attribute file failure in populate_attrs()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 06146fb3f7..9323918502 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "27bfdf2a5a0230142c8bd610d0f6d029b32b874c"
-SRCREV_meta ?= "c5e24825003b998f786b65f6e397904a50daa66c"
+SRCREV_machine ?= "a02058f9508e565ca6d62ff4fda707d1b8894ea0"
+SRCREV_meta ?= "533e8057057d5eb7400a400e53972c54ac1169b0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.94"
+LINUX_VERSION ?= "6.6.96"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index fd5b1467bd..7424dacc42 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.94"
+LINUX_VERSION ?= "6.6.96"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "1843bb6576a42f208754285f170a824c6777e15b"
-SRCREV_meta ?= "c5e24825003b998f786b65f6e397904a50daa66c"
+SRCREV_machine ?= "d68fff9b37fe90feaef6e6e24d560f07420d2044"
+SRCREV_meta ?= "533e8057057d5eb7400a400e53972c54ac1169b0"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 5683c9b861..de6952dad0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "78cd415ed1379770d897a235b1af4dee842b551a"
-SRCREV_machine:qemuarm64 ?= "84e1934158c201425a17e5b42e1ca1b3b2186ffb"
-SRCREV_machine:qemuloongarch64 ?= "a05382452c269c3c3bd7b593e5e44ef817fe3d5e"
-SRCREV_machine:qemumips ?= "0edc239358dfb8fa8147dd27df814d6200c852d1"
-SRCREV_machine:qemuppc ?= "ff8bafa847fbe675cc041d2b99a6ae2f476ef459"
-SRCREV_machine:qemuriscv64 ?= "a05382452c269c3c3bd7b593e5e44ef817fe3d5e"
-SRCREV_machine:qemuriscv32 ?= "a05382452c269c3c3bd7b593e5e44ef817fe3d5e"
-SRCREV_machine:qemux86 ?= "a05382452c269c3c3bd7b593e5e44ef817fe3d5e"
-SRCREV_machine:qemux86-64 ?= "a05382452c269c3c3bd7b593e5e44ef817fe3d5e"
-SRCREV_machine:qemumips64 ?= "37ef59b7c4942d3c54938ef6a34a13977a741e0d"
-SRCREV_machine ?= "a05382452c269c3c3bd7b593e5e44ef817fe3d5e"
-SRCREV_meta ?= "c5e24825003b998f786b65f6e397904a50daa66c"
+SRCREV_machine:qemuarm ?= "a2c45f6283ecd822468883d493f90ab0cc4f3a8a"
+SRCREV_machine:qemuarm64 ?= "d72e5d8e6d1a220a18fb2d9848fadbe443c9d555"
+SRCREV_machine:qemuloongarch64 ?= "cfb2162b885f040f7d3d2c95103af0d62ad94b28"
+SRCREV_machine:qemumips ?= "09314f2a0c95b59863247654f75555489cae9e11"
+SRCREV_machine:qemuppc ?= "7ee481d1b7be6cb8897494430119c4a00d40c29e"
+SRCREV_machine:qemuriscv64 ?= "cfb2162b885f040f7d3d2c95103af0d62ad94b28"
+SRCREV_machine:qemuriscv32 ?= "cfb2162b885f040f7d3d2c95103af0d62ad94b28"
+SRCREV_machine:qemux86 ?= "cfb2162b885f040f7d3d2c95103af0d62ad94b28"
+SRCREV_machine:qemux86-64 ?= "cfb2162b885f040f7d3d2c95103af0d62ad94b28"
+SRCREV_machine:qemumips64 ?= "3b2b3b16411baea07773b9c74093d139a0d0ab25"
+SRCREV_machine ?= "cfb2162b885f040f7d3d2c95103af0d62ad94b28"
+SRCREV_meta ?= "533e8057057d5eb7400a400e53972c54ac1169b0"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "6282921b6825fef6a1243e1c80063421d41e2576"
+SRCREV_machine:class-devupstream ?= "a5df3a702b2cba82bcfb066fa9f5e4a349c33924"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.94"
+LINUX_VERSION ?= "6.6.96"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


