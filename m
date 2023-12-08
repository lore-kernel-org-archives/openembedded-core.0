Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98417C46CA3
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 02:33:49 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.11236.1702002828417775720
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 18:33:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Ce5PrlvP;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d03bcf27e9so13953855ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 18:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702002827; x=1702607627; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MdQvsXJo7YpE1utFu96weiKp/RUmobGvMfrXmbdrZHc=;
        b=Ce5PrlvPJgbsprfaTgm4L9RGYTZop/MHlHLpLSaOO0ry5W1ksdDxXvkiQf0Uuqtpc1
         vj4cn7ylWtp59lQ8pkE4dFeiAMOkWskrnjGbjqrKwLiX8OGoYvSWNmwp/1AWJCpN3ygE
         zu304CHqfFiADZFKgwAgSCVoPGIScrsL8+2B7lehLP4Cwjk5FdnIosNIUN4mpn+91+Uo
         CXSSx/R+X7CzcijSp79xSm/nXO/zMksYspb3Ac6jEmi8r/9wvD4s16yWNClPV6inkSW+
         aYhoM+0PQ/FiwjZFWOLL0LCDEqO4RS3XT4Naq2OJPwEpZ/cmjDVL3bRTkC4b+DwTNs6J
         OGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702002827; x=1702607627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MdQvsXJo7YpE1utFu96weiKp/RUmobGvMfrXmbdrZHc=;
        b=iGdIVw5/vAQXLp/TJgQFNr37BlFlbfPuwJgt8vRHEf52C9a0tYKBIW4M34OjaZjdnJ
         CeQXno/mKFmR0Qe8UF1odeUf9ZwQuDpFZnVp4v8pBGfIQR3E/Fu+4NXLQNWDi31+vU/b
         E1QojT2+f40AyoB1Jdp4PqDC+Q2w+nonFxqb8HUWDJJUgmoBtb/TWfk2UvLvQrv+FZLT
         Fi3Bybj1ecVuDDWalBLhD3R5Mhc1zHQSMnSnEKOSXlil70ATYRgTR+rLzuQqJ4U9pjia
         wTM912M0GaopUkKbOWySFxA62jVHw+bW2zXcqmV7rbYiSzUMvVe/LXGSPfYZIZQCqqzG
         ylXg==
X-Gm-Message-State: AOJu0YxWFWHFXe4ioHGkvOR0XAOjzEp7VDbNCV4Lq/nCeAScbC1F6la5
	xEiA0/e5JgPPG0CSKoiPJFw/xFBhvqFCVy7Lb1Q=
X-Google-Smtp-Source: AGHT+IHpU/CSSVlv+YeTZc7Gy/kJCEWUDFFJvIBa2T03ozYDlUx42ubLUkxTiHoXuMcJY/bMW+07fA==
X-Received: by 2002:a17:903:22c1:b0:1d0:6ffe:1e68 with SMTP id y1-20020a17090322c100b001d06ffe1e68mr3139407plg.75.1702002826709;
        Thu, 07 Dec 2023 18:33:46 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id i11-20020a170902c94b00b001c9bc811d4dsm499752pla.295.2023.12.07.18.33.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 18:33:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/15] linux-yocto/5.10: update to v5.10.202
