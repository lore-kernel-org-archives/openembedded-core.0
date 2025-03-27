Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 998B4C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 19:44:48 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.5285.1743104679136373619
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 12:44:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Mz87dqgK;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-227b828de00so27273915ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 12:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1743104678; x=1743709478; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HXVrl2u0MYdvWITMaqLApQv3W5VBa+nJVBAKeBMTZnY=;
        b=Mz87dqgKemxyvLWgFTWjRSDZwdVfaXGJV2pIQx6kXlJtcHm3cOKFyzMu0O+BQj6IDV
         Q7wtvbeExo4Cvl+J0J/R7cJwBrCi+CWFw63NUBKTgN+CEGm9sYL+oSRHV5lqW9x3YHI2
         TAY5Ok72mlF5q+X/DAOqv3zNhKzJmQtq3DIh8Eci0wxe3sZmGWIrVaQt2ToJDT562D5u
         fiOPntkrlTtosMi4pIKb9RyUiluILpqhRIlb4ClsEjPutYhKGYdcT+BXhCeLdCTti2fz
         l6oWKCcC0ZYcouD+jbvBrQaHe5LaPlVXcmtfa7LSNjiO+cbTs7vCT8qYaAJfk9tjoaW2
         okUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104678; x=1743709478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HXVrl2u0MYdvWITMaqLApQv3W5VBa+nJVBAKeBMTZnY=;
        b=o44PZ5P67DpaRwWz86tgwkGsE6G7MDp55Z9q1ANG5HI/ltZBETQWg7A7v8mVia4Bfa
         dBpbFWqlicH4/LvLz2UpVa+x5xb9mE9sT52XgbPoudL0RfWi2pxzB5U02TXwqnBgJBnx
         wAj2Uk2nI0zn4CAOkHLHjUeRUKrnCXpp6uMrel1njgFbzKYL7eMouS4VmdmJ3uwGcyEv
         AXfceknhQIauDYIZbdWWDHdCGdMccvXT4fAi/p1zbzoO3jl2EHFJdlJcEh1CgYXrmzg5
         XE0C6BqnIoUgq94WtxQvBre6MkaQBEvNHouGcA7HIK2sWG7LJWa4nYv1Gjq8dijebsEu
         YtSQ==
X-Gm-Message-State: AOJu0YwMaVso7nagscs5AYa3URczS7/UddNqGM56LnyE3aX6lUds00AD
	LpD1M1Sow38HY7clTjJEC74fQAP+byCFZ5uA151vKt0V59ggNkQwKM0XU60hUv7bVxofa+ACxXg
	3
X-Gm-Gg: ASbGnct+X8n+8BEfUjwRjrzokcoYT6EgVUIzYTrO0kKXc1QEeliBsY/6sVcChQq07Cd
	xcvBXgeO5o8l4CM6fxgcR4MHmtGJF+ZPWiVqF0V24GzC68PC+5j3LsNJSFzhbXvquWobj62lzQT
	i4MlY8O5GN3nE/iGTYDEuC75iTsZNdK5rQAhO4QvfiiR2BDNfnkzqRA89KQR0+B4+SFI+H6i57b
	Q2pIZpo9/kX5F1Sg++z3necSkUXkCO2A5uj1NFvX3ap96ErNo//cpfWXRVEBqdQKntMIpRLbJIq
	5mk7P07jWrRDjXDfaJOtPHM5lrfg/Q5zEnCJCvlOWhDccw==
X-Google-Smtp-Source: AGHT+IFgcV+ETmTVfYfRPgT+oFqRXO1gZnzOb6GJPZtiIikHKFc1jNKTUiCmDsHnFeVTlzfmi/2Liw==
X-Received: by 2002:a17:903:120a:b0:224:c46:d167 with SMTP id d9443c01a7336-228048b1c5amr71366045ad.16.1743104677872;
        Thu, 27 Mar 2025 12:44:37 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:811c:968e:2c1:6363])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee0882sm3865875ad.75.2025.03.27.12.44.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:44:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/10] linux-yocto/6.6: update to v6.6.83
