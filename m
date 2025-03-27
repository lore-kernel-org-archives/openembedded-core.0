Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B29C36014
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 19:44:38 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.5283.1743104677549173945
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 12:44:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=M1bc6fhn;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-223f4c06e9fso27556485ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 12:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1743104677; x=1743709477; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=crdnX+IJ8rUQOsMHwDLW6FJWxKUzugbAFb2PhmvUQPM=;
        b=M1bc6fhnNc9dUL1ax7hX1qti1nOMFrXc9Op0ityXa79DkduFGD7xUTVnL8O3xUtw8S
         JjaRJBEY/YKQbuxQy8hr0ASp+0Hi6l4hp7QhotsfGqIRSxzb/n1yBVq8yJUo6AiAxZ1+
         5OxnTpTr7VaAW5dJ7hKWyABu1qteARU+41rNBBuUCaEyvlwd/CciULjulOqO+9XvPio+
         LorZtuLv8anr9G+K8YeiMCKWMH1OqYVqg/En8QL+V7rSKSwVEyTRMnRsNA9uA641r9BK
         2q3wz7/PcCIma7ryHlx1fNFyc4Akp8BhxhDVODdD69MZ8SlYqEgFAcD7Dysl/QoQqBJ1
         RgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104677; x=1743709477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=crdnX+IJ8rUQOsMHwDLW6FJWxKUzugbAFb2PhmvUQPM=;
        b=u+ZpmtyMZyBIF03lmb5+9PU9eAtl0UrXqVV6QKWT3N3hrb84Dy5EydIZvAs/L63Qyj
         /m4lmulO7mr/ZnhjT3QPqZof2MAqFwnFLDNw0axfKVtjgAv8iMGSak/Dz/ePQKVeKN7L
         YhWi4UAaPPw3q6etJyF5n6tWP3wR6lblZHoS7aiQXrFhAC5Nv9AmRuV6wcDxCCEN4jKR
         59nK9v1n32MZUnGe6msoIgCihnJn+P6mG0xrc+gw9ubhN8hpl7ssggxfPgKmimz15AMv
         mchx4fqeajtKKoLzZKKdbhIvApBehNVrVXnRmSbJZLscKxeLeK3f2qFcSkLeMz12ULGv
         qUGg==
X-Gm-Message-State: AOJu0YxJ8emi42WzCc/RMnZEJm6kLEmcpjI1Au6Gbf0yOagkVanxMPaq
	bxOPTIcw6pNwViH3chuG1oTHnlFCV4cQhJL/3PXl9XOuB3zjqvVS7GSAQ+ofKidtP2OWSFIOrc4
	H
X-Gm-Gg: ASbGnctBZtLt0dK16E6N+lA2jlJxiuxVLuUgg1TmJqwWsMtrnsBvrQ9U2YKosDEaNcg
	JploHxvlwP9W72C7plaUW/cpR5XY1njJBaLyW17IpEBjxi3u9AmfBDN3qT6a4tic7pYLuQx9P08
	ygRabEhRv06r0K0Ud294BB+8tPpoLW3eiCoeV961J7nKYERqWr4XmnnMaD16QJmzxYnXv3jyQOc
	qkHOEaWsVVYr/+KlTEKDPrSU4ecK4hVqAkcxjA3zHE8g7n/rQ3cViqPVrodH92A3+ZCH1tGVpS0
	mSh3rEbrwcmurVFAr1CYmZzBJA84ytiDqjY=
X-Google-Smtp-Source: AGHT+IFCoawuVYpbeOdWJojfH+2djSxK6iiIcTgqx22LdpU315s5dxyjbklz3A4AlJ6YdC10R78i2Q==
X-Received: by 2002:a17:902:e54b:b0:21f:2e:4e4e with SMTP id d9443c01a7336-22921e5b5afmr578535ad.5.1743104676014;
        Thu, 27 Mar 2025 12:44:36 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:811c:968e:2c1:6363])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee0882sm3865875ad.75.2025.03.27.12.44.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:44:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/10] linux-yocto/6.6: update to v6.6.82
