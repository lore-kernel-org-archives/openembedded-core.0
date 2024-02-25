Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 444BAC47DD9
	for <webhook@archiver.kernel.org>; Sun, 25 Feb 2024 21:53:24 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web10.7526.1708898000251322069
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 13:53:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1AlNxRCX;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.49, mailfrom: steve@sakoman.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-21e63b586fcso1766442fac.3
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 13:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708897999; x=1709502799; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cv5Ckvq04tiRLZ5rkhIr9xM3M9SxV0jYFv8y7Rw/Rqk=;
        b=1AlNxRCXxkPHpYx+kNpg1CQpswpbRH5Ga6YmUNoBUpZaBbvNjBdIHnb8JtW9Qamhlp
         KDK4c6pncmOAn0R3dAs94M/x0XPCIgsY3EJTbBHABE2ETgvpYCRRg8YzxfYAd9TagfZ6
         9EbmMNgxuto3FzhxRfpWZ2W3ROFfQdLE9O5BXaVOseK/MXSrBQeq4No/CW4IGntlakbb
         0Jdk1h+xRuNtvOn2N+uJOQfKFAls1F/eriJQAJ19o1JOco0p3CHlZwSs7T5BFEZKSbbF
         qF0nRU/FZivlxMpQ4fUxzcrr8Lit7Aevv3JFVo0uLKKbzogQVCZsUBRd6pEWOmi0d9QA
         B15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708897999; x=1709502799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cv5Ckvq04tiRLZ5rkhIr9xM3M9SxV0jYFv8y7Rw/Rqk=;
        b=XYS80e2wXd/ldgHPdV5p+eH30uYftZ+A+Vv8tZCrYI+GT936t/RBgFUbhLq5Ud2uzy
         ysqaaNUH93zOLDi443TXJ3radOQJ3e/sjrbIh8VK0V5qoFGcakD832YU5yDEeWpepDKX
         UYtHUXsknN9gm5U1OZahRz0zbQr/CE1Iy28uSj/VZ1ghoB/yXED5neCLPzCWH5+AODjd
         AMRbsE14/yyaPmPeLL9U0iQ5FSJh8uK/Il/LrkPCBz/VlbNz010E2Bo4Hr9Rl7XtgzNT
         aucGpfT4wngf+wvTX8hH4EyMX3mUMLxc15ogrX8Tj8WEJmUy3cR5HunrrcBmoJsxZipQ
         F5aA==
X-Gm-Message-State: AOJu0Yyx+tx2PXYNHePad6BSSZkO1CFXvUzvPuvi51AxZi5n9+bJeNYY
	4+/438RxwKClkY0iu1skL3jylg/Meb+b3dDKqxozdH6BT8bm2OHGMLwuxzJ8ASku5YRJJ+rFzgs
	C0oO8Og==
X-Google-Smtp-Source: AGHT+IH1chxJcUr0YWaOCF9swcN7dakD3GlqWExu1yUexJhik8D7mslWGi33ZKJVG72pTABA8B84sQ==
X-Received: by 2002:a05:6870:8326:b0:21f:db53:43bb with SMTP id p38-20020a056870832600b0021fdb5343bbmr5000686oae.11.1708897999328;
        Sun, 25 Feb 2024 13:53:19 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a12-20020a17090acb8c00b0029a4089fbf0sm3082947pju.16.2024.02.25.13.53.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 13:53:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/22] linux-yocto/5.15: update to v5.15.147
