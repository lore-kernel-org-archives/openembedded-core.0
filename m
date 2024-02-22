Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 375C7C48BF8
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 14:31:08 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.14015.1708612259608830920
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Feb 2024 06:30:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wOGnm8rA;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d7431e702dso78314065ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 06:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708612259; x=1709217059; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HZM9lPJbKWq3ybRrglh09vCry25sci6cTBn25TZAcKk=;
        b=wOGnm8rAI5UTSj1eSiFw3VtRQctLOs233LUTUA24ezg+ma3ElyLSrzZbLe+rS06DTt
         mk2rCuT23OKupIN6qwOco95iHTZTq0hAQP2+kQx3ofPZWKPkxvNgzoJ/cxikBF8mR0gN
         T4eOAAHABgdH1dashHi3vI1DHSDvQXfvc9DS5I5gYaBw8/JW4ZAuqwrCLqa84qsr677L
         sRHjhyC2h68zKpyhnt5qwDgCuh0h3gCsA2et+fRwjX7L8KDXr01bswjSi5lhSvFr+KR8
         8Em1O/VRUpHPTHAU8zcQtg/CZy26debpKUUXPY+PEyzkYDNCAL/iYagBCTrhjMysz5+y
         kUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708612259; x=1709217059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HZM9lPJbKWq3ybRrglh09vCry25sci6cTBn25TZAcKk=;
        b=aStU1m1rH8x9dYs/O6LPiKJjoGtgJras/JaAmbTIHhZNu6uD6fznzVREt1AgWRNOPD
         vQ5aW1ndG9c+d+YFZuYVVBJmIsGm4JRPuMmHXqe33TbyPttDU0vso89CVaNa1SkTLhRW
         qubjFjJ7MTGzWIzVK2Ltv2k8B2l8EwrTCof+CADtyXppWHZ2AX0XGdI2SKwruVRbNa1q
         FEz3GgYPvoU4EBBmEHosBS7JTyuTn897oB3oQFPw/zltqE3f8xDPXU81oCjN/h7wmGKN
         u72BSCFXT7qSXIwUziewqktVuZrZH18UksnG7VsAuRJwmH1rWt0NugJvbnOHmM4wFT3G
         CqLw==
X-Gm-Message-State: AOJu0YyzTdXbjQXNvn0WoC3a6UmbxYhIhbmqyRVAsj5J4d9e/eAIpUpK
	WHgNUQ9GkXGVhYk5ILICVGqAp+tjVYofC3z0hBD9XBQSlHGm+ILtQV343Lw3g1DpH8fv8zi3y5B
	kkpU=
X-Google-Smtp-Source: AGHT+IGq3ziv+Qvus5ogl7UBEEllA2n3j+3Zuq96D3G6uMj6K11n8N/WxF3hepttTcOedEoaZSF7bA==
X-Received: by 2002:a17:902:a389:b0:1db:8c35:c40d with SMTP id x9-20020a170902a38900b001db8c35c40dmr14914316pla.27.1708612258774;
        Thu, 22 Feb 2024 06:30:58 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id k13-20020a170902f28d00b001dbcf653024sm9364558plc.293.2024.02.22.06.30.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 06:30:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/9] linux-yocto/5.4: update to v5.4.267
Date: Thu, 22 Feb 2024 04:30:37 -1000
Message-Id: <a3de4e1c5b41cdbdc9942b666212aa63921399a9.1708612053.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708612053.git.steve@sakoman.com>
References: <cover.1708612053.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 14:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196025

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    9153fc966495 Linux 5.4.267
    69ef165176a3 ASoC: meson: codec-glue: fix pcm format cast warning
    584756c3d75a ipv6: remove max_size check inline with ipv4
    66b3025202b4 ipv6: make ip6_rt_gc_expire an atomic_t
    ae424c848db6 net/dst: use a smaller percpu_counter batch for dst entries accounting
    7b3a9c2bf315 PCI: Disable ATS for specific Intel IPU E2000 devices
    c6141c49bc80 PCI: Extract ATS disabling to a helper function
    8711fa0c06d4 netfilter: nf_tables: Reject tables of unsupported family
    c67bf30baf26 net: tls, update curr on splice as well
    c2d9b438554e ath10k: Get rid of "per_ce_irq" hw param
    d15f869cb3b3 ath10k: Keep track of which interrupts fired, don't poll them
    696b992edc7e ath10k: Add interrupt summary based CE processing
    366df9ecbcb8 ath10k: Wait until copy complete is actually done before completing
    c4541e39808e mmc: sdhci-sprd: Fix eMMC init failure after hw reset
    a9c9ffcd217b mmc: core: Cancel delayed work before releasing host
    bfc3720ca8d0 mmc: rpmb: fixes pause retune on all RPMB partitions.
    77359c497305 mm: fix unmap_mapping_range high bits shift bug
    5af5e946c4dd i2c: core: Fix atomic xfer check for non-preempt config
    d8ec24d79db1 firewire: ohci: suppress unexpected system reboot in AMD Ryzen machines and ASM108x/VT630x PCIe cards
    85015a96bc24 mm/memory-failure: check the mapcount of the precise page
    3d8fab93ca98 net: Implement missing SO_TIMESTAMPING_NEW cmsg support
    f7084217d945 bnxt_en: Remove mis-applied code from bnxt_cfg_ntp_filters()
    acfeb9039b17 asix: Add check for usbnet_get_endpoints
    6c00721ad7aa net/qla3xxx: fix potential memleak in ql_alloc_buffer_queues
    a4ea54c52828 net/qla3xxx: switch from 'pci_' to 'dma_' API
    863ca421b4a7 i40e: Restore VF MSI-X state during PCI reset
    01c2d73ae2dd ASoC: meson: g12a-tohdmitx: Fix event generation for S/PDIF mux
    bdc00b8c3afe ASoC: meson: g12a-tohdmitx: Validate written enum values
    fe2d1dda1db4 ASoC: meson: g12a: extract codec-to-codec utils
    93d80aadc02e i40e: fix use-after-free in i40e_aqc_add_filters()
    b40828a2ab57 net: Save and restore msg_namelen in sock_sendmsg
    68c8fdb9f9c8 net: bcmgenet: Fix FCS generation for fragmented skbuffs
    4c0fa624a693 ARM: sun9i: smp: Fix array-index-out-of-bounds read in sunxi_mc_smp_init
    c1556217ff6f net-timestamp: extend SOF_TIMESTAMPING_OPT_ID to HW timestamps
    2cdb65084824 can: raw: add support for SO_MARK
    96a6d1bb28ed can: raw: add support for SO_TXTIME/SCM_TXTIME
    b1719cbb733e net: sched: em_text: fix possible memory leak in em_text_destroy()
    ef4fd7518c6e i40e: Fix filter input checks to prevent config with invalid values
    65c6ef02ff26 nfc: llcp_core: Hold a ref to llcp_local->dev when holding a ref to llcp_local

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  4 ++--
 .../linux/linux-yocto-tiny_5.4.bb             |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 20 +++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 72fa7b9118..44278cb2a4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b587a3fecb37c3e198592a5733ce23cd8a33f6fc"
