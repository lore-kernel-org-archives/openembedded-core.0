Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC9BE7719D
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 14:17:26 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.31535.1735913841548088170
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jan 2025 06:17:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BDPZbGCT;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7b6e8814842so1070842885a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 06:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735913840; x=1736518640; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ol+jM4PUrum4mjosmx85ZNkVcKh1/BGJBr7CpHioTdY=;
        b=BDPZbGCTbAU3W+LotQpUPIxexaUat/mNSE6IWssZtrrRLoGwtsfka72avFhQ/tVd3w
         ZMYQaM/zRHfLHmksx7SgmibIH7yvTRuFnatUtgyJ0JqkSbHFjK2D5RQN6jhqxbWxcEWX
         swnHeIc0ApDmzx9u4pQw8IrOdlazeGh+QsumNofit02n+jNzUKr39R1fX6wUGglRy1t8
         BegTlvVwUqonQearZ7+x3MRRAl5NOksfdwEO2atdXjqllB7lx97UVQDzr4YVChhZNv6I
         bGfdMmye504GOSeBdhXOEq3PUvh/Bnsvj/fFQEXQjaKGfGAIjq73lWcuYQ+PaDcuSfln
         cq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735913840; x=1736518640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ol+jM4PUrum4mjosmx85ZNkVcKh1/BGJBr7CpHioTdY=;
        b=T+YETl7hpkWhKgnIZDt1mRZVKo52mBmNcBbMCuD0HBK8qiN0z+KPdp4nEjH13uQ2Tl
         UA2V65MHfCUJ6elV/7Q/B3ejjSC7P1yP5G+qsv2eRNvyU8Nmn1TFIrjhTCsgavlRi3ZN
         aK68cd/AYvB6QkktpwBpDRTwG49dkIU2yyHBPcnQdQE7tRoCQhBLwuSFWvh6qsUnHEZ8
         pGZAwUhhcgJOB3Eb2pAS1J9B336n/NDfq9nOEvGxMaXVwk6IW5BxIlntGYghu74WjHbA
         FvySNyhyDVGn/hgPTrhKotUBBM2MaTKZrKvcCULZU1bpPcbHRaQbaYHCCVB0FYaZ8cOp
         dLqw==
X-Gm-Message-State: AOJu0YybqrdhZlTeQI7F9kIlNrqthPUwU/mM0+qlfudQaTlV+EBuIpy2
	OuAeqI3acinFBsp7wzWqvH3vNGiMJ6ffQLXlvKgGUnvSZbEebXjXjhM8rYuv2d8=
X-Gm-Gg: ASbGncsInqaTQY7UpVu5YLSXZobdF+kaVoSJxgMTtPleAr1D9xQaNgTRU7bSRVe7u3e
	hSgPABNiaJxp3ArBRme8rRDVTRgnW9c2CGXSduaMJWk2yvtBmbQdYPBn/2b/GIe78Ob+1rr72AB
	dcAecsueIMGQMLprewF5HWdilimxG0NYHDKngOV0I8SyPpN/aJ5wl4Ukmuv+R9apsy36HWa8n3u
	ZOWxfWONLloS+tN4w1+QktPbpZQMqS1uKP1QP0uBLnGopOMQi7Mb8gI2HcyNHw9DBm/KWF9o/VG
	lnDT+MmEc9OujCHQo2AzMceMjCcfZ3Dk35T7DhEuyGkJgfGWZvhV6VDm6w==
X-Google-Smtp-Source: AGHT+IFdTcnkk5Ke/72SfoAzaiVaueG+UqFAqyIyWBhNf0pNKLhueL+KuBBkqBffKbY8+nepZEflew==
X-Received: by 2002:a05:620a:471f:b0:7b6:f03e:6c0e with SMTP id af79cd13be357-7b9ba7aed89mr7428376685a.31.1735913840297;
        Fri, 03 Jan 2025 06:17:20 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac4ef0f6sm1275015485a.123.2025.01.03.06.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 06:17:19 -0800 (PST)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/10] linux-yocto/5.15: update to v5.15.170
