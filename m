Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C70EED58CC5
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 03:25:20 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9699.1774236314025584308
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Mar 2026 20:25:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dGukhgmx;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-50b392f1846so41646431cf.3
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Mar 2026 20:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774236313; x=1774841113; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUq8hLrlFSHnH1fFjk5gpBuUmvSayZm7BSELpMXr2W0=;
        b=dGukhgmx7W90JRmk14ByAbaELSO53sjg8uxAnTYKtQhVQvlIGQ6TkOBlXmMGQpnNQm
         NMymKdZoNLrp+MpowKh95Qi54oNfy+pwAL7H4v8fYzKHhdtf3KcJmsv1mlRCPGiHEHx4
         D2h/o92OPmsUSkRtaF+nn0DDJ1m2jfj/tS2jNY2eHtr4tsPp+5VfJVZpyM9XBENXYS6z
         2xcxbV503n87ony3COCy0hjE8OjlphcupQrKoEvxmGLg0wvVqrMV+eRiD1k8z+gKk8zn
         vsAyLGKvfG3AdIo3lJ6vA53FR2dgU9Ya9jlDjs1rz1rAYTeXXbv3obQzOsIDFE8BJ0Rw
         FOAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774236313; x=1774841113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IUq8hLrlFSHnH1fFjk5gpBuUmvSayZm7BSELpMXr2W0=;
        b=XR8gk5OJNjYk0ssoqAjOjbNG5GPWp3j839tWf+nexuGqPw/o9VXCPSje8RJFKl+ZQj
         ppc4STfEwcfCH9ItvY6u1cB5+7sNt+J1TIHJa+xI4TGjDHEwqoULtculatt44emK7yAP
         wUwYxZx8DrOvf6RNMamPdEcqxGDr5VjDralsL0nE/yrr4dJ90JisdN8ohdop29+9Pavo
         pYj3q5Q0wYLHnD+ZzpKfsvb+Jhcq74rEPKSBSZ2ZPD17Phmjsit5NVauS6akieLi70t5
         H4k7p0PhPI/4N15eoV4qn5SA71Mf5HC8StVMnnY7vfeBR8kmdbZi4BXxNgHO1fhagpwJ
         a2Gg==
X-Gm-Message-State: AOJu0Yzo0CZqBKloS7zHy4hKQWO/QoStCB6SoCaf4uA0U1DnKhIP1ScU
	d3/omm2ssXdFuSF4cHjYdZzbw7g1ojaZ1mHcIOG/hhKYrYZtX52MN4/mX6Ih5ABr
X-Gm-Gg: ATEYQzy1B1ZMEW578ajBTdP8Ab2FQqYA8hoqTkt4Uc1a9UBg63HoB5hSI5JaoL50WhB
	lNCCWNnxfXj3kR3a6d52PRQCopE/YmFpqhKR3fu78RR57toVmGgrDOVtCk6vmLJ8XR6AJc63aId
	dfHG5UCPo+8d3cmrioFvQbxFDSnTRMKJtvvSI+1/uciz+qRpxO5QidMpwBJ9w81GyWd4L35+Q1J
	CHt7yQNwYqgR1ldE8A1tPh9mO+z8ToaaSDPRMcWsqV6ADWY3O2EUEfsmp94eeXrQn7lx5iuMc3d
	+TkUDtEicp/Ji13KYaFH31kpR5j0fqmYts66XWLoQFeRK3VBKQH1gmfM1pKvw3o0nrRW4jNyAaX
	jhL9r4pdvh+9yLPjAfW8Z8UwCrQ4/J46/mwp/kgh16Nqjo/2g63cUoxwsk5lQUzU9Bgc3WvnqT8
	oi7RcnKOEPm7SCKyqqScdQC4M6//jFoUXkELxxqY6PPW1odWSk6P6WFEe6637XXz1wkfu9io/ay
	Dr3kwAfmMDM+9FP51QL4QB+Q6LoujeTfJfFQVWSOPd6zuLQHw1iWmVUaao=
