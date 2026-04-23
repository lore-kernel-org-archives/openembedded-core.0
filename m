Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCFADFC0366
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:42:02 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.687.1776958914240749482
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 08:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=e2GBxJBx;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8eb5ad01402so509649085a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 08:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776958913; x=1777563713; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSfl/VdLg21hsSLQ1ANPzQz6yVS1nNRk2meN6ziVUU0=;
        b=e2GBxJBxIL3GVa2IrtUNHR74TrOYpUaWTu9mD4yDyMcazqdFd+wcqZOaXg0mQ+m/xm
         e+EdcuLkLXcJQfQxq0ylnxTlzb7zxg3BV63A8cTqEbBzSxgycf/1fFjLj5QxnbazOdXg
         iSdvX1S9Jn4CtbJTjk/oC7ttrDDOOP91vfHXOvMwWG9o+yNG1C3bmh2annzw24KokWik
         nmP/IMfxfiywpQc2L5/Fm4rsVk/uCVHse5qW+Qd16JyEOHutH52/pRbRA/uwh7hXEAaA
         6V1gQDdZ4XMX7V+RZia38XW0I7U+qS5OlYE0/27bW8Y5/Wz/craxp1uToKtbbPh6Cu92
         Bv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776958913; x=1777563713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qSfl/VdLg21hsSLQ1ANPzQz6yVS1nNRk2meN6ziVUU0=;
        b=SuIg6df2Z4njZDtblziYTVeWpwvk40mkjoD2y9nSSprn4k5yrGnOsozk82yEkDACx4
         TDOoYAjI9zDUEzESSH4ZeKACJDYe4XEBnRMtgDAg4Kr2mLF1JVwo4M9Xi6lndOG/GLEo
         EQ7SkNU6sT7mbYc2mpDQQxRbHESshvUSe+7RUR8up68Zhkp6+PMRMhSblTmqvuZgftP/
         PbrdTHOssH5cRSy4xeq3VoGYwy58l3SDU/5UgUsgioq9iKub/c646f2D0XNsLGJay56E
         eXYuL8uCfrdEhe+KQi3IWMqVDAglR5vazXHXJWMwlkxSkuSFfab5O92hROvH0VJdFuEP
         8WZw==
X-Gm-Message-State: AOJu0YzG/XteiL0oVs8OAZ8RvWqE0IbfnGCbeZbr+Lyg1qYpsihjC0Tp
	PYvy5wsbK/j9z3IZgfvgpN0oUHue6KScxUwZJ7mzrD/EXJTO4c9O6DLD
X-Gm-Gg: AeBDies6Gr9kSw+en4/D/AhFQocWD6TcgZbHsYs4nVmjyP+mhf1Nl32cwKRgRihhdpn
	2wZ6hia7RSkUXPJPTSotKL1kkVxsgbR9UibMXbNtTS79sikl+lJHFfBeNtsZErPFGnDgM+R2eyl
	T2Aa6CaTkTXW+m5Fm/CXkUs0vM+pG0Bo2FsooIrYfS6sZSucmx0DdPUtfonMVwZOiDHzDexD3tw
	LHjaKabc5K1bS7jC1HtScqo3MxWZLUM2mDWt6JB2iCHXVaWjikIkKUoAaFRVz5LB+yOWs+Eeibg
	GuWiNc9PQIo5PuHB5XDfOHO9Ns+dapaKUkEy1LzUWvQKoIL8+w7TW3xXLLXsbaaZDpN4KkvkU2I
	sopPMBpA+y16+ZZjGXxHBbnyW+tZbT0gV3pW03KAF7vn6MZnAWXkyDjyo68VlM66Ogw6Rryao+l
	jKp3VSniI92k8zU1Zk0MuEXj2gT/ve0dL8Sm+9MjV7MSlaokEHVnvUCtjqZennuLR56CLtwiug7
	kJpI27y9qooHa2bFhH3tJs1Kfdl8eiJ/M5d4nICd7gdqPKgO2f6PqVAAz5u0jlHK9vg1g==
X-Received: by 2002:a05:620a:319c:b0:8ee:18e7:9406 with SMTP id af79cd13be357-8ee18f6e17amr1996048085a.29.1776958913054;
        Thu, 23 Apr 2026 08:41:53 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d69abee3sm1602139585a.17.2026.04.23.08.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:41:51 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][scarthgap][PATCH 02/08] linux-yocto/6.6: update to v6.6.126
