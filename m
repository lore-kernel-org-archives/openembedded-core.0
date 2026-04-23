Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C4BFC0352
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:32:41 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.397.1776958354300752209
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 08:32:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DHP5t/1d;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8a3342d301aso67151626d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 08:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776958353; x=1777563153; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/ffDjrpI7IsynGhnI5XFJJH7/uuqvypzl3pVD7EKsY=;
        b=DHP5t/1dFKF/Y3JTAomSA4ayel+h1IIy7XcRD492FM5SiPWifU25FmRpQC25ssve1y
         ZL+m4IbZGnb2x6ntFjw26u0QSXc0gDUt7zBX0DC0GoOyw1aHKKRAKolFM+TbqybNG0aq
         ZEOSq43gQYNrocjDe4F6vp/NlHf68OPqXp+Vd36utsIOwxXWer/d6eGPb31xkuYPjhr2
         MHHegz6pop7/LlRDVmejz2X/An949QcFHv1tO7Yz5slgTF+CQZmgwXNSkA1ul2AYfA8p
         ktlAKE/vo64oyS2r6/EkVmyKXYKCcQi79SDQfGrjnn3iOksIthe4UwbLUWBy480y3Y3B
         T50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776958353; x=1777563153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V/ffDjrpI7IsynGhnI5XFJJH7/uuqvypzl3pVD7EKsY=;
        b=AE30AFBCbEmoM+b4+oC1rxfDxGNB+svMjCuzQXb7kfzTEd0MdhYsXo/9Fz75v92mIC
         QdV6dEMv4infnnk7zpYUeOFulWVByX5dQgj2rtC0pkXyQBWlYATIxzTP+FWmLOOArvv2
         OOdnPxQ1BUw3VQF709bYYIY2H/w9+LCTsMpcok8QEhIbUQjzfbv00vGecdgFs9cSdfke
         2WffQl6YcL07oVXJjwNvDDeXVbgCSbMQ6O7S6PVSAX+d5pAEGuVNPR/eNIA+JfjWeBeD
         4uLmHiWME9EHPaxrEiQjef4U12KJx2lG43xcOBa+RcudhxeGyX3ethq3+vHVcT4nKTbu
         bZOg==
X-Gm-Message-State: AOJu0Yz66ou68hb1yQa12mP0fvGXcgJdnx4RPtTBE7HukqHmYg+qNU4x
	fEZCBp83BPnp6ddxddkczldNP1liQP2/Juhmny0y6kdfqZyorlcx8oGd0OkkobYy
X-Gm-Gg: AeBDievg+fGUII+jfMsAgmkPHTcPw7BgxPAO6f/rjnoaAvIzFbCJcHXbOamlv4reL5L
	QBs5apoahuHI/rnlnD7+jiIUgPdGLQF648uLg70Pd8utFrpjDjdvSk6qbZq2XaMGp0J6kyP2ppo
	YvmaPBSvhkjiB0j7mwm+JXjVANUpV9XQI1rzyVdM20w1XXW5prjOrynRVfgnpsuyZ3/Fnr+s6Tz
	HkbT2wE4Dz5YlPsDw4Zx/VKtWT2BupdqDxIHPquZnG75IzXuuat/a5mlZ0+Nogv2IpEqkXv8DuX
	CKzzaFLDPs6kr0ynxCUY6bfK7t2AOrh5TmPXCp7Fo4S7lpuTmZGg5/P0mQkRCGG/FkBjxQlXo6s
	EozzuFLUDEOGjKuak1qFM1QfDny3TfxnVGzuhvz5CtHcvFqt37IDGOq3airER/oFzWHfZrUWcs5
	6zq7EktemhSyJgE5/hEguU9r7mwshRaIzeXW3lxnt6BckIy9LZH6lxbKfmfL0tEHEUjDoKIj5be
	0his4X9A4Ea+FzKWMcNqG7+BWWsZ8gsJm9+gw0IvcK2DH8dO8YQFbxa9c4lOSngEneHgg==
