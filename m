Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE2E0CDE000
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 22:27:26 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32872.1782253638566490019
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 15:27:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=D7K7K2Nf;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b211ee6aso2379375e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 15:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782253637; x=1782858437; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/37FczcQUBpO5GpeJU/mvETRCZbK6Z9nSqvs4+3XFE8=;
        b=D7K7K2Nf/cfea6J+tPPrQlPJRSD5GQr10SkWrLUHrnjSlPRfEH1aZbV/awX+GLFP07
         l5L80moRLH576+Yetcdpw7Idrc1TL2hwlltUnZnoie+F4hO/6B5aCvsYr1xLb3lyXO7l
         M+mDZFHsZqRC3Ml1WsxX/tMUzIp29S703i9QI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782253637; x=1782858437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/37FczcQUBpO5GpeJU/mvETRCZbK6Z9nSqvs4+3XFE8=;
        b=OegmgVEC0jUIZdx9PbiX+1Bye/8dEN+YBLwl9qOGVBLSboKlCAfrD2kiVCuV69Ga9o
         chnSa10tQFqAflkNnz4HusvXIWyjCTMkH/vw5rZcHasGn+8nUw3Zovjfs7LrRZ3B9SFq
         k5/XWCJz92r4hlvThLhm23ikdaw08vLk4d8Ck70ptrGIFR1CwPGhTz7kAsv0A8mr3+71
         9W6wdpRNktRI9LFo4wKL8SEjf96ClxUGqx0D8+FxiUbphNt16IkXvhsH6gOFJDu+cdj1
         PIfNGpEgcepta55mK07sGoQDgQX5B/VD/Xa0n07LkUjGfgS4iR36FvZocAdyFa4/lKhY
         zKug==
X-Gm-Message-State: AOJu0Yz/phIWwMKbK9/rXcEOvYxutX5Pce4tIjO6CXhepSkP1tuN8Hn+
	Qm/n13J22y/8oVc1/gPsHiKiwiVeWa1+OlFegyoRPc4pvWTUDWPC2k7Ht6/uO9JqiNyhtfQIhVY
	hTOOP
X-Gm-Gg: AfdE7cmK7mSC8cTJLFVsgdAJ2bLt8qao+egEiCgSqvzzkiyrOKBM+3tZnRE0hIe3uCH
	j/LG0PKJsmty1RhpBTp/2C0HgdEZdAHfJfzVr+c1mvvhoVuciVaQJRsPuh3UiWzmSKeRiPOAyA3
	0RyXeUKYTZDtqNQfRjY0FWlHTiyv2rKuXctG2hDrsHOeW34N36ISaVQEwiwG5pDawyhx07f/0YQ
	Hv/d2xSf61BVgIsI7czGP7cDRzFp3xHXjBs5JgDwWqwkJQ8AokJu67szHeh1Rfi4e5CU1/m5Ak8
	e4qL5cE1RHNNmbXSnVMaVCPu7Ao79g11RCzkjioENGy6IKqklgZFF3ymQ11M7Dmq/8aLEe6MC8G
	EXRELpqG6lpuPUkJ6FYm49N3B/oSEB52g/k3Lx0xcNoondofLlMviaVJ8HwzVlkKY2/CYSON+OJ
	oSP6vG8+Fcm6RDSGiM3rgJyBVk4rWQCY9Wy30O5suh2uXWSBjXNMUHq1UifH5mV1focx06Wk9xe
	R1wMnoEGlojdkme
X-Received: by 2002:a05:600c:8b71:b0:492:42e1:1b6a with SMTP id 5b1f17b1804b1-492608784b7mr6877485e9.25.1782253636777;
        Tue, 23 Jun 2026 15:27:16 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0055dd0cae868d89dd.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:55dd:cae:868d:89dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd21dbdsm370786745e9.6.2026.06.23.15.27.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:27:16 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 34/41] linux-yocto/6.6: update to v6.6.137
Date: Wed, 24 Jun 2026 00:26:33 +0200
Message-ID: <2c23f41118253f10fa63897b4587bd83421cec55.1782252148.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782252148.git.yoann.congal@smile.fr>
References: <cover.1782252148.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 22:27:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239456

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
 

