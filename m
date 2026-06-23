Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A0C8CDE001
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 22:27:27 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32873.1782253639261564533
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 15:27:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=QjkyAbfX;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4926046fbc5so2235835e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 15:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782253637; x=1782858437; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T23sJpnNS7eEpXRxBkgx3gjF4/g+RkMSiqVk7bkpXUA=;
        b=QjkyAbfXXZ3r1X1UhNWr27lhPg2Ksugw+jSzhoJq0uLv8lYGLmZjhSSB36h9OEdZMT
         Dwv7VxuxsgwT7WaOFm3w9eb0xiVGUOr4lq8Kl+DEzAbmt06p072zT+Q5Sqf+pfJaYYyW
         N/5gmHQRvvoxNeA86xpvwqqn+KyVVbLFaZEUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782253637; x=1782858437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T23sJpnNS7eEpXRxBkgx3gjF4/g+RkMSiqVk7bkpXUA=;
        b=F6382MSOAdMYlvRNBdvrWVcZcnLhopL3iICU06XywPCZ+6htS3v6JqTDRVdXp/+SuA
         sY/TMQiLNdQGeArCtABlAhTxmHZ7ff2lxM3+RhUQ1s4OJJc76IN0hrqHCYyxNvF2e4OA
         NFA/DCpn1rBSRMV2mUWCNXvcVHJD9omGxW8j3Sdswevn2CYRxTQJz59WRK89C4o1S4uk
         DTg5ev8NlbWof9uC12s2N2xPe5DcTEo9wCdLF66v2UaqZlK82KnzoXuTGwsihARKTmkt
         SUR8fW9+JwqoU3vjFA55MHAxOuZFLuL/FNgBFpXTrDXbRTaA9c9JHYmIVYLqZAnj5DKd
         qBZQ==
X-Gm-Message-State: AOJu0YxpenHIhi3sHx/hOPjtI/KeMZbZCUc0uikv7O2STztg95Xrcgqy
	zz31zNCS0ImI+gdGVc4oxxaWz89l5LUu6vk/pCcaeNOuLQNWIfjtfJBhYzBqZxXCJY2lroRS1lJ
	TFOFv
X-Gm-Gg: AfdE7clnUMXEj6FRtbldTBlQRsnIZ/HKApskdrv1AVachSqyCp3vh5uHbEdPE2Sz//E
	ZcNAAoZHYw0+TZGHEnOE8eBf489H2nqSHoZ7s/Ww9TzDRMCx2HFQsq3fQjsXFBGnK4/FbjiFoWu
	MxPCgUO5CtYG+3kr8PXEhR839gGAieK+x9iJp6gTOtdklbS5cz1kpQfBMZSz+K4pL+5kCCgSaLM
	tuXm1BXODh3eIDjyeQ2VeHi7N0UP1cpup5neYdaoTB+KJ8yyXBIanpFztpxGEMhLYUn1rHG8SKY
	0NKkZEe54UU9uSzezrcFhmsUlyDl0QV5Td/qqjn4nh3LkfO6qDOJMqZa4ulDZm+2uwZlcusgMRv
	H3CBGteKTskw/TtNiQ/nrre290BuZF1Rp7EFA8RIeowaQ1SFUFHiF+l0kaYMdGgB4Qo0AV6fpce
	xl12EilWhezugJXaKUwAD3WEM/Qdof0OLx9FkXaOxCeHtLbJbZRn2RZDLdvZyU2u6ESLVDNqOOX
	kqg4CQBYYWlulby
X-Received: by 2002:a05:600c:620a:b0:490:bbc1:c9be with SMTP id 5b1f17b1804b1-4925a045e50mr73285655e9.0.1782253637469;
        Tue, 23 Jun 2026 15:27:17 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0055dd0cae868d89dd.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:55dd:cae:868d:89dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd21dbdsm370786745e9.6.2026.06.23.15.27.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:27:16 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 35/41] linux-yocto/6.6: update to v6.6.138
