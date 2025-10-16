Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B929ACCD19E
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 03:08:54 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.4648.1760584132807632613
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 20:08:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NqE5MIRf;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-78ea15d3489so3457236d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 20:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760584132; x=1761188932; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i05Aju5yZhN4DWFC1b/Pg6oOYTWr7oMTkm63IcJQnD4=;
        b=NqE5MIRfsF91hrzkONahWm0XwjKqpA7l3vS2uUH0f61VzvLZKv+6SRfRDk6MLQG9Qx
         BDSTfvxrWyII3C+MCgFiLlRg+fo7h379z90bKLhKrW2EgilI+mEHSWbXNJ/PBgmtUA2r
         gy63Iui/zM+H99Dvk/jLDC5EHDNHPGdPfa6Guxn3UQMmQeOCXvIK9Xytf6xWhJeTbfLC
         Mva+hnIKOgEndOHWDpFeaGWNLlD4FWXhA/833Ri8uCatNilHZYSTdlIpBMu6VHKsQa8R
         28kuFnYWs6uHZ5Md3+13w+UnEQMRTgydTCErlrWXPTRbKmw5Z4eC+u0anYtCZUXwO/+O
         P2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760584132; x=1761188932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i05Aju5yZhN4DWFC1b/Pg6oOYTWr7oMTkm63IcJQnD4=;
        b=eZ+QCAiMz1ik4w9gPD4irJbhejAMCQtWYeGfRu9ks8q7yRCAQRVop5ZCAa9xwDeZhK
         dagoEuUMw1OZEuQO3kXy3lKC1cDGgwE5CgxEroMvjJn6NFsvnO4b6mwjSikpsAa3Ic2p
         hJQHSWMeR7xN5k5WkliPVf+XPfko3v/eb+dUtC3Otf3BeYYYJCTSeOPXTB9TvqTsc37Z
         BHzweAHZrtfnh9xKghbJlWXmhoXXlafoMu1503nZ2s25OzkwcLHaIf/xuhznbu6OjiMH
         HE4r/z2W3AYTC5A1P5Ijgw6NMv8ETJ3ZLGb6GNZtsxYGiHDhlHKA3R8ial9gJOo649ge
         b1og==
X-Gm-Message-State: AOJu0Yz8AiN7L6GpolO0dtFXRYbvyD9KRLxYOVcaTwXCf3hb0ybYlxuX
	EM5KhxDgn2ncFermO03uoFyy+XnN8gL6B24/bPll+eWk7MgPFC0fQgoxvAdIUW6wbG4=
X-Gm-Gg: ASbGncu5mIz0dl57G/hkMYMJwenAHFoqFNog0Eue1TujAv+HqbuMz6eCwSEO3M/ip3U
	RuJWec7f400ep6sDdJs0E+0JpiusO4gIRDNMZn86sb+ayVH2mfyBYEaSyu1rLDV5iAD2nqk8zB1
	5mBPJ6g8lyICFzVwrA9jMQRKL0lZAmmQrEnok333zPsN+3E9oEBe3XusdKG5d114L8X+VuWH+2r
	ILHcLKldzfRkS40P7m7owTe5PAPyGV2WS5pNdq8j9zMdiMzsAcc/GhIV8kNEFwE9pVwHCWQTeqp
	DwR2gwSIOGxcUaY7B+7b0Jrvf/vDysNwfJ5+QaRtgc9Zt36IE4BJ0ygXJvv+ChU0CYmip4nQqIM
	yOcpLGvupSCndNkLVu15RS8Iga6NuLvuJ5N4SC2cmSGFZL0/H6yk/jUUKd9OyvRvhzROCMawjG5
	Owv2EdkCIjDqi1XvGVEC0IrO4fKB0zLdEWD4F4omM6yyuzeALZV6wn0ajB8/cbIAVUKn6N0Lcbk
	RSM0cKM/uE8B8ZjeQbM+jUgOg==
X-Google-Smtp-Source: AGHT+IESL7OXwJkCQ+z61V9e4mLltucHJyal+zzCQZn3MYGfbE3ZX6+alaTrbT0iJbbopn9QAbIhVw==
X-Received: by 2002:a05:6214:e4a:b0:87a:a83:e706 with SMTP id 6a1803df08f44-87b21015289mr434339956d6.14.1760584131655;
        Wed, 15 Oct 2025 20:08:51 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c012a39d9sm30824986d6.44.2025.10.15.20.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 20:08:51 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/11] linux-yocto/6.12: update to v6.12.51
