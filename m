Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B5FCF649D
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 01:57:56 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.45584.1727661466039690644
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Sep 2024 18:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OMdCG4Hl;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2e06f5d4bc7so3328815a91.2
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 18:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727661465; x=1728266265; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QEqpvqfOZyTM1Dr66LNiAVFu1w/5eR2PPvJNFOLFDyU=;
        b=OMdCG4HlNYaGTfOnlvFby8FVIHnr+b9iw38gHF2aFp+0S9ba/2Tkb7KjFQP1q11p2o
         MRqqtOaIWXOzgbyyvQAevfVCKEIWASBTwhYOqa+sz45J920AasXT2ubL3ME4Rh2bo0Fe
         MIA4sZRSEnJAHqQJT/Izc7gYxQ5cbIXaIX3oWAdDnQRAKz/Blx6ni3HM7l1moIfqwNyn
         5aDEdCoD09ohxmGcqB9jllr6/eDx9N09jvAhEUJaV0Psz3mrP/pt1apk2LpQuqkovQo6
         uDECvWg5dqQrCwGZAWkwQFe2GfCNI1hICpzT1muWOAJw8I8XxtKvQHIre+P5Fd+SuN4V
         XpVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727661465; x=1728266265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QEqpvqfOZyTM1Dr66LNiAVFu1w/5eR2PPvJNFOLFDyU=;
        b=aD4axA9I7aNROFk7AUD6/KHB1x/eAVlUNvF29zNIWFgay0CbDOJEP/oB7WRWzRxctf
         bmY7K6vHRCF+Iw2nUZakKyPV00VishAgR4OJjqincaESg2eE8u4tBMFp41bWMvavy3KU
         noR64Lt1TOKmglLLoAX5i09ZFz9OcmAUQ6wwKblUAJJ8wVNCE5piEVk24BV7vyK2vBVG
         xoWW7JyeFBu/ZNXDJOUwn+HKxh3LrYvfozLH/5cjCs3lltz4gvMyKzEF8p5jAxHz2fvj
         H+kCQWUs78AfJpRyjBktHGVa/mdvAfNR5OlxGxQ5uqwO5Ak8PFBn4RkqwsFvEMz12umu
         8MBQ==
X-Gm-Message-State: AOJu0YzzIMWZ46dqBQUHM2RSvFDSeGXkDihrs3BVU7BXDw97aEro+Se3
	MBs1e/m2BdWyyN8oxGwP1ZPGkIBycAkoHfuIaHikNAcSvMPxCOndirgDXmG7KoQ3VNDQB0zTj7C
	ddes=
X-Google-Smtp-Source: AGHT+IGQB/0gfb3KcEyDbaZ2xbW2JxpYcvbN+63JibSpV4GkZgpz0Z5/PW+qpB3O9o/+rhQXzPV3xQ==
X-Received: by 2002:a17:90a:f016:b0:2c9:9f50:3f9d with SMTP id 98e67ed59e1d1-2e0b89a239bmr12389975a91.5.1727661464955;
        Sun, 29 Sep 2024 18:57:44 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0d4af744bsm5496070a91.23.2024.09.29.18.57.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 18:57:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/27] linux-yocto/6.6: update to v6.6.45
