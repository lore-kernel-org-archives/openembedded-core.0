Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56378C54E60
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 23:37:43 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.8646.1709854655282786304
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 15:37:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=K/IIBNDa;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1dd2c8f1204so1645255ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 15:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709854654; x=1710459454; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZH/5yWkYpkatt34T1ZwbhRAcJx9CwB91KZq9GH665g=;
        b=K/IIBNDaErh0GcsjHVRFdmsgOKFv4XmJvbqjqABuzhOXpBzTflanS28bcrvDAJdGol
         UfUx2FYQP8mxg24Wj6knZEtMf4hAYwLRalVP+QzKqvgytf9gshA6ZFoN7iw5OpAYkFZZ
         7AQbPs7H8xhn+TjiUiFmfje3NoIvmbhvSBWS1Cl3cc83hQuKO9zeEtmmDPx5Wiw8f8qZ
         RAgh/xITr2Ofxj3X8NregOd7mKSqyt9Hn+hk05XhVpcK7kuDwurjS3yUceEj+xPkGACN
         Sblk07j8K3hNT3ibUe45VEd2dIVFuFQR8Jbbg/qQ5CTSwC0ka+MT0ErlGUg36A8+QV8/
         +RXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709854654; x=1710459454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bZH/5yWkYpkatt34T1ZwbhRAcJx9CwB91KZq9GH665g=;
        b=H9YyPlLbHpVKc1dhfAJbetodHZmNj4cjFxuJ3wZ0fDz6ceZzksBPBt5Uqn5g1/k/tR
         gSjFrFoNMpACqHxExGj7zauzATt5OYcglS1vCrQsNt9viBseDt9KPhWfbmAD3aXDjYeF
         5kFgrvb0jRQVpLtviPwMtnyZyR/Vpx8D5sZ+K3Nxy5+107+r8Y0NmQ/Y06+PWvF3E9Hn
         02CAPn8XTbx0W6dxByN1+mqMlBo0+3Silxff8z4janrPDDSjuT5pXFBP8dcape77/Tej
         q+5RIsYicbIUT2ilBZSm++im0DI4aTxPWwikmIgvtRSzTEszlpnt7dw3sUlLzVGFmczh
         0unA==
X-Gm-Message-State: AOJu0YzxnCEclyzdxDXrEVV4DApSjKbmnzFSeGPk1oJr+lae7kF4R0KV
	PwaEH+t15FPVhi4A3a+NneZjAoIs7mB5pU32ZU22uECzIjXxyNP0O8H+VhTiylDKICaowRkNy+D
	pSAY=
X-Google-Smtp-Source: AGHT+IF21GAhLDTRRxmj1gRFPc87vFsB5HyrOGOMVSDYKYOlxD+gihfaoOsiBGxMzOGydoU+AE1QCA==
X-Received: by 2002:a17:902:dac5:b0:1dc:68b6:9243 with SMTP id q5-20020a170902dac500b001dc68b69243mr10186916plx.58.1709854654504;
        Thu, 07 Mar 2024 15:37:34 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id h18-20020a170902f7d200b001dd526ff7d2sm1933243plw.308.2024.03.07.15.37.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 15:37:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/9] Revert "linux-yocto/5.15: update to v5.15.148"
Date: Thu,  7 Mar 2024 13:37:14 -1000
Message-Id: <651c28f59b865ff31b8578c87addca26c64c0965.1709853987.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709853987.git.steve@sakoman.com>
References: <cover.1709853987.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 23:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196829

This series is causing issues with adding and resizing partitions.

This reverts commit f1326d008a2a37b3860f25eb082efabdeba7cc32.
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 4578a1d819..e64f21b2f0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "198d85bb67700ac968a286cf7f89f008bb6eff39"
-SRCREV_meta ?= "c07c75a1e9438e70a80615cac0f48eb91d8f34ea"
+SRCREV_machine ?= "7168cfa2ce6492db31163393808806b6f48af5e8"
+SRCREV_meta ?= "487de687c6a4553f11d67b83d01f16f79449ee49"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.148"
+LINUX_VERSION ?= "5.15.147"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 267ebb11c4..38bea23264 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.148"
+LINUX_VERSION ?= "5.15.147"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "0780801e81912c4bbd53b4fc01dad6df556739b6"
-SRCREV_meta ?= "c07c75a1e9438e70a80615cac0f48eb91d8f34ea"
+SRCREV_machine ?= "641e2136a155ce3179c84b9365a5998c1354fdd0"
+SRCREV_meta ?= "487de687c6a4553f11d67b83d01f16f79449ee49"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 9a7c96b453..1acd7b62cd 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "c0150afdb5ca785c04acec22c7f42f42b044ca43"
-SRCREV_machine:qemuarm64 ?= "201f4f28b183815dbabda398e9ee90a2e628ad94"
-SRCREV_machine:qemumips ?= "1d82f42872b46d7f129bbe631931a09590d9d6bf"
-SRCREV_machine:qemuppc ?= "e985732d9de961b364b9bbf03ef3eba41adf8e37"
-SRCREV_machine:qemuriscv64 ?= "9bc0938c9f31f2f63b8e9d7b8f43671927858068"
-SRCREV_machine:qemuriscv32 ?= "9bc0938c9f31f2f63b8e9d7b8f43671927858068"
-SRCREV_machine:qemux86 ?= "9bc0938c9f31f2f63b8e9d7b8f43671927858068"
-SRCREV_machine:qemux86-64 ?= "9bc0938c9f31f2f63b8e9d7b8f43671927858068"
-SRCREV_machine:qemumips64 ?= "c87c9b74f382aba2886320ca29dd32544e53f15b"
-SRCREV_machine ?= "9bc0938c9f31f2f63b8e9d7b8f43671927858068"
-SRCREV_meta ?= "c07c75a1e9438e70a80615cac0f48eb91d8f34ea"
+SRCREV_machine:qemuarm ?= "82f8a25a3894c10d1cf26914b8e51726351ba11e"
+SRCREV_machine:qemuarm64 ?= "cf955e443d881e296b83940143fd30ea83fcf222"
+SRCREV_machine:qemumips ?= "1c3babd3b42768e24c797edfc3f67906aca6d072"
+SRCREV_machine:qemuppc ?= "b08998787bece69376578b049cab073d8b80e872"
+SRCREV_machine:qemuriscv64 ?= "5822f13dba3b1f460536d873aea707f4b25840cf"
+SRCREV_machine:qemuriscv32 ?= "5822f13dba3b1f460536d873aea707f4b25840cf"
+SRCREV_machine:qemux86 ?= "5822f13dba3b1f460536d873aea707f4b25840cf"
+SRCREV_machine:qemux86-64 ?= "5822f13dba3b1f460536d873aea707f4b25840cf"
+SRCREV_machine:qemumips64 ?= "4ff2c0496c0160a96185a080ec9678c63b68bd47"
+SRCREV_machine ?= "5822f13dba3b1f460536d873aea707f4b25840cf"
+SRCREV_meta ?= "487de687c6a4553f11d67b83d01f16f79449ee49"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "6139f2a02fe0ac7a08389b4eb786e0c659039ddd"
+SRCREV_machine:class-devupstream ?= "26c690eff0a56293e0b6911a38e406c211b35547"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.148"
+LINUX_VERSION ?= "5.15.147"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


