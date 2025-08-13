Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E2A6CA0EE0
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 20:49:43 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.7053.1755118176143432410
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 13:49:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VkD98aN3;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4b0faa6601cso14638391cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 13:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755118175; x=1755722975; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPB+EnzZcx6Vb+hiaGnfLYjMbzcKkYKjrDZrGi+g0L4=;
        b=VkD98aN3Q6W5a/Z125e0up6YuxSODOJ+aKgxXiyd+B73yr98Ecb95Q1QygaBS4dAcb
         MHqmXIpPW0/APdshsj0aD449EL2skeNKE8qks8h1daY61KhygEjr/wlgtK3e/rbzNcw/
         Eg3l/5SGIOjm9wRbSc9CIFwHPRQ2W7xJyqXuI0MM2npawsDO81rPsXLl+5drTJEQJOgC
         1paEITlrEUzkmBlvobC0iTvA8TJ/NCiJKAaYuAYjPktgsNXrDWNC74aINH8YBjG2rmjk
         w9/sB3USYFHfHa01J1sFmAi7YTfOEKVDuTSlzYfBB4I+hU+sFwLEOHjZxl78CCmI2u/g
         Xsdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755118175; x=1755722975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPB+EnzZcx6Vb+hiaGnfLYjMbzcKkYKjrDZrGi+g0L4=;
        b=srgnPWmeFPp47hCoDmWOjDQ5E1G5e4NkTg69AFc4qjKNoFXIIdmiebXS5PZxTAomb6
         I7TPNcmlpAoCa0jA3H+dg1/bKB64WwOL7GduqXPVfDt/GD9eqQf1hiBT3uvPZbVJlHWl
         jUaAxEA5BqhoFg31SK7vsu+mhaohhVZGbDTCE20teLyjPWaPnVy/vETD5JeR6tHdhe92
         PvKcNWDGl6MP+C9uFqnLMA+6nozltQoGwXAG/w6CnhdcAb42IC+0A3sLFzu3yo7QZxXr
         zc64XUUVpa53YShZjmxtseFHeMcVp72C0Ui03UPl1r3no5MACIB1SiQMyyR3j8GLtx3G
         XPdQ==
X-Gm-Message-State: AOJu0YyrwmDaBrqBhf/ADNC+anE8mfWediBbD5iW0Cd9WL8AZfAJsgnF
	gbJM93ZLPHimF4tcvdYv6Hr31JckK6TwBb3pIWStOE3Nmj6e6wisJ6GCu1bpyNoU
X-Gm-Gg: ASbGncuNMWWVyn9+LGm0nFyspM9682VCH/zPB1SiFA6uSuIcUenWoqveQ9NxA9E9wXn
	KWb8gH2BBYLrlvd/Xv/aocc2GoyBzjD4TiNvnf2z1lmIlZrtR2OhgYnCvFEnl9ESPQhXUXvipos
	VRbUaSOS3qT2lHqzdLvt+ZP7WS/gdKUvJF7/pUAdbBT+JQwMAqGoVpWkgLxD5AsG/+3lShJGWPs
	17Y4tqkCV102Cz4Diqg/jLmTRRbveRfRg34yKEIYoMhKBr9XWomQpftGXKk6ilXTmqjITkvda3i
	WRK2+G30G/8NedM4NRHumaVWp08wWaVH+kN1kkYTQmcAjcyiJ/B7vGtT+M2ptDS3LykvfpkQiC3
	t+IOk4giKGe+0eoNsNrxHnML9CCdyeWYekYISEBrNPaXxyupnZFi/sIaOzTdPkxFqRI+ah7RlE4
	pHJ9hJVQn7r1u69yY/PEMErz8=
