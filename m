Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4402CCF6498
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 01:57:56 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.45586.1727661467422839689
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Sep 2024 18:57:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WZKBkSgx;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2e06acff261so2804045a91.2
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 18:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727661466; x=1728266266; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kOWFl34G3HUOlY6iWF0tT8EWoWiKyYSQIATCEQPMDpk=;
        b=WZKBkSgxjwAtG5FZTE8AxxCC2f9vFIZO4aolkms3jQWT0ed98oXLCQkgsLrDrdyock
         YQD3Va387wft6LeM5sWGAT2+Nv8O0ZmzjwyqnEwbqYOhOMCF0k4jvl0lp6PN3T2a/idY
         V31TD2UCAhtyvVKfOqRU00vIfro89c3doi3wCnyFz9pFvObhqpo6NWWWoz18ew3/a4jd
         eEGiFPT5Z3VEOPsaKPW5NUE45plzpiguEgd+qE/qht5ueMKSfuz539necAzbrLgufvVZ
         WzKu6RFkqX3PEOiJgjKY4klD1z3JVkjW3vsd/LpRD47xlLPaaQqWr07sOtV3zYw+hknR
         NnDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727661466; x=1728266266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kOWFl34G3HUOlY6iWF0tT8EWoWiKyYSQIATCEQPMDpk=;
        b=FSHNYeyoZs+DoQqR9nQxnTcH+eqYgoL/Ks8mqPCM1aBGIuEjJMjDbX+wcd6+c5oAe0
         nPRfjUxS/kY1tc2UqdLZZmpmdGiHW4YemCBXxq3rUQbj5zO/7g26hOtoKfQ+l2ztCoeT
         vjq+4u/cEeilR++XMqrLEMZGtYUtaWpN/Bk9XVmlnIpojk5bNI5AcGzck1eHMxEWyZ2v
         3ayWgp0cItHIN8/FmEntKp74eny7m8Zw9QsPghUsdO6VH/s8KRR+OzfloguLg07MffN8
         CbQfQs8F029XfvkP1D71Hv48Q2Te12mzrnbt10mw3O0EOiFBuGdkHkc1K2z7hW/7gz2o
         /zJA==
X-Gm-Message-State: AOJu0YwgtJxSYNSALJUW2wNfBFhDYQ5FQsTYQnjTeGZAWXfsZeaqD2km
	oFyniv/vAcLKQqReyr00bk/k6UDA9W+5GHrGvdSRvkLjqkY+leKS7uLKAZMVwimDXRdOvZaiAzC
	2OdM=
X-Google-Smtp-Source: AGHT+IGZjol0GgcsZZvh6VjEnhxMOnRDj/VcrrOAdTI8Am74NZIWKq6VfJZFRYQePfvHXbYNL+GRRg==
X-Received: by 2002:a17:90a:ba96:b0:2e0:d1fb:9b2 with SMTP id 98e67ed59e1d1-2e0d1fb110amr10090851a91.33.1727661466476;
        Sun, 29 Sep 2024 18:57:46 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0d4af744bsm5496070a91.23.2024.09.29.18.57.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 18:57:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/27] linux-yocto/6.6: fix genericarm64 config warning
Date: Sun, 29 Sep 2024 18:57:05 -0700
Message-Id: <a52167cfd29cec1f7604d3cfc0b369eeb51c81fd.1727661284.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727661284.git.steve@sakoman.com>
References: <cover.1727661284.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 01:57:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205072

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3809e8255e65c0013bf2012559b825be6c1221d0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
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
index d8f67c3518..83b7066b90 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "e402da9835bfae267f409a48c3a2cb6e231f9d94"
 SRCREV_machine:qemux86-64 ?= "e402da9835bfae267f409a48c3a2cb6e231f9d94"
 SRCREV_machine:qemumips64 ?= "97d2336ea9ce4eac6b30a75b26f33b83827d38aa"
 SRCREV_machine ?= "e402da9835bfae267f409a48c3a2cb6e231f9d94"
-SRCREV_meta ?= "e55e4407942bae43ef8ba463b38e48995b023187"
+SRCREV_meta ?= "9901a21dd1f99c833d8e1a58b3fc057e57bda598"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


