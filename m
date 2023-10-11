Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAEEFCD98D3
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 00:01:56 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web10.5116.1696982515962251018
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 17:01:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=m9CIyL7j;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.181, mailfrom: steve@sakoman.com)
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-35742cbb670so3208525ab.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 17:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696982515; x=1697587315; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l3gzRt4UbO70kOyXw5f7k5WNLuBRsw7f241YgjJtFk0=;
        b=m9CIyL7jIKvx6rkoSTWhb8kI89kl1jG8xF/ox9hoVLEr5MctlJ66f80NGbJGMxTLdy
         RiG8Qyk8F6/Ybf0d7F86tk8bYdiLYVxGTtpw5Y2UoJmDX6OjReYpjLCb90/LHUktk4ib
         KxKGafLrhWZ/YbqzRWvnVwNoPGzP8tjGvh7cx1TTU/viz0ongRFtCcN6MrGVJREhOPZT
         py3zkAlXgv3nrsuHT4wOObfBz4dKUJ9X1vqdzuehILdFseOexEghEc0/Z1FvQe3TmRxb
         sI4GdWUWuduFXBzU1PoDgvsULyz4ddIj7oKLFaPii6AkzZ4ZuN+Q0J4iT1Sx3VhOdHI9
         ICgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696982515; x=1697587315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l3gzRt4UbO70kOyXw5f7k5WNLuBRsw7f241YgjJtFk0=;
        b=VjJ517wwL/LfeNUh8dUbvzTa6LP4Wy51gGXkzMmiAu90OmUfYFE2ymAuSMPY2p99mk
         nYzVcbXVs0/3vI31MebYg6KYP6nd5Wu/CXAP9z8gOz+UBQ6qU8WU7dPgItkAT9WlC4Kh
         /4g3SUDk12E/6cWUkwniaMGDGYAeVYlsjBQO+e2/V1+V8+VuwPMt4OMSSXN/Xr9RMNGG
         EYl0o6Rwd/pzGRUsgAAEYZARlTCYXTj6SUS8bZ9fX2zw6Z3RQiSQQn3Ob53VdRoESSSm
         cNk+a+VDnQbdD5T1sNK24Wpz2vFKFl++uSY04mpWQ0W9+8qP6wLAzq3vnxzFkluXv4SF
         0hZg==
X-Gm-Message-State: AOJu0YxNU3JSFFLgnnezEOyKIkqy1MrHiinQYYSswInZhfkCYmx/gVQC
	gFzc5/cJb5ZPQp8Y1AqPiPBz4d6I/ocIUzU2fpU=
X-Google-Smtp-Source: AGHT+IF4/cq6QvPtlRthF+Bo6nvNvpaop1ezKqW1fcmxlIMuzS4gRyNaY84cGopGB3pDGT3GEQLKLA==
X-Received: by 2002:a05:6e02:1bc7:b0:351:5d8f:d299 with SMTP id x7-20020a056e021bc700b003515d8fd299mr25897826ilv.7.1696982514831;
        Tue, 10 Oct 2023 17:01:54 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a9-20020a63bd09000000b005891f3af36asm10758222pgf.87.2023.10.10.17.01.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 17:01:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 04/20] linux-yocto/6.1: update to v6.1.52
