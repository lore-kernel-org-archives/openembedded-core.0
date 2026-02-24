Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFEACF357C6
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:33:01 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21663.1771943576393185255
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:32:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OUGVJ+0R;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso42220305e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943574; x=1772548374; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YOAGL/uMb27J7fAvZSsMvbjaONDOlPokP0jcGOnP2hg=;
        b=OUGVJ+0RLaaeqp1dTk3BR3HyEo6VZ3Xk0O3UV46a6ZilGB5/c9dho1TSDSPPLg5w1z
         iJhI+awbop5ip1liZ+x3nkNwrgodgHIDIVG+NBGRz/dowy9yO7CSc9wEg8A7V4q6lIJb
         20Bc6nsNECAXdSd2Am8VkexosX8qSTFXKKjjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943574; x=1772548374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YOAGL/uMb27J7fAvZSsMvbjaONDOlPokP0jcGOnP2hg=;
        b=bOGTnn7bGEm2Zt7w47Ml7u39F+68r4GgleLyTM6xtDU8kjdjIaLbyC4ND8hiRfYqoR
         RjqnA7GnITi/FqlyFsKq4yI1KRyVDZVWUakrRb+vJSdQ1Urs8bFjMW5iPoN3/ReNH/FA
         FDJo4kboWqIuvfZk01QNyxzeM6U83QXESqpggZdKEe7D0dwFaof49Jb+ft3NErJOxZLi
         LKb+ZBcKenh53fnqx98ADe3p6lG/xbkaWhLDzAnuCv2aZdXvA9OTqE5UKFvTqi4hmMGC
         rqCDpfp+1Aowc+P/mzXLHp1OTjp3F4FUshl5Rb4mwKUUzfMY8OBCNCICC1uponim1s5L
         IHGg==
X-Gm-Message-State: AOJu0YxCjy1LlwxisKrPmY6YcoafaPK7GHkDzlEfjKAJZzEb8k6ZTYAR
	LrfPJql7/5BUAEMJCZIVMYtLKqTeVkUwlV6tNcHu+KodlNEse/CKC/UlI3k6tv/MZtBdqTxQ4La
	47bcU
X-Gm-Gg: AZuq6aI2eQ7fftbmoNstOXAHpK9zck4fPD/w7SNeNHAKt5Cic0UqfoCWLmacEIvc1JT
	k42GwZG/Qhjv/56UJMfsRj15Zgg2ZRDSY0Ayj5tiDziw6thwo8xgaMC936sidQPk1Z1GPPWGF55
	FW0t7oeSCcwrbdeJdWOS0YMer5dkUACG+siE36RFr82RMPbxQINJFGCN8VeKMBT37gj56bi8Wpe
	PvinnWRMjEOspa7gkQ0+IBbRi6AowOgFNlD3x1WfyljZmNaRPH6CDW2ZKUWsg6ofQknia+zRfxm
	CMR99JowyVrgR1lnToG7JLUL8Wntaf6L5pcxCopHfM1m2EQhe90JcvlcSAAsDe3Bdr4ED5ts62q
	ao/z4a/+rc6YKLvr1n8d8KRdHZwHWfGiTr7YIKJikDOyT/HWu2Oae0Y7rRwi0t56wSeruRMiniN
	k/V6zcMTpG0YIgy2FfH3Y93OySoToTWgUGx51KnWxnNo8OYH9ALZB/JKIkHh6vMlv6iht/o0YB+
	S4PlL0zxXcpKbWrr5YWplfNkMRAMefeVP28V+VDZ+am
X-Received: by 2002:a05:600c:a00d:b0:480:690e:f14a with SMTP id 5b1f17b1804b1-483a95bf2f3mr220740375e9.14.1771943574103;
        Tue, 24 Feb 2026 06:32:54 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.32.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:32:53 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/44] linux-yocto/6.6: update to v6.6.114
