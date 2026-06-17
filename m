Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D6CCD98E2
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 07:45:50 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10223.1781682345230675972
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 00:45:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=igUREso8;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-46019b190b6so4505146f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 00:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781682343; x=1782287143; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/37FczcQUBpO5GpeJU/mvETRCZbK6Z9nSqvs4+3XFE8=;
        b=igUREso8kvAMguxn/AsqVbywl8TTn4NDEIpuKwMvYwYKtr1U/i7hlqxzvSuGhZT19s
         orPPNJN9P9Dzyld30eD3MIEKLvs04aKy1Ywxv+uih0ldmGr+FAL8TODXN1q9JFE/JmY+
         CI0cpEoH97zvpigMxaUSkWeawIFz9QpmKAarQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781682343; x=1782287143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/37FczcQUBpO5GpeJU/mvETRCZbK6Z9nSqvs4+3XFE8=;
        b=C8A4DxnWUWDu6zg3WPo22evmy/1zyMledrLCbBDeYZT3rog3PqP2oxH3JVpv3zHLGW
         8q1l+QGK7CnLi2HsQuzNZLWtt9DrMrrQPIApY5lWcHG6x8U1MEoryf5H9lYuBdPOp60H
         EQTPEl9C0NSrZA03FzJUbi5QJz/rS2ajCNTxEVo3RE9R35ZdFpwWKl6zLA9q7PLbb2UK
         wP4roh9duBMbywIS4b9XPFCV9UN3oTHvzSqIHVSQEcnl6LVmbI80zZfVwz78DE73O8LC
         zU5WTLV1Z8lkuLCyZdziHolp6t+L0mzwmqm20/VO39wzjbWXjvRD5QNkMViW7uNAa3lz
         mhxQ==
X-Gm-Message-State: AOJu0YydnpxeVMlL+hgTqd5kGYHxS0Slzask1tqCycH3a8JUSlYjMAUr
	q5J0I3Xr87mnUXoy6wxGkwF4XFbgzdRS8QDD5gIo2WNYl70i8rzE5CljDfd6WdgEB7Z0cTC/sTZ
	PCEES
X-Gm-Gg: AfdE7cmG7XFPJc9JsgiE7mTTaBidDtMEaW//dWQQulTuyX+KzO25HQOM/fBYGpzp4a4
	q4YXLF4nD9GLSvdPrrTJSb5YHhm5F8eAQOxCoUOv023bzCp+ntCvQcT+Qy0y3RHzt5Nb6HVNchy
	VQtU6Auv7f8fRgMtL8qMX63DWt5FCO3qa0UaZZTak4cwku4fm2KafsVNBZxXAZm64Wc1KRjI1RU
	+zQJPwiETZUiVE3guh8u59YkcVS/G5BtmDQOmBqqTosTLJOl8CyIg1Itf+hOqZZ6dHCf2UD/lGe
	M4yUCh1ppB4DEtTRvF7qoylK/gGyLloR3jJqjOA6H0dnsK2g1p8Em6UlNx844fAt05ZZkonNSaq
	ZnI8anV5Fm79pAKNmJgr2x43bwMll0x9Jt1+60qduXP6yuryaEHYwAK5x1Lm1jKAmXJ8uupEqnf
	9WAac5BelZ30JPKdE/lcO4fu6f1tD7ETtyPNQei+10Y9zGGaT+yUNous8PQZvpZWYmtGav5k+wV
	akGkLzpiZHouJAgAVfVVUSxKcdS
X-Received: by 2002:a05:6000:4b14:b0:45e:ee20:b897 with SMTP id ffacd0b85a97d-4623521ab1amr4294125f8f.6.1781682343361;
        Wed, 17 Jun 2026 00:45:43 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bc19bde07170effe.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bc19:bde0:7170:effe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619b9b7750sm23483215f8f.6.2026.06.17.00.45.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:45:42 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 25/30] linux-yocto/6.6: update to v6.6.137
Date: Wed, 17 Jun 2026 09:45:00 +0200
Message-ID: <b1e3ab9432582351eacce91ab70847a34d2bdd5f.1781682189.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781682189.git.yoann.congal@smile.fr>
References: <cover.1781682189.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 07:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239007

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    258cf62a6dfde Linux 6.6.137
    4b4defd2fce3f Buffer overflow in drivers/xen/sys-hypervisor.c
    402d84ad9e89b xen/privcmd: fix double free via VMA splitting
    710a4ce5d7afd crypto: af_alg - Fix page reassignment overflow in af_alg_pull_tsgl
    3ef530ef5585f crypto: authencesn - Fix src offset when decrypting in-place
    d0c4ff6812386 crypto: authencesn - Do not place hiseq at end of dst for out-of-place decryption
    60c798725c966 crypto: authenc - use memcpy_sglist() instead of null skcipher
    c2138c9bd02af crypto: algif_aead - snapshot IV for async AEAD requests
    3115af9644c34 crypto: algif_aead - Revert to operating out-of-place
    dbea57c08acfc crypto: algif_aead - use memcpy_sglist() instead of null skcipher
    9ec26b5d193c9 crypto: scatterwalk - Backport memcpy_sglist()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 22af5c2a99e..bbcf3122ea1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "99c037f00af27169304f268e388fa3fc65688633"
