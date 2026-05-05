Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D43A6CD3443
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 16:59:03 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1051.1778000334339702328
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 09:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=a060TFMK;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so52770795e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 09:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778000332; x=1778605132; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q7amqsf0Z4rOSbEBde/zrvE9kWygpRB8rhh9ZsJacaE=;
        b=a060TFMKqkzMDUnfJxoKPhNH4pHrTH5Kpc0fMX+ulC1QfIjTaUS21F7kzidkbbDC/L
         u9lHXLoW3ljKYQqDngejb/YJnzoOEQFM4lFvBBQgtJkpikAOIkx+QDfhKDuSsgonMA5V
         VGxeQVAztJNQFtiO/38JS7F2BaAIuiZZhGj1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778000332; x=1778605132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q7amqsf0Z4rOSbEBde/zrvE9kWygpRB8rhh9ZsJacaE=;
        b=tHXv0Cv1twG/XmHWBivm4r08on6WaJvttxzlfxH7qD9LXbDne4n7+gdKTRvDcbn5iO
         aVDtYlHKNMN4EawrhUd2e6UqM5TO8hupQMV3rjCv3xNubgwNs1Od9euS4EsuKnjHeZcj
         8oSbUDVV4Kgr0s8DtmzJUGwPcBXNwxLwnuRfhEVv1RqTmIYo3UKYshbb3r880ef5rYvo
         0nOoSNuSNduHTGALNagkynAt5t6fYh25ien22ox+4W4sYIsERq0RgL1QhHI02cO6Rf7i
         sT62Cxj7C386wZE3DIzbtAzID+39Tnah81CCy7DVbOeD+8Cegj99gIlbrDdCYN2Pos3m
         Pitg==
X-Gm-Message-State: AOJu0Yw18spWMspzUTmFQdpz/3ENVJTEp7N755LyO8v7IpOHaU2Z9RYM
	cGVeTeM7VWIv5e2FV3xC0DkKublhb8A8hqJRbRBjcPsGWi/4zXiFbkWFyr2wKp/MWOB7khjuQTA
	yFgkiz1o=
X-Gm-Gg: AeBDiesJXyvgP/XkLMUx9EtAH2QmoXdWtcAMx0ni4xi/dyUnz+V/cxmjYJAWljKG4S/
	5qSWg9y0r9yA6X56uiuXAVRP32DOJ8/5vnbu9KxoTf/RXIGO+jVZFYRQ0MCfur7Ltkg+FTvMOOQ
	2x3iwcH28RJGP7SB5gywEtdhiOuhjaBQDdp3gF748c23u8JedFe8e6jfq8UTKpe3K5vZ1cySWWO
	uEmiDqzTLPB58Q6+X8ldSJMJFl94XbWO9jcWlFzdvIxYTcvBZdCjb0dTDYqBr+0YTG+RogqGsoO
	Vka3zO7kMCFaYBOr3zg9mUyAuXyAq2o2Z93CMXRRbSxi2cNWjHAfx4ALLE8gCu1UeXBtgBFGtNd
	dPfEdy7/VCv6ChOp63bUTYRwe7MF+QjClK7Oyp5KkJw/TynmxI/wvpN0q6QC48VTiAO1ZTIDVRZ
	ZpUdWNbaLbYkuERhzc9tA1as7Hgtbvkn0XJaDKwDeO5HQ+cwqXzFxIoJNuXIsDqF1e31D4QVFDo
	CpyprmhR8zlJGa9G+zcoXauog==
X-Received: by 2002:a05:600c:b8a:b0:48a:56de:d620 with SMTP id 5b1f17b1804b1-48e51f32ac3mr691495e9.14.1778000332358;
        Tue, 05 May 2026 09:58:52 -0700 (PDT)
Received: from localhost ([2a01:e0a:8cc:5b00:b8fa:c45c:f26d:53a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e51f6805fsm60025e9.2.2026.05.05.09.58.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:58:51 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/23] linux-yocto/6.6: update to v6.6.126
Date: Tue,  5 May 2026 18:57:26 +0200
Message-ID: <d5ac249edb6ca794fc72cef09a27c65ffed8879c.1777995876.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1777995876.git.fabien.thomas@smile.fr>
References: <cover.1777995876.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 16:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236500

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
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
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
 

