Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D1EC0015E
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 02:36:33 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.1214.1687401389204838127
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 19:36:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=cGJ3b4WS;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1b539d2f969so1323755ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 19:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687401388; x=1689993388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8WFLlW3I+K4L00RcNnWU6u7f6q5Eyqli5evIz6oe5G4=;
        b=cGJ3b4WSb0Zba7XN42roX99Ozd5O7xfJglqmNI3q3rnGs8sB7q1y/cTt4jp5PQnQ4E
         QZMyJwzkOVoduNP2qPOttv4z09YD6CFD0kaYAjatNJloQzfMgt5UNHvWMCkKVgIWnH1M
         NDOHsbhrnXQHiLVsFqi8t+cdMxexK1sO6B5w3JYUqrdK3xN5kXWHfhZZHi3GLsmwrKpT
         T+1D3C3AWglVWCpegbneI069qUSXU/vYuQU0ir4cfAhOF5WuNQDCPXd0BPAB2tDCsC4g
         ejus+/U9QCc4ZICnll1+rb9qPYJvSoOjjw875fA3lXEVuFC51K4bI6xBEXG8ZA7scu4E
         PxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687401388; x=1689993388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8WFLlW3I+K4L00RcNnWU6u7f6q5Eyqli5evIz6oe5G4=;
        b=mBmn4ZjNIifBXxBG/uQRQogOlJrVIQuyOS+Ax1fyIeUgwKQJTRyy3K4NN9TmgJjSMO
         Yj+ZFR9im30PYhnXkKVqDa02BqQ2p4O5E6jJQ7Pkg+6LtLDyAWwl9TusAqJgL76jaiea
         EZihZoRINXH9CO6fpltvILnCLB5ihdTqOmWaaJqAbVMpV+TLtdz66FlGS4DgBstahJEO
         L1ZOHlYFcB1LiHTDihbxtJxJobTfS8J1/un2/NhuX7nch9zSLDURr6Gno8lG6FDC6Dlh
         cjsoA/t4yun4389R59cPwliIazynZGca3Mze5vBo7iK4evDfykAouxU2HI+erggZm7vd
         lHSA==
X-Gm-Message-State: AC+VfDwdsJvjNvNg5cE12R3P1YDVCAxRy21uUanzVTRG32MvhlLALzFI
	EdtJz75PdZcdoy6UBAXqyvGs1LaOW26vHrZ02h0=
X-Google-Smtp-Source: ACHHUZ57hFJMIN7CRfwke3jvGUPFaC7ppxP7FTcVcmr7KN+BNQoA+63Rej/a3U2FY/eRcfL8vTEvPA==
X-Received: by 2002:a17:903:22c4:b0:1b1:1168:656b with SMTP id y4-20020a17090322c400b001b11168656bmr25280715plg.26.1687401388070;
        Wed, 21 Jun 2023 19:36:28 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jn9-20020a170903050900b001b679ec20f2sm4143691plb.31.2023.06.21.19.36.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 19:36:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 12/23] linux-yocto/6.1: update to v6.1.26