Date: Fri,  3 Jan 2025 09:17:05 -0500
Message-Id: <20250103141709.2848730-7-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250103141709.2848730-1-bruce.ashfield@gmail.com>
References: <20250103141709.2848730-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 14:17:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209360

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    72244eab0dad8 Linux 5.15.170
    2d08a6c31c65f xfrm: validate new SA's prefixlen using SA family when sel.family is unset
    a8e691fe1894c ASoC: qcom: Fix NULL Dereference in asoc_qcom_lpass_cpu_platform_probe()
    b5cd035ebb9b7 net: phy: dp83822: Fix reset pin definitions
    399927f0f875b serial: protect uart_port_dtr_rts() in uart_shutdown() too
    fcfc61f63fbe9 selinux: improve error checking in sel_write_load()
    b7a396f76ada2 hv_netvsc: Fix VF namespace also in synthetic NIC NETDEV_REGISTER event
    610d4cea9b442 xfrm: fix one more kernel-infoleak in algo dumping
    385e2f3e0d83d ALSA: hda/realtek: Add subwoofer quirk for Acer Predator G9-593
    58cb697d80e66 KVM: nSVM: Ignore nCR3[4:0] when loading PDPTEs from memory
    dc39799f0cc2f openat2: explicitly return -E2BIG for (usize > PAGE_SIZE)
    822203f6355f4 nilfs2: fix kernel bug due to missing clearing of buffer delay flag
    681c99175bb87 ACPI: button: Add DMI quirk for Samsung Galaxy Book2 to fix initial lid detection issue
    c5a3aaa377134 ACPI: resource: Add LG 16T90SP to irq1_level_low_skip_override[]
    6032287747f87 drm/amd: Guard against bad data for ATIF ACPI method
    df75b21af7920 btrfs: zoned: fix zone unusable accounting for freed reserved extent
    6c6774cd760df ALSA: hda/realtek: Update default depop procedure
    7d4eb9e22131e ALSA: firewire-lib: Avoid division by zero in apply_constraint_to_size()
    b4007d5fe3862 bpf,perf: Fix perf_event_detach_bpf_prog error handling
    e56e0ec1b79f5 posix-clock: posix-clock: Fix unbalanced locking in pc_clock_settime()
    b96eff3d83408 r8169: avoid unsolicited interrupts
    999612996df28 net: sched: fix use-after-free in taprio_change()
    cc1c98da1338d net: usb: usbnet: fix name regression
    c9a0aed519771 net: wwan: fix global oob in wwan_rtnl_policy
    90baa455aa7e0 netfilter: xtables: fix typo causing some targets not to load on IPv6
    7dbd5b9ff0676 net: dsa: mv88e6xxx: Fix error when setting port policy on mv88e6393x
    38eb596656434 net: plip: fix break; causing plip to never transmit
    919ab6e237028 be2net: fix potential memory leak in be_xmit()
    9c6ce55e6f0bd net/sun3_82586: fix potential memory leak in sun3_82586_send_packet()
    45cb99c5b95eb xfrm: respect ip protocols rules criteria when performing dst lookups
    253843ec0c0a4 xfrm: extract dst lookup parameters into a struct
    b86b0d6eea204 tracing: Consider the NULL character when validating the event length
    cdf3ab1cf811c jfs: Fix sanity check in dbMount
    f9e6e1f00fcd1 platform/x86: dell-sysman: add support for alienware products
    4b520c11d0f3d ASoC: qcom: sm8250: add qrb4210-rb2-sndcard compatible string
    0e13fe4298a35 arm64/uprobes: change the uprobe_opcode_t typedef to fix the sparse warning
    e1ce098ea047c platform/x86: dell-wmi: Ignore suspend notifications
    4fc0d8660e391 udf: fix uninit-value use in udf_get_fileshortad
    f952a33478b7e arm64: Force position-independent veneers
    11db74f6a293a ASoC: fsl_sai: Enable 'FIFO continue on error' FCONT bit
    0bb2cb789349b ASoC: codecs: lpass-rx-macro: add missing CDC_RX_BCL_VBAT_RF_PROC2 to default regs values
    34a422274b693 drm/vboxvideo: Replace fake VLA at end of vbva_mouse_pointer_shape with real VLA
    b723f96407a0a exec: don't WARN for racy path_noexec check
    dd5db4078d120 block, bfq: fix procress reference leakage for bfqq in merge chain
    073530898ebf4 usb: dwc3: core: Fix system suspend on TI AM62 platforms
    81213d2058ec8 XHCI: Separate PORT and CAPs macros into dedicated file
    c3f3926854b12 usb: gadget: Add function wakeup support
    6a5de8753c70d KVM: s390: gaccess: Check if guest address is in memslot
    cbb31278711d5 KVM: s390: gaccess: Cleanup access to guest pages
    567e7bcb10ccc KVM: s390: gaccess: Refactor access address range check
    1f1c1ccdcb50e KVM: s390: gaccess: Refactor gpa and length calculation
    cf60d19d40184 arm64: probes: Fix uprobes for big-endian kernels
    acfb32d42a31d arm64:uprobe fix the uprobe SWBP_INSN in big-endian
    fa58e23ea1359 Bluetooth: bnep: fix wild-memory-access in proto_unregister
    42d83e5fed3e1 s390: Initialize psw mask in perf_arch_fetch_caller_regs()
    8747440605689 usb: typec: altmode should keep reference to parent
    e07d05b7f5ad9 smb: client: fix OOBs when building SMB2_IOCTL request
    39e02fa903232 scsi: target: core: Fix null-ptr-deref in target_alloc_device()
    03ca631c07f34 genetlink: hold RCU in genlmsg_mcast()
    8459d61fbf249 tcp/dccp: Don't use timer_pending() in reqsk_queue_unlink().
    5febfc5453898 net: systemport: fix potential memory leak in bcm_sysport_xmit()
    9e006c176f84f net: xilinx: axienet: fix potential memory leak in axienet_start_xmit()
    2311451931755 net/smc: Fix searching in list of known pnetids in smc_pnet_add_pnetid
    1eaa58198c646 net: ethernet: aeroflex: fix potential memory leak in greth_start_xmit_gbit()
    09839c24769fe macsec: don't increment counters for an unrelated SA
    75df8b53800ce octeontx2-af: Fix potential integer overflows on integer shifts
    213d1ff6c4917 net: usb: usbnet: fix race in probe failure
    b340df7458673 drm/msm: Allocate memory for disp snapshot with kvzalloc()
    42cf045086fea drm/msm: Avoid NULL dereference in msm_disp_state_print_regs()
    d125fbf1e128d drm/msm/dsi: fix 32-bit signed integer extension in pclk_rate calculation
    de5857fa7bcc9 RDMA/bnxt_re: Fix a bug while setting up Level-2 PBL pages
    e810e6d464039 RDMA/bnxt_re: Return more meaningful error
    ca83bc311ab04 ipv4: give an IPv4 dev to blackhole_netdev
    6a0c627cd76ea RDMA/irdma: Fix misspelling of "accept*"
    2e78ecb1220a0 RDMA/cxgb4: Fix RDMA_CM_EVENT_UNREACHABLE error for iWARP
    4e19aca8db696 ALSA: hda/cs8409: Fix possible NULL dereference
    208d3edea1106 ARM: dts: bcm2837-rpi-cm3-io3: Fix HDMI hpd-gpio pin
    e8143c0699320 x86/resctrl: Avoid overflow in MB settings in bw_validate()
    322a19baaaa25 RDMA/bnxt_re: Add a check for memory allocation
    0a2430b146d67 RDMA/bnxt_re: Fix incorrect AVID type in WQE structure
    fe068afb86866 bpf: devmap: provide rxq after redirect
    4e1e428533845 bpf: Make sure internal and UAPI bpf_redirect flags don't overlap
    6f0605db50e2c clk: imx: Add check for kcalloc
    5b837b9e1543e bpf: Fix the indention issue in grow_stack_state()
    42b62697634d1 cifs: Fix the calling of smb_version_operations::calc_smb_size()
    b14acf729e9dc f2fs: Add inline to f2fs_build_fault_attr() stub
    7c317bec311f8 f2fs: check validation of fault attrs in f2fs_build_fault_attr()
    81c12119c23f8 bpf: Fix accesses to uninit stack slots [ Upstream commit 6b4a64bafd107e521c01eec3453ce94a3fb38529 ]
    c4fa05422d87c smb: client: fix potential OOB in smb2_dump_detail()
    299ef3b5b00bf of: module: add buffer overflow check in of_modalias()
    b8086c3c1548b reiserfs: Avoid touching renamed directory if parent does not change
    ea091017ef62c ipv6: Fix data races around sk->sk_prot.
    ff8710da80ee6 ipv6: annotate some data-races around sk->sk_prot
    e8c2eafaaa6ac tcp: Fix data races around icsk->icsk_af_ops.
    8d1bab7709564 locking/rwsem: Disable preemption while trying for rwsem lock
    7c82dac028864 block, loop: support partitions without scanning
    45f504f301d41 bpftool: Fix pretty print dump for maps without BTF loaded
    1f24338cb789e jbd2: Drop the merge conflicted hunk
    e1d0e3c51bde6 tpm: tis_i2c: Limit write bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    1abe841fe331a tpm: tis_i2c: Limit read bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    6224acfc1d56b tpm: Add flag to use default cancellation policy
    1cd19d48fb909 tpm: tis_i2c: Fix sanity check interrupt enable mask
    a883da132fa82 tpm: Add tpm_tis_i2c backend for tpm_tis_core
    a742ac8a1c511 tpm: Add tpm_tis_verify_crc to the tpm_tis_phy_ops protocol layer
    ef495c5f45f2e tpm: Remove read16/read32/write32 calls from tpm_tis_phy_ops
    1f3be2e23aa6d gcc-plugins: Reorganize gimple includes for GCC 13
    24615a3b932aa ata: ahci: fix enum constants for gcc-13
    5d6cb145541aa net: stmmac: Enable mac_managed_pm phylink config
    fd93aabb42872 tools/resolve_btfids: Use pkg-config to locate libelf
    130f9da784063 tools/resolve_btfids: Build with host flags
    00f2f1a782f9b tools/resolve_btfids: Support cross-building the kernel with clang
    17776a4ba9c20 tools/resolve_btfids: Install libbpf headers when building
    7c9808380d70c libbpf: Make libbpf_version.h non-auto-generated
    37ae1ba791ac7 libbpf: Add LIBBPF_DEPRECATED_SINCE macro for scheduling API deprecations
    a2667e6d7314d drm/radeon: free iio for atombios when driver shutdown
    f100c753aa1f9 powerpc: Fix reschedule bug in KUAP-unlocked user copy
    da5513f301871 libbpf: Fix build warning on ref_ctr_off
    4c5a089621a8f perf python: Account for multiple words in CC
    1c5699ee85d4f fs: move S_ISGID stripping into the vfs_*() helpers
    838f5d0701d89 fs: add mode_strip_sgid() helper
    d971726836412 squashfs: provide backing_dev_info in order to disable read-ahead
    ed037d7be40c3 irq_work: use kasan_record_aux_stack_noalloc() record callstack
    1363bd7dbde39 ixgbevf: add disable link state
    e5601ae2bd249 ixgbe: add improvement for MDD response functionality
    caa57cd80575d ixgbe: add the ability for the PF to disable VF link state
    16a77bfcc7df1 Check /dev/console using init_stat()
    04574fd5579a4 tracing/arm: Have max stack tracer handle the case of return address after data
    0e51e57170184 gpiolib: cdev: Set lineevent_state::irq after IRQ register successfully
    1e6b7da6ddba7 drivers/base: Fix unsigned comparison to -1 in CPUMAP_FILE_MAX_BYTES
    4931609013207 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    04224f725aa36 irqchip/gic-v3-its: Skip HP notifier when no ITS is registered
    6f6c2996a81c1 irqchip/gic-v3-its: Postpone LPI pending table freeing and memreserve
    1fa94473423ff irqchip/gic-v3-its: Give the percpu rdist struct its own flags field
    6013d1ae5feb1 cert host tools: Stop complaining about deprecated OpenSSL functions
    efe20512212b0 init/Kconfig: fix CC_HAS_ASM_GOTO_TIED_OUTPUT test with dash
    a40d2daf2795d pnmtologo: use relocatable file name
    3b40d5b41155f of: configfs: remove unused variable overlay_lock
    6c085baf18386 tools: use basename to identify file in gen-mach-types
    2fca0fd719812 lib/build_OID_registry: fix reproducibility issues
    0f586f4ee8ada vt/conmakehash: improve reproducibility
    a75774679f28c OF: DT-Overlay configfs interface (v8)
    d179c639b30ba x86/boot: Wrap literal addresses in absolute_pointer()
    856ec356cf91e ACPI: thermal: drop an always true check
    7614af249993e xfs: Fix -Werror=dangling-pointer work-around for older GCC
    41470215f97ee xfs: Work around GCC 12 -Werror=dangling-pointer for xfs_attr_remote.o
    44a445c1922dc virtio-pci: Remove wrong address verification in vp_del_vqs()
    77aa9e489eafd bpf: Disallow unprivileged bpf by default
    ebfb1822e9f97 fs/aufs: fixup 5.15.36 fixups
    4eba9348d3e2e Revert "Revert "fbdev: Hot-unplug firmware fb devices on forced removal""
    5df6d1b00f95b jbd2: fix use-after-free of transaction_t race
    2d83e8196487f jbd2: refactor wait logic for transaction updates into a common function
    07a63f760793c netfilter: conntrack: avoid useless indirection during conntrack destruction
    4e71226259962 Revert "fbdev: Hot-unplug firmware fb devices on forced removal"
    7ba4cb36fd4f3 rcu: Avoid alloc_pages() when recording stack
    f78574dee71e4 kasan: test: silence intentional read overflow warnings
    d313cb89b6b1f kasan: arm64: fix pcpu_page_first_chunk crash with KASAN_VMALLOC
    5e279d5647ccf arm64: support page mapping percpu first chunk allocator
    e5bf16752dcac vmalloc: choose a better start address in vm_area_register_early()
    660b3d21b46f3 kasan: test: bypass __alloc_size checks
    00aa7573e53a2 kasan: test: add memcpy test that avoids out-of-bounds write
    67becf0b1bd44 kasan: fix tag for large allocations when using CONFIG_SLAB
    bedf1e033213c workqueue, kasan: avoid alloc_pages() when recording stack
    7195b67ce69b3 kasan: generic: introduce kasan_record_aux_stack_noalloc()
    bdff763f0e295 kasan: common: provide can_alloc in kasan_save_stack()
    51423ebb36adb lib/stackdepot: introduce __stack_depot_save()
    85373e66d8474 lib/stackdepot: remove unused function argument
    5b6cc9b251f32 lib/stackdepot: include gfp.h
    c9f3902d8069e aufs: reduce overhead for "code present but disabled" use case.
    b98d189df02cc aufs: bugfix, umount passes NULL to ->parse_monolithic()
    13b883cbbbd9f aufs standalone: cosmetic, missing copyright sentence
    21f8b0d81898e aufs: 5.15.5-20220117 ---> 5.15.5-20220221
    6199fd8966450 aufs: tiny, headers after fs_context
    8ddb40e31c29b aufs: fs_context 7/7, finally remount
    69035f71c6fd1 aufs: fs_context 6/7, now mount
    bc841b9706977 aufs: fs_context 5/7, parse all other mount options
    435188053da29 aufs: fs_context 4/7, parse xino options
    9af1f1825cbd7 aufs: fs_context 3/7, parse the branch-management options
    1c05eb767f8c3 aufs: fs_context 2/7, parse "br" mount option
    a8488f603134a aufs: fs_context 1/7, skelton of the new shceme
    8e32e0015564e aufs: pre fs_context, convert a static flag to a macro
    f90cb4144aec4 aufs: pre fs_context, support the incomplete sb and sbinfo case
    948762ef859c2 aufs: pre fs_context, convert the type of alloc_sbinfo()
    77151a08776b1 aufs: 5.15.5-20211129 ---> 5.15.5-20220117
    2539adbbbe1e4 aufs: 5.14-20211018 ---> 5.15.5-20211129
    7d32b25193c4c aufs: for v5.15-rc1, sync_inode() is gone
    66ec0c509225d aufs: for v5.15-rc1, new param 'rcu' for ->get_acl()
    69709dc518cd8 aufs: for v5.15-rc1, no mand-lock anymore
    ada8fe9543e50 aufs: 5.14-20210906  ---> 5.14-20211018
    b77f7f3f394ad Revert "aufs: adjust to v5.15 fs changes"
    81bdce5b58765 tick/nohz: WARN_ON --> WARN_ON_ONCE to prevent console saturation
    97c9638892228 sched/isolation: really align nohz_full with rcu_nocbs
    871f23ad36271 Revert "ARM: defconfig: Enable ax88796c driver for Exynos boards"
    ffad0783dd5b2 ARM: config: multi v7: Regenerate defconifg
    5c1e1a1ff2d39 ARM: config: multi v7: Add renamed symbols
    badaf96564fe1 ARM: config: multi v7: Clean up enabled by default options
    34996040fc9bd ARM: config: multi v7: Drop unavailable options
    7f685244afb3a powerpc/mm: Switch obsolete dssall to .long
    20301aeb1a641 riscv: fix build with binutils 2.38
    9df58d0705069 powerpc/lib/sstep: fix 'ptesync' build error
    720b61fc400b5 x86_64_defconfig: Fix warnings
    02bf23d26bc4c arm64: defconfig: cleanup config options
    05914e2c87e51 arm: defconfig: drop unused POWER_AVS option
    ffb532fa19b90 aufs5: fix build against v5.15.3+
    a4b3abf4d96d7 qemux86: add configuration symbol to select values
    fee94ee091541 clear_warn_once: add a clear_warn_once= boot parameter
    3d8762d900d93 clear_warn_once: bind a timer to written reset value
    95faacac47e8d clear_warn_once: expand debugfs to include read support
    de20c4240018c perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    0e4aacead9c15 perf: x86-32: explicitly include <errno.h>
    9ad92c11468e2 perf: mips64: Convert __u64 to unsigned long long
    09e7efe3e68a0 perf: fix bench numa compilation
    e79becc44fa6b perf: add SLANG_INC for slang.h
    b1033b5886819 perf: add sgidefs.h to for mips builds
    cf9db484ac0b4 perf: change --root to --prefix for python install
    7fd052c2c5624 perf: add 'libperl not found' warning
    27a437cdd4691 perf: force include of <stdbool.h>
    3b99d21bec2f6 fat: don't use obsolete random32 call in namei_vfat
    a7e9293b506bb FAT: Added FAT_NO_83NAME
    6fd0e71d9e5c1 FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    c379b0d324aeb FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    538be0fdb124f aufs: adjust to v5.15 fs changes
    f45da75c8759b aufs5: core
    047f57e07e01b aufs5: standalone
    029fc15574c88 aufs5: mmap
    610d0192ee94d aufs5: base
    d4e428d0ec5f4 aufs5: kbuild
    eb067eca251ab yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    286af18d0875e yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    24d59a4e26a67 yaffs2: v5.12+ build fixups (not runtime tested)
    22c73536d5d7e yaffs: include blkdev.h
    506b7251bfb81 yaffs: fix misplaced variable declaration
    a0e26ff364dcc yaffs2: v5.6 build fixups
    b10b1b2d169ef yaffs2: fix memory leak when /proc/yaffs is read
    ad9adccbb2147 yaffs: add strict check when call yaffs_internal_read_super
    2e3c3aec8279b yaffs: repair yaffs_get_mtd_device
    d662538516a7c yaffs: Fix build failure by handling inode i_version with proper atomic API
    70a6113ee2c7c yaffs2: fix memory leak in mount/umount
    3378e4a9e4043 yaffs: Avoid setting any ACL releated xattr
    ec2284edddef1 Yaffs:check oob size before auto selecting Yaffs1
    c2a49874051cd fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    e9a5105a3e735 yaffs2: adjust to proper location of MS_RDONLY
    608807406f138 yaffs2: import git revision b4ce1bb (jan, 2020)
    89e660ece42c8 initramfs: allow an optional wrapper script around initramfs generation
    b179dbc9aa109 iwlwifi: select MAC80211_LEDS conditionally
    3fd5ca3673d03 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    d1f6edbf01883 arm64/perf: Fix wrong cast that may cause wrong truncation
    d202fb2caf337 defconfigs: drop obselete options
    9a27e3b5f4e73 arm64/perf: fix backtrace for AAPCS with FP enabled
    e20d8cf019b42 linux-yocto: Handle /bin/awk issues
    b6d2a3dbbd3a3 uvesafb: provide option to specify timeout for task completion
    adb40f1e6a1a5 uvesafb: print error message when task timeout occurs
    f280a1ed09626 compiler.h: Undef before redefining __attribute_const__
    4352732f268c1 vmware: include jiffies.h
    7954a677968dc Resolve jiffies wrapping about arp
    5f28a1035d950 nfs: Allow default io size to be configured.
    0d7260ad71066 check console device file on fs when booting
    900a12e37e0a2 mount_root: clarify error messages for when no rootfs found
    7b878cbea7261 menuconfig,mconf-cfg: Allow specification of ncurses location
    6604fc1763b3d modpost: mask trivial warnings
    0d294adb09cbc kbuild: exclude meta directory from distclean processing
    a097cdd95a9ef powerpc: serialize image targets
    5db6ec39a0a3e arm: serialize build targets
    cbabca27905e2 crtsavres: fixups for 5.4+
    7fc7656ed403e powerpc/ptrace: Disable array-bounds warning with gcc8
    a5faac5a19a2e powerpc: Disable attribute-alias warnings from gcc8
    186c54665b676 powerpc: add crtsavres.o to archprepare for kbuild
    d1ea862964cae powerpc: kexec fix for powerpc64
    2ac35b89a0f90 powerpc: Add unwind information for SPE registers of E500 core
    2e1c348a28bbc mips: vdso: fix 'jalr $t9' crash in vdso code
    ec57870b303a8 mips: Kconfig: add QEMUMIPS64 option
    6a81b3c081078 4kc cache tlb hazard: tlbp cache coherency
    74e3b2a21e542 malta uhci quirks: make allowance for slow 4k(e)c
    22e65b63d3b4c arm/Makefile: Fix systemtap
    b7f1ab59f19e5 vexpress: Pass LOADADDR to Makefile
    ce2800c73bf7e arm: ARM EABI socketcall
    019d142fd956a ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 33c0f370b8..77d4da1177 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "dd3566c7afbdb325c7ba6e56c0eb525fcc7bc15c"
