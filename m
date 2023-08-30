Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 000F2C83F17
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 17:48:59 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.1278.1693417734020192340
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 10:48:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0lo7Q99H;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-68a3cae6d94so5032168b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 10:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1693417733; x=1694022533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aI1KsZ+zkBB44sALN0KU6Y/ttWD5CxjDxiw/nSPQaKY=;
        b=0lo7Q99HRe0OmqVW8dGqc5V6t69/qyIb5xCabJA1bfkOZi22FOPKvYNjeldbAXpoO+
         m1x0+oYh0382AkCstNBlYM3wAU3Ib2PB8vrg4lZIoTciXmjdlkvhmRMHLf5zM1QnMokE
         m2aGeceUu16EjQI/IJdXe0gMsGfZNCN6ahIB6bbpxqXrAwQ3H39WJiYNk0xgkwhUPSJe
         pjzCNhwZlqKBaKVQgOcG1zGPFqBFEWgjCkUNywX1TC7yCJxkTlF+NVaBW40tzlPlbCXA
         cfPaJrrr2WxH28NDbgb58KIzqBbboLxLiPqnzbHhbA7aSUnuAhEj9zoBK+6sygbKAv+p
         eutg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693417733; x=1694022533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aI1KsZ+zkBB44sALN0KU6Y/ttWD5CxjDxiw/nSPQaKY=;
        b=lMB5rafYbz7U5RkCik6X70rAEDfkV9b3AwrrcRinhOHrRQXG6+MOyVfFr+eUkMj/Nw
         C9VeSL46jAzK3J8k/vlhgFK+sXxS3ofTR4bD6QN/9GBBJnqgnU1EL1bZXYeGpTtfdmgg
         dfI3OE0Xdb5Bg4NgcPbz6UPEZtEMqUuwmJXDhD/muiAbCgcMpqmrAJiMqIIbpZ54EeWw
         TIANSy2YCa9V7zsCFCMD6HIdLpNqlIl9aBZtLPamOKxAjo4Z3VXzh8Ks+i919NsiW7IB
         r12nNOheY7eDQpaDB+1B/3Y5F1XK0Cwyb+UTy6Okz3qkngOzUQNCD26WOM3FCfgpQhkU
         5Eew==
X-Gm-Message-State: AOJu0YwZ0Ckc0zs/aarfIIuVCNv+lasKPWCWrAC0UWWP4+lAfDIncS/q
	tuKRnaJKjdxVbP5ThyMP+haPSF+pg40OSVrMdyE=
X-Google-Smtp-Source: AGHT+IHUwNN4NPxoTbnZZo25Pn0hKXVFL49TuEVjN2e2ONCHD7o3g/I99GriAprq6l+L03cT2U4bxg==
X-Received: by 2002:a05:6a00:1745:b0:68c:3f2:5ff7 with SMTP id j5-20020a056a00174500b0068c03f25ff7mr3362476pfc.1.1693417733035;
        Wed, 30 Aug 2023 10:48:53 -0700 (PDT)
Received: from xps13.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id fm14-20020a056a002f8e00b006889348ba6dsm10567578pfb.93.2023.08.30.10.48.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 10:48:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 10/20] linux-yocto/6.1: fix uninitialized read in nohz_full/isolcpus setup
Date: Wed, 30 Aug 2023 07:48:14 -1000
Message-Id: <5caea18a41d184c15e0685191364eb659a84ee59.1693417541.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693417541.git.steve@sakoman.com>
References: <cover.1693417541.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 17:48:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186912

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

(From OE-Core rev: 4b349ee66eab8ebe3150ac4c1b449ea5c264a5be)

Signed-off-by: Adrian Cinal <adriancinal1@gmail.com>
Acked-by: Paul Gortmaker <paul.gortmaker@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 92642acd1166b7990fb520337b78a4d37ce7cbe4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index bafb8fca7f..4d3fbba9c6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -17,18 +17,18 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
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