+SRCREV_machine ?= "36f355fd2c80860745565b2e5bd293d35a645b86"
 SRCREV_meta ?= "8ce0cca5a5a2895ef024bee2daff56c5e846c3bc"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.266"
+LINUX_VERSION ?= "5.4.267"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 023b9fe9e1..abc7ecad06 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.266"
+LINUX_VERSION ?= "5.4.267"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "da07f26ba47c365237459233a85f398599677b28"
-SRCREV_machine ?= "65fdb0d3fc750b89ed2ad3268d346765a7131094"
+SRCREV_machine_qemuarm ?= "f5c9f947b3349a982c032c81f4b636728e2b8004"
+SRCREV_machine ?= "028ae2c5666867a95ebc7b44723048286338bb0d"
 SRCREV_meta ?= "8ce0cca5a5a2895ef024bee2daff56c5e846c3bc"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 412b8230ab..550960dcd0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -13,15 +13,15 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "732f4200d901957f0ab0a6c760fcc26e8ddfdb03"
-SRCREV_machine_qemuarm64 ?= "458f12462197606e02368dc74a79cc5f10e3409b"
-SRCREV_machine_qemumips ?= "4a746565ac1418646f94506f983f85779902b4eb"
-SRCREV_machine_qemuppc ?= "f51c8df8974a2b439d6a845ffbf144e935f04f5c"
-SRCREV_machine_qemuriscv64 ?= "c2bd298696fc9965fb3a888e78cfb00a92d6824f"
-SRCREV_machine_qemux86 ?= "c2bd298696fc9965fb3a888e78cfb00a92d6824f"
-SRCREV_machine_qemux86-64 ?= "c2bd298696fc9965fb3a888e78cfb00a92d6824f"
-SRCREV_machine_qemumips64 ?= "d56e5470a9173e9d2af61828619098356fadb75e"
-SRCREV_machine ?= "c2bd298696fc9965fb3a888e78cfb00a92d6824f"
+SRCREV_machine_qemuarm ?= "8c115d2b1f1a2f1ddc5196fd13d2045ed65d5c6e"
+SRCREV_machine_qemuarm64 ?= "9f7ddd1312cafad0c67288936518e94d9f7cecc5"
+SRCREV_machine_qemumips ?= "6a033ec3a29689156cd3e9c16383560f21e230e2"
+SRCREV_machine_qemuppc ?= "d2ca96883f4c93dfd56e5dc203b15ea36151cf4c"
+SRCREV_machine_qemuriscv64 ?= "2ee6ae8d74b9921a1454fec6949b79bd676a95c8"
+SRCREV_machine_qemux86 ?= "2ee6ae8d74b9921a1454fec6949b79bd676a95c8"
+SRCREV_machine_qemux86-64 ?= "2ee6ae8d74b9921a1454fec6949b79bd676a95c8"
+SRCREV_machine_qemumips64 ?= "e75dbfccf896e92c327165880b90e42049774552"
+SRCREV_machine ?= "2ee6ae8d74b9921a1454fec6949b79bd676a95c8"
 SRCREV_meta ?= "8ce0cca5a5a2895ef024bee2daff56c5e846c3bc"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
@@ -31,7 +31,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.266"
+LINUX_VERSION ?= "5.4.267"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


