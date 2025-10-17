Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4BBECCD1A5
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 20:39:53 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.3129.1760733589360345908
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 13:39:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bFkiEnv3;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-79ef9d1805fso2302584b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 13:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760733588; x=1761338388; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2DHENV7fOcF0J94jakYnrVVRAWUAlvyEC6uE/5TwM/E=;
        b=bFkiEnv3GXrTjryEmTLjD3eK8hzhxAFXXVo+89KAxL8eYG8O28qoKnjAuzLFn3TnvO
         x+fEo0h65YGwXzRw++f4jK8VXtk71zkepul8rgJwsEVVIDtn65qXOyvoLYB2E9zfaBzJ
         pvAbnraSqqmuTzOyPEGU7LNSJjI+Nh48wYYEmZIzlntFNDCq5LAOnscBDCgpd+Z3jhUG
         aWTT/lR5H9T/Pc3FeVnKoOy1oP72apqDE0HZwfg6LQMSx6QEoC3a7hO3GqC1XpwiASoA
         k8Ui4nQOm8/c3QGpn1RkGnYiX7DWW7fbX3h+/IMP94VYPoQhFmTGKuVycu+u+Q1eJlbf
         ixXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733589; x=1761338389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2DHENV7fOcF0J94jakYnrVVRAWUAlvyEC6uE/5TwM/E=;
        b=d3GSH6QbapbtwrsI2OWR2L2czOQYnrEaq5iJ7JukWML2wIO9TrJtJqd8XymBoeL+rK
         R8janQEnJDGdjMKVwU1u3mWdK4Na458lb9C8V5T97hCfCLP08hMjMXS9Va3T8jgkdmja
         vdaBOxXwzqoVk+6cIL9gk7IHivyy+G8LrQ/LxcxvYCwI/wRKsZ/OnevX+/UMlOwa2n+y
         NRsXpADYaZ8bQCtREr5r014dnxIGyGNlMpmabst5MjX8mkjzVljUiFPV8ynE11T1oY2p
         AadK+rGOvi0T9SCckTUVw2FTEv8MZ3BKub90qa1jgY9veFzsFilnjn5kA2P8DdfZ4p9D
         WGKg==
X-Gm-Message-State: AOJu0Yyfnu3IGj3A2lBl02Tw8XagiSe+8dO01ZehKF/+vBMu1sFihDzh
	lKcOqmo8ZxBh6ZiXaaxpEwNiWdmmzDSNFpTqi/JhtCq9uLteDwITSHVQbAu/Odve2+XwlcVI9z0
	7llX2MFg=
X-Gm-Gg: ASbGncscf/Bdm3D1y1FrBYppxvlKxIsn2b+1etLIa5DEqS/ITHBhAyQsFwgqaV7mUIZ
	PLA8PMcrmraaaZ3Ar56Jce7t1vEL4DP1Tyo7TNWCQovEp9WXXE9CU2O8CJL4qTV0AQIgOx/Z3ht
	LPqxmR98YwOVy1yI+hWog86cpYLCmZz+Cl8JXebuRkJNpICfQKeW0Z35k88u2q/Y7Lbr7MTK7kD
	WBpaQjQEceptNW7KxrCyBJN81OrR12r+0aTYbNibojSF6P7gtSB7tNA2UU43a/jq2UExYnVP22r
	QdM3jO/IYfxIb2CikybajKOxs9UDjvGbVvCMeg+gSb0BAVOsl2+KV6i5a3cr9kuoiTmLq7Ns2/5
	BkgZNYBEEJb8khxj/ChlTJ1qWzOAxpS6O1ETO8yaBirOEstKUcDcRIl9w1u7vsNWAmg==
