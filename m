Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92394E95A78
	for <webhook@archiver.kernel.org>; Sat,  7 Oct 2023 22:25:42 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.27930.1696717539579150183
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Oct 2023 15:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=R4gN6f3P;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1c8a6aa0cd1so579855ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 15:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696717538; x=1697322338; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+qdN3klKcd9Xnv4Twv+vGFPZ1nc/3HlMhvDlDeqIXzc=;
        b=R4gN6f3P0MvSfdoGdw11hs9GPjrcgswsCnmHNdYRWpMOQn8WS+s2Ry7aoGPwLXMAM9
         vfgBOn6lI7R0g7eD6ARW0KND+75AnUGyRenKNwMkzsTcBDnYErswtbE4PwNsfLzff/YW
         j4i+81HnCcRyBMTEanv6N3n39Bv/TjU5e5XEtG/2XZSy93x4jdu7ROlhpGyKzhHT4Evx
         eTXCugj96arwUSAP5HGtiLYdYZ3ChvFVvYwzewZKXmaTjvOx1XEgBtgohoWxSqIcitqy
         oBTOfOY1qfSNl1EcYjdK8JaezWhs+hVr7QN/WoZvPRBCE1Hw7EP0sV7vkY03Pi3lkDza
         KUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696717538; x=1697322338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+qdN3klKcd9Xnv4Twv+vGFPZ1nc/3HlMhvDlDeqIXzc=;
        b=c9NgbPtHSRDmkLaVwQsm3hTRQ030/SjryoKV9Zg8NlvzGFnh4+A0dB76MWz/IiqSJM
         QabjrUK3507BDbtK1uPnaqE9owu7jQoNP3DZn+sCVmv801rWppmyaHm05ZoBxsHvvpBG
         qdGA/T84rwzl5q+4B3hcf6dA/o1WjHb2knokYcQt7pB9cH9SkqjjXwraolXrObXlESVr
         h3UpuxzZlTsGL9XVFEAArK7xxsoQFZh2noMYCGj3E6lO+AKLWt7QbKFhHB+uXVVOEA/h
         G1q69zb8/XgfOFszKpymFGrpS4Z5x5X1mKGlTq6a22LaefVKK/lpMVflclJE4l//Kx5j
         M/PA==
X-Gm-Message-State: AOJu0Yyh31oUkGYIjU3ZqFSOqljf/crDyakQdYZrlXd4U7zxdkzZh/Z3
	qZ3m/at3PNWAJRB8aIgvWfb8Y5bhsinWjh+v7v4=
X-Google-Smtp-Source: AGHT+IFsgb2/4Y/I05rkFZjXeqI2zzmkheRhIyyHOpT497dNAiF0JqhBWCTc5dRJVzGNOlW3nDIY/g==
X-Received: by 2002:a17:902:ec8d:b0:1c3:4210:623f with SMTP id x13-20020a170902ec8d00b001c34210623fmr13633096plg.13.1696717538571;
        Sat, 07 Oct 2023 15:25:38 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj15-20020a170903048f00b001b8c6890623sm6424076plb.7.2023.10.07.15.25.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 15:25:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 09/19] linux-yocto/6.1: fix CONFIG_F2FS_IO_TRACE configuration warning
Date: Sat,  7 Oct 2023 12:25:05 -1000
Message-Id: <77ab879e9d71a6fecdf4793b34a68950ffb3cbe2.1696702947.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696702947.git.steve@sakoman.com>
References: <cover.1696702947.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 22:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188810

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    70924d2512b features/f2fs: remove CONFIG_F2FS_IO_TRACE

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dabdc29e96e962e1b917bdcee2d38d654e28dab5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.1.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index d13722b32f..378e2482e3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "9d355978d3a95f5c190a21d95ebb2a5d0e638537"
-SRCREV_meta ?= "295d37e268bc02070da670e46456227bee38795b"
+SRCREV_meta ?= "70924d2512b8c20567fade72a22781b9bee3206c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index a77bd9d183..b1c433a345 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
-SRCREV_meta ?= "295d37e268bc02070da670e46456227bee38795b"
+SRCREV_meta ?= "70924d2512b8c20567fade72a22781b9bee3206c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index df477b7dee..d020b61c3f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -28,7 +28,7 @@ SRCREV_machine:qemux86 ?= "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
 SRCREV_machine:qemux86-64 ?= "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
 SRCREV_machine:qemumips64 ?= "296b096f4c747e4c4b31b1708fc8a0acb1dac04e"
 SRCREV_machine ?= "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
-SRCREV_meta ?= "295d37e268bc02070da670e46456227bee38795b"
+SRCREV_meta ?= "70924d2512b8c20567fade72a22781b9bee3206c"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