-SRCREV_meta ?= "b162eec5fa39c4658181073e741efe3a9d498454"
+SRCREV_machine ?= "da5f16c9d10d53af703c809e864c09df336edfb7"
+SRCREV_meta ?= "7d4cafa710da4e27a86cb015e50d91cf458af06f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.136"
+LINUX_VERSION ?= "6.6.137"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 1153249b8d8..c5c6f88781c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.136"
+LINUX_VERSION ?= "6.6.137"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "4aa4f6df28cc4541355f39ce0c40237408690c14"
-SRCREV_meta ?= "b162eec5fa39c4658181073e741efe3a9d498454"
+SRCREV_machine ?= "cd2288c19d6b729b3c7b2b620eb9c311116c72f1"
+SRCREV_meta ?= "7d4cafa710da4e27a86cb015e50d91cf458af06f"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index f2307dd6e05..358b6a7760b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "9d8556efa4dbd3ee1cfac4af6426a8476637fcef"
-SRCREV_machine:qemuarm64 ?= "aaa7c5002cfdf0f46dcf9239f3074aee1e29741d"
-SRCREV_machine:qemuloongarch64 ?= "59f5af18d31e596ec928a48848bd837d53e06c26"
-SRCREV_machine:qemumips ?= "d9adf59334edff1b09b883ea5717895e9735aa13"
-SRCREV_machine:qemuppc ?= "52b968d255a67240a548e64e784d3f5269ca3894"
-SRCREV_machine:qemuriscv64 ?= "59f5af18d31e596ec928a48848bd837d53e06c26"
-SRCREV_machine:qemuriscv32 ?= "59f5af18d31e596ec928a48848bd837d53e06c26"
-SRCREV_machine:qemux86 ?= "59f5af18d31e596ec928a48848bd837d53e06c26"
-SRCREV_machine:qemux86-64 ?= "59f5af18d31e596ec928a48848bd837d53e06c26"
-SRCREV_machine:qemumips64 ?= "746738b15a00d5d36105d09ea0f259f44be48ad5"
-SRCREV_machine ?= "59f5af18d31e596ec928a48848bd837d53e06c26"
-SRCREV_meta ?= "b162eec5fa39c4658181073e741efe3a9d498454"
+SRCREV_machine:qemuarm ?= "eb708bdc972fc5dc22cdcbf3d3dbdb81e1450fd9"
+SRCREV_machine:qemuarm64 ?= "eafa49201e224e87ad20cf849dead88aec204e68"
+SRCREV_machine:qemuloongarch64 ?= "f14907570fc0bb7285c62bc9d5146180bafffbae"
+SRCREV_machine:qemumips ?= "b75949027e1e8c8c90998ee144c6b97aa2fbf561"
+SRCREV_machine:qemuppc ?= "1b302e1b1463e28dd8d446754cc3140e935ceec6"
+SRCREV_machine:qemuriscv64 ?= "f14907570fc0bb7285c62bc9d5146180bafffbae"
+SRCREV_machine:qemuriscv32 ?= "f14907570fc0bb7285c62bc9d5146180bafffbae"
+SRCREV_machine:qemux86 ?= "f14907570fc0bb7285c62bc9d5146180bafffbae"
+SRCREV_machine:qemux86-64 ?= "f14907570fc0bb7285c62bc9d5146180bafffbae"
+SRCREV_machine:qemumips64 ?= "620abbeb29fcd44655d2de94ae7a7fff7656ed01"
+SRCREV_machine ?= "f14907570fc0bb7285c62bc9d5146180bafffbae"
+SRCREV_meta ?= "7d4cafa710da4e27a86cb015e50d91cf458af06f"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "142cd8382222d9b135e0029da6830e5e30444d34"
+SRCREV_machine:class-devupstream ?= "258cf62a6dfde3c6a39d120a56a298f2ed6a8901"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.136"
+LINUX_VERSION ?= "6.6.137"
 
 PV = "${LINUX_VERSION}+git"
 

