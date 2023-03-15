Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 983A9C7618B
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:01:50 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.8786.1678888902880020754
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:01:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=h6VVxi8/;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id v21so10000051ple.9
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 07:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678888902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kfL3FmeVK74ZrueopjGJjrfqcHK5Zm5np7AYrpQ4kbM=;
        b=h6VVxi8/4zqRH3+cC20g6lmpujyn5JrOHZz20exOEgCvSly77fVu+9S2eXBCii4qN3
         Z3AGyBlRCC0zT20caqGYjEM14q7eX3tqhwBc1fs4epboykp/zBL2RyEp5yyKtY2QMFzZ
         b/74Mpe3Z75Dki7RHra21+vKXNMr01n97qGJnJskHys3e0XB9ck3aF/gWVZv9cgrpr0G
         +sgL2iVsc5KOopVIOgk+V9NPwC1fkbrRRf/nAD2xBVosVe4oT1SVgUVPonNyZ5x1tWtX
         ttuYAfi3Vj+Hn4+rjScvf5rlMkbdcmpD3vF+nC2QTDHBn9xyN0KROwhPLicyabe/b9H7
         AEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678888902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfL3FmeVK74ZrueopjGJjrfqcHK5Zm5np7AYrpQ4kbM=;
        b=m2EKf2qQGBkaYwsXGHFyuil0OZ8cVhnTVgXdtC4gXq4lBGCrEslxOZ/tliVYb/JPZZ
         Y1w90gXPmrdLJhHzkZg6T05OPg3dOKREwZ0U9yGev8sXY3U9YfaJdEVM2q2ZpZDCmkfJ
         c0kmgLOO82SaL1MjVJcn4QzsdjZ7pwsMbnWJlbg7y0LDK2qLIZpNr2DmIEE1dJW0NHba
         BsFYrOu4O4aEv94ubz1EDLQwbpE+F4G6thaHmXYXfWPMVAqbcGEr2X9S9VUiWx5MWfNS
         3MgBho8cfSpOMHmddIZSak/45jqkRuPnWBfBOhQ6iFASh4AA9frvLt9cki7BwK1qkfR7
         PB4A==
X-Gm-Message-State: AO0yUKVJye6hTQAy5xFvtCxJukxeZTaFWirT9SX4Wqbx6RywxaiCpT7g
	hHT8Db9B+KqUb6iPjgSdn2lXFMbmLHCXvys6peo=
X-Google-Smtp-Source: AK7set+tjpu/vBP+fe0+2+9p9WWAArQAJxm20a1TzAJhVW05rqWuzowvUPJz7qPUbWADqJOZAFF+xQ==
X-Received: by 2002:a17:902:e84e:b0:1a0:549d:399e with SMTP id t14-20020a170902e84e00b001a0549d399emr3113146plg.21.1678888901681;
        Wed, 15 Mar 2023 07:01:41 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902f54600b001a0432ca99csm3663755plf.269.2023.03.15.07.01.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 07:01:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/22] linux-yocto/5.15: update to v5.15.96