Date: Sun, 29 Sep 2024 18:57:04 -0700
Message-Id: <9a0ae731678c4f863e6bf4c83f03573e6d393eb9.1727661284.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727661284.git.steve@sakoman.com>
References: <cover.1727661284.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 01:57:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205071

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    878fbff41def Linux 6.6.45
    ee3c845787b6 mptcp: prevent BPF accessing lowat from a subflow socket.
    6f2b21806e9a selftests: mptcp: join: check backup support in signal endp
    8213b98e55ce selftests: mptcp: join: validate backup in MPJ
    ffe8c864c89f selftests: mptcp: always close input's FD if opened
    bf39cfc0236f mptcp: fix duplicate data handling
    bd1d1fc4bc61 mptcp: pm: only set request_bkup flag when sending MP_PRIO
    19bf32929bc0 mptcp: fix bad RCVPRUNED mib accounting
    6721cbaa04e5 mptcp: mib: count MPJ with backup flag
    e680e635ed06 mptcp: fix NL PM announced address accounting
    8ed3e34c766e mptcp: distinguish rcv vs sent backup flag in requests
    201b76f62453 mptcp: fix user-space PM announced address accounting
    7e927022495a r8169: don't increment tx_dropped in case of NETDEV_TX_BUSY
    f2b5be33a3b5 net: usb: sr9700: fix uninitialized variable use in sr_mdio_read
    6c0473c9ac50 drm/i915: Fix possible int overflow in skl_ddi_calculate_wrpll()
    a62c98142ca1 drm/virtio: Fix type of dma-fence context variable
    a8943969f9ea drm/vmwgfx: Fix a deadlock in dma buf fence polling
    f5043e69aeb2 Revert "ALSA: firewire-lib: operate for period elapse event in process context"
    5f8a5a1dd269 Revert "ALSA: firewire-lib: obsolete workqueue for period update"
    8dd4a10fdc00 ALSA: seq: ump: Optimize conversions from SysEx to UMP
    79d3823e1f7d ALSA: hda/realtek: Add quirk for Acer Aspire E5-574G
    b4dd36f912f2 ALSA: usb-audio: Correct surround channels in UAC1 channel map
    add243b7f6ce mptcp: sched: check both directions for backup
    da72e783afd2 protect the fetch of ->fd[fd] in do_dup2() from mispredictions
    0caf15bee7b1 btrfs: do not subtract delalloc from avail bytes
    ae29e6f764f6 btrfs: zoned: fix zone_unusable accounting on making block group read-write again
    92566c0fd72b HID: wacom: Modify pen IDs
    b8774d3137e5 platform/chrome: cros_ec_proto: Lock device when updating MKBP version
    5e5a29bd54a2 rust: SHADOW_CALL_STACK is incompatible with Rust
    dd0aaa9ac450 arm64: jump_label: Ensure patched jump_labels are visible to all CPUs
    40208cdbb2a7 riscv: Fix linear mapping checks for non-contiguous memory regions
    917f598209f3 riscv/mm: Add handling for VM_FAULT_SIGSEGV in mm_fault_error()
    fa12277fa218 perf: riscv: Fix selecting counters in legacy mode
    10b26868bfb2 riscv: remove unused functions in traps_misaligned.c
    93e2beae841b ipv6: fix ndisc_is_useropt() handling for PIO
    5635301ed5bc igc: Fix double reset adapter triggered from a single taprio cmd
    82b9a3804a8b net/mlx5e: Add a check for the return value from mlx5_port_set_eth_ptys
    daab2cc17b6b net/mlx5e: Fix CT entry update leaks of modify header context
    db4ba08c2371 net/mlx5e: Require mlx5 tc classifier action support for IPsec prio capability
    98884e89c90d net/mlx5: Fix missing lock on sync reset reload
    f6f846005d2b net/mlx5: Lag, don't use the hardcoded value of the first port
    315d00c7bc92 net/mlx5: Fix error handling in irq_pool_request_irq
    6b6c2ebd83f2 net/mlx5: Always drain health in shutdown callback
    e85b9b6a87be netfilter: iptables: Fix potential null-ptr-deref in ip6table_nat_table_init().
    70014b73d753 netfilter: iptables: Fix null-ptr-deref in iptable_nat_table_init().
    2c2868a76667 ALSA: hda: Conditionally use snooping for AMD HDMI
    2094996159b4 net: phy: micrel: Fix the KSZ9131 MDI-X status issue
    eb2926cad1cf net: mvpp2: Don't re-use loop iterator
    9541f99b2651 drm/i915/hdcp: Fix HDCP2_STREAM_STATUS macro
    01437282fd39 net/iucv: fix use after free in iucv_sock_close()
    9ac083de42b4 ice: add missing WRITE_ONCE when clearing ice_rx_ring::xdp_prog
    ac2a3c759d3a ice: replace synchronize_rcu with synchronize_net
    9016d17f4ff6 ice: don't busy wait for Rx queue disable in ice_qp_dis()
    77292f935d7e ice: respect netif readiness in AF_XDP ZC related ndo's
    582b6c7dd019 i915/perf: Remove code to update PWR_CLK_STATE for gen12
    0db00726578c rtnetlink: Don't ignore IFLA_TARGET_NETNSID when ifname is specified in rtnl_dellink().
    4ea83a051838 net: axienet: start napi before enabling Rx/Tx
    1cfdc250b3d2 tcp: Adjust clamping window for applications specifying SO_RCVBUF
    f9fef23a81db tcp: annotate data-races around tp->window_clamp
    124a4885b55f mptcp: give rcvlowat some love
    ae8853d0a382 Bluetooth: hci_sync: Fix suspending with wrong filter policy
    b0c470d67b7d Bluetooth: btintel: Fail setup on error
    bc7734418c08 ALSA: hda: conexant: Fix headset auto detect fail in the polling mode
    b45cbfa204b2 net: phy: realtek: add support for RTL8366S Gigabit PHY
    fcfb8ceafba4 wifi: cfg80211: fix reporting failed MLO links status with cfg80211_connect_done
    d7cc186d0973 sched: act_ct: take care of padding in struct zones_ht_key
    c98d6c23fbb5 drm/vmwgfx: Trigger a modeset when the screen moves
    b67643bffe2e drm/vmwgfx: Fix overlay when using Screen Targets
    f23cd66933fe drm/nouveau: prime: fix refcount underflow
    1b46b23561d8 perf tool: fix dereferencing NULL al->maps
    0a5ca73babec HID: amd_sfh: Move sensor discovery before HID device initialization
    181f9b56193d ARM: 9406/1: Fix callchain_trace() return value
    f4675c8ee758 MIPS: dts: loongson: Fix ls2k1000-rtc interrupt
    3544efb889c1 MIPS: dts: loongson: Fix liointc IRQ polarity
    fcf20dc29320 MIPS: Loongson64: DTS: Fix PCIe port nodes for ls7a
    0bcd599a0f61 perf: imx_perf: fix counter start and config sequence
    c91c8d3830fa dmaengine: fsl-edma: change the memory access from local into remote mode in i.MX 8QM
    417b64e4c823 dmaengine: fsl-edma: clean up unused "fsl,imx8qm-adma" compatible string
    ba20b7f28e54 dmaengine: fsl-edma: add i.MX8ULP edma support
    5f8de773d43c dmaengine: fsl-edma: add address for channel mux register in fsl_edma_chan
    4239571c5db4 f2fs: assign CURSEG_ALL_DATA_ATGC if blkaddr is valid
    f911be1165d6 f2fs: fix to avoid use SSR allocate when do defragment
    00fbc7ba4943 mm/page_alloc: fix pcp->count race between drain_pages_zone() vs __rmqueue_pcplist()
    4abfa277c242 mm: page_alloc: control latency caused by zone PCP draining
    dde5e5343d2b mm: restrict the pcp batch scale factor to avoid too long latency
    340bbe90cc7d fbdev: vesafb: Detect VGA compatibility from screen info's VESA attributes
    a168da3182f8 firmware/sysfb: Update screen_info for relocated EFI framebuffers
    f5dce77f3f7d video: Provide screen_info_get_pci_dev() to find screen_info's PCI device
    5b4d995dfdd0 video: Add helpers for decoding screen_info
    bab0a828543a fbdev/vesafb: Replace references to global screen_info by local pointer
    ccab04dc573e PCI: Add pci_get_base_class() helper
    43e73206cf46 KVM: nVMX: Check for pending posted interrupts when looking for nested events
    459403bc66a9 KVM: nVMX: Add a helper to get highest pending from Posted Interrupt vector
    65b2514e0392 KVM: VMX: Move posted interrupt descriptor out of VMX code
    ebfed7bebd9e KVM: VMX: Split off vmx_onhyperv.{ch} from hyperv.{ch}
    93ac74cd6fef leds: triggers: Flush pending brightness before activating trigger
    9ce3c14f0d3c leds: trigger: Call synchronize_rcu() before calling trig->activate()
    587cf9c0f76e leds: trigger: Store brightness set by led_trigger_event()
    73a26eada593 leds: trigger: Remove unused function led_trigger_rename_static()
    e3fd01a81053 cpufreq: qcom-nvmem: fix memory leaks in probe error paths
    51a45209a8bf cpufreq: qcom-nvmem: Simplify driver data allocation
    df7363307ead ext4: check the extent status again before inserting delalloc block
    f12fbb9599e2 ext4: factor out a common helper to query extent map
    c6cba59072c6 ext4: convert to exclusive lock while inserting delalloc extents
    7849e9b5ba87 ext4: refactor ext4_da_map_blocks()
    ffde3af4b29b sysctl: always initialize i_uid/i_gid
    96f1d909cdd7 sysctl: treewide: drop unused argument ctl_table_root::set_ownership(table)
    13886221ad7c sysctl: allow to change limits for posix messages queues
    8d5b1a9ff844 sysctl: allow change system v ipc sysctls inside ipc namespace
    34e788045d0c thermal/drivers/broadcom: Fix race between removal and clock disable
    103881e6363c thermal: bcm2835: Convert to platform remove callback returning void
    0b4e4da51e28 arm64: dts: qcom: sdm845: Disable SS instance in Parkmode for USB
    a27753e685e5 arm64: dts: qcom: sdm845: switch USB QMP PHY to new style of bindings
    affc4de9451e arm64: dts: qcom: sdm845: switch USB+DP QMP PHY to new style of bindings
    1a0bff67f491 arm64: dts: qcom: ipq8074: Disable SS instance in Parkmode for USB
    cd4f3ad55bfb arm64: dts: qcom: msm8998: Disable SS instance in Parkmode for USB
    267a485c1573 arm64: dts: qcom: msm8998: switch USB QMP PHY to new style of bindings
    5bf33793d18a arm64: dts: qcom: sc7280: Disable SuperSpeed instances in park mode
    f879a830862f arm64: dts: qcom: sc7280: switch USB+DP QMP PHY to new style of bindings
    fde04340358d arm64: dts: qcom: sc7180: Disable SuperSpeed instances in park mode
    2359355ddfaf arm64: dts: qcom: sc7180: switch USB+DP QMP PHY to new style of bindings
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
(cherry picked from commit 00878005c6a398db70efc29b46424d9b8233024c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index f73661c84a..ae56e8a129 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "d9fad680399f7443d173322d9a0112bf98ca7da4"
-SRCREV_meta ?= "4a494b202029e94a72ebb3c3966d9f1d249900f3"
+SRCREV_machine ?= "9a1d7ebfd75c70dcec660e18124a37de469e68b4"
+SRCREV_meta ?= "e55e4407942bae43ef8ba463b38e48995b023187"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.44"
+LINUX_VERSION ?= "6.6.45"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 15a0bbb0dc..b0e4ab71ae 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.44"
+LINUX_VERSION ?= "6.6.45"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "43ea1c5e6eb3c62ff9bcb45b01728e1a5dff7c11"
-SRCREV_meta ?= "4a494b202029e94a72ebb3c3966d9f1d249900f3"
+SRCREV_machine ?= "e402da9835bfae267f409a48c3a2cb6e231f9d94"
+SRCREV_meta ?= "e55e4407942bae43ef8ba463b38e48995b023187"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index c0a8d5e77f..d8f67c3518 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "2d8c7205265cc1c6e29a3364a75a27bc9ba778cd"
-SRCREV_machine:qemuarm64 ?= "43ea1c5e6eb3c62ff9bcb45b01728e1a5dff7c11"
-SRCREV_machine:qemuloongarch64 ?= "43ea1c5e6eb3c62ff9bcb45b01728e1a5dff7c11"
-SRCREV_machine:qemumips ?= "9754a9326e9c11b63586d7a90a79ad6a0f8fbb41"
-SRCREV_machine:qemuppc ?= "43ea1c5e6eb3c62ff9bcb45b01728e1a5dff7c11"
-SRCREV_machine:qemuriscv64 ?= "43ea1c5e6eb3c62ff9bcb45b01728e1a5dff7c11"
-SRCREV_machine:qemuriscv32 ?= "43ea1c5e6eb3c62ff9bcb45b01728e1a5dff7c11"
-SRCREV_machine:qemux86 ?= "43ea1c5e6eb3c62ff9bcb45b01728e1a5dff7c11"
-SRCREV_machine:qemux86-64 ?= "43ea1c5e6eb3c62ff9bcb45b01728e1a5dff7c11"
-SRCREV_machine:qemumips64 ?= "7958022dd42f6796c174c33d99dedd75bfd1c22b"
-SRCREV_machine ?= "43ea1c5e6eb3c62ff9bcb45b01728e1a5dff7c11"
-SRCREV_meta ?= "4a494b202029e94a72ebb3c3966d9f1d249900f3"
+SRCREV_machine:qemuarm ?= "0b3ad2691600c3f3899e3a5afd7a42d8b4c3f650"
+SRCREV_machine:qemuarm64 ?= "e402da9835bfae267f409a48c3a2cb6e231f9d94"
+SRCREV_machine:qemuloongarch64 ?= "e402da9835bfae267f409a48c3a2cb6e231f9d94"
+SRCREV_machine:qemumips ?= "e6c52087c139d2418c1dfec5ea7fcb046de37981"
+SRCREV_machine:qemuppc ?= "e402da9835bfae267f409a48c3a2cb6e231f9d94"
+SRCREV_machine:qemuriscv64 ?= "e402da9835bfae267f409a48c3a2cb6e231f9d94"
+SRCREV_machine:qemuriscv32 ?= "e402da9835bfae267f409a48c3a2cb6e231f9d94"
+SRCREV_machine:qemux86 ?= "e402da9835bfae267f409a48c3a2cb6e231f9d94"
+SRCREV_machine:qemux86-64 ?= "e402da9835bfae267f409a48c3a2cb6e231f9d94"
+SRCREV_machine:qemumips64 ?= "97d2336ea9ce4eac6b30a75b26f33b83827d38aa"
+SRCREV_machine ?= "e402da9835bfae267f409a48c3a2cb6e231f9d94"
+SRCREV_meta ?= "e55e4407942bae43ef8ba463b38e48995b023187"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "7213910600667c51c978e577bf5454d3f7b313b7"
+SRCREV_machine:class-devupstream ?= "878fbff41def4649a2884e9d33bb423f5a7726b0"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.44"
+LINUX_VERSION ?= "6.6.45"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


