Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E66D0FC0364
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:42:12 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.691.1776958922709759907
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 08:42:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dEHg4qtR;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8d65f4073bfso926877485a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 08:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776958922; x=1777563722; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eY0v1q6KOq8Ug1yD3N82YF8FY2Zgs5noGrqWjpZXH6c=;
        b=dEHg4qtRgwlKMbgGdXBgEa0cDJFaogTwrIFMXiRAjexY7Gct6dcMrwnyy0oW85n4VO
         zXp1JMCbt+FQA+4gW/GGRYz5Ci/ZRCV3QJmQS6gafUZH4xnycvsPehi5bMxBJQfN9L9z
         3+LDcKYD65mEOKNWeHTyr8JvlMGJ8IM7RzYuyhv7iEA41mxN09AdJgk10k0lp8MNZ4mC
         pVYqiNFdrNHYpFRGEfsfB65AMOGxxNcvuFqEJz9t92IfDIGJhqk7tlQvnLfqMmzD9NkN
         bc5t62d7kwh9RLdjpsgm0vxyIGizHdowWAPN13tpAR3vaqcR8DRsfkh2UUHWVPGFuTf0
         bhmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776958922; x=1777563722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eY0v1q6KOq8Ug1yD3N82YF8FY2Zgs5noGrqWjpZXH6c=;
        b=WpdNZnaE0zl3ZFSGwzuxH+oCv4YzyLeyy78QobsrF5D6yT1IfFOnzxCfIeDQdrKoLg
         bG3PEIIUxbocq1XQyIK+U1oOq+nOqYV1/ALeHfKc5EOC5hsBcEy7Q7v3V5G0sVS2BSFI
         UdrbV2x+12qa61WNyTxlQyNJemV9ToCHvnOdbOnvk/6bH9E/NdyH2c62fHjrcM+CO1jc
         pH0ZFC2JIrdfpKx3FAd23QOZO7XihL6c5/O8+NM1/oatClQbkjNDVeYW4vwRJOxaOvFH
         hbCbhTFnZqc3XI4rRSuao0V00ndCt3+toL8xU7aj25gDDiqONXL3J0TPrmj7W3bYKUgJ
         X83g==
X-Gm-Message-State: AOJu0YxA+LLNP6/bBm64IpVXv2MbhQUgXVxTzLwWECgfnOpaShSFmLZR
	epaTQrujx8kgppoEzmfk3q5/EpRQoVVX9o8TbN3dDqPhKuLdBjpONMkhBOrBvtGO
X-Gm-Gg: AeBDieukxTV3lMNzdnW+5upTNITLMWMApKKybLSe3r8AWx9r/ckyi0lg8tEqflVbpYw
	+AJiSodTrDoy3Mk0+H2jfFWhZ3LKKPIa1l4Ckseg3diL6S4hsksgvaUqr+xwBBgvU+m4bk9+npd
	vomCjGQcABqYYgGK/u+UqIMt2RlWphZVfh57qit0k3HZUIDRHZC05qYPRRpekC892qaFFqzRDgG
	XA00SWJ32QA0hlGQc7UQva1qa2ewt5H27qzIDTrkwiP1Ec3f4ieI/zzdQGC4bO5R5m1GZNyK74z
	Iig+Z+cEBCDm9v+mPg/TtJ2UgcH4Phnx8A1TdSHKJAHagQZHXX/Ezg+cgqIVW77HaXeiTKF3KK1
	vO7/bACvVSOQOfUFEF22iymNUyIqx0nu70XXuRykMEM2nH0PCPjI0LvBWXHlT0xrsh2c58cNL8G
	efa9gqnWi6m7IITqMNrYd+BaHPZvDPUX8/ryFw2aPNmtFMUaBzBCBtMuX+U7kcgF0T/2rPg3gVw
	sZ69cAtAC52hKJjI7WhAk7PsIwfsetS1nEESkiQxzvG4n+VptYhI+BGXFXWjXC5GRByF5VpRi8g
	d7Mp
X-Received: by 2002:a05:620a:4886:b0:8d6:9e5c:36c with SMTP id af79cd13be357-8e78f0584edmr4077157585a.6.1776958921546;
        Thu, 23 Apr 2026 08:42:01 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d69abee3sm1602139585a.17.2026.04.23.08.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:42:00 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][scarthgap][PATCH 08/08] linux-yocto/6.6: update to v6.6.135