Date: Thu,  7 Dec 2023 16:33:13 -1000
Message-Id: <8f2c31ddd3b93f3f3e4eee5f3e97c84167f54dc4.1702002667.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702002667.git.steve@sakoman.com>
References: <cover.1702002667.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 02:33:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191999

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    479e8b892541 Linux 5.10.202
    610057f4f6e0 interconnect: qcom: Add support for mask-based BCMs
    7ce66afcaaf6 netfilter: nf_tables: disable toggling dormant table state more than once
    d9c4da8cb74e netfilter: nf_tables: fix table flag updates
    7d1d3f113425 netfilter: nftables: update table flags from the commit phase
    a98172e36e5f tracing: Have trace_event_file have ref counters
    c6e8af2a8a63 io_uring/fdinfo: lock SQ thread while retrieving thread cpu/pid
    aeeb1ad2dd4e drm/amd/display: Change the DMCUB mailbox memory location from FB to inbox
    e2bdd437886c drm/amdgpu: fix error handling in amdgpu_bo_list_get()
    dfa8e63ca527 drm/amd/pm: Handle non-terminated overdrive commands.
    7dc933b4b498 ext4: remove gdb backup copy for meta bg in setup_new_flex_group_blocks
    0932764fb54a ext4: correct the start block of counting reserved clusters
    3c1ad03a5ff2 ext4: correct return value of ext4_convert_meta_bg
    d739a7e38944 ext4: correct offset of gdb backup in non meta_bg group to update_backups
    c878db71edc0 ext4: apply umask if ACL support is disabled
    3a51aee542b0 Revert "net: r8169: Disable multicast filter for RTL8168H and RTL8107E"
    f6e014b5eb1d media: qcom: camss: Fix vfe_get() error jump
    e2d2e266089d mm: kmem: drop __GFP_NOFAIL when allocating objcg vectors
    6875820f36bf nfsd: fix file memleak on client_opens_release
    b51b20c018c6 media: venus: hfi: add checks to handle capabilities from firmware
    bcee276a1e02 media: venus: hfi: fix the check to handle session buffer requirement
    da240b7bada2 media: venus: hfi_parser: Add check to keep the number of codecs within range
    0f887306bd8b media: sharp: fix sharp encoding
    dfa9f4ea6502 media: lirc: drop trailing space from scancode transmit
    c041f5ddef00 f2fs: avoid format-overflow warning
    829f0d5231b7 i2c: i801: fix potential race in i801_block_transaction_byte_by_byte
    430603f6de33 net: phylink: initialize carrier state at creation
    4dc0484e90a3 net: dsa: lan9303: consequently nested-lock physical MDIO
    cb1006640cb3 i2c: designware: Disable TX_EMPTY irq while waiting for block length byte
    8e29eebe4c39 lsm: fix default return value for inode_getsecctx
    8327f50442d2 lsm: fix default return value for vm_enough_memory
    a011391f019c Revert ncsi: Propagate carrier gain/loss events to the NCSI controller
    969d994612ff arm64: dts: qcom: ipq6018: Fix tcsr_mutex register size
    2b3931eb8e9c arm64: dts: qcom: ipq6018: switch TCSR mutex to MMIO
    bdda1c356d58 PCI: exynos: Don't discard .remove() callback
    62d15b6a6ec9 Bluetooth: btusb: Add 0bda:b85b for Fn-Link RTL8852BE
    dbbf3c456002 Bluetooth: btusb: Add RTW8852BE device 13d3:3570 to device tables
    990d4c76d254 bluetooth: Add device 13d3:3571 to device tables
    3aba34baa4fb bluetooth: Add device 0bda:887b to device tables
    0952747362c1 Bluetooth: btusb: Add Realtek RTL8852BE support ID 0x0cb8:0xc559
    8617305611c1 cpufreq: stats: Fix buffer overflow detection in trans_stats()
    2ed25af15b32 tty: serial: meson: fix hard LOCKUP on crtscts mode
    07c61839582d serial: meson: Use platform_get_irq() to get the interrupt
    980c3135f1ae tty: serial: meson: retrieve port FIFO size from DT
    1e66cd408353 serial: meson: remove redundant initialization of variable id
    ba30578def84 ALSA: hda/realtek - Enable internal speaker of ASUS K6500ZC
    ddd47d8d1ba6 ALSA: hda/realtek - Add Dell ALC295 to pin fall back table
    a681d28b973f ALSA: info: Fix potential deadlock at disconnection
    f04fa1e1997f xhci: Enable RPM on controllers that support low-power states
    5e34fe50a976 parisc/pgtable: Do not drop upper 5 address bits of physical address
    064c697cac4b parisc: Prevent booting 64-bit kernels on PA1.x machines
    c6effcdd7dd0 i3c: master: cdns: Fix reading status register
    76320f05b99d mtd: cfi_cmdset_0001: Byte swap OTP info
    dce3e7c40055 mm/memory_hotplug: use pfn math in place of direct struct page manipulation
    63d2023fbbe1 mm/cma: use nth_page() in place of direct struct page manipulation
    d24340f08104 dmaengine: stm32-mdma: correct desc prep when channel running
    788322e1ede6 mcb: fix error handling for different scenarios when parsing
    25284c46b657 i2c: core: Run atomic i2c xfer when !preemptible
    8f8fc95b3a7f kernel/reboot: emergency_restart: Set correct system_state
    9386f59759b4 quota: explicitly forbid quota files from being encrypted
    f729cf6f3217 jbd2: fix potential data lost in recovering journal raced with synchronizing fs bdev
    db5ebaeb8fda PCI: keystone: Don't discard .probe() callback
    2bcdc1b6b61e PCI: keystone: Don't discard .remove() callback
    943347e53a75 genirq/generic_chip: Make irq_remove_generic_chip() irqdomain aware
    b2c194fe8f31 mmc: meson-gx: Remove setting of CMD_CFG_ERROR
    03ed26935beb wifi: ath11k: fix htt pktlog locking
    f882f5190551 wifi: ath11k: fix dfs radar event locking
    c3f61ca48612 wifi: ath11k: fix temperature event locking
    cd5a262a07a5 ima: detect changes to the backing overlay file
    df4133ebc86a firmware: qcom_scm: use 64-bit calling convention only when client is 64-bit
    76211f1dd91d btrfs: don't arbitrarily slow down delalloc if we're committing
    175f4b062f69 rcu: kmemleak: Ignore kmemleak false positives when RCU-freeing objects
    3c1c1af25d45 PM: hibernate: Clean up sync_read handling in snapshot_write_next()
    df8363e468f2 PM: hibernate: Use __get_safe_page() rather than touching the list
    21bc829337ca arm64: dts: qcom: ipq6018: Fix hwlock index for SMEM
    1fd46d32772d PCI/ASPM: Fix L1 substate handling in aspm_attr_store_common()
    e3ed58ee4e4a mmc: sdhci_am654: fix start loop index for TAP value parsing
    198366a5ffe6 mmc: vub300: fix an error code
    3a4431014cfb clk: qcom: ipq6018: drop the CLK_SET_RATE_PARENT flag from PLL clocks
    30af31fc002e clk: qcom: ipq8074: drop the CLK_SET_RATE_PARENT flag from PLL clocks
    8dc83cf76290 parisc/pdc: Add width field to struct pdc_model
    d08a1e75253b arm64: Restrict CPU_BIG_ENDIAN to GNU as or LLVM IAS 15.x or newer
    61695b9aecfe ACPI: resource: Do IRQ override on TongFang GMxXGxx
    6edbd6b4811f watchdog: move softlockup_panic back to early_param
    85fe64c8dcce PCI/sysfs: Protect driver's D3cold preference from user space
    1b0836242900 hvc/xen: fix error path in xen_hvc_init() to always register frontend driver
    d5455c421fad hvc/xen: fix console unplug
    a158a74e701b tty/sysrq: replace smp_processor_id() with get_cpu()
    fc557bcfd7ff audit: don't WARN_ON_ONCE(!current->mm) in audit_exe_compare()
    121973ef1ad7 audit: don't take task_lock() in audit_exe_compare() code path
    910caee34640 KVM: x86: Ignore MSR_AMD64_TW_CFG access
    66406d49ac14 KVM: x86: hyper-v: Don't auto-enable stimer on write from user-space
    8cf6b6658541 x86/cpu/hygon: Fix the CPU topology evaluation for real
    243c4833f345 scsi: megaraid_sas: Increase register read retry rount from 3 to 30 for selected registers
    697bc325b977 scsi: mpt3sas: Fix loop logic
    5fb8ec5943b1 bpf: Fix precision tracking for BPF_ALU | BPF_TO_BE | BPF_END
    9617a9fe4f41 bpf: Fix check_stack_write_fixed_off() to correctly spill imm
    7975f7b2a6fc randstruct: Fix gcc-plugin performance mode to stay in group
    d83f4bc0a4db powerpc/perf: Fix disabling BHRB and instruction sampling
    e7de8ffbbbc7 media: venus: hfi: add checks to perform sanity on queue pointers
    99dbc39c22ce cifs: fix check of rc in function generate_smb3signingkey
    e5a0ef02829d cifs: spnego: add ';' in HOST_KEY_LEN
    6d388b641c8f tools/power/turbostat: Fix a knl bug
    f56e228d67fc macvlan: Don't propagate promisc change to lower dev in passthru
    ac4979dbd9b6 net/mlx5e: Check return value of snprintf writing to fw_version buffer for representors
    a3ce491b1738 net/mlx5_core: Clean driver version and name
    0eaec8126b46 net/mlx5e: fix double free of encap_header
    541fece7caa4 net: stmmac: fix rx budget limit check
    66dbaa2eecf1 netfilter: nf_conntrack_bridge: initialize err to 0
    3f643150563c net: ethernet: cortina: Fix MTU max setting
    eac9ef50d6f3 net: ethernet: cortina: Handle large frames
    f0d9b80f7624 net: ethernet: cortina: Fix max RX frame define
    396baca6683f bonding: stop the device in bond_setup_by_slave()
    1f368fd61223 ptp: annotate data-race around q->head and q->tail
    ecc74e7acb6d xen/events: fix delayed eoi list handling
    144a80ef40a6 ppp: limit MRU to 64K
    3ee249a3b993 tipc: Fix kernel-infoleak due to uninitialized TLV value
    072f0eb962c9 net: hns3: fix VF reset fail issue
    b0eac93bae42 net: hns3: fix variable may not initialized problem in hns3_init_mac_addr()
    48fa8a85f8f5 tty: Fix uninit-value access in ppp_sync_receive()
    43b781e7cb5c ipvlan: add ipvlan_route_v6_outbound() helper
    59fadfa99bcb gfs2: Silence "suspicious RCU usage in gfs2_permission" warning
    dedf2a0eb944 SUNRPC: Fix RPC client cleaned up the freed pipefs dentries
    39b2bf040510 NFSv4.1: fix SP4_MACH_CRED protection for pnfs IO
    37f3aaf7945e SUNRPC: Add an IS_ERR() check back to where it was
    c7eacf01ddb1 SUNRPC: ECONNRESET might require a rebind
    4ea3b98fa6a1 xhci: turn cancelled td cleanup to its own function
    6ebd42a7b713 wifi: iwlwifi: Use FW rate for non-data frames
    e52518b9cb9f pwm: Fix double shift bug
    53b2393eeba7 drm/amdgpu: fix software pci_unplug on some chips
    f1ea84696ea5 ASoC: ti: omap-mcbsp: Fix runtime PM underflow warnings
    3cfacacb9caa kgdb: Flush console before entering kgdb on panic
    79b6a90f4f24 drm/amd/display: Avoid NULL dereference of timing generator
    0f5068519f89 media: imon: fix access to invalid resource for the second interface
    cf8519f40ce3 media: cobalt: Use FIELD_GET() to extract Link Width
    5f8d51a04baf gfs2: fix an oops in gfs2_permission
    2a054b87a1b7 gfs2: ignore negated quota changes
    0ac2652b9674 media: vivid: avoid integer overflow
    c6b6b8692218 media: gspca: cpia1: shift-out-of-bounds in set_flicker
    90e3c3dd9306 i2c: sun6i-p2wi: Prevent potential division by zero
    18fa7a30cd0c 9p/trans_fd: Annotate data-racy writes to file::f_flags
    76716a7604b2 usb: gadget: f_ncm: Always set current gadget in ncm_bind()
    4ef41a7f33ff tty: vcc: Add check for kstrdup() in vcc_probe()
    484cc536a3a2 exfat: support handle zero-size directory
    491529d383b7 HID: Add quirk for Dell Pro Wireless Keyboard and Mouse KM5221W
    65d78d54e4e5 misc: pci_endpoint_test: Add Device ID for R-Car S4-8 PCIe controller
    bb83f79f90e9 scsi: libfc: Fix potential NULL pointer dereference in fc_lport_ptp_setup()
    5cebe796eaaa atm: iphase: Do PCI error checks on own line
    65491968365c PCI: tegra194: Use FIELD_GET()/FIELD_PREP() with Link Width fields
    25354bae4fc3 ALSA: hda: Fix possible null-ptr-deref when assigning a stream
    e0d739e66bc1 ARM: 9320/1: fix stack depot IRQ stack filter
    62d21f9df46d HID: lenovo: Detect quirk-free fw on cptkbd and stop applying workaround
    1ba7df5457dc jfs: fix array-index-out-of-bounds in diAlloc
    81aa58cd8495 jfs: fix array-index-out-of-bounds in dbFindLeaf
    c6c8863fb3f5 fs/jfs: Add validity check for db_maxag and db_agpref
    524b4f203afc fs/jfs: Add check for negative db_l2nbperpage
    885824a44d35 RDMA/hfi1: Use FIELD_GET() to extract Link Width
    e97bf4ada7dd crypto: pcrypt - Fix hungtask for PADATA_RESET
    98fa52d89a4f ASoC: soc-card: Add storage for PCI SSID
    f161a6b11ae7 selftests/efivarfs: create-read: fix a resource leak
    f475d5502f33 drm/amdgpu: Fix a null pointer access when the smc_rreg pointer is NULL
    da1409ea0845 drm/panel: st7703: Pick different reset sequence
    9acc2bc00135 drm/panel/panel-tpo-tpg110: fix a possible null pointer dereference
    c7dc0aca5962 drm/panel: fix a possible null pointer dereference
    b93a25de28af drm/amdgpu: Fix potential null pointer derefernce
    8c1dbddbfcb0 drm/amd: Fix UBSAN array-index-out-of-bounds for Polaris and Tonga
    8af28ae3acb7 drm/amd: Fix UBSAN array-index-out-of-bounds for SMU7
    4ffb2b0e48c0 drm/msm/dp: skip validity check for DP CTS EDID checksum
    2810a9c40b6f drm/komeda: drop all currently held locks if deadlock happens
    a70457f181d6 platform/x86: thinkpad_acpi: Add battery quirk for Thinkpad X120e
    53d61daf35b1 Bluetooth: Fix double free in hci_conn_cleanup
    9f8e4d1a4ca1 Bluetooth: btusb: Add date->evt_skb is NULL check
    bba97f5e8ff3 wifi: ath10k: Don't touch the CE interrupt registers after power up
    22fa35ded3ec net: annotate data-races around sk->sk_dst_pending_confirm
    67b7de95d1e3 net: annotate data-races around sk->sk_tx_queue_mapping
    beb75dccba9d wifi: ath10k: fix clang-specific fortify warning
    2d6303cafb7c wifi: ath9k: fix clang-specific fortify warnings
    6058e4829696 bpf: Detect IP == ksym.end as part of BPF program
    717de20abdcd wifi: mac80211: don't return unset power in ieee80211_get_tx_power()
    cdfc689e10e6 wifi: mac80211_hwsim: fix clang-specific fortify warning
    a7aa2f1ca855 x86/mm: Drop the 4 MB restriction on minimal NUMA node memory size
    89356bee8eda clocksource/drivers/timer-atmel-tcb: Fix initialization on SAM9 hardware
    1b8687ed3cf3 clocksource/drivers/timer-imx-gpt: Fix potential memory leak
    1a2a4202c60f perf/core: Bail out early if the request AUX area is out of bound
    9ed2d68b3925 locking/ww_mutex/test: Fix potential workqueue corruption
    6db6caba87ef Linux 5.10.201
    4be0407ffcf6 btrfs: use u64 for buffer sizes in the tree search ioctls
    2bbbb976faa1 Revert "mmc: core: Capture correct oemid-bits for eMMC cards"
    3b092dfdabf2 tracing/kprobes: Fix the order of argument descriptions
    3697fda1c671 fbdev: fsl-diu-fb: mark wr_reg_wa() static
    a4dfebec32ec fbdev: imsttfb: fix a resource leak in probe
    9e8e731571e6 fbdev: imsttfb: Fix error path of imsttfb_probe()
    de721d7ef7ac spi: spi-zynq-qspi: add spi-mem to driver kconfig dependencies
    876a119790e5 drm/syncobj: fix DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE
    b9bc1806b907 x86/sev-es: Allow copy_from_kernel_nofault() in earlier boot
    14042d6d80db x86: Share definition of __is_canonical_address()
    bc794a667b1e netfilter: nat: fix ipv6 nat redirect with mapped and scoped addresses
    b65d851b2eb0 netfilter: nft_redir: use `struct nf_nat_range2` throughout and deduplicate eval call-backs
    7764290452d1 netfilter: xt_recent: fix (increase) ipv6 literal buffer length
    00b188209196 r8169: respect userspace disabling IFF_MULTICAST
    e02824db7c43 tg3: power down device only on SYSTEM_POWER_OFF
    34c5a24633bc net/smc: put sk reference if close work was canceled
    f652ab15af0a net/smc: allow cdc msg send rather than drop it with NULL sndbuf_desc
    4e7bad730160 net/smc: fix dangling sock under state SMC_APPFINCLOSEWAIT
    13d6bc35deb1 net: stmmac: xgmac: Enable support for multiple Flexible PPS outputs
    eafacef7eeef Fix termination state for idr_for_each_entry_ul()
    0a84ffc72f1e net: r8169: Disable multicast filter for RTL8168H and RTL8107E
    4969fcebe76d dccp/tcp: Call security_inet_conn_request() after setting IPv6 addresses.
    7827667989e1 dccp: Call security_inet_conn_request() after setting IPv4 addresses.
    f830d4f69835 inet: shrink struct flowi_common
    b33d130f07f1 tipc: Change nla_policy for bearer-related names to NLA_NUL_STRING
    ddf4e04e946a hsr: Prevent use after free in prp_create_tagged_frame()
    3a2653828ffc llc: verify mac len before reading mac header
    6c71e065befb Input: synaptics-rmi4 - fix use after free in rmi_unregister_function()
    e5d481d9b6cf pwm: brcmstb: Utilize appropriate clock APIs in suspend/resume
    005965cab108 pwm: sti: Reduce number of allocations and drop usage of chip_data
    ce5e0a3c9d39 pwm: sti: Avoid conditional gotos
    0bc796e66b5d regmap: prevent noinc writes from clobbering cache
    1b86938925bd media: dvb-usb-v2: af9035: fix missing unlock
    2e2efaed79c0 media: cedrus: Fix clock/reset sequence
    64863ba8e6b7 media: vidtv: mux: Add check and kfree for kstrdup
    3387490c89b1 media: vidtv: psi: Add check for kstrdup
    62557ab73d3a media: s3c-camif: Avoid inappropriate kfree()
    2f3d9198cdae media: bttv: fix use after free error due to btv->timeout timer
    0627e8623eb5 media: i2c: max9286: Fix some redundant of_node_put() calls
    c3e148aba95a pcmcia: ds: fix possible name leak in error path in pcmcia_device_add()
    84540ef92434 pcmcia: ds: fix refcount leak in pcmcia_device_add()
    cd154225d419 pcmcia: cs: fix possible hung task and memory leak pccardd()
    5e3c75158642 rtc: pcf85363: fix wrong mask/val parameters in regmap_update_bits call
    1832ed55df45 i3c: Fix potential refcount leak in i3c_master_register_new_i3c_devs
    a83fc293acd5 perf hist: Add missing puts to hist__account_cycles
    4e66bde5c7d1 perf machine: Avoid out of bounds LBR memory read
    188425eb2da2 usb: host: xhci-plat: fix possible kernel oops while resuming
    ba894bd2737c xhci: Loosen RPM as default policy to cover for AMD xHC 1.1
    ad0370c41a19 powerpc/pseries: fix potential memory leak in init_cpu_associativity()
    d12372af8955 powerpc/imc-pmu: Use the correct spinlock initializer.
    c75707293dcf powerpc/xive: Fix endian conversion size
    f95f5512fdcb powerpc/40x: Remove stale PTE_ATOMIC_UPDATES macro
    b54a4c8ca1c8 modpost: fix tee MODULE_DEVICE_TABLE built on big-endian host
    362f0241dbe9 interconnect: qcom: sc7180: Set ACV enable_mask
    08588fac00b1 interconnect: qcom: sc7180: Retire DEFINE_QBCM
    ebaf7a73f634 f2fs: fix to initialize map.m_pblk in f2fs_precache_extents()
    758f735604f8 dmaengine: pxa_dma: Remove an erroneous BUG_ON() in pxad_free_desc()
    5fe228041c51 USB: usbip: fix stub_dev hub disconnect
    798692e48c0a tools: iio: iio_generic_buffer ensure alignment
    3eadba058276 tools: iio: iio_generic_buffer: Fix some integer type and calculation
    a0a41991ddf2 tools: iio: privatize globals and functions in iio_generic_buffer.c file
    d046e3f8de1d misc: st_core: Do not call kfree_skb() under spin_lock_irqsave()
    c53cfe99c2aa dmaengine: ti: edma: handle irq_of_parse_and_map() errors
    bdb3dd409630 usb: dwc2: fix possible NULL pointer dereference caused by driver concurrency
    05de1536d052 livepatch: Fix missing newline character in klp_resolve_symbols()
    3ebf42fe8cc7 tty: tty_jobctrl: fix pid memleak in disassociate_ctty()
    380837052669 leds: trigger: ledtrig-cpu:: Fix 'output may be truncated' issue for 'cpu'
    23eb8629c22f leds: pwm: Don't disable the PWM when the LED should be off
    c2766ed2b7af mfd: dln2: Fix double put in dln2_probe
    b708eb26b560 mfd: core: Ensure disabled devices are skipped without aborting
    9f831533d2d0 mfd: core: Un-constify mfd_cell.of_reg
    b7b4851e630d ASoC: ams-delta.c: use component after check
    41aad9d69539 padata: Fix refcnt handling in padata_free_shell()
    7606807bd6d0 padata: Convert from atomic_t to refcount_t on parallel_data->refcnt
    2de16f6169a2 ASoC: Intel: Skylake: Fix mem leak when parsing UUIDs fails
    6fd432f392a7 HID: logitech-hidpp: Move get_wireless_feature_index() check to hidpp_connect_event()
    7581eef4aef2 HID: logitech-hidpp: Revert "Don't restart communication if not necessary"
    c82e376bc24e HID: logitech-hidpp: Don't restart IO, instead defer hid_connect() only
    0fe443314cf6 HID: logitech-hidpp: Remove HIDPP_QUIRK_NO_HIDINPUT quirk
    8337286600cd Revert "HID: logitech-hidpp: add a module parameter to keep firmware gestures"
    6d2de161cdc6 sh: bios: Revive earlyprintk support
    2ca51477c6da hid: cp2112: Fix IRQ shutdown stopping polling for all IRQs on chip
    9c895d20f8ee RDMA/hfi1: Workaround truncation compilation error
    cd268264f594 scsi: ufs: core: Leave space for '\0' in utf8 desc string
    cded69a7f8b3 ASoC: fsl: Fix PM disable depth imbalance in fsl_easrc_probe
    159639486834 RDMA/hns: Fix signed-unsigned mixed comparisons
    8018a3444e39 RDMA/hns: Fix uninitialized ucmd in hns_roce_create_qp_common()
    08a246064def IB/mlx5: Fix rdma counter binding for RAW QP
    53067926cd83 ASoC: fsl: mpc5200_dma.c: Fix warning of Function parameter or member not described
    83eee515e415 ext4: move 'ix' sanity check to corrent position
    67959b362687 ARM: 9321/1: memset: cast the constant byte to unsigned char
    3d959406c8ff hid: cp2112: Fix duplicate workqueue initialization
    63e8e2ee5815 crypto: qat - increase size of buffers
    a921d6b795a0 crypto: qat - mask device capabilities with soft straps
    16f2033de013 crypto: caam/jr - fix Chacha20 + Poly1305 self test failure
    727ba935d906 crypto: caam/qi2 - fix Chacha20 + Poly1305 self test failure
    b0e7a935739f nd_btt: Make BTT lanes preemptible
    efeaa2396e3b libnvdimm/of_pmem: Use devm_kstrdup instead of kstrdup and check its return value
    ffb3483c4b0b hwrng: geode - fix accessing registers
    02db438311f8 crypto: hisilicon/hpre - Fix a erroneous check after snprintf()
    5176ebe6aa2b selftests/resctrl: Ensure the benchmark commands fits to its array
    b3768f089210 selftests/pidfd: Fix ksft print formats
    a0846b4c8e74 clk: scmi: Free scmi_clk allocated when the clocks with invalid info are skipped
    bcc7d46fa4dd firmware: ti_sci: Mark driver as non removable
    5e5b85ea0f4b soc: qcom: llcc: Handle a second device without data corruption
    a44aa8d8a532 ARM: dts: qcom: mdm9615: populate vsdcc fixed regulator
    8bd7c8a9b838 arm64: dts: qcom: sdm845-mtp: fix WiFi configuration
    4df18b233ef2 arm64: dts: qcom: msm8916: Fix iommu local address range
    1e17eab1a49a xen-pciback: Consider INTx disabled when MSI/MSI-X is enabled
    bc714abe7dc0 drm/rockchip: Fix type promotion bug in rockchip_gem_iommu_map()
    666a4120dcf6 arm64/arm: xen: enlighten: Fix KPTI checks
    0dd40dca1ebb drm/rockchip: cdn-dp: Fix some error handling paths in cdn_dp_probe()
    6f710918df7d drm/mediatek: Fix iommu fault during crtc enabling
    c12f2eaeb38b drm/bridge: tc358768: Fix bit updates
    1133e72cd82b drm/bridge: tc358768: Disable non-continuous clock mode
    c0d25ef81a11 drm/bridge: tc358768: Fix use of uninitialized variable
    7b063c93bece drm/radeon: possible buffer overflow
    a6d6769e2db6 drm/rockchip: vop: Fix call to crtc reset helper
    bb8143016130 drm/rockchip: vop: Fix reset of state in duplicate state crtc funcs
    9899097b1fcf hwmon: (coretemp) Fix potentially truncated sysfs attribute name
    7d870088db48 hwmon: (axi-fan-control) Fix possible NULL pointer dereference
    060d54f09004 hwmon: (axi-fan-control) Support temperature vs pwm points
    d426a2955e45 platform/x86: wmi: Fix opening of char device
    d2220737330b platform/x86: wmi: remove unnecessary initializations
    3433a69c00ee platform/x86: wmi: Fix probe failure when failing to register WMI devices
    b16622d304e7 clk: qcom: config IPQ_APSS_6018 should depend on QCOM_SMEM
    001e5def774f clk: mediatek: clk-mt2701: Add check for mtk_alloc_clk_data
    4f861b63945e clk: mediatek: clk-mt7629: Add check for mtk_alloc_clk_data
    96e9544a0c4f clk: mediatek: clk-mt7629-eth: Add check for mtk_alloc_clk_data
    81b162861107 clk: mediatek: clk-mt6797: Add check for mtk_alloc_clk_data
    3994387ba356 clk: mediatek: clk-mt6779: Add check for mtk_alloc_clk_data
    2617aa8ceaf3 clk: mediatek: clk-mt6765: Add check for mtk_alloc_clk_data
    55e5fd11a21d clk: npcm7xx: Fix incorrect kfree
    0beaefa9885f clk: ti: fix double free in of_ti_divider_clk_setup()
    acb535d75077 clk: ti: change ti_clk_register[_omap_hw]() API
    98c5012c11a1 clk: ti: Update component clocks to use ti_dt_clk_name()
    1c4253252c7f clk: ti: Update pll and clockdomain clocks to use ti_dt_clk_name()
    00c67e0aa7e4 clk: ti: Add ti_dt_clk_name() helper to use clock-output-names
    de33b367f80d clk: keystone: pll: fix a couple NULL vs IS_ERR() checks
    c07a0e2e93b6 spi: nxp-fspi: use the correct ioremap function
    d459cb424483 clk: linux/clk-provider.h: fix kernel-doc warnings and typos
    f28709097db4 clk: asm9260: use parent index to link the reference clock
    8d03f7c5800d clk: imx: imx8mq: correct error handling path
    c1bacea8a64b clk: imx: Select MXC_CLK for CLK_IMX8QXP
    a52c963d8d7b clk: qcom: gcc-sm8150: Fix gcc_sdcc2_apps_clk_src
    c6919a1576bc clk: qcom: gcc-sm8150: use ARRAY_SIZE instead of specifying num_parents
    355a12fa1c50 clk: qcom: mmcc-msm8998: Fix the SMMU GDSC
    ba7f9695d545 clk: qcom: mmcc-msm8998: Set bimc_smmu_gdsc always on
    97a671174433 clk: qcom: mmcc-msm8998: Don't check halt bit on some branch clks
    05eebcd4bc5b clk: qcom: mmcc-msm8998: Add hardware clockgating registers to some clks
    3181168e61f4 clk: qcom: clk-rcg2: Fix clock rate overflow for high parent frequencies
    80836b5859b7 regmap: debugfs: Fix a erroneous check after snprintf()
    9954a7f3808b ipvlan: properly track tx_errors
    e897dcbd5fbc net: add DEV_STATS_READ() helper
    98e8a5a370da ipv6: avoid atomic fragment on GSO packets
    dea8d9e571ee ACPI: sysfs: Fix create_pnp_modalias() and create_of_modalias()
    88be6453d7c9 tcp: fix cookie_init_timestamp() overflows
    76894f305c96 chtls: fix tp->rcv_tstamp initialization
    d104f6cb41e8 r8169: fix rare issue with broken rx after link-down on RTL8125
    fdd4a3c20ad5 r8169: use tp_to_dev instead of open code
    3f795fb35c2d thermal: core: prevent potential string overflow
    ae681e5eff0c PM / devfreq: rockchip-dfi: Make pmu regmap mandatory
    d7a220bf6bd6 can: dev: can_restart(): fix race condition between controller restart and netif_carrier_on()
    040f65c2821f can: dev: can_restart(): don't crash kernel if carrier is OK
    03d138b6b243 wifi: rtlwifi: fix EDCA limit set by BT coexistence
    d8f2e18d1dcf tcp_metrics: do not create an entry from tcp_init_metrics()
    73999f29ab19 tcp_metrics: properly set tp->snd_ssthresh in tcp_init_metrics()
    37308a39262b tcp_metrics: add missing barriers on delete
    d203f9921ac0 wifi: mt76: mt7603: rework/fix rx pse hang check
    3068527d17e8 wifi: rtw88: debug: Fix the NULL vs IS_ERR() bug for debugfs_create_file()
    d44f88b20d44 net: spider_net: Use size_add() in call to struct_size()
    9b8486fdad65 tipc: Use size_add() in calls to struct_size()
    5f5aabbdc27f mlxsw: Use size_mul() in call to struct_size()
    f927d4469632 gve: Use size_add() in call to struct_size()
    2b46db3bb73d overflow: Implement size_t saturating arithmetic helpers
    2f4b4eb58fc0 tcp: call tcp_try_undo_recovery when an RTOd TFO SYNACK is ACKed
    0ca9fc8200d4 udp: add missing WRITE_ONCE() around up->encap_rcv
    61e7961ff33d i40e: fix potential memory leaks in i40e_remove()
    47479ed7fcf7 genirq/matrix: Exclude managed interrupts in irq_matrix_allocated()
    bb166bdae1a7 pstore/platform: Add check for kstrdup
    66f9969141c0 x86/boot: Fix incorrect startup_gdt_descr.size
    ffa4cc86e959 futex: Don't include process MM in futex key on no-MMU
    f52587051637 x86/srso: Fix SBPB enablement for (possible) future fixed HW
    f49926b8d2a5 vfs: fix readahead(2) on block devices
    9fe0f6b5720e sched/uclamp: Ignore (util == 0) optimization in feec() when p_util_max = 0
    bdb7de7ed5ba iov_iter, x86: Be consistent about the __user tag on copy_mc_to_user()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index aa142e9991..ce882123f2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b24960ebb2a4b1ef65c32b2d76b3c5cc078da6e3"