Date: Tue, 10 Oct 2023 14:01:17 -1000
Message-Id: <3dc84243cfb11df1e483568093b2214d15f99e5d.1696982312.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696982312.git.steve@sakoman.com>
References: <cover.1696982312.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 00:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188922

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    59b13c2b647e Linux 6.1.52
    4a6284a2fc63 pinctrl: amd: Don't show `Invalid config param` errors
    7bec12fa9813 usb: typec: tcpci: clear the fault status bit
    4da07e958bfd nilfs2: fix WARNING in mark_buffer_dirty due to discarded buffer reuse
    fdbfc54d5399 nilfs2: fix general protection fault in nilfs_lookup_dirty_data_buffers()
    689561db6869 dt-bindings: sc16is7xx: Add property to change GPIO function
    dca7c9965141 tcpm: Avoid soft reset when partner does not support get_status
    a1fc0096921c fsi: master-ast-cf: Add MODULE_FIRMWARE macro
    b5c7bc370e03 firmware: stratix10-svc: Fix an NULL vs IS_ERR() bug in probe
    b7366429626e serial: sc16is7xx: fix bug when first setting GPIO direction
    682f9b944374 serial: sc16is7xx: fix broken port 0 uart init
    4b3de7d2f869 serial: qcom-geni: fix opp vote on shutdown
    1cd102aaedb2 wifi: mt76: mt7921: fix skb leak by txs missing in AMSDU
    74ceef6e6925 wifi: mt76: mt7921: do not support one stream on secondary antenna only
    179c65828593 Bluetooth: btsdio: fix use after free bug in btsdio_remove due to race condition
    86b818e2495d staging: rtl8712: fix race condition
    bd69537c1a2c HID: wacom: remove the battery when the EKR is off
    48729a1d2a7a usb: chipidea: imx: improve logic if samsung,picophy-* parameter is 0
    c564d4f91a0c usb: dwc3: meson-g12a: do post init to fix broken usb after resumption
    bfc4ccc0bcae ALSA: usb-audio: Fix init call orders for UAC1
    69d9330f2eff USB: serial: option: add FOXCONN T99W368/T99W373 product
    34f396f7abd0 USB: serial: option: add Quectel EM05G variant (0x030e)
    5d0fe30be4e2 modules: only allow symbol_get of EXPORT_SYMBOL_GPL modules
    36231e2c4ebd rtc: ds1685: use EXPORT_SYMBOL_GPL for ds1685_rtc_poweroff
    915219699da1 net: enetc: use EXPORT_SYMBOL_GPL for enetc_phc_index
    4dab89cccd8c mmc: au1xmmc: force non-modular build and remove symbol_get usage
    ac6fa0e04be0 ARM: pxa: remove use of symbol_get()
    cf859267e639 ksmbd: reduce descriptor size if remaining bytes is less than request size
    d070c4dd2a5b ksmbd: replace one-element array with flex-array member in struct smb2_ea_info
    30fd6521b2fb ksmbd: fix slub overflow in ksmbd_decode_ntlmssp_auth_blob()
    7d8855fd849d ksmbd: fix wrong DataOffset validation of create context
    1ce9ebc96eda erofs: ensure that the post-EOF tails are all zeroed

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9be500bb695d0c6f863397d2f4b17d505427001a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index a391e3b0e6..503732c1c6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ad7c05a03b8d70ee30ecce783a861cb96ea258cf"
-SRCREV_meta ?= "f845a7f37d7114230d6609e2bd630070f2f6cd9b"
+SRCREV_machine ?= "7327e7ab3b5508182380405a51f2657f5bf669b4"
+SRCREV_meta ?= "9e389e7f44a22bc637328f15e106f6d60631780e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.51"
+LINUX_VERSION ?= "6.1.52"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index e90e92ccbc..61175d5c6f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.51"
+LINUX_VERSION ?= "6.1.52"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "526b5bf2f74f881356bce8b44840dc86785fb7bf"
-SRCREV_meta ?= "f845a7f37d7114230d6609e2bd630070f2f6cd9b"
+SRCREV_machine ?= "b3879adf00e338e66e92431a434fa2549ac88b83"
+SRCREV_meta ?= "9e389e7f44a22bc637328f15e106f6d60631780e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index c55d411784..e95848ff76 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "8c81de99a4b9f69345873b06077f9d4e1321298e"
-SRCREV_machine:qemuarm64 ?= "526b5bf2f74f881356bce8b44840dc86785fb7bf"
-SRCREV_machine:qemuloongarch64 ?= "526b5bf2f74f881356bce8b44840dc86785fb7bf"
-SRCREV_machine:qemumips ?= "733cb5842aeac106f5606df4da7c64a180f0c500"
-SRCREV_machine:qemuppc ?= "526b5bf2f74f881356bce8b44840dc86785fb7bf"
-SRCREV_machine:qemuriscv64 ?= "526b5bf2f74f881356bce8b44840dc86785fb7bf"
-SRCREV_machine:qemuriscv32 ?= "526b5bf2f74f881356bce8b44840dc86785fb7bf"
-SRCREV_machine:qemux86 ?= "526b5bf2f74f881356bce8b44840dc86785fb7bf"
-SRCREV_machine:qemux86-64 ?= "526b5bf2f74f881356bce8b44840dc86785fb7bf"
-SRCREV_machine:qemumips64 ?= "1c11fe963667e9380725bef0650aeaea8544ea8b"
-SRCREV_machine ?= "526b5bf2f74f881356bce8b44840dc86785fb7bf"
-SRCREV_meta ?= "f845a7f37d7114230d6609e2bd630070f2f6cd9b"
+SRCREV_machine:qemuarm ?= "3028542fe5ece9dd32c8e3b9b14b2c9f4c9cafac"
+SRCREV_machine:qemuarm64 ?= "b3879adf00e338e66e92431a434fa2549ac88b83"
+SRCREV_machine:qemuloongarch64 ?= "b3879adf00e338e66e92431a434fa2549ac88b83"
+SRCREV_machine:qemumips ?= "33c0b5a0c1af6abb4dee11ffa5ece66ffd01d3c8"
+SRCREV_machine:qemuppc ?= "b3879adf00e338e66e92431a434fa2549ac88b83"
+SRCREV_machine:qemuriscv64 ?= "b3879adf00e338e66e92431a434fa2549ac88b83"
+SRCREV_machine:qemuriscv32 ?= "b3879adf00e338e66e92431a434fa2549ac88b83"
+SRCREV_machine:qemux86 ?= "b3879adf00e338e66e92431a434fa2549ac88b83"
+SRCREV_machine:qemux86-64 ?= "b3879adf00e338e66e92431a434fa2549ac88b83"
+SRCREV_machine:qemumips64 ?= "ee418f38dbc9794b7976ad11fd74f5a3490c7c5e"
+SRCREV_machine ?= "b3879adf00e338e66e92431a434fa2549ac88b83"
+SRCREV_meta ?= "9e389e7f44a22bc637328f15e106f6d60631780e"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "c2cbfe5f51227dfe6ef7be013f0d56a32c040faa"
+SRCREV_machine:class-devupstream ?= "59b13c2b647e464dd85622c89d7f16c15d681e96"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.51"
+LINUX_VERSION ?= "6.1.52"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.34.1


