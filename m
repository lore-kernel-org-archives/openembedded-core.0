Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43498EE4996
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 15:44:57 +0000 (UTC)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
 by mx.groups.io with SMTP id smtpd.web10.296.1692632693696018655
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 08:44:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=M4/H7K1x;
 spf=pass (domain: gmail.com, ip: 209.85.222.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-799761430c2so1052301241.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 08:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692632693; x=1693237493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fi+FyniP7a826Pj6AIvB3q04XSVzYRbr/tFD13gDVo0=;
        b=M4/H7K1xthFwvKWYaQSDh1zOi/8Y2DpY8whLhjzljffp19+jGaH9dQmYGFtqIEiOrY
         kqjMRlQrhFWLCTSK9su8fSmw67D+oYWFDAzorzi+hmE5ceP43e3gRa/7DyqewZ6Of1VH
         s2CQcjP9ZkHmWjmanAVTMSH0gS9kn931SPEhR7XbRde3PJcPk8fRdrgfpD5yxFh0XeMX
         E+KT0MrniMvOpv4hUvllmFWHVanT8bKOvQjqkTRtXD27wFwPqwsLZ/bl4w5UepLZXTTr
         2HcYnyBW1fwdnTC3VK50yzNvMn5ccxgV1420UgA7byZJ+HXMZUTNNH1kn6x9JxAZGpVI
         x7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692632693; x=1693237493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fi+FyniP7a826Pj6AIvB3q04XSVzYRbr/tFD13gDVo0=;
        b=fpOw3BsGJRfECTuO5I++6jpgyFoU6PHk5EYQs9IyNiYA8mdmCiNVypZkhu0XNl7wXx
         pyYB45J6M1Tb09BCcT3NFHTZvGLHyGYgUVlaVmhiqsIkyTygKyhOKuuyWdvWzMm1RZVd
         V3KFgMtUgkA7oqtGNIG2O5v1F6ADFk1y71Xaj0DLpZ5A2tqHErvZ9W+6BBfQt+m0BC1P
         vqGrm6PvOdd1+JVsBYgIZiq41XvTc/VGwiQ7UaVkAxu4qzx1UfzixrwO+zRkwkIpQkMu
         3qlHwUQXVgTqxIIhZpQNFNu5TE0WVvllJR73ywaq785k0DesZ6HXIllrtNiAaNXQNRD6
         H/Fg==
X-Gm-Message-State: AOJu0YyXlRt5yLs+pIi2cpj6kHiUBmU4fvcaui5qQmtdjX3pyxcrwWey
	M65Ii46yqgFcg2q6fVL6Eco=
X-Google-Smtp-Source: AGHT+IFYpfiCr40LgQhNPz7EAHKHoygrUYlmA6YX3syxlJlNl2yONsu9/7s9W5W3O9iqDfQ6fRgZqw==
X-Received: by 2002:a1f:4ec7:0:b0:486:e696:c69a with SMTP id c190-20020a1f4ec7000000b00486e696c69amr5321671vkb.16.1692632692645;
        Mon, 21 Aug 2023 08:44:52 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id w2-20020a0cb542000000b00647248b3615sm3030090qvd.4.2023.08.21.08.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 08:44:51 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/10] linux-yocto/6.1: fix uninitialized read in nohz_full/isolcpus setup
Date: Mon, 21 Aug 2023 11:44:40 -0400
Message-Id: <88bcfdbf46852535baf7118b66a153ffbfa38f8f.1692632563.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692632563.git.bruce.ashfield@gmail.com>
References: <cover.1692632563.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 15:44:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186455

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.1:

    4675ec8d0b9a kernel/sched: Fix uninitialized read in nohz_full/isolcpus setup

The carry forward of commit from the v5.15 linux-yocto kernel:

https://git.yoctoproject.org/linux-yocto/commit/?id=97c96388922

...in which case the sanity checks are properly *after* the allocation
and processing of the bootargs into the cpumask.

