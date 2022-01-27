Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE781C433F5
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 03:55:42 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web09.23802.1643255741935075968
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 19:55:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gRWt3edJ;
 spf=pass (domain: gmail.com, ip: 209.85.222.175,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id q189so1511508qkf.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 19:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MzoKou3LROlK6aSbvVAY4je4ykNINa+1MG3PR8jO2MQ=;
        b=gRWt3edJDcDIYSDcI5ZmqCOSOLEOjEFwsiW6be86okZ4/jLsYF3+hl4vrW+aI5BJT2
         R+7IpVJn7FLwcYc1VFbQDpQaYW/St10x3GyAu7m8cHenqYYV5gMHquDd9INN9b84bUcP
         0I+hh0blR1qqXYgO1xW0zh9UHaRKIknhzE7z0Bs+OX1XbSyraZdklGFp6JfSbr0iZ2vK
         xSSLczPVuJpcy00l/3KDR27/WJ50xvGmnk58ebrq7JQ/D573ZM+Z3zR2/z3s9ovNpOgS
         9UQHN8PHgo4hxOpYsYgka71xloUQq69qaX76vV/MDXJZ8V/A4FaxUIYartPlGqdbJ0lq
         eBKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MzoKou3LROlK6aSbvVAY4je4ykNINa+1MG3PR8jO2MQ=;
        b=hOjWgJtMSreqHuOLK/67k1c1TW+uk8ZhzJF6i3Pdncd3L5kE8GbhW6wDMa4apIg9bl
         nt4EYKGfVMi7uSC15HqyDUjbya5wDmdroHAiTVYhPwPHPq6S5PRRIevqgd0Qn+bBz4gd
         GmyEY2MqeDbCv8yd2eVNRNVcpYQ4tM6GmbdjQ7/TED/UajIE7bqHJP47awPpDVbG3epv
         2mAfNsG1mr6Q3MbJDwX29h5HoOxoHlsd6lKD53sVuDgKkjQfhT42aFspH180T6pK5EHU
         ROljFSax1xXMqgGzqlbs17MYMFt++dV+k+QKZLOnchTYsvGi/YqSPSurm7ViBJpZ6s7H
         LH9A==
X-Gm-Message-State: AOAM531U/Z0eICswWQRCEc45UqJ9N77zzBPyRnag83BGt8K+exuCtMqc
	phQcgglpl+2ULX0x99GWjmqHbCUpeBo1Hg==
X-Google-Smtp-Source: 
 ABdhPJyLqUl09/NylntkLgJNWGJH6EnqglLarkaPqeWruPpoa/G+DNjb2skd+j7INo0Y4JhDk63xkA==
X-Received: by 2002:a37:9ed7:: with SMTP id
 h206mr1315677qke.723.1643255741038;
        Wed, 26 Jan 2022 19:55:41 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id m6sm639405qti.85.2022.01.26.19.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 19:55:40 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] x86: fix defconfig configuration warnings
Date: Wed, 26 Jan 2022 22:55:32 -0500
Message-Id: 
 <036ce89c5b83ec07bf9428a352720ae109dbd2a6.1643255467.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1643255467.git.bruce.ashfield@gmail.com>
References: <cover.1643255467.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 03:55:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161000

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    720b61fc400b x86_64_defconfig: Fix warnings

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 22 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index c4ab573524..8b0b5b0931 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "777a9b34fb8c964fb6b69f787fe3bbdfd0adb37b"
-SRCREV_meta ?= "0255d115fd41140e340604d0203e14d8095b176a"
+SRCREV_machine ?= "d10340bf85a641be37765a0a8c0d64af0139c69f"
+SRCREV_meta ?= "91c0a39cfecc9f88f12308acbb2d5f3e4d836852"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index bd3fb3bf50..c944470eba 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "72627ebc46d5883cf76a3e03beabe8b108e04047"
-SRCREV_machine ?= "3f365e00205a8bb6d2161c55d6ad93139fc6279e"
-SRCREV_meta ?= "0255d115fd41140e340604d0203e14d8095b176a"
+SRCREV_machine:qemuarm ?= "959e4fa00d69b9a33e51aedc4d1a9d18a605e3c2"
+SRCREV_machine ?= "720b61fc400b51918b8ae95d0fd0e79256214d78"
+SRCREV_meta ?= "91c0a39cfecc9f88f12308acbb2d5f3e4d836852"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 5843aff5f8..9b606bdfe7 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "d685426cf1b93301b84f6b3dbc991f597fd706ab"
-SRCREV_machine:qemuarm64 ?= "3f365e00205a8bb6d2161c55d6ad93139fc6279e"
-SRCREV_machine:qemumips ?= "6ff6cd4991c2d99a4814dc6ad054efef7a04d63e"
-SRCREV_machine:qemuppc ?= "3f365e00205a8bb6d2161c55d6ad93139fc6279e"
-SRCREV_machine:qemuriscv64 ?= "3f365e00205a8bb6d2161c55d6ad93139fc6279e"
-SRCREV_machine:qemuriscv32 ?= "3f365e00205a8bb6d2161c55d6ad93139fc6279e"
-SRCREV_machine:qemux86 ?= "3f365e00205a8bb6d2161c55d6ad93139fc6279e"
-SRCREV_machine:qemux86-64 ?= "3f365e00205a8bb6d2161c55d6ad93139fc6279e"
-SRCREV_machine:qemumips64 ?= "b9298c1913cfa71d93adb1da7aec3af9e11c9de0"
-SRCREV_machine ?= "3f365e00205a8bb6d2161c55d6ad93139fc6279e"
-SRCREV_meta ?= "0255d115fd41140e340604d0203e14d8095b176a"
+SRCREV_machine:qemuarm ?= "8877f633dc88af575ba57c3c7d2e62e479430306"
+SRCREV_machine:qemuarm64 ?= "720b61fc400b51918b8ae95d0fd0e79256214d78"
+SRCREV_machine:qemumips ?= "d89783603e405b35e8cda7d8762401a751dbd216"
+SRCREV_machine:qemuppc ?= "720b61fc400b51918b8ae95d0fd0e79256214d78"
+SRCREV_machine:qemuriscv64 ?= "720b61fc400b51918b8ae95d0fd0e79256214d78"
+SRCREV_machine:qemuriscv32 ?= "720b61fc400b51918b8ae95d0fd0e79256214d78"
+SRCREV_machine:qemux86 ?= "720b61fc400b51918b8ae95d0fd0e79256214d78"
+SRCREV_machine:qemux86-64 ?= "720b61fc400b51918b8ae95d0fd0e79256214d78"
+SRCREV_machine:qemumips64 ?= "70ec3b7566512fb11e08613a8a2b5051a1f79dc3"
+SRCREV_machine ?= "720b61fc400b51918b8ae95d0fd0e79256214d78"
+SRCREV_meta ?= "91c0a39cfecc9f88f12308acbb2d5f3e4d836852"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.19.1