Date: Wed, 15 Mar 2023 04:01:01 -1000
Message-Id: <5f969d8a3b8d169a71b7a74da2eaf6f2e730c5d5.1678888649.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678888649.git.steve@sakoman.com>
References: <cover.1678888649.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 14:01:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178561

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    d383d0f28eca Linux 5.15.96
    49ce63694cae bpf: add missing header file include
    80569627ce46 Revert "net/sched: taprio: make qdisc_leaf() see the per-netdev-queue pfifo child qdiscs"
    0c168d7f36d5 lib/Kconfig.debug: Allow BTF + DWARF5 with pahole 1.21+
    6ba3de5a8a02 lib/Kconfig.debug: Use CONFIG_PAHOLE_VERSION
    0f59e08070ba scripts/pahole-flags.sh: Use pahole-version.sh
    3597fd5f9217 kbuild: Add CONFIG_PAHOLE_VERSION
    c98077f7598a ext4: Fix function prototype mismatch for ext4_feat_ktype
    43cb0369c84a audit: update the mailing list in MAINTAINERS
    b5ef61edb1e5 wifi: mwifiex: Add missing compatible string for SD8787
    a24eb3f99063 nbd: fix possible overflow on 'first_minor' in nbd_dev_add()
    d518ca02542f binder: Gracefully handle BINDER_TYPE_FDA objects with num_fds=0
    367d0456c792 binder: Address corner cases in deferred copy and fixup
    b345b2200288 binder: fix pointer cast warning
    c194fc351fec binder: defer copies of pre-patched txn data
    d107b4352284 binder: read pre-translated fds from sender buffer
    41d8b591d70a uaccess: Add speculation barrier to copy_from_user()
    0d3d5099a50b drm/i915/gvt: fix double free bug in split_2MB_gtt_entry
    d835f9c4ede2 powerpc/64s/radix: Fix RWX mapping with relocated kernel
    87b3e4f845a2 powerpc/64s/radix: Fix crash with unaligned relocated kernel
    0b0e9b5adc8e powerpc/vmlinux.lds: Add an explicit symbol for the SRWX boundary
    b6fff8fa4f5b powerpc/vmlinux.lds: Ensure STRICT_ALIGN_SIZE is at least page aligned
    e7f5e3b60c30 powerpc: use generic version of arch_is_kernel_initmem_freed()
    fc58616b198b powerpc: dts: t208x: Disable 10G on MAC1 and MAC2
    62302ac5777a can: kvaser_usb: hydra: help gcc-13 to figure out cmd_len
    6b539a7dbb49 KVM: VMX: Execute IBPB on emulated VM-exit when guest has IBRS
    78c1d35ed66c KVM: SVM: Skip WRMSR fastpath on VM-Exit if next RIP isn't valid
    676248836577 KVM: x86: Fail emulation during EMULTYPE_SKIP on any exception
    5456f0d53b4a random: always mix cycle counter in add_latent_entropy()
    d2edb20b003e clk: mxl: syscon_node_to_regmap() returns error pointers
    04d31929df12 powerpc: dts: t208x: Mark MAC1 and MAC2 as 10G
    8ae31d36516b clk: mxl: Fix a clk entry by adding relevant flags
    a0583edea4fd clk: mxl: Add option to override gate clks
    ef1219115128 clk: mxl: Remove redundant spinlocks
    e5580a805472 clk: mxl: Switch from direct readl/writel based IO to regmap based IO
    20ea32ad9c99 drm/edid: Fix minimum bpc supported with DSC1.2 for HDMI sink
    28985cd17ac7 wifi: rtl8xxxu: gen2: Turn on the rate control
    d04d19cf0ead drm/etnaviv: don't truncate physical page address
    60b502b3ffea Linux 5.15.95
    3f94c70333f6 platform/x86/amd: pmc: add CONFIG_SERIO dependency
    1c202909c8b0 net: sched: sch: Fix off by one in htb_activate_prios()
    180a1632b6c7 ASoC: SOF: Intel: hda-dai: fix possible stream_tag leak
    68c2db8ef56d alarmtimer: Prevent starvation by small intervals and SIG_IGN
    35351e3060d6 kvm: initialize all of the kvm_debugregs structure before sending it to userspace
    1cbb51d83f56 net/sched: tcindex: search key must be 16 bits
    cd9569062d8e i40e: Add checking for null for nlmsg_find_attr()
    290e7084926c net/sched: act_ctinfo: use percpu stats
    22d0cb47047a flow_offload: fill flags to action structure
    d53360d443be drm/i915/gen11: Wa_1408615072/Wa_1407596294 should be on GT list
    8174915c7bf3 drm/i915/gen11: Moving WAs to icl_gt_workarounds_init()
    43dd56f7bfcb mm/filemap: fix page end in filemap_get_read_batch
    a158782b56b0 nilfs2: fix underflow in second superblock position calculations
    13bc7dd5b365 ipv6: Fix tcp socket connection with DSCP.
    f3326fa5e480 ipv6: Fix datagram socket connection with DSCP.
    9c35c81fd6f0 ixgbe: add double of VLAN header when computing the max MTU
    59a74da8da75 net: mpls: fix stale pointer if allocation fails during device rename
    bf8b820ea0ca net: stmmac: Restrict warning on disabling DMA store and fwd mode
    269520bee744 bnxt_en: Fix mqprio and XDP ring checking logic
    0428aabbcc15 net: stmmac: fix order of dwmac5 FlexPPS parametrization sequence
    1563e998a938 net: openvswitch: fix possible memory leak in ovs_meter_cmd_set()
    338f826d3afe net/usb: kalmia: Don't pass act_len in usb_bulk_msg error path
    59e30d2bd309 dccp/tcp: Avoid negative sk_forward_alloc by ipv6_pinfo.pktoptions.
    becf55394f6a net/sched: tcindex: update imperfect hash filters respecting rcu
    3d5f95be49c5 sctp: sctp_sock_filter(): avoid list_entry() on possibly empty list
    fa56f164455e net: ethernet: ti: am65-cpsw: Add RX DMA Channel Teardown Quirk
    2603a5ca6223 net: bgmac: fix BCM5358 support by setting correct flags
    a5e4f2b284dc i40e: add double of VLAN header when computing the max MTU
    1f23ca5dba6c ixgbe: allow to increase MTU to 3K with XDP enabled
    65d07ae69bd3 revert "squashfs: harden sanity check in squashfs_read_xattr_id_table"
    50267cf35ba0 net: Fix unwanted sign extension in netdev_stats_to_stats64()
    3775c95ffbc6 Revert "mm: Always release pages to the buddy allocator in memblock_free_late()."
    57081f83849c selftest/lkdtm: Skip stack-entropy test if lkdtm is not available
    9197daee9eb6 of: reserved_mem: Have kmemleak ignore dynamically allocated reserved mem
    8b29a1866f64 hugetlb: check for undefined shift on 32 bit architectures
    cca2b3feb701 sched/psi: Fix use-after-free in ep_remove_wait_queue()
    c5f2151afb2a ALSA: hda/realtek - fixed wrong gpio assigned
    1a3f8c85cd2a ALSA: hda/conexant: add a new hda codec SN6180
    ecad2fafd424 mmc: mmc_spi: fix error handling in mmc_spi_probe()
    1e06cf04239e mmc: sdio: fix possible resource leaks in some error paths
    732e3b293ca3 mmc: jz4740: Work around bug on JZ4760(B)
    fdaf88531cfd tcp: Fix listen() regression in 5.15.88.
    9a1d92cbeac3 netfilter: nft_tproxy: restrict to prerouting hook
    3fc9dc0340e0 platform/x86/amd: pmc: Disable IRQ1 wakeup for RN/CZN
    c2cb2c71da50 platform/x86: amd-pmc: Correct usage of SMU version
    2dcf115681d4 platform/x86: amd-pmc: Fix compilation when CONFIG_DEBUGFS is disabled
    32e3a6c4a756 platform/x86: amd-pmc: Export Idlemask values based on the APU
    1723efa4c375 drm/amd/display: Fail atomic_check early on normalize_zpos error
    178993157e8c aio: fix mremap after fork null-deref
    3cfc5e84ac6f mptcp: do not wait for bare sockets' timeout
    e0e93c8599c5 xfs: don't leak btree cursor when insrec fails after a split
    294c022a070a xfs: purge dquots after inode walk fails during quotacheck
    96f0651a264b xfs: assert in xfs_btree_del_cursor should take into account error
    88ccad17784a xfs: don't assert fail on perag references on teardown
    ddf1e0fd43b2 xfs: avoid unnecessary runtime sibling pointer endian conversions
    5f0e21a4a885 xfs: validate v5 feature fields
    ea0ce7c13610 xfs: set XFS_FEAT_NLINK correctly
    0cc9f9cc8d91 xfs: detect self referencing btree sibling pointers
    4e96f5ace9ac xfs: fix potential log item leak
    8abef857eb91 xfs: zero inode fork buffer at allocation
    63b8e4cc31fd nvmem: core: fix return value
    eac1ad2f5e21 nvmem: core: fix registration vs use race
    8f9c4b2a3b13 nvmem: core: fix cleanup after dev_set_name()
    14eea6449473 nvmem: core: add error handling for dev_set_name
    36a5ae5cf90a platform/x86: touchscreen_dmi: Add Chuwi Vi8 (CWI501) DMI match
    f1cb549bcd0b drm/amd/display: Properly handle additional cases where DCN is not supported
    5ca46a04a5c3 nvme-fc: fix a missing queue put in nvmet_fc_ls_create_association
    9ed522143f95 s390/decompressor: specify __decompress() buf len to avoid overflow
    99875ea9b5b4 net: sched: sch: Bounds check priority
    5027084bc097 drm/nouveau/devinit/tu102-: wait for GFW_BOOT_PROGRESS == COMPLETED
    4fdc19e4fa23 net: stmmac: do not stop RX_CLK in Rx LPI state for qcs404 SoC
    6769cd8a7488 net/rose: Fix to not accept on connected socket
    2ddb9fa56665 tools/virtio: fix the vringh test for virtio ring changes
    a35c241065ee ASoC: cs42l56: fix DT probe
    f312367f5246 bpf, sockmap: Don't let sock_map_{close,destroy,unhash} call itself
    e909f5f2aa55 ALSA: hda: Do not unset preset when cleaning up codec
    5541d35f5d03 selftests/bpf: Verify copy_register_state() preserves parent/live fields
    7814e28c4183 ASoC: Intel: sof_cs42l42: always set dpcm_capture for amplifiers
    d15ab7320892 ASoC: Intel: sof_rt5682: always set dpcm_capture for amplifiers
    06f2a84d626a ACPI / x86: Add support for LPS0 callback handler
    14a2de5c16f3 riscv: kprobe: Fixup misaligned load text
    b5d5f1ad057e kprobes: treewide: Cleanup the error messages for kprobes
    2a6853c0ea03 mptcp: fix locking for in-kernel listener creation

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 020944ef921ae2b6923b139bad5f7a79217dace1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 62cf6c2023..caa5e5197f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "0e479ee9b51bb384ce793fe55b05e8c2c3d3041a"
-SRCREV_meta ?= "3dd458be964635c8e682a1fb6f9a3368a747f92b"
+SRCREV_machine ?= "c69881f9ba51496f0930cd39bd67f9dfb8d3a612"
+SRCREV_meta ?= "509f4b9d68337f103633d48b621c1c9aa0dc975d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.94"
+LINUX_VERSION ?= "5.15.96"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index d91dc0bea8..34ffaa5132 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.94"
+LINUX_VERSION ?= "5.15.96"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "8c906f7637d74bde62e074f6d8be8e6bd180cd47"
-SRCREV_meta ?= "3dd458be964635c8e682a1fb6f9a3368a747f92b"
+SRCREV_machine ?= "9c8ee16005f204f7f48d6699822dd5e89b01d4a5"
+SRCREV_meta ?= "509f4b9d68337f103633d48b621c1c9aa0dc975d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 033e7b0e24..55580357d2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "56893626121030f0602bc416f300ca54e1135d8e"
-SRCREV_machine:qemuarm64 ?= "c5b37eefe0c4c0956d87d8469556ca295b55cab4"
-SRCREV_machine:qemumips ?= "1d8fd6769259a16d49aaf8d9c3eecd970343249e"
-SRCREV_machine:qemuppc ?= "6e2e7b94716f4547f6e5cfd47dc430f84f4b70a7"
-SRCREV_machine:qemuriscv64 ?= "abe44015db49980ca7a2e6125321c3e3666a0278"
-SRCREV_machine:qemuriscv32 ?= "abe44015db49980ca7a2e6125321c3e3666a0278"
-SRCREV_machine:qemux86 ?= "abe44015db49980ca7a2e6125321c3e3666a0278"
-SRCREV_machine:qemux86-64 ?= "abe44015db49980ca7a2e6125321c3e3666a0278"
-SRCREV_machine:qemumips64 ?= "27458775da7568a4844f438c7f1cd9fbf20a55f6"
-SRCREV_machine ?= "abe44015db49980ca7a2e6125321c3e3666a0278"
-SRCREV_meta ?= "3dd458be964635c8e682a1fb6f9a3368a747f92b"
+SRCREV_machine:qemuarm ?= "5479084dba4fbe0e3db2a97b0ae00ff7651fb90b"
+SRCREV_machine:qemuarm64 ?= "91bfb4191c2f19b98b0c724676a69ca9d61bb696"
+SRCREV_machine:qemumips ?= "8be1d8e09c4b174ab4ef0fbd67263f9563967818"
+SRCREV_machine:qemuppc ?= "6de606ff8d3eeba9f003557ebb37c94a2d0e6bc1"
+SRCREV_machine:qemuriscv64 ?= "001e2930e6997f58dd98cda33908111506f53eb7"
+SRCREV_machine:qemuriscv32 ?= "001e2930e6997f58dd98cda33908111506f53eb7"
+SRCREV_machine:qemux86 ?= "001e2930e6997f58dd98cda33908111506f53eb7"
+SRCREV_machine:qemux86-64 ?= "001e2930e6997f58dd98cda33908111506f53eb7"
+SRCREV_machine:qemumips64 ?= "d2d2e93f5cea91969185ec1cc05d6833cd7e1412"
+SRCREV_machine ?= "001e2930e6997f58dd98cda33908111506f53eb7"
+SRCREV_meta ?= "509f4b9d68337f103633d48b621c1c9aa0dc975d"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "e2c1a934fd8e4288e7a32f4088ceaccf469eb74c"
+SRCREV_machine:class-devupstream ?= "d383d0f28ecac0f3375bdfb9a0c4bfac979f6f8f"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.94"
+LINUX_VERSION ?= "5.15.96"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