X-Received: by 2002:a05:6214:4c8a:b0:89c:a2b2:8d44 with SMTP id 6a1803df08f44-8b028112da3mr388905366d6.39.1776958352973;
        Thu, 23 Apr 2026 08:32:32 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac429ffsm160765996d6.2.2026.04.23.08.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:32:32 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 07/15] linux-yocto/6.18: update to v6.18.23
Date: Thu, 23 Apr 2026 11:32:14 -0400
Message-ID: <20260423153222.1932256-8-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423153222.1932256-1-bruce.ashfield@gmail.com>
References: <20260423153222.1932256-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 15:32:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235782

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.18 to the latest korg -stable release that comprises
the following commits:

    47a33eea6d51 Linux 6.18.23
    ad17f07e95e6 x86/CPU: Fix FPDSS on Zen1
    2d64618ea846 net: skb: fix cross-cache free of KFENCE-allocated skb head
    db297c78ce53 rxrpc: proc: size address buffers for %pISpc output
    d0035e634dae rxrpc: only handle RESPONSE during service challenge
    794586789800 rxrpc: Fix buffer overread in rxgk_do_verify_authenticator()
    4b5e8365515f rxrpc: Fix leak of rxgk context in rxgk_verify_response()
    1f864d9daaf6 rxrpc: Fix integer overflow in rxgk_verify_response()
    bf4d6e4a6856 rxrpc: Fix missing error checks for rxkad encryption/decryption failure
    03d1c51decae rxrpc: Fix key/keyring checks in setsockopt(RXRPC_SECURITY_KEY/KEYRING)
    8ee931c3cd97 rxrpc: fix reference count leak in rxrpc_server_keyring()
    beee051f259a rxrpc: fix oversized RESPONSE authenticator length check
    7875f3d9777b rxrpc: fix RESPONSE authenticator parser OOB read
    22f6258e7b31 rxrpc: reject undecryptable rxkad response tickets
    8299ca146489 rxrpc: Only put the call ref if one was acquired
    8b353f5f1385 rxrpc: Fix to request an ack if window is limited
    2e6ef713b159 rxrpc: Fix key reference count leak from call->key
    86303a1da93f rxrpc: Fix rack timer warning to report unexpected mode
    9132b1a7bf83 rxrpc: Fix use of wrong skb when comparing queued RESP challenge serial
    3e04596cba8a rxrpc: Fix RxGK token loading to check bounds
    3be718f65968 rxrpc: Fix call removal to use RCU safe deletion
    3bb18ed3b2f6 rxrpc: Fix anonymous key handling
    d5f76f812d2c rxrpc: Fix key parsing memleak
    862cb78fb2c9 rxrpc: Fix key quota calculation for multitoken keys
    92a673019943 net: lan966x: fix use-after-free and leak in lan966x_fdma_reload()
    22e1ee9f22b5 net: lan966x: fix page pool leak in error paths
    b5dcb41ba891 net: lan966x: fix page_pool error handling in lan966x_fdma_rx_alloc_page_pool()
    214ceaa8a3a2 idpf: set the payload size before calling the async handler
    d6e9bef3313a idpf: improve locking around idpf_vc_xn_push_free()
    e02c974fc331 idpf: fix PREEMPT_RT raw/bh spinlock nesting for async VC handling
    576543bedd61 mm: filemap: fix nr_pages calculation overflow in filemap_map_pages()
    6fca757c2039 net: stmmac: fix integer underflow in chain mode
    9fdece45f6e0 net: qualcomm: qca_uart: report the consumed byte on RX skb allocation failure
    ea7468f61be0 mmc: vub300: fix use-after-free on disconnect
    c83a282615d8 mmc: vub300: fix NULL-deref on disconnect
    447f8870b484 mm/damon/stat: deallocate damon_call() failure leaking damon_ctx
    b9dadf026a9f mm/damon/sysfs: dealloc repeat_call_control if damon_call() fails
    49c00ae87230 mm/memory_hotplug: maintain N_NORMAL_MEMORY during hotplug
    470047177574 igb: remove napi_synchronize() in igb_down()
    e44919669f07 pmdomain: imx8mp-blk-ctrl: Keep the NOC_HDCP clock enabled
    82e8174d1d0e net/mlx5: Update the list of the PCI supported devices
    de9aa7e89b98 drm/i915/psr: Do not use pipe_src as borders for SU area
    2af8b200cae3 drm/i915/gt: fix refcount underflow in intel_engine_park_heartbeat
    4dee4c068844 batman-adv: hold claim backbone gateways by reference
    60f462cd2716 net: altera-tse: fix skb leak on DMA mapping error in tse_start_xmit()
    5d70eb25b41e net/tls: fix use-after-free in -EBUSY error path of tls_do_encryption
    87ce8ae51196 EDAC/mc: Fix error path ordering in edac_mc_alloc()
    206121294b9c X.509: Fix out-of-bounds access when parsing extensions
    de6c1dc3c7d0 batman-adv: reject oversized global TT response buffers
    21ae2cda66a5 nfc: pn533: allocate rx skb before consuming bytes
    083c5a417dee arm64: dts: hisilicon: hi3798cv200: Add missing dma-ranges
    f0a0a6a8c1cc arm64: dts: hisilicon: poplar: Correct PCIe reset GPIO polarity
    c82a3c9d9fb3 arm64: dts: renesas: sparrow-hawk: Reserve first 128 MiB of DRAM
    a4115c2abab3 arm64: dts: imx8mq-librem5: Bump BUCK1 suspend voltage up to 0.85V
    3b31b15230b0 Revert "arm64: dts: imx8mq-librem5: Set the DVS voltages lower"
    aee881c21b57 Revert "arm64: dts: rockchip: Further describe the WiFi for the Pinebook Pro"
    fecceacbaf48 platform/x86/intel-uncore-freq: Handle autonomous UFS status bit
    c4e1eff4606c platform/x86: ISST: Reset core count to 0
    b27fa888e4a4 wifi: brcmsmac: Fix dma_free_coherent() size
    1b6f13f62666 tipc: fix bc_ackers underflow on duplicate GRP_ACK_MSG
    0f451b43c88b xfrm: hold dev ref until after transport_finish NF_HOOK
    b1dfd6b27df3 xfrm: clear trailing padding in build_polexpire()
    688c1b491c35 modpost: Declare extra_warn with unused attribute
    0133aa1a28af workqueue: Add pool_workqueue to pending_pwqs list when unplugging multiple inactive works
    fbdb43f6bb2a firmware: thead: Fix buffer overflow and use standard endian macros
    b42aca3660dc netfilter: nft_ct: fix use-after-free in timeout object destroy
    2802ba3981f1 i2c: imx: zero-initialize dma_slave_config for eDMA
    72cf49ad50c1 af_unix: Give up GC if MSG_PEEK intervened.
    33120558237c af_unix: Simplify GC state.
    1e211179f1d9 af_unix: Count cyclic SCC.
    450e6a685d0c btrfs: fix incorrect return value after changing leaf in lookup_extent_data_ref()
    2124a61e6e2b btrfs: remove pointless out labels from extent-tree.c
    d8b281165a86 MIPS: mm: Rewrite TLB uniquification for the hidden bit feature
    ccc6a2241a49 MIPS: mm: Suppress TLB uniquification on EHINV hardware
    6c600fc0e991 MIPS: Always record SEGBITS in cpu_data.vmbits
    6c098142b370 Input: uinput - take event lock when submitting FF request "event"
    1e09dfbb4f5d Input: uinput - fix circular locking dependency with ff-core
    fb56de5d9921 seg6: separate dst_cache for input and output paths in seg6 lwtunnel
    15fa9ead4d5e mptcp: fix slab-use-after-free in __inet_lookup_established
    96a95b6d9e6d Revert "mptcp: add needs_id for netlink appending addr"
    130c991e6aad Revert "ALSA: hda/realtek: Add quirk for Gigabyte Technology to fix headphone"
    a8c26800e022 net: rfkill: prevent unlimited numbers of rfkill events from being created
    6c55714c9310 xfrm_user: fix info leak in build_report()
    e360d15fcb1e wifi: rt2x00usb: fix devres lifetime
    f4786c34216a usb: typec: ucsi: skip connector validation before init

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.18.bb              |  6 ++---
 .../linux/linux-yocto-tiny_6.18.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index c2beb077bb..5158089ff7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -15,13 +15,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "801e59a34036a1375d8f340cb0c88b84e8bc6e5c"
