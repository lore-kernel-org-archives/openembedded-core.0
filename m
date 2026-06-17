Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 586FECD98F5
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 07:45:51 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10224.1781682345872710927
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 00:45:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=M6r/DV0h;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-462342ac290so725019f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 00:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781682344; x=1782287144; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T23sJpnNS7eEpXRxBkgx3gjF4/g+RkMSiqVk7bkpXUA=;
        b=M6r/DV0hsZZzqDHPaW62CgUtWdbYngeGjoEFI3bk5SePSewmT2n2OZSW+VFhrOEWQ5
         quIlWtxn+eYesxdCGi/gBJ5XWO87nkMSHRrioXTXKnAHAKNexhZ16zULNm6JAuMYmN9j
         7d8zNcftjofKQIFYftvRvxtN78s0Vx+BAXqbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781682344; x=1782287144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T23sJpnNS7eEpXRxBkgx3gjF4/g+RkMSiqVk7bkpXUA=;
        b=WrKsKVpL2R6S5S8KwiFrp3Ug++clteymYCFgxcC1j3lh03DYws9LkCzEhZEnZ+RWhN
         jq3WoZpA+HTx/Rlb5oBxnp/7giuPWW533NguNlLDyo06hPq0Sv2XJwzk2RXX+7/4FA8z
         OIpxnoq6bsqGZygzbJd4hCJA0nYZy2YmGZUouA2QnoleOIgkOv1GA/2vLuAMHRcm9+8L
         vTnMk5f2p+p6TtYwO+tXlfdsk/gkkeGcRo57/51YarqukfPtIU7cPR4Y/hsLbhNLK9Yh
         qrYxDHxmeEDzLZ5V2sV5FBtH0BeQf5LL6RlUYz8LjbhX+jUDVdW+rlyScF01YXzqKD2q
         DfAw==
X-Gm-Message-State: AOJu0Yzz/xEGyZjLsBuvHe2cwnRvSzK3pf4FlUkeVTyqSIpoWwRHIvvB
	/id7ELjf3oN9kNKXNWwY7c1SyWRQkx7sr/CIxsLJd9iD/8MdiueKirH+YfzpvxDUxuETfKJB2gr
	8XCuL
X-Gm-Gg: AfdE7cmKcVcDAAzlpoWhcjPScrBgutK2YyBKvz/+UZ/NHFuMz584kdOMN3wGr5T1NOG
	11+DfEnzwFGW7ASJzdQXdVK0pi+ecExtefXase/ymjinCs+lhmd9tkWUaTR9gLiRZjNSPYClBoe
	f7y+4eGywB5/h3Sqt1XV9G5IpRLkZ4b0N5J6znl0D6YrWch3mJl++RxkSad/QdRCerF3XPvYxLO
	qXWhlFBcXufRlv5/D29ovWOQDk/7neibJNj8LGU6I1knxukrnHD3zBP4Q60KYpNA4goF7u5Xu/h
	wickXWOKY/y3NxoRVqkJlZ7x+a4EiLspmxfPojKv5wHJbscSdCWXaCgA3PxJIgjoS3RWtKeM8Sf
	PEnMg68qpm66E0R3xQBQXSo7ydnieuppn/8LB783no875e1y5MDF7DgYRWcyiSOCV61fKkgmRiT
	8CH4EeZjk7C53ykj6Osn7UufVY3vZzI8EoGDMUo3mz+BhonJ5MvydWkKSY0+l3SEdG7SLuNQAYJ
	SfTpBFrsSnhTqbE6A==
X-Received: by 2002:a05:6000:4007:b0:45e:f3b2:122a with SMTP id ffacd0b85a97d-46240cf969emr4249751f8f.26.1781682344027;
        Wed, 17 Jun 2026 00:45:44 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bc19bde07170effe.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bc19:bde0:7170:effe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619b9b7750sm23483215f8f.6.2026.06.17.00.45.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:45:43 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 26/30] linux-yocto/6.6: update to v6.6.138
Date: Wed, 17 Jun 2026 09:45:01 +0200
Message-ID: <3c22f99137416e12441856c33dbfc3292d4d0aa7.1781682189.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781682189.git.yoann.congal@smile.fr>
References: <cover.1781682189.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 07:45:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239008

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
 