X-Google-Smtp-Source: AGHT+IGNl88/6O9dkGOLgM8WzrWuMVKIKtC0cQXyKLYArw6riDdvGmaNHEO5y/Kb1VwLbQmju2PP+w==
X-Received: by 2002:a05:6a21:328a:b0:334:8dcb:567b with SMTP id adf61e73a8af0-334a8643d4amr6996449637.52.1760733588455;
        Fri, 17 Oct 2025 13:39:48 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:aaee:e640:34cd:6f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f254esm477061b3a.45.2025.10.17.13.39.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:39:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/26] linux-yocto/6.6: update to v6.6.101
Date: Fri, 17 Oct 2025 13:38:58 -0700
Message-ID: <40092b395a04921dd8f0f54f352d958084167227.1760733431.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760733431.git.steve@sakoman.com>
References: <cover.1760733431.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 20:39:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225049

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

no ids found, dumping:
    3a8ababb8b6a Linux 6.6.101
    41d3c751fcb4 Revert "selftests/bpf: Add a cgroup prog bpf_get_ns_current_pid_tgid() test"
    1af6d1696ca4 spi: cadence-quadspi: fix cleanup of rx_chan on failure paths
    aed4053c506b drm/sched: Remove optimization that causes hang when killing dependent jobs
    79c8d935147c ARM: 9448/1: Use an absolute path to unified.h in KBUILD_AFLAGS
    3277cf433815 mptcp: reset fallback status gracefully at disconnect() time
    7c96d519ee15 mptcp: plug races between subflow fail and subflow creation
    75a4c9ab8a7a mptcp: make fallback action and fallback decision atomic
    23a5773a5da5 arm64/cpufeatures/kvm: Add ARMv8.9 FEAT_ECBHB bits in ID_AA64MMFR1 register
    52f5a52dc17a ksmbd: add free_transport ops in ksmbd connection
    034adb78fc43 wifi: mt76: mt7921: prevent decap offload config before STA initialization
    79e2dd573116 perf/x86/intel: Fix crash in icl_update_topdown_event()
    9ef6abbb2868 mtd: rawnand: qcom: Fix last codeword read in qcom_param_page_type_exec()
    1da8bd9a10ec ksmbd: fix use-after-free in __smb2_lease_break_noti()
    5ea224eaf636 iio: hid-sensor-prox: Restore lost scale assignments
    a56b79a43f83 iio: hid-sensor-prox: Fix incorrect OFFSET calculation
    796c96cf6685 crypto: qat - add shutdown handler to qat_dh895xcc
    4b5e07702b67 crypto: powerpc/poly1305 - add depends on BROKEN for now
    da3e9f0fac60 erofs: address D-cache aliasing
    1d117f79b5c6 mm: khugepaged: fix call hpage_collapse_scan_file() for anonymous vma
    37c7f0f24b8e drm/i915/dp: Fix 2.7 Gbps DP_LINK_BW value on g4x
    c383033b0ac8 ALSA: hda: Add missing NVIDIA HDA codec IDs
    0a776c273e71 ALSA: hda/tegra: Add Tegra264 support
    4e954080d218 comedi: comedi_test: Fix possible deletion of uninitialized timers
    45fd8421081e jfs: reject on-disk inodes of an unsupported type
    98be604d96a6 x86/bugs: Fix use of possibly uninit value in amd_check_tsa_microcode()
    f9377bdf86ea usb: typec: tcpm: apply vbus before data bringup in tcpm_src_attach
    457d02e71ae9 usb: typec: tcpm: allow switching to mode accessory to mux properly
    8f65f4565cab usb: typec: tcpm: allow to use sink in accessory mode
    145a56bd68f4 drm/amdkfd: Don't call mmput from MMU notifier callback
    cc690930cb24 mm/zsmalloc: do not pass __GFP_MOVABLE if CONFIG_COMPACTION=n
    325325923a1d selftests: mptcp: connect: also cover checksum
    5cdfb402bae9 selftests: mptcp: connect: also cover alt modes
    a2cd4dcbb725 resource: fix false warning in __request_region()
    bf585ee198bb nilfs2: reject invalid file types when reading inodes
    57104237cd6c kasan: use vmalloc_dump_obj() for vmalloc error reports
    3028f2a4e746 ice: Fix a null pointer dereference in ice_copy_and_init_pkg()
    eaf242ea6fca gve: Fix stuck TX queue for DQ queue format
    c229192417d4 e1000e: ignore uninitialized checksum word on tgp
    1624f9de4432 e1000e: disregard NVM checksum on tgp when valid checksum bit is not set
    04d098fbca47 dpaa2-switch: Fix device reference count leak in MAC endpoint handling
    1c135ff95167 dpaa2-eth: Fix device reference count leak in MAC endpoint handling
    9433a5f437b0 arm64/entry: Mask DAIF in cpu_switch_to(), call_on_irq_stack()
    140ca2cac147 ALSA: hda/realtek - Add mute LED support for HP Pavilion 15-eg0xxx
    e5354899f625 sprintf.h requires stdarg.h
    72584a9178af bus: fsl-mc: Fix potential double device reference in fsl_mc_get_endpoint()
    6e7836c83635 i2c: virtio: Avoid hang by using interruptible completion wait
    68ceeb06316e i2c: tegra: Fix reset error handling with ACPI
    0d33913fce67 i2c: qup: jump out of the loop in case of timeout
    60962eed62b9 platform/x86: ideapad-laptop: Fix kbd backlight not remembered among boots
    989b2c5322dc net: hns3: default enable tx bounce buffer when smmu enabled
    adbf6f476cd1 net: hns3: fixed vf get max channels bug
    f377792c4186 net: hns3: disable interrupt when ptp init failed
    3cc42004f65b net: hns3: fix concurrent setting vlan filter issue
    faf44487dfc8 s390/ism: fix concurrency management in ism_cmd()
    42e42d64d851 drm/bridge: ti-sn65dsi86: Remove extra semicolon in ti_sn_bridge_probe()
    cf81a60a9733 can: netlink: can_changelink(): fix NULL pointer deref of struct can_priv::do_set_mode
    359492c2024a can: dev: can_restart(): move debug message and stats after successful restart
    71a2dc442e12 can: dev: can_restart(): reverse logic to remove need for goto
    0ede6ce4fcf2 net/sched: sch_qfq: Avoid triggering might_sleep in atomic context in qfq_delete_class
    e4f1564c5b69 net: appletalk: Fix use-after-free in AARP proxy probe
    d989748e9dbb i40e: When removing VF MAC filters, only check PF-set MAC
    0c399fd6ac5a i40e: report VF tx_dropped with tx_errors instead of tx_discards
    a05b3883083b i40e: Add rx_missed_errors for buffer exhaustion
    e4ca597d3116 net/mlx5: E-Switch, Fix peer miss rules to use peer eswitch
    c3d8a80d9557 net/mlx5: Fix memory leak in cmd_exec()
    bfebdb85496e xfrm: interface: fix use-after-free after changing collect_md xfrm interface
    2e18442d22c6 staging: vchiq_arm: Make vchiq_shutdown never fail
    6758f73f172d platform/x86: Fix initialization order for firmware_attributes_class
    d72c97b6160d x86/hyperv: Fix usage of cpu_online_mask to get valid cpu
    0915f1856c48 regmap: fix potential memory leak of regmap_bus
    881f3066fd8d iio: adc: ad7949: use spi_is_bpw_supported()
    6a85c96e61c1 interconnect: qcom: sc7280: Add missing num_links to xm_pcie3_1 node
    fb93e41ecc75 RDMA/core: Rate limit GID cache warning messages
    233d3c54c962 regulator: core: fix NULL dereference on unbind due to stale coupling data
    0e8c65939ba2 virtio_ring: Fix error reporting in virtqueue_resize
    fa53beab4740 Input: gpio-keys - fix a sleep while atomic with PREEMPT_RT

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 032a648ee8..990edea966 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "53bdb3c01caf1113589d30065b983cd20b225124"
-SRCREV_meta ?= "d2387ec7cf374ccffe480f7a00102f46b990d529"
+SRCREV_machine ?= "a5fb5e62dfdf67e8f12e9be81b74dea8230da1ca"
+SRCREV_meta ?= "cdadebd03ef4e7a129f8525938385dba54e32e80"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.100"
+LINUX_VERSION ?= "6.6.101"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 34512201b5..33e7a094a5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.100"
+LINUX_VERSION ?= "6.6.101"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "fefda6092153d01adb8574acd075d7d3f4182442"
-SRCREV_meta ?= "d2387ec7cf374ccffe480f7a00102f46b990d529"
+SRCREV_machine ?= "fe405475e21ba69486139227f55cbc3a507b073b"
+SRCREV_meta ?= "cdadebd03ef4e7a129f8525938385dba54e32e80"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index e9af2afc3b..826c1e02c8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "078fa42e2c5520b7c72b56c7f4556b108221386d"
-SRCREV_machine:qemuarm64 ?= "848733a4d57fe579bd9d72089fb12720b2c613e8"
-SRCREV_machine:qemuloongarch64 ?= "6f026111c3a003eaf81c2aee68d5c12a0a247873"
-SRCREV_machine:qemumips ?= "7bb806c4728fd747067d5ea4aa2827274603e3cc"
-SRCREV_machine:qemuppc ?= "d1d3313d10d048daeab874e67a2658907812e0cd"
-SRCREV_machine:qemuriscv64 ?= "6f026111c3a003eaf81c2aee68d5c12a0a247873"
-SRCREV_machine:qemuriscv32 ?= "6f026111c3a003eaf81c2aee68d5c12a0a247873"
-SRCREV_machine:qemux86 ?= "6f026111c3a003eaf81c2aee68d5c12a0a247873"
-SRCREV_machine:qemux86-64 ?= "6f026111c3a003eaf81c2aee68d5c12a0a247873"
-SRCREV_machine:qemumips64 ?= "2654aa46d76428df4acd0e74ad9b281eb4a085fc"
-SRCREV_machine ?= "6f026111c3a003eaf81c2aee68d5c12a0a247873"
-SRCREV_meta ?= "d2387ec7cf374ccffe480f7a00102f46b990d529"
+SRCREV_machine:qemuarm ?= "eec0d117c1da156e2c42a990ef9902e8bf526a3b"
+SRCREV_machine:qemuarm64 ?= "7e67ed627f8cfb12bf0beb31d22038cc174f1413"
+SRCREV_machine:qemuloongarch64 ?= "af73b639584c1149d99786ca0f235dcbb046ede1"
+SRCREV_machine:qemumips ?= "990e670951b176b14bda639e0806364d3c2c560d"
+SRCREV_machine:qemuppc ?= "22682716b343688c6e2454b6edca79e723cbd553"
+SRCREV_machine:qemuriscv64 ?= "af73b639584c1149d99786ca0f235dcbb046ede1"
+SRCREV_machine:qemuriscv32 ?= "af73b639584c1149d99786ca0f235dcbb046ede1"
+SRCREV_machine:qemux86 ?= "af73b639584c1149d99786ca0f235dcbb046ede1"
+SRCREV_machine:qemux86-64 ?= "af73b639584c1149d99786ca0f235dcbb046ede1"
+SRCREV_machine:qemumips64 ?= "bcb7f967a647fbb74836a33d2ef5af6460e30074"
+SRCREV_machine ?= "af73b639584c1149d99786ca0f235dcbb046ede1"
+SRCREV_meta ?= "cdadebd03ef4e7a129f8525938385dba54e32e80"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "dbcb8d8e4163e46066f43e2bd9a6779e594ec900"
+SRCREV_machine:class-devupstream ?= "3a8ababb8b6a0ced2be230b60b6e3ddbd8d67014"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.100"
+LINUX_VERSION ?= "6.6.101"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


