Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F403ACCD1A5
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 20:40:13 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.3147.1760733607297843960
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 13:40:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wz3oEOaR;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-78af3fe5b17so2053380b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 13:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760733606; x=1761338406; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xirkMxs8O9qY6EH+MoemkTBIBGBnO8vlsc9mtgwevtc=;
        b=wz3oEOaRqr++aXSinWv7RVeVeSDjr7eGl0TUW9RFAJUHa4JfWrgSKj9iYFiLevgJyt
         XmBJgaorVZffGbAXDGwZeWHGFZLpBpYKxCCL3dDtFuRZaYEsCjfAnnTH+CanRDEL3kEm
         9+KzEAbJ3onmZ+WmjfOy346ycOD0B146NxYtfzzCyOfSOsyGBnGQdY+r4cgetXWI+BRa
         GtpsJ7+BIczwEVX3Mrgg8ovGRSOXg6WENZ2BDRyAUs27jrWwVjxtZv84uCb+td75w52L
         D/AaOF8AiPRvB8yL723LmwUO0RF90irG4LNRvtbT75594VmgbMLC8qqWMzZ2sCz9gBTy
         CILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733606; x=1761338406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xirkMxs8O9qY6EH+MoemkTBIBGBnO8vlsc9mtgwevtc=;
        b=KtSGzZh9wCPzoSFMhoZX3W7YMPo1oT4K/HNA+jwuoK0zwpjm4dH7twUQCZ3Wek3Fhz
         OFnzKVeyCAPguO4ELhNScghLeOAh4oytXj2hAe0bL7X+T3bBjG0WJ4u1osWnPV1A99u4
         tEhjQfXrfMnuRG/O1CPJxQSGlav07panmOsjtPvazVboTLCXGcPlN27uCqxSfA42jCg2
         21XWjypXigxNWKV2PvF6pHAteHnWlgOKEHlA4PE/6tjt1RgYp0NfVf76NQi+AONZUFPb
         9YFUO20Y8PM6++2+ouFUwmSzRJZWwHB1zJqsih35M94+43YCs4e5VuiGGXpD/Rvb4ijj
         JaJw==
X-Gm-Message-State: AOJu0YzbZmeSmp44XZ693QxtSK+Jtn8+NyjlX+vxDrOeukFsHR9dSDGN
	a9rWMqaRbeiZNCrriaCF5KHdz3wVm8gq8au7wue/DxzgDf8koirh1OpshFjcw34puPnoiPDJ69E
	iq006nZ4=
X-Gm-Gg: ASbGncvIj2IxWVFYtmPc+/TjB8vsfXMDg6Xm3Kj8iflKHvopzD13JAdAjnAECgZobzR
	bEE2UiF+RoN2EagpcpKZtYMI+fJR+l9Iw5A9Exa2oPyGRSM4Adlncsfd0bP8gxswZH45tKI+8hG
	RlXhS0AYUJ6KYVhjm8QSBVT/sVohm7Ff9WdgrpZmNy+0MvpG03VvKluo99BJVQ5DqOhbHR/YEuW
	2q2DRPVHAmSsjF75bHzPayRXP/CtkiqXglW8+bZZ8a3POtAUgry6jCe3OWG0dIiAnDiXpq6yv57
	FiJO9OiALPlBm0p5qZ473FBYeSYsWyRU3VRLIuShjzIuA0knGLmj8hrLzx1NhqorO7DuKn4wjKG
	tJEp3w7Jv2856b+TmqjWBSQF50VwmNsKKQDjOz9sKASyrlvu6zQhWC0CNZZgZvTdiUg==
X-Google-Smtp-Source: AGHT+IE0OvUhAeq9yiZ9nDyRvU3kHSC3s7883FdKPUJ4fdxpV0vW8cHctBzLQbRzvdxdfJ2VX/rA7w==
X-Received: by 2002:a05:6a00:238b:b0:77f:449f:66b0 with SMTP id d2e1a72fcca58-7a220b2cd3dmr6707802b3a.32.1760733606407;
        Fri, 17 Oct 2025 13:40:06 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:aaee:e640:34cd:6f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f254esm477061b3a.45.2025.10.17.13.40.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:40:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 22/26] linux-yocto/6.6: update to v6.6.110