Date: Sun, 25 Feb 2024 11:52:33 -1000
Message-Id: <f4f1964a7a2922f3253484852b76602af5f31a89.1708897822.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708897822.git.steve@sakoman.com>
References: <cover.1708897822.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 21:53:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196166

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    ddcaf4999061 Linux 5.15.147
    231752a0a05d net: usb: ax88179_178a: move priv to driver_priv
    d800d18ba132 net: usb: ax88179_178a: remove redundant init code
    329197033bb0 tracing/kprobes: Fix symbol counting logic by looking at modules as well
    ccb7eef5f2f3 kallsyms: Make module_kallsyms_on_each_symbol generally available
    ab3a3aadb373 netfilter: nf_tables: Reject tables of unsupported family
    0eb556b2386d perf inject: Fix GEN_ELF_TEXT_OFFSET for jit
    b8a5308feedd ipv6: remove max_size check inline with ipv4
    ba5efd8544fa net: tls, update curr on splice as well
    06bb52d2efb3 mmc: sdhci-sprd: Fix eMMC init failure after hw reset
    6722186854a7 mmc: core: Cancel delayed work before releasing host
    edaefc210e10 mmc: rpmb: fixes pause retune on all RPMB partitions.
    41f20ac9bdc4 mmc: meson-mx-sdhc: Fix initialization frozen issue
    91432aebce51 mm: fix unmap_mapping_range high bits shift bug
    5e44f5da1266 i2c: core: Fix atomic xfer check for non-preempt config
    1d5c1617e1e1 x86/kprobes: fix incorrect return address calculation in kprobe_emulate_call_indirect
    10086ff58ce4 firewire: ohci: suppress unexpected system reboot in AMD Ryzen machines and ASM108x/VT630x PCIe cards
    660b3c3bc8a7 mm/memory-failure: check the mapcount of the precise page
    80eb449f809c selftests: secretmem: floor the memory size to the multiple of page_size
    a58ae5ab714d net: Implement missing SO_TIMESTAMPING_NEW cmsg support
    500c7f32ad43 bnxt_en: Remove mis-applied code from bnxt_cfg_ntp_filters()
    fda00eb3cd41 asix: Add check for usbnet_get_endpoints
    0817c1b21561 octeontx2-af: Re-enable MAC TX in otx2_stop processing
    20fce91b4fa0 octeontx2-af: Always configure NIX TX link credits based on max frame size
    6bbbcff3c798 octeontx2-af: Set NIX link credits based on max LMAC
    6ef9a28e1bb2 octeontx2-af: Don't enable Pause frames by default
    bc56ed720e06 net/qla3xxx: fix potential memleak in ql_alloc_buffer_queues
    cfcf5490145a igc: Fix hicredit calculation
    6c853b57684e i40e: Restore VF MSI-X state during PCI reset
    9400f854facd ASoC: meson: g12a-tohdmitx: Fix event generation for S/PDIF mux
    e08b666e4415 ASoC: meson: g12a-toacodec: Fix event generation
    3a78a57764f0 ASoC: meson: g12a-tohdmitx: Validate written enum values
    f74281f241ff ASoC: meson: g12a-toacodec: Validate written enum values
    947db598acb8 i40e: fix use-after-free in i40e_aqc_add_filters()
    975d6f66f2b6 net: Save and restore msg_namelen in sock_sendmsg
    b2869e7600f4 netfilter: nft_immediate: drop chain reference counter on error
    51976846f202 net: bcmgenet: Fix FCS generation for fragmented skbuffs
    c748c358debe sfc: fix a double-free bug in efx_probe_filters
    5c161f2220f5 ARM: sun9i: smp: Fix array-index-out-of-bounds read in sunxi_mc_smp_init
    fd2e7829239e net-timestamp: extend SOF_TIMESTAMPING_OPT_ID to HW timestamps
    dc5643abc1ac can: raw: add support for SO_MARK
    464fb49ca9bb can: raw: add support for SO_TXTIME/SCM_TXTIME
    ba80ff7a85b6 net: Implement missing getsockopt(SO_TIMESTAMPING_NEW)
    5636941e42d5 r8169: Fix PCI error on system resume
    0ce9a244d33b net: sched: em_text: fix possible memory leak in em_text_destroy()
    c0b56aa9d1a6 mlxbf_gige: fix receive packet race condition
    271567afd4c2 ASoC: fsl_rpmsg: Fix error handler with pm_runtime_enable
    1867a9094743 igc: Check VLAN EtherType mask
    f24370ddf75d igc: Check VLAN TCI mask
    4ec5efdb9034 igc: Report VLAN EtherType matching back to user
    b17f8024a5f0 i40e: Fix filter input checks to prevent config with invalid values
    def90597ef5b drm/i915/dp: Fix passing the correct DPCD_REV for drm_dp_set_phy_test_pattern
    a7b67635de1a octeontx2-af: Fix marking couple of structure as __packed
    802af3c88ad1 nfc: llcp_core: Hold a ref to llcp_local->dev when holding a ref to llcp_local
    5d3e98ef12f6 drm/bridge: ti-sn65dsi86: Never store more than msg->size bytes in AUX xfer
    2f8cefc8b638 wifi: iwlwifi: pcie: don't synchronize IRQs from IRQ
    1f2f662c8bec Revert "PCI/ASPM: Remove pcie_aspm_pm_state_change()"
    200cecd6ff1e ALSA: hda/realtek: Fix mute and mic-mute LEDs for HP ProBook 440 G6
    90ab9a70f0d8 block: Don't invalidate pagecache for invalid falloc modes
    c496c35310e6 keys, dns: Fix missing size check of V1 server-list header

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 1e61698222..e64f21b2f0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "daa620f017a02ae381f1e54be7ceb8a2f3e3caee"
-SRCREV_meta ?= "be429ba6790683eae6d1c34d527af29890988c25"
+SRCREV_machine ?= "7168cfa2ce6492db31163393808806b6f48af5e8"
+SRCREV_meta ?= "487de687c6a4553f11d67b83d01f16f79449ee49"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.146"
+LINUX_VERSION ?= "5.15.147"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index c7c4e09bd9..38bea23264 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.146"
+LINUX_VERSION ?= "5.15.147"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "aade2fc343af128889d6c6f1071ec1a8e9a548a8"
-SRCREV_meta ?= "be429ba6790683eae6d1c34d527af29890988c25"
+SRCREV_machine ?= "641e2136a155ce3179c84b9365a5998c1354fdd0"
+SRCREV_meta ?= "487de687c6a4553f11d67b83d01f16f79449ee49"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index ef8c18b1b2..1acd7b62cd 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,17 +14,17 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "f59d00a628c3ddb39052284a4a7bd54f9ee12999"
-SRCREV_machine:qemuarm64 ?= "8b10556d4fd67dec1a16252ef0d3058dfe31dff5"
-SRCREV_machine:qemumips ?= "b0c8aefa7811fd3b7cebb25c1565f73523c7b2ac"
-SRCREV_machine:qemuppc ?= "0ebd785a8436934e3f3e6dea6506de7f7ed9947e"
-SRCREV_machine:qemuriscv64 ?= "ea4d6bb2c229f41b49dc8a8a9cdcd6d7e55dc46f"
-SRCREV_machine:qemuriscv32 ?= "ea4d6bb2c229f41b49dc8a8a9cdcd6d7e55dc46f"
-SRCREV_machine:qemux86 ?= "ea4d6bb2c229f41b49dc8a8a9cdcd6d7e55dc46f"
-SRCREV_machine:qemux86-64 ?= "ea4d6bb2c229f41b49dc8a8a9cdcd6d7e55dc46f"
-SRCREV_machine:qemumips64 ?= "187d249255a797c470b0680f28e18a17a05c3bb4"
-SRCREV_machine ?= "ea4d6bb2c229f41b49dc8a8a9cdcd6d7e55dc46f"
-SRCREV_meta ?= "be429ba6790683eae6d1c34d527af29890988c25"
+SRCREV_machine:qemuarm ?= "82f8a25a3894c10d1cf26914b8e51726351ba11e"
+SRCREV_machine:qemuarm64 ?= "cf955e443d881e296b83940143fd30ea83fcf222"
+SRCREV_machine:qemumips ?= "1c3babd3b42768e24c797edfc3f67906aca6d072"
+SRCREV_machine:qemuppc ?= "b08998787bece69376578b049cab073d8b80e872"
+SRCREV_machine:qemuriscv64 ?= "5822f13dba3b1f460536d873aea707f4b25840cf"
+SRCREV_machine:qemuriscv32 ?= "5822f13dba3b1f460536d873aea707f4b25840cf"
+SRCREV_machine:qemux86 ?= "5822f13dba3b1f460536d873aea707f4b25840cf"
+SRCREV_machine:qemux86-64 ?= "5822f13dba3b1f460536d873aea707f4b25840cf"
+SRCREV_machine:qemumips64 ?= "4ff2c0496c0160a96185a080ec9678c63b68bd47"
+SRCREV_machine ?= "5822f13dba3b1f460536d873aea707f4b25840cf"
+SRCREV_meta ?= "487de687c6a4553f11d67b83d01f16f79449ee49"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.146"
+LINUX_VERSION ?= "5.15.147"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


