Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF20C3065A
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 17:56:28 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.2686.1719597385407026677
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jun 2024 10:56:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ferFugqT;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4450187d3d4so6833891cf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Jun 2024 10:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719597384; x=1720202184; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LfDB0ORHN6Q0YsKpp19WDBTsJtzGBmOOzLulZomikMM=;
        b=ferFugqT9kGKPKJS+hD9KEnyA/jSKl6o8xXby4v+idK5u7yifC//a1QR4OETKUMtNH
         IUqv7PwQqI1lE8uGPxVRi1p2mJItjL7/R82EZpbA1gxpEPPluibZv+Ntohcawyu4GTYt
         DrXGBMxmDxNWBdR44lw4xQKEEw/ifV8Eejz7puTnavvZl/sIJoAiRIBXrTyIKa1aNPDz
         ggY2FoJbX0YPa4O5M+SZxdcX7H0U8WXaDSa+P1VM/RxPwGZ69TnAOm3ycRyBwIxA9bEi
         bT82fO3Y5S4DizKLDnBX0FUPsGFq1NjRgvvrCj15MDrdENkc/QyG27t7Vl8zMgT58C8z
         ZWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719597384; x=1720202184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LfDB0ORHN6Q0YsKpp19WDBTsJtzGBmOOzLulZomikMM=;
        b=MWRGKG92ddHQzifRliMu3++jFKq9EhrvfYBpC4ecCpBUHB+sxwhbkeznShE4MAjl/u
         nTtGY9TurbTuklloQ7x2V2syIV83MfB89+6svtg22ta6+t0sW82IMAL1L9C9OI20KbV6
         qqjSs2RQQ67aYBaEm8b3c7dWEaPKr9QN20TtW46ktUHkCMkfv5CwC2CpxB61hmd2dt6g
         u0pDDeZZhkJctuaeyfPEEo0CZlvzWqEON7VktKOJwHFSVOOKdi8vE0lrdazh3f0K1P7K
         nFbuAoYzxWZ2FKAptm7jo1TRWz4dUBMbC12CfqAzxA3FJLM4hjLOLqJI2RZ3la/gJY5h
         7hFA==
X-Gm-Message-State: AOJu0YydTPOepCRjEkfoVD7GDeBytmc4e9FMlzEWtXKuHy+0Eq8NENFJ
	Z8Ui0+gUtM2uUdK69nzxEoZmJv1LBjgdhVdWydqtd6hyDboCX+mm
X-Google-Smtp-Source: AGHT+IEEfC1I/MB/UfnaNZ5M1r//5nsoNXQtGcB3MdGWD95Ttcsw8X4HaGyVWvyxYnDrU0qMj9/N6w==
X-Received: by 2002:ad4:58e3:0:b0:6b0:8534:ba47 with SMTP id 6a1803df08f44-6b540ada8f1mr148482386d6.61.1719597384301;
        Fri, 28 Jun 2024 10:56:24 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b59e5746f5sm9781506d6.52.2024.06.28.10.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 10:56:23 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] linux-yocto/6.6: fix AMD boot trace
Date: Fri, 28 Jun 2024 13:56:15 -0400
Message-Id: <8a39f96cc44386a79e75a1e15d1c5fb6899a05e0.1719597265.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1719597265.git.bruce.ashfield@gmail.com>
References: <cover.1719597265.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jun 2024 17:56:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201228

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.6:

1/1 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: cpu/amd: inhibit SMP check for qemux86
    Date: Fri, 28 Jun 2024 12:55:18 -0400

    When booting with kvm enabled on a AMD host, the following
    trace is thrown:

      [    0.084519] ------------[ cut here ]------------
      [    0.084519] WARNING: This combination of AMD processors is not suitable for SMP.
      [    0.084519] WARNING: CPU: 1 PID: 0 at /arch/x86/kernel/cpu/amd.c:341 init_amd+0xaee/0xbcc
      [    0.084519] Modules linked in:
      [    0.084519] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 6.6.32-yocto-standard #1
      [    0.084519] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.3-0-ga6ed6b701f0a-prebuilt.qemu.org 04/01/2014

    This warning is not valid in our configuration and is unnecesarily
    causing issue with debug.

    This has been know for some time (10+ years), but no acceptable
    solutioon has been found upstream:

       https://lists.gnu.org/archive/html/qemu-devel/2010-03/msg01428.html
       https://lkml.org/lkml/2010/3/30/397

    We have a configuration CONFIG_QEMUX86 that has been added for
    situations like this. When that value is defined, we inhibit the
    warning, but leave it as-is for other BSPs.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  4 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 24 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 3900690c74..dc1413ca94 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,8 +14,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1d96726faac7f57c1bb3466edc283d929fc183b6"