X-Received: by 2002:a05:622a:5c7:b0:506:6caf:3cab with SMTP id d75a77b69052e-50b37474561mr173441561cf.26.1774236313040;
        Sun, 22 Mar 2026 20:25:13 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36e34f8bsm89352351cf.15.2026.03.22.20.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 20:25:12 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][kirkstone][PATCH 01/02] linux-yocto/5.15: update to v5.15.200
Date: Sun, 22 Mar 2026 23:25:08 -0400
Message-ID: <20260323032509.1590084-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323032509.1590084-1-bruce.ashfield@gmail.com>
References: <20260323032509.1590084-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 03:25:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233692

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    e45d5d41c1343 Linux 5.15.200
    7ca5540ba6239 riscv: Replace function-like macro by static inline function
    cbae610ca9e27 nvmet-tcp: pass iov_len instead of sg->length to bvec_set_page()
    6a04dc650cef8 spi: tegra: Fix a memory leak in tegra_slink_probe()
    c7a02a814dc51 spi: tegra210-quad: Protect curr_xfer clearing in tegra_qspi_non_combined_seq_xfer
    9fa4262a80f75 spi: tegra210-quad: Protect curr_xfer in tegra_qspi_combined_seq_xfer
    55dfe2687a496 spi: tegra210-quad: Protect curr_xfer assignment in tegra_qspi_setup_transfer_one
    eebd79beb268c spi: tegra210-quad: Move curr_xfer read inside spinlock
    4f9e7de7a6b8f spi: tegra210-quad: Return IRQ_HANDLED when timeout already processed transfer
    b34289505180a iommu: disable SVA when CONFIG_X86 is set
    1ecf6dc2676ea Bluetooth: hci_event: call disconnect callback before deleting conn
    214b85b9b7187 gve: Correct ethtool rx_dropped calculation
    9d93332397405 gve: Fix stats report corruption on queue count change
    8aa1b0bc65967 tracing: Fix ftrace event field alignments
    c3c5cfa3170c0 gfs2: Fix NULL pointer dereference in gfs2_log_flush
    343fe375a8dd6 hfsplus: fix slab-out-of-bounds read in hfsplus_uni2asc()
    be6d98766ac95 riscv: uprobes: Add missing fence.i after building the XOL buffer
    d7ead65126504 ASoC: amd: fix memory leak in acp3x pdm dma ops
    42afe8ed8ad2d nvmet-tcp: add bounds checks in nvmet_tcp_build_pdu_iovec
    4c09184f08ce6 nvmet-tcp: don't map pages which can't come from HIGHMEM
    15e329ce1a957 nvmet-tcp: fix regression in data_digest calculation
    1a5c3c99efa11 nvmet-tcp: fix memory leak when performing a controller reset
    367fd132df419 nvmet-tcp: add an helper to free the cmd buffers
    8c760ba4e36c7 netfilter: nf_tables: fix inverted genmask check in nft_map_catchall_activate()
    166f29d4af575 hwmon: (occ) Mark occ_init_attribute() as __printf
    3f531122a5801 tipc: use kfree_sensitive() for session key material
    5dae6b36a7cb7 macvlan: fix error recovery in macvlan_common_newlink()
    77611cab5bdff dpaa2-switch: add bounds check for if_id in IRQ handler
    01fbca1e93ec3 net: liquidio: Fix off-by-one error in VF setup_nic_devices() cleanup
    d86c58eb005eb net: liquidio: Fix off-by-one error in PF setup_nic_devices() cleanup
    c81a8515fb8c8 net: liquidio: Initialize netdev pointer before queue setup
    2fcccca88456b dpaa2-switch: prevent ZERO_SIZE_PTR dereference when num_ifs is zero
    c01cc6fe06cf2 platform/x86: intel_telemetry: Fix PSS event register mask
    5bce10f0f9435 platform/x86: toshiba_haps: Fix memory leaks in add/remove routines
    193f087207ad8 wifi: mac80211: don't increment crypto_tx_tailroom_needed_cnt twice
    8518f072fc929 scsi: target: iscsi: Fix use-after-free in iscsit_dec_conn_usage_count()
    fd8b090017330 scsi: target: iscsi: Fix use-after-free in iscsit_dec_session_usage_count()
    c85c9de39cd5d wifi: cfg80211: Fix bitrate calculation overflow for HE rates
    15e9607df7925 ASoC: tlv320adcx140: Propagate error codes during probe
    1525f1068295f ASoC: davinci-evm: Fix reference leak in davinci_evm_probe
    536238ba39829 wifi: mac80211: collect station statistics earlier when disconnect
    6e4cc9e399952 ring-buffer: Avoid softlockup in ring_buffer_resize() during memory free
    16c2ca35257ed HID: Apply quirk HID_QUIRK_ALWAYS_POLL to Edifier QR30 (2d99:a101)
    04485e691d8ca HID: quirks: Add another Chicony HP 5MP Cameras to hid_ignore_list
    67e06e8a77c1a netfilter: replace -EEXIST with -EBUSY
    e9aefab3b7eb4 ALSA: hda/realtek: add HP Laptop 15s-eq1xxx mute LED quirk
    2d8af4db1f209 HID: playstation: Center initial joystick axes to prevent spurious events
    d21497331b967 HID: intel-ish-hid: Reset enum_devices_done before enumeration
    d5cce2ec0e985 HID: multitouch: add MT_QUIRK_STICKY_FINGERS to MT_CLS_VTL
    a2c68e256fb7a smb/server: call ksmbd_session_rpc_close() on error path in create_smb2_pipe()
    e5dd6a58a52d5 block,bfq: fix aux stat accumulation destination
    64240689acff8 net: usb: sr9700: support devices with virtual driver CD
    cd89a4656c03f wifi: wlcore: ensure skb headroom before skb_push
    b04c75366a547 wifi: mac80211: ocb: skip rx_no_sta when interface is not joined
    9a6cdfd7b6aaa binderfs: fix ida_alloc_max() upper bound
    ba43ac025c431 timers: Fix NULL function pointer race in timer_shutdown_sync()
    f24f9ea7d69ef Bluetooth: hci_qca: Fix the teardown problem for real
    e7f1ca8ea41ab timers: Update the documentation to reflect on the new timer_shutdown() API
    36bdfa51a1ad7 timers: Provide timer_shutdown[_sync]()
    debbcf812d735 timers: Add shutdown mechanism to the internal functions
    21ca3ee3f6faa timers: Split [try_to_]del_timer[_sync]() to prepare for shutdown mode
    a7035e7d720f8 timers: Silently ignore timers with a NULL function
    e45a52685b335 Documentation: Replace del_timer/del_timer_sync()
    29d5751350cdf timers: Rename del_timer() to timer_delete()
    a431c4c27ee05 timers: Replace BUG_ON()s
    d2736470196f2 timers: Get rid of del_singleshot_timer_sync()
    9b78a3b948bb6 clocksource/drivers/sp804: Do not use timer namespace for timer_shutdown() function
    a97b47fed39d9 clocksource/drivers/arm_arch_timer: Do not use timer namespace for timer_shutdown() function
    b03eb334c42ea ARM: spear: Do not use timer namespace for timer_shutdown() function
    7bcf91585f3b1 Documentation: Remove bogus claim about del_timer_sync()
    4abccfb61f422 netfilter: nft_set_pipapo: clamp maximum map bucket size to INT_MAX
    d6ae339f18099 mm/kfence: randomize the freelist on initialization
    2284bc168b148 KVM: Don't clobber irqfd routing type when deassigning irqfd
    a550cc2564cab ARM: 9468/1: fix memset64() on big-endian
    5928ca551e361 rbd: check for EOD after exclusive lock is ensured to be held
    446d7283cffa5 platform/x86: intel_telemetry: Fix swapped arrays in PSS output
    674ebe2d6fe59 x86/kfence: fix booting on 32bit non-PAE systems

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index e23c8bf88a..526f3c64b7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "27c8048897d9d7ff1ed6d2643cbc024eb13ae342"
-SRCREV_meta ?= "78eca082b68ad521c3bb9a1f9f0325e044045f18"
+SRCREV_machine ?= "671f06e26c741b7d55d8afcc30e64f1480cec166"
+SRCREV_meta ?= "b75d71b7f2455467f2260d514040ccb44d4bdda5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.199"
+LINUX_VERSION ?= "5.15.200"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 21233285b5..1eeda2e22c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.199"
+LINUX_VERSION ?= "5.15.200"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "7b20eb2129d25bb2a1cb963d30c2f3adb1e144b3"
-SRCREV_meta ?= "78eca082b68ad521c3bb9a1f9f0325e044045f18"
+SRCREV_machine ?= "0d4112b87ce7dd038dc712ef616c0b6dd333c786"
+SRCREV_meta ?= "b75d71b7f2455467f2260d514040ccb44d4bdda5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 861af0041a..5f8bfba396 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "0ea8d4a7d24642475c1d1e0d8be44976600eb630"
-SRCREV_machine:qemuarm64 ?= "33aae9ebda82736fc0246e4d2bd7967bb7ef492a"
-SRCREV_machine:qemumips ?= "0d159686c17443503bc7b59f25b5129c8543193d"
-SRCREV_machine:qemuppc ?= "c8e213f83bae4792c1042bdcedd46fa60963c69b"
-SRCREV_machine:qemuriscv64 ?= "e7bbf58a0f6828ffb92109eb423eb3d1327f091a"
-SRCREV_machine:qemuriscv32 ?= "e7bbf58a0f6828ffb92109eb423eb3d1327f091a"
-SRCREV_machine:qemux86 ?= "e7bbf58a0f6828ffb92109eb423eb3d1327f091a"
-SRCREV_machine:qemux86-64 ?= "e7bbf58a0f6828ffb92109eb423eb3d1327f091a"
-SRCREV_machine:qemumips64 ?= "58c96e47bbd784e078e265426b9276bad2bb7e22"
-SRCREV_machine ?= "e7bbf58a0f6828ffb92109eb423eb3d1327f091a"
-SRCREV_meta ?= "78eca082b68ad521c3bb9a1f9f0325e044045f18"
+SRCREV_machine:qemuarm ?= "44b7b6bdfaab20ab51f175aeb0df8c27791cc40d"
+SRCREV_machine:qemuarm64 ?= "d67ad97cb5d6a51184bd61853e3af7e044c7f1d4"
+SRCREV_machine:qemumips ?= "94fe5264de5b6ba6a5fab53b3f2283e36033e373"
+SRCREV_machine:qemuppc ?= "a065262f1076ca606ea8229f84b23c10be2680e7"
+SRCREV_machine:qemuriscv64 ?= "af4baa923d4f04a259e3199e9e63d9415bdf3e3a"
+SRCREV_machine:qemuriscv32 ?= "af4baa923d4f04a259e3199e9e63d9415bdf3e3a"
+SRCREV_machine:qemux86 ?= "af4baa923d4f04a259e3199e9e63d9415bdf3e3a"
+SRCREV_machine:qemux86-64 ?= "af4baa923d4f04a259e3199e9e63d9415bdf3e3a"
+SRCREV_machine:qemumips64 ?= "00831bab13b4320ee27e4ddc72b55542bfe75ec8"
+SRCREV_machine ?= "af4baa923d4f04a259e3199e9e63d9415bdf3e3a"
+SRCREV_meta ?= "b75d71b7f2455467f2260d514040ccb44d4bdda5"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "7b232985052fcf6a78bf0f965aa4241c0678c2ba"
+SRCREV_machine:class-devupstream ?= "e45d5d41c1343aad8c7587a5b15d58e99aff4c8a"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.199"
+LINUX_VERSION ?= "5.15.200"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.43.0


