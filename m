Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C42DD58E55
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 04:55:51 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.153566.1772427343152417979
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 20:55:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c+6xCxm5;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-899a9f445cbso52269136d6.0
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Mar 2026 20:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772427342; x=1773032142; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXtr/iIjdXUk0biSO10U39IdyL859fpkzO8vtD1LfFA=;
        b=c+6xCxm5b5Htsi/u6F4aNrEajIluILlOilFebDpVD9RT77gJheQeCcxn2hIl2wC2D/
         CMcJCsOI5wdS9mXct30q+hWcqr/OJeEfJcuq4d+qiAP/kJng0IqPKGFZrYBUtowI1ef5
         jW8NUgX41ZJfXGIDNq3e2d4Ye7xicTTGoIRDASoxt4CkRXzbffJqXmTc4BoDujUSa6kz
         pSN4mn6uwGDYp2ITC+J2WthJi+nJUOOpjKqp0wiVOmLjI2Hh9JqMj1nZFnYfxr/b0fHP
         3NdnRu1BWEL+eeqGX31yv2n3wVTf2p9Oh5l3RsdLIVd2SMw0IqzMJ0FN9h0O8mnbY5oC
         iGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772427342; x=1773032142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TXtr/iIjdXUk0biSO10U39IdyL859fpkzO8vtD1LfFA=;
        b=gVW2+8zO5g5Cpa2jQMg+1LugAHjRm+fUGlInAxH9CZcbyifRzeEnYquZRK9XkshC3+
         oNlufxxU7pUCdV8NJOBd2/FOGOcVgvHTEF7gc2KEJv6nOhSzxkgazNYOWwBiV7aHEQGO
         OV0w+2+ZrxWTpw1A4BwTu1HHxQMPcX3m3D4Z5zhjCNbPX1J/oMbKKQB6eGhYwdNmwPNZ
         D6N4JG1+i2lU2JITwQzNxXy3XnNh/DpD8ZnWp0nA3q3uIOc1/D/gsjMv8Trn/kW6OFsj
         raSu1kGEN5lnKp+20OEYRJe+85MNVwSPm3oP+/kGJ+PxRxYBOaqCtN8bBmBHCZ8bDsl0
         yKJQ==
X-Gm-Message-State: AOJu0Yy1UbW6wDDoUlpfG3H4YlsZCdbhtus8xsicHaXg4uQbr7OQhVOi
	14kImCLr/8sUzxRdfb249eRy8GDPW25OvZLUq57XnE487h0WWRebwDgTihSVFrMDBnU=
X-Gm-Gg: ATEYQzz3/XVsD/A8O3o9jiu5h1EngTlZTwnoA//otlSxKelf6JhwzYXTZo0DYgB3SVk
	Lw/EiWv7hCKSqDp4lox2kC7511gL84gS8qAPG2TIIWLUWOlHJeYCTw0SbRVVf0jMIFUPZIxhtTP
	5cXmH443ItFJnw5/DpTRwuF8d71yp/Wv99023S32LWL9QREnwADLpARc+iny/MB9xDtYHtf8NgA
	aX7a2wyDY4VzuCdefvne0mqGlmzdQJTCQhibmDiau0klvu401CmMRwEwFxLGpWpOY62kJgtX2w7
	ImN7hqlS3HLZncL2wXs65HFXMU7cZNWoxx0ME/GCIodMrokDxZ4G2NhtyX+kSWNa0iZphCoEvy3
	eaF7oDAZJr2UdWPEZamnOL4y6TZsQ9s5cKedkNR64t1Lk6bRUSpqRhKQfrQGkTYEjqwQaptkicm
	LZP+Ej/PYvN6C/v+SGPe2rdrHw9OESRbRHEOfOMSrW1WdDlQGX27ueKLkqCde6bW0a6UWBkMsyd
	VZBz3vOles7PnkYkz90SRWtGcolrXLd970HzJu2K35cND6Tn7aCrJkqXRs=
X-Received: by 2002:a05:6214:b61:b0:899:edac:29db with SMTP id 6a1803df08f44-899edac311fmr72121476d6.6.1772427341982;
        Sun, 01 Mar 2026 20:55:41 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a017add76sm2488406d6.36.2026.03.01.20.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 20:55:40 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 01/10] linux-yocto/6.18: update to v6.18.9
