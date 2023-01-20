Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 006FEC05027
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:11:40 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.82166.1674238294940872625
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:11:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=z5wSHWsl;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id s3so4558199pfd.12
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jPqhW3uImt4Ba8Os84yacJdGrkkubgI0PrgHvwKD2ik=;
        b=z5wSHWslH+I59bc8a+NbJbe4yz7NL8impGu9QayVvmNi3XVOupCZ+wcIqu5wMjv7Qy
         F5saqWFrxMGQ/2qJXA22bpV7biszOeoS6lpZICGa7u1M+rLJlP+hSMRjic8d1g7qEjvU
         0eYOeyq+X8U7FAtcvrOLgVXbdHiMBJX2bFjk6M++8HIydIbH1vbf6/NEp0G3IK/FbwKy
         /QyfWsci8lXjpZtXIMXUta9TI2eUtHn8queBWIGMkrFbbe8YAdC2U3Y8YNiwBOfatoQ9
         s0abse7eOubS3ysOPcfHzXQkq/g9luIzqseeg0HGSp/DPAYkZqt0oqDEHHZToDN58sEF
         4P7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jPqhW3uImt4Ba8Os84yacJdGrkkubgI0PrgHvwKD2ik=;
        b=oy8BDcfM4ltfyLOINn4F+BVSuCxOWe0GnuknT8yHn3Y21AWqTfUkYBHJjGLyYjPzsF
         OWZNaLqY/nLN5QNViITSdAYszFwbRdunLd9CM14511mEJU05JU1ciZVKPwxkCCgmlC7m
         +BV63me4Gec2b4vQEONVdMSSvMXS7jW5vC/G7VGhLarB/Yuo5zI4M/nq6O4mSfwhT5Qe
         2far0/bKBAPqUaFay8KSkIukxcUDvQUm1xHWzoFMoq5Ek9uN2jFqiZOQxSJFIL/Ax+Mn
         v8svhJGfhCFE8WY0J3k+9Q8n0sUka802NGNtt3Qgd/WykIMdQZ2VV00gZpynrXzYEgSD
         FCsQ==
X-Gm-Message-State: AFqh2kpJsHhCxxGy0UYisqNmxfBNzgvX0qT9oBiiXnl5G/5aslRjOtjN
	SH325T6S6ww9XT64szi/ALQrL4uT5SPAX4eed9A=
X-Google-Smtp-Source: AMrXdXv2AAygGFnzJoPMbKspu01wcAl/C2wEm4Qqen+g+ou8MsGUZrlvMGOJCRH6V7GyM+6do8869A==
X-Received: by 2002:aa7:880b:0:b0:58d:abd5:504a with SMTP id c11-20020aa7880b000000b0058dabd5504amr14815010pfo.31.1674238294000;
        Fri, 20 Jan 2023 10:11:34 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i128-20020a626d86000000b0058db8f8bce8sm8990396pfc.166.2023.01.20.10.11.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:11:33 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 16/41] linux-yocto/5.15: powerpc: Fix reschedule bug in KUAP-unlocked user copy
Date: Fri, 20 Jan 2023 08:10:33 -1000
Message-Id: <665855d33fd179e6890173b936673b414df9847f.1674238148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674238148.git.steve@sakoman.com>
References: <cover.1674238148.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:11:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176222

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    f100c753aa1f powerpc: Fix reschedule bug in KUAP-unlocked user copy

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b457e6976e9e64a737517f9d9142ab290cdce214)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.15.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 22 +++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index dd9f940c7c..122fc0feac 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6a972b54f014ca67588d73f32058c42af0bd856e"
-SRCREV_meta ?= "72756ee16d7230f04fb6bbf0bb115e32a9d73d8d"
+SRCREV_machine ?= "e53e73b907707b92b3433de7c9c776aa504b2d0b"
+SRCREV_meta ?= "e77e5259a3d11efe417b164a0f3341c07ba2bc46"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 8aa2ee14f2..f060e22e84 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "6e85c80a960287ec238f53c91eeade3456044fa3"
-SRCREV_meta ?= "72756ee16d7230f04fb6bbf0bb115e32a9d73d8d"
+SRCREV_machine ?= "ae2415ee19511e205a983bc8024700c1f794076a"
+SRCREV_meta ?= "e77e5259a3d11efe417b164a0f3341c07ba2bc46"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index f28dae716b..bb48e158ab 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "24c30a8e9f8385f6d74785aa345f5731321b6c41"
-SRCREV_machine:qemuarm64 ?= "c3caed57192735dc74adff939ea35af248a11177"
-SRCREV_machine:qemumips ?= "3bed92886dc9177ce0076dada5056cbe83ec11f0"
-SRCREV_machine:qemuppc ?= "45cbeb05d362ee51b7836a7faa07958670110c38"
-SRCREV_machine:qemuriscv64 ?= "da5513f301871b972d5bc6fab284d3cb277e0a28"
-SRCREV_machine:qemuriscv32 ?= "da5513f301871b972d5bc6fab284d3cb277e0a28"
-SRCREV_machine:qemux86 ?= "da5513f301871b972d5bc6fab284d3cb277e0a28"
-SRCREV_machine:qemux86-64 ?= "da5513f301871b972d5bc6fab284d3cb277e0a28"
-SRCREV_machine:qemumips64 ?= "2642cdd862a63f5a8c2774f372f3d3424991b1b9"
-SRCREV_machine ?= "da5513f301871b972d5bc6fab284d3cb277e0a28"
-SRCREV_meta ?= "72756ee16d7230f04fb6bbf0bb115e32a9d73d8d"
+SRCREV_machine:qemuarm ?= "8c0f02ba7db6a463ca3aef969441906706edb350"
+SRCREV_machine:qemuarm64 ?= "42a14881ba8145b2d1bdfc019c603abe79aeafd4"
+SRCREV_machine:qemumips ?= "1ea321a5c9c66edba818ddffcef2aa9910de552e"
+SRCREV_machine:qemuppc ?= "14da484e7f2fc95e10abb4db96bc5fd6b444cb60"
+SRCREV_machine:qemuriscv64 ?= "f100c753aa1f9638bfd476da0498b09fdee569d6"
+SRCREV_machine:qemuriscv32 ?= "f100c753aa1f9638bfd476da0498b09fdee569d6"
+SRCREV_machine:qemux86 ?= "f100c753aa1f9638bfd476da0498b09fdee569d6"
+SRCREV_machine:qemux86-64 ?= "f100c753aa1f9638bfd476da0498b09fdee569d6"
+SRCREV_machine:qemumips64 ?= "8db5fd5c032f44486ef52f34724d0452aa3a6fea"
+SRCREV_machine ?= "f100c753aa1f9638bfd476da0498b09fdee569d6"
+SRCREV_meta ?= "e77e5259a3d11efe417b164a0f3341c07ba2bc46"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.25.1