Date: Wed, 21 Jun 2023 16:35:44 -1000
Message-Id: <9214d1a81f180e74a11b72e6369dfd0592bf64ca.1687401182.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687401182.git.steve@sakoman.com>
References: <cover.1687401182.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 02:36:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183212

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    ca1c9012c941 Linux 6.1.26
    ab91b09f399f ASN.1: Fix check for strdup() success
    1831d8cbaea8 ASoC: fsl_sai: Fix pins setting for i.MX8QM platform
    6cb818ed5f08 ASoC: fsl_asrc_dma: fix potential null-ptr-deref
    7a6593b5d7ad ASoC: SOF: pm: Tear down pipelines only if DSP was active
    b528537d131f mm/page_alloc: fix potential deadlock on zonelist_update_seq seqlock
    71b6df69f17e fpga: bridge: properly initialize bridge device before populating children
    f8c3eb751a9b iio: adc: at91-sama5d2_adc: fix an error code in at91_adc_allocate_trigger()
    342c1db4fa8c Input: pegasus-notetaker - check pipe type when probing
    a93c20f58322 gcc: disable '-Warray-bounds' for gcc-13 too
    a09b9383b749 sctp: Call inet6_destroy_sock() via sk->sk_destruct().
    a530b33fe986 dccp: Call inet6_destroy_sock() via sk->sk_destruct().
    a8cf1141057a inet6: Remove inet6_destroy_sock() in sk->sk_prot->destroy().
    588d682251e6 purgatory: fix disabling debug info
    7ca973d830c0 fuse: always revalidate rename target dentry
    f9a20ef5e83c MIPS: Define RUNTIME_DISCARD_EXIT in LD script
    8d6a870a428f KVM: arm64: Fix buffer overflow in kvm_arm_set_fw_reg()
    9e7976c0cd63 KVM: arm64: Make vcpu flag updates non-preemptible
    d362a03d920e sched/fair: Fixes for capacity inversion detection
    799c7301ded6 sched/fair: Consider capacity inversion in util_fits_cpu()
    fe1c982958c5 sched/fair: Detect capacity inversion
    7e6631f782a1 mm/mmap: regression fix for unmapped_area{_topdown}
    059f24aff65c mm: page_alloc: skip regions with hugetlbfs pages when allocating 1G pages
    bd6f3421a586 mm: kmsan: handle alloc failures in kmsan_vmap_pages_range_noflush()
    433a7ecaed4b mm: kmsan: handle alloc failures in kmsan_ioremap_page_range()
    e8a7bdb6f76c mm/huge_memory.c: warn with pr_warn_ratelimited instead of VM_WARN_ON_ONCE_FOLIO
    519dbe737f0d mm/khugepaged: check again on anon uffd-wp during isolation
    cc647e05db67 mm/userfaultfd: fix uffd-wp handling for THP migration entries
    b1644a0031cf drm/rockchip: vop2: Use regcache_sync() to fix suspend/resume
    904e1b66854b drm/rockchip: vop2: fix suspend/resume
    4ac57c3fe2c0 drm/amd/display: set dcn315 lb bpp to 48
    bef774effb27 drm/amdgpu: Fix desktop freezed after gpu-reset
    66eb772be27e drm/i915: Fix fast wake AUX sync len
    d9caa028d7ad mmc: sdhci_am654: Set HIGH_SPEED_ENA for SDR12 and SDR25
    3e6bd2653ff8 writeback, cgroup: fix null-ptr-deref write in bdi_split_work_to_wbs
    ec90129b91b6 kernel/sys.c: fix and improve control flow in __sys_setres[ug]id()
    a3a93b46833f memstick: fix memory leak if card device is never registered
    f6a5f61200ff tools/mm/page_owner_sort.c: fix TGID output when cull=tg is used
    a0aa4827f791 nilfs2: initialize unused bytes in segment summary blocks
    a1176791ab74 maple_tree: fix a potential memory leak, OOB access, or other unpredictable bug
    66f13a1acf0a maple_tree: fix mas_empty_area() search
    c51b9ef3f521 maple_tree: make maple state reusable after mas_empty_area_rev()
    be100a8460e3 LoongArch: Mark 3 symbol exports as non-GPL
    e82caab68951 LoongArch: Fix probing of the CRC32 feature
    55fba69fbfd0 rust: kernel: Mark rust_fmt_argument as extern "C"
    e19ebc5f9a71 btrfs: get the next extent map during fiemap/lseek more efficiently
    b28def6ed970 ALSA: hda/realtek: fix mute/micmute LEDs for a HP ProBook
    31f7c99e3685 iio: light: tsl2772: fix reading proximity-diodes from device tree
    b263f81bd16e iio: dac: ad5755: Add missing fwnode_handle_put()
    9ad34ea8d2d6 drm/amdgpu/vcn: Disable indirect SRAM on Vangogh broken BIOSes
    9bdbd0099262 Revert "userfaultfd: don't fail on unrecognized features"
    8e610b699385 mtd: spi-nor: fix memory leak when using debugfs_lookup()
    f4d1bbb97728 platform/x86: asus-nb-wmi: Add quirk_asus_tablet_mode to other ROG Flow X13 models
    25e2413c9374 platform/x86: gigabyte-wmi: add support for X570S AORUS ELITE
    bbf4d72be001 xen/netback: use same error messages for same errors
    79d22faeba7b nvme-tcp: fix a possible UAF when failing to allocate an io queue
    0cc5da7990ff drm: test: Fix 32-bit issue in drm_buddy_test
    fb766acce3cf drm: buddy_allocator: Fix buddy allocator init on 32-bit systems
    3059a67e02dc s390/ptrace: fix PTRACE_GET_LAST_BREAK error handling
    ba6486192268 platform/x86: gigabyte-wmi: add support for B650 AORUS ELITE AX
    fbc72b63520a net: dsa: b53: mmap: add phy ops
    480df96832f4 scsi: core: Improve scsi_vpd_inquiry() checks
    83760e74ed14 scsi: megaraid_sas: Fix fw_crash_buffer_show()
    e0ac735ee4e2 selftests: sigaltstack: fix -Wuninitialized
    8563ab97a870 platform/x86 (gigabyte-wmi): Add support for A320M-S2H V2
    c4043891a10f platform/x86/intel: vsec: Fix a memory leak in intel_vsec_add_aux
    23f18f35bf1f f2fs: Fix f2fs_truncate_partial_nodes ftrace event
    b2bfa742b871 net: bridge: switchdev: don't notify FDB entries with "master dynamic"
    b91798017c3e e1000e: Disable TSO on i219-LM card to increase speed
    89603f4c9154 bpf: Fix incorrect verifier pruning due to missing register precision taints
    39eeb724c4d9 spi: spi-rockchip: Fix missing unwind goto in rockchip_sfc_probe()
    ef018e12b1ed mlxsw: pci: Fix possible crash during initialization
    9a0b96d03c59 net: rpl: fix rpl header size calculation
    64489c22d085 bonding: Fix memory leak when changing bond type to Ethernet
    68b0f2843173 mlxfw: fix null-ptr-deref in mlxfw_mfa2_tlv_next()
    fa82a725e8cb bnxt_en: Do not initialize PTP on older P3/P4 chips
    8e1f40e8f707 netfilter: nf_tables: tighten netlink attribute requirements for catch-all elements
    ef87cd81321b netfilter: nf_tables: validate catch-all set elements
    8a5dad80bd83 i40e: fix i40e_setup_misc_vector() error handling
    0ec73187f026 i40e: fix accessing vsi->active_filters without holding lock
    9387a515cbc3 netfilter: nf_tables: fix ifdef to also consider nf_tables=m
    6a4029f4f91f sfc: Fix use-after-free due to selftest_work
    d43f024e8c2a virtio_net: bugfix overflow inside xdp_linearize_page()
    ce729b06dc33 net: sched: sch_qfq: prevent slab-out-of-bounds in qfq_activate_agg
    519c96885eae regulator: fan53555: Fix wrong TCS_SLEW_MASK
    49b9758d44d4 regulator: fan53555: Explicitly include bits header
    8acb00f377f9 rust: str: fix requierments->requirements typo
    1c4dbb001fd3 netfilter: nf_tables: Modify nla_memdup's flag to GFP_KERNEL_ACCOUNT
    ea854a25c832 netfilter: br_netfilter: fix recent physdev match breakage
    6369276efa7a arm64: dts: imx8mp-verdin: correct off-on-delay
    e09602ba40b6 arm64: dts: imx8mm-verdin: correct off-on-delay
    94e05ccaf335 arm64: dts: imx8mm-evk: correct pmic clock source
    ed26418b2dff arm64: dts: qcom: sc8280xp-pmics: fix pon compatible and registers
    8fe3333f7229 arm64: dts: meson-g12-common: specify full DMC range
    4ba06237c4a2 arm64: dts: qcom: ipq8074-hk10: enable QMP device, not the PHY node
    ecff49fd3758 arm64: dts: qcom: hk10: use "okay" instead of "ok"
    fb42f8abdebd arm64: dts: qcom: ipq8074-hk01: enable QMP device, not the PHY node
    80cc8410af29 arm64: dts: rockchip: Lower sd speed on rk3566-soquartz
    8f33e7c677a9 ARM: dts: rockchip: fix a typo error for rk3288 spdif node

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3d50c853ef003d8d9bdc0ae3a5c9567fe3474c6c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 20d2729371..d2dc7e60f1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f974a72071f8b481fc4e38517219bc5c503e14f6"
-SRCREV_meta ?= "36901b5b298e601fe73dd79aaff8b615a7762013"
+SRCREV_machine ?= "128a73d5e1339475618b41383121a0eef4bb29de"
+SRCREV_meta ?= "1bb0236be7c49344bd411c71f21769153ecd9695"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.25"
+LINUX_VERSION ?= "6.1.26"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 47d77404d0..b2f6266018 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.25"
+LINUX_VERSION ?= "6.1.26"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "581dc1aa2f340fff2cc010067257185fa2c993f9"
-SRCREV_meta ?= "36901b5b298e601fe73dd79aaff8b615a7762013"
+SRCREV_machine ?= "c35e45ea5f134aad3ef0ccd3f1b7b672c801e402"
+SRCREV_meta ?= "1bb0236be7c49344bd411c71f21769153ecd9695"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 6640000d83..a7a5a82813 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "0b80e90b38ae1735c7dab701ca3d0b2447376ccc"
-SRCREV_machine:qemuarm64 ?= "581dc1aa2f340fff2cc010067257185fa2c993f9"
-SRCREV_machine:qemuloongarch64 ?= "581dc1aa2f340fff2cc010067257185fa2c993f9"
-SRCREV_machine:qemumips ?= "db61d7fe3540904fbe77b532ce3e37aeb737524a"
-SRCREV_machine:qemuppc ?= "581dc1aa2f340fff2cc010067257185fa2c993f9"
-SRCREV_machine:qemuriscv64 ?= "581dc1aa2f340fff2cc010067257185fa2c993f9"
-SRCREV_machine:qemuriscv32 ?= "581dc1aa2f340fff2cc010067257185fa2c993f9"
-SRCREV_machine:qemux86 ?= "581dc1aa2f340fff2cc010067257185fa2c993f9"
-SRCREV_machine:qemux86-64 ?= "581dc1aa2f340fff2cc010067257185fa2c993f9"
-SRCREV_machine:qemumips64 ?= "aacc52b6216955723cebb5bc493a4210357b23b2"
-SRCREV_machine ?= "581dc1aa2f340fff2cc010067257185fa2c993f9"
-SRCREV_meta ?= "36901b5b298e601fe73dd79aaff8b615a7762013"
+SRCREV_machine:qemuarm ?= "171d448bfb9e531c7395deae260edf96305eab9c"
+SRCREV_machine:qemuarm64 ?= "c35e45ea5f134aad3ef0ccd3f1b7b672c801e402"
+SRCREV_machine:qemuloongarch64 ?= "c35e45ea5f134aad3ef0ccd3f1b7b672c801e402"
+SRCREV_machine:qemumips ?= "d637594e7e9c9037d7c609f9dfeef13a57a5aec4"
+SRCREV_machine:qemuppc ?= "c35e45ea5f134aad3ef0ccd3f1b7b672c801e402"
+SRCREV_machine:qemuriscv64 ?= "c35e45ea5f134aad3ef0ccd3f1b7b672c801e402"
+SRCREV_machine:qemuriscv32 ?= "c35e45ea5f134aad3ef0ccd3f1b7b672c801e402"
+SRCREV_machine:qemux86 ?= "c35e45ea5f134aad3ef0ccd3f1b7b672c801e402"
+SRCREV_machine:qemux86-64 ?= "c35e45ea5f134aad3ef0ccd3f1b7b672c801e402"
+SRCREV_machine:qemumips64 ?= "52e3ff0902681ac3d9128bcf037033e14ae20d68"
+SRCREV_machine ?= "c35e45ea5f134aad3ef0ccd3f1b7b672c801e402"
+SRCREV_meta ?= "1bb0236be7c49344bd411c71f21769153ecd9695"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "f17b0ab65d17988d5e6d6fe22f708ef3721080bf"
+SRCREV_machine:class-devupstream ?= "ca1c9012c941ab1520851938d5f695f5a4d23634"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.25"
+LINUX_VERSION ?= "6.1.26"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.34.1