Date: Thu, 27 Mar 2025 12:44:13 -0700
Message-ID: <38034511b7d854f168d9dc297881d9b6fc33f921.1743104524.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743104524.git.steve@sakoman.com>
References: <cover.1743104524.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 19:44:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213784

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    1c2962a164ff v6.6 -stable -rt merge fixup
    594a1dd5138a Linux 6.6.83
    d5285e088b50 kbuild: userprogs: use correct lld when linking through clang
    79a955ea4a2e pfifo_tail_enqueue: Drop new packet when sch->limit == 0
    f9825c3f507d spi-mxs: Fix chipselect glitch
    aa6ef9ceab9c x86/boot: Sanitize boot params before parsing command line
    c59843e87791 x86/boot: Rename conflicting 'boot_params' pointer to 'boot_params_ptr'
    5b6eac63d157 ima: Reset IMA_NONACTION_RULE_FLAGS after post_setattr
    bb4425498707 x86/mm: Don't disable PCID when INVLPG has been fixed by microcode
    eff00c5e29ab uprobes: Fix race in uprobe_free_utask
    53402e17b1a7 drm/i915/dsi: Use TRANS_DDI_FUNC_CTL's own port width macro
    03f1b76fcdbc Revert "KVM: PPC: e500: Mark "struct page" dirty in kvmppc_e500_shadow_map()"
    e4c6eff5a3b5 Revert "KVM: PPC: e500: Mark "struct page" pfn accessed before dropping mmu_lock"
    36f688adf413 Revert "KVM: PPC: e500: Use __kvm_faultin_pfn() to handle page faults"
    9e4b27250fcd Revert "KVM: e500: always restore irqs"
    52fffb4a1f86 riscv: Fix enabling cbo.zero when running in M-mode
    76c9f76d4ad1 ALSA: hda: realtek: fix incorrect IS_REACHABLE() usage
    128962f5ab56 kbuild: hdrcheck: fix cross build with clang
    62112e7f5cbd arm64: hugetlb: Fix huge_ptep_get_and_clear() for non-present ptes
    c04035ce803e mm: hugetlb: Add huge page size param to huge_ptep_get_and_clear()
    11f0e95d6300 iio: adc: at91-sama5d2_adc: fix sama7g5 realbits value
    12012d432478 iio: dac: ad3552r: clear reset status flag
    82d94af45644 iio: filter: admv8818: Force initialization of SDO
    d7e5031fe3f1 drivers: virt: acrn: hsm: Use kzalloc to avoid info leak in pmcmd_ioctl
    47aa0f5c6370 eeprom: digsy_mtc: Make GPIO lookup table match the device
    1f9eb7078bc6 bus: mhi: host: pci_generic: Use pci_try_reset_function() to avoid deadlock
    faac8e894014 slimbus: messaging: Free transaction ID in delayed interrupt scenario
    e49700a7d6d4 drivers: core: fix device leak in __fw_devlink_relax_cycles()
    d43b3f646686 char: misc: deallocate static minor in error path
    a5e10461dec0 intel_th: pci: Add Panther Lake-P/U support
    d66d16c32a5a intel_th: pci: Add Panther Lake-H support
    9d3c428e3eb4 intel_th: pci: Add Arrow Lake support
    693958465a6d mei: me: add panther lake P DID
    d7b339bbc887 cdx: Fix possible UAF error in driver_override_show()
    4f1ca393ea56 KVM: x86: Explicitly zero EAX and EBX when PERFMON_V2 isn't supported by KVM
    33bf2b75c1e9 KVM: SVM: Suppress DEBUGCTL.BTF on AMD
    978df364a3e0 KVM: SVM: Drop DEBUGCTL[5:2] from guest's effective value
    c401b1b4b835 usb: xhci: Enable the TRB overfetch quirk on VIA VL805
    af091756c4c7 xhci: pci: Fix indentation in the PCI device ID definitions
    2c271df31868 usb: gadget: Check bmAttributes only if configuration is valid
    0af020298b06 usb: gadget: Fix setting self-powered state on suspend
    b7768bba6a69 usb: gadget: Set self-powered based on MaxPower and bmAttributes
    68f7ef440a15 usb: typec: tcpci_rt1711h: Unmask alert interrupts to fix functionality
    8233c63fca35 usb: typec: ucsi: increase timeout for PPM reset operations
    656a99b581f5 usb: dwc3: gadget: Prevent irq storm when TH re-executes
    13f9b888ad0c usb: dwc3: Set SUSPENDENABLE soon after phy init
    a0475a885d69 usb: atm: cxacru: fix a flaw in existing endpoint checks
    0f6850613fe3 usb: gadget: u_ether: Set is_suspend flag if remote wakeup fails
    d50f5c0cd949 usb: renesas_usbhs: Flush the notify_hotplug_work
    46fba7be161b usb: typec: ucsi: Fix NULL pointer access
    7f0441af6ca5 usb: quirks: Add DELAY_INIT and NO_LPM for Prolific Mass Storage Card Reader
    7817af8b0b8e usb: hub: lack of clearing xHC resources
    ef0820290494 usb: renesas_usbhs: Use devm_usb_get_phy()
    d72f4475717e usb: renesas_usbhs: Call clk_put()
    3cae0b7e9639 Revert "drivers/card_reader/rtsx_usb: Restore interrupt based detection"
    897b7b76f021 gpio: rcar: Fix missing of_node_put() call
    9ff13800d6a8 net: ipv6: fix missing dst ref drop in ila lwtunnel
    925933d2cc63 net: ipv6: fix dst ref loop in ila lwtunnel
    88afbcb450c2 net: dsa: mt7530: Fix traffic flooding for MMIO devices
    9cc7f0018609 sched/fair: Fix potential memory corruption in child_cfs_rq_on_list
    c6292a2ac392 ublk: set_params: properly check if parameters can be applied
    04ab4df09de8 net-timestamp: support TCP GSO case for a few missing flags
    747de766f804 exfat: fix soft lockup in exfat_clear_bitmap
    470537263443 x86/sgx: Fix size overflows in sgx_encl_create()
    356144259980 vlan: enforce underlying device type
    1eacd47636a9 ppp: Fix KMSAN uninit-value warning with bpf
    65dcc3af0215 net: ipa: Enable checksum for IPA_ENDPOINT_AP_MODEM_{RX,TX} for v4.7
    5dc8312162de net: ipa: Fix QSB data for v4.7
    b9a3f30b30f3 net: ipa: Fix v4.7 resource group names
    026714ec7546 HID: hid-steam: Fix use-after-free when detaching device
    2c04e507f3a5 net: hns3: make sure ptp clock is unregister and freed if hclge_ptp_get_cycle returns an error
    41d731e79203 be2net: fix sleeping while atomic bugs in be_ndo_bridge_getlink
    4f5cc62f9a81 drm/sched: Fix preprocessor guard
    b1e17ebd82b9 hwmon: fix a NULL vs IS_ERR_OR_NULL() check in xgene_hwmon_probe()
    416e8b4c20c6 llc: do not use skb_get() before dev_queue_xmit()
    8c48c26f5f6d ALSA: usx2y: validate nrpacks module parameter on probe
    2efd6cc2c772 tracing: probe-events: Remove unused MAX_ARG_BUF_LEN macro
    c3dafdf77b97 hwmon: (ad7314) Validate leading zero bits and return error
    b5cc1496a090 hwmon: (ntc_thermistor) Fix the ncpXXxh103 sensor table
    395c28f3c0c4 hwmon: (pmbus) Initialise page count in pmbus_identify()
    7c823e4c30d6 perf/core: Fix pmus_lock vs. pmus_srcu ordering
    90d302619ee7 caif_virtio: fix wrong pointer check in cfv_probe()
    01a83237644d net: gso: fix ownership in __udp_gso_segment
    84cce23da477 nvmet-tcp: Fix a possible sporadic response drops in weakly ordered arch
    127c8905ea8e bluetooth: btusb: Initialize .owner field of force_poll_sync_fops
    560f4d129934 HID: intel-ish-hid: Fix use-after-free issue in ishtp_hid_remove()
    d0ef5f19b69d HID: google: fix unused variable warning under !CONFIG_ACPI
    b02f8d5a71c8 wifi: iwlwifi: limit printed string from FW file
    5c18fae5808d mm: don't skip arch_sync_kernel_mappings() in error paths
    b56b6cfdc7a7 mm/page_alloc: fix uninitialized variable
    f4e39e0ffbaf block: fix conversion of GPT partition name to 7-bit
    ab0727d6e219 NFS: fix nfs_release_folio() to not deadlock via kcompactd writeback
    272abd47f7d2 s390/traps: Fix test_monitor_call() inline assembly
    18519478b9a0 dma: kmsan: export kmsan_handle_dma() for modules
    2537f01d57f0 rapidio: fix an API misues when rio_add_net() fails
    e6411c3b9512 rapidio: add check for rio_add_net() in rio_scan_alloc_net()
    ebebbb0eded2 wifi: nl80211: reject cooked mode if it is set along with other flags
    35ef07112b61 wifi: cfg80211: regulatory: improve invalid hints checking
    bdb1805c248e Bluetooth: Add check for mgmt_alloc_skb() in mgmt_device_connected()
    c5845c73cbac Bluetooth: Add check for mgmt_alloc_skb() in mgmt_remote_name()
    f3fcdb2de9fd mptcp: fix 'scheduling while atomic' in mptcp_pm_nl_append_new_local_addr
    bd8dd64611ca x86/cpu: Properly parse CPUID leaf 0x2 TLB descriptor 0x63
    672bc566cfe6 x86/cpu: Validate CPUID leaf 0x2 EDX output
    db79249be184 x86/cacheinfo: Validate CPUID leaf 0x2 EDX output
    8d1fcb467e6f platform/x86: thinkpad_acpi: Add battery quirk for ThinkPad X131e
    c9dbc5c774ad drm/radeon: Fix rs400_gpu_init for ATI mobility radeon Xpress 200M
    3b3c2be58d52 drm/amd/display: Fix null check for pipe_ctx->plane_state in resource_build_scaling_params
    c144d1995873 hwmon: (peci/dimmtemp) Do not provide fake thresholds data
    8e507b3798c6 ALSA: hda/realtek: update ALC222 depop optimize
    0b60d5b2f81f ALSA: hda/realtek - add supported Mic Mute LED for Lenovo platform
    3f63e8fe7b56 ALSA: hda: intel: Add Dell ALC3271 to power_save denylist
    5e1b3bf72710 ALSA: seq: Avoid module auto-load handling at event delivery
    d99dc8f7ea01 gpio: aggregator: protect driver attr handlers against module unload
    c10365031f16 gpio: rcar: Use raw_spinlock to protect register access
    8994f0ce8259 ksmbd: fix bug on trap in smb2_lock
    8573571060ca ksmbd: fix use-after-free in smb2_lock
    c1569dbbe2d4 ksmbd: fix out-of-bounds in parse_sec_desc()
    76861630b29e ksmbd: fix type confusion via race condition when using ipc_msg_send_request
    fc69e2c3219d HID: appleir: Fix potential NULL dereference at raw event handle
    8a998a80335e LoongArch: Set max_pfn with the PFN of the last page
    abf16e748aaa LoongArch: Use polling play_dead() when resuming from hibernation
    7929d3623303 LoongArch: Convert unreachable() to BUG()
    35415b915a81 tracing: tprobe-events: Fix a memory leak when tprobe with $retval
    a9704893eec8 Revert "of: reserved-memory: Fix using wrong number of cells to get property 'alignment'"
    2d62d8f3fcf8 x86/microcode/AMD: Add some forgotten models to the SHA check
    dd8aad26c5e4 riscv: signal: fix signal_minsigstksz
    1b0a08a4fd6a RISC-V: Enable cbo.zero in usermode
    19c9976b8123 riscv: cacheinfo: Use of_property_present() for non-boolean properties
    80aec5a85510 riscv: Prevent a bad reference count on CPU nodes
    ebccacb0b599 riscv: cacheinfo: initialize cacheinfo's level and type from ACPI PPTT
    e1f99e0bae58 riscv: cacheinfo: remove the useless input parameter (node) of ci_leaf_init()
    017df7c71477 NFS: O_DIRECT writes must check and adjust the file length
    6e954923b72e x86/speculation: Add __update_spec_ctrl() helper
    174853183929 net: enetc: VFs do not support HWTSTAMP_TX_ONESTEP_SYNC
    f22f7ba83f00 net: enetc: Replace ifdef with IS_ENABLED
    54e0f2d2d340 net: enetc: Remove setting of RX software timestamp
    2a3f4e270dcf drm/amdgpu: disable BAR resize on Dell G5 SE
    c18438959b1d drm/amdgpu: Check extended configuration space register when system uses large bar
    4d2a7df718c3 ibmvnic: Inspect header requirements before using scrq direct
    6511585ed6e2 ibmvnic: Perform tx CSO during send scrq direct
    2c55d671849a smb: client: fix chmod(2) regression with ATTR_READONLY
    75cc3357a331 arm64: dts: rockchip: add rs485 support on uart5 of px30-ringneck-haikou
    9afdcba9489f drm/i915/ddi: Fix HDMI port width programming in DDI_BUF_CTL
    dbae718671de drm/i915/xe2lpd: Move D2D enable/disable
    ea3f0b362dfe efi: Don't map the entire mokvar table to determine its size
    8f43ba5ee498 x86/amd_nb: Use rdmsr_safe() in amd_get_mmconfig_range()
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
index b3e766b63a..d61e7c7013 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "458408eab7fb1123f5ffc22454372b7e7b80de52"
-SRCREV_meta ?= "96445f165c819b9f956014acbd7e4a100a43a83c"
+SRCREV_machine ?= "63e3ee8cad3470dc6f6e14fa066ad8fbe8f7a533"
+SRCREV_meta ?= "76774218a6ce7d0ac41ab689d68297fd3aa3838e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.82"
+LINUX_VERSION ?= "6.6.83"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 5ec2173ba6..01f6b2993c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.82"
+LINUX_VERSION ?= "6.6.83"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "36b434b4de69ef3a471d99949cff8aa0382c95bf"
-SRCREV_meta ?= "96445f165c819b9f956014acbd7e4a100a43a83c"
+SRCREV_machine ?= "02eba65981c1950772b1b82809784b640f6d4523"
+SRCREV_meta ?= "76774218a6ce7d0ac41ab689d68297fd3aa3838e"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 3512bbe4f1..f3d1478852 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "c8f9b207913b334dc5f2165d1fb9dc28087ea907"
-SRCREV_machine:qemuarm64 ?= "e8f447b84e7d27ed243deca13698c67c3ef0cc0a"
-SRCREV_machine:qemuloongarch64 ?= "6fd6fb79fbafacc33fde3b3123e7b9daaedf8afd"
-SRCREV_machine:qemumips ?= "a47313507e1e2a8109051b502f24f400c3412ce3"
-SRCREV_machine:qemuppc ?= "1f6d3705ba7c8d76ffce71a26000813d8aea4f15"
-SRCREV_machine:qemuriscv64 ?= "6fd6fb79fbafacc33fde3b3123e7b9daaedf8afd"
-SRCREV_machine:qemuriscv32 ?= "6fd6fb79fbafacc33fde3b3123e7b9daaedf8afd"
-SRCREV_machine:qemux86 ?= "6fd6fb79fbafacc33fde3b3123e7b9daaedf8afd"
-SRCREV_machine:qemux86-64 ?= "6fd6fb79fbafacc33fde3b3123e7b9daaedf8afd"
-SRCREV_machine:qemumips64 ?= "90822bcfa923f56bec13f149fcd25787d1308e2d"
-SRCREV_machine ?= "6fd6fb79fbafacc33fde3b3123e7b9daaedf8afd"
-SRCREV_meta ?= "96445f165c819b9f956014acbd7e4a100a43a83c"
+SRCREV_machine:qemuarm ?= "81c095c03a24e0ba76cbf9fdfa1cf1debec3539d"
+SRCREV_machine:qemuarm64 ?= "c829269a448a8ca80344d036dacb8b3d9dbfab9f"
+SRCREV_machine:qemuloongarch64 ?= "1c2962a164ffb032281c3d2e62a08d343249f208"
+SRCREV_machine:qemumips ?= "39483f9b5f923214c29a14fe6e51daf827964f2a"
+SRCREV_machine:qemuppc ?= "9c8c49665dde1059734ee56708e63b2d6e4f3ed0"
+SRCREV_machine:qemuriscv64 ?= "1c2962a164ffb032281c3d2e62a08d343249f208"
+SRCREV_machine:qemuriscv32 ?= "1c2962a164ffb032281c3d2e62a08d343249f208"
+SRCREV_machine:qemux86 ?= "1c2962a164ffb032281c3d2e62a08d343249f208"
+SRCREV_machine:qemux86-64 ?= "1c2962a164ffb032281c3d2e62a08d343249f208"
+SRCREV_machine:qemumips64 ?= "5d02316b6c6c886a25bc5592b397dbd4e51654e5"
+SRCREV_machine ?= "1c2962a164ffb032281c3d2e62a08d343249f208"
+SRCREV_meta ?= "76774218a6ce7d0ac41ab689d68297fd3aa3838e"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "1998f703f4d758abe45df7fd8bb8ccf2f59f3848"
+SRCREV_machine:class-devupstream ?= "594a1dd5138a6bbaa1697e5648cce23d2520eba9"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.82"
+LINUX_VERSION ?= "6.6.83"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


