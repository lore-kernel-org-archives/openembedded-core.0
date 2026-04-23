Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4570FC0359
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:32:51 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.403.1776958364803880486
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 08:32:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NzSez5lA;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-899a9f445cbso80692306d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 08:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776958364; x=1777563164; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkNbspmw5osk5lPI7AJieMr+RENpTmFCd/OjNvhyjZk=;
        b=NzSez5lAcjod9tYwnQ4PARlRu8j0sJwtQpb4QFSokya5nY5gz/jYBsXLB4iONbTKpt
         IuQERRu1J4uLsJhiu9rzCFs0vxWp1LazJXOd6UnlzbMaHxkbetgpE4pPTFMKp0FdaI1a
         RWUjIHroKiIF14N58lAJOxQo91thh2VmTp1s01PW4gGxvOUimuQJ33MUwwHoejIKOi0r
         O8+/VimTmHJB8ZSN0P+gDXtUkjn0CcSqVyV53ngCr2CNoJdZ1YqjP7odVmyXXPPwm0yA
         dDHdf+bT8+o6dBXupCKF7hOkyLYiTFus9jvcT85oTX7Qw7cFOim2JWdcbBSarpepZuvF
         Rh2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776958364; x=1777563164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qkNbspmw5osk5lPI7AJieMr+RENpTmFCd/OjNvhyjZk=;
        b=Emd687w4sxZ6fa7MxdXfnADaz9eP0A5kjY42arix2JM3xXEti8mk2J7RiohzAWSSM/
         PJ+VoWtrXg3POyzL/HD2n115VkkswyXfzRJRxk5tPupJpz8EkdRpZlJIJ4oDCTYTY3d7
         QCvPrclTcEF6vBM/+a/Sa5vR8lrf+8WFZvUBmUKLABwkvkOzx2JH89c/sMvWz7dGPQqL
         3iWL/NO1JxM9GSRjMkplZhCtfHA6n9eVCcdjM1EHosHN4m+GKpQOZYVYZ6h+Phrz25SQ
         PZpEmGRjATQrq85TgSEgJLy2yUwVXTj6jIZrMEH8cKKQFfiTS1/bHwltMaRdwzCMvOK9
         1yLQ==
X-Gm-Message-State: AOJu0Yxat67pIfCQgeYhKzRQ0/l6YVg4Lc2ypFASBqNKtyWlc/LotAgk
	2PzbuZ5ZpQR7bIxS+QQOm9mRrV6SxutbBhfwHAKDQf7aXbkLiIVrRDGxPZ9YOrfY
X-Gm-Gg: AeBDievNrHUFXUuaHIdOoYhLFMsma/fWxIlYSwhbCLHTdUi/16qhUnLWkvImf7Uyjpv
	4b6+A99erkKQp+GmAlbe1nzKNOrwoyzjoiNNzLbUOK+rYqsj/gvNYPGEug8/AknzWNiGqATMKe7
	uzmerUQZKw4EIDl38qpk97D7dv44tS7cSVkOJ0nXPpNIdLrBNUqHuHhF1LWLwdd7mrsBDsonKFO
	5t/tZMXScZyTj1K8s/c9444UOHDzkoboXkx0MUopoHKo3sEmCCal12N3SWbT05US2LmtMElKev7
	9rsToqQ2MVGNnnvtzUjY22JxX7iIrAQFJH2WxX27uggZduAYRwpAyFM41M5M70wYaRfMLbtFVie
	z1E2la1OlhlynB5rzMGPNZL/wvk7sN+NkEqhwhN+ATmc5Uy7pDWZmEPhRBoE9WBhJBCA7uaKLXr
	VbtASC8FS5gRUt4emp27GVBllKltt6c4ryP53agcoSophmasln+Ux3kFrJiYwXNcMxsZtUzIdH4
	RrdCBID5Rb77SqvhjG3udKXqJaEnA6qjBI6Q61C2NV1DHlAmuS4qfFA+Tj4oeQyULdnUQ==
X-Received: by 2002:a05:6214:f03:b0:8ac:a546:7753 with SMTP id 6a1803df08f44-8b027ffbc6emr443179716d6.8.1776958363602;
        Thu, 23 Apr 2026 08:32:43 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac429ffsm160765996d6.2.2026.04.23.08.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:32:42 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta-yocto-bsp][PATCH 14/15] yocto-bsps: update to v6.18.23
Date: Thu, 23 Apr 2026 11:32:21 -0400
Message-ID: <20260423153222.1932256-15-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423153222.1932256-1-bruce.ashfield@gmail.com>
References: <20260423153222.1932256-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 15:32:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235789

From: Bruce Ashfield <bruce.ashfield@gmail.com>

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
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
index 4fc8c85..b1d265a 100644
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
@@ -8,4 +8,4 @@ KMACHINE:genericx86 ?= "common-pc"
 KMACHINE:genericx86-64 ?= "common-pc-64"
 
 KBRANCH:genericarm64 ?= "v6.18/standard/genericarm64"
-SRCREV_machine:genericarm64 ?= "26b6ffb0e21a6dbd32de890f070ec9e15b4eff31"
+SRCREV_machine:genericarm64 ?= "3875f920c45a973fa027f39c77c2904ac8ba1042"
-- 
2.43.0


