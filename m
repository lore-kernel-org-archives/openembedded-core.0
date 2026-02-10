Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC68EA811E
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 14:12:55 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20473.1770732768893080060
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 06:12:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JuS7R0TY;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-50334dd44d2so48772221cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 06:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770732768; x=1771337568; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0GzskQC8DW8IlpJzdqMLY5X+rVFupMVJZyF2BFb1OOA=;
        b=JuS7R0TYhZ2ns+aEqi1dgCVO3ydcszVaeGR18IkbZ1jP2XjbvdvPUnUE++E2wfv9er
         SVD7ODHWBBR0dJirdBjl5m0G1F4FPGYmkEeQ+Gphl/am/f8JOnjmN4sCgGaM4IdEby8o
         dQXUwR7hKyF5IP6GRlP+tiN4VfS8PjQeRdyUp92xrtx7xpyvvh0qcVCTJooGurUOahSU
         ICQDUfYN2BgBAqnd3bsQRcTIAQKlBwN9UPIbo5nrioltqyBoptXyGI3fJFhlDXZqkvWk
         2+tC0mtCNAuzborADMuMkwVA7JR5x4O2fIs/ib09U7msw4aBsIO+4kkbxOzGRE3OzZ5g
         AbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770732768; x=1771337568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GzskQC8DW8IlpJzdqMLY5X+rVFupMVJZyF2BFb1OOA=;
        b=a3waMKpz94gCOEEJjDqTScip0JooqWeWQrashqSitw/WS6/0C+uxIhESXutBqfuoCx
         EYWCdm6UbLYHn8oIMBCCvwjHJtjF15JcLbp7LFYITEIsDmc4T4x4dSD18cjs7Y35a3Qm
         sWskdVRX5cVCzN/XLTwf4n1aovHwU7TR5wdn/NCClD9XCqqyvP5+D14iCVRM4XI97gtG
         aunGaB9mK79crBVr3fBonR9CCJs/KTYwsFXt8aevCfe9Zod7xoP7i6S9yvkB3xAP5iMl
         l1+YDkbNVJlpCA11wMPE05jrrkBFa0Qrw3yOOkPOI3bKsaaQVHmpBl9D6qWYzAAig2h5
         +S6Q==
X-Gm-Message-State: AOJu0Yw+UVhdVbsijBsfaoWaK5GBIqjX+IOEe7ohJX0siJYv4YuKx4VW
	sqsrX1e6ZgELCVmbx4piVyfTM2dn5Jg6RiaPzcc2W0FPqxCxonlEx2Pn
X-Gm-Gg: AZuq6aL6aClSksJy/Zbh6O8Ftrm07q8Z/NiOYniWLv2pTljjEGmNHKvcoh/bE/U8G3z
	al8v4/MTvzYaJWDCYzjon/vBx/NJfCRXXv+ajTunU3kldn3PBE3M+jRvp25Pht1MAm3QeOksIDS
	deMuD+HlzxrvuluZCm8MaKspyPiV77V9d1oAcOfsAnATOBZQ4LEy8oBIeZ7atN0wHC08Bk4E6EZ
	gkE4PxhZnM4dLCG/3qYoOMPH2gF7Gt3hSzvtfrlLJS3gq70+jZByY4fdn/1zOcptiHrI0o1wMTo
	C4xQulc+ZKSOMXz81HZZVAVhM4U73k5niFGghAzVwOvcdpgLWsx1dZmVMzA6urxA1lkoj9Ov+qd
	TgURwHiUaoksOfXDl+UvrXrLl/GMrjsF9QuIp1ZtKTmGE60BB2ZFxVFa5+iXh4vGUa2FDtl2tPD
	9iewJHSuaqSO6dGRBvnZZGgZQXFjSuIsnTk4ljpZHRJ7rWs2puG6jrUKMN9WvZ/YJi7VMGmLt/I
	UJHRvE0Z/Bv6Xwuv8YriK/XGXzQjVxLljGeI5ZIxrExldcpm3GE77Yi5aI=