Date: Wed, 15 Oct 2025 23:08:38 -0400
Message-Id: <e1329420d547c1350eed5ed9781fc4a60ddf9fcf.1760583881.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1760583881.git.bruce.ashfield@gmail.com>
References: <cover.1760583881.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 03:08:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224920

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    a9152eb181ad Linux 6.12.51
    4dda55d04caa ASoC: qcom: audioreach: fix potential null pointer dereference
    1f52119809b7 wifi: ath11k: fix NULL dereference in ath11k_qmi_m3_load()
    4e5f060d7347 mm: swap: check for stable address space before operating on the VMA
    000b2a6bed7f media: uvcvideo: Mark invalid entities with id UVC_INVALID_ENTITY_ID
    fd5d3e6b149e media: rc: fix races with imon_disconnect()
    effb1c19583b media: tuner: xc5000: Fix use-after-free in xc5000_release
    514a519baa9e media: b2c2: Fix use-after-free causing by irq_check_work in flexcop_pci_remove
    53c6351597e6 scsi: target: target_core_configfs: Add length check to avoid buffer overflow
    fc998bccee32 gcc-plugins: Remove TODO_verify_il for GCC >= 16
    70165dc3ec8c crypto: sha256 - fix crash at kexec

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 8d6efadf58..0128e62152 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b4f5907de1e85e0f945b658dac152de95e615377"
-SRCREV_meta ?= "39c7e069b8475a8751d1a584a6181e072033f25d"
+SRCREV_machine ?= "02092ef333fa4503bc6da5f7d1f1eda2dee9c9d7"
+SRCREV_meta ?= "5f4ac28eb4130083ed7214f9bdedd4ee230af1a2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.50"
+LINUX_VERSION ?= "6.12.51"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index f920dd4f21..0cd6e9b99b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.50"
+LINUX_VERSION ?= "6.12.51"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "258800fd1696b1a356a754fcef83cbfdee399ae1"
-SRCREV_meta ?= "39c7e069b8475a8751d1a584a6181e072033f25d"
+SRCREV_machine ?= "d12617f73759e07b81f95e6451e212e21dcd3230"
+SRCREV_meta ?= "5f4ac28eb4130083ed7214f9bdedd4ee230af1a2"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index fd98ab0fe3..620e46b250 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "a0a67cc2a9c525cdbbee0a53396d6260a25839c2"
-SRCREV_machine:qemuarm64 ?= "258800fd1696b1a356a754fcef83cbfdee399ae1"
-SRCREV_machine:qemuloongarch64 ?= "258800fd1696b1a356a754fcef83cbfdee399ae1"
-SRCREV_machine:qemumips ?= "be1da28e2e753af1c661bad7982eb8bc29c885d8"
-SRCREV_machine:qemuppc ?= "258800fd1696b1a356a754fcef83cbfdee399ae1"
-SRCREV_machine:qemuriscv64 ?= "258800fd1696b1a356a754fcef83cbfdee399ae1"
-SRCREV_machine:qemuriscv32 ?= "258800fd1696b1a356a754fcef83cbfdee399ae1"
-SRCREV_machine:qemux86 ?= "258800fd1696b1a356a754fcef83cbfdee399ae1"
-SRCREV_machine:qemux86-64 ?= "258800fd1696b1a356a754fcef83cbfdee399ae1"
-SRCREV_machine:qemumips64 ?= "cf66b7844c1b375a1b473f21ea920cccc9f692aa"
-SRCREV_machine ?= "258800fd1696b1a356a754fcef83cbfdee399ae1"
-SRCREV_meta ?= "39c7e069b8475a8751d1a584a6181e072033f25d"
+SRCREV_machine:qemuarm ?= "21e7e89f6bbcaec3d70000333004e47031246bfd"
+SRCREV_machine:qemuarm64 ?= "d12617f73759e07b81f95e6451e212e21dcd3230"
+SRCREV_machine:qemuloongarch64 ?= "d12617f73759e07b81f95e6451e212e21dcd3230"
+SRCREV_machine:qemumips ?= "64965a9f8fd95a53788b1ed6c275056ef6be9510"
+SRCREV_machine:qemuppc ?= "d12617f73759e07b81f95e6451e212e21dcd3230"
+SRCREV_machine:qemuriscv64 ?= "d12617f73759e07b81f95e6451e212e21dcd3230"
+SRCREV_machine:qemuriscv32 ?= "d12617f73759e07b81f95e6451e212e21dcd3230"
+SRCREV_machine:qemux86 ?= "d12617f73759e07b81f95e6451e212e21dcd3230"
+SRCREV_machine:qemux86-64 ?= "d12617f73759e07b81f95e6451e212e21dcd3230"
+SRCREV_machine:qemumips64 ?= "5298636e61f0c9d939f79cee4d48e9013aceeaef"
+SRCREV_machine ?= "d12617f73759e07b81f95e6451e212e21dcd3230"
+SRCREV_meta ?= "5f4ac28eb4130083ed7214f9bdedd4ee230af1a2"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "da274362a7bd9ab3a6e46d15945029145ebce672"
+SRCREV_machine:class-devupstream ?= "72b82d56b82137a92a20e5584029d35408d810c2"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.50"
+LINUX_VERSION ?= "6.12.51"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