Date: Thu, 23 Apr 2026 11:41:43 -0400
Message-ID: <20260423154149.1933049-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423154149.1933049-1-bruce.ashfield@gmail.com>
References: <20260423154149.1933049-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 15:42:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235793

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    56865d9b7074c Linux 6.6.126
    673dafb9a8634 Revert "driver core: enforce device_lock for driver_match_device()"
    ae462074fde3b Linux 6.6.125
    1c04c3a4de8d4 gpio: omap: do not register driver in probe()
    455e882192c98 mptcp: fix race in mptcp_pm_nl_flush_addrs_doit()
    2b890bc3a5774 selftests: mptcp: pm: ensure unknown flags are ignored
    8df235f768cea spi: cadence-quadspi: Implement refcount to handle unbind during busy
    665e570600733 vsock/test: verify socket options after setting them
    a9e757473561d netfilter: nft_set_pipapo: prevent overflow in lookup table allocation
    1c4f72fa96993 netfilter: nf_tables: missing objects with no memcg accounting
    30405b23b4d5e nfsd: don't ignore the return code of svc_proc_register()
    57770faaff8ee net: sfp: Fix quirk for Ubiquiti U-Fiber Instant SFP module
    dccf7bc011d0e scsi: qla2xxx: Query FW again before proceeding with login
    aed16d37696f4 scsi: qla2xxx: Free sp in error path to fix system crash
    528b2f1027edf scsi: qla2xxx: Delay module unload while fabric scan in progress
    ccbfcaa4b88e5 scsi: qla2xxx: Allow recovery for tape devices
    949010291bb94 scsi: qla2xxx: Validate sp before freeing associated memory
    71dee092903ad wifi: rtw88: Fix alignment fault in rtw_core_enable_beacon()
    df1e20796c9f3 nilfs2: Fix potential block overflow that cause system hang
    dd1f6c9206385 crypto: virtio - Remove duplicated virtqueue_kick in virtio_crypto_skcipher_crypt_req
    d6f0d58680868 crypto: virtio - Add spinlock protection with virtqueue notification
    6edf8df4bd29f crypto: omap - Allocate OMAP_CRYPTO_FORCE_COPY scatterlists correctly
    7dbeeafcb6e50 crypto: octeontx - Fix length check to avoid truncation in ucode_load_store
    6dda9f0699054 Bluetooth: btusb: Add USB ID 7392:e611 for Edimax EW-7611UXB
    adc1796eced46 driver core: enforce device_lock for driver_match_device()
    787769c8cc504 smb: server: fix leak of active_num_conn in ksmbd_tcp_new_connection()
    5accdc5b7f28a ksmbd: fix infinite loop caused by next_smb2_rcv_hdr_off reset in error paths
    4386f6af8aaed smb: client: split cached_fid bitfields to avoid shared-byte RMW races

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 3c28f96906..e5f3c9b6cb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a32dc01f5dbce65781e06a973624a2c3572fa7cd"
-SRCREV_meta ?= "307ef96123620278563ff5b1c9fb8b7b4da26970"
+SRCREV_machine ?= "aaa3191196fccd0d26d55a88dcc2396ce79cfc21"
+SRCREV_meta ?= "17b54189a09494c54960a80a479098010e428f81"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.124"
+LINUX_VERSION ?= "6.6.126"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 08c176a698..56b3e52003 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.124"
+LINUX_VERSION ?= "6.6.126"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "a00c570459f5486c036aefc93ab323efa8c7e645"
-SRCREV_meta ?= "307ef96123620278563ff5b1c9fb8b7b4da26970"
+SRCREV_machine ?= "3a9d8ba770fff7d27a4d2607644d9d6925329e73"
+SRCREV_meta ?= "17b54189a09494c54960a80a479098010e428f81"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 565022a615..b4d9452b80 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "225cb65775de5e687da708da8f126bf94a426c54"
-SRCREV_machine:qemuarm64 ?= "632fdc720fa54154453715becbbf57793363b62d"
-SRCREV_machine:qemuloongarch64 ?= "6e00181d086766512ef48806d649d032c479566d"
-SRCREV_machine:qemumips ?= "083f8e7fb7cacf7167aaf41b6366dc63b0b42b9a"
-SRCREV_machine:qemuppc ?= "0149565b9e2219e923ba0eebc4f7c60661778453"
-SRCREV_machine:qemuriscv64 ?= "6e00181d086766512ef48806d649d032c479566d"
-SRCREV_machine:qemuriscv32 ?= "6e00181d086766512ef48806d649d032c479566d"
-SRCREV_machine:qemux86 ?= "6e00181d086766512ef48806d649d032c479566d"
-SRCREV_machine:qemux86-64 ?= "6e00181d086766512ef48806d649d032c479566d"
-SRCREV_machine:qemumips64 ?= "3f1d938eafffaadd2fa9d9bc83446c90d8f36093"
-SRCREV_machine ?= "6e00181d086766512ef48806d649d032c479566d"
-SRCREV_meta ?= "307ef96123620278563ff5b1c9fb8b7b4da26970"
+SRCREV_machine:qemuarm ?= "746f0ca46b4fdd56ba711cf7b49b9a71d4f64acf"
+SRCREV_machine:qemuarm64 ?= "9da440425610b9335df95d76dfa2a56ea4e492eb"
+SRCREV_machine:qemuloongarch64 ?= "c6bff8c03457825a34929284be97de7fd99f0c83"
+SRCREV_machine:qemumips ?= "208bd32390022fec5948b1808e6d9ea83d88d9bd"
+SRCREV_machine:qemuppc ?= "9645b14ebe59396b0d1035c5f96ac74ae483f4c7"
+SRCREV_machine:qemuriscv64 ?= "c6bff8c03457825a34929284be97de7fd99f0c83"
+SRCREV_machine:qemuriscv32 ?= "c6bff8c03457825a34929284be97de7fd99f0c83"
+SRCREV_machine:qemux86 ?= "c6bff8c03457825a34929284be97de7fd99f0c83"
+SRCREV_machine:qemux86-64 ?= "c6bff8c03457825a34929284be97de7fd99f0c83"
+SRCREV_machine:qemumips64 ?= "b7972053efd2ad49abf9a0637dfa2b4b1bdff8a4"
+SRCREV_machine ?= "c6bff8c03457825a34929284be97de7fd99f0c83"
+SRCREV_meta ?= "17b54189a09494c54960a80a479098010e428f81"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "1b4ef5214f17e671cc13f2da4a678574ce91d151"
+SRCREV_machine:class-devupstream ?= "56865d9b7074c08d8191bc721b1e46baa650d9cd"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.124"
+LINUX_VERSION ?= "6.6.126"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


