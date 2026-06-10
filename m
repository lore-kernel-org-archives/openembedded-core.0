Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB5FCD98CE
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 16:50:23 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25211.1781110220258204795
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 09:50:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eUYrFchA;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8ce9df49c5fso94291106d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781110219; x=1781715019; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZcESm/JDWnEYYhAs9FO04E8Zp1Izw5v0PJ7FbRX4raw=;
        b=eUYrFchAVcWgEOIFgR0fcvA5k9GyiWZcme5EGtcJJ+dE/6zEElq+ypqnMaaMFd3RJd
         A+sFflkSvlmrXfbAuZ4hiv7txSCXoNJ3ALxfUkvhgc2gbO5UgQcjICYH22d9MHQSIiad
         41LvV4p0dbM0cFNj1XHFicLliNVCYj7PJkuHdPE6/kgloJ5SdbuWOGHh4Tfm71VqjCnY
         8L74exbrDp0QnRk/AnC3x6V9cdO8egYc7Kes55y35Ckszy08K0UjjI12UJqOAQLbJjrI
         ezuw25+avvUsqp7cI9V0aATZCJJXCliM0vZjTrY7B5eZQftrTMtNdS0yH7V3YLveVXD2
         8wcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781110219; x=1781715019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZcESm/JDWnEYYhAs9FO04E8Zp1Izw5v0PJ7FbRX4raw=;
        b=rY1d159hgtv978tmRrN1Lq5mVpGoan3N6MhKsFfRvW/xWE0ooN7JhFpU8xGkbpgpXg
         0/TmE/SCuFZNGiQZzsanMvLWho+l2WOF/J0NL8QtMkSHHU5R5Z61Ya0dq52eQlcwAceV
         NLlUbbggbOWinTQ13AY08yinYTFqkS79wwjwOHU0A/owYO6kKYPQiQnWaFcxOzLA7+q/
         2vNWdnfzQ4akwT8q3WiLEWgmGnwOShpmP2idiYj1DtTwVV4t1Fx2sXOYUj+Ah83afZMs
         uiu5A2ezF88YYollZH3cYVM7ZCK6L2X8h6I9mzJYYIeM+bzyrgjeSpwHoInOMVBTyBQ2
         gr1g==
X-Gm-Message-State: AOJu0YxIHFGMlV4DgK0qwfjL1Z2NI649k88791iDXOJ3x/7WEmhfVKYc
	HxreCv4+2uZyzHoLYgs3flMx/U75l6fPwErUDZa4Ssc4K8vmxd+RsKHqm+TadPmN
X-Gm-Gg: Acq92OFjzaaZBX8KNgsidgZ0ku+cu8sFAo0ypaSgavD2vbX5b4rHTCUmgyRbCUOP9/6
	PgweiHoA8Q+MrA02LaUR6aBGOqdQGqBDCnxGauronQoJaKaQvvuASnVzhpWHUiuouhHH5lFy1xf
	qga6NgCGcsNpgBecs1bEwrjeulQcVEjHNnPbwP37o8CsYxBmBEaRWvOXffSqSZ27Uabou5reXaU
	lME7Yr34Fe36304Pn8lt6tD8fGffNmRDdQC+8wTs0H48vnVKsNUlUhjeWmQiDWQfdJ8gD+7PPuu
	8E02U/urVvSniOCDCAu+4bgK80/7AXSc4vHTBLCwx1z/k6Wu8cZrojIzTFqMdHoVIq8N7/+HVgv
	rI+2c5O6s1pm+Kuqmc9ROHReh7fnTuybGCtNYzRMc1Aari0XbC7A4OfG1edkm6eDXW8QSUA3P8D
	Zr2+HmPbpsMsDREC8XDZE7H0bf+Xt7ffz+0yAQQur4bs97vqF8iwrItQtzza0ALANtAFKVuq+bj
	2YEDjmQW0mP4jeippsu8tSdmctrfhxONshfZc6DPNkwSyUNG1XbRkJeXrdG7WrIwyMzxX+Wdeuq
	lak5sTaU8/OjYv8n+rXsTCUXhFul3Pvqef+OgKke1+6VZZ+/lbURiSM=
X-Received: by 2002:a05:6214:1eb:b0:8cb:e65d:bed5 with SMTP id 6a1803df08f44-8cee5fc97eemr323155186d6.13.1781110219260;
        Wed, 10 Jun 2026 09:50:19 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccdb915csm241444346d6.14.2026.06.10.09.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 09:50:17 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][scarthgap][PATCH 08/11] linux-yocto/6.6: update to v6.6.138
Date: Wed, 10 Jun 2026 12:50:05 -0400
Message-ID: <20260610165008.1870552-8-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610165008.1870552-1-bruce.ashfield@gmail.com>
References: <20260610165008.1870552-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 16:50:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238384

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    3b9f64db04968 Linux 6.6.138
    50ed1e7873100 xfrm: esp: avoid in-place decrypt on shared skb frags

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index bbcf3122ea..68c3c07ef6 100644
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
index c5c6f88781..52d89c713d 100644
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
index 358b6a7760..e077808f28 100644
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
 
-- 
2.43.0


