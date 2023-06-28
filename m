Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94B88EB64D9
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 02:30:14 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web11.7381.1687919408681594430
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 19:30:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=OWxU+Ayg;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.52, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-56352146799so1830942eaf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 19:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687919407; x=1690511407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2mAl/LrLYhcULGwfUoE3uWRX/TeDfMuPbOJHJwOK62g=;
        b=OWxU+AyguHdsyTdSHG78x8gGZ3BNXHR/V1g9CfYjd91znP2tJ+98qvD8xoR8H5YO1m
         VqkSYMo7k6OO9rVic0wt5eQ/KE5l1cG1F7hjdIE3GpeKUePTDLd8QYRGNG0kbaWMoWyj
         emq2V5mK/7mqF0FCi6rAympa+ZGPisUcaMxoCBwzk1he36lwmjItMFce7u6o06FMvevG
         nzhZBD5kakmtOuBLgEj64990vcyBK8NBouuSiZcGA2bBl5l9XmklWuicaZR6+4reuCIY
         hvjyvcCuZHLB7/qr+ZqwcS7lKMVJnnl2VRTwq3Ga6XRlqfkfZae/ynzB1KIk34aEEjcJ
         Sf5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687919407; x=1690511407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2mAl/LrLYhcULGwfUoE3uWRX/TeDfMuPbOJHJwOK62g=;
        b=BAXYfG94949bxb0mIkPiDm/r76+F6XmSkCJy1qzgjGm8twPyqNafo2pNV/hoPGqRio
         SlZF4NHgT5M3GaTTX+V7GdreNTsJZGwPSIy9gkGM7VWqJrXGe9p3dp3wWbL1daDfHdE0
         PsTAY3ZAcQKMl20psQZxkuxSQTl9nwJ+wCWp63zxo6ceIP0rQVq8EI4gRhg9CQB5R4Zr
         JDh78WxI5VZ9c7Z5lUpzoDOdudWkuWcQWegHH0QfqsK8GVVDm5fNLcza3KRNEQ6TOh/J
         x9fA8MV/n4Qr/U+KqEZJyTFDsgwQJW2ZsR5UPch1WDPotVDpmK4Ezs0ujSqMsgH/aJrY
         h12A==
X-Gm-Message-State: AC+VfDwIEwz7ivaqf5ZJ4iFrOtF6X1Sb738FIkQEm5/QwFvJQ5G3cec9
	7dbY/+kD5Cua/Km+wuBBoiaBUcjrUfbTKm2iP5ZbbQ==
X-Google-Smtp-Source: ACHHUZ7iud5pgLk9VEqRD719uQ+JtJRPkpuPuIdoH1zpmPBt1zbgqKTtbWWbOYRhGoP9gvdTrzkOzg==
X-Received: by 2002:a05:6358:45d:b0:134:c7ef:406d with SMTP id 29-20020a056358045d00b00134c7ef406dmr4196197rwe.31.1687919407450;
        Tue, 27 Jun 2023 19:30:07 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c18-20020a62e812000000b0063d2d9990ecsm1568666pfi.87.2023.06.27.19.30.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 19:30:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 08/30] linux-yocto/5.15: cfg: fix DECNET configuration warning
Date: Tue, 27 Jun 2023 16:29:24 -1000
Message-Id: <06ef70ac1fa8201c5b46050e098ebea3b1423f9f.1687919241.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687919241.git.steve@sakoman.com>
References: <cover.1687919241.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 02:30:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183517

From: Bruce Ashfield <bruce.ashfield@gmail.com>

-stable merged the DECNET removal to 5.15, so we integrate
the following kernel-cache commit to fix the kernel configuration
audit warning:

    b647d9611cb base: drop CONFIG_DECNET

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index b16a2af875..6ca7873910 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "b2a7dbd4edac7627c091c2ab14fec83726a4c79b"
-SRCREV_meta ?= "a6e18bacddf8ebca0c151e809c9996e17e08a7b0"
+SRCREV_meta ?= "b647d9611cb4936536e60a438292fc22df2fe000"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 20ec58fb85..616cc47202 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -15,7 +15,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "b79e89ab973aeb8ec48e2cd987436ab52678e795"
-SRCREV_meta ?= "a6e18bacddf8ebca0c151e809c9996e17e08a7b0"
+SRCREV_meta ?= "b647d9611cb4936536e60a438292fc22df2fe000"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index c9dae7fa31..4ae03f1cb4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "079c88490578df99b38570c8968b836b8347ed44"
 SRCREV_machine:qemux86-64 ?= "079c88490578df99b38570c8968b836b8347ed44"
 SRCREV_machine:qemumips64 ?= "47d334232ab28f0f8d5316e07e11f8f14c6aaecc"
 SRCREV_machine ?= "079c88490578df99b38570c8968b836b8347ed44"
-SRCREV_meta ?= "a6e18bacddf8ebca0c151e809c9996e17e08a7b0"
+SRCREV_meta ?= "b647d9611cb4936536e60a438292fc22df2fe000"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