Date: Tue, 24 Feb 2026 15:31:40 +0100
Message-ID: <d0f8f283d0f30e4a01375d41fe870ad9819ac280.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:33:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231817

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    4a243110dc88 Linux 6.6.114
    d060f49771b5 PCI: tegra194: Reset BARs when running in PCIe endpoint mode
    ed518734a3c1 PCI: j721e: Fix programming sequence of "strap" settings
    d763fffd4284 PCI: j721e: Enable ACSPCIE Refclk if "ti,syscon-acspcie-proxy-ctrl" exists
    92b82e232b8d mm/ksm: fix flag-dropping behavior in ksm_madvise
    499089376206 ksmbd: browse interfaces list on FSCTL_QUERY_INTERFACE_INFO IOCTL
    65dc89d5cf40 PCI/sysfs: Ensure devices are powered for config reads (part 2)
    9c1c7edfea46 nfsd: decouple the xprtsec policy check from check_nfsd_access()
    2e0aab9ddaf1 ixgbevf: fix mailbox API compatibility by negotiating supported features
    8aebc9367911 ixgbevf: fix getting link speed data for E610 devices
    52ffb51de64f ixgbevf: Add support for Intel(R) E610 device
    6d4597351818 PCI: Add PCI_VDEVICE_SUB helper macro
    247d1fff85e0 phy: cadence: cdns-dphy: Update calibration wait time for startup state machine
    01829af7656b ext4: avoid potential buffer over-read in parse_apply_sb_mount_options()
    cebfbf40056a vfs: Don't leak disconnected dentries on umount
    f7353208c91a NFSD: Define a proc_layoutcommit for the FlexFiles layout type
    f846eacde280 fs: quota: create dedicated workqueue for quota_release_work
    d7d942c9a182 quota: remove unneeded return value of register_quota_format
    6c79b23f1c52 padata: Reset next CPU when reorder sequence wraps around
    5fb3328e927c xfs: use deferred intent items for reaping crosslinked blocks
    a4970f5087e2 iio: imu: inv_icm42600: Avoid configuring if already pm_runtime suspended
    353c69c7898e iio: imu: inv_icm42600: reorganize DMA aligned buffers in structure
    0af89c7e640a phy: cadence: cdns-dphy: Fix PLL lock and O_CMN_READY polling
    3594108460db phy: cdns-dphy: Store hs_clk_rate and return it
    11d10382a4df iio: imu: inv_icm42600: Simplify pm_runtime setup
    cbdd55050b78 PM: runtime: Add new devm functions
    2c3f01bb6ee4 xfs: fix log CRC mismatches between i386 and other architectures
    4245f6c66a3c xfs: rename the old_crc variable in xlog_recover_process
    c896618807a2 NFSD: Fix last write offset handling in layoutcommit
    4138321e9d41 NFSD: Minor cleanup in layoutcommit processing
    daa0ff1780c9 NFSD: Rework encoding and decoding of nfsd4_deviceid
    30a6a61c5828 nilfs2: fix deadlock warnings caused by lock dependency in init_nilfs()
    a0caf1de97e1 block: fix race between set_blocksize and read paths
    8fdd0ad43977 arm64: errata: Apply workarounds for Neoverse-V3AE
    d9d3e9ff1e2a arm64: cputype: Add Neoverse-V3AE definitions
    4f5ab4a9c6ab hfsplus: fix slab-out-of-bounds read in hfsplus_strcasecmp()
    b1ec27375dea selftests: arg_parsing: Ensure data is flushed to disk before reading.
    a0ed8ae58a83 HID: multitouch: fix name of Stylus input devices
    ef45e08141f8 HID: hid-input: only ignore 0 battery events for digitizers
    576312eb4363 ALSA: usb-audio: Fix NULL pointer deference in try_to_register_card
    d776af255d19 selftests/bpf: make arg_parsing.c more robust to crashes
    48b1d42286bf accel/qaic: Treat remaining == 0 as error in find_and_map_user_pages()
    af7e3989e241 ALSA: firewire: amdtp-stream: fix enum kernel-doc warnings
    66c29d9fc1dc sched/fair: Fix pelt lost idle time detection
    3359a93f45c3 sched/balancing: Rename newidle_balance() => sched_balance_newidle()
    8942165d0c3f drm/rockchip: vop2: use correct destination rectangle height check
    025db46dbcf8 drm/amd/powerplay: Fix CIK shutdown temperature
    7a4482d59fcb drm/i915/guc: Skip communication warning on reset in progress
    b82efea81a15 ASoC: nau8821: Add DMI quirk to bypass jack debounce circuit
    1746416e885c ASoC: nau8821: Generalize helper to clear IRQ status
    ce1aa07aea2b ASoC: nau8821: Cancel jdet_work before handling jack ejection
    9e32cb91bfb3 ASoC: codecs: Fix gain setting ranges for Renesas IDT821034 codec
    001f1fb0e4e3 drm/bridge: lt9211: Drop check for last nibble of version register
    706ed11aa9e8 riscv: kprobes: Fix probe address validation
    06da9b0f87da nvme-multipath: Skip nr_active increments in RETRY disposition
    a22c03011dac net: usb: lan78xx: fix use of improperly initialized dev->chipid in lan78xx_reset
    db00e3bdf69a net: usb: lan78xx: Add error handling to lan78xx_init_mac_address
    9c470a536556 tls: don't rely on tx_work during send()
    c61d4368197d tls: wait for pending async decryptions if tls_strp_msg_hold fails
    b9e21d676def tls: always set record_type in tls_process_cmsg
    f6c40bf4078d tls: wait for async encrypt in case of error during latter iterations of sendmsg
    f61dfccc5a3e net: tls: wait for async completion on last message
    071377a13834 tls: trim encrypted message to match the plaintext on short splice
    3dd3aa80e5af tg3: prevent use of uninitialized remote_adv and local_adv variables
    2bd8352df493 tcp: fix tcp_tso_should_defer() vs large RTT
    939a7d837167 amd-xgbe: Avoid spurious link down messages during interface toggle
    48294a67863c net/ip6_tunnel: Prevent perpetual tunnel growth
    932f7cd27905 r8169: fix packet truncation after S4 resume on RTL8168H/RTL8111H
    deb6ab171fd1 doc: fix seg6_flowlabel path
    3f4a318dec64 net: dlink: handle dma_map_single() failure properly
    e3fdc2b2c61e can: m_can: m_can_plat_remove(): add missing pm_runtime_disable()
    627a7ebd8954 dax: skip read lock assertion for read-only filesystems
    d280c138e66b HID: multitouch: fix sticky fingers
    5f65c8ad8c72 usb: gadget: f_rndis: Refactor bind path to use __free()
    1cde4516295a usb: gadget: f_ncm: Refactor bind path to use __free()
    e348d18fb012 usb: gadget: f_acm: Refactor bind path to use __free()
    070f341d86cf usb: gadget: f_ecm: Refactor bind path to use __free()
    70a766743173 usb: gadget: Introduce free_usb_request helper
    167ac21abb82 usb: gadget: Store endpoint pointer in usb_request
    50c721be2cff media: nxp: imx8-isi: m2m: Fix streaming cleanup on release
    211728b9b282 media: nxp: imx8-isi: Drop unused argument to mxc_isi_channel_chain()
    7a27f07948ef drm/exynos: exynos7_drm_decon: remove ctx->suspended
    cbbe08268a13 drm/exynos: exynos7_drm_decon: properly clear channels during bind
    98c15dc95009 drm/exynos: exynos7_drm_decon: fix uninitialized crtc reference in functions
    fbc8589975ef drm/msm/a6xx: Fix PDC sleep sequence
    8e245d3a2ab8 drm/msm/adreno: De-spaghettify the use of memory barriers
    eb0d280c2751 eventpoll: Replace rwlock with spinlock
    f72553935a53 epoll: Remove ep_scan_ready_list() in comments
    dfacd00818ce Bluetooth: btusb: Add USB ID 2001:332a for D-Link AX9U rev. A1
    e19e401b059a cpufreq: CPPC: Avoid using CPUFREQ_ETERNAL as transition delay
    59a6e61863e2 drm/amd: Check whether secure display TA loaded successfully
    db4bdb550ce1 drm/amdgpu: use atomic functions with memory barriers for vm fault info
    57239762aa90 drm/sched: Fix potential double free in drm_sched_job_add_resv_dependencies
    15c73964da9d cifs: parse_dfs_referrals: prevent oob on malformed input
    00e7da6ca640 can: gs_usb: increase max interface to U8_MAX
    be19fcf0baed can: gs_usb: gs_make_candev(): populate net_device->dev_port
    289498da343b btrfs: do not assert we found block group item when creating free space tree
    ebbf0d45be41 btrfs: fix incorrect readahead expansion length
    7c068bcc12d2 btrfs: fix clearing of BTRFS_FS_RELOC_RUNNING if relocation already running
    cb6039b68efa ext4: detect invalid INLINE_DATA + EXTENTS flag combination
    6e85cc404a7e ext4: wait for ongoing I/O to complete before freeing blocks
    870e14104978 jbd2: ensure that all ongoing I/O complete before freeing blocks
    f13ef730370b f2fs: fix wrong block mapping for multi-devices
    67a664eebf11 r8152: add error handling in rtl8152_driver_init
    d7dd034c1492 smb: client: Fix refcount leak for cifs_sb_tlink
    f231f248323d Linux 6.6.113
    99c704e44cab perf test stat: Avoid hybrid assumption when virtualized
    163f15370c55 writeback: Avoid excessively long inode switching times
    7594dae6cc95 writeback: Avoid softlockup when switching many inodes
    ab0d0138803c cramfs: Verify inode mode when loading from disk
    5a7602d64e1c fs: Add 'initramfs_options' to set initramfs mount options
    09d227c59d97 pid: Add a judgment for ns null in pid_nr_ns
    d47cdfddeb49 minixfs: Verify inode mode when loading from disk
    030a01fbcc42 irqchip/sifive-plic: Avoid interrupt ID 0 handling during suspend/resume
    6d09bbbca3e5 irqchip/sifive-plic: Make use of __assign_bit()
    63c44fa29ef2 mptcp: pm: in-kernel: usable client side with C-flag
    06d82c3a1f7f selftests/mm: skip soft-dirty tests when CONFIG_MEM_SOFT_DIRTY is disabled
    ef8a0b37f11d s390/bpf: Write back tail call counter for BPF_TRAMP_F_CALL_ORIG
    1527222f3549 s390/bpf: Write back tail call counter for BPF_PSEUDO_CALL
    2c768a9d1c17 s390/bpf: Describe the frame using a struct instead of constants
    10358217e30c s390/bpf: Centralize frame offset calculations
    9b378246e7ef s390/bpf: Change seen_reg to a mask
    63d2008affae ACPI: property: Do not pass NULL handles to acpi_attach_data()
    af0ff085cd56 ACPI: property: Add code comments explaining what is going on
    156819a04732 ACPI: property: Disregard references in data-only subnode lists
    1ed161347ad9 ACPI: battery: Add synchronization between interface updates
    8f03b1bf2bcd ACPI: battery: Check for error code from devm_mutex_init() call
    e6c83bbb0119 ACPI: battery: initialize mutexes through devm_ APIs
    346975d62660 ACPI: battery: allocate driver data through devm_ APIs
    b8c7d40b4cb3 arm64: mte: Do not flag the zero page as PG_mte_tagged
    7f4f031e66ad arm64: kprobes: call set_memory_rox() for kprobe page
    ca603d157694 ipmi: Fix handling of messages with provided receive message pointer
    348121b29594 ipmi: Rework user message limit handling
    aafae78e6d79 KVM: SVM: Emulate PERF_CNTR_GLOBAL_STATUS_SET for PerfMonV2
    d0d9fa88d7ab rseq: Protect event mask against membarrier IPI
    1810b6084aea btrfs: fix the incorrect max_bytes value for find_lock_delalloc_range()
    0c5ce6b6ccc2 PCI: endpoint: pci-epf-test: Add NULL check for DMA channels before release
    93b8a612db29 PCI: endpoint: Remove surplus return statement from pci_epf_test_clean_dma_chan()
    0fa2185104df misc: fastrpc: Save actual DMA size in fastrpc_map structure
    78e5fa79ed7c misc: fastrpc: Add missing dev_err newlines
    bc718d0bd87e ksmbd: add max ip connections parameter
    cd3efb93677c KVM: SVM: Skip fastpath emulation on VM-Exit if next RIP isn't valid
    ad25061d1d73 mm/ksm: fix incorrect KSM counter handling in mm_struct during fork
    1a301228c0a8 tracing: Fix race condition in kprobe initialization causing NULL pointer dereference
    8d2a77ccefee mfd: intel_soc_pmic_chtdc_ti: Set use_single_read regmap_config flag
    3cb4b35687a9 mfd: intel_soc_pmic_chtdc_ti: Drop unneeded assignment for cache_type
    d7b038045ea0 mfd: intel_soc_pmic_chtdc_ti: Fix invalid regmap-config max_register value
    7bd4e5367d09 media: mc: Clear minor number before put device
    8c7aad767518 Squashfs: reject negative file sizes in squashfs_read_inode()
    f5a1b04e5df2 Squashfs: add additional inode sanity checking
    edb6425f5935 lib/crypto/curve25519-hacl64: Disable KASAN with clang-17 and older
    abdfc4704e0b ext4: free orphan info with kvfree
    f775f821de46 ACPICA: Allow to skip Global Lock initialization
    720a66fdaa6c ext4: validate ea_ino and size in check_xattrs
    79ea7f3e11ef ext4: guard against EA inode refcount underflow in xattr update
    9e642ab8e5b2 ext4: fix an off-by-one issue during moving extents
    d1e681c0bb03 ext4: correctly handle queries for metadata mappings
    871b6894a3fa ext4: increase i_disksize to offset + len in ext4_update_disksize_before_punch()
    304fc34ff6fc ext4: verify orphan file size is not too big
    e7e0e3eae0c1 nfsd: nfserr_jukebox in nlm_fopen should lead to a retry
    925ed83efbe7 NFSD: Fix destination buffer size in nfsd4_ssc_setup_dul()
    677ebfe5d00f mm/damon/vaddr: do not repeat pte_offset_map_lock() until success
    bb5ef60ee84f mm/hugetlb: early exit from hugetlb_pages_alloc_boot() when max_huge_pages=0
    81a6d6011acb mm/page_alloc: only set ALLOC_HIGHATOMIC for __GPF_HIGH allocations
    69336589df5d wifi: mt76: mt7921u: Add VID/PID for Netgear A7500
    d0ca2f9fbb96 wifi: ath11k: HAL SRNG: don't deinitialize and re-initialize again
    3454c79780dd selftests: mptcp: join: validate C-flag + def limit
    1264edbed45e x86/umip: Fix decoding of register forms of 0F 01 (SGDT and SIDT aliases)
    c5bceeb4c569 x86/umip: Check that the instruction opcode is at least two bytes
    d7760884ee3f spi: cadence-quadspi: Flush posted register writes before DAC access
    8bf417e1d36c spi: cadence-quadspi: Flush posted register writes before INDAC access
    eef57e03d5c1 PCI: tegra194: Handle errors in BPMP response
    315001252acd PCI: tegra194: Fix broken tegra_pcie_ep_raise_msi_irq()
    a1a7a80dbe08 PCI: rcar-host: Convert struct rcar_msi mask_lock into raw spinlock
    f5770bba83d1 PCI: rcar-host: Drop PMSR spinlock
    608ab627d966 PCI: keystone: Use devm_request_irq() to free "ks-pcie-error-irq" on exit
    61aeab7178aa PCI/AER: Support errors introduced by PCIe r6.0
    741b78395083 PCI/AER: Fix missing uevent on recovery when a reset is requested
    a3a52f85a211 PCI/ERR: Fix uevent on failure to recover
    36039348bca7 PCI/IOV: Add PCI rescan-remove locking when enabling/disabling SR-IOV
    bd27ddb68a42 PCI/sysfs: Ensure devices are powered for config reads
    7a9dee3e4c9d PCI: tegra: Convert struct tegra_msi mask_lock into raw spinlock
    a5f1934fea37 rseq/selftests: Use weak symbol reference, not definition, to link with glibc
    9f16da9b549a rtc: interface: Fix long-standing race when setting alarm
    31a81d9ad81b rtc: interface: Ensure alarm irq is enabled when UIE is enabled
    5dd821744377 memory: samsung: exynos-srom: Fix of_iomap leak in exynos_srom_probe
    587b819fbcbf mmc: core: SPI mode remove cmd7
    6a5b401c745f mtd: rawnand: fsmc: Default to autodetect buswidth
    151bd8885947 xtensa: simdisk: add input size check in proc_write_simdisk
    3572290dfa7c sparc: fix error handling in scan_one_device()
    612d10ce8490 sparc64: fix hugetlb for sun4u
    ed3044b9c810 sctp: Fix MAC comparison to be constant-time
    04181645643d scsi: hpsa: Fix potential memory leak in hpsa_big_passthru_ioctl()
    ebf2b91a09fd sched/deadline: Fix race in push_dl_task()
    f4aab940ae9e Revert "ipmi: fix msg stack when IPMI is disconnected"
    dc3a1c6237e7 pwm: berlin: Fix wrong register in suspend/resume
    9f88a6fd9748 powerpc/pseries/msi: Fix potential underflow and leak issue
    83319fa81e60 powerpc/powernv/pci: Fix underflow and leak issue
    4307297a5fe4 power: supply: max77976_charger: fix constant current reporting
    fc6ce639b9a7 pinctrl: samsung: Drop unused S3C24xx driver data
    4bfba41d80d3 nvme-pci: Add TUXEDO IBS Gen8 to Samsung sleep quirk
    62fcb12c1f80 parisc: Remove spurious if statement from raw_copy_from_user()
    eb67aaf2c2f3 parisc: don't reference obsolete termio struct for TC* constants
    dd21dc8d7451 openat2: don't trigger automounts with RESOLVE_NO_XDEV
    ff770d10cfeb of: unittest: Fix device reference count leak in of_unittest_pci_node_verify
    babe2b53fa7d lib/genalloc: fix device leak in of_gen_pool_get()
    db2fcc8189bf KEYS: trusted_tpm1: Compare HMAC values in constant time
    132f827e7bac kernel/sys.c: fix the racy usage of task_lock(tsk->group_leader) in sys_prlimit64() paths
    8d982bdd5dfd iommu/vt-d: PRS isn't usable if PDS isn't supported
    ff416637ef07 iio: imu: inv_icm42600: Drop redundant pm_runtime reinitialization in resume
    dad6e796b10f init: handle bootloader identifier in kernel parameters
    759329336a77 iio: xilinx-ams: Unmask interrupts after updating alarms
    26242971663d iio: xilinx-ams: Fix AMS_ALARM_THR_DIRECT_MASK
    54e7b86d1ab0 iio: frequency: adf4350: Fix prescaler usage.
    3f88f4e8f178 iio: dac: ad5421: use int type to store negative error codes
    a832682cf6c9 iio: dac: ad5360: use int type to store negative error codes
    f7fed2af0ad8 fs/ntfs3: Fix a resource leak bug in wnd_extend()
    feac989493ca fbdev: Fix logic error in "offb" name match
    41b17a237e1e crypto: rockchip - Fix dma_unmap_sg() nents value
    4b3770692262 crypto: atmel - Fix dma_unmap_sg() direction
    11bb6f3cc21b crypto: aspeed - Fix dma_unmap_sg() direction
    69a18ff6c60e cpufreq: intel_pstate: Fix object lifecycle issue in update_qos_request()
    2e9ae62b1ca3 copy_sighand: Handle architectures where sizeof(unsigned long) < sizeof(u64)
    ed9cf7c460e8 bus: mhi: host: Do not use uninitialized 'dev' pointer in mhi_init_irq_setup()
    108c50494c2b bus: mhi: ep: Fix chained transfer handling in read path
    0276c8582488 btrfs: avoid potential out-of-bounds in btrfs_encode_fh()
    f74a135c5617 blk-crypto: fix missing blktrace bio split events
    fd7b6b31475e drm/nouveau: fix bad ret code in nouveau_bo_move_prep
    07c0125e21a6 drm/rcar-du: dsi: Fix 1/2/3 lane support
    b4ba1c81de30 media: lirc: Fix error handling in lirc_register()
    ec02275a6317 media: venus: firmware: Use correct reset sequence for IRIS2
    f9d61ee68937 media: pci: ivtv: Add missing check after DMA map
    4c656fd59e9e media: mc: Fix MUST_CONNECT handling for pads with no links
    d429c3bb06fa media: i2c: mt9v111: fix incorrect type for ret
    c0ad66984750 media: cx18: Add missing check after DMA map
    dbcbac8c47cb firmware: meson_sm: fix device leak at probe
    135eacbb111f xen/events: Update virq_to_irq on migration
    612ef6056855 xen/events: Return -EEXIST for bound VIRQs
    536a7e676fbe xen/manage: Fix suspend error path
    9ac86c75148f xen/events: Cleanup find_virq() return codes
    76165e048c1b dt-bindings: phy: rockchip-inno-csi-dphy: make power-domains non-required
    4d74d17ab18e ARM: OMAP2+: pm33xx-core: ix device node reference leaks in amx3_idle_init
    61683c2e7019 arm64: dts: ti: k3-am62a-main: Fix main padcfg length
    d9560998550d arm64: dts: qcom: sdm845: Fix slimbam num-channels/ees
    ac7ce5c869f8 arm64: dts: qcom: msm8939: Add missing MDSS reset
    0a5e8961cd0f arm64: dts: qcom: msm8916: Add missing MDSS reset
    9cfc586847fa ACPI: debug: fix signedness issues in read/write helpers
    debf3c347330 ACPI: TAD: Add missing sysfs_remove_group() for ACPI_TAD_RT
    1ae9cdd6b479 ACPI: property: Fix buffer properties extraction for subnodes
    b6e9645be9eb bpf: Avoid RCU context warning when unpinning htab with internal structs
    c14f73ecc365 gpio: wcd934x: mark the GPIO controller as sleeping
    380c23baf030 tpm_tis: Fix incorrect arguments in tpm_tis_probe_irq_single
    436cfdbc57d9 cifs: Query EA $LXMOD in cifs_query_path_info() for WSL reparse points
    a133e2699f8e smb: client: fix missing timestamp updates after utime(2)
    f37e7860dc5e crypto: essiv - Check ssize for decryption and in-place encryption
    46362cdd9df6 bridge: br_vlan_fill_forward_path_pvid: use br_vlan_group_rcu()
    0028e0134c64 netfilter: nft_objref: validate objref and objrefmap expressions
    df0ffc4b51e9 netfilter: nf_tables: drop unused 3rd argument from validate callback ops
    71fe3c3381de drm/amd/display: Properly disable scaling on DCE6
    914b1f47fb6a drm/amd/display: Properly clear SCL_*_FILTER_CONTROL on DCE6
    9973e4ee0e93 drm/amd/display: Add missing DCE6 SCL_HORZ_FILTER_INIT* SRIs
    0e69ecbbd562 drm/amdgpu: Add additional DCE6 SCL registers
    b6bfe44b6dbb bpf: Fix metadata_dst leak __bpf_redirect_neigh_v{4,6}
    d3f97bef535e mailbox: zynqmp-ipi: Remove dev.parent check in zynqmp_ipi_free_mboxes
    c6cdac3cb34f mailbox: zynqmp-ipi: Remove redundant mbox_controller_unregister() call
    8078f8570e86 tcp: take care of zero tp->window_clamp in tcp_set_rcvlowat()
    5e51bb7ffca1 perf python: split Clang options when invoking Popen
    44f838a60551 tools build: Align warning options with perf
    988519923e33 net: fsl_pq_mdio: Fix device node reference leak in fsl_pq_mdio_probe
    422c1c173c39 tcp: Don't call reqsk_fastopen_remove() in tcp_conn_request().
    c21f45cfa4a9 net/sctp: fix a null dereference in sctp_disposition sctp_sf_do_5_1D_ce()
    77e402b0af5e drm/vmwgfx: Fix copy-paste typo in validation
    867bda5d95d3 drm/vmwgfx: Fix Use-after-free in validation
    299cfb5a7dea drm/vmwgfx: Fix a null-ptr access in the cursor snooper
    2646a49e6286 net/mlx4: prevent potential use after free in mlx4_en_do_uc_filter()
    e9aff0d0b173 LoongArch: Init acpi_gbl_use_global_lock to false
    d243aaafddea LoongArch: Remove CONFIG_ACPI_TABLE_UPGRADE in platform_init()
    2d02309c2f05 ASoC: SOF: ipc4-topology: Correct the minimum host DMA buffer size
    3c90f583d679 scsi: mvsas: Fix use-after-free bugs in mvs_work_queue
    949545ef80f7 cpufreq: tegra186: Set target frequency for all cpus in policy
    d497fef5b957 clk: tegra: do not overallocate memory for bpmp clocks
    58f9a3f0acf9 clk: nxp: Fix pll0 rate check condition in LPC18xx CGU driver
    586211feb242 clk: nxp: lpc18xx-cgu: convert from round_rate() to determine_rate()
    5c2213b9aa44 clk: mediatek: clk-mux: Do not pass flags to clk_mux_determine_rate_flags()
    9ea18c668db0 clk: mediatek: mt8195-infra_ao: Fix parent for infra_ao_hdmi_26m
    fbfd0ae59013 perf evsel: Ensure the fallback message is always written to
    4a1f44e54664 perf tools: Add fallback for exclude_guest
    f6b458071302 perf test: Add a test for default perf stat command
    4163822f8c03 perf test: Don't leak workload gopipe in PERF_RECORD_*
    1501f779e794 perf session: Fix handling when buffer exceeds 2 GiB
    398657434c61 perf arm_spe: Correct memory level for remote access
    6f6ab20a6a3d perf arm-spe: Rename the common data source encoding
    ec2cc8ed15fd perf arm_spe: Correct setting remote access
    3966ea7d5405 rtc: optee: fix memory leak on driver removal
    0decf468c71e rtc: x1205: Fix Xicor X1205 vendor prefix
    41eac6ed9e2a perf util: Fix compression checks returning -1 as bool
    64419ecff19f clk: at91: peripheral: fix return value
    afa0b258e073 libperf event: Ensure tracing data is multiple of 8 sized
    52571a05bcd2 perf evsel: Avoid container_of on a NULL leader
    fdd428149a88 asm-generic/io.h: Skip trace helpers if rwmmio events are disabled
    ed30811fbed4 media: v4l2-subdev: Fix alloc failure check in v4l2_subdev_call_state_try()
    8ea08bcab31d iio: frequency: adf4350: Fix ADF4350_REG3_12BIT_CLKDIV_MODE
    cc1216f33ad4 clocksource/drivers/clps711x: Fix resource leaks in error paths
    9f13f727bed6 fscontext: do not consume log entries when returning -EMSGSIZE
    bc7372c05a07 fs: always return zero on success from replace_fd()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index d9281a8dc3a..07e8de39887 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6b56dc2c001e49e222099ea81df6a528daaa6494"