However, it seems patch (or wiggle?) apparently decided to put the
sanity checks *before* the population of the cpumask during the
carry-forward and generation of the new v6.1 kernel.  Meaning they are
validating uninitialized memory and hence nohz_full= and isolcpus= are
subject to random failures even for valid input ranges.

Signed-off-by: Adrian Cinal <adriancinal1@gmail.com>
Acked-by: Paul Gortmaker <paul.gortmaker@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  4 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 24 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 8e59cf937e..7b410df847 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,8 +14,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "0aa0b7396b5cbfccd69d23b07e095e4c4fa20589"
-SRCREV_meta ?= "8da434f09dc2892d8ec26325f0856aabccc17bed"
+SRCREV_machine ?= "57eb889d204238845f238b44db6affe64480b958"
+SRCREV_meta ?= "2e1a81f17434de2a9bd27676efdde7861946582e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index c0c93fd3da..a37da27401 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "fb0e7ef6dd4b51325abcaab53645962994018135"
-SRCREV_meta ?= "8da434f09dc2892d8ec26325f0856aabccc17bed"
+SRCREV_machine ?= "786775632028f7909d9f905c4530d7eaae0b2ab0"
+SRCREV_meta ?= "2e1a81f17434de2a9bd27676efdde7861946582e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index ce782677c5..a54e98ee92 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -18,18 +18,18 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "f009f4217b1b00e7de4fde7454a86ff5cc83ceef"
-SRCREV_machine:qemuarm64 ?= "fb0e7ef6dd4b51325abcaab53645962994018135"
-SRCREV_machine:qemuloongarch64 ?= "fb0e7ef6dd4b51325abcaab53645962994018135"
-SRCREV_machine:qemumips ?= "3db59f99ef5fddd5dc436d0e58bb9572051e08ed"
-SRCREV_machine:qemuppc ?= "fb0e7ef6dd4b51325abcaab53645962994018135"
-SRCREV_machine:qemuriscv64 ?= "fb0e7ef6dd4b51325abcaab53645962994018135"
-SRCREV_machine:qemuriscv32 ?= "fb0e7ef6dd4b51325abcaab53645962994018135"
-SRCREV_machine:qemux86 ?= "fb0e7ef6dd4b51325abcaab53645962994018135"
-SRCREV_machine:qemux86-64 ?= "fb0e7ef6dd4b51325abcaab53645962994018135"
-SRCREV_machine:qemumips64 ?= "173a48cfd962bf386bc591f1bb654d88d70cde6c"
-SRCREV_machine ?= "fb0e7ef6dd4b51325abcaab53645962994018135"
-SRCREV_meta ?= "8da434f09dc2892d8ec26325f0856aabccc17bed"
+SRCREV_machine:qemuarm ?= "df11584ee46919ffa45c33ba496754db47c59b66"
+SRCREV_machine:qemuarm64 ?= "786775632028f7909d9f905c4530d7eaae0b2ab0"
+SRCREV_machine:qemuloongarch64 ?= "786775632028f7909d9f905c4530d7eaae0b2ab0"
+SRCREV_machine:qemumips ?= "5d4417bb0ff0d6c89e41a694e20135e1dce778f3"
+SRCREV_machine:qemuppc ?= "786775632028f7909d9f905c4530d7eaae0b2ab0"
+SRCREV_machine:qemuriscv64 ?= "786775632028f7909d9f905c4530d7eaae0b2ab0"
+SRCREV_machine:qemuriscv32 ?= "786775632028f7909d9f905c4530d7eaae0b2ab0"
+SRCREV_machine:qemux86 ?= "786775632028f7909d9f905c4530d7eaae0b2ab0"
+SRCREV_machine:qemux86-64 ?= "786775632028f7909d9f905c4530d7eaae0b2ab0"
+SRCREV_machine:qemumips64 ?= "c2a60bb7b1739180481e1d7a7e87bb573aa01ae7"
+SRCREV_machine ?= "786775632028f7909d9f905c4530d7eaae0b2ab0"
+SRCREV_meta ?= "2e1a81f17434de2a9bd27676efdde7861946582e"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


