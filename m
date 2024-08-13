Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFEF4C52D7D
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 19:58:05 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web10.81607.1723579077276982354
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 12:57:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QX3dzqNX;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dfe43dca3bfso5166462276.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 12:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723579076; x=1724183876; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AW3FK5wa6Eg7TKbu+olY1+yfreu1kFudtAhRKQCvY3M=;
        b=QX3dzqNX333bmcn3yZu6wInYv9clKfrwuEaSkK15wXPVE2fen6XwUzQ3xn5+8/02Zm
         tgDqe1/z0C95vkRbp6FoHURaf+Q+1BieYGiHTMT110p8G+hYHBmo0YbleCA+2eCxW1gx
         mZmVwbhtI8CGreYXMR/6/147gAU615hhX0U+z/8TvI9J2GaWpm2s8Ax/XUBicqwWdTkZ
         Tc0QNSXLlwW6H3YzcKJde9X53SIBOISk3FcFGee5zJlyTOomV9sZyFtJIod+xheYkxtq
         6Gz0Gbtp1XZRZxFwT+bo+Ka8gpHCtjN74Tg0VN5Ci+hGC0ItbfktRxpkldgNr67Ptd+r
         F+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723579076; x=1724183876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AW3FK5wa6Eg7TKbu+olY1+yfreu1kFudtAhRKQCvY3M=;
        b=w4bbHmXJy2yiIAuo6HcgUvxIo5g6KPZU/nSHKHGpl5CW2xyo8/26ifmn0JAtQG2Dmv
         k0xkP2l3k3ftgRbqBCoHSSuBRkkQyrIWP/L8s33yg8jkcHlOs2OOiXLw0o1p70Z/035L
         uDQ1kIoGCh08646Ii0MqPx8wE4EeFBytTTML3EHRUWyA0KVjYpAhzLJl//YxUbnZWGfs
         bx6Ri4LGuiRAuuqgMXrV1WVNudD+aopsICdqmkqrixt4HzmYNdjytLLvkQXvS50PHTuK
         OWoafZuTjog+bSUWXBsqSPfjIBRMOUh6lQQWyBHe0mhOa3irV56PUTqz4wJjcf/pngBJ
         ZVug==
X-Forwarded-Encrypted: i=1; AJvYcCVvjUYuDX1lKgiWzIySh0c3UNd2/eWKuoFZi14AtZ3ijYD5zxCSEANdD/nsWUY1hwaIEFbYsc4f8TCQLIQhaq8oUFluhm1CaqfZUM4XaIWcBSr4+UHzXN/p
X-Gm-Message-State: AOJu0Yxlx38WngJkXxcCwRsQMIl7OtBjueW9dm1vP25JIz7uW8tOpEbB
	I310K+iLYvI2ZbrlRpGF2gQkAC0z5/ysPxyNee0WZWMaLnFZOp0n
X-Google-Smtp-Source: AGHT+IE15OXKYEIEFXnwVvQjHkS0zoXMWSDxtCpMnH3vV8XfL+kFwVF7bMkOiDS6IigETVMQSw8FhQ==
X-Received: by 2002:a05:6902:908:b0:e03:63c7:7b46 with SMTP id 3f1490d57ef6-e1155ab3375mr659295276.20.1723579076121;
        Tue, 13 Aug 2024 12:57:56 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bd82ca1453sm36652796d6.63.2024.08.13.12.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 12:57:55 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: Jon.Mason@arm.com,
	openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-yocto/6.6: fix genericarm64 config warning
Date: Tue, 13 Aug 2024 15:57:52 -0400
Message-Id: <20240813195753.576442-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240813195753.576442-1-bruce.ashfield@gmail.com>
References: <20240813195753.576442-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 19:58:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203291

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: genericarm64: drop CONFIG_MTD_NAND_FSL_IFC
    Date: Tue, 13 Aug 2024 15:17:10 -0400

    We are getting the following warning in recent 6.6+ kernels:

        WARNING: linux-yocto-6.6.45+git-r0 do_kernel_configcheck: [kernel config]: specified values did not make it into the kernel's final configuration:

        [NOTE]: 'CONFIG_MTD_NAND_FSL_IFC' last val (y) and .config val (n) do not match
        [INFO]: CONFIG_MTD_NAND_FSL_IFC : n
        [INFO]: raw config text:

            config MTD_NAND_FSL_IFC
                    tristate "Freescale IFC NAND controller"
                    depends on (FSL_SOC || ARCH_LAYERSCAPE || SOC_LS1021A || COMPILE_TEST) && HAS_IOMEM && FSL_IFC && MTD_RAW_NAND && MTD
                    help
                      Various Freescale chips e.g P1010, include a NAND Flash machine
                      with built-in hardware ECC capabilities.
                      Enabling this option will enable you to use this to control
                      external NAND devices.

            Config 'MTD_NAND_FSL_IFC' has the following Direct dependencies (MTD_NAND_FSL_IFC=n):
                    FSL_SOC(undefined/n) || ARCH_LAYERSCAPE(=y) || SOC_LS1021A(undefined/n) || COMPILE_TEST(=n) (=y) && HAS_IOMEM(=y) && FSL_IFC(=n) && MTD_RAW_NAND(=y) && MTD(=y)
            Parent dependencies are:
                 SOC_LS1021A [SOC_LS1021A] MTD [y] ARCH_LAYERSCAPE [y] HAS_IOMEM [y] FSL_SOC [FSL_SOC] COMPILE_TEST [n] MTD_RAW_NAND [y] FSL_IFC [n]
        [INFO]: config 'CONFIG_MTD_NAND_FSL_IFC' was set, but it wasn't assignable, check (parent) dependencies

    The most significant missing option that is disabling this config value
    is FSL_SOC, which is only defined in arch/powerpc.

    As such, there's no sense keeping this option in the genericarm64 config
    as it is only enabled via arch/powerpc.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

Jon,

Let me know if these seems ok to you.

Bruce

 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index ae56e8a129..c3b4fc1e9b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "9a1d7ebfd75c70dcec660e18124a37de469e68b4"
-SRCREV_meta ?= "e55e4407942bae43ef8ba463b38e48995b023187"
+SRCREV_meta ?= "9901a21dd1f99c833d8e1a58b3fc057e57bda598"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index b0e4ab71ae..1c8cfd7d74 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "e402da9835bfae267f409a48c3a2cb6e231f9d94"
-SRCREV_meta ?= "e55e4407942bae43ef8ba463b38e48995b023187"
+SRCREV_meta ?= "9901a21dd1f99c833d8e1a58b3fc057e57bda598"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 5688a4b109..948f46621b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -32,7 +32,7 @@ SRCREV_machine:qemux86 ?= "e402da9835bfae267f409a48c3a2cb6e231f9d94"
 SRCREV_machine:qemux86-64 ?= "e402da9835bfae267f409a48c3a2cb6e231f9d94"
 SRCREV_machine:qemumips64 ?= "97d2336ea9ce4eac6b30a75b26f33b83827d38aa"
 SRCREV_machine ?= "e402da9835bfae267f409a48c3a2cb6e231f9d94"
-SRCREV_meta ?= "e55e4407942bae43ef8ba463b38e48995b023187"
+SRCREV_meta ?= "9901a21dd1f99c833d8e1a58b3fc057e57bda598"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