X-Received: by 2002:ac8:7d42:0:b0:501:3c88:131 with SMTP id d75a77b69052e-50639885b69mr198170961cf.22.1770732767654;
        Tue, 10 Feb 2026 06:12:47 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50639e26b9fsm103446651cf.15.2026.02.10.06.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 06:12:47 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta-yocto-bsp][PATCH] yocto-bsp: update to kernel v6.18.9
Date: Tue, 10 Feb 2026 09:12:45 -0500
Message-ID: <20260210141245.1479021-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 14:12:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230901

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.18 to the latest korg -stable release that comprises
the following commits:

    adb851edb7078 Linux 6.18.9
    0d26aa84ff0b7 mptcp: avoid dup SUB_CLOSED events after disconnect
    01b0831d71b6d sched_ext: Fix SCX_KICK_WAIT to work reliably
    664e78f2d4ec3 sched_ext: Don't kick CPUs running higher classes
    edb9fab1b78c6 net/sched: act_ife: convert comma to semicolon
    5b22c6cbabc78 Revert "drm/nouveau/disp: Set drm_mode_config_funcs.atomic_(check|commit)"
    ab21cf885fb2a libbpf: Fix -Wdiscarded-qualifiers under C23
    f749b366b8e79 gpiolib: acpi: Fix potential out-of-boundary left shift
    84df65fcfbff1 iommu/tegra241-cmdqv: Reset VCMDQ in tegra241_vcmdq_hw_init_user()
    078377b07f8e8 drm/amdgpu: Fix cond_exec handling in amdgpu_ib_schedule()
    ac251d17d8af5 drm/amdgpu: fix NULL pointer dereference in amdgpu_gmc_filter_faults_remove
    2d9bff2af0adb drm/amdgpu/gfx12: adjust KGQ reset sequence
    d9790cf8bbe80 drm/amdgpu/gfx12: fix wptr reset in KGQ init
    4867b512bb7f5 drm/amdgpu/gfx11: adjust KGQ reset sequence
    018892bd9a0c0 drm/amdgpu/gfx11: fix wptr reset in KGQ init
    75ebd42441702 drm/amdgpu/gfx10: fix wptr reset in KGQ init
    9a6d87fbe3f51 drm/amdgpu/soc21: fix xclk for APUs
    5f841c308c453 drm/amd/pm: fix smu v14 soft clock frequency setting issue
    191e22e5d742e drm/amd/pm: fix smu v13 soft clock frequency setting issue
    ca68745e820ec drm/imx/tve: fix probe device leak
    31203f5680c3d drm/msm/a6xx: fix bogus hwcg register updates
    a4ea228271cd4 drm/tyr: depend on `COMMON_CLK` to fix build error
    3e845c46dfe5a drm/xe/xelp: Fix Wa_18022495364
    ae8831ee0fb2f drm: Do not allow userspace to trigger kernel warnings in drm_gem_change_handle_ioctl()
    dd222df5b356e scripts: generate_rust_analyzer: Add compiler_builtins -> core dep
    8afa6c4d7abfb scripts: generate_rust_analyzer: fix resolution of #[pin_data] macros
    2426867644cc7 scripts: generate_rust_analyzer: compile sysroot with correct edition
    ce798a0fe6b79 scripts: generate_rust_analyzer: remove sysroot assertion
    595718c74f85b scripts: generate_rust_analyzer: Add pin_init_internal deps
    5bfa32ff75b50 scripts: generate_rust_analyzer: Add pin_init -> compiler_builtins dep
    e82f822ed1472 rust: sync: refcount: always inline functions using build_assert with arguments
    4bb727f4b0614 rust: sync: atomic: Provide stub for `rusttest` 32-bit hosts
    625605ac8be50 rust: bits: always inline functions using build_assert with arguments
    3d48d59235c49 net: fix segmentation of forwarding fraglist GRO
    b23bee8cdb7aa mm/shmem, swap: fix race of truncate and swap entry split
    40aed8b856580 mm/memory-failure: teach kill_accessing_process to accept hugetlb tail page pfn
    b0020cbd26380 mm, swap: restore swap_space attr aviod kernel panic
    4f57516293fda mm/memory-failure: fix missing ->mf_stats count in hugetlb poison
    c71fae335dfe7 mm/kfence: randomize the freelist on initialization
    629666d20c7dc btrfs: do not strictly require dirty metadata threshold for metadata writepages
    b91a84299d72a flex_proportions: make fprop_new_period() hardirq safe
    131af3df59b24 selftests: mptcp: join: fix local endp not being tracked
    e73aab3337833 selftests: mptcp: check subflow errors in close events
    8d4ccc10a77f0 selftests: mptcp: check no dup close events after error
    35bb480000cd2 mptcp: only reset subflow errors when propagated
    33f971476ffc1 mm/kasan: fix KASAN poisoning in vrealloc()
    0ac0e2e64b068 gpio: rockchip: Stop calling pinctrl for set_direction
    f69cae1bf44ca ALSA: hda/realtek: fix right sounds and mute/micmute LEDs for HP machine
    68207ceefd71c nvmet: fix race in nvmet_bio_done() leading to NULL pointer dereference
    e4e15a0a4403c efivarfs: fix error propagation in efivar_entry_get()
    14ca9fa020829 scsi: qla2xxx: edif: Fix dma_free_coherent() size
    5ba425a7bab31 kbuild: rust: clean libpin_init_internal in mrproper
    e4c0a92146ddf gpio: pca953x: mask interrupts in irq shutdown
    cb69b0a0c0aaf ASoC: amd: yc: Add DMI quirk for Acer TravelMate P216-41-TCO
    98e0bc206a321 scsi: be2iscsi: Fix a memory leak in beiscsi_boot_get_sinfo()
    91539cf522ed0 ASoC: fsl: imx-card: Do not force slot width to sample width
    8b581837295fc rust: kbuild: give `--config-path` to `rustfmt` in `.rsi` target
    50c66cb08070c rust: rbtree: fix documentation typo in CursorMut peek_next method
    fe9a1a825b4ae riscv: compat: fix COMPAT_UTS_MACHINE definition
    b038874e31fc3 firewire: core: fix race condition against transaction list
    a28fce0365e1c perf: sched: Fix perf crash with new is_user_task() helper
    112d497809970 pinctrl: qcom: sm8350-lpass-lpi: Merge with SC7280 to fix I2S2 and SWR TX pins
    e81d1bc4ea791 pinctrl: meson: mark the GPIO controller as sleeping
    e0468c4527a22 pinctrl: lpass-lpi: implement .get_direction() for the GPIO driver
    b1f41c1f0bbbe writeback: fix 100% CPU usage when dirtytime_expire_interval is 0
    36370892e3111 sched/deadline: Fix 'stuck' dl_server
    0bbcb7586bc81 sched/deadline: Document dl_server
    32887d8e4bc06 drm/xe/nvm: Fix double-free on aux add failure
    02dc6cf6409e5 drm/xe/nvm: Manage nvm aux cleanup with devres
    2859fa957a936 drm/xe/configfs: Fix is_bound() pci_dev lifetime
    64364ccf491c7 dma/pool: distinguish between missing and exhausted atomic pools
    d36c4149ea224 bcache: fix I/O accounting leak in detached_dev_do_request
    7b72d76a58e6b bcache: use bio cloning for detached device requests
    db6e287bd6e80 bcache: fix improper use of bi_end_io
    23f9f9c46edd9 of: reserved_mem: Allow reserved_mem framework detect "cma=" kernel param
    14e32032c42fe of/reserved_mem: Simplify the logic of fdt_scan_reserved_mem_reg_nodes()
    8d9c5ceff4b53 kbuild: Fix permissions of modules.builtin.modinfo
    32d8f998bb8d4 kbuild: rpm-pkg: Generate debuginfo package manually
    d4dbada7ac6f3 gpio: brcmstb: correct hwirq to bank map
    546e62c3fb29a drm/amd/pm: fix race in power state check before mutex lock
    7bec90f605cfb gpio: virtuser: fix UAF in configfs release path
    c0ce86d92565b gpiolib: acpi: use BIT_ULL() for u64 mask in address space handler
    ecb638fb9a5cc ASoC: Intel: sof_es8336: fix headphone GPIO logic inversion
    e67828aeb58d9 drm/xe: Skip address copy for sync-only execs
    4d7b7abb525b4 ASoC: soc-acpi-intel-ptl-match: fix name_prefix of rt1320-2
    a42bdbcada187 scsi: firewire: sbp-target: Fix overflow in sbp_make_tpg()
    aabc36857bd39 wifi: mac80211: correctly decode TTLM with default link map
    a4f9a19a266e6 wifi: mac80211: apply advertised TTLM from association response
    b8d890f8c3223 wifi: mac80211: parse all TTLM entries
    cc3f137d36fda net/mlx5e: Skip ESN replay window setup for IPsec crypto offload
    19bb3c68e18cf net/mlx5: Fix vhca_id access call trace use before alloc
    fc3da1466af5f net/mlx5: Initialize events outside devlink lock
    2614734c4bc67 net/mlx5: fs, Fix inverted cap check in tx flow table root disconnect
    335031cacd7e8 net: phy: micrel: fix clk warning when removing the driver
    92db64d3546f9 net/mlx5e: don't assume psp tx skbs are ipv6 csum handling
    f4bb58e14f042 net: bridge: fix static key check
    c3369fc5e6120 nfc: nci: Fix race between rfkill and nci_unregister_device().
    92e0483402afc net/mlx5e: Account for netdev stats in ndo_get_stats64
    fdf8437016f57 net/mlx5e: TC, delete flows only for existing peers
    2df2aad9cf2f4 ice: stop counting UDP csum mismatch as rx_errors
    36126ddbe9247 ice: Fix NULL pointer dereference in ice_vsi_set_napi_queues
    214aed313f7a5 ixgbe: don't initialize aci lock in ixgbe_recovery_probe()
    c721ea2ff5672 ixgbe: fix memory leaks in the ixgbe_recovery_probe() path
    bd25b092a06a3 bonding: fix use-after-free due to enslave fail after slave array update
    61858cbce6ca4 nfc: llcp: Fix memleak in nfc_llcp_send_ui_frame().
    fdb99161cbef2 net: spacemit: Check for netif_carrier_ok() in emac_stats_update()
    1f1b9523527df mptcp: fix race in mptcp_pm_nl_flush_addrs_doit()
    dce375f4afc34 rocker: fix memory leak in rocker_world_port_post_fini()
    cdc4deb9e7be2 net/mlx5: Fix return type mismatch in mlx5_esw_vport_vhca_id()
    2c0fb0f60bc15 net: wwan: t7xx: fix potential skb->frags overflow in RX path
    500c1237c9a13 ipv6: use the right ifindex when replying to icmpv6 from localhost
    0b74c6e132737 net: mvpp2: cls: Fix memory leak in mvpp2_ethtool_cls_rule_ins()
    590c8179ffb01 sfc: fix deadlock in RSS config read
    bd98324e327e4 bonding: annotate data-races around slave->last_rx
    d753f3c3f9d7a octeon_ep: Fix memory leak in octep_device_setup()
    f14d881f0a5aa net: bcmasp: fix early exit leak with fixed phy
    713ba826ae114 can: gs_usb: gs_usb_receive_bulk_callback(): fix error message
    23f40dbda938e net/mlx5: Fix memory leak in esw_acl_ingress_lgcy_setup()
    3b63185053788 Bluetooth: MGMT: Fix memory leak in set_ssp_complete
    03e8c90c62233 Bluetooth: hci_uart: fix null-ptr-deref in hci_uart_write_work
    4081d53864dae can: at91_can: Fix memory leak in at91_can_probe()
    e80617a5e1c24 btrfs: zlib: fix the folio leak on S390 hardware acceleration
    474f851ec5e2e readdir: require opt-in for d_type flags

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
index 469b766..40d0b49 100644
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
@@ -8,4 +8,4 @@ KMACHINE:genericx86 ?= "common-pc"
 KMACHINE:genericx86-64 ?= "common-pc-64"
 
 KBRANCH:genericarm64 ?= "v6.18/standard/genericarm64"
-SRCREV_machine:genericarm64 ?= "bda6fab67940d099af3f0de6dceb1b397b5d07b3"
+SRCREV_machine:genericarm64 ?= "04436cb2ef497ba23cb52e16f0e5caa54a76904a"
-- 
2.43.0