-SRCREV_meta ?= "fe550a76832d3c144e7af34ab78d5da0dcf092ce"
+SRCREV_machine ?= "4209a548f26ad97f610f6c7acfee7fabe009dd3d"
+SRCREV_meta ?= "da275b53b13faafa834352e3f9dd3f91a2c03bb8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 0a9b96753c..f02a9c186a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "4c1fbbd1c2b7c31e1755cfa83199cdfcb9707832"
-SRCREV_meta ?= "fe550a76832d3c144e7af34ab78d5da0dcf092ce"
+SRCREV_machine ?= "f71bb11887bae80ab718b3f38f1c1e80c07676a3"
+SRCREV_meta ?= "da275b53b13faafa834352e3f9dd3f91a2c03bb8"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 8f1107d1ee..62c0f0ab36 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,18 +18,18 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "7e5d1df22352c96c1d63d81d59457ff30e82e2d9"
-SRCREV_machine:qemuarm64 ?= "4c1fbbd1c2b7c31e1755cfa83199cdfcb9707832"
-SRCREV_machine:qemuloongarch64 ?= "4c1fbbd1c2b7c31e1755cfa83199cdfcb9707832"
-SRCREV_machine:qemumips ?= "f26493dbcd22b4d89beed4eabdc52d124d59658a"
-SRCREV_machine:qemuppc ?= "4c1fbbd1c2b7c31e1755cfa83199cdfcb9707832"
-SRCREV_machine:qemuriscv64 ?= "4c1fbbd1c2b7c31e1755cfa83199cdfcb9707832"
-SRCREV_machine:qemuriscv32 ?= "4c1fbbd1c2b7c31e1755cfa83199cdfcb9707832"
-SRCREV_machine:qemux86 ?= "4c1fbbd1c2b7c31e1755cfa83199cdfcb9707832"
-SRCREV_machine:qemux86-64 ?= "4c1fbbd1c2b7c31e1755cfa83199cdfcb9707832"
-SRCREV_machine:qemumips64 ?= "1ef0c6554b95984a5fc9e7cd3bb27ab617204149"
-SRCREV_machine ?= "4c1fbbd1c2b7c31e1755cfa83199cdfcb9707832"
-SRCREV_meta ?= "fe550a76832d3c144e7af34ab78d5da0dcf092ce"
+SRCREV_machine:qemuarm ?= "7558103b801174f277373aa9d7d7eedf3a30d5f8"
+SRCREV_machine:qemuarm64 ?= "f71bb11887bae80ab718b3f38f1c1e80c07676a3"
+SRCREV_machine:qemuloongarch64 ?= "f71bb11887bae80ab718b3f38f1c1e80c07676a3"
+SRCREV_machine:qemumips ?= "cd21dc96adcb1d60ad6cc57446464abf4dd338fc"
+SRCREV_machine:qemuppc ?= "f71bb11887bae80ab718b3f38f1c1e80c07676a3"
+SRCREV_machine:qemuriscv64 ?= "f71bb11887bae80ab718b3f38f1c1e80c07676a3"
+SRCREV_machine:qemuriscv32 ?= "f71bb11887bae80ab718b3f38f1c1e80c07676a3"
+SRCREV_machine:qemux86 ?= "f71bb11887bae80ab718b3f38f1c1e80c07676a3"
+SRCREV_machine:qemux86-64 ?= "f71bb11887bae80ab718b3f38f1c1e80c07676a3"
+SRCREV_machine:qemumips64 ?= "6700dad2e55f71fea268db201a394b371ffdd78c"
+SRCREV_machine ?= "f71bb11887bae80ab718b3f38f1c1e80c07676a3"
+SRCREV_meta ?= "da275b53b13faafa834352e3f9dd3f91a2c03bb8"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