-SRCREV_meta ?= "d8f130c88c0f0944979672241b46b634b20b12f4"
+SRCREV_machine ?= "10663f4ac37a6565b2b001bc6d12aab1eb0d2ad4"
+SRCREV_meta ?= "dcbc01fb2df5c72a789ab9506b9bc7a1078c3298"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.18.22"
+LINUX_VERSION ?= "6.18.23"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index 3f5569220a..0b284494c3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.18.inc
 
-LINUX_VERSION ?= "6.18.22"
+LINUX_VERSION ?= "6.18.23"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "d479bdd7e63f27f13596d0008a10fac508d9eaba"
-SRCREV_meta ?= "d8f130c88c0f0944979672241b46b634b20b12f4"
+SRCREV_machine ?= "76bfd39e9965b26a81b6785c018c409195444f21"
+SRCREV_meta ?= "dcbc01fb2df5c72a789ab9506b9bc7a1078c3298"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 2f1a881aae..f034960b95 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "43553ba7e511af2175454d2629934737c09ca662"
-SRCREV_machine:qemuarm64 ?= "d479bdd7e63f27f13596d0008a10fac508d9eaba"
-SRCREV_machine:qemuloongarch64 ?= "d479bdd7e63f27f13596d0008a10fac508d9eaba"
+SRCREV_machine:qemuarm ?= "c45ea572f0138dcc0dbfec2375113517a7b61020"
+SRCREV_machine:qemuarm64 ?= "76bfd39e9965b26a81b6785c018c409195444f21"
+SRCREV_machine:qemuloongarch64 ?= "76bfd39e9965b26a81b6785c018c409195444f21"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "d479bdd7e63f27f13596d0008a10fac508d9eaba"
-SRCREV_machine:qemuriscv64 ?= "d479bdd7e63f27f13596d0008a10fac508d9eaba"
-SRCREV_machine:qemuriscv32 ?= "d479bdd7e63f27f13596d0008a10fac508d9eaba"
-SRCREV_machine:qemux86 ?= "d479bdd7e63f27f13596d0008a10fac508d9eaba"
-SRCREV_machine:qemux86-64 ?= "d479bdd7e63f27f13596d0008a10fac508d9eaba"
+SRCREV_machine:qemuppc ?= "76bfd39e9965b26a81b6785c018c409195444f21"
+SRCREV_machine:qemuriscv64 ?= "76bfd39e9965b26a81b6785c018c409195444f21"
+SRCREV_machine:qemuriscv32 ?= "76bfd39e9965b26a81b6785c018c409195444f21"
+SRCREV_machine:qemux86 ?= "76bfd39e9965b26a81b6785c018c409195444f21"
+SRCREV_machine:qemux86-64 ?= "76bfd39e9965b26a81b6785c018c409195444f21"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "d479bdd7e63f27f13596d0008a10fac508d9eaba"
-SRCREV_meta ?= "d8f130c88c0f0944979672241b46b634b20b12f4"
+SRCREV_machine ?= "76bfd39e9965b26a81b6785c018c409195444f21"
+SRCREV_meta ?= "dcbc01fb2df5c72a789ab9506b9bc7a1078c3298"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "f2b09e8b594ce61b8ff508ea1fb594b3b24ec6d3"
+SRCREV_machine:class-devupstream ?= "47a33eea6d5145d53e42315381ef28286c2218fb"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.18/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.18.22"
+LINUX_VERSION ?= "6.18.23"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


