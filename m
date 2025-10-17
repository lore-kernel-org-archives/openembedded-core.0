Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE6E3CCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 20:40:13 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.3222.1760733605608677435
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 13:40:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=kCgEv08S;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-78af743c232so2088591b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 13:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760733605; x=1761338405; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aVZOaSqilOzcmx5L5qTG1tSExf2vJc9yHZnak60xHgs=;
        b=kCgEv08SnDXCNHJ/i05H/9eDMwHEtcoA1P/0Vwj2555l/wAOa0L0NKd7UNbdVDrGiF
         RUr0JsQa5O3BuBtrnRuUiDpK++RA+b12SU2DVX/0YapqxJp4taw97/hgPBcBU7ehXJ9n
         Y5Drp5Zq/FD4BklaeASBb0BHqlS/CF3EkzGoABpQrGhomxR8K32txUO3ws/BoTrGc5KA
         78Wcwao4u7847g67WaPuRCgJKFvo6bhDZhMB/8tdjyprhMfTND2quJMQBJxZ5OlEcgA9
         8fM8n8W7JkQWAcX1aeYNAj2YYQ0UnJ0Rv5MFHnXqI+w83I7Qdl2ONwR5D5fH+dDY7aJj
         nfBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733605; x=1761338405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aVZOaSqilOzcmx5L5qTG1tSExf2vJc9yHZnak60xHgs=;
        b=NwOk76ugNd29EYqFGrvoYatRI+WdKFvv+wTyCpFgAskwmxphGWOf4amHDAYwDOM6SM
         EBWetN9H7YaOVe3JkAIO3qvCVeYCLrtRFro7bmsGtFH6tFvqJe/9815899E7HP8UxMgi
         st7sv9MlZ6M+sI/7nUMybZCvo1fYMFbRxZf1wF1XfwpjxHvY2nWOxJajXnirZvoNeBW4
         3rH2Tur6TaaF+bWgcNl61aOwWRN9dFGuVeAf5P0QcA4PDRBU0fAh05Dpc0XWuNW88wWl
         oZWlw+Z/9NPqxcfj0nw6SwxDCKlckHCj6kLMCp4zumfmV79vOdOwKPLoxOAdsq5oVtYN
         7zMA==
X-Gm-Message-State: AOJu0YyKCp5Esu/ccTn8xaxjRZcS8TTW8mtldrCABwiS4VgT0q8+Yy3+
	2+INBiF5hSCefSt9+5gH367lnXSbozSTfv8LNFkijE+RSE0o82TK6Kq/fK464YzbFJR3Wz3LRut
	6iW3TwmA=
X-Gm-Gg: ASbGncvLldFvu5OQNE+TZrQTVLRTnnIWZYjxqKnFkzcyZcrKDvdPQpU0loXTCS1Gh8j
	8wLPk4a5Jf87RrH9CC2kwQJ26nkNh2mdlexoN6CGUJj052LAQWhotAGLdmYIVHAt6fMuh+mx2jK
	WJ0fuOHNi6MEalLBrxH/6vkYsZbNq98f3wpwWX+eEowdJzzC622NQpIClSEfs5clCbAbiH7NVA8
	ejamscZkVi5s2tUFsUyB/JlDqvJGF8aBrH+DeNP2wFBxNZmkRasIVAgxz7mPB3d1uIOTwl6q+yD
	7CQBsYS+1ILDopT4ctd1iE2s8GhmWVDh/0ogyY9nWFM7Ln1DFrRe00f26eZAmjeXK/v+2+XSErV
	w7VpJGCEV9ztEwTdJTeXyYhAhSdufHG1RTaLRQfgrhjBPHaCDjZmg8EYRwhlTcf+PBA==
X-Google-Smtp-Source: AGHT+IFxiM92/BLrgcwOrGc+2b80MxLFrB9V/nZxg0GKiDet+yhjTMO8wigZCgJ0DtsAdjA7v91brQ==
X-Received: by 2002:a05:6a20:72a0:b0:2d5:264c:e494 with SMTP id adf61e73a8af0-334a863acacmr7024588637.56.1760733604683;
        Fri, 17 Oct 2025 13:40:04 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:aaee:e640:34cd:6f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f254esm477061b3a.45.2025.10.17.13.40.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:40:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 21/26] linux-yocto/6.6: update to v6.6.109
