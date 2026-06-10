Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D67A1CD98C6
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 16:50:22 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25470.1781110216501465838
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 09:50:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iUijFEgE;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8cce8873b56so476946d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781110215; x=1781715015; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eY0v1q6KOq8Ug1yD3N82YF8FY2Zgs5noGrqWjpZXH6c=;
        b=iUijFEgEROOIl0oiJLaxmWEYHyAHGQqr+n709KLMvibs5VwLrYRvbhsU7b6RMlKc82
         rO37HlPcXxD/nGnQQDbliAVBTB5fyfgoP4DXu27/ryf4zZho1pwg4bcj81ORg/O82hY/
         Xmf/YHJRsdX8HwXwvfwkVdCOes/lENmkxdHH5m6chYUmPrY+eYpwyWcdd4futBpzuCTE
         dEPKxkczsYzhbu4Xf2XkMWeNRQLupaE/WjKWJDzWYoF3dduk+y4ozd+XUavfjhsDzR1h
         ad4u4RXl+fWjnkyag4fYE0I9ONkYMJhVi1f0CwLOp9HzuK8DkviJyndIv/q0KwQZE0in
         +E5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781110215; x=1781715015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eY0v1q6KOq8Ug1yD3N82YF8FY2Zgs5noGrqWjpZXH6c=;
        b=aLHqE6NQ40Q/Yay39Osq53juvfOIwuDRNJ43hPeRX27yMJjSwokEYBO8i2Vo9Q/Eog
         iu/YGRxkEf4bNEufUUp2M0DCgSyVSjE1BnyoHYuOp6MpaM3ToXfIKDQ+m02oBWH7j0NT
         rXlgQFI9xOP+fexEwkHtDP4Rn82hERjZ5vXEwgKasavgac7YY8WiXfstH0zwa/cCUhK5
         P2pngd6gZO075bUbqGjrpi72oZSYseq97L89i1Gc5NCJ9Wa1CUQ1WW72pxaQlddZCIa8
         aWjVbBN2dhvZMcqYtzBY6/2hdZ04HA9PRiOPpFIyj+7CkoGYFOSVfBJQtnNbn/9iCC8I
         6dPg==
X-Gm-Message-State: AOJu0YxvjnbUzN7xnwkuu6EIUfHL0L4QvkNdFKSF/fl9ToN5Y72sgPR5
	SVzy3tuXwqFVG2vrM2qeuaYd6kkpR46flpkPSat9Do5swTbMyBdLHlQ1GgS3aniJ
X-Gm-Gg: Acq92OGQR5B4NDflrpBbIUhAtPrN8C+FP9gzggDP4pJ/yFrBEA9WwQKlv4nmUvreXiZ
	zEWw2zvtsiRVxp5bj1gGrUZb478LXOB7OOzedzKl1ok6CUoy/9Sy1pe7WZnAYJuk9bN10yLUa8B
	ZyXwje6Kb1CNy3q84SGhmDVa7gZO0+8kUTm7Ji+NHgZqMz6KI//JeCokTy+rvA+I+1Rjzozy8PZ
	k5gDoj6FcmoUTm2rOZBYY4CmO2eDx1yL83Ll2fYOAkQWUjzCmnEAX1N+yFkMieF/yTQbRNPY21A
	VXER2U9nQniRPpL8QsUCGFJA/62+bs6RHU0GkKVHFC+gvrc3lWc6S+EiKs1rszsntKBuy5ogkUR
	0sd4gm1H+ynSqom4tHWpIxuoHseqAR0bhu5pyxxOC9nDMHrwyBDKRvmFVQw5YZDyqrppRI30x/1
	pko3DgfhfYHgIOHDS2dWB0ihkqhW0C/gcuE3nEo1toMKbzwaKA38ZtW1QhEa38OMFt3chZ3Uqsj
	Z5Bikd0MyY3Lj00pNL1FcKpH0HSZybFuXJPvdniTETcoD3RmbfmdkScB28kLjxiRgkacZ2RiZ9I
	ozZZfqK6duikyzu+Dr9YZWy45beVflntMCn+izfRT01BnNMe/5ggjso=
X-Received: by 2002:a05:6214:4991:b0:8ac:a91c:c8d with SMTP id 6a1803df08f44-8cee8c5a665mr318518826d6.14.1781110215307;
        Wed, 10 Jun 2026 09:50:15 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccdb915csm241444346d6.14.2026.06.10.09.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 09:50:14 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][scarthgap][PATCH 05/11] linux-yocto/6.6: update to v6.6.135
Date: Wed, 10 Jun 2026 12:50:02 -0400
Message-ID: <20260610165008.1870552-5-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610165008.1870552-1-bruce.ashfield@gmail.com>
References: <20260610165008.1870552-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 16:50:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238381

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