-SRCREV_meta ?= "e9d2569bbf078a9a440eb2a266d4908a8e981efb"
+SRCREV_machine ?= "546594fb2b71368579abbe46685b5b998ed67203"
+SRCREV_meta ?= "e5fb502182a6a12aff7bf98c4395ce4286f5d995"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.112"
+LINUX_VERSION ?= "6.6.114"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 2d4614380a6..48919e38537 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.112"
+LINUX_VERSION ?= "6.6.114"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "024ea2ec19c7ce3b85127ee406b77d1cb5c7d1ba"
-SRCREV_meta ?= "e9d2569bbf078a9a440eb2a266d4908a8e981efb"
+SRCREV_machine ?= "eee9d9792cc377b1e2818beb1a8db7851ce67ede"
+SRCREV_meta ?= "e5fb502182a6a12aff7bf98c4395ce4286f5d995"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index aec9465d521..c15edb3fd08 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "8bb9f27f007491367c5462bc6621b2b54de3a698"
-SRCREV_machine:qemuarm64 ?= "f3ce184609214572523760978e39e0cb8c9bcd2e"
-SRCREV_machine:qemuloongarch64 ?= "a9ade4af8d792deb5591876c33e227cb8ed66c44"
-SRCREV_machine:qemumips ?= "176f3129fdbd03984202e6e7be1513fb5cf034c8"
-SRCREV_machine:qemuppc ?= "056373204046e1264be8c6dbdc7d6fe5cc8fcd44"
-SRCREV_machine:qemuriscv64 ?= "a9ade4af8d792deb5591876c33e227cb8ed66c44"
-SRCREV_machine:qemuriscv32 ?= "a9ade4af8d792deb5591876c33e227cb8ed66c44"
-SRCREV_machine:qemux86 ?= "a9ade4af8d792deb5591876c33e227cb8ed66c44"
-SRCREV_machine:qemux86-64 ?= "a9ade4af8d792deb5591876c33e227cb8ed66c44"
-SRCREV_machine:qemumips64 ?= "9a4d37ff6055f4ba90ed7dae2521a7aa88a59469"
-SRCREV_machine ?= "a9ade4af8d792deb5591876c33e227cb8ed66c44"
-SRCREV_meta ?= "e9d2569bbf078a9a440eb2a266d4908a8e981efb"
+SRCREV_machine:qemuarm ?= "a4b8e87e13f9d7756b84d17c4b2a35afec9f972c"
+SRCREV_machine:qemuarm64 ?= "1e4d2d3e208273fe270b6b0686a901d5913c3942"
+SRCREV_machine:qemuloongarch64 ?= "0913b7f4e606a1c2adaf202e654a20f66dd6c5d0"
+SRCREV_machine:qemumips ?= "b6f40464a993b4c8d974cf38792c030ccbfe4ead"
+SRCREV_machine:qemuppc ?= "ff43ddf51676e66fb1df65e4d23a3b8d32210677"
+SRCREV_machine:qemuriscv64 ?= "0913b7f4e606a1c2adaf202e654a20f66dd6c5d0"
+SRCREV_machine:qemuriscv32 ?= "0913b7f4e606a1c2adaf202e654a20f66dd6c5d0"
+SRCREV_machine:qemux86 ?= "0913b7f4e606a1c2adaf202e654a20f66dd6c5d0"
+SRCREV_machine:qemux86-64 ?= "0913b7f4e606a1c2adaf202e654a20f66dd6c5d0"
+SRCREV_machine:qemumips64 ?= "3d0a848a03fb800c937eb14669b8f51d8fe70998"
+SRCREV_machine ?= "0913b7f4e606a1c2adaf202e654a20f66dd6c5d0"
+SRCREV_meta ?= "e5fb502182a6a12aff7bf98c4395ce4286f5d995"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "0bbbd97a442d5e0136cc2ee921a4b76542d618ce"
+SRCREV_machine:class-devupstream ?= "4a243110dc884d8e1fe69eecbc2daef10d8e75d7"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.112"
+LINUX_VERSION ?= "6.6.114"
 
 PV = "${LINUX_VERSION}+git"
 

