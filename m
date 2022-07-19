Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73508C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 03:45:06 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web09.36566.1658202300343770994
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 20:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IjM7yixc;
 spf=pass (domain: gmail.com, ip: 209.85.219.51,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id r12so10295807qvm.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 20:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ESMy4R4wUkJyltUUyT0EQZneAfgwCOJ4k5Ci5/E3EvM=;
        b=IjM7yixc9UyL0DVxx1Rt43aWKPRTpN9N8KbMUtmLvWf81pcLW0XGV7CDtFMB7gXN1V
         xvJ1jZgj/pZmNjPbEw5dhwdfMiN0NdRuxb4tfRqL8WXaM6DzwM6+hnnl8BoTX19stbdi
         Dzp/2a56t3w5NV5yxa4/2TOVIacDwKThT+I3+4CKODd0Fi9E10WwUlax0L0tajKJ4qo9
         CvsK3C5c+J75Oc13Oslo3Lfl5cuZf5rhYwVATO+BMRIWJXAeqtwI39mKdSwZl6m6fgyU
         Zzt1XFIwKHE/z4dHsg5MI3DDdyYd6NsTjp/F5iH5zIZmbQzHS0C65oz+K9L59/Wly7MQ
         T0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ESMy4R4wUkJyltUUyT0EQZneAfgwCOJ4k5Ci5/E3EvM=;
        b=baHrC7YnTptnFBoAXHeSxRPP3DXb4mZGc/7vgQaEvAAfSwRMktJvEw59N/II5LEkuX
         qykTfIvbgCg6wxHzbxn6qvP8QBYmjyVKQCc23Em4Utk6Tb8NsG+OsS4O6dLHCfAlvfBm
         AkynOLF5h705yFgdspYSPhnaZtQtmrt82cN7gxnv81+Xm+kdUiVwS1+oIzI2obsdUpSI
         Ry1C9tvLEARxWrenGE+w6ZEEHLqIGsYtFrskG3iJOW8pjupSUJXKOZUXNHXaVTmt+fsV
         8UDWU2t9XJYsa+c3yP1Wva1/nXYLynbhDdfOEPL3ouGtiVVQZkO5DeJj8dnNmiCiZpXM
         AFoA==
X-Gm-Message-State: AJIora/ByK80Q8cSyvow/e0oBBQdsBXcfceYlQ1v/rbTcTWSxKfcGLXd
	oswK0G32msTjCzOBrzYY04A=
X-Google-Smtp-Source: 
 AGRyM1vUOTD4OgqhAaUak13C1jhUvqT4XniwBpStRXoel96RcyIr52HfjU2M4/gaweEO3Y57ovvcFQ==
X-Received: by 2002:a05:6214:e4f:b0:473:202:3fca with SMTP id
 o15-20020a0562140e4f00b0047302023fcamr23284583qvc.39.1658202299350;
        Mon, 18 Jul 2022 20:44:59 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 n24-20020ac86758000000b0031ed8ef7982sm8354531qtp.22.2022.07.18.20.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 20:44:58 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: steve@sakoman.com,
	openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell] linux-yocto-rt/5.4: fixup -rt build breakage
Date: Mon, 18 Jul 2022 23:44:56 -0400
Message-Id: <20220719034456.2312-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Jul 2022 03:45:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168268

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.4:

    cc478e363cc3 rt: fixup random and irq/manage merge issues

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
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
2.19.1