Date: Fri, 17 Oct 2025 13:39:05 -0700
Message-ID: <42854520a9476ce5ac210097a5f6ce18ecc66c80.1760733431.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760733431.git.steve@sakoman.com>
References: <cover.1760733431.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 20:40:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225056

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    e617101e5626 Linux 6.6.110
    70e1e5fe9f7e ASoC: qcom: audioreach: fix potential null pointer dereference
    f617d515d66c media: uvcvideo: Mark invalid entities with id UVC_INVALID_ENTITY_ID
    71da40648741 media: rc: fix races with imon_disconnect()
    bb10a9ddc8d6 media: b2c2: Fix use-after-free causing by irq_check_work in flexcop_pci_remove
    f03aa5e39da7 scsi: target: target_core_configfs: Add length check to avoid buffer overflow
    e28d05370969 gcc-plugins: Remove TODO_verify_il for GCC >= 16
    5d646a763232 crypto: sha256 - fix crash at kexec

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index c701c29ae1..7652e03569 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3162ade8ac9717b63836229e42b2a9ab9f58201e"
-SRCREV_meta ?= "aef3b17fc578bf09fc3b27e4eb45a7ce7a1b39d8"
+SRCREV_machine ?= "07bc1b79b450a91fa9ed645a4c6c77332f6c7fd3"
+SRCREV_meta ?= "46ee47b6ee7ce2b3cef51844d7a7e82c6c2daf5d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.109"
+LINUX_VERSION ?= "6.6.110"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 1f9d249a3b..33eafc2f6d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.109"
+LINUX_VERSION ?= "6.6.110"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "b481c2fca6f1528d9bfe55daffb89d380e941335"
-SRCREV_meta ?= "aef3b17fc578bf09fc3b27e4eb45a7ce7a1b39d8"
+SRCREV_machine ?= "0381ada6e1fee2c488a718f82ed83f0435a950c2"
+SRCREV_meta ?= "46ee47b6ee7ce2b3cef51844d7a7e82c6c2daf5d"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 1660e065f3..c75094dc59 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "d51aeddc46e2565930c596b0dd68b510c4ae56b9"
-SRCREV_machine:qemuarm64 ?= "b551efd543db7dff08c01c87822fa9c02c03c9eb"
-SRCREV_machine:qemuloongarch64 ?= "b6cb3303de9f505773ec65defd0437d2d13d270f"
-SRCREV_machine:qemumips ?= "7c4a971ad6360845687a90f1d07e22f4f1b8c3c9"
-SRCREV_machine:qemuppc ?= "61f111b7d27c1153f299945a00cf263f4e289706"
-SRCREV_machine:qemuriscv64 ?= "b6cb3303de9f505773ec65defd0437d2d13d270f"
-SRCREV_machine:qemuriscv32 ?= "b6cb3303de9f505773ec65defd0437d2d13d270f"
-SRCREV_machine:qemux86 ?= "b6cb3303de9f505773ec65defd0437d2d13d270f"
-SRCREV_machine:qemux86-64 ?= "b6cb3303de9f505773ec65defd0437d2d13d270f"
-SRCREV_machine:qemumips64 ?= "2cbe3d7e9f728945185446f19b06aa785ec0d2ff"
-SRCREV_machine ?= "b6cb3303de9f505773ec65defd0437d2d13d270f"
-SRCREV_meta ?= "aef3b17fc578bf09fc3b27e4eb45a7ce7a1b39d8"
+SRCREV_machine:qemuarm ?= "2a0fa5ba202ff49a42a8f1c5e36ed1a2d7dc9b91"
+SRCREV_machine:qemuarm64 ?= "0974351ebdd700bc59eb25d7144e96c34cc28751"
+SRCREV_machine:qemuloongarch64 ?= "272bf113897632849f52e9dfc1bb990daa566375"
+SRCREV_machine:qemumips ?= "4b003154faca105c81dcfaebfe4e753b378eddde"
+SRCREV_machine:qemuppc ?= "b1416ec0248422122027ab9cee287d7c86e5cf77"
+SRCREV_machine:qemuriscv64 ?= "272bf113897632849f52e9dfc1bb990daa566375"
+SRCREV_machine:qemuriscv32 ?= "272bf113897632849f52e9dfc1bb990daa566375"
+SRCREV_machine:qemux86 ?= "272bf113897632849f52e9dfc1bb990daa566375"
+SRCREV_machine:qemux86-64 ?= "272bf113897632849f52e9dfc1bb990daa566375"
+SRCREV_machine:qemumips64 ?= "4b0c928fbc6df11ad63d99b006a8448597ccdd7d"
+SRCREV_machine ?= "272bf113897632849f52e9dfc1bb990daa566375"
+SRCREV_meta ?= "46ee47b6ee7ce2b3cef51844d7a7e82c6c2daf5d"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "f34f16e5c63232cfd9bfeb722e0878e209caa9ce"
+SRCREV_machine:class-devupstream ?= "e617101e562654c7d59ed5cfcd30f610f1f64411"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.109"
+LINUX_VERSION ?= "6.6.110"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


