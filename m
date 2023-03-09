Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B351C64EC4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 22:59:05 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.5706.1678402736083822686
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 14:58:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=vy8hkVU6;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id h8so3659458plf.10
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 14:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678402735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZzAWpMUA3CGerh4whPrsDsSWeSNQmO25gdQX0Qm1VPE=;
        b=vy8hkVU6n5KJsq6g0I+kBQ0Ak/WFEL+14uzgTFwBM56o3L8DCyY3NPu7hNefhQ16BO
         qrmAT17E0nJOEdngt0XH1O1rS66yqy8hqTLf9Xa4pTKmT3/d/0ZVkRVmYVe6V4UFntO+
         1Y2vlKOQaaeLfWkqdbeYOA1d64J4SkWxHlpqJNYIfiRL+IefWFtCawMD4DVOQ0mtXIyy
         ewyUhNf2UAOvP6sDRlBnzlIdefcNeet/0Hho3JPocDMKzJ/rr3wNioAEz90p69OL8ESW
         cidZDGkJZMN5SGKOn7jBWkegeTx/dhrK1g4gHhlsoI3mp4Rx4KG6qUD7GtbXTq5MI2xJ
         Cp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678402735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZzAWpMUA3CGerh4whPrsDsSWeSNQmO25gdQX0Qm1VPE=;
        b=guSZigLazBRXIADuwtlHgukygS3vY8+wq0kbkh9HES5ntIMFuFsl34La1BsMVGcSud
         UFojDnez9ytGh6BCSdB6ynsGhgLWycApyeLdc+QdQyCZ3QEOojWLTwqVbccxpMMLMNWz
         wECvQOdccsYiTrBbey0EP7S4p3jNVM333NAicl+XVeXKOdb/ikvhSL6Y0pCpihDNSMEr
         O9xjpvY6Z/TXehtM350iccoAEQDoVqdj3SobnY8wA40OuepyP8Vvg+oAfTE44xvLMnFY
         p6qXYFkyt3nYFiK7T5hslphITRLwh01RpOEExl4VIHeb+3ffnXixEZrCCw6Xf9BJscCx
         H3iw==
X-Gm-Message-State: AO0yUKU4NVr0oAXD8vtBS2XpJJesNrIOWh+PDqs2xB469+bFJOrulNR1
	9qdbMqxUWNzq0Xxq59ukqXHWZTs59QC1DO9iQxI=
X-Google-Smtp-Source: AK7set9MbvIITJfF4+WuzJDyMByxZwvQVtv6XxIssDh98GlZboWp7S9K9sHS/9AFtsNbe2kYLCjx+Q==
X-Received: by 2002:a05:6a20:c105:b0:cc:47ae:18dd with SMTP id bh5-20020a056a20c10500b000cc47ae18ddmr19337208pzb.42.1678402735174;
        Thu, 09 Mar 2023 14:58:55 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id j9-20020aa79289000000b0058db8f8bce8sm89717pfa.166.2023.03.09.14.58.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 14:58:54 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 24/27] linux: inherit pkgconfig in kernel.bbclass
Date: Thu,  9 Mar 2023 12:57:59 -1000
Message-Id: <cccc340297f9afcd7a30bcd21658d28b4e442904.1678401759.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678401759.git.steve@sakoman.com>
References: <cover.1678401759.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 22:59:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178297

From: Ming Liu <liu.ming50@gmail.com>

pkgconfig is being required to find dependencies for building kernel
native tools, move "inherit pkgconfig" to kernel.bbclass so BSP kernel
recipes can also benefit from it.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 8a84bd98e3fbc16c782f83064801e469d086911e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/kernel.bbclass           | 2 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 --
 meta/recipes-kernel/linux/linux-yocto.inc    | 1 -
 3 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 274d748d99..01f866f0a6 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -660,7 +660,7 @@ do_savedefconfig() {
 do_savedefconfig[nostamp] = "1"
 addtask savedefconfig after do_configure
 
-inherit cml1
+inherit cml1 pkgconfig
 
 # Need LD, HOSTLDFLAGS and more for config operations
 KCONFIG_CONFIG_COMMAND:append = " ${EXTRA_OEMAKE}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index b1b57beac3..f01931ddec 100644
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
index 091003ed82..9bca0e7124 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -47,7 +47,6 @@ LINUX_VERSION_EXTENSION ??= "-yocto-${LINUX_KERNEL_TYPE}"
 # Pick up shared functions
 inherit kernel
 inherit kernel-yocto
-inherit pkgconfig
 
 B = "${WORKDIR}/linux-${PACKAGE_ARCH}-${LINUX_KERNEL_TYPE}-build"
 
-- 
2.34.1


