Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D18C001B1
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 02:30:14 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.7286.1687919412227288228
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 19:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=cxEP6Rj1;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.175, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-392116b8f31so3783477b6e.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 19:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687919411; x=1690511411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSRUTEUc/RyqdsonQyhbowbWMqUUgZQIVqLiZHwCvII=;
        b=cxEP6Rj11vh5986OgtZfIOzjfpd4YwZ8B7UgFtSzkrV0HxfeAxl5GVxFB/RvbhVXoS
         nN7OA4Hy8gJ2VzAzFYLBCcT3xcw6VemmI71Q+I5TYnaFarpnuZa6ugYJMdBnPuUiOh/E
         mFP0NziJLAc5rtSI3IX5hX6ub5NLL+C6wpsS0vfuT4T1EyHwME01i6CAfS6iY2TM8kN+
         S066MU9kVDinKfATRDy6ufuJNhw5/3muNzMsK8mnwPKCorSc8LFF9OvpiZCyKGfcG9uC
         t28q4hpFH1HBjIj+ufrpYSnv4g5vKp7XrC68kO+o3xYbNCOet1AlYRJsA26iqI60TkzD
         7UOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687919411; x=1690511411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rSRUTEUc/RyqdsonQyhbowbWMqUUgZQIVqLiZHwCvII=;
        b=RUEpJXIBHuYgKB4KlTweMnFT8AinQXGdemG9h0L5x6iuzp9WHl4pgOH/eOfkf/xc8N
         WjXx+pmKl1rDypEt5QhWRZMQ/A/doSV1BzVI3r3Y4uEualqxcMfVemPZLqptw6bNUuMh
         0NdkkiX4Zkz3oK4qdTDdAGrq8sIY7QWOy3IFO90qWsr65WUb5/Rz1kFTbU3+s0kHDCtO
         3cJh+1kI9R+yW4hEF7RgjYgs0tIU/K+Bb0F1BG8a9wgECjiZy8hh+K4ZcRgMCk9+GPIy
         k4MIUhhLGLMrVZeOv+x1xLueWDvf6HOItYqKKxE4E09tstkqLqmiO4QLnyum/r1Qn3Fb
         M0AQ==
X-Gm-Message-State: AC+VfDyQIuYdZ0uUfZf/FV4+eta1koW5maJuyRLkyzskIKsfmIWNUfDI
	13dEtYew1Z5+oYQDJ4CoblL+ERI6v/fCwrMtDhMgMA==
X-Google-Smtp-Source: ACHHUZ4QmM7MvWVvMLMlXhmARkvzxdab6dDhzXorHBZxeQFHDlgadqT+ujwj4fJNTtADICMRayetUQ==
X-Received: by 2002:a05:6359:2e93:b0:133:e286:9259 with SMTP id rp19-20020a0563592e9300b00133e2869259mr5806679rwb.17.1687919410793;
        Tue, 27 Jun 2023 19:30:10 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c18-20020a62e812000000b0063d2d9990ecsm1568666pfi.87.2023.06.27.19.30.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 19:30:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 10/30] linux-yocto/6.1: fix intermittent x86 boot hangs
Date: Tue, 27 Jun 2023 16:29:26 -1000
Message-Id: <10e7c5c2aadbc14b9ec56322595826707bb92316.1687919241.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687919241.git.steve@sakoman.com>
References: <cover.1687919241.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 02:30:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183519

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The commit in question appeared as -stable backport in 6.1.28, which is
where we started to see intermittent boot hangs on x86.

Richard noted that others are seeing this is well, as can be seen in
this thread:

    https://lkml.org/lkml/2023/6/13/1460

We bump our SRCREVs to pick up the revert:

    947f660bde07 Revert "tick/common: Align tick period with the HZ tick."

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 73b7f36e51de39ed19dfd3cd253be1876db60ca4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  4 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 24 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 4a2a3ca4ab..1033d307f4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,8 +14,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6871194107bd40397162bfca0a9ef06661057c50"
-SRCREV_meta ?= "1dd270d3231f82d94d2123b95e4eb576019440a3"
+SRCREV_machine ?= "2993cbe41f0f859331c81d6ec8001b094f53cb9e"
+SRCREV_meta ?= "db25e51e2006721528f5e7bcd8f4501592bd74fe"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index bfc1c7652c..2be9eb9c36 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "6034b10d39687bbd6769e4adb2a792524e6b4f16"
-SRCREV_meta ?= "1dd270d3231f82d94d2123b95e4eb576019440a3"
+SRCREV_machine ?= "947f660bde07ee4111bc96d08b142a6ce3753d38"
+SRCREV_meta ?= "db25e51e2006721528f5e7bcd8f4501592bd74fe"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 9bcf6b5de6..3645932520 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -17,18 +17,18 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "cff918ff5ee0001dec6493620535d8804f02cd8b"
-SRCREV_machine:qemuarm64 ?= "6034b10d39687bbd6769e4adb2a792524e6b4f16"
-SRCREV_machine:qemuloongarch64 ?= "6034b10d39687bbd6769e4adb2a792524e6b4f16"
-SRCREV_machine:qemumips ?= "7a59adc4cd39bea852101be2873855cfc835ef45"
-SRCREV_machine:qemuppc ?= "6034b10d39687bbd6769e4adb2a792524e6b4f16"
-SRCREV_machine:qemuriscv64 ?= "6034b10d39687bbd6769e4adb2a792524e6b4f16"
-SRCREV_machine:qemuriscv32 ?= "6034b10d39687bbd6769e4adb2a792524e6b4f16"
-SRCREV_machine:qemux86 ?= "6034b10d39687bbd6769e4adb2a792524e6b4f16"
-SRCREV_machine:qemux86-64 ?= "6034b10d39687bbd6769e4adb2a792524e6b4f16"
-SRCREV_machine:qemumips64 ?= "273e099163a72247262a495cb73889d2e0ed6d2c"
-SRCREV_machine ?= "6034b10d39687bbd6769e4adb2a792524e6b4f16"
-SRCREV_meta ?= "1dd270d3231f82d94d2123b95e4eb576019440a3"
+SRCREV_machine:qemuarm ?= "93797f49c15b6ce9656a607626437e76a3b6c6da"
+SRCREV_machine:qemuarm64 ?= "947f660bde07ee4111bc96d08b142a6ce3753d38"
+SRCREV_machine:qemuloongarch64 ?= "947f660bde07ee4111bc96d08b142a6ce3753d38"
+SRCREV_machine:qemumips ?= "1279631d08d52a5b20044404da4b01205ba4b725"
+SRCREV_machine:qemuppc ?= "947f660bde07ee4111bc96d08b142a6ce3753d38"
+SRCREV_machine:qemuriscv64 ?= "947f660bde07ee4111bc96d08b142a6ce3753d38"
+SRCREV_machine:qemuriscv32 ?= "947f660bde07ee4111bc96d08b142a6ce3753d38"
+SRCREV_machine:qemux86 ?= "947f660bde07ee4111bc96d08b142a6ce3753d38"
+SRCREV_machine:qemux86-64 ?= "947f660bde07ee4111bc96d08b142a6ce3753d38"
+SRCREV_machine:qemumips64 ?= "3b25f845f704021fbe223ef48ab22ff5fa3886b9"
+SRCREV_machine ?= "947f660bde07ee4111bc96d08b142a6ce3753d38"
+SRCREV_meta ?= "db25e51e2006721528f5e7bcd8f4501592bd74fe"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


