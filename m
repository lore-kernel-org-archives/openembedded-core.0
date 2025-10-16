Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E82CCD185
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 03:14:45 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.4731.1760584477965995479
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 20:14:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X/HKhfB9;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-88f8f346c2cso32352185a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 20:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760584476; x=1761189276; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsOsa2F1hpFqPvHRuMhQXl0+xSlCx0VEaURKZA9pP/0=;
        b=X/HKhfB9BNtK2m2sKlq3JFcUzUfvh5GAL8AFuMdQbPguYYqIyQHqI9L/bxAcrob27Z
         Lox9zlA2yxHXH3BZhOrCQnno7n2kFznM7qh1jo9occK9L2atP9LcnKSaGFJwdKtA6GnL
         ZKOMYNpi6L+SQ4ZZ+ArhBQA+YaYFSDSTjhu5hr8EpIwviOhbTWfw8zn5dVLtszjIDkWB
         UyWU49aEWqyLGe6R4pO27vZI/VEVbtSYNg3dmKzktxZrHb8Gx7DJF2/jAbwnxDOG6HFa
         cJXVmyVFUWQlXeiUQpJcZeRGufaIBfEjikNv9arglsnH6fibO00TQ6ucelwOcqQ2JO+5
         vQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760584476; x=1761189276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dsOsa2F1hpFqPvHRuMhQXl0+xSlCx0VEaURKZA9pP/0=;
        b=QMnTW8mmTTq047cnwKJw8L+zoJDhG1hp64u9/YknTR4k7nJ687fwRbUv+mKf6NWiDZ
         Aq13hbZqQe2Zg4N0sWHIV/TYtyBYelTm2FdWcsORZQTDVOP/FgUPGIP2bwFEBp2BT716
         u+v+rIPeewb+MTrdCD5RBbRWGRWFW0nfOCjmXPX3SOP+pazdcf0PATQjCcBmz1k4J000
         JhGdcJtWjmbyZZimXoCz6nmAWaF1TyLOBnrxdsiMCqBqqnKWxCBXYChtaZknaYil4SST
         nx8/XV7HMff0uniyLRSzPY4yzEaHcp6m9REgALut/sF4zO36B8JUUeWF3pH+QbD73/GL
         YI3Q==
X-Gm-Message-State: AOJu0YxMuB/J3BDAvZhKhivQSuJmBrlINoe+/+oomXpYETpgHsT67MUT
	fwQy4utqx8F2zUyMIDwngERjCd3dDfUmq22aN5k59JrkYs4ivUypTPwAzb6SzT8Nt/E=
X-Gm-Gg: ASbGncv5/FB3+05IHqupciyH2/deTWILHNQJmacVVEwJkcQhdYK6LqoG6ziYHK8sHHN
	7T+7BJoDylOnO2ZHce43K45xsy6wXtrQOGYCCIR8GkC9XxbXM4KtwBo/cO0rDgCFna5x0u5QtM8
	KL/BRimKpa1OfQ/Y8MxVXqfZRk6pI4bpfTPZj9SNteSYoTMg5thA37xtRq/vuw1GSDJRxhHobGT
	AAYT2OFE8I0E8OPcmMfklvPKnxlvEgj+F6DeWIvp7C6fSlr14pkk2MejWXguGvcRkeMSMl9GUwu
	8MRT5G2yoCjrI1F5nuiF12J6ws3mv9gSja0+TJp/dlQoqqp4xILala7mGhCO3iW7rZ9zSMzSyQX
	3MTQAUAmjih80kAhTA77fvdD/Qt2XEXsEqOJLQC6q9/YfNBoKv0wepAnVQgHBHR+3NYgs3wKFXY
	wOm/eSx4wkeTG0De9Pi5rO79fZnpoA6dK4PapkuInPjemvqbUgMpbqX2rVy2vr/gZlNK6zDpV9B
	6Jc
X-Google-Smtp-Source: AGHT+IGHCPCija2UZC2MVDlaffgeJxi89Yj/LZ0Q3scNWlHn6powzRbDKD/MPimGONumdfKy0tmVZw==
X-Received: by 2002:a05:620a:318c:b0:85f:ffc2:b621 with SMTP id af79cd13be357-883527b6b1cmr3831857585a.56.1760584476039;
        Wed, 15 Oct 2025 20:14:36 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-88f37f45149sm109327085a.32.2025.10.15.20.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 20:14:34 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com
Subject: [OE-core][scarthgap 10/12] linux-yocto/6.6: update to v6.6.109
Date: Wed, 15 Oct 2025 23:14:19 -0400
Message-Id: <20251016031421.3207596-10-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20251016031421.3207596-1-bruce.ashfield@gmail.com>
References: <20251016031421.3207596-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 03:14:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224936

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
2.39.2