-SRCREV_meta ?= "b4c09f5abf1e9649877da3f82eeb4bde6185fe3a"
+SRCREV_machine ?= "09550c3a9a6b51fe9dd73e9b90e9d85959f1fb91"
+SRCREV_meta ?= "39edeb3fefcf8e3b5c20240e92bfd5167c9da7aa"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.169"
+LINUX_VERSION ?= "5.15.170"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index b0e2166303..9f51a99034 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.169"
+LINUX_VERSION ?= "5.15.170"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "10a43570e7f45db6a1b55e2fd27eaab50311b5de"
-SRCREV_meta ?= "b4c09f5abf1e9649877da3f82eeb4bde6185fe3a"
+SRCREV_machine ?= "5d9057298bcdc677c2d2a46a88663fb335322944"
+SRCREV_meta ?= "39edeb3fefcf8e3b5c20240e92bfd5167c9da7aa"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 5d65cc54d5..9657690710 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "a472fcdac80b8eb15a87a9d712117fe2f04869f7"
-SRCREV_machine:qemuarm64 ?= "b83b88fa0e5648e98e16a831391445d6bdd01f0d"
-SRCREV_machine:qemumips ?= "d4729075919ae27ec8e67d770419a1fb944a02dd"
-SRCREV_machine:qemuppc ?= "65d972cfcaa4e97be8ab1a0895a0f72865bb57b7"
-SRCREV_machine:qemuriscv64 ?= "46b573689f8e5146ae5e17702497b8e6e43950c7"
-SRCREV_machine:qemuriscv32 ?= "46b573689f8e5146ae5e17702497b8e6e43950c7"
-SRCREV_machine:qemux86 ?= "46b573689f8e5146ae5e17702497b8e6e43950c7"
-SRCREV_machine:qemux86-64 ?= "46b573689f8e5146ae5e17702497b8e6e43950c7"
-SRCREV_machine:qemumips64 ?= "9e2f401868a1af4f4e8d6bd8feb9e49e6405dec1"
-SRCREV_machine ?= "46b573689f8e5146ae5e17702497b8e6e43950c7"
-SRCREV_meta ?= "b4c09f5abf1e9649877da3f82eeb4bde6185fe3a"
+SRCREV_machine:qemuarm ?= "6d182fb48883e5f487a1b1a9d918cfe329c72bd6"
+SRCREV_machine:qemuarm64 ?= "ecf807800df1e4838974f3d63b16ef31b32e839f"
+SRCREV_machine:qemumips ?= "058d1c05bb16832886391922e078657d433a87e7"
+SRCREV_machine:qemuppc ?= "4cbe8a9197f047838e67af6b6b6b8f339b5883c2"
+SRCREV_machine:qemuriscv64 ?= "66794a3919629bf7e842cf506aca8a6be34b31e2"
+SRCREV_machine:qemuriscv32 ?= "66794a3919629bf7e842cf506aca8a6be34b31e2"
+SRCREV_machine:qemux86 ?= "66794a3919629bf7e842cf506aca8a6be34b31e2"
+SRCREV_machine:qemux86-64 ?= "66794a3919629bf7e842cf506aca8a6be34b31e2"
+SRCREV_machine:qemumips64 ?= "e17660fecfd0ada315d045f4478ba455f8f3f627"
+SRCREV_machine ?= "66794a3919629bf7e842cf506aca8a6be34b31e2"
+SRCREV_meta ?= "39edeb3fefcf8e3b5c20240e92bfd5167c9da7aa"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "74cdd62cb4706515b454ce5bacb73b566c1d1bcf"
+SRCREV_machine:class-devupstream ?= "72244eab0dad81e1553d4f5e105ffadc412885cb"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.169"
+LINUX_VERSION ?= "5.15.170"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.39.2


