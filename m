Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 679CDC47079
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 13:51:52 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.54255.1704376307845935274
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jan 2024 05:51:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bj8A+wHb;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-67f8d9fe99fso2437586d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 05:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704376307; x=1704981107; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5P5pmACapEieHmxYFt+g0JS+CCpaXi22Eu/7124QHx8=;
        b=Bj8A+wHb5So45EYGoI928VKogU9SXGT0FAZ4KR9OkgD6ryTk7cHZ3EToRphoPEemKW
         DWXHMlwbRcqsDWl2Zmgm2wGzqz1hotGyZ3j9F+4ZOFaudTxJADYW3n+laoq62S7BlZ1W
         gLN7xIWoRw7bnEdvkOrHsIpYhaGxGM5eaQlSEZTXAjs/+ss7lffBF1naQGF72D5Ziq0r
         GO5IPCziv4e+rB+m6O3BXpWVxrCDN/Jpcz9qZoIEsyZUvUepqMfr+aSNehuBRILDX9LL
         rON6LDhvWvPEdQdE5myw9ZHLgAaMtaS1AiwE/bwtX7svRmG6TM8g8alRbgw2MMidovPV
         V5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704376307; x=1704981107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5P5pmACapEieHmxYFt+g0JS+CCpaXi22Eu/7124QHx8=;
        b=S/OsVBI26GrlVrsU86xQKXvmbdcboO+D89+VFovtXf9B7PAkE1VEnQ2gJblYwiZZF0
         biedZZdxKszhxVWkcS6DwRPaNNzz6d8UQsFUuJmPGjwmkYJQM+w24SFyZvEVyegC6EF0
         LiKfovHB3C+NEhYLh40yecC+JlQy5e20TBBWivz+/pfZtfR4ymu8FBZ+6PTJOHFN4hAx
         sjTOCs4wdqUIgEyyjBk6Rk0FK3CZ5PYecZE/EB1EClAJ4e29Vdu4SQ1xy/l61ze01H5M
         2iAqlIaIXRGZZr3ZLm4odi1uhaRC2SRNJ8WejHVcPjTgBD0suMZ8lUecGA0ueZiSuxpz
         O4TQ==
X-Gm-Message-State: AOJu0YyIbiRkl5aeKeIqpWxiSyqcPSRQuS4c1g7Pri1+i90iYkTZfF/A
	110yOlqFYfVkEwr77rU9uH0=
X-Google-Smtp-Source: AGHT+IFsjpOJtXpC8yDvvTLhzpyZnyFkZriXaDyn0w+wgg3xZ+vQ/3yiAgS/5uVzPLpWQxN2L/RI5Q==
X-Received: by 2002:a05:6214:d4c:b0:67f:26c6:8673 with SMTP id 12-20020a0562140d4c00b0067f26c68673mr692870qvr.23.1704376306885;
        Thu, 04 Jan 2024 05:51:46 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id d5-20020a056214184500b0067f9ab3564asm10573762qvy.68.2024.01.04.05.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 05:51:46 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	ross.burton@arm.com
Subject: [PATCH] linux-yocto/6.6: ARM fix configuration audit warning
Date: Thu,  4 Jan 2024 08:51:45 -0500
Message-Id: <20240104135145.2783799-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 13:51:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193324

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.6:

1/1 [
    Author: Ross Burton
    Email: ross.burton@arm.com
    Subject: arm64: defconfig: remove CONFIG_IPQ_APSS_5018
    Date: Thu, 4 Jan 2024 13:32:41 +0000

    This was added in 7f0c873 ("Enable IPQ5018 SoC base configs"), but there
    is no IPQ_APSS_5018 config defined in the kconfig at present.

    Signed-off-by: Ross Burton <ross.burton@arm.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  2 +-
 .../linux/linux-yocto-tiny_6.6.bb             |  2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 22 +++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index bcbae7eaf5..05a6b5f1d4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,7 +14,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "64c1e51bd051a3d0b32c60467dc14bc91bc9843e"
+SRCREV_machine ?= "bfa11b7b82a8d7a3c3f5a30813a8471be20449ab"
 SRCREV_meta ?= "11390e802ca72f3549b9356f036b17e54afd7a34"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 967dbf416e..372a8e962f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -17,7 +17,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "5e949786d5c5773a0190173ceaf94389473c4c1c"
+SRCREV_machine ?= "50cd24ddb6f0bcae01623196515ce62527bb79df"
 SRCREV_meta ?= "11390e802ca72f3549b9356f036b17e54afd7a34"
 
 PV = "${LINUX_VERSION}+git"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index fef50115f9..969cbb8c26 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,17 +18,17 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "8c0080efa9a63d92f659ec2f59d38ae1f71c978c"
-SRCREV_machine:qemuarm64 ?= "5e949786d5c5773a0190173ceaf94389473c4c1c"
-SRCREV_machine:qemuloongarch64 ?= "5e949786d5c5773a0190173ceaf94389473c4c1c"
-SRCREV_machine:qemumips ?= "e2e849be624df1176eb93a01fbecb9b92840f1c1"
-SRCREV_machine:qemuppc ?= "5e949786d5c5773a0190173ceaf94389473c4c1c"
-SRCREV_machine:qemuriscv64 ?= "5e949786d5c5773a0190173ceaf94389473c4c1c"
-SRCREV_machine:qemuriscv32 ?= "5e949786d5c5773a0190173ceaf94389473c4c1c"
-SRCREV_machine:qemux86 ?= "5e949786d5c5773a0190173ceaf94389473c4c1c"
-SRCREV_machine:qemux86-64 ?= "5e949786d5c5773a0190173ceaf94389473c4c1c"
-SRCREV_machine:qemumips64 ?= "063b264513be2b44ffa73302bde705ea4a607d1c"
-SRCREV_machine ?= "5e949786d5c5773a0190173ceaf94389473c4c1c"
+SRCREV_machine:qemuarm ?= "30f04f32ffa4d5082530a2ce565387c09a98086d"
+SRCREV_machine:qemuarm64 ?= "50cd24ddb6f0bcae01623196515ce62527bb79df"
+SRCREV_machine:qemuloongarch64 ?= "50cd24ddb6f0bcae01623196515ce62527bb79df"
+SRCREV_machine:qemumips ?= "382508b55bd871d9a81ab6d187abed39e59b277e"
+SRCREV_machine:qemuppc ?= "50cd24ddb6f0bcae01623196515ce62527bb79df"
+SRCREV_machine:qemuriscv64 ?= "50cd24ddb6f0bcae01623196515ce62527bb79df"
+SRCREV_machine:qemuriscv32 ?= "50cd24ddb6f0bcae01623196515ce62527bb79df"
+SRCREV_machine:qemux86 ?= "50cd24ddb6f0bcae01623196515ce62527bb79df"
+SRCREV_machine:qemux86-64 ?= "50cd24ddb6f0bcae01623196515ce62527bb79df"
+SRCREV_machine:qemumips64 ?= "90d9017819a05360dbf3fd2f6471cbbb3fe78db5"
+SRCREV_machine ?= "50cd24ddb6f0bcae01623196515ce62527bb79df"
 SRCREV_meta ?= "11390e802ca72f3549b9356f036b17e54afd7a34"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.39.2


