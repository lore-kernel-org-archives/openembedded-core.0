Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 617A3C4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 14:28:32 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.2849.1702391304264781201
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 06:28:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OMDY5aZC;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6cef5220d07so1621756b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 06:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702391303; x=1702996103; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=grAD8YI51gyoY3my5f5YiBseM587FXZuEPZe1z3+J8o=;
        b=OMDY5aZCvoRpXHC5XaBU/ZPvsXziionOvdcKyjZ9/SPAjBDFimNZGRGkDfW+wbCdpC
         8FmBuBnvl/a2XMR7ud1jL9Mi5JvQkHwmmV0M4vGcgLNP7FCTLObkYJp5ZZ2HFOO3HPGU
         Ps4hyOTkIW3N5K/IrvylGokLm1/fJ9xkIpXiFz2eRzW8q1Plvkzvwr/I8abn66dteqZu
         ol2/QVOgb2cfS2eES+oVtgPdnhYqeEByGy89e9e5oCvaksWVHMmDrGaE6E122QcA9mrV
         HUGGsnqflLP/jLPPstlMe1i3x6wvIcbCddiE56GwVY+AbsA+1jaCxxBvpIQkVzJeG98W
         VoSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702391303; x=1702996103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=grAD8YI51gyoY3my5f5YiBseM587FXZuEPZe1z3+J8o=;
        b=OAkb2qLpNrZ3Y8E1GYUuNme0Tt/ujJjznncdDrfdJAZA3iyyGKGcfU7GKQzZLrE9XM
         YQOA8STTsem4uk97gGMPzLprFGjmBvL9FCwWTgdV54sAOeM3ogYO2Sj7TBN281sjb+xU
         P7cvfa/n9b/nUzLHTDXTKCOCWlU6OOZ20wG6v9z1qQ01vESqRcfpfWPPJ9GJ036dM4Wb
         OgEWi/7d6jEPcwKNWi3mowVViXs0NrMLAmHbv0U99l1+2c1rqFDgs5u69B+8mivhkkmA
         lSNU1AzHLmMpr5WKC0LDEZpnXcFJwVpJDu6UM6HYjvtc/CQoynU8D8Q3b5ZfqQTNy7cm
         uyTQ==
X-Gm-Message-State: AOJu0Yzz/zyHaCGl5R6Lm88cysqB2y0Fe41CpWw2IvI0VFOu07kU8Xut
	BMwo/k6P/X2oT2CrzL6a9PrQo4UjZeiCKylheGQ=
X-Google-Smtp-Source: AGHT+IGR7gfVlDlgdggQfXkKwzzZyAR/GmgaM29PjEjYpUNZuNae2gVeaejpjrtN44/9yqOnPCJiAA==
X-Received: by 2002:a05:6a00:1143:b0:6ce:3df6:89f7 with SMTP id b3-20020a056a00114300b006ce3df689f7mr3094241pfm.2.1702391302504;
        Tue, 12 Dec 2023 06:28:22 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n23-20020a056a000d5700b006cbb40669b1sm8188928pfv.23.2023.12.12.06.28.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 06:28:21 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 21/29] linux-yocto/6.5: cfg: split runtime and symbol debug
Date: Tue, 12 Dec 2023 04:27:27 -1000
Message-Id: <0bbd2a89f971efe2ef2d59e7f8919da2e52a7f2d.1702391115.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702391115.git.steve@sakoman.com>
References: <cover.1702391115.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:28:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192225

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: debug: move PREEMPT_DEBUG to a runtime debug fragment
    Date: Thu, 9 Nov 2023 12:08:31 -0500

    For tools like spdx and debuggers to work with the kernel, we
    require extra information. That is provided by the DEBUG_INFO
    flags.

    In that same fragment, some runtime debugging is being enabled
    and that adds signficant overhead to the kernel.

    Let's start a new runtime debug fragment with DEBUG_PREEMPT
    and locking. We can add more to this in the future.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8cd829de8e8770aa4a46e984f6ef2cab3194fd29)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.5.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
index f004339749..abe788f03d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "833c5da68398da64271c26188b9e15286e8e725c"
-SRCREV_meta ?= "e4aaaaddfaf695039a7fc41815e24f57c29e30c0"
+SRCREV_meta ?= "699ca25eafb4b8244966a27e3bbef3d5891fb7e8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.5;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
index cc75c0c702..ca1c17a84e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "16b52743d64980d531e120aec62c9220b695a269"
-SRCREV_meta ?= "e4aaaaddfaf695039a7fc41815e24f57c29e30c0"
+SRCREV_meta ?= "699ca25eafb4b8244966a27e3bbef3d5891fb7e8"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.5.bb b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
index 5cdf0e02d0..43ab8c2776 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "128116621dee1ddbc7cf5f58cddc708d7b823600"
 SRCREV_machine:qemux86-64 ?= "128116621dee1ddbc7cf5f58cddc708d7b823600"
 SRCREV_machine:qemumips64 ?= "b63329018323409369e952c84ac6481e68a9b6af"
 SRCREV_machine ?= "128116621dee1ddbc7cf5f58cddc708d7b823600"
-SRCREV_meta ?= "e4aaaaddfaf695039a7fc41815e24f57c29e30c0"
+SRCREV_meta ?= "699ca25eafb4b8244966a27e3bbef3d5891fb7e8"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