Date: Thu, 27 Mar 2025 12:44:12 -0700
Message-ID: <6c80848cd9ee79d7e92bcdbe9cbbc55b47645ac9.1743104524.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743104524.git.steve@sakoman.com>
References: <cover.1743104524.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 19:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213783

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    1998f703f4d7 Linux 6.6.82
    c92bd953243b x86/boot/32: Temporarily map initrd for microcode loading
    d4c860bb425d x86/microcode: Provide CONFIG_MICROCODE_INITRD32
    258f72d0acb5 x86/boot/32: Restructure mk_early_pgtbl_32()
    fa23256c09f0 x86/boot/32: De-uglify the 2/3 level paging difference in mk_early_pgtbl_32()
    5b10ecbadbaa x86/boot: Use __pa_nodebug() in mk_early_pgtbl_32()
    5fd09dda0ae0 x86/boot/32: Disable stackprotector and tracing for mk_early_pgtbl_32()
    640fad833ddc Linux 6.6.81
    57479e37d3f6 scsi: ufs: core: Cancel RTC work during ufshcd_remove()
    6e34b9d7caa5 scsi: ufs: core: Start the RTC update work later
    9aa1f0da237d scsi: ufs: core: Fix another deadlock during RTC update
    98a44622be2f x86/microcode/AMD: Fix a -Wsometimes-uninitialized clang false positive
    a4921b76bc94 scsi: ufs: core: Fix deadlock during RTC update
    bef830144feb x86/microcode/AMD: Load only SHA256-checksummed patches
    12412835e296 x86/microcode/AMD: Add get_patch_level()
    5e253de2e514 x86/microcode/AMD: Get rid of the _load_microcode_amd() forward declaration
    8a76fed3e5d1 x86/microcode/AMD: Merge early_apply_microcode() into its single callsite
    be5a41a9b5e4 x86/microcode/AMD: Have __apply_microcode_amd() return bool
    1f4caaf02c7c x86/microcode/AMD: Make __verify_patch_size() return bool
    5b330c18c1e4 x86/microcode/AMD: Return bool from find_blobs_in_containers()
    60675acfbc07 x86/microcode/AMD: Flush patch buffer mapping after application
    d31d50b35d35 x86/microcode/intel: Remove unnecessary cache writeback and invalidation
    9b86a44ea2c2 x86/microcode/AMD: Split load_microcode_amd()
    e7b2ccfed0d0 x86/microcode/AMD: Pay attention to the stepping dynamically
    0433b8e9f4a2 x86/microcode/AMD: Use the family,model,stepping encoded in the patch ID
    dbdf088ff85c x86/microcode/intel: Set new revision only after a successful update
    73aba0a0df21 x86/microcode: Rework early revisions reporting
    fba6e6fcabf3 x86/microcode: Prepare for minimal revision check
    287a86b4a4cb x86/microcode: Handle "offline" CPUs correctly
    8390133d68ac x86/apic: Provide apic_force_nmi_on_cpu()
    f2be90992d52 x86/microcode: Protect against instrumentation
    52b5dd846ff2 x86/microcode: Rendezvous and load in NMI
    9c31ea5b1be5 x86/microcode: Replace the all-in-one rendevous handler
    058370ffef99 x86/microcode: Provide new control functions
    08631b02ad07 x86/microcode: Add per CPU control field
    05baf15d045f x86/microcode: Add per CPU result state
    738aa6b98613 x86/microcode: Sanitize __wait_for_cpus()
    346bc32a465d x86/microcode: Clarify the late load logic
    7412a65d9562 x86/microcode: Handle "nosmt" correctly
    bb9646a9e45c x86/microcode: Clean up mc_cpu_down_prep()
    32096e8c3dac x86/microcode: Get rid of the schedule work indirection
    b42122933da3 x86/microcode: Mop up early loading leftovers
    021ab466701c x86/microcode/amd: Use cached microcode for AP load
    628478b1e42c x86/microcode/amd: Cache builtin/initrd microcode early
    b1bcf0d973ae x86/microcode/amd: Cache builtin microcode too
    465e490c986d x86/microcode/amd: Use correct per CPU ucode_cpu_info
    5481c4a48cbb x86/microcode: Remove pointless apply() invocation
    433f975e60fa x86/microcode/intel: Rework intel_find_matching_signature()
    15fd553a54f5 x86/microcode/intel: Reuse intel_cpu_collect_info()
    198ea646360d x86/microcode/intel: Rework intel_cpu_collect_info()
    149e3e4ad2eb x86/microcode/intel: Unify microcode apply() functions
    b6365c7c6cac x86/microcode/intel: Switch to kvmalloc()
    abbe616adec4 x86/microcode/intel: Save the microcode only after a successful late-load
    1dcf3264c173 x86/microcode/intel: Simplify early loading
    53d07dfbac0d x86/microcode/intel: Cleanup code further
    1092852de036 x86/microcode/intel: Simplify and rename generic_load_microcode()
    cc049de7c9a2 x86/microcode/intel: Simplify scan_microcode()
    67f9ed54896a x86/microcode/intel: Rip out mixed stepping support for Intel CPUs
    4a148d0054f3 x86/microcode/32: Move early loading after paging enable
    bcc87e2e0163 arm64: dts: rockchip: Disable DMA for uart5 on px30-ringneck
    3b7d2d1b42d2 intel_idle: Handle older CPUs, which stop the TSC in deeper C states, correctly
    9921e266029c gve: set xdp redirect target only when it is available
    c52d6aaf8ee8 amdgpu/pm/legacy: fix suspend/resume issues
    39854d382125 rtla/timerlat_top: Set OSNOISE_WORKLOAD for kernel threads
    129b81f6912f rtla/timerlat_hist: Set OSNOISE_WORKLOAD for kernel threads
    7ec6b4bd2900 Revert "rtla/timerlat_hist: Set OSNOISE_WORKLOAD for kernel threads"
    736b206d4e06 Revert "rtla/timerlat_top: Set OSNOISE_WORKLOAD for kernel threads"
    687322acb1eb riscv: signal: fix signal frame size
    06316f435b0f riscv/futex: sign extend compare value in atomic cmpxchg
    d82826201ffe rseq/selftests: Fix riscv rseq_offset_deref_addv inline asm
    32fb5ec825f6 scsi: ufs: core: bsg: Fix crash when arpmb command fails
    68786ab0935c sched/core: Prevent rescheduling when interrupts are disabled
    1d26aaa86124 rcuref: Plug slowpath race in rcuref_put()
    3df2bf42a03c vmlinux.lds: Ensure that const vars with relocations are mapped R/O
    3d7e7ef8fa1a mptcp: reset when MPTCP opts are dropped after join
    a05da2be18aa mptcp: always handle address removal under msk socket lock
    4bddfde8b692 phy: exynos5-usbdrd: fix MPLL_MULTIPLIER and SSC_REFCLKSEL masks in refclk
    9e728c1149f8 phy: tegra: xusb: reset VBUS & ID OVERRIDE
    12733d6e442a net: enetc: fix the off-by-one issue in enetc_map_tx_tso_buffs()
    093d1753b857 net: enetc: correct the xdp_tx statistics
    3e89f019d8cb net: enetc: update UDP checksum when updating originTimestamp field
    5642c3aa1690 net: enetc: keep track of correct Tx BD count in enetc_map_tx_tso_buffs()
    9561b0550c49 net: enetc: fix the off-by-one issue in enetc_map_tx_buffs()
    a2ee5e55b50a usbnet: gl620a: fix endpoint checking in genelink_bind()
    3035581db280 i2c: ls2x: Fix frequency division register access
    1b267e1b87d5 i2c: npcm: disable interrupt enable bit before devm_request_irq
    739f35f027ae drm/amd/display: Fix HPD after gpu reset
    574b3cf0412e drm/amd/display: Disable PSR-SU on eDP panels
    01d516530474 perf/core: Fix low freq setting via IOC_PERIOD
    dc972fd125e7 perf/x86: Fix low freqency setting issue
    f390c2eea571 perf/core: Add RCU read lock protection to perf_iterate_ctx()
    0bd89017e4e1 ALSA: hda/realtek: Fix microphone regression on ASUS N705UD
    e9839cf12e9f ALSA: usb-audio: Re-add sample rate quirk for Pioneer DJM-900NXS2
    f58a3f8e284d ftrace: Avoid potential division by zero in function_stat_show()
    43b254d46c74 tracing: Fix bad hist from corrupting named_triggers list
    2e06f42e88fc riscv: KVM: Fix SBI TIME error generation
    f9dd51830d30 riscv: KVM: Fix SBI IPI error generation
    9111be8870e1 riscv: KVM: Fix hart suspend status check
    c1a524d7f762 RISCV: KVM: Introduce mp_state_lock to avoid lock inversion
    57b243058dc2 phy: rockchip: naneng-combphy: compatible reset with old DT
    788f6b5474a7 x86/CPU: Fix warm boot hang regression on AMD SC1100 SoC systems
    685da33c81d0 io_uring/net: save msg_control for compat
    0b6f19714588 uprobes: Reject the shared zeropage in uprobe_write_opcode()
    f0c3971405ce perf/core: Order the PMU list to fix warning about unordered pmu_ctx_list
    973421d5862b net: ti: icss-iep: Reject perout generation request
    8a299cc110a3 net: ti: icss-iep: Remove spinlock-based synchronization
    73b769252d69 net: ipv6: fix dst ref loop on input in rpl lwt
    25d8e065c797 net: ipv6: rpl_iptunnel: mitigate 2-realloc issue
    c441f9281d7a net: ipv6: fix dst ref loop on input in seg6 lwt
    ab9de9c48316 net: ipv6: seg6_iptunnel: mitigate 2-realloc issue
    665d91b0e465 include: net: add static inline dst_dev_overhead() to dst.h
    0df388df81fb net/mlx5: IRQ, Fix null string in debug print
    e79a4da90926 net: mvpp2: cls: Fixed Non IP flow, with vlan tag flow defination.
    28e5a2d14340 net: Clear old fragment checksum value in napi_reuse_skb
    e8352f7e1e81 tcp: Defer ts_recent changes until req is owned
    3c01102bec95 ice: Fix deinitializing VF in error path
    52a98adcc48e ice: add E830 HW VF mailbox message limit support
    88f7ac6c4fce ice: Add E830 device IDs, MAC type and registers
    ab82f7a80b64 ALSA: hda/realtek: Fix wrong mic setup for ASUS VivoBook 15
    b0738e182e75 ALSA: hda/realtek: Add quirks for ASUS ROG 2023 models
    26c8641769f0 firmware: cs_dsp: Remove async regmap writes
    abdbedfe8974 ipvs: Always clear ipvs_property flag in skb_scrub_packet()
    53cdb4c36830 ASoC: es8328: fix route from DAC to output
    5d7d7e5b6cf9 net: cadence: macb: Synchronize stats calculations
    4ec48f812804 ipvlan: ensure network headers are in skb linear part
    cc6c6b7a2fe9 ipvlan: Prepare ipvlan_process_v4_outbound() to future .flowi4_tos conversion.
    661c63cb34cf ipv4: Convert ip_route_input() to dscp_t.
    7dde0ade0d66 ipv4: Convert icmp_route_lookup() to dscp_t.
    ed8f499f87ce ipvlan: Unmask upper DSCP bits in ipvlan_process_v4_outbound()
    35c4d95749f5 ipv4: icmp: Unmask upper DSCP bits in icmp_route_lookup()
    6631345c8fb2 ipv4: icmp: Pass full DS field to ip_route_input()
    21b28f97e621 net/ipv4: add tracepoint for icmp_send
    5f303538c393 net: set the minimum for net_hotdata.netdev_budget_usecs
    799556c2f976 net: loopback: Avoid sending IP packets without an Ethernet header
    51dc41111089 afs: Fix the server_list to unuse a displaced server rather than putting it
    0b2bf6fb5353 afs: Make it possible to find the volumes that are using a server
    2c8de882158d rxrpc: rxperf: Fix missing decoding of terminal magic cookie
    fbe5582ad767 Bluetooth: L2CAP: Fix L2CAP_ECRED_CONN_RSP response
    790e85fc3223 ALSA: usb-audio: Avoid dropping MIDI events at closing multiple ports
    df7d2f8bcb15 sunrpc: suppress warnings for unused procfs functions
    b0c5a8977e2c RDMA/mlx5: Fix bind QP error cleanup flow
    06518de45eba scsi: core: Clear driver private data when retrying request
    876fe386df5d RDMA/mlx5: Fix AH static rate parsing
    b993c450f94d IB/core: Add support for XDR link speed
    fc238db6bffa SUNRPC: Handle -ETIMEDOUT return from tlshd
    c688d2d8b0d8 SUNRPC: Prevent looping due to rpc_signal_task() races
    93200181c56e SUNRPC: convert RPC_TASK_* constants to enum
    64455c8051c3 ovl: fix UAF in ovl_dentry_update_reval by moving dput() in ovl_link_up
    abc1d60a0205 scsi: ufs: core: Fix ufshcd_is_ufs_dev_busy() and ufshcd_eh_timed_out()
    3f82f8ae0d20 scsi: ufs: core: Prepare to introduce a new clock_gating lock
    21641160fb31 scsi: ufs: core: Introduce ufshcd_has_pending_tasks()
    06701a545e9a scsi: ufs: core: Add UFS RTC support
    372b9333e078 scsi: ufs: core: Add ufshcd_is_ufs_dev_busy()
    44247323d75c RDMA/mana_ib: Allocate PAGE aligned doorbell index
    8f16e0b94ab5 IB/mlx5: Set and get correct qp_num for a DCT QP
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
index 475b1624b4..b3e766b63a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "d40fd6f42b7a694c9689ad24b64d75e8c37d0d03"
-SRCREV_meta ?= "8cfcad6ed49d8b56dc69640d30ab834ff5e44aff"
+SRCREV_machine ?= "458408eab7fb1123f5ffc22454372b7e7b80de52"
+SRCREV_meta ?= "96445f165c819b9f956014acbd7e4a100a43a83c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.80"
+LINUX_VERSION ?= "6.6.82"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index b2a72d90f7..5ec2173ba6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.80"
+LINUX_VERSION ?= "6.6.82"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "67833ae0fc57611f518d03e5c2893ce307d9dd0c"
-SRCREV_meta ?= "8cfcad6ed49d8b56dc69640d30ab834ff5e44aff"
+SRCREV_machine ?= "36b434b4de69ef3a471d99949cff8aa0382c95bf"
+SRCREV_meta ?= "96445f165c819b9f956014acbd7e4a100a43a83c"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index f8e87b7b94..3512bbe4f1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "58ba48e28b43669926b14db3e026a23a0fc24e4d"
-SRCREV_machine:qemuarm64 ?= "67833ae0fc57611f518d03e5c2893ce307d9dd0c"
-SRCREV_machine:qemuloongarch64 ?= "67833ae0fc57611f518d03e5c2893ce307d9dd0c"
-SRCREV_machine:qemumips ?= "45ca988f1aca2de0a5436d019a82f1242e8de1e9"
-SRCREV_machine:qemuppc ?= "67833ae0fc57611f518d03e5c2893ce307d9dd0c"
-SRCREV_machine:qemuriscv64 ?= "67833ae0fc57611f518d03e5c2893ce307d9dd0c"
-SRCREV_machine:qemuriscv32 ?= "67833ae0fc57611f518d03e5c2893ce307d9dd0c"
-SRCREV_machine:qemux86 ?= "67833ae0fc57611f518d03e5c2893ce307d9dd0c"
-SRCREV_machine:qemux86-64 ?= "67833ae0fc57611f518d03e5c2893ce307d9dd0c"
-SRCREV_machine:qemumips64 ?= "589ba875b2fbf6bb45bb13ac36cc06d2ff54f7cb"
-SRCREV_machine ?= "67833ae0fc57611f518d03e5c2893ce307d9dd0c"
-SRCREV_meta ?= "8cfcad6ed49d8b56dc69640d30ab834ff5e44aff"
+SRCREV_machine:qemuarm ?= "c8f9b207913b334dc5f2165d1fb9dc28087ea907"
+SRCREV_machine:qemuarm64 ?= "e8f447b84e7d27ed243deca13698c67c3ef0cc0a"
+SRCREV_machine:qemuloongarch64 ?= "6fd6fb79fbafacc33fde3b3123e7b9daaedf8afd"
+SRCREV_machine:qemumips ?= "a47313507e1e2a8109051b502f24f400c3412ce3"
+SRCREV_machine:qemuppc ?= "1f6d3705ba7c8d76ffce71a26000813d8aea4f15"
+SRCREV_machine:qemuriscv64 ?= "6fd6fb79fbafacc33fde3b3123e7b9daaedf8afd"
+SRCREV_machine:qemuriscv32 ?= "6fd6fb79fbafacc33fde3b3123e7b9daaedf8afd"
+SRCREV_machine:qemux86 ?= "6fd6fb79fbafacc33fde3b3123e7b9daaedf8afd"
+SRCREV_machine:qemux86-64 ?= "6fd6fb79fbafacc33fde3b3123e7b9daaedf8afd"
+SRCREV_machine:qemumips64 ?= "90822bcfa923f56bec13f149fcd25787d1308e2d"
+SRCREV_machine ?= "6fd6fb79fbafacc33fde3b3123e7b9daaedf8afd"
+SRCREV_meta ?= "96445f165c819b9f956014acbd7e4a100a43a83c"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "568e253c3e3bdfecf5a4d65ccc8fc971c6c4b31f"
+SRCREV_machine:class-devupstream ?= "1998f703f4d758abe45df7fd8bb8ccf2f59f3848"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.80"
+LINUX_VERSION ?= "6.6.82"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