Date: Wed, 24 Jun 2026 00:26:34 +0200
Message-ID: <c5695ca3eef548ac0a2ce9dd933b8c776707c6d8.1782252148.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782252148.git.yoann.congal@smile.fr>
References: <cover.1782252148.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 22:27:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239457

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    3b9f64db04968 Linux 6.6.138
    50ed1e7873100 xfrm: esp: avoid in-place decrypt on shared skb frags

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index bbcf3122ea1..68c3c07ef63 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "da5f16c9d10d53af703c809e864c09df336edfb7"
-SRCREV_meta ?= "7d4cafa710da4e27a86cb015e50d91cf458af06f"
+SRCREV_machine ?= "9708fab99d7eb8962dda82d642c468a32b6682fa"
+SRCREV_meta ?= "0a6ad7549c97f8703f1f742f73ee65d29d121958"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.137"
+LINUX_VERSION ?= "6.6.138"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index c5c6f88781c..52d89c713df 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.137"
+LINUX_VERSION ?= "6.6.138"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "cd2288c19d6b729b3c7b2b620eb9c311116c72f1"
-SRCREV_meta ?= "7d4cafa710da4e27a86cb015e50d91cf458af06f"
+SRCREV_machine ?= "72c2c9b6014dd199bb70e07e19931b8691fa08e1"
+SRCREV_meta ?= "0a6ad7549c97f8703f1f742f73ee65d29d121958"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 358b6a7760b..e077808f288 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "eb708bdc972fc5dc22cdcbf3d3dbdb81e1450fd9"
-SRCREV_machine:qemuarm64 ?= "eafa49201e224e87ad20cf849dead88aec204e68"
-SRCREV_machine:qemuloongarch64 ?= "f14907570fc0bb7285c62bc9d5146180bafffbae"
-SRCREV_machine:qemumips ?= "b75949027e1e8c8c90998ee144c6b97aa2fbf561"
-SRCREV_machine:qemuppc ?= "1b302e1b1463e28dd8d446754cc3140e935ceec6"
-SRCREV_machine:qemuriscv64 ?= "f14907570fc0bb7285c62bc9d5146180bafffbae"
-SRCREV_machine:qemuriscv32 ?= "f14907570fc0bb7285c62bc9d5146180bafffbae"
-SRCREV_machine:qemux86 ?= "f14907570fc0bb7285c62bc9d5146180bafffbae"
-SRCREV_machine:qemux86-64 ?= "f14907570fc0bb7285c62bc9d5146180bafffbae"
-SRCREV_machine:qemumips64 ?= "620abbeb29fcd44655d2de94ae7a7fff7656ed01"
-SRCREV_machine ?= "f14907570fc0bb7285c62bc9d5146180bafffbae"
-SRCREV_meta ?= "7d4cafa710da4e27a86cb015e50d91cf458af06f"
+SRCREV_machine:qemuarm ?= "9d8edc5598e5c5f17ce696ce032e8dc654858450"
+SRCREV_machine:qemuarm64 ?= "c6600bc98dbafed4fcbd6f1204da6b41ef5feec2"
+SRCREV_machine:qemuloongarch64 ?= "ad053e3390f755311a4d87911c13039387767122"
+SRCREV_machine:qemumips ?= "97c272b944970f93ef93eb87f54899ccb26671f1"
+SRCREV_machine:qemuppc ?= "8dfba699cafc5b5d5f50cb8f270db9b8ae112571"
+SRCREV_machine:qemuriscv64 ?= "ad053e3390f755311a4d87911c13039387767122"
+SRCREV_machine:qemuriscv32 ?= "ad053e3390f755311a4d87911c13039387767122"
+SRCREV_machine:qemux86 ?= "ad053e3390f755311a4d87911c13039387767122"
+SRCREV_machine:qemux86-64 ?= "ad053e3390f755311a4d87911c13039387767122"
+SRCREV_machine:qemumips64 ?= "2744d8ab5ccca406c0acc17c414ff4c8e186708f"
+SRCREV_machine ?= "ad053e3390f755311a4d87911c13039387767122"
+SRCREV_meta ?= "0a6ad7549c97f8703f1f742f73ee65d29d121958"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "258cf62a6dfde3c6a39d120a56a298f2ed6a8901"
+SRCREV_machine:class-devupstream ?= "3b9f64db049687c0d38b4b3ef2f297f0642179af"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.137"
+LINUX_VERSION ?= "6.6.138"
 
 PV = "${LINUX_VERSION}+git"
 