X-Google-Smtp-Source: AGHT+IELABTBlNC7nIFyrHtAeXhtjDnQCqOjfxSml4Cg9MR3Fb9HhsoWDliM/Hr8q3YNJx1dKxT82w==
X-Received: by 2002:a05:6214:1d23:b0:707:5046:6a1e with SMTP id 6a1803df08f44-70b9821b51amr2340306d6.10.1755118174743;
        Wed, 13 Aug 2025 13:49:34 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70af5b07658sm3326516d6.43.2025.08.13.13.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 13:49:32 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/8] linux-yocto/6.12: update to v6.12.41
Date: Wed, 13 Aug 2025 16:49:21 -0400
Message-Id: <0188f21a6bb22e4c09c09f5cfc5540359f5afffa.1755118020.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1755118020.git.bruce.ashfield@gmail.com>
References: <cover.1755118020.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 20:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221827

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

no ids found, dumping:
    8f5ff9784f32 Linux 6.12.41
    c0c21293d0c2 mm: khugepaged: fix call hpage_collapse_scan_file() for anonymous vma
    c60f5156e62d KVM: x86: Free vCPUs before freeing VM state
    d8b3dfd4d36c Revert "drm/xe/forcewake: Add a helper xe_force_wake_ref_has_domain()"
    ffbedb4ad984 Revert "drm/xe/devcoredump: Update handling of xe_force_wake_get return"
    5a276d341c8e Revert "drm/xe/tests/mocs: Update xe_force_wake_get() return handling"
    c72303e7eb49 Revert "drm/xe/gt: Update handling of xe_force_wake_get return"
    69fbb3f1740b drm/i915/dp: Fix 2.7 Gbps DP_LINK_BW value on g4x
    bc9abdf6bce8 ALSA: hda: Add missing NVIDIA HDA codec IDs
    beb314a55e1e ALSA: hda/tegra: Add Tegra264 support
    c7f864d34529 Drivers: hv: Make the sysfs node size for the ring buffer dynamic
    beddf74e4064 ARM: 9448/1: Use an absolute path to unified.h in KBUILD_AFLAGS
    90d5cd64f46d iio: hid-sensor-prox: Fix incorrect OFFSET calculation
    05847477ff8a iio: hid-sensor-prox: Restore lost scale assignments
    86dca1cb4804 wifi: mt76: mt7925: adjust rm BSS flow to prevent next connection failure
    b63eb95856c0 Revert "wifi: mt76: mt7925: Update mt7925_mcu_uni_[tx,rx]_ba for MLO"
    98937588ff9c arm64: dts: qcom: x1-crd: Fix vreg_l2j_1p2 voltage
    3d12349ade54 x86/hyperv: Fix APIC ID and VP index confusion in hv_snp_boot_ap()
    f1b3ad11ec11 KVM: x86/hyper-v: Skip non-canonical addresses during PV TLB flush
    d483bf624f22 KVM: x86: model canonical checks more precisely
    c0c82c2adc22 KVM: x86: Add X86EMUL_F_MSR and X86EMUL_F_DT_LOAD to aid canonical checks
    62dd9132a458 KVM: x86: Route non-canonical checks in emulator through emulate_ops
    94620f95f6cd KVM: x86: drop x86.h include from cpuid.h
    a4d60ba277ec ext4: fix out of bounds punch offset
    51492e99894a ext4: correct the error handle in ext4_fallocate()
    85defb9933f6 ext4: fix incorrect punch max_end
    35bd33e3ef09 ext4: move out common parts into ext4_fallocate()
    8a98313caa3a ext4: move out inode_lock into ext4_fallocate()
    1697ca500a84 ext4: factor out ext4_do_fallocate()
    2cbc4d640d40 ext4: refactor ext4_insert_range()
    8bb93d988212 ext4: refactor ext4_collapse_range()
    db1fcf7fd51c ext4: refactor ext4_zero_range()
    33f61ecabb10 ext4: refactor ext4_punch_hole()
    d9116d28538a ext4: don't explicit update times in ext4_fallocate()
    a5ae7fa30cd9 erofs: fix large fragment handling
    41485d7c637b erofs: clean up header parsing for ztailpacking and fragments
    f9b2cb6fff33 erofs: simplify tail inline pcluster handling
    516fabf34173 erofs: use Z_EROFS_LCLUSTER_TYPE_MAX to simplify switches
    9a84e212e334 erofs: refine z_erofs_get_extent_compressedlen()
    4d0f12dc8335 erofs: simplify z_erofs_load_compact_lcluster()
    1e5a88732ace arm64: dts: qcom: x1e78100-t14s: mark l12b and l15b always-on
    4a7b64ba0cca mtd: rawnand: qcom: Fix last codeword read in qcom_param_page_type_exec()
    a1bc9a394a27 crypto: powerpc/poly1305 - add depends on BROKEN for now
    b49b543f4e0b comedi: comedi_test: Fix possible deletion of uninitialized timers
    28419a4f3a1e jfs: reject on-disk inodes of an unsupported type
    3ad50c7c66cc x86/bugs: Fix use of possibly uninit value in amd_check_tsa_microcode()
    b85815675fc5 spi: cadence-quadspi: fix cleanup of rx_chan on failure paths
    a7c6de9f8467 usb: typec: tcpm: apply vbus before data bringup in tcpm_src_attach
    27e423886a7a usb: typec: tcpm: allow switching to mode accessory to mux properly
    a9a1eb410f35 usb: typec: tcpm: allow to use sink in accessory mode
    77a4a907cc53 selftests/bpf: Add tests with stack ptr register in conditional jmp
    bafb375c4606 rust: give Clippy the minimum supported Rust version
    4c8f15e770fb mm/zsmalloc: do not pass __GFP_MOVABLE if CONFIG_COMPACTION=n
    656eaddbc952 mm/vmscan: fix hwpoisoned large folio handling in shrink_folio_list
    140edd5adf6d selftests: mptcp: connect: also cover checksum
    219c4eb6c3f0 selftests: mptcp: connect: also cover alt modes
    1bff28ea4b11 resource: fix false warning in __request_region()
    79663a15a1c7 nilfs2: reject invalid file types when reading inodes
    27e740614df8 kasan: use vmalloc_dump_obj() for vmalloc error reports
    0fde7dccbf4c ice: Fix a null pointer dereference in ice_copy_and_init_pkg()
    44af78621c09 gve: Fix stuck TX queue for DQ queue format
    50c61f55b6b9 e1000e: ignore uninitialized checksum word on tgp
    78328fad6c49 e1000e: disregard NVM checksum on tgp when valid checksum bit is not set
    a3bba0205830 dpaa2-switch: Fix device reference count leak in MAC endpoint handling
    4dd56cabfbe5 dpaa2-eth: Fix device reference count leak in MAC endpoint handling
    708fd522b86d arm64/entry: Mask DAIF in cpu_switch_to(), call_on_irq_stack()
    060a28e39053 ALSA: hda/realtek - Add mute LED support for HP Victus 15-fa0xxx
    d3f60054b6a0 ALSA: hda/realtek - Add mute LED support for HP Pavilion 15-eg0xxx
    ba8e8a8a2e19 sprintf.h requires stdarg.h
    cf8e62f6e1b2 bus: fsl-mc: Fix potential double device reference in fsl_mc_get_endpoint()
    5b8d6cb9a03d i2c: virtio: Avoid hang by using interruptible completion wait
    5622108c3041 i2c: tegra: Fix reset error handling with ACPI
    42c4471b30fa i2c: qup: jump out of the loop in case of timeout
    9ea8a9ebbea8 timekeeping: Zero initialize system_counterval when querying time from phc drivers
    6ed79cf1183a ARM: 9450/1: Fix allowing linker DCE with binutils < 2.36
    f7ff03247600 mm/ksm: fix -Wsometimes-uninitialized from clang-21 in advisor_mode_show()
    f5ee8a39f03e drm/sched: Remove optimization that causes hang when killing dependent jobs
    198604687f19 drm/amdgpu: Reset the clear flag in buddy during resume
    d2a6a3543fd2 platform/x86: ideapad-laptop: Fix kbd backlight not remembered among boots
    616ca3c4d11e platform/x86: ideapad-laptop: Fix FnLock not remembered among boots
    4de81eb46284 net: hns3: default enable tx bounce buffer when smmu enabled
    68494b2ca295 net: hns3: fixed vf get max channels bug
    952cd60f695b net: hns3: disable interrupt when ptp init failed
    7676d652801c net: hns3: fix concurrent setting vlan filter issue
    1194ad0d44d6 s390/ism: fix concurrency management in ism_cmd()
    de5aaea0384c selftests: drv-net: wait for iperf client to stop sending
    61baf2a43d45 ALSA: hda/realtek: Fix mute LED mask on HP OMEN 16 laptop
    5c25b4f2769e drm/bridge: ti-sn65dsi86: Remove extra semicolon in ti_sn_bridge_probe()
    0ca816a96fdc can: netlink: can_changelink(): fix NULL pointer deref of struct can_priv::do_set_mode
    11a2eadf0bd2 net/sched: sch_qfq: Avoid triggering might_sleep in atomic context in qfq_delete_class
    5f02ea0f63dd net: appletalk: Fix use-after-free in AARP proxy probe
    18617f4063e5 i40e: When removing VF MAC filters, only check PF-set MAC
    dc08e1772566 i40e: report VF tx_dropped with tx_errors instead of tx_discards
    ebd24581e055 net/mlx5: E-Switch, Fix peer miss rules to use peer eswitch
    6b1f7194d02c net/mlx5: Fix memory leak in cmd_exec()
    07759e28a3b5 net: ti: icssg-prueth: Fix buffer allocation for ICSSG
    1dc0ed16cfbc ASoC: mediatek: mt8365-dai-i2s: pass correct size to mt8365_dai_set_priv
    5918c3f4800a xfrm: interface: fix use-after-free after changing collect_md xfrm interface
    07ab45902446 xfrm: Set transport header to fix UDP GRO handling
    085f24f0be55 xfrm: state: use a consistent pcpu_id in xfrm_state_find
    6bf2daafc51b xfrm: state: initialize state_ptrs earlier in xfrm_state_find
    80d66be8a04f staging: vchiq_arm: Make vchiq_shutdown never fail
    0fb8478fb0ea platform/x86: Fix initialization order for firmware_attributes_class
    9128b2dbe510 x86/hyperv: Fix usage of cpu_online_mask to get valid cpu
    ef3bee8d1da1 tools/hv: fcopy: Fix incorrect file path conversion
    8a1fbb642b74 platform/mellanox: mlxbf-pmc: Use kstrtobool() to check 0/1 input
    d38e1e0a64a9 platform/mellanox: mlxbf-pmc: Validate event/enable input
    f0580af3d3ec platform/mellanox: mlxbf-pmc: Remove newline char from event name input
    1b102d2cc4bc regmap: fix potential memory leak of regmap_bus
    be4f30f7c178 iio: adc: ad7949: use spi_is_bpw_supported()
    5aa9a2d57899 interconnect: qcom: sc7280: Add missing num_links to xm_pcie3_1 node
    3fd782ceabea RDMA/core: Rate limit GID cache warning messages
    96876f6e859e platform/x86: asus-nb-wmi: add DMI quirk for ASUS Zenbook Duo UX8406CA
    5d4261dbb333 regulator: core: fix NULL dereference on unbind due to stale coupling data
    bf812206f2d0 virtio_ring: Fix error reporting in virtqueue_resize
    30ce52f1616e virtio_net: Enforce minimum TX ring size for reliability
    a7b79db25846 Input: gpio-keys - fix a sleep while atomic with PREEMPT_RT
    2bf554c820f1 x86/traps: Initialize DR7 by writing its architectural reset value

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index fdb0caa943..72525d8764 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "96c3b8967c299edb7c8fd1beff358624e3aac443"
-SRCREV_meta ?= "52dd739a32215ffca801bc40daebee19a01b6f20"
+SRCREV_machine ?= "a40a131df6cba8f7ff468416f0cbe8e694974c8c"
+SRCREV_meta ?= "57f788e849d9b04dd6aa28b896546c56b45f69e7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.40"
+LINUX_VERSION ?= "6.12.41"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 3dccc9e723..733b163c77 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.40"
+LINUX_VERSION ?= "6.12.41"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "50893c3858cc7bbc15a174f06fa30fba25306cac"
-SRCREV_meta ?= "52dd739a32215ffca801bc40daebee19a01b6f20"
+SRCREV_machine ?= "4137e9dd62e47f0f7472c7f0dfcbef5f8929f280"
+SRCREV_meta ?= "57f788e849d9b04dd6aa28b896546c56b45f69e7"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index c58e5f07f4..3c27a7e719 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "3884ae3c574f932b6cfe528f86c83214c2e8a36e"
-SRCREV_machine:qemuarm64 ?= "50893c3858cc7bbc15a174f06fa30fba25306cac"
-SRCREV_machine:qemuloongarch64 ?= "50893c3858cc7bbc15a174f06fa30fba25306cac"
-SRCREV_machine:qemumips ?= "39d23e283ab644b5a8758046130b8c22847176f8"
-SRCREV_machine:qemuppc ?= "50893c3858cc7bbc15a174f06fa30fba25306cac"
-SRCREV_machine:qemuriscv64 ?= "50893c3858cc7bbc15a174f06fa30fba25306cac"
-SRCREV_machine:qemuriscv32 ?= "50893c3858cc7bbc15a174f06fa30fba25306cac"
-SRCREV_machine:qemux86 ?= "50893c3858cc7bbc15a174f06fa30fba25306cac"
-SRCREV_machine:qemux86-64 ?= "50893c3858cc7bbc15a174f06fa30fba25306cac"
-SRCREV_machine:qemumips64 ?= "3cf1294a14f4a23376b86201ab5bdff6159102ad"
-SRCREV_machine ?= "50893c3858cc7bbc15a174f06fa30fba25306cac"
-SRCREV_meta ?= "52dd739a32215ffca801bc40daebee19a01b6f20"
+SRCREV_machine:qemuarm ?= "01bbdad6b55cc37010a721899318f591ba5f09a6"
+SRCREV_machine:qemuarm64 ?= "4137e9dd62e47f0f7472c7f0dfcbef5f8929f280"
+SRCREV_machine:qemuloongarch64 ?= "4137e9dd62e47f0f7472c7f0dfcbef5f8929f280"
+SRCREV_machine:qemumips ?= "aa348bdab88ee1c6358af8e3b9d210738884a8f6"
+SRCREV_machine:qemuppc ?= "4137e9dd62e47f0f7472c7f0dfcbef5f8929f280"
+SRCREV_machine:qemuriscv64 ?= "4137e9dd62e47f0f7472c7f0dfcbef5f8929f280"
+SRCREV_machine:qemuriscv32 ?= "4137e9dd62e47f0f7472c7f0dfcbef5f8929f280"
+SRCREV_machine:qemux86 ?= "4137e9dd62e47f0f7472c7f0dfcbef5f8929f280"
+SRCREV_machine:qemux86-64 ?= "4137e9dd62e47f0f7472c7f0dfcbef5f8929f280"
+SRCREV_machine:qemumips64 ?= "d3850d4a70821a2d63be812b316ca0d05c2c0c24"
+SRCREV_machine ?= "4137e9dd62e47f0f7472c7f0dfcbef5f8929f280"
+SRCREV_meta ?= "57f788e849d9b04dd6aa28b896546c56b45f69e7"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "d90ecb2b1308b3e362ec4c21ff7cf0a051b445df"
+SRCREV_machine:class-devupstream ?= "8f5ff9784f3262e6e85c68d86f8b7931827f2983"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.40"
+LINUX_VERSION ?= "6.12.41"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