Date: Thu, 23 Apr 2026 11:41:49 -0400
Message-ID: <20260423154149.1933049-8-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423154149.1933049-1-bruce.ashfield@gmail.com>
References: <20260423154149.1933049-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 15:42:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235799

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    9760bf04666d Linux 6.6.135
    53b86879e92b Revert "PCI: Enable ACS after configuring IOMMU for OF platforms"
    9853917f9edf rxrpc: Fix missing error checks for rxkad encryption/decryption failure
    1355eb244aa5 rxrpc: Fix key/keyring checks in setsockopt(RXRPC_SECURITY_KEY/KEYRING)
    9ce36d28f67c rxrpc: fix reference count leak in rxrpc_server_keyring()
    47073aab8a3a rxrpc: reject undecryptable rxkad response tickets
    b8f66447448d rxrpc: Only put the call ref if one was acquired
    f1a7a3ab0f35 rxrpc: Fix key reference count leak from call->key
    93fc15be44a3 rxrpc: Fix call removal to use RCU safe deletion
    e63265f188ea net: lan966x: fix page_pool error handling in lan966x_fdma_rx_alloc_page_pool()
    88591194df73 mm: filemap: fix nr_pages calculation overflow in filemap_map_pages()
    b7b8012193fd net: stmmac: fix integer underflow in chain mode
    9a56735581d5 net: qualcomm: qca_uart: report the consumed byte on RX skb allocation failure
    6468cab1173f mmc: vub300: fix NULL-deref on disconnect
    80fd0de89805 pmdomain: imx8mp-blk-ctrl: Keep the NOC_HDCP clock enabled
    0985b18c95eb net/mlx5: Update the list of the PCI supported devices
    ca3f48c3567d drm/i915/gt: fix refcount underflow in intel_engine_park_heartbeat
    2f55b58b5a0b batman-adv: hold claim backbone gateways by reference
    2eb9d67704ca net: altera-tse: fix skb leak on DMA mapping error in tse_start_xmit()
    0e43e0a3c940 net/tls: fix use-after-free in -EBUSY error path of tls_do_encryption
    d3de72e2a2b9 EDAC/mc: Fix error path ordering in edac_mc_alloc()
    672b526def1f X.509: Fix out-of-bounds access when parsing extensions
    69d61639bc7e batman-adv: reject oversized global TT response buffers
    07cb6c72e66b nfc: pn533: allocate rx skb before consuming bytes
    0f36273a4b24 arm64: dts: hisilicon: hi3798cv200: Add missing dma-ranges
    e3d84395a16d arm64: dts: hisilicon: poplar: Correct PCIe reset GPIO polarity
    e85ee7bd042c arm64: dts: imx8mq-librem5: Bump BUCK1 suspend voltage up to 0.85V
    03c00ef6d6df Revert "arm64: dts: imx8mq-librem5: Set the DVS voltages lower"
    4bf41c2731a0 wifi: brcmsmac: Fix dma_free_coherent() size
    3bcf7aca63f0 tipc: fix bc_ackers underflow on duplicate GRP_ACK_MSG
    c221ed63a276 xfrm: clear trailing padding in build_polexpire()
    070abdf1b043 netfilter: nft_ct: fix use-after-free in timeout object destroy
    533e0a0454d0 Revert "drm: Fix use-after-free on framebuffers and property blobs when calling drm_dev_unplug"
    32bad10de347 netfilter: nft_set_pipapo: do not rely on ZERO_SIZE_PTR
    84d458018b14 seg6: separate dst_cache for input and output paths in seg6 lwtunnel
    3e9bf8c3ba89 Revert "mptcp: add needs_id for netlink appending addr"
    8ec6a58586f1 usb: gadget: f_hid: move list and spinlock inits from bind to alloc
    e8984f068e90 virtio_net: clamp rss_max_key_size to NETDEV_RSS_KEY_LEN
    0dc539b888fb scsi: ufs: core: Fix use-after free in init error and remove paths
    146e25625378 ASoC: simple-card-utils: Don't use __free(device_node) at graph_util_parse_dai()
    811b3dccfb0a MIPS: mm: Rewrite TLB uniquification for the hidden bit feature
    591f030449ad MIPS: mm: Suppress TLB uniquification on EHINV hardware
    8a4de6bcaf01 MIPS: Always record SEGBITS in cpu_data.vmbits
    00a4b91f8fac Input: uinput - take event lock when submitting FF request "event"
    546c18a14924 Input: uinput - fix circular locking dependency with ff-core
    3fd6547f5b8a mptcp: fix slab-use-after-free in __inet_lookup_established
    673d2a3eef6e net: rfkill: prevent unlimited numbers of rfkill events from being created
    e0c8542c3d09 xfrm_user: fix info leak in build_report()
    1de5c76bf40e wifi: rt2x00usb: fix devres lifetime
    066c760acead lib/crypto: chacha: Zeroize permuted_state before it leaves scope
    91f02726b220 x86/CPU: Fix FPDSS on Zen1

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 6440d0babb..fab90bcc14 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "fda570bd42ccafdd93a2bc4eae0ab36a4084031e"
-SRCREV_meta ?= "888e60b42c251c492d6f41f154bb8c4eef5f8875"
+SRCREV_machine ?= "796ebf5cd0bb25e473fead08d0e3c8c1b68f0676"
+SRCREV_meta ?= "b162eec5fa39c4658181073e741efe3a9d498454"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.134"
+LINUX_VERSION ?= "6.6.135"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index deb5943145..80234909a3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.134"
+LINUX_VERSION ?= "6.6.135"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "990b12e4095890d00a1c42ee5643443f1491dc0e"
-SRCREV_meta ?= "888e60b42c251c492d6f41f154bb8c4eef5f8875"
+SRCREV_machine ?= "8c3e42c1177c1cf7f4b028ffe1ddacf5a7e8b018"
+SRCREV_meta ?= "b162eec5fa39c4658181073e741efe3a9d498454"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 11efb351e9..43d0ad9c8e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "55c82e0b84e8892add226263bb00dfaef810f487"
-SRCREV_machine:qemuarm64 ?= "c3b5dcdca64f2d9d5dfd9808b2ec4d1363ddc5c2"
-SRCREV_machine:qemuloongarch64 ?= "3db526a0348edbb162b13d91e788eb270bcbb934"
-SRCREV_machine:qemumips ?= "065d9d6fa1db8f762b740b0fac999e8d68b3afcf"
-SRCREV_machine:qemuppc ?= "dd0d7b2a25b1fc953887f6d32247c58b19f23e73"
-SRCREV_machine:qemuriscv64 ?= "3db526a0348edbb162b13d91e788eb270bcbb934"
-SRCREV_machine:qemuriscv32 ?= "3db526a0348edbb162b13d91e788eb270bcbb934"
-SRCREV_machine:qemux86 ?= "3db526a0348edbb162b13d91e788eb270bcbb934"
-SRCREV_machine:qemux86-64 ?= "3db526a0348edbb162b13d91e788eb270bcbb934"
-SRCREV_machine:qemumips64 ?= "5546a26cb003a61697b9c748e80c964188dbde1b"
-SRCREV_machine ?= "3db526a0348edbb162b13d91e788eb270bcbb934"
-SRCREV_meta ?= "888e60b42c251c492d6f41f154bb8c4eef5f8875"
+SRCREV_machine:qemuarm ?= "e3d837b99e32b26f86c7e0c956787aa7ac11cbc8"
+SRCREV_machine:qemuarm64 ?= "440d78702ecd1f42162acba37434033a5ca903cb"
+SRCREV_machine:qemuloongarch64 ?= "97fc5acdc890a23017140ff16705091544b0ab09"
+SRCREV_machine:qemumips ?= "8692ec9071ca8f4432c2c3409bf79240f34a7af5"
+SRCREV_machine:qemuppc ?= "d49f40c6896b5d1ac37a84564ed7ab5b7a839519"
+SRCREV_machine:qemuriscv64 ?= "97fc5acdc890a23017140ff16705091544b0ab09"
+SRCREV_machine:qemuriscv32 ?= "97fc5acdc890a23017140ff16705091544b0ab09"
+SRCREV_machine:qemux86 ?= "97fc5acdc890a23017140ff16705091544b0ab09"
+SRCREV_machine:qemux86-64 ?= "97fc5acdc890a23017140ff16705091544b0ab09"
+SRCREV_machine:qemumips64 ?= "91b8fff701cdc434e211a58915886224eb6e0d1a"
+SRCREV_machine ?= "97fc5acdc890a23017140ff16705091544b0ab09"
+SRCREV_meta ?= "b162eec5fa39c4658181073e741efe3a9d498454"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "8cee53b8eaeb5d1f7c97b7f2381653ed00ffc26b"
+SRCREV_machine:class-devupstream ?= "9760bf04666dfe154161d49b6207c3486685bf29"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.134"
+LINUX_VERSION ?= "6.6.135"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


