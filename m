Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C8BCC7618D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:02:10 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.8801.1678888920412416348
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:02:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=2rbR3Dfi;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id u5so20112337plq.7
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 07:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678888919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQ6WD8utfCpNhh7V2cPUHUWLcXepuRvI3z7SWELP4MQ=;
        b=2rbR3Dfi651M+2059xCV0SdUTGPW8x8Gc31w4GmMX6lrQh958NjUFQ46IuVkczIqfl
         IHMqxUg3jKND3XVwdH6aWIU1pH5Mu+KRoIa9Svja9plgFREz9OgC1REgv5uSkxUSrVVN
         krqvRg4wpHMb+BsR1W8ajEvlUGSbt0C1Ja1IzFnwFIU5Ac3fpTKUKRGOX8S/Wja86Szb
         eYm2hljfyd1+HpyESfcxjO/X75HsAUbYyPxl88CYxa92vQj/tUEZvBidiGTW+aapu+4D
         +0MuDdaPzUPl3bPbkMSyfySdzNsQfwJfFF6MtFqPQ/XSThyUpszy3eNY35pzWAnayOHr
         yo5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678888919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GQ6WD8utfCpNhh7V2cPUHUWLcXepuRvI3z7SWELP4MQ=;
        b=l/KTYl74LWoPP61hW9m0wXZzgd2ZvzVs/Ek3APmqCia4HYr0Lk76aCYtEyLZzIqr/N
         UzZiPd8Z+36vsv1D9UCYS/W0oWuwWc2vtaH9VpaUmuhkUj1KpMBeEwsJ1RrMng9DCdRe
         ACVkFKuTLw5HUIGUxcbGq7kqO5/Z99lngTDNCPisf1ZK17IX84xEAenwhvSmU0J/bF5C
         1u93odSB45FbSZER/ENLpbOYLxS4X9ruwjbxjoKPcPxPq2rVI5HfmVGD7dTkzSMYv034
         fymmi1uwLmAXzPDLsPpVVYj9i5f+fcCN9msYHJq0QTFO453RWclbz0gKeRzKiigHBIxc
         AsTg==
X-Gm-Message-State: AO0yUKVRlOaX5cKnYS3Hqh973SWmSecR7tZa8E7nbNnGMTHHnNCfVH43
	jdNlXAdg6foEVRF//0niPfdw9A9pi1X06RRNcT8=
X-Google-Smtp-Source: AK7set/d5Okz+HZoPQI2/CxU5C/LIwi8kSNlwys9TTlOWNRWzAbSaLgXSTUkGDpxGb7PRbeC1w/oTA==
X-Received: by 2002:a17:903:42c4:b0:1a1:6584:31b0 with SMTP id jy4-20020a17090342c400b001a1658431b0mr1907812plb.30.1678888919438;
        Wed, 15 Mar 2023 07:01:59 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902f54600b001a0432ca99csm3663755plf.269.2023.03.15.07.01.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 07:01:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/22] linux: inherit pkgconfig in kernel.bbclass
Date: Wed, 15 Mar 2023 04:01:11 -1000
Message-Id: <e09c50e01d0f5cf45b9622ab0ed33df12bdeb7ee.1678888649.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678888649.git.steve@sakoman.com>
References: <cover.1678888649.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 14:02:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178571

From: Ming Liu <liu.ming50@gmail.com>

pkgconfig is being required to find dependencies for building kernel
native tools, move "inherit pkgconfig" to kernel.bbclass so BSP kernel
recipes can also benefit from it.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 8a84bd98e3fbc16c782f83064801e469d086911e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel.bbclass                  | 2 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 --
 meta/recipes-kernel/linux/linux-yocto.inc    | 1 -
 3 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index df740af41d..b315737fd2 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -654,7 +654,7 @@ do_savedefconfig() {
 do_savedefconfig[nostamp] = "1"
 addtask savedefconfig after do_configure
 
-inherit cml1
+inherit cml1 pkgconfig
 
 # Need LD, HOSTLDFLAGS and more for config operations
 KCONFIG_CONFIG_COMMAND:append = " ${EXTRA_OEMAKE}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 403993486b..94800aeaca 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -10,8 +10,6 @@
 
 inherit kernel
 require recipes-kernel/linux/linux-yocto.inc
-# for ncurses tests
-inherit pkgconfig
 
 # provide this .inc to set specific revisions
 include recipes-kernel/linux/linux-yocto-dev-revisions.inc
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 7ea661e138..1f8289b6b6 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -46,7 +46,6 @@ LINUX_VERSION_EXTENSION ??= "-yocto-${LINUX_KERNEL_TYPE}"
 # Pick up shared functions
 inherit kernel
 inherit kernel-yocto
-inherit pkgconfig
 
 B = "${WORKDIR}/linux-${PACKAGE_ARCH}-${LINUX_KERNEL_TYPE}-build"
 
-- 
2.34.1