Date: Sun,  1 Mar 2026 23:55:27 -0500
Message-ID: <20260302045537.2153587-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302045537.2153587-1-bruce.ashfield@gmail.com>
References: <20260302045537.2153587-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 04:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232161

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
 .../linux/linux-yocto-rt_6.18.bb              |  6 ++---
 .../linux/linux-yocto-tiny_6.18.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index 532d337e53..371bb204a2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -15,13 +15,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1d69aa08808e4bb5064cf0dd61ee7e581053dab1"
-SRCREV_meta ?= "d57e94fa9cad660aef7209764d83201dd6f51fb5"
+SRCREV_machine ?= "30b6a2680c09e2ad1d8102ede3b6fd795414b168"
+SRCREV_meta ?= "142cc7ded2841bbb8ce2754a79bb14baac1f1eae"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.18.8"
+LINUX_VERSION ?= "6.18.9"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index db6daabad5..bd66d19ce1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.18.inc
 
-LINUX_VERSION ?= "6.18.8"
+LINUX_VERSION ?= "6.18.9"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "45c180b45ed85ec7b3e4454f8a8f62b122c48a2e"
-SRCREV_meta ?= "d57e94fa9cad660aef7209764d83201dd6f51fb5"
+SRCREV_machine ?= "88d7bdedfc23602f2eb39ed29eb2d16125866e48"
+SRCREV_meta ?= "142cc7ded2841bbb8ce2754a79bb14baac1f1eae"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index cc3831f798..aa54eeae7b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "4f2201e463ee13c7b27e2ed12694d9b700c4e264"
-SRCREV_machine:qemuarm64 ?= "45c180b45ed85ec7b3e4454f8a8f62b122c48a2e"
-SRCREV_machine:qemuloongarch64 ?= "45c180b45ed85ec7b3e4454f8a8f62b122c48a2e"
+SRCREV_machine:qemuarm ?= "f9b122cceadea4f67eece4623be9fc32bb80ee11"
+SRCREV_machine:qemuarm64 ?= "88d7bdedfc23602f2eb39ed29eb2d16125866e48"
+SRCREV_machine:qemuloongarch64 ?= "88d7bdedfc23602f2eb39ed29eb2d16125866e48"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "45c180b45ed85ec7b3e4454f8a8f62b122c48a2e"
-SRCREV_machine:qemuriscv64 ?= "45c180b45ed85ec7b3e4454f8a8f62b122c48a2e"
-SRCREV_machine:qemuriscv32 ?= "45c180b45ed85ec7b3e4454f8a8f62b122c48a2e"
-SRCREV_machine:qemux86 ?= "45c180b45ed85ec7b3e4454f8a8f62b122c48a2e"
-SRCREV_machine:qemux86-64 ?= "45c180b45ed85ec7b3e4454f8a8f62b122c48a2e"
+SRCREV_machine:qemuppc ?= "88d7bdedfc23602f2eb39ed29eb2d16125866e48"
+SRCREV_machine:qemuriscv64 ?= "88d7bdedfc23602f2eb39ed29eb2d16125866e48"
+SRCREV_machine:qemuriscv32 ?= "88d7bdedfc23602f2eb39ed29eb2d16125866e48"
+SRCREV_machine:qemux86 ?= "88d7bdedfc23602f2eb39ed29eb2d16125866e48"
+SRCREV_machine:qemux86-64 ?= "88d7bdedfc23602f2eb39ed29eb2d16125866e48"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "45c180b45ed85ec7b3e4454f8a8f62b122c48a2e"
-SRCREV_meta ?= "d57e94fa9cad660aef7209764d83201dd6f51fb5"
+SRCREV_machine ?= "88d7bdedfc23602f2eb39ed29eb2d16125866e48"
+SRCREV_meta ?= "142cc7ded2841bbb8ce2754a79bb14baac1f1eae"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "d905362ff5b86f6b619953ada8e0af84158db2e9"
+SRCREV_machine:class-devupstream ?= "adb851edb70783e3ded28044491f5a3ed065b7b2"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.18/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.18.8"
+LINUX_VERSION ?= "6.18.9"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