-SRCREV_meta ?= "2a34d5498413dc22a5f735d5e830751fe07dc825"
+SRCREV_machine ?= "4c84fd48919bf3fa759cd02947899e90b5f13be1"
+SRCREV_meta ?= "0ac177cb2df1cff8799d72b9224ed69423a22eef"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.200"
+LINUX_VERSION ?= "5.10.202"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index e9b140826f..267b2bcad1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.200"
+LINUX_VERSION ?= "5.10.202"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "649d500e6df0c844c207d14168290483f0e2e3a4"
-SRCREV_machine ?= "913ae61c1450439a52b0ed396805b65c2735a136"
-SRCREV_meta ?= "2a34d5498413dc22a5f735d5e830751fe07dc825"
+SRCREV_machine:qemuarm ?= "b010aecb876ae2adf4548989459cc4878035d1ad"
+SRCREV_machine ?= "69bfe10cd8d98c45a361d2efdddfc1bb940f5601"
+SRCREV_meta ?= "0ac177cb2df1cff8799d72b9224ed69423a22eef"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 20ac329cdb..a057dd54de 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -14,23 +14,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "cc21138c594fb43fba8e73aa72f3264c086689ff"
-SRCREV_machine:qemuarm64 ?= "bd39db109551e3df6a5cd523d2d7f7bbf6e756ea"
-SRCREV_machine:qemumips ?= "d8fb3fcb7e6d85e098ab813d26a20f5226f48f47"
-SRCREV_machine:qemuppc ?= "67ee435101a2b79ea826a22877e30d0a5ddf70f3"
-SRCREV_machine:qemuriscv64 ?= "7042b40d250aaaf2fe5f027de38e31575c01b22a"
-SRCREV_machine:qemuriscv32 ?= "7042b40d250aaaf2fe5f027de38e31575c01b22a"
-SRCREV_machine:qemux86 ?= "7042b40d250aaaf2fe5f027de38e31575c01b22a"
-SRCREV_machine:qemux86-64 ?= "7042b40d250aaaf2fe5f027de38e31575c01b22a"
-SRCREV_machine:qemumips64 ?= "a36187617acc67fd12b752e74b68152c59374f88"
-SRCREV_machine ?= "7042b40d250aaaf2fe5f027de38e31575c01b22a"
-SRCREV_meta ?= "2a34d5498413dc22a5f735d5e830751fe07dc825"
+SRCREV_machine:qemuarm ?= "cf28b49bd6d196edf71e532b95675b683f24adca"
+SRCREV_machine:qemuarm64 ?= "255936309d9ae21a5b5b76bbf4c4392b997eafdf"
+SRCREV_machine:qemumips ?= "fa8423d3d00a45d8ee4b64684fd2111d10e48b67"
+SRCREV_machine:qemuppc ?= "3c348c832ffb927a3f580e40d8190f385dfdce12"
+SRCREV_machine:qemuriscv64 ?= "d05c0de69c0091d4ec418a225cfd942bd666630c"
+SRCREV_machine:qemuriscv32 ?= "d05c0de69c0091d4ec418a225cfd942bd666630c"
+SRCREV_machine:qemux86 ?= "d05c0de69c0091d4ec418a225cfd942bd666630c"
+SRCREV_machine:qemux86-64 ?= "d05c0de69c0091d4ec418a225cfd942bd666630c"
+SRCREV_machine:qemumips64 ?= "d38df4bfa230e568606fda66ec7ae697ed41e9ca"
+SRCREV_machine ?= "d05c0de69c0091d4ec418a225cfd942bd666630c"
+SRCREV_meta ?= "0ac177cb2df1cff8799d72b9224ed69423a22eef"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.200"
+LINUX_VERSION ?= "5.10.202"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