Date: Fri, 17 Oct 2025 13:39:04 -0700
Message-ID: <5234d795417f97cfce7bcd891e7bdeabc6f36e9e.1760733431.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760733431.git.steve@sakoman.com>
References: <cover.1760733431.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 20:40:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225055

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    f34f16e5c6323 Linux 6.6.109
    eb53056323f13 drm/i915/backlight: Return immediately when scale() finds invalid parameters
    4529bb0b6be3d minmax.h: remove some #defines that are only expanded once
    1a899044a0f5a minmax.h: simplify the variants of clamp()
    9955044f552b5 minmax.h: move all the clamp() definitions after the min/max() ones
    26c3d697becf3 minmax.h: use BUILD_BUG_ON_MSG() for the lo < hi test in clamp()
    511e7d2e4d51f minmax.h: reduce the #define expansion of min(), max() and clamp()
    85d619594313e minmax.h: update some comments
    6012f69bf7495 minmax.h: add whitespace around operators and after commas
    46648b94e6ebb minmax: fix up min3() and max3() too
    f0be4c5dc213d minmax: improve macro expansion and type checking
    7194a302345da minmax: don't use max() in situations that want a C constant expression
    bb63c996c2db0 minmax: simplify min()/max()/clamp() implementation
    6183c6579356a minmax: make generic MIN() and MAX() macros available everywhere
    c0c83f4cd074b i40e: add validation for ring_len param
    6e4251690710d i40e: increase max descriptors for XL710
    7ea47a560a7a3 drm/ast: Use msleep instead of mdelay for edid read
    ed6fa21f68973 gpiolib: Extend software-node support to support secondary software-nodes
    457d2c5e112fd loop: Avoid updating block size under exclusive owner
    78f579cb7d825 mm/migrate_device: don't add folio to be freed to LRU in migrate_device_finalize()
    e7a85efb873fa mm: migrate_device: use more folio in migrate_device_finalize()
    684a9a995748c ARM: bcm: Select ARM_GIC_V3 for ARCH_BRCMSTB
    53888cd32a3f6 s390/cpum_cf: Fix uninitialized warning after backport of ce971233242b
    09e3bda3a7ba2 fbcon: Fix OOB access in font allocation
    adac90bb1aaf4 fbcon: fix integer overflow in fbcon_do_set_font
    c9c2a51f91aea mm/hugetlb: fix folio is still mapped when deleted
    df1fa034c0fc2 kmsan: fix out-of-bounds access to shadow memory
    cab278cead49a afs: Fix potential null pointer dereference in afs_put_server
    58d304a89178d ARM: dts: socfpga: sodia: Fix mdio bus probe and PHY address
    3887f3814c0e7 tracing: dynevent: Add a missing lockdown check on dynevent
    8703940bd30b5 crypto: af_alg - Fix incorrect boolean values in af_alg_ctx
    b769490521cf9 i40e: improve VF MAC filters accounting
    b247cdd04750e i40e: add mask to apply valid bits for itr_idx
    edecce7abd715 i40e: add max boundary check for VF filters
    e748f1ee493f8 i40e: fix validation of VF state in get resources
    3883e9702b6a4 i40e: fix input validation logic for action_meta
    2cc26dac0518d i40e: fix idx validation in config queues msg
    50a1e2f50f6c2 i40e: fix idx validation in i40e_validate_queue_map
    3cefd898b7aa1 HID: asus: add support for missing PX series fn keys
    ba7bcfd52c66d smb: client: fix wrong index reference in smb2_compound_op()
    348736955ed6c futex: Prevent use-after-free during requeue-PI
    6ffa6b5bc861a drm/gma500: Fix null dereference in hdmi teardown
    df2c071061ed5 octeontx2-pf: Fix potential use after free in otx2_tc_add_flow()
    7b209698e648b net: dsa: lantiq_gswip: suppress -EINVAL errors for bridge FDB entries added to the CPU port
    816d30afbad52 net: dsa: lantiq_gswip: move gswip_add_single_port_br() call to port_setup()
    a7a2b29c1ee44 net: dsa: lantiq_gswip: do also enable or disable cpu port
    be0bd592298f8 selftests: fib_nexthops: Fix creation of non-FDB nexthops
    24046d31f6f92 nexthop: Forbid FDB status change while nexthop is in a group
    31ae2fbc9fcb9 net: allow alloc_skb_with_frags() to use MAX_SKB_FRAGS
    98a76bd96f382 bnxt_en: correct offset handling for IPv6 destination address
    82a1463c968b1 vhost: Take a reference on the task in struct vhost_task.
    bcce99f613163 Bluetooth: hci_event: Fix UAF in hci_acl_create_conn_sync
    6a0070c5c3ad3 Bluetooth: hci_sync: Fix hci_resume_advertising_sync
    c957284701353 ethernet: rvu-af: Remove slash from the driver name
    17edec1830e48 can: peak_usb: fix shift-out-of-bounds issue
    3664ae91b26d1 can: mcba_usb: populate ndo_change_mtu() to prevent buffer overflow
    2e423e1990f39 can: sun4i_can: populate ndo_change_mtu() to prevent buffer overflow
    be1b25005fd0f can: hi311x: populate ndo_change_mtu() to prevent buffer overflow
    cbc1de71766f3 can: etas_es58x: populate ndo_change_mtu() to prevent buffer overflow
    0baf92d0b1590 xfrm: xfrm_alloc_spi shouldn't use 0 as SPI
    f64abeebf763c bpf: Reject bpf_timer for PREEMPT_RT
    865eec09b6e44 can: rcar_can: rcar_can_resume(): fix s2ram with PSCI
    210b91bfe355b wifi: virt_wifi: Fix page fault on connect
    c5be7edd42602 smb: server: don't use delayed_work for post_recv_credits_work
    6017196aabf1d cpufreq: Initialize cpufreq-based invariance before subsys
    35bb271de241d ARM: dts: kirkwood: Fix sound DAI cells for OpenRD clients
    ebe7a2e46d189 arm64: dts: imx8mp: Correct thermal sensor index
    1744aff07b833 mm: folio_may_be_lru_cached() unless folio_test_large()
    d37ec803b2813 mm/gup: local lru_add_drain() to avoid lru_add_drain_all()
    768c44cc8b638 mm/gup: check ref_count instead of lru before migration
    dc58ab1eb90c9 mm: add folio_expected_ref_count() for reference count calculation
    4ed203f79821c mm/gup: revert "mm: gup: fix infinite loop within __get_longterm_locked"
    df2580fbcedea IB/mlx5: Fix obj_type mismatch for SRQ event subscriptions
    943754ad81131 ALSA: usb-audio: Add mute TLV for playback volumes on more devices
    0aac2fa4d0c75 ALSA: usb-audio: move mixer_quirks' min_mute into common quirk
    ea6016c9ec61d ALSA: usb-audio: Add DSD support for Comtrue USB Audio device
    b61b90b07416f i2c: designware: Add quirk for Intel Xe
    41ea28a2de255 mmc: sdhci-cadence: add Mobileye eyeQ support
    306697a775fbc usb: core: Add 0x prefix to quirks debug output
    dc77154e83048 ALSA: usb-audio: Fix build with CONFIG_INPUT=n
    a3961b1f7f79e ALSA: usb-audio: Convert comma to semicolon
    d04d301614630 ALSA: usb-audio: Add mixer quirk for Sony DualSense PS5
    8fa69bd18148e ALSA: usb-audio: Remove unneeded wmb() in mixer_quirks
    9db2614986bd0 ALSA: usb-audio: Simplify NULL comparison in mixer_quirks
    e8c605fece5b9 ALSA: usb-audio: Avoid multiple assignments in mixer_quirks
    bafc648b82c3b ALSA: usb-audio: Drop unnecessary parentheses in mixer_quirks
    08a96e22bd37f ALSA: usb-audio: Fix block comments in mixer_quirks
    18f9e77de5272 firewire: core: fix overlooked update of subsystem ABI version
    ca3e48e96816c scsi: ufs: mcq: Fix memory allocation checks for SQE and CQE

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 591d7cfc06..c701c29ae1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "d26df76e222469eab0636af87da4c3c34a2c0b88"
-SRCREV_meta ?= "a904e672202ae6aefec7b1600df13c15734148f8"
+SRCREV_machine ?= "3162ade8ac9717b63836229e42b2a9ab9f58201e"
+SRCREV_meta ?= "aef3b17fc578bf09fc3b27e4eb45a7ce7a1b39d8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.108"
+LINUX_VERSION ?= "6.6.109"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index b32ae704f7..1f9d249a3b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.108"
+LINUX_VERSION ?= "6.6.109"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "9b27fa4c1b3ed0ded5a407913711813a1fd829c5"
-SRCREV_meta ?= "a904e672202ae6aefec7b1600df13c15734148f8"
+SRCREV_machine ?= "b481c2fca6f1528d9bfe55daffb89d380e941335"
+SRCREV_meta ?= "aef3b17fc578bf09fc3b27e4eb45a7ce7a1b39d8"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 438bb6d56d..1660e065f3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "5e91abaa4811127504cb00853c6af078c56d90ba"
-SRCREV_machine:qemuarm64 ?= "6feefe0cbcfe7ca19e79301278220825e80596c9"
-SRCREV_machine:qemuloongarch64 ?= "cc50e1696b84b0a12b9721d407ff5945f632fade"
-SRCREV_machine:qemumips ?= "dd5b5367adaee59e606630182f14b424bb33cabf"
-SRCREV_machine:qemuppc ?= "ed23e394ef890bca72748a35fad57aa96f73fb85"
-SRCREV_machine:qemuriscv64 ?= "cc50e1696b84b0a12b9721d407ff5945f632fade"
-SRCREV_machine:qemuriscv32 ?= "cc50e1696b84b0a12b9721d407ff5945f632fade"
-SRCREV_machine:qemux86 ?= "cc50e1696b84b0a12b9721d407ff5945f632fade"
-SRCREV_machine:qemux86-64 ?= "cc50e1696b84b0a12b9721d407ff5945f632fade"
-SRCREV_machine:qemumips64 ?= "1bf580ad5f980683abed6fcef876b01da50d81fa"
-SRCREV_machine ?= "cc50e1696b84b0a12b9721d407ff5945f632fade"
-SRCREV_meta ?= "a904e672202ae6aefec7b1600df13c15734148f8"
+SRCREV_machine:qemuarm ?= "d51aeddc46e2565930c596b0dd68b510c4ae56b9"
+SRCREV_machine:qemuarm64 ?= "b551efd543db7dff08c01c87822fa9c02c03c9eb"
+SRCREV_machine:qemuloongarch64 ?= "b6cb3303de9f505773ec65defd0437d2d13d270f"
+SRCREV_machine:qemumips ?= "7c4a971ad6360845687a90f1d07e22f4f1b8c3c9"
+SRCREV_machine:qemuppc ?= "61f111b7d27c1153f299945a00cf263f4e289706"
+SRCREV_machine:qemuriscv64 ?= "b6cb3303de9f505773ec65defd0437d2d13d270f"
+SRCREV_machine:qemuriscv32 ?= "b6cb3303de9f505773ec65defd0437d2d13d270f"
+SRCREV_machine:qemux86 ?= "b6cb3303de9f505773ec65defd0437d2d13d270f"
+SRCREV_machine:qemux86-64 ?= "b6cb3303de9f505773ec65defd0437d2d13d270f"
+SRCREV_machine:qemumips64 ?= "2cbe3d7e9f728945185446f19b06aa785ec0d2ff"
+SRCREV_machine ?= "b6cb3303de9f505773ec65defd0437d2d13d270f"
+SRCREV_meta ?= "aef3b17fc578bf09fc3b27e4eb45a7ce7a1b39d8"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "147338df34870c0248133d7a986b1fab025ec56a"
+SRCREV_machine:class-devupstream ?= "f34f16e5c63232cfd9bfeb722e0878e209caa9ce"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.108"
+LINUX_VERSION ?= "6.6.109"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


