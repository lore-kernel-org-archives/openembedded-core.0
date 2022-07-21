Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A24C433EF
	for <webhook@archiver.kernel.org>; Thu, 21 Jul 2022 21:38:51 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web09.1046.1658439523134211153
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jul 2022 14:38:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Wb0kpLoZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id h132so2807526pgc.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jul 2022 14:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zm1XK9G37Ck3T57/TbXZgPAy1E9pzwgsUprmKCoGPz0=;
        b=Wb0kpLoZEfr3Pnf5uwYzn+M2B4wmmxg3bwZAbfg1qhMbyMdSXNk1DvwQq/uYXyP/pT
         TTOjIqXlPwHjZWoGoWqc1O9uDpDgRw1gtQtVvwrp0kb/f2xrDiQL9YmBKv1JgC+Xrx8P
         3PyWfE+5DNnWpxw9MqIB8NpxDARIcPQa/888x459zBgLjPNeo7McCly0rnMgAFvZZNuk
         hubbLNfy35GfB4k/L6+rsu3Bbn5u7PDgjaMVG6cjvpnJ3+16yCO48wtpn1jj+RQiy+gT
         qr/GIJiSRzEH8h6JITfk9iZV5NH23GlVK9q9VuHRK0ty/j6BHRWqUeIvQdNgWUQnIAJl
         PAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zm1XK9G37Ck3T57/TbXZgPAy1E9pzwgsUprmKCoGPz0=;
        b=X5EiVU6EAa7Y8byEvHy9FcLr+ol8WCkTlx372O4w6L6lWdVsLRuPMjhRq5l2O+OuET
         2Egt645WNCJ9LXCr6TPpieJme0yoiInV64SQTU5hkpbGe1jcgKiIBDs1fTr3Zm+M8wDv
         79qlXR1qqUMMy8/5tJC1OQOb6j010EfUm4xvYMoQbrxj/7ry8VhpLdHlteoj8qD1nK2e
         Dt355OGTXfvmP9oe7MMIjvODh8Nwo+7qM7DBKtFh/qRWYLuXO7qioFt/oT0um8jb/flv
         kO9yeMgTMQGO7hMt4T6GmS5ABbtAzs2dFDpzVY2UsAMWcwtLHOTVY8hkP7EJHJDyDO6A
         Rpqw==
X-Gm-Message-State: AJIora9/AwVqQAP8mZndvX3bjWHB3jvBVLG8Z2vYgaizoD52MkGtrdGo
	0mM8JLzBNpm3cMM0MXdv/DTKLzpPc5XPgmYU
X-Google-Smtp-Source: 
 AGRyM1uTfg6d7WKZeRhMvgCT5E7o8kmP83pGfWEGSqzQJuRo8v0lbeBTLzcoD8cwdmOEp3tOh1nRaA==
X-Received: by 2002:a63:b443:0:b0:40c:fbf9:8366 with SMTP id
 n3-20020a63b443000000b0040cfbf98366mr348196pgu.308.1658439521504;
        Thu, 21 Jul 2022 14:38:41 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x184-20020a6263c1000000b005283f9e9b19sm2194275pfb.180.2022.07.21.14.38.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 14:38:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/4] linux-yocto-rt/5.4: fixup -rt build breakage
Date: Thu, 21 Jul 2022 11:38:19 -1000
Message-Id: 
 <597eef3b2f6cb884c474c44e87b1137e6acbe6b5.1658429064.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658429064.git.steve@sakoman.com>
References: <cover.1658429064.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Jul 2022 21:38:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168396

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.4:

    cc478e363cc3 rt: fixup random and irq/manage merge issues

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 5bc1993cf2..fe75aee4da 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "086bb7f7d2b47d654922e5cc526cc6274b28e319"
+SRCREV_machine ?= "cc478e363cc35064b58a871a4cc535aa973c5891"
 SRCREV_meta ?= "aaaf9f090dfb3160154b24fbc2f9a6e669babc87"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-- 
2.25.1


