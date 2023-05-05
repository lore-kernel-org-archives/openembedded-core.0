Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F47C7EE22
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 15:21:04 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.30352.1683300060037550414
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 08:21:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=RgkPaX2f;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-63b5ce4f069so2085002b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 08:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683300059; x=1685892059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8OFRUW91KtFj1+yJFF6N6RRyfwZm/i+oWj95EjxYjt4=;
        b=RgkPaX2f5ZOeAZeMQymNcNOhNWHOkuKXSBf88x+8QMkYn9g8aONKoWUiXqi/rnbEmX
         DSRQ7+1ZK9pqhzvQb9Gq7OKA8yfhf2r8mq8J+aOpl1ECjXlee8dAyumBOUKRGLYeE26k
         MFoZ19se9OsAYxHORTRnSa6LPOYFDKknWddCeUTYIlj7oyniV4dDeEJk4auCWI0TZiAO
         ub+6J2lXneHkd60DqWvXEeorlx1hBxr3fCOi8jhUsZoZqdFQGa7dqH0WxBffq135yUfB
         haYeh6a/mOmDfshMcZkTCU8+0FYGe9c3ZprRig2qWXtblTHfOvI2kX67mpih2YWnzReA
         aFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683300059; x=1685892059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8OFRUW91KtFj1+yJFF6N6RRyfwZm/i+oWj95EjxYjt4=;
        b=G4vNd7an+GrJKxwVqOHA+CVKr1nsrORwPSlrXuqJ7wZoybi3pBBTZwrVrPwvZ1GIuG
         HPf/1mxHcQzl1ApYu2XzWaQ/SkGkUGBenb3wSQui1jJ5K+zshs85iK0KRmyeDSBUlbjV
         HgjXm/vEnjQMGjtBXlPStnkKpwVyZacTtv63X5gkXxYlCrCTxU5W2q3DSQUeQsPNJTt0
         BhsrPb/4xIWQ4DTn98ldVEDzbHwWWAVxLkSR+nohNe0gh70jk5ZwFX6dX6u6JcjOi/b+
         alDM2/ViTS6Xg1U/BwsL2xmL8Rs5Vf3hL50bs/0I64USSbkLIHkOHGixbBhixFOQ2mxM
         YOqg==
X-Gm-Message-State: AC+VfDwaOTwbd75BMi2KeZLxkP5+0ZmKTSLXwcPvDf3F/DBNtP/bl2xP
	HwG/bGp0Z5G5VAsPYji6C3z4dSlyF5tFqnArLDw=
X-Google-Smtp-Source: ACHHUZ7YdMpGNB6TG/5irQDXmUfcphuyx5q59jKQ4AqBvzn/e5cwAgmY133Y6KrJB7nxb5Xe+3rXdw==
X-Received: by 2002:a05:6a21:348b:b0:f2:e4c1:af7a with SMTP id yo11-20020a056a21348b00b000f2e4c1af7amr2035392pzb.7.1683300059140;
        Fri, 05 May 2023 08:20:59 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b00643864d03dfsm1831591pfd.171.2023.05.05.08.20.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 08:20:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 28/35] kernel-devsrc: depend on python3-core instead of python3
Date: Fri,  5 May 2023 05:19:39 -1000
Message-Id: <81c5f793f5c326489475f1f8786e3869b9973a4b.1683299764.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683299764.git.steve@sakoman.com>
References: <cover.1683299764.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 15:21:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180948

From: "bkylerussell@gmail.com" <bkylerussell@gmail.com>

Avoids pulling in potential GPLv3 packages through python3-misc catch-all.

python3-core is the intended minimal RDEPENDS for packages requiring python3
support.  Other python3 module dependencies should be listed explicitly.

Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 231f93becad619f6afa383f9b1132f1d4b02fa64)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index b4ea5f756a..6764598d48 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -377,7 +377,7 @@ do_install[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
 FILES:${PN} = "${KERNEL_BUILD_ROOT} ${KERNEL_SRC_PATH}"
 FILES:${PN}-dbg += "${KERNEL_BUILD_ROOT}*/build/scripts/*/.debug/*"
 
-RDEPENDS:${PN} = "bc python3 flex bison ${TCLIBC}-utils"
+RDEPENDS:${PN} = "bc python3-core flex bison ${TCLIBC}-utils"
 # 4.15+ needs these next two RDEPENDS
 RDEPENDS:${PN} += "openssl-dev util-linux"
 # and x86 needs a bit more for 4.15+
-- 
2.34.1


